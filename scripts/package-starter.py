"""Validate the PLA starter projects and build (or check) their download ZIP."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import tempfile
import xml.etree.ElementTree as ET
import zipfile


ROOT = Path(__file__).resolve().parents[1]
DIRECTORY = ROOT / 'candidate/print-first'
BUNDLE_NAME = 'butterfly-habitat-PLA-starter'


def require(condition, message):
    if not condition:
        raise ValueError(message)


def inside(root, name):
    path = (root / name).resolve()
    require(path.is_relative_to(root.resolve()), f'Path escapes its source directory: {name}')
    return path


def sha(data):
    return hashlib.sha256(data).hexdigest()


def collect_files(directory=DIRECTORY, repo=ROOT):
    manifest = json.loads((directory / 'manifest.json').read_text())
    assembly = json.loads((repo / 'candidate/assembly/manifest.json').read_text())
    colors = json.loads((repo / 'inspector/colors.json').read_text())
    coupons = json.loads((repo / 'candidate/coupons/manifest.json').read_text())
    require(manifest['source_sha256'] == sha((repo / 'src/butterfly-habitat.py').read_bytes()),
            'Starter projects are stale relative to the CAD source.')
    require(manifest['source_sha256'] == assembly['source_sha256']
            and manifest['revision'] == assembly['revision']
            and manifest['mesh_mm'] == assembly['mesh_mm'], 'Candidate/starter revision mismatch.')
    require(len(manifest['jobs']) == 4, 'The starter pack must contain four projects.')
    files = {name: (directory / name).read_bytes() for name in
             ['README.md', 'manifest.json', 'layer-overview.png', 'mesh-independence.json']}
    for job in manifest['jobs']:
        name = job['project']
        require(name not in files, f'Duplicate project: {name}')
        project = inside(directory, name)
        payload = project.read_bytes()
        require(sha(payload) == job['project_sha256'], f'{name}: project checksum mismatch.')
        for source, expected in job['sources'].items():
            path = inside(repo, source)
            content = path.read_bytes()
            require(sha(content) == expected, f'{name}: stale source STL {source}.')
            part = coupons[path.stem]['source_part'] if path.parent.name == 'coupons' else path.stem.removeprefix('habitat-')
            require(colors[part] == job['color'], f'{name}: color differs from the design palette.')
            files[f'STL/{path.parent.name}/{path.name}'] = content
        with zipfile.ZipFile(project) as archive:
            require(archive.testzip() is None, f'{name}: corrupt 3MF.')
            settings = json.loads(archive.read('Metadata/project_settings.config'))
            expected = {'printer_settings_id': 'Bambu Lab P1S 0.4 nozzle',
                        'filament_type': ['PLA'], 'filament_settings_id': ['Generic PLA'],
                        'filament_colour': [job['color']], 'nozzle_diameter': ['0.4'],
                        'layer_height': '0.2', 'wall_loops': '4', 'sparse_infill_density': '20%',
                        'curr_bed_type': 'Textured PEI Plate', 'brim_type': 'outer_only', 'brim_width': '5',
                        'enable_support': '1' if job['supports'] else '0'}
            for key, value in expected.items():
                require(settings.get(key) == value, f'{name}: unexpected {key}.')
            require(job['material'] == 'Generic PLA', f'{name}: unexpected manifest material.')
            plate = json.loads(archive.read('Metadata/plate_1.json'))
            require(sorted(obj['name'] for obj in plate['bbox_objects']) == sorted(job['objects']),
                    f'{name}: object inventory mismatch.')
            require(sorted(Path(p).name for p in job['sources']) == sorted(job['objects']),
                    f'{name}: source inventory mismatch.')
            require(all(0 <= bound <= 256 for bound in plate['bbox_all']), f'{name}: plate bounds exceed bed.')
            require(all(abs(a - b) < .001 for a, b in zip(plate['bbox_all'], job['plate_bounds_including_brim'])),
                    f'{name}: plate bounds differ from the manifest.')
            gcode = archive.read('Metadata/plate_1.gcode')
            require(bool(gcode) and hashlib.md5(gcode).hexdigest() ==
                    archive.read('Metadata/plate_1.gcode.md5').decode().strip().lower(),
                    f'{name}: G-code checksum mismatch.')
            require((b'; FEATURE: Support' in gcode) == job['supports'], f'{name}: support paths mismatch.')
            if job['supports']:
                require(settings['support_on_build_plate_only'] == '1'
                        and settings['support_type'] == 'normal(auto)', f'{name}: unexpected support settings.')
            if 'corner-base.stl' in job['objects']:
                config = ET.fromstring(archive.read('Metadata/model_settings.config'))
                objects = [{m.get('key'): m.get('value') for m in obj.findall('metadata')}
                           for obj in config.findall('object')]
                require(any(obj.get('name') == 'corner-base.stl' and obj.get('enable_support') == '0'
                            for obj in objects), f'{name}: base coupon support override missing.')
        files[name] = payload
    for link in re.findall(r'\]\(([^)]+)\)', files['README.md'].decode()):
        if not link.startswith(('https://', 'http://', '#')):
            require(link in files, f'Guide links to a missing bundle file: {link}')
    return files


def check_bundle(path, files):
    expected = {BUNDLE_NAME + '/' + name: data for name, data in files.items()}
    with zipfile.ZipFile(path) as archive:
        require(len(archive.namelist()) == len(expected) and set(archive.namelist()) == set(expected),
                'Download ZIP inventory differs from the approved files.')
        require(archive.testzip() is None, 'Download ZIP is corrupt.')
        for name, data in expected.items():
            require(archive.read(name) == data, f'Download ZIP contains an outdated file: {name}')


def build_bundle(path, files):
    with tempfile.NamedTemporaryFile(dir=path.parent, suffix='.zip', delete=False) as file:
        temporary = Path(file.name)
    try:
        with zipfile.ZipFile(temporary, 'w', compression=zipfile.ZIP_DEFLATED) as archive:
            for name, data in sorted(files.items()):
                info = zipfile.ZipInfo(BUNDLE_NAME + '/' + name, date_time=(1980, 1, 1, 0, 0, 0))
                info.compress_type = zipfile.ZIP_DEFLATED
                info.external_attr = 0o100644 << 16
                archive.writestr(info, data)
        check_bundle(temporary, files)
        temporary.replace(path)
    finally:
        temporary.unlink(missing_ok=True)


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true', help='Validate without modifying files')
    args = parser.parse_args(argv)
    files = collect_files()
    bundle = DIRECTORY / (BUNDLE_NAME + '.zip')
    if args.check:
        check_bundle(bundle, files)
        for name, data in files.items():
            if name.startswith('STL/'):
                require((DIRECTORY / name).read_bytes() == data, f'Stale loose STL copy: {name}')
    else:
        build_bundle(bundle, files)
        for name, data in files.items():
            if name.startswith('STL/'):
                path = DIRECTORY / name
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_bytes(data)
    print(f'PLA starter bundle {"verified" if args.check else "built"}: {len(files)} files, 4 projects.')


if __name__ == '__main__':
    try:
        main()
    except (OSError, KeyError, ValueError, zipfile.BadZipFile) as error:
        raise SystemExit(f'Starter bundle check failed: {error}') from None
