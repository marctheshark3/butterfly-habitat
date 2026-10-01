## Variant: camera roof

### Design stance
The corner is a pod sized to the board. The lens hole stays undrawn until a center exists.

### Key choices
- Pod outer 25.8 by 22.6 mm from the datasheet envelope, 0.4 mm clearance per side, 2.0 mm wall. Clearance and wall are assumed.
- USB slot leaves through the side, not the top.
- Mesh seals to the pod wall.
- Look-down is the sentence already in PRINT_SPEC. It is not a measured aim.

### Trade-offs
- Strong at: replacing the shelf with a real bay, and refusing a fake lens.
- Weak at: cannot be milled until `cam_lens_dx_mm` and `cam_lens_dy_mm` are recorded.

### Best for
A later plate, printed only after the board is measured.
