"""Butterfly habitat. Print flat. Clamp bought mesh between two plates. Stand the frames up.

Photo is style only. Size is the ~200 mm cube picked for one P1S bed.
Mesh is bought no-see-um or organza, not a printed grille. Screws are M3 clearance.
Roof is Plate A. No shelf. No cable hole. The XIAO pod is not cut.
"""
from __future__ import annotations

import os
from pathlib import Path

import FreeCAD as App
import Part

ROOT = Path(__file__).resolve().parent.parent

# PRINT_SPEC assignments. Every listed dimension is `name =` here.
outer_width_mm = 200.0
outer_depth_mm = 200.0
outer_height_mm = 200.0
wall_thickness_mm = 12.0
panel_thickness_mm = 6.0
door_opening_w_mm = 170.0
door_opening_h_mm = 180.0
door_clearance_mm = 2.0
rail_width_mm = 4.0
rail_height_mm = 3.0
mounting_hole_diameter_mm = 3.6
drain_slot_width_mm = 4.0
drain_slot_length_mm = 28.0
clamp_thickness_mm = 3.0
cam_board_l_mm = 21.0
cam_board_w_mm = 17.8
cam_board_h_mm = 15.0
cam_clearance_per_side_mm = 0.4
cam_aperture_diameter_mm = 6.0
cam_pod_wall_mm = 2.0
cam_usb_slot_w_mm = 9.0
cam_usb_slot_h_mm = 3.5
# Task 4 fills these from the Seeed DXF. Sentinel stops the pod cut.
cam_offsets_ready = False
cam_lens_dx_mm = 0.0
cam_lens_dy_mm = 0.0
cam_usb_on_short_edge = True
# Viewer stand-in only. Not a measured fabric. Not an STL. A 0.3 mm
# sheet is under the print minimum, so it never goes in the parts list.
bought_sheet_thickness_mm = 0.3
bought_sheet_inset_mm = 2.0
side_span_mm = outer_depth_mm - 2.0 * panel_thickness_mm

OVERLAP = 0.6


def _box(x, y, z, w, d, h):
    return Part.makeBox(w, d, h, App.Vector(x, y, z))


def _hole(x, y, r, depth):
    return Part.makeCylinder(r, depth, App.Vector(x, y, -0.3))


def _cut_holes(shape, centers, radius, depth):
    if not centers:
        return shape
    cuts = [_hole(x, y, radius, depth) for x, y in centers]
    return shape.cut(Part.makeCompound(cuts))


def _border_holes(w, d, inset):
    """Eight screws: corners and mid-edges. Inset stays on the solid border."""
    return [
        (inset, inset),
        (w - inset, inset),
        (inset, d - inset),
        (w - inset, d - inset),
        (w / 2.0, inset),
        (w / 2.0, d - inset),
        (inset, d / 2.0),
        (w - inset, d / 2.0),
    ]


def _clamp_ring(w, d, holes):
    """Second plate. Bought mesh goes between this and the frame. Same screws."""
    h = clamp_thickness_mm
    border = wall_thickness_mm
    plate = _frame(w, d, h, border)
    r = mounting_hole_diameter_mm / 2.0
    return _cut_holes(plate, holes, r, h + 0.6)


def _one(shape, name):
    shape = shape.removeSplitter()
    n = len(shape.Solids)
    if n != 1:
        raise SystemExit(f"{name}: expected 1 solid, got {n}")
    return shape


def _frame(w, d, h, border):
    """Picture frame. Inner cut overlaps the outer box in Z so the cut is clean."""
    outer = _box(0, 0, 0, w, d, h)
    inner = _box(border, border, -0.3, w - 2 * border, d - 2 * border, h + 0.6)
    return outer.cut(inner)


def _corner_holes(w, d, inset):
    return [
        (inset, inset),
        (w - inset, inset),
        (inset, d - inset),
        (w - inset, d - inset),
    ]


def build_base():
    """Solid floor. Slots drain a patio rain surprise. One shell."""
    w = outer_width_mm
    d = outer_depth_mm
    h = panel_thickness_mm
    plate = _box(0, 0, 0, w, d, h)
    slot_w = drain_slot_width_mm
    slot_l = drain_slot_length_mm
    slots = []
    for x in (40.0, 132.0):
        for y in (40.0, 132.0):
            slots.append(_box(x, y, -0.3, slot_l, slot_w, h + 0.6))
    plate = plate.cut(Part.makeCompound(slots))
    r = mounting_hole_diameter_mm / 2.0
    plate = _cut_holes(plate, _corner_holes(w, d, 10.0), r, h + 0.6)
    return _one(plate, "base")


