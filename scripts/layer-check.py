"""FreeCADCmd: detect disconnected unsupported islands at 0.2 mm layer centres.

This geometric check complements slicing; it does not predict bridge sag or
warping. A connected cantilever may have support at only one end.
"""
import json
import math
from pathlib import Path
import FreeCAD as App
import Part

root=Path(__file__).resolve().parents[1]/'candidate'
report={}
for path in sorted((root/'step').glob('*.step')):
    s=Part.read(str(path)); b=s.BoundBox
    previous=None; islands=[]; max_new=0.; layers=0
    for index in range(math.ceil(b.ZLength/.2)):
        z=.1+index*.2
        slab=Part.makeBox(b.XLength+2,b.YLength+2,.01,App.Vector(-1,-1,z-.005))
        current=s.common(slab)
        if current.Volume<1e-8: continue
        layers+=1
        if previous is not None:
            lower=previous.copy(); lower.translate(App.Vector(0,0,.2))
            for solid in current.Solids:
                overlap=solid.common(lower).Volume
                if overlap<1e-7:
                    islands.append(dict(layer=index+1,z=z,area_mm2=solid.Volume/.01))
                max_new=max(max_new,1-overlap/solid.Volume)
        previous=current
    report[path.stem]=dict(layers=layers,unsupported_islands=islands,max_new_area_fraction=max_new)
    print(path.stem,layers,'islands',len(islands),flush=True)
(root/'layer-check.json').write_text(json.dumps(report,indent=2))
