> Historical reference. Superseded for printing and assembly by [revision 0.11](../README.md).

# XIAO ESP32-S3 Sense lens datum

The lens circle is not identifiable in the official Seeed DXF. Offsets were not recorded. `cam_offsets_ready` stays false. The pod was not cut.

Source: https://files.seeedstudio.com/wiki/SeeedStudio-XIAO-ESP32S3/res/XIAO_ESP32S3_ExpBoard_v1.0_top.dxf

File: `XIAO_ESP32S3_ExpBoard_v1.0_top.dxf`, 160474 bytes, SHA-256 `4039bf565f6bece5209c60877c804c1f0bd2507173ec9905d5eb8c7ec79949cc`, AutoCAD R11/R12 (`AC1009`).

Provenance: datasheet drawing. Not measured on our board.

## Findings

- `cam_lens_dx_mm`: not recorded. No lens circle.
- `cam_lens_dy_mm`: not recorded. No lens circle.
- USB-C edge: not identifiable. No USB label, and no USB-C shell on either the short 17.8 mm edge or the long 21 mm edge.

The datasheet envelope is 21.0 x 17.8 mm. This top drawing does not contain that rectangle, so there is no Sense board center to subtract from.

## Entities used

No `CIRCLE`, `ARC`, `TEXT`, or `MTEXT` entities. Entity counts: `POLYLINE` 565, `VERTEX` 1134, `INSERT` 8, plus block definitions. The strings USB, lens, CAM, and Sense do not occur.

Header extents do not match the Sense envelope and do not match the placed geometry:

- `$EXTMIN` 10=-3.9200 20=7.3080
- `$EXTMAX` 10=18.1737 20=43.5115
- span 22.0937 x 36.2035 mm

The only board-like outline is layer `20`, a rounded rectangle drawn as open polylines. Centerline:

- left: (-0.635, 14.478) to (-0.635, 26.035)
- right: (17.145, 26.035) to (17.145, 14.478)
- top: (1.27, 27.94) to (15.24, 27.94)
- bottom: (15.24, 12.573) to (1.27, 12.573)
- four corner arcs, bulge 0.4142 (90 deg), radius 1.905 mm, for example (1.27, 27.94) bulge 0.4142 to (-0.635, 26.035)

Centerline extents: 17.780 mm by 15.367 mm. That is not 21.0 x 17.8 mm.

Closed circles in this R12 file are two `bulge=1` semicircles, not `CIRCLE` entities. The largest are pad-scale, not a lens:

- layer 21, center (0.955, 20.955), diameter 0.4064 mm, vertices (0.955, 20.7518) bulge 1 and (0.955, 21.1582) bulge 1
- layer 25, center (0.0, 22.479), diameter 0.400 mm, vertices (0.0, 22.279) bulge 1 and (0.0, 22.679) bulge 1
- layer 25, center (7.747, 19.177), diameter 0.300 mm
- layer 25, center (7.747, 20.701), diameter 0.300 mm

`INSERT` of block `ROUNDP` (local vertices (0, -0.25) bulge 1 and (0, 0.25) bulge 1, scale 1.27, diameter 0.635 mm):

- (-0.635, 25.019), rotation 270
- (17.145, 25.019), rotation 90

Those are round pads on the 17.780 mm edges of the layer-20 outline. They are not a camera lens. No closed circle in the file has a lens-scale diameter.
