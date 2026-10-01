"""Generate the written and local-inspector guides from one assembly sequence."""
from pathlib import Path
from html import escape
import shutil
import json

ROOT = Path(__file__).resolve().parents[1]
INTRO = 'Revision 0.11 engineering candidate. Digital geometry and slicing checks pass. Physical assembly, fabric retention and 50 door cycles still need testing. The model assumes 0.20 mm compressed mesh; measure your fabric and regenerate before final printing.'
STEPS = [
('Prepare the five mesh panels', '40 M3 × 10 screws + 40 M3 nyloc nuts', [
'Pair each frame with its matching clamp: back, left, right, door and roof. The front is the open doorway and has no mesh clamp.',
'On each frame, put eight nuts in the hex pockets opposite the clamp face. Point each nut’s nylon end away from the clamp. Hold loose nuts with temporary tape until the screws engage.',
'Lay the matching mesh sheet on the frame, place the clamp over it, and insert eight 10 mm screws from the clamp side. Start all eight before tightening gradually around the border. Remove temporary tape.',
'Check that the fabric is held around the entire opening, the clamp stays flat and screw tips remain recessed. Set the five completed panels aside.'], 'exploded.png'),
('Load the remaining nuts while the parts are accessible', '11 M3 nyloc nuts', [
'Front frame: insert two nuts in the lower inward-facing boss slots for the base, two in the upper inward-facing boss slots for the roof, and four in the inside-face hex pockets for the rails. Total: eight nuts.',
'Back panel: insert two nuts in the lower inward-facing boss slots for the base.',
'Rail-left: insert one nut in the inside-face pocket behind the keeper pivot before mounting the rail.',
'Base nuts have nylon ends upward; roof nuts have nylon ends downward. Rail and keeper nuts have nylon ends toward the inside of the enclosure. Temporarily retain any loose nuts until their screws engage.'], None),
('Attach the rails and keeper to the front frame on the bench', '5 M3 × 10 screws; nuts loaded in step 2', [
'Place the front frame with its outside face accessible. Put rail-left and rail-right on the outside, with their stops at the bottom and their open track ends at the top. Left and right are as viewed from outside the front.',
'Insert two 10 mm screws through each rail’s deep counterbores into the front frame nuts. Seat the heads; keep the running channels clear.',
'Attach the keeper to the top of rail-left using the fifth 10 mm screw. Adjust the pivot so the keeper moves by hand and stays where placed. Swing its arm clear of the door path.'], None),
('Fasten the front and back to the base', '4 M3 × 16 screws; nuts loaded in step 2', [
'The grooved face of the base goes up; the recessed screw-head pockets go underneath. Place it on two supports so you can reach the underside without turning loose walls over.',
'Seat the front frame’s bottom tongue in the front groove, with rails outside and nut bosses inside. Hold it upright and insert two 16 mm screws from below.',
'Seat the back panel in the opposite groove, with its mesh clamp outside. Hold it upright and insert the remaining two 16 mm screws from below.',
'Check that both walls sit fully down and all four heads sit within their underside recesses. Remove temporary nut-retaining tape.'], None),
('Slide in the side panels', 'No additional hardware', [
'Keep the roof off. Hold the left panel with its mesh clamp facing out. Align both vertical edge tongues with the open slots on the inside faces of the front and back.',
'Lower the panel straight down until its bottom tongue seats in the base. Repeat for the right panel.',
'Check that all four wall tops are level. Keep the enclosure upright; the side panels can still lift out until the roof is secured.'], None),
('Insert the door and check the keeper', 'Completed door panel; no additional hardware', [
'With the keeper swung clear, hold the completed door above the rail openings. Its clamp and projecting finger grip face outward; the grip is at the bottom.',
'Lower both door edges into the tracks together until the door rests on both bottom stops. Do not force a tight track.',
'Swing the keeper across the top of the closed door so its hook prevents the door lifting. Swing it clear again and check that the door slides freely.'], 'door-removal.png'),
('Attach the complete roof', '2 M3 × 16 screws; nuts loaded in step 2', [
'Place the completed roof with its locating grooves down and mesh clamp up. Its two larger retention-access holes go toward the front, over the two upper front-frame bosses.',
'Lower it onto all four wall tops. Insert one 16 mm screw through each large access hole into the front-frame nuts. These two screws seat on the roof frame.',
'Leave the eight short mesh screws assembled. To remove the roof later, remove only the two long retention screws and lift the entire roof assembly. Keep the enclosure upright while the roof is off.'], 'roof-removal.png'),
('Check the completed enclosure', 'Physical acceptance checks', [
'Confirm all nuts engage their nylon locking section, screw tips are recessed, the base sits flat and the mesh has no loose border or escape gaps.',
'With the roof installed, swing the keeper clear and raise the door through its full travel. It should lift completely out; allow about 190 mm of upward travel. Reinsert it and close the keeper.',
'Complete and record 50 door cycles without binding or damage. Require hand assembly without drilling or sanding. Record failed fits for correction before calling the design fit verified.'], 'assembled.png'),
]
PREP = [
'Print and test the fit coupons first, then a complete door panel and representative corner. Remove supports and brim before checking fit. The four wall panels require the documented build-plate supports.',
'Identify all 15 printed parts: base, front, back, left, right, roof, door, back-clamp, left-clamp, right-clamp, roof-clamp, door-clamp, rail-left, rail-right and keeper. Use parts from one revision.',
'Lay out 45 stainless M3 × 10 socket-head screws, six M3 × 16 socket-head screws, 51 M3 nyloc nuts (5.5 mm flats, 4 mm overall height), and a 2.5 mm hex driver. Screw length is measured beneath the head.',
'Cut five mesh sheets using the matching 1:1 templates: back 198 × 185.75 mm; left and right each 181.5 × 185.75 mm; door 162 × 168 mm; roof 198 × 198 mm. Check the printed scale. Make the eight screw openings in each sheet; only the roof also needs two larger retention-access openings.',
]

