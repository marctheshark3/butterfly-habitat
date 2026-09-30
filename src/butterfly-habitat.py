"""Butterfly habitat. Print flat. Clamp bought mesh between two plates. Stand the frames up.

Photo is style only. Size is the ~200 mm cube picked for one P1S bed.
Mesh is bought no-see-um or organza, not a printed grille. Screws are M3 clearance.
Roof is Plate A. No shelf. No cable hole. The XIAO pod is not cut.
Cube snap is a coupon only. It is not cut into the cube. Drop-in grooves are a viewer section, not a print.
"""
from __future__ import annotations

import math
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
snap_arm_length_mm = 14.0
snap_arm_thickness_mm = 2.0
snap_arm_width_mm = 8.0
snap_root_fillet_mm = 1.0
snap_undercut_mm = 0.8
snap_lead_angle_deg = 30.0
snap_return_angle_deg = 45.0
# 0.30 started harder and still wiggled. 0.40 integrated. The wiggle was not the side gap.
snap_clearance_per_side_mm = 0.4
# 3.0 let the plates pull apart 3 mm before the hook caught. 0.5 is the residual.
snap_pocket_depth_mm = 0.5
snap_count_per_edge = 2
# Drop-in. 0.5 mm is total play, not per side. Not fit-tested.
groove_play_mm = 0.5
groove_depth_mm = 4.0
groove_fence_mm = 3.0
groove_roof_depth_mm = 3.0
corner_pad_mm = 18.0
joint_pilot_diameter_mm = 2.8
joint_screw_count = 4
joint_boss_mm = 10.0
joint_slot_depth_mm = 4.0
side_span_mm = outer_depth_mm - 2.0 * (groove_fence_mm + groove_play_mm / 2.0 + panel_thickness_mm)

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


def _groove_width():
    return panel_thickness_mm + groove_play_mm


def _screw_inset():
    """Hole center from the outer cube edge. Center of the 10 mm boss."""
    return groove_fence_mm + groove_play_mm / 2.0 + joint_boss_mm / 2.0


def _joint_screw_xy(w, d):
    y_front = groove_fence_mm + groove_play_mm / 2.0 + joint_boss_mm / 2.0
    outer = groove_fence_mm + groove_play_mm / 2.0
    y_back = d - outer - panel_thickness_mm + joint_boss_mm / 2.0
    xs = (12.0, w - 12.0)
    return [(xs[0], y_front), (xs[1], y_front), (xs[0], y_back), (xs[1], y_back)]


def _base_grooves(w, d, h):
    gw = _groove_width()
    fence = groove_fence_mm
    pad = corner_pad_mm
    z0 = h - groove_depth_mm
    depth = groove_depth_mm + 0.4
    span_x = w - 2 * pad
    span_y = d - 2 * pad
    return [
        _box(pad, fence, z0, span_x, gw, depth),
        _box(pad, d - fence - gw, z0, span_x, gw, depth),
        _box(fence, pad, z0, gw, span_y, depth),
        _box(w - fence - gw, pad, z0, gw, span_y, depth),
    ]


def _roof_grooves(w, d):
    gw = _groove_width()
    fence = groove_fence_mm
    depth = groove_roof_depth_mm + 0.2
    return [
        _box(fence, fence, -0.2, w - 2 * fence, gw, depth),
        _box(fence, d - fence - gw, -0.2, w - 2 * fence, gw, depth),
        _box(fence, fence, -0.2, gw, d - 2 * fence, depth),
        _box(w - fence - gw, fence, -0.2, gw, d - 2 * fence, depth),
    ]


def _foot_tongue(w, d, h):
    pad = corner_pad_mm
    return _box(pad, d - OVERLAP, 0, w - 2 * pad, groove_depth_mm + OVERLAP, h)


def _hole_along_y(x, y, z, radius, length):
    return Part.makeCylinder(radius, length, App.Vector(x, y, z), App.Vector(0, 1, 0))


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
    plate = plate.cut(Part.makeCompound(_base_grooves(w, d, h)))
    plate = _cut_holes(plate, _joint_screw_xy(w, d), joint_pilot_diameter_mm / 2.0, h + 0.6)
    return _one(plate, "base")


