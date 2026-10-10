"""Generate the written and local-inspector guides from one assembly sequence."""
from pathlib import Path
from html import escape
import shutil
import json
import runpy

ROOT = Path(__file__).resolve().parents[1]
IDENTIFICATION = runpy.run_path(str(ROOT / 'src/part_ids.py'))
PART_IDS = IDENTIFICATION['PART_IDS']
PART_NAMES = {'base': 'base', 'front': 'front frame', 'rail-left': 'left rail',
              'rail-right': 'right rail', 'keeper': 'keeper / latch',
              **{n: n + ' frame' for n in ('back', 'left', 'right', 'door', 'roof')},
              **{n + '-clamp': n + ' clamp' for n in ('back', 'left', 'right', 'door', 'roof')}}
ID_NOTE = ('Each letter identifies one assembly; matching frame and clamp IDs end in 1 and 2. '
           'Left and right are viewed from outside the front doorway. The future-print labeled variant '
           'has small recessed IDs. Existing unmarked 0.11 parts can be identified with this key and '
           'the paper labels; they do not need reprinting just for identification. The labeled variant '
           'preserves the original fit geometry and print orientations. Its physical fit and label '
           'legibility still need a printed check.')

def part(name):
    return PART_IDS[name] + ' ' + PART_NAMES[name]

INTRO = 'Revision 0.11 engineering candidate. Digital geometry and slicing checks pass. Physical assembly, fabric retention and 50 door cycles still need testing. The model assumes 0.20 mm compressed mesh; measure your fabric and regenerate before final printing.'
STEPS = [
('Prepare the five mesh panels', '40 M3 × 10 screws + 40 M3 nyloc nuts', [
'Pair each frame with its matching clamp: ' + '; '.join(part(n) + ' with ' + part(n+'-clamp') for n in ('back','left','right','door','roof')) + '. ' + part('front') + ' is the open doorway and has no mesh clamp.',
'On each frame, put eight nuts in the hex pockets opposite the clamp face. Point each nut’s nylon end away from the clamp. Hold loose nuts with temporary tape until the screws engage.',
'Lay the matching mesh sheet on the frame, place the clamp over it, and insert eight 10 mm screws from the clamp side. Start all eight before tightening gradually around the border. Remove temporary tape.',
'Check that the fabric is held around the entire opening, the clamp stays flat and screw tips remain recessed. Set the five completed panels aside.'], 'exploded.png'),
('Load the remaining nuts while the parts are accessible', '11 M3 nyloc nuts', [
part('front') + ': insert two nuts in the lower inward-facing boss slots for the base, two in the upper inward-facing boss slots for the roof, and four in the inside-face hex pockets for the rails. Total: eight nuts.',
part('back') + ': insert two nuts in the lower inward-facing boss slots for the base.',
part('rail-left') + ': insert one nut in the inside-face pocket behind the keeper pivot before mounting the rail.',
'Base nuts have nylon ends upward; roof nuts have nylon ends downward. Rail and keeper nuts have nylon ends toward the inside of the enclosure. Temporarily retain any loose nuts until their screws engage.'], None),
('Attach the rails and keeper to the front frame on the bench', '5 M3 × 10 screws; nuts loaded in step 2', [
f'Place {part("front")} with its outside face accessible. Put {part("rail-left")} and {part("rail-right")} on the outside, with their stops at the bottom and their open track ends at the top. Left and right are as viewed from outside the front.',
'Insert two 10 mm screws through each rail’s deep counterbores into the front frame nuts. Seat the heads; keep the running channels clear.',
f'Attach {part("keeper")} to the top of {part("rail-left")} using the fifth 10 mm screw. Adjust the pivot so the keeper moves by hand and stays where placed. Swing its arm clear of the door path.'], None),
('Fasten the front and back to the base', '4 M3 × 16 screws; nuts loaded in step 2', [
f'The grooved face of {part("base")} goes up; the recessed screw-head pockets go underneath. Place it on two supports so you can reach the underside without turning loose walls over.',
f'Seat {part("front")}’s bottom tongue in the front groove, with rails outside and nut bosses inside. Hold it upright and insert two 16 mm screws from below.',
f'Seat the completed {part("back")} / {part("back-clamp")} panel in the opposite groove, with its mesh clamp outside. Hold it upright and insert the remaining two 16 mm screws from below.',
'Check that both walls sit fully down and all four heads sit within their underside recesses. Remove temporary nut-retaining tape.'], None),
('Slide in the side panels', 'No additional hardware', [
f'Keep the roof off. Hold the completed {part("left")} / {part("left-clamp")} panel with its mesh clamp facing out. Align both vertical edge tongues with the open slots on the inside faces of the front and back.',
f'Lower the panel straight down until its bottom tongue seats in the base. Repeat for the completed {part("right")} / {part("right-clamp")} panel.',
'Check that all four wall tops are level. Keep the enclosure upright; the side panels can still lift out until the roof is secured.'], None),
('Insert the door and check the keeper', 'Completed door panel; no additional hardware', [
f'With {part("keeper")} swung clear, hold the completed {part("door")} / {part("door-clamp")} panel above the rail openings. Its clamp and projecting finger grip face outward; the grip is at the bottom.',
'Lower both door edges into the tracks together until the door rests on both bottom stops. Do not force a tight track.',
'Swing the keeper across the top of the closed door so its hook prevents the door lifting. Swing it clear again and check that the door slides freely.'], 'door-removal.png'),
('Attach the complete roof', '2 M3 × 16 screws; nuts loaded in step 2', [
f'Place the completed {part("roof")} / {part("roof-clamp")} panel with its locating grooves down and mesh clamp up. Its two larger retention-access holes go toward the front, over the two upper front-frame bosses.',
'Lower it onto all four wall tops. Insert one 16 mm screw through each large access hole into the front-frame nuts. These two screws seat on the roof frame.',
'Leave the eight short mesh screws assembled. To remove the roof later, remove only the two long retention screws and lift the entire roof assembly. Keep the enclosure upright while the roof is off.'], 'roof-removal.png'),
('Check the completed enclosure', 'Physical acceptance checks', [
'Confirm all nuts engage their nylon locking section, screw tips are recessed, the base sits flat and the mesh has no loose border or escape gaps.',
'With the roof installed, swing the keeper clear and raise the door through its full travel. It should lift completely out; allow about 190 mm of upward travel. Reinsert it and close the keeper.',
'Complete and record 50 door cycles without binding or damage. Require hand assembly without drilling or sanding. Record failed fits for correction before calling the design fit verified.'], 'assembled.png'),
]
PREP = [
'Print and test the fit coupons first, then a complete door panel and representative corner. Remove supports and brim before checking fit. The four wall panels require the documented build-plate supports.',
'Identify all 15 printed parts using the part-ID key below. Use the current 0.11 fit geometry; the original unmarked parts and the engraved-ID variant share the same mating geometry.',
'Lay out 45 stainless M3 × 10 socket-head screws, six M3 × 16 socket-head screws, 51 M3 nyloc nuts (5.5 mm flats, 4 mm overall height), and a 2.5 mm hex driver. Screw length is measured beneath the head.',
'Cut five mesh sheets using the matching 1:1 templates: back 198 × 185.75 mm; left and right each 181.5 × 185.75 mm; door 162 × 168 mm; roof 198 × 198 mm. Check the printed scale. Make the eight screw openings in each sheet; only the roof also needs two larger retention-access openings.',
]