def build_side(span_x=None, span_y=None):
    """Frame. span_x is the print-flat width. Sides are shorter than the back."""
    w = outer_width_mm if span_x is None else span_x
    d = outer_height_mm if span_y is None else span_y
    h = panel_thickness_mm
    border = wall_thickness_mm
    frame = _frame(w, d, h, border)
    r = mounting_hole_diameter_mm / 2.0
    frame = _cut_holes(frame, _border_holes(w, d, border / 2.0), r, h + 0.6)
    return _one(frame, "side")


def build_top():
    """Mesh roof. Full frame. No shelf. No cable hole. Lift-off is the hatch."""
    if cam_offsets_ready:
        raise SystemExit("Plate A has no lens hole. cam_offsets_ready must stay false.")
    w = outer_width_mm
    d = outer_depth_mm
    h = panel_thickness_mm
    border = wall_thickness_mm
    frame = _frame(w, d, h, border)
    r = mounting_hole_diameter_mm / 2.0
    frame = _cut_holes(frame, _border_holes(w, d, border / 2.0), r, h + 0.6)
    return _one(frame, "top")


def build_front():
    """Front frame. Lips overlap the plate, then the window is cut.

    Lips are fused before the window cut so they share volume with the plate.
    A multiFuse of face-touching guides is what hung FreeCAD last time.
    """
    w = outer_width_mm
    d = outer_height_mm
    h = panel_thickness_mm
    door_w = door_opening_w_mm
    door_h = door_opening_h_mm
    x0 = (w - door_w) / 2.0
    y0 = (d - door_h) / 2.0
    lip = rail_width_mm
    lip_h = rail_height_mm

    plate = _box(0, 0, 0, w, d, h)
    # Each lip overlaps the still-solid plate by OVERLAP in XY and in Z.
    left = _box(x0 - OVERLAP, y0 - OVERLAP, h - OVERLAP, lip + OVERLAP, door_h + 2 * OVERLAP, lip_h + OVERLAP)
    right = _box(x0 + door_w - lip, y0 - OVERLAP, h - OVERLAP, lip + OVERLAP, door_h + 2 * OVERLAP, lip_h + OVERLAP)
    bottom = _box(x0, y0 - OVERLAP, h - OVERLAP, door_w, lip + OVERLAP, lip_h + OVERLAP)
    plate = plate.fuse(left).fuse(right).fuse(bottom)

    window = _box(x0, y0, -0.3, door_w, door_h, h + 0.6)
    plate = plate.cut(window)

    r = mounting_hole_diameter_mm / 2.0
    # Borders are 15 mm on X and 10 mm on Y. Keep holes inside the border.
    holes = [(8.0, 5.0), (w - 8.0, 5.0), (8.0, d - 5.0), (w - 8.0, d - 5.0)]
    plate = _cut_holes(plate, holes, r, h + lip_h + 1.0)
    return _one(plate, "front")


def build_clamp_wall(span_x=None, span_y=None):
    """Clamp ring. Back uses the full frame. Sides use the shorter span."""
    w = outer_width_mm if span_x is None else span_x
    d = outer_height_mm if span_y is None else span_y
    border = wall_thickness_mm
    return _one(_clamp_ring(w, d, _border_holes(w, d, border / 2.0)), "clamp-wall")


def build_door_frame():
    """Sliding carrier. Clamp ring screws to this. Loose in the front lips, not a tuned drawer."""
    door_w = door_opening_w_mm
    door_h = door_opening_h_mm
    gap = door_clearance_mm
    fw = door_w - 2.0 * gap
    fd = door_h - 2.0 * gap - rail_width_mm
    h = panel_thickness_mm
    border = wall_thickness_mm
    frame = _frame(fw, fd, h, border)
    r = mounting_hole_diameter_mm / 2.0
    frame = _cut_holes(frame, _border_holes(fw, fd, border / 2.0), r, h + 0.6)
    return _one(frame, "door-frame")


def build_clamp_door():
    """Clamp ring for the sliding frame. Same footprint, same holes."""
    door_w = door_opening_w_mm
    door_h = door_opening_h_mm
    gap = door_clearance_mm
    fw = door_w - 2.0 * gap
    fd = door_h - 2.0 * gap - rail_width_mm
    border = wall_thickness_mm
    return _one(_clamp_ring(fw, fd, _border_holes(fw, fd, border / 2.0)), "clamp-door")


def build_clamp_roof():
    """Clamp ring for the roof. Closed. No notch. Same screws as the roof frame."""
    w = outer_width_mm
    d = outer_depth_mm
    border = wall_thickness_mm
    return _one(_clamp_ring(w, d, _border_holes(w, d, border / 2.0)), "clamp-roof")


