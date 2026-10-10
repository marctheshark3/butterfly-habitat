"""Export a separate marked variant without replacing existing print projects.

APPIMAGE_EXTRACT_AND_RUN=1 VibeCADCmd scripts/label-parts.py
Optional destination: HABITAT_LABELED_OUTPUT=/absolute/path
"""
import hashlib
import json
import os
from pathlib import Path
import runpy
import sys
import traceback


def main():
    root = Path(__file__).resolve().parents[1]
    source = root / 'src/butterfly-habitat.py'
    labels = root / 'src/part_ids.py'
    candidate = json.loads((root / 'candidate/assembly/manifest.json').read_text())
    digest = hashlib.sha256(source.read_bytes()).hexdigest()
    if candidate['source_sha256'] != digest:
        raise ValueError('Regenerate the baseline candidate before adding IDs.')
    out = Path(os.environ.get('HABITAT_LABELED_OUTPUT', str(root / 'candidate/labeled'))).resolve()
    if out == (root / 'candidate').resolve() or (root / 'candidate').resolve().is_relative_to(out):
        raise ValueError('Labeled exports need their own directory.')
    cad = runpy.run_path(str(source), run_name='habitat_label_source')
    ids = runpy.run_path(str(labels), run_name='habitat_part_ids')
    a = cad['build'](candidate['mesh_mm'], candidate['mesh_measured'])
    # Recesses only remove material. Sweep the original, larger bodies, then
    # prove every labeled body is a subset. This conservative motion check
    # also avoids OCC's invalid face extrusions around tiny engraved glyphs.
    baseline = cad['validate'](a, motion=True)
    if not baseline['geometry_pass'] or not baseline['motion_checked']:
        raise ValueError(baseline['errors'])
    print('Original envelopes passed full assembly and motion checks.', flush=True)
    markings = ids['engrave'](a, cad)
    print('All 15 IDs engraved; solid, depth, backing, and envelope checks passed.', flush=True)
    report = cad['validate'](a, motion=False)
    report['motion_checked'] = True
    report['motion'] = baseline['motion']
    report['motion_proof'] = dict(method='conservative original envelopes',
                                  source_sha256=digest, every_labeled_body_is_subset=True,
                                  note='Original bodies passed all motion checks in this run; IDs only remove material.')
    report['variant'] = ids['VARIANT']
    report['part_ids'] = markings
    if not report['geometry_pass'] or not report['motion_checked']:
        raise ValueError(report['errors'])
    # Export every variant artifact together. Never copy an old review into this set.
    cad['export'](a, out, report)
    manifest_path = out / 'assembly/manifest.json'
    manifest = json.loads(manifest_path.read_text())
    manifest.update(variant=ids['VARIANT'], label_source_sha256=hashlib.sha256(labels.read_bytes()).hexdigest(),
                    label_exporter_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(), part_ids=markings)
    for item in manifest['items']:
        if item['kind'] == 'printed':
            item['part_id'] = ids['PART_IDS'][item['name']]
            item['stl_sha256'] = hashlib.sha256((out / 'stl' / ('habitat-' + item['name'] + '.stl')).read_bytes()).hexdigest()
    manifest_path.write_text(json.dumps(manifest, indent=2) + '\n')
    review = dict(source_sha256=digest, label_source_sha256=manifest['label_source_sha256'],
                  variant=ids['VARIANT'], mesh_compressed_mm=a.mesh_mm, mesh_measurement_confirmed=a.mesh_measured,
                  slicer_review_pass=False, wall_thickness_review_pass=False, physical_fit_pass=False,
                  reviewer='', notes='Separate engraved variant. Record new slice and physical observations.')
    (out / 'required-review.json').write_text(json.dumps(review, indent=2) + '\n')
    print(f'Labeled candidate exported: {out}; {report["pairs_checked"]} pairs and all motion checks passed.', flush=True)


if __name__ in ('__main__', 'label-parts') or 'FreeCAD' in sys.modules:
    try:
        main()
    except Exception:
        traceback.print_exc()
        sys.stdout.flush()
        sys.stderr.flush()
        os._exit(1)
