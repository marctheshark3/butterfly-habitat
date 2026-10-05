# First prints while the mesh is on the way

Prepared for the builder's **PLA** on a **Bambu Lab P1S, 0.4 mm nozzle**.
These revision 0.11 candidate projects use **Generic PLA**, because the spool
brand/line has not been specified. The original projects in `candidate/slicing/`
still use PETG; use the PLA projects in this folder for these prints.

## Print order and files

| Order | Bambu Studio project | Color | Estimate | What it is |
| --- | --- | --- | --- | --- |
| 1 | [Corner fit](01-blue-corner-fit/01-blue-corner-fit.3mf) | Blue | 1 h 24 min / 42 g | Three test coupons: base, front and left wall |
| 2 | [Base](02-blue-base/02-blue-base.3mf) | Blue | 3 h 42 min / 156 g | The actual finished floor, 200 × 200 mm |
| 3 | [Front](03-blue-front/03-blue-front.3mf) | Blue | 2 h 16 min / 76 g | The actual finished front doorway frame |
| 4 | [Keeper](04-red-keeper/04-red-keeper.3mf) | Red | 11 min / 1 g | The actual finished rotating latch; set aside for the rails |

Estimates come from Bambu Studio 2.4.0.70 with the included settings. Each
project has one plate and one filament color. The first three objects are
**test pieces**, not parts of the finished enclosure. The base, front and
keeper projects each contain one full production part.

The base is the first full-size print after the corner test passes. Its shape,
the front frame and the keeper's printed shape do not depend on compressed
mesh thickness in the current CAD. Their physical fit still needs checking.

The builder reported a successful corner-coupon print. A detailed mechanical
fit result has not yet been recorded; this does not verify mesh retention or
complete enclosure assembly.

## Check the three corner pieces

1. Print them in the same blue PLA intended for the finished body. Remove the
   brim and the supports from the front/left locating tongues.
2. Seat the front coupon's bottom tongue in the matching base groove. With
   one M3 nyloc nut in the inward-facing boss slot, fasten it using one
   M3 × 16 socket-head screw from underneath. The nut's nylon end faces up.
3. Slide the left coupon down into the front coupon's vertical slot and its
   matching base groove. The wall shoulders should seat without forcing,
   drilling or sanding. Check that the screw head is recessed and the screw
   engages the nylon section of the nut.
4. If the joints bind or the parts crack, adjust the fit before printing the
   large pieces. A successful dry corner test does not establish mesh retention
   or door operation.

## Bambu setup

Open a `.3mf` as a **project** so Bambu loads its printer, filament and process
settings. The oriented STLs are included in the ZIP for manual import too;
import them as separate objects and keep their supplied orientations.

| Setting | Saved value |
| --- | --- |
| Printer / nozzle | Bambu Lab P1S / 0.4 mm |
| Filament | Generic PLA |
| Plate | Textured PEI |
| Nozzle / bed | 220 °C / 55 °C, from the Generic PLA profile |
| Layers | 0.20 mm |
| Walls / infill | 4 / 20% |
| Brim | 5 mm outer brim |
| Supports | Normal automatic, build plate only, on front/left coupons and full front |
| No supports | Base coupon, full base and keeper |
| Scale | 100%; original print orientation preserved |

If your spool has a matching manufacturer profile (for example Bambu PLA
Matte), select it and re-slice before printing. Match the project's single
filament to the loaded spool or AMS slot. No AMS or within-part color changes
are needed. Review the slice, leave bed leveling enabled, and start the job
when the correct spool and clean plate are installed.

Bambu's PLA profile displays a warm-enclosure warning with this heated plate:
follow its ventilation guidance for the P1S.

## Color plan for the complete habitat

| Color | Parts |
| --- | --- |
| Medium blue `#388DC7` | Base, front, back, left, right, roof |
| Pink `#F0A4BA` | Back/side/roof clamps and both rails |
| Orange `#F68C38` | Door and door clamp |
| Red `#DD4945` | Keeper / latch |

Use the pink spool's matte finish if available; screen colors are approximate.
Each part is a single color. These assignments match `inspector/colors.json`.

## When the mesh arrives

Measure its **compressed thickness**, then use the already-printed mesh-fastener
coupons to check retention and hardware engagement. The CAD currently assumes
0.20 mm, which is not a measurement. The mesh opening rating is not its thickness.
If those coupons used another material, repeat them in the intended PLA.

Wait on the full back/side/roof mesh panels, door, clamps and rails until the
mesh stack is checked. Mesh thickness changes panel nut-pocket depths and rail
geometry. Then proceed with the complete door and sliding tests before printing
the remaining set. PLA fit, mesh retention and the 50-cycle door test remain
unverified; this pack does not change the project's release status.

## File checks

All four projects were sliced with Bambu Studio. The archives, embedded G-code
checksums, PLA settings, colors, object counts, support settings and plate bounds
were checked. `manifest.json` records source STL hashes and estimates.
`layer-overview.png` shows first layers and selected bridge/feature layers from
the actual G-code. CAD comparisons at 0.05, 0.20 and 0.40 mm compressed mesh
confirmed identical printed geometry for the base, front and keeper; see
`mesh-independence.json`. The corner project was also opened and sliced in the
Bambu Studio desktop app, showing Generic PLA, 42.30 g and 1 h 24 min.
CLI logs retain the existing display/thumbnail warnings;
the exported projects contain G-code.

Settings were applied using Bambu's documented
[command-line workflow](https://github.com/bambulab/BambuStudio/wiki/Command-Line-Usage).

From the repository root, verify these projects and their download with
`python3 scripts/package-starter.py --check`. After an approved asset or guide
update, `python3 scripts/package-starter.py` rebuilds the ZIP from the manifest
and matching source STLs. The checks do not send anything to a printer.