def probe_plate_a():
    """Plate A checks. No STL write. The shelf bug fails closed."""
    top = build_top()
    clamp = build_clamp_roof()
    errors = []
    if cam_offsets_ready:
        errors.append("cam_offsets_ready must stay false on Plate A")
    tb = top.BoundBox
    cb = clamp.BoundBox
    if [round(tb.XLength, 2), round(tb.YLength, 2), round(tb.ZLength, 2)] != [200.0, 200.0, 6.0]:
        errors.append(f"top bbox {[tb.XLength, tb.YLength, tb.ZLength]}")
    if [round(cb.XLength, 2), round(cb.YLength, 2), round(cb.ZLength, 2)] != [200.0, 200.0, 3.0]:
        errors.append(f"clamp bbox {[cb.XLength, cb.YLength, cb.ZLength]}")
    if len(top.Solids) != 1 or len(clamp.Solids) != 1:
        errors.append("expected 1 solid on top and on clamp-roof")

    def inside(shape, x, y, z):
        return shape.isInside(App.Vector(x, y, z), 0.05, True)

    if inside(top, 30.0, 20.0, 3.0):
        errors.append("window point 30,20,3 is solid")
    if inside(top, 6.0, 6.0, 8.0):
        errors.append("shelf still stands at 6,6,8")
    if not inside(top, 6.0, 2.0, 3.0):
        errors.append("border point 6,2,3 is missing")
    if not inside(clamp, 6.0, 2.0, 1.0):
        errors.append("clamp corner 6,2,1 is open")
    if inside(clamp, 100.0, 100.0, 1.0):
        errors.append("clamp window 100,100,1 is solid")
    if abs(top.Volume - 53655.42) > 1.0:
        errors.append(f"top volume {top.Volume:.2f}")
    if abs(clamp.Volume - 26827.71) > 1.0:
        errors.append(f"clamp volume {clamp.Volume:.2f}")
    if errors:
        print("PLATE-A: FAIL", flush=True)
        for item in errors:
            print(f"PLATE-A: {item}", flush=True)
        raise SystemExit(1)
    print("PLATE-A: PASS", flush=True)


def write_stl(shape, path):
    import MeshPart

    mesh = MeshPart.meshFromShape(Shape=shape, LinearDeflection=0.2, AngularDeflection=0.6)
    mesh.write(str(path))


def _stand(shape):
    """Print-flat panel (thickness +Z) becomes a wall (thickness +Y, height +Z)."""
    s = shape.copy()
    s.rotate(App.Vector(0, 0, 0), App.Vector(1, 0, 0), -90)
    bb = s.BoundBox
    s.translate(App.Vector(-bb.XMin, -bb.YMin, -bb.ZMin))
    return s


def _yaw(shape, deg):
    s = shape.copy()
    s.rotate(App.Vector(0, 0, 0), App.Vector(0, 0, 1), deg)
    bb = s.BoundBox
    s.translate(App.Vector(-bb.XMin, -bb.YMin, -bb.ZMin))
    return s


def _at(shape, x, y, z):
    s = shape.copy()
    s.translate(App.Vector(x, y, z))
    return s


def _cloth_blank(span_x, span_y):
    """Cloth rule. Past the window, over the screws, inside the outer edge."""
    inset = bought_sheet_inset_mm
    return _box(0, 0, 0, span_x - 2 * inset, span_y - 2 * inset, bought_sheet_thickness_mm)


def _gap_center(near, far):
    return (near + far) / 2.0 - bought_sheet_thickness_mm / 2.0


