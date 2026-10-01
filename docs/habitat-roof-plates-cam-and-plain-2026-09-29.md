# Habitat roof plates, plain and camera, 2026-09-29

Point a session at this file for the roof only. The hinge and the floor slits are a different brief.

`/home/marctheshark/Documents/butterfly-habitat/docs/habitat-roof-plates-cam-and-plain-2026-09-29.md`

Sibling, do not merge them into one cut:

`/home/marctheshark/Documents/butterfly-habitat/docs/habitat-front-hinge-floor-slits-2026-09-29.md`

Drawing, both plates:

`/home/marctheshark/Documents/butterfly-habitat/sketches/roof-plates/index.html`

Same drawing on the inspector:

`http://spark-adb4.tailf9bab6.ts.net:8118/roof-plates.html`

Not a print approval. Pick is Plate A. The live roof is the full mesh frame. Do not send it to the printer from this brief.

## What the photo was

The near corner of the roof was a 48 by 40 mm shelf, 4 mm tall, on the 6 mm plate. An 8 mm hole sat in that shelf. The blue clamp was cut away around it. The tan sheet stopped short of it. That was `build_top` and `build_clamp_roof`. Plate A removes it.

That hole was `cable_hole_diameter_mm`, 8.0, source assumed. It was not a lens. The official DXF has no lens circle. `cam_offsets_ready` stays false. `docs/XIAO_SENSE_DATUM.md` is the record.

The spec used to say the pod is a roof-corner pocket and the lens looks down. Plate A retires that sentence. Plate B stays a drawing until a lens center exists.

## Plate A, no camera

Full 200 mm frame. Border 12 mm. Window 176 by 176 mm. Clamp is a full ring, not a notch. Mesh covers the photo corner. No shelf. No 8 mm hole. Roof still lifts off. That lift is still the hatch.

This is the fix for the shot. It also gives the caterpillars mesh in that corner.

Screw dots on the drawing are M3 clearance, 3.6 mm. They are not a joint into the walls. Do not treat the sketch pattern as a fastener.

## Plate B, camera

Same cube. One corner becomes a pod sized to the board, not a 48 by 40 shelf.

- Board 21.0 by 17.8 by 15.0 mm. Datasheet. Already in the spec.
- Clearance 0.4 mm per side. Assumed. Pocket 21.8 by 18.6 mm.
- Wall 2.0 mm. Assumed. Above the 1.6 mm minimum wall.
- Pod outer 25.8 by 22.6 mm. It eats the 12 mm border and a bite of the window.
- USB slot 9.0 by 3.5 mm on the short edge, out the side face of the cube. Not a hole in the top.
- Mesh seals to the pod wall. No open step like the photo.
- Lens looks down. That is the existing spec sentence, not a measured aim.
- Lens hole is not drawn. Center is unknown. Do not cut a 6 mm aperture until a caliper or a marked board supplies `cam_lens_dx_mm` and `cam_lens_dy_mm`.

The red dash on the drawing is a warning, not a hole.

## Decision

Write one line here before any roof cut.

Pick: Plate A. Camera stays off. The 48 by 40 shelf is not an option.

- Recommend if the cam stays off. Plate A.
- Plate B only after a lens center exists. Until then Plate B is a drawing.
- Do not keep the 48 by 40 shelf as a third option. That is the bug.

## Leave alone in this cut

Front hinge. Floor slots. Side length. A printed grille. A lens hole with no datum.