def build_side(span_x=None, span_y=None, joint="slot"):
    """Frame. slot = back. tongue = the shorter sides. Foot drops into the base."""
    w = outer_width_mm if span_x is None else span_x
    d = outer_height_mm if span_y is None else span_y
    h = panel_thickness_mm
    border = wall_thickness_mm
    frame = _frame(w, d, h, border)
    r = mounting_hole_diameter_mm / 2.0
    frame = _cut_holes(frame, _border_holes(w, d, border / 2.0), r, h + 0.6)
    frame = frame.fuse(_foot_tongue(w, d, h))
    if joint == "tongue":
        reach = joint_slot_depth_mm - groove_play_mm / 2.0
        tongue_h = d - 2 * corner_pad_mm
        frame = frame.fuse(_box(-reach, corner_pad_mm, 0, reach + OVERLAP, tongue_h, h))
        frame = frame.fuse(_box(w - OVERLAP, corner_pad_mm, 0, reach + OVERLAP, tongue_h, h))
    else:
        gw = _groove_width()
        fence = groove_fence_mm
        slot_h = d - corner_pad_mm
        frame = frame.cut(_box(fence - 0.2, 0, -0.2, gw + 0.4, slot_h, joint_slot_depth_mm + 0.2))
        frame = frame.cut(_box(w - fence - gw, 0, -0.2, gw + 0.4, slot_h, joint_slot_depth_mm + 0.2))
        frame = _back_screw_bosses(frame, w, d, h)
    return _one(frame, "side")


def _back_screw_bosses(plate, w, d, h):
    """Boss sits on the print-top face. Hole is vertical once the panel stands."""
    radius = mounting_hole_diameter_mm / 2.0
    for x in (12.0, w - 12.0):
        plate = plate.fuse(_box(x - 3.0, d - 12.0, 0, 6.0, 12.0, joint_boss_mm))
        plate = plate.cut(_hole_along_y(x, d - 14.0, 5.0, radius, 16.0))
    return plate


def _front_screw_bosses(plate, w, d, h):
    extra = joint_boss_mm - h
    radius = mounting_hole_diameter_mm / 2.0
    for x in (12.0, w - 12.0):
        plate = plate.fuse(_box(x - 3.0, d - 12.0, h - OVERLAP, 6.0, 12.0, extra + OVERLAP))
        plate = plate.cut(_hole_along_y(x, d - 14.0, 5.0, radius, 16.0))
    return plate


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
    frame = frame.cut(Part.makeCompound(_roof_grooves(w, d)))
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
    plate = plate.fuse(_foot_tongue(w, d, h))
    gw = _groove_width()
    fence = groove_fence_mm
    slot_h = d - corner_pad_mm
    plate = plate.cut(_box(fence - 0.2, 0, h - joint_slot_depth_mm, gw + 0.4, slot_h, joint_slot_depth_mm + 0.4))
    plate = plate.cut(_box(w - fence - gw, 0, h - joint_slot_depth_mm, gw + 0.4, slot_h, joint_slot_depth_mm + 0.4))
    plate = _front_screw_bosses(plate, w, d, h)
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


def _snap_layout():
    """Coupon pair. Pocket depth is how far the hook sits past the lip, not the floor.

    A 3 mm floor plus a 0.8 mm hook does not fit in a 6 mm plate, and a 1.6 mm
    floor plus that hook does not either. The coupon plate is 8 mm. The hook
    points +Z so the coupon prints without supports.
    """
    plate_w = 40.0
    plate_d = 20.0
    # 6 mm cannot keep a 1.6 mm floor, the 0.8 mm hook, and a 1.6 mm roof.
    plate_h = 8.0
    root = 2.0
    gap = snap_clearance_per_side_mm
    floor = 2.0
    arm_x0 = plate_w - root
    arm_x1 = arm_x0 + snap_arm_length_mm
    arm_y0 = (plate_d - snap_arm_width_mm) / 2.0
    arm_z0 = floor + gap
    arm_z1 = arm_z0 + snap_arm_thickness_mm
    lead_run = snap_undercut_mm / math.tan(math.radians(snap_lead_angle_deg))
    ret_run = snap_undercut_mm / math.tan(math.radians(snap_return_angle_deg))
    hook_peak_x = arm_x1 - lead_run
    hook_back_x = hook_peak_x - ret_run
    hook_peak_z = arm_z1 + snap_undercut_mm
    lip_inner = (hook_back_x - plate_w) - snap_pocket_depth_mm
    slot_end = (arm_x1 - plate_w) + 0.6
    relief_top = hook_peak_z + gap
    return {
        "plate_w": plate_w,
        "plate_d": plate_d,
        "plate_h": plate_h,
        "arm_x0": arm_x0,
        "arm_x1": arm_x1,
        "arm_y0": arm_y0,
        "arm_z0": arm_z0,
        "arm_z1": arm_z1,
        "hook_peak_x": hook_peak_x,
        "hook_back_x": hook_back_x,
        "hook_peak_z": hook_peak_z,
        "lead_run": lead_run,
        "ret_run": ret_run,
        "lip_inner": lip_inner,
        "slot_end": slot_end,
        "relief_top": relief_top,
        "channel_y0": arm_y0 - gap,
        "channel_z0": arm_z0 - gap,
        "channel_w": snap_arm_width_mm + 2.0 * gap,
        "channel_h": snap_arm_thickness_mm + 2.0 * gap,
    }


