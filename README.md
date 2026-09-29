# Butterfly habitat

Printable observation box for kids. About 200 mm on a side. Fits a 256 mm bed.

The listing photo was a style reference, not a measurement. Do not scale this to that box.

## What you print

PETG. 0.4 mm nozzle. 0.2 mm layers. Flat on the bed. No supports.

- `habitat-base` ×1 — solid floor, drain slots
- `habitat-top` ×1 — roof frame, camera ledge, cable hole
- `habitat-back`, `habitat-left`, `habitat-right` ×1 each — same frame
- `habitat-front` ×1 — door opening and loose slide lips
- `habitat-door-frame` ×1 — sliding carrier
- `habitat-clamp-wall` ×3 — second plate, screws to the three side frames
- `habitat-clamp-door` ×1 — second plate, screws to the door frame
- `habitat-clamp-roof` ×1 — second plate, screws to the roof

STLs are in `stl/`. Editable source is `src/butterfly-habitat.py`. Contract is `docs/PRINT_SPEC.yaml`.

## Mesh

Do not print the screen. A 0.4 mm nozzle cannot make a hole smaller than a newly hatched caterpillar. A monarch first instar is about 0.5–1.5 mm wide at the body. Buy a sheet. No-see-um or organza still works. Woven wire works only if the listing opening is 0.4 mm or smaller. A photo is not that number. Do not use 1/8 in hardware cloth.

For cloth, cut a sheet bigger than the window and smaller than the outer edge. Lay it on the frame. Screw the clamp plate on top. The screws pierce the fabric. That is the cloth joint.

For wire, do not pierce the sheet. Cut it larger than the window and smaller than the screw circle. Tuck the raw edge under the clamp. Screws stay plastic-to-plastic.

## Screws

M3 clearance holes are 3.6 mm (ISO 273 coarse). Use M3 bolts and nylock nuts. This is not a snap fit and it is not a tested press.

The door lifts out the open top. Two millimetres of clearance per side, on purpose.

## Camera

The roof corner is still a cable ledge with an 8 mm hole. It is not a pocket for a measured board. The XIAO ESP32-S3 Sense pod is deferred. The official expansion-board DXF has no lens circle, so the hole was not moved.

## License

MIT. See `LICENSE`.
