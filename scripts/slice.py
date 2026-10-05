"""Slice oriented STLs and retain cumulative, revision-matched evidence."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import zipfile


ROOT = Path(__file__).resolve().parents[1]
SUPPORT_PARTS = {'habitat-front', 'habitat-back', 'habitat-left', 'habitat-right'}


def flatten(path, profiles, seen=()):
    if path in seen:
        raise ValueError('profile inheritance cycle')
    data = json.loads(path.read_text())
    parent = data.get('inherits')
    result = flatten(profiles[parent], profiles, seen + (path,)) if parent else {}
    result.update(data)
    result.pop('inherits', None)
    return result


def write_json(path, value):
    """Replace a report only after the complete JSON has been written."""
    with tempfile.NamedTemporaryFile(mode='w', encoding='utf-8', dir=path.parent, delete=False) as file:
        temporary = Path(file.name)
        json.dump(value, file, indent=2)
        file.write('\n')
    try:
        temporary.replace(path)
    finally:
        temporary.unlink(missing_ok=True)


def slice_part(stl, out, machine, process, filament, slicer):
    dest = out / stl.stem
    dest.mkdir(exist_ok=True)
    supports = stl.stem in SUPPORT_PARTS
    # A previous project's G-code must never make a failed/new run look valid.
    with tempfile.TemporaryDirectory(prefix=f'.{stl.stem}-', dir=out) as directory:
        temporary = Path(directory)
        if supports:
            settings = json.loads(process.read_text())
            settings.update(enable_support='1', support_type='normal(auto)',
                            support_on_build_plate_only='1', support_threshold_angle='45')
            process = temporary / 'process-with-supports.json'
            write_json(process, settings)
        profiles = {name: hashlib.sha256(path.read_bytes()).hexdigest()
                    for name, path in [('machine', machine), ('process', process), ('filament', filament)]}
        command = [slicer, '--load-settings', str(machine) + ';' + str(process),
                   '--load-filaments', str(filament), '--arrange', '1', '--orient', '0',
                   '--ensure-on-bed', '--slice', '0', '--export-3mf', 'sliced.3mf',
                   '--outputdir', str(temporary), str(stl)]
        log_path = temporary / 'slicer.log'
        with log_path.open('w') as log:
            try:
                result = subprocess.run(command, stdout=log, stderr=subprocess.STDOUT,
                                        env={**os.environ, 'APPIMAGE_EXTRACT_AND_RUN': '1'},
                                        cwd=temporary, timeout=600)
                code = result.returncode
            except (OSError, subprocess.TimeoutExpired) as error:
                code = -1
                log.write(f'\nSlicer failed: {type(error).__name__}\n')
        log_text = log_path.read_text(errors='replace')
        artifact = temporary / 'sliced.3mf'
        gcode_present = False
        if artifact.exists():
            try:
                with zipfile.ZipFile(artifact) as archive:
                    gcode_present = archive.testzip() is None and any(
                        info.filename.endswith('.gcode') and info.file_size > 0
                        for info in archive.infolist())
            except (OSError, zipfile.BadZipFile):
                pass
        evidence = dict(part=stl.stem, exit_code=code, gcode_present=gcode_present,
                        supports_enabled=supports,
                        stl_sha256=hashlib.sha256(stl.read_bytes()).hexdigest(),
                        profile_sha256=profiles,
                        warnings=[line for line in log_text.splitlines()
                                  if any(word in line.lower() for word in ['warn', 'error', 'floating', 'bridge'])])
        if code == 0 and gcode_present:
            evidence['project_sha256'] = hashlib.sha256(artifact.read_bytes()).hexdigest()
            for path in temporary.iterdir():
                if path.is_file():
                    path.replace(dest / path.name)
        else:
            # Retain the previous good project, but mark this attempt failed.
            shutil.copy2(log_path, dest / 'slicer.log')
        return evidence


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--profiles', type=Path, required=True, help='Bambu Studio resources/profiles/BBL')
    parser.add_argument('--slicer', default='bambu-studio')
    parser.add_argument('--candidate', type=Path, default=ROOT / 'candidate')
    parser.add_argument('--part', default='*', help='STL name/glob without .stl')
    parser.add_argument('--filament', default='Generic PETG', help='Exact Bambu filament profile name')
    parser.add_argument('--output', type=Path, help='Separate output directory; required for non-baseline filament')
    args = parser.parse_args(argv)
    if args.filament != 'Generic PETG' and args.output is None:
        parser.error('Use --output with a different filament to preserve the PETG candidate evidence.')
    root = args.candidate.resolve()
    stls = sorted((root / 'stl').glob(args.part + '.stl'))
    if not stls:
        parser.error(f'No matching STLs for {args.part!r}')
    profiles = {path.stem: path for path in args.profiles.rglob('*.json')}
    chosen = ['Bambu Lab P1S 0.4 nozzle', '0.20mm Standard @BBL X1C', args.filament]
    settings = {}
    for name in chosen:
        if name not in profiles:
            parser.error(f'Profile not found: {name}')
        data = flatten(profiles[name], profiles)
        if data['type'] == 'machine':
            data['nozzle_volume_type'] = data['default_nozzle_volume_type']
        if data['type'] == 'process':
            data.update(brim_type='outer_only', brim_width='5', enable_support='0',
                        wall_loops='4', sparse_infill_density='20%', curr_bed_type='Textured PEI Plate')
        settings[data['type']] = data
    out = (args.output or root / 'slicing').resolve()
    report_path = out / 'results.json'
    previous = json.loads(report_path.read_text()) if report_path.exists() else []
    results = {entry['part']: entry for entry in previous}
    for kind, data in settings.items():
        path = out / (kind + '.json')
        if previous and path.exists() and json.loads(path.read_text()) != data:
            parser.error(f'{kind} settings differ from existing slices; choose a fresh --output directory.')
    out.mkdir(parents=True, exist_ok=True)
    files = {}
    for kind, data in settings.items():
        files[kind] = out / (kind + '.json')
        write_json(files[kind], data)
    failed = False
    for stl in stls:
        evidence = slice_part(stl, out, files['machine'], files['process'], files['filament'], args.slicer)
        results[stl.stem] = evidence
        write_json(report_path, [results[name] for name in sorted(results)])
        okay = evidence['exit_code'] == 0 and evidence['gcode_present']
        print(stl.stem, 'sliced' if okay else 'FAILED', flush=True)
        failed |= not okay
    return 1 if failed else 0


if __name__ == '__main__':
    raise SystemExit(main())