def _hook_wedge(x_tip, y0, z_top, width, rise, lead_run, ret_run):
    """Triangular hook. Base bites into the arm so the fuse is one solid."""
    z_base = z_top - OVERLAP
    p0 = App.Vector(x_tip, y0, z_base)
    p1 = App.Vector(x_tip - lead_run, y0, z_top + rise)
    p2 = App.Vector(x_tip - lead_run - ret_run, y0, z_base)
    wire = Part.makePolygon([p0, p1, p2, p0])
    face = Part.Face(wire)
    return face.extrude(App.Vector(0, width, 0))


def _fillet_tension_root(shape, x_plane, z_top):
    """Fillet the tension-side root. Bend is +Z, so the top edge carries it."""
    picked = []
    for edge in shape.Edges:
        bb = edge.BoundBox
        on_plane = abs(bb.Center.x - x_plane) < 0.2 and bb.XLength < 0.4
        at_top = abs(bb.Center.z - z_top) < 0.2
        long = bb.YLength > 4.0
        if on_plane and at_top and long:
            picked.append(edge)
    if not picked:
        raise SystemExit("snap fillet: no tension root edge")
    try:
        return shape.makeFillet(snap_root_fillet_mm, picked)
    except Exception as exc:
        raise SystemExit(f"snap fillet failed: {exc}") from exc


def build_snap_tongue_coupon():
    """40 by 20 by 8 plate plus a flat tongue. Hook points up. One solid."""
    lay = _snap_layout()
    if lay["relief_top"] >= lay["plate_h"]:
        raise SystemExit("hook breaks the top face of the coupon plate")
    plate = _box(0, 0, 0, lay["plate_w"], lay["plate_d"], lay["plate_h"])
    arm = _box(
        lay["arm_x0"],
        lay["arm_y0"],
        lay["arm_z0"],
        snap_arm_length_mm,
        snap_arm_width_mm,
        snap_arm_thickness_mm,
    )
    hook = _hook_wedge(
        lay["arm_x1"],
        lay["arm_y0"],
        lay["arm_z1"],
        snap_arm_width_mm,
        snap_undercut_mm,
        lay["lead_run"],
        lay["ret_run"],
    )
    shape = plate.fuse(arm).fuse(hook)
    shape = _fillet_tension_root(shape, lay["plate_w"], lay["arm_z1"])
    return _one(shape, "snap-tongue-coupon")


