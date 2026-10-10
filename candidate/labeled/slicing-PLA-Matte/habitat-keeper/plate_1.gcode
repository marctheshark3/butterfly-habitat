; HEADER_BLOCK_START
; BambuStudio 02.04.00.70
; model printing time: 3m 38s; total estimated time: 10m 49s
; total layer number: 45
; total filament length [mm] : 355.23
; total filament volume [cm^3] : 854.42
; total filament weight [g] : 1.13
; filament_density: 1.32
; filament_diameter: 1.75
; max_z_height: 9.00
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
; filament_colour = #DD4945
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
M73 P0 R10
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
M73 P14 R9
G1 E50 F200
M400
M104 S220
G92 E0
M73 P54 R4
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
M73 P56 R4
G1 E-0.5 F300

M73 P58 R4
G1 X70 F9000
M73 P59 R4
G1 X76 F15000
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
M73 P60 R4
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
    G29 A X109.079 Y118.829 I37.8414 J18.3414
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
M73 P61 R4
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
; layer num/total_layer_count: 1/45
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
G1 X110.676 Y118.297
G1 Z.2
G1 E.8 F1800
; FEATURE: Brim
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
M73 P62 R4
G1 X111.169 Y117.886 E.0239
G1 X111.714 Y117.553 E.02378
G1 X112.552 Y117.227 E.03351
G1 X113.179 Y117.096 E.02386
G1 X113.758 Y117.058 E.02159
G1 X142.242 Y117.058 E1.06092
M73 P63 R4
G1 X142.89 Y117.106 E.02422
G1 X143.513 Y117.246 E.02377
G1 X144.356 Y117.603 E.0341
G1 X144.974 Y118 E.02737
M73 P63 R3
G1 X145.453 Y118.426 E.02386
G1 X145.864 Y118.919 E.0239
G1 X146.197 Y119.464 E.0238
G1 X146.508 Y120.25 E.03148
G1 X146.654 Y120.93 E.02589
G1 X146.692 Y121.508 E.02157
M73 P64 R3
G1 X146.692 Y130.491 E.33461
G1 X146.644 Y131.14 E.02422
G1 X146.504 Y131.763 E.02377
G1 X146.147 Y132.606 E.0341
G1 X145.75 Y133.224 E.02737
G1 X145.324 Y133.703 E.02386
G1 X144.831 Y134.114 E.0239
G1 X144.286 Y134.447 E.02378
G1 X143.448 Y134.773 E.03351
G1 X142.821 Y134.904 E.02386
G1 X142.242 Y134.942 E.0216
G1 X113.759 Y134.942 E1.06091
G1 X113.11 Y134.894 E.02422
M73 P65 R3
G1 X112.489 Y134.754 E.02373
G1 X111.562 Y134.351 E.03765
G1 X111.027 Y134.001 E.02381
G1 X110.547 Y133.574 E.0239
G1 X110.136 Y133.081 E.0239
G1 X109.803 Y132.536 E.02378
G1 X109.477 Y131.698 E.03351
G1 X109.346 Y131.071 E.02386
G1 X109.308 Y130.492 E.02159
G1 X109.308 Y121.508 E.33462
G1 X109.356 Y120.86 E.02422
G1 X109.496 Y120.237 E.02377
G1 X109.853 Y119.394 E.0341
G1 X110.25 Y118.776 E.02737
M73 P66 R3
G1 X110.636 Y118.342 E.02163
M204 S6000
G1 X110.979 Y118.647 F30000
G1 F3000
M204 S500
G1 X111.003 Y118.62 E.00134
G1 X111.444 Y118.253 E.02137
G1 X111.928 Y117.96 E.02108
G1 X112.694 Y117.665 E.03056
G1 X113.232 Y117.552 E.02048
G1 X113.777 Y117.515 E.02036
G1 X142.23 Y117.515 E1.05975
G1 X142.832 Y117.561 E.02251
G1 X143.383 Y117.688 E.02105
G1 X144.131 Y118.005 E.03024
G1 X144.705 Y118.373 E.02541
G1 X145.13 Y118.753 E.02123
G1 X145.485 Y119.178 E.02062
G1 X145.78 Y119.659 E.02102
G1 X146.065 Y120.373 E.02862
G1 X146.201 Y121.003 E.02403
G1 X146.235 Y121.527 E.01957
G1 X146.235 Y130.469 E.33306
G1 X146.189 Y131.082 E.0229
G1 X146.062 Y131.633 E.02105
G1 X145.745 Y132.381 E.03024
G1 X145.391 Y132.938 E.02461
G1 X144.997 Y133.38 E.02203
G1 X144.556 Y133.747 E.02137
G1 X144.072 Y134.04 E.02108
G1 X143.306 Y134.335 E.03056
G1 X142.768 Y134.448 E.02048
G1 X142.223 Y134.485 E.02037
G1 X113.77 Y134.485 E1.05974
G1 X113.188 Y134.442 E.02176
G1 X112.644 Y134.32 E.02075
G1 X111.77 Y133.941 E.0355
G1 X111.298 Y133.63 E.02105
G1 X110.87 Y133.247 E.02137
G1 X110.503 Y132.806 E.02137
G1 X110.21 Y132.322 E.02108
G1 X109.915 Y131.556 E.03056
G1 X109.802 Y131.018 E.02048
G1 X109.765 Y130.482 E.02003
G1 X109.765 Y121.53 E.3334
G1 X109.808 Y120.938 E.02214
G1 X109.938 Y120.367 E.02181
G1 X110.255 Y119.619 E.03024
G1 X110.61 Y119.062 E.02461
G1 X110.939 Y118.692 E.01845
M204 S6000
G1 X111.282 Y118.996 F30000
G1 F3000
M204 S500
G1 X111.329 Y118.943 E.00267
G1 X111.719 Y118.621 E.01881
G1 X112.142 Y118.368 E.01837
G1 X112.835 Y118.102 E.02764
G1 X113.304 Y118.005 E.01784
G1 X113.797 Y117.972 E.01843
G1 X142.207 Y117.972 E1.05815
G1 X142.753 Y118.014 E.0204
G1 X143.253 Y118.129 E.01911
G1 X143.906 Y118.406 E.02643
G1 X144.436 Y118.745 E.02343
G1 X144.807 Y119.079 E.01859
G1 X145.118 Y119.453 E.01814
G1 X145.364 Y119.854 E.01752
G1 X145.622 Y120.496 E.02574
G1 X145.748 Y121.077 E.02214
G1 X145.778 Y121.547 E.01755
G1 X145.778 Y130.447 E.33149
G1 X145.736 Y131.003 E.02078
G1 X145.621 Y131.503 E.0191
G1 X145.344 Y132.157 E.02646
G1 X145.031 Y132.653 E.02183
G1 X144.671 Y133.057 E.02016
G1 X144.281 Y133.379 E.01881
G1 X143.858 Y133.632 E.01837
G1 X143.165 Y133.898 E.02764
G1 X142.696 Y133.995 E.01784
G1 X142.202 Y134.028 E.01843
G1 X113.782 Y134.027 E1.05854
G1 X113.265 Y133.989 E.01934
G1 X112.799 Y133.887 E.01777
G1 X111.978 Y133.531 E.03332
M73 P67 R3
G1 X111.57 Y133.26 E.01825
G1 X111.193 Y132.922 E.01885
G1 X110.871 Y132.531 E.01884
G1 X110.618 Y132.108 E.01837
G1 X110.352 Y131.415 E.02764
G1 X110.255 Y130.946 E.01785
G1 X110.222 Y130.461 E.0181
G1 X110.222 Y121.552 E.33183
G1 X110.261 Y121.016 E.02004
G1 X110.38 Y120.496 E.01984
G1 X110.656 Y119.843 E.02643
G1 X110.969 Y119.347 E.02183
G1 X111.242 Y119.041 E.01526
M204 S6000
G1 X111.585 Y119.346 F30000
G1 F3000
M204 S500
G1 X111.655 Y119.266 E.00397
G1 X111.992 Y118.99 E.0162
G1 X112.354 Y118.776 E.01567
G1 X112.974 Y118.54 E.02474
G1 X113.375 Y118.459 E.01522
G1 X113.818 Y118.429 E.01652
G1 X142.184 Y118.429 E1.05656
G1 X142.674 Y118.466 E.01827
G1 X143.122 Y118.57 E.01716
G1 X143.682 Y118.807 E.02263
G1 X144.167 Y119.117 E.02143
G1 X144.483 Y119.404 E.0159
G1 X144.739 Y119.713 E.01495
G1 X144.948 Y120.051 E.0148
G1 X145.179 Y120.619 E.02285
G1 X145.294 Y121.15 E.02024
G1 X145.321 Y121.566 E.01552
G1 X145.321 Y130.425 E.32994
G1 X145.284 Y130.924 E.01865
G1 X145.18 Y131.372 E.01714
G1 X144.942 Y131.934 E.02272
G1 X144.67 Y132.367 E.01905
G1 X144.345 Y132.734 E.01826
G1 X144.008 Y133.01 E.0162
G1 X143.646 Y133.224 E.01567
G1 X143.026 Y133.46 E.02474
G1 X142.625 Y133.541 E.01522
G1 X142.182 Y133.571 E.01653
G1 X113.794 Y133.57 E1.05735
G1 X113.341 Y133.536 E.01695
G1 X112.953 Y133.453 E.01477
G1 X112.187 Y133.121 E.0311
G1 X111.843 Y132.891 E.01541
G1 X111.518 Y132.597 E.01632
G1 X111.241 Y132.258 E.0163
G1 X111.026 Y131.896 E.01567
G1 X110.79 Y131.276 E.02474
G1 X110.709 Y130.875 E.01523
G1 X110.679 Y130.441 E.01619
G1 X110.679 Y121.574 E.33028
G1 X110.714 Y121.094 E.01792
G1 X110.821 Y120.626 E.01787
G1 X111.058 Y120.066 E.02266
G1 X111.33 Y119.633 E.01905
G1 X111.545 Y119.391 E.01206
M204 S6000
G1 X111.888 Y119.695 F30000
G1 F3000
M204 S500
G1 X111.982 Y119.59 E.00525
G1 X112.264 Y119.361 E.01353
G1 X112.564 Y119.185 E.01296
G1 X113.113 Y118.978 E.02186
G1 X113.445 Y118.912 E.0126
G1 X113.837 Y118.886 E.01464
G1 X142.162 Y118.886 E1.055
G1 X142.594 Y118.919 E.01613
G1 X142.991 Y119.011 E.0152
G1 X143.478 Y119.219 E.01971
G1 X143.897 Y119.489 E.01856
G1 X144.158 Y119.728 E.0132
G1 X144.361 Y119.973 E.01184
G1 X144.533 Y120.248 E.0121
G1 X144.736 Y120.744 E.01994
G1 X144.841 Y121.224 E.0183
G1 X144.864 Y121.585 E.01348
G1 X144.864 Y130.402 E.32841
G1 X144.831 Y130.844 E.0165
G1 X144.739 Y131.241 E.01518
G1 X144.54 Y131.712 E.01904
G1 X144.309 Y132.083 E.01625
G1 X144.018 Y132.41 E.01631
G1 X143.736 Y132.639 E.01353
G1 X143.436 Y132.815 E.01296
G1 X142.887 Y133.022 E.02186
G1 X142.555 Y133.088 E.0126
G1 X142.163 Y133.114 E.01465
G1 X113.816 Y133.113 E1.05579
G1 X113.416 Y133.083 E.01497
G1 X113.107 Y133.018 E.01176
G1 X112.396 Y132.711 E.02884
G1 X112.117 Y132.523 E.01253
G1 X111.843 Y132.273 E.0138
G1 X111.611 Y131.986 E.01374
G1 X111.435 Y131.686 E.01296
G1 X111.228 Y131.137 E.02186
G1 X111.162 Y130.805 E.01262
G1 X111.136 Y130.421 E.01431
G1 X111.136 Y121.595 E.32874
G1 X111.166 Y121.172 E.01579
G1 X111.262 Y120.756 E.01589
G1 X111.461 Y120.288 E.01895
G1 X111.691 Y119.917 E.01625
G1 X111.848 Y119.74 E.00883
M204 S6000
G1 X112.212 Y120.03 F30000
G1 F3000
M204 S500
G1 X112.23 Y120.008 E.00104
G1 X112.592 Y119.708 E.0175
G1 X112.935 Y119.523 E.01452
G1 X113.303 Y119.404 E.0144
G1 X113.786 Y119.343 E.01815
G1 X142.209 Y119.343 E1.05865
G1 X142.661 Y119.399 E.01694
G1 X142.901 Y119.462 E.00926
G1 X143.474 Y119.753 E.02394
G1 X143.574 Y119.823 E.00455
G1 X143.747 Y119.977 E.00861
G1 X143.932 Y120.182 E.01028
G1 X144.074 Y120.393 E.0095
G1 X144.258 Y120.765 E.01546
G1 X144.35 Y121.067 E.01175
G1 X144.397 Y121.384 E.01194
G1 X144.407 Y130.459 E.33799
G1 X144.35 Y130.911 E.01696
G1 X144.288 Y131.151 E.00925
G1 X143.997 Y131.724 E.02394
G1 X143.928 Y131.824 E.00451
G1 X143.722 Y132.048 E.01133
G1 X143.516 Y132.222 E.01006
G1 X143.359 Y132.323 E.00693
G1 X142.88 Y132.547 E.01971
G1 X142.605 Y132.615 E.01056
G1 X142.215 Y132.657 E.01459
G1 X113.791 Y132.657 E1.0587
G1 X113.339 Y132.6 E.01695
G1 X113.099 Y132.538 E.00925
G1 X112.526 Y132.247 E.02394
G1 X112.253 Y132.023 E.01314
G1 X112.076 Y131.826 E.00988
G1 X111.752 Y131.261 E.02425
G1 X111.689 Y131.076 E.00727
G1 X111.624 Y130.779 E.01132
G1 X111.593 Y121.542 E.34405
G1 X111.649 Y121.092 E.01691
G1 X111.753 Y120.733 E.01391
G1 X111.948 Y120.362 E.01562
G1 X112.175 Y120.077 E.01357
M204 S6000
G1 X112.525 Y120.367 F30000
G1 F3000
M204 S500
G1 X112.589 Y120.291 E.00371
G1 X112.881 Y120.062 E.01382
G1 X113.148 Y119.927 E.01116
G1 X113.442 Y119.839 E.01143
M73 P68 R3
G1 X113.777 Y119.8 E.01256
G1 X142.218 Y119.8 E1.05929
G1 X142.606 Y119.853 E.01459
G1 X142.79 Y119.905 E.00713
G1 X143.264 Y120.159 E.02004
G1 X143.449 Y120.323 E.0092
G1 X143.592 Y120.488 E.00812
G1 X143.66 Y120.588 E.00452
G1 X143.853 Y120.978 E.01621
G1 X143.911 Y121.191 E.00822
G1 X143.945 Y121.451 E.00977
G1 X143.95 Y130.468 E.33583
G1 X143.897 Y130.856 E.0146
G1 X143.845 Y131.04 E.00712
G1 X143.591 Y131.514 E.02004
G1 X143.427 Y131.699 E.0092
G1 X143.262 Y131.842 E.00812
G1 X143.162 Y131.91 E.00452
G1 X142.772 Y132.103 E.01621
G1 X142.56 Y132.16 E.00818
G1 X142.223 Y132.2 E.01264
G1 X113.782 Y132.2 E1.05929
G1 X113.394 Y132.147 E.0146
G1 X113.21 Y132.095 E.00712
G1 X112.736 Y131.841 E.02004
G1 X112.551 Y131.677 E.00919
G1 X112.412 Y131.517 E.00791
G1 X112.184 Y131.115 E.0172
G1 X112.138 Y130.986 E.00511
G1 X112.069 Y130.674 E.01187
G1 X112.05 Y121.533 E.3405
G1 X112.103 Y121.144 E.01459
G1 X112.193 Y120.858 E.01116
G1 X112.35 Y120.578 E.01199
G1 X112.487 Y120.413 E.00796
M204 S6000
G1 X112.839 Y120.705 F30000
G1 F3000
M204 S500
G1 X112.946 Y120.576 E.00628
G1 X113.153 Y120.429 E.00943
G1 X113.35 Y120.337 E.0081
G1 X113.492 Y120.294 E.00552
G1 X113.769 Y120.257 E.01043
G1 X142.227 Y120.257 E1.05994
G1 X142.543 Y120.306 E.01192
G1 X142.661 Y120.343 E.00461
G1 X142.965 Y120.504 E.01281
G1 X143.098 Y120.617 E.00649
G1 X143.253 Y120.794 E.00875
G1 X143.414 Y121.103 E.01298
G1 X143.456 Y121.242 E.0054
G1 X143.493 Y121.519 E.01044
G1 X143.493 Y130.477 E.33364
G1 X143.444 Y130.794 E.01193
G1 X143.407 Y130.911 E.0046
G1 X143.246 Y131.215 E.01281
G1 X143.133 Y131.348 E.00649
G1 X142.956 Y131.502 E.00875
G1 X142.647 Y131.664 E.01298
G1 X142.508 Y131.706 E.0054
G1 X142.231 Y131.743 E.01044
G1 X113.773 Y131.743 E1.05994
G1 X113.456 Y131.694 E.01193
G1 X113.339 Y131.657 E.0046
G1 X113.035 Y131.496 E.01281
G1 X112.902 Y131.383 E.00649
G1 X112.748 Y131.206 E.00875
G1 X112.586 Y130.897 E.01299
G1 X112.514 Y130.569 E.01249
G1 X112.507 Y121.523 E.33695
G1 X112.556 Y121.205 E.01198
G1 X112.628 Y120.997 E.00819
G1 X112.694 Y120.879 E.00504
G1 X112.8 Y120.751 E.00619
M204 S6000
G1 X113.158 Y121.023 F30000
G1 F3000
M204 S500
G1 X113.223 Y120.939 E.00395
G1 X113.336 Y120.848 E.00541
G1 X113.553 Y120.746 E.00893
G1 X113.761 Y120.714 E.00782
G1 X142.238 Y120.714 E1.06066
G1 X142.468 Y120.757 E.00871
G1 X142.659 Y120.844 E.00783
G1 X142.811 Y120.973 E.00743
G1 X142.902 Y121.086 E.00541
G1 X143.004 Y121.303 E.00892
G1 X143.036 Y121.511 E.00782
G1 X143.036 Y130.488 E.33436
G1 X142.993 Y130.718 E.00872
G1 X142.906 Y130.909 E.00783
G1 X142.777 Y131.061 E.00743
G1 X142.664 Y131.152 E.00541
G1 X142.447 Y131.254 E.00892
G1 X142.239 Y131.286 E.00782
G1 X113.762 Y131.286 E1.06066
G1 X113.532 Y131.243 E.00872
G1 X113.341 Y131.156 E.00783
G1 X113.189 Y131.027 E.00743
G1 X113.098 Y130.914 E.00541
G1 X112.996 Y130.697 E.00893
G1 X112.964 Y130.489 E.00782
G1 X112.964 Y121.512 E.33436
G1 X113.007 Y121.279 E.00884
G1 X113.054 Y121.161 E.00475
G1 X113.122 Y121.071 E.00418
M204 S6000
G1 X113.497 Y121.305 F30000
G1 F3000
M204 S500
G1 X113.634 Y121.196 E.00651
G1 X113.75 Y121.171 E.00442
G1 X142.25 Y121.171 E1.06152
G1 X142.361 Y121.2 E.00426
G1 X142.445 Y121.247 E.00361
G1 X142.554 Y121.384 E.00651
G1 X142.579 Y121.5 E.00442
G1 X142.579 Y130.5 E.33522
G1 X142.55 Y130.611 E.00426
G1 X142.503 Y130.695 E.00361
G1 X142.366 Y130.804 E.00651
G1 X142.25 Y130.829 E.00442
G1 X113.75 Y130.829 E1.06152
G1 X113.639 Y130.8 E.00426
G1 X113.555 Y130.753 E.00361
G1 X113.446 Y130.616 E.00651
G1 X113.421 Y130.5 E.00442
G1 X113.421 Y121.5 E.33522
G1 X113.45 Y121.389 E.00426
G1 X113.468 Y121.357 E.00137
; WIPE_START
G1 X113.634 Y121.196 E-.08797
G1 X113.75 Y121.171 E-.04514
G1 X115.4 Y121.171 E-.6269
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X122.631 Y123.613 Z.6 F30000
G1 X141.85 Y130.1 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X114.15 Y130.1 E1.03172
G1 X114.15 Y121.9 E.30542
M73 P69 R3
G1 X141.85 Y121.9 E1.03172
G1 X141.85 Y130.04 E.30318
M204 S6000
G1 X141.393 Y129.643 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X114.607 Y129.643 E.99767
G1 X114.607 Y122.357 E.27137
G1 X141.393 Y122.357 E.99767
G1 X141.393 Y129.583 E.26914
; WIPE_START
G1 X139.393 Y129.587 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X131.993 Y127.717 Z.6 F30000
G1 X118.522 Y124.312 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X118.538 Y124.31 E.00057
G1 X118.75 Y124.3 E.00792
G3 X118.315 Y124.344 I.003 J2.195 E.49736
G1 X118.463 Y124.321 E.00558
M204 S6000
G1 X118.014 Y123.948 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X118.225 Y123.895 E.00811
G3 X118.493 Y123.855 I.529 J2.604 E.01008
G1 X118.75 Y123.842 E.0096
G3 X117.956 Y123.964 I.004 J2.657 E.59174
; WIPE_START
G1 X118.225 Y123.895 E-.10557
G1 X118.493 Y123.855 E-.10284
G1 X118.75 Y123.842 E-.09792
G1 X119.015 Y123.855 E-.10072
G1 X119.277 Y123.895 E-.10067
G1 X119.533 Y123.96 E-.10071
G1 X119.782 Y124.051 E-.10067
G1 X119.903 Y124.109 E-.0509
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X127.322 Y125.9 Z.6 F30000
G1 X140.936 Y129.186 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X135.217 Y129.186 E.21301
G1 X135.467 Y128.811 E.01679
G2 X135.662 Y128.169 I-1.514 J-.81 E.02516
G1 X135.664 Y123.936 E.15767
G2 X135.192 Y122.814 I-1.643 J.032 E.04644
G1 X140.936 Y122.814 E.21395
G1 X140.936 Y129.126 E.23509
M204 S6000
G1 X140.479 Y128.729 F30000
G1 F3000
M204 S500
G1 X136.017 Y128.729 E.16619
G1 X136.119 Y128.214 E.01955
G1 X136.121 Y123.913 E.16018
G2 X135.996 Y123.271 I-1.676 J-.006 E.02453
G1 X140.479 Y123.271 E.16697
G1 X140.479 Y128.669 E.20104
; WIPE_START
G1 X138.479 Y128.696 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X131.852 Y127.668 Z.6 F30000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X132.236 Y127.702 E.01435
G2 X132.683 Y129.186 I1.968 J.216 E.05932
G1 X130.808 Y129.186 E.06983
M73 P70 R3
G1 X131.395 Y128.676 E.02893
G2 X131.842 Y127.727 I-1.529 J-1.302 E.03954
; WIPE_START
G1 X132.236 Y127.702 E-.14981
G1 X132.236 Y128.065 E-.13786
G1 X132.259 Y128.303 E-.0912
G1 X132.316 Y128.53 E-.08864
G1 X132.433 Y128.811 E-.11582
G1 X132.683 Y129.186 E-.17121
G1 X132.669 Y129.186 E-.00546
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X130.976 Y126.307 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X130.9 Y126.012 I.568 J-.304 E.01144
G1 X130.902 Y123.936 E.07733
G1 X130.927 Y123.811 E.00475
G2 X131.132 Y123.365 I-5.777 J-2.924 E.01827
G3 X131.883 Y123.289 I.472 J.91 E.02882
G3 X132.348 Y123.976 I-.338 J.73 E.03246
G1 X132.35 Y125.2 E.0456
G1 X133.15 Y125.2 E.02981
G1 X133.15 Y123.98 E.04543
G3 X133.792 Y123.214 I.805 J.022 E.04018
G3 X134.75 Y123.98 I.154 J.789 E.05197
G1 X134.748 Y128.079 E.15264
G3 X133.15 Y128.02 I-.797 J-.082 E.08986
G1 X133.15 Y126.8 E.04544
G1 X132.748 Y126.8 E.01498
G3 X131.475 Y126.664 I-.11 J-5.008 E.04781
G1 X131.388 Y126.628 E.0035
G3 X131.007 Y126.358 I.157 J-.625 E.01779
M204 S6000
G1 X130.565 Y126 F30000
G1 F3000
M204 S500
G3 X130.694 Y126.143 I-.635 J.699 E.00719
G3 X130.8 Y126.805 I-1.021 J.503 E.02533
G3 X130.923 Y127.493 I-3.625 J1 E.02608
G3 X130.72 Y128.051 I-.799 J.026 E.02265
G3 X130.055 Y128.62 I-17.946 J-20.295 E.0326
G3 X129.57 Y128.8 I-.494 J-.589 E.01966
G1 X127.671 Y128.798 E.07071
G3 X126.95 Y128.02 I.089 J-.805 E.0431
G1 X126.952 Y123.921 E.15264
G3 X127.603 Y123.213 I.81 J.091 E.03835
G3 X129.581 Y123.216 I.931 J37.113 E.07367
G3 X130.048 Y123.42 I-.146 J.968 E.01921
G2 X130.652 Y124.087 I5.691 J-4.553 E.03354
G3 X130.8 Y124.488 I-.776 J.513 E.01606
G1 X130.8 Y125.512 E.03816
G3 X130.61 Y125.96 I-.651 J-.013 E.01855
; WIPE_START
G1 X130.694 Y126.143 E-.07688
G1 X130.789 Y126.38 E-.09696
G1 X130.8 Y126.805 E-.16151
G1 X130.873 Y127.122 E-.12362
G1 X130.923 Y127.493 E-.14235
G1 X130.918 Y127.636 E-.05443
G1 X130.886 Y127.765 E-.05034
G1 X130.826 Y127.894 E-.05391
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X131.331 Y127.101 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X131.381 Y127.47 E.01388
G3 X131.057 Y128.364 I-1.285 J.041 E.03625
G3 X130.34 Y128.978 I-19.369 J-21.891 E.03518
G3 X129.592 Y129.257 I-.766 J-.912 E.03031
G1 X127.626 Y129.255 E.07323
G3 X126.493 Y128.042 I.139 J-1.265 E.06735
G1 X126.495 Y123.876 E.15516
G3 X127.525 Y122.761 I1.273 J.142 E.06052
G3 X129.625 Y122.76 I1.068 J27.315 E.07826
G3 X130.365 Y123.087 I-.112 J1.252 E.03068
G1 X130.629 Y123.399 E.0152
G1 X130.774 Y123.02 E.01509
G1 X131.177 Y122.849 E.0163
G3 X132.032 Y122.849 I.428 J1.554 E.03224
G1 X132.305 Y122.999 E.01159
G3 X132.745 Y123.543 I-1.177 J1.403 E.02624
G1 X132.975 Y123.2 E.0154
G3 X133.701 Y122.764 I.994 J.834 E.03212
G3 X135.207 Y123.958 I.245 J1.238 E.08138
G1 X135.205 Y128.124 E.15516
G3 X132.693 Y128.042 I-1.253 J-.128 E.14089
G1 X132.693 Y127.256 E.02929
G3 X131.39 Y127.115 I-.073 J-5.416 E.04895
; WIPE_START
G1 X131.381 Y127.47 E-.1351
G1 X131.373 Y127.7 E-.08723
G1 X131.322 Y127.905 E-.08056
G1 X131.194 Y128.181 E-.11549
G1 X131.057 Y128.364 E-.0867
G1 X130.548 Y128.8 E-.25492
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X126.037 Y125.998 Z.6 F30000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X126.036 Y128.064 E.07697
G2 X126.496 Y129.186 I1.833 J-.097 E.04602
G1 X120.39 Y129.186 E.22741
G2 X121.28 Y128.319 I-2.497 J-3.451 E.04644
G2 X116.631 Y128.784 I-2.53 J-1.819 E.53239
G1 X117.11 Y129.186 E.02328
G1 X115.064 Y129.186 E.07618
G1 X115.064 Y122.814 E.23732
G1 X126.483 Y122.814 E.42532
G1 X126.233 Y123.189 E.01679
G2 X126.038 Y123.831 I1.515 J.81 E.02516
G1 X126.037 Y125.938 E.07847
; WIPE_START
G1 X126.036 Y127.938 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X118.411 Y128.267 Z.6 F30000
G1 X115.718 Y128.384 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X115.941 Y128.729 E.01531
G1 X115.521 Y128.729 E.01563
G1 X115.521 Y128.442 E.0107
G1 X115.66 Y128.401 E.0054
; WIPE_START
G1 X115.941 Y128.729 E-.25564
G1 X115.521 Y128.729 E-.24844
G1 X115.521 Y128.442 E-.17005
G1 X115.66 Y128.401 E-.08586
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X116.623 Y123.642 Z.6 F30000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X116.456 Y123.766 E.00774
G2 X115.711 Y124.613 I2.382 J2.847 E.04216
G1 X115.521 Y124.551 E.00744
G1 X115.521 Y123.271 E.04768
G1 X116.806 Y123.271 E.04784
G1 X116.862 Y123.471 E.00774
G1 X116.671 Y123.607 E.00872
; WIPE_START
G1 X116.456 Y123.766 E-.10174
G1 X116.192 Y124.005 E-.13539
G1 X115.956 Y124.272 E-.13523
G1 X115.711 Y124.613 E-.15946
G1 X115.521 Y124.551 E-.07591
G1 X115.521 Y124.151 E-.15227
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X123.028 Y125.529 Z.6 F30000
G1 X125.58 Y125.998 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X125.579 Y128.087 E.07781
G2 X125.704 Y128.729 I1.676 J.006 E.02453
M73 P71 R3
G1 X121.559 Y128.729 E.15439
G2 X121.544 Y124.272 I-2.891 J-2.218 E.1786
G2 X120.638 Y123.471 I-2.716 J2.158 E.04527
G1 X120.694 Y123.271 E.00774
G1 X125.683 Y123.271 E.18582
G1 X125.581 Y123.786 E.01955
G1 X125.58 Y125.938 E.08014
; WIPE_START
G1 X125.579 Y127.938 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X124.502 Y123.454 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.51866
G1 F6300
M204 S500
G1 X125.192 Y124.144 E.03784
G1 X125.192 Y124.817 E.02607
G1 X124.035 Y123.66 E.06344
G1 X123.362 Y123.66 E.02608
G1 X125.192 Y125.489 E.1003
G1 X125.191 Y126.162 E.02607
G1 X122.689 Y123.66 E.13717
G1 X122.016 Y123.66 E.02608
G1 X125.191 Y126.834 E.17404
G1 X125.191 Y127.507 E.02607
G1 X122.139 Y124.455 E.16732
G3 X122.602 Y125.59 I-2.967 J1.871 E.04778
G1 X125.198 Y128.187 E.14237
G1 X125.213 Y128.34 E.00597
G1 X124.679 Y128.34 E.02073
G1 X122.705 Y126.367 E.1082
G3 X122.678 Y127.012 I-5.122 J.107 E.02507
G1 X124.006 Y128.34 E.0728
G1 X123.333 Y128.34 E.02608
G1 X122.561 Y127.568 E.04236
G3 X122.387 Y128.066 I-2.578 J-.62 E.02051
G1 X122.866 Y128.546 E.02629
; WIPE_START
G1 X122.387 Y128.066 E-.25774
G1 X122.506 Y127.762 E-.12422
G1 X122.561 Y127.568 E-.07673
G1 X123.121 Y128.128 E-.30131
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X121.205 Y128.806 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.114012
G1 F3000
M204 S500
G1 X121.084 Y128.957 E.00112
M204 S6000
G1 X120.158 Y129.047 F30000
; LINE_WIDTH: 0.116536
G1 F3000
M204 S500
G1 X120.02 Y129.141 E.001
; LINE_WIDTH: 0.152201
G1 X119.896 Y129.217 E.0013
; LINE_WIDTH: 0.196902
G1 X119.764 Y129.298 E.00194
; LINE_WIDTH: 0.22857
G1 X119.727 Y129.317 E.00063
; LINE_WIDTH: 0.218166
G1 X119.604 Y129.336 E.00179
; LINE_WIDTH: 0.180016
G1 X119.474 Y129.355 E.00146
; LINE_WIDTH: 0.1464
G1 X119.33 Y129.37 E.00122
; LINE_WIDTH: 0.114
G1 X119.185 Y129.384 E.00085
G1 X119.153 Y129.358 E.00024
M204 S6000
G1 X118.345 Y129.387 F30000
; LINE_WIDTH: 0.1174
G1 F3000
M204 S500
G1 X118.186 Y129.371 E.00097
; LINE_WIDTH: 0.146903
G1 X118.02 Y129.355 E.00141
; LINE_WIDTH: 0.180941
G1 X117.896 Y129.336 E.00141
; LINE_WIDTH: 0.220677
G3 X117.729 Y129.293 I-.016 J-.286 E.00255
; LINE_WIDTH: 0.195566
G1 X117.605 Y129.217 E.00181
; LINE_WIDTH: 0.151538
G1 X117.477 Y129.139 E.00133
; LINE_WIDTH: 0.116162
G1 X117.342 Y129.047 E.00097
M204 S6000
G1 X116.416 Y128.957 F30000
; LINE_WIDTH: 0.114005
G1 F3000
M204 S500
G1 X116.295 Y128.806 E.00112
M204 S6000
G1 X115.561 Y128.191 F30000
; LINE_WIDTH: 0.476242
G1 F3000
M204 S500
G3 X115.504 Y127.953 I4.77 J-1.267 E.00865
; LINE_WIDTH: 0.445272
G1 X115.483 Y127.842 E.00371
; LINE_WIDTH: 0.403216
G1 X115.462 Y127.731 E.00332
; LINE_WIDTH: 0.36116
G1 X115.441 Y127.62 E.00293
; LINE_WIDTH: 0.337733
G1 X115.439 Y127.605 E.00036
; LINE_WIDTH: 0.312301
G1 X115.416 Y127.438 E.0037
; LINE_WIDTH: 0.266262
G1 X115.393 Y127.271 E.00307
; LINE_WIDTH: 0.227311
G1 X115.377 Y127.095 E.00266
; LINE_WIDTH: 0.197279
G1 X115.363 Y126.928 E.0021
; LINE_WIDTH: 0.165218
G1 X115.354 Y126.248 E.00677
; LINE_WIDTH: 0.185941
G1 X115.375 Y125.909 E.00396
; LINE_WIDTH: 0.226451
G1 X115.394 Y125.734 E.00263
; LINE_WIDTH: 0.264933
G1 X115.413 Y125.567 E.00303
; LINE_WIDTH: 0.30327
G1 X115.433 Y125.444 E.00265
; LINE_WIDTH: 0.341543
G1 X115.451 Y125.333 E.00274
; LINE_WIDTH: 0.377879
G1 X115.469 Y125.222 E.00307
; LINE_WIDTH: 0.399422
G1 X115.549 Y124.8 E.01246
; WIPE_START
G1 X115.469 Y125.222 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X117.052 Y123.303 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.428016
G1 F3000
M204 S500
G3 X117.496 Y123.217 I1.977 J8.935 E.01418
; LINE_WIDTH: 0.371207
G1 X117.607 Y123.197 E.00302
; LINE_WIDTH: 0.332038
G1 X117.718 Y123.177 E.00266
; LINE_WIDTH: 0.289048
G1 X117.899 Y123.154 E.00367
; LINE_WIDTH: 0.245199
G1 X118.068 Y123.133 E.00279
; LINE_WIDTH: 0.223219
G1 X118.077 Y123.132 E.00014
; LINE_WIDTH: 0.197423
G1 X118.416 Y123.107 E.00428
; LINE_WIDTH: 0.164039
G1 X119.093 Y123.108 E.00668
; LINE_WIDTH: 0.198006
G1 X119.426 Y123.133 E.00422
; LINE_WIDTH: 0.244571
G1 X119.602 Y123.154 E.00291
; LINE_WIDTH: 0.287458
G1 X119.769 Y123.175 E.00335
; LINE_WIDTH: 0.329663
G1 X119.893 Y123.197 E.00295
; LINE_WIDTH: 0.371146
G1 X120.004 Y123.217 E.00302
; LINE_WIDTH: 0.410323
G1 X120.115 Y123.236 E.00338
; LINE_WIDTH: 0.43385
G1 X120.448 Y123.303 E.01081
; WIPE_START
G1 X120.115 Y123.236 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X126.768 Y122.843 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.125168
G1 F3000
M204 S500
G1 X126.897 Y122.714 E.00122
; LINE_WIDTH: 0.169671
G1 X127.025 Y122.586 E.00188
M204 S6000
G1 X127.165 Y122.603 F30000
; LINE_WIDTH: 0.149146
G1 F3000
M204 S500
G1 X126.846 Y122.683 E.00285
; WIPE_START
G1 X127.165 Y122.603 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X130.074 Y122.596 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.215797
G1 F3000
M204 S500
G1 X130.74 Y122.787 E.00976
M204 S6000
G1 X130.533 Y122.928 F30000
; LINE_WIDTH: 0.223185
G1 F3000
M204 S500
G1 X130.526 Y122.862 E.00098
; LINE_WIDTH: 0.266662
G1 X130.519 Y122.796 E.00121
; LINE_WIDTH: 0.31014
G1 X130.512 Y122.73 E.00145
; LINE_WIDTH: 0.32407
G1 X131.066 Y122.586 E.01312
; WIPE_START
G1 X130.512 Y122.73 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X132.468 Y122.839 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.165593
G1 F3000
M204 S500
G1 X133.361 Y122.603 E.00924
M204 S6000
G1 X133.323 Y122.586 F30000
; LINE_WIDTH: 0.33939
G1 F3000
M204 S500
G1 X132.511 Y122.877 E.02086
M204 S6000
G1 X132.743 Y123.13 F30000
; LINE_WIDTH: 0.466976
G1 F3000
M204 S500
G1 X132.747 Y122.801 E.01137
G1 X132.205 Y122.586 E.02013
M204 S6000
G1 X132.121 Y122.586 F30000
; LINE_WIDTH: 0.293745
G1 F3000
M204 S500
G1 X132.988 Y122.864 E.0186
; WIPE_START
G1 X132.121 Y122.586 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X132.921 Y124.386 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.367264
G1 F3000
M204 S500
G1 X132.858 Y124.291 E.00302
; LINE_WIDTH: 0.327283
G1 X132.795 Y124.196 E.00264
; LINE_WIDTH: 0.287302
G1 X132.732 Y124.101 E.00227
; LINE_WIDTH: 0.247322
G1 X132.669 Y124.006 E.0019
; LINE_WIDTH: 0.199378
G2 X132.572 Y123.716 I-4.362 J1.305 E.00389
M204 S6000
G1 X132.56 Y123.722 F30000
; LINE_WIDTH: 0.116644
G1 F3000
M204 S500
G3 X132.921 Y124.574 I-11.558 J5.413 E.00556
M204 S6000
G1 X132.578 Y124.571 F30000
; LINE_WIDTH: 0.118769
G1 F3000
M204 S500
G3 X132.937 Y123.714 I8.959 J3.254 E.00575
M204 S6000
G1 X132.924 Y123.708 F30000
; LINE_WIDTH: 0.210903
G1 F3000
M204 S500
G2 X132.826 Y124.008 I6.12 J2.165 E.00432
; LINE_WIDTH: 0.253839
G1 X132.807 Y124.037 E.00061
; LINE_WIDTH: 0.291957
G1 X132.787 Y124.067 E.00072
; LINE_WIDTH: 0.330075
G1 X132.768 Y124.097 E.00083
; LINE_WIDTH: 0.386158
G1 X132.749 Y124.127 E.00099
G1 X132.75 Y124.971 E.02363
; WIPE_START
G1 X132.749 Y124.127 E-.72953
G1 X132.768 Y124.097 E-.03047
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X134.611 Y122.586 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.14431
G1 F3000
M204 S500
G1 X134.712 Y122.669 E.00108
; LINE_WIDTH: 0.116714
G1 X134.814 Y122.752 E.00079
; WIPE_START
G1 X134.712 Y122.669 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X139.351 Y123.454 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50986
G1 F6300
M204 S500
G1 X140.09 Y124.193 E.03978
G1 X140.09 Y124.854 E.02513
G1 X138.897 Y123.66 E.06424
G1 X138.236 Y123.66 E.02513
G1 X140.09 Y125.514 E.09978
G1 X140.09 Y126.174 E.02513
G1 X137.576 Y123.66 E.13531
G1 X136.915 Y123.66 E.02513
G1 X140.09 Y126.835 E.17084
G1 X140.09 Y127.495 E.02513
G1 X136.51 Y123.914 E.19268
G1 X136.509 Y124.574 E.02511
G1 X140.09 Y128.155 E.1927
M73 P72 R3
G1 X140.09 Y128.34 E.00704
G1 X139.615 Y128.34 E.01808
G1 X136.509 Y125.234 E.16714
G1 X136.509 Y125.894 E.02511
G1 X138.955 Y128.34 E.13162
G1 X138.294 Y128.34 E.02513
G1 X136.508 Y126.554 E.09611
G1 X136.508 Y127.214 E.02511
G1 X137.634 Y128.34 E.06059
G1 X136.974 Y128.34 E.02513
G1 X136.302 Y127.669 E.03614
; WIPE_START
G1 X136.974 Y128.34 E-.36089
G1 X137.634 Y128.34 E-.25093
G1 X137.358 Y128.065 E-.14818
; WIPE_END
G1 E-.03999 F1800
M204 S6000
G1 X134.854 Y129.317 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.149146
G1 F3000
M204 S500
G1 X134.535 Y129.397 E.00285
; WIPE_START
G1 X134.854 Y129.317 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X133.361 Y129.397 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.168294
G1 F3000
M204 S500
G3 X133.151 Y129.34 I.69 J-2.958 E.00223
; LINE_WIDTH: 0.169652
G1 X133.059 Y129.249 E.00133
; LINE_WIDTH: 0.125161
G1 X132.968 Y129.157 E.00087
; WIPE_START
G1 X133.059 Y129.249 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X127.161 Y129.397 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.165818
G1 F3000
M204 S500
G1 X126.983 Y129.35 E.00185
; LINE_WIDTH: 0.155116
G1 X126.898 Y129.269 E.00107
; LINE_WIDTH: 0.120319
G1 X126.814 Y129.189 E.00074
; WIPE_START
G1 X126.898 Y129.269 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X128.4 Y127.35 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X128.4 Y126.65 E.02607
G1 X129.315 Y126.65 E.03407
G1 X129.5 Y126.804 E.00899
G1 X129.5 Y127.196 E.01457
G1 X129.315 Y127.35 E.00899
G1 X128.46 Y127.35 E.03183
M204 S6000
G1 X128.629 Y127 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.28586
G1 F3000
M204 S500
G1 X129.271 Y127 E.01273
; WIPE_START
G1 X128.629 Y127 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X128.4 Y125.35 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X128.4 Y124.65 E.02607
G1 X129.315 Y124.65 E.03407
G1 X129.5 Y124.804 E.00899
M73 P72 R2
G1 X129.5 Y125.196 E.01457
G1 X129.315 Y125.35 E.00899
G1 X128.46 Y125.35 E.03183
M204 S6000
G1 X128.629 Y125 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.28586
G1 F3000
M204 S500
G1 X129.271 Y125 E.01273
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X128.629 Y125 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/45
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
G1 X131.092 Y127.816
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12003
G1 X131.04 Y127.957 E.00498
G3 X130.866 Y128.205 I-.937 J-.473 E.0101
G1 X130.181 Y128.779 E.02964
G3 X129.58 Y129.002 I-.614 J-.732 E.0217
G1 X127.651 Y129 E.06397
G3 X126.748 Y128.03 I.111 J-1.009 E.04793
G1 X126.75 Y123.901 E.13694
G3 X127.72 Y122.998 I.998 J.099 E.04806
G1 X129.58 Y122.998 E.06168
G3 X130.029 Y123.116 I-.046 J1.086 E.01551
G3 X130.622 Y123.589 I-2.078 J3.218 E.0252
G1 X130.773 Y123.362 E.00903
G3 X132.552 Y123.979 I.775 J.639 E.08094
G1 X132.552 Y124.998 E.03379
G1 X132.948 Y124.998 E.01313
G1 X132.948 Y123.97 E.03409
G3 X134.952 Y123.97 I1.002 J.039 E.10191
G1 X134.95 Y128.099 E.13694
G3 X132.948 Y128.03 I-.999 J-.102 E.10012
G1 X132.948 Y127.002 E.03409
G1 X131.52 Y127.002 E.04736
G3 X131.152 Y126.933 I.049 J-1.277 E.01248
G1 X131.152 Y127.529 E.01979
G3 X131.134 Y127.685 I-1.048 J-.046 E.0052
G1 X131.11 Y127.759 E.00257
G1 X130.727 Y127.692 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X130.585 Y127.929 I-.607 J-.203 E.00856
G1 X129.937 Y128.472 E.02598
G3 X129.56 Y128.61 I-.486 J-.741 E.01243
G1 X127.69 Y128.608 E.05747
G3 X127.14 Y128.01 I.068 J-.614 E.02723
G1 X127.142 Y123.94 E.12507
G3 X127.74 Y123.39 I.639 J.095 E.02699
G1 X129.56 Y123.39 E.05595
G3 X129.933 Y123.525 I-.061 J.749 E.01231
G1 X130.544 Y124.035 E.02447
G3 X130.76 Y124.49 I-.415 J.475 E.01592
G1 X130.76 Y125.51 E.03136
G3 X130.503 Y126 I-.678 J-.044 E.0175
G3 X130.76 Y126.49 I-.464 J.556 E.01744
G1 X130.76 Y127.51 E.03136
G3 X130.744 Y127.634 I-.64 J-.021 E.00385
; WIPE_START
M204 S10000
G1 X130.657 Y127.841 E-.08524
G1 X130.585 Y127.929 E-.04309
G1 X129.937 Y128.472 E-.32129
G1 X129.786 Y128.563 E-.06699
G1 X129.56 Y128.61 E-.08768
G1 X129.151 Y128.61 E-.15572
; WIPE_END
G1 E-.04 F1800
G1 X133.34 Y126.61 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X131.54 Y126.61 E.05532
G3 X130.94 Y126.01 I.015 J-.615 E.02875
G1 X130.942 Y123.94 E.06361
G3 X132.16 Y123.993 I.608 J.061 E.05678
G1 X132.16 Y125.39 E.04293
G1 X133.34 Y125.39 E.03626
G1 X133.34 Y123.99 E.04303
G3 X133.828 Y123.402 I.652 J.045 E.02507
G3 X134.56 Y123.99 I.101 J.624 E.03253
G1 X134.558 Y128.06 E.12507
G3 X133.34 Y128.01 I-.607 J-.063 E.05663
G1 X133.34 Y126.67 E.04119
; WIPE_START
M204 S10000
G1 X131.54 Y126.61 E-.68452
G1 X131.368 Y126.583 E-.06614
G1 X131.345 Y126.573 E-.00935
; WIPE_END
G1 E-.04 F1800
G1 X126.292 Y129.084 Z.8 F30000
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12003
G1 X120.671 Y129.084 E.18647
G2 X116.829 Y129.084 I-1.921 J-2.581 E.53402
G1 X115.166 Y129.084 E.05516
G1 X115.166 Y122.916 E.20459
G1 X126.292 Y122.916 E.36907
G1 X126.142 Y123.14 E.00894
G2 X125.936 Y123.821 I1.607 J.86 E.02374
G1 X125.934 Y128.069 E.14093
G2 X126.256 Y129.036 I1.72 J-.037 E.03431
G1 X127.204 Y129.3 F30000
G1 F12003
G1 X127.161 Y129.491 E.00648
G1 X119.231 Y129.491 E.26308
G1 X119.209 Y129.271 E.00733
G2 X118.291 Y129.271 I-.459 J-2.771 E.5549
G1 X118.269 Y129.491 E.00733
G1 X114.759 Y129.491 E.11644
G1 X114.759 Y122.509 E.2316
G1 X127.161 Y122.509 E.41141
G1 X127.204 Y122.7 E.00648
G2 X126.343 Y123.861 I.537 J1.298 E.05038
G1 X126.341 Y128.049 E.13893
G2 X127.15 Y129.275 I1.424 J-.059 E.05118
; WIPE_START
G1 F16213.044
G1 X127.161 Y129.491 E-.08201
G1 X125.377 Y129.491 E-.67799
; WIPE_END
G1 E-.04 F1800
G1 X130.247 Y123.614 Z.8 F30000
G1 X131.004 Y122.7 Z.8
G1 Z.4
G1 E.8 F1800
G1 F12003
G2 X130.556 Y123.004 I.593 J1.357 E.01807
G2 X130.101 Y122.705 I-1.111 J1.195 E.01814
G1 X130.14 Y122.509 E.00663
G1 X130.961 Y122.509 E.02724
G1 X130.991 Y122.641 E.00449
; WIPE_START
G1 F16213.044
G1 X130.863 Y122.767 E-.06827
G1 X130.653 Y122.907 E-.09591
G1 X130.556 Y123.004 E-.05206
G1 X130.223 Y122.757 E-.15749
G1 X130.101 Y122.705 E-.05047
G1 X130.14 Y122.509 E-.07599
G1 X130.824 Y122.509 E-.25981
; WIPE_END
G1 E-.04 F1800
G1 X132.764 Y123.242 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F12003
G2 X132.102 Y122.706 I-1.402 J1.053 E.02854
G1 X132.142 Y122.509 E.00665
G1 X133.361 Y122.509 E.04047
G1 X133.404 Y122.7 E.00648
G2 X132.797 Y123.191 I.499 J1.238 E.02631
; WIPE_START
G1 F16213.044
G1 X132.426 Y122.893 E-.18065
G1 X132.217 Y122.753 E-.09579
G1 X132.102 Y122.706 E-.04704
G1 X132.142 Y122.509 E-.07615
G1 X133.09 Y122.509 E-.36037
; WIPE_END
G1 E-.04 F1800
G1 X132.134 Y127.93 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F12003
G2 X132.492 Y129.084 I1.862 J.054 E.0408
G1 X131.085 Y129.084 E.04669
G1 X131.449 Y128.779 E.01575
G2 X131.922 Y127.902 I-1.33 J-1.283 E.03345
G1 X132.074 Y127.923 E.00511
G1 X132.541 Y127.409 F30000
G1 F12003
G1 X132.541 Y128.05 E.02125
G2 X133.398 Y129.294 I1.415 J-.057 E.05287
G1 X133.358 Y129.491 E.00665
G1 X130.139 Y129.491 E.1068
G1 X130.092 Y129.307 E.00631
G2 X130.434 Y129.098 I-.523 J-1.24 E.01334
G1 X131.157 Y128.492 E.03129
G2 X131.559 Y127.409 I-1.036 J-1.001 E.03943
G1 X132.481 Y127.409 E.03058
; WIPE_START
G1 F16213.044
G1 X132.541 Y128.05 E-.24447
G1 X132.563 Y128.276 E-.08632
G1 X132.636 Y128.517 E-.09582
G1 X132.717 Y128.687 E-.07159
G1 X132.857 Y128.897 E-.09588
G1 X133.053 Y129.093 E-.10528
G1 X133.186 Y129.182 E-.06065
; WIPE_END
G1 E-.04 F1800
G1 X140.817 Y129.084 Z.8 F30000
G1 X140.834 Y129.084 Z.8
G1 Z.4
G1 E.8 F1800
G1 F12003
G1 X135.408 Y129.084 E.17999
G2 X135.764 Y128.179 I-1.6 J-1.153 E.0326
G1 X135.766 Y123.931 E.14092
G2 X135.428 Y122.916 I-2.07 J.127 E.03588
G1 X140.834 Y122.916 E.17932
G1 X140.834 Y129.024 E.2026
G1 X141.241 Y129.491 F30000
G1 F12003
G1 X134.539 Y129.491 E.22233
G1 X134.496 Y129.3 E.00648
G2 X135.357 Y128.139 I-.536 J-1.298 E.05039
G1 X135.359 Y123.951 E.13893
G2 X134.492 Y122.694 I-1.404 J.042 E.05354
G1 X134.538 Y122.509 E.00632
G1 X141.241 Y122.509 E.22234
G1 X141.241 Y129.431 E.22961
; WIPE_START
G1 F16213.044
M73 P73 R2
G1 X139.241 Y129.449 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.857 Y127.518 Z.8 F30000
G1 X118.818 Y124.109 Z.8
G1 Z.4
G1 E.8 F1800
G1 F12003
G1 X118.989 Y124.109 E.00568
G3 X118.531 Y124.108 I-.234 J2.39 E.48524
G1 X118.758 Y124.109 E.00751
G1 X118.56 Y124.5 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.569 Y124.499 E.00026
G1 X118.75 Y124.49 E.00558
G3 X118.353 Y124.531 I.009 J2.009 E.3756
G1 X118.501 Y124.509 E.0046
; WIPE_START
M204 S10000
G1 X118.569 Y124.499 E-.02601
G1 X118.75 Y124.49 E-.06898
G1 X119.148 Y124.53 E-.15213
G1 X119.531 Y124.648 E-.15212
G1 X119.882 Y124.839 E-.1521
G1 X120.189 Y125.096 E-.15213
G1 X120.282 Y125.213 E-.05653
; WIPE_END
G1 E-.04 F1800
G1 X127.737 Y126.848 Z.8 F30000
G1 X141.648 Y129.898 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12003
G1 X114.352 Y129.898 E.90545
G1 X114.352 Y122.102 E.2586
G1 X141.648 Y122.102 E.90545
G1 X141.648 Y129.838 E.25661
G1 X142.04 Y130.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X113.96 Y130.29 E.86282
G1 X113.96 Y121.71 E.26364
G1 X142.04 Y121.71 E.86282
G1 X142.04 Y130.23 E.2618
; WIPE_START
M204 S10000
G1 X140.04 Y130.234 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.158 Y123.921 Z.8 F30000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F12003
G1 X136.156 Y128.199 E.13146
G1 X136.052 Y128.692 E.01547
G1 X140.442 Y128.692 E.13489
G1 X140.442 Y123.308 E.16542
G1 X136.034 Y123.308 E.13544
G3 X136.153 Y123.861 I-1.147 J.535 E.01752
G1 X136.535 Y123.921 F30000
G1 F12003
G1 X136.527 Y128.31 E.13487
G1 X140.065 Y128.315 E.1087
G1 X140.065 Y123.685 E.14224
G1 X136.515 Y123.685 E.10907
G1 X136.53 Y123.861 E.00542
G1 X138.077 Y126.549 F30000
; LINE_WIDTH: 0.48831
G1 F12003
G1 X138.077 Y126.772 E.00809
G1 X138.522 Y126.772 E.01617
G1 X138.522 Y125.228 E.05605
G1 X138.077 Y125.228 E.01616
G1 X138.077 Y126.489 E.04579
G1 X137.665 Y127.183 F30000
; LINE_WIDTH: 0.41999
G1 F12003
G1 X138.933 Y127.183 E.03897
G1 X138.933 Y124.817 E.07273
G1 X137.666 Y124.817 E.03894
G1 X137.665 Y127.123 E.07088
G1 X137.288 Y127.561 F30000
G1 F12003
G1 X139.311 Y127.561 E.06215
G1 X139.311 Y124.439 E.0959
G1 X137.289 Y124.439 E.06211
G1 X137.288 Y127.501 E.09406
G1 X136.911 Y127.938 F30000
G1 F12003
G1 X139.688 Y127.938 E.08533
G1 X139.688 Y124.062 E.11907
G1 X136.912 Y124.062 E.08527
G1 X136.911 Y127.878 E.11723
; WIPE_START
G1 F15000
G1 X136.912 Y125.878 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.337 Y127.682 Z.8 F30000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.15705
G1 F12003
G1 X132.046 Y127.663 E.00272
; LINE_WIDTH: 0.12515
G1 X131.754 Y127.644 E.00196
G1 X131.971 Y128.427 F30000
; LINE_WIDTH: 0.305885
G1 F12003
G1 X131.921 Y128.741 E.00682
G1 X131.94 Y128.755 E.00051
; LINE_WIDTH: 0.278755
G1 X131.959 Y128.769 E.00046
; LINE_WIDTH: 0.253903
G1 X132.12 Y128.88 E.00336
; WIPE_START
G1 F15000
G1 X131.959 Y128.769 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.915 Y129.434 Z.8 F30000
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.533056
G1 F12003
G3 X129.589 Y129.45 I-.471 J-6.44 E.01301
G1 X127.631 Y129.449 E.07822
; LINE_WIDTH: 0.50879
G1 X127.535 Y129.317 E.0062
; LINE_WIDTH: 0.460188
G1 X127.439 Y129.185 E.00555
; WIPE_START
G1 F15000
G1 X127.535 Y129.317 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.542 Y128.079 Z.8 F30000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F12003
G1 X125.544 Y123.801 E.13146
G1 X125.648 Y123.308 E.01547
G1 X121.015 Y123.308 E.14236
G1 X120.947 Y123.648 E.01066
G1 X121.347 Y123.993 E.01624
G1 X121.772 Y124.526 E.02093
G1 X122.103 Y125.164 E.0221
G1 X122.301 Y125.855 E.02207
G1 X122.359 Y126.571 E.02208
G1 X122.273 Y127.285 E.02208
G1 X122.048 Y127.967 E.02209
G1 X121.692 Y128.592 E.02208
G1 X121.61 Y128.692 E.00396
G1 X125.666 Y128.692 E.12462
G3 X125.547 Y128.139 I1.146 J-.535 E.01752
G1 X125.165 Y128.079 F30000
G1 F12003
G1 X125.173 Y123.69 E.13487
G1 X121.571 Y123.685 E.11068
G1 X122.067 Y124.291 E.02404
G1 X122.439 Y124.992 E.02439
G1 X122.664 Y125.752 E.02437
G1 X122.735 Y126.543 E.02438
G1 X122.647 Y127.331 E.02438
G1 X122.405 Y128.087 E.02439
G1 X122.287 Y128.315 E.00787
G1 X125.185 Y128.315 E.08905
G1 X125.17 Y128.139 E.00543
G1 X123.927 Y127.077 F30000
; LINE_WIDTH: 0.61272
G1 F11583.013
G1 X123.948 Y126.452 E.02903
; LINE_WIDTH: 0.604465
G1 F11753.288
G1 X123.937 Y126.141 E.01423
; LINE_WIDTH: 0.630155
G1 F11239.112
G1 X123.925 Y125.83 E.01488
G1 X124.021 Y125.407 F30000
; LINE_WIDTH: 0.436186
G1 F12003
G1 X124.03 Y124.821 E.01879
G1 X123.582 Y124.821 E.01436
G1 X123.767 Y125.442 E.02077
; LINE_WIDTH: 0.472559
G1 X123.806 Y125.524 E.00318
; LINE_WIDTH: 0.521257
G1 X123.845 Y125.606 E.00354
; LINE_WIDTH: 0.569954
G1 X123.884 Y125.688 E.0039
; LINE_WIDTH: 0.618652
G1 F11463.683
G1 X123.923 Y125.77 E.00426
G1 X123.944 Y125.694 E.0037
; LINE_WIDTH: 0.569954
G1 F12003
G1 X123.964 Y125.618 E.00339
; LINE_WIDTH: 0.521257
G1 X123.985 Y125.542 E.00308
; LINE_WIDTH: 0.472559
G1 X124.005 Y125.465 E.00276
G1 X124.412 Y124.439 F30000
; LINE_WIDTH: 0.41999
G1 F12003
G1 X123.003 Y124.439 E.0433
G1 X123.206 Y124.893 E.01526
G1 X123.39 Y125.548 E.02093
G1 X123.487 Y126.486 E.02898
G3 X123.365 Y127.561 I-7.27 J-.283 E.03325
G1 X124.411 Y127.561 E.03214
G1 X124.412 Y124.499 E.09406
G1 X124.789 Y124.062 F30000
G1 F12003
G1 X122.366 Y124.062 E.07447
G1 X122.774 Y124.82 E.02645
G1 X123.027 Y125.65 E.02667
G1 X123.111 Y126.515 E.02668
G1 X123.021 Y127.378 E.02668
G1 X122.853 Y127.938 E.01794
G1 X124.788 Y127.938 E.05944
G1 X124.789 Y124.122 E.11723
; WIPE_START
G1 F15000
G1 X124.788 Y126.122 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.383 Y122.566 Z.8 F30000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53267
G1 F12003
G1 X127.686 Y122.551 E.01213
G3 X129.59 Y122.55 I.964 J38.782 E.07598
G3 X129.921 Y122.566 I-.153 J6.665 E.01324
; WIPE_START
G1 F13476.273
G1 X129.59 Y122.55 E-.12606
G1 X127.922 Y122.551 E-.63394
; WIPE_END
G1 E-.04 F1800
G1 X132.539 Y122.713 Z.8 F30000
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.212009
G1 F12003
G1 X132.752 Y122.798 E.00317
G1 X132.751 Y122.921 E.00169
; WIPE_START
G1 F15000
G1 X132.752 Y122.798 E-.26495
G1 X132.539 Y122.713 E-.49505
; WIPE_END
G1 E-.04 F1800
G1 X135.027 Y122.713 Z.8 F30000
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.104634
G1 F12003
G3 X135.157 Y122.894 I-1.709 J1.367 E.00112
; WIPE_START
G1 F15000
G1 X135.027 Y122.713 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.402 Y123.042 Z.8 F30000
G1 X120.61 Y123.336 Z.8
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.279545
G1 F12003
G1 X120.119 Y123.237 E.00965
; LINE_WIDTH: 0.257095
G1 X120.005 Y123.217 E.00202
; LINE_WIDTH: 0.216985
G1 X119.892 Y123.197 E.00164
; LINE_WIDTH: 0.175893
G1 X119.772 Y123.176 E.00131
; LINE_WIDTH: 0.14058
G1 X119.643 Y123.16 E.00104
; LINE_WIDTH: 0.111474
G1 X119.513 Y123.143 E.00073
G1 X117.987 Y123.143 F30000
; LINE_WIDTH: 0.111473
G1 F12003
G1 X117.857 Y123.16 E.00073
; LINE_WIDTH: 0.141242
G1 X117.722 Y123.177 E.00109
; LINE_WIDTH: 0.17692
G1 X117.608 Y123.197 E.00126
; LINE_WIDTH: 0.217024
G1 X117.495 Y123.217 E.00164
; LINE_WIDTH: 0.275365
G2 X116.89 Y123.336 I2.037 J11.886 E.01167
G1 X116.554 Y123.648 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F12003
G1 X116.485 Y123.308 E.01066
G1 X115.558 Y123.308 E.02847
G1 X115.558 Y124.231 E.02835
G1 X115.887 Y124.319 E.01044
G3 X116.508 Y123.687 I2.11 J1.454 E.02737
G1 X115.957 Y123.643 F30000
; LINE_WIDTH: 0.41588
G1 F12003
G1 X115.887 Y123.683 E.00245
G1 X115.945 Y123.717 E.00205
G1 X115.37 Y125.593 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.400036
G1 F12003
G3 X115.603 Y124.649 I18.883 J4.168 E.0283
G1 X115.579 Y124.641 F30000
; LINE_WIDTH: 0.24514
G1 F12003
G1 X115.47 Y125.218 E.00967
; LINE_WIDTH: 0.224642
G1 X115.451 Y125.332 E.00171
; LINE_WIDTH: 0.187449
G1 X115.433 Y125.445 E.00136
; LINE_WIDTH: 0.149543
G1 X115.414 Y125.563 E.00104
; LINE_WIDTH: 0.113678
G1 X115.394 Y125.739 E.00102
G1 X115.709 Y128.514 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.64544
G1 F10953.993
G2 X115.716 Y128.631 I-.034 J.061 E.0148
; WIPE_START
G1 X115.633 Y128.644 E-.20603
G1 X115.596 Y128.579 E-.18466
G1 X115.633 Y128.514 E-.18467
G1 X115.709 Y128.514 E-.18464
; WIPE_END
G1 E-.04 F1800
G1 X117.248 Y129.137 Z.8 F30000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.11237
G1 F12003
G1 X117.404 Y129.244 E.00107
G1 X117.505 Y129.266 E.00058
; WIPE_START
G1 F15000
G1 X117.404 Y129.244 E-.26797
G1 X117.248 Y129.137 E-.49203
; WIPE_END
G1 E-.04 F1800
G1 X119.995 Y129.266 Z.8 F30000
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.112403
G1 F12003
G1 X120.096 Y129.244 E.00059
G1 X120.253 Y129.137 E.00107
; WIPE_START
G1 F15000
G1 X120.096 Y129.244 E-.49203
G1 X119.995 Y129.266 E-.26797
; WIPE_END
G1 E-.04 F1800
G1 X127.442 Y127.596 Z.8 F30000
G1 X128.36 Y127.39 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X128.36 Y126.61 E.02397
G1 X129.329 Y126.61 E.02978
G1 X129.54 Y126.786 E.00843
G1 X129.54 Y127.214 E.01317
G1 X129.329 Y127.39 E.00843
G1 X128.42 Y127.39 E.02794
M204 S10000
G1 X128.556 Y127 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.43086
G1 F12003
G1 X129.344 Y127 E.02491
; WIPE_START
G1 F15000
G1 X128.556 Y127 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.36 Y125.39 Z.8 F30000
G1 Z.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X128.36 Y124.61 E.02397
G1 X129.329 Y124.61 E.02978
G1 X129.54 Y124.786 E.00843
G1 X129.54 Y125.214 E.01317
G1 X129.329 Y125.39 E.00843
G1 X128.42 Y125.39 E.02794
M204 S10000
G1 X128.556 Y125 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.43086
G1 F12003
G1 X129.344 Y125 E.02491
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X128.556 Y125 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/45
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
G1 X118.832 Y124.105
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X119.226 Y124.145 E.01313
G3 X118.511 Y124.109 I-.476 J2.354 E.47664
G1 X118.75 Y124.097 E.00795
G1 X118.773 Y124.099 E.00076
G1 X118.568 Y124.499 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.75 Y124.49 E.00559
G3 X118.509 Y124.504 I0 J2.009 E.38044
; WIPE_START
M204 S10000
G1 X118.75 Y124.49 E-.09185
G1 X119.148 Y124.53 E-.15213
G1 X119.531 Y124.648 E-.15208
G1 X119.882 Y124.839 E-.15214
G1 X120.189 Y125.096 E-.15214
G1 X120.287 Y125.219 E-.05967
; WIPE_END
G1 E-.04 F1800
G1 X127.788 Y126.63 Z1 F30000
G1 X140.834 Y129.084 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X120.671 Y129.084 E.66885
G2 X116.829 Y129.084 I-1.921 J-2.581 E.53395
G1 X115.166 Y129.084 E.05516
G1 X115.166 Y122.916 E.20459
G1 X140.834 Y122.916 E.85144
G1 X140.834 Y129.024 E.2026
G1 X141.241 Y129.491 F30000
G1 F16213.044
G1 X119.231 Y129.491 E.73012
G1 X119.209 Y129.271 E.00733
G2 X118.291 Y129.271 I-.459 J-2.77 E.55465
G1 X118.269 Y129.491 E.00733
G1 X114.759 Y129.491 E.11644
G1 X114.759 Y122.509 E.2316
G1 X141.241 Y122.509 E.87845
G1 X141.241 Y129.431 E.22961
M73 P74 R2
G1 X141.648 Y129.898 F30000
G1 F16213.044
G1 X114.352 Y129.898 E.90545
G1 X114.352 Y122.102 E.2586
G1 X141.648 Y122.102 E.90545
G1 X141.648 Y129.838 E.25661
G1 X142.04 Y130.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X113.96 Y130.29 E.86282
G1 X113.96 Y121.71 E.26364
G1 X142.04 Y121.71 E.86282
G1 X142.04 Y130.23 E.2618
; WIPE_START
M204 S10000
G1 X140.04 Y130.234 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137.094 Y128.042 Z1 F30000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
G1 X137.007 Y128.692 E.02013
G1 X140.442 Y128.692 E.10552
G1 X140.442 Y123.308 E.16542
G1 X137.018 Y123.308 E.10521
G3 X137.091 Y123.845 I-3.779 J.785 E.01666
G1 X137.094 Y127.982 E.12712
G1 X137.471 Y128.042 F30000
G1 F15000
G1 X137.453 Y128.315 E.0084
G1 X140.065 Y128.315 E.08025
G1 X140.065 Y123.685 E.14224
G1 X137.451 Y123.685 E.08031
G1 X137.468 Y123.845 E.00493
G1 X137.471 Y127.982 E.12712
G1 X138.589 Y124.984 F30000
; LINE_WIDTH: 0.397926
G1 F15000
G1 X138.59 Y127.195 E.06397
G1 X138.945 Y127.195 E.01026
G1 X138.944 Y124.806 E.06911
G1 X138.589 Y124.806 E.01029
G1 X138.589 Y124.924 E.00341
G1 X138.222 Y124.439 F30000
; LINE_WIDTH: 0.41999
G1 F15000
G1 X138.225 Y127.561 E.0959
G1 X139.311 Y127.561 E.03337
G1 X139.311 Y124.439 E.0959
G1 X138.282 Y124.439 E.0316
G1 X137.845 Y124.062 F30000
G1 F15000
G1 X137.848 Y127.938 E.11907
G1 X139.688 Y127.938 E.05653
G1 X139.688 Y124.062 E.11907
G1 X137.905 Y124.062 E.05478
G1 X136.792 Y123.257 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.43504
G1 F3000
G1 X125.084 Y123.253 E.37408
G1 X125.005 Y123.645 E.01278
G1 X136.695 Y123.649 E.37354
G1 X136.719 Y124.041 E.01255
G1 X124.983 Y124.038 E.37498
G1 X124.983 Y124.43 E.01253
G1 X136.718 Y124.433 E.37498
G1 X136.718 Y124.826 E.01253
G1 X124.983 Y124.822 E.37498
G1 X124.983 Y125.214 E.01253
G1 X136.718 Y125.218 E.37498
G1 X136.718 Y125.61 E.01253
G1 X124.983 Y125.606 E.37498
G1 X124.982 Y125.998 E.01253
G1 X136.718 Y126.002 E.37498
G1 X136.717 Y126.394 E.01253
G1 X124.982 Y126.39 E.37498
G1 X124.982 Y126.782 E.01253
G1 X136.717 Y126.786 E.37498
G1 X136.717 Y127.178 E.01253
G1 X124.982 Y127.174 E.37498
G1 X124.982 Y127.567 E.01253
G1 X136.717 Y127.57 E.37498
G1 X136.717 Y127.963 E.01253
G1 X124.981 Y127.959 E.37498
G1 X125.005 Y128.351 E.01255
G1 X136.695 Y128.355 E.37354
G1 X136.616 Y128.747 E.01278
G1 X124.908 Y128.743 E.37408
G1 X123.432 Y125.536 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483245
G1 F14988.928
G1 X123.457 Y126.012 E.01707
; LINE_WIDTH: 0.449005
G1 F15000
G1 X123.482 Y126.487 E.01575
G1 X123.436 Y127.431 E.03127
; LINE_WIDTH: 0.5089
G1 F14163.698
G1 X123.435 Y127.453 E.00085
G1 X123.432 Y125.536 F30000
; LINE_WIDTH: 0.483528
G1 F14979.319
G1 X123.456 Y125.196 E.01227
; LINE_WIDTH: 0.415961
G1 F15000
G2 X123.48 Y124.435 I-5.37 J-.547 E.02315
G1 X122.996 Y124.435 E.01471
G1 X123.201 Y124.893 E.01527
; LINE_WIDTH: 0.435343
G1 X123.307 Y125.187 E.00997
; LINE_WIDTH: 0.483528
G1 F14979.319
G1 X123.412 Y125.48 E.01119
G1 X124.609 Y127.512 F30000
; LINE_WIDTH: 0.41999
G1 F15000
G1 X124.606 Y123.958 E.10921
G1 X124.693 Y123.308 E.02013
G1 X121.015 Y123.308 E.11299
G1 X120.947 Y123.648 E.01066
G1 X121.347 Y123.993 E.01623
G1 X121.772 Y124.526 E.02094
G1 X122.103 Y125.164 E.02207
G1 X122.301 Y125.855 E.02209
G1 X122.359 Y126.571 E.02208
G1 X122.273 Y127.285 E.02209
G1 X122.048 Y127.968 E.02209
G1 X121.692 Y128.592 E.02208
G1 X121.61 Y128.692 E.00396
G1 X124.682 Y128.692 E.09438
G3 X124.609 Y127.572 I4.102 J-.83 E.03458
G1 X124.232 Y127.512 F30000
G1 F15000
G1 X124.229 Y123.958 E.10921
G1 X124.247 Y123.685 E.0084
G1 X121.571 Y123.685 E.08222
G1 X122.067 Y124.291 E.02404
G1 X122.438 Y124.992 E.02437
G1 X122.664 Y125.753 E.02439
G1 X122.735 Y126.543 E.02438
G1 X122.647 Y127.332 E.02439
G1 X122.405 Y128.088 E.02439
M73 P75 R2
G1 X122.287 Y128.315 E.00786
G1 X124.249 Y128.315 E.06029
G1 X124.233 Y127.572 E.02282
G1 X123.855 Y127.938 F30000
G1 F15000
G1 X123.852 Y124.062 E.11907
G1 X122.366 Y124.062 E.04567
G1 X122.774 Y124.82 E.02643
G1 X123.027 Y125.651 E.02669
G1 X123.111 Y126.515 E.02668
G1 X123.021 Y127.379 E.02669
G1 X122.853 Y127.938 E.01793
G1 X123.795 Y127.938 E.02894
; WIPE_START
G1 X122.853 Y127.938 E-.3579
G1 X123.021 Y127.379 E-.22177
G1 X123.07 Y126.907 E-.18033
; WIPE_END
G1 E-.04 F1800
G1 X120.252 Y129.138 Z1 F30000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.112283
G1 F15000
G1 X120.096 Y129.244 E.00107
G1 X119.995 Y129.266 E.00058
; WIPE_START
G1 X120.096 Y129.244 E-.26792
G1 X120.252 Y129.138 E-.49208
; WIPE_END
G1 E-.04 F1800
G1 X117.505 Y129.266 Z1 F30000
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.112345
G1 F15000
G1 X117.404 Y129.244 E.00058
G1 X117.248 Y129.137 E.00107
; WIPE_START
G1 X117.404 Y129.244 E-.49211
G1 X117.505 Y129.266 E-.26789
; WIPE_END
G1 E-.04 F1800
G1 X115.709 Y128.514 Z1 F30000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.64542
G1 F10954.358
G2 X115.716 Y128.631 I-.034 J.061 E.0148
G1 X115.394 Y125.739 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.113666
G1 F15000
G1 X115.413 Y125.564 E.00102
; LINE_WIDTH: 0.149503
G1 X115.433 Y125.445 E.00104
; LINE_WIDTH: 0.187407
G1 X115.451 Y125.332 E.00136
; LINE_WIDTH: 0.224599
G1 X115.47 Y125.218 E.00171
; LINE_WIDTH: 0.245087
G1 X115.579 Y124.641 E.00967
G1 X115.603 Y124.649 F30000
; LINE_WIDTH: 0.400135
G1 F15000
G2 X115.37 Y125.594 I18.876 J5.164 E.02833
G1 X116.553 Y123.648 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
G1 X116.485 Y123.308 E.01066
G1 X115.558 Y123.308 E.02847
G1 X115.558 Y124.231 E.02835
G1 X115.887 Y124.319 E.01044
G3 X116.508 Y123.687 I2.109 J1.452 E.02736
G1 X115.957 Y123.643 F30000
; LINE_WIDTH: 0.41586
G1 F15000
G1 X115.887 Y123.683 E.00245
G1 X115.945 Y123.717 E.00205
G1 X116.89 Y123.336 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.275308
G1 F15000
G3 X117.495 Y123.217 I2.712 J12.168 E.01167
; LINE_WIDTH: 0.216976
G1 X117.608 Y123.197 E.00164
; LINE_WIDTH: 0.176866
G1 X117.722 Y123.177 E.00126
; LINE_WIDTH: 0.141213
G1 X117.857 Y123.16 E.00109
; LINE_WIDTH: 0.111463
G1 X117.987 Y123.143 E.00073
G1 X119.513 Y123.143 F30000
; LINE_WIDTH: 0.111467
G1 F15000
G1 X119.643 Y123.16 E.00073
; LINE_WIDTH: 0.140562
G1 X119.772 Y123.176 E.00104
; LINE_WIDTH: 0.175875
G1 X119.892 Y123.197 E.00131
; LINE_WIDTH: 0.216971
G1 X120.005 Y123.217 E.00164
; LINE_WIDTH: 0.257086
G1 X120.119 Y123.237 E.00202
; LINE_WIDTH: 0.279549
G1 X120.61 Y123.336 E.00965
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X120.119 Y123.237 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/45
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
G1 X118.521 Y124.113
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8730
G1 X118.583 Y124.106 E.00206
G3 X119.226 Y124.145 I.165 J2.587 E.02144
G3 X118.275 Y124.148 I-.467 J2.355 E.46863
G1 X118.462 Y124.122 E.00627
G1 X118.585 Y124.499 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8730
M204 S5000
G1 X118.602 Y124.497 E.00052
G3 X119.148 Y124.53 I.145 J2.172 E.01686
G3 X118.352 Y124.532 I-.391 J1.97 E.36318
G1 X118.526 Y124.508 E.00538
; WIPE_START
G1 F12000
M204 S10000
G1 X118.602 Y124.497 E-.02929
G1 X118.602 Y124.497 E0
G1 X118.95 Y124.5 E-.13225
G1 X119.148 Y124.53 E-.07615
G1 X119.531 Y124.648 E-.15208
G1 X119.711 Y124.735 E-.0762
G1 X120.042 Y124.96 E-.15211
G1 X120.303 Y125.227 E-.14192
; WIPE_END
G1 E-.04 F1800
G1 X127.804 Y126.636 Z1.2 F30000
G1 X140.834 Y129.084 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8730
G1 X120.671 Y129.084 E.66884
G2 X116.829 Y129.084 I-1.921 J-2.581 E.534
G1 X115.166 Y129.084 E.05516
G1 X115.166 Y122.916 E.20459
G1 X140.834 Y122.916 E.85144
G1 X140.834 Y129.024 E.2026
G1 X141.241 Y129.491 F30000
G1 F8730
G1 X119.231 Y129.491 E.73012
G1 X119.209 Y129.271 E.00733
G2 X118.291 Y129.271 I-.459 J-2.77 E.55469
G1 X118.269 Y129.491 E.00733
G1 X114.759 Y129.491 E.11644
G1 X114.759 Y122.509 E.2316
G1 X141.241 Y122.509 E.87845
G1 X141.241 Y129.431 E.22961
G1 X141.648 Y129.898 F30000
G1 F8730
G1 X114.352 Y129.898 E.90545
G1 X114.352 Y122.102 E.2586
G1 X141.648 Y122.102 E.90545
G1 X141.648 Y129.838 E.25661
G1 X142.04 Y130.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8730
M204 S5000
G1 X113.96 Y130.29 E.86282
G1 X113.96 Y121.71 E.26364
G1 X142.04 Y121.71 E.86282
G1 X142.04 Y130.23 E.2618
; WIPE_START
G1 F12000
M204 S10000
G1 X140.04 Y130.234 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.193 Y125.221 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8730
G2 X136.163 Y123.594 I-8.392 J-.657 E.05406
G1 X136.493 Y123.264 E.01547
G1 X136.778 Y123.264 E.00948
G1 X140.486 Y126.972 E.17391
G1 X140.486 Y125.028 E.06446
G1 X136.778 Y128.736 E.17391
G1 X136.493 Y128.736 E.00948
G1 X136.156 Y128.399 E.01577
G2 X136.192 Y128.201 I-.991 J-.279 E.0067
G1 X136.192 Y126.774 E.04732
G1 X126.656 Y124.062 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F8730
G1 X126.652 Y127.938 E.11907
G1 X135.044 Y127.938 E.25784
G1 X135.048 Y124.062 E.11907
G1 X126.716 Y124.062 E.256
G1 X127.033 Y124.439 F30000
G1 F8730
G1 X127.03 Y127.561 E.0959
G1 X134.667 Y127.561 E.23467
G1 X134.67 Y124.439 E.0959
G1 X127.093 Y124.439 E.23282
G1 X127.41 Y124.817 F30000
G1 F8730
G1 X127.407 Y127.183 E.07273
G1 X134.291 Y127.183 E.2115
G1 X134.293 Y124.817 E.07273
G1 X127.47 Y124.817 E.20965
G1 X127.786 Y125.194 F30000
G1 F8730
G1 X127.785 Y126.806 E.04955
G1 X133.914 Y126.806 E.18832
G1 X133.915 Y125.194 E.04955
G1 X127.846 Y125.194 E.18648
G1 X128.592 Y126 F30000
; LINE_WIDTH: 0.52448
G1 F8730
G1 X133.048 Y126 E.17487
G1 X128.162 Y126.429 F30000
; LINE_WIDTH: 0.41999
G1 F8730
G1 X133.537 Y126.429 E.16515
G1 X133.538 Y125.571 E.02638
G1 X128.163 Y125.571 E.16515
G1 X128.162 Y126.369 E.02454
G1 X126.275 Y128.048 F30000
G1 F8730
G1 X126.313 Y128.315 E.00827
G1 X135.388 Y128.315 E.27885
G1 X135.421 Y128.136 E.00559
G1 X135.425 Y123.966 E.12813
G1 X135.387 Y123.685 E.00869
G1 X126.312 Y123.685 E.27885
G1 X126.279 Y123.864 E.00559
G1 X126.275 Y127.988 E.12672
G1 X125.898 Y128.066 F30000
G1 F8730
G2 X126.044 Y128.692 I1.617 J-.047 E.01987
G1 X135.666 Y128.692 E.29564
G1 X135.798 Y128.192 E.01589
G1 X135.802 Y123.966 E.12985
G2 X135.656 Y123.308 I-1.609 J.011 E.02085
G1 X126.034 Y123.308 E.29565
G1 X125.902 Y123.808 E.01588
G1 X125.898 Y128.006 E.129
G1 X125.508 Y125.177 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8730
G3 X125.512 Y123.759 I7.242 J-.686 E.04713
G1 X125.553 Y123.553 E.00696
G1 X125.264 Y123.264 E.01354
G1 X124.979 Y123.264 E.00948
G1 X122.274 Y125.969 E.12689
G1 X122.282 Y126.039 E.00234
G1 X124.979 Y128.736 E.12648
G1 X125.264 Y128.736 E.00948
G1 X125.546 Y128.454 E.01319
G3 X125.507 Y126.828 I7.929 J-1.003 E.05405
; WIPE_START
G1 F16200
G1 X125.546 Y128.454 E-.61808
G1 X125.282 Y128.718 E-.14192
; WIPE_END
G1 E-.04 F1800
G1 X120.253 Y129.137 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.112398
G1 F8730
G1 X120.096 Y129.244 E.00107
G1 X119.995 Y129.266 E.00059
; WIPE_START
G1 F15000
G1 X120.096 Y129.244 E-.2679
G1 X120.253 Y129.137 E-.4921
; WIPE_END
M73 P76 R2
G1 E-.04 F1800
G1 X117.505 Y129.266 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.112351
G1 F8730
G1 X117.404 Y129.244 E.00058
G1 X117.248 Y129.137 E.00107
; WIPE_START
G1 F15000
G1 X117.404 Y129.244 E-.49207
G1 X117.505 Y129.266 E-.26793
; WIPE_END
G1 E-.04 F1800
G1 X115.709 Y128.514 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.6454
G1 F8730
G2 X115.716 Y128.631 I-.034 J.061 E.0148
G1 X115.394 Y125.739 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.113676
G1 F8730
G1 X115.413 Y125.563 E.00102
; LINE_WIDTH: 0.149524
G1 X115.433 Y125.445 E.00104
; LINE_WIDTH: 0.18743
G1 X115.451 Y125.332 E.00136
; LINE_WIDTH: 0.224623
G1 X115.47 Y125.218 E.00171
; LINE_WIDTH: 0.245106
G1 X115.58 Y124.641 E.00967
G1 X115.603 Y124.649 F30000
; LINE_WIDTH: 0.400172
G1 F8730
G2 X115.37 Y125.593 I19.006 J5.197 E.02832
G1 X116.554 Y123.648 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F8730
G1 X116.485 Y123.308 E.01066
G1 X115.558 Y123.308 E.02847
G1 X115.558 Y124.231 E.02835
G1 X115.887 Y124.319 E.01044
G3 X116.508 Y123.687 I2.109 J1.453 E.02736
G1 X115.957 Y123.643 F30000
; LINE_WIDTH: 0.41588
G1 F8730
G1 X115.887 Y123.683 E.00245
G1 X115.945 Y123.717 E.00205
G1 X116.89 Y123.336 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.275327
G1 F8730
G3 X117.495 Y123.217 I2.65 J11.82 E.01167
; LINE_WIDTH: 0.217036
G1 X117.608 Y123.197 E.00164
; LINE_WIDTH: 0.176966
G1 X117.722 Y123.177 E.00126
; LINE_WIDTH: 0.141289
G1 X117.857 Y123.16 E.00109
; LINE_WIDTH: 0.111492
G1 X117.987 Y123.143 E.00073
G1 X119.513 Y123.143 F30000
; LINE_WIDTH: 0.111474
G1 F8730
G1 X119.643 Y123.16 E.00073
; LINE_WIDTH: 0.14058
G1 X119.772 Y123.176 E.00104
; LINE_WIDTH: 0.175889
G1 X119.892 Y123.197 E.00131
; LINE_WIDTH: 0.216972
G1 X120.005 Y123.217 E.00164
; LINE_WIDTH: 0.257073
G1 X120.119 Y123.237 E.00202
; LINE_WIDTH: 0.279521
G1 X120.61 Y123.336 E.00965
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X120.119 Y123.237 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/45
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
G1 X118.874 Y124.108
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7565
G1 X118.988 Y124.121 E.00382
G3 X119.458 Y124.204 I-.329 J3.242 E.01585
G3 X118.595 Y124.105 I-.701 J2.297 E.47154
G1 X118.814 Y124.107 E.00727
G1 X118.599 Y124.498 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7565
M204 S5000
G1 X118.614 Y124.497 E.00046
G3 X119.148 Y124.53 I.134 J2.161 E.01649
G3 X118.352 Y124.533 I-.39 J1.97 E.36317
G1 X118.54 Y124.507 E.00581
; WIPE_START
G1 F12000
M204 S10000
G1 X118.614 Y124.497 E-.02855
G1 X118.95 Y124.5 E-.12772
G1 X119.148 Y124.53 E-.07616
G1 X119.531 Y124.648 E-.15212
G1 X119.711 Y124.735 E-.07617
G1 X120.042 Y124.96 E-.15211
G1 X120.313 Y125.237 E-.14719
; WIPE_END
G1 E-.04 F1800
G1 X127.814 Y126.643 Z1.4 F30000
G1 X140.834 Y129.084 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7565
G1 X120.671 Y129.084 E.66884
G2 X116.829 Y129.084 I-1.921 J-2.581 E.53401
G1 X115.166 Y129.084 E.05516
G1 X115.166 Y122.916 E.20459
G1 X140.834 Y122.916 E.85144
G1 X140.834 Y129.024 E.2026
G1 X141.241 Y129.491 F30000
G1 F7565
G1 X119.231 Y129.491 E.73012
G1 X119.209 Y129.271 E.00733
G2 X118.291 Y129.271 I-.459 J-2.77 E.5547
G1 X118.269 Y129.491 E.00733
G1 X114.759 Y129.491 E.11644
G1 X114.759 Y122.509 E.2316
G1 X141.241 Y122.509 E.87845
G1 X141.241 Y129.431 E.22961
G1 X141.648 Y129.898 F30000
G1 F7565
G1 X114.352 Y129.898 E.90545
G1 X114.352 Y122.102 E.2586
G1 X141.648 Y122.102 E.90545
G1 X141.648 Y129.838 E.25661
G1 X142.04 Y130.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7565
M204 S5000
G1 X113.96 Y130.29 E.86282
G1 X113.96 Y121.71 E.26364
G1 X142.04 Y121.71 E.86282
G1 X142.04 Y130.23 E.2618
; WIPE_START
G1 F12000
M204 S10000
G1 X140.04 Y130.234 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.486 Y123.4 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7565
G1 X140.486 Y125.028 E.05401
G1 X136.778 Y128.736 E.17391
G1 X136.493 Y128.736 E.00948
G1 X134.65 Y126.893 E.08643
G1 X134.651 Y125.106 E.05929
G1 X136.493 Y123.264 E.08639
G1 X136.778 Y123.264 E.00948
G1 X140.486 Y126.972 E.17391
G1 X140.486 Y128.6 E.05401
G1 X133.262 Y123.864 F30000
G1 F7565
G2 X133.248 Y125.298 I6.555 J.779 E.04768
G1 X133.055 Y125.298 E.0064
G1 X132.252 Y124.495 E.03771
G2 X131.746 Y123.326 I-.961 J-.278 E.04576
G1 X131.672 Y123.309 E.00252
G2 X131.17 Y123.413 I-.122 J.681 E.01743
G2 X130.736 Y123.264 I-.291 J.143 E.0169
G1 X130.294 Y123.706 E.02073
G2 X129.555 Y123.298 I-.816 J.605 E.02887
G2 X127.633 Y123.309 I-.907 J10.292 E.06384
G2 X127.05 Y123.951 I.123 J.697 E.03098
G1 X127.05 Y125.05 E.03644
G1 X125.264 Y123.264 E.08376
G1 X124.979 Y123.264 E.00948
G1 X122.274 Y125.969 E.1269
G1 X122.282 Y126.039 E.00234
G1 X124.979 Y128.736 E.12648
G1 X125.264 Y128.736 E.00948
G1 X127.049 Y126.951 E.08372
G2 X127.094 Y128.247 I3.475 J.529 E.04327
G2 X127.701 Y128.7 I.662 J-.255 E.0265
G2 X129.668 Y128.691 I.938 J-10.755 E.06534
G2 X130.293 Y128.293 I-.299 J-1.158 E.025
G1 X130.736 Y128.736 E.02076
G1 X131.021 Y128.736 E.00948
G1 X133.055 Y126.702 E.09542
G3 X131.428 Y126.69 I-.756 J-8.427 E.05408
G1 X131.241 Y125.926 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F7565
G1 X131.285 Y126.146 E.00692
G1 X131.404 Y126.265 E.00517
G1 X131.728 Y126.309 E.01005
; LINE_WIDTH: 0.440139
G1 X131.866 Y126.289 E.0045
; LINE_WIDTH: 0.480435
G1 X132.003 Y126.269 E.00495
; LINE_WIDTH: 0.538894
G1 X132.141 Y126.249 E.00562
G1 X133.359 Y126.249 E.04925
; LINE_WIDTH: 0.560988
G1 X133.417 Y126.253 E.00246
; LINE_WIDTH: 0.600863
G1 X133.476 Y126.257 E.00265
; LINE_WIDTH: 0.640738
G1 X133.534 Y126.261 E.00284
; LINE_WIDTH: 0.694414
G1 X133.592 Y126.266 E.00309
G1 X133.684 Y126.358 E.00696
; LINE_WIDTH: 0.680457
G1 X133.688 Y126.416 E.00303
; LINE_WIDTH: 0.640269
G1 X133.692 Y126.475 E.00284
; LINE_WIDTH: 0.600082
G1 X133.696 Y126.533 E.00264
; LINE_WIDTH: 0.539719
G1 X133.7 Y127.953 E.0575
G1 X133.756 Y128.132 E.00757
G1 X133.907 Y128.236 E.00745
G1 X134.088 Y128.186 E.00762
G1 X134.196 Y128.009 E.00839
G1 X134.197 Y126.591 E.05742
; LINE_WIDTH: 0.559894
G1 X134.177 Y126.455 E.00578
; LINE_WIDTH: 0.600082
G1 X134.157 Y126.32 E.00623
; LINE_WIDTH: 0.640269
G1 X134.137 Y126.184 E.00668
; LINE_WIDTH: 0.680457
G1 X134.117 Y126.048 E.00713
; LINE_WIDTH: 0.680997
G1 X134.137 Y125.91 E.00724
; LINE_WIDTH: 0.641889
G1 X134.157 Y125.772 E.0068
; LINE_WIDTH: 0.602782
G1 X134.176 Y125.634 E.00636
; LINE_WIDTH: 0.541511
G2 X134.198 Y125.41 I-.927 J-.203 E.0092
G1 X134.199 Y124.02 E.05644
G1 X134.152 Y123.868 E.00648
G1 X133.983 Y123.767 E.00799
G1 X133.837 Y123.787 E.00598
G1 X133.721 Y123.953 E.00823
G1 X133.701 Y124.057 E.00431
G1 X133.701 Y125.409 E.05496
; LINE_WIDTH: 0.562819
G1 X133.692 Y125.484 E.00317
; LINE_WIDTH: 0.607735
G1 X133.684 Y125.558 E.00345
; LINE_WIDTH: 0.652652
G1 X133.675 Y125.633 E.00372
; LINE_WIDTH: 0.68783
G1 X133.574 Y125.751 E.00819
; LINE_WIDTH: 0.680613
G1 X133.52 Y125.751 E.00279
; LINE_WIDTH: 0.640738
G1 X133.467 Y125.751 E.00261
; LINE_WIDTH: 0.600863
G1 X133.413 Y125.751 E.00244
; LINE_WIDTH: 0.540466
G1 X132.141 Y125.751 E.05158
G1 X131.801 Y125.452 E.01834
G1 X131.8 Y124.04 E.05727
G1 X131.735 Y123.862 E.00765
G1 X131.596 Y123.764 E.0069
G1 X131.411 Y123.814 E.00777
G1 X131.304 Y123.991 E.00839
G1 X131.302 Y125.409 E.05749
; LINE_WIDTH: 0.520415
G1 X131.284 Y125.561 E.00597
; LINE_WIDTH: 0.480245
G1 X131.266 Y125.714 E.00547
; LINE_WIDTH: 0.440075
G1 X131.248 Y125.866 E.00497
G1 X131.692 Y125.837 F30000
; LINE_WIDTH: 0.50984
G1 F7565
G2 X131.69 Y125.938 I-.029 J.05 E.00918
G1 X127.444 Y124.05 F30000
; LINE_WIDTH: 0.41999
G1 F7565
G1 X127.44 Y127.982 E.12081
G1 X127.508 Y128.164 E.00596
G2 X127.8 Y128.306 I.295 J-.236 E.0103
G1 X129.541 Y128.31 E.0535
G1 X129.765 Y128.223 E.00737
G1 X130.404 Y127.664 E.02608
G1 X130.459 Y127.417 E.00778
G1 X130.46 Y126.576 E.02584
G1 X130.422 Y126.364 E.00659
G1 X130.231 Y126.102 E.00997
G1 X130.256 Y125.833 E.00829
G1 X130.403 Y125.67 E.00676
G1 X130.459 Y125.346 E.01008
G1 X130.46 Y124.518 E.02545
G1 X130.386 Y124.326 E.00633
G2 X129.708 Y123.739 I-6.448 J6.768 E.02756
G1 X129.454 Y123.69 E.00795
G1 X127.768 Y123.69 E.05181
G1 X127.586 Y123.758 E.00595
G1 X127.478 Y123.897 E.0054
G1 X127.457 Y123.991 E.00298
G1 X128.947 Y125.138 F30000
; LINE_WIDTH: 0.36978
G1 F7565
G1 X128.885 Y125.174 E.00188
G1 X128.93 Y125.199 E.00137
G1 X128.61 Y125.929 F30000
; LINE_WIDTH: 0.47489
G1 F7565
G1 X128.592 Y126.377 E.01578
; LINE_WIDTH: 0.424358
G2 X128.572 Y127.176 I9.777 J.633 E.02487
G1 X129.242 Y127.178 E.0208
G1 X129.328 Y127.102 E.00357
G1 X129.328 Y126.809 E.00912
; LINE_WIDTH: 0.441303
G1 X129.201 Y126.556 E.00917
; LINE_WIDTH: 0.492642
G1 X129.075 Y126.304 E.01036
G1 X129.061 Y125.929 E.01373
; LINE_WIDTH: 0.47489
G1 X129.15 Y125.631 E.01096
; LINE_WIDTH: 0.423665
G1 X129.24 Y125.333 E.00966
G1 X129.328 Y125.194 E.0051
G1 X129.328 Y124.889 E.00945
G1 X129.199 Y124.822 E.00452
G1 X128.575 Y124.822 E.01937
; LINE_WIDTH: 0.43829
G1 X128.592 Y125.345 E.01688
; LINE_WIDTH: 0.47489
G1 X128.608 Y125.869 E.01844
G1 X129.474 Y126.069 F30000
; LINE_WIDTH: 0.41999
G1 F7565
G1 X129.576 Y125.504 E.01766
G1 X129.705 Y125.317 E.00696
G1 X129.705 Y124.711 E.01864
G1 X129.38 Y124.445 E.01293
G1 X128.198 Y124.445 E.03631
G1 X128.195 Y127.553 E.0955
G1 X129.383 Y127.555 E.03651
G1 X129.705 Y127.273 E.01315
G1 X129.705 Y126.688 E.01798
G1 X129.576 Y126.495 E.00713
G1 X129.488 Y126.128 E.01161
G1 X129.851 Y126.069 F30000
G1 F7565
G1 X129.913 Y125.674 E.01228
G1 X130.082 Y125.407 E.00973
G1 X130.083 Y124.553 E.02624
G1 X129.561 Y124.105 E.02113
G1 X129.454 Y124.067 E.00347
G1 X127.821 Y124.067 E.05017
G1 X127.818 Y127.929 E.11865
G1 X129.495 Y127.932 E.05156
G1 X130.061 Y127.463 E.0226
G2 X130.083 Y126.576 I-12.006 J-.732 E.02727
G1 X129.912 Y126.325 E.00931
G1 X129.865 Y126.128 E.00623
G1 X128.946 Y126.789 F30000
; LINE_WIDTH: 0.37048
G1 F7565
G1 X128.884 Y126.825 E.00189
G1 X128.929 Y126.851 E.00138
; WIPE_START
G1 F15000
G1 X128.884 Y126.825 E-.32099
G1 X128.946 Y126.789 E-.43901
; WIPE_END
G1 E-.04 F1800
G1 X121.577 Y128.78 Z1.4 F30000
M73 P77 R2
G1 X120.253 Y129.137 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.112384
G1 F7565
G1 X120.096 Y129.244 E.00107
G1 X119.995 Y129.266 E.00058
; WIPE_START
G1 F15000
G1 X120.096 Y129.244 E-.26794
G1 X120.253 Y129.137 E-.49206
; WIPE_END
G1 E-.04 F1800
G1 X117.505 Y129.266 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.112371
G1 F7565
G1 X117.404 Y129.244 E.00058
G1 X117.248 Y129.137 E.00107
; WIPE_START
G1 F15000
G1 X117.404 Y129.244 E-.49211
G1 X117.505 Y129.266 E-.26789
; WIPE_END
G1 E-.04 F1800
G1 X115.709 Y128.514 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.64542
G1 F7565
G2 X115.716 Y128.631 I-.034 J.061 E.0148
G1 X115.394 Y125.739 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.113678
G1 F7565
G1 X115.414 Y125.563 E.00102
; LINE_WIDTH: 0.149511
G1 X115.433 Y125.445 E.00104
; LINE_WIDTH: 0.187383
G1 X115.451 Y125.332 E.00136
; LINE_WIDTH: 0.224544
G1 X115.47 Y125.218 E.0017
; LINE_WIDTH: 0.245045
G1 X115.579 Y124.641 E.00967
G1 X115.603 Y124.649 F30000
; LINE_WIDTH: 0.400138
G1 F7565
G2 X115.37 Y125.592 I19.393 J5.298 E.02828
G1 X116.554 Y123.648 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F7565
G1 X116.485 Y123.308 E.01066
G1 X115.558 Y123.308 E.02846
G1 X115.558 Y124.231 E.02835
G1 X115.887 Y124.319 E.01044
G3 X116.508 Y123.687 I2.11 J1.453 E.02736
G1 X115.957 Y123.643 F30000
; LINE_WIDTH: 0.4159
G1 F7565
G1 X115.887 Y123.683 E.00245
G1 X115.945 Y123.717 E.00205
G1 X116.89 Y123.336 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.275329
G1 F7565
G3 X117.495 Y123.217 I2.636 J11.743 E.01167
; LINE_WIDTH: 0.217026
G1 X117.608 Y123.197 E.00164
; LINE_WIDTH: 0.17695
G1 X117.722 Y123.177 E.00126
; LINE_WIDTH: 0.141288
G1 X117.857 Y123.16 E.00109
; LINE_WIDTH: 0.111491
G1 X117.987 Y123.143 E.00073
G1 X119.513 Y123.143 F30000
; LINE_WIDTH: 0.111463
G1 F7565
G1 X119.643 Y123.16 E.00073
; LINE_WIDTH: 0.140547
G1 X119.772 Y123.176 E.00104
; LINE_WIDTH: 0.175866
G1 X119.892 Y123.197 E.00131
; LINE_WIDTH: 0.216984
G1 X120.005 Y123.217 E.00164
; LINE_WIDTH: 0.257119
G1 X120.119 Y123.237 E.00202
; LINE_WIDTH: 0.279564
G1 X120.61 Y123.336 E.00965
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X120.119 Y123.237 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/45
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
G1 X118.89 Y124.108
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6444
G1 X118.988 Y124.121 E.00328
G3 X119.458 Y124.204 I-.334 J3.267 E.01585
G3 X118.606 Y124.104 I-.7 J2.297 E.47192
G1 X118.83 Y124.107 E.00741
G1 X118.614 Y124.497 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6444
M204 S5000
G1 X118.626 Y124.496 E.00039
G3 X119.148 Y124.53 I.123 J2.152 E.01612
G3 X118.352 Y124.533 I-.389 J1.971 E.36317
G1 X118.554 Y124.506 E.00626
; WIPE_START
G1 F12000
M204 S10000
G1 X118.626 Y124.496 E-.02757
G1 X118.95 Y124.5 E-.12319
G1 X119.148 Y124.53 E-.07612
G1 X119.531 Y124.648 E-.15215
G1 X119.711 Y124.735 E-.07616
G1 X120.042 Y124.96 E-.15211
G1 X120.322 Y125.247 E-.15212
G1 X120.323 Y125.248 E-.00059
; WIPE_END
G1 E-.04 F1800
G1 X127.825 Y126.651 Z1.6 F30000
G1 X140.834 Y129.084 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6444
G1 X120.671 Y129.084 E.66884
G2 X116.829 Y129.084 I-1.921 J-2.581 E.53402
G1 X115.166 Y129.084 E.05517
G1 X115.166 Y122.916 E.20459
G1 X140.834 Y122.916 E.85144
G1 X140.834 Y129.024 E.2026
G1 X141.241 Y129.491 F30000
G1 F6444
G1 X119.231 Y129.491 E.73012
G1 X119.209 Y129.271 E.00733
G2 X118.291 Y129.271 I-.459 J-2.77 E.55471
G1 X118.269 Y129.491 E.00733
G1 X114.759 Y129.491 E.11644
G1 X114.759 Y122.509 E.2316
G1 X141.241 Y122.509 E.87845
G1 X141.241 Y129.431 E.22961
G1 X141.648 Y129.898 F30000
G1 F6444
G1 X114.352 Y129.898 E.90545
G1 X114.352 Y122.102 E.2586
G1 X141.648 Y122.102 E.90545
G1 X141.648 Y129.838 E.25661
G1 X142.04 Y130.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6444
M204 S5000
G1 X113.96 Y130.29 E.86282
G1 X113.96 Y121.71 E.26364
G1 X142.04 Y121.71 E.86282
G1 X142.04 Y130.23 E.2618
; WIPE_START
G1 F12000
M204 S10000
G1 X140.04 Y130.234 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.486 Y128.6 Z1.6 F30000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6444
G1 X140.486 Y126.972 E.05401
G1 X136.778 Y123.264 E.17391
G1 X136.493 Y123.264 E.00948
G1 X131.021 Y128.736 E.25666
G1 X130.736 Y128.736 E.00948
G1 X125.264 Y123.264 E.25666
G1 X124.979 Y123.264 E.00948
G1 X122.274 Y125.969 E.12689
G1 X122.282 Y126.039 E.00234
G1 X124.979 Y128.736 E.12648
G1 X125.264 Y128.736 E.00948
G1 X130.736 Y123.264 E.25666
G1 X131.021 Y123.264 E.00948
G1 X136.493 Y128.736 E.25666
G1 X136.778 Y128.736 E.00948
G1 X140.486 Y125.028 E.17391
G1 X140.486 Y123.4 E.05401
G1 X120.61 Y123.336 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.279526
G1 F6444
G1 X120.119 Y123.237 E.00965
; LINE_WIDTH: 0.257083
G1 X120.005 Y123.217 E.00202
; LINE_WIDTH: 0.216978
G1 X119.892 Y123.197 E.00164
; LINE_WIDTH: 0.175893
G1 X119.772 Y123.176 E.00131
; LINE_WIDTH: 0.14058
G1 X119.643 Y123.16 E.00104
; LINE_WIDTH: 0.111474
G1 X119.513 Y123.143 E.00073
G1 X117.987 Y123.143 F30000
; LINE_WIDTH: 0.111454
G1 F6444
G1 X117.857 Y123.16 E.00073
; LINE_WIDTH: 0.141182
G1 X117.722 Y123.177 E.00109
; LINE_WIDTH: 0.176852
G1 X117.608 Y123.197 E.00126
; LINE_WIDTH: 0.216983
G1 X117.495 Y123.217 E.00164
; LINE_WIDTH: 0.275342
G2 X116.89 Y123.336 I2.117 J12.344 E.01167
G1 X116.553 Y123.648 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F6444
G1 X116.485 Y123.308 E.01066
G1 X115.558 Y123.308 E.02847
G1 X115.558 Y124.231 E.02835
G1 X115.887 Y124.319 E.01044
G3 X116.508 Y123.687 I2.11 J1.453 E.02736
G1 X115.957 Y123.643 F30000
; LINE_WIDTH: 0.41588
G1 F6444
G1 X115.887 Y123.683 E.00245
G1 X115.945 Y123.717 E.00205
G1 X115.37 Y125.593 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.400102
G1 F6444
G3 X115.603 Y124.649 I19.126 J4.229 E.0283
G1 X115.579 Y124.641 F30000
; LINE_WIDTH: 0.245144
G1 F6444
G1 X115.47 Y125.218 E.00967
; LINE_WIDTH: 0.224639
G1 X115.451 Y125.332 E.00171
; LINE_WIDTH: 0.187439
G1 X115.433 Y125.445 E.00136
; LINE_WIDTH: 0.149527
G1 X115.413 Y125.564 E.00104
; LINE_WIDTH: 0.113666
G1 X115.394 Y125.739 E.00102
G1 X115.709 Y128.514 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.64544
G1 F6444
G2 X115.716 Y128.631 I-.034 J.061 E.0148
; WIPE_START
G1 F10953.993
G1 X115.633 Y128.644 E-.20603
G1 X115.596 Y128.579 E-.18466
G1 X115.633 Y128.514 E-.18467
G1 X115.709 Y128.514 E-.18464
; WIPE_END
G1 E-.04 F1800
G1 X117.248 Y129.138 Z1.6 F30000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.112319
G1 F6444
G1 X117.404 Y129.244 E.00107
G1 X117.505 Y129.266 E.00058
; WIPE_START
G1 F15000
G1 X117.404 Y129.244 E-.26791
G1 X117.248 Y129.138 E-.49209
; WIPE_END
G1 E-.04 F1800
G1 X119.995 Y129.266 Z1.6 F30000
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.112358
G1 F6444
G1 X120.096 Y129.244 E.00058
G1 X120.252 Y129.137 E.00107
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X120.096 Y129.244 E-.49211
G1 X119.995 Y129.266 E-.26789
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/45
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
G1 X118.561 Y124.111
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6555
G1 X118.618 Y124.104 E.00193
G3 X119.458 Y124.204 I.031 J3.315 E.02813
G3 X118.275 Y124.149 I-.7 J2.297 E.4608
G1 X118.501 Y124.119 E.00758
G1 X118.629 Y124.496 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6555
M204 S5000
G1 X118.638 Y124.495 E.00029
G3 X119.148 Y124.53 I.112 J2.148 E.01575
G3 X118.352 Y124.533 I-.389 J1.971 E.36316
G1 X118.569 Y124.504 E.00671
; WIPE_START
G1 F12000
M204 S10000
G1 X118.638 Y124.495 E-.02643
G1 X118.638 Y124.495 E0
G1 X118.95 Y124.5 E-.11866
G1 X119.148 Y124.53 E-.07614
G1 X119.531 Y124.648 E-.15212
G1 X119.711 Y124.735 E-.07617
G1 X120.042 Y124.96 E-.15211
G1 X120.322 Y125.247 E-.15214
G1 X120.331 Y125.26 E-.00624
; WIPE_END
G1 E-.04 F1800
G1 X127.834 Y126.66 Z1.8 F30000
G1 X140.834 Y129.084 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6555
G1 X120.671 Y129.084 E.66884
G2 X116.829 Y129.084 I-1.921 J-2.581 E.53404
G1 X115.166 Y129.084 E.05517
G1 X115.166 Y122.916 E.20459
G1 X140.834 Y122.916 E.85144
G1 X140.834 Y129.024 E.2026
G1 X141.241 Y129.491 F30000
G1 F6555
G1 X119.231 Y129.491 E.73012
G1 X119.209 Y129.271 E.00733
G2 X118.291 Y129.271 I-.459 J-2.77 E.55473
G1 X118.269 Y129.491 E.00733
G1 X114.759 Y129.491 E.11644
G1 X114.759 Y122.509 E.2316
G1 X141.241 Y122.509 E.87845
G1 X141.241 Y129.431 E.22961
G1 X141.648 Y129.898 F30000
G1 F6555
G1 X114.352 Y129.898 E.90545
G1 X114.352 Y122.102 E.2586
G1 X141.648 Y122.102 E.90545
G1 X141.648 Y129.838 E.25661
M73 P78 R2
G1 X142.04 Y130.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6555
M204 S5000
G1 X113.96 Y130.29 E.86282
G1 X113.96 Y121.71 E.26364
G1 X142.04 Y121.71 E.86282
G1 X142.04 Y130.23 E.2618
; WIPE_START
G1 F12000
M204 S10000
G1 X140.04 Y130.234 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.486 Y123.4 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6555
G1 X140.486 Y125.028 E.05401
G1 X136.778 Y128.736 E.17391
G1 X136.493 Y128.736 E.00948
G1 X131.021 Y123.264 E.25666
G1 X130.736 Y123.264 E.00948
G1 X125.264 Y128.736 E.25666
G1 X124.979 Y128.736 E.00948
G1 X122.282 Y126.039 E.12648
G1 X122.274 Y125.969 E.00234
G1 X124.979 Y123.264 E.12689
G1 X125.264 Y123.264 E.00948
G1 X130.736 Y128.736 E.25666
G1 X131.021 Y128.736 E.00948
G1 X136.493 Y123.264 E.25666
G1 X136.778 Y123.264 E.00948
G1 X140.486 Y126.972 E.17391
G1 X140.486 Y128.6 E.05401
; WIPE_START
G1 F16200
G1 X140.486 Y126.972 E-.61876
G1 X140.223 Y126.709 E-.14125
; WIPE_END
G1 E-.04 F1800
G1 X132.646 Y127.63 Z1.8 F30000
G1 X120.253 Y129.137 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.112406
G1 F6555
G1 X120.096 Y129.244 E.00108
G1 X119.995 Y129.266 E.00059
; WIPE_START
G1 F15000
G1 X120.096 Y129.244 E-.26791
G1 X120.253 Y129.137 E-.49209
; WIPE_END
G1 E-.04 F1800
G1 X117.505 Y129.266 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.112333
G1 F6555
G1 X117.404 Y129.244 E.00058
G1 X117.248 Y129.138 E.00107
; WIPE_START
G1 F15000
G1 X117.404 Y129.244 E-.49206
G1 X117.505 Y129.266 E-.26794
; WIPE_END
G1 E-.04 F1800
G1 X115.709 Y128.514 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.64544
G1 F6555
G2 X115.716 Y128.631 I-.034 J.061 E.0148
G1 X115.394 Y125.739 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.113666
G1 F6555
G1 X115.413 Y125.564 E.00102
; LINE_WIDTH: 0.149527
G1 X115.433 Y125.445 E.00104
; LINE_WIDTH: 0.187439
G1 X115.451 Y125.332 E.00136
; LINE_WIDTH: 0.224639
G1 X115.47 Y125.218 E.00171
; LINE_WIDTH: 0.245144
G1 X115.579 Y124.641 E.00967
G1 X115.603 Y124.649 F30000
; LINE_WIDTH: 0.400125
G1 F6555
G2 X115.37 Y125.593 I18.984 J5.193 E.02831
G1 X116.553 Y123.648 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F6555
G1 X116.485 Y123.308 E.01066
G1 X115.558 Y123.308 E.02847
G1 X115.558 Y124.231 E.02835
G1 X115.887 Y124.319 E.01044
G3 X116.508 Y123.687 I2.109 J1.452 E.02736
G1 X115.957 Y123.643 F30000
; LINE_WIDTH: 0.41588
G1 F6555
G1 X115.887 Y123.683 E.00245
G1 X115.945 Y123.717 E.00205
G1 X116.89 Y123.336 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.275363
G1 F6555
G3 X117.495 Y123.217 I2.714 J12.181 E.01167
; LINE_WIDTH: 0.216993
G1 X117.608 Y123.197 E.00164
; LINE_WIDTH: 0.176855
G1 X117.722 Y123.177 E.00126
; LINE_WIDTH: 0.141182
G1 X117.857 Y123.16 E.00109
; LINE_WIDTH: 0.111452
G1 X117.987 Y123.143 E.00073
G1 X119.513 Y123.143 F30000
; LINE_WIDTH: 0.111463
G1 F6555
G1 X119.643 Y123.16 E.00073
; LINE_WIDTH: 0.140547
G1 X119.772 Y123.176 E.00104
; LINE_WIDTH: 0.175863
G1 X119.892 Y123.197 E.00131
; LINE_WIDTH: 0.216974
G1 X120.005 Y123.217 E.00164
; LINE_WIDTH: 0.257104
G1 X120.119 Y123.237 E.00202
; LINE_WIDTH: 0.279564
G1 X120.61 Y123.336 E.00965
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X120.119 Y123.237 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/45
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
G1 X118.849 Y124.107
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6443
G1 X119.226 Y124.145 E.01259
G3 X118.511 Y124.109 I-.476 J2.349 E.47571
G1 X118.75 Y124.097 E.00795
G1 X118.789 Y124.101 E.00129
G1 X118.641 Y124.495 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6443
M204 S5000
G1 X118.75 Y124.49 E.00335
G3 X118.55 Y124.5 I0 J2.005 E.38099
G1 X118.581 Y124.498 E.00096
; WIPE_START
G1 F12000
M204 S10000
G1 X118.75 Y124.49 E-.06426
G1 X119.148 Y124.53 E-.15213
G1 X119.531 Y124.648 E-.15209
G1 X119.882 Y124.839 E-.15213
G1 X120.189 Y125.096 E-.15214
G1 X120.332 Y125.276 E-.08726
; WIPE_END
G1 E-.04 F1800
G1 X127.836 Y126.67 Z2 F30000
G1 X140.834 Y129.084 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6443
G1 X120.671 Y129.084 E.66884
G2 X116.829 Y129.084 I-1.921 J-2.581 E.53403
G1 X115.166 Y129.084 E.05517
G1 X115.166 Y122.916 E.20459
G1 X140.834 Y122.916 E.85144
G1 X140.834 Y129.024 E.2026
G1 X141.241 Y129.491 F30000
G1 F6443
G1 X119.231 Y129.491 E.73012
G1 X119.209 Y129.271 E.00733
G2 X118.291 Y129.271 I-.459 J-2.772 E.55501
G1 X118.269 Y129.491 E.00733
G1 X114.759 Y129.491 E.11644
G1 X114.759 Y122.509 E.2316
G1 X141.241 Y122.509 E.87845
G1 X141.241 Y129.431 E.22961
G1 X141.648 Y129.898 F30000
G1 F6443
G1 X114.352 Y129.898 E.90545
G1 X114.352 Y122.102 E.2586
G1 X141.648 Y122.102 E.90545
G1 X141.648 Y129.838 E.25661
G1 X142.04 Y130.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6443
M204 S5000
G1 X113.96 Y130.29 E.86282
G1 X113.96 Y121.71 E.26364
G1 X142.04 Y121.71 E.86282
G1 X142.04 Y130.23 E.2618
; WIPE_START
G1 F12000
M204 S10000
G1 X140.04 Y130.234 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.486 Y128.6 Z2 F30000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6443
G1 X140.486 Y126.972 E.05401
G1 X136.778 Y123.264 E.17391
G1 X136.493 Y123.264 E.00948
G1 X131.021 Y128.736 E.25666
G1 X130.736 Y128.736 E.00948
G1 X125.264 Y123.264 E.25666
G1 X124.979 Y123.264 E.00948
G1 X122.274 Y125.969 E.12689
G1 X122.282 Y126.039 E.00234
G1 X124.979 Y128.736 E.12648
G1 X125.264 Y128.736 E.00948
G1 X130.736 Y123.264 E.25666
G1 X131.021 Y123.264 E.00948
G1 X136.493 Y128.736 E.25666
G1 X136.778 Y128.736 E.00948
G1 X140.486 Y125.028 E.17391
G1 X140.486 Y123.4 E.05401
G1 X120.61 Y123.336 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.279511
G1 F6443
G1 X120.119 Y123.237 E.00965
; LINE_WIDTH: 0.257086
G1 X120.005 Y123.217 E.00202
; LINE_WIDTH: 0.216971
M73 P79 R2
G1 X119.892 Y123.197 E.00164
; LINE_WIDTH: 0.175875
G1 X119.772 Y123.176 E.00131
; LINE_WIDTH: 0.140547
G1 X119.643 Y123.16 E.00104
; LINE_WIDTH: 0.111463
G1 X119.513 Y123.143 E.00073
G1 X117.987 Y123.143 F30000
; LINE_WIDTH: 0.111452
G1 F6443
G1 X117.857 Y123.16 E.00073
; LINE_WIDTH: 0.141182
G1 X117.722 Y123.177 E.00109
; LINE_WIDTH: 0.176845
G1 X117.608 Y123.197 E.00126
; LINE_WIDTH: 0.216963
G1 X117.495 Y123.217 E.00164
; LINE_WIDTH: 0.275328
G2 X116.89 Y123.336 I2.065 J12.045 E.01167
G1 X116.553 Y123.648 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F6443
G1 X116.485 Y123.308 E.01066
G1 X115.558 Y123.308 E.02846
G1 X115.558 Y124.231 E.02835
G1 X115.887 Y124.319 E.01044
G3 X116.508 Y123.687 I2.11 J1.453 E.02736
G1 X115.957 Y123.643 F30000
; LINE_WIDTH: 0.41588
G1 F6443
G1 X115.887 Y123.683 E.00245
G1 X115.945 Y123.717 E.00205
G1 X115.37 Y125.593 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.400176
G1 F6443
G3 X115.603 Y124.649 I19.158 J4.233 E.02832
G1 X115.579 Y124.641 F30000
; LINE_WIDTH: 0.245064
G1 F6443
G1 X115.47 Y125.218 E.00967
; LINE_WIDTH: 0.224583
G1 X115.451 Y125.332 E.00171
; LINE_WIDTH: 0.187398
G1 X115.433 Y125.445 E.00136
; LINE_WIDTH: 0.1495
G1 X115.413 Y125.564 E.00104
; LINE_WIDTH: 0.113666
G1 X115.394 Y125.739 E.00102
G1 X115.709 Y128.514 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.64542
G1 F6443
G2 X115.716 Y128.631 I-.034 J.061 E.0148
; WIPE_START
G1 F10954.358
G1 X115.633 Y128.644 E-.20603
G1 X115.596 Y128.579 E-.18466
G1 X115.633 Y128.514 E-.18467
G1 X115.709 Y128.514 E-.18464
; WIPE_END
G1 E-.04 F1800
G1 X117.248 Y129.138 Z2 F30000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.112336
G1 F6443
G1 X117.404 Y129.244 E.00107
G1 X117.505 Y129.266 E.00058
; WIPE_START
G1 F15000
G1 X117.404 Y129.244 E-.26791
G1 X117.248 Y129.138 E-.49209
; WIPE_END
G1 E-.04 F1800
G1 X119.995 Y129.266 Z2 F30000
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.112357
G1 F6443
G1 X120.096 Y129.244 E.00058
G1 X120.252 Y129.137 E.00107
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X120.096 Y129.244 E-.49209
G1 X119.995 Y129.266 E-.26791
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/45
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
G1 X118.941 Y124.108
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6456
G1 X118.988 Y124.121 E.00163
G3 X119.458 Y124.204 I-.353 J3.379 E.01585
G3 X118.642 Y124.103 I-.7 J2.297 E.47309
G1 X118.881 Y124.107 E.00791
G1 X118.659 Y124.494 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6456
M204 S5000
G1 X118.662 Y124.494 E.00009
G3 X119.148 Y124.53 I.087 J2.157 E.01502
G3 X118.352 Y124.534 I-.388 J1.971 E.36316
G1 X118.599 Y124.502 E.00765
; WIPE_START
G1 F12000
M204 S10000
G1 X118.662 Y124.494 E-.02392
G1 X118.95 Y124.5 E-.10958
G1 X119.148 Y124.53 E-.07616
G1 X119.531 Y124.648 E-.15208
G1 X119.711 Y124.735 E-.0762
G1 X120.042 Y124.96 E-.15211
G1 X120.322 Y125.247 E-.15214
G1 X120.347 Y125.286 E-.01782
; WIPE_END
G1 E-.04 F1800
G1 X127.852 Y126.677 Z2.2 F30000
G1 X140.834 Y129.084 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6456
G1 X120.671 Y129.084 E.66884
G2 X116.829 Y129.084 I-1.921 J-2.581 E.53406
G1 X115.166 Y129.084 E.05517
G1 X115.166 Y122.916 E.20459
G1 X140.834 Y122.916 E.85144
G1 X140.834 Y129.024 E.2026
G1 X141.241 Y129.491 F30000
G1 F6456
G1 X119.231 Y129.491 E.73012
G1 X119.209 Y129.271 E.00733
G2 X118.291 Y129.271 I-.459 J-2.771 E.55476
G1 X118.269 Y129.491 E.00733
G1 X114.759 Y129.491 E.11644
G1 X114.759 Y122.509 E.2316
G1 X141.241 Y122.509 E.87845
G1 X141.241 Y129.431 E.22961
G1 X141.648 Y129.898 F30000
G1 F6456
G1 X114.352 Y129.898 E.90545
G1 X114.352 Y122.102 E.2586
G1 X141.648 Y122.102 E.90545
G1 X141.648 Y129.838 E.25661
G1 X142.04 Y130.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6456
M204 S5000
G1 X113.96 Y130.29 E.86282
G1 X113.96 Y121.71 E.26364
G1 X142.04 Y121.71 E.86282
G1 X142.04 Y130.23 E.2618
; WIPE_START
G1 F12000
M204 S10000
G1 X140.04 Y130.234 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.486 Y128.6 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6456
G1 X140.486 Y126.972 E.05401
G1 X136.778 Y123.264 E.17391
G1 X136.493 Y123.264 E.00948
G1 X131.021 Y128.736 E.25666
G1 X130.736 Y128.736 E.00948
G1 X125.264 Y123.264 E.25666
G1 X124.979 Y123.264 E.00948
G1 X122.274 Y125.969 E.1269
G1 X122.282 Y126.039 E.00234
G1 X124.979 Y128.736 E.12648
G1 X125.264 Y128.736 E.00948
G1 X130.736 Y123.264 E.25666
G1 X131.021 Y123.264 E.00948
G1 X136.493 Y128.736 E.25666
G1 X136.778 Y128.736 E.00948
G1 X140.486 Y125.028 E.17391
G1 X140.486 Y123.4 E.05401
G1 X120.61 Y123.336 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.279521
G1 F6456
G1 X120.119 Y123.237 E.00965
; LINE_WIDTH: 0.257092
G1 X120.005 Y123.217 E.00202
; LINE_WIDTH: 0.216991
G1 X119.892 Y123.197 E.00164
; LINE_WIDTH: 0.175909
G1 X119.772 Y123.176 E.00131
; LINE_WIDTH: 0.140594
G1 X119.643 Y123.16 E.00104
; LINE_WIDTH: 0.111478
G1 X119.513 Y123.143 E.00073
G1 X117.987 Y123.143 F30000
; LINE_WIDTH: 0.111463
G1 F6456
G1 X117.857 Y123.16 E.00073
; LINE_WIDTH: 0.141213
G1 X117.722 Y123.177 E.00109
; LINE_WIDTH: 0.176866
G1 X117.608 Y123.197 E.00126
; LINE_WIDTH: 0.216976
G1 X117.495 Y123.217 E.00164
; LINE_WIDTH: 0.275308
G2 X116.89 Y123.336 I2.107 J12.287 E.01167
G1 X116.553 Y123.648 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F6456
G1 X116.485 Y123.308 E.01066
G1 X115.558 Y123.308 E.02847
M73 P80 R2
G1 X115.558 Y124.231 E.02835
G1 X115.887 Y124.319 E.01044
G3 X116.508 Y123.687 I2.109 J1.452 E.02736
G1 X115.957 Y123.643 F30000
; LINE_WIDTH: 0.41586
G1 F6456
G1 X115.887 Y123.683 E.00245
G1 X115.945 Y123.717 E.00205
G1 X115.37 Y125.593 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.400155
G1 F6456
G3 X115.603 Y124.649 I19.466 J4.31 E.02831
G1 X115.579 Y124.641 F30000
; LINE_WIDTH: 0.245095
G1 F6456
G1 X115.47 Y125.218 E.00967
; LINE_WIDTH: 0.224593
G1 X115.451 Y125.332 E.00171
; LINE_WIDTH: 0.187404
G1 X115.433 Y125.445 E.00136
; LINE_WIDTH: 0.149503
G1 X115.413 Y125.563 E.00104
; LINE_WIDTH: 0.113666
G1 X115.394 Y125.739 E.00102
G1 X115.709 Y128.514 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.64542
G1 F6456
G2 X115.716 Y128.631 I-.034 J.061 E.0148
; WIPE_START
G1 F10954.358
G1 X115.633 Y128.644 E-.20603
G1 X115.596 Y128.579 E-.18466
G1 X115.633 Y128.514 E-.18467
G1 X115.709 Y128.514 E-.18464
; WIPE_END
G1 E-.04 F1800
G1 X117.248 Y129.138 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.112317
G1 F6456
G1 X117.404 Y129.244 E.00107
G1 X117.505 Y129.266 E.00058
; WIPE_START
G1 F15000
G1 X117.404 Y129.244 E-.26791
G1 X117.248 Y129.138 E-.49209
; WIPE_END
G1 E-.04 F1800
G1 X119.995 Y129.266 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.11237
G1 F6456
G1 X120.096 Y129.244 E.00058
G1 X120.252 Y129.137 E.00107
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X120.096 Y129.244 E-.49209
G1 X119.995 Y129.266 E-.26791
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/45
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
G1 X118.957 Y124.108
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7318
G1 X118.988 Y124.121 E.00111
G3 X119.458 Y124.204 I-.363 J3.434 E.01585
G3 X118.654 Y124.102 I-.7 J2.297 E.47349
G1 X118.897 Y124.107 E.00805
G1 X118.674 Y124.494 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7318
M204 S5000
G3 X119.148 Y124.53 I.073 J2.174 E.01465
G3 X118.614 Y124.497 I-.388 J1.971 E.37128
; WIPE_START
G1 F12000
M204 S10000
G1 X118.95 Y124.5 E-.12777
G1 X119.148 Y124.53 E-.07615
G1 X119.531 Y124.648 E-.15209
G1 X119.711 Y124.735 E-.0762
G1 X120.042 Y124.96 E-.15211
G1 X120.322 Y125.247 E-.15214
G1 X120.355 Y125.299 E-.02355
; WIPE_END
G1 E-.04 F1800
G1 X127.861 Y126.686 Z2.4 F30000
G1 X140.834 Y129.084 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7318
G1 X120.671 Y129.084 E.66884
G2 X116.829 Y129.084 I-1.921 J-2.581 E.53408
G1 X115.166 Y129.084 E.05517
G1 X115.166 Y122.916 E.20459
G1 X140.834 Y122.916 E.85144
G1 X140.834 Y129.024 E.2026
G1 X141.241 Y129.491 F30000
G1 F7318
G1 X119.231 Y129.491 E.73012
G1 X119.209 Y129.271 E.00733
G2 X118.291 Y129.271 I-.459 J-2.771 E.55478
G1 X118.269 Y129.491 E.00733
G1 X114.759 Y129.491 E.11644
G1 X114.759 Y122.509 E.2316
G1 X141.241 Y122.509 E.87845
G1 X141.241 Y129.431 E.22961
G1 X141.648 Y129.898 F30000
G1 F7318
G1 X114.352 Y129.898 E.90545
G1 X114.352 Y122.102 E.2586
G1 X141.648 Y122.102 E.90545
G1 X141.648 Y129.838 E.25661
G1 X142.04 Y130.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7318
M204 S5000
G1 X113.96 Y130.29 E.86282
G1 X113.96 Y121.71 E.26364
G1 X142.04 Y121.71 E.86282
G1 X142.04 Y130.23 E.2618
; WIPE_START
G1 F12000
M204 S10000
G1 X140.04 Y130.234 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.471 Y128.562 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383272
G1 F7318
G1 X140.471 Y123.438 E.1421
G1 X140.444 Y123.306 E.00374
G1 X140.312 Y123.279 E.00374
G1 X121.122 Y123.279 E.53223
G1 X121.008 Y123.299 E.0032
G1 X120.931 Y123.583 E.00815
G1 X120.931 Y123.654 E.00197
G1 X121.303 Y123.99 E.01389
G1 X121.748 Y124.545 E.01974
G1 X122.076 Y125.177 E.01976
G1 X122.272 Y125.863 E.01978
G1 X122.329 Y126.573 E.01976
G1 X122.243 Y127.281 E.01978
G1 X122.019 Y127.958 E.01977
G1 X121.724 Y128.482 E.01669
; LINE_WIDTH: 0.406595
G1 X121.699 Y128.573 E.00278
; LINE_WIDTH: 0.437803
G1 X121.673 Y128.663 E.00302
G1 X121.866 Y128.721 E.00647
; LINE_WIDTH: 0.383106
G1 X140.312 Y128.721 E.51134
G1 X140.444 Y128.694 E.00373
G1 X140.459 Y128.621 E.00207
G1 X140.108 Y123.777 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7318
G1 X140.108 Y125.406 E.05401
G1 X137.156 Y128.358 E.13852
G1 X136.115 Y128.358 E.03451
G1 X131.399 Y123.642 E.22127
G1 X130.358 Y123.642 E.03451
G1 X125.642 Y128.358 E.22127
G1 X124.601 Y128.358 E.03451
G1 X122.689 Y126.446 E.0897
G2 X122.596 Y125.647 I-3.972 J.058 E.02674
G1 X124.601 Y123.642 E.09408
G1 X125.642 Y123.642 E.03451
G1 X130.358 Y128.358 E.22127
G1 X131.399 Y128.358 E.03451
G1 X136.115 Y123.642 E.22127
G1 X137.156 Y123.642 E.03451
G1 X140.108 Y126.594 E.13852
G1 X140.108 Y128.223 E.05401
; WIPE_START
G1 F16200
G1 X140.108 Y126.594 E-.61876
G1 X139.846 Y126.332 E-.14125
; WIPE_END
G1 E-.04 F1800
G1 X132.29 Y127.414 Z2.4 F30000
G1 X120.252 Y129.137 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.112349
G1 F7318
G1 X120.096 Y129.244 E.00107
G1 X119.995 Y129.266 E.00058
; WIPE_START
G1 F15000
G1 X120.096 Y129.244 E-.2679
G1 X120.252 Y129.137 E-.4921
; WIPE_END
G1 E-.04 F1800
G1 X117.505 Y129.266 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.112356
G1 F7318
G1 X117.404 Y129.244 E.00058
G1 X117.248 Y129.137 E.00107
; WIPE_START
G1 F15000
G1 X117.404 Y129.244 E-.49207
G1 X117.505 Y129.266 E-.26793
; WIPE_END
G1 E-.04 F1800
G1 X115.709 Y128.514 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.64542
G1 F7318
G2 X115.716 Y128.631 I-.034 J.061 E.0148
G1 X115.394 Y125.739 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.113666
G1 F7318
M73 P81 R2
G1 X115.413 Y125.564 E.00102
; LINE_WIDTH: 0.149527
G1 X115.433 Y125.445 E.00104
; LINE_WIDTH: 0.187439
G1 X115.451 Y125.332 E.00136
; LINE_WIDTH: 0.224639
G1 X115.47 Y125.218 E.00171
; LINE_WIDTH: 0.245144
G1 X115.579 Y124.641 E.00967
G1 X115.603 Y124.649 F30000
; LINE_WIDTH: 0.400156
G1 F7318
G2 X115.37 Y125.593 I19.064 J5.214 E.0283
G1 X116.553 Y123.648 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F7318
G1 X116.485 Y123.308 E.01066
G1 X115.558 Y123.308 E.02847
G1 X115.558 Y124.231 E.02835
G1 X115.887 Y124.319 E.01044
G3 X116.508 Y123.687 I2.109 J1.452 E.02736
G1 X115.957 Y123.643 F30000
; LINE_WIDTH: 0.41588
G1 F7318
G1 X115.887 Y123.683 E.00245
G1 X115.945 Y123.717 E.00205
G1 X116.89 Y123.336 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.275311
G1 F7318
G3 X117.495 Y123.217 I2.709 J12.155 E.01167
; LINE_WIDTH: 0.217004
G1 X117.608 Y123.197 E.00164
; LINE_WIDTH: 0.176913
G1 X117.722 Y123.177 E.00126
; LINE_WIDTH: 0.141242
G1 X117.857 Y123.16 E.00109
; LINE_WIDTH: 0.111473
G1 X117.987 Y123.143 E.00073
G1 X119.513 Y123.143 F30000
; LINE_WIDTH: 0.111474
G1 F7318
G1 X119.643 Y123.16 E.00073
; LINE_WIDTH: 0.14058
G1 X119.772 Y123.176 E.00104
; LINE_WIDTH: 0.175889
G1 X119.892 Y123.197 E.00131
; LINE_WIDTH: 0.216972
G1 X120.005 Y123.217 E.00164
; LINE_WIDTH: 0.257073
G1 X120.119 Y123.237 E.00202
; LINE_WIDTH: 0.279521
G1 X120.61 Y123.336 E.00965
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X120.119 Y123.237 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/45
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
G1 X119.034 Y124.118
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X119.458 Y124.204 E.01435
G3 X118.666 Y124.101 I-.7 J2.297 E.4739
G3 X118.974 Y124.12 I-.053 J3.521 E.01024
G1 X118.689 Y124.493 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.95 Y124.502 E.00803
G3 X119.148 Y124.53 I-.206 J2.194 E.00615
G3 X118.629 Y124.496 I-.389 J1.971 E.37175
; WIPE_START
M204 S10000
G1 X118.95 Y124.502 E-.12202
G1 X119.148 Y124.53 E-.07608
G1 X119.531 Y124.648 E-.15215
G1 X119.711 Y124.735 E-.07617
G1 X120.042 Y124.96 E-.1521
G1 X120.322 Y125.247 E-.15211
G1 X120.364 Y125.312 E-.02938
; WIPE_END
G1 E-.04 F1800
G1 X127.87 Y126.695 Z2.6 F30000
G1 X140.834 Y129.084 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X120.671 Y129.084 E.66884
G2 X116.829 Y129.084 I-1.921 J-2.582 E.5341
G1 X115.166 Y129.084 E.05517
G1 X115.166 Y122.916 E.20459
G1 X140.834 Y122.916 E.85144
G1 X140.834 Y129.024 E.2026
G1 X141.241 Y129.491 F30000
G1 F16213.044
G1 X119.231 Y129.491 E.73012
G1 X119.209 Y129.271 E.00733
G2 X118.291 Y129.271 I-.459 J-2.771 E.5548
G1 X118.269 Y129.491 E.00733
G1 X114.759 Y129.491 E.11644
G1 X114.759 Y122.509 E.2316
G1 X141.241 Y122.509 E.87845
G1 X141.241 Y129.431 E.22961
G1 X141.648 Y129.898 F30000
G1 F16213.044
G1 X114.352 Y129.898 E.90545
G1 X114.352 Y122.102 E.2586
G1 X141.648 Y122.102 E.90545
G1 X141.648 Y129.838 E.25661
G1 X142.04 Y130.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X113.96 Y130.29 E.86282
G1 X113.96 Y121.71 E.26364
G1 X142.04 Y121.71 E.86282
G1 X142.04 Y130.23 E.2618
; WIPE_START
M204 S10000
G1 X140.04 Y130.234 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.746 Y128.917 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40527
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X140.464 Y128.198 E.05339
G1 X140.464 Y127.554 E.03384
G1 X139.304 Y128.714 E.0862
G1 X138.661 Y128.714 E.03384
G1 X140.464 Y126.911 E.13405
G1 X140.464 Y126.267 E.03384
G1 X138.017 Y128.714 E.18191
G1 X137.373 Y128.714 E.03384
G1 X140.464 Y125.623 E.22977
G1 X140.464 Y124.979 E.03384
G1 X136.729 Y128.714 E.27762
G1 X136.085 Y128.714 E.03384
G1 X140.464 Y124.335 E.32548
G1 X140.464 Y123.691 E.03384
G1 X135.441 Y128.714 E.37333
G1 X134.797 Y128.714 E.03384
G1 X140.226 Y123.286 E.40346
G1 X139.582 Y123.286 E.03384
G1 X134.154 Y128.714 E.40346
G1 X133.51 Y128.714 E.03384
G1 X138.938 Y123.286 E.40346
G1 X138.294 Y123.286 E.03384
G1 X132.866 Y128.714 E.40346
G1 X132.222 Y128.714 E.03384
G1 X137.65 Y123.286 E.40346
G1 X137.006 Y123.286 E.03384
G1 X131.578 Y128.714 E.40346
G1 X130.934 Y128.714 E.03384
G1 X136.362 Y123.286 E.40346
G1 X135.719 Y123.286 E.03384
G1 X130.291 Y128.714 E.40346
G1 X129.647 Y128.714 E.03384
G1 X135.075 Y123.286 E.40346
G1 X134.431 Y123.286 E.03384
G1 X129.003 Y128.714 E.40346
G1 X128.359 Y128.714 E.03384
G1 X133.787 Y123.286 E.40346
G1 X133.143 Y123.286 E.03384
G1 X127.715 Y128.714 E.40346
G1 X127.071 Y128.714 E.03384
G1 X132.499 Y123.286 E.40346
G1 X131.856 Y123.286 E.03384
G1 X126.427 Y128.714 E.40346
G1 X125.784 Y128.714 E.03384
G1 X131.212 Y123.286 E.40346
G1 X130.568 Y123.286 E.03384
G1 X125.14 Y128.714 E.40346
G1 X124.496 Y128.714 E.03384
G1 X129.924 Y123.286 E.40346
G1 X129.28 Y123.286 E.03384
G1 X123.852 Y128.714 E.40346
M73 P81 R1
G1 X123.208 Y128.714 E.03384
G1 X128.636 Y123.286 E.40346
G1 X127.992 Y123.286 E.03384
G1 X122.564 Y128.714 E.40346
G1 X121.92 Y128.714 E.03384
G1 X127.349 Y123.286 E.40346
G1 X126.705 Y123.286 E.03384
G1 X122.024 Y127.966 E.34789
G2 X122.291 Y127.056 I-3.528 J-1.528 E.04999
G1 X126.061 Y123.286 E.28021
G1 X125.417 Y123.286 E.03384
G1 X122.332 Y126.371 E.22933
G2 X122.265 Y125.794 I-4.02 J.173 E.03056
G1 X124.773 Y123.286 E.18644
G1 X124.129 Y123.286 E.03384
G1 X122.124 Y125.291 E.14903
G1 X122.094 Y125.199 E.00508
G2 X121.93 Y124.841 I-9.771 J4.236 E.02069
G1 X123.486 Y123.286 E.11559
G1 X122.842 Y123.286 E.03384
G1 X121.685 Y124.443 E.08599
G2 X121.399 Y124.085 I-1.931 J1.252 E.02412
G1 X122.198 Y123.286 E.0594
G1 X121.554 Y123.286 E.03384
G1 X120.93 Y123.91 E.04639
G1 X120.61 Y123.336 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.279564
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X120.119 Y123.237 E.00965
; LINE_WIDTH: 0.257127
G1 X120.005 Y123.217 E.00202
; LINE_WIDTH: 0.21702
G1 X119.892 Y123.197 E.00164
; LINE_WIDTH: 0.175931
G1 X119.772 Y123.176 E.00131
; LINE_WIDTH: 0.140594
G1 X119.643 Y123.16 E.00104
; LINE_WIDTH: 0.111478
G1 X119.513 Y123.143 E.00073
G1 X117.987 Y123.143 F30000
; LINE_WIDTH: 0.111463
G1 F15000
M73 P82 R1
G1 X117.857 Y123.16 E.00073
; LINE_WIDTH: 0.141212
G1 X117.722 Y123.177 E.00109
; LINE_WIDTH: 0.176866
G1 X117.608 Y123.197 E.00126
; LINE_WIDTH: 0.216976
G1 X117.495 Y123.217 E.00164
; LINE_WIDTH: 0.275315
G2 X116.89 Y123.336 I2.105 J12.275 E.01167
G1 X116.553 Y123.648 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
G1 X116.485 Y123.308 E.01066
G1 X115.558 Y123.308 E.02846
G1 X115.558 Y124.231 E.02835
G1 X115.887 Y124.319 E.01044
G3 X116.508 Y123.687 I2.11 J1.453 E.02736
G1 X115.957 Y123.643 F30000
; LINE_WIDTH: 0.4159
G1 F15000
G1 X115.887 Y123.683 E.00245
G1 X115.945 Y123.717 E.00205
G1 X115.37 Y125.593 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.400104
G1 F15000
G3 X115.603 Y124.649 I19.227 J4.253 E.0283
G1 X115.579 Y124.641 F30000
; LINE_WIDTH: 0.245144
G1 F15000
G1 X115.47 Y125.218 E.00967
; LINE_WIDTH: 0.224639
G1 X115.451 Y125.332 E.00171
; LINE_WIDTH: 0.187439
G1 X115.433 Y125.445 E.00136
; LINE_WIDTH: 0.149527
G1 X115.413 Y125.563 E.00104
; LINE_WIDTH: 0.113666
G1 X115.394 Y125.739 E.00102
G1 X115.709 Y128.514 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.6454
G1 F10954.721
G2 X115.716 Y128.631 I-.034 J.061 E.0148
; WIPE_START
G1 X115.633 Y128.644 E-.20603
G1 X115.596 Y128.579 E-.18466
G1 X115.633 Y128.514 E-.18467
G1 X115.709 Y128.514 E-.18464
; WIPE_END
G1 E-.04 F1800
G1 X117.248 Y129.138 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.112326
G1 F15000
G1 X117.404 Y129.244 E.00107
G1 X117.505 Y129.266 E.00058
; WIPE_START
G1 X117.404 Y129.244 E-.26794
G1 X117.248 Y129.138 E-.49206
; WIPE_END
G1 E-.04 F1800
G1 X119.995 Y129.266 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.112375
G1 F15000
G1 X120.096 Y129.244 E.00058
G1 X120.252 Y129.137 E.00107
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X120.096 Y129.244 E-.49209
G1 X119.995 Y129.266 E-.26791
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/45
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
G1 X119.049 Y124.121
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10417
G1 X119.458 Y124.204 E.01386
G3 X118.678 Y124.101 I-.701 J2.297 E.47431
G3 X118.988 Y124.121 I-.079 J3.601 E.01031
G1 X118.989 Y124.121 E.00002
G1 X118.703 Y124.493 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10417
M204 S5000
G1 X118.95 Y124.502 E.00758
G3 X119.148 Y124.53 I-.211 J2.238 E.00615
G3 X118.644 Y124.495 I-.39 J1.97 E.3722
; WIPE_START
G1 F12000
M204 S10000
G1 X118.95 Y124.502 E-.11647
G1 X119.148 Y124.53 E-.07607
G1 X119.531 Y124.648 E-.15216
G1 X119.711 Y124.735 E-.07617
G1 X120.042 Y124.96 E-.15211
G1 X120.322 Y125.247 E-.15214
G1 X120.372 Y125.324 E-.0349
; WIPE_END
G1 E-.04 F1800
G1 X127.878 Y126.703 Z2.8 F30000
G1 X140.834 Y129.084 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10417
G1 X120.671 Y129.084 E.66885
G2 X116.829 Y129.084 I-1.921 J-2.582 E.53412
G1 X115.166 Y129.084 E.05516
G1 X115.166 Y122.916 E.20459
G1 X140.834 Y122.916 E.85144
G1 X140.834 Y129.024 E.2026
G1 X141.241 Y129.491 F30000
G1 F10417
G1 X119.231 Y129.491 E.73012
G1 X119.209 Y129.271 E.00733
G2 X118.291 Y129.271 I-.459 J-2.771 E.55482
G1 X118.269 Y129.491 E.00733
G1 X114.759 Y129.491 E.11644
G1 X114.759 Y122.509 E.2316
G1 X141.241 Y122.509 E.87845
G1 X141.241 Y129.431 E.22961
G1 X141.648 Y129.898 F30000
G1 F10417
G1 X114.352 Y129.898 E.90545
G1 X114.352 Y122.102 E.2586
G1 X141.648 Y122.102 E.90545
G1 X141.648 Y129.838 E.25661
G1 X142.04 Y130.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10417
M204 S5000
G1 X113.96 Y130.29 E.86282
G1 X113.96 Y121.71 E.26364
G1 X142.04 Y121.71 E.86282
G1 X142.04 Y130.23 E.2618
; WIPE_START
G1 F12000
M204 S10000
G1 X140.04 Y130.234 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.694 Y128.164 Z2.8 F30000
G1 X125.015 Y126 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.52447
G1 F10417
G1 X137.69 Y126 E.49736
G1 X124.644 Y126.429 F30000
; LINE_WIDTH: 0.41999
G1 F10417
G1 X138.179 Y126.429 E.41588
G1 X138.179 Y125.571 E.02638
G1 X124.537 Y125.571 E.41918
G1 X124.613 Y126.382 E.02505
G1 X124.239 Y126.43 F30000
G1 F10417
G1 X124.229 Y126.806 E.01157
G1 X138.556 Y126.806 E.44022
G1 X138.556 Y125.194 E.04955
G1 X124.074 Y125.194 E.445
G3 X124.234 Y126.37 I-4.524 J1.216 E.03658
G1 X123.835 Y126.089 F30000
G1 F10417
G1 X123.854 Y126.796 E.02175
G1 X123.806 Y127.183 E.01199
G1 X138.933 Y127.183 E.46482
G1 X138.933 Y124.817 E.07273
G1 X123.576 Y124.817 E.47188
G1 X123.753 Y125.446 E.0201
G1 X123.827 Y126.029 E.01805
G1 X123.459 Y126.117 F30000
G1 F10417
G1 X123.48 Y126.749 E.01945
G1 X123.365 Y127.561 E.02518
G1 X139.311 Y127.561 E.48996
G1 X139.311 Y124.439 E.0959
G1 X123.003 Y124.439 E.50108
G1 X123.205 Y124.892 E.01523
G1 X123.39 Y125.548 E.02095
G1 X123.452 Y126.057 E.01575
G1 X123.111 Y126.515 F30000
G1 F10417
G1 X123.021 Y127.379 E.0267
G1 X122.853 Y127.938 E.01793
G1 X139.688 Y127.938 E.51726
G1 X139.688 Y124.062 E.11907
G1 X122.366 Y124.062 E.53224
G1 X122.774 Y124.819 E.02643
G1 X123.027 Y125.65 E.02669
G1 X123.105 Y126.455 E.02483
G1 X122.735 Y126.543 F30000
G1 F10417
G1 X122.647 Y127.332 E.0244
G1 X122.405 Y128.087 E.02438
G1 X122.287 Y128.315 E.00787
G1 X140.065 Y128.315 E.54625
G1 X140.065 Y123.685 E.14224
G1 X121.571 Y123.685 E.56824
G1 X122.067 Y124.291 E.02404
G1 X122.438 Y124.991 E.02437
G1 X122.664 Y125.753 E.02439
G1 X122.729 Y126.483 E.02253
G1 X122.359 Y126.571 F30000
M73 P83 R1
G1 F10417
G1 X122.273 Y127.285 E.0221
G1 X122.048 Y127.967 E.02208
G1 X121.692 Y128.592 E.02208
G1 X121.61 Y128.692 E.00396
G1 X140.442 Y128.692 E.57862
G1 X140.442 Y123.308 E.16542
G1 X121.015 Y123.308 E.59691
G1 X120.947 Y123.648 E.01066
G1 X121.347 Y123.993 E.01624
G1 X121.772 Y124.526 E.02093
G1 X122.103 Y125.163 E.02207
G1 X122.301 Y125.855 E.0221
G1 X122.354 Y126.511 E.02024
; WIPE_START
G1 F15000
G1 X122.301 Y125.855 E-.25026
G1 X122.103 Y125.163 E-.27328
G1 X121.816 Y124.611 E-.23647
; WIPE_END
G1 E-.04 F1800
G1 X120.252 Y129.138 Z2.8 F30000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.112317
G1 F10417
G1 X120.096 Y129.244 E.00107
G1 X119.995 Y129.266 E.00058
; WIPE_START
G1 F15000
G1 X120.096 Y129.244 E-.26791
G1 X120.252 Y129.138 E-.49209
; WIPE_END
G1 E-.04 F1800
G1 X117.505 Y129.266 Z2.8 F30000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.112401
G1 F10417
G1 X117.404 Y129.244 E.00059
G1 X117.247 Y129.137 E.00107
; WIPE_START
G1 F15000
G1 X117.404 Y129.244 E-.49209
G1 X117.505 Y129.266 E-.26791
; WIPE_END
G1 E-.04 F1800
G1 X115.709 Y128.514 Z2.8 F30000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.64544
G1 F10417
G2 X115.716 Y128.631 I-.034 J.061 E.0148
G1 X115.394 Y125.739 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.113656
G1 F10417
G1 X115.413 Y125.564 E.00102
; LINE_WIDTH: 0.149494
G1 X115.433 Y125.445 E.00104
; LINE_WIDTH: 0.187419
G1 X115.451 Y125.332 E.00136
; LINE_WIDTH: 0.224632
G1 X115.47 Y125.218 E.00171
; LINE_WIDTH: 0.245144
G1 X115.579 Y124.641 E.00967
G1 X115.603 Y124.649 F30000
; LINE_WIDTH: 0.400129
G1 F10417
G2 X115.37 Y125.593 I18.764 J5.139 E.02831
G1 X116.554 Y123.648 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F10417
G1 X116.485 Y123.308 E.01066
G1 X115.558 Y123.308 E.02846
G1 X115.558 Y124.231 E.02835
G1 X115.887 Y124.319 E.01044
G3 X116.508 Y123.687 I2.11 J1.453 E.02737
G1 X115.957 Y123.643 F30000
; LINE_WIDTH: 0.41588
G1 F10417
G1 X115.887 Y123.683 E.00245
G1 X115.945 Y123.717 E.00205
G1 X116.89 Y123.336 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.275341
G1 F10417
G3 X117.495 Y123.217 I2.641 J11.768 E.01167
; LINE_WIDTH: 0.216964
G1 X117.608 Y123.197 E.00164
; LINE_WIDTH: 0.176833
G1 X117.722 Y123.177 E.00126
; LINE_WIDTH: 0.141181
G1 X117.857 Y123.16 E.00109
; LINE_WIDTH: 0.111451
G1 X117.987 Y123.143 E.00073
G1 X119.513 Y123.143 F30000
; LINE_WIDTH: 0.111478
G1 F10417
G1 X119.643 Y123.16 E.00073
; LINE_WIDTH: 0.140594
G1 X119.772 Y123.176 E.00104
; LINE_WIDTH: 0.175928
G1 X119.892 Y123.197 E.00131
; LINE_WIDTH: 0.217011
G1 X120.005 Y123.217 E.00164
; LINE_WIDTH: 0.257111
G1 X120.119 Y123.237 E.00202
; LINE_WIDTH: 0.279564
G1 X120.61 Y123.336 E.00965
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X120.119 Y123.237 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/45
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
G1 X118.786 Y124.101
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10392
G1 X119.226 Y124.145 E.01468
G3 X118.511 Y124.109 I-.476 J2.354 E.47665
G1 X118.726 Y124.098 E.00715
G1 X118.717 Y124.491 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10392
M204 S5000
G1 X118.75 Y124.49 E.00101
G3 X118.55 Y124.5 I0 J2.009 E.38171
G1 X118.657 Y124.494 E.00331
; WIPE_START
G1 F12000
M204 S10000
G1 X118.75 Y124.49 E-.03527
G1 X119.148 Y124.53 E-.15209
G1 X119.531 Y124.648 E-.15216
G1 X119.882 Y124.839 E-.15212
G1 X120.189 Y125.096 E-.15211
G1 X120.38 Y125.336 E-.11626
; WIPE_END
G1 E-.04 F1800
G1 X127.887 Y126.711 Z3 F30000
G1 X140.834 Y129.084 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10392
G1 X120.671 Y129.084 E.66884
G2 X121.946 Y126.16 I-1.943 J-2.588 E.11066
G2 X116.829 Y129.084 I-3.198 J.342 E.42324
G1 X115.166 Y129.084 E.05516
G1 X115.166 Y122.916 E.20459
G1 X140.834 Y122.916 E.85144
G1 X140.834 Y129.024 E.2026
G1 X141.241 Y129.491 F30000
G1 F10392
G1 X119.231 Y129.491 E.73012
G1 X119.209 Y129.271 E.00733
G2 X118.291 Y129.271 I-.459 J-2.77 E.55465
G1 X118.269 Y129.491 E.00733
G1 X114.759 Y129.491 E.11644
G1 X114.759 Y122.509 E.2316
G1 X141.241 Y122.509 E.87845
G1 X141.241 Y129.431 E.22961
G1 X141.648 Y129.898 F30000
G1 F10392
G1 X114.352 Y129.898 E.90545
G1 X114.352 Y122.102 E.2586
G1 X141.648 Y122.102 E.90545
G1 X141.648 Y129.838 E.25661
G1 X142.04 Y130.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10392
M204 S5000
G1 X113.96 Y130.29 E.86282
G1 X113.96 Y121.71 E.26364
G1 X142.04 Y121.71 E.86282
G1 X142.04 Y130.23 E.2618
; WIPE_START
G1 F12000
M204 S10000
G1 X140.04 Y130.234 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.694 Y128.164 Z3 F30000
G1 X125.015 Y126 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.52446
G1 F10392
G1 X137.69 Y126 E.49735
G1 X124.648 Y126.429 F30000
; LINE_WIDTH: 0.41999
G1 F10392
G1 X138.179 Y126.429 E.41576
G1 X138.179 Y125.571 E.02638
G1 X124.537 Y125.571 E.41917
G1 X124.614 Y126.384 E.0251
G1 X124.239 Y126.427 F30000
G1 F10392
G1 X124.23 Y126.806 E.01167
G1 X138.556 Y126.806 E.44021
G1 X138.556 Y125.194 E.04955
G1 X124.074 Y125.194 E.445
G3 X124.234 Y126.367 I-4.52 J1.216 E.03648
G1 X123.835 Y126.089 F30000
G1 F10392
G1 X123.855 Y126.793 E.02165
G1 X123.806 Y127.183 E.01208
G1 X138.933 Y127.183 E.46482
G1 X138.933 Y124.817 E.07273
G1 X123.576 Y124.817 E.47188
G1 X123.753 Y125.446 E.0201
G1 X123.828 Y126.03 E.01807
G1 X123.459 Y126.117 F30000
G1 F10392
G1 X123.48 Y126.747 E.01934
G1 X123.365 Y127.561 E.02526
G1 X139.311 Y127.561 E.48996
G1 X139.311 Y124.439 E.0959
G1 X123.003 Y124.439 E.50108
G1 X123.206 Y124.892 E.01525
G1 X123.39 Y125.548 E.02094
G1 X123.452 Y126.058 E.01577
G1 X123.111 Y126.512 F30000
G1 F10392
G1 X123.021 Y127.378 E.02677
G1 X122.853 Y127.938 E.01794
G1 X139.688 Y127.938 E.51726
G1 X139.688 Y124.062 E.11907
G1 X122.366 Y124.062 E.53224
G1 X122.774 Y124.82 E.02644
G1 X123.027 Y125.65 E.02668
G1 X123.105 Y126.452 E.02475
G1 X122.735 Y126.54 F30000
G1 F10392
G1 X122.647 Y127.332 E.02447
G1 X122.405 Y128.087 E.02438
G1 X122.287 Y128.315 E.00787
G1 X140.065 Y128.315 E.54625
G1 X140.065 Y123.685 E.14224
G1 X121.571 Y123.685 E.56824
G1 X122.067 Y124.291 E.02404
G1 X122.439 Y124.992 E.02438
G1 X122.664 Y125.753 E.02438
G1 X122.73 Y126.48 E.02245
G1 X122.359 Y126.569 F30000
G1 F10392
G1 X122.273 Y127.285 E.02216
G1 X122.048 Y127.967 E.02208
G1 X121.692 Y128.592 E.02208
G1 X121.61 Y128.692 E.00396
G1 X140.442 Y128.692 E.57862
G1 X140.442 Y123.308 E.16542
G1 X121.015 Y123.308 E.5969
G1 X120.946 Y123.648 E.01066
G1 X121.347 Y123.993 E.01625
G1 X121.772 Y124.526 E.02094
G1 X122.103 Y125.164 E.02209
G1 X122.301 Y125.855 E.02209
M73 P84 R1
G1 X122.354 Y126.509 E.02016
; WIPE_START
G1 F15000
G1 X122.301 Y125.855 E-.24935
G1 X122.103 Y125.164 E-.27313
G1 X121.815 Y124.609 E-.23752
; WIPE_END
G1 E-.04 F1800
G1 X120.252 Y129.137 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.112369
G1 F10392
G1 X120.096 Y129.244 E.00107
G1 X119.995 Y129.266 E.00058
; WIPE_START
G1 F15000
G1 X120.096 Y129.244 E-.26792
G1 X120.252 Y129.137 E-.49208
; WIPE_END
G1 E-.04 F1800
G1 X117.505 Y129.266 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.112366
G1 F10392
G1 X117.404 Y129.244 E.00058
G1 X117.248 Y129.137 E.00107
; WIPE_START
G1 F15000
G1 X117.404 Y129.244 E-.49204
G1 X117.505 Y129.266 E-.26796
; WIPE_END
G1 E-.04 F1800
G1 X115.709 Y128.514 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.6454
G1 F10392
G2 X115.716 Y128.631 I-.034 J.061 E.0148
G1 X115.394 Y125.739 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.11371
G1 F10392
G1 X115.414 Y125.563 E.00102
; LINE_WIDTH: 0.149553
G1 X115.433 Y125.445 E.00104
; LINE_WIDTH: 0.18739
G1 X115.451 Y125.332 E.00135
; LINE_WIDTH: 0.224517
G1 X115.47 Y125.218 E.0017
; LINE_WIDTH: 0.244983
G1 X115.579 Y124.641 E.00967
G1 X115.603 Y124.649 F30000
; LINE_WIDTH: 0.40019
G1 F10392
G2 X115.37 Y125.594 I18.373 J5.04 E.02834
G1 X116.553 Y123.648 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F10392
G1 X116.485 Y123.308 E.01066
G1 X115.558 Y123.308 E.02847
G1 X115.558 Y124.231 E.02835
G1 X115.887 Y124.319 E.01044
G3 X116.508 Y123.687 I2.11 J1.453 E.02736
G1 X115.957 Y123.643 F30000
; LINE_WIDTH: 0.41592
G1 F10392
G1 X115.887 Y123.683 E.00245
G1 X115.945 Y123.717 E.00205
G1 X116.89 Y123.336 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.275362
G1 F10392
G3 X117.495 Y123.217 I2.726 J12.251 E.01167
; LINE_WIDTH: 0.216993
G1 X117.608 Y123.197 E.00164
; LINE_WIDTH: 0.176855
G1 X117.722 Y123.177 E.00126
; LINE_WIDTH: 0.141182
G1 X117.857 Y123.16 E.00109
; LINE_WIDTH: 0.111452
G1 X117.987 Y123.143 E.00073
G1 X119.513 Y123.143 F30000
; LINE_WIDTH: 0.111483
G1 F10392
G1 X119.643 Y123.16 E.00073
; LINE_WIDTH: 0.140609
G1 X119.772 Y123.176 E.00104
; LINE_WIDTH: 0.175951
G1 X119.892 Y123.197 E.00131
; LINE_WIDTH: 0.21704
G1 X120.006 Y123.217 E.00164
; LINE_WIDTH: 0.257146
G1 X120.119 Y123.237 E.00202
; LINE_WIDTH: 0.279572
G1 X120.61 Y123.336 E.00965
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X120.119 Y123.237 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/45
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
G1 X118.731 Y124.109
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10393
G1 X118.987 Y124.109 E.00849
G3 X118.511 Y124.109 I-.236 J2.39 E.48469
G1 X118.671 Y124.109 E.00531
G1 X118.729 Y124.491 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10393
M204 S5000
G1 X118.731 Y124.491 E.00006
G3 X118.55 Y124.5 I.009 J2.009 E.38231
G1 X118.669 Y124.494 E.00367
; WIPE_START
G1 F12000
M204 S10000
G1 X118.731 Y124.491 E-.02356
G1 X118.949 Y124.5 E-.08295
G1 X119.343 Y124.579 E-.15248
G1 X119.711 Y124.735 E-.15209
G1 X120.042 Y124.96 E-.15213
G1 X120.322 Y125.247 E-.15212
G1 X120.385 Y125.345 E-.04468
; WIPE_END
G1 E-.04 F1800
G1 X127.893 Y126.718 Z3.2 F30000
G1 X140.834 Y129.084 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10393
G1 X120.671 Y129.084 E.66884
G2 X116.829 Y129.084 I-1.921 J-2.581 E.53402
G1 X115.166 Y129.084 E.05516
G1 X115.166 Y122.916 E.20459
G1 X140.834 Y122.916 E.85144
G1 X140.834 Y129.024 E.2026
G1 X141.241 Y129.491 F30000
G1 F10393
G1 X119.231 Y129.491 E.73012
G1 X119.209 Y129.271 E.00733
G2 X118.291 Y129.271 I-.459 J-2.772 E.55501
G1 X118.269 Y129.491 E.00733
G1 X114.759 Y129.491 E.11644
G1 X114.759 Y122.509 E.2316
G1 X141.241 Y122.509 E.87845
G1 X141.241 Y129.431 E.22961
G1 X141.648 Y129.898 F30000
G1 F10393
G1 X114.352 Y129.898 E.90545
G1 X114.352 Y122.102 E.2586
G1 X141.648 Y122.102 E.90545
G1 X141.648 Y129.838 E.25661
G1 X142.04 Y130.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10393
M204 S5000
G1 X113.96 Y130.29 E.86282
G1 X113.96 Y121.71 E.26364
G1 X142.04 Y121.71 E.86282
G1 X142.04 Y130.23 E.2618
; WIPE_START
G1 F12000
M204 S10000
G1 X140.04 Y130.234 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.694 Y128.164 Z3.2 F30000
G1 X125.015 Y126 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.52447
G1 F10393
G1 X137.69 Y126 E.49736
G1 X124.644 Y126.429 F30000
; LINE_WIDTH: 0.41999
G1 F10393
G1 X138.179 Y126.429 E.41588
G1 X138.179 Y125.571 E.02638
G1 X124.537 Y125.571 E.41918
G1 X124.613 Y126.382 E.02505
G1 X124.239 Y126.43 F30000
G1 F10393
G1 X124.229 Y126.806 E.01157
G1 X138.556 Y126.806 E.44022
G1 X138.556 Y125.194 E.04955
G1 X124.074 Y125.194 E.445
G3 X124.234 Y126.37 I-4.523 J1.216 E.03658
G1 X123.835 Y126.089 F30000
G1 F10393
G1 X123.854 Y126.796 E.02175
G1 X123.806 Y127.183 E.012
G1 X138.933 Y127.183 E.46482
G1 X138.933 Y124.817 E.07273
G1 X123.576 Y124.817 E.47188
G1 X123.753 Y125.446 E.0201
G1 X123.828 Y126.029 E.01805
G1 X123.459 Y126.117 F30000
G1 F10393
G1 X123.48 Y126.749 E.01945
G1 X123.365 Y127.561 E.02518
G1 X139.311 Y127.561 E.48996
G1 X139.311 Y124.439 E.0959
G1 X123.003 Y124.439 E.50108
G1 X123.206 Y124.892 E.01525
G1 X123.39 Y125.548 E.02094
G1 X123.452 Y126.057 E.01575
G1 X123.111 Y126.515 F30000
G1 F10393
G1 X123.021 Y127.379 E.02669
G1 X122.853 Y127.938 E.01794
G1 X139.688 Y127.938 E.51726
G1 X139.688 Y124.062 E.11907
G1 X122.366 Y124.062 E.53224
G1 X122.774 Y124.82 E.02644
G1 X123.027 Y125.651 E.02668
G1 X123.105 Y126.455 E.02483
G1 X122.735 Y126.543 F30000
G1 F10393
G1 X122.647 Y127.332 E.02439
G1 X122.405 Y128.087 E.02438
G1 X122.287 Y128.315 E.00787
G1 X140.065 Y128.315 E.54625
G1 X140.065 Y123.685 E.14224
G1 X121.571 Y123.685 E.56824
G1 X122.067 Y124.291 E.02404
G1 X122.439 Y124.992 E.02438
G1 X122.664 Y125.753 E.02438
G1 X122.729 Y126.483 E.02253
G1 X122.359 Y126.571 F30000
G1 F10393
G1 X122.273 Y127.285 E.02209
G1 X122.048 Y127.967 E.02209
G1 X121.692 Y128.592 E.02209
G1 X121.61 Y128.692 E.00396
G1 X140.442 Y128.692 E.57862
G1 X140.442 Y123.308 E.16542
G1 X121.015 Y123.308 E.5969
G1 X120.947 Y123.648 E.01066
G1 X121.347 Y123.993 E.01624
G1 X121.772 Y124.526 E.02093
G1 X122.103 Y125.164 E.02208
G1 X122.301 Y125.855 E.02209
G1 X122.354 Y126.511 E.02023
; WIPE_START
G1 F15000
G1 X122.301 Y125.855 E-.25023
G1 X122.103 Y125.164 E-.27316
G1 X121.816 Y124.611 E-.2366
; WIPE_END
G1 E-.04 F1800
G1 X120.252 Y129.137 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.112354
G1 F10393
G1 X120.096 Y129.244 E.00107
M73 P85 R1
G1 X119.995 Y129.266 E.00058
; WIPE_START
G1 F15000
G1 X120.096 Y129.244 E-.26793
G1 X120.252 Y129.137 E-.49207
; WIPE_END
G1 E-.04 F1800
G1 X117.505 Y129.266 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.112344
G1 F10393
G1 X117.404 Y129.244 E.00058
G1 X117.248 Y129.137 E.00107
; WIPE_START
G1 F15000
G1 X117.404 Y129.244 E-.49208
G1 X117.505 Y129.266 E-.26792
; WIPE_END
G1 E-.04 F1800
G1 X115.709 Y128.514 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.64544
G1 F10393
G2 X115.716 Y128.631 I-.034 J.061 E.0148
G1 X115.394 Y125.739 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.113678
G1 F10393
G1 X115.413 Y125.563 E.00102
; LINE_WIDTH: 0.149521
G1 X115.433 Y125.445 E.00104
; LINE_WIDTH: 0.187417
G1 X115.451 Y125.332 E.00136
; LINE_WIDTH: 0.224602
G1 X115.47 Y125.218 E.00171
; LINE_WIDTH: 0.245083
G1 X115.579 Y124.641 E.00967
G1 X115.603 Y124.649 F30000
; LINE_WIDTH: 0.400168
G1 F10393
G2 X115.37 Y125.594 I18.918 J5.174 E.02833
G1 X116.553 Y123.648 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F10393
G1 X116.485 Y123.308 E.01066
G1 X115.558 Y123.308 E.02847
G1 X115.558 Y124.231 E.02835
G1 X115.887 Y124.319 E.01044
G3 X116.508 Y123.687 I2.11 J1.453 E.02736
G1 X115.957 Y123.643 F30000
; LINE_WIDTH: 0.41588
G1 F10393
G1 X115.887 Y123.683 E.00245
G1 X115.945 Y123.717 E.00205
G1 X116.89 Y123.336 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.275379
G1 F10393
G3 X117.495 Y123.217 I2.665 J11.905 E.01167
; LINE_WIDTH: 0.217002
G1 X117.608 Y123.197 E.00164
; LINE_WIDTH: 0.17687
G1 X117.722 Y123.177 E.00126
; LINE_WIDTH: 0.141211
G1 X117.857 Y123.16 E.00109
; LINE_WIDTH: 0.111462
G1 X117.987 Y123.143 E.00073
G1 X119.513 Y123.143 F30000
; LINE_WIDTH: 0.111467
G1 F10393
G1 X119.643 Y123.16 E.00073
; LINE_WIDTH: 0.140562
G1 X119.772 Y123.176 E.00104
; LINE_WIDTH: 0.175908
G1 X119.892 Y123.197 E.00131
; LINE_WIDTH: 0.217035
G1 X120.006 Y123.217 E.00164
; LINE_WIDTH: 0.257179
G1 X120.119 Y123.237 E.00202
; LINE_WIDTH: 0.279644
G1 X120.61 Y123.336 E.00965
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X120.119 Y123.237 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/45
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
G1 X118.74 Y124.49
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.744 Y124.49 E.0001
G3 X118.55 Y124.5 I.003 J2.005 E.38117
G1 X118.68 Y124.493 E.00402
; WIPE_START
M204 S10000
G1 X118.744 Y124.49 E-.02405
G1 X118.95 Y124.5 E-.07843
G1 X119.343 Y124.579 E-.15228
G1 X119.711 Y124.735 E-.15211
G1 X120.042 Y124.96 E-.15209
G1 X120.322 Y125.247 E-.15216
G1 X120.392 Y125.355 E-.04889
; WIPE_END
G1 E-.04 F1800
G1 X127.833 Y127.051 Z3.4 F30000
G1 X142.04 Y130.29 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X113.96 Y130.29 E.86282
G1 X113.96 Y121.71 E.26364
G1 X142.04 Y121.71 E.86282
G1 X142.04 Y130.23 E.2618
; WIPE_START
M204 S10000
G1 X140.04 Y130.234 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.844 Y123.7 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.30247
G1 F15000
G1 X138.62 Y123.7 E.06818
; WIPE_START
G1 X140.62 Y123.7 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.248 Y121.917 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
M204 S2000
G1 X141.833 Y122.502 E.0254
G1 X141.833 Y123.035
G1 X140.715 Y121.917 E.04857
G1 X140.182 Y121.917
G1 X141.808 Y123.544 E.07067
G1 X141.275 Y123.544
G1 X139.648 Y121.917 E.07067
G1 X139.115 Y121.917
G1 X140.742 Y123.544 E.07067
G1 X140.208 Y123.544
G1 X138.582 Y121.917 E.07067
G1 X138.049 Y121.917
G1 X139.675 Y123.544 E.07067
G1 X139.142 Y123.544
G1 X137.515 Y121.917 E.07067
G1 X136.982 Y121.917
G1 X138.609 Y123.544 E.07067
M204 S10000
G1 X141.054 Y123.856 F30000
G1 F12000
M204 S2000
G1 X141.833 Y124.635 E.03383
G1 X141.833 Y125.168
G1 X140.521 Y123.856 E.05701
G1 X139.988 Y123.856
G1 X141.833 Y125.701 E.08018
G1 X141.833 Y126.235
G1 X139.454 Y123.856 E.10335
G1 X138.921 Y123.856
G1 X141.833 Y126.768 E.12652
G1 X141.833 Y127.301
G1 X136.449 Y121.917 E.23395
G1 X135.916 Y121.917
G1 X141.833 Y127.834 E.25712
G1 X141.833 Y128.368
G1 X135.382 Y121.917 E.2803
G1 X134.849 Y121.917
G1 X141.833 Y128.901 E.30347
G1 X141.833 Y129.434
G1 X134.316 Y121.917 E.32664
G1 X133.783 Y121.917
G1 X141.833 Y129.967 E.34981
G1 X141.415 Y130.083
G1 X133.249 Y121.917 E.35482
G1 X132.716 Y121.917
G1 X140.881 Y130.083 E.35482
G1 X140.348 Y130.083
G1 X132.183 Y121.917 E.35482
G1 X131.65 Y121.917
G1 X139.815 Y130.083 E.35482
G1 X139.282 Y130.083
G1 X131.116 Y121.917 E.35482
G1 X130.583 Y121.917
G1 X138.748 Y130.083 E.35482
G1 X138.215 Y130.083
G1 X130.05 Y121.917 E.35482
G1 X129.517 Y121.917
G1 X137.682 Y130.083 E.35482
G1 X137.149 Y130.083
G1 X128.983 Y121.917 E.35482
G1 X128.45 Y121.917
G1 X136.615 Y130.083 E.35482
G1 X136.082 Y130.083
G1 X127.917 Y121.917 E.35482
G1 X127.384 Y121.917
G1 X135.549 Y130.083 E.35482
G1 X135.015 Y130.083
G1 X126.85 Y121.917 E.35482
G1 X126.317 Y121.917
G1 X134.482 Y130.083 E.35482
G1 X133.949 Y130.083
G1 X125.784 Y121.917 E.35482
G1 X125.25 Y121.917
G1 X133.416 Y130.083 E.35482
G1 X132.882 Y130.083
G1 X124.717 Y121.917 E.35482
G1 X124.184 Y121.917
G1 X132.349 Y130.083 E.35482
G1 X131.816 Y130.083
G1 X123.651 Y121.917 E.35482
G1 X123.117 Y121.917
G1 X131.283 Y130.083 E.35482
G1 X130.749 Y130.083
G1 X122.584 Y121.917 E.35482
G1 X122.051 Y121.917
G1 X130.216 Y130.083 E.35482
G1 X129.683 Y130.083
G1 X121.518 Y121.917 E.35482
G1 X120.984 Y121.917
G1 X129.15 Y130.083 E.35482
G1 X128.616 Y130.083
G1 X120.451 Y121.917 E.35482
G1 X119.918 Y121.917
G1 X128.083 Y130.083 E.35482
G1 X127.55 Y130.083
G1 X119.385 Y121.917 E.35482
G1 X118.851 Y121.917
G1 X127.017 Y130.083 E.35482
G1 X126.483 Y130.083
G1 X118.318 Y121.917 E.35482
G1 X117.785 Y121.917
G1 X125.95 Y130.083 E.35482
G1 X125.417 Y130.083
G1 X120.568 Y125.233 E.21072
G1 X120.937 Y126.136
G1 X124.884 Y130.083 E.17151
G1 X124.35 Y130.083
G1 X120.957 Y126.689 E.14745
M73 P86 R1
G1 X120.872 Y127.137
G1 X123.817 Y130.083 E.12798
G1 X123.284 Y130.083
G1 X120.718 Y127.517 E.1115
G1 X120.512 Y127.844
G1 X122.751 Y130.083 E.09729
G1 X122.217 Y130.083
G1 X120.26 Y128.125 E.08507
G1 X119.959 Y128.357
G1 X121.684 Y130.083 E.07498
G1 X121.151 Y130.083
G1 X119.61 Y128.542 E.06697
G1 X119.203 Y128.668
G1 X120.618 Y130.083 E.06146
G1 X120.084 Y130.083
G1 X118.717 Y128.715 E.05942
G1 X118.08 Y128.611
G1 X119.551 Y130.083 E.06393
; WIPE_START
M204 S10000
G1 X118.137 Y128.668 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X120.009 Y124.675 Z3.4 F30000
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X117.252 Y121.917 E.11982
G1 X116.718 Y121.917
G1 X119.116 Y124.315 E.10419
G1 X118.559 Y124.292
G1 X116.185 Y121.917 E.10317
G1 X115.652 Y121.917
G1 X118.111 Y124.377 E.10687
G1 X117.733 Y124.531
G1 X115.119 Y121.917 E.11359
G1 X114.585 Y121.917
G1 X117.407 Y124.739 E.1226
G1 X117.127 Y124.992
G1 X114.167 Y122.033 E.12859
G1 X114.167 Y122.566
G1 X116.892 Y125.29 E.11838
G1 X116.708 Y125.64
G1 X114.167 Y123.099 E.1104
G1 X114.167 Y123.632
G1 X116.581 Y126.046 E.1049
G1 X116.533 Y126.532
G1 X114.167 Y124.166 E.10281
G1 X114.167 Y124.699
G1 X116.637 Y127.169 E.10731
; WIPE_START
M204 S10000
G1 X115.223 Y125.754 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X114.167 Y125.232 Z3.4 F30000
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X119.018 Y130.083 E.21077
G1 X118.485 Y130.083
G1 X114.167 Y125.766 E.1876
G1 X114.167 Y126.299
G1 X117.951 Y130.083 E.16443
G1 X117.418 Y130.083
G1 X114.167 Y126.832 E.14125
G1 X114.167 Y127.365
G1 X116.885 Y130.083 E.11808
G1 X116.351 Y130.083
G1 X114.167 Y127.899 E.09491
G1 X114.167 Y128.432
G1 X115.818 Y130.083 E.07174
G1 X115.285 Y130.083
G1 X114.167 Y128.965 E.04856
G1 X114.167 Y129.498
G1 X114.752 Y130.083 E.02539
; WIPE_START
M204 S10000
G1 X114.167 Y129.498 E-.31401
G1 X114.167 Y128.965 E-.20264
G1 X114.62 Y129.418 E-.24335
; WIPE_END
G1 E-.04 F1800
G1 X118.091 Y128.6 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.172579
G1 F15000
G1 X117.947 Y128.632 E.00156
; LINE_WIDTH: 0.18355
G1 X117.863 Y128.575 E.00115
; LINE_WIDTH: 0.144153
G1 X117.776 Y128.517 E.00086
; LINE_WIDTH: 0.106209
G1 X117.657 Y128.428 E.00077
; WIPE_START
G1 X117.776 Y128.517 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X120.948 Y126.414 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.159439
G1 F15000
G1 X121.007 Y126.556 E.00146
G1 X120.94 Y126.707 E.00157
; WIPE_START
G1 X121.007 Y126.556 E-.39296
G1 X120.948 Y126.414 E-.36704
; WIPE_END
G1 E-.04 F1800
G1 X120.628 Y125.173 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223538
G1 F15000
G1 X120.382 Y124.902 E.00538
G1 X120.069 Y124.614 E.00626
G1 X119.328 Y124.26 F30000
; LINE_WIDTH: 0.133474
G1 F15000
G1 X119.103 Y124.328 E.00173
G1 X119.436 Y124.394 F30000
; LINE_WIDTH: 0.093552
G1 F15000
G2 X119.188 Y124.243 I-3.172 J4.948 E.0012
; WIPE_START
G1 X119.436 Y124.394 E-.76
; WIPE_END
G1 E-.04 F1800
M73 P87 R1
G1 X116.556 Y126.799 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0897697
G1 F15000
G3 X116.461 Y126.604 I4.062 J-2.119 E.00083
G1 X116.595 Y127.393 F30000
; LINE_WIDTH: 0.102071
G1 F15000
G1 X116.65 Y127.155 E.00118
G1 X116.82 Y127.591 F30000
; LINE_WIDTH: 0.102079
G1 F15000
G1 X116.76 Y127.509 E.00049
; LINE_WIDTH: 0.140226
G3 X116.569 Y127.237 I5.459 J-4.039 E.00264
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X116.76 Y127.509 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/45
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
G17
G3 Z3.4 I1.217 J0 P1  F30000
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
G1 X138.259 Y124.191
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X138.259 Y123.209 E.03257
G1 X141.241 Y123.209 E.09891
G1 X141.241 Y124.191 E.03257
G1 X138.319 Y124.191 E.09692
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05957
G1 X141.648 Y122.802 E.12592
G1 X141.648 Y124.598 E.05957
G1 X137.912 Y124.598 E.12393
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07928
G1 X142.04 Y122.41 E.14073
G1 X142.04 Y124.99 E.07928
G1 X137.52 Y124.99 E.13889
; WIPE_START
G1 F12000
M204 S10000
G1 X137.474 Y122.991 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.463 Y123.7 Z3.6 F30000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.61758
G1 F1200
G1 X141.037 Y123.7 E.12056
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11485.052
G1 X139.037 Y123.7 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/45
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
G17
G3 Z3.6 I1.217 J0 P1  F30000
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
G1 X138.259 Y124.191
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X138.259 Y123.209 E.03257
G1 X141.241 Y123.209 E.09891
G1 X141.241 Y124.191 E.03257
G1 X138.319 Y124.191 E.09692
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05957
G1 X141.648 Y122.802 E.12592
G1 X141.648 Y124.598 E.05957
G1 X137.912 Y124.598 E.12393
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07928
G1 X142.04 Y122.41 E.14073
G1 X142.04 Y124.99 E.07928
G1 X137.52 Y124.99 E.13889
; WIPE_START
G1 F12000
M204 S10000
G1 X137.474 Y122.991 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.463 Y123.7 Z3.8 F30000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.61758
G1 F1200
G1 X141.037 Y123.7 E.12056
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11485.052
G1 X139.037 Y123.7 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/45
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
G17
G3 Z3.8 I1.217 J0 P1  F30000
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
G1 X138.259 Y124.191
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X138.259 Y123.209 E.03257
G1 X141.241 Y123.209 E.09891
G1 X141.241 Y124.191 E.03257
G1 X138.319 Y124.191 E.09692
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05957
G1 X141.648 Y122.802 E.12592
G1 X141.648 Y124.598 E.05957
G1 X137.912 Y124.598 E.12393
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07928
G1 X142.04 Y122.41 E.14073
G1 X142.04 Y124.99 E.07928
G1 X137.52 Y124.99 E.13889
; WIPE_START
G1 F12000
M204 S10000
G1 X137.474 Y122.991 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.463 Y123.7 Z4 F30000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.61758
G1 F1200
G1 X141.037 Y123.7 E.12056
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11485.052
G1 X139.037 Y123.7 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/45
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
G17
G3 Z4 I1.217 J0 P1  F30000
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
G1 X138.259 Y124.191
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X138.259 Y123.209 E.03257
G1 X141.241 Y123.209 E.09891
G1 X141.241 Y124.191 E.03257
G1 X138.319 Y124.191 E.09692
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05957
G1 X141.648 Y122.802 E.12592
G1 X141.648 Y124.598 E.05957
G1 X137.912 Y124.598 E.12393
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07928
G1 X142.04 Y122.41 E.14073
G1 X142.04 Y124.99 E.07928
G1 X137.52 Y124.99 E.13889
; WIPE_START
G1 F12000
M204 S10000
G1 X137.474 Y122.991 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.463 Y123.7 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.61758
G1 F1200
G1 X141.037 Y123.7 E.12056
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11485.052
G1 X139.037 Y123.7 E-.76
; WIPE_END
M73 P88 R1
G1 E-.04 F1800
; layer num/total_layer_count: 20/45
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
G17
G3 Z4.2 I1.217 J0 P1  F30000
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
G1 X138.259 Y124.191
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X138.259 Y123.209 E.03257
G1 X141.241 Y123.209 E.09891
G1 X141.241 Y124.191 E.03257
G1 X138.319 Y124.191 E.09692
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05957
G1 X141.648 Y122.802 E.12592
G1 X141.648 Y124.598 E.05957
G1 X137.912 Y124.598 E.12393
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07928
G1 X142.04 Y122.41 E.14073
G1 X142.04 Y124.99 E.07928
G1 X137.52 Y124.99 E.13889
; WIPE_START
G1 F12000
M204 S10000
G1 X137.474 Y122.991 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.463 Y123.7 Z4.4 F30000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.61758
G1 F1200
G1 X141.037 Y123.7 E.12056
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11485.052
G1 X139.037 Y123.7 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/45
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
G17
G3 Z4.4 I1.217 J0 P1  F30000
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
G1 X138.259 Y124.191
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X138.259 Y123.209 E.03257
G1 X141.241 Y123.209 E.09891
G1 X141.241 Y124.191 E.03257
G1 X138.319 Y124.191 E.09692
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05957
G1 X141.648 Y122.802 E.12592
G1 X141.648 Y124.598 E.05957
G1 X137.912 Y124.598 E.12393
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07928
G1 X142.04 Y122.41 E.14073
G1 X142.04 Y124.99 E.07928
G1 X137.52 Y124.99 E.13889
; WIPE_START
G1 F12000
M204 S10000
G1 X137.474 Y122.991 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.463 Y123.7 Z4.6 F30000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.61758
G1 F1200
G1 X141.037 Y123.7 E.12056
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11485.052
G1 X139.037 Y123.7 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/45
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
G17
G3 Z4.6 I1.217 J0 P1  F30000
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
G1 X138.259 Y124.191
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X138.259 Y123.209 E.03257
G1 X141.241 Y123.209 E.09891
G1 X141.241 Y124.191 E.03257
G1 X138.319 Y124.191 E.09692
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05957
G1 X141.648 Y122.802 E.12592
G1 X141.648 Y124.598 E.05957
G1 X137.912 Y124.598 E.12393
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07928
G1 X142.04 Y122.41 E.14073
G1 X142.04 Y124.99 E.07928
G1 X137.52 Y124.99 E.13889
; WIPE_START
G1 F12000
M204 S10000
G1 X137.474 Y122.991 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.463 Y123.7 Z4.8 F30000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.61758
G1 F1200
G1 X141.037 Y123.7 E.12056
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11485.052
G1 X139.037 Y123.7 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/45
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
G17
M73 P89 R1
G3 Z4.8 I1.217 J0 P1  F30000
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
G1 X138.259 Y124.191
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X138.259 Y123.209 E.03257
G1 X141.241 Y123.209 E.09891
G1 X141.241 Y124.191 E.03257
G1 X138.319 Y124.191 E.09692
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05957
G1 X141.648 Y122.802 E.12592
G1 X141.648 Y124.598 E.05957
G1 X137.912 Y124.598 E.12393
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07928
G1 X142.04 Y122.41 E.14073
G1 X142.04 Y124.99 E.07928
G1 X137.52 Y124.99 E.13889
; WIPE_START
G1 F12000
M204 S10000
G1 X137.474 Y122.991 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.463 Y123.7 Z5 F30000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.61758
G1 F1200
G1 X141.037 Y123.7 E.12056
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11485.052
G1 X139.037 Y123.7 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/45
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
G17
G3 Z5 I1.217 J0 P1  F30000
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
G1 X138.259 Y124.191
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X138.259 Y123.209 E.03257
G1 X141.241 Y123.209 E.09891
G1 X141.241 Y124.191 E.03257
G1 X138.319 Y124.191 E.09692
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05957
G1 X141.648 Y122.802 E.12592
G1 X141.648 Y124.598 E.05957
G1 X137.912 Y124.598 E.12393
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07928
G1 X142.04 Y122.41 E.14073
G1 X142.04 Y124.99 E.07928
G1 X137.52 Y124.99 E.13889
; WIPE_START
G1 F12000
M204 S10000
G1 X137.474 Y122.991 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.463 Y123.7 Z5.2 F30000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.61758
G1 F1200
G1 X141.037 Y123.7 E.12056
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11485.052
G1 X139.037 Y123.7 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/45
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
G17
G3 Z5.2 I1.217 J0 P1  F30000
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
G1 X138.259 Y124.191
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X138.259 Y123.209 E.03257
G1 X141.241 Y123.209 E.09891
G1 X141.241 Y124.191 E.03257
G1 X138.319 Y124.191 E.09692
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05957
G1 X141.648 Y122.802 E.12592
G1 X141.648 Y124.598 E.05957
G1 X137.912 Y124.598 E.12393
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07928
G1 X142.04 Y122.41 E.14073
G1 X142.04 Y124.99 E.07928
G1 X137.52 Y124.99 E.13889
; WIPE_START
G1 F12000
M204 S10000
G1 X137.474 Y122.991 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.463 Y123.7 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.61758
G1 F1200
G1 X141.037 Y123.7 E.12056
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11485.052
G1 X139.037 Y123.7 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/45
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
G17
G3 Z5.4 I1.217 J0 P1  F30000
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
M73 P90 R1
G1 X138.259 Y124.191
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X138.259 Y123.209 E.03257
G1 X141.241 Y123.209 E.09891
G1 X141.241 Y124.191 E.03257
G1 X138.319 Y124.191 E.09692
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05957
G1 X141.648 Y122.802 E.12592
G1 X141.648 Y124.598 E.05957
G1 X137.912 Y124.598 E.12393
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07928
G1 X142.04 Y122.41 E.14073
G1 X142.04 Y124.99 E.07928
G1 X137.52 Y124.99 E.13889
; WIPE_START
G1 F12000
M204 S10000
G1 X137.474 Y122.991 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.463 Y123.7 Z5.6 F30000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.61758
G1 F1200
G1 X141.037 Y123.7 E.12056
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11485.052
G1 X139.037 Y123.7 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/45
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
G17
G3 Z5.6 I1.217 J0 P1  F30000
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
G1 X138.259 Y124.191
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X138.259 Y123.209 E.03257
G1 X141.241 Y123.209 E.09891
G1 X141.241 Y124.191 E.03257
G1 X138.319 Y124.191 E.09692
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05957
G1 X141.648 Y122.802 E.12592
G1 X141.648 Y124.598 E.05957
G1 X137.912 Y124.598 E.12393
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07928
G1 X142.04 Y122.41 E.14073
G1 X142.04 Y124.99 E.07928
G1 X137.52 Y124.99 E.13889
; WIPE_START
G1 F12000
M204 S10000
G1 X137.474 Y122.991 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.463 Y123.7 Z5.8 F30000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.61758
G1 F1200
G1 X141.037 Y123.7 E.12056
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11485.052
G1 X139.037 Y123.7 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/45
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
G17
G3 Z5.8 I1.217 J0 P1  F30000
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
G1 X138.259 Y124.191
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X138.259 Y123.209 E.03257
G1 X141.241 Y123.209 E.09891
G1 X141.241 Y124.191 E.03257
G1 X138.319 Y124.191 E.09692
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05957
G1 X141.648 Y122.802 E.12592
G1 X141.648 Y124.598 E.05957
G1 X137.912 Y124.598 E.12393
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07928
G1 X142.04 Y122.41 E.14073
M73 P90 R0
G1 X142.04 Y124.99 E.07928
G1 X137.52 Y124.99 E.13889
; WIPE_START
G1 F12000
M204 S10000
G1 X137.474 Y122.991 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.463 Y123.7 Z6 F30000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.61758
G1 F1200
G1 X141.037 Y123.7 E.12056
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11485.052
G1 X139.037 Y123.7 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/45
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
G17
G3 Z6 I1.217 J0 P1  F30000
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
M73 P91 R0
G1 X138.259 Y124.191
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X138.259 Y123.209 E.03257
G1 X141.241 Y123.209 E.09891
G1 X141.241 Y124.191 E.03257
G1 X138.319 Y124.191 E.09692
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05957
G1 X141.648 Y122.802 E.12592
G1 X141.648 Y124.598 E.05957
G1 X137.912 Y124.598 E.12393
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07928
G1 X142.04 Y122.41 E.14073
G1 X142.04 Y124.99 E.07928
G1 X137.52 Y124.99 E.13889
; WIPE_START
G1 F12000
M204 S10000
G1 X137.474 Y122.991 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.463 Y123.7 Z6.2 F30000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.61758
G1 F1200
G1 X141.037 Y123.7 E.12056
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11485.052
G1 X139.037 Y123.7 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/45
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
G17
G3 Z6.2 I1.217 J0 P1  F30000
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
G1 X138.259 Y124.191
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X138.259 Y123.209 E.03257
G1 X141.241 Y123.209 E.09891
G1 X141.241 Y124.191 E.03257
G1 X138.319 Y124.191 E.09692
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05957
G1 X141.648 Y122.802 E.12592
G1 X141.648 Y124.598 E.05957
G1 X137.912 Y124.598 E.12393
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07928
G1 X142.04 Y122.41 E.14073
G1 X142.04 Y124.99 E.07928
G1 X137.52 Y124.99 E.13889
; WIPE_START
G1 F12000
M204 S10000
G1 X137.474 Y122.991 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.463 Y123.7 Z6.4 F30000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.61758
G1 F1200
G1 X141.037 Y123.7 E.12056
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11485.052
G1 X139.037 Y123.7 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/45
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
G17
G3 Z6.4 I1.217 J0 P1  F30000
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
G1 X138.259 Y124.191
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X138.259 Y123.209 E.03257
G1 X141.241 Y123.209 E.09891
G1 X141.241 Y124.191 E.03257
G1 X138.319 Y124.191 E.09692
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05957
G1 X141.648 Y122.802 E.12592
G1 X141.648 Y124.598 E.05957
G1 X137.912 Y124.598 E.12393
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07928
G1 X142.04 Y122.41 E.14073
G1 X142.04 Y124.99 E.07928
G1 X137.52 Y124.99 E.13889
; WIPE_START
G1 F12000
M204 S10000
G1 X137.474 Y122.991 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.463 Y123.7 Z6.6 F30000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.61758
G1 F1200
G1 X141.037 Y123.7 E.12056
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11485.052
G1 X139.037 Y123.7 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/45
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
G17
G3 Z6.6 I1.217 J0 P1  F30000
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
M73 P92 R0
G1 X138.259 Y124.191
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X138.259 Y123.209 E.03257
G1 X141.241 Y123.209 E.09891
G1 X141.241 Y124.191 E.03257
G1 X138.319 Y124.191 E.09692
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05957
G1 X141.648 Y122.802 E.12592
G1 X141.648 Y124.598 E.05957
G1 X137.912 Y124.598 E.12393
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07928
G1 X142.04 Y122.41 E.14073
G1 X142.04 Y124.99 E.07928
G1 X137.52 Y124.99 E.13889
; WIPE_START
G1 F12000
M204 S10000
G1 X137.474 Y122.991 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.463 Y123.7 Z6.8 F30000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.61758
G1 F1200
G1 X141.037 Y123.7 E.12056
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11485.052
G1 X139.037 Y123.7 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/45
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
G17
G3 Z6.8 I1.217 J0 P1  F30000
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
G1 X138.259 Y124.191
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X138.259 Y123.209 E.03257
G1 X141.241 Y123.209 E.09891
G1 X141.241 Y124.191 E.03257
G1 X138.319 Y124.191 E.09692
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05957
G1 X141.648 Y122.802 E.12592
G1 X141.648 Y124.598 E.05957
G1 X137.912 Y124.598 E.12393
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07928
G1 X142.04 Y122.41 E.14073
G1 X142.04 Y124.99 E.07928
G1 X137.52 Y124.99 E.13889
; WIPE_START
G1 F12000
M204 S10000
G1 X137.474 Y122.991 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.463 Y123.7 Z7 F30000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.61758
G1 F1200
G1 X141.037 Y123.7 E.12056
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11485.052
G1 X139.037 Y123.7 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/45
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
G17
G3 Z7 I1.217 J0 P1  F30000
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
G1 X138.259 Y124.191
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X138.259 Y123.209 E.03257
G1 X141.241 Y123.209 E.09891
G1 X141.241 Y124.191 E.03257
G1 X138.319 Y124.191 E.09692
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05957
G1 X141.648 Y122.802 E.12592
G1 X141.648 Y124.598 E.05957
G1 X137.912 Y124.598 E.12393
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07928
G1 X142.04 Y122.41 E.14073
G1 X142.04 Y124.99 E.07928
G1 X137.52 Y124.99 E.13889
; WIPE_START
G1 F12000
M204 S10000
G1 X137.474 Y122.991 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.463 Y123.7 Z7.2 F30000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.61758
G1 F1200
G1 X141.037 Y123.7 E.12056
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11485.052
G1 X139.037 Y123.7 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/45
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
G17
G3 Z7.2 I1.217 J0 P1  F30000
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
G1 X138.259 Y124.191
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P93 R0
G1 F1200
G1 X138.259 Y123.209 E.03257
G1 X141.241 Y123.209 E.09891
G1 X141.241 Y124.191 E.03257
G1 X138.319 Y124.191 E.09692
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05957
G1 X141.648 Y122.802 E.12592
G1 X141.648 Y124.598 E.05957
G1 X137.912 Y124.598 E.12393
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07928
G1 X142.04 Y122.41 E.14073
G1 X142.04 Y124.99 E.07928
G1 X137.52 Y124.99 E.13889
; WIPE_START
G1 F12000
M204 S10000
G1 X137.474 Y122.991 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.463 Y123.7 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.61758
G1 F1200
G1 X141.037 Y123.7 E.12056
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11485.052
G1 X139.037 Y123.7 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/45
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
G17
G3 Z7.4 I1.217 J0 P1  F30000
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
G1 X138.259 Y124.191
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X138.259 Y123.209 E.03257
G1 X141.241 Y123.209 E.09891
G1 X141.241 Y124.191 E.03257
G1 X138.319 Y124.191 E.09692
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05957
G1 X141.648 Y122.802 E.12592
G1 X141.648 Y124.598 E.05957
G1 X137.912 Y124.598 E.12393
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07928
G1 X142.04 Y122.41 E.14073
G1 X142.04 Y124.99 E.07928
G1 X137.52 Y124.99 E.13889
; WIPE_START
G1 F12000
M204 S10000
G1 X137.474 Y122.991 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.463 Y123.7 Z7.6 F30000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.61758
G1 F1200
G1 X141.037 Y123.7 E.12056
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11485.052
G1 X139.037 Y123.7 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/45
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
G17
G3 Z7.6 I1.217 J0 P1  F30000
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
G1 X138.259 Y124.191
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X138.259 Y123.209 E.03257
G1 X141.241 Y123.209 E.09891
G1 X141.241 Y124.191 E.03257
G1 X138.319 Y124.191 E.09692
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05957
G1 X141.648 Y122.802 E.12592
G1 X141.648 Y124.598 E.05957
G1 X137.912 Y124.598 E.12393
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07928
G1 X142.04 Y122.41 E.14073
G1 X142.04 Y124.99 E.07928
G1 X137.52 Y124.99 E.13889
; WIPE_START
G1 F12000
M204 S10000
G1 X137.474 Y122.991 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.463 Y123.7 Z7.8 F30000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.61758
G1 F1200
G1 X141.037 Y123.7 E.12056
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11485.052
G1 X139.037 Y123.7 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/45
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
G17
G3 Z7.8 I1.217 J0 P1  F30000
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
G1 X138.259 Y124.191
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M73 P94 R0
G1 X138.259 Y123.209 E.03257
G1 X141.241 Y123.209 E.09891
G1 X141.241 Y124.191 E.03257
G1 X138.319 Y124.191 E.09692
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05957
G1 X141.648 Y122.802 E.12592
G1 X141.648 Y124.598 E.05957
G1 X137.912 Y124.598 E.12393
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07928
G1 X142.04 Y122.41 E.14073
G1 X142.04 Y124.99 E.07928
G1 X137.52 Y124.99 E.13889
; WIPE_START
G1 F12000
M204 S10000
G1 X137.474 Y122.991 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.463 Y123.7 Z8 F30000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.61758
G1 F1200
G1 X141.037 Y123.7 E.12056
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11485.052
G1 X139.037 Y123.7 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/45
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
G17
G3 Z8 I1.217 J0 P1  F30000
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
G1 X138.259 Y124.191
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X138.259 Y123.209 E.03257
G1 X141.241 Y123.209 E.09891
G1 X141.241 Y124.191 E.03257
G1 X138.319 Y124.191 E.09692
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05957
G1 X141.648 Y122.802 E.12592
G1 X141.648 Y124.598 E.05957
G1 X137.912 Y124.598 E.12393
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07928
G1 X142.04 Y122.41 E.14073
G1 X142.04 Y124.99 E.07928
G1 X137.52 Y124.99 E.13889
; WIPE_START
G1 F12000
M204 S10000
G1 X137.474 Y122.991 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.463 Y123.7 Z8.2 F30000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.61758
G1 F1200
G1 X141.037 Y123.7 E.12056
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11485.052
G1 X139.037 Y123.7 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/45
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
G17
G3 Z8.2 I1.217 J0 P1  F30000
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
G1 X138.259 Y124.191
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X138.259 Y123.209 E.03257
G1 X141.241 Y123.209 E.09891
G1 X141.241 Y124.191 E.03257
G1 X138.319 Y124.191 E.09692
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05957
G1 X141.648 Y122.802 E.12592
G1 X141.648 Y124.598 E.05957
G1 X137.912 Y124.598 E.12393
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07928
G1 X142.04 Y122.41 E.14073
G1 X142.04 Y124.99 E.07928
G1 X137.52 Y124.99 E.13889
; WIPE_START
G1 F12000
M204 S10000
G1 X137.474 Y122.991 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.463 Y123.7 Z8.4 F30000
G1 Z8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.61758
G1 F1200
G1 X141.037 Y123.7 E.12056
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11485.052
G1 X139.037 Y123.7 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/45
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
G17
G3 Z8.4 I1.217 J0 P1  F30000
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
G1 X138.259 Y124.191
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M73 P95 R0
G1 X138.259 Y123.209 E.03257
G1 X141.241 Y123.209 E.09891
G1 X141.241 Y124.191 E.03257
G1 X138.319 Y124.191 E.09692
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05957
G1 X141.648 Y122.802 E.12592
G1 X141.648 Y124.598 E.05957
G1 X137.912 Y124.598 E.12393
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07928
G1 X142.04 Y122.41 E.14073
G1 X142.04 Y124.99 E.07928
G1 X137.52 Y124.99 E.13889
; WIPE_START
G1 F12000
M204 S10000
G1 X137.474 Y122.991 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.463 Y123.7 Z8.6 F30000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.61758
G1 F1200
G1 X141.037 Y123.7 E.12056
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11485.052
G1 X139.037 Y123.7 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/45
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
G17
G3 Z8.6 I1.217 J0 P1  F30000
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
G1 X138.259 Y124.191
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X138.259 Y123.209 E.03257
G1 X141.241 Y123.209 E.09891
G1 X141.241 Y124.191 E.03257
G1 X138.319 Y124.191 E.09692
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05957
G1 X141.648 Y122.802 E.12592
G1 X141.648 Y124.598 E.05957
G1 X137.912 Y124.598 E.12393
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07928
G1 X142.04 Y122.41 E.14073
G1 X142.04 Y124.99 E.07928
G1 X137.52 Y124.99 E.13889
; WIPE_START
G1 F12000
M204 S10000
G1 X137.474 Y122.991 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.463 Y123.7 Z8.8 F30000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.61758
G1 F1200
G1 X141.037 Y123.7 E.12056
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11485.052
G1 X139.037 Y123.7 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/45
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
G17
G3 Z8.8 I1.217 J0 P1  F30000
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
G1 X138.259 Y124.191
M73 P96 R0
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X138.259 Y123.209 E.03257
G1 X141.241 Y123.209 E.09891
G1 X141.241 Y124.191 E.03257
G1 X138.319 Y124.191 E.09692
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05957
G1 X141.648 Y122.802 E.12592
G1 X141.648 Y124.598 E.05957
G1 X137.912 Y124.598 E.12393
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07928
G1 X142.04 Y122.41 E.14073
G1 X142.04 Y124.99 E.07928
G1 X137.52 Y124.99 E.13889
; WIPE_START
G1 F12000
M204 S10000
G1 X137.474 Y122.991 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.463 Y123.7 Z9 F30000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.61758
G1 F1200
G1 X141.037 Y123.7 E.12056
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11485.052
G1 X139.037 Y123.7 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/45
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
G17
G3 Z9 I1.217 J0 P1  F30000
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
G1 X138.259 Y124.191
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X138.259 Y123.209 E.03257
G1 X141.241 Y123.209 E.09891
G1 X141.241 Y124.191 E.03257
G1 X138.319 Y124.191 E.09692
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05957
G1 X141.648 Y122.802 E.12592
G1 X141.648 Y124.598 E.05957
G1 X137.912 Y124.598 E.12393
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07928
G1 X142.04 Y122.41 E.14073
G1 X142.04 Y124.99 E.07928
G1 X137.52 Y124.99 E.13889
; WIPE_START
G1 F12000
M204 S10000
G1 X137.474 Y122.991 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.463 Y123.7 Z9.2 F30000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.61758
G1 F1200
G1 X141.037 Y123.7 E.12056
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11485.052
G1 X139.037 Y123.7 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/45
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
G17
G3 Z9.2 I1.217 J0 P1  F30000
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
G1 X137.46 Y124.99
G1 Z9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07928
G1 X142.04 Y122.41 E.14073
G1 X142.04 Y124.99 E.07928
G1 X137.52 Y124.99 E.13889
; WIPE_START
G1 F12000
M204 S10000
G1 X137.474 Y122.991 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.833 Y123.035 Z9.4 F30000
G1 Z9
G1 E.8 F1800
; FEATURE: Top surface
G1 F1200
M204 S2000
G1 X141.415 Y122.617 E.01815
G1 X140.882 Y122.617
G1 X141.833 Y123.568 E.04132
G1 X141.833 Y124.102
G1 X140.348 Y122.617 E.0645
G1 X139.815 Y122.617
G1 X141.833 Y124.635 E.08767
G1 X141.447 Y124.783
G1 X139.282 Y122.617 E.09409
G1 X138.749 Y122.617
G1 X140.914 Y124.783 E.09409
G1 X140.381 Y124.783
G1 X138.215 Y122.617 E.09409
G1 X137.682 Y122.617
M73 P97 R0
G1 X139.847 Y124.783 E.09409
G1 X139.314 Y124.783
G1 X137.667 Y123.136 E.07156
G1 X137.667 Y123.669
G1 X138.781 Y124.783 E.04839
G1 X138.248 Y124.783
G1 X137.667 Y124.202 E.02521
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F12000
M204 S10000
G1 X138.248 Y124.783 E-.31181
G1 X138.781 Y124.783 E-.20264
G1 X138.324 Y124.326 E-.24556
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
G1 Z9.5 F900 ; lower z a little
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

    G1 Z109 F600
    G1 Z107

M400 P100
M17 R ; restore z current

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M73 P100 R0
; EXECUTABLE_BLOCK_END