def main():
    md = ['# Assembly — revision 0.11', INTRO, '## Before assembly', *['- '+p for p in PREP], '[Mesh cutting templates and part labels](../candidate/templates/) · [Hardware list](../candidate/hardware.csv)', '## Build order', 'Mesh panels → preload remaining nuts → rails and keeper → base and front/back → sides → door → roof → checks.']
    html = ['<!doctype html><html lang="en"><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>Habitat assembly guide</title><style>body{font:18px/1.6 system-ui,sans-serif;color:#253c34;background:#f7f4ec;max-width:880px;margin:auto;padding:28px}a{color:#176b55}h1,h2{line-height:1.2}section{background:white;border:1px solid #d7dbd3;border-radius:12px;padding:24px;margin:24px 0}li{margin:14px 0}img{width:100%;height:auto}.hardware{font-weight:600;color:#176b55}@media print{section{break-inside:avoid}nav{display:none}}</style><nav><a href="/">← CAD inspector</a> · <button onclick="print()">Print guide</button></nav><h1>Build the butterfly habitat</h1><p>'+escape(INTRO)+'</p><h2>Before assembly</h2><ul>', *['<li>'+escape(p)+'</li>' for p in PREP], '</ul><p><a href="templates/part-labels.svg">Part labels</a> · Mesh templates: '+ ' · '.join(f'<a href="templates/{n}-mesh.svg">{n}</a>' for n in ['back','left','right','door','roof'])+'</p><h2>Build order</h2><p>Mesh panels → preload remaining nuts → rails and keeper → base and front/back → sides → door → roof → checks.</p>']
    for number,(title,hardware,steps,figure) in enumerate(STEPS,1):
        md += [f'## {number}. {title}', f'**Hardware:** {hardware}', '\n'.join(f'{i}. {s}' for i,s in enumerate(steps,1))]
        html += [f'<section id="step-{number}"><h2>{number}. {escape(title)}</h2><p class="hardware">{escape(hardware)}</p><ol>', *['<li>'+escape(s)+'</li>' for s in steps], '</ol>']
        if figure:
            caption = 'CAD reference view; separated parts show orientation, not an installation sequence.' if figure=='exploded.png' else title
            md += [f'![{caption}](../candidate/views/{figure})']
            html += [f'<figure><img src="views/{figure}" alt="{escape(caption)}"><figcaption>{escape(caption)}</figcaption></figure>']
        html += ['</section>']
    html += ['</html>']
    (ROOT/'docs/ASSEMBLY.md').write_text('\n\n'.join(md)+'\n')
    (ROOT/'inspector/assembly.html').write_text('\n'.join(html)+'\n')
    model = json.loads((ROOT/'inspector/models/habitat-v011.json').read_text())
    ids = [item['instance'] for item in model['concepts'][0]['items']]
    def panel(name):
        return [n for n in ids if n in (name,name+'-clamp',name+'-mesh') or n.startswith(name+'-mesh-')]
    nuts = [n for n in ids if n.endswith('-nut') and '-mesh-' not in n]
    rails = [n for n in ids if n.startswith('rail-') or n.startswith('keeper')]
    front = ['front'] + rails + [n for n in nuts if not n.startswith('base-back')]
    shell = list(dict.fromkeys(['base'] + front + panel('back') + [n for n in ids if n.startswith('base-')]))
    sides = shell + panel('left') + panel('right')
    door = sides + panel('door')
    visual = []
    for name in ['back','left','right','door','roof']:
        visual.append(dict(label='Prepare the '+name+' mesh panel', hardware='8 M3 × 10 screws + 8 M3 nyloc nuts',
                           text=STEPS[0][2][1:], placed_ids=panel(name), new_ids=panel(name)))
    scenes = [(['front','back','rail-left']+nuts,nuts), (front,rails),
              (shell,['base']+[n for n in ids if n.startswith('base-') and n.endswith('-screw')]),
              (sides,panel('left')+panel('right')), (door,panel('door')),
              (ids,panel('roof')+['roof-45-screw','roof-155-screw']), (ids,[])]
    for step,(visible,added) in zip(STEPS[1:],scenes):
        visual.append(dict(label=step[0],hardware=step[1],text=step[2],placed_ids=list(dict.fromkeys(visible)),new_ids=added))
    for number,step in enumerate(visual,1):
        step['number']=number
        assert set(step['placed_ids']) <= set(ids)
        assert set(step['new_ids']) <= set(step['placed_ids'])
    assert set(visual[-1]['placed_ids'])==set(ids)
    (ROOT/'inspector/instructions.json').write_text(json.dumps(dict(note=INTRO,steps=visual),indent=2)+'\n')
    for directory, pattern in [('views','*.png'),('templates','*.svg')]:
        target=ROOT/'inspector'/directory
        target.mkdir(exist_ok=True)
        for source in (ROOT/'candidate'/directory).glob(pattern):
            shutil.copyfile(source,target/source.name)

if __name__=='__main__':
    main()
