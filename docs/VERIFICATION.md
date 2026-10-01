# Verification and release

## Current candidate results

- 15 CAD/STL parts pass; independent mesh topology checks pass.
- 7,381 assembled pairs pass at 0.001 mm³; all motion/access checks pass.
- Six standard-library regression tests pass. The FreeCAD regression also rejects
  a deliberately misaligned side clamp and confirms import/build/check do not
  modify STL or STEP files.
- All 15 P1S PETG jobs slice successfully. First-layer, bridge and critical-feature
  previews were inspected. Four walls require the supplied support settings.
- Layer-centre checks found zero disconnected unsupported islands.
- Cut/pocket dimensions, critical webs and visible slicer perimeters were reviewed.
  This is an engineering audit, not a general medial-axis thickness proof.
- Compressed fabric remains an **unmeasured 0.20 mm assumption**. Physical tests
  are pending. Release remains blocked on the fabric measurement; print the full
  set only after the coupon, panel/corner and door-cycle tests pass.

The dated review and its source hash are in
[`candidate/required-review.json`](../candidate/required-review.json).

## What is automated

The assembly definition contains 15 printed bodies, five compressed-fabric
sheet envelopes, 51 screws, 51 nuts, all placements, panel hole patterns and
mating relationships. It drives STEP, oriented STLs, inspection views, hardware
counts, cutting templates and coupons.

Every body must be a valid, closed, connected CAD solid. Every tessellated part
must be a closed single-component mesh and fit a 256 mm bed with a 5 mm brim.
Exported STLs are read back and checked again. Independent standard-library
tests check edge incidence, winding, connectedness and signed volume.

All 7,381 instance pairs are checked, including hardware and fabric. There are
no collision exemptions. Intersections larger than **0.001 mm³** fail. Contact
without positive volume is permitted. The nut's thread bore clears the screw's
thread envelope; axial engagement is checked separately. Four millimetres of
nut engagement and 1 mm protrusion beyond the full nut envelope are modeled.

Checks also cover:

- Door removal through 190 mm with the roof and unlocked keeper present.
- The keeper's 90-degree turn: exact hook sweep and a conservative rear-plate
  disc envelope, both checked against the assembly.
- Roof removal through 20 mm, retaining all mesh hardware.
- Vertical wall installation/removal through 200 mm at the stated assembly
  stage. Parts installed later are absent; mesh hardware stays attached.
- Translational screw and nut installation paths through their receiving parts.
- A 5 mm diameter, 40 mm long driver shaft at every screw. Use a long shaft;
  bulky handles or powered-driver bodies are outside this model.
- Actual wall-joint and door running clearances, critical web dimensions,
  and uninterrupted 3 mm fabric-contact bands around each opening.
- First-layer area in each assigned orientation.

The translational sweeps union the starting solid with its extruded boundary
faces. This is a continuous sweep, not a set of discrete door positions.
Inspection drawings use the same shapes but do not substitute for solid checks.

## What still needs evidence

The critical-web checks are not a general minimum-thickness proof over every
point of every curved edge. Thin walls and intentional edge chamfers were reviewed in
the current slice; repeat that review after a geometry or mesh-stack change. Chamfered entry edges intentionally taper below the nominal web.
FDM strength, actual clearance, nyloc insertion force and fabric retention need
physical tests.

`candidate/slicing/` contains one P1S PETG project per printed part, flattened
profiles and source STL hashes. Successful G-code generation alone does not
prove printability. Inspect first layers, bridges, pockets, side tongues, rail
entry chamfers and the keeper hook. Use the 0.4 mm nozzle and 0.2 mm layers.
Check for unsupported islands and missing walls. The current slicing recipe
enables normal build-plate supports on front, back, left and right to support the
locating tongues. The other eleven parts are sliced without supports.
`candidate/layer-check.json` checks each 0.2 mm layer centre for disconnected
unsupported islands; it does not prove that connected cantilevers will print well.
`candidate/slicing/layer-overview.png` shows first layers and selected bridge layers.
[Prusa's printing design guidance](https://help.prusa3d.com/article/modeling-with-3d-printing-in-mind_164135)
explains why orientation and slicer inspection matter.

Some Bambu CLI builds report a missing display while omitting thumbnails even
when G-code is successfully generated. The slice script verifies that the
archive contains G-code and preserves the log. Those messages must not be
mistaken for a completed visual review.

## Release gates

1. Measure compressed fabric and regenerate with `HABITAT_MESH_MM` and
   `HABITAT_MESH_MEASURED=1`.
2. Run full geometry checks and export. `HABITAT_SKIP_MOTION=1` is only for
   debugging; it cannot export or release.
3. Slice all oriented STLs. Inspect every part, including critical layers.
4. Record revision-matched evidence in `candidate/required-review.json`:
   source SHA-256, compressed mesh thickness, named reviewer, observations,
   `slicer_review_pass`, and `wall_thickness_review_pass`.
5. Run `HABITAT_ACTION=release` with the same mesh settings. All geometry is
   regenerated and checked; release artifacts are written together to `release/`.
   They may be called **digitally verified** only after those reviews pass.
6. Print coupons, the complete door mesh panel with its front/rail/keeper test
   fixture, and the representative corner. Require hand
   assembly without drilling/sanding, secure fabric, recessed tips, complete nut
   engagement and 50 door cycles without binding or damage. Record results.
   Set `physical_fit_pass` only after all pass; then release may be called
   **fit verified**.

The default candidate is neither digitally verified nor fit verified. No
physical testing, material measurement or human slicer review is inferred from
a generated file or a passing source-code test.
