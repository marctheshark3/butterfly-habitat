"""Stable assembly IDs and recessed marking geometry for the 0.11 candidate.

Importing this module does not require FreeCAD or change any files. Label
placements use the existing STL print coordinates; all print rotations stay
unchanged. The original, already-printed candidate is kept separately.
"""
PART_IDS = {
    'base': 'A1',
    'front': 'B1', 'rail-left': 'B2', 'rail-right': 'B3', 'keeper': 'B4',
    'back': 'C1', 'back-clamp': 'C2',
    'left': 'D1', 'left-clamp': 'D2',
    'right': 'E1', 'right-clamp': 'E2',
    'door': 'F1', 'door-clamp': 'F2',
    'roof': 'G1', 'roof-clamp': 'G2',
}
DEPTH = 0.4
STROKE = 0.8
MIN_BACKING = 1.6
VARIANT = 'engraved-ids-1'

# Stroke centre lines: 2.4 mm wide, 4 mm high, plus 0.4 mm end caps.
# Geometry rather than a system font keeps exports reproducible everywhere.
GLYPHS = {
    'A': [[(0, 0), (.4, 4), (2, 4), (2.4, 0)], [(.2, 1.8), (2.2, 1.8)]],
    'B': [[(0, 0), (0, 4), (1.8, 4), (2.4, 3.5), (2.4, 2.5), (1.8, 2),
           (0, 2)], [(1.8, 2), (2.4, 1.5), (2.4, .5), (1.8, 0), (0, 0)]],
    'C': [[(2.4, 4), (0, 4), (0, 0), (2.4, 0)]],
    'D': [[(0, 0), (0, 4), (1.6, 4), (2.4, 3.2), (2.4, .8), (1.6, 0), (0, 0)]],
    'E': [[(2.4, 4), (0, 4), (0, 0), (2.4, 0)], [(0, 2), (2, 2)]],
    'F': [[(0, 0), (0, 4), (2.4, 4)], [(0, 2), (2, 2)]],
    'G': [[(2.4, 4), (0, 4), (0, 0), (2.4, 0), (2.4, 2), (1.3, 2)]],
    '1': [[(.4, 3), (1.2, 4), (1.2, 0)], [(0, 0), (2.4, 0)]],
    '2': [[(0, 4), (2.4, 4), (2.4, 2.5), (0, 0), (2.4, 0)]],
    '3': [[(0, 4), (2.4, 4), (2.4, 0), (0, 0)], [(.8, 2), (2.4, 2)]],
    '4': [[(0, 4), (0, 2), (2.4, 2)], [(2.4, 4), (2.4, 0)]],
}

# Origin, text-right, text-up, outward normal, and a human-readable location.
TOP = ((1, 0, 0), (0, 1, 0), (0, 0, 1))
BOTTOM = ((1, 0, 0), (0, -1, 0), (0, 0, -1))
LOCATIONS = {
    'base': ((90, 176, 8), *TOP, 'inside floor, near the back edge'),
    'front': ((70, 178, 8), *TOP, 'inside face of the lower border'),
    'back': ((60, 9, 8), *TOP, 'inside face of the upper border'),
    'left': ((60, 8, 8), *TOP, 'inside face of the upper border'),
    'right': ((60, 8, 8), *TOP, 'inside face of the upper border'),
    'roof': ((68, 12, 8), *TOP, 'underside border, clear of the locating grooves'),
    'door': ((55, 8, 0), *BOTTOM, 'rear face of the lower border'),
    'back-clamp': ((55, 6, 3), *TOP, 'outward face of the lower border'),
    'left-clamp': ((55, 6, 3), *TOP, 'outward face of the lower border'),
    'right-clamp': ((55, 6, 3), *TOP, 'outward face of the lower border'),
    'roof-clamp': ((55, 6, 3), *TOP, 'upper face of the border'),
    'door-clamp': ((50, 6, 3), *TOP, 'outward face, beside the finger grip'),
    'rail-left': ((0, 92, 6), (0, -1, 0), (0, 0, 1), (-1, 0, 0), 'outer side, halfway up'),
    'rail-right': ((29, 84, 6), (0, 1, 0), (0, 0, 1), (1, 0, 0), 'outer side, halfway up'),
    'keeper': ((14, 6.5, 0), *BOTTOM, 'outer face of the latch arm'),
}


