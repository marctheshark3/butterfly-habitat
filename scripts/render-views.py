"""Depth-buffer rendering of the CAD-generated SVG triangles, using numpy/Pillow."""
from pathlib import Path
import xml.etree.ElementTree as ET
import gzip
import numpy as np
from PIL import Image, ImageDraw, ImageFont

for p in Path('candidate/views').glob('*.svgz'):
    with gzip.open(p,'rt') as stream:
        root=ET.parse(stream).getroot()
    x,y,w,h=map(float,root.attrib['viewBox'].split()); scale=1200/w
    width,height=1200,round(h*scale)
    pixels=np.full((height,width,3),(250,249,244),dtype=np.uint8)
    depth=np.full((height,width),-np.inf)
    polygons=[e for e in root if e.tag.endswith('polygon')]
    for transparent in [False,True]:
        for e in polygons:
            alpha=float(e.attrib['opacity'])
            if (alpha<1)!=transparent: continue
            pts=np.array([list(map(float,q.split(','))) for q in e.attrib['points'].split()])
            pts=(pts-[x,y])*scale
            zs=np.array(list(map(float,e.attrib['data-depths'].split())))
            xa,ya=np.floor(pts.min(axis=0)).astype(int); xb,yb=np.ceil(pts.max(axis=0)).astype(int)
            xa,ya=max(0,xa),max(0,ya); xb,yb=min(width-1,xb),min(height-1,yb)
            if xa>xb or ya>yb: continue
            xx,yy=np.meshgrid(np.arange(xa,xb+1)+.5,np.arange(ya,yb+1)+.5)
            (x0,y0),(x1,y1),(x2,y2)=pts
            det=(y1-y2)*(x0-x2)+(x2-x1)*(y0-y2)
            if abs(det)<1e-9: continue
            u=((y1-y2)*(xx-x2)+(x2-x1)*(yy-y2))/det
            v=((y2-y0)*(xx-x2)+(x0-x2)*(yy-y2))/det
            q=1-u-v; z=u*zs[0]+v*zs[1]+q*zs[2]
            view=depth[ya:yb+1,xa:xb+1]
            mask=(u>=0)&(v>=0)&(q>=0)&(z>view)
            c=e.attrib['fill'].lstrip('#'); color=np.array([int(c[i:i+2],16) for i in [0,2,4]])
            pix=pixels[ya:yb+1,xa:xb+1]
            pix[mask]=(color*alpha+pix[mask]*(1-alpha)).astype(np.uint8)
            if not transparent: view[mask]=z[mask]
    im=Image.fromarray(pixels); draw=ImageDraw.Draw(im)
    font=ImageFont.truetype('/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf',24)
    draw.text((25,18),f'Habitat 0.11.0 · {p.stem} · candidate',font=font,fill='#243438')
    im.save(p.with_suffix('.png'))
