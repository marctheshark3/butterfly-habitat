> Historical reference. Superseded for printing and assembly by [revision 0.11](../README.md).

# Cube snap coupon

Mesh screws stay mesh screws. The snap coupon is parked. Do not print another pair. Both printed pairs opened a gap after the click. The tighter one was only harder to start.

The drop-in is now in the cube CAD. Spec 0.9.0. Four screws, front and back, into solid corner pads. Not a print. Not fit-tested.

The 0.30 pair was tougher to start and still wiggled. The 0.40 pair started easier and wiggled the same way. Side clearance was not the wiggle. The hook was sitting 3 mm past the lip, so the plates could pull apart that far after they clicked.

- `stl/habitat-snap-tongue-coupon.stl`
- `stl/habitat-snap-pocket-coupon.stl`

The plates are 8 mm, not 6. A 6 mm plate cannot keep a 1.6 mm floor, a 0.8 mm hook, and a 1.6 mm roof. The wall gate failed the 6 mm pocket at a 1.25 mm floor. Do not copy this stack onto a 6 mm frame. The cube mill, later, thickens the pocket locally or turns the hook into the border plane.

Push the tongue into the open end of the pocket. Latched, the tongue is straight. The hook sits in the relief. The lip blocks a straight pull.

## If the click is wrong

Two numbers changed because the last reprint proved the side gap was the wrong knob. Do not reprint the cube.

- Still opens a gap once in: `snap_pocket_depth_mm` to 0.3. Do not tighten the side gap.
- Arm stays bent when the plates are together: `snap_pocket_depth_mm` to 0.8. Do not deepen the hook.
- Will not start: `snap_clearance_per_side_mm` to 0.45. One change.
- Straight pull opens it: `snap_return_angle_deg` to 60.
- Thumb cannot open it: `snap_return_angle_deg` to 40. Do not go to 90.
- Crack at the root after ten cycles: the tongue was printed in the orientation that worked. Do not thicken it on the first crack.

## Screws, later

Not this reprint. The eight M3 holes stay the mesh pinch. They do not join the cube. The four base holes inset 10 mm come out into air. Do not use them.

When the rattle is gone, the cube gets 4 screws, one at each bottom corner, wall into base. The roof stays snaps only, so it still lifts off. If a vertical seam still rattles, 4 more, one mid-height per corner. Ceiling is 8 cube screws. Not eight per frame.

Source stays `assumed` until that rattle is gone. `fit.required` stays false. That block is the door's 2 mm slop.

## Leave alone

Plate A. Door lips. Drain slots. The eight M3 pinch holes. Side length. Lens hole.