def build_snap_pocket_coupon():
    """Matching plate. Slot open on -X. Lip blocks the hook. Far face stays closed."""
    lay = _snap_layout()
    if lay["lip_inner"] < 1.0 or lay["slot_end"] > lay["plate_w"] - 4.0:
        raise SystemExit(
            f"pocket layout lip={lay['lip_inner']:.2f} slot={lay['slot_end']:.2f}"
        )
    if lay["channel_z0"] < 1.6 or (lay["plate_h"] - lay["relief_top"]) < 1.6:
        raise SystemExit(
            f"pocket skin under 1.6 mm floor={lay['channel_z0']:.2f} "
            f"roof={lay['plate_h'] - lay['relief_top']:.2f}"
        )
    plate = _box(0, 0, 0, lay["plate_w"], lay["plate_d"], lay["plate_h"])
    channel = _box(
        -0.3,
        lay["channel_y0"],
        lay["channel_z0"],
        lay["slot_end"] + 0.3,
        lay["channel_w"],
        lay["channel_h"],
    )
    relief = _box(
        lay["lip_inner"],
        lay["channel_y0"],
        lay["channel_z0"],
        lay["slot_end"] - lay["lip_inner"] + 0.3,
        lay["channel_w"],
        lay["relief_top"] - lay["channel_z0"],
    )
    plate = plate.cut(channel).cut(relief)
    return _one(plate, "snap-pocket-coupon")


def probe_snap_coupon():
    """Latched pose. Tongue straight. Hook in the relief. Lip blocks the pull-out."""
    tongue = build_snap_tongue_coupon()
    pocket = build_snap_pocket_coupon()
    lay = _snap_layout()
    errors = []
    if len(tongue.Solids) != 1 or len(pocket.Solids) != 1:
        errors.append("expected 1 solid on each coupon")

    def inside(shape, x, y, z):
        return shape.isInside(App.Vector(x, y, z), 0.05, True)

    if not inside(pocket, 39.0, 10.0, 3.0):
        errors.append("pocket far point 39,10,3 is open")
    if inside(pocket, 1.0, 10.0, lay["arm_z0"] + 0.5):
        errors.append("entrance channel is solid")
    if not inside(pocket, 1.0, 10.0, lay["plate_h"] - 0.8):
        errors.append("lip above the entrance is missing")
    if not inside(tongue, lay["hook_peak_x"], 10.0, lay["hook_peak_z"] - 0.05):
        errors.append("hook peak is missing on the tongue")

    placed = pocket.copy()
    placed.translate(App.Vector(lay["plate_w"], 0, 0))
    plates = _box(0, 0, 0, lay["plate_w"], lay["plate_d"], lay["plate_h"]).common(
        _box(lay["plate_w"], 0, 0, lay["plate_w"], lay["plate_d"], lay["plate_h"])
    )
    if plates.Volume > 0.01:
        errors.append(f"plates intersect {plates.Volume:.3f} mm3")
    hit = tongue.common(placed).Volume
    if hit > 1.0:
        errors.append(f"latched solids intersect {hit:.2f} mm3")
    peak = App.Vector(lay["hook_peak_x"], 10.0, lay["hook_peak_z"] - 0.05)
    if placed.isInside(peak, 0.05, True):
        errors.append("hook peak is crushed in the pocket")
    lip = App.Vector(lay["plate_w"] + lay["lip_inner"] / 2.0, 10.0, lay["hook_peak_z"] - 0.15)
    if not placed.isInside(lip, 0.05, True):
        errors.append("lip does not block the hook height")
    if errors:
        print("SNAP-COUPON: FAIL", flush=True)
        for item in errors:
            print(f"SNAP-COUPON: {item}", flush=True)
        raise SystemExit(1)
    print("SNAP-COUPON: PASS", flush=True)


def mill_snap_coupon():
    """Write the coupon pair only. Leave the cube STLs alone."""
    stl_dir = ROOT / "stl"
    step_dir = ROOT / "step"
    stl_dir.mkdir(parents=True, exist_ok=True)
    step_dir.mkdir(parents=True, exist_ok=True)
    made = {
        "habitat-snap-tongue-coupon": build_snap_tongue_coupon(),
        "habitat-snap-pocket-coupon": build_snap_pocket_coupon(),
    }
    for name, solid in made.items():
        # 0.05 mm chords. A 0.2 mm chord eats a 0.4 mm gap.
        write_stl(solid, stl_dir / f"{name}.stl", linear=0.05, angular=0.2)
        solid.exportStep(str(step_dir / f"{name}.step"))
        bb = solid.BoundBox
        print(
            f"{name}: {[round(bb.XLength, 2), round(bb.YLength, 2), round(bb.ZLength, 2)]}",
            flush=True,
        )
    print("SNAP-COUPON: MILLED", flush=True)


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