def export_assembly(solids):
    """Viewer compound only. Not a print body. Not an occupancy proof.

    Bought sheets sit in the 1 mm clamp gaps. They are not STLs.
    """
    floor_h = panel_thickness_mm
    inset = bought_sheet_inset_mm
    wall = _stand(solids["habitat-back"])
    wall_h = wall.BoundBox.ZLength
    mesh = _stand(solids["habitat-clamp-wall"])
    side = _yaw(_stand(solids["habitat-left"]), 90)
    side_mesh = _yaw(_stand(solids["habitat-clamp-side"]), 90)
    door = _stand(solids["habitat-door-frame"])
    door_mesh = _stand(solids["habitat-clamp-door"])
    door_x = (outer_width_mm - door.BoundBox.XLength) / 2.0
    door_z = floor_h + 14.0
    top = solids["habitat-top"]
    top_z = floor_h + wall_h
    top_face = top_z + top.BoundBox.ZLength
    back_outer = outer_depth_mm
    side_sheet = _yaw(_stand(_cloth_blank(side_span_mm, outer_height_mm)), 90)
    wall_sheet = _stand(_cloth_blank(outer_width_mm, outer_height_mm))
    door_sheet = _stand(_cloth_blank(door.BoundBox.XLength, door.BoundBox.ZLength))
    roof_sheet = _cloth_blank(outer_width_mm, outer_depth_mm)
    sheets = [
        _at(wall_sheet, inset, _gap_center(back_outer, back_outer + 1.0), floor_h + inset),
        _at(door_sheet, door_x + inset, _gap_center(-1.0, 0.0), door_z + inset),
        _at(side_sheet, _gap_center(-1.0, 0.0), floor_h + inset, floor_h + inset),
        _at(side_sheet, _gap_center(outer_width_mm, outer_width_mm + 1.0), floor_h + inset, floor_h + inset),
        _at(roof_sheet, inset, inset, _gap_center(top_face, top_face + 1.0)),
    ]
    back_placed = _at(wall, 0, outer_depth_mm - wall.BoundBox.YLength, floor_h)
    left_placed = _at(side, 0, floor_h, floor_h)
    right_placed = _at(side, outer_width_mm - side.BoundBox.XLength, floor_h, floor_h)
    for name, shape in (("left", left_placed), ("right", right_placed)):
        hit = shape.common(back_placed).Volume
        if hit > 0.01:
            raise SystemExit(f"{name} intersects the back: {hit:.1f} mm3")
    placed = [
        solids["habitat-base"],
        back_placed,
        _at(mesh, 0, outer_depth_mm + 1.0, floor_h),
        _at(_stand(solids["habitat-front"]), 0, 0, floor_h),
        _at(door, door_x, 0, door_z),
        _at(door_mesh, door_x, -4.0, door_z),
        left_placed,
        _at(side_mesh, -side_mesh.BoundBox.XLength - 1.0, floor_h, floor_h),
        right_placed,
        _at(side_mesh, outer_width_mm + 1.0, floor_h, floor_h),
        _at(top, 0, 0, top_z),
        _at(solids["habitat-clamp-roof"], 0, 0, top_face + 1.0),
        *sheets,
    ]
    def _clear(sheet, other):
        bb = sheet.BoundBox
        point = App.Vector(bb.Center.x, bb.Center.y, bb.Center.z)
        return not other.isInside(point, 0.05, True)

    for sheet in sheets:
        for solid in placed[:12]:
            if not _clear(sheet, solid):
                raise SystemExit("bought sheet center is inside a printed solid")
    lip_point = App.Vector(door_x + 1.0, 3.0, door_z + 40.0)
    if placed[3].isInside(lip_point, 0.05, True):
        raise SystemExit("seated door border is inside the front lip")
    out = ROOT / "assembly"
    out.mkdir(parents=True, exist_ok=True)
    compound = Part.makeCompound(placed)
    compound.exportStep(str(out / "habitat-assembly.step"))
    print(f"assembly: {out / 'habitat-assembly.step'} sheets={len(sheets)}", flush=True)


def export_door_seat(solids):
    """Seated door plus a cloth stand-in. Viewer only. Same seat as the assembly view."""
    floor_h = panel_thickness_mm
    inset = bought_sheet_inset_mm
    door = _stand(solids["habitat-door-frame"])
    door_x = (outer_width_mm - door.BoundBox.XLength) / 2.0
    door_z = 20.0
    sheet = _stand(_cloth_blank(door.BoundBox.XLength, door.BoundBox.ZLength))
    placed = [
        _at(_stand(solids["habitat-front"]), 0, 0, floor_h),
        _at(door, door_x, 0, door_z),
        _at(_stand(solids["habitat-clamp-door"]), door_x, -4.0, door_z),
        _at(sheet, door_x + inset, _gap_center(-1.0, 0.0), door_z + inset),
    ]
    center = placed[3].BoundBox.Center
    for solid in placed[:3]:
        if solid.isInside(App.Vector(center.x, center.y, center.z), 0.05, True):
            raise SystemExit("door sheet center is inside a printed solid")
    out = ROOT / "renders"
    out.mkdir(parents=True, exist_ok=True)
    Part.makeCompound(placed).exportStep(str(out / "door-seat.step"))
    print(f"door-seat: {out / 'door-seat.step'}", flush=True)


