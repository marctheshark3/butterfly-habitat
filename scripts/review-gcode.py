"""Produce first-layer/bridge inspection sheets from the actual sliced G-code."""
from collections import defaultdict
import json
import math
from pathlib import Path
import re
import zipfile
from PIL import Image, ImageDraw, ImageFont

root=Path('candidate/slicing'); results={}; previews=[]
font=ImageFont.truetype('/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf',15)
for p in sorted(root.glob('*/sliced.3mf')):
    with zipfile.ZipFile(p) as archive:
        text=archive.read('Metadata/plate_1.gcode').decode()
        bounds=json.loads(archive.read('Metadata/plate_1.json'))['bbox_all']
    layers=defaultdict(list); feature=''; layer=0; x=y=0.; absolute_e=False; last_e=0.; arcs=0
    for line in text.splitlines():
        if line.startswith('; CHANGE_LAYER'): layer+=1
        elif line.startswith('; FEATURE:'): feature=line.split(':',1)[1].strip()
        elif line.split(';')[0].strip()=='M82': absolute_e=True
        elif line.split(';')[0].strip()=='M83': absolute_e=False
        elif line.startswith('G92 E'): last_e=float(line[5:].split()[0])
        elif line.startswith(('G0 ','G1 ','G2 ','G3 ')):
            values={k:float(v) for k,v in re.findall(r'([XYEIJ])(-?(?:\d+(?:\.\d*)?|\.\d+))',line.split(';')[0])}
            nx,ny=values.get('X',x),values.get('Y',y)
            extrusion=values.get('E',0)-(last_e if absolute_e and 'E' in values else 0)
            if 'E' in values: last_e=values['E']
            if layer and extrusion>0 and (nx!=x or ny!=y) and feature!='Custom':
                if line.startswith(('G2 ','G3 ')) and ('I' in values or 'J' in values):
                    arcs+=1
                    cx,cy=x+values.get('I',0),y+values.get('J',0)
                    start=math.atan2(y-cy,x-cx); end=math.atan2(ny-cy,nx-cx)
                    angle=(end-start)%(2*math.pi)
                    if line.startswith('G2 '): angle=angle-2*math.pi
                    radius=math.hypot(x-cx,y-cy); steps=max(2,math.ceil(abs(angle)*radius/.15))
                    px,py=x,y
                    for j in range(1,steps+1):
                        theta=start+angle*j/steps; ax,ay=cx+radius*math.cos(theta),cy+radius*math.sin(theta)
                        layers[layer].append((px,py,ax,ay,feature)); px,py=ax,ay
                else:
                    layers[layer].append((x,y,nx,ny,feature))
            x,y=nx,ny
    assert max(layers)==layer, (p,max(layers),layer)
    bridge=[(math.hypot(s[2]-s[0],s[3]-s[1]),l) for l,segs in layers.items() for s in segs if 'bridge' in s[4].lower()]
    critical={'habitat-door':32,'habitat-door-clamp':14,'habitat-front':11,
              'habitat-back':11,'habitat-left':11,'habitat-right':11,
              'habitat-roof':26,'habitat-keeper':16,
              'habitat-rail-left':60,'habitat-rail-right':60}
    selected=[1,max(bridge)[1] if bridge else max(layers),critical.get(p.parent.name,11)]
    canvas=Image.new('RGB',(1350,500),'#faf9f4'); draw=ImageDraw.Draw(canvas)
    draw.text((12,8),p.parent.name,fill='#243438',font=font)
    for col,li in enumerate(selected):
        xmin,ymin,xmax,ymax=bounds; scale=min(400/(xmax-xmin),405/(ymax-ymin))
        ox=col*450+25; oy=470
        for x,y,nx,ny,f in layers[li]:
            color='#c1582a' if 'bridge' in f.lower() else ('#517cd6' if 'Support' in f else ('#b7c0c1' if f=='Brim' else '#236567'))
            draw.line((ox+(x-xmin)*scale,oy-(y-ymin)*scale,ox+(nx-xmin)*scale,oy-(ny-ymin)*scale),fill=color,width=1)
        draw.text((col*450+15,34),f'Layer {li} / {max(layers)}'+(' — critical feature' if col==2 else (' — bridges orange' if col else ' — bed contact')),font=font,fill='#243438')
    canvas.save(p.parent/'layers.png'); previews.append(canvas.resize((810,300)))
    results[p.parent.name]=dict(layers=max(layers),bridge_segments=len(bridge),
                               longest_bridge_extrusion_mm=round(max(bridge)[0],3) if bridge else 0,
                               arc_moves_tessellated=arcs,
                               note='Extrusion length includes anchoring; inspect bridge support in the 3MF.')
contact=Image.new('RGB',(1620,300*math.ceil(len(previews)/2)), '#faf9f4')
for i,im in enumerate(previews): contact.paste(im,((i%2)*810,(i//2)*300))
contact.save(root/'layer-overview.png')
(root/'gcode-review.json').write_text(json.dumps(results,indent=2))
print(json.dumps(results,indent=2))
