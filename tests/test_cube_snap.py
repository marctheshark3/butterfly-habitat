"""Cube snap is a new joint. Mesh screws stay mesh screws."""
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SOURCE = ROOT / "src" / "butterfly-habitat.py"
SPEC = ROOT / "docs" / "PRINT_SPEC.yaml"


def test_pinch_holes_remain():
    source = SOURCE.read_text(encoding="utf-8")
    assert "def _border_holes" in source
    assert "mounting_hole_diameter_mm = 3.6" in source
    assert "def build_clamp_roof" in source
    assert "cam_offsets_ready = False" in source


def test_snap_parameters_present():
    source = SOURCE.read_text(encoding="utf-8")
    spec = SPEC.read_text(encoding="utf-8")
    for name in (
        "snap_arm_length_mm = 14.0",
        "snap_arm_thickness_mm = 2.0",
        "snap_arm_width_mm = 8.0",
        "snap_undercut_mm = 0.8",
        "snap_clearance_per_side_mm = 0.4",
        "snap_return_angle_deg = 45.0",
    ):
        assert name in source
        assert name.split(" = ")[0] in spec


def test_snap_stays_off_the_cube():
    source = SOURCE.read_text(encoding="utf-8")
    top = source.split("def build_top", 1)[1].split("def build_front", 1)[0]
    assert "snap_" not in top
    assert "def build_snap_tongue_coupon" in source
    assert "HABITAT_SNAP_PROBE" in source
    assert "HABITAT_SNAP_ONLY" in source
    base = source.split("def build_base", 1)[1].split("def build_side", 1)[0]
    assert "slide_play" not in base
    assert "def mill_drop_groove_view" in source
    assert "HABITAT_GROOVE_VIEW" in source
