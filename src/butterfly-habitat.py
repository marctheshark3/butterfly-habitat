"""Butterfly habitat. Print flat. Clamp bought mesh between two plates. Stand the frames up.

Photo is style only. Size is the ~200 mm cube picked for one P1S bed.
Mesh is bought no-see-um or organza, not a printed grille. Screws are M3 clearance.
ESP shelf is a cable ledge, not a measured camera pocket.
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
cable_hole_diameter_mm = 8.0
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


def build_side():
    """Frame. Printed grille screws to the border. Mesh is not zip-tied."""
    w = outer_width_mm
    d = outer_height_mm
    h = panel_thickness_mm
    border = wall_thickness_mm
    frame = _frame(w, d, h, border)
    r = mounting_hole_diameter_mm / 2.0
    frame = _cut_holes(frame, _border_holes(w, d, border / 2.0), r, h + 0.6)
    return _one(frame, "side")


def build_top():
    """Mesh roof frame. Camera ledge is a solid corner, not a shelf over the hole."""
    w = outer_width_mm
    d = outer_depth_mm
    h = panel_thickness_mm
    border = wall_thickness_mm
    ledge_w = 48.0
    ledge_d = 40.0
    plate = _box(0, 0, 0, w, d, h)
    ledge = _box(0, 0, h - OVERLAP, ledge_w, ledge_d, 4.0)
    plate = plate.fuse(ledge)
    # Window starts clear of the ledge so nothing bridges the opening.
    inner = _box(ledge_w, border, -0.3, w - ledge_w - border, d - 2 * border, h + 0.6)
    plate = plate.cut(inner)
    r = mounting_hole_diameter_mm / 2.0
    plate = _cut_holes(plate, _roof_screw_holes(), r, h + 5.0)
    cable_r = cable_hole_diameter_mm / 2.0
    plate = plate.cut(_hole(ledge_w / 2.0, ledge_d / 2.0, cable_r, h + 5.0))
    return _one(plate, "top")


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


def _roof_screw_holes():
    """Screws that miss the camera ledge. Same list on the roof frame and the roof clamp."""
    return [
        (6.0, 194.0),
        (100.0, 6.0),
        (100.0, 194.0),
        (194.0, 6.0),
        (194.0, 100.0),
        (194.0, 194.0),
    ]


def build_clamp_wall():
    """Clamp ring for a side frame. Print three. Mesh is bought, not this part."""
    w = outer_width_mm
    d = outer_height_mm
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
    """Clamp ring for the roof window. Ledge pokes through a loose cutout. Not a camera fit."""
    w = outer_width_mm
    d = outer_depth_mm
    h = clamp_thickness_mm
    border = wall_thickness_mm
    ledge_w = 48.0
    ledge_d = 40.0
    plate = _box(0, 0, 0, w, d, h)
    plate = plate.cut(_box(-0.3, -0.3, -0.3, ledge_w + 1.0, ledge_d + 1.0, h + 0.6))
    plate = plate.cut(_box(ledge_w, border, -0.3, w - ledge_w - border, d - 2 * border, h + 0.6))
    r = mounting_hole_diameter_mm / 2.0
    plate = _cut_holes(plate, _roof_screw_holes(), r, h + 0.6)
    return _one(plate, "clamp-roof")


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


def export_assembly(solids):
    """Viewer compound only. Not a print body. Not an occupancy proof."""
    floor_h = panel_thickness_mm
    wall = _stand(solids["habitat-back"])
    wall_h = wall.BoundBox.ZLength
    mesh = _stand(solids["habitat-clamp-wall"])
    side = _yaw(_stand(solids["habitat-left"]), 90)
    side_mesh = _yaw(_stand(solids["habitat-clamp-wall"]), 90)
    door = _stand(solids["habitat-door-frame"])
    door_mesh = _stand(solids["habitat-clamp-door"])
    placed = [
        solids["habitat-base"],
        _at(wall, 0, outer_depth_mm - wall.BoundBox.YLength, floor_h),
        _at(mesh, 0, outer_depth_mm + 1.0, floor_h),
        _at(_stand(solids["habitat-front"]), 0, 0, floor_h),
        _at(door, (outer_width_mm - door.BoundBox.XLength) / 2.0, -door.BoundBox.YLength, floor_h + 14.0),
        _at(door_mesh, (outer_width_mm - door_mesh.BoundBox.XLength) / 2.0, -door.BoundBox.YLength - door_mesh.BoundBox.YLength - 1.0, floor_h + 14.0),
        _at(side, 0, floor_h, floor_h),
        _at(side_mesh, -side_mesh.BoundBox.XLength - 1.0, floor_h, floor_h),
        _at(side, outer_width_mm - side.BoundBox.XLength, floor_h, floor_h),
        _at(side_mesh, outer_width_mm + 1.0, floor_h, floor_h),
        _at(solids["habitat-top"], 0, 0, floor_h + wall_h),
        _at(solids["habitat-clamp-roof"], 0, 0, floor_h + wall_h + solids["habitat-top"].BoundBox.ZLength + 1.0),
    ]
    out = ROOT / "assembly"
    out.mkdir(parents=True, exist_ok=True)
    compound = Part.makeCompound(placed)
    compound.exportStep(str(out / "habitat-assembly.step"))
    print(f"assembly: {out / 'habitat-assembly.step'}", flush=True)


def build():
    stl_dir = ROOT / "stl"
    step_dir = ROOT / "step"
    stl_dir.mkdir(parents=True, exist_ok=True)
    step_dir.mkdir(parents=True, exist_ok=True)
    parts = [
        ("habitat-base", build_base),
        ("habitat-top", build_top),
        ("habitat-back", build_side),
        ("habitat-left", build_side),
        ("habitat-right", build_side),
        ("habitat-front", build_front),
        ("habitat-door-frame", build_door_frame),
        ("habitat-clamp-wall", build_clamp_wall),
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


build()