def write_stl(shape, path, linear=0.2, angular=0.6):
    import MeshPart

    mesh = MeshPart.meshFromShape(
        Shape=shape, LinearDeflection=linear, AngularDeflection=angular
    )
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
    gap = groove_play_mm / 2.0
    outer = groove_fence_mm + gap
    place_z = (panel_thickness_mm - groove_depth_mm) + gap + groove_depth_mm
    wall = _stand_panel(solids["habitat-back"], outer_height_mm)
    wall_h = outer_height_mm
    mesh = _stand(solids["habitat-clamp-wall"])
    side = _yaw(_stand_panel(solids["habitat-left"], outer_height_mm), 90)
    side_mesh = _yaw(_stand(solids["habitat-clamp-side"]), 90)
    door = _stand(solids["habitat-door-frame"])
    door_mesh = _stand(solids["habitat-clamp-door"])
    door_x = (outer_width_mm - door.BoundBox.XLength) / 2.0
    door_y = outer
    door_z = place_z + 14.0
    top = solids["habitat-top"]
    top_z = place_z + wall_h - groove_roof_depth_mm + gap
    top_face = top_z + top.BoundBox.ZLength
    back_outer = outer_depth_mm
    side_sheet = _yaw(_stand(_cloth_blank(side_span_mm, outer_height_mm)), 90)
    wall_sheet = _stand(_cloth_blank(outer_width_mm, outer_height_mm))
    door_sheet = _stand(_cloth_blank(door.BoundBox.XLength, door.BoundBox.ZLength))
    roof_sheet = _cloth_blank(outer_width_mm, outer_depth_mm)
    sheets = [
        _at(wall_sheet, inset, _gap_center(back_outer, back_outer + 1.0), place_z + inset),
        _at(door_sheet, door_x + inset, _gap_center(door_y - 1.0, door_y), door_z + inset),
        _at(side_sheet, _gap_center(-1.0, 0.0), place_z + inset, place_z + inset),
        _at(side_sheet, _gap_center(outer_width_mm, outer_width_mm + 1.0), place_z + inset, place_z + inset),
        _at(roof_sheet, inset, inset, _gap_center(top_face, top_face + 1.0)),
    ]
    back_y = outer_depth_mm - outer - panel_thickness_mm
    back_placed = _at(wall, 0, back_y, place_z)
    reach = joint_slot_depth_mm - groove_play_mm / 2.0
    side_y = outer + panel_thickness_mm - reach
    print(f"seat back_y={back_y:.2f} place_z={place_z:.2f} side_y={side_y:.2f} side_span={side_span_mm:.1f}", flush=True)
    left_placed = _at(side, outer, side_y, place_z)
    right_placed = _at(side, outer_width_mm - outer - side.BoundBox.XLength, side_y, place_z)
    for name, shape in (("left", left_placed), ("right", right_placed)):
        print(f"check {name} bb {[round(shape.BoundBox.XMin,1), round(shape.BoundBox.YMin,1), round(shape.BoundBox.ZMin,1), round(shape.BoundBox.XMax,1), round(shape.BoundBox.YMax,1), round(shape.BoundBox.ZMax,1)]}", flush=True)
        hit = shape.common(back_placed).Volume
        print(f"{name} hit {hit:.1f}", flush=True)
        if hit > 25.0:
            raise SystemExit(f"{name} intersects the back: {hit:.1f} mm3")
    placed = [
        solids["habitat-base"],
        back_placed,
        _at(mesh, 0, back_y + panel_thickness_mm + 1.0, place_z),
        _at(_stand_panel(solids["habitat-front"], outer_height_mm), 0, outer, place_z),
        _at(door, door_x, door_y, door_z),
        _at(door_mesh, door_x, door_y - 4.0, door_z),
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
    lip_point = App.Vector(door_x + 1.0, door_y + 1.0, door_z + 40.0)
    if placed[3].isInside(lip_point, 0.05, True):
        raise SystemExit("seated door border is inside the front lip")
    out = ROOT / "assembly"
    out.mkdir(parents=True, exist_ok=True)
    compound = Part.makeCompound(placed)
    compound.exportStep(str(out / "habitat-assembly.step"))
    print(f"assembly: {out / 'habitat-assembly.step'} sheets={len(sheets)}", flush=True)


def build_drop_groove_section():
    """Corner section. Walls drop in. Roof lip stops the lift. Not a print body."""
    play = 0.5
    panel = panel_thickness_mm
    groove_w = panel + play
    fence = 3.0
    depth = 4.0
    span = 80.0
    floor_z = panel - depth
    gap = play / 2.0
    side_x = fence + gap
    side_y = fence + gap
    side_z = floor_z + gap
    side_top = 46.75
    side_y1 = span - fence - groove_w - gap
    tongue_y1 = span - fence - gap - 0.25

    base = _box(0, 0, 0, span, span, panel)
    base = base.cut(_box(fence, fence, floor_z, groove_w, span - 2 * fence, depth + 0.4))
    base = base.cut(_box(fence, span - fence - groove_w, floor_z, span - 2 * fence, groove_w, depth + 0.4))
    base = _one(base, "drop-base")

    body = _box(side_x, side_y, side_z, panel, side_y1 - side_y, side_top - side_z)
    tongue = _box(side_x, side_y1 - 0.4, 8.0, panel, tongue_y1 - (side_y1 - 0.4), 34.0)
    side = _one(body.fuse(tongue), "drop-side")

    back_y = span - fence - groove_w + gap
    back = _box(side_x, back_y, side_z, span - fence - gap - side_x, panel, side_top - side_z)
    slot = _box(fence - 0.2, back_y - 0.4, 7.5, groove_w + 0.4, panel + 1.2, 35.2)
    back = _one(back.cut(slot), "drop-back")

    roof_z = 44.0
    roof = _box(0, 0, roof_z, span, span, panel)
    roof = roof.cut(_box(fence, fence, roof_z - 0.2, groove_w, side_y1 - fence + 0.6, 3.2))
    roof = roof.cut(_box(fence, span - fence - groove_w, roof_z - 0.2, span - 2 * fence, groove_w, 3.2))
    roof = _one(roof, "drop-roof")
    return base, side, back, roof


def _inside(shape, x, y, z):
    return shape.isInside(App.Vector(x, y, z), 0.05, True)


def mill_drop_groove_view():
    """Inspector section only. Does not write a cube STL."""
    base, side, back, roof = build_drop_groove_section()
    if _inside(base, 6.25, 20.0, 4.0):
        raise SystemExit("side foot is inside the base")
    if not _inside(base, 6.25, 20.0, 1.0):
        raise SystemExit("groove cut the 2 mm floor")
    if not _inside(side, 6.25, 20.0, 4.0):
        raise SystemExit("side foot is not the side wall")
    if _inside(base, 40.0, 73.75, 4.0):
        raise SystemExit("back foot is inside the base")
    if not _inside(back, 40.0, 73.75, 4.0):
        raise SystemExit("back foot missed its groove")
    if _inside(back, 6.25, 73.75, 20.0):
        raise SystemExit("side tongue is inside the back wall")
    if not _inside(side, 6.25, 73.75, 20.0):
        raise SystemExit("side tongue missed the slot")
    if not _inside(back, 20.0, 73.75, 20.0):
        raise SystemExit("slot ate the back wall")
    if _inside(roof, 6.25, 20.0, 46.75):
        raise SystemExit("wall top is inside the roof")
    if not _inside(roof, 6.25, 20.0, 48.5):
        raise SystemExit("roof lip does not stop the lift")
    pairs = (("base", "side", base, side), ("base", "back", base, back), ("side", "back", side, back), ("side", "roof", side, roof), ("back", "roof", back, roof))
    for name_a, name_b, shape_a, shape_b in pairs:
        hit = shape_a.common(shape_b).Volume
        if hit > 1.0:
            raise SystemExit(f"{name_a} intersects {name_b}: {hit:.1f} mm3")
    out = ROOT / "renders" / "groove-view"
    out.mkdir(parents=True, exist_ok=True)
    Part.makeCompound([base, side, back, roof]).exportStep(str(out / "habitat-drop-groove.step"))
    print("GROOVE-VIEW: PASS play=0.5 depth=4 floor=2", flush=True)


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
        ("habitat-left", lambda: build_side(side_span_mm, outer_height_mm, joint="tongue")),
        ("habitat-right", lambda: build_side(side_span_mm, outer_height_mm, joint="tongue")),
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
        "habitat-left": build_side(side_span_mm, outer_height_mm, joint="tongue"),
        "habitat-right": build_side(side_span_mm, outer_height_mm, joint="tongue"),
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


def _stand_panel(shape, span_y):
    """Print Y=span is the foot. Print Z=0 stays standing Y=0. A boss may hang past that."""
    s = shape.copy()
    s.rotate(App.Vector(0, 0, 0), App.Vector(1, 0, 0), -90)
    s.translate(App.Vector(0, 0, span_y))
    return s


def probe_cube_groove():
    """In memory. Does not write a cube STL."""
    w = outer_width_mm
    d = outer_depth_mm
    base = build_base()
    front = build_front()
    back = build_side()
    left = build_side(side_span_mm, outer_height_mm, joint="tongue")
    top = build_top()
    if len(_joint_screw_xy(w, d)) != joint_screw_count:
        raise SystemExit("screw count drifted")
    if not _inside(base, 100.0, 6.25, 1.0):
        raise SystemExit("groove cut the 2 mm floor")
    if _inside(base, 100.0, 6.25, 4.0):
        raise SystemExit("front groove missing")
    if _inside(base, 54.0, 42.0, 3.0):
        raise SystemExit("drain slot filled")
    if _inside(base, 10.0, 10.0, 3.0):
        raise SystemExit("air hole filled")
    sx, sy = _joint_screw_xy(w, d)[0]
    if _inside(base, sx, sy, 3.0):
        raise SystemExit("pilot is not a hole")
    if not _inside(base, sx + 4.0, sy, 3.0):
        raise SystemExit("pilot missed the solid pad")
    if _inside(top, 40.0, 6.25, 1.0):
        raise SystemExit("roof groove missing")
    if not _inside(top, 40.0, 6.25, 5.0):
        raise SystemExit("roof groove ate the skin")
    if _inside(top, 6.0, 6.0, 3.0):
        raise SystemExit("roof mesh hole filled")
    if not front.isInside(App.Vector(17.0, 100.0, 7.5), 0.05, True):
        raise SystemExit("door lip cut")
    gap = groove_play_mm / 2.0
    outer = groove_fence_mm + gap
    place_z = (panel_thickness_mm - groove_depth_mm) + gap + groove_depth_mm
    front_s = _at(_stand_panel(front, outer_height_mm), 0, outer, place_z)
    back_y = d - outer - panel_thickness_mm
    back_s = _at(_stand_panel(back, outer_height_mm), 0, back_y, place_z)
    side = _stand_panel(left, outer_height_mm)
    side.rotate(App.Vector(0, 0, 0), App.Vector(0, 0, 1), 90)
    side.translate(App.Vector(outer + panel_thickness_mm, outer + panel_thickness_mm, place_z))
    for name, shape in (("front", front_s), ("back", back_s), ("side", side)):
        common = shape.common(base)
        hit = common.Volume
        if hit > 5.0:
            bb = common.BoundBox
            raise SystemExit(
                f"{name} intersects the base: {hit:.1f} mm3 "
                f"at {[round(bb.XMin, 1), round(bb.YMin, 1), round(bb.ZMin, 1), round(bb.XMax, 1), round(bb.YMax, 1), round(bb.ZMax, 1)]}"
            )
    if _inside(front_s, sx, sy, 10.0):
        raise SystemExit("front screw hole is not open")
    if not _inside(front_s, sx + 4.0, sy, 10.0):
        raise SystemExit("front screw boss missed the seat")
    if _inside(front_s, sx, sy, 4.0):
        raise SystemExit("front screw hole is not open into the pad")
    print("CUBE-GROOVE: PASS screws=4 play=0.5", flush=True)


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
elif os.environ.get("HABITAT_SNAP_PROBE") == "1":
    probe_snap_coupon()
elif os.environ.get("HABITAT_SNAP_ONLY") == "1":
    mill_snap_coupon()
elif os.environ.get("HABITAT_GROOVE_VIEW") == "1":
    mill_drop_groove_view()
elif os.environ.get("HABITAT_CUBE_GROOVE_PROBE") == "1":
    try:
        probe_cube_groove()
    except SystemExit as exc:
        print(f"PROBE-FAIL: {exc}", flush=True)
        raise
else:
    build()
