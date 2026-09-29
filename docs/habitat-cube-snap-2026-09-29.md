# Cube snap coupon

Mesh screws stay mesh screws. This coupon is the cube joint, and it is not cut into the cube.

Print both. PETG. 0.2 mm layers. 4 walls. Flat on the bed. Hook up. No supports.

- `stl/habitat-snap-tongue-coupon.stl`
- `stl/habitat-snap-pocket-coupon.stl`

The plates are 8 mm, not 6. A 6 mm plate cannot keep a 1.6 mm floor, a 0.8 mm hook, and a 1.6 mm roof. The wall gate failed the 6 mm pocket at a 1.25 mm floor. Do not copy this stack onto a 6 mm frame. The cube mill, later, thickens the pocket locally or turns the hook into the border plane.

Push the tongue into the open end of the pocket. Latched, the tongue is straight. The hook sits in the relief. The lip blocks a straight pull.

## If the click is wrong

One change. Reprint the coupon. Do not reprint the cube.

- Will not start: `snap_lead_angle_deg` to 25, or `snap_clearance_per_side_mm` to 0.30.
- Stays bent when latched: `snap_pocket_depth_mm` up by 0.3. Do not deepen the hook.
- Straight pull opens it: `snap_return_angle_deg` to 60.
- Thumb cannot open it: `snap_return_angle_deg` to 40. Do not go to 90.
- Crack at the root after ten cycles: check that the tongue was printed flat, hook up, before changing thickness.

When the click is right, change those dimension sources in `docs/PRINT_SPEC.yaml` from `assumed` to `fit-tested`. Until then `fit.required` stays false. That block is the door's 2 mm slop. Marking this snap tested before a click would be a lie.

## Leave alone

Plate A. Door lips. Drain slots. The eight M3 pinch holes. Side length. Lens hole.
