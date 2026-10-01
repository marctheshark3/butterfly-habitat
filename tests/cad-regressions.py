"""Run with FreeCADCmd: import/check side effects and a misaligned clamp regression."""
from pathlib import Path
import os
import runpy
import sys
import traceback

try:
    root=Path(__file__).resolve().parents[1]
    def snapshot():
        return {str(p): (p.stat().st_size,p.stat().st_mtime_ns)
                for suffix in ['*.stl','*.step'] for p in root.rglob(suffix)}
    before=snapshot()
    model=runpy.run_path(str(root/'src'/'butterfly-habitat.py'),run_name='habitat_import_test')
    assert snapshot()==before, 'Import wrote production files'
    a=model['build']()
    assert snapshot()==before, 'Construction wrote production files'
    a.items['left-clamp'].shape=model['move'](a.items['left-clamp'].shape,(0,1,0))
    result=model['validate'](a,motion=False)
    assert not result['geometry_pass'], 'A 1 mm clamp misalignment incorrectly passed'
    assert any('left-clamp' in e and 'screw' in e for e in result['errors']), result['errors']
    assert snapshot()==before, 'Validation wrote production files'
    print('CAD REGRESSIONS: PASS — pure import/build/check; misaligned clamp rejected',flush=True)
except Exception:
    traceback.print_exc(); sys.stdout.flush(); sys.stderr.flush(); os._exit(1)
