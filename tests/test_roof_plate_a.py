"""Plate A roof contract. Host python. Do not import FreeCAD."""
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
BRIEF = ROOT / "docs" / "habitat-roof-plates-cam-and-plain-2026-09-29.md"
SPEC = ROOT / "docs" / "PRINT_SPEC.yaml"


def test_spec_matches_plate_a():
    brief = BRIEF.read_text(encoding="utf-8")
    spec = SPEC.read_text(encoding="utf-8")
    assert "Pick: Plate A. Camera stays off. The 48 by 40 shelf is not an option." in brief
    assert "Lens looks down" not in spec
    assert "roof-corner pocket" not in spec
    assert "cable_hole_diameter" not in spec
    assert "revision: 0.4.0" in spec
    assert "cam_board_l_mm" in spec
    assert "value_mm: 21.0" in spec
