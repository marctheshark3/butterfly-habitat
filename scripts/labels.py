"""Generate temporary paper part labels from the current assembly manifest."""
import argparse
import json
from pathlib import Path

ap=argparse.ArgumentParser()
ap.add_argument('directory',nargs='?',type=Path,default=Path('candidate'))
args=ap.parse_args(); root=args.directory
manifest=json.loads((root/'assembly/manifest.json').read_text())
parts=sorted(i['name'] for i in manifest['items'] if i['kind']=='printed')
svg=['<svg xmlns="http://www.w3.org/2000/svg" width="210mm" height="148mm" viewBox="0 0 210 148">',
     f'<text x="10" y="10" font-size="4">Habitat {manifest["revision"]} — temporary part labels</text>']
for i,name in enumerate(parts):
    x=10+(i%3)*64; y=18+(i//3)*24
    svg += [f'<rect x="{x}" y="{y}" width="60" height="20" fill="none" stroke="black" stroke-width="0.2"/>',
            f'<text x="{x+3}" y="{y+8}" font-size="4">{name}</text>',
            f'<text x="{x+3}" y="{y+15}" font-size="2.7">habitat-{name}.stl</text>']
svg.append('</svg>')
(root/'templates/part-labels.svg').write_text('\n'.join(svg))
