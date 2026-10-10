"""Render actual labeled STL surfaces face-on for visual inspection (numpy/Pillow)."""
from pathlib import Path
import json
import runpy
import struct
import numpy as np
from PIL import Image, ImageDraw, ImageFont

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / 'candidate/labeled'
IDS = runpy.run_path(str(ROOT / 'src/part_ids.py'))
COLORS = json.loads((ROOT / 'inspector/colors.json').read_text())
TILE_W, TILE_H, SCALE = 420, 270, 32
sheet = Image.new('RGB', (3 * TILE_W, 5 * TILE_H), '#faf9f4')
font = ImageFont.truetype('/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf', 21)
small = ImageFont.truetype('/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf', 13)

for index, (name, code) in enumerate(IDS['PART_IDS'].items()):
    data = (OUT / 'stl' / f'habitat-{name}.stl').read_bytes()
    count = struct.unpack_from('<I', data, 80)[0]
    origin, u, v, normal, _ = IDS['LOCATIONS'][name]
    basis = np.array([u, v, normal], dtype=float)
    pixels = np.full((TILE_H, TILE_W, 3), (250, 249, 244), dtype=np.uint8)
    depths = np.full((TILE_H, TILE_W), -np.inf)
    rgb = np.array([int(COLORS[name][i:i+2], 16) for i in (1, 3, 5)])
    for triangle in range(count):
        vertices = np.array([struct.unpack_from('<3f', data, 84 + 50 * triangle + 12 + 12 * c) for c in range(3)])
        local = (vertices - origin) @ basis.T
        points = np.column_stack(((local[:, 0] + 3.5) * SCALE, 220 - local[:, 1] * SCALE))
        xa, ya = np.floor(points.min(axis=0)).astype(int)
        xb, yb = np.ceil(points.max(axis=0)).astype(int)
        xa, ya, xb, yb = max(0, xa), max(48, ya), min(TILE_W-1, xb), min(TILE_H-26, yb)
        if xa > xb or ya > yb:
            continue
        xx, yy = np.meshgrid(np.arange(xa, xb+1)+.5, np.arange(ya, yb+1)+.5)
        (x0, y0), (x1, y1), (x2, y2) = points
        determinant = (y1-y2)*(x0-x2)+(x2-x1)*(y0-y2)
        if abs(determinant) < 1e-9:
            continue
        a = ((y1-y2)*(xx-x2)+(x2-x1)*(yy-y2))/determinant
        b = ((y2-y0)*(xx-x2)+(x0-x2)*(yy-y2))/determinant
        c = 1-a-b
        z = a*local[0,2]+b*local[1,2]+c*local[2,2]
        view = depths[ya:yb+1, xa:xb+1]
        mask = (a >= 0) & (b >= 0) & (c >= 0) & (z > view)
        # Depth shading makes the same-filament recess visible; no text overlay.
        shade = np.clip(1 + z*.9, .5, 1)
        tile = pixels[ya:yb+1, xa:xb+1]
        tile[mask] = (shade[..., None]*rgb)[mask].astype(np.uint8)
        view[mask] = z[mask]
    image = Image.fromarray(pixels)
    draw = ImageDraw.Draw(image)
    draw.text((16, 12), f'{code}  {name}', font=font, fill='#243438')
    draw.text((16, TILE_H-22), 'Actual STL geometry · recessed 0.4 mm', font=small, fill='#243438')
    sheet.paste(image, ((index % 3)*TILE_W, (index // 3)*TILE_H))

sheet.save(OUT / 'label-details.png')
print('Rendered 15 actual STL engraving details.')
