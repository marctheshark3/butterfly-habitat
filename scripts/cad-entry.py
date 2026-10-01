"""FreeCADCmd entry point with a reliable nonzero exit status on failure."""
import os
from pathlib import Path
import runpy
import sys
import traceback

try:
    runpy.run_path(str(Path(__file__).resolve().parents[1]/'src'/'butterfly-habitat.py'),run_name='__main__')
except Exception:
    traceback.print_exc()
    sys.stdout.flush()
    sys.stderr.flush()
    os._exit(1)  # FreeCAD's script loader otherwise catches errors and exits zero.