def engrave(assembly, cad):
    """Cut IDs into exposed faces; reject weak, misplaced, or partial labels."""
    import math
    import FreeCAD as App
    import Part
    v = App.Vector
    printed = {name for name, item in assembly.items.items() if item.kind == 'printed'}
    if printed != set(PART_IDS) or printed != set(LOCATIONS):
        raise ValueError('The ID inventory must exactly match the printed parts.')
    report = {}
    for name, code in PART_IDS.items():
        strokes = []
        for index, char in enumerate(code):
            for path in GLYPHS[char]:
                for start, end in zip(path, path[1:]):
                    x, y = start[0] + index * 3.8, start[1]
                    dx, dy = end[0] - start[0], end[1] - start[1]
                    length = math.hypot(dx, dy)
                    # Round end caps join corners cleanly and keep stroke width.
                    bar = Part.makeBox(length, STROKE, DEPTH + .01, v(0, -STROKE / 2, -DEPTH))
                    bar.rotate(v(), v(0, 0, 1), math.degrees(math.atan2(dy, dx)))
                    bar.translate(v(x, y, 0))
                    strokes += [bar, Part.makeCylinder(STROKE / 2, DEPTH + .01, v(x, y, -DEPTH)),
                                Part.makeCylinder(STROKE / 2, DEPTH + .01,
                                                  v(end[0] + index * 3.8, end[1], -DEPTH))]
        text = strokes[0].multiFuse(strokes[1:]).removeSplitter()
        origin, x, y, normal, description = LOCATIONS[name]
        location = cad['transform'](origin, x, y, normal)
        guard = cad['placed'](cad['box'](-.6, -.6, -DEPTH - MIN_BACKING, 7.4, 5.2,
                                       DEPTH + MIN_BACKING), location)
        item = assembly.items[name]
        original = cad['print_shape'](item)
        if abs(original.common(guard).Volume - guard.Volume) > 1e-5:
            raise ValueError(f'{code} {name}: label needs a clear face and 1.6 mm backing')
        cutter = cad['placed'](text, location)
        expected_removed = text.Volume * DEPTH / (DEPTH + .01)
        removed = original.common(cutter)
        if abs(removed.Volume - expected_removed) > 1e-5:
            raise ValueError(f'{code} {name}: engraving is not completely inside its face')
        labeled = original.cut(cutter).removeSplitter()
        if not labeled.isValid() or not labeled.isClosed() or len(labeled.Solids) != 1:
            raise ValueError(f'{code} {name}: engraving damaged the solid')
        if labeled.cut(original).Volume > 1e-6:
            raise ValueError(f'{code} {name}: ID added material beyond the original surface')
        for field in ('XMin', 'YMin', 'ZMin', 'XMax', 'YMax', 'ZMax'):
            if abs(getattr(original.BoundBox, field) - getattr(labeled.BoundBox, field)) > 1e-6:
                raise ValueError(f'{code} {name}: ID changed the part envelope')
        # Recover the original assembly coordinates without altering its print rotation.
        rotation = App.Placement(v(), item.print_rotation)
        bounds = cad['placed'](item.shape, rotation).BoundBox
        rotation.Base = v(-bounds.XMin, -bounds.YMin, -bounds.ZMin)
        item.shape = cad['placed'](labeled, rotation.inverse())
        report[name] = dict(id=code, location=description, depth_mm=DEPTH, stroke_mm=STROKE,
                            minimum_backing_checked_mm=MIN_BACKING, removed_mm3=removed.Volume,
                            print_origin_mm=origin, text_right=x, text_up=y, outward_normal=normal,
                            original_volume_mm3=original.Volume, labeled_volume_mm3=labeled.Volume,
                            envelope_unchanged=True, material_added_mm3=0)
    return report
