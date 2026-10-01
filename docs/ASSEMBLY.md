# Assembly — revision 0.11

Revision 0.11 engineering candidate. Digital geometry and slicing checks pass. Physical assembly, fabric retention and 50 door cycles still need testing. The model assumes 0.20 mm compressed mesh; measure your fabric and regenerate before final printing.

## Before assembly

- Print and test the fit coupons first, then a complete door panel and representative corner. Remove supports and brim before checking fit. The four wall panels require the documented build-plate supports.

- Identify all 15 printed parts: base, front, back, left, right, roof, door, back-clamp, left-clamp, right-clamp, roof-clamp, door-clamp, rail-left, rail-right and keeper. Use parts from one revision.

- Lay out 45 stainless M3 × 10 socket-head screws, six M3 × 16 socket-head screws, 51 M3 nyloc nuts (5.5 mm flats, 4 mm overall height), and a 2.5 mm hex driver. Screw length is measured beneath the head.

- Cut five mesh sheets using the matching 1:1 templates: back 198 × 185.75 mm; left and right each 181.5 × 185.75 mm; door 162 × 168 mm; roof 198 × 198 mm. Check the printed scale. Make the eight screw openings in each sheet; only the roof also needs two larger retention-access openings.

[Mesh cutting templates and part labels](../candidate/templates/) · [Hardware list](../candidate/hardware.csv)

## Build order

Mesh panels → preload remaining nuts → rails and keeper → base and front/back → sides → door → roof → checks.

## 1. Prepare the five mesh panels

**Hardware:** 40 M3 × 10 screws + 40 M3 nyloc nuts

1. Pair each frame with its matching clamp: back, left, right, door and roof. The front is the open doorway and has no mesh clamp.
2. On each frame, put eight nuts in the hex pockets opposite the clamp face. Point each nut’s nylon end away from the clamp. Hold loose nuts with temporary tape until the screws engage.
3. Lay the matching mesh sheet on the frame, place the clamp over it, and insert eight 10 mm screws from the clamp side. Start all eight before tightening gradually around the border. Remove temporary tape.
4. Check that the fabric is held around the entire opening, the clamp stays flat and screw tips remain recessed. Set the five completed panels aside.

![CAD reference view; separated parts show orientation, not an installation sequence.](../candidate/views/exploded.png)

## 2. Load the remaining nuts while the parts are accessible

**Hardware:** 11 M3 nyloc nuts

1. Front frame: insert two nuts in the lower inward-facing boss slots for the base, two in the upper inward-facing boss slots for the roof, and four in the inside-face hex pockets for the rails. Total: eight nuts.
2. Back panel: insert two nuts in the lower inward-facing boss slots for the base.
3. Rail-left: insert one nut in the inside-face pocket behind the keeper pivot before mounting the rail.
4. Base nuts have nylon ends upward; roof nuts have nylon ends downward. Rail and keeper nuts have nylon ends toward the inside of the enclosure. Temporarily retain any loose nuts until their screws engage.

## 3. Attach the rails and keeper to the front frame on the bench

**Hardware:** 5 M3 × 10 screws; nuts loaded in step 2

1. Place the front frame with its outside face accessible. Put rail-left and rail-right on the outside, with their stops at the bottom and their open track ends at the top. Left and right are as viewed from outside the front.
2. Insert two 10 mm screws through each rail’s deep counterbores into the front frame nuts. Seat the heads; keep the running channels clear.
3. Attach the keeper to the top of rail-left using the fifth 10 mm screw. Adjust the pivot so the keeper moves by hand and stays where placed. Swing its arm clear of the door path.

## 4. Fasten the front and back to the base

**Hardware:** 4 M3 × 16 screws; nuts loaded in step 2

1. The grooved face of the base goes up; the recessed screw-head pockets go underneath. Place it on two supports so you can reach the underside without turning loose walls over.
2. Seat the front frame’s bottom tongue in the front groove, with rails outside and nut bosses inside. Hold it upright and insert two 16 mm screws from below.
3. Seat the back panel in the opposite groove, with its mesh clamp outside. Hold it upright and insert the remaining two 16 mm screws from below.
4. Check that both walls sit fully down and all four heads sit within their underside recesses. Remove temporary nut-retaining tape.

## 5. Slide in the side panels

**Hardware:** No additional hardware

1. Keep the roof off. Hold the left panel with its mesh clamp facing out. Align both vertical edge tongues with the open slots on the inside faces of the front and back.
2. Lower the panel straight down until its bottom tongue seats in the base. Repeat for the right panel.
3. Check that all four wall tops are level. Keep the enclosure upright; the side panels can still lift out until the roof is secured.

## 6. Insert the door and check the keeper

**Hardware:** Completed door panel; no additional hardware

1. With the keeper swung clear, hold the completed door above the rail openings. Its clamp and projecting finger grip face outward; the grip is at the bottom.
2. Lower both door edges into the tracks together until the door rests on both bottom stops. Do not force a tight track.
3. Swing the keeper across the top of the closed door so its hook prevents the door lifting. Swing it clear again and check that the door slides freely.

![Insert the door and check the keeper](../candidate/views/door-removal.png)

## 7. Attach the complete roof

**Hardware:** 2 M3 × 16 screws; nuts loaded in step 2

1. Place the completed roof with its locating grooves down and mesh clamp up. Its two larger retention-access holes go toward the front, over the two upper front-frame bosses.
2. Lower it onto all four wall tops. Insert one 16 mm screw through each large access hole into the front-frame nuts. These two screws seat on the roof frame.
3. Leave the eight short mesh screws assembled. To remove the roof later, remove only the two long retention screws and lift the entire roof assembly. Keep the enclosure upright while the roof is off.

![Attach the complete roof](../candidate/views/roof-removal.png)

## 8. Check the completed enclosure

**Hardware:** Physical acceptance checks

1. Confirm all nuts engage their nylon locking section, screw tips are recessed, the base sits flat and the mesh has no loose border or escape gaps.
2. With the roof installed, swing the keeper clear and raise the door through its full travel. It should lift completely out; allow about 190 mm of upward travel. Reinsert it and close the keeper.
3. Complete and record 50 door cycles without binding or damage. Require hand assembly without drilling or sanding. Record failed fits for correction before calling the design fit verified.

![Check the completed enclosure](../candidate/views/assembled.png)
