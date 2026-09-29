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
        "snap_clearance_per_side_mm = 0.25",
        "snap_return_angle_deg = 45.0",
    ):
        assert name in source
        assert name.split(" = ")[0] in spec