def main():
    md = ['# Assembly — revision 0.11', INTRO, '## Before assembly', *['- '+p for p in PREP], '[Mesh cutting templates and part labels](../candidate/templates/) · [Hardware list](../candidate/hardware.csv)', '## Part-ID key', ID_NOTE]
    rows = [(code, PART_NAMES[name], IDENTIFICATION['LOCATIONS'][name][-1]) for name, code in PART_IDS.items()]
    md += ['| ID | Part | Engraved label location |\n| --- | --- | --- |\n' + '\n'.join('| ' + ' | '.join(row) + ' |' for row in rows),
           '[Future-print labeled STLs](../candidate/labeled/stl/) · [Label geometry and validation](../candidate/labeled/assembly/manifest.json)',
           '## Build order', 'Mesh panels → preload remaining nuts → rails and keeper → base and front/back → sides → door → roof → checks.']
    html = ['<!doctype html><html lang="en"><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>Habitat assembly guide</title><style>body{font:18px/1.6 system-ui,sans-serif;color:#253c34;background:#f7f4ec;max-width:880px;margin:auto;padding:28px}a{color:#176b55}h1,h2{line-height:1.2}section{background:white;border:1px solid #d7dbd3;border-radius:12px;padding:24px;margin:24px 0}li{margin:14px 0}img{width:100%;height:auto}.hardware{font-weight:600;color:#176b55}table{width:100%;border-collapse:collapse}td,th{padding:8px 12px;text-align:left;border-bottom:1px solid #d7dbd3}@media print{section{break-inside:avoid}nav{display:none}}</style><nav><a href="/">← CAD inspector</a> · <button onclick="print()">Print guide</button></nav><h1>Build the butterfly habitat</h1><p>'+escape(INTRO)+'</p><h2>Before assembly</h2><ul>', *['<li>'+escape(p)+'</li>' for p in PREP], '</ul><p><a href="templates/part-labels.svg">Part labels</a> · Mesh templates: '+ ' · '.join(f'<a href="templates/{n}-mesh.svg">{n}</a>' for n in ['back','left','right','door','roof'])+'</p><h2>Build order</h2><p>Mesh panels → preload remaining nuts → rails and keeper → base and front/back → sides → door → roof → checks.</p>']
    html += ['<h2>Part-ID key</h2><p>' + escape(ID_NOTE) + '</p><table><thead><tr><th>ID</th><th>Part</th><th>Engraved label location</th></tr></thead><tbody>',
             *['<tr>' + ''.join('<td>' + escape(value) + '</td>' for value in row) + '</tr>' for row in rows], '</tbody></table>']
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
        visual.append(dict(label=f'Prepare the {name} mesh panel ({PART_IDS[name]} + {PART_IDS[name+"-clamp"]})', hardware='8 M3 × 10 screws + 8 M3 nyloc nuts',
                           text=[f'Use {part(name)} with {part(name+"-clamp")}.'] + STEPS[0][2][1:], placed_ids=panel(name), new_ids=panel(name)))
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
    (ROOT/'inspector/instructions.json').write_text(json.dumps(dict(note=INTRO+' '+ID_NOTE,part_ids=PART_IDS,steps=visual),indent=2)+'\n')
    labeled = ROOT / 'candidate/labeled'
    if (labeled / 'assembly/manifest.json').exists():
        colors = json.loads((ROOT / 'inspector/colors.json').read_text())
        color_names = {'#388DC7': 'Blue', '#F0A4BA': 'Pink', '#F68C38': 'Orange', '#DD4945': 'Red'}
        lines = ['# Labeled parts for future prints',
                 'Separate engraved-ID variant of the 0.11.0 engineering candidate. '
                 'The original unmarked STL files, starter pack and current Bambu project are unchanged. '
                 'Existing parts do not need reprinting for identification.',
                 'Each model has a 0.4 mm recessed ID with 0.8 mm strokes. All print orientations '
                 'and outer dimensions are preserved. Matching frame/clamp pairs share a letter. '
                 'Left and right are viewed from outside the front doorway.',
                 '[Assembly instructions and ID key](../../docs/ASSEMBLY.md#part-id-key) · '
                 '[Actual STL label close-ups](label-details.png) · '
                 '[Paper labels](templates/part-labels.svg)',
                 'The prepared projects use **Bambu PLA Matte**, a P1S with a 0.4 mm nozzle, '
                 'Textured PEI, 0.20 mm layers, four walls, 20% infill and a 5 mm outer brim. '
                 'Front/back/left/right frames have normal build-plate supports. '
                 'Load the matching color before printing.',
                 '| ID | Part | Color | Model | Prepared project |\n| --- | --- | --- | --- | --- |']
        for name, code in PART_IDS.items():
            project = f'slicing-PLA-Matte/habitat-{name}/sliced.3mf'
            ready = f'[Bambu 3MF]({project})' if (labeled / project).exists() else 'Slice STL with the matching profile'
            lines[-1] += f'\n| {code} | {PART_NAMES[name]} | {color_names[colors[name]]} | [STL](stl/habitat-{name}.stl) | {ready} |'
        lines += ['CAD and slice checks are recorded in [validation.json](validation.json), '
                  '[the source manifest](assembly/manifest.json) and [slice results](slicing-PLA-Matte/results.json). '
                  'Motion uses the original, larger part envelopes; the engravings only remove material. '
                  'Physical fit and printed label legibility remain unverified. Compressed mesh thickness '
                  'is still the unmeasured 0.20 mm assumption.']
        (labeled / 'README.md').write_text('\n\n'.join(lines)+'\n')
    for directory, pattern in [('views','*.png'),('templates','*.svg')]:
        target=ROOT/'inspector'/directory
        target.mkdir(exist_ok=True)
        for source in (ROOT/'candidate'/directory).glob(pattern):
            shutil.copyfile(source,target/source.name)

if __name__=='__main__':
    main()
