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
    assert "revision: 0.8.0" in spec
    assert "cam_board_l_mm" in spec
    assert "value_mm: 21.0" in spec

SOURCE = ROOT / "src" / "butterfly-habitat.py"


def test_source_is_plate_a():
    source = SOURCE.read_text(encoding="utf-8")
    assert "ledge_w = 48.0" not in source
    assert "49.0, 41.0" not in source
    assert "cable_hole_diameter_mm" not in source
    assert "def _roof_screw_holes" not in source
    assert "cam_offsets_ready = False" in source
    assert "cam_lens_dx_mm = 0.0" in source
    assert "cam_lens_dy_mm = 0.0" in source
    assert "cam_board_l_mm = 21.0" in source
    assert "cam_aperture_diameter_mm /" not in source
    assert "HABITAT_ROOF_PROBE" in source
    assert "HABITAT_ROOF_ONLY" in source
    assert "def build_front" in source
    assert "def build_base" in source
    assert "drain_slot_width_mm = 4.0" in source


README = ROOT / "README.md"
DRAWING = ROOT / "sketches" / "roof-plates" / "index.html"


def test_readme_and_drawing_match_plate_a():
    readme = README.read_text(encoding="utf-8")
    drawing = DRAWING.read_text(encoding="utf-8")
    assert "cable ledge" not in readme.lower()
    assert "8 mm hole" not in readme
    assert "Plate A" in readme
    assert "Live model is Plate A." in drawing
    assert "Live model unchanged" not in drawing
    assert "Neither is cut into the model." not in drawing
