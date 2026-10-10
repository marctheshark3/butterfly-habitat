; HEADER_BLOCK_START
; BambuStudio 02.04.00.70
; model printing time: 50m 57s; total estimated time: 58m 9s
; total layer number: 15
; total filament length [mm] : 11930.30
; total filament volume [cm^3] : 28695.73
; total filament weight [g] : 37.88
; filament_density: 1.32
; filament_diameter: 1.75
; max_z_height: 3.00
; filament: 1
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0
; additional_cooling_fan_speed = 70
; apply_scarf_seam_on_circles = 1
; apply_top_surface_compensation = 0
; auto_disable_filter_on_overheat = 0
; auxiliary_fan = 1
; avoid_crossing_wall_includes_support = 0
; bed_custom_model =
; bed_custom_texture =
; bed_exclude_area = 0x0,18x0,18x28,0x28
; bed_temperature_formula = by_first_filament
; before_layer_change_gcode =
; best_object_pos = 0.5,0.5
; bottom_color_penetration_layers = 3
; bottom_shell_layers = 3
; bottom_shell_thickness = 0
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = outer_only
; brim_width = 5
; chamber_temperatures = 0
; change_filament_gcode = ;=P1S 20251031=\nM620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nG1 X70 F21000\nG1 Y245\nG1 Y265 F3000\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{else}\nM620.11 S0\n{endif}\nM400\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 X120 F15000\nG1 X20 Y50 F21000\nG1 Y-3\n{if toolchange_count == 2}\n; get travel path for change filament\nM620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\nM620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\nM620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\nM620.1 E F{flush_volumetric_speeds[previous_extruder]/2.4053*60} T{flush_temperatures[previous_extruder]}\nT[next_extruder]\nM620.1 E F{flush_volumetric_speeds[next_extruder]/2.4053*60} T{flush_temperatures[next_extruder]}\n\n{if next_extruder < 255}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\nG92 E0\n{if flush_length_1 > 1}\nM83\n; FLUSH_START\n; always use highest temperature to flush\nM400\n{if filament_type[next_extruder] == "PETG"}\nM109 S260\n{elsif filament_type[next_extruder] == "PVA"}\nM109 S210\n{else}\nM109 S{flush_temperatures[next_extruder]}\n{endif}\n{if flush_length_1 > 23.7}\nG1 E23.7 F{flush_volumetric_speeds[previous_extruder]/2.4053*60} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\n{else}\nG1 E{flush_length_1} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_4 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n; FLUSH_START\nM400\nM109 S[new_filament_temp]\nG1 E2 F{flush_volumetric_speeds[next_extruder]/2.4053*60} ;Compensate for filament spillage during waiting temperature\n; FLUSH_END\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM106 P1 S255\nM400 S3\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X105 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\n\nG1 X70 F10000\nG1 X80 F15000\nG1 X60\nG1 X80\nG1 X60\nG1 X80 ; shake to put down garbage\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y256 ; move Y to aside, prevent collision\nM400\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200
; close_fan_the_first_x_layers = 1
; compatible_printers_condition =
; complete_print_exhaust_fan_speed = 70
; cool_plate_temp = 35
; cool_plate_temp_initial_layer = 35
; cooling_filter_enabled = 0
; counter_coef_1 = 0
; counter_coef_2 = 0.008
; counter_coef_3 = -0.041
; counter_limit_max = 0.033
; counter_limit_min = -0.035
; curr_bed_type = Textured PEI Plate
; default_acceleration = 10000
; default_filament_colour = ""
; default_filament_profile = "Bambu PLA Basic @BBL P1S 0.4 nozzle"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.20mm Standard @BBL X1C
; deretraction_speed = 30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50
; different_settings_to_system = ;;
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70
; elefant_foot_compensation = 0.15
; embedding_wall_into_infill = 0
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_height_slowdown = 0
; enable_long_retraction_when_cut = 2
; enable_overhang_bridge_fan = 1
; enable_overhang_speed = 1
; enable_pre_heating = 0
; enable_pressure_advance = 0
; enable_prime_tower = 1
; enable_support = 0
; enable_wrapping_detection = 0
; enforce_support_layers = 0
; eng_plate_temp = 0
; eng_plate_temp_initial_layer = 0
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count =
; extruder_clearance_dist_to_rod = 33
; extruder_clearance_height_to_lid = 90
; extruder_clearance_height_to_rod = 34
; extruder_clearance_max_radius = 68
; extruder_colour = #018001
; extruder_max_nozzle_count = 1
; extruder_nozzle_stats =
; extruder_offset = 0x2
; extruder_printable_area =
; extruder_type = Direct Drive
; extruder_variant_list = "Direct Drive Standard,Direct Drive High Flow"
; fan_cooling_layer_time = 100
; fan_direction = left
; fan_max_speed = 100
; fan_min_speed = 100
; filament_adaptive_volumetric_speed = 0
; filament_adhesiveness_category = 100
; filament_change_length = 10
; filament_change_length_nc = 10
; filament_colour = #F0A4BA
; filament_cooling_before_tower = 10
; filament_cost = 24.99
; filament_density = 1.32
; filament_diameter = 1.75
; filament_end_gcode = "; filament end gcode \n\n"
; filament_extruder_variant = "Direct Drive Standard"
; filament_flow_ratio = 0.98
; filament_flush_temp = 0
; filament_flush_volumetric_speed = 0
; filament_ids = GFA01
; filament_is_support = 0
; filament_long_retractions_when_cut = 1
; filament_map = 1
; filament_map_2 = 0
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 22
; filament_minimal_purge_on_wipe_tower = 15
; filament_notes =
; filament_nozzle_map = 0
; filament_pre_cooling_temperature = 0
; filament_pre_cooling_temperature_nc = 0
; filament_prime_volume = 45
; filament_prime_volume_nc = 60
; filament_printable = 3
; filament_ramming_travel_time = 0
; filament_ramming_travel_time_nc = 0
; filament_ramming_volumetric_speed = -1
; filament_ramming_volumetric_speed_nc = -1
; filament_retract_length_nc = 14
; filament_retraction_distances_when_cut = 18
; filament_scarf_gap = 0%
; filament_scarf_height = 5%
; filament_scarf_length = 10
; filament_scarf_seam_type = none
; filament_self_index = 1
; filament_settings_id = "Bambu PLA Matte @BBL P1S 0.4 nozzle"
; filament_shrink = 100%
; filament_soluble = 0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\nM142 P1 R35 S40\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_type = PLA
; filament_velocity_adaptation_factor = 1
; filament_vendor = "Bambu Lab"
; filament_volume_map = 0
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; fill_multiline = 1
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; first_x_layer_fan_speed = 0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_volumes_matrix = 0
; flush_volumes_vector = 140,140,140,140,140,140,140,140
; full_fan_speed_layer = 0
; fuzzy_skin = none
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 250
; gcode_add_line_number = 0
; gcode_flavor = marlin
; grab_length = 0
; group_algo_with_time = 0
; has_scarf_joint_seam = 0
; head_wrap_detect_zone =
; hole_coef_1 = 0
; hole_coef_2 = -0.008
; hole_coef_3 = 0.23415
; hole_limit_max = 0.22
; hole_limit_min = 0.088
; hot_plate_temp = 55
; hot_plate_temp_initial_layer = 55
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 6.6
; independent_support_layer_height = 1
; infill_combination = 0
; infill_direction = 45
; infill_instead_top_bottom_surfaces = 0
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
; inherits_group = ;;
; initial_layer_acceleration = 500
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 105
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 50
; initial_layer_travel_acceleration = 6000
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 300
; interface_shells = 0
; interlocking_beam = 0
; interlocking_beam_layer_count = 2
; interlocking_beam_width = 0.8
; interlocking_boundary_avoidance = 2
; interlocking_depth = 2
; interlocking_orientation = 22.5
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_pattern = zig-zag
; internal_solid_infill_speed = 250
; ironing_direction = 45
; ironing_flow = 10%
; ironing_inset = 0.21
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.2
; line_width = 0.42
; locked_skeleton_infill_pattern = zigzag
; locked_skin_infill_pattern = crosszag
; long_retractions_when_cut = 0
; long_retractions_when_ec = 0
; machine_end_gcode = ;===== date: 20230428 =====================\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\nG1 X65 Y245 F12000 ; move to safe pos \nG1 Y265 F3000\n\nG1 X65 Y245 F12000\nG1 Y265 F3000\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\nG1 X100 F12000 ; wipe\n; pull back filament to AMS\nM620 S255\nG1 X20 Y50 F12000\nG1 Y-3\nT255\nG1 X65 F12000\nG1 Y265\nG1 X100 F12000 ; wipe\nM621 S255\nM104 S0 ; turn off hotend\n\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n    M400 ; wait all motion done\n    M991 S0 P-1 ;end smooth timelapse at safe pos\n    M400 S3 ;wait for last picture to be taken\nM623; end of "timelapse_record_flag"\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 250}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z250 F600\n    G1 Z248\n{endif}\nM400 P100\nM17 R ; restore z current\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\nM17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power\n
; machine_hotend_change_time = 0
; machine_load_filament_time = 29
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 20000,20000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 20000,20000
; machine_max_acceleration_y = 20000,20000
; machine_max_acceleration_z = 500,200
; machine_max_jerk_e = 2.5,2.5
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 3,3
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,200
; machine_max_speed_y = 500,200
; machine_max_speed_z = 20,20
; machine_min_extruding_rate = 0
; machine_min_travel_rate = 0
; machine_pause_gcode = M400 U1
; machine_prepare_compensation_time = 260
; machine_start_gcode = ;===== machine: P1S-0.4 ========================\n;===== date: 20251031 =====================\n;===== turn on the HB fan & MC board fan =================\nM104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle\nM710 A1 S255 ;turn on MC fan by default(P1S)\n;===== reset machine status =================\nM290 X40 Y40 Z2.6666666\nG91\nM17 Z0.4 ; lower the z-motor current\nG380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed\nG380 S2 Z-25 F300 ;\nG1 Z5 F300;\nG90\nM17 X1.2 Y1.2 Z0.75 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 5\nM221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem\nG29.1 Z{+0.0} ; clear z-trim value first\nM204 S10000 ; init ACC set to 10m/s^2\n\n;===== heatbed preheat ====================\nM1002 gcode_claim_action:54\nM140 S[bed_temperature_initial_layer_single] ;set bed temp\nM190 S[bed_temperature_initial_layer_single] ;wait for bed temp\n\n\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_extruder]=="PLA"}\n    {if (bed_temperature[initial_extruder] >45)||(bed_temperature_initial_layer[initial_extruder] >45)}\n    M106 P3 S180\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n;===== prepare print temperature and material ==========\nM104 S[nozzle_temperature_initial_layer] ;set extruder temp\nG91\nG0 Z10 F1200\nG90\nG28 X\nM975 S1 ; turn on\nG1 X60 F12000\nG1 Y245\nG1 Y265 F3000\nM620 M\nM620 S[initial_extruder]A   ; switch material if AMS exist\n    M109 S[nozzle_temperature_initial_layer]\n    G1 X120 F12000\n\n    G1 X20 Y50 F12000\n    G1 Y-3\n    T[initial_extruder]\n    G1 X54 F12000\n    G1 Y265\n    M400\nM621 S[initial_extruder]A\nM620.1 E F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60} T{flush_temperatures[initial_no_support_extruder]}\n\n\nM412 S1 ; ===turn on filament runout detection===\n\nM109 S250 ;set nozzle to common flush temp\nM106 P1 S0\nG92 E0\nG1 E50 F200\nM400\nM104 S[nozzle_temperature_initial_layer]\nG92 E0\nG1 E50 F200\nM400\nM106 P1 S255\nG92 E0\nG1 E5 F300\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20} ; drop nozzle temp, make filament shink a bit\nG92 E0\nG1 E-0.5 F300\n\nG1 X70 F9000\nG1 X76 F15000\nG1 X65 F15000\nG1 X76 F15000\nG1 X65 F15000; shake to put down garbage\nG1 X80 F6000\nG1 X95 F15000\nG1 X80 F15000\nG1 X165 F15000; wipe and shake\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\nM975 S1\nM106 S255\nG1 X65 Y230 F18000\nG1 Y264 F6000\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20}\nG1 X100 F18000 ; first wipe mouth\n\nG0 X135 Y253 F20000  ; move to exposed steel surface edge\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nG0 Z5 F20000\n\nG1 X60 Y265\nG92 E0\nG1 E-0.5 F300 ; retrack more\nG1 X100 F5000; second wipe mouth\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X90 F5000\nG0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle\nM104 S140 ; set temp down to heatbed acceptable\nM106 S255 ; turn on fan (G28 has turn off fan)\n\nM221 S; push soft endstop status\nM221 Z0 ;turn off Z axis endstop\nG0 Z0.5 F20000\nG0 X125 Y259.5 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 X128\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\n\nM109 S140 ; wait nozzle temp down to heatbed acceptable\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\n\nM221 R; pop softend status\nG1 Z10 F1200\nM400\nG1 Z10\nG1 F30000\nG1 X230 Y15\nG29.2 S1 ; turn on ABL\n;G28 ; home again after hard wipe mouth\nM106 S0 ; turn off fan , too noisy\n;===== wipe nozzle end ================================\n\n\n;===== bed leveling ==================================\nM1002 judge_flag g29_before_print_flag\nM622 J1\n\n    M1002 gcode_claim_action : 1\n    G29 A X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\n\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28\n\nM623\n;===== home after wipe mouth end =======================\n\nM975 S1 ; turn on vibration supression\n\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_extruder]=="PLA"}\n    {if (bed_temperature[initial_extruder] >45)||(bed_temperature_initial_layer[initial_extruder] >45)}\n    M106 P3 S180\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n\nM104 S{nozzle_temperature_initial_layer[initial_extruder]} ; set extrude temp earlier, to reduce wait time\n\n;===== mech mode fast check============================\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q1 A7 B30 C80  H15 K0\nM974 Q1 S2 P0\n\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q0 A7 B30 C90 Q0 H15 K0\nM974 Q0 S2 P0\n\nM975 S1\nG1 F30000\nG1 X230 Y15\nG28 X ; re-home XY\n;===== fmech mode fast check============================\n\n\n;===== nozzle load line ===============================\nM975 S1\nG90\nM83\nT1000\nG1 X18.0 Y1.0 Z0.8 F18000;Move to start position\nM109 S{nozzle_temperature_initial_layer[initial_extruder]}\nG1 Z0.2\nG0 E2 F300\nG0 X240 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 Y11 E0.700 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\nG0 X239.5\nG0 E0.2\nG0 Y1.5 E0.700\nG0 X18 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nM400\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type=="Textured PEI Plate"}\nG29.1 Z{-0.04} ; for Textured PEI Plate\n{endif}\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression\n
; machine_switch_extruder_time = 0
; machine_unload_filament_time = 28
; master_extruder_id = 1
; max_bridge_length = 0
; max_layer_height = 0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08
; minimum_sparse_infill_area = 15
; mmu_segmented_region_interlocking_depth = 0
; mmu_segmented_region_max_width = 0
; no_slow_down_for_cooling_on_outwalls = 0
; nozzle_diameter = 0.4
; nozzle_flush_dataset = 0
; nozzle_height = 4.2
; nozzle_temperature = 220
; nozzle_temperature_initial_layer = 220
; nozzle_temperature_range_high = 240
; nozzle_temperature_range_low = 190
; nozzle_type = stainless_steel
; nozzle_volume = 107
; nozzle_volume_type = Standard
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 5000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 200
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 100
; overhang_fan_threshold = 50%
; overhang_threshold_participating_cooling = 95%
; overhang_totally_speed = 10
; override_filament_scarf_seam_setting = 0
; physical_extruder_map = 0
; post_process =
; pre_start_fan_time = 0
; precise_outer_wall = 0
; precise_z_height = 0
; pressure_advance = 0.02
; prime_tower_brim_width = 3
; prime_tower_enable_framework = 0
; prime_tower_extra_rib_length = 0
; prime_tower_fillet_wall = 1
; prime_tower_flat_ironing = 0
; prime_tower_infill_gap = 150%
; prime_tower_lift_height = -1
; prime_tower_lift_speed = 90
; prime_tower_max_speed = 90
; prime_tower_rib_wall = 1
; prime_tower_rib_width = 8
; prime_tower_skip_points = 1
; prime_tower_width = 35
; prime_volume_mode = Default
; print_compatible_printers = "Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab P1S 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle"
; print_extruder_id = 1
; print_extruder_variant = "Direct Drive Standard"
; print_flow_ratio = 1
; print_sequence = by layer
; print_settings_id = Habitat 0.20mm - 4 walls - 20%
; printable_area = 0x0,256x0,256x256,0x256
; printable_height = 250
; printer_extruder_id = 1
; printer_extruder_variant = "Direct Drive Standard"
; printer_model = Bambu Lab P1S
; printer_notes =
; printer_settings_id = Bambu Lab P1S 0.4 nozzle
; printer_structure = corexy
; printer_technology = FFF
; printer_variant = 0.4
; printing_by_object_gcode =
; process_notes =
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = -1
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1
; reduce_infill_retraction = 1
; required_nozzle_HRC = 3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 249
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_distances_when_cut = 18
; retraction_distances_when_ec = 0
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 30
; role_base_wipe_speed = 1
; scan_first_layer = 0
; scarf_angle_threshold = 155
; seam_gap = 15%
; seam_placement_away_from_overhangs = 0
; seam_position = aligned
; seam_slope_conditional = 1
; seam_slope_entire_loop = 0
; seam_slope_gap = 0
; seam_slope_inner_walls = 1
; seam_slope_min_length = 10
; seam_slope_start_height = 10%
; seam_slope_steps = 10
; seam_slope_type = none
; silent_mode = 0
; single_extruder_multi_material = 1
; skeleton_infill_density = 15%
; skeleton_infill_line_width = 0.45
; skin_infill_density = 15%
; skin_infill_depth = 2
; skin_infill_line_width = 0.45
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1
; slow_down_layer_time = 4
; slow_down_min_speed = 20
; slowdown_end_acc = 100000
; slowdown_end_height = 400
; slowdown_end_speed = 1000
; slowdown_start_acc = 100000
; slowdown_start_height = 0
; slowdown_start_speed = 1000
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; smooth_coefficient = 150
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 0
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 20%
; sparse_infill_filament = 0
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = grid
; sparse_infill_speed = 270
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 45
; supertack_plate_temp_initial_layer = 45
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
; support_chamber_temp_control = 0
; support_cooling_filter = 0
; support_critical_regions_only = 0
; support_expansion = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_not_for_body = 1
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 80
; support_interface_top_layers = 2
; support_line_width = 0.42
; support_object_first_layer_gap = 0.2
; support_object_skip_flush = 0
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_remove_small_overhang = 1
; support_speed = 150
; support_style = default
; support_threshold_angle = 30
; support_top_z_distance = 0.2
; support_type = tree(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 45
; template_custom_gcode =
; textured_plate_temp = 55
; textured_plate_temp_initial_layer = 55
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;========Date 20250206========\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n{if timelapse_type == 0} ; timelapse without wipe tower\nM971 S11 C10 O0\nM1004 S5 P1  ; external shutter\n{elsif timelapse_type == 1} ; timelapse with wipe tower\nG92 E0\nG1 X65 Y245 F20000 ; move to safe pos\nG17\nG2 Z{layer_z} I0.86 J0.86 P1 F20000\nG1 Y265 F3000\nM400\nM1004 S5 P1  ; external shutter\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 X100 F5000\nG1 Y255 F20000\n{endif}\nM623\n; SKIPPABLE_END
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 5
; top_one_wall_type = all top
; top_shell_layers = 5
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 200
; top_z_overrides_xy_distance = 0
; travel_acceleration = 10000
; travel_jerk = 9
; travel_speed = 500
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_diameter_angle = 5
; tree_support_branch_distance = 5
; tree_support_wall_count = -1
; upward_compatible_machine = "Bambu Lab P1P 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle";"Bambu Lab A1 0.4 nozzle";"Bambu Lab H2D 0.4 nozzle";"Bambu Lab H2D Pro 0.4 nozzle";"Bambu Lab H2S 0.4 nozzle";"Bambu Lab P2S 0.4 nozzle";"Bambu Lab H2C 0.4 nozzle"
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; vertical_shell_speed = 80%
; volumetric_speed_coefficients = "0 0 0 0 0 0"
; wall_distribution_count = 1
; wall_filament = 0
; wall_generator = classic
; wall_loops = 4
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 15
; wipe_tower_y = 220
; wrapping_detection_gcode =
; wrapping_detection_layers = 20
; wrapping_exclude_area =
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_direction_outwall_speed_continuous = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R58
M201 X20000 Y20000 Z500 E5000
M203 X500 Y500 Z20 E30
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z3.00 E2.50
M106 S0
M106 P2 S0
; FEATURE: Custom
;===== machine: P1S-0.4 ========================
;===== date: 20251031 =====================
;===== turn on the HB fan & MC board fan =================
M104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle
M710 A1 S255 ;turn on MC fan by default(P1S)
;===== reset machine status =================
M290 X40 Y40 Z2.6666666
G91
M17 Z0.4 ; lower the z-motor current
G380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed
G380 S2 Z-25 F300 ;
G1 Z5 F300;
G90
M17 X1.2 Y1.2 Z0.75 ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 5
M221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem
G29.1 Z0 ; clear z-trim value first
M204 S10000 ; init ACC set to 10m/s^2

;===== heatbed preheat ====================
M1002 gcode_claim_action:54
M140 S55 ;set bed temp
M190 S55 ;wait for bed temp



;=============turn on fans to prevent PLA jamming=================


    M106 P3 S180
    ;Prevent PLA from jamming

M106 P2 S100 ; turn on big fan ,to cool down toolhead

;===== prepare print temperature and material ==========
M104 S220 ;set extruder temp
G91
G0 Z10 F1200
G90
G28 X
M975 S1 ; turn on
G1 X60 F12000
G1 Y245
G1 Y265 F3000
M620 M
M620 S0A   ; switch material if AMS exist
    M109 S220
    G1 X120 F12000

    G1 X20 Y50 F12000
    G1 Y-3
    T0
    G1 X54 F12000
    G1 Y265
    M400
M621 S0A
M620.1 E F548.788 T240


M412 S1 ; ===turn on filament runout detection===

M109 S250 ;set nozzle to common flush temp
M106 P1 S0
G92 E0
M73 P2 R56
G1 E50 F200
M400
M104 S220
G92 E0
M73 P10 R52
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
G1 E-0.5 F300

M73 P10 R51
G1 X70 F9000
G1 X76 F15000
M73 P11 R51
G1 X65 F15000
G1 X76 F15000
G1 X65 F15000; shake to put down garbage
G1 X80 F6000
G1 X95 F15000
G1 X80 F15000
G1 X165 F15000; wipe and shake
M400
M106 P1 S0
;===== prepare print temperature and material end =====


;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14
M975 S1
M106 S255
G1 X65 Y230 F18000
G1 Y264 F6000
M109 S200
G1 X100 F18000 ; first wipe mouth

G0 X135 Y253 F20000  ; move to exposed steel surface edge
G28 Z P0 T300; home z with low precision,permit 300deg temperature
G29.2 S0 ; turn off ABL
G0 Z5 F20000

G1 X60 Y265
G92 E0
G1 E-0.5 F300 ; retrack more
G1 X100 F5000; second wipe mouth
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X90 F5000
G0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle
M104 S140 ; set temp down to heatbed acceptable
M106 S255 ; turn on fan (G28 has turn off fan)

M221 S; push soft endstop status
M221 Z0 ;turn off Z axis endstop
G0 Z0.5 F20000
G0 X125 Y259.5 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 X128
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300

M109 S140 ; wait nozzle temp down to heatbed acceptable
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000

M221 R; pop softend status
G1 Z10 F1200
M400
G1 Z10
G1 F30000
G1 X230 Y15
G29.2 S1 ; turn on ABL
;G28 ; home again after hard wipe mouth
M106 S0 ; turn off fan , too noisy
;===== wipe nozzle end ================================


;===== bed leveling ==================================
M1002 judge_flag g29_before_print_flag
M622 J1

    M1002 gcode_claim_action : 1
    G29 A X31.5793 Y29.4543 I192.841 J197.091
    M400
    M500 ; save cali data

M623
;===== bed leveling end ================================

;===== home after wipe mouth============================
M1002 judge_flag g29_before_print_flag
M622 J0

    M1002 gcode_claim_action : 13
    G28

M623
;===== home after wipe mouth end =======================

M975 S1 ; turn on vibration supression


;=============turn on fans to prevent PLA jamming=================


    M106 P3 S180
    ;Prevent PLA from jamming

M106 P2 S100 ; turn on big fan ,to cool down toolhead


M104 S220 ; set extrude temp earlier, to reduce wait time

;===== mech mode fast check============================
G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q1 A7 B30 C80  H15 K0
M974 Q1 S2 P0

G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q0 A7 B30 C90 Q0 H15 K0
M974 Q0 S2 P0

M975 S1
G1 F30000
G1 X230 Y15
G28 X ; re-home XY
;===== fmech mode fast check============================


;===== nozzle load line ===============================
M975 S1
G90
M83
T1000
G1 X18.0 Y1.0 Z0.8 F18000;Move to start position
M109 S220
G1 Z0.2
G0 E2 F300
G0 X240 E15 F6033.27
G0 Y11 E0.700 F1508.32
G0 X239.5
G0 E0.2
G0 Y1.5 E0.700
G0 X18 E15 F6033.27
M400

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=Textured PEI Plate

G29.1 Z-0.04 ; for Textured PEI Plate

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
; MACHINE_START_GCODE_END
; filament start gcode
M106 P3 S150

M142 P1 R35 S40
;VT0
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/15
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
M106 P2 S0
M204 S6000
G1 Z.4 F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 15
G1 X33.176 Y28.922
G1 Z.2
G1 E.8 F1800
; FEATURE: Brim
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X33.669 Y28.511 E.0239
G1 X34.214 Y28.178 E.02378
G1 X35.052 Y27.852 E.03351
G1 X35.679 Y27.721 E.02386
G1 X36.258 Y27.683 E.02159
G1 X219.742 Y27.683 E6.83408
G1 X220.39 Y27.731 E.02422
G1 X221.013 Y27.871 E.02377
G1 X221.856 Y28.228 E.0341
G1 X222.474 Y28.625 E.02737
G1 X222.953 Y29.051 E.02386
G1 X223.364 Y29.544 E.0239
G1 X223.697 Y30.089 E.02378
G1 X224.023 Y30.927 E.03351
G1 X224.154 Y31.554 E.02386
G1 X224.192 Y32.133 E.0216
G1 X224.192 Y219.866 E6.99237
M73 P12 R51
G1 X224.144 Y220.515 E.02422
G1 X224.004 Y221.138 E.02377
G1 X223.647 Y221.981 E.0341
G1 X223.25 Y222.599 E.02737
G1 X222.824 Y223.078 E.02386
G1 X222.331 Y223.489 E.0239
G1 X221.786 Y223.822 E.02378
G1 X220.948 Y224.148 E.03351
G1 X220.321 Y224.279 E.02386
G1 X219.742 Y224.317 E.0216
G1 X36.259 Y224.317 E6.83407
G1 X35.61 Y224.269 E.02422
G1 X34.987 Y224.129 E.02377
G1 X34.144 Y223.772 E.0341
G1 X33.526 Y223.375 E.02737
G1 X33.047 Y222.949 E.02386
G1 X32.636 Y222.456 E.0239
G1 X32.303 Y221.911 E.02378
G1 X31.977 Y221.073 E.03351
G1 X31.846 Y220.446 E.02386
G1 X31.808 Y219.867 E.02159
G1 X31.808 Y32.133 E6.99238
G1 X31.856 Y31.485 E.02422
G1 X31.996 Y30.862 E.02377
G1 X32.353 Y30.019 E.0341
G1 X32.75 Y29.401 E.02737
G1 X33.136 Y28.967 E.02163
M204 S6000
M73 P12 R50
G1 X33.478 Y29.27 F30000
G1 F3000
M204 S500
G1 X33.488 Y29.259 E.00055
G1 X33.944 Y28.878 E.02213
G1 X34.428 Y28.585 E.02108
G1 X35.194 Y28.29 E.03056
G1 X35.732 Y28.177 E.02048
G1 X36.277 Y28.14 E.02036
G1 X219.73 Y28.14 E6.83291
G1 X220.312 Y28.183 E.02176
G1 X220.86 Y28.305 E.0209
G1 X221.631 Y28.63 E.03115
G1 X222.188 Y28.985 E.02461
G1 X222.616 Y29.363 E.02128
G1 X222.997 Y29.819 E.02213
G1 X223.29 Y30.303 E.02108
G1 X223.585 Y31.069 E.03056
G1 X223.698 Y31.607 E.02048
G1 X223.735 Y32.152 E.02037
G1 X223.735 Y219.844 E6.99082
G1 X223.692 Y220.437 E.02214
G1 X223.562 Y221.008 E.02181
G1 X223.235 Y221.776 E.0311
G1 X222.89 Y222.313 E.02375
G1 X222.512 Y222.741 E.02128
G1 X222.056 Y223.122 E.02213
G1 X221.572 Y223.415 E.02108
G1 X220.806 Y223.71 E.03056
G1 X220.268 Y223.823 E.02048
G1 X219.723 Y223.86 E.02037
G1 X36.281 Y223.86 E6.83252
G1 X35.688 Y223.817 E.02214
G1 X35.117 Y223.687 E.02181
G1 X34.349 Y223.36 E.0311
G1 X33.812 Y223.015 E.02375
G1 X33.384 Y222.637 E.02128
G1 X33.003 Y222.181 E.02213
G1 X32.71 Y221.697 E.02108
G1 X32.415 Y220.931 E.03056
G1 X32.302 Y220.393 E.02048
G1 X32.265 Y219.848 E.02036
G1 X32.265 Y32.155 E6.99083
G1 X32.308 Y31.563 E.02214
G1 X32.438 Y30.992 E.02181
G1 X32.765 Y30.224 E.0311
G1 X33.11 Y29.687 E.02375
G1 X33.439 Y29.315 E.0185
M204 S6000
G1 X33.782 Y29.617 F30000
G1 F3000
M204 S500
G1 X33.801 Y29.595 E.00105
G1 X34.202 Y29.258 E.01954
G1 X34.642 Y28.993 E.01912
G1 X35.335 Y28.727 E.02764
G1 X35.804 Y28.63 E.01784
G1 X36.297 Y28.597 E.01843
G1 X219.708 Y28.597 E6.83133
G1 X220.235 Y28.636 E.01971
G1 X220.732 Y28.747 E.01895
G1 X221.428 Y29.042 E.02815
G1 X221.903 Y29.345 E.02099
G1 X222.28 Y29.676 E.01866
G1 X222.617 Y30.077 E.01954
G1 X222.882 Y30.517 E.01912
G1 X223.148 Y31.21 E.02764
G1 X223.245 Y31.679 E.01784
G1 X223.278 Y32.173 E.01843
G1 X223.278 Y219.823 E6.98925
G1 X223.239 Y220.359 E.02004
G1 X223.121 Y220.878 E.01983
G1 X222.823 Y221.572 E.0281
M73 P13 R50
G1 X222.53 Y222.028 E.02018
G1 X222.199 Y222.405 E.01868
G1 X221.798 Y222.742 E.01954
G1 X221.358 Y223.007 E.01912
G1 X220.665 Y223.273 E.02764
G1 X220.196 Y223.37 E.01784
G1 X219.702 Y223.403 E.01843
G1 X36.302 Y223.403 E6.83096
G1 X35.766 Y223.364 E.02004
G1 X35.247 Y223.246 E.01983
G1 X34.553 Y222.948 E.0281
G1 X34.097 Y222.655 E.02018
G1 X33.72 Y222.324 E.01868
G1 X33.383 Y221.923 E.01954
G1 X33.118 Y221.483 E.01912
G1 X32.852 Y220.79 E.02764
G1 X32.755 Y220.321 E.01784
G1 X32.722 Y219.828 E.01843
G1 X32.722 Y32.177 E6.98926
G1 X32.761 Y31.641 E.02004
G1 X32.879 Y31.122 E.01983
G1 X33.177 Y30.428 E.0281
G1 X33.47 Y29.972 E.02018
G1 X33.742 Y29.662 E.0154
M204 S6000
G1 X34.087 Y29.962 F30000
G1 F3000
M204 S500
G1 X34.114 Y29.931 E.00155
G1 X34.461 Y29.638 E.01691
G1 X34.855 Y29.401 E.01712
G1 X35.474 Y29.165 E.0247
G1 X35.875 Y29.084 E.01522
G1 X36.318 Y29.054 E.01652
G1 X219.686 Y29.054 E6.82977
G1 X220.158 Y29.089 E.01764
G1 X220.603 Y29.189 E.01699
G1 X221.224 Y29.454 E.02515
G1 X221.619 Y29.706 E.01743
G1 X221.944 Y29.989 E.01606
G1 X222.237 Y30.336 E.01691
G1 X222.474 Y30.73 E.01712
G1 X222.71 Y31.349 E.0247
G1 X222.791 Y31.75 E.01522
G1 X222.821 Y32.193 E.01653
G1 X222.821 Y219.801 E6.9877
G1 X222.786 Y220.281 E.01792
G1 X222.679 Y220.748 E.01783
G1 X222.412 Y221.366 E.02511
G1 X222.17 Y221.743 E.01668
G1 X221.886 Y222.069 E.0161
G1 X221.539 Y222.362 E.01691
G1 X221.145 Y222.599 E.01712
G1 X220.526 Y222.835 E.0247
G1 X220.125 Y222.916 E.01522
G1 X219.682 Y222.946 E.01653
G1 X36.324 Y222.946 E6.8294
G1 X35.844 Y222.911 E.01792
G1 X35.377 Y222.804 E.01783
G1 X34.759 Y222.537 E.02511
G1 X34.382 Y222.295 E.01668
G1 X34.056 Y222.011 E.0161
G1 X33.763 Y221.664 E.01691
G1 X33.526 Y221.27 E.01712
G1 X33.29 Y220.651 E.0247
G1 X33.209 Y220.25 E.01522
G1 X33.179 Y219.807 E.01652
G1 X33.179 Y32.199 E6.98771
G1 X33.214 Y31.719 E.01792
G1 X33.321 Y31.252 E.01783
G1 X33.588 Y30.634 E.02511
G1 X33.83 Y30.257 E.01668
G1 X34.047 Y30.007 E.01232
M204 S6000
G1 X34.393 Y30.307 F30000
G1 F3000
M204 S500
G1 X34.429 Y30.265 E.00204
G1 X34.737 Y30.005 E.01504
G1 X35.067 Y29.809 E.01427
G1 X35.613 Y29.603 E.02174
G1 X35.945 Y29.537 E.0126
G1 X36.337 Y29.511 E.01465
G1 X219.664 Y29.511 E6.82823
G1 X220.081 Y29.541 E.01555
G1 X220.473 Y29.631 E.015
G1 X221.02 Y29.866 E.02216
G1 X221.336 Y30.067 E.01395
G1 X221.61 Y30.304 E.01348
G1 X221.87 Y30.612 E.01504
G1 X222.066 Y30.942 E.01427
G1 X222.272 Y31.488 E.02174
G1 X222.338 Y31.82 E.0126
G1 X222.364 Y32.212 E.01465
G1 X222.364 Y219.78 E6.98617
G1 X222.331 Y220.223 E.01658
G1 X222.238 Y220.616 E.01502
G1 X222.001 Y221.16 E.02211
G1 X221.809 Y221.46 E.01325
G1 X221.571 Y221.735 E.01354
G1 X221.263 Y221.995 E.01504
G1 X220.933 Y222.191 E.01427
G1 X220.387 Y222.397 E.02174
G1 X220.055 Y222.463 E.0126
G1 X219.663 Y222.489 E.01465
G1 X36.345 Y222.489 E6.82787
G1 X35.902 Y222.456 E.01658
G1 X35.509 Y222.363 E.01502
G1 X34.965 Y222.126 E.02211
M73 P14 R50
G1 X34.665 Y221.934 E.01325
G1 X34.39 Y221.696 E.01354
G1 X34.13 Y221.388 E.01504
G1 X33.934 Y221.058 E.01427
G1 X33.728 Y220.512 E.02174
G1 X33.662 Y220.18 E.0126
G1 X33.636 Y219.788 E.01465
G1 X33.636 Y32.22 E6.98618
G1 X33.669 Y31.777 E.01657
G1 X33.762 Y31.384 E.01502
G1 X33.999 Y30.84 E.02211
M73 P14 R49
G1 X34.191 Y30.54 E.01325
G1 X34.354 Y30.352 E.00927
M204 S6000
G1 X34.721 Y30.644 F30000
G1 F3000
M204 S500
G1 X34.73 Y30.633 E.00054
G1 X35.092 Y30.333 E.0175
G1 X35.435 Y30.148 E.01452
G1 X35.803 Y30.029 E.0144
G1 X36.286 Y29.968 E.01815
G1 X219.708 Y29.968 E6.83178
G1 X220.25 Y30.045 E.02039
G1 X220.625 Y30.175 E.01478
G1 X220.97 Y30.38 E.01495
G1 X221.326 Y30.691 E.0176
G1 X221.6 Y31.059 E.0171
G1 X221.764 Y31.402 E.01413
G1 X221.866 Y31.774 E.01438
G1 X221.907 Y32.16 E.01445
G1 X221.907 Y219.843 E6.99049
G1 X221.863 Y220.227 E.01438
G1 X221.717 Y220.707 E.01871
G1 X221.491 Y221.102 E.01695
G1 X221.183 Y221.452 E.01733
G1 X220.816 Y221.725 E.01706
G1 X220.473 Y221.889 E.01414
G1 X220.101 Y221.991 E.01438
G1 X219.715 Y222.032 E.01445
G1 X36.282 Y222.032 E6.83219
G1 X35.898 Y221.988 E.01438
G1 X35.418 Y221.842 E.01871
G1 X35.023 Y221.616 E.01695
G1 X34.673 Y221.308 E.01733
G1 X34.4 Y220.941 E.01707
G1 X34.236 Y220.598 E.01414
G1 X34.134 Y220.226 E.01439
G1 X34.093 Y219.84 E.01444
G1 X34.093 Y32.166 E6.99016
G1 X34.149 Y31.717 E.01686
G1 X34.253 Y31.358 E.01391
G1 X34.448 Y30.987 E.01562
G1 X34.683 Y30.691 E.01407
M204 S6000
G1 X35.034 Y30.982 F30000
G1 F3000
M204 S500
G1 X35.089 Y30.916 E.0032
G1 X35.381 Y30.687 E.01382
G1 X35.648 Y30.552 E.01116
G1 X35.942 Y30.464 E.01143
G1 X36.277 Y30.425 E.01256
G1 X219.718 Y30.425 E6.83246
G1 X220.105 Y30.478 E.01457
G1 X220.392 Y30.568 E.01116
G1 X220.672 Y30.725 E.01199
G1 X220.959 Y30.964 E.01391
G1 X221.188 Y31.256 E.01381
G1 X221.323 Y31.523 E.01117
G1 X221.411 Y31.817 E.01142
G1 X221.45 Y32.152 E.01257
G1 X221.45 Y219.851 E6.99105
G1 X221.409 Y220.181 E.01241
G1 X221.279 Y220.577 E.01549
G1 X221.146 Y220.802 E.00975
G1 X220.911 Y221.085 E.0137
G1 X220.619 Y221.313 E.01378
G1 X220.352 Y221.448 E.01117
G1 X220.058 Y221.536 E.01142
G1 X219.723 Y221.575 E.01257
G1 X36.274 Y221.575 E6.83275
G1 X35.944 Y221.534 E.01241
G1 X35.548 Y221.404 E.01549
G1 X35.323 Y221.271 E.00975
G1 X35.04 Y221.036 E.0137
G1 X34.812 Y220.744 E.01379
G1 X34.677 Y220.477 E.01116
G1 X34.589 Y220.183 E.01143
G1 X34.55 Y219.848 E.01256
G1 X34.55 Y32.157 E6.99075
G1 X34.603 Y31.77 E.01457
G1 X34.693 Y31.483 E.01116
G1 X34.85 Y31.203 E.01199
G1 X34.996 Y31.028 E.00847
M204 S6000
G1 X35.347 Y31.32 F30000
G1 F3000
M204 S500
G1 X35.446 Y31.201 E.00577
G1 X35.653 Y31.054 E.00943
G1 X35.85 Y30.962 E.0081
G1 X35.992 Y30.919 E.00552
G1 X36.269 Y30.882 E.01043
M73 P15 R49
G1 X219.727 Y30.882 E6.8331
G1 X220.045 Y30.931 E.01198
G1 X220.253 Y31.003 E.00819
G1 X220.371 Y31.069 E.00504
G1 X220.674 Y31.321 E.0147
G1 X220.821 Y31.528 E.00943
G1 X220.913 Y31.725 E.0081
G1 X220.956 Y31.867 E.00552
G1 X220.993 Y32.144 E.01044
G1 X220.993 Y219.859 E6.99166
G1 X220.974 Y220.041 E.00679
G1 X220.88 Y220.355 E.01222
G1 X220.802 Y220.501 E.00617
G1 X220.554 Y220.799 E.01445
G1 X220.347 Y220.946 E.00943
G1 X220.15 Y221.038 E.0081
G1 X220.008 Y221.081 E.00552
G1 X219.731 Y221.118 E.01044
G1 X36.266 Y221.118 E6.83337
G1 X36.084 Y221.099 E.00679
G1 X35.77 Y221.005 E.01222
G1 X35.624 Y220.927 E.00617
G1 X35.326 Y220.679 E.01445
G1 X35.179 Y220.472 E.00944
G1 X35.087 Y220.275 E.0081
G1 X35.044 Y220.133 E.00552
G1 X35.007 Y219.856 E.01043
G1 X35.007 Y32.148 E6.9914
G1 X35.056 Y31.83 E.01198
G1 X35.128 Y31.622 E.00819
G1 X35.194 Y31.504 E.00504
G1 X35.309 Y31.366 E.00669
M204 S6000
G1 X35.667 Y31.637 F30000
G1 F3000
M204 S500
G1 X35.723 Y31.564 E.00345
G1 X35.836 Y31.473 E.00541
G1 X36.053 Y31.371 E.00893
G1 X36.261 Y31.339 E.00782
G1 X219.738 Y31.339 E6.83382
G1 X219.971 Y31.382 E.00884
G1 X220.089 Y31.429 E.00475
G1 X220.311 Y31.598 E.01037
G1 X220.402 Y31.711 E.00541
G1 X220.504 Y31.928 E.00892
G1 X220.536 Y32.136 E.00782
G1 X220.536 Y219.866 E6.99226
G1 X220.52 Y219.993 E.00475
G1 X220.444 Y220.218 E.00884
G1 X220.277 Y220.436 E.01023
G1 X220.164 Y220.527 E.00541
G1 X219.947 Y220.629 E.00892
G1 X219.739 Y220.661 E.00782
G1 X36.259 Y220.661 E6.83396
G1 X36.132 Y220.645 E.00475
G1 X35.907 Y220.569 E.00884
G1 X35.689 Y220.402 E.01023
G1 X35.598 Y220.289 E.00541
G1 X35.496 Y220.072 E.00893
G1 X35.464 Y219.864 E.00782
G1 X35.464 Y32.137 E6.99212
G1 X35.507 Y31.904 E.00884
G1 X35.554 Y31.786 E.00475
G1 X35.63 Y31.685 E.00469
M204 S6000
G1 X35.997 Y31.93 F30000
G1 F3000
M204 S500
G1 X36.134 Y31.821 E.00651
G1 X36.25 Y31.796 E.00442
G1 X219.75 Y31.796 E6.83468
G1 X219.861 Y31.825 E.00426
M73 P15 R48
G1 X219.945 Y31.872 E.00361
G1 X220.054 Y32.009 E.00651
G1 X220.079 Y32.125 E.00442
G1 X220.079 Y219.875 E6.99297
G1 X220.05 Y219.986 E.00426
G1 X220.003 Y220.07 E.00361
G1 X219.866 Y220.179 E.00651
G1 X219.75 Y220.204 E.00442
G1 X36.25 Y220.204 E6.83468
G1 X36.139 Y220.175 E.00426
G1 X36.055 Y220.128 E.00361
G1 X35.946 Y219.991 E.00651
G1 X35.921 Y219.875 E.00442
G1 X35.921 Y32.125 E6.99297
G1 X35.95 Y32.014 E.00426
G1 X35.968 Y31.982 E.00137
; WIPE_START
G1 X36.134 Y31.821 E-.08797
G1 X36.25 Y31.796 E-.04514
G1 X37.9 Y31.796 E-.6269
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X43.205 Y37.284 Z.6 F30000
G1 X219.35 Y219.475 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X36.65 Y219.475 E6.80488
G1 X36.65 Y32.525 E6.96318
M73 P16 R48
G1 X219.35 Y32.525 E6.80488
G1 X219.35 Y219.415 E6.96094
M204 S6000
G1 X218.893 Y219.018 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X37.107 Y219.018 E6.77083
G1 X37.107 Y32.982 E6.92913
G1 X218.893 Y32.982 E6.77083
G1 X218.893 Y218.958 E6.92689
M204 S6000
G1 X218.436 Y218.561 F30000
G1 F3000
M204 S500
G1 X37.564 Y218.561 E6.73678
G1 X37.564 Y33.439 E6.89508
G1 X218.436 Y33.439 E6.73678
G1 X218.436 Y218.501 E6.89285
M204 S6000
G1 X217.979 Y218.104 F30000
G1 F3000
M204 S500
G1 X38.021 Y218.104 E6.70274
G1 X38.021 Y33.896 E6.86103
G1 X217.979 Y33.896 E6.70274
G1 X217.979 Y218.044 E6.8588
; WIPE_START
G1 X215.979 Y218.044 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X208.358 Y217.614 Z.6 F30000
G1 X44.656 Y208.362 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X44.967 Y208.091 E.01537
G3 X45.983 Y207.691 I1.286 J1.779 E.04109
G1 X46.195 Y207.675 E.00792
G3 X44.617 Y208.407 I.058 J2.194 E.44704
M204 S6000
G1 X44.289 Y208.081 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X44.304 Y208.069 E.0007
G3 X45.927 Y207.237 I1.95 J1.805 E.06935
G1 X46.184 Y207.218 E.0096
G3 X44.134 Y208.272 I.07 J2.656 E.533
G1 X44.252 Y208.128 E.00693
M204 S6000
G1 X43.941 Y207.785 F30000
G1 F3000
M204 S500
G1 X43.969 Y207.758 E.00142
G3 X45.87 Y206.783 I2.286 J2.115 E.08126
G1 X46.172 Y206.76 E.01127
G3 X43.769 Y207.996 I.082 J3.113 E.62473
G1 X43.903 Y207.832 E.00791
M204 S6000
G1 X43.593 Y207.489 F30000
G1 F3000
M204 S500
G1 X43.633 Y207.447 E.00215
G3 X45.814 Y206.329 I2.621 J2.426 E.09318
G1 X46.161 Y206.303 E.01295
G3 X43.405 Y207.72 I.094 J3.571 E.7165
M73 P17 R48
G1 X43.555 Y207.535 E.00888
; WIPE_START
G1 X43.633 Y207.447 E-.04471
G1 X43.886 Y207.196 E-.13537
G1 X44.164 Y206.974 E-.13534
G1 X44.463 Y206.781 E-.13519
G1 X44.78 Y206.618 E-.13544
M73 P17 R47
G1 X45.112 Y206.488 E-.13552
G1 X45.209 Y206.46 E-.03842
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X45.512 Y198.834 Z.6 F30000
G1 X48.416 Y125.656 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
M73 P18 R47
G1 F3000
M204 S500
G1 X48.448 Y126 E.01287
G3 X45.983 Y123.816 I-2.195 J-.006 E.37496
G1 X46.195 Y123.8 E.00792
G3 X48.405 Y125.564 I.058 J2.194 E.11445
G1 X48.409 Y125.596 E.00121
M204 S6000
G1 X48.858 Y125.492 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X48.898 Y125.735 E.00919
G3 X45.927 Y123.362 I-2.644 J.264 E.46395
G1 X46.184 Y123.343 E.0096
G3 X48.85 Y125.432 I.07 J2.656 E.1368
M204 S6000
G1 X49.31 Y125.42 F30000
G1 F3000
M204 S500
G1 X49.353 Y125.689 E.01016
G3 X45.871 Y122.908 I-3.099 J.309 E.54383
G1 X46.172 Y122.885 E.01127
G3 X49.303 Y125.361 I.082 J3.113 E.16134
M204 S6000
G1 X49.761 Y125.349 F30000
G1 F3000
M204 S500
G1 X49.809 Y125.644 E.01113
G3 X45.814 Y122.454 I-3.554 J.354 E.62371
G1 X46.161 Y122.428 E.01295
G3 X49.755 Y125.289 I.094 J3.571 E.18588
; WIPE_START
G1 X49.809 Y125.644 E-.13626
G1 X49.823 Y126 E-.13545
G1 X49.806 Y126.356 E-.13538
G1 X49.753 Y126.708 E-.13537
G1 X49.665 Y127.053 E-.13541
G1 X49.591 Y127.256 E-.08213
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X56.458 Y130.587 Z.6 F30000
G1 X200.15 Y200.275 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X55.85 Y200.275 E5.37463
G1 X55.85 Y51.725 E5.53292
G1 X200.15 Y51.725 E5.37463
G1 X200.15 Y200.215 E5.53069
M204 S6000
G1 X200.607 Y200.732 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X55.393 Y200.732 E5.40867
G1 X55.393 Y51.268 E5.56697
G1 X200.607 Y51.268 E5.40867
G1 X200.607 Y200.672 E5.56474
M204 S6000
G1 X201.064 Y201.189 F30000
G1 F3000
M204 S500
G1 X54.936 Y201.189 E5.44272
G1 X54.936 Y50.811 E5.60102
G1 X201.064 Y50.811 E5.44272
G1 X201.064 Y201.129 E5.59878
M204 S6000
G1 X201.521 Y201.646 F30000
G1 F3000
M204 S500
G1 X54.479 Y201.646 E5.47677
G1 X54.479 Y50.354 E5.63507
G1 X201.521 Y50.354 E5.47677
G1 X201.521 Y201.586 E5.63283
; WIPE_START
G1 X199.521 Y201.587 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X194.266 Y196.052 Z.6 F30000
G1 X46.028 Y39.938 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X46.195 Y39.925 E.00626
G3 X45.968 Y39.943 I.058 J2.194 E.50518
M204 S6000
G1 X45.449 Y39.592 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X45.66 Y39.534 E.00816
G3 X45.927 Y39.487 I.594 J2.59 E.01009
G1 X46.184 Y39.468 E.0096
G3 X45.392 Y39.61 I.07 J2.656 E.59173
M204 S6000
G1 X44.886 Y39.327 F30000
G1 F3000
M204 S500
G1 X44.969 Y39.287 E.00342
G3 X45.871 Y39.033 I1.285 J2.837 E.03502
G1 X46.172 Y39.01 E.01127
G3 X44.693 Y39.429 I.082 J3.113 E.67098
G1 X44.833 Y39.355 E.0059
M204 S6000
G1 X44.323 Y39.121 F30000
G1 F3000
M204 S500
G1 X44.465 Y39.032 E.00624
G3 X45.814 Y38.579 I1.79 J3.091 E.05339
G1 X46.161 Y38.553 E.01295
G3 X44.166 Y39.226 I.094 J3.571 E.75628
G1 X44.273 Y39.155 E.00479
; WIPE_START
G1 X44.465 Y39.032 E-.08643
G1 X44.78 Y38.868 E-.1352
G1 X45.112 Y38.738 E-.13557
G1 X45.458 Y38.64 E-.1365
G1 X45.814 Y38.579 E-.13742
G1 X46.152 Y38.553 E-.12888
; WIPE_END
M73 P19 R47
G1 E-.04 F1800
M204 S6000
G1 X53.784 Y38.683 Z.6 F30000
M73 P19 R46
G1 X127.747 Y39.94 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X127.945 Y39.925 E.0074
G3 X127.688 Y39.947 I.058 J2.194 E.50404
M204 S6000
G1 X127.199 Y39.593 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X127.41 Y39.534 E.00817
G3 X127.677 Y39.487 I.594 J2.59 E.01009
G1 X127.934 Y39.468 E.0096
G3 X127.141 Y39.611 I.07 J2.656 E.59172
M204 S6000
G1 X126.636 Y39.327 F30000
M73 P20 R46
G1 F3000
M204 S500
G1 X126.719 Y39.287 E.00344
G3 X127.62 Y39.033 I1.285 J2.837 E.03501
G1 X127.922 Y39.01 E.01127
G3 X126.443 Y39.429 I.082 J3.113 E.67098
G1 X126.583 Y39.355 E.00588
M204 S6000
G1 X126.072 Y39.121 F30000
G1 F3000
M204 S500
G1 X126.214 Y39.032 E.00625
G3 X127.564 Y38.579 I1.79 J3.091 E.0534
G1 X127.911 Y38.553 E.01295
G3 X125.916 Y39.226 I.094 J3.571 E.75629
G1 X126.022 Y39.155 E.00477
; WIPE_START
G1 X126.214 Y39.032 E-.08654
G1 X126.53 Y38.868 E-.13529
G1 X126.862 Y38.738 E-.13541
G1 X127.208 Y38.64 E-.13654
G1 X127.564 Y38.579 E-.1375
G1 X127.902 Y38.553 E-.12871
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X135.533 Y38.683 Z.6 F30000
G1 X209.497 Y39.94 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X209.695 Y39.925 E.0074
G3 X209.438 Y39.947 I.058 J2.194 E.50404
M204 S6000
G1 X209.915 Y39.473 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X209.949 Y39.474 E.00125
G3 X209.427 Y39.487 I-.195 J2.65 E.60234
G1 X209.684 Y39.468 E.0096
G1 X209.855 Y39.472 E.00639
M204 S6000
G1 X210.394 Y39.08 F30000
G1 F3000
M204 S500
G1 X210.594 Y39.124 E.00762
G3 X209.371 Y39.033 I-.84 J2.999 E.68283
G1 X209.672 Y39.01 E.01127
G3 X210.291 Y39.056 I.082 J3.113 E.02314
G1 X210.336 Y39.066 E.00172
M204 S6000
G1 X210.89 Y38.743 F30000
G1 F3000
M204 S500
G1 X211.056 Y38.797 E.00651
G3 X209.314 Y38.579 I-1.302 J3.326 E.76984
G1 X209.661 Y38.553 E.01295
G3 X210.718 Y38.684 I.094 J3.571 E.03982
G1 X210.833 Y38.723 E.00454
; WIPE_START
G1 X211.056 Y38.797 E-.08925
G1 X211.38 Y38.945 E-.13532
G1 X211.689 Y39.123 E-.13544
G1 X211.978 Y39.331 E-.13537
G1 X212.245 Y39.567 E-.13533
G1 X212.477 Y39.816 E-.1293
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X212.206 Y47.444 Z.6 F30000
G1 X209.497 Y123.815 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X209.695 Y123.8 E.0074
G3 X209.437 Y123.822 I.058 J2.194 E.50403
M204 S6000
G1 X208.949 Y123.468 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X209.16 Y123.409 E.00817
G3 X209.427 Y123.362 I.594 J2.59 E.01009
G1 X209.684 Y123.343 E.0096
G3 X208.892 Y123.486 I.07 J2.656 E.59172
M204 S6000
G1 X208.386 Y123.202 F30000
G1 F3000
M204 S500
G1 X208.469 Y123.162 E.00344
G3 X209.371 Y122.908 I1.285 J2.837 E.03501
G1 X209.672 Y122.885 E.01127
G3 X208.193 Y123.303 I.082 J3.113 E.67099
G1 X208.333 Y123.23 E.00588
M204 S6000
G1 X207.822 Y122.996 F30000
G1 F3000
M204 S500
G1 X207.965 Y122.907 E.00626
G3 X209.314 Y122.454 I1.79 J3.091 E.05339
G1 X209.661 Y122.428 E.01295
G3 X207.666 Y123.101 I.094 J3.571 E.75629
G1 X207.772 Y123.03 E.00478
; WIPE_START
G1 X207.965 Y122.907 E-.08662
G1 X208.28 Y122.743 E-.13516
G1 X208.612 Y122.613 E-.13546
G1 X208.958 Y122.515 E-.13655
G1 X209.314 Y122.454 E-.13742
G1 X209.652 Y122.428 E-.12877
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X209.638 Y130.061 Z.6 F30000
G1 X209.491 Y207.69 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X209.695 Y207.675 E.00763
G3 X209.431 Y207.698 I.058 J2.199 E.50487
M204 S6000
G1 X209.915 Y207.223 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X209.949 Y207.224 E.00125
G3 X209.427 Y207.237 I-.195 J2.65 E.60233
G1 X209.684 Y207.218 E.0096
G1 X209.855 Y207.222 E.00638
M204 S6000
G1 X210.394 Y206.83 F30000
G1 F3000
M204 S500
G1 X210.594 Y206.874 E.00762
G3 X209.37 Y206.783 I-.84 J2.999 E.68288
G1 X209.672 Y206.76 E.01127
G3 X210.291 Y206.806 I.082 J3.113 E.02316
G1 X210.336 Y206.816 E.00171
M204 S6000
G1 X210.89 Y206.493 F30000
G1 F3000
M204 S500
G1 X211.056 Y206.547 E.00652
G3 X209.314 Y206.329 I-1.301 J3.326 E.76984
G1 X209.661 Y206.303 E.01295
G3 X210.718 Y206.434 I.094 J3.571 E.03983
G1 X210.833 Y206.473 E.00452
; WIPE_START
G1 X211.056 Y206.547 E-.08929
G1 X211.38 Y206.695 E-.13541
G1 X211.689 Y206.873 E-.13543
G1 X211.978 Y207.081 E-.1353
G1 X212.245 Y207.317 E-.13541
G1 X212.476 Y207.566 E-.12916
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X204.851 Y207.901 Z.6 F30000
G1 X126.376 Y211.344 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X126.255 Y211.197 E.0071
G3 X127.733 Y207.691 I1.748 J-1.327 E.17143
G1 X127.945 Y207.675 E.00792
G3 X126.552 Y211.516 I.058 J2.194 E.31806
G1 X126.419 Y211.386 E.00692
M204 S6000
G1 X125.871 Y211.465 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X125.736 Y211.258 E.00917
G3 X127.677 Y207.237 I2.268 J-1.385 E.19748
G1 X127.934 Y207.218 E.0096
G3 X125.91 Y211.509 I.07 J2.656 E.40334
M204 S6000
G1 X125.495 Y211.725 F30000
G1 F3000
M204 S500
G1 X125.347 Y211.496 E.01014
G3 X127.621 Y206.783 I2.658 J-1.623 E.23146
G1 X127.922 Y206.76 E.01127
G3 X125.534 Y211.77 I.082 J3.113 E.47372
M204 S6000
G1 X125.189 Y212.077 F30000
G1 F3000
M204 S500
G1 X125.157 Y212.029 E.00215
G3 X127.565 Y206.329 I2.848 J-2.155 E.27871
G1 X127.911 Y206.303 E.01293
G3 X125.385 Y212.301 I.094 J3.571 E.53098
G1 X125.228 Y212.122 E.00888
; WIPE_START
G1 X125.157 Y212.029 E-.04467
G1 X124.951 Y211.738 E-.1353
G1 X124.78 Y211.425 E-.13533
G1 X124.642 Y211.097 E-.13536
G1 X124.537 Y210.757 E-.13534
G1 X124.467 Y210.408 E-.13532
G1 X124.456 Y210.306 E-.03868
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X128.001 Y203.547 Z.6 F30000
G1 X216.871 Y34.079 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.5003
G1 F6300
M204 S500
G1 X217.59 Y34.798 E.03789
G1 X217.59 Y35.445 E.02411
G1 X216.43 Y34.285 E.06115
G1 X215.783 Y34.285 E.02411
G1 X217.59 Y36.092 E.09524
G1 X217.59 Y36.738 E.02411
G1 X215.137 Y34.285 E.12933
G1 X214.49 Y34.285 E.02411
G1 X217.59 Y37.385 E.16343
G1 X217.59 Y38.032 E.02411
G1 X213.843 Y34.285 E.19752
G1 X213.196 Y34.285 E.02411
G1 X217.59 Y38.679 E.23161
G1 X217.59 Y39.326 E.02411
G1 X212.549 Y34.285 E.26571
G1 X211.902 Y34.285 E.02411
G1 X217.59 Y39.973 E.2998
G1 X217.59 Y40.619 E.02411
G1 X211.256 Y34.285 E.3339
G1 X210.609 Y34.285 E.02411
G1 X217.59 Y41.266 E.36799
G1 X217.59 Y41.913 E.02411
G1 X209.962 Y34.285 E.40208
G1 X209.315 Y34.285 E.02411
G1 X217.59 Y42.56 E.43618
G1 X217.59 Y43.207 E.02411
G1 X208.668 Y34.285 E.47027
G1 X208.021 Y34.285 E.02411
G1 X217.59 Y43.854 E.50436
G1 X217.59 Y44.5 E.02411
G1 X207.375 Y34.285 E.53846
G1 X206.728 Y34.285 E.02411
G1 X210.733 Y38.29 E.21112
G2 X209.968 Y38.172 I-1.048 J4.244 E.0289
G1 X206.081 Y34.285 E.20488
G1 X205.434 Y34.285 E.02411
G1 X209.337 Y38.187 E.20571
G2 X208.787 Y38.285 I.586 J4.908 E.02081
G1 X204.787 Y34.285 E.21084
G1 X204.14 Y34.285 E.02411
G1 X208.299 Y38.443 E.21919
G2 X207.857 Y38.648 I.805 J2.313 E.01818
G1 X203.494 Y34.285 E.22999
G1 X202.847 Y34.285 E.02411
G1 X207.457 Y38.895 E.243
G2 X207.098 Y39.183 I4.96 J6.537 E.01715
G1 X202.2 Y34.285 E.25819
G1 X201.553 Y34.285 E.02411
G1 X206.778 Y39.51 E.27541
G2 X206.495 Y39.874 I1.676 J1.596 E.01721
G1 X200.906 Y34.285 E.29459
G1 X200.259 Y34.285 E.02411
G1 X206.251 Y40.276 E.31579
G2 X206.048 Y40.72 I2.116 J1.236 E.01822
G1 X199.613 Y34.285 E.33919
G1 X198.966 Y34.285 E.02411
G1 X205.896 Y41.215 E.3653
G2 X205.808 Y41.774 I2.744 J.721 E.02111
G1 X198.319 Y34.285 E.39474
G1 X197.672 Y34.285 E.02411
G1 X205.802 Y42.414 E.42851
G2 X205.94 Y43.199 I4.222 J-.339 E.02975
G1 X196.82 Y34.079 E.48073
; WIPE_START
G1 X198.234 Y35.493 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X205.427 Y38.045 Z.6 F30000
G1 X213.27 Y40.827 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X217.59 Y45.147 E.2277
G1 X217.59 Y45.794 E.02411
G1 X213.701 Y41.905 E.20498
G3 X213.69 Y42.54 I-5.11 J.222 E.02369
G1 X217.59 Y46.441 E.2056
G1 X217.59 Y47.088 E.02411
G1 X213.589 Y43.086 E.21091
G3 X213.433 Y43.577 I-2.533 J-.535 E.01923
G1 X217.59 Y47.735 E.21913
G1 X217.59 Y48.381 E.02411
G1 X213.229 Y44.021 E.22985
G3 X212.979 Y44.417 I-2.101 J-1.053 E.0175
G1 X217.59 Y49.028 E.24307
G1 X217.59 Y49.675 E.02411
G1 X212.69 Y44.775 E.25829
G3 X212.364 Y45.096 I-1.769 J-1.467 E.01708
G1 X217.59 Y50.322 E.27545
G1 X217.59 Y50.969 E.02411
G1 X212.002 Y45.38 E.29457
G3 X211.601 Y45.626 I-1.427 J-1.878 E.01756
G1 X217.59 Y51.616 E.3157
G1 X217.59 Y52.262 E.02411
G1 X211.155 Y45.828 E.33917
G3 X210.658 Y45.977 I-.995 J-2.409 E.01939
G1 X217.59 Y52.909 E.36539
G1 X217.59 Y53.556 E.02411
G1 X210.103 Y46.069 E.39463
G3 X209.459 Y46.072 I-.34 J-4.474 E.02403
G1 X217.59 Y54.203 E.42858
G1 X217.59 Y54.85 E.02411
G1 X208.344 Y45.604 E.48735
; WIPE_START
G1 X209.758 Y47.018 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X214.943 Y52.619 Z.6 F30000
G1 X217.796 Y55.702 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X196.378 Y34.285 E1.12889
G1 X195.732 Y34.285 E.02411
G1 X217.59 Y56.143 E1.15215
G1 X217.59 Y56.79 E.02411
G1 X195.085 Y34.285 E1.18624
G1 X194.438 Y34.285 E.02411
G1 X217.59 Y57.437 E1.22033
G1 X217.59 Y58.084 E.02411
G1 X193.791 Y34.285 E1.25443
G1 X193.144 Y34.285 E.02411
G1 X217.59 Y58.731 E1.28852
G1 X217.59 Y59.378 E.02411
G1 X192.497 Y34.285 E1.32261
G1 X191.851 Y34.285 E.02411
G1 X217.59 Y60.024 E1.35671
G1 X217.59 Y60.671 E.02411
G1 X191.204 Y34.285 E1.3908
G1 X190.557 Y34.285 E.02411
G1 X217.59 Y61.318 E1.42489
G1 X217.59 Y61.965 E.02411
G1 X189.91 Y34.285 E1.45899
G1 X189.263 Y34.285 E.02411
G1 X217.59 Y62.612 E1.49308
G1 X217.59 Y63.259 E.02411
G1 X188.616 Y34.285 E1.52718
G1 X187.97 Y34.285 E.02411
G1 X217.59 Y63.905 E1.56127
G1 X217.59 Y64.552 E.02411
G1 X187.323 Y34.285 E1.59536
G1 X186.676 Y34.285 E.02411
G1 X217.59 Y65.199 E1.62946
G1 X217.59 Y65.846 E.02411
G1 X186.029 Y34.285 E1.66355
G1 X185.382 Y34.285 E.02411
G1 X201.063 Y49.965 E.8265
G1 X200.416 Y49.965 E.02411
G1 X184.735 Y34.285 E.8265
G1 X184.089 Y34.285 E.02411
G1 X199.769 Y49.965 E.8265
G1 X199.122 Y49.965 E.02411
G1 X183.442 Y34.285 E.8265
G1 X182.795 Y34.285 E.02411
G1 X198.475 Y49.965 E.8265
G1 X197.829 Y49.965 E.02411
G1 X182.148 Y34.285 E.8265
G1 X181.501 Y34.285 E.02411
G1 X197.182 Y49.965 E.8265
G1 X196.535 Y49.965 E.02411
G1 X180.854 Y34.285 E.8265
G1 X180.208 Y34.285 E.02411
G1 X195.888 Y49.965 E.8265
G1 X195.241 Y49.965 E.02411
G1 X179.561 Y34.285 E.8265
G1 X178.914 Y34.285 E.02411
G1 X194.594 Y49.965 E.8265
G1 X193.948 Y49.965 E.02411
G1 X178.267 Y34.285 E.8265
G1 X177.62 Y34.285 E.02411
G1 X193.301 Y49.965 E.8265
G1 X192.654 Y49.965 E.02411
G1 X176.973 Y34.285 E.8265
M73 P20 R45
G1 X176.327 Y34.285 E.02411
G1 X192.007 Y49.965 E.8265
G1 X191.36 Y49.965 E.02411
G1 X175.68 Y34.285 E.8265
G1 X175.033 Y34.285 E.02411
G1 X190.713 Y49.965 E.8265
G1 X190.067 Y49.965 E.02411
G1 X174.386 Y34.285 E.8265
G1 X173.739 Y34.285 E.02411
G1 X189.42 Y49.965 E.8265
G1 X188.773 Y49.965 E.02411
M73 P21 R45
G1 X173.092 Y34.285 E.8265
G1 X172.446 Y34.285 E.02411
G1 X188.126 Y49.965 E.8265
G1 X187.479 Y49.965 E.02411
G1 X171.799 Y34.285 E.8265
G1 X171.152 Y34.285 E.02411
G1 X186.832 Y49.965 E.8265
G1 X186.186 Y49.965 E.02411
G1 X170.505 Y34.285 E.8265
G1 X169.858 Y34.285 E.02411
G1 X185.539 Y49.965 E.8265
G1 X184.892 Y49.965 E.02411
G1 X169.211 Y34.285 E.8265
G1 X168.565 Y34.285 E.02411
G1 X184.245 Y49.965 E.8265
G1 X183.598 Y49.965 E.02411
G1 X167.918 Y34.285 E.8265
G1 X167.271 Y34.285 E.02411
G1 X182.951 Y49.965 E.8265
G1 X182.305 Y49.965 E.02411
G1 X166.624 Y34.285 E.8265
G1 X165.977 Y34.285 E.02411
G1 X181.658 Y49.965 E.8265
G1 X181.011 Y49.965 E.02411
G1 X165.33 Y34.285 E.8265
G1 X164.684 Y34.285 E.02411
G1 X180.364 Y49.965 E.8265
G1 X179.717 Y49.965 E.02411
G1 X164.037 Y34.285 E.8265
G1 X163.39 Y34.285 E.02411
G1 X179.07 Y49.965 E.8265
G1 X178.424 Y49.965 E.02411
G1 X162.743 Y34.285 E.8265
G1 X162.096 Y34.285 E.02411
G1 X177.777 Y49.965 E.8265
G1 X177.13 Y49.965 E.02411
G1 X161.449 Y34.285 E.8265
G1 X160.803 Y34.285 E.02411
G1 X176.483 Y49.965 E.8265
G1 X175.836 Y49.965 E.02411
G1 X160.156 Y34.285 E.8265
G1 X159.509 Y34.285 E.02411
G1 X175.189 Y49.965 E.8265
G1 X174.543 Y49.965 E.02411
G1 X158.862 Y34.285 E.8265
G1 X158.215 Y34.285 E.02411
G1 X173.896 Y49.965 E.8265
G1 X173.249 Y49.965 E.02411
G1 X157.568 Y34.285 E.8265
G1 X156.922 Y34.285 E.02411
G1 X172.602 Y49.965 E.8265
G1 X171.955 Y49.965 E.02411
G1 X156.275 Y34.285 E.8265
G1 X155.628 Y34.285 E.02411
G1 X171.308 Y49.965 E.8265
G1 X170.662 Y49.965 E.02411
G1 X154.981 Y34.285 E.8265
G1 X154.334 Y34.285 E.02411
G1 X170.015 Y49.965 E.8265
G1 X169.368 Y49.965 E.02411
G1 X153.687 Y34.285 E.8265
G1 X153.041 Y34.285 E.02411
G1 X168.721 Y49.965 E.8265
G1 X168.074 Y49.965 E.02411
G1 X152.394 Y34.285 E.8265
G1 X151.747 Y34.285 E.02411
G1 X167.427 Y49.965 E.8265
G1 X166.781 Y49.965 E.02411
G1 X151.1 Y34.285 E.8265
G1 X150.453 Y34.285 E.02411
G1 X166.134 Y49.965 E.8265
G1 X165.487 Y49.965 E.02411
G1 X149.806 Y34.285 E.8265
G1 X149.16 Y34.285 E.02411
G1 X164.84 Y49.965 E.8265
G1 X164.193 Y49.965 E.02411
G1 X148.513 Y34.285 E.8265
G1 X147.866 Y34.285 E.02411
G1 X163.546 Y49.965 E.8265
G1 X162.9 Y49.965 E.02411
G1 X147.219 Y34.285 E.8265
G1 X146.572 Y34.285 E.02411
G1 X162.253 Y49.965 E.8265
G1 X161.606 Y49.965 E.02411
G1 X145.925 Y34.285 E.8265
G1 X145.279 Y34.285 E.02411
G1 X160.959 Y49.965 E.8265
G1 X160.312 Y49.965 E.02411
G1 X144.632 Y34.285 E.8265
G1 X143.985 Y34.285 E.02411
G1 X159.665 Y49.965 E.8265
G1 X159.019 Y49.965 E.02411
G1 X143.338 Y34.285 E.8265
G1 X142.691 Y34.285 E.02411
G1 X158.372 Y49.965 E.8265
G1 X157.725 Y49.965 E.02411
G1 X142.044 Y34.285 E.8265
G1 X141.398 Y34.285 E.02411
G1 X157.078 Y49.965 E.8265
G1 X156.431 Y49.965 E.02411
G1 X140.751 Y34.285 E.8265
G1 X140.104 Y34.285 E.02411
G1 X155.784 Y49.965 E.8265
G1 X155.138 Y49.965 E.02411
G1 X139.457 Y34.285 E.8265
G1 X138.81 Y34.285 E.02411
G1 X154.491 Y49.965 E.8265
G1 X153.844 Y49.965 E.02411
G1 X138.163 Y34.285 E.8265
G1 X137.517 Y34.285 E.02411
G1 X153.197 Y49.965 E.8265
G1 X152.55 Y49.965 E.02411
G1 X136.87 Y34.285 E.8265
G1 X136.223 Y34.285 E.02411
G1 X151.903 Y49.965 E.8265
G1 X151.257 Y49.965 E.02411
G1 X135.576 Y34.285 E.8265
G1 X134.929 Y34.285 E.02411
G1 X150.61 Y49.965 E.8265
G1 X149.963 Y49.965 E.02411
G1 X134.282 Y34.285 E.8265
G1 X133.636 Y34.285 E.02411
G1 X149.316 Y49.965 E.8265
G1 X148.669 Y49.965 E.02411
G1 X132.989 Y34.285 E.8265
G1 X132.342 Y34.285 E.02411
G1 X148.022 Y49.965 E.8265
G1 X147.376 Y49.965 E.02411
G1 X131.695 Y34.285 E.8265
G1 X131.048 Y34.285 E.02411
G1 X146.729 Y49.965 E.8265
G1 X146.082 Y49.965 E.02411
G1 X130.401 Y34.285 E.8265
G1 X129.755 Y34.285 E.02411
G1 X145.435 Y49.965 E.8265
G1 X144.788 Y49.965 E.02411
G1 X129.108 Y34.285 E.8265
G1 X128.461 Y34.285 E.02411
G1 X144.141 Y49.965 E.8265
G1 X143.495 Y49.965 E.02411
G1 X127.814 Y34.285 E.8265
G1 X127.167 Y34.285 E.02411
G1 X142.848 Y49.965 E.8265
G1 X142.201 Y49.965 E.02411
G1 X126.52 Y34.285 E.8265
G1 X125.874 Y34.285 E.02411
G1 X141.554 Y49.965 E.8265
G1 X140.907 Y49.965 E.02411
G1 X131.722 Y40.78 E.48415
G2 X129.344 Y38.402 I-3.689 J1.31 E.12957
G1 X125.227 Y34.285 E.21699
G1 X124.58 Y34.285 E.02411
G1 X128.494 Y38.198 E.20629
G2 X127.818 Y38.17 I-.516 J4.224 E.02522
G1 X123.933 Y34.285 E.20479
G1 X123.286 Y34.285 E.02411
G1 X127.242 Y38.24 E.20849
G2 X126.728 Y38.373 I1.244 J5.876 E.01979
G1 X122.639 Y34.285 E.21549
G1 X121.993 Y34.285 E.02411
G1 X126.272 Y38.564 E.22555
M73 P22 R45
G2 X125.858 Y38.797 I.959 J2.183 E.01773
G1 X121.346 Y34.285 E.23785
G1 X120.699 Y34.285 E.02411
G1 X125.484 Y39.07 E.25221
G2 X125.147 Y39.38 I1.378 J1.837 E.01709
G1 X120.052 Y34.285 E.26854
G1 X119.405 Y34.285 E.02411
G1 X124.847 Y39.726 E.28681
G2 X124.588 Y40.115 I6.755 J4.769 E.01739
G1 X118.758 Y34.285 E.30729
G1 X118.112 Y34.285 E.02411
G1 X124.371 Y40.545 E.32995
G2 X124.2 Y41.019 I2.291 J1.098 E.01885
G1 X117.465 Y34.285 E.35498
G1 X116.818 Y34.285 E.02411
G1 X124.081 Y41.547 E.3828
G2 X124.043 Y42.156 I3.026 J.495 E.02277
G1 X116.171 Y34.285 E.41489
G1 X115.524 Y34.285 E.02411
G1 X124.39 Y43.151 E.46731
; WIPE_START
G1 X122.976 Y41.736 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X130.602 Y41.431 Z.6 F30000
G1 X131.683 Y41.388 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X140.26 Y49.965 E.4521
G1 X139.614 Y49.965 E.02411
G1 X131.953 Y42.305 E.40376
G3 X131.887 Y42.886 I-2.937 J-.039 E.02183
G1 X138.967 Y49.965 E.37314
G1 X138.32 Y49.965 E.02411
G1 X131.749 Y43.395 E.34633
G3 X131.56 Y43.853 I-2.384 J-.715 E.01849
G1 X137.673 Y49.965 E.32219
G1 X137.026 Y49.965 E.02411
G1 X131.329 Y44.268 E.30032
G3 X131.057 Y44.643 I-2.011 J-1.167 E.0173
G1 X136.379 Y49.965 E.28053
G1 X135.733 Y49.965 E.02411
G1 X130.747 Y44.979 E.26281
G3 X130.397 Y45.276 I-1.661 J-1.604 E.01713
G1 X135.086 Y49.965 E.24716
G1 X134.439 Y49.965 E.02411
G1 X130.009 Y45.535 E.23352
G3 X129.58 Y45.754 I-1.311 J-2.039 E.01795
G1 X133.792 Y49.965 E.22199
G1 X133.145 Y49.965 E.02411
G1 X129.108 Y45.928 E.21282
G3 X128.575 Y46.041 I-1.351 J-5.028 E.02033
G1 X132.498 Y49.965 E.20682
G1 X131.852 Y49.965 E.02411
G1 X127.971 Y46.084 E.20455
G3 X127.251 Y46.011 I.081 J-4.381 E.027
G1 X131.205 Y49.965 E.2084
G1 X130.558 Y49.965 E.02411
G1 X126.287 Y45.694 E.22514
G3 X124.425 Y43.832 I1.689 J-3.55 E.10006
G1 X114.877 Y34.285 E.50323
G1 X114.231 Y34.285 E.02411
G1 X129.911 Y49.965 E.8265
G1 X129.264 Y49.965 E.02411
G1 X113.584 Y34.285 E.8265
G1 X112.937 Y34.285 E.02411
G1 X128.617 Y49.965 E.8265
G1 X127.971 Y49.965 E.02411
G1 X112.29 Y34.285 E.8265
G1 X111.643 Y34.285 E.02411
G1 X127.324 Y49.965 E.8265
G1 X126.677 Y49.965 E.02411
G1 X110.996 Y34.285 E.8265
G1 X110.35 Y34.285 E.02411
G1 X126.03 Y49.965 E.8265
G1 X125.383 Y49.965 E.02411
G1 X109.703 Y34.285 E.8265
G1 X109.056 Y34.285 E.02411
G1 X124.736 Y49.965 E.8265
G1 X124.09 Y49.965 E.02411
G1 X108.409 Y34.285 E.8265
G1 X107.762 Y34.285 E.02411
G1 X123.443 Y49.965 E.8265
G1 X122.796 Y49.965 E.02411
G1 X107.115 Y34.285 E.8265
G1 X106.469 Y34.285 E.02411
G1 X122.149 Y49.965 E.8265
G1 X121.502 Y49.965 E.02411
G1 X105.822 Y34.285 E.8265
G1 X105.175 Y34.285 E.02411
G1 X120.855 Y49.965 E.8265
G1 X120.209 Y49.965 E.02411
G1 X104.528 Y34.285 E.8265
G1 X103.881 Y34.285 E.02411
G1 X119.562 Y49.965 E.8265
G1 X118.915 Y49.965 E.02411
G1 X103.234 Y34.285 E.8265
G1 X102.588 Y34.285 E.02411
G1 X118.268 Y49.965 E.8265
G1 X117.621 Y49.965 E.02411
G1 X101.941 Y34.285 E.8265
G1 X101.294 Y34.285 E.02411
G1 X116.974 Y49.965 E.8265
G1 X116.328 Y49.965 E.02411
G1 X100.647 Y34.285 E.8265
G1 X100 Y34.285 E.02411
G1 X115.681 Y49.965 E.8265
G1 X115.034 Y49.965 E.02411
G1 X99.353 Y34.285 E.8265
G1 X98.707 Y34.285 E.02411
G1 X114.387 Y49.965 E.8265
G1 X113.74 Y49.965 E.02411
G1 X98.06 Y34.285 E.8265
G1 X97.413 Y34.285 E.02411
G1 X113.093 Y49.965 E.8265
G1 X112.447 Y49.965 E.02411
G1 X96.766 Y34.285 E.8265
G1 X96.119 Y34.285 E.02411
G1 X111.8 Y49.965 E.8265
G1 X111.153 Y49.965 E.02411
G1 X95.472 Y34.285 E.8265
G1 X94.826 Y34.285 E.02411
G1 X110.506 Y49.965 E.8265
G1 X109.859 Y49.965 E.02411
G1 X94.179 Y34.285 E.8265
G1 X93.532 Y34.285 E.02411
G1 X109.213 Y49.965 E.8265
G1 X108.566 Y49.965 E.02411
G1 X92.885 Y34.285 E.8265
G1 X92.238 Y34.285 E.02411
G1 X107.919 Y49.965 E.8265
G1 X107.272 Y49.965 E.02411
G1 X91.591 Y34.285 E.8265
G1 X90.945 Y34.285 E.02411
G1 X106.625 Y49.965 E.8265
G1 X105.978 Y49.965 E.02411
G1 X90.298 Y34.285 E.8265
G1 X89.651 Y34.285 E.02411
G1 X105.332 Y49.965 E.8265
M73 P22 R44
G1 X104.685 Y49.965 E.02411
G1 X89.004 Y34.285 E.8265
G1 X88.357 Y34.285 E.02411
G1 X104.038 Y49.965 E.8265
G1 X103.391 Y49.965 E.02411
G1 X87.71 Y34.285 E.8265
G1 X87.064 Y34.285 E.02411
G1 X102.744 Y49.965 E.8265
G1 X102.097 Y49.965 E.02411
G1 X86.417 Y34.285 E.8265
G1 X85.77 Y34.285 E.02411
G1 X101.451 Y49.965 E.8265
G1 X100.804 Y49.965 E.02411
G1 X85.123 Y34.285 E.8265
G1 X84.476 Y34.285 E.02411
G1 X100.157 Y49.965 E.8265
G1 X99.51 Y49.965 E.02411
G1 X83.829 Y34.285 E.8265
G1 X83.183 Y34.285 E.02411
G1 X98.863 Y49.965 E.8265
G1 X98.216 Y49.965 E.02411
G1 X82.536 Y34.285 E.8265
G1 X81.889 Y34.285 E.02411
G1 X97.57 Y49.965 E.8265
G1 X96.923 Y49.965 E.02411
G1 X81.242 Y34.285 E.8265
G1 X80.595 Y34.285 E.02411
G1 X96.276 Y49.965 E.8265
G1 X95.629 Y49.965 E.02411
G1 X79.948 Y34.285 E.8265
G1 X79.302 Y34.285 E.02411
G1 X94.982 Y49.965 E.8265
G1 X94.335 Y49.965 E.02411
G1 X78.655 Y34.285 E.8265
G1 X78.008 Y34.285 E.02411
G1 X93.689 Y49.965 E.8265
G1 X93.042 Y49.965 E.02411
G1 X77.361 Y34.285 E.8265
G1 X76.714 Y34.285 E.02411
G1 X92.395 Y49.965 E.8265
G1 X91.748 Y49.965 E.02411
G1 X76.067 Y34.285 E.8265
G1 X75.421 Y34.285 E.02411
G1 X91.101 Y49.965 E.8265
G1 X90.454 Y49.965 E.02411
G1 X74.774 Y34.285 E.8265
G1 X74.127 Y34.285 E.02411
G1 X89.808 Y49.965 E.8265
G1 X89.161 Y49.965 E.02411
G1 X73.48 Y34.285 E.8265
G1 X72.833 Y34.285 E.02411
G1 X88.514 Y49.965 E.8265
G1 X87.867 Y49.965 E.02411
G1 X72.186 Y34.285 E.8265
G1 X71.54 Y34.285 E.02411
G1 X87.22 Y49.965 E.8265
G1 X86.573 Y49.965 E.02411
G1 X70.893 Y34.285 E.8265
G1 X70.246 Y34.285 E.02411
G1 X85.927 Y49.965 E.8265
M73 P23 R44
G1 X85.28 Y49.965 E.02411
G1 X69.599 Y34.285 E.8265
G1 X68.952 Y34.285 E.02411
G1 X84.633 Y49.965 E.8265
G1 X83.986 Y49.965 E.02411
G1 X68.305 Y34.285 E.8265
G1 X67.659 Y34.285 E.02411
G1 X83.339 Y49.965 E.8265
G1 X82.692 Y49.965 E.02411
G1 X67.012 Y34.285 E.8265
G1 X66.365 Y34.285 E.02411
G1 X82.046 Y49.965 E.8265
G1 X81.399 Y49.965 E.02411
G1 X65.718 Y34.285 E.8265
G1 X65.071 Y34.285 E.02411
G1 X80.752 Y49.965 E.8265
G1 X80.105 Y49.965 E.02411
G1 X64.424 Y34.285 E.8265
G1 X63.778 Y34.285 E.02411
G1 X79.458 Y49.965 E.8265
G1 X78.811 Y49.965 E.02411
G1 X63.131 Y34.285 E.8265
G1 X62.484 Y34.285 E.02411
G1 X78.165 Y49.965 E.8265
G1 X77.518 Y49.965 E.02411
G1 X61.837 Y34.285 E.8265
G1 X61.19 Y34.285 E.02411
G1 X76.871 Y49.965 E.8265
G1 X76.224 Y49.965 E.02411
G1 X60.543 Y34.285 E.8265
G1 X59.897 Y34.285 E.02411
G1 X75.577 Y49.965 E.8265
G1 X74.93 Y49.965 E.02411
G1 X59.25 Y34.285 E.8265
G1 X58.603 Y34.285 E.02411
G1 X74.284 Y49.965 E.8265
G1 X73.637 Y49.965 E.02411
G1 X57.956 Y34.285 E.8265
G1 X57.309 Y34.285 E.02411
G1 X72.99 Y49.965 E.8265
G1 X72.343 Y49.965 E.02411
G1 X56.662 Y34.285 E.8265
G1 X56.016 Y34.285 E.02411
G1 X71.696 Y49.965 E.8265
G1 X71.049 Y49.965 E.02411
G1 X55.369 Y34.285 E.8265
G1 X54.722 Y34.285 E.02411
G1 X70.403 Y49.965 E.8265
G1 X69.756 Y49.965 E.02411
G1 X54.075 Y34.285 E.8265
G1 X53.428 Y34.285 E.02411
G1 X69.109 Y49.965 E.8265
G1 X68.462 Y49.965 E.02411
G1 X52.781 Y34.285 E.8265
G1 X52.135 Y34.285 E.02411
G1 X67.815 Y49.965 E.8265
G1 X67.168 Y49.965 E.02411
G1 X51.488 Y34.285 E.8265
G1 X50.841 Y34.285 E.02411
G1 X66.522 Y49.965 E.8265
G1 X65.875 Y49.965 E.02411
G1 X50.194 Y34.285 E.8265
G1 X49.547 Y34.285 E.02411
G1 X65.228 Y49.965 E.8265
G1 X64.581 Y49.965 E.02411
G1 X48.9 Y34.285 E.8265
G1 X48.254 Y34.285 E.02411
G1 X63.934 Y49.965 E.8265
G1 X63.287 Y49.965 E.02411
G1 X47.607 Y34.285 E.8265
G1 X46.96 Y34.285 E.02411
G1 X62.641 Y49.965 E.8265
G1 X61.994 Y49.965 E.02411
G1 X46.313 Y34.285 E.8265
G1 X45.666 Y34.285 E.02411
G1 X61.347 Y49.965 E.8265
G1 X60.7 Y49.965 E.02411
G1 X45.019 Y34.285 E.8265
G1 X44.373 Y34.285 E.02411
G1 X60.053 Y49.965 E.8265
G1 X59.406 Y49.965 E.02411
G1 X43.726 Y34.285 E.8265
G1 X43.079 Y34.285 E.02411
G1 X47.04 Y38.246 E.2088
G2 X46.315 Y38.168 I-.804 J4.047 E.02722
G1 X42.432 Y34.285 E.20468
G1 X41.785 Y34.285 E.02411
G1 X45.704 Y38.203 E.20655
G2 X45.171 Y38.317 I.286 J2.641 E.02035
G1 X41.138 Y34.285 E.21256
G1 X40.492 Y34.285 E.02411
G1 X44.692 Y38.485 E.2214
G2 X44.26 Y38.699 I3.005 J6.608 E.01799
G1 X39.845 Y34.285 E.23269
G1 X39.198 Y34.285 E.02411
G1 X43.872 Y38.959 E.24639
G2 X43.523 Y39.257 I1.313 J1.896 E.01713
G1 X38.551 Y34.285 E.26206
G1 X38.41 Y34.285 E.00527
G1 X38.41 Y34.79 E.01884
G1 X43.21 Y39.591 E.25304
G2 X42.935 Y39.962 I1.712 J1.558 E.01726
G1 X38.41 Y35.437 E.23852
G1 X38.41 Y36.084 E.02411
G1 X42.698 Y40.372 E.22604
G2 X42.508 Y40.829 I5.612 J2.602 E.01845
G1 X38.41 Y36.731 E.21603
G1 X38.41 Y37.377 E.02411
G1 X42.371 Y41.339 E.20881
G2 X42.294 Y41.909 I2.808 J.669 E.02147
G1 X38.41 Y38.024 E.20476
G1 X38.41 Y38.671 E.02411
G1 X42.564 Y42.825 E.21896
; WIPE_START
G1 X41.15 Y41.411 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X48.776 Y41.099 Z.6 F30000
G1 X49.849 Y41.055 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X58.76 Y49.965 E.46966
G1 X58.113 Y49.965 E.02411
G1 X50.209 Y42.062 E.41658
G3 X50.17 Y42.67 I-4.515 J.014 E.02271
G1 X57.466 Y49.965 E.38455
G1 X56.819 Y49.965 E.02411
G1 X50.059 Y43.205 E.35633
G3 X49.891 Y43.685 I-5.84 J-1.768 E.01893
G1 X56.172 Y49.965 E.33105
G1 X55.525 Y49.965 E.02411
G1 X49.673 Y44.113 E.30847
G3 X49.415 Y44.501 I-2.069 J-1.097 E.01742
G1 X54.879 Y49.965 E.288
G1 X54.232 Y49.965 E.02411
G1 X49.118 Y44.852 E.26952
G3 X48.785 Y45.166 I-1.735 J-1.508 E.01708
G1 X54.09 Y50.471 E.27962
G1 X54.09 Y51.118 E.02411
G1 X48.415 Y45.442 E.29913
G3 X48.002 Y45.676 I-3.833 J-6.294 E.01769
G1 X54.09 Y51.764 E.3209
G1 X54.09 Y52.411 E.02411
G1 X47.544 Y45.865 E.34504
G3 X47.037 Y46.005 I-.951 J-2.464 E.01964
G1 X54.09 Y53.058 E.37177
G1 X54.09 Y53.705 E.02411
G1 X46.464 Y46.078 E.40198
G3 X45.798 Y46.06 I-.239 J-3.336 E.02486
G1 X54.09 Y54.352 E.43706
G1 X54.09 Y54.999 E.02411
G1 X44.963 Y45.871 E.48109
G3 X42.506 Y43.415 I1.274 J-3.731 E.13409
G1 X38.41 Y39.318 E.21593
G1 X38.41 Y39.965 E.02411
G1 X54.09 Y55.645 E.8265
G1 X54.09 Y56.292 E.02411
G1 X38.41 Y40.612 E.8265
G1 X38.41 Y41.258 E.02411
G1 X54.09 Y56.939 E.8265
G1 X54.09 Y57.586 E.02411
G1 X38.41 Y41.905 E.8265
G1 X38.41 Y42.552 E.02411
G1 X54.09 Y58.233 E.8265
G1 X54.09 Y58.88 E.02411
G1 X38.41 Y43.199 E.8265
G1 X38.41 Y43.846 E.02411
G1 X54.09 Y59.526 E.8265
G1 X54.09 Y60.173 E.02411
G1 X38.41 Y44.493 E.8265
G1 X38.41 Y45.139 E.02411
G1 X54.09 Y60.82 E.8265
G1 X54.09 Y61.467 E.02411
G1 X38.41 Y45.786 E.8265
G1 X38.41 Y46.433 E.02411
G1 X54.09 Y62.114 E.8265
G1 X54.09 Y62.761 E.02411
G1 X38.41 Y47.08 E.8265
G1 X38.41 Y47.727 E.02411
G1 X54.09 Y63.407 E.8265
G1 X54.09 Y64.054 E.02411
G1 X38.41 Y48.374 E.8265
G1 X38.41 Y49.02 E.02411
G1 X54.09 Y64.701 E.8265
G1 X54.09 Y65.348 E.02411
G1 X38.41 Y49.667 E.8265
G1 X38.41 Y50.314 E.02411
G1 X54.09 Y65.995 E.8265
G1 X54.09 Y66.642 E.02411
G1 X38.41 Y50.961 E.8265
G1 X38.41 Y51.608 E.02411
G1 X54.09 Y67.288 E.8265
G1 X54.09 Y67.935 E.02411
G1 X38.41 Y52.255 E.8265
G1 X38.41 Y52.901 E.02411
G1 X54.09 Y68.582 E.8265
M73 P24 R44
G1 X54.09 Y69.229 E.02411
G1 X38.41 Y53.548 E.8265
G1 X38.41 Y54.195 E.02411
G1 X54.09 Y69.876 E.8265
G1 X54.09 Y70.523 E.02411
G1 X38.41 Y54.842 E.8265
G1 X38.41 Y55.489 E.02411
G1 X54.09 Y71.169 E.8265
G1 X54.09 Y71.816 E.02411
G1 X38.41 Y56.136 E.8265
G1 X38.41 Y56.782 E.02411
G1 X54.09 Y72.463 E.8265
G1 X54.09 Y73.11 E.02411
G1 X38.41 Y57.429 E.8265
G1 X38.41 Y58.076 E.02411
G1 X54.09 Y73.757 E.8265
G1 X54.09 Y74.404 E.02411
G1 X38.41 Y58.723 E.8265
G1 X38.41 Y59.37 E.02411
G1 X54.09 Y75.05 E.8265
G1 X54.09 Y75.697 E.02411
G1 X38.41 Y60.017 E.8265
G1 X38.41 Y60.663 E.02411
G1 X54.09 Y76.344 E.8265
G1 X54.09 Y76.991 E.02411
G1 X38.41 Y61.31 E.8265
G1 X38.41 Y61.957 E.02411
G1 X54.09 Y77.638 E.8265
G1 X54.09 Y78.285 E.02411
G1 X38.41 Y62.604 E.8265
G1 X38.41 Y63.251 E.02411
G1 X54.09 Y78.931 E.8265
G1 X54.09 Y79.578 E.02411
G1 X38.41 Y63.898 E.8265
G1 X38.41 Y64.544 E.02411
G1 X54.09 Y80.225 E.8265
G1 X54.09 Y80.872 E.02411
G1 X38.41 Y65.191 E.8265
G1 X38.41 Y65.838 E.02411
G1 X54.09 Y81.519 E.8265
G1 X54.09 Y82.166 E.02411
G1 X38.41 Y66.485 E.8265
G1 X38.41 Y67.132 E.02411
G1 X54.09 Y82.812 E.8265
G1 X54.09 Y83.459 E.02411
G1 X38.41 Y67.779 E.8265
G1 X38.41 Y68.425 E.02411
G1 X54.09 Y84.106 E.8265
G1 X54.09 Y84.753 E.02411
G1 X38.41 Y69.072 E.8265
G1 X38.41 Y69.719 E.02411
G1 X54.09 Y85.4 E.8265
G1 X54.09 Y86.047 E.02411
G1 X38.41 Y70.366 E.8265
G1 X38.41 Y71.013 E.02411
G1 X54.09 Y86.693 E.8265
G1 X54.09 Y87.34 E.02411
G1 X38.41 Y71.66 E.8265
G1 X38.41 Y72.306 E.02411
G1 X54.09 Y87.987 E.8265
G1 X54.09 Y88.634 E.02411
G1 X38.41 Y72.953 E.8265
M73 P24 R43
G1 X38.41 Y73.6 E.02411
G1 X54.09 Y89.281 E.8265
G1 X54.09 Y89.928 E.02411
G1 X38.41 Y74.247 E.8265
G1 X38.41 Y74.894 E.02411
G1 X54.09 Y90.574 E.8265
G1 X54.09 Y91.221 E.02411
G1 X38.41 Y75.541 E.8265
G1 X38.41 Y76.187 E.02411
G1 X54.09 Y91.868 E.8265
G1 X54.09 Y92.515 E.02411
G1 X38.41 Y76.834 E.8265
G1 X38.41 Y77.481 E.02411
G1 X54.09 Y93.162 E.8265
G1 X54.09 Y93.808 E.02411
G1 X38.41 Y78.128 E.8265
G1 X38.41 Y78.775 E.02411
G1 X54.09 Y94.455 E.8265
G1 X54.09 Y95.102 E.02411
G1 X38.41 Y79.422 E.8265
G1 X38.41 Y80.068 E.02411
G1 X54.09 Y95.749 E.8265
G1 X54.09 Y96.396 E.02411
G1 X38.41 Y80.715 E.8265
G1 X38.41 Y81.362 E.02411
G1 X54.09 Y97.043 E.8265
G1 X54.09 Y97.689 E.02411
G1 X38.41 Y82.009 E.8265
G1 X38.41 Y82.656 E.02411
G1 X54.09 Y98.336 E.8265
G1 X54.09 Y98.983 E.02411
G1 X38.41 Y83.303 E.8265
G1 X38.41 Y83.949 E.02411
G1 X54.09 Y99.63 E.8265
G1 X54.09 Y100.277 E.02411
G1 X38.41 Y84.596 E.8265
G1 X38.41 Y85.243 E.02411
G1 X54.09 Y100.924 E.8265
G1 X54.09 Y101.57 E.02411
G1 X38.41 Y85.89 E.8265
G1 X38.41 Y86.537 E.02411
G1 X54.09 Y102.217 E.8265
G1 X54.09 Y102.864 E.02411
G1 X38.41 Y87.184 E.8265
G1 X38.41 Y87.83 E.02411
G1 X54.09 Y103.511 E.8265
G1 X54.09 Y104.158 E.02411
G1 X38.41 Y88.477 E.8265
G1 X38.41 Y89.124 E.02411
G1 X54.09 Y104.805 E.8265
G1 X54.09 Y105.451 E.02411
G1 X38.41 Y89.771 E.8265
G1 X38.41 Y90.418 E.02411
G1 X54.09 Y106.098 E.8265
G1 X54.09 Y106.745 E.02411
G1 X38.41 Y91.065 E.8265
G1 X38.41 Y91.711 E.02411
G1 X54.09 Y107.392 E.8265
G1 X54.09 Y108.039 E.02411
G1 X38.41 Y92.358 E.8265
G1 X38.41 Y93.005 E.02411
G1 X54.09 Y108.686 E.8265
G1 X54.09 Y109.332 E.02411
G1 X38.41 Y93.652 E.8265
G1 X38.41 Y94.299 E.02411
G1 X54.09 Y109.979 E.8265
G1 X54.09 Y110.626 E.02411
G1 X38.41 Y94.946 E.8265
G1 X38.41 Y95.592 E.02411
G1 X54.09 Y111.273 E.8265
G1 X54.09 Y111.92 E.02411
G1 X38.41 Y96.239 E.8265
G1 X38.41 Y96.886 E.02411
G1 X54.09 Y112.567 E.8265
G1 X54.09 Y113.213 E.02411
G1 X38.41 Y97.533 E.8265
G1 X38.41 Y98.18 E.02411
G1 X54.09 Y113.86 E.8265
G1 X54.09 Y114.507 E.02411
G1 X38.41 Y98.827 E.8265
G1 X38.41 Y99.473 E.02411
G1 X54.09 Y115.154 E.8265
G1 X54.09 Y115.801 E.02411
G1 X38.41 Y100.12 E.8265
G1 X38.41 Y100.767 E.02411
G1 X54.09 Y116.448 E.8265
G1 X54.09 Y117.094 E.02411
G1 X38.41 Y101.414 E.8265
G1 X38.41 Y102.061 E.02411
G1 X54.09 Y117.741 E.8265
G1 X54.09 Y118.388 E.02411
G1 X38.41 Y102.708 E.8265
G1 X38.41 Y103.354 E.02411
G1 X54.09 Y119.035 E.8265
G1 X54.09 Y119.682 E.02411
G1 X38.41 Y104.001 E.8265
G1 X38.41 Y104.648 E.02411
G1 X54.09 Y120.329 E.8265
G1 X54.09 Y120.975 E.02411
G1 X38.41 Y105.295 E.8265
G1 X38.41 Y105.942 E.02411
G1 X54.09 Y121.622 E.8265
G1 X54.09 Y122.269 E.02411
G1 X38.41 Y106.589 E.8265
G1 X38.41 Y107.235 E.02411
G1 X54.09 Y122.916 E.8265
M73 P25 R43
G1 X54.09 Y123.563 E.02411
G1 X38.41 Y107.882 E.8265
G1 X38.41 Y108.529 E.02411
G1 X54.09 Y124.21 E.8265
G1 X54.09 Y124.856 E.02411
G1 X38.41 Y109.176 E.8265
G1 X38.41 Y109.823 E.02411
G1 X54.09 Y125.503 E.8265
G1 X54.09 Y126.15 E.02411
G1 X38.41 Y110.47 E.8265
G1 X38.41 Y111.116 E.02411
G1 X54.09 Y126.797 E.8265
G1 X54.09 Y127.444 E.02411
G1 X38.41 Y111.763 E.8265
G1 X38.41 Y112.41 E.02411
G1 X54.09 Y128.091 E.8265
G1 X54.09 Y128.737 E.02411
G1 X49.951 Y124.599 E.21815
G2 X47.647 Y122.295 I-3.677 J1.373 E.12523
G1 X38.41 Y113.057 E.48691
G1 X38.41 Y113.704 E.02411
G1 X46.785 Y122.079 E.44143
G2 X46.102 Y122.043 I-.582 J4.538 E.02551
G1 X38.41 Y114.351 E.40543
G1 X38.41 Y114.997 E.02411
G1 X45.522 Y122.11 E.37489
G2 X45.005 Y122.239 I.367 J2.571 E.01992
G1 X38.41 Y115.644 E.34761
G1 X38.41 Y116.291 E.02411
G1 X44.545 Y122.427 E.3234
G2 X44.13 Y122.658 I.948 J2.19 E.01775
G1 X38.41 Y116.938 E.30151
G1 X38.41 Y117.585 E.02411
G1 X43.754 Y122.929 E.28168
G2 X43.415 Y123.237 I1.369 J1.846 E.01709
G1 X38.41 Y118.232 E.26382
G1 X38.41 Y118.878 E.02411
G1 X43.113 Y123.582 E.24791
G2 X42.851 Y123.967 I6.242 J4.53 E.01735
G1 X38.41 Y119.525 E.2341
G1 X38.41 Y120.172 E.02411
G1 X42.632 Y124.394 E.22256
G2 X42.458 Y124.867 I2.275 J1.106 E.01881
G1 X38.41 Y120.819 E.21338
G1 X38.41 Y121.466 E.02411
G1 X42.335 Y125.392 E.20692
G2 X42.293 Y125.995 I5.215 J.674 E.02258
G1 X38.41 Y122.113 E.20466
G1 X38.41 Y122.759 E.02411
G1 X42.624 Y126.974 E.22214
; WIPE_START
G1 X41.21 Y125.56 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X48.836 Y125.259 Z.6 F30000
G1 X49.922 Y125.216 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X54.09 Y129.384 E.21971
G1 X54.09 Y130.031 E.02411
G1 X50.205 Y126.146 E.20478
G3 X50.142 Y126.73 I-2.951 J-.023 E.02192
G1 X54.09 Y130.678 E.2081
G1 X54.09 Y131.325 E.02411
G1 X50.009 Y127.243 E.21512
G3 X49.822 Y127.703 I-2.39 J-.702 E.01854
G1 X54.09 Y131.972 E.22497
G1 X54.09 Y132.618 E.02411
G1 X49.592 Y128.12 E.23709
G3 X49.323 Y128.498 I-2.02 J-1.158 E.01731
G1 X54.09 Y133.265 E.25129
G1 X54.09 Y133.912 E.02411
G1 X49.016 Y128.838 E.26748
G3 X48.667 Y129.136 I-1.669 J-1.595 E.01713
G1 X54.09 Y134.559 E.28583
G1 X54.09 Y135.206 E.02411
G1 X48.281 Y129.397 E.30618
G3 X47.855 Y129.617 I-1.315 J-2.02 E.01792
G1 X54.09 Y135.853 E.32865
G1 X54.09 Y136.499 E.02411
G1 X47.384 Y129.794 E.35345
G3 X46.856 Y129.912 I-1.368 J-4.851 E.02018
G1 X54.09 Y137.146 E.38129
G1 X54.09 Y137.793 E.02411
G1 X46.256 Y129.959 E.41295
G3 X45.544 Y129.894 I.016 J-4.13 E.02665
G1 X54.09 Y138.44 E.45044
G1 X54.09 Y139.087 E.02411
G1 X44.61 Y129.606 E.4997
G3 X42.649 Y127.645 I1.625 J-3.586 E.10563
G1 X38.41 Y123.406 E.22344
G1 X38.41 Y124.053 E.02411
G1 X54.09 Y139.734 E.8265
G1 X54.09 Y140.38 E.02411
G1 X38.41 Y124.7 E.8265
G1 X38.41 Y125.347 E.02411
G1 X54.09 Y141.027 E.8265
G1 X54.09 Y141.674 E.02411
G1 X38.41 Y125.994 E.8265
G1 X38.41 Y126.64 E.02411
G1 X54.09 Y142.321 E.8265
G1 X54.09 Y142.968 E.02411
G1 X38.41 Y127.287 E.8265
G1 X38.41 Y127.934 E.02411
G1 X54.09 Y143.615 E.8265
G1 X54.09 Y144.261 E.02411
G1 X38.41 Y128.581 E.8265
G1 X38.41 Y129.228 E.02411
G1 X54.09 Y144.908 E.8265
G1 X54.09 Y145.555 E.02411
G1 X38.41 Y129.875 E.8265
G1 X38.41 Y130.521 E.02411
G1 X54.09 Y146.202 E.8265
G1 X54.09 Y146.849 E.02411
G1 X38.41 Y131.168 E.8265
G1 X38.41 Y131.815 E.02411
G1 X54.09 Y147.496 E.8265
G1 X54.09 Y148.142 E.02411
G1 X38.41 Y132.462 E.8265
G1 X38.41 Y133.109 E.02411
G1 X54.09 Y148.789 E.8265
G1 X54.09 Y149.436 E.02411
G1 X38.41 Y133.756 E.8265
G1 X38.41 Y134.402 E.02411
G1 X54.09 Y150.083 E.8265
G1 X54.09 Y150.73 E.02411
G1 X38.41 Y135.049 E.8265
G1 X38.41 Y135.696 E.02411
G1 X54.09 Y151.377 E.8265
G1 X54.09 Y152.023 E.02411
G1 X38.41 Y136.343 E.8265
G1 X38.41 Y136.99 E.02411
G1 X54.09 Y152.67 E.8265
G1 X54.09 Y153.317 E.02411
G1 X38.41 Y137.637 E.8265
G1 X38.41 Y138.283 E.02411
G1 X54.09 Y153.964 E.8265
G1 X54.09 Y154.611 E.02411
G1 X38.41 Y138.93 E.8265
G1 X38.41 Y139.577 E.02411
G1 X54.09 Y155.258 E.8265
G1 X54.09 Y155.904 E.02411
G1 X38.41 Y140.224 E.8265
G1 X38.41 Y140.871 E.02411
G1 X54.09 Y156.551 E.8265
G1 X54.09 Y157.198 E.02411
G1 X38.41 Y141.518 E.8265
G1 X38.41 Y142.164 E.02411
G1 X54.09 Y157.845 E.8265
G1 X54.09 Y158.492 E.02411
G1 X38.41 Y142.811 E.8265
G1 X38.41 Y143.458 E.02411
G1 X54.09 Y159.139 E.8265
G1 X54.09 Y159.785 E.02411
G1 X38.41 Y144.105 E.8265
G1 X38.41 Y144.752 E.02411
G1 X54.09 Y160.432 E.8265
G1 X54.09 Y161.079 E.02411
G1 X38.41 Y145.399 E.8265
G1 X38.41 Y146.045 E.02411
G1 X54.09 Y161.726 E.8265
G1 X54.09 Y162.373 E.02411
G1 X38.41 Y146.692 E.8265
G1 X38.41 Y147.339 E.02411
G1 X54.09 Y163.02 E.8265
G1 X54.09 Y163.666 E.02411
G1 X38.41 Y147.986 E.8265
G1 X38.41 Y148.633 E.02411
G1 X54.09 Y164.313 E.8265
G1 X54.09 Y164.96 E.02411
G1 X38.41 Y149.28 E.8265
G1 X38.41 Y149.926 E.02411
G1 X54.09 Y165.607 E.8265
G1 X54.09 Y166.254 E.02411
G1 X38.41 Y150.573 E.8265
G1 X38.41 Y151.22 E.02411
G1 X54.09 Y166.901 E.8265
G1 X54.09 Y167.547 E.02411
G1 X38.41 Y151.867 E.8265
G1 X38.41 Y152.514 E.02411
G1 X54.09 Y168.194 E.8265
G1 X54.09 Y168.841 E.02411
G1 X38.41 Y153.161 E.8265
G1 X38.41 Y153.807 E.02411
G1 X54.09 Y169.488 E.8265
G1 X54.09 Y170.135 E.02411
G1 X38.41 Y154.454 E.8265
G1 X38.41 Y155.101 E.02411
G1 X54.09 Y170.782 E.8265
G1 X54.09 Y171.428 E.02411
G1 X38.41 Y155.748 E.8265
G1 X38.41 Y156.395 E.02411
G1 X54.09 Y172.075 E.8265
G1 X54.09 Y172.722 E.02411
G1 X38.41 Y157.042 E.8265
G1 X38.41 Y157.688 E.02411
G1 X54.09 Y173.369 E.8265
G1 X54.09 Y174.016 E.02411
G1 X38.41 Y158.335 E.8265
M73 P26 R43
G1 X38.41 Y158.982 E.02411
G1 X54.09 Y174.663 E.8265
G1 X54.09 Y175.309 E.02411
G1 X38.41 Y159.629 E.8265
G1 X38.41 Y160.276 E.02411
G1 X54.09 Y175.956 E.8265
G1 X54.09 Y176.603 E.02411
G1 X38.41 Y160.923 E.8265
G1 X38.41 Y161.569 E.02411
G1 X54.09 Y177.25 E.8265
G1 X54.09 Y177.897 E.02411
G1 X38.41 Y162.216 E.8265
G1 X38.41 Y162.863 E.02411
M73 P26 R42
G1 X54.09 Y178.544 E.8265
G1 X54.09 Y179.19 E.02411
G1 X38.41 Y163.51 E.8265
G1 X38.41 Y164.157 E.02411
G1 X54.09 Y179.837 E.8265
G1 X54.09 Y180.484 E.02411
G1 X38.41 Y164.804 E.8265
G1 X38.41 Y165.45 E.02411
G1 X54.09 Y181.131 E.8265
G1 X54.09 Y181.778 E.02411
G1 X38.41 Y166.097 E.8265
G1 X38.41 Y166.744 E.02411
G1 X54.09 Y182.425 E.8265
G1 X54.09 Y183.071 E.02411
G1 X38.41 Y167.391 E.8265
G1 X38.41 Y168.038 E.02411
G1 X54.09 Y183.718 E.8265
G1 X54.09 Y184.365 E.02411
G1 X38.41 Y168.685 E.8265
G1 X38.41 Y169.331 E.02411
G1 X54.09 Y185.012 E.8265
G1 X54.09 Y185.659 E.02411
G1 X38.41 Y169.978 E.8265
G1 X38.41 Y170.625 E.02411
G1 X54.09 Y186.306 E.8265
G1 X54.09 Y186.952 E.02411
G1 X38.41 Y171.272 E.8265
G1 X38.41 Y171.919 E.02411
G1 X54.09 Y187.599 E.8265
G1 X54.09 Y188.246 E.02411
G1 X38.41 Y172.566 E.8265
G1 X38.41 Y173.212 E.02411
G1 X54.09 Y188.893 E.8265
G1 X54.09 Y189.54 E.02411
G1 X38.41 Y173.859 E.8265
G1 X38.41 Y174.506 E.02411
G1 X54.09 Y190.187 E.8265
G1 X54.09 Y190.833 E.02411
G1 X38.41 Y175.153 E.8265
G1 X38.41 Y175.8 E.02411
G1 X54.09 Y191.48 E.8265
G1 X54.09 Y192.127 E.02411
G1 X38.41 Y176.447 E.8265
G1 X38.41 Y177.093 E.02411
G1 X54.09 Y192.774 E.8265
G1 X54.09 Y193.421 E.02411
G1 X38.41 Y177.74 E.8265
G1 X38.41 Y178.387 E.02411
G1 X54.09 Y194.068 E.8265
G1 X54.09 Y194.714 E.02411
G1 X38.41 Y179.034 E.8265
G1 X38.41 Y179.681 E.02411
G1 X54.09 Y195.361 E.8265
G1 X54.09 Y196.008 E.02411
G1 X38.41 Y180.328 E.8265
G1 X38.41 Y180.974 E.02411
G1 X54.09 Y196.655 E.8265
G1 X54.09 Y197.302 E.02411
G1 X38.41 Y181.621 E.8265
G1 X38.41 Y182.268 E.02411
G1 X54.09 Y197.949 E.8265
G1 X54.09 Y198.595 E.02411
G1 X38.41 Y182.915 E.8265
G1 X38.41 Y183.562 E.02411
G1 X54.09 Y199.242 E.8265
G1 X54.09 Y199.889 E.02411
G1 X38.41 Y184.209 E.8265
G1 X38.41 Y184.855 E.02411
G1 X54.09 Y200.536 E.8265
G1 X54.09 Y201.183 E.02411
G1 X38.204 Y185.297 E.83734
; WIPE_START
G1 X39.618 Y186.711 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X45.949 Y182.447 Z.6 F30000
G1 X217.796 Y66.698 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X201.91 Y50.812 E.83734
G1 X201.91 Y51.459 E.02411
G1 X217.59 Y67.14 E.8265
G1 X217.59 Y67.786 E.02411
G1 X201.91 Y52.106 E.8265
G1 X201.91 Y52.753 E.02411
G1 X217.59 Y68.433 E.8265
G1 X217.59 Y69.08 E.02411
G1 X201.91 Y53.4 E.8265
G1 X201.91 Y54.046 E.02411
G1 X217.59 Y69.727 E.8265
G1 X217.59 Y70.374 E.02411
G1 X201.91 Y54.693 E.8265
G1 X201.91 Y55.34 E.02411
G1 X217.59 Y71.021 E.8265
G1 X217.59 Y71.667 E.02411
G1 X201.91 Y55.987 E.8265
G1 X201.91 Y56.634 E.02411
G1 X217.59 Y72.314 E.8265
G1 X217.59 Y72.961 E.02411
G1 X201.91 Y57.281 E.8265
G1 X201.91 Y57.927 E.02411
G1 X217.59 Y73.608 E.8265
G1 X217.59 Y74.255 E.02411
G1 X201.91 Y58.574 E.8265
G1 X201.91 Y59.221 E.02411
G1 X217.59 Y74.902 E.8265
G1 X217.59 Y75.548 E.02411
G1 X201.91 Y59.868 E.8265
G1 X201.91 Y60.515 E.02411
G1 X217.59 Y76.195 E.8265
G1 X217.59 Y76.842 E.02411
G1 X201.91 Y61.162 E.8265
G1 X201.91 Y61.808 E.02411
G1 X217.59 Y77.489 E.8265
G1 X217.59 Y78.136 E.02411
G1 X201.91 Y62.455 E.8265
G1 X201.91 Y63.102 E.02411
G1 X217.59 Y78.783 E.8265
G1 X217.59 Y79.429 E.02411
G1 X201.91 Y63.749 E.8265
G1 X201.91 Y64.396 E.02411
G1 X217.59 Y80.076 E.8265
G1 X217.59 Y80.723 E.02411
G1 X201.91 Y65.043 E.8265
G1 X201.91 Y65.689 E.02411
G1 X217.59 Y81.37 E.8265
G1 X217.59 Y82.017 E.02411
G1 X201.91 Y66.336 E.8265
G1 X201.91 Y66.983 E.02411
G1 X217.59 Y82.664 E.8265
G1 X217.59 Y83.31 E.02411
G1 X201.91 Y67.63 E.8265
G1 X201.91 Y68.277 E.02411
G1 X217.59 Y83.957 E.8265
G1 X217.59 Y84.604 E.02411
G1 X201.91 Y68.924 E.8265
G1 X201.91 Y69.57 E.02411
G1 X217.59 Y85.251 E.8265
G1 X217.59 Y85.898 E.02411
G1 X201.91 Y70.217 E.8265
G1 X201.91 Y70.864 E.02411
G1 X217.59 Y86.545 E.8265
G1 X217.59 Y87.191 E.02411
G1 X201.91 Y71.511 E.8265
G1 X201.91 Y72.158 E.02411
G1 X217.59 Y87.838 E.8265
G1 X217.59 Y88.485 E.02411
G1 X201.91 Y72.805 E.8265
G1 X201.91 Y73.451 E.02411
G1 X217.59 Y89.132 E.8265
G1 X217.59 Y89.779 E.02411
G1 X201.91 Y74.098 E.8265
G1 X201.91 Y74.745 E.02411
G1 X217.59 Y90.426 E.8265
G1 X217.59 Y91.072 E.02411
G1 X201.91 Y75.392 E.8265
G1 X201.91 Y76.039 E.02411
M73 P27 R42
G1 X217.59 Y91.719 E.8265
G1 X217.59 Y92.366 E.02411
G1 X201.91 Y76.686 E.8265
G1 X201.91 Y77.332 E.02411
G1 X217.59 Y93.013 E.8265
G1 X217.59 Y93.66 E.02411
G1 X201.91 Y77.979 E.8265
G1 X201.91 Y78.626 E.02411
G1 X217.59 Y94.307 E.8265
G1 X217.59 Y94.953 E.02411
G1 X201.91 Y79.273 E.8265
G1 X201.91 Y79.92 E.02411
G1 X217.59 Y95.6 E.8265
G1 X217.59 Y96.247 E.02411
G1 X201.91 Y80.567 E.8265
G1 X201.91 Y81.213 E.02411
G1 X217.59 Y96.894 E.8265
G1 X217.59 Y97.541 E.02411
G1 X201.91 Y81.86 E.8265
G1 X201.91 Y82.507 E.02411
G1 X217.59 Y98.188 E.8265
G1 X217.59 Y98.834 E.02411
G1 X201.91 Y83.154 E.8265
G1 X201.91 Y83.801 E.02411
G1 X217.59 Y99.481 E.8265
G1 X217.59 Y100.128 E.02411
G1 X201.91 Y84.448 E.8265
G1 X201.91 Y85.094 E.02411
G1 X217.59 Y100.775 E.8265
G1 X217.59 Y101.422 E.02411
G1 X201.91 Y85.741 E.8265
G1 X201.91 Y86.388 E.02411
G1 X217.59 Y102.069 E.8265
G1 X217.59 Y102.715 E.02411
G1 X201.91 Y87.035 E.8265
G1 X201.91 Y87.682 E.02411
G1 X217.59 Y103.362 E.8265
G1 X217.59 Y104.009 E.02411
G1 X201.91 Y88.329 E.8265
G1 X201.91 Y88.975 E.02411
G1 X217.59 Y104.656 E.8265
G1 X217.59 Y105.303 E.02411
G1 X201.91 Y89.622 E.8265
G1 X201.91 Y90.269 E.02411
G1 X217.59 Y105.95 E.8265
G1 X217.59 Y106.596 E.02411
G1 X201.91 Y90.916 E.8265
G1 X201.91 Y91.563 E.02411
G1 X217.59 Y107.243 E.8265
G1 X217.59 Y107.89 E.02411
G1 X201.91 Y92.21 E.8265
G1 X201.91 Y92.856 E.02411
G1 X217.59 Y108.537 E.8265
G1 X217.59 Y109.184 E.02411
G1 X201.91 Y93.503 E.8265
G1 X201.91 Y94.15 E.02411
G1 X217.59 Y109.831 E.8265
G1 X217.59 Y110.477 E.02411
G1 X201.91 Y94.797 E.8265
G1 X201.91 Y95.444 E.02411
G1 X217.59 Y111.124 E.8265
G1 X217.59 Y111.771 E.02411
G1 X201.91 Y96.091 E.8265
G1 X201.91 Y96.737 E.02411
G1 X217.59 Y112.418 E.8265
G1 X217.59 Y113.065 E.02411
G1 X201.91 Y97.384 E.8265
G1 X201.91 Y98.031 E.02411
G1 X217.59 Y113.712 E.8265
G1 X217.59 Y114.358 E.02411
G1 X201.91 Y98.678 E.8265
G1 X201.91 Y99.325 E.02411
G1 X217.59 Y115.005 E.8265
G1 X217.59 Y115.652 E.02411
G1 X201.91 Y99.972 E.8265
G1 X201.91 Y100.618 E.02411
G1 X217.59 Y116.299 E.8265
G1 X217.59 Y116.946 E.02411
G1 X201.91 Y101.265 E.8265
G1 X201.91 Y101.912 E.02411
G1 X217.59 Y117.593 E.8265
G1 X217.59 Y118.239 E.02411
G1 X201.91 Y102.559 E.8265
G1 X201.91 Y103.206 E.02411
G1 X217.59 Y118.886 E.8265
G1 X217.59 Y119.533 E.02411
G1 X201.91 Y103.853 E.8265
G1 X201.91 Y104.499 E.02411
G1 X217.59 Y120.18 E.8265
G1 X217.59 Y120.827 E.02411
G1 X201.91 Y105.146 E.8265
G1 X201.91 Y105.793 E.02411
G1 X217.59 Y121.474 E.8265
G1 X217.59 Y122.12 E.02411
G1 X201.91 Y106.44 E.8265
G1 X201.91 Y107.087 E.02411
G1 X217.59 Y122.767 E.8265
G1 X217.59 Y123.414 E.02411
G1 X201.91 Y107.734 E.8265
G1 X201.91 Y108.38 E.02411
G1 X217.59 Y124.061 E.8265
G1 X217.59 Y124.708 E.02411
G1 X201.91 Y109.027 E.8265
G1 X201.91 Y109.674 E.02411
G1 X217.59 Y125.355 E.8265
G1 X217.59 Y126.001 E.02411
G1 X201.91 Y110.321 E.8265
G1 X201.91 Y110.968 E.02411
G1 X217.59 Y126.648 E.8265
G1 X217.59 Y127.295 E.02411
G1 X201.91 Y111.615 E.8265
G1 X201.91 Y112.261 E.02411
G1 X217.59 Y127.942 E.8265
G1 X217.59 Y128.589 E.02411
G1 X213.344 Y124.343 E.22379
G2 X211.408 Y122.406 I-3.54 J1.603 E.10431
G1 X201.91 Y112.908 E.50064
G1 X201.91 Y113.555 E.02411
G1 X210.457 Y122.102 E.4505
G2 X209.749 Y122.041 I-.795 J5.105 E.02649
G1 X201.91 Y114.202 E.4132
G1 X201.91 Y114.849 E.02411
G1 X209.149 Y122.088 E.38158
G2 X208.621 Y122.207 I.31 J2.616 E.02021
G1 X201.91 Y115.496 E.35373
G1 X201.91 Y116.142 E.02411
G1 X208.146 Y122.378 E.32869
G2 X207.72 Y122.6 I2.964 J6.213 E.01788
G1 X201.91 Y116.789 E.30627
G1 X201.91 Y117.436 E.02411
G1 X207.337 Y122.863 E.28604
M73 P27 R41
G2 X206.99 Y123.163 I1.328 J1.879 E.01712
G1 X201.91 Y118.083 E.26779
G1 X201.91 Y118.73 E.02411
G1 X206.681 Y123.501 E.25148
G2 X206.409 Y123.876 I1.739 J1.55 E.01729
G1 X201.91 Y119.377 E.23714
G1 X201.91 Y120.023 E.02411
G1 X206.176 Y124.29 E.22488
G2 X205.993 Y124.753 I2.228 J1.148 E.01861
G1 X201.91 Y120.67 E.21523
G1 X201.91 Y121.317 E.02411
G1 X205.86 Y125.268 E.20824
G2 X205.793 Y125.847 I4.763 J.853 E.02174
G1 X201.91 Y121.964 E.20466
G1 X201.91 Y122.611 E.02411
G1 X206.08 Y126.781 E.21982
; WIPE_START
G1 X204.666 Y125.367 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X212.292 Y125.06 Z.6 F30000
G1 X213.371 Y125.016 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X217.59 Y129.236 E.22239
G1 X217.59 Y129.882 E.02411
G1 X213.712 Y126.004 E.20441
G3 X213.662 Y126.601 I-3.012 J.045 E.02234
G1 X217.59 Y130.529 E.20707
G1 X217.59 Y131.176 E.02411
G1 X213.546 Y127.131 E.21319
G3 X213.37 Y127.603 I-5.655 J-1.832 E.01876
G1 X217.59 Y131.823 E.22242
G1 X217.59 Y132.47 E.02411
G1 X213.149 Y128.028 E.23412
G3 X212.887 Y128.413 I-2.055 J-1.116 E.01738
G1 X217.59 Y133.117 E.24791
M73 P28 R41
G1 X217.59 Y133.763 E.02411
G1 X212.587 Y128.76 E.2637
G3 X212.251 Y129.071 I-1.723 J-1.528 E.01709
G1 X217.59 Y134.41 E.28142
G1 X217.59 Y135.057 E.02411
G1 X211.876 Y129.342 E.30121
G3 X211.458 Y129.571 I-1.356 J-1.982 E.01779
G1 X217.59 Y135.704 E.32325
G1 X217.59 Y136.351 E.02411
G1 X210.996 Y129.756 E.34758
G3 X210.484 Y129.892 I-.931 J-2.485 E.01975
G1 X217.59 Y136.998 E.37455
G1 X217.59 Y137.644 E.02411
G1 X209.901 Y129.955 E.4053
G3 X209.225 Y129.926 I-.131 J-4.837 E.02523
G1 X217.59 Y138.291 E.44092
G1 X217.59 Y138.938 E.02411
G1 X208.357 Y129.705 E.48669
G3 X206.041 Y127.388 I1.405 J-3.721 E.12583
G1 X201.91 Y123.258 E.21773
G1 X201.91 Y123.904 E.02411
G1 X217.59 Y139.585 E.8265
G1 X217.59 Y140.232 E.02411
G1 X201.91 Y124.551 E.8265
G1 X201.91 Y125.198 E.02411
G1 X217.59 Y140.879 E.8265
G1 X217.59 Y141.525 E.02411
G1 X201.91 Y125.845 E.8265
G1 X201.91 Y126.492 E.02411
G1 X217.59 Y142.172 E.8265
G1 X217.59 Y142.819 E.02411
G1 X201.91 Y127.139 E.8265
G1 X201.91 Y127.785 E.02411
G1 X217.59 Y143.466 E.8265
G1 X217.59 Y144.113 E.02411
G1 X201.91 Y128.432 E.8265
G1 X201.91 Y129.079 E.02411
G1 X217.59 Y144.76 E.8265
G1 X217.59 Y145.406 E.02411
G1 X201.91 Y129.726 E.8265
G1 X201.91 Y130.373 E.02411
G1 X217.59 Y146.053 E.8265
G1 X217.59 Y146.7 E.02411
G1 X201.91 Y131.019 E.8265
G1 X201.91 Y131.666 E.02411
G1 X217.59 Y147.347 E.8265
G1 X217.59 Y147.994 E.02411
G1 X201.91 Y132.313 E.8265
G1 X201.91 Y132.96 E.02411
G1 X217.59 Y148.641 E.8265
G1 X217.59 Y149.287 E.02411
G1 X201.91 Y133.607 E.8265
G1 X201.91 Y134.254 E.02411
G1 X217.59 Y149.934 E.8265
G1 X217.59 Y150.581 E.02411
G1 X201.91 Y134.9 E.8265
G1 X201.91 Y135.547 E.02411
G1 X217.59 Y151.228 E.8265
G1 X217.59 Y151.875 E.02411
G1 X201.91 Y136.194 E.8265
G1 X201.91 Y136.841 E.02411
G1 X217.59 Y152.522 E.8265
G1 X217.59 Y153.168 E.02411
G1 X201.91 Y137.488 E.8265
G1 X201.91 Y138.135 E.02411
G1 X217.59 Y153.815 E.8265
G1 X217.59 Y154.462 E.02411
G1 X201.91 Y138.781 E.8265
G1 X201.91 Y139.428 E.02411
G1 X217.59 Y155.109 E.8265
G1 X217.59 Y155.756 E.02411
G1 X201.91 Y140.075 E.8265
G1 X201.91 Y140.722 E.02411
G1 X217.59 Y156.403 E.8265
G1 X217.59 Y157.049 E.02411
G1 X201.91 Y141.369 E.8265
G1 X201.91 Y142.016 E.02411
G1 X217.59 Y157.696 E.8265
G1 X217.59 Y158.343 E.02411
G1 X201.91 Y142.662 E.8265
G1 X201.91 Y143.309 E.02411
G1 X217.59 Y158.99 E.8265
G1 X217.59 Y159.637 E.02411
G1 X201.91 Y143.956 E.8265
G1 X201.91 Y144.603 E.02411
G1 X217.59 Y160.284 E.8265
G1 X217.59 Y160.93 E.02411
G1 X201.91 Y145.25 E.8265
G1 X201.91 Y145.897 E.02411
G1 X217.59 Y161.577 E.8265
G1 X217.59 Y162.224 E.02411
G1 X201.91 Y146.543 E.8265
G1 X201.91 Y147.19 E.02411
G1 X217.59 Y162.871 E.8265
G1 X217.59 Y163.518 E.02411
G1 X201.91 Y147.837 E.8265
G1 X201.91 Y148.484 E.02411
G1 X217.59 Y164.165 E.8265
G1 X217.59 Y164.811 E.02411
G1 X201.91 Y149.131 E.8265
G1 X201.91 Y149.778 E.02411
G1 X217.59 Y165.458 E.8265
G1 X217.59 Y166.105 E.02411
G1 X201.91 Y150.424 E.8265
G1 X201.91 Y151.071 E.02411
G1 X217.59 Y166.752 E.8265
G1 X217.59 Y167.399 E.02411
G1 X201.91 Y151.718 E.8265
G1 X201.91 Y152.365 E.02411
G1 X217.59 Y168.046 E.8265
G1 X217.59 Y168.692 E.02411
G1 X201.91 Y153.012 E.8265
G1 X201.91 Y153.659 E.02411
G1 X217.59 Y169.339 E.8265
G1 X217.59 Y169.986 E.02411
G1 X201.91 Y154.305 E.8265
G1 X201.91 Y154.952 E.02411
G1 X217.59 Y170.633 E.8265
G1 X217.59 Y171.28 E.02411
G1 X201.91 Y155.599 E.8265
G1 X201.91 Y156.246 E.02411
G1 X217.59 Y171.927 E.8265
G1 X217.59 Y172.573 E.02411
G1 X201.91 Y156.893 E.8265
G1 X201.91 Y157.54 E.02411
G1 X217.59 Y173.22 E.8265
G1 X217.59 Y173.867 E.02411
G1 X201.91 Y158.186 E.8265
G1 X201.91 Y158.833 E.02411
G1 X217.59 Y174.514 E.8265
G1 X217.59 Y175.161 E.02411
G1 X201.91 Y159.48 E.8265
G1 X201.91 Y160.127 E.02411
G1 X217.59 Y175.808 E.8265
G1 X217.59 Y176.454 E.02411
G1 X201.91 Y160.774 E.8265
G1 X201.91 Y161.421 E.02411
G1 X217.59 Y177.101 E.8265
G1 X217.59 Y177.748 E.02411
G1 X201.91 Y162.067 E.8265
G1 X201.91 Y162.714 E.02411
G1 X217.59 Y178.395 E.8265
G1 X217.59 Y179.042 E.02411
G1 X201.91 Y163.361 E.8265
G1 X201.91 Y164.008 E.02411
G1 X217.59 Y179.689 E.8265
G1 X217.59 Y180.335 E.02411
G1 X201.91 Y164.655 E.8265
G1 X201.91 Y165.302 E.02411
G1 X217.59 Y180.982 E.8265
G1 X217.59 Y181.629 E.02411
G1 X201.91 Y165.948 E.8265
G1 X201.91 Y166.595 E.02411
G1 X217.59 Y182.276 E.8265
G1 X217.59 Y182.923 E.02411
G1 X201.91 Y167.242 E.8265
G1 X201.91 Y167.889 E.02411
G1 X217.59 Y183.57 E.8265
G1 X217.59 Y184.216 E.02411
G1 X201.91 Y168.536 E.8265
G1 X201.91 Y169.183 E.02411
G1 X217.59 Y184.863 E.8265
G1 X217.59 Y185.51 E.02411
G1 X201.91 Y169.829 E.8265
G1 X201.91 Y170.476 E.02411
G1 X217.59 Y186.157 E.8265
G1 X217.59 Y186.804 E.02411
G1 X201.91 Y171.123 E.8265
G1 X201.91 Y171.77 E.02411
G1 X217.59 Y187.451 E.8265
G1 X217.59 Y188.097 E.02411
G1 X201.91 Y172.417 E.8265
G1 X201.91 Y173.064 E.02411
G1 X217.59 Y188.744 E.8265
G1 X217.59 Y189.391 E.02411
G1 X201.91 Y173.71 E.8265
G1 X201.91 Y174.357 E.02411
G1 X217.59 Y190.038 E.8265
G1 X217.59 Y190.685 E.02411
G1 X201.91 Y175.004 E.8265
G1 X201.91 Y175.651 E.02411
G1 X217.59 Y191.332 E.8265
G1 X217.59 Y191.978 E.02411
G1 X201.91 Y176.298 E.8265
G1 X201.91 Y176.945 E.02411
G1 X217.59 Y192.625 E.8265
G1 X217.59 Y193.272 E.02411
G1 X201.91 Y177.591 E.8265
G1 X201.91 Y178.238 E.02411
G1 X217.59 Y193.919 E.8265
G1 X217.59 Y194.566 E.02411
G1 X201.91 Y178.885 E.8265
G1 X201.91 Y179.532 E.02411
G1 X217.59 Y195.213 E.8265
G1 X217.59 Y195.859 E.02411
G1 X201.91 Y180.179 E.8265
G1 X201.91 Y180.826 E.02411
M73 P29 R41
G1 X217.59 Y196.506 E.8265
G1 X217.59 Y197.153 E.02411
G1 X201.91 Y181.472 E.8265
G1 X201.91 Y182.119 E.02411
G1 X217.59 Y197.8 E.8265
G1 X217.59 Y198.447 E.02411
G1 X201.91 Y182.766 E.8265
G1 X201.91 Y183.413 E.02411
G1 X217.59 Y199.094 E.8265
G1 X217.59 Y199.74 E.02411
G1 X201.91 Y184.06 E.8265
G1 X201.91 Y184.707 E.02411
G1 X217.59 Y200.387 E.8265
G1 X217.59 Y201.034 E.02411
G1 X201.91 Y185.353 E.8265
G1 X201.91 Y186 E.02411
G1 X217.59 Y201.681 E.8265
G1 X217.59 Y202.328 E.02411
G1 X201.91 Y186.647 E.8265
G1 X201.91 Y187.294 E.02411
G1 X217.59 Y202.975 E.8265
G1 X217.59 Y203.621 E.02411
G1 X201.91 Y187.941 E.8265
G1 X201.91 Y188.588 E.02411
G1 X217.59 Y204.268 E.8265
G1 X217.59 Y204.915 E.02411
G1 X201.91 Y189.234 E.8265
G1 X201.91 Y189.881 E.02411
G1 X217.59 Y205.562 E.8265
G1 X217.59 Y206.209 E.02411
G1 X201.91 Y190.528 E.8265
G1 X201.91 Y191.175 E.02411
G1 X217.59 Y206.856 E.8265
G1 X217.59 Y207.502 E.02411
G1 X201.91 Y191.822 E.8265
G1 X201.91 Y192.469 E.02411
G1 X217.59 Y208.149 E.8265
G1 X217.59 Y208.796 E.02411
G1 X201.91 Y193.115 E.8265
G1 X201.91 Y193.762 E.02411
G1 X217.59 Y209.443 E.8265
G1 X217.59 Y210.09 E.02411
G1 X201.91 Y194.409 E.8265
G1 X201.91 Y195.056 E.02411
G1 X217.59 Y210.737 E.8265
G1 X217.59 Y211.383 E.02411
G1 X201.91 Y195.703 E.8265
G1 X201.91 Y196.35 E.02411
G1 X217.59 Y212.03 E.8265
G1 X217.59 Y212.677 E.02411
G1 X213.488 Y208.575 E.21621
G2 X211.05 Y206.137 I-3.705 J1.267 E.13307
G1 X201.91 Y196.996 E.48179
G1 X201.91 Y197.643 E.02411
G1 X210.211 Y205.944 E.43754
G2 X209.542 Y205.922 I-.471 J4.096 E.02498
G1 X201.91 Y198.29 E.40227
G1 X201.91 Y198.937 E.02411
G1 X208.967 Y205.994 E.37199
G2 X208.457 Y206.131 I1.172 J5.395 E.01969
G1 X201.91 Y199.584 E.3451
G1 X201.91 Y200.231 E.02411
G1 X208.003 Y206.324 E.32115
G2 X207.591 Y206.558 I.969 J2.178 E.0177
G1 X201.91 Y200.877 E.29944
G1 X201.91 Y201.524 E.02411
G1 X207.218 Y206.832 E.27979
G2 X206.882 Y207.144 I1.387 J1.831 E.01709
G1 X201.773 Y202.035 E.26929
G1 X201.126 Y202.035 E.02411
G1 X206.584 Y207.493 E.28768
G2 X206.328 Y207.883 I1.828 J1.478 E.01744
G1 X200.48 Y202.035 E.30828
G1 X199.833 Y202.035 E.02411
G1 X206.113 Y208.315 E.33102
G2 X205.943 Y208.792 I2.301 J1.09 E.0189
G1 X199.186 Y202.035 E.35614
G1 X198.539 Y202.035 E.02411
G1 X205.828 Y209.324 E.38418
G2 X205.793 Y209.935 I3.039 J.483 E.02286
G1 X197.892 Y202.035 E.41641
G1 X197.245 Y202.035 E.02411
G1 X206.153 Y210.942 E.4695
; WIPE_START
G1 X204.739 Y209.528 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
M73 P29 R40
G1 X212.365 Y209.216 Z.6 F30000
G1 X213.438 Y209.172 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X217.59 Y213.324 E.21885
G1 X217.59 Y213.971 E.02411
G1 X213.702 Y210.082 E.20494
G3 X213.634 Y210.661 I-5.946 J-.41 E.02172
G1 X217.59 Y214.618 E.20855
G1 X217.59 Y215.264 E.02411
G1 X213.492 Y211.166 E.21603
G3 X213.301 Y211.622 I-2.374 J-.723 E.01846
G1 X217.59 Y215.911 E.22608
G1 X217.59 Y216.558 E.02411
G1 X213.068 Y212.035 E.23838
G3 X212.795 Y212.409 I-2.006 J-1.177 E.01728
G1 X217.59 Y217.205 E.25276
G1 X217.59 Y217.715 E.01902
G1 X217.454 Y217.715 E.00508
G1 X212.481 Y212.743 E.2621
G3 X212.13 Y213.038 I-1.65 J-1.607 E.01714
G1 X216.807 Y217.715 E.24653
G1 X216.16 Y217.715 E.02411
G1 X211.74 Y213.296 E.23296
G3 X211.311 Y213.512 I-1.295 J-2.031 E.01798
G1 X215.513 Y217.715 E.22152
G1 X214.867 Y217.715 E.02411
G1 X210.836 Y213.685 E.21243
G3 X210.299 Y213.795 I-1.412 J-5.545 E.02044
G1 X214.22 Y217.715 E.20665
G1 X213.573 Y217.715 E.02411
G1 X209.693 Y213.835 E.20452
G3 X208.966 Y213.755 I.154 J-4.749 E.02727
G1 X212.926 Y217.715 E.20873
G1 X212.279 Y217.715 E.02411
G1 X196.599 Y202.035 E.8265
G1 X195.952 Y202.035 E.02411
G1 X211.632 Y217.715 E.8265
G1 X210.986 Y217.715 E.02411
G1 X195.305 Y202.035 E.8265
G1 X194.658 Y202.035 E.02411
G1 X210.339 Y217.715 E.8265
G1 X209.692 Y217.715 E.02411
G1 X194.011 Y202.035 E.8265
G1 X193.364 Y202.035 E.02411
G1 X209.045 Y217.715 E.8265
G1 X208.398 Y217.715 E.02411
G1 X192.718 Y202.035 E.8265
G1 X192.071 Y202.035 E.02411
G1 X207.751 Y217.715 E.8265
G1 X207.105 Y217.715 E.02411
G1 X191.424 Y202.035 E.8265
G1 X190.777 Y202.035 E.02411
G1 X206.458 Y217.715 E.8265
G1 X205.811 Y217.715 E.02411
G1 X190.13 Y202.035 E.8265
G1 X189.483 Y202.035 E.02411
G1 X205.164 Y217.715 E.8265
G1 X204.517 Y217.715 E.02411
G1 X188.837 Y202.035 E.8265
G1 X188.19 Y202.035 E.02411
G1 X203.87 Y217.715 E.8265
G1 X203.224 Y217.715 E.02411
G1 X187.543 Y202.035 E.8265
G1 X186.896 Y202.035 E.02411
G1 X202.577 Y217.715 E.8265
G1 X201.93 Y217.715 E.02411
G1 X186.249 Y202.035 E.8265
G1 X185.602 Y202.035 E.02411
G1 X201.283 Y217.715 E.8265
G1 X200.636 Y217.715 E.02411
G1 X184.956 Y202.035 E.8265
G1 X184.309 Y202.035 E.02411
G1 X199.989 Y217.715 E.8265
G1 X199.343 Y217.715 E.02411
G1 X183.662 Y202.035 E.8265
G1 X183.015 Y202.035 E.02411
G1 X198.696 Y217.715 E.8265
G1 X198.049 Y217.715 E.02411
G1 X182.368 Y202.035 E.8265
G1 X181.721 Y202.035 E.02411
G1 X197.402 Y217.715 E.8265
G1 X196.755 Y217.715 E.02411
G1 X181.075 Y202.035 E.8265
G1 X180.428 Y202.035 E.02411
G1 X196.108 Y217.715 E.8265
G1 X195.462 Y217.715 E.02411
G1 X179.781 Y202.035 E.8265
G1 X179.134 Y202.035 E.02411
G1 X194.815 Y217.715 E.8265
G1 X194.168 Y217.715 E.02411
G1 X178.487 Y202.035 E.8265
G1 X177.84 Y202.035 E.02411
G1 X193.521 Y217.715 E.8265
G1 X192.874 Y217.715 E.02411
G1 X177.194 Y202.035 E.8265
G1 X176.547 Y202.035 E.02411
G1 X192.227 Y217.715 E.8265
G1 X191.581 Y217.715 E.02411
G1 X175.9 Y202.035 E.8265
G1 X175.253 Y202.035 E.02411
G1 X190.934 Y217.715 E.8265
G1 X190.287 Y217.715 E.02411
G1 X174.606 Y202.035 E.8265
G1 X173.959 Y202.035 E.02411
G1 X189.64 Y217.715 E.8265
G1 X188.993 Y217.715 E.02411
G1 X173.313 Y202.035 E.8265
G1 X172.666 Y202.035 E.02411
G1 X188.346 Y217.715 E.8265
G1 X187.7 Y217.715 E.02411
G1 X172.019 Y202.035 E.8265
M73 P30 R40
G1 X171.372 Y202.035 E.02411
G1 X187.053 Y217.715 E.8265
G1 X186.406 Y217.715 E.02411
G1 X170.725 Y202.035 E.8265
G1 X170.078 Y202.035 E.02411
G1 X185.759 Y217.715 E.8265
G1 X185.112 Y217.715 E.02411
G1 X169.432 Y202.035 E.8265
G1 X168.785 Y202.035 E.02411
G1 X184.465 Y217.715 E.8265
G1 X183.819 Y217.715 E.02411
G1 X168.138 Y202.035 E.8265
G1 X167.491 Y202.035 E.02411
G1 X183.172 Y217.715 E.8265
G1 X182.525 Y217.715 E.02411
G1 X166.844 Y202.035 E.8265
G1 X166.197 Y202.035 E.02411
G1 X181.878 Y217.715 E.8265
G1 X181.231 Y217.715 E.02411
G1 X165.551 Y202.035 E.8265
G1 X164.904 Y202.035 E.02411
G1 X180.584 Y217.715 E.8265
G1 X179.938 Y217.715 E.02411
G1 X164.257 Y202.035 E.8265
G1 X163.61 Y202.035 E.02411
G1 X179.291 Y217.715 E.8265
G1 X178.644 Y217.715 E.02411
G1 X162.963 Y202.035 E.8265
G1 X162.316 Y202.035 E.02411
G1 X177.997 Y217.715 E.8265
G1 X177.35 Y217.715 E.02411
G1 X161.67 Y202.035 E.8265
G1 X161.023 Y202.035 E.02411
G1 X176.703 Y217.715 E.8265
G1 X176.057 Y217.715 E.02411
G1 X160.376 Y202.035 E.8265
G1 X159.729 Y202.035 E.02411
G1 X175.41 Y217.715 E.8265
G1 X174.763 Y217.715 E.02411
G1 X159.082 Y202.035 E.8265
G1 X158.435 Y202.035 E.02411
G1 X174.116 Y217.715 E.8265
G1 X173.469 Y217.715 E.02411
G1 X157.789 Y202.035 E.8265
G1 X157.142 Y202.035 E.02411
G1 X172.822 Y217.715 E.8265
G1 X172.176 Y217.715 E.02411
G1 X156.495 Y202.035 E.8265
G1 X155.848 Y202.035 E.02411
G1 X171.529 Y217.715 E.8265
G1 X170.882 Y217.715 E.02411
G1 X155.201 Y202.035 E.8265
G1 X154.554 Y202.035 E.02411
G1 X170.235 Y217.715 E.8265
G1 X169.588 Y217.715 E.02411
G1 X153.908 Y202.035 E.8265
G1 X153.261 Y202.035 E.02411
G1 X168.941 Y217.715 E.8265
G1 X168.295 Y217.715 E.02411
G1 X152.614 Y202.035 E.8265
G1 X151.967 Y202.035 E.02411
G1 X167.648 Y217.715 E.8265
G1 X167.001 Y217.715 E.02411
G1 X151.32 Y202.035 E.8265
G1 X150.673 Y202.035 E.02411
G1 X166.354 Y217.715 E.8265
G1 X165.707 Y217.715 E.02411
G1 X150.027 Y202.035 E.8265
G1 X149.38 Y202.035 E.02411
G1 X165.06 Y217.715 E.8265
G1 X164.414 Y217.715 E.02411
G1 X148.733 Y202.035 E.8265
G1 X148.086 Y202.035 E.02411
G1 X163.767 Y217.715 E.8265
G1 X163.12 Y217.715 E.02411
G1 X147.439 Y202.035 E.8265
G1 X146.792 Y202.035 E.02411
G1 X162.473 Y217.715 E.8265
G1 X161.826 Y217.715 E.02411
G1 X146.146 Y202.035 E.8265
G1 X145.499 Y202.035 E.02411
G1 X161.179 Y217.715 E.8265
G1 X160.533 Y217.715 E.02411
G1 X144.852 Y202.035 E.8265
G1 X144.205 Y202.035 E.02411
G1 X159.886 Y217.715 E.8265
G1 X159.239 Y217.715 E.02411
G1 X143.558 Y202.035 E.8265
G1 X142.911 Y202.035 E.02411
G1 X158.592 Y217.715 E.8265
G1 X157.945 Y217.715 E.02411
G1 X142.265 Y202.035 E.8265
G1 X141.618 Y202.035 E.02411
G1 X157.298 Y217.715 E.8265
G1 X156.652 Y217.715 E.02411
G1 X140.971 Y202.035 E.8265
G1 X140.324 Y202.035 E.02411
G1 X156.005 Y217.715 E.8265
G1 X155.358 Y217.715 E.02411
G1 X139.677 Y202.035 E.8265
G1 X139.03 Y202.035 E.02411
G1 X154.711 Y217.715 E.8265
G1 X154.064 Y217.715 E.02411
G1 X138.384 Y202.035 E.8265
G1 X137.737 Y202.035 E.02411
G1 X153.417 Y217.715 E.8265
G1 X152.771 Y217.715 E.02411
G1 X137.09 Y202.035 E.8265
G1 X136.443 Y202.035 E.02411
G1 X152.124 Y217.715 E.8265
G1 X151.477 Y217.715 E.02411
G1 X135.796 Y202.035 E.8265
G1 X135.15 Y202.035 E.02411
G1 X150.83 Y217.715 E.8265
G1 X150.183 Y217.715 E.02411
G1 X134.503 Y202.035 E.8265
G1 X133.856 Y202.035 E.02411
G1 X149.536 Y217.715 E.8265
G1 X148.89 Y217.715 E.02411
G1 X133.209 Y202.035 E.8265
G1 X132.562 Y202.035 E.02411
G1 X148.243 Y217.715 E.8265
G1 X147.596 Y217.715 E.02411
G1 X131.915 Y202.035 E.8265
G1 X131.269 Y202.035 E.02411
G1 X146.949 Y217.715 E.8265
G1 X146.302 Y217.715 E.02411
G1 X130.622 Y202.035 E.8265
G1 X129.975 Y202.035 E.02411
G1 X145.655 Y217.715 E.8265
G1 X145.009 Y217.715 E.02411
G1 X129.328 Y202.035 E.8265
G1 X128.681 Y202.035 E.02411
G1 X144.362 Y217.715 E.8265
G1 X143.715 Y217.715 E.02411
G1 X128.034 Y202.035 E.8265
G1 X127.388 Y202.035 E.02411
G1 X143.068 Y217.715 E.8265
G1 X142.421 Y217.715 E.02411
G1 X126.741 Y202.035 E.8265
G1 X126.094 Y202.035 E.02411
G1 X141.774 Y217.715 E.8265
G1 X141.128 Y217.715 E.02411
G1 X131.561 Y208.149 E.50423
G2 X129.723 Y206.311 I-3.507 J1.668 E.0988
G1 X125.447 Y202.035 E.22538
G1 X124.8 Y202.035 E.02411
G1 X128.753 Y205.988 E.20835
G2 X128.036 Y205.917 I-.789 J4.343 E.02689
G1 X124.153 Y202.035 E.20464
G1 X123.507 Y202.035 E.02411
G1 X127.43 Y205.958 E.20678
G2 X126.899 Y206.074 I.295 J2.624 E.02029
G1 X122.86 Y202.035 E.21289
G1 X122.213 Y202.035 E.02411
G1 X126.421 Y206.243 E.22183
G2 X125.992 Y206.461 I2.849 J6.157 E.01794
G1 X121.566 Y202.035 E.23329
G1 X120.919 Y202.035 E.02411
G1 X125.606 Y206.722 E.24706
G2 X125.258 Y207.021 I1.318 J1.887 E.01712
G1 X120.272 Y202.035 E.26281
G1 X119.626 Y202.035 E.02411
G1 X124.947 Y207.356 E.2805
G2 X124.673 Y207.729 I1.724 J1.554 E.01727
G1 X118.979 Y202.035 E.30015
M73 P31 R40
G1 X118.332 Y202.035 E.02411
G1 X124.438 Y208.141 E.32185
G2 X124.251 Y208.601 I6.013 J2.706 E.01851
G1 X117.685 Y202.035 E.34611
G1 X117.038 Y202.035 E.02411
G1 X124.116 Y209.113 E.37309
G2 X124.043 Y209.686 I5.598 J1.014 E.02154
G1 X116.391 Y202.035 E.40328
G1 X115.745 Y202.035 E.02411
G1 X124.321 Y210.611 E.45206
; WIPE_START
G1 X122.907 Y209.197 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X130.533 Y208.887 Z.6 F30000
G1 X131.609 Y208.843 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X140.481 Y217.715 E.46763
G1 X139.834 Y217.715 E.02411
G1 X131.961 Y209.842 E.41498
G3 X131.916 Y210.445 I-4.931 J-.061 E.02253
G1 X139.187 Y217.715 E.38323
G1 X138.54 Y217.715 E.02411
G1 X131.803 Y210.978 E.35511
G3 X131.632 Y211.454 I-5.577 J-1.733 E.01885
G1 X137.893 Y217.715 E.33003
G1 X137.247 Y217.715 E.02411
G1 X131.412 Y211.881 E.30752
G3 X131.152 Y212.268 I-2.06 J-1.103 E.0174
G1 X136.6 Y217.715 E.28713
G1 X135.953 Y217.715 E.02411
G1 X130.855 Y212.617 E.26873
G3 X130.52 Y212.929 I-1.725 J-1.512 E.01709
G1 X135.306 Y217.715 E.25227
G1 X134.659 Y217.715 E.02411
G1 X130.148 Y213.204 E.23777
G3 X129.732 Y213.435 I-1.36 J-1.962 E.01776
G1 X134.012 Y217.715 E.2256
G1 X133.366 Y217.715 E.02411
G1 X129.273 Y213.622 E.21574
G3 X128.763 Y213.76 I-.941 J-2.47 E.01969
G1 X132.719 Y217.715 E.20848
G1 X132.072 Y217.715 E.02411
G1 X128.186 Y213.829 E.20484
G3 X127.517 Y213.807 I-.226 J-3.343 E.02497
G1 X131.425 Y217.715 E.20598
G1 X130.778 Y217.715 E.02411
G1 X126.666 Y213.603 E.21677
M73 P31 R39
G3 X124.269 Y211.206 I1.318 J-3.714 E.13057
G1 X115.098 Y202.035 E.48342
G1 X114.451 Y202.035 E.02411
G1 X130.131 Y217.715 E.8265
G1 X129.485 Y217.715 E.02411
G1 X113.804 Y202.035 E.8265
G1 X113.157 Y202.035 E.02411
G1 X128.838 Y217.715 E.8265
G1 X128.191 Y217.715 E.02411
G1 X112.51 Y202.035 E.8265
G1 X111.864 Y202.035 E.02411
G1 X127.544 Y217.715 E.8265
G1 X126.897 Y217.715 E.02411
G1 X111.217 Y202.035 E.8265
G1 X110.57 Y202.035 E.02411
G1 X126.25 Y217.715 E.8265
G1 X125.604 Y217.715 E.02411
G1 X109.923 Y202.035 E.8265
G1 X109.276 Y202.035 E.02411
G1 X124.957 Y217.715 E.8265
G1 X124.31 Y217.715 E.02411
G1 X108.629 Y202.035 E.8265
G1 X107.983 Y202.035 E.02411
G1 X123.663 Y217.715 E.8265
G1 X123.016 Y217.715 E.02411
G1 X107.336 Y202.035 E.8265
G1 X106.689 Y202.035 E.02411
G1 X122.369 Y217.715 E.8265
G1 X121.723 Y217.715 E.02411
G1 X106.042 Y202.035 E.8265
G1 X105.395 Y202.035 E.02411
G1 X121.076 Y217.715 E.8265
G1 X120.429 Y217.715 E.02411
G1 X104.748 Y202.035 E.8265
G1 X104.102 Y202.035 E.02411
G1 X119.782 Y217.715 E.8265
G1 X119.135 Y217.715 E.02411
G1 X103.455 Y202.035 E.8265
G1 X102.808 Y202.035 E.02411
G1 X118.488 Y217.715 E.8265
G1 X117.842 Y217.715 E.02411
G1 X102.161 Y202.035 E.8265
G1 X101.514 Y202.035 E.02411
G1 X117.195 Y217.715 E.8265
G1 X116.548 Y217.715 E.02411
G1 X100.867 Y202.035 E.8265
G1 X100.221 Y202.035 E.02411
G1 X115.901 Y217.715 E.8265
G1 X115.254 Y217.715 E.02411
G1 X99.574 Y202.035 E.8265
G1 X98.927 Y202.035 E.02411
G1 X114.607 Y217.715 E.8265
G1 X113.961 Y217.715 E.02411
G1 X98.28 Y202.035 E.8265
G1 X97.633 Y202.035 E.02411
G1 X113.314 Y217.715 E.8265
G1 X112.667 Y217.715 E.02411
G1 X96.986 Y202.035 E.8265
G1 X96.34 Y202.035 E.02411
G1 X112.02 Y217.715 E.8265
G1 X111.373 Y217.715 E.02411
G1 X95.693 Y202.035 E.8265
G1 X95.046 Y202.035 E.02411
G1 X110.726 Y217.715 E.8265
G1 X110.08 Y217.715 E.02411
G1 X94.399 Y202.035 E.8265
G1 X93.752 Y202.035 E.02411
G1 X109.433 Y217.715 E.8265
G1 X108.786 Y217.715 E.02411
G1 X93.105 Y202.035 E.8265
G1 X92.459 Y202.035 E.02411
G1 X108.139 Y217.715 E.8265
G1 X107.492 Y217.715 E.02411
G1 X91.812 Y202.035 E.8265
G1 X91.165 Y202.035 E.02411
G1 X106.845 Y217.715 E.8265
G1 X106.199 Y217.715 E.02411
G1 X90.518 Y202.035 E.8265
G1 X89.871 Y202.035 E.02411
G1 X105.552 Y217.715 E.8265
G1 X104.905 Y217.715 E.02411
G1 X89.224 Y202.035 E.8265
G1 X88.578 Y202.035 E.02411
G1 X104.258 Y217.715 E.8265
G1 X103.611 Y217.715 E.02411
G1 X87.931 Y202.035 E.8265
G1 X87.284 Y202.035 E.02411
G1 X102.964 Y217.715 E.8265
G1 X102.318 Y217.715 E.02411
G1 X86.637 Y202.035 E.8265
G1 X85.99 Y202.035 E.02411
G1 X101.671 Y217.715 E.8265
G1 X101.024 Y217.715 E.02411
G1 X85.343 Y202.035 E.8265
G1 X84.697 Y202.035 E.02411
G1 X100.377 Y217.715 E.8265
G1 X99.73 Y217.715 E.02411
G1 X84.05 Y202.035 E.8265
G1 X83.403 Y202.035 E.02411
G1 X99.083 Y217.715 E.8265
G1 X98.437 Y217.715 E.02411
G1 X82.756 Y202.035 E.8265
G1 X82.109 Y202.035 E.02411
G1 X97.79 Y217.715 E.8265
G1 X97.143 Y217.715 E.02411
G1 X81.462 Y202.035 E.8265
G1 X80.816 Y202.035 E.02411
G1 X96.496 Y217.715 E.8265
G1 X95.849 Y217.715 E.02411
G1 X80.169 Y202.035 E.8265
G1 X79.522 Y202.035 E.02411
G1 X95.202 Y217.715 E.8265
G1 X94.556 Y217.715 E.02411
G1 X78.875 Y202.035 E.8265
G1 X78.228 Y202.035 E.02411
G1 X93.909 Y217.715 E.8265
G1 X93.262 Y217.715 E.02411
G1 X77.581 Y202.035 E.8265
G1 X76.935 Y202.035 E.02411
G1 X92.615 Y217.715 E.8265
G1 X91.968 Y217.715 E.02411
G1 X76.288 Y202.035 E.8265
G1 X75.641 Y202.035 E.02411
G1 X91.321 Y217.715 E.8265
G1 X90.675 Y217.715 E.02411
G1 X74.994 Y202.035 E.8265
G1 X74.347 Y202.035 E.02411
G1 X90.028 Y217.715 E.8265
G1 X89.381 Y217.715 E.02411
G1 X73.7 Y202.035 E.8265
G1 X73.054 Y202.035 E.02411
G1 X88.734 Y217.715 E.8265
G1 X88.087 Y217.715 E.02411
G1 X72.407 Y202.035 E.8265
G1 X71.76 Y202.035 E.02411
G1 X87.44 Y217.715 E.8265
G1 X86.794 Y217.715 E.02411
G1 X71.113 Y202.035 E.8265
G1 X70.466 Y202.035 E.02411
G1 X86.147 Y217.715 E.8265
G1 X85.5 Y217.715 E.02411
G1 X69.819 Y202.035 E.8265
G1 X69.173 Y202.035 E.02411
G1 X84.853 Y217.715 E.8265
G1 X84.206 Y217.715 E.02411
G1 X68.526 Y202.035 E.8265
G1 X67.879 Y202.035 E.02411
G1 X83.559 Y217.715 E.8265
G1 X82.913 Y217.715 E.02411
G1 X67.232 Y202.035 E.8265
M73 P32 R39
G1 X66.585 Y202.035 E.02411
G1 X82.266 Y217.715 E.8265
G1 X81.619 Y217.715 E.02411
G1 X65.938 Y202.035 E.8265
G1 X65.292 Y202.035 E.02411
G1 X80.972 Y217.715 E.8265
G1 X80.325 Y217.715 E.02411
G1 X64.645 Y202.035 E.8265
G1 X63.998 Y202.035 E.02411
G1 X79.678 Y217.715 E.8265
G1 X79.032 Y217.715 E.02411
G1 X63.351 Y202.035 E.8265
G1 X62.704 Y202.035 E.02411
G1 X78.385 Y217.715 E.8265
G1 X77.738 Y217.715 E.02411
G1 X62.057 Y202.035 E.8265
G1 X61.411 Y202.035 E.02411
G1 X77.091 Y217.715 E.8265
G1 X76.444 Y217.715 E.02411
G1 X60.764 Y202.035 E.8265
G1 X60.117 Y202.035 E.02411
G1 X75.797 Y217.715 E.8265
G1 X75.151 Y217.715 E.02411
G1 X59.47 Y202.035 E.8265
G1 X58.823 Y202.035 E.02411
G1 X74.504 Y217.715 E.8265
G1 X73.857 Y217.715 E.02411
G1 X58.176 Y202.035 E.8265
G1 X57.53 Y202.035 E.02411
G1 X73.21 Y217.715 E.8265
G1 X72.563 Y217.715 E.02411
G1 X56.883 Y202.035 E.8265
G1 X56.236 Y202.035 E.02411
G1 X71.916 Y217.715 E.8265
G1 X71.27 Y217.715 E.02411
G1 X55.589 Y202.035 E.8265
G1 X54.942 Y202.035 E.02411
G1 X70.623 Y217.715 E.8265
G1 X69.976 Y217.715 E.02411
G1 X38.41 Y186.149 E1.66382
G1 X38.41 Y186.796 E.02411
G1 X69.329 Y217.715 E1.62972
G1 X68.682 Y217.715 E.02411
G1 X38.41 Y187.443 E1.59563
G1 X38.41 Y188.09 E.02411
G1 X68.035 Y217.715 E1.56153
G1 X67.389 Y217.715 E.02411
G1 X38.41 Y188.736 E1.52744
G1 X38.41 Y189.383 E.02411
G1 X66.742 Y217.715 E1.49335
G1 X66.095 Y217.715 E.02411
G1 X38.41 Y190.03 E1.45925
G1 X38.41 Y190.677 E.02411
G1 X65.448 Y217.715 E1.42516
G1 X64.801 Y217.715 E.02411
G1 X38.41 Y191.324 E1.39107
G1 X38.41 Y191.971 E.02411
G1 X64.154 Y217.715 E1.35697
G1 X63.508 Y217.715 E.02411
G1 X38.41 Y192.617 E1.32288
G1 X38.41 Y193.264 E.02411
G1 X62.861 Y217.715 E1.28878
G1 X62.214 Y217.715 E.02411
G1 X38.41 Y193.911 E1.25469
G1 X38.41 Y194.558 E.02411
G1 X61.567 Y217.715 E1.2206
G1 X60.92 Y217.715 E.02411
G1 X38.41 Y195.205 E1.1865
G1 X38.41 Y195.852 E.02411
G1 X60.273 Y217.715 E1.15241
G1 X59.627 Y217.715 E.02411
G1 X38.41 Y196.498 E1.11832
G1 X38.41 Y197.145 E.02411
G1 X47.326 Y206.062 E.46998
G2 X46.546 Y205.924 I-1.402 J5.65 E.02955
G1 X38.41 Y197.792 E.42873
G1 X38.41 Y198.439 E.02411
G1 X45.903 Y205.932 E.39498
G2 X45.343 Y206.019 I.542 J5.357 E.02114
G1 X38.41 Y199.086 E.36545
G1 X38.41 Y199.733 E.02411
G1 X44.85 Y206.173 E.33947
G2 X44.404 Y206.374 I.782 J2.329 E.01826
G1 X38.41 Y200.379 E.31597
G1 X38.41 Y201.026 E.02411
G1 X44 Y206.617 E.29468
G2 X43.635 Y206.898 I1.226 J1.968 E.01722
G1 X38.41 Y201.673 E.27543
G1 X38.41 Y202.32 E.02411
G1 X43.311 Y207.221 E.25833
G2 X43.024 Y207.581 I1.657 J1.613 E.01718
G1 X38.41 Y202.967 E.24322
G1 X38.41 Y203.614 E.02411
G1 X42.776 Y207.98 E.23014
G2 X42.569 Y208.42 I2.092 J1.253 E.01815
G1 X38.41 Y204.26 E.21922
G1 X38.41 Y204.907 E.02411
G1 X42.408 Y208.906 E.21076
G2 X42.314 Y209.459 I2.716 J.746 E.02094
G1 X38.41 Y205.554 E.20581
G1 X38.41 Y206.201 E.02411
G1 X42.294 Y210.085 E.20472
G2 X42.409 Y210.847 I3.876 J-.196 E.02877
G1 X38.204 Y206.642 E.22163
; WIPE_START
G1 X39.618 Y208.056 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X47.244 Y208.364 Z.6 F30000
G1 X49.729 Y208.465 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X58.98 Y217.715 E.48758
G1 X58.333 Y217.715 E.02411
G1 X50.198 Y209.58 E.4288
G3 X50.195 Y210.224 I-3.214 J.309 E.02405
G1 X57.686 Y217.715 E.39485
G1 X57.039 Y217.715 E.02411
G1 X50.103 Y210.779 E.36558
G3 X49.952 Y211.275 I-2.552 J-.51 E.01934
G1 X56.392 Y217.715 E.33947
G1 X55.746 Y217.715 E.02411
G1 X49.753 Y211.722 E.31588
G3 X49.51 Y212.126 I-6.479 J-3.629 E.01757
G1 X55.099 Y217.715 E.2946
G1 X54.452 Y217.715 E.02411
G1 X49.224 Y212.488 E.27554
G3 X48.902 Y212.812 I-1.785 J-1.448 E.01708
G1 X53.805 Y217.715 E.25842
G1 X53.158 Y217.715 E.02411
G1 X48.543 Y213.1 E.24325
G3 X48.146 Y213.35 I-1.447 J-1.861 E.01751
G1 X52.511 Y217.715 E.23009
G1 X51.865 Y217.715 E.02411
G1 X47.708 Y213.559 E.21908
G3 X47.216 Y213.714 I-2.129 J-5.898 E.01923
G1 X51.218 Y217.715 E.21091
G1 X50.571 Y217.715 E.02411
G1 X46.667 Y213.811 E.20578
G3 X46.036 Y213.828 I-.425 J-4.201 E.02353
G1 X49.924 Y217.715 E.20492
G1 X49.277 Y217.715 E.02411
G1 X44.962 Y213.4 E.22746
; WIPE_START
G1 X46.376 Y214.814 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X48.836 Y217.921 Z.6 F30000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X38.41 Y207.495 E.54956
G1 X38.41 Y208.141 E.02411
G1 X47.984 Y217.715 E.50463
G1 X47.337 Y217.715 E.02411
G1 X38.41 Y208.788 E.47053
G1 X38.41 Y209.435 E.02411
G1 X46.69 Y217.715 E.43644
G1 X46.043 Y217.715 E.02411
G1 X38.41 Y210.082 E.40235
G1 X38.41 Y210.729 E.02411
G1 X45.396 Y217.715 E.36825
G1 X44.749 Y217.715 E.02411
G1 X38.41 Y211.376 E.33416
G1 X38.41 Y212.022 E.02411
G1 X44.103 Y217.715 E.30007
G1 X43.456 Y217.715 E.02411
G1 X38.41 Y212.669 E.26597
G1 X38.41 Y213.316 E.02411
M73 P32 R38
G1 X42.809 Y217.715 E.23188
G1 X42.162 Y217.715 E.02411
G1 X38.41 Y213.963 E.19778
G1 X38.41 Y214.61 E.02411
G1 X41.515 Y217.715 E.16369
G1 X40.868 Y217.715 E.02411
G1 X38.41 Y215.257 E.1296
G1 X38.41 Y215.903 E.02411
G1 X40.222 Y217.715 E.0955
G1 X39.575 Y217.715 E.02411
G1 X38.41 Y216.55 E.06141
G1 X38.41 Y217.197 E.02411
M73 P33 R38
G1 X39.134 Y217.921 E.03816
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6300
G1 X38.41 Y217.197 E-.38905
G1 X38.41 Y216.55 E-.2458
G1 X38.643 Y216.783 E-.12516
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/15
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S255
M106 P2 S178
; open powerlost recovery
M1003 S1
M204 S10000
G17
G3 Z.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 15
G1 X125.406 Y211.775
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X125.261 Y211.549 E.00891
G3 X127.624 Y206.68 I2.745 J-1.675 E.21332
G3 X128.24 Y206.666 I.379 J3.066 E.02049
G3 X125.446 Y211.82 I-.235 J3.207 E.42554
G1 X125.74 Y211.544 F30000
G1 F16213.044
G1 X125.608 Y211.337 E.00814
G3 X127.673 Y207.085 I2.397 J-1.463 E.18633
G3 X128.21 Y207.072 I.33 J2.672 E.01785
G3 X125.781 Y211.588 I-.205 J2.801 E.37105
G1 X126.094 Y211.319 F30000
G1 F16213.044
G1 X125.955 Y211.124 E.00792
G3 X127.722 Y207.489 I2.05 J-1.251 E.15934
G3 X128.18 Y207.479 I.281 J2.279 E.01521
G3 X126.243 Y211.505 I-.175 J2.395 E.31004
G1 X126.132 Y211.366 E.00592
G1 X126.533 Y211.235 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X126.405 Y211.083 E.00612
G3 X127.769 Y207.879 I1.604 J-1.209 E.12944
G1 X127.95 Y207.865 E.00558
G3 X126.676 Y211.376 I.06 J2.008 E.2406
G1 X126.576 Y211.277 E.0043
; WIPE_START
M204 S10000
G1 X126.405 Y211.083 E-.09835
G1 X126.189 Y210.747 E-.15186
G1 X126.052 Y210.371 E-.15208
G1 X125.992 Y209.975 E-.15214
G1 X126.012 Y209.575 E-.15213
G1 X126.047 Y209.439 E-.05344
; WIPE_END
G1 E-.04 F1800
G1 X133.676 Y209.217 Z.8 F30000
G1 X208.227 Y207.044 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X208.428 Y206.945 E.00743
G3 X209.374 Y206.68 I1.328 J2.929 E.03273
G3 X209.99 Y206.666 I.379 J3.066 E.02049
G3 X208.143 Y207.091 I-.235 J3.207 E.60639
G1 X208.174 Y207.074 E.0012
G1 X208.72 Y207.264 F30000
G1 F16213.044
G1 X208.856 Y207.213 E.00482
G3 X209.423 Y207.085 I.9 J2.66 E.01933
G3 X209.96 Y207.072 I.33 J2.673 E.01785
G3 X208.595 Y207.316 I-.205 J2.801 E.53887
G1 X208.664 Y207.287 E.00248
G1 X209.169 Y207.546 F30000
G1 F16213.044
G1 X209.218 Y207.533 E.00169
G3 X209.472 Y207.489 I.537 J2.34 E.00853
G3 X209.93 Y207.479 I.281 J2.279 E.01521
G3 X208.985 Y207.599 I-.175 J2.395 E.46866
G1 X209.111 Y207.562 E.00435
G1 X209.519 Y207.879 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.7 Y207.865 E.00558
G3 X209.459 Y207.887 I.06 J2.008 E.38046
; WIPE_START
M204 S10000
G1 X209.7 Y207.865 E-.09174
G1 X210.099 Y207.895 E-.15213
G1 X210.484 Y208.004 E-.15209
G1 X210.841 Y208.186 E-.15216
G1 X211.154 Y208.436 E-.15211
G1 X211.255 Y208.556 E-.05977
; WIPE_END
G1 E-.04 F1800
G1 X210.984 Y200.929 Z.8 F30000
G1 X208.227 Y123.169 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X208.428 Y123.07 E.00744
G3 X209.374 Y122.805 I1.328 J2.929 E.03272
G3 X209.99 Y122.791 I.379 J3.067 E.02049
G3 X208.143 Y123.216 I-.235 J3.207 E.6064
G1 X208.174 Y123.199 E.00119
G1 X208.72 Y123.389 F30000
G1 F16213.044
G1 X208.856 Y123.338 E.00482
G3 X209.423 Y123.21 I.9 J2.66 E.01933
G3 X209.96 Y123.197 I.33 J2.674 E.01785
G3 X208.595 Y123.441 I-.205 J2.801 E.53887
G1 X208.664 Y123.412 E.00248
G1 X209.153 Y123.679 F30000
G1 F16213.044
G1 X209.218 Y123.658 E.00228
G3 X209.472 Y123.614 I.537 J2.34 E.00854
G3 X209.93 Y123.604 I.281 J2.28 E.01521
G3 X208.763 Y123.812 I-.175 J2.395 E.46072
G1 X209.096 Y123.698 E.01168
G1 X209.522 Y124.004 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.7 Y123.99 E.0055
G3 X209.462 Y124.012 I.06 J2.008 E.38055
; WIPE_START
M204 S10000
G1 X209.7 Y123.99 E-.09073
G1 X210.099 Y124.02 E-.15212
G1 X210.484 Y124.129 E-.1521
G1 X210.841 Y124.311 E-.15214
G1 X211.154 Y124.561 E-.15212
G1 X211.256 Y124.683 E-.06079
; WIPE_END
G1 E-.04 F1800
G1 X210.986 Y117.056 Z.8 F30000
G1 X208.227 Y39.294 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X208.428 Y39.195 E.00744
G3 X209.374 Y38.93 I1.328 J2.929 E.03272
G3 X209.99 Y38.916 I.379 J3.066 E.02049
G3 X208.143 Y39.341 I-.235 J3.207 E.60639
G1 X208.174 Y39.324 E.0012
G1 X208.719 Y39.514 F30000
G1 F16213.044
G1 X208.856 Y39.463 E.00482
G3 X209.423 Y39.335 I.9 J2.66 E.01933
G3 X209.96 Y39.322 I.33 J2.673 E.01785
G3 X208.595 Y39.566 I-.205 J2.801 E.53887
G1 X208.664 Y39.537 E.00247
G1 X209.169 Y39.795 F30000
G1 F16213.044
G1 X209.218 Y39.783 E.00169
G3 X209.472 Y39.739 I.537 J2.34 E.00853
G3 X209.93 Y39.729 I.281 J2.279 E.01521
G3 X208.985 Y39.849 I-.175 J2.395 E.46866
G1 X209.111 Y39.812 E.00436
G1 X209.522 Y40.129 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.7 Y40.115 E.00549
G3 X209.462 Y40.137 I.06 J2.008 E.38055
; WIPE_START
M204 S10000
G1 X209.7 Y40.115 E-.09069
G1 X210.099 Y40.145 E-.15212
G1 X210.484 Y40.254 E-.1521
G1 X210.841 Y40.436 E-.15214
G1 X211.154 Y40.686 E-.15212
G1 X211.257 Y40.809 E-.06082
; WIPE_END
G1 E-.04 F1800
G1 X203.626 Y40.643 Z.8 F30000
G1 X128.815 Y39.014 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X128.872 Y39.026 E.00192
G3 X127.624 Y38.93 I-.866 J3.097 E.62844
G3 X128.24 Y38.916 I.379 J3.066 E.02049
G3 X128.559 Y38.955 I-.235 J3.207 E.01064
G1 X128.757 Y39.001 E.00674
G1 X128.392 Y39.345 F30000
G1 F16213.044
G1 X128.488 Y39.357 E.0032
G3 X127.673 Y39.335 I-.483 J2.767 E.55819
G3 X128.21 Y39.322 I.33 J2.673 E.01785
G1 X128.333 Y39.338 E.0041
G1 X128.009 Y39.733 F30000
G1 F16213.044
G1 X128.18 Y39.729 E.00566
G3 X127.722 Y39.739 I-.175 J2.395 E.48523
G1 X127.949 Y39.734 E.00754
G1 X127.772 Y40.129 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X127.95 Y40.115 E.00549
G3 X127.712 Y40.137 I.06 J2.008 E.38055
; WIPE_START
M204 S10000
G1 X127.95 Y40.115 E-.09069
G1 X128.349 Y40.145 E-.15212
G1 X128.734 Y40.254 E-.15212
G1 X129.091 Y40.436 E-.15212
G1 X129.404 Y40.686 E-.15211
G1 X129.507 Y40.809 E-.06084
; WIPE_END
G1 E-.04 F1800
G1 X121.876 Y40.642 Z.8 F30000
G1 X47.065 Y39.014 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X47.122 Y39.026 E.00194
G3 X45.874 Y38.93 I-.866 J3.097 E.62844
G3 X46.49 Y38.916 I.379 J3.066 E.02049
G3 X46.809 Y38.955 I-.235 J3.207 E.01064
G1 X47.006 Y39.001 E.00672
G1 X46.642 Y39.345 F30000
G1 F16213.044
G1 X46.738 Y39.357 E.00322
G3 X45.923 Y39.335 I-.483 J2.767 E.55819
G3 X46.46 Y39.322 I.33 J2.673 E.01785
G1 X46.582 Y39.338 E.00408
G1 X46.258 Y39.733 F30000
G1 F16213.044
G1 X46.43 Y39.729 E.0057
G3 X45.972 Y39.739 I-.175 J2.395 E.48523
G1 X46.198 Y39.734 E.00749
G1 X46.046 Y40.127 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X46.2 Y40.115 E.00475
G3 X45.986 Y40.133 I.06 J2.008 E.38129
; WIPE_START
M204 S10000
G1 X46.2 Y40.115 E-.08154
G1 X46.599 Y40.145 E-.15211
G1 X46.984 Y40.254 E-.15212
G1 X47.341 Y40.436 E-.15212
G1 X47.654 Y40.686 E-.1521
G1 X47.772 Y40.827 E-.07
; WIPE_END
G1 E-.04 F1800
G1 X53.046 Y46.344 Z.8 F30000
G1 X201.166 Y201.291 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X54.834 Y201.291 E4.85411
G1 X54.834 Y50.709 E4.99509
G1 X201.166 Y50.709 E4.85411
G1 X201.166 Y201.231 E4.9931
G1 X200.759 Y200.884 F30000
G1 F16213.044
G1 X55.241 Y200.884 E4.82711
G1 X55.241 Y51.116 E4.96809
G1 X200.759 Y51.116 E4.82711
G1 X200.759 Y200.824 E4.9661
G1 X200.352 Y200.477 F30000
G1 F16213.044
G1 X55.648 Y200.477 E4.8001
G1 X55.648 Y51.523 E4.94108
G1 X200.352 Y51.523 E4.8001
G1 X200.352 Y200.417 E4.93909
G1 X199.96 Y200.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X56.04 Y200.085 E4.42226
G1 X56.04 Y51.915 E4.55285
G1 X199.96 Y51.915 E4.42226
G1 X199.96 Y200.025 E4.55101
; WIPE_START
M204 S10000
G1 X197.96 Y200.026 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X191.14 Y196.6 Z.8 F30000
G1 X49.412 Y125.414 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X49.456 Y125.679 E.00892
G3 X45.874 Y122.805 I-3.2 J.319 E.50057
G3 X46.49 Y122.791 I.379 J3.066 E.02049
G3 X49.406 Y125.354 I-.235 J3.207 E.13826
G1 X49.01 Y125.477 F30000
G1 F16213.044
G1 X49.05 Y125.72 E.00815
G3 X45.923 Y123.21 I-2.795 J.279 E.4372
G3 X46.46 Y123.197 I.33 J2.674 E.01785
G3 X49.003 Y125.418 I-.205 J2.801 E.12015
G1 X48.609 Y125.558 F30000
G1 F16213.044
G1 X48.656 Y126 E.01475
G3 X45.972 Y123.614 I-2.401 J-.001 E.36588
G3 X46.43 Y123.604 I.281 J2.28 E.01521
G3 X48.603 Y125.499 I-.175 J2.395 E.1026
G1 X48.227 Y125.671 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X48.269 Y126 E.01018
G3 X46.019 Y124.004 I-2.009 J-.001 E.28346
G1 X46.2 Y123.99 E.00558
G3 X48.229 Y125.6 I.06 J2.008 E.08647
G1 X48.228 Y125.611 E.00034
; WIPE_START
M204 S10000
G1 X48.269 Y126 E-.14853
G1 X48.22 Y126.398 E-.15247
G1 X48.102 Y126.781 E-.15215
G1 X47.911 Y127.132 E-.15208
G1 X47.654 Y127.439 E-.15214
G1 X47.648 Y127.443 E-.00264
; WIPE_END
G1 E-.04 F1800
G1 X47.295 Y135.068 Z.8 F30000
G1 X43.928 Y207.65 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X44.124 Y207.466 E.00892
G3 X45.874 Y206.68 I2.132 J2.407 E.06462
G3 X46.49 Y206.666 I.379 J3.066 E.02049
G3 X43.889 Y207.696 I-.235 J3.207 E.57423
G1 X44.214 Y207.939 F30000
G1 F16213.044
G1 X44.393 Y207.771 E.00815
G3 X45.923 Y207.085 I1.862 J2.102 E.05647
G3 X46.46 Y207.072 I.33 J2.672 E.01785
G3 X44.176 Y207.986 I-.205 J2.801 E.50089
G1 X44.514 Y208.218 F30000
G1 F16213.044
G1 X44.849 Y207.927 E.01473
G3 X45.972 Y207.489 I1.406 J1.947 E.04039
G3 X46.43 Y207.479 I.281 J2.279 E.01521
G3 X44.474 Y208.263 I-.175 J2.395 E.42811
G1 X44.779 Y208.506 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X45.08 Y208.247 E.01219
G3 X46.019 Y207.879 I1.18 J1.626 E.03133
G1 X46.2 Y207.865 E.00558
G3 X44.747 Y208.552 I.06 J2.008 E.33708
; WIPE_START
M204 S10000
G1 X45.08 Y208.247 E-.17145
G1 X45.423 Y208.043 E-.15187
G1 X45.804 Y207.915 E-.15253
G1 X46.019 Y207.879 E-.08292
G1 X46.2 Y207.865 E-.06897
G1 X46.547 Y207.891 E-.13225
; WIPE_END
G1 E-.04 F1800
G1 X54.165 Y208.36 Z.8 F30000
G1 X218.334 Y218.459 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X37.666 Y218.459 E5.99308
G1 X37.666 Y33.541 E6.13406
G1 X218.334 Y33.541 E5.99308
G1 X218.334 Y218.399 E6.13207
G1 X218.741 Y218.866 F30000
G1 F16213.044
G1 X37.259 Y218.866 E6.02008
G1 X37.259 Y33.134 E6.16106
G1 X218.741 Y33.134 E6.02008
G1 X218.741 Y218.806 E6.15907
G1 X219.148 Y219.273 F30000
G1 F16213.044
G1 X36.852 Y219.273 E6.04709
G1 X36.852 Y32.727 E6.18807
G1 X219.148 Y32.727 E6.04709
G1 X219.148 Y219.213 E6.18608
G1 X219.54 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X36.46 Y219.665 E5.62554
G1 X36.46 Y32.335 E5.75613
G1 X219.54 Y32.335 E5.62554
G1 X219.54 Y219.605 E5.75429
; WIPE_START
M204 S10000
G1 X217.54 Y219.606 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X217.407 Y218.295 Z.8 F30000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42025
G1 F15000
G1 X218.001 Y217.702 E.02579
G1 X218.001 Y217.168 E.01641
G1 X217.043 Y218.126 E.04162
G1 X216.51 Y218.126 E.01641
G1 X218.001 Y216.635 E.06482
G1 X218.001 Y216.101 E.01641
G1 X215.976 Y218.126 E.08802
G1 X215.443 Y218.126 E.01641
G1 X218.001 Y215.568 E.11123
G1 X218.001 Y215.034 E.01641
G1 X214.909 Y218.126 E.13443
G1 X214.375 Y218.126 E.01641
G1 X218.001 Y214.5 E.15764
G1 X218.001 Y213.967 E.01641
G1 X213.842 Y218.126 E.18084
G1 X213.308 Y218.126 E.01641
G1 X218.001 Y213.433 E.20404
G1 X218.001 Y212.899 E.01641
G1 X212.774 Y218.126 E.22725
G1 X212.241 Y218.126 E.01641
G1 X218.001 Y212.366 E.25045
G1 X218.001 Y211.832 E.01641
G1 X211.707 Y218.126 E.27366
G1 X211.174 Y218.126 E.01641
G1 X218.001 Y211.299 E.29686
G1 X218.001 Y210.765 E.01641
G1 X210.64 Y218.126 E.32006
G1 X210.106 Y218.126 E.01641
G1 X218.001 Y210.231 E.34327
G1 X218.001 Y209.698 E.01641
G1 X209.573 Y218.126 E.36647
G1 X209.039 Y218.126 E.01641
G1 X218.001 Y209.164 E.38968
G1 X218.001 Y208.63 E.01641
G1 X208.505 Y218.126 E.41288
G1 X207.972 Y218.126 E.01641
G1 X218.001 Y208.097 E.43608
G1 X218.001 Y207.563 E.01641
G1 X207.438 Y218.126 E.45929
G1 X206.905 Y218.126 E.01641
G1 X218.001 Y207.03 E.48249
G1 X218.001 Y206.496 E.01641
G1 X206.371 Y218.126 E.5057
M73 P34 R38
G1 X205.837 Y218.126 E.01641
G1 X210.656 Y213.307 E.20954
G3 X210.012 Y213.417 I-1.18 J-4.961 E.0201
G1 X205.304 Y218.126 E.20475
G1 X204.77 Y218.126 E.01641
G1 X209.483 Y213.412 E.20495
G3 X209.015 Y213.347 I.09 J-2.376 E.01457
G1 X204.236 Y218.126 E.20778
G1 X203.703 Y218.126 E.01641
G1 X208.596 Y213.233 E.21276
G3 X208.219 Y213.076 I.593 J-1.962 E.01258
G1 X203.169 Y218.126 E.21957
G1 X202.636 Y218.126 E.01641
G1 X207.875 Y212.887 E.22781
G3 X207.561 Y212.666 I.943 J-1.677 E.0118
G1 X202.102 Y218.126 E.23738
G1 X201.568 Y218.126 E.01641
G1 X207.276 Y212.417 E.24821
G3 X207.02 Y212.14 I1.258 J-1.419 E.01163
G1 X201.035 Y218.126 E.26027
G1 X200.501 Y218.126 E.01641
G1 X206.792 Y211.834 E.27357
G3 X206.595 Y211.498 I1.579 J-1.155 E.01201
G1 X199.967 Y218.126 E.28818
G1 X199.434 Y218.126 E.01641
G1 X206.429 Y211.13 E.3042
G3 X206.302 Y210.723 I5.958 J-2.084 E.0131
G1 X198.9 Y218.126 E.32188
G1 X198.367 Y218.126 E.01641
G1 X206.224 Y210.268 E.34168
G3 X206.203 Y209.756 I2.547 J-.364 E.01578
G1 X197.833 Y218.126 E.36395
G1 X197.299 Y218.126 E.01641
G1 X206.278 Y209.147 E.39044
G3 X206.545 Y208.346 I3.705 J.79 E.02599
G1 X196.766 Y218.126 E.42523
G1 X196.232 Y218.126 E.01641
G1 X218.001 Y196.357 E.94657
G1 X218.001 Y196.891 E.01641
G1 X208.216 Y206.675 E.42546
G3 X209.024 Y206.401 I1.244 J2.337 E.02635
G1 X218.001 Y197.424 E.39033
G1 X218.001 Y197.958 E.01641
G1 X209.632 Y206.327 E.3639
G3 X210.143 Y206.349 I.055 J4.54 E.01574
G1 X218.001 Y198.492 E.34168
G1 X218.001 Y199.025 E.01641
G1 X210.596 Y206.43 E.32197
G3 X211.005 Y206.555 I-.419 J2.104 E.01316
G1 X218.001 Y199.559 E.3042
G1 X218.001 Y200.092 E.01641
G1 X211.376 Y206.717 E.28808
G3 X211.711 Y206.916 I-.824 J1.774 E.012
G1 X218.001 Y200.626 E.2735
G1 X218.001 Y201.16 E.01641
G1 X212.016 Y207.144 E.26022
G3 X212.293 Y207.401 I-1.143 J1.51 E.01163
G1 X218.001 Y201.693 E.24818
G1 X218.001 Y202.227 E.01641
G1 X212.542 Y207.686 E.23737
G3 X212.761 Y208 I-1.459 J1.254 E.0118
G1 X218.001 Y202.761 E.22782
G1 X218.001 Y203.294 E.01641
G1 X212.95 Y208.345 E.21961
G3 X213.106 Y208.723 I-1.812 J.966 E.01259
G1 X218.001 Y203.828 E.21285
G1 X218.001 Y204.361 E.01641
G1 X213.223 Y209.139 E.20774
G3 X213.288 Y209.607 I-4.812 J.909 E.01455
G1 X218.001 Y204.895 E.20491
G1 X218.001 Y205.429 E.01641
G1 X213.288 Y210.141 E.2049
G3 X213.179 Y210.784 I-3.726 J-.303 E.02008
G1 X218.17 Y205.793 E.21704
; WIPE_START
G1 X216.756 Y207.207 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X215.74 Y199.642 Z.8 F30000
G1 X195.721 Y50.545 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X212.391 Y33.874 E.72491
G1 X211.858 Y33.874 E.01641
G1 X195.357 Y50.376 E.71753
G1 X194.823 Y50.376 E.01641
G1 X211.324 Y33.874 E.71753
G1 X210.79 Y33.874 E.01641
G1 X194.289 Y50.376 E.71753
G1 X193.756 Y50.376 E.01641
G1 X210.257 Y33.874 E.71753
G1 X209.723 Y33.874 E.01641
G1 X193.222 Y50.376 E.71753
G1 X192.688 Y50.376 E.01641
G1 X209.19 Y33.874 E.71753
G1 X208.656 Y33.874 E.01641
G1 X192.155 Y50.376 E.71753
G1 X191.621 Y50.376 E.01641
G1 X208.122 Y33.874 E.71753
G1 X207.589 Y33.874 E.01641
G1 X191.088 Y50.376 E.71753
G1 X190.554 Y50.376 E.01641
G1 X207.055 Y33.874 E.71753
G1 X206.521 Y33.874 E.01641
G1 X190.02 Y50.376 E.71753
G1 X189.487 Y50.376 E.01641
G1 X205.988 Y33.874 E.71753
G1 X205.454 Y33.874 E.01641
G1 X188.953 Y50.376 E.71753
G1 X188.419 Y50.376 E.01641
G1 X204.921 Y33.874 E.71753
G1 X204.387 Y33.874 E.01641
G1 X187.886 Y50.376 E.71753
G1 X187.352 Y50.376 E.01641
G1 X203.853 Y33.874 E.71753
G1 X203.32 Y33.874 E.01641
G1 X186.819 Y50.376 E.71753
G1 X186.285 Y50.376 E.01641
G1 X202.786 Y33.874 E.71753
G1 X202.252 Y33.874 E.01641
G1 X185.751 Y50.376 E.71753
G1 X185.218 Y50.376 E.01641
G1 X201.719 Y33.874 E.71753
G1 X201.185 Y33.874 E.01641
G1 X184.684 Y50.376 E.71753
G1 X184.15 Y50.376 E.01641
G1 X200.652 Y33.874 E.71753
G1 X200.118 Y33.874 E.01641
G1 X183.617 Y50.376 E.71753
G1 X183.083 Y50.376 E.01641
G1 X199.584 Y33.874 E.71753
G1 X199.051 Y33.874 E.01641
G1 X182.55 Y50.376 E.71753
G1 X182.016 Y50.376 E.01641
G1 X198.517 Y33.874 E.71753
G1 X197.983 Y33.874 E.01641
G1 X181.482 Y50.376 E.71753
G1 X180.949 Y50.376 E.01641
G1 X197.45 Y33.874 E.71753
G1 X196.916 Y33.874 E.01641
G1 X180.415 Y50.376 E.71753
G1 X179.881 Y50.376 E.01641
G1 X196.383 Y33.874 E.71753
G1 X195.849 Y33.874 E.01641
G1 X179.348 Y50.376 E.71753
G1 X178.814 Y50.376 E.01641
G1 X195.315 Y33.874 E.71753
G1 X194.782 Y33.874 E.01641
G1 X178.281 Y50.376 E.71753
G1 X177.747 Y50.376 E.01641
G1 X194.248 Y33.874 E.71753
G1 X193.714 Y33.874 E.01641
G1 X177.213 Y50.376 E.71753
G1 X176.68 Y50.376 E.01641
G1 X193.181 Y33.874 E.71753
G1 X192.647 Y33.874 E.01641
G1 X176.146 Y50.376 E.71753
G1 X175.612 Y50.376 E.01641
G1 X192.113 Y33.874 E.71753
G1 X191.58 Y33.874 E.01641
G1 X175.079 Y50.376 E.71753
G1 X174.545 Y50.376 E.01641
G1 X191.046 Y33.874 E.71753
G1 X190.513 Y33.874 E.01641
G1 X174.012 Y50.376 E.71753
G1 X173.478 Y50.376 E.01641
G1 X189.979 Y33.874 E.71753
G1 X189.445 Y33.874 E.01641
G1 X172.944 Y50.376 E.71753
G1 X172.411 Y50.376 E.01641
G1 X188.912 Y33.874 E.71753
G1 X188.378 Y33.874 E.01641
G1 X171.877 Y50.376 E.71753
G1 X171.343 Y50.376 E.01641
G1 X187.844 Y33.874 E.71753
G1 X187.311 Y33.874 E.01641
G1 X170.81 Y50.376 E.71753
G1 X170.276 Y50.376 E.01641
G1 X186.777 Y33.874 E.71753
G1 X186.244 Y33.874 E.01641
G1 X169.743 Y50.376 E.71753
G1 X169.209 Y50.376 E.01641
G1 X185.71 Y33.874 E.71753
G1 X185.176 Y33.874 E.01641
G1 X168.675 Y50.376 E.71753
G1 X168.142 Y50.376 E.01641
G1 X184.643 Y33.874 E.71753
G1 X184.109 Y33.874 E.01641
G1 X167.608 Y50.376 E.71753
G1 X167.074 Y50.376 E.01641
G1 X183.575 Y33.874 E.71753
G1 X183.042 Y33.874 E.01641
G1 X166.541 Y50.376 E.71753
G1 X166.007 Y50.376 E.01641
G1 X182.508 Y33.874 E.71753
G1 X181.975 Y33.874 E.01641
G1 X165.474 Y50.376 E.71753
G1 X164.94 Y50.376 E.01641
G1 X181.441 Y33.874 E.71753
G1 X180.907 Y33.874 E.01641
G1 X164.406 Y50.376 E.71753
G1 X163.873 Y50.376 E.01641
G1 X180.374 Y33.874 E.71753
G1 X179.84 Y33.874 E.01641
G1 X163.339 Y50.376 E.71753
G1 X162.805 Y50.376 E.01641
G1 X179.306 Y33.874 E.71753
G1 X178.773 Y33.874 E.01641
G1 X162.272 Y50.376 E.71753
G1 X161.738 Y50.376 E.01641
G1 X178.239 Y33.874 E.71753
G1 X177.706 Y33.874 E.01641
G1 X161.205 Y50.376 E.71753
G1 X160.671 Y50.376 E.01641
G1 X177.172 Y33.874 E.71753
G1 X176.638 Y33.874 E.01641
G1 X160.137 Y50.376 E.71753
G1 X159.604 Y50.376 E.01641
G1 X176.105 Y33.874 E.71753
G1 X175.571 Y33.874 E.01641
G1 X159.07 Y50.376 E.71753
G1 X158.536 Y50.376 E.01641
G1 X175.037 Y33.874 E.71753
G1 X174.504 Y33.874 E.01641
G1 X158.003 Y50.376 E.71753
G1 X157.469 Y50.376 E.01641
G1 X173.97 Y33.874 E.71753
G1 X173.437 Y33.874 E.01641
G1 X156.936 Y50.376 E.71753
G1 X156.402 Y50.376 E.01641
G1 X172.903 Y33.874 E.71753
G1 X172.369 Y33.874 E.01641
G1 X155.868 Y50.376 E.71753
G1 X155.335 Y50.376 E.01641
G1 X171.836 Y33.874 E.71753
G1 X171.302 Y33.874 E.01641
G1 X154.801 Y50.376 E.71753
G1 X154.267 Y50.376 E.01641
G1 X170.768 Y33.874 E.71753
G1 X170.235 Y33.874 E.01641
G1 X153.734 Y50.376 E.71753
G1 X153.2 Y50.376 E.01641
G1 X169.701 Y33.874 E.71753
G1 X169.168 Y33.874 E.01641
G1 X152.667 Y50.376 E.71753
G1 X152.133 Y50.376 E.01641
G1 X168.634 Y33.874 E.71753
G1 X168.1 Y33.874 E.01641
G1 X151.599 Y50.376 E.71753
G1 X151.066 Y50.376 E.01641
G1 X167.567 Y33.874 E.71753
G1 X167.033 Y33.874 E.01641
G1 X150.532 Y50.376 E.71753
G1 X149.998 Y50.376 E.01641
G1 X166.499 Y33.874 E.71753
G1 X165.966 Y33.874 E.01641
G1 X149.465 Y50.376 E.71753
G1 X148.931 Y50.376 E.01641
G1 X165.432 Y33.874 E.71753
G1 X164.899 Y33.874 E.01641
G1 X148.398 Y50.376 E.71753
G1 X147.864 Y50.376 E.01641
G1 X164.365 Y33.874 E.71753
G1 X163.831 Y33.874 E.01641
G1 X147.33 Y50.376 E.71753
G1 X146.797 Y50.376 E.01641
G1 X163.298 Y33.874 E.71753
G1 X162.764 Y33.874 E.01641
G1 X146.263 Y50.376 E.71753
G1 X145.729 Y50.376 E.01641
G1 X162.23 Y33.874 E.71753
G1 X161.697 Y33.874 E.01641
G1 X145.196 Y50.376 E.71753
G1 X144.662 Y50.376 E.01641
G1 X161.163 Y33.874 E.71753
G1 X160.63 Y33.874 E.01641
G1 X144.129 Y50.376 E.71753
G1 X143.595 Y50.376 E.01641
G1 X160.096 Y33.874 E.71753
G1 X159.562 Y33.874 E.01641
G1 X143.061 Y50.376 E.71753
G1 X142.528 Y50.376 E.01641
G1 X159.029 Y33.874 E.71753
G1 X158.495 Y33.874 E.01641
G1 X141.994 Y50.376 E.71753
G1 X141.46 Y50.376 E.01641
G1 X157.961 Y33.874 E.71753
G1 X157.428 Y33.874 E.01641
G1 X140.927 Y50.376 E.71753
G1 X140.393 Y50.376 E.01641
G1 X156.894 Y33.874 E.71753
G1 X156.361 Y33.874 E.01641
G1 X139.86 Y50.376 E.71753
G1 X139.326 Y50.376 E.01641
G1 X155.827 Y33.874 E.71753
G1 X155.293 Y33.874 E.01641
G1 X138.792 Y50.376 E.71753
G1 X138.259 Y50.376 E.01641
G1 X154.76 Y33.874 E.71753
G1 X154.226 Y33.874 E.01641
G1 X137.725 Y50.376 E.71753
G1 X137.191 Y50.376 E.01641
G1 X153.692 Y33.874 E.71753
G1 X153.159 Y33.874 E.01641
G1 X136.658 Y50.376 E.71753
G1 X136.124 Y50.376 E.01641
G1 X152.625 Y33.874 E.71753
G1 X152.092 Y33.874 E.01641
G1 X135.591 Y50.376 E.71753
G1 X135.057 Y50.376 E.01641
G1 X151.558 Y33.874 E.71753
G1 X151.024 Y33.874 E.01641
G1 X134.523 Y50.376 E.71753
G1 X133.99 Y50.376 E.01641
G1 X150.491 Y33.874 E.71753
G1 X149.957 Y33.874 E.01641
G1 X133.456 Y50.376 E.71753
G1 X132.922 Y50.376 E.01641
G1 X149.423 Y33.874 E.71753
G1 X148.89 Y33.874 E.01641
G1 X132.389 Y50.376 E.71753
G1 X131.855 Y50.376 E.01641
G1 X148.356 Y33.874 E.71753
G1 X147.823 Y33.874 E.01641
G1 X131.322 Y50.376 E.71753
G1 X130.788 Y50.376 E.01641
G1 X147.289 Y33.874 E.71753
G1 X146.755 Y33.874 E.01641
G1 X130.254 Y50.376 E.71753
G1 X129.721 Y50.376 E.01641
G1 X146.222 Y33.874 E.71753
G1 X145.688 Y33.874 E.01641
G1 X129.187 Y50.376 E.71753
G1 X128.653 Y50.376 E.01641
G1 X145.154 Y33.874 E.71753
G1 X144.621 Y33.874 E.01641
G1 X128.12 Y50.376 E.71753
G1 X127.586 Y50.376 E.01641
G1 X144.087 Y33.874 E.71753
G1 X143.554 Y33.874 E.01641
G1 X127.053 Y50.376 E.71753
G1 X126.519 Y50.376 E.01641
G1 X143.02 Y33.874 E.71753
G1 X142.486 Y33.874 E.01641
G1 X125.985 Y50.376 E.71753
G1 X125.452 Y50.376 E.01641
G1 X141.953 Y33.874 E.71753
G1 X141.419 Y33.874 E.01641
G1 X124.918 Y50.376 E.71753
G1 X124.384 Y50.376 E.01641
G1 X129.354 Y45.405 E.21612
G3 X128.602 Y45.625 I-1.087 J-2.332 E.0242
G1 X123.851 Y50.376 E.20659
G1 X123.317 Y50.376 E.01641
G1 X128.02 Y45.673 E.20449
G3 X127.517 Y45.642 I.021 J-4.429 E.01549
G1 X122.784 Y50.376 E.20584
G1 X122.25 Y50.376 E.01641
G1 X127.076 Y45.55 E.20984
G3 X126.676 Y45.416 I.469 J-2.063 E.01298
G1 X121.716 Y50.376 E.21566
G1 X121.183 Y50.376 E.01641
G1 X126.312 Y45.246 E.22305
G3 X125.981 Y45.044 I.847 J-1.76 E.01196
G1 X120.649 Y50.376 E.23185
G1 X120.115 Y50.376 E.01641
G1 X125.679 Y44.811 E.24194
G3 X125.407 Y44.551 I1.168 J-1.494 E.01162
G1 X119.582 Y50.376 E.25329
G1 X119.048 Y50.376 E.01641
G1 X125.163 Y44.261 E.26589
G3 X124.95 Y43.94 I1.493 J-1.226 E.01185
G1 X118.515 Y50.376 E.27982
G1 X117.981 Y50.376 E.01641
G1 X124.768 Y43.589 E.29511
G3 X124.62 Y43.203 I1.859 J-.93 E.01273
G1 X117.447 Y50.376 E.31191
G1 X116.914 Y50.376 E.01641
G1 X124.513 Y42.776 E.33044
G3 X124.453 Y42.303 I2.341 J-.536 E.01471
G1 X116.38 Y50.376 E.35104
G1 X115.846 Y50.376 E.01641
G1 X124.473 Y41.749 E.3751
G3 X124.611 Y41.077 I3.538 J.378 E.02113
G1 X115.313 Y50.376 E.40432
G1 X114.779 Y50.376 E.01641
G1 X131.28 Y33.874 E.71753
G1 X131.814 Y33.874 E.01641
G1 X126.954 Y38.734 E.21133
G3 X127.626 Y38.596 I1.183 J4.042 E.02113
G1 X132.347 Y33.874 E.2053
G1 X132.881 Y33.874 E.01641
G1 X128.175 Y38.581 E.20466
G3 X128.653 Y38.636 I-.293 J4.694 E.01483
G1 X133.415 Y33.874 E.20704
G1 X133.948 Y33.874 E.01641
G1 X129.078 Y38.745 E.21179
G3 X129.463 Y38.893 I-.549 J1.998 E.01271
G1 X134.482 Y33.874 E.21825
G1 X135.016 Y33.874 E.01641
G1 X129.814 Y39.076 E.22619
M73 P34 R37
G3 X130.134 Y39.29 I-.91 J1.706 E.01185
G1 X135.549 Y33.874 E.23549
G1 X136.083 Y33.874 E.01641
G1 X130.424 Y39.533 E.24606
G3 X130.686 Y39.805 I-1.227 J1.446 E.01162
G1 X136.616 Y33.874 E.25787
G1 X137.15 Y33.874 E.01641
G1 X130.92 Y40.105 E.27092
G3 X131.123 Y40.435 I-9.381 J6.01 E.01192
G1 X137.684 Y33.874 E.28528
G1 X138.217 Y33.874 E.01641
G1 X131.292 Y40.799 E.30112
G3 X131.425 Y41.2 I-1.937 J.863 E.01301
G1 X138.751 Y33.874 E.31856
G1 X139.285 Y33.874 E.01641
G1 X131.515 Y41.644 E.33786
G3 X131.551 Y42.142 I-4.898 J.604 E.01535
G1 X139.818 Y33.874 E.3595
G1 X140.352 Y33.874 E.01641
G1 X131.496 Y42.73 E.38508
G3 X131.283 Y43.477 I-3.805 J-.683 E.02393
G1 X141.055 Y33.705 E.42494
G1 X130.916 Y33.705 F30000
G1 F15000
G1 X114.246 Y50.376 E.72491
G1 X113.712 Y50.376 E.01641
G1 X130.213 Y33.874 E.71753
G1 X129.679 Y33.874 E.01641
G1 X113.178 Y50.376 E.71753
G1 X112.645 Y50.376 E.01641
G1 X129.146 Y33.874 E.71753
G1 X128.612 Y33.874 E.01641
G1 X112.111 Y50.376 E.71753
G1 X111.577 Y50.376 E.01641
G1 X128.078 Y33.874 E.71753
G1 X127.545 Y33.874 E.01641
G1 X111.044 Y50.376 E.71753
G1 X110.51 Y50.376 E.01641
G1 X127.011 Y33.874 E.71753
G1 X126.478 Y33.874 E.01641
G1 X109.977 Y50.376 E.71753
G1 X109.443 Y50.376 E.01641
G1 X125.944 Y33.874 E.71753
G1 X125.41 Y33.874 E.01641
G1 X108.909 Y50.376 E.71753
G1 X108.376 Y50.376 E.01641
G1 X124.877 Y33.874 E.71753
G1 X124.343 Y33.874 E.01641
G1 X107.842 Y50.376 E.71753
G1 X107.308 Y50.376 E.01641
G1 X123.809 Y33.874 E.71753
G1 X123.276 Y33.874 E.01641
G1 X106.775 Y50.376 E.71753
G1 X106.241 Y50.376 E.01641
G1 X122.742 Y33.874 E.71753
G1 X122.209 Y33.874 E.01641
G1 X105.708 Y50.376 E.71753
G1 X105.174 Y50.376 E.01641
G1 X121.675 Y33.874 E.71753
G1 X121.141 Y33.874 E.01641
G1 X104.64 Y50.376 E.71753
G1 X104.107 Y50.376 E.01641
G1 X120.608 Y33.874 E.71753
G1 X120.074 Y33.874 E.01641
G1 X103.573 Y50.376 E.71753
G1 X103.039 Y50.376 E.01641
G1 X119.54 Y33.874 E.71753
G1 X119.007 Y33.874 E.01641
G1 X102.506 Y50.376 E.71753
G1 X101.972 Y50.376 E.01641
G1 X118.473 Y33.874 E.71753
G1 X117.94 Y33.874 E.01641
G1 X101.439 Y50.376 E.71753
G1 X100.905 Y50.376 E.01641
G1 X117.406 Y33.874 E.71753
G1 X116.872 Y33.874 E.01641
G1 X100.371 Y50.376 E.71753
G1 X99.838 Y50.376 E.01641
G1 X116.339 Y33.874 E.71753
G1 X115.805 Y33.874 E.01641
G1 X99.304 Y50.376 E.71753
G1 X98.77 Y50.376 E.01641
G1 X115.271 Y33.874 E.71753
G1 X114.738 Y33.874 E.01641
G1 X98.237 Y50.376 E.71753
G1 X97.703 Y50.376 E.01641
G1 X114.204 Y33.874 E.71753
G1 X113.671 Y33.874 E.01641
G1 X97.17 Y50.376 E.71753
G1 X96.636 Y50.376 E.01641
G1 X113.137 Y33.874 E.71753
G1 X112.603 Y33.874 E.01641
G1 X96.102 Y50.376 E.71753
G1 X95.569 Y50.376 E.01641
G1 X112.07 Y33.874 E.71753
G1 X111.536 Y33.874 E.01641
G1 X95.035 Y50.376 E.71753
G1 X94.501 Y50.376 E.01641
G1 X111.002 Y33.874 E.71753
G1 X110.469 Y33.874 E.01641
G1 X93.968 Y50.376 E.71753
G1 X93.434 Y50.376 E.01641
G1 X109.935 Y33.874 E.71753
G1 X109.402 Y33.874 E.01641
G1 X92.9 Y50.376 E.71753
G1 X92.367 Y50.376 E.01641
G1 X108.868 Y33.874 E.71753
G1 X108.334 Y33.874 E.01641
G1 X91.833 Y50.376 E.71753
G1 X91.3 Y50.376 E.01641
G1 X107.801 Y33.874 E.71753
G1 X107.267 Y33.874 E.01641
G1 X90.766 Y50.376 E.71753
G1 X90.232 Y50.376 E.01641
G1 X106.733 Y33.874 E.71753
G1 X106.2 Y33.874 E.01641
G1 X89.699 Y50.376 E.71753
G1 X89.165 Y50.376 E.01641
G1 X105.666 Y33.874 E.71753
G1 X105.133 Y33.874 E.01641
G1 X88.631 Y50.376 E.71753
G1 X88.098 Y50.376 E.01641
G1 X104.599 Y33.874 E.71753
G1 X104.065 Y33.874 E.01641
G1 X87.564 Y50.376 E.71753
G1 X87.031 Y50.376 E.01641
G1 X103.532 Y33.874 E.71753
G1 X102.998 Y33.874 E.01641
G1 X86.497 Y50.376 E.71753
G1 X85.963 Y50.376 E.01641
G1 X102.464 Y33.874 E.71753
G1 X101.931 Y33.874 E.01641
G1 X85.43 Y50.376 E.71753
G1 X84.896 Y50.376 E.01641
G1 X101.397 Y33.874 E.71753
G1 X100.864 Y33.874 E.01641
G1 X84.362 Y50.376 E.71753
G1 X83.829 Y50.376 E.01641
G1 X100.33 Y33.874 E.71753
G1 X99.796 Y33.874 E.01641
G1 X83.295 Y50.376 E.71753
G1 X82.762 Y50.376 E.01641
G1 X99.263 Y33.874 E.71753
G1 X98.729 Y33.874 E.01641
G1 X82.228 Y50.376 E.71753
G1 X81.694 Y50.376 E.01641
G1 X98.195 Y33.874 E.71753
G1 X97.662 Y33.874 E.01641
G1 X81.161 Y50.376 E.71753
G1 X80.627 Y50.376 E.01641
G1 X97.128 Y33.874 E.71753
G1 X96.595 Y33.874 E.01641
G1 X80.093 Y50.376 E.71753
G1 X79.56 Y50.376 E.01641
G1 X96.061 Y33.874 E.71753
G1 X95.527 Y33.874 E.01641
G1 X79.026 Y50.376 E.71753
G1 X78.493 Y50.376 E.01641
G1 X94.994 Y33.874 E.71753
G1 X94.46 Y33.874 E.01641
G1 X77.959 Y50.376 E.71753
G1 X77.425 Y50.376 E.01641
G1 X93.926 Y33.874 E.71753
G1 X93.393 Y33.874 E.01641
G1 X76.892 Y50.376 E.71753
G1 X76.358 Y50.376 E.01641
G1 X92.859 Y33.874 E.71753
G1 X92.326 Y33.874 E.01641
G1 X75.824 Y50.376 E.71753
G1 X75.291 Y50.376 E.01641
G1 X91.792 Y33.874 E.71753
G1 X91.258 Y33.874 E.01641
G1 X74.757 Y50.376 E.71753
G1 X74.224 Y50.376 E.01641
G1 X90.725 Y33.874 E.71753
G1 X90.191 Y33.874 E.01641
G1 X73.69 Y50.376 E.71753
G1 X73.156 Y50.376 E.01641
G1 X89.657 Y33.874 E.71753
G1 X89.124 Y33.874 E.01641
G1 X72.623 Y50.376 E.71753
G1 X72.089 Y50.376 E.01641
G1 X88.59 Y33.874 E.71753
G1 X88.057 Y33.874 E.01641
G1 X71.555 Y50.376 E.71753
G1 X71.022 Y50.376 E.01641
G1 X87.523 Y33.874 E.71753
G1 X86.989 Y33.874 E.01641
G1 X70.488 Y50.376 E.71753
G1 X69.955 Y50.376 E.01641
G1 X86.456 Y33.874 E.71753
G1 X85.922 Y33.874 E.01641
G1 X69.421 Y50.376 E.71753
G1 X68.887 Y50.376 E.01641
G1 X85.388 Y33.874 E.71753
G1 X84.855 Y33.874 E.01641
G1 X68.354 Y50.376 E.71753
G1 X67.82 Y50.376 E.01641
G1 X84.321 Y33.874 E.71753
G1 X83.788 Y33.874 E.01641
G1 X67.286 Y50.376 E.71753
G1 X66.753 Y50.376 E.01641
G1 X83.254 Y33.874 E.71753
G1 X82.72 Y33.874 E.01641
G1 X66.219 Y50.376 E.71753
G1 X65.686 Y50.376 E.01641
G1 X82.187 Y33.874 E.71753
G1 X81.653 Y33.874 E.01641
G1 X65.152 Y50.376 E.71753
M73 P35 R37
G1 X64.618 Y50.376 E.01641
G1 X81.119 Y33.874 E.71753
G1 X80.586 Y33.874 E.01641
G1 X64.085 Y50.376 E.71753
G1 X63.551 Y50.376 E.01641
G1 X80.052 Y33.874 E.71753
G1 X79.519 Y33.874 E.01641
G1 X63.017 Y50.376 E.71753
G1 X62.484 Y50.376 E.01641
G1 X78.985 Y33.874 E.71753
G1 X78.451 Y33.874 E.01641
G1 X61.95 Y50.376 E.71753
G1 X61.417 Y50.376 E.01641
G1 X77.918 Y33.874 E.71753
G1 X77.384 Y33.874 E.01641
G1 X60.883 Y50.376 E.71753
G1 X60.349 Y50.376 E.01641
G1 X76.85 Y33.874 E.71753
G1 X76.317 Y33.874 E.01641
G1 X59.816 Y50.376 E.71753
G1 X59.282 Y50.376 E.01641
G1 X75.783 Y33.874 E.71753
G1 X75.25 Y33.874 E.01641
G1 X58.748 Y50.376 E.71753
G1 X58.215 Y50.376 E.01641
G1 X74.716 Y33.874 E.71753
G1 X74.182 Y33.874 E.01641
G1 X57.681 Y50.376 E.71753
G1 X57.148 Y50.376 E.01641
G1 X73.649 Y33.874 E.71753
G1 X73.115 Y33.874 E.01641
G1 X56.614 Y50.376 E.71753
G1 X56.08 Y50.376 E.01641
G1 X72.581 Y33.874 E.71753
G1 X72.048 Y33.874 E.01641
G1 X55.547 Y50.376 E.71753
G1 X55.013 Y50.376 E.01641
G1 X71.514 Y33.874 E.71753
G1 X70.981 Y33.874 E.01641
G1 X37.999 Y66.856 E1.43414
G1 X37.999 Y67.389 E.01641
G1 X54.501 Y50.888 E.71753
G1 X54.501 Y51.422 E.01641
G1 X37.999 Y67.923 E.71753
G1 X37.999 Y68.456 E.01641
G1 X54.501 Y51.955 E.71753
G1 X54.501 Y52.489 E.01641
G1 X37.999 Y68.99 E.71753
G1 X37.999 Y69.524 E.01641
G1 X54.501 Y53.023 E.71753
G1 X54.501 Y53.556 E.01641
G1 X37.999 Y70.057 E.71753
G1 X37.999 Y70.591 E.01641
G1 X54.501 Y54.09 E.71753
G1 X54.501 Y54.623 E.01641
G1 X37.999 Y71.125 E.71753
G1 X37.999 Y71.658 E.01641
G1 X54.501 Y55.157 E.71753
G1 X54.501 Y55.691 E.01641
G1 X37.999 Y72.192 E.71753
G1 X37.999 Y72.725 E.01641
G1 X54.501 Y56.224 E.71753
G1 X54.501 Y56.758 E.01641
G1 X37.999 Y73.259 E.71753
G1 X37.999 Y73.793 E.01641
G1 X54.501 Y57.292 E.71753
G1 X54.501 Y57.825 E.01641
G1 X37.999 Y74.326 E.71753
G1 X37.999 Y74.86 E.01641
G1 X54.501 Y58.359 E.71753
G1 X54.501 Y58.892 E.01641
G1 X37.999 Y75.394 E.71753
G1 X37.999 Y75.927 E.01641
G1 X54.501 Y59.426 E.71753
G1 X54.501 Y59.96 E.01641
G1 X37.999 Y76.461 E.71753
G1 X37.999 Y76.994 E.01641
G1 X54.501 Y60.493 E.71753
G1 X54.501 Y61.027 E.01641
G1 X37.999 Y77.528 E.71753
G1 X37.999 Y78.062 E.01641
G1 X54.501 Y61.561 E.71753
G1 X54.501 Y62.094 E.01641
G1 X37.999 Y78.595 E.71753
G1 X37.999 Y79.129 E.01641
G1 X54.501 Y62.628 E.71753
G1 X54.501 Y63.161 E.01641
G1 X37.999 Y79.663 E.71753
G1 X37.999 Y80.196 E.01641
G1 X54.501 Y63.695 E.71753
G1 X54.501 Y64.229 E.01641
G1 X37.999 Y80.73 E.71753
G1 X37.999 Y81.263 E.01641
G1 X54.501 Y64.762 E.71753
G1 X54.501 Y65.296 E.01641
G1 X37.999 Y81.797 E.71753
G1 X37.999 Y82.331 E.01641
G1 X54.501 Y65.83 E.71753
G1 X54.501 Y66.363 E.01641
G1 X37.999 Y82.864 E.71753
G1 X37.999 Y83.398 E.01641
G1 X54.501 Y66.897 E.71753
G1 X54.501 Y67.43 E.01641
G1 X37.999 Y83.932 E.71753
G1 X37.999 Y84.465 E.01641
G1 X54.501 Y67.964 E.71753
G1 X54.501 Y68.498 E.01641
G1 X37.999 Y84.999 E.71753
G1 X37.999 Y85.532 E.01641
G1 X54.501 Y69.031 E.71753
G1 X54.501 Y69.565 E.01641
G1 X37.999 Y86.066 E.71753
G1 X37.999 Y86.6 E.01641
G1 X54.501 Y70.099 E.71753
G1 X54.501 Y70.632 E.01641
G1 X37.999 Y87.133 E.71753
G1 X37.999 Y87.667 E.01641
G1 X54.501 Y71.166 E.71753
G1 X54.501 Y71.699 E.01641
G1 X37.999 Y88.201 E.71753
G1 X37.999 Y88.734 E.01641
G1 X54.501 Y72.233 E.71753
G1 X54.501 Y72.767 E.01641
G1 X37.999 Y89.268 E.71753
G1 X37.999 Y89.801 E.01641
G1 X54.501 Y73.3 E.71753
G1 X54.501 Y73.834 E.01641
G1 X37.999 Y90.335 E.71753
G1 X37.999 Y90.869 E.01641
G1 X54.501 Y74.368 E.71753
G1 X54.501 Y74.901 E.01641
G1 X37.999 Y91.402 E.71753
G1 X37.999 Y91.936 E.01641
G1 X54.501 Y75.435 E.71753
G1 X54.501 Y75.968 E.01641
G1 X37.999 Y92.47 E.71753
G1 X37.999 Y93.003 E.01641
G1 X54.501 Y76.502 E.71753
G1 X54.501 Y77.036 E.01641
G1 X37.999 Y93.537 E.71753
G1 X37.999 Y94.07 E.01641
G1 X54.501 Y77.569 E.71753
G1 X54.501 Y78.103 E.01641
G1 X37.999 Y94.604 E.71753
G1 X37.999 Y95.138 E.01641
G1 X54.501 Y78.637 E.71753
G1 X54.501 Y79.17 E.01641
G1 X37.999 Y95.671 E.71753
G1 X37.999 Y96.205 E.01641
G1 X54.501 Y79.704 E.71753
G1 X54.501 Y80.237 E.01641
G1 X37.999 Y96.739 E.71753
G1 X37.999 Y97.272 E.01641
G1 X54.501 Y80.771 E.71753
G1 X54.501 Y81.305 E.01641
G1 X37.999 Y97.806 E.71753
G1 X37.999 Y98.339 E.01641
G1 X54.501 Y81.838 E.71753
G1 X54.501 Y82.372 E.01641
G1 X37.999 Y98.873 E.71753
G1 X37.999 Y99.407 E.01641
G1 X54.501 Y82.906 E.71753
G1 X54.501 Y83.439 E.01641
G1 X37.999 Y99.94 E.71753
G1 X37.999 Y100.474 E.01641
G1 X54.501 Y83.973 E.71753
G1 X54.501 Y84.506 E.01641
G1 X37.999 Y101.008 E.71753
G1 X37.999 Y101.541 E.01641
G1 X54.501 Y85.04 E.71753
G1 X54.501 Y85.574 E.01641
G1 X37.999 Y102.075 E.71753
G1 X37.999 Y102.608 E.01641
G1 X54.501 Y86.107 E.71753
G1 X54.501 Y86.641 E.01641
G1 X37.999 Y103.142 E.71753
G1 X37.999 Y103.676 E.01641
G1 X54.501 Y87.175 E.71753
G1 X54.501 Y87.708 E.01641
G1 X37.999 Y104.209 E.71753
G1 X37.999 Y104.743 E.01641
G1 X54.501 Y88.242 E.71753
G1 X54.501 Y88.775 E.01641
G1 X37.999 Y105.277 E.71753
G1 X37.999 Y105.81 E.01641
G1 X54.501 Y89.309 E.71753
G1 X54.501 Y89.843 E.01641
G1 X37.999 Y106.344 E.71753
G1 X37.999 Y106.877 E.01641
G1 X54.501 Y90.376 E.71753
G1 X54.501 Y90.91 E.01641
G1 X37.999 Y107.411 E.71753
G1 X37.999 Y107.945 E.01641
G1 X54.501 Y91.444 E.71753
G1 X54.501 Y91.977 E.01641
G1 X37.999 Y108.478 E.71753
G1 X37.999 Y109.012 E.01641
G1 X54.501 Y92.511 E.71753
G1 X54.501 Y93.044 E.01641
G1 X37.999 Y109.546 E.71753
G1 X37.999 Y110.079 E.01641
G1 X54.501 Y93.578 E.71753
G1 X54.501 Y94.112 E.01641
G1 X37.999 Y110.613 E.71753
G1 X37.999 Y111.146 E.01641
G1 X54.501 Y94.645 E.71753
G1 X54.501 Y95.179 E.01641
G1 X37.999 Y111.68 E.71753
G1 X37.999 Y112.214 E.01641
G1 X54.501 Y95.713 E.71753
G1 X54.501 Y96.246 E.01641
G1 X37.999 Y112.747 E.71753
G1 X37.999 Y113.281 E.01641
G1 X54.501 Y96.78 E.71753
G1 X54.501 Y97.313 E.01641
G1 X37.999 Y113.815 E.71753
G1 X37.999 Y114.348 E.01641
G1 X54.501 Y97.847 E.71753
G1 X54.501 Y98.381 E.01641
G1 X37.999 Y114.882 E.71753
G1 X37.999 Y115.415 E.01641
G1 X54.501 Y98.914 E.71753
G1 X54.501 Y99.448 E.01641
G1 X37.999 Y115.949 E.71753
G1 X37.999 Y116.483 E.01641
G1 X54.501 Y99.982 E.71753
G1 X54.501 Y100.515 E.01641
G1 X37.999 Y117.016 E.71753
G1 X37.999 Y117.55 E.01641
G1 X54.501 Y101.049 E.71753
G1 X54.501 Y101.582 E.01641
G1 X37.999 Y118.084 E.71753
G1 X37.999 Y118.617 E.01641
G1 X54.501 Y102.116 E.71753
G1 X54.501 Y102.65 E.01641
G1 X37.999 Y119.151 E.71753
G1 X37.999 Y119.684 E.01641
G1 X54.501 Y103.183 E.71753
G1 X54.501 Y103.717 E.01641
G1 X37.999 Y120.218 E.71753
G1 X37.999 Y120.752 E.01641
G1 X54.501 Y104.251 E.71753
G1 X54.501 Y104.784 E.01641
G1 X37.999 Y121.285 E.71753
G1 X37.999 Y121.819 E.01641
G1 X54.501 Y105.318 E.71753
G1 X54.501 Y105.851 E.01641
G1 X37.999 Y122.353 E.71753
G1 X37.999 Y122.886 E.01641
G1 X54.501 Y106.385 E.71753
G1 X54.501 Y106.919 E.01641
G1 X37.999 Y123.42 E.71753
G1 X37.999 Y123.953 E.01641
G1 X54.501 Y107.452 E.71753
G1 X54.501 Y107.986 E.01641
G1 X37.999 Y124.487 E.71753
G1 X37.999 Y125.021 E.01641
G1 X54.501 Y108.52 E.71753
G1 X54.501 Y109.053 E.01641
G1 X37.999 Y125.554 E.71753
G1 X37.999 Y126.088 E.01641
G1 X54.501 Y109.587 E.71753
G1 X54.501 Y110.12 E.01641
G1 X37.999 Y126.622 E.71753
G1 X37.999 Y127.155 E.01641
G1 X54.501 Y110.654 E.71753
G1 X54.501 Y111.188 E.01641
G1 X37.999 Y127.689 E.71753
G1 X37.999 Y128.222 E.01641
G1 X54.501 Y111.721 E.71753
G1 X54.501 Y112.255 E.01641
G1 X37.83 Y128.926 E.72491
; WIPE_START
G1 X39.244 Y127.512 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.464 Y125.037 Z.8 F30000
G1 X54.67 Y122.224 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X49.527 Y127.367 E.22363
G2 X49.744 Y126.616 I-3.673 J-1.469 E.02407
G1 X54.501 Y121.86 E.20681
G1 X54.501 Y121.327 E.01641
G1 X49.8 Y126.027 E.20438
G2 X49.766 Y125.527 I-4.68 J.07 E.0154
G1 X54.501 Y120.793 E.20587
G1 X54.501 Y120.259 E.01641
G1 X49.677 Y125.083 E.20975
G2 X49.545 Y124.681 I-2.075 J.459 E.01302
G1 X54.501 Y119.726 E.21549
G1 X54.501 Y119.192 E.01641
G1 X49.376 Y124.316 E.22282
G2 X49.174 Y123.985 I-9.488 J5.574 E.01194
G1 X54.501 Y118.658 E.23162
G1 X54.501 Y118.125 E.01641
G1 X48.941 Y123.685 E.24176
G2 X48.679 Y123.413 I-1.491 J1.172 E.01162
G1 X54.501 Y117.591 E.25314
G1 X54.501 Y117.058 E.01641
G1 X48.389 Y123.169 E.26575
G2 X48.07 Y122.955 I-1.232 J1.49 E.01184
G1 X54.501 Y116.524 E.27963
G1 X54.501 Y115.99 E.01641
G1 X47.719 Y122.771 E.29487
G2 X47.335 Y122.622 I-.936 J1.846 E.0127
G1 X54.501 Y115.457 E.31159
G1 X54.501 Y114.923 E.01641
G1 X46.911 Y122.512 E.33001
G2 X46.434 Y122.456 I-.78 J4.57 E.01479
G1 X54.501 Y114.389 E.35077
G1 X54.501 Y113.856 E.01641
G1 X45.886 Y122.47 E.37458
G2 X45.217 Y122.606 I.476 J4.07 E.02102
G1 X54.501 Y113.322 E.40368
G1 X54.501 Y112.789 E.01641
G1 X37.999 Y129.29 E.71753
G1 X37.999 Y129.823 E.01641
G1 X42.857 Y124.966 E.21121
G2 X42.722 Y125.635 I3.398 J1.035 E.02101
G1 X37.999 Y130.357 E.20534
G1 X37.999 Y130.891 E.01641
G1 X42.704 Y126.186 E.20456
G2 X42.764 Y126.659 I2.396 J-.067 E.01469
G1 X37.999 Y131.424 E.20719
G1 X37.999 Y131.958 E.01641
G1 X42.872 Y127.085 E.2119
G2 X43.02 Y127.471 I2.005 J-.547 E.01272
G1 X37.999 Y132.491 E.21833
G1 X37.999 Y133.025 E.01641
G1 X43.203 Y127.822 E.22627
G2 X43.417 Y128.141 I1.709 J-.912 E.01185
G1 X37.999 Y133.559 E.23556
G1 X37.999 Y134.092 E.01641
G1 X43.661 Y128.43 E.2462
G2 X43.935 Y128.691 I1.435 J-1.233 E.01162
G1 X37.999 Y134.626 E.25809
G1 X37.999 Y135.16 E.01641
G1 X44.237 Y128.922 E.27122
G2 X44.568 Y129.124 I1.175 J-1.558 E.01196
G1 X37.999 Y135.693 E.28565
G1 X37.999 Y136.227 E.01641
G1 X44.933 Y129.294 E.30148
G2 X45.333 Y129.427 I.867 J-1.935 E.01299
G1 X37.999 Y136.76 E.31889
G1 X37.999 Y137.294 E.01641
G1 X45.775 Y129.518 E.33812
G2 X46.28 Y129.548 I.515 J-4.498 E.01554
G1 X37.999 Y137.828 E.36005
G1 X37.999 Y138.361 E.01641
G1 X46.863 Y129.498 E.3854
G2 X47.622 Y129.273 I-.364 J-2.615 E.02444
G1 X37.999 Y138.895 E.41841
G1 X37.999 Y139.429 E.01641
G1 X54.501 Y122.927 E.71753
G1 X54.501 Y123.461 E.01641
G1 X37.999 Y139.962 E.71753
G1 X37.999 Y140.496 E.01641
G1 X54.501 Y123.995 E.71753
G1 X54.501 Y124.528 E.01641
G1 X37.999 Y141.029 E.71753
G1 X37.999 Y141.563 E.01641
G1 X54.501 Y125.062 E.71753
G1 X54.501 Y125.596 E.01641
G1 X37.999 Y142.097 E.71753
G1 X37.999 Y142.63 E.01641
G1 X54.501 Y126.129 E.71753
G1 X54.501 Y126.663 E.01641
G1 X37.999 Y143.164 E.71753
G1 X37.999 Y143.698 E.01641
G1 X54.501 Y127.196 E.71753
G1 X54.501 Y127.73 E.01641
G1 X37.999 Y144.231 E.71753
G1 X37.999 Y144.765 E.01641
G1 X54.501 Y128.264 E.71753
G1 X54.501 Y128.797 E.01641
G1 X37.999 Y145.298 E.71753
G1 X37.999 Y145.832 E.01641
G1 X54.501 Y129.331 E.71753
G1 X54.501 Y129.865 E.01641
G1 X37.999 Y146.366 E.71753
G1 X37.999 Y146.899 E.01641
G1 X54.501 Y130.398 E.71753
G1 X54.501 Y130.932 E.01641
G1 X37.999 Y147.433 E.71753
G1 X37.999 Y147.967 E.01641
G1 X54.501 Y131.466 E.71753
G1 X54.501 Y131.999 E.01641
G1 X37.999 Y148.5 E.71753
G1 X37.999 Y149.034 E.01641
G1 X54.501 Y132.533 E.71753
G1 X54.501 Y133.066 E.01641
G1 X37.999 Y149.567 E.71753
G1 X37.999 Y150.101 E.01641
G1 X54.501 Y133.6 E.71753
G1 X54.501 Y134.134 E.01641
G1 X37.999 Y150.635 E.71753
G1 X37.999 Y151.168 E.01641
G1 X54.501 Y134.667 E.71753
G1 X54.501 Y135.201 E.01641
G1 X37.999 Y151.702 E.71753
G1 X37.999 Y152.236 E.01641
G1 X54.501 Y135.735 E.71753
G1 X54.501 Y136.268 E.01641
G1 X37.999 Y152.769 E.71753
G1 X37.999 Y153.303 E.01641
G1 X54.501 Y136.802 E.71753
G1 X54.501 Y137.335 E.01641
G1 X37.999 Y153.836 E.71753
G1 X37.999 Y154.37 E.01641
G1 X54.501 Y137.869 E.71753
G1 X54.501 Y138.403 E.01641
G1 X37.999 Y154.904 E.71753
G1 X37.999 Y155.437 E.01641
G1 X54.501 Y138.936 E.71753
G1 X54.501 Y139.47 E.01641
G1 X37.999 Y155.971 E.71753
G1 X37.999 Y156.505 E.01641
G1 X54.501 Y140.004 E.71753
G1 X54.501 Y140.537 E.01641
G1 X37.999 Y157.038 E.71753
G1 X37.999 Y157.572 E.01641
G1 X54.501 Y141.071 E.71753
G1 X54.501 Y141.604 E.01641
G1 X37.999 Y158.105 E.71753
G1 X37.999 Y158.639 E.01641
G1 X54.501 Y142.138 E.71753
G1 X54.501 Y142.672 E.01641
G1 X37.999 Y159.173 E.71753
G1 X37.999 Y159.706 E.01641
G1 X54.501 Y143.205 E.71753
G1 X54.501 Y143.739 E.01641
G1 X37.999 Y160.24 E.71753
G1 X37.999 Y160.774 E.01641
G1 X54.501 Y144.273 E.71753
G1 X54.501 Y144.806 E.01641
G1 X37.999 Y161.307 E.71753
G1 X37.999 Y161.841 E.01641
G1 X54.501 Y145.34 E.71753
G1 X54.501 Y145.873 E.01641
G1 X37.999 Y162.374 E.71753
G1 X37.999 Y162.908 E.01641
G1 X54.501 Y146.407 E.71753
G1 X54.501 Y146.941 E.01641
G1 X37.999 Y163.442 E.71753
G1 X37.999 Y163.975 E.01641
G1 X54.501 Y147.474 E.71753
G1 X54.501 Y148.008 E.01641
G1 X37.999 Y164.509 E.71753
G1 X37.999 Y165.043 E.01641
G1 X54.501 Y148.542 E.71753
G1 X54.501 Y149.075 E.01641
G1 X37.999 Y165.576 E.71753
G1 X37.999 Y166.11 E.01641
G1 X54.501 Y149.609 E.71753
G1 X54.501 Y150.142 E.01641
G1 X37.999 Y166.643 E.71753
G1 X37.999 Y167.177 E.01641
G1 X54.501 Y150.676 E.71753
G1 X54.501 Y151.21 E.01641
G1 X37.999 Y167.711 E.71753
G1 X37.999 Y168.244 E.01641
G1 X54.501 Y151.743 E.71753
G1 X54.501 Y152.277 E.01641
G1 X37.999 Y168.778 E.71753
G1 X37.999 Y169.312 E.01641
G1 X54.501 Y152.811 E.71753
G1 X54.501 Y153.344 E.01641
G1 X37.999 Y169.845 E.71753
G1 X37.999 Y170.379 E.01641
G1 X54.501 Y153.878 E.71753
G1 X54.501 Y154.411 E.01641
G1 X37.999 Y170.912 E.71753
G1 X37.999 Y171.446 E.01641
G1 X54.501 Y154.945 E.71753
G1 X54.501 Y155.479 E.01641
G1 X37.999 Y171.98 E.71753
G1 X37.999 Y172.513 E.01641
G1 X54.501 Y156.012 E.71753
G1 X54.501 Y156.546 E.01641
G1 X37.999 Y173.047 E.71753
G1 X37.999 Y173.581 E.01641
G1 X54.501 Y157.08 E.71753
G1 X54.501 Y157.613 E.01641
G1 X37.999 Y174.114 E.71753
G1 X37.999 Y174.648 E.01641
G1 X54.501 Y158.147 E.71753
G1 X54.501 Y158.68 E.01641
G1 X37.999 Y175.181 E.71753
G1 X37.999 Y175.715 E.01641
G1 X54.501 Y159.214 E.71753
G1 X54.501 Y159.748 E.01641
G1 X37.999 Y176.249 E.71753
G1 X37.999 Y176.782 E.01641
G1 X54.501 Y160.281 E.71753
G1 X54.501 Y160.815 E.01641
G1 X37.999 Y177.316 E.71753
G1 X37.999 Y177.85 E.01641
G1 X54.501 Y161.349 E.71753
G1 X54.501 Y161.882 E.01641
G1 X37.999 Y178.383 E.71753
G1 X37.999 Y178.917 E.01641
G1 X54.501 Y162.416 E.71753
G1 X54.501 Y162.949 E.01641
G1 X37.999 Y179.45 E.71753
G1 X37.999 Y179.984 E.01641
G1 X54.501 Y163.483 E.71753
G1 X54.501 Y164.017 E.01641
G1 X37.999 Y180.518 E.71753
G1 X37.999 Y181.051 E.01641
G1 X54.501 Y164.55 E.71753
G1 X54.501 Y165.084 E.01641
G1 X37.999 Y181.585 E.71753
G1 X37.999 Y182.119 E.01641
G1 X54.501 Y165.618 E.71753
G1 X54.501 Y166.151 E.01641
G1 X37.999 Y182.652 E.71753
G1 X37.999 Y183.186 E.01641
G1 X54.501 Y166.685 E.71753
G1 X54.501 Y167.218 E.01641
G1 X37.999 Y183.719 E.71753
G1 X37.999 Y184.253 E.01641
G1 X54.501 Y167.752 E.71753
G1 X54.501 Y168.286 E.01641
G1 X37.999 Y184.787 E.71753
G1 X37.999 Y185.32 E.01641
G1 X54.501 Y168.819 E.71753
G1 X54.501 Y169.353 E.01641
G1 X37.999 Y185.854 E.71753
G1 X37.999 Y186.388 E.01641
G1 X54.501 Y169.887 E.71753
G1 X54.501 Y170.42 E.01641
G1 X37.999 Y186.921 E.71753
G1 X37.999 Y187.455 E.01641
G1 X54.501 Y170.954 E.71753
G1 X54.501 Y171.487 E.01641
G1 X37.999 Y187.988 E.71753
G1 X37.999 Y188.522 E.01641
G1 X54.501 Y172.021 E.71753
G1 X54.501 Y172.555 E.01641
G1 X37.999 Y189.056 E.71753
G1 X37.999 Y189.589 E.01641
G1 X54.501 Y173.088 E.71753
G1 X54.501 Y173.622 E.01641
G1 X37.999 Y190.123 E.71753
G1 X37.999 Y190.657 E.01641
G1 X54.501 Y174.156 E.71753
G1 X54.501 Y174.689 E.01641
G1 X37.999 Y191.19 E.71753
G1 X37.999 Y191.724 E.01641
G1 X54.501 Y175.223 E.71753
G1 X54.501 Y175.756 E.01641
G1 X37.999 Y192.257 E.71753
G1 X37.999 Y192.791 E.01641
G1 X54.501 Y176.29 E.71753
G1 X54.501 Y176.824 E.01641
G1 X37.999 Y193.325 E.71753
G1 X37.999 Y193.858 E.01641
G1 X54.501 Y177.357 E.71753
G1 X54.501 Y177.891 E.01641
G1 X37.999 Y194.392 E.71753
G1 X37.999 Y194.926 E.01641
G1 X54.501 Y178.425 E.71753
G1 X54.501 Y178.958 E.01641
G1 X37.999 Y195.459 E.71753
G1 X37.999 Y195.993 E.01641
G1 X54.501 Y179.492 E.71753
G1 X54.501 Y180.025 E.01641
G1 X37.999 Y196.526 E.71753
G1 X37.999 Y197.06 E.01641
G1 X54.501 Y180.559 E.71753
G1 X54.501 Y181.093 E.01641
G1 X37.999 Y197.594 E.71753
G1 X37.999 Y198.127 E.01641
G1 X54.501 Y181.626 E.71753
G1 X54.501 Y182.16 E.01641
G1 X37.999 Y198.661 E.71753
M73 P36 R37
G1 X37.999 Y199.195 E.01641
G1 X54.501 Y182.694 E.71753
G1 X54.501 Y183.227 E.01641
G1 X37.999 Y199.728 E.71753
G1 X37.999 Y200.262 E.01641
G1 X54.501 Y183.761 E.71753
G1 X54.501 Y184.294 E.01641
G1 X37.999 Y200.795 E.71753
G1 X37.999 Y201.329 E.01641
G1 X54.501 Y184.828 E.71753
G1 X54.501 Y185.362 E.01641
G1 X37.999 Y201.863 E.71753
G1 X37.999 Y202.396 E.01641
G1 X54.501 Y185.895 E.71753
G1 X54.501 Y186.429 E.01641
G1 X37.999 Y202.93 E.71753
G1 X37.999 Y203.464 E.01641
G1 X54.501 Y186.963 E.71753
G1 X54.501 Y187.496 E.01641
G1 X37.999 Y203.997 E.71753
G1 X37.999 Y204.531 E.01641
G1 X54.501 Y188.03 E.71753
G1 X54.501 Y188.563 E.01641
G1 X37.999 Y205.064 E.71753
G1 X37.999 Y205.598 E.01641
G1 X54.501 Y189.097 E.71753
G1 X54.501 Y189.631 E.01641
G1 X37.999 Y206.132 E.71753
G1 X37.999 Y206.665 E.01641
G1 X54.501 Y190.164 E.71753
G1 X54.501 Y190.698 E.01641
G1 X37.999 Y207.199 E.71753
G1 X37.999 Y207.733 E.01641
G1 X54.501 Y191.232 E.71753
G1 X54.501 Y191.765 E.01641
G1 X37.999 Y208.266 E.71753
G1 X37.999 Y208.8 E.01641
G1 X54.501 Y192.299 E.71753
G1 X54.501 Y192.832 E.01641
G1 X37.999 Y209.333 E.71753
G1 X37.999 Y209.867 E.01641
G1 X54.501 Y193.366 E.71753
G1 X54.501 Y193.9 E.01641
G1 X37.999 Y210.401 E.71753
G1 X37.999 Y210.934 E.01641
G1 X54.501 Y194.433 E.71753
G1 X54.501 Y194.967 E.01641
G1 X37.999 Y211.468 E.71753
G1 X37.999 Y212.002 E.01641
G1 X54.501 Y195.501 E.71753
G1 X54.501 Y196.034 E.01641
G1 X37.83 Y212.705 E.72491
; WIPE_START
G1 X39.244 Y211.291 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.091 Y207.919 Z.8 F30000
G1 X59.219 Y201.455 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X49.582 Y211.091 E.41904
G2 X49.761 Y210.379 I-3.334 J-1.217 E.02264
G1 X58.515 Y201.624 E.38066
G1 X57.982 Y201.624 E.01641
G1 X49.798 Y209.808 E.35585
G2 X49.754 Y209.319 I-2.469 J-.02 E.01512
G1 X57.448 Y201.624 E.33459
G1 X56.915 Y201.624 E.01641
G1 X49.657 Y208.882 E.31557
G2 X49.519 Y208.487 I-6.959 J2.226 E.01287
G1 X56.381 Y201.624 E.2984
G1 X55.847 Y201.624 E.01641
G1 X49.341 Y208.131 E.28291
G2 X49.133 Y207.806 I-1.732 J.883 E.01189
G1 X55.314 Y201.624 E.26878
G1 X54.78 Y201.624 E.01641
G1 X48.895 Y207.51 E.25592
G2 X48.628 Y207.243 I-1.47 J1.199 E.01162
G1 X54.501 Y201.37 E.25535
G1 X54.501 Y200.837 E.01641
G1 X48.333 Y207.004 E.26817
G2 X48.009 Y206.795 I-1.21 J1.518 E.01189
G1 X54.501 Y200.303 E.28227
G1 X54.501 Y199.77 E.01641
G1 X47.653 Y206.617 E.29774
G2 X47.263 Y206.473 I-.912 J1.88 E.01281
G1 X54.501 Y199.236 E.31471
G1 X54.501 Y198.702 E.01641
G1 X46.83 Y206.373 E.33354
G2 X46.34 Y206.329 I-.464 J2.429 E.01515
G1 X54.501 Y198.169 E.35484
G1 X54.501 Y197.635 E.01641
G1 X45.777 Y206.359 E.37933
G2 X45.077 Y206.525 I.584 J4.02 E.02214
G1 X54.501 Y197.101 E.40975
G1 X54.501 Y196.568 E.01641
G1 X37.999 Y213.069 E.71753
G1 X37.999 Y213.602 E.01641
G1 X42.9 Y208.702 E.21308
G2 X42.732 Y209.403 I3.88 J1.297 E.02219
G1 X37.999 Y214.136 E.2058
G1 X37.999 Y214.67 E.01641
G1 X42.703 Y209.966 E.20452
G2 X42.748 Y210.455 I4.464 J-.169 E.01508
G1 X37.999 Y215.203 E.20649
G1 X37.999 Y215.737 E.01641
G1 X42.85 Y210.887 E.21091
G2 X42.992 Y211.278 I2.025 J-.513 E.01283
G1 X37.999 Y216.271 E.21709
G1 X37.999 Y216.804 E.01641
G1 X43.169 Y211.635 E.2248
G2 X43.378 Y211.959 I1.725 J-.879 E.01189
G1 X37.999 Y217.338 E.23388
G1 X37.999 Y217.871 E.01641
G1 X43.616 Y212.255 E.24424
G2 X43.883 Y212.521 I1.468 J-1.201 E.01162
G1 X38.279 Y218.126 E.24368
G1 X38.813 Y218.126 E.01641
G1 X44.178 Y212.76 E.23332
G2 X44.505 Y212.967 I1.201 J-1.535 E.01191
G1 X39.346 Y218.126 E.22433
G1 X39.88 Y218.126 E.01641
G1 X44.864 Y213.142 E.21672
G2 X45.258 Y213.281 I.893 J-1.901 E.01288
G1 X40.413 Y218.126 E.21066
G1 X40.947 Y218.126 E.01641
G1 X45.694 Y213.379 E.2064
G2 X46.181 Y213.425 I.711 J-4.904 E.01506
G1 X41.481 Y218.126 E.20439
G1 X42.014 Y218.126 E.01641
G1 X46.753 Y213.387 E.20605
G2 X47.465 Y213.209 I-.538 J-3.665 E.02259
G1 X42.548 Y218.126 E.21379
G1 X43.082 Y218.126 E.01641
G1 X59.583 Y201.624 E.71753
G1 X60.116 Y201.624 E.01641
G1 X43.615 Y218.126 E.71753
G1 X44.149 Y218.126 E.01641
G1 X60.65 Y201.624 E.71753
G1 X61.184 Y201.624 E.01641
G1 X44.682 Y218.126 E.71753
G1 X45.216 Y218.126 E.01641
G1 X61.717 Y201.624 E.71753
G1 X62.251 Y201.624 E.01641
G1 X45.75 Y218.126 E.71753
G1 X46.283 Y218.126 E.01641
G1 X62.784 Y201.624 E.71753
G1 X63.318 Y201.624 E.01641
G1 X46.817 Y218.126 E.71753
G1 X47.351 Y218.126 E.01641
G1 X63.852 Y201.624 E.71753
G1 X64.385 Y201.624 E.01641
G1 X47.884 Y218.126 E.71753
G1 X48.418 Y218.126 E.01641
G1 X64.919 Y201.624 E.71753
G1 X65.453 Y201.624 E.01641
G1 X48.952 Y218.126 E.71753
G1 X49.485 Y218.126 E.01641
G1 X65.986 Y201.624 E.71753
G1 X66.52 Y201.624 E.01641
G1 X50.019 Y218.126 E.71753
G1 X50.552 Y218.126 E.01641
G1 X67.053 Y201.624 E.71753
G1 X67.587 Y201.624 E.01641
G1 X51.086 Y218.126 E.71753
G1 X51.62 Y218.126 E.01641
G1 X68.121 Y201.624 E.71753
G1 X68.654 Y201.624 E.01641
G1 X52.153 Y218.126 E.71753
G1 X52.687 Y218.126 E.01641
G1 X69.188 Y201.624 E.71753
G1 X69.722 Y201.624 E.01641
G1 X53.221 Y218.126 E.71753
G1 X53.754 Y218.126 E.01641
G1 X70.255 Y201.624 E.71753
G1 X70.789 Y201.624 E.01641
G1 X54.288 Y218.126 E.71753
G1 X54.821 Y218.126 E.01641
G1 X71.322 Y201.624 E.71753
G1 X71.856 Y201.624 E.01641
G1 X55.355 Y218.126 E.71753
G1 X55.889 Y218.126 E.01641
G1 X72.39 Y201.624 E.71753
G1 X72.923 Y201.624 E.01641
G1 X56.422 Y218.126 E.71753
G1 X56.956 Y218.126 E.01641
G1 X73.457 Y201.624 E.71753
G1 X73.991 Y201.624 E.01641
G1 X57.49 Y218.126 E.71753
G1 X58.023 Y218.126 E.01641
G1 X74.524 Y201.624 E.71753
G1 X75.058 Y201.624 E.01641
G1 X58.557 Y218.126 E.71753
G1 X59.09 Y218.126 E.01641
G1 X75.591 Y201.624 E.71753
G1 X76.125 Y201.624 E.01641
G1 X59.624 Y218.126 E.71753
G1 X60.158 Y218.126 E.01641
G1 X76.659 Y201.624 E.71753
G1 X77.192 Y201.624 E.01641
G1 X60.691 Y218.126 E.71753
G1 X61.225 Y218.126 E.01641
G1 X77.726 Y201.624 E.71753
G1 X78.26 Y201.624 E.01641
G1 X61.759 Y218.126 E.71753
G1 X62.292 Y218.126 E.01641
G1 X78.793 Y201.624 E.71753
G1 X79.327 Y201.624 E.01641
G1 X62.826 Y218.126 E.71753
G1 X63.359 Y218.126 E.01641
G1 X79.86 Y201.624 E.71753
G1 X80.394 Y201.624 E.01641
G1 X63.893 Y218.126 E.71753
G1 X64.427 Y218.126 E.01641
G1 X80.928 Y201.624 E.71753
G1 X81.461 Y201.624 E.01641
G1 X64.96 Y218.126 E.71753
G1 X65.494 Y218.126 E.01641
G1 X81.995 Y201.624 E.71753
G1 X82.529 Y201.624 E.01641
G1 X66.028 Y218.126 E.71753
G1 X66.561 Y218.126 E.01641
G1 X83.062 Y201.624 E.71753
G1 X83.596 Y201.624 E.01641
G1 X67.095 Y218.126 E.71753
G1 X67.628 Y218.126 E.01641
G1 X84.129 Y201.624 E.71753
G1 X84.663 Y201.624 E.01641
G1 X68.162 Y218.126 E.71753
G1 X68.696 Y218.126 E.01641
G1 X85.197 Y201.624 E.71753
G1 X85.73 Y201.624 E.01641
G1 X69.229 Y218.126 E.71753
G1 X69.763 Y218.126 E.01641
G1 X86.264 Y201.624 E.71753
G1 X86.798 Y201.624 E.01641
G1 X70.297 Y218.126 E.71753
G1 X70.83 Y218.126 E.01641
G1 X87.331 Y201.624 E.71753
G1 X87.865 Y201.624 E.01641
G1 X71.364 Y218.126 E.71753
G1 X71.897 Y218.126 E.01641
G1 X88.398 Y201.624 E.71753
G1 X88.932 Y201.624 E.01641
G1 X72.431 Y218.126 E.71753
G1 X72.965 Y218.126 E.01641
G1 X89.466 Y201.624 E.71753
G1 X89.999 Y201.624 E.01641
G1 X73.498 Y218.126 E.71753
G1 X74.032 Y218.126 E.01641
M73 P36 R36
G1 X90.533 Y201.624 E.71753
G1 X91.067 Y201.624 E.01641
G1 X74.566 Y218.126 E.71753
G1 X75.099 Y218.126 E.01641
G1 X91.6 Y201.624 E.71753
G1 X92.134 Y201.624 E.01641
G1 X75.633 Y218.126 E.71753
G1 X76.166 Y218.126 E.01641
G1 X92.667 Y201.624 E.71753
G1 X93.201 Y201.624 E.01641
G1 X76.7 Y218.126 E.71753
G1 X77.234 Y218.126 E.01641
G1 X93.735 Y201.624 E.71753
G1 X94.268 Y201.624 E.01641
G1 X77.767 Y218.126 E.71753
G1 X78.301 Y218.126 E.01641
G1 X94.802 Y201.624 E.71753
G1 X95.336 Y201.624 E.01641
G1 X78.835 Y218.126 E.71753
G1 X79.368 Y218.126 E.01641
G1 X95.869 Y201.624 E.71753
G1 X96.403 Y201.624 E.01641
G1 X79.902 Y218.126 E.71753
G1 X80.435 Y218.126 E.01641
G1 X96.936 Y201.624 E.71753
G1 X97.47 Y201.624 E.01641
G1 X80.969 Y218.126 E.71753
G1 X81.503 Y218.126 E.01641
G1 X98.004 Y201.624 E.71753
G1 X98.537 Y201.624 E.01641
G1 X82.036 Y218.126 E.71753
G1 X82.57 Y218.126 E.01641
G1 X99.071 Y201.624 E.71753
G1 X99.605 Y201.624 E.01641
G1 X83.104 Y218.126 E.71753
G1 X83.637 Y218.126 E.01641
G1 X100.138 Y201.624 E.71753
G1 X100.672 Y201.624 E.01641
G1 X84.171 Y218.126 E.71753
G1 X84.704 Y218.126 E.01641
G1 X101.205 Y201.624 E.71753
G1 X101.739 Y201.624 E.01641
G1 X85.238 Y218.126 E.71753
G1 X85.772 Y218.126 E.01641
G1 X102.273 Y201.624 E.71753
G1 X102.806 Y201.624 E.01641
G1 X86.305 Y218.126 E.71753
G1 X86.839 Y218.126 E.01641
G1 X103.34 Y201.624 E.71753
G1 X103.874 Y201.624 E.01641
G1 X87.373 Y218.126 E.71753
G1 X87.906 Y218.126 E.01641
G1 X104.407 Y201.624 E.71753
G1 X104.941 Y201.624 E.01641
G1 X88.44 Y218.126 E.71753
G1 X88.973 Y218.126 E.01641
G1 X105.474 Y201.624 E.71753
G1 X106.008 Y201.624 E.01641
G1 X89.507 Y218.126 E.71753
G1 X90.041 Y218.126 E.01641
G1 X106.542 Y201.624 E.71753
G1 X107.075 Y201.624 E.01641
G1 X90.574 Y218.126 E.71753
G1 X91.108 Y218.126 E.01641
G1 X107.609 Y201.624 E.71753
G1 X108.143 Y201.624 E.01641
G1 X91.642 Y218.126 E.71753
G1 X92.175 Y218.126 E.01641
G1 X108.676 Y201.624 E.71753
G1 X109.21 Y201.624 E.01641
G1 X92.709 Y218.126 E.71753
G1 X93.242 Y218.126 E.01641
G1 X109.743 Y201.624 E.71753
G1 X110.277 Y201.624 E.01641
G1 X93.776 Y218.126 E.71753
G1 X94.31 Y218.126 E.01641
G1 X110.811 Y201.624 E.71753
G1 X111.344 Y201.624 E.01641
G1 X94.843 Y218.126 E.71753
G1 X95.377 Y218.126 E.01641
G1 X111.878 Y201.624 E.71753
G1 X112.412 Y201.624 E.01641
G1 X95.911 Y218.126 E.71753
G1 X96.444 Y218.126 E.01641
G1 X112.945 Y201.624 E.71753
G1 X113.479 Y201.624 E.01641
G1 X96.978 Y218.126 E.71753
G1 X97.511 Y218.126 E.01641
G1 X114.012 Y201.624 E.71753
G1 X114.546 Y201.624 E.01641
G1 X98.045 Y218.126 E.71753
G1 X98.579 Y218.126 E.01641
G1 X115.08 Y201.624 E.71753
G1 X115.613 Y201.624 E.01641
G1 X99.112 Y218.126 E.71753
G1 X99.646 Y218.126 E.01641
G1 X116.147 Y201.624 E.71753
G1 X116.681 Y201.624 E.01641
G1 X100.18 Y218.126 E.71753
G1 X100.713 Y218.126 E.01641
G1 X117.214 Y201.624 E.71753
G1 X117.748 Y201.624 E.01641
G1 X101.247 Y218.126 E.71753
G1 X101.78 Y218.126 E.01641
G1 X118.281 Y201.624 E.71753
G1 X118.815 Y201.624 E.01641
G1 X102.314 Y218.126 E.71753
G1 X102.848 Y218.126 E.01641
G1 X119.349 Y201.624 E.71753
G1 X119.882 Y201.624 E.01641
G1 X103.381 Y218.126 E.71753
G1 X103.915 Y218.126 E.01641
G1 X120.416 Y201.624 E.71753
G1 X120.95 Y201.624 E.01641
G1 X104.449 Y218.126 E.71753
G1 X104.982 Y218.126 E.01641
G1 X121.483 Y201.624 E.71753
G1 X122.017 Y201.624 E.01641
G1 X105.516 Y218.126 E.71753
G1 X106.049 Y218.126 E.01641
G1 X122.55 Y201.624 E.71753
G1 X123.084 Y201.624 E.01641
G1 X106.583 Y218.126 E.71753
G1 X107.117 Y218.126 E.01641
G1 X123.618 Y201.624 E.71753
G1 X124.151 Y201.624 E.01641
G1 X107.65 Y218.126 E.71753
G1 X108.184 Y218.126 E.01641
G1 X124.685 Y201.624 E.71753
G1 X125.219 Y201.624 E.01641
G1 X108.718 Y218.126 E.71753
G1 X109.251 Y218.126 E.01641
G1 X125.752 Y201.624 E.71753
G1 X126.286 Y201.624 E.01641
G1 X109.785 Y218.126 E.71753
G1 X110.318 Y218.126 E.01641
G1 X126.819 Y201.624 E.71753
G1 X127.353 Y201.624 E.01641
G1 X110.852 Y218.126 E.71753
G1 X111.386 Y218.126 E.01641
G1 X127.887 Y201.624 E.71753
G1 X128.42 Y201.624 E.01641
G1 X111.919 Y218.126 E.71753
G1 X112.453 Y218.126 E.01641
G1 X128.954 Y201.624 E.71753
G1 X129.488 Y201.624 E.01641
G1 X112.987 Y218.126 E.71753
G1 X113.52 Y218.126 E.01641
G1 X130.021 Y201.624 E.71753
G1 X130.555 Y201.624 E.01641
G1 X113.884 Y218.295 E.72491
G1 X124.023 Y218.295 F30000
G1 F15000
G1 X129.056 Y213.262 E.21885
G3 X128.383 Y213.402 I-1.088 J-3.549 E.02117
G1 X123.659 Y218.126 E.2054
G1 X123.125 Y218.126 E.01641
G1 X127.831 Y213.42 E.20463
G3 X127.354 Y213.363 I.044 J-2.417 E.0148
G1 X122.592 Y218.126 E.20709
G1 X122.058 Y218.126 E.01641
G1 X126.926 Y213.258 E.21167
G3 X126.539 Y213.112 I.534 J-2.007 E.01272
G1 X121.525 Y218.126 E.21803
G1 X120.991 Y218.126 E.01641
G1 X126.189 Y212.928 E.22601
G3 X125.87 Y212.713 I.911 J-1.698 E.01184
G1 X120.457 Y218.126 E.23535
G1 X119.924 Y218.126 E.01641
G1 X125.58 Y212.469 E.24595
G3 X125.318 Y212.197 I1.228 J-1.442 E.01162
G1 X119.39 Y218.126 E.25778
G1 X118.856 Y218.126 E.01641
G1 X125.085 Y211.897 E.27085
G3 X124.882 Y211.566 I1.547 J-1.18 E.01195
G1 X118.323 Y218.126 E.28522
G1 X117.789 Y218.126 E.01641
G1 X124.711 Y211.204 E.30097
G3 X124.575 Y210.806 I1.929 J-.88 E.01295
G1 X117.256 Y218.126 E.31828
G1 X116.722 Y218.126 E.01641
G1 X124.484 Y210.364 E.33752
G3 X124.453 Y209.861 I2.495 J-.407 E.0155
G1 X116.188 Y218.126 E.35937
G1 X115.655 Y218.126 E.01641
G1 X124.502 Y209.279 E.3847
G3 X124.718 Y208.528 I3.633 J.642 E.02405
G1 X115.121 Y218.126 E.41731
G1 X114.587 Y218.126 E.01641
G1 X131.088 Y201.624 E.71753
G1 X131.622 Y201.624 E.01641
G1 X126.654 Y206.593 E.21603
G3 X127.401 Y206.38 I1.329 J3.242 E.02392
G1 X132.156 Y201.624 E.20677
G1 X132.689 Y201.624 E.01641
G1 X127.988 Y206.326 E.20445
G3 X128.486 Y206.361 I.076 J2.513 E.01541
G1 X133.223 Y201.624 E.20596
G1 X133.757 Y201.624 E.01641
G1 X128.932 Y206.449 E.2098
G3 X129.331 Y206.584 I-1.91 J6.319 E.01295
G1 X134.29 Y201.624 E.21565
G1 X134.824 Y201.624 E.01641
G1 X129.692 Y206.756 E.22314
G3 X130.022 Y206.96 I-.856 J1.753 E.01194
G1 X135.357 Y201.624 E.23201
G1 X135.891 Y201.624 E.01641
G1 X130.322 Y207.193 E.24216
G3 X130.594 Y207.455 I-1.17 J1.485 E.01162
G1 X136.425 Y201.624 E.25355
G1 X136.958 Y201.624 E.01641
G1 X130.837 Y207.746 E.26618
G3 X131.051 Y208.065 I-1.491 J1.231 E.01185
G1 X137.492 Y201.624 E.28007
G1 X138.026 Y201.624 E.01641
G1 X131.234 Y208.416 E.29531
G3 X131.384 Y208.8 I-1.843 J.937 E.0127
G1 X138.559 Y201.624 E.31202
G1 X139.093 Y201.624 E.01641
G1 X131.49 Y209.228 E.33061
G3 X131.543 Y209.708 I-2.373 J.508 E.01488
G1 X139.626 Y201.624 E.35149
G1 X140.16 Y201.624 E.01641
G1 X131.53 Y210.255 E.37527
G3 X131.392 Y210.926 I-5.063 J-.688 E.02109
G1 X140.694 Y201.624 E.40446
G1 X141.227 Y201.624 E.01641
G1 X124.726 Y218.126 E.71753
G1 X125.26 Y218.126 E.01641
G1 X141.761 Y201.624 E.71753
G1 X142.295 Y201.624 E.01641
G1 X125.794 Y218.126 E.71753
G1 X126.327 Y218.126 E.01641
G1 X142.828 Y201.624 E.71753
G1 X143.362 Y201.624 E.01641
G1 X126.861 Y218.126 E.71753
G1 X127.394 Y218.126 E.01641
G1 X143.895 Y201.624 E.71753
G1 X144.429 Y201.624 E.01641
G1 X127.928 Y218.126 E.71753
G1 X128.462 Y218.126 E.01641
G1 X144.963 Y201.624 E.71753
G1 X145.496 Y201.624 E.01641
G1 X128.995 Y218.126 E.71753
G1 X129.529 Y218.126 E.01641
G1 X146.03 Y201.624 E.71753
G1 X146.564 Y201.624 E.01641
G1 X130.063 Y218.126 E.71753
G1 X130.596 Y218.126 E.01641
G1 X147.097 Y201.624 E.71753
G1 X147.631 Y201.624 E.01641
G1 X131.13 Y218.126 E.71753
G1 X131.663 Y218.126 E.01641
G1 X148.165 Y201.624 E.71753
G1 X148.698 Y201.624 E.01641
G1 X132.197 Y218.126 E.71753
G1 X132.731 Y218.126 E.01641
G1 X149.232 Y201.624 E.71753
G1 X149.765 Y201.624 E.01641
G1 X133.264 Y218.126 E.71753
G1 X133.798 Y218.126 E.01641
G1 X150.299 Y201.624 E.71753
G1 X150.833 Y201.624 E.01641
G1 X134.332 Y218.126 E.71753
G1 X134.865 Y218.126 E.01641
G1 X151.366 Y201.624 E.71753
G1 X151.9 Y201.624 E.01641
G1 X135.399 Y218.126 E.71753
G1 X135.932 Y218.126 E.01641
G1 X152.434 Y201.624 E.71753
G1 X152.967 Y201.624 E.01641
G1 X136.466 Y218.126 E.71753
G1 X137 Y218.126 E.01641
G1 X153.501 Y201.624 E.71753
G1 X154.034 Y201.624 E.01641
G1 X137.533 Y218.126 E.71753
G1 X138.067 Y218.126 E.01641
G1 X154.568 Y201.624 E.71753
G1 X155.102 Y201.624 E.01641
G1 X138.601 Y218.126 E.71753
G1 X139.134 Y218.126 E.01641
G1 X155.635 Y201.624 E.71753
G1 X156.169 Y201.624 E.01641
G1 X139.668 Y218.126 E.71753
G1 X140.201 Y218.126 E.01641
G1 X156.703 Y201.624 E.71753
G1 X157.236 Y201.624 E.01641
G1 X140.735 Y218.126 E.71753
G1 X141.269 Y218.126 E.01641
G1 X157.77 Y201.624 E.71753
G1 X158.303 Y201.624 E.01641
G1 X141.802 Y218.126 E.71753
G1 X142.336 Y218.126 E.01641
G1 X158.837 Y201.624 E.71753
G1 X159.371 Y201.624 E.01641
G1 X142.87 Y218.126 E.71753
G1 X143.403 Y218.126 E.01641
G1 X159.904 Y201.624 E.71753
G1 X160.438 Y201.624 E.01641
G1 X143.937 Y218.126 E.71753
G1 X144.47 Y218.126 E.01641
G1 X160.972 Y201.624 E.71753
G1 X161.505 Y201.624 E.01641
G1 X145.004 Y218.126 E.71753
G1 X145.538 Y218.126 E.01641
G1 X162.039 Y201.624 E.71753
G1 X162.572 Y201.624 E.01641
G1 X146.071 Y218.126 E.71753
G1 X146.605 Y218.126 E.01641
G1 X163.106 Y201.624 E.71753
G1 X163.64 Y201.624 E.01641
G1 X147.139 Y218.126 E.71753
G1 X147.672 Y218.126 E.01641
G1 X164.173 Y201.624 E.71753
G1 X164.707 Y201.624 E.01641
G1 X148.206 Y218.126 E.71753
G1 X148.739 Y218.126 E.01641
G1 X165.241 Y201.624 E.71753
G1 X165.774 Y201.624 E.01641
G1 X149.273 Y218.126 E.71753
G1 X149.807 Y218.126 E.01641
G1 X166.308 Y201.624 E.71753
G1 X166.841 Y201.624 E.01641
G1 X150.34 Y218.126 E.71753
G1 X150.874 Y218.126 E.01641
G1 X167.375 Y201.624 E.71753
G1 X167.909 Y201.624 E.01641
G1 X151.408 Y218.126 E.71753
G1 X151.941 Y218.126 E.01641
G1 X168.442 Y201.624 E.71753
G1 X168.976 Y201.624 E.01641
G1 X152.475 Y218.126 E.71753
G1 X153.008 Y218.126 E.01641
G1 X169.51 Y201.624 E.71753
G1 X170.043 Y201.624 E.01641
G1 X153.542 Y218.126 E.71753
G1 X154.076 Y218.126 E.01641
G1 X170.577 Y201.624 E.71753
G1 X171.11 Y201.624 E.01641
G1 X154.609 Y218.126 E.71753
G1 X155.143 Y218.126 E.01641
G1 X171.644 Y201.624 E.71753
G1 X172.178 Y201.624 E.01641
G1 X155.677 Y218.126 E.71753
G1 X156.21 Y218.126 E.01641
G1 X172.711 Y201.624 E.71753
G1 X173.245 Y201.624 E.01641
G1 X156.744 Y218.126 E.71753
G1 X157.277 Y218.126 E.01641
G1 X173.779 Y201.624 E.71753
G1 X174.312 Y201.624 E.01641
G1 X157.811 Y218.126 E.71753
G1 X158.345 Y218.126 E.01641
G1 X174.846 Y201.624 E.71753
G1 X175.379 Y201.624 E.01641
G1 X158.878 Y218.126 E.71753
G1 X159.412 Y218.126 E.01641
G1 X175.913 Y201.624 E.71753
G1 X176.447 Y201.624 E.01641
G1 X159.946 Y218.126 E.71753
G1 X160.479 Y218.126 E.01641
G1 X176.98 Y201.624 E.71753
M73 P37 R36
G1 X177.514 Y201.624 E.01641
G1 X161.013 Y218.126 E.71753
G1 X161.546 Y218.126 E.01641
G1 X178.048 Y201.624 E.71753
G1 X178.581 Y201.624 E.01641
G1 X162.08 Y218.126 E.71753
G1 X162.614 Y218.126 E.01641
G1 X179.115 Y201.624 E.71753
G1 X179.648 Y201.624 E.01641
G1 X163.147 Y218.126 E.71753
G1 X163.681 Y218.126 E.01641
G1 X180.182 Y201.624 E.71753
G1 X180.716 Y201.624 E.01641
G1 X164.215 Y218.126 E.71753
G1 X164.748 Y218.126 E.01641
G1 X181.249 Y201.624 E.71753
G1 X181.783 Y201.624 E.01641
G1 X165.282 Y218.126 E.71753
G1 X165.815 Y218.126 E.01641
G1 X182.317 Y201.624 E.71753
G1 X182.85 Y201.624 E.01641
G1 X166.349 Y218.126 E.71753
G1 X166.883 Y218.126 E.01641
G1 X183.384 Y201.624 E.71753
G1 X183.917 Y201.624 E.01641
G1 X167.416 Y218.126 E.71753
G1 X167.95 Y218.126 E.01641
G1 X184.451 Y201.624 E.71753
G1 X184.985 Y201.624 E.01641
G1 X168.484 Y218.126 E.71753
G1 X169.017 Y218.126 E.01641
G1 X185.518 Y201.624 E.71753
G1 X186.052 Y201.624 E.01641
G1 X169.551 Y218.126 E.71753
G1 X170.084 Y218.126 E.01641
G1 X186.586 Y201.624 E.71753
G1 X187.119 Y201.624 E.01641
G1 X170.618 Y218.126 E.71753
G1 X171.152 Y218.126 E.01641
G1 X187.653 Y201.624 E.71753
G1 X188.186 Y201.624 E.01641
G1 X171.685 Y218.126 E.71753
G1 X172.219 Y218.126 E.01641
G1 X188.72 Y201.624 E.71753
G1 X189.254 Y201.624 E.01641
G1 X172.753 Y218.126 E.71753
G1 X173.286 Y218.126 E.01641
G1 X189.787 Y201.624 E.71753
G1 X190.321 Y201.624 E.01641
G1 X173.82 Y218.126 E.71753
G1 X174.353 Y218.126 E.01641
G1 X190.855 Y201.624 E.71753
G1 X191.388 Y201.624 E.01641
G1 X174.887 Y218.126 E.71753
G1 X175.421 Y218.126 E.01641
G1 X191.922 Y201.624 E.71753
G1 X192.455 Y201.624 E.01641
G1 X175.954 Y218.126 E.71753
G1 X176.488 Y218.126 E.01641
G1 X192.989 Y201.624 E.71753
G1 X193.523 Y201.624 E.01641
G1 X177.022 Y218.126 E.71753
G1 X177.555 Y218.126 E.01641
G1 X194.056 Y201.624 E.71753
G1 X194.59 Y201.624 E.01641
G1 X178.089 Y218.126 E.71753
G1 X178.622 Y218.126 E.01641
G1 X195.124 Y201.624 E.71753
G1 X195.657 Y201.624 E.01641
G1 X179.156 Y218.126 E.71753
G1 X179.69 Y218.126 E.01641
G1 X196.191 Y201.624 E.71753
G1 X196.724 Y201.624 E.01641
G1 X180.223 Y218.126 E.71753
G1 X180.757 Y218.126 E.01641
G1 X197.258 Y201.624 E.71753
G1 X197.792 Y201.624 E.01641
G1 X181.291 Y218.126 E.71753
G1 X181.824 Y218.126 E.01641
G1 X198.325 Y201.624 E.71753
G1 X198.859 Y201.624 E.01641
G1 X182.358 Y218.126 E.71753
G1 X182.891 Y218.126 E.01641
G1 X199.393 Y201.624 E.71753
G1 X199.926 Y201.624 E.01641
G1 X183.425 Y218.126 E.71753
G1 X183.959 Y218.126 E.01641
G1 X200.46 Y201.624 E.71753
G1 X200.993 Y201.624 E.01641
G1 X184.323 Y218.295 E.72491
G1 X195.529 Y218.295 F30000
G1 F15000
G1 X218.001 Y195.823 E.97716
G1 X218.001 Y195.29 E.01641
G1 X195.165 Y218.126 E.99298
G1 X194.631 Y218.126 E.01641
G1 X218.001 Y194.756 E1.01618
G1 X218.001 Y194.223 E.01641
G1 X194.098 Y218.126 E1.03939
G1 X193.564 Y218.126 E.01641
G1 X218.001 Y193.689 E1.06259
G1 X218.001 Y193.155 E.01641
G1 X193.03 Y218.126 E1.0858
G1 X192.497 Y218.126 E.01641
G1 X218.001 Y192.622 E1.109
G1 X218.001 Y192.088 E.01641
G1 X191.963 Y218.126 E1.1322
G1 X191.429 Y218.126 E.01641
G1 X218.001 Y191.554 E1.15541
G1 X218.001 Y191.021 E.01641
G1 X190.896 Y218.126 E1.17861
G1 X190.362 Y218.126 E.01641
G1 X218.001 Y190.487 E1.20182
G1 X218.001 Y189.954 E.01641
G1 X189.829 Y218.126 E1.22502
G1 X189.295 Y218.126 E.01641
G1 X218.001 Y189.42 E1.24822
G1 X218.001 Y188.886 E.01641
G1 X188.761 Y218.126 E1.27143
G1 X188.228 Y218.126 E.01641
G1 X218.001 Y188.353 E1.29463
G1 X218.001 Y187.819 E.01641
G1 X187.694 Y218.126 E1.31784
G1 X187.16 Y218.126 E.01641
G1 X218.001 Y187.285 E1.34104
G1 X218.001 Y186.752 E.01641
G1 X186.627 Y218.126 E1.36424
G1 X186.093 Y218.126 E.01641
G1 X218.001 Y186.218 E1.38745
G1 X218.001 Y185.685 E.01641
G1 X185.56 Y218.126 E1.41065
G1 X185.026 Y218.126 E.01641
G1 X218.001 Y185.151 E1.43386
G1 X218.001 Y184.617 E.01641
G1 X201.499 Y201.118 E.71753
G1 X201.499 Y200.585 E.01641
G1 X218.001 Y184.084 E.71753
G1 X218.001 Y183.55 E.01641
G1 X201.499 Y200.051 E.71753
G1 X201.499 Y199.518 E.01641
G1 X218.001 Y183.016 E.71753
G1 X218.001 Y182.483 E.01641
G1 X201.499 Y198.984 E.71753
G1 X201.499 Y198.45 E.01641
G1 X218.001 Y181.949 E.71753
G1 X218.001 Y181.416 E.01641
G1 X201.499 Y197.917 E.71753
G1 X201.499 Y197.383 E.01641
G1 X218.001 Y180.882 E.71753
G1 X218.001 Y180.348 E.01641
G1 X201.499 Y196.849 E.71753
G1 X201.499 Y196.316 E.01641
G1 X218.001 Y179.815 E.71753
G1 X218.001 Y179.281 E.01641
G1 X201.499 Y195.782 E.71753
G1 X201.499 Y195.249 E.01641
G1 X218.001 Y178.747 E.71753
G1 X218.001 Y178.214 E.01641
G1 X201.499 Y194.715 E.71753
G1 X201.499 Y194.181 E.01641
G1 X218.001 Y177.68 E.71753
G1 X218.001 Y177.147 E.01641
G1 X201.499 Y193.648 E.71753
G1 X201.499 Y193.114 E.01641
G1 X218.001 Y176.613 E.71753
G1 X218.001 Y176.079 E.01641
G1 X201.499 Y192.58 E.71753
G1 X201.499 Y192.047 E.01641
G1 X218.001 Y175.546 E.71753
G1 X218.001 Y175.012 E.01641
G1 X201.499 Y191.513 E.71753
G1 X201.499 Y190.98 E.01641
G1 X218.001 Y174.478 E.71753
G1 X218.001 Y173.945 E.01641
G1 X201.499 Y190.446 E.71753
G1 X201.499 Y189.912 E.01641
G1 X218.001 Y173.411 E.71753
G1 X218.001 Y172.878 E.01641
G1 X201.499 Y189.379 E.71753
G1 X201.499 Y188.845 E.01641
G1 X218.001 Y172.344 E.71753
G1 X218.001 Y171.81 E.01641
G1 X201.499 Y188.311 E.71753
G1 X201.499 Y187.778 E.01641
G1 X218.001 Y171.277 E.71753
G1 X218.001 Y170.743 E.01641
G1 X201.499 Y187.244 E.71753
G1 X201.499 Y186.711 E.01641
G1 X218.001 Y170.209 E.71753
G1 X218.001 Y169.676 E.01641
G1 X201.499 Y186.177 E.71753
G1 X201.499 Y185.643 E.01641
G1 X218.001 Y169.142 E.71753
G1 X218.001 Y168.609 E.01641
G1 X201.499 Y185.11 E.71753
G1 X201.499 Y184.576 E.01641
G1 X218.001 Y168.075 E.71753
G1 X218.001 Y167.541 E.01641
G1 X201.499 Y184.042 E.71753
G1 X201.499 Y183.509 E.01641
G1 X218.001 Y167.008 E.71753
G1 X218.001 Y166.474 E.01641
G1 X201.499 Y182.975 E.71753
G1 X201.499 Y182.442 E.01641
G1 X218.001 Y165.94 E.71753
G1 X218.001 Y165.407 E.01641
G1 X201.499 Y181.908 E.71753
G1 X201.499 Y181.374 E.01641
G1 X218.001 Y164.873 E.71753
G1 X218.001 Y164.34 E.01641
G1 X201.499 Y180.841 E.71753
G1 X201.499 Y180.307 E.01641
G1 X218.001 Y163.806 E.71753
G1 X218.001 Y163.272 E.01641
G1 X201.499 Y179.773 E.71753
G1 X201.499 Y179.24 E.01641
G1 X218.001 Y162.739 E.71753
G1 X218.001 Y162.205 E.01641
G1 X201.499 Y178.706 E.71753
G1 X201.499 Y178.173 E.01641
G1 X218.001 Y161.671 E.71753
G1 X218.001 Y161.138 E.01641
G1 X201.499 Y177.639 E.71753
G1 X201.499 Y177.105 E.01641
G1 X218.001 Y160.604 E.71753
G1 X218.001 Y160.071 E.01641
G1 X201.499 Y176.572 E.71753
G1 X201.499 Y176.038 E.01641
G1 X218.001 Y159.537 E.71753
G1 X218.001 Y159.003 E.01641
G1 X201.499 Y175.504 E.71753
G1 X201.499 Y174.971 E.01641
G1 X218.001 Y158.47 E.71753
G1 X218.001 Y157.936 E.01641
G1 X201.499 Y174.437 E.71753
G1 X201.499 Y173.904 E.01641
G1 X218.001 Y157.402 E.71753
G1 X218.001 Y156.869 E.01641
G1 X201.499 Y173.37 E.71753
G1 X201.499 Y172.836 E.01641
G1 X218.001 Y156.335 E.71753
G1 X218.001 Y155.802 E.01641
G1 X201.499 Y172.303 E.71753
G1 X201.499 Y171.769 E.01641
G1 X218.001 Y155.268 E.71753
G1 X218.001 Y154.734 E.01641
G1 X201.499 Y171.235 E.71753
G1 X201.499 Y170.702 E.01641
G1 X218.001 Y154.201 E.71753
G1 X218.001 Y153.667 E.01641
G1 X201.499 Y170.168 E.71753
G1 X201.499 Y169.635 E.01641
G1 X218.001 Y153.133 E.71753
G1 X218.001 Y152.6 E.01641
G1 X201.499 Y169.101 E.71753
G1 X201.499 Y168.567 E.01641
G1 X218.001 Y152.066 E.71753
G1 X218.001 Y151.533 E.01641
G1 X201.499 Y168.034 E.71753
G1 X201.499 Y167.5 E.01641
G1 X218.001 Y150.999 E.71753
G1 X218.001 Y150.465 E.01641
G1 X201.499 Y166.966 E.71753
G1 X201.499 Y166.433 E.01641
G1 X218.001 Y149.932 E.71753
G1 X218.001 Y149.398 E.01641
G1 X201.499 Y165.899 E.71753
G1 X201.499 Y165.366 E.01641
G1 X218.001 Y148.864 E.71753
G1 X218.001 Y148.331 E.01641
G1 X201.499 Y164.832 E.71753
G1 X201.499 Y164.298 E.01641
G1 X218.001 Y147.797 E.71753
G1 X218.001 Y147.264 E.01641
G1 X201.499 Y163.765 E.71753
G1 X201.499 Y163.231 E.01641
G1 X218.001 Y146.73 E.71753
G1 X218.001 Y146.196 E.01641
G1 X201.499 Y162.697 E.71753
G1 X201.499 Y162.164 E.01641
G1 X218.001 Y145.663 E.71753
G1 X218.001 Y145.129 E.01641
G1 X201.499 Y161.63 E.71753
G1 X201.499 Y161.097 E.01641
G1 X218.001 Y144.595 E.71753
G1 X218.001 Y144.062 E.01641
G1 X201.499 Y160.563 E.71753
G1 X201.499 Y160.029 E.01641
G1 X218.001 Y143.528 E.71753
G1 X218.001 Y142.995 E.01641
G1 X201.499 Y159.496 E.71753
G1 X201.499 Y158.962 E.01641
G1 X218.001 Y142.461 E.71753
G1 X218.001 Y141.927 E.01641
G1 X201.499 Y158.428 E.71753
G1 X201.499 Y157.895 E.01641
G1 X218.001 Y141.394 E.71753
G1 X218.001 Y140.86 E.01641
G1 X201.499 Y157.361 E.71753
G1 X201.499 Y156.828 E.01641
G1 X218.001 Y140.326 E.71753
G1 X218.001 Y139.793 E.01641
G1 X201.499 Y156.294 E.71753
G1 X201.499 Y155.76 E.01641
G1 X218.001 Y139.259 E.71753
G1 X218.001 Y138.726 E.01641
G1 X201.499 Y155.227 E.71753
G1 X201.499 Y154.693 E.01641
G1 X218.001 Y138.192 E.71753
G1 X218.001 Y137.658 E.01641
G1 X201.499 Y154.159 E.71753
G1 X201.499 Y153.626 E.01641
G1 X218.001 Y137.125 E.71753
G1 X218.001 Y136.591 E.01641
G1 X201.499 Y153.092 E.71753
G1 X201.499 Y152.559 E.01641
G1 X218.001 Y136.057 E.71753
G1 X218.001 Y135.524 E.01641
G1 X201.499 Y152.025 E.71753
G1 X201.499 Y151.491 E.01641
G1 X218.001 Y134.99 E.71753
G1 X218.001 Y134.457 E.01641
G1 X201.499 Y150.958 E.71753
G1 X201.499 Y150.424 E.01641
G1 X218.001 Y133.923 E.71753
G1 X218.001 Y133.389 E.01641
G1 X201.499 Y149.89 E.71753
G1 X201.499 Y149.357 E.01641
G1 X218.001 Y132.856 E.71753
G1 X218.001 Y132.322 E.01641
G1 X201.499 Y148.823 E.71753
G1 X201.499 Y148.29 E.01641
G1 X218.001 Y131.788 E.71753
G1 X218.001 Y131.255 E.01641
G1 X201.499 Y147.756 E.71753
G1 X201.499 Y147.222 E.01641
G1 X218.001 Y130.721 E.71753
G1 X218.001 Y130.188 E.01641
G1 X201.499 Y146.689 E.71753
G1 X201.499 Y146.155 E.01641
G1 X218.001 Y129.654 E.71753
G1 X218.001 Y129.12 E.01641
G1 X201.499 Y145.621 E.71753
G1 X201.499 Y145.088 E.01641
G1 X218.001 Y128.587 E.71753
G1 X218.001 Y128.053 E.01641
G1 X201.499 Y144.554 E.71753
G1 X201.499 Y144.021 E.01641
G1 X218.001 Y127.519 E.71753
G1 X218.001 Y126.986 E.01641
G1 X201.499 Y143.487 E.71753
G1 X201.499 Y142.953 E.01641
G1 X218.001 Y126.452 E.71753
G1 X218.001 Y125.919 E.01641
G1 X201.499 Y142.42 E.71753
G1 X201.499 Y141.886 E.01641
G1 X218.001 Y125.385 E.71753
G1 X218.001 Y124.851 E.01641
G1 X201.499 Y141.352 E.71753
G1 X201.499 Y140.819 E.01641
G1 X218.001 Y124.318 E.71753
G1 X218.001 Y123.784 E.01641
G1 X201.499 Y140.285 E.71753
G1 X201.499 Y139.752 E.01641
G1 X218.001 Y123.25 E.71753
G1 X218.001 Y122.717 E.01641
G1 X201.499 Y139.218 E.71753
G1 X201.499 Y138.684 E.01641
G1 X210.792 Y129.392 E.40406
G3 X210.122 Y129.528 I-1.088 J-3.634 E.02105
G1 X201.499 Y138.151 E.37493
G1 X201.499 Y137.617 E.01641
G1 X209.573 Y129.544 E.35105
G3 X209.096 Y129.487 I.048 J-2.41 E.01478
G1 X201.499 Y137.083 E.33033
G1 X201.499 Y136.55 E.01641
G1 X208.669 Y129.381 E.31174
G3 X208.282 Y129.234 I2.547 J-7.278 E.01272
G1 X201.499 Y136.016 E.29493
G1 X201.499 Y135.483 E.01641
G1 X207.933 Y129.049 E.27975
G3 X207.614 Y128.834 I.915 J-1.698 E.01184
G1 X201.499 Y134.949 E.2659
G1 X201.499 Y134.415 E.01641
G1 X207.325 Y128.59 E.25331
G3 X207.064 Y128.317 I1.233 J-1.443 E.01162
G1 X201.499 Y133.882 E.24196
G1 X201.499 Y133.348 E.01641
G1 X206.831 Y128.016 E.23185
G3 X206.629 Y127.685 I1.553 J-1.179 E.01195
G1 X201.499 Y132.814 E.22303
G1 X201.499 Y132.281 E.01641
G1 X206.458 Y127.322 E.21561
G3 X206.323 Y126.924 I1.921 J-.873 E.01296
G1 X201.499 Y131.747 E.20974
G1 X201.499 Y131.214 E.01641
G1 X206.233 Y126.48 E.20583
G3 X206.203 Y125.977 I2.501 J-.403 E.01553
G1 X201.499 Y130.68 E.20452
G1 X201.499 Y130.146 E.01641
G1 X206.254 Y125.392 E.20674
G3 X206.475 Y124.637 I3.586 J.641 E.02423
G1 X201.499 Y129.613 E.21635
G1 X201.499 Y129.079 E.01641
G1 X218.001 Y112.578 E.71753
G1 X218.001 Y113.112 E.01641
G1 X208.388 Y122.724 E.41797
G3 X209.139 Y122.507 I1.35 J3.262 E.02408
G1 X218.001 Y113.645 E.38532
G1 X218.001 Y114.179 E.01641
G1 X209.728 Y122.451 E.35971
G3 X210.228 Y122.485 I.081 J2.517 E.01543
G1 X218.001 Y114.712 E.33798
G1 X218.001 Y115.246 E.01641
G1 X210.674 Y122.572 E.31858
G3 X211.074 Y122.706 I-1.886 J6.319 E.01297
G1 X218.001 Y115.78 E.30118
G1 X218.001 Y116.313 E.01641
G1 X211.436 Y122.878 E.28544
G3 X211.767 Y123.081 I-.85 J1.75 E.01195
G1 X218.001 Y116.847 E.27108
G1 X218.001 Y117.381 E.01641
G1 X212.067 Y123.314 E.258
G3 X212.339 Y123.575 I-1.171 J1.491 E.01162
G1 X218.001 Y117.914 E.24617
G1 X218.001 Y118.448 E.01641
G1 X212.583 Y123.865 E.23557
G3 X212.798 Y124.184 I-1.488 J1.232 E.01184
G1 X218.001 Y118.981 E.22624
G1 X218.001 Y119.515 E.01641
G1 X212.981 Y124.534 E.21826
G3 X213.131 Y124.918 I-1.842 J.94 E.01269
G1 X218.001 Y120.049 E.21174
G1 X218.001 Y120.582 E.01641
G1 X213.238 Y125.344 E.20707
G3 X213.293 Y125.824 I-2.372 J.512 E.01486
G1 X218.001 Y121.116 E.20471
G1 X218.001 Y121.65 E.01641
G1 X213.282 Y126.368 E.20519
G3 X213.146 Y127.037 I-3.407 J-.342 E.02103
G1 X218.17 Y122.014 E.21846
; WIPE_START
G1 X216.756 Y123.428 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X209.536 Y125.902 Z.8 F30000
G1 X201.33 Y128.715 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X218.001 Y112.044 E.72491
G1 X218.001 Y111.511 E.01641
G1 X201.499 Y128.012 E.71753
G1 X201.499 Y127.478 E.01641
G1 X218.001 Y110.977 E.71753
G1 X218.001 Y110.443 E.01641
G1 X201.499 Y126.945 E.71753
G1 X201.499 Y126.411 E.01641
G1 X218.001 Y109.91 E.71753
G1 X218.001 Y109.376 E.01641
G1 X201.499 Y125.877 E.71753
G1 X201.499 Y125.344 E.01641
G1 X218.001 Y108.843 E.71753
G1 X218.001 Y108.309 E.01641
G1 X201.499 Y124.81 E.71753
G1 X201.499 Y124.276 E.01641
G1 X218.001 Y107.775 E.71753
G1 X218.001 Y107.242 E.01641
G1 X201.499 Y123.743 E.71753
G1 X201.499 Y123.209 E.01641
G1 X218.001 Y106.708 E.71753
G1 X218.001 Y106.174 E.01641
G1 X201.499 Y122.676 E.71753
G1 X201.499 Y122.142 E.01641
G1 X218.001 Y105.641 E.71753
G1 X218.001 Y105.107 E.01641
G1 X201.499 Y121.608 E.71753
G1 X201.499 Y121.075 E.01641
G1 X218.001 Y104.574 E.71753
G1 X218.001 Y104.04 E.01641
G1 X201.499 Y120.541 E.71753
G1 X201.499 Y120.007 E.01641
G1 X218.001 Y103.506 E.71753
G1 X218.001 Y102.973 E.01641
G1 X201.499 Y119.474 E.71753
G1 X201.499 Y118.94 E.01641
G1 X218.001 Y102.439 E.71753
G1 X218.001 Y101.905 E.01641
G1 X201.499 Y118.407 E.71753
G1 X201.499 Y117.873 E.01641
G1 X218.001 Y101.372 E.71753
G1 X218.001 Y100.838 E.01641
G1 X201.499 Y117.339 E.71753
G1 X201.499 Y116.806 E.01641
G1 X218.001 Y100.305 E.71753
G1 X218.001 Y99.771 E.01641
G1 X201.499 Y116.272 E.71753
G1 X201.499 Y115.738 E.01641
G1 X218.001 Y99.237 E.71753
G1 X218.001 Y98.704 E.01641
G1 X201.499 Y115.205 E.71753
G1 X201.499 Y114.671 E.01641
G1 X218.001 Y98.17 E.71753
G1 X218.001 Y97.636 E.01641
G1 X201.499 Y114.138 E.71753
G1 X201.499 Y113.604 E.01641
G1 X218.001 Y97.103 E.71753
G1 X218.001 Y96.569 E.01641
G1 X201.499 Y113.07 E.71753
G1 X201.499 Y112.537 E.01641
G1 X218.001 Y96.036 E.71753
G1 X218.001 Y95.502 E.01641
G1 X201.499 Y112.003 E.71753
G1 X201.499 Y111.469 E.01641
G1 X218.001 Y94.968 E.71753
G1 X218.001 Y94.435 E.01641
G1 X201.499 Y110.936 E.71753
G1 X201.499 Y110.402 E.01641
G1 X218.001 Y93.901 E.71753
G1 X218.001 Y93.367 E.01641
G1 X201.499 Y109.869 E.71753
G1 X201.499 Y109.335 E.01641
G1 X218.001 Y92.834 E.71753
G1 X218.001 Y92.3 E.01641
G1 X201.499 Y108.801 E.71753
G1 X201.499 Y108.268 E.01641
G1 X218.001 Y91.767 E.71753
G1 X218.001 Y91.233 E.01641
G1 X201.499 Y107.734 E.71753
G1 X201.499 Y107.2 E.01641
G1 X218.001 Y90.699 E.71753
G1 X218.001 Y90.166 E.01641
G1 X201.499 Y106.667 E.71753
G1 X201.499 Y106.133 E.01641
G1 X218.001 Y89.632 E.71753
G1 X218.001 Y89.098 E.01641
G1 X201.499 Y105.6 E.71753
G1 X201.499 Y105.066 E.01641
G1 X218.001 Y88.565 E.71753
G1 X218.001 Y88.031 E.01641
G1 X201.499 Y104.532 E.71753
G1 X201.499 Y103.999 E.01641
G1 X218.001 Y87.498 E.71753
G1 X218.001 Y86.964 E.01641
G1 X201.499 Y103.465 E.71753
G1 X201.499 Y102.931 E.01641
G1 X218.001 Y86.43 E.71753
G1 X218.001 Y85.897 E.01641
G1 X201.499 Y102.398 E.71753
G1 X201.499 Y101.864 E.01641
G1 X218.001 Y85.363 E.71753
G1 X218.001 Y84.829 E.01641
G1 X201.499 Y101.331 E.71753
G1 X201.499 Y100.797 E.01641
G1 X218.001 Y84.296 E.71753
G1 X218.001 Y83.762 E.01641
G1 X201.499 Y100.263 E.71753
G1 X201.499 Y99.73 E.01641
G1 X218.001 Y83.229 E.71753
M73 P38 R36
G1 X218.001 Y82.695 E.01641
G1 X201.499 Y99.196 E.71753
G1 X201.499 Y98.662 E.01641
G1 X218.001 Y82.161 E.71753
G1 X218.001 Y81.628 E.01641
G1 X201.499 Y98.129 E.71753
G1 X201.499 Y97.595 E.01641
G1 X218.001 Y81.094 E.71753
G1 X218.001 Y80.56 E.01641
G1 X201.499 Y97.062 E.71753
G1 X201.499 Y96.528 E.01641
G1 X218.001 Y80.027 E.71753
G1 X218.001 Y79.493 E.01641
G1 X201.499 Y95.994 E.71753
G1 X201.499 Y95.461 E.01641
G1 X218.001 Y78.96 E.71753
G1 X218.001 Y78.426 E.01641
G1 X201.499 Y94.927 E.71753
G1 X201.499 Y94.393 E.01641
G1 X218.001 Y77.892 E.71753
G1 X218.001 Y77.359 E.01641
G1 X201.499 Y93.86 E.71753
G1 X201.499 Y93.326 E.01641
G1 X218.001 Y76.825 E.71753
G1 X218.001 Y76.291 E.01641
G1 X201.499 Y92.793 E.71753
G1 X201.499 Y92.259 E.01641
G1 X218.001 Y75.758 E.71753
G1 X218.001 Y75.224 E.01641
G1 X201.499 Y91.725 E.71753
G1 X201.499 Y91.192 E.01641
G1 X218.001 Y74.691 E.71753
G1 X218.001 Y74.157 E.01641
G1 X201.499 Y90.658 E.71753
G1 X201.499 Y90.124 E.01641
G1 X218.001 Y73.623 E.71753
G1 X218.001 Y73.09 E.01641
G1 X201.499 Y89.591 E.71753
G1 X201.499 Y89.057 E.01641
G1 X218.001 Y72.556 E.71753
G1 X218.001 Y72.022 E.01641
G1 X201.499 Y88.524 E.71753
G1 X201.499 Y87.99 E.01641
G1 X218.001 Y71.489 E.71753
G1 X218.001 Y70.955 E.01641
G1 X201.499 Y87.456 E.71753
G1 X201.499 Y86.923 E.01641
G1 X218.001 Y70.422 E.71753
G1 X218.001 Y69.888 E.01641
G1 X201.499 Y86.389 E.71753
G1 X201.499 Y85.855 E.01641
G1 X218.001 Y69.354 E.71753
G1 X218.001 Y68.821 E.01641
G1 X201.499 Y85.322 E.71753
G1 X201.499 Y84.788 E.01641
G1 X218.001 Y68.287 E.71753
G1 X218.001 Y67.753 E.01641
G1 X201.499 Y84.255 E.71753
G1 X201.499 Y83.721 E.01641
G1 X218.001 Y67.22 E.71753
G1 X218.001 Y66.686 E.01641
M73 P38 R35
G1 X201.499 Y83.187 E.71753
G1 X201.499 Y82.654 E.01641
G1 X218.001 Y66.153 E.71753
G1 X218.001 Y65.619 E.01641
G1 X201.499 Y82.12 E.71753
G1 X201.499 Y81.586 E.01641
G1 X218.001 Y65.085 E.71753
G1 X218.001 Y64.552 E.01641
G1 X201.499 Y81.053 E.71753
G1 X201.499 Y80.519 E.01641
G1 X218.001 Y64.018 E.71753
G1 X218.001 Y63.484 E.01641
G1 X201.499 Y79.986 E.71753
G1 X201.499 Y79.452 E.01641
G1 X218.001 Y62.951 E.71753
G1 X218.001 Y62.417 E.01641
G1 X201.499 Y78.918 E.71753
G1 X201.499 Y78.385 E.01641
G1 X218.001 Y61.884 E.71753
G1 X218.001 Y61.35 E.01641
G1 X201.499 Y77.851 E.71753
G1 X201.499 Y77.317 E.01641
G1 X218.001 Y60.816 E.71753
G1 X218.001 Y60.283 E.01641
G1 X201.499 Y76.784 E.71753
G1 X201.499 Y76.25 E.01641
G1 X218.001 Y59.749 E.71753
G1 X218.001 Y59.215 E.01641
G1 X201.499 Y75.716 E.71753
G1 X201.499 Y75.183 E.01641
G1 X218.001 Y58.682 E.71753
G1 X218.001 Y58.148 E.01641
G1 X201.499 Y74.649 E.71753
G1 X201.499 Y74.116 E.01641
G1 X218.001 Y57.615 E.71753
G1 X218.001 Y57.081 E.01641
G1 X201.499 Y73.582 E.71753
G1 X201.499 Y73.048 E.01641
G1 X218.001 Y56.547 E.71753
G1 X218.001 Y56.014 E.01641
G1 X201.499 Y72.515 E.71753
G1 X201.499 Y71.981 E.01641
G1 X218.001 Y55.48 E.71753
G1 X218.001 Y54.946 E.01641
G1 X201.499 Y71.447 E.71753
G1 X201.499 Y70.914 E.01641
G1 X218.001 Y54.413 E.71753
G1 X218.001 Y53.879 E.01641
G1 X201.499 Y70.38 E.71753
G1 X201.499 Y69.847 E.01641
G1 X218.001 Y53.346 E.71753
G1 X218.001 Y52.812 E.01641
G1 X201.499 Y69.313 E.71753
G1 X201.499 Y68.779 E.01641
G1 X218.001 Y52.278 E.71753
G1 X218.001 Y51.745 E.01641
G1 X201.499 Y68.246 E.71753
G1 X201.499 Y67.712 E.01641
G1 X218.001 Y51.211 E.71753
G1 X218.001 Y50.677 E.01641
G1 X201.499 Y67.179 E.71753
G1 X201.499 Y66.645 E.01641
G1 X218.001 Y50.144 E.71753
G1 X218.001 Y49.61 E.01641
G1 X201.499 Y66.111 E.71753
G1 X201.499 Y65.578 E.01641
G1 X218.001 Y49.077 E.71753
G1 X218.001 Y48.543 E.01641
G1 X201.499 Y65.044 E.71753
G1 X201.499 Y64.51 E.01641
G1 X218.001 Y48.009 E.71753
G1 X218.001 Y47.476 E.01641
G1 X201.499 Y63.977 E.71753
G1 X201.499 Y63.443 E.01641
G1 X218.001 Y46.942 E.71753
G1 X218.001 Y46.408 E.01641
G1 X201.499 Y62.91 E.71753
G1 X201.499 Y62.376 E.01641
G1 X218.001 Y45.875 E.71753
G1 X218.001 Y45.341 E.01641
G1 X201.499 Y61.842 E.71753
G1 X201.499 Y61.309 E.01641
G1 X218.001 Y44.808 E.71753
G1 X218.001 Y44.274 E.01641
G1 X201.499 Y60.775 E.71753
G1 X201.499 Y60.241 E.01641
G1 X218.001 Y43.74 E.71753
G1 X218.001 Y43.207 E.01641
G1 X201.499 Y59.708 E.71753
G1 X201.499 Y59.174 E.01641
G1 X218.001 Y42.673 E.71753
G1 X218.001 Y42.139 E.01641
G1 X201.499 Y58.64 E.71753
G1 X201.499 Y58.107 E.01641
G1 X218.001 Y41.606 E.71753
G1 X218.001 Y41.072 E.01641
G1 X201.499 Y57.573 E.71753
G1 X201.499 Y57.04 E.01641
G1 X218.001 Y40.539 E.71753
G1 X218.001 Y40.005 E.01641
G1 X201.499 Y56.506 E.71753
G1 X201.499 Y55.972 E.01641
G1 X218.001 Y39.471 E.71753
G1 X218.001 Y38.938 E.01641
G1 X201.499 Y55.439 E.71753
G1 X201.499 Y54.905 E.01641
G1 X210.936 Y45.469 E.41033
G3 X210.231 Y45.64 I-1.201 J-3.41 E.02233
G1 X201.499 Y54.371 E.37969
G1 X201.499 Y53.838 E.01641
G1 X209.662 Y45.676 E.35493
G3 X209.178 Y45.626 I.005 J-2.441 E.01498
G1 X201.499 Y53.304 E.33388
G1 X201.499 Y52.771 E.01641
G1 X208.743 Y45.527 E.31499
G3 X208.35 Y45.386 I.504 J-2.03 E.01286
G1 X201.499 Y52.237 E.2979
G1 X201.499 Y51.703 E.01641
G1 X207.993 Y45.21 E.28234
G3 X207.668 Y45.001 I6.177 J-9.97 E.01187
G1 X201.499 Y51.17 E.26822
G1 X201.499 Y50.636 E.01641
G1 X207.373 Y44.762 E.25542
G3 X207.108 Y44.494 I1.203 J-1.46 E.01162
G1 X201.226 Y50.376 E.25573
G1 X200.693 Y50.376 E.01641
G1 X206.87 Y44.198 E.26862
G3 X206.662 Y43.872 I1.523 J-1.2 E.0119
G1 X200.159 Y50.376 E.28278
G1 X199.626 Y50.376 E.01641
G1 X206.486 Y43.515 E.29833
G3 X206.345 Y43.122 I1.891 J-.9 E.01285
G1 X199.092 Y50.376 E.31541
G1 X198.558 Y50.376 E.01641
G1 X206.245 Y42.689 E.33425
G3 X206.203 Y42.197 I4.555 J-.639 E.01517
G1 X198.025 Y50.376 E.35561
G1 X197.491 Y50.376 E.01641
G1 X206.234 Y41.632 E.38019
G3 X206.408 Y40.925 I4.357 J.695 E.02242
G1 X196.957 Y50.376 E.41095
G1 X196.424 Y50.376 E.01641
G1 X212.925 Y33.874 E.71753
G1 X213.459 Y33.874 E.01641
G1 X208.546 Y38.787 E.21361
G3 X209.254 Y38.612 I1.25 J3.549 E.02246
G1 X213.992 Y33.874 E.20602
G1 X214.526 Y33.874 E.01641
G1 X209.822 Y38.578 E.20455
G3 X210.313 Y38.621 I.035 J2.478 E.01519
G1 X215.059 Y33.874 E.20638
G1 X215.593 Y33.874 E.01641
G1 X210.749 Y38.719 E.21064
G3 X211.14 Y38.861 I-.515 J2.028 E.01283
G1 X216.127 Y33.874 E.21682
G1 X216.66 Y33.874 E.01641
G1 X211.497 Y39.038 E.22452
G3 X211.822 Y39.246 I-.877 J1.727 E.0119
G1 X217.194 Y33.874 E.23358
G1 X217.728 Y33.874 E.01641
G1 X212.118 Y39.484 E.24392
G3 X212.385 Y39.75 I-1.197 J1.469 E.01162
G1 X218.001 Y34.135 E.24417
G1 X218.001 Y34.669 E.01641
G1 X212.624 Y40.045 E.23378
G3 X212.834 Y40.369 I-1.515 J1.21 E.01189
G1 X218.001 Y35.202 E.22466
G1 X218.001 Y35.736 E.01641
G1 X213.012 Y40.724 E.2169
G3 X213.154 Y41.116 I-6.466 J2.547 E.01283
G1 X218.001 Y36.27 E.21076
G1 X218.001 Y36.803 E.01641
G1 X213.251 Y41.553 E.20653
G3 X213.297 Y42.04 I-2.414 J.476 E.01507
G1 X218.001 Y37.337 E.20451
G1 X218.001 Y37.87 E.01641
G1 X213.265 Y42.606 E.20593
G3 X213.093 Y43.312 I-3.549 J-.491 E.02236
G1 X218.17 Y38.234 E.22078
G1 X38.599 Y33.705 F30000
G1 F15000
G1 X37.999 Y34.304 E.02607
G1 X37.999 Y34.838 E.01641
G1 X38.963 Y33.874 E.0419
G1 X39.497 Y33.874 E.01641
G1 X37.999 Y35.372 E.0651
G1 X37.999 Y35.905 E.01641
G1 X40.03 Y33.874 E.08831
G1 X40.564 Y33.874 E.01641
G1 X37.999 Y36.439 E.11151
G1 X37.999 Y36.973 E.01641
G1 X41.098 Y33.874 E.13472
G1 X41.631 Y33.874 E.01641
G1 X37.999 Y37.506 E.15792
G1 X37.999 Y38.04 E.01641
G1 X42.165 Y33.874 E.18112
G1 X42.698 Y33.874 E.01641
G1 X37.999 Y38.573 E.20433
G1 X37.999 Y39.107 E.01641
G1 X43.232 Y33.874 E.22753
G1 X43.766 Y33.874 E.01641
G1 X37.999 Y39.641 E.25074
G1 X37.999 Y40.174 E.01641
G1 X44.299 Y33.874 E.27394
G1 X44.833 Y33.874 E.01641
G1 X37.999 Y40.708 E.29714
G1 X37.999 Y41.242 E.01641
G1 X45.367 Y33.874 E.32035
G1 X45.9 Y33.874 E.01641
G1 X37.999 Y41.775 E.34355
G1 X37.999 Y42.309 E.01641
G1 X46.434 Y33.874 E.36676
G1 X46.967 Y33.874 E.01641
G1 X37.999 Y42.842 E.38996
G1 X37.999 Y43.376 E.01641
G1 X47.501 Y33.874 E.41316
G1 X48.035 Y33.874 E.01641
G1 X37.999 Y43.91 E.43637
G1 X37.999 Y44.443 E.01641
G1 X48.568 Y33.874 E.45957
G1 X49.102 Y33.874 E.01641
G1 X37.83 Y45.147 E.49015
G1 X37.83 Y55.285 F30000
G1 F15000
G1 X47.796 Y45.319 E.43339
G3 X46.986 Y45.595 I-1.582 J-3.308 E.02638
G1 X37.999 Y54.582 E.39078
G1 X37.999 Y54.049 E.01641
G1 X46.378 Y45.67 E.36432
G3 X45.861 Y45.653 I-.173 J-2.592 E.01592
G1 X37.999 Y53.515 E.34186
G1 X37.999 Y52.981 E.01641
G1 X45.408 Y45.573 E.32214
G3 X45.001 Y45.446 I.433 J-2.094 E.01311
G1 X37.999 Y52.448 E.30447
G1 X37.999 Y51.914 E.01641
G1 X44.632 Y45.282 E.2884
G3 X44.295 Y45.085 I.813 J-1.78 E.01202
G1 X37.999 Y51.38 E.27375
G1 X37.999 Y50.847 E.01641
G1 X43.988 Y44.858 E.26041
G3 X43.71 Y44.603 I1.136 J-1.515 E.01163
G1 X37.999 Y50.313 E.24831
G1 X37.999 Y49.78 E.01641
G1 X43.46 Y44.319 E.23745
G3 X43.239 Y44.006 I1.454 J-1.262 E.01179
G1 X37.999 Y49.246 E.22785
G1 X37.999 Y48.712 E.01641
G1 X43.049 Y43.663 E.21957
G3 X42.895 Y43.283 I1.818 J-.957 E.01262
G1 X37.999 Y48.179 E.21288
G1 X37.999 Y47.645 E.01641
G1 X42.78 Y42.864 E.20789
G3 X42.712 Y42.398 I2.292 J-.573 E.01449
G1 X37.999 Y47.111 E.20494
G1 X37.999 Y46.578 E.01641
G1 X42.711 Y41.866 E.20487
G3 X42.814 Y41.23 I4.574 J.414 E.01985
G1 X37.999 Y46.044 E.20936
G1 X37.999 Y45.511 E.01641
G1 X49.636 Y33.874 E.50598
G1 X50.169 Y33.874 E.01641
G1 X45.35 Y38.693 E.20953
G3 X45.99 Y38.587 I.946 J3.73 E.01995
G1 X50.703 Y33.874 E.20493
G1 X51.236 Y33.874 E.01641
G1 X46.526 Y38.585 E.20482
G3 X46.989 Y38.655 I-.122 J2.35 E.01442
G1 X51.77 Y33.874 E.20789
G1 X52.304 Y33.874 E.01641
G1 X47.407 Y38.772 E.21294
G3 X47.786 Y38.926 I-.583 J1.969 E.01261
G1 X52.837 Y33.874 E.21967
G1 X53.371 Y33.874 E.01641
G1 X48.131 Y39.115 E.22787
G3 X48.445 Y39.334 I-.939 J1.68 E.0118
G1 X53.905 Y33.874 E.23741
G1 X54.438 Y33.874 E.01641
G1 X48.73 Y39.583 E.24821
G3 X48.985 Y39.861 I-1.259 J1.41 E.01163
G1 X54.972 Y33.874 E.26032
G1 X55.505 Y33.874 E.01641
G1 X49.211 Y40.168 E.27368
G3 X49.407 Y40.506 I-1.59 J1.149 E.01202
G1 X56.039 Y33.874 E.28837
G1 X56.573 Y33.874 E.01641
G1 X49.571 Y40.877 E.30448
G3 X49.696 Y41.284 I-1.978 J.834 E.01314
G1 X57.106 Y33.874 E.32221
G1 X57.64 Y33.874 E.01641
G1 X49.779 Y41.736 E.34184
G3 X49.795 Y42.253 I-4.385 J.4 E.01591
G1 X58.174 Y33.874 E.36432
G1 X58.707 Y33.874 E.01641
G1 X49.724 Y42.858 E.39063
G3 X49.441 Y43.674 I-3.65 J-.807 E.02662
G1 X59.241 Y33.874 E.42613
G1 X59.774 Y33.874 E.01641
G1 X37.999 Y55.649 E.94686
G1 X37.999 Y56.183 E.01641
G1 X60.308 Y33.874 E.97006
G1 X60.842 Y33.874 E.01641
G1 X37.999 Y56.717 E.99326
G1 X37.999 Y57.25 E.01641
G1 X61.375 Y33.874 E1.01647
G1 X61.909 Y33.874 E.01641
G1 X37.999 Y57.784 E1.03967
G1 X37.999 Y58.318 E.01641
G1 X62.443 Y33.874 E1.06288
G1 X62.976 Y33.874 E.01641
G1 X37.999 Y58.851 E1.08608
G1 X37.999 Y59.385 E.01641
G1 X63.51 Y33.874 E1.10928
G1 X64.043 Y33.874 E.01641
G1 X37.999 Y59.918 E1.13249
G1 X37.999 Y60.452 E.01641
G1 X64.577 Y33.874 E1.15569
G1 X65.111 Y33.874 E.01641
G1 X37.999 Y60.986 E1.1789
G1 X37.999 Y61.519 E.01641
G1 X65.644 Y33.874 E1.2021
G1 X66.178 Y33.874 E.01641
G1 X37.999 Y62.053 E1.2253
G1 X37.999 Y62.587 E.01641
G1 X66.712 Y33.874 E1.24851
G1 X67.245 Y33.874 E.01641
G1 X37.999 Y63.12 E1.27171
G1 X37.999 Y63.654 E.01641
G1 X67.779 Y33.874 E1.29492
G1 X68.312 Y33.874 E.01641
G1 X37.999 Y64.187 E1.31812
G1 X37.999 Y64.721 E.01641
G1 X68.846 Y33.874 E1.34132
G1 X69.38 Y33.874 E.01641
G1 X37.999 Y65.255 E1.36453
G1 X37.999 Y65.788 E.01641
G1 X69.913 Y33.874 E1.38773
G1 X70.447 Y33.874 E.01641
G1 X37.83 Y66.492 E1.41831
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X39.244 Y65.077 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/15
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
G17
G3 Z.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 15
G1 X125.682 Y212.104
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X125.647 Y212.058 E.0019
G3 X127.7 Y206.674 I2.362 J-2.182 E.23687
G3 X128.872 Y206.777 I.315 J3.132 E.03924
G3 X125.876 Y212.282 I-.862 J3.098 E.38355
G1 X125.726 Y212.144 E.00675
G1 X125.967 Y211.813 F30000
G1 F16213.044
G1 X125.945 Y211.782 E.00126
G3 X127.731 Y207.08 I2.063 J-1.906 E.20665
G3 X128.761 Y207.17 I.282 J2.739 E.03452
G3 X126.145 Y211.977 I-.753 J2.706 E.33496
G1 X126.011 Y211.854 E.00604
G1 X126.248 Y211.502 F30000
G1 F16213.044
G1 X126.092 Y211.321 E.00794
G3 X127.761 Y207.486 I1.917 J-1.446 E.16837
G3 X128.417 Y207.509 I.24 J2.594 E.02184
G3 X126.415 Y211.671 I-.409 J2.366 E.29436
G1 X126.29 Y211.545 E.00589
G1 X126.548 Y211.261 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X126.532 Y211.237 E.0009
G3 X127.79 Y207.877 I1.477 J-1.362 E.13624
G3 X128.15 Y207.87 I.215 J1.793 E.01108
G3 X126.831 Y211.502 I-.141 J2.004 E.2283
G1 X126.594 Y211.3 E.00955
; WIPE_START
M204 S10000
G1 X126.532 Y211.237 E-.03356
G1 X126.398 Y211.089 E-.07606
G1 X126.189 Y210.747 E-.15211
G1 X126.052 Y210.371 E-.15212
G1 X125.992 Y209.975 E-.15214
G1 X126.012 Y209.575 E-.15212
G1 X126.039 Y209.469 E-.04189
; WIPE_END
G1 E-.04 F1800
G1 X133.669 Y209.242 Z1 F30000
G1 X208.259 Y207.028 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X208.429 Y206.948 E.00625
G3 X209.45 Y206.674 I1.33 J2.928 E.03521
G3 X210.622 Y206.777 I.315 J3.134 E.03924
G3 X208.145 Y207.094 I-.862 J3.098 E.58519
G1 X208.207 Y207.058 E.0024
G1 X208.745 Y207.254 F30000
G1 F16213.044
G1 X208.856 Y207.215 E.00391
G3 X209.481 Y207.08 I.901 J2.66 E.02123
G3 X210.511 Y207.17 I.282 J2.74 E.03452
G3 X208.596 Y207.318 I-.753 J2.706 E.52038
G1 X208.69 Y207.278 E.00338
G1 X209.172 Y207.547 F30000
G1 F16213.044
G1 X209.216 Y207.536 E.00149
G3 X209.511 Y207.486 I.542 J2.339 E.00993
G3 X210.167 Y207.509 I.24 J2.593 E.02184
G3 X208.764 Y207.689 I-.409 J2.366 E.45277
G1 X209.116 Y207.567 E.01236
G1 X209.53 Y207.879 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.54 Y207.877 E.00031
G3 X209.9 Y207.87 I.215 J1.793 E.01108
G3 X209.303 Y207.918 I-.141 J2.004 E.36943
G1 X209.471 Y207.889 E.00523
; WIPE_START
M204 S10000
G1 X209.54 Y207.877 E-.02669
G1 X209.9 Y207.87 E-.13677
G1 X210.294 Y207.94 E-.15216
G1 X210.667 Y208.086 E-.15208
G1 X211.003 Y208.303 E-.15217
G1 X211.154 Y208.436 E-.07613
G1 X211.262 Y208.565 E-.064
; WIPE_END
G1 E-.04 F1800
G1 X210.994 Y200.937 Z1 F30000
G1 X208.259 Y123.153 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X208.429 Y123.073 E.00625
G3 X209.45 Y122.799 I1.33 J2.928 E.03522
G3 X210.621 Y122.902 I.315 J3.134 E.03923
G3 X208.145 Y123.219 I-.862 J3.098 E.5852
G1 X208.207 Y123.183 E.00239
G1 X208.745 Y123.379 F30000
G1 F16213.044
G1 X208.856 Y123.34 E.00391
G3 X209.481 Y123.205 I.901 J2.66 E.02123
G3 X210.511 Y123.295 I.282 J2.74 E.03452
G3 X208.596 Y123.443 I-.753 J2.706 E.52038
G1 X208.69 Y123.403 E.00337
G1 X209.172 Y123.672 F30000
G1 F16213.044
G1 X209.216 Y123.661 E.0015
G3 X209.511 Y123.611 I.542 J2.339 E.00992
G3 X210.167 Y123.634 I.24 J2.594 E.02184
G3 X208.764 Y123.814 I-.409 J2.366 E.45277
G1 X209.116 Y123.692 E.01236
G1 X209.536 Y124.003 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.54 Y124.002 E.00013
G3 X209.9 Y123.995 I.215 J1.794 E.01108
G3 X209.303 Y124.043 I-.141 J2.004 E.36943
G1 X209.477 Y124.013 E.00541
; WIPE_START
M204 S10000
G1 X209.54 Y124.002 E-.02443
G1 X209.9 Y123.995 E-.13676
G1 X210.294 Y124.065 E-.15212
G1 X210.667 Y124.211 E-.15212
G1 X211.003 Y124.428 E-.15214
G1 X211.272 Y124.69 E-.14242
; WIPE_END
G1 E-.04 F1800
G1 X211.003 Y117.062 Z1 F30000
G1 X208.258 Y39.278 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X208.429 Y39.198 E.00626
G3 X209.45 Y38.924 I1.33 J2.928 E.03521
G3 X210.621 Y39.027 I.315 J3.134 E.03924
G3 X208.145 Y39.344 I-.862 J3.098 E.5852
G1 X208.207 Y39.308 E.00238
G1 X208.745 Y39.504 F30000
G1 F16213.044
G1 X208.856 Y39.465 E.00392
G3 X209.48 Y39.33 I.902 J2.66 E.02123
G3 X210.511 Y39.42 I.282 J2.741 E.03452
G3 X208.596 Y39.568 I-.753 J2.706 E.52038
G1 X208.69 Y39.528 E.00337
G1 X209.172 Y39.797 F30000
G1 F16213.044
G1 X209.216 Y39.786 E.00151
G3 X209.511 Y39.736 I.542 J2.339 E.00992
G3 X210.167 Y39.759 I.24 J2.593 E.02184
G3 X208.764 Y39.939 I-.409 J2.366 E.45277
G1 X209.115 Y39.817 E.01235
G1 X209.536 Y40.128 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.54 Y40.127 E.00013
G3 X209.9 Y40.12 I.215 J1.793 E.01108
G3 X209.303 Y40.168 I-.141 J2.004 E.36943
G1 X209.477 Y40.138 E.00542
; WIPE_START
M204 S10000
G1 X209.54 Y40.127 E-.02438
G1 X209.54 Y40.127 E0
G1 X209.9 Y40.12 E-.13678
G1 X210.294 Y40.19 E-.15212
G1 X210.667 Y40.336 E-.15211
G1 X211.003 Y40.553 E-.15215
G1 X211.272 Y40.815 E-.14245
; WIPE_END
G1 E-.04 F1800
G1 X203.641 Y40.677 Z1 F30000
G1 X126.508 Y39.278 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X126.679 Y39.198 E.00626
G3 X127.7 Y38.924 I1.33 J2.928 E.03522
G3 X128.871 Y39.027 I.315 J3.133 E.03923
G3 X126.395 Y39.344 I-.862 J3.098 E.5852
G1 X126.457 Y39.308 E.00238
G1 X126.995 Y39.504 F30000
G1 F16213.044
G1 X127.106 Y39.465 E.00392
G3 X127.731 Y39.33 I.901 J2.66 E.02123
G3 X128.761 Y39.42 I.282 J2.739 E.03452
G3 X126.846 Y39.568 I-.753 J2.706 E.52038
G1 X126.94 Y39.528 E.00337
G1 X127.422 Y39.797 F30000
G1 F16213.044
G1 X127.466 Y39.786 E.00151
G3 X127.761 Y39.736 I.542 J2.339 E.00992
G3 X128.417 Y39.759 I.24 J2.593 E.02184
G3 X127.014 Y39.939 I-.409 J2.366 E.45277
G1 X127.365 Y39.817 E.01235
G1 X127.786 Y40.128 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X127.79 Y40.127 E.00013
G3 X128.15 Y40.12 I.215 J1.793 E.01108
G3 X127.553 Y40.168 I-.141 J2.004 E.36943
G1 X127.727 Y40.138 E.00542
; WIPE_START
M204 S10000
G1 X127.79 Y40.127 E-.02438
G1 X127.79 Y40.127 E0
G1 X128.15 Y40.12 E-.13678
G1 X128.544 Y40.19 E-.15211
G1 X128.917 Y40.336 E-.15212
G1 X129.253 Y40.553 E-.15215
G1 X129.522 Y40.815 E-.14246
; WIPE_END
G1 E-.04 F1800
G1 X121.891 Y40.677 Z1 F30000
G1 X44.758 Y39.278 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X44.929 Y39.198 E.00627
G3 X45.95 Y38.924 I1.33 J2.928 E.03523
G3 X47.122 Y39.027 I.315 J3.134 E.03924
G3 X44.645 Y39.344 I-.862 J3.098 E.5852
G1 X44.706 Y39.308 E.00236
G1 X45.244 Y39.504 F30000
G1 F16213.044
G1 X45.356 Y39.465 E.00393
G3 X45.981 Y39.33 I.901 J2.66 E.02123
G3 X47.011 Y39.42 I.282 J2.74 E.03452
G3 X45.096 Y39.568 I-.753 J2.706 E.52037
G1 X45.189 Y39.528 E.00336
G1 X45.672 Y39.797 F30000
G1 F16213.044
G1 X45.716 Y39.786 E.00151
G3 X46.011 Y39.736 I.542 J2.339 E.00992
G3 X46.667 Y39.759 I.24 J2.593 E.02184
G3 X45.264 Y39.939 I-.409 J2.366 E.45277
G1 X45.615 Y39.817 E.01235
G1 X46.048 Y40.127 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X46.4 Y40.12 E.01083
G3 X45.988 Y40.134 I-.141 J2.004 E.37521
; WIPE_START
M204 S10000
G1 X46.4 Y40.12 E-.15658
G1 X46.794 Y40.19 E-.15211
G1 X47.167 Y40.336 E-.15212
G1 X47.503 Y40.553 E-.15216
G1 X47.78 Y40.823 E-.14704
; WIPE_END
G1 E-.04 F1800
G1 X53.054 Y46.341 Z1 F30000
G1 X201.166 Y201.291 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X54.834 Y201.291 E4.85411
G1 X54.834 Y50.709 E4.99509
G1 X201.166 Y50.709 E4.85411
G1 X201.166 Y201.231 E4.9931
G1 X200.759 Y200.884 F30000
G1 F16213.044
G1 X55.241 Y200.884 E4.82711
G1 X55.241 Y51.116 E4.96809
G1 X200.759 Y51.116 E4.82711
G1 X200.759 Y200.824 E4.9661
G1 X200.352 Y200.477 F30000
G1 F16213.044
G1 X55.648 Y200.477 E4.8001
G1 X55.648 Y51.523 E4.94108
G1 X200.352 Y51.523 E4.8001
G1 X200.352 Y200.417 E4.93909
G1 X199.96 Y200.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X56.04 Y200.085 E4.42226
G1 X56.04 Y51.915 E4.55285
G1 X199.96 Y51.915 E4.42226
G1 X199.96 Y200.025 E4.55101
; WIPE_START
M204 S10000
G1 X197.96 Y200.026 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X191.14 Y196.6 Z1 F30000
G1 X49.412 Y125.414 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X49.459 Y125.679 E.00893
G3 X45.95 Y122.799 I-3.2 J.322 E.50311
G3 X47.122 Y122.902 I.315 J3.134 E.03924
G3 X49.41 Y125.354 I-.862 J3.098 E.11703
G1 X49.01 Y125.477 F30000
G1 F16213.044
G1 X49.052 Y125.72 E.00816
G3 X45.981 Y123.205 I-2.795 J.281 E.43917
G3 X47.011 Y123.295 I.282 J2.74 E.03452
G3 X49.005 Y125.418 I-.753 J2.706 E.10159
G1 X48.593 Y125.526 F30000
G1 F16213.044
G1 X48.647 Y125.76 E.00796
G3 X46.011 Y123.611 I-2.389 J.239 E.37505
G3 X46.667 Y123.634 I.24 J2.594 E.02184
G3 X48.552 Y125.29 I-.409 J2.366 E.08757
G1 X48.583 Y125.467 E.00597
G1 X48.227 Y125.667 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X48.268 Y126 E.01031
G3 X46.04 Y124.002 I-2.009 J0 E.28418
G3 X46.4 Y123.995 I.215 J1.794 E.01108
G3 X48.228 Y125.6 I-.141 J2.004 E.08028
G1 X48.228 Y125.607 E.00021
; WIPE_START
M204 S10000
G1 X48.268 Y126 E-.15013
G1 X48.22 Y126.398 E-.15245
G1 X48.102 Y126.781 E-.1521
G1 X47.911 Y127.132 E-.15216
G1 X47.654 Y127.439 E-.15209
G1 X47.651 Y127.441 E-.00108
; WIPE_END
M73 P39 R35
G1 E-.04 F1800
G1 X47.298 Y135.065 Z1 F30000
G1 X43.928 Y207.65 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X44.126 Y207.469 E.00892
G3 X45.95 Y206.675 I2.133 J2.407 E.06708
G3 X47.122 Y206.777 I.316 J3.131 E.03925
G3 X43.892 Y207.698 I-.862 J3.099 E.55317
G1 X44.168 Y207.99 F30000
G1 F16213.044
G1 X44.195 Y207.969 E.00116
G3 X45.981 Y207.08 I2.062 J1.907 E.06761
G3 X47.011 Y207.17 I.282 J2.738 E.03453
G3 X44.016 Y208.183 I-.754 J2.706 E.474
G1 X44.131 Y208.037 E.00615
G1 X44.468 Y208.268 F30000
G1 F16213.044
G1 X44.494 Y208.246 E.00113
G3 X46.011 Y207.486 I1.764 J1.629 E.05751
G3 X46.667 Y207.509 I.24 J2.594 E.02184
G3 X44.207 Y208.627 I-.409 J2.366 E.40521
G1 X44.433 Y208.316 E.01273
G1 X44.782 Y208.513 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X46.04 Y207.877 I1.477 J1.362 E.04426
G3 X46.4 Y207.87 I.215 J1.793 E.01108
G3 X44.742 Y208.557 I-.141 J2.004 E.33072
; WIPE_START
M204 S10000
G1 X45.077 Y208.243 E-.17453
G1 X45.423 Y208.043 E-.15214
G1 X45.803 Y207.915 E-.1521
G1 X46.04 Y207.877 E-.09144
G1 X46.4 Y207.87 E-.13677
G1 X46.539 Y207.888 E-.05303
; WIPE_END
G1 E-.04 F1800
G1 X54.157 Y208.356 Z1 F30000
G1 X218.334 Y218.459 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X37.666 Y218.459 E5.99308
G1 X37.666 Y33.541 E6.13406
G1 X218.334 Y33.541 E5.99308
G1 X218.334 Y218.399 E6.13207
G1 X218.741 Y218.866 F30000
G1 F16213.044
G1 X37.259 Y218.866 E6.02008
G1 X37.259 Y33.134 E6.16106
G1 X218.741 Y33.134 E6.02008
G1 X218.741 Y218.806 E6.15907
G1 X219.148 Y219.273 F30000
G1 F16213.044
G1 X36.852 Y219.273 E6.04709
G1 X36.852 Y32.727 E6.18807
G1 X219.148 Y32.727 E6.04709
G1 X219.148 Y219.213 E6.18608
G1 X219.54 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X36.46 Y219.665 E5.62554
G1 X36.46 Y32.335 E5.75613
G1 X219.54 Y32.335 E5.62554
G1 X219.54 Y219.605 E5.75429
; WIPE_START
M204 S10000
G1 X217.54 Y219.606 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X212.561 Y218.295 Z1 F30000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42025
G1 F15000
G1 X195.89 Y201.624 E.72491
G1 X195.357 Y201.624 E.01641
G1 X211.858 Y218.126 E.71753
G1 X211.324 Y218.126 E.01641
G1 X194.823 Y201.624 E.71753
G1 X194.289 Y201.624 E.01641
G1 X210.79 Y218.126 E.71753
G1 X210.257 Y218.126 E.01641
G1 X193.756 Y201.624 E.71753
G1 X193.222 Y201.624 E.01641
G1 X209.723 Y218.126 E.71753
G1 X209.189 Y218.126 E.01641
G1 X192.688 Y201.624 E.71753
G1 X192.155 Y201.624 E.01641
G1 X208.656 Y218.126 E.71753
G1 X208.122 Y218.126 E.01641
G1 X191.621 Y201.624 E.71753
G1 X191.088 Y201.624 E.01641
G1 X207.589 Y218.126 E.71753
G1 X207.055 Y218.126 E.01641
G1 X190.554 Y201.624 E.71753
G1 X190.02 Y201.624 E.01641
G1 X206.521 Y218.126 E.71753
G1 X205.988 Y218.126 E.01641
G1 X189.487 Y201.624 E.71753
G1 X188.953 Y201.624 E.01641
G1 X205.454 Y218.126 E.71753
G1 X204.92 Y218.126 E.01641
G1 X188.419 Y201.624 E.71753
G1 X187.886 Y201.624 E.01641
G1 X204.387 Y218.126 E.71753
G1 X203.853 Y218.126 E.01641
G1 X187.352 Y201.624 E.71753
G1 X186.819 Y201.624 E.01641
G1 X203.32 Y218.126 E.71753
G1 X202.786 Y218.126 E.01641
G1 X186.285 Y201.624 E.71753
G1 X185.751 Y201.624 E.01641
G1 X202.252 Y218.126 E.71753
G1 X201.719 Y218.126 E.01641
G1 X185.218 Y201.624 E.71753
G1 X184.684 Y201.624 E.01641
G1 X201.185 Y218.126 E.71753
G1 X200.651 Y218.126 E.01641
G1 X184.15 Y201.624 E.71753
G1 X183.617 Y201.624 E.01641
G1 X200.118 Y218.126 E.71753
G1 X199.584 Y218.126 E.01641
G1 X183.083 Y201.624 E.71753
G1 X182.55 Y201.624 E.01641
G1 X199.051 Y218.126 E.71753
G1 X198.517 Y218.126 E.01641
G1 X182.016 Y201.624 E.71753
G1 X181.482 Y201.624 E.01641
G1 X197.983 Y218.126 E.71753
G1 X197.45 Y218.126 E.01641
G1 X180.949 Y201.624 E.71753
G1 X180.415 Y201.624 E.01641
G1 X196.916 Y218.126 E.71753
G1 X196.382 Y218.126 E.01641
G1 X179.881 Y201.624 E.71753
G1 X179.348 Y201.624 E.01641
G1 X195.849 Y218.126 E.71753
G1 X195.315 Y218.126 E.01641
G1 X178.814 Y201.624 E.71753
G1 X178.281 Y201.624 E.01641
G1 X194.782 Y218.126 E.71753
G1 X194.248 Y218.126 E.01641
G1 X177.747 Y201.624 E.71753
G1 X177.213 Y201.624 E.01641
G1 X193.714 Y218.126 E.71753
G1 X193.181 Y218.126 E.01641
G1 X176.68 Y201.624 E.71753
G1 X176.146 Y201.624 E.01641
G1 X192.647 Y218.126 E.71753
G1 X192.113 Y218.126 E.01641
G1 X175.612 Y201.624 E.71753
G1 X175.079 Y201.624 E.01641
G1 X191.58 Y218.126 E.71753
G1 X191.046 Y218.126 E.01641
G1 X174.545 Y201.624 E.71753
G1 X174.012 Y201.624 E.01641
G1 X190.513 Y218.126 E.71753
G1 X189.979 Y218.126 E.01641
G1 X173.478 Y201.624 E.71753
G1 X172.944 Y201.624 E.01641
G1 X189.445 Y218.126 E.71753
G1 X188.912 Y218.126 E.01641
G1 X172.411 Y201.624 E.71753
G1 X171.877 Y201.624 E.01641
G1 X188.378 Y218.126 E.71753
G1 X187.844 Y218.126 E.01641
G1 X171.343 Y201.624 E.71753
G1 X170.81 Y201.624 E.01641
G1 X187.311 Y218.126 E.71753
G1 X186.777 Y218.126 E.01641
G1 X170.276 Y201.624 E.71753
G1 X169.743 Y201.624 E.01641
G1 X186.244 Y218.126 E.71753
G1 X185.71 Y218.126 E.01641
G1 X169.209 Y201.624 E.71753
G1 X168.675 Y201.624 E.01641
G1 X185.176 Y218.126 E.71753
G1 X184.643 Y218.126 E.01641
G1 X168.142 Y201.624 E.71753
G1 X167.608 Y201.624 E.01641
G1 X184.109 Y218.126 E.71753
G1 X183.575 Y218.126 E.01641
G1 X167.074 Y201.624 E.71753
G1 X166.541 Y201.624 E.01641
G1 X183.042 Y218.126 E.71753
G1 X182.508 Y218.126 E.01641
G1 X166.007 Y201.624 E.71753
G1 X165.474 Y201.624 E.01641
G1 X181.975 Y218.126 E.71753
G1 X181.441 Y218.126 E.01641
G1 X164.94 Y201.624 E.71753
G1 X164.406 Y201.624 E.01641
G1 X180.907 Y218.126 E.71753
G1 X180.374 Y218.126 E.01641
G1 X163.873 Y201.624 E.71753
G1 X163.339 Y201.624 E.01641
G1 X179.84 Y218.126 E.71753
G1 X179.306 Y218.126 E.01641
G1 X162.805 Y201.624 E.71753
G1 X162.272 Y201.624 E.01641
G1 X178.773 Y218.126 E.71753
G1 X178.239 Y218.126 E.01641
G1 X161.738 Y201.624 E.71753
G1 X161.205 Y201.624 E.01641
G1 X177.706 Y218.126 E.71753
G1 X177.172 Y218.126 E.01641
G1 X160.671 Y201.624 E.71753
G1 X160.137 Y201.624 E.01641
G1 X176.638 Y218.126 E.71753
G1 X176.105 Y218.126 E.01641
G1 X159.604 Y201.624 E.71753
G1 X159.07 Y201.624 E.01641
G1 X175.571 Y218.126 E.71753
G1 X175.037 Y218.126 E.01641
G1 X158.536 Y201.624 E.71753
G1 X158.003 Y201.624 E.01641
G1 X174.504 Y218.126 E.71753
G1 X173.97 Y218.126 E.01641
G1 X157.469 Y201.624 E.71753
G1 X156.936 Y201.624 E.01641
G1 X173.437 Y218.126 E.71753
G1 X172.903 Y218.126 E.01641
G1 X156.402 Y201.624 E.71753
G1 X155.868 Y201.624 E.01641
G1 X172.369 Y218.126 E.71753
G1 X171.836 Y218.126 E.01641
G1 X155.335 Y201.624 E.71753
G1 X154.801 Y201.624 E.01641
G1 X171.302 Y218.126 E.71753
G1 X170.768 Y218.126 E.01641
G1 X154.267 Y201.624 E.71753
G1 X153.734 Y201.624 E.01641
G1 X170.235 Y218.126 E.71753
G1 X169.701 Y218.126 E.01641
G1 X153.2 Y201.624 E.71753
G1 X152.667 Y201.624 E.01641
G1 X169.168 Y218.126 E.71753
G1 X168.634 Y218.126 E.01641
G1 X152.133 Y201.624 E.71753
G1 X151.599 Y201.624 E.01641
G1 X168.1 Y218.126 E.71753
G1 X167.567 Y218.126 E.01641
G1 X151.066 Y201.624 E.71753
G1 X150.532 Y201.624 E.01641
G1 X167.033 Y218.126 E.71753
G1 X166.499 Y218.126 E.01641
G1 X149.998 Y201.624 E.71753
G1 X149.465 Y201.624 E.01641
G1 X165.966 Y218.126 E.71753
M73 P39 R34
G1 X165.432 Y218.126 E.01641
G1 X148.931 Y201.624 E.71753
G1 X148.398 Y201.624 E.01641
G1 X164.899 Y218.126 E.71753
G1 X164.365 Y218.126 E.01641
G1 X147.864 Y201.624 E.71753
G1 X147.33 Y201.624 E.01641
G1 X163.831 Y218.126 E.71753
G1 X163.298 Y218.126 E.01641
G1 X146.797 Y201.624 E.71753
G1 X146.263 Y201.624 E.01641
G1 X162.764 Y218.126 E.71753
G1 X162.23 Y218.126 E.01641
G1 X145.729 Y201.624 E.71753
G1 X145.196 Y201.624 E.01641
G1 X161.697 Y218.126 E.71753
G1 X161.163 Y218.126 E.01641
G1 X144.662 Y201.624 E.71753
G1 X144.129 Y201.624 E.01641
G1 X160.63 Y218.126 E.71753
G1 X160.096 Y218.126 E.01641
G1 X143.595 Y201.624 E.71753
G1 X143.061 Y201.624 E.01641
G1 X159.562 Y218.126 E.71753
G1 X159.029 Y218.126 E.01641
G1 X142.528 Y201.624 E.71753
G1 X141.994 Y201.624 E.01641
G1 X158.495 Y218.126 E.71753
G1 X157.961 Y218.126 E.01641
G1 X141.46 Y201.624 E.71753
G1 X140.927 Y201.624 E.01641
G1 X157.428 Y218.126 E.71753
G1 X156.894 Y218.126 E.01641
G1 X140.393 Y201.624 E.71753
G1 X139.86 Y201.624 E.01641
G1 X156.361 Y218.126 E.71753
G1 X155.827 Y218.126 E.01641
G1 X139.326 Y201.624 E.71753
G1 X138.792 Y201.624 E.01641
G1 X155.293 Y218.126 E.71753
G1 X154.76 Y218.126 E.01641
G1 X138.259 Y201.624 E.71753
G1 X137.725 Y201.624 E.01641
G1 X154.226 Y218.126 E.71753
G1 X153.692 Y218.126 E.01641
G1 X137.191 Y201.624 E.71753
G1 X136.658 Y201.624 E.01641
G1 X153.159 Y218.126 E.71753
G1 X152.625 Y218.126 E.01641
G1 X136.124 Y201.624 E.71753
G1 X135.591 Y201.624 E.01641
G1 X152.092 Y218.126 E.71753
G1 X151.558 Y218.126 E.01641
G1 X135.057 Y201.624 E.71753
G1 X134.523 Y201.624 E.01641
G1 X151.024 Y218.126 E.71753
G1 X150.491 Y218.126 E.01641
G1 X133.99 Y201.624 E.71753
G1 X133.456 Y201.624 E.01641
G1 X149.957 Y218.126 E.71753
G1 X149.423 Y218.126 E.01641
G1 X132.922 Y201.624 E.71753
G1 X132.389 Y201.624 E.01641
G1 X148.89 Y218.126 E.71753
G1 X148.356 Y218.126 E.01641
G1 X131.855 Y201.624 E.71753
G1 X131.322 Y201.624 E.01641
G1 X147.823 Y218.126 E.71753
G1 X147.289 Y218.126 E.01641
G1 X130.788 Y201.624 E.71753
G1 X130.254 Y201.624 E.01641
G1 X146.755 Y218.126 E.71753
G1 X146.222 Y218.126 E.01641
G1 X129.721 Y201.624 E.71753
G1 X129.187 Y201.624 E.01641
G1 X145.688 Y218.126 E.71753
G1 X145.154 Y218.126 E.01641
G1 X128.653 Y201.624 E.71753
G1 X128.12 Y201.624 E.01641
G1 X144.621 Y218.126 E.71753
G1 X144.087 Y218.126 E.01641
G1 X127.586 Y201.624 E.71753
G1 X127.053 Y201.624 E.01641
G1 X143.554 Y218.126 E.71753
G1 X143.02 Y218.126 E.01641
G1 X126.519 Y201.624 E.71753
G1 X125.985 Y201.624 E.01641
G1 X142.486 Y218.126 E.71753
G1 X141.953 Y218.126 E.01641
G1 X125.452 Y201.624 E.71753
M73 P40 R34
G1 X124.918 Y201.624 E.01641
G1 X141.419 Y218.126 E.71753
G1 X140.885 Y218.126 E.01641
G1 X131.283 Y208.523 E.41756
G3 X131.496 Y209.27 I-3.595 J1.431 E.02393
G1 X140.352 Y218.126 E.38508
G1 X139.818 Y218.126 E.01641
G1 X131.551 Y209.858 E.3595
G3 X131.515 Y210.356 I-4.943 J-.107 E.01535
G1 X139.285 Y218.126 E.33786
G1 X138.751 Y218.126 E.01641
G1 X131.425 Y210.8 E.31856
G3 X131.292 Y211.201 I-2.075 J-.463 E.01301
G1 X138.217 Y218.126 E.30112
G1 X137.684 Y218.126 E.01641
G1 X131.123 Y211.565 E.28527
G3 X130.92 Y211.895 I-9.753 J-5.784 E.01192
G1 X137.15 Y218.126 E.27092
G1 X136.616 Y218.126 E.01641
G1 X130.686 Y212.195 E.25787
G3 X130.424 Y212.467 I-1.489 J-1.174 E.01162
G1 X136.083 Y218.126 E.24606
G1 X135.549 Y218.126 E.01641
G1 X130.134 Y212.71 E.23549
G3 X129.814 Y212.924 I-1.23 J-1.493 E.01185
G1 X135.016 Y218.126 E.22619
G1 X134.482 Y218.126 E.01641
G1 X129.463 Y213.107 E.21825
G3 X129.078 Y213.255 I-.937 J-1.857 E.01271
G1 X133.948 Y218.126 E.21179
G1 X133.415 Y218.126 E.01641
G1 X128.653 Y213.364 E.20704
G3 X128.175 Y213.419 I-.772 J-4.64 E.01483
G1 X132.881 Y218.126 E.20466
G1 X132.347 Y218.126 E.01641
G1 X127.626 Y213.404 E.2053
G3 X126.954 Y213.266 I.454 J-3.904 E.02113
G1 X131.814 Y218.126 E.21133
G1 X131.28 Y218.126 E.01641
G1 X114.779 Y201.624 E.71753
G1 X115.313 Y201.624 E.01641
G1 X124.611 Y210.923 E.40432
G3 X124.473 Y210.251 I3.399 J-1.05 E.02113
G1 X115.846 Y201.624 E.3751
G1 X116.38 Y201.624 E.01641
G1 X124.453 Y209.697 E.35104
G3 X124.513 Y209.224 I2.399 J.063 E.01471
G1 X116.914 Y201.624 E.33044
G1 X117.447 Y201.624 E.01641
G1 X124.62 Y208.797 E.31191
G3 X124.768 Y208.411 I2.001 J.542 E.01273
G1 X117.981 Y201.624 E.29511
G1 X118.515 Y201.624 E.01641
G1 X124.95 Y208.059 E.27982
G3 X125.163 Y207.739 I1.706 J.906 E.01185
G1 X119.048 Y201.624 E.26589
G1 X119.582 Y201.624 E.01641
G1 X125.407 Y207.449 E.25329
G3 X125.679 Y207.189 I1.44 J1.233 E.01162
G1 X120.115 Y201.624 E.24195
G1 X120.649 Y201.624 E.01641
G1 X125.981 Y206.956 E.23185
G3 X126.312 Y206.754 I1.176 J1.553 E.01196
G1 X121.183 Y201.624 E.22305
G1 X121.716 Y201.624 E.01641
G1 X126.676 Y206.584 E.21566
G3 X127.076 Y206.45 I.87 J1.933 E.01298
G1 X122.25 Y201.624 E.20984
G1 X122.784 Y201.624 E.01641
G1 X127.523 Y206.364 E.2061
G3 X128.02 Y206.327 I.462 J2.839 E.01533
G1 X123.317 Y201.624 E.20449
G1 X123.851 Y201.624 E.01641
G1 X128.602 Y206.375 E.20659
G3 X129.354 Y206.595 I-.335 J2.554 E.0242
G1 X124.215 Y201.455 E.2235
G1 X114.076 Y201.455 F30000
G1 F15000
G1 X130.747 Y218.126 E.72491
G1 X130.213 Y218.126 E.01641
G1 X113.712 Y201.624 E.71753
G1 X113.178 Y201.624 E.01641
G1 X129.679 Y218.126 E.71753
G1 X129.146 Y218.126 E.01641
G1 X112.645 Y201.624 E.71753
G1 X112.111 Y201.624 E.01641
G1 X128.612 Y218.126 E.71753
G1 X128.078 Y218.126 E.01641
G1 X111.577 Y201.624 E.71753
G1 X111.044 Y201.624 E.01641
G1 X127.545 Y218.126 E.71753
G1 X127.011 Y218.126 E.01641
G1 X110.51 Y201.624 E.71753
G1 X109.977 Y201.624 E.01641
G1 X126.478 Y218.126 E.71753
G1 X125.944 Y218.126 E.01641
G1 X109.443 Y201.624 E.71753
G1 X108.909 Y201.624 E.01641
G1 X125.41 Y218.126 E.71753
G1 X124.877 Y218.126 E.01641
G1 X108.376 Y201.624 E.71753
G1 X107.842 Y201.624 E.01641
G1 X124.343 Y218.126 E.71753
G1 X123.809 Y218.126 E.01641
G1 X107.308 Y201.624 E.71753
G1 X106.775 Y201.624 E.01641
G1 X123.276 Y218.126 E.71753
G1 X122.742 Y218.126 E.01641
G1 X106.241 Y201.624 E.71753
G1 X105.707 Y201.624 E.01641
G1 X122.209 Y218.126 E.71753
G1 X121.675 Y218.126 E.01641
G1 X105.174 Y201.624 E.71753
G1 X104.64 Y201.624 E.01641
G1 X121.141 Y218.126 E.71753
G1 X120.608 Y218.126 E.01641
G1 X104.107 Y201.624 E.71753
G1 X103.573 Y201.624 E.01641
G1 X120.074 Y218.126 E.71753
G1 X119.54 Y218.126 E.01641
G1 X103.039 Y201.624 E.71753
G1 X102.506 Y201.624 E.01641
G1 X119.007 Y218.126 E.71753
G1 X118.473 Y218.126 E.01641
G1 X101.972 Y201.624 E.71753
G1 X101.438 Y201.624 E.01641
G1 X117.94 Y218.126 E.71753
G1 X117.406 Y218.126 E.01641
G1 X100.905 Y201.624 E.71753
G1 X100.371 Y201.624 E.01641
G1 X116.872 Y218.126 E.71753
G1 X116.339 Y218.126 E.01641
G1 X99.838 Y201.624 E.71753
G1 X99.304 Y201.624 E.01641
G1 X115.805 Y218.126 E.71753
G1 X115.271 Y218.126 E.01641
G1 X98.77 Y201.624 E.71753
G1 X98.237 Y201.624 E.01641
G1 X114.738 Y218.126 E.71753
G1 X114.204 Y218.126 E.01641
G1 X97.703 Y201.624 E.71753
G1 X97.169 Y201.624 E.01641
G1 X113.671 Y218.126 E.71753
G1 X113.137 Y218.126 E.01641
G1 X96.636 Y201.624 E.71753
G1 X96.102 Y201.624 E.01641
G1 X112.603 Y218.126 E.71753
G1 X112.07 Y218.126 E.01641
G1 X95.569 Y201.624 E.71753
G1 X95.035 Y201.624 E.01641
G1 X111.536 Y218.126 E.71753
G1 X111.002 Y218.126 E.01641
G1 X94.501 Y201.624 E.71753
G1 X93.968 Y201.624 E.01641
G1 X110.469 Y218.126 E.71753
G1 X109.935 Y218.126 E.01641
G1 X93.434 Y201.624 E.71753
G1 X92.9 Y201.624 E.01641
G1 X109.402 Y218.126 E.71753
G1 X108.868 Y218.126 E.01641
G1 X92.367 Y201.624 E.71753
G1 X91.833 Y201.624 E.01641
G1 X108.334 Y218.126 E.71753
G1 X107.801 Y218.126 E.01641
G1 X91.3 Y201.624 E.71753
G1 X90.766 Y201.624 E.01641
G1 X107.267 Y218.126 E.71753
G1 X106.733 Y218.126 E.01641
G1 X90.232 Y201.624 E.71753
G1 X89.699 Y201.624 E.01641
G1 X106.2 Y218.126 E.71753
G1 X105.666 Y218.126 E.01641
G1 X89.165 Y201.624 E.71753
G1 X88.631 Y201.624 E.01641
G1 X105.133 Y218.126 E.71753
G1 X104.599 Y218.126 E.01641
G1 X88.098 Y201.624 E.71753
G1 X87.564 Y201.624 E.01641
G1 X104.065 Y218.126 E.71753
G1 X103.532 Y218.126 E.01641
G1 X87.031 Y201.624 E.71753
G1 X86.497 Y201.624 E.01641
G1 X102.998 Y218.126 E.71753
G1 X102.464 Y218.126 E.01641
G1 X85.963 Y201.624 E.71753
G1 X85.43 Y201.624 E.01641
G1 X101.931 Y218.126 E.71753
G1 X101.397 Y218.126 E.01641
G1 X84.896 Y201.624 E.71753
G1 X84.362 Y201.624 E.01641
G1 X100.864 Y218.126 E.71753
G1 X100.33 Y218.126 E.01641
G1 X83.829 Y201.624 E.71753
G1 X83.295 Y201.624 E.01641
G1 X99.796 Y218.126 E.71753
G1 X99.263 Y218.126 E.01641
G1 X82.762 Y201.624 E.71753
G1 X82.228 Y201.624 E.01641
G1 X98.729 Y218.126 E.71753
G1 X98.195 Y218.126 E.01641
G1 X81.694 Y201.624 E.71753
G1 X81.161 Y201.624 E.01641
G1 X97.662 Y218.126 E.71753
G1 X97.128 Y218.126 E.01641
G1 X80.627 Y201.624 E.71753
G1 X80.093 Y201.624 E.01641
G1 X96.595 Y218.126 E.71753
G1 X96.061 Y218.126 E.01641
G1 X79.56 Y201.624 E.71753
G1 X79.026 Y201.624 E.01641
G1 X95.527 Y218.126 E.71753
G1 X94.994 Y218.126 E.01641
G1 X78.493 Y201.624 E.71753
G1 X77.959 Y201.624 E.01641
G1 X94.46 Y218.126 E.71753
G1 X93.926 Y218.126 E.01641
G1 X77.425 Y201.624 E.71753
G1 X76.892 Y201.624 E.01641
G1 X93.393 Y218.126 E.71753
G1 X92.859 Y218.126 E.01641
G1 X76.358 Y201.624 E.71753
G1 X75.824 Y201.624 E.01641
G1 X92.326 Y218.126 E.71753
G1 X91.792 Y218.126 E.01641
G1 X75.291 Y201.624 E.71753
G1 X74.757 Y201.624 E.01641
G1 X91.258 Y218.126 E.71753
G1 X90.725 Y218.126 E.01641
G1 X74.224 Y201.624 E.71753
G1 X73.69 Y201.624 E.01641
G1 X90.191 Y218.126 E.71753
G1 X89.657 Y218.126 E.01641
G1 X73.156 Y201.624 E.71753
G1 X72.623 Y201.624 E.01641
G1 X89.124 Y218.126 E.71753
G1 X88.59 Y218.126 E.01641
G1 X72.089 Y201.624 E.71753
G1 X71.555 Y201.624 E.01641
G1 X88.057 Y218.126 E.71753
G1 X87.523 Y218.126 E.01641
G1 X71.022 Y201.624 E.71753
G1 X70.488 Y201.624 E.01641
G1 X86.989 Y218.126 E.71753
G1 X86.456 Y218.126 E.01641
G1 X69.955 Y201.624 E.71753
G1 X69.421 Y201.624 E.01641
G1 X85.922 Y218.126 E.71753
G1 X85.388 Y218.126 E.01641
G1 X68.887 Y201.624 E.71753
G1 X68.354 Y201.624 E.01641
G1 X84.855 Y218.126 E.71753
G1 X84.321 Y218.126 E.01641
G1 X67.82 Y201.624 E.71753
G1 X67.286 Y201.624 E.01641
G1 X83.788 Y218.126 E.71753
G1 X83.254 Y218.126 E.01641
G1 X66.753 Y201.624 E.71753
G1 X66.219 Y201.624 E.01641
G1 X82.72 Y218.126 E.71753
G1 X82.187 Y218.126 E.01641
G1 X65.686 Y201.624 E.71753
G1 X65.152 Y201.624 E.01641
G1 X81.653 Y218.126 E.71753
G1 X81.119 Y218.126 E.01641
G1 X64.618 Y201.624 E.71753
G1 X64.085 Y201.624 E.01641
G1 X80.586 Y218.126 E.71753
G1 X80.052 Y218.126 E.01641
G1 X63.551 Y201.624 E.71753
G1 X63.017 Y201.624 E.01641
G1 X79.519 Y218.126 E.71753
G1 X78.985 Y218.126 E.01641
G1 X62.484 Y201.624 E.71753
G1 X61.95 Y201.624 E.01641
G1 X78.451 Y218.126 E.71753
G1 X77.918 Y218.126 E.01641
G1 X61.417 Y201.624 E.71753
G1 X60.883 Y201.624 E.01641
G1 X77.384 Y218.126 E.71753
G1 X76.85 Y218.126 E.01641
G1 X60.349 Y201.624 E.71753
G1 X59.816 Y201.624 E.01641
G1 X76.317 Y218.126 E.71753
G1 X75.783 Y218.126 E.01641
G1 X59.282 Y201.624 E.71753
G1 X58.748 Y201.624 E.01641
G1 X75.25 Y218.126 E.71753
G1 X74.716 Y218.126 E.01641
G1 X58.215 Y201.624 E.71753
G1 X57.681 Y201.624 E.01641
G1 X74.182 Y218.126 E.71753
G1 X73.649 Y218.126 E.01641
G1 X57.148 Y201.624 E.71753
G1 X56.614 Y201.624 E.01641
G1 X73.115 Y218.126 E.71753
G1 X72.581 Y218.126 E.01641
G1 X56.08 Y201.624 E.71753
G1 X55.547 Y201.624 E.01641
G1 X72.048 Y218.126 E.71753
G1 X71.514 Y218.126 E.01641
G1 X55.013 Y201.624 E.71753
G1 X54.501 Y201.624 E.01576
G1 X54.501 Y201.112 E.01576
G1 X37.999 Y184.611 E.71753
G1 X37.999 Y184.077 E.01641
G1 X54.501 Y200.578 E.71753
G1 X54.501 Y200.045 E.01641
G1 X37.999 Y183.544 E.71753
G1 X37.999 Y183.01 E.01641
G1 X54.501 Y199.511 E.71753
G1 X54.501 Y198.977 E.01641
G1 X37.999 Y182.476 E.71753
G1 X37.999 Y181.943 E.01641
G1 X54.501 Y198.444 E.71753
G1 X54.501 Y197.91 E.01641
G1 X37.999 Y181.409 E.71753
G1 X37.999 Y180.875 E.01641
G1 X54.501 Y197.377 E.71753
G1 X54.501 Y196.843 E.01641
G1 X37.999 Y180.342 E.71753
G1 X37.999 Y179.808 E.01641
G1 X54.501 Y196.309 E.71753
G1 X54.501 Y195.776 E.01641
G1 X37.999 Y179.275 E.71753
G1 X37.999 Y178.741 E.01641
G1 X54.501 Y195.242 E.71753
G1 X54.501 Y194.708 E.01641
G1 X37.999 Y178.207 E.71753
G1 X37.999 Y177.674 E.01641
G1 X54.501 Y194.175 E.71753
G1 X54.501 Y193.641 E.01641
G1 X37.999 Y177.14 E.71753
G1 X37.999 Y176.606 E.01641
G1 X54.501 Y193.108 E.71753
G1 X54.501 Y192.574 E.01641
G1 X37.999 Y176.073 E.71753
G1 X37.999 Y175.539 E.01641
G1 X54.501 Y192.04 E.71753
G1 X54.501 Y191.507 E.01641
G1 X37.999 Y175.006 E.71753
G1 X37.999 Y174.472 E.01641
G1 X54.501 Y190.973 E.71753
G1 X54.501 Y190.439 E.01641
G1 X37.999 Y173.938 E.71753
G1 X37.999 Y173.405 E.01641
G1 X54.501 Y189.906 E.71753
G1 X54.501 Y189.372 E.01641
G1 X37.999 Y172.871 E.71753
G1 X37.999 Y172.337 E.01641
G1 X54.501 Y188.839 E.71753
G1 X54.501 Y188.305 E.01641
G1 X37.999 Y171.804 E.71753
G1 X37.999 Y171.27 E.01641
G1 X54.501 Y187.771 E.71753
G1 X54.501 Y187.238 E.01641
G1 X37.999 Y170.737 E.71753
G1 X37.999 Y170.203 E.01641
G1 X54.501 Y186.704 E.71753
G1 X54.501 Y186.17 E.01641
G1 X37.999 Y169.669 E.71753
G1 X37.999 Y169.136 E.01641
G1 X54.501 Y185.637 E.71753
G1 X54.501 Y185.103 E.01641
G1 X37.999 Y168.602 E.71753
G1 X37.999 Y168.068 E.01641
G1 X54.501 Y184.57 E.71753
G1 X54.501 Y184.036 E.01641
G1 X37.999 Y167.535 E.71753
G1 X37.999 Y167.001 E.01641
G1 X54.501 Y183.502 E.71753
G1 X54.501 Y182.969 E.01641
G1 X37.999 Y166.468 E.71753
G1 X37.999 Y165.934 E.01641
G1 X54.501 Y182.435 E.71753
G1 X54.501 Y181.901 E.01641
G1 X37.999 Y165.4 E.71753
G1 X37.999 Y164.867 E.01641
G1 X54.501 Y181.368 E.71753
G1 X54.501 Y180.834 E.01641
G1 X37.999 Y164.333 E.71753
G1 X37.999 Y163.799 E.01641
G1 X54.501 Y180.3 E.71753
G1 X54.501 Y179.767 E.01641
G1 X37.999 Y163.266 E.71753
G1 X37.999 Y162.732 E.01641
G1 X54.501 Y179.233 E.71753
G1 X54.501 Y178.7 E.01641
G1 X37.999 Y162.199 E.71753
G1 X37.999 Y161.665 E.01641
G1 X54.501 Y178.166 E.71753
G1 X54.501 Y177.632 E.01641
G1 X37.999 Y161.131 E.71753
G1 X37.999 Y160.598 E.01641
G1 X54.501 Y177.099 E.71753
G1 X54.501 Y176.565 E.01641
G1 X37.999 Y160.064 E.71753
G1 X37.999 Y159.53 E.01641
G1 X54.501 Y176.031 E.71753
G1 X54.501 Y175.498 E.01641
G1 X37.999 Y158.997 E.71753
G1 X37.999 Y158.463 E.01641
G1 X54.501 Y174.964 E.71753
G1 X54.501 Y174.431 E.01641
G1 X37.999 Y157.93 E.71753
G1 X37.999 Y157.396 E.01641
G1 X54.501 Y173.897 E.71753
G1 X54.501 Y173.363 E.01641
G1 X37.999 Y156.862 E.71753
G1 X37.999 Y156.329 E.01641
G1 X54.501 Y172.83 E.71753
G1 X54.501 Y172.296 E.01641
G1 X37.999 Y155.795 E.71753
G1 X37.999 Y155.261 E.01641
G1 X54.501 Y171.762 E.71753
G1 X54.501 Y171.229 E.01641
G1 X37.999 Y154.728 E.71753
G1 X37.999 Y154.194 E.01641
G1 X54.501 Y170.695 E.71753
G1 X54.501 Y170.162 E.01641
G1 X37.999 Y153.661 E.71753
G1 X37.999 Y153.127 E.01641
G1 X54.501 Y169.628 E.71753
G1 X54.501 Y169.094 E.01641
G1 X37.999 Y152.593 E.71753
G1 X37.999 Y152.06 E.01641
G1 X54.501 Y168.561 E.71753
G1 X54.501 Y168.027 E.01641
G1 X37.999 Y151.526 E.71753
G1 X37.999 Y150.992 E.01641
G1 X54.501 Y167.493 E.71753
G1 X54.501 Y166.96 E.01641
G1 X37.999 Y150.459 E.71753
G1 X37.999 Y149.925 E.01641
G1 X54.501 Y166.426 E.71753
G1 X54.501 Y165.893 E.01641
G1 X37.999 Y149.392 E.71753
G1 X37.999 Y148.858 E.01641
G1 X54.501 Y165.359 E.71753
G1 X54.501 Y164.825 E.01641
G1 X37.999 Y148.324 E.71753
G1 X37.999 Y147.791 E.01641
G1 X54.501 Y164.292 E.71753
G1 X54.501 Y163.758 E.01641
G1 X37.999 Y147.257 E.71753
G1 X37.999 Y146.723 E.01641
G1 X54.501 Y163.224 E.71753
G1 X54.501 Y162.691 E.01641
G1 X37.999 Y146.19 E.71753
G1 X37.999 Y145.656 E.01641
G1 X54.501 Y162.157 E.71753
G1 X54.501 Y161.624 E.01641
G1 X37.999 Y145.123 E.71753
G1 X37.999 Y144.589 E.01641
G1 X54.501 Y161.09 E.71753
G1 X54.501 Y160.556 E.01641
G1 X37.999 Y144.055 E.71753
G1 X37.999 Y143.522 E.01641
G1 X54.501 Y160.023 E.71753
G1 X54.501 Y159.489 E.01641
G1 X37.999 Y142.988 E.71753
G1 X37.999 Y142.454 E.01641
G1 X54.501 Y158.955 E.71753
G1 X54.501 Y158.422 E.01641
G1 X37.999 Y141.921 E.71753
G1 X37.999 Y141.387 E.01641
G1 X54.501 Y157.888 E.71753
G1 X54.501 Y157.355 E.01641
G1 X37.999 Y140.854 E.71753
G1 X37.999 Y140.32 E.01641
G1 X54.501 Y156.821 E.71753
G1 X54.501 Y156.287 E.01641
G1 X37.999 Y139.786 E.71753
G1 X37.999 Y139.253 E.01641
G1 X54.501 Y155.754 E.71753
G1 X54.501 Y155.22 E.01641
G1 X37.999 Y138.719 E.71753
G1 X37.999 Y138.185 E.01641
G1 X54.501 Y154.686 E.71753
G1 X54.501 Y154.153 E.01641
G1 X37.999 Y137.652 E.71753
G1 X37.999 Y137.118 E.01641
G1 X54.501 Y153.619 E.71753
G1 X54.501 Y153.086 E.01641
G1 X37.999 Y136.585 E.71753
G1 X37.999 Y136.051 E.01641
G1 X54.501 Y152.552 E.71753
G1 X54.501 Y152.018 E.01641
G1 X37.999 Y135.517 E.71753
G1 X37.999 Y134.984 E.01641
G1 X54.501 Y151.485 E.71753
G1 X54.501 Y150.951 E.01641
G1 X37.999 Y134.45 E.71753
G1 X37.999 Y133.916 E.01641
G1 X54.501 Y150.417 E.71753
G1 X54.501 Y149.884 E.01641
G1 X37.999 Y133.383 E.71753
G1 X37.999 Y132.849 E.01641
G1 X54.501 Y149.35 E.71753
G1 X54.501 Y148.817 E.01641
G1 X37.999 Y132.316 E.71753
G1 X37.999 Y131.782 E.01641
G1 X54.501 Y148.283 E.71753
G1 X54.501 Y147.749 E.01641
G1 X37.999 Y131.248 E.71753
G1 X37.999 Y130.715 E.01641
G1 X54.501 Y147.216 E.71753
G1 X54.501 Y146.682 E.01641
G1 X37.999 Y130.181 E.71753
G1 X37.999 Y129.647 E.01641
G1 X54.501 Y146.148 E.71753
G1 X54.501 Y145.615 E.01641
G1 X37.999 Y129.114 E.71753
G1 X37.999 Y128.58 E.01641
G1 X54.501 Y145.081 E.71753
G1 X54.501 Y144.548 E.01641
G1 X37.999 Y128.047 E.71753
G1 X37.999 Y127.513 E.01641
G1 X54.501 Y144.014 E.71753
G1 X54.501 Y143.48 E.01641
G1 X37.999 Y126.979 E.71753
G1 X37.999 Y126.446 E.01641
G1 X54.501 Y142.947 E.71753
G1 X54.501 Y142.413 E.01641
G1 X37.999 Y125.912 E.71753
G1 X37.999 Y125.378 E.01641
G1 X54.501 Y141.879 E.71753
G1 X54.501 Y141.346 E.01641
G1 X37.999 Y124.845 E.71753
G1 X37.999 Y124.311 E.01641
G1 X54.501 Y140.812 E.71753
G1 X54.501 Y140.279 E.01641
G1 X37.999 Y123.778 E.71753
G1 X37.999 Y123.244 E.01641
G1 X54.67 Y139.915 E.72491
; WIPE_START
G1 X53.256 Y138.5 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X49.313 Y131.966 Z1 F30000
G1 X37.83 Y112.935 Z1
G1 Z.6
G1 E.8 F1800
G1 F15000
G1 X47.622 Y122.727 E.42579
G2 X46.863 Y122.502 I-1.124 J2.391 E.02444
G1 X37.999 Y113.639 E.3854
G1 X37.999 Y114.172 E.01641
G1 X46.28 Y122.452 E.36005
G2 X45.782 Y122.488 I-.046 J2.854 E.01537
G1 X37.999 Y114.706 E.33839
G1 X37.999 Y115.24 E.01641
G1 X45.333 Y122.573 E.31889
G2 X44.933 Y122.706 I.466 J2.066 E.013
G1 X37.999 Y115.773 E.30148
G1 X37.999 Y116.307 E.01641
G1 X44.568 Y122.876 E.28565
G2 X44.237 Y123.078 I.842 J1.759 E.01196
G1 X37.999 Y116.84 E.27122
G1 X37.999 Y117.374 E.01641
G1 X43.935 Y123.309 E.25809
G2 X43.661 Y123.57 I1.163 J1.494 E.01162
G1 X37.999 Y117.908 E.2462
G1 X37.999 Y118.441 E.01641
G1 X43.417 Y123.859 E.23557
G2 X43.203 Y124.178 I1.482 J1.223 E.01185
G1 X37.999 Y118.975 E.22627
G1 X37.999 Y119.509 E.01641
G1 X43.02 Y124.529 E.21833
G2 X42.872 Y124.915 I1.855 J.932 E.01272
G1 X37.999 Y120.042 E.2119
G1 X37.999 Y120.576 E.01641
G1 X42.764 Y125.341 E.20719
G2 X42.704 Y125.814 I2.335 J.54 E.01469
G1 X37.999 Y121.109 E.20456
G1 X37.999 Y121.643 E.01641
G1 X42.722 Y126.365 E.20534
G2 X42.857 Y127.034 I3.535 J-.367 E.02102
G1 X37.999 Y122.177 E.21122
M73 P41 R34
G1 X37.999 Y122.71 E.01641
G1 X54.501 Y139.211 E.71753
G1 X54.501 Y138.678 E.01641
G1 X45.217 Y129.394 E.40368
G2 X45.886 Y129.53 I1.093 J-3.676 E.02102
G1 X54.501 Y138.144 E.37458
G1 X54.501 Y137.61 E.01641
G1 X46.434 Y129.544 E.35077
G2 X46.911 Y129.488 I-.303 J-4.629 E.01479
G1 X54.501 Y137.077 E.33001
G1 X54.501 Y136.543 E.01641
G1 X47.335 Y129.378 E.31159
G2 X47.719 Y129.229 I-.551 J-1.993 E.0127
G1 X54.501 Y136.01 E.29486
G1 X54.501 Y135.476 E.01641
G1 X48.07 Y129.045 E.27963
G2 X48.389 Y128.831 I-.91 J-1.7 E.01184
G1 X54.501 Y134.942 E.26575
G1 X54.501 Y134.409 E.01641
G1 X48.679 Y128.587 E.25314
G2 X48.941 Y128.315 I-1.227 J-1.442 E.01162
G1 X54.501 Y133.875 E.24176
G1 X54.501 Y133.341 E.01641
G1 X49.174 Y128.015 E.23163
G2 X49.376 Y127.684 I-9.312 J-5.922 E.01193
G1 X54.501 Y132.808 E.22282
G1 X54.501 Y132.274 E.01641
G1 X49.545 Y127.319 E.21549
G2 X49.677 Y126.917 I-1.945 J-.862 E.01302
G1 X54.501 Y131.741 E.20975
G1 X54.501 Y131.207 E.01641
G1 X49.766 Y126.473 E.20587
G2 X49.8 Y125.973 I-4.658 J-.57 E.0154
G1 X54.501 Y130.673 E.20438
G1 X54.501 Y130.14 E.01641
G1 X49.744 Y125.384 E.20681
G2 X49.527 Y124.633 I-3.898 J.72 E.02407
G1 X54.501 Y129.606 E.21625
G1 X54.501 Y129.072 E.01641
G1 X37.999 Y112.571 E.71753
G1 X37.999 Y112.038 E.01641
G1 X54.501 Y128.539 E.71753
G1 X54.501 Y128.005 E.01641
G1 X37.999 Y111.504 E.71753
G1 X37.999 Y110.971 E.01641
G1 X54.501 Y127.472 E.71753
G1 X54.501 Y126.938 E.01641
G1 X37.999 Y110.437 E.71753
G1 X37.999 Y109.903 E.01641
G1 X54.501 Y126.404 E.71753
G1 X54.501 Y125.871 E.01641
G1 X37.999 Y109.37 E.71753
G1 X37.999 Y108.836 E.01641
G1 X54.501 Y125.337 E.71753
G1 X54.501 Y124.803 E.01641
G1 X37.999 Y108.302 E.71753
G1 X37.999 Y107.769 E.01641
G1 X54.501 Y124.27 E.71753
G1 X54.501 Y123.736 E.01641
G1 X37.999 Y107.235 E.71753
G1 X37.999 Y106.702 E.01641
G1 X54.501 Y123.203 E.71753
G1 X54.501 Y122.669 E.01641
G1 X37.999 Y106.168 E.71753
G1 X37.999 Y105.634 E.01641
G1 X54.501 Y122.135 E.71753
G1 X54.501 Y121.602 E.01641
G1 X37.999 Y105.101 E.71753
G1 X37.999 Y104.567 E.01641
G1 X54.501 Y121.068 E.71753
G1 X54.501 Y120.534 E.01641
G1 X37.999 Y104.033 E.71753
G1 X37.999 Y103.5 E.01641
G1 X54.501 Y120.001 E.71753
G1 X54.501 Y119.467 E.01641
G1 X37.999 Y102.966 E.71753
G1 X37.999 Y102.433 E.01641
G1 X54.501 Y118.934 E.71753
G1 X54.501 Y118.4 E.01641
G1 X37.999 Y101.899 E.71753
G1 X37.999 Y101.365 E.01641
G1 X54.501 Y117.866 E.71753
G1 X54.501 Y117.333 E.01641
G1 X37.999 Y100.832 E.71753
G1 X37.999 Y100.298 E.01641
G1 X54.501 Y116.799 E.71753
G1 X54.501 Y116.265 E.01641
G1 X37.999 Y99.764 E.71753
G1 X37.999 Y99.231 E.01641
G1 X54.501 Y115.732 E.71753
G1 X54.501 Y115.198 E.01641
G1 X37.999 Y98.697 E.71753
G1 X37.999 Y98.164 E.01641
G1 X54.501 Y114.665 E.71753
G1 X54.501 Y114.131 E.01641
G1 X37.999 Y97.63 E.71753
G1 X37.999 Y97.096 E.01641
G1 X54.501 Y113.597 E.71753
G1 X54.501 Y113.064 E.01641
G1 X37.999 Y96.563 E.71753
G1 X37.999 Y96.029 E.01641
G1 X54.501 Y112.53 E.71753
G1 X54.501 Y111.996 E.01641
G1 X37.999 Y95.495 E.71753
G1 X37.999 Y94.962 E.01641
G1 X54.501 Y111.463 E.71753
G1 X54.501 Y110.929 E.01641
G1 X37.999 Y94.428 E.71753
G1 X37.999 Y93.895 E.01641
G1 X54.501 Y110.396 E.71753
G1 X54.501 Y109.862 E.01641
G1 X37.999 Y93.361 E.71753
G1 X37.999 Y92.827 E.01641
G1 X54.501 Y109.328 E.71753
G1 X54.501 Y108.795 E.01641
G1 X37.999 Y92.294 E.71753
G1 X37.999 Y91.76 E.01641
G1 X54.501 Y108.261 E.71753
G1 X54.501 Y107.727 E.01641
G1 X37.999 Y91.226 E.71753
G1 X37.999 Y90.693 E.01641
G1 X54.501 Y107.194 E.71753
G1 X54.501 Y106.66 E.01641
G1 X37.999 Y90.159 E.71753
G1 X37.999 Y89.626 E.01641
G1 X54.501 Y106.127 E.71753
G1 X54.501 Y105.593 E.01641
G1 X37.999 Y89.092 E.71753
G1 X37.999 Y88.558 E.01641
G1 X54.501 Y105.059 E.71753
G1 X54.501 Y104.526 E.01641
G1 X37.999 Y88.025 E.71753
G1 X37.999 Y87.491 E.01641
G1 X54.501 Y103.992 E.71753
G1 X54.501 Y103.458 E.01641
G1 X37.999 Y86.957 E.71753
G1 X37.999 Y86.424 E.01641
G1 X54.501 Y102.925 E.71753
G1 X54.501 Y102.391 E.01641
G1 X37.999 Y85.89 E.71753
G1 X37.999 Y85.357 E.01641
G1 X54.501 Y101.858 E.71753
G1 X54.501 Y101.324 E.01641
G1 X37.999 Y84.823 E.71753
G1 X37.999 Y84.289 E.01641
G1 X54.501 Y100.79 E.71753
G1 X54.501 Y100.257 E.01641
G1 X37.999 Y83.756 E.71753
G1 X37.999 Y83.222 E.01641
G1 X54.501 Y99.723 E.71753
G1 X54.501 Y99.189 E.01641
G1 X37.999 Y82.688 E.71753
G1 X37.999 Y82.155 E.01641
G1 X54.501 Y98.656 E.71753
G1 X54.501 Y98.122 E.01641
G1 X37.999 Y81.621 E.71753
G1 X37.999 Y81.088 E.01641
G1 X54.501 Y97.589 E.71753
G1 X54.501 Y97.055 E.01641
G1 X37.999 Y80.554 E.71753
G1 X37.999 Y80.02 E.01641
G1 X54.501 Y96.521 E.71753
G1 X54.501 Y95.988 E.01641
G1 X37.999 Y79.487 E.71753
G1 X37.999 Y78.953 E.01641
G1 X54.501 Y95.454 E.71753
G1 X54.501 Y94.92 E.01641
G1 X37.999 Y78.419 E.71753
G1 X37.999 Y77.886 E.01641
G1 X54.501 Y94.387 E.71753
G1 X54.501 Y93.853 E.01641
G1 X37.999 Y77.352 E.71753
G1 X37.999 Y76.819 E.01641
G1 X54.501 Y93.32 E.71753
G1 X54.501 Y92.786 E.01641
G1 X37.999 Y76.285 E.71753
G1 X37.999 Y75.751 E.01641
G1 X54.501 Y92.252 E.71753
G1 X54.501 Y91.719 E.01641
G1 X37.999 Y75.218 E.71753
G1 X37.999 Y74.684 E.01641
G1 X54.501 Y91.185 E.71753
G1 X54.501 Y90.651 E.01641
G1 X37.999 Y74.15 E.71753
G1 X37.999 Y73.617 E.01641
G1 X54.501 Y90.118 E.71753
G1 X54.501 Y89.584 E.01641
G1 X37.999 Y73.083 E.71753
G1 X37.999 Y72.55 E.01641
G1 X54.501 Y89.051 E.71753
G1 X54.501 Y88.517 E.01641
G1 X37.999 Y72.016 E.71753
G1 X37.999 Y71.482 E.01641
G1 X54.501 Y87.983 E.71753
G1 X54.501 Y87.45 E.01641
G1 X37.999 Y70.949 E.71753
G1 X37.999 Y70.415 E.01641
G1 X54.501 Y86.916 E.71753
G1 X54.501 Y86.382 E.01641
G1 X37.999 Y69.881 E.71753
G1 X37.999 Y69.348 E.01641
G1 X54.501 Y85.849 E.71753
G1 X54.501 Y85.315 E.01641
G1 X37.999 Y68.814 E.71753
G1 X37.999 Y68.281 E.01641
G1 X54.501 Y84.782 E.71753
G1 X54.501 Y84.248 E.01641
G1 X37.999 Y67.747 E.71753
G1 X37.999 Y67.213 E.01641
G1 X54.501 Y83.714 E.71753
G1 X54.501 Y83.181 E.01641
G1 X37.999 Y66.68 E.71753
G1 X37.999 Y66.146 E.01641
G1 X54.501 Y82.647 E.71753
G1 X54.501 Y82.113 E.01641
G1 X37.999 Y65.612 E.71753
G1 X37.999 Y65.079 E.01641
G1 X54.501 Y81.58 E.71753
G1 X54.501 Y81.046 E.01641
G1 X37.999 Y64.545 E.71753
G1 X37.999 Y64.012 E.01641
G1 X54.501 Y80.513 E.71753
G1 X54.501 Y79.979 E.01641
G1 X37.999 Y63.478 E.71753
G1 X37.999 Y62.944 E.01641
G1 X54.501 Y79.445 E.71753
G1 X54.501 Y78.912 E.01641
G1 X37.999 Y62.411 E.71753
G1 X37.999 Y61.877 E.01641
G1 X54.501 Y78.378 E.71753
G1 X54.501 Y77.844 E.01641
G1 X37.999 Y61.343 E.71753
G1 X37.999 Y60.81 E.01641
G1 X54.501 Y77.311 E.71753
G1 X54.501 Y76.777 E.01641
G1 X37.999 Y60.276 E.71753
G1 X37.999 Y59.743 E.01641
G1 X54.501 Y76.244 E.71753
G1 X54.501 Y75.71 E.01641
G1 X37.999 Y59.209 E.71753
G1 X37.999 Y58.675 E.01641
G1 X54.501 Y75.176 E.71753
G1 X54.501 Y74.643 E.01641
G1 X37.999 Y58.142 E.71753
G1 X37.999 Y57.608 E.01641
G1 X54.501 Y74.109 E.71753
G1 X54.501 Y73.575 E.01641
G1 X37.999 Y57.074 E.71753
G1 X37.999 Y56.541 E.01641
G1 X54.501 Y73.042 E.71753
G1 X54.501 Y72.508 E.01641
G1 X37.999 Y56.007 E.71753
G1 X37.999 Y55.474 E.01641
G1 X54.501 Y71.975 E.71753
G1 X54.501 Y71.441 E.01641
G1 X37.999 Y54.94 E.71753
G1 X37.999 Y54.406 E.01641
G1 X54.501 Y70.907 E.71753
G1 X54.501 Y70.374 E.01641
G1 X37.999 Y53.873 E.71753
G1 X37.999 Y53.339 E.01641
G1 X54.501 Y69.84 E.71753
G1 X54.501 Y69.306 E.01641
G1 X37.999 Y52.805 E.71753
G1 X37.999 Y52.272 E.01641
G1 X54.501 Y68.773 E.71753
G1 X54.501 Y68.239 E.01641
G1 X37.999 Y51.738 E.71753
G1 X37.999 Y51.205 E.01641
G1 X54.501 Y67.706 E.71753
G1 X54.501 Y67.172 E.01641
G1 X37.999 Y50.671 E.71753
G1 X37.999 Y50.137 E.01641
G1 X54.501 Y66.638 E.71753
G1 X54.501 Y66.105 E.01641
G1 X37.999 Y49.604 E.71753
G1 X37.999 Y49.07 E.01641
G1 X54.501 Y65.571 E.71753
G1 X54.501 Y65.037 E.01641
G1 X37.999 Y48.536 E.71753
G1 X37.999 Y48.003 E.01641
G1 X54.501 Y64.504 E.71753
G1 X54.501 Y63.97 E.01641
G1 X37.999 Y47.469 E.71753
G1 X37.999 Y46.936 E.01641
G1 X54.501 Y63.437 E.71753
G1 X54.501 Y62.903 E.01641
G1 X37.999 Y46.402 E.71753
G1 X37.999 Y45.868 E.01641
G1 X54.501 Y62.369 E.71753
G1 X54.501 Y61.836 E.01641
G1 X37.999 Y45.335 E.71753
G1 X37.999 Y44.801 E.01641
G1 X54.501 Y61.302 E.71753
G1 X54.501 Y60.768 E.01641
G1 X37.999 Y44.267 E.71753
G1 X37.999 Y43.734 E.01641
G1 X54.501 Y60.235 E.71753
G1 X54.501 Y59.701 E.01641
G1 X37.999 Y43.2 E.71753
G1 X37.999 Y42.667 E.01641
G1 X54.501 Y59.168 E.71753
G1 X54.501 Y58.634 E.01641
G1 X37.999 Y42.133 E.71753
G1 X37.999 Y41.599 E.01641
G1 X54.501 Y58.1 E.71753
G1 X54.501 Y57.567 E.01641
G1 X37.999 Y41.066 E.71753
G1 X37.999 Y40.532 E.01641
G1 X54.501 Y57.033 E.71753
G1 X54.501 Y56.499 E.01641
G1 X37.999 Y39.998 E.71753
G1 X37.999 Y39.465 E.01641
G1 X54.67 Y56.136 E.72491
; WIPE_START
G1 X53.256 Y54.721 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X49.748 Y47.943 Z1 F30000
G1 X42.378 Y33.705 Z1
G1 Z.6
G1 E.8 F1800
G1 F15000
G1 X47.465 Y38.791 E.22116
G2 X46.753 Y38.613 I-1.251 J3.49 E.02259
G1 X42.014 Y33.874 E.20605
G1 X41.481 Y33.874 E.01641
G1 X46.181 Y38.575 E.20439
G2 X45.698 Y38.626 I.169 J3.932 E.01494
G1 X40.947 Y33.874 E.2066
G1 X40.414 Y33.874 E.01641
G1 X45.258 Y38.719 E.21066
G2 X44.864 Y38.858 I.497 J2.036 E.01288
G1 X39.88 Y33.874 E.21672
G1 X39.346 Y33.874 E.01641
G1 X44.505 Y39.033 E.22433
M73 P41 R33
G2 X44.178 Y39.24 I.869 J1.733 E.01191
G1 X38.813 Y33.874 E.23332
G1 X38.279 Y33.874 E.01641
G1 X43.883 Y39.478 E.24368
G2 X43.616 Y39.745 I1.202 J1.468 E.01162
G1 X37.999 Y34.129 E.24424
G1 X37.999 Y34.662 E.01641
G1 X43.378 Y40.041 E.23387
G2 X43.169 Y40.365 I1.519 J1.206 E.01189
G1 X37.999 Y35.196 E.2248
G1 X37.999 Y35.729 E.01641
G1 X42.992 Y40.722 E.21709
G2 X42.85 Y41.113 I1.882 J.905 E.01283
G1 X37.999 Y36.263 E.21091
G1 X37.999 Y36.797 E.01641
G1 X42.748 Y41.545 E.20649
G2 X42.703 Y42.034 I4.42 J.657 E.01508
G1 X37.999 Y37.33 E.20452
G1 X37.999 Y37.864 E.01641
G1 X42.732 Y42.597 E.2058
G2 X42.9 Y43.298 I4.055 J-.597 E.02219
G1 X37.999 Y38.398 E.21307
G1 X37.999 Y38.931 E.01641
G1 X54.501 Y55.432 E.71753
G1 X54.501 Y54.899 E.01641
G1 X45.077 Y45.475 E.40975
G2 X45.78 Y45.644 I1.346 J-4.061 E.02223
G1 X54.501 Y54.365 E.37922
G1 X54.501 Y53.831 E.01641
G1 X46.34 Y45.671 E.35484
G2 X46.83 Y45.627 I.026 J-2.472 E.01515
G1 X54.501 Y53.298 E.33354
G1 X54.501 Y52.764 E.01641
G1 X47.263 Y45.527 E.31471
G2 X47.653 Y45.383 I-.52 J-2.02 E.01281
G1 X54.501 Y52.23 E.29774
G1 X54.501 Y51.697 E.01641
G1 X48.009 Y45.205 E.28227
G2 X48.333 Y44.996 I-.881 J-1.721 E.01189
G1 X54.501 Y51.163 E.26817
G1 X54.501 Y50.63 E.01641
G1 X48.628 Y44.757 E.25535
G2 X48.895 Y44.49 I-1.201 J-1.464 E.01162
G1 X54.78 Y50.376 E.25592
G1 X55.314 Y50.376 E.01641
G1 X49.133 Y44.194 E.26878
G2 X49.341 Y43.869 I-1.523 J-1.207 E.01189
G1 X55.847 Y50.376 E.28291
G1 X56.381 Y50.376 E.01641
G1 X49.519 Y43.513 E.2984
G2 X49.657 Y43.118 I-6.741 J-2.593 E.01287
G1 X56.915 Y50.376 E.31557
G1 X57.448 Y50.376 E.01641
G1 X49.754 Y42.681 E.33459
G2 X49.798 Y42.192 I-2.427 J-.469 E.01512
G1 X57.982 Y50.376 E.35585
G1 X58.515 Y50.376 E.01641
G1 X49.761 Y41.621 E.38066
G2 X49.582 Y40.909 I-3.519 J.506 E.02264
G1 X59.049 Y50.376 E.41166
G1 X59.583 Y50.376 E.01641
G1 X43.082 Y33.874 E.71753
G1 X43.615 Y33.874 E.01641
G1 X60.116 Y50.376 E.71753
G1 X60.65 Y50.376 E.01641
G1 X44.149 Y33.874 E.71753
G1 X44.683 Y33.874 E.01641
G1 X61.184 Y50.376 E.71753
G1 X61.717 Y50.376 E.01641
G1 X45.216 Y33.874 E.71753
G1 X45.75 Y33.874 E.01641
G1 X62.251 Y50.376 E.71753
G1 X62.784 Y50.376 E.01641
G1 X46.283 Y33.874 E.71753
G1 X46.817 Y33.874 E.01641
G1 X63.318 Y50.376 E.71753
G1 X63.852 Y50.376 E.01641
G1 X47.351 Y33.874 E.71753
G1 X47.884 Y33.874 E.01641
G1 X64.385 Y50.376 E.71753
G1 X64.919 Y50.376 E.01641
G1 X48.418 Y33.874 E.71753
G1 X48.952 Y33.874 E.01641
G1 X65.453 Y50.376 E.71753
G1 X65.986 Y50.376 E.01641
G1 X49.485 Y33.874 E.71753
G1 X50.019 Y33.874 E.01641
G1 X66.52 Y50.376 E.71753
G1 X67.053 Y50.376 E.01641
G1 X50.552 Y33.874 E.71753
G1 X51.086 Y33.874 E.01641
G1 X67.587 Y50.376 E.71753
G1 X68.121 Y50.376 E.01641
G1 X51.62 Y33.874 E.71753
G1 X52.153 Y33.874 E.01641
G1 X68.654 Y50.376 E.71753
G1 X69.188 Y50.376 E.01641
G1 X52.687 Y33.874 E.71753
G1 X53.221 Y33.874 E.01641
G1 X69.722 Y50.376 E.71753
G1 X70.255 Y50.376 E.01641
G1 X53.754 Y33.874 E.71753
G1 X54.288 Y33.874 E.01641
G1 X70.789 Y50.376 E.71753
G1 X71.322 Y50.376 E.01641
G1 X54.821 Y33.874 E.71753
G1 X55.355 Y33.874 E.01641
G1 X71.856 Y50.376 E.71753
G1 X72.39 Y50.376 E.01641
G1 X55.889 Y33.874 E.71753
G1 X56.422 Y33.874 E.01641
G1 X72.923 Y50.376 E.71753
G1 X73.457 Y50.376 E.01641
G1 X56.956 Y33.874 E.71753
G1 X57.49 Y33.874 E.01641
G1 X73.991 Y50.376 E.71753
G1 X74.524 Y50.376 E.01641
G1 X58.023 Y33.874 E.71753
G1 X58.557 Y33.874 E.01641
G1 X75.058 Y50.376 E.71753
G1 X75.591 Y50.376 E.01641
G1 X59.09 Y33.874 E.71753
G1 X59.624 Y33.874 E.01641
G1 X76.125 Y50.376 E.71753
G1 X76.659 Y50.376 E.01641
G1 X60.158 Y33.874 E.71753
G1 X60.691 Y33.874 E.01641
G1 X77.192 Y50.376 E.71753
G1 X77.726 Y50.376 E.01641
G1 X61.225 Y33.874 E.71753
G1 X61.759 Y33.874 E.01641
G1 X78.26 Y50.376 E.71753
G1 X78.793 Y50.376 E.01641
G1 X62.292 Y33.874 E.71753
G1 X62.826 Y33.874 E.01641
G1 X79.327 Y50.376 E.71753
G1 X79.86 Y50.376 E.01641
G1 X63.359 Y33.874 E.71753
G1 X63.893 Y33.874 E.01641
G1 X80.394 Y50.376 E.71753
G1 X80.928 Y50.376 E.01641
G1 X64.427 Y33.874 E.71753
G1 X64.96 Y33.874 E.01641
G1 X81.461 Y50.376 E.71753
G1 X81.995 Y50.376 E.01641
G1 X65.494 Y33.874 E.71753
G1 X66.028 Y33.874 E.01641
G1 X82.529 Y50.376 E.71753
G1 X83.062 Y50.376 E.01641
G1 X66.561 Y33.874 E.71753
G1 X67.095 Y33.874 E.01641
G1 X83.596 Y50.376 E.71753
G1 X84.129 Y50.376 E.01641
G1 X67.628 Y33.874 E.71753
G1 X68.162 Y33.874 E.01641
G1 X84.663 Y50.376 E.71753
G1 X85.197 Y50.376 E.01641
G1 X68.696 Y33.874 E.71753
G1 X69.229 Y33.874 E.01641
G1 X85.73 Y50.376 E.71753
G1 X86.264 Y50.376 E.01641
G1 X69.763 Y33.874 E.71753
G1 X70.297 Y33.874 E.01641
G1 X86.798 Y50.376 E.71753
G1 X87.331 Y50.376 E.01641
G1 X70.83 Y33.874 E.71753
G1 X71.364 Y33.874 E.01641
G1 X87.865 Y50.376 E.71753
G1 X88.398 Y50.376 E.01641
G1 X71.897 Y33.874 E.71753
G1 X72.431 Y33.874 E.01641
G1 X88.932 Y50.376 E.71753
G1 X89.466 Y50.376 E.01641
G1 X72.965 Y33.874 E.71753
G1 X73.498 Y33.874 E.01641
G1 X89.999 Y50.376 E.71753
G1 X90.533 Y50.376 E.01641
G1 X74.032 Y33.874 E.71753
G1 X74.566 Y33.874 E.01641
G1 X91.067 Y50.376 E.71753
G1 X91.6 Y50.376 E.01641
G1 X75.099 Y33.874 E.71753
G1 X75.633 Y33.874 E.01641
G1 X92.134 Y50.376 E.71753
G1 X92.667 Y50.376 E.01641
G1 X76.166 Y33.874 E.71753
G1 X76.7 Y33.874 E.01641
G1 X93.201 Y50.376 E.71753
G1 X93.735 Y50.376 E.01641
G1 X77.234 Y33.874 E.71753
G1 X77.767 Y33.874 E.01641
G1 X94.268 Y50.376 E.71753
G1 X94.802 Y50.376 E.01641
G1 X78.301 Y33.874 E.71753
G1 X78.835 Y33.874 E.01641
G1 X95.336 Y50.376 E.71753
G1 X95.869 Y50.376 E.01641
G1 X79.368 Y33.874 E.71753
G1 X79.902 Y33.874 E.01641
G1 X96.403 Y50.376 E.71753
G1 X96.936 Y50.376 E.01641
G1 X80.435 Y33.874 E.71753
G1 X80.969 Y33.874 E.01641
G1 X97.47 Y50.376 E.71753
G1 X98.004 Y50.376 E.01641
G1 X81.503 Y33.874 E.71753
G1 X82.036 Y33.874 E.01641
G1 X98.537 Y50.376 E.71753
G1 X99.071 Y50.376 E.01641
G1 X82.57 Y33.874 E.71753
G1 X83.104 Y33.874 E.01641
G1 X99.605 Y50.376 E.71753
G1 X100.138 Y50.376 E.01641
G1 X83.637 Y33.874 E.71753
G1 X84.171 Y33.874 E.01641
G1 X100.672 Y50.376 E.71753
G1 X101.205 Y50.376 E.01641
G1 X84.704 Y33.874 E.71753
G1 X85.238 Y33.874 E.01641
G1 X101.739 Y50.376 E.71753
G1 X102.273 Y50.376 E.01641
G1 X85.772 Y33.874 E.71753
G1 X86.305 Y33.874 E.01641
G1 X102.806 Y50.376 E.71753
G1 X103.34 Y50.376 E.01641
G1 X86.839 Y33.874 E.71753
G1 X87.373 Y33.874 E.01641
G1 X103.874 Y50.376 E.71753
G1 X104.407 Y50.376 E.01641
G1 X87.906 Y33.874 E.71753
G1 X88.44 Y33.874 E.01641
G1 X104.941 Y50.376 E.71753
G1 X105.474 Y50.376 E.01641
G1 X88.973 Y33.874 E.71753
G1 X89.507 Y33.874 E.01641
G1 X106.008 Y50.376 E.71753
G1 X106.542 Y50.376 E.01641
G1 X90.041 Y33.874 E.71753
G1 X90.574 Y33.874 E.01641
G1 X107.075 Y50.376 E.71753
G1 X107.609 Y50.376 E.01641
G1 X91.108 Y33.874 E.71753
G1 X91.642 Y33.874 E.01641
G1 X108.143 Y50.376 E.71753
G1 X108.676 Y50.376 E.01641
G1 X92.175 Y33.874 E.71753
G1 X92.709 Y33.874 E.01641
G1 X109.21 Y50.376 E.71753
G1 X109.743 Y50.376 E.01641
G1 X93.242 Y33.874 E.71753
G1 X93.776 Y33.874 E.01641
G1 X110.277 Y50.376 E.71753
G1 X110.811 Y50.376 E.01641
G1 X94.31 Y33.874 E.71753
G1 X94.843 Y33.874 E.01641
G1 X111.344 Y50.376 E.71753
G1 X111.878 Y50.376 E.01641
G1 X95.377 Y33.874 E.71753
G1 X95.911 Y33.874 E.01641
G1 X112.412 Y50.376 E.71753
G1 X112.945 Y50.376 E.01641
G1 X96.444 Y33.874 E.71753
G1 X96.978 Y33.874 E.01641
G1 X113.479 Y50.376 E.71753
G1 X114.012 Y50.376 E.01641
G1 X97.511 Y33.874 E.71753
G1 X98.045 Y33.874 E.01641
G1 X114.546 Y50.376 E.71753
G1 X115.08 Y50.376 E.01641
G1 X98.579 Y33.874 E.71753
G1 X99.112 Y33.874 E.01641
G1 X115.613 Y50.376 E.71753
G1 X116.147 Y50.376 E.01641
G1 X99.646 Y33.874 E.71753
G1 X100.18 Y33.874 E.01641
G1 X116.681 Y50.376 E.71753
G1 X117.214 Y50.376 E.01641
G1 X100.713 Y33.874 E.71753
M73 P42 R33
G1 X101.247 Y33.874 E.01641
G1 X117.748 Y50.376 E.71753
G1 X118.281 Y50.376 E.01641
G1 X101.78 Y33.874 E.71753
G1 X102.314 Y33.874 E.01641
G1 X118.815 Y50.376 E.71753
G1 X119.349 Y50.376 E.01641
G1 X102.848 Y33.874 E.71753
G1 X103.381 Y33.874 E.01641
G1 X119.882 Y50.376 E.71753
G1 X120.416 Y50.376 E.01641
G1 X103.915 Y33.874 E.71753
G1 X104.449 Y33.874 E.01641
G1 X120.95 Y50.376 E.71753
G1 X121.483 Y50.376 E.01641
G1 X104.982 Y33.874 E.71753
G1 X105.516 Y33.874 E.01641
G1 X122.017 Y50.376 E.71753
G1 X122.551 Y50.376 E.01641
G1 X106.049 Y33.874 E.71753
G1 X106.583 Y33.874 E.01641
G1 X123.084 Y50.376 E.71753
G1 X123.618 Y50.376 E.01641
G1 X107.117 Y33.874 E.71753
G1 X107.65 Y33.874 E.01641
G1 X124.151 Y50.376 E.71753
G1 X124.685 Y50.376 E.01641
G1 X108.184 Y33.874 E.71753
G1 X108.718 Y33.874 E.01641
G1 X125.219 Y50.376 E.71753
G1 X125.752 Y50.376 E.01641
G1 X109.251 Y33.874 E.71753
G1 X109.785 Y33.874 E.01641
G1 X126.286 Y50.376 E.71753
G1 X126.82 Y50.376 E.01641
G1 X110.318 Y33.874 E.71753
G1 X110.852 Y33.874 E.01641
G1 X127.353 Y50.376 E.71753
G1 X127.887 Y50.376 E.01641
G1 X111.386 Y33.874 E.71753
G1 X111.919 Y33.874 E.01641
G1 X128.42 Y50.376 E.71753
G1 X128.954 Y50.376 E.01641
G1 X112.453 Y33.874 E.71753
G1 X112.987 Y33.874 E.01641
G1 X129.488 Y50.376 E.71753
G1 X130.021 Y50.376 E.01641
G1 X113.52 Y33.874 E.71753
G1 X114.054 Y33.874 E.01641
G1 X130.725 Y50.545 E.72491
; WIPE_START
G1 X129.31 Y49.131 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.836 Y41.911 Z1 F30000
G1 X124.023 Y33.705 Z1
G1 Z.6
G1 E.8 F1800
G1 F15000
G1 X129.056 Y38.738 E.21885
G2 X128.383 Y38.598 I-1.088 J3.55 E.02118
G1 X123.659 Y33.874 E.2054
G1 X123.125 Y33.874 E.01641
G1 X127.831 Y38.58 E.20463
G2 X127.357 Y38.64 I.152 J3.151 E.01472
G1 X122.592 Y33.874 E.2072
G1 X122.058 Y33.874 E.01641
G1 X126.926 Y38.742 E.21167
G2 X126.539 Y38.888 I.534 J2.006 E.01272
G1 X121.525 Y33.874 E.21802
G1 X120.991 Y33.874 E.01641
G1 X126.189 Y39.072 E.22602
G2 X125.87 Y39.287 I.912 J1.699 E.01184
G1 X120.457 Y33.874 E.23535
G1 X119.924 Y33.874 E.01641
G1 X125.58 Y39.53 E.24595
G2 X125.318 Y39.803 I1.231 J1.445 E.01162
G1 X119.39 Y33.874 E.25778
G1 X118.856 Y33.874 E.01641
G1 X125.085 Y40.103 E.27085
G2 X124.882 Y40.434 I1.552 J1.182 E.01195
G1 X118.323 Y33.874 E.28522
G1 X117.789 Y33.874 E.01641
G1 X124.711 Y40.796 E.30097
G2 X124.575 Y41.194 I1.919 J.877 E.01295
G1 X117.256 Y33.874 E.31828
G1 X116.722 Y33.874 E.01641
G1 X124.484 Y41.636 E.33752
G2 X124.453 Y42.139 I2.496 J.407 E.0155
G1 X116.188 Y33.874 E.35937
G1 X115.655 Y33.874 E.01641
G1 X124.502 Y42.721 E.3847
G2 X124.718 Y43.471 I3.629 J-.641 E.02405
G1 X115.121 Y33.874 E.41731
G1 X114.587 Y33.874 E.01641
G1 X131.089 Y50.376 E.71753
G1 X131.622 Y50.376 E.01641
G1 X126.654 Y45.407 E.21603
G2 X127.402 Y45.621 I1.355 J-3.321 E.02396
G1 X132.156 Y50.376 E.20672
G1 X132.689 Y50.376 E.01641
G1 X127.988 Y45.674 E.20445
G2 X128.486 Y45.639 I.076 J-2.513 E.0154
G1 X133.223 Y50.376 E.20596
G1 X133.757 Y50.376 E.01641
G1 X128.932 Y45.551 E.2098
G2 X129.331 Y45.416 I-1.918 J-6.341 E.01295
G1 X134.29 Y50.376 E.21565
G1 X134.824 Y50.376 E.01641
G1 X129.692 Y45.244 E.22314
G2 X130.022 Y45.04 I-.852 J-1.747 E.01194
G1 X135.358 Y50.376 E.232
G1 X135.891 Y50.376 E.01641
G1 X130.322 Y44.807 E.24216
G2 X130.594 Y44.545 I-1.173 J-1.488 E.01162
G1 X136.425 Y50.376 E.25355
G1 X136.958 Y50.376 E.01641
G1 X130.837 Y44.254 E.26618
G2 X131.051 Y43.935 I-1.493 J-1.232 E.01185
G1 X137.492 Y50.376 E.28007
G1 X138.026 Y50.376 E.01641
G1 X131.234 Y43.584 E.29531
G2 X131.384 Y43.2 I-1.848 J-.939 E.0127
G1 X138.559 Y50.376 E.31202
G1 X139.093 Y50.376 E.01641
G1 X131.49 Y42.772 E.33061
G2 X131.543 Y42.292 I-2.376 J-.508 E.01488
G1 X139.627 Y50.376 E.35149
G1 X140.16 Y50.376 E.01641
G1 X131.53 Y41.745 E.37527
G2 X131.392 Y41.074 I-5.05 J.686 E.02109
G1 X140.694 Y50.376 E.40446
G1 X141.227 Y50.376 E.01641
G1 X124.726 Y33.874 E.71753
G1 X125.26 Y33.874 E.01641
G1 X141.761 Y50.376 E.71753
G1 X142.295 Y50.376 E.01641
G1 X125.794 Y33.874 E.71753
G1 X126.327 Y33.874 E.01641
G1 X142.828 Y50.376 E.71753
G1 X143.362 Y50.376 E.01641
G1 X126.861 Y33.874 E.71753
G1 X127.394 Y33.874 E.01641
G1 X143.896 Y50.376 E.71753
G1 X144.429 Y50.376 E.01641
G1 X127.928 Y33.874 E.71753
G1 X128.462 Y33.874 E.01641
G1 X144.963 Y50.376 E.71753
G1 X145.496 Y50.376 E.01641
G1 X128.995 Y33.874 E.71753
G1 X129.529 Y33.874 E.01641
G1 X146.03 Y50.376 E.71753
G1 X146.564 Y50.376 E.01641
G1 X130.063 Y33.874 E.71753
G1 X130.596 Y33.874 E.01641
G1 X147.097 Y50.376 E.71753
G1 X147.631 Y50.376 E.01641
G1 X131.13 Y33.874 E.71753
G1 X131.663 Y33.874 E.01641
G1 X148.165 Y50.376 E.71753
G1 X148.698 Y50.376 E.01641
G1 X132.197 Y33.874 E.71753
G1 X132.731 Y33.874 E.01641
G1 X149.232 Y50.376 E.71753
G1 X149.765 Y50.376 E.01641
G1 X133.264 Y33.874 E.71753
G1 X133.798 Y33.874 E.01641
G1 X150.299 Y50.376 E.71753
G1 X150.833 Y50.376 E.01641
G1 X134.332 Y33.874 E.71753
G1 X134.865 Y33.874 E.01641
G1 X151.366 Y50.376 E.71753
G1 X151.9 Y50.376 E.01641
G1 X135.399 Y33.874 E.71753
G1 X135.932 Y33.874 E.01641
G1 X152.434 Y50.376 E.71753
G1 X152.967 Y50.376 E.01641
G1 X136.466 Y33.874 E.71753
G1 X137 Y33.874 E.01641
G1 X153.501 Y50.376 E.71753
G1 X154.034 Y50.376 E.01641
G1 X137.533 Y33.874 E.71753
G1 X138.067 Y33.874 E.01641
G1 X154.568 Y50.376 E.71753
G1 X155.102 Y50.376 E.01641
G1 X138.601 Y33.874 E.71753
G1 X139.134 Y33.874 E.01641
G1 X155.635 Y50.376 E.71753
G1 X156.169 Y50.376 E.01641
G1 X139.668 Y33.874 E.71753
G1 X140.201 Y33.874 E.01641
G1 X156.703 Y50.376 E.71753
G1 X157.236 Y50.376 E.01641
G1 X140.735 Y33.874 E.71753
G1 X141.269 Y33.874 E.01641
G1 X157.77 Y50.376 E.71753
G1 X158.303 Y50.376 E.01641
G1 X141.802 Y33.874 E.71753
G1 X142.336 Y33.874 E.01641
G1 X158.837 Y50.376 E.71753
G1 X159.371 Y50.376 E.01641
G1 X142.87 Y33.874 E.71753
G1 X143.403 Y33.874 E.01641
G1 X159.904 Y50.376 E.71753
G1 X160.438 Y50.376 E.01641
G1 X143.937 Y33.874 E.71753
G1 X144.47 Y33.874 E.01641
G1 X160.972 Y50.376 E.71753
G1 X161.505 Y50.376 E.01641
G1 X145.004 Y33.874 E.71753
G1 X145.538 Y33.874 E.01641
G1 X162.039 Y50.376 E.71753
G1 X162.572 Y50.376 E.01641
G1 X146.071 Y33.874 E.71753
G1 X146.605 Y33.874 E.01641
G1 X163.106 Y50.376 E.71753
G1 X163.64 Y50.376 E.01641
G1 X147.139 Y33.874 E.71753
G1 X147.672 Y33.874 E.01641
G1 X164.173 Y50.376 E.71753
G1 X164.707 Y50.376 E.01641
G1 X148.206 Y33.874 E.71753
G1 X148.739 Y33.874 E.01641
G1 X165.241 Y50.376 E.71753
G1 X165.774 Y50.376 E.01641
G1 X149.273 Y33.874 E.71753
G1 X149.807 Y33.874 E.01641
G1 X166.308 Y50.376 E.71753
G1 X166.841 Y50.376 E.01641
G1 X150.34 Y33.874 E.71753
G1 X150.874 Y33.874 E.01641
G1 X167.375 Y50.376 E.71753
G1 X167.909 Y50.376 E.01641
G1 X151.408 Y33.874 E.71753
G1 X151.941 Y33.874 E.01641
G1 X168.442 Y50.376 E.71753
G1 X168.976 Y50.376 E.01641
G1 X152.475 Y33.874 E.71753
G1 X153.008 Y33.874 E.01641
G1 X169.51 Y50.376 E.71753
G1 X170.043 Y50.376 E.01641
G1 X153.542 Y33.874 E.71753
G1 X154.076 Y33.874 E.01641
G1 X170.577 Y50.376 E.71753
G1 X171.11 Y50.376 E.01641
G1 X154.609 Y33.874 E.71753
G1 X155.143 Y33.874 E.01641
G1 X171.644 Y50.376 E.71753
G1 X172.178 Y50.376 E.01641
G1 X155.677 Y33.874 E.71753
G1 X156.21 Y33.874 E.01641
G1 X172.711 Y50.376 E.71753
G1 X173.245 Y50.376 E.01641
G1 X156.744 Y33.874 E.71753
G1 X157.277 Y33.874 E.01641
G1 X173.779 Y50.376 E.71753
G1 X174.312 Y50.376 E.01641
G1 X157.811 Y33.874 E.71753
G1 X158.345 Y33.874 E.01641
G1 X174.846 Y50.376 E.71753
G1 X175.379 Y50.376 E.01641
G1 X158.878 Y33.874 E.71753
G1 X159.412 Y33.874 E.01641
G1 X175.913 Y50.376 E.71753
G1 X176.447 Y50.376 E.01641
G1 X159.946 Y33.874 E.71753
G1 X160.479 Y33.874 E.01641
G1 X176.98 Y50.376 E.71753
G1 X177.514 Y50.376 E.01641
G1 X161.013 Y33.874 E.71753
G1 X161.546 Y33.874 E.01641
G1 X178.048 Y50.376 E.71753
G1 X178.581 Y50.376 E.01641
G1 X162.08 Y33.874 E.71753
G1 X162.614 Y33.874 E.01641
G1 X179.115 Y50.376 E.71753
G1 X179.648 Y50.376 E.01641
G1 X163.147 Y33.874 E.71753
G1 X163.681 Y33.874 E.01641
G1 X180.182 Y50.376 E.71753
G1 X180.716 Y50.376 E.01641
G1 X164.215 Y33.874 E.71753
G1 X164.748 Y33.874 E.01641
G1 X181.249 Y50.376 E.71753
G1 X181.783 Y50.376 E.01641
G1 X165.282 Y33.874 E.71753
G1 X165.815 Y33.874 E.01641
G1 X182.317 Y50.376 E.71753
G1 X182.85 Y50.376 E.01641
G1 X166.349 Y33.874 E.71753
G1 X166.883 Y33.874 E.01641
G1 X183.384 Y50.376 E.71753
G1 X183.917 Y50.376 E.01641
G1 X167.416 Y33.874 E.71753
G1 X167.95 Y33.874 E.01641
G1 X184.451 Y50.376 E.71753
G1 X184.985 Y50.376 E.01641
G1 X168.484 Y33.874 E.71753
G1 X169.017 Y33.874 E.01641
G1 X185.518 Y50.376 E.71753
G1 X186.052 Y50.376 E.01641
G1 X169.551 Y33.874 E.71753
G1 X170.084 Y33.874 E.01641
G1 X186.586 Y50.376 E.71753
G1 X187.119 Y50.376 E.01641
G1 X170.618 Y33.874 E.71753
G1 X171.152 Y33.874 E.01641
G1 X187.653 Y50.376 E.71753
G1 X188.186 Y50.376 E.01641
G1 X171.685 Y33.874 E.71753
G1 X172.219 Y33.874 E.01641
G1 X188.72 Y50.376 E.71753
G1 X189.254 Y50.376 E.01641
G1 X172.753 Y33.874 E.71753
G1 X173.286 Y33.874 E.01641
G1 X189.787 Y50.376 E.71753
G1 X190.321 Y50.376 E.01641
G1 X173.82 Y33.874 E.71753
G1 X174.353 Y33.874 E.01641
G1 X190.855 Y50.376 E.71753
G1 X191.388 Y50.376 E.01641
G1 X174.887 Y33.874 E.71753
G1 X175.421 Y33.874 E.01641
G1 X191.922 Y50.376 E.71753
G1 X192.455 Y50.376 E.01641
G1 X175.954 Y33.874 E.71753
G1 X176.488 Y33.874 E.01641
G1 X192.989 Y50.376 E.71753
G1 X193.523 Y50.376 E.01641
G1 X177.022 Y33.874 E.71753
G1 X177.555 Y33.874 E.01641
G1 X194.056 Y50.376 E.71753
G1 X194.59 Y50.376 E.01641
G1 X178.089 Y33.874 E.71753
G1 X178.622 Y33.874 E.01641
G1 X195.124 Y50.376 E.71753
G1 X195.657 Y50.376 E.01641
G1 X179.156 Y33.874 E.71753
G1 X179.69 Y33.874 E.01641
G1 X196.191 Y50.376 E.71753
G1 X196.724 Y50.376 E.01641
G1 X180.223 Y33.874 E.71753
G1 X180.757 Y33.874 E.01641
G1 X197.258 Y50.376 E.71753
G1 X197.792 Y50.376 E.01641
G1 X181.291 Y33.874 E.71753
G1 X181.824 Y33.874 E.01641
G1 X198.325 Y50.376 E.71753
G1 X198.859 Y50.376 E.01641
G1 X182.358 Y33.874 E.71753
G1 X182.891 Y33.874 E.01641
G1 X199.393 Y50.376 E.71753
G1 X199.926 Y50.376 E.01641
G1 X183.425 Y33.874 E.71753
G1 X183.959 Y33.874 E.01641
G1 X200.46 Y50.376 E.71753
G1 X200.993 Y50.376 E.01641
G1 X184.492 Y33.874 E.71753
G1 X185.026 Y33.874 E.01641
G1 X218.001 Y66.849 E1.43386
G1 X218.001 Y66.315 E.01641
G1 X185.56 Y33.874 E1.41065
G1 X186.093 Y33.874 E.01641
G1 X218.001 Y65.782 E1.38745
G1 X218.001 Y65.248 E.01641
G1 X186.627 Y33.874 E1.36424
G1 X187.16 Y33.874 E.01641
G1 X218.001 Y64.715 E1.34104
G1 X218.001 Y64.181 E.01641
G1 X187.694 Y33.874 E1.31784
G1 X188.228 Y33.874 E.01641
G1 X218.001 Y63.647 E1.29463
G1 X218.001 Y63.114 E.01641
G1 X188.761 Y33.874 E1.27143
G1 X189.295 Y33.874 E.01641
G1 X218.001 Y62.58 E1.24822
G1 X218.001 Y62.046 E.01641
G1 X189.829 Y33.874 E1.22502
G1 X190.362 Y33.874 E.01641
G1 X218.001 Y61.513 E1.20182
G1 X218.001 Y60.979 E.01641
G1 X190.896 Y33.874 E1.17861
G1 X191.429 Y33.874 E.01641
G1 X218.001 Y60.446 E1.15541
G1 X218.001 Y59.912 E.01641
G1 X191.963 Y33.874 E1.1322
G1 X192.497 Y33.874 E.01641
G1 X218.001 Y59.378 E1.109
G1 X218.001 Y58.845 E.01641
G1 X193.03 Y33.874 E1.0858
G1 X193.564 Y33.874 E.01641
G1 X218.001 Y58.311 E1.06259
G1 X218.001 Y57.777 E.01641
G1 X194.098 Y33.874 E1.03939
G1 X194.631 Y33.874 E.01641
G1 X218.001 Y57.244 E1.01618
G1 X218.001 Y56.71 E.01641
G1 X195.165 Y33.874 E.99298
G1 X195.698 Y33.874 E.01641
G1 X218.17 Y56.346 E.97715
G1 X218.17 Y67.552 F30000
G1 F15000
G1 X201.499 Y50.882 E.72491
G1 X201.499 Y51.415 E.01641
G1 X218.001 Y67.916 E.71753
G1 X218.001 Y68.45 E.01641
G1 X201.499 Y51.949 E.71753
G1 X201.499 Y52.482 E.01641
G1 X218.001 Y68.984 E.71753
G1 X218.001 Y69.517 E.01641
G1 X201.499 Y53.016 E.71753
G1 X201.499 Y53.55 E.01641
G1 X218.001 Y70.051 E.71753
G1 X218.001 Y70.584 E.01641
G1 X201.499 Y54.083 E.71753
G1 X201.499 Y54.617 E.01641
G1 X218.001 Y71.118 E.71753
G1 X218.001 Y71.652 E.01641
G1 X201.499 Y55.151 E.71753
G1 X201.499 Y55.684 E.01641
G1 X218.001 Y72.185 E.71753
G1 X218.001 Y72.719 E.01641
G1 X201.499 Y56.218 E.71753
G1 X201.499 Y56.751 E.01641
G1 X218.001 Y73.253 E.71753
G1 X218.001 Y73.786 E.01641
G1 X201.499 Y57.285 E.71753
G1 X201.499 Y57.819 E.01641
G1 X218.001 Y74.32 E.71753
G1 X218.001 Y74.853 E.01641
G1 X201.499 Y58.352 E.71753
G1 X201.499 Y58.886 E.01641
G1 X218.001 Y75.387 E.71753
G1 X218.001 Y75.921 E.01641
G1 X201.499 Y59.42 E.71753
G1 X201.499 Y59.953 E.01641
G1 X218.001 Y76.454 E.71753
G1 X218.001 Y76.988 E.01641
G1 X201.499 Y60.487 E.71753
G1 X201.499 Y61.02 E.01641
G1 X218.001 Y77.522 E.71753
G1 X218.001 Y78.055 E.01641
G1 X201.499 Y61.554 E.71753
G1 X201.499 Y62.088 E.01641
G1 X218.001 Y78.589 E.71753
G1 X218.001 Y79.122 E.01641
G1 X201.499 Y62.621 E.71753
G1 X201.499 Y63.155 E.01641
G1 X218.001 Y79.656 E.71753
G1 X218.001 Y80.19 E.01641
G1 X201.499 Y63.689 E.71753
G1 X201.499 Y64.222 E.01641
G1 X218.001 Y80.723 E.71753
G1 X218.001 Y81.257 E.01641
G1 X201.499 Y64.756 E.71753
G1 X201.499 Y65.289 E.01641
G1 X218.001 Y81.791 E.71753
G1 X218.001 Y82.324 E.01641
G1 X201.499 Y65.823 E.71753
G1 X201.499 Y66.357 E.01641
G1 X218.001 Y82.858 E.71753
G1 X218.001 Y83.391 E.01641
G1 X201.499 Y66.89 E.71753
G1 X201.499 Y67.424 E.01641
G1 X218.001 Y83.925 E.71753
G1 X218.001 Y84.459 E.01641
G1 X201.499 Y67.958 E.71753
G1 X201.499 Y68.491 E.01641
G1 X218.001 Y84.992 E.71753
G1 X218.001 Y85.526 E.01641
G1 X201.499 Y69.025 E.71753
G1 X201.499 Y69.558 E.01641
G1 X218.001 Y86.06 E.71753
G1 X218.001 Y86.593 E.01641
G1 X201.499 Y70.092 E.71753
G1 X201.499 Y70.626 E.01641
G1 X218.001 Y87.127 E.71753
G1 X218.001 Y87.66 E.01641
G1 X201.499 Y71.159 E.71753
G1 X201.499 Y71.693 E.01641
G1 X218.001 Y88.194 E.71753
G1 X218.001 Y88.728 E.01641
G1 X201.499 Y72.227 E.71753
G1 X201.499 Y72.76 E.01641
G1 X218.001 Y89.261 E.71753
G1 X218.001 Y89.795 E.01641
G1 X201.499 Y73.294 E.71753
G1 X201.499 Y73.827 E.01641
G1 X218.001 Y90.329 E.71753
G1 X218.001 Y90.862 E.01641
G1 X201.499 Y74.361 E.71753
G1 X201.499 Y74.895 E.01641
G1 X218.001 Y91.396 E.71753
G1 X218.001 Y91.929 E.01641
G1 X201.499 Y75.428 E.71753
G1 X201.499 Y75.962 E.01641
G1 X218.001 Y92.463 E.71753
G1 X218.001 Y92.997 E.01641
G1 X201.499 Y76.496 E.71753
G1 X201.499 Y77.029 E.01641
G1 X218.001 Y93.53 E.71753
G1 X218.001 Y94.064 E.01641
G1 X201.499 Y77.563 E.71753
G1 X201.499 Y78.096 E.01641
G1 X218.001 Y94.598 E.71753
G1 X218.001 Y95.131 E.01641
G1 X201.499 Y78.63 E.71753
G1 X201.499 Y79.164 E.01641
G1 X218.001 Y95.665 E.71753
G1 X218.001 Y96.198 E.01641
G1 X201.499 Y79.697 E.71753
G1 X201.499 Y80.231 E.01641
G1 X218.001 Y96.732 E.71753
G1 X218.001 Y97.266 E.01641
G1 X201.499 Y80.765 E.71753
G1 X201.499 Y81.298 E.01641
G1 X218.001 Y97.799 E.71753
G1 X218.001 Y98.333 E.01641
G1 X201.499 Y81.832 E.71753
G1 X201.499 Y82.365 E.01641
G1 X218.001 Y98.867 E.71753
G1 X218.001 Y99.4 E.01641
G1 X201.499 Y82.899 E.71753
G1 X201.499 Y83.433 E.01641
G1 X218.001 Y99.934 E.71753
G1 X218.001 Y100.467 E.01641
G1 X201.499 Y83.966 E.71753
G1 X201.499 Y84.5 E.01641
G1 X218.001 Y101.001 E.71753
G1 X218.001 Y101.535 E.01641
G1 X201.499 Y85.034 E.71753
G1 X201.499 Y85.567 E.01641
G1 X218.001 Y102.068 E.71753
G1 X218.001 Y102.602 E.01641
G1 X201.499 Y86.101 E.71753
G1 X201.499 Y86.634 E.01641
G1 X218.001 Y103.136 E.71753
G1 X218.001 Y103.669 E.01641
G1 X201.499 Y87.168 E.71753
G1 X201.499 Y87.702 E.01641
G1 X218.001 Y104.203 E.71753
G1 X218.001 Y104.736 E.01641
G1 X201.499 Y88.235 E.71753
G1 X201.499 Y88.769 E.01641
G1 X218.001 Y105.27 E.71753
G1 X218.001 Y105.804 E.01641
G1 X201.499 Y89.303 E.71753
G1 X201.499 Y89.836 E.01641
G1 X218.001 Y106.337 E.71753
G1 X218.001 Y106.871 E.01641
G1 X201.499 Y90.37 E.71753
G1 X201.499 Y90.903 E.01641
G1 X218.001 Y107.405 E.71753
G1 X218.001 Y107.938 E.01641
G1 X201.499 Y91.437 E.71753
G1 X201.499 Y91.971 E.01641
G1 X218.001 Y108.472 E.71753
G1 X218.001 Y109.005 E.01641
G1 X201.499 Y92.504 E.71753
G1 X201.499 Y93.038 E.01641
M73 P43 R33
G1 X218.001 Y109.539 E.71753
G1 X218.001 Y110.073 E.01641
G1 X201.499 Y93.572 E.71753
G1 X201.499 Y94.105 E.01641
G1 X218.001 Y110.606 E.71753
G1 X218.001 Y111.14 E.01641
G1 X201.499 Y94.639 E.71753
G1 X201.499 Y95.172 E.01641
G1 X218.001 Y111.674 E.71753
G1 X218.001 Y112.207 E.01641
G1 X201.499 Y95.706 E.71753
G1 X201.499 Y96.24 E.01641
G1 X218.001 Y112.741 E.71753
G1 X218.001 Y113.274 E.01641
G1 X201.499 Y96.773 E.71753
G1 X201.499 Y97.307 E.01641
G1 X218.001 Y113.808 E.71753
G1 X218.001 Y114.342 E.01641
G1 X201.499 Y97.841 E.71753
G1 X201.499 Y98.374 E.01641
G1 X218.001 Y114.875 E.71753
G1 X218.001 Y115.409 E.01641
G1 X201.499 Y98.908 E.71753
G1 X201.499 Y99.441 E.01641
G1 X218.001 Y115.943 E.71753
G1 X218.001 Y116.476 E.01641
G1 X201.499 Y99.975 E.71753
G1 X201.499 Y100.509 E.01641
G1 X218.001 Y117.01 E.71753
G1 X218.001 Y117.543 E.01641
G1 X201.499 Y101.042 E.71753
G1 X201.499 Y101.576 E.01641
G1 X218.001 Y118.077 E.71753
G1 X218.001 Y118.611 E.01641
G1 X201.499 Y102.11 E.71753
G1 X201.499 Y102.643 E.01641
G1 X218.001 Y119.144 E.71753
G1 X218.001 Y119.678 E.01641
G1 X201.499 Y103.177 E.71753
G1 X201.499 Y103.71 E.01641
G1 X218.001 Y120.212 E.71753
G1 X218.001 Y120.745 E.01641
G1 X201.499 Y104.244 E.71753
G1 X201.499 Y104.778 E.01641
G1 X218.001 Y121.279 E.71753
G1 X218.001 Y121.812 E.01641
G1 X201.499 Y105.311 E.71753
G1 X201.499 Y105.845 E.01641
G1 X218.001 Y122.346 E.71753
G1 X218.001 Y122.88 E.01641
G1 X201.499 Y106.379 E.71753
G1 X201.499 Y106.912 E.01641
G1 X218.001 Y123.413 E.71753
G1 X218.001 Y123.947 E.01641
G1 X201.499 Y107.446 E.71753
G1 X201.499 Y107.979 E.01641
G1 X218.001 Y124.481 E.71753
G1 X218.001 Y125.014 E.01641
G1 X201.499 Y108.513 E.71753
G1 X201.499 Y109.047 E.01641
G1 X218.001 Y125.548 E.71753
G1 X218.001 Y126.081 E.01641
G1 X201.499 Y109.58 E.71753
G1 X201.499 Y110.114 E.01641
G1 X218.001 Y126.615 E.71753
G1 X218.001 Y127.149 E.01641
G1 X201.499 Y110.648 E.71753
G1 X201.499 Y111.181 E.01641
G1 X218.001 Y127.682 E.71753
G1 X218.001 Y128.216 E.01641
G1 X201.499 Y111.715 E.71753
G1 X201.499 Y112.248 E.01641
G1 X218.001 Y128.75 E.71753
G1 X218.001 Y129.283 E.01641
G1 X201.499 Y112.782 E.71753
G1 X201.499 Y113.316 E.01641
G1 X210.792 Y122.608 E.40406
G2 X210.122 Y122.472 I-1.088 J3.633 E.02105
G1 X201.499 Y113.849 E.37493
G1 X201.499 Y114.383 E.01641
G1 X209.573 Y122.456 E.35105
G2 X209.099 Y122.516 I.155 J3.143 E.0147
G1 X201.499 Y114.917 E.33044
G1 X201.499 Y115.45 E.01641
G1 X208.669 Y122.619 E.31174
G2 X208.282 Y122.766 I2.537 J7.251 E.01272
G1 X201.499 Y115.984 E.29493
G1 X201.499 Y116.517 E.01641
G1 X207.933 Y122.951 E.27975
G2 X207.614 Y123.166 I.917 J1.701 E.01184
G1 X201.499 Y117.051 E.2659
G1 X201.499 Y117.585 E.01641
G1 X207.325 Y123.41 E.25331
G2 X207.064 Y123.683 I1.236 J1.445 E.01162
G1 X201.499 Y118.118 E.24196
G1 X201.499 Y118.652 E.01641
G1 X206.831 Y123.984 E.23185
G2 X206.629 Y124.315 I1.553 J1.179 E.01195
G1 X201.499 Y119.186 E.22303
G1 X201.499 Y119.719 E.01641
G1 X206.458 Y124.678 E.21561
G2 X206.323 Y125.076 I1.923 J.874 E.01296
G1 X201.499 Y120.253 E.20974
G1 X201.499 Y120.786 E.01641
G1 X206.233 Y125.52 E.20583
G2 X206.203 Y126.023 I2.501 J.403 E.01553
G1 X201.499 Y121.32 E.20452
G1 X201.499 Y121.854 E.01641
G1 X206.254 Y126.608 E.20674
G2 X206.475 Y127.363 I3.589 J-.641 E.02422
G1 X201.499 Y122.387 E.21635
G1 X201.499 Y122.921 E.01641
G1 X218.001 Y139.422 E.71753
G1 X218.001 Y138.888 E.01641
G1 X208.388 Y129.276 E.41797
G2 X209.14 Y129.494 I1.374 J-3.328 E.02412
G1 X218.001 Y138.355 E.38528
G1 X218.001 Y137.821 E.01641
G1 X209.728 Y129.549 E.35971
G2 X210.228 Y129.515 I.081 J-2.515 E.01543
G1 X218.001 Y137.288 E.33798
G1 X218.001 Y136.754 E.01641
G1 X210.674 Y129.428 E.31858
G2 X211.074 Y129.294 I-1.888 J-6.329 E.01297
G1 X218.001 Y136.22 E.30118
G1 X218.001 Y135.687 E.01641
G1 X211.436 Y129.122 E.28544
G2 X211.767 Y128.919 I-.849 J-1.75 E.01195
G1 X218.001 Y135.153 E.27108
G1 X218.001 Y134.619 E.01641
G1 X212.067 Y128.686 E.258
G2 X212.339 Y128.425 I-1.17 J-1.49 E.01162
G1 X218.001 Y134.086 E.24617
G1 X218.001 Y133.552 E.01641
G1 X212.583 Y128.135 E.23557
G2 X212.798 Y127.816 I-1.49 J-1.234 E.01184
G1 X218.001 Y133.019 E.22624
G1 X218.001 Y132.485 E.01641
G1 X212.981 Y127.466 E.21826
G2 X213.131 Y127.082 I-1.842 J-.94 E.01269
G1 X218.001 Y131.951 E.21174
G1 X218.001 Y131.418 E.01641
G1 X213.238 Y126.656 E.20707
G2 X213.293 Y126.176 I-2.371 J-.512 E.01486
G1 X218.001 Y130.884 E.20471
G1 X218.001 Y130.35 E.01641
G1 X213.282 Y125.632 E.20519
G2 X213.146 Y124.962 I-3.404 J.341 E.02103
G1 X218.17 Y129.986 E.21846
G1 X218.17 Y140.125 F30000
G1 F15000
G1 X201.499 Y123.455 E.72491
G1 X201.499 Y123.988 E.01641
G1 X218.001 Y140.489 E.71753
G1 X218.001 Y141.023 E.01641
G1 X201.499 Y124.522 E.71753
G1 X201.499 Y125.055 E.01641
G1 X218.001 Y141.557 E.71753
G1 X218.001 Y142.09 E.01641
G1 X201.499 Y125.589 E.71753
G1 X201.499 Y126.123 E.01641
G1 X218.001 Y142.624 E.71753
G1 X218.001 Y143.157 E.01641
M73 P43 R32
G1 X201.499 Y126.656 E.71753
G1 X201.499 Y127.19 E.01641
G1 X218.001 Y143.691 E.71753
G1 X218.001 Y144.225 E.01641
G1 X201.499 Y127.724 E.71753
G1 X201.499 Y128.257 E.01641
G1 X218.001 Y144.758 E.71753
G1 X218.001 Y145.292 E.01641
G1 X201.499 Y128.791 E.71753
G1 X201.499 Y129.324 E.01641
G1 X218.001 Y145.826 E.71753
G1 X218.001 Y146.359 E.01641
G1 X201.499 Y129.858 E.71753
G1 X201.499 Y130.392 E.01641
G1 X218.001 Y146.893 E.71753
G1 X218.001 Y147.426 E.01641
G1 X201.499 Y130.925 E.71753
G1 X201.499 Y131.459 E.01641
G1 X218.001 Y147.96 E.71753
G1 X218.001 Y148.494 E.01641
G1 X201.499 Y131.993 E.71753
G1 X201.499 Y132.526 E.01641
G1 X218.001 Y149.027 E.71753
G1 X218.001 Y149.561 E.01641
G1 X201.499 Y133.06 E.71753
G1 X201.499 Y133.593 E.01641
G1 X218.001 Y150.095 E.71753
G1 X218.001 Y150.628 E.01641
G1 X201.499 Y134.127 E.71753
G1 X201.499 Y134.661 E.01641
G1 X218.001 Y151.162 E.71753
G1 X218.001 Y151.695 E.01641
G1 X201.499 Y135.194 E.71753
G1 X201.499 Y135.728 E.01641
G1 X218.001 Y152.229 E.71753
G1 X218.001 Y152.763 E.01641
G1 X201.499 Y136.262 E.71753
G1 X201.499 Y136.795 E.01641
G1 X218.001 Y153.296 E.71753
G1 X218.001 Y153.83 E.01641
G1 X201.499 Y137.329 E.71753
G1 X201.499 Y137.862 E.01641
G1 X218.001 Y154.364 E.71753
G1 X218.001 Y154.897 E.01641
G1 X201.499 Y138.396 E.71753
G1 X201.499 Y138.93 E.01641
G1 X218.001 Y155.431 E.71753
G1 X218.001 Y155.964 E.01641
G1 X201.499 Y139.463 E.71753
G1 X201.499 Y139.997 E.01641
G1 X218.001 Y156.498 E.71753
G1 X218.001 Y157.032 E.01641
G1 X201.499 Y140.531 E.71753
G1 X201.499 Y141.064 E.01641
G1 X218.001 Y157.565 E.71753
G1 X218.001 Y158.099 E.01641
G1 X201.499 Y141.598 E.71753
G1 X201.499 Y142.131 E.01641
G1 X218.001 Y158.633 E.71753
G1 X218.001 Y159.166 E.01641
G1 X201.499 Y142.665 E.71753
G1 X201.499 Y143.199 E.01641
G1 X218.001 Y159.7 E.71753
G1 X218.001 Y160.233 E.01641
G1 X201.499 Y143.732 E.71753
G1 X201.499 Y144.266 E.01641
G1 X218.001 Y160.767 E.71753
G1 X218.001 Y161.301 E.01641
G1 X201.499 Y144.8 E.71753
G1 X201.499 Y145.333 E.01641
G1 X218.001 Y161.834 E.71753
G1 X218.001 Y162.368 E.01641
G1 X201.499 Y145.867 E.71753
G1 X201.499 Y146.4 E.01641
G1 X218.001 Y162.902 E.71753
G1 X218.001 Y163.435 E.01641
G1 X201.499 Y146.934 E.71753
G1 X201.499 Y147.468 E.01641
G1 X218.001 Y163.969 E.71753
G1 X218.001 Y164.502 E.01641
G1 X201.499 Y148.001 E.71753
G1 X201.499 Y148.535 E.01641
G1 X218.001 Y165.036 E.71753
G1 X218.001 Y165.57 E.01641
G1 X201.499 Y149.069 E.71753
G1 X201.499 Y149.602 E.01641
G1 X218.001 Y166.103 E.71753
G1 X218.001 Y166.637 E.01641
G1 X201.499 Y150.136 E.71753
G1 X201.499 Y150.67 E.01641
G1 X218.001 Y167.171 E.71753
G1 X218.001 Y167.704 E.01641
G1 X201.499 Y151.203 E.71753
G1 X201.499 Y151.737 E.01641
G1 X218.001 Y168.238 E.71753
G1 X218.001 Y168.771 E.01641
G1 X201.499 Y152.27 E.71753
G1 X201.499 Y152.804 E.01641
G1 X218.001 Y169.305 E.71753
G1 X218.001 Y169.839 E.01641
G1 X201.499 Y153.338 E.71753
G1 X201.499 Y153.871 E.01641
G1 X218.001 Y170.372 E.71753
G1 X218.001 Y170.906 E.01641
G1 X201.499 Y154.405 E.71753
G1 X201.499 Y154.939 E.01641
G1 X218.001 Y171.44 E.71753
G1 X218.001 Y171.973 E.01641
G1 X201.499 Y155.472 E.71753
G1 X201.499 Y156.006 E.01641
G1 X218.001 Y172.507 E.71753
G1 X218.001 Y173.04 E.01641
G1 X201.499 Y156.539 E.71753
G1 X201.499 Y157.073 E.01641
G1 X218.001 Y173.574 E.71753
G1 X218.001 Y174.108 E.01641
G1 X201.499 Y157.607 E.71753
G1 X201.499 Y158.14 E.01641
G1 X218.001 Y174.641 E.71753
G1 X218.001 Y175.175 E.01641
G1 X201.499 Y158.674 E.71753
G1 X201.499 Y159.208 E.01641
G1 X218.001 Y175.709 E.71753
G1 X218.001 Y176.242 E.01641
G1 X201.499 Y159.741 E.71753
G1 X201.499 Y160.275 E.01641
G1 X218.001 Y176.776 E.71753
G1 X218.001 Y177.309 E.01641
G1 X201.499 Y160.808 E.71753
G1 X201.499 Y161.342 E.01641
G1 X218.001 Y177.843 E.71753
G1 X218.001 Y178.377 E.01641
G1 X201.499 Y161.876 E.71753
G1 X201.499 Y162.409 E.01641
G1 X218.001 Y178.91 E.71753
G1 X218.001 Y179.444 E.01641
G1 X201.499 Y162.943 E.71753
G1 X201.499 Y163.477 E.01641
G1 X218.001 Y179.978 E.71753
G1 X218.001 Y180.511 E.01641
G1 X201.499 Y164.01 E.71753
G1 X201.499 Y164.544 E.01641
G1 X218.001 Y181.045 E.71753
G1 X218.001 Y181.578 E.01641
G1 X201.499 Y165.077 E.71753
G1 X201.499 Y165.611 E.01641
G1 X218.001 Y182.112 E.71753
G1 X218.001 Y182.646 E.01641
G1 X201.499 Y166.145 E.71753
G1 X201.499 Y166.678 E.01641
G1 X218.001 Y183.179 E.71753
G1 X218.001 Y183.713 E.01641
G1 X201.499 Y167.212 E.71753
G1 X201.499 Y167.746 E.01641
G1 X218.001 Y184.247 E.71753
G1 X218.001 Y184.78 E.01641
G1 X201.499 Y168.279 E.71753
G1 X201.499 Y168.813 E.01641
G1 X218.001 Y185.314 E.71753
G1 X218.001 Y185.847 E.01641
G1 X201.499 Y169.346 E.71753
G1 X201.499 Y169.88 E.01641
G1 X218.001 Y186.381 E.71753
G1 X218.001 Y186.915 E.01641
G1 X201.499 Y170.414 E.71753
G1 X201.499 Y170.947 E.01641
G1 X218.001 Y187.448 E.71753
G1 X218.001 Y187.982 E.01641
G1 X201.499 Y171.481 E.71753
G1 X201.499 Y172.015 E.01641
G1 X218.001 Y188.516 E.71753
G1 X218.001 Y189.049 E.01641
G1 X201.499 Y172.548 E.71753
G1 X201.499 Y173.082 E.01641
G1 X218.001 Y189.583 E.71753
G1 X218.001 Y190.116 E.01641
G1 X201.499 Y173.615 E.71753
G1 X201.499 Y174.149 E.01641
G1 X218.001 Y190.65 E.71753
G1 X218.001 Y191.184 E.01641
G1 X201.499 Y174.683 E.71753
G1 X201.499 Y175.216 E.01641
G1 X218.001 Y191.717 E.71753
G1 X218.001 Y192.251 E.01641
G1 X201.499 Y175.75 E.71753
G1 X201.499 Y176.284 E.01641
G1 X218.001 Y192.785 E.71753
G1 X218.001 Y193.318 E.01641
G1 X201.499 Y176.817 E.71753
G1 X201.499 Y177.351 E.01641
G1 X218.001 Y193.852 E.71753
G1 X218.001 Y194.385 E.01641
G1 X201.499 Y177.884 E.71753
G1 X201.499 Y178.418 E.01641
G1 X218.001 Y194.919 E.71753
G1 X218.001 Y195.453 E.01641
G1 X201.499 Y178.952 E.71753
G1 X201.499 Y179.485 E.01641
G1 X218.001 Y195.986 E.71753
G1 X218.001 Y196.52 E.01641
G1 X201.499 Y180.019 E.71753
G1 X201.499 Y180.553 E.01641
G1 X218.001 Y197.054 E.71753
G1 X218.001 Y197.587 E.01641
G1 X201.499 Y181.086 E.71753
G1 X201.499 Y181.62 E.01641
G1 X218.001 Y198.121 E.71753
G1 X218.001 Y198.654 E.01641
G1 X201.499 Y182.153 E.71753
G1 X201.499 Y182.687 E.01641
G1 X218.001 Y199.188 E.71753
G1 X218.001 Y199.722 E.01641
G1 X201.499 Y183.221 E.71753
G1 X201.499 Y183.754 E.01641
G1 X218.001 Y200.255 E.71753
G1 X218.001 Y200.789 E.01641
G1 X201.499 Y184.288 E.71753
G1 X201.499 Y184.822 E.01641
G1 X218.001 Y201.323 E.71753
G1 X218.001 Y201.856 E.01641
G1 X201.499 Y185.355 E.71753
G1 X201.499 Y185.889 E.01641
G1 X218.001 Y202.39 E.71753
G1 X218.001 Y202.923 E.01641
G1 X201.499 Y186.422 E.71753
G1 X201.499 Y186.956 E.01641
G1 X218.001 Y203.457 E.71753
G1 X218.001 Y203.991 E.01641
G1 X201.499 Y187.49 E.71753
G1 X201.499 Y188.023 E.01641
G1 X218.001 Y204.524 E.71753
G1 X218.001 Y205.058 E.01641
G1 X201.499 Y188.557 E.71753
G1 X201.499 Y189.091 E.01641
G1 X218.001 Y205.592 E.71753
G1 X218.001 Y206.125 E.01641
G1 X201.499 Y189.624 E.71753
G1 X201.499 Y190.158 E.01641
G1 X218.001 Y206.659 E.71753
G1 X218.001 Y207.192 E.01641
G1 X201.499 Y190.691 E.71753
G1 X201.499 Y191.225 E.01641
G1 X218.001 Y207.726 E.71753
G1 X218.001 Y208.26 E.01641
G1 X201.499 Y191.759 E.71753
G1 X201.499 Y192.292 E.01641
G1 X218.001 Y208.793 E.71753
G1 X218.001 Y209.327 E.01641
G1 X201.499 Y192.826 E.71753
G1 X201.499 Y193.36 E.01641
G1 X218.001 Y209.861 E.71753
G1 X218.001 Y210.394 E.01641
G1 X201.499 Y193.893 E.71753
G1 X201.499 Y194.427 E.01641
G1 X218.001 Y210.928 E.71753
G1 X218.001 Y211.461 E.01641
G1 X201.499 Y194.96 E.71753
G1 X201.499 Y195.494 E.01641
G1 X218.001 Y211.995 E.71753
G1 X218.001 Y212.529 E.01641
G1 X201.499 Y196.028 E.71753
G1 X201.499 Y196.561 E.01641
G1 X218.001 Y213.062 E.71753
G1 X218.001 Y213.596 E.01641
G1 X213.093 Y208.688 E.2134
G3 X213.265 Y209.394 I-3.38 J1.197 E.02236
G1 X218.001 Y214.13 E.20593
G1 X218.001 Y214.663 E.01641
G1 X213.297 Y209.96 E.20451
G3 X213.251 Y210.447 I-2.464 J.011 E.01507
G1 X218.001 Y215.197 E.20653
G1 X218.001 Y215.73 E.01641
G1 X213.154 Y210.884 E.21076
G3 X213.012 Y211.276 I-6.641 J-2.167 E.01283
G1 X218.001 Y216.264 E.2169
G1 X218.001 Y216.798 E.01641
G1 X212.834 Y211.631 E.22466
G3 X212.624 Y211.955 I-1.723 J-.885 E.01189
G1 X218.001 Y217.331 E.23378
G1 X218.001 Y217.865 E.01641
G1 X212.385 Y212.25 E.24417
G3 X212.118 Y212.516 I-1.464 J-1.202 E.01162
G1 X217.727 Y218.126 E.24392
G1 X217.194 Y218.126 E.01641
G1 X211.822 Y212.754 E.23358
G3 X211.497 Y212.962 I-1.206 J-1.524 E.0119
G1 X216.66 Y218.126 E.22452
G1 X216.127 Y218.126 E.01641
G1 X211.14 Y213.139 E.21682
G3 X210.749 Y213.281 I-.907 J-1.887 E.01283
G1 X215.593 Y218.126 E.21064
G1 X215.059 Y218.126 E.01641
G1 X210.313 Y213.379 E.20638
G3 X209.822 Y213.422 I-.457 J-2.437 E.01519
G1 X214.526 Y218.126 E.20455
G1 X213.992 Y218.126 E.01641
G1 X209.256 Y213.39 E.20592
G3 X208.546 Y213.213 I.588 J-3.878 E.02254
G1 X213.458 Y218.126 E.21361
G1 X212.925 Y218.126 E.01641
G1 X196.424 Y201.624 E.71753
G1 X196.957 Y201.624 E.01641
G1 X206.408 Y211.075 E.41095
G3 X206.234 Y210.368 I4.187 J-1.403 E.02242
G1 X197.491 Y201.624 E.38019
G1 X198.025 Y201.624 E.01641
G1 X206.203 Y209.803 E.35562
G3 X206.245 Y209.311 I4.603 J.148 E.01517
G1 X198.558 Y201.624 E.33425
G1 X199.092 Y201.624 E.01641
G1 X206.345 Y208.878 E.31541
G3 X206.486 Y208.485 I2.036 J.509 E.01285
G1 X199.626 Y201.624 E.29833
G1 X200.159 Y201.624 E.01641
G1 X206.662 Y208.128 E.28279
G3 X206.87 Y207.802 I1.732 J.875 E.0119
G1 X200.693 Y201.624 E.26862
G1 X201.226 Y201.624 E.01641
G1 X207.108 Y207.506 E.25573
G3 X207.373 Y207.238 I1.471 J1.195 E.01162
G1 X201.499 Y201.364 E.25542
G1 X201.499 Y200.83 E.01641
G1 X207.668 Y206.998 E.26822
G3 X207.993 Y206.79 I6.433 J9.656 E.01187
G1 X201.499 Y200.297 E.28234
G1 X201.499 Y199.763 E.01641
G1 X208.35 Y206.614 E.29789
G3 X208.743 Y206.473 I.9 J1.899 E.01286
G1 X201.499 Y199.229 E.31499
G1 X201.499 Y198.696 E.01641
G1 X209.182 Y206.378 E.33406
G3 X209.662 Y206.324 I.782 J4.815 E.01485
G1 X201.499 Y198.162 E.35493
G1 X201.499 Y197.629 E.01641
G1 X210.231 Y206.36 E.37969
G3 X210.936 Y206.531 I-.496 J3.581 E.02233
G1 X201.33 Y196.925 E.41771
; WIPE_START
G1 X202.744 Y198.339 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X195.198 Y199.484 Z1 F30000
G1 X71.15 Y218.295 Z1
G1 Z.6
G1 E.8 F1800
G1 F15000
G1 X37.999 Y185.144 E1.44152
G1 X37.999 Y185.678 E.01641
G1 X70.447 Y218.126 E1.41094
G1 X69.913 Y218.126 E.01641
G1 X37.999 Y186.212 E1.38773
G1 X37.999 Y186.745 E.01641
G1 X69.38 Y218.126 E1.36453
G1 X68.846 Y218.126 E.01641
G1 X37.999 Y187.279 E1.34132
G1 X37.999 Y187.813 E.01641
G1 X68.312 Y218.126 E1.31812
G1 X67.779 Y218.126 E.01641
G1 X37.999 Y188.346 E1.29492
G1 X37.999 Y188.88 E.01641
G1 X67.245 Y218.126 E1.27171
G1 X66.712 Y218.126 E.01641
G1 X37.999 Y189.413 E1.24851
G1 X37.999 Y189.947 E.01641
G1 X66.178 Y218.126 E1.2253
G1 X65.644 Y218.126 E.01641
G1 X37.999 Y190.481 E1.2021
G1 X37.999 Y191.014 E.01641
G1 X65.111 Y218.126 E1.1789
G1 X64.577 Y218.126 E.01641
G1 X37.999 Y191.548 E1.15569
G1 X37.999 Y192.082 E.01641
G1 X64.043 Y218.126 E1.13249
G1 X63.51 Y218.126 E.01641
G1 X37.999 Y192.615 E1.10928
G1 X37.999 Y193.149 E.01641
G1 X62.976 Y218.126 E1.08608
G1 X62.443 Y218.126 E.01641
G1 X37.999 Y193.682 E1.06288
G1 X37.999 Y194.216 E.01641
G1 X61.909 Y218.126 E1.03967
G1 X61.375 Y218.126 E.01641
G1 X37.999 Y194.75 E1.01647
G1 X37.999 Y195.283 E.01641
G1 X60.842 Y218.126 E.99326
G1 X60.308 Y218.126 E.01641
G1 X37.999 Y195.817 E.97006
G1 X37.999 Y196.351 E.01641
G1 X59.774 Y218.126 E.94686
G1 X59.241 Y218.126 E.01641
G1 X49.441 Y208.326 E.42613
G3 X49.724 Y209.142 I-3.364 J1.622 E.02663
G1 X58.707 Y218.126 E.39063
G1 X58.174 Y218.126 E.01641
G1 X49.795 Y209.747 E.36432
G3 X49.779 Y210.264 I-4.402 J.117 E.01591
G1 X57.64 Y218.126 E.34184
G1 X57.106 Y218.126 E.01641
G1 X49.696 Y210.716 E.32221
G3 X49.571 Y211.123 I-2.103 J-.426 E.01314
G1 X56.573 Y218.126 E.30448
G1 X56.039 Y218.126 E.01641
G1 X49.407 Y211.494 E.28837
G3 X49.211 Y211.832 I-1.787 J-.812 E.01202
G1 X55.505 Y218.126 E.27368
G1 X54.972 Y218.126 E.01641
G1 X48.985 Y212.139 E.26032
G3 X48.73 Y212.417 I-1.518 J-1.134 E.01163
G1 X54.438 Y218.126 E.24821
G1 X53.905 Y218.126 E.01641
G1 X48.445 Y212.666 E.23741
G3 X48.131 Y212.885 I-1.254 J-1.462 E.0118
G1 X53.371 Y218.126 E.22787
G1 X52.837 Y218.126 E.01641
G1 X47.786 Y213.074 E.21967
G3 X47.407 Y213.228 I-.965 J-1.822 E.01261
G1 X52.304 Y218.126 E.21294
G1 X51.77 Y218.126 E.01641
G1 X46.989 Y213.345 E.20789
G3 X46.526 Y213.415 I-.585 J-2.279 E.01442
G1 X51.236 Y218.126 E.20482
G1 X50.703 Y218.126 E.01641
G1 X45.99 Y213.413 E.20493
G3 X45.351 Y213.307 I.271 J-3.621 E.01995
G1 X50.169 Y218.126 E.20953
G1 X49.636 Y218.126 E.01641
G1 X37.999 Y206.489 E.50598
G1 X37.999 Y205.956 E.01641
M73 P44 R32
G1 X42.814 Y210.77 E.20936
G3 X42.711 Y210.134 I4.462 J-1.049 E.01985
G1 X37.999 Y205.422 E.20487
G1 X37.999 Y204.889 E.01641
G1 X42.712 Y209.602 E.20494
G3 X42.78 Y209.136 I2.363 J.107 E.01449
G1 X37.999 Y204.355 E.20789
G1 X37.999 Y203.821 E.01641
G1 X42.895 Y208.717 E.21288
G3 X43.049 Y208.337 I1.982 J.581 E.01262
G1 X37.999 Y203.288 E.21956
G1 X37.999 Y202.754 E.01641
G1 X43.239 Y207.994 E.22785
G3 X43.46 Y207.681 I1.67 J.945 E.01179
G1 X37.999 Y202.22 E.23745
G1 X37.999 Y201.687 E.01641
G1 X43.71 Y207.397 E.24831
G3 X43.988 Y207.142 I1.415 J1.26 E.01163
G1 X37.999 Y201.153 E.26041
G1 X37.999 Y200.62 E.01641
G1 X44.295 Y206.915 E.27375
G3 X44.632 Y206.718 I1.152 J1.586 E.01202
G1 X37.999 Y200.086 E.2884
G1 X37.999 Y199.552 E.01641
G1 X45.001 Y206.554 E.30447
G3 X45.408 Y206.427 I.84 J1.968 E.01311
G1 X37.999 Y199.019 E.32214
G1 X37.999 Y198.485 E.01641
G1 X45.865 Y206.35 E.34201
G3 X46.378 Y206.33 I.378 J3.02 E.01581
G1 X37.999 Y197.951 E.36432
G1 X37.999 Y197.418 E.01641
G1 X46.986 Y206.405 E.39078
G3 X47.796 Y206.681 I-.772 J3.586 E.02638
G1 X37.83 Y196.715 E.43338
G1 X37.83 Y217.526 F30000
G1 F15000
G1 X38.429 Y218.126 E.02607
G1 X38.963 Y218.126 E.01641
G1 X37.999 Y217.162 E.0419
G1 X37.999 Y216.628 E.01641
G1 X39.497 Y218.126 E.0651
G1 X40.03 Y218.126 E.01641
G1 X37.999 Y216.095 E.08831
G1 X37.999 Y215.561 E.01641
G1 X40.564 Y218.126 E.11151
G1 X41.098 Y218.126 E.01641
G1 X37.999 Y215.027 E.13472
G1 X37.999 Y214.494 E.01641
G1 X41.631 Y218.126 E.15792
G1 X42.165 Y218.126 E.01641
G1 X37.999 Y213.96 E.18112
G1 X37.999 Y213.427 E.01641
G1 X42.698 Y218.126 E.20433
G1 X43.232 Y218.126 E.01641
G1 X37.999 Y212.893 E.22753
G1 X37.999 Y212.359 E.01641
G1 X43.766 Y218.126 E.25074
G1 X44.299 Y218.126 E.01641
G1 X37.999 Y211.826 E.27394
G1 X37.999 Y211.292 E.01641
G1 X44.833 Y218.126 E.29714
G1 X45.367 Y218.126 E.01641
G1 X37.999 Y210.758 E.32035
G1 X37.999 Y210.225 E.01641
G1 X45.9 Y218.126 E.34355
G1 X46.434 Y218.126 E.01641
G1 X37.999 Y209.691 E.36676
G1 X37.999 Y209.158 E.01641
G1 X46.967 Y218.126 E.38996
G1 X47.501 Y218.126 E.01641
G1 X37.999 Y208.624 E.41316
G1 X37.999 Y208.09 E.01641
G1 X48.035 Y218.126 E.43637
G1 X48.568 Y218.126 E.01641
G1 X37.999 Y207.557 E.45957
G1 X37.999 Y207.023 E.01641
G1 X49.272 Y218.295 E.49015
; WIPE_START
G1 X47.857 Y216.881 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X52.839 Y211.099 Z1 F30000
G1 X205.668 Y33.705 Z1
G1 Z.6
G1 E.8 F1800
G1 F15000
G1 X210.656 Y38.693 E.21692
G2 X210.012 Y38.583 I-1.181 J4.964 E.0201
G1 X205.304 Y33.874 E.20475
G1 X204.77 Y33.874 E.01641
G1 X209.483 Y38.588 E.20495
G2 X209.015 Y38.653 I.198 J3.109 E.01454
G1 X204.236 Y33.874 E.20781
G1 X203.703 Y33.874 E.01641
G1 X208.596 Y38.767 E.21276
G2 X208.219 Y38.924 I.592 J1.96 E.01258
G1 X203.169 Y33.874 E.21957
G1 X202.636 Y33.874 E.01641
G1 X207.875 Y39.113 E.22781
G2 X207.561 Y39.334 I.943 J1.678 E.0118
G1 X202.102 Y33.874 E.23738
G1 X201.568 Y33.874 E.01641
G1 X207.276 Y39.583 E.24821
G2 X207.02 Y39.86 I1.258 J1.42 E.01163
G1 X201.035 Y33.874 E.26027
G1 X200.501 Y33.874 E.01641
G1 X206.792 Y40.166 E.27357
G2 X206.595 Y40.502 I1.583 J1.157 E.01201
G1 X199.967 Y33.874 E.28818
G1 X199.434 Y33.874 E.01641
G1 X206.429 Y40.87 E.3042
G2 X206.302 Y41.277 I5.981 J2.091 E.0131
G1 X198.9 Y33.874 E.32188
G1 X198.367 Y33.874 E.01641
G1 X206.224 Y41.732 E.34169
G2 X206.203 Y42.244 I2.549 J.364 E.01578
G1 X197.833 Y33.874 E.36395
G1 X197.299 Y33.874 E.01641
G1 X206.278 Y42.853 E.39044
G2 X206.545 Y43.654 I3.705 J-.79 E.02599
G1 X196.766 Y33.874 E.42523
G1 X196.232 Y33.874 E.01641
G1 X218.001 Y55.643 E.94657
G1 X218.001 Y55.109 E.01641
G1 X208.216 Y45.325 E.42546
G2 X209.024 Y45.599 I1.241 J-2.332 E.02634
G1 X218.001 Y54.576 E.39034
G1 X218.001 Y54.042 E.01641
G1 X209.632 Y45.673 E.3639
G2 X210.143 Y45.651 I.055 J-4.54 E.01574
G1 X218.001 Y53.508 E.34168
G1 X218.001 Y52.975 E.01641
G1 X210.596 Y45.57 E.32197
G2 X211.005 Y45.445 I-.418 J-2.101 E.01316
G1 X218.001 Y52.441 E.3042
G1 X218.001 Y51.908 E.01641
G1 X211.375 Y45.282 E.28808
G2 X211.711 Y45.084 I-.82 J-1.769 E.012
G1 X218.001 Y51.374 E.2735
G1 X218.001 Y50.84 E.01641
G1 X212.016 Y44.856 E.26022
G2 X212.293 Y44.599 I-1.146 J-1.513 E.01163
G1 X218.001 Y50.307 E.24818
G1 X218.001 Y49.773 E.01641
G1 X212.542 Y44.314 E.23737
G2 X212.761 Y44 I-1.463 J-1.256 E.0118
G1 X218.001 Y49.239 E.22782
G1 X218.001 Y48.706 E.01641
G1 X212.95 Y43.655 E.21961
G2 X213.106 Y43.277 I-1.81 J-.965 E.01259
G1 X218.001 Y48.172 E.21285
G1 X218.001 Y47.639 E.01641
G1 X213.223 Y42.861 E.20774
G2 X213.288 Y42.393 I-4.805 J-.908 E.01455
G1 X218.001 Y47.105 E.20491
G1 X218.001 Y46.571 E.01641
G1 X213.288 Y41.859 E.2049
G2 X213.179 Y41.216 I-3.728 J.303 E.02008
G1 X218.001 Y46.038 E.20966
G1 X218.001 Y45.504 E.01641
G1 X206.371 Y33.874 E.5057
G1 X206.905 Y33.874 E.01641
G1 X218.001 Y44.97 E.48249
G1 X218.001 Y44.437 E.01641
G1 X207.438 Y33.874 E.45929
G1 X207.972 Y33.874 E.01641
G1 X218.001 Y43.903 E.43608
G1 X218.001 Y43.37 E.01641
G1 X208.505 Y33.874 E.41288
G1 X209.039 Y33.874 E.01641
G1 X218.001 Y42.836 E.38968
G1 X218.001 Y42.302 E.01641
G1 X209.573 Y33.874 E.36647
G1 X210.106 Y33.874 E.01641
G1 X218.001 Y41.769 E.34327
G1 X218.001 Y41.235 E.01641
G1 X210.64 Y33.874 E.32006
G1 X211.174 Y33.874 E.01641
G1 X218.001 Y40.701 E.29686
G1 X218.001 Y40.168 E.01641
G1 X211.707 Y33.874 E.27366
G1 X212.241 Y33.874 E.01641
G1 X218.001 Y39.634 E.25045
G1 X218.001 Y39.101 E.01641
G1 X212.774 Y33.874 E.22725
G1 X213.308 Y33.874 E.01641
G1 X218.001 Y38.567 E.20404
G1 X218.001 Y38.033 E.01641
G1 X213.842 Y33.874 E.18084
G1 X214.375 Y33.874 E.01641
G1 X218.001 Y37.5 E.15764
G1 X218.001 Y36.966 E.01641
G1 X214.909 Y33.874 E.13443
G1 X215.443 Y33.874 E.01641
G1 X218.001 Y36.432 E.11123
G1 X218.001 Y35.899 E.01641
G1 X215.976 Y33.874 E.08802
G1 X216.51 Y33.874 E.01641
G1 X218.001 Y35.365 E.06482
G1 X218.001 Y34.832 E.01641
G1 X217.043 Y33.874 E.04162
G1 X217.577 Y33.874 E.01641
G1 X218.17 Y34.468 E.02579
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X217.577 Y33.874 E-.31874
G1 X217.043 Y33.874 E-.20278
G1 X217.487 Y34.318 E-.23848
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/15
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
G17
G3 Z1 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 15
G1 X125.83 Y212.248
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X125.647 Y212.058 E.00874
G3 X127.712 Y206.674 I2.361 J-2.183 E.23728
G3 X129.176 Y206.88 I.285 J3.279 E.04946
G3 X125.878 Y212.284 I-1.168 J2.996 E.37265
G1 X126.113 Y211.956 F30000
G1 F16213.044
G1 X125.945 Y211.781 E.00803
G3 X127.742 Y207.08 I2.063 J-1.906 E.20699
G3 X128.761 Y207.17 I.272 J2.733 E.03413
G3 X126.162 Y211.991 I-.753 J2.706 E.33426
G1 X126.385 Y211.65 F30000
G1 F16213.044
G1 X126.092 Y211.32 E.01464
G3 X127.773 Y207.485 I1.917 J-1.445 E.16869
G3 X128.417 Y207.509 I.23 J2.582 E.02144
G3 X126.433 Y211.686 I-.408 J2.366 E.29364
G1 X126.58 Y211.285 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X126.403 Y211.084 E.00821
G3 X127.802 Y207.876 I1.604 J-1.21 E.13053
G3 X128.349 Y207.895 I.199 J2.168 E.01686
G3 X126.674 Y211.377 I-.342 J1.979 E.22813
G1 X126.623 Y211.327 E.00222
; WIPE_START
M204 S10000
G1 X126.403 Y211.084 E-.12423
G1 X126.189 Y210.747 E-.15182
G1 X126.052 Y210.371 E-.15213
G1 X125.992 Y209.975 E-.15214
G1 X126.012 Y209.575 E-.15212
G1 X126.03 Y209.505 E-.02756
; WIPE_END
G1 E-.04 F1800
G1 X133.659 Y209.261 Z1.2 F30000
G1 X210.694 Y206.802 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X210.926 Y206.879 E.00809
G3 X209.462 Y206.674 I-1.168 J2.996 E.62066
G3 X210.621 Y206.779 I.285 J3.279 E.03882
G1 X210.637 Y206.784 E.00055
G1 X210.177 Y207.1 F30000
G1 F16213.044
G1 X210.238 Y207.107 E.00203
G3 X210.511 Y207.17 I-.474 J2.706 E.00931
G3 X209.492 Y207.08 I-.753 J2.706 E.55124
G3 X209.96 Y207.073 I.272 J2.733 E.01553
G1 X210.118 Y207.092 E.00527
G1 X209.799 Y207.481 F30000
G1 F16213.044
G1 X209.929 Y207.481 E.00433
G3 X210.167 Y207.509 I-.177 J2.586 E.00794
G3 X209.523 Y207.485 I-.408 J2.366 E.47895
G1 X209.739 Y207.482 E.00717
G1 X209.542 Y207.878 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.552 Y207.876 E.00033
G3 X210.099 Y207.895 I.199 J2.168 E.01686
G3 X209.303 Y207.918 I-.342 J1.979 E.36318
G1 X209.482 Y207.888 E.00558
; WIPE_START
M204 S10000
G1 X209.552 Y207.876 E-.02691
G1 X209.9 Y207.87 E-.13224
G1 X210.099 Y207.895 E-.07618
G1 X210.484 Y208.004 E-.1521
G1 X210.841 Y208.186 E-.15215
G1 X211.154 Y208.436 E-.1521
G1 X211.269 Y208.574 E-.06833
; WIPE_END
G1 E-.04 F1800
G1 X211.218 Y200.941 Z1.2 F30000
G1 X210.695 Y122.927 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X210.926 Y123.005 E.00809
G3 X209.462 Y122.799 I-1.168 J2.996 E.62066
G3 X210.621 Y122.904 I.285 J3.28 E.0388
G1 X210.637 Y122.909 E.00057
G1 X210.178 Y123.225 F30000
G1 F16213.044
G1 X210.238 Y123.232 E.00202
G3 X210.511 Y123.295 I-.474 J2.708 E.0093
G3 X209.493 Y123.205 I-.753 J2.706 E.55134
G3 X209.96 Y123.198 I.271 J2.736 E.01552
G1 X210.118 Y123.217 E.00528
G1 X209.799 Y123.606 F30000
G1 F16213.044
G1 X209.929 Y123.606 E.00432
G3 X210.167 Y123.634 I-.177 J2.585 E.00795
G3 X209.523 Y123.61 I-.408 J2.366 E.47895
G1 X209.739 Y123.607 E.00718
G1 X209.548 Y124.002 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.552 Y124.001 E.00014
G3 X210.099 Y124.02 I.199 J2.167 E.01686
G3 X209.303 Y124.043 I-.342 J1.979 E.36318
G1 X209.488 Y124.012 E.00577
; WIPE_START
M204 S10000
G1 X209.552 Y124.001 E-.02457
G1 X209.9 Y123.995 E-.13224
G1 X210.099 Y124.02 E-.07618
G1 X210.294 Y124.065 E-.07612
G1 X210.667 Y124.211 E-.15216
G1 X211.003 Y124.428 E-.15208
G1 X211.28 Y124.698 E-.14664
; WIPE_END
G1 E-.04 F1800
G1 X211.011 Y117.07 Z1.2 F30000
G1 X208.269 Y39.272 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X208.429 Y39.198 E.00584
G3 X209.462 Y38.924 I1.329 J2.928 E.03562
G3 X210.926 Y39.129 I.285 J3.28 E.04945
G3 X208.144 Y39.344 I-1.168 J2.996 E.57442
G1 X208.217 Y39.302 E.00279
G1 X208.755 Y39.5 F30000
G1 F16213.044
G1 X208.856 Y39.466 E.00354
G3 X209.493 Y39.33 I.902 J2.66 E.02163
G3 X210.511 Y39.42 I.271 J2.735 E.03412
G3 X208.596 Y39.569 I-.753 J2.706 E.52043
G1 X208.7 Y39.524 E.00376
G1 X209.182 Y39.794 F30000
G1 F16213.044
G1 X209.216 Y39.786 E.00117
G3 X209.523 Y39.735 I.543 J2.339 E.01032
G3 X210.167 Y39.759 I.229 J2.581 E.02144
G3 X208.764 Y39.94 I-.408 J2.366 E.45276
G1 X209.125 Y39.813 E.0127
G1 X209.548 Y40.127 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.552 Y40.126 E.00014
G3 X210.099 Y40.145 I.199 J2.167 E.01686
G3 X209.303 Y40.168 I-.342 J1.979 E.36318
G1 X209.489 Y40.137 E.00577
; WIPE_START
M204 S10000
G1 X209.552 Y40.126 E-.02452
G1 X209.9 Y40.12 E-.13224
G1 X210.099 Y40.145 E-.07618
G1 X210.294 Y40.19 E-.07614
G1 X210.667 Y40.336 E-.15213
G1 X211.003 Y40.553 E-.15214
G1 X211.28 Y40.823 E-.14666
; WIPE_END
G1 E-.04 F1800
G1 X203.649 Y40.683 Z1.2 F30000
G1 X126.519 Y39.272 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X126.679 Y39.197 E.00585
G3 X127.712 Y38.924 I1.329 J2.928 E.03562
G3 X129.176 Y39.129 I.285 J3.281 E.04944
G3 X126.395 Y39.344 I-1.168 J2.996 E.57442
G1 X126.467 Y39.302 E.00279
G1 X127.005 Y39.5 F30000
G1 F16213.044
G1 X127.106 Y39.466 E.00354
G3 X127.743 Y39.33 I.902 J2.66 E.02163
G3 X128.761 Y39.42 I.271 J2.735 E.03412
G3 X126.846 Y39.569 I-.753 J2.706 E.52043
G1 X126.95 Y39.524 E.00375
G1 X127.432 Y39.794 F30000
G1 F16213.044
G1 X127.466 Y39.786 E.00117
G3 X127.773 Y39.735 I.543 J2.339 E.01032
G3 X128.417 Y39.759 I.23 J2.581 E.02144
G3 X127.014 Y39.94 I-.408 J2.366 E.45276
G1 X127.375 Y39.813 E.0127
G1 X127.798 Y40.127 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X127.802 Y40.126 E.00014
G3 X128.349 Y40.145 I.199 J2.168 E.01686
G3 X127.553 Y40.168 I-.342 J1.979 E.36318
G1 X127.739 Y40.137 E.00577
; WIPE_START
M204 S10000
G1 X127.802 Y40.126 E-.0245
G1 X128.15 Y40.12 E-.13223
G1 X128.349 Y40.145 E-.0762
G1 X128.734 Y40.254 E-.15213
G1 X129.091 Y40.436 E-.15212
G1 X129.404 Y40.686 E-.1521
G1 X129.53 Y40.822 E-.07073
; WIPE_END
G1 E-.04 F1800
G1 X121.9 Y40.658 Z1.2 F30000
G1 X47.195 Y39.052 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X47.426 Y39.129 E.00808
G3 X45.962 Y38.924 I-1.168 J2.996 E.62066
G3 X47.121 Y39.029 I.285 J3.28 E.0388
G1 X47.137 Y39.034 E.00057
G1 X46.678 Y39.35 F30000
G1 F16213.044
G1 X46.738 Y39.357 E.00201
G3 X47.011 Y39.42 I-.474 J2.708 E.0093
G3 X45.993 Y39.33 I-.753 J2.706 E.55125
G3 X46.46 Y39.323 I.271 J2.735 E.01552
G1 X46.618 Y39.342 E.00529
G1 X46.3 Y39.731 F30000
G1 F16213.044
G1 X46.429 Y39.731 E.00431
G3 X46.667 Y39.759 I-.177 J2.585 E.00795
G3 X46.023 Y39.735 I-.408 J2.366 E.47895
G1 X46.24 Y39.732 E.00718
G1 X46.052 Y40.126 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X46.599 Y40.145 I.199 J2.167 E.01686
G3 X45.993 Y40.133 I-.342 J1.979 E.36909
; WIPE_START
M204 S10000
G1 X46.4 Y40.12 E-.15493
G1 X46.599 Y40.145 E-.07619
G1 X46.984 Y40.254 E-.15213
G1 X47.341 Y40.436 E-.15212
G1 X47.503 Y40.553 E-.07614
G1 X47.783 Y40.826 E-.14849
; WIPE_END
G1 E-.04 F1800
G1 X53.057 Y46.344 Z1.2 F30000
G1 X201.166 Y201.291 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X54.834 Y201.291 E4.85411
G1 X54.834 Y50.709 E4.99509
G1 X201.166 Y50.709 E4.85411
G1 X201.166 Y201.231 E4.9931
G1 X200.759 Y200.884 F30000
G1 F16213.044
G1 X55.241 Y200.884 E4.82711
G1 X55.241 Y51.116 E4.96809
G1 X200.759 Y51.116 E4.82711
G1 X200.759 Y200.824 E4.9661
G1 X200.352 Y200.477 F30000
G1 F16213.044
G1 X55.648 Y200.477 E4.8001
G1 X55.648 Y51.523 E4.94108
G1 X200.352 Y51.523 E4.8001
G1 X200.352 Y200.417 E4.93909
G1 X199.96 Y200.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X56.04 Y200.085 E4.42226
G1 X56.04 Y51.915 E4.55285
G1 X199.96 Y51.915 E4.42226
G1 X199.96 Y200.025 E4.55101
; WIPE_START
M204 S10000
G1 X197.96 Y200.026 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X191.134 Y196.611 Z1.2 F30000
G1 X49.455 Y125.731 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X49.473 Y126 E.00894
G3 X45.962 Y122.799 I-3.215 J0 E.49277
G3 X47.426 Y123.004 I.285 J3.28 E.04944
G3 X49.456 Y125.671 I-1.168 J2.996 E.11697
G1 X49.041 Y125.686 F30000
G1 F16213.044
G1 X49.053 Y125.719 E.00117
G3 X45.993 Y123.205 I-2.795 J.281 E.4396
G3 X47.011 Y123.295 I.271 J2.735 E.03412
G3 X49.011 Y125.442 I-.753 J2.706 E.10242
G1 X49.034 Y125.627 E.00618
G1 X48.634 Y125.727 F30000
G1 F16213.044
G1 X48.648 Y125.76 E.00118
G3 X46.023 Y123.61 I-2.389 J.24 E.37541
G3 X46.667 Y123.634 I.229 J2.581 E.02144
G3 X48.553 Y125.29 I-.408 J2.366 E.08759
G1 X48.623 Y125.668 E.01278
G1 X48.224 Y125.668 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X48.256 Y125.799 E.00416
G3 X46.052 Y124.001 I-1.999 J.2 E.29071
G3 X46.599 Y124.02 I.199 J2.167 E.01686
G3 X48.176 Y125.406 I-.342 J1.979 E.06787
G1 X48.213 Y125.609 E.00634
; WIPE_START
M204 S10000
G1 X48.256 Y125.799 E-.07419
G1 X48.25 Y126.2 E-.15236
G1 X48.171 Y126.593 E-.1521
G1 X48.015 Y126.961 E-.15213
G1 X47.79 Y127.292 E-.15211
G1 X47.645 Y127.434 E-.0771
; WIPE_END
G1 E-.04 F1800
G1 X47.291 Y135.058 Z1.2 F30000
G1 X43.928 Y207.65 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X44.126 Y207.468 E.00891
G3 X45.962 Y206.674 I2.132 J2.407 E.06748
G3 X47.426 Y206.879 I.285 J3.279 E.04946
G3 X43.892 Y207.698 I-1.168 J2.996 E.54229
G1 X44.168 Y207.99 F30000
G1 F16213.044
G1 X44.196 Y207.969 E.00116
G3 X45.992 Y207.08 I2.062 J1.906 E.06799
G3 X47.011 Y207.17 I.272 J2.733 E.03413
G3 X44.017 Y208.183 I-.753 J2.706 E.47398
G1 X44.131 Y208.037 E.00615
G1 X44.468 Y208.268 F30000
G1 F16213.044
G1 X44.495 Y208.247 E.00114
G3 X46.023 Y207.485 I1.764 J1.628 E.05789
G3 X46.667 Y207.509 I.23 J2.582 E.02144
G3 X44.208 Y208.627 I-.408 J2.366 E.40522
G1 X44.433 Y208.316 E.01272
G1 X44.781 Y208.512 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X46.052 Y207.876 I1.476 J1.362 E.04463
G3 X46.599 Y207.895 I.199 J2.168 E.01686
G3 X44.741 Y208.557 I-.342 J1.979 E.32446
; WIPE_START
M204 S10000
G1 X45.077 Y208.243 E-.17455
G1 X45.423 Y208.043 E-.15216
G1 X45.803 Y207.915 E-.15208
G1 X46.052 Y207.876 E-.09597
G1 X46.4 Y207.87 E-.13224
G1 X46.539 Y207.888 E-.053
; WIPE_END
G1 E-.04 F1800
G1 X54.157 Y208.356 Z1.2 F30000
G1 X218.334 Y218.459 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X37.666 Y218.459 E5.99308
G1 X37.666 Y33.541 E6.13406
G1 X218.334 Y33.541 E5.99308
G1 X218.334 Y218.399 E6.13207
G1 X218.741 Y218.866 F30000
G1 F16213.044
G1 X37.259 Y218.866 E6.02008
G1 X37.259 Y33.134 E6.16106
G1 X218.741 Y33.134 E6.02008
G1 X218.741 Y218.806 E6.15907
G1 X219.148 Y219.273 F30000
G1 F16213.044
G1 X36.852 Y219.273 E6.04709
G1 X36.852 Y32.727 E6.18807
G1 X219.148 Y32.727 E6.04709
G1 X219.148 Y219.213 E6.18608
G1 X219.54 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X36.46 Y219.665 E5.62554
G1 X36.46 Y32.335 E5.75613
G1 X219.54 Y32.335 E5.62554
G1 X219.54 Y219.605 E5.75429
; WIPE_START
M204 S10000
G1 X217.54 Y219.606 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X216.127 Y212.105 Z1.2 F30000
G1 X201.514 Y134.56 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X201.514 Y136.188 E.05401
G1 X217.986 Y152.659 E.77269
G1 X217.986 Y151.154 E.04993
G1 X201.514 Y167.625 E.77269
G1 X201.514 Y164.973 E.08798
G1 X217.986 Y181.444 E.77269
G1 X217.986 Y179.939 E.04993
G1 X201.514 Y196.41 E.77269
G1 X201.514 Y193.757 E.08798
G1 X217.986 Y210.229 E.77269
G1 X217.986 Y208.723 E.04993
G1 X208.597 Y218.111 E.44041
G1 X192.126 Y201.639 E.77269
G1 X190.528 Y201.639 E.053
G1 X174.057 Y218.111 E.77269
G1 X157.584 Y201.639 E.77273
G1 X155.986 Y201.639 E.053
G1 X139.515 Y218.111 E.77269
G1 X131.553 Y210.15 E.37347
G2 X131.433 Y208.921 I-4.84 J-.148 E.04107
G1 X138.715 Y201.639 E.34161
G1 X140.313 Y201.639 E.053
G1 X156.786 Y218.111 E.77273
G1 X173.257 Y201.639 E.77269
G1 X174.855 Y201.639 E.053
G1 X191.328 Y218.111 E.77274
G1 X217.986 Y191.453 E1.25058
G1 X217.986 Y192.958 E.04993
G1 X201.514 Y176.487 E.77269
G1 X201.514 Y179.139 E.08798
G1 X217.986 Y162.668 E.77269
G1 X217.986 Y164.173 E.04993
G1 X201.514 Y147.702 E.77269
G1 X201.514 Y150.354 E.08798
M73 P44 R31
G1 X217.986 Y133.883 E.77269
M73 P45 R31
G1 X217.986 Y135.388 E.04993
G1 X211.627 Y129.03 E.29829
G3 X211.025 Y129.33 I-2.272 J-3.805 E.02234
G1 X201.514 Y138.84 E.44616
G1 X201.514 Y140.468 E.05401
; WIPE_START
G1 X201.514 Y138.84 E-.61876
G1 X201.777 Y138.577 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X204.55 Y131.466 Z1.2 F30000
G1 X207.86 Y122.98 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F16200
G2 X206.719 Y124.122 I1.935 J3.074 E.05398
G1 X201.514 Y118.917 E.24417
G1 X201.514 Y121.569 E.08798
G1 X217.986 Y105.098 E.77269
G1 X217.986 Y106.603 E.04993
G1 X201.514 Y90.132 E.77269
G1 X201.514 Y92.784 E.08798
G1 X217.986 Y76.313 E.77269
G1 X217.986 Y77.818 E.04993
G1 X201.514 Y61.347 E.77269
G1 X201.514 Y63.999 E.08798
G1 X217.986 Y47.528 E.77269
G1 X217.986 Y49.034 E.04993
G1 X212.845 Y43.893 E.24117
G2 X213.096 Y40.904 I-3.253 J-1.779 E.10243
G1 X217.986 Y36.014 E.22936
G1 X217.986 Y37.52 E.04993
G1 X214.354 Y33.889 E.17034
G1 X209.683 Y38.56 E.2191
G2 X207.981 Y39.029 I.364 J4.646 E.05892
G1 X202.84 Y33.889 E.24114
G1 X186.369 Y50.361 E.77269
G1 X184.771 Y50.361 E.053
G1 X168.298 Y33.889 E.77273
G1 X151.827 Y50.361 E.77269
G1 X150.229 Y50.361 E.053
G1 X133.758 Y33.889 E.77269
G1 X128.956 Y38.689 E.22522
G2 X127.047 Y38.693 I-.948 J3.791 E.06397
G1 X122.242 Y33.889 E.22537
G1 X105.771 Y50.361 E.77269
G1 X104.173 Y50.361 E.053
G1 X87.702 Y33.889 E.77269
G1 X71.229 Y50.361 E.77274
G1 X69.631 Y50.361 E.053
G1 X53.16 Y33.889 E.77269
G1 X48.016 Y39.032 E.24127
G2 X46.32 Y38.563 I-1.897 J3.566 E.05884
G1 X41.646 Y33.889 E.21926
G1 X38.014 Y37.52 E.17034
G1 X38.014 Y36.014 E.04993
G1 X42.9 Y40.9 E.22921
G2 X43.156 Y43.892 I3.529 J1.205 E.1025
G1 X38.014 Y49.034 E.2412
G1 X38.014 Y47.528 E.04993
G1 X54.486 Y63.999 E.77269
G1 X54.486 Y61.347 E.08798
G1 X38.014 Y77.818 E.77269
G1 X38.014 Y76.313 E.04993
G1 X54.486 Y92.784 E.77269
G1 X54.486 Y90.132 E.08798
G1 X38.014 Y106.603 E.77269
G1 X38.014 Y105.098 E.04993
G1 X54.486 Y121.569 E.77269
G1 X54.486 Y118.917 E.08798
G1 X49.278 Y124.124 E.24428
G3 X49.382 Y127.706 I-3.044 J1.881 E.1245
G1 X49.278 Y127.876 E.0066
G1 X54.486 Y133.083 E.24428
G1 X54.486 Y130.431 E.08798
G1 X38.014 Y146.902 E.77269
G1 X38.014 Y145.397 E.04993
G1 X54.486 Y161.868 E.77269
G1 X54.486 Y159.216 E.08798
G1 X38.014 Y175.687 E.77269
G1 X38.014 Y174.182 E.04993
G1 X54.486 Y190.653 E.77269
G1 X54.486 Y188.001 E.08798
G1 X38.014 Y204.472 E.77269
G1 X38.014 Y202.966 E.04993
G1 X43.156 Y208.108 E.2412
G2 X42.9 Y211.1 I3.273 J1.786 E.1025
G1 X38.014 Y215.986 E.22921
G1 X38.014 Y214.48 E.04993
G1 X41.646 Y218.111 E.17034
G1 X46.32 Y213.437 E.21926
G2 X48.016 Y212.968 I-.201 J-4.034 E.05884
G1 X53.16 Y218.111 E.24127
G1 X69.631 Y201.639 E.77269
G1 X71.229 Y201.639 E.053
G1 X87.702 Y218.111 E.77273
G1 X104.173 Y201.639 E.77269
G1 X105.771 Y201.639 E.053
G1 X122.242 Y218.111 E.77269
G1 X127.047 Y213.307 E.22537
G2 X128.956 Y213.311 I.961 J-3.903 E.06394
G1 X133.758 Y218.111 E.22522
G1 X150.229 Y201.639 E.77269
G1 X151.827 Y201.639 E.053
G1 X168.298 Y218.111 E.77269
G1 X184.771 Y201.639 E.77274
G1 X186.369 Y201.639 E.053
G1 X202.84 Y218.111 E.77269
G1 X207.981 Y212.971 E.24114
G2 X209.683 Y213.44 I1.944 J-3.733 E.05901
G1 X214.354 Y218.111 E.2191
G1 X217.986 Y214.48 E.17034
G1 X217.986 Y215.986 E.04993
G1 X213.096 Y211.096 E.22936
G2 X212.845 Y208.107 I-3.504 J-1.21 E.10243
G1 X217.986 Y202.966 E.24117
G1 X217.986 Y204.472 E.04993
G1 X201.514 Y188.001 E.77269
G1 X201.514 Y190.653 E.08798
G1 X217.986 Y174.182 E.77269
G1 X217.986 Y175.687 E.04993
G1 X201.514 Y159.216 E.77269
G1 X201.514 Y161.868 E.08798
G1 X217.986 Y145.397 E.77269
G1 X217.986 Y146.902 E.04993
G1 X201.514 Y130.431 E.77269
G1 X201.514 Y133.083 E.08798
G1 X206.719 Y127.878 E.24417
G2 X207.86 Y129.02 I3.076 J-1.933 E.05398
; WIPE_START
G1 X207.135 Y128.426 E-.35601
G1 X206.719 Y127.878 E-.26135
G1 X206.454 Y128.144 E-.14264
; WIPE_END
G1 E-.04 F1800
G1 X204.797 Y120.693 Z1.2 F30000
G1 X201.514 Y105.927 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F16200
G1 X201.514 Y104.298 E.05401
G1 X217.986 Y87.827 E.77269
G1 X217.986 Y89.332 E.04993
G1 X201.514 Y72.861 E.77269
G1 X201.514 Y75.513 E.08798
G1 X217.986 Y59.042 E.77269
G1 X217.986 Y60.547 E.04993
G1 X191.328 Y33.889 E1.25058
G1 X174.855 Y50.361 E.77273
G1 X173.257 Y50.361 E.053
G1 X156.786 Y33.889 E.77269
G1 X140.313 Y50.361 E.77274
G1 X138.715 Y50.361 E.053
G1 X131.433 Y43.079 E.34161
G2 X131.553 Y41.85 I-4.721 J-1.08 E.04107
G1 X139.515 Y33.889 E.37347
G1 X155.986 Y50.361 E.77269
G1 X157.584 Y50.361 E.053
G1 X174.057 Y33.889 E.77273
G1 X190.528 Y50.361 E.77269
G1 X192.126 Y50.361 E.053
G1 X208.597 Y33.889 E.77269
G1 X217.986 Y43.277 E.44041
G1 X217.986 Y41.771 E.04993
G1 X201.514 Y58.243 E.77269
G1 X201.514 Y55.59 E.08798
G1 X217.986 Y72.061 E.77269
G1 X217.986 Y70.556 E.04993
G1 X201.514 Y87.027 E.77269
G1 X201.514 Y84.375 E.08798
G1 X217.986 Y100.846 E.77269
G1 X217.986 Y99.341 E.04993
G1 X201.514 Y115.812 E.77269
G1 X201.514 Y113.16 E.08798
G1 X211.025 Y122.67 E.44616
G3 X211.627 Y122.97 I-1.667 J4.099 E.02234
G1 X217.986 Y116.612 E.29829
G1 X217.986 Y118.117 E.04993
G1 X201.514 Y101.646 E.77269
G1 X201.514 Y100.018 E.05401
; WIPE_START
G1 X201.514 Y101.646 E-.61876
G1 X201.777 Y101.909 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X200.733 Y94.348 Z1.2 F30000
G1 X194.656 Y50.361 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F16200
G1 X196.285 Y50.361 E.05401
G1 X179.814 Y33.889 E.77269
G1 X163.341 Y50.361 E.77273
G1 X161.743 Y50.361 E.053
G1 X145.272 Y33.889 E.77269
G1 X128.799 Y50.361 E.77273
G1 X127.201 Y50.361 E.053
G1 X110.73 Y33.889 E.77269
G1 X94.257 Y50.361 E.77274
G1 X92.659 Y50.361 E.053
G1 X76.188 Y33.889 E.77269
G1 X59.715 Y50.361 E.77274
G1 X58.117 Y50.361 E.053
G1 X49.813 Y42.056 E.38957
G3 X49.668 Y43.137 I-5.773 J-.224 E.03621
G1 X58.917 Y33.889 E.43385
G1 X75.388 Y50.361 E.77269
G1 X76.986 Y50.361 E.053
G1 X93.459 Y33.889 E.77274
G1 X109.93 Y50.361 E.77269
G1 X111.528 Y50.361 E.053
G1 X128.001 Y33.889 E.77273
G1 X144.472 Y50.361 E.77269
G1 X146.07 Y50.361 E.053
G1 X162.543 Y33.889 E.77274
G1 X179.014 Y50.361 E.77269
G1 X180.612 Y50.361 E.053
G1 X197.085 Y33.889 E.77273
G1 X206.335 Y43.14 E.43397
G3 X206.188 Y42.055 I5.123 J-1.249 E.03639
G1 X197.883 Y50.361 E.38962
G1 X201.514 Y50.361 E.12048
G1 X201.514 Y52.486 E.07049
G1 X208.528 Y45.472 E.32901
G2 X208.735 Y45.54 I.443 J-1.002 E.00724
G1 X217.986 Y54.79 E.43396
G1 X217.986 Y53.285 E.04993
G1 X201.514 Y69.756 E.77269
G1 X201.514 Y67.104 E.08798
G1 X217.986 Y83.575 E.77269
G1 X217.986 Y82.07 E.04993
G1 X201.514 Y98.541 E.77269
G1 X201.514 Y95.889 E.08798
G1 X217.986 Y112.36 E.77269
G1 X217.986 Y110.855 E.04993
G1 X201.514 Y127.326 E.77269
G1 X201.514 Y124.674 E.08798
G1 X217.986 Y141.145 E.77269
G1 X217.986 Y139.64 E.04993
G1 X201.514 Y156.111 E.77269
G1 X201.514 Y153.459 E.08798
G1 X217.986 Y169.93 E.77269
G1 X217.986 Y168.425 E.04993
G1 X201.514 Y184.896 E.77269
G1 X201.514 Y182.244 E.08798
G1 X217.986 Y198.715 E.77269
G1 X217.986 Y197.21 E.04993
G1 X208.735 Y206.46 E.43396
G2 X208.528 Y206.528 I.235 J1.067 E.00724
G1 X201.514 Y199.514 E.32901
G1 X201.514 Y201.143 E.05401
; WIPE_START
G1 X201.514 Y199.514 E-.61876
G1 X201.777 Y199.777 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X194.145 Y199.878 Z1.2 F30000
G1 X61.344 Y201.639 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F16200
G1 X59.715 Y201.639 E.05401
G1 X76.186 Y218.111 E.77269
G1 X92.659 Y201.639 E.77273
G1 X94.257 Y201.639 E.053
G1 X110.728 Y218.111 E.77269
G1 X127.201 Y201.639 E.77273
G1 X128.799 Y201.639 E.053
G1 X145.27 Y218.111 E.77269
G1 X161.743 Y201.639 E.77274
G1 X163.341 Y201.639 E.053
G1 X179.812 Y218.111 E.77269
G1 X196.285 Y201.639 E.77274
G1 X197.882 Y201.639 E.053
G1 X206.188 Y209.945 E.38962
G3 X206.335 Y208.86 I5.272 J.164 E.03639
G1 X197.083 Y218.111 E.43402
G1 X180.612 Y201.639 E.77269
G1 X179.014 Y201.639 E.053
G1 X162.543 Y218.111 E.77269
G1 X146.07 Y201.639 E.77274
G1 X144.472 Y201.639 E.053
G1 X128.001 Y218.111 E.77269
G1 X111.528 Y201.639 E.77273
G1 X109.93 Y201.639 E.053
G1 X93.459 Y218.111 E.77269
G1 X76.986 Y201.639 E.77273
G1 X75.388 Y201.639 E.053
G1 X58.917 Y218.111 E.77269
G1 X49.668 Y208.863 E.43385
G3 X49.813 Y209.944 I-5.627 J1.305 E.03621
G1 X58.117 Y201.639 E.38957
G1 X54.486 Y201.639 E.12048
G1 X54.486 Y199.514 E.07049
G1 X47.472 Y206.528 E.32901
G1 X47.262 Y206.457 E.00735
G1 X38.014 Y197.21 E.43382
G1 X38.014 Y198.715 E.04993
G1 X54.486 Y182.244 E.77269
G1 X54.486 Y184.896 E.08798
G1 X38.014 Y168.425 E.77269
G1 X38.014 Y169.93 E.04993
G1 X54.486 Y153.459 E.77269
G1 X54.486 Y156.111 E.08798
G1 X38.014 Y139.64 E.77269
G1 X38.014 Y141.145 E.04993
G1 X54.486 Y124.674 E.77269
G1 X54.486 Y127.326 E.08798
G1 X38.014 Y110.855 E.77269
G1 X38.014 Y112.36 E.04993
G1 X54.486 Y95.889 E.77269
G1 X54.486 Y98.541 E.08798
G1 X38.014 Y82.07 E.77269
G1 X38.014 Y83.575 E.04993
G1 X54.486 Y67.104 E.77269
G1 X54.486 Y69.756 E.08798
G1 X38.014 Y53.285 E.77269
G1 X38.014 Y54.79 E.04993
G1 X47.262 Y45.543 E.43382
G1 X47.472 Y45.472 E.00736
G1 X54.486 Y52.486 E.32901
G1 X54.486 Y50.857 E.05401
G1 X54.486 Y77.142 F30000
G1 F16200
G1 X54.486 Y75.513 E.05401
G1 X38.014 Y59.042 E.77269
G1 X38.014 Y60.547 E.04993
G1 X64.672 Y33.889 E1.25058
G1 X81.145 Y50.361 E.77274
G1 X82.743 Y50.361 E.053
G1 X99.214 Y33.889 E.77269
G1 X115.687 Y50.361 E.77273
G1 X117.285 Y50.361 E.053
G1 X124.566 Y43.079 E.34159
G3 X124.447 Y41.85 I3.512 J-.96 E.04116
G1 X116.485 Y33.889 E.37349
G1 X100.014 Y50.361 E.77269
G1 X98.416 Y50.361 E.053
G1 X81.943 Y33.889 E.77273
G1 X65.472 Y50.361 E.77269
G1 X63.874 Y50.361 E.053
G1 X47.403 Y33.889 E.77269
G1 X38.014 Y43.277 E.44041
G1 X38.014 Y41.771 E.04993
G1 X54.486 Y58.242 E.77269
G1 X54.486 Y55.59 E.08798
G1 X38.014 Y72.061 E.77269
G1 X38.014 Y70.556 E.04993
G1 X54.486 Y87.027 E.77269
G1 X54.486 Y84.375 E.08798
G1 X38.014 Y100.846 E.77269
G1 X38.014 Y99.341 E.04993
G1 X54.486 Y115.812 E.77269
G1 X54.486 Y113.16 E.08798
G1 X44.97 Y122.676 E.4464
G2 X44.374 Y122.971 I1.319 J3.41 E.0221
G1 X38.014 Y116.612 E.29832
G1 X38.014 Y118.117 E.04993
G1 X54.486 Y101.646 E.77269
G1 X54.486 Y104.298 E.08798
G1 X38.014 Y87.827 E.77269
G1 X38.014 Y89.332 E.04993
G1 X54.486 Y72.861 E.77269
G1 X54.486 Y71.233 E.05401
G1 X54.486 Y140.316 F30000
G1 F16200
G1 X54.486 Y141.945 E.05401
G1 X38.014 Y158.416 E.77269
G1 X38.014 Y156.911 E.04993
G1 X54.486 Y173.382 E.77269
G1 X54.486 Y170.73 E.08798
G1 X38.014 Y187.201 E.77269
G1 X38.014 Y185.696 E.04993
G1 X70.429 Y218.111 E1.52065
G1 X86.902 Y201.639 E.77273
G1 X88.5 Y201.639 E.053
G1 X104.971 Y218.111 E.77269
G1 X121.444 Y201.639 E.77273
G1 X123.042 Y201.639 E.053
G1 X127.726 Y206.323 E.21973
G3 X128.278 Y206.32 I.308 J4.819 E.01832
G1 X132.958 Y201.639 E.21956
G1 X134.556 Y201.639 E.053
G1 X151.029 Y218.111 E.77273
G1 X167.5 Y201.639 E.77269
G1 X169.098 Y201.639 E.053
G1 X185.571 Y218.111 E.77273
G1 X217.986 Y185.696 E1.52065
G1 X217.986 Y187.201 E.04993
G1 X201.514 Y170.73 E.77269
G1 X201.514 Y173.382 E.08798
G1 X217.986 Y156.911 E.77269
G1 X217.986 Y158.416 E.04993
G1 X201.514 Y141.945 E.77269
G1 X201.514 Y144.597 E.08798
G1 X217.986 Y128.126 E.77269
G1 X217.986 Y129.631 E.04993
G1 X213.075 Y124.721 E.23035
G3 X213.075 Y127.279 I-3.546 J1.279 E.08659
G1 X217.986 Y122.369 E.23035
G1 X217.986 Y123.874 E.04993
G1 X201.514 Y107.403 E.77269
G1 X201.514 Y110.055 E.08798
G1 X217.986 Y93.584 E.77269
G1 X217.986 Y95.089 E.04993
G1 X201.514 Y78.618 E.77269
G1 X201.514 Y81.27 E.08798
G1 X217.986 Y64.799 E.77269
G1 X217.986 Y66.304 E.04993
G1 X185.571 Y33.889 E1.52065
G1 X169.098 Y50.361 E.77273
G1 X167.5 Y50.361 E.053
G1 X151.029 Y33.889 E.77269
G1 X134.556 Y50.361 E.77273
G1 X132.958 Y50.361 E.053
G1 X128.278 Y45.68 E.21956
G3 X127.726 Y45.677 I-.244 J-4.824 E.01832
G1 X123.042 Y50.361 E.21973
G1 X121.444 Y50.361 E.053
G1 X104.971 Y33.889 E.77273
G1 X88.5 Y50.361 E.77269
G1 X86.902 Y50.361 E.053
G1 X70.429 Y33.889 E.77273
G1 X38.014 Y66.304 E1.52065
G1 X38.014 Y64.799 E.04993
G1 X54.486 Y81.27 E.77269
G1 X54.486 Y78.618 E.08798
G1 X38.014 Y95.089 E.77269
G1 X38.014 Y93.584 E.04993
G1 X54.486 Y110.055 E.77269
G1 X54.486 Y107.403 E.08798
G1 X38.014 Y123.874 E.77269
G1 X38.014 Y122.369 E.04993
G1 X42.923 Y127.277 E.23025
G3 X42.922 Y124.723 I3.356 J-1.277 E.08662
G1 X38.014 Y129.631 E.23025
G1 X38.014 Y128.126 E.04993
G1 X54.486 Y144.597 E.77269
G1 X54.486 Y146.225 E.05401
G1 X54.486 Y169.253 F30000
G1 F16200
G1 X54.486 Y167.625 E.05401
G1 X38.014 Y151.154 E.77269
G1 X38.014 Y152.659 E.04993
G1 X54.486 Y136.188 E.77269
G1 X54.486 Y138.84 E.08798
G1 X44.97 Y129.324 E.4464
G3 X44.374 Y129.029 I1.319 J-3.41 E.0221
G1 X38.014 Y135.388 E.29832
G1 X38.014 Y133.883 E.04993
G1 X54.486 Y150.354 E.77269
G1 X54.486 Y147.702 E.08798
G1 X38.014 Y164.173 E.77269
G1 X38.014 Y162.668 E.04993
G1 X54.486 Y179.139 E.77269
G1 X54.486 Y176.487 E.08798
G1 X38.014 Y192.958 E.77269
G1 X38.014 Y191.453 E.04993
G1 X64.672 Y218.111 E1.25058
G1 X81.145 Y201.639 E.77273
G1 X82.743 Y201.639 E.053
G1 X99.214 Y218.111 E.77269
G1 X115.687 Y201.639 E.77274
G1 X117.285 Y201.639 E.053
G1 X124.566 Y208.921 E.34159
G2 X124.447 Y210.15 I3.512 J.96 E.04116
G1 X116.485 Y218.111 E.37349
G1 X100.014 Y201.639 E.77269
G1 X98.416 Y201.639 E.053
G1 X81.943 Y218.111 E.77273
G1 X65.472 Y201.639 E.77269
G1 X63.874 Y201.639 E.053
G1 X47.402 Y218.111 E.77273
G1 X38.014 Y208.723 E.44037
G1 X38.014 Y210.229 E.04993
G1 X54.486 Y193.757 E.77269
M73 P46 R31
G1 X54.486 Y196.41 E.08798
G1 X38.014 Y179.939 E.77269
G1 X38.014 Y181.444 E.04993
G1 X54.486 Y164.973 E.77269
G1 X54.486 Y163.344 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F16200
G1 X54.486 Y164.973 E-.61876
G1 X54.223 Y165.235 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/15
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
G17
G3 Z1.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 15
G1 X125.83 Y212.248
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F16213.044
G1 X125.648 Y212.058 E.00873
G3 X127.724 Y206.673 I2.361 J-2.183 E.23767
G3 X129.175 Y206.879 I.274 J3.278 E.04905
G3 X125.878 Y212.283 I-1.167 J2.996 E.37268
G1 X126.113 Y211.956 F30000
G1 F16213.044
G1 X125.946 Y211.782 E.00802
G3 X127.754 Y207.079 I2.064 J-1.906 E.20737
G3 X128.761 Y207.17 I.261 J2.729 E.03373
G3 X126.161 Y211.992 I-.752 J2.706 E.33434
G1 X126.386 Y211.65 F30000
G1 F16213.044
G1 X126.09 Y211.322 E.01465
G3 X127.785 Y207.485 I1.917 J-1.446 E.16921
G3 X128.651 Y207.562 I.146 J3.253 E.02893
G3 X126.432 Y211.688 I-.643 J2.314 E.28567
G1 X126.603 Y211.31 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X126.404 Y211.084 E.00926
G3 X127.814 Y207.876 I1.604 J-1.209 E.13084
G3 X128.349 Y207.895 I.188 J2.156 E.01649
G3 X126.675 Y211.377 I-.341 J1.979 E.22818
G1 X126.647 Y211.351 E.00116
; WIPE_START
M204 S10000
G1 X126.404 Y211.084 E-.13726
G1 X126.189 Y210.747 E-.1519
G1 X126.052 Y210.371 E-.15207
G1 X125.992 Y209.975 E-.15214
G1 X126.012 Y209.575 E-.15212
G1 X126.022 Y209.538 E-.01451
; WIPE_END
G1 E-.04 F1800
G1 X118.391 Y209.37 Z1.4 F30000
G1 X43.858 Y207.726 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X43.898 Y207.692 E.00173
G3 X45.974 Y206.673 I2.361 J2.183 E.07848
G3 X47.426 Y206.879 I.274 J3.277 E.04905
G3 X43.693 Y207.938 I-1.167 J2.996 E.53195
G1 X43.821 Y207.773 E.00692
G1 X44.214 Y207.939 F30000
G1 F16213.044
G1 X44.396 Y207.774 E.00815
G3 X46.004 Y207.079 I1.863 J2.102 E.05911
G3 X47.011 Y207.17 I.261 J2.729 E.03373
G3 X44.179 Y207.988 I-.752 J2.706 E.4825
G1 X44.514 Y208.218 F30000
G1 F16213.044
G1 X44.851 Y207.929 E.01473
G3 X46.035 Y207.485 I1.406 J1.947 E.04245
G3 X46.901 Y207.562 I.146 J3.252 E.02893
G3 X44.476 Y208.265 I-.643 J2.314 E.41237
G1 X44.774 Y208.51 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X44.782 Y208.513 E.00024
G3 X46.064 Y207.876 I1.476 J1.362 E.04499
G3 X46.599 Y207.895 I.188 J2.156 E.01649
G3 X44.542 Y208.831 I-.341 J1.979 E.31404
G1 X44.739 Y208.559 E.01033
; WIPE_START
M204 S10000
G1 X44.782 Y208.513 E-.02382
G1 X45.077 Y208.243 E-.15185
G1 X45.423 Y208.043 E-.15214
G1 X45.803 Y207.915 E-.1521
G1 X46.064 Y207.876 E-.10051
G1 X46.4 Y207.87 E-.1277
G1 X46.536 Y207.887 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X46.808 Y200.26 Z1.4 F30000
G1 X49.465 Y125.943 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X49.474 Y126 E.00191
G3 X45.974 Y122.798 I-3.215 J0 E.49315
G3 X47.425 Y123.004 I.274 J3.279 E.04905
G3 X49.457 Y125.679 I-1.167 J2.996 E.11724
G1 X49.463 Y125.883 E.00677
G1 X49.059 Y125.962 F30000
G1 F16213.044
G1 X49.068 Y126 E.00129
G3 X46.004 Y123.204 I-2.809 J.001 E.43065
G3 X47.011 Y123.295 I.261 J2.731 E.03372
G3 X49.054 Y125.719 I-.752 J2.706 E.11175
G1 X49.057 Y125.902 E.00606
G1 X48.649 Y125.964 F30000
G1 F16213.044
G1 X48.662 Y126 E.00126
G3 X46.035 Y123.61 I-2.402 J.001 E.36794
G3 X46.667 Y123.634 I.219 J2.572 E.02105
G3 X48.614 Y125.522 I-.407 J2.367 E.0956
G1 X48.644 Y125.904 E.01272
G1 X48.227 Y125.664 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X48.267 Y126 E.0104
G3 X46.064 Y124.001 I-2.009 J0 E.28487
G3 X46.599 Y124.02 I.188 J2.156 E.01649
G3 X48.227 Y125.6 I-.341 J1.979 E.07407
G1 X48.227 Y125.604 E.00011
; WIPE_START
M204 S10000
G1 X48.267 Y126 E-.15126
G1 X48.25 Y126.2 E-.07633
G1 X48.171 Y126.593 E-.15213
G1 X48.015 Y126.961 E-.15213
G1 X47.79 Y127.292 E-.15211
G1 X47.647 Y127.432 E-.07606
; WIPE_END
G1 E-.04 F1800
G1 X54.525 Y130.741 Z1.4 F30000
G1 X201.166 Y201.291 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X54.834 Y201.291 E4.85411
G1 X54.834 Y50.709 E4.99509
G1 X201.166 Y50.709 E4.85411
G1 X201.166 Y201.231 E4.9931
G1 X200.759 Y200.884 F30000
G1 F16213.044
G1 X55.241 Y200.884 E4.82711
G1 X55.241 Y51.116 E4.96809
G1 X200.759 Y51.116 E4.82711
G1 X200.759 Y200.824 E4.9661
G1 X200.352 Y200.477 F30000
G1 F16213.044
G1 X55.648 Y200.477 E4.8001
G1 X55.648 Y51.523 E4.94108
G1 X200.352 Y51.523 E4.8001
G1 X200.352 Y200.417 E4.93909
G1 X199.96 Y200.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X56.04 Y200.085 E4.42226
G1 X56.04 Y51.915 E4.55285
G1 X199.96 Y51.915 E4.42226
G1 X199.96 Y200.025 E4.55101
; WIPE_START
M204 S10000
G1 X197.96 Y200.026 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X192.743 Y194.455 Z1.4 F30000
G1 X47.209 Y39.057 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X47.426 Y39.13 E.00758
G3 X45.974 Y38.923 I-1.167 J2.996 E.62105
G3 X47.121 Y39.029 I.274 J3.279 E.03841
G1 X47.152 Y39.039 E.00107
G1 X46.693 Y39.352 F30000
G1 F16213.044
G1 X46.738 Y39.357 E.00151
G3 X47.011 Y39.42 I-.473 J2.702 E.0093
G3 X46.004 Y39.329 I-.752 J2.706 E.55172
G3 X46.46 Y39.323 I.261 J2.731 E.01513
G1 X46.633 Y39.344 E.00579
G1 X46.315 Y39.731 F30000
G1 F16213.044
G1 X46.429 Y39.741 E.00378
G3 X46.901 Y39.812 I-.248 J3.249 E.01585
G3 X46.035 Y39.735 I-.643 J2.314 E.47154
G1 X46.255 Y39.731 E.0073
G1 X46.061 Y40.126 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X46.064 Y40.126 E.0001
G3 X46.599 Y40.145 I.188 J2.156 E.01649
G3 X45.803 Y40.168 I-.341 J1.979 E.36317
G1 X46.002 Y40.136 E.00618
; WIPE_START
M204 S10000
G1 X46.064 Y40.126 E-.02405
G1 X46.4 Y40.12 E-.1277
G1 X46.599 Y40.145 E-.07618
G1 X46.984 Y40.254 E-.15211
G1 X47.341 Y40.436 E-.15213
G1 X47.654 Y40.686 E-.1521
G1 X47.782 Y40.839 E-.07573
; WIPE_END
G1 E-.04 F1800
G1 X55.413 Y40.686 Z1.4 F30000
G1 X126.527 Y39.268 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X126.679 Y39.198 E.00555
G3 X127.724 Y38.923 I1.329 J2.927 E.03601
G3 X129.176 Y39.129 I.273 J3.279 E.04905
G3 X126.395 Y39.344 I-1.167 J2.996 E.57441
G1 X126.475 Y39.298 E.00309
G1 X127.014 Y39.497 F30000
G1 F16213.044
G1 X127.107 Y39.466 E.00325
G3 X127.754 Y39.329 I.902 J2.66 E.02202
G3 X128.761 Y39.42 I.261 J2.731 E.03372
G3 X126.847 Y39.569 I-.752 J2.706 E.52042
G1 X126.959 Y39.521 E.00404
G1 X127.501 Y39.777 F30000
G1 F16213.044
G1 X127.785 Y39.735 E.00952
G3 X128.651 Y39.812 I.145 J3.256 E.02892
G3 X127.443 Y39.792 I-.643 J2.314 E.46003
G1 X127.81 Y40.126 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X127.814 Y40.126 E.00012
G3 X128.349 Y40.145 I.188 J2.156 E.01649
G3 X127.553 Y40.168 I-.341 J1.979 E.36317
G1 X127.751 Y40.136 E.00616
; WIPE_START
M204 S10000
G1 X127.814 Y40.126 E-.02429
G1 X128.15 Y40.12 E-.1277
G1 X128.349 Y40.145 E-.07618
G1 X128.734 Y40.254 E-.15213
G1 X129.091 Y40.436 E-.15212
G1 X129.404 Y40.686 E-.1521
G1 X129.531 Y40.838 E-.07548
; WIPE_END
G1 E-.04 F1800
G1 X137.162 Y40.686 Z1.4 F30000
G1 X208.277 Y39.268 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X208.429 Y39.198 E.00555
G3 X209.474 Y38.923 I1.329 J2.928 E.03601
G3 X210.926 Y39.129 I.274 J3.279 E.04905
G3 X208.145 Y39.344 I-1.167 J2.996 E.57442
G1 X208.225 Y39.298 E.00308
G1 X208.764 Y39.497 F30000
G1 F16213.044
G1 X208.857 Y39.466 E.00325
G3 X209.504 Y39.329 I.903 J2.66 E.02202
G3 X210.511 Y39.42 I.261 J2.731 E.03372
G3 X208.597 Y39.569 I-.752 J2.706 E.52042
G1 X208.709 Y39.521 E.00404
G1 X209.251 Y39.777 F30000
G1 F16213.044
G1 X209.535 Y39.735 E.00952
G3 X210.401 Y39.812 I.145 J3.256 E.02892
G3 X209.193 Y39.792 I-.643 J2.314 E.46003
G1 X209.56 Y40.126 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.564 Y40.126 E.00012
G3 X210.099 Y40.145 I.188 J2.156 E.01649
G3 X209.303 Y40.168 I-.341 J1.979 E.36317
G1 X209.501 Y40.136 E.00615
; WIPE_START
M204 S10000
G1 X209.564 Y40.126 E-.02432
G1 X209.9 Y40.12 E-.1277
G1 X210.099 Y40.145 E-.07618
G1 X210.484 Y40.254 E-.15213
G1 X210.841 Y40.436 E-.15208
G1 X211.154 Y40.686 E-.15216
G1 X211.281 Y40.838 E-.07543
; WIPE_END
G1 E-.04 F1800
G1 X211.003 Y48.465 Z1.4 F30000
G1 X208.277 Y123.143 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X208.429 Y123.073 E.00555
G3 X209.474 Y122.798 I1.329 J2.928 E.03601
G3 X210.926 Y123.004 I.274 J3.279 E.04905
G3 X208.145 Y123.219 I-1.167 J2.996 E.57441
G1 X208.225 Y123.173 E.00309
G1 X208.764 Y123.372 F30000
G1 F16213.044
G1 X208.857 Y123.341 E.00324
G3 X209.504 Y123.204 I.902 J2.66 E.02202
G3 X210.511 Y123.295 I.261 J2.731 E.03372
G3 X208.597 Y123.444 I-.752 J2.706 E.52042
G1 X208.709 Y123.396 E.00404
G1 X209.251 Y123.652 F30000
G1 F16213.044
G1 X209.535 Y123.61 E.00952
G3 X210.401 Y123.687 I.145 J3.257 E.02892
G3 X209.193 Y123.667 I-.643 J2.314 E.46003
G1 X209.56 Y124.001 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.564 Y124.001 E.00013
G3 X210.099 Y124.02 I.188 J2.156 E.01649
G3 X209.303 Y124.043 I-.341 J1.979 E.36317
G1 X209.501 Y124.011 E.00615
; WIPE_START
M204 S10000
G1 X209.564 Y124.001 E-.02435
G1 X209.9 Y123.995 E-.1277
G1 X210.099 Y124.02 E-.07618
G1 X210.484 Y124.129 E-.15213
G1 X210.841 Y124.311 E-.15209
G1 X211.154 Y124.561 E-.15215
G1 X211.281 Y124.713 E-.0754
; WIPE_END
G1 E-.04 F1800
G1 X211.003 Y132.34 Z1.4 F30000
G1 X208.278 Y207.018 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X208.429 Y206.948 E.00554
G3 X209.474 Y206.673 I1.329 J2.928 E.036
G3 X210.926 Y206.88 I.274 J3.278 E.04906
G3 X208.144 Y207.095 I-1.167 J2.996 E.5744
G1 X208.226 Y207.048 E.0031
G1 X208.764 Y207.247 F30000
G1 F16213.044
G1 X208.857 Y207.216 E.00324
G3 X209.504 Y207.079 I.902 J2.66 E.02201
G3 X210.511 Y207.17 I.261 J2.731 E.03373
G3 X208.597 Y207.319 I-.752 J2.706 E.52042
G1 X208.709 Y207.27 E.00405
G1 X209.251 Y207.527 F30000
G1 F16213.044
G1 X209.535 Y207.485 E.00951
G3 X210.401 Y207.562 I.145 J3.255 E.02893
G3 X209.193 Y207.541 I-.643 J2.314 E.46004
G1 X209.554 Y207.877 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.564 Y207.876 E.00031
G3 X210.099 Y207.895 I.188 J2.156 E.01649
G3 X209.303 Y207.918 I-.341 J1.979 E.36317
G1 X209.495 Y207.887 E.00596
; WIPE_START
M204 S10000
G1 X209.564 Y207.876 E-.02667
G1 X209.9 Y207.87 E-.1277
G1 X210.099 Y207.895 E-.07618
G1 X210.294 Y207.94 E-.07615
G1 X210.667 Y208.086 E-.15213
G1 X211.003 Y208.303 E-.1521
G1 X211.284 Y208.577 E-.14907
; WIPE_END
G1 E-.04 F1800
G1 X215.717 Y214.791 Z1.4 F30000
G1 X218.334 Y218.459 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X37.666 Y218.459 E5.99308
G1 X37.666 Y33.541 E6.13406
G1 X218.334 Y33.541 E5.99308
G1 X218.334 Y218.399 E6.13207
G1 X218.741 Y218.866 F30000
G1 F16213.044
G1 X37.259 Y218.866 E6.02008
G1 X37.259 Y33.134 E6.16106
G1 X218.741 Y33.134 E6.02008
G1 X218.741 Y218.806 E6.15907
G1 X219.148 Y219.273 F30000
G1 F16213.044
G1 X36.852 Y219.273 E6.04709
G1 X36.852 Y32.727 E6.18807
G1 X219.148 Y32.727 E6.04709
G1 X219.148 Y219.213 E6.18608
G1 X219.54 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X36.46 Y219.665 E5.62554
G1 X36.46 Y32.335 E5.75613
G1 X219.54 Y32.335 E5.62554
G1 X219.54 Y219.605 E5.75429
; WIPE_START
M204 S10000
G1 X217.54 Y219.606 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X212.537 Y213.842 Z1.4 F30000
G1 X201.514 Y201.143 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X201.514 Y199.514 E.05401
G1 X208.528 Y206.528 E.32901
G3 X208.735 Y206.46 I.443 J1.002 E.00724
G1 X217.986 Y197.21 E.43396
G1 X217.986 Y198.715 E.04993
G1 X201.514 Y182.244 E.77269
G1 X201.514 Y184.896 E.08798
G1 X217.986 Y168.425 E.77269
G1 X217.986 Y169.93 E.04993
G1 X201.514 Y153.459 E.77269
G1 X201.514 Y156.111 E.08798
G1 X217.986 Y139.64 E.77269
G1 X217.986 Y141.145 E.04993
G1 X201.514 Y124.674 E.77269
G1 X201.514 Y127.326 E.08798
G1 X217.986 Y110.855 E.77269
G1 X217.986 Y112.36 E.04993
G1 X201.514 Y95.889 E.77269
G1 X201.514 Y98.541 E.08798
G1 X217.986 Y82.07 E.77269
G1 X217.986 Y83.575 E.04993
G1 X201.514 Y67.104 E.77269
G1 X201.514 Y69.756 E.08798
G1 X217.986 Y53.285 E.77269
G1 X217.986 Y54.79 E.04993
G1 X208.735 Y45.54 E.43396
G3 X208.528 Y45.472 I.235 J-1.069 E.00724
G1 X201.514 Y52.486 E.32901
M73 P46 R30
G1 X201.514 Y50.361 E.07049
G1 X197.883 Y50.361 E.12048
G1 X206.188 Y42.055 E.38962
G2 X206.335 Y43.14 I5.269 J-.164 E.03639
G1 X197.085 Y33.889 E.43397
G1 X180.612 Y50.361 E.77273
G1 X179.014 Y50.361 E.053
G1 X162.543 Y33.889 E.77269
G1 X146.07 Y50.361 E.77274
G1 X144.472 Y50.361 E.053
G1 X128.001 Y33.889 E.77269
G1 X111.528 Y50.361 E.77273
G1 X109.93 Y50.361 E.053
G1 X93.459 Y33.889 E.77269
G1 X76.986 Y50.361 E.77274
G1 X75.388 Y50.361 E.053
G1 X58.917 Y33.889 E.77269
G1 X49.668 Y43.137 E.43385
G2 X49.813 Y42.056 I-5.625 J-1.305 E.03621
G1 X58.117 Y50.361 E.38957
G1 X59.715 Y50.361 E.053
G1 X76.188 Y33.889 E.77274
G1 X92.659 Y50.361 E.77269
G1 X94.257 Y50.361 E.053
G1 X110.73 Y33.889 E.77274
G1 X127.201 Y50.361 E.77269
G1 X128.799 Y50.361 E.053
G1 X145.272 Y33.889 E.77273
G1 X161.743 Y50.361 E.77269
G1 X163.341 Y50.361 E.053
G1 X179.814 Y33.889 E.77273
G1 X196.285 Y50.361 E.77269
G1 X194.656 Y50.361 E.05401
; WIPE_START
G1 X196.285 Y50.361 E-.61876
G1 X196.022 Y50.098 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X196.857 Y57.684 Z1.4 F30000
G1 X201.514 Y100.018 Z1.4
M73 P47 R30
G1 Z1
G1 E.8 F1800
G1 F16200
G1 X201.514 Y101.646 E.05401
G1 X217.986 Y118.117 E.77269
G1 X217.986 Y116.612 E.04993
G1 X211.627 Y122.97 E.29829
G2 X211.025 Y122.67 I-2.27 J3.802 E.02234
G1 X201.514 Y113.16 E.44616
G1 X201.514 Y115.812 E.08798
G1 X217.986 Y99.341 E.77269
G1 X217.986 Y100.846 E.04993
G1 X201.514 Y84.375 E.77269
G1 X201.514 Y87.027 E.08798
G1 X217.986 Y70.556 E.77269
G1 X217.986 Y72.061 E.04993
G1 X201.514 Y55.59 E.77269
G1 X201.514 Y58.243 E.08798
G1 X217.986 Y41.771 E.77269
G1 X217.986 Y43.277 E.04993
G1 X208.597 Y33.889 E.44041
G1 X192.126 Y50.361 E.77269
G1 X190.528 Y50.361 E.053
G1 X174.057 Y33.889 E.77269
G1 X157.584 Y50.361 E.77273
G1 X155.986 Y50.361 E.053
G1 X139.515 Y33.889 E.77269
G1 X131.553 Y41.85 E.37347
G3 X131.433 Y43.079 I-4.838 J.149 E.04107
G1 X138.715 Y50.361 E.34161
G1 X140.313 Y50.361 E.053
G1 X156.786 Y33.889 E.77274
G1 X173.257 Y50.361 E.77269
G1 X174.855 Y50.361 E.053
G1 X191.328 Y33.889 E.77273
G1 X217.986 Y60.547 E1.25058
G1 X217.986 Y59.042 E.04993
G1 X201.514 Y75.513 E.77269
G1 X201.514 Y72.861 E.08798
G1 X217.986 Y89.332 E.77269
G1 X217.986 Y87.827 E.04993
G1 X201.514 Y104.298 E.77269
G1 X201.514 Y105.927 E.05401
; WIPE_START
G1 X201.514 Y104.298 E-.61876
G1 X201.777 Y104.035 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X203.583 Y111.451 Z1.4 F30000
G1 X207.86 Y129.02 Z1.4
G1 Z1
G1 E.8 F1800
G1 F16200
G3 X206.719 Y127.878 I1.934 J-3.073 E.05398
G1 X201.514 Y133.083 E.24417
G1 X201.514 Y130.431 E.08798
G1 X217.986 Y146.902 E.77269
G1 X217.986 Y145.397 E.04993
G1 X201.514 Y161.868 E.77269
G1 X201.514 Y159.216 E.08798
G1 X217.986 Y175.687 E.77269
G1 X217.986 Y174.182 E.04993
G1 X201.514 Y190.653 E.77269
G1 X201.514 Y188.001 E.08798
G1 X217.986 Y204.472 E.77269
G1 X217.986 Y202.966 E.04993
G1 X212.845 Y208.107 E.24117
G3 X213.096 Y211.096 I-3.252 J1.779 E.10243
G1 X217.986 Y215.986 E.22936
G1 X217.986 Y214.48 E.04993
G1 X214.354 Y218.111 E.17034
G1 X209.683 Y213.44 E.2191
G3 X207.981 Y212.971 I.242 J-4.202 E.05901
G1 X202.84 Y218.111 E.24114
G1 X186.369 Y201.639 E.77269
G1 X184.771 Y201.639 E.053
G1 X168.298 Y218.111 E.77274
G1 X151.827 Y201.639 E.77269
G1 X150.229 Y201.639 E.053
G1 X133.758 Y218.111 E.77269
G1 X128.956 Y213.311 E.22522
G3 X127.047 Y213.307 I-.948 J-3.907 E.06394
G1 X122.242 Y218.111 E.22537
G1 X105.771 Y201.639 E.77269
G1 X104.173 Y201.639 E.053
G1 X87.702 Y218.111 E.77269
G1 X71.229 Y201.639 E.77273
G1 X69.631 Y201.639 E.053
G1 X53.16 Y218.111 E.77269
G1 X48.016 Y212.968 E.24127
G3 X46.32 Y213.437 I-1.897 J-3.566 E.05884
G1 X41.646 Y218.111 E.21926
G1 X38.014 Y214.48 E.17034
G1 X38.014 Y215.986 E.04993
G1 X42.9 Y211.1 E.22921
G3 X43.156 Y208.108 I3.529 J-1.205 E.1025
G1 X38.014 Y202.966 E.2412
G1 X38.014 Y204.472 E.04993
G1 X54.486 Y188.001 E.77269
G1 X54.486 Y190.653 E.08798
G1 X38.014 Y174.182 E.77269
G1 X38.014 Y175.687 E.04993
G1 X54.486 Y159.216 E.77269
G1 X54.486 Y161.868 E.08798
G1 X38.014 Y145.397 E.77269
G1 X38.014 Y146.902 E.04993
G1 X54.486 Y130.431 E.77269
G1 X54.486 Y133.083 E.08798
G1 X49.278 Y127.876 E.24428
G2 X49.278 Y124.124 I-3.12 J-1.876 E.13075
G1 X54.486 Y118.917 E.24428
G1 X54.486 Y121.569 E.08798
G1 X38.014 Y105.098 E.77269
G1 X38.014 Y106.603 E.04993
G1 X54.486 Y90.132 E.77269
G1 X54.486 Y92.784 E.08798
G1 X38.014 Y76.313 E.77269
G1 X38.014 Y77.818 E.04993
G1 X54.486 Y61.347 E.77269
G1 X54.486 Y63.999 E.08798
G1 X38.014 Y47.528 E.77269
G1 X38.014 Y49.034 E.04993
G1 X43.156 Y43.892 E.2412
G3 X42.9 Y40.9 I3.273 J-1.786 E.1025
G1 X38.014 Y36.014 E.22921
G1 X38.014 Y37.52 E.04993
G1 X41.646 Y33.889 E.17034
G1 X46.32 Y38.563 E.21926
G3 X48.016 Y39.032 I-.201 J4.034 E.05884
G1 X53.16 Y33.889 E.24127
G1 X69.631 Y50.361 E.77269
G1 X71.229 Y50.361 E.053
G1 X87.702 Y33.889 E.77274
G1 X104.173 Y50.361 E.77269
G1 X105.771 Y50.361 E.053
G1 X122.242 Y33.889 E.77269
G1 X127.047 Y38.693 E.22537
G3 X128.956 Y38.689 I.961 J3.774 E.06398
G1 X133.758 Y33.889 E.22522
G1 X150.229 Y50.361 E.77269
G1 X151.827 Y50.361 E.053
G1 X168.298 Y33.889 E.77269
G1 X184.771 Y50.361 E.77273
G1 X186.369 Y50.361 E.053
G1 X202.84 Y33.889 E.77269
G1 X207.981 Y39.029 E.24114
G3 X209.683 Y38.56 I2.081 J4.231 E.05892
G1 X214.354 Y33.889 E.2191
G1 X217.986 Y37.52 E.17034
G1 X217.986 Y36.014 E.04993
G1 X213.096 Y40.904 E.22936
G3 X212.845 Y43.893 I-3.504 J1.21 E.10243
G1 X217.986 Y49.034 E.24117
G1 X217.986 Y47.528 E.04993
G1 X201.514 Y63.999 E.77269
G1 X201.514 Y61.347 E.08798
G1 X217.986 Y77.818 E.77269
G1 X217.986 Y76.313 E.04993
G1 X201.514 Y92.784 E.77269
G1 X201.514 Y90.132 E.08798
G1 X217.986 Y106.603 E.77269
G1 X217.986 Y105.098 E.04993
G1 X201.514 Y121.569 E.77269
G1 X201.514 Y118.917 E.08798
G1 X206.719 Y124.122 E.24417
G3 X207.86 Y122.98 I3.075 J1.932 E.05398
; WIPE_START
G1 X207.135 Y123.574 E-.35597
G1 X206.719 Y124.122 E-.26139
G1 X206.454 Y123.856 E-.14263
; WIPE_END
G1 E-.04 F1800
G1 X204.279 Y131.172 Z1.4 F30000
G1 X201.514 Y140.468 Z1.4
G1 Z1
G1 E.8 F1800
G1 F16200
G1 X201.514 Y138.84 E.05401
G1 X211.025 Y129.33 E.44616
G2 X211.627 Y129.03 I-1.669 J-4.105 E.02234
G1 X217.986 Y135.388 E.29829
G1 X217.986 Y133.883 E.04993
G1 X201.514 Y150.354 E.77269
G1 X201.514 Y147.702 E.08798
G1 X217.986 Y164.173 E.77269
G1 X217.986 Y162.668 E.04993
G1 X201.514 Y179.139 E.77269
G1 X201.514 Y176.487 E.08798
G1 X217.986 Y192.958 E.77269
G1 X217.986 Y191.453 E.04993
G1 X191.328 Y218.111 E1.25058
G1 X174.855 Y201.639 E.77274
G1 X173.257 Y201.639 E.053
G1 X156.786 Y218.111 E.77269
G1 X140.313 Y201.639 E.77273
G1 X138.715 Y201.639 E.053
G1 X131.433 Y208.921 E.34161
G3 X131.553 Y210.15 I-4.72 J1.081 E.04107
G1 X139.515 Y218.111 E.37347
G1 X155.986 Y201.639 E.77269
G1 X157.584 Y201.639 E.053
G1 X174.057 Y218.111 E.77273
G1 X190.528 Y201.639 E.77269
G1 X192.126 Y201.639 E.053
G1 X208.597 Y218.111 E.77269
G1 X217.986 Y208.723 E.44041
G1 X217.986 Y210.229 E.04993
G1 X201.514 Y193.757 E.77269
G1 X201.514 Y196.41 E.08798
G1 X217.986 Y179.939 E.77269
G1 X217.986 Y181.444 E.04993
G1 X201.514 Y164.973 E.77269
G1 X201.514 Y167.625 E.08798
G1 X217.986 Y151.154 E.77269
G1 X217.986 Y152.659 E.04993
G1 X201.514 Y136.188 E.77269
G1 X201.514 Y134.56 E.05401
; WIPE_START
G1 X201.514 Y136.188 E-.61876
G1 X201.777 Y136.451 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X194.162 Y136.956 Z1.4 F30000
G1 X54.486 Y146.225 Z1.4
G1 Z1
G1 E.8 F1800
G1 F16200
G1 X54.486 Y144.597 E.05401
G1 X38.014 Y128.126 E.77269
G1 X38.014 Y129.631 E.04993
G1 X42.923 Y124.723 E.23025
G2 X42.923 Y127.277 I3.356 J1.277 E.08662
G1 X38.014 Y122.369 E.23025
G1 X38.014 Y123.874 E.04993
G1 X54.486 Y107.403 E.77269
G1 X54.486 Y110.055 E.08798
G1 X38.014 Y93.584 E.77269
G1 X38.014 Y95.089 E.04993
G1 X54.486 Y78.618 E.77269
G1 X54.486 Y81.27 E.08798
G1 X38.014 Y64.799 E.77269
G1 X38.014 Y66.304 E.04993
G1 X70.429 Y33.889 E1.52065
G1 X86.902 Y50.361 E.77273
G1 X88.5 Y50.361 E.053
G1 X104.971 Y33.889 E.77269
G1 X121.444 Y50.361 E.77273
G1 X123.042 Y50.361 E.053
G1 X127.726 Y45.677 E.21973
G2 X128.278 Y45.68 I.307 J-4.826 E.01832
G1 X132.958 Y50.361 E.21956
G1 X134.556 Y50.361 E.053
G1 X151.029 Y33.889 E.77273
G1 X167.5 Y50.361 E.77269
G1 X169.098 Y50.361 E.053
G1 X185.571 Y33.889 E.77273
G1 X217.986 Y66.304 E1.52065
G1 X217.986 Y64.799 E.04993
G1 X201.514 Y81.27 E.77269
G1 X201.514 Y78.618 E.08798
G1 X217.986 Y95.089 E.77269
G1 X217.986 Y93.584 E.04993
G1 X201.514 Y110.055 E.77269
G1 X201.514 Y107.403 E.08798
G1 X217.986 Y123.874 E.77269
G1 X217.986 Y122.369 E.04993
G1 X213.075 Y127.279 E.23035
G2 X213.075 Y124.721 I-3.546 J-1.279 E.08659
G1 X217.986 Y129.631 E.23035
G1 X217.986 Y128.126 E.04993
G1 X201.514 Y144.597 E.77269
G1 X201.514 Y141.945 E.08798
G1 X217.986 Y158.416 E.77269
G1 X217.986 Y156.911 E.04993
G1 X201.514 Y173.382 E.77269
G1 X201.514 Y170.73 E.08798
G1 X217.986 Y187.201 E.77269
G1 X217.986 Y185.696 E.04993
G1 X185.571 Y218.111 E1.52065
G1 X169.098 Y201.639 E.77273
G1 X167.5 Y201.639 E.053
G1 X151.029 Y218.111 E.77269
G1 X134.556 Y201.639 E.77273
G1 X132.958 Y201.639 E.053
G1 X128.278 Y206.32 E.21956
G2 X127.726 Y206.323 I-.244 J4.822 E.01832
G1 X123.042 Y201.639 E.21973
G1 X121.444 Y201.639 E.053
G1 X104.971 Y218.111 E.77273
G1 X88.5 Y201.639 E.77269
G1 X86.902 Y201.639 E.053
G1 X70.429 Y218.111 E.77273
G1 X38.014 Y185.696 E1.52065
G1 X38.014 Y187.201 E.04993
G1 X54.486 Y170.73 E.77269
G1 X54.486 Y173.382 E.08798
G1 X38.014 Y156.911 E.77269
G1 X38.014 Y158.416 E.04993
G1 X54.486 Y141.945 E.77269
G1 X54.486 Y140.316 E.05401
G1 X54.486 Y163.344 F30000
G1 F16200
G1 X54.486 Y164.973 E.05401
G1 X38.014 Y181.444 E.77269
G1 X38.014 Y179.939 E.04993
G1 X54.486 Y196.41 E.77269
G1 X54.486 Y193.757 E.08798
G1 X38.014 Y210.229 E.77269
G1 X38.014 Y208.723 E.04993
G1 X47.402 Y218.111 E.44037
G1 X63.874 Y201.639 E.77273
G1 X65.472 Y201.639 E.053
G1 X81.943 Y218.111 E.77269
G1 X98.416 Y201.639 E.77273
G1 X100.014 Y201.639 E.053
G1 X116.485 Y218.111 E.77269
G1 X124.447 Y210.15 E.37349
G3 X124.566 Y208.921 I3.631 J-.269 E.04116
G1 X117.285 Y201.639 E.34159
G1 X115.687 Y201.639 E.053
G1 X99.214 Y218.111 E.77274
G1 X82.743 Y201.639 E.77269
G1 X81.145 Y201.639 E.053
G1 X64.672 Y218.111 E.77273
G1 X38.014 Y191.453 E1.25058
G1 X38.014 Y192.958 E.04993
G1 X54.486 Y176.487 E.77269
G1 X54.486 Y179.139 E.08798
G1 X38.014 Y162.668 E.77269
G1 X38.014 Y164.173 E.04993
G1 X54.486 Y147.702 E.77269
G1 X54.486 Y150.354 E.08798
G1 X38.014 Y133.883 E.77269
G1 X38.014 Y135.388 E.04993
G1 X44.374 Y129.029 E.29832
G2 X44.97 Y129.324 I1.915 J-3.113 E.0221
G1 X54.486 Y138.84 E.4464
G1 X54.486 Y136.188 E.08798
G1 X38.014 Y152.659 E.77269
G1 X38.014 Y151.154 E.04993
G1 X54.486 Y167.625 E.77269
G1 X54.486 Y169.253 E.05401
G1 X54.486 Y71.233 F30000
G1 F16200
G1 X54.486 Y72.861 E.05401
G1 X38.014 Y89.332 E.77269
G1 X38.014 Y87.827 E.04993
G1 X54.486 Y104.298 E.77269
G1 X54.486 Y101.646 E.08798
G1 X38.014 Y118.117 E.77269
G1 X38.014 Y116.612 E.04993
G1 X44.374 Y122.971 E.29832
G3 X44.97 Y122.676 I1.917 J3.118 E.0221
G1 X54.486 Y113.16 E.4464
G1 X54.486 Y115.812 E.08798
G1 X38.014 Y99.341 E.77269
G1 X38.014 Y100.846 E.04993
G1 X54.486 Y84.375 E.77269
G1 X54.486 Y87.027 E.08798
G1 X38.014 Y70.556 E.77269
G1 X38.014 Y72.061 E.04993
G1 X54.486 Y55.59 E.77269
G1 X54.486 Y58.242 E.08798
G1 X38.014 Y41.771 E.77269
G1 X38.014 Y43.277 E.04993
G1 X47.403 Y33.889 E.44041
G1 X63.874 Y50.361 E.77269
G1 X65.472 Y50.361 E.053
G1 X81.943 Y33.889 E.77269
G1 X98.416 Y50.361 E.77273
G1 X100.014 Y50.361 E.053
G1 X116.485 Y33.889 E.77269
G1 X124.447 Y41.85 E.37349
G2 X124.566 Y43.079 I3.63 J.269 E.04116
G1 X117.285 Y50.361 E.34159
G1 X115.687 Y50.361 E.053
G1 X99.214 Y33.889 E.77273
G1 X82.743 Y50.361 E.77269
G1 X81.145 Y50.361 E.053
G1 X64.672 Y33.889 E.77274
G1 X38.014 Y60.547 E1.25058
G1 X38.014 Y59.042 E.04993
G1 X54.486 Y75.513 E.77269
G1 X54.486 Y77.142 E.05401
G1 X54.486 Y50.857 F30000
G1 F16200
G1 X54.486 Y52.486 E.05401
G1 X47.472 Y45.472 E.32901
G1 X47.262 Y45.543 E.00736
G1 X38.014 Y54.79 E.43382
G1 X38.014 Y53.285 E.04993
G1 X54.486 Y69.756 E.77269
G1 X54.486 Y67.104 E.08798
G1 X38.014 Y83.575 E.77269
G1 X38.014 Y82.07 E.04993
G1 X54.486 Y98.541 E.77269
G1 X54.486 Y95.889 E.08798
G1 X38.014 Y112.36 E.77269
G1 X38.014 Y110.855 E.04993
G1 X54.486 Y127.326 E.77269
G1 X54.486 Y124.674 E.08798
G1 X38.014 Y141.145 E.77269
G1 X38.014 Y139.64 E.04993
G1 X54.486 Y156.111 E.77269
G1 X54.486 Y153.459 E.08798
G1 X38.014 Y169.93 E.77269
G1 X38.014 Y168.425 E.04993
G1 X54.486 Y184.896 E.77269
G1 X54.486 Y182.244 E.08798
G1 X38.014 Y198.715 E.77269
G1 X38.014 Y197.21 E.04993
G1 X47.262 Y206.457 E.43382
G1 X47.472 Y206.528 E.00736
G1 X54.486 Y199.514 E.32901
G1 X54.486 Y201.639 E.07049
G1 X58.117 Y201.639 E.12048
G1 X49.813 Y209.944 E.38957
G2 X49.668 Y208.863 I-5.77 J.224 E.03621
G1 X58.917 Y218.111 E.43385
G1 X75.388 Y201.639 E.77269
G1 X76.986 Y201.639 E.053
G1 X93.459 Y218.111 E.77273
G1 X109.93 Y201.639 E.77269
G1 X111.528 Y201.639 E.053
G1 X128.001 Y218.111 E.77273
G1 X144.472 Y201.639 E.77269
G1 X146.07 Y201.639 E.053
G1 X162.543 Y218.111 E.77274
G1 X179.014 Y201.639 E.77269
G1 X180.612 Y201.639 E.053
G1 X197.083 Y218.111 E.77269
G1 X206.335 Y208.86 E.43402
G2 X206.188 Y209.945 I5.124 J1.249 E.03639
G1 X197.882 Y201.639 E.38962
G1 X196.285 Y201.639 E.053
G1 X179.812 Y218.111 E.77274
G1 X163.341 Y201.639 E.77269
G1 X161.743 Y201.639 E.053
G1 X145.27 Y218.111 E.77274
G1 X128.799 Y201.639 E.77269
G1 X127.201 Y201.639 E.053
G1 X110.728 Y218.111 E.77273
G1 X94.257 Y201.639 E.77269
G1 X92.659 Y201.639 E.053
G1 X76.186 Y218.111 E.77273
G1 X59.715 Y201.639 E.77269
G1 X61.344 Y201.639 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F16200
G1 X59.715 Y201.639 E-.61876
G1 X59.978 Y201.902 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/15
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
G17
G3 Z1.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 15
G1 X125.834 Y212.252
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F16213.044
G1 X125.648 Y212.058 E.00891
G3 X127.736 Y206.672 I2.361 J-2.182 E.23804
G3 X129.175 Y206.879 I.262 J3.277 E.04865
G3 X125.882 Y212.287 I-1.167 J2.996 E.37253
G1 X126.116 Y211.958 F30000
G1 F16213.044
G1 X125.946 Y211.781 E.00814
G3 X127.766 Y207.078 I2.064 J-1.905 E.20773
G3 X128.761 Y207.17 I.25 J2.725 E.03333
G3 X126.164 Y211.993 I-.752 J2.706 E.33425
G1 X126.387 Y211.652 F30000
G1 F16213.044
G1 X126.09 Y211.321 E.01473
G3 X127.797 Y207.484 I1.918 J-1.446 E.16957
G3 X128.651 Y207.562 I.13 J3.278 E.02853
G3 X126.434 Y211.689 I-.643 J2.314 E.28562
G1 X126.627 Y211.336 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X126.405 Y211.083 E.01036
G3 X127.826 Y207.875 I1.604 J-1.208 E.13116
G3 X128.349 Y207.895 I.177 J2.148 E.01612
G3 X126.675 Y211.376 I-.34 J1.98 E.22823
G1 X126.673 Y211.375 E.00007
; WIPE_START
M204 S10000
G1 X126.405 Y211.083 E-.15067
G1 X126.189 Y210.747 E-.15181
G1 X126.052 Y210.371 E-.15211
G1 X125.992 Y209.975 E-.15215
G1 X126.012 Y209.575 E-.15212
G1 X126.013 Y209.572 E-.00115
; WIPE_END
G1 E-.04 F1800
G1 X118.383 Y209.394 Z1.6 F30000
G1 X43.928 Y207.65 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X44.127 Y207.469 E.00891
G3 X45.986 Y206.672 I2.132 J2.406 E.06826
G3 X47.426 Y206.879 I.262 J3.277 E.04866
G3 X43.893 Y207.698 I-1.167 J2.996 E.5423
G1 X44.214 Y207.939 F30000
G1 F16213.044
G1 X44.396 Y207.774 E.00814
G3 X46.016 Y207.078 I1.863 J2.102 E.05951
G3 X47.011 Y207.17 I.25 J2.725 E.03333
G3 X44.18 Y207.988 I-.752 J2.706 E.48249
G1 X44.514 Y208.218 F30000
G1 F16213.044
G1 X44.851 Y207.929 E.01473
G3 X46.047 Y207.484 I1.407 J1.946 E.04283
G3 X46.901 Y207.562 I.13 J3.278 E.02853
G3 X44.477 Y208.265 I-.643 J2.314 E.41237
G1 X44.771 Y208.514 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X44.782 Y208.513 E.00035
G3 X46.076 Y207.875 I1.477 J1.362 E.04534
G3 X46.599 Y207.895 I.177 J2.148 E.01612
G3 X44.543 Y208.832 I-.34 J1.98 E.31405
G1 X44.736 Y208.563 E.01017
; WIPE_START
M204 S10000
G1 X44.782 Y208.513 E-.02585
G1 X45.077 Y208.243 E-.15183
G1 X45.423 Y208.043 E-.15211
G1 X45.803 Y207.915 E-.1521
G1 X46.076 Y207.875 E-.10504
G1 X46.4 Y207.87 E-.12317
G1 X46.53 Y207.887 E-.0499
; WIPE_END
G1 E-.04 F1800
G1 X46.801 Y200.259 Z1.6 F30000
G1 X49.444 Y125.628 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X49.458 Y125.679 E.00174
G3 X45.986 Y122.797 I-3.199 J.321 E.5042
G3 X47.426 Y123.004 I.262 J3.278 E.04866
G3 X49.41 Y125.361 I-1.167 J2.996 E.10657
G1 X49.437 Y125.569 E.00695
G1 X49.041 Y125.686 F30000
G1 F16213.044
G1 X49.054 Y125.719 E.00118
G3 X46.016 Y123.203 I-2.795 J.282 E.44034
G3 X47.011 Y123.295 I.25 J2.728 E.03332
G3 X49.012 Y125.442 I-.752 J2.706 E.10243
G1 X49.034 Y125.627 E.00619
G1 X48.629 Y125.762 F30000
G1 F16213.044
G1 X48.659 Y126 E.00796
G3 X46.047 Y123.609 I-2.401 J.001 E.3684
G3 X46.901 Y123.687 I.13 J3.282 E.02853
G3 X48.611 Y125.523 I-.643 J2.314 E.08758
G1 X48.625 Y125.702 E.00597
G1 X48.221 Y125.657 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X48.258 Y125.799 E.0045
G3 X46.076 Y124 I-1.999 J.201 E.29139
G3 X46.599 Y124.02 I.177 J2.148 E.01612
G3 X48.178 Y125.405 I-.34 J1.98 E.06791
G1 X48.211 Y125.598 E.006
; WIPE_START
M204 S10000
G1 X48.258 Y125.799 E-.07845
G1 X48.25 Y126.2 E-.15244
G1 X48.171 Y126.592 E-.15208
G1 X48.015 Y126.961 E-.15218
G1 X47.79 Y127.292 E-.1521
G1 X47.653 Y127.426 E-.07276
; WIPE_END
G1 E-.04 F1800
G1 X54.531 Y130.735 Z1.6 F30000
G1 X201.166 Y201.291 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X54.834 Y201.291 E4.85411
G1 X54.834 Y50.709 E4.99509
G1 X201.166 Y50.709 E4.85411
G1 X201.166 Y201.231 E4.9931
G1 X200.759 Y200.884 F30000
G1 F16213.044
G1 X55.241 Y200.884 E4.82711
G1 X55.241 Y51.116 E4.96809
G1 X200.759 Y51.116 E4.82711
G1 X200.759 Y200.824 E4.9661
G1 X200.352 Y200.477 F30000
G1 F16213.044
G1 X55.648 Y200.477 E4.8001
G1 X55.648 Y51.523 E4.94108
G1 X200.352 Y51.523 E4.8001
G1 X200.352 Y200.417 E4.93909
G1 X199.96 Y200.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X56.04 Y200.085 E4.42226
G1 X56.04 Y51.915 E4.55285
G1 X199.96 Y51.915 E4.42226
G1 X199.96 Y200.025 E4.55101
; WIPE_START
M204 S10000
G1 X197.96 Y200.026 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X192.695 Y194.5 Z1.6 F30000
G1 X44.786 Y39.264 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X44.929 Y39.198 E.00524
G3 X45.986 Y38.922 I1.33 J2.927 E.03641
G3 X47.426 Y39.13 I.262 J3.278 E.04866
G3 X44.645 Y39.345 I-1.167 J2.996 E.57441
G1 X44.734 Y39.294 E.00339
G1 X45.272 Y39.493 F30000
G1 F16213.044
G1 X45.357 Y39.466 E.00294
G3 X46.016 Y39.328 I.903 J2.66 E.02241
G3 X47.011 Y39.42 I.25 J2.728 E.03332
G3 X45.097 Y39.569 I-.752 J2.706 E.5204
G1 X45.217 Y39.517 E.00435
G1 X45.761 Y39.776 F30000
G1 F16213.044
G1 X46.047 Y39.734 E.00957
G3 X46.901 Y39.812 I.13 J3.282 E.02853
G3 X45.703 Y39.789 I-.643 J2.314 E.46035
G1 X46.065 Y40.126 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X46.076 Y40.125 E.00033
G3 X46.599 Y40.145 I.177 J2.148 E.01612
G3 X45.804 Y40.169 I-.34 J1.98 E.36317
M73 P48 R30
G1 X46.006 Y40.136 E.0063
; WIPE_START
M204 S10000
G1 X46.076 Y40.125 E-.02693
G1 X46.4 Y40.12 E-.12317
G1 X46.599 Y40.145 E-.07617
G1 X46.985 Y40.254 E-.15215
G1 X47.341 Y40.436 E-.15207
G1 X47.654 Y40.686 E-.15212
G1 X47.785 Y40.842 E-.07739
; WIPE_END
G1 E-.04 F1800
G1 X55.415 Y40.689 Z1.6 F30000
G1 X126.535 Y39.264 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X126.679 Y39.198 E.00526
G3 X127.736 Y38.922 I1.329 J2.927 E.03641
G3 X129.176 Y39.129 I.262 J3.278 E.04866
G3 X126.395 Y39.345 I-1.167 J2.996 E.57441
G1 X126.483 Y39.294 E.00338
G1 X127.022 Y39.494 F30000
G1 F16213.044
G1 X127.107 Y39.466 E.00296
G3 X127.766 Y39.328 I.903 J2.66 E.02241
G3 X128.761 Y39.42 I.25 J2.728 E.03332
G3 X126.847 Y39.569 I-.752 J2.706 E.52041
G1 X126.967 Y39.517 E.00433
G1 X127.511 Y39.776 F30000
G1 F16213.044
G1 X127.797 Y39.734 E.0096
G3 X128.651 Y39.812 I.13 J3.282 E.02853
G3 X127.452 Y39.79 I-.643 J2.314 E.46033
G1 X127.823 Y40.125 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X127.826 Y40.125 E.00009
G3 X128.349 Y40.145 I.177 J2.148 E.01612
G3 X127.553 Y40.169 I-.34 J1.98 E.36317
G1 X127.764 Y40.135 E.00656
; WIPE_START
M204 S10000
G1 X127.826 Y40.125 E-.02388
G1 X128.15 Y40.12 E-.12316
G1 X128.349 Y40.145 E-.07617
G1 X128.735 Y40.254 E-.15215
G1 X129.091 Y40.436 E-.15207
G1 X129.404 Y40.686 E-.15212
G1 X129.54 Y40.848 E-.08044
; WIPE_END
G1 E-.04 F1800
G1 X137.17 Y40.68 Z1.6 F30000
G1 X210.724 Y39.062 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X210.926 Y39.13 E.00707
G3 X209.486 Y38.922 I-1.167 J2.996 E.62143
G3 X210.621 Y39.029 I.262 J3.278 E.03801
G1 X210.666 Y39.044 E.00159
G1 X210.276 Y39.366 F30000
G1 F16213.044
G1 X210.511 Y39.42 E.00798
G3 X209.516 Y39.328 I-.752 J2.706 E.5521
G3 X210.218 Y39.354 I.25 J2.728 E.02335
G1 X209.831 Y39.73 F30000
G1 F16213.044
G1 X209.929 Y39.741 E.00325
G3 X210.401 Y39.812 I-.252 J3.275 E.01585
G3 X209.547 Y39.734 I-.643 J2.314 E.47192
G1 X209.771 Y39.731 E.00745
G1 X209.573 Y40.125 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.576 Y40.125 E.00009
G3 X210.099 Y40.145 I.177 J2.148 E.01612
G3 X209.303 Y40.169 I-.34 J1.98 E.36317
G1 X209.514 Y40.135 E.00655
; WIPE_START
M204 S10000
G1 X209.576 Y40.125 E-.02393
G1 X209.9 Y40.12 E-.12317
G1 X210.099 Y40.145 E-.07617
G1 X210.484 Y40.254 E-.15215
G1 X210.841 Y40.436 E-.15207
G1 X211.154 Y40.686 E-.15216
G1 X211.29 Y40.848 E-.08037
; WIPE_END
G1 E-.04 F1800
G1 X211.011 Y48.475 Z1.6 F30000
G1 X208.285 Y123.139 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X208.429 Y123.073 E.00526
G3 X209.486 Y122.797 I1.329 J2.927 E.0364
G3 X210.926 Y123.004 I.262 J3.278 E.04866
G3 X208.145 Y123.22 I-1.167 J2.996 E.57441
G1 X208.233 Y123.169 E.00338
G1 X208.772 Y123.369 F30000
G1 F16213.044
G1 X208.857 Y123.341 E.00296
G3 X209.516 Y123.203 I.903 J2.66 E.02241
G3 X210.511 Y123.295 I.25 J2.728 E.03332
G3 X208.597 Y123.444 I-.752 J2.706 E.52041
G1 X208.717 Y123.392 E.00433
G1 X209.261 Y123.651 F30000
G1 F16213.044
G1 X209.547 Y123.609 E.00959
G3 X210.401 Y123.687 I.13 J3.282 E.02853
G3 X209.202 Y123.665 I-.643 J2.314 E.46033
G1 X209.573 Y124 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.576 Y124 E.00009
G3 X210.099 Y124.02 I.177 J2.148 E.01612
G3 X209.303 Y124.044 I-.34 J1.98 E.36317
G1 X209.514 Y124.01 E.00655
; WIPE_START
M204 S10000
G1 X209.576 Y124 E-.02393
G1 X209.9 Y123.995 E-.12317
G1 X210.099 Y124.02 E-.07617
G1 X210.484 Y124.129 E-.15213
G1 X210.841 Y124.311 E-.15208
G1 X211.154 Y124.561 E-.15216
G1 X211.29 Y124.723 E-.08036
; WIPE_END
G1 E-.04 F1800
G1 X211.011 Y132.35 Z1.6 F30000
G1 X208.285 Y207.014 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X208.429 Y206.948 E.00525
G3 X209.486 Y206.672 I1.329 J2.927 E.0364
G3 X210.926 Y206.88 I.262 J3.277 E.04866
G3 X208.145 Y207.095 I-1.167 J2.996 E.5744
G1 X208.233 Y207.044 E.00339
G1 X208.772 Y207.244 F30000
G1 F16213.044
G1 X208.857 Y207.216 E.00295
G3 X209.516 Y207.078 I.903 J2.66 E.02241
G3 X210.511 Y207.17 I.25 J2.727 E.03333
G3 X208.597 Y207.319 I-.752 J2.706 E.5204
G1 X208.717 Y207.267 E.00434
G1 X209.261 Y207.526 F30000
G1 F16213.044
G1 X209.547 Y207.484 E.00958
G3 X210.401 Y207.562 I.13 J3.28 E.02853
G3 X209.203 Y207.539 I-.643 J2.314 E.46034
G1 X209.567 Y207.876 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.576 Y207.875 E.00028
G3 X210.099 Y207.895 I.177 J2.148 E.01612
G3 X209.303 Y207.919 I-.34 J1.98 E.36317
G1 X209.508 Y207.886 E.00636
; WIPE_START
M204 S10000
G1 X209.576 Y207.875 E-.02625
G1 X209.9 Y207.87 E-.12317
G1 X210.099 Y207.895 E-.07617
G1 X210.294 Y207.94 E-.07615
G1 X210.667 Y208.086 E-.15212
G1 X211.003 Y208.303 E-.15211
G1 X211.29 Y208.583 E-.15213
G1 X211.293 Y208.587 E-.00189
; WIPE_END
G1 E-.04 F1800
G1 X215.725 Y214.801 Z1.6 F30000
G1 X218.334 Y218.459 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X37.666 Y218.459 E5.99308
G1 X37.666 Y33.541 E6.13406
G1 X218.334 Y33.541 E5.99308
G1 X218.334 Y218.399 E6.13207
G1 X218.741 Y218.866 F30000
G1 F16213.044
G1 X37.259 Y218.866 E6.02008
G1 X37.259 Y33.134 E6.16106
G1 X218.741 Y33.134 E6.02008
G1 X218.741 Y218.806 E6.15907
G1 X219.148 Y219.273 F30000
G1 F16213.044
G1 X36.852 Y219.273 E6.04709
G1 X36.852 Y32.727 E6.18807
G1 X219.148 Y32.727 E6.04709
G1 X219.148 Y219.213 E6.18608
G1 X219.54 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X36.46 Y219.665 E5.62554
G1 X36.46 Y32.335 E5.75613
G1 X219.54 Y32.335 E5.62554
G1 X219.54 Y219.605 E5.75429
; WIPE_START
M204 S10000
G1 X217.54 Y219.606 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X216.127 Y212.105 Z1.6 F30000
G1 X201.514 Y134.56 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X201.514 Y136.188 E.05401
G1 X217.986 Y152.659 E.77269
G1 X217.986 Y151.154 E.04993
G1 X201.514 Y167.625 E.77269
G1 X201.514 Y164.973 E.08798
G1 X217.986 Y181.444 E.77269
G1 X217.986 Y179.939 E.04993
G1 X201.514 Y196.41 E.77269
G1 X201.514 Y193.757 E.08798
G1 X217.986 Y210.229 E.77269
G1 X217.986 Y208.723 E.04993
G1 X208.597 Y218.111 E.44041
G1 X192.126 Y201.639 E.77269
G1 X190.528 Y201.639 E.053
G1 X174.057 Y218.111 E.77269
G1 X157.584 Y201.639 E.77273
G1 X155.986 Y201.639 E.053
G1 X139.515 Y218.111 E.77269
G1 X131.553 Y210.15 E.37347
G2 X131.433 Y208.921 I-4.841 J-.148 E.04107
G1 X138.715 Y201.639 E.34161
G1 X140.313 Y201.639 E.053
M73 P48 R29
G1 X156.786 Y218.111 E.77273
G1 X173.257 Y201.639 E.77269
G1 X174.855 Y201.639 E.053
G1 X191.328 Y218.111 E.77274
G1 X217.986 Y191.453 E1.25058
G1 X217.986 Y192.958 E.04993
G1 X201.514 Y176.487 E.77269
G1 X201.514 Y179.139 E.08798
G1 X217.986 Y162.668 E.77269
G1 X217.986 Y164.173 E.04993
G1 X201.514 Y147.702 E.77269
G1 X201.514 Y150.354 E.08798
G1 X217.986 Y133.883 E.77269
G1 X217.986 Y135.388 E.04993
G1 X211.627 Y129.03 E.29829
G3 X211.025 Y129.33 I-2.269 J-3.8 E.02234
G1 X201.514 Y138.84 E.44616
G1 X201.514 Y140.468 E.05401
; WIPE_START
G1 X201.514 Y138.84 E-.61876
G1 X201.777 Y138.577 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X204.55 Y131.466 Z1.6 F30000
G1 X207.86 Y122.98 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F16200
G2 X206.719 Y124.122 I1.935 J3.074 E.05398
G1 X201.514 Y118.917 E.24417
G1 X201.514 Y121.569 E.08798
G1 X217.986 Y105.098 E.77269
G1 X217.986 Y106.603 E.04993
G1 X201.514 Y90.132 E.77269
G1 X201.514 Y92.784 E.08798
G1 X217.986 Y76.313 E.77269
G1 X217.986 Y77.818 E.04993
G1 X201.514 Y61.347 E.77269
G1 X201.514 Y63.999 E.08798
G1 X217.986 Y47.528 E.77269
G1 X217.986 Y49.034 E.04993
G1 X212.845 Y43.893 E.24117
G2 X213.096 Y40.904 I-3.253 J-1.779 E.10243
G1 X217.986 Y36.014 E.22936
G1 X217.986 Y37.52 E.04993
G1 X214.354 Y33.889 E.17034
G1 X209.672 Y38.571 E.21964
G2 X207.981 Y39.029 I.039 J3.499 E.05873
G1 X202.84 Y33.889 E.24114
G1 X186.369 Y50.361 E.77269
G1 X184.771 Y50.361 E.053
G1 X168.298 Y33.889 E.77273
G1 X151.827 Y50.361 E.77269
G1 X150.229 Y50.361 E.053
G1 X133.758 Y33.889 E.77269
G1 X128.956 Y38.689 E.22522
G2 X127.047 Y38.693 I-.948 J3.726 E.064
G1 X122.242 Y33.889 E.22537
G1 X105.771 Y50.361 E.77269
G1 X104.173 Y50.361 E.053
G1 X87.702 Y33.889 E.77269
G1 X71.229 Y50.361 E.77274
G1 X69.631 Y50.361 E.053
G1 X53.16 Y33.889 E.77269
G1 X48.016 Y39.032 E.24127
G2 X46.327 Y38.57 I-1.853 J3.455 E.05861
G1 X41.646 Y33.889 E.21956
G1 X38.014 Y37.52 E.17034
G1 X38.014 Y36.014 E.04993
G1 X42.9 Y40.9 E.22921
G2 X43.156 Y43.892 I3.529 J1.205 E.1025
G1 X38.014 Y49.034 E.2412
G1 X38.014 Y47.528 E.04993
G1 X54.486 Y63.999 E.77269
G1 X54.486 Y61.347 E.08798
G1 X38.014 Y77.818 E.77269
G1 X38.014 Y76.313 E.04993
G1 X54.486 Y92.784 E.77269
G1 X54.486 Y90.132 E.08798
G1 X38.014 Y106.603 E.77269
G1 X38.014 Y105.098 E.04993
G1 X54.486 Y121.569 E.77269
G1 X54.486 Y118.917 E.08798
G1 X49.278 Y124.124 E.24428
G3 X49.278 Y127.876 I-3.12 J1.876 E.13075
G1 X54.486 Y133.083 E.24428
G1 X54.486 Y130.431 E.08798
G1 X38.014 Y146.902 E.77269
G1 X38.014 Y145.397 E.04993
G1 X54.486 Y161.868 E.77269
G1 X54.486 Y159.216 E.08798
G1 X38.014 Y175.687 E.77269
G1 X38.014 Y174.182 E.04993
G1 X54.486 Y190.653 E.77269
G1 X54.486 Y188.001 E.08798
G1 X38.014 Y204.472 E.77269
G1 X38.014 Y202.966 E.04993
G1 X43.156 Y208.108 E.2412
G2 X42.9 Y211.1 I3.273 J1.786 E.1025
G1 X38.014 Y215.986 E.22921
G1 X38.014 Y214.48 E.04993
G1 X41.646 Y218.111 E.17034
G1 X46.32 Y213.437 E.21926
G2 X48.016 Y212.968 I-.201 J-4.034 E.05884
G1 X53.16 Y218.111 E.24127
G1 X69.631 Y201.639 E.77269
G1 X71.229 Y201.639 E.053
G1 X87.702 Y218.111 E.77273
G1 X104.173 Y201.639 E.77269
G1 X105.771 Y201.639 E.053
G1 X122.242 Y218.111 E.77269
G1 X127.047 Y213.307 E.22537
G2 X128.956 Y213.311 I.961 J-3.903 E.06394
G1 X133.758 Y218.111 E.22522
G1 X150.229 Y201.639 E.77269
G1 X151.827 Y201.639 E.053
G1 X168.298 Y218.111 E.77269
G1 X184.771 Y201.639 E.77274
G1 X186.369 Y201.639 E.053
G1 X202.84 Y218.111 E.77269
G1 X207.981 Y212.971 E.24114
G2 X209.683 Y213.44 I1.944 J-3.734 E.05901
G1 X214.354 Y218.111 E.2191
G1 X217.986 Y214.48 E.17034
G1 X217.986 Y215.986 E.04993
G1 X213.096 Y211.096 E.22936
G2 X212.845 Y208.107 I-3.504 J-1.21 E.10243
G1 X217.986 Y202.966 E.24117
G1 X217.986 Y204.472 E.04993
G1 X201.514 Y188.001 E.77269
G1 X201.514 Y190.653 E.08798
G1 X217.986 Y174.182 E.77269
G1 X217.986 Y175.687 E.04993
G1 X201.514 Y159.216 E.77269
G1 X201.514 Y161.868 E.08798
G1 X217.986 Y145.397 E.77269
G1 X217.986 Y146.902 E.04993
G1 X201.514 Y130.431 E.77269
G1 X201.514 Y133.083 E.08798
G1 X206.719 Y127.878 E.24417
G2 X207.86 Y129.02 I3.077 J-1.933 E.05398
; WIPE_START
G1 X207.135 Y128.426 E-.35606
G1 X206.719 Y127.878 E-.2613
G1 X206.454 Y128.144 E-.14264
; WIPE_END
G1 E-.04 F1800
G1 X204.797 Y120.693 Z1.6 F30000
G1 X201.514 Y105.927 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F16200
G1 X201.514 Y104.298 E.05401
G1 X217.986 Y87.827 E.77269
G1 X217.986 Y89.332 E.04993
G1 X201.514 Y72.861 E.77269
G1 X201.514 Y75.513 E.08798
G1 X217.986 Y59.042 E.77269
G1 X217.986 Y60.547 E.04993
G1 X191.328 Y33.889 E1.25058
G1 X174.855 Y50.361 E.77273
G1 X173.257 Y50.361 E.053
G1 X156.786 Y33.889 E.77269
M73 P49 R29
G1 X140.313 Y50.361 E.77274
G1 X138.715 Y50.361 E.053
G1 X131.433 Y43.079 E.34161
G2 X131.553 Y41.85 I-4.72 J-1.08 E.04107
G1 X139.515 Y33.889 E.37347
G1 X155.986 Y50.361 E.77269
G1 X157.584 Y50.361 E.053
G1 X174.057 Y33.889 E.77273
G1 X190.528 Y50.361 E.77269
G1 X192.126 Y50.361 E.053
G1 X208.597 Y33.889 E.77269
G1 X217.986 Y43.277 E.44041
G1 X217.986 Y41.771 E.04993
G1 X201.514 Y58.243 E.77269
G1 X201.514 Y55.59 E.08798
G1 X217.986 Y72.061 E.77269
G1 X217.986 Y70.556 E.04993
G1 X201.514 Y87.027 E.77269
G1 X201.514 Y84.375 E.08798
G1 X217.986 Y100.846 E.77269
G1 X217.986 Y99.341 E.04993
G1 X201.514 Y115.812 E.77269
G1 X201.514 Y113.16 E.08798
G1 X211.025 Y122.67 E.44616
G3 X211.627 Y122.97 I-1.666 J4.098 E.02234
G1 X217.986 Y116.612 E.29829
G1 X217.986 Y118.117 E.04993
G1 X201.514 Y101.646 E.77269
G1 X201.514 Y100.018 E.05401
; WIPE_START
G1 X201.514 Y101.646 E-.61876
G1 X201.777 Y101.909 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X200.733 Y94.348 Z1.6 F30000
G1 X194.656 Y50.361 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F16200
G1 X196.285 Y50.361 E.05401
G1 X179.814 Y33.889 E.77269
G1 X163.341 Y50.361 E.77273
G1 X161.743 Y50.361 E.053
G1 X145.272 Y33.889 E.77269
G1 X128.799 Y50.361 E.77273
G1 X127.201 Y50.361 E.053
G1 X110.73 Y33.889 E.77269
G1 X94.257 Y50.361 E.77274
G1 X92.659 Y50.361 E.053
G1 X76.188 Y33.889 E.77269
G1 X59.715 Y50.361 E.77274
G1 X58.117 Y50.361 E.053
G1 X49.813 Y42.056 E.38957
G3 X49.668 Y43.137 I-5.771 J-.224 E.03621
G1 X58.917 Y33.889 E.43385
G1 X75.388 Y50.361 E.77269
G1 X76.986 Y50.361 E.053
G1 X93.459 Y33.889 E.77274
G1 X109.93 Y50.361 E.77269
G1 X111.528 Y50.361 E.053
G1 X128.001 Y33.889 E.77273
G1 X144.472 Y50.361 E.77269
G1 X146.07 Y50.361 E.053
G1 X162.543 Y33.889 E.77274
G1 X179.014 Y50.361 E.77269
G1 X180.612 Y50.361 E.053
G1 X197.085 Y33.889 E.77273
G1 X206.335 Y43.14 E.43397
G3 X206.188 Y42.055 I5.123 J-1.249 E.03639
G1 X197.883 Y50.361 E.38962
G1 X201.514 Y50.361 E.12048
G1 X201.514 Y52.486 E.07049
G1 X208.528 Y45.472 E.32902
G2 X208.735 Y45.54 I.442 J-1 E.00724
G1 X217.986 Y54.79 E.43396
G1 X217.986 Y53.285 E.04993
G1 X201.514 Y69.756 E.77269
G1 X201.514 Y67.104 E.08798
G1 X217.986 Y83.575 E.77269
G1 X217.986 Y82.07 E.04993
G1 X201.514 Y98.541 E.77269
G1 X201.514 Y95.889 E.08798
G1 X217.986 Y112.36 E.77269
G1 X217.986 Y110.855 E.04993
G1 X201.514 Y127.326 E.77269
G1 X201.514 Y124.674 E.08798
G1 X217.986 Y141.145 E.77269
G1 X217.986 Y139.64 E.04993
G1 X201.514 Y156.111 E.77269
G1 X201.514 Y153.459 E.08798
G1 X217.986 Y169.93 E.77269
G1 X217.986 Y168.425 E.04993
G1 X201.514 Y184.896 E.77269
G1 X201.514 Y182.244 E.08798
G1 X217.986 Y198.715 E.77269
G1 X217.986 Y197.21 E.04993
G1 X208.735 Y206.46 E.43396
G2 X208.528 Y206.528 I.236 J1.071 E.00724
G1 X201.514 Y199.514 E.32901
G1 X201.514 Y201.143 E.05401
; WIPE_START
G1 X201.514 Y199.514 E-.61876
G1 X201.777 Y199.777 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X194.145 Y199.878 Z1.6 F30000
G1 X61.344 Y201.639 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F16200
G1 X59.715 Y201.639 E.05401
G1 X76.186 Y218.111 E.77269
G1 X92.659 Y201.639 E.77273
G1 X94.257 Y201.639 E.053
G1 X110.728 Y218.111 E.77269
G1 X127.201 Y201.639 E.77273
G1 X128.799 Y201.639 E.053
G1 X145.27 Y218.111 E.77269
G1 X161.743 Y201.639 E.77274
G1 X163.341 Y201.639 E.053
G1 X179.812 Y218.111 E.77269
G1 X196.285 Y201.639 E.77274
G1 X197.882 Y201.639 E.053
G1 X206.188 Y209.945 E.38962
G3 X206.335 Y208.86 I5.273 J.164 E.03639
G1 X197.083 Y218.111 E.43402
G1 X180.612 Y201.639 E.77269
G1 X179.014 Y201.639 E.053
G1 X162.543 Y218.111 E.77269
G1 X146.07 Y201.639 E.77274
G1 X144.472 Y201.639 E.053
G1 X128.001 Y218.111 E.77269
G1 X111.528 Y201.639 E.77273
G1 X109.93 Y201.639 E.053
G1 X93.459 Y218.111 E.77269
G1 X76.986 Y201.639 E.77273
G1 X75.388 Y201.639 E.053
G1 X58.917 Y218.111 E.77269
G1 X49.668 Y208.863 E.43385
G3 X49.813 Y209.944 I-5.627 J1.305 E.03621
G1 X58.117 Y201.639 E.38957
G1 X54.486 Y201.639 E.12048
G1 X54.486 Y199.514 E.07049
G1 X47.472 Y206.528 E.32901
G1 X47.262 Y206.457 E.00736
G1 X38.014 Y197.21 E.43382
G1 X38.014 Y198.715 E.04993
G1 X54.486 Y182.244 E.77269
G1 X54.486 Y184.896 E.08798
G1 X38.014 Y168.425 E.77269
G1 X38.014 Y169.93 E.04993
G1 X54.486 Y153.459 E.77269
G1 X54.486 Y156.111 E.08798
G1 X38.014 Y139.64 E.77269
G1 X38.014 Y141.145 E.04993
G1 X54.486 Y124.674 E.77269
G1 X54.486 Y127.326 E.08798
G1 X38.014 Y110.855 E.77269
G1 X38.014 Y112.36 E.04993
G1 X54.486 Y95.889 E.77269
G1 X54.486 Y98.541 E.08798
G1 X38.014 Y82.07 E.77269
G1 X38.014 Y83.575 E.04993
G1 X54.486 Y67.104 E.77269
G1 X54.486 Y69.756 E.08798
G1 X38.014 Y53.285 E.77269
G1 X38.014 Y54.79 E.04993
G1 X47.262 Y45.543 E.43382
G1 X47.472 Y45.472 E.00736
G1 X54.486 Y52.486 E.32901
G1 X54.486 Y50.857 E.05401
G1 X54.486 Y77.142 F30000
G1 F16200
G1 X54.486 Y75.513 E.05401
G1 X38.014 Y59.042 E.77269
G1 X38.014 Y60.547 E.04993
G1 X64.672 Y33.889 E1.25058
G1 X81.145 Y50.361 E.77274
G1 X82.743 Y50.361 E.053
G1 X99.214 Y33.889 E.77269
G1 X115.687 Y50.361 E.77273
G1 X117.285 Y50.361 E.053
G1 X124.566 Y43.079 E.34159
G3 X124.447 Y41.85 I3.512 J-.96 E.04116
G1 X116.485 Y33.889 E.37349
G1 X100.014 Y50.361 E.77269
G1 X98.416 Y50.361 E.053
G1 X81.943 Y33.889 E.77273
G1 X65.472 Y50.361 E.77269
G1 X63.874 Y50.361 E.053
G1 X47.403 Y33.889 E.77269
G1 X38.014 Y43.277 E.44041
G1 X38.014 Y41.771 E.04993
G1 X54.486 Y58.242 E.77269
G1 X54.486 Y55.59 E.08798
G1 X38.014 Y72.061 E.77269
G1 X38.014 Y70.556 E.04993
G1 X54.486 Y87.027 E.77269
G1 X54.486 Y84.375 E.08798
G1 X38.014 Y100.846 E.77269
G1 X38.014 Y99.341 E.04993
G1 X54.486 Y115.812 E.77269
G1 X54.486 Y113.16 E.08798
G1 X44.97 Y122.676 E.4464
G2 X44.374 Y122.971 I1.322 J3.416 E.0221
G1 X38.014 Y116.612 E.29832
G1 X38.014 Y118.117 E.04993
G1 X54.486 Y101.646 E.77269
G1 X54.486 Y104.298 E.08798
G1 X38.014 Y87.827 E.77269
G1 X38.014 Y89.332 E.04993
G1 X54.486 Y72.861 E.77269
G1 X54.486 Y71.233 E.05401
G1 X54.486 Y140.316 F30000
G1 F16200
G1 X54.486 Y141.945 E.05401
G1 X38.014 Y158.416 E.77269
G1 X38.014 Y156.911 E.04993
G1 X54.486 Y173.382 E.77269
G1 X54.486 Y170.73 E.08798
G1 X38.014 Y187.201 E.77269
G1 X38.014 Y185.696 E.04993
G1 X70.429 Y218.111 E1.52065
G1 X86.902 Y201.639 E.77273
G1 X88.5 Y201.639 E.053
G1 X104.971 Y218.111 E.77269
G1 X121.444 Y201.639 E.77273
G1 X123.042 Y201.639 E.053
G1 X127.726 Y206.324 E.21974
G3 X128.278 Y206.32 I.29 J2.018 E.01836
G1 X132.958 Y201.639 E.21956
G1 X134.556 Y201.639 E.053
G1 X151.029 Y218.111 E.77273
G1 X167.5 Y201.639 E.77269
G1 X169.098 Y201.639 E.053
G1 X185.571 Y218.111 E.77273
G1 X217.986 Y185.696 E1.52065
G1 X217.986 Y187.201 E.04993
G1 X201.514 Y170.73 E.77269
G1 X201.514 Y173.382 E.08798
G1 X217.986 Y156.911 E.77269
G1 X217.986 Y158.416 E.04993
G1 X201.514 Y141.945 E.77269
G1 X201.514 Y144.597 E.08798
G1 X217.986 Y128.126 E.77269
G1 X217.986 Y129.631 E.04993
G1 X213.075 Y124.721 E.23035
G3 X213.158 Y127.051 I-3.369 J1.287 E.07877
G1 X213.075 Y127.279 E.00805
G1 X217.986 Y122.369 E.23035
G1 X217.986 Y123.874 E.04993
G1 X201.514 Y107.403 E.77269
G1 X201.514 Y110.055 E.08798
G1 X217.986 Y93.584 E.77269
G1 X217.986 Y95.089 E.04993
G1 X201.514 Y78.618 E.77269
G1 X201.514 Y81.27 E.08798
G1 X217.986 Y64.799 E.77269
G1 X217.986 Y66.304 E.04993
G1 X185.571 Y33.889 E1.52065
G1 X169.098 Y50.361 E.77273
G1 X167.5 Y50.361 E.053
G1 X151.029 Y33.889 E.77269
G1 X134.556 Y50.361 E.77273
G1 X132.958 Y50.361 E.053
G1 X128.278 Y45.68 E.21956
G3 X127.726 Y45.677 I-.244 J-4.832 E.01832
G1 X123.042 Y50.361 E.21973
G1 X121.444 Y50.361 E.053
G1 X104.971 Y33.889 E.77273
G1 X88.5 Y50.361 E.77269
G1 X86.902 Y50.361 E.053
G1 X70.429 Y33.889 E.77273
G1 X38.014 Y66.304 E1.52065
G1 X38.014 Y64.799 E.04993
G1 X54.486 Y81.27 E.77269
G1 X54.486 Y78.618 E.08798
G1 X38.014 Y95.089 E.77269
G1 X38.014 Y93.584 E.04993
G1 X54.486 Y110.055 E.77269
G1 X54.486 Y107.403 E.08798
G1 X38.014 Y123.874 E.77269
G1 X38.014 Y122.369 E.04993
G1 X42.923 Y127.277 E.23025
G3 X42.923 Y124.723 I3.356 J-1.277 E.08662
G1 X38.014 Y129.631 E.23025
G1 X38.014 Y128.126 E.04993
G1 X54.486 Y144.597 E.77269
G1 X54.486 Y146.225 E.05401
G1 X54.486 Y169.253 F30000
G1 F16200
G1 X54.486 Y167.625 E.05401
G1 X38.014 Y151.154 E.77269
G1 X38.014 Y152.659 E.04993
G1 X54.486 Y136.188 E.77269
G1 X54.486 Y138.84 E.08798
G1 X44.97 Y129.324 E.4464
G3 X44.374 Y129.029 I1.318 J-3.407 E.0221
G1 X38.014 Y135.388 E.29832
G1 X38.014 Y133.883 E.04993
G1 X54.486 Y150.354 E.77269
G1 X54.486 Y147.702 E.08798
G1 X38.014 Y164.173 E.77269
G1 X38.014 Y162.668 E.04993
G1 X54.486 Y179.139 E.77269
G1 X54.486 Y176.487 E.08798
G1 X38.014 Y192.958 E.77269
G1 X38.014 Y191.453 E.04993
G1 X64.672 Y218.111 E1.25058
G1 X81.145 Y201.639 E.77273
G1 X82.743 Y201.639 E.053
G1 X99.214 Y218.111 E.77269
G1 X115.687 Y201.639 E.77274
G1 X117.285 Y201.639 E.053
G1 X124.566 Y208.921 E.34159
G2 X124.447 Y210.15 I3.512 J.96 E.04116
G1 X116.485 Y218.111 E.37349
G1 X100.014 Y201.639 E.77269
G1 X98.416 Y201.639 E.053
G1 X81.943 Y218.111 E.77273
G1 X65.472 Y201.639 E.77269
G1 X63.874 Y201.639 E.053
G1 X47.402 Y218.111 E.77273
G1 X38.014 Y208.723 E.44037
G1 X38.014 Y210.229 E.04993
G1 X54.486 Y193.757 E.77269
G1 X54.486 Y196.41 E.08798
G1 X38.014 Y179.939 E.77269
G1 X38.014 Y181.444 E.04993
G1 X54.486 Y164.973 E.77269
G1 X54.486 Y163.344 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F16200
G1 X54.486 Y164.973 E-.61876
G1 X54.223 Y165.235 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/15
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
G17
G3 Z1.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 15
G1 X125.83 Y212.248
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F16213.044
G1 X125.648 Y212.058 E.00874
G3 X127.748 Y206.671 I2.361 J-2.182 E.23842
G3 X129.176 Y206.879 I.25 J3.278 E.04826
G3 X125.878 Y212.283 I-1.167 J2.996 E.3727
G1 X126.113 Y211.956 F30000
G1 F16213.044
G1 X125.946 Y211.781 E.00803
G3 X127.778 Y207.077 I2.064 J-1.905 E.20811
G3 X128.761 Y207.17 I.239 J2.724 E.03293
G3 X126.162 Y211.991 I-.751 J2.706 E.33438
G1 X126.386 Y211.65 F30000
G1 F16213.044
G1 X126.091 Y211.321 E.01465
G3 X127.809 Y207.483 I1.918 J-1.445 E.16995
G3 X128.651 Y207.562 I.113 J3.311 E.02814
G3 X126.432 Y211.688 I-.642 J2.314 E.28571
G1 X126.653 Y211.364 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X126.405 Y211.083 E.01151
G3 X127.838 Y207.874 I1.605 J-1.208 E.13149
G3 X128.349 Y207.895 I.166 J2.144 E.01575
G3 X126.701 Y211.399 I-.339 J1.98 E.22719
; WIPE_START
M204 S10000
G1 X126.405 Y211.083 E-.16458
G1 X126.189 Y210.747 E-.15183
G1 X126.052 Y210.371 E-.15207
G1 X125.992 Y209.975 E-.15215
G1 X126.011 Y209.609 E-.13937
; WIPE_END
G1 E-.04 F1800
G1 X118.38 Y209.434 Z1.8 F30000
G1 X43.858 Y207.726 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X43.898 Y207.693 E.00174
G3 X45.998 Y206.671 I2.361 J2.183 E.07927
G3 X47.425 Y206.879 I.25 J3.278 E.04825
G3 X43.693 Y207.938 I-1.167 J2.996 E.53195
G1 X43.821 Y207.773 E.00692
G1 X44.168 Y207.99 F30000
G1 F16213.044
G1 X44.197 Y207.97 E.00117
G3 X46.028 Y207.077 I2.063 J1.906 E.06917
G3 X47.011 Y207.17 I.239 J2.724 E.03293
G3 X44.018 Y208.184 I-.751 J2.706 E.47405
G1 X44.131 Y208.037 E.00615
G1 X44.468 Y208.268 F30000
G1 F16213.044
G1 X44.495 Y208.246 E.00113
G3 X46.059 Y207.483 I1.764 J1.63 E.05908
G3 X46.901 Y207.562 I.113 J3.311 E.02813
G3 X44.207 Y208.627 I-.642 J2.314 E.39738
G1 X44.433 Y208.316 E.01273
G1 X44.768 Y208.519 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X44.783 Y208.514 E.00048
G3 X46.088 Y207.874 I1.477 J1.361 E.0457
G3 X46.599 Y207.895 I.166 J2.144 E.01575
G3 X44.543 Y208.832 I-.339 J1.98 E.31405
G1 X44.733 Y208.568 E.01
; WIPE_START
M204 S10000
G1 X44.783 Y208.514 E-.0279
G1 X45.076 Y208.243 E-.1518
G1 X45.423 Y208.043 E-.15214
G1 X45.803 Y207.915 E-.1521
G1 X46.088 Y207.874 E-.10958
G1 X46.4 Y207.87 E-.11863
G1 X46.525 Y207.886 E-.04785
; WIPE_END
G1 E-.04 F1800
G1 X46.792 Y200.258 Z1.8 F30000
G1 X49.412 Y125.414 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X49.458 Y125.679 E.00893
G3 X45.998 Y122.796 I-3.199 J.321 E.5046
G3 X47.426 Y123.004 I.25 J3.278 E.04826
G3 X49.408 Y125.354 I-1.167 J2.996 E.10632
G1 X49.01 Y125.477 F30000
G1 F16213.044
G1 X49.054 Y125.719 E.00817
G3 X46.028 Y123.202 I-2.795 J.282 E.44072
G3 X47.011 Y123.295 I.238 J2.725 E.03292
G3 X49.007 Y125.418 I-.751 J2.706 E.10164
G1 X48.609 Y125.557 F30000
G1 F16213.044
G1 X48.66 Y126 E.01478
G3 X46.059 Y123.608 I-2.401 J.001 E.36877
G3 X46.901 Y123.687 I.113 J3.313 E.02813
G3 X48.607 Y125.498 I-.642 J2.314 E.08676
G1 X48.225 Y125.647 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X48.268 Y126 E.01092
G3 X46.088 Y123.999 I-2.009 J0 E.28555
G3 X46.599 Y124.02 I.166 J2.144 E.01576
G3 X48.225 Y125.588 I-.339 J1.98 E.0737
; WIPE_START
M204 S10000
G1 X48.268 Y126 E-.15757
G1 X48.25 Y126.2 E-.07638
G1 X48.171 Y126.592 E-.15208
G1 X48.015 Y126.961 E-.15216
G1 X47.79 Y127.292 E-.15211
G1 X47.659 Y127.42 E-.0697
; WIPE_END
G1 E-.04 F1800
G1 X54.536 Y130.73 Z1.8 F30000
G1 X201.166 Y201.291 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X54.834 Y201.291 E4.85411
G1 X54.834 Y50.709 E4.99509
G1 X201.166 Y50.709 E4.85411
G1 X201.166 Y201.231 E4.9931
G1 X200.759 Y200.884 F30000
G1 F16213.044
G1 X55.241 Y200.884 E4.82711
G1 X55.241 Y51.116 E4.96809
G1 X200.759 Y51.116 E4.82711
G1 X200.759 Y200.824 E4.9661
G1 X200.352 Y200.477 F30000
G1 F16213.044
G1 X55.648 Y200.477 E4.8001
G1 X55.648 Y51.523 E4.94108
G1 X200.352 Y51.523 E4.8001
G1 X200.352 Y200.417 E4.93909
G1 X199.96 Y200.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X56.04 Y200.085 E4.42226
G1 X56.04 Y51.915 E4.55285
G1 X199.96 Y51.915 E4.42226
G1 X199.96 Y200.025 E4.55101
; WIPE_START
M204 S10000
G1 X197.96 Y200.026 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X192.695 Y194.5 Z1.8 F30000
G1 X44.794 Y39.26 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X44.929 Y39.198 E.00494
G3 X45.998 Y38.921 I1.33 J2.927 E.03681
G3 X47.426 Y39.13 I.25 J3.278 E.04826
G3 X44.645 Y39.345 I-1.167 J2.996 E.57441
G1 X44.742 Y39.29 E.00369
G1 X45.281 Y39.49 F30000
G1 F16213.044
G1 X45.357 Y39.466 E.00264
G3 X46.028 Y39.327 I.903 J2.66 E.02281
G3 X47.011 Y39.42 I.238 J2.725 E.03292
G3 X45.097 Y39.569 I-.751 J2.706 E.5204
G1 X45.226 Y39.514 E.00465
G1 X45.771 Y39.774 F30000
G1 F16213.044
G1 X46.059 Y39.733 E.00965
G3 X46.901 Y39.812 I.113 J3.313 E.02813
G3 X45.712 Y39.787 I-.642 J2.314 E.46066
G1 X46.07 Y40.126 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X46.088 Y40.124 E.00056
G3 X46.599 Y40.145 I.166 J2.144 E.01576
G3 X45.804 Y40.169 I-.339 J1.98 E.36316
G1 X46.011 Y40.136 E.00644
; WIPE_START
M204 S10000
G1 X46.088 Y40.124 E-.02976
G1 X46.4 Y40.12 E-.11864
G1 X46.599 Y40.145 E-.07617
G1 X46.984 Y40.254 E-.15214
G1 X47.341 Y40.436 E-.15211
G1 X47.654 Y40.686 E-.15211
G1 X47.787 Y40.845 E-.07908
; WIPE_END
G1 E-.04 F1800
G1 X55.418 Y40.692 Z1.8 F30000
G1 X126.543 Y39.26 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X126.679 Y39.198 E.00497
G3 X127.748 Y38.921 I1.33 J2.927 E.0368
G3 X129.176 Y39.129 I.25 J3.278 E.04826
G3 X126.395 Y39.345 I-1.167 J2.996 E.57442
M73 P50 R29
G1 X126.491 Y39.29 E.00366
G1 X127.03 Y39.49 F30000
G1 F16213.044
G1 X127.107 Y39.466 E.00267
G3 X127.778 Y39.327 I.903 J2.66 E.02282
G3 X128.761 Y39.42 I.238 J2.725 E.03292
G3 X126.847 Y39.569 I-.751 J2.706 E.5204
G1 X126.975 Y39.514 E.00461
G1 X127.52 Y39.775 F30000
G1 F16213.044
G1 X127.809 Y39.733 E.00968
G3 X128.651 Y39.812 I.113 J3.313 E.02813
G3 X127.461 Y39.788 I-.642 J2.314 E.46063
G1 X127.837 Y40.124 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X127.838 Y40.124 E.00004
G3 X128.349 Y40.145 I.166 J2.144 E.01576
G3 X127.554 Y40.169 I-.339 J1.98 E.36316
G1 X127.777 Y40.133 E.00697
; WIPE_START
M204 S10000
G1 X127.838 Y40.124 E-.02329
G1 X128.15 Y40.12 E-.11864
G1 X128.349 Y40.145 E-.07617
G1 X128.734 Y40.254 E-.15214
G1 X129.091 Y40.436 E-.15211
G1 X129.404 Y40.686 E-.1521
G1 X129.548 Y40.858 E-.08556
; WIPE_END
G1 E-.04 F1800
G1 X137.179 Y40.704 Z1.8 F30000
G1 X208.293 Y39.26 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X208.429 Y39.198 E.00497
G3 X209.498 Y38.921 I1.33 J2.927 E.0368
G3 X210.926 Y39.129 I.25 J3.278 E.04826
G3 X208.145 Y39.345 I-1.167 J2.996 E.57441
G1 X208.241 Y39.29 E.00367
G1 X208.78 Y39.49 F30000
G1 F16213.044
G1 X208.857 Y39.466 E.00267
G3 X209.528 Y39.327 I.903 J2.66 E.02282
G3 X210.511 Y39.42 I.238 J2.725 E.03292
G3 X208.597 Y39.569 I-.751 J2.706 E.5204
G1 X208.725 Y39.514 E.00462
G1 X209.27 Y39.775 F30000
G1 F16213.044
G1 X209.559 Y39.733 E.00968
G3 X210.401 Y39.812 I.113 J3.313 E.02813
G3 X209.211 Y39.788 I-.642 J2.314 E.46063
G1 X209.587 Y40.124 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.588 Y40.124 E.00004
G3 X210.099 Y40.145 I.166 J2.143 E.01575
G3 X209.304 Y40.169 I-.339 J1.98 E.36316
G1 X209.527 Y40.133 E.00696
; WIPE_START
M204 S10000
G1 X209.588 Y40.124 E-.02334
G1 X209.9 Y40.12 E-.11864
G1 X210.099 Y40.145 E-.07617
G1 X210.484 Y40.254 E-.15213
G1 X210.841 Y40.436 E-.15208
G1 X211.154 Y40.686 E-.15216
G1 X211.298 Y40.858 E-.08548
; WIPE_END
G1 E-.04 F1800
G1 X211.02 Y48.486 Z1.8 F30000
G1 X208.293 Y123.135 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X208.429 Y123.073 E.00496
G3 X209.498 Y122.796 I1.33 J2.927 E.03681
G3 X210.926 Y123.005 I.25 J3.278 E.04826
G3 X208.145 Y123.22 I-1.167 J2.996 E.57441
G1 X208.241 Y123.165 E.00366
G1 X208.78 Y123.365 F30000
G1 F16213.044
G1 X208.857 Y123.341 E.00267
G3 X209.528 Y123.202 I.903 J2.66 E.02282
G3 X210.511 Y123.295 I.238 J2.726 E.03292
G3 X208.597 Y123.444 I-.751 J2.706 E.5204
G1 X208.725 Y123.389 E.00462
G1 X209.27 Y123.65 F30000
G1 F16213.044
G1 X209.559 Y123.608 E.00968
G3 X210.401 Y123.687 I.113 J3.314 E.02813
G3 X209.211 Y123.663 I-.642 J2.314 E.46063
G1 X209.587 Y123.999 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.588 Y123.999 E.00005
G3 X210.099 Y124.02 I.166 J2.143 E.01575
G3 X209.304 Y124.044 I-.339 J1.98 E.36316
G1 X209.527 Y124.008 E.00696
; WIPE_START
M204 S10000
G1 X209.588 Y123.999 E-.02336
G1 X209.9 Y123.995 E-.11864
M73 P50 R28
G1 X210.099 Y124.02 E-.07617
G1 X210.294 Y124.065 E-.07613
G1 X210.667 Y124.211 E-.15216
G1 X211.003 Y124.428 E-.15208
G1 X211.29 Y124.708 E-.15213
G1 X211.304 Y124.728 E-.00933
; WIPE_END
G1 E-.04 F1800
G1 X211.025 Y132.355 Z1.8 F30000
G1 X208.293 Y207.01 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X208.429 Y206.948 E.00496
G3 X209.498 Y206.671 I1.329 J2.927 E.0368
G3 X210.926 Y206.88 I.25 J3.277 E.04826
G3 X208.145 Y207.095 I-1.167 J2.996 E.57441
G1 X208.241 Y207.04 E.00368
G1 X208.78 Y207.24 F30000
G1 F16213.044
G1 X208.857 Y207.216 E.00267
G3 X209.528 Y207.077 I.903 J2.66 E.02281
G3 X210.511 Y207.17 I.239 J2.725 E.03293
G3 X208.597 Y207.319 I-.751 J2.706 E.5204
G1 X208.725 Y207.264 E.00462
G1 X209.27 Y207.524 F30000
G1 F16213.044
G1 X209.559 Y207.483 E.00967
G3 X210.401 Y207.562 I.113 J3.312 E.02813
G3 X209.212 Y207.538 I-.642 J2.314 E.46064
G1 X209.58 Y207.875 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.588 Y207.874 E.00023
G3 X210.099 Y207.895 I.166 J2.144 E.01575
G3 X209.304 Y207.919 I-.339 J1.98 E.36316
G1 X209.521 Y207.884 E.00677
; WIPE_START
M204 S10000
G1 X209.588 Y207.874 E-.0257
G1 X209.9 Y207.87 E-.11863
G1 X210.099 Y207.895 E-.07617
G1 X210.294 Y207.94 E-.07617
G1 X210.667 Y208.086 E-.15211
G1 X211.003 Y208.303 E-.15214
G1 X211.29 Y208.583 E-.1521
G1 X211.3 Y208.598 E-.00699
; WIPE_END
G1 E-.04 F1800
G1 X215.732 Y214.812 Z1.8 F30000
G1 X218.334 Y218.459 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X37.666 Y218.459 E5.99308
G1 X37.666 Y33.541 E6.13406
G1 X218.334 Y33.541 E5.99308
G1 X218.334 Y218.399 E6.13207
G1 X218.741 Y218.866 F30000
G1 F16213.044
G1 X37.259 Y218.866 E6.02008
G1 X37.259 Y33.134 E6.16106
G1 X218.741 Y33.134 E6.02008
G1 X218.741 Y218.806 E6.15907
G1 X219.148 Y219.273 F30000
G1 F16213.044
G1 X36.852 Y219.273 E6.04709
G1 X36.852 Y32.727 E6.18807
G1 X219.148 Y32.727 E6.04709
G1 X219.148 Y219.213 E6.18608
G1 X219.54 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X36.46 Y219.665 E5.62554
G1 X36.46 Y32.335 E5.75613
G1 X219.54 Y32.335 E5.62554
G1 X219.54 Y219.605 E5.75429
; WIPE_START
M204 S10000
G1 X217.54 Y219.606 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X212.537 Y213.842 Z1.8 F30000
G1 X201.514 Y201.143 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X201.514 Y199.514 E.05401
G1 X208.528 Y206.528 E.32901
G3 X208.735 Y206.46 I.442 J1 E.00724
G1 X217.986 Y197.21 E.43396
G1 X217.986 Y198.715 E.04993
G1 X201.514 Y182.244 E.77269
G1 X201.514 Y184.896 E.08798
G1 X217.986 Y168.425 E.77269
G1 X217.986 Y169.93 E.04993
G1 X201.514 Y153.459 E.77269
G1 X201.514 Y156.111 E.08798
G1 X217.986 Y139.64 E.77269
G1 X217.986 Y141.145 E.04993
G1 X201.514 Y124.674 E.77269
G1 X201.514 Y127.326 E.08798
G1 X217.986 Y110.855 E.77269
G1 X217.986 Y112.36 E.04993
G1 X201.514 Y95.889 E.77269
G1 X201.514 Y98.541 E.08798
G1 X217.986 Y82.07 E.77269
G1 X217.986 Y83.575 E.04993
G1 X201.514 Y67.104 E.77269
G1 X201.514 Y69.756 E.08798
G1 X217.986 Y53.285 E.77269
G1 X217.986 Y54.79 E.04993
G1 X208.735 Y45.54 E.43396
G3 X208.528 Y45.472 I.235 J-1.069 E.00724
G1 X201.514 Y52.486 E.32901
G1 X201.514 Y50.361 E.07049
G1 X197.883 Y50.361 E.12048
G1 X206.188 Y42.055 E.38962
G2 X206.335 Y43.14 I5.272 J-.164 E.03639
G1 X197.085 Y33.889 E.43397
G1 X180.612 Y50.361 E.77273
G1 X179.014 Y50.361 E.053
G1 X162.543 Y33.889 E.77269
G1 X146.07 Y50.361 E.77274
G1 X144.472 Y50.361 E.053
G1 X128.001 Y33.889 E.77269
G1 X111.528 Y50.361 E.77273
G1 X109.93 Y50.361 E.053
G1 X93.459 Y33.889 E.77269
G1 X76.986 Y50.361 E.77274
G1 X75.388 Y50.361 E.053
G1 X58.917 Y33.889 E.77269
G1 X49.668 Y43.137 E.43385
G2 X49.813 Y42.056 I-5.628 J-1.305 E.03621
G1 X58.117 Y50.361 E.38957
G1 X59.715 Y50.361 E.053
G1 X76.188 Y33.889 E.77274
G1 X92.659 Y50.361 E.77269
G1 X94.257 Y50.361 E.053
G1 X110.73 Y33.889 E.77274
G1 X127.201 Y50.361 E.77269
G1 X128.799 Y50.361 E.053
G1 X145.272 Y33.889 E.77273
G1 X161.743 Y50.361 E.77269
G1 X163.341 Y50.361 E.053
G1 X179.814 Y33.889 E.77273
G1 X196.285 Y50.361 E.77269
G1 X194.656 Y50.361 E.05401
; WIPE_START
G1 X196.285 Y50.361 E-.61876
G1 X196.022 Y50.098 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X196.857 Y57.684 Z1.8 F30000
G1 X201.514 Y100.018 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F16200
G1 X201.514 Y101.646 E.05401
G1 X217.986 Y118.117 E.77269
G1 X217.986 Y116.612 E.04993
G1 X211.627 Y122.97 E.29829
G2 X211.025 Y122.67 I-2.267 J3.796 E.02234
G1 X201.514 Y113.16 E.44616
G1 X201.514 Y115.812 E.08798
G1 X217.986 Y99.341 E.77269
G1 X217.986 Y100.846 E.04993
G1 X201.514 Y84.375 E.77269
G1 X201.514 Y87.027 E.08798
G1 X217.986 Y70.556 E.77269
G1 X217.986 Y72.061 E.04993
G1 X201.514 Y55.59 E.77269
G1 X201.514 Y58.243 E.08798
G1 X217.986 Y41.771 E.77269
G1 X217.986 Y43.277 E.04993
G1 X208.597 Y33.889 E.44041
G1 X192.126 Y50.361 E.77269
G1 X190.528 Y50.361 E.053
G1 X174.057 Y33.889 E.77269
G1 X157.584 Y50.361 E.77273
G1 X155.986 Y50.361 E.053
G1 X139.515 Y33.889 E.77269
G1 X131.553 Y41.85 E.37347
G3 X131.433 Y43.079 I-4.84 J.149 E.04107
G1 X138.715 Y50.361 E.34161
G1 X140.313 Y50.361 E.053
G1 X156.786 Y33.889 E.77274
G1 X173.257 Y50.361 E.77269
G1 X174.855 Y50.361 E.053
G1 X191.328 Y33.889 E.77273
G1 X217.986 Y60.547 E1.25058
G1 X217.986 Y59.042 E.04993
G1 X201.514 Y75.513 E.77269
G1 X201.514 Y72.861 E.08798
G1 X217.986 Y89.332 E.77269
G1 X217.986 Y87.827 E.04993
G1 X201.514 Y104.298 E.77269
G1 X201.514 Y105.927 E.05401
; WIPE_START
G1 X201.514 Y104.298 E-.61876
G1 X201.777 Y104.035 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X203.583 Y111.451 Z1.8 F30000
G1 X207.86 Y129.02 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F16200
G3 X206.719 Y127.878 I1.936 J-3.075 E.05398
G1 X201.514 Y133.083 E.24417
G1 X201.514 Y130.431 E.08798
G1 X217.986 Y146.902 E.77269
G1 X217.986 Y145.397 E.04993
G1 X201.514 Y161.868 E.77269
G1 X201.514 Y159.216 E.08798
G1 X217.986 Y175.687 E.77269
G1 X217.986 Y174.182 E.04993
G1 X201.514 Y190.653 E.77269
G1 X201.514 Y188.001 E.08798
G1 X217.986 Y204.472 E.77269
G1 X217.986 Y202.966 E.04993
G1 X212.845 Y208.107 E.24117
G3 X213.096 Y211.096 I-3.253 J1.779 E.10243
G1 X217.986 Y215.986 E.22936
G1 X217.986 Y214.48 E.04993
G1 X214.354 Y218.111 E.17034
G1 X209.683 Y213.44 E.2191
G3 X207.981 Y212.971 I.242 J-4.203 E.05901
G1 X202.84 Y218.111 E.24114
G1 X186.369 Y201.639 E.77269
G1 X184.771 Y201.639 E.053
G1 X168.298 Y218.111 E.77274
G1 X151.827 Y201.639 E.77269
G1 X150.229 Y201.639 E.053
G1 X133.758 Y218.111 E.77269
G1 X128.956 Y213.311 E.22522
G3 X127.047 Y213.307 I-.948 J-3.907 E.06394
G1 X122.242 Y218.111 E.22537
G1 X105.771 Y201.639 E.77269
G1 X104.173 Y201.639 E.053
G1 X87.702 Y218.111 E.77269
G1 X71.229 Y201.639 E.77273
G1 X69.631 Y201.639 E.053
G1 X53.16 Y218.111 E.77269
G1 X48.016 Y212.968 E.24127
G3 X46.32 Y213.437 I-1.897 J-3.566 E.05884
G1 X41.646 Y218.111 E.21926
G1 X38.014 Y214.48 E.17034
G1 X38.014 Y215.986 E.04993
G1 X42.9 Y211.1 E.22921
G3 X43.156 Y208.108 I3.529 J-1.205 E.1025
G1 X38.014 Y202.966 E.2412
G1 X38.014 Y204.472 E.04993
G1 X54.486 Y188.001 E.77269
G1 X54.486 Y190.653 E.08798
G1 X38.014 Y174.182 E.77269
G1 X38.014 Y175.687 E.04993
G1 X54.486 Y159.216 E.77269
G1 X54.486 Y161.868 E.08798
G1 X38.014 Y145.397 E.77269
G1 X38.014 Y146.902 E.04993
G1 X54.486 Y130.431 E.77269
G1 X54.486 Y133.083 E.08798
G1 X49.278 Y127.876 E.24428
G2 X49.278 Y124.124 I-3.12 J-1.876 E.13075
G1 X54.486 Y118.917 E.24428
G1 X54.486 Y121.569 E.08798
G1 X38.014 Y105.098 E.77269
G1 X38.014 Y106.603 E.04993
G1 X54.486 Y90.132 E.77269
G1 X54.486 Y92.784 E.08798
G1 X38.014 Y76.313 E.77269
G1 X38.014 Y77.818 E.04993
G1 X54.486 Y61.347 E.77269
G1 X54.486 Y63.999 E.08798
G1 X38.014 Y47.528 E.77269
G1 X38.014 Y49.034 E.04993
G1 X43.156 Y43.892 E.2412
G3 X42.9 Y40.9 I3.273 J-1.786 E.1025
G1 X38.014 Y36.014 E.22921
G1 X38.014 Y37.52 E.04993
G1 X41.646 Y33.889 E.17034
G1 X46.326 Y38.569 E.21954
G3 X48.016 Y39.032 I-.164 J3.922 E.05862
G1 X53.16 Y33.889 E.24127
G1 X69.631 Y50.361 E.77269
G1 X71.229 Y50.361 E.053
G1 X87.702 Y33.889 E.77274
G1 X104.173 Y50.361 E.77269
G1 X105.771 Y50.361 E.053
G1 X122.242 Y33.889 E.77269
G1 X127.047 Y38.693 E.22537
G3 X128.956 Y38.689 I.961 J3.709 E.064
G1 X133.758 Y33.889 E.22522
G1 X150.229 Y50.361 E.77269
G1 X151.827 Y50.361 E.053
G1 X168.298 Y33.889 E.77269
G1 X184.771 Y50.361 E.77273
G1 X186.369 Y50.361 E.053
G1 X202.84 Y33.889 E.77269
G1 X207.981 Y39.029 E.24114
G3 X209.672 Y38.571 I1.733 J3.049 E.05875
G1 X214.354 Y33.889 E.21962
G1 X217.986 Y37.52 E.17034
G1 X217.986 Y36.014 E.04993
G1 X213.096 Y40.904 E.22936
G3 X212.845 Y43.893 I-3.504 J1.21 E.10243
G1 X217.986 Y49.034 E.24117
G1 X217.986 Y47.528 E.04993
G1 X201.514 Y63.999 E.77269
G1 X201.514 Y61.347 E.08798
G1 X217.986 Y77.818 E.77269
G1 X217.986 Y76.313 E.04993
G1 X201.514 Y92.784 E.77269
G1 X201.514 Y90.132 E.08798
G1 X217.986 Y106.603 E.77269
G1 X217.986 Y105.098 E.04993
G1 X201.514 Y121.569 E.77269
G1 X201.514 Y118.917 E.08798
G1 X206.719 Y124.122 E.24417
G3 X207.86 Y122.98 I3.076 J1.933 E.05398
; WIPE_START
G1 X207.135 Y123.574 E-.35603
G1 X206.719 Y124.122 E-.26133
G1 X206.454 Y123.856 E-.14264
; WIPE_END
G1 E-.04 F1800
G1 X204.279 Y131.172 Z1.8 F30000
G1 X201.514 Y140.468 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F16200
G1 X201.514 Y138.84 E.05401
G1 X211.025 Y129.33 E.44616
G2 X211.627 Y129.03 I-1.669 J-4.104 E.02234
G1 X217.986 Y135.388 E.29829
G1 X217.986 Y133.883 E.04993
G1 X201.514 Y150.354 E.77269
G1 X201.514 Y147.702 E.08798
G1 X217.986 Y164.173 E.77269
G1 X217.986 Y162.668 E.04993
G1 X201.514 Y179.139 E.77269
G1 X201.514 Y176.487 E.08798
G1 X217.986 Y192.958 E.77269
G1 X217.986 Y191.453 E.04993
G1 X191.328 Y218.111 E1.25058
G1 X174.855 Y201.639 E.77274
G1 X173.257 Y201.639 E.053
G1 X156.786 Y218.111 E.77269
G1 X140.313 Y201.639 E.77273
G1 X138.715 Y201.639 E.053
G1 X131.433 Y208.921 E.34161
G3 X131.553 Y210.15 I-4.721 J1.081 E.04107
G1 X139.515 Y218.111 E.37347
G1 X155.986 Y201.639 E.77269
G1 X157.584 Y201.639 E.053
G1 X174.057 Y218.111 E.77273
G1 X190.528 Y201.639 E.77269
G1 X192.126 Y201.639 E.053
G1 X208.597 Y218.111 E.77269
G1 X217.986 Y208.723 E.44041
G1 X217.986 Y210.229 E.04993
G1 X201.514 Y193.757 E.77269
G1 X201.514 Y196.41 E.08798
G1 X217.986 Y179.939 E.77269
G1 X217.986 Y181.444 E.04993
G1 X201.514 Y164.973 E.77269
G1 X201.514 Y167.625 E.08798
G1 X217.986 Y151.154 E.77269
G1 X217.986 Y152.659 E.04993
G1 X201.514 Y136.188 E.77269
G1 X201.514 Y134.56 E.05401
; WIPE_START
G1 X201.514 Y136.188 E-.61876
G1 X201.777 Y136.451 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X194.162 Y136.956 Z1.8 F30000
G1 X54.486 Y146.225 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F16200
G1 X54.486 Y144.597 E.05401
G1 X38.014 Y128.126 E.77269
G1 X38.014 Y129.631 E.04993
G1 X42.922 Y124.723 E.23025
G2 X42.923 Y127.277 I3.356 J1.277 E.08662
G1 X38.014 Y122.369 E.23025
G1 X38.014 Y123.874 E.04993
G1 X54.486 Y107.403 E.77269
G1 X54.486 Y110.055 E.08798
G1 X38.014 Y93.584 E.77269
G1 X38.014 Y95.089 E.04993
G1 X54.486 Y78.618 E.77269
G1 X54.486 Y81.27 E.08798
G1 X38.014 Y64.799 E.77269
M73 P51 R28
G1 X38.014 Y66.304 E.04993
G1 X70.429 Y33.889 E1.52065
G1 X86.902 Y50.361 E.77273
G1 X88.5 Y50.361 E.053
G1 X104.971 Y33.889 E.77269
G1 X121.444 Y50.361 E.77273
G1 X123.042 Y50.361 E.053
G1 X127.726 Y45.677 E.21973
G2 X128.278 Y45.68 I.308 J-4.825 E.01832
G1 X132.958 Y50.361 E.21956
G1 X134.556 Y50.361 E.053
G1 X151.029 Y33.889 E.77273
G1 X167.5 Y50.361 E.77269
G1 X169.098 Y50.361 E.053
G1 X185.571 Y33.889 E.77273
G1 X217.986 Y66.304 E1.52065
G1 X217.986 Y64.799 E.04993
G1 X201.514 Y81.27 E.77269
G1 X201.514 Y78.618 E.08798
G1 X217.986 Y95.089 E.77269
G1 X217.986 Y93.584 E.04993
G1 X201.514 Y110.055 E.77269
G1 X201.514 Y107.403 E.08798
G1 X217.986 Y123.874 E.77269
G1 X217.986 Y122.369 E.04993
G1 X213.075 Y127.279 E.23035
G2 X213.075 Y124.721 I-3.546 J-1.279 E.08659
G1 X217.986 Y129.631 E.23035
G1 X217.986 Y128.126 E.04993
G1 X201.514 Y144.597 E.77269
G1 X201.514 Y141.945 E.08798
G1 X217.986 Y158.416 E.77269
G1 X217.986 Y156.911 E.04993
G1 X201.514 Y173.382 E.77269
G1 X201.514 Y170.73 E.08798
G1 X217.986 Y187.201 E.77269
G1 X217.986 Y185.696 E.04993
G1 X185.571 Y218.111 E1.52065
G1 X169.098 Y201.639 E.77273
G1 X167.5 Y201.639 E.053
G1 X151.029 Y218.111 E.77269
G1 X134.556 Y201.639 E.77273
G1 X132.958 Y201.639 E.053
G1 X128.278 Y206.32 E.21956
G2 X127.725 Y206.323 I-.265 J2.045 E.01838
G1 X123.042 Y201.639 E.21971
G1 X121.444 Y201.639 E.053
G1 X104.971 Y218.111 E.77273
G1 X88.5 Y201.639 E.77269
G1 X86.902 Y201.639 E.053
G1 X70.429 Y218.111 E.77273
G1 X38.014 Y185.696 E1.52065
G1 X38.014 Y187.201 E.04993
G1 X54.486 Y170.73 E.77269
G1 X54.486 Y173.382 E.08798
G1 X38.014 Y156.911 E.77269
G1 X38.014 Y158.416 E.04993
G1 X54.486 Y141.945 E.77269
G1 X54.486 Y140.316 E.05401
G1 X54.486 Y163.344 F30000
G1 F16200
G1 X54.486 Y164.973 E.05401
G1 X38.014 Y181.444 E.77269
G1 X38.014 Y179.939 E.04993
G1 X54.486 Y196.41 E.77269
G1 X54.486 Y193.757 E.08798
G1 X38.014 Y210.229 E.77269
G1 X38.014 Y208.723 E.04993
G1 X47.402 Y218.111 E.44037
G1 X63.874 Y201.639 E.77273
G1 X65.472 Y201.639 E.053
G1 X81.943 Y218.111 E.77269
G1 X98.416 Y201.639 E.77273
G1 X100.014 Y201.639 E.053
G1 X116.485 Y218.111 E.77269
G1 X124.447 Y210.15 E.37349
G3 X124.566 Y208.921 I3.631 J-.269 E.04116
G1 X117.285 Y201.639 E.34159
G1 X115.687 Y201.639 E.053
G1 X99.214 Y218.111 E.77274
G1 X82.743 Y201.639 E.77269
G1 X81.145 Y201.639 E.053
G1 X64.672 Y218.111 E.77273
G1 X38.014 Y191.453 E1.25058
G1 X38.014 Y192.958 E.04993
G1 X54.486 Y176.487 E.77269
G1 X54.486 Y179.139 E.08798
G1 X38.014 Y162.668 E.77269
G1 X38.014 Y164.173 E.04993
G1 X54.486 Y147.702 E.77269
G1 X54.486 Y150.354 E.08798
G1 X38.014 Y133.883 E.77269
G1 X38.014 Y135.388 E.04993
G1 X44.374 Y129.029 E.29832
G2 X44.97 Y129.324 I1.913 J-3.109 E.0221
G1 X54.486 Y138.84 E.4464
G1 X54.486 Y136.188 E.08798
G1 X38.014 Y152.659 E.77269
G1 X38.014 Y151.154 E.04993
G1 X54.486 Y167.625 E.77269
G1 X54.486 Y169.253 E.05401
G1 X54.486 Y71.233 F30000
G1 F16200
G1 X54.486 Y72.861 E.05401
G1 X38.014 Y89.332 E.77269
G1 X38.014 Y87.827 E.04993
G1 X54.486 Y104.298 E.77269
G1 X54.486 Y101.646 E.08798
G1 X38.014 Y118.117 E.77269
G1 X38.014 Y116.612 E.04993
G1 X44.374 Y122.971 E.29833
G3 X44.97 Y122.676 I1.913 J3.109 E.0221
G1 X54.486 Y113.16 E.4464
G1 X54.486 Y115.812 E.08798
G1 X38.014 Y99.341 E.77269
G1 X38.014 Y100.846 E.04993
G1 X54.486 Y84.375 E.77269
G1 X54.486 Y87.027 E.08798
G1 X38.014 Y70.556 E.77269
G1 X38.014 Y72.061 E.04993
G1 X54.486 Y55.59 E.77269
G1 X54.486 Y58.242 E.08798
G1 X38.014 Y41.771 E.77269
G1 X38.014 Y43.277 E.04993
G1 X47.403 Y33.889 E.44041
G1 X63.874 Y50.361 E.77269
G1 X65.472 Y50.361 E.053
G1 X81.943 Y33.889 E.77269
G1 X98.416 Y50.361 E.77273
G1 X100.014 Y50.361 E.053
G1 X116.485 Y33.889 E.77269
G1 X124.447 Y41.85 E.37349
G2 X124.566 Y43.079 I3.632 J.269 E.04116
G1 X117.285 Y50.361 E.34159
G1 X115.687 Y50.361 E.053
G1 X99.214 Y33.889 E.77273
G1 X82.743 Y50.361 E.77269
G1 X81.145 Y50.361 E.053
G1 X64.672 Y33.889 E.77274
G1 X38.014 Y60.547 E1.25058
G1 X38.014 Y59.042 E.04993
G1 X54.486 Y75.513 E.77269
G1 X54.486 Y77.142 E.05401
G1 X54.486 Y50.857 F30000
G1 F16200
G1 X54.486 Y52.486 E.05401
G1 X47.472 Y45.472 E.32901
G1 X47.262 Y45.543 E.00736
G1 X38.014 Y54.79 E.43382
G1 X38.014 Y53.285 E.04993
G1 X54.486 Y69.756 E.77269
G1 X54.486 Y67.104 E.08798
G1 X38.014 Y83.575 E.77269
G1 X38.014 Y82.07 E.04993
G1 X54.486 Y98.541 E.77269
G1 X54.486 Y95.889 E.08798
G1 X38.014 Y112.36 E.77269
G1 X38.014 Y110.855 E.04993
G1 X54.486 Y127.326 E.77269
G1 X54.486 Y124.674 E.08798
G1 X38.014 Y141.145 E.77269
G1 X38.014 Y139.64 E.04993
G1 X54.486 Y156.111 E.77269
G1 X54.486 Y153.459 E.08798
G1 X38.014 Y169.93 E.77269
G1 X38.014 Y168.425 E.04993
G1 X54.486 Y184.896 E.77269
G1 X54.486 Y182.244 E.08798
G1 X38.014 Y198.715 E.77269
G1 X38.014 Y197.21 E.04993
G1 X47.262 Y206.457 E.43382
G1 X47.472 Y206.528 E.00736
G1 X54.486 Y199.514 E.32901
G1 X54.486 Y201.639 E.07049
G1 X58.117 Y201.639 E.12048
G1 X49.813 Y209.944 E.38957
G2 X49.668 Y208.863 I-5.772 J.225 E.03621
G1 X58.917 Y218.111 E.43385
G1 X75.388 Y201.639 E.77269
G1 X76.986 Y201.639 E.053
G1 X93.459 Y218.111 E.77273
G1 X109.93 Y201.639 E.77269
G1 X111.528 Y201.639 E.053
G1 X128.001 Y218.111 E.77273
G1 X144.472 Y201.639 E.77269
G1 X146.07 Y201.639 E.053
G1 X162.543 Y218.111 E.77274
G1 X179.014 Y201.639 E.77269
G1 X180.612 Y201.639 E.053
G1 X197.083 Y218.111 E.77269
G1 X206.335 Y208.86 E.43402
G2 X206.188 Y209.945 I5.126 J1.25 E.03639
G1 X197.882 Y201.639 E.38962
G1 X196.285 Y201.639 E.053
G1 X179.812 Y218.111 E.77274
G1 X163.341 Y201.639 E.77269
G1 X161.743 Y201.639 E.053
G1 X145.27 Y218.111 E.77274
G1 X128.799 Y201.639 E.77269
G1 X127.201 Y201.639 E.053
G1 X110.728 Y218.111 E.77273
G1 X94.257 Y201.639 E.77269
G1 X92.659 Y201.639 E.053
G1 X76.186 Y218.111 E.77273
G1 X59.715 Y201.639 E.77269
G1 X61.344 Y201.639 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F16200
G1 X59.715 Y201.639 E-.61876
G1 X59.978 Y201.902 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/15
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
G17
G3 Z1.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 15
G1 X125.834 Y212.252
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F16213.044
G1 X125.644 Y212.061 E.00892
G3 X127.6 Y206.682 I2.357 J-2.188 E.23408
G1 X127.92 Y206.658 E.01064
G3 X125.88 Y212.29 I.081 J3.215 E.41465
G1 X126.116 Y211.958 F30000
G1 F16213.044
G1 X125.942 Y211.784 E.00815
G3 X127.651 Y207.086 I2.058 J-1.911 E.20444
G1 X127.93 Y207.065 E.00929
G3 X126.162 Y211.997 I.07 J2.808 E.36152
G1 X126.387 Y211.652 F30000
G1 F16213.044
G1 X126.087 Y211.324 E.01475
G3 X127.701 Y207.491 I1.914 J-1.451 E.16686
G1 X127.94 Y207.473 E.00795
G3 X126.432 Y211.692 I.06 J2.401 E.30894
G1 X126.68 Y211.39 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X126.671 Y211.381 E.0004
G3 X127.75 Y207.88 I1.329 J-1.507 E.14162
G1 X127.95 Y207.865 E.00616
G3 X126.996 Y211.614 I.05 J2.008 E.22778
G1 X126.729 Y211.424 E.01006
; WIPE_START
M204 S10000
G1 X126.671 Y211.381 E-.02762
G1 X126.398 Y211.089 E-.15202
G1 X126.189 Y210.747 E-.15214
G1 X126.052 Y210.371 E-.1521
G1 X125.992 Y209.975 E-.15215
G1 X126.009 Y209.649 E-.12397
; WIPE_END
G1 E-.04 F1800
G1 X118.378 Y209.484 Z2 F30000
G1 X43.745 Y207.868 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X43.786 Y207.807 E.00242
G3 X45.85 Y206.682 I2.465 J2.066 E.07983
G1 X46.17 Y206.658 E.01064
G3 X43.505 Y208.198 I.081 J3.215 E.56384
G1 X43.71 Y207.916 E.01155
G1 X44.1 Y208.071 F30000
G1 F16213.044
G1 X44.19 Y207.964 E.00464
G3 X45.901 Y207.086 I2.06 J1.909 E.06508
G1 X46.18 Y207.065 E.00929
G3 X44.011 Y208.179 I.07 J2.808 E.50173
G1 X44.062 Y208.117 E.00266
G1 X44.428 Y208.323 F30000
G1 F16213.044
G1 X44.66 Y208.074 E.01131
G3 X45.951 Y207.491 I1.59 J1.8 E.04769
G1 X46.19 Y207.473 E.00795
G3 X44.335 Y208.425 I.06 J2.401 E.42896
G1 X44.388 Y208.368 E.00257
G1 X44.764 Y208.53 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X44.92 Y208.368 E.00691
G3 X46 Y207.88 I1.33 J1.506 E.03696
G1 X46.2 Y207.865 E.00616
G3 X44.71 Y208.583 I.05 J2.008 E.33551
G1 X44.721 Y208.572 E.00047
; WIPE_START
M204 S10000
G1 X44.92 Y208.368 E-.10827
G1 X45.245 Y208.134 E-.15213
G1 X45.61 Y207.969 E-.15209
G1 X46 Y207.88 E-.15216
G1 X46.2 Y207.865 E-.07613
G1 X46.513 Y207.889 E-.11923
; WIPE_END
G1 E-.04 F1800
G1 X46.781 Y200.261 Z2 F30000
G1 X49.412 Y125.414 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X49.458 Y125.679 E.00894
G3 X46.01 Y122.795 I-3.199 J.321 E.50499
G3 X47.426 Y123.004 I.238 J3.279 E.04786
G3 X49.408 Y125.354 I-1.167 J2.996 E.10633
G1 X49.01 Y125.477 F30000
G1 F16213.044
G1 X49.055 Y125.719 E.00817
G3 X46.04 Y123.201 I-2.794 J.282 E.44111
G3 X47.011 Y123.295 I.227 J2.723 E.03253
G3 X49.007 Y125.418 I-.751 J2.706 E.10164
G1 X48.609 Y125.557 F30000
G1 F16213.044
G1 X48.66 Y126 E.01478
G3 X46.071 Y123.607 I-2.401 J.001 E.36916
G3 X46.901 Y123.687 I.096 J3.351 E.02773
G3 X48.607 Y125.498 I-.642 J2.314 E.08676
G1 X48.224 Y125.642 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X48.269 Y126 E.01109
G3 X46.1 Y123.998 I-2.009 J0 E.28591
G3 X46.599 Y124.02 I.154 J2.146 E.01539
G3 X48.225 Y125.582 I-.339 J1.98 E.07355
; WIPE_START
M204 S10000
G1 X48.269 Y126 E-.15954
G1 X48.25 Y126.2 E-.07639
G1 X48.171 Y126.592 E-.15208
G1 X48.015 Y126.961 E-.15216
G1 X47.79 Y127.292 E-.15211
G1 X47.662 Y127.417 E-.06772
; WIPE_END
G1 E-.04 F1800
G1 X54.54 Y130.726 Z2 F30000
G1 X201.166 Y201.291 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X54.834 Y201.291 E4.85411
G1 X54.834 Y50.709 E4.99509
G1 X201.166 Y50.709 E4.85411
G1 X201.166 Y201.231 E4.9931
G1 X200.759 Y200.884 F30000
G1 F16213.044
G1 X55.241 Y200.884 E4.82711
G1 X55.241 Y51.116 E4.96809
G1 X200.759 Y51.116 E4.82711
G1 X200.759 Y200.824 E4.9661
G1 X200.352 Y200.477 F30000
G1 F16213.044
G1 X55.648 Y200.477 E4.8001
G1 X55.648 Y51.523 E4.94108
G1 X200.352 Y51.523 E4.8001
G1 X200.352 Y200.417 E4.93909
G1 X199.96 Y200.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X56.04 Y200.085 E4.42226
G1 X56.04 Y51.915 E4.55285
G1 X199.96 Y51.915 E4.42226
G1 X199.96 Y200.025 E4.55101
; WIPE_START
M204 S10000
G1 X197.96 Y200.026 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X192.696 Y194.5 Z2 F30000
G1 X44.806 Y39.253 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X44.929 Y39.198 E.00448
G3 X46.01 Y38.92 I1.33 J2.927 E.0372
G3 X47.426 Y39.129 I.238 J3.279 E.04786
G3 X44.645 Y39.345 I-1.167 J2.996 E.57441
G1 X44.754 Y39.283 E.00416
G1 X45.292 Y39.486 F30000
G1 F16213.044
G1 X45.357 Y39.467 E.00224
G3 X46.04 Y39.326 I.903 J2.659 E.02321
G3 X47.011 Y39.42 I.227 J2.723 E.03253
G3 X45.097 Y39.569 I-.751 J2.706 E.52039
G1 X45.237 Y39.509 E.00506
G1 X45.782 Y39.773 F30000
G1 F16213.044
G1 X46.071 Y39.732 E.00966
G3 X46.901 Y39.812 I.096 J3.351 E.02773
G3 X45.716 Y39.787 I-.642 J2.314 E.46079
G1 X45.724 Y39.785 E.00025
G1 X46.074 Y40.127 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X46.1 Y40.123 E.00081
G3 X46.599 Y40.145 I.154 J2.145 E.01539
G3 X45.804 Y40.169 I-.339 J1.98 E.36316
G1 X46.015 Y40.136 E.00657
; WIPE_START
M204 S10000
G1 X46.1 Y40.123 E-.03276
G1 X46.4 Y40.12 E-.1141
G1 X46.599 Y40.145 E-.07618
G1 X46.984 Y40.254 E-.15213
G1 X47.341 Y40.436 E-.15212
G1 X47.654 Y40.686 E-.1521
G1 X47.79 Y40.848 E-.08062
; WIPE_END
G1 E-.04 F1800
G1 X55.421 Y40.694 Z2 F30000
G1 X126.555 Y39.254 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X126.679 Y39.198 E.00452
G3 X127.76 Y38.92 I1.33 J2.927 E.03719
G3 X129.176 Y39.129 I.238 J3.279 E.04787
G3 X126.395 Y39.345 I-1.167 J2.996 E.57441
G1 X126.503 Y39.284 E.00411
G1 X127.041 Y39.486 F30000
M73 P51 R27
G1 F16213.044
G1 X127.107 Y39.467 E.00228
G3 X127.79 Y39.326 I.903 J2.659 E.02321
G3 X128.761 Y39.42 I.227 J2.724 E.03253
G3 X126.847 Y39.569 I-.751 J2.706 E.5204
G1 X126.986 Y39.51 E.00501
G1 X127.531 Y39.773 F30000
G1 F16213.044
G1 X127.821 Y39.732 E.00971
G3 X128.651 Y39.812 I.095 J3.352 E.02773
G3 X127.466 Y39.787 I-.642 J2.314 E.46079
G1 X127.472 Y39.785 E.0002
G1 X127.85 Y40.123 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X128.349 Y40.145 I.154 J2.145 E.01539
G3 X127.79 Y40.129 I-.339 J1.98 E.37054
; WIPE_START
M204 S10000
G1 X128.15 Y40.12 E-.13682
G1 X128.349 Y40.145 E-.07617
G1 X128.544 Y40.19 E-.07612
G1 X128.917 Y40.336 E-.15213
G1 X129.253 Y40.553 E-.15213
G1 X129.54 Y40.833 E-.15212
G1 X129.561 Y40.864 E-.0145
; WIPE_END
G1 E-.04 F1800
G1 X137.192 Y40.696 Z2 F30000
G1 X210.753 Y39.071 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X210.926 Y39.129 E.00605
G3 X209.51 Y38.92 I-1.167 J2.996 E.62223
G3 X210.621 Y39.029 I.238 J3.279 E.03722
G1 X210.696 Y39.053 E.0026
G1 X210.306 Y39.373 F30000
G1 F16213.044
G1 X210.511 Y39.42 E.00697
G3 X209.54 Y39.326 I-.751 J2.706 E.55288
G3 X210.238 Y39.357 I.227 J2.724 E.02323
G1 X210.248 Y39.36 E.00033
G1 X209.864 Y39.729 F30000
G1 F16213.044
G1 X209.929 Y39.741 E.00218
G3 X210.401 Y39.812 I-.262 J3.343 E.01585
G3 X209.571 Y39.732 I-.642 J2.314 E.4727
G1 X209.804 Y39.73 E.00774
G1 X209.6 Y40.123 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X210.099 Y40.145 I.154 J2.145 E.01539
G3 X209.54 Y40.129 I-.339 J1.98 E.37054
; WIPE_START
M204 S10000
G1 X209.9 Y40.12 E-.13682
G1 X210.099 Y40.145 E-.07618
G1 X210.484 Y40.254 E-.15213
G1 X210.841 Y40.436 E-.15212
G1 X211.154 Y40.686 E-.15212
G1 X211.307 Y40.869 E-.09064
; WIPE_END
G1 E-.04 F1800
G1 X211.029 Y48.496 Z2 F30000
G1 X208.305 Y123.129 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X208.429 Y123.073 E.00451
G3 X209.51 Y122.795 I1.33 J2.927 E.0372
G3 X210.926 Y123.004 I.238 J3.279 E.04786
G3 X208.145 Y123.22 I-1.167 J2.996 E.57441
G1 X208.253 Y123.159 E.00412
G1 X208.791 Y123.361 F30000
G1 F16213.044
G1 X208.857 Y123.342 E.00228
G3 X209.54 Y123.201 I.903 J2.659 E.02321
G3 X210.511 Y123.295 I.227 J2.724 E.03253
G3 X208.597 Y123.445 I-.751 J2.706 E.52039
G1 X208.736 Y123.385 E.00502
G1 X209.281 Y123.648 F30000
G1 F16213.044
G1 X209.571 Y123.607 E.0097
G3 X210.401 Y123.687 I.096 J3.352 E.02773
G3 X209.216 Y123.662 I-.642 J2.314 E.46079
G1 X209.222 Y123.66 E.0002
G1 X209.6 Y123.998 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X210.099 Y124.02 I.154 J2.146 E.01539
G3 X209.54 Y124.004 I-.339 J1.98 E.37054
; WIPE_START
M204 S10000
G1 X209.9 Y123.995 E-.13681
G1 X210.099 Y124.02 E-.07618
G1 X210.484 Y124.129 E-.15213
G1 X210.841 Y124.311 E-.15212
G1 X211.154 Y124.561 E-.15212
G1 X211.307 Y124.744 E-.09064
; WIPE_END
G1 E-.04 F1800
G1 X211.236 Y132.376 Z2 F30000
G1 X210.542 Y206.759 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X210.622 Y206.777 E.0027
G3 X209.35 Y206.682 I-.871 J3.096 E.62783
G1 X209.67 Y206.658 E.01064
G3 X210.309 Y206.706 I.081 J3.216 E.02128
G1 X210.484 Y206.746 E.00595
G1 X210.13 Y207.094 F30000
G1 F16213.044
G1 X210.238 Y207.107 E.00362
G3 X209.401 Y207.086 I-.488 J2.767 E.55762
G1 X209.68 Y207.065 E.00929
G3 X209.96 Y207.072 I.07 J2.808 E.00929
G1 X210.07 Y207.086 E.00368
G1 X209.789 Y207.48 F30000
G1 F16213.044
G1 X210.167 Y207.509 E.01257
G3 X209.451 Y207.491 I-.417 J2.36 E.47572
G1 X209.69 Y207.473 E.00794
G1 X209.729 Y207.476 E.00131
G1 X209.591 Y207.873 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.7 Y207.865 E.00334
G3 X209.5 Y207.88 I.05 J2.005 E.38099
G1 X209.532 Y207.878 E.00097
; WIPE_START
M204 S10000
G1 X209.7 Y207.865 E-.06415
G1 X210.099 Y207.895 E-.15211
G1 X210.484 Y208.004 E-.15214
G1 X210.841 Y208.186 E-.15211
G1 X211.154 Y208.436 E-.15213
G1 X211.301 Y208.612 E-.08736
; WIPE_END
G1 E-.04 F1800
G1 X215.737 Y214.823 Z2 F30000
G1 X218.334 Y218.459 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X37.666 Y218.459 E5.99308
G1 X37.666 Y33.541 E6.13406
G1 X218.334 Y33.541 E5.99308
G1 X218.334 Y218.399 E6.13207
G1 X218.741 Y218.866 F30000
G1 F16213.044
G1 X37.259 Y218.866 E6.02008
G1 X37.259 Y33.134 E6.16106
G1 X218.741 Y33.134 E6.02008
G1 X218.741 Y218.806 E6.15907
G1 X219.148 Y219.273 F30000
G1 F16213.044
G1 X36.852 Y219.273 E6.04709
G1 X36.852 Y32.727 E6.18807
G1 X219.148 Y32.727 E6.04709
G1 X219.148 Y219.213 E6.18608
G1 X219.54 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X36.46 Y219.665 E5.62554
G1 X36.46 Y32.335 E5.75613
G1 X219.54 Y32.335 E5.62554
G1 X219.54 Y219.605 E5.75429
; WIPE_START
M204 S10000
G1 X217.54 Y219.606 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X216.127 Y212.105 Z2 F30000
G1 X201.514 Y134.56 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X201.514 Y136.188 E.05401
G1 X217.986 Y152.659 E.77269
M73 P52 R27
G1 X217.986 Y151.154 E.04993
G1 X201.514 Y167.625 E.77269
G1 X201.514 Y164.973 E.08798
G1 X217.986 Y181.444 E.77269
G1 X217.986 Y179.939 E.04993
G1 X201.514 Y196.41 E.77269
G1 X201.514 Y193.757 E.08798
G1 X217.986 Y210.229 E.77269
G1 X217.986 Y208.723 E.04993
G1 X208.597 Y218.111 E.44041
G1 X192.126 Y201.639 E.77269
G1 X190.528 Y201.639 E.053
G1 X174.057 Y218.111 E.77269
G1 X157.584 Y201.639 E.77273
G1 X155.986 Y201.639 E.053
G1 X139.515 Y218.111 E.77269
G1 X131.553 Y210.15 E.37347
G2 X131.433 Y208.921 I-4.84 J-.149 E.04107
G1 X138.715 Y201.639 E.34161
G1 X140.313 Y201.639 E.053
G1 X156.786 Y218.111 E.77273
G1 X173.257 Y201.639 E.77269
G1 X174.855 Y201.639 E.053
G1 X191.328 Y218.111 E.77274
G1 X217.986 Y191.453 E1.25058
G1 X217.986 Y192.958 E.04993
G1 X201.514 Y176.487 E.77269
G1 X201.514 Y179.139 E.08798
G1 X217.986 Y162.668 E.77269
G1 X217.986 Y164.173 E.04993
G1 X201.514 Y147.702 E.77269
G1 X201.514 Y150.354 E.08798
G1 X217.986 Y133.883 E.77269
G1 X217.986 Y135.388 E.04993
G1 X211.627 Y129.03 E.29829
G3 X211.025 Y129.33 I-2.269 J-3.799 E.02234
G1 X201.514 Y138.84 E.44616
G1 X201.514 Y140.468 E.05401
; WIPE_START
G1 X201.514 Y138.84 E-.61876
G1 X201.777 Y138.577 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X204.55 Y131.466 Z2 F30000
G1 X207.86 Y122.98 Z2
G1 Z1.6
G1 E.8 F1800
G1 F16200
G2 X206.719 Y124.122 I1.934 J3.073 E.05398
G1 X201.514 Y118.917 E.24417
G1 X201.514 Y121.569 E.08798
G1 X217.986 Y105.098 E.77269
G1 X217.986 Y106.603 E.04993
G1 X201.514 Y90.132 E.77269
G1 X201.514 Y92.784 E.08798
G1 X217.986 Y76.313 E.77269
G1 X217.986 Y77.818 E.04993
G1 X201.514 Y61.347 E.77269
G1 X201.514 Y63.999 E.08798
G1 X217.986 Y47.528 E.77269
G1 X217.986 Y49.034 E.04993
G1 X212.845 Y43.893 E.24117
G2 X213.096 Y40.904 I-3.253 J-1.779 E.10243
G1 X217.986 Y36.014 E.22936
G1 X217.986 Y37.52 E.04993
G1 X214.354 Y33.889 E.17034
G1 X209.673 Y38.57 E.21959
G2 X207.981 Y39.029 I.044 J3.515 E.05876
G1 X202.84 Y33.889 E.24114
G1 X186.369 Y50.361 E.77269
G1 X184.771 Y50.361 E.053
G1 X168.298 Y33.889 E.77273
G1 X151.827 Y50.361 E.77269
G1 X150.229 Y50.361 E.053
G1 X133.758 Y33.889 E.77269
G1 X128.956 Y38.689 E.22522
G2 X127.047 Y38.693 I-.948 J3.699 E.06401
G1 X122.242 Y33.889 E.22537
G1 X105.771 Y50.361 E.77269
G1 X104.173 Y50.361 E.053
G1 X87.702 Y33.889 E.77269
G1 X71.229 Y50.361 E.77274
G1 X69.631 Y50.361 E.053
G1 X53.16 Y33.889 E.77269
G1 X48.016 Y39.032 E.24127
G2 X46.326 Y38.569 I-1.856 J3.464 E.05863
G1 X41.646 Y33.889 E.21953
G1 X38.014 Y37.52 E.17034
G1 X38.014 Y36.014 E.04993
G1 X42.9 Y40.9 E.22921
G2 X43.156 Y43.892 I3.529 J1.205 E.1025
G1 X38.014 Y49.034 E.2412
G1 X38.014 Y47.528 E.04993
G1 X54.486 Y63.999 E.77269
G1 X54.486 Y61.347 E.08798
G1 X38.014 Y77.818 E.77269
G1 X38.014 Y76.313 E.04993
G1 X54.486 Y92.784 E.77269
G1 X54.486 Y90.132 E.08798
G1 X38.014 Y106.603 E.77269
G1 X38.014 Y105.098 E.04993
G1 X54.486 Y121.569 E.77269
G1 X54.486 Y118.917 E.08798
G1 X49.278 Y124.124 E.24428
G3 X49.278 Y127.876 I-3.12 J1.876 E.13075
G1 X54.486 Y133.083 E.24428
G1 X54.486 Y130.431 E.08798
G1 X38.014 Y146.902 E.77269
G1 X38.014 Y145.397 E.04993
G1 X54.486 Y161.868 E.77269
G1 X54.486 Y159.216 E.08798
G1 X38.014 Y175.687 E.77269
G1 X38.014 Y174.182 E.04993
G1 X54.486 Y190.653 E.77269
G1 X54.486 Y188.001 E.08798
G1 X38.014 Y204.472 E.77269
G1 X38.014 Y202.966 E.04993
G1 X43.156 Y208.108 E.2412
G2 X42.9 Y211.1 I3.273 J1.786 E.1025
G1 X38.014 Y215.986 E.22921
G1 X38.014 Y214.48 E.04993
G1 X41.646 Y218.111 E.17034
G1 X46.32 Y213.437 E.21926
G2 X48.016 Y212.968 I-.201 J-4.035 E.05884
G1 X53.16 Y218.111 E.24127
G1 X69.631 Y201.639 E.77269
G1 X71.229 Y201.639 E.053
G1 X87.702 Y218.111 E.77273
G1 X104.173 Y201.639 E.77269
G1 X105.771 Y201.639 E.053
G1 X122.242 Y218.111 E.77269
G1 X127.047 Y213.307 E.22537
G2 X128.956 Y213.311 I.961 J-3.904 E.06394
G1 X133.758 Y218.111 E.22522
G1 X150.229 Y201.639 E.77269
G1 X151.827 Y201.639 E.053
G1 X168.298 Y218.111 E.77269
G1 X184.771 Y201.639 E.77274
G1 X186.369 Y201.639 E.053
G1 X202.84 Y218.111 E.77269
G1 X207.981 Y212.971 E.24114
G2 X209.683 Y213.44 I1.944 J-3.734 E.05901
G1 X214.354 Y218.111 E.2191
G1 X217.986 Y214.48 E.17034
G1 X217.986 Y215.986 E.04993
G1 X213.096 Y211.096 E.22936
G2 X212.845 Y208.107 I-3.504 J-1.21 E.10243
G1 X217.986 Y202.966 E.24117
G1 X217.986 Y204.472 E.04993
G1 X201.514 Y188.001 E.77269
G1 X201.514 Y190.653 E.08798
G1 X217.986 Y174.182 E.77269
G1 X217.986 Y175.687 E.04993
G1 X201.514 Y159.216 E.77269
G1 X201.514 Y161.868 E.08798
G1 X217.986 Y145.397 E.77269
G1 X217.986 Y146.902 E.04993
G1 X201.514 Y130.431 E.77269
G1 X201.514 Y133.083 E.08798
G1 X206.719 Y127.878 E.24417
G2 X207.86 Y129.02 I3.076 J-1.933 E.05398
; WIPE_START
G1 X207.135 Y128.426 E-.35606
G1 X206.719 Y127.878 E-.2613
G1 X206.454 Y128.144 E-.14264
; WIPE_END
G1 E-.04 F1800
G1 X204.797 Y120.693 Z2 F30000
G1 X201.514 Y105.927 Z2
G1 Z1.6
G1 E.8 F1800
G1 F16200
G1 X201.514 Y104.298 E.05401
G1 X217.986 Y87.827 E.77269
G1 X217.986 Y89.332 E.04993
G1 X201.514 Y72.861 E.77269
G1 X201.514 Y75.513 E.08798
G1 X217.986 Y59.042 E.77269
G1 X217.986 Y60.547 E.04993
G1 X191.328 Y33.889 E1.25058
G1 X174.855 Y50.361 E.77273
G1 X173.257 Y50.361 E.053
G1 X156.786 Y33.889 E.77269
G1 X140.313 Y50.361 E.77274
G1 X138.715 Y50.361 E.053
G1 X131.433 Y43.079 E.34161
G2 X131.553 Y41.85 I-4.72 J-1.08 E.04107
G1 X139.515 Y33.889 E.37347
G1 X155.986 Y50.361 E.77269
G1 X157.584 Y50.361 E.053
G1 X174.057 Y33.889 E.77273
G1 X190.528 Y50.361 E.77269
G1 X192.126 Y50.361 E.053
G1 X208.597 Y33.889 E.77269
G1 X217.986 Y43.277 E.44041
G1 X217.986 Y41.771 E.04993
G1 X201.514 Y58.243 E.77269
G1 X201.514 Y55.59 E.08798
G1 X217.986 Y72.061 E.77269
G1 X217.986 Y70.556 E.04993
G1 X201.514 Y87.027 E.77269
G1 X201.514 Y84.375 E.08798
G1 X217.986 Y100.846 E.77269
G1 X217.986 Y99.341 E.04993
G1 X201.514 Y115.812 E.77269
G1 X201.514 Y113.16 E.08798
G1 X211.025 Y122.67 E.44615
G3 X211.627 Y122.97 I-1.671 J4.109 E.02234
G1 X217.986 Y116.612 E.29829
G1 X217.986 Y118.117 E.04993
G1 X201.514 Y101.646 E.77269
G1 X201.514 Y100.018 E.05401
; WIPE_START
G1 X201.514 Y101.646 E-.61876
G1 X201.777 Y101.909 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X200.733 Y94.348 Z2 F30000
G1 X194.656 Y50.361 Z2
G1 Z1.6
G1 E.8 F1800
G1 F16200
G1 X196.285 Y50.361 E.05401
G1 X179.814 Y33.889 E.77269
G1 X163.341 Y50.361 E.77273
G1 X161.743 Y50.361 E.053
G1 X145.272 Y33.889 E.77269
G1 X128.799 Y50.361 E.77273
G1 X127.201 Y50.361 E.053
G1 X110.73 Y33.889 E.77269
G1 X94.257 Y50.361 E.77274
G1 X92.659 Y50.361 E.053
G1 X76.188 Y33.889 E.77269
G1 X59.715 Y50.361 E.77274
G1 X58.117 Y50.361 E.053
G1 X49.813 Y42.056 E.38957
G3 X49.668 Y43.137 I-5.771 J-.224 E.03621
G1 X58.917 Y33.889 E.43385
G1 X75.388 Y50.361 E.77269
G1 X76.986 Y50.361 E.053
G1 X93.459 Y33.889 E.77274
G1 X109.93 Y50.361 E.77269
G1 X111.528 Y50.361 E.053
G1 X128.001 Y33.889 E.77273
G1 X144.472 Y50.361 E.77269
G1 X146.07 Y50.361 E.053
G1 X162.543 Y33.889 E.77274
G1 X179.014 Y50.361 E.77269
G1 X180.612 Y50.361 E.053
G1 X197.085 Y33.889 E.77273
G1 X206.335 Y43.14 E.43397
G3 X206.188 Y42.055 I5.123 J-1.249 E.03639
G1 X197.883 Y50.361 E.38962
G1 X201.514 Y50.361 E.12048
G1 X201.514 Y52.486 E.07049
G1 X208.528 Y45.472 E.32901
G2 X208.735 Y45.54 I.443 J-1.003 E.00724
G1 X217.986 Y54.79 E.43396
G1 X217.986 Y53.285 E.04993
G1 X201.514 Y69.756 E.77269
G1 X201.514 Y67.104 E.08798
G1 X217.986 Y83.575 E.77269
G1 X217.986 Y82.07 E.04993
G1 X201.514 Y98.541 E.77269
G1 X201.514 Y95.889 E.08798
G1 X217.986 Y112.36 E.77269
G1 X217.986 Y110.855 E.04993
G1 X201.514 Y127.326 E.77269
G1 X201.514 Y124.674 E.08798
G1 X217.986 Y141.145 E.77269
G1 X217.986 Y139.64 E.04993
G1 X201.514 Y156.111 E.77269
G1 X201.514 Y153.459 E.08798
G1 X217.986 Y169.93 E.77269
G1 X217.986 Y168.425 E.04993
G1 X201.514 Y184.896 E.77269
G1 X201.514 Y182.244 E.08798
G1 X217.986 Y198.715 E.77269
G1 X217.986 Y197.21 E.04993
G1 X208.735 Y206.46 E.43396
G2 X208.528 Y206.528 I.235 J1.068 E.00724
G1 X201.514 Y199.514 E.32901
G1 X201.514 Y201.143 E.05401
; WIPE_START
G1 X201.514 Y199.514 E-.61876
G1 X201.777 Y199.777 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X194.145 Y199.878 Z2 F30000
G1 X61.344 Y201.639 Z2
G1 Z1.6
G1 E.8 F1800
G1 F16200
G1 X59.715 Y201.639 E.05401
G1 X76.186 Y218.111 E.77269
G1 X92.659 Y201.639 E.77273
G1 X94.257 Y201.639 E.053
G1 X110.728 Y218.111 E.77269
G1 X127.201 Y201.639 E.77273
G1 X128.799 Y201.639 E.053
G1 X145.27 Y218.111 E.77269
G1 X161.743 Y201.639 E.77274
G1 X163.341 Y201.639 E.053
G1 X179.812 Y218.111 E.77269
G1 X196.285 Y201.639 E.77274
G1 X197.882 Y201.639 E.053
G1 X206.188 Y209.945 E.38962
G3 X206.335 Y208.86 I5.274 J.165 E.03639
G1 X197.083 Y218.111 E.43402
G1 X180.612 Y201.639 E.77269
G1 X179.014 Y201.639 E.053
G1 X162.543 Y218.111 E.77269
G1 X146.07 Y201.639 E.77274
G1 X144.472 Y201.639 E.053
G1 X128.001 Y218.111 E.77269
G1 X111.528 Y201.639 E.77273
G1 X109.93 Y201.639 E.053
G1 X93.459 Y218.111 E.77269
G1 X76.986 Y201.639 E.77273
G1 X75.388 Y201.639 E.053
G1 X58.917 Y218.111 E.77269
G1 X49.668 Y208.863 E.43385
G3 X49.813 Y209.944 I-5.627 J1.305 E.03621
G1 X58.117 Y201.639 E.38957
G1 X54.486 Y201.639 E.12048
G1 X54.486 Y199.514 E.07049
G1 X47.472 Y206.528 E.32901
G1 X47.262 Y206.457 E.00736
G1 X38.014 Y197.21 E.43382
G1 X38.014 Y198.715 E.04993
G1 X54.486 Y182.244 E.77269
G1 X54.486 Y184.896 E.08798
G1 X38.014 Y168.425 E.77269
G1 X38.014 Y169.93 E.04993
G1 X54.486 Y153.459 E.77269
G1 X54.486 Y156.111 E.08798
G1 X38.014 Y139.64 E.77269
G1 X38.014 Y141.145 E.04993
G1 X54.486 Y124.674 E.77269
G1 X54.486 Y127.326 E.08798
G1 X38.014 Y110.855 E.77269
G1 X38.014 Y112.36 E.04993
G1 X54.486 Y95.889 E.77269
G1 X54.486 Y98.541 E.08798
G1 X38.014 Y82.07 E.77269
G1 X38.014 Y83.575 E.04993
G1 X54.486 Y67.104 E.77269
G1 X54.486 Y69.756 E.08798
G1 X38.014 Y53.285 E.77269
G1 X38.014 Y54.79 E.04993
G1 X47.262 Y45.543 E.43382
G1 X47.472 Y45.472 E.00736
G1 X54.486 Y52.486 E.32901
G1 X54.486 Y50.857 E.05401
G1 X54.486 Y77.142 F30000
G1 F16200
G1 X54.486 Y75.513 E.05401
G1 X38.014 Y59.042 E.77269
G1 X38.014 Y60.547 E.04993
G1 X64.672 Y33.889 E1.25058
G1 X81.145 Y50.361 E.77274
G1 X82.743 Y50.361 E.053
G1 X99.214 Y33.889 E.77269
G1 X115.687 Y50.361 E.77273
G1 X117.285 Y50.361 E.053
G1 X124.566 Y43.079 E.34159
G3 X124.447 Y41.85 I3.511 J-.96 E.04116
G1 X116.485 Y33.889 E.37349
G1 X100.014 Y50.361 E.77269
G1 X98.416 Y50.361 E.053
G1 X81.943 Y33.889 E.77273
G1 X65.472 Y50.361 E.77269
G1 X63.874 Y50.361 E.053
G1 X47.403 Y33.889 E.77269
G1 X38.014 Y43.277 E.44041
G1 X38.014 Y41.771 E.04993
G1 X54.486 Y58.242 E.77269
G1 X54.486 Y55.59 E.08798
G1 X38.014 Y72.061 E.77269
G1 X38.014 Y70.556 E.04993
G1 X54.486 Y87.027 E.77269
G1 X54.486 Y84.375 E.08798
G1 X38.014 Y100.846 E.77269
G1 X38.014 Y99.341 E.04993
G1 X54.486 Y115.812 E.77269
G1 X54.486 Y113.16 E.08798
G1 X44.97 Y122.676 E.4464
G2 X44.374 Y122.971 I1.316 J3.404 E.0221
G1 X38.014 Y116.612 E.29833
G1 X38.014 Y118.117 E.04993
G1 X54.486 Y101.646 E.77269
G1 X54.486 Y104.298 E.08798
G1 X38.014 Y87.827 E.77269
G1 X38.014 Y89.332 E.04993
G1 X54.486 Y72.861 E.77269
G1 X54.486 Y71.233 E.05401
G1 X54.486 Y140.316 F30000
G1 F16200
G1 X54.486 Y141.945 E.05401
G1 X38.014 Y158.416 E.77269
G1 X38.014 Y156.911 E.04993
G1 X54.486 Y173.382 E.77269
G1 X54.486 Y170.73 E.08798
G1 X38.014 Y187.201 E.77269
G1 X38.014 Y185.696 E.04993
G1 X70.429 Y218.111 E1.52065
G1 X86.902 Y201.639 E.77273
G1 X88.5 Y201.639 E.053
G1 X104.971 Y218.111 E.77269
G1 X121.444 Y201.639 E.77273
M73 P53 R27
G1 X123.042 Y201.639 E.053
G1 X127.726 Y206.323 E.21973
G3 X128.278 Y206.32 I.308 J4.823 E.01832
G1 X132.958 Y201.639 E.21956
G1 X134.556 Y201.639 E.053
G1 X151.029 Y218.111 E.77273
G1 X167.5 Y201.639 E.77269
G1 X169.098 Y201.639 E.053
G1 X185.571 Y218.111 E.77273
G1 X217.986 Y185.696 E1.52065
G1 X217.986 Y187.201 E.04993
G1 X201.514 Y170.73 E.77269
G1 X201.514 Y173.382 E.08798
G1 X217.986 Y156.911 E.77269
G1 X217.986 Y158.416 E.04993
G1 X201.514 Y141.945 E.77269
G1 X201.514 Y144.597 E.08798
G1 X217.986 Y128.126 E.77269
G1 X217.986 Y129.631 E.04993
G1 X213.075 Y124.721 E.23035
G3 X213.075 Y127.279 I-3.546 J1.279 E.08659
G1 X217.986 Y122.369 E.23035
G1 X217.986 Y123.874 E.04993
G1 X201.514 Y107.403 E.77269
G1 X201.514 Y110.055 E.08798
G1 X217.986 Y93.584 E.77269
G1 X217.986 Y95.089 E.04993
G1 X201.514 Y78.618 E.77269
G1 X201.514 Y81.27 E.08798
G1 X217.986 Y64.799 E.77269
G1 X217.986 Y66.304 E.04993
G1 X185.571 Y33.889 E1.52065
G1 X169.098 Y50.361 E.77273
G1 X167.5 Y50.361 E.053
G1 X151.029 Y33.889 E.77269
G1 X134.556 Y50.361 E.77273
G1 X132.958 Y50.361 E.053
G1 X128.278 Y45.68 E.21956
G3 X127.726 Y45.677 I-.244 J-4.829 E.01832
G1 X123.042 Y50.361 E.21973
G1 X121.444 Y50.361 E.053
G1 X104.971 Y33.889 E.77273
G1 X88.5 Y50.361 E.77269
G1 X86.902 Y50.361 E.053
G1 X70.429 Y33.889 E.77273
G1 X38.014 Y66.304 E1.52065
G1 X38.014 Y64.799 E.04993
G1 X54.486 Y81.27 E.77269
G1 X54.486 Y78.618 E.08798
G1 X38.014 Y95.089 E.77269
G1 X38.014 Y93.584 E.04993
G1 X54.486 Y110.055 E.77269
G1 X54.486 Y107.403 E.08798
G1 X38.014 Y123.874 E.77269
G1 X38.014 Y122.369 E.04993
G1 X42.923 Y127.277 E.23025
G3 X42.923 Y124.723 I3.356 J-1.277 E.08662
G1 X38.014 Y129.631 E.23025
G1 X38.014 Y128.126 E.04993
G1 X54.486 Y144.597 E.77269
G1 X54.486 Y146.225 E.05401
G1 X54.486 Y169.253 F30000
G1 F16200
G1 X54.486 Y167.625 E.05401
G1 X38.014 Y151.154 E.77269
G1 X38.014 Y152.659 E.04993
G1 X54.486 Y136.188 E.77269
G1 X54.486 Y138.84 E.08798
G1 X44.97 Y129.324 E.4464
G3 X44.374 Y129.029 I1.317 J-3.405 E.0221
G1 X38.014 Y135.388 E.29832
G1 X38.014 Y133.883 E.04993
G1 X54.486 Y150.354 E.77269
G1 X54.486 Y147.702 E.08798
G1 X38.014 Y164.173 E.77269
G1 X38.014 Y162.668 E.04993
G1 X54.486 Y179.139 E.77269
G1 X54.486 Y176.487 E.08798
G1 X38.014 Y192.958 E.77269
G1 X38.014 Y191.453 E.04993
G1 X64.672 Y218.111 E1.25058
G1 X81.145 Y201.639 E.77273
G1 X82.743 Y201.639 E.053
G1 X99.214 Y218.111 E.77269
G1 X115.687 Y201.639 E.77274
G1 X117.285 Y201.639 E.053
G1 X124.566 Y208.921 E.34159
G2 X124.447 Y210.15 I3.512 J.96 E.04116
G1 X116.485 Y218.111 E.37349
G1 X100.014 Y201.639 E.77269
G1 X98.416 Y201.639 E.053
G1 X81.943 Y218.111 E.77273
G1 X65.472 Y201.639 E.77269
G1 X63.874 Y201.639 E.053
G1 X47.402 Y218.111 E.77273
G1 X38.014 Y208.723 E.44037
G1 X38.014 Y210.229 E.04993
G1 X54.486 Y193.757 E.77269
G1 X54.486 Y196.41 E.08798
G1 X38.014 Y179.939 E.77269
G1 X38.014 Y181.444 E.04993
G1 X54.486 Y164.973 E.77269
G1 X54.486 Y163.344 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F16200
G1 X54.486 Y164.973 E-.61876
G1 X54.223 Y165.235 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/15
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
G17
G3 Z2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 15
G1 X126.165 Y212.516
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F16213.044
G1 X126.126 Y212.481 E.00172
G3 X127.772 Y206.669 I1.883 J-2.606 E.26043
G3 X129.176 Y206.879 I.226 J3.281 E.04747
G3 X126.395 Y212.656 I-1.167 J2.996 E.35156
G1 X126.216 Y212.547 E.00693
G1 X126.388 Y212.175 F30000
G1 F16213.044
G1 X126.363 Y212.151 E.00115
G3 X127.802 Y207.075 I1.647 J-2.275 E.22742
G3 X128.761 Y207.17 I.216 J2.722 E.03214
G3 X126.598 Y212.304 I-.751 J2.706 E.31656
G1 X126.439 Y212.207 E.00616
G1 X126.604 Y211.816 F30000
G1 F16213.044
G1 X126.414 Y211.672 E.00792
G3 X127.833 Y207.481 I1.594 J-1.796 E.18657
G3 X128.651 Y207.562 I.077 J3.396 E.02734
G3 X126.801 Y211.952 I-.642 J2.314 E.27065
G1 X126.654 Y211.85 E.00593
G1 X126.716 Y211.41 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X126.533 Y211.236 E.00777
G3 X127.862 Y207.872 I1.477 J-1.361 E.13834
G3 X128.349 Y207.895 I.141 J2.154 E.01502
G3 X126.831 Y211.501 I-.339 J1.98 E.22215
G1 X126.763 Y211.447 E.00265
; WIPE_START
M204 S10000
G1 X126.533 Y211.236 E-.11876
G1 X126.398 Y211.089 E-.07611
G1 X126.189 Y210.747 E-.1521
G1 X126.052 Y210.371 E-.15211
G1 X125.992 Y209.975 E-.15215
G1 X126.007 Y209.689 E-.10877
; WIPE_END
G1 E-.04 F1800
G1 X118.376 Y209.507 Z2.2 F30000
G1 X43.858 Y207.726 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X43.898 Y207.693 E.00173
G3 X46.022 Y206.669 I2.361 J2.183 E.08006
G3 X47.426 Y206.879 I.226 J3.281 E.04746
G3 X43.693 Y207.938 I-1.167 J2.996 E.53195
G1 X43.821 Y207.773 E.00692
G1 X44.168 Y207.99 F30000
G1 F16213.044
G1 X44.197 Y207.97 E.00117
G3 X46.052 Y207.075 I2.063 J1.906 E.06995
G3 X47.011 Y207.17 I.216 J2.722 E.03214
G3 X44.018 Y208.184 I-.751 J2.706 E.47404
G1 X44.131 Y208.037 E.00616
G1 X44.514 Y208.218 F30000
G1 F16213.044
G1 X44.852 Y207.93 E.01473
G3 X46.083 Y207.481 I1.407 J1.946 E.04402
G3 X46.901 Y207.562 I.077 J3.396 E.02734
G3 X44.477 Y208.266 I-.642 J2.314 E.41235
G1 X44.761 Y208.528 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X44.783 Y208.514 E.00079
G3 X46.112 Y207.872 I1.477 J1.361 E.04643
G3 X46.599 Y207.895 I.141 J2.154 E.01502
G3 X44.544 Y208.832 I-.339 J1.98 E.31406
G1 X44.726 Y208.576 E.00966
; WIPE_START
M204 S10000
G1 X44.783 Y208.514 E-.0321
G1 X45.077 Y208.243 E-.15179
G1 X45.423 Y208.043 E-.15212
G1 X45.803 Y207.915 E-.15212
G1 X46.112 Y207.872 E-.11864
G1 X46.4 Y207.87 E-.10956
G1 X46.514 Y207.885 E-.04367
; WIPE_END
G1 E-.04 F1800
G1 X46.771 Y200.257 Z2.2 F30000
G1 X49.307 Y125.003 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X49.33 Y125.05 E.00173
G3 X46.022 Y122.794 I-3.071 J.951 E.52671
G3 X47.426 Y123.004 I.226 J3.281 E.04747
G3 X49.22 Y124.748 I-1.167 J2.996 E.08525
G1 X49.288 Y124.946 E.00695
G1 X48.924 Y125.139 F30000
G1 F16213.044
G1 X48.943 Y125.169 E.00118
G3 X46.052 Y123.2 I-2.683 J.832 E.46015
G3 X47.011 Y123.295 I.216 J2.722 E.03213
G3 X48.846 Y124.906 I-.751 J2.706 E.0838
G1 X48.905 Y125.083 E.00618
G1 X48.535 Y125.295 F30000
G1 F16213.044
G1 X48.612 Y125.522 E.00796
G3 X46.083 Y123.606 I-2.353 J.478 E.3855
G3 X46.901 Y123.687 I.077 J3.398 E.02734
G3 X48.47 Y125.064 I-.642 J2.314 E.07165
G1 X48.518 Y125.237 E.00597
G1 X48.217 Y125.636 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X48.259 Y125.799 E.00516
G3 X46.112 Y123.997 I-1.998 J.201 E.29246
G3 X46.599 Y124.02 I.141 J2.154 E.01502
G3 X48.179 Y125.405 I-.339 J1.98 E.06792
G1 X48.207 Y125.577 E.00536
; WIPE_START
M204 S10000
G1 X48.259 Y125.799 E-.08651
G1 X48.25 Y126.2 E-.15249
G1 X48.171 Y126.593 E-.15212
G1 X48.015 Y126.961 E-.15213
G1 X47.79 Y127.292 E-.1521
G1 X47.668 Y127.411 E-.06465
; WIPE_END
G1 E-.04 F1800
G1 X54.545 Y130.721 Z2.2 F30000
G1 X201.166 Y201.291 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X54.834 Y201.291 E4.85411
G1 X54.834 Y50.709 E4.99509
G1 X201.166 Y50.709 E4.85411
G1 X201.166 Y201.231 E4.9931
G1 X200.759 Y200.884 F30000
G1 F16213.044
G1 X55.241 Y200.884 E4.82711
G1 X55.241 Y51.116 E4.96809
G1 X200.759 Y51.116 E4.82711
G1 X200.759 Y200.824 E4.9661
G1 X200.352 Y200.477 F30000
G1 F16213.044
G1 X55.648 Y200.477 E4.8001
G1 X55.648 Y51.523 E4.94108
G1 X200.352 Y51.523 E4.8001
G1 X200.352 Y200.417 E4.93909
G1 X199.96 Y200.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X56.04 Y200.085 E4.42226
G1 X56.04 Y51.915 E4.55285
G1 X199.96 Y51.915 E4.42226
G1 X199.96 Y200.025 E4.55101
; WIPE_START
M204 S10000
G1 X197.96 Y200.026 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X192.696 Y194.499 Z2.2 F30000
G1 X44.814 Y39.249 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X44.929 Y39.198 E.00417
G3 X46.022 Y38.919 I1.33 J2.927 E.03759
G3 X47.426 Y39.129 I.226 J3.281 E.04747
G3 X44.645 Y39.345 I-1.167 J2.996 E.57442
G1 X44.762 Y39.279 E.00446
G1 X45.3 Y39.482 F30000
G1 F16213.044
G1 X45.357 Y39.467 E.00194
G3 X46.052 Y39.325 I.903 J2.659 E.0236
G3 X47.011 Y39.42 I.216 J2.722 E.03214
G3 X45.097 Y39.57 I-.751 J2.706 E.52039
G1 X45.245 Y39.506 E.00535
G1 X45.792 Y39.772 F30000
G1 F16213.044
G1 X46.083 Y39.731 E.00974
G3 X46.901 Y39.812 I.077 J3.398 E.02734
G3 X45.716 Y39.787 I-.642 J2.314 E.46079
G1 X45.733 Y39.783 E.00056
G1 X46.078 Y40.127 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X46.112 Y40.122 E.00104
G3 X46.599 Y40.145 I.141 J2.154 E.01502
G3 X45.804 Y40.169 I-.339 J1.98 E.36316
G1 X46.019 Y40.136 E.0067
; WIPE_START
M204 S10000
G1 X46.112 Y40.122 E-.03561
G1 X46.4 Y40.12 E-.10956
G1 X46.599 Y40.145 E-.07619
G1 X46.794 Y40.19 E-.07612
G1 X47.167 Y40.336 E-.15213
G1 X47.503 Y40.553 E-.15212
G1 X47.79 Y40.833 E-.15213
G1 X47.799 Y40.846 E-.00615
; WIPE_END
G1 E-.04 F1800
G1 X55.43 Y40.692 Z2.2 F30000
G1 X126.563 Y39.25 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P53 R26
G1 F16213.044
G1 X126.679 Y39.198 E.00422
G3 X127.772 Y38.919 I1.33 J2.927 E.03759
G3 X129.176 Y39.129 I.226 J3.281 E.04747
G3 X126.395 Y39.345 I-1.167 J2.996 E.57441
G1 X126.511 Y39.279 E.00442
G1 X127.049 Y39.483 F30000
G1 F16213.044
G1 X127.107 Y39.467 E.00199
G3 X127.802 Y39.325 I.903 J2.659 E.0236
G3 X128.761 Y39.42 I.216 J2.722 E.03214
G3 X126.847 Y39.57 I-.751 J2.706 E.52039
G1 X126.994 Y39.507 E.00531
G1 X127.54 Y39.772 F30000
G1 F16213.044
G1 X127.833 Y39.731 E.00979
G3 X128.651 Y39.812 I.077 J3.398 E.02734
G3 X127.466 Y39.787 I-.642 J2.314 E.46079
G1 X127.481 Y39.784 E.00051
G1 X127.863 Y40.122 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X128.15 Y40.122 E.00882
G3 X128.349 Y40.145 I-.147 J2.153 E.00616
G3 X127.803 Y40.127 I-.339 J1.98 E.37095
; WIPE_START
M204 S10000
G1 X128.15 Y40.122 E-.13173
G1 X128.349 Y40.145 E-.07615
G1 X128.544 Y40.19 E-.07612
G1 X128.917 Y40.336 E-.15213
G1 X129.253 Y40.553 E-.15211
G1 X129.54 Y40.833 E-.15213
G1 X129.569 Y40.875 E-.01962
; WIPE_END
G1 E-.04 F1800
G1 X137.2 Y40.718 Z2.2 F30000
G1 X208.313 Y39.25 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X208.429 Y39.198 E.00421
G3 X209.522 Y38.919 I1.33 J2.927 E.03759
G3 X210.926 Y39.129 I.226 J3.281 E.04747
G3 X208.145 Y39.345 I-1.167 J2.996 E.57441
G1 X208.261 Y39.279 E.00443
G1 X208.799 Y39.483 F30000
G1 F16213.044
G1 X208.857 Y39.467 E.00198
G3 X209.552 Y39.325 I.903 J2.659 E.0236
G3 X210.511 Y39.42 I.216 J2.723 E.03213
G3 X208.597 Y39.57 I-.751 J2.706 E.52039
G1 X208.744 Y39.506 E.00531
G1 X209.29 Y39.772 F30000
G1 F16213.044
G1 X209.583 Y39.731 E.00978
G3 X210.401 Y39.812 I.077 J3.398 E.02734
G3 X209.216 Y39.787 I-.642 J2.314 E.46079
G1 X209.232 Y39.784 E.00052
G1 X209.613 Y40.122 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.9 Y40.122 E.00882
G3 X210.099 Y40.145 I-.147 J2.153 E.00616
G3 X209.553 Y40.127 I-.339 J1.98 E.37094
; WIPE_START
M204 S10000
G1 X209.9 Y40.122 E-.13183
G1 X210.099 Y40.145 E-.07614
G1 X210.484 Y40.254 E-.15212
G1 X210.841 Y40.436 E-.15212
G1 X211.154 Y40.686 E-.15213
G1 X211.315 Y40.879 E-.09566
; WIPE_END
G1 E-.04 F1800
G1 X211.265 Y48.511 Z2.2 F30000
G1 X210.77 Y122.952 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X210.926 Y123.005 E.00547
G3 X209.522 Y122.794 I-1.167 J2.996 E.62262
G3 X210.621 Y122.904 I.226 J3.281 E.03682
G1 X210.712 Y122.934 E.00319
G1 X210.323 Y123.252 F30000
G1 F16213.044
G1 X210.511 Y123.295 E.0064
G3 X209.552 Y123.2 I-.751 J2.706 E.55327
G3 X210.238 Y123.232 I.216 J2.722 E.02284
G1 X210.264 Y123.238 E.0009
G1 X209.881 Y123.604 F30000
G1 F16213.044
G1 X209.929 Y123.616 E.00162
G3 X210.401 Y123.687 I-.269 J3.388 E.01585
G3 X209.583 Y123.606 I-.642 J2.314 E.47309
G1 X209.821 Y123.605 E.00791
G1 X209.613 Y123.997 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.9 Y123.997 E.00882
G3 X210.099 Y124.02 I-.147 J2.153 E.00616
G3 X209.553 Y124.002 I-.339 J1.98 E.37094
; WIPE_START
M204 S10000
G1 X209.9 Y123.997 E-.13184
G1 X210.099 Y124.02 E-.07614
G1 X210.484 Y124.129 E-.15212
G1 X210.841 Y124.311 E-.15212
G1 X211.154 Y124.561 E-.1521
G1 X211.315 Y124.754 E-.09568
; WIPE_END
G1 E-.04 F1800
G1 X211.265 Y132.386 Z2.2 F30000
G1 X210.77 Y206.827 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X210.926 Y206.88 E.00546
G3 X209.522 Y206.669 I-1.167 J2.996 E.62262
G3 X210.621 Y206.779 I.226 J3.281 E.03683
G1 X210.713 Y206.809 E.00319
G1 X210.323 Y207.127 F30000
G1 F16213.044
G1 X210.511 Y207.17 E.0064
G3 X209.552 Y207.075 I-.751 J2.706 E.55327
G3 X210.238 Y207.107 I.216 J2.722 E.02284
G1 X210.265 Y207.113 E.0009
G1 X209.881 Y207.479 F30000
G1 F16213.044
G1 X209.929 Y207.491 E.00162
G3 X210.401 Y207.562 I-.269 J3.387 E.01585
G3 X209.583 Y207.481 I-.642 J2.314 E.47309
G1 X209.821 Y207.48 E.00791
G1 X209.608 Y207.873 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.612 Y207.872 E.00013
G3 X210.099 Y207.895 I.141 J2.154 E.01502
G3 X209.304 Y207.919 I-.339 J1.98 E.36316
G1 X209.548 Y207.882 E.00761
; WIPE_START
M204 S10000
G1 X209.612 Y207.872 E-.0244
G1 X209.9 Y207.87 E-.10956
G1 X210.099 Y207.895 E-.07618
G1 X210.294 Y207.94 E-.07615
G1 X210.667 Y208.086 E-.15209
G1 X211.003 Y208.303 E-.15214
G1 X211.29 Y208.583 E-.15213
G1 X211.316 Y208.621 E-.01736
; WIPE_END
G1 E-.04 F1800
G1 X215.748 Y214.834 Z2.2 F30000
G1 X218.334 Y218.459 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X37.666 Y218.459 E5.99308
G1 X37.666 Y33.541 E6.13406
G1 X218.334 Y33.541 E5.99308
G1 X218.334 Y218.399 E6.13207
G1 X218.741 Y218.866 F30000
G1 F16213.044
G1 X37.259 Y218.866 E6.02008
G1 X37.259 Y33.134 E6.16106
G1 X218.741 Y33.134 E6.02008
G1 X218.741 Y218.806 E6.15907
G1 X219.148 Y219.273 F30000
G1 F16213.044
G1 X36.852 Y219.273 E6.04709
G1 X36.852 Y32.727 E6.18807
G1 X219.148 Y32.727 E6.04709
G1 X219.148 Y219.213 E6.18608
G1 X219.54 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X36.46 Y219.665 E5.62554
G1 X36.46 Y32.335 E5.75613
G1 X219.54 Y32.335 E5.62554
G1 X219.54 Y219.605 E5.75429
; WIPE_START
M204 S10000
G1 X217.54 Y219.606 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X216.025 Y212.125 Z2.2 F30000
G1 X201.514 Y140.468 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X201.514 Y138.84 E.05401
G1 X211.025 Y129.33 E.44616
G2 X211.627 Y129.03 I-1.668 J-4.102 E.02234
G1 X217.986 Y135.388 E.29829
G1 X217.986 Y133.883 E.04993
G1 X201.514 Y150.354 E.77269
G1 X201.514 Y147.702 E.08798
G1 X217.986 Y164.173 E.77269
G1 X217.986 Y162.668 E.04993
G1 X201.514 Y179.139 E.77269
G1 X201.514 Y176.487 E.08798
G1 X217.986 Y192.958 E.77269
G1 X217.986 Y191.453 E.04993
G1 X191.328 Y218.111 E1.25058
G1 X174.855 Y201.639 E.77274
G1 X173.257 Y201.639 E.053
G1 X156.786 Y218.111 E.77269
G1 X140.313 Y201.639 E.77273
G1 X138.715 Y201.639 E.053
G1 X131.433 Y208.921 E.34161
G3 X131.553 Y210.15 I-4.721 J1.081 E.04107
G1 X139.515 Y218.111 E.37347
G1 X155.986 Y201.639 E.77269
G1 X157.584 Y201.639 E.053
G1 X174.057 Y218.111 E.77273
G1 X190.528 Y201.639 E.77269
G1 X192.126 Y201.639 E.053
G1 X208.597 Y218.111 E.77269
G1 X217.986 Y208.723 E.44041
G1 X217.986 Y210.229 E.04993
G1 X201.514 Y193.757 E.77269
G1 X201.514 Y196.41 E.08798
G1 X217.986 Y179.939 E.77269
G1 X217.986 Y181.444 E.04993
G1 X201.514 Y164.973 E.77269
M73 P54 R26
G1 X201.514 Y167.625 E.08798
G1 X217.986 Y151.154 E.77269
G1 X217.986 Y152.659 E.04993
G1 X201.514 Y136.188 E.77269
G1 X201.514 Y134.56 E.05401
G1 X201.514 Y105.927 F30000
G1 F16200
G1 X201.514 Y104.298 E.05401
G1 X217.986 Y87.827 E.77269
G1 X217.986 Y89.332 E.04993
G1 X201.514 Y72.861 E.77269
G1 X201.514 Y75.513 E.08798
G1 X217.986 Y59.042 E.77269
G1 X217.986 Y60.547 E.04993
G1 X191.328 Y33.889 E1.25058
G1 X174.855 Y50.361 E.77273
G1 X173.257 Y50.361 E.053
G1 X156.786 Y33.889 E.77269
G1 X140.313 Y50.361 E.77274
G1 X138.715 Y50.361 E.053
G1 X131.433 Y43.079 E.34161
G2 X131.553 Y41.85 I-4.717 J-1.08 E.04107
G1 X139.515 Y33.889 E.37347
G1 X155.986 Y50.361 E.77269
G1 X157.584 Y50.361 E.053
G1 X174.057 Y33.889 E.77273
G1 X190.528 Y50.361 E.77269
G1 X192.126 Y50.361 E.053
G1 X208.597 Y33.889 E.77269
G1 X217.986 Y43.277 E.44041
G1 X217.986 Y41.771 E.04993
G1 X201.514 Y58.243 E.77269
G1 X201.514 Y55.59 E.08798
G1 X217.986 Y72.061 E.77269
G1 X217.986 Y70.556 E.04993
G1 X201.514 Y87.027 E.77269
G1 X201.514 Y84.375 E.08798
G1 X217.986 Y100.846 E.77269
G1 X217.986 Y99.341 E.04993
G1 X201.514 Y115.812 E.77269
G1 X201.514 Y113.16 E.08798
G1 X211.025 Y122.67 E.44616
G3 X211.627 Y122.97 I-1.666 J4.097 E.02234
G1 X217.986 Y116.612 E.29829
G1 X217.986 Y118.117 E.04993
G1 X201.514 Y101.646 E.77269
G1 X201.514 Y100.018 E.05401
G1 X201.514 Y50.857 F30000
G1 F16200
G1 X201.514 Y52.486 E.05401
G1 X208.528 Y45.472 E.32902
G2 X208.735 Y45.54 I.442 J-1 E.00724
G1 X217.986 Y54.79 E.43396
G1 X217.986 Y53.285 E.04993
G1 X201.514 Y69.756 E.77269
G1 X201.514 Y67.104 E.08798
G1 X217.986 Y83.575 E.77269
G1 X217.986 Y82.07 E.04993
G1 X201.514 Y98.541 E.77269
G1 X201.514 Y95.889 E.08798
G1 X217.986 Y112.36 E.77269
G1 X217.986 Y110.855 E.04993
G1 X201.514 Y127.326 E.77269
G1 X201.514 Y124.674 E.08798
G1 X217.986 Y141.145 E.77269
G1 X217.986 Y139.64 E.04993
G1 X201.514 Y156.111 E.77269
G1 X201.514 Y153.459 E.08798
G1 X217.986 Y169.93 E.77269
G1 X217.986 Y168.425 E.04993
G1 X201.514 Y184.896 E.77269
G1 X201.514 Y182.244 E.08798
G1 X217.986 Y198.715 E.77269
G1 X217.986 Y197.21 E.04993
G1 X208.735 Y206.46 E.43396
G2 X208.528 Y206.528 I.235 J1.068 E.00724
G1 X201.514 Y199.514 E.32901
G1 X201.514 Y201.143 E.05401
; WIPE_START
G1 X201.514 Y199.514 E-.61876
G1 X201.777 Y199.777 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X194.517 Y197.422 Z2.2 F30000
G1 X54.486 Y151.982 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F16200
G1 X54.486 Y150.354 E.05401
G1 X38.014 Y133.883 E.77269
G1 X38.014 Y135.388 E.04993
G1 X44.374 Y129.029 E.29832
G2 X44.97 Y129.324 I1.916 J-3.116 E.0221
G1 X54.486 Y138.84 E.4464
G1 X54.486 Y136.188 E.08798
G1 X38.014 Y152.659 E.77269
G1 X38.014 Y151.154 E.04993
G1 X54.486 Y167.625 E.77269
G1 X54.486 Y164.973 E.08798
G1 X38.014 Y181.444 E.77269
G1 X38.014 Y179.939 E.04993
G1 X54.486 Y196.41 E.77269
G1 X54.486 Y193.757 E.08798
G1 X38.014 Y210.229 E.77269
G1 X38.014 Y208.723 E.04993
G1 X47.403 Y218.111 E.44041
G1 X63.874 Y201.639 E.77269
G1 X65.472 Y201.639 E.053
G1 X81.943 Y218.111 E.77269
G1 X98.416 Y201.639 E.77273
G1 X100.014 Y201.639 E.053
G1 X116.485 Y218.111 E.77269
G1 X124.447 Y210.15 E.37349
G3 X124.566 Y208.921 I3.63 J-.269 E.04116
G1 X117.285 Y201.639 E.34159
G1 X115.687 Y201.639 E.053
G1 X99.214 Y218.111 E.77274
G1 X82.743 Y201.639 E.77269
G1 X81.145 Y201.639 E.053
G1 X64.672 Y218.111 E.77273
G1 X38.014 Y191.453 E1.25058
G1 X38.014 Y192.958 E.04993
G1 X54.486 Y176.487 E.77269
G1 X54.486 Y179.139 E.08798
G1 X38.014 Y162.668 E.77269
G1 X38.014 Y164.173 E.04993
G1 X54.486 Y147.702 E.77269
G1 X54.486 Y146.073 E.05401
G1 X54.486 Y50.857 F30000
G1 F16200
G1 X54.486 Y52.486 E.05401
G1 X47.472 Y45.472 E.32901
G1 X47.262 Y45.543 E.00736
G1 X38.014 Y54.79 E.43382
G1 X38.014 Y53.285 E.04993
G1 X54.486 Y69.756 E.77269
G1 X54.486 Y67.104 E.08798
G1 X38.014 Y83.575 E.77269
G1 X38.014 Y82.07 E.04993
G1 X54.486 Y98.541 E.77269
G1 X54.486 Y95.889 E.08798
G1 X38.014 Y112.36 E.77269
G1 X38.014 Y110.855 E.04993
G1 X54.486 Y127.326 E.77269
G1 X54.486 Y124.674 E.08798
G1 X38.014 Y141.145 E.77269
G1 X38.014 Y139.64 E.04993
G1 X54.486 Y156.111 E.77269
G1 X54.486 Y153.459 E.08798
G1 X38.014 Y169.93 E.77269
G1 X38.014 Y168.425 E.04993
G1 X54.486 Y184.896 E.77269
G1 X54.486 Y182.244 E.08798
G1 X38.014 Y198.715 E.77269
G1 X38.014 Y197.21 E.04993
G1 X47.262 Y206.457 E.43382
G1 X47.472 Y206.528 E.00735
G1 X54.486 Y199.514 E.32901
G1 X54.486 Y201.639 E.07049
G1 X58.117 Y201.639 E.12048
G1 X49.813 Y209.944 E.38957
G2 X49.668 Y208.863 I-5.77 J.224 E.03621
G1 X58.917 Y218.111 E.43385
G1 X75.388 Y201.639 E.77269
G1 X76.986 Y201.639 E.053
G1 X93.459 Y218.111 E.77273
G1 X109.93 Y201.639 E.77269
G1 X111.528 Y201.639 E.053
G1 X128.001 Y218.111 E.77273
G1 X144.472 Y201.639 E.77269
G1 X146.07 Y201.639 E.053
G1 X162.543 Y218.111 E.77274
G1 X179.014 Y201.639 E.77269
G1 X180.612 Y201.639 E.053
G1 X197.083 Y218.111 E.77269
G1 X206.335 Y208.86 E.43402
G2 X206.188 Y209.945 I5.126 J1.249 E.03639
G1 X197.882 Y201.639 E.38962
G1 X196.285 Y201.639 E.053
G1 X179.812 Y218.111 E.77274
G1 X163.341 Y201.639 E.77269
G1 X161.743 Y201.639 E.053
G1 X145.27 Y218.111 E.77274
G1 X128.799 Y201.639 E.77269
G1 X127.201 Y201.639 E.053
G1 X110.728 Y218.111 E.77273
G1 X94.257 Y201.639 E.77269
G1 X92.659 Y201.639 E.053
G1 X76.186 Y218.111 E.77273
G1 X59.715 Y201.639 E.77269
G1 X61.344 Y201.639 E.05401
; WIPE_START
G1 X59.715 Y201.639 E-.61876
G1 X59.978 Y201.902 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X61.473 Y194.418 Z2.2 F30000
G1 X91.536 Y43.871 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F16200
G1 X90.384 Y42.719 E.05401
G1 X82.743 Y50.361 E.35847
G1 X81.145 Y50.361 E.053
G1 X64.672 Y33.889 E.77274
G1 X38.014 Y60.547 E1.25058
G1 X38.014 Y59.042 E.04993
G1 X54.486 Y75.513 E.77269
G1 X54.486 Y72.861 E.08798
G1 X38.014 Y89.332 E.77269
G1 X38.014 Y87.827 E.04993
G1 X54.486 Y104.298 E.77269
G1 X54.486 Y101.646 E.08798
G1 X38.014 Y118.117 E.77269
G1 X38.014 Y116.612 E.04993
G1 X44.374 Y122.971 E.29833
G3 X44.97 Y122.676 I1.914 J3.111 E.0221
G1 X54.486 Y113.16 E.4464
G1 X54.486 Y115.812 E.08798
G1 X38.014 Y99.341 E.77269
G1 X38.014 Y100.846 E.04993
G1 X54.486 Y84.375 E.77269
G1 X54.486 Y87.027 E.08798
G1 X38.014 Y70.556 E.77269
G1 X38.014 Y72.061 E.04993
G1 X54.486 Y55.59 E.77269
G1 X54.486 Y58.242 E.08798
G1 X38.014 Y41.771 E.77269
G1 X38.014 Y43.277 E.04993
G1 X47.403 Y33.889 E.44041
G1 X63.874 Y50.361 E.77269
G1 X65.472 Y50.361 E.053
G1 X81.943 Y33.889 E.77269
G1 X87.274 Y39.219 E.25004
G1 X87.079 Y39.414 E.00916
G1 X87.506 Y39.841 E.02003
G1 X76.986 Y50.361 E.4935
G1 X75.388 Y50.361 E.053
G1 X58.917 Y33.889 E.77269
G1 X49.668 Y43.137 E.43385
G2 X49.813 Y42.056 I-5.626 J-1.305 E.03621
G1 X58.117 Y50.361 E.38957
G1 X59.715 Y50.361 E.053
G1 X76.188 Y33.889 E.77274
G1 X92.659 Y50.361 E.77269
G1 X94.257 Y50.361 E.053
G1 X98.838 Y45.78 E.2149
G1 X99.265 Y46.206 E.02003
G1 X99.642 Y45.829 E.01769
G1 X104.173 Y50.361 E.21257
G1 X105.771 Y50.361 E.053
G1 X122.242 Y33.889 E.77269
G1 X127.047 Y38.693 E.22537
G3 X128.956 Y38.689 I.961 J3.682 E.06401
G1 X133.758 Y33.889 E.22522
G1 X150.229 Y50.361 E.77269
G1 X151.827 Y50.361 E.053
G1 X168.298 Y33.889 E.77269
G1 X184.771 Y50.361 E.77273
G1 X186.369 Y50.361 E.053
G1 X202.84 Y33.889 E.77269
G1 X207.981 Y39.029 E.24114
G3 X209.673 Y38.57 I1.739 J3.063 E.05878
G1 X214.354 Y33.889 E.21957
G1 X217.986 Y37.52 E.17034
G1 X217.986 Y36.014 E.04993
G1 X213.096 Y40.904 E.22936
G3 X212.845 Y43.893 I-3.505 J1.21 E.10243
G1 X217.986 Y49.034 E.24117
G1 X217.986 Y47.528 E.04993
G1 X201.514 Y63.999 E.77269
G1 X201.514 Y61.347 E.08798
G1 X217.986 Y77.818 E.77269
G1 X217.986 Y76.313 E.04993
G1 X201.514 Y92.784 E.77269
G1 X201.514 Y90.132 E.08798
G1 X217.986 Y106.603 E.77269
G1 X217.986 Y105.098 E.04993
G1 X201.514 Y121.569 E.77269
G1 X201.514 Y118.917 E.08798
G1 X206.719 Y124.122 E.24417
G2 X206.719 Y127.878 I3.053 J1.878 E.13116
G1 X201.514 Y133.083 E.24417
G1 X201.514 Y130.431 E.08798
G1 X217.986 Y146.902 E.77269
G1 X217.986 Y145.397 E.04993
G1 X201.514 Y161.868 E.77269
G1 X201.514 Y159.216 E.08798
G1 X217.986 Y175.687 E.77269
G1 X217.986 Y174.182 E.04993
G1 X201.514 Y190.653 E.77269
G1 X201.514 Y188.001 E.08798
G1 X217.986 Y204.472 E.77269
G1 X217.986 Y202.966 E.04993
G1 X212.845 Y208.107 E.24117
G3 X213.096 Y211.096 I-3.253 J1.779 E.10243
G1 X217.986 Y215.986 E.22936
G1 X217.986 Y214.48 E.04993
G1 X214.354 Y218.111 E.17034
G1 X209.683 Y213.44 E.2191
G3 X207.981 Y212.971 I.242 J-4.203 E.05901
G1 X202.84 Y218.111 E.24114
G1 X186.369 Y201.639 E.77269
G1 X184.771 Y201.639 E.053
G1 X168.298 Y218.111 E.77274
G1 X151.827 Y201.639 E.77269
G1 X150.229 Y201.639 E.053
G1 X133.758 Y218.111 E.77269
G1 X128.956 Y213.311 E.22522
G3 X127.047 Y213.307 I-.948 J-3.907 E.06394
G1 X122.242 Y218.111 E.22537
G1 X105.771 Y201.639 E.77269
G1 X104.173 Y201.639 E.053
G1 X87.702 Y218.111 E.77269
G1 X71.229 Y201.639 E.77273
G1 X69.631 Y201.639 E.053
G1 X53.16 Y218.111 E.77269
G1 X48.016 Y212.968 E.24127
G3 X46.32 Y213.437 I-1.897 J-3.567 E.05884
G1 X41.646 Y218.111 E.21926
G1 X38.014 Y214.48 E.17034
G1 X38.014 Y215.986 E.04993
G1 X42.9 Y211.1 E.22921
G3 X43.156 Y208.108 I3.529 J-1.205 E.1025
G1 X38.014 Y202.966 E.2412
G1 X38.014 Y204.472 E.04993
G1 X54.486 Y188.001 E.77269
G1 X54.486 Y190.653 E.08798
G1 X38.014 Y174.182 E.77269
G1 X38.014 Y175.687 E.04993
G1 X54.486 Y159.216 E.77269
G1 X54.486 Y161.868 E.08798
G1 X38.014 Y145.397 E.77269
G1 X38.014 Y146.902 E.04993
G1 X54.486 Y130.431 E.77269
G1 X54.486 Y133.083 E.08798
G1 X49.278 Y127.876 E.24428
G2 X49.278 Y124.124 I-3.12 J-1.876 E.13075
G1 X54.486 Y118.917 E.24428
G1 X54.486 Y121.569 E.08798
G1 X38.014 Y105.098 E.77269
G1 X38.014 Y106.603 E.04993
G1 X54.486 Y90.132 E.77269
G1 X54.486 Y92.784 E.08798
G1 X38.014 Y76.313 E.77269
G1 X38.014 Y77.818 E.04993
G1 X54.486 Y61.347 E.77269
G1 X54.486 Y63.999 E.08798
G1 X38.014 Y47.528 E.77269
G1 X38.014 Y49.034 E.04993
G1 X43.156 Y43.892 E.2412
G3 X42.9 Y40.9 I3.273 J-1.786 E.1025
G1 X38.014 Y36.014 E.22921
G1 X38.014 Y37.52 E.04993
G1 X41.646 Y33.889 E.17034
G1 X46.326 Y38.569 E.21952
G3 X48.016 Y39.032 I-.167 J3.931 E.05864
G1 X53.16 Y33.889 E.24127
G1 X69.631 Y50.361 E.77269
G1 X71.229 Y50.361 E.053
G1 X87.7 Y33.889 E.77269
G1 X90.153 Y36.34 E.11501
G1 X91.304 Y35.189 E.05401
G1 X94.138 Y33.904 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F12000
G1 X92.555 Y33.904 E.04385
G1 X99.875 Y33.904 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X97.01 Y33.904 E.07937
; Slow Down End
G1 X99.708 Y39.687 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.41126
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X96.439 Y36.417 E.25025
G1 X96.112 Y36.744 E.02496
G1 X99.239 Y39.87 E.23929
G1 X98.912 Y40.196 E.02496
G1 X95.786 Y37.07 E.23929
G1 X95.488 Y37.368 E.02283
G1 X92.609 Y34.49 E.22032
G1 X92.582 Y34.517 E.00213
G1 X98.586 Y40.522 E.45961
G1 X98.296 Y40.812 E.02222
G1 X101.174 Y43.691 E.22032
G1 X101.139 Y43.727 E.00274
G1 X92.255 Y34.844 E.67994
G1 X91.929 Y35.17 E.02496
G1 X100.812 Y44.053 E.67994
G1 X100.486 Y44.379 E.02496
G1 X91.603 Y35.496 E.67994
G1 X91.277 Y35.822 E.02496
G1 X100.16 Y44.705 E.67994
G1 X99.834 Y45.031 E.02496
G1 X90.951 Y36.148 E.67994
G1 X90.625 Y36.474 E.02496
G1 X99.508 Y45.358 E.67994
G1 X99.265 Y45.6 E.01859
G1 X96.512 Y42.847 E.21073
G1 X96.345 Y42.847 E.00903
G1 X90.298 Y36.801 E.46282
G1 X89.972 Y37.127 E.02496
G1 X95.977 Y43.131 E.45961
G1 X95.651 Y43.458 E.02496
G1 X89.646 Y37.453 E.45961
G1 X89.32 Y37.779 E.02497
G1 X95.325 Y43.784 E.45961
G1 X94.999 Y44.11 E.02496
G1 X88.994 Y38.105 E.45961
G1 X88.668 Y38.431 E.02496
G1 X94.672 Y44.436 E.45961
G1 X94.346 Y44.762 E.02496
G1 X88.341 Y38.758 E.45961
G1 X88.015 Y39.084 E.02496
G1 X94.02 Y45.088 E.45961
G1 X93.694 Y45.415 E.02496
G1 X87.546 Y39.267 E.47057
G1 X100.202 Y42.113 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F16200
G1 X101.354 Y43.264 E.05401
G1 X110.73 Y33.889 E.43983
G1 X127.201 Y50.361 E.77269
G1 X128.799 Y50.361 E.053
G1 X145.272 Y33.889 E.77273
G1 X161.743 Y50.361 E.77269
G1 X163.341 Y50.361 E.053
G1 X179.814 Y33.889 E.77273
G1 X196.285 Y50.361 E.77269
G1 X197.883 Y50.361 E.053
G1 X206.188 Y42.055 E.38962
G2 X206.335 Y43.14 I5.273 J-.164 E.03639
G1 X197.083 Y33.889 E.43402
G1 X180.612 Y50.361 E.77269
G1 X179.014 Y50.361 E.053
G1 X162.541 Y33.889 E.77273
G1 X146.07 Y50.361 E.77269
G1 X144.472 Y50.361 E.053
G1 X127.999 Y33.889 E.77273
G1 X111.528 Y50.361 E.77269
G1 X109.93 Y50.361 E.053
G1 X99.642 Y40.072 E.48264
G1 X100.175 Y39.54 E.02499
G1 X99.748 Y39.113 E.02003
G1 X104.973 Y33.889 E.24508
G1 X121.444 Y50.361 E.77269
G1 X123.042 Y50.361 E.053
G1 X127.726 Y45.677 E.21973
G2 X128.278 Y45.68 I.308 J-4.821 E.01832
G1 X132.958 Y50.361 E.21956
G1 X134.556 Y50.361 E.053
G1 X151.029 Y33.889 E.77273
G1 X167.5 Y50.361 E.77269
G1 X169.098 Y50.361 E.053
G1 X185.571 Y33.889 E.77273
G1 X217.986 Y66.304 E1.52065
G1 X217.986 Y64.799 E.04993
G1 X201.514 Y81.27 E.77269
G1 X201.514 Y78.618 E.08798
G1 X217.986 Y95.089 E.77269
G1 X217.986 Y93.584 E.04993
G1 X201.514 Y110.055 E.77269
G1 X201.514 Y107.403 E.08798
G1 X217.986 Y123.874 E.77269
M73 P55 R26
G1 X217.986 Y122.369 E.04993
G1 X213.075 Y127.279 E.23035
G2 X213.075 Y124.721 I-3.546 J-1.279 E.08659
G1 X217.986 Y129.631 E.23035
G1 X217.986 Y128.126 E.04993
G1 X201.514 Y144.597 E.77269
G1 X201.514 Y141.945 E.08798
G1 X217.986 Y158.416 E.77269
G1 X217.986 Y156.911 E.04993
G1 X201.514 Y173.382 E.77269
G1 X201.514 Y170.73 E.08798
G1 X217.986 Y187.201 E.77269
G1 X217.986 Y185.696 E.04993
G1 X185.571 Y218.111 E1.52065
G1 X169.098 Y201.639 E.77273
G1 X167.5 Y201.639 E.053
G1 X151.029 Y218.111 E.77269
G1 X134.556 Y201.639 E.77273
G1 X132.958 Y201.639 E.053
G1 X128.278 Y206.32 E.21956
G2 X127.726 Y206.324 I-.159 J15.656 E.0183
G1 X123.042 Y201.639 E.21975
G1 X121.444 Y201.639 E.053
G1 X104.971 Y218.111 E.77273
G1 X88.5 Y201.639 E.77269
G1 X86.902 Y201.639 E.053
G1 X70.429 Y218.111 E.77273
G1 X38.014 Y185.696 E1.52065
G1 X38.014 Y187.201 E.04993
G1 X54.486 Y170.73 E.77269
G1 X54.486 Y173.382 E.08798
G1 X38.014 Y156.911 E.77269
G1 X38.014 Y158.416 E.04993
G1 X54.486 Y141.945 E.77269
G1 X54.486 Y144.597 E.08798
G1 X38.014 Y128.126 E.77269
G1 X38.014 Y129.631 E.04993
G1 X42.923 Y124.723 E.23025
G2 X42.923 Y127.277 I3.356 J1.277 E.08662
G1 X38.014 Y122.369 E.23025
G1 X38.014 Y123.874 E.04993
G1 X54.486 Y107.403 E.77269
G1 X54.486 Y110.055 E.08798
G1 X38.014 Y93.584 E.77269
G1 X38.014 Y95.089 E.04993
G1 X54.486 Y78.618 E.77269
G1 X54.486 Y81.27 E.08798
G1 X38.014 Y64.799 E.77269
G1 X38.014 Y66.304 E.04993
G1 X70.429 Y33.889 E1.52065
G1 X86.902 Y50.361 E.77273
G1 X88.5 Y50.361 E.053
G1 X93.263 Y45.598 E.22343
G1 X93.69 Y46.025 E.02003
G1 X93.885 Y45.829 E.00916
G1 X98.416 Y50.361 E.21257
G1 X100.014 Y50.361 E.053
G1 X116.485 Y33.889 E.77269
G1 X124.447 Y41.85 E.37349
G2 X124.566 Y43.079 I3.63 J.269 E.04116
G1 X117.285 Y50.361 E.34159
G1 X115.687 Y50.361 E.053
G1 X99.593 Y34.267 E.755
G1 X98.837 Y34.267 E.02508
G1 X96.869 Y36.234 E.09231
G1 X96.442 Y35.807 E.02003
G1 X95.91 Y36.34 E.02499
G1 X93.836 Y34.267 E.09727
G1 X93.08 Y34.267 E.02508
G1 X93.036 Y34.31 E.00206
G1 X94.188 Y35.462 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F16200
G1 X93.036 Y34.31 E-.61876
G1 X93.08 Y34.267 E-.02354
G1 X93.39 Y34.267 E-.11769
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/15
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
G17
G3 Z2.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 15
G1 X126.081 Y212.456
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F16213.044
G1 X125.876 Y212.281 E.00892
G3 X127.784 Y206.668 I2.133 J-2.406 E.25022
G3 X129.176 Y206.879 I.214 J3.284 E.04707
G3 X126.133 Y212.486 I-1.167 J2.996 E.36191
G1 X126.333 Y212.136 F30000
G1 F16213.044
G1 X126.145 Y211.976 E.00815
G3 X127.814 Y207.074 I1.865 J-2.1 E.21856
G3 X128.761 Y207.17 I.204 J2.722 E.03174
G3 X126.384 Y212.166 I-.751 J2.706 E.32499
G1 X126.604 Y211.816 F30000
G1 F16213.044
G1 X126.414 Y211.672 E.00792
G3 X127.844 Y207.48 I1.594 J-1.796 E.18698
G3 X128.651 Y207.562 I.057 J3.452 E.02695
G3 X126.801 Y211.952 I-.642 J2.314 E.27065
G1 X126.654 Y211.85 E.00593
G1 X126.745 Y211.435 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X126.533 Y211.236 E.00894
G3 X127.874 Y207.871 I1.477 J-1.361 E.13871
G3 X128.349 Y207.895 I.128 J2.171 E.01465
G3 X126.831 Y211.501 I-.339 J1.98 E.22214
G1 X126.793 Y211.472 E.00148
; WIPE_START
M204 S10000
G1 X126.533 Y211.236 E-.13322
G1 X126.285 Y210.923 E-.15184
G1 X126.189 Y210.747 E-.07612
G1 X126.052 Y210.371 E-.15209
G1 X125.992 Y209.975 E-.15216
G1 X126.005 Y209.727 E-.09456
; WIPE_END
G1 E-.04 F1800
G1 X118.375 Y209.534 Z2.4 F30000
G1 X43.928 Y207.65 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X44.127 Y207.469 E.00892
G3 X46.034 Y206.668 I2.132 J2.406 E.06984
G3 X47.426 Y206.879 I.214 J3.283 E.04707
G3 X43.893 Y207.699 I-1.167 J2.996 E.54229
G1 X44.214 Y207.94 F30000
G1 F16213.044
G1 X44.396 Y207.775 E.00815
G3 X46.064 Y207.074 I1.863 J2.101 E.06108
G3 X47.011 Y207.17 I.204 J2.722 E.03174
G3 X44.18 Y207.988 I-.751 J2.706 E.48249
G1 X44.514 Y208.218 F30000
G1 F16213.044
G1 X44.851 Y207.93 E.01474
G3 X46.094 Y207.48 I1.407 J1.946 E.04442
G3 X46.901 Y207.562 I.057 J3.452 E.02695
G3 X44.477 Y208.266 I-.642 J2.314 E.41235
G1 X44.758 Y208.532 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X44.783 Y208.514 E.00095
G3 X46.124 Y207.871 I1.477 J1.361 E.0468
G3 X46.599 Y207.895 I.128 J2.171 E.01465
G3 X44.543 Y208.832 I-.339 J1.98 E.31406
G1 X44.723 Y208.581 E.00949
; WIPE_START
M204 S10000
G1 X44.783 Y208.514 E-.03416
G1 X45.077 Y208.243 E-.1518
G1 X45.423 Y208.043 E-.15214
G1 X45.803 Y207.915 E-.1521
G1 X46.124 Y207.871 E-.12318
G1 X46.4 Y207.87 E-.10503
G1 X46.509 Y207.884 E-.04159
; WIPE_END
G1 E-.04 F1800
G1 X46.766 Y200.256 Z2.4 F30000
G1 X49.307 Y125.003 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X49.33 Y125.05 E.00173
G3 X46.033 Y122.793 I-3.071 J.95 E.5271
G3 X47.426 Y123.004 I.214 J3.284 E.04707
G3 X49.22 Y124.748 I-1.167 J2.996 E.08525
G1 X49.288 Y124.946 E.00695
G1 X48.924 Y125.14 F30000
G1 F16213.044
G1 X48.943 Y125.17 E.00117
G3 X46.064 Y123.199 I-2.683 J.831 E.46054
G3 X47.011 Y123.295 I.204 J2.723 E.03174
G3 X48.846 Y124.906 I-.751 J2.706 E.0838
G1 X48.905 Y125.083 E.00619
G1 X48.535 Y125.295 F30000
G1 F16213.044
G1 X48.612 Y125.522 E.00796
G3 X46.094 Y123.605 I-2.353 J.478 E.38591
G3 X46.901 Y123.687 I.057 J3.453 E.02695
G3 X48.47 Y125.064 I-.642 J2.314 E.07164
G1 X48.518 Y125.238 E.00597
G1 X48.216 Y125.631 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X48.258 Y125.799 E.00533
G3 X46.124 Y123.996 I-1.998 J.201 E.29283
G3 X46.599 Y124.02 I.128 J2.17 E.01465
G3 X48.178 Y125.405 I-.339 J1.98 E.06792
G1 X48.206 Y125.571 E.00518
; WIPE_START
M204 S10000
G1 X48.258 Y125.799 E-.08871
G1 X48.25 Y126.2 E-.15248
G1 X48.171 Y126.593 E-.15211
G1 X48.015 Y126.961 E-.15214
G1 X47.79 Y127.292 E-.1521
G1 X47.672 Y127.407 E-.06246
; WIPE_END
G1 E-.04 F1800
G1 X54.549 Y130.717 Z2.4 F30000
G1 X201.166 Y201.291 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X54.834 Y201.291 E4.85411
G1 X54.834 Y50.709 E4.99509
G1 X201.166 Y50.709 E4.85411
G1 X201.166 Y201.231 E4.9931
G1 X200.759 Y200.884 F30000
G1 F16213.044
G1 X55.241 Y200.884 E4.82711
G1 X55.241 Y51.116 E4.96809
G1 X200.759 Y51.116 E4.82711
G1 X200.759 Y200.824 E4.9661
G1 X200.352 Y200.477 F30000
G1 F16213.044
G1 X55.648 Y200.477 E4.8001
G1 X55.648 Y51.523 E4.94108
G1 X200.352 Y51.523 E4.8001
G1 X200.352 Y200.417 E4.93909
G1 X199.96 Y200.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X56.04 Y200.085 E4.42226
G1 X56.04 Y51.915 E4.55285
G1 X199.96 Y51.915 E4.42226
G1 X199.96 Y200.025 E4.55101
; WIPE_START
M204 S10000
G1 X197.96 Y200.026 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X192.696 Y194.499 Z2.4 F30000
G1 X44.823 Y39.245 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X44.929 Y39.198 E.00387
G3 X46.033 Y38.918 I1.33 J2.927 E.03799
G3 X47.426 Y39.129 I.214 J3.284 E.04707
G3 X44.645 Y39.345 I-1.167 J2.996 E.57441
G1 X44.77 Y39.274 E.00477
G1 X45.309 Y39.479 F30000
G1 F16213.044
G1 X45.357 Y39.467 E.00165
G3 X46.064 Y39.324 I.903 J2.659 E.024
G3 X47.011 Y39.42 I.204 J2.723 E.03174
G3 X45.097 Y39.569 I-.751 J2.706 E.52039
G1 X45.254 Y39.503 E.00565
G1 X45.801 Y39.771 F30000
G1 F16213.044
G1 X46.094 Y39.73 E.00982
G3 X46.901 Y39.812 I.057 J3.454 E.02695
G3 X45.716 Y39.786 I-.642 J2.314 E.46079
M73 P55 R25
G1 X45.742 Y39.782 E.00088
G1 X46.083 Y40.127 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X46.124 Y40.121 E.00127
G3 X46.599 Y40.145 I.128 J2.17 E.01465
G3 X45.804 Y40.169 I-.339 J1.98 E.36316
G1 X46.024 Y40.136 E.00684
; WIPE_START
M204 S10000
G1 X46.124 Y40.121 E-.03846
G1 X46.4 Y40.12 E-.10503
G1 X46.599 Y40.145 E-.07619
G1 X46.794 Y40.19 E-.07613
G1 X47.167 Y40.336 E-.15211
G1 X47.503 Y40.553 E-.15209
G1 X47.79 Y40.833 E-.15216
G1 X47.802 Y40.85 E-.00783
; WIPE_END
G1 E-.04 F1800
G1 X55.432 Y40.694 Z2.4 F30000
G1 X126.571 Y39.246 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X126.679 Y39.198 E.00391
G3 X127.783 Y38.918 I1.33 J2.927 E.03799
G3 X129.176 Y39.129 I.214 J3.284 E.04707
G3 X126.395 Y39.345 I-1.167 J2.996 E.57442
G1 X126.519 Y39.275 E.00472
G1 X127.057 Y39.48 F30000
G1 F16213.044
G1 X127.107 Y39.467 E.00169
G3 X127.814 Y39.324 I.903 J2.659 E.024
G3 X128.761 Y39.42 I.204 J2.723 E.03174
G3 X126.847 Y39.569 I-.751 J2.706 E.52039
G1 X127.002 Y39.503 E.00561
G1 X127.55 Y39.771 F30000
G1 F16213.044
G1 X127.844 Y39.73 E.00987
G3 X128.651 Y39.812 I.057 J3.454 E.02695
G3 X127.466 Y39.786 I-.642 J2.314 E.46079
G1 X127.491 Y39.782 E.00083
G1 X127.877 Y40.121 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X128.15 Y40.122 E.00838
G3 X128.349 Y40.145 I-.149 J2.169 E.00616
G3 X127.818 Y40.126 I-.339 J1.98 E.37139
; WIPE_START
M204 S10000
G1 X128.15 Y40.122 E-.12633
G1 X128.349 Y40.145 E-.07615
G1 X128.734 Y40.254 E-.15211
G1 X129.091 Y40.436 E-.15215
G1 X129.404 Y40.686 E-.15207
G1 X129.575 Y40.89 E-.10117
; WIPE_END
G1 E-.04 F1800
G1 X137.206 Y40.731 Z2.4 F30000
G1 X208.322 Y39.246 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X208.429 Y39.198 E.0039
G3 X209.533 Y38.918 I1.33 J2.927 E.03799
G3 X210.926 Y39.13 I.214 J3.284 E.04708
G3 X208.145 Y39.345 I-1.167 J2.996 E.57441
G1 X208.269 Y39.275 E.00473
G1 X208.808 Y39.48 F30000
G1 F16213.044
G1 X208.857 Y39.467 E.00169
G3 X209.564 Y39.324 I.903 J2.659 E.024
G3 X210.511 Y39.42 I.204 J2.723 E.03174
G3 X208.597 Y39.569 I-.751 J2.706 E.52039
G1 X208.752 Y39.503 E.00561
G1 X209.3 Y39.771 F30000
G1 F16213.044
G1 X209.594 Y39.73 E.00986
G3 X210.401 Y39.812 I.057 J3.454 E.02695
G3 X209.216 Y39.786 I-.642 J2.314 E.46079
G1 X209.241 Y39.782 E.00083
G1 X209.627 Y40.121 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.9 Y40.122 E.00839
G3 X210.099 Y40.145 I-.149 J2.169 E.00616
G3 X209.567 Y40.126 I-.339 J1.98 E.37138
; WIPE_START
M204 S10000
G1 X209.9 Y40.122 E-.12645
G1 X210.099 Y40.145 E-.07614
G1 X210.484 Y40.254 E-.15212
G1 X210.841 Y40.436 E-.15212
G1 X211.154 Y40.686 E-.1521
G1 X211.325 Y40.89 E-.10107
; WIPE_END
G1 E-.04 F1800
G1 X211.274 Y48.522 Z2.4 F30000
G1 X210.784 Y122.957 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X210.926 Y123.004 E.00497
G3 X209.533 Y122.793 I-1.167 J2.996 E.62302
G3 X210.621 Y122.904 I.214 J3.284 E.03643
G1 X210.726 Y122.938 E.00368
G1 X210.337 Y123.255 F30000
G1 F16213.044
G1 X210.511 Y123.295 E.00591
G3 X209.564 Y123.199 I-.751 J2.706 E.55367
G3 X210.238 Y123.232 I.204 J2.723 E.02244
G1 X210.279 Y123.242 E.00139
G1 X209.897 Y123.604 F30000
G1 F16213.044
G1 X209.929 Y123.616 E.00111
G3 X210.401 Y123.687 I-.277 J3.443 E.01585
G3 X209.594 Y123.605 I-.642 J2.314 E.47349
G1 X209.837 Y123.604 E.00805
G1 X209.627 Y123.996 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.9 Y123.997 E.00839
G3 X210.099 Y124.02 I-.149 J2.169 E.00616
G3 X209.567 Y124.001 I-.339 J1.98 E.37138
; WIPE_START
M204 S10000
G1 X209.9 Y123.997 E-.12647
G1 X210.099 Y124.02 E-.07614
G1 X210.484 Y124.129 E-.15212
G1 X210.841 Y124.311 E-.15212
G1 X211.154 Y124.561 E-.1521
G1 X211.325 Y124.765 E-.10105
; WIPE_END
G1 E-.04 F1800
G1 X211.046 Y132.392 Z2.4 F30000
G1 X208.321 Y206.996 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X208.429 Y206.948 E.00392
G3 X209.534 Y206.668 I1.33 J2.927 E.03799
G3 X210.926 Y206.879 I.214 J3.283 E.04707
G3 X208.145 Y207.095 I-1.167 J2.996 E.5744
G1 X208.269 Y207.025 E.00472
G1 X208.807 Y207.23 F30000
G1 F16213.044
G1 X208.857 Y207.217 E.0017
G3 X209.564 Y207.074 I.903 J2.659 E.024
G3 X210.511 Y207.17 I.204 J2.722 E.03174
G3 X208.597 Y207.319 I-.751 J2.706 E.52039
G1 X208.752 Y207.253 E.0056
G1 X209.3 Y207.521 F30000
G1 F16213.044
G1 X209.594 Y207.48 E.00988
G3 X210.401 Y207.562 I.057 J3.452 E.02695
G3 X209.216 Y207.537 I-.642 J2.314 E.46079
G1 X209.241 Y207.532 E.00082
G1 X209.621 Y207.871 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.624 Y207.871 E.00008
G3 X210.099 Y207.895 I.128 J2.171 E.01465
G3 X209.304 Y207.919 I-.339 J1.98 E.36316
G1 X209.562 Y207.88 E.00802
; WIPE_START
M204 S10000
G1 X209.624 Y207.871 E-.02382
G1 X209.9 Y207.87 E-.10503
G1 X210.099 Y207.895 E-.07617
G1 X210.484 Y208.004 E-.15214
G1 X210.841 Y208.186 E-.15207
G1 X211.154 Y208.436 E-.15213
G1 X211.32 Y208.635 E-.09864
; WIPE_END
G1 E-.04 F1800
G1 X215.755 Y214.847 Z2.4 F30000
G1 X218.334 Y218.459 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X37.666 Y218.459 E5.99308
G1 X37.666 Y33.541 E6.13406
G1 X218.334 Y33.541 E5.99308
G1 X218.334 Y218.399 E6.13207
G1 X218.741 Y218.866 F30000
G1 F16213.044
G1 X37.259 Y218.866 E6.02008
G1 X37.259 Y33.134 E6.16106
G1 X218.741 Y33.134 E6.02008
G1 X218.741 Y218.806 E6.15907
G1 X219.148 Y219.273 F30000
G1 F16213.044
G1 X36.852 Y219.273 E6.04709
G1 X36.852 Y32.727 E6.18807
G1 X219.148 Y32.727 E6.04709
G1 X219.148 Y219.213 E6.18608
G1 X219.54 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X36.46 Y219.665 E5.62554
G1 X36.46 Y32.335 E5.75613
G1 X219.54 Y32.335 E5.62554
G1 X219.54 Y219.605 E5.75429
; WIPE_START
M204 S10000
G1 X217.54 Y219.606 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X214.59 Y212.566 Z2.4 F30000
G1 X213.313 Y209.518 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F12000
G1 X213.175 Y208.835 E.01931
G1 X212.901 Y208.177 E.01975
G1 X212.502 Y207.586 E.01975
G1 X211.994 Y207.086 E.01975
G1 X211.397 Y206.697 E.01974
G1 X210.735 Y206.433 E.01975
G1 X210.03 Y206.306 E.01983
G2 X208.97 Y206.381 I-.26 J3.875 E.02953
G1 X208.292 Y206.606 E.0198
G1 X207.673 Y206.959 E.01974
G1 X207.137 Y207.429 E.01976
G1 X206.704 Y207.995 E.01974
G1 X206.392 Y208.636 E.01975
G1 X206.213 Y209.326 E.01975
G1 X206.174 Y210.038 E.01975
G1 X206.277 Y210.743 E.01975
G1 X206.518 Y211.414 E.01975
G1 X206.887 Y212.024 E.01975
G1 X207.369 Y212.548 E.01975
G1 X207.946 Y212.967 E.01975
G1 X208.595 Y213.263 E.01975
G1 X209.289 Y213.425 E.01975
G1 X210.002 Y213.446 E.01974
G1 X210.704 Y213.325 E.01975
G1 X211.369 Y213.067 E.01976
G1 X211.97 Y212.683 E.01975
G1 X212.482 Y212.188 E.01974
G1 X212.886 Y211.601 E.01974
G1 X213.166 Y210.945 E.01976
G1 X213.31 Y210.247 E.01974
G1 X213.313 Y209.578 E.01853
; WIPE_START
G1 X213.31 Y210.247 E-.25412
G1 X213.166 Y210.945 E-.27079
G1 X212.923 Y211.514 E-.23509
; WIPE_END
G1 E-.04 F1800
G1 X208.04 Y205.648 Z2.4 F30000
G1 X201.892 Y198.263 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M73 P56 R25
G1 X201.892 Y199.892 E.05401
G1 X208.237 Y206.237 E.29767
G3 X209.215 Y205.98 I1.442 J3.502 E.03364
G1 X217.608 Y197.587 E.39375
G1 X217.608 Y198.337 E.0249
G1 X201.892 Y182.621 E.7373
G1 X201.892 Y184.519 E.06296
G1 X217.608 Y168.802 E.7373
G1 X217.608 Y169.553 E.0249
G1 X201.892 Y153.836 E.7373
G1 X201.892 Y155.734 E.06296
G1 X217.608 Y140.017 E.7373
G1 X217.608 Y140.768 E.0249
G1 X201.892 Y125.051 E.7373
G1 X201.892 Y126.949 E.06296
G1 X217.608 Y111.232 E.7373
G1 X217.608 Y111.983 E.0249
G1 X201.892 Y96.266 E.7373
G1 X201.892 Y98.164 E.06296
G1 X217.608 Y82.447 E.7373
G1 X217.608 Y83.198 E.0249
G1 X201.892 Y67.481 E.7373
G1 X201.892 Y69.379 E.06296
G1 X217.608 Y53.663 E.7373
G1 X217.608 Y54.413 E.0249
G1 X209.228 Y46.033 E.39313
G3 X208.237 Y45.763 I.598 J-4.149 E.03417
G1 X201.892 Y52.108 E.29767
G1 X201.892 Y53.737 E.05401
G1 X201.502 Y50.373 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.382948
G1 F12000
G1 X201.37 Y50.346 E.00373
G1 X54.63 Y50.346 E4.06585
G1 X54.498 Y50.373 E.00373
G1 X54.471 Y50.505 E.00373
G1 X54.471 Y201.495 E4.18361
G1 X54.498 Y201.627 E.00373
G1 X54.63 Y201.654 E.00373
G1 X201.37 Y201.654 E4.06585
G1 X201.502 Y201.627 E.00373
G1 X201.529 Y201.495 E.00373
G1 X201.529 Y50.505 E4.18361
G1 X201.514 Y50.432 E.00207
; WIPE_START
G1 X201.529 Y50.505 E-.02837
G1 X201.529 Y52.431 E-.73163
; WIPE_END
G1 E-.04 F1800
G1 X207.189 Y47.31 Z2.4 F30000
G1 X213.313 Y41.769 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.38292
G1 F12000
G1 X213.175 Y41.085 E.01932
G1 X212.901 Y40.427 E.01975
G1 X212.502 Y39.836 E.01975
G1 X211.994 Y39.336 E.01975
G1 X211.397 Y38.947 E.01976
G1 X210.735 Y38.683 E.01975
G1 X210.03 Y38.556 E.01983
G2 X208.971 Y38.631 I-.26 J3.873 E.02952
G1 X208.292 Y38.856 E.0198
G1 X207.673 Y39.209 E.01975
G1 X207.137 Y39.679 E.01975
G1 X206.704 Y40.245 E.01975
G1 X206.392 Y40.886 E.01975
G1 X206.213 Y41.576 E.01975
G1 X206.174 Y42.288 E.01975
G1 X206.277 Y42.993 E.01974
G1 X206.518 Y43.664 E.01975
G1 X206.887 Y44.274 E.01975
G1 X207.37 Y44.798 E.01975
G1 X207.947 Y45.217 E.01976
G1 X208.595 Y45.513 E.01974
G1 X209.289 Y45.675 E.01975
G1 X210.002 Y45.696 E.01975
G1 X210.704 Y45.575 E.01975
G1 X211.369 Y45.318 E.01975
G1 X211.97 Y44.933 E.01976
G1 X212.482 Y44.438 E.01974
G1 X212.886 Y43.851 E.01974
G1 X213.166 Y43.195 E.01976
G1 X213.31 Y42.497 E.01974
G1 X213.313 Y41.829 E.01853
; WIPE_START
G1 X213.31 Y42.497 E-.25411
G1 X213.166 Y43.195 E-.27079
G1 X212.923 Y43.764 E-.23511
; WIPE_END
G1 E-.04 F1800
G1 X205.333 Y44.565 Z2.4 F30000
G1 X153.98 Y49.983 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X155.609 Y49.983 E.05401
G1 X139.892 Y34.267 E.7373
G1 X139.136 Y34.267 E.02508
G1 X131.891 Y41.511 E.33985
G3 X131.735 Y43.381 I-4.509 J.565 E.06268
G1 X138.338 Y49.983 E.30975
G1 X140.69 Y49.983 E.07803
G1 X156.407 Y34.267 E.7373
G1 X157.163 Y34.267 E.02508
G1 X172.88 Y49.983 E.7373
G1 X175.232 Y49.983 E.07803
G1 X190.949 Y34.267 E.7373
G1 X191.705 Y34.267 E.02508
G1 X217.608 Y60.17 E1.21519
G1 X217.608 Y59.42 E.0249
G1 X201.892 Y75.136 E.7373
G1 X201.892 Y73.238 E.06296
G1 X217.608 Y88.955 E.7373
G1 X217.608 Y88.204 E.0249
G1 X201.892 Y103.921 E.7373
G1 X201.892 Y102.023 E.06296
G1 X217.608 Y117.74 E.7373
G1 X217.608 Y116.989 E.0249
G1 X211.902 Y122.695 E.26769
G2 X210.481 Y122.126 I-2.228 J3.504 E.05109
G1 X201.892 Y113.537 E.40292
G1 X201.892 Y115.435 E.06296
G1 X217.608 Y99.718 E.7373
G1 X217.608 Y100.469 E.0249
G1 X201.892 Y84.752 E.7373
G1 X201.892 Y86.65 E.06296
G1 X217.608 Y70.933 E.7373
G1 X217.608 Y71.684 E.0249
G1 X201.892 Y55.967 E.7373
G1 X201.892 Y57.865 E.06296
G1 X217.608 Y42.149 E.7373
G1 X217.608 Y42.899 E.0249
G1 X208.976 Y34.267 E.40498
G1 X208.219 Y34.267 E.02508
G1 X192.503 Y49.983 E.7373
G1 X190.151 Y49.983 E.07803
G1 X174.434 Y34.267 E.7373
G1 X173.678 Y34.267 E.02508
G1 X157.961 Y49.983 E.7373
G1 X159.589 Y49.983 E.05401
G1 X131.563 Y41.768 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F12000
G1 X131.425 Y41.085 E.01932
G1 X131.151 Y40.427 E.01976
G1 X130.752 Y39.836 E.01975
G1 X130.244 Y39.336 E.01976
G1 X129.647 Y38.947 E.01975
G1 X128.985 Y38.683 E.01975
G1 X128.28 Y38.556 E.01983
G2 X127.221 Y38.631 I-.26 J3.874 E.02952
G1 X126.542 Y38.856 E.0198
G1 X125.923 Y39.209 E.01975
G1 X125.387 Y39.679 E.01975
G1 X124.954 Y40.245 E.01975
G1 X124.642 Y40.886 E.01975
G1 X124.463 Y41.576 E.01975
G1 X124.424 Y42.288 E.01975
G1 X124.527 Y42.993 E.01975
G1 X124.768 Y43.664 E.01975
G1 X125.137 Y44.274 E.01975
G1 X125.619 Y44.798 E.01975
G1 X126.197 Y45.217 E.01976
G1 X126.845 Y45.513 E.01974
G1 X127.539 Y45.675 E.01974
G1 X128.252 Y45.696 E.01976
G1 X128.954 Y45.575 E.01975
G1 X129.619 Y45.318 E.01976
G1 X130.22 Y44.933 E.01975
G1 X130.732 Y44.438 E.01974
G1 X131.136 Y43.851 E.01974
G1 X131.416 Y43.195 E.01975
G1 X131.56 Y42.497 E.01975
G1 X131.563 Y41.828 E.01853
; WIPE_START
G1 X131.56 Y42.497 E-.25412
G1 X131.416 Y43.195 E-.27088
G1 X131.173 Y43.764 E-.23501
; WIPE_END
G1 E-.04 F1800
G1 X123.546 Y43.484 Z2.4 F30000
G1 X99.478 Y42.6 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.409
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X100.948 Y41.13 E.11123
G1 X100.623 Y40.806 E.02457
G1 X99.297 Y42.132 E.10039
G1 X98.972 Y41.807 E.02457
G1 X100.299 Y40.481 E.10039
G1 X99.974 Y40.157 E.02457
G1 X98.648 Y41.483 E.10039
G1 X98.323 Y41.158 E.02457
G1 X102.528 Y36.954 E.3183
G1 X102.203 Y36.629 E.02457
G1 X97.999 Y40.834 E.3183
G1 X97.978 Y40.812 E.0016
G1 X99.25 Y39.54 E.09635
G1 X98.947 Y39.236 E.02297
G1 X101.879 Y36.304 E.22194
G1 X101.554 Y35.98 E.02457
G1 X98.622 Y38.912 E.22194
G1 X98.298 Y38.587 E.02457
G1 X101.23 Y35.655 E.22194
G1 X100.905 Y35.331 E.02457
G1 X97.973 Y38.263 E.22194
G1 X97.649 Y37.938 E.02457
G1 X100.581 Y35.006 E.22194
G1 X100.256 Y34.682 E.02457
G1 X97.324 Y37.613 E.22195
G1 X97 Y37.289 E.02457
G1 X99.931 Y34.357 E.22194
G1 X99.775 Y34.201 E.01181
G1 X99.807 Y33.911 E.01563
G1 X99.728 Y33.911 E.00423
G1 X96.675 Y36.964 E.23115
G1 X96.442 Y36.732 E.0176
G1 X95.488 Y37.686 E.07226
G1 X95.396 Y37.594 E.00697
G1 X99.079 Y33.911 E.27884
G1 X98.43 Y33.911 E.03475
G1 X95.071 Y37.27 E.25428
G1 X94.747 Y36.945 E.02457
G1 X97.781 Y33.911 E.22971
G1 X97.132 Y33.911 E.03475
G1 X94.422 Y36.621 E.20514
G1 X94.098 Y36.296 E.02457
G1 X95.106 Y35.288 E.0763
G1 X94.781 Y34.964 E.02457
G1 X93.773 Y35.972 E.0763
G1 X93.587 Y35.785 E.0141
G1 X92.64 Y36.732 E.07165
G1 X92.502 Y36.594 E.01047
G1 X94.456 Y34.639 E.14795
G1 X94.132 Y34.315 E.02457
G1 X92.177 Y36.269 E.14795
G1 X91.853 Y35.944 E.02457
G1 X93.886 Y33.911 E.15394
G1 X93.237 Y33.911 E.03475
G1 X87.598 Y39.55 E.42693
G1 X87.34 Y39.588 E.01391
G1 X87.197 Y39.302 E.01712
G1 X92.791 Y33.708 E.42344
G1 X91.786 Y36.223 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42872
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X89.401 Y38.607 E.10603
G1 X89.402 Y39.152 E.01713
G1 X91.939 Y36.615 E.11279
G1 X92.212 Y36.888 E.01213
G1 X89.403 Y39.697 E.12488
G1 X89.41 Y40.235 E.01693
G1 X92.485 Y37.161 E.13669
G1 X92.64 Y37.317 E.00693
G1 X93.587 Y36.37 E.04208
G1 X93.704 Y36.487 E.0052
G1 X89.683 Y40.508 E.17877
G1 X89.956 Y40.781 E.01213
G1 X93.977 Y36.76 E.17877
G1 X94.249 Y37.033 E.01213
G1 X90.228 Y41.054 E.17877
G1 X90.501 Y41.327 E.01213
G1 X94.522 Y37.306 E.17877
G1 X94.795 Y37.578 E.01213
G1 X90.774 Y41.599 E.17877
G1 X91.047 Y41.872 E.01213
G1 X95.068 Y37.851 E.17877
G1 X95.341 Y38.124 E.01213
G1 X91.32 Y42.145 E.17877
G1 X91.592 Y42.418 E.01213
G1 X96.568 Y37.442 E.22121
G1 X96.841 Y37.715 E.01213
G1 X91.865 Y42.691 E.22121
G1 X92.138 Y42.963 E.01213
G1 X97.114 Y37.988 E.22121
G1 X97.386 Y38.261 E.01213
G1 X92.411 Y43.236 E.22121
G1 X92.684 Y43.509 E.01213
G1 X97.659 Y38.534 E.22121
G1 X97.932 Y38.806 E.01213
G1 X92.956 Y43.782 E.22121
G1 X93.151 Y43.976 E.00864
G1 X93.308 Y43.976 E.00493
G1 X98.205 Y39.079 E.21773
G1 X98.478 Y39.352 E.01213
G1 X93.862 Y43.968 E.20523
G1 X94.126 Y43.917 E.00847
G3 X94.492 Y43.883 I.221 J.377 E.01194
G1 X97.478 Y40.897 E.13272
G1 X97.75 Y41.17 E.01213
G1 X94.946 Y43.975 E.12468
G1 X95.491 Y43.975 E.01714
G1 X98.023 Y41.443 E.11257
G1 X98.296 Y41.716 E.01213
G1 X96.036 Y43.976 E.10046
G1 X96.582 Y43.976 E.01714
G1 X98.569 Y41.989 E.08835
G1 X98.842 Y42.262 E.01213
G1 X97.127 Y43.976 E.07624
G2 X97.662 Y43.968 I.184 J-5.341 E.01682
G1 X97.685 Y43.964 E.00076
G1 X99.114 Y42.534 E.06355
G1 X99.23 Y42.65 E.00515
G1 X99.137 Y42.895 E.00823
G1 X98.993 Y43.161 E.00952
G1 X98.806 Y43.388 E.00924
G1 X98.185 Y44.009 E.02763
G1 X92.528 Y45.006 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.409
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X93.062 Y44.472 E.04042
G1 X92.737 Y44.148 E.02457
G1 X92.347 Y44.538 E.02958
G1 X92.242 Y44.433 E.00795
G1 X89.363 Y47.312 E.21791
G1 X89.144 Y47.092 E.01662
G1 X92.413 Y43.823 E.24749
G1 X92.088 Y43.499 E.02457
G1 X88.819 Y46.768 E.24749
G1 X88.494 Y46.443 E.02457
G1 X91.764 Y43.174 E.24749
G1 X91.439 Y42.849 E.02457
G1 X88.17 Y46.119 E.24749
G1 X87.845 Y45.794 E.02457
G1 X91.114 Y42.525 E.24749
G1 X90.79 Y42.2 E.02457
G1 X87.521 Y45.47 E.24749
G1 X87.196 Y45.145 E.02457
G1 X90.465 Y41.876 E.24749
G1 X90.141 Y41.551 E.02457
G1 X86.872 Y44.82 E.24749
G1 X86.547 Y44.496 E.02457
G1 X89.816 Y41.227 E.24749
G1 X89.492 Y40.902 E.02457
G1 X86.222 Y44.171 E.24749
G1 X85.898 Y43.847 E.02457
G1 X89.167 Y40.578 E.24749
G1 X88.843 Y40.253 E.02457
G1 X88.281 Y40.814 E.0425
G1 X87.546 Y41.523 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F16200
G1 X88.019 Y41.049 E.0222
G1 X88.156 Y40.1 E.03182
G1 X87.983 Y39.928 E.00809
G1 X87.323 Y40.023 E.02212
G1 X77.363 Y49.983 E.46725
G1 X75.011 Y49.983 E.07803
G1 X59.294 Y34.267 E.7373
G1 X58.538 Y34.267 E.02508
G1 X50.155 Y42.65 E.39329
G2 X50.179 Y42.422 I-1.127 J-.238 E.00761
G1 X57.74 Y49.983 E.3547
G1 X60.092 Y49.983 E.07803
G1 X75.809 Y34.267 E.7373
G1 X76.565 Y34.267 E.02508
G1 X85.684 Y43.385 E.42775
G1 X85.257 Y43.812 E.02003
G1 X87.274 Y45.829 E.09466
G1 X83.12 Y49.983 E.19487
G1 X80.768 Y49.983 E.07803
G1 X65.051 Y34.267 E.7373
G1 X64.295 Y34.267 E.02508
G1 X38.392 Y60.17 E1.21519
G1 X38.392 Y59.419 E.0249
G1 X54.108 Y75.136 E.7373
G1 X54.108 Y73.238 E.06296
G1 X38.392 Y88.955 E.7373
G1 X38.392 Y88.204 E.0249
G1 X54.108 Y103.921 E.7373
G1 X54.108 Y102.023 E.06296
G1 X38.392 Y117.74 E.7373
G1 X38.392 Y116.989 E.0249
G1 X44.101 Y122.698 E.26783
G3 X45.512 Y122.133 I2.486 J4.163 E.05064
G1 X54.108 Y113.537 E.40327
G1 X54.108 Y115.435 E.06296
G1 X38.392 Y99.718 E.7373
G1 X38.392 Y100.469 E.0249
G1 X54.108 Y84.752 E.7373
G1 X54.108 Y86.65 E.06296
G1 X38.392 Y70.933 E.7373
G1 X38.392 Y71.684 E.0249
G1 X54.108 Y55.967 E.7373
G1 X54.108 Y57.865 E.06296
G1 X38.392 Y42.149 E.7373
G1 X38.392 Y42.899 E.0249
G1 X47.024 Y34.267 E.40498
G1 X47.781 Y34.267 E.02508
G1 X63.497 Y49.983 E.7373
G1 X65.849 Y49.983 E.07802
G1 X81.566 Y34.267 E.7373
G1 X82.322 Y34.267 E.02508
G1 X86.971 Y38.915 E.21808
G1 X89.849 Y36.037 E.13504
G1 X88.079 Y34.267 E.08304
G1 X87.323 Y34.267 E.02508
G1 X71.606 Y49.983 E.7373
G1 X69.254 Y49.983 E.07803
G1 X53.538 Y34.267 E.7373
G1 X52.781 Y34.267 E.02508
G1 X48.293 Y38.755 E.21058
G2 X45.954 Y38.197 I-2.125 J3.722 E.08084
G1 X42.024 Y34.267 E.18438
G1 X41.267 Y34.267 E.02508
G1 X38.392 Y37.142 E.13491
G1 X38.392 Y36.392 E.0249
G1 X42.612 Y40.612 E.19801
G2 X42.878 Y44.17 I3.798 J1.505 E.12246
G1 X38.392 Y48.656 E.21046
G1 X38.392 Y47.906 E.0249
G1 X54.108 Y63.622 E.7373
G1 X54.108 Y61.724 E.06295
G1 X38.392 Y77.441 E.7373
G1 X38.392 Y76.69 E.0249
G1 X54.108 Y92.407 E.7373
G1 X54.108 Y90.509 E.06296
G1 X38.392 Y106.226 E.7373
G1 X38.392 Y105.475 E.0249
G1 X54.108 Y121.192 E.7373
G1 X54.108 Y119.294 E.06296
G1 X49.553 Y123.85 E.21371
G3 X49.553 Y128.15 I-3.406 J2.15 E.15048
G1 X54.108 Y132.706 E.21371
G1 X54.108 Y130.808 E.06296
G1 X38.392 Y146.525 E.7373
G1 X38.392 Y145.774 E.0249
G1 X54.108 Y161.491 E.7373
G1 X54.108 Y159.593 E.06296
G1 X38.392 Y175.31 E.7373
G1 X38.392 Y174.559 E.0249
G1 X54.108 Y190.276 E.7373
G1 X54.108 Y188.378 E.06296
G1 X38.392 Y204.094 E.7373
G1 X38.392 Y203.344 E.0249
G1 X42.878 Y207.83 E.21046
G2 X42.612 Y211.387 I3.533 J2.052 E.12246
G1 X38.392 Y215.608 E.19801
G1 X38.392 Y214.858 E.0249
G1 X41.267 Y217.733 E.13491
G1 X42.024 Y217.733 E.02508
G1 X45.954 Y213.803 E.18437
G2 X48.293 Y213.245 I.296 J-3.937 E.08105
G1 X52.781 Y217.733 E.21058
G1 X53.537 Y217.733 E.02508
G1 X69.254 Y202.017 E.7373
G1 X71.606 Y202.017 E.07803
G1 X87.323 Y217.733 E.7373
G1 X88.079 Y217.733 E.02508
G1 X103.796 Y202.017 E.7373
G1 X106.148 Y202.017 E.07803
G1 X121.865 Y217.733 E.7373
G1 X122.621 Y217.733 E.02508
G1 X126.744 Y213.614 E.19333
G2 X129.255 Y213.609 I1.249 J-3.783 E.08474
G1 X133.379 Y217.733 E.19347
G1 X134.135 Y217.733 E.02508
G1 X149.852 Y202.017 E.7373
G1 X152.204 Y202.017 E.07803
G1 X167.921 Y217.733 E.7373
G1 X168.677 Y217.733 E.02508
G1 X184.394 Y202.017 E.7373
G1 X186.746 Y202.017 E.07803
G1 X202.462 Y217.733 E.7373
G1 X203.219 Y217.733 E.02508
G1 X207.707 Y213.245 E.21055
G2 X210.051 Y213.808 I2.144 J-3.77 E.08102
G1 X213.976 Y217.733 E.18417
G1 X214.733 Y217.733 E.02508
G1 X217.608 Y214.858 E.13491
G1 X217.608 Y215.608 E.0249
G1 X213.391 Y211.391 E.19786
G2 X213.119 Y207.833 I-3.8 J-1.499 E.12248
G1 X217.608 Y203.344 E.21061
G1 X217.608 Y204.094 E.0249
G1 X201.892 Y188.378 E.7373
G1 X201.892 Y190.276 E.06295
G1 X217.608 Y174.559 E.7373
G1 X217.608 Y175.31 E.0249
G1 X201.892 Y159.593 E.7373
G1 X201.892 Y161.491 E.06296
G1 X217.608 Y145.774 E.7373
G1 X217.608 Y146.525 E.0249
G1 X201.892 Y130.808 E.7373
G1 X201.892 Y132.706 E.06296
G1 X206.448 Y128.15 E.21374
G3 X206.448 Y123.85 I3.308 J-2.15 E.15083
G1 X201.892 Y119.294 E.21374
G1 X201.892 Y121.192 E.06296
G1 X217.608 Y105.475 E.7373
G1 X217.608 Y106.226 E.0249
G1 X201.892 Y90.509 E.7373
G1 X201.892 Y92.407 E.06296
G1 X217.608 Y76.69 E.7373
G1 X217.608 Y77.441 E.0249
G1 X201.892 Y61.724 E.7373
G1 X201.892 Y63.622 E.06296
G1 X217.608 Y47.906 E.7373
G1 X217.608 Y48.656 E.0249
G1 X213.119 Y44.167 E.21061
G2 X213.391 Y40.609 I-3.528 J-2.059 E.12248
G1 X217.608 Y36.392 E.19786
G1 X217.608 Y37.142 E.0249
G1 X214.733 Y34.267 E.13491
G1 X213.976 Y34.267 E.02508
G1 X210.051 Y38.192 E.18417
G2 X207.707 Y38.755 I-.299 J3.917 E.08126
G1 X203.219 Y34.267 E.21055
G1 X202.462 Y34.267 E.02508
G1 X186.746 Y49.983 E.7373
G1 X184.394 Y49.983 E.07803
G1 X168.677 Y34.267 E.7373
G1 X167.921 Y34.267 E.02508
G1 X152.204 Y49.983 E.7373
G1 X149.852 Y49.983 E.07803
G1 X134.135 Y34.267 E.7373
G1 X133.379 Y34.267 E.02508
G1 X129.255 Y38.391 E.19347
G2 X126.742 Y38.387 I-1.262 J3.789 E.08481
G1 X122.621 Y34.267 E.1933
G1 X121.865 Y34.267 E.02508
G1 X106.148 Y49.983 E.7373
G1 X103.796 Y49.983 E.07803
G1 X98.089 Y44.276 E.26773
G1 X98.039 Y44.293 E.00175
G3 X97.49 Y44.369 I-.545 J-1.922 E.01844
G1 X94.889 Y44.367 E.08628
G3 X94.548 Y44.312 I.646 J-5.132 E.01145
G1 X88.877 Y49.983 E.26604
G1 X86.525 Y49.983 E.07803
G1 X70.808 Y34.267 E.7373
G1 X70.052 Y34.267 E.02508
G1 X54.336 Y49.983 E.7373
G1 X54.108 Y49.983 E.00753
G1 X54.108 Y50.211 E.00753
G1 X38.392 Y65.927 E.7373
G1 X38.392 Y65.176 E.0249
G1 X54.108 Y80.893 E.7373
G1 X54.108 Y78.995 E.06296
G1 X38.392 Y94.712 E.7373
G1 X38.392 Y93.961 E.0249
G1 X54.108 Y109.678 E.7373
G1 X54.108 Y107.78 E.06296
G1 X38.392 Y123.497 E.7373
G1 X38.392 Y122.746 E.0249
G1 X42.379 Y126.734 E.18707
G3 X42.379 Y125.266 I3.887 J-.734 E.04896
G1 X38.392 Y129.254 E.18707
G1 X38.392 Y128.503 E.0249
G1 X54.108 Y144.22 E.7373
G1 X54.108 Y142.322 E.06296
G1 X38.392 Y158.039 E.7373
G1 X38.392 Y157.288 E.0249
G1 X54.108 Y173.005 E.7373
G1 X54.108 Y171.107 E.06296
G1 X38.392 Y186.824 E.7373
G1 X38.392 Y186.073 E.0249
G1 X54.108 Y201.789 E.7373
G1 X54.108 Y202.017 E.00753
G1 X54.336 Y202.017 E.00753
G1 X70.052 Y217.733 E.7373
G1 X70.808 Y217.733 E.02508
G1 X86.525 Y202.017 E.7373
G1 X88.877 Y202.017 E.07803
G1 X104.594 Y217.733 E.7373
G1 X105.35 Y217.733 E.02508
G1 X121.067 Y202.017 E.7373
G1 X123.419 Y202.017 E.07803
G1 X127.393 Y205.99 E.18641
G3 X128.616 Y205.982 I.641 J4.346 E.0407
G1 X132.581 Y202.017 E.18602
G1 X134.933 Y202.017 E.07803
G1 X150.65 Y217.733 E.7373
G1 X151.406 Y217.733 E.02508
G1 X167.123 Y202.017 E.7373
G1 X169.475 Y202.017 E.07803
G1 X185.192 Y217.733 E.7373
G1 X185.948 Y217.733 E.02508
G1 X201.664 Y202.017 E.7373
G1 X201.892 Y202.017 E.00753
G1 X201.892 Y201.789 E.00753
G1 X217.608 Y186.073 E.7373
G1 X217.608 Y186.824 E.0249
G1 X201.892 Y171.107 E.7373
G1 X201.892 Y173.005 E.06296
G1 X217.608 Y157.288 E.7373
G1 X217.608 Y158.039 E.0249
G1 X201.892 Y142.322 E.7373
G1 X201.892 Y144.22 E.06296
G1 X217.608 Y128.503 E.7373
G1 X217.608 Y129.254 E.0249
G1 X213.624 Y125.269 E.18693
G3 X213.624 Y126.731 I-5.217 J.731 E.04864
G1 X217.608 Y122.746 E.18693
G1 X217.608 Y123.497 E.0249
G1 X201.892 Y107.78 E.7373
G1 X201.892 Y109.678 E.06296
G1 X217.608 Y93.961 E.7373
G1 X217.608 Y94.712 E.0249
G1 X201.892 Y78.995 E.7373
G1 X201.892 Y80.893 E.06296
G1 X217.608 Y65.176 E.7373
G1 X217.608 Y65.927 E.0249
G1 X201.892 Y50.211 E.7373
G1 X201.892 Y49.983 E.00753
G1 X201.664 Y49.983 E.00753
G1 X185.948 Y34.267 E.7373
G1 X185.192 Y34.267 E.02508
G1 X169.475 Y49.983 E.7373
G1 X167.123 Y49.983 E.07803
G1 X151.406 Y34.267 E.7373
G1 X150.65 Y34.267 E.02508
G1 X134.933 Y49.983 E.7373
G1 X132.581 Y49.983 E.07803
G1 X128.616 Y46.018 E.18602
G3 X127.386 Y46.017 I-.609 J-5.909 E.04087
G1 X123.419 Y49.983 E.18608
G1 X121.067 Y49.983 E.07803
G1 X105.35 Y34.267 E.7373
G1 X104.594 Y34.267 E.02508
G1 X102.521 Y36.34 E.09727
G1 X103.322 Y37.141 E.03759
G1 X102.895 Y37.568 E.02003
G1 X115.31 Y49.983 E.58242
G1 X117.662 Y49.983 E.07803
G1 X124.265 Y43.381 E.30974
G3 X124.106 Y41.508 I4.452 J-1.322 E.06278
G1 X116.864 Y34.267 E.33971
G1 X116.108 Y34.267 E.02508
G1 X100.391 Y49.983 E.7373
G1 X98.039 Y49.983 E.07803
G1 X93.305 Y45.249 E.22209
G1 X90.941 Y46.34 F30000
G1 F16200
G1 X89.79 Y47.491 E.05401
G1 X92.282 Y49.983 E.11691
G1 X94.634 Y49.983 E.07803
G1 X110.351 Y34.267 E.7373
G1 X111.107 Y34.267 E.02508
G1 X126.824 Y49.983 E.7373
G1 X129.176 Y49.983 E.07803
G1 X144.893 Y34.267 E.7373
G1 X145.649 Y34.267 E.02508
G1 X161.366 Y49.983 E.7373
G1 X163.718 Y49.983 E.07803
G1 X179.435 Y34.267 E.7373
G1 X180.191 Y34.267 E.02508
G1 X195.908 Y49.983 E.7373
G1 X198.26 Y49.983 E.07803
G1 X205.821 Y42.422 E.3547
G1 X205.843 Y42.648 E.00753
G1 X197.462 Y34.267 E.3932
G1 X196.706 Y34.267 E.02508
G1 X180.989 Y49.983 E.7373
G1 X178.637 Y49.983 E.07803
G1 X162.92 Y34.267 E.7373
G1 X162.164 Y34.267 E.02508
G1 X146.447 Y49.983 E.7373
G1 X144.095 Y49.983 E.07803
G1 X128.378 Y34.267 E.7373
G1 X127.622 Y34.267 E.02508
G1 X111.905 Y49.983 E.7373
G1 X109.553 Y49.983 E.07803
G1 X101.13 Y41.56 E.39513
G1 X101.557 Y41.134 E.02003
G1 X100.833 Y40.409 E.03399
G1 X100.195 Y33.904 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.382945
G1 F3000;_EXTRUDE_SET_SPEED
G1 X217.812 Y33.904 E3.2589
G1 X217.944 Y33.931 E.00373
G1 X217.971 Y34.063 E.00373
G1 X217.971 Y217.937 E5.09472
G1 X217.944 Y218.069 E.00373
G1 X217.812 Y218.096 E.00373
G1 X38.188 Y218.096 E4.97696
G1 X38.056 Y218.069 E.00373
G1 X38.029 Y217.937 E.00373
G1 X38.029 Y34.063 E5.09472
G1 X38.056 Y33.931 E.00373
G1 X38.188 Y33.904 E.00373
G1 X91.985 Y33.904 E1.49059
; Slow Down End
G1 X96.5 Y33.904 F30000
; Slow Down Start
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X94.519 Y33.904 E.0549
; Slow Down End
; WIPE_START
G1 X96.5 Y33.904 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.587 Y37.138 Z2.4 F30000
G1 X54.108 Y53.737 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X54.108 Y52.108 E.05401
G1 X47.764 Y45.764 E.29764
G3 X46.776 Y46.029 I-2.428 J-7.063 E.03397
G1 X38.392 Y54.413 E.39331
G1 X38.392 Y53.663 E.0249
G1 X54.108 Y69.379 E.7373
G1 X54.108 Y67.481 E.06296
G1 X38.392 Y83.198 E.7373
G1 X38.392 Y82.447 E.0249
G1 X54.108 Y98.164 E.7373
G1 X54.108 Y96.266 E.06296
G1 X38.392 Y111.983 E.7373
G1 X38.392 Y111.232 E.0249
G1 X54.108 Y126.949 E.7373
G1 X54.108 Y125.051 E.06296
G1 X38.392 Y140.768 E.7373
G1 X38.392 Y140.017 E.0249
G1 X54.108 Y155.734 E.7373
G1 X54.108 Y153.836 E.06296
G1 X38.392 Y169.553 E.7373
G1 X38.392 Y168.802 E.0249
G1 X54.108 Y184.519 E.7373
G1 X54.108 Y182.621 E.06296
M73 P57 R25
G1 X38.392 Y198.337 E.7373
G1 X38.392 Y197.587 E.0249
G1 X46.776 Y205.971 E.39331
G3 X47.764 Y206.236 I-1.44 J7.331 E.03397
G1 X54.108 Y199.892 E.29764
M73 P57 R24
G1 X54.108 Y198.263 E.05401
; WIPE_START
G1 X54.108 Y199.892 E-.61876
G1 X53.846 Y200.154 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X56.112 Y202.017 Z2.4 F30000
G1 Z2
G1 E.8 F1800
G1 F16200
G1 X57.74 Y202.017 E.05401
G1 X50.179 Y209.578 E.3547
G2 X50.155 Y209.35 I-1.151 J.01 E.00761
G1 X58.538 Y217.733 E.39329
G1 X59.294 Y217.733 E.02508
G1 X75.011 Y202.017 E.7373
G1 X77.363 Y202.017 E.07803
G1 X93.08 Y217.733 E.7373
G1 X93.836 Y217.733 E.02508
G1 X109.553 Y202.017 E.7373
G1 X111.905 Y202.017 E.07803
G1 X127.622 Y217.733 E.7373
G1 X128.378 Y217.733 E.02508
G1 X144.095 Y202.017 E.7373
G1 X146.447 Y202.017 E.07803
G1 X162.164 Y217.733 E.7373
G1 X162.92 Y217.733 E.02508
G1 X178.637 Y202.017 E.7373
G1 X180.989 Y202.017 E.07803
G1 X196.705 Y217.733 E.7373
G1 X197.462 Y217.733 E.02508
G1 X205.843 Y209.352 E.3932
G1 X205.821 Y209.578 E.00753
G1 X198.26 Y202.017 E.3547
G1 X195.908 Y202.017 E.07803
G1 X180.191 Y217.733 E.7373
G1 X179.435 Y217.733 E.02508
G1 X163.718 Y202.017 E.7373
G1 X161.366 Y202.017 E.07803
G1 X145.649 Y217.733 E.7373
G1 X144.893 Y217.733 E.02508
G1 X129.176 Y202.017 E.7373
G1 X126.824 Y202.017 E.07803
G1 X111.107 Y217.733 E.7373
G1 X110.351 Y217.733 E.02508
G1 X94.634 Y202.017 E.7373
G1 X92.282 Y202.017 E.07803
G1 X76.565 Y217.733 E.7373
G1 X75.809 Y217.733 E.02508
G1 X60.092 Y202.017 E.7373
G1 X61.721 Y202.017 E.05401
G1 X49.813 Y209.518 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F12000
G1 X49.675 Y208.835 E.01931
G1 X49.401 Y208.177 E.01976
G1 X49.002 Y207.586 E.01974
G1 X48.494 Y207.086 E.01975
G1 X47.897 Y206.697 E.01975
G1 X47.235 Y206.434 E.01975
G1 X46.53 Y206.306 E.01984
G2 X45.47 Y206.381 I-.26 J3.874 E.02953
G1 X44.792 Y206.606 E.0198
G1 X44.173 Y206.959 E.01975
G1 X43.637 Y207.429 E.01975
G1 X43.204 Y207.995 E.01975
G1 X42.892 Y208.636 E.01975
G1 X42.713 Y209.326 E.01974
G1 X42.674 Y210.038 E.01975
G1 X42.777 Y210.743 E.01975
G1 X43.018 Y211.414 E.01975
G1 X43.387 Y212.024 E.01975
G1 X43.87 Y212.548 E.01975
G1 X44.446 Y212.967 E.01974
G1 X45.095 Y213.263 E.01975
G1 X45.789 Y213.425 E.01975
G1 X46.502 Y213.446 E.01975
G1 X47.204 Y213.325 E.01975
G1 X47.869 Y213.067 E.01976
G1 X48.47 Y212.683 E.01974
G1 X48.982 Y212.188 E.01975
G1 X49.386 Y211.601 E.01974
G1 X49.666 Y210.945 E.01976
G1 X49.81 Y210.247 E.01974
G1 X49.813 Y209.578 E.01853
G1 X84.749 Y202.017 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X83.12 Y202.017 E.05401
G1 X98.837 Y217.733 E.7373
G1 X99.593 Y217.733 E.02508
G1 X115.31 Y202.017 E.7373
G1 X117.662 Y202.017 E.07803
G1 X124.265 Y208.619 E.30974
G2 X124.106 Y210.492 I4.453 J1.322 E.06277
G1 X116.864 Y217.733 E.33971
G1 X116.108 Y217.733 E.02508
G1 X100.391 Y202.017 E.7373
G1 X98.039 Y202.017 E.07803
G1 X82.322 Y217.733 E.7373
G1 X81.566 Y217.733 E.02508
G1 X65.849 Y202.017 E.7373
G1 X63.497 Y202.017 E.07803
G1 X47.781 Y217.733 E.7373
G1 X47.024 Y217.733 E.02508
G1 X38.392 Y209.101 E.40498
G1 X38.392 Y209.851 E.0249
G1 X54.108 Y194.135 E.7373
G1 X54.108 Y196.033 E.06296
G1 X38.392 Y180.316 E.7373
G1 X38.392 Y181.067 E.0249
G1 X54.108 Y165.35 E.7373
G1 X54.108 Y167.248 E.06296
G1 X38.392 Y151.531 E.7373
G1 X38.392 Y152.282 E.0249
G1 X54.108 Y136.565 E.7373
G1 X54.108 Y138.463 E.06296
G1 X45.516 Y129.871 E.40307
G3 X44.101 Y129.302 I.738 J-3.879 E.05093
G1 X38.392 Y135.011 E.26783
G1 X38.392 Y134.26 E.0249
G1 X54.108 Y149.977 E.7373
G1 X54.108 Y148.079 E.06296
G1 X38.392 Y163.796 E.7373
G1 X38.392 Y163.045 E.0249
G1 X54.108 Y178.762 E.7373
G1 X54.108 Y176.864 E.06296
G1 X38.392 Y192.58 E.7373
G1 X38.392 Y191.83 E.0249
G1 X64.295 Y217.733 E1.21519
G1 X65.051 Y217.733 E.02508
G1 X80.768 Y202.017 E.7373
G1 X79.14 Y202.017 E.05401
; WIPE_START
G1 X80.768 Y202.017 E-.61876
G1 X80.505 Y202.279 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X88.062 Y203.351 Z2.4 F30000
G1 X131.563 Y209.518 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F12000
G1 X131.425 Y208.835 E.01931
G1 X131.151 Y208.177 E.01975
G1 X130.752 Y207.586 E.01975
G1 X130.244 Y207.086 E.01974
G1 X129.647 Y206.697 E.01975
G1 X128.985 Y206.434 E.01975
G1 X128.28 Y206.306 E.01984
G2 X127.22 Y206.381 I-.26 J3.874 E.02953
G1 X126.542 Y206.606 E.0198
G1 X125.923 Y206.959 E.01975
G1 X125.387 Y207.429 E.01975
G1 X124.954 Y207.995 E.01975
G1 X124.642 Y208.636 E.01975
G1 X124.463 Y209.326 E.01975
G1 X124.424 Y210.038 E.01975
G1 X124.527 Y210.743 E.01975
G1 X124.768 Y211.414 E.01974
G1 X125.137 Y212.024 E.01975
G1 X125.619 Y212.548 E.01975
G1 X126.196 Y212.967 E.01975
G1 X126.845 Y213.263 E.01975
G1 X127.539 Y213.425 E.01974
G1 X128.252 Y213.446 E.01975
G1 X128.954 Y213.325 E.01975
G1 X129.619 Y213.067 E.01976
G1 X130.219 Y212.684 E.01974
G1 X130.732 Y212.188 E.01975
G1 X131.136 Y211.601 E.01974
G1 X131.416 Y210.945 E.01976
G1 X131.56 Y210.247 E.01975
G1 X131.563 Y209.578 E.01853
G1 X159.589 Y202.017 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X157.961 Y202.017 E.05401
G1 X173.678 Y217.733 E.7373
G1 X174.434 Y217.733 E.02508
G1 X190.151 Y202.017 E.7373
G1 X192.503 Y202.017 E.07802
G1 X208.219 Y217.733 E.7373
G1 X208.976 Y217.733 E.02508
G1 X217.608 Y209.101 E.40498
G1 X217.608 Y209.851 E.0249
G1 X201.892 Y194.135 E.7373
G1 X201.892 Y196.033 E.06296
G1 X217.608 Y180.316 E.7373
G1 X217.608 Y181.067 E.0249
G1 X201.892 Y165.35 E.7373
G1 X201.892 Y167.248 E.06296
G1 X217.608 Y151.531 E.7373
G1 X217.608 Y152.282 E.0249
G1 X201.892 Y136.565 E.7373
G1 X201.892 Y138.463 E.06296
G1 X210.481 Y129.874 E.40292
G2 X211.902 Y129.305 I-.806 J-4.072 E.05109
G1 X217.608 Y135.011 E.26769
G1 X217.608 Y134.26 E.0249
G1 X201.892 Y149.977 E.7373
G1 X201.892 Y148.079 E.06296
G1 X217.608 Y163.796 E.7373
G1 X217.608 Y163.045 E.0249
G1 X201.892 Y178.762 E.7373
G1 X201.892 Y176.864 E.06296
G1 X217.608 Y192.58 E.7373
G1 X217.608 Y191.83 E.0249
G1 X191.705 Y217.733 E1.21519
G1 X190.949 Y217.733 E.02508
G1 X175.232 Y202.017 E.7373
G1 X172.88 Y202.017 E.07803
G1 X157.163 Y217.733 E.7373
G1 X156.407 Y217.733 E.02508
G1 X140.69 Y202.017 E.7373
G1 X138.338 Y202.017 E.07803
G1 X131.735 Y208.619 E.30975
G3 X131.891 Y210.489 I-4.354 J1.305 E.06268
G1 X139.136 Y217.733 E.33985
G1 X139.892 Y217.733 E.02508
G1 X155.609 Y202.017 E.7373
G1 X153.98 Y202.017 E.05401
; WIPE_START
G1 X155.609 Y202.017 E-.61876
G1 X155.346 Y202.279 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X159.95 Y196.192 Z2.4 F30000
G1 X213.313 Y125.644 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F12000
G1 X213.175 Y124.96 E.01931
G1 X212.901 Y124.302 E.01976
G1 X212.502 Y123.711 E.01975
G1 X211.994 Y123.211 E.01975
G1 X211.397 Y122.822 E.01975
G1 X210.735 Y122.558 E.01976
G1 X210.03 Y122.431 E.01983
G2 X208.971 Y122.506 I-.26 J3.872 E.02952
G1 X208.292 Y122.731 E.0198
G1 X207.673 Y123.084 E.01975
G1 X207.137 Y123.554 E.01975
G1 X206.704 Y124.12 E.01975
G1 X206.392 Y124.761 E.01975
G1 X206.213 Y125.451 E.01975
G1 X206.174 Y126.163 E.01975
G1 X206.277 Y126.868 E.01975
G1 X206.518 Y127.539 E.01975
G1 X206.887 Y128.149 E.01975
G1 X207.37 Y128.673 E.01975
G1 X207.946 Y129.092 E.01974
G1 X208.595 Y129.388 E.01975
G1 X209.289 Y129.55 E.01975
G1 X210.002 Y129.571 E.01975
G1 X210.704 Y129.45 E.01975
G1 X211.369 Y129.193 E.01975
G1 X211.97 Y128.808 E.01976
G1 X212.482 Y128.313 E.01974
G1 X212.886 Y127.726 E.01974
G1 X213.166 Y127.07 E.01976
G1 X213.31 Y126.372 E.01975
G1 X213.313 Y125.704 E.01853
; WIPE_START
G1 X213.31 Y126.372 E-.2541
G1 X213.166 Y127.07 E-.27083
G1 X212.923 Y127.639 E-.23506
; WIPE_END
G1 E-.04 F1800
G1 X205.291 Y127.546 Z2.4 F30000
G1 X49.813 Y125.644 Z2.4
G1 Z2
G1 E.8 F1800
G1 F12000
G1 X49.675 Y124.96 E.01932
G1 X49.401 Y124.302 E.01976
G1 X49.002 Y123.711 E.01974
G1 X48.494 Y123.211 E.01976
G1 X47.897 Y122.822 E.01975
G1 X47.235 Y122.558 E.01975
G1 X46.53 Y122.431 E.01983
G2 X45.471 Y122.506 I-.26 J3.873 E.02952
G1 X44.792 Y122.731 E.0198
G1 X44.173 Y123.084 E.01975
G1 X43.637 Y123.554 E.01975
G1 X43.204 Y124.12 E.01975
G1 X42.892 Y124.761 E.01975
G1 X42.713 Y125.451 E.01975
G1 X42.674 Y126.163 E.01975
G1 X42.777 Y126.868 E.01975
G1 X43.018 Y127.539 E.01974
G1 X43.387 Y128.149 E.01975
G1 X43.87 Y128.673 E.01975
G1 X44.446 Y129.092 E.01974
G1 X45.095 Y129.388 E.01975
G1 X45.789 Y129.55 E.01974
G1 X46.502 Y129.571 E.01975
G1 X47.204 Y129.45 E.01975
G1 X47.869 Y129.193 E.01975
G1 X48.469 Y128.809 E.01974
G1 X48.982 Y128.313 E.01975
G1 X49.386 Y127.726 E.01975
G1 X49.666 Y127.07 E.01975
G1 X49.81 Y126.372 E.01975
G1 X49.813 Y125.704 E.01853
G1 X49.813 Y41.768 F30000
G1 F12000
G1 X49.675 Y41.085 E.01932
G1 X49.401 Y40.427 E.01975
G1 X49.002 Y39.836 E.01974
G1 X48.494 Y39.336 E.01975
G1 X47.897 Y38.947 E.01975
G1 X47.235 Y38.683 E.01975
G1 X46.53 Y38.556 E.01983
G2 X45.471 Y38.631 I-.26 J3.873 E.02952
G1 X44.792 Y38.856 E.0198
G1 X44.173 Y39.209 E.01975
G1 X43.637 Y39.679 E.01975
G1 X43.204 Y40.245 E.01975
G1 X42.892 Y40.886 E.01974
G1 X42.713 Y41.576 E.01975
G1 X42.674 Y42.288 E.01975
G1 X42.777 Y42.993 E.01975
G1 X43.018 Y43.664 E.01975
G1 X43.387 Y44.274 E.01975
G1 X43.87 Y44.798 E.01975
G1 X44.447 Y45.217 E.01975
G1 X45.095 Y45.513 E.01975
G1 X45.789 Y45.675 E.01975
G1 X46.502 Y45.696 E.01975
G1 X47.204 Y45.575 E.01975
G1 X47.869 Y45.318 E.01975
G1 X48.469 Y44.934 E.01974
G1 X48.982 Y44.438 E.01975
G1 X49.386 Y43.851 E.01975
G1 X49.666 Y43.195 E.01976
G1 X49.81 Y42.497 E.01974
G1 X49.813 Y41.828 E.01853
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F12000
G1 X49.81 Y42.497 E-.25411
G1 X49.666 Y43.195 E-.27079
G1 X49.423 Y43.764 E-.2351
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/15
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
G17
G3 Z2.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 15
G1 X126.343 Y212.631
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X126.126 Y212.482 E.00874
G3 X127.795 Y206.667 I1.883 J-2.606 E.26126
G3 X129.175 Y206.879 I.201 J3.288 E.04667
G3 X126.397 Y212.657 I-1.167 J2.996 E.35146
G1 X126.563 Y212.288 F30000
G1 F16213.044
G1 X126.363 Y212.152 E.00803
G3 X127.826 Y207.073 I1.646 J-2.276 E.22825
G3 X128.761 Y207.17 I.192 J2.722 E.03135
G3 X126.617 Y212.315 I-.752 J2.706 E.31581
G1 X126.769 Y211.935 F30000
G1 F16213.044
G1 X126.414 Y211.672 E.01466
G3 X127.856 Y207.479 I1.594 J-1.796 E.1874
G3 X128.651 Y207.562 I.035 J3.517 E.02655
G3 X126.822 Y211.964 I-.643 J2.314 E.26983
G1 X126.778 Y211.46 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X126.675 Y211.376 E.00407
G3 X127.886 Y207.87 I1.334 J-1.501 E.14525
G3 X128.349 Y207.895 I.113 J2.201 E.01429
G3 X126.998 Y211.61 I-.34 J1.98 E.21597
G1 X126.827 Y211.494 E.00636
; WIPE_START
M204 S10000
G1 X126.675 Y211.376 E-.07302
G1 X126.398 Y211.089 E-.15187
G1 X126.189 Y210.747 E-.1521
G1 X126.052 Y210.371 E-.15211
G1 X125.992 Y209.975 E-.15215
G1 X126.003 Y209.768 E-.07875
; WIPE_END
G1 E-.04 F1800
G1 X118.372 Y209.578 Z2.6 F30000
G1 X43.858 Y207.726 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X43.898 Y207.693 E.00173
G3 X46.045 Y206.667 I2.361 J2.183 E.08086
G3 X47.426 Y206.879 I.201 J3.288 E.04667
G3 X43.693 Y207.938 I-1.167 J2.996 E.53195
G1 X43.821 Y207.773 E.00692
G1 X44.168 Y207.99 F30000
G1 F16213.044
G1 X44.197 Y207.97 E.00116
G3 X46.076 Y207.073 I2.063 J1.906 E.07075
G3 X47.011 Y207.17 I.192 J2.722 E.03135
G3 X44.018 Y208.184 I-.752 J2.706 E.47405
G1 X44.131 Y208.037 E.00615
G1 X44.468 Y208.267 F30000
G1 F16213.044
G1 X44.494 Y208.246 E.00112
G3 X46.106 Y207.479 I1.764 J1.63 E.06067
G3 X46.901 Y207.562 I.035 J3.517 E.02655
G3 X44.207 Y208.627 I-.643 J2.314 E.39738
G1 X44.433 Y208.316 E.01274
G1 X44.755 Y208.536 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X44.783 Y208.514 E.00111
G3 X46.136 Y207.87 I1.477 J1.361 E.04718
G3 X46.599 Y207.895 I.113 J2.201 E.01429
G3 X44.543 Y208.832 I-.34 J1.98 E.31405
G1 X44.72 Y208.585 E.00933
; WIPE_START
M204 S10000
G1 X44.783 Y208.514 E-.03619
G1 X45.077 Y208.243 E-.15181
G1 X45.423 Y208.043 E-.15214
G1 X45.803 Y207.915 E-.1521
G1 X46.136 Y207.87 E-.12772
G1 X46.4 Y207.87 E-.10049
G1 X46.503 Y207.883 E-.03954
; WIPE_END
G1 E-.04 F1800
G1 X46.772 Y200.256 Z2.6 F30000
G1 X49.412 Y125.413 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X49.458 Y125.679 E.00894
G3 X46.045 Y122.792 I-3.199 J.321 E.50618
G3 X47.426 Y123.004 I.201 J3.289 E.04668
G3 X49.408 Y125.354 I-1.167 J2.996 E.10632
G1 X49.01 Y125.477 F30000
G1 F16213.044
G1 X49.054 Y125.719 E.00818
G3 X46.076 Y123.198 I-2.795 J.282 E.44231
G3 X47.011 Y123.295 I.192 J2.725 E.03134
G3 X49.007 Y125.418 I-.751 J2.706 E.10163
G1 X48.609 Y125.557 F30000
G1 F16213.044
G1 X48.66 Y126 E.01479
G3 X46.106 Y123.604 I-2.401 J.001 E.37037
G3 X46.901 Y123.687 I.034 J3.523 E.02655
G3 X48.606 Y125.498 I-.643 J2.314 E.08675
G1 X48.223 Y125.626 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X48.268 Y126 E.01157
G3 X46.136 Y123.995 I-2.009 J0 E.28703
G3 X46.599 Y124.02 I.113 J2.2 E.01429
G3 X48.221 Y125.567 I-.34 J1.98 E.07306
; WIPE_START
M204 S10000
G1 X48.268 Y126 E-.16534
G1 X48.25 Y126.2 E-.07638
G1 X48.171 Y126.593 E-.1521
G1 X48.015 Y126.961 E-.15212
G1 X47.79 Y127.292 E-.15213
G1 X47.673 Y127.406 E-.06194
; WIPE_END
G1 E-.04 F1800
G1 X54.55 Y130.716 Z2.6 F30000
G1 X201.166 Y201.291 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X54.834 Y201.291 E4.85411
G1 X54.834 Y50.709 E4.99509
G1 X201.166 Y50.709 E4.85411
G1 X201.166 Y201.231 E4.9931
G1 X200.759 Y200.884 F30000
G1 F16213.044
G1 X55.241 Y200.884 E4.82711
G1 X55.241 Y51.116 E4.96809
G1 X200.759 Y51.116 E4.82711
G1 X200.759 Y200.824 E4.9661
G1 X200.352 Y200.477 F30000
G1 F16213.044
G1 X55.648 Y200.477 E4.8001
G1 X55.648 Y51.523 E4.94108
G1 X200.352 Y51.523 E4.8001
G1 X200.352 Y200.417 E4.93909
G1 X199.96 Y200.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X56.04 Y200.085 E4.42226
G1 X56.04 Y51.915 E4.55285
G1 X199.96 Y51.915 E4.42226
G1 X199.96 Y200.025 E4.55101
; WIPE_START
M204 S10000
G1 X197.96 Y200.026 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X192.696 Y194.499 Z2.6 F30000
G1 X44.828 Y39.242 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X44.929 Y39.198 E.00367
G3 X46.045 Y38.917 I1.33 J2.927 E.03839
G3 X47.426 Y39.129 I.201 J3.289 E.04668
G3 X44.645 Y39.345 I-1.167 J2.996 E.57441
G1 X44.776 Y39.272 E.00497
G1 X45.317 Y39.476 F30000
G1 F16213.044
G1 X45.357 Y39.466 E.00135
G3 X46.076 Y39.323 I.903 J2.66 E.02439
G3 X47.011 Y39.42 I.192 J2.724 E.03134
G3 X45.097 Y39.569 I-.751 J2.706 E.5204
G1 X45.262 Y39.499 E.00595
G1 X45.811 Y39.769 F30000
G1 F16213.044
G1 X46.106 Y39.729 E.0099
G3 X46.901 Y39.812 I.034 J3.522 E.02655
G3 X45.716 Y39.786 I-.643 J2.314 E.4608
G1 X45.752 Y39.78 E.0012
G1 X46.087 Y40.127 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X46.136 Y40.12 E.0015
G3 X46.599 Y40.145 I.113 J2.2 E.01429
G3 X45.803 Y40.169 I-.34 J1.98 E.36316
G1 X46.028 Y40.136 E.00697
; WIPE_START
M204 S10000
G1 X46.136 Y40.12 E-.04137
G1 X46.4 Y40.12 E-.1005
G1 X46.599 Y40.145 E-.07617
G1 X46.984 Y40.254 E-.15212
G1 X47.341 Y40.436 E-.15215
G1 X47.654 Y40.686 E-.15207
G1 X47.798 Y40.858 E-.08561
; WIPE_END
M73 P58 R24
G1 E-.04 F1800
G1 X55.429 Y40.702 Z2.6 F30000
G1 X126.58 Y39.241 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X126.679 Y39.198 E.00359
G3 X127.796 Y38.917 I1.33 J2.927 E.03839
G3 X129.176 Y39.13 I.201 J3.289 E.04668
G3 X126.395 Y39.345 I-1.167 J2.996 E.57441
G1 X126.528 Y39.271 E.00504
G1 X127.066 Y39.476 F30000
G1 F16213.044
G1 X127.107 Y39.466 E.00139
G3 X127.826 Y39.323 I.903 J2.66 E.0244
G3 X128.761 Y39.42 I.192 J2.725 E.03134
G3 X126.847 Y39.569 I-.751 J2.706 E.5204
G1 X127.011 Y39.5 E.00591
G1 X127.559 Y39.77 F30000
G1 F16213.044
G1 X127.856 Y39.729 E.00995
G3 X128.651 Y39.812 I.034 J3.523 E.02655
G3 X127.466 Y39.786 I-.643 J2.314 E.4608
G1 X127.5 Y39.78 E.00114
G1 X127.891 Y40.12 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X128.15 Y40.122 E.00795
G3 X128.349 Y40.145 I-.151 J2.198 E.00616
G3 X127.831 Y40.124 I-.34 J1.98 E.37182
; WIPE_START
M204 S10000
G1 X128.15 Y40.122 E-.12108
G1 X128.349 Y40.145 E-.07613
G1 X128.544 Y40.19 E-.07614
G1 X128.917 Y40.336 E-.15212
G1 X129.253 Y40.553 E-.15211
G1 X129.54 Y40.833 E-.15213
G1 X129.585 Y40.899 E-.03028
; WIPE_END
G1 E-.04 F1800
G1 X137.215 Y40.728 Z2.6 F30000
G1 X210.797 Y39.086 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X210.926 Y39.13 E.0045
G3 X209.545 Y38.917 I-1.167 J2.996 E.62341
G3 X210.621 Y39.029 I.201 J3.288 E.03603
G1 X210.74 Y39.068 E.00416
G1 X210.352 Y39.383 F30000
G1 F16213.044
G1 X210.511 Y39.42 E.00542
G3 X209.576 Y39.323 I-.751 J2.706 E.55408
G3 X210.238 Y39.357 I.192 J2.724 E.02204
G1 X210.293 Y39.37 E.00188
G1 X209.974 Y39.737 F30000
G1 F16213.044
G1 X210.401 Y39.812 E.01436
G3 X209.606 Y39.729 I-.643 J2.314 E.4739
G3 X209.915 Y39.74 I.034 J3.522 E.01023
G1 X209.641 Y40.12 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.9 Y40.122 E.00797
G3 X210.099 Y40.145 I-.151 J2.197 E.00616
G3 X209.581 Y40.124 I-.34 J1.98 E.37181
; WIPE_START
M204 S10000
G1 X209.9 Y40.122 E-.12124
G1 X210.099 Y40.145 E-.07613
G1 X210.484 Y40.254 E-.15214
G1 X210.841 Y40.436 E-.1521
G1 X211.154 Y40.686 E-.1521
G1 X211.333 Y40.9 E-.10629
; WIPE_END
G1 E-.04 F1800
G1 X211.284 Y48.532 Z2.6 F30000
G1 X210.797 Y122.961 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X210.926 Y123.004 E.00449
G3 X209.545 Y122.792 I-1.167 J2.996 E.62342
G3 X210.621 Y122.904 I.201 J3.289 E.03603
G1 X210.74 Y122.943 E.00416
G1 X210.352 Y123.258 F30000
G1 F16213.044
G1 X210.511 Y123.295 E.00542
G3 X209.576 Y123.198 I-.751 J2.706 E.55407
G3 X210.238 Y123.232 I.192 J2.724 E.02204
G1 X210.293 Y123.245 E.00189
G1 X209.975 Y123.612 F30000
G1 F16213.044
G1 X210.401 Y123.687 E.01435
G3 X209.606 Y123.604 I-.643 J2.314 E.4739
G3 X209.915 Y123.615 I.034 J3.522 E.01024
G1 X209.641 Y123.995 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.9 Y123.997 E.00797
G3 X210.099 Y124.02 I-.151 J2.198 E.00616
G3 X209.581 Y123.999 I-.34 J1.98 E.37181
; WIPE_START
M204 S10000
G1 X209.9 Y123.997 E-.12123
G1 X210.099 Y124.02 E-.07613
G1 X210.485 Y124.129 E-.15215
G1 X210.841 Y124.311 E-.15209
G1 X211.154 Y124.561 E-.1521
G1 X211.333 Y124.775 E-.1063
; WIPE_END
G1 E-.04 F1800
G1 X211.055 Y132.403 Z2.6 F30000
G1 X208.33 Y206.991 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X208.429 Y206.948 E.0036
G3 X209.545 Y206.667 I1.33 J2.927 E.03839
G3 X210.926 Y206.879 I.201 J3.288 E.04667
G3 X208.145 Y207.095 I-1.167 J2.996 E.57442
G1 X208.277 Y207.021 E.00503
G1 X208.816 Y207.226 F30000
G1 F16213.044
G1 X208.857 Y207.216 E.0014
G3 X209.576 Y207.073 I.903 J2.66 E.0244
G3 X210.511 Y207.17 I.192 J2.724 E.03134
G3 X208.597 Y207.319 I-.751 J2.706 E.5204
G1 X208.76 Y207.25 E.0059
G1 X209.309 Y207.52 F30000
G1 F16213.044
G1 X209.606 Y207.479 E.00996
G3 X210.401 Y207.562 I.035 J3.52 E.02655
G3 X209.216 Y207.536 I-.643 J2.314 E.4608
G1 X209.25 Y207.53 E.00113
G1 X209.634 Y207.87 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.636 Y207.87 E.00004
G3 X210.099 Y207.895 I.113 J2.201 E.01429
G3 X209.303 Y207.919 I-.34 J1.98 E.36316
G1 X209.575 Y207.879 E.00843
; WIPE_START
M204 S10000
G1 X209.636 Y207.87 E-.02335
G1 X209.9 Y207.87 E-.1005
G1 X210.099 Y207.895 E-.07617
G1 X210.484 Y208.004 E-.15214
G1 X210.841 Y208.186 E-.15207
G1 X211.154 Y208.436 E-.15213
G1 X211.329 Y208.645 E-.10364
; WIPE_END
G1 E-.04 F1800
G1 X215.763 Y214.857 Z2.6 F30000
G1 X218.334 Y218.459 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X37.666 Y218.459 E5.99308
G1 X37.666 Y33.541 E6.13406
G1 X218.334 Y33.541 E5.99308
G1 X218.334 Y218.399 E6.13207
G1 X218.741 Y218.866 F30000
G1 F16213.044
G1 X37.259 Y218.866 E6.02008
G1 X37.259 Y33.134 E6.16106
G1 X218.741 Y33.134 E6.02008
G1 X218.741 Y218.806 E6.15907
G1 X219.148 Y219.273 F30000
G1 F16213.044
G1 X36.852 Y219.273 E6.04709
G1 X36.852 Y32.727 E6.18807
G1 X219.148 Y32.727 E6.04709
G1 X219.148 Y219.213 E6.18608
G1 X219.54 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X36.46 Y219.665 E5.62554
G1 X36.46 Y32.335 E5.75613
G1 X219.54 Y32.335 E5.62554
G1 X219.54 Y219.605 E5.75429
; WIPE_START
M204 S10000
G1 X217.54 Y219.606 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X214.55 Y212.583 Z2.6 F30000
G1 X213.005 Y208.956 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40043
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X217.964 Y213.907 E.35954
G1 X217.964 Y214.543 E.03266
G1 X213.336 Y209.922 E.33556
G3 X213.28 Y210.503 I-2.933 J.009 E.02996
G1 X217.964 Y215.179 E.33964
G1 X217.964 Y215.816 E.03266
G1 X213.15 Y211.01 E.349
G3 X212.964 Y211.461 I-2.34 J-.705 E.02505
G1 X217.964 Y216.452 E.36252
G1 X217.964 Y217.089 E.03266
G1 X212.733 Y211.866 E.37927
G3 X212.456 Y212.227 I-4.429 J-3.111 E.02332
G1 X217.964 Y217.725 E.39932
G1 X217.964 Y218.089 E.01866
G1 X217.691 Y218.089 E.01402
G1 X212.139 Y212.546 E.40253
G3 X211.783 Y212.827 I-1.577 J-1.634 E.02331
G1 X217.053 Y218.089 E.38213
G1 X216.416 Y218.089 E.03271
G1 X211.386 Y213.068 E.36464
G3 X210.938 Y213.257 I-1.784 J-3.623 E.02499
G1 X215.778 Y218.089 E.35096
G1 X215.141 Y218.089 E.03271
G1 X210.438 Y213.394 E.34098
G3 X209.863 Y213.457 I-.717 J-3.883 E.02967
G1 X214.503 Y218.089 E.3364
G1 X213.866 Y218.089 E.03271
G1 X209.183 Y213.414 E.33953
G3 X208.278 Y213.147 I.628 J-3.798 E.04853
G1 X213.228 Y218.089 E.35891
G1 X212.591 Y218.089 E.03271
G1 X196.135 Y201.661 E1.19309
G1 X195.497 Y201.661 E.03271
G1 X211.953 Y218.089 E1.19309
G1 X211.315 Y218.089 E.03271
G1 X194.86 Y201.661 E1.19309
G1 X194.222 Y201.661 E.03271
G1 X210.678 Y218.089 E1.19309
G1 X210.04 Y218.089 E.03271
G1 X193.585 Y201.661 E1.19309
G1 X192.947 Y201.661 E.03271
G1 X209.403 Y218.089 E1.19309
G1 X208.765 Y218.089 E.03271
G1 X192.31 Y201.661 E1.19309
G1 X191.672 Y201.661 E.03271
G1 X208.128 Y218.089 E1.19309
G1 X207.49 Y218.089 E.03271
G1 X191.034 Y201.661 E1.19309
G1 X190.397 Y201.661 E.03271
G1 X206.853 Y218.089 E1.19309
G1 X206.215 Y218.089 E.03271
G1 X189.759 Y201.661 E1.19309
G1 X189.122 Y201.661 E.03271
G1 X205.578 Y218.089 E1.19309
G1 X204.94 Y218.089 E.03271
G1 X188.484 Y201.661 E1.19309
G1 X187.847 Y201.661 E.03271
G1 X204.303 Y218.089 E1.19309
G1 X203.665 Y218.089 E.03271
G1 X187.209 Y201.661 E1.19309
G1 X186.572 Y201.661 E.03271
G1 X203.027 Y218.089 E1.19309
G1 X202.39 Y218.089 E.03271
G1 X185.934 Y201.661 E1.19309
G1 X185.297 Y201.661 E.03271
G1 X201.752 Y218.089 E1.19309
G1 X201.115 Y218.089 E.03271
G1 X184.659 Y201.661 E1.19309
G1 X184.021 Y201.661 E.03271
G1 X200.477 Y218.089 E1.19309
G1 X199.84 Y218.089 E.03271
G1 X183.384 Y201.661 E1.19309
G1 X182.746 Y201.661 E.03271
G1 X199.202 Y218.089 E1.19309
G1 X198.565 Y218.089 E.03271
G1 X182.109 Y201.661 E1.19309
G1 X181.471 Y201.661 E.03271
G1 X197.927 Y218.089 E1.19309
G1 X197.29 Y218.089 E.03271
G1 X180.834 Y201.661 E1.19309
G1 X180.196 Y201.661 E.03271
G1 X196.652 Y218.089 E1.19309
G1 X196.014 Y218.089 E.03271
G1 X179.559 Y201.661 E1.19309
M73 P58 R23
G1 X178.921 Y201.661 E.03271
G1 X195.377 Y218.089 E1.19309
G1 X194.739 Y218.089 E.03271
G1 X178.284 Y201.661 E1.19309
G1 X177.646 Y201.661 E.03271
G1 X194.102 Y218.089 E1.19309
G1 X193.464 Y218.089 E.03271
G1 X177.009 Y201.661 E1.19309
G1 X176.371 Y201.661 E.03271
G1 X192.827 Y218.089 E1.19309
G1 X192.189 Y218.089 E.03271
G1 X175.733 Y201.661 E1.19309
G1 X175.096 Y201.661 E.03271
G1 X191.552 Y218.089 E1.19309
G1 X190.914 Y218.089 E.03271
G1 X174.458 Y201.661 E1.19309
G1 X173.821 Y201.661 E.03271
G1 X190.277 Y218.089 E1.19309
G1 X189.639 Y218.089 E.03271
G1 X173.183 Y201.661 E1.19309
G1 X172.546 Y201.661 E.03271
G1 X189.002 Y218.089 E1.19309
G1 X188.364 Y218.089 E.03271
G1 X171.908 Y201.661 E1.19309
G1 X171.271 Y201.661 E.03271
G1 X187.726 Y218.089 E1.19309
G1 X187.089 Y218.089 E.03271
G1 X170.633 Y201.661 E1.19309
G1 X169.996 Y201.661 E.03271
G1 X186.451 Y218.089 E1.19309
G1 X185.814 Y218.089 E.03271
G1 X169.358 Y201.661 E1.19309
G1 X168.721 Y201.661 E.03271
G1 X185.176 Y218.089 E1.19309
G1 X184.539 Y218.089 E.03271
G1 X168.083 Y201.661 E1.19309
M73 P59 R23
G1 X167.445 Y201.661 E.03271
G1 X183.901 Y218.089 E1.19309
G1 X183.264 Y218.089 E.03271
G1 X166.808 Y201.661 E1.19309
G1 X166.17 Y201.661 E.03271
G1 X182.626 Y218.089 E1.19309
G1 X181.989 Y218.089 E.03271
G1 X165.533 Y201.661 E1.19309
G1 X164.895 Y201.661 E.03271
G1 X181.351 Y218.089 E1.19309
G1 X180.714 Y218.089 E.03271
G1 X164.258 Y201.661 E1.19309
G1 X163.62 Y201.661 E.03271
G1 X180.076 Y218.089 E1.19309
G1 X179.438 Y218.089 E.03271
G1 X162.983 Y201.661 E1.19309
G1 X162.345 Y201.661 E.03271
G1 X178.801 Y218.089 E1.19309
G1 X178.163 Y218.089 E.03271
G1 X161.708 Y201.661 E1.19309
G1 X161.07 Y201.661 E.03271
G1 X177.526 Y218.089 E1.19309
G1 X176.888 Y218.089 E.03271
G1 X160.432 Y201.661 E1.19309
G1 X159.795 Y201.661 E.03271
G1 X176.251 Y218.089 E1.19309
G1 X175.613 Y218.089 E.03271
G1 X159.157 Y201.661 E1.19309
G1 X158.52 Y201.661 E.03271
G1 X174.976 Y218.089 E1.19309
G1 X174.338 Y218.089 E.03271
G1 X157.882 Y201.661 E1.19309
G1 X157.245 Y201.661 E.03271
G1 X173.701 Y218.089 E1.19309
G1 X173.063 Y218.089 E.03271
G1 X156.607 Y201.661 E1.19309
G1 X155.97 Y201.661 E.03271
G1 X172.425 Y218.089 E1.19309
G1 X171.788 Y218.089 E.03271
G1 X155.332 Y201.661 E1.19309
G1 X154.695 Y201.661 E.03271
G1 X171.15 Y218.089 E1.19309
G1 X170.513 Y218.089 E.03271
G1 X154.057 Y201.661 E1.19309
G1 X153.42 Y201.661 E.03271
G1 X169.875 Y218.089 E1.19309
G1 X169.238 Y218.089 E.03271
G1 X152.782 Y201.661 E1.19309
G1 X152.144 Y201.661 E.03271
G1 X168.6 Y218.089 E1.19309
G1 X167.963 Y218.089 E.03271
G1 X151.507 Y201.661 E1.19309
G1 X150.869 Y201.661 E.03271
G1 X167.325 Y218.089 E1.19309
G1 X166.688 Y218.089 E.03271
G1 X150.232 Y201.661 E1.19309
G1 X149.594 Y201.661 E.03271
G1 X166.05 Y218.089 E1.19309
G1 X165.413 Y218.089 E.03271
G1 X148.957 Y201.661 E1.19309
G1 X148.319 Y201.661 E.03271
G1 X164.775 Y218.089 E1.19309
G1 X164.137 Y218.089 E.03271
G1 X147.682 Y201.661 E1.19309
G1 X147.044 Y201.661 E.03271
G1 X163.5 Y218.089 E1.19309
G1 X162.862 Y218.089 E.03271
G1 X146.407 Y201.661 E1.19309
G1 X145.769 Y201.661 E.03271
G1 X162.225 Y218.089 E1.19309
G1 X161.587 Y218.089 E.03271
G1 X145.132 Y201.661 E1.19309
G1 X144.494 Y201.661 E.03271
G1 X160.95 Y218.089 E1.19309
G1 X160.312 Y218.089 E.03271
G1 X143.856 Y201.661 E1.19309
G1 X143.219 Y201.661 E.03271
G1 X159.675 Y218.089 E1.19309
G1 X159.037 Y218.089 E.03271
G1 X142.581 Y201.661 E1.19309
G1 X141.944 Y201.661 E.03271
G1 X158.4 Y218.089 E1.19309
G1 X157.762 Y218.089 E.03271
G1 X141.306 Y201.661 E1.19309
G1 X140.669 Y201.661 E.03271
G1 X157.125 Y218.089 E1.19309
G1 X156.487 Y218.089 E.03271
G1 X140.031 Y201.661 E1.19309
G1 X139.394 Y201.661 E.03271
G1 X155.849 Y218.089 E1.19309
G1 X155.212 Y218.089 E.03271
G1 X138.756 Y201.661 E1.19309
G1 X138.119 Y201.661 E.03271
G1 X154.574 Y218.089 E1.19309
G1 X153.937 Y218.089 E.03271
G1 X137.481 Y201.661 E1.19309
G1 X136.843 Y201.661 E.03271
G1 X153.299 Y218.089 E1.19309
G1 X152.662 Y218.089 E.03271
G1 X136.206 Y201.661 E1.19309
G1 X135.568 Y201.661 E.03271
G1 X152.024 Y218.089 E1.19309
G1 X151.387 Y218.089 E.03271
G1 X134.931 Y201.661 E1.19309
G1 X134.293 Y201.661 E.03271
G1 X150.749 Y218.089 E1.19309
G1 X150.112 Y218.089 E.03271
G1 X133.656 Y201.661 E1.19309
G1 X133.018 Y201.661 E.03271
G1 X149.474 Y218.089 E1.19309
G1 X148.836 Y218.089 E.03271
G1 X132.381 Y201.661 E1.19309
G1 X131.743 Y201.661 E.03271
G1 X148.199 Y218.089 E1.19309
G1 X147.561 Y218.089 E.03271
G1 X131.106 Y201.661 E1.19309
G1 X130.468 Y201.661 E.03271
G1 X146.924 Y218.089 E1.19309
G1 X146.286 Y218.089 E.03271
G1 X129.831 Y201.661 E1.19309
G1 X129.193 Y201.661 E.03271
G1 X145.649 Y218.089 E1.19309
G1 X145.011 Y218.089 E.03271
G1 X128.555 Y201.661 E1.19309
G1 X127.918 Y201.661 E.03271
G1 X144.374 Y218.089 E1.19309
G1 X143.736 Y218.089 E.03271
G1 X127.28 Y201.661 E1.19309
G1 X126.643 Y201.661 E.03271
G1 X143.099 Y218.089 E1.19309
G1 X142.461 Y218.089 E.03271
G1 X126.005 Y201.661 E1.19309
G1 X125.368 Y201.661 E.03271
G1 X141.824 Y218.089 E1.19309
G1 X141.186 Y218.089 E.03271
G1 X124.527 Y201.458 E1.20779
G1 X114.964 Y201.458 F30000
G1 F3000
G1 X124.631 Y211.109 E.70087
G3 X124.439 Y210.281 I3.652 J-1.284 E.04371
G1 X115.805 Y201.661 E.62601
G1 X116.442 Y201.661 E.03271
G1 X124.423 Y209.628 E.57864
G3 X124.506 Y209.074 I2.811 J.136 E.02879
M73 P60 R23
G1 X117.08 Y201.661 E.5384
G1 X117.717 Y201.661 E.03271
G1 X124.654 Y208.586 E.50295
G1 X124.703 Y208.47 E.00648
G3 X124.857 Y208.153 I1.663 J.612 E.01813
G1 X118.355 Y201.661 E.47145
G1 X118.992 Y201.661 E.03271
G1 X125.103 Y207.762 E.44307
G3 X125.392 Y207.413 I4.414 J3.354 E.02322
G1 X119.63 Y201.661 E.41774
G1 X120.267 Y201.661 E.03271
G1 X125.723 Y207.107 E.39554
G3 X126.093 Y206.84 I1.52 J1.719 E.02346
G1 X120.905 Y201.661 E.37616
G1 X121.542 Y201.661 E.03271
G1 X126.504 Y206.615 E.35975
G3 X126.969 Y206.442 I1.548 J3.461 E.02546
G1 X122.18 Y201.661 E.34723
G1 X122.818 Y201.661 E.03271
G1 X127.49 Y206.326 E.33879
G3 X128.099 Y206.297 I.474 J3.533 E.03129
G1 X123.455 Y201.661 E.33667
G1 X124.093 Y201.661 E.03271
G1 X129.127 Y206.687 E.36499
; WIPE_START
G1 X127.711 Y205.274 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.186 Y208.742 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
G1 F3000
G1 X140.548 Y218.089 E.67881
G1 X139.911 Y218.089 E.03271
G1 X131.583 Y209.775 E.60378
G3 X131.548 Y210.377 I-3.741 J.086 E.03096
G1 X139.273 Y218.089 E.56007
G1 X138.636 Y218.089 E.03271
G1 X131.437 Y210.902 E.52196
G3 X131.261 Y211.363 I-4.532 J-1.461 E.02533
G1 X137.998 Y218.089 E.48847
G1 X137.361 Y218.089 E.03271
G1 X131.038 Y211.777 E.45843
G3 X130.773 Y212.149 I-1.995 J-1.137 E.02348
G1 X136.723 Y218.089 E.43139
G1 X136.086 Y218.089 E.03271
G1 X130.466 Y212.479 E.40746
G3 X130.117 Y212.767 I-2.47 J-2.634 E.02323
G1 X135.448 Y218.089 E.38653
G1 X134.811 Y218.089 E.03271
G1 X129.728 Y213.015 E.36848
G3 X129.296 Y213.22 I-2.495 J-4.708 E.02456
G1 X134.173 Y218.089 E.3536
G1 X133.535 Y218.089 E.03271
G1 X128.805 Y213.367 E.34294
G3 X128.255 Y213.453 I-1.021 J-4.711 E.02863
G1 X132.898 Y218.089 E.33666
G1 X132.26 Y218.089 E.03271
G1 X127.602 Y213.439 E.33771
G3 X126.813 Y213.259 I.167 J-2.555 E.04172
G1 X126.766 Y213.241 E.00258
G1 X131.623 Y218.089 E.35212
G1 X130.985 Y218.089 E.03271
G1 X114.53 Y201.661 E1.19309
G1 X113.892 Y201.661 E.03271
G1 X130.348 Y218.089 E1.19309
G1 X129.71 Y218.089 E.03271
G1 X113.254 Y201.661 E1.19309
G1 X112.617 Y201.661 E.03271
G1 X129.073 Y218.089 E1.19309
G1 X128.435 Y218.089 E.03271
G1 X111.979 Y201.661 E1.19309
G1 X111.342 Y201.661 E.03271
G1 X127.798 Y218.089 E1.19309
G1 X127.16 Y218.089 E.03271
G1 X110.704 Y201.661 E1.19309
G1 X110.067 Y201.661 E.03271
G1 X126.523 Y218.089 E1.19309
G1 X125.885 Y218.089 E.03271
G1 X109.429 Y201.661 E1.19309
G1 X108.792 Y201.661 E.03271
G1 X125.247 Y218.089 E1.19309
G1 X124.61 Y218.089 E.03271
G1 X108.154 Y201.661 E1.19309
G1 X107.517 Y201.661 E.03271
G1 X123.972 Y218.089 E1.19309
G1 X123.335 Y218.089 E.03271
G1 X106.879 Y201.661 E1.19309
G1 X106.242 Y201.661 E.03271
G1 X122.697 Y218.089 E1.19309
G1 X122.06 Y218.089 E.03271
G1 X105.604 Y201.661 E1.19309
G1 X104.966 Y201.661 E.03271
G1 X121.422 Y218.089 E1.19309
G1 X120.785 Y218.089 E.03271
G1 X104.329 Y201.661 E1.19309
G1 X103.691 Y201.661 E.03271
G1 X120.147 Y218.089 E1.19309
G1 X119.51 Y218.089 E.03271
G1 X103.054 Y201.661 E1.19309
G1 X102.416 Y201.661 E.03271
G1 X118.872 Y218.089 E1.19309
G1 X118.235 Y218.089 E.03271
G1 X101.779 Y201.661 E1.19309
G1 X101.141 Y201.661 E.03271
G1 X117.597 Y218.089 E1.19309
G1 X116.959 Y218.089 E.03271
G1 X100.504 Y201.661 E1.19309
G1 X99.866 Y201.661 E.03271
M73 P60 R22
G1 X116.322 Y218.089 E1.19309
G1 X115.684 Y218.089 E.03271
G1 X99.229 Y201.661 E1.19309
G1 X98.591 Y201.661 E.03271
G1 X115.047 Y218.089 E1.19309
G1 X114.409 Y218.089 E.03271
G1 X97.953 Y201.661 E1.19309
G1 X97.316 Y201.661 E.03271
G1 X113.772 Y218.089 E1.19309
G1 X113.134 Y218.089 E.03271
G1 X96.678 Y201.661 E1.19309
G1 X96.041 Y201.661 E.03271
G1 X112.497 Y218.089 E1.19309
G1 X111.859 Y218.089 E.03271
G1 X95.403 Y201.661 E1.19309
G1 X94.766 Y201.661 E.03271
G1 X111.222 Y218.089 E1.19309
G1 X110.584 Y218.089 E.03271
G1 X94.128 Y201.661 E1.19309
G1 X93.491 Y201.661 E.03271
G1 X109.946 Y218.089 E1.19309
G1 X109.309 Y218.089 E.03271
G1 X92.853 Y201.661 E1.19309
G1 X92.216 Y201.661 E.03271
G1 X108.671 Y218.089 E1.19309
G1 X108.034 Y218.089 E.03271
G1 X91.578 Y201.661 E1.19309
G1 X90.941 Y201.661 E.03271
G1 X107.396 Y218.089 E1.19309
G1 X106.759 Y218.089 E.03271
G1 X90.303 Y201.661 E1.19309
G1 X89.665 Y201.661 E.03271
G1 X106.121 Y218.089 E1.19309
G1 X105.484 Y218.089 E.03271
G1 X89.028 Y201.661 E1.19309
G1 X88.39 Y201.661 E.03271
G1 X104.846 Y218.089 E1.19309
G1 X104.209 Y218.089 E.03271
G1 X87.753 Y201.661 E1.19309
G1 X87.115 Y201.661 E.03271
G1 X103.571 Y218.089 E1.19309
G1 X102.934 Y218.089 E.03271
G1 X86.478 Y201.661 E1.19309
G1 X85.84 Y201.661 E.03271
G1 X102.296 Y218.089 E1.19309
G1 X101.658 Y218.089 E.03271
G1 X85.203 Y201.661 E1.19309
G1 X84.565 Y201.661 E.03271
G1 X101.021 Y218.089 E1.19309
G1 X100.383 Y218.089 E.03271
G1 X83.928 Y201.661 E1.19309
G1 X83.29 Y201.661 E.03271
G1 X99.746 Y218.089 E1.19309
G1 X99.108 Y218.089 E.03271
G1 X82.652 Y201.661 E1.19309
G1 X82.015 Y201.661 E.03271
G1 X98.471 Y218.089 E1.19309
G1 X97.833 Y218.089 E.03271
G1 X81.377 Y201.661 E1.19309
G1 X80.74 Y201.661 E.03271
G1 X97.196 Y218.089 E1.19309
G1 X96.558 Y218.089 E.03271
G1 X80.102 Y201.661 E1.19309
G1 X79.465 Y201.661 E.03271
G1 X95.921 Y218.089 E1.19309
G1 X95.283 Y218.089 E.03271
G1 X78.827 Y201.661 E1.19309
G1 X78.19 Y201.661 E.03271
G1 X94.646 Y218.089 E1.19309
G1 X94.008 Y218.089 E.03271
G1 X77.552 Y201.661 E1.19309
G1 X76.915 Y201.661 E.03271
G1 X93.37 Y218.089 E1.19309
G1 X92.733 Y218.089 E.03271
G1 X76.277 Y201.661 E1.19309
G1 X75.64 Y201.661 E.03271
G1 X92.095 Y218.089 E1.19309
G1 X91.458 Y218.089 E.03271
G1 X75.002 Y201.661 E1.19309
G1 X74.364 Y201.661 E.03271
G1 X90.82 Y218.089 E1.19309
M73 P61 R22
G1 X90.183 Y218.089 E.03271
G1 X73.727 Y201.661 E1.19309
G1 X73.089 Y201.661 E.03271
G1 X89.545 Y218.089 E1.19309
G1 X88.908 Y218.089 E.03271
G1 X72.452 Y201.661 E1.19309
G1 X71.814 Y201.661 E.03271
G1 X88.27 Y218.089 E1.19309
G1 X87.633 Y218.089 E.03271
G1 X71.177 Y201.661 E1.19309
G1 X70.539 Y201.661 E.03271
G1 X86.995 Y218.089 E1.19309
G1 X86.357 Y218.089 E.03271
G1 X69.902 Y201.661 E1.19309
G1 X69.264 Y201.661 E.03271
G1 X85.72 Y218.089 E1.19309
G1 X85.082 Y218.089 E.03271
G1 X68.627 Y201.661 E1.19309
G1 X67.989 Y201.661 E.03271
G1 X84.445 Y218.089 E1.19309
G1 X83.807 Y218.089 E.03271
G1 X67.352 Y201.661 E1.19309
G1 X66.714 Y201.661 E.03271
G1 X83.17 Y218.089 E1.19309
G1 X82.532 Y218.089 E.03271
G1 X66.076 Y201.661 E1.19309
G1 X65.439 Y201.661 E.03271
G1 X81.895 Y218.089 E1.19309
G1 X81.257 Y218.089 E.03271
G1 X64.801 Y201.661 E1.19309
G1 X64.164 Y201.661 E.03271
G1 X80.62 Y218.089 E1.19309
G1 X79.982 Y218.089 E.03271
G1 X63.526 Y201.661 E1.19309
G1 X62.889 Y201.661 E.03271
G1 X79.345 Y218.089 E1.19309
G1 X78.707 Y218.089 E.03271
G1 X62.251 Y201.661 E1.19309
G1 X61.614 Y201.661 E.03271
G1 X78.069 Y218.089 E1.19309
G1 X77.432 Y218.089 E.03271
G1 X60.976 Y201.661 E1.19309
G1 X60.339 Y201.661 E.03271
G1 X76.794 Y218.089 E1.19309
G1 X76.157 Y218.089 E.03271
G1 X59.701 Y201.661 E1.19309
G1 X59.063 Y201.661 E.03271
G1 X75.519 Y218.089 E1.19309
G1 X74.882 Y218.089 E.03271
G1 X58.426 Y201.661 E1.19309
G1 X57.788 Y201.661 E.03271
G1 X74.244 Y218.089 E1.19309
G1 X73.607 Y218.089 E.03271
G1 X57.151 Y201.661 E1.19309
G1 X56.513 Y201.661 E.03271
G1 X72.969 Y218.089 E1.19309
G1 X72.332 Y218.089 E.03271
G1 X55.876 Y201.661 E1.19309
G1 X55.238 Y201.661 E.03271
G1 X71.694 Y218.089 E1.19309
G1 X71.056 Y218.089 E.03271
G1 X38.036 Y185.124 E2.39407
G1 X38.036 Y185.76 E.03266
G1 X70.419 Y218.089 E2.34785
G1 X69.781 Y218.089 E.03271
G1 X38.036 Y186.397 E2.30163
G1 X38.036 Y187.033 E.03266
G1 X69.144 Y218.089 E2.2554
G1 X68.506 Y218.089 E.03271
G1 X38.036 Y187.67 E2.20918
G1 X38.036 Y188.306 E.03266
G1 X67.869 Y218.089 E2.16296
G1 X67.231 Y218.089 E.03271
G1 X38.036 Y188.943 E2.11673
G1 X38.036 Y189.579 E.03266
G1 X66.594 Y218.089 E2.07051
G1 X65.956 Y218.089 E.03271
G1 X38.036 Y190.216 E2.02429
G1 X38.036 Y190.852 E.03266
G1 X65.319 Y218.089 E1.97806
G1 X64.681 Y218.089 E.03271
G1 X38.036 Y191.489 E1.93184
G1 X38.036 Y192.125 E.03266
G1 X64.044 Y218.089 E1.88562
G1 X63.406 Y218.089 E.03271
G1 X38.036 Y192.762 E1.8394
G1 X38.036 Y193.398 E.03266
G1 X62.768 Y218.089 E1.79317
G1 X62.131 Y218.089 E.03271
G1 X38.036 Y194.035 E1.74695
G1 X38.036 Y194.671 E.03266
G1 X61.493 Y218.089 E1.70073
G1 X60.856 Y218.089 E.03271
G1 X38.036 Y195.308 E1.6545
G1 X38.036 Y195.944 E.03266
G1 X60.218 Y218.089 E1.60828
G1 X59.581 Y218.089 E.03271
G1 X37.833 Y196.378 E1.57674
G1 X37.833 Y184.285 F30000
G1 F3000
G1 X54.464 Y200.888 E1.20576
G1 X54.464 Y200.252 E.03266
G1 X38.036 Y183.851 E1.19108
G1 X38.036 Y183.215 E.03266
G1 X54.464 Y199.615 E1.19108
G1 X54.464 Y198.979 E.03266
G1 X38.036 Y182.578 E1.19108
G1 X38.036 Y181.942 E.03266
G1 X54.464 Y198.342 E1.19108
G1 X54.464 Y197.706 E.03266
G1 X38.036 Y181.305 E1.19108
G1 X38.036 Y180.669 E.03266
G1 X54.464 Y197.069 E1.19108
G1 X54.464 Y196.433 E.03266
G1 X38.036 Y180.032 E1.19108
G1 X38.036 Y179.396 E.03266
G1 X54.464 Y195.796 E1.19108
G1 X54.464 Y195.16 E.03266
G1 X38.036 Y178.759 E1.19108
G1 X38.036 Y178.123 E.03266
G1 X54.464 Y194.523 E1.19108
G1 X54.464 Y193.887 E.03266
G1 X38.036 Y177.486 E1.19108
G1 X38.036 Y176.85 E.03266
G1 X54.464 Y193.25 E1.19108
G1 X54.464 Y192.614 E.03266
G1 X38.036 Y176.213 E1.19108
G1 X38.036 Y175.577 E.03266
M73 P62 R22
G1 X54.464 Y191.977 E1.19108
G1 X54.464 Y191.341 E.03266
G1 X38.036 Y174.941 E1.19108
G1 X38.036 Y174.304 E.03266
G1 X54.464 Y190.705 E1.19108
G1 X54.464 Y190.068 E.03266
G1 X38.036 Y173.668 E1.19108
G1 X38.036 Y173.031 E.03266
G1 X54.464 Y189.432 E1.19108
G1 X54.464 Y188.795 E.03266
G1 X38.036 Y172.395 E1.19108
G1 X38.036 Y171.758 E.03266
G1 X54.464 Y188.159 E1.19108
G1 X54.464 Y187.522 E.03266
G1 X38.036 Y171.122 E1.19108
G1 X38.036 Y170.485 E.03266
G1 X54.464 Y186.886 E1.19108
G1 X54.464 Y186.249 E.03266
M73 P62 R21
G1 X38.036 Y169.849 E1.19108
G1 X38.036 Y169.212 E.03266
G1 X54.464 Y185.613 E1.19108
G1 X54.464 Y184.976 E.03266
G1 X38.036 Y168.576 E1.19108
G1 X38.036 Y167.939 E.03266
G1 X54.464 Y184.34 E1.19108
G1 X54.464 Y183.703 E.03266
G1 X38.036 Y167.303 E1.19108
G1 X38.036 Y166.666 E.03266
G1 X54.464 Y183.067 E1.19108
G1 X54.464 Y182.43 E.03266
G1 X38.036 Y166.03 E1.19108
G1 X38.036 Y165.393 E.03266
G1 X54.464 Y181.794 E1.19108
G1 X54.464 Y181.158 E.03266
G1 X38.036 Y164.757 E1.19108
G1 X38.036 Y164.121 E.03266
G1 X54.464 Y180.521 E1.19108
G1 X54.464 Y179.885 E.03266
G1 X38.036 Y163.484 E1.19108
G1 X38.036 Y162.848 E.03266
G1 X54.464 Y179.248 E1.19108
G1 X54.464 Y178.612 E.03266
G1 X38.036 Y162.211 E1.19108
G1 X38.036 Y161.575 E.03266
G1 X54.464 Y177.975 E1.19108
G1 X54.464 Y177.339 E.03266
G1 X38.036 Y160.938 E1.19108
G1 X38.036 Y160.302 E.03266
G1 X54.464 Y176.702 E1.19108
G1 X54.464 Y176.066 E.03266
G1 X38.036 Y159.665 E1.19108
G1 X38.036 Y159.029 E.03266
G1 X54.464 Y175.429 E1.19108
G1 X54.464 Y174.793 E.03266
G1 X38.036 Y158.392 E1.19108
G1 X38.036 Y157.756 E.03266
G1 X54.464 Y174.156 E1.19108
G1 X54.464 Y173.52 E.03266
G1 X38.036 Y157.119 E1.19108
G1 X38.036 Y156.483 E.03266
G1 X54.464 Y172.883 E1.19108
G1 X54.464 Y172.247 E.03266
G1 X38.036 Y155.846 E1.19108
G1 X38.036 Y155.21 E.03266
G1 X54.464 Y171.61 E1.19108
G1 X54.464 Y170.974 E.03266
G1 X38.036 Y154.573 E1.19108
G1 X38.036 Y153.937 E.03266
G1 X54.464 Y170.338 E1.19108
G1 X54.464 Y169.701 E.03266
G1 X38.036 Y153.301 E1.19108
G1 X38.036 Y152.664 E.03266
G1 X54.464 Y169.065 E1.19108
G1 X54.464 Y168.428 E.03266
G1 X38.036 Y152.028 E1.19108
G1 X38.036 Y151.391 E.03266
G1 X54.464 Y167.792 E1.19108
G1 X54.464 Y167.155 E.03266
G1 X38.036 Y150.755 E1.19108
G1 X38.036 Y150.118 E.03266
G1 X54.464 Y166.519 E1.19108
G1 X54.464 Y165.882 E.03266
G1 X38.036 Y149.482 E1.19108
G1 X38.036 Y148.845 E.03266
G1 X54.464 Y165.246 E1.19108
G1 X54.464 Y164.609 E.03266
G1 X38.036 Y148.209 E1.19108
G1 X38.036 Y147.572 E.03266
G1 X54.464 Y163.973 E1.19108
G1 X54.464 Y163.336 E.03266
G1 X38.036 Y146.936 E1.19108
G1 X38.036 Y146.299 E.03266
G1 X54.464 Y162.7 E1.19108
G1 X54.464 Y162.063 E.03266
G1 X38.036 Y145.663 E1.19108
G1 X38.036 Y145.026 E.03266
G1 X54.464 Y161.427 E1.19108
G1 X54.464 Y160.791 E.03266
G1 X38.036 Y144.39 E1.19108
G1 X38.036 Y143.754 E.03266
G1 X54.464 Y160.154 E1.19108
G1 X54.464 Y159.518 E.03266
G1 X38.036 Y143.117 E1.19108
G1 X38.036 Y142.481 E.03266
G1 X54.464 Y158.881 E1.19108
G1 X54.464 Y158.245 E.03266
G1 X38.036 Y141.844 E1.19108
G1 X38.036 Y141.208 E.03266
G1 X54.464 Y157.608 E1.19108
G1 X54.464 Y156.972 E.03266
G1 X38.036 Y140.571 E1.19108
G1 X38.036 Y139.935 E.03266
G1 X54.464 Y156.335 E1.19108
G1 X54.464 Y155.699 E.03266
G1 X38.036 Y139.298 E1.19108
G1 X38.036 Y138.662 E.03266
G1 X54.464 Y155.062 E1.19108
G1 X54.464 Y154.426 E.03266
G1 X38.036 Y138.025 E1.19108
G1 X38.036 Y137.389 E.03266
G1 X54.464 Y153.789 E1.19108
G1 X54.464 Y153.153 E.03266
G1 X38.036 Y136.752 E1.19108
G1 X38.036 Y136.116 E.03266
G1 X54.464 Y152.516 E1.19108
G1 X54.464 Y151.88 E.03266
G1 X38.036 Y135.479 E1.19108
G1 X38.036 Y134.843 E.03266
G1 X54.464 Y151.243 E1.19108
G1 X54.464 Y150.607 E.03266
G1 X38.036 Y134.206 E1.19108
G1 X38.036 Y133.57 E.03266
G1 X54.464 Y149.971 E1.19108
G1 X54.464 Y149.334 E.03266
G1 X38.036 Y132.934 E1.19108
G1 X38.036 Y132.297 E.03266
G1 X54.464 Y148.698 E1.19108
M73 P63 R21
G1 X54.464 Y148.061 E.03266
G1 X38.036 Y131.661 E1.19108
G1 X38.036 Y131.024 E.03266
G1 X54.464 Y147.425 E1.19108
G1 X54.464 Y146.788 E.03266
G1 X38.036 Y130.388 E1.19108
G1 X38.036 Y129.751 E.03266
G1 X54.464 Y146.152 E1.19108
G1 X54.464 Y145.515 E.03266
G1 X38.036 Y129.115 E1.19108
G1 X38.036 Y128.478 E.03266
G1 X54.464 Y144.879 E1.19108
G1 X54.464 Y144.242 E.03266
G1 X38.036 Y127.842 E1.19108
G1 X38.036 Y127.205 E.03266
G1 X54.464 Y143.606 E1.19108
G1 X54.464 Y142.969 E.03266
G1 X38.036 Y126.569 E1.19108
G1 X38.036 Y125.932 E.03266
G1 X54.464 Y142.333 E1.19108
G1 X54.464 Y141.696 E.03266
G1 X38.036 Y125.296 E1.19108
G1 X38.036 Y124.659 E.03266
G1 X54.464 Y141.06 E1.19108
G1 X54.464 Y140.424 E.03266
G1 X38.036 Y124.023 E1.19108
G1 X38.036 Y123.387 E.03266
G1 X54.464 Y139.787 E1.19108
G1 X54.464 Y139.151 E.03266
G1 X38.036 Y122.75 E1.19108
G1 X38.036 Y122.114 E.03266
G1 X42.762 Y126.832 E.34265
G1 X42.702 Y126.54 E.01528
G3 X42.666 Y126.1 I2.184 J-.401 E.0227
G1 X38.036 Y121.477 E.33571
G1 X38.036 Y120.841 E.03266
G1 X42.699 Y125.496 E.33807
G3 X42.816 Y124.976 I4.442 J.724 E.02736
G1 X38.036 Y120.204 E.34654
G1 X38.036 Y119.568 E.03266
G1 X42.988 Y124.512 E.35906
G1 X43.014 Y124.45 E.00342
G3 X43.21 Y124.097 I8.168 J4.3 E.02074
G1 X38.036 Y118.931 E.37515
G1 X38.036 Y118.295 E.03266
G1 X43.478 Y123.728 E.39458
G3 X43.785 Y123.398 I1.801 J1.368 E.02316
G1 X38.036 Y117.658 E.41684
G1 X38.036 Y117.022 E.03266
G1 X44.131 Y123.106 E.44189
G3 X44.521 Y122.859 I3.013 J4.326 E.0237
G1 X38.036 Y116.385 E.47017
G1 X38.036 Y115.749 E.03266
G1 X44.957 Y122.658 E.50176
G3 X45.441 Y122.505 I1.007 J2.344 E.0261
G1 X38.036 Y115.112 E.53687
G1 X38.036 Y114.476 E.03266
G1 X45.998 Y122.425 E.5773
G1 X46.05 Y122.423 E.00263
G3 X46.649 Y122.438 I.239 J2.346 E.03085
G1 X38.036 Y113.839 E.62449
G1 X38.036 Y113.203 E.03266
G1 X47.482 Y122.633 E.68488
G3 X49.612 Y124.76 I-1.282 J3.414 E.1592
G1 X54.464 Y129.604 E.35176
G1 X54.464 Y130.24 E.03266
G1 X49.813 Y125.597 E.33718
G3 X49.826 Y126.246 I-4.127 J.404 E.03333
G1 X54.464 Y130.876 E.33628
G1 X54.464 Y131.513 E.03266
G1 X49.744 Y126.801 E.34221
G3 X49.595 Y127.288 I-2.513 J-.503 E.0262
G1 X54.464 Y132.149 E.35303
G1 X54.464 Y132.786 E.03266
G1 X49.395 Y127.726 E.3675
G3 X49.145 Y128.113 I-2.06 J-1.056 E.02368
G1 X54.464 Y133.422 E.38561
G1 X54.464 Y134.059 E.03266
G1 X48.856 Y128.46 E.4066
G3 X48.528 Y128.769 I-1.706 J-1.482 E.02316
G1 X54.464 Y134.695 E.43038
G1 X54.464 Y135.332 E.03266
G1 X48.158 Y129.036 E.45719
G3 X47.743 Y129.258 I-1.593 J-2.485 E.02419
G1 X54.464 Y135.968 E.48732
G1 X54.464 Y136.605 E.03266
G1 X47.281 Y129.434 E.52076
G3 X46.758 Y129.548 I-1.135 J-3.953 E.0275
G1 X54.464 Y137.241 E.55871
G1 X54.464 Y137.878 E.03266
G1 X46.159 Y129.587 E.6021
G3 X45.426 Y129.491 I.237 J-4.662 E.03801
G1 X54.667 Y138.716 E.66999
; WIPE_START
G1 X53.251 Y137.303 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X49.238 Y130.811 Z2.6 F30000
G1 X37.833 Y112.364 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F3000
G1 X54.464 Y128.967 E1.20576
G1 X54.464 Y128.331 E.03266
G1 X38.036 Y111.93 E1.19108
G1 X38.036 Y111.294 E.03266
G1 X54.464 Y127.694 E1.19108
G1 X54.464 Y127.058 E.03266
G1 X38.036 Y110.657 E1.19108
G1 X38.036 Y110.021 E.03266
G1 X54.464 Y126.421 E1.19108
G1 X54.464 Y125.785 E.03266
G1 X38.036 Y109.384 E1.19108
G1 X38.036 Y108.748 E.03266
G1 X54.464 Y125.148 E1.19108
G1 X54.464 Y124.512 E.03266
G1 X38.036 Y108.111 E1.19108
G1 X38.036 Y107.475 E.03266
G1 X54.464 Y123.875 E1.19108
G1 X54.464 Y123.239 E.03266
G1 X38.036 Y106.838 E1.19108
G1 X38.036 Y106.202 E.03266
G1 X54.464 Y122.602 E1.19108
G1 X54.464 Y121.966 E.03266
G1 X38.036 Y105.565 E1.19108
G1 X38.036 Y104.929 E.03266
G1 X54.464 Y121.329 E1.19108
G1 X54.464 Y120.693 E.03266
G1 X38.036 Y104.292 E1.19108
G1 X38.036 Y103.656 E.03266
G1 X54.464 Y120.056 E1.19108
G1 X54.464 Y119.42 E.03266
G1 X38.036 Y103.02 E1.19108
G1 X38.036 Y102.383 E.03266
G1 X54.464 Y118.784 E1.19108
G1 X54.464 Y118.147 E.03266
G1 X38.036 Y101.747 E1.19108
G1 X38.036 Y101.11 E.03266
G1 X54.464 Y117.511 E1.19108
G1 X54.464 Y116.874 E.03266
G1 X38.036 Y100.474 E1.19108
G1 X38.036 Y99.837 E.03266
G1 X54.464 Y116.238 E1.19108
G1 X54.464 Y115.601 E.03266
G1 X38.036 Y99.201 E1.19108
G1 X38.036 Y98.564 E.03266
G1 X54.464 Y114.965 E1.19108
G1 X54.464 Y114.328 E.03266
G1 X38.036 Y97.928 E1.19108
G1 X38.036 Y97.291 E.03266
G1 X54.464 Y113.692 E1.19108
G1 X54.464 Y113.055 E.03266
G1 X38.036 Y96.655 E1.19108
G1 X38.036 Y96.018 E.03266
G1 X54.464 Y112.419 E1.19108
G1 X54.464 Y111.782 E.03266
G1 X38.036 Y95.382 E1.19108
G1 X38.036 Y94.745 E.03266
G1 X54.464 Y111.146 E1.19108
G1 X54.464 Y110.509 E.03266
G1 X38.036 Y94.109 E1.19108
G1 X38.036 Y93.472 E.03266
G1 X54.464 Y109.873 E1.19108
G1 X54.464 Y109.237 E.03266
G1 X38.036 Y92.836 E1.19108
G1 X38.036 Y92.2 E.03266
G1 X54.464 Y108.6 E1.19108
G1 X54.464 Y107.964 E.03266
G1 X38.036 Y91.563 E1.19108
G1 X38.036 Y90.927 E.03266
G1 X54.464 Y107.327 E1.19108
G1 X54.464 Y106.691 E.03266
G1 X38.036 Y90.29 E1.19108
G1 X38.036 Y89.654 E.03266
G1 X54.464 Y106.054 E1.19108
G1 X54.464 Y105.418 E.03266
G1 X38.036 Y89.017 E1.19108
M73 P63 R20
G1 X38.036 Y88.381 E.03266
G1 X54.464 Y104.781 E1.19108
G1 X54.464 Y104.145 E.03266
G1 X38.036 Y87.744 E1.19108
G1 X38.036 Y87.108 E.03266
G1 X54.464 Y103.508 E1.19108
G1 X54.464 Y102.872 E.03266
G1 X38.036 Y86.471 E1.19108
G1 X38.036 Y85.835 E.03266
G1 X54.464 Y102.235 E1.19108
G1 X54.464 Y101.599 E.03266
G1 X38.036 Y85.198 E1.19108
G1 X38.036 Y84.562 E.03266
G1 X54.464 Y100.962 E1.19108
M73 P64 R20
G1 X54.464 Y100.326 E.03266
G1 X38.036 Y83.925 E1.19108
G1 X38.036 Y83.289 E.03266
G1 X54.464 Y99.689 E1.19108
G1 X54.464 Y99.053 E.03266
G1 X38.036 Y82.652 E1.19108
G1 X38.036 Y82.016 E.03266
G1 X54.464 Y98.417 E1.19108
G1 X54.464 Y97.78 E.03266
G1 X38.036 Y81.38 E1.19108
G1 X38.036 Y80.743 E.03266
G1 X54.464 Y97.144 E1.19108
G1 X54.464 Y96.507 E.03266
G1 X38.036 Y80.107 E1.19108
G1 X38.036 Y79.47 E.03266
G1 X54.464 Y95.871 E1.19108
G1 X54.464 Y95.234 E.03266
G1 X38.036 Y78.834 E1.19108
G1 X38.036 Y78.197 E.03266
G1 X54.464 Y94.598 E1.19108
G1 X54.464 Y93.961 E.03266
G1 X38.036 Y77.561 E1.19108
G1 X38.036 Y76.924 E.03266
G1 X54.464 Y93.325 E1.19108
G1 X54.464 Y92.688 E.03266
G1 X38.036 Y76.288 E1.19108
G1 X38.036 Y75.651 E.03266
G1 X54.464 Y92.052 E1.19108
G1 X54.464 Y91.415 E.03266
G1 X38.036 Y75.015 E1.19108
G1 X38.036 Y74.378 E.03266
G1 X54.464 Y90.779 E1.19108
G1 X54.464 Y90.142 E.03266
G1 X38.036 Y73.742 E1.19108
G1 X38.036 Y73.105 E.03266
G1 X54.464 Y89.506 E1.19108
G1 X54.464 Y88.87 E.03266
G1 X38.036 Y72.469 E1.19108
G1 X38.036 Y71.833 E.03266
G1 X54.464 Y88.233 E1.19108
G1 X54.464 Y87.597 E.03266
G1 X38.036 Y71.196 E1.19108
G1 X38.036 Y70.56 E.03266
G1 X54.464 Y86.96 E1.19108
G1 X54.464 Y86.324 E.03266
G1 X38.036 Y69.923 E1.19108
G1 X38.036 Y69.287 E.03266
G1 X54.464 Y85.687 E1.19108
G1 X54.464 Y85.051 E.03266
G1 X38.036 Y68.65 E1.19108
G1 X38.036 Y68.014 E.03266
G1 X54.464 Y84.414 E1.19108
G1 X54.464 Y83.778 E.03266
G1 X38.036 Y67.377 E1.19108
G1 X38.036 Y66.741 E.03266
G1 X54.464 Y83.141 E1.19108
G1 X54.464 Y82.505 E.03266
G1 X38.036 Y66.104 E1.19108
G1 X38.036 Y65.468 E.03266
G1 X54.464 Y81.868 E1.19108
G1 X54.464 Y81.232 E.03266
G1 X38.036 Y64.831 E1.19108
G1 X38.036 Y64.195 E.03266
G1 X54.464 Y80.595 E1.19108
G1 X54.464 Y79.959 E.03266
G1 X38.036 Y63.558 E1.19108
G1 X38.036 Y62.922 E.03266
G1 X54.464 Y79.322 E1.19108
G1 X54.464 Y78.686 E.03266
G1 X38.036 Y62.285 E1.19108
G1 X38.036 Y61.649 E.03266
G1 X54.464 Y78.05 E1.19108
G1 X54.464 Y77.413 E.03266
G1 X38.036 Y61.013 E1.19108
G1 X38.036 Y60.376 E.03266
G1 X54.464 Y76.777 E1.19108
G1 X54.464 Y76.14 E.03266
G1 X38.036 Y59.74 E1.19108
G1 X38.036 Y59.103 E.03266
G1 X54.464 Y75.504 E1.19108
G1 X54.464 Y74.867 E.03266
G1 X38.036 Y58.467 E1.19108
G1 X38.036 Y57.83 E.03266
G1 X54.464 Y74.231 E1.19108
G1 X54.464 Y73.594 E.03266
G1 X38.036 Y57.194 E1.19108
G1 X38.036 Y56.557 E.03266
G1 X54.464 Y72.958 E1.19108
G1 X54.464 Y72.321 E.03266
G1 X38.036 Y55.921 E1.19108
G1 X38.036 Y55.284 E.03266
G1 X54.464 Y71.685 E1.19108
G1 X54.464 Y71.048 E.03266
G1 X38.036 Y54.648 E1.19108
G1 X38.036 Y54.011 E.03266
G1 X54.464 Y70.412 E1.19108
G1 X54.464 Y69.775 E.03266
G1 X38.036 Y53.375 E1.19108
G1 X38.036 Y52.738 E.03266
G1 X54.464 Y69.139 E1.19108
G1 X54.464 Y68.502 E.03266
G1 X38.036 Y52.102 E1.19108
G1 X38.036 Y51.466 E.03266
G1 X54.464 Y67.866 E1.19108
G1 X54.464 Y67.23 E.03266
G1 X38.036 Y50.829 E1.19108
G1 X38.036 Y50.193 E.03266
G1 X54.464 Y66.593 E1.19108
G1 X54.464 Y65.957 E.03266
G1 X38.036 Y49.556 E1.19108
G1 X38.036 Y48.92 E.03266
G1 X54.464 Y65.32 E1.19108
G1 X54.464 Y64.684 E.03266
G1 X38.036 Y48.283 E1.19108
G1 X38.036 Y47.647 E.03266
G1 X54.464 Y64.047 E1.19108
G1 X54.464 Y63.411 E.03266
G1 X38.036 Y47.01 E1.19108
G1 X38.036 Y46.374 E.03266
G1 X54.464 Y62.774 E1.19108
G1 X54.464 Y62.138 E.03266
G1 X38.036 Y45.737 E1.19108
G1 X38.036 Y45.101 E.03266
G1 X54.464 Y61.501 E1.19108
G1 X54.464 Y60.865 E.03266
G1 X38.036 Y44.464 E1.19108
G1 X38.036 Y43.828 E.03266
G1 X54.464 Y60.228 E1.19108
G1 X54.464 Y59.592 E.03266
G1 X38.036 Y43.191 E1.19108
G1 X38.036 Y42.555 E.03266
G1 X54.464 Y58.955 E1.19108
G1 X54.464 Y58.319 E.03266
G1 X38.036 Y41.918 E1.19108
G1 X38.036 Y41.282 E.03266
G1 X54.464 Y57.683 E1.19108
G1 X54.464 Y57.046 E.03266
G1 X38.036 Y40.646 E1.19108
G1 X38.036 Y40.009 E.03266
G1 X54.464 Y56.41 E1.19108
G1 X54.464 Y55.773 E.03266
G1 X38.036 Y39.373 E1.19108
G1 X38.036 Y38.736 E.03266
G1 X54.464 Y55.137 E1.19108
M73 P65 R20
G1 X54.464 Y54.5 E.03266
G1 X45.598 Y45.649 E.64281
G2 X46.295 Y45.709 I.657 J-3.568 E.03597
G1 X54.464 Y53.864 E.59226
G1 X54.464 Y53.227 E.03266
G1 X46.881 Y45.657 E.5498
G2 X47.385 Y45.524 I-.528 J-3.031 E.0268
G1 X54.464 Y52.591 E.51322
G1 X54.464 Y51.954 E.03266
G1 X47.838 Y45.34 E.48037
G2 X48.242 Y45.106 I-2.3 J-4.444 E.02394
G1 X54.464 Y51.318 E.4511
G1 X54.464 Y50.681 E.03266
G1 X48.602 Y44.829 E.42502
G2 X48.923 Y44.513 I-1.418 J-1.761 E.02315
G1 X54.759 Y50.339 E.42311
G1 X55.396 Y50.339 E.03271
G1 X49.205 Y44.159 E.44885
G2 X49.441 Y43.758 I-4.789 J-3.089 E.02388
G1 X56.034 Y50.339 E.47797
G1 X56.671 Y50.339 E.03271
G1 X49.632 Y43.311 E.51038
G2 X49.77 Y42.813 I-4.489 J-1.517 E.02654
G1 X57.309 Y50.339 E.54655
G1 X57.946 Y50.339 E.03271
G1 X49.832 Y42.239 E.58828
G2 X49.789 Y41.559 I-7.289 J.127 E.03498
G1 X58.584 Y50.339 E.63767
G1 X59.221 Y50.339 E.03271
G1 X49.518 Y40.652 E.7035
G1 X49.407 Y40.421 E.01318
G2 X47.72 Y38.856 I-3.246 J1.809 E.12004
G1 X42.766 Y33.911 E.35917
G1 X42.128 Y33.911 E.03271
G1 X46.808 Y38.583 E.33932
G1 X46.706 Y38.57 E.00531
G2 X46.135 Y38.547 I-.375 J2.211 E.02939
G1 X41.491 Y33.911 E.33672
G1 X40.853 Y33.911 E.03271
G1 X45.558 Y38.608 E.34112
G2 X45.056 Y38.744 I.86 J4.178 E.02668
G1 X40.216 Y33.911 E.35097
G1 X39.578 Y33.911 E.03271
G1 X44.613 Y38.937 E.36503
G2 X44.213 Y39.175 I.986 J2.116 E.0239
G1 X38.94 Y33.911 E.38227
G1 X38.303 Y33.911 E.03271
G1 X43.856 Y39.454 E.40258
G1 X43.751 Y39.557 E.00752
G2 X43.542 Y39.777 I1 J1.156 E.01563
G1 X38.036 Y34.281 E.39918
G1 X38.036 Y34.917 E.03266
G1 X43.267 Y40.139 E.37923
G2 X43.032 Y40.541 I1.893 J1.375 E.02393
G1 X38.036 Y35.554 E.36221
G1 X38.036 Y36.19 E.03266
G1 X42.848 Y40.995 E.34891
G2 X42.72 Y41.503 I2.822 J.986 E.02692
G1 X38.036 Y36.827 E.33958
G1 X38.036 Y37.463 E.03266
G1 X42.666 Y42.086 E.33571
G2 X42.727 Y42.783 I3.717 J.028 E.03594
G1 X37.833 Y37.898 E.35478
G1 X43.2 Y33.708 F30000
G1 F3000
G1 X59.859 Y50.339 E1.20779
G1 X60.497 Y50.339 E.03271
G1 X44.041 Y33.911 E1.19309
G1 X44.678 Y33.911 E.03271
G1 X61.134 Y50.339 E1.19309
G1 X61.772 Y50.339 E.03271
G1 X45.316 Y33.911 E1.19309
G1 X45.953 Y33.911 E.03271
G1 X62.409 Y50.339 E1.19309
G1 X63.047 Y50.339 E.03271
G1 X46.591 Y33.911 E1.19309
G1 X47.228 Y33.911 E.03271
G1 X63.684 Y50.339 E1.19309
G1 X64.322 Y50.339 E.03271
G1 X47.866 Y33.911 E1.19309
G1 X48.504 Y33.911 E.03271
G1 X64.959 Y50.339 E1.19309
G1 X65.597 Y50.339 E.03271
G1 X49.141 Y33.911 E1.19309
G1 X49.779 Y33.911 E.03271
G1 X66.234 Y50.339 E1.19309
G1 X66.872 Y50.339 E.03271
G1 X50.416 Y33.911 E1.19309
G1 X51.054 Y33.911 E.03271
G1 X67.51 Y50.339 E1.19309
G1 X68.147 Y50.339 E.03271
G1 X51.691 Y33.911 E1.19309
G1 X52.329 Y33.911 E.03271
G1 X68.785 Y50.339 E1.19309
G1 X69.422 Y50.339 E.03271
G1 X52.966 Y33.911 E1.19309
G1 X53.604 Y33.911 E.03271
G1 X70.06 Y50.339 E1.19309
G1 X70.697 Y50.339 E.03271
G1 X54.241 Y33.911 E1.19309
G1 X54.879 Y33.911 E.03271
G1 X71.335 Y50.339 E1.19309
G1 X71.972 Y50.339 E.03271
G1 X55.517 Y33.911 E1.19309
G1 X56.154 Y33.911 E.03271
G1 X72.61 Y50.339 E1.19309
G1 X73.247 Y50.339 E.03271
G1 X56.792 Y33.911 E1.19309
G1 X57.429 Y33.911 E.03271
G1 X73.885 Y50.339 E1.19309
G1 X74.522 Y50.339 E.03271
G1 X58.067 Y33.911 E1.19309
G1 X58.704 Y33.911 E.03271
G1 X75.16 Y50.339 E1.19309
G1 X75.798 Y50.339 E.03271
G1 X59.342 Y33.911 E1.19309
G1 X59.979 Y33.911 E.03271
G1 X76.435 Y50.339 E1.19309
G1 X77.073 Y50.339 E.03271
G1 X60.617 Y33.911 E1.19309
G1 X61.254 Y33.911 E.03271
G1 X77.71 Y50.339 E1.19309
G1 X78.348 Y50.339 E.03271
G1 X61.892 Y33.911 E1.19309
G1 X62.529 Y33.911 E.03271
G1 X78.985 Y50.339 E1.19309
G1 X79.623 Y50.339 E.03271
G1 X63.167 Y33.911 E1.19309
G1 X63.805 Y33.911 E.03271
G1 X80.26 Y50.339 E1.19309
M73 P65 R19
G1 X80.898 Y50.339 E.03271
G1 X64.442 Y33.911 E1.19309
G1 X65.08 Y33.911 E.03271
G1 X81.535 Y50.339 E1.19309
G1 X82.173 Y50.339 E.03271
G1 X65.717 Y33.911 E1.19309
G1 X66.355 Y33.911 E.03271
G1 X82.81 Y50.339 E1.19309
G1 X83.448 Y50.339 E.03271
G1 X66.992 Y33.911 E1.19309
G1 X67.63 Y33.911 E.03271
G1 X84.086 Y50.339 E1.19309
G1 X84.723 Y50.339 E.03271
G1 X68.267 Y33.911 E1.19309
G1 X68.905 Y33.911 E.03271
G1 X85.361 Y50.339 E1.19309
G1 X85.998 Y50.339 E.03271
G1 X69.542 Y33.911 E1.19309
G1 X70.18 Y33.911 E.03271
G1 X86.636 Y50.339 E1.19309
G1 X87.273 Y50.339 E.03271
G1 X70.817 Y33.911 E1.19309
G1 X71.455 Y33.911 E.03271
G1 X87.911 Y50.339 E1.19309
G1 X88.548 Y50.339 E.03271
G1 X72.093 Y33.911 E1.19309
G1 X72.73 Y33.911 E.03271
G1 X89.186 Y50.339 E1.19309
G1 X89.823 Y50.339 E.03271
G1 X73.368 Y33.911 E1.19309
G1 X74.005 Y33.911 E.03271
G1 X90.461 Y50.339 E1.19309
G1 X91.099 Y50.339 E.03271
G1 X74.643 Y33.911 E1.19309
G1 X75.28 Y33.911 E.03271
G1 X91.736 Y50.339 E1.19309
G1 X92.374 Y50.339 E.03271
G1 X75.918 Y33.911 E1.19309
G1 X76.555 Y33.911 E.03271
G1 X86.327 Y43.666 E.70845
G1 X86.645 Y43.347 E.02311
G1 X77.193 Y33.911 E.68532
G1 X77.83 Y33.911 E.03271
G1 X86.964 Y43.029 E.66219
G1 X87.282 Y42.71 E.02311
G1 X78.468 Y33.911 E.63906
G1 X79.106 Y33.911 E.03271
G1 X87.601 Y42.392 E.61592
G1 X87.919 Y42.073 E.02311
G1 X79.743 Y33.911 E.59279
G1 X80.381 Y33.911 E.03271
G1 X88.238 Y41.755 E.56966
G1 X88.556 Y41.436 E.02311
G1 X81.018 Y33.911 E.54653
M73 P66 R19
G1 X81.656 Y33.911 E.03271
G1 X88.875 Y41.118 E.5234
G1 X89.132 Y40.861 E.01867
G1 X89.667 Y41.396 E.03882
G1 X89.667 Y41.272 E.00634
G1 X82.293 Y33.911 E.5346
G1 X82.931 Y33.911 E.03271
G1 X89.666 Y40.635 E.48831
G1 X89.665 Y39.997 E.03271
G1 X83.568 Y33.911 E.44202
G1 X84.206 Y33.911 E.03271
G1 X89.664 Y39.36 E.39573
G1 X89.663 Y38.722 E.03271
G1 X84.843 Y33.911 E.34943
G1 X85.481 Y33.911 E.03271
G1 X89.662 Y38.085 E.30314
G1 X89.661 Y37.448 E.03271
G1 X86.118 Y33.911 E.25685
G1 X86.756 Y33.911 E.03271
G1 X89.83 Y36.98 E.2229
G1 X90.149 Y36.662 E.02311
G1 X87.394 Y33.911 E.19977
G1 X88.031 Y33.911 E.03271
G1 X90.659 Y36.534 E.19053
G1 X91.297 Y36.535 E.03274
G1 X88.669 Y33.911 E.19056
G1 X89.306 Y33.911 E.03271
G1 X91.935 Y36.535 E.1906
G1 X92.573 Y36.536 E.03274
G1 X89.944 Y33.911 E.19064
G1 X90.581 Y33.911 E.03271
G1 X91.741 Y35.069 E.08412
G1 X92.06 Y34.751 E.02311
G1 X91.219 Y33.911 E.06099
G1 X91.856 Y33.911 E.03271
G1 X92.378 Y34.432 E.03785
G1 X92.697 Y34.114 E.02311
G1 X92.291 Y33.708 E.02943
G1 X93.566 Y33.708 F30000
G1 F3000
G1 X95.563 Y35.702 E.1448
G1 X95.882 Y35.384 E.02311
G1 X94.406 Y33.911 E.10696
G1 X95.044 Y33.911 E.03271
G1 X96.2 Y35.065 E.08383
G1 X96.519 Y34.747 E.02311
G1 X95.682 Y33.911 E.0607
G1 X96.319 Y33.911 E.03271
G1 X96.837 Y34.428 E.03756
G1 X97.156 Y34.11 E.02311
G1 X96.754 Y33.708 E.02914
G1 X102.042 Y37.151 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42123
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X98.765 Y33.874 E.14287
G1 X98.23 Y33.874 E.01649
G1 X101.655 Y37.299 E.1493
G1 X101.387 Y37.566 E.01166
G1 X97.836 Y34.015 E.15484
G1 X97.568 Y34.282 E.01166
G1 X101.12 Y37.834 E.15484
G1 X100.852 Y38.101 E.01166
G1 X97.301 Y34.55 E.15484
G1 X97.033 Y34.817 E.01166
G1 X100.585 Y38.369 E.15484
G1 X100.317 Y38.636 E.01166
G1 X96.766 Y35.085 E.15484
G1 X96.498 Y35.352 E.01166
G1 X100.05 Y38.904 E.15484
G1 X99.782 Y39.171 E.01166
G1 X96.231 Y35.62 E.15484
G1 X95.963 Y35.887 E.01166
G1 X99.515 Y39.439 E.15484
G1 X99.247 Y39.706 E.01166
G1 X95.696 Y36.155 E.15484
G1 X95.428 Y36.422 E.01166
G1 X98.98 Y39.974 E.15484
G1 X98.934 Y40.02 E.002
G1 X100.048 Y41.134 E.04855
G1 X99.826 Y41.355 E.00966
G1 X92.933 Y34.462 E.3005
G1 X92.666 Y34.73 E.01166
G1 X98.882 Y40.946 E.27099
G1 X98.793 Y41.392 E.01403
G1 X92.398 Y34.997 E.27879
G1 X92.131 Y35.265 E.01166
G1 X98.704 Y41.838 E.28659
G1 X98.616 Y42.285 E.01403
G1 X93.281 Y36.95 E.23257
G1 X92.746 Y36.95 E.01651
G1 X98.482 Y42.686 E.25009
G3 X98.249 Y42.988 I-1.097 J-.606 E.0118
G1 X92.21 Y36.949 E.26327
G1 X91.675 Y36.949 E.01651
G1 X97.926 Y43.201 E.27255
G3 X97.491 Y43.3 I-.682 J-1.972 E.01379
G1 X91.139 Y36.948 E.27693
G1 X90.604 Y36.948 E.01651
G1 X96.957 Y43.301 E.27697
G1 X96.422 Y43.301 E.01651
G1 X90.258 Y37.137 E.2687
G1 X90.075 Y37.321 E.00801
G1 X90.075 Y37.489 E.00517
G1 X95.886 Y43.3 E.25335
G1 X95.351 Y43.3 E.01651
G1 X90.076 Y38.025 E.22998
G1 X90.076 Y38.561 E.01652
G1 X94.782 Y43.267 E.20516
G1 X94.516 Y43.181 E.00861
G1 X94.171 Y43.19 E.01065
G1 X90.077 Y39.096 E.17847
G1 X90.078 Y39.632 E.01652
G1 X93.744 Y43.298 E.15981
G3 X93.212 Y43.301 I-.299 J-5.294 E.0164
G1 X90.079 Y40.168 E.1366
G1 X90.08 Y40.704 E.01652
G1 X92.677 Y43.301 E.11322
G1 X92.141 Y43.3 E.01651
G1 X90.08 Y41.24 E.08984
G1 X90.081 Y41.775 E.01652
G1 X91.606 Y43.3 E.06646
G1 X91.07 Y43.299 E.01651
G1 X90.082 Y42.311 E.04308
G1 X90.082 Y42.396 E.0026
G1 X89.132 Y41.446 E.04142
G1 X88.907 Y41.671 E.00982
G1 X91.504 Y44.268 E.11323
G1 X91.236 Y44.536 E.01166
G1 X88.639 Y41.938 E.11323
G1 X88.372 Y42.206 E.01166
G1 X90.969 Y44.803 E.11323
G1 X90.701 Y45.071 E.01166
G1 X88.104 Y42.473 E.11323
G1 X87.837 Y42.741 E.01166
G1 X90.434 Y45.338 E.11323
G1 X90.166 Y45.606 E.01166
G1 X87.569 Y43.008 E.11323
G1 X87.302 Y43.276 E.01166
G1 X89.899 Y45.873 E.11323
G1 X89.631 Y46.141 E.01166
G1 X87.034 Y43.543 E.11323
G1 X86.767 Y43.811 E.01166
G1 X89.484 Y46.528 E.11846
G1 X89.368 Y46.702 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.40043
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X93.011 Y50.339 E.26412
G1 X93.649 Y50.339 E.03271
G1 X89.83 Y46.527 E.27686
G1 X90.149 Y46.208 E.02311
G1 X94.286 Y50.339 E.29999
G1 X94.924 Y50.339 E.03271
G1 X90.467 Y45.89 E.32312
G1 X90.786 Y45.571 E.02311
G1 X95.561 Y50.339 E.34626
G1 X96.199 Y50.339 E.03271
G1 X91.104 Y45.253 E.36939
G1 X91.423 Y44.934 E.02311
G1 X96.836 Y50.339 E.39252
G1 X97.474 Y50.339 E.03271
G1 X91.741 Y44.616 E.41565
G1 X92.06 Y44.297 E.02311
G1 X98.111 Y50.339 E.43878
G1 X98.749 Y50.339 E.03271
G1 X92.113 Y43.714 E.48115
G1 X92.751 Y43.714 E.03274
G1 X99.387 Y50.339 E.48111
G1 X100.024 Y50.339 E.03271
G1 X93.389 Y43.715 E.48108
G2 X93.989 Y43.677 I.162 J-2.234 E.03094
G1 X100.662 Y50.339 E.4838
G1 X101.299 Y50.339 E.03271
G1 X94.587 Y43.638 E.48663
G2 X95.3 Y43.713 I.527 J-1.58 E.03706
G1 X101.937 Y50.339 E.48118
G1 X102.574 Y50.339 E.03271
G1 X95.938 Y43.714 E.48115
G1 X96.576 Y43.714 E.03274
G1 X103.212 Y50.339 E.48111
G1 X103.849 Y50.339 E.03271
G1 X97.214 Y43.715 E.48107
G2 X97.81 Y43.673 I.148 J-2.169 E.03075
G1 X104.487 Y50.339 E.48409
G1 X105.124 Y50.339 E.03271
G1 X98.264 Y43.491 E.49737
G2 X98.617 Y43.206 I-.924 J-1.507 E.02331
G1 X105.762 Y50.339 E.51802
G1 X106.4 Y50.339 E.03271
G1 X98.876 Y42.828 E.54549
G2 X99.026 Y42.342 I-1.506 J-.732 E.02622
G1 X107.037 Y50.339 E.58081
G1 X107.675 Y50.339 E.03271
G1 X99.132 Y41.81 E.61939
G1 X99.158 Y41.675 E.00708
G1 X99.625 Y42.141 E.03383
G1 X99.863 Y41.904 E.01725
G1 X108.312 Y50.339 E.61262
G1 X108.95 Y50.339 E.03271
G1 X100.181 Y41.585 E.63575
G1 X100.5 Y41.267 E.02311
G1 X109.587 Y50.339 E.65888
G1 X110.225 Y50.339 E.03271
G1 X99.703 Y39.835 E.76282
G1 X100.022 Y39.517 E.02311
G1 X110.862 Y50.339 E.78595
G1 X111.5 Y50.339 E.03271
G1 X100.34 Y39.198 E.80909
G1 X100.659 Y38.88 E.02311
G1 X112.137 Y50.339 E.83222
G1 X112.775 Y50.339 E.03271
G1 X100.977 Y38.561 E.85535
G1 X101.296 Y38.243 E.02311
G1 X113.412 Y50.339 E.87848
G1 X114.05 Y50.339 E.03271
G1 X101.614 Y37.924 E.90161
G1 X101.933 Y37.606 E.02311
G1 X114.688 Y50.339 E.92474
G1 X115.325 Y50.339 E.03271
G1 X102.251 Y37.287 E.94787
G1 X102.397 Y37.141 E.01059
G1 X99.54 Y34.284 E.20735
G1 X99.574 Y33.978 E.0158
G1 X115.963 Y50.339 E1.18823
G1 X116.6 Y50.339 E.03271
G1 X100.144 Y33.911 E1.19309
G1 X100.782 Y33.911 E.03271
G1 X117.238 Y50.339 E1.19309
G1 X117.875 Y50.339 E.03271
G1 X101.419 Y33.911 E1.19309
G1 X102.057 Y33.911 E.03271
G1 X118.513 Y50.339 E1.19309
G1 X119.15 Y50.339 E.03271
G1 X102.695 Y33.911 E1.19309
G1 X103.332 Y33.911 E.03271
G1 X119.788 Y50.339 E1.19309
G1 X120.425 Y50.339 E.03271
G1 X103.97 Y33.911 E1.19309
G1 X104.607 Y33.911 E.03271
G1 X121.063 Y50.339 E1.19309
G1 X121.7 Y50.339 E.03271
G1 X105.245 Y33.911 E1.19309
G1 X105.882 Y33.911 E.03271
G1 X122.338 Y50.339 E1.19309
G1 X122.976 Y50.339 E.03271
G1 X106.52 Y33.911 E1.19309
G1 X107.157 Y33.911 E.03271
G1 X123.613 Y50.339 E1.19309
G1 X124.251 Y50.339 E.03271
G1 X107.795 Y33.911 E1.19309
G1 X108.432 Y33.911 E.03271
G1 X124.888 Y50.339 E1.19309
G1 X125.526 Y50.339 E.03271
G1 X109.07 Y33.911 E1.19309
G1 X109.707 Y33.911 E.03271
G1 X126.163 Y50.339 E1.19309
G1 X126.801 Y50.339 E.03271
G1 X110.345 Y33.911 E1.19309
G1 X110.983 Y33.911 E.03271
G1 X127.438 Y50.339 E1.19309
G1 X128.076 Y50.339 E.03271
G1 X111.62 Y33.911 E1.19309
G1 X112.258 Y33.911 E.03271
G1 X128.713 Y50.339 E1.19309
G1 X129.351 Y50.339 E.03271
G1 X112.895 Y33.911 E1.19309
G1 X113.533 Y33.911 E.03271
G1 X129.989 Y50.339 E1.19309
G1 X130.626 Y50.339 E.03271
G1 X114.17 Y33.911 E1.19309
G1 X114.808 Y33.911 E.03271
G1 X131.264 Y50.339 E1.19309
G1 X131.901 Y50.339 E.03271
G1 X127.168 Y45.614 E.34318
G2 X127.903 Y45.711 I.959 J-4.401 E.03811
G1 X132.539 Y50.339 E.33607
G1 X133.176 Y50.339 E.03271
G1 X128.503 Y45.674 E.33882
G2 X129.027 Y45.56 I-.61 J-4.092 E.02753
G1 X133.814 Y50.339 E.34704
G1 X134.451 Y50.339 E.03271
G1 X129.489 Y45.385 E.3598
G1 X129.621 Y45.325 E.00745
G2 X129.905 Y45.163 I-4.516 J-8.248 E.01674
G1 X135.089 Y50.339 E.37587
G1 X135.726 Y50.339 E.03271
G1 X130.275 Y44.897 E.39523
G2 X130.603 Y44.588 I-1.69 J-2.126 E.02315
G1 X136.364 Y50.339 E.41766
G1 X137.001 Y50.339 E.03271
G1 X130.893 Y44.241 E.44288
G2 X131.143 Y43.854 I-1.807 J-1.443 E.02367
G1 X137.639 Y50.339 E.47096
G1 X138.277 Y50.339 E.03271
G1 X131.343 Y43.417 E.50268
G2 X131.493 Y42.93 I-2.354 J-.99 E.02619
G1 X138.914 Y50.339 E.53805
G1 X139.552 Y50.339 E.03271
G1 X131.576 Y42.376 E.57828
G2 X131.564 Y41.729 I-4.242 J-.251 E.03327
G1 X140.189 Y50.339 E.62532
G1 X140.827 Y50.339 E.03271
G1 X131.366 Y40.894 E.68596
G2 X129.224 Y38.756 I-3.371 J1.235 E.1603
G1 X124.371 Y33.911 E.35184
G1 X123.733 Y33.911 E.03271
G1 X128.393 Y38.562 E.33782
G1 X128.263 Y38.546 E.00671
G2 X127.743 Y38.55 I-.23 J3.609 E.0267
G1 X123.096 Y33.911 E.33695
G1 X122.458 Y33.911 E.03271
G1 X127.186 Y38.631 E.3428
G1 X126.966 Y38.693 E.01177
G2 X126.702 Y38.784 I.323 J1.359 E.01431
G1 X121.821 Y33.911 E.35394
G1 X121.183 Y33.911 E.03271
G1 X126.267 Y38.986 E.36859
M73 P67 R19
G2 X125.878 Y39.234 I2.611 J4.537 E.02369
G1 X120.546 Y33.911 E.38657
G1 X119.908 Y33.911 E.03271
G1 X125.532 Y39.526 E.40777
G2 X125.226 Y39.856 I1.498 J1.699 E.02317
G1 X119.271 Y33.911 E.43176
G1 X118.633 Y33.911 E.03271
G1 X124.958 Y40.225 E.45857
G2 X124.737 Y40.641 I4.323 J2.569 E.02416
G1 X117.996 Y33.911 E.48875
G1 X117.358 Y33.911 E.03271
G1 X124.564 Y41.105 E.52248
G2 X124.448 Y41.626 I4.248 J1.219 E.02739
G1 X116.72 Y33.911 E.56029
G1 X116.083 Y33.911 E.03271
G1 X124.416 Y42.23 E.60419
G2 X124.513 Y42.964 I3.746 J-.123 E.03802
G1 X115.243 Y33.708 E.67216
G1 X124.806 Y33.708 F30000
G1 F3000
G1 X141.464 Y50.339 E1.20779
G1 X142.102 Y50.339 E.03271
G1 X125.646 Y33.911 E1.19309
G1 X126.284 Y33.911 E.03271
G1 X142.739 Y50.339 E1.19309
G1 X143.377 Y50.339 E.03271
G1 X126.921 Y33.911 E1.19309
G1 X127.559 Y33.911 E.03271
G1 X144.014 Y50.339 E1.19309
G1 X144.652 Y50.339 E.03271
G1 X128.196 Y33.911 E1.19309
G1 X128.834 Y33.911 E.03271
G1 X145.289 Y50.339 E1.19309
G1 X145.927 Y50.339 E.03271
G1 X129.471 Y33.911 E1.19309
G1 X130.109 Y33.911 E.03271
G1 X146.565 Y50.339 E1.19309
G1 X147.202 Y50.339 E.03271
G1 X130.746 Y33.911 E1.19309
G1 X131.384 Y33.911 E.03271
G1 X147.84 Y50.339 E1.19309
G1 X148.477 Y50.339 E.03271
G1 X132.021 Y33.911 E1.19309
G1 X132.659 Y33.911 E.03271
G1 X149.115 Y50.339 E1.19309
G1 X149.752 Y50.339 E.03271
G1 X133.296 Y33.911 E1.19309
G1 X133.934 Y33.911 E.03271
G1 X150.39 Y50.339 E1.19309
G1 X151.027 Y50.339 E.03271
G1 X134.572 Y33.911 E1.19309
G1 X135.209 Y33.911 E.03271
G1 X151.665 Y50.339 E1.19309
G1 X152.302 Y50.339 E.03271
G1 X135.847 Y33.911 E1.19309
G1 X136.484 Y33.911 E.03271
G1 X152.94 Y50.339 E1.19309
G1 X153.578 Y50.339 E.03271
G1 X137.122 Y33.911 E1.19309
G1 X137.759 Y33.911 E.03271
G1 X154.215 Y50.339 E1.19309
G1 X154.853 Y50.339 E.03271
G1 X138.397 Y33.911 E1.19309
G1 X139.034 Y33.911 E.03271
G1 X155.49 Y50.339 E1.19309
G1 X156.128 Y50.339 E.03271
G1 X139.672 Y33.911 E1.19309
G1 X140.309 Y33.911 E.03271
G1 X156.765 Y50.339 E1.19309
G1 X157.403 Y50.339 E.03271
G1 X140.947 Y33.911 E1.19309
G1 X141.585 Y33.911 E.03271
G1 X158.04 Y50.339 E1.19309
G1 X158.678 Y50.339 E.03271
G1 X142.222 Y33.911 E1.19309
G1 X142.86 Y33.911 E.03271
G1 X159.315 Y50.339 E1.19309
G1 X159.953 Y50.339 E.03271
G1 X143.497 Y33.911 E1.19309
G1 X144.135 Y33.911 E.03271
G1 X160.59 Y50.339 E1.19309
G1 X161.228 Y50.339 E.03271
G1 X144.772 Y33.911 E1.19309
G1 X145.41 Y33.911 E.03271
G1 X161.866 Y50.339 E1.19309
G1 X162.503 Y50.339 E.03271
G1 X146.047 Y33.911 E1.19309
G1 X146.685 Y33.911 E.03271
G1 X163.141 Y50.339 E1.19309
M73 P67 R18
G1 X163.778 Y50.339 E.03271
G1 X147.322 Y33.911 E1.19309
G1 X147.96 Y33.911 E.03271
G1 X164.416 Y50.339 E1.19309
G1 X165.053 Y50.339 E.03271
G1 X148.597 Y33.911 E1.19309
G1 X149.235 Y33.911 E.03271
G1 X165.691 Y50.339 E1.19309
G1 X166.328 Y50.339 E.03271
G1 X149.873 Y33.911 E1.19309
G1 X150.51 Y33.911 E.03271
G1 X166.966 Y50.339 E1.19309
G1 X167.603 Y50.339 E.03271
G1 X151.148 Y33.911 E1.19309
G1 X151.785 Y33.911 E.03271
G1 X168.241 Y50.339 E1.19309
G1 X168.879 Y50.339 E.03271
G1 X152.423 Y33.911 E1.19309
G1 X153.06 Y33.911 E.03271
G1 X169.516 Y50.339 E1.19309
G1 X170.154 Y50.339 E.03271
G1 X153.698 Y33.911 E1.19309
G1 X154.335 Y33.911 E.03271
G1 X170.791 Y50.339 E1.19309
G1 X171.429 Y50.339 E.03271
G1 X154.973 Y33.911 E1.19309
G1 X155.61 Y33.911 E.03271
G1 X172.066 Y50.339 E1.19309
G1 X172.704 Y50.339 E.03271
G1 X156.248 Y33.911 E1.19309
G1 X156.885 Y33.911 E.03271
G1 X173.341 Y50.339 E1.19309
G1 X173.979 Y50.339 E.03271
G1 X157.523 Y33.911 E1.19309
G1 X158.161 Y33.911 E.03271
G1 X174.616 Y50.339 E1.19309
G1 X175.254 Y50.339 E.03271
G1 X158.798 Y33.911 E1.19309
G1 X159.436 Y33.911 E.03271
G1 X175.891 Y50.339 E1.19309
G1 X176.529 Y50.339 E.03271
G1 X160.073 Y33.911 E1.19309
G1 X160.711 Y33.911 E.03271
G1 X177.167 Y50.339 E1.19309
G1 X177.804 Y50.339 E.03271
G1 X161.348 Y33.911 E1.19309
G1 X161.986 Y33.911 E.03271
G1 X178.442 Y50.339 E1.19309
G1 X179.079 Y50.339 E.03271
G1 X162.623 Y33.911 E1.19309
G1 X163.261 Y33.911 E.03271
G1 X179.717 Y50.339 E1.19309
G1 X180.354 Y50.339 E.03271
G1 X163.898 Y33.911 E1.19309
G1 X164.536 Y33.911 E.03271
G1 X180.992 Y50.339 E1.19309
G1 X181.629 Y50.339 E.03271
G1 X165.174 Y33.911 E1.19309
G1 X165.811 Y33.911 E.03271
G1 X182.267 Y50.339 E1.19309
G1 X182.904 Y50.339 E.03271
G1 X166.449 Y33.911 E1.19309
G1 X167.086 Y33.911 E.03271
G1 X183.542 Y50.339 E1.19309
G1 X184.179 Y50.339 E.03271
G1 X167.724 Y33.911 E1.19309
G1 X168.361 Y33.911 E.03271
G1 X184.817 Y50.339 E1.19309
G1 X185.455 Y50.339 E.03271
G1 X168.999 Y33.911 E1.19309
G1 X169.636 Y33.911 E.03271
G1 X186.092 Y50.339 E1.19309
G1 X186.73 Y50.339 E.03271
G1 X170.274 Y33.911 E1.19309
G1 X170.911 Y33.911 E.03271
G1 X187.367 Y50.339 E1.19309
G1 X188.005 Y50.339 E.03271
G1 X171.549 Y33.911 E1.19309
G1 X172.186 Y33.911 E.03271
G1 X188.642 Y50.339 E1.19309
G1 X189.28 Y50.339 E.03271
G1 X172.824 Y33.911 E1.19309
G1 X173.462 Y33.911 E.03271
G1 X189.917 Y50.339 E1.19309
G1 X190.555 Y50.339 E.03271
G1 X174.099 Y33.911 E1.19309
G1 X174.737 Y33.911 E.03271
G1 X191.192 Y50.339 E1.19309
G1 X191.83 Y50.339 E.03271
G1 X175.374 Y33.911 E1.19309
G1 X176.012 Y33.911 E.03271
G1 X192.468 Y50.339 E1.19309
G1 X193.105 Y50.339 E.03271
G1 X176.649 Y33.911 E1.19309
G1 X177.287 Y33.911 E.03271
M73 P68 R18
G1 X193.743 Y50.339 E1.19309
G1 X194.38 Y50.339 E.03271
G1 X177.924 Y33.911 E1.19309
G1 X178.562 Y33.911 E.03271
G1 X195.018 Y50.339 E1.19309
G1 X195.655 Y50.339 E.03271
G1 X179.199 Y33.911 E1.19309
G1 X179.837 Y33.911 E.03271
G1 X196.293 Y50.339 E1.19309
G1 X196.93 Y50.339 E.03271
G1 X180.475 Y33.911 E1.19309
G1 X181.112 Y33.911 E.03271
G1 X197.568 Y50.339 E1.19309
G1 X198.205 Y50.339 E.03271
G1 X181.75 Y33.911 E1.19309
G1 X182.387 Y33.911 E.03271
G1 X198.843 Y50.339 E1.19309
G1 X199.48 Y50.339 E.03271
G1 X183.025 Y33.911 E1.19309
G1 X183.662 Y33.911 E.03271
G1 X200.118 Y50.339 E1.19309
G1 X200.756 Y50.339 E.03271
G1 X184.3 Y33.911 E1.19309
G1 X184.937 Y33.911 E.03271
G1 X217.964 Y66.882 E2.39452
G1 X217.964 Y66.246 E.03266
G1 X185.575 Y33.911 E2.3483
G1 X186.212 Y33.911 E.03271
G1 X217.964 Y65.609 E2.30208
G1 X217.964 Y64.973 E.03266
G1 X186.85 Y33.911 E2.25585
G1 X187.487 Y33.911 E.03271
G1 X217.964 Y64.336 E2.20963
G1 X217.964 Y63.7 E.03266
G1 X188.125 Y33.911 E2.16341
G1 X188.763 Y33.911 E.03271
G1 X217.964 Y63.063 E2.11718
G1 X217.964 Y62.427 E.03266
G1 X189.4 Y33.911 E2.07096
G1 X190.038 Y33.911 E.03271
G1 X217.964 Y61.79 E2.02474
G1 X217.964 Y61.154 E.03266
G1 X190.675 Y33.911 E1.97851
G1 X191.313 Y33.911 E.03271
G1 X217.964 Y60.517 E1.93229
G1 X217.964 Y59.881 E.03266
G1 X191.95 Y33.911 E1.88607
G1 X192.588 Y33.911 E.03271
G1 X217.964 Y59.245 E1.83984
G1 X217.964 Y58.608 E.03266
G1 X193.225 Y33.911 E1.79362
G1 X193.863 Y33.911 E.03271
G1 X217.964 Y57.972 E1.7474
G1 X217.964 Y57.335 E.03266
G1 X194.5 Y33.911 E1.70117
G1 X195.138 Y33.911 E.03271
G1 X217.964 Y56.699 E1.65495
G1 X217.964 Y56.062 E.03266
G1 X195.775 Y33.911 E1.60873
G1 X196.413 Y33.911 E.03271
G1 X217.964 Y55.426 E1.5625
G1 X217.964 Y54.789 E.03266
G1 X208.716 Y45.557 E.67049
G2 X209.497 Y45.7 I1.04 J-3.479 E.0408
G1 X217.964 Y54.153 E.6139
G1 X217.964 Y53.516 E.03266
G1 X210.124 Y45.69 E.5684
G1 X210.163 Y45.685 E.00198
G2 X210.664 Y45.592 I-.213 J-2.553 E.02622
G1 X217.964 Y52.88 E.52926
G1 X217.964 Y52.243 E.03266
G1 X211.139 Y45.43 E.49483
G2 X211.563 Y45.216 I-.855 J-2.226 E.02439
G1 X217.964 Y51.607 E.46411
G1 X217.964 Y50.97 E.03266
G1 X211.945 Y44.961 E.43643
G2 X212.284 Y44.663 I-3.408 J-4.223 E.02317
G1 X217.964 Y50.334 E.41184
G1 X217.964 Y49.698 E.03266
G1 X212.581 Y44.323 E.39031
G2 X212.838 Y43.944 I-1.766 J-1.477 E.02356
G1 X217.964 Y49.061 E.37163
G1 X217.964 Y48.425 E.03266
G1 X213.054 Y43.523 E.35597
G2 X213.214 Y43.046 I-5.743 J-2.182 E.02583
G1 X217.964 Y47.788 E.34442
G1 X217.964 Y47.152 E.03266
G1 X213.316 Y42.511 E.337
G2 X213.326 Y41.885 I-4.382 J-.385 E.03216
G1 X217.964 Y46.515 E.33626
G1 X217.964 Y45.879 E.03266
G1 X213.19 Y41.113 E.34611
G2 X210.879 Y38.724 I-3.418 J.994 E.17744
G1 X210.756 Y38.682 E.00671
G1 X205.976 Y33.911 E.34652
G1 X205.339 Y33.911 E.03271
G1 X209.982 Y38.546 E.33664
G1 X209.55 Y38.548 E.02217
G2 X209.359 Y38.561 I.356 J6.652 E.00983
G1 X204.701 Y33.911 E.33768
G1 X204.064 Y33.911 E.03271
G1 X208.823 Y38.663 E.34511
G2 X208.349 Y38.825 I.575 J2.456 E.02579
G1 X203.426 Y33.911 E.3569
G1 X202.788 Y33.911 E.03271
G1 X207.924 Y39.038 E.37235
G2 X207.547 Y39.298 I1.111 J2.014 E.02354
G1 X202.151 Y33.911 E.39124
G1 X201.513 Y33.911 E.03271
G1 X207.209 Y39.597 E.41296
G2 X206.91 Y39.935 I1.536 J1.664 E.02319
G1 X200.876 Y33.911 E.43747
G1 X200.238 Y33.911 E.03271
G1 X206.654 Y40.316 E.46518
G1 X206.604 Y40.409 E.00541
G2 X206.444 Y40.742 I2.403 J1.36 E.019
G1 X199.601 Y33.911 E.49613
G1 X198.963 Y33.911 E.03271
G1 X206.28 Y41.216 E.5305
G2 X206.185 Y41.757 I4.423 J1.055 E.02823
G1 X198.326 Y33.911 E.56984
G1 X197.688 Y33.911 E.03271
G1 X206.174 Y42.383 E.61526
G2 X206.321 Y43.165 I3.677 J-.283 E.04093
G1 X196.848 Y33.708 E.68681
G1 X206.411 Y33.708 F30000
G1 F3000
G1 X217.964 Y45.242 E.83764
G1 X217.964 Y44.606 E.03266
G1 X207.251 Y33.911 E.77671
G1 X207.889 Y33.911 E.03271
G1 X217.964 Y43.969 E.73048
M73 P69 R18
G1 X217.964 Y43.333 E.03266
G1 X208.526 Y33.911 E.68426
G1 X209.164 Y33.911 E.03271
G1 X217.964 Y42.696 E.63804
G1 X217.964 Y42.06 E.03266
G1 X209.801 Y33.911 E.59182
G1 X210.439 Y33.911 E.03271
G1 X217.964 Y41.423 E.54559
G1 X217.964 Y40.787 E.03266
G1 X211.076 Y33.911 E.49937
G1 X211.714 Y33.911 E.03271
G1 X217.964 Y40.15 E.45315
G1 X217.964 Y39.514 E.03266
G1 X212.352 Y33.911 E.40692
G1 X212.989 Y33.911 E.03271
G1 X217.964 Y38.878 E.3607
G1 X217.964 Y38.241 E.03266
G1 X213.627 Y33.911 E.31448
G1 X214.264 Y33.911 E.03271
G1 X217.964 Y37.605 E.26825
G1 X217.964 Y36.968 E.03266
G1 X214.902 Y33.911 E.22203
G1 X215.539 Y33.911 E.03271
G1 X217.964 Y36.332 E.17581
G1 X217.964 Y35.695 E.03266
G1 X216.177 Y33.911 E.12958
G1 X216.814 Y33.911 E.03271
G1 X217.964 Y35.059 E.08336
M73 P69 R17
G1 X217.964 Y34.422 E.03266
G1 X217.249 Y33.708 E.05184
; WIPE_START
G1 X217.964 Y34.422 E-.38394
G1 X217.964 Y35.059 E-.24186
G1 X217.714 Y34.809 E-.13421
; WIPE_END
G1 E-.04 F1800
G1 X212.272 Y40.16 Z2.6 F30000
G1 X201.333 Y50.916 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F3000
G1 X217.964 Y67.519 E1.20576
G1 X217.964 Y68.155 E.03266
G1 X201.536 Y51.755 E1.19108
G1 X201.536 Y52.391 E.03266
G1 X217.964 Y68.792 E1.19108
G1 X217.964 Y69.428 E.03266
G1 X201.536 Y53.028 E1.19108
G1 X201.536 Y53.664 E.03266
G1 X217.964 Y70.065 E1.19108
G1 X217.964 Y70.701 E.03266
G1 X201.536 Y54.3 E1.19108
G1 X201.536 Y54.937 E.03266
G1 X217.964 Y71.337 E1.19108
G1 X217.964 Y71.974 E.03266
G1 X201.536 Y55.573 E1.19108
G1 X201.536 Y56.21 E.03266
G1 X217.964 Y72.61 E1.19108
G1 X217.964 Y73.247 E.03266
G1 X201.536 Y56.846 E1.19108
G1 X201.536 Y57.483 E.03266
G1 X217.964 Y73.883 E1.19108
G1 X217.964 Y74.52 E.03266
G1 X201.536 Y58.119 E1.19108
G1 X201.536 Y58.756 E.03266
G1 X217.964 Y75.156 E1.19108
G1 X217.964 Y75.793 E.03266
G1 X201.536 Y59.392 E1.19108
G1 X201.536 Y60.029 E.03266
G1 X217.964 Y76.429 E1.19108
G1 X217.964 Y77.066 E.03266
G1 X201.536 Y60.665 E1.19108
G1 X201.536 Y61.302 E.03266
G1 X217.964 Y77.702 E1.19108
G1 X217.964 Y78.339 E.03266
G1 X201.536 Y61.938 E1.19108
G1 X201.536 Y62.575 E.03266
G1 X217.964 Y78.975 E1.19108
G1 X217.964 Y79.612 E.03266
G1 X201.536 Y63.211 E1.19108
G1 X201.536 Y63.848 E.03266
G1 X217.964 Y80.248 E1.19108
G1 X217.964 Y80.884 E.03266
G1 X201.536 Y64.484 E1.19108
G1 X201.536 Y65.12 E.03266
G1 X217.964 Y81.521 E1.19108
G1 X217.964 Y82.157 E.03266
G1 X201.536 Y65.757 E1.19108
G1 X201.536 Y66.393 E.03266
G1 X217.964 Y82.794 E1.19108
G1 X217.964 Y83.43 E.03266
G1 X201.536 Y67.03 E1.19108
G1 X201.536 Y67.666 E.03266
G1 X217.964 Y84.067 E1.19108
G1 X217.964 Y84.703 E.03266
G1 X201.536 Y68.303 E1.19108
G1 X201.536 Y68.939 E.03266
G1 X217.964 Y85.34 E1.19108
G1 X217.964 Y85.976 E.03266
G1 X201.536 Y69.576 E1.19108
G1 X201.536 Y70.212 E.03266
G1 X217.964 Y86.613 E1.19108
G1 X217.964 Y87.249 E.03266
G1 X201.536 Y70.849 E1.19108
G1 X201.536 Y71.485 E.03266
G1 X217.964 Y87.886 E1.19108
G1 X217.964 Y88.522 E.03266
G1 X201.536 Y72.122 E1.19108
G1 X201.536 Y72.758 E.03266
G1 X217.964 Y89.159 E1.19108
G1 X217.964 Y89.795 E.03266
G1 X201.536 Y73.395 E1.19108
G1 X201.536 Y74.031 E.03266
G1 X217.964 Y90.432 E1.19108
G1 X217.964 Y91.068 E.03266
G1 X201.536 Y74.667 E1.19108
G1 X201.536 Y75.304 E.03266
G1 X217.964 Y91.704 E1.19108
G1 X217.964 Y92.341 E.03266
G1 X201.536 Y75.94 E1.19108
G1 X201.536 Y76.577 E.03266
G1 X217.964 Y92.977 E1.19108
G1 X217.964 Y93.614 E.03266
G1 X201.536 Y77.213 E1.19108
G1 X201.536 Y77.85 E.03266
G1 X217.964 Y94.25 E1.19108
G1 X217.964 Y94.887 E.03266
G1 X201.536 Y78.486 E1.19108
G1 X201.536 Y79.123 E.03266
G1 X217.964 Y95.523 E1.19108
G1 X217.964 Y96.16 E.03266
G1 X201.536 Y79.759 E1.19108
G1 X201.536 Y80.396 E.03266
G1 X217.964 Y96.796 E1.19108
G1 X217.964 Y97.433 E.03266
G1 X201.536 Y81.032 E1.19108
G1 X201.536 Y81.669 E.03266
G1 X217.964 Y98.069 E1.19108
G1 X217.964 Y98.706 E.03266
G1 X201.536 Y82.305 E1.19108
G1 X201.536 Y82.942 E.03266
G1 X217.964 Y99.342 E1.19108
G1 X217.964 Y99.979 E.03266
G1 X201.536 Y83.578 E1.19108
G1 X201.536 Y84.215 E.03266
G1 X217.964 Y100.615 E1.19108
G1 X217.964 Y101.251 E.03266
G1 X201.536 Y84.851 E1.19108
G1 X201.536 Y85.487 E.03266
G1 X217.964 Y101.888 E1.19108
G1 X217.964 Y102.524 E.03266
G1 X201.536 Y86.124 E1.19108
G1 X201.536 Y86.76 E.03266
G1 X217.964 Y103.161 E1.19108
G1 X217.964 Y103.797 E.03266
G1 X201.536 Y87.397 E1.19108
G1 X201.536 Y88.033 E.03266
G1 X217.964 Y104.434 E1.19108
G1 X217.964 Y105.07 E.03266
G1 X201.536 Y88.67 E1.19108
G1 X201.536 Y89.306 E.03266
G1 X217.964 Y105.707 E1.19108
G1 X217.964 Y106.343 E.03266
G1 X201.536 Y89.943 E1.19108
G1 X201.536 Y90.579 E.03266
G1 X217.964 Y106.98 E1.19108
G1 X217.964 Y107.616 E.03266
G1 X201.536 Y91.216 E1.19108
G1 X201.536 Y91.852 E.03266
G1 X217.964 Y108.253 E1.19108
G1 X217.964 Y108.889 E.03266
G1 X201.536 Y92.489 E1.19108
G1 X201.536 Y93.125 E.03266
G1 X217.964 Y109.526 E1.19108
G1 X217.964 Y110.162 E.03266
G1 X201.536 Y93.762 E1.19108
G1 X201.536 Y94.398 E.03266
G1 X217.964 Y110.799 E1.19108
G1 X217.964 Y111.435 E.03266
G1 X201.536 Y95.034 E1.19108
G1 X201.536 Y95.671 E.03266
G1 X217.964 Y112.071 E1.19108
G1 X217.964 Y112.708 E.03266
G1 X201.536 Y96.307 E1.19108
G1 X201.536 Y96.944 E.03266
G1 X217.964 Y113.344 E1.19108
G1 X217.964 Y113.981 E.03266
G1 X201.536 Y97.58 E1.19108
G1 X201.536 Y98.217 E.03266
G1 X217.964 Y114.617 E1.19108
G1 X217.964 Y115.254 E.03266
G1 X201.536 Y98.853 E1.19108
G1 X201.536 Y99.49 E.03266
G1 X217.964 Y115.89 E1.19108
G1 X217.964 Y116.527 E.03266
G1 X201.536 Y100.126 E1.19108
G1 X201.536 Y100.763 E.03266
G1 X217.964 Y117.163 E1.19108
G1 X217.964 Y117.8 E.03266
G1 X201.536 Y101.399 E1.19108
G1 X201.536 Y102.036 E.03266
G1 X217.964 Y118.436 E1.19108
G1 X217.964 Y119.073 E.03266
G1 X201.536 Y102.672 E1.19108
M73 P70 R17
G1 X201.536 Y103.309 E.03266
G1 X217.964 Y119.709 E1.19108
G1 X217.964 Y120.346 E.03266
G1 X201.536 Y103.945 E1.19108
G1 X201.536 Y104.582 E.03266
G1 X217.964 Y120.982 E1.19108
G1 X217.964 Y121.619 E.03266
G1 X201.536 Y105.218 E1.19108
G1 X201.536 Y105.854 E.03266
G1 X217.964 Y122.255 E1.19108
G1 X217.964 Y122.891 E.03266
G1 X201.536 Y106.491 E1.19108
G1 X201.536 Y107.127 E.03266
G1 X217.964 Y123.528 E1.19108
G1 X217.964 Y124.164 E.03266
G1 X201.536 Y107.764 E1.19108
G1 X201.536 Y108.4 E.03266
G1 X217.964 Y124.801 E1.19108
G1 X217.964 Y125.437 E.03266
G1 X201.536 Y109.037 E1.19108
G1 X201.536 Y109.673 E.03266
G1 X217.964 Y126.074 E1.19108
G1 X217.964 Y126.71 E.03266
G1 X201.536 Y110.31 E1.19108
G1 X201.536 Y110.946 E.03266
G1 X217.964 Y127.347 E1.19108
G1 X217.964 Y127.983 E.03266
G1 X201.536 Y111.583 E1.19108
G1 X201.536 Y112.219 E.03266
G1 X217.964 Y128.62 E1.19108
G1 X217.964 Y129.256 E.03266
G1 X201.333 Y112.653 E1.20576
G1 X201.333 Y122.2 F30000
G1 F3000
G1 X206.385 Y127.244 E.36626
G3 X206.19 Y126.412 I2.597 J-1.049 E.04401
G1 X201.536 Y121.766 E.3374
G1 X201.536 Y121.13 E.03266
G1 X206.173 Y125.759 E.33617
G3 X206.255 Y125.204 I2.812 J.133 E.02881
G1 X201.536 Y120.493 E.34212
G1 X201.536 Y119.857 E.03266
G1 X206.402 Y124.715 E.35284
G3 X206.605 Y124.281 I2.268 J.796 E.02462
G1 X201.536 Y119.22 E.36755
G1 X201.536 Y118.584 E.03266
G1 X206.851 Y123.89 E.38537
G3 X207.139 Y123.541 I4.459 J3.379 E.02322
G1 X201.536 Y117.947 E.40622
G1 X201.536 Y117.311 E.03266
G1 X207.47 Y123.235 E.43021
G1 X207.649 Y123.091 E.01179
G3 X207.84 Y122.968 I.982 J1.301 E.01166
G1 X201.536 Y116.674 E.45704
G1 X201.536 Y116.038 E.03266
G1 X208.251 Y122.741 E.48684
G3 X208.715 Y122.568 I1.921 J4.443 E.02543
G1 X201.536 Y115.401 E.52049
G1 X201.536 Y114.765 E.03266
G1 X209.236 Y122.452 E.55824
G3 X209.843 Y122.422 I.472 J3.384 E.03125
G1 X201.536 Y114.129 E.60229
G1 X201.536 Y113.492 E.03266
G1 X210.868 Y122.809 E.67662
; WIPE_START
G1 X209.453 Y121.396 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X212.939 Y124.876 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
G1 F3000
G1 X217.964 Y129.893 E.36432
G1 X217.964 Y130.529 E.03266
G1 X213.333 Y125.906 E.33573
G3 X213.298 Y126.507 I-3.765 J.077 E.03091
G1 X217.964 Y131.166 E.33832
G1 X217.964 Y131.802 E.03266
G1 X213.185 Y127.031 E.34646
G3 X213.009 Y127.492 I-4.608 J-1.5 E.02531
G1 X217.964 Y132.438 E.35924
G1 X217.964 Y133.075 E.03266
G1 X212.786 Y127.905 E.37545
G3 X212.521 Y128.277 I-1.992 J-1.138 E.02347
G1 X217.964 Y133.711 E.39465
G1 X217.964 Y134.348 E.03266
G1 X212.213 Y128.606 E.41698
G3 X211.864 Y128.894 I-1.612 J-1.599 E.02326
G1 X217.964 Y134.984 E.4423
G1 X217.964 Y135.621 E.03266
G1 X211.475 Y129.142 E.4705
G3 X211.042 Y129.347 I-2.415 J-4.558 E.02457
G1 X217.964 Y136.257 E.50189
G1 X217.964 Y136.894 E.03266
G1 X210.551 Y129.493 E.53747
G3 X209.999 Y129.579 I-.998 J-4.617 E.02867
G1 X217.964 Y137.53 E.57748
G1 X217.964 Y138.167 E.03266
G1 X209.346 Y129.563 E.6248
G3 X208.507 Y129.362 I.213 J-2.734 E.04448
G1 X217.964 Y138.803 E.68567
G1 X217.964 Y139.44 E.03266
G1 X201.536 Y123.039 E1.19108
G1 X201.536 Y123.676 E.03266
G1 X217.964 Y140.076 E1.19108
G1 X217.964 Y140.713 E.03266
G1 X201.536 Y124.312 E1.19108
G1 X201.536 Y124.949 E.03266
G1 X217.964 Y141.349 E1.19108
G1 X217.964 Y141.986 E.03266
G1 X201.536 Y125.585 E1.19108
G1 X201.536 Y126.221 E.03266
G1 X217.964 Y142.622 E1.19108
G1 X217.964 Y143.258 E.03266
G1 X201.536 Y126.858 E1.19108
G1 X201.536 Y127.494 E.03266
G1 X217.964 Y143.895 E1.19108
G1 X217.964 Y144.531 E.03266
G1 X201.536 Y128.131 E1.19108
G1 X201.536 Y128.767 E.03266
G1 X217.964 Y145.168 E1.19108
G1 X217.964 Y145.804 E.03266
G1 X201.536 Y129.404 E1.19108
G1 X201.536 Y130.04 E.03266
G1 X217.964 Y146.441 E1.19108
G1 X217.964 Y147.077 E.03266
G1 X201.536 Y130.677 E1.19108
G1 X201.536 Y131.313 E.03266
G1 X217.964 Y147.714 E1.19108
G1 X217.964 Y148.35 E.03266
G1 X201.536 Y131.95 E1.19108
G1 X201.536 Y132.586 E.03266
G1 X217.964 Y148.987 E1.19108
G1 X217.964 Y149.623 E.03266
G1 X201.536 Y133.223 E1.19108
G1 X201.536 Y133.859 E.03266
G1 X217.964 Y150.26 E1.19108
G1 X217.964 Y150.896 E.03266
G1 X201.536 Y134.496 E1.19108
G1 X201.536 Y135.132 E.03266
G1 X217.964 Y151.533 E1.19108
G1 X217.964 Y152.169 E.03266
G1 X201.536 Y135.769 E1.19108
G1 X201.536 Y136.405 E.03266
G1 X217.964 Y152.805 E1.19108
G1 X217.964 Y153.442 E.03266
G1 X201.536 Y137.041 E1.19108
G1 X201.536 Y137.678 E.03266
G1 X217.964 Y154.078 E1.19108
G1 X217.964 Y154.715 E.03266
G1 X201.536 Y138.314 E1.19108
G1 X201.536 Y138.951 E.03266
G1 X217.964 Y155.351 E1.19108
G1 X217.964 Y155.988 E.03266
G1 X201.536 Y139.587 E1.19108
G1 X201.536 Y140.224 E.03266
G1 X217.964 Y156.624 E1.19108
M73 P70 R16
G1 X217.964 Y157.261 E.03266
G1 X201.536 Y140.86 E1.19108
G1 X201.536 Y141.497 E.03266
G1 X217.964 Y157.897 E1.19108
G1 X217.964 Y158.534 E.03266
G1 X201.536 Y142.133 E1.19108
G1 X201.536 Y142.77 E.03266
G1 X217.964 Y159.17 E1.19108
G1 X217.964 Y159.807 E.03266
G1 X201.536 Y143.406 E1.19108
G1 X201.536 Y144.043 E.03266
G1 X217.964 Y160.443 E1.19108
G1 X217.964 Y161.08 E.03266
G1 X201.536 Y144.679 E1.19108
G1 X201.536 Y145.316 E.03266
G1 X217.964 Y161.716 E1.19108
G1 X217.964 Y162.353 E.03266
G1 X201.536 Y145.952 E1.19108
G1 X201.536 Y146.588 E.03266
G1 X217.964 Y162.989 E1.19108
G1 X217.964 Y163.625 E.03266
G1 X201.536 Y147.225 E1.19108
G1 X201.536 Y147.861 E.03266
G1 X217.964 Y164.262 E1.19108
G1 X217.964 Y164.898 E.03266
G1 X201.536 Y148.498 E1.19108
G1 X201.536 Y149.134 E.03266
G1 X217.964 Y165.535 E1.19108
G1 X217.964 Y166.171 E.03266
G1 X201.536 Y149.771 E1.19108
G1 X201.536 Y150.407 E.03266
G1 X217.964 Y166.808 E1.19108
M73 P71 R16
G1 X217.964 Y167.444 E.03266
G1 X201.536 Y151.044 E1.19108
G1 X201.536 Y151.68 E.03266
G1 X217.964 Y168.081 E1.19108
G1 X217.964 Y168.717 E.03266
G1 X201.536 Y152.317 E1.19108
G1 X201.536 Y152.953 E.03266
G1 X217.964 Y169.354 E1.19108
G1 X217.964 Y169.99 E.03266
G1 X201.536 Y153.59 E1.19108
G1 X201.536 Y154.226 E.03266
G1 X217.964 Y170.627 E1.19108
G1 X217.964 Y171.263 E.03266
G1 X201.536 Y154.863 E1.19108
G1 X201.536 Y155.499 E.03266
G1 X217.964 Y171.9 E1.19108
G1 X217.964 Y172.536 E.03266
G1 X201.536 Y156.136 E1.19108
G1 X201.536 Y156.772 E.03266
G1 X217.964 Y173.172 E1.19108
G1 X217.964 Y173.809 E.03266
G1 X201.536 Y157.408 E1.19108
G1 X201.536 Y158.045 E.03266
G1 X217.964 Y174.445 E1.19108
G1 X217.964 Y175.082 E.03266
G1 X201.536 Y158.681 E1.19108
G1 X201.536 Y159.318 E.03266
G1 X217.964 Y175.718 E1.19108
G1 X217.964 Y176.355 E.03266
G1 X201.536 Y159.954 E1.19108
G1 X201.536 Y160.591 E.03266
G1 X217.964 Y176.991 E1.19108
G1 X217.964 Y177.628 E.03266
G1 X201.536 Y161.227 E1.19108
G1 X201.536 Y161.864 E.03266
G1 X217.964 Y178.264 E1.19108
G1 X217.964 Y178.901 E.03266
G1 X201.536 Y162.5 E1.19108
G1 X201.536 Y163.137 E.03266
G1 X217.964 Y179.537 E1.19108
G1 X217.964 Y180.174 E.03266
G1 X201.536 Y163.773 E1.19108
G1 X201.536 Y164.41 E.03266
G1 X217.964 Y180.81 E1.19108
G1 X217.964 Y181.447 E.03266
G1 X201.536 Y165.046 E1.19108
G1 X201.536 Y165.683 E.03266
G1 X217.964 Y182.083 E1.19108
G1 X217.964 Y182.72 E.03266
G1 X201.536 Y166.319 E1.19108
G1 X201.536 Y166.955 E.03266
G1 X217.964 Y183.356 E1.19108
G1 X217.964 Y183.992 E.03266
G1 X201.536 Y167.592 E1.19108
G1 X201.536 Y168.228 E.03266
G1 X217.964 Y184.629 E1.19108
G1 X217.964 Y185.265 E.03266
G1 X201.536 Y168.865 E1.19108
G1 X201.536 Y169.501 E.03266
G1 X217.964 Y185.902 E1.19108
G1 X217.964 Y186.538 E.03266
G1 X201.536 Y170.138 E1.19108
G1 X201.536 Y170.774 E.03266
G1 X217.964 Y187.175 E1.19108
G1 X217.964 Y187.811 E.03266
G1 X201.536 Y171.411 E1.19108
G1 X201.536 Y172.047 E.03266
G1 X217.964 Y188.448 E1.19108
G1 X217.964 Y189.084 E.03266
G1 X201.536 Y172.684 E1.19108
G1 X201.536 Y173.32 E.03266
G1 X217.964 Y189.721 E1.19108
G1 X217.964 Y190.357 E.03266
G1 X201.536 Y173.957 E1.19108
G1 X201.536 Y174.593 E.03266
G1 X217.964 Y190.994 E1.19108
G1 X217.964 Y191.63 E.03266
G1 X201.536 Y175.23 E1.19108
G1 X201.536 Y175.866 E.03266
G1 X217.964 Y192.267 E1.19108
G1 X217.964 Y192.903 E.03266
G1 X201.536 Y176.503 E1.19108
G1 X201.536 Y177.139 E.03266
G1 X217.964 Y193.54 E1.19108
G1 X217.964 Y194.176 E.03266
G1 X201.536 Y177.775 E1.19108
G1 X201.536 Y178.412 E.03266
G1 X217.964 Y194.812 E1.19108
G1 X217.964 Y195.449 E.03266
G1 X201.536 Y179.048 E1.19108
G1 X201.536 Y179.685 E.03266
G1 X217.964 Y196.085 E1.19108
G1 X217.964 Y196.722 E.03266
G1 X201.536 Y180.321 E1.19108
G1 X201.536 Y180.958 E.03266
G1 X217.964 Y197.358 E1.19108
G1 X217.964 Y197.995 E.03266
G1 X201.536 Y181.594 E1.19108
G1 X201.536 Y182.231 E.03266
G1 X217.964 Y198.631 E1.19108
G1 X217.964 Y199.268 E.03266
G1 X201.536 Y182.867 E1.19108
G1 X201.536 Y183.504 E.03266
G1 X217.964 Y199.904 E1.19108
G1 X217.964 Y200.541 E.03266
G1 X201.536 Y184.14 E1.19108
G1 X201.536 Y184.777 E.03266
G1 X217.964 Y201.177 E1.19108
G1 X217.964 Y201.814 E.03266
G1 X201.536 Y185.413 E1.19108
G1 X201.536 Y186.05 E.03266
G1 X217.964 Y202.45 E1.19108
G1 X217.964 Y203.087 E.03266
G1 X201.536 Y186.686 E1.19108
G1 X201.536 Y187.322 E.03266
G1 X217.964 Y203.723 E1.19108
G1 X217.964 Y204.359 E.03266
G1 X201.536 Y187.959 E1.19108
G1 X201.536 Y188.595 E.03266
G1 X217.964 Y204.996 E1.19108
G1 X217.964 Y205.632 E.03266
G1 X201.536 Y189.232 E1.19108
G1 X201.536 Y189.868 E.03266
G1 X217.964 Y206.269 E1.19108
G1 X217.964 Y206.905 E.03266
G1 X201.536 Y190.505 E1.19108
G1 X201.536 Y191.141 E.03266
G1 X217.964 Y207.542 E1.19108
G1 X217.964 Y208.178 E.03266
G1 X201.536 Y191.778 E1.19108
G1 X201.536 Y192.414 E.03266
G1 X217.964 Y208.815 E1.19108
G1 X217.964 Y209.451 E.03266
G1 X201.536 Y193.051 E1.19108
G1 X201.536 Y193.687 E.03266
G1 X217.964 Y210.088 E1.19108
G1 X217.964 Y210.724 E.03266
G1 X201.536 Y194.324 E1.19108
G1 X201.536 Y194.96 E.03266
G1 X217.964 Y211.361 E1.19108
G1 X217.964 Y211.997 E.03266
G1 X201.536 Y195.597 E1.19108
G1 X201.536 Y196.233 E.03266
G1 X217.964 Y212.634 E1.19108
M73 P72 R16
G1 X217.964 Y213.27 E.03266
G1 X201.333 Y196.667 E1.20576
; WIPE_START
G1 X202.749 Y198.08 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X196.569 Y201.458 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
G1 F3000
G1 X206.486 Y211.359 E.719
G1 X206.448 Y211.269 E.00501
G3 X206.209 Y210.445 I3.486 J-1.46 E.04408
G1 X197.41 Y201.661 E.63797
G1 X198.047 Y201.661 E.03271
G1 X206.166 Y209.766 E.58864
G3 X206.231 Y209.195 I3.917 J.156 E.02954
G1 X198.685 Y201.661 E.54713
G1 X199.322 Y201.661 E.03271
G1 X206.365 Y208.691 E.51058
G3 X206.556 Y208.246 I4.402 J1.631 E.02488
G1 X199.96 Y201.661 E.47825
G1 X200.598 Y201.661 E.03271
G1 X206.795 Y207.848 E.44932
G3 X207.073 Y207.49 I1.927 J1.211 E.02333
G1 X201.235 Y201.661 E.4233
G1 X201.536 Y201.661 E.01544
G1 X201.536 Y201.325 E.01725
G1 X207.392 Y207.171 E.42461
G3 X207.755 Y206.897 I1.555 J1.681 E.02338
G1 X201.536 Y200.688 E.45092
G1 X201.536 Y200.052 E.03266
G1 X208.159 Y206.664 E.48017
G3 X208.606 Y206.474 I1.213 J2.242 E.02498
G1 X201.536 Y199.415 E.51263
G1 X201.536 Y198.779 E.03266
G1 X209.117 Y206.348 E.54967
G3 X209.704 Y206.297 I.531 J2.742 E.03029
G1 X201.536 Y198.142 E.59223
G1 X201.536 Y197.506 E.03266
G1 X210.66 Y206.614 E.6615
; WIPE_START
G1 X209.244 Y205.201 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X201.638 Y205.828 Z2.6 F30000
G1 X50.22 Y218.292 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F3000
G1 X45.232 Y213.311 E.36168
G2 X46.009 Y213.451 I1.024 J-3.476 E.04059
G1 X50.655 Y218.089 E.33686
G1 X51.293 Y218.089 E.03271
G1 X46.634 Y213.439 E.33774
G2 X47.173 Y213.34 I-.223 J-2.744 E.02816
G1 X51.93 Y218.089 E.34489
G1 X52.568 Y218.089 E.03271
G1 X47.647 Y213.176 E.35679
G2 X48.07 Y212.962 I-1.335 J-3.166 E.02435
G1 X53.205 Y218.089 E.37233
G1 X53.843 Y218.089 E.03271
G1 X48.451 Y212.706 E.39092
G2 X48.789 Y212.407 I-3.436 J-4.225 E.02316
G1 X54.48 Y218.089 E.41264
G1 X55.118 Y218.089 E.03271
G1 X49.086 Y212.067 E.43737
G2 X49.326 Y211.714 I-1.644 J-1.379 E.02196
G1 X49.343 Y211.687 E.00161
G1 X55.756 Y218.089 E.46495
G1 X56.393 Y218.089 E.03271
G1 X49.558 Y211.265 E.49558
G2 X49.716 Y210.787 I-2.313 J-1.03 E.0259
G1 X57.031 Y218.089 E.53033
G1 X57.668 Y218.089 E.03271
G1 X49.817 Y210.252 E.5692
G2 X49.826 Y209.623 I-4.591 J-.374 E.03227
G1 X58.306 Y218.089 E.61483
G1 X58.943 Y218.089 E.03271
G1 X49.687 Y208.848 E.67113
G2 X47.273 Y206.438 I-3.452 J1.043 E.18231
G1 X38.036 Y197.217 E.66968
G1 X38.036 Y197.853 E.03266
G1 X46.493 Y206.296 E.61316
G2 X45.869 Y206.31 I-.215 J4.463 E.03205
G1 X38.036 Y198.49 E.56792
G1 X38.036 Y199.126 E.03266
G1 X45.332 Y206.41 E.529
G2 X44.857 Y206.572 I.569 J2.456 E.02582
G1 X38.036 Y199.763 E.49452
G1 X38.036 Y200.399 E.03266
G1 X44.431 Y206.784 E.46366
G1 X44.311 Y206.861 E.00732
G2 X44.053 Y207.043 I.781 J1.38 E.01622
G1 X38.036 Y201.036 E.43628
G1 X38.036 Y201.672 E.03266
G1 X43.715 Y207.342 E.41174
G2 X43.415 Y207.679 I1.532 J1.666 E.02319
G1 X38.036 Y202.309 E.38999
G1 X38.036 Y202.945 E.03266
G1 X43.158 Y208.059 E.37139
G2 X42.947 Y208.484 I2.018 J1.267 E.02442
G1 X38.036 Y203.582 E.35607
G1 X38.036 Y204.218 E.03266
G1 X42.783 Y208.957 E.34416
G2 X42.686 Y209.497 I4.273 J1.043 E.02817
G1 X38.036 Y204.855 E.33716
G1 X38.036 Y205.491 E.03266
G1 X42.673 Y210.12 E.33619
G2 X42.816 Y210.899 I3.765 J-.287 E.0407
G1 X38.036 Y206.127 E.34654
M73 P72 R15
G1 X38.036 Y206.764 E.03266
G1 X49.38 Y218.089 E.82248
G1 X48.743 Y218.089 E.03271
G1 X38.036 Y207.4 E.77626
G1 X38.036 Y208.037 E.03266
G1 X48.105 Y218.089 E.73004
G1 X47.467 Y218.089 E.03271
G1 X38.036 Y208.673 E.68381
G1 X38.036 Y209.31 E.03266
G1 X46.83 Y218.089 E.63759
G1 X46.192 Y218.089 E.03271
G1 X38.036 Y209.946 E.59137
G1 X38.036 Y210.583 E.03266
G1 X45.555 Y218.089 E.54514
G1 X44.917 Y218.089 E.03271
G1 X38.036 Y211.219 E.49892
G1 X38.036 Y211.856 E.03266
G1 X44.28 Y218.089 E.4527
G1 X43.642 Y218.089 E.03271
G1 X38.036 Y212.492 E.40647
G1 X38.036 Y213.129 E.03266
G1 X43.005 Y218.089 E.36025
G1 X42.367 Y218.089 E.03271
G1 X38.036 Y213.765 E.31403
G1 X38.036 Y214.402 E.03266
G1 X41.73 Y218.089 E.2678
G1 X41.092 Y218.089 E.03271
G1 X38.036 Y215.038 E.22158
G1 X38.036 Y215.675 E.03266
G1 X40.455 Y218.089 E.17536
G1 X39.817 Y218.089 E.03271
G1 X38.036 Y216.311 E.12913
G1 X38.036 Y216.947 E.03266
G1 X39.179 Y218.089 E.08291
G1 X38.542 Y218.089 E.03271
G1 X37.833 Y217.382 E.05137
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X38.542 Y218.089 E-.38042
G1 X39.179 Y218.089 E-.24227
G1 X38.924 Y217.834 E-.13731
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/15
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
G17
G3 Z2.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 15
G1 X126.081 Y212.456
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X125.876 Y212.282 E.00891
G3 X127.807 Y206.666 I2.132 J-2.406 E.25104
G3 X129.176 Y206.879 I.188 J3.293 E.04629
G3 X126.133 Y212.486 I-1.167 J2.996 E.36188
G1 X126.388 Y212.175 F30000
G1 F16213.044
G1 X126.363 Y212.152 E.00114
G3 X127.838 Y207.072 I1.646 J-2.276 E.22867
G3 X128.761 Y207.17 I.18 J2.724 E.03096
G3 X126.597 Y212.304 I-.752 J2.706 E.31653
G1 X126.439 Y212.207 E.00616
G1 X126.572 Y211.804 F30000
G1 F16213.044
G1 X126.243 Y211.505 E.01474
G3 X127.868 Y207.478 I1.764 J-1.629 E.1799
G3 X128.651 Y207.562 I.011 J3.598 E.02616
G3 X126.622 Y211.837 I-.643 J2.314 E.27766
G1 X126.799 Y211.483 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X126.532 Y211.237 E.01116
G3 X127.898 Y207.869 I1.476 J-1.362 E.13953
G3 X128.349 Y207.895 I.097 J2.245 E.01392
G3 X126.85 Y211.515 I-.34 J1.98 E.22134
; WIPE_START
M204 S10000
G1 X126.532 Y211.237 E-.16047
G1 X126.398 Y211.089 E-.07607
G1 X126.189 Y210.747 E-.15213
G1 X126.052 Y210.371 E-.15211
G1 X125.992 Y209.975 E-.15215
G1 X126.001 Y209.799 E-.06708
; WIPE_END
G1 E-.04 F1800
G1 X118.371 Y209.599 Z2.8 F30000
G1 X43.928 Y207.65 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X44.127 Y207.469 E.00892
G3 X46.057 Y206.666 I2.132 J2.407 E.07063
G3 X47.426 Y206.879 I.188 J3.293 E.04629
G3 X43.892 Y207.699 I-1.167 J2.996 E.54229
G1 X44.214 Y207.94 F30000
G1 F16213.044
G1 X44.396 Y207.774 E.00816
G3 X46.088 Y207.072 I1.863 J2.102 E.06188
G3 X47.011 Y207.17 I.18 J2.724 E.03096
G3 X44.18 Y207.988 I-.752 J2.706 E.48248
G1 X44.514 Y208.219 F30000
G1 F16213.044
G1 X44.851 Y207.929 E.01474
G3 X46.118 Y207.478 I1.407 J1.946 E.04522
G3 X46.901 Y207.562 I.011 J3.598 E.02616
G3 X44.476 Y208.265 I-.643 J2.314 E.41236
G1 X44.752 Y208.54 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X44.782 Y208.513 E.00126
G3 X46.148 Y207.869 I1.477 J1.362 E.04756
G3 X46.599 Y207.895 I.097 J2.245 E.01392
G3 X44.542 Y208.831 I-.34 J1.98 E.31404
G1 X44.717 Y208.589 E.00918
; WIPE_START
M204 S10000
G1 X44.782 Y208.513 E-.03812
G1 X45.077 Y208.243 E-.15185
G1 X45.423 Y208.043 E-.15212
G1 X45.803 Y207.915 E-.15212
G1 X46.148 Y207.869 E-.13226
G1 X46.148 Y207.869 E0
G1 X46.4 Y207.87 E-.09595
G1 X46.498 Y207.883 E-.03757
; WIPE_END
G1 E-.04 F1800
G1 X46.76 Y200.255 Z2.8 F30000
G1 X49.338 Y125.101 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X49.41 Y125.361 E.00894
G3 X46.057 Y122.791 I-3.151 J.639 E.51725
G3 X47.426 Y123.004 I.188 J3.294 E.04628
G3 X49.328 Y125.042 I-1.167 J2.996 E.09565
G1 X48.944 Y125.205 F30000
G1 F16213.044
G1 X49.012 Y125.442 E.00817
G3 X46.088 Y123.197 I-2.753 J.559 E.45205
G3 X47.011 Y123.295 I.18 J2.726 E.03095
G3 X48.935 Y125.146 I-.752 J2.706 E.09229
G1 X48.535 Y125.295 F30000
G1 F16213.044
G1 X48.611 Y125.523 E.00795
G3 X46.118 Y123.603 I-2.353 J.478 E.38674
G3 X46.901 Y123.687 I.01 J3.604 E.02615
G3 X48.469 Y125.065 I-.643 J2.314 E.07163
G1 X48.518 Y125.238 E.00597
G1 X48.214 Y125.62 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X48.257 Y125.799 E.00567
G3 X46.148 Y123.994 I-1.999 J.201 E.29361
G3 X46.599 Y124.02 I.097 J2.243 E.01392
G3 X48.177 Y125.406 I-.341 J1.98 E.0679
G1 X48.204 Y125.561 E.00484
; WIPE_START
M204 S10000
G1 X48.257 Y125.799 E-.09284
G1 X48.25 Y126.2 E-.15242
G1 X48.171 Y126.593 E-.15212
G1 X48.015 Y126.961 E-.1521
G1 X47.79 Y127.292 E-.15213
G1 X47.68 Y127.399 E-.05839
; WIPE_END
G1 E-.04 F1800
G1 X54.557 Y130.71 Z2.8 F30000
G1 X201.166 Y201.291 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X54.834 Y201.291 E4.85411
G1 X54.834 Y50.709 E4.99509
G1 X201.166 Y50.709 E4.85411
G1 X201.166 Y201.231 E4.9931
G1 X200.759 Y200.884 F30000
G1 F16213.044
G1 X55.241 Y200.884 E4.82711
G1 X55.241 Y51.116 E4.96809
G1 X200.759 Y51.116 E4.82711
G1 X200.759 Y200.824 E4.9661
G1 X200.352 Y200.477 F30000
G1 F16213.044
G1 X55.648 Y200.477 E4.8001
G1 X55.648 Y51.523 E4.94108
G1 X200.352 Y51.523 E4.8001
G1 X200.352 Y200.417 E4.93909
G1 X199.96 Y200.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X56.04 Y200.085 E4.42226
G1 X56.04 Y51.915 E4.55285
G1 X199.96 Y51.915 E4.42226
G1 X199.96 Y200.025 E4.55101
; WIPE_START
M204 S10000
G1 X197.96 Y200.026 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X192.74 Y194.457 Z2.8 F30000
G1 X47.037 Y39.008 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X47.121 Y39.029 E.00289
G3 X47.426 Y39.13 I-.876 J3.181 E.01065
G3 X46.057 Y38.916 I-1.167 J2.996 E.62381
G3 X46.808 Y38.959 I.188 J3.294 E.025
G1 X46.978 Y38.995 E.00575
G1 X46.729 Y39.356 F30000
G1 F16213.044
G1 X46.738 Y39.357 E.00029
G3 X47.011 Y39.42 I-.471 J2.692 E.0093
G3 X46.088 Y39.322 I-.752 J2.706 E.55448
G3 X46.46 Y39.323 I.18 J2.727 E.01235
G1 X46.67 Y39.349 E.00701
G1 X46.439 Y39.731 F30000
G1 F16213.044
G1 X46.901 Y39.812 E.01554
G3 X46.118 Y39.728 I-.643 J2.314 E.47431
G3 X46.384 Y39.737 I.01 J3.606 E.0088
G1 X46.093 Y40.127 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X46.148 Y40.119 E.0017
G3 X46.599 Y40.145 I.097 J2.243 E.01392
G3 X45.803 Y40.168 I-.341 J1.98 E.36317
G1 X46.033 Y40.135 E.00714
; WIPE_START
M204 S10000
G1 X46.148 Y40.119 E-.04388
G1 X46.148 Y40.119 E0
G1 X46.4 Y40.12 E-.09596
G1 X46.599 Y40.145 E-.07617
G1 X46.794 Y40.19 E-.07614
G1 X47.167 Y40.336 E-.15215
G1 X47.503 Y40.553 E-.15209
G1 X47.79 Y40.833 E-.15213
G1 X47.807 Y40.858 E-.01148
; WIPE_END
G1 E-.04 F1800
G1 X55.438 Y40.701 Z2.8 F30000
G1 X126.589 Y39.237 Z2.8
G1 Z2.4
M73 P73 R15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X126.679 Y39.198 E.00327
G3 X127.807 Y38.916 I1.329 J2.927 E.03878
G3 X129.176 Y39.129 I.188 J3.294 E.04628
G3 X126.395 Y39.345 I-1.167 J2.996 E.57442
G1 X126.536 Y39.266 E.00537
G1 X127.14 Y39.451 F30000
G1 F16213.044
G1 X127.376 Y39.39 E.00808
G3 X127.838 Y39.322 I.634 J2.736 E.01551
G3 X128.761 Y39.42 I.18 J2.727 E.03094
G3 X127.085 Y39.474 I-.752 J2.706 E.52892
G1 X127.569 Y39.769 F30000
G1 F16213.044
G1 X127.868 Y39.728 E.01003
G3 X128.651 Y39.812 I.01 J3.605 E.02615
G3 X127.466 Y39.786 I-.643 J2.314 E.46082
G1 X127.51 Y39.779 E.00147
G1 X127.904 Y40.119 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X128.15 Y40.123 E.00755
G3 X128.349 Y40.145 I-.155 J2.24 E.00616
G3 X127.845 Y40.123 I-.341 J1.98 E.37224
; WIPE_START
M204 S10000
G1 X128.15 Y40.123 E-.11603
G1 X128.349 Y40.145 E-.07613
G1 X128.544 Y40.19 E-.07614
G1 X128.917 Y40.336 E-.15214
G1 X129.253 Y40.553 E-.15208
G1 X129.54 Y40.833 E-.15214
G1 X129.592 Y40.91 E-.03533
; WIPE_END
G1 E-.04 F1800
G1 X137.222 Y40.72 Z2.8 F30000
G1 X209.646 Y38.916 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X209.99 Y38.92 E.01143
G3 X210.926 Y39.129 I-.245 J3.29 E.03191
G3 X209.557 Y38.916 I-1.167 J2.996 E.62382
G1 X209.586 Y38.916 E.00094
G1 X209.464 Y39.339 F30000
G1 F16213.044
G1 X209.588 Y39.322 E.00413
G3 X210.511 Y39.42 I.18 J2.726 E.03095
G3 X209.126 Y39.39 I-.752 J2.706 E.53897
G1 X209.405 Y39.348 E.00938
G1 X209.558 Y39.736 F30000
G1 F16213.044
G1 X209.618 Y39.728 E.00202
G3 X210.401 Y39.812 I.01 J3.604 E.02615
G3 X209.216 Y39.786 I-.643 J2.314 E.46082
G1 X209.499 Y39.745 E.00948
G1 X209.654 Y40.119 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.9 Y40.123 E.00756
G3 X210.099 Y40.145 I-.155 J2.24 E.00616
G3 X209.594 Y40.123 I-.341 J1.98 E.37222
; WIPE_START
M204 S10000
G1 X209.9 Y40.123 E-.11622
G1 X210.099 Y40.145 E-.07613
G1 X210.294 Y40.19 E-.07613
G1 X210.667 Y40.336 E-.15215
G1 X211.003 Y40.553 E-.15212
G1 X211.29 Y40.833 E-.1521
G1 X211.342 Y40.909 E-.03515
; WIPE_END
G1 E-.04 F1800
G1 X211.063 Y48.537 Z2.8 F30000
G1 X208.339 Y123.112 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X208.429 Y123.073 E.00327
G3 X209.557 Y122.791 I1.329 J2.927 E.03878
G3 X210.926 Y123.004 I.188 J3.294 E.04628
G3 X208.145 Y123.219 I-1.167 J2.996 E.57442
G1 X208.286 Y123.141 E.00536
G1 X208.89 Y123.326 F30000
G1 F16213.044
G1 X209.126 Y123.265 E.00807
G3 X209.588 Y123.197 I.634 J2.736 E.01552
G3 X210.511 Y123.295 I.18 J2.727 E.03094
G3 X208.835 Y123.349 I-.752 J2.706 E.52892
G1 X209.319 Y123.644 F30000
G1 F16213.044
G1 X209.618 Y123.603 E.01002
G3 X210.401 Y123.687 I.01 J3.605 E.02615
G3 X209.216 Y123.661 I-.643 J2.314 E.46082
G1 X209.26 Y123.654 E.00147
G1 X209.654 Y123.994 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.9 Y123.998 E.00755
G3 X210.099 Y124.02 I-.155 J2.24 E.00616
G3 X209.594 Y123.998 I-.341 J1.98 E.37223
; WIPE_START
M204 S10000
G1 X209.9 Y123.998 E-.11615
G1 X210.099 Y124.02 E-.07613
G1 X210.484 Y124.129 E-.15213
G1 X210.841 Y124.311 E-.15208
G1 X211.154 Y124.561 E-.15213
G1 X211.342 Y124.785 E-.11138
; WIPE_END
G1 E-.04 F1800
G1 X211.184 Y132.416 Z2.8 F30000
G1 X209.645 Y206.666 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X209.99 Y206.67 E.01144
G3 X210.926 Y206.88 I-.245 J3.289 E.03192
G3 X209.557 Y206.666 I-1.167 J2.996 E.6238
G1 X209.585 Y206.666 E.00094
G1 X209.464 Y207.089 F30000
G1 F16213.044
G1 X209.588 Y207.072 E.00412
G3 X210.511 Y207.17 I.18 J2.727 E.03095
G3 X209.126 Y207.14 I-.752 J2.706 E.53897
G1 X209.405 Y207.098 E.00937
G1 X209.558 Y207.486 F30000
G1 F16213.044
G1 X209.618 Y207.478 E.00201
G3 X210.401 Y207.562 I.011 J3.601 E.02616
G3 X209.216 Y207.536 I-.643 J2.314 E.46082
G1 X209.499 Y207.495 E.00947
G1 X209.647 Y207.869 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.648 Y207.869 E.00002
G3 X210.099 Y207.895 I.097 J2.243 E.01392
G3 X209.303 Y207.918 I-.341 J1.98 E.36317
G1 X209.588 Y207.878 E.00882
; WIPE_START
M204 S10000
G1 X209.648 Y207.869 E-.02308
G1 X209.648 Y207.869 E0
G1 X209.9 Y207.87 E-.09596
G1 X210.099 Y207.895 E-.07617
G1 X210.294 Y207.94 E-.07613
G1 X210.667 Y208.086 E-.15213
G1 X211.003 Y208.303 E-.15214
G1 X211.29 Y208.583 E-.1521
G1 X211.338 Y208.653 E-.03228
; WIPE_END
G1 E-.04 F1800
G1 X215.771 Y214.866 Z2.8 F30000
G1 X218.334 Y218.459 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X37.666 Y218.459 E5.99308
G1 X37.666 Y33.541 E6.13406
G1 X218.334 Y33.541 E5.99308
G1 X218.334 Y218.399 E6.13207
G1 X218.741 Y218.866 F30000
G1 F16213.044
G1 X37.259 Y218.866 E6.02008
G1 X37.259 Y33.134 E6.16106
G1 X218.741 Y33.134 E6.02008
G1 X218.741 Y218.806 E6.15907
G1 X219.148 Y219.273 F30000
G1 F16213.044
G1 X36.852 Y219.273 E6.04709
G1 X36.852 Y32.727 E6.18807
G1 X219.148 Y32.727 E6.04709
G1 X219.148 Y219.213 E6.18608
G1 X219.54 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X36.46 Y219.665 E5.62554
G1 X36.46 Y32.335 E5.75613
G1 X219.54 Y32.335 E5.62554
G1 X219.54 Y219.605 E5.75429
; WIPE_START
M204 S10000
G1 X217.54 Y219.606 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X217.407 Y218.295 Z2.8 F30000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42025
G1 F15000
G1 X218.001 Y217.702 E.02579
G1 X218.001 Y217.168 E.01641
G1 X217.043 Y218.126 E.04162
G1 X216.51 Y218.126 E.01641
G1 X218.001 Y216.635 E.06482
G1 X218.001 Y216.101 E.01641
G1 X215.976 Y218.126 E.08802
G1 X215.443 Y218.126 E.01641
G1 X218.001 Y215.568 E.11123
G1 X218.001 Y215.034 E.01641
G1 X214.909 Y218.126 E.13443
G1 X214.375 Y218.126 E.01641
G1 X218.001 Y214.5 E.15764
G1 X218.001 Y213.967 E.01641
G1 X213.842 Y218.126 E.18084
G1 X213.308 Y218.126 E.01641
G1 X218.001 Y213.433 E.20404
G1 X218.001 Y212.899 E.01641
G1 X212.774 Y218.126 E.22725
G1 X212.241 Y218.126 E.01641
G1 X218.001 Y212.366 E.25045
G1 X218.001 Y211.832 E.01641
G1 X211.707 Y218.126 E.27366
G1 X211.174 Y218.126 E.01641
G1 X218.001 Y211.299 E.29686
G1 X218.001 Y210.765 E.01641
G1 X210.64 Y218.126 E.32006
G1 X210.106 Y218.126 E.01641
G1 X218.001 Y210.231 E.34327
G1 X218.001 Y209.698 E.01641
G1 X209.573 Y218.126 E.36647
G1 X209.039 Y218.126 E.01641
G1 X218.001 Y209.164 E.38968
G1 X218.001 Y208.63 E.01641
G1 X208.505 Y218.126 E.41288
G1 X207.972 Y218.126 E.01641
G1 X218.001 Y208.097 E.43608
G1 X218.001 Y207.563 E.01641
G1 X207.438 Y218.126 E.45929
G1 X206.905 Y218.126 E.01641
G1 X218.001 Y207.03 E.48249
G1 X218.001 Y206.496 E.01641
G1 X206.371 Y218.126 E.5057
G1 X205.837 Y218.126 E.01641
G1 X210.656 Y213.307 E.20954
G3 X210.012 Y213.417 I-1.18 J-4.959 E.0201
G1 X205.304 Y218.126 E.20475
G1 X204.77 Y218.126 E.01641
G1 X209.483 Y213.412 E.20495
G3 X209.015 Y213.347 I.09 J-2.377 E.01457
G1 X204.236 Y218.126 E.20778
G1 X203.703 Y218.126 E.01641
G1 X208.596 Y213.233 E.21276
G3 X208.219 Y213.076 I.593 J-1.963 E.01258
G1 X203.169 Y218.126 E.21957
G1 X202.636 Y218.126 E.01641
G1 X207.875 Y212.887 E.22781
G3 X207.561 Y212.666 I.942 J-1.676 E.0118
G1 X202.102 Y218.126 E.23738
G1 X201.568 Y218.126 E.01641
G1 X207.276 Y212.417 E.24821
G3 X207.02 Y212.14 I1.259 J-1.421 E.01163
G1 X201.035 Y218.126 E.26027
G1 X200.501 Y218.126 E.01641
G1 X206.792 Y211.834 E.27357
G3 X206.595 Y211.498 I1.579 J-1.155 E.01201
G1 X199.967 Y218.126 E.28818
G1 X199.434 Y218.126 E.01641
G1 X206.429 Y211.13 E.3042
G3 X206.302 Y210.723 I5.949 J-2.081 E.0131
G1 X198.9 Y218.126 E.32188
G1 X198.367 Y218.126 E.01641
G1 X206.224 Y210.268 E.34168
G3 X206.203 Y209.756 I2.549 J-.364 E.01578
G1 X197.833 Y218.126 E.36395
G1 X197.299 Y218.126 E.01641
G1 X206.278 Y209.147 E.39044
G3 X206.545 Y208.346 I3.701 J.788 E.02599
G1 X196.766 Y218.126 E.42523
G1 X196.232 Y218.126 E.01641
G1 X218.001 Y196.357 E.94657
G1 X218.001 Y196.891 E.01641
G1 X208.216 Y206.675 E.42546
G3 X209.024 Y206.401 I1.241 J2.331 E.02634
G1 X218.001 Y197.424 E.39034
G1 X218.001 Y197.958 E.01641
G1 X209.625 Y206.333 E.36418
G3 X210.143 Y206.349 I.195 J2.055 E.01596
G1 X218.001 Y198.492 E.34168
G1 X218.001 Y199.025 E.01641
G1 X210.596 Y206.43 E.32197
G3 X211.005 Y206.555 I-.419 J2.102 E.01316
G1 X218.001 Y199.559 E.3042
G1 X218.001 Y200.092 E.01641
G1 X211.376 Y206.717 E.28808
G3 X211.711 Y206.916 I-.826 J1.779 E.012
G1 X218.001 Y200.626 E.2735
G1 X218.001 Y201.16 E.01641
G1 X212.016 Y207.144 E.26022
G3 X212.293 Y207.401 I-1.145 J1.513 E.01163
G1 X218.001 Y201.693 E.24818
G1 X218.001 Y202.227 E.01641
G1 X212.542 Y207.686 E.23737
G3 X212.761 Y208 I-1.464 J1.257 E.0118
G1 X218.001 Y202.761 E.22782
G1 X218.001 Y203.294 E.01641
G1 X212.95 Y208.345 E.21961
G3 X213.106 Y208.723 I-1.809 J.964 E.01259
G1 X218.001 Y203.828 E.21285
G1 X218.001 Y204.361 E.01641
G1 X213.223 Y209.139 E.20774
G3 X213.288 Y209.607 I-4.814 J.909 E.01455
G1 X218.001 Y204.895 E.20491
G1 X218.001 Y205.429 E.01641
G1 X213.288 Y210.141 E.2049
G3 X213.179 Y210.784 I-3.728 J-.303 E.02008
G1 X218.17 Y205.793 E.21704
; WIPE_START
G1 X216.756 Y207.207 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X215.74 Y199.642 Z2.8 F30000
G1 X195.721 Y50.545 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F15000
G1 X212.391 Y33.874 E.72491
G1 X211.858 Y33.874 E.01641
G1 X195.357 Y50.376 E.71753
G1 X194.823 Y50.376 E.01641
G1 X211.324 Y33.874 E.71753
G1 X210.79 Y33.874 E.01641
G1 X194.289 Y50.376 E.71753
G1 X193.756 Y50.376 E.01641
G1 X210.257 Y33.874 E.71753
G1 X209.723 Y33.874 E.01641
G1 X193.222 Y50.376 E.71753
G1 X192.688 Y50.376 E.01641
G1 X209.19 Y33.874 E.71753
G1 X208.656 Y33.874 E.01641
G1 X192.155 Y50.376 E.71753
G1 X191.621 Y50.376 E.01641
G1 X208.122 Y33.874 E.71753
G1 X207.589 Y33.874 E.01641
G1 X191.088 Y50.376 E.71753
G1 X190.554 Y50.376 E.01641
G1 X207.055 Y33.874 E.71753
G1 X206.521 Y33.874 E.01641
G1 X190.02 Y50.376 E.71753
G1 X189.487 Y50.376 E.01641
G1 X205.988 Y33.874 E.71753
G1 X205.454 Y33.874 E.01641
G1 X188.953 Y50.376 E.71753
G1 X188.419 Y50.376 E.01641
G1 X204.921 Y33.874 E.71753
G1 X204.387 Y33.874 E.01641
G1 X187.886 Y50.376 E.71753
G1 X187.352 Y50.376 E.01641
G1 X203.853 Y33.874 E.71753
G1 X203.32 Y33.874 E.01641
G1 X186.819 Y50.376 E.71753
G1 X186.285 Y50.376 E.01641
G1 X202.786 Y33.874 E.71753
G1 X202.252 Y33.874 E.01641
G1 X185.751 Y50.376 E.71753
G1 X185.218 Y50.376 E.01641
G1 X201.719 Y33.874 E.71753
G1 X201.185 Y33.874 E.01641
G1 X184.684 Y50.376 E.71753
G1 X184.15 Y50.376 E.01641
G1 X200.652 Y33.874 E.71753
G1 X200.118 Y33.874 E.01641
G1 X183.617 Y50.376 E.71753
G1 X183.083 Y50.376 E.01641
G1 X199.584 Y33.874 E.71753
G1 X199.051 Y33.874 E.01641
G1 X182.55 Y50.376 E.71753
G1 X182.016 Y50.376 E.01641
G1 X198.517 Y33.874 E.71753
G1 X197.983 Y33.874 E.01641
G1 X181.482 Y50.376 E.71753
G1 X180.949 Y50.376 E.01641
G1 X197.45 Y33.874 E.71753
G1 X196.916 Y33.874 E.01641
G1 X180.415 Y50.376 E.71753
G1 X179.881 Y50.376 E.01641
G1 X196.383 Y33.874 E.71753
G1 X195.849 Y33.874 E.01641
G1 X179.348 Y50.376 E.71753
G1 X178.814 Y50.376 E.01641
G1 X195.315 Y33.874 E.71753
G1 X194.782 Y33.874 E.01641
G1 X178.281 Y50.376 E.71753
G1 X177.747 Y50.376 E.01641
G1 X194.248 Y33.874 E.71753
G1 X193.714 Y33.874 E.01641
G1 X177.213 Y50.376 E.71753
G1 X176.68 Y50.376 E.01641
G1 X193.181 Y33.874 E.71753
G1 X192.647 Y33.874 E.01641
G1 X176.146 Y50.376 E.71753
G1 X175.612 Y50.376 E.01641
G1 X192.113 Y33.874 E.71753
G1 X191.58 Y33.874 E.01641
G1 X175.079 Y50.376 E.71753
G1 X174.545 Y50.376 E.01641
G1 X191.046 Y33.874 E.71753
G1 X190.513 Y33.874 E.01641
G1 X174.012 Y50.376 E.71753
G1 X173.478 Y50.376 E.01641
G1 X189.979 Y33.874 E.71753
G1 X189.445 Y33.874 E.01641
G1 X172.944 Y50.376 E.71753
G1 X172.411 Y50.376 E.01641
G1 X188.912 Y33.874 E.71753
G1 X188.378 Y33.874 E.01641
G1 X171.877 Y50.376 E.71753
G1 X171.343 Y50.376 E.01641
G1 X187.844 Y33.874 E.71753
G1 X187.311 Y33.874 E.01641
G1 X170.81 Y50.376 E.71753
G1 X170.276 Y50.376 E.01641
G1 X186.777 Y33.874 E.71753
G1 X186.244 Y33.874 E.01641
G1 X169.743 Y50.376 E.71753
G1 X169.209 Y50.376 E.01641
G1 X185.71 Y33.874 E.71753
G1 X185.176 Y33.874 E.01641
G1 X168.675 Y50.376 E.71753
G1 X168.142 Y50.376 E.01641
G1 X184.643 Y33.874 E.71753
G1 X184.109 Y33.874 E.01641
G1 X167.608 Y50.376 E.71753
G1 X167.074 Y50.376 E.01641
G1 X183.575 Y33.874 E.71753
G1 X183.042 Y33.874 E.01641
G1 X166.541 Y50.376 E.71753
G1 X166.007 Y50.376 E.01641
G1 X182.508 Y33.874 E.71753
G1 X181.975 Y33.874 E.01641
G1 X165.474 Y50.376 E.71753
G1 X164.94 Y50.376 E.01641
G1 X181.441 Y33.874 E.71753
G1 X180.907 Y33.874 E.01641
G1 X164.406 Y50.376 E.71753
G1 X163.873 Y50.376 E.01641
G1 X180.374 Y33.874 E.71753
G1 X179.84 Y33.874 E.01641
G1 X163.339 Y50.376 E.71753
G1 X162.805 Y50.376 E.01641
G1 X179.306 Y33.874 E.71753
G1 X178.773 Y33.874 E.01641
G1 X162.272 Y50.376 E.71753
G1 X161.738 Y50.376 E.01641
G1 X178.239 Y33.874 E.71753
G1 X177.706 Y33.874 E.01641
G1 X161.205 Y50.376 E.71753
G1 X160.671 Y50.376 E.01641
G1 X177.172 Y33.874 E.71753
G1 X176.638 Y33.874 E.01641
G1 X160.137 Y50.376 E.71753
G1 X159.604 Y50.376 E.01641
G1 X176.105 Y33.874 E.71753
G1 X175.571 Y33.874 E.01641
G1 X159.07 Y50.376 E.71753
G1 X158.536 Y50.376 E.01641
G1 X175.037 Y33.874 E.71753
G1 X174.504 Y33.874 E.01641
G1 X158.003 Y50.376 E.71753
G1 X157.469 Y50.376 E.01641
G1 X173.97 Y33.874 E.71753
G1 X173.437 Y33.874 E.01641
G1 X156.936 Y50.376 E.71753
G1 X156.402 Y50.376 E.01641
G1 X172.903 Y33.874 E.71753
G1 X172.369 Y33.874 E.01641
G1 X155.868 Y50.376 E.71753
G1 X155.335 Y50.376 E.01641
G1 X171.836 Y33.874 E.71753
G1 X171.302 Y33.874 E.01641
G1 X154.801 Y50.376 E.71753
G1 X154.267 Y50.376 E.01641
G1 X170.768 Y33.874 E.71753
G1 X170.235 Y33.874 E.01641
G1 X153.734 Y50.376 E.71753
G1 X153.2 Y50.376 E.01641
G1 X169.701 Y33.874 E.71753
G1 X169.168 Y33.874 E.01641
G1 X152.667 Y50.376 E.71753
G1 X152.133 Y50.376 E.01641
G1 X168.634 Y33.874 E.71753
G1 X168.1 Y33.874 E.01641
G1 X151.599 Y50.376 E.71753
G1 X151.066 Y50.376 E.01641
G1 X167.567 Y33.874 E.71753
G1 X167.033 Y33.874 E.01641
G1 X150.532 Y50.376 E.71753
G1 X149.998 Y50.376 E.01641
G1 X166.499 Y33.874 E.71753
G1 X165.966 Y33.874 E.01641
G1 X149.465 Y50.376 E.71753
G1 X148.931 Y50.376 E.01641
G1 X165.432 Y33.874 E.71753
G1 X164.899 Y33.874 E.01641
G1 X148.398 Y50.376 E.71753
G1 X147.864 Y50.376 E.01641
G1 X164.365 Y33.874 E.71753
G1 X163.831 Y33.874 E.01641
G1 X147.33 Y50.376 E.71753
G1 X146.797 Y50.376 E.01641
G1 X163.298 Y33.874 E.71753
G1 X162.764 Y33.874 E.01641
G1 X146.263 Y50.376 E.71753
G1 X145.729 Y50.376 E.01641
G1 X162.23 Y33.874 E.71753
M73 P74 R15
G1 X161.697 Y33.874 E.01641
G1 X145.196 Y50.376 E.71753
G1 X144.662 Y50.376 E.01641
G1 X161.163 Y33.874 E.71753
G1 X160.63 Y33.874 E.01641
G1 X144.129 Y50.376 E.71753
G1 X143.595 Y50.376 E.01641
G1 X160.096 Y33.874 E.71753
G1 X159.562 Y33.874 E.01641
G1 X143.061 Y50.376 E.71753
G1 X142.528 Y50.376 E.01641
G1 X159.029 Y33.874 E.71753
G1 X158.495 Y33.874 E.01641
G1 X141.994 Y50.376 E.71753
G1 X141.46 Y50.376 E.01641
G1 X157.961 Y33.874 E.71753
G1 X157.428 Y33.874 E.01641
G1 X140.927 Y50.376 E.71753
G1 X140.393 Y50.376 E.01641
G1 X156.894 Y33.874 E.71753
G1 X156.361 Y33.874 E.01641
G1 X139.86 Y50.376 E.71753
G1 X139.326 Y50.376 E.01641
G1 X155.827 Y33.874 E.71753
G1 X155.293 Y33.874 E.01641
G1 X138.792 Y50.376 E.71753
G1 X138.259 Y50.376 E.01641
G1 X154.76 Y33.874 E.71753
G1 X154.226 Y33.874 E.01641
G1 X137.725 Y50.376 E.71753
G1 X137.191 Y50.376 E.01641
G1 X153.692 Y33.874 E.71753
G1 X153.159 Y33.874 E.01641
G1 X136.658 Y50.376 E.71753
G1 X136.124 Y50.376 E.01641
G1 X152.625 Y33.874 E.71753
G1 X152.092 Y33.874 E.01641
G1 X135.591 Y50.376 E.71753
G1 X135.057 Y50.376 E.01641
G1 X151.558 Y33.874 E.71753
G1 X151.024 Y33.874 E.01641
G1 X134.523 Y50.376 E.71753
G1 X133.99 Y50.376 E.01641
G1 X150.491 Y33.874 E.71753
G1 X149.957 Y33.874 E.01641
G1 X133.456 Y50.376 E.71753
G1 X132.922 Y50.376 E.01641
G1 X149.423 Y33.874 E.71753
G1 X148.89 Y33.874 E.01641
G1 X132.389 Y50.376 E.71753
G1 X131.855 Y50.376 E.01641
G1 X148.356 Y33.874 E.71753
G1 X147.823 Y33.874 E.01641
G1 X131.322 Y50.376 E.71753
G1 X130.788 Y50.376 E.01641
G1 X147.289 Y33.874 E.71753
G1 X146.755 Y33.874 E.01641
G1 X130.254 Y50.376 E.71753
G1 X129.721 Y50.376 E.01641
G1 X146.222 Y33.874 E.71753
G1 X145.688 Y33.874 E.01641
G1 X129.187 Y50.376 E.71753
G1 X128.653 Y50.376 E.01641
G1 X145.154 Y33.874 E.71753
G1 X144.621 Y33.874 E.01641
G1 X128.12 Y50.376 E.71753
G1 X127.586 Y50.376 E.01641
G1 X144.087 Y33.874 E.71753
G1 X143.554 Y33.874 E.01641
G1 X127.053 Y50.376 E.71753
G1 X126.519 Y50.376 E.01641
G1 X143.02 Y33.874 E.71753
G1 X142.486 Y33.874 E.01641
G1 X125.985 Y50.376 E.71753
G1 X125.452 Y50.376 E.01641
G1 X141.953 Y33.874 E.71753
G1 X141.419 Y33.874 E.01641
G1 X124.918 Y50.376 E.71753
G1 X124.384 Y50.376 E.01641
G1 X129.354 Y45.405 E.21612
G3 X128.602 Y45.625 I-1.088 J-2.335 E.0242
G1 X123.851 Y50.376 E.20659
G1 X123.317 Y50.376 E.01641
G1 X128.02 Y45.673 E.20449
G3 X127.517 Y45.642 I.022 J-4.432 E.01549
G1 X122.784 Y50.376 E.20584
G1 X122.25 Y50.376 E.01641
G1 X127.076 Y45.55 E.20984
G3 X126.676 Y45.416 I.469 J-2.065 E.01298
G1 X121.716 Y50.376 E.21566
G1 X121.183 Y50.376 E.01641
G1 X126.312 Y45.246 E.22305
G3 X125.981 Y45.044 I.845 J-1.757 E.01196
G1 X120.649 Y50.376 E.23185
G1 X120.115 Y50.376 E.01641
G1 X125.679 Y44.811 E.24194
G3 X125.407 Y44.551 I1.169 J-1.496 E.01162
G1 X119.582 Y50.376 E.25329
G1 X119.048 Y50.376 E.01641
G1 X125.163 Y44.261 E.26589
G3 X124.95 Y43.94 I1.495 J-1.227 E.01185
G1 X118.515 Y50.376 E.27982
G1 X117.981 Y50.376 E.01641
G1 X124.768 Y43.589 E.29511
G3 X124.62 Y43.203 I1.858 J-.93 E.01273
G1 X117.447 Y50.376 E.31191
G1 X116.914 Y50.376 E.01641
G1 X124.513 Y42.776 E.33044
G3 X124.453 Y42.303 I2.339 J-.536 E.01471
G1 X116.38 Y50.376 E.35104
G1 X115.846 Y50.376 E.01641
G1 X124.473 Y41.749 E.3751
G3 X124.611 Y41.077 I3.539 J.379 E.02113
G1 X115.313 Y50.376 E.40432
G1 X114.779 Y50.376 E.01641
G1 X131.28 Y33.874 E.71753
G1 X131.814 Y33.874 E.01641
G1 X126.954 Y38.734 E.21133
G3 X127.626 Y38.596 I1.126 J3.762 E.02113
G1 X132.347 Y33.874 E.2053
M73 P74 R14
G1 X132.881 Y33.874 E.01641
G1 X128.173 Y38.583 E.20474
G3 X128.653 Y38.636 I-.208 J4.104 E.01488
G1 X133.415 Y33.874 E.20704
G1 X133.948 Y33.874 E.01641
G1 X129.078 Y38.745 E.21179
G3 X129.463 Y38.893 I-.549 J1.999 E.01271
G1 X134.482 Y33.874 E.21825
G1 X135.016 Y33.874 E.01641
G1 X129.814 Y39.076 E.22619
G3 X130.134 Y39.29 I-.906 J1.7 E.01185
G1 X135.549 Y33.874 E.23549
G1 X136.083 Y33.874 E.01641
G1 X130.424 Y39.533 E.24606
G3 X130.686 Y39.805 I-1.223 J1.442 E.01162
G1 X136.616 Y33.874 E.25787
G1 X137.15 Y33.874 E.01641
G1 X130.92 Y40.105 E.27092
G3 X131.123 Y40.435 I-9.519 J6.095 E.01192
G1 X137.684 Y33.874 E.28527
G1 X138.217 Y33.874 E.01641
G1 X131.292 Y40.799 E.30112
G3 X131.425 Y41.2 I-1.941 J.864 E.01301
G1 X138.751 Y33.874 E.31856
G1 X139.285 Y33.874 E.01641
G1 X131.515 Y41.644 E.33786
G3 X131.551 Y42.142 I-4.907 J.605 E.01535
G1 X139.818 Y33.874 E.3595
G1 X140.352 Y33.874 E.01641
G1 X131.496 Y42.73 E.38508
G3 X131.283 Y43.477 I-3.806 J-.683 E.02393
G1 X141.055 Y33.705 E.42494
G1 X130.916 Y33.705 F30000
G1 F15000
G1 X114.246 Y50.376 E.72491
G1 X113.712 Y50.376 E.01641
G1 X130.213 Y33.874 E.71753
G1 X129.679 Y33.874 E.01641
G1 X113.178 Y50.376 E.71753
G1 X112.645 Y50.376 E.01641
G1 X129.146 Y33.874 E.71753
G1 X128.612 Y33.874 E.01641
G1 X112.111 Y50.376 E.71753
G1 X111.577 Y50.376 E.01641
G1 X128.078 Y33.874 E.71753
G1 X127.545 Y33.874 E.01641
G1 X111.044 Y50.376 E.71753
G1 X110.51 Y50.376 E.01641
G1 X127.011 Y33.874 E.71753
G1 X126.478 Y33.874 E.01641
G1 X109.977 Y50.376 E.71753
G1 X109.443 Y50.376 E.01641
G1 X125.944 Y33.874 E.71753
G1 X125.41 Y33.874 E.01641
G1 X108.909 Y50.376 E.71753
G1 X108.376 Y50.376 E.01641
G1 X124.877 Y33.874 E.71753
G1 X124.343 Y33.874 E.01641
G1 X107.842 Y50.376 E.71753
G1 X107.308 Y50.376 E.01641
G1 X123.809 Y33.874 E.71753
G1 X123.276 Y33.874 E.01641
G1 X106.775 Y50.376 E.71753
G1 X106.241 Y50.376 E.01641
G1 X122.742 Y33.874 E.71753
G1 X122.209 Y33.874 E.01641
G1 X105.708 Y50.376 E.71753
G1 X105.174 Y50.376 E.01641
G1 X121.675 Y33.874 E.71753
G1 X121.141 Y33.874 E.01641
G1 X104.64 Y50.376 E.71753
G1 X104.107 Y50.376 E.01641
G1 X120.608 Y33.874 E.71753
G1 X120.074 Y33.874 E.01641
G1 X103.573 Y50.376 E.71753
G1 X103.039 Y50.376 E.01641
G1 X119.54 Y33.874 E.71753
G1 X119.007 Y33.874 E.01641
G1 X102.506 Y50.376 E.71753
G1 X101.972 Y50.376 E.01641
G1 X118.473 Y33.874 E.71753
G1 X117.94 Y33.874 E.01641
G1 X101.439 Y50.376 E.71753
G1 X100.905 Y50.376 E.01641
G1 X117.406 Y33.874 E.71753
G1 X116.872 Y33.874 E.01641
G1 X100.371 Y50.376 E.71753
G1 X99.838 Y50.376 E.01641
G1 X116.339 Y33.874 E.71753
G1 X115.805 Y33.874 E.01641
G1 X99.304 Y50.376 E.71753
G1 X98.77 Y50.376 E.01641
G1 X115.271 Y33.874 E.71753
G1 X114.738 Y33.874 E.01641
G1 X98.237 Y50.376 E.71753
G1 X97.703 Y50.376 E.01641
G1 X114.204 Y33.874 E.71753
G1 X113.671 Y33.874 E.01641
G1 X97.17 Y50.376 E.71753
G1 X96.636 Y50.376 E.01641
G1 X113.137 Y33.874 E.71753
G1 X112.603 Y33.874 E.01641
G1 X96.102 Y50.376 E.71753
G1 X95.569 Y50.376 E.01641
G1 X112.07 Y33.874 E.71753
G1 X111.536 Y33.874 E.01641
G1 X95.035 Y50.376 E.71753
G1 X94.501 Y50.376 E.01641
G1 X111.002 Y33.874 E.71753
G1 X110.469 Y33.874 E.01641
G1 X93.968 Y50.376 E.71753
G1 X93.434 Y50.376 E.01641
G1 X109.935 Y33.874 E.71753
G1 X109.402 Y33.874 E.01641
G1 X92.9 Y50.376 E.71753
G1 X92.367 Y50.376 E.01641
G1 X108.868 Y33.874 E.71753
G1 X108.334 Y33.874 E.01641
G1 X91.833 Y50.376 E.71753
G1 X91.3 Y50.376 E.01641
G1 X107.801 Y33.874 E.71753
G1 X107.267 Y33.874 E.01641
G1 X90.766 Y50.376 E.71753
G1 X90.232 Y50.376 E.01641
G1 X106.733 Y33.874 E.71753
G1 X106.2 Y33.874 E.01641
G1 X89.699 Y50.376 E.71753
G1 X89.165 Y50.376 E.01641
G1 X105.666 Y33.874 E.71753
G1 X105.133 Y33.874 E.01641
G1 X88.631 Y50.376 E.71753
G1 X88.098 Y50.376 E.01641
G1 X104.599 Y33.874 E.71753
G1 X104.065 Y33.874 E.01641
G1 X87.564 Y50.376 E.71753
G1 X87.031 Y50.376 E.01641
G1 X103.532 Y33.874 E.71753
G1 X102.998 Y33.874 E.01641
G1 X86.497 Y50.376 E.71753
G1 X85.963 Y50.376 E.01641
G1 X102.464 Y33.874 E.71753
G1 X101.931 Y33.874 E.01641
G1 X85.43 Y50.376 E.71753
G1 X84.896 Y50.376 E.01641
G1 X101.397 Y33.874 E.71753
G1 X100.864 Y33.874 E.01641
G1 X84.362 Y50.376 E.71753
G1 X83.829 Y50.376 E.01641
G1 X100.33 Y33.874 E.71753
G1 X99.796 Y33.874 E.01641
G1 X83.295 Y50.376 E.71753
G1 X82.762 Y50.376 E.01641
G1 X99.263 Y33.874 E.71753
G1 X98.729 Y33.874 E.01641
G1 X82.228 Y50.376 E.71753
G1 X81.694 Y50.376 E.01641
G1 X98.195 Y33.874 E.71753
G1 X97.662 Y33.874 E.01641
G1 X81.161 Y50.376 E.71753
G1 X80.627 Y50.376 E.01641
G1 X97.128 Y33.874 E.71753
G1 X96.595 Y33.874 E.01641
G1 X80.093 Y50.376 E.71753
G1 X79.56 Y50.376 E.01641
G1 X96.061 Y33.874 E.71753
G1 X95.527 Y33.874 E.01641
G1 X79.026 Y50.376 E.71753
G1 X78.493 Y50.376 E.01641
G1 X94.994 Y33.874 E.71753
G1 X94.46 Y33.874 E.01641
G1 X77.959 Y50.376 E.71753
G1 X77.425 Y50.376 E.01641
G1 X93.926 Y33.874 E.71753
G1 X93.393 Y33.874 E.01641
G1 X76.892 Y50.376 E.71753
G1 X76.358 Y50.376 E.01641
G1 X92.859 Y33.874 E.71753
G1 X92.326 Y33.874 E.01641
G1 X75.824 Y50.376 E.71753
G1 X75.291 Y50.376 E.01641
G1 X91.792 Y33.874 E.71753
G1 X91.258 Y33.874 E.01641
G1 X74.757 Y50.376 E.71753
G1 X74.224 Y50.376 E.01641
G1 X90.725 Y33.874 E.71753
G1 X90.191 Y33.874 E.01641
G1 X73.69 Y50.376 E.71753
G1 X73.156 Y50.376 E.01641
G1 X89.657 Y33.874 E.71753
G1 X89.124 Y33.874 E.01641
G1 X72.623 Y50.376 E.71753
G1 X72.089 Y50.376 E.01641
G1 X88.59 Y33.874 E.71753
G1 X88.057 Y33.874 E.01641
G1 X71.555 Y50.376 E.71753
G1 X71.022 Y50.376 E.01641
G1 X87.523 Y33.874 E.71753
G1 X86.989 Y33.874 E.01641
G1 X70.488 Y50.376 E.71753
G1 X69.955 Y50.376 E.01641
G1 X86.456 Y33.874 E.71753
G1 X85.922 Y33.874 E.01641
G1 X69.421 Y50.376 E.71753
G1 X68.887 Y50.376 E.01641
G1 X85.388 Y33.874 E.71753
G1 X84.855 Y33.874 E.01641
G1 X68.354 Y50.376 E.71753
G1 X67.82 Y50.376 E.01641
G1 X84.321 Y33.874 E.71753
G1 X83.788 Y33.874 E.01641
G1 X67.286 Y50.376 E.71753
G1 X66.753 Y50.376 E.01641
G1 X83.254 Y33.874 E.71753
G1 X82.72 Y33.874 E.01641
G1 X66.219 Y50.376 E.71753
G1 X65.686 Y50.376 E.01641
G1 X82.187 Y33.874 E.71753
G1 X81.653 Y33.874 E.01641
G1 X65.152 Y50.376 E.71753
G1 X64.618 Y50.376 E.01641
G1 X81.119 Y33.874 E.71753
G1 X80.586 Y33.874 E.01641
G1 X64.085 Y50.376 E.71753
G1 X63.551 Y50.376 E.01641
G1 X80.052 Y33.874 E.71753
G1 X79.519 Y33.874 E.01641
G1 X63.017 Y50.376 E.71753
G1 X62.484 Y50.376 E.01641
G1 X78.985 Y33.874 E.71753
G1 X78.451 Y33.874 E.01641
G1 X61.95 Y50.376 E.71753
G1 X61.417 Y50.376 E.01641
G1 X77.918 Y33.874 E.71753
G1 X77.384 Y33.874 E.01641
G1 X60.883 Y50.376 E.71753
G1 X60.349 Y50.376 E.01641
G1 X76.85 Y33.874 E.71753
G1 X76.317 Y33.874 E.01641
G1 X59.816 Y50.376 E.71753
G1 X59.282 Y50.376 E.01641
G1 X75.783 Y33.874 E.71753
G1 X75.25 Y33.874 E.01641
G1 X58.748 Y50.376 E.71753
G1 X58.215 Y50.376 E.01641
G1 X74.716 Y33.874 E.71753
G1 X74.182 Y33.874 E.01641
G1 X57.681 Y50.376 E.71753
G1 X57.148 Y50.376 E.01641
G1 X73.649 Y33.874 E.71753
G1 X73.115 Y33.874 E.01641
G1 X56.614 Y50.376 E.71753
G1 X56.08 Y50.376 E.01641
G1 X72.581 Y33.874 E.71753
G1 X72.048 Y33.874 E.01641
G1 X55.547 Y50.376 E.71753
G1 X55.013 Y50.376 E.01641
G1 X71.514 Y33.874 E.71753
G1 X70.981 Y33.874 E.01641
G1 X37.999 Y66.856 E1.43414
G1 X37.999 Y67.389 E.01641
G1 X54.501 Y50.888 E.71753
G1 X54.501 Y51.422 E.01641
G1 X37.999 Y67.923 E.71753
G1 X37.999 Y68.456 E.01641
G1 X54.501 Y51.955 E.71753
G1 X54.501 Y52.489 E.01641
G1 X37.999 Y68.99 E.71753
G1 X37.999 Y69.524 E.01641
G1 X54.501 Y53.023 E.71753
G1 X54.501 Y53.556 E.01641
G1 X37.999 Y70.057 E.71753
G1 X37.999 Y70.591 E.01641
G1 X54.501 Y54.09 E.71753
G1 X54.501 Y54.623 E.01641
G1 X37.999 Y71.125 E.71753
G1 X37.999 Y71.658 E.01641
G1 X54.501 Y55.157 E.71753
G1 X54.501 Y55.691 E.01641
G1 X37.999 Y72.192 E.71753
G1 X37.999 Y72.725 E.01641
G1 X54.501 Y56.224 E.71753
G1 X54.501 Y56.758 E.01641
G1 X37.999 Y73.259 E.71753
G1 X37.999 Y73.793 E.01641
G1 X54.501 Y57.292 E.71753
G1 X54.501 Y57.825 E.01641
G1 X37.999 Y74.326 E.71753
G1 X37.999 Y74.86 E.01641
G1 X54.501 Y58.359 E.71753
G1 X54.501 Y58.892 E.01641
G1 X37.999 Y75.394 E.71753
G1 X37.999 Y75.927 E.01641
G1 X54.501 Y59.426 E.71753
G1 X54.501 Y59.96 E.01641
G1 X37.999 Y76.461 E.71753
G1 X37.999 Y76.994 E.01641
G1 X54.501 Y60.493 E.71753
G1 X54.501 Y61.027 E.01641
G1 X37.999 Y77.528 E.71753
G1 X37.999 Y78.062 E.01641
G1 X54.501 Y61.561 E.71753
G1 X54.501 Y62.094 E.01641
G1 X37.999 Y78.595 E.71753
G1 X37.999 Y79.129 E.01641
G1 X54.501 Y62.628 E.71753
G1 X54.501 Y63.161 E.01641
G1 X37.999 Y79.663 E.71753
G1 X37.999 Y80.196 E.01641
G1 X54.501 Y63.695 E.71753
G1 X54.501 Y64.229 E.01641
G1 X37.999 Y80.73 E.71753
G1 X37.999 Y81.263 E.01641
G1 X54.501 Y64.762 E.71753
G1 X54.501 Y65.296 E.01641
G1 X37.999 Y81.797 E.71753
G1 X37.999 Y82.331 E.01641
G1 X54.501 Y65.83 E.71753
G1 X54.501 Y66.363 E.01641
G1 X37.999 Y82.864 E.71753
G1 X37.999 Y83.398 E.01641
G1 X54.501 Y66.897 E.71753
G1 X54.501 Y67.43 E.01641
G1 X37.999 Y83.932 E.71753
G1 X37.999 Y84.465 E.01641
G1 X54.501 Y67.964 E.71753
G1 X54.501 Y68.498 E.01641
G1 X37.999 Y84.999 E.71753
G1 X37.999 Y85.532 E.01641
G1 X54.501 Y69.031 E.71753
G1 X54.501 Y69.565 E.01641
G1 X37.999 Y86.066 E.71753
G1 X37.999 Y86.6 E.01641
G1 X54.501 Y70.099 E.71753
G1 X54.501 Y70.632 E.01641
G1 X37.999 Y87.133 E.71753
G1 X37.999 Y87.667 E.01641
G1 X54.501 Y71.166 E.71753
G1 X54.501 Y71.699 E.01641
G1 X37.999 Y88.201 E.71753
G1 X37.999 Y88.734 E.01641
G1 X54.501 Y72.233 E.71753
G1 X54.501 Y72.767 E.01641
G1 X37.999 Y89.268 E.71753
G1 X37.999 Y89.801 E.01641
G1 X54.501 Y73.3 E.71753
G1 X54.501 Y73.834 E.01641
G1 X37.999 Y90.335 E.71753
G1 X37.999 Y90.869 E.01641
G1 X54.501 Y74.368 E.71753
G1 X54.501 Y74.901 E.01641
G1 X37.999 Y91.402 E.71753
G1 X37.999 Y91.936 E.01641
G1 X54.501 Y75.435 E.71753
G1 X54.501 Y75.968 E.01641
G1 X37.999 Y92.47 E.71753
G1 X37.999 Y93.003 E.01641
G1 X54.501 Y76.502 E.71753
G1 X54.501 Y77.036 E.01641
G1 X37.999 Y93.537 E.71753
G1 X37.999 Y94.07 E.01641
G1 X54.501 Y77.569 E.71753
G1 X54.501 Y78.103 E.01641
G1 X37.999 Y94.604 E.71753
G1 X37.999 Y95.138 E.01641
G1 X54.501 Y78.637 E.71753
G1 X54.501 Y79.17 E.01641
G1 X37.999 Y95.671 E.71753
G1 X37.999 Y96.205 E.01641
G1 X54.501 Y79.704 E.71753
G1 X54.501 Y80.237 E.01641
G1 X37.999 Y96.739 E.71753
G1 X37.999 Y97.272 E.01641
G1 X54.501 Y80.771 E.71753
G1 X54.501 Y81.305 E.01641
G1 X37.999 Y97.806 E.71753
G1 X37.999 Y98.339 E.01641
G1 X54.501 Y81.838 E.71753
G1 X54.501 Y82.372 E.01641
G1 X37.999 Y98.873 E.71753
G1 X37.999 Y99.407 E.01641
G1 X54.501 Y82.906 E.71753
G1 X54.501 Y83.439 E.01641
G1 X37.999 Y99.94 E.71753
G1 X37.999 Y100.474 E.01641
G1 X54.501 Y83.973 E.71753
G1 X54.501 Y84.506 E.01641
G1 X37.999 Y101.008 E.71753
G1 X37.999 Y101.541 E.01641
G1 X54.501 Y85.04 E.71753
G1 X54.501 Y85.574 E.01641
G1 X37.999 Y102.075 E.71753
G1 X37.999 Y102.608 E.01641
G1 X54.501 Y86.107 E.71753
G1 X54.501 Y86.641 E.01641
G1 X37.999 Y103.142 E.71753
G1 X37.999 Y103.676 E.01641
G1 X54.501 Y87.175 E.71753
G1 X54.501 Y87.708 E.01641
G1 X37.999 Y104.209 E.71753
G1 X37.999 Y104.743 E.01641
G1 X54.501 Y88.242 E.71753
G1 X54.501 Y88.775 E.01641
G1 X37.999 Y105.277 E.71753
G1 X37.999 Y105.81 E.01641
G1 X54.501 Y89.309 E.71753
G1 X54.501 Y89.843 E.01641
G1 X37.999 Y106.344 E.71753
G1 X37.999 Y106.877 E.01641
G1 X54.501 Y90.376 E.71753
G1 X54.501 Y90.91 E.01641
G1 X37.999 Y107.411 E.71753
G1 X37.999 Y107.945 E.01641
G1 X54.501 Y91.444 E.71753
G1 X54.501 Y91.977 E.01641
G1 X37.999 Y108.478 E.71753
G1 X37.999 Y109.012 E.01641
G1 X54.501 Y92.511 E.71753
G1 X54.501 Y93.044 E.01641
G1 X37.999 Y109.546 E.71753
G1 X37.999 Y110.079 E.01641
G1 X54.501 Y93.578 E.71753
G1 X54.501 Y94.112 E.01641
G1 X37.999 Y110.613 E.71753
G1 X37.999 Y111.146 E.01641
G1 X54.501 Y94.645 E.71753
G1 X54.501 Y95.179 E.01641
G1 X37.999 Y111.68 E.71753
G1 X37.999 Y112.214 E.01641
G1 X54.501 Y95.713 E.71753
G1 X54.501 Y96.246 E.01641
G1 X37.999 Y112.747 E.71753
G1 X37.999 Y113.281 E.01641
G1 X54.501 Y96.78 E.71753
G1 X54.501 Y97.313 E.01641
G1 X37.999 Y113.815 E.71753
G1 X37.999 Y114.348 E.01641
G1 X54.501 Y97.847 E.71753
G1 X54.501 Y98.381 E.01641
G1 X37.999 Y114.882 E.71753
G1 X37.999 Y115.415 E.01641
G1 X54.501 Y98.914 E.71753
G1 X54.501 Y99.448 E.01641
G1 X37.999 Y115.949 E.71753
G1 X37.999 Y116.483 E.01641
G1 X54.501 Y99.982 E.71753
G1 X54.501 Y100.515 E.01641
G1 X37.999 Y117.016 E.71753
G1 X37.999 Y117.55 E.01641
G1 X54.501 Y101.049 E.71753
G1 X54.501 Y101.582 E.01641
G1 X37.999 Y118.084 E.71753
M73 P75 R14
G1 X37.999 Y118.617 E.01641
G1 X54.501 Y102.116 E.71753
G1 X54.501 Y102.65 E.01641
G1 X37.999 Y119.151 E.71753
G1 X37.999 Y119.684 E.01641
G1 X54.501 Y103.183 E.71753
G1 X54.501 Y103.717 E.01641
G1 X37.999 Y120.218 E.71753
G1 X37.999 Y120.752 E.01641
G1 X54.501 Y104.251 E.71753
G1 X54.501 Y104.784 E.01641
G1 X37.999 Y121.285 E.71753
G1 X37.999 Y121.819 E.01641
G1 X54.501 Y105.318 E.71753
G1 X54.501 Y105.851 E.01641
G1 X37.999 Y122.353 E.71753
G1 X37.999 Y122.886 E.01641
G1 X54.501 Y106.385 E.71753
G1 X54.501 Y106.919 E.01641
G1 X37.999 Y123.42 E.71753
G1 X37.999 Y123.953 E.01641
G1 X54.501 Y107.452 E.71753
G1 X54.501 Y107.986 E.01641
G1 X37.999 Y124.487 E.71753
G1 X37.999 Y125.021 E.01641
G1 X54.501 Y108.52 E.71753
G1 X54.501 Y109.053 E.01641
G1 X37.999 Y125.554 E.71753
G1 X37.999 Y126.088 E.01641
G1 X54.501 Y109.587 E.71753
G1 X54.501 Y110.12 E.01641
G1 X37.999 Y126.622 E.71753
G1 X37.999 Y127.155 E.01641
G1 X54.501 Y110.654 E.71753
G1 X54.501 Y111.188 E.01641
G1 X37.999 Y127.689 E.71753
G1 X37.999 Y128.222 E.01641
G1 X54.501 Y111.721 E.71753
G1 X54.501 Y112.255 E.01641
G1 X37.83 Y128.926 E.72491
; WIPE_START
G1 X39.244 Y127.512 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.464 Y125.037 Z2.8 F30000
G1 X54.67 Y122.224 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F15000
G1 X49.527 Y127.367 E.22363
G2 X49.744 Y126.616 I-3.675 J-1.47 E.02407
G1 X54.501 Y121.86 E.20681
G1 X54.501 Y121.327 E.01641
G1 X49.8 Y126.027 E.20438
G2 X49.766 Y125.527 I-4.688 J.071 E.0154
G1 X54.501 Y120.793 E.20587
G1 X54.501 Y120.259 E.01641
G1 X49.677 Y125.083 E.20975
G2 X49.545 Y124.681 I-2.078 J.46 E.01302
G1 X54.501 Y119.726 E.21549
G1 X54.501 Y119.192 E.01641
G1 X49.376 Y124.316 E.22282
G2 X49.174 Y123.985 I-9.462 J5.559 E.01193
G1 X54.501 Y118.658 E.23163
G1 X54.501 Y118.125 E.01641
G1 X48.941 Y123.685 E.24176
G2 X48.679 Y123.413 I-1.489 J1.171 E.01162
G1 X54.501 Y117.591 E.25314
G1 X54.501 Y117.058 E.01641
G1 X48.389 Y123.169 E.26575
G2 X48.07 Y122.955 I-1.23 J1.488 E.01184
G1 X54.501 Y116.524 E.27963
G1 X54.501 Y115.99 E.01641
G1 X47.719 Y122.771 E.29487
G2 X47.335 Y122.622 I-.937 J1.847 E.0127
G1 X54.501 Y115.457 E.31159
G1 X54.501 Y114.923 E.01641
G1 X46.911 Y122.512 E.33001
G2 X46.432 Y122.458 I-.704 J4.048 E.01483
G1 X54.501 Y114.389 E.35084
G1 X54.501 Y113.856 E.01641
G1 X45.886 Y122.47 E.37458
G2 X45.217 Y122.606 I.424 J3.811 E.02102
G1 X54.501 Y113.322 E.40368
G1 X54.501 Y112.789 E.01641
G1 X37.999 Y129.29 E.71753
G1 X37.999 Y129.823 E.01641
G1 X42.857 Y124.966 E.21122
G2 X42.722 Y125.635 I3.402 J1.036 E.02101
G1 X37.999 Y130.357 E.20534
G1 X37.999 Y130.891 E.01641
G1 X42.704 Y126.186 E.20456
G2 X42.764 Y126.659 I2.392 J-.066 E.01469
G1 X37.999 Y131.424 E.20719
G1 X37.999 Y131.958 E.01641
G1 X42.872 Y127.085 E.2119
G2 X43.02 Y127.471 I2 J-.546 E.01272
G1 X37.999 Y132.491 E.21833
G1 X37.999 Y133.025 E.01641
G1 X43.203 Y127.822 E.22626
G2 X43.417 Y128.141 I1.702 J-.907 E.01185
G1 X37.999 Y133.559 E.23556
G1 X37.999 Y134.092 E.01641
G1 X43.661 Y128.43 E.2462
G2 X43.935 Y128.691 I1.437 J-1.234 E.01162
G1 X37.999 Y134.626 E.25809
G1 X37.999 Y135.16 E.01641
G1 X44.237 Y128.922 E.27122
G2 X44.568 Y129.124 I1.172 J-1.555 E.01196
G1 X37.999 Y135.693 E.28565
G1 X37.999 Y136.227 E.01641
G1 X44.933 Y129.294 E.30148
G2 X45.333 Y129.427 I.866 J-1.934 E.01299
G1 X37.999 Y136.76 E.31889
G1 X37.999 Y137.294 E.01641
G1 X45.775 Y129.518 E.33812
G2 X46.28 Y129.548 I.516 J-4.506 E.01554
G1 X37.999 Y137.828 E.36005
G1 X37.999 Y138.361 E.01641
G1 X46.863 Y129.498 E.3854
G2 X47.622 Y129.273 I-.364 J-2.614 E.02444
G1 X37.999 Y138.895 E.41841
G1 X37.999 Y139.429 E.01641
G1 X54.501 Y122.927 E.71753
G1 X54.501 Y123.461 E.01641
G1 X37.999 Y139.962 E.71753
G1 X37.999 Y140.496 E.01641
G1 X54.501 Y123.995 E.71753
G1 X54.501 Y124.528 E.01641
G1 X37.999 Y141.029 E.71753
G1 X37.999 Y141.563 E.01641
G1 X54.501 Y125.062 E.71753
G1 X54.501 Y125.596 E.01641
G1 X37.999 Y142.097 E.71753
G1 X37.999 Y142.63 E.01641
G1 X54.501 Y126.129 E.71753
G1 X54.501 Y126.663 E.01641
G1 X37.999 Y143.164 E.71753
G1 X37.999 Y143.698 E.01641
G1 X54.501 Y127.196 E.71753
G1 X54.501 Y127.73 E.01641
G1 X37.999 Y144.231 E.71753
G1 X37.999 Y144.765 E.01641
G1 X54.501 Y128.264 E.71753
G1 X54.501 Y128.797 E.01641
G1 X37.999 Y145.298 E.71753
G1 X37.999 Y145.832 E.01641
G1 X54.501 Y129.331 E.71753
G1 X54.501 Y129.865 E.01641
G1 X37.999 Y146.366 E.71753
G1 X37.999 Y146.899 E.01641
G1 X54.501 Y130.398 E.71753
G1 X54.501 Y130.932 E.01641
G1 X37.999 Y147.433 E.71753
G1 X37.999 Y147.967 E.01641
G1 X54.501 Y131.466 E.71753
G1 X54.501 Y131.999 E.01641
G1 X37.999 Y148.5 E.71753
G1 X37.999 Y149.034 E.01641
G1 X54.501 Y132.533 E.71753
G1 X54.501 Y133.066 E.01641
G1 X37.999 Y149.567 E.71753
G1 X37.999 Y150.101 E.01641
G1 X54.501 Y133.6 E.71753
G1 X54.501 Y134.134 E.01641
G1 X37.999 Y150.635 E.71753
G1 X37.999 Y151.168 E.01641
G1 X54.501 Y134.667 E.71753
G1 X54.501 Y135.201 E.01641
G1 X37.999 Y151.702 E.71753
G1 X37.999 Y152.236 E.01641
G1 X54.501 Y135.735 E.71753
G1 X54.501 Y136.268 E.01641
G1 X37.999 Y152.769 E.71753
G1 X37.999 Y153.303 E.01641
G1 X54.501 Y136.802 E.71753
G1 X54.501 Y137.335 E.01641
G1 X37.999 Y153.836 E.71753
G1 X37.999 Y154.37 E.01641
G1 X54.501 Y137.869 E.71753
G1 X54.501 Y138.403 E.01641
G1 X37.999 Y154.904 E.71753
G1 X37.999 Y155.437 E.01641
G1 X54.501 Y138.936 E.71753
G1 X54.501 Y139.47 E.01641
G1 X37.999 Y155.971 E.71753
G1 X37.999 Y156.505 E.01641
G1 X54.501 Y140.004 E.71753
G1 X54.501 Y140.537 E.01641
G1 X37.999 Y157.038 E.71753
G1 X37.999 Y157.572 E.01641
G1 X54.501 Y141.071 E.71753
G1 X54.501 Y141.604 E.01641
G1 X37.999 Y158.105 E.71753
G1 X37.999 Y158.639 E.01641
G1 X54.501 Y142.138 E.71753
G1 X54.501 Y142.672 E.01641
G1 X37.999 Y159.173 E.71753
G1 X37.999 Y159.706 E.01641
G1 X54.501 Y143.205 E.71753
G1 X54.501 Y143.739 E.01641
G1 X37.999 Y160.24 E.71753
G1 X37.999 Y160.774 E.01641
G1 X54.501 Y144.273 E.71753
G1 X54.501 Y144.806 E.01641
G1 X37.999 Y161.307 E.71753
G1 X37.999 Y161.841 E.01641
G1 X54.501 Y145.34 E.71753
G1 X54.501 Y145.873 E.01641
G1 X37.999 Y162.374 E.71753
G1 X37.999 Y162.908 E.01641
G1 X54.501 Y146.407 E.71753
G1 X54.501 Y146.941 E.01641
G1 X37.999 Y163.442 E.71753
G1 X37.999 Y163.975 E.01641
G1 X54.501 Y147.474 E.71753
G1 X54.501 Y148.008 E.01641
G1 X37.999 Y164.509 E.71753
G1 X37.999 Y165.043 E.01641
G1 X54.501 Y148.542 E.71753
G1 X54.501 Y149.075 E.01641
G1 X37.999 Y165.576 E.71753
G1 X37.999 Y166.11 E.01641
G1 X54.501 Y149.609 E.71753
G1 X54.501 Y150.142 E.01641
G1 X37.999 Y166.643 E.71753
G1 X37.999 Y167.177 E.01641
G1 X54.501 Y150.676 E.71753
G1 X54.501 Y151.21 E.01641
G1 X37.999 Y167.711 E.71753
G1 X37.999 Y168.244 E.01641
G1 X54.501 Y151.743 E.71753
G1 X54.501 Y152.277 E.01641
G1 X37.999 Y168.778 E.71753
G1 X37.999 Y169.312 E.01641
G1 X54.501 Y152.811 E.71753
G1 X54.501 Y153.344 E.01641
G1 X37.999 Y169.845 E.71753
G1 X37.999 Y170.379 E.01641
G1 X54.501 Y153.878 E.71753
G1 X54.501 Y154.411 E.01641
G1 X37.999 Y170.912 E.71753
G1 X37.999 Y171.446 E.01641
G1 X54.501 Y154.945 E.71753
G1 X54.501 Y155.479 E.01641
G1 X37.999 Y171.98 E.71753
G1 X37.999 Y172.513 E.01641
G1 X54.501 Y156.012 E.71753
G1 X54.501 Y156.546 E.01641
G1 X37.999 Y173.047 E.71753
G1 X37.999 Y173.581 E.01641
G1 X54.501 Y157.08 E.71753
G1 X54.501 Y157.613 E.01641
G1 X37.999 Y174.114 E.71753
G1 X37.999 Y174.648 E.01641
G1 X54.501 Y158.147 E.71753
G1 X54.501 Y158.68 E.01641
G1 X37.999 Y175.181 E.71753
G1 X37.999 Y175.715 E.01641
G1 X54.501 Y159.214 E.71753
G1 X54.501 Y159.748 E.01641
G1 X37.999 Y176.249 E.71753
G1 X37.999 Y176.782 E.01641
G1 X54.501 Y160.281 E.71753
G1 X54.501 Y160.815 E.01641
G1 X37.999 Y177.316 E.71753
G1 X37.999 Y177.85 E.01641
G1 X54.501 Y161.349 E.71753
G1 X54.501 Y161.882 E.01641
G1 X37.999 Y178.383 E.71753
G1 X37.999 Y178.917 E.01641
G1 X54.501 Y162.416 E.71753
G1 X54.501 Y162.949 E.01641
G1 X37.999 Y179.45 E.71753
G1 X37.999 Y179.984 E.01641
G1 X54.501 Y163.483 E.71753
G1 X54.501 Y164.017 E.01641
G1 X37.999 Y180.518 E.71753
G1 X37.999 Y181.051 E.01641
G1 X54.501 Y164.55 E.71753
G1 X54.501 Y165.084 E.01641
G1 X37.999 Y181.585 E.71753
G1 X37.999 Y182.119 E.01641
G1 X54.501 Y165.618 E.71753
G1 X54.501 Y166.151 E.01641
G1 X37.999 Y182.652 E.71753
G1 X37.999 Y183.186 E.01641
G1 X54.501 Y166.685 E.71753
G1 X54.501 Y167.218 E.01641
G1 X37.999 Y183.719 E.71753
G1 X37.999 Y184.253 E.01641
G1 X54.501 Y167.752 E.71753
G1 X54.501 Y168.286 E.01641
G1 X37.999 Y184.787 E.71753
G1 X37.999 Y185.32 E.01641
G1 X54.501 Y168.819 E.71753
G1 X54.501 Y169.353 E.01641
G1 X37.999 Y185.854 E.71753
G1 X37.999 Y186.388 E.01641
G1 X54.501 Y169.887 E.71753
G1 X54.501 Y170.42 E.01641
G1 X37.999 Y186.921 E.71753
G1 X37.999 Y187.455 E.01641
G1 X54.501 Y170.954 E.71753
G1 X54.501 Y171.487 E.01641
G1 X37.999 Y187.988 E.71753
G1 X37.999 Y188.522 E.01641
G1 X54.501 Y172.021 E.71753
G1 X54.501 Y172.555 E.01641
G1 X37.999 Y189.056 E.71753
G1 X37.999 Y189.589 E.01641
G1 X54.501 Y173.088 E.71753
G1 X54.501 Y173.622 E.01641
G1 X37.999 Y190.123 E.71753
G1 X37.999 Y190.657 E.01641
G1 X54.501 Y174.156 E.71753
G1 X54.501 Y174.689 E.01641
G1 X37.999 Y191.19 E.71753
G1 X37.999 Y191.724 E.01641
G1 X54.501 Y175.223 E.71753
G1 X54.501 Y175.756 E.01641
G1 X37.999 Y192.257 E.71753
G1 X37.999 Y192.791 E.01641
G1 X54.501 Y176.29 E.71753
G1 X54.501 Y176.824 E.01641
G1 X37.999 Y193.325 E.71753
G1 X37.999 Y193.858 E.01641
G1 X54.501 Y177.357 E.71753
G1 X54.501 Y177.891 E.01641
G1 X37.999 Y194.392 E.71753
G1 X37.999 Y194.926 E.01641
G1 X54.501 Y178.425 E.71753
G1 X54.501 Y178.958 E.01641
G1 X37.999 Y195.459 E.71753
G1 X37.999 Y195.993 E.01641
G1 X54.501 Y179.492 E.71753
G1 X54.501 Y180.025 E.01641
G1 X37.999 Y196.526 E.71753
G1 X37.999 Y197.06 E.01641
G1 X54.501 Y180.559 E.71753
G1 X54.501 Y181.093 E.01641
G1 X37.999 Y197.594 E.71753
G1 X37.999 Y198.127 E.01641
G1 X54.501 Y181.626 E.71753
G1 X54.501 Y182.16 E.01641
G1 X37.999 Y198.661 E.71753
G1 X37.999 Y199.195 E.01641
G1 X54.501 Y182.694 E.71753
G1 X54.501 Y183.227 E.01641
G1 X37.999 Y199.728 E.71753
G1 X37.999 Y200.262 E.01641
G1 X54.501 Y183.761 E.71753
G1 X54.501 Y184.294 E.01641
G1 X37.999 Y200.795 E.71753
G1 X37.999 Y201.329 E.01641
G1 X54.501 Y184.828 E.71753
G1 X54.501 Y185.362 E.01641
G1 X37.999 Y201.863 E.71753
G1 X37.999 Y202.396 E.01641
G1 X54.501 Y185.895 E.71753
G1 X54.501 Y186.429 E.01641
G1 X37.999 Y202.93 E.71753
G1 X37.999 Y203.464 E.01641
G1 X54.501 Y186.963 E.71753
G1 X54.501 Y187.496 E.01641
G1 X37.999 Y203.997 E.71753
G1 X37.999 Y204.531 E.01641
G1 X54.501 Y188.03 E.71753
G1 X54.501 Y188.563 E.01641
G1 X37.999 Y205.064 E.71753
G1 X37.999 Y205.598 E.01641
G1 X54.501 Y189.097 E.71753
G1 X54.501 Y189.631 E.01641
G1 X37.999 Y206.132 E.71753
G1 X37.999 Y206.665 E.01641
G1 X54.501 Y190.164 E.71753
G1 X54.501 Y190.698 E.01641
G1 X37.999 Y207.199 E.71753
G1 X37.999 Y207.733 E.01641
G1 X54.501 Y191.232 E.71753
G1 X54.501 Y191.765 E.01641
G1 X37.999 Y208.266 E.71753
G1 X37.999 Y208.8 E.01641
G1 X54.501 Y192.299 E.71753
G1 X54.501 Y192.832 E.01641
G1 X37.999 Y209.333 E.71753
G1 X37.999 Y209.867 E.01641
G1 X54.501 Y193.366 E.71753
G1 X54.501 Y193.9 E.01641
G1 X37.999 Y210.401 E.71753
G1 X37.999 Y210.934 E.01641
G1 X54.501 Y194.433 E.71753
G1 X54.501 Y194.967 E.01641
G1 X37.999 Y211.468 E.71753
G1 X37.999 Y212.002 E.01641
G1 X54.501 Y195.501 E.71753
G1 X54.501 Y196.034 E.01641
G1 X37.83 Y212.705 E.72491
; WIPE_START
G1 X39.244 Y211.291 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.091 Y207.919 Z2.8 F30000
G1 X59.219 Y201.455 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F15000
G1 X49.582 Y211.091 E.41903
G2 X49.761 Y210.379 I-3.341 J-1.219 E.02264
G1 X58.515 Y201.624 E.38066
G1 X57.982 Y201.624 E.01641
G1 X49.798 Y209.808 E.35585
G2 X49.754 Y209.319 I-2.469 J-.02 E.01512
G1 X57.448 Y201.624 E.33459
G1 X56.915 Y201.624 E.01641
G1 X49.657 Y208.882 E.31557
G2 X49.519 Y208.487 I-6.949 J2.222 E.01287
G1 X56.381 Y201.624 E.2984
G1 X55.847 Y201.624 E.01641
G1 X49.341 Y208.131 E.28291
G2 X49.132 Y207.806 I-1.732 J.883 E.01189
G1 X55.314 Y201.624 E.26878
G1 X54.78 Y201.624 E.01641
G1 X48.895 Y207.51 E.25592
G2 X48.628 Y207.243 I-1.466 J1.195 E.01162
G1 X54.501 Y201.37 E.25535
G1 X54.501 Y200.837 E.01641
G1 X48.333 Y207.004 E.26817
G2 X48.009 Y206.795 I-1.21 J1.519 E.01189
G1 X54.501 Y200.303 E.28227
G1 X54.501 Y199.77 E.01641
G1 X47.653 Y206.617 E.29774
G2 X47.263 Y206.473 I-.911 J1.878 E.01281
G1 X54.501 Y199.236 E.31471
G1 X54.501 Y198.702 E.01641
G1 X46.83 Y206.373 E.33354
G2 X46.336 Y206.333 I-.404 J1.935 E.01527
G1 X54.501 Y198.169 E.35501
G1 X54.501 Y197.635 E.01641
G1 X45.78 Y206.356 E.37922
G2 X45.077 Y206.525 I.642 J4.222 E.02223
G1 X54.501 Y197.101 E.40976
G1 X54.501 Y196.568 E.01641
G1 X37.999 Y213.069 E.71753
G1 X37.999 Y213.602 E.01641
G1 X42.9 Y208.702 E.21307
G2 X42.732 Y209.403 I3.893 J1.299 E.02218
G1 X37.999 Y214.136 E.2058
G1 X37.999 Y214.67 E.01641
G1 X42.703 Y209.966 E.20452
G2 X42.748 Y210.455 I4.463 J-.169 E.01508
G1 X37.999 Y215.203 E.20649
G1 X37.999 Y215.737 E.01641
G1 X42.85 Y210.887 E.21091
G2 X42.992 Y211.278 I2.029 J-.515 E.01283
G1 X37.999 Y216.271 E.21709
G1 X37.999 Y216.804 E.01641
G1 X43.169 Y211.635 E.2248
G2 X43.378 Y211.959 I1.728 J-.881 E.01189
G1 X37.999 Y217.338 E.23387
G1 X37.999 Y217.871 E.01641
G1 X43.616 Y212.255 E.24424
G2 X43.883 Y212.521 I1.469 J-1.202 E.01162
G1 X38.279 Y218.126 E.24369
G1 X38.813 Y218.126 E.01641
G1 X44.178 Y212.76 E.23332
G2 X44.505 Y212.967 I1.195 J-1.526 E.01191
G1 X39.346 Y218.126 E.22433
G1 X39.88 Y218.126 E.01641
G1 X44.864 Y213.142 E.21672
G2 X45.258 Y213.281 I.894 J-1.902 E.01288
G1 X40.413 Y218.126 E.21066
G1 X40.947 Y218.126 E.01641
G1 X45.694 Y213.379 E.2064
G2 X46.181 Y213.425 I.711 J-4.904 E.01506
G1 X41.481 Y218.126 E.20439
G1 X42.014 Y218.126 E.01641
G1 X46.753 Y213.387 E.20605
G2 X47.465 Y213.209 I-.539 J-3.666 E.02259
G1 X42.548 Y218.126 E.21379
G1 X43.082 Y218.126 E.01641
G1 X59.583 Y201.624 E.71753
G1 X60.116 Y201.624 E.01641
G1 X43.615 Y218.126 E.71753
G1 X44.149 Y218.126 E.01641
G1 X60.65 Y201.624 E.71753
G1 X61.184 Y201.624 E.01641
G1 X44.682 Y218.126 E.71753
G1 X45.216 Y218.126 E.01641
G1 X61.717 Y201.624 E.71753
G1 X62.251 Y201.624 E.01641
G1 X45.75 Y218.126 E.71753
G1 X46.283 Y218.126 E.01641
G1 X62.784 Y201.624 E.71753
G1 X63.318 Y201.624 E.01641
G1 X46.817 Y218.126 E.71753
G1 X47.351 Y218.126 E.01641
G1 X63.852 Y201.624 E.71753
G1 X64.385 Y201.624 E.01641
G1 X47.884 Y218.126 E.71753
G1 X48.418 Y218.126 E.01641
G1 X64.919 Y201.624 E.71753
G1 X65.453 Y201.624 E.01641
G1 X48.952 Y218.126 E.71753
G1 X49.485 Y218.126 E.01641
G1 X65.986 Y201.624 E.71753
G1 X66.52 Y201.624 E.01641
G1 X50.019 Y218.126 E.71753
G1 X50.552 Y218.126 E.01641
G1 X67.053 Y201.624 E.71753
G1 X67.587 Y201.624 E.01641
G1 X51.086 Y218.126 E.71753
G1 X51.62 Y218.126 E.01641
G1 X68.121 Y201.624 E.71753
G1 X68.654 Y201.624 E.01641
G1 X52.153 Y218.126 E.71753
G1 X52.687 Y218.126 E.01641
G1 X69.188 Y201.624 E.71753
G1 X69.722 Y201.624 E.01641
G1 X53.221 Y218.126 E.71753
G1 X53.754 Y218.126 E.01641
G1 X70.255 Y201.624 E.71753
G1 X70.789 Y201.624 E.01641
G1 X54.288 Y218.126 E.71753
G1 X54.821 Y218.126 E.01641
G1 X71.322 Y201.624 E.71753
G1 X71.856 Y201.624 E.01641
G1 X55.355 Y218.126 E.71753
G1 X55.889 Y218.126 E.01641
G1 X72.39 Y201.624 E.71753
G1 X72.923 Y201.624 E.01641
G1 X56.422 Y218.126 E.71753
G1 X56.956 Y218.126 E.01641
G1 X73.457 Y201.624 E.71753
G1 X73.991 Y201.624 E.01641
G1 X57.49 Y218.126 E.71753
G1 X58.023 Y218.126 E.01641
G1 X74.524 Y201.624 E.71753
G1 X75.058 Y201.624 E.01641
G1 X58.557 Y218.126 E.71753
G1 X59.09 Y218.126 E.01641
G1 X75.591 Y201.624 E.71753
G1 X76.125 Y201.624 E.01641
G1 X59.624 Y218.126 E.71753
G1 X60.158 Y218.126 E.01641
G1 X76.659 Y201.624 E.71753
G1 X77.192 Y201.624 E.01641
G1 X60.691 Y218.126 E.71753
G1 X61.225 Y218.126 E.01641
G1 X77.726 Y201.624 E.71753
G1 X78.26 Y201.624 E.01641
G1 X61.759 Y218.126 E.71753
G1 X62.292 Y218.126 E.01641
G1 X78.793 Y201.624 E.71753
G1 X79.327 Y201.624 E.01641
G1 X62.826 Y218.126 E.71753
G1 X63.359 Y218.126 E.01641
G1 X79.86 Y201.624 E.71753
G1 X80.394 Y201.624 E.01641
G1 X63.893 Y218.126 E.71753
G1 X64.427 Y218.126 E.01641
G1 X80.928 Y201.624 E.71753
G1 X81.461 Y201.624 E.01641
G1 X64.96 Y218.126 E.71753
G1 X65.494 Y218.126 E.01641
G1 X81.995 Y201.624 E.71753
G1 X82.529 Y201.624 E.01641
G1 X66.028 Y218.126 E.71753
G1 X66.561 Y218.126 E.01641
G1 X83.062 Y201.624 E.71753
G1 X83.596 Y201.624 E.01641
G1 X67.095 Y218.126 E.71753
G1 X67.628 Y218.126 E.01641
G1 X84.129 Y201.624 E.71753
G1 X84.663 Y201.624 E.01641
G1 X68.162 Y218.126 E.71753
G1 X68.696 Y218.126 E.01641
G1 X85.197 Y201.624 E.71753
G1 X85.73 Y201.624 E.01641
G1 X69.229 Y218.126 E.71753
G1 X69.763 Y218.126 E.01641
G1 X86.264 Y201.624 E.71753
G1 X86.798 Y201.624 E.01641
G1 X70.297 Y218.126 E.71753
G1 X70.83 Y218.126 E.01641
G1 X87.331 Y201.624 E.71753
M73 P75 R13
G1 X87.865 Y201.624 E.01641
G1 X71.364 Y218.126 E.71753
G1 X71.897 Y218.126 E.01641
G1 X88.398 Y201.624 E.71753
G1 X88.932 Y201.624 E.01641
G1 X72.431 Y218.126 E.71753
G1 X72.965 Y218.126 E.01641
G1 X89.466 Y201.624 E.71753
G1 X89.999 Y201.624 E.01641
G1 X73.498 Y218.126 E.71753
G1 X74.032 Y218.126 E.01641
G1 X90.533 Y201.624 E.71753
G1 X91.067 Y201.624 E.01641
G1 X74.566 Y218.126 E.71753
G1 X75.099 Y218.126 E.01641
G1 X91.6 Y201.624 E.71753
G1 X92.134 Y201.624 E.01641
G1 X75.633 Y218.126 E.71753
G1 X76.166 Y218.126 E.01641
G1 X92.667 Y201.624 E.71753
G1 X93.201 Y201.624 E.01641
G1 X76.7 Y218.126 E.71753
G1 X77.234 Y218.126 E.01641
G1 X93.735 Y201.624 E.71753
G1 X94.268 Y201.624 E.01641
G1 X77.767 Y218.126 E.71753
G1 X78.301 Y218.126 E.01641
G1 X94.802 Y201.624 E.71753
G1 X95.336 Y201.624 E.01641
G1 X78.835 Y218.126 E.71753
M73 P76 R13
G1 X79.368 Y218.126 E.01641
G1 X95.869 Y201.624 E.71753
G1 X96.403 Y201.624 E.01641
G1 X79.902 Y218.126 E.71753
G1 X80.435 Y218.126 E.01641
G1 X96.936 Y201.624 E.71753
G1 X97.47 Y201.624 E.01641
G1 X80.969 Y218.126 E.71753
G1 X81.503 Y218.126 E.01641
G1 X98.004 Y201.624 E.71753
G1 X98.537 Y201.624 E.01641
G1 X82.036 Y218.126 E.71753
G1 X82.57 Y218.126 E.01641
G1 X99.071 Y201.624 E.71753
G1 X99.605 Y201.624 E.01641
G1 X83.104 Y218.126 E.71753
G1 X83.637 Y218.126 E.01641
G1 X100.138 Y201.624 E.71753
G1 X100.672 Y201.624 E.01641
G1 X84.171 Y218.126 E.71753
G1 X84.704 Y218.126 E.01641
G1 X101.205 Y201.624 E.71753
G1 X101.739 Y201.624 E.01641
G1 X85.238 Y218.126 E.71753
G1 X85.772 Y218.126 E.01641
G1 X102.273 Y201.624 E.71753
G1 X102.806 Y201.624 E.01641
G1 X86.305 Y218.126 E.71753
G1 X86.839 Y218.126 E.01641
G1 X103.34 Y201.624 E.71753
G1 X103.874 Y201.624 E.01641
G1 X87.373 Y218.126 E.71753
G1 X87.906 Y218.126 E.01641
G1 X104.407 Y201.624 E.71753
G1 X104.941 Y201.624 E.01641
G1 X88.44 Y218.126 E.71753
G1 X88.973 Y218.126 E.01641
G1 X105.474 Y201.624 E.71753
G1 X106.008 Y201.624 E.01641
G1 X89.507 Y218.126 E.71753
G1 X90.041 Y218.126 E.01641
G1 X106.542 Y201.624 E.71753
G1 X107.075 Y201.624 E.01641
G1 X90.574 Y218.126 E.71753
G1 X91.108 Y218.126 E.01641
G1 X107.609 Y201.624 E.71753
G1 X108.143 Y201.624 E.01641
G1 X91.642 Y218.126 E.71753
G1 X92.175 Y218.126 E.01641
G1 X108.676 Y201.624 E.71753
G1 X109.21 Y201.624 E.01641
G1 X92.709 Y218.126 E.71753
G1 X93.242 Y218.126 E.01641
G1 X109.743 Y201.624 E.71753
G1 X110.277 Y201.624 E.01641
G1 X93.776 Y218.126 E.71753
G1 X94.31 Y218.126 E.01641
G1 X110.811 Y201.624 E.71753
G1 X111.344 Y201.624 E.01641
G1 X94.843 Y218.126 E.71753
G1 X95.377 Y218.126 E.01641
G1 X111.878 Y201.624 E.71753
G1 X112.412 Y201.624 E.01641
G1 X95.911 Y218.126 E.71753
G1 X96.444 Y218.126 E.01641
G1 X112.945 Y201.624 E.71753
G1 X113.479 Y201.624 E.01641
G1 X96.978 Y218.126 E.71753
G1 X97.511 Y218.126 E.01641
G1 X114.012 Y201.624 E.71753
G1 X114.546 Y201.624 E.01641
G1 X98.045 Y218.126 E.71753
G1 X98.579 Y218.126 E.01641
G1 X115.08 Y201.624 E.71753
G1 X115.613 Y201.624 E.01641
G1 X99.112 Y218.126 E.71753
G1 X99.646 Y218.126 E.01641
G1 X116.147 Y201.624 E.71753
G1 X116.681 Y201.624 E.01641
G1 X100.18 Y218.126 E.71753
G1 X100.713 Y218.126 E.01641
G1 X117.214 Y201.624 E.71753
G1 X117.748 Y201.624 E.01641
G1 X101.247 Y218.126 E.71753
G1 X101.78 Y218.126 E.01641
G1 X118.281 Y201.624 E.71753
G1 X118.815 Y201.624 E.01641
G1 X102.314 Y218.126 E.71753
G1 X102.848 Y218.126 E.01641
G1 X119.349 Y201.624 E.71753
G1 X119.882 Y201.624 E.01641
G1 X103.381 Y218.126 E.71753
G1 X103.915 Y218.126 E.01641
G1 X120.416 Y201.624 E.71753
G1 X120.95 Y201.624 E.01641
G1 X104.449 Y218.126 E.71753
G1 X104.982 Y218.126 E.01641
G1 X121.483 Y201.624 E.71753
G1 X122.017 Y201.624 E.01641
G1 X105.516 Y218.126 E.71753
G1 X106.049 Y218.126 E.01641
G1 X122.55 Y201.624 E.71753
G1 X123.084 Y201.624 E.01641
G1 X106.583 Y218.126 E.71753
G1 X107.117 Y218.126 E.01641
G1 X123.618 Y201.624 E.71753
G1 X124.151 Y201.624 E.01641
G1 X107.65 Y218.126 E.71753
G1 X108.184 Y218.126 E.01641
G1 X124.685 Y201.624 E.71753
G1 X125.219 Y201.624 E.01641
G1 X108.718 Y218.126 E.71753
G1 X109.251 Y218.126 E.01641
G1 X125.752 Y201.624 E.71753
G1 X126.286 Y201.624 E.01641
G1 X109.785 Y218.126 E.71753
G1 X110.318 Y218.126 E.01641
G1 X126.819 Y201.624 E.71753
G1 X127.353 Y201.624 E.01641
G1 X110.852 Y218.126 E.71753
G1 X111.386 Y218.126 E.01641
G1 X127.887 Y201.624 E.71753
G1 X128.42 Y201.624 E.01641
G1 X111.919 Y218.126 E.71753
G1 X112.453 Y218.126 E.01641
G1 X128.954 Y201.624 E.71753
G1 X129.488 Y201.624 E.01641
G1 X112.987 Y218.126 E.71753
G1 X113.52 Y218.126 E.01641
G1 X130.021 Y201.624 E.71753
G1 X130.555 Y201.624 E.01641
G1 X113.884 Y218.295 E.72491
G1 X124.023 Y218.295 F30000
G1 F15000
G1 X129.056 Y213.262 E.21885
G3 X128.383 Y213.402 I-1.088 J-3.551 E.02117
G1 X123.659 Y218.126 E.20539
G1 X123.125 Y218.126 E.01641
G1 X127.831 Y213.42 E.20463
G3 X127.354 Y213.363 I.044 J-2.414 E.0148
G1 X122.592 Y218.126 E.20709
G1 X122.058 Y218.126 E.01641
G1 X126.926 Y213.258 E.21167
G3 X126.539 Y213.112 I.534 J-2.005 E.01273
G1 X121.525 Y218.126 E.21802
G1 X120.991 Y218.126 E.01641
G1 X126.189 Y212.928 E.22601
G3 X125.87 Y212.713 I.914 J-1.702 E.01184
G1 X120.457 Y218.126 E.23535
G1 X119.924 Y218.126 E.01641
G1 X125.58 Y212.469 E.24595
G3 X125.318 Y212.197 I1.227 J-1.441 E.01162
G1 X119.39 Y218.126 E.25778
G1 X118.856 Y218.126 E.01641
G1 X125.085 Y211.897 E.27085
G3 X124.882 Y211.566 I1.55 J-1.181 E.01195
G1 X118.323 Y218.126 E.28522
G1 X117.789 Y218.126 E.01641
G1 X124.711 Y211.204 E.30097
G3 X124.575 Y210.806 I1.922 J-.878 E.01295
G1 X117.256 Y218.126 E.31828
G1 X116.722 Y218.126 E.01641
G1 X124.484 Y210.364 E.33752
G3 X124.453 Y209.861 I2.496 J-.407 E.0155
G1 X116.188 Y218.126 E.35937
G1 X115.655 Y218.126 E.01641
G1 X124.502 Y209.279 E.3847
G3 X124.718 Y208.528 I3.627 J.64 E.02405
G1 X115.121 Y218.126 E.41731
G1 X114.587 Y218.126 E.01641
G1 X131.088 Y201.624 E.71753
G1 X131.622 Y201.624 E.01641
G1 X126.654 Y206.593 E.21603
G3 X127.402 Y206.379 I1.354 J3.317 E.02396
G1 X132.156 Y201.624 E.20673
G1 X132.689 Y201.624 E.01641
G1 X127.981 Y206.333 E.20475
G3 X128.486 Y206.361 I.142 J2.016 E.01561
G1 X133.223 Y201.624 E.20596
G1 X133.757 Y201.624 E.01641
G1 X128.932 Y206.449 E.2098
G3 X129.331 Y206.584 I-1.914 J6.331 E.01295
G1 X134.29 Y201.624 E.21565
G1 X134.824 Y201.624 E.01641
G1 X129.692 Y206.756 E.22314
G3 X130.022 Y206.96 I-.855 J1.751 E.01194
G1 X135.357 Y201.624 E.23201
G1 X135.891 Y201.624 E.01641
G1 X130.322 Y207.193 E.24216
G3 X130.594 Y207.455 I-1.169 J1.484 E.01162
G1 X136.425 Y201.624 E.25355
G1 X136.958 Y201.624 E.01641
G1 X130.837 Y207.746 E.26618
G3 X131.051 Y208.065 I-1.49 J1.23 E.01185
G1 X137.492 Y201.624 E.28007
G1 X138.026 Y201.624 E.01641
G1 X131.234 Y208.416 E.29531
G3 X131.384 Y208.8 I-1.843 J.937 E.0127
G1 X138.559 Y201.624 E.31202
G1 X139.093 Y201.624 E.01641
G1 X131.49 Y209.228 E.33061
G3 X131.543 Y209.708 I-2.377 J.508 E.01488
G1 X139.626 Y201.624 E.35149
G1 X140.16 Y201.624 E.01641
G1 X131.53 Y210.255 E.37527
G3 X131.392 Y210.926 I-5.043 J-.684 E.02109
G1 X140.694 Y201.624 E.40446
G1 X141.227 Y201.624 E.01641
G1 X124.726 Y218.126 E.71753
G1 X125.26 Y218.126 E.01641
G1 X141.761 Y201.624 E.71753
G1 X142.295 Y201.624 E.01641
G1 X125.794 Y218.126 E.71753
G1 X126.327 Y218.126 E.01641
G1 X142.828 Y201.624 E.71753
G1 X143.362 Y201.624 E.01641
G1 X126.861 Y218.126 E.71753
G1 X127.394 Y218.126 E.01641
G1 X143.895 Y201.624 E.71753
G1 X144.429 Y201.624 E.01641
G1 X127.928 Y218.126 E.71753
G1 X128.462 Y218.126 E.01641
G1 X144.963 Y201.624 E.71753
G1 X145.496 Y201.624 E.01641
G1 X128.995 Y218.126 E.71753
G1 X129.529 Y218.126 E.01641
G1 X146.03 Y201.624 E.71753
G1 X146.564 Y201.624 E.01641
G1 X130.063 Y218.126 E.71753
G1 X130.596 Y218.126 E.01641
G1 X147.097 Y201.624 E.71753
G1 X147.631 Y201.624 E.01641
G1 X131.13 Y218.126 E.71753
G1 X131.663 Y218.126 E.01641
G1 X148.165 Y201.624 E.71753
G1 X148.698 Y201.624 E.01641
G1 X132.197 Y218.126 E.71753
G1 X132.731 Y218.126 E.01641
G1 X149.232 Y201.624 E.71753
G1 X149.765 Y201.624 E.01641
G1 X133.264 Y218.126 E.71753
G1 X133.798 Y218.126 E.01641
G1 X150.299 Y201.624 E.71753
G1 X150.833 Y201.624 E.01641
G1 X134.332 Y218.126 E.71753
G1 X134.865 Y218.126 E.01641
G1 X151.366 Y201.624 E.71753
G1 X151.9 Y201.624 E.01641
G1 X135.399 Y218.126 E.71753
G1 X135.932 Y218.126 E.01641
G1 X152.434 Y201.624 E.71753
G1 X152.967 Y201.624 E.01641
G1 X136.466 Y218.126 E.71753
G1 X137 Y218.126 E.01641
G1 X153.501 Y201.624 E.71753
G1 X154.034 Y201.624 E.01641
G1 X137.533 Y218.126 E.71753
G1 X138.067 Y218.126 E.01641
G1 X154.568 Y201.624 E.71753
G1 X155.102 Y201.624 E.01641
G1 X138.601 Y218.126 E.71753
G1 X139.134 Y218.126 E.01641
G1 X155.635 Y201.624 E.71753
G1 X156.169 Y201.624 E.01641
G1 X139.668 Y218.126 E.71753
G1 X140.201 Y218.126 E.01641
G1 X156.703 Y201.624 E.71753
G1 X157.236 Y201.624 E.01641
G1 X140.735 Y218.126 E.71753
G1 X141.269 Y218.126 E.01641
G1 X157.77 Y201.624 E.71753
G1 X158.303 Y201.624 E.01641
G1 X141.802 Y218.126 E.71753
G1 X142.336 Y218.126 E.01641
G1 X158.837 Y201.624 E.71753
G1 X159.371 Y201.624 E.01641
G1 X142.87 Y218.126 E.71753
G1 X143.403 Y218.126 E.01641
G1 X159.904 Y201.624 E.71753
G1 X160.438 Y201.624 E.01641
G1 X143.937 Y218.126 E.71753
G1 X144.47 Y218.126 E.01641
G1 X160.972 Y201.624 E.71753
G1 X161.505 Y201.624 E.01641
G1 X145.004 Y218.126 E.71753
G1 X145.538 Y218.126 E.01641
G1 X162.039 Y201.624 E.71753
G1 X162.572 Y201.624 E.01641
G1 X146.071 Y218.126 E.71753
G1 X146.605 Y218.126 E.01641
G1 X163.106 Y201.624 E.71753
G1 X163.64 Y201.624 E.01641
G1 X147.139 Y218.126 E.71753
G1 X147.672 Y218.126 E.01641
G1 X164.173 Y201.624 E.71753
G1 X164.707 Y201.624 E.01641
G1 X148.206 Y218.126 E.71753
G1 X148.739 Y218.126 E.01641
G1 X165.241 Y201.624 E.71753
G1 X165.774 Y201.624 E.01641
G1 X149.273 Y218.126 E.71753
G1 X149.807 Y218.126 E.01641
G1 X166.308 Y201.624 E.71753
G1 X166.841 Y201.624 E.01641
G1 X150.34 Y218.126 E.71753
G1 X150.874 Y218.126 E.01641
G1 X167.375 Y201.624 E.71753
G1 X167.909 Y201.624 E.01641
G1 X151.408 Y218.126 E.71753
G1 X151.941 Y218.126 E.01641
G1 X168.442 Y201.624 E.71753
G1 X168.976 Y201.624 E.01641
G1 X152.475 Y218.126 E.71753
G1 X153.008 Y218.126 E.01641
G1 X169.51 Y201.624 E.71753
G1 X170.043 Y201.624 E.01641
G1 X153.542 Y218.126 E.71753
G1 X154.076 Y218.126 E.01641
G1 X170.577 Y201.624 E.71753
G1 X171.11 Y201.624 E.01641
G1 X154.609 Y218.126 E.71753
G1 X155.143 Y218.126 E.01641
G1 X171.644 Y201.624 E.71753
G1 X172.178 Y201.624 E.01641
G1 X155.677 Y218.126 E.71753
G1 X156.21 Y218.126 E.01641
G1 X172.711 Y201.624 E.71753
G1 X173.245 Y201.624 E.01641
G1 X156.744 Y218.126 E.71753
G1 X157.277 Y218.126 E.01641
G1 X173.779 Y201.624 E.71753
G1 X174.312 Y201.624 E.01641
G1 X157.811 Y218.126 E.71753
G1 X158.345 Y218.126 E.01641
G1 X174.846 Y201.624 E.71753
G1 X175.379 Y201.624 E.01641
G1 X158.878 Y218.126 E.71753
G1 X159.412 Y218.126 E.01641
G1 X175.913 Y201.624 E.71753
G1 X176.447 Y201.624 E.01641
G1 X159.946 Y218.126 E.71753
G1 X160.479 Y218.126 E.01641
G1 X176.98 Y201.624 E.71753
G1 X177.514 Y201.624 E.01641
G1 X161.013 Y218.126 E.71753
G1 X161.546 Y218.126 E.01641
G1 X178.048 Y201.624 E.71753
G1 X178.581 Y201.624 E.01641
G1 X162.08 Y218.126 E.71753
G1 X162.614 Y218.126 E.01641
G1 X179.115 Y201.624 E.71753
G1 X179.648 Y201.624 E.01641
G1 X163.147 Y218.126 E.71753
G1 X163.681 Y218.126 E.01641
G1 X180.182 Y201.624 E.71753
G1 X180.716 Y201.624 E.01641
G1 X164.215 Y218.126 E.71753
G1 X164.748 Y218.126 E.01641
G1 X181.249 Y201.624 E.71753
G1 X181.783 Y201.624 E.01641
G1 X165.282 Y218.126 E.71753
G1 X165.815 Y218.126 E.01641
G1 X182.317 Y201.624 E.71753
G1 X182.85 Y201.624 E.01641
G1 X166.349 Y218.126 E.71753
G1 X166.883 Y218.126 E.01641
G1 X183.384 Y201.624 E.71753
G1 X183.917 Y201.624 E.01641
G1 X167.416 Y218.126 E.71753
G1 X167.95 Y218.126 E.01641
G1 X184.451 Y201.624 E.71753
G1 X184.985 Y201.624 E.01641
G1 X168.484 Y218.126 E.71753
G1 X169.017 Y218.126 E.01641
G1 X185.518 Y201.624 E.71753
G1 X186.052 Y201.624 E.01641
G1 X169.551 Y218.126 E.71753
G1 X170.084 Y218.126 E.01641
G1 X186.586 Y201.624 E.71753
G1 X187.119 Y201.624 E.01641
G1 X170.618 Y218.126 E.71753
G1 X171.152 Y218.126 E.01641
G1 X187.653 Y201.624 E.71753
G1 X188.186 Y201.624 E.01641
G1 X171.685 Y218.126 E.71753
G1 X172.219 Y218.126 E.01641
G1 X188.72 Y201.624 E.71753
G1 X189.254 Y201.624 E.01641
G1 X172.753 Y218.126 E.71753
G1 X173.286 Y218.126 E.01641
G1 X189.787 Y201.624 E.71753
G1 X190.321 Y201.624 E.01641
G1 X173.82 Y218.126 E.71753
G1 X174.353 Y218.126 E.01641
G1 X190.855 Y201.624 E.71753
G1 X191.388 Y201.624 E.01641
G1 X174.887 Y218.126 E.71753
G1 X175.421 Y218.126 E.01641
G1 X191.922 Y201.624 E.71753
G1 X192.455 Y201.624 E.01641
G1 X175.954 Y218.126 E.71753
G1 X176.488 Y218.126 E.01641
G1 X192.989 Y201.624 E.71753
G1 X193.523 Y201.624 E.01641
G1 X177.022 Y218.126 E.71753
G1 X177.555 Y218.126 E.01641
G1 X194.056 Y201.624 E.71753
G1 X194.59 Y201.624 E.01641
G1 X178.089 Y218.126 E.71753
G1 X178.622 Y218.126 E.01641
G1 X195.124 Y201.624 E.71753
G1 X195.657 Y201.624 E.01641
G1 X179.156 Y218.126 E.71753
G1 X179.69 Y218.126 E.01641
G1 X196.191 Y201.624 E.71753
G1 X196.724 Y201.624 E.01641
G1 X180.223 Y218.126 E.71753
G1 X180.757 Y218.126 E.01641
G1 X197.258 Y201.624 E.71753
G1 X197.792 Y201.624 E.01641
G1 X181.291 Y218.126 E.71753
G1 X181.824 Y218.126 E.01641
G1 X198.325 Y201.624 E.71753
G1 X198.859 Y201.624 E.01641
G1 X182.358 Y218.126 E.71753
G1 X182.891 Y218.126 E.01641
G1 X199.393 Y201.624 E.71753
G1 X199.926 Y201.624 E.01641
G1 X183.425 Y218.126 E.71753
G1 X183.959 Y218.126 E.01641
G1 X200.46 Y201.624 E.71753
G1 X200.993 Y201.624 E.01641
G1 X184.323 Y218.295 E.72491
G1 X195.529 Y218.295 F30000
G1 F15000
G1 X218.001 Y195.823 E.97716
G1 X218.001 Y195.29 E.01641
G1 X195.165 Y218.126 E.99298
G1 X194.631 Y218.126 E.01641
G1 X218.001 Y194.756 E1.01618
G1 X218.001 Y194.223 E.01641
G1 X194.098 Y218.126 E1.03939
G1 X193.564 Y218.126 E.01641
G1 X218.001 Y193.689 E1.06259
G1 X218.001 Y193.155 E.01641
G1 X193.03 Y218.126 E1.0858
G1 X192.497 Y218.126 E.01641
G1 X218.001 Y192.622 E1.109
G1 X218.001 Y192.088 E.01641
G1 X191.963 Y218.126 E1.1322
G1 X191.429 Y218.126 E.01641
G1 X218.001 Y191.554 E1.15541
G1 X218.001 Y191.021 E.01641
G1 X190.896 Y218.126 E1.17861
G1 X190.362 Y218.126 E.01641
G1 X218.001 Y190.487 E1.20182
G1 X218.001 Y189.954 E.01641
G1 X189.829 Y218.126 E1.22502
G1 X189.295 Y218.126 E.01641
G1 X218.001 Y189.42 E1.24822
G1 X218.001 Y188.886 E.01641
G1 X188.761 Y218.126 E1.27143
G1 X188.228 Y218.126 E.01641
G1 X218.001 Y188.353 E1.29463
G1 X218.001 Y187.819 E.01641
G1 X187.694 Y218.126 E1.31784
G1 X187.16 Y218.126 E.01641
G1 X218.001 Y187.285 E1.34104
G1 X218.001 Y186.752 E.01641
G1 X186.627 Y218.126 E1.36424
G1 X186.093 Y218.126 E.01641
G1 X218.001 Y186.218 E1.38745
G1 X218.001 Y185.685 E.01641
G1 X185.56 Y218.126 E1.41065
G1 X185.026 Y218.126 E.01641
G1 X218.001 Y185.151 E1.43386
G1 X218.001 Y184.617 E.01641
G1 X201.499 Y201.118 E.71753
G1 X201.499 Y200.585 E.01641
G1 X218.001 Y184.084 E.71753
G1 X218.001 Y183.55 E.01641
G1 X201.499 Y200.051 E.71753
G1 X201.499 Y199.518 E.01641
G1 X218.001 Y183.016 E.71753
G1 X218.001 Y182.483 E.01641
G1 X201.499 Y198.984 E.71753
G1 X201.499 Y198.45 E.01641
G1 X218.001 Y181.949 E.71753
G1 X218.001 Y181.416 E.01641
G1 X201.499 Y197.917 E.71753
G1 X201.499 Y197.383 E.01641
G1 X218.001 Y180.882 E.71753
G1 X218.001 Y180.348 E.01641
G1 X201.499 Y196.849 E.71753
G1 X201.499 Y196.316 E.01641
G1 X218.001 Y179.815 E.71753
G1 X218.001 Y179.281 E.01641
G1 X201.499 Y195.782 E.71753
G1 X201.499 Y195.249 E.01641
G1 X218.001 Y178.747 E.71753
G1 X218.001 Y178.214 E.01641
G1 X201.499 Y194.715 E.71753
G1 X201.499 Y194.181 E.01641
G1 X218.001 Y177.68 E.71753
G1 X218.001 Y177.147 E.01641
G1 X201.499 Y193.648 E.71753
G1 X201.499 Y193.114 E.01641
G1 X218.001 Y176.613 E.71753
G1 X218.001 Y176.079 E.01641
G1 X201.499 Y192.58 E.71753
G1 X201.499 Y192.047 E.01641
G1 X218.001 Y175.546 E.71753
G1 X218.001 Y175.012 E.01641
G1 X201.499 Y191.513 E.71753
G1 X201.499 Y190.98 E.01641
G1 X218.001 Y174.478 E.71753
G1 X218.001 Y173.945 E.01641
G1 X201.499 Y190.446 E.71753
G1 X201.499 Y189.912 E.01641
G1 X218.001 Y173.411 E.71753
G1 X218.001 Y172.878 E.01641
G1 X201.499 Y189.379 E.71753
G1 X201.499 Y188.845 E.01641
G1 X218.001 Y172.344 E.71753
G1 X218.001 Y171.81 E.01641
G1 X201.499 Y188.311 E.71753
G1 X201.499 Y187.778 E.01641
G1 X218.001 Y171.277 E.71753
G1 X218.001 Y170.743 E.01641
G1 X201.499 Y187.244 E.71753
G1 X201.499 Y186.711 E.01641
G1 X218.001 Y170.209 E.71753
G1 X218.001 Y169.676 E.01641
G1 X201.499 Y186.177 E.71753
G1 X201.499 Y185.643 E.01641
G1 X218.001 Y169.142 E.71753
G1 X218.001 Y168.609 E.01641
G1 X201.499 Y185.11 E.71753
G1 X201.499 Y184.576 E.01641
G1 X218.001 Y168.075 E.71753
G1 X218.001 Y167.541 E.01641
G1 X201.499 Y184.042 E.71753
G1 X201.499 Y183.509 E.01641
G1 X218.001 Y167.008 E.71753
G1 X218.001 Y166.474 E.01641
G1 X201.499 Y182.975 E.71753
G1 X201.499 Y182.442 E.01641
G1 X218.001 Y165.94 E.71753
G1 X218.001 Y165.407 E.01641
G1 X201.499 Y181.908 E.71753
G1 X201.499 Y181.374 E.01641
G1 X218.001 Y164.873 E.71753
G1 X218.001 Y164.34 E.01641
G1 X201.499 Y180.841 E.71753
M73 P77 R13
G1 X201.499 Y180.307 E.01641
G1 X218.001 Y163.806 E.71753
G1 X218.001 Y163.272 E.01641
G1 X201.499 Y179.773 E.71753
G1 X201.499 Y179.24 E.01641
G1 X218.001 Y162.739 E.71753
G1 X218.001 Y162.205 E.01641
G1 X201.499 Y178.706 E.71753
G1 X201.499 Y178.173 E.01641
G1 X218.001 Y161.671 E.71753
G1 X218.001 Y161.138 E.01641
G1 X201.499 Y177.639 E.71753
G1 X201.499 Y177.105 E.01641
G1 X218.001 Y160.604 E.71753
G1 X218.001 Y160.071 E.01641
G1 X201.499 Y176.572 E.71753
G1 X201.499 Y176.038 E.01641
G1 X218.001 Y159.537 E.71753
G1 X218.001 Y159.003 E.01641
G1 X201.499 Y175.504 E.71753
G1 X201.499 Y174.971 E.01641
G1 X218.001 Y158.47 E.71753
G1 X218.001 Y157.936 E.01641
G1 X201.499 Y174.437 E.71753
G1 X201.499 Y173.904 E.01641
G1 X218.001 Y157.402 E.71753
G1 X218.001 Y156.869 E.01641
G1 X201.499 Y173.37 E.71753
G1 X201.499 Y172.836 E.01641
G1 X218.001 Y156.335 E.71753
G1 X218.001 Y155.802 E.01641
G1 X201.499 Y172.303 E.71753
G1 X201.499 Y171.769 E.01641
G1 X218.001 Y155.268 E.71753
G1 X218.001 Y154.734 E.01641
G1 X201.499 Y171.235 E.71753
G1 X201.499 Y170.702 E.01641
G1 X218.001 Y154.201 E.71753
G1 X218.001 Y153.667 E.01641
G1 X201.499 Y170.168 E.71753
G1 X201.499 Y169.635 E.01641
G1 X218.001 Y153.133 E.71753
G1 X218.001 Y152.6 E.01641
G1 X201.499 Y169.101 E.71753
G1 X201.499 Y168.567 E.01641
G1 X218.001 Y152.066 E.71753
G1 X218.001 Y151.533 E.01641
G1 X201.499 Y168.034 E.71753
G1 X201.499 Y167.5 E.01641
G1 X218.001 Y150.999 E.71753
G1 X218.001 Y150.465 E.01641
G1 X201.499 Y166.966 E.71753
G1 X201.499 Y166.433 E.01641
G1 X218.001 Y149.932 E.71753
G1 X218.001 Y149.398 E.01641
G1 X201.499 Y165.899 E.71753
G1 X201.499 Y165.366 E.01641
G1 X218.001 Y148.864 E.71753
G1 X218.001 Y148.331 E.01641
G1 X201.499 Y164.832 E.71753
G1 X201.499 Y164.298 E.01641
G1 X218.001 Y147.797 E.71753
G1 X218.001 Y147.264 E.01641
G1 X201.499 Y163.765 E.71753
G1 X201.499 Y163.231 E.01641
G1 X218.001 Y146.73 E.71753
G1 X218.001 Y146.196 E.01641
G1 X201.499 Y162.697 E.71753
G1 X201.499 Y162.164 E.01641
G1 X218.001 Y145.663 E.71753
G1 X218.001 Y145.129 E.01641
G1 X201.499 Y161.63 E.71753
G1 X201.499 Y161.097 E.01641
G1 X218.001 Y144.595 E.71753
G1 X218.001 Y144.062 E.01641
G1 X201.499 Y160.563 E.71753
G1 X201.499 Y160.029 E.01641
G1 X218.001 Y143.528 E.71753
G1 X218.001 Y142.995 E.01641
G1 X201.499 Y159.496 E.71753
G1 X201.499 Y158.962 E.01641
G1 X218.001 Y142.461 E.71753
G1 X218.001 Y141.927 E.01641
G1 X201.499 Y158.428 E.71753
G1 X201.499 Y157.895 E.01641
G1 X218.001 Y141.394 E.71753
G1 X218.001 Y140.86 E.01641
G1 X201.499 Y157.361 E.71753
G1 X201.499 Y156.828 E.01641
G1 X218.001 Y140.326 E.71753
G1 X218.001 Y139.793 E.01641
G1 X201.499 Y156.294 E.71753
G1 X201.499 Y155.76 E.01641
G1 X218.001 Y139.259 E.71753
G1 X218.001 Y138.726 E.01641
G1 X201.499 Y155.227 E.71753
G1 X201.499 Y154.693 E.01641
G1 X218.001 Y138.192 E.71753
G1 X218.001 Y137.658 E.01641
G1 X201.499 Y154.159 E.71753
G1 X201.499 Y153.626 E.01641
G1 X218.001 Y137.125 E.71753
G1 X218.001 Y136.591 E.01641
G1 X201.499 Y153.092 E.71753
G1 X201.499 Y152.559 E.01641
G1 X218.001 Y136.057 E.71753
G1 X218.001 Y135.524 E.01641
G1 X201.499 Y152.025 E.71753
G1 X201.499 Y151.491 E.01641
G1 X218.001 Y134.99 E.71753
G1 X218.001 Y134.457 E.01641
G1 X201.499 Y150.958 E.71753
G1 X201.499 Y150.424 E.01641
G1 X218.001 Y133.923 E.71753
G1 X218.001 Y133.389 E.01641
G1 X201.499 Y149.89 E.71753
G1 X201.499 Y149.357 E.01641
G1 X218.001 Y132.856 E.71753
G1 X218.001 Y132.322 E.01641
G1 X201.499 Y148.823 E.71753
G1 X201.499 Y148.29 E.01641
G1 X218.001 Y131.788 E.71753
G1 X218.001 Y131.255 E.01641
G1 X201.499 Y147.756 E.71753
G1 X201.499 Y147.222 E.01641
G1 X218.001 Y130.721 E.71753
G1 X218.001 Y130.188 E.01641
G1 X201.499 Y146.689 E.71753
G1 X201.499 Y146.155 E.01641
G1 X218.001 Y129.654 E.71753
G1 X218.001 Y129.12 E.01641
G1 X201.499 Y145.621 E.71753
G1 X201.499 Y145.088 E.01641
G1 X218.001 Y128.587 E.71753
G1 X218.001 Y128.053 E.01641
G1 X201.499 Y144.554 E.71753
G1 X201.499 Y144.021 E.01641
G1 X218.001 Y127.519 E.71753
G1 X218.001 Y126.986 E.01641
G1 X201.499 Y143.487 E.71753
G1 X201.499 Y142.953 E.01641
G1 X218.001 Y126.452 E.71753
G1 X218.001 Y125.919 E.01641
G1 X201.499 Y142.42 E.71753
G1 X201.499 Y141.886 E.01641
G1 X218.001 Y125.385 E.71753
G1 X218.001 Y124.851 E.01641
G1 X201.499 Y141.352 E.71753
G1 X201.499 Y140.819 E.01641
G1 X218.001 Y124.318 E.71753
G1 X218.001 Y123.784 E.01641
G1 X201.499 Y140.285 E.71753
G1 X201.499 Y139.752 E.01641
G1 X218.001 Y123.25 E.71753
G1 X218.001 Y122.717 E.01641
G1 X201.499 Y139.218 E.71753
G1 X201.499 Y138.684 E.01641
G1 X210.792 Y129.392 E.40406
G3 X210.122 Y129.528 I-1.089 J-3.637 E.02105
G1 X201.499 Y138.151 E.37493
G1 X201.499 Y137.617 E.01641
G1 X209.573 Y129.544 E.35105
G3 X209.096 Y129.487 I.048 J-2.412 E.01478
G1 X201.499 Y137.083 E.33033
G1 X201.499 Y136.55 E.01641
G1 X208.669 Y129.381 E.31174
G3 X208.282 Y129.234 I2.543 J-7.268 E.01272
G1 X201.499 Y136.016 E.29493
G1 X201.499 Y135.483 E.01641
G1 X207.933 Y129.049 E.27975
G3 X207.614 Y128.834 I.918 J-1.702 E.01184
G1 X201.499 Y134.949 E.2659
G1 X201.499 Y134.415 E.01641
G1 X207.325 Y128.59 E.25331
G3 X207.064 Y128.317 I1.234 J-1.443 E.01162
G1 X201.499 Y133.882 E.24196
G1 X201.499 Y133.348 E.01641
G1 X206.831 Y128.016 E.23185
G3 X206.629 Y127.685 I1.552 J-1.179 E.01195
G1 X201.499 Y132.814 E.22303
G1 X201.499 Y132.281 E.01641
G1 X206.458 Y127.322 E.21561
G3 X206.323 Y126.924 I1.926 J-.875 E.01296
G1 X201.499 Y131.747 E.20974
G1 X201.499 Y131.214 E.01641
G1 X206.233 Y126.48 E.20584
G3 X206.203 Y125.977 I2.5 J-.403 E.01553
G1 X201.499 Y130.68 E.20452
G1 X201.499 Y130.146 E.01641
G1 X206.254 Y125.392 E.20674
G3 X206.475 Y124.637 I3.585 J.64 E.02422
G1 X201.499 Y129.613 E.21635
G1 X201.499 Y129.079 E.01641
G1 X218.001 Y112.578 E.71753
G1 X218.001 Y113.112 E.01641
G1 X208.388 Y122.724 E.41797
G3 X209.14 Y122.506 I1.373 J3.328 E.02412
G1 X218.001 Y113.645 E.38528
G1 X218.001 Y114.179 E.01641
G1 X209.721 Y122.458 E.36001
G3 X210.228 Y122.485 I.147 J2.019 E.01564
G1 X218.001 Y114.712 E.33798
G1 X218.001 Y115.246 E.01641
G1 X210.674 Y122.572 E.31858
G3 X211.074 Y122.706 I-1.885 J6.317 E.01297
G1 X218.001 Y115.78 E.30118
G1 X218.001 Y116.313 E.01641
G1 X211.436 Y122.878 E.28544
G3 X211.767 Y123.081 I-.852 J1.753 E.01195
G1 X218.001 Y116.847 E.27108
G1 X218.001 Y117.381 E.01641
G1 X212.067 Y123.314 E.258
G3 X212.339 Y123.575 I-1.171 J1.491 E.01162
G1 X218.001 Y117.914 E.24617
G1 X218.001 Y118.448 E.01641
G1 X212.583 Y123.865 E.23557
G3 X212.798 Y124.184 I-1.486 J1.231 E.01184
G1 X218.001 Y118.981 E.22624
G1 X218.001 Y119.515 E.01641
G1 X212.981 Y124.534 E.21826
G3 X213.131 Y124.918 I-1.844 J.941 E.01269
G1 X218.001 Y120.049 E.21174
G1 X218.001 Y120.582 E.01641
G1 X213.239 Y125.344 E.20707
G3 X213.293 Y125.824 I-2.375 J.512 E.01486
G1 X218.001 Y121.116 E.20471
G1 X218.001 Y121.65 E.01641
G1 X213.282 Y126.368 E.20519
G3 X213.146 Y127.038 I-3.405 J-.341 E.02103
G1 X218.17 Y122.014 E.21846
; WIPE_START
G1 X216.756 Y123.428 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X209.536 Y125.902 Z2.8 F30000
G1 X201.33 Y128.715 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F15000
G1 X218.001 Y112.044 E.72491
G1 X218.001 Y111.511 E.01641
G1 X201.499 Y128.012 E.71753
G1 X201.499 Y127.478 E.01641
G1 X218.001 Y110.977 E.71753
G1 X218.001 Y110.443 E.01641
G1 X201.499 Y126.945 E.71753
G1 X201.499 Y126.411 E.01641
G1 X218.001 Y109.91 E.71753
G1 X218.001 Y109.376 E.01641
G1 X201.499 Y125.877 E.71753
G1 X201.499 Y125.344 E.01641
G1 X218.001 Y108.843 E.71753
G1 X218.001 Y108.309 E.01641
G1 X201.499 Y124.81 E.71753
G1 X201.499 Y124.276 E.01641
G1 X218.001 Y107.775 E.71753
G1 X218.001 Y107.242 E.01641
G1 X201.499 Y123.743 E.71753
G1 X201.499 Y123.209 E.01641
G1 X218.001 Y106.708 E.71753
G1 X218.001 Y106.174 E.01641
G1 X201.499 Y122.676 E.71753
G1 X201.499 Y122.142 E.01641
G1 X218.001 Y105.641 E.71753
G1 X218.001 Y105.107 E.01641
G1 X201.499 Y121.608 E.71753
G1 X201.499 Y121.075 E.01641
G1 X218.001 Y104.574 E.71753
G1 X218.001 Y104.04 E.01641
G1 X201.499 Y120.541 E.71753
G1 X201.499 Y120.007 E.01641
G1 X218.001 Y103.506 E.71753
G1 X218.001 Y102.973 E.01641
G1 X201.499 Y119.474 E.71753
G1 X201.499 Y118.94 E.01641
G1 X218.001 Y102.439 E.71753
G1 X218.001 Y101.905 E.01641
G1 X201.499 Y118.407 E.71753
G1 X201.499 Y117.873 E.01641
G1 X218.001 Y101.372 E.71753
G1 X218.001 Y100.838 E.01641
G1 X201.499 Y117.339 E.71753
G1 X201.499 Y116.806 E.01641
G1 X218.001 Y100.305 E.71753
G1 X218.001 Y99.771 E.01641
G1 X201.499 Y116.272 E.71753
G1 X201.499 Y115.738 E.01641
G1 X218.001 Y99.237 E.71753
G1 X218.001 Y98.704 E.01641
G1 X201.499 Y115.205 E.71753
G1 X201.499 Y114.671 E.01641
G1 X218.001 Y98.17 E.71753
G1 X218.001 Y97.636 E.01641
G1 X201.499 Y114.138 E.71753
G1 X201.499 Y113.604 E.01641
G1 X218.001 Y97.103 E.71753
G1 X218.001 Y96.569 E.01641
G1 X201.499 Y113.07 E.71753
G1 X201.499 Y112.537 E.01641
G1 X218.001 Y96.036 E.71753
G1 X218.001 Y95.502 E.01641
G1 X201.499 Y112.003 E.71753
G1 X201.499 Y111.469 E.01641
G1 X218.001 Y94.968 E.71753
G1 X218.001 Y94.435 E.01641
G1 X201.499 Y110.936 E.71753
G1 X201.499 Y110.402 E.01641
G1 X218.001 Y93.901 E.71753
G1 X218.001 Y93.367 E.01641
G1 X201.499 Y109.869 E.71753
G1 X201.499 Y109.335 E.01641
G1 X218.001 Y92.834 E.71753
G1 X218.001 Y92.3 E.01641
G1 X201.499 Y108.801 E.71753
G1 X201.499 Y108.268 E.01641
G1 X218.001 Y91.767 E.71753
G1 X218.001 Y91.233 E.01641
G1 X201.499 Y107.734 E.71753
G1 X201.499 Y107.2 E.01641
G1 X218.001 Y90.699 E.71753
G1 X218.001 Y90.166 E.01641
G1 X201.499 Y106.667 E.71753
G1 X201.499 Y106.133 E.01641
G1 X218.001 Y89.632 E.71753
G1 X218.001 Y89.098 E.01641
G1 X201.499 Y105.6 E.71753
G1 X201.499 Y105.066 E.01641
G1 X218.001 Y88.565 E.71753
G1 X218.001 Y88.031 E.01641
G1 X201.499 Y104.532 E.71753
G1 X201.499 Y103.999 E.01641
G1 X218.001 Y87.498 E.71753
G1 X218.001 Y86.964 E.01641
G1 X201.499 Y103.465 E.71753
G1 X201.499 Y102.931 E.01641
G1 X218.001 Y86.43 E.71753
G1 X218.001 Y85.897 E.01641
G1 X201.499 Y102.398 E.71753
G1 X201.499 Y101.864 E.01641
G1 X218.001 Y85.363 E.71753
G1 X218.001 Y84.829 E.01641
G1 X201.499 Y101.331 E.71753
G1 X201.499 Y100.797 E.01641
G1 X218.001 Y84.296 E.71753
G1 X218.001 Y83.762 E.01641
G1 X201.499 Y100.263 E.71753
G1 X201.499 Y99.73 E.01641
G1 X218.001 Y83.229 E.71753
G1 X218.001 Y82.695 E.01641
G1 X201.499 Y99.196 E.71753
G1 X201.499 Y98.662 E.01641
G1 X218.001 Y82.161 E.71753
G1 X218.001 Y81.628 E.01641
G1 X201.499 Y98.129 E.71753
G1 X201.499 Y97.595 E.01641
G1 X218.001 Y81.094 E.71753
G1 X218.001 Y80.56 E.01641
G1 X201.499 Y97.062 E.71753
G1 X201.499 Y96.528 E.01641
G1 X218.001 Y80.027 E.71753
G1 X218.001 Y79.493 E.01641
G1 X201.499 Y95.994 E.71753
G1 X201.499 Y95.461 E.01641
G1 X218.001 Y78.96 E.71753
G1 X218.001 Y78.426 E.01641
G1 X201.499 Y94.927 E.71753
G1 X201.499 Y94.393 E.01641
G1 X218.001 Y77.892 E.71753
G1 X218.001 Y77.359 E.01641
G1 X201.499 Y93.86 E.71753
G1 X201.499 Y93.326 E.01641
G1 X218.001 Y76.825 E.71753
G1 X218.001 Y76.291 E.01641
G1 X201.499 Y92.793 E.71753
G1 X201.499 Y92.259 E.01641
G1 X218.001 Y75.758 E.71753
G1 X218.001 Y75.224 E.01641
G1 X201.499 Y91.725 E.71753
G1 X201.499 Y91.192 E.01641
G1 X218.001 Y74.691 E.71753
G1 X218.001 Y74.157 E.01641
G1 X201.499 Y90.658 E.71753
G1 X201.499 Y90.124 E.01641
G1 X218.001 Y73.623 E.71753
G1 X218.001 Y73.09 E.01641
G1 X201.499 Y89.591 E.71753
G1 X201.499 Y89.057 E.01641
G1 X218.001 Y72.556 E.71753
G1 X218.001 Y72.022 E.01641
G1 X201.499 Y88.524 E.71753
G1 X201.499 Y87.99 E.01641
G1 X218.001 Y71.489 E.71753
G1 X218.001 Y70.955 E.01641
G1 X201.499 Y87.456 E.71753
G1 X201.499 Y86.923 E.01641
G1 X218.001 Y70.422 E.71753
M73 P77 R12
G1 X218.001 Y69.888 E.01641
G1 X201.499 Y86.389 E.71753
G1 X201.499 Y85.855 E.01641
G1 X218.001 Y69.354 E.71753
G1 X218.001 Y68.821 E.01641
G1 X201.499 Y85.322 E.71753
G1 X201.499 Y84.788 E.01641
G1 X218.001 Y68.287 E.71753
G1 X218.001 Y67.753 E.01641
G1 X201.499 Y84.255 E.71753
G1 X201.499 Y83.721 E.01641
G1 X218.001 Y67.22 E.71753
G1 X218.001 Y66.686 E.01641
G1 X201.499 Y83.187 E.71753
G1 X201.499 Y82.654 E.01641
G1 X218.001 Y66.153 E.71753
G1 X218.001 Y65.619 E.01641
G1 X201.499 Y82.12 E.71753
G1 X201.499 Y81.586 E.01641
G1 X218.001 Y65.085 E.71753
G1 X218.001 Y64.552 E.01641
G1 X201.499 Y81.053 E.71753
G1 X201.499 Y80.519 E.01641
G1 X218.001 Y64.018 E.71753
G1 X218.001 Y63.484 E.01641
G1 X201.499 Y79.986 E.71753
G1 X201.499 Y79.452 E.01641
G1 X218.001 Y62.951 E.71753
G1 X218.001 Y62.417 E.01641
G1 X201.499 Y78.918 E.71753
G1 X201.499 Y78.385 E.01641
G1 X218.001 Y61.884 E.71753
G1 X218.001 Y61.35 E.01641
G1 X201.499 Y77.851 E.71753
G1 X201.499 Y77.317 E.01641
G1 X218.001 Y60.816 E.71753
G1 X218.001 Y60.283 E.01641
G1 X201.499 Y76.784 E.71753
G1 X201.499 Y76.25 E.01641
G1 X218.001 Y59.749 E.71753
G1 X218.001 Y59.215 E.01641
G1 X201.499 Y75.716 E.71753
G1 X201.499 Y75.183 E.01641
G1 X218.001 Y58.682 E.71753
G1 X218.001 Y58.148 E.01641
G1 X201.499 Y74.649 E.71753
G1 X201.499 Y74.116 E.01641
G1 X218.001 Y57.615 E.71753
G1 X218.001 Y57.081 E.01641
G1 X201.499 Y73.582 E.71753
G1 X201.499 Y73.048 E.01641
G1 X218.001 Y56.547 E.71753
G1 X218.001 Y56.014 E.01641
G1 X201.499 Y72.515 E.71753
G1 X201.499 Y71.981 E.01641
G1 X218.001 Y55.48 E.71753
G1 X218.001 Y54.946 E.01641
G1 X201.499 Y71.447 E.71753
G1 X201.499 Y70.914 E.01641
G1 X218.001 Y54.413 E.71753
G1 X218.001 Y53.879 E.01641
G1 X201.499 Y70.38 E.71753
G1 X201.499 Y69.847 E.01641
G1 X218.001 Y53.346 E.71753
G1 X218.001 Y52.812 E.01641
G1 X201.499 Y69.313 E.71753
G1 X201.499 Y68.779 E.01641
G1 X218.001 Y52.278 E.71753
G1 X218.001 Y51.745 E.01641
G1 X201.499 Y68.246 E.71753
G1 X201.499 Y67.712 E.01641
G1 X218.001 Y51.211 E.71753
G1 X218.001 Y50.677 E.01641
G1 X201.499 Y67.179 E.71753
G1 X201.499 Y66.645 E.01641
G1 X218.001 Y50.144 E.71753
G1 X218.001 Y49.61 E.01641
G1 X201.499 Y66.111 E.71753
G1 X201.499 Y65.578 E.01641
G1 X218.001 Y49.077 E.71753
G1 X218.001 Y48.543 E.01641
G1 X201.499 Y65.044 E.71753
G1 X201.499 Y64.51 E.01641
G1 X218.001 Y48.009 E.71753
G1 X218.001 Y47.476 E.01641
G1 X201.499 Y63.977 E.71753
G1 X201.499 Y63.443 E.01641
G1 X218.001 Y46.942 E.71753
G1 X218.001 Y46.408 E.01641
G1 X201.499 Y62.91 E.71753
G1 X201.499 Y62.376 E.01641
G1 X218.001 Y45.875 E.71753
G1 X218.001 Y45.341 E.01641
G1 X201.499 Y61.842 E.71753
G1 X201.499 Y61.309 E.01641
G1 X218.001 Y44.808 E.71753
G1 X218.001 Y44.274 E.01641
G1 X201.499 Y60.775 E.71753
G1 X201.499 Y60.241 E.01641
G1 X218.001 Y43.74 E.71753
G1 X218.001 Y43.207 E.01641
G1 X201.499 Y59.708 E.71753
G1 X201.499 Y59.174 E.01641
G1 X218.001 Y42.673 E.71753
G1 X218.001 Y42.139 E.01641
G1 X201.499 Y58.64 E.71753
G1 X201.499 Y58.107 E.01641
G1 X218.001 Y41.606 E.71753
G1 X218.001 Y41.072 E.01641
G1 X201.499 Y57.573 E.71753
G1 X201.499 Y57.04 E.01641
G1 X218.001 Y40.539 E.71753
G1 X218.001 Y40.005 E.01641
G1 X201.499 Y56.506 E.71753
G1 X201.499 Y55.972 E.01641
G1 X218.001 Y39.471 E.71753
G1 X218.001 Y38.938 E.01641
G1 X201.499 Y55.439 E.71753
G1 X201.499 Y54.905 E.01641
G1 X210.936 Y45.469 E.41034
G3 X210.231 Y45.64 I-1.201 J-3.409 E.02233
G1 X201.499 Y54.371 E.37969
G1 X201.499 Y53.838 E.01641
G1 X209.662 Y45.676 E.35492
G3 X209.178 Y45.626 I.006 J-2.447 E.01498
G1 X201.499 Y53.304 E.33388
G1 X201.499 Y52.771 E.01641
G1 X208.743 Y45.527 E.31499
G3 X208.35 Y45.386 I.506 J-2.037 E.01286
G1 X201.499 Y52.237 E.29789
G1 X201.499 Y51.703 E.01641
G1 X207.993 Y45.21 E.28234
G3 X207.668 Y45.001 I6.093 J-9.838 E.01187
G1 X201.499 Y51.17 E.26822
G1 X201.499 Y50.636 E.01641
G1 X207.373 Y44.762 E.25542
G3 X207.108 Y44.494 I1.207 J-1.464 E.01162
G1 X201.226 Y50.376 E.25573
G1 X200.693 Y50.376 E.01641
G1 X206.87 Y44.198 E.26862
G3 X206.662 Y43.872 I1.523 J-1.2 E.0119
G1 X200.159 Y50.376 E.28278
G1 X199.626 Y50.376 E.01641
G1 X206.486 Y43.515 E.29833
G3 X206.345 Y43.122 I1.89 J-.9 E.01285
G1 X199.092 Y50.376 E.31541
G1 X198.558 Y50.376 E.01641
G1 X206.245 Y42.689 E.33425
G3 X206.203 Y42.197 I4.554 J-.639 E.01517
G1 X198.025 Y50.376 E.35561
G1 X197.491 Y50.376 E.01641
G1 X206.234 Y41.632 E.38019
G3 X206.408 Y40.925 I4.356 J.695 E.02242
G1 X196.957 Y50.376 E.41095
G1 X196.424 Y50.376 E.01641
G1 X212.925 Y33.874 E.71753
G1 X213.459 Y33.874 E.01641
G1 X208.546 Y38.787 E.21361
G3 X209.257 Y38.61 I1.298 J3.702 E.02254
G1 X213.992 Y33.874 E.20592
G1 X214.526 Y33.874 E.01641
G1 X209.817 Y38.583 E.20474
G3 X210.313 Y38.621 I.099 J1.981 E.01533
G1 X215.059 Y33.874 E.20638
G1 X215.593 Y33.874 E.01641
G1 X210.749 Y38.719 E.21064
G3 X211.14 Y38.861 I-.515 J2.028 E.01283
G1 X216.127 Y33.874 E.21682
G1 X216.66 Y33.874 E.01641
G1 X211.497 Y39.038 E.22452
G3 X211.822 Y39.246 I-.88 J1.732 E.0119
G1 X217.194 Y33.874 E.23358
G1 X217.728 Y33.874 E.01641
G1 X212.118 Y39.484 E.24392
G3 X212.385 Y39.75 I-1.197 J1.469 E.01162
G1 X218.001 Y34.135 E.24417
G1 X218.001 Y34.669 E.01641
G1 X212.624 Y40.045 E.23378
G3 X212.834 Y40.369 I-1.517 J1.211 E.01189
G1 X218.001 Y35.202 E.22466
G1 X218.001 Y35.736 E.01641
G1 X213.012 Y40.724 E.2169
G3 X213.154 Y41.116 I-6.524 J2.568 E.01283
G1 X218.001 Y36.27 E.21076
G1 X218.001 Y36.803 E.01641
G1 X213.251 Y41.553 E.20653
G3 X213.297 Y42.04 I-2.415 J.476 E.01507
G1 X218.001 Y37.337 E.20451
G1 X218.001 Y37.87 E.01641
G1 X213.265 Y42.606 E.20593
G3 X213.093 Y43.312 I-3.554 J-.492 E.02236
G1 X218.17 Y38.234 E.22078
M73 P78 R12
G1 X38.599 Y33.705 F30000
G1 F15000
G1 X37.999 Y34.304 E.02607
G1 X37.999 Y34.838 E.01641
G1 X38.963 Y33.874 E.0419
G1 X39.497 Y33.874 E.01641
G1 X37.999 Y35.372 E.0651
G1 X37.999 Y35.905 E.01641
G1 X40.03 Y33.874 E.08831
G1 X40.564 Y33.874 E.01641
G1 X37.999 Y36.439 E.11151
G1 X37.999 Y36.973 E.01641
G1 X41.098 Y33.874 E.13472
G1 X41.631 Y33.874 E.01641
G1 X37.999 Y37.506 E.15792
G1 X37.999 Y38.04 E.01641
G1 X42.165 Y33.874 E.18112
G1 X42.698 Y33.874 E.01641
G1 X37.999 Y38.573 E.20433
G1 X37.999 Y39.107 E.01641
G1 X43.232 Y33.874 E.22753
G1 X43.766 Y33.874 E.01641
G1 X37.999 Y39.641 E.25074
G1 X37.999 Y40.174 E.01641
G1 X44.299 Y33.874 E.27394
G1 X44.833 Y33.874 E.01641
G1 X37.999 Y40.708 E.29714
G1 X37.999 Y41.242 E.01641
G1 X45.367 Y33.874 E.32035
G1 X45.9 Y33.874 E.01641
G1 X37.999 Y41.775 E.34355
G1 X37.999 Y42.309 E.01641
G1 X46.434 Y33.874 E.36676
G1 X46.967 Y33.874 E.01641
G1 X37.999 Y42.842 E.38996
G1 X37.999 Y43.376 E.01641
G1 X47.501 Y33.874 E.41316
G1 X48.035 Y33.874 E.01641
G1 X37.999 Y43.91 E.43637
G1 X37.999 Y44.443 E.01641
G1 X48.568 Y33.874 E.45957
G1 X49.102 Y33.874 E.01641
G1 X37.83 Y45.147 E.49015
G1 X37.83 Y55.285 F30000
G1 F15000
G1 X47.796 Y45.319 E.43339
G3 X46.986 Y45.595 I-1.581 J-3.307 E.02638
G1 X37.999 Y54.582 E.39078
G1 X37.999 Y54.049 E.01641
G1 X46.378 Y45.67 E.36432
G3 X45.861 Y45.653 I-.173 J-2.582 E.01592
G1 X37.999 Y53.515 E.34186
G1 X37.999 Y52.981 E.01641
G1 X45.408 Y45.573 E.32214
G3 X45.001 Y45.446 I.433 J-2.095 E.01311
G1 X37.999 Y52.448 E.30448
G1 X37.999 Y51.914 E.01641
G1 X44.632 Y45.282 E.2884
G3 X44.295 Y45.085 I.814 J-1.783 E.01202
G1 X37.999 Y51.38 E.27375
G1 X37.999 Y50.847 E.01641
G1 X43.988 Y44.858 E.26041
G3 X43.71 Y44.603 I1.135 J-1.514 E.01163
G1 X37.999 Y50.313 E.24831
G1 X37.999 Y49.78 E.01641
G1 X43.46 Y44.319 E.23745
G3 X43.239 Y44.006 I1.449 J-1.258 E.01179
G1 X37.999 Y49.246 E.22785
G1 X37.999 Y48.712 E.01641
G1 X43.049 Y43.663 E.21956
G3 X42.895 Y43.283 I1.825 J-.959 E.01262
G1 X37.999 Y48.179 E.21288
G1 X37.999 Y47.645 E.01641
G1 X42.78 Y42.864 E.20789
G3 X42.712 Y42.398 I2.292 J-.573 E.01449
G1 X37.999 Y47.111 E.20494
G1 X37.999 Y46.578 E.01641
G1 X42.711 Y41.866 E.20487
G3 X42.814 Y41.23 I4.569 J.413 E.01985
G1 X37.999 Y46.044 E.20936
G1 X37.999 Y45.511 E.01641
G1 X49.636 Y33.874 E.50598
G1 X50.169 Y33.874 E.01641
G1 X45.35 Y38.693 E.20953
G3 X45.99 Y38.587 I.909 J3.505 E.01996
G1 X50.703 Y33.874 E.20493
G1 X51.236 Y33.874 E.01641
G1 X46.526 Y38.585 E.20482
G3 X46.989 Y38.655 I-.122 J2.351 E.01442
G1 X51.77 Y33.874 E.20789
G1 X52.304 Y33.874 E.01641
G1 X47.407 Y38.771 E.21294
G3 X47.786 Y38.926 I-.584 J1.973 E.0126
G1 X52.837 Y33.874 E.21967
G1 X53.371 Y33.874 E.01641
G1 X48.131 Y39.115 E.22787
G3 X48.445 Y39.334 I-.937 J1.677 E.0118
G1 X53.905 Y33.874 E.23741
G1 X54.438 Y33.874 E.01641
G1 X48.73 Y39.583 E.24821
G3 X48.985 Y39.861 I-1.264 J1.414 E.01163
G1 X54.972 Y33.874 E.26032
G1 X55.505 Y33.874 E.01641
G1 X49.211 Y40.168 E.27368
G3 X49.407 Y40.506 I-1.59 J1.149 E.01202
G1 X56.039 Y33.874 E.28837
G1 X56.573 Y33.874 E.01641
G1 X49.571 Y40.877 E.30448
G3 X49.696 Y41.284 I-1.978 J.834 E.01314
G1 X57.106 Y33.874 E.32221
G1 X57.64 Y33.874 E.01641
G1 X49.779 Y41.736 E.34184
G3 X49.795 Y42.253 I-4.383 J.4 E.01591
G1 X58.174 Y33.874 E.36432
G1 X58.707 Y33.874 E.01641
G1 X49.724 Y42.858 E.39063
G3 X49.441 Y43.674 I-3.648 J-.806 E.02662
G1 X59.241 Y33.874 E.42613
G1 X59.774 Y33.874 E.01641
G1 X37.999 Y55.649 E.94686
G1 X37.999 Y56.183 E.01641
G1 X60.308 Y33.874 E.97006
G1 X60.842 Y33.874 E.01641
G1 X37.999 Y56.717 E.99326
G1 X37.999 Y57.25 E.01641
G1 X61.375 Y33.874 E1.01647
G1 X61.909 Y33.874 E.01641
G1 X37.999 Y57.784 E1.03967
G1 X37.999 Y58.318 E.01641
G1 X62.443 Y33.874 E1.06288
G1 X62.976 Y33.874 E.01641
G1 X37.999 Y58.851 E1.08608
G1 X37.999 Y59.385 E.01641
G1 X63.51 Y33.874 E1.10928
G1 X64.043 Y33.874 E.01641
G1 X37.999 Y59.918 E1.13249
G1 X37.999 Y60.452 E.01641
G1 X64.577 Y33.874 E1.15569
G1 X65.111 Y33.874 E.01641
G1 X37.999 Y60.986 E1.1789
G1 X37.999 Y61.519 E.01641
G1 X65.644 Y33.874 E1.2021
G1 X66.178 Y33.874 E.01641
G1 X37.999 Y62.053 E1.2253
G1 X37.999 Y62.587 E.01641
G1 X66.712 Y33.874 E1.24851
G1 X67.245 Y33.874 E.01641
G1 X37.999 Y63.12 E1.27171
G1 X37.999 Y63.654 E.01641
G1 X67.779 Y33.874 E1.29492
G1 X68.312 Y33.874 E.01641
G1 X37.999 Y64.187 E1.31812
G1 X37.999 Y64.721 E.01641
G1 X68.846 Y33.874 E1.34132
G1 X69.38 Y33.874 E.01641
G1 X37.999 Y65.255 E1.36453
G1 X37.999 Y65.788 E.01641
G1 X69.913 Y33.874 E1.38773
G1 X70.447 Y33.874 E.01641
G1 X37.83 Y66.492 E1.41831
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X39.244 Y65.077 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/15
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
G17
G3 Z2.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 15
G1 X126.169 Y212.519
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X126.126 Y212.482 E.00189
G3 X127.819 Y206.666 I1.882 J-2.607 E.26208
G3 X129.175 Y206.879 I.175 J3.3 E.04589
G3 X126.394 Y212.656 I-1.167 J2.996 E.35152
G1 X126.221 Y212.55 E.00675
G1 X126.391 Y212.177 F30000
G1 F16213.044
G1 X126.363 Y212.152 E.00125
G3 X127.85 Y207.072 I1.646 J-2.276 E.22911
G3 X128.761 Y207.17 I.167 J2.73 E.03056
G3 X126.597 Y212.304 I-.752 J2.706 E.31651
G1 X126.442 Y212.209 E.00604
G1 X126.628 Y211.844 F30000
G1 F16213.044
G1 X126.601 Y211.821 E.00119
G3 X127.88 Y207.477 I1.409 J-1.945 E.19603
G3 X128.417 Y207.509 I.113 J2.694 E.01787
G3 X127.014 Y212.061 I-.407 J2.367 E.27078
G1 X126.681 Y211.873 E.01267
G1 X126.824 Y211.506 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X126.674 Y211.377 E.00607
G3 X127.91 Y207.868 I1.333 J-1.503 E.14611
G3 X128.349 Y207.895 I.079 J2.314 E.01355
G3 X126.874 Y211.533 I-.342 J1.979 E.22036
; WIPE_START
M204 S10000
G1 X126.674 Y211.377 E-.09612
G1 X126.398 Y211.089 E-.1519
G1 X126.189 Y210.747 E-.15211
G1 X126.052 Y210.371 E-.15211
G1 X125.992 Y209.975 E-.15215
G1 X126 Y209.829 E-.05562
; WIPE_END
G1 E-.04 F1800
G1 X118.37 Y209.626 Z3 F30000
G1 X43.928 Y207.65 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X44.126 Y207.469 E.00892
G3 X46.069 Y206.666 I2.132 J2.407 E.07104
G3 X47.426 Y206.879 I.175 J3.301 E.04589
G3 X43.892 Y207.698 I-1.167 J2.996 E.54229
G1 X44.214 Y207.94 F30000
G1 F16213.044
G1 X44.396 Y207.774 E.00815
G3 X46.1 Y207.071 I1.863 J2.102 E.0623
G3 X47.011 Y207.17 I.167 J2.73 E.03055
G3 X44.179 Y207.988 I-.752 J2.706 E.4825
G1 X44.514 Y208.219 F30000
G1 F16213.044
G1 X44.852 Y207.93 E.01474
G3 X46.13 Y207.477 I1.408 J1.945 E.04561
G3 X46.667 Y207.509 I.112 J2.695 E.01787
G3 X44.477 Y208.266 I-.407 J2.367 E.42035
G1 X44.749 Y208.544 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X44.781 Y208.512 E.0014
G3 X46.16 Y207.868 I1.476 J1.362 E.04794
G3 X46.599 Y207.895 I.079 J2.314 E.01355
G3 X44.541 Y208.831 I-.342 J1.979 E.31403
G1 X44.714 Y208.593 E.00903
; WIPE_START
M204 S10000
G1 X44.781 Y208.512 E-.03996
G1 X45.076 Y208.243 E-.15188
G1 X45.423 Y208.043 E-.15213
G1 X45.803 Y207.915 E-.15212
G1 X46.16 Y207.868 E-.1368
G1 X46.4 Y207.87 E-.09143
G1 X46.493 Y207.882 E-.03569
; WIPE_END
G1 E-.04 F1800
G1 X46.763 Y200.254 Z3 F30000
G1 X49.412 Y125.413 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X49.457 Y125.679 E.00894
G3 X46.069 Y122.791 I-3.199 J.321 E.50699
G3 X47.426 Y123.004 I.174 J3.301 E.04589
G3 X49.408 Y125.354 I-1.168 J2.996 E.1063
G1 X49.01 Y125.477 F30000
G1 F16213.044
G1 X49.053 Y125.719 E.00817
G3 X46.1 Y123.196 I-2.795 J.281 E.44316
G3 X47.011 Y123.295 I.167 J2.731 E.03055
G3 X49.006 Y125.418 I-.752 J2.706 E.1016
G1 X48.609 Y125.557 F30000
G1 F16213.044
G1 X48.662 Y126 E.0148
G3 X46.13 Y123.602 I-2.402 J.001 E.37113
G3 X46.667 Y123.634 I.112 J2.696 E.01787
G3 X48.608 Y125.498 I-.407 J2.367 E.09477
G1 X48.222 Y125.617 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X48.266 Y126 E.01186
G3 X46.16 Y123.993 I-2.009 J0 E.28784
G3 X46.599 Y124.02 I.079 J2.314 E.01355
G3 X48.217 Y125.558 I-.342 J1.979 E.07272
; WIPE_START
M204 S10000
G1 X48.266 Y126 E-.1689
G1 X48.25 Y126.2 E-.07631
G1 X48.171 Y126.592 E-.15208
G1 X48.015 Y126.961 E-.15215
G1 X47.79 Y127.292 E-.15212
G1 X47.68 Y127.4 E-.05844
; WIPE_END
G1 E-.04 F1800
G1 X54.557 Y130.71 Z3 F30000
G1 X201.166 Y201.291 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X54.834 Y201.291 E4.85411
G1 X54.834 Y50.709 E4.99509
G1 X201.166 Y50.709 E4.85411
G1 X201.166 Y201.231 E4.9931
G1 X200.759 Y200.884 F30000
G1 F16213.044
G1 X55.241 Y200.884 E4.82711
G1 X55.241 Y51.116 E4.96809
G1 X200.759 Y51.116 E4.82711
G1 X200.759 Y200.824 E4.9661
G1 X200.352 Y200.477 F30000
G1 F16213.044
G1 X55.648 Y200.477 E4.8001
G1 X55.648 Y51.523 E4.94108
G1 X200.352 Y51.523 E4.8001
G1 X200.352 Y200.417 E4.93909
G1 X199.96 Y200.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X56.04 Y200.085 E4.42226
G1 X56.04 Y51.915 E4.55285
G1 X199.96 Y51.915 E4.42226
G1 X199.96 Y200.025 E4.55101
; WIPE_START
M204 S10000
G1 X197.96 Y200.026 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X192.697 Y194.499 Z3 F30000
G1 X44.845 Y39.233 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X44.929 Y39.198 E.00303
G3 X46.069 Y38.916 I1.329 J2.928 E.03918
G3 X47.426 Y39.129 I.175 J3.301 E.04589
G3 X44.645 Y39.344 I-1.168 J2.996 E.57442
G1 X44.793 Y39.263 E.00561
G1 X45.401 Y39.448 F30000
G1 F16213.044
G1 X45.626 Y39.389 E.00771
G3 X46.1 Y39.321 I.633 J2.737 E.01591
G3 X47.011 Y39.42 I.167 J2.731 E.03055
G3 X45.345 Y39.47 I-.752 J2.706 E.5293
G1 X45.83 Y39.767 F30000
G1 F16213.044
G1 X46.13 Y39.727 E.01004
G3 X46.667 Y39.759 I.112 J2.696 E.01787
G3 X45.716 Y39.786 I-.407 J2.367 E.46878
G1 X45.771 Y39.777 E.00185
G1 X46.095 Y40.127 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X46.16 Y40.118 E.00199
G3 X46.599 Y40.145 I.079 J2.314 E.01355
G3 X45.803 Y40.168 I-.342 J1.979 E.36318
G1 X46.036 Y40.135 E.00722
; WIPE_START
M204 S10000
G1 X46.16 Y40.118 E-.04738
G1 X46.4 Y40.12 E-.09142
G1 X46.599 Y40.145 E-.07618
G1 X46.984 Y40.254 E-.1521
G1 X47.341 Y40.436 E-.15215
G1 X47.654 Y40.686 E-.15212
G1 X47.804 Y40.865 E-.08866
; WIPE_END
G1 E-.04 F1800
G1 X55.434 Y40.707 Z3 F30000
G1 X126.598 Y39.232 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X126.679 Y39.198 E.00294
G3 X127.819 Y38.916 I1.329 J2.928 E.03918
G3 X129.176 Y39.129 I.175 J3.301 E.04589
G3 X126.395 Y39.344 I-1.168 J2.996 E.57441
G1 X126.545 Y39.261 E.0057
G1 X127.149 Y39.448 F30000
G1 F16213.044
G1 X127.376 Y39.389 E.00776
G3 X127.85 Y39.321 I.633 J2.737 E.01591
G3 X128.761 Y39.42 I.167 J2.731 E.03055
G3 X127.093 Y39.47 I-.752 J2.706 E.52925
G1 X127.579 Y39.767 F30000
G1 F16213.044
G1 X127.88 Y39.727 E.0101
G3 X128.417 Y39.759 I.112 J2.696 E.01787
G3 X127.466 Y39.786 I-.407 J2.366 E.46863
G1 X127.519 Y39.777 E.00179
G1 X127.917 Y40.118 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X128.15 Y40.123 E.00716
G3 X128.349 Y40.145 I-.161 J2.31 E.00616
G3 X127.857 Y40.122 I-.342 J1.979 E.37263
; WIPE_START
M204 S10000
G1 X128.15 Y40.123 E-.11126
G1 X128.349 Y40.145 E-.07614
G1 X128.734 Y40.254 E-.1521
G1 X129.091 Y40.436 E-.15215
G1 X129.404 Y40.686 E-.15209
G1 X129.6 Y40.92 E-.11626
; WIPE_END
G1 E-.04 F1800
G1 X137.231 Y40.749 Z3 F30000
G1 X210.825 Y39.096 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X210.926 Y39.129 E.00353
G3 X209.569 Y38.916 I-1.167 J2.996 E.62423
G3 X210.621 Y39.029 I.174 J3.301 E.03524
G1 X210.767 Y39.077 E.00511
G1 X210.38 Y39.39 F30000
G1 F16213.044
G1 X210.511 Y39.42 E.00446
G3 X209.6 Y39.321 I-.752 J2.706 E.5549
G3 X210.238 Y39.357 I.167 J2.731 E.02125
G1 X210.322 Y39.376 E.00285
G1 X209.987 Y39.736 F30000
G1 F16213.044
G1 X210.167 Y39.759 E.00604
G3 X209.63 Y39.727 I-.407 J2.366 E.48252
G3 X209.927 Y39.731 I.112 J2.696 E.00984
G1 X209.666 Y40.118 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.9 Y40.123 E.00718
G3 X210.099 Y40.145 I-.161 J2.31 E.00616
G3 X209.607 Y40.122 I-.342 J1.979 E.37261
; WIPE_START
M204 S10000
G1 X209.9 Y40.123 E-.11147
G1 X210.099 Y40.145 E-.07614
G1 X210.484 Y40.254 E-.15212
G1 X210.841 Y40.436 E-.15208
G1 X211.154 Y40.686 E-.15216
G1 X211.35 Y40.92 E-.11603
; WIPE_END
G1 E-.04 F1800
G1 X211.301 Y48.552 Z3 F30000
G1 X210.825 Y122.971 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X210.926 Y123.004 E.00353
G3 X209.569 Y122.791 I-1.167 J2.996 E.62422
G3 X210.621 Y122.904 I.175 J3.301 E.03524
G1 X210.768 Y122.952 E.00512
G1 X210.38 Y123.265 F30000
G1 F16213.044
G1 X210.511 Y123.295 E.00445
G3 X209.6 Y123.196 I-.752 J2.706 E.5549
G3 X210.238 Y123.232 I.167 J2.731 E.02125
G1 X210.322 Y123.251 E.00285
G1 X209.987 Y123.611 F30000
G1 F16213.044
G1 X210.167 Y123.634 E.00603
G3 X209.63 Y123.602 I-.407 J2.366 E.48252
G3 X209.927 Y123.606 I.112 J2.696 E.00984
G1 X209.667 Y123.993 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.9 Y123.998 E.00717
G3 X210.099 Y124.02 I-.161 J2.31 E.00616
G3 X209.607 Y123.997 I-.342 J1.979 E.37262
; WIPE_START
M204 S10000
G1 X209.9 Y123.998 E-.11144
G1 X210.099 Y124.02 E-.07614
G1 X210.484 Y124.129 E-.15212
G1 X210.841 Y124.311 E-.15212
G1 X211.154 Y124.561 E-.15213
G1 X211.35 Y124.795 E-.11606
; WIPE_END
G1 E-.04 F1800
G1 X211.071 Y132.422 Z3 F30000
G1 X208.347 Y206.982 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X208.429 Y206.948 E.00296
G3 X209.569 Y206.666 I1.329 J2.928 E.03918
G3 X210.926 Y206.879 I.175 J3.3 E.04589
G3 X208.144 Y207.094 I-1.167 J2.996 E.57441
G1 X208.295 Y207.011 E.00569
G1 X208.899 Y207.199 F30000
G1 F16213.044
G1 X209.126 Y207.139 E.00777
G3 X209.6 Y207.071 I.633 J2.737 E.01591
G3 X210.511 Y207.17 I.167 J2.731 E.03055
G3 X208.843 Y207.22 I-.752 J2.706 E.52924
G1 X209.328 Y207.517 F30000
G1 F16213.044
G1 X209.63 Y207.477 E.01011
G3 X210.167 Y207.509 I.112 J2.695 E.01787
G3 X209.216 Y207.536 I-.407 J2.367 E.46878
G1 X209.269 Y207.527 E.00178
G1 X209.659 Y207.868 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.66 Y207.868 E.00002
G3 X210.099 Y207.895 I.079 J2.315 E.01355
G3 X209.303 Y207.918 I-.342 J1.979 E.36318
G1 X209.599 Y207.877 E.00919
; WIPE_START
M204 S10000
G1 X209.66 Y207.868 E-.02309
G1 X209.9 Y207.87 E-.09142
G1 X210.099 Y207.895 E-.07617
G1 X210.484 Y208.004 E-.15214
G1 X210.841 Y208.186 E-.15207
G1 X211.154 Y208.436 E-.15216
G1 X211.345 Y208.664 E-.11294
; WIPE_END
G1 E-.04 F1800
G1 X215.778 Y214.877 Z3 F30000
G1 X218.334 Y218.459 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X37.666 Y218.459 E5.99308
G1 X37.666 Y33.541 E6.13406
G1 X218.334 Y33.541 E5.99308
G1 X218.334 Y218.399 E6.13207
G1 X218.741 Y218.866 F30000
G1 F16213.044
G1 X37.259 Y218.866 E6.02008
G1 X37.259 Y33.134 E6.16106
G1 X218.741 Y33.134 E6.02008
G1 X218.741 Y218.806 E6.15907
G1 X219.148 Y219.273 F30000
G1 F16213.044
G1 X36.852 Y219.273 E6.04709
G1 X36.852 Y32.727 E6.18807
G1 X219.148 Y32.727 E6.04709
G1 X219.148 Y219.213 E6.18608
G1 X219.54 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X36.46 Y219.665 E5.62554
G1 X36.46 Y32.335 E5.75613
G1 X219.54 Y32.335 E5.62554
G1 X219.54 Y219.605 E5.75429
; WIPE_START
M204 S10000
G1 X217.54 Y219.606 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X212.561 Y218.295 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42025
G1 F15000
G1 X195.89 Y201.624 E.72491
G1 X195.357 Y201.624 E.01641
G1 X211.858 Y218.126 E.71754
G1 X211.324 Y218.126 E.01641
G1 X194.823 Y201.624 E.71754
G1 X194.289 Y201.624 E.01641
G1 X210.791 Y218.126 E.71754
G1 X210.257 Y218.126 E.01641
G1 X193.756 Y201.624 E.71754
G1 X193.222 Y201.624 E.01641
G1 X209.723 Y218.126 E.71754
G1 X209.19 Y218.126 E.01641
G1 X192.689 Y201.624 E.71754
G1 X192.155 Y201.624 E.01641
G1 X208.656 Y218.126 E.71754
G1 X208.123 Y218.126 E.01641
G1 X191.621 Y201.624 E.71754
G1 X191.088 Y201.624 E.01641
G1 X207.589 Y218.126 E.71754
G1 X207.055 Y218.126 E.01641
G1 X190.554 Y201.624 E.71754
G1 X190.02 Y201.624 E.01641
G1 X206.522 Y218.126 E.71754
G1 X205.988 Y218.126 E.01641
G1 X189.487 Y201.624 E.71754
G1 X188.953 Y201.624 E.01641
G1 X205.454 Y218.126 E.71754
G1 X204.921 Y218.126 E.01641
G1 X188.42 Y201.624 E.71754
G1 X187.886 Y201.624 E.01641
G1 X204.387 Y218.126 E.71754
G1 X203.854 Y218.126 E.01641
G1 X187.352 Y201.624 E.71754
G1 X186.819 Y201.624 E.01641
G1 X203.32 Y218.126 E.71754
G1 X202.786 Y218.126 E.01641
M73 P79 R12
G1 X186.285 Y201.624 E.71754
G1 X185.751 Y201.624 E.01641
G1 X202.253 Y218.126 E.71754
G1 X201.719 Y218.126 E.01641
G1 X185.218 Y201.624 E.71754
G1 X184.684 Y201.624 E.01641
G1 X201.185 Y218.126 E.71754
G1 X200.652 Y218.126 E.01641
G1 X184.151 Y201.624 E.71754
G1 X183.617 Y201.624 E.01641
G1 X200.118 Y218.126 E.71754
G1 X199.585 Y218.126 E.01641
G1 X183.083 Y201.624 E.71754
G1 X182.55 Y201.624 E.01641
G1 X199.051 Y218.126 E.71754
G1 X198.517 Y218.126 E.01641
G1 X182.016 Y201.624 E.71754
G1 X181.482 Y201.624 E.01641
G1 X197.984 Y218.126 E.71754
G1 X197.45 Y218.126 E.01641
G1 X180.949 Y201.624 E.71754
G1 X180.415 Y201.624 E.01641
G1 X196.916 Y218.126 E.71754
G1 X196.383 Y218.126 E.01641
G1 X179.882 Y201.624 E.71754
G1 X179.348 Y201.624 E.01641
G1 X195.849 Y218.126 E.71754
G1 X195.316 Y218.126 E.01641
G1 X178.814 Y201.624 E.71754
G1 X178.281 Y201.624 E.01641
G1 X194.782 Y218.126 E.71754
G1 X194.248 Y218.126 E.01641
G1 X177.747 Y201.624 E.71754
G1 X177.213 Y201.624 E.01641
G1 X193.715 Y218.126 E.71754
G1 X193.181 Y218.126 E.01641
G1 X176.68 Y201.624 E.71754
G1 X176.146 Y201.624 E.01641
G1 X192.647 Y218.126 E.71754
G1 X192.114 Y218.126 E.01641
G1 X175.612 Y201.624 E.71754
G1 X175.079 Y201.624 E.01641
G1 X191.58 Y218.126 E.71754
G1 X191.047 Y218.126 E.01641
G1 X174.545 Y201.624 E.71754
G1 X174.012 Y201.624 E.01641
G1 X190.513 Y218.126 E.71754
G1 X189.979 Y218.126 E.01641
G1 X173.478 Y201.624 E.71754
G1 X172.944 Y201.624 E.01641
G1 X189.446 Y218.126 E.71754
G1 X188.912 Y218.126 E.01641
G1 X172.411 Y201.624 E.71754
G1 X171.877 Y201.624 E.01641
G1 X188.378 Y218.126 E.71754
G1 X187.845 Y218.126 E.01641
G1 X171.343 Y201.624 E.71754
G1 X170.81 Y201.624 E.01641
G1 X187.311 Y218.126 E.71754
G1 X186.778 Y218.126 E.01641
G1 X170.276 Y201.624 E.71754
G1 X169.743 Y201.624 E.01641
G1 X186.244 Y218.126 E.71754
G1 X185.71 Y218.126 E.01641
G1 X169.209 Y201.624 E.71754
G1 X168.675 Y201.624 E.01641
G1 X185.177 Y218.126 E.71754
G1 X184.643 Y218.126 E.01641
G1 X168.142 Y201.624 E.71754
G1 X167.608 Y201.624 E.01641
G1 X184.109 Y218.126 E.71754
G1 X183.576 Y218.126 E.01641
G1 X167.074 Y201.624 E.71754
G1 X166.541 Y201.624 E.01641
G1 X183.042 Y218.126 E.71754
G1 X182.509 Y218.126 E.01641
G1 X166.007 Y201.624 E.71754
G1 X165.474 Y201.624 E.01641
G1 X181.975 Y218.126 E.71754
G1 X181.441 Y218.126 E.01641
G1 X164.94 Y201.624 E.71754
G1 X164.406 Y201.624 E.01641
G1 X180.908 Y218.126 E.71754
G1 X180.374 Y218.126 E.01641
G1 X163.873 Y201.624 E.71754
G1 X163.339 Y201.624 E.01641
G1 X179.84 Y218.126 E.71754
G1 X179.307 Y218.126 E.01641
G1 X162.805 Y201.624 E.71754
G1 X162.272 Y201.624 E.01641
G1 X178.773 Y218.126 E.71754
G1 X178.24 Y218.126 E.01641
G1 X161.738 Y201.624 E.71754
G1 X161.205 Y201.624 E.01641
G1 X177.706 Y218.126 E.71754
G1 X177.172 Y218.126 E.01641
G1 X160.671 Y201.624 E.71754
G1 X160.137 Y201.624 E.01641
G1 X176.639 Y218.126 E.71754
G1 X176.105 Y218.126 E.01641
G1 X159.604 Y201.624 E.71754
G1 X159.07 Y201.624 E.01641
G1 X175.571 Y218.126 E.71754
G1 X175.038 Y218.126 E.01641
G1 X158.536 Y201.624 E.71754
G1 X158.003 Y201.624 E.01641
G1 X174.504 Y218.126 E.71754
G1 X173.971 Y218.126 E.01641
G1 X157.469 Y201.624 E.71754
G1 X156.936 Y201.624 E.01641
G1 X173.437 Y218.126 E.71754
G1 X172.903 Y218.126 E.01641
G1 X156.402 Y201.624 E.71754
G1 X155.868 Y201.624 E.01641
G1 X172.37 Y218.126 E.71754
G1 X171.836 Y218.126 E.01641
G1 X155.335 Y201.624 E.71754
G1 X154.801 Y201.624 E.01641
G1 X171.302 Y218.126 E.71754
G1 X170.769 Y218.126 E.01641
G1 X154.267 Y201.624 E.71754
G1 X153.734 Y201.624 E.01641
G1 X170.235 Y218.126 E.71754
G1 X169.702 Y218.126 E.01641
G1 X153.2 Y201.624 E.71754
G1 X152.667 Y201.624 E.01641
G1 X169.168 Y218.126 E.71754
G1 X168.634 Y218.126 E.01641
G1 X152.133 Y201.624 E.71754
M73 P79 R11
G1 X151.599 Y201.624 E.01641
G1 X168.101 Y218.126 E.71754
G1 X167.567 Y218.126 E.01641
G1 X151.066 Y201.624 E.71754
G1 X150.532 Y201.624 E.01641
G1 X167.033 Y218.126 E.71754
G1 X166.5 Y218.126 E.01641
G1 X149.998 Y201.624 E.71754
G1 X149.465 Y201.624 E.01641
G1 X165.966 Y218.126 E.71754
G1 X165.433 Y218.126 E.01641
G1 X148.931 Y201.624 E.71754
G1 X148.398 Y201.624 E.01641
G1 X164.899 Y218.126 E.71754
G1 X164.365 Y218.126 E.01641
G1 X147.864 Y201.624 E.71754
G1 X147.33 Y201.624 E.01641
G1 X163.832 Y218.126 E.71754
G1 X163.298 Y218.126 E.01641
G1 X146.797 Y201.624 E.71754
G1 X146.263 Y201.624 E.01641
G1 X162.764 Y218.126 E.71754
G1 X162.231 Y218.126 E.01641
G1 X145.729 Y201.624 E.71754
G1 X145.196 Y201.624 E.01641
G1 X161.697 Y218.126 E.71754
G1 X161.164 Y218.126 E.01641
G1 X144.662 Y201.624 E.71754
G1 X144.129 Y201.624 E.01641
G1 X160.63 Y218.126 E.71754
G1 X160.096 Y218.126 E.01641
G1 X143.595 Y201.624 E.71754
G1 X143.061 Y201.624 E.01641
G1 X159.563 Y218.126 E.71754
G1 X159.029 Y218.126 E.01641
G1 X142.528 Y201.624 E.71754
G1 X141.994 Y201.624 E.01641
G1 X158.495 Y218.126 E.71754
G1 X157.962 Y218.126 E.01641
G1 X141.46 Y201.624 E.71754
G1 X140.927 Y201.624 E.01641
G1 X157.428 Y218.126 E.71754
G1 X156.895 Y218.126 E.01641
G1 X140.393 Y201.624 E.71754
G1 X139.86 Y201.624 E.01641
G1 X156.361 Y218.126 E.71754
G1 X155.827 Y218.126 E.01641
G1 X139.326 Y201.624 E.71754
G1 X138.792 Y201.624 E.01641
G1 X155.294 Y218.126 E.71754
G1 X154.76 Y218.126 E.01641
G1 X138.259 Y201.624 E.71754
G1 X137.725 Y201.624 E.01641
G1 X154.226 Y218.126 E.71754
G1 X153.693 Y218.126 E.01641
G1 X137.191 Y201.624 E.71754
G1 X136.658 Y201.624 E.01641
G1 X153.159 Y218.126 E.71754
G1 X152.626 Y218.126 E.01641
G1 X136.124 Y201.624 E.71754
G1 X135.591 Y201.624 E.01641
G1 X152.092 Y218.126 E.71754
G1 X151.558 Y218.126 E.01641
G1 X135.057 Y201.624 E.71754
G1 X134.523 Y201.624 E.01641
G1 X151.025 Y218.126 E.71754
G1 X150.491 Y218.126 E.01641
G1 X133.99 Y201.624 E.71754
G1 X133.456 Y201.624 E.01641
G1 X149.957 Y218.126 E.71754
G1 X149.424 Y218.126 E.01641
G1 X132.922 Y201.624 E.71754
G1 X132.389 Y201.624 E.01641
G1 X148.89 Y218.126 E.71754
G1 X148.357 Y218.126 E.01641
G1 X131.855 Y201.624 E.71754
G1 X131.322 Y201.624 E.01641
G1 X147.823 Y218.126 E.71754
G1 X147.289 Y218.126 E.01641
G1 X130.788 Y201.624 E.71754
G1 X130.254 Y201.624 E.01641
G1 X146.756 Y218.126 E.71754
G1 X146.222 Y218.126 E.01641
G1 X129.721 Y201.624 E.71754
G1 X129.187 Y201.624 E.01641
G1 X145.688 Y218.126 E.71754
G1 X145.155 Y218.126 E.01641
G1 X128.653 Y201.624 E.71754
G1 X128.12 Y201.624 E.01641
G1 X144.621 Y218.126 E.71754
G1 X144.088 Y218.126 E.01641
G1 X127.586 Y201.624 E.71754
G1 X127.053 Y201.624 E.01641
G1 X143.554 Y218.126 E.71754
G1 X143.02 Y218.126 E.01641
G1 X126.519 Y201.624 E.71754
G1 X125.985 Y201.624 E.01641
G1 X142.487 Y218.126 E.71754
G1 X141.953 Y218.126 E.01641
G1 X125.452 Y201.624 E.71754
G1 X124.918 Y201.624 E.01641
G1 X141.419 Y218.126 E.71754
G1 X140.886 Y218.126 E.01641
G1 X131.282 Y208.522 E.41759
G3 X131.496 Y209.269 I-3.6 J1.433 E.02393
G1 X140.352 Y218.126 E.3851
G1 X139.818 Y218.126 E.01641
G1 X131.551 Y209.858 E.35952
G3 X131.515 Y210.356 I-4.932 J-.106 E.01535
G1 X139.285 Y218.126 E.33787
G1 X138.751 Y218.126 E.01641
G1 X131.425 Y210.799 E.31857
G3 X131.292 Y211.2 I-2.07 J-.462 E.01301
G1 X138.218 Y218.126 E.30114
G1 X137.684 Y218.126 E.01641
G1 X131.123 Y211.565 E.28529
G3 X130.92 Y211.895 I-9.666 J-5.73 E.01193
G1 X137.15 Y218.126 E.27093
G1 X136.617 Y218.126 E.01641
G1 X130.686 Y212.195 E.25788
G3 X130.424 Y212.467 I-1.487 J-1.173 E.01162
G1 X136.083 Y218.126 E.24608
G1 X135.549 Y218.126 E.01641
G1 X130.134 Y212.71 E.2355
G3 X129.814 Y212.924 I-1.228 J-1.49 E.01185
G1 X135.016 Y218.126 E.2262
G1 X134.482 Y218.126 E.01641
G1 X129.463 Y213.106 E.21826
G3 X129.078 Y213.255 I-.935 J-1.85 E.01271
G1 X133.949 Y218.126 E.2118
G1 X133.415 Y218.126 E.01641
G1 X128.654 Y213.364 E.20705
G3 X128.175 Y213.419 I-.771 J-4.631 E.01483
G1 X132.881 Y218.126 E.20467
G1 X132.348 Y218.126 E.01641
G1 X127.626 Y213.404 E.20531
G3 X126.954 Y213.266 I.453 J-3.898 E.02113
G1 X131.814 Y218.126 E.21133
G1 X131.28 Y218.126 E.01641
G1 X114.779 Y201.624 E.71754
G1 X115.313 Y201.624 E.01641
G1 X124.611 Y210.923 E.40432
G3 X124.473 Y210.251 I3.399 J-1.05 E.02113
G1 X115.846 Y201.624 E.3751
G1 X116.38 Y201.624 E.01641
G1 X124.453 Y209.697 E.35104
G3 X124.513 Y209.223 I2.395 J.062 E.01471
G1 X116.914 Y201.624 E.33044
G1 X117.447 Y201.624 E.01641
G1 X124.62 Y208.797 E.31191
G3 X124.768 Y208.411 I2.005 J.543 E.01273
G1 X117.981 Y201.624 E.29511
G1 X118.515 Y201.624 E.01641
G1 X124.95 Y208.059 E.27982
G3 X125.163 Y207.739 I1.707 J.906 E.01185
G1 X119.048 Y201.624 E.26589
G1 X119.582 Y201.624 E.01641
G1 X125.407 Y207.449 E.25329
G3 X125.68 Y207.189 I1.44 J1.234 E.01162
G1 X120.115 Y201.624 E.24195
G1 X120.649 Y201.624 E.01641
G1 X125.981 Y206.956 E.23185
G3 X126.312 Y206.754 I1.177 J1.555 E.01196
G1 X121.183 Y201.624 E.22306
G1 X121.716 Y201.624 E.01641
G1 X126.676 Y206.584 E.21567
G3 X127.076 Y206.45 I.869 J1.932 E.01298
G1 X122.25 Y201.624 E.20984
G1 X122.784 Y201.624 E.01641
G1 X127.517 Y206.358 E.20585
G3 X128.025 Y206.333 I.428 J3.44 E.01565
G1 X123.317 Y201.624 E.20473
G1 X123.851 Y201.624 E.01641
G1 X128.602 Y206.376 E.2066
G3 X129.355 Y206.595 I-.337 J2.559 E.02421
G1 X124.215 Y201.455 E.22352
G1 X114.076 Y201.455 F30000
G1 F15000
G1 X130.747 Y218.126 E.72491
G1 X130.213 Y218.126 E.01641
G1 X113.712 Y201.624 E.71754
G1 X113.178 Y201.624 E.01641
G1 X129.68 Y218.126 E.71754
G1 X129.146 Y218.126 E.01641
G1 X112.645 Y201.624 E.71754
G1 X112.111 Y201.624 E.01641
G1 X128.612 Y218.126 E.71754
G1 X128.079 Y218.126 E.01641
G1 X111.577 Y201.624 E.71754
G1 X111.044 Y201.624 E.01641
G1 X127.545 Y218.126 E.71754
G1 X127.011 Y218.126 E.01641
G1 X110.51 Y201.624 E.71754
G1 X109.977 Y201.624 E.01641
G1 X126.478 Y218.126 E.71754
G1 X125.944 Y218.126 E.01641
G1 X109.443 Y201.624 E.71754
G1 X108.909 Y201.624 E.01641
G1 X125.411 Y218.126 E.71754
G1 X124.877 Y218.126 E.01641
G1 X108.376 Y201.624 E.71754
G1 X107.842 Y201.624 E.01641
G1 X124.343 Y218.126 E.71754
G1 X123.81 Y218.126 E.01641
G1 X107.308 Y201.624 E.71754
G1 X106.775 Y201.624 E.01641
G1 X123.276 Y218.126 E.71754
G1 X122.742 Y218.126 E.01641
G1 X106.241 Y201.624 E.71754
G1 X105.708 Y201.624 E.01641
G1 X122.209 Y218.126 E.71754
G1 X121.675 Y218.126 E.01641
G1 X105.174 Y201.624 E.71754
G1 X104.64 Y201.624 E.01641
G1 X121.142 Y218.126 E.71754
G1 X120.608 Y218.126 E.01641
G1 X104.107 Y201.624 E.71754
G1 X103.573 Y201.624 E.01641
G1 X120.074 Y218.126 E.71754
G1 X119.541 Y218.126 E.01641
G1 X103.039 Y201.624 E.71754
G1 X102.506 Y201.624 E.01641
G1 X119.007 Y218.126 E.71754
G1 X118.473 Y218.126 E.01641
G1 X101.972 Y201.624 E.71754
G1 X101.439 Y201.624 E.01641
G1 X117.94 Y218.126 E.71754
G1 X117.406 Y218.126 E.01641
G1 X100.905 Y201.624 E.71754
G1 X100.371 Y201.624 E.01641
G1 X116.873 Y218.126 E.71754
G1 X116.339 Y218.126 E.01641
G1 X99.838 Y201.624 E.71754
G1 X99.304 Y201.624 E.01641
G1 X115.805 Y218.126 E.71754
G1 X115.272 Y218.126 E.01641
G1 X98.77 Y201.624 E.71754
G1 X98.237 Y201.624 E.01641
G1 X114.738 Y218.126 E.71754
G1 X114.204 Y218.126 E.01641
G1 X97.703 Y201.624 E.71754
G1 X97.17 Y201.624 E.01641
G1 X113.671 Y218.126 E.71754
G1 X113.137 Y218.126 E.01641
G1 X96.636 Y201.624 E.71754
G1 X96.102 Y201.624 E.01641
G1 X112.604 Y218.126 E.71754
G1 X112.07 Y218.126 E.01641
G1 X95.569 Y201.624 E.71754
G1 X95.035 Y201.624 E.01641
G1 X111.536 Y218.126 E.71754
G1 X111.003 Y218.126 E.01641
G1 X94.501 Y201.624 E.71754
G1 X93.968 Y201.624 E.01641
G1 X110.469 Y218.126 E.71754
G1 X109.935 Y218.126 E.01641
G1 X93.434 Y201.624 E.71754
G1 X92.901 Y201.624 E.01641
G1 X109.402 Y218.126 E.71754
G1 X108.868 Y218.126 E.01641
G1 X92.367 Y201.624 E.71754
G1 X91.833 Y201.624 E.01641
G1 X108.335 Y218.126 E.71754
G1 X107.801 Y218.126 E.01641
G1 X91.3 Y201.624 E.71754
G1 X90.766 Y201.624 E.01641
G1 X107.267 Y218.126 E.71754
G1 X106.734 Y218.126 E.01641
G1 X90.232 Y201.624 E.71754
G1 X89.699 Y201.624 E.01641
G1 X106.2 Y218.126 E.71754
G1 X105.666 Y218.126 E.01641
G1 X89.165 Y201.624 E.71754
G1 X88.632 Y201.624 E.01641
G1 X105.133 Y218.126 E.71754
G1 X104.599 Y218.126 E.01641
G1 X88.098 Y201.624 E.71754
G1 X87.564 Y201.624 E.01641
G1 X104.066 Y218.126 E.71754
G1 X103.532 Y218.126 E.01641
G1 X87.031 Y201.624 E.71754
G1 X86.497 Y201.624 E.01641
G1 X102.998 Y218.126 E.71754
G1 X102.465 Y218.126 E.01641
G1 X85.963 Y201.624 E.71754
G1 X85.43 Y201.624 E.01641
G1 X101.931 Y218.126 E.71754
G1 X101.397 Y218.126 E.01641
G1 X84.896 Y201.624 E.71754
G1 X84.363 Y201.624 E.01641
G1 X100.864 Y218.126 E.71754
G1 X100.33 Y218.126 E.01641
G1 X83.829 Y201.624 E.71754
G1 X83.295 Y201.624 E.01641
G1 X99.797 Y218.126 E.71754
G1 X99.263 Y218.126 E.01641
G1 X82.762 Y201.624 E.71754
G1 X82.228 Y201.624 E.01641
G1 X98.729 Y218.126 E.71754
G1 X98.196 Y218.126 E.01641
G1 X81.694 Y201.624 E.71754
G1 X81.161 Y201.624 E.01641
G1 X97.662 Y218.126 E.71754
G1 X97.128 Y218.126 E.01641
G1 X80.627 Y201.624 E.71754
G1 X80.094 Y201.624 E.01641
G1 X96.595 Y218.126 E.71754
G1 X96.061 Y218.126 E.01641
G1 X79.56 Y201.624 E.71754
G1 X79.026 Y201.624 E.01641
G1 X95.528 Y218.126 E.71754
G1 X94.994 Y218.126 E.01641
G1 X78.493 Y201.624 E.71754
G1 X77.959 Y201.624 E.01641
G1 X94.46 Y218.126 E.71754
G1 X93.927 Y218.126 E.01641
G1 X77.425 Y201.624 E.71754
G1 X76.892 Y201.624 E.01641
G1 X93.393 Y218.126 E.71754
G1 X92.859 Y218.126 E.01641
G1 X76.358 Y201.624 E.71754
G1 X75.825 Y201.624 E.01641
G1 X92.326 Y218.126 E.71754
G1 X91.792 Y218.126 E.01641
G1 X75.291 Y201.624 E.71754
G1 X74.757 Y201.624 E.01641
G1 X91.259 Y218.126 E.71754
G1 X90.725 Y218.126 E.01641
G1 X74.224 Y201.624 E.71754
G1 X73.69 Y201.624 E.01641
G1 X90.191 Y218.126 E.71754
G1 X89.658 Y218.126 E.01641
G1 X73.156 Y201.624 E.71754
G1 X72.623 Y201.624 E.01641
G1 X89.124 Y218.126 E.71754
G1 X88.59 Y218.126 E.01641
G1 X72.089 Y201.624 E.71754
G1 X71.556 Y201.624 E.01641
G1 X88.057 Y218.126 E.71754
G1 X87.523 Y218.126 E.01641
G1 X71.022 Y201.624 E.71754
G1 X70.488 Y201.624 E.01641
G1 X86.99 Y218.126 E.71754
G1 X86.456 Y218.126 E.01641
G1 X69.955 Y201.624 E.71754
G1 X69.421 Y201.624 E.01641
G1 X85.922 Y218.126 E.71754
G1 X85.389 Y218.126 E.01641
G1 X68.887 Y201.624 E.71754
G1 X68.354 Y201.624 E.01641
G1 X84.855 Y218.126 E.71754
G1 X84.321 Y218.126 E.01641
G1 X67.82 Y201.624 E.71754
G1 X67.287 Y201.624 E.01641
G1 X83.788 Y218.126 E.71754
G1 X83.254 Y218.126 E.01641
G1 X66.753 Y201.624 E.71754
G1 X66.219 Y201.624 E.01641
G1 X82.721 Y218.126 E.71754
G1 X82.187 Y218.126 E.01641
G1 X65.686 Y201.624 E.71754
G1 X65.152 Y201.624 E.01641
G1 X81.653 Y218.126 E.71754
G1 X81.12 Y218.126 E.01641
G1 X64.618 Y201.624 E.71754
G1 X64.085 Y201.624 E.01641
G1 X80.586 Y218.126 E.71754
G1 X80.052 Y218.126 E.01641
G1 X63.551 Y201.624 E.71754
M73 P80 R11
G1 X63.018 Y201.624 E.01641
G1 X79.519 Y218.126 E.71754
G1 X78.985 Y218.126 E.01641
G1 X62.484 Y201.624 E.71754
G1 X61.95 Y201.624 E.01641
G1 X78.452 Y218.126 E.71754
G1 X77.918 Y218.126 E.01641
G1 X61.417 Y201.624 E.71754
G1 X60.883 Y201.624 E.01641
G1 X77.384 Y218.126 E.71754
G1 X76.851 Y218.126 E.01641
G1 X60.349 Y201.624 E.71754
G1 X59.816 Y201.624 E.01641
G1 X76.317 Y218.126 E.71754
G1 X75.783 Y218.126 E.01641
G1 X59.282 Y201.624 E.71754
G1 X58.749 Y201.624 E.01641
G1 X75.25 Y218.126 E.71754
G1 X74.716 Y218.126 E.01641
G1 X58.215 Y201.624 E.71754
G1 X57.681 Y201.624 E.01641
G1 X74.183 Y218.126 E.71754
G1 X73.649 Y218.126 E.01641
G1 X57.148 Y201.624 E.71754
G1 X56.614 Y201.624 E.01641
G1 X73.115 Y218.126 E.71754
G1 X72.582 Y218.126 E.01641
G1 X56.08 Y201.624 E.71754
G1 X55.547 Y201.624 E.01641
G1 X72.048 Y218.126 E.71754
G1 X71.514 Y218.126 E.01641
G1 X55.013 Y201.624 E.71754
G1 X54.501 Y201.624 E.01576
G1 X54.501 Y201.112 E.01576
G1 X37.999 Y184.611 E.71754
G1 X37.999 Y184.077 E.01641
G1 X54.501 Y200.578 E.71754
G1 X54.501 Y200.045 E.01641
G1 X37.999 Y183.543 E.71754
G1 X37.999 Y183.01 E.01641
G1 X54.501 Y199.511 E.71754
G1 X54.501 Y198.977 E.01641
G1 X37.999 Y182.476 E.71754
G1 X37.999 Y181.942 E.01641
G1 X54.501 Y198.444 E.71754
G1 X54.501 Y197.91 E.01641
G1 X37.999 Y181.409 E.71754
G1 X37.999 Y180.875 E.01641
G1 X54.501 Y197.376 E.71754
G1 X54.501 Y196.843 E.01641
G1 X37.999 Y180.342 E.71754
G1 X37.999 Y179.808 E.01641
G1 X54.501 Y196.309 E.71754
G1 X54.501 Y195.776 E.01641
G1 X37.999 Y179.274 E.71754
G1 X37.999 Y178.741 E.01641
G1 X54.501 Y195.242 E.71754
G1 X54.501 Y194.708 E.01641
G1 X37.999 Y178.207 E.71754
G1 X37.999 Y177.673 E.01641
G1 X54.501 Y194.175 E.71754
G1 X54.501 Y193.641 E.01641
G1 X37.999 Y177.14 E.71754
G1 X37.999 Y176.606 E.01641
G1 X54.501 Y193.107 E.71754
G1 X54.501 Y192.574 E.01641
G1 X37.999 Y176.073 E.71754
G1 X37.999 Y175.539 E.01641
G1 X54.501 Y192.04 E.71754
G1 X54.501 Y191.507 E.01641
G1 X37.999 Y175.005 E.71754
G1 X37.999 Y174.472 E.01641
G1 X54.501 Y190.973 E.71754
G1 X54.501 Y190.439 E.01641
G1 X37.999 Y173.938 E.71754
G1 X37.999 Y173.404 E.01641
G1 X54.501 Y189.906 E.71754
G1 X54.501 Y189.372 E.01641
G1 X37.999 Y172.871 E.71754
G1 X37.999 Y172.337 E.01641
G1 X54.501 Y188.838 E.71754
G1 X54.501 Y188.305 E.01641
G1 X37.999 Y171.804 E.71754
G1 X37.999 Y171.27 E.01641
G1 X54.501 Y187.771 E.71754
G1 X54.501 Y187.238 E.01641
G1 X37.999 Y170.736 E.71754
G1 X37.999 Y170.203 E.01641
G1 X54.501 Y186.704 E.71754
G1 X54.501 Y186.17 E.01641
G1 X37.999 Y169.669 E.71754
G1 X37.999 Y169.135 E.01641
G1 X54.501 Y185.637 E.71754
G1 X54.501 Y185.103 E.01641
G1 X37.999 Y168.602 E.71754
G1 X37.999 Y168.068 E.01641
G1 X54.501 Y184.569 E.71754
G1 X54.501 Y184.036 E.01641
G1 X37.999 Y167.535 E.71754
G1 X37.999 Y167.001 E.01641
G1 X54.501 Y183.502 E.71754
G1 X54.501 Y182.969 E.01641
G1 X37.999 Y166.467 E.71754
G1 X37.999 Y165.934 E.01641
G1 X54.501 Y182.435 E.71754
G1 X54.501 Y181.901 E.01641
G1 X37.999 Y165.4 E.71754
G1 X37.999 Y164.866 E.01641
G1 X54.501 Y181.368 E.71754
G1 X54.501 Y180.834 E.01641
G1 X37.999 Y164.333 E.71754
G1 X37.999 Y163.799 E.01641
G1 X54.501 Y180.3 E.71754
G1 X54.501 Y179.767 E.01641
G1 X37.999 Y163.266 E.71754
G1 X37.999 Y162.732 E.01641
G1 X54.501 Y179.233 E.71754
G1 X54.501 Y178.7 E.01641
G1 X37.999 Y162.198 E.71754
G1 X37.999 Y161.665 E.01641
G1 X54.501 Y178.166 E.71754
G1 X54.501 Y177.632 E.01641
G1 X37.999 Y161.131 E.71754
G1 X37.999 Y160.597 E.01641
G1 X54.501 Y177.099 E.71754
G1 X54.501 Y176.565 E.01641
G1 X37.999 Y160.064 E.71754
G1 X37.999 Y159.53 E.01641
G1 X54.501 Y176.031 E.71754
G1 X54.501 Y175.498 E.01641
G1 X37.999 Y158.997 E.71754
G1 X37.999 Y158.463 E.01641
G1 X54.501 Y174.964 E.71754
G1 X54.501 Y174.431 E.01641
G1 X37.999 Y157.929 E.71754
G1 X37.999 Y157.396 E.01641
G1 X54.501 Y173.897 E.71754
G1 X54.501 Y173.363 E.01641
G1 X37.999 Y156.862 E.71754
G1 X37.999 Y156.328 E.01641
G1 X54.501 Y172.83 E.71754
G1 X54.501 Y172.296 E.01641
G1 X37.999 Y155.795 E.71754
G1 X37.999 Y155.261 E.01641
G1 X54.501 Y171.762 E.71754
G1 X54.501 Y171.229 E.01641
G1 X37.999 Y154.728 E.71754
G1 X37.999 Y154.194 E.01641
G1 X54.501 Y170.695 E.71754
G1 X54.501 Y170.162 E.01641
G1 X37.999 Y153.66 E.71754
G1 X37.999 Y153.127 E.01641
G1 X54.501 Y169.628 E.71754
G1 X54.501 Y169.094 E.01641
G1 X37.999 Y152.593 E.71754
G1 X37.999 Y152.059 E.01641
G1 X54.501 Y168.561 E.71754
G1 X54.501 Y168.027 E.01641
G1 X37.999 Y151.526 E.71754
G1 X37.999 Y150.992 E.01641
G1 X54.501 Y167.493 E.71754
G1 X54.501 Y166.96 E.01641
G1 X37.999 Y150.458 E.71754
G1 X37.999 Y149.925 E.01641
G1 X54.501 Y166.426 E.71754
G1 X54.501 Y165.893 E.01641
G1 X37.999 Y149.391 E.71754
G1 X37.999 Y148.858 E.01641
G1 X54.501 Y165.359 E.71754
G1 X54.501 Y164.825 E.01641
G1 X37.999 Y148.324 E.71754
G1 X37.999 Y147.79 E.01641
G1 X54.501 Y164.292 E.71754
G1 X54.501 Y163.758 E.01641
G1 X37.999 Y147.257 E.71754
G1 X37.999 Y146.723 E.01641
G1 X54.501 Y163.224 E.71754
G1 X54.501 Y162.691 E.01641
G1 X37.999 Y146.189 E.71754
G1 X37.999 Y145.656 E.01641
G1 X54.501 Y162.157 E.71754
G1 X54.501 Y161.624 E.01641
G1 X37.999 Y145.122 E.71754
G1 X37.999 Y144.589 E.01641
G1 X54.501 Y161.09 E.71754
G1 X54.501 Y160.556 E.01641
G1 X37.999 Y144.055 E.71754
G1 X37.999 Y143.521 E.01641
G1 X54.501 Y160.023 E.71754
G1 X54.501 Y159.489 E.01641
G1 X37.999 Y142.988 E.71754
G1 X37.999 Y142.454 E.01641
G1 X54.501 Y158.955 E.71754
G1 X54.501 Y158.422 E.01641
G1 X37.999 Y141.92 E.71754
G1 X37.999 Y141.387 E.01641
G1 X54.501 Y157.888 E.71754
G1 X54.501 Y157.355 E.01641
G1 X37.999 Y140.853 E.71754
G1 X37.999 Y140.32 E.01641
G1 X54.501 Y156.821 E.71754
G1 X54.501 Y156.287 E.01641
G1 X37.999 Y139.786 E.71754
G1 X37.999 Y139.252 E.01641
G1 X54.501 Y155.754 E.71754
G1 X54.501 Y155.22 E.01641
G1 X37.999 Y138.719 E.71754
G1 X37.999 Y138.185 E.01641
G1 X54.501 Y154.686 E.71754
G1 X54.501 Y154.153 E.01641
G1 X37.999 Y137.651 E.71754
G1 X37.999 Y137.118 E.01641
G1 X54.501 Y153.619 E.71754
G1 X54.501 Y153.086 E.01641
G1 X37.999 Y136.584 E.71754
G1 X37.999 Y136.051 E.01641
G1 X54.501 Y152.552 E.71754
G1 X54.501 Y152.018 E.01641
G1 X37.999 Y135.517 E.71754
G1 X37.999 Y134.983 E.01641
G1 X54.501 Y151.485 E.71754
G1 X54.501 Y150.951 E.01641
G1 X37.999 Y134.45 E.71754
G1 X37.999 Y133.916 E.01641
G1 X54.501 Y150.417 E.71754
G1 X54.501 Y149.884 E.01641
G1 X37.999 Y133.382 E.71754
G1 X37.999 Y132.849 E.01641
G1 X54.501 Y149.35 E.71754
G1 X54.501 Y148.817 E.01641
G1 X37.999 Y132.315 E.71754
G1 X37.999 Y131.782 E.01641
G1 X54.501 Y148.283 E.71754
G1 X54.501 Y147.749 E.01641
G1 X37.999 Y131.248 E.71754
G1 X37.999 Y130.714 E.01641
G1 X54.501 Y147.216 E.71754
G1 X54.501 Y146.682 E.01641
G1 X37.999 Y130.181 E.71754
G1 X37.999 Y129.647 E.01641
G1 X54.501 Y146.148 E.71754
G1 X54.501 Y145.615 E.01641
G1 X37.999 Y129.113 E.71754
G1 X37.999 Y128.58 E.01641
G1 X54.501 Y145.081 E.71754
G1 X54.501 Y144.548 E.01641
G1 X37.999 Y128.046 E.71754
G1 X37.999 Y127.513 E.01641
G1 X54.501 Y144.014 E.71754
G1 X54.501 Y143.48 E.01641
G1 X37.999 Y126.979 E.71754
G1 X37.999 Y126.445 E.01641
G1 X54.501 Y142.947 E.71754
G1 X54.501 Y142.413 E.01641
G1 X37.999 Y125.912 E.71754
G1 X37.999 Y125.378 E.01641
G1 X54.501 Y141.879 E.71754
G1 X54.501 Y141.346 E.01641
G1 X37.999 Y124.844 E.71754
G1 X37.999 Y124.311 E.01641
G1 X54.501 Y140.812 E.71754
G1 X54.501 Y140.279 E.01641
G1 X37.999 Y123.777 E.71754
G1 X37.999 Y123.244 E.01641
G1 X54.67 Y139.915 E.72491
; WIPE_START
G1 X53.256 Y138.5 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X49.313 Y131.965 Z3 F30000
G1 X37.83 Y112.935 Z3
G1 Z2.6
G1 E.8 F1800
G1 F15000
G1 X47.622 Y122.728 E.42582
G2 X46.863 Y122.502 I-1.124 J2.392 E.02445
G1 X37.999 Y113.638 E.38542
G1 X37.999 Y114.172 E.01641
G1 X46.285 Y122.458 E.36029
G2 X45.776 Y122.482 I-.083 J3.641 E.0157
G1 X37.999 Y114.706 E.33814
G1 X37.999 Y115.239 E.01641
G1 X45.333 Y122.573 E.3189
G2 X44.933 Y122.706 I.466 J2.066 E.01299
G1 X37.999 Y115.773 E.3015
G1 X37.999 Y116.306 E.01641
G1 X44.569 Y122.876 E.28566
G2 X44.237 Y123.078 I.842 J1.76 E.01196
G1 X37.999 Y116.84 E.27123
G1 X37.999 Y117.374 E.01641
G1 X43.935 Y123.309 E.2581
G2 X43.662 Y123.57 I1.165 J1.497 E.01162
G1 X37.999 Y117.907 E.24622
G1 X37.999 Y118.441 E.01641
G1 X43.417 Y123.859 E.23558
G2 X43.203 Y124.178 I1.488 J1.227 E.01185
G1 X37.999 Y118.975 E.22628
G1 X37.999 Y119.508 E.01641
G1 X43.021 Y124.529 E.21834
G2 X42.873 Y124.915 I1.852 J.931 E.01272
G1 X37.999 Y120.042 E.21191
G1 X37.999 Y120.575 E.01641
G1 X42.764 Y125.341 E.2072
G2 X42.704 Y125.814 I2.333 J.539 E.01469
G1 X37.999 Y121.109 E.20457
G1 X37.999 Y121.643 E.01641
G1 X42.722 Y126.365 E.20534
G2 X42.857 Y127.034 I3.534 J-.366 E.02101
G1 X37.999 Y122.176 E.21122
G1 X37.999 Y122.71 E.01641
G1 X54.501 Y139.211 E.71754
G1 X54.501 Y138.678 E.01641
G1 X45.217 Y129.394 E.40367
G2 X45.886 Y129.53 I1.093 J-3.678 E.02102
G1 X54.501 Y138.144 E.37458
G1 X54.501 Y137.61 E.01641
G1 X46.434 Y129.544 E.35077
G2 X46.911 Y129.487 I-.302 J-4.619 E.01479
G1 X54.501 Y137.077 E.33001
G1 X54.501 Y136.543 E.01641
G1 X47.335 Y129.377 E.31159
G2 X47.72 Y129.228 I-.554 J-2 E.0127
G1 X54.501 Y136.01 E.29487
G1 X54.501 Y135.476 E.01641
G1 X48.07 Y129.045 E.27963
G2 X48.389 Y128.831 I-.911 J-1.701 E.01184
G1 X54.501 Y134.942 E.26575
G1 X54.501 Y134.409 E.01641
G1 X48.679 Y128.587 E.25314
G2 X48.941 Y128.315 I-1.227 J-1.441 E.01162
G1 X54.501 Y133.875 E.24177
G1 X54.501 Y133.341 E.01641
G1 X49.174 Y128.015 E.23163
G2 X49.376 Y127.683 I-9.214 J-5.86 E.01194
G1 X54.501 Y132.808 E.22283
G1 X54.501 Y132.274 E.01641
G1 X49.545 Y127.318 E.21549
G2 X49.677 Y126.917 I-1.943 J-.861 E.01302
G1 X54.501 Y131.741 E.20975
G1 X54.501 Y131.207 E.01641
G1 X49.766 Y126.472 E.20588
G2 X49.8 Y125.973 I-4.653 J-.57 E.0154
G1 X54.501 Y130.673 E.20439
G1 X54.501 Y130.14 E.01641
G1 X49.744 Y125.383 E.20683
G2 X49.527 Y124.632 I-3.897 J.72 E.02407
G1 X54.501 Y129.606 E.21627
G1 X54.501 Y129.072 E.01641
G1 X37.999 Y112.571 E.71754
G1 X37.999 Y112.037 E.01641
G1 X54.501 Y128.539 E.71754
G1 X54.501 Y128.005 E.01641
G1 X37.999 Y111.504 E.71754
G1 X37.999 Y110.97 E.01641
G1 X54.501 Y127.472 E.71754
G1 X54.501 Y126.938 E.01641
G1 X37.999 Y110.437 E.71754
G1 X37.999 Y109.903 E.01641
G1 X54.501 Y126.404 E.71754
G1 X54.501 Y125.871 E.01641
G1 X37.999 Y109.369 E.71754
G1 X37.999 Y108.836 E.01641
G1 X54.501 Y125.337 E.71754
G1 X54.501 Y124.803 E.01641
G1 X37.999 Y108.302 E.71754
G1 X37.999 Y107.768 E.01641
G1 X54.501 Y124.27 E.71754
G1 X54.501 Y123.736 E.01641
G1 X37.999 Y107.235 E.71754
G1 X37.999 Y106.701 E.01641
G1 X54.501 Y123.203 E.71754
G1 X54.501 Y122.669 E.01641
G1 X37.999 Y106.168 E.71754
G1 X37.999 Y105.634 E.01641
G1 X54.501 Y122.135 E.71754
G1 X54.501 Y121.602 E.01641
G1 X37.999 Y105.1 E.71754
G1 X37.999 Y104.567 E.01641
G1 X54.501 Y121.068 E.71754
G1 X54.501 Y120.534 E.01641
G1 X37.999 Y104.033 E.71754
G1 X37.999 Y103.499 E.01641
G1 X54.501 Y120.001 E.71754
G1 X54.501 Y119.467 E.01641
G1 X37.999 Y102.966 E.71754
G1 X37.999 Y102.432 E.01641
G1 X54.501 Y118.934 E.71754
G1 X54.501 Y118.4 E.01641
G1 X37.999 Y101.899 E.71754
G1 X37.999 Y101.365 E.01641
G1 X54.501 Y117.866 E.71754
G1 X54.501 Y117.333 E.01641
G1 X37.999 Y100.831 E.71754
G1 X37.999 Y100.298 E.01641
G1 X54.501 Y116.799 E.71754
G1 X54.501 Y116.265 E.01641
G1 X37.999 Y99.764 E.71754
G1 X37.999 Y99.23 E.01641
G1 X54.501 Y115.732 E.71754
G1 X54.501 Y115.198 E.01641
G1 X37.999 Y98.697 E.71754
G1 X37.999 Y98.163 E.01641
G1 X54.501 Y114.665 E.71754
G1 X54.501 Y114.131 E.01641
G1 X37.999 Y97.63 E.71754
G1 X37.999 Y97.096 E.01641
G1 X54.501 Y113.597 E.71754
G1 X54.501 Y113.064 E.01641
G1 X37.999 Y96.562 E.71754
G1 X37.999 Y96.029 E.01641
G1 X54.501 Y112.53 E.71754
G1 X54.501 Y111.996 E.01641
G1 X37.999 Y95.495 E.71754
G1 X37.999 Y94.961 E.01641
G1 X54.501 Y111.463 E.71754
G1 X54.501 Y110.929 E.01641
G1 X37.999 Y94.428 E.71754
G1 X37.999 Y93.894 E.01641
G1 X54.501 Y110.395 E.71754
G1 X54.501 Y109.862 E.01641
G1 X37.999 Y93.361 E.71754
G1 X37.999 Y92.827 E.01641
G1 X54.501 Y109.328 E.71754
G1 X54.501 Y108.795 E.01641
G1 X37.999 Y92.293 E.71754
G1 X37.999 Y91.76 E.01641
G1 X54.501 Y108.261 E.71754
G1 X54.501 Y107.727 E.01641
G1 X37.999 Y91.226 E.71754
G1 X37.999 Y90.692 E.01641
G1 X54.501 Y107.194 E.71754
G1 X54.501 Y106.66 E.01641
G1 X37.999 Y90.159 E.71754
G1 X37.999 Y89.625 E.01641
G1 X54.501 Y106.126 E.71754
G1 X54.501 Y105.593 E.01641
G1 X37.999 Y89.092 E.71754
G1 X37.999 Y88.558 E.01641
G1 X54.501 Y105.059 E.71754
G1 X54.501 Y104.526 E.01641
G1 X37.999 Y88.024 E.71754
G1 X37.999 Y87.491 E.01641
G1 X54.501 Y103.992 E.71754
G1 X54.501 Y103.458 E.01641
G1 X37.999 Y86.957 E.71754
G1 X37.999 Y86.423 E.01641
G1 X54.501 Y102.925 E.71754
G1 X54.501 Y102.391 E.01641
G1 X37.999 Y85.89 E.71754
G1 X37.999 Y85.356 E.01641
G1 X54.501 Y101.857 E.71754
G1 X54.501 Y101.324 E.01641
G1 X37.999 Y84.823 E.71754
G1 X37.999 Y84.289 E.01641
G1 X54.501 Y100.79 E.71754
G1 X54.501 Y100.257 E.01641
G1 X37.999 Y83.755 E.71754
G1 X37.999 Y83.222 E.01641
G1 X54.501 Y99.723 E.71754
G1 X54.501 Y99.189 E.01641
G1 X37.999 Y82.688 E.71754
G1 X37.999 Y82.154 E.01641
G1 X54.501 Y98.656 E.71754
G1 X54.501 Y98.122 E.01641
G1 X37.999 Y81.621 E.71754
G1 X37.999 Y81.087 E.01641
G1 X54.501 Y97.588 E.71754
G1 X54.501 Y97.055 E.01641
G1 X37.999 Y80.554 E.71754
G1 X37.999 Y80.02 E.01641
G1 X54.501 Y96.521 E.71754
G1 X54.501 Y95.988 E.01641
G1 X37.999 Y79.486 E.71754
G1 X37.999 Y78.953 E.01641
G1 X54.501 Y95.454 E.71754
G1 X54.501 Y94.92 E.01641
G1 X37.999 Y78.419 E.71754
G1 X37.999 Y77.885 E.01641
G1 X54.501 Y94.387 E.71754
G1 X54.501 Y93.853 E.01641
G1 X37.999 Y77.352 E.71754
G1 X37.999 Y76.818 E.01641
G1 X54.501 Y93.319 E.71754
G1 X54.501 Y92.786 E.01641
G1 X37.999 Y76.285 E.71754
G1 X37.999 Y75.751 E.01641
G1 X54.501 Y92.252 E.71754
G1 X54.501 Y91.719 E.01641
G1 X37.999 Y75.217 E.71754
G1 X37.999 Y74.684 E.01641
G1 X54.501 Y91.185 E.71754
G1 X54.501 Y90.651 E.01641
G1 X37.999 Y74.15 E.71754
G1 X37.999 Y73.616 E.01641
G1 X54.501 Y90.118 E.71754
G1 X54.501 Y89.584 E.01641
G1 X37.999 Y73.083 E.71754
G1 X37.999 Y72.549 E.01641
G1 X54.501 Y89.05 E.71754
G1 X54.501 Y88.517 E.01641
G1 X37.999 Y72.016 E.71754
G1 X37.999 Y71.482 E.01641
G1 X54.501 Y87.983 E.71754
G1 X54.501 Y87.45 E.01641
G1 X37.999 Y70.948 E.71754
G1 X37.999 Y70.415 E.01641
G1 X54.501 Y86.916 E.71754
G1 X54.501 Y86.382 E.01641
G1 X37.999 Y69.881 E.71754
G1 X37.999 Y69.347 E.01641
G1 X54.501 Y85.849 E.71754
G1 X54.501 Y85.315 E.01641
G1 X37.999 Y68.814 E.71754
G1 X37.999 Y68.28 E.01641
G1 X54.501 Y84.781 E.71754
G1 X54.501 Y84.248 E.01641
G1 X37.999 Y67.747 E.71754
G1 X37.999 Y67.213 E.01641
G1 X54.501 Y83.714 E.71754
G1 X54.501 Y83.181 E.01641
G1 X37.999 Y66.679 E.71754
G1 X37.999 Y66.146 E.01641
G1 X54.501 Y82.647 E.71754
G1 X54.501 Y82.113 E.01641
G1 X37.999 Y65.612 E.71754
G1 X37.999 Y65.078 E.01641
G1 X54.501 Y81.58 E.71754
G1 X54.501 Y81.046 E.01641
G1 X37.999 Y64.545 E.71754
G1 X37.999 Y64.011 E.01641
G1 X54.501 Y80.512 E.71754
G1 X54.501 Y79.979 E.01641
G1 X37.999 Y63.478 E.71754
G1 X37.999 Y62.944 E.01641
G1 X54.501 Y79.445 E.71754
G1 X54.501 Y78.912 E.01641
G1 X37.999 Y62.41 E.71754
G1 X37.999 Y61.877 E.01641
G1 X54.501 Y78.378 E.71754
G1 X54.501 Y77.844 E.01641
G1 X37.999 Y61.343 E.71754
G1 X37.999 Y60.809 E.01641
G1 X54.501 Y77.311 E.71754
G1 X54.501 Y76.777 E.01641
G1 X37.999 Y60.276 E.71754
G1 X37.999 Y59.742 E.01641
G1 X54.501 Y76.243 E.71754
G1 X54.501 Y75.71 E.01641
G1 X37.999 Y59.209 E.71754
G1 X37.999 Y58.675 E.01641
G1 X54.501 Y75.176 E.71754
G1 X54.501 Y74.643 E.01641
G1 X37.999 Y58.141 E.71754
G1 X37.999 Y57.608 E.01641
G1 X54.501 Y74.109 E.71754
G1 X54.501 Y73.575 E.01641
G1 X37.999 Y57.074 E.71754
G1 X37.999 Y56.54 E.01641
G1 X54.501 Y73.042 E.71754
G1 X54.501 Y72.508 E.01641
G1 X37.999 Y56.007 E.71754
G1 X37.999 Y55.473 E.01641
G1 X54.501 Y71.974 E.71754
G1 X54.501 Y71.441 E.01641
G1 X37.999 Y54.94 E.71754
G1 X37.999 Y54.406 E.01641
G1 X54.501 Y70.907 E.71754
G1 X54.501 Y70.374 E.01641
G1 X37.999 Y53.872 E.71754
G1 X37.999 Y53.339 E.01641
G1 X54.501 Y69.84 E.71754
G1 X54.501 Y69.306 E.01641
G1 X37.999 Y52.805 E.71754
G1 X37.999 Y52.271 E.01641
G1 X54.501 Y68.773 E.71754
G1 X54.501 Y68.239 E.01641
G1 X37.999 Y51.738 E.71754
G1 X37.999 Y51.204 E.01641
G1 X54.501 Y67.705 E.71754
M73 P81 R11
G1 X54.501 Y67.172 E.01641
G1 X37.999 Y50.671 E.71754
G1 X37.999 Y50.137 E.01641
G1 X54.501 Y66.638 E.71754
G1 X54.501 Y66.105 E.01641
G1 X37.999 Y49.603 E.71754
G1 X37.999 Y49.07 E.01641
G1 X54.501 Y65.571 E.71754
G1 X54.501 Y65.037 E.01641
G1 X37.999 Y48.536 E.71754
G1 X37.999 Y48.002 E.01641
G1 X54.501 Y64.504 E.71754
G1 X54.501 Y63.97 E.01641
G1 X37.999 Y47.469 E.71754
G1 X37.999 Y46.935 E.01641
G1 X54.501 Y63.436 E.71754
G1 X54.501 Y62.903 E.01641
G1 X37.999 Y46.402 E.71754
G1 X37.999 Y45.868 E.01641
G1 X54.501 Y62.369 E.71754
G1 X54.501 Y61.836 E.01641
G1 X37.999 Y45.334 E.71754
G1 X37.999 Y44.801 E.01641
G1 X54.501 Y61.302 E.71754
G1 X54.501 Y60.768 E.01641
G1 X37.999 Y44.267 E.71754
G1 X37.999 Y43.733 E.01641
G1 X54.501 Y60.235 E.71754
G1 X54.501 Y59.701 E.01641
G1 X37.999 Y43.2 E.71754
G1 X37.999 Y42.666 E.01641
G1 X54.501 Y59.167 E.71754
G1 X54.501 Y58.634 E.01641
G1 X37.999 Y42.133 E.71754
G1 X37.999 Y41.599 E.01641
G1 X54.501 Y58.1 E.71754
G1 X54.501 Y57.567 E.01641
G1 X37.999 Y41.065 E.71754
G1 X37.999 Y40.532 E.01641
G1 X54.501 Y57.033 E.71754
G1 X54.501 Y56.499 E.01641
G1 X37.999 Y39.998 E.71754
G1 X37.999 Y39.464 E.01641
G1 X54.67 Y56.135 E.72491
; WIPE_START
G1 X53.256 Y54.721 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X59.219 Y50.545 Z3 F30000
G1 Z2.6
G1 E.8 F1800
G1 F15000
G1 X49.582 Y40.908 E.41906
G3 X49.761 Y41.621 I-3.336 J1.218 E.02265
G1 X58.516 Y50.376 E.38068
G1 X57.982 Y50.376 E.01641
M73 P81 R10
G1 X49.798 Y42.192 E.35587
G3 X49.753 Y42.681 I-2.471 J.02 E.01512
G1 X57.449 Y50.376 E.33461
G1 X56.915 Y50.376 E.01641
G1 X49.657 Y43.118 E.31558
G3 X49.519 Y43.513 I-6.962 J-2.226 E.01287
G1 X56.381 Y50.376 E.29841
G1 X55.848 Y50.376 E.01641
G1 X49.341 Y43.869 E.28293
G3 X49.133 Y44.194 I-1.728 J-.88 E.01189
G1 X55.314 Y50.376 E.26879
G1 X54.78 Y50.376 E.01641
G1 X48.895 Y44.49 E.25594
G3 X48.628 Y44.757 I-1.468 J-1.197 E.01162
G1 X54.501 Y50.629 E.25535
G1 X54.501 Y51.163 E.01641
G1 X48.333 Y44.996 E.26817
G3 X48.009 Y45.205 I-1.207 J-1.513 E.01189
G1 X54.501 Y51.697 E.28227
G1 X54.501 Y52.23 E.01641
G1 X47.654 Y45.383 E.29774
G3 X47.263 Y45.527 I-.912 J-1.88 E.01281
G1 X54.501 Y52.764 E.31471
G1 X54.501 Y53.298 E.01641
G1 X46.83 Y45.627 E.33354
G3 X46.34 Y45.671 I-.464 J-2.427 E.01515
G1 X54.501 Y53.831 E.35484
G1 X54.501 Y54.365 E.01641
G1 X45.78 Y45.644 E.37922
G3 X45.078 Y45.475 I.643 J-4.224 E.02223
G1 X54.501 Y54.898 E.40975
G1 X54.501 Y55.432 E.01641
G1 X37.999 Y38.931 E.71754
G1 X37.999 Y38.397 E.01641
G1 X42.9 Y43.297 E.21308
G3 X42.732 Y42.597 I3.886 J-1.298 E.02218
G1 X37.999 Y37.864 E.20581
G1 X37.999 Y37.33 E.01641
G1 X42.703 Y42.033 E.20453
G3 X42.748 Y41.545 I4.466 J.17 E.01508
G1 X37.999 Y36.796 E.2065
G1 X37.999 Y36.263 E.01641
G1 X42.85 Y41.113 E.21092
G3 X42.992 Y40.722 I2.033 J.516 E.01283
G1 X37.999 Y35.729 E.2171
G1 X37.999 Y35.195 E.01641
G1 X43.169 Y40.365 E.22481
G3 X43.378 Y40.041 I1.728 J.881 E.01189
G1 X37.999 Y34.662 E.23389
G1 X37.999 Y34.128 E.01641
G1 X43.616 Y39.745 E.24425
G3 X43.883 Y39.478 I1.465 J1.199 E.01162
G1 X38.279 Y33.874 E.24369
G1 X38.813 Y33.874 E.01641
G1 X44.179 Y39.24 E.23333
G3 X44.505 Y39.033 I1.2 J1.533 E.01191
G1 X39.346 Y33.874 E.22433
G1 X39.88 Y33.874 E.01641
G1 X44.864 Y38.858 E.21672
G3 X45.258 Y38.719 I.894 J1.903 E.01288
G1 X40.414 Y33.874 E.21067
G1 X40.947 Y33.874 E.01641
G1 X45.694 Y38.621 E.20641
G3 X46.189 Y38.583 I.469 J2.813 E.01529
G1 X41.481 Y33.874 E.20473
G1 X42.015 Y33.874 E.01641
G1 X46.753 Y38.613 E.20606
G3 X47.465 Y38.791 I-.54 J3.669 E.02259
G1 X42.548 Y33.874 E.2138
G1 X43.082 Y33.874 E.01641
G1 X59.583 Y50.376 E.71754
G1 X60.117 Y50.376 E.01641
G1 X43.615 Y33.874 E.71754
G1 X44.149 Y33.874 E.01641
G1 X60.65 Y50.376 E.71754
G1 X61.184 Y50.376 E.01641
G1 X44.683 Y33.874 E.71754
G1 X45.216 Y33.874 E.01641
G1 X61.718 Y50.376 E.71754
G1 X62.251 Y50.376 E.01641
G1 X45.75 Y33.874 E.71754
G1 X46.284 Y33.874 E.01641
G1 X62.785 Y50.376 E.71754
G1 X63.318 Y50.376 E.01641
G1 X46.817 Y33.874 E.71754
G1 X47.351 Y33.874 E.01641
G1 X63.852 Y50.376 E.71754
G1 X64.386 Y50.376 E.01641
G1 X47.884 Y33.874 E.71754
G1 X48.418 Y33.874 E.01641
G1 X64.919 Y50.376 E.71754
G1 X65.453 Y50.376 E.01641
G1 X48.952 Y33.874 E.71754
G1 X49.485 Y33.874 E.01641
G1 X65.987 Y50.376 E.71754
G1 X66.52 Y50.376 E.01641
G1 X50.019 Y33.874 E.71754
G1 X50.553 Y33.874 E.01641
G1 X67.054 Y50.376 E.71754
G1 X67.587 Y50.376 E.01641
G1 X51.086 Y33.874 E.71754
G1 X51.62 Y33.874 E.01641
G1 X68.121 Y50.376 E.71754
G1 X68.655 Y50.376 E.01641
G1 X52.153 Y33.874 E.71754
G1 X52.687 Y33.874 E.01641
G1 X69.188 Y50.376 E.71754
G1 X69.722 Y50.376 E.01641
G1 X53.221 Y33.874 E.71754
G1 X53.754 Y33.874 E.01641
G1 X70.256 Y50.376 E.71754
G1 X70.789 Y50.376 E.01641
G1 X54.288 Y33.874 E.71754
G1 X54.822 Y33.874 E.01641
G1 X71.323 Y50.376 E.71754
G1 X71.856 Y50.376 E.01641
G1 X55.355 Y33.874 E.71754
G1 X55.889 Y33.874 E.01641
G1 X72.39 Y50.376 E.71754
G1 X72.924 Y50.376 E.01641
G1 X56.422 Y33.874 E.71754
G1 X56.956 Y33.874 E.01641
G1 X73.457 Y50.376 E.71754
G1 X73.991 Y50.376 E.01641
G1 X57.49 Y33.874 E.71754
G1 X58.023 Y33.874 E.01641
G1 X74.525 Y50.376 E.71754
G1 X75.058 Y50.376 E.01641
G1 X58.557 Y33.874 E.71754
G1 X59.091 Y33.874 E.01641
G1 X75.592 Y50.376 E.71754
G1 X76.125 Y50.376 E.01641
G1 X59.624 Y33.874 E.71754
G1 X60.158 Y33.874 E.01641
G1 X76.659 Y50.376 E.71754
G1 X77.193 Y50.376 E.01641
G1 X60.691 Y33.874 E.71754
G1 X61.225 Y33.874 E.01641
G1 X77.726 Y50.376 E.71754
G1 X78.26 Y50.376 E.01641
G1 X61.759 Y33.874 E.71754
G1 X62.292 Y33.874 E.01641
G1 X78.794 Y50.376 E.71754
G1 X79.327 Y50.376 E.01641
G1 X62.826 Y33.874 E.71754
G1 X63.36 Y33.874 E.01641
G1 X79.861 Y50.376 E.71754
G1 X80.394 Y50.376 E.01641
G1 X63.893 Y33.874 E.71754
G1 X64.427 Y33.874 E.01641
G1 X80.928 Y50.376 E.71754
G1 X81.462 Y50.376 E.01641
G1 X64.96 Y33.874 E.71754
G1 X65.494 Y33.874 E.01641
G1 X81.995 Y50.376 E.71754
G1 X82.529 Y50.376 E.01641
G1 X66.028 Y33.874 E.71754
G1 X66.561 Y33.874 E.01641
G1 X83.063 Y50.376 E.71754
G1 X83.596 Y50.376 E.01641
G1 X67.095 Y33.874 E.71754
G1 X67.629 Y33.874 E.01641
G1 X84.13 Y50.376 E.71754
G1 X84.663 Y50.376 E.01641
G1 X68.162 Y33.874 E.71754
G1 X68.696 Y33.874 E.01641
G1 X85.197 Y50.376 E.71754
G1 X85.731 Y50.376 E.01641
G1 X69.229 Y33.874 E.71754
G1 X69.763 Y33.874 E.01641
G1 X86.264 Y50.376 E.71754
G1 X86.798 Y50.376 E.01641
G1 X70.297 Y33.874 E.71754
G1 X70.83 Y33.874 E.01641
G1 X87.332 Y50.376 E.71754
G1 X87.865 Y50.376 E.01641
G1 X71.364 Y33.874 E.71754
G1 X71.898 Y33.874 E.01641
G1 X88.399 Y50.376 E.71754
G1 X88.932 Y50.376 E.01641
G1 X72.431 Y33.874 E.71754
G1 X72.965 Y33.874 E.01641
G1 X89.466 Y50.376 E.71754
G1 X90 Y50.376 E.01641
G1 X73.498 Y33.874 E.71754
G1 X74.032 Y33.874 E.01641
G1 X90.533 Y50.376 E.71754
G1 X91.067 Y50.376 E.01641
G1 X74.566 Y33.874 E.71754
G1 X75.099 Y33.874 E.01641
G1 X91.601 Y50.376 E.71754
G1 X92.134 Y50.376 E.01641
G1 X75.633 Y33.874 E.71754
G1 X76.167 Y33.874 E.01641
G1 X92.668 Y50.376 E.71754
G1 X93.201 Y50.376 E.01641
G1 X76.7 Y33.874 E.71754
G1 X77.234 Y33.874 E.01641
G1 X93.735 Y50.376 E.71754
G1 X94.269 Y50.376 E.01641
G1 X77.767 Y33.874 E.71754
G1 X78.301 Y33.874 E.01641
G1 X94.972 Y50.545 E.72491
G1 X100.229 Y37.171 F30000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
M204 S2000
G1 X98.404 Y35.346 E.07929
G1 X97.724 Y35.199
G1 X100.374 Y37.849 E.11513
G1 X100.375 Y38.384
G1 X97.18 Y35.188 E.13886
G1 X96.646 Y35.188
G1 X100.299 Y38.841 E.15874
G1 X100.168 Y39.243
G1 X96.112 Y35.187 E.17622
G1 X95.579 Y35.187
G1 X100.298 Y39.907 E.20509
G1 X100.386 Y40.528
G1 X95.045 Y35.187 E.2321
G1 X94.555 Y35.23
G1 X100.388 Y41.063 E.25346
G1 X100.387 Y41.595
G1 X94 Y35.208 E.27757
G1 X93.447 Y35.188
G1 X100.387 Y42.128 E.30156
G1 X100.345 Y42.62
G1 X92.913 Y35.188 E.32295
G1 X92.38 Y35.188
G1 X100.239 Y43.047 E.34155
G1 X100.084 Y43.425
G1 X91.846 Y35.187 E.35798
G1 X91.312 Y35.187
G1 X99.889 Y43.764 E.37271
G1 X99.656 Y44.064
G1 X90.812 Y35.22 E.38431
G1 X90.378 Y35.319
G1 X99.39 Y44.331 E.39161
G1 X99.088 Y44.562
G1 X89.995 Y35.469 E.39515
G1 X89.653 Y35.66
G1 X98.752 Y44.759 E.39538
G1 X98.373 Y44.914
G1 X89.346 Y35.887 E.39226
G1 X89.076 Y36.15
G1 X97.946 Y45.02 E.38545
G1 X97.456 Y45.063
G1 X88.84 Y36.447 E.37443
G1 X88.638 Y36.779
G1 X96.923 Y45.063 E.35999
G1 X96.389 Y45.063
G1 X88.478 Y37.152 E.34375
G1 X88.366 Y37.573
G1 X95.855 Y45.062 E.32545
G1 X95.322 Y45.062
G1 X88.314 Y38.054 E.30452
G1 X88.313 Y38.587
G1 X94.777 Y45.051 E.28089
G1 X94.203 Y45.009
G1 X88.313 Y39.12 E.25593
G1 X88.313 Y39.653
G1 X93.722 Y45.062 E.23507
G1 X93.19 Y45.063
G1 X88.312 Y40.186 E.21194
G1 X88.312 Y40.719
G1 X92.656 Y45.063 E.18876
G1 X92.122 Y45.062
G1 X88.312 Y41.252 E.16558
G1 X88.312 Y41.785
G1 X91.589 Y45.062 E.1424
G1 X91.05 Y45.056
G1 X88.319 Y42.325 E.11869
G1 X88.439 Y42.979
G1 X90.396 Y44.936 E.08506
M204 S10000
G1 X89.902 Y44.736 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.105517
G1 F15000
G1 X89.783 Y44.646 E.00076
; LINE_WIDTH: 0.140085
G1 X89.669 Y44.556 E.00115
; LINE_WIDTH: 0.182311
G3 X89.443 Y44.363 I3.784 J-4.666 E.00338
; LINE_WIDTH: 0.209908
G3 X88.917 Y43.823 I4.278 J-4.695 E.01026
; LINE_WIDTH: 0.164573
G3 X88.777 Y43.653 I3.818 J-3.286 E.00218
; LINE_WIDTH: 0.130278
G1 X88.718 Y43.578 E.00068
; LINE_WIDTH: 0.10318
G1 X88.64 Y43.474 E.00064
; WIPE_START
G1 X88.718 Y43.578 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X95.864 Y40.896 Z3 F30000
G1 X100.149 Y39.288 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.103036
G1 F15000
G2 X100.15 Y39.465 I.051 J.089 E.00105
G1 X99.971 Y36.618 F30000
; LINE_WIDTH: 0.104083
G1 F15000
G2 X99.859 Y36.479 I-4.81 J3.747 E.00089
; LINE_WIDTH: 0.155022
G2 X99.118 Y35.735 I-4.763 J3.999 E.0096
; LINE_WIDTH: 0.106201
G2 X98.957 Y35.605 I-3.632 J4.34 E.00107
G1 X96.808 Y33.705 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42025
G1 F15000
G1 X98.167 Y35.063 E.05907
G1 X97.837 Y35.004 E.01031
G1 X97.552 Y34.982 E.00878
G1 X96.444 Y33.874 E.04817
G1 X95.911 Y33.874 E.01641
G1 X97.017 Y34.981 E.04811
G1 X96.483 Y34.98 E.01642
G1 X95.377 Y33.874 E.0481
G1 X94.843 Y33.874 E.01641
G1 X95.949 Y34.98 E.04808
G1 X95.415 Y34.98 E.01642
G1 X94.31 Y33.874 E.04806
G1 X93.776 Y33.874 E.01641
G1 X94.886 Y34.984 E.04825
G1 X94.414 Y35.046 E.01463
G1 X93.243 Y33.874 E.05095
G1 X92.709 Y33.874 E.01641
G1 X93.819 Y34.984 E.04827
G1 X93.282 Y34.981 E.01652
G1 X92.175 Y33.874 E.04812
G1 X91.642 Y33.874 E.01641
G1 X92.748 Y34.98 E.0481
G1 X92.214 Y34.98 E.01642
G1 X91.108 Y33.874 E.04808
G1 X90.574 Y33.874 E.01641
G1 X91.68 Y34.98 E.04806
G1 X91.148 Y34.982 E.01635
G1 X90.041 Y33.874 E.04815
G1 X89.507 Y33.874 E.01641
G1 X90.667 Y35.034 E.05042
G1 X90.244 Y35.145 E.01344
G1 X88.974 Y33.874 E.05524
G1 X88.44 Y33.874 E.01641
G1 X89.866 Y35.301 E.06202
G1 X89.527 Y35.495 E.01202
G1 X87.906 Y33.874 E.07048
G1 X87.373 Y33.874 E.01641
G1 X89.22 Y35.722 E.08034
G1 X88.948 Y35.983 E.0116
G1 X86.839 Y33.874 E.09169
G1 X86.305 Y33.874 E.01641
G1 X88.707 Y36.276 E.10442
G1 X88.498 Y36.601 E.01188
G1 X85.772 Y33.874 E.11856
G1 X85.238 Y33.874 E.01641
G1 X88.328 Y36.964 E.13436
G1 X88.198 Y37.368 E.01304
G1 X84.705 Y33.874 E.1519
G1 X84.171 Y33.874 E.01641
G1 X88.119 Y37.822 E.17167
G1 X88.106 Y38.343 E.01602
G1 X83.637 Y33.874 E.19432
G1 X83.104 Y33.874 E.01641
G1 X88.106 Y38.877 E.21751
G1 X88.106 Y39.41 E.0164
G1 X82.57 Y33.874 E.24071
G1 X82.036 Y33.874 E.01641
G1 X88.105 Y39.943 E.2639
G1 X88.105 Y40.477 E.0164
G1 X81.503 Y33.874 E.28709
G1 X80.969 Y33.874 E.01641
G1 X88.105 Y41.01 E.31029
G1 X88.105 Y41.543 E.0164
G1 X80.436 Y33.874 E.33348
G1 X79.902 Y33.874 E.01641
G1 X88.104 Y42.077 E.35667
G1 X88.114 Y42.374 E.00913
G1 X88.151 Y42.657 E.00878
G1 X79.368 Y33.874 E.3819
G1 X78.835 Y33.874 E.01641
G1 X88.386 Y43.426 E.41534
G1 X88.51 Y43.669 E.00837
G1 X88.663 Y43.915 E.00892
G1 X89.023 Y44.346 E.01726
G1 X89.235 Y44.541 E.00885
G1 X89.457 Y44.709 E.00857
G1 X89.697 Y44.86 E.00873
G1 X89.947 Y44.987 E.00863
G1 X95.336 Y50.376 E.23431
G1 X95.87 Y50.376 E.01641
G1 X90.719 Y45.225 E.22395
G1 X91.003 Y45.261 E.0088
G1 X91.296 Y45.269 E.00902
G1 X96.403 Y50.376 E.22206
G1 X96.937 Y50.376 E.01641
G1 X91.83 Y45.269 E.22204
G1 X92.364 Y45.27 E.01642
G1 X97.47 Y50.376 E.22202
G1 X98.004 Y50.376 E.01641
G1 X92.899 Y45.27 E.22201
G1 X93.433 Y45.271 E.01642
G1 X98.538 Y50.376 E.22199
G1 X99.071 Y50.376 E.01641
G1 X93.952 Y45.256 E.22262
G1 X94.348 Y45.191 E.01236
G1 X94.44 Y45.211 E.00289
G1 X99.605 Y50.376 E.22458
G1 X100.139 Y50.376 E.01641
G1 X95.032 Y45.269 E.22206
G1 X95.566 Y45.269 E.01642
G1 X100.672 Y50.376 E.22204
G1 X101.206 Y50.376 E.01641
G1 X96.1 Y45.27 E.22203
G1 X96.634 Y45.27 E.01642
G1 X101.739 Y50.376 E.22201
G1 X102.273 Y50.376 E.01641
G1 X97.168 Y45.27 E.22199
G1 X97.692 Y45.261 E.01612
G1 X102.807 Y50.376 E.2224
G1 X103.34 Y50.376 E.01641
G1 X98.154 Y45.19 E.2255
G1 X98.565 Y45.066 E.01317
G1 X103.874 Y50.376 E.23087
G1 X104.408 Y50.376 E.01641
G1 X98.932 Y44.9 E.23811
G1 X99.261 Y44.696 E.01192
G1 X104.941 Y50.376 E.24699
G1 X105.475 Y50.376 E.01641
G1 X99.558 Y44.459 E.25728
G1 X99.822 Y44.189 E.0116
G1 X106.008 Y50.376 E.26901
G1 X106.542 Y50.376 E.01641
G1 X100.055 Y43.888 E.28209
G1 X100.252 Y43.552 E.01199
G1 X107.076 Y50.376 E.29671
G1 X107.609 Y50.376 E.01641
G1 X100.413 Y43.179 E.31292
G1 X100.529 Y42.761 E.01333
G1 X108.143 Y50.376 E.33109
G1 X108.677 Y50.376 E.01641
G1 X100.59 Y42.289 E.35162
G1 X100.594 Y41.76 E.01629
G1 X109.21 Y50.376 E.37465
G1 X109.744 Y50.376 E.01641
G1 X100.595 Y41.227 E.39783
G1 X100.596 Y40.694 E.01639
G1 X110.277 Y50.376 E.421
G1 X110.811 Y50.376 E.01641
G1 X100.554 Y40.119 E.44601
G1 X100.478 Y39.779 E.01071
G1 X100.339 Y39.37 E.01328
G1 X111.345 Y50.376 E.47858
G1 X111.878 Y50.376 E.01641
G1 X100.477 Y38.975 E.49576
G1 X100.568 Y38.532 E.0139
G1 X112.412 Y50.376 E.51502
G1 X112.946 Y50.376 E.01641
G1 X100.593 Y38.024 E.53712
G1 X100.567 Y37.707 E.00976
G1 X100.513 Y37.409 E.00932
G1 X113.479 Y50.376 E.56383
G1 X114.013 Y50.376 E.01641
G1 X97.512 Y33.874 E.71754
G1 X98.045 Y33.874 E.01641
G1 X114.546 Y50.376 E.71754
G1 X115.08 Y50.376 E.01641
G1 X98.579 Y33.874 E.71754
G1 X99.112 Y33.874 E.01641
G1 X115.614 Y50.376 E.71754
G1 X116.147 Y50.376 E.01641
G1 X99.646 Y33.874 E.71754
G1 X100.18 Y33.874 E.01641
G1 X116.681 Y50.376 E.71754
G1 X117.215 Y50.376 E.01641
G1 X100.713 Y33.874 E.71754
G1 X101.247 Y33.874 E.01641
G1 X117.748 Y50.376 E.71754
G1 X118.282 Y50.376 E.01641
G1 X101.781 Y33.874 E.71754
G1 X102.314 Y33.874 E.01641
G1 X118.815 Y50.376 E.71754
G1 X119.349 Y50.376 E.01641
G1 X102.848 Y33.874 E.71754
G1 X103.381 Y33.874 E.01641
G1 X119.883 Y50.376 E.71754
G1 X120.416 Y50.376 E.01641
G1 X103.915 Y33.874 E.71754
G1 X104.449 Y33.874 E.01641
G1 X120.95 Y50.376 E.71754
G1 X121.484 Y50.376 E.01641
G1 X104.982 Y33.874 E.71754
G1 X105.516 Y33.874 E.01641
G1 X122.017 Y50.376 E.71754
G1 X122.551 Y50.376 E.01641
G1 X106.05 Y33.874 E.71754
G1 X106.583 Y33.874 E.01641
G1 X123.084 Y50.376 E.71754
G1 X123.618 Y50.376 E.01641
G1 X107.117 Y33.874 E.71754
G1 X107.65 Y33.874 E.01641
G1 X124.152 Y50.376 E.71754
G1 X124.685 Y50.376 E.01641
G1 X108.184 Y33.874 E.71754
G1 X108.718 Y33.874 E.01641
G1 X125.219 Y50.376 E.71754
G1 X125.753 Y50.376 E.01641
G1 X109.251 Y33.874 E.71754
G1 X109.785 Y33.874 E.01641
G1 X126.286 Y50.376 E.71754
G1 X126.82 Y50.376 E.01641
G1 X110.319 Y33.874 E.71754
G1 X110.852 Y33.874 E.01641
G1 X127.353 Y50.376 E.71754
G1 X127.887 Y50.376 E.01641
G1 X111.386 Y33.874 E.71754
G1 X111.919 Y33.874 E.01641
G1 X128.421 Y50.376 E.71754
G1 X128.954 Y50.376 E.01641
G1 X112.453 Y33.874 E.71754
G1 X112.987 Y33.874 E.01641
G1 X129.488 Y50.376 E.71754
G1 X130.022 Y50.376 E.01641
G1 X113.52 Y33.874 E.71754
G1 X114.054 Y33.874 E.01641
G1 X130.725 Y50.545 E.72491
; WIPE_START
G1 X129.311 Y49.131 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.836 Y41.911 Z3 F30000
G1 X124.023 Y33.705 Z3
G1 Z2.6
G1 E.8 F1800
G1 F15000
G1 X129.056 Y38.738 E.21886
G2 X128.383 Y38.598 I-1.088 J3.547 E.02118
G1 X123.659 Y33.874 E.20541
G1 X123.126 Y33.874 E.01641
G1 X127.834 Y38.582 E.20472
G2 X127.355 Y38.637 I.12 J3.188 E.01484
G1 X122.592 Y33.874 E.2071
G1 X122.058 Y33.874 E.01641
G1 X126.926 Y38.742 E.21168
G2 X126.539 Y38.888 I.534 J2.008 E.01273
G1 X121.525 Y33.874 E.21803
G1 X120.991 Y33.874 E.01641
G1 X126.189 Y39.072 E.22602
G2 X125.87 Y39.287 I.914 J1.702 E.01184
G1 X120.457 Y33.874 E.23535
G1 X119.924 Y33.874 E.01641
G1 X125.58 Y39.53 E.24595
G2 X125.318 Y39.803 I1.231 J1.446 E.01162
G1 X119.39 Y33.874 E.25778
G1 X118.857 Y33.874 E.01641
G1 X125.085 Y40.103 E.27085
G2 X124.882 Y40.434 I1.546 J1.178 E.01195
G1 X118.323 Y33.874 E.28522
G1 X117.789 Y33.874 E.01641
G1 X124.711 Y40.796 E.30098
G2 X124.575 Y41.194 I1.919 J.876 E.01295
G1 X117.256 Y33.874 E.31828
G1 X116.722 Y33.874 E.01641
G1 X124.484 Y41.636 E.33752
G2 X124.453 Y42.139 I2.495 J.407 E.0155
G1 X116.188 Y33.874 E.35937
G1 X115.655 Y33.874 E.01641
G1 X124.502 Y42.721 E.38469
G2 X124.718 Y43.471 I3.631 J-.642 E.02405
G1 X115.121 Y33.874 E.41731
G1 X114.588 Y33.874 E.01641
G1 X131.089 Y50.376 E.71754
G1 X131.622 Y50.376 E.01641
G1 X126.654 Y45.407 E.21604
G2 X127.402 Y45.621 I1.355 J-3.319 E.02396
G1 X132.156 Y50.376 E.20673
G1 X132.69 Y50.376 E.01641
G1 X127.988 Y45.674 E.20446
G2 X128.487 Y45.639 I.076 J-2.513 E.0154
G1 X133.223 Y50.376 E.20597
G1 X133.757 Y50.376 E.01641
G1 X128.932 Y45.551 E.20981
G2 X129.331 Y45.416 I-1.915 J-6.33 E.01295
G1 X134.291 Y50.376 E.21566
G1 X134.824 Y50.376 E.01641
G1 X129.692 Y45.244 E.22315
G2 X130.022 Y45.04 I-.852 J-1.747 E.01194
G1 X135.358 Y50.376 E.23202
G1 X135.891 Y50.376 E.01641
G1 X130.322 Y44.806 E.24217
G2 X130.594 Y44.544 I-1.172 J-1.487 E.01162
G1 X136.425 Y50.376 E.25356
G1 X136.959 Y50.376 E.01641
G1 X130.837 Y44.254 E.26619
G2 X131.051 Y43.935 I-1.492 J-1.231 E.01185
G1 X137.492 Y50.376 E.28008
G1 X138.026 Y50.376 E.01641
G1 X131.234 Y43.584 E.29532
G2 X131.384 Y43.2 I-1.842 J-.936 E.0127
G1 X138.56 Y50.376 E.31204
G1 X139.093 Y50.376 E.01641
G1 X131.49 Y42.772 E.33063
G2 X131.543 Y42.292 I-2.375 J-.508 E.01488
G1 X139.627 Y50.376 E.35151
G1 X140.16 Y50.376 E.01641
G1 X131.53 Y41.745 E.37529
G2 X131.392 Y41.074 I-5.027 J.682 E.02109
G1 X140.694 Y50.376 E.40448
G1 X141.228 Y50.376 E.01641
G1 X124.726 Y33.874 E.71754
G1 X125.26 Y33.874 E.01641
G1 X141.761 Y50.376 E.71754
G1 X142.295 Y50.376 E.01641
G1 X125.794 Y33.874 E.71754
G1 X126.327 Y33.874 E.01641
G1 X142.829 Y50.376 E.71754
G1 X143.362 Y50.376 E.01641
G1 X126.861 Y33.874 E.71754
G1 X127.395 Y33.874 E.01641
G1 X143.896 Y50.376 E.71754
G1 X144.429 Y50.376 E.01641
G1 X127.928 Y33.874 E.71754
G1 X128.462 Y33.874 E.01641
G1 X144.963 Y50.376 E.71754
G1 X145.497 Y50.376 E.01641
G1 X128.995 Y33.874 E.71754
G1 X129.529 Y33.874 E.01641
G1 X146.03 Y50.376 E.71754
G1 X146.564 Y50.376 E.01641
G1 X130.063 Y33.874 E.71754
G1 X130.596 Y33.874 E.01641
G1 X147.098 Y50.376 E.71754
G1 X147.631 Y50.376 E.01641
G1 X131.13 Y33.874 E.71754
G1 X131.664 Y33.874 E.01641
G1 X148.165 Y50.376 E.71754
G1 X148.698 Y50.376 E.01641
G1 X132.197 Y33.874 E.71754
G1 X132.731 Y33.874 E.01641
G1 X149.232 Y50.376 E.71754
G1 X149.766 Y50.376 E.01641
G1 X133.264 Y33.874 E.71754
G1 X133.798 Y33.874 E.01641
G1 X150.299 Y50.376 E.71754
G1 X150.833 Y50.376 E.01641
G1 X134.332 Y33.874 E.71754
G1 X134.865 Y33.874 E.01641
G1 X151.367 Y50.376 E.71754
G1 X151.9 Y50.376 E.01641
G1 X135.399 Y33.874 E.71754
G1 X135.933 Y33.874 E.01641
G1 X152.434 Y50.376 E.71754
G1 X152.967 Y50.376 E.01641
G1 X136.466 Y33.874 E.71754
G1 X137 Y33.874 E.01641
G1 X153.501 Y50.376 E.71754
G1 X154.035 Y50.376 E.01641
G1 X137.533 Y33.874 E.71754
G1 X138.067 Y33.874 E.01641
G1 X154.568 Y50.376 E.71754
G1 X155.102 Y50.376 E.01641
G1 X138.601 Y33.874 E.71754
G1 X139.134 Y33.874 E.01641
G1 X155.636 Y50.376 E.71754
G1 X156.169 Y50.376 E.01641
G1 X139.668 Y33.874 E.71754
G1 X140.202 Y33.874 E.01641
G1 X156.703 Y50.376 E.71754
G1 X157.236 Y50.376 E.01641
G1 X140.735 Y33.874 E.71754
G1 X141.269 Y33.874 E.01641
G1 X157.77 Y50.376 E.71754
M73 P82 R10
G1 X158.304 Y50.376 E.01641
G1 X141.802 Y33.874 E.71754
G1 X142.336 Y33.874 E.01641
G1 X158.837 Y50.376 E.71754
G1 X159.371 Y50.376 E.01641
G1 X142.87 Y33.874 E.71754
G1 X143.403 Y33.874 E.01641
G1 X159.905 Y50.376 E.71754
G1 X160.438 Y50.376 E.01641
G1 X143.937 Y33.874 E.71754
G1 X144.471 Y33.874 E.01641
G1 X160.972 Y50.376 E.71754
G1 X161.505 Y50.376 E.01641
G1 X145.004 Y33.874 E.71754
G1 X145.538 Y33.874 E.01641
G1 X162.039 Y50.376 E.71754
G1 X162.573 Y50.376 E.01641
G1 X146.071 Y33.874 E.71754
G1 X146.605 Y33.874 E.01641
G1 X163.106 Y50.376 E.71754
G1 X163.64 Y50.376 E.01641
G1 X147.139 Y33.874 E.71754
G1 X147.672 Y33.874 E.01641
G1 X164.174 Y50.376 E.71754
G1 X164.707 Y50.376 E.01641
G1 X148.206 Y33.874 E.71754
G1 X148.74 Y33.874 E.01641
G1 X165.241 Y50.376 E.71754
G1 X165.774 Y50.376 E.01641
G1 X149.273 Y33.874 E.71754
G1 X149.807 Y33.874 E.01641
G1 X166.308 Y50.376 E.71754
G1 X166.842 Y50.376 E.01641
G1 X150.34 Y33.874 E.71754
G1 X150.874 Y33.874 E.01641
G1 X167.375 Y50.376 E.71754
G1 X167.909 Y50.376 E.01641
G1 X151.408 Y33.874 E.71754
G1 X151.941 Y33.874 E.01641
G1 X168.443 Y50.376 E.71754
G1 X168.976 Y50.376 E.01641
G1 X152.475 Y33.874 E.71754
G1 X153.009 Y33.874 E.01641
G1 X169.51 Y50.376 E.71754
G1 X170.043 Y50.376 E.01641
G1 X153.542 Y33.874 E.71754
G1 X154.076 Y33.874 E.01641
G1 X170.577 Y50.376 E.71754
G1 X171.111 Y50.376 E.01641
G1 X154.609 Y33.874 E.71754
G1 X155.143 Y33.874 E.01641
G1 X171.644 Y50.376 E.71754
G1 X172.178 Y50.376 E.01641
G1 X155.677 Y33.874 E.71754
G1 X156.21 Y33.874 E.01641
G1 X172.712 Y50.376 E.71754
G1 X173.245 Y50.376 E.01641
G1 X156.744 Y33.874 E.71754
G1 X157.278 Y33.874 E.01641
G1 X173.779 Y50.376 E.71754
G1 X174.312 Y50.376 E.01641
G1 X157.811 Y33.874 E.71754
G1 X158.345 Y33.874 E.01641
G1 X174.846 Y50.376 E.71754
G1 X175.38 Y50.376 E.01641
G1 X158.878 Y33.874 E.71754
G1 X159.412 Y33.874 E.01641
G1 X175.913 Y50.376 E.71754
G1 X176.447 Y50.376 E.01641
G1 X159.946 Y33.874 E.71754
G1 X160.479 Y33.874 E.01641
G1 X176.981 Y50.376 E.71754
G1 X177.514 Y50.376 E.01641
G1 X161.013 Y33.874 E.71754
G1 X161.547 Y33.874 E.01641
G1 X178.048 Y50.376 E.71754
G1 X178.581 Y50.376 E.01641
G1 X162.08 Y33.874 E.71754
G1 X162.614 Y33.874 E.01641
G1 X179.115 Y50.376 E.71754
G1 X179.649 Y50.376 E.01641
G1 X163.147 Y33.874 E.71754
G1 X163.681 Y33.874 E.01641
G1 X180.182 Y50.376 E.71754
G1 X180.716 Y50.376 E.01641
G1 X164.215 Y33.874 E.71754
G1 X164.748 Y33.874 E.01641
G1 X181.25 Y50.376 E.71754
G1 X181.783 Y50.376 E.01641
G1 X165.282 Y33.874 E.71754
G1 X165.816 Y33.874 E.01641
G1 X182.317 Y50.376 E.71754
G1 X182.85 Y50.376 E.01641
G1 X166.349 Y33.874 E.71754
G1 X166.883 Y33.874 E.01641
G1 X183.384 Y50.376 E.71754
G1 X183.918 Y50.376 E.01641
G1 X167.416 Y33.874 E.71754
G1 X167.95 Y33.874 E.01641
G1 X184.451 Y50.376 E.71754
G1 X184.985 Y50.376 E.01641
G1 X168.484 Y33.874 E.71754
G1 X169.017 Y33.874 E.01641
G1 X185.519 Y50.376 E.71754
G1 X186.052 Y50.376 E.01641
G1 X169.551 Y33.874 E.71754
G1 X170.085 Y33.874 E.01641
G1 X186.586 Y50.376 E.71754
G1 X187.119 Y50.376 E.01641
G1 X170.618 Y33.874 E.71754
G1 X171.152 Y33.874 E.01641
G1 X187.653 Y50.376 E.71754
G1 X188.187 Y50.376 E.01641
G1 X171.685 Y33.874 E.71754
G1 X172.219 Y33.874 E.01641
G1 X188.72 Y50.376 E.71754
G1 X189.254 Y50.376 E.01641
G1 X172.753 Y33.874 E.71754
G1 X173.286 Y33.874 E.01641
G1 X189.788 Y50.376 E.71754
G1 X190.321 Y50.376 E.01641
G1 X173.82 Y33.874 E.71754
G1 X174.354 Y33.874 E.01641
G1 X190.855 Y50.376 E.71754
G1 X191.388 Y50.376 E.01641
G1 X174.887 Y33.874 E.71754
G1 X175.421 Y33.874 E.01641
G1 X191.922 Y50.376 E.71754
G1 X192.456 Y50.376 E.01641
G1 X175.954 Y33.874 E.71754
G1 X176.488 Y33.874 E.01641
G1 X192.989 Y50.376 E.71754
G1 X193.523 Y50.376 E.01641
G1 X177.022 Y33.874 E.71754
G1 X177.555 Y33.874 E.01641
G1 X194.057 Y50.376 E.71754
G1 X194.59 Y50.376 E.01641
G1 X178.089 Y33.874 E.71754
G1 X178.623 Y33.874 E.01641
G1 X195.124 Y50.376 E.71754
G1 X195.657 Y50.376 E.01641
G1 X179.156 Y33.874 E.71754
G1 X179.69 Y33.874 E.01641
G1 X196.191 Y50.376 E.71754
G1 X196.725 Y50.376 E.01641
G1 X180.223 Y33.874 E.71754
G1 X180.757 Y33.874 E.01641
G1 X197.258 Y50.376 E.71754
G1 X197.792 Y50.376 E.01641
G1 X181.291 Y33.874 E.71754
G1 X181.824 Y33.874 E.01641
G1 X198.326 Y50.376 E.71754
G1 X198.859 Y50.376 E.01641
G1 X182.358 Y33.874 E.71754
G1 X182.892 Y33.874 E.01641
G1 X199.393 Y50.376 E.71754
G1 X199.926 Y50.376 E.01641
G1 X183.425 Y33.874 E.71754
G1 X183.959 Y33.874 E.01641
G1 X200.46 Y50.376 E.71754
G1 X200.994 Y50.376 E.01641
G1 X184.492 Y33.874 E.71754
G1 X185.026 Y33.874 E.01641
G1 X218.001 Y66.849 E1.43386
G1 X218.001 Y66.315 E.01641
G1 X185.56 Y33.874 E1.41065
G1 X186.093 Y33.874 E.01641
G1 X218.001 Y65.782 E1.38745
G1 X218.001 Y65.248 E.01641
G1 X186.627 Y33.874 E1.36424
G1 X187.161 Y33.874 E.01641
G1 X218.001 Y64.714 E1.34104
G1 X218.001 Y64.181 E.01641
G1 X187.694 Y33.874 E1.31784
G1 X188.228 Y33.874 E.01641
G1 X218.001 Y63.647 E1.29463
G1 X218.001 Y63.114 E.01641
G1 X188.761 Y33.874 E1.27143
G1 X189.295 Y33.874 E.01641
G1 X218.001 Y62.58 E1.24822
G1 X218.001 Y62.046 E.01641
G1 X189.829 Y33.874 E1.22502
G1 X190.362 Y33.874 E.01641
G1 X218.001 Y61.513 E1.20182
G1 X218.001 Y60.979 E.01641
G1 X190.896 Y33.874 E1.17861
G1 X191.43 Y33.874 E.01641
G1 X218.001 Y60.445 E1.15541
G1 X218.001 Y59.912 E.01641
G1 X191.963 Y33.874 E1.1322
G1 X192.497 Y33.874 E.01641
G1 X218.001 Y59.378 E1.109
G1 X218.001 Y58.845 E.01641
G1 X193.03 Y33.874 E1.0858
G1 X193.564 Y33.874 E.01641
G1 X218.001 Y58.311 E1.06259
G1 X218.001 Y57.777 E.01641
G1 X194.098 Y33.874 E1.03939
G1 X194.631 Y33.874 E.01641
G1 X218.001 Y57.244 E1.01618
G1 X218.001 Y56.71 E.01641
G1 X195.165 Y33.874 E.99298
G1 X195.699 Y33.874 E.01641
G1 X218.17 Y56.346 E.97715
G1 X218.17 Y67.552 F30000
G1 F15000
G1 X201.499 Y50.881 E.72491
G1 X201.499 Y51.415 E.01641
G1 X218.001 Y67.916 E.71754
G1 X218.001 Y68.45 E.01641
G1 X201.499 Y51.949 E.71754
G1 X201.499 Y52.482 E.01641
G1 X218.001 Y68.983 E.71754
G1 X218.001 Y69.517 E.01641
G1 X201.499 Y53.016 E.71754
G1 X201.499 Y53.549 E.01641
G1 X218.001 Y70.051 E.71754
G1 X218.001 Y70.584 E.01641
G1 X201.499 Y54.083 E.71754
G1 X201.499 Y54.617 E.01641
G1 X218.001 Y71.118 E.71754
G1 X218.001 Y71.652 E.01641
G1 X201.499 Y55.15 E.71754
G1 X201.499 Y55.684 E.01641
G1 X218.001 Y72.185 E.71754
G1 X218.001 Y72.719 E.01641
G1 X201.499 Y56.218 E.71754
G1 X201.499 Y56.751 E.01641
G1 X218.001 Y73.252 E.71754
G1 X218.001 Y73.786 E.01641
G1 X201.499 Y57.285 E.71754
G1 X201.499 Y57.818 E.01641
G1 X218.001 Y74.32 E.71754
G1 X218.001 Y74.853 E.01641
G1 X201.499 Y58.352 E.71754
G1 X201.499 Y58.886 E.01641
G1 X218.001 Y75.387 E.71754
G1 X218.001 Y75.921 E.01641
G1 X201.499 Y59.419 E.71754
G1 X201.499 Y59.953 E.01641
G1 X218.001 Y76.454 E.71754
G1 X218.001 Y76.988 E.01641
G1 X201.499 Y60.487 E.71754
G1 X201.499 Y61.02 E.01641
G1 X218.001 Y77.521 E.71754
G1 X218.001 Y78.055 E.01641
G1 X201.499 Y61.554 E.71754
G1 X201.499 Y62.087 E.01641
G1 X218.001 Y78.589 E.71754
G1 X218.001 Y79.122 E.01641
G1 X201.499 Y62.621 E.71754
G1 X201.499 Y63.155 E.01641
G1 X218.001 Y79.656 E.71754
G1 X218.001 Y80.19 E.01641
G1 X201.499 Y63.688 E.71754
G1 X201.499 Y64.222 E.01641
G1 X218.001 Y80.723 E.71754
G1 X218.001 Y81.257 E.01641
G1 X201.499 Y64.756 E.71754
G1 X201.499 Y65.289 E.01641
G1 X218.001 Y81.79 E.71754
G1 X218.001 Y82.324 E.01641
G1 X201.499 Y65.823 E.71754
G1 X201.499 Y66.356 E.01641
G1 X218.001 Y82.858 E.71754
G1 X218.001 Y83.391 E.01641
G1 X201.499 Y66.89 E.71754
G1 X201.499 Y67.424 E.01641
G1 X218.001 Y83.925 E.71754
G1 X218.001 Y84.459 E.01641
G1 X201.499 Y67.957 E.71754
G1 X201.499 Y68.491 E.01641
G1 X218.001 Y84.992 E.71754
G1 X218.001 Y85.526 E.01641
G1 X201.499 Y69.025 E.71754
G1 X201.499 Y69.558 E.01641
G1 X218.001 Y86.059 E.71754
G1 X218.001 Y86.593 E.01641
G1 X201.499 Y70.092 E.71754
G1 X201.499 Y70.625 E.01641
G1 X218.001 Y87.127 E.71754
G1 X218.001 Y87.66 E.01641
G1 X201.499 Y71.159 E.71754
G1 X201.499 Y71.693 E.01641
G1 X218.001 Y88.194 E.71754
G1 X218.001 Y88.728 E.01641
G1 X201.499 Y72.226 E.71754
G1 X201.499 Y72.76 E.01641
G1 X218.001 Y89.261 E.71754
G1 X218.001 Y89.795 E.01641
G1 X201.499 Y73.294 E.71754
G1 X201.499 Y73.827 E.01641
G1 X218.001 Y90.328 E.71754
G1 X218.001 Y90.862 E.01641
G1 X201.499 Y74.361 E.71754
G1 X201.499 Y74.894 E.01641
G1 X218.001 Y91.396 E.71754
G1 X218.001 Y91.929 E.01641
G1 X201.499 Y75.428 E.71754
G1 X201.499 Y75.962 E.01641
G1 X218.001 Y92.463 E.71754
G1 X218.001 Y92.997 E.01641
G1 X201.499 Y76.495 E.71754
G1 X201.499 Y77.029 E.01641
G1 X218.001 Y93.53 E.71754
G1 X218.001 Y94.064 E.01641
G1 X201.499 Y77.563 E.71754
G1 X201.499 Y78.096 E.01641
G1 X218.001 Y94.597 E.71754
G1 X218.001 Y95.131 E.01641
G1 X201.499 Y78.63 E.71754
G1 X201.499 Y79.163 E.01641
G1 X218.001 Y95.665 E.71754
G1 X218.001 Y96.198 E.01641
G1 X201.499 Y79.697 E.71754
G1 X201.499 Y80.231 E.01641
G1 X218.001 Y96.732 E.71754
G1 X218.001 Y97.266 E.01641
G1 X201.499 Y80.764 E.71754
G1 X201.499 Y81.298 E.01641
G1 X218.001 Y97.799 E.71754
G1 X218.001 Y98.333 E.01641
G1 X201.499 Y81.832 E.71754
G1 X201.499 Y82.365 E.01641
G1 X218.001 Y98.866 E.71754
G1 X218.001 Y99.4 E.01641
G1 X201.499 Y82.899 E.71754
G1 X201.499 Y83.432 E.01641
G1 X218.001 Y99.934 E.71754
G1 X218.001 Y100.467 E.01641
G1 X201.499 Y83.966 E.71754
G1 X201.499 Y84.5 E.01641
G1 X218.001 Y101.001 E.71754
G1 X218.001 Y101.535 E.01641
G1 X201.499 Y85.033 E.71754
G1 X201.499 Y85.567 E.01641
G1 X218.001 Y102.068 E.71754
G1 X218.001 Y102.602 E.01641
G1 X201.499 Y86.101 E.71754
G1 X201.499 Y86.634 E.01641
G1 X218.001 Y103.135 E.71754
G1 X218.001 Y103.669 E.01641
G1 X201.499 Y87.168 E.71754
G1 X201.499 Y87.701 E.01641
G1 X218.001 Y104.203 E.71754
G1 X218.001 Y104.736 E.01641
G1 X201.499 Y88.235 E.71754
G1 X201.499 Y88.769 E.01641
G1 X218.001 Y105.27 E.71754
G1 X218.001 Y105.804 E.01641
G1 X201.499 Y89.302 E.71754
G1 X201.499 Y89.836 E.01641
G1 X218.001 Y106.337 E.71754
G1 X218.001 Y106.871 E.01641
G1 X201.499 Y90.37 E.71754
G1 X201.499 Y90.903 E.01641
G1 X218.001 Y107.404 E.71754
G1 X218.001 Y107.938 E.01641
G1 X201.499 Y91.437 E.71754
G1 X201.499 Y91.97 E.01641
G1 X218.001 Y108.472 E.71754
G1 X218.001 Y109.005 E.01641
G1 X201.499 Y92.504 E.71754
G1 X201.499 Y93.038 E.01641
G1 X218.001 Y109.539 E.71754
G1 X218.001 Y110.073 E.01641
G1 X201.499 Y93.571 E.71754
G1 X201.499 Y94.105 E.01641
G1 X218.001 Y110.606 E.71754
G1 X218.001 Y111.14 E.01641
G1 X201.499 Y94.639 E.71754
G1 X201.499 Y95.172 E.01641
G1 X218.001 Y111.673 E.71754
G1 X218.001 Y112.207 E.01641
G1 X201.499 Y95.706 E.71754
G1 X201.499 Y96.239 E.01641
G1 X218.001 Y112.741 E.71754
G1 X218.001 Y113.274 E.01641
G1 X201.499 Y96.773 E.71754
G1 X201.499 Y97.307 E.01641
G1 X218.001 Y113.808 E.71754
G1 X218.001 Y114.342 E.01641
G1 X201.499 Y97.84 E.71754
G1 X201.499 Y98.374 E.01641
G1 X218.001 Y114.875 E.71754
G1 X218.001 Y115.409 E.01641
G1 X201.499 Y98.908 E.71754
G1 X201.499 Y99.441 E.01641
G1 X218.001 Y115.942 E.71754
G1 X218.001 Y116.476 E.01641
G1 X201.499 Y99.975 E.71754
G1 X201.499 Y100.508 E.01641
G1 X218.001 Y117.01 E.71754
G1 X218.001 Y117.543 E.01641
G1 X201.499 Y101.042 E.71754
G1 X201.499 Y101.576 E.01641
G1 X218.001 Y118.077 E.71754
G1 X218.001 Y118.611 E.01641
G1 X201.499 Y102.109 E.71754
G1 X201.499 Y102.643 E.01641
G1 X218.001 Y119.144 E.71754
G1 X218.001 Y119.678 E.01641
G1 X201.499 Y103.177 E.71754
G1 X201.499 Y103.71 E.01641
G1 X218.001 Y120.211 E.71754
G1 X218.001 Y120.745 E.01641
G1 X201.499 Y104.244 E.71754
G1 X201.499 Y104.777 E.01641
G1 X218.001 Y121.279 E.71754
G1 X218.001 Y121.812 E.01641
G1 X201.499 Y105.311 E.71754
G1 X201.499 Y105.845 E.01641
G1 X218.001 Y122.346 E.71754
G1 X218.001 Y122.88 E.01641
G1 X201.499 Y106.378 E.71754
G1 X201.499 Y106.912 E.01641
G1 X218.001 Y123.413 E.71754
G1 X218.001 Y123.947 E.01641
G1 X201.499 Y107.446 E.71754
G1 X201.499 Y107.979 E.01641
G1 X218.001 Y124.48 E.71754
G1 X218.001 Y125.014 E.01641
G1 X201.499 Y108.513 E.71754
M73 P82 R9
G1 X201.499 Y109.046 E.01641
G1 X218.001 Y125.548 E.71754
G1 X218.001 Y126.081 E.01641
G1 X201.499 Y109.58 E.71754
G1 X201.499 Y110.114 E.01641
G1 X218.001 Y126.615 E.71754
G1 X218.001 Y127.149 E.01641
G1 X201.499 Y110.647 E.71754
G1 X201.499 Y111.181 E.01641
G1 X218.001 Y127.682 E.71754
G1 X218.001 Y128.216 E.01641
G1 X201.499 Y111.715 E.71754
G1 X201.499 Y112.248 E.01641
G1 X218.001 Y128.749 E.71754
G1 X218.001 Y129.283 E.01641
G1 X201.499 Y112.782 E.71754
G1 X201.499 Y113.315 E.01641
G1 X210.792 Y122.608 E.40408
G2 X210.122 Y122.472 I-1.089 J3.634 E.02105
G1 X201.499 Y113.849 E.37495
G1 X201.499 Y114.383 E.01641
G1 X209.574 Y122.457 E.35112
G2 X209.096 Y122.513 I.147 J3.322 E.0148
G1 X201.499 Y114.916 E.33035
G1 X201.499 Y115.45 E.01641
G1 X208.669 Y122.619 E.31175
G2 X208.282 Y122.766 I2.556 J7.303 E.01272
G1 X201.499 Y115.984 E.29494
G1 X201.499 Y116.517 E.01641
G1 X207.933 Y122.951 E.27976
G2 X207.615 Y123.166 I.915 J1.697 E.01184
G1 X201.499 Y117.051 E.26591
G1 X201.499 Y117.584 E.01641
G1 X207.325 Y123.41 E.25332
G2 X207.064 Y123.683 I1.233 J1.442 E.01162
G1 X201.499 Y118.118 E.24197
G1 X201.499 Y118.652 E.01641
G1 X206.831 Y123.984 E.23186
G2 X206.629 Y124.315 I1.552 J1.178 E.01195
G1 X201.499 Y119.185 E.22304
G1 X201.499 Y119.719 E.01641
G1 X206.458 Y124.678 E.21562
G2 X206.323 Y125.076 I1.922 J.874 E.01296
G1 X201.499 Y120.253 E.20975
G1 X201.499 Y120.786 E.01641
G1 X206.233 Y125.52 E.20584
G2 X206.203 Y126.023 I2.501 J.403 E.01553
G1 X201.499 Y121.32 E.20453
G1 X201.499 Y121.853 E.01641
G1 X206.254 Y126.608 E.20675
G2 X206.475 Y127.363 I3.592 J-.642 E.02422
G1 X201.499 Y122.387 E.21636
G1 X201.499 Y122.921 E.01641
G1 X218.001 Y139.422 E.71754
G1 X218.001 Y138.888 E.01641
G1 X208.388 Y129.276 E.41797
G2 X209.14 Y129.494 I1.373 J-3.328 E.02412
G1 X218.001 Y138.355 E.38528
G1 X218.001 Y137.821 E.01641
G1 X209.728 Y129.549 E.35971
G2 X210.228 Y129.515 I.081 J-2.516 E.01543
G1 X218.001 Y137.287 E.33798
G1 X218.001 Y136.754 E.01641
G1 X210.674 Y129.427 E.31858
G2 X211.074 Y129.294 I-1.884 J-6.312 E.01297
G1 X218.001 Y136.22 E.30118
G1 X218.001 Y135.687 E.01641
G1 X211.436 Y129.122 E.28544
G2 X211.767 Y128.919 I-.85 J-1.749 E.01195
G1 X218.001 Y135.153 E.27108
G1 X218.001 Y134.619 E.01641
G1 X212.067 Y128.686 E.25801
G2 X212.339 Y128.424 I-1.172 J-1.492 E.01162
G1 X218.001 Y134.086 E.24618
G1 X218.001 Y133.552 E.01641
G1 X212.583 Y128.134 E.23558
G2 X212.798 Y127.815 I-1.486 J-1.231 E.01184
G1 X218.001 Y133.018 E.22625
G1 X218.001 Y132.485 E.01641
G1 X212.981 Y127.465 E.21826
G2 X213.131 Y127.082 I-1.841 J-.94 E.01269
G1 X218.001 Y131.951 E.21175
G1 X218.001 Y131.418 E.01641
G1 X213.238 Y126.655 E.20708
G2 X213.293 Y126.176 I-2.371 J-.512 E.01486
G1 X218.001 Y130.884 E.20472
G1 X218.001 Y130.35 E.01641
G1 X213.282 Y125.631 E.2052
G2 X213.146 Y124.962 I-3.407 J.342 E.02103
G1 X218.17 Y129.986 E.21848
G1 X218.17 Y140.125 F30000
G1 F15000
G1 X201.499 Y123.454 E.72491
G1 X201.499 Y123.988 E.01641
G1 X218.001 Y140.489 E.71754
G1 X218.001 Y141.023 E.01641
G1 X201.499 Y124.522 E.71754
G1 X201.499 Y125.055 E.01641
G1 X218.001 Y141.556 E.71754
G1 X218.001 Y142.09 E.01641
G1 X201.499 Y125.589 E.71754
G1 X201.499 Y126.122 E.01641
G1 X218.001 Y142.624 E.71754
G1 X218.001 Y143.157 E.01641
G1 X201.499 Y126.656 E.71754
G1 X201.499 Y127.19 E.01641
G1 X218.001 Y143.691 E.71754
G1 X218.001 Y144.225 E.01641
G1 X201.499 Y127.723 E.71754
G1 X201.499 Y128.257 E.01641
G1 X218.001 Y144.758 E.71754
G1 X218.001 Y145.292 E.01641
G1 X201.499 Y128.791 E.71754
G1 X201.499 Y129.324 E.01641
G1 X218.001 Y145.825 E.71754
G1 X218.001 Y146.359 E.01641
G1 X201.499 Y129.858 E.71754
G1 X201.499 Y130.391 E.01641
M73 P83 R9
G1 X218.001 Y146.893 E.71754
G1 X218.001 Y147.426 E.01641
G1 X201.499 Y130.925 E.71754
G1 X201.499 Y131.459 E.01641
G1 X218.001 Y147.96 E.71754
G1 X218.001 Y148.494 E.01641
G1 X201.499 Y131.992 E.71754
G1 X201.499 Y132.526 E.01641
G1 X218.001 Y149.027 E.71754
G1 X218.001 Y149.561 E.01641
G1 X201.499 Y133.06 E.71754
G1 X201.499 Y133.593 E.01641
G1 X218.001 Y150.094 E.71754
G1 X218.001 Y150.628 E.01641
G1 X201.499 Y134.127 E.71754
G1 X201.499 Y134.66 E.01641
G1 X218.001 Y151.162 E.71754
G1 X218.001 Y151.695 E.01641
G1 X201.499 Y135.194 E.71754
G1 X201.499 Y135.728 E.01641
G1 X218.001 Y152.229 E.71754
G1 X218.001 Y152.763 E.01641
G1 X201.499 Y136.261 E.71754
G1 X201.499 Y136.795 E.01641
G1 X218.001 Y153.296 E.71754
G1 X218.001 Y153.83 E.01641
G1 X201.499 Y137.329 E.71754
G1 X201.499 Y137.862 E.01641
G1 X218.001 Y154.363 E.71754
G1 X218.001 Y154.897 E.01641
G1 X201.499 Y138.396 E.71754
G1 X201.499 Y138.929 E.01641
G1 X218.001 Y155.431 E.71754
G1 X218.001 Y155.964 E.01641
G1 X201.499 Y139.463 E.71754
G1 X201.499 Y139.997 E.01641
G1 X218.001 Y156.498 E.71754
G1 X218.001 Y157.032 E.01641
G1 X201.499 Y140.53 E.71754
G1 X201.499 Y141.064 E.01641
G1 X218.001 Y157.565 E.71754
G1 X218.001 Y158.099 E.01641
G1 X201.499 Y141.598 E.71754
G1 X201.499 Y142.131 E.01641
G1 X218.001 Y158.632 E.71754
G1 X218.001 Y159.166 E.01641
G1 X201.499 Y142.665 E.71754
G1 X201.499 Y143.198 E.01641
G1 X218.001 Y159.7 E.71754
G1 X218.001 Y160.233 E.01641
G1 X201.499 Y143.732 E.71754
G1 X201.499 Y144.266 E.01641
G1 X218.001 Y160.767 E.71754
G1 X218.001 Y161.301 E.01641
G1 X201.499 Y144.799 E.71754
G1 X201.499 Y145.333 E.01641
G1 X218.001 Y161.834 E.71754
G1 X218.001 Y162.368 E.01641
G1 X201.499 Y145.867 E.71754
G1 X201.499 Y146.4 E.01641
G1 X218.001 Y162.901 E.71754
G1 X218.001 Y163.435 E.01641
G1 X201.499 Y146.934 E.71754
G1 X201.499 Y147.467 E.01641
G1 X218.001 Y163.969 E.71754
G1 X218.001 Y164.502 E.01641
G1 X201.499 Y148.001 E.71754
G1 X201.499 Y148.535 E.01641
G1 X218.001 Y165.036 E.71754
G1 X218.001 Y165.57 E.01641
G1 X201.499 Y149.068 E.71754
G1 X201.499 Y149.602 E.01641
G1 X218.001 Y166.103 E.71754
G1 X218.001 Y166.637 E.01641
G1 X201.499 Y150.136 E.71754
G1 X201.499 Y150.669 E.01641
G1 X218.001 Y167.17 E.71754
G1 X218.001 Y167.704 E.01641
G1 X201.499 Y151.203 E.71754
G1 X201.499 Y151.736 E.01641
G1 X218.001 Y168.238 E.71754
G1 X218.001 Y168.771 E.01641
G1 X201.499 Y152.27 E.71754
G1 X201.499 Y152.804 E.01641
G1 X218.001 Y169.305 E.71754
G1 X218.001 Y169.839 E.01641
G1 X201.499 Y153.337 E.71754
G1 X201.499 Y153.871 E.01641
G1 X218.001 Y170.372 E.71754
G1 X218.001 Y170.906 E.01641
G1 X201.499 Y154.405 E.71754
G1 X201.499 Y154.938 E.01641
G1 X218.001 Y171.439 E.71754
G1 X218.001 Y171.973 E.01641
G1 X201.499 Y155.472 E.71754
G1 X201.499 Y156.005 E.01641
G1 X218.001 Y172.507 E.71754
G1 X218.001 Y173.04 E.01641
G1 X201.499 Y156.539 E.71754
G1 X201.499 Y157.073 E.01641
G1 X218.001 Y173.574 E.71754
G1 X218.001 Y174.108 E.01641
G1 X201.499 Y157.606 E.71754
G1 X201.499 Y158.14 E.01641
G1 X218.001 Y174.641 E.71754
G1 X218.001 Y175.175 E.01641
G1 X201.499 Y158.674 E.71754
G1 X201.499 Y159.207 E.01641
G1 X218.001 Y175.708 E.71754
G1 X218.001 Y176.242 E.01641
G1 X201.499 Y159.741 E.71754
G1 X201.499 Y160.274 E.01641
G1 X218.001 Y176.776 E.71754
G1 X218.001 Y177.309 E.01641
G1 X201.499 Y160.808 E.71754
G1 X201.499 Y161.342 E.01641
G1 X218.001 Y177.843 E.71754
G1 X218.001 Y178.377 E.01641
G1 X201.499 Y161.875 E.71754
G1 X201.499 Y162.409 E.01641
G1 X218.001 Y178.91 E.71754
G1 X218.001 Y179.444 E.01641
G1 X201.499 Y162.943 E.71754
G1 X201.499 Y163.476 E.01641
G1 X218.001 Y179.977 E.71754
G1 X218.001 Y180.511 E.01641
G1 X201.499 Y164.01 E.71754
G1 X201.499 Y164.543 E.01641
G1 X218.001 Y181.045 E.71754
G1 X218.001 Y181.578 E.01641
G1 X201.499 Y165.077 E.71754
G1 X201.499 Y165.611 E.01641
G1 X218.001 Y182.112 E.71754
G1 X218.001 Y182.646 E.01641
G1 X201.499 Y166.144 E.71754
G1 X201.499 Y166.678 E.01641
G1 X218.001 Y183.179 E.71754
G1 X218.001 Y183.713 E.01641
G1 X201.499 Y167.212 E.71754
G1 X201.499 Y167.745 E.01641
G1 X218.001 Y184.246 E.71754
G1 X218.001 Y184.78 E.01641
G1 X201.499 Y168.279 E.71754
G1 X201.499 Y168.812 E.01641
G1 X218.001 Y185.314 E.71754
G1 X218.001 Y185.847 E.01641
G1 X201.499 Y169.346 E.71754
G1 X201.499 Y169.88 E.01641
G1 X218.001 Y186.381 E.71754
G1 X218.001 Y186.915 E.01641
G1 X201.499 Y170.413 E.71754
G1 X201.499 Y170.947 E.01641
G1 X218.001 Y187.448 E.71754
G1 X218.001 Y187.982 E.01641
G1 X201.499 Y171.481 E.71754
G1 X201.499 Y172.014 E.01641
G1 X218.001 Y188.515 E.71754
G1 X218.001 Y189.049 E.01641
G1 X201.499 Y172.548 E.71754
G1 X201.499 Y173.081 E.01641
G1 X218.001 Y189.583 E.71754
G1 X218.001 Y190.116 E.01641
G1 X201.499 Y173.615 E.71754
G1 X201.499 Y174.149 E.01641
G1 X218.001 Y190.65 E.71754
G1 X218.001 Y191.184 E.01641
G1 X201.499 Y174.682 E.71754
G1 X201.499 Y175.216 E.01641
G1 X218.001 Y191.717 E.71754
G1 X218.001 Y192.251 E.01641
G1 X201.499 Y175.75 E.71754
G1 X201.499 Y176.283 E.01641
G1 X218.001 Y192.784 E.71754
G1 X218.001 Y193.318 E.01641
G1 X201.499 Y176.817 E.71754
G1 X201.499 Y177.35 E.01641
G1 X218.001 Y193.852 E.71754
G1 X218.001 Y194.385 E.01641
G1 X201.499 Y177.884 E.71754
G1 X201.499 Y178.418 E.01641
G1 X218.001 Y194.919 E.71754
G1 X218.001 Y195.453 E.01641
G1 X201.499 Y178.951 E.71754
G1 X201.499 Y179.485 E.01641
G1 X218.001 Y195.986 E.71754
G1 X218.001 Y196.52 E.01641
G1 X201.499 Y180.019 E.71754
G1 X201.499 Y180.552 E.01641
G1 X218.001 Y197.053 E.71754
G1 X218.001 Y197.587 E.01641
G1 X201.499 Y181.086 E.71754
G1 X201.499 Y181.619 E.01641
G1 X218.001 Y198.121 E.71754
G1 X218.001 Y198.654 E.01641
G1 X201.499 Y182.153 E.71754
G1 X201.499 Y182.687 E.01641
G1 X218.001 Y199.188 E.71754
G1 X218.001 Y199.722 E.01641
G1 X201.499 Y183.22 E.71754
G1 X201.499 Y183.754 E.01641
G1 X218.001 Y200.255 E.71754
G1 X218.001 Y200.789 E.01641
G1 X201.499 Y184.288 E.71754
G1 X201.499 Y184.821 E.01641
G1 X218.001 Y201.322 E.71754
G1 X218.001 Y201.856 E.01641
G1 X201.499 Y185.355 E.71754
G1 X201.499 Y185.888 E.01641
G1 X218.001 Y202.39 E.71754
G1 X218.001 Y202.923 E.01641
G1 X201.499 Y186.422 E.71754
G1 X201.499 Y186.956 E.01641
G1 X218.001 Y203.457 E.71754
G1 X218.001 Y203.991 E.01641
G1 X201.499 Y187.489 E.71754
G1 X201.499 Y188.023 E.01641
G1 X218.001 Y204.524 E.71754
G1 X218.001 Y205.058 E.01641
G1 X201.499 Y188.557 E.71754
G1 X201.499 Y189.09 E.01641
G1 X218.001 Y205.591 E.71754
G1 X218.001 Y206.125 E.01641
G1 X201.499 Y189.624 E.71754
G1 X201.499 Y190.157 E.01641
G1 X218.001 Y206.659 E.71754
G1 X218.001 Y207.192 E.01641
G1 X201.499 Y190.691 E.71754
G1 X201.499 Y191.225 E.01641
G1 X218.001 Y207.726 E.71754
G1 X218.001 Y208.26 E.01641
G1 X201.499 Y191.758 E.71754
G1 X201.499 Y192.292 E.01641
G1 X218.001 Y208.793 E.71754
G1 X218.001 Y209.327 E.01641
G1 X201.499 Y192.826 E.71754
G1 X201.499 Y193.359 E.01641
G1 X218.001 Y209.86 E.71754
G1 X218.001 Y210.394 E.01641
G1 X201.499 Y193.893 E.71754
G1 X201.499 Y194.426 E.01641
G1 X218.001 Y210.928 E.71754
G1 X218.001 Y211.461 E.01641
G1 X201.499 Y194.96 E.71754
G1 X201.499 Y195.494 E.01641
G1 X218.001 Y211.995 E.71754
G1 X218.001 Y212.529 E.01641
G1 X201.499 Y196.027 E.71754
G1 X201.499 Y196.561 E.01641
G1 X218.001 Y213.062 E.71754
G1 X218.001 Y213.596 E.01641
G1 X213.093 Y208.688 E.21341
G3 X213.265 Y209.393 I-3.377 J1.197 E.02237
G1 X218.001 Y214.129 E.20594
G1 X218.001 Y214.663 E.01641
G1 X213.297 Y209.96 E.20452
G3 X213.251 Y210.447 I-2.462 J.012 E.01507
G1 X218.001 Y215.197 E.20653
G1 X218.001 Y215.73 E.01641
G1 X213.154 Y210.883 E.21077
G3 X213.012 Y211.276 I-6.629 J-2.162 E.01283
G1 X218.001 Y216.264 E.21691
G1 X218.001 Y216.798 E.01641
G1 X212.834 Y211.631 E.22467
G3 X212.624 Y211.955 I-1.723 J-.885 E.01189
G1 X218.001 Y217.331 E.23378
G1 X218.001 Y217.865 E.01641
G1 X212.385 Y212.25 E.24417
G3 X212.118 Y212.516 I-1.464 J-1.202 E.01162
G1 X217.728 Y218.126 E.24393
G1 X217.194 Y218.126 E.01641
G1 X211.822 Y212.754 E.23359
G3 X211.497 Y212.962 I-1.205 J-1.523 E.0119
G1 X216.661 Y218.126 E.22453
G1 X216.127 Y218.126 E.01641
G1 X211.14 Y213.139 E.21683
G3 X210.749 Y213.281 I-.908 J-1.89 E.01283
G1 X215.593 Y218.126 E.21065
G1 X215.06 Y218.126 E.01641
G1 X210.313 Y213.379 E.20639
G3 X209.822 Y213.421 I-.457 J-2.437 E.01519
G1 X214.526 Y218.126 E.20455
G1 X213.992 Y218.126 E.01641
G1 X209.257 Y213.39 E.20593
G3 X208.546 Y213.213 I.589 J-3.883 E.02254
G1 X213.459 Y218.126 E.21362
G1 X212.925 Y218.126 E.01641
G1 X196.424 Y201.624 E.71754
G1 X196.958 Y201.624 E.01641
G1 X206.408 Y211.075 E.41095
G3 X206.234 Y210.368 I4.185 J-1.402 E.02242
G1 X197.491 Y201.624 E.38019
G1 X198.025 Y201.624 E.01641
G1 X206.203 Y209.802 E.35561
G3 X206.245 Y209.311 I4.596 J.148 E.01517
G1 X198.558 Y201.624 E.33425
G1 X199.092 Y201.624 E.01641
G1 X206.346 Y208.878 E.31541
G3 X206.486 Y208.485 I2.033 J.508 E.01285
G1 X199.626 Y201.624 E.29833
G1 X200.159 Y201.624 E.01641
G1 X206.663 Y208.128 E.28279
G3 X206.87 Y207.802 I1.733 J.876 E.0119
G1 X200.693 Y201.624 E.26862
G1 X201.227 Y201.624 E.01641
G1 X207.108 Y207.506 E.25574
G3 X207.374 Y207.238 I1.466 J1.19 E.01162
G1 X201.499 Y201.364 E.25543
G1 X201.499 Y200.83 E.01641
G1 X207.668 Y206.998 E.26823
G3 X207.993 Y206.79 I6.433 J9.656 E.01187
G1 X201.499 Y200.296 E.28236
G1 X201.499 Y199.763 E.01641
G1 X208.35 Y206.614 E.29791
G3 X208.744 Y206.473 I.899 J1.895 E.01286
G1 X201.499 Y199.229 E.31501
G1 X201.499 Y198.695 E.01641
G1 X209.178 Y206.374 E.33389
G3 X209.67 Y206.333 I.483 J2.782 E.0152
G1 X201.499 Y198.162 E.35529
G1 X201.499 Y197.628 E.01641
G1 X210.232 Y206.36 E.37971
G3 X210.936 Y206.532 I-.497 J3.582 E.02234
G1 X201.33 Y196.925 E.41774
; WIPE_START
G1 X202.744 Y198.339 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X195.198 Y199.484 Z3 F30000
G1 X71.151 Y218.295 Z3
G1 Z2.6
G1 E.8 F1800
G1 F15000
G1 X37.999 Y185.144 E1.44154
G1 X37.999 Y185.678 E.01641
G1 X70.447 Y218.126 E1.41095
G1 X69.914 Y218.126 E.01641
G1 X37.999 Y186.211 E1.38775
G1 X37.999 Y186.745 E.01641
G1 X69.38 Y218.126 E1.36455
G1 X68.846 Y218.126 E.01641
G1 X37.999 Y187.279 E1.34134
G1 X37.999 Y187.812 E.01641
G1 X68.313 Y218.126 E1.31814
G1 X67.779 Y218.126 E.01641
G1 X37.999 Y188.346 E1.29493
G1 X37.999 Y188.88 E.01641
G1 X67.245 Y218.126 E1.27173
G1 X66.712 Y218.126 E.01641
G1 X37.999 Y189.413 E1.24853
G1 X37.999 Y189.947 E.01641
G1 X66.178 Y218.126 E1.22532
G1 X65.645 Y218.126 E.01641
G1 X37.999 Y190.48 E1.20212
G1 X37.999 Y191.014 E.01641
G1 X65.111 Y218.126 E1.17891
G1 X64.577 Y218.126 E.01641
G1 X37.999 Y191.548 E1.15571
G1 X37.999 Y192.081 E.01641
G1 X64.044 Y218.126 E1.13251
G1 X63.51 Y218.126 E.01641
G1 X37.999 Y192.615 E1.1093
G1 X37.999 Y193.149 E.01641
G1 X62.976 Y218.126 E1.0861
G1 X62.443 Y218.126 E.01641
G1 X37.999 Y193.682 E1.06289
G1 X37.999 Y194.216 E.01641
G1 X61.909 Y218.126 E1.03969
G1 X61.376 Y218.126 E.01641
G1 X37.999 Y194.749 E1.01649
G1 X37.999 Y195.283 E.01641
G1 X60.842 Y218.126 E.99328
G1 X60.308 Y218.126 E.01641
G1 X37.999 Y195.817 E.97008
G1 X37.999 Y196.35 E.01641
G1 X59.775 Y218.126 E.94687
G1 X59.241 Y218.126 E.01641
G1 X49.441 Y208.325 E.42616
G3 X49.724 Y209.142 I-3.366 J1.623 E.02663
G1 X58.707 Y218.126 E.39065
G1 X58.174 Y218.126 E.01641
G1 X49.795 Y209.747 E.36434
G3 X49.779 Y210.264 I-4.408 J.117 E.01591
G1 X57.64 Y218.126 E.34185
G1 X57.107 Y218.126 E.01641
G1 X49.696 Y210.715 E.32223
G3 X49.57 Y211.123 I-2.103 J-.426 E.01314
G1 X56.573 Y218.126 E.30449
G1 X56.039 Y218.126 E.01641
G1 X49.407 Y211.494 E.28838
G3 X49.211 Y211.831 I-1.784 J-.81 E.01202
G1 X55.506 Y218.126 E.2737
G1 X54.972 Y218.126 E.01641
G1 X48.985 Y212.139 E.26033
G3 X48.73 Y212.417 I-1.526 J-1.142 E.01163
G1 X54.438 Y218.126 E.24822
G1 X53.905 Y218.126 E.01641
G1 X48.445 Y212.666 E.23742
G3 X48.131 Y212.885 I-1.255 J-1.463 E.0118
G1 X53.371 Y218.126 E.22788
G1 X52.838 Y218.126 E.01641
G1 X47.786 Y213.074 E.21968
G3 X47.407 Y213.228 I-.963 J-1.816 E.0126
G1 X52.304 Y218.126 E.21295
G1 X51.77 Y218.126 E.01641
G1 X46.989 Y213.345 E.2079
G3 X46.526 Y213.415 I-.584 J-2.274 E.01442
G1 X51.237 Y218.126 E.20483
G1 X50.703 Y218.126 E.01641
G1 X45.99 Y213.413 E.20494
G3 X45.351 Y213.307 I.27 J-3.616 E.01995
G1 X50.169 Y218.126 E.20954
G1 X49.636 Y218.126 E.01641
G1 X37.999 Y206.489 E.506
G1 X37.999 Y205.956 E.01641
G1 X42.814 Y210.77 E.20936
G3 X42.711 Y210.134 I4.474 J-1.051 E.01985
G1 X37.999 Y205.422 E.20488
G1 X37.999 Y204.888 E.01641
G1 X42.713 Y209.601 E.20495
G3 X42.781 Y209.136 I2.36 J.107 E.01449
G1 X37.999 Y204.355 E.2079
G1 X37.999 Y203.821 E.01641
G1 X42.895 Y208.717 E.21289
G3 X43.049 Y208.337 I1.978 J.579 E.01262
G1 X37.999 Y203.287 E.21957
G1 X37.999 Y202.754 E.01641
G1 X43.239 Y207.994 E.22786
G3 X43.46 Y207.681 I1.675 J.949 E.01179
G1 X37.999 Y202.22 E.23747
G1 X37.999 Y201.687 E.01641
G1 X43.71 Y207.397 E.24833
G3 X43.988 Y207.142 I1.418 J1.264 E.01163
G1 X37.999 Y201.153 E.26042
G1 X37.999 Y200.619 E.01641
G1 X44.295 Y206.915 E.27376
G3 X44.632 Y206.718 I1.15 J1.584 E.01202
G1 X37.999 Y200.086 E.28841
G1 X37.999 Y199.552 E.01641
G1 X45.002 Y206.554 E.30449
G3 X45.408 Y206.427 I.84 J1.968 E.01311
G1 X37.999 Y199.018 E.32216
G1 X37.999 Y198.485 E.01641
G1 X45.862 Y206.347 E.34188
G3 X46.381 Y206.333 I.354 J3.407 E.01599
G1 X37.999 Y197.951 E.36446
G1 X37.999 Y197.418 E.01641
G1 X46.987 Y206.405 E.3908
G3 X47.797 Y206.682 I-.771 J3.582 E.02639
G1 X37.83 Y196.714 E.43341
G1 X37.83 Y217.526 F30000
G1 F15000
G1 X38.43 Y218.126 E.02609
G1 X38.963 Y218.126 E.01641
G1 X37.999 Y217.162 E.04192
G1 X37.999 Y216.628 E.01641
G1 X39.497 Y218.126 E.06512
G1 X40.031 Y218.126 E.01641
G1 X37.999 Y216.094 E.08833
G1 X37.999 Y215.561 E.01641
G1 X40.564 Y218.126 E.11153
G1 X41.098 Y218.126 E.01641
G1 X37.999 Y215.027 E.13473
G1 X37.999 Y214.494 E.01641
G1 X41.631 Y218.126 E.15794
G1 X42.165 Y218.126 E.01641
G1 X37.999 Y213.96 E.18114
G1 X37.999 Y213.426 E.01641
G1 X42.699 Y218.126 E.20435
G1 X43.232 Y218.126 E.01641
G1 X37.999 Y212.893 E.22755
G1 X37.999 Y212.359 E.01641
G1 X43.766 Y218.126 E.25075
G1 X44.3 Y218.126 E.01641
G1 X37.999 Y211.825 E.27396
G1 X37.999 Y211.292 E.01641
G1 X44.833 Y218.126 E.29716
G1 X45.367 Y218.126 E.01641
G1 X37.999 Y210.758 E.32037
G1 X37.999 Y210.225 E.01641
G1 X45.9 Y218.126 E.34357
G1 X46.434 Y218.126 E.01641
G1 X37.999 Y209.691 E.36677
G1 X37.999 Y209.157 E.01641
G1 X46.968 Y218.126 E.38998
G1 X47.501 Y218.126 E.01641
G1 X37.999 Y208.624 E.41318
G1 X37.999 Y208.09 E.01641
G1 X48.035 Y218.126 E.43639
G1 X48.569 Y218.126 E.01641
G1 X37.999 Y207.556 E.45959
G1 X37.999 Y207.023 E.01641
G1 X49.272 Y218.295 E.49017
; WIPE_START
G1 X47.858 Y216.881 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X52.839 Y211.099 Z3 F30000
G1 X205.668 Y33.705 Z3
G1 Z2.6
G1 E.8 F1800
G1 F15000
G1 X210.657 Y38.694 E.21694
G2 X210.012 Y38.583 I-.874 J3.162 E.02013
G1 X205.304 Y33.874 E.20475
G1 X204.77 Y33.874 E.01641
G1 X209.484 Y38.588 E.20496
G2 X209.015 Y38.653 I.089 J2.372 E.01457
G1 X204.237 Y33.874 E.20778
G1 X203.703 Y33.874 E.01641
G1 X208.596 Y38.767 E.21277
G2 X208.219 Y38.924 I.592 J1.96 E.01258
G1 X203.169 Y33.874 E.21957
G1 X202.636 Y33.874 E.01641
G1 X207.875 Y39.113 E.22782
G2 X207.561 Y39.334 I.942 J1.675 E.0118
G1 X202.102 Y33.874 E.23738
G1 X201.568 Y33.874 E.01641
G1 X207.277 Y39.582 E.24821
G2 X207.02 Y39.86 I1.258 J1.42 E.01163
G1 X201.035 Y33.874 E.26027
G1 X200.501 Y33.874 E.01641
G1 X206.793 Y40.166 E.27358
G2 X206.595 Y40.502 I1.582 J1.157 E.01201
G1 X199.968 Y33.874 E.28818
G1 X199.434 Y33.874 E.01641
G1 X206.43 Y40.87 E.3042
G2 X206.303 Y41.277 I5.994 J2.095 E.0131
G1 X198.9 Y33.874 E.32188
G1 X198.367 Y33.874 E.01641
G1 X206.224 Y41.732 E.34169
G2 X206.203 Y42.244 I2.549 J.364 E.01578
G1 X197.833 Y33.874 E.36395
G1 X197.299 Y33.874 E.01641
G1 X206.278 Y42.853 E.39044
G2 X206.545 Y43.653 I3.702 J-.789 E.02598
G1 X196.766 Y33.874 E.42523
G1 X196.232 Y33.874 E.01641
G1 X218.001 Y55.643 E.94657
G1 X218.001 Y55.109 E.01641
G1 X208.216 Y45.325 E.42546
G2 X209.024 Y45.599 I1.241 J-2.331 E.02634
G1 X218.001 Y54.576 E.39034
G1 X218.001 Y54.042 E.01641
G1 X209.632 Y45.673 E.3639
G2 X210.143 Y45.651 I.055 J-4.539 E.01574
G1 X218.001 Y53.508 E.34168
G1 X218.001 Y52.975 E.01641
G1 X210.596 Y45.57 E.32197
G2 X211.005 Y45.445 I-.419 J-2.103 E.01316
G1 X218.001 Y52.441 E.3042
G1 X218.001 Y51.907 E.01641
G1 X211.376 Y45.282 E.28808
G2 X211.711 Y45.084 I-.826 J-1.778 E.012
G1 X218.001 Y51.374 E.2735
G1 X218.001 Y50.84 E.01641
G1 X212.016 Y44.856 E.26022
G2 X212.293 Y44.599 I-1.147 J-1.514 E.01163
G1 X218.001 Y50.307 E.24818
G1 X218.001 Y49.773 E.01641
G1 X212.542 Y44.314 E.23737
G2 X212.761 Y44 I-1.459 J-1.253 E.0118
G1 X218.001 Y49.239 E.22783
G1 X218.001 Y48.706 E.01641
G1 X212.95 Y43.655 E.21961
G2 X213.106 Y43.277 I-1.809 J-.964 E.01259
G1 X218.001 Y48.172 E.21286
G1 X218.001 Y47.638 E.01641
G1 X213.223 Y42.861 E.20775
G2 X213.288 Y42.392 I-4.824 J-.91 E.01455
G1 X218.001 Y47.105 E.20491
G1 X218.001 Y46.571 E.01641
G1 X213.288 Y41.859 E.20491
G2 X213.179 Y41.216 I-3.728 J.304 E.02008
G1 X218.001 Y46.038 E.20967
G1 X218.001 Y45.504 E.01641
G1 X206.371 Y33.874 E.5057
G1 X206.905 Y33.874 E.01641
G1 X218.001 Y44.97 E.48249
G1 X218.001 Y44.437 E.01641
G1 X207.438 Y33.874 E.45929
G1 X207.972 Y33.874 E.01641
G1 X218.001 Y43.903 E.43608
G1 X218.001 Y43.369 E.01641
G1 X208.506 Y33.874 E.41288
G1 X209.039 Y33.874 E.01641
G1 X218.001 Y42.836 E.38968
G1 X218.001 Y42.302 E.01641
G1 X209.573 Y33.874 E.36647
G1 X210.106 Y33.874 E.01641
G1 X218.001 Y41.769 E.34327
G1 X218.001 Y41.235 E.01641
G1 X210.64 Y33.874 E.32006
G1 X211.174 Y33.874 E.01641
G1 X218.001 Y40.701 E.29686
G1 X218.001 Y40.168 E.01641
G1 X211.707 Y33.874 E.27366
G1 X212.241 Y33.874 E.01641
G1 X218.001 Y39.634 E.25045
G1 X218.001 Y39.1 E.01641
G1 X212.775 Y33.874 E.22725
G1 X213.308 Y33.874 E.01641
G1 X218.001 Y38.567 E.20404
G1 X218.001 Y38.033 E.01641
G1 X213.842 Y33.874 E.18084
G1 X214.375 Y33.874 E.01641
G1 X218.001 Y37.5 E.15764
G1 X218.001 Y36.966 E.01641
G1 X214.909 Y33.874 E.13443
G1 X215.443 Y33.874 E.01641
G1 X218.001 Y36.432 E.11123
G1 X218.001 Y35.899 E.01641
G1 X215.976 Y33.874 E.08802
G1 X216.51 Y33.874 E.01641
G1 X218.001 Y35.365 E.06482
G1 X218.001 Y34.831 E.01641
G1 X217.044 Y33.874 E.04162
G1 X217.577 Y33.874 E.01641
G1 X218.17 Y34.467 E.02579
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X217.577 Y33.874 E-.31874
G1 X217.044 Y33.874 E-.20278
G1 X217.487 Y34.318 E-.23848
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/15
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
G17
G3 Z3 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 15
G1 X94.57 Y41.25
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X94.35 Y41.397 E.00879
G2 X93.626 Y41.086 I-.97 J1.261 E.02641
G2 X94.212 Y40.417 I-.581 J-1.099 E.03018
G2 X93.888 Y39.348 I-.984 J-.285 E.03917
G1 X93.616 Y39.166 E.01086
G2 X94.356 Y38.849 I-.239 J-1.578 E.02701
G1 X96.539 Y41.123 E.10458
G1 X95.02 Y41.123 E.05037
G2 X94.622 Y41.22 I.055 J1.09 E.01368
G1 X94.549 Y40.798 F30000
G1 F16213.044
G1 X94.488 Y40.814 E.00211
G2 X94.65 Y39.98 I-1.225 J-.671 E.02863
G1 X94.808 Y39.907 E.00577
G1 X95.584 Y40.716 E.03718
G2 X94.799 Y40.736 I-.292 J3.996 E.0261
G1 X94.608 Y40.784 E.00653
; WIPE_START
G1 X94.488 Y40.814 E-.04693
G1 X94.603 Y40.536 E-.11448
G1 X94.652 Y40.288 E-.0959
G1 X94.65 Y39.98 E-.11702
G1 X94.808 Y39.907 E-.06606
G1 X95.39 Y40.514 E-.31961
; WIPE_END
G1 E-.04 F1800
G1 X96.725 Y48.029 Z3.2 F30000
G1 X125.911 Y212.32 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F16213.044
G1 X125.874 Y212.284 E.00172
G3 X127.6 Y206.682 I2.128 J-2.411 E.24463
G3 X128.234 Y206.665 I.41 J3.476 E.02107
G3 X126.124 Y212.484 I-.232 J3.208 E.39396
G1 X125.959 Y212.357 E.00693
G1 X126.167 Y212.003 F30000
G1 F16213.044
G1 X126.143 Y211.979 E.00114
G3 X127.651 Y207.086 I1.858 J-2.106 E.21367
G3 X128.205 Y207.072 I.358 J3.041 E.01843
G3 X126.362 Y212.154 I-.204 J2.801 E.34401
G1 X126.215 Y212.04 E.00616
G1 X126.437 Y211.696 F30000
G1 F16213.044
M73 P84 R9
G1 X126.406 Y211.681 E.00115
G3 X127.701 Y207.491 I1.583 J-1.806 E.18332
G1 X127.92 Y207.474 E.00726
G3 X126.797 Y211.959 I.07 J2.401 E.29403
G1 X126.486 Y211.732 E.01278
G1 X126.854 Y211.515 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X126.667 Y211.386 E.00698
G3 X127.75 Y207.88 I1.324 J-1.511 E.14211
G1 X127.931 Y207.867 E.00558
G3 X126.993 Y211.619 I.06 J2.008 E.22786
G1 X126.902 Y211.551 E.0035
; WIPE_START
M204 S10000
G1 X126.667 Y211.386 E-.10916
G1 X126.398 Y211.089 E-.15231
G1 X126.189 Y210.747 E-.15214
G1 X126.052 Y210.371 E-.1521
G1 X125.992 Y209.975 E-.15216
G1 X125.992 Y209.864 E-.04213
; WIPE_END
G1 E-.04 F1800
G1 X133.619 Y209.572 Z3.2 F30000
G1 X209.594 Y206.664 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X209.646 Y206.66 E.00171
G3 X209.984 Y206.665 I.114 J3.5 E.01123
G3 X209.35 Y206.682 I-.232 J3.208 E.64923
G1 X209.534 Y206.668 E.00614
G1 X209.624 Y207.07 F30000
G1 F16213.044
G1 X209.658 Y207.067 E.00113
G3 X209.955 Y207.072 I.101 J3.06 E.00988
G3 X209.401 Y207.086 I-.204 J2.801 E.56697
G1 X209.564 Y207.074 E.00543
G1 X209.686 Y207.475 F30000
G1 F16213.044
G1 X209.927 Y207.481 E.00798
G3 X209.451 Y207.491 I-.187 J2.394 E.48475
G1 X209.626 Y207.478 E.00582
G1 X209.671 Y207.868 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.681 Y207.867 E.00031
G3 X209.5 Y207.88 I.06 J2.008 E.38231
G1 X209.611 Y207.872 E.00342
; WIPE_START
M204 S10000
G1 X209.681 Y207.867 E-.02666
G1 X209.899 Y207.87 E-.08293
G1 X210.294 Y207.94 E-.15251
G1 X210.667 Y208.086 E-.15211
G1 X211.003 Y208.303 E-.15214
G1 X211.29 Y208.583 E-.15211
G1 X211.352 Y208.673 E-.04155
; WIPE_END
G1 E-.04 F1800
G1 X211.195 Y201.042 Z3.2 F30000
G1 X209.595 Y122.789 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X209.646 Y122.785 E.0017
G3 X209.984 Y122.79 I.114 J3.511 E.01123
G3 X209.35 Y122.807 I-.232 J3.208 E.64923
G1 X209.535 Y122.793 E.00615
G1 X209.624 Y123.195 F30000
G1 F16213.044
G1 X209.658 Y123.192 E.00113
G3 X209.955 Y123.197 I.101 J3.071 E.00989
G3 X209.4 Y123.211 I-.204 J2.801 E.56696
G1 X209.564 Y123.199 E.00544
G1 X209.671 Y123.61 F30000
G1 F16213.044
G1 X209.927 Y123.604 E.00849
G3 X209.451 Y123.616 I-.176 J2.395 E.4847
G1 X209.611 Y123.612 E.00531
G1 X209.677 Y123.992 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.681 Y123.992 E.00012
G3 X209.5 Y124.005 I.059 J2.008 E.38231
G1 X209.617 Y123.997 E.00361
; WIPE_START
M204 S10000
G1 X209.681 Y123.992 E-.02426
G1 X209.899 Y123.995 E-.08296
G1 X210.294 Y124.065 E-.15244
G1 X210.667 Y124.211 E-.15211
G1 X211.003 Y124.428 E-.15213
G1 X211.29 Y124.708 E-.15213
G1 X211.355 Y124.803 E-.04397
; WIPE_END
G1 E-.04 F1800
G1 X211.199 Y117.173 Z3.2 F30000
G1 X209.595 Y38.914 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X209.646 Y38.91 E.0017
G3 X209.984 Y38.915 I.114 J3.509 E.01123
G3 X209.35 Y38.932 I-.232 J3.208 E.64923
G1 X209.535 Y38.918 E.00615
G1 X209.624 Y39.32 F30000
G1 F16213.044
G1 X209.658 Y39.317 E.00113
G3 X209.955 Y39.322 I.1 J3.069 E.00988
G3 X209.401 Y39.336 I-.204 J2.801 E.56697
G1 X209.564 Y39.324 E.00543
G1 X209.671 Y39.735 F30000
G1 F16213.044
G1 X209.927 Y39.729 E.00848
G3 X209.451 Y39.741 I-.176 J2.395 E.4847
G1 X209.611 Y39.737 E.0053
G1 X209.677 Y40.117 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.681 Y40.117 E.00012
G3 X209.5 Y40.13 I.059 J2.008 E.38231
G1 X209.617 Y40.122 E.00361
; WIPE_START
M204 S10000
G1 X209.681 Y40.117 E-.02429
G1 X209.899 Y40.12 E-.08292
G1 X210.294 Y40.19 E-.15248
G1 X210.667 Y40.336 E-.15211
G1 X211.003 Y40.553 E-.15216
G1 X211.29 Y40.833 E-.1521
G1 X211.355 Y40.928 E-.04395
; WIPE_END
G1 E-.04 F1800
G1 X203.725 Y40.744 Z3.2 F30000
G1 X127.844 Y38.914 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X127.896 Y38.91 E.0017
G3 X128.234 Y38.915 I.114 J3.503 E.01123
G3 X127.6 Y38.932 I-.232 J3.208 E.64923
G1 X127.785 Y38.918 E.00615
G1 X127.874 Y39.32 F30000
G1 F16213.044
G1 X127.908 Y39.317 E.00113
G3 X128.205 Y39.322 I.1 J3.064 E.00988
G3 X127.65 Y39.336 I-.204 J2.801 E.56696
G1 X127.814 Y39.324 E.00544
G1 X127.903 Y39.726 F30000
G1 F16213.044
G1 X127.92 Y39.724 E.00055
G3 X127.701 Y39.741 I.07 J2.401 E.49328
G1 X127.843 Y39.73 E.00472
G1 X127.928 Y40.117 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X127.931 Y40.117 E.00011
G3 X127.75 Y40.13 I.06 J2.008 E.38231
G1 X127.868 Y40.122 E.00363
; WIPE_START
M204 S10000
G1 X127.931 Y40.117 E-.02414
G1 X128.149 Y40.12 E-.08292
G1 X128.544 Y40.19 E-.15248
G1 X128.917 Y40.336 E-.15212
G1 X129.253 Y40.553 E-.15213
G1 X129.54 Y40.833 E-.15213
G1 X129.605 Y40.929 E-.04409
; WIPE_END
G1 E-.04 F1800
G1 X121.998 Y41.549 Z3.2 F30000
G1 X94.358 Y43.802 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G3 X93.684 Y43.941 I-.745 J-1.911 E.02291
G1 X91.106 Y43.939 E.08554
G3 X89.434 Y42.16 I.149 J-1.815 E.08878
G1 X89.436 Y37.946 E.13978
G3 X90.929 Y36.334 I1.839 J.205 E.07805
G1 X91.181 Y36.309 E.0084
G1 X93.794 Y36.311 E.08669
G3 X94.363 Y36.445 I-.169 J1.984 E.01947
G3 X94.873 Y36.311 I.611 J1.278 E.01759
G1 X97.629 Y36.311 E.09142
G3 X98.779 Y39.381 I-.193 J1.823 E.13459
G3 X99.266 Y40.558 I-1.277 J1.218 E.04324
G1 X99.264 Y42.304 E.05793
G3 X97.484 Y43.941 I-1.817 J-.19 E.08765
G1 X94.906 Y43.939 E.08554
G3 X94.413 Y43.824 I.193 J-1.94 E.01682
G1 X94.354 Y43.35 F30000
G1 F16213.044
G3 X93.675 Y43.534 I-.709 J-1.274 E.02357
G1 X91.136 Y43.532 E.08421
G3 X89.841 Y42.15 I.117 J-1.408 E.06888
G1 X89.843 Y37.986 E.13811
G3 X90.999 Y36.736 I1.427 J.16 E.06047
G1 X91.201 Y36.716 E.00673
G1 X93.764 Y36.718 E.08503
G3 X94.35 Y36.903 I-.156 J1.511 E.02052
G3 X94.913 Y36.718 I.759 J1.355 E.01979
G1 X97.589 Y36.718 E.08877
G3 X98.168 Y39.338 I-.142 J1.406 E.11737
G1 X98.5 Y39.684 E.01592
G3 X98.859 Y40.577 I-.972 J.909 E.03267
G1 X98.857 Y42.264 E.05596
G3 X97.475 Y43.534 I-1.409 J-.147 E.06807
G1 X94.936 Y43.532 E.08421
G3 X94.406 Y43.379 I.123 J-1.42 E.01841
G1 X94.344 Y42.848 F30000
G1 F16213.044
G3 X93.665 Y43.127 I-.731 J-.815 E.02484
G1 X91.166 Y43.125 E.08288
G3 X90.248 Y42.14 I.111 J-1.024 E.0487
G1 X90.25 Y38.026 E.13645
G3 X91.069 Y37.138 I1.015 J.114 E.04289
G1 X91.221 Y37.123 E.00506
G1 X93.734 Y37.125 E.08337
G3 X94.349 Y37.397 I-.118 J1.1 E.02268
G3 X94.952 Y37.125 I.834 J1.046 E.02217
G1 X97.548 Y37.125 E.08612
G3 X98.216 Y38.773 I-.117 J1.007 E.07195
G3 X97.434 Y39.162 I-.935 J-.9 E.02955
G1 X98.193 Y39.952 E.03634
G3 X98.452 Y40.596 I-.696 J.654 E.02359
G1 X98.45 Y42.224 E.05398
G3 X97.465 Y43.127 I-1.027 J-.131 E.0482
G1 X94.966 Y43.125 E.08288
G3 X94.39 Y42.887 I.125 J-1.119 E.02097
; WIPE_START
G1 X94.134 Y43.004 E-.10677
G1 X94.028 Y43.054 E-.04449
G1 X93.91 Y43.094 E-.04759
G1 X93.665 Y43.127 E-.094
G1 X92.435 Y43.126 E-.46716
; WIPE_END
G1 E-.04 F1800
G1 X94.78 Y41.581 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X95.04 Y41.515 I.277 J.544 E.00832
G1 X96.84 Y41.515 E.05532
G1 X96.84 Y40.87 E.01981
G1 X94.603 Y38.54 E.09926
G3 X94.875 Y37.54 I.461 J-.412 E.03779
G1 X94.991 Y37.517 E.00362
G1 X97.51 Y37.517 E.07741
G3 X97.46 Y38.735 I-.063 J.607 E.05663
G1 X96.481 Y38.735 E.03009
G1 X97.897 Y40.21 E.06282
G3 X98.06 Y40.615 I-.638 J.492 E.01359
G1 X98.058 Y42.185 E.04824
G3 X97.455 Y42.735 I-.625 J-.08 E.02728
G1 X94.995 Y42.733 E.07559
G3 X94.727 Y41.611 I.062 J-.608 E.04637
; WIPE_START
M204 S10000
G1 X94.936 Y41.525 E-.0857
G1 X95.04 Y41.515 E-.03963
G1 X96.71 Y41.515 E-.63468
; WIPE_END
G1 E-.04 F1800
G1 X93.828 Y40.3 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
G1 F12000
M204 S5000
G3 X93.26 Y40.735 I-.584 J-.175 E.02347
G1 X91.86 Y40.735 E.04303
G1 X91.86 Y41.515 E.02397
G1 X93.66 Y41.515 E.05532
G3 X93.655 Y42.735 I-.016 J.61 E.05806
G1 X91.195 Y42.733 E.07559
G3 X90.64 Y42.13 I.073 J-.624 E.02744
G1 X90.642 Y38.065 E.12491
G3 X91.136 Y37.525 I.618 J.07 E.02404
G1 X93.705 Y37.517 E.07893
G3 X93.66 Y38.735 I-.056 J.608 E.05684
G1 X91.86 Y38.735 E.05532
G1 X91.86 Y39.515 E.02397
G1 X93.26 Y39.515 E.04303
G3 X93.843 Y40.242 I-.017 J.61 E.03256
; WIPE_START
M204 S10000
G1 X93.722 Y40.513 E-.1125
G1 X93.64 Y40.595 E-.04431
G1 X93.483 Y40.69 E-.06959
G1 X93.26 Y40.735 E-.08637
G1 X92.083 Y40.735 E-.44722
; WIPE_END
G1 E-.04 F1800
G1 X96.373 Y47.048 Z3.2 F30000
G1 X201.166 Y201.291 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X54.834 Y201.291 E4.85411
G1 X54.834 Y50.709 E4.99509
G1 X201.166 Y50.709 E4.85411
G1 X201.166 Y201.231 E4.9931
G1 X200.759 Y200.884 F30000
G1 F16213.044
G1 X55.241 Y200.884 E4.82711
G1 X55.241 Y51.116 E4.96809
G1 X200.759 Y51.116 E4.82711
G1 X200.759 Y200.824 E4.9661
G1 X200.352 Y200.477 F30000
G1 F16213.044
G1 X55.648 Y200.477 E4.8001
G1 X55.648 Y51.523 E4.94108
G1 X200.352 Y51.523 E4.8001
G1 X200.352 Y200.417 E4.93909
G1 X199.96 Y200.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X56.04 Y200.085 E4.42226
G1 X56.04 Y51.915 E4.55285
G1 X199.96 Y51.915 E4.42226
G1 X199.96 Y200.025 E4.55101
; WIPE_START
M204 S10000
G1 X197.96 Y200.026 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X192.69 Y194.505 Z3.2 F30000
G1 X44.593 Y39.369 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X44.642 Y39.339 E.00191
G3 X45.85 Y38.932 I1.61 J2.784 E.04258
G3 X46.484 Y38.915 I.41 J3.482 E.02107
G3 X44.372 Y39.513 I-.232 J3.208 E.59601
G1 X44.542 Y39.402 E.00674
G1 X45.167 Y39.535 F30000
G1 F16213.044
G1 X45.355 Y39.461 E.00669
G3 X45.901 Y39.336 I.896 J2.662 E.0186
G3 X46.455 Y39.322 I.358 J3.045 E.01844
G3 X45.094 Y39.564 I-.204 J2.801 E.53907
G1 X45.111 Y39.557 E.00061
G1 X45.632 Y39.814 F30000
G1 F16213.044
G1 X45.951 Y39.741 E.01086
G1 X46.17 Y39.724 E.00726
G3 X45.484 Y39.845 I.07 J2.401 E.47737
G1 X45.573 Y39.826 E.00303
G1 X46.094 Y40.123 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X46.181 Y40.117 E.00268
G3 X46 Y40.13 I.06 J2.008 E.38231
G1 X46.034 Y40.128 E.00105
; WIPE_START
M204 S10000
G1 X46.181 Y40.117 E-.05592
G1 X46.399 Y40.12 E-.08292
G1 X46.794 Y40.19 E-.15248
G1 X47.167 Y40.336 E-.15213
G1 X47.503 Y40.553 E-.15213
G1 X47.79 Y40.833 E-.15211
G1 X47.808 Y40.86 E-.01232
; WIPE_END
G1 E-.04 F1800
G1 X47.956 Y48.491 Z3.2 F30000
G1 X49.455 Y125.731 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X49.468 Y126 E.00893
G3 X45.85 Y122.807 I-3.216 J-.002 E.48929
G3 X46.484 Y122.79 I.41 J3.486 E.02108
G3 X49.451 Y125.671 I-.232 J3.208 E.14901
G1 X49.048 Y125.754 F30000
G1 F16213.044
G1 X49.06 Y126 E.00816
G3 X45.9 Y123.211 I-2.809 J-.002 E.42733
G3 X46.455 Y123.197 I.358 J3.049 E.01844
G3 X49.044 Y125.694 I-.204 J2.801 E.12948
G1 X48.629 Y125.762 F30000
G1 F16213.044
G1 X48.652 Y126 E.00793
G3 X45.951 Y123.616 I-2.401 J-.002 E.36536
G3 X46.427 Y123.604 I.305 J2.612 E.01581
G3 X48.605 Y125.524 I-.176 J2.395 E.10343
G1 X48.623 Y125.702 E.00595
G1 X48.213 Y125.614 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X48.24 Y125.801 E.00581
G3 X46 Y124.005 I-1.999 J.199 E.28964
G1 X46.181 Y123.992 E.00558
G3 X48.161 Y125.41 I.059 J2.008 E.08042
G1 X48.198 Y125.556 E.0046
; WIPE_START
M204 S10000
G1 X48.24 Y125.801 E-.09453
G1 X48.25 Y126.2 E-.15179
G1 X48.171 Y126.592 E-.15207
G1 X48.015 Y126.961 E-.15217
G1 X47.79 Y127.292 E-.15211
G1 X47.682 Y127.398 E-.05733
; WIPE_END
G1 E-.04 F1800
G1 X47.319 Y135.021 Z3.2 F30000
G1 X43.854 Y207.73 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X43.892 Y207.688 E.00188
G3 X45.85 Y206.682 I2.36 J2.185 E.07451
G3 X46.484 Y206.665 I.41 J3.478 E.02107
G3 X43.687 Y207.933 I-.232 J3.208 E.56409
G1 X43.816 Y207.776 E.00676
G1 X44.166 Y207.992 F30000
G1 F16213.044
G1 X44.191 Y207.965 E.00125
G3 X45.901 Y207.086 I2.061 J1.909 E.06507
G3 X46.455 Y207.072 I.357 J3.043 E.01843
G3 X44.011 Y208.179 I-.204 J2.801 E.4926
M73 P84 R8
G1 X44.127 Y208.039 E.00605
G1 X44.467 Y208.269 F30000
G1 F16213.044
G1 X44.484 Y208.237 E.00123
G3 X45.951 Y207.491 I1.756 J1.638 E.05572
G1 X46.17 Y207.474 E.00726
G3 X44.193 Y208.618 I.07 J2.401 E.42162
G1 X44.43 Y208.316 E.01272
G1 X44.746 Y208.547 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X44.772 Y208.504 E.00155
G3 X46 Y207.88 I1.469 J1.371 E.04319
G1 X46.181 Y207.867 E.00558
G3 X44.529 Y208.823 I.06 J2.008 E.32676
G1 X44.709 Y208.594 E.00895
; WIPE_START
M204 S10000
G1 X44.772 Y208.504 E-.04194
G1 X44.92 Y208.368 E-.0763
G1 X45.245 Y208.134 E-.15214
G1 X45.61 Y207.969 E-.15209
G1 X46 Y207.88 E-.15214
G1 X46.181 Y207.867 E-.06895
G1 X46.399 Y207.87 E-.08293
G1 X46.486 Y207.886 E-.03352
; WIPE_END
G1 E-.04 F1800
G1 X54.104 Y208.354 Z3.2 F30000
G1 X218.334 Y218.459 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X37.666 Y218.459 E5.99308
G1 X37.666 Y33.541 E6.13406
G1 X218.334 Y33.541 E5.99308
G1 X218.334 Y218.399 E6.13207
G1 X218.741 Y218.866 F30000
G1 F16213.044
G1 X37.259 Y218.866 E6.02008
G1 X37.259 Y33.134 E6.16106
G1 X218.741 Y33.134 E6.02008
G1 X218.741 Y218.806 E6.15907
G1 X219.148 Y219.273 F30000
G1 F16213.044
G1 X36.852 Y219.273 E6.04709
G1 X36.852 Y32.727 E6.18807
G1 X219.148 Y32.727 E6.04709
G1 X219.148 Y219.213 E6.18608
G1 X219.54 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X36.46 Y219.665 E5.62554
G1 X36.46 Y32.335 E5.75613
G1 X219.54 Y32.335 E5.62554
G1 X219.54 Y219.605 E5.75429
; WIPE_START
M204 S10000
G1 X217.54 Y219.606 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X217.407 Y218.295 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42025
G1 F15000
G1 X218.001 Y217.702 E.02579
G1 X218.001 Y217.168 E.01641
G1 X217.043 Y218.126 E.04162
G1 X216.51 Y218.126 E.01641
G1 X218.001 Y216.635 E.06482
G1 X218.001 Y216.101 E.01641
G1 X215.976 Y218.126 E.08802
G1 X215.443 Y218.126 E.01641
G1 X218.001 Y215.568 E.11123
G1 X218.001 Y215.034 E.01641
G1 X214.909 Y218.126 E.13443
G1 X214.375 Y218.126 E.01641
G1 X218.001 Y214.5 E.15764
G1 X218.001 Y213.967 E.01641
G1 X213.842 Y218.126 E.18084
G1 X213.308 Y218.126 E.01641
G1 X218.001 Y213.433 E.20404
G1 X218.001 Y212.899 E.01641
G1 X212.774 Y218.126 E.22725
G1 X212.241 Y218.126 E.01641
G1 X218.001 Y212.366 E.25045
G1 X218.001 Y211.832 E.01641
G1 X211.707 Y218.126 E.27366
G1 X211.174 Y218.126 E.01641
G1 X218.001 Y211.299 E.29686
G1 X218.001 Y210.765 E.01641
G1 X210.64 Y218.126 E.32006
G1 X210.106 Y218.126 E.01641
G1 X218.001 Y210.231 E.34327
G1 X218.001 Y209.698 E.01641
G1 X209.573 Y218.126 E.36647
G1 X209.039 Y218.126 E.01641
G1 X218.001 Y209.164 E.38968
G1 X218.001 Y208.63 E.01641
G1 X208.505 Y218.126 E.41288
G1 X207.972 Y218.126 E.01641
G1 X218.001 Y208.097 E.43608
G1 X218.001 Y207.563 E.01641
G1 X207.438 Y218.126 E.45929
G1 X206.905 Y218.126 E.01641
G1 X218.001 Y207.03 E.48249
G1 X218.001 Y206.496 E.01641
G1 X206.371 Y218.126 E.5057
G1 X205.837 Y218.126 E.01641
G1 X210.656 Y213.307 E.20955
G3 X210.012 Y213.417 I-1.18 J-4.956 E.0201
G1 X205.304 Y218.126 E.20475
G1 X204.77 Y218.126 E.01641
G1 X209.483 Y213.412 E.20495
G3 X209.015 Y213.347 I.09 J-2.377 E.01457
G1 X204.236 Y218.126 E.20778
G1 X203.703 Y218.126 E.01641
G1 X208.596 Y213.233 E.21276
G3 X208.219 Y213.076 I.594 J-1.964 E.01258
G1 X203.169 Y218.126 E.21957
G1 X202.636 Y218.126 E.01641
G1 X207.875 Y212.887 E.22781
G3 X207.561 Y212.666 I.945 J-1.68 E.0118
G1 X202.102 Y218.126 E.23738
G1 X201.568 Y218.126 E.01641
G1 X207.276 Y212.417 E.24821
G3 X207.02 Y212.14 I1.259 J-1.42 E.01163
G1 X201.035 Y218.126 E.26027
G1 X200.501 Y218.126 E.01641
G1 X206.792 Y211.834 E.27357
G3 X206.595 Y211.498 I1.579 J-1.155 E.01201
G1 X199.967 Y218.126 E.28818
G1 X199.434 Y218.126 E.01641
G1 X206.429 Y211.13 E.3042
G3 X206.303 Y210.723 I5.995 J-2.095 E.0131
G1 X198.9 Y218.126 E.32188
G1 X198.367 Y218.126 E.01641
G1 X206.224 Y210.268 E.34168
G3 X206.203 Y209.756 I2.548 J-.364 E.01578
G1 X197.833 Y218.126 E.36395
G1 X197.299 Y218.126 E.01641
G1 X206.278 Y209.147 E.39044
G3 X206.545 Y208.346 I3.7 J.788 E.02599
G1 X196.766 Y218.126 E.42523
G1 X196.232 Y218.126 E.01641
G1 X218.001 Y196.357 E.94657
G1 X218.001 Y196.891 E.01641
G1 X208.216 Y206.675 E.42546
G3 X209.024 Y206.401 I1.242 J2.333 E.02634
G1 X218.001 Y197.424 E.39034
G1 X218.001 Y197.958 E.01641
G1 X209.632 Y206.327 E.3639
G3 X210.143 Y206.349 I.021 J5.339 E.01574
G1 X218.001 Y198.492 E.34168
G1 X218.001 Y199.025 E.01641
G1 X210.596 Y206.43 E.32197
G3 X211.005 Y206.555 I-.422 J2.111 E.01316
G1 X218.001 Y199.559 E.3042
M73 P85 R8
G1 X218.001 Y200.092 E.01641
G1 X211.376 Y206.717 E.28808
G3 X211.711 Y206.916 I-.823 J1.773 E.012
G1 X218.001 Y200.626 E.2735
G1 X218.001 Y201.16 E.01641
G1 X212.016 Y207.144 E.26022
G3 X212.293 Y207.401 I-1.144 J1.511 E.01163
G1 X218.001 Y201.693 E.24818
G1 X218.001 Y202.227 E.01641
G1 X212.542 Y207.686 E.23737
G3 X212.761 Y208 I-1.461 J1.255 E.0118
G1 X218.001 Y202.761 E.22782
G1 X218.001 Y203.294 E.01641
G1 X212.95 Y208.345 E.21961
G3 X213.106 Y208.723 I-1.809 J.964 E.01259
G1 X218.001 Y203.828 E.21285
G1 X218.001 Y204.361 E.01641
G1 X213.223 Y209.139 E.20774
G3 X213.288 Y209.607 I-4.814 J.909 E.01455
G1 X218.001 Y204.895 E.20491
G1 X218.001 Y205.429 E.01641
G1 X213.288 Y210.141 E.2049
G3 X213.179 Y210.784 I-3.725 J-.303 E.02008
G1 X218.17 Y205.793 E.21704
G1 X218.17 Y38.234 F30000
G1 F15000
G1 X213.093 Y43.312 E.22078
G2 X213.265 Y42.606 I-3.378 J-1.196 E.02236
G1 X218.001 Y37.87 E.20593
G1 X218.001 Y37.337 E.01641
G1 X213.297 Y42.04 E.20451
G2 X213.251 Y41.553 I-2.461 J-.011 E.01507
G1 X218.001 Y36.803 E.20653
G1 X218.001 Y36.27 E.01641
G1 X213.154 Y41.116 E.21076
G2 X213.012 Y40.724 I-6.618 J2.159 E.01283
G1 X218.001 Y35.736 E.2169
G1 X218.001 Y35.202 E.01641
G1 X212.834 Y40.369 E.22466
G2 X212.624 Y40.045 I-1.725 J.886 E.01189
G1 X218.001 Y34.669 E.23378
G1 X218.001 Y34.135 E.01641
G1 X212.385 Y39.75 E.24417
G2 X212.118 Y39.484 I-1.465 J1.203 E.01162
G1 X217.728 Y33.874 E.24392
G1 X217.194 Y33.874 E.01641
G1 X211.822 Y39.246 E.23358
G2 X211.497 Y39.038 I-1.204 J1.522 E.0119
G1 X216.66 Y33.874 E.22452
G1 X216.127 Y33.874 E.01641
G1 X211.14 Y38.861 E.21682
G2 X210.749 Y38.719 I-.907 J1.887 E.01283
G1 X215.593 Y33.874 E.21064
G1 X215.059 Y33.874 E.01641
G1 X210.313 Y38.621 E.20638
G2 X209.821 Y38.579 I-.435 J2.23 E.01522
G1 X214.526 Y33.874 E.20458
G1 X213.992 Y33.874 E.01641
G1 X209.257 Y38.61 E.20592
G2 X208.546 Y38.787 I.59 J3.887 E.02254
G1 X213.459 Y33.874 E.21361
G1 X212.925 Y33.874 E.01641
G1 X196.424 Y50.376 E.71753
G1 X196.957 Y50.376 E.01641
G1 X206.408 Y40.925 E.41094
G2 X206.234 Y41.632 I4.181 J1.401 E.02242
G1 X197.491 Y50.376 E.38019
G1 X198.025 Y50.376 E.01641
G1 X206.203 Y42.197 E.35561
G2 X206.245 Y42.689 I4.597 J-.147 E.01517
G1 X198.558 Y50.376 E.33425
G1 X199.092 Y50.376 E.01641
G1 X206.345 Y43.122 E.31541
G2 X206.486 Y43.515 I2.033 J-.508 E.01285
G1 X199.626 Y50.376 E.29833
G1 X200.159 Y50.376 E.01641
G1 X206.662 Y43.872 E.28278
G2 X206.87 Y44.198 I1.733 J-.876 E.0119
G1 X200.693 Y50.376 E.26862
G1 X201.226 Y50.376 E.01641
G1 X207.108 Y44.494 E.25573
G2 X207.373 Y44.762 I1.473 J-1.196 E.01162
G1 X201.499 Y50.636 E.25542
G1 X201.499 Y51.17 E.01641
G1 X207.668 Y45.001 E.26822
G2 X207.993 Y45.21 I6.424 J-9.64 E.01187
G1 X201.499 Y51.703 E.28234
G1 X201.499 Y52.237 E.01641
G1 X208.35 Y45.386 E.2979
G2 X208.743 Y45.527 I.898 J-1.894 E.01286
G1 X201.499 Y52.771 E.31499
G1 X201.499 Y53.304 E.01641
G1 X209.178 Y45.626 E.33388
G2 X209.662 Y45.676 I.49 J-2.396 E.01498
G1 X201.499 Y53.838 E.35492
G1 X201.499 Y54.371 E.01641
G1 X210.231 Y45.64 E.37969
G2 X210.936 Y45.469 I-.496 J-3.58 E.02233
G1 X201.499 Y54.905 E.41034
G1 X201.499 Y55.439 E.01641
G1 X218.001 Y38.938 E.71753
G1 X218.001 Y39.471 E.01641
G1 X201.499 Y55.972 E.71753
G1 X201.499 Y56.506 E.01641
G1 X218.001 Y40.005 E.71753
G1 X218.001 Y40.539 E.01641
G1 X201.499 Y57.04 E.71753
G1 X201.499 Y57.573 E.01641
G1 X218.001 Y41.072 E.71753
G1 X218.001 Y41.606 E.01641
G1 X201.499 Y58.107 E.71753
G1 X201.499 Y58.64 E.01641
G1 X218.001 Y42.139 E.71753
G1 X218.001 Y42.673 E.01641
G1 X201.499 Y59.174 E.71753
G1 X201.499 Y59.708 E.01641
G1 X218.001 Y43.207 E.71753
G1 X218.001 Y43.74 E.01641
G1 X201.499 Y60.241 E.71753
G1 X201.499 Y60.775 E.01641
G1 X218.001 Y44.274 E.71753
G1 X218.001 Y44.808 E.01641
G1 X201.499 Y61.309 E.71753
G1 X201.499 Y61.842 E.01641
G1 X218.001 Y45.341 E.71753
G1 X218.001 Y45.875 E.01641
G1 X201.499 Y62.376 E.71753
G1 X201.499 Y62.91 E.01641
G1 X218.001 Y46.408 E.71753
G1 X218.001 Y46.942 E.01641
G1 X201.499 Y63.443 E.71753
G1 X201.499 Y63.977 E.01641
G1 X218.001 Y47.476 E.71753
G1 X218.001 Y48.009 E.01641
G1 X201.499 Y64.51 E.71753
G1 X201.499 Y65.044 E.01641
G1 X218.001 Y48.543 E.71753
G1 X218.001 Y49.077 E.01641
G1 X201.499 Y65.578 E.71753
G1 X201.499 Y66.111 E.01641
G1 X218.001 Y49.61 E.71753
G1 X218.001 Y50.144 E.01641
G1 X201.499 Y66.645 E.71753
G1 X201.499 Y67.179 E.01641
G1 X218.001 Y50.677 E.71753
G1 X218.001 Y51.211 E.01641
G1 X201.499 Y67.712 E.71753
G1 X201.499 Y68.246 E.01641
G1 X218.001 Y51.745 E.71753
G1 X218.001 Y52.278 E.01641
G1 X201.499 Y68.779 E.71753
G1 X201.499 Y69.313 E.01641
G1 X218.001 Y52.812 E.71753
G1 X218.001 Y53.346 E.01641
G1 X201.499 Y69.847 E.71753
G1 X201.499 Y70.38 E.01641
G1 X218.001 Y53.879 E.71753
G1 X218.001 Y54.413 E.01641
G1 X201.499 Y70.914 E.71753
G1 X201.499 Y71.447 E.01641
G1 X218.001 Y54.946 E.71753
G1 X218.001 Y55.48 E.01641
G1 X201.499 Y71.981 E.71753
G1 X201.499 Y72.515 E.01641
G1 X218.001 Y56.014 E.71753
G1 X218.001 Y56.547 E.01641
G1 X201.499 Y73.048 E.71753
G1 X201.499 Y73.582 E.01641
G1 X218.001 Y57.081 E.71753
G1 X218.001 Y57.615 E.01641
G1 X201.499 Y74.116 E.71753
G1 X201.499 Y74.649 E.01641
G1 X218.001 Y58.148 E.71753
G1 X218.001 Y58.682 E.01641
G1 X201.499 Y75.183 E.71753
G1 X201.499 Y75.716 E.01641
G1 X218.001 Y59.215 E.71753
G1 X218.001 Y59.749 E.01641
G1 X201.499 Y76.25 E.71753
G1 X201.499 Y76.784 E.01641
G1 X218.001 Y60.283 E.71753
G1 X218.001 Y60.816 E.01641
G1 X201.499 Y77.317 E.71753
G1 X201.499 Y77.851 E.01641
G1 X218.001 Y61.35 E.71753
G1 X218.001 Y61.884 E.01641
G1 X201.499 Y78.385 E.71753
G1 X201.499 Y78.918 E.01641
G1 X218.001 Y62.417 E.71753
G1 X218.001 Y62.951 E.01641
G1 X201.499 Y79.452 E.71753
G1 X201.499 Y79.986 E.01641
G1 X218.001 Y63.484 E.71753
G1 X218.001 Y64.018 E.01641
G1 X201.499 Y80.519 E.71753
G1 X201.499 Y81.053 E.01641
G1 X218.001 Y64.552 E.71753
G1 X218.001 Y65.085 E.01641
G1 X201.499 Y81.586 E.71753
G1 X201.499 Y82.12 E.01641
G1 X218.001 Y65.619 E.71753
G1 X218.001 Y66.153 E.01641
G1 X201.499 Y82.654 E.71753
G1 X201.499 Y83.187 E.01641
G1 X218.001 Y66.686 E.71753
G1 X218.001 Y67.22 E.01641
G1 X201.499 Y83.721 E.71753
G1 X201.499 Y84.255 E.01641
G1 X218.001 Y67.753 E.71753
G1 X218.001 Y68.287 E.01641
G1 X201.499 Y84.788 E.71753
G1 X201.499 Y85.322 E.01641
G1 X218.001 Y68.821 E.71753
G1 X218.001 Y69.354 E.01641
G1 X201.499 Y85.855 E.71753
G1 X201.499 Y86.389 E.01641
G1 X218.001 Y69.888 E.71753
G1 X218.001 Y70.422 E.01641
G1 X201.499 Y86.923 E.71753
G1 X201.499 Y87.456 E.01641
G1 X218.001 Y70.955 E.71753
G1 X218.001 Y71.489 E.01641
G1 X201.499 Y87.99 E.71753
G1 X201.499 Y88.524 E.01641
G1 X218.001 Y72.022 E.71753
G1 X218.001 Y72.556 E.01641
G1 X201.499 Y89.057 E.71753
G1 X201.499 Y89.591 E.01641
G1 X218.001 Y73.09 E.71753
G1 X218.001 Y73.623 E.01641
G1 X201.499 Y90.124 E.71753
G1 X201.499 Y90.658 E.01641
G1 X218.001 Y74.157 E.71753
G1 X218.001 Y74.691 E.01641
G1 X201.499 Y91.192 E.71753
G1 X201.499 Y91.725 E.01641
G1 X218.001 Y75.224 E.71753
G1 X218.001 Y75.758 E.01641
G1 X201.499 Y92.259 E.71753
G1 X201.499 Y92.793 E.01641
G1 X218.001 Y76.291 E.71753
G1 X218.001 Y76.825 E.01641
G1 X201.499 Y93.326 E.71753
G1 X201.499 Y93.86 E.01641
G1 X218.001 Y77.359 E.71753
G1 X218.001 Y77.892 E.01641
G1 X201.499 Y94.393 E.71753
G1 X201.499 Y94.927 E.01641
G1 X218.001 Y78.426 E.71753
G1 X218.001 Y78.96 E.01641
G1 X201.499 Y95.461 E.71753
G1 X201.499 Y95.994 E.01641
G1 X218.001 Y79.493 E.71753
G1 X218.001 Y80.027 E.01641
G1 X201.499 Y96.528 E.71753
G1 X201.499 Y97.062 E.01641
G1 X218.001 Y80.56 E.71753
G1 X218.001 Y81.094 E.01641
G1 X201.499 Y97.595 E.71753
G1 X201.499 Y98.129 E.01641
G1 X218.001 Y81.628 E.71753
G1 X218.001 Y82.161 E.01641
G1 X201.499 Y98.662 E.71753
G1 X201.499 Y99.196 E.01641
G1 X218.001 Y82.695 E.71753
G1 X218.001 Y83.229 E.01641
G1 X201.499 Y99.73 E.71753
G1 X201.499 Y100.263 E.01641
G1 X218.001 Y83.762 E.71753
G1 X218.001 Y84.296 E.01641
G1 X201.499 Y100.797 E.71753
G1 X201.499 Y101.331 E.01641
G1 X218.001 Y84.829 E.71753
G1 X218.001 Y85.363 E.01641
G1 X201.499 Y101.864 E.71753
G1 X201.499 Y102.398 E.01641
G1 X218.001 Y85.897 E.71753
G1 X218.001 Y86.43 E.01641
G1 X201.499 Y102.931 E.71753
G1 X201.499 Y103.465 E.01641
G1 X218.001 Y86.964 E.71753
G1 X218.001 Y87.498 E.01641
G1 X201.499 Y103.999 E.71753
G1 X201.499 Y104.532 E.01641
G1 X218.001 Y88.031 E.71753
G1 X218.001 Y88.565 E.01641
G1 X201.499 Y105.066 E.71753
G1 X201.499 Y105.6 E.01641
G1 X218.001 Y89.098 E.71753
G1 X218.001 Y89.632 E.01641
G1 X201.499 Y106.133 E.71753
G1 X201.499 Y106.667 E.01641
G1 X218.001 Y90.166 E.71753
G1 X218.001 Y90.699 E.01641
G1 X201.499 Y107.2 E.71753
G1 X201.499 Y107.734 E.01641
G1 X218.001 Y91.233 E.71753
G1 X218.001 Y91.767 E.01641
G1 X201.499 Y108.268 E.71753
G1 X201.499 Y108.801 E.01641
G1 X218.001 Y92.3 E.71753
G1 X218.001 Y92.834 E.01641
G1 X201.499 Y109.335 E.71753
G1 X201.499 Y109.869 E.01641
G1 X218.001 Y93.367 E.71753
G1 X218.001 Y93.901 E.01641
G1 X201.499 Y110.402 E.71753
G1 X201.499 Y110.936 E.01641
G1 X218.001 Y94.435 E.71753
G1 X218.001 Y94.968 E.01641
G1 X201.499 Y111.469 E.71753
G1 X201.499 Y112.003 E.01641
G1 X218.001 Y95.502 E.71753
G1 X218.001 Y96.036 E.01641
G1 X201.499 Y112.537 E.71753
G1 X201.499 Y113.07 E.01641
G1 X218.001 Y96.569 E.71753
G1 X218.001 Y97.103 E.01641
G1 X201.499 Y113.604 E.71753
G1 X201.499 Y114.138 E.01641
G1 X218.001 Y97.636 E.71753
G1 X218.001 Y98.17 E.01641
G1 X201.499 Y114.671 E.71753
G1 X201.499 Y115.205 E.01641
G1 X218.001 Y98.704 E.71753
G1 X218.001 Y99.237 E.01641
G1 X201.499 Y115.738 E.71753
G1 X201.499 Y116.272 E.01641
G1 X218.001 Y99.771 E.71753
G1 X218.001 Y100.305 E.01641
G1 X201.499 Y116.806 E.71753
G1 X201.499 Y117.339 E.01641
G1 X218.001 Y100.838 E.71753
G1 X218.001 Y101.372 E.01641
G1 X201.499 Y117.873 E.71753
G1 X201.499 Y118.407 E.01641
G1 X218.001 Y101.905 E.71753
G1 X218.001 Y102.439 E.01641
G1 X201.499 Y118.94 E.71753
G1 X201.499 Y119.474 E.01641
G1 X218.001 Y102.973 E.71753
G1 X218.001 Y103.506 E.01641
G1 X201.499 Y120.007 E.71753
G1 X201.499 Y120.541 E.01641
G1 X218.001 Y104.04 E.71753
G1 X218.001 Y104.574 E.01641
G1 X201.499 Y121.075 E.71753
G1 X201.499 Y121.608 E.01641
G1 X218.001 Y105.107 E.71753
G1 X218.001 Y105.641 E.01641
G1 X201.499 Y122.142 E.71753
G1 X201.499 Y122.676 E.01641
G1 X218.001 Y106.174 E.71753
G1 X218.001 Y106.708 E.01641
G1 X201.499 Y123.209 E.71753
G1 X201.499 Y123.743 E.01641
G1 X218.001 Y107.242 E.71753
G1 X218.001 Y107.775 E.01641
G1 X201.499 Y124.276 E.71753
G1 X201.499 Y124.81 E.01641
G1 X218.001 Y108.309 E.71753
G1 X218.001 Y108.843 E.01641
G1 X201.499 Y125.344 E.71753
G1 X201.499 Y125.877 E.01641
G1 X218.001 Y109.376 E.71753
G1 X218.001 Y109.91 E.01641
G1 X201.499 Y126.411 E.71753
G1 X201.499 Y126.945 E.01641
G1 X218.001 Y110.443 E.71753
G1 X218.001 Y110.977 E.01641
G1 X201.499 Y127.478 E.71753
G1 X201.499 Y128.012 E.01641
G1 X218.001 Y111.511 E.71753
G1 X218.001 Y112.044 E.01641
G1 X201.33 Y128.715 E.72491
; WIPE_START
G1 X202.744 Y127.301 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X209.964 Y124.826 Z3.2 F30000
G1 X218.17 Y122.014 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F15000
G1 X213.146 Y127.038 E.21846
G2 X213.282 Y126.368 I-3.271 J-1.011 E.02103
G1 X218.001 Y121.65 E.20519
G1 X218.001 Y121.116 E.01641
G1 X213.293 Y125.824 E.20471
G2 X213.238 Y125.344 I-2.425 J.032 E.01485
G1 X218.001 Y120.582 E.20707
G1 X218.001 Y120.049 E.01641
G1 X213.131 Y124.918 E.21174
G2 X212.981 Y124.534 I-1.991 J.556 E.01269
G1 X218.001 Y119.515 E.21825
G1 X218.001 Y118.981 E.01641
G1 X212.798 Y124.184 E.22624
G2 X212.583 Y123.865 I-1.7 J.912 E.01184
G1 X218.001 Y118.448 E.23557
G1 X218.001 Y117.914 E.01641
G1 X212.339 Y123.575 E.24617
G2 X212.067 Y123.314 I-1.44 J1.226 E.01162
G1 X218.001 Y117.381 E.258
G1 X218.001 Y116.847 E.01641
G1 X211.767 Y123.081 E.27108
G2 X211.436 Y122.878 I-1.181 J1.549 E.01195
G1 X218.001 Y116.313 E.28544
G1 X218.001 Y115.78 E.01641
G1 X211.074 Y122.706 E.30118
G2 X210.674 Y122.572 I-2.288 J6.194 E.01297
G1 X218.001 Y115.246 E.31858
G1 X218.001 Y114.712 E.01641
G1 X210.228 Y122.485 E.33798
G2 X209.727 Y122.453 I-.397 J2.273 E.01548
G1 X218.001 Y114.179 E.35978
G1 X218.001 Y113.645 E.01641
G1 X209.14 Y122.506 E.38528
G2 X208.388 Y122.724 I.623 J3.552 E.02412
G1 X218.001 Y113.112 E.41797
G1 X218.001 Y112.578 E.01641
G1 X201.499 Y129.079 E.71753
G1 X201.499 Y129.613 E.01641
G1 X206.475 Y124.637 E.21635
G2 X206.254 Y125.392 I3.365 J1.395 E.02422
G1 X201.499 Y130.146 E.20674
G1 X201.499 Y130.68 E.01641
G1 X206.203 Y125.977 E.20452
G2 X206.233 Y126.48 I2.53 J.1 E.01553
G1 X201.499 Y131.214 E.20584
G1 X201.499 Y131.747 E.01641
G1 X206.323 Y126.924 E.20974
G2 X206.458 Y127.322 I2.058 J-.475 E.01296
G1 X201.499 Y132.281 E.21561
G1 X201.499 Y132.814 E.01641
G1 X206.629 Y127.685 E.22303
G2 X206.831 Y128.016 I1.756 J-.848 E.01195
G1 X201.499 Y133.348 E.23185
G1 X201.499 Y133.882 E.01641
G1 X207.064 Y128.317 E.24196
G2 X207.325 Y128.59 I1.496 J-1.172 E.01162
G1 X201.499 Y134.415 E.25331
G1 X201.499 Y134.949 E.01641
G1 X207.614 Y128.834 E.2659
G2 X207.933 Y129.049 I1.237 J-1.488 E.01184
G1 X201.499 Y135.483 E.27975
G1 X201.499 Y136.016 E.01641
G1 X208.282 Y129.234 E.29493
G2 X208.669 Y129.381 I2.928 J-7.116 E.01272
G1 X201.499 Y136.55 E.31174
G1 X201.499 Y137.083 E.01641
G1 X209.096 Y129.487 E.33033
G2 X209.573 Y129.544 I.525 J-2.356 E.01478
G1 X201.499 Y137.617 E.35105
G1 X201.499 Y138.151 E.01641
G1 X210.122 Y129.528 E.37493
G2 X210.792 Y129.392 I-.419 J-3.773 E.02105
G1 X201.499 Y138.684 E.40406
G1 X201.499 Y139.218 E.01641
G1 X218.001 Y122.717 E.71753
G1 X218.001 Y123.25 E.01641
G1 X201.499 Y139.752 E.71753
G1 X201.499 Y140.285 E.01641
G1 X218.001 Y123.784 E.71753
G1 X218.001 Y124.318 E.01641
G1 X201.499 Y140.819 E.71753
G1 X201.499 Y141.352 E.01641
G1 X218.001 Y124.851 E.71753
G1 X218.001 Y125.385 E.01641
G1 X201.499 Y141.886 E.71753
G1 X201.499 Y142.42 E.01641
G1 X218.001 Y125.919 E.71753
G1 X218.001 Y126.452 E.01641
G1 X201.499 Y142.953 E.71753
G1 X201.499 Y143.487 E.01641
G1 X218.001 Y126.986 E.71753
G1 X218.001 Y127.519 E.01641
G1 X201.499 Y144.021 E.71753
G1 X201.499 Y144.554 E.01641
G1 X218.001 Y128.053 E.71753
G1 X218.001 Y128.587 E.01641
G1 X201.499 Y145.088 E.71753
G1 X201.499 Y145.621 E.01641
G1 X218.001 Y129.12 E.71753
G1 X218.001 Y129.654 E.01641
G1 X201.499 Y146.155 E.71753
G1 X201.499 Y146.689 E.01641
G1 X218.001 Y130.188 E.71753
G1 X218.001 Y130.721 E.01641
G1 X201.499 Y147.222 E.71753
G1 X201.499 Y147.756 E.01641
G1 X218.001 Y131.255 E.71753
G1 X218.001 Y131.788 E.01641
G1 X201.499 Y148.29 E.71753
G1 X201.499 Y148.823 E.01641
G1 X218.001 Y132.322 E.71753
G1 X218.001 Y132.856 E.01641
G1 X201.499 Y149.357 E.71753
G1 X201.499 Y149.89 E.01641
G1 X218.001 Y133.389 E.71753
G1 X218.001 Y133.923 E.01641
G1 X201.499 Y150.424 E.71753
G1 X201.499 Y150.958 E.01641
G1 X218.001 Y134.457 E.71753
G1 X218.001 Y134.99 E.01641
G1 X201.499 Y151.491 E.71753
G1 X201.499 Y152.025 E.01641
G1 X218.001 Y135.524 E.71753
G1 X218.001 Y136.057 E.01641
G1 X201.499 Y152.559 E.71753
G1 X201.499 Y153.092 E.01641
G1 X218.001 Y136.591 E.71753
G1 X218.001 Y137.125 E.01641
G1 X201.499 Y153.626 E.71753
G1 X201.499 Y154.159 E.01641
G1 X218.001 Y137.658 E.71753
G1 X218.001 Y138.192 E.01641
G1 X201.499 Y154.693 E.71753
G1 X201.499 Y155.227 E.01641
G1 X218.001 Y138.726 E.71753
G1 X218.001 Y139.259 E.01641
G1 X201.499 Y155.76 E.71753
G1 X201.499 Y156.294 E.01641
G1 X218.001 Y139.793 E.71753
G1 X218.001 Y140.326 E.01641
G1 X201.499 Y156.828 E.71753
G1 X201.499 Y157.361 E.01641
G1 X218.001 Y140.86 E.71753
G1 X218.001 Y141.394 E.01641
G1 X201.499 Y157.895 E.71753
G1 X201.499 Y158.428 E.01641
G1 X218.001 Y141.927 E.71753
G1 X218.001 Y142.461 E.01641
G1 X201.499 Y158.962 E.71753
G1 X201.499 Y159.496 E.01641
G1 X218.001 Y142.995 E.71753
G1 X218.001 Y143.528 E.01641
G1 X201.499 Y160.029 E.71753
G1 X201.499 Y160.563 E.01641
G1 X218.001 Y144.062 E.71753
G1 X218.001 Y144.595 E.01641
G1 X201.499 Y161.097 E.71753
G1 X201.499 Y161.63 E.01641
G1 X218.001 Y145.129 E.71753
G1 X218.001 Y145.663 E.01641
G1 X201.499 Y162.164 E.71753
G1 X201.499 Y162.697 E.01641
G1 X218.001 Y146.196 E.71753
G1 X218.001 Y146.73 E.01641
G1 X201.499 Y163.231 E.71753
G1 X201.499 Y163.765 E.01641
G1 X218.001 Y147.264 E.71753
G1 X218.001 Y147.797 E.01641
G1 X201.499 Y164.298 E.71753
G1 X201.499 Y164.832 E.01641
G1 X218.001 Y148.331 E.71753
G1 X218.001 Y148.864 E.01641
G1 X201.499 Y165.366 E.71753
G1 X201.499 Y165.899 E.01641
G1 X218.001 Y149.398 E.71753
G1 X218.001 Y149.932 E.01641
G1 X201.499 Y166.433 E.71753
G1 X201.499 Y166.966 E.01641
G1 X218.001 Y150.465 E.71753
G1 X218.001 Y150.999 E.01641
G1 X201.499 Y167.5 E.71753
G1 X201.499 Y168.034 E.01641
G1 X218.001 Y151.533 E.71753
G1 X218.001 Y152.066 E.01641
G1 X201.499 Y168.567 E.71753
G1 X201.499 Y169.101 E.01641
G1 X218.001 Y152.6 E.71753
G1 X218.001 Y153.133 E.01641
G1 X201.499 Y169.635 E.71753
G1 X201.499 Y170.168 E.01641
G1 X218.001 Y153.667 E.71753
G1 X218.001 Y154.201 E.01641
G1 X201.499 Y170.702 E.71753
G1 X201.499 Y171.235 E.01641
G1 X218.001 Y154.734 E.71753
G1 X218.001 Y155.268 E.01641
G1 X201.499 Y171.769 E.71753
G1 X201.499 Y172.303 E.01641
G1 X218.001 Y155.802 E.71753
G1 X218.001 Y156.335 E.01641
G1 X201.499 Y172.836 E.71753
G1 X201.499 Y173.37 E.01641
G1 X218.001 Y156.869 E.71753
G1 X218.001 Y157.402 E.01641
G1 X201.499 Y173.904 E.71753
G1 X201.499 Y174.437 E.01641
G1 X218.001 Y157.936 E.71753
G1 X218.001 Y158.47 E.01641
G1 X201.499 Y174.971 E.71753
G1 X201.499 Y175.504 E.01641
G1 X218.001 Y159.003 E.71753
G1 X218.001 Y159.537 E.01641
G1 X201.499 Y176.038 E.71753
G1 X201.499 Y176.572 E.01641
G1 X218.001 Y160.071 E.71753
G1 X218.001 Y160.604 E.01641
G1 X201.499 Y177.105 E.71753
G1 X201.499 Y177.639 E.01641
G1 X218.001 Y161.138 E.71753
G1 X218.001 Y161.671 E.01641
G1 X201.499 Y178.173 E.71753
G1 X201.499 Y178.706 E.01641
G1 X218.001 Y162.205 E.71753
G1 X218.001 Y162.739 E.01641
G1 X201.499 Y179.24 E.71753
G1 X201.499 Y179.773 E.01641
G1 X218.001 Y163.272 E.71753
G1 X218.001 Y163.806 E.01641
G1 X201.499 Y180.307 E.71753
G1 X201.499 Y180.841 E.01641
G1 X218.001 Y164.34 E.71753
G1 X218.001 Y164.873 E.01641
G1 X201.499 Y181.374 E.71753
G1 X201.499 Y181.908 E.01641
G1 X218.001 Y165.407 E.71753
G1 X218.001 Y165.94 E.01641
G1 X201.499 Y182.442 E.71753
G1 X201.499 Y182.975 E.01641
G1 X218.001 Y166.474 E.71753
G1 X218.001 Y167.008 E.01641
G1 X201.499 Y183.509 E.71753
G1 X201.499 Y184.042 E.01641
G1 X218.001 Y167.541 E.71753
G1 X218.001 Y168.075 E.01641
G1 X201.499 Y184.576 E.71753
G1 X201.499 Y185.11 E.01641
G1 X218.001 Y168.609 E.71753
G1 X218.001 Y169.142 E.01641
G1 X201.499 Y185.643 E.71753
G1 X201.499 Y186.177 E.01641
G1 X218.001 Y169.676 E.71753
G1 X218.001 Y170.209 E.01641
G1 X201.499 Y186.711 E.71753
G1 X201.499 Y187.244 E.01641
G1 X218.001 Y170.743 E.71753
M73 P86 R8
G1 X218.001 Y171.277 E.01641
G1 X201.499 Y187.778 E.71753
G1 X201.499 Y188.311 E.01641
G1 X218.001 Y171.81 E.71753
G1 X218.001 Y172.344 E.01641
G1 X201.499 Y188.845 E.71753
G1 X201.499 Y189.379 E.01641
G1 X218.001 Y172.878 E.71753
G1 X218.001 Y173.411 E.01641
G1 X201.499 Y189.912 E.71753
G1 X201.499 Y190.446 E.01641
G1 X218.001 Y173.945 E.71753
G1 X218.001 Y174.478 E.01641
G1 X201.499 Y190.98 E.71753
G1 X201.499 Y191.513 E.01641
G1 X218.001 Y175.012 E.71753
G1 X218.001 Y175.546 E.01641
G1 X201.499 Y192.047 E.71753
G1 X201.499 Y192.58 E.01641
G1 X218.001 Y176.079 E.71753
G1 X218.001 Y176.613 E.01641
G1 X201.499 Y193.114 E.71753
G1 X201.499 Y193.648 E.01641
G1 X218.001 Y177.147 E.71753
G1 X218.001 Y177.68 E.01641
G1 X201.499 Y194.181 E.71753
G1 X201.499 Y194.715 E.01641
G1 X218.001 Y178.214 E.71753
G1 X218.001 Y178.747 E.01641
G1 X201.499 Y195.249 E.71753
G1 X201.499 Y195.782 E.01641
G1 X218.001 Y179.281 E.71753
G1 X218.001 Y179.815 E.01641
G1 X201.499 Y196.316 E.71753
G1 X201.499 Y196.849 E.01641
G1 X218.001 Y180.348 E.71753
G1 X218.001 Y180.882 E.01641
G1 X201.499 Y197.383 E.71753
G1 X201.499 Y197.917 E.01641
G1 X218.001 Y181.416 E.71753
G1 X218.001 Y181.949 E.01641
G1 X201.499 Y198.45 E.71753
G1 X201.499 Y198.984 E.01641
G1 X218.001 Y182.483 E.71753
G1 X218.001 Y183.016 E.01641
G1 X201.499 Y199.518 E.71753
G1 X201.499 Y200.051 E.01641
G1 X218.001 Y183.55 E.71753
G1 X218.001 Y184.084 E.01641
G1 X201.499 Y200.585 E.71753
G1 X201.499 Y201.118 E.01641
G1 X218.001 Y184.617 E.71753
G1 X218.001 Y185.151 E.01641
G1 X185.026 Y218.126 E1.43386
G1 X185.56 Y218.126 E.01641
G1 X218.001 Y185.685 E1.41065
G1 X218.001 Y186.218 E.01641
G1 X186.093 Y218.126 E1.38745
G1 X186.627 Y218.126 E.01641
G1 X218.001 Y186.752 E1.36424
G1 X218.001 Y187.285 E.01641
G1 X187.16 Y218.126 E1.34104
G1 X187.694 Y218.126 E.01641
G1 X218.001 Y187.819 E1.31784
G1 X218.001 Y188.353 E.01641
G1 X188.228 Y218.126 E1.29463
G1 X188.761 Y218.126 E.01641
G1 X218.001 Y188.886 E1.27143
G1 X218.001 Y189.42 E.01641
G1 X189.295 Y218.126 E1.24822
G1 X189.829 Y218.126 E.01641
G1 X218.001 Y189.954 E1.22502
G1 X218.001 Y190.487 E.01641
G1 X190.362 Y218.126 E1.20182
G1 X190.896 Y218.126 E.01641
G1 X218.001 Y191.021 E1.17861
G1 X218.001 Y191.554 E.01641
G1 X191.429 Y218.126 E1.15541
G1 X191.963 Y218.126 E.01641
G1 X218.001 Y192.088 E1.1322
G1 X218.001 Y192.622 E.01641
G1 X192.497 Y218.126 E1.109
G1 X193.03 Y218.126 E.01641
G1 X218.001 Y193.155 E1.0858
G1 X218.001 Y193.689 E.01641
G1 X193.564 Y218.126 E1.06259
G1 X194.098 Y218.126 E.01641
G1 X218.001 Y194.223 E1.03939
G1 X218.001 Y194.756 E.01641
G1 X194.631 Y218.126 E1.01618
G1 X195.165 Y218.126 E.01641
G1 X218.001 Y195.29 E.99298
G1 X218.001 Y195.823 E.01641
G1 X195.529 Y218.295 E.97716
G1 X184.323 Y218.295 F30000
G1 F15000
G1 X200.993 Y201.624 E.72491
G1 X200.46 Y201.624 E.01641
G1 X183.959 Y218.126 E.71753
G1 X183.425 Y218.126 E.01641
G1 X199.926 Y201.624 E.71753
G1 X199.393 Y201.624 E.01641
G1 X182.891 Y218.126 E.71753
G1 X182.358 Y218.126 E.01641
G1 X198.859 Y201.624 E.71753
G1 X198.325 Y201.624 E.01641
G1 X181.824 Y218.126 E.71753
G1 X181.291 Y218.126 E.01641
G1 X197.792 Y201.624 E.71753
G1 X197.258 Y201.624 E.01641
G1 X180.757 Y218.126 E.71753
G1 X180.223 Y218.126 E.01641
G1 X196.724 Y201.624 E.71753
G1 X196.191 Y201.624 E.01641
G1 X179.69 Y218.126 E.71753
G1 X179.156 Y218.126 E.01641
G1 X195.657 Y201.624 E.71753
G1 X195.124 Y201.624 E.01641
G1 X178.622 Y218.126 E.71753
G1 X178.089 Y218.126 E.01641
G1 X194.59 Y201.624 E.71753
G1 X194.056 Y201.624 E.01641
G1 X177.555 Y218.126 E.71753
G1 X177.022 Y218.126 E.01641
G1 X193.523 Y201.624 E.71753
G1 X192.989 Y201.624 E.01641
M73 P86 R7
G1 X176.488 Y218.126 E.71753
G1 X175.954 Y218.126 E.01641
G1 X192.455 Y201.624 E.71753
G1 X191.922 Y201.624 E.01641
G1 X175.421 Y218.126 E.71753
G1 X174.887 Y218.126 E.01641
G1 X191.388 Y201.624 E.71753
G1 X190.855 Y201.624 E.01641
G1 X174.353 Y218.126 E.71753
G1 X173.82 Y218.126 E.01641
G1 X190.321 Y201.624 E.71753
G1 X189.787 Y201.624 E.01641
G1 X173.286 Y218.126 E.71753
G1 X172.753 Y218.126 E.01641
G1 X189.254 Y201.624 E.71753
G1 X188.72 Y201.624 E.01641
G1 X172.219 Y218.126 E.71753
G1 X171.685 Y218.126 E.01641
G1 X188.186 Y201.624 E.71753
G1 X187.653 Y201.624 E.01641
G1 X171.152 Y218.126 E.71753
G1 X170.618 Y218.126 E.01641
G1 X187.119 Y201.624 E.71753
G1 X186.586 Y201.624 E.01641
G1 X170.084 Y218.126 E.71753
G1 X169.551 Y218.126 E.01641
G1 X186.052 Y201.624 E.71753
G1 X185.518 Y201.624 E.01641
G1 X169.017 Y218.126 E.71753
G1 X168.484 Y218.126 E.01641
G1 X184.985 Y201.624 E.71753
G1 X184.451 Y201.624 E.01641
G1 X167.95 Y218.126 E.71753
G1 X167.416 Y218.126 E.01641
G1 X183.917 Y201.624 E.71753
G1 X183.384 Y201.624 E.01641
G1 X166.883 Y218.126 E.71753
G1 X166.349 Y218.126 E.01641
G1 X182.85 Y201.624 E.71753
G1 X182.317 Y201.624 E.01641
G1 X165.815 Y218.126 E.71753
G1 X165.282 Y218.126 E.01641
G1 X181.783 Y201.624 E.71753
G1 X181.249 Y201.624 E.01641
G1 X164.748 Y218.126 E.71753
G1 X164.215 Y218.126 E.01641
G1 X180.716 Y201.624 E.71753
G1 X180.182 Y201.624 E.01641
G1 X163.681 Y218.126 E.71753
G1 X163.147 Y218.126 E.01641
G1 X179.648 Y201.624 E.71753
G1 X179.115 Y201.624 E.01641
G1 X162.614 Y218.126 E.71753
G1 X162.08 Y218.126 E.01641
G1 X178.581 Y201.624 E.71753
G1 X178.048 Y201.624 E.01641
G1 X161.546 Y218.126 E.71753
G1 X161.013 Y218.126 E.01641
G1 X177.514 Y201.624 E.71753
G1 X176.98 Y201.624 E.01641
G1 X160.479 Y218.126 E.71753
G1 X159.946 Y218.126 E.01641
G1 X176.447 Y201.624 E.71753
G1 X175.913 Y201.624 E.01641
G1 X159.412 Y218.126 E.71753
G1 X158.878 Y218.126 E.01641
G1 X175.379 Y201.624 E.71753
G1 X174.846 Y201.624 E.01641
G1 X158.345 Y218.126 E.71753
G1 X157.811 Y218.126 E.01641
G1 X174.312 Y201.624 E.71753
G1 X173.779 Y201.624 E.01641
G1 X157.277 Y218.126 E.71753
G1 X156.744 Y218.126 E.01641
G1 X173.245 Y201.624 E.71753
G1 X172.711 Y201.624 E.01641
G1 X156.21 Y218.126 E.71753
G1 X155.677 Y218.126 E.01641
G1 X172.178 Y201.624 E.71753
G1 X171.644 Y201.624 E.01641
G1 X155.143 Y218.126 E.71753
G1 X154.609 Y218.126 E.01641
G1 X171.11 Y201.624 E.71753
G1 X170.577 Y201.624 E.01641
G1 X154.076 Y218.126 E.71753
G1 X153.542 Y218.126 E.01641
G1 X170.043 Y201.624 E.71753
G1 X169.51 Y201.624 E.01641
G1 X153.008 Y218.126 E.71753
G1 X152.475 Y218.126 E.01641
G1 X168.976 Y201.624 E.71753
G1 X168.442 Y201.624 E.01641
G1 X151.941 Y218.126 E.71753
G1 X151.408 Y218.126 E.01641
G1 X167.909 Y201.624 E.71753
G1 X167.375 Y201.624 E.01641
G1 X150.874 Y218.126 E.71753
G1 X150.34 Y218.126 E.01641
G1 X166.841 Y201.624 E.71753
G1 X166.308 Y201.624 E.01641
G1 X149.807 Y218.126 E.71753
G1 X149.273 Y218.126 E.01641
G1 X165.774 Y201.624 E.71753
G1 X165.241 Y201.624 E.01641
G1 X148.739 Y218.126 E.71753
G1 X148.206 Y218.126 E.01641
G1 X164.707 Y201.624 E.71753
G1 X164.173 Y201.624 E.01641
G1 X147.672 Y218.126 E.71753
G1 X147.139 Y218.126 E.01641
G1 X163.64 Y201.624 E.71753
G1 X163.106 Y201.624 E.01641
G1 X146.605 Y218.126 E.71753
G1 X146.071 Y218.126 E.01641
G1 X162.572 Y201.624 E.71753
G1 X162.039 Y201.624 E.01641
G1 X145.538 Y218.126 E.71753
G1 X145.004 Y218.126 E.01641
G1 X161.505 Y201.624 E.71753
G1 X160.972 Y201.624 E.01641
G1 X144.47 Y218.126 E.71753
G1 X143.937 Y218.126 E.01641
G1 X160.438 Y201.624 E.71753
G1 X159.904 Y201.624 E.01641
G1 X143.403 Y218.126 E.71753
G1 X142.87 Y218.126 E.01641
G1 X159.371 Y201.624 E.71753
G1 X158.837 Y201.624 E.01641
G1 X142.336 Y218.126 E.71753
G1 X141.802 Y218.126 E.01641
G1 X158.303 Y201.624 E.71753
G1 X157.77 Y201.624 E.01641
G1 X141.269 Y218.126 E.71753
G1 X140.735 Y218.126 E.01641
G1 X157.236 Y201.624 E.71753
G1 X156.703 Y201.624 E.01641
G1 X140.201 Y218.126 E.71753
G1 X139.668 Y218.126 E.01641
G1 X156.169 Y201.624 E.71753
G1 X155.635 Y201.624 E.01641
G1 X139.134 Y218.126 E.71753
G1 X138.601 Y218.126 E.01641
G1 X155.102 Y201.624 E.71753
G1 X154.568 Y201.624 E.01641
G1 X138.067 Y218.126 E.71753
G1 X137.533 Y218.126 E.01641
G1 X154.034 Y201.624 E.71753
G1 X153.501 Y201.624 E.01641
G1 X137 Y218.126 E.71753
G1 X136.466 Y218.126 E.01641
G1 X152.967 Y201.624 E.71753
G1 X152.434 Y201.624 E.01641
G1 X135.932 Y218.126 E.71753
G1 X135.399 Y218.126 E.01641
G1 X151.9 Y201.624 E.71753
G1 X151.366 Y201.624 E.01641
G1 X134.865 Y218.126 E.71753
G1 X134.332 Y218.126 E.01641
G1 X150.833 Y201.624 E.71753
G1 X150.299 Y201.624 E.01641
G1 X133.798 Y218.126 E.71753
G1 X133.264 Y218.126 E.01641
G1 X149.765 Y201.624 E.71753
G1 X149.232 Y201.624 E.01641
G1 X132.731 Y218.126 E.71753
G1 X132.197 Y218.126 E.01641
G1 X148.698 Y201.624 E.71753
G1 X148.165 Y201.624 E.01641
G1 X131.663 Y218.126 E.71753
G1 X131.13 Y218.126 E.01641
G1 X147.631 Y201.624 E.71753
G1 X147.097 Y201.624 E.01641
G1 X130.596 Y218.126 E.71753
G1 X130.063 Y218.126 E.01641
G1 X146.564 Y201.624 E.71753
G1 X146.03 Y201.624 E.01641
G1 X129.529 Y218.126 E.71753
G1 X128.995 Y218.126 E.01641
G1 X145.496 Y201.624 E.71753
G1 X144.963 Y201.624 E.01641
G1 X128.462 Y218.126 E.71753
G1 X127.928 Y218.126 E.01641
G1 X144.429 Y201.624 E.71753
G1 X143.895 Y201.624 E.01641
G1 X127.394 Y218.126 E.71753
G1 X126.861 Y218.126 E.01641
G1 X143.362 Y201.624 E.71753
G1 X142.828 Y201.624 E.01641
G1 X126.327 Y218.126 E.71753
G1 X125.794 Y218.126 E.01641
G1 X142.295 Y201.624 E.71753
G1 X141.761 Y201.624 E.01641
G1 X125.26 Y218.126 E.71753
G1 X124.726 Y218.126 E.01641
G1 X141.227 Y201.624 E.71753
G1 X140.694 Y201.624 E.01641
G1 X131.392 Y210.926 E.40446
G2 X131.53 Y210.255 I-4.913 J-1.357 E.02109
G1 X140.16 Y201.624 E.37527
G1 X139.626 Y201.624 E.01641
G1 X131.543 Y209.708 E.35149
G2 X131.49 Y209.228 I-2.43 J.028 E.01488
G1 X139.093 Y201.624 E.33061
G1 X138.559 Y201.624 E.01641
G1 X131.384 Y208.8 E.31202
G2 X131.234 Y208.416 I-1.989 J.551 E.0127
G1 X138.026 Y201.624 E.29531
G1 X137.492 Y201.624 E.01641
G1 X131.051 Y208.065 E.28007
G2 X130.837 Y207.746 I-1.705 J.911 E.01185
G1 X136.958 Y201.624 E.26618
G1 X136.425 Y201.624 E.01641
G1 X130.594 Y207.455 E.25355
G2 X130.322 Y207.193 I-1.442 J1.223 E.01162
G1 X135.891 Y201.624 E.24216
G1 X135.357 Y201.624 E.01641
G1 X130.022 Y206.96 E.232
G2 X129.692 Y206.756 I-1.184 J1.547 E.01194
G1 X134.824 Y201.624 E.22314
G1 X134.29 Y201.624 E.01641
G1 X129.331 Y206.584 E.21565
G2 X128.932 Y206.449 I-2.299 J6.156 E.01295
G1 X133.757 Y201.624 E.2098
G1 X133.223 Y201.624 E.01641
G1 X128.486 Y206.361 E.20596
G2 X127.986 Y206.328 I-.401 J2.273 E.01546
G1 X132.689 Y201.624 E.20453
G1 X132.156 Y201.624 E.01641
G1 X127.402 Y206.379 E.20673
G2 X126.654 Y206.593 I.606 J3.529 E.02396
G1 X131.622 Y201.624 E.21603
G1 X131.088 Y201.624 E.01641
G1 X114.587 Y218.126 E.71753
G1 X115.121 Y218.126 E.01641
G1 X124.718 Y208.529 E.41731
G2 X124.502 Y209.279 I3.413 J1.391 E.02405
G1 X115.655 Y218.126 E.3847
G1 X116.188 Y218.126 E.01641
G1 X124.453 Y209.861 E.35937
G2 X124.484 Y210.364 I2.529 J.095 E.0155
G1 X116.722 Y218.126 E.33752
G1 X117.256 Y218.126 E.01641
G1 X124.575 Y210.806 E.31828
G2 X124.711 Y211.204 I2.058 J-.48 E.01295
G1 X117.789 Y218.126 E.30098
G1 X118.323 Y218.126 E.01641
G1 X124.882 Y211.566 E.28522
G2 X125.085 Y211.897 I1.754 J-.851 E.01195
G1 X118.856 Y218.126 E.27085
G1 X119.39 Y218.126 E.01641
G1 X125.318 Y212.197 E.25778
G2 X125.58 Y212.469 I1.493 J-1.173 E.01162
G1 X119.924 Y218.126 E.24595
G1 X120.457 Y218.126 E.01641
G1 X125.87 Y212.713 E.23535
G2 X126.189 Y212.928 I1.231 J-1.485 E.01184
G1 X120.991 Y218.126 E.22601
G1 X121.525 Y218.126 E.01641
G1 X126.539 Y213.112 E.21803
G2 X126.926 Y213.258 I.921 J-1.862 E.01272
G1 X122.058 Y218.126 E.21167
G1 X122.592 Y218.126 E.01641
G1 X127.354 Y213.363 E.20709
G2 X127.831 Y213.42 I.521 J-2.36 E.0148
G1 X123.125 Y218.126 E.20463
G1 X123.659 Y218.126 E.01641
G1 X128.383 Y213.402 E.2054
G2 X129.056 Y213.262 I-.414 J-3.689 E.02117
G1 X124.023 Y218.295 E.21885
G1 X113.884 Y218.295 F30000
G1 F15000
G1 X130.555 Y201.624 E.72491
G1 X130.021 Y201.624 E.01641
G1 X113.52 Y218.126 E.71753
G1 X112.987 Y218.126 E.01641
G1 X129.488 Y201.624 E.71753
G1 X128.954 Y201.624 E.01641
G1 X112.453 Y218.126 E.71753
G1 X111.919 Y218.126 E.01641
G1 X128.42 Y201.624 E.71753
G1 X127.887 Y201.624 E.01641
G1 X111.386 Y218.126 E.71753
G1 X110.852 Y218.126 E.01641
G1 X127.353 Y201.624 E.71753
G1 X126.819 Y201.624 E.01641
G1 X110.318 Y218.126 E.71753
G1 X109.785 Y218.126 E.01641
G1 X126.286 Y201.624 E.71753
G1 X125.752 Y201.624 E.01641
G1 X109.251 Y218.126 E.71753
G1 X108.718 Y218.126 E.01641
G1 X125.219 Y201.624 E.71753
G1 X124.685 Y201.624 E.01641
G1 X108.184 Y218.126 E.71753
G1 X107.65 Y218.126 E.01641
G1 X124.151 Y201.624 E.71753
G1 X123.618 Y201.624 E.01641
G1 X107.117 Y218.126 E.71753
G1 X106.583 Y218.126 E.01641
G1 X123.084 Y201.624 E.71753
G1 X122.55 Y201.624 E.01641
G1 X106.049 Y218.126 E.71753
G1 X105.516 Y218.126 E.01641
G1 X122.017 Y201.624 E.71753
G1 X121.483 Y201.624 E.01641
G1 X104.982 Y218.126 E.71753
G1 X104.449 Y218.126 E.01641
G1 X120.95 Y201.624 E.71753
G1 X120.416 Y201.624 E.01641
G1 X103.915 Y218.126 E.71753
G1 X103.381 Y218.126 E.01641
G1 X119.882 Y201.624 E.71753
G1 X119.349 Y201.624 E.01641
G1 X102.848 Y218.126 E.71753
G1 X102.314 Y218.126 E.01641
G1 X118.815 Y201.624 E.71753
G1 X118.281 Y201.624 E.01641
G1 X101.78 Y218.126 E.71753
G1 X101.247 Y218.126 E.01641
G1 X117.748 Y201.624 E.71753
G1 X117.214 Y201.624 E.01641
G1 X100.713 Y218.126 E.71753
G1 X100.18 Y218.126 E.01641
G1 X116.681 Y201.624 E.71753
G1 X116.147 Y201.624 E.01641
G1 X99.646 Y218.126 E.71753
G1 X99.112 Y218.126 E.01641
G1 X115.613 Y201.624 E.71753
G1 X115.08 Y201.624 E.01641
G1 X98.579 Y218.126 E.71753
G1 X98.045 Y218.126 E.01641
G1 X114.546 Y201.624 E.71753
G1 X114.012 Y201.624 E.01641
G1 X97.511 Y218.126 E.71753
G1 X96.978 Y218.126 E.01641
G1 X113.479 Y201.624 E.71753
G1 X112.945 Y201.624 E.01641
G1 X96.444 Y218.126 E.71753
G1 X95.911 Y218.126 E.01641
G1 X112.412 Y201.624 E.71753
G1 X111.878 Y201.624 E.01641
G1 X95.377 Y218.126 E.71753
G1 X94.843 Y218.126 E.01641
G1 X111.344 Y201.624 E.71753
G1 X110.811 Y201.624 E.01641
G1 X94.31 Y218.126 E.71753
G1 X93.776 Y218.126 E.01641
G1 X110.277 Y201.624 E.71753
G1 X109.743 Y201.624 E.01641
G1 X93.242 Y218.126 E.71753
G1 X92.709 Y218.126 E.01641
G1 X109.21 Y201.624 E.71753
G1 X108.676 Y201.624 E.01641
G1 X92.175 Y218.126 E.71753
G1 X91.642 Y218.126 E.01641
G1 X108.143 Y201.624 E.71753
G1 X107.609 Y201.624 E.01641
G1 X91.108 Y218.126 E.71753
G1 X90.574 Y218.126 E.01641
G1 X107.075 Y201.624 E.71753
G1 X106.542 Y201.624 E.01641
G1 X90.041 Y218.126 E.71753
G1 X89.507 Y218.126 E.01641
G1 X106.008 Y201.624 E.71753
G1 X105.474 Y201.624 E.01641
G1 X88.973 Y218.126 E.71753
G1 X88.44 Y218.126 E.01641
G1 X104.941 Y201.624 E.71753
G1 X104.407 Y201.624 E.01641
G1 X87.906 Y218.126 E.71753
G1 X87.373 Y218.126 E.01641
G1 X103.874 Y201.624 E.71753
G1 X103.34 Y201.624 E.01641
G1 X86.839 Y218.126 E.71753
G1 X86.305 Y218.126 E.01641
G1 X102.806 Y201.624 E.71753
G1 X102.273 Y201.624 E.01641
G1 X85.772 Y218.126 E.71753
G1 X85.238 Y218.126 E.01641
G1 X101.739 Y201.624 E.71753
G1 X101.205 Y201.624 E.01641
G1 X84.704 Y218.126 E.71753
G1 X84.171 Y218.126 E.01641
G1 X100.672 Y201.624 E.71753
G1 X100.138 Y201.624 E.01641
G1 X83.637 Y218.126 E.71753
G1 X83.104 Y218.126 E.01641
G1 X99.605 Y201.624 E.71753
G1 X99.071 Y201.624 E.01641
G1 X82.57 Y218.126 E.71753
G1 X82.036 Y218.126 E.01641
G1 X98.537 Y201.624 E.71753
G1 X98.004 Y201.624 E.01641
G1 X81.503 Y218.126 E.71753
G1 X80.969 Y218.126 E.01641
G1 X97.47 Y201.624 E.71753
G1 X96.936 Y201.624 E.01641
G1 X80.435 Y218.126 E.71753
G1 X79.902 Y218.126 E.01641
G1 X96.403 Y201.624 E.71753
G1 X95.869 Y201.624 E.01641
G1 X79.368 Y218.126 E.71753
G1 X78.835 Y218.126 E.01641
G1 X95.336 Y201.624 E.71753
G1 X94.802 Y201.624 E.01641
G1 X78.301 Y218.126 E.71753
G1 X77.767 Y218.126 E.01641
G1 X94.268 Y201.624 E.71753
G1 X93.735 Y201.624 E.01641
G1 X77.234 Y218.126 E.71753
G1 X76.7 Y218.126 E.01641
G1 X93.201 Y201.624 E.71753
G1 X92.667 Y201.624 E.01641
G1 X76.166 Y218.126 E.71753
G1 X75.633 Y218.126 E.01641
G1 X92.134 Y201.624 E.71753
G1 X91.6 Y201.624 E.01641
G1 X75.099 Y218.126 E.71753
G1 X74.566 Y218.126 E.01641
G1 X91.067 Y201.624 E.71753
G1 X90.533 Y201.624 E.01641
G1 X74.032 Y218.126 E.71753
G1 X73.498 Y218.126 E.01641
G1 X89.999 Y201.624 E.71753
G1 X89.466 Y201.624 E.01641
G1 X72.965 Y218.126 E.71753
G1 X72.431 Y218.126 E.01641
G1 X88.932 Y201.624 E.71753
M73 P87 R7
G1 X88.398 Y201.624 E.01641
G1 X71.897 Y218.126 E.71753
G1 X71.364 Y218.126 E.01641
G1 X87.865 Y201.624 E.71753
G1 X87.331 Y201.624 E.01641
G1 X70.83 Y218.126 E.71753
G1 X70.297 Y218.126 E.01641
G1 X86.798 Y201.624 E.71753
G1 X86.264 Y201.624 E.01641
G1 X69.763 Y218.126 E.71753
G1 X69.229 Y218.126 E.01641
G1 X85.73 Y201.624 E.71753
G1 X85.197 Y201.624 E.01641
G1 X68.696 Y218.126 E.71753
G1 X68.162 Y218.126 E.01641
G1 X84.663 Y201.624 E.71753
G1 X84.129 Y201.624 E.01641
G1 X67.628 Y218.126 E.71753
G1 X67.095 Y218.126 E.01641
G1 X83.596 Y201.624 E.71753
G1 X83.062 Y201.624 E.01641
G1 X66.561 Y218.126 E.71753
G1 X66.028 Y218.126 E.01641
G1 X82.529 Y201.624 E.71753
G1 X81.995 Y201.624 E.01641
G1 X65.494 Y218.126 E.71753
G1 X64.96 Y218.126 E.01641
G1 X81.461 Y201.624 E.71753
G1 X80.928 Y201.624 E.01641
G1 X64.427 Y218.126 E.71753
G1 X63.893 Y218.126 E.01641
G1 X80.394 Y201.624 E.71753
G1 X79.86 Y201.624 E.01641
G1 X63.359 Y218.126 E.71753
G1 X62.826 Y218.126 E.01641
G1 X79.327 Y201.624 E.71753
G1 X78.793 Y201.624 E.01641
G1 X62.292 Y218.126 E.71753
G1 X61.759 Y218.126 E.01641
G1 X78.26 Y201.624 E.71753
G1 X77.726 Y201.624 E.01641
G1 X61.225 Y218.126 E.71753
G1 X60.691 Y218.126 E.01641
G1 X77.192 Y201.624 E.71753
G1 X76.659 Y201.624 E.01641
G1 X60.158 Y218.126 E.71753
G1 X59.624 Y218.126 E.01641
G1 X76.125 Y201.624 E.71753
G1 X75.591 Y201.624 E.01641
G1 X59.09 Y218.126 E.71753
G1 X58.557 Y218.126 E.01641
G1 X75.058 Y201.624 E.71753
G1 X74.524 Y201.624 E.01641
G1 X58.023 Y218.126 E.71753
G1 X57.49 Y218.126 E.01641
G1 X73.991 Y201.624 E.71753
G1 X73.457 Y201.624 E.01641
G1 X56.956 Y218.126 E.71753
G1 X56.422 Y218.126 E.01641
G1 X72.923 Y201.624 E.71753
G1 X72.39 Y201.624 E.01641
G1 X55.889 Y218.126 E.71753
G1 X55.355 Y218.126 E.01641
G1 X71.856 Y201.624 E.71753
G1 X71.322 Y201.624 E.01641
G1 X54.821 Y218.126 E.71753
G1 X54.288 Y218.126 E.01641
G1 X70.789 Y201.624 E.71753
G1 X70.255 Y201.624 E.01641
G1 X53.754 Y218.126 E.71753
G1 X53.221 Y218.126 E.01641
G1 X69.722 Y201.624 E.71753
G1 X69.188 Y201.624 E.01641
G1 X52.687 Y218.126 E.71753
G1 X52.153 Y218.126 E.01641
G1 X68.654 Y201.624 E.71753
G1 X68.121 Y201.624 E.01641
G1 X51.62 Y218.126 E.71753
G1 X51.086 Y218.126 E.01641
G1 X67.587 Y201.624 E.71753
G1 X67.053 Y201.624 E.01641
G1 X50.552 Y218.126 E.71753
G1 X50.019 Y218.126 E.01641
G1 X66.52 Y201.624 E.71753
G1 X65.986 Y201.624 E.01641
G1 X49.485 Y218.126 E.71753
G1 X48.952 Y218.126 E.01641
G1 X65.453 Y201.624 E.71753
G1 X64.919 Y201.624 E.01641
G1 X48.418 Y218.126 E.71753
G1 X47.884 Y218.126 E.01641
G1 X64.385 Y201.624 E.71753
G1 X63.852 Y201.624 E.01641
G1 X47.351 Y218.126 E.71753
G1 X46.817 Y218.126 E.01641
G1 X63.318 Y201.624 E.71753
G1 X62.784 Y201.624 E.01641
G1 X46.283 Y218.126 E.71753
G1 X45.75 Y218.126 E.01641
G1 X62.251 Y201.624 E.71753
G1 X61.717 Y201.624 E.01641
G1 X45.216 Y218.126 E.71753
G1 X44.682 Y218.126 E.01641
G1 X61.184 Y201.624 E.71753
G1 X60.65 Y201.624 E.01641
G1 X44.149 Y218.126 E.71753
G1 X43.615 Y218.126 E.01641
G1 X60.116 Y201.624 E.71753
G1 X59.583 Y201.624 E.01641
G1 X43.082 Y218.126 E.71753
G1 X42.548 Y218.126 E.01641
G1 X47.464 Y213.209 E.21379
G3 X46.753 Y213.387 I-1.25 J-3.489 E.02259
G1 X42.014 Y218.126 E.20605
G1 X41.481 Y218.126 E.01641
G1 X46.181 Y213.425 E.20439
G3 X45.694 Y213.379 I.224 J-4.952 E.01506
G1 X40.947 Y218.126 E.2064
G1 X40.413 Y218.126 E.01641
G1 X45.258 Y213.281 E.21066
G3 X44.864 Y213.142 I.499 J-2.042 E.01288
G1 X39.88 Y218.126 E.21672
G1 X39.346 Y218.126 E.01641
G1 X44.505 Y212.967 E.22433
G3 X44.178 Y212.76 I.87 J-1.735 E.01191
G1 X38.813 Y218.126 E.23332
G1 X38.279 Y218.126 E.01641
G1 X43.883 Y212.522 E.24368
G3 X43.616 Y212.255 I1.205 J-1.472 E.01162
G1 X37.999 Y217.871 E.24424
G1 X37.999 Y217.338 E.01641
G1 X43.378 Y211.959 E.23387
G3 X43.169 Y211.635 I1.513 J-1.202 E.01189
G1 X37.999 Y216.804 E.22479
G1 X37.999 Y216.271 E.01641
G1 X42.992 Y211.278 E.21709
G3 X42.85 Y210.887 I1.886 J-.906 E.01283
G1 X37.999 Y215.737 E.21091
G1 X37.999 Y215.203 E.01641
G1 X42.748 Y210.455 E.20649
G3 X42.703 Y209.966 I4.418 J-.657 E.01508
G1 X37.999 Y214.67 E.20452
G1 X37.999 Y214.136 E.01641
G1 X42.732 Y209.403 E.2058
G3 X42.9 Y208.702 I4.051 J.597 E.02219
G1 X37.999 Y213.602 E.21308
G1 X37.999 Y213.069 E.01641
G1 X54.501 Y196.568 E.71753
G1 X54.501 Y197.101 E.01641
G1 X45.077 Y206.525 E.40976
G3 X45.779 Y206.356 I1.344 J4.051 E.02223
G1 X54.501 Y197.635 E.37922
G1 X54.501 Y198.169 E.01641
G1 X46.34 Y206.33 E.35487
G3 X46.83 Y206.373 I.048 J2.266 E.01517
G1 X54.501 Y198.702 E.33354
G1 X54.501 Y199.236 E.01641
G1 X47.263 Y206.473 E.31471
G3 X47.653 Y206.617 I-.521 J2.022 E.01281
G1 X54.501 Y199.77 E.29774
G1 X54.501 Y200.303 E.01641
G1 X48.009 Y206.795 E.28227
G3 X48.333 Y207.004 I-.884 J1.725 E.01189
G1 X54.501 Y200.837 E.26817
G1 X54.501 Y201.37 E.01641
G1 X48.628 Y207.243 E.25535
G3 X48.895 Y207.51 I-1.202 J1.465 E.01162
G1 X54.78 Y201.624 E.25592
G1 X55.314 Y201.624 E.01641
G1 X49.132 Y207.806 E.26878
G3 X49.341 Y208.131 I-1.522 J1.207 E.01189
G1 X55.847 Y201.624 E.28291
G1 X56.381 Y201.624 E.01641
G1 X49.519 Y208.487 E.2984
G3 X49.657 Y208.882 I-6.855 J2.633 E.01287
G1 X56.915 Y201.624 E.31557
G1 X57.448 Y201.624 E.01641
G1 X49.754 Y209.319 E.33459
G3 X49.798 Y209.808 I-2.426 J.469 E.01512
G1 X57.982 Y201.624 E.35585
G1 X58.515 Y201.624 E.01641
G1 X49.761 Y210.379 E.38066
G3 X49.582 Y211.091 I-3.517 J-.505 E.02264
G1 X59.219 Y201.455 E.41904
; WIPE_START
G1 X57.805 Y202.869 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X50.957 Y206.241 Z3.2 F30000
G1 X37.83 Y212.705 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F15000
G1 X54.501 Y196.034 E.72491
G1 X54.501 Y195.501 E.01641
G1 X37.999 Y212.002 E.71753
G1 X37.999 Y211.468 E.01641
G1 X54.501 Y194.967 E.71753
G1 X54.501 Y194.433 E.01641
G1 X37.999 Y210.934 E.71753
G1 X37.999 Y210.401 E.01641
G1 X54.501 Y193.9 E.71753
G1 X54.501 Y193.366 E.01641
G1 X37.999 Y209.867 E.71753
G1 X37.999 Y209.333 E.01641
G1 X54.501 Y192.832 E.71753
G1 X54.501 Y192.299 E.01641
G1 X37.999 Y208.8 E.71753
G1 X37.999 Y208.266 E.01641
G1 X54.501 Y191.765 E.71753
G1 X54.501 Y191.232 E.01641
G1 X37.999 Y207.733 E.71753
G1 X37.999 Y207.199 E.01641
G1 X54.501 Y190.698 E.71753
G1 X54.501 Y190.164 E.01641
G1 X37.999 Y206.665 E.71753
G1 X37.999 Y206.132 E.01641
G1 X54.501 Y189.631 E.71753
G1 X54.501 Y189.097 E.01641
G1 X37.999 Y205.598 E.71753
G1 X37.999 Y205.064 E.01641
G1 X54.501 Y188.563 E.71753
G1 X54.501 Y188.03 E.01641
G1 X37.999 Y204.531 E.71753
G1 X37.999 Y203.997 E.01641
G1 X54.501 Y187.496 E.71753
G1 X54.501 Y186.963 E.01641
G1 X37.999 Y203.464 E.71753
G1 X37.999 Y202.93 E.01641
G1 X54.501 Y186.429 E.71753
G1 X54.501 Y185.895 E.01641
G1 X37.999 Y202.396 E.71753
G1 X37.999 Y201.863 E.01641
G1 X54.501 Y185.362 E.71753
G1 X54.501 Y184.828 E.01641
G1 X37.999 Y201.329 E.71753
G1 X37.999 Y200.795 E.01641
G1 X54.501 Y184.294 E.71753
G1 X54.501 Y183.761 E.01641
G1 X37.999 Y200.262 E.71753
G1 X37.999 Y199.728 E.01641
G1 X54.501 Y183.227 E.71753
G1 X54.501 Y182.694 E.01641
G1 X37.999 Y199.195 E.71753
G1 X37.999 Y198.661 E.01641
G1 X54.501 Y182.16 E.71753
G1 X54.501 Y181.626 E.01641
G1 X37.999 Y198.127 E.71753
G1 X37.999 Y197.594 E.01641
G1 X54.501 Y181.093 E.71753
G1 X54.501 Y180.559 E.01641
G1 X37.999 Y197.06 E.71753
G1 X37.999 Y196.526 E.01641
G1 X54.501 Y180.025 E.71753
G1 X54.501 Y179.492 E.01641
G1 X37.999 Y195.993 E.71753
G1 X37.999 Y195.459 E.01641
G1 X54.501 Y178.958 E.71753
G1 X54.501 Y178.425 E.01641
G1 X37.999 Y194.926 E.71753
G1 X37.999 Y194.392 E.01641
G1 X54.501 Y177.891 E.71753
G1 X54.501 Y177.357 E.01641
G1 X37.999 Y193.858 E.71753
G1 X37.999 Y193.325 E.01641
G1 X54.501 Y176.824 E.71753
G1 X54.501 Y176.29 E.01641
G1 X37.999 Y192.791 E.71753
G1 X37.999 Y192.257 E.01641
G1 X54.501 Y175.756 E.71753
G1 X54.501 Y175.223 E.01641
G1 X37.999 Y191.724 E.71753
G1 X37.999 Y191.19 E.01641
G1 X54.501 Y174.689 E.71753
G1 X54.501 Y174.156 E.01641
G1 X37.999 Y190.657 E.71753
G1 X37.999 Y190.123 E.01641
G1 X54.501 Y173.622 E.71753
G1 X54.501 Y173.088 E.01641
G1 X37.999 Y189.589 E.71753
G1 X37.999 Y189.056 E.01641
G1 X54.501 Y172.555 E.71753
G1 X54.501 Y172.021 E.01641
G1 X37.999 Y188.522 E.71753
G1 X37.999 Y187.988 E.01641
G1 X54.501 Y171.487 E.71753
G1 X54.501 Y170.954 E.01641
G1 X37.999 Y187.455 E.71753
G1 X37.999 Y186.921 E.01641
G1 X54.501 Y170.42 E.71753
G1 X54.501 Y169.887 E.01641
G1 X37.999 Y186.388 E.71753
G1 X37.999 Y185.854 E.01641
G1 X54.501 Y169.353 E.71753
G1 X54.501 Y168.819 E.01641
G1 X37.999 Y185.32 E.71753
G1 X37.999 Y184.787 E.01641
G1 X54.501 Y168.286 E.71753
G1 X54.501 Y167.752 E.01641
G1 X37.999 Y184.253 E.71753
G1 X37.999 Y183.719 E.01641
G1 X54.501 Y167.218 E.71753
G1 X54.501 Y166.685 E.01641
G1 X37.999 Y183.186 E.71753
G1 X37.999 Y182.652 E.01641
G1 X54.501 Y166.151 E.71753
G1 X54.501 Y165.618 E.01641
G1 X37.999 Y182.119 E.71753
G1 X37.999 Y181.585 E.01641
G1 X54.501 Y165.084 E.71753
G1 X54.501 Y164.55 E.01641
G1 X37.999 Y181.051 E.71753
G1 X37.999 Y180.518 E.01641
G1 X54.501 Y164.017 E.71753
G1 X54.501 Y163.483 E.01641
G1 X37.999 Y179.984 E.71753
G1 X37.999 Y179.45 E.01641
G1 X54.501 Y162.949 E.71753
G1 X54.501 Y162.416 E.01641
G1 X37.999 Y178.917 E.71753
G1 X37.999 Y178.383 E.01641
G1 X54.501 Y161.882 E.71753
G1 X54.501 Y161.349 E.01641
G1 X37.999 Y177.85 E.71753
G1 X37.999 Y177.316 E.01641
G1 X54.501 Y160.815 E.71753
G1 X54.501 Y160.281 E.01641
G1 X37.999 Y176.782 E.71753
G1 X37.999 Y176.249 E.01641
G1 X54.501 Y159.748 E.71753
G1 X54.501 Y159.214 E.01641
G1 X37.999 Y175.715 E.71753
G1 X37.999 Y175.181 E.01641
G1 X54.501 Y158.68 E.71753
G1 X54.501 Y158.147 E.01641
G1 X37.999 Y174.648 E.71753
G1 X37.999 Y174.114 E.01641
G1 X54.501 Y157.613 E.71753
G1 X54.501 Y157.08 E.01641
G1 X37.999 Y173.581 E.71753
G1 X37.999 Y173.047 E.01641
G1 X54.501 Y156.546 E.71753
G1 X54.501 Y156.012 E.01641
G1 X37.999 Y172.513 E.71753
G1 X37.999 Y171.98 E.01641
G1 X54.501 Y155.479 E.71753
G1 X54.501 Y154.945 E.01641
G1 X37.999 Y171.446 E.71753
G1 X37.999 Y170.912 E.01641
G1 X54.501 Y154.411 E.71753
G1 X54.501 Y153.878 E.01641
G1 X37.999 Y170.379 E.71753
G1 X37.999 Y169.845 E.01641
G1 X54.501 Y153.344 E.71753
G1 X54.501 Y152.811 E.01641
G1 X37.999 Y169.312 E.71753
G1 X37.999 Y168.778 E.01641
G1 X54.501 Y152.277 E.71753
G1 X54.501 Y151.743 E.01641
G1 X37.999 Y168.244 E.71753
G1 X37.999 Y167.711 E.01641
G1 X54.501 Y151.21 E.71753
G1 X54.501 Y150.676 E.01641
G1 X37.999 Y167.177 E.71753
G1 X37.999 Y166.643 E.01641
G1 X54.501 Y150.142 E.71753
G1 X54.501 Y149.609 E.01641
G1 X37.999 Y166.11 E.71753
G1 X37.999 Y165.576 E.01641
G1 X54.501 Y149.075 E.71753
G1 X54.501 Y148.542 E.01641
G1 X37.999 Y165.043 E.71753
G1 X37.999 Y164.509 E.01641
G1 X54.501 Y148.008 E.71753
G1 X54.501 Y147.474 E.01641
G1 X37.999 Y163.975 E.71753
G1 X37.999 Y163.442 E.01641
G1 X54.501 Y146.941 E.71753
G1 X54.501 Y146.407 E.01641
G1 X37.999 Y162.908 E.71753
G1 X37.999 Y162.374 E.01641
G1 X54.501 Y145.873 E.71753
G1 X54.501 Y145.34 E.01641
G1 X37.999 Y161.841 E.71753
G1 X37.999 Y161.307 E.01641
G1 X54.501 Y144.806 E.71753
G1 X54.501 Y144.273 E.01641
G1 X37.999 Y160.774 E.71753
G1 X37.999 Y160.24 E.01641
G1 X54.501 Y143.739 E.71753
G1 X54.501 Y143.205 E.01641
G1 X37.999 Y159.706 E.71753
G1 X37.999 Y159.173 E.01641
G1 X54.501 Y142.672 E.71753
G1 X54.501 Y142.138 E.01641
G1 X37.999 Y158.639 E.71753
G1 X37.999 Y158.105 E.01641
G1 X54.501 Y141.604 E.71753
G1 X54.501 Y141.071 E.01641
G1 X37.999 Y157.572 E.71753
G1 X37.999 Y157.038 E.01641
G1 X54.501 Y140.537 E.71753
G1 X54.501 Y140.004 E.01641
G1 X37.999 Y156.505 E.71753
G1 X37.999 Y155.971 E.01641
G1 X54.501 Y139.47 E.71753
G1 X54.501 Y138.936 E.01641
G1 X37.999 Y155.437 E.71753
G1 X37.999 Y154.904 E.01641
G1 X54.501 Y138.403 E.71753
G1 X54.501 Y137.869 E.01641
G1 X37.999 Y154.37 E.71753
G1 X37.999 Y153.836 E.01641
G1 X54.501 Y137.335 E.71753
G1 X54.501 Y136.802 E.01641
G1 X37.999 Y153.303 E.71753
G1 X37.999 Y152.769 E.01641
G1 X54.501 Y136.268 E.71753
G1 X54.501 Y135.735 E.01641
G1 X37.999 Y152.236 E.71753
G1 X37.999 Y151.702 E.01641
G1 X54.501 Y135.201 E.71753
G1 X54.501 Y134.667 E.01641
G1 X37.999 Y151.168 E.71753
G1 X37.999 Y150.635 E.01641
G1 X54.501 Y134.134 E.71753
G1 X54.501 Y133.6 E.01641
G1 X37.999 Y150.101 E.71753
G1 X37.999 Y149.567 E.01641
G1 X54.501 Y133.066 E.71753
G1 X54.501 Y132.533 E.01641
G1 X37.999 Y149.034 E.71753
G1 X37.999 Y148.5 E.01641
G1 X54.501 Y131.999 E.71753
G1 X54.501 Y131.466 E.01641
G1 X37.999 Y147.967 E.71753
G1 X37.999 Y147.433 E.01641
G1 X54.501 Y130.932 E.71753
G1 X54.501 Y130.398 E.01641
G1 X37.999 Y146.899 E.71753
G1 X37.999 Y146.366 E.01641
G1 X54.501 Y129.865 E.71753
G1 X54.501 Y129.331 E.01641
G1 X37.999 Y145.832 E.71753
G1 X37.999 Y145.298 E.01641
G1 X54.501 Y128.797 E.71753
G1 X54.501 Y128.264 E.01641
G1 X37.999 Y144.765 E.71753
G1 X37.999 Y144.231 E.01641
G1 X54.501 Y127.73 E.71753
G1 X54.501 Y127.196 E.01641
G1 X37.999 Y143.698 E.71753
G1 X37.999 Y143.164 E.01641
G1 X54.501 Y126.663 E.71753
G1 X54.501 Y126.129 E.01641
G1 X37.999 Y142.63 E.71753
G1 X37.999 Y142.097 E.01641
G1 X54.501 Y125.596 E.71753
G1 X54.501 Y125.062 E.01641
G1 X37.999 Y141.563 E.71753
G1 X37.999 Y141.029 E.01641
G1 X54.501 Y124.528 E.71753
G1 X54.501 Y123.995 E.01641
G1 X37.999 Y140.496 E.71753
G1 X37.999 Y139.962 E.01641
G1 X54.501 Y123.461 E.71753
G1 X54.501 Y122.927 E.01641
G1 X37.999 Y139.429 E.71753
G1 X37.999 Y138.895 E.01641
G1 X47.622 Y129.273 E.41841
G3 X46.863 Y129.498 I-1.123 J-2.39 E.02444
G1 X37.999 Y138.361 E.3854
G1 X37.999 Y137.828 E.01641
G1 X46.28 Y129.548 E.36005
G3 X45.775 Y129.518 I.012 J-4.537 E.01554
G1 X37.999 Y137.294 E.33812
G1 X37.999 Y136.76 E.01641
G1 X45.333 Y129.427 E.31889
G3 X44.933 Y129.294 I.466 J-2.068 E.01299
G1 X37.999 Y136.227 E.30148
G1 X37.999 Y135.693 E.01641
G1 X44.568 Y129.124 E.28565
G3 X44.237 Y128.922 I.842 J-1.759 E.01196
G1 X37.999 Y135.16 E.27122
G1 X37.999 Y134.626 E.01641
G1 X43.935 Y128.691 E.25809
G3 X43.661 Y128.43 I1.165 J-1.496 E.01162
G1 X37.999 Y134.092 E.2462
G1 X37.999 Y133.559 E.01641
G1 X43.417 Y128.141 E.23556
G3 X43.203 Y127.822 I1.492 J-1.229 E.01185
G1 X37.999 Y133.025 E.22626
G1 X37.999 Y132.491 E.01641
G1 X43.02 Y127.471 E.21833
G3 X42.872 Y127.085 I1.857 J-.933 E.01272
G1 X37.999 Y131.958 E.2119
G1 X37.999 Y131.424 E.01641
G1 X42.764 Y126.659 E.20719
G3 X42.704 Y126.186 I2.328 J-.539 E.01469
G1 X37.999 Y130.891 E.20456
G1 X37.999 Y130.357 E.01641
G1 X42.722 Y125.635 E.20534
G3 X42.857 Y124.966 I3.535 J.366 E.02101
G1 X37.999 Y129.823 E.21121
G1 X37.999 Y129.29 E.01641
G1 X54.501 Y112.789 E.71753
G1 X54.501 Y113.322 E.01641
G1 X45.217 Y122.606 E.40368
G3 X45.886 Y122.47 I1.093 J3.675 E.02102
G1 X54.501 Y113.856 E.37458
G1 X54.501 Y114.389 E.01641
G1 X46.434 Y122.456 E.35077
G3 X46.911 Y122.512 I-.308 J4.652 E.01478
G1 X54.501 Y114.923 E.33001
G1 X54.501 Y115.457 E.01641
G1 X47.335 Y122.622 E.31159
G3 X47.719 Y122.771 I-.551 J1.993 E.0127
G1 X54.501 Y115.99 E.29486
G1 X54.501 Y116.524 E.01641
G1 X48.07 Y122.955 E.27963
G3 X48.389 Y123.169 I-.911 J1.702 E.01184
G1 X54.501 Y117.058 E.26575
G1 X54.501 Y117.591 E.01641
G1 X48.679 Y123.413 E.25314
G3 X48.941 Y123.685 I-1.227 J1.442 E.01162
G1 X54.501 Y118.125 E.24176
G1 X54.501 Y118.658 E.01641
G1 X49.174 Y123.985 E.23162
G3 X49.376 Y124.316 I-9.232 J5.872 E.01194
G1 X54.501 Y119.192 E.22282
G1 X54.501 Y119.726 E.01641
G1 X49.545 Y124.681 E.21549
G3 X49.677 Y125.083 I-1.946 J.862 E.01302
G1 X54.501 Y120.259 E.20975
G1 X54.501 Y120.793 E.01641
G1 X49.766 Y125.527 E.20587
G3 X49.8 Y126.027 I-4.65 J.57 E.0154
G1 X54.501 Y121.327 E.20438
G1 X54.501 Y121.86 E.01641
G1 X49.744 Y126.616 E.20681
G3 X49.527 Y127.367 I-3.893 J-.719 E.02407
G1 X54.67 Y122.224 E.22363
; WIPE_START
G1 X53.256 Y123.638 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.036 Y126.113 Z3.2 F30000
G1 X37.83 Y128.926 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F15000
G1 X54.501 Y112.255 E.72491
G1 X54.501 Y111.721 E.01641
G1 X37.999 Y128.222 E.71753
G1 X37.999 Y127.689 E.01641
G1 X54.501 Y111.188 E.71753
G1 X54.501 Y110.654 E.01641
G1 X37.999 Y127.155 E.71753
G1 X37.999 Y126.622 E.01641
G1 X54.501 Y110.12 E.71753
G1 X54.501 Y109.587 E.01641
G1 X37.999 Y126.088 E.71753
G1 X37.999 Y125.554 E.01641
G1 X54.501 Y109.053 E.71753
G1 X54.501 Y108.52 E.01641
G1 X37.999 Y125.021 E.71753
G1 X37.999 Y124.487 E.01641
G1 X54.501 Y107.986 E.71753
G1 X54.501 Y107.452 E.01641
G1 X37.999 Y123.953 E.71753
G1 X37.999 Y123.42 E.01641
G1 X54.501 Y106.919 E.71753
G1 X54.501 Y106.385 E.01641
G1 X37.999 Y122.886 E.71753
G1 X37.999 Y122.353 E.01641
G1 X54.501 Y105.851 E.71753
G1 X54.501 Y105.318 E.01641
G1 X37.999 Y121.819 E.71753
G1 X37.999 Y121.285 E.01641
G1 X54.501 Y104.784 E.71753
G1 X54.501 Y104.251 E.01641
G1 X37.999 Y120.752 E.71753
G1 X37.999 Y120.218 E.01641
G1 X54.501 Y103.717 E.71753
G1 X54.501 Y103.183 E.01641
G1 X37.999 Y119.684 E.71753
G1 X37.999 Y119.151 E.01641
G1 X54.501 Y102.65 E.71753
G1 X54.501 Y102.116 E.01641
G1 X37.999 Y118.617 E.71753
G1 X37.999 Y118.084 E.01641
G1 X54.501 Y101.582 E.71753
G1 X54.501 Y101.049 E.01641
G1 X37.999 Y117.55 E.71753
G1 X37.999 Y117.016 E.01641
G1 X54.501 Y100.515 E.71753
G1 X54.501 Y99.982 E.01641
G1 X37.999 Y116.483 E.71753
G1 X37.999 Y115.949 E.01641
G1 X54.501 Y99.448 E.71753
G1 X54.501 Y98.914 E.01641
G1 X37.999 Y115.415 E.71753
G1 X37.999 Y114.882 E.01641
G1 X54.501 Y98.381 E.71753
M73 P87 R6
G1 X54.501 Y97.847 E.01641
G1 X37.999 Y114.348 E.71753
G1 X37.999 Y113.815 E.01641
G1 X54.501 Y97.313 E.71753
G1 X54.501 Y96.78 E.01641
G1 X37.999 Y113.281 E.71753
G1 X37.999 Y112.747 E.01641
G1 X54.501 Y96.246 E.71753
G1 X54.501 Y95.713 E.01641
G1 X37.999 Y112.214 E.71753
G1 X37.999 Y111.68 E.01641
G1 X54.501 Y95.179 E.71753
M73 P88 R6
G1 X54.501 Y94.645 E.01641
G1 X37.999 Y111.146 E.71753
G1 X37.999 Y110.613 E.01641
G1 X54.501 Y94.112 E.71753
G1 X54.501 Y93.578 E.01641
G1 X37.999 Y110.079 E.71753
G1 X37.999 Y109.546 E.01641
G1 X54.501 Y93.044 E.71753
G1 X54.501 Y92.511 E.01641
G1 X37.999 Y109.012 E.71753
G1 X37.999 Y108.478 E.01641
G1 X54.501 Y91.977 E.71753
G1 X54.501 Y91.444 E.01641
G1 X37.999 Y107.945 E.71753
G1 X37.999 Y107.411 E.01641
G1 X54.501 Y90.91 E.71753
G1 X54.501 Y90.376 E.01641
G1 X37.999 Y106.877 E.71753
G1 X37.999 Y106.344 E.01641
G1 X54.501 Y89.843 E.71753
G1 X54.501 Y89.309 E.01641
G1 X37.999 Y105.81 E.71753
G1 X37.999 Y105.277 E.01641
G1 X54.501 Y88.775 E.71753
G1 X54.501 Y88.242 E.01641
G1 X37.999 Y104.743 E.71753
G1 X37.999 Y104.209 E.01641
G1 X54.501 Y87.708 E.71753
G1 X54.501 Y87.175 E.01641
G1 X37.999 Y103.676 E.71753
G1 X37.999 Y103.142 E.01641
G1 X54.501 Y86.641 E.71753
G1 X54.501 Y86.107 E.01641
G1 X37.999 Y102.608 E.71753
G1 X37.999 Y102.075 E.01641
G1 X54.501 Y85.574 E.71753
G1 X54.501 Y85.04 E.01641
G1 X37.999 Y101.541 E.71753
G1 X37.999 Y101.008 E.01641
G1 X54.501 Y84.506 E.71753
G1 X54.501 Y83.973 E.01641
G1 X37.999 Y100.474 E.71753
G1 X37.999 Y99.94 E.01641
G1 X54.501 Y83.439 E.71753
G1 X54.501 Y82.906 E.01641
G1 X37.999 Y99.407 E.71753
G1 X37.999 Y98.873 E.01641
G1 X54.501 Y82.372 E.71753
G1 X54.501 Y81.838 E.01641
G1 X37.999 Y98.339 E.71753
G1 X37.999 Y97.806 E.01641
G1 X54.501 Y81.305 E.71753
G1 X54.501 Y80.771 E.01641
G1 X37.999 Y97.272 E.71753
G1 X37.999 Y96.739 E.01641
G1 X54.501 Y80.237 E.71753
G1 X54.501 Y79.704 E.01641
G1 X37.999 Y96.205 E.71753
G1 X37.999 Y95.671 E.01641
G1 X54.501 Y79.17 E.71753
G1 X54.501 Y78.637 E.01641
G1 X37.999 Y95.138 E.71753
G1 X37.999 Y94.604 E.01641
G1 X54.501 Y78.103 E.71753
G1 X54.501 Y77.569 E.01641
G1 X37.999 Y94.07 E.71753
G1 X37.999 Y93.537 E.01641
G1 X54.501 Y77.036 E.71753
G1 X54.501 Y76.502 E.01641
G1 X37.999 Y93.003 E.71753
G1 X37.999 Y92.47 E.01641
G1 X54.501 Y75.968 E.71753
G1 X54.501 Y75.435 E.01641
G1 X37.999 Y91.936 E.71753
G1 X37.999 Y91.402 E.01641
G1 X54.501 Y74.901 E.71753
G1 X54.501 Y74.368 E.01641
G1 X37.999 Y90.869 E.71753
G1 X37.999 Y90.335 E.01641
G1 X54.501 Y73.834 E.71753
G1 X54.501 Y73.3 E.01641
G1 X37.999 Y89.801 E.71753
G1 X37.999 Y89.268 E.01641
G1 X54.501 Y72.767 E.71753
G1 X54.501 Y72.233 E.01641
G1 X37.999 Y88.734 E.71753
G1 X37.999 Y88.201 E.01641
G1 X54.501 Y71.699 E.71753
G1 X54.501 Y71.166 E.01641
G1 X37.999 Y87.667 E.71753
G1 X37.999 Y87.133 E.01641
G1 X54.501 Y70.632 E.71753
G1 X54.501 Y70.099 E.01641
G1 X37.999 Y86.6 E.71753
G1 X37.999 Y86.066 E.01641
G1 X54.501 Y69.565 E.71753
G1 X54.501 Y69.031 E.01641
G1 X37.999 Y85.532 E.71753
G1 X37.999 Y84.999 E.01641
G1 X54.501 Y68.498 E.71753
G1 X54.501 Y67.964 E.01641
G1 X37.999 Y84.465 E.71753
G1 X37.999 Y83.932 E.01641
G1 X54.501 Y67.43 E.71753
G1 X54.501 Y66.897 E.01641
G1 X37.999 Y83.398 E.71753
G1 X37.999 Y82.864 E.01641
G1 X54.501 Y66.363 E.71753
G1 X54.501 Y65.83 E.01641
G1 X37.999 Y82.331 E.71753
G1 X37.999 Y81.797 E.01641
G1 X54.501 Y65.296 E.71753
G1 X54.501 Y64.762 E.01641
G1 X37.999 Y81.263 E.71753
G1 X37.999 Y80.73 E.01641
G1 X54.501 Y64.229 E.71753
G1 X54.501 Y63.695 E.01641
G1 X37.999 Y80.196 E.71753
G1 X37.999 Y79.663 E.01641
G1 X54.501 Y63.161 E.71753
G1 X54.501 Y62.628 E.01641
G1 X37.999 Y79.129 E.71753
G1 X37.999 Y78.595 E.01641
G1 X54.501 Y62.094 E.71753
G1 X54.501 Y61.561 E.01641
G1 X37.999 Y78.062 E.71753
G1 X37.999 Y77.528 E.01641
G1 X54.501 Y61.027 E.71753
G1 X54.501 Y60.493 E.01641
G1 X37.999 Y76.994 E.71753
G1 X37.999 Y76.461 E.01641
G1 X54.501 Y59.96 E.71753
G1 X54.501 Y59.426 E.01641
G1 X37.999 Y75.927 E.71753
G1 X37.999 Y75.394 E.01641
G1 X54.501 Y58.892 E.71753
G1 X54.501 Y58.359 E.01641
G1 X37.999 Y74.86 E.71753
G1 X37.999 Y74.326 E.01641
G1 X54.501 Y57.825 E.71753
G1 X54.501 Y57.292 E.01641
G1 X37.999 Y73.793 E.71753
G1 X37.999 Y73.259 E.01641
G1 X54.501 Y56.758 E.71753
G1 X54.501 Y56.224 E.01641
G1 X37.999 Y72.725 E.71753
G1 X37.999 Y72.192 E.01641
G1 X54.501 Y55.691 E.71753
G1 X54.501 Y55.157 E.01641
G1 X37.999 Y71.658 E.71753
G1 X37.999 Y71.125 E.01641
G1 X54.501 Y54.623 E.71753
G1 X54.501 Y54.09 E.01641
G1 X37.999 Y70.591 E.71753
G1 X37.999 Y70.057 E.01641
G1 X54.501 Y53.556 E.71753
G1 X54.501 Y53.023 E.01641
G1 X37.999 Y69.524 E.71753
G1 X37.999 Y68.99 E.01641
G1 X54.501 Y52.489 E.71753
G1 X54.501 Y51.955 E.01641
G1 X37.999 Y68.456 E.71753
G1 X37.999 Y67.923 E.01641
G1 X54.501 Y51.422 E.71753
G1 X54.501 Y50.888 E.01641
G1 X37.999 Y67.389 E.71753
G1 X37.999 Y66.856 E.01641
G1 X70.981 Y33.874 E1.43414
G1 X71.514 Y33.874 E.01641
G1 X55.013 Y50.376 E.71753
G1 X55.547 Y50.376 E.01641
G1 X72.048 Y33.874 E.71753
G1 X72.581 Y33.874 E.01641
G1 X56.08 Y50.376 E.71753
G1 X56.614 Y50.376 E.01641
G1 X73.115 Y33.874 E.71753
G1 X73.649 Y33.874 E.01641
G1 X57.148 Y50.376 E.71753
G1 X57.681 Y50.376 E.01641
G1 X74.182 Y33.874 E.71753
G1 X74.716 Y33.874 E.01641
G1 X58.215 Y50.376 E.71753
G1 X58.748 Y50.376 E.01641
G1 X75.25 Y33.874 E.71753
G1 X75.783 Y33.874 E.01641
G1 X59.282 Y50.376 E.71753
G1 X59.816 Y50.376 E.01641
G1 X76.317 Y33.874 E.71753
G1 X76.85 Y33.874 E.01641
G1 X60.349 Y50.376 E.71753
G1 X60.883 Y50.376 E.01641
G1 X77.384 Y33.874 E.71753
G1 X77.918 Y33.874 E.01641
G1 X61.417 Y50.376 E.71753
G1 X61.95 Y50.376 E.01641
G1 X78.451 Y33.874 E.71753
G1 X78.985 Y33.874 E.01641
G1 X62.484 Y50.376 E.71753
G1 X63.017 Y50.376 E.01641
G1 X79.519 Y33.874 E.71753
G1 X80.052 Y33.874 E.01641
G1 X63.551 Y50.376 E.71753
G1 X64.085 Y50.376 E.01641
G1 X80.586 Y33.874 E.71753
G1 X81.119 Y33.874 E.01641
G1 X64.618 Y50.376 E.71753
G1 X65.152 Y50.376 E.01641
G1 X81.653 Y33.874 E.71753
G1 X82.187 Y33.874 E.01641
G1 X65.686 Y50.376 E.71753
G1 X66.219 Y50.376 E.01641
G1 X82.72 Y33.874 E.71753
G1 X83.254 Y33.874 E.01641
G1 X66.753 Y50.376 E.71753
G1 X67.286 Y50.376 E.01641
G1 X83.788 Y33.874 E.71753
G1 X84.321 Y33.874 E.01641
G1 X67.82 Y50.376 E.71753
G1 X68.354 Y50.376 E.01641
G1 X84.855 Y33.874 E.71753
G1 X85.388 Y33.874 E.01641
G1 X68.887 Y50.376 E.71753
G1 X69.421 Y50.376 E.01641
G1 X85.922 Y33.874 E.71753
G1 X86.456 Y33.874 E.01641
G1 X69.955 Y50.376 E.71753
G1 X70.488 Y50.376 E.01641
G1 X86.989 Y33.874 E.71753
G1 X87.523 Y33.874 E.01641
G1 X71.022 Y50.376 E.71753
G1 X71.555 Y50.376 E.01641
G1 X88.057 Y33.874 E.71753
G1 X88.59 Y33.874 E.01641
G1 X72.089 Y50.376 E.71753
G1 X72.623 Y50.376 E.01641
G1 X89.124 Y33.874 E.71753
G1 X89.657 Y33.874 E.01641
G1 X73.156 Y50.376 E.71753
G1 X73.69 Y50.376 E.01641
G1 X90.191 Y33.874 E.71753
G1 X90.725 Y33.874 E.01641
G1 X74.224 Y50.376 E.71753
G1 X74.757 Y50.376 E.01641
G1 X91.258 Y33.874 E.71753
G1 X91.792 Y33.874 E.01641
G1 X75.291 Y50.376 E.71753
G1 X75.824 Y50.376 E.01641
G1 X92.326 Y33.874 E.71753
G1 X92.859 Y33.874 E.01641
G1 X90.682 Y36.052 E.09469
G3 X91.292 Y35.976 I.597 J2.292 E.01896
G1 X93.393 Y33.874 E.09136
G1 X93.926 Y33.874 E.01641
G1 X91.825 Y35.976 E.09138
G1 X92.358 Y35.976 E.01639
G1 X94.46 Y33.874 E.0914
G1 X94.994 Y33.874 E.01641
G1 X92.891 Y35.977 E.09142
G1 X93.425 Y35.977 E.01639
G1 X95.527 Y33.874 E.09144
G1 X96.061 Y33.874 E.01641
G1 X93.94 Y35.996 E.09223
G3 X94.348 Y36.092 I-.123 J1.423 E.01294
G1 X94.396 Y36.073 E.0016
G1 X96.595 Y33.874 E.0956
G1 X97.128 Y33.874 E.01641
G1 X95.025 Y35.977 E.09144
G1 X95.559 Y35.977 E.01641
G1 X97.662 Y33.874 E.09144
G1 X98.195 Y33.874 E.01641
G1 X96.092 Y35.977 E.09145
G1 X96.626 Y35.977 E.01641
G1 X98.729 Y33.874 E.09145
G1 X99.263 Y33.874 E.01641
G1 X97.16 Y35.977 E.09145
G1 X97.688 Y35.983 E.01625
G1 X99.796 Y33.874 E.09168
G1 X100.33 Y33.874 E.01641
G1 X98.122 Y36.083 E.09603
G3 X98.491 Y36.247 I-.365 J1.325 E.01248
G1 X100.864 Y33.874 E.10315
G1 X101.397 Y33.874 E.01641
G1 X98.812 Y36.46 E.11241
G3 X99.08 Y36.725 I-1.797 J2.083 E.01161
G1 X101.931 Y33.874 E.12396
G1 X102.464 Y33.874 E.01641
G1 X99.303 Y37.036 E.13748
G3 X99.474 Y37.398 I-1.194 J.788 E.01236
G1 X102.998 Y33.874 E.15322
G1 X103.532 Y33.874 E.01641
G1 X99.579 Y37.828 E.17189
G3 X99.585 Y38.354 I-1.323 J.28 E.01631
G1 X104.065 Y33.874 E.19481
G1 X104.599 Y33.874 E.01641
G1 X99.353 Y39.12 E.22811
G3 X99.199 Y39.374 I-.931 J-.391 E.00916
G3 X99.361 Y39.646 I-.619 J.555 E.00978
G1 X105.133 Y33.874 E.25095
G1 X105.666 Y33.874 E.01641
G1 X99.513 Y40.028 E.26757
G3 X99.594 Y40.481 I-1.13 J.435 E.01423
G1 X106.2 Y33.874 E.28726
G1 X106.733 Y33.874 E.01641
G1 X99.599 Y41.009 E.31023
G1 X99.598 Y41.543 E.01643
G1 X107.267 Y33.874 E.33347
G1 X107.801 Y33.874 E.01641
G1 X99.598 Y42.078 E.3567
G3 X99.529 Y42.679 I-1.559 J.128 E.01874
G1 X108.334 Y33.874 E.38287
G1 X108.868 Y33.874 E.01641
G1 X92.367 Y50.376 E.71753
G1 X92.9 Y50.376 E.01641
G1 X109.402 Y33.874 E.71753
G1 X109.935 Y33.874 E.01641
G1 X93.434 Y50.376 E.71753
G1 X93.968 Y50.376 E.01641
G1 X110.469 Y33.874 E.71753
G1 X111.002 Y33.874 E.01641
G1 X94.501 Y50.376 E.71753
G1 X95.035 Y50.376 E.01641
G1 X111.536 Y33.874 E.71753
G1 X112.07 Y33.874 E.01641
G1 X95.569 Y50.376 E.71753
G1 X96.102 Y50.376 E.01641
G1 X112.603 Y33.874 E.71753
G1 X113.137 Y33.874 E.01641
G1 X96.636 Y50.376 E.71753
G1 X97.17 Y50.376 E.01641
G1 X113.671 Y33.874 E.71753
G1 X114.204 Y33.874 E.01641
G1 X97.703 Y50.376 E.71753
G1 X98.237 Y50.376 E.01641
G1 X114.738 Y33.874 E.71753
G1 X115.271 Y33.874 E.01641
G1 X98.77 Y50.376 E.71753
G1 X99.304 Y50.376 E.01641
G1 X115.805 Y33.874 E.71753
G1 X116.339 Y33.874 E.01641
G1 X99.838 Y50.376 E.71753
G1 X100.371 Y50.376 E.01641
G1 X116.872 Y33.874 E.71753
G1 X117.406 Y33.874 E.01641
G1 X100.905 Y50.376 E.71753
G1 X101.439 Y50.376 E.01641
G1 X117.94 Y33.874 E.71753
G1 X118.473 Y33.874 E.01641
G1 X101.972 Y50.376 E.71753
G1 X102.506 Y50.376 E.01641
G1 X119.007 Y33.874 E.71753
G1 X119.54 Y33.874 E.01641
G1 X103.039 Y50.376 E.71753
G1 X103.573 Y50.376 E.01641
G1 X120.074 Y33.874 E.71753
G1 X120.608 Y33.874 E.01641
G1 X104.107 Y50.376 E.71753
G1 X104.64 Y50.376 E.01641
G1 X121.141 Y33.874 E.71753
G1 X121.675 Y33.874 E.01641
G1 X105.174 Y50.376 E.71753
G1 X105.708 Y50.376 E.01641
G1 X122.209 Y33.874 E.71753
G1 X122.742 Y33.874 E.01641
G1 X106.241 Y50.376 E.71753
G1 X106.775 Y50.376 E.01641
G1 X123.276 Y33.874 E.71753
G1 X123.809 Y33.874 E.01641
G1 X107.308 Y50.376 E.71753
G1 X107.842 Y50.376 E.01641
G1 X124.343 Y33.874 E.71753
G1 X124.877 Y33.874 E.01641
G1 X108.376 Y50.376 E.71753
G1 X108.909 Y50.376 E.01641
G1 X125.41 Y33.874 E.71753
G1 X125.944 Y33.874 E.01641
G1 X109.443 Y50.376 E.71753
G1 X109.977 Y50.376 E.01641
G1 X126.478 Y33.874 E.71753
G1 X127.011 Y33.874 E.01641
G1 X110.51 Y50.376 E.71753
G1 X111.044 Y50.376 E.01641
G1 X127.545 Y33.874 E.71753
G1 X128.078 Y33.874 E.01641
G1 X111.577 Y50.376 E.71753
G1 X112.111 Y50.376 E.01641
G1 X128.612 Y33.874 E.71753
G1 X129.146 Y33.874 E.01641
G1 X112.645 Y50.376 E.71753
G1 X113.178 Y50.376 E.01641
G1 X129.679 Y33.874 E.71753
G1 X130.213 Y33.874 E.01641
G1 X113.712 Y50.376 E.71753
G1 X114.246 Y50.376 E.01641
G1 X130.916 Y33.705 E.72491
G1 X141.055 Y33.705 F30000
G1 F15000
G1 X131.283 Y43.477 E.42494
G2 X131.496 Y42.73 I-3.588 J-1.429 E.02393
G1 X140.352 Y33.874 E.38508
G1 X139.818 Y33.874 E.01641
G1 X131.551 Y42.142 E.3595
G2 X131.515 Y41.644 I-4.943 J.107 E.01535
G1 X139.285 Y33.874 E.33786
G1 X138.751 Y33.874 E.01641
G1 X131.425 Y41.2 E.31856
G2 X131.292 Y40.799 I-2.072 J.463 E.01301
G1 X138.217 Y33.874 E.30112
G1 X137.684 Y33.874 E.01641
G1 X131.123 Y40.435 E.28527
G2 X130.92 Y40.105 I-9.752 J5.784 E.01192
G1 X137.15 Y33.874 E.27092
G1 X136.616 Y33.874 E.01641
G1 X130.686 Y39.805 E.25787
G2 X130.424 Y39.533 I-1.488 J1.173 E.01162
G1 X136.083 Y33.874 E.24606
G1 X135.549 Y33.874 E.01641
G1 X130.134 Y39.29 E.23549
G2 X129.814 Y39.076 I-1.229 J1.491 E.01185
G1 X135.016 Y33.874 E.22619
G1 X134.482 Y33.874 E.01641
G1 X129.463 Y38.893 E.21825
G2 X129.078 Y38.745 I-.934 J1.85 E.01271
G1 X133.948 Y33.874 E.21179
G1 X133.415 Y33.874 E.01641
G1 X128.653 Y38.636 E.20704
G2 X128.175 Y38.581 I-.772 J4.633 E.01483
G1 X132.881 Y33.874 E.20466
G1 X132.347 Y33.874 E.01641
G1 X127.626 Y38.596 E.2053
G2 X126.954 Y38.734 I.452 J3.895 E.02113
G1 X131.814 Y33.874 E.21133
G1 X131.28 Y33.874 E.01641
G1 X114.779 Y50.376 E.71753
G1 X115.313 Y50.376 E.01641
G1 X124.611 Y41.077 E.40432
G2 X124.473 Y41.749 I3.4 J1.05 E.02113
G1 X115.846 Y50.376 E.3751
G1 X116.38 Y50.376 E.01641
G1 X124.453 Y42.303 E.35104
G2 X124.513 Y42.776 I2.396 J-.062 E.01471
G1 X116.914 Y50.376 E.33044
G1 X117.447 Y50.376 E.01641
G1 X124.62 Y43.203 E.31191
G2 X124.768 Y43.589 I2.007 J-.544 E.01273
G1 X117.981 Y50.376 E.29511
G1 X118.515 Y50.376 E.01641
G1 X124.95 Y43.94 E.27982
G2 X125.163 Y44.261 I1.707 J-.906 E.01185
G1 X119.048 Y50.376 E.26589
G1 X119.582 Y50.376 E.01641
G1 X125.407 Y44.551 E.25329
G2 X125.679 Y44.811 I1.44 J-1.233 E.01162
G1 X120.115 Y50.376 E.24194
G1 X120.649 Y50.376 E.01641
G1 X125.981 Y45.044 E.23185
G2 X126.312 Y45.246 I1.176 J-1.553 E.01196
G1 X121.183 Y50.376 E.22305
G1 X121.716 Y50.376 E.01641
G1 X126.676 Y45.416 E.21566
G2 X127.076 Y45.55 I.869 J-1.932 E.01298
G1 X122.25 Y50.376 E.20984
G1 X122.784 Y50.376 E.01641
G1 X127.517 Y45.642 E.20584
G2 X128.02 Y45.673 I.524 J-4.405 E.01549
G1 X123.317 Y50.376 E.20449
G1 X123.851 Y50.376 E.01641
G1 X128.602 Y45.625 E.20659
G2 X129.354 Y45.405 I-.336 J-2.556 E.0242
G1 X124.384 Y50.376 E.21612
G1 X124.918 Y50.376 E.01641
G1 X141.419 Y33.874 E.71753
G1 X141.953 Y33.874 E.01641
G1 X125.452 Y50.376 E.71753
G1 X125.985 Y50.376 E.01641
G1 X142.486 Y33.874 E.71753
G1 X143.02 Y33.874 E.01641
G1 X126.519 Y50.376 E.71753
G1 X127.053 Y50.376 E.01641
G1 X143.554 Y33.874 E.71753
G1 X144.087 Y33.874 E.01641
G1 X127.586 Y50.376 E.71753
G1 X128.12 Y50.376 E.01641
G1 X144.621 Y33.874 E.71753
G1 X145.154 Y33.874 E.01641
G1 X128.653 Y50.376 E.71753
G1 X129.187 Y50.376 E.01641
G1 X145.688 Y33.874 E.71753
G1 X146.222 Y33.874 E.01641
G1 X129.721 Y50.376 E.71753
G1 X130.254 Y50.376 E.01641
G1 X146.755 Y33.874 E.71753
G1 X147.289 Y33.874 E.01641
G1 X130.788 Y50.376 E.71753
G1 X131.322 Y50.376 E.01641
G1 X147.823 Y33.874 E.71753
G1 X148.356 Y33.874 E.01641
G1 X131.855 Y50.376 E.71753
G1 X132.389 Y50.376 E.01641
G1 X148.89 Y33.874 E.71753
G1 X149.423 Y33.874 E.01641
G1 X132.922 Y50.376 E.71753
G1 X133.456 Y50.376 E.01641
G1 X149.957 Y33.874 E.71753
G1 X150.491 Y33.874 E.01641
G1 X133.99 Y50.376 E.71753
G1 X134.523 Y50.376 E.01641
G1 X151.024 Y33.874 E.71753
G1 X151.558 Y33.874 E.01641
G1 X135.057 Y50.376 E.71753
G1 X135.591 Y50.376 E.01641
G1 X152.092 Y33.874 E.71753
G1 X152.625 Y33.874 E.01641
G1 X136.124 Y50.376 E.71753
G1 X136.658 Y50.376 E.01641
G1 X153.159 Y33.874 E.71753
G1 X153.692 Y33.874 E.01641
G1 X137.191 Y50.376 E.71753
G1 X137.725 Y50.376 E.01641
G1 X154.226 Y33.874 E.71753
G1 X154.76 Y33.874 E.01641
G1 X138.259 Y50.376 E.71753
G1 X138.792 Y50.376 E.01641
G1 X155.293 Y33.874 E.71753
G1 X155.827 Y33.874 E.01641
G1 X139.326 Y50.376 E.71753
G1 X139.86 Y50.376 E.01641
G1 X156.361 Y33.874 E.71753
G1 X156.894 Y33.874 E.01641
G1 X140.393 Y50.376 E.71753
G1 X140.927 Y50.376 E.01641
G1 X157.428 Y33.874 E.71753
G1 X157.961 Y33.874 E.01641
G1 X141.46 Y50.376 E.71753
G1 X141.994 Y50.376 E.01641
G1 X158.495 Y33.874 E.71753
G1 X159.029 Y33.874 E.01641
G1 X142.528 Y50.376 E.71753
G1 X143.061 Y50.376 E.01641
G1 X159.562 Y33.874 E.71753
G1 X160.096 Y33.874 E.01641
G1 X143.595 Y50.376 E.71753
G1 X144.129 Y50.376 E.01641
G1 X160.63 Y33.874 E.71753
G1 X161.163 Y33.874 E.01641
G1 X144.662 Y50.376 E.71753
G1 X145.196 Y50.376 E.01641
G1 X161.697 Y33.874 E.71753
G1 X162.23 Y33.874 E.01641
G1 X145.729 Y50.376 E.71753
G1 X146.263 Y50.376 E.01641
G1 X162.764 Y33.874 E.71753
G1 X163.298 Y33.874 E.01641
G1 X146.797 Y50.376 E.71753
G1 X147.33 Y50.376 E.01641
G1 X163.831 Y33.874 E.71753
G1 X164.365 Y33.874 E.01641
G1 X147.864 Y50.376 E.71753
G1 X148.398 Y50.376 E.01641
G1 X164.899 Y33.874 E.71753
G1 X165.432 Y33.874 E.01641
G1 X148.931 Y50.376 E.71753
G1 X149.465 Y50.376 E.01641
G1 X165.966 Y33.874 E.71753
G1 X166.499 Y33.874 E.01641
G1 X149.998 Y50.376 E.71753
G1 X150.532 Y50.376 E.01641
G1 X167.033 Y33.874 E.71753
G1 X167.567 Y33.874 E.01641
G1 X151.066 Y50.376 E.71753
G1 X151.599 Y50.376 E.01641
G1 X168.1 Y33.874 E.71753
G1 X168.634 Y33.874 E.01641
G1 X152.133 Y50.376 E.71753
G1 X152.667 Y50.376 E.01641
G1 X169.168 Y33.874 E.71753
G1 X169.701 Y33.874 E.01641
G1 X153.2 Y50.376 E.71753
G1 X153.734 Y50.376 E.01641
G1 X170.235 Y33.874 E.71753
G1 X170.768 Y33.874 E.01641
G1 X154.267 Y50.376 E.71753
G1 X154.801 Y50.376 E.01641
G1 X171.302 Y33.874 E.71753
G1 X171.836 Y33.874 E.01641
G1 X155.335 Y50.376 E.71753
G1 X155.868 Y50.376 E.01641
G1 X172.369 Y33.874 E.71753
G1 X172.903 Y33.874 E.01641
G1 X156.402 Y50.376 E.71753
G1 X156.936 Y50.376 E.01641
G1 X173.437 Y33.874 E.71753
G1 X173.97 Y33.874 E.01641
G1 X157.469 Y50.376 E.71753
G1 X158.003 Y50.376 E.01641
G1 X174.504 Y33.874 E.71753
G1 X175.037 Y33.874 E.01641
G1 X158.536 Y50.376 E.71753
G1 X159.07 Y50.376 E.01641
G1 X175.571 Y33.874 E.71753
G1 X176.105 Y33.874 E.01641
G1 X159.604 Y50.376 E.71753
G1 X160.137 Y50.376 E.01641
G1 X176.638 Y33.874 E.71753
G1 X177.172 Y33.874 E.01641
G1 X160.671 Y50.376 E.71753
G1 X161.205 Y50.376 E.01641
G1 X177.706 Y33.874 E.71753
G1 X178.239 Y33.874 E.01641
G1 X161.738 Y50.376 E.71753
M73 P89 R6
G1 X162.272 Y50.376 E.01641
G1 X178.773 Y33.874 E.71753
G1 X179.306 Y33.874 E.01641
G1 X162.805 Y50.376 E.71753
G1 X163.339 Y50.376 E.01641
G1 X179.84 Y33.874 E.71753
G1 X180.374 Y33.874 E.01641
G1 X163.873 Y50.376 E.71753
G1 X164.406 Y50.376 E.01641
G1 X180.907 Y33.874 E.71753
G1 X181.441 Y33.874 E.01641
G1 X164.94 Y50.376 E.71753
G1 X165.474 Y50.376 E.01641
G1 X181.975 Y33.874 E.71753
G1 X182.508 Y33.874 E.01641
G1 X166.007 Y50.376 E.71753
G1 X166.541 Y50.376 E.01641
G1 X183.042 Y33.874 E.71753
G1 X183.575 Y33.874 E.01641
G1 X167.074 Y50.376 E.71753
G1 X167.608 Y50.376 E.01641
G1 X184.109 Y33.874 E.71753
G1 X184.643 Y33.874 E.01641
G1 X168.142 Y50.376 E.71753
G1 X168.675 Y50.376 E.01641
G1 X185.176 Y33.874 E.71753
G1 X185.71 Y33.874 E.01641
G1 X169.209 Y50.376 E.71753
G1 X169.743 Y50.376 E.01641
G1 X186.244 Y33.874 E.71753
G1 X186.777 Y33.874 E.01641
G1 X170.276 Y50.376 E.71753
G1 X170.81 Y50.376 E.01641
G1 X187.311 Y33.874 E.71753
G1 X187.844 Y33.874 E.01641
G1 X171.343 Y50.376 E.71753
G1 X171.877 Y50.376 E.01641
G1 X188.378 Y33.874 E.71753
G1 X188.912 Y33.874 E.01641
G1 X172.411 Y50.376 E.71753
G1 X172.944 Y50.376 E.01641
G1 X189.445 Y33.874 E.71753
G1 X189.979 Y33.874 E.01641
G1 X173.478 Y50.376 E.71753
G1 X174.012 Y50.376 E.01641
G1 X190.513 Y33.874 E.71753
G1 X191.046 Y33.874 E.01641
G1 X174.545 Y50.376 E.71753
G1 X175.079 Y50.376 E.01641
G1 X191.58 Y33.874 E.71753
G1 X192.113 Y33.874 E.01641
G1 X175.612 Y50.376 E.71753
G1 X176.146 Y50.376 E.01641
G1 X192.647 Y33.874 E.71753
G1 X193.181 Y33.874 E.01641
G1 X176.68 Y50.376 E.71753
G1 X177.213 Y50.376 E.01641
G1 X193.714 Y33.874 E.71753
G1 X194.248 Y33.874 E.01641
G1 X177.747 Y50.376 E.71753
G1 X178.281 Y50.376 E.01641
G1 X194.782 Y33.874 E.71753
G1 X195.315 Y33.874 E.01641
G1 X178.814 Y50.376 E.71753
G1 X179.348 Y50.376 E.01641
G1 X195.849 Y33.874 E.71753
G1 X196.383 Y33.874 E.01641
G1 X179.881 Y50.376 E.71753
G1 X180.415 Y50.376 E.01641
G1 X196.916 Y33.874 E.71753
G1 X197.45 Y33.874 E.01641
G1 X180.949 Y50.376 E.71753
G1 X181.482 Y50.376 E.01641
G1 X197.983 Y33.874 E.71753
G1 X198.517 Y33.874 E.01641
G1 X182.016 Y50.376 E.71753
G1 X182.55 Y50.376 E.01641
G1 X199.051 Y33.874 E.71753
G1 X199.584 Y33.874 E.01641
G1 X183.083 Y50.376 E.71753
G1 X183.617 Y50.376 E.01641
G1 X200.118 Y33.874 E.71753
G1 X200.652 Y33.874 E.01641
G1 X184.15 Y50.376 E.71753
G1 X184.684 Y50.376 E.01641
G1 X201.185 Y33.874 E.71753
G1 X201.719 Y33.874 E.01641
G1 X185.218 Y50.376 E.71753
G1 X185.751 Y50.376 E.01641
G1 X202.252 Y33.874 E.71753
G1 X202.786 Y33.874 E.01641
G1 X186.285 Y50.376 E.71753
G1 X186.819 Y50.376 E.01641
G1 X203.32 Y33.874 E.71753
G1 X203.853 Y33.874 E.01641
G1 X187.352 Y50.376 E.71753
G1 X187.886 Y50.376 E.01641
G1 X204.387 Y33.874 E.71753
G1 X204.921 Y33.874 E.01641
G1 X188.419 Y50.376 E.71753
G1 X188.953 Y50.376 E.01641
G1 X205.454 Y33.874 E.71753
G1 X205.988 Y33.874 E.01641
G1 X189.487 Y50.376 E.71753
G1 X190.02 Y50.376 E.01641
G1 X206.521 Y33.874 E.71753
G1 X207.055 Y33.874 E.01641
G1 X190.554 Y50.376 E.71753
G1 X191.088 Y50.376 E.01641
G1 X207.589 Y33.874 E.71753
G1 X208.122 Y33.874 E.01641
G1 X191.621 Y50.376 E.71753
G1 X192.155 Y50.376 E.01641
G1 X208.656 Y33.874 E.71753
G1 X209.19 Y33.874 E.01641
G1 X192.688 Y50.376 E.71753
G1 X193.222 Y50.376 E.01641
G1 X209.723 Y33.874 E.71753
G1 X210.257 Y33.874 E.01641
G1 X193.756 Y50.376 E.71753
G1 X194.289 Y50.376 E.01641
G1 X210.79 Y33.874 E.71753
G1 X211.324 Y33.874 E.01641
G1 X194.823 Y50.376 E.71753
G1 X195.357 Y50.376 E.01641
G1 X211.858 Y33.874 E.71753
G1 X212.391 Y33.874 E.01641
G1 X195.721 Y50.545 E.72491
; WIPE_START
G1 X197.135 Y49.131 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X189.542 Y48.357 Z3.2 F30000
G1 X97.356 Y38.955 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.112452
G1 F15000
G1 X97.18 Y38.976 E.001
; LINE_WIDTH: 0.143511
G1 X97.005 Y38.998 E.00145
; WIPE_START
G1 X97.18 Y38.976 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X92.056 Y39.125 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.43086
G1 F15000
G1 X92.95 Y39.125 E.02825
; LINE_WIDTH: 0.407574
G1 X92.984 Y39.102 E.00123
; LINE_WIDTH: 0.361
G1 X93.018 Y39.078 E.00107
; LINE_WIDTH: 0.314427
G1 X93.052 Y39.055 E.00091
; LINE_WIDTH: 0.267853
G1 X93.086 Y39.032 E.00076
; LINE_WIDTH: 0.22128
G1 X93.12 Y39.009 E.0006
; LINE_WIDTH: 0.181153
G1 X93.265 Y38.991 E.00165
; LINE_WIDTH: 0.147457
G1 X93.411 Y38.973 E.00125
; LINE_WIDTH: 0.113761
G1 X93.556 Y38.955 E.00084
G1 X93.306 Y39.322 F30000
; LINE_WIDTH: 0.321628
G1 F15000
G1 X93.187 Y39.257 E.00308
; LINE_WIDTH: 0.365323
G1 X93.068 Y39.191 E.00357
; LINE_WIDTH: 0.409018
G1 X92.95 Y39.125 E.00405
; WIPE_START
G1 X93.068 Y39.191 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X94.084 Y39.257 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.20183
G1 F15000
G1 X94.226 Y39.28 E.00186
; LINE_WIDTH: 0.230606
G1 X94.258 Y39.284 E.0005
; LINE_WIDTH: 0.269897
G1 X94.287 Y39.289 E.00054
; LINE_WIDTH: 0.304508
G1 X94.309 Y39.294 E.00048
; LINE_WIDTH: 0.342086
G3 X94.464 Y39.489 I-1.966 J1.721 E.00608
; LINE_WIDTH: 0.391162
G1 X94.642 Y39.759 E.00917
G1 X94.837 Y40.402 F30000
; LINE_WIDTH: 0.144037
G1 F15000
G1 X95.101 Y40.507 E.00234
G1 X94.438 Y41.06 F30000
; LINE_WIDTH: 0.107112
G1 F15000
G1 X94.366 Y41.09 E.00041
G3 X94.259 Y41.081 I-.045 J-.107 E.00058
; WIPE_START
G1 X94.366 Y41.09 E-.43889
G1 X94.438 Y41.06 E-.32111
; WIPE_END
G1 E-.04 F1800
G1 X92.978 Y41.125 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.410667
G1 F15000
G1 X93.101 Y41.058 E.00419
; LINE_WIDTH: 0.370279
G1 X93.223 Y40.991 E.00373
; LINE_WIDTH: 0.329891
G1 X93.346 Y40.924 E.00327
G1 X93.556 Y41.295 F30000
; LINE_WIDTH: 0.120454
G1 F15000
G1 X93.352 Y41.27 E.0013
; LINE_WIDTH: 0.167522
G1 X93.148 Y41.245 E.00208
; LINE_WIDTH: 0.215023
G1 X93.114 Y41.221 E.00058
; LINE_WIDTH: 0.262987
G1 X93.08 Y41.197 E.00075
; LINE_WIDTH: 0.310951
G1 X93.046 Y41.173 E.00091
; LINE_WIDTH: 0.358915
G1 X93.012 Y41.149 E.00107
; LINE_WIDTH: 0.40688
G1 X92.978 Y41.125 E.00123
; LINE_WIDTH: 0.43086
G1 X92.056 Y41.125 E.02915
; WIPE_START
G1 X92.978 Y41.125 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X91.923 Y48.684 Z3.2 F30000
G1 X91.664 Y50.545 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42025
G1 F15000
G1 X98.002 Y44.206 E.27562
G3 X97.401 Y44.274 I-.564 J-2.286 E.01865
G1 X91.3 Y50.376 E.2653
G1 X90.766 Y50.376 E.01641
G1 X96.868 Y44.274 E.26532
G1 X96.334 Y44.274 E.01639
G1 X90.232 Y50.376 E.26533
G1 X89.699 Y50.376 E.01641
G1 X95.801 Y44.273 E.26535
G1 X95.268 Y44.273 E.01639
G1 X89.165 Y50.376 E.26537
G1 X88.631 Y50.376 E.01641
G1 X94.754 Y44.254 E.26621
G3 X94.36 Y44.153 I.11 J-1.252 E.01254
G1 X94.3 Y44.173 E.00194
G1 X88.098 Y50.376 E.26971
G1 X87.564 Y50.376 E.01641
G1 X93.665 Y44.274 E.2653
G1 X93.132 Y44.274 E.01639
G1 X87.031 Y50.376 E.26531
G1 X86.497 Y50.376 E.01641
G1 X92.599 Y44.274 E.26533
G1 X92.066 Y44.273 E.01639
G1 X85.963 Y50.376 E.26535
G1 X85.43 Y50.376 E.01641
G1 X91.532 Y44.273 E.26537
G1 X91.01 Y44.262 E.01607
G1 X84.896 Y50.376 E.26584
G1 X84.362 Y50.376 E.01641
G1 X90.571 Y44.167 E.26997
G3 X90.204 Y44.001 I.999 J-2.699 E.01241
G1 X83.829 Y50.376 E.2772
G1 X83.295 Y50.376 E.01641
G1 X89.883 Y43.788 E.28647
G3 X89.616 Y43.521 I2.03 J-2.296 E.01161
G1 X82.762 Y50.376 E.29807
G1 X82.228 Y50.376 E.01641
G1 X89.394 Y43.209 E.31162
G3 X89.225 Y42.845 I1.856 J-1.083 E.01237
G1 X81.694 Y50.376 E.32747
G1 X81.161 Y50.376 E.01641
G1 X89.119 Y42.417 E.34606
G1 X89.108 Y41.894 E.01608
G1 X80.627 Y50.376 E.3688
G1 X80.093 Y50.376 E.01641
G1 X89.108 Y41.361 E.39197
G1 X89.107 Y40.829 E.01638
G1 X79.56 Y50.376 E.41514
G1 X79.026 Y50.376 E.01641
G1 X89.106 Y40.296 E.43831
G1 X89.105 Y39.763 E.01638
G1 X78.493 Y50.376 E.46148
G1 X77.959 Y50.376 E.01641
G1 X89.104 Y39.23 E.48464
G1 X89.104 Y38.697 E.01638
G1 X77.425 Y50.376 E.50781
G1 X76.892 Y50.376 E.01641
G1 X89.103 Y38.164 E.53098
G3 X89.173 Y37.561 I1.539 J-.128 E.0188
G1 X76.188 Y50.545 E.5646
G1 X38.599 Y33.705 F30000
G1 F15000
G1 X37.999 Y34.304 E.02607
G1 X37.999 Y34.838 E.01641
G1 X38.963 Y33.874 E.0419
G1 X39.497 Y33.874 E.01641
G1 X37.999 Y35.372 E.0651
G1 X37.999 Y35.905 E.01641
G1 X40.03 Y33.874 E.08831
G1 X40.564 Y33.874 E.01641
G1 X37.999 Y36.439 E.11151
G1 X37.999 Y36.973 E.01641
G1 X41.098 Y33.874 E.13472
G1 X41.631 Y33.874 E.01641
G1 X37.999 Y37.506 E.15792
G1 X37.999 Y38.04 E.01641
G1 X42.165 Y33.874 E.18112
G1 X42.698 Y33.874 E.01641
G1 X37.999 Y38.573 E.20433
G1 X37.999 Y39.107 E.01641
G1 X43.232 Y33.874 E.22753
G1 X43.766 Y33.874 E.01641
G1 X37.999 Y39.641 E.25074
G1 X37.999 Y40.174 E.01641
G1 X44.299 Y33.874 E.27394
G1 X44.833 Y33.874 E.01641
G1 X37.999 Y40.708 E.29714
G1 X37.999 Y41.242 E.01641
G1 X45.367 Y33.874 E.32035
G1 X45.9 Y33.874 E.01641
G1 X37.999 Y41.775 E.34355
G1 X37.999 Y42.309 E.01641
G1 X46.434 Y33.874 E.36676
G1 X46.967 Y33.874 E.01641
G1 X37.999 Y42.842 E.38996
G1 X37.999 Y43.376 E.01641
G1 X47.501 Y33.874 E.41316
G1 X48.035 Y33.874 E.01641
G1 X37.999 Y43.91 E.43637
G1 X37.999 Y44.443 E.01641
G1 X48.568 Y33.874 E.45957
G1 X49.102 Y33.874 E.01641
G1 X37.83 Y45.147 E.49015
G1 X37.83 Y55.285 F30000
G1 F15000
G1 X47.796 Y45.319 E.43339
G3 X46.986 Y45.595 I-1.581 J-3.308 E.02638
G1 X37.999 Y54.582 E.39078
G1 X37.999 Y54.049 E.01641
G1 X46.378 Y45.67 E.36432
G3 X45.861 Y45.653 I-.173 J-2.583 E.01592
G1 X37.999 Y53.515 E.34186
G1 X37.999 Y52.981 E.01641
G1 X45.408 Y45.573 E.32214
G3 X45.001 Y45.446 I.432 J-2.092 E.01311
G1 X37.999 Y52.448 E.30447
G1 X37.999 Y51.914 E.01641
G1 X44.632 Y45.282 E.2884
G3 X44.295 Y45.085 I.814 J-1.782 E.01202
G1 X37.999 Y51.38 E.27375
G1 X37.999 Y50.847 E.01641
G1 X43.988 Y44.858 E.26041
G3 X43.71 Y44.603 I1.14 J-1.519 E.01163
G1 X37.999 Y50.313 E.24831
G1 X37.999 Y49.78 E.01641
G1 X43.46 Y44.319 E.23745
G3 X43.239 Y44.006 I1.453 J-1.261 E.01179
G1 X37.999 Y49.246 E.22785
G1 X37.999 Y48.712 E.01641
G1 X43.049 Y43.663 E.21956
G3 X42.895 Y43.283 I1.821 J-.958 E.01262
G1 X37.999 Y48.179 E.21288
G1 X37.999 Y47.645 E.01641
G1 X42.78 Y42.864 E.20789
G3 X42.712 Y42.398 I2.289 J-.572 E.01449
G1 X37.999 Y47.111 E.20494
G1 X37.999 Y46.578 E.01641
G1 X42.711 Y41.866 E.20487
G3 X42.814 Y41.23 I4.572 J.413 E.01985
G1 X37.999 Y46.044 E.20935
G1 X37.999 Y45.511 E.01641
G1 X49.636 Y33.874 E.50598
G1 X50.169 Y33.874 E.01641
G1 X45.35 Y38.693 E.20953
G3 X45.99 Y38.587 I.909 J3.509 E.01995
G1 X50.703 Y33.874 E.20493
G1 X51.236 Y33.874 E.01641
G1 X46.526 Y38.585 E.20482
G3 X46.989 Y38.655 I-.122 J2.35 E.01442
G1 X51.77 Y33.874 E.20789
G1 X52.304 Y33.874 E.01641
G1 X47.407 Y38.772 E.21294
G3 X47.786 Y38.926 I-.583 J1.97 E.01261
G1 X52.837 Y33.874 E.21967
G1 X53.371 Y33.874 E.01641
G1 X48.131 Y39.115 E.22787
G3 X48.445 Y39.334 I-.939 J1.68 E.0118
G1 X53.905 Y33.874 E.23741
G1 X54.438 Y33.874 E.01641
G1 X48.73 Y39.583 E.24821
G3 X48.985 Y39.861 I-1.26 J1.41 E.01163
G1 X54.972 Y33.874 E.26032
G1 X55.505 Y33.874 E.01641
G1 X49.211 Y40.168 E.27368
G3 X49.407 Y40.506 I-1.589 J1.148 E.01202
G1 X56.039 Y33.874 E.28837
G1 X56.573 Y33.874 E.01641
G1 X49.571 Y40.877 E.30448
G3 X49.696 Y41.284 I-1.978 J.834 E.01314
G1 X57.106 Y33.874 E.32221
G1 X57.64 Y33.874 E.01641
G1 X49.779 Y41.736 E.34184
G3 X49.795 Y42.253 I-4.386 J.4 E.01591
G1 X58.174 Y33.874 E.36432
G1 X58.707 Y33.874 E.01641
G1 X49.724 Y42.858 E.39063
G3 X49.441 Y43.674 I-3.649 J-.807 E.02662
G1 X59.241 Y33.874 E.42613
G1 X59.774 Y33.874 E.01641
G1 X37.999 Y55.649 E.94686
G1 X37.999 Y56.183 E.01641
G1 X60.308 Y33.874 E.97006
G1 X60.842 Y33.874 E.01641
G1 X37.999 Y56.717 E.99326
G1 X37.999 Y57.25 E.01641
G1 X61.375 Y33.874 E1.01647
G1 X61.909 Y33.874 E.01641
G1 X37.999 Y57.784 E1.03967
G1 X37.999 Y58.318 E.01641
G1 X62.443 Y33.874 E1.06288
G1 X62.976 Y33.874 E.01641
G1 X37.999 Y58.851 E1.08608
G1 X37.999 Y59.385 E.01641
G1 X63.51 Y33.874 E1.10928
G1 X64.043 Y33.874 E.01641
G1 X37.999 Y59.918 E1.13249
G1 X37.999 Y60.452 E.01641
G1 X64.577 Y33.874 E1.15569
G1 X65.111 Y33.874 E.01641
G1 X37.999 Y60.986 E1.1789
G1 X37.999 Y61.519 E.01641
G1 X65.644 Y33.874 E1.2021
G1 X66.178 Y33.874 E.01641
G1 X37.999 Y62.053 E1.2253
G1 X37.999 Y62.587 E.01641
G1 X66.712 Y33.874 E1.24851
G1 X67.245 Y33.874 E.01641
G1 X37.999 Y63.12 E1.27171
G1 X37.999 Y63.654 E.01641
G1 X67.779 Y33.874 E1.29492
G1 X68.312 Y33.874 E.01641
G1 X37.999 Y64.187 E1.31812
G1 X37.999 Y64.721 E.01641
G1 X68.846 Y33.874 E1.34132
G1 X69.38 Y33.874 E.01641
G1 X37.999 Y65.255 E1.36453
G1 X37.999 Y65.788 E.01641
G1 X69.913 Y33.874 E1.38773
G1 X70.447 Y33.874 E.01641
G1 X37.83 Y66.492 E1.41831
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X39.244 Y65.077 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/15
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
G17
G3 Z3.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 15
G1 X209.687 Y123.991
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X209.694 Y123.991 E.00019
G3 X209.5 Y124.005 I.053 J2.004 E.38117
G1 X209.627 Y123.996 E.00392
; WIPE_START
M204 S10000
G1 X209.694 Y123.991 E-.02517
G1 X209.9 Y123.995 E-.07842
G1 X210.294 Y124.065 E-.15222
G1 X210.667 Y124.211 E-.15213
G1 X211.003 Y124.428 E-.15215
G1 X211.29 Y124.708 E-.15207
G1 X211.361 Y124.812 E-.04784
; WIPE_END
G1 E-.04 F1800
G1 X211.21 Y117.181 Z3.4 F30000
G1 X209.687 Y40.116 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X209.694 Y40.116 E.00019
G3 X209.5 Y40.13 I.053 J2.004 E.38117
G1 X209.627 Y40.121 E.00392
; WIPE_START
M204 S10000
G1 X209.694 Y40.116 E-.0252
G1 X209.9 Y40.12 E-.07842
G1 X210.294 Y40.19 E-.15223
G1 X210.667 Y40.336 E-.15213
G1 X211.003 Y40.553 E-.15215
G1 X211.29 Y40.833 E-.15211
G1 X211.361 Y40.937 E-.04776
; WIPE_END
G1 E-.04 F1800
G1 X203.729 Y40.862 Z3.4 F30000
G1 X127.938 Y40.116 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X127.944 Y40.116 E.00018
G3 X127.75 Y40.13 I.053 J2.004 E.38117
G1 X127.878 Y40.121 E.00394
; WIPE_START
M204 S10000
G1 X127.944 Y40.116 E-.02504
G1 X128.15 Y40.12 E-.07841
G1 X128.544 Y40.19 E-.15223
G1 X128.917 Y40.336 E-.15213
G1 X129.253 Y40.553 E-.15213
G1 X129.54 Y40.833 E-.15214
G1 X129.611 Y40.937 E-.04791
; WIPE_END
G1 E-.04 F1800
G1 X121.981 Y41.122 Z3.4 F30000
G1 X94.545 Y41.789 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S5000
G3 X95.045 Y41.515 I.509 J.337 E.01821
G1 X96.84 Y41.515 E.05516
G1 X96.84 Y40.87 E.01981
G1 X94.606 Y38.544 E.0991
G3 X94.915 Y37.53 I.445 J-.418 E.0394
G1 X94.994 Y37.517 E.00246
G1 X97.51 Y37.517 E.07732
G3 X97.457 Y38.735 I-.061 J.608 E.05678
G1 X96.481 Y38.735 E.02999
G1 X97.897 Y40.21 E.06282
G3 X98.06 Y40.615 I-.638 J.492 E.01359
G1 X98.058 Y42.185 E.04824
G3 X97.457 Y42.735 I-.614 J-.068 E.02733
G1 X94.99 Y42.733 E.07581
G3 X94.515 Y41.84 I.065 J-.607 E.03662
; WIPE_START
M204 S10000
G1 X94.665 Y41.651 E-.09181
G1 X94.821 Y41.559 E-.06867
G1 X95.045 Y41.515 E-.08685
G1 X96.394 Y41.515 E-.51267
; WIPE_END
G1 E-.04 F1800
M73 P89 R5
G1 X94.159 Y38.459 Z3.4 F30000
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S5000
G3 X93.66 Y38.735 I-.511 J-.335 E.01823
G1 X91.86 Y38.735 E.05532
G1 X91.86 Y39.515 E.02397
G1 X93.26 Y39.515 E.04303
G3 X93.26 Y40.735 I-.021 J.61 E.05761
G1 X91.86 Y40.735 E.04303
G1 X91.86 Y41.515 E.02397
G1 X93.66 Y41.515 E.05532
G3 X93.66 Y42.735 I-.011 J.61 E.05823
G1 X91.195 Y42.733 E.07574
G3 X90.64 Y42.135 I.061 J-.614 E.02739
G1 X90.642 Y38.065 E.12507
G3 X91.131 Y37.526 I.619 J.07 E.02388
G1 X93.71 Y37.517 E.07925
G3 X94.19 Y38.407 I-.062 J.608 E.03661
; WIPE_START
M204 S10000
G1 X94.038 Y38.597 E-.09245
G1 X93.879 Y38.691 E-.0701
G1 X93.66 Y38.735 E-.08468
G1 X92.311 Y38.735 E-.51277
; WIPE_END
G1 E-.04 F1800
G1 X96.547 Y45.084 Z3.4 F30000
G1 X199.96 Y200.085 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X56.04 Y200.085 E4.42226
G1 X56.04 Y51.915 E4.55285
G1 X199.96 Y51.915 E4.42226
G1 X199.96 Y200.025 E4.55101
; WIPE_START
M204 S10000
G1 X197.96 Y200.026 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X192.704 Y194.491 Z3.4 F30000
G1 X46.101 Y40.123 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X46.194 Y40.116 E.00284
G3 X46 Y40.13 I.053 J2.004 E.38117
G1 X46.042 Y40.127 E.00128
; WIPE_START
M204 S10000
G1 X46.194 Y40.116 E-.05793
G1 X46.4 Y40.12 E-.07842
G1 X46.794 Y40.19 E-.15223
G1 X47.167 Y40.336 E-.15213
G1 X47.503 Y40.553 E-.15215
G1 X47.79 Y40.833 E-.15211
G1 X47.812 Y40.866 E-.01503
; WIPE_END
G1 E-.04 F1800
G1 X47.848 Y48.498 Z3.4 F30000
G1 X48.212 Y125.61 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X48.242 Y125.801 E.00594
G3 X46 Y124.005 I-1.996 J.195 E.28875
G1 X46.194 Y123.991 E.00596
G3 X48.164 Y125.41 I.053 J2.004 E.08014
G1 X48.198 Y125.551 E.00448
; WIPE_START
M204 S10000
G1 X48.242 Y125.801 E-.0962
G1 X48.25 Y126.2 E-.15186
G1 X48.171 Y126.592 E-.1521
G1 X48.015 Y126.961 E-.15216
G1 X47.79 Y127.292 E-.1521
G1 X47.685 Y127.394 E-.05558
; WIPE_END
G1 E-.04 F1800
G1 X47.409 Y135.022 Z3.4 F30000
G1 X44.747 Y208.554 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X44.919 Y208.367 E.00782
G3 X46 Y207.88 I1.327 J1.503 E.03697
G1 X46.194 Y207.866 E.00596
G3 X44.647 Y208.661 I.053 J2.004 E.33187
G1 X44.706 Y208.598 E.00265
; WIPE_START
M204 S10000
G1 X44.919 Y208.367 E-.11948
G1 X45.245 Y208.134 E-.15211
G1 X45.61 Y207.969 E-.15213
G1 X46 Y207.88 E-.15214
G1 X46.194 Y207.866 E-.07372
G1 X46.4 Y207.87 E-.07842
G1 X46.483 Y207.885 E-.03201
; WIPE_END
G1 E-.04 F1800
G1 X54.107 Y208.231 Z3.4 F30000
G1 X126.876 Y211.531 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X126.674 Y211.377 E.0078
G3 X127.75 Y207.88 I1.323 J-1.507 E.14159
G1 X127.944 Y207.866 E.00596
G3 X126.999 Y211.609 I.053 J2.004 E.22731
G1 X126.927 Y211.563 E.00262
; WIPE_START
M204 S10000
G1 X126.674 Y211.377 E-.11924
G1 X126.398 Y211.089 E-.15187
G1 X126.189 Y210.747 E-.15213
G1 X126.052 Y210.371 E-.1521
G1 X126.012 Y210.174 E-.07623
G1 X125.998 Y209.889 E-.10845
; WIPE_END
G1 E-.04 F1800
G1 X133.628 Y209.705 Z3.4 F30000
G1 X209.681 Y207.867 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X209.694 Y207.866 E.00039
G3 X209.5 Y207.88 I.053 J2.004 E.38117
G1 X209.621 Y207.871 E.00373
; WIPE_START
M204 S10000
G1 X209.694 Y207.866 E-.02757
G1 X209.9 Y207.87 E-.07842
G1 X210.294 Y207.94 E-.15224
G1 X210.667 Y208.086 E-.15213
G1 X211.003 Y208.303 E-.15215
G1 X211.29 Y208.583 E-.15205
G1 X211.357 Y208.682 E-.04542
; WIPE_END
G1 E-.04 F1800
G1 X215.917 Y214.802 Z3.4 F30000
G1 X219.54 Y219.665 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X36.46 Y219.665 E5.62554
G1 X36.46 Y32.335 E5.75613
G1 X219.54 Y32.335 E5.62554
G1 X219.54 Y219.605 E5.75429
; WIPE_START
M204 S10000
G1 X217.54 Y219.606 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X217.591 Y211.973 Z3.4 F30000
G1 X218.783 Y32.542 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Top surface
G1 F12000
M204 S2000
G1 X219.333 Y33.092 E.02389
G1 X219.333 Y33.625
G1 X218.25 Y32.542 E.04707
G1 X217.716 Y32.542
G1 X219.333 Y34.159 E.07024
G1 X219.333 Y34.692
G1 X217.183 Y32.542 E.09341
G1 X216.65 Y32.542
G1 X219.333 Y35.225 E.11658
G1 X219.333 Y35.759
G1 X216.116 Y32.542 E.13976
G1 X215.583 Y32.542
G1 X219.333 Y36.292 E.16293
G1 X219.333 Y36.825
G1 X215.05 Y32.542 E.1861
G1 X214.517 Y32.542
G1 X219.333 Y37.358 E.20927
G1 X219.333 Y37.892
G1 X213.983 Y32.542 E.23245
G1 X213.45 Y32.542
G1 X219.333 Y38.425 E.25562
G1 X219.333 Y38.958
G1 X212.917 Y32.542 E.27879
G1 X212.384 Y32.542
G1 X219.333 Y39.491 E.30196
G1 X219.333 Y40.025
G1 X211.85 Y32.542 E.32514
G1 X211.317 Y32.542
G1 X219.333 Y40.558 E.34831
G1 X219.333 Y41.091
G1 X210.784 Y32.542 E.37148
G1 X210.251 Y32.542
G1 X219.333 Y41.624 E.39466
G1 X219.333 Y42.158
G1 X209.717 Y32.542 E.41783
G1 X209.184 Y32.542
G1 X219.333 Y42.691 E.441
G1 X219.333 Y43.224
G1 X208.651 Y32.542 E.46417
G1 X208.118 Y32.542
G1 X219.333 Y43.757 E.48735
G1 X219.333 Y44.291
M73 P90 R5
G1 X207.584 Y32.542 E.51052
G1 X207.051 Y32.542
G1 X219.333 Y44.824 E.53369
G1 X219.333 Y45.357
G1 X206.518 Y32.542 E.55686
G1 X205.985 Y32.542
G1 X219.333 Y45.89 E.58004
G1 X219.333 Y46.424
G1 X205.451 Y32.542 E.60321
G1 X204.918 Y32.542
G1 X219.333 Y46.957 E.62638
G1 X219.333 Y47.49
G1 X204.385 Y32.542 E.64955
G1 X203.852 Y32.542
G1 X219.333 Y48.023 E.67273
G1 X219.333 Y48.557
G1 X203.318 Y32.542 E.6959
G1 X202.785 Y32.542
G1 X210.206 Y39.964 E.3225
G1 X209.629 Y39.92
G1 X202.252 Y32.542 E.32058
G1 X201.719 Y32.542
G1 X209.169 Y39.993 E.32377
G1 X208.782 Y40.14
G1 X201.185 Y32.542 E.33013
G1 X200.652 Y32.542
G1 X208.45 Y40.341 E.33887
G1 X208.164 Y40.588
G1 X200.119 Y32.542 E.34962
G1 X199.586 Y32.542
G1 X207.923 Y40.88 E.36232
G1 X207.73 Y41.22
G1 X199.052 Y32.542 E.37709
G1 X198.519 Y32.542
G1 X207.594 Y41.617 E.39435
G1 X207.538 Y42.095
G1 X197.986 Y32.542 E.4151
G1 X197.452 Y32.542
G1 X207.61 Y42.7 E.44139
; WIPE_START
M204 S10000
G1 X206.196 Y41.286 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X211.91 Y41.667 Z3.4 F30000
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X219.333 Y49.09 E.32256
G1 X219.333 Y49.623
G1 X211.958 Y42.248 E.32048
G1 X211.884 Y42.708
G1 X219.333 Y50.156 E.32366
G1 X219.333 Y50.69
G1 X211.737 Y43.094 E.33006
G1 X211.535 Y43.426
G1 X219.333 Y51.223 E.33884
G1 X219.333 Y51.756
G1 X211.287 Y43.71 E.34964
G1 X210.993 Y43.95
G1 X219.333 Y52.289 E.36239
G1 X219.333 Y52.823
G1 X210.652 Y44.142 E.3772
G1 X210.254 Y44.278
G1 X219.333 Y53.356 E.39449
G1 X219.333 Y53.889
G1 X209.777 Y44.334 E.41522
G1 X209.166 Y44.256
G1 X219.333 Y54.423 E.44178
G1 X219.333 Y54.956
G1 X196.919 Y32.542 E.97397
G1 X196.386 Y32.542
G1 X219.333 Y55.489 E.99714
G1 X219.333 Y56.022
G1 X195.853 Y32.542 E1.02032
G1 X195.319 Y32.542
G1 X219.333 Y56.556 E1.04349
G1 X219.333 Y57.089
G1 X194.786 Y32.542 E1.06666
G1 X194.253 Y32.542
G1 X219.333 Y57.622 E1.08983
G1 X219.333 Y58.155
G1 X193.72 Y32.542 E1.11301
G1 X193.186 Y32.542
G1 X219.333 Y58.689 E1.13618
G1 X219.333 Y59.222
G1 X192.653 Y32.542 E1.15935
G1 X192.12 Y32.542
G1 X219.333 Y59.755 E1.18252
G1 X219.333 Y60.288
G1 X191.587 Y32.542 E1.2057
G1 X191.053 Y32.542
G1 X219.333 Y60.822 E1.22887
G1 X219.333 Y61.355
G1 X190.52 Y32.542 E1.25204
G1 X189.987 Y32.542
G1 X219.333 Y61.888 E1.27521
G1 X219.333 Y62.421
G1 X189.454 Y32.542 E1.29839
G1 X188.92 Y32.542
G1 X219.333 Y62.955 E1.32156
G1 X219.333 Y63.488
G1 X188.387 Y32.542 E1.34473
G1 X187.854 Y32.542
G1 X219.333 Y64.021 E1.36791
G1 X219.333 Y64.554
G1 X187.321 Y32.542 E1.39108
G1 X186.787 Y32.542
G1 X219.333 Y65.088 E1.41425
G1 X219.333 Y65.621
G1 X186.254 Y32.542 E1.43742
G1 X185.721 Y32.542
G1 X219.333 Y66.154 E1.4606
G1 X219.333 Y66.687
G1 X185.188 Y32.542 E1.48377
G1 X184.654 Y32.542
G1 X219.333 Y67.221 E1.50694
G1 X219.333 Y67.754
G1 X184.121 Y32.542 E1.53011
G1 X183.588 Y32.542
G1 X219.333 Y68.287 E1.55329
G1 X219.333 Y68.82
G1 X183.055 Y32.542 E1.57646
G1 X182.521 Y32.542
G1 X219.333 Y69.354 E1.59963
G1 X219.333 Y69.887
G1 X181.988 Y32.542 E1.6228
G1 X181.455 Y32.542
G1 X219.333 Y70.42 E1.64598
G1 X219.333 Y70.954
G1 X200.167 Y51.788 E.83282
G1 X200.167 Y52.322
G1 X219.333 Y71.487 E.83282
G1 X219.333 Y72.02
G1 X200.167 Y52.855 E.83282
G1 X200.167 Y53.388
G1 X219.333 Y72.553 E.83282
G1 X219.333 Y73.087
G1 X200.167 Y53.921 E.83282
G1 X200.167 Y54.455
G1 X219.333 Y73.62 E.83282
G1 X219.333 Y74.153
G1 X200.167 Y54.988 E.83282
G1 X200.167 Y55.521
G1 X219.333 Y74.686 E.83282
G1 X219.333 Y75.22
G1 X200.167 Y56.054 E.83282
G1 X200.167 Y56.588
G1 X219.333 Y75.753 E.83282
G1 X219.333 Y76.286
G1 X200.167 Y57.121 E.83282
G1 X200.167 Y57.654
G1 X219.333 Y76.819 E.83282
G1 X219.333 Y77.353
G1 X200.167 Y58.187 E.83282
G1 X200.167 Y58.721
G1 X219.333 Y77.886 E.83282
G1 X219.333 Y78.419
G1 X200.167 Y59.254 E.83282
G1 X200.167 Y59.787
G1 X219.333 Y78.952 E.83282
G1 X219.333 Y79.486
G1 X200.167 Y60.32 E.83282
G1 X200.167 Y60.854
G1 X219.333 Y80.019 E.83282
G1 X219.333 Y80.552
G1 X200.167 Y61.387 E.83282
G1 X200.167 Y61.92
G1 X219.333 Y81.085 E.83282
G1 X219.333 Y81.619
G1 X200.167 Y62.453 E.83282
G1 X200.167 Y62.987
G1 X219.333 Y82.152 E.83282
G1 X219.333 Y82.685
G1 X200.167 Y63.52 E.83282
G1 X200.167 Y64.053
G1 X219.333 Y83.218 E.83282
G1 X219.333 Y83.752
G1 X200.167 Y64.586 E.83282
G1 X200.167 Y65.12
G1 X219.333 Y84.285 E.83282
G1 X219.333 Y84.818
G1 X200.167 Y65.653 E.83282
G1 X200.167 Y66.186
G1 X219.333 Y85.351 E.83282
G1 X219.333 Y85.885
G1 X200.167 Y66.719 E.83282
G1 X200.167 Y67.253
G1 X219.333 Y86.418 E.83282
G1 X219.333 Y86.951
G1 X200.167 Y67.786 E.83282
G1 X200.167 Y68.319
G1 X219.333 Y87.484 E.83282
G1 X219.333 Y88.018
G1 X200.167 Y68.852 E.83282
G1 X200.167 Y69.386
G1 X219.333 Y88.551 E.83282
G1 X219.333 Y89.084
G1 X200.167 Y69.919 E.83282
G1 X200.167 Y70.452
G1 X219.333 Y89.618 E.83282
G1 X219.333 Y90.151
G1 X200.167 Y70.986 E.83282
G1 X200.167 Y71.519
G1 X219.333 Y90.684 E.83282
G1 X219.333 Y91.217
G1 X200.167 Y72.052 E.83282
G1 X200.167 Y72.585
G1 X219.333 Y91.751 E.83282
G1 X219.333 Y92.284
G1 X200.167 Y73.119 E.83282
G1 X200.167 Y73.652
G1 X219.333 Y92.817 E.83282
G1 X219.333 Y93.35
G1 X200.167 Y74.185 E.83282
G1 X200.167 Y74.718
G1 X219.333 Y93.884 E.83282
G1 X219.333 Y94.417
G1 X200.167 Y75.252 E.83282
G1 X200.167 Y75.785
G1 X219.333 Y94.95 E.83282
G1 X219.333 Y95.483
G1 X200.167 Y76.318 E.83282
G1 X200.167 Y76.851
G1 X219.333 Y96.017 E.83282
G1 X219.333 Y96.55
G1 X200.167 Y77.385 E.83282
G1 X200.167 Y77.918
G1 X219.333 Y97.083 E.83282
G1 X219.333 Y97.616
G1 X200.167 Y78.451 E.83282
G1 X200.167 Y78.984
G1 X219.333 Y98.15 E.83282
G1 X219.333 Y98.683
G1 X200.167 Y79.518 E.83282
G1 X200.167 Y80.051
G1 X219.333 Y99.216 E.83282
G1 X219.333 Y99.749
G1 X200.167 Y80.584 E.83282
G1 X200.167 Y81.117
G1 X219.333 Y100.283 E.83282
G1 X219.333 Y100.816
G1 X200.167 Y81.651 E.83282
G1 X200.167 Y82.184
G1 X219.333 Y101.349 E.83282
G1 X219.333 Y101.882
G1 X200.167 Y82.717 E.83282
G1 X200.167 Y83.25
G1 X219.333 Y102.416 E.83282
G1 X219.333 Y102.949
G1 X200.167 Y83.784 E.83282
G1 X200.167 Y84.317
G1 X219.333 Y103.482 E.83282
G1 X219.333 Y104.015
G1 X200.167 Y84.85 E.83282
G1 X200.167 Y85.383
G1 X219.333 Y104.549 E.83282
G1 X219.333 Y105.082
G1 X200.167 Y85.917 E.83282
G1 X200.167 Y86.45
G1 X219.333 Y105.615 E.83282
G1 X219.333 Y106.148
G1 X200.167 Y86.983 E.83282
G1 X200.167 Y87.517
G1 X219.333 Y106.682 E.83282
G1 X219.333 Y107.215
G1 X200.167 Y88.05 E.83282
G1 X200.167 Y88.583
G1 X219.333 Y107.748 E.83282
G1 X219.333 Y108.282
G1 X200.167 Y89.116 E.83282
G1 X200.167 Y89.65
G1 X219.333 Y108.815 E.83282
G1 X219.333 Y109.348
G1 X200.167 Y90.183 E.83282
G1 X200.167 Y90.716
G1 X219.333 Y109.881 E.83282
G1 X219.333 Y110.415
G1 X200.167 Y91.249 E.83282
G1 X200.167 Y91.783
G1 X219.333 Y110.948 E.83282
G1 X219.333 Y111.481
G1 X200.167 Y92.316 E.83282
G1 X200.167 Y92.849
G1 X219.333 Y112.014 E.83282
G1 X219.333 Y112.548
G1 X200.167 Y93.382 E.83282
G1 X200.167 Y93.916
G1 X219.333 Y113.081 E.83282
G1 X219.333 Y113.614
G1 X200.167 Y94.449 E.83282
G1 X200.167 Y94.982
G1 X219.333 Y114.147 E.83282
G1 X219.333 Y114.681
G1 X200.167 Y95.515 E.83282
G1 X200.167 Y96.049
G1 X219.333 Y115.214 E.83282
G1 X219.333 Y115.747
G1 X200.167 Y96.582 E.83282
M73 P91 R5
G1 X200.167 Y97.115
G1 X219.333 Y116.28 E.83282
G1 X219.333 Y116.814
G1 X200.167 Y97.648 E.83282
G1 X200.167 Y98.182
G1 X219.333 Y117.347 E.83282
G1 X219.333 Y117.88
G1 X200.167 Y98.715 E.83282
G1 X200.167 Y99.248
G1 X219.333 Y118.413 E.83282
G1 X219.333 Y118.947
G1 X200.167 Y99.781 E.83282
G1 X200.167 Y100.315
G1 X219.333 Y119.48 E.83282
G1 X219.333 Y120.013
G1 X200.167 Y100.848 E.83282
G1 X200.167 Y101.381
G1 X219.333 Y120.546 E.83282
G1 X219.333 Y121.08
G1 X200.167 Y101.914 E.83282
G1 X200.167 Y102.448
G1 X219.333 Y121.613 E.83282
G1 X219.333 Y122.146
G1 X200.167 Y102.981 E.83282
G1 X200.167 Y103.514
G1 X219.333 Y122.679 E.83282
G1 X219.333 Y123.213
G1 X200.167 Y104.047 E.83282
G1 X200.167 Y104.581
G1 X219.333 Y123.746 E.83282
G1 X219.333 Y124.279
G1 X200.167 Y105.114 E.83282
G1 X200.167 Y105.647
G1 X219.333 Y124.813 E.83282
G1 X219.333 Y125.346
G1 X200.167 Y106.181 E.83282
G1 X200.167 Y106.714
G1 X219.333 Y125.879 E.83282
G1 X219.333 Y126.412
G1 X200.167 Y107.247 E.83282
G1 X200.167 Y107.78
G1 X219.333 Y126.946 E.83282
G1 X219.333 Y127.479
G1 X200.167 Y108.314 E.83282
G1 X200.167 Y108.847
G1 X219.333 Y128.012 E.83282
G1 X219.333 Y128.545
G1 X200.167 Y109.38 E.83282
G1 X200.167 Y109.913
G1 X219.333 Y129.079 E.83282
G1 X219.333 Y129.612
G1 X200.167 Y110.447 E.83282
G1 X200.167 Y110.98
G1 X219.333 Y130.145 E.83282
G1 X219.333 Y130.678
G1 X200.167 Y111.513 E.83282
G1 X200.167 Y112.046
G1 X219.333 Y131.212 E.83282
G1 X219.333 Y131.745
G1 X200.167 Y112.58 E.83282
G1 X200.167 Y113.113
G1 X219.333 Y132.278 E.83282
G1 X219.333 Y132.811
G1 X211.871 Y125.35 E.32425
G1 X211.958 Y125.97
G1 X219.333 Y133.345 E.32048
G1 X219.333 Y133.878
G1 X211.91 Y126.455 E.32254
G1 X211.783 Y126.861
G1 X219.333 Y134.411 E.32808
G1 X219.333 Y134.944
G1 X211.597 Y127.209 E.33613
G1 X211.364 Y127.509
G1 X219.333 Y135.478 E.34626
G1 X219.333 Y136.011
G1 X211.087 Y127.765 E.35833
G1 X210.763 Y127.974
G1 X219.333 Y136.544 E.37241
G1 X219.333 Y137.077
G1 X210.38 Y128.124 E.38905
G1 X209.932 Y128.21
G1 X219.333 Y137.611 E.40852
G1 X219.333 Y138.144
G1 X209.365 Y128.177 E.43313
G1 X208.414 Y127.758
G1 X219.333 Y138.677 E.47448
; WIPE_START
M204 S10000
G1 X217.918 Y137.263 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X214.182 Y130.608 Z3.4 F30000
G1 X210.408 Y123.887 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X200.167 Y113.646 E.445
G1 X200.167 Y114.179
G1 X209.779 Y123.791 E.41767
G1 X209.294 Y123.84
G1 X200.167 Y114.713 E.39661
G1 X200.167 Y115.246
G1 X208.888 Y123.967 E.37897
G1 X208.539 Y124.151
G1 X200.167 Y115.779 E.36381
G1 X200.167 Y116.312
G1 X208.238 Y124.383 E.35072
G1 X207.982 Y124.66
G1 X200.167 Y116.846 E.33957
G1 X200.167 Y117.379
G1 X207.779 Y124.991 E.33078
G1 X207.629 Y125.373
G1 X200.167 Y117.912 E.32423
G1 X200.167 Y118.445
G1 X207.544 Y125.822 E.32056
G1 X207.566 Y126.378
G1 X200.167 Y118.979 E.32152
G1 X200.167 Y119.512
G1 X207.96 Y127.305 E.33863
; WIPE_START
M204 S10000
G1 X206.546 Y125.89 E-.76
; WIPE_END
G1 E-.04 F1800
M73 P91 R4
G1 X200.919 Y120.734 Z3.4 F30000
G1 X200.167 Y120.045 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X219.333 Y139.21 E.83282
G1 X219.333 Y139.744
G1 X200.167 Y120.578 E.83282
G1 X200.167 Y121.112
G1 X219.333 Y140.277 E.83282
G1 X219.333 Y140.81
G1 X200.167 Y121.645 E.83282
G1 X200.167 Y122.178
G1 X219.333 Y141.343 E.83282
G1 X219.333 Y141.877
G1 X200.167 Y122.712 E.83282
G1 X200.167 Y123.245
G1 X219.333 Y142.41 E.83282
G1 X219.333 Y142.943
G1 X200.167 Y123.778 E.83282
G1 X200.167 Y124.311
G1 X219.333 Y143.477 E.83282
G1 X219.333 Y144.01
G1 X200.167 Y124.845 E.83282
G1 X200.167 Y125.378
G1 X219.333 Y144.543 E.83282
G1 X219.333 Y145.076
G1 X200.167 Y125.911 E.83282
G1 X200.167 Y126.444
G1 X219.333 Y145.61 E.83282
G1 X219.333 Y146.143
G1 X200.167 Y126.978 E.83282
G1 X200.167 Y127.511
G1 X219.333 Y146.676 E.83282
G1 X219.333 Y147.209
G1 X200.167 Y128.044 E.83282
G1 X200.167 Y128.577
G1 X219.333 Y147.743 E.83282
G1 X219.333 Y148.276
G1 X200.167 Y129.111 E.83282
G1 X200.167 Y129.644
G1 X219.333 Y148.809 E.83282
G1 X219.333 Y149.342
G1 X200.167 Y130.177 E.83282
G1 X200.167 Y130.71
G1 X219.333 Y149.876 E.83282
G1 X219.333 Y150.409
G1 X200.167 Y131.244 E.83282
G1 X200.167 Y131.777
G1 X219.333 Y150.942 E.83282
G1 X219.333 Y151.475
G1 X200.167 Y132.31 E.83282
G1 X200.167 Y132.843
G1 X219.333 Y152.009 E.83282
G1 X219.333 Y152.542
G1 X200.167 Y133.377 E.83282
G1 X200.167 Y133.91
G1 X219.333 Y153.075 E.83282
G1 X219.333 Y153.608
G1 X200.167 Y134.443 E.83282
G1 X200.167 Y134.976
G1 X219.333 Y154.142 E.83282
G1 X219.333 Y154.675
G1 X200.167 Y135.51 E.83282
G1 X200.167 Y136.043
G1 X219.333 Y155.208 E.83282
G1 X219.333 Y155.741
G1 X200.167 Y136.576 E.83282
G1 X200.167 Y137.109
G1 X219.333 Y156.275 E.83282
G1 X219.333 Y156.808
G1 X200.167 Y137.643 E.83282
G1 X200.167 Y138.176
G1 X219.333 Y157.341 E.83282
G1 X219.333 Y157.874
G1 X200.167 Y138.709 E.83282
G1 X200.167 Y139.242
G1 X219.333 Y158.408 E.83282
G1 X219.333 Y158.941
G1 X200.167 Y139.776 E.83282
G1 X200.167 Y140.309
G1 X219.333 Y159.474 E.83282
G1 X219.333 Y160.008
G1 X200.167 Y140.842 E.83282
G1 X200.167 Y141.376
G1 X219.333 Y160.541 E.83282
G1 X219.333 Y161.074
G1 X200.167 Y141.909 E.83282
G1 X200.167 Y142.442
G1 X219.333 Y161.607 E.83282
G1 X219.333 Y162.141
G1 X200.167 Y142.975 E.83282
G1 X200.167 Y143.509
G1 X219.333 Y162.674 E.83282
G1 X219.333 Y163.207
G1 X200.167 Y144.042 E.83282
G1 X200.167 Y144.575
G1 X219.333 Y163.74 E.83282
G1 X219.333 Y164.274
G1 X200.167 Y145.108 E.83282
G1 X200.167 Y145.642
G1 X219.333 Y164.807 E.83282
G1 X219.333 Y165.34
G1 X200.167 Y146.175 E.83282
G1 X200.167 Y146.708
G1 X219.333 Y165.873 E.83282
G1 X219.333 Y166.407
G1 X200.167 Y147.241 E.83282
G1 X200.167 Y147.775
G1 X219.333 Y166.94 E.83282
G1 X219.333 Y167.473
G1 X200.167 Y148.308 E.83282
G1 X200.167 Y148.841
G1 X219.333 Y168.006 E.83282
G1 X219.333 Y168.54
G1 X200.167 Y149.374 E.83282
G1 X200.167 Y149.908
G1 X219.333 Y169.073 E.83282
G1 X219.333 Y169.606
G1 X200.167 Y150.441 E.83282
G1 X200.167 Y150.974
G1 X219.333 Y170.139 E.83282
G1 X219.333 Y170.673
G1 X200.167 Y151.507 E.83282
G1 X200.167 Y152.041
G1 X219.333 Y171.206 E.83282
G1 X219.333 Y171.739
G1 X200.167 Y152.574 E.83282
G1 X200.167 Y153.107
G1 X219.333 Y172.272 E.83282
G1 X219.333 Y172.806
G1 X200.167 Y153.64 E.83282
G1 X200.167 Y154.174
G1 X219.333 Y173.339 E.83282
G1 X219.333 Y173.872
G1 X200.167 Y154.707 E.83282
G1 X200.167 Y155.24
G1 X219.333 Y174.405 E.83282
G1 X219.333 Y174.939
G1 X200.167 Y155.773 E.83282
G1 X200.167 Y156.307
G1 X219.333 Y175.472 E.83282
G1 X219.333 Y176.005
G1 X200.167 Y156.84 E.83282
G1 X200.167 Y157.373
G1 X219.333 Y176.538 E.83282
G1 X219.333 Y177.072
G1 X200.167 Y157.906 E.83282
G1 X200.167 Y158.44
G1 X219.333 Y177.605 E.83282
G1 X219.333 Y178.138
G1 X200.167 Y158.973 E.83282
G1 X200.167 Y159.506
G1 X219.333 Y178.672 E.83282
G1 X219.333 Y179.205
G1 X200.167 Y160.04 E.83282
G1 X200.167 Y160.573
G1 X219.333 Y179.738 E.83282
G1 X219.333 Y180.271
G1 X200.167 Y161.106 E.83282
G1 X200.167 Y161.639
G1 X219.333 Y180.805 E.83282
G1 X219.333 Y181.338
G1 X200.167 Y162.173 E.83282
G1 X200.167 Y162.706
G1 X219.333 Y181.871 E.83282
G1 X219.333 Y182.404
G1 X200.167 Y163.239 E.83282
G1 X200.167 Y163.772
G1 X219.333 Y182.938 E.83282
G1 X219.333 Y183.471
G1 X200.167 Y164.306 E.83282
G1 X200.167 Y164.839
G1 X219.333 Y184.004 E.83282
G1 X219.333 Y184.537
G1 X200.167 Y165.372 E.83282
G1 X200.167 Y165.905
G1 X219.333 Y185.071 E.83282
G1 X219.333 Y185.604
G1 X200.167 Y166.439 E.83282
G1 X200.167 Y166.972
G1 X219.333 Y186.137 E.83282
G1 X219.333 Y186.67
G1 X200.167 Y167.505 E.83282
G1 X200.167 Y168.038
G1 X219.333 Y187.204 E.83282
G1 X219.333 Y187.737
G1 X200.167 Y168.572 E.83282
M73 P92 R4
G1 X200.167 Y169.105
G1 X219.333 Y188.27 E.83282
G1 X219.333 Y188.803
G1 X200.167 Y169.638 E.83282
G1 X200.167 Y170.171
G1 X219.333 Y189.337 E.83282
G1 X219.333 Y189.87
G1 X200.167 Y170.705 E.83282
G1 X200.167 Y171.238
G1 X219.333 Y190.403 E.83282
G1 X219.333 Y190.936
G1 X200.167 Y171.771 E.83282
G1 X200.167 Y172.304
G1 X219.333 Y191.47 E.83282
G1 X219.333 Y192.003
G1 X200.167 Y172.838 E.83282
G1 X200.167 Y173.371
G1 X219.333 Y192.536 E.83282
G1 X219.333 Y193.069
G1 X200.167 Y173.904 E.83282
G1 X200.167 Y174.437
G1 X219.333 Y193.603 E.83282
G1 X219.333 Y194.136
G1 X200.167 Y174.971 E.83282
G1 X200.167 Y175.504
G1 X219.333 Y194.669 E.83282
G1 X219.333 Y195.202
G1 X200.167 Y176.037 E.83282
G1 X200.167 Y176.571
G1 X219.333 Y195.736 E.83282
G1 X219.333 Y196.269
G1 X200.167 Y177.104 E.83282
G1 X200.167 Y177.637
G1 X219.333 Y196.802 E.83282
G1 X219.333 Y197.336
G1 X200.167 Y178.17 E.83282
G1 X200.167 Y178.704
G1 X219.333 Y197.869 E.83282
G1 X219.333 Y198.402
G1 X200.167 Y179.237 E.83282
G1 X200.167 Y179.77
G1 X219.333 Y198.935 E.83282
G1 X219.333 Y199.469
G1 X200.167 Y180.303 E.83282
G1 X200.167 Y180.837
G1 X219.333 Y200.002 E.83282
G1 X219.333 Y200.535
G1 X200.167 Y181.37 E.83282
G1 X200.167 Y181.903
G1 X219.333 Y201.068 E.83282
G1 X219.333 Y201.602
G1 X200.167 Y182.436 E.83282
G1 X200.167 Y182.97
G1 X219.333 Y202.135 E.83282
G1 X219.333 Y202.668
G1 X200.167 Y183.503 E.83282
G1 X200.167 Y184.036
G1 X219.333 Y203.201 E.83282
G1 X219.333 Y203.735
G1 X200.167 Y184.569 E.83282
G1 X200.167 Y185.103
G1 X219.333 Y204.268 E.83282
G1 X219.333 Y204.801
G1 X200.167 Y185.636 E.83282
G1 X200.167 Y186.169
G1 X219.333 Y205.334 E.83282
G1 X219.333 Y205.868
G1 X200.167 Y186.702 E.83282
G1 X200.167 Y187.236
G1 X219.333 Y206.401 E.83282
G1 X219.333 Y206.934
G1 X200.167 Y187.769 E.83282
G1 X200.167 Y188.302
G1 X219.333 Y207.467 E.83282
G1 X219.333 Y208.001
G1 X200.167 Y188.835 E.83282
G1 X200.167 Y189.369
G1 X219.333 Y208.534 E.83282
G1 X219.333 Y209.067
G1 X200.167 Y189.902 E.83282
G1 X200.167 Y190.435
G1 X219.333 Y209.6 E.83282
G1 X219.333 Y210.134
G1 X200.167 Y190.968 E.83282
G1 X200.167 Y191.502
G1 X219.333 Y210.667 E.83282
G1 X219.333 Y211.2
G1 X200.167 Y192.035 E.83282
G1 X200.167 Y192.568
G1 X219.333 Y211.733 E.83282
G1 X219.333 Y212.267
G1 X200.167 Y193.101 E.83282
G1 X200.167 Y193.635
G1 X219.333 Y212.8 E.83282
G1 X219.333 Y213.333
G1 X200.167 Y194.168 E.83282
G1 X200.167 Y194.701
G1 X219.333 Y213.867 E.83282
G1 X219.333 Y214.4
G1 X200.167 Y195.235 E.83282
G1 X200.167 Y195.768
G1 X219.333 Y214.933 E.83282
G1 X219.333 Y215.466
G1 X200.167 Y196.301 E.83282
G1 X200.167 Y196.834
G1 X219.333 Y216 E.83282
G1 X219.333 Y216.533
G1 X211.76 Y208.96 E.32906
G1 X211.958 Y209.691
G1 X219.333 Y217.066 E.32048
G1 X219.333 Y217.599
G1 X211.936 Y210.203 E.32142
G1 X211.828 Y210.628
G1 X219.333 Y218.133 E.3261
G1 X219.333 Y218.666
G1 X211.66 Y210.993 E.33342
G1 X211.442 Y211.308
G1 X219.333 Y219.199 E.34288
G1 X219.058 Y219.458
G1 X211.172 Y211.572 E.34268
G1 X210.856 Y211.789
G1 X218.525 Y219.458 E.33325
G1 X217.991 Y219.458
G1 X210.49 Y211.956 E.32597
G1 X210.062 Y212.062
G1 X217.458 Y219.458 E.32139
G1 X216.925 Y219.458
G1 X209.545 Y212.078 E.32067
G1 X208.804 Y211.87
G1 X216.392 Y219.458 E.32971
; WIPE_START
M204 S10000
G1 X214.977 Y218.043 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X211.998 Y211.016 Z3.4 F30000
G1 X210.661 Y207.861 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X200.167 Y197.368 E.45598
G1 X200.167 Y197.901
G1 X209.932 Y207.665 E.42432
G1 X209.419 Y207.686
G1 X200.167 Y198.434 E.40204
G1 X200.167 Y198.967
G1 X208.994 Y207.794 E.38356
G1 X208.629 Y207.962
G1 X200.167 Y199.501 E.36769
G1 X200.167 Y200.034
G1 X208.319 Y208.185 E.35421
G1 X208.056 Y208.455
G1 X199.893 Y200.292 E.35472
G1 X199.359 Y200.292
G1 X207.838 Y208.771 E.36842
G1 X207.67 Y209.136
G1 X198.826 Y200.292 E.38429
G1 X198.293 Y200.292
G1 X207.564 Y209.564 E.40289
G1 X207.55 Y210.083
G1 X197.76 Y200.292 E.42544
G1 X197.226 Y200.292
G1 X207.739 Y210.805 E.45684
; WIPE_START
M204 S10000
G1 X206.325 Y209.391 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X211.573 Y214.933 Z3.4 F30000
G1 X215.858 Y219.458 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X196.693 Y200.292 E.83282
G1 X196.16 Y200.292
G1 X215.325 Y219.458 E.83282
G1 X214.792 Y219.458
G1 X195.627 Y200.292 E.83282
G1 X195.093 Y200.292
G1 X214.259 Y219.458 E.83282
G1 X213.725 Y219.458
G1 X194.56 Y200.292 E.83282
G1 X194.027 Y200.292
G1 X213.192 Y219.458 E.83282
G1 X212.659 Y219.458
G1 X193.494 Y200.292 E.83282
G1 X192.96 Y200.292
G1 X212.126 Y219.458 E.83282
G1 X211.592 Y219.458
G1 X192.427 Y200.292 E.83282
G1 X191.894 Y200.292
G1 X211.059 Y219.458 E.83282
G1 X210.526 Y219.458
G1 X191.361 Y200.292 E.83282
G1 X190.827 Y200.292
G1 X209.993 Y219.458 E.83282
G1 X209.459 Y219.458
G1 X190.294 Y200.292 E.83282
G1 X189.761 Y200.292
G1 X208.926 Y219.458 E.83282
G1 X208.393 Y219.458
G1 X189.228 Y200.292 E.83282
G1 X188.694 Y200.292
G1 X207.859 Y219.458 E.83282
G1 X207.326 Y219.458
G1 X188.161 Y200.292 E.83282
G1 X187.628 Y200.292
G1 X206.793 Y219.458 E.83282
G1 X206.26 Y219.458
G1 X187.094 Y200.292 E.83282
G1 X186.561 Y200.292
G1 X205.726 Y219.458 E.83282
G1 X205.193 Y219.458
G1 X186.028 Y200.292 E.83282
G1 X185.495 Y200.292
G1 X204.66 Y219.458 E.83282
G1 X204.127 Y219.458
G1 X184.961 Y200.292 E.83282
G1 X184.428 Y200.292
G1 X203.593 Y219.458 E.83282
G1 X203.06 Y219.458
G1 X183.895 Y200.292 E.83282
G1 X183.362 Y200.292
G1 X202.527 Y219.458 E.83282
G1 X201.994 Y219.458
G1 X182.828 Y200.292 E.83282
G1 X182.295 Y200.292
G1 X201.46 Y219.458 E.83282
G1 X200.927 Y219.458
G1 X181.762 Y200.292 E.83282
G1 X181.229 Y200.292
G1 X200.394 Y219.458 E.83282
G1 X199.861 Y219.458
G1 X180.695 Y200.292 E.83282
G1 X180.162 Y200.292
G1 X199.327 Y219.458 E.83282
G1 X198.794 Y219.458
G1 X179.629 Y200.292 E.83282
G1 X179.096 Y200.292
G1 X198.261 Y219.458 E.83282
G1 X197.728 Y219.458
G1 X178.562 Y200.292 E.83282
G1 X178.029 Y200.292
G1 X197.194 Y219.458 E.83282
G1 X196.661 Y219.458
G1 X177.496 Y200.292 E.83282
G1 X176.963 Y200.292
G1 X196.128 Y219.458 E.83282
G1 X195.595 Y219.458
G1 X176.429 Y200.292 E.83282
G1 X175.896 Y200.292
G1 X195.061 Y219.458 E.83282
G1 X194.528 Y219.458
G1 X175.363 Y200.292 E.83282
G1 X174.83 Y200.292
G1 X193.995 Y219.458 E.83282
G1 X193.462 Y219.458
G1 X174.296 Y200.292 E.83282
G1 X173.763 Y200.292
G1 X192.928 Y219.458 E.83282
G1 X192.395 Y219.458
G1 X173.23 Y200.292 E.83282
G1 X172.697 Y200.292
G1 X191.862 Y219.458 E.83282
G1 X191.329 Y219.458
G1 X172.163 Y200.292 E.83282
G1 X171.63 Y200.292
G1 X190.795 Y219.458 E.83282
G1 X190.262 Y219.458
G1 X171.097 Y200.292 E.83282
G1 X170.563 Y200.292
G1 X189.729 Y219.458 E.83282
G1 X189.195 Y219.458
G1 X170.03 Y200.292 E.83282
G1 X169.497 Y200.292
G1 X188.662 Y219.458 E.83282
G1 X188.129 Y219.458
G1 X168.964 Y200.292 E.83282
G1 X168.43 Y200.292
G1 X187.596 Y219.458 E.83282
G1 X187.062 Y219.458
G1 X167.897 Y200.292 E.83282
G1 X167.364 Y200.292
G1 X186.529 Y219.458 E.83282
G1 X185.996 Y219.458
G1 X166.831 Y200.292 E.83282
G1 X166.297 Y200.292
G1 X185.463 Y219.458 E.83282
G1 X184.929 Y219.458
G1 X165.764 Y200.292 E.83282
G1 X165.231 Y200.292
G1 X184.396 Y219.458 E.83282
G1 X183.863 Y219.458
G1 X164.698 Y200.292 E.83282
G1 X164.164 Y200.292
G1 X183.33 Y219.458 E.83282
G1 X182.796 Y219.458
G1 X163.631 Y200.292 E.83282
G1 X163.098 Y200.292
G1 X182.263 Y219.458 E.83282
G1 X181.73 Y219.458
G1 X162.565 Y200.292 E.83282
G1 X162.031 Y200.292
G1 X181.197 Y219.458 E.83282
G1 X180.663 Y219.458
G1 X161.498 Y200.292 E.83282
G1 X160.965 Y200.292
G1 X180.13 Y219.458 E.83282
G1 X179.597 Y219.458
G1 X160.432 Y200.292 E.83282
G1 X159.898 Y200.292
G1 X179.064 Y219.458 E.83282
M73 P93 R4
G1 X178.53 Y219.458
G1 X159.365 Y200.292 E.83282
G1 X158.832 Y200.292
G1 X177.997 Y219.458 E.83282
G1 X177.464 Y219.458
G1 X158.299 Y200.292 E.83282
G1 X157.765 Y200.292
G1 X176.931 Y219.458 E.83282
G1 X176.397 Y219.458
G1 X157.232 Y200.292 E.83282
G1 X156.699 Y200.292
G1 X175.864 Y219.458 E.83282
G1 X175.331 Y219.458
G1 X156.166 Y200.292 E.83282
G1 X155.632 Y200.292
G1 X174.798 Y219.458 E.83282
G1 X174.264 Y219.458
G1 X155.099 Y200.292 E.83282
G1 X154.566 Y200.292
G1 X173.731 Y219.458 E.83282
G1 X173.198 Y219.458
G1 X154.033 Y200.292 E.83282
G1 X153.499 Y200.292
G1 X172.664 Y219.458 E.83282
G1 X172.131 Y219.458
G1 X152.966 Y200.292 E.83282
G1 X152.433 Y200.292
G1 X171.598 Y219.458 E.83282
G1 X171.065 Y219.458
G1 X151.899 Y200.292 E.83282
G1 X151.366 Y200.292
G1 X170.531 Y219.458 E.83282
G1 X169.998 Y219.458
G1 X150.833 Y200.292 E.83282
G1 X150.3 Y200.292
G1 X169.465 Y219.458 E.83282
G1 X168.932 Y219.458
G1 X149.766 Y200.292 E.83282
M73 P93 R3
G1 X149.233 Y200.292
G1 X168.398 Y219.458 E.83282
G1 X167.865 Y219.458
G1 X148.7 Y200.292 E.83282
G1 X148.167 Y200.292
G1 X167.332 Y219.458 E.83282
G1 X166.799 Y219.458
G1 X147.633 Y200.292 E.83282
G1 X147.1 Y200.292
G1 X166.265 Y219.458 E.83282
G1 X165.732 Y219.458
G1 X146.567 Y200.292 E.83282
G1 X146.034 Y200.292
G1 X165.199 Y219.458 E.83282
G1 X164.666 Y219.458
G1 X145.5 Y200.292 E.83282
G1 X144.967 Y200.292
G1 X164.132 Y219.458 E.83282
G1 X163.599 Y219.458
G1 X144.434 Y200.292 E.83282
G1 X143.901 Y200.292
G1 X163.066 Y219.458 E.83282
G1 X162.533 Y219.458
G1 X143.367 Y200.292 E.83282
G1 X142.834 Y200.292
G1 X161.999 Y219.458 E.83282
G1 X161.466 Y219.458
G1 X142.301 Y200.292 E.83282
G1 X141.768 Y200.292
G1 X160.933 Y219.458 E.83282
G1 X160.4 Y219.458
G1 X141.234 Y200.292 E.83282
G1 X140.701 Y200.292
G1 X159.866 Y219.458 E.83282
G1 X159.333 Y219.458
G1 X140.168 Y200.292 E.83282
G1 X139.635 Y200.292
G1 X158.8 Y219.458 E.83282
G1 X158.267 Y219.458
G1 X139.101 Y200.292 E.83282
G1 X138.568 Y200.292
G1 X157.733 Y219.458 E.83282
G1 X157.2 Y219.458
G1 X138.035 Y200.292 E.83282
G1 X137.502 Y200.292
G1 X156.667 Y219.458 E.83282
G1 X156.134 Y219.458
G1 X136.968 Y200.292 E.83282
G1 X136.435 Y200.292
G1 X155.6 Y219.458 E.83282
G1 X155.067 Y219.458
G1 X135.902 Y200.292 E.83282
G1 X135.368 Y200.292
G1 X154.534 Y219.458 E.83282
G1 X154 Y219.458
G1 X134.835 Y200.292 E.83282
G1 X134.302 Y200.292
G1 X153.467 Y219.458 E.83282
G1 X152.934 Y219.458
G1 X133.769 Y200.292 E.83282
G1 X133.235 Y200.292
G1 X152.401 Y219.458 E.83282
G1 X151.867 Y219.458
G1 X132.702 Y200.292 E.83282
G1 X132.169 Y200.292
G1 X151.334 Y219.458 E.83282
G1 X150.801 Y219.458
G1 X131.636 Y200.292 E.83282
G1 X131.102 Y200.292
G1 X150.268 Y219.458 E.83282
G1 X149.734 Y219.458
G1 X130.569 Y200.292 E.83282
G1 X130.036 Y200.292
G1 X149.201 Y219.458 E.83282
G1 X148.668 Y219.458
G1 X129.503 Y200.292 E.83282
G1 X128.969 Y200.292
G1 X148.135 Y219.458 E.83282
G1 X147.601 Y219.458
G1 X128.436 Y200.292 E.83282
G1 X127.903 Y200.292
G1 X147.068 Y219.458 E.83282
G1 X146.535 Y219.458
G1 X127.37 Y200.292 E.83282
G1 X126.836 Y200.292
G1 X146.002 Y219.458 E.83282
G1 X145.468 Y219.458
G1 X126.303 Y200.292 E.83282
G1 X125.77 Y200.292
G1 X144.935 Y219.458 E.83282
G1 X144.402 Y219.458
G1 X125.237 Y200.292 E.83282
G1 X124.703 Y200.292
G1 X143.869 Y219.458 E.83282
G1 X143.335 Y219.458
G1 X124.17 Y200.292 E.83282
G1 X123.637 Y200.292
G1 X142.802 Y219.458 E.83282
G1 X142.269 Y219.458
G1 X123.104 Y200.292 E.83282
G1 X122.57 Y200.292
G1 X141.736 Y219.458 E.83282
G1 X141.202 Y219.458
G1 X122.037 Y200.292 E.83282
G1 X121.504 Y200.292
G1 X129.294 Y208.083 E.33853
G1 X128.378 Y207.7
G1 X120.971 Y200.292 E.3219
G1 X120.437 Y200.292
G1 X127.816 Y207.671 E.32065
G1 X127.367 Y207.755
G1 X119.904 Y200.292 E.32429
G1 X119.371 Y200.292
G1 X126.988 Y207.91 E.33101
G1 X126.663 Y208.117
G1 X118.838 Y200.292 E.34004
G1 X118.304 Y200.292
G1 X126.383 Y208.372 E.35108
G1 X126.149 Y208.67
G1 X117.771 Y200.292 E.36406
G1 X117.238 Y200.292
G1 X125.963 Y209.017 E.37915
G1 X125.835 Y209.423
G1 X116.704 Y200.292 E.39679
G1 X116.171 Y200.292
G1 X125.791 Y209.913 E.41805
G1 X125.897 Y210.551
G1 X115.638 Y200.292 E.44579
; WIPE_START
M204 S10000
G1 X117.052 Y201.707 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.77 Y205.329 Z3.4 F30000
G1 X129.784 Y208.572 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X140.669 Y219.458 E.47302
G1 X140.136 Y219.458
G1 X130.176 Y209.498 E.4328
G1 X130.208 Y210.063
G1 X139.603 Y219.458 E.40825
G1 X139.069 Y219.458
G1 X130.124 Y210.512 E.38874
G1 X129.968 Y210.89
G1 X138.536 Y219.458 E.37232
G1 X138.003 Y219.458
G1 X129.759 Y211.214 E.35823
G1 X129.504 Y211.492
G1 X137.469 Y219.458 E.34614
G1 X136.936 Y219.458
G1 X129.204 Y211.725 E.336
G1 X128.856 Y211.911
G1 X136.403 Y219.458 E.32795
G1 X135.87 Y219.458
G1 X128.45 Y212.037 E.32244
G1 X127.961 Y212.082
G1 X135.336 Y219.458 E.32049
G1 X134.803 Y219.458
G1 X127.333 Y211.987 E.32463
; WIPE_START
M204 S10000
G1 X128.747 Y213.401 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X133.89 Y219.041 Z3.4 F30000
G1 X134.27 Y219.458 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X115.105 Y200.292 E.83282
G1 X114.571 Y200.292
G1 X133.737 Y219.458 E.83282
G1 X133.203 Y219.458
G1 X114.038 Y200.292 E.83282
G1 X113.505 Y200.292
G1 X132.67 Y219.458 E.83282
G1 X132.137 Y219.458
G1 X112.972 Y200.292 E.83282
G1 X112.438 Y200.292
G1 X131.604 Y219.458 E.83282
G1 X131.07 Y219.458
G1 X111.905 Y200.292 E.83282
G1 X111.372 Y200.292
G1 X130.537 Y219.458 E.83282
G1 X130.004 Y219.458
G1 X110.839 Y200.292 E.83282
G1 X110.305 Y200.292
G1 X129.471 Y219.458 E.83282
G1 X128.937 Y219.458
G1 X109.772 Y200.292 E.83282
G1 X109.239 Y200.292
G1 X128.404 Y219.458 E.83282
G1 X127.871 Y219.458
G1 X108.706 Y200.292 E.83282
G1 X108.172 Y200.292
G1 X127.338 Y219.458 E.83282
G1 X126.804 Y219.458
G1 X107.639 Y200.292 E.83282
G1 X107.106 Y200.292
G1 X126.271 Y219.458 E.83282
G1 X125.738 Y219.458
G1 X106.573 Y200.292 E.83282
G1 X106.039 Y200.292
G1 X125.205 Y219.458 E.83282
G1 X124.671 Y219.458
G1 X105.506 Y200.292 E.83282
G1 X104.973 Y200.292
G1 X124.138 Y219.458 E.83282
G1 X123.605 Y219.458
G1 X104.44 Y200.292 E.83282
G1 X103.906 Y200.292
G1 X123.072 Y219.458 E.83282
G1 X122.538 Y219.458
G1 X103.373 Y200.292 E.83282
G1 X102.84 Y200.292
G1 X122.005 Y219.458 E.83282
G1 X121.472 Y219.458
G1 X102.307 Y200.292 E.83282
G1 X101.773 Y200.292
G1 X120.939 Y219.458 E.83282
G1 X120.405 Y219.458
G1 X101.24 Y200.292 E.83282
G1 X100.707 Y200.292
G1 X119.872 Y219.458 E.83282
G1 X119.339 Y219.458
G1 X100.173 Y200.292 E.83282
G1 X99.64 Y200.292
G1 X118.805 Y219.458 E.83282
G1 X118.272 Y219.458
G1 X99.107 Y200.292 E.83282
G1 X98.574 Y200.292
G1 X117.739 Y219.458 E.83282
G1 X117.206 Y219.458
G1 X98.04 Y200.292 E.83282
G1 X97.507 Y200.292
G1 X116.672 Y219.458 E.83282
G1 X116.139 Y219.458
G1 X96.974 Y200.292 E.83282
G1 X96.441 Y200.292
G1 X115.606 Y219.458 E.83282
G1 X115.073 Y219.458
G1 X95.907 Y200.292 E.83282
G1 X95.374 Y200.292
G1 X114.539 Y219.458 E.83282
G1 X114.006 Y219.458
G1 X94.841 Y200.292 E.83282
G1 X94.308 Y200.292
G1 X113.473 Y219.458 E.83282
G1 X112.94 Y219.458
G1 X93.774 Y200.292 E.83282
G1 X93.241 Y200.292
G1 X112.406 Y219.458 E.83282
G1 X111.873 Y219.458
G1 X92.708 Y200.292 E.83282
G1 X92.175 Y200.292
G1 X111.34 Y219.458 E.83282
G1 X110.807 Y219.458
G1 X91.641 Y200.292 E.83282
G1 X91.108 Y200.292
G1 X110.273 Y219.458 E.83282
G1 X109.74 Y219.458
G1 X90.575 Y200.292 E.83282
G1 X90.042 Y200.292
G1 X109.207 Y219.458 E.83282
G1 X108.674 Y219.458
G1 X89.508 Y200.292 E.83282
G1 X88.975 Y200.292
G1 X108.14 Y219.458 E.83282
G1 X107.607 Y219.458
G1 X88.442 Y200.292 E.83282
G1 X87.909 Y200.292
G1 X107.074 Y219.458 E.83282
M73 P94 R3
G1 X106.541 Y219.458
G1 X87.375 Y200.292 E.83282
G1 X86.842 Y200.292
G1 X106.007 Y219.458 E.83282
G1 X105.474 Y219.458
G1 X86.309 Y200.292 E.83282
G1 X85.776 Y200.292
G1 X104.941 Y219.458 E.83282
G1 X104.408 Y219.458
G1 X85.242 Y200.292 E.83282
G1 X84.709 Y200.292
G1 X103.874 Y219.458 E.83282
G1 X103.341 Y219.458
G1 X84.176 Y200.292 E.83282
G1 X83.643 Y200.292
G1 X102.808 Y219.458 E.83282
G1 X102.275 Y219.458
G1 X83.109 Y200.292 E.83282
G1 X82.576 Y200.292
G1 X101.741 Y219.458 E.83282
G1 X101.208 Y219.458
G1 X82.043 Y200.292 E.83282
G1 X81.509 Y200.292
G1 X100.675 Y219.458 E.83282
G1 X100.141 Y219.458
G1 X80.976 Y200.292 E.83282
G1 X80.443 Y200.292
G1 X99.608 Y219.458 E.83282
G1 X99.075 Y219.458
G1 X79.91 Y200.292 E.83282
G1 X79.376 Y200.292
G1 X98.542 Y219.458 E.83282
G1 X98.008 Y219.458
G1 X78.843 Y200.292 E.83282
G1 X78.31 Y200.292
G1 X97.475 Y219.458 E.83282
G1 X96.942 Y219.458
G1 X77.777 Y200.292 E.83282
G1 X77.243 Y200.292
G1 X96.409 Y219.458 E.83282
G1 X95.875 Y219.458
G1 X76.71 Y200.292 E.83282
G1 X76.177 Y200.292
G1 X95.342 Y219.458 E.83282
G1 X94.809 Y219.458
G1 X75.644 Y200.292 E.83282
G1 X75.11 Y200.292
G1 X94.276 Y219.458 E.83282
G1 X93.742 Y219.458
G1 X74.577 Y200.292 E.83282
G1 X74.044 Y200.292
G1 X93.209 Y219.458 E.83282
G1 X92.676 Y219.458
G1 X73.511 Y200.292 E.83282
G1 X72.977 Y200.292
G1 X92.143 Y219.458 E.83282
G1 X91.609 Y219.458
G1 X72.444 Y200.292 E.83282
G1 X71.911 Y200.292
G1 X91.076 Y219.458 E.83282
G1 X90.543 Y219.458
G1 X71.378 Y200.292 E.83282
G1 X70.844 Y200.292
G1 X90.01 Y219.458 E.83282
G1 X89.476 Y219.458
G1 X70.311 Y200.292 E.83282
G1 X69.778 Y200.292
G1 X88.943 Y219.458 E.83282
G1 X88.41 Y219.458
G1 X69.245 Y200.292 E.83282
G1 X68.711 Y200.292
G1 X87.877 Y219.458 E.83282
G1 X87.343 Y219.458
G1 X68.178 Y200.292 E.83282
G1 X67.645 Y200.292
G1 X86.81 Y219.458 E.83282
G1 X86.277 Y219.458
G1 X67.112 Y200.292 E.83282
G1 X66.578 Y200.292
G1 X85.744 Y219.458 E.83282
G1 X85.21 Y219.458
G1 X66.045 Y200.292 E.83282
G1 X65.512 Y200.292
G1 X84.677 Y219.458 E.83282
G1 X84.144 Y219.458
G1 X64.979 Y200.292 E.83282
G1 X64.445 Y200.292
G1 X83.61 Y219.458 E.83282
G1 X83.077 Y219.458
G1 X63.912 Y200.292 E.83282
G1 X63.379 Y200.292
G1 X82.544 Y219.458 E.83282
G1 X82.011 Y219.458
G1 X62.845 Y200.292 E.83282
G1 X62.312 Y200.292
G1 X81.477 Y219.458 E.83282
G1 X80.944 Y219.458
G1 X61.779 Y200.292 E.83282
G1 X61.246 Y200.292
G1 X80.411 Y219.458 E.83282
G1 X79.878 Y219.458
G1 X60.712 Y200.292 E.83282
G1 X60.179 Y200.292
G1 X79.344 Y219.458 E.83282
G1 X78.811 Y219.458
G1 X59.646 Y200.292 E.83282
G1 X59.113 Y200.292
G1 X78.278 Y219.458 E.83282
G1 X77.745 Y219.458
G1 X58.579 Y200.292 E.83282
G1 X58.046 Y200.292
G1 X77.211 Y219.458 E.83282
G1 X76.678 Y219.458
G1 X57.513 Y200.292 E.83282
G1 X56.98 Y200.292
G1 X76.145 Y219.458 E.83282
G1 X75.612 Y219.458
G1 X56.446 Y200.292 E.83282
G1 X55.913 Y200.292
G1 X75.078 Y219.458 E.83282
; WIPE_START
M204 S10000
G1 X73.664 Y218.043 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X78.283 Y211.967 Z3.4 F30000
G1 X200.087 Y51.708 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X180.921 Y32.542 E.83282
G1 X180.388 Y32.542
G1 X199.553 Y51.708 E.83282
G1 X199.02 Y51.708
G1 X179.855 Y32.542 E.83282
G1 X179.322 Y32.542
G1 X198.487 Y51.708 E.83282
G1 X197.954 Y51.708
G1 X178.788 Y32.542 E.83282
G1 X178.255 Y32.542
G1 X197.42 Y51.708 E.83282
G1 X196.887 Y51.708
G1 X177.722 Y32.542 E.83282
G1 X177.189 Y32.542
G1 X196.354 Y51.708 E.83282
G1 X195.821 Y51.708
G1 X176.655 Y32.542 E.83282
G1 X176.122 Y32.542
G1 X195.287 Y51.708 E.83282
G1 X194.754 Y51.708
G1 X175.589 Y32.542 E.83282
G1 X175.056 Y32.542
G1 X194.221 Y51.708 E.83282
G1 X193.688 Y51.708
G1 X174.522 Y32.542 E.83282
G1 X173.989 Y32.542
G1 X193.154 Y51.708 E.83282
G1 X192.621 Y51.708
G1 X173.456 Y32.542 E.83282
G1 X172.923 Y32.542
G1 X192.088 Y51.708 E.83282
G1 X191.555 Y51.708
G1 X172.389 Y32.542 E.83282
G1 X171.856 Y32.542
G1 X191.021 Y51.708 E.83282
G1 X190.488 Y51.708
G1 X171.323 Y32.542 E.83282
G1 X170.79 Y32.542
G1 X189.955 Y51.708 E.83282
G1 X189.422 Y51.708
G1 X170.256 Y32.542 E.83282
G1 X169.723 Y32.542
G1 X188.888 Y51.708 E.83282
G1 X188.355 Y51.708
G1 X169.19 Y32.542 E.83282
G1 X168.657 Y32.542
G1 X187.822 Y51.708 E.83282
G1 X187.289 Y51.708
G1 X168.123 Y32.542 E.83282
G1 X167.59 Y32.542
G1 X186.755 Y51.708 E.83282
G1 X186.222 Y51.708
G1 X167.057 Y32.542 E.83282
G1 X166.524 Y32.542
G1 X185.689 Y51.708 E.83282
G1 X185.156 Y51.708
G1 X165.99 Y32.542 E.83282
G1 X165.457 Y32.542
G1 X184.622 Y51.708 E.83282
G1 X184.089 Y51.708
G1 X164.924 Y32.542 E.83282
G1 X164.391 Y32.542
G1 X183.556 Y51.708 E.83282
G1 X183.022 Y51.708
G1 X163.857 Y32.542 E.83282
G1 X163.324 Y32.542
G1 X182.489 Y51.708 E.83282
G1 X181.956 Y51.708
G1 X162.791 Y32.542 E.83282
G1 X162.257 Y32.542
G1 X181.423 Y51.708 E.83282
G1 X180.889 Y51.708
G1 X161.724 Y32.542 E.83282
G1 X161.191 Y32.542
G1 X180.356 Y51.708 E.83282
G1 X179.823 Y51.708
G1 X160.658 Y32.542 E.83282
G1 X160.124 Y32.542
G1 X179.29 Y51.708 E.83282
G1 X178.756 Y51.708
G1 X159.591 Y32.542 E.83282
G1 X159.058 Y32.542
G1 X178.223 Y51.708 E.83282
G1 X177.69 Y51.708
G1 X158.525 Y32.542 E.83282
G1 X157.991 Y32.542
G1 X177.157 Y51.708 E.83282
G1 X176.623 Y51.708
G1 X157.458 Y32.542 E.83282
G1 X156.925 Y32.542
G1 X176.09 Y51.708 E.83282
G1 X175.557 Y51.708
G1 X156.392 Y32.542 E.83282
G1 X155.858 Y32.542
G1 X175.024 Y51.708 E.83282
G1 X174.49 Y51.708
G1 X155.325 Y32.542 E.83282
G1 X154.792 Y32.542
G1 X173.957 Y51.708 E.83282
G1 X173.424 Y51.708
G1 X154.259 Y32.542 E.83282
G1 X153.725 Y32.542
G1 X172.891 Y51.708 E.83282
G1 X172.357 Y51.708
G1 X153.192 Y32.542 E.83282
G1 X152.659 Y32.542
G1 X171.824 Y51.708 E.83282
G1 X171.291 Y51.708
G1 X152.126 Y32.542 E.83282
G1 X151.592 Y32.542
G1 X170.758 Y51.708 E.83282
G1 X170.224 Y51.708
G1 X151.059 Y32.542 E.83282
G1 X150.526 Y32.542
G1 X169.691 Y51.708 E.83282
M73 P94 R2
G1 X169.158 Y51.708
G1 X149.993 Y32.542 E.83282
G1 X149.459 Y32.542
G1 X168.625 Y51.708 E.83282
G1 X168.091 Y51.708
G1 X148.926 Y32.542 E.83282
G1 X148.393 Y32.542
G1 X167.558 Y51.708 E.83282
G1 X167.025 Y51.708
G1 X147.86 Y32.542 E.83282
G1 X147.326 Y32.542
G1 X166.492 Y51.708 E.83282
G1 X165.958 Y51.708
G1 X146.793 Y32.542 E.83282
G1 X146.26 Y32.542
G1 X165.425 Y51.708 E.83282
G1 X164.892 Y51.708
G1 X145.726 Y32.542 E.83282
G1 X145.193 Y32.542
G1 X164.358 Y51.708 E.83282
G1 X163.825 Y51.708
G1 X144.66 Y32.542 E.83282
G1 X144.127 Y32.542
G1 X163.292 Y51.708 E.83282
G1 X162.759 Y51.708
G1 X143.593 Y32.542 E.83282
G1 X143.06 Y32.542
G1 X162.225 Y51.708 E.83282
G1 X161.692 Y51.708
G1 X142.527 Y32.542 E.83282
G1 X141.994 Y32.542
G1 X161.159 Y51.708 E.83282
G1 X160.626 Y51.708
G1 X141.46 Y32.542 E.83282
G1 X140.927 Y32.542
G1 X160.092 Y51.708 E.83282
G1 X159.559 Y51.708
G1 X140.394 Y32.542 E.83282
G1 X139.861 Y32.542
G1 X159.026 Y51.708 E.83282
M73 P95 R2
G1 X158.493 Y51.708
G1 X139.327 Y32.542 E.83282
G1 X138.794 Y32.542
G1 X157.959 Y51.708 E.83282
G1 X157.426 Y51.708
G1 X138.261 Y32.542 E.83282
G1 X137.728 Y32.542
G1 X156.893 Y51.708 E.83282
G1 X156.36 Y51.708
G1 X137.194 Y32.542 E.83282
G1 X136.661 Y32.542
G1 X155.826 Y51.708 E.83282
G1 X155.293 Y51.708
G1 X136.128 Y32.542 E.83282
G1 X135.595 Y32.542
G1 X154.76 Y51.708 E.83282
G1 X154.227 Y51.708
G1 X135.061 Y32.542 E.83282
G1 X134.528 Y32.542
G1 X153.693 Y51.708 E.83282
G1 X153.16 Y51.708
G1 X133.995 Y32.542 E.83282
G1 X133.462 Y32.542
G1 X152.627 Y51.708 E.83282
G1 X152.094 Y51.708
G1 X132.928 Y32.542 E.83282
G1 X132.395 Y32.542
G1 X151.56 Y51.708 E.83282
G1 X151.027 Y51.708
G1 X131.862 Y32.542 E.83282
G1 X131.329 Y32.542
G1 X150.494 Y51.708 E.83282
G1 X149.961 Y51.708
G1 X130.795 Y32.542 E.83282
G1 X130.262 Y32.542
G1 X149.427 Y51.708 E.83282
G1 X148.894 Y51.708
G1 X129.729 Y32.542 E.83282
G1 X129.196 Y32.542
G1 X148.361 Y51.708 E.83282
G1 X147.828 Y51.708
G1 X128.662 Y32.542 E.83282
G1 X128.129 Y32.542
G1 X147.294 Y51.708 E.83282
G1 X146.761 Y51.708
G1 X127.596 Y32.542 E.83282
G1 X127.062 Y32.542
G1 X146.228 Y51.708 E.83282
G1 X145.694 Y51.708
G1 X126.529 Y32.542 E.83282
G1 X125.996 Y32.542
G1 X145.161 Y51.708 E.83282
G1 X144.628 Y51.708
G1 X125.463 Y32.542 E.83282
G1 X124.929 Y32.542
G1 X144.095 Y51.708 E.83282
G1 X143.561 Y51.708
G1 X124.396 Y32.542 E.83282
G1 X123.863 Y32.542
G1 X143.028 Y51.708 E.83282
G1 X142.495 Y51.708
G1 X123.33 Y32.542 E.83282
G1 X122.796 Y32.542
G1 X141.962 Y51.708 E.83282
G1 X141.428 Y51.708
G1 X122.263 Y32.542 E.83282
G1 X121.73 Y32.542
G1 X140.895 Y51.708 E.83282
G1 X140.362 Y51.708
G1 X130.116 Y41.462 E.44522
G1 X130.208 Y42.087
G1 X139.829 Y51.708 E.41808
G1 X139.295 Y51.708
G1 X130.162 Y42.574 E.39691
G1 X130.035 Y42.981
G1 X138.762 Y51.708 E.37923
G1 X138.229 Y51.708
G1 X129.851 Y43.329 E.36407
G1 X129.618 Y43.63
G1 X137.696 Y51.708 E.351
G1 X137.162 Y51.708
G1 X129.341 Y43.887 E.33986
G1 X129.017 Y44.096
G1 X136.629 Y51.708 E.33076
G1 X136.096 Y51.708
G1 X128.635 Y44.247 E.32419
G1 X128.188 Y44.333
G1 X135.563 Y51.708 E.32044
G1 X135.029 Y51.708
G1 X127.631 Y44.309 E.3215
G1 X126.729 Y43.94
G1 X134.496 Y51.708 E.33753
; WIPE_START
M204 S10000
G1 X133.082 Y50.293 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.835 Y43.951 Z3.4 F30000
G1 X121.197 Y32.542 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X128.671 Y40.017 E.3248
G1 X128.037 Y39.916
G1 X120.663 Y32.542 E.32041
G1 X120.13 Y32.542
G1 X127.551 Y39.963 E.32247
G1 X127.144 Y40.089
G1 X119.597 Y32.542 E.32795
G1 X119.064 Y32.542
G1 X126.794 Y40.273 E.33593
G1 X126.492 Y40.504
G1 X118.53 Y32.542 E.34598
G1 X117.997 Y32.542
G1 X126.236 Y40.781 E.358
G1 X126.032 Y41.111
G1 X117.464 Y32.542 E.37235
G1 X116.931 Y32.542
G1 X125.881 Y41.493 E.38893
G1 X125.795 Y41.94
G1 X116.397 Y32.542 E.40839
G1 X115.864 Y32.542
G1 X125.816 Y42.494 E.43246
G1 X126.221 Y43.432
G1 X115.331 Y32.542 E.47322
G1 X114.798 Y32.542
G1 X133.963 Y51.708 E.83282
G1 X133.43 Y51.708
G1 X114.264 Y32.542 E.83282
G1 X113.731 Y32.542
G1 X132.896 Y51.708 E.83282
G1 X132.363 Y51.708
G1 X113.198 Y32.542 E.83282
G1 X112.665 Y32.542
G1 X131.83 Y51.708 E.83282
G1 X131.297 Y51.708
G1 X112.131 Y32.542 E.83282
G1 X111.598 Y32.542
G1 X130.763 Y51.708 E.83282
G1 X130.23 Y51.708
G1 X111.065 Y32.542 E.83282
G1 X110.532 Y32.542
G1 X129.697 Y51.708 E.83282
G1 X129.163 Y51.708
G1 X109.998 Y32.542 E.83282
G1 X109.465 Y32.542
G1 X128.63 Y51.708 E.83282
G1 X128.097 Y51.708
G1 X108.932 Y32.542 E.83282
G1 X108.398 Y32.542
G1 X127.564 Y51.708 E.83282
G1 X127.03 Y51.708
G1 X107.865 Y32.542 E.83282
G1 X107.332 Y32.542
G1 X126.497 Y51.708 E.83282
G1 X125.964 Y51.708
G1 X106.799 Y32.542 E.83282
G1 X106.265 Y32.542
G1 X125.431 Y51.708 E.83282
G1 X124.897 Y51.708
G1 X105.732 Y32.542 E.83282
G1 X105.199 Y32.542
G1 X124.364 Y51.708 E.83282
G1 X123.831 Y51.708
G1 X104.666 Y32.542 E.83282
G1 X104.132 Y32.542
G1 X123.298 Y51.708 E.83282
G1 X122.764 Y51.708
G1 X103.599 Y32.542 E.83282
G1 X103.066 Y32.542
G1 X122.231 Y51.708 E.83282
G1 X121.698 Y51.708
G1 X102.533 Y32.542 E.83282
G1 X101.999 Y32.542
G1 X121.165 Y51.708 E.83282
G1 X120.631 Y51.708
G1 X101.466 Y32.542 E.83282
G1 X100.933 Y32.542
G1 X120.098 Y51.708 E.83282
G1 X119.565 Y51.708
G1 X100.4 Y32.542 E.83282
G1 X99.866 Y32.542
G1 X119.032 Y51.708 E.83282
G1 X118.498 Y51.708
G1 X99.333 Y32.542 E.83282
G1 X98.8 Y32.542
G1 X117.965 Y51.708 E.83282
G1 X117.432 Y51.708
G1 X98.267 Y32.542 E.83282
G1 X97.733 Y32.542
G1 X116.899 Y51.708 E.83282
G1 X116.365 Y51.708
G1 X97.2 Y32.542 E.83282
G1 X96.667 Y32.542
G1 X115.832 Y51.708 E.83282
G1 X115.299 Y51.708
G1 X96.134 Y32.542 E.83282
G1 X95.6 Y32.542
G1 X114.766 Y51.708 E.83282
G1 X114.232 Y51.708
G1 X95.067 Y32.542 E.83282
G1 X94.534 Y32.542
G1 X113.699 Y51.708 E.83282
G1 X113.166 Y51.708
G1 X94.001 Y32.542 E.83282
G1 X93.467 Y32.542
G1 X112.633 Y51.708 E.83282
G1 X112.099 Y51.708
G1 X98.198 Y37.806 E.60408
G1 X98.228 Y38.37
G1 X111.566 Y51.708 E.5796
G1 X111.033 Y51.708
G1 X98.024 Y38.698 E.56531
G1 X97.697 Y38.905
G1 X110.499 Y51.708 E.55632
G1 X109.966 Y51.708
G1 X97.464 Y39.205 E.5433
; WIPE_START
M204 S10000
G1 X98.878 Y40.619 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X98.254 Y40.529 Z3.4 F30000
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X109.433 Y51.708 E.48576
G1 X108.9 Y51.708
G1 X98.267 Y41.075 E.46205
G1 X98.266 Y41.607
G1 X108.366 Y51.708 E.43891
G1 X107.833 Y51.708
G1 X98.265 Y42.14 E.41576
G1 X98.145 Y42.552
G1 X107.3 Y51.708 E.39784
G1 X106.767 Y51.708
G1 X97.877 Y42.818 E.38631
G1 X97.468 Y42.942
G1 X106.233 Y51.708 E.38089
G1 X105.7 Y51.708
G1 X96.935 Y42.942 E.38091
G1 X96.401 Y42.942
G1 X105.167 Y51.708 E.38093
G1 X104.634 Y51.708
G1 X95.867 Y42.941 E.38095
G1 X95.333 Y42.941
G1 X104.1 Y51.708 E.38097
G1 X103.567 Y51.708
G1 X94.731 Y42.872 E.38395
G1 X94.116 Y42.789
G1 X103.034 Y51.708 E.38754
G1 X102.501 Y51.708
G1 X93.727 Y42.934 E.38124
G1 X93.202 Y42.942
G1 X101.967 Y51.708 E.38091
G1 X101.434 Y51.708
G1 X92.668 Y42.942 E.38093
G1 X92.134 Y42.941
G1 X100.901 Y51.708 E.38094
G1 X100.368 Y51.708
G1 X91.601 Y42.941 E.38096
G1 X91.034 Y42.907
G1 X99.834 Y51.708 E.38242
; WIPE_START
M204 S10000
G1 X98.42 Y50.293 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X98.037 Y42.671 Z3.4 F30000
G1 X97.771 Y37.379 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X92.934 Y32.542 E.21018
G1 X92.401 Y32.542
G1 X97.168 Y37.31 E.20716
G1 X96.635 Y37.31
G1 X91.867 Y32.542 E.20716
G1 X91.334 Y32.542
G1 X96.101 Y37.31 E.20716
G1 X95.568 Y37.31
G1 X90.801 Y32.542 E.20716
G1 X90.268 Y32.542
G1 X95.035 Y37.309 E.20715
G1 X94.621 Y37.429
G1 X89.734 Y32.542 E.21235
G1 X89.201 Y32.542
G1 X94.1 Y37.442 E.21289
G1 X93.436 Y37.311
G1 X88.668 Y32.542 E.2072
G1 X88.135 Y32.542
G1 X92.905 Y37.312 E.20728
G1 X92.373 Y37.314
G1 X87.601 Y32.542 E.20736
G1 X87.068 Y32.542
G1 X91.842 Y37.316 E.20743
G1 X91.31 Y37.318
G1 X86.535 Y32.542 E.20751
G1 X86.002 Y32.542
G1 X90.862 Y37.403 E.21122
G1 X90.582 Y37.656
G1 X85.468 Y32.542 E.22223
G1 X84.935 Y32.542
G1 X90.435 Y38.042 E.23898
G1 X90.434 Y38.575
G1 X84.402 Y32.542 E.26214
G1 X83.869 Y32.542
G1 X90.434 Y39.108 E.2853
G1 X90.434 Y39.641
G1 X83.335 Y32.542 E.30846
G1 X82.802 Y32.542
G1 X90.434 Y40.174 E.33162
G1 X90.433 Y40.707
G1 X82.269 Y32.542 E.35478
G1 X81.736 Y32.542
G1 X90.433 Y41.24 E.37795
G1 X90.433 Y41.773
G1 X81.202 Y32.542 E.40111
G1 X80.669 Y32.542
G1 X90.464 Y42.337 E.42563
; WIPE_START
M204 S10000
G1 X89.05 Y40.923 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X83.489 Y35.695 Z3.4 F30000
G1 X80.136 Y32.542 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X99.301 Y51.708 E.83282
G1 X98.768 Y51.708
G1 X79.603 Y32.542 E.83282
G1 X79.069 Y32.542
G1 X98.235 Y51.708 E.83282
G1 X97.701 Y51.708
G1 X78.536 Y32.542 E.83282
G1 X78.003 Y32.542
G1 X97.168 Y51.708 E.83282
G1 X96.635 Y51.708
G1 X77.47 Y32.542 E.83282
G1 X76.936 Y32.542
G1 X96.102 Y51.708 E.83282
M73 P96 R2
G1 X95.568 Y51.708
G1 X76.403 Y32.542 E.83282
G1 X75.87 Y32.542
G1 X95.035 Y51.708 E.83282
G1 X94.502 Y51.708
G1 X75.337 Y32.542 E.83282
G1 X74.803 Y32.542
G1 X93.968 Y51.708 E.83282
G1 X93.435 Y51.708
G1 X74.27 Y32.542 E.83282
G1 X73.737 Y32.542
G1 X92.902 Y51.708 E.83282
G1 X92.369 Y51.708
G1 X73.203 Y32.542 E.83282
G1 X72.67 Y32.542
G1 X91.835 Y51.708 E.83282
G1 X91.302 Y51.708
G1 X72.137 Y32.542 E.83282
G1 X71.604 Y32.542
G1 X90.769 Y51.708 E.83282
G1 X90.236 Y51.708
G1 X71.07 Y32.542 E.83282
G1 X70.537 Y32.542
G1 X89.702 Y51.708 E.83282
G1 X89.169 Y51.708
G1 X70.004 Y32.542 E.83282
G1 X69.471 Y32.542
G1 X88.636 Y51.708 E.83282
G1 X88.103 Y51.708
G1 X68.937 Y32.542 E.83282
G1 X68.404 Y32.542
G1 X87.569 Y51.708 E.83282
G1 X87.036 Y51.708
G1 X67.871 Y32.542 E.83282
G1 X67.338 Y32.542
G1 X86.503 Y51.708 E.83282
G1 X85.97 Y51.708
G1 X66.804 Y32.542 E.83282
G1 X66.271 Y32.542
G1 X85.436 Y51.708 E.83282
G1 X84.903 Y51.708
G1 X65.738 Y32.542 E.83282
G1 X65.205 Y32.542
G1 X84.37 Y51.708 E.83282
G1 X83.837 Y51.708
G1 X64.671 Y32.542 E.83282
G1 X64.138 Y32.542
G1 X83.303 Y51.708 E.83282
G1 X82.77 Y51.708
G1 X63.605 Y32.542 E.83282
G1 X63.072 Y32.542
G1 X82.237 Y51.708 E.83282
G1 X81.704 Y51.708
G1 X62.538 Y32.542 E.83282
G1 X62.005 Y32.542
G1 X81.17 Y51.708 E.83282
G1 X80.637 Y51.708
G1 X61.472 Y32.542 E.83282
G1 X60.939 Y32.542
G1 X80.104 Y51.708 E.83282
G1 X79.571 Y51.708
G1 X60.405 Y32.542 E.83282
G1 X59.872 Y32.542
G1 X79.037 Y51.708 E.83282
G1 X78.504 Y51.708
G1 X59.339 Y32.542 E.83282
G1 X58.806 Y32.542
G1 X77.971 Y51.708 E.83282
G1 X77.438 Y51.708
G1 X58.272 Y32.542 E.83282
G1 X57.739 Y32.542
G1 X76.904 Y51.708 E.83282
G1 X76.371 Y51.708
G1 X57.206 Y32.542 E.83282
G1 X56.672 Y32.542
G1 X75.838 Y51.708 E.83282
G1 X75.304 Y51.708
G1 X56.139 Y32.542 E.83282
G1 X55.606 Y32.542
G1 X74.771 Y51.708 E.83282
G1 X74.238 Y51.708
G1 X55.073 Y32.542 E.83282
G1 X54.539 Y32.542
G1 X73.705 Y51.708 E.83282
G1 X73.171 Y51.708
G1 X54.006 Y32.542 E.83282
G1 X53.473 Y32.542
G1 X72.638 Y51.708 E.83282
G1 X72.105 Y51.708
G1 X52.94 Y32.542 E.83282
G1 X52.406 Y32.542
G1 X71.572 Y51.708 E.83282
G1 X71.038 Y51.708
G1 X51.873 Y32.542 E.83282
G1 X51.34 Y32.542
G1 X70.505 Y51.708 E.83282
G1 X69.972 Y51.708
G1 X50.807 Y32.542 E.83282
G1 X50.273 Y32.542
G1 X69.439 Y51.708 E.83282
G1 X68.905 Y51.708
G1 X49.74 Y32.542 E.83282
G1 X49.207 Y32.542
G1 X68.372 Y51.708 E.83282
G1 X67.839 Y51.708
G1 X48.674 Y32.542 E.83282
G1 X48.14 Y32.542
G1 X67.306 Y51.708 E.83282
G1 X66.772 Y51.708
G1 X47.607 Y32.542 E.83282
G1 X47.074 Y32.542
G1 X66.239 Y51.708 E.83282
G1 X65.706 Y51.708
G1 X46.541 Y32.542 E.83282
G1 X46.007 Y32.542
G1 X65.173 Y51.708 E.83282
G1 X64.639 Y51.708
G1 X45.474 Y32.542 E.83282
G1 X44.941 Y32.542
G1 X64.106 Y51.708 E.83282
G1 X63.573 Y51.708
G1 X44.408 Y32.542 E.83282
G1 X43.874 Y32.542
G1 X63.04 Y51.708 E.83282
G1 X62.506 Y51.708
G1 X43.341 Y32.542 E.83282
G1 X42.808 Y32.542
G1 X61.973 Y51.708 E.83282
G1 X61.44 Y51.708
G1 X42.275 Y32.542 E.83282
G1 X41.741 Y32.542
G1 X60.907 Y51.708 E.83282
G1 X60.373 Y51.708
G1 X41.208 Y32.542 E.83282
G1 X40.675 Y32.542
G1 X59.84 Y51.708 E.83282
G1 X59.307 Y51.708
G1 X40.142 Y32.542 E.83282
G1 X39.608 Y32.542
G1 X47.187 Y40.121 E.32934
G1 X46.451 Y39.919
G1 X39.075 Y32.542 E.32054
G1 X38.542 Y32.542
G1 X45.932 Y39.933 E.32116
G1 X45.505 Y40.039
G1 X38.008 Y32.542 E.32577
G1 X37.475 Y32.542
G1 X45.138 Y40.205 E.33299
G1 X44.828 Y40.428
G1 X36.942 Y32.542 E.34268
G1 X36.667 Y32.801
G1 X44.563 Y40.697 E.34312
G1 X44.344 Y41.011
G1 X36.667 Y33.334 E.33358
G1 X36.667 Y33.868
G1 X44.174 Y41.374 E.3262
G1 X44.066 Y41.8
G1 X36.667 Y34.401 E.32152
G1 X36.667 Y34.934
G1 X44.049 Y42.316 E.32077
G1 X44.241 Y43.041
G1 X36.667 Y35.467 E.32909
; WIPE_START
M204 S10000
G1 X38.082 Y36.882 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X45.111 Y39.855 Z3.4 F30000
G1 X48.249 Y41.183 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X58.773 Y51.708 E.45736
G1 X58.24 Y51.708
G1 X48.458 Y41.925 E.4251
G1 X48.439 Y42.439
G1 X57.707 Y51.708 E.40275
G1 X57.174 Y51.708
G1 X48.333 Y42.867 E.38417
G1 X48.166 Y43.233
G1 X56.64 Y51.708 E.36825
G1 X56.107 Y51.708
M73 P96 R1
G1 X47.95 Y43.55 E.35447
G1 X47.68 Y43.814
G1 X55.833 Y51.966 E.35426
G1 X55.833 Y52.5
G1 X47.366 Y44.033 E.36793
G1 X47.001 Y44.202
G1 X55.833 Y53.033 E.38376
G1 X55.833 Y53.566
G1 X46.576 Y44.309 E.40225
G1 X46.062 Y44.329
G1 X55.833 Y54.099 E.42458
G1 X55.833 Y54.633
G1 X45.352 Y44.152 E.45542
; WIPE_START
M204 S10000
G1 X46.767 Y45.567 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X41.225 Y40.318 Z3.4 F30000
G1 X36.667 Y36.001 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X55.833 Y55.166 E.83282
G1 X55.833 Y55.699
G1 X36.667 Y36.534 E.83282
G1 X36.667 Y37.067
G1 X55.833 Y56.232 E.83282
G1 X55.833 Y56.766
G1 X36.667 Y37.6 E.83282
G1 X36.667 Y38.134
G1 X55.833 Y57.299 E.83282
G1 X55.833 Y57.832
G1 X36.667 Y38.667 E.83282
G1 X36.667 Y39.2
G1 X55.833 Y58.365 E.83282
G1 X55.833 Y58.899
G1 X36.667 Y39.733 E.83282
G1 X36.667 Y40.267
G1 X55.833 Y59.432 E.83282
G1 X55.833 Y59.965
G1 X36.667 Y40.8 E.83282
G1 X36.667 Y41.333
G1 X55.833 Y60.498 E.83282
G1 X55.833 Y61.032
G1 X36.667 Y41.866 E.83282
G1 X36.667 Y42.4
G1 X55.833 Y61.565 E.83282
G1 X55.833 Y62.098
G1 X36.667 Y42.933 E.83282
G1 X36.667 Y43.466
G1 X55.833 Y62.631 E.83282
G1 X55.833 Y63.165
G1 X36.667 Y43.999 E.83282
G1 X36.667 Y44.533
G1 X55.833 Y63.698 E.83282
G1 X55.833 Y64.231
G1 X36.667 Y45.066 E.83282
G1 X36.667 Y45.599
G1 X55.833 Y64.764 E.83282
G1 X55.833 Y65.298
G1 X36.667 Y46.132 E.83282
G1 X36.667 Y46.666
G1 X55.833 Y65.831 E.83282
G1 X55.833 Y66.364
G1 X36.667 Y47.199 E.83282
G1 X36.667 Y47.732
G1 X55.833 Y66.897 E.83282
G1 X55.833 Y67.431
G1 X36.667 Y48.265 E.83282
G1 X36.667 Y48.799
G1 X55.833 Y67.964 E.83282
G1 X55.833 Y68.497
G1 X36.667 Y49.332 E.83282
G1 X36.667 Y49.865
G1 X55.833 Y69.031 E.83282
G1 X55.833 Y69.564
G1 X36.667 Y50.399 E.83282
G1 X36.667 Y50.932
G1 X55.833 Y70.097 E.83282
G1 X55.833 Y70.63
G1 X36.667 Y51.465 E.83282
G1 X36.667 Y51.998
G1 X55.833 Y71.164 E.83282
G1 X55.833 Y71.697
G1 X36.667 Y52.532 E.83282
G1 X36.667 Y53.065
G1 X55.833 Y72.23 E.83282
G1 X55.833 Y72.763
G1 X36.667 Y53.598 E.83282
G1 X36.667 Y54.131
G1 X55.833 Y73.297 E.83282
G1 X55.833 Y73.83
G1 X36.667 Y54.665 E.83282
G1 X36.667 Y55.198
G1 X55.833 Y74.363 E.83282
G1 X55.833 Y74.896
G1 X36.667 Y55.731 E.83282
G1 X36.667 Y56.264
G1 X55.833 Y75.43 E.83282
G1 X55.833 Y75.963
G1 X36.667 Y56.798 E.83282
G1 X36.667 Y57.331
G1 X55.833 Y76.496 E.83282
G1 X55.833 Y77.029
G1 X36.667 Y57.864 E.83282
G1 X36.667 Y58.397
G1 X55.833 Y77.563 E.83282
G1 X55.833 Y78.096
G1 X36.667 Y58.931 E.83282
G1 X36.667 Y59.464
G1 X55.833 Y78.629 E.83282
G1 X55.833 Y79.162
G1 X36.667 Y59.997 E.83282
G1 X36.667 Y60.53
G1 X55.833 Y79.696 E.83282
G1 X55.833 Y80.229
G1 X36.667 Y61.064 E.83282
G1 X36.667 Y61.597
G1 X55.833 Y80.762 E.83282
G1 X55.833 Y81.295
G1 X36.667 Y62.13 E.83282
G1 X36.667 Y62.663
G1 X55.833 Y81.829 E.83282
G1 X55.833 Y82.362
G1 X36.667 Y63.197 E.83282
G1 X36.667 Y63.73
G1 X55.833 Y82.895 E.83282
G1 X55.833 Y83.428
G1 X36.667 Y64.263 E.83282
G1 X36.667 Y64.796
G1 X55.833 Y83.962 E.83282
G1 X55.833 Y84.495
G1 X36.667 Y65.33 E.83282
G1 X36.667 Y65.863
G1 X55.833 Y85.028 E.83282
G1 X55.833 Y85.561
G1 X36.667 Y66.396 E.83282
G1 X36.667 Y66.93
G1 X55.833 Y86.095 E.83282
G1 X55.833 Y86.628
G1 X36.667 Y67.463 E.83282
G1 X36.667 Y67.996
G1 X55.833 Y87.161 E.83282
G1 X55.833 Y87.695
G1 X36.667 Y68.529 E.83282
G1 X36.667 Y69.063
G1 X55.833 Y88.228 E.83282
M73 P97 R1
G1 X55.833 Y88.761
G1 X36.667 Y69.596 E.83282
G1 X36.667 Y70.129
G1 X55.833 Y89.294 E.83282
G1 X55.833 Y89.828
G1 X36.667 Y70.662 E.83282
G1 X36.667 Y71.196
G1 X55.833 Y90.361 E.83282
G1 X55.833 Y90.894
G1 X36.667 Y71.729 E.83282
G1 X36.667 Y72.262
G1 X55.833 Y91.427 E.83282
G1 X55.833 Y91.961
G1 X36.667 Y72.795 E.83282
G1 X36.667 Y73.329
G1 X55.833 Y92.494 E.83282
G1 X55.833 Y93.027
G1 X36.667 Y73.862 E.83282
G1 X36.667 Y74.395
G1 X55.833 Y93.56 E.83282
G1 X55.833 Y94.094
G1 X36.667 Y74.928 E.83282
G1 X36.667 Y75.462
G1 X55.833 Y94.627 E.83282
G1 X55.833 Y95.16
G1 X36.667 Y75.995 E.83282
G1 X36.667 Y76.528
G1 X55.833 Y95.693 E.83282
G1 X55.833 Y96.227
G1 X36.667 Y77.061 E.83282
G1 X36.667 Y77.595
G1 X55.833 Y96.76 E.83282
G1 X55.833 Y97.293
G1 X36.667 Y78.128 E.83282
G1 X36.667 Y78.661
G1 X55.833 Y97.826 E.83282
G1 X55.833 Y98.36
G1 X36.667 Y79.194 E.83282
G1 X36.667 Y79.728
G1 X55.833 Y98.893 E.83282
G1 X55.833 Y99.426
G1 X36.667 Y80.261 E.83282
G1 X36.667 Y80.794
G1 X55.833 Y99.959 E.83282
G1 X55.833 Y100.493
G1 X36.667 Y81.327 E.83282
G1 X36.667 Y81.861
G1 X55.833 Y101.026 E.83282
G1 X55.833 Y101.559
G1 X36.667 Y82.394 E.83282
G1 X36.667 Y82.927
G1 X55.833 Y102.092 E.83282
G1 X55.833 Y102.626
G1 X36.667 Y83.46 E.83282
G1 X36.667 Y83.994
G1 X55.833 Y103.159 E.83282
G1 X55.833 Y103.692
G1 X36.667 Y84.527 E.83282
G1 X36.667 Y85.06
G1 X55.833 Y104.226 E.83282
G1 X55.833 Y104.759
G1 X36.667 Y85.594 E.83282
G1 X36.667 Y86.127
G1 X55.833 Y105.292 E.83282
G1 X55.833 Y105.825
G1 X36.667 Y86.66 E.83282
G1 X36.667 Y87.193
G1 X55.833 Y106.359 E.83282
G1 X55.833 Y106.892
G1 X36.667 Y87.727 E.83282
G1 X36.667 Y88.26
G1 X55.833 Y107.425 E.83282
G1 X55.833 Y107.958
G1 X36.667 Y88.793 E.83282
G1 X36.667 Y89.326
G1 X55.833 Y108.492 E.83282
G1 X55.833 Y109.025
G1 X36.667 Y89.86 E.83282
G1 X36.667 Y90.393
G1 X55.833 Y109.558 E.83282
G1 X55.833 Y110.091
G1 X36.667 Y90.926 E.83282
G1 X36.667 Y91.459
G1 X55.833 Y110.625 E.83282
G1 X55.833 Y111.158
G1 X36.667 Y91.993 E.83282
G1 X36.667 Y92.526
G1 X55.833 Y111.691 E.83282
G1 X55.833 Y112.224
G1 X36.667 Y93.059 E.83282
G1 X36.667 Y93.592
G1 X55.833 Y112.758 E.83282
G1 X55.833 Y113.291
G1 X36.667 Y94.126 E.83282
G1 X36.667 Y94.659
G1 X55.833 Y113.824 E.83282
G1 X55.833 Y114.357
G1 X36.667 Y95.192 E.83282
G1 X36.667 Y95.725
G1 X55.833 Y114.891 E.83282
G1 X55.833 Y115.424
G1 X36.667 Y96.259 E.83282
G1 X36.667 Y96.792
G1 X55.833 Y115.957 E.83282
G1 X55.833 Y116.49
G1 X36.667 Y97.325 E.83282
G1 X36.667 Y97.858
G1 X55.833 Y117.024 E.83282
G1 X55.833 Y117.557
G1 X36.667 Y98.392 E.83282
G1 X36.667 Y98.925
G1 X55.833 Y118.09 E.83282
G1 X55.833 Y118.623
G1 X36.667 Y99.458 E.83282
G1 X36.667 Y99.991
G1 X55.833 Y119.157 E.83282
G1 X55.833 Y119.69
G1 X36.667 Y100.525 E.83282
G1 X36.667 Y101.058
G1 X55.833 Y120.223 E.83282
G1 X55.833 Y120.756
G1 X36.667 Y101.591 E.83282
G1 X36.667 Y102.125
G1 X55.833 Y121.29 E.83282
G1 X55.833 Y121.823
G1 X36.667 Y102.658 E.83282
G1 X36.667 Y103.191
G1 X55.833 Y122.356 E.83282
G1 X55.833 Y122.89
G1 X36.667 Y103.724 E.83282
G1 X36.667 Y104.258
G1 X55.833 Y123.423 E.83282
G1 X55.833 Y123.956
G1 X36.667 Y104.791 E.83282
G1 X36.667 Y105.324
G1 X55.833 Y124.489 E.83282
G1 X55.833 Y125.023
G1 X36.667 Y105.857 E.83282
G1 X36.667 Y106.391
G1 X55.833 Y125.556 E.83282
G1 X55.833 Y126.089
G1 X36.667 Y106.924 E.83282
G1 X36.667 Y107.457
G1 X55.833 Y126.622 E.83282
G1 X55.833 Y127.156
G1 X36.667 Y107.99 E.83282
G1 X36.667 Y108.524
G1 X55.833 Y127.689 E.83282
G1 X55.833 Y128.222
G1 X36.667 Y109.057 E.83282
G1 X36.667 Y109.59
G1 X55.833 Y128.755 E.83282
G1 X55.833 Y129.289
G1 X36.667 Y110.123 E.83282
G1 X36.667 Y110.657
G1 X55.833 Y129.822 E.83282
G1 X55.833 Y130.355
G1 X36.667 Y111.19 E.83282
G1 X36.667 Y111.723
G1 X55.833 Y130.888 E.83282
G1 X55.833 Y131.422
G1 X36.667 Y112.256 E.83282
G1 X36.667 Y112.79
G1 X55.833 Y131.955 E.83282
G1 X55.833 Y132.488
G1 X48.017 Y124.672 E.33964
G1 X48.424 Y125.613
G1 X55.833 Y133.021 E.32194
G1 X55.833 Y133.555
G1 X48.458 Y126.18 E.32048
G1 X48.375 Y126.63
G1 X55.833 Y134.088 E.32407
G1 X55.833 Y134.621
G1 X48.22 Y127.009 E.33079
G1 X48.012 Y127.334
G1 X55.833 Y135.154 E.33983
G1 X55.833 Y135.688
G1 X47.758 Y127.613 E.35088
G1 X47.459 Y127.847
G1 X55.833 Y136.221 E.36388
G1 X55.833 Y136.754
G1 X47.112 Y128.033 E.37896
G1 X46.706 Y128.161
G1 X55.833 Y137.287 E.39658
G1 X55.833 Y137.821
G1 X46.219 Y128.208 E.41774
G1 X45.593 Y128.114
G1 X55.833 Y138.354 E.44496
; WIPE_START
M204 S10000
G1 X54.418 Y136.94 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X50.798 Y130.22 Z3.4 F30000
G1 X47.567 Y124.222 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X36.667 Y113.323 E.47364
G1 X36.667 Y113.856
G1 X46.638 Y123.827 E.43327
G1 X46.074 Y123.796
G1 X36.667 Y114.389 E.40876
G1 X36.667 Y114.923
G1 X45.626 Y123.881 E.38928
G1 X45.243 Y124.032
G1 X36.667 Y115.456 E.37267
G1 X36.667 Y115.989
G1 X44.913 Y124.235 E.35833
G1 X44.63 Y124.485
G1 X36.667 Y116.522 E.34602
G1 X36.667 Y117.056
G1 X44.399 Y124.787 E.33598
G1 X44.215 Y125.137
G1 X36.667 Y117.589 E.328
G1 X36.667 Y118.122
G1 X44.088 Y125.543 E.32247
G1 X44.038 Y126.026
G1 X36.667 Y118.655 E.3203
G1 X36.667 Y119.189
G1 X44.142 Y126.664 E.32482
; WIPE_START
M204 S10000
G1 X42.728 Y125.249 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X37.089 Y120.106 Z3.4 F30000
G1 X36.667 Y119.722 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X55.833 Y138.887 E.83282
G1 X55.833 Y139.421
G1 X36.667 Y120.255 E.83282
G1 X36.667 Y120.789
G1 X55.833 Y139.954 E.83282
G1 X55.833 Y140.487
G1 X36.667 Y121.322 E.83282
G1 X36.667 Y121.855
G1 X55.833 Y141.02 E.83282
G1 X55.833 Y141.554
G1 X36.667 Y122.388 E.83282
G1 X36.667 Y122.922
G1 X55.833 Y142.087 E.83282
G1 X55.833 Y142.62
G1 X36.667 Y123.455 E.83282
G1 X36.667 Y123.988
G1 X55.833 Y143.153 E.83282
G1 X55.833 Y143.687
G1 X36.667 Y124.521 E.83282
G1 X36.667 Y125.055
G1 X55.833 Y144.22 E.83282
G1 X55.833 Y144.753
G1 X36.667 Y125.588 E.83282
G1 X36.667 Y126.121
G1 X55.833 Y145.286 E.83282
G1 X55.833 Y145.82
G1 X36.667 Y126.654 E.83282
G1 X36.667 Y127.188
G1 X55.833 Y146.353 E.83282
G1 X55.833 Y146.886
G1 X36.667 Y127.721 E.83282
G1 X36.667 Y128.254
G1 X55.833 Y147.419 E.83282
G1 X55.833 Y147.953
G1 X36.667 Y128.787 E.83282
G1 X36.667 Y129.321
G1 X55.833 Y148.486 E.83282
G1 X55.833 Y149.019
G1 X36.667 Y129.854 E.83282
G1 X36.667 Y130.387
G1 X55.833 Y149.552 E.83282
G1 X55.833 Y150.086
G1 X36.667 Y130.92 E.83282
G1 X36.667 Y131.454
G1 X55.833 Y150.619 E.83282
G1 X55.833 Y151.152
G1 X36.667 Y131.987 E.83282
G1 X36.667 Y132.52
G1 X55.833 Y151.685 E.83282
G1 X55.833 Y152.219
G1 X36.667 Y133.053 E.83282
G1 X36.667 Y133.587
G1 X55.833 Y152.752 E.83282
G1 X55.833 Y153.285
G1 X36.667 Y134.12 E.83282
G1 X36.667 Y134.653
G1 X55.833 Y153.818 E.83282
G1 X55.833 Y154.352
G1 X36.667 Y135.186 E.83282
G1 X36.667 Y135.72
G1 X55.833 Y154.885 E.83282
G1 X55.833 Y155.418
G1 X36.667 Y136.253 E.83282
G1 X36.667 Y136.786
G1 X55.833 Y155.951 E.83282
G1 X55.833 Y156.485
G1 X36.667 Y137.32 E.83282
G1 X36.667 Y137.853
G1 X55.833 Y157.018 E.83282
G1 X55.833 Y157.551
G1 X36.667 Y138.386 E.83282
G1 X36.667 Y138.919
G1 X55.833 Y158.085 E.83282
G1 X55.833 Y158.618
G1 X36.667 Y139.453 E.83282
G1 X36.667 Y139.986
G1 X55.833 Y159.151 E.83282
G1 X55.833 Y159.684
G1 X36.667 Y140.519 E.83282
G1 X36.667 Y141.052
G1 X55.833 Y160.218 E.83282
M73 P98 R1
G1 X55.833 Y160.751
G1 X36.667 Y141.586 E.83282
G1 X36.667 Y142.119
G1 X55.833 Y161.284 E.83282
G1 X55.833 Y161.817
G1 X36.667 Y142.652 E.83282
G1 X36.667 Y143.185
G1 X55.833 Y162.351 E.83282
G1 X55.833 Y162.884
G1 X36.667 Y143.719 E.83282
G1 X36.667 Y144.252
G1 X55.833 Y163.417 E.83282
G1 X55.833 Y163.95
G1 X36.667 Y144.785 E.83282
G1 X36.667 Y145.318
G1 X55.833 Y164.484 E.83282
G1 X55.833 Y165.017
G1 X36.667 Y145.852 E.83282
G1 X36.667 Y146.385
G1 X55.833 Y165.55 E.83282
G1 X55.833 Y166.083
G1 X36.667 Y146.918 E.83282
G1 X36.667 Y147.451
G1 X55.833 Y166.617 E.83282
G1 X55.833 Y167.15
G1 X36.667 Y147.985 E.83282
G1 X36.667 Y148.518
G1 X55.833 Y167.683 E.83282
G1 X55.833 Y168.216
G1 X36.667 Y149.051 E.83282
G1 X36.667 Y149.584
G1 X55.833 Y168.75 E.83282
G1 X55.833 Y169.283
G1 X36.667 Y150.118 E.83282
G1 X36.667 Y150.651
G1 X55.833 Y169.816 E.83282
G1 X55.833 Y170.349
G1 X36.667 Y151.184 E.83282
G1 X36.667 Y151.717
G1 X55.833 Y170.883 E.83282
G1 X55.833 Y171.416
G1 X36.667 Y152.251 E.83282
G1 X36.667 Y152.784
G1 X55.833 Y171.949 E.83282
G1 X55.833 Y172.482
G1 X36.667 Y153.317 E.83282
G1 X36.667 Y153.85
G1 X55.833 Y173.016 E.83282
G1 X55.833 Y173.549
G1 X36.667 Y154.384 E.83282
G1 X36.667 Y154.917
G1 X55.833 Y174.082 E.83282
G1 X55.833 Y174.616
G1 X36.667 Y155.45 E.83282
G1 X36.667 Y155.984
G1 X55.833 Y175.149 E.83282
G1 X55.833 Y175.682
G1 X36.667 Y156.517 E.83282
G1 X36.667 Y157.05
G1 X55.833 Y176.215 E.83282
G1 X55.833 Y176.749
G1 X36.667 Y157.583 E.83282
G1 X36.667 Y158.117
G1 X55.833 Y177.282 E.83282
G1 X55.833 Y177.815
G1 X36.667 Y158.65 E.83282
G1 X36.667 Y159.183
G1 X55.833 Y178.348 E.83282
G1 X55.833 Y178.882
G1 X36.667 Y159.716 E.83282
G1 X36.667 Y160.25
G1 X55.833 Y179.415 E.83282
G1 X55.833 Y179.948
G1 X36.667 Y160.783 E.83282
G1 X36.667 Y161.316
G1 X55.833 Y180.481 E.83282
G1 X55.833 Y181.015
G1 X36.667 Y161.849 E.83282
G1 X36.667 Y162.383
G1 X55.833 Y181.548 E.83282
G1 X55.833 Y182.081
G1 X36.667 Y162.916 E.83282
M73 P98 R0
G1 X36.667 Y163.449
G1 X55.833 Y182.614 E.83282
G1 X55.833 Y183.148
G1 X36.667 Y163.982 E.83282
G1 X36.667 Y164.516
G1 X55.833 Y183.681 E.83282
G1 X55.833 Y184.214
G1 X36.667 Y165.049 E.83282
G1 X36.667 Y165.582
G1 X55.833 Y184.747 E.83282
G1 X55.833 Y185.281
G1 X36.667 Y166.115 E.83282
G1 X36.667 Y166.649
G1 X55.833 Y185.814 E.83282
G1 X55.833 Y186.347
G1 X36.667 Y167.182 E.83282
G1 X36.667 Y167.715
G1 X55.833 Y186.88 E.83282
G1 X55.833 Y187.414
G1 X36.667 Y168.248 E.83282
G1 X36.667 Y168.782
G1 X55.833 Y187.947 E.83282
G1 X55.833 Y188.48
G1 X36.667 Y169.315 E.83282
G1 X36.667 Y169.848
G1 X55.833 Y189.013 E.83282
G1 X55.833 Y189.547
G1 X36.667 Y170.381 E.83282
G1 X36.667 Y170.915
G1 X55.833 Y190.08 E.83282
G1 X55.833 Y190.613
G1 X36.667 Y171.448 E.83282
G1 X36.667 Y171.981
G1 X55.833 Y191.146 E.83282
G1 X55.833 Y191.68
G1 X36.667 Y172.514 E.83282
G1 X36.667 Y173.048
G1 X55.833 Y192.213 E.83282
G1 X55.833 Y192.746
G1 X36.667 Y173.581 E.83282
G1 X36.667 Y174.114
G1 X55.833 Y193.28 E.83282
G1 X55.833 Y193.813
G1 X36.667 Y174.648 E.83282
G1 X36.667 Y175.181
G1 X55.833 Y194.346 E.83282
G1 X55.833 Y194.879
G1 X36.667 Y175.714 E.83282
G1 X36.667 Y176.247
G1 X55.833 Y195.413 E.83282
G1 X55.833 Y195.946
G1 X36.667 Y176.781 E.83282
G1 X36.667 Y177.314
G1 X55.833 Y196.479 E.83282
G1 X55.833 Y197.012
G1 X36.667 Y177.847 E.83282
G1 X36.667 Y178.38
G1 X55.833 Y197.546 E.83282
G1 X55.833 Y198.079
G1 X36.667 Y178.914 E.83282
G1 X36.667 Y179.447
G1 X55.833 Y198.612 E.83282
G1 X55.833 Y199.145
G1 X36.667 Y179.98 E.83282
G1 X36.667 Y180.513
G1 X55.833 Y199.679 E.83282
G1 X55.833 Y200.212
G1 X36.667 Y181.047 E.83282
G1 X36.667 Y181.58
G1 X74.545 Y219.458 E1.64597
G1 X74.012 Y219.458
G1 X36.667 Y182.113 E1.6228
G1 X36.667 Y182.646
G1 X73.479 Y219.458 E1.59963
G1 X72.945 Y219.458
G1 X36.667 Y183.18 E1.57645
G1 X36.667 Y183.713
G1 X72.412 Y219.458 E1.55328
G1 X71.879 Y219.458
G1 X36.667 Y184.246 E1.53011
G1 X36.667 Y184.779
G1 X71.346 Y219.458 E1.50694
G1 X70.812 Y219.458
G1 X36.667 Y185.313 E1.48376
G1 X36.667 Y185.846
G1 X70.279 Y219.458 E1.46059
G1 X69.746 Y219.458
G1 X36.667 Y186.379 E1.43742
G1 X36.667 Y186.912
G1 X69.213 Y219.458 E1.41425
G1 X68.679 Y219.458
G1 X36.667 Y187.446 E1.39107
G1 X36.667 Y187.979
G1 X68.146 Y219.458 E1.3679
G1 X67.613 Y219.458
G1 X36.667 Y188.512 E1.34473
G1 X36.667 Y189.045
G1 X67.08 Y219.458 E1.32155
G1 X66.546 Y219.458
G1 X36.667 Y189.579 E1.29838
G1 X36.667 Y190.112
G1 X66.013 Y219.458 E1.27521
G1 X65.48 Y219.458
G1 X36.667 Y190.645 E1.25204
G1 X36.667 Y191.179
G1 X64.946 Y219.458 E1.22886
G1 X64.413 Y219.458
G1 X36.667 Y191.712 E1.20569
G1 X36.667 Y192.245
G1 X63.88 Y219.458 E1.18252
G1 X63.347 Y219.458
G1 X36.667 Y192.778 E1.15935
G1 X36.667 Y193.312
G1 X62.813 Y219.458 E1.13617
G1 X62.28 Y219.458
G1 X36.667 Y193.845 E1.113
G1 X36.667 Y194.378
G1 X61.747 Y219.458 E1.08983
G1 X61.214 Y219.458
G1 X36.667 Y194.911 E1.06666
G1 X36.667 Y195.445
G1 X60.68 Y219.458 E1.04348
G1 X60.147 Y219.458
G1 X36.667 Y195.978 E1.02031
G1 X36.667 Y196.511
G1 X59.614 Y219.458 E.99714
G1 X59.081 Y219.458
G1 X36.667 Y197.044 E.97397
G1 X36.667 Y197.578
G1 X46.824 Y207.735 E.44137
G1 X46.224 Y207.667
G1 X36.667 Y198.111 E.41527
G1 X36.667 Y198.644
G1 X45.748 Y207.725 E.39461
G1 X45.349 Y207.859
G1 X36.667 Y199.177 E.37728
G1 X36.667 Y199.711
G1 X45.007 Y208.05 E.36238
G1 X44.711 Y208.288
G1 X36.667 Y200.244 E.34954
G1 X36.667 Y200.777
G1 X44.46 Y208.57 E.33864
G1 X44.258 Y208.901
G1 X36.667 Y201.31 E.32985
G1 X36.667 Y201.844
G1 X44.114 Y209.29 E.32358
G1 X44.037 Y209.746
G1 X36.667 Y202.377 E.32024
G1 X36.667 Y202.91
G1 X44.081 Y210.324 E.32215
; WIPE_START
M204 S10000
G1 X42.667 Y208.909 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X48.385 Y209.295 Z3.4 F30000
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X58.547 Y219.458 E.4416
G1 X58.014 Y219.458
G1 X48.458 Y209.901 E.41528
G1 X48.401 Y210.377
G1 X57.481 Y219.458 E.39458
G1 X56.948 Y219.458
G1 X48.266 Y210.776 E.37726
G1 X48.075 Y211.118
G1 X56.414 Y219.458 E.3624
G1 X55.881 Y219.458
G1 X47.836 Y211.412 E.34961
G1 X47.552 Y211.662
G1 X55.348 Y219.458 E.33876
G1 X54.815 Y219.458
G1 X47.222 Y211.865 E.32993
G1 X46.837 Y212.013
G1 X54.281 Y219.458 E.32349
G1 X53.748 Y219.458
G1 X46.377 Y212.087 E.32031
G1 X45.792 Y212.035
G1 X53.215 Y219.458 E.32255
G1 X52.682 Y219.458
G1 X36.667 Y203.443 E.69589
G1 X36.667 Y203.977
M73 P99 R0
G1 X52.148 Y219.458 E.67272
G1 X51.615 Y219.458
G1 X36.667 Y204.51 E.64955
G1 X36.667 Y205.043
G1 X51.082 Y219.458 E.62638
G1 X50.549 Y219.458
G1 X36.667 Y205.576 E.6032
G1 X36.667 Y206.11
G1 X50.015 Y219.458 E.58003
G1 X49.482 Y219.458
G1 X36.667 Y206.643 E.55686
G1 X36.667 Y207.176
G1 X48.949 Y219.458 E.53369
G1 X48.415 Y219.458
G1 X36.667 Y207.709 E.51051
G1 X36.667 Y208.243
G1 X47.882 Y219.458 E.48734
G1 X47.349 Y219.458
G1 X36.667 Y208.776 E.46417
G1 X36.667 Y209.309
G1 X46.816 Y219.458 E.441
G1 X46.282 Y219.458
G1 X36.667 Y209.843 E.41782
G1 X36.667 Y210.376
G1 X45.749 Y219.458 E.39465
G1 X45.216 Y219.458
G1 X36.667 Y210.909 E.37148
G1 X36.667 Y211.442
G1 X44.683 Y219.458 E.3483
G1 X44.149 Y219.458
G1 X36.667 Y211.976 E.32513
G1 X36.667 Y212.509
G1 X43.616 Y219.458 E.30196
G1 X43.083 Y219.458
G1 X36.667 Y213.042 E.27879
G1 X36.667 Y213.575
G1 X42.55 Y219.458 E.25561
G1 X42.016 Y219.458
G1 X36.667 Y214.109 E.23244
G1 X36.667 Y214.642
G1 X41.483 Y219.458 E.20927
G1 X40.95 Y219.458
G1 X36.667 Y215.175 E.1861
G1 X36.667 Y215.708
G1 X40.417 Y219.458 E.16292
G1 X39.883 Y219.458
G1 X36.667 Y216.242 E.13975
G1 X36.667 Y216.775
G1 X39.35 Y219.458 E.11658
G1 X38.817 Y219.458
G1 X36.667 Y217.308 E.09341
G1 X36.667 Y217.841
G1 X38.284 Y219.458 E.07023
G1 X37.75 Y219.458
G1 X36.667 Y218.375 E.04706
G1 X36.667 Y218.908
G1 X37.217 Y219.458 E.02389
; WIPE_START
M204 S10000
G1 X36.667 Y218.908 E-.29542
G1 X36.667 Y218.375 E-.20264
G1 X37.155 Y218.862 E-.26195
; WIPE_END
G1 E-.04 F1800
G1 X37.857 Y211.262 Z3.4 F30000
G1 X45.527 Y128.18 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.185154
G1 F15000
G1 X45.41 Y128.099 E.00166
; LINE_WIDTH: 0.14636
G1 X45.292 Y128.018 E.0012
; LINE_WIDTH: 0.107565
G1 X45.175 Y127.937 E.00075
; WIPE_START
G1 X45.292 Y128.018 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X48.077 Y124.612 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.229999
G1 F15000
G1 X48.012 Y124.533 E.00155
G2 X47.7 Y124.224 I-3.241 J2.956 E.0067
G1 X47.676 Y124.224 E.00036
; LINE_WIDTH: 0.186896
G1 X47.559 Y124.23 E.00138
G1 X46.964 Y123.903 F30000
; LINE_WIDTH: 0.129661
G1 F15000
G1 X46.71 Y123.755 E.00208
; WIPE_START
G1 X46.964 Y123.903 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X44.048 Y126.016 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.126148
G1 F15000
G1 X43.969 Y126.223 E.0015
G1 X44.323 Y127.083 F30000
; LINE_WIDTH: 0.112097
G1 F15000
G3 X44.069 Y126.736 I3.276 J-2.668 E.00242
; WIPE_START
G1 X44.323 Y127.083 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X44.412 Y119.451 Z3.4 F30000
G1 X45.29 Y44.214 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.198064
G1 F15000
G1 X45.117 Y44.082 E.00276
; LINE_WIDTH: 0.151928
G1 X44.938 Y43.943 E.00201
; LINE_WIDTH: 0.114945
G3 X44.614 Y43.639 I2.847 J-3.35 E.00261
; LINE_WIDTH: 0.116739
G1 X44.47 Y43.473 E.00132
; LINE_WIDTH: 0.147685
G3 X44.318 Y43.298 I1.673 J-1.604 E.00198
; LINE_WIDTH: 0.177524
G1 X44.248 Y43.2 E.00132
; LINE_WIDTH: 0.203119
G1 X44.179 Y43.102 E.00157
; WIPE_START
G1 X44.248 Y43.2 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X48.43 Y42.697 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0971088
G1 F15000
G3 X48.351 Y42.823 I-1.271 J-.704 E.00066
; WIPE_START
G1 X48.43 Y42.697 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X48.311 Y41.12 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.208298
G1 F15000
G1 X48.248 Y41.028 E.00151
; LINE_WIDTH: 0.18179
G1 X48.107 Y40.859 E.00249
; LINE_WIDTH: 0.128286
G1 X47.967 Y40.689 E.00153
G2 X47.644 Y40.37 I-45.244 J45.491 E.00316
; LINE_WIDTH: 0.147883
G1 X47.482 Y40.24 E.00178
; LINE_WIDTH: 0.192222
G1 X47.32 Y40.109 E.00253
G1 X47.289 Y40.112 E.00038
; LINE_WIDTH: 0.165719
G1 X47.179 Y40.129 E.00112
; WIPE_START
G1 X47.289 Y40.112 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X54.906 Y40.598 Z3.4 F30000
G1 X91.039 Y42.902 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.173967
G1 F15000
G3 X90.901 Y42.93 I-.304 J-1.139 E.00151
G1 X90.771 Y42.833 E.00173
; LINE_WIDTH: 0.157014
G3 X90.393 Y42.408 I1.683 J-1.872 E.0053
; WIPE_START
G1 X90.642 Y42.716 E-.52818
G1 X90.771 Y42.833 E-.23182
; WIPE_END
G1 E-.04 F1800
G1 X97.083 Y38.543 Z3.4 F30000
G1 X98.264 Y37.74 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.200393
G1 F15000
G2 X97.833 Y37.318 I-1.586 J1.19 E.00778
; WIPE_START
G1 X97.953 Y37.405 E-.18699
G1 X98.119 Y37.564 E-.28791
G1 X98.264 Y37.74 E-.2851
; WIPE_END
G1 E-.04 F1800
G1 X98.331 Y40.452 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.120431
G1 F15000
G2 X98.095 Y40.131 I-1.802 J1.079 E.00252
; WIPE_START
G1 X98.331 Y40.452 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.904 Y41.401 Z3.4 F30000
G1 X126.667 Y44.002 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.226628
G1 F15000
G3 X126.161 Y43.493 I2.361 J-2.851 E.01077
; WIPE_START
G1 X126.33 Y43.686 E-.27208
G1 X126.667 Y44.002 E-.48792
; WIPE_END
G1 E-.04 F1800
G1 X125.795 Y41.962 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.106779
G1 F15000
G2 X125.718 Y42.13 I1.566 J.822 E.00096
; WIPE_START
G1 X125.795 Y41.962 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.094 Y40.202 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.102606
G1 F15000
G2 X128.745 Y39.942 I-2.722 J3.293 E.00211
; WIPE_START
G1 X129.094 Y40.202 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.179 Y41.4 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.190398
G1 F15000
G1 X130.099 Y41.281 E.00171
; LINE_WIDTH: 0.149509
G1 X130.019 Y41.163 E.00124
; LINE_WIDTH: 0.10862
G1 X129.94 Y41.045 E.00076
; WIPE_START
G1 X130.019 Y41.163 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137.651 Y41.059 Z3.4 F30000
G1 X210.559 Y40.06 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.175136
G1 F15000
G2 X210.272 Y39.898 I-1.784 J2.819 E.00355
; WIPE_START
G1 X210.559 Y40.06 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X209.102 Y44.32 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.192257
G1 F15000
G1 X209.02 Y44.275 E.00114
; LINE_WIDTH: 0.161444
G1 X208.899 Y44.192 E.00142
; LINE_WIDTH: 0.112593
G1 X208.778 Y44.108 E.00084
; WIPE_START
G1 X208.899 Y44.192 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X211.981 Y41.596 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.143633
G1 F15000
G1 X211.897 Y41.458 E.00133
; LINE_WIDTH: 0.12791
G1 X211.852 Y41.391 E.00056
; LINE_WIDTH: 0.10142
G1 X211.808 Y41.324 E.00038
; WIPE_START
G1 X211.852 Y41.391 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X211.544 Y49.017 Z3.4 F30000
G1 X208.353 Y127.819 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.230646
G1 F15000
G3 X207.897 Y127.367 I2.113 J-2.593 E.00983
G1 X207.656 Y126.718 F30000
; LINE_WIDTH: 0.156766
G1 F15000
G1 X207.497 Y126.447 E.00292
; WIPE_START
G1 X207.656 Y126.718 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X207.616 Y125.411 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0971363
G1 F15000
G2 X207.536 Y125.547 I1.3 J.854 E.0007
; WIPE_START
G1 X207.616 Y125.411 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X209.089 Y123.901 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.101154
G1 F15000
G1 X209.022 Y123.886 E.00033
G1 X208.936 Y123.946 E.0005
; WIPE_START
G1 X209.022 Y123.886 E-.45647
G1 X209.089 Y123.901 E-.30353
; WIPE_END
G1 E-.04 F1800
G1 X210.821 Y124.062 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0977493
G1 F15000
G2 X210.483 Y123.812 I-2.62 J3.189 E.00188
; WIPE_START
G1 X210.821 Y124.062 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X211.933 Y125.287 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.189881
G1 F15000
G1 X211.854 Y125.169 E.0017
; LINE_WIDTH: 0.149199
G1 X211.775 Y125.052 E.00123
; LINE_WIDTH: 0.108516
G1 X211.696 Y124.934 E.00076
; WIPE_START
G1 X211.775 Y125.052 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X211.779 Y132.684 Z3.4 F30000
G1 X211.822 Y208.898 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.20196
G1 F15000
G1 X211.743 Y208.781 E.00183
; LINE_WIDTH: 0.170335
G1 X211.603 Y208.612 E.00228
; LINE_WIDTH: 0.116912
G1 X211.462 Y208.442 E.00133
G2 X211.141 Y208.125 I-52.623 J52.963 E.00272
; LINE_WIDTH: 0.13769
G1 X210.97 Y207.987 E.0017
; LINE_WIDTH: 0.191366
G1 X210.794 Y207.845 E.00273
G1 X210.652 Y207.87 E.00174
; WIPE_START
G1 X210.794 Y207.845 E-.29619
G1 X210.97 Y207.987 E-.46381
; WIPE_END
G1 E-.04 F1800
G1 X208.742 Y211.932 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.200986
G1 F15000
G3 X208.608 Y211.839 I.884 J-1.41 E.00211
; LINE_WIDTH: 0.169318
G1 X208.441 Y211.696 E.00226
; LINE_WIDTH: 0.127025
G1 X208.273 Y211.554 E.00151
G3 X207.958 Y211.227 I46.143 J-44.747 E.00311
; LINE_WIDTH: 0.154815
G1 X207.817 Y211.048 E.00208
; LINE_WIDTH: 0.19815
G1 X207.676 Y210.868 E.00288
; WIPE_START
G1 X207.817 Y211.048 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X200.189 Y210.799 Z3.4 F30000
G1 X129.844 Y208.512 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.225198
G1 F15000
G2 X129.427 Y208.081 I-5.956 J5.344 E.00891
G1 X129.283 Y208.094 E.00215
; WIPE_START
G1 X129.427 Y208.081 E-.14764
G1 X129.844 Y208.512 E-.61236
; WIPE_END
G1 E-.04 F1800
G1 X130.25 Y209.424 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0945265
G1 F15000
G2 X130.105 Y209.186 I-2.467 J1.345 E.00117
; WIPE_START
G1 X130.25 Y209.424 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.268 Y212.052 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.186686
G1 F15000
G1 X127.149 Y211.97 E.0017
; LINE_WIDTH: 0.147279
G1 X127.03 Y211.887 E.00123
; LINE_WIDTH: 0.107871
G1 X126.91 Y211.805 E.00077
; WIPE_START
G1 X127.03 Y211.887 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.901 Y210.822 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.093989
G1 F15000
G1 X125.901 Y210.547 E.00115
G1 X126.086 Y210.978 F30000
; LINE_WIDTH: 0.116142
G1 F15000
G3 X125.824 Y210.624 I3.376 J-2.762 E.00263
; WIPE_START
G1 X126.086 Y210.978 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X118.454 Y211.086 Z3.4 F30000
G1 X45.72 Y212.107 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.111995
G1 F15000
G3 X45.455 Y211.938 I1.553 J-2.714 E.00177
; WIPE_START
G1 X45.72 Y212.107 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X48.376 Y209.304 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.141521
G1 F15000
G1 X48.4 Y209.206 E.00081
; LINE_WIDTH: 0.16004
G1 X48.405 Y209.184 E.00022
; LINE_WIDTH: 0.185226
G1 X48.409 Y209.162 E.00026
; LINE_WIDTH: 0.179535
G1 X48.352 Y209.077 E.00114
; LINE_WIDTH: 0.142985
G1 X48.294 Y208.992 E.00084
; LINE_WIDTH: 0.106436
G1 X48.237 Y208.906 E.00053
; WIPE_START
G1 X48.294 Y208.992 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X50.22 Y201.606 Z3.4 F30000
G1 X92.056 Y41.125 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.43086
G1 F15000
G1 X92.956 Y41.125 E.02845
; LINE_WIDTH: 0.409461
G1 X93.076 Y41.059 E.00409
; LINE_WIDTH: 0.366661
G1 X93.196 Y40.993 E.00361
; LINE_WIDTH: 0.323862
G1 X93.315 Y40.927 E.00313
G1 X93.341 Y41.269 F30000
; LINE_WIDTH: 0.171237
G1 F15000
G1 X93.127 Y41.242 E.00226
; LINE_WIDTH: 0.219486
G1 X93.092 Y41.219 E.0006
; LINE_WIDTH: 0.266457
G1 X93.058 Y41.195 E.00075
; LINE_WIDTH: 0.313428
G1 X93.024 Y41.172 E.00091
; LINE_WIDTH: 0.360399
G1 X92.99 Y41.148 E.00107
; LINE_WIDTH: 0.40737
G1 X92.956 Y41.125 E.00123
G1 X93.341 Y41.269 F30000
; LINE_WIDTH: 0.121692
G1 F15000
G1 X93.555 Y41.295 E.00139
; WIPE_START
G1 X93.341 Y41.269 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X93.306 Y39.323 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.292224
G1 F15000
G1 X93.226 Y39.273 E.00192
; LINE_WIDTH: 0.331832
G1 X93.145 Y39.224 E.00223
; LINE_WIDTH: 0.371439
G1 X93.064 Y39.174 E.00253
; LINE_WIDTH: 0.411047
G1 X92.983 Y39.125 E.00284
; LINE_WIDTH: 0.410237
G1 X93.017 Y39.104 E.00117
; LINE_WIDTH: 0.368991
G1 X93.05 Y39.084 E.00104
; LINE_WIDTH: 0.327744
G1 X93.083 Y39.063 E.00091
; LINE_WIDTH: 0.286498
G1 X93.117 Y39.043 E.00078
; LINE_WIDTH: 0.245252
G1 X93.15 Y39.022 E.00065
; LINE_WIDTH: 0.203352
G1 X93.303 Y38.999 E.00201
; LINE_WIDTH: 0.160774
G1 X93.455 Y38.977 E.00148
; LINE_WIDTH: 0.118197
G1 X93.607 Y38.954 E.00094
G1 X92.983 Y39.125 F30000
; LINE_WIDTH: 0.43086
G1 F15000
G1 X92.056 Y39.125 E.02931
; WIPE_START
G1 X92.983 Y39.125 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.367 Y41.308 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
M204 S2000
G1 X93.948 Y38.889 E.10511
G1 X93.731 Y39.205
G1 X95.833 Y41.308 E.09136
G1 X95.3 Y41.308
G1 X94.061 Y40.069 E.05383
G1 X93.965 Y40.506
G1 X94.809 Y41.35 E.03668
G1 X94.473 Y41.547
G1 X93.717 Y40.791 E.03285
M204 S10000
G1 X94.037 Y41.403 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.101673
G1 F15000
G1 X93.97 Y41.359 E.00039
; LINE_WIDTH: 0.140037
G2 X93.753 Y41.226 I-1.218 J1.75 E.00201
G1 X93.645 Y40.835 F30000
; LINE_WIDTH: 0.101606
G1 F15000
G1 X93.557 Y40.904 E.00054
G2 X93.682 Y41.044 I.204 J-.056 E.00093
; WIPE_START
G1 X93.622 Y41.015 E-.16548
G1 X93.557 Y40.904 E-.31762
G1 X93.645 Y40.835 E-.27691
; WIPE_END
G1 E-.04 F1800
G1 X94.139 Y39.992 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.112113
G1 F15000
G2 X93.954 Y39.723 I-1.671 J.948 E.00184
G1 X93.647 Y39.22 F30000
; LINE_WIDTH: 0.112092
G1 F15000
G2 X93.558 Y39.35 I.184 J.221 E.0009
G2 X93.661 Y39.429 I.353 J-.349 E.00073
; WIPE_START
G1 X93.558 Y39.35 E-.34368
G1 X93.647 Y39.22 E-.41632
; WIPE_END
G1 E-.04 F1800
G1 X96.651 Y41.138 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.328139
G1 F15000
G1 X95.499 Y39.961 E.03828
; LINE_WIDTH: 0.359844
G1 X94.346 Y38.775 E.04272
; LINE_WIDTH: 0.343584
G1 X94.35 Y38.531 E.00599
; WIPE_START
G1 X94.346 Y38.775 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.993 Y38.985 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.117894
G1 F15000
G1 X97.286 Y38.955 E.0018
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F15000
G1 X96.993 Y38.985 E-.76
; WIPE_END
G1 E-.04 F1800
M106 S0
M106 P2 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode

;===== date: 20230428 =====================
M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z3.5 F900 ; lower z a little
G1 X65 Y245 F12000 ; move to safe pos
G1 Y265 F3000

G1 X65 Y245 F12000
G1 Y265 F3000
M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

G1 X100 F12000 ; wipe
; pull back filament to AMS
M620 S255
G1 X20 Y50 F12000
G1 Y-3
T255
G1 X65 F12000
G1 Y265
G1 X100 F12000 ; wipe
M621 S255
M104 S0 ; turn off hotend

M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
    M400 ; wait all motion done
    M991 S0 P-1 ;end smooth timelapse at safe pos
    M400 S3 ;wait for last picture to be taken
M623; end of "timelapse_record_flag"

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z103 F600
    G1 Z101

M400 P100
M17 R ; restore z current

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M73 P100 R0
; EXECUTABLE_BLOCK_END