def build():
    stl_dir = ROOT / "stl"
    step_dir = ROOT / "step"
    stl_dir.mkdir(parents=True, exist_ok=True)
    step_dir.mkdir(parents=True, exist_ok=True)
    parts = [
        ("habitat-base", build_base),
        ("habitat-top", build_top),
        ("habitat-back", build_side),
        ("habitat-left", lambda: build_side(side_span_mm, outer_height_mm)),
        ("habitat-right", lambda: build_side(side_span_mm, outer_height_mm)),
        ("habitat-front", build_front),
        ("habitat-door-frame", build_door_frame),
        ("habitat-clamp-wall", build_clamp_wall),
        ("habitat-clamp-side", lambda: build_clamp_wall(side_span_mm, outer_height_mm)),
        ("habitat-clamp-door", build_clamp_door),
        ("habitat-clamp-roof", build_clamp_roof),
    ]
    solids = {}
    results = {}
    for name, fn in parts:
        solid = fn()
        solids[name] = solid
        write_stl(solid, stl_dir / f"{name}.stl")
        solid.exportStep(str(step_dir / f"{name}.step"))
        bb = solid.BoundBox
        results[name] = {
            "volume_cm3": round(solid.Volume / 1000.0, 3),
            "bbox_mm": [round(bb.XLength, 2), round(bb.YLength, 2), round(bb.ZLength, 2)],
            "solids": len(solid.Solids),
        }
        print(f"{name}: {results[name]}", flush=True)
    export_assembly(solids)
    print(f"BUTTERFLY-HABITAT: {len(results)} parts", flush=True)
    return results


def load_printed():
    solids = {}
    names = [
        "habitat-base",
        "habitat-top",
        "habitat-back",
        "habitat-left",
        "habitat-right",
        "habitat-front",
        "habitat-door-frame",
        "habitat-clamp-wall",
        "habitat-clamp-side",
        "habitat-clamp-door",
        "habitat-clamp-roof",
    ]
    for name in names:
        solids[name] = Part.read(str(ROOT / "step" / f"{name}.step"))
    return solids


def mill_sides():
    """Rewrite only the shorter sides and their clamp. Leave the other STLs."""
    stl_dir = ROOT / "stl"
    step_dir = ROOT / "step"
    made = {
        "habitat-left": build_side(side_span_mm, outer_height_mm),
        "habitat-right": build_side(side_span_mm, outer_height_mm),
        "habitat-clamp-side": build_clamp_wall(side_span_mm, outer_height_mm),
    }
    for name, solid in made.items():
        write_stl(solid, stl_dir / f"{name}.stl")
        solid.exportStep(str(step_dir / f"{name}.step"))
        bb = solid.BoundBox
        print(
            f"{name}: {[round(bb.XLength, 2), round(bb.YLength, 2), round(bb.ZLength, 2)]}",
            flush=True,
        )
    others = [
        "habitat-base",
        "habitat-top",
        "habitat-back",
        "habitat-front",
        "habitat-door-frame",
        "habitat-clamp-wall",
        "habitat-clamp-door",
        "habitat-clamp-roof",
    ]
    solids = {name: Part.read(str(step_dir / f"{name}.step")) for name in others}
    solids.update(made)
    export_assembly(solids)


def mill_roof():
    """Rewrite only the roof frame and its clamp. Leave hinge, floor, and sides."""
    stl_dir = ROOT / "stl"
    step_dir = ROOT / "step"
    made = {
        "habitat-top": build_top(),
        "habitat-clamp-roof": build_clamp_roof(),
    }
    for name, solid in made.items():
        write_stl(solid, stl_dir / f"{name}.stl")
        solid.exportStep(str(step_dir / f"{name}.step"))
        bb = solid.BoundBox
        print(
            f"{name}: {[round(bb.XLength, 2), round(bb.YLength, 2), round(bb.ZLength, 2)]}",
            flush=True,
        )
    others = [
        "habitat-base",
        "habitat-back",
        "habitat-left",
        "habitat-right",
        "habitat-front",
        "habitat-door-frame",
        "habitat-clamp-wall",
        "habitat-clamp-side",
        "habitat-clamp-door",
    ]
    solids = {name: Part.read(str(step_dir / f"{name}.step")) for name in others}
    solids.update(made)
    export_assembly(solids)


if os.environ.get("HABITAT_SIDES_ONLY") == "1":
    mill_sides()
elif os.environ.get("HABITAT_ASSEMBLY_ONLY") == "1":
    loaded = load_printed()
    export_assembly(loaded)
    export_door_seat(loaded)
elif os.environ.get("HABITAT_ROOF_PROBE") == "1":
    probe_plate_a()
elif os.environ.get("HABITAT_ROOF_ONLY") == "1":
    mill_roof()
else:
    build()
