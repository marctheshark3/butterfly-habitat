import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SOURCE = (ROOT / "src" / "butterfly-habitat.py").read_text()
SPEC = (ROOT / "docs" / "PRINT_SPEC.yaml").read_text()


def _assign(name):
    match = re.search(rf"^{name} = ([0-9.]+)$", SOURCE, re.M)
    assert match, name
    return float(match.group(1))


def _fn(name, nxt):
    return SOURCE.split(f"def {name}", 1)[1].split(f"def {nxt}", 1)[0]


def test_revision_is_0_10():
    assert "revision: 0.10.0" in SPEC


def test_door_opening_matches_the_front_border():
    opening = _assign("door_opening_w_mm")
    border = _assign("front_border_x_mm")
    assert opening == 152.0
    assert border == 24.0
    assert (200.0 - opening) / 2.0 == border
    assert "value_mm: 152.0" in SPEC


def test_assigned_screw_clears_both_mesh_patterns():
    screw = _assign("joint_screw_x_mm")
    span = _assign("joint_boss_span_mm")
    half = span / 2.0
    assert screw == 17.0
    assert span == 10.0
    assert abs(screw - 8.0) - 3.6 >= 1.6
    assert abs(screw - 6.0) - 3.6 >= 1.6
    assert (screw - half) - (8.0 + 1.8) >= 1.6
    assert _assign("front_border_x_mm") - (screw + half) >= 1.6
    assert (screw - half) - (6.0 + 1.8) >= 1.6
    assert _assign("back_border_x_mm") - (screw + half) >= 1.6
    assert screw + 1.8 < _assign("back_border_x_mm")
    fn = _fn("_joint_screw_xy", "_base_grooves")
    assert "joint_screw_x_mm" in fn
    assert "12.0" not in fn


def test_back_holes_do_not_chase_the_new_border():
    assert _assign("back_hole_inset_mm") == 6.0
    assert _assign("back_border_x_mm") == 24.0
    assert _assign("wall_thickness_mm") == 12.0
    assert "hole_inset=back_hole_inset_mm" in SOURCE
    assert "border=back_border_x_mm" in SOURCE


def test_roof_groove_runs_through_the_corners():
    fn = _fn("_roof_grooves", "_foot_tongue")
    assert "w - 2 * fence" not in fn
    assert "w + 0.4" in fn


def test_placement_lives_in_one_function():
    assert SOURCE.count("place_z = (panel_thickness_mm - groove_depth_mm) + gap + groove_depth_mm") == 1
    body = _fn("seat_layout", "export_assembly")
    assert "place_z = (panel_thickness_mm - groove_depth_mm) + gap + groove_depth_mm" in body
    assert SOURCE.count("layout = seat_layout()") >= 3


def test_probe_measures_the_ligament():
    body = _fn("probe_seat", "probe_cube_groove")
    assert "front ligament" in body
    assert "1.6" in body
    assert "SEAT: PASS screws=4 play=0.5 opening=152" in body


def test_snap_stays_off_the_cube():
    top = _fn("build_top", "build_front")
    assert "snap_" not in top


def test_door_lip_sample_follows_the_opening():
    # x=17 was the old lip center: 15 mm margin + half of the 4 mm rail.
    # After the border moves to 24, that point is air at z=7.5. The screw
    # is also x=17. Do not aim the lip sample at the screw.
    assert "App.Vector(17.0, 100.0, 7.5)" not in SOURCE
    assert "App.Vector(26.0, 100.0, 7.5)" in SOURCE
    assert "door lip cut" in SOURCE
