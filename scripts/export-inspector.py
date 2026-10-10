"""Build a local Rage CAD inspector model without modifying production exports.

Run with APPIMAGE_EXTRACT_AND_RUN=1 VibeCADCmd scripts/export-inspector.py.
"""
import base64
import gzip
import hashlib
import json
import os
from pathlib import Path
import runpy
import struct
import traceback

ROOT = Path(__file__).resolve().parents[1]

def packed(values, code):
    return struct.pack('<' + str(len(values)) + code, *values)

def encode(data):
    return base64.b64encode(gzip.compress(data, mtime=0)).decode('ascii')

def main():
    module = runpy.run_path(str(ROOT / 'src/butterfly-habitat.py'), run_name='habitat_inspector')
    baseline = json.loads((ROOT / 'candidate/assembly/manifest.json').read_text())
    assembly = module['build'](baseline['mesh_mm'], baseline['mesh_measured'])
    ids = runpy.run_path(str(ROOT / 'src/part_ids.py'))
    labeled = json.loads((ROOT / 'candidate/labeled/assembly/manifest.json').read_text())
    if (labeled['source_sha256'] != hashlib.sha256((ROOT / 'src/butterfly-habitat.py').read_bytes()).hexdigest()
            or labeled['label_source_sha256'] != hashlib.sha256((ROOT / 'src/part_ids.py').read_bytes()).hexdigest()):
        raise ValueError('Regenerate the labeled candidate before refreshing the inspector.')
    ids['engrave'](assembly, module)
    geometries, items = {}, []
    colors = json.loads((ROOT / 'inspector/colors.json').read_text())
    offsets = dict(roof=[0,0,65], door=[0,-60,0], left=[-45,0,0], right=[45,0,0], back=[0,45,0], front=[0,-25,0])
    for name, item in assembly.items.items():
        shape = item.shape
        vertices, faces = shape.tessellate(0.2)
        xyz = [v for p in vertices for v in (p.x,p.y,p.z)]
        indices = [i for f in faces for i in f]
        geometries[name] = dict(vertexCount=len(vertices), indexCount=len(indices), data=encode(packed(xyz,'f')+packed(indices,'I')))
        lines = []
        for edge in shape.Edges:
            points = edge.discretize(Deflection=0.2)
            for a,b in zip(points,points[1:]):
                lines.extend([a.x,a.y,a.z,b.x,b.y,b.z])
        geometries[name+'-edges'] = dict(kind='brep-edges', pointCount=len(lines)//3, data=encode(packed(lines,'f')))
        bb = shape.BoundBox
        hardware = item.kind in ('screw','nut')
        items.append(dict(instance=name, geometry=name, cad_edges=name+'-edges', kind='hardware' if hardware else item.kind,
                          color='#55606e' if hardware else colors.get(name,'#a8b8a5'), opacity=0.15 if item.kind=='mesh' else 1,
                          explode_mm=offsets.get(item.group,[0,0,0]), bbox_mm=[bb.XLength,bb.YLength,bb.ZLength],
                          centroid=[bb.Center.x,bb.Center.y,bb.Center.z], vertexCount=len(vertices),
                          part_id=ids['PART_IDS'].get(name),
                          status='Engineering candidate; physical fit and label legibility pending',
                          evidence=(f'{ids["PART_IDS"][name]} · ' if name in ids['PART_IDS'] else '') + f'{item.kind}; {item.group} group. Revision 0.11.0, engraved-ID variant. Compressed mesh thickness assumed 0.20 mm; measure before production.'))
    concept = dict(id='habitat', name='Butterfly habitat · 0.11.0 · engraved part IDs', default_view='solid', views=['solid','translucent','exploded'],
                   release='Engineering candidate', priority='Physical fit pending', service='122 components · 15 printed parts · 5 mesh sheets · 51 screws + 51 nuts. Mesh thickness is assumed at 0.20 mm.',
                   metrics=dict(solids=len(items),source='habitat-assembly.step',deflection_mm=0.2),items=items)
    out = ROOT/'inspector'
    (out/'models').mkdir(parents=True,exist_ok=True)
    (out/'models/habitat-v011.json').write_text(json.dumps(dict(title='Butterfly habitat — CAD inspector',concepts=[concept],geometry=geometries),separators=(',',':')))
    (out/'catalog.json').write_text(json.dumps(dict(default='habitat-v011',models=[dict(id='habitat-v011',name='Butterfly habitat 0.11.0 · engraved part IDs')]),indent=2)+'\n')
    print(f'Inspector model exported: {len(items)} components')

try:
    main()
except Exception:
    traceback.print_exc()
    os._exit(1)
