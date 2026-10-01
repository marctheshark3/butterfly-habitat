; HEADER_BLOCK_START
; BambuStudio 02.04.00.70
; model printing time: 1h 9m 24s; total estimated time: 1h 16m 37s
; total layer number: 15
; total filament length [mm] : 13907.86
; total filament volume [cm^3] : 33452.33
; total filament weight [g] : 42.48
; filament_density: 1.27
; filament_diameter: 1.75
; max_z_height: 3.00
; filament: 1
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0
; additional_cooling_fan_speed = 0
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
; close_fan_the_first_x_layers = 3
; compatible_printers_condition = 
; complete_print_exhaust_fan_speed = 70
; cool_plate_temp = 0
; cool_plate_temp_initial_layer = 0
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
; eng_plate_temp = 70
; eng_plate_temp_initial_layer = 70
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
; fan_cooling_layer_time = 30
; fan_direction = left
; fan_max_speed = 90
; fan_min_speed = 40
; filament_adaptive_volumetric_speed = 0
; filament_adhesiveness_category = 300
; filament_change_length = 10
; filament_change_length_nc = 10
; filament_colour = #00AE42
; filament_cooling_before_tower = 10
; filament_cost = 30
; filament_density = 1.27
; filament_diameter = 1.75
; filament_end_gcode = "; filament end gcode \n\n"
; filament_extruder_variant = "Direct Drive Standard"
; filament_flow_ratio = 0.95
; filament_flush_temp = 0
; filament_flush_volumetric_speed = 0
; filament_ids = GFG99
; filament_is_support = 0
; filament_map = 1
; filament_map_2 = 0
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 12
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
; filament_scarf_gap = 0%
; filament_scarf_height = 10%
; filament_scarf_length = 10
; filament_scarf_seam_type = none
; filament_self_index = 1
; filament_settings_id = "Generic PETG"
; filament_shrink = 100%
; filament_soluble = 0
; filament_start_gcode = "; filament start gcode\n{if (bed_temperature[current_extruder] >80)||(bed_temperature_initial_layer[current_extruder] >80)}M106 P3 S255\n{elsif (bed_temperature[current_extruder] >60)||(bed_temperature_initial_layer[current_extruder] >60)}M106 P3 S180\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_type = PETG
; filament_velocity_adaptation_factor = 1
; filament_vendor = Generic
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
; flush_volumes_matrix = 0,280,280,280,280,0,280,280,280,280,0,280,280,280,280,0
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
; hot_plate_temp = 70
; hot_plate_temp_initial_layer = 70
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 10
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
; nozzle_temperature = 255
; nozzle_temperature_initial_layer = 255
; nozzle_temperature_range_high = 270
; nozzle_temperature_range_low = 220
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
; overhang_fan_speed = 90
; overhang_fan_threshold = 10%
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
; print_settings_id = 0.20mm Standard @BBL X1C
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
; slow_down_layer_time = 12
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
; supertack_plate_temp = 70
; supertack_plate_temp_initial_layer = 70
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
; temperature_vitrification = 70
; template_custom_gcode = 
; textured_plate_temp = 70
; textured_plate_temp_initial_layer = 70
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
M73 P0 R76
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
M140 S70 ;set bed temp
M190 S70 ;wait for bed temp



;=============turn on fans to prevent PLA jamming=================

M106 P2 S100 ; turn on big fan ,to cool down toolhead

;===== prepare print temperature and material ==========
M104 S255 ;set extruder temp
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
    M109 S255
    G1 X120 F12000

    G1 X20 Y50 F12000
    G1 Y-3
    T0
    G1 X54 F12000
    G1 Y265
    M400
M621 S0A
M620.1 E F299.339 T270


M412 S1 ; ===turn on filament runout detection===

M109 S250 ;set nozzle to common flush temp
M106 P1 S0
G92 E0
M73 P1 R75
G1 E50 F200
M400
M104 S255
G92 E0
M73 P7 R70
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S235 ; drop nozzle temp, make filament shink a bit
G92 E0
M73 P8 R70
G1 E-0.5 F300

G1 X70 F9000
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
M109 S235
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
    G29 A X23.3293 Y29.4543 I209.341 J197.091
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

M106 P2 S100 ; turn on big fan ,to cool down toolhead


M104 S255 ; set extrude temp earlier, to reduce wait time

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
M73 P8 R69
G1 X230 Y15
G28 X ; re-home XY
;===== fmech mode fast check============================


;===== nozzle load line ===============================
M975 S1
G90
M83
T1000
G1 X18.0 Y1.0 Z0.8 F18000;Move to start position
M109 S255
G1 Z0.2
G0 E2 F300
G0 X240 E15 F4800
G0 Y11 E0.700 F1200
G0 X239.5
G0 E0.2
G0 Y1.5 E0.700
G0 X18 E15 F4800
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
M106 P3 S180


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
G1 X25.419 Y28.511
G1 Z.2
G1 E.8 F1800
; FEATURE: Brim
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X25.964 Y28.178 E.02305
G1 X26.802 Y27.852 E.03248
G1 X27.429 Y27.721 E.02313
G1 X28.008 Y27.683 E.02093
G1 X227.992 Y27.683 E7.22063
G1 X228.64 Y27.731 E.02347
G1 X229.263 Y27.871 E.02304
G1 X230.106 Y28.228 E.03306
G1 X230.724 Y28.625 E.02653
G1 X231.203 Y29.051 E.02313
G1 X231.614 Y29.544 E.02317
G1 X231.947 Y30.089 E.02305
M73 P9 R69
G1 X232.273 Y30.927 E.03248
G1 X232.404 Y31.554 E.02313
G1 X232.442 Y32.133 E.02094
G1 X232.442 Y219.866 E6.77832
G1 X232.394 Y220.515 E.02348
G1 X232.254 Y221.138 E.02304
G1 X231.897 Y221.981 E.03306
G1 X231.5 Y222.599 E.02653
G1 X231.074 Y223.078 E.02313
G1 X230.581 Y223.489 E.02317
G1 X230.036 Y223.822 E.02305
G1 X229.198 Y224.148 E.03248
G1 X228.571 Y224.279 E.02313
G1 X227.992 Y224.317 E.02094
G1 X28.009 Y224.317 E7.22062
G1 X27.36 Y224.269 E.02348
G1 X26.737 Y224.129 E.02304
G1 X25.894 Y223.772 E.03306
G1 X25.276 Y223.375 E.02653
G1 X24.797 Y222.949 E.02313
G1 X24.386 Y222.456 E.02317
G1 X24.053 Y221.911 E.02305
G1 X23.727 Y221.073 E.03248
G1 X23.596 Y220.446 E.02313
G1 X23.558 Y219.867 E.02093
G1 X23.558 Y32.133 E6.77833
G1 X23.606 Y31.485 E.02347
G1 X23.746 Y30.862 E.02304
G1 X24.103 Y30.019 E.03306
G1 X24.5 Y29.401 E.02653
G1 X24.926 Y28.922 E.02313
G1 X25.372 Y28.549 E.02101
M204 S6000
G1 X25.665 Y28.902 F30000
G1 F3000
M204 S500
G1 X25.694 Y28.878 E.00135
G1 X26.178 Y28.585 E.02043
G1 X26.944 Y28.29 E.02962
G1 X27.482 Y28.177 E.01985
G1 X28.027 Y28.14 E.01974
G1 X227.98 Y28.14 E7.21949
G1 X228.562 Y28.183 E.02109
G1 X229.11 Y28.305 E.02026
G1 X229.881 Y28.63 E.0302
G1 X230.438 Y28.985 E.02385
G1 X230.866 Y29.363 E.02063
G1 X231.247 Y29.819 E.02145
G1 X231.54 Y30.303 E.02043
G1 X231.835 Y31.069 E.02962
G1 X231.948 Y31.607 E.01985
G1 X231.985 Y32.152 E.01975
G1 X231.985 Y219.844 E6.77681
G1 X231.942 Y220.437 E.02146
G1 X231.82 Y220.985 E.02026
G1 X231.495 Y221.756 E.0302
G1 X231.14 Y222.313 E.02385
G1 X230.747 Y222.755 E.02136
G1 X230.306 Y223.122 E.02072
G1 X229.822 Y223.415 E.02043
G1 X229.056 Y223.71 E.02962
G1 X228.518 Y223.823 E.01985
G1 X227.973 Y223.86 E.01975
G1 X28.031 Y223.86 E7.21911
G1 X27.438 Y223.817 E.02146
G1 X26.89 Y223.694 E.02026
G1 X26.119 Y223.37 E.0302
G1 X25.562 Y223.015 E.02385
G1 X25.12 Y222.622 E.02136
G1 X24.753 Y222.181 E.02072
G1 X24.46 Y221.697 E.02043
G1 X24.165 Y220.931 E.02962
G1 X24.052 Y220.393 E.01985
G1 X24.015 Y219.848 E.01974
G1 X24.015 Y32.155 E6.77682
G1 X24.058 Y31.563 E.02146
G1 X24.181 Y31.015 E.02026
G1 X24.505 Y30.244 E.0302
G1 X24.86 Y29.687 E.02385
G1 X25.253 Y29.245 E.02136
G1 X25.619 Y28.94 E.01721
M204 S6000
G1 X25.911 Y29.294 F30000
G1 F3000
M204 S500
G1 X25.969 Y29.246 E.0027
G1 X26.392 Y28.993 E.01781
G1 X27.085 Y28.727 E.02679
G1 X27.554 Y28.63 E.0173
G1 X28.047 Y28.597 E.01786
G1 X227.958 Y28.597 E7.21796
G1 X228.485 Y28.636 E.01911
G1 X228.982 Y28.747 E.01837
G1 X229.678 Y29.042 E.02729
G1 X230.153 Y29.345 E.02034
G1 X230.53 Y29.676 E.01809
G1 X230.867 Y30.077 E.01894
G1 X231.132 Y30.517 E.01853
G1 X231.398 Y31.21 E.02679
G1 X231.495 Y31.679 E.0173
G1 X231.528 Y32.173 E.01787
G1 X231.528 Y219.823 E6.7753
G1 X231.489 Y220.36 E.01947
G1 X231.385 Y220.834 E.01749
G1 X231.094 Y221.532 E.02734
G1 X230.781 Y222.028 E.02115
G1 X230.421 Y222.432 E.01955
G1 X230.031 Y222.754 E.01823
G1 X229.608 Y223.007 E.01781
G1 X228.915 Y223.273 E.02679
G1 X228.446 Y223.37 E.0173
G1 X227.952 Y223.403 E.01787
G1 X28.052 Y223.403 E7.21759
G1 X27.515 Y223.364 E.01947
G1 X27.041 Y223.26 E.01749
G1 X26.343 Y222.969 E.02734
M73 P10 R68
G1 X25.847 Y222.656 E.02115
G1 X25.443 Y222.296 E.01955
G1 X25.121 Y221.906 E.01823
G1 X24.868 Y221.483 E.01781
G1 X24.602 Y220.79 E.02679
G1 X24.505 Y220.321 E.0173
G1 X24.472 Y219.828 E.01786
G1 X24.472 Y32.177 E6.77531
G1 X24.511 Y31.64 E.01946
G1 X24.615 Y31.166 E.01749
G1 X24.906 Y30.468 E.02734
G1 X25.219 Y29.972 E.02115
G1 X25.579 Y29.568 E.01955
G1 X25.865 Y29.332 E.01337
M204 S6000
G1 X26.155 Y29.687 F30000
G1 F3000
M204 S500
G1 X26.242 Y29.615 E.00405
G1 X26.604 Y29.401 E.01519
G1 X27.224 Y29.165 E.02398
G1 X27.625 Y29.084 E.01475
G1 X28.068 Y29.054 E.01602
G1 X227.936 Y29.054 E7.21645
G1 X228.408 Y29.089 E.0171
G1 X228.853 Y29.189 E.01647
G1 X229.474 Y29.454 E.02438
G1 X229.869 Y29.706 E.0169
G1 X230.194 Y29.989 E.01557
G1 X230.487 Y30.336 E.01639
G1 X230.724 Y30.73 E.0166
G1 X230.96 Y31.349 E.02395
G1 X231.041 Y31.75 E.01475
G1 X231.071 Y32.193 E.01602
G1 X231.071 Y219.801 E6.77379
G1 X231.036 Y220.285 E.0175
G1 X230.95 Y220.683 E.01473
G1 X230.691 Y221.31 E.02448
G1 X230.42 Y221.742 E.01842
G1 X230.095 Y222.109 E.0177
G1 X229.758 Y222.385 E.0157
G1 X229.396 Y222.599 E.01519
G1 X228.776 Y222.835 E.02398
G1 X228.375 Y222.916 E.01475
G1 X227.932 Y222.946 E.01602
G1 X28.074 Y222.946 E7.21609
G1 X27.59 Y222.911 E.0175
G1 X27.192 Y222.825 E.01473
G1 X26.565 Y222.566 E.02448
G1 X26.133 Y222.295 E.01842
G1 X25.766 Y221.97 E.0177
G1 X25.49 Y221.633 E.0157
G1 X25.276 Y221.271 E.01519
G1 X25.04 Y220.651 E.02398
G1 X24.959 Y220.25 E.01475
G1 X24.929 Y219.807 E.01602
G1 X24.929 Y32.199 E6.7738
G1 X24.964 Y31.715 E.0175
G1 X25.05 Y31.317 E.01473
G1 X25.309 Y30.69 E.02448
G1 X25.58 Y30.258 E.01842
G1 X25.905 Y29.891 E.0177
G1 X26.109 Y29.725 E.00949
M204 S6000
G1 X26.398 Y30.078 F30000
G1 F3000
M204 S500
G1 X26.497 Y29.998 E.00458
G1 X26.793 Y29.82 E.01247
G1 X27.342 Y29.609 E.02122
G1 X27.695 Y29.537 E.01302
G1 X28.087 Y29.511 E.0142
G1 X227.914 Y29.511 E7.21495
G1 X228.331 Y29.541 E.01507
G1 X228.723 Y29.631 E.01454
G1 X229.27 Y29.866 E.02148
G1 X229.586 Y30.067 E.01353
G1 X229.86 Y30.304 E.01307
G1 X230.12 Y30.612 E.01458
G1 X230.316 Y30.942 E.01384
G1 X230.522 Y31.488 E.02108
G1 X230.588 Y31.82 E.01222
G1 X230.614 Y32.212 E.0142
G1 X230.614 Y219.78 E6.7723
G1 X230.583 Y220.21 E.01558
G1 X230.514 Y220.535 E.01199
G1 X230.288 Y221.089 E.02163
G1 X230.059 Y221.458 E.01566
G1 X229.768 Y221.785 E.01581
G1 X229.503 Y222.002 E.01237
G1 X229.207 Y222.18 E.01247
G1 X228.658 Y222.391 E.02122
G1 X228.305 Y222.463 E.01302
G1 X227.913 Y222.489 E.0142
G1 X28.095 Y222.489 E7.2146
G1 X27.665 Y222.458 E.01558
G1 X27.34 Y222.389 E.01199
G1 X26.786 Y222.163 E.02163
G1 X26.417 Y221.934 E.01566
G1 X26.09 Y221.643 E.01581
G1 X25.873 Y221.378 E.01237
G1 X25.695 Y221.082 E.01247
G1 X25.484 Y220.533 E.02122
G1 X25.412 Y220.18 E.01302
G1 X25.386 Y219.788 E.0142
G1 X25.386 Y32.22 E6.77231
G1 X25.417 Y31.79 E.01557
G1 X25.486 Y31.465 E.01199
G1 X25.712 Y30.911 E.02163
G1 X25.941 Y30.542 E.01566
G1 X26.232 Y30.215 E.01581
G1 X26.352 Y30.116 E.00562
M204 S6000
G1 X26.658 Y30.486 F30000
G1 F3000
M204 S500
G1 X26.842 Y30.333 E.00861
G1 X27.185 Y30.148 E.01408
G1 X27.553 Y30.029 E.01396
G1 X28.036 Y29.968 E.0176
G1 X227.959 Y29.968 E7.21843
G1 X228.407 Y30.024 E.01629
G1 X228.858 Y30.165 E.01706
G1 X229.045 Y30.267 E.00769
G1 X229.436 Y30.554 E.01752
G1 X229.53 Y30.642 E.00465
G1 X229.825 Y31.019 E.01726
G1 X230.002 Y31.378 E.01446
G1 X230.116 Y31.776 E.01493
G1 X230.157 Y32.16 E.01395
G1 X230.157 Y219.843 E6.7765
G1 X230.113 Y220.227 E.01394
G1 X229.966 Y220.71 E.01826
G1 X229.81 Y221.006 E.01206
G1 X229.561 Y221.326 E.01462
G1 X229.203 Y221.636 E.01712
G1 X228.839 Y221.839 E.01502
G1 X228.453 Y221.969 E.01473
G1 X227.964 Y222.032 E.0178
G1 X28.032 Y222.032 E7.21874
G1 X27.648 Y221.988 E.01394
G1 X27.165 Y221.841 E.01826
G1 X26.869 Y221.685 E.01206
G1 X26.549 Y221.436 E.01462
G1 X26.239 Y221.078 E.01712
G1 X26.036 Y220.714 E.01503
G1 X25.906 Y220.328 E.01473
M73 P11 R68
G1 X25.843 Y219.839 E.01779
G1 X25.843 Y32.166 E6.77612
G1 X25.899 Y31.717 E.01634
G1 X26.003 Y31.358 E.01348
G1 X26.198 Y30.987 E.01514
G1 X26.48 Y30.633 E.01633
G1 X26.612 Y30.524 E.00618
M204 S6000
G1 X26.888 Y30.877 F30000
G1 F3000
M204 S500
G1 X27.131 Y30.687 E.01113
G1 X27.398 Y30.552 E.01082
G1 X27.692 Y30.464 E.01108
G1 X28.027 Y30.425 E.01218
G1 X227.968 Y30.425 E7.21905
G1 X228.355 Y30.478 E.01413
G1 X228.645 Y30.568 E.01093
G1 X228.767 Y30.63 E.00497
G1 X229.173 Y30.928 E.01816
G1 X229.415 Y31.221 E.01372
G1 X229.563 Y31.505 E.01158
G1 X229.661 Y31.818 E.01184
G1 X229.7 Y32.152 E.01216
G1 X229.7 Y219.851 E6.77704
G1 X229.659 Y220.181 E.01203
G1 X229.529 Y220.577 E.01505
G1 X229.409 Y220.787 E.00869
G1 X229.199 Y221.047 E.01209
G1 X228.904 Y221.29 E.01379
G1 X228.62 Y221.438 E.01158
G1 X228.307 Y221.536 E.01184
G1 X227.973 Y221.575 E.01216
G1 X28.024 Y221.575 E7.21934
G1 X27.694 Y221.534 E.01203
G1 X27.298 Y221.404 E.01505
M73 P11 R67
G1 X27.088 Y221.284 E.00869
G1 X26.828 Y221.074 E.01209
G1 X26.585 Y220.779 E.01379
G1 X26.437 Y220.495 E.01158
G1 X26.339 Y220.182 E.01184
G1 X26.3 Y219.848 E.01215
G1 X26.3 Y32.157 E6.77675
G1 X26.353 Y31.77 E.01413
G1 X26.443 Y31.483 E.01082
G1 X26.6 Y31.203 E.01162
G1 X26.839 Y30.916 E.01348
G1 X26.841 Y30.914 E.0001
M204 S6000
G1 X27.192 Y31.205 F30000
G1 F3000
M204 S500
G1 X27.196 Y31.201 E.00023
G1 X27.403 Y31.054 E.00914
G1 X27.6 Y30.962 E.00786
G1 X27.742 Y30.919 E.00535
G1 X28.019 Y30.882 E.01012
G1 X227.977 Y30.882 E7.21967
G1 X228.295 Y30.931 E.01161
G1 X228.503 Y31.003 E.00794
G1 X228.827 Y31.226 E.01422
G1 X229.003 Y31.42 E.00946
G1 X229.164 Y31.728 E.01254
G1 X229.206 Y31.867 E.00524
G1 X229.243 Y32.144 E.01012
G1 X229.243 Y219.859 E6.77763
G1 X229.224 Y220.041 E.00658
G1 X229.13 Y220.355 E.01184
G1 X229.051 Y220.504 E.00609
G1 X228.899 Y220.703 E.00905
G1 X228.705 Y220.878 E.00942
G1 X228.397 Y221.039 E.01254
G1 X228.258 Y221.081 E.00524
G1 X227.981 Y221.118 E.01012
G1 X28.016 Y221.118 E7.21993
G1 X27.834 Y221.099 E.00658
G1 X27.52 Y221.005 E.01184
G1 X27.371 Y220.926 E.00609
G1 X27.172 Y220.774 E.00905
G1 X26.997 Y220.58 E.00942
G1 X26.836 Y220.272 E.01255
G1 X26.794 Y220.133 E.00524
G1 X26.757 Y219.856 E.01012
G1 X26.757 Y32.148 E6.77737
G1 X26.806 Y31.83 E.01161
G1 X26.878 Y31.622 E.00794
G1 X26.944 Y31.504 E.00489
G1 X27.154 Y31.252 E.01185
M204 S6000
G1 X27.473 Y31.564 F30000
G1 F3000
M204 S500
G1 X27.586 Y31.473 E.00525
G1 X27.803 Y31.371 E.00865
G1 X28.011 Y31.339 E.00758
G1 X227.988 Y31.339 E7.22037
G1 X228.221 Y31.382 E.00857
G1 X228.339 Y31.429 E.0046
G1 X228.561 Y31.598 E.01005
G1 X228.652 Y31.711 E.00525
G1 X228.754 Y31.928 E.00865
G1 X228.786 Y32.136 E.00758
G1 X228.786 Y219.866 E6.77821
G1 X228.77 Y219.993 E.0046
G1 X228.694 Y220.218 E.00857
G1 X228.527 Y220.436 E.00992
G1 X228.414 Y220.527 E.00525
G1 X228.197 Y220.629 E.00865
G1 X227.989 Y220.661 E.00758
G1 X28.009 Y220.661 E7.22051
G1 X27.882 Y220.645 E.0046
G1 X27.657 Y220.569 E.00857
G1 X27.439 Y220.402 E.00992
G1 X27.348 Y220.289 E.00525
G1 X27.246 Y220.072 E.00865
G1 X27.214 Y219.864 E.00758
G1 X27.214 Y32.137 E6.77807
G1 X27.257 Y31.904 E.00857
M73 P12 R67
G1 X27.304 Y31.786 E.0046
G1 X27.436 Y31.612 E.00789
M204 S6000
G1 X27.747 Y31.93 F30000
G1 F3000
M204 S500
G1 X27.884 Y31.821 E.00632
G1 X28 Y31.796 E.00429
G1 X228 Y31.796 E7.2212
G1 X228.111 Y31.825 E.00413
G1 X228.195 Y31.872 E.0035
G1 X228.304 Y32.009 E.00632
G1 X228.329 Y32.125 E.00429
G1 X228.329 Y219.875 E6.7789
G1 X228.3 Y219.986 E.00413
G1 X228.253 Y220.07 E.0035
G1 X228.116 Y220.179 E.00632
G1 X228 Y220.204 E.00429
G1 X28 Y220.204 E7.2212
G1 X27.889 Y220.175 E.00413
G1 X27.805 Y220.128 E.0035
G1 X27.696 Y219.991 E.00632
G1 X27.671 Y219.875 E.00429
G1 X27.671 Y32.125 E6.7789
G1 X27.7 Y32.014 E.00413
G1 X27.718 Y31.982 E.00133
; WIPE_START
G1 X27.884 Y31.821 E-.08797
G1 X28 Y31.796 E-.04514
G1 X29.65 Y31.796 E-.6269
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X35.188 Y37.048 Z.6 F30000
G1 X227.6 Y219.475 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X28.4 Y219.475 E7.19232
G1 X28.4 Y32.525 E6.75002
G1 X227.6 Y32.525 E7.19232
G1 X227.6 Y219.415 E6.74785
M204 S6000
G1 X227.143 Y219.018 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X28.857 Y219.018 E7.15931
G1 X28.857 Y32.982 E6.71701
G1 X227.143 Y32.982 E7.15931
G1 X227.143 Y218.958 E6.71485
M204 S6000
G1 X226.686 Y218.561 F30000
G1 F3000
M204 S500
G1 X29.314 Y218.561 E7.12631
G1 X29.314 Y33.439 E6.68401
G1 X226.686 Y33.439 E7.12631
G1 X226.686 Y218.501 E6.68184
M204 S6000
G1 X226.229 Y218.104 F30000
G1 F3000
M204 S500
G1 X29.771 Y218.104 E7.0933
G1 X29.771 Y33.896 E6.651
G1 X226.229 Y33.896 E7.0933
G1 X226.229 Y218.044 E6.64884
; WIPE_START
G1 X224.229 Y218.044 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
M73 P12 R66
G1 X216.613 Y217.534 Z.6 F30000
G1 X39.74 Y205.691 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X39.945 Y205.675 E.00741
G3 X39.681 Y205.698 I.058 J2.199 E.4894
M204 S6000
G1 X39.199 Y205.342 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X39.41 Y205.284 E.00792
G3 X39.677 Y205.237 I.594 J2.59 E.00977
G1 X39.934 Y205.218 E.0093
G3 X39.142 Y205.361 I.07 J2.656 E.57361
M204 S6000
G1 X38.636 Y205.077 F30000
G1 F3000
M204 S500
G1 X38.719 Y205.037 E.00333
G3 X39.62 Y204.783 I1.285 J2.837 E.03394
G1 X39.922 Y204.76 E.01093
G3 X38.443 Y205.179 I.082 J3.113 E.65043
G1 X38.583 Y205.105 E.00572
M204 S6000
G1 X38.072 Y204.871 F30000
G1 F3000
M204 S500
G1 X38.214 Y204.783 E.00604
G3 X39.564 Y204.329 I1.791 J3.091 E.05177
G1 X39.911 Y204.303 E.01255
G3 X37.916 Y204.976 I.094 J3.571 E.73314
G1 X38.022 Y204.905 E.00463
; WIPE_START
G1 X38.214 Y204.783 E-.08637
M73 P13 R66
G1 X38.53 Y204.618 E-.13545
G1 X38.862 Y204.488 E-.13537
G1 X39.208 Y204.39 E-.13665
G1 X39.564 Y204.329 E-.13738
G1 X39.902 Y204.303 E-.12879
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X39.887 Y196.671 Z.6 F30000
G1 X39.747 Y123.815 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X39.945 Y123.8 E.00717
G3 X39.687 Y123.822 I.058 J2.194 E.48861
M204 S6000
G1 X39.199 Y123.467 F30000
; FEATURE: Inner wall
M73 P13 R65
G1 F3000
M204 S500
G1 X39.41 Y123.409 E.00791
G3 X39.677 Y123.362 I.594 J2.59 E.00978
M73 P14 R65
G1 X39.934 Y123.343 E.0093
G3 X39.142 Y123.485 I.07 J2.656 E.57361
M204 S6000
G1 X38.636 Y123.202 F30000
G1 F3000
M204 S500
G1 X38.719 Y123.162 E.00333
G3 X39.621 Y122.908 I1.285 J2.837 E.03393
G1 X39.922 Y122.885 E.01093
G3 X38.443 Y123.304 I.082 J3.113 E.65044
G1 X38.583 Y123.23 E.00572
M204 S6000
G1 X38.072 Y122.996 F30000
G1 F3000
M204 S500
G1 X38.214 Y122.907 E.00605
G3 X39.564 Y122.454 I1.79 J3.091 E.05176
G1 X39.911 Y122.428 E.01255
G3 X37.916 Y123.101 I.094 J3.571 E.73314
G1 X38.023 Y123.03 E.00463
; WIPE_START
G1 X38.214 Y122.907 E-.08642
G1 X38.53 Y122.743 E-.13539
G1 X38.862 Y122.613 E-.13528
G1 X39.208 Y122.515 E-.13666
G1 X39.564 Y122.454 E-.13741
G1 X39.902 Y122.428 E-.12884
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X46.865 Y125.554 Z.6 F30000
G1 X204.4 Y196.275 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X51.6 Y196.275 E5.517
G1 X51.6 Y55.725 E5.0747
G1 X204.4 Y55.725 E5.517
G1 X204.4 Y196.215 E5.07253
M204 S6000
G1 X204.857 Y196.732 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X51.143 Y196.732 E5.55
G1 X51.143 Y55.268 E5.10771
G1 X204.857 Y55.268 E5.55
G1 X204.857 Y196.672 E5.10554
M204 S6000
G1 X205.314 Y197.189 F30000
G1 F3000
M204 S500
G1 X50.686 Y197.189 E5.58301
G1 X50.686 Y54.811 E5.14071
G1 X205.314 Y54.811 E5.58301
G1 X205.314 Y197.129 E5.13855
M204 S6000
G1 X205.771 Y197.646 F30000
G1 F3000
M204 S500
G1 X50.229 Y197.646 E5.61602
G1 X50.229 Y54.354 E5.17372
G1 X205.771 Y54.354 E5.61602
G1 X205.771 Y197.586 E5.17155
; WIPE_START
G1 X203.771 Y197.587 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X198.235 Y192.333 Z.6 F30000
G1 X39.777 Y41.938 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X39.945 Y41.925 E.00609
G3 X39.717 Y41.943 I.058 J2.194 E.48969
M204 S6000
G1 X39.2 Y41.592 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X39.41 Y41.534 E.00788
G3 X39.677 Y41.487 I.594 J2.59 E.00978
G1 X39.934 Y41.468 E.0093
G3 X39.143 Y41.61 I.07 J2.656 E.57364
M204 S6000
G1 X38.637 Y41.327 F30000
G1 F3000
M204 S500
G1 X38.719 Y41.287 E.0033
G3 X39.621 Y41.033 I1.285 J2.837 E.03394
G1 X39.922 Y41.01 E.01093
G3 X38.443 Y41.429 I.082 J3.113 E.65044
G1 X38.584 Y41.355 E.00575
M204 S6000
G1 X38.073 Y41.121 F30000
G1 F3000
M204 S500
G1 X38.214 Y41.033 E.00602
G3 X39.564 Y40.579 I1.79 J3.091 E.05177
G1 X39.911 Y40.553 E.01255
G3 X37.916 Y41.226 I.094 J3.571 E.73315
G1 X38.023 Y41.154 E.00466
; WIPE_START
G1 X38.214 Y41.033 E-.08611
G1 X38.53 Y40.868 E-.13536
G1 X38.862 Y40.738 E-.13538
G1 X39.208 Y40.64 E-.13662
G1 X39.564 Y40.579 E-.13741
G1 X39.903 Y40.553 E-.12912
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X47.535 Y40.674 Z.6 F30000
G1 X127.747 Y41.94 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X127.945 Y41.925 E.00717
M73 P15 R65
G3 X127.687 Y41.947 I.058 J2.194 E.48861
M204 S6000
G1 X127.199 Y41.593 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X127.41 Y41.534 E.00791
G3 X127.677 Y41.487 I.594 J2.59 E.00978
M73 P15 R64
G1 X127.934 Y41.468 E.00931
G3 X127.142 Y41.611 I.07 J2.656 E.57356
M204 S6000
G1 X126.636 Y41.327 F30000
G1 F3000
M204 S500
G1 X126.719 Y41.287 E.00333
G3 X127.62 Y41.033 I1.285 J2.837 E.03394
G1 X127.922 Y41.01 E.01093
G3 X126.443 Y41.429 I.082 J3.113 E.65044
G1 X126.583 Y41.355 E.00571
M204 S6000
G1 X126.072 Y41.121 F30000
G1 F3000
M204 S500
G1 X126.214 Y41.032 E.00605
G3 X127.564 Y40.579 I1.79 J3.091 E.05176
G1 X127.911 Y40.553 E.01255
G3 X125.916 Y41.226 I.094 J3.571 E.73314
G1 X126.023 Y41.155 E.00464
; WIPE_START
G1 X126.214 Y41.032 E-.08645
G1 X126.53 Y40.868 E-.1353
G1 X126.862 Y40.738 E-.13539
G1 X127.208 Y40.64 E-.13654
G1 X127.564 Y40.579 E-.13749
G1 X127.902 Y40.553 E-.12882
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X135.534 Y40.674 Z.6 F30000
G1 X215.747 Y41.94 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X215.945 Y41.925 E.00717
G3 X215.688 Y41.947 I.058 J2.194 E.48861
M204 S6000
G1 X216.165 Y41.473 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X216.199 Y41.474 E.00121
G3 X215.677 Y41.487 I-.195 J2.65 E.5839
G1 X215.934 Y41.468 E.0093
G1 X216.105 Y41.472 E.0062
M204 S6000
G1 X216.645 Y41.08 F30000
G1 F3000
M204 S500
G1 X216.844 Y41.124 E.00738
G3 X215.621 Y41.033 I-.84 J2.999 E.66193
G1 X215.922 Y41.01 E.01093
G3 X216.541 Y41.056 I.082 J3.113 E.02245
G1 X216.586 Y41.066 E.00167
M204 S6000
G1 X217.14 Y40.743 F30000
G1 F3000
M204 S500
G1 X217.306 Y40.797 E.00631
G3 X215.564 Y40.579 I-1.302 J3.326 E.74627
G1 X215.911 Y40.553 E.01255
G3 X216.968 Y40.684 I.094 J3.571 E.0386
G1 X217.083 Y40.723 E.0044
; WIPE_START
G1 X217.306 Y40.797 E-.0892
G1 X217.63 Y40.945 E-.13548
G1 X217.939 Y41.123 E-.13533
G1 X218.228 Y41.331 E-.13536
G1 X218.495 Y41.567 E-.13529
G1 X218.726 Y41.816 E-.12934
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X218.47 Y49.444 Z.6 F30000
G1 X215.821 Y128.186 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X215.728 Y128.172 E.00339
G3 X215.733 Y123.816 I.275 J-2.178 E.22924
G1 X215.945 Y123.8 E.00768
G3 X216.164 Y128.183 I.058 J2.194 E.24526
G1 X215.881 Y128.185 E.01021
M204 S6000
G1 X215.688 Y128.639 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X215.67 Y128.635 E.00067
G3 X215.677 Y123.362 I.334 J-2.636 E.27746
G1 X215.934 Y123.343 E.0093
G3 X215.934 Y128.655 I.07 J2.656 E.30645
G1 X215.748 Y128.643 E.00673
M204 S6000
G1 X215.651 Y129.094 F30000
G1 F3000
M204 S500
G1 X215.613 Y129.088 E.00138
G3 X215.621 Y122.908 I.391 J-3.09 E.32521
G1 X215.922 Y122.885 E.01093
G3 X215.922 Y129.112 I.082 J3.113 E.35917
G1 X215.711 Y129.098 E.00767
M204 S6000
G1 X215.613 Y129.55 F30000
G1 F3000
M204 S500
G1 X215.556 Y129.542 E.00208
G3 X215.564 Y122.454 I.448 J-3.544 E.37298
G1 X215.911 Y122.428 E.01255
G3 X215.911 Y129.569 I.094 J3.571 E.41192
G1 X215.673 Y129.554 E.00861
; WIPE_START
G1 X215.556 Y129.542 E-.04467
G1 X215.205 Y129.484 E-.13535
G1 X214.862 Y129.387 E-.13532
G1 X214.53 Y129.257 E-.13544
G1 X214.214 Y129.095 E-.13518
G1 X213.914 Y128.901 E-.13544
G1 X213.835 Y128.838 E-.03859
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X214.024 Y136.468 Z.6 F30000
G1 X215.741 Y205.691 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X215.945 Y205.675 E.0074
G3 X215.681 Y205.698 I.058 J2.199 E.48941
M204 S6000
G1 X216.165 Y205.223 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X216.199 Y205.224 E.00122
G3 X215.677 Y205.237 I-.195 J2.65 E.58389
G1 X215.934 Y205.218 E.0093
G1 X216.105 Y205.222 E.00618
M204 S6000
G1 X216.644 Y204.83 F30000
G1 F3000
M204 S500
G1 X216.844 Y204.875 E.00739
G3 X215.62 Y204.783 I-.84 J2.999 E.66192
G1 X215.922 Y204.76 E.01093
G3 X216.541 Y204.806 I.082 J3.113 E.02244
G1 X216.586 Y204.816 E.00166
M204 S6000
G1 X217.14 Y204.493 F30000
G1 F3000
M204 S500
G1 X217.306 Y204.547 E.00632
G3 X215.564 Y204.329 I-1.301 J3.326 E.74627
G1 X215.911 Y204.303 E.01255
G3 X216.968 Y204.434 I.094 J3.571 E.03861
G1 X217.083 Y204.473 E.00438
; WIPE_START
G1 X217.306 Y204.547 E-.08927
G1 X217.63 Y204.695 E-.13545
G1 X217.939 Y204.873 E-.13541
G1 X218.228 Y205.081 E-.13534
G1 X218.495 Y205.317 E-.13537
G1 X218.726 Y205.566 E-.12916
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X211.094 Y205.577 Z.6 F30000
G1 X127.698 Y205.697 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X127.733 Y205.691 E.00129
G1 X127.945 Y205.675 E.00768
G3 X127.511 Y205.73 I.058 J2.199 E.48316
G1 X127.639 Y205.708 E.00468
M204 S6000
G1 X128.16 Y205.223 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X128.199 Y205.224 E.00141
G3 X127.677 Y205.237 I-.195 J2.65 E.58389
G1 X127.934 Y205.218 E.0093
G1 X128.1 Y205.222 E.00599
M204 S6000
G1 X128.639 Y204.829 F30000
G1 F3000
M204 S500
G1 X128.844 Y204.874 E.00758
G3 X127.621 Y204.783 I-.84 J2.999 E.66196
G1 X127.922 Y204.76 E.01092
G3 X128.541 Y204.806 I.082 J3.113 E.02245
G1 X128.581 Y204.815 E.00147
M204 S6000
G1 X129.135 Y204.491 F30000
G1 F3000
M204 S500
G1 X129.306 Y204.547 E.00649
G3 X127.565 Y204.329 I-1.301 J3.326 E.74626
G1 X127.911 Y204.303 E.01254
G3 X128.968 Y204.434 I.094 J3.571 E.03862
G1 X129.079 Y204.472 E.00422
; WIPE_START
G1 X129.306 Y204.547 E-.09105
G1 X129.63 Y204.695 E-.13538
G1 X129.939 Y204.873 E-.13544
G1 X130.228 Y205.081 E-.13529
G1 X130.495 Y205.317 E-.13547
G1 X130.723 Y205.563 E-.12737
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X134.447 Y198.9 Z.6 F30000
G1 X226.046 Y35.004 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.5007
G1 F6300
M204 S500
G1 X225.326 Y34.285 E.03681
G1 X224.679 Y34.285 E.02341
G1 X225.84 Y35.446 E.0594
G1 X225.84 Y36.094 E.02341
G1 X224.031 Y34.285 E.09251
G1 X223.384 Y34.285 E.02341
G1 X225.84 Y36.741 E.12561
G1 X225.84 Y37.388 E.02341
G1 X222.737 Y34.285 E.15872
G1 X222.089 Y34.285 E.02341
G1 X225.84 Y38.036 E.19183
G1 X225.84 Y38.683 E.02341
G1 X221.442 Y34.285 E.22494
G1 X220.794 Y34.285 E.02341
G1 X225.84 Y39.331 E.25805
G1 X225.84 Y39.978 E.02341
G1 X220.147 Y34.285 E.29115
G1 X219.5 Y34.285 E.02341
G1 X225.84 Y40.625 E.32426
G1 X225.84 Y41.273 E.02341
G1 X218.852 Y34.285 E.35737
G1 X218.205 Y34.285 E.02341
G1 X225.84 Y41.92 E.39048
G1 X225.84 Y42.568 E.02341
G1 X217.557 Y34.285 E.42358
G1 X216.91 Y34.285 E.02341
G1 X225.84 Y43.215 E.45669
G1 X225.84 Y43.862 E.02341
G1 X216.263 Y34.285 E.4898
G1 X215.615 Y34.285 E.02341
G1 X225.84 Y44.51 E.52291
G1 X225.84 Y45.157 E.02341
G1 X214.968 Y34.285 E.55602
G1 X214.32 Y34.285 E.02341
G1 X225.84 Y45.805 E.58912
G1 X225.84 Y46.452 E.02341
G1 X213.673 Y34.285 E.62223
G1 X213.026 Y34.285 E.02341
G1 X225.84 Y47.099 E.65534
G1 X225.84 Y47.747 E.02341
G1 X212.378 Y34.285 E.68845
G1 X211.731 Y34.285 E.02341
G1 X225.84 Y48.394 E.72156
G1 X225.84 Y49.042 E.02341
G1 X219.797 Y42.998 E.30906
G3 X219.946 Y43.795 I-4.421 J1.24 E.02934
G1 X225.84 Y49.689 E.30144
G1 X225.84 Y50.336 E.02341
G1 X219.947 Y44.443 E.30141
G3 X219.86 Y45.004 I-4.668 J-.433 E.02054
G1 X225.84 Y50.984 E.30583
G1 X225.84 Y51.631 E.02341
G1 X219.711 Y45.501 E.31348
G3 X219.513 Y45.951 I-2.344 J-.761 E.0178
G1 X225.84 Y52.279 E.32358
G1 X225.84 Y52.926 E.02341
G1 X219.273 Y46.358 E.33586
G3 X218.989 Y46.722 I-1.956 J-1.235 E.01671
G1 X225.84 Y53.573 E.35038
G1 X225.84 Y54.221 E.02341
G1 X218.668 Y47.049 E.36679
G3 X218.31 Y47.338 I-1.628 J-1.646 E.01667
G1 X225.84 Y54.868 E.38508
G1 X225.84 Y55.516 E.02341
G1 X217.914 Y47.589 E.40534
G3 X217.477 Y47.8 I-1.273 J-2.082 E.01756
G1 X225.84 Y56.163 E.42768
G1 X225.84 Y56.81 E.02341
G1 X216.989 Y47.959 E.45268
G3 X216.441 Y48.058 I-.772 J-2.69 E.02017
G1 X225.84 Y57.458 E.48069
G1 X225.84 Y58.105 E.02341
G1 X215.815 Y48.08 E.5127
G3 X215.059 Y47.971 I.262 J-4.521 E.02764
G1 X226.046 Y58.958 E.56187
; WIPE_START
G1 X224.632 Y57.544 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X221.65 Y50.518 Z.6 F30000
G1 X217.472 Y40.673 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X211.083 Y34.285 E.3267
G1 X210.436 Y34.285 E.02341
G1 X216.329 Y40.178 E.30137
G2 X215.684 Y40.18 I-.305 J4.84 E.02334
G1 X209.789 Y34.285 E.30149
G1 X209.141 Y34.285 E.02341
G1 X215.118 Y40.262 E.30567
G2 X214.623 Y40.414 I.511 J2.546 E.01877
G1 X208.494 Y34.285 E.31345
G1 X207.846 Y34.285 E.02341
G1 X214.175 Y40.613 E.32365
G2 X213.769 Y40.855 I1.002 J2.147 E.01711
G1 X207.199 Y34.285 E.33599
G1 X206.552 Y34.285 E.02341
G1 X213.402 Y41.135 E.35033
G2 X213.074 Y41.455 I5.663 J6.128 E.01656
G1 X205.904 Y34.285 E.36668
G1 X205.257 Y34.285 E.02341
G1 X212.786 Y41.814 E.38504
G2 X212.536 Y42.211 I1.863 J1.45 E.01701
G1 X204.609 Y34.285 E.40536
G1 X203.962 Y34.285 E.02341
G1 X212.327 Y42.65 E.42779
G2 X212.164 Y43.134 I2.346 J1.059 E.01851
G1 X203.315 Y34.285 E.45256
G1 X202.667 Y34.285 E.02341
G1 X212.067 Y43.684 E.4807
G2 X212.043 Y44.307 I3.101 J.433 E.02259
G1 X202.02 Y34.285 E.51256
G1 X201.372 Y34.285 E.02341
G1 X212.458 Y45.37 E.56691
; WIPE_START
G1 X211.044 Y43.956 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X205.478 Y38.733 Z.6 F30000
G1 X200.519 Y34.079 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X225.84 Y59.4 E1.29491
G1 X225.84 Y60.047 E.02341
G1 X200.078 Y34.285 E1.3175
M73 P16 R64
G1 X199.43 Y34.285 E.02341
G1 X225.84 Y60.695 E1.35061
G1 X225.84 Y61.342 E.02341
G1 X198.783 Y34.285 E1.38371
G1 X198.135 Y34.285 E.02341
G1 X225.84 Y61.99 E1.41682
G1 X225.84 Y62.637 E.02341
G1 X197.488 Y34.285 E1.44993
G1 X196.841 Y34.285 E.02341
G1 X225.84 Y63.284 E1.48304
G1 X225.84 Y63.932 E.02341
G1 X196.193 Y34.285 E1.51614
G1 X195.546 Y34.285 E.02341
G1 X225.84 Y64.579 E1.54925
G1 X225.84 Y65.227 E.02341
G1 X194.898 Y34.285 E1.58236
G1 X194.251 Y34.285 E.02341
G1 X225.84 Y65.874 E1.61547
G1 X225.84 Y66.521 E.02341
G1 X193.604 Y34.285 E1.64858
G1 X192.956 Y34.285 E.02341
G1 X225.84 Y67.169 E1.68168
G1 X225.84 Y67.816 E.02341
G1 X192.309 Y34.285 E1.71479
G1 X191.661 Y34.285 E.02341
G1 X225.84 Y68.464 E1.7479
G1 X225.84 Y69.111 E.02341
G1 X191.014 Y34.285 E1.78101
G1 X190.367 Y34.285 E.02341
G1 X225.84 Y69.758 E1.81412
G1 X225.84 Y70.406 E.02341
G1 X189.719 Y34.285 E1.84722
G1 X189.072 Y34.285 E.02341
G1 X225.84 Y71.053 E1.88033
G1 X225.84 Y71.701 E.02341
G1 X188.424 Y34.285 E1.91344
G1 X187.777 Y34.285 E.02341
G1 X225.84 Y72.348 E1.94655
G1 X225.84 Y72.995 E.02341
G1 X187.13 Y34.285 E1.97965
G1 X186.482 Y34.285 E.02341
G1 X225.84 Y73.643 E2.01276
G1 X225.84 Y74.29 E.02341
G1 X206.16 Y54.61 E1.00646
G1 X206.16 Y53.965 E.0233
G1 X205.515 Y53.965 E.0233
G1 X185.835 Y34.285 E1.00646
G1 X185.187 Y34.285 E.02341
G1 X204.868 Y53.965 E1.00646
G1 X204.221 Y53.965 E.02341
G1 X184.54 Y34.285 E1.00646
G1 X183.893 Y34.285 E.02341
G1 X203.573 Y53.965 E1.00646
G1 X202.926 Y53.965 E.02341
G1 X183.245 Y34.285 E1.00646
G1 X182.598 Y34.285 E.02341
G1 X202.278 Y53.965 E1.00646
G1 X201.631 Y53.965 E.02341
G1 X181.95 Y34.285 E1.00646
G1 X181.303 Y34.285 E.02341
G1 X200.984 Y53.965 E1.00646
G1 X200.336 Y53.965 E.02341
G1 X180.656 Y34.285 E1.00646
G1 X180.008 Y34.285 E.02341
G1 X199.689 Y53.965 E1.00646
G1 X199.041 Y53.965 E.02341
G1 X179.361 Y34.285 E1.00646
G1 X178.713 Y34.285 E.02341
G1 X198.394 Y53.965 E1.00646
G1 X197.747 Y53.965 E.02341
G1 X178.066 Y34.285 E1.00646
G1 X177.419 Y34.285 E.02341
G1 X197.099 Y53.965 E1.00646
G1 X196.452 Y53.965 E.02341
G1 X176.771 Y34.285 E1.00646
G1 X176.124 Y34.285 E.02341
G1 X195.804 Y53.965 E1.00646
G1 X195.157 Y53.965 E.02341
G1 X175.476 Y34.285 E1.00646
G1 X174.829 Y34.285 E.02341
G1 X194.51 Y53.965 E1.00646
G1 X193.862 Y53.965 E.02341
G1 X174.182 Y34.285 E1.00646
G1 X173.534 Y34.285 E.02341
G1 X193.215 Y53.965 E1.00646
G1 X192.567 Y53.965 E.02341
G1 X172.887 Y34.285 E1.00646
G1 X172.24 Y34.285 E.02341
G1 X191.92 Y53.965 E1.00646
G1 X191.273 Y53.965 E.02341
G1 X171.592 Y34.285 E1.00646
G1 X170.945 Y34.285 E.02341
G1 X190.625 Y53.965 E1.00646
G1 X189.978 Y53.965 E.02341
G1 X170.297 Y34.285 E1.00646
G1 X169.65 Y34.285 E.02341
G1 X189.33 Y53.965 E1.00646
G1 X188.683 Y53.965 E.02341
G1 X169.003 Y34.285 E1.00646
G1 X168.355 Y34.285 E.02341
G1 X188.036 Y53.965 E1.00646
G1 X187.388 Y53.965 E.02341
M73 P16 R63
G1 X167.708 Y34.285 E1.00646
G1 X167.06 Y34.285 E.02341
G1 X186.741 Y53.965 E1.00646
G1 X186.093 Y53.965 E.02341
G1 X166.413 Y34.285 E1.00646
G1 X165.766 Y34.285 E.02341
G1 X185.446 Y53.965 E1.00646
G1 X184.799 Y53.965 E.02341
G1 X165.118 Y34.285 E1.00646
G1 X164.471 Y34.285 E.02341
G1 X184.151 Y53.965 E1.00646
G1 X183.504 Y53.965 E.02341
G1 X163.823 Y34.285 E1.00646
G1 X163.176 Y34.285 E.02341
G1 X182.856 Y53.965 E1.00646
G1 X182.209 Y53.965 E.02341
G1 X162.529 Y34.285 E1.00646
G1 X161.881 Y34.285 E.02341
G1 X181.562 Y53.965 E1.00646
G1 X180.914 Y53.965 E.02341
G1 X161.234 Y34.285 E1.00646
G1 X160.586 Y34.285 E.02341
G1 X180.267 Y53.965 E1.00646
G1 X179.619 Y53.965 E.02341
G1 X159.939 Y34.285 E1.00646
G1 X159.292 Y34.285 E.02341
G1 X178.972 Y53.965 E1.00646
G1 X178.325 Y53.965 E.02341
G1 X158.644 Y34.285 E1.00646
G1 X157.997 Y34.285 E.02341
G1 X177.677 Y53.965 E1.00646
G1 X177.03 Y53.965 E.02341
G1 X157.349 Y34.285 E1.00646
G1 X156.702 Y34.285 E.02341
G1 X176.382 Y53.965 E1.00646
G1 X175.735 Y53.965 E.02341
G1 X156.055 Y34.285 E1.00646
G1 X155.407 Y34.285 E.02341
G1 X175.088 Y53.965 E1.00646
G1 X174.44 Y53.965 E.02341
G1 X154.76 Y34.285 E1.00646
G1 X154.112 Y34.285 E.02341
G1 X173.793 Y53.965 E1.00646
G1 X173.146 Y53.965 E.02341
G1 X153.465 Y34.285 E1.00646
G1 X152.818 Y34.285 E.02341
G1 X172.498 Y53.965 E1.00646
G1 X171.851 Y53.965 E.02341
G1 X152.17 Y34.285 E1.00646
G1 X151.523 Y34.285 E.02341
G1 X171.203 Y53.965 E1.00646
G1 X170.556 Y53.965 E.02341
G1 X150.875 Y34.285 E1.00646
G1 X150.228 Y34.285 E.02341
G1 X169.909 Y53.965 E1.00646
G1 X169.261 Y53.965 E.02341
G1 X149.581 Y34.285 E1.00646
G1 X148.933 Y34.285 E.02341
G1 X168.614 Y53.965 E1.00646
G1 X167.966 Y53.965 E.02341
G1 X148.286 Y34.285 E1.00646
G1 X147.638 Y34.285 E.02341
G1 X167.319 Y53.965 E1.00646
G1 X166.672 Y53.965 E.02341
G1 X146.991 Y34.285 E1.00646
G1 X146.344 Y34.285 E.02341
G1 X166.024 Y53.965 E1.00646
G1 X165.377 Y53.965 E.02341
G1 X145.696 Y34.285 E1.00646
G1 X145.049 Y34.285 E.02341
G1 X164.729 Y53.965 E1.00646
G1 X164.082 Y53.965 E.02341
G1 X144.401 Y34.285 E1.00646
G1 X143.754 Y34.285 E.02341
G1 X163.435 Y53.965 E1.00646
G1 X162.787 Y53.965 E.02341
G1 X143.107 Y34.285 E1.00646
G1 X142.459 Y34.285 E.02341
G1 X162.14 Y53.965 E1.00646
G1 X161.492 Y53.965 E.02341
G1 X141.812 Y34.285 E1.00646
G1 X141.164 Y34.285 E.02341
G1 X160.845 Y53.965 E1.00646
G1 X160.198 Y53.965 E.02341
G1 X140.517 Y34.285 E1.00646
G1 X139.87 Y34.285 E.02341
G1 X159.55 Y53.965 E1.00646
G1 X158.903 Y53.965 E.02341
G1 X139.222 Y34.285 E1.00646
G1 X138.575 Y34.285 E.02341
G1 X158.255 Y53.965 E1.00646
G1 X157.608 Y53.965 E.02341
G1 X137.927 Y34.285 E1.00646
G1 X137.28 Y34.285 E.02341
G1 X156.961 Y53.965 E1.00646
G1 X156.313 Y53.965 E.02341
G1 X136.633 Y34.285 E1.00646
G1 X135.985 Y34.285 E.02341
G1 X155.666 Y53.965 E1.00646
M73 P17 R63
G1 X155.018 Y53.965 E.02341
G1 X135.338 Y34.285 E1.00646
G1 X134.69 Y34.285 E.02341
G1 X154.371 Y53.965 E1.00646
G1 X153.724 Y53.965 E.02341
G1 X134.043 Y34.285 E1.00646
G1 X133.396 Y34.285 E.02341
G1 X153.076 Y53.965 E1.00646
G1 X152.429 Y53.965 E.02341
G1 X132.748 Y34.285 E1.00646
G1 X132.101 Y34.285 E.02341
G1 X151.781 Y53.965 E1.00646
G1 X151.134 Y53.965 E.02341
G1 X131.453 Y34.285 E1.00646
G1 X130.806 Y34.285 E.02341
G1 X150.487 Y53.965 E1.00646
G1 X149.839 Y53.965 E.02341
G1 X130.159 Y34.285 E1.00646
G1 X129.511 Y34.285 E.02341
G1 X149.192 Y53.965 E1.00646
G1 X148.544 Y53.965 E.02341
G1 X128.864 Y34.285 E1.00646
G1 X128.216 Y34.285 E.02341
G1 X147.897 Y53.965 E1.00646
G1 X147.25 Y53.965 E.02341
G1 X127.569 Y34.285 E1.00646
G1 X126.922 Y34.285 E.02341
G1 X146.602 Y53.965 E1.00646
G1 X145.955 Y53.965 E.02341
G1 X126.274 Y34.285 E1.00646
G1 X125.627 Y34.285 E.02341
G1 X145.307 Y53.965 E1.00646
G1 X144.66 Y53.965 E.02341
G1 X124.979 Y34.285 E1.00646
G1 X124.332 Y34.285 E.02341
G1 X144.013 Y53.965 E1.00646
G1 X143.365 Y53.965 E.02341
G1 X123.685 Y34.285 E1.00646
G1 X123.037 Y34.285 E.02341
G1 X129.06 Y40.308 E.30802
G2 X128.278 Y40.173 I-1.298 J5.206 E.02872
G1 X122.39 Y34.285 E.30114
G1 X121.742 Y34.285 E.02341
G1 X127.641 Y40.183 E.30165
G2 X127.082 Y40.272 I.534 J5.166 E.02047
G1 X121.095 Y34.285 E.30619
G1 X120.448 Y34.285 E.02341
G1 X126.59 Y40.427 E.31412
G2 X126.145 Y40.629 I.785 J2.324 E.01772
G1 X119.8 Y34.285 E.32445
G1 X119.153 Y34.285 E.02341
G1 X125.741 Y40.873 E.33692
G2 X125.376 Y41.156 I5.319 J7.231 E.01669
G1 X118.505 Y34.285 E.35138
G1 X117.858 Y34.285 E.02341
G1 X125.053 Y41.48 E.36797
G2 X124.767 Y41.841 I1.663 J1.611 E.01669
G1 X117.211 Y34.285 E.38644
G1 X116.563 Y34.285 E.02341
G1 X124.52 Y42.241 E.40689
G2 X124.313 Y42.682 I2.095 J1.248 E.01764
G1 X115.916 Y34.285 E.42945
G1 X115.268 Y34.285 E.02341
G1 X124.155 Y43.172 E.45447
G2 X124.063 Y43.726 I2.726 J.74 E.02037
G1 X114.621 Y34.285 E.48284
G1 X113.974 Y34.285 E.02341
G1 X124.046 Y44.357 E.5151
G2 X124.167 Y45.126 I5.158 J-.42 E.02817
G1 X113.121 Y34.079 E.56493
; WIPE_START
G1 X114.535 Y35.493 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X121.554 Y38.491 Z.6 F30000
G1 X131.486 Y42.734 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X142.718 Y53.965 E.57438
G1 X142.07 Y53.965 E.02341
G1 X131.948 Y43.843 E.51764
G3 X131.944 Y44.487 I-3.212 J.302 E.02331
G1 X141.423 Y53.965 E.48474
G1 X140.776 Y53.965 E.02341
G1 X131.851 Y45.04 E.45642
G3 X131.698 Y45.535 I-2.548 J-.514 E.01876
G1 X140.128 Y53.965 E.43111
G1 X139.481 Y53.965 E.02341
G1 X131.498 Y45.982 E.40824
G3 X131.253 Y46.385 I-6.339 J-3.585 E.01704
G1 X138.833 Y53.965 E.38766
G1 X138.186 Y53.965 E.02341
G1 X130.967 Y46.746 E.36919
G3 X130.644 Y47.07 I-1.782 J-1.453 E.01658
G1 X137.539 Y53.965 E.35261
G1 X136.891 Y53.965 E.02341
G1 X130.283 Y47.357 E.33792
G3 X129.885 Y47.606 I-1.441 J-1.863 E.01702
G1 X136.244 Y53.965 E.32519
G1 X135.596 Y53.965 E.02341
G1 X129.445 Y47.814 E.31456
G3 X128.951 Y47.967 I-1.011 J-2.392 E.01875
G1 X134.949 Y53.965 E.30674
G1 X134.302 Y53.965 E.02341
G1 X128.4 Y48.063 E.30182
G3 X127.765 Y48.076 I-.401 J-4.199 E.02298
G1 X133.654 Y53.965 E.30118
G1 X133.007 Y53.965 E.02341
G1 X126.678 Y47.637 E.32364
; WIPE_START
G1 X128.092 Y49.051 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X132.565 Y54.171 Z.6 F30000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X112.679 Y34.285 E1.01698
G1 X112.031 Y34.285 E.02341
G1 X131.712 Y53.965 E1.00646
G1 X131.065 Y53.965 E.02341
G1 X111.384 Y34.285 E1.00646
G1 X110.737 Y34.285 E.02341
G1 X130.417 Y53.965 E1.00646
G1 X129.77 Y53.965 E.02341
G1 X110.089 Y34.285 E1.00646
G1 X109.442 Y34.285 E.02341
G1 X129.122 Y53.965 E1.00646
G1 X128.475 Y53.965 E.02341
G1 X108.794 Y34.285 E1.00646
G1 X108.147 Y34.285 E.02341
G1 X127.828 Y53.965 E1.00646
G1 X127.18 Y53.965 E.02341
G1 X107.5 Y34.285 E1.00646
G1 X106.852 Y34.285 E.02341
G1 X126.533 Y53.965 E1.00646
G1 X125.885 Y53.965 E.02341
G1 X106.205 Y34.285 E1.00646
G1 X105.557 Y34.285 E.02341
G1 X125.238 Y53.965 E1.00646
G1 X124.591 Y53.965 E.02341
G1 X104.91 Y34.285 E1.00646
G1 X104.263 Y34.285 E.02341
G1 X123.943 Y53.965 E1.00646
G1 X123.296 Y53.965 E.02341
G1 X103.615 Y34.285 E1.00646
G1 X102.968 Y34.285 E.02341
G1 X122.648 Y53.965 E1.00646
G1 X122.001 Y53.965 E.02341
G1 X102.32 Y34.285 E1.00646
G1 X101.673 Y34.285 E.02341
G1 X121.354 Y53.965 E1.00646
G1 X120.706 Y53.965 E.02341
G1 X101.026 Y34.285 E1.00646
G1 X100.378 Y34.285 E.02341
G1 X120.059 Y53.965 E1.00646
G1 X119.411 Y53.965 E.02341
G1 X99.731 Y34.285 E1.00646
G1 X99.083 Y34.285 E.02341
G1 X118.764 Y53.965 E1.00646
G1 X118.117 Y53.965 E.02341
G1 X98.436 Y34.285 E1.00646
G1 X97.789 Y34.285 E.02341
G1 X117.469 Y53.965 E1.00646
G1 X116.822 Y53.965 E.02341
G1 X97.141 Y34.285 E1.00646
G1 X96.494 Y34.285 E.02341
G1 X116.174 Y53.965 E1.00646
G1 X115.527 Y53.965 E.02341
G1 X95.846 Y34.285 E1.00646
G1 X95.199 Y34.285 E.02341
G1 X114.88 Y53.965 E1.00646
G1 X114.232 Y53.965 E.02341
G1 X94.552 Y34.285 E1.00646
G1 X93.904 Y34.285 E.02341
G1 X113.585 Y53.965 E1.00646
G1 X112.937 Y53.965 E.02341
G1 X93.257 Y34.285 E1.00646
G1 X92.609 Y34.285 E.02341
G1 X112.29 Y53.965 E1.00646
G1 X111.643 Y53.965 E.02341
G1 X91.962 Y34.285 E1.00646
G1 X91.315 Y34.285 E.02341
G1 X110.995 Y53.965 E1.00646
G1 X110.348 Y53.965 E.02341
G1 X90.667 Y34.285 E1.00646
G1 X90.02 Y34.285 E.02341
G1 X109.7 Y53.965 E1.00646
G1 X109.053 Y53.965 E.02341
G1 X89.372 Y34.285 E1.00646
M73 P17 R62
G1 X88.725 Y34.285 E.02341
G1 X108.406 Y53.965 E1.00646
G1 X107.758 Y53.965 E.02341
G1 X88.078 Y34.285 E1.00646
G1 X87.43 Y34.285 E.02341
G1 X107.111 Y53.965 E1.00646
G1 X106.463 Y53.965 E.02341
G1 X86.783 Y34.285 E1.00646
G1 X86.135 Y34.285 E.02341
G1 X105.816 Y53.965 E1.00646
G1 X105.169 Y53.965 E.02341
G1 X85.488 Y34.285 E1.00646
G1 X84.841 Y34.285 E.02341
G1 X104.521 Y53.965 E1.00646
G1 X103.874 Y53.965 E.02341
G1 X84.193 Y34.285 E1.00646
G1 X83.546 Y34.285 E.02341
G1 X103.226 Y53.965 E1.00646
G1 X102.579 Y53.965 E.02341
G1 X82.898 Y34.285 E1.00646
G1 X82.251 Y34.285 E.02341
G1 X101.932 Y53.965 E1.00646
G1 X101.284 Y53.965 E.02341
G1 X81.604 Y34.285 E1.00646
G1 X80.956 Y34.285 E.02341
G1 X100.637 Y53.965 E1.00646
G1 X99.989 Y53.965 E.02341
G1 X80.309 Y34.285 E1.00646
G1 X79.661 Y34.285 E.02341
G1 X99.342 Y53.965 E1.00646
G1 X98.695 Y53.965 E.02341
G1 X79.014 Y34.285 E1.00646
G1 X78.367 Y34.285 E.02341
G1 X98.047 Y53.965 E1.00646
G1 X97.4 Y53.965 E.02341
G1 X77.719 Y34.285 E1.00646
G1 X77.072 Y34.285 E.02341
G1 X96.752 Y53.965 E1.00646
G1 X96.105 Y53.965 E.02341
G1 X76.424 Y34.285 E1.00646
G1 X75.777 Y34.285 E.02341
G1 X95.458 Y53.965 E1.00646
M73 P18 R62
G1 X94.81 Y53.965 E.02341
G1 X75.13 Y34.285 E1.00646
G1 X74.482 Y34.285 E.02341
G1 X94.163 Y53.965 E1.00646
G1 X93.515 Y53.965 E.02341
G1 X73.835 Y34.285 E1.00646
G1 X73.188 Y34.285 E.02341
G1 X92.868 Y53.965 E1.00646
G1 X92.221 Y53.965 E.02341
G1 X72.54 Y34.285 E1.00646
G1 X71.893 Y34.285 E.02341
G1 X91.573 Y53.965 E1.00646
G1 X90.926 Y53.965 E.02341
G1 X71.245 Y34.285 E1.00646
G1 X70.598 Y34.285 E.02341
G1 X90.278 Y53.965 E1.00646
G1 X89.631 Y53.965 E.02341
G1 X69.951 Y34.285 E1.00646
G1 X69.303 Y34.285 E.02341
G1 X88.984 Y53.965 E1.00646
G1 X88.336 Y53.965 E.02341
G1 X68.656 Y34.285 E1.00646
G1 X68.008 Y34.285 E.02341
G1 X87.689 Y53.965 E1.00646
G1 X87.041 Y53.965 E.02341
G1 X67.361 Y34.285 E1.00646
G1 X66.714 Y34.285 E.02341
G1 X86.394 Y53.965 E1.00646
G1 X85.747 Y53.965 E.02341
G1 X66.066 Y34.285 E1.00646
G1 X65.419 Y34.285 E.02341
G1 X85.099 Y53.965 E1.00646
G1 X84.452 Y53.965 E.02341
G1 X64.771 Y34.285 E1.00646
G1 X64.124 Y34.285 E.02341
G1 X83.804 Y53.965 E1.00646
G1 X83.157 Y53.965 E.02341
G1 X63.477 Y34.285 E1.00646
G1 X62.829 Y34.285 E.02341
G1 X82.51 Y53.965 E1.00646
G1 X81.862 Y53.965 E.02341
G1 X62.182 Y34.285 E1.00646
G1 X61.534 Y34.285 E.02341
G1 X81.215 Y53.965 E1.00646
G1 X80.567 Y53.965 E.02341
G1 X60.887 Y34.285 E1.00646
G1 X60.24 Y34.285 E.02341
G1 X79.92 Y53.965 E1.00646
G1 X79.273 Y53.965 E.02341
G1 X59.592 Y34.285 E1.00646
G1 X58.945 Y34.285 E.02341
G1 X78.625 Y53.965 E1.00646
G1 X77.978 Y53.965 E.02341
G1 X58.297 Y34.285 E1.00646
G1 X57.65 Y34.285 E.02341
G1 X77.331 Y53.965 E1.00646
G1 X76.683 Y53.965 E.02341
G1 X57.003 Y34.285 E1.00646
G1 X56.355 Y34.285 E.02341
G1 X76.036 Y53.965 E1.00646
G1 X75.388 Y53.965 E.02341
G1 X55.708 Y34.285 E1.00646
G1 X55.06 Y34.285 E.02341
G1 X74.741 Y53.965 E1.00646
G1 X74.094 Y53.965 E.02341
G1 X54.413 Y34.285 E1.00646
G1 X53.766 Y34.285 E.02341
G1 X73.446 Y53.965 E1.00646
G1 X72.799 Y53.965 E.02341
G1 X53.118 Y34.285 E1.00646
G1 X52.471 Y34.285 E.02341
G1 X72.151 Y53.965 E1.00646
G1 X71.504 Y53.965 E.02341
G1 X51.823 Y34.285 E1.00646
G1 X51.176 Y34.285 E.02341
G1 X70.857 Y53.965 E1.00646
G1 X70.209 Y53.965 E.02341
G1 X50.529 Y34.285 E1.00646
G1 X49.881 Y34.285 E.02341
G1 X69.562 Y53.965 E1.00646
G1 X68.914 Y53.965 E.02341
G1 X49.234 Y34.285 E1.00646
G1 X48.586 Y34.285 E.02341
G1 X68.267 Y53.965 E1.00646
G1 X67.62 Y53.965 E.02341
G1 X47.939 Y34.285 E1.00646
G1 X47.292 Y34.285 E.02341
G1 X66.972 Y53.965 E1.00646
G1 X66.325 Y53.965 E.02341
G1 X46.644 Y34.285 E1.00646
G1 X45.997 Y34.285 E.02341
G1 X65.677 Y53.965 E1.00646
G1 X65.03 Y53.965 E.02341
G1 X45.349 Y34.285 E1.00646
G1 X44.702 Y34.285 E.02341
G1 X64.383 Y53.965 E1.00646
G1 X63.735 Y53.965 E.02341
G1 X44.055 Y34.285 E1.00646
G1 X43.407 Y34.285 E.02341
G1 X63.088 Y53.965 E1.00646
G1 X62.44 Y53.965 E.02341
G1 X42.76 Y34.285 E1.00646
G1 X42.112 Y34.285 E.02341
G1 X61.793 Y53.965 E1.00646
G1 X61.146 Y53.965 E.02341
G1 X41.465 Y34.285 E1.00646
G1 X40.818 Y34.285 E.02341
G1 X60.498 Y53.965 E1.00646
G1 X59.851 Y53.965 E.02341
G1 X40.17 Y34.285 E1.00646
G1 X39.523 Y34.285 E.02341
G1 X59.203 Y53.965 E1.00646
G1 X58.556 Y53.965 E.02341
G1 X38.875 Y34.285 E1.00646
G1 X38.228 Y34.285 E.02341
G1 X57.909 Y53.965 E1.00646
G1 X57.261 Y53.965 E.02341
G1 X37.581 Y34.285 E1.00646
G1 X36.933 Y34.285 E.02341
G1 X56.614 Y53.965 E1.00646
G1 X55.966 Y53.965 E.02341
G1 X36.286 Y34.285 E1.00646
G1 X35.638 Y34.285 E.02341
G1 X55.319 Y53.965 E1.00646
G1 X54.672 Y53.965 E.02341
G1 X43.828 Y43.122 E.55452
G3 X43.951 Y43.892 I-3.858 J1.008 E.02823
G1 X54.024 Y53.965 E.51515
G1 X53.377 Y53.965 E.02341
G1 X43.941 Y44.53 E.48253
G3 X43.841 Y45.077 I-2.79 J-.226 E.02016
G1 X52.729 Y53.965 E.45453
G1 X52.082 Y53.965 E.02341
G1 X43.686 Y45.569 E.42938
G3 X43.483 Y46.014 I-2.324 J-.792 E.0177
G1 X51.435 Y53.965 E.40664
G1 X50.787 Y53.965 E.02341
G1 X43.233 Y46.411 E.38632
G3 X42.944 Y46.77 I-1.937 J-1.262 E.01668
G1 X50.14 Y53.965 E.36797
G1 X49.84 Y53.965 E.01083
G1 X49.84 Y54.313 E.01258
G1 X42.619 Y47.092 E.3693
G3 X42.256 Y47.377 I-1.606 J-1.67 E.0167
G1 X49.84 Y54.961 E.38783
G1 X49.84 Y55.608 E.02341
G1 X41.856 Y47.623 E.40834
G3 X41.411 Y47.826 I-2.865 J-5.701 E.01768
G1 X49.84 Y56.255 E.43108
G1 X49.84 Y56.903 E.02341
G1 X40.913 Y47.976 E.45652
G3 X40.359 Y48.068 I-.741 J-2.729 E.02037
G1 X49.84 Y57.55 E.48489
G1 X49.84 Y58.198 E.02341
G1 X39.715 Y48.072 E.51781
G3 X38.931 Y47.935 I.286 J-3.952 E.02884
G1 X50.046 Y59.051 E.56844
; WIPE_START
G1 X48.632 Y57.636 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X45.619 Y50.624 Z.6 F30000
G1 X41.315 Y40.609 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X34.991 Y34.285 E.32342
G1 X34.344 Y34.285 E.02341
G1 X40.231 Y40.172 E.30108
G2 X39.598 Y40.187 I-.244 J3.164 E.02293
G1 X33.696 Y34.285 E.30182
G1 X33.049 Y34.285 E.02341
G1 X39.046 Y40.282 E.30671
G2 X38.557 Y40.44 I.542 J2.519 E.01863
G1 X32.401 Y34.285 E.31479
G1 X31.754 Y34.285 E.02341
G1 X38.114 Y40.645 E.32525
G2 X37.713 Y40.891 I1.029 J2.125 E.01705
G1 X31.107 Y34.285 E.33785
G1 X30.459 Y34.285 E.02341
G1 X37.353 Y41.179 E.35255
G2 X37.032 Y41.505 I1.473 J1.768 E.01658
G1 X30.16 Y34.633 E.35146
G1 X30.16 Y35.28 E.02341
G1 X36.748 Y41.869 E.33695
G2 X36.503 Y42.271 I1.888 J1.427 E.01706
G1 X30.16 Y35.927 E.32441
G1 X30.16 Y36.575 E.02341
G1 X36.3 Y42.715 E.314
G2 X36.147 Y43.21 I5.141 J1.852 E.01874
G1 X30.16 Y37.222 E.30621
G1 X30.16 Y37.87 E.02341
G1 X36.058 Y43.768 E.30166
G2 X36.051 Y44.408 I4.255 J.369 E.02317
G1 X30.16 Y38.517 E.30129
G1 X30.16 Y39.164 E.02341
G1 X36.518 Y45.522 E.32514
; WIPE_START
G1 X35.103 Y44.108 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X29.954 Y39.606 Z.6 F30000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X49.84 Y59.492 E1.01698
G1 X49.84 Y60.14 E.02341
M73 P19 R62
G1 X30.16 Y40.459 E1.00646
G1 X30.16 Y41.107 E.02341
G1 X49.84 Y60.787 E1.00646
G1 X49.84 Y61.435 E.02341
G1 X30.16 Y41.754 E1.00646
G1 X30.16 Y42.401 E.02341
G1 X49.84 Y62.082 E1.00646
G1 X49.84 Y62.729 E.02341
G1 X30.16 Y43.049 E1.00646
G1 X30.16 Y43.696 E.02341
G1 X49.84 Y63.377 E1.00646
G1 X49.84 Y64.024 E.02341
G1 X30.16 Y44.344 E1.00646
G1 X30.16 Y44.991 E.02341
G1 X49.84 Y64.672 E1.00646
G1 X49.84 Y65.319 E.02341
G1 X30.16 Y45.638 E1.00646
G1 X30.16 Y46.286 E.02341
G1 X49.84 Y65.966 E1.00646
G1 X49.84 Y66.614 E.02341
G1 X30.16 Y46.933 E1.00646
G1 X30.16 Y47.581 E.02341
G1 X49.84 Y67.261 E1.00646
G1 X49.84 Y67.909 E.02341
G1 X30.16 Y48.228 E1.00646
G1 X30.16 Y48.875 E.02341
G1 X49.84 Y68.556 E1.00646
G1 X49.84 Y69.203 E.02341
G1 X30.16 Y49.523 E1.00646
G1 X30.16 Y50.17 E.02341
G1 X49.84 Y69.851 E1.00646
G1 X49.84 Y70.498 E.02341
G1 X30.16 Y50.818 E1.00646
G1 X30.16 Y51.465 E.02341
G1 X49.84 Y71.146 E1.00646
M73 P19 R61
G1 X49.84 Y71.793 E.02341
G1 X30.16 Y52.112 E1.00646
G1 X30.16 Y52.76 E.02341
G1 X49.84 Y72.44 E1.00646
G1 X49.84 Y73.088 E.02341
G1 X30.16 Y53.407 E1.00646
G1 X30.16 Y54.055 E.02341
G1 X49.84 Y73.735 E1.00646
G1 X49.84 Y74.383 E.02341
G1 X30.16 Y54.702 E1.00646
G1 X30.16 Y55.349 E.02341
G1 X49.84 Y75.03 E1.00646
G1 X49.84 Y75.677 E.02341
G1 X30.16 Y55.997 E1.00646
G1 X30.16 Y56.644 E.02341
G1 X49.84 Y76.325 E1.00646
G1 X49.84 Y76.972 E.02341
G1 X30.16 Y57.292 E1.00646
G1 X30.16 Y57.939 E.02341
G1 X49.84 Y77.62 E1.00646
G1 X49.84 Y78.267 E.02341
G1 X30.16 Y58.586 E1.00646
G1 X30.16 Y59.234 E.02341
G1 X49.84 Y78.914 E1.00646
G1 X49.84 Y79.562 E.02341
G1 X30.16 Y59.881 E1.00646
G1 X30.16 Y60.529 E.02341
G1 X49.84 Y80.209 E1.00646
G1 X49.84 Y80.857 E.02341
G1 X30.16 Y61.176 E1.00646
G1 X30.16 Y61.823 E.02341
G1 X49.84 Y81.504 E1.00646
G1 X49.84 Y82.151 E.02341
G1 X30.16 Y62.471 E1.00646
G1 X30.16 Y63.118 E.02341
G1 X49.84 Y82.799 E1.00646
G1 X49.84 Y83.446 E.02341
G1 X30.16 Y63.766 E1.00646
G1 X30.16 Y64.413 E.02341
G1 X49.84 Y84.094 E1.00646
G1 X49.84 Y84.741 E.02341
G1 X30.16 Y65.06 E1.00646
G1 X30.16 Y65.708 E.02341
G1 X49.84 Y85.388 E1.00646
G1 X49.84 Y86.036 E.02341
G1 X30.16 Y66.355 E1.00646
G1 X30.16 Y67.003 E.02341
G1 X49.84 Y86.683 E1.00646
G1 X49.84 Y87.331 E.02341
G1 X30.16 Y67.65 E1.00646
G1 X30.16 Y68.297 E.02341
G1 X49.84 Y87.978 E1.00646
G1 X49.84 Y88.625 E.02341
G1 X30.16 Y68.945 E1.00646
G1 X30.16 Y69.592 E.02341
G1 X49.84 Y89.273 E1.00646
G1 X49.84 Y89.92 E.02341
G1 X30.16 Y70.24 E1.00646
G1 X30.16 Y70.887 E.02341
G1 X49.84 Y90.568 E1.00646
G1 X49.84 Y91.215 E.02341
G1 X30.16 Y71.534 E1.00646
G1 X30.16 Y72.182 E.02341
G1 X49.84 Y91.862 E1.00646
G1 X49.84 Y92.51 E.02341
G1 X30.16 Y72.829 E1.00646
G1 X30.16 Y73.477 E.02341
G1 X49.84 Y93.157 E1.00646
G1 X49.84 Y93.805 E.02341
G1 X30.16 Y74.124 E1.00646
G1 X30.16 Y74.771 E.02341
G1 X49.84 Y94.452 E1.00646
G1 X49.84 Y95.099 E.02341
G1 X30.16 Y75.419 E1.00646
G1 X30.16 Y76.066 E.02341
G1 X49.84 Y95.747 E1.00646
G1 X49.84 Y96.394 E.02341
G1 X30.16 Y76.714 E1.00646
G1 X30.16 Y77.361 E.02341
G1 X49.84 Y97.042 E1.00646
G1 X49.84 Y97.689 E.02341
G1 X30.16 Y78.008 E1.00646
G1 X30.16 Y78.656 E.02341
G1 X49.84 Y98.336 E1.00646
G1 X49.84 Y98.984 E.02341
G1 X30.16 Y79.303 E1.00646
G1 X30.16 Y79.951 E.02341
G1 X49.84 Y99.631 E1.00646
G1 X49.84 Y100.279 E.02341
G1 X30.16 Y80.598 E1.00646
G1 X30.16 Y81.245 E.02341
G1 X49.84 Y100.926 E1.00646
G1 X49.84 Y101.573 E.02341
G1 X30.16 Y81.893 E1.00646
G1 X30.16 Y82.54 E.02341
G1 X49.84 Y102.221 E1.00646
G1 X49.84 Y102.868 E.02341
G1 X30.16 Y83.188 E1.00646
G1 X30.16 Y83.835 E.02341
G1 X49.84 Y103.515 E1.00646
G1 X49.84 Y104.163 E.02341
G1 X30.16 Y84.482 E1.00646
G1 X30.16 Y85.13 E.02341
G1 X49.84 Y104.81 E1.00646
G1 X49.84 Y105.458 E.02341
G1 X30.16 Y85.777 E1.00646
G1 X30.16 Y86.425 E.02341
G1 X49.84 Y106.105 E1.00646
G1 X49.84 Y106.752 E.02341
G1 X30.16 Y87.072 E1.00646
G1 X30.16 Y87.719 E.02341
G1 X49.84 Y107.4 E1.00646
G1 X49.84 Y108.047 E.02341
G1 X30.16 Y88.367 E1.00646
G1 X30.16 Y89.014 E.02341
G1 X49.84 Y108.695 E1.00646
G1 X49.84 Y109.342 E.02341
G1 X30.16 Y89.662 E1.00646
G1 X30.16 Y90.309 E.02341
G1 X49.84 Y109.989 E1.00646
G1 X49.84 Y110.637 E.02341
G1 X30.16 Y90.956 E1.00646
G1 X30.16 Y91.604 E.02341
G1 X49.84 Y111.284 E1.00646
G1 X49.84 Y111.932 E.02341
G1 X30.16 Y92.251 E1.00646
G1 X30.16 Y92.899 E.02341
G1 X49.84 Y112.579 E1.00646
G1 X49.84 Y113.226 E.02341
G1 X30.16 Y93.546 E1.00646
G1 X30.16 Y94.193 E.02341
G1 X49.84 Y113.874 E1.00646
G1 X49.84 Y114.521 E.02341
G1 X30.16 Y94.841 E1.00646
G1 X30.16 Y95.488 E.02341
G1 X49.84 Y115.169 E1.00646
G1 X49.84 Y115.816 E.02341
G1 X30.16 Y96.136 E1.00646
G1 X30.16 Y96.783 E.02341
G1 X49.84 Y116.463 E1.00646
G1 X49.84 Y117.111 E.02341
G1 X30.16 Y97.43 E1.00646
G1 X30.16 Y98.078 E.02341
G1 X49.84 Y117.758 E1.00646
G1 X49.84 Y118.406 E.02341
G1 X30.16 Y98.725 E1.00646
G1 X30.16 Y99.373 E.02341
G1 X49.84 Y119.053 E1.00646
G1 X49.84 Y119.7 E.02341
G1 X30.16 Y100.02 E1.00646
G1 X30.16 Y100.667 E.02341
G1 X49.84 Y120.348 E1.00646
G1 X49.84 Y120.995 E.02341
G1 X30.16 Y101.315 E1.00646
G1 X30.16 Y101.962 E.02341
G1 X49.84 Y121.643 E1.00646
G1 X49.84 Y122.29 E.02341
G1 X30.16 Y102.609 E1.00646
G1 X30.16 Y103.257 E.02341
G1 X49.84 Y122.937 E1.00646
G1 X49.84 Y123.585 E.02341
G1 X30.16 Y103.904 E1.00646
G1 X30.16 Y104.552 E.02341
G1 X49.84 Y124.232 E1.00646
G1 X49.84 Y124.88 E.02341
G1 X30.16 Y105.199 E1.00646
G1 X30.16 Y105.846 E.02341
G1 X49.84 Y125.527 E1.00646
G1 X49.84 Y126.174 E.02341
G1 X30.16 Y106.494 E1.00646
G1 X30.16 Y107.141 E.02341
G1 X49.84 Y126.822 E1.00646
G1 X49.84 Y127.469 E.02341
G1 X30.16 Y107.789 E1.00646
G1 X30.16 Y108.436 E.02341
G1 X49.84 Y128.117 E1.00646
G1 X49.84 Y128.764 E.02341
G1 X30.16 Y109.083 E1.00646
G1 X30.16 Y109.731 E.02341
G1 X49.84 Y129.411 E1.00646
G1 X49.84 Y130.059 E.02341
G1 X30.16 Y110.378 E1.00646
G1 X30.16 Y111.026 E.02341
M73 P20 R61
G1 X41.444 Y122.31 E.5771
G3 X43.684 Y124.55 I-1.437 J3.676 E.11783
G1 X49.84 Y130.706 E.31485
G1 X49.84 Y131.354 E.02341
G1 X43.916 Y125.43 E.30296
G3 X43.957 Y126.117 I-4.04 J.582 E.02494
G1 X49.84 Y132.001 E.30089
G1 X49.84 Y132.648 E.02341
G1 X43.896 Y126.704 E.30399
G3 X43.767 Y127.222 I-5.074 J-.993 E.01931
G1 X49.84 Y133.296 E.31061
G1 X49.84 Y133.943 E.02341
G1 X43.581 Y127.684 E.32008
G3 X43.353 Y128.103 I-2.207 J-.933 E.01728
G1 X49.84 Y134.591 E.33177
G1 X49.84 Y135.238 E.02341
G1 X43.084 Y128.482 E.34549
G3 X42.779 Y128.824 I-1.858 J-1.356 E.01661
G1 X49.84 Y135.885 E.36113
G1 X49.84 Y136.533 E.02341
G1 X42.433 Y129.125 E.37883
G3 X42.048 Y129.388 I-1.501 J-1.789 E.01688
G1 X49.84 Y137.18 E.39852
G1 X49.84 Y137.828 E.02341
G1 X41.622 Y129.61 E.42027
G3 X41.153 Y129.788 I-1.121 J-2.25 E.01819
G1 X49.84 Y138.475 E.44428
G1 X49.84 Y139.122 E.02341
G1 X40.628 Y129.91 E.47113
G3 X40.028 Y129.958 I-.541 J-2.97 E.02177
G1 X49.84 Y139.77 E.50177
G1 X49.84 Y140.417 E.02341
G1 X39.055 Y129.631 E.55158
; WIPE_START
G1 X40.469 Y131.046 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X40.783 Y123.42 Z.6 F30000
G1 X40.827 Y122.34 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X30.16 Y111.673 E.54553
G1 X30.16 Y112.32 E.02341
G1 X39.88 Y122.04 E.49708
G2 X39.297 Y122.106 I.046 J3.044 E.02122
G1 X30.16 Y112.968 E.4673
G1 X30.16 Y113.615 E.02341
G1 X38.777 Y122.233 E.4407
G2 X38.314 Y122.417 I1.994 J5.69 E.01803
G1 X30.16 Y114.263 E.41701
G1 X30.16 Y114.91 E.02341
G1 X37.897 Y122.647 E.39568
G2 X37.519 Y122.917 I1.159 J2.024 E.01681
G1 X30.16 Y115.557 E.37635
G1 X30.16 Y116.205 E.02341
G1 X37.179 Y123.224 E.35894
G2 X36.875 Y123.568 I1.567 J1.69 E.01661
G1 X30.16 Y116.852 E.34342
G1 X30.16 Y117.5 E.02341
G1 X36.61 Y123.95 E.32987
G2 X36.389 Y124.377 I2.019 J1.314 E.0174
G1 X30.16 Y118.147 E.31859
G1 X30.16 Y118.794 E.02341
G1 X36.214 Y124.848 E.3096
G2 X36.089 Y125.372 I2.554 J.883 E.01948
G1 X30.16 Y119.442 E.30325
G1 X30.16 Y120.089 E.02341
G1 X36.043 Y125.972 E.30085
G2 X36.099 Y126.676 I4.228 J.014 E.02557
G1 X30.16 Y120.737 E.30374
G1 X30.16 Y121.384 E.02341
G1 X36.383 Y127.607 E.31824
G2 X38.398 Y129.623 I3.643 J-1.628 E.10541
G1 X49.84 Y141.065 E.58513
G1 X49.84 Y141.712 E.02341
G1 X30.16 Y122.031 E1.00646
G1 X30.16 Y122.679 E.02341
G1 X49.84 Y142.359 E1.00646
G1 X49.84 Y143.007 E.02341
G1 X30.16 Y123.326 E1.00646
G1 X30.16 Y123.974 E.02341
G1 X49.84 Y143.654 E1.00646
G1 X49.84 Y144.302 E.02341
G1 X30.16 Y124.621 E1.00646
G1 X30.16 Y125.268 E.02341
G1 X49.84 Y144.949 E1.00646
G1 X49.84 Y145.596 E.02341
G1 X30.16 Y125.916 E1.00646
G1 X30.16 Y126.563 E.02341
G1 X49.84 Y146.244 E1.00646
G1 X49.84 Y146.891 E.02341
G1 X30.16 Y127.211 E1.00646
G1 X30.16 Y127.858 E.02341
G1 X49.84 Y147.539 E1.00646
G1 X49.84 Y148.186 E.02341
G1 X30.16 Y128.505 E1.00646
G1 X30.16 Y129.153 E.02341
G1 X49.84 Y148.833 E1.00646
G1 X49.84 Y149.481 E.02341
G1 X30.16 Y129.8 E1.00646
M73 P20 R60
G1 X30.16 Y130.448 E.02341
G1 X49.84 Y150.128 E1.00646
G1 X49.84 Y150.776 E.02341
G1 X30.16 Y131.095 E1.00646
G1 X30.16 Y131.742 E.02341
G1 X49.84 Y151.423 E1.00646
G1 X49.84 Y152.07 E.02341
G1 X30.16 Y132.39 E1.00646
G1 X30.16 Y133.037 E.02341
G1 X49.84 Y152.718 E1.00646
G1 X49.84 Y153.365 E.02341
G1 X30.16 Y133.685 E1.00646
G1 X30.16 Y134.332 E.02341
G1 X49.84 Y154.013 E1.00646
G1 X49.84 Y154.66 E.02341
G1 X30.16 Y134.979 E1.00646
G1 X30.16 Y135.627 E.02341
G1 X49.84 Y155.307 E1.00646
G1 X49.84 Y155.955 E.02341
G1 X30.16 Y136.274 E1.00646
G1 X30.16 Y136.922 E.02341
G1 X49.84 Y156.602 E1.00646
G1 X49.84 Y157.25 E.02341
G1 X30.16 Y137.569 E1.00646
G1 X30.16 Y138.216 E.02341
G1 X49.84 Y157.897 E1.00646
G1 X49.84 Y158.544 E.02341
G1 X30.16 Y138.864 E1.00646
G1 X30.16 Y139.511 E.02341
G1 X49.84 Y159.192 E1.00646
G1 X49.84 Y159.839 E.02341
G1 X30.16 Y140.159 E1.00646
G1 X30.16 Y140.806 E.02341
G1 X49.84 Y160.487 E1.00646
G1 X49.84 Y161.134 E.02341
G1 X30.16 Y141.453 E1.00646
G1 X30.16 Y142.101 E.02341
G1 X49.84 Y161.781 E1.00646
G1 X49.84 Y162.429 E.02341
G1 X30.16 Y142.748 E1.00646
G1 X30.16 Y143.396 E.02341
G1 X49.84 Y163.076 E1.00646
G1 X49.84 Y163.724 E.02341
G1 X30.16 Y144.043 E1.00646
G1 X30.16 Y144.69 E.02341
G1 X49.84 Y164.371 E1.00646
G1 X49.84 Y165.018 E.02341
G1 X30.16 Y145.338 E1.00646
G1 X30.16 Y145.985 E.02341
G1 X49.84 Y165.666 E1.00646
G1 X49.84 Y166.313 E.02341
G1 X30.16 Y146.633 E1.00646
G1 X30.16 Y147.28 E.02341
G1 X49.84 Y166.961 E1.00646
G1 X49.84 Y167.608 E.02341
G1 X30.16 Y147.927 E1.00646
G1 X30.16 Y148.575 E.02341
G1 X49.84 Y168.255 E1.00646
G1 X49.84 Y168.903 E.02341
G1 X30.16 Y149.222 E1.00646
G1 X30.16 Y149.87 E.02341
G1 X49.84 Y169.55 E1.00646
G1 X49.84 Y170.198 E.02341
G1 X30.16 Y150.517 E1.00646
G1 X30.16 Y151.164 E.02341
G1 X49.84 Y170.845 E1.00646
G1 X49.84 Y171.492 E.02341
G1 X30.16 Y151.812 E1.00646
G1 X30.16 Y152.459 E.02341
G1 X49.84 Y172.14 E1.00646
G1 X49.84 Y172.787 E.02341
G1 X30.16 Y153.107 E1.00646
G1 X30.16 Y153.754 E.02341
G1 X49.84 Y173.435 E1.00646
G1 X49.84 Y174.082 E.02341
G1 X30.16 Y154.401 E1.00646
G1 X30.16 Y155.049 E.02341
G1 X49.84 Y174.729 E1.00646
G1 X49.84 Y175.377 E.02341
G1 X30.16 Y155.696 E1.00646
G1 X30.16 Y156.344 E.02341
G1 X49.84 Y176.024 E1.00646
G1 X49.84 Y176.672 E.02341
G1 X30.16 Y156.991 E1.00646
G1 X30.16 Y157.638 E.02341
G1 X49.84 Y177.319 E1.00646
G1 X49.84 Y177.966 E.02341
G1 X30.16 Y158.286 E1.00646
G1 X30.16 Y158.933 E.02341
G1 X49.84 Y178.614 E1.00646
G1 X49.84 Y179.261 E.02341
G1 X30.16 Y159.581 E1.00646
G1 X30.16 Y160.228 E.02341
G1 X49.84 Y179.909 E1.00646
G1 X49.84 Y180.556 E.02341
G1 X30.16 Y160.875 E1.00646
G1 X30.16 Y161.523 E.02341
G1 X49.84 Y181.203 E1.00646
G1 X49.84 Y181.851 E.02341
G1 X30.16 Y162.17 E1.00646
G1 X30.16 Y162.818 E.02341
G1 X49.84 Y182.498 E1.00646
G1 X49.84 Y183.146 E.02341
G1 X30.16 Y163.465 E1.00646
G1 X30.16 Y164.112 E.02341
G1 X49.84 Y183.793 E1.00646
G1 X49.84 Y184.44 E.02341
G1 X30.16 Y164.76 E1.00646
G1 X30.16 Y165.407 E.02341
G1 X49.84 Y185.088 E1.00646
G1 X49.84 Y185.735 E.02341
G1 X30.16 Y166.055 E1.00646
G1 X30.16 Y166.702 E.02341
G1 X49.84 Y186.383 E1.00646
G1 X49.84 Y187.03 E.02341
G1 X30.16 Y167.349 E1.00646
G1 X30.16 Y167.997 E.02341
G1 X49.84 Y187.677 E1.00646
G1 X49.84 Y188.325 E.02341
G1 X30.16 Y168.644 E1.00646
G1 X30.16 Y169.292 E.02341
G1 X49.84 Y188.972 E1.00646
G1 X49.84 Y189.62 E.02341
G1 X30.16 Y169.939 E1.00646
G1 X30.16 Y170.586 E.02341
G1 X49.84 Y190.267 E1.00646
M73 P21 R60
G1 X49.84 Y190.914 E.02341
G1 X30.16 Y171.234 E1.00646
G1 X30.16 Y171.881 E.02341
G1 X49.84 Y191.562 E1.00646
G1 X49.84 Y192.209 E.02341
G1 X30.16 Y172.529 E1.00646
G1 X30.16 Y173.176 E.02341
G1 X49.84 Y192.857 E1.00646
G1 X49.84 Y193.504 E.02341
G1 X30.16 Y173.823 E1.00646
G1 X30.16 Y174.471 E.02341
G1 X49.84 Y194.151 E1.00646
G1 X49.84 Y194.799 E.02341
G1 X30.16 Y175.118 E1.00646
G1 X30.16 Y175.766 E.02341
G1 X49.84 Y195.446 E1.00646
G1 X49.84 Y196.094 E.02341
G1 X30.16 Y176.413 E1.00646
G1 X30.16 Y177.06 E.02341
G1 X50.046 Y196.947 E1.01698
; WIPE_START
G1 X48.632 Y195.532 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X54.325 Y190.449 Z.6 F30000
G1 X205.954 Y55.051 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X225.84 Y74.938 E1.01698
G1 X225.84 Y75.585 E.02341
G1 X206.16 Y55.904 E1.00646
G1 X206.16 Y56.552 E.02341
G1 X225.84 Y76.232 E1.00646
G1 X225.84 Y76.88 E.02341
G1 X206.16 Y57.199 E1.00646
G1 X206.16 Y57.847 E.02341
G1 X225.84 Y77.527 E1.00646
G1 X225.84 Y78.175 E.02341
G1 X206.16 Y58.494 E1.00646
G1 X206.16 Y59.141 E.02341
G1 X225.84 Y78.822 E1.00646
G1 X225.84 Y79.469 E.02341
G1 X206.16 Y59.789 E1.00646
G1 X206.16 Y60.436 E.02341
G1 X225.84 Y80.117 E1.00646
G1 X225.84 Y80.764 E.02341
G1 X206.16 Y61.084 E1.00646
G1 X206.16 Y61.731 E.02341
G1 X225.84 Y81.412 E1.00646
G1 X225.84 Y82.059 E.02341
G1 X206.16 Y62.378 E1.00646
G1 X206.16 Y63.026 E.02341
G1 X225.84 Y82.706 E1.00646
G1 X225.84 Y83.354 E.02341
G1 X206.16 Y63.673 E1.00646
G1 X206.16 Y64.321 E.02341
G1 X225.84 Y84.001 E1.00646
G1 X225.84 Y84.649 E.02341
G1 X206.16 Y64.968 E1.00646
G1 X206.16 Y65.615 E.02341
G1 X225.84 Y85.296 E1.00646
G1 X225.84 Y85.943 E.02341
G1 X206.16 Y66.263 E1.00646
G1 X206.16 Y66.91 E.02341
G1 X225.84 Y86.591 E1.00646
G1 X225.84 Y87.238 E.02341
G1 X206.16 Y67.558 E1.00646
G1 X206.16 Y68.205 E.02341
G1 X225.84 Y87.885 E1.00646
G1 X225.84 Y88.533 E.02341
G1 X206.16 Y68.852 E1.00646
G1 X206.16 Y69.5 E.02341
G1 X225.84 Y89.18 E1.00646
G1 X225.84 Y89.828 E.02341
G1 X206.16 Y70.147 E1.00646
G1 X206.16 Y70.795 E.02341
G1 X225.84 Y90.475 E1.00646
G1 X225.84 Y91.122 E.02341
G1 X206.16 Y71.442 E1.00646
G1 X206.16 Y72.089 E.02341
G1 X225.84 Y91.77 E1.00646
G1 X225.84 Y92.417 E.02341
G1 X206.16 Y72.737 E1.00646
G1 X206.16 Y73.384 E.02341
G1 X225.84 Y93.065 E1.00646
G1 X225.84 Y93.712 E.02341
G1 X206.16 Y74.032 E1.00646
G1 X206.16 Y74.679 E.02341
G1 X225.84 Y94.359 E1.00646
G1 X225.84 Y95.007 E.02341
G1 X206.16 Y75.326 E1.00646
G1 X206.16 Y75.974 E.02341
G1 X225.84 Y95.654 E1.00646
G1 X225.84 Y96.302 E.02341
G1 X206.16 Y76.621 E1.00646
G1 X206.16 Y77.269 E.02341
G1 X225.84 Y96.949 E1.00646
G1 X225.84 Y97.596 E.02341
G1 X206.16 Y77.916 E1.00646
G1 X206.16 Y78.563 E.02341
G1 X225.84 Y98.244 E1.00646
G1 X225.84 Y98.891 E.02341
G1 X206.16 Y79.211 E1.00646
G1 X206.16 Y79.858 E.02341
G1 X225.84 Y99.539 E1.00646
G1 X225.84 Y100.186 E.02341
G1 X206.16 Y80.506 E1.00646
G1 X206.16 Y81.153 E.02341
G1 X225.84 Y100.833 E1.00646
G1 X225.84 Y101.481 E.02341
G1 X206.16 Y81.8 E1.00646
G1 X206.16 Y82.448 E.02341
G1 X225.84 Y102.128 E1.00646
G1 X225.84 Y102.776 E.02341
G1 X206.16 Y83.095 E1.00646
G1 X206.16 Y83.743 E.02341
G1 X225.84 Y103.423 E1.00646
G1 X225.84 Y104.07 E.02341
G1 X206.16 Y84.39 E1.00646
G1 X206.16 Y85.037 E.02341
G1 X225.84 Y104.718 E1.00646
G1 X225.84 Y105.365 E.02341
G1 X206.16 Y85.685 E1.00646
G1 X206.16 Y86.332 E.02341
G1 X225.84 Y106.013 E1.00646
G1 X225.84 Y106.66 E.02341
G1 X206.16 Y86.979 E1.00646
G1 X206.16 Y87.627 E.02341
G1 X225.84 Y107.307 E1.00646
G1 X225.84 Y107.955 E.02341
G1 X206.16 Y88.274 E1.00646
G1 X206.16 Y88.922 E.02341
G1 X225.84 Y108.602 E1.00646
G1 X225.84 Y109.25 E.02341
G1 X206.16 Y89.569 E1.00646
G1 X206.16 Y90.216 E.02341
G1 X225.84 Y109.897 E1.00646
G1 X225.84 Y110.544 E.02341
G1 X206.16 Y90.864 E1.00646
G1 X206.16 Y91.511 E.02341
G1 X225.84 Y111.192 E1.00646
M73 P21 R59
G1 X225.84 Y111.839 E.02341
G1 X206.16 Y92.159 E1.00646
G1 X206.16 Y92.806 E.02341
G1 X225.84 Y112.487 E1.00646
G1 X225.84 Y113.134 E.02341
G1 X206.16 Y93.453 E1.00646
G1 X206.16 Y94.101 E.02341
G1 X225.84 Y113.781 E1.00646
G1 X225.84 Y114.429 E.02341
G1 X206.16 Y94.748 E1.00646
G1 X206.16 Y95.396 E.02341
G1 X225.84 Y115.076 E1.00646
G1 X225.84 Y115.724 E.02341
G1 X206.16 Y96.043 E1.00646
G1 X206.16 Y96.69 E.02341
G1 X225.84 Y116.371 E1.00646
G1 X225.84 Y117.018 E.02341
G1 X206.16 Y97.338 E1.00646
G1 X206.16 Y97.985 E.02341
G1 X225.84 Y117.666 E1.00646
G1 X225.84 Y118.313 E.02341
G1 X206.16 Y98.633 E1.00646
G1 X206.16 Y99.28 E.02341
G1 X225.84 Y118.961 E1.00646
G1 X225.84 Y119.608 E.02341
G1 X206.16 Y99.927 E1.00646
G1 X206.16 Y100.575 E.02341
G1 X225.84 Y120.255 E1.00646
G1 X225.84 Y120.903 E.02341
G1 X206.16 Y101.222 E1.00646
G1 X206.16 Y101.87 E.02341
G1 X225.84 Y121.55 E1.00646
G1 X225.84 Y122.198 E.02341
G1 X206.16 Y102.517 E1.00646
G1 X206.16 Y103.164 E.02341
G1 X225.84 Y122.845 E1.00646
G1 X225.84 Y123.492 E.02341
G1 X206.16 Y103.812 E1.00646
G1 X206.16 Y104.459 E.02341
G1 X225.84 Y124.14 E1.00646
G1 X225.84 Y124.787 E.02341
G1 X206.16 Y105.107 E1.00646
G1 X206.16 Y105.754 E.02341
G1 X225.84 Y125.435 E1.00646
G1 X225.84 Y126.082 E.02341
G1 X206.16 Y106.401 E1.00646
G1 X206.16 Y107.049 E.02341
G1 X225.84 Y126.729 E1.00646
G1 X225.84 Y127.377 E.02341
G1 X206.16 Y107.696 E1.00646
G1 X206.16 Y108.344 E.02341
G1 X225.84 Y128.024 E1.00646
G1 X225.84 Y128.672 E.02341
G1 X206.16 Y108.991 E1.00646
G1 X206.16 Y109.638 E.02341
G1 X225.84 Y129.319 E1.00646
M73 P22 R59
G1 X225.84 Y129.966 E.02341
G1 X206.16 Y110.286 E1.00646
G1 X206.16 Y110.933 E.02341
G1 X217.612 Y122.386 E.58568
G3 X219.618 Y124.391 I-1.569 J3.574 E.10496
G1 X225.84 Y130.614 E.31822
G1 X225.84 Y131.261 E.02341
G1 X219.9 Y125.321 E.3038
G3 X219.961 Y126.029 I-4.88 J.778 E.02574
G1 X225.84 Y131.909 E.30067
G1 X225.84 Y132.556 E.02341
G1 X219.908 Y126.624 E.30337
G3 X219.79 Y127.153 I-2.703 J-.325 E.01964
G1 X225.84 Y133.203 E.30941
G1 X225.84 Y133.851 E.02341
G1 X219.611 Y127.622 E.31854
G3 X219.388 Y128.046 I-2.23 J-.905 E.01736
G1 X225.84 Y134.498 E.32998
G1 X225.84 Y135.146 E.02341
G1 X219.124 Y128.43 E.34345
G3 X218.823 Y128.776 I-1.88 J-1.331 E.01662
G1 X225.84 Y135.793 E.35886
G1 X225.84 Y136.44 E.02341
G1 X218.485 Y129.085 E.37615
G3 X218.106 Y129.354 I-4.815 J-6.391 E.01679
G1 X225.84 Y137.088 E.39552
G1 X225.84 Y137.735 E.02341
G1 X217.686 Y129.581 E.41701
G3 X217.222 Y129.764 I-1.147 J-2.222 E.01807
G1 X225.84 Y138.383 E.44074
G1 X225.84 Y139.03 E.02341
G1 X216.708 Y129.898 E.46703
G3 X216.119 Y129.956 I-.806 J-5.152 E.02142
G1 X225.84 Y139.677 E.49716
G1 X225.84 Y140.325 E.02341
G1 X215.181 Y129.665 E.54513
; WIPE_START
G1 X216.595 Y131.079 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X216.903 Y123.453 Z.6 F30000
G1 X216.947 Y122.368 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X206.16 Y111.581 E.55165
G1 X206.16 Y112.228 E.02341
G1 X215.972 Y122.041 E.50181
G2 X215.376 Y122.092 I.08 J4.416 E.02165
G1 X206.16 Y112.875 E.47133
G1 X206.16 Y113.523 E.02341
G1 X214.849 Y122.213 E.44439
G2 X214.376 Y122.386 I.629 J2.45 E.01828
G1 X206.16 Y114.17 E.42016
G1 X206.16 Y114.818 E.02341
G1 X213.953 Y122.611 E.39855
G2 X213.57 Y122.876 I1.131 J2.044 E.01685
G1 X206.16 Y115.465 E.37898
G1 X206.16 Y116.112 E.02341
G1 X213.225 Y123.178 E.36134
G2 X212.917 Y123.517 I1.545 J1.714 E.0166
G1 X206.16 Y116.76 E.34557
G1 X206.16 Y117.407 E.02341
G1 X212.646 Y123.894 E.33172
G2 X212.417 Y124.312 I5.995 J3.561 E.01725
G1 X206.16 Y118.055 E.31999
G1 X206.16 Y118.702 E.02341
G1 X212.236 Y124.778 E.31072
G2 X212.105 Y125.295 I2.52 J.911 E.01931
G1 X206.16 Y119.349 E.30404
G1 X206.16 Y119.997 E.02341
G1 X212.043 Y125.88 E.30085
G2 X212.079 Y126.564 I3.436 J.159 E.02481
G1 X206.16 Y120.644 E.30272
G1 X206.16 Y121.292 E.02341
G1 X212.315 Y127.447 E.3148
G2 X214.551 Y129.683 I3.688 J-1.453 E.11758
G1 X225.84 Y140.972 E.57735
G1 X225.84 Y141.62 E.02341
G1 X206.16 Y121.939 E1.00646
G1 X206.16 Y122.586 E.02341
G1 X225.84 Y142.267 E1.00646
G1 X225.84 Y142.914 E.02341
G1 X206.16 Y123.234 E1.00646
G1 X206.16 Y123.881 E.02341
G1 X225.84 Y143.562 E1.00646
G1 X225.84 Y144.209 E.02341
G1 X206.16 Y124.529 E1.00646
G1 X206.16 Y125.176 E.02341
G1 X225.84 Y144.857 E1.00646
G1 X225.84 Y145.504 E.02341
G1 X206.16 Y125.823 E1.00646
G1 X206.16 Y126.471 E.02341
G1 X225.84 Y146.151 E1.00646
G1 X225.84 Y146.799 E.02341
G1 X206.16 Y127.118 E1.00646
G1 X206.16 Y127.766 E.02341
G1 X225.84 Y147.446 E1.00646
G1 X225.84 Y148.094 E.02341
G1 X206.16 Y128.413 E1.00646
G1 X206.16 Y129.06 E.02341
G1 X225.84 Y148.741 E1.00646
G1 X225.84 Y149.388 E.02341
G1 X206.16 Y129.708 E1.00646
G1 X206.16 Y130.355 E.02341
G1 X225.84 Y150.036 E1.00646
G1 X225.84 Y150.683 E.02341
G1 X206.16 Y131.003 E1.00646
G1 X206.16 Y131.65 E.02341
G1 X225.84 Y151.331 E1.00646
G1 X225.84 Y151.978 E.02341
G1 X206.16 Y132.297 E1.00646
G1 X206.16 Y132.945 E.02341
G1 X225.84 Y152.625 E1.00646
G1 X225.84 Y153.273 E.02341
G1 X206.16 Y133.592 E1.00646
G1 X206.16 Y134.24 E.02341
G1 X225.84 Y153.92 E1.00646
G1 X225.84 Y154.568 E.02341
G1 X206.16 Y134.887 E1.00646
G1 X206.16 Y135.534 E.02341
G1 X225.84 Y155.215 E1.00646
G1 X225.84 Y155.862 E.02341
G1 X206.16 Y136.182 E1.00646
G1 X206.16 Y136.829 E.02341
G1 X225.84 Y156.51 E1.00646
G1 X225.84 Y157.157 E.02341
G1 X206.16 Y137.477 E1.00646
G1 X206.16 Y138.124 E.02341
G1 X225.84 Y157.805 E1.00646
G1 X225.84 Y158.452 E.02341
G1 X206.16 Y138.771 E1.00646
G1 X206.16 Y139.419 E.02341
G1 X225.84 Y159.099 E1.00646
G1 X225.84 Y159.747 E.02341
G1 X206.16 Y140.066 E1.00646
G1 X206.16 Y140.714 E.02341
G1 X225.84 Y160.394 E1.00646
G1 X225.84 Y161.042 E.02341
G1 X206.16 Y141.361 E1.00646
G1 X206.16 Y142.008 E.02341
G1 X225.84 Y161.689 E1.00646
G1 X225.84 Y162.336 E.02341
G1 X206.16 Y142.656 E1.00646
G1 X206.16 Y143.303 E.02341
G1 X225.84 Y162.984 E1.00646
G1 X225.84 Y163.631 E.02341
G1 X206.16 Y143.951 E1.00646
G1 X206.16 Y144.598 E.02341
G1 X225.84 Y164.279 E1.00646
G1 X225.84 Y164.926 E.02341
G1 X206.16 Y145.245 E1.00646
G1 X206.16 Y145.893 E.02341
G1 X225.84 Y165.573 E1.00646
G1 X225.84 Y166.221 E.02341
G1 X206.16 Y146.54 E1.00646
G1 X206.16 Y147.188 E.02341
G1 X225.84 Y166.868 E1.00646
G1 X225.84 Y167.516 E.02341
G1 X206.16 Y147.835 E1.00646
G1 X206.16 Y148.482 E.02341
G1 X225.84 Y168.163 E1.00646
G1 X225.84 Y168.81 E.02341
G1 X206.16 Y149.13 E1.00646
G1 X206.16 Y149.777 E.02341
G1 X225.84 Y169.458 E1.00646
G1 X225.84 Y170.105 E.02341
G1 X206.16 Y150.425 E1.00646
G1 X206.16 Y151.072 E.02341
G1 X225.84 Y170.753 E1.00646
G1 X225.84 Y171.4 E.02341
G1 X206.16 Y151.719 E1.00646
G1 X206.16 Y152.367 E.02341
G1 X225.84 Y172.047 E1.00646
G1 X225.84 Y172.695 E.02341
G1 X206.16 Y153.014 E1.00646
G1 X206.16 Y153.662 E.02341
G1 X225.84 Y173.342 E1.00646
G1 X225.84 Y173.99 E.02341
G1 X206.16 Y154.309 E1.00646
G1 X206.16 Y154.956 E.02341
G1 X225.84 Y174.637 E1.00646
G1 X225.84 Y175.284 E.02341
G1 X206.16 Y155.604 E1.00646
G1 X206.16 Y156.251 E.02341
G1 X225.84 Y175.932 E1.00646
G1 X225.84 Y176.579 E.02341
G1 X206.16 Y156.899 E1.00646
G1 X206.16 Y157.546 E.02341
G1 X225.84 Y177.227 E1.00646
G1 X225.84 Y177.874 E.02341
G1 X206.16 Y158.193 E1.00646
G1 X206.16 Y158.841 E.02341
G1 X225.84 Y178.521 E1.00646
G1 X225.84 Y179.169 E.02341
G1 X206.16 Y159.488 E1.00646
G1 X206.16 Y160.136 E.02341
G1 X225.84 Y179.816 E1.00646
G1 X225.84 Y180.464 E.02341
G1 X206.16 Y160.783 E1.00646
G1 X206.16 Y161.43 E.02341
G1 X225.84 Y181.111 E1.00646
G1 X225.84 Y181.758 E.02341
G1 X206.16 Y162.078 E1.00646
G1 X206.16 Y162.725 E.02341
G1 X225.84 Y182.406 E1.00646
G1 X225.84 Y183.053 E.02341
G1 X206.16 Y163.373 E1.00646
G1 X206.16 Y164.02 E.02341
G1 X225.84 Y183.701 E1.00646
G1 X225.84 Y184.348 E.02341
G1 X206.16 Y164.667 E1.00646
G1 X206.16 Y165.315 E.02341
G1 X225.84 Y184.995 E1.00646
G1 X225.84 Y185.643 E.02341
G1 X206.16 Y165.962 E1.00646
G1 X206.16 Y166.61 E.02341
G1 X225.84 Y186.29 E1.00646
G1 X225.84 Y186.937 E.02341
G1 X206.16 Y167.257 E1.00646
G1 X206.16 Y167.904 E.02341
G1 X225.84 Y187.585 E1.00646
G1 X225.84 Y188.232 E.02341
G1 X206.16 Y168.552 E1.00646
G1 X206.16 Y169.199 E.02341
G1 X225.84 Y188.88 E1.00646
G1 X225.84 Y189.527 E.02341
G1 X206.16 Y169.847 E1.00646
M73 P23 R59
G1 X206.16 Y170.494 E.02341
G1 X225.84 Y190.174 E1.00646
M73 P23 R58
G1 X225.84 Y190.822 E.02341
G1 X206.16 Y171.141 E1.00646
G1 X206.16 Y171.789 E.02341
G1 X225.84 Y191.469 E1.00646
G1 X225.84 Y192.117 E.02341
G1 X206.16 Y172.436 E1.00646
G1 X206.16 Y173.084 E.02341
G1 X225.84 Y192.764 E1.00646
G1 X225.84 Y193.411 E.02341
G1 X206.16 Y173.731 E1.00646
G1 X206.16 Y174.378 E.02341
G1 X225.84 Y194.059 E1.00646
G1 X225.84 Y194.706 E.02341
G1 X206.16 Y175.026 E1.00646
G1 X206.16 Y175.673 E.02341
G1 X225.84 Y195.354 E1.00646
G1 X225.84 Y196.001 E.02341
G1 X206.16 Y176.321 E1.00646
G1 X206.16 Y176.968 E.02341
G1 X225.84 Y196.648 E1.00646
G1 X225.84 Y197.296 E.02341
G1 X206.16 Y177.615 E1.00646
G1 X206.16 Y178.263 E.02341
G1 X225.84 Y197.943 E1.00646
G1 X225.84 Y198.591 E.02341
G1 X206.16 Y178.91 E1.00646
G1 X206.16 Y179.558 E.02341
G1 X225.84 Y199.238 E1.00646
G1 X225.84 Y199.885 E.02341
G1 X206.16 Y180.205 E1.00646
G1 X206.16 Y180.852 E.02341
G1 X225.84 Y200.533 E1.00646
G1 X225.84 Y201.18 E.02341
G1 X206.16 Y181.5 E1.00646
G1 X206.16 Y182.147 E.02341
G1 X225.84 Y201.828 E1.00646
G1 X225.84 Y202.475 E.02341
G1 X206.16 Y182.795 E1.00646
G1 X206.16 Y183.442 E.02341
G1 X225.84 Y203.122 E1.00646
G1 X225.84 Y203.77 E.02341
G1 X206.16 Y184.089 E1.00646
G1 X206.16 Y184.737 E.02341
G1 X225.84 Y204.417 E1.00646
G1 X225.84 Y205.065 E.02341
G1 X206.16 Y185.384 E1.00646
G1 X206.16 Y186.031 E.02341
G1 X225.84 Y205.712 E1.00646
G1 X225.84 Y206.359 E.02341
G1 X206.16 Y186.679 E1.00646
G1 X206.16 Y187.326 E.02341
G1 X225.84 Y207.007 E1.00646
G1 X225.84 Y207.654 E.02341
G1 X206.16 Y187.974 E1.00646
G1 X206.16 Y188.621 E.02341
G1 X225.84 Y208.302 E1.00646
G1 X225.84 Y208.949 E.02341
G1 X206.16 Y189.268 E1.00646
G1 X206.16 Y189.916 E.02341
G1 X225.84 Y209.596 E1.00646
G1 X225.84 Y210.244 E.02341
G1 X206.16 Y190.563 E1.00646
G1 X206.16 Y191.211 E.02341
G1 X225.84 Y210.891 E1.00646
G1 X225.84 Y211.539 E.02341
G1 X206.16 Y191.858 E1.00646
G1 X206.16 Y192.505 E.02341
G1 X225.84 Y212.186 E1.00646
G1 X225.84 Y212.833 E.02341
G1 X219.811 Y206.804 E.30833
G3 X219.948 Y207.589 I-4.05 J1.111 E.02884
G1 X225.84 Y213.481 E.30132
G1 X225.84 Y214.128 E.02341
G1 X219.945 Y208.233 E.30151
G3 X219.852 Y208.787 I-5.044 J-.561 E.02034
G1 X225.84 Y214.776 E.30626
G1 X225.84 Y215.423 E.02341
G1 X219.699 Y209.282 E.31405
G3 X219.499 Y209.729 I-2.337 J-.776 E.01775
G1 X225.84 Y216.07 E.32427
G1 X225.84 Y216.718 E.02341
G1 X219.255 Y210.132 E.33678
G3 X218.969 Y210.494 I-1.947 J-1.246 E.01669
G1 X225.84 Y217.365 E.35141
G1 X225.84 Y217.715 E.01266
G1 X225.543 Y217.715 E.01075
G1 X218.646 Y210.818 E.35272
G3 X218.286 Y211.106 I-1.615 J-1.653 E.01669
G1 X224.896 Y217.715 E.33802
G1 X224.248 Y217.715 E.02341
G1 X217.888 Y211.355 E.32527
G3 X217.449 Y211.563 I-1.255 J-2.079 E.01761
G1 X223.601 Y217.715 E.31462
G1 X222.953 Y217.715 E.02341
G1 X216.954 Y211.716 E.30678
G3 X216.404 Y211.813 I-.758 J-2.707 E.02026
G1 X222.306 Y217.715 E.30185
G1 X221.659 Y217.715 E.02341
G1 X215.77 Y211.826 E.30116
G3 X215.001 Y211.705 I.253 J-4.097 E.02818
G1 X221.217 Y217.921 E.31788
; WIPE_START
G1 X219.803 Y216.507 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X218.316 Y209.021 Z.6 F30000
G1 X217.395 Y204.389 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X206.16 Y193.153 E.57459
G1 X206.16 Y193.8 E.02341
G1 X216.283 Y203.923 E.51769
G2 X215.645 Y203.933 I-.27 J3.188 E.0231
G1 X206.16 Y194.448 E.48508
G1 X206.16 Y195.095 E.02341
G1 X215.086 Y204.021 E.45648
G2 X214.593 Y204.176 I.525 J2.534 E.0187
G1 X206.16 Y195.742 E.43128
G1 X206.16 Y196.39 E.02341
G1 X214.147 Y204.378 E.40849
G2 X213.744 Y204.621 I1.017 J2.141 E.01708
G1 X206.16 Y197.037 E.38784
G1 X206.16 Y197.685 E.02341
G1 X213.378 Y204.904 E.36917
G2 X213.055 Y205.228 I1.459 J1.779 E.01656
G1 X205.862 Y198.035 E.36785
G1 X205.215 Y198.035 E.02341
G1 X212.769 Y205.589 E.38631
G2 X212.521 Y205.988 I1.878 J1.442 E.01703
G1 X204.568 Y198.035 E.40675
G1 X203.92 Y198.035 E.02341
G1 X212.315 Y206.429 E.4293
G2 X212.156 Y206.918 I5.644 J2.104 E.01858
G1 X203.273 Y198.035 E.45428
G1 X202.625 Y198.035 E.02341
G1 X212.063 Y207.472 E.48264
G2 X212.046 Y208.102 I4.903 J.452 E.0228
G1 X201.978 Y198.035 E.51485
G1 X201.331 Y198.035 E.02341
G1 X212.481 Y209.185 E.57021
; WIPE_START
G1 X211.066 Y207.771 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X216.283 Y213.342 Z.6 F30000
G1 X220.569 Y217.921 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X200.683 Y198.035 E1.01698
G1 X200.036 Y198.035 E.02341
G1 X219.716 Y217.715 E1.00646
G1 X219.069 Y217.715 E.02341
G1 X199.388 Y198.035 E1.00646
G1 X198.741 Y198.035 E.02341
G1 X218.422 Y217.715 E1.00646
G1 X217.774 Y217.715 E.02341
G1 X198.094 Y198.035 E1.00646
G1 X197.446 Y198.035 E.02341
G1 X217.127 Y217.715 E1.00646
G1 X216.479 Y217.715 E.02341
G1 X196.799 Y198.035 E1.00646
G1 X196.151 Y198.035 E.02341
G1 X215.832 Y217.715 E1.00646
G1 X215.185 Y217.715 E.02341
G1 X195.504 Y198.035 E1.00646
G1 X194.857 Y198.035 E.02341
G1 X214.537 Y217.715 E1.00646
G1 X213.89 Y217.715 E.02341
G1 X194.209 Y198.035 E1.00646
G1 X193.562 Y198.035 E.02341
G1 X213.242 Y217.715 E1.00646
G1 X212.595 Y217.715 E.02341
G1 X192.914 Y198.035 E1.00646
G1 X192.267 Y198.035 E.02341
G1 X211.948 Y217.715 E1.00646
G1 X211.3 Y217.715 E.02341
G1 X191.62 Y198.035 E1.00646
G1 X190.972 Y198.035 E.02341
G1 X210.653 Y217.715 E1.00646
G1 X210.005 Y217.715 E.02341
G1 X190.325 Y198.035 E1.00646
G1 X189.677 Y198.035 E.02341
G1 X209.358 Y217.715 E1.00646
G1 X208.711 Y217.715 E.02341
G1 X189.03 Y198.035 E1.00646
G1 X188.383 Y198.035 E.02341
G1 X208.063 Y217.715 E1.00646
G1 X207.416 Y217.715 E.02341
G1 X187.735 Y198.035 E1.00646
G1 X187.088 Y198.035 E.02341
G1 X206.768 Y217.715 E1.00646
G1 X206.121 Y217.715 E.02341
G1 X186.44 Y198.035 E1.00646
G1 X185.793 Y198.035 E.02341
G1 X205.474 Y217.715 E1.00646
G1 X204.826 Y217.715 E.02341
G1 X185.146 Y198.035 E1.00646
G1 X184.498 Y198.035 E.02341
G1 X204.179 Y217.715 E1.00646
G1 X203.531 Y217.715 E.02341
G1 X183.851 Y198.035 E1.00646
G1 X183.203 Y198.035 E.02341
G1 X202.884 Y217.715 E1.00646
G1 X202.237 Y217.715 E.02341
G1 X182.556 Y198.035 E1.00646
G1 X181.909 Y198.035 E.02341
G1 X201.589 Y217.715 E1.00646
G1 X200.942 Y217.715 E.02341
G1 X181.261 Y198.035 E1.00646
G1 X180.614 Y198.035 E.02341
G1 X200.294 Y217.715 E1.00646
G1 X199.647 Y217.715 E.02341
G1 X179.966 Y198.035 E1.00646
G1 X179.319 Y198.035 E.02341
G1 X199 Y217.715 E1.00646
G1 X198.352 Y217.715 E.02341
G1 X178.672 Y198.035 E1.00646
G1 X178.024 Y198.035 E.02341
G1 X197.705 Y217.715 E1.00646
G1 X197.057 Y217.715 E.02341
G1 X177.377 Y198.035 E1.00646
G1 X176.729 Y198.035 E.02341
G1 X196.41 Y217.715 E1.00646
G1 X195.763 Y217.715 E.02341
G1 X176.082 Y198.035 E1.00646
G1 X175.435 Y198.035 E.02341
G1 X195.115 Y217.715 E1.00646
G1 X194.468 Y217.715 E.02341
G1 X174.787 Y198.035 E1.00646
M73 P24 R58
G1 X174.14 Y198.035 E.02341
G1 X193.82 Y217.715 E1.00646
G1 X193.173 Y217.715 E.02341
G1 X173.492 Y198.035 E1.00646
G1 X172.845 Y198.035 E.02341
G1 X192.526 Y217.715 E1.00646
G1 X191.878 Y217.715 E.02341
G1 X172.198 Y198.035 E1.00646
G1 X171.55 Y198.035 E.02341
G1 X191.231 Y217.715 E1.00646
G1 X190.583 Y217.715 E.02341
G1 X170.903 Y198.035 E1.00646
G1 X170.255 Y198.035 E.02341
G1 X189.936 Y217.715 E1.00646
G1 X189.289 Y217.715 E.02341
G1 X169.608 Y198.035 E1.00646
G1 X168.961 Y198.035 E.02341
G1 X188.641 Y217.715 E1.00646
G1 X187.994 Y217.715 E.02341
G1 X168.313 Y198.035 E1.00646
G1 X167.666 Y198.035 E.02341
G1 X187.346 Y217.715 E1.00646
G1 X186.699 Y217.715 E.02341
G1 X167.018 Y198.035 E1.00646
G1 X166.371 Y198.035 E.02341
G1 X186.052 Y217.715 E1.00646
G1 X185.404 Y217.715 E.02341
G1 X165.724 Y198.035 E1.00646
G1 X165.076 Y198.035 E.02341
G1 X184.757 Y217.715 E1.00646
G1 X184.109 Y217.715 E.02341
G1 X164.429 Y198.035 E1.00646
G1 X163.781 Y198.035 E.02341
G1 X183.462 Y217.715 E1.00646
G1 X182.815 Y217.715 E.02341
G1 X163.134 Y198.035 E1.00646
G1 X162.487 Y198.035 E.02341
G1 X182.167 Y217.715 E1.00646
G1 X181.52 Y217.715 E.02341
G1 X161.839 Y198.035 E1.00646
G1 X161.192 Y198.035 E.02341
G1 X180.872 Y217.715 E1.00646
G1 X180.225 Y217.715 E.02341
G1 X160.544 Y198.035 E1.00646
G1 X159.897 Y198.035 E.02341
G1 X179.578 Y217.715 E1.00646
G1 X178.93 Y217.715 E.02341
G1 X159.25 Y198.035 E1.00646
G1 X158.602 Y198.035 E.02341
G1 X178.283 Y217.715 E1.00646
G1 X177.635 Y217.715 E.02341
G1 X157.955 Y198.035 E1.00646
G1 X157.307 Y198.035 E.02341
G1 X176.988 Y217.715 E1.00646
G1 X176.341 Y217.715 E.02341
G1 X156.66 Y198.035 E1.00646
G1 X156.013 Y198.035 E.02341
G1 X175.693 Y217.715 E1.00646
G1 X175.046 Y217.715 E.02341
G1 X155.365 Y198.035 E1.00646
G1 X154.718 Y198.035 E.02341
M73 P24 R57
G1 X174.398 Y217.715 E1.00646
G1 X173.751 Y217.715 E.02341
G1 X154.07 Y198.035 E1.00646
G1 X153.423 Y198.035 E.02341
G1 X173.104 Y217.715 E1.00646
G1 X172.456 Y217.715 E.02341
G1 X152.776 Y198.035 E1.00646
G1 X152.128 Y198.035 E.02341
G1 X171.809 Y217.715 E1.00646
G1 X171.161 Y217.715 E.02341
G1 X151.481 Y198.035 E1.00646
G1 X150.833 Y198.035 E.02341
G1 X170.514 Y217.715 E1.00646
G1 X169.867 Y217.715 E.02341
G1 X150.186 Y198.035 E1.00646
G1 X149.539 Y198.035 E.02341
G1 X169.219 Y217.715 E1.00646
G1 X168.572 Y217.715 E.02341
G1 X148.891 Y198.035 E1.00646
G1 X148.244 Y198.035 E.02341
G1 X167.924 Y217.715 E1.00646
G1 X167.277 Y217.715 E.02341
G1 X147.596 Y198.035 E1.00646
G1 X146.949 Y198.035 E.02341
G1 X166.63 Y217.715 E1.00646
G1 X165.982 Y217.715 E.02341
G1 X146.302 Y198.035 E1.00646
G1 X145.654 Y198.035 E.02341
G1 X165.335 Y217.715 E1.00646
G1 X164.687 Y217.715 E.02341
G1 X145.007 Y198.035 E1.00646
G1 X144.359 Y198.035 E.02341
G1 X164.04 Y217.715 E1.00646
G1 X163.393 Y217.715 E.02341
G1 X143.712 Y198.035 E1.00646
G1 X143.065 Y198.035 E.02341
G1 X162.745 Y217.715 E1.00646
G1 X162.098 Y217.715 E.02341
G1 X142.417 Y198.035 E1.00646
G1 X141.77 Y198.035 E.02341
G1 X161.45 Y217.715 E1.00646
G1 X160.803 Y217.715 E.02341
G1 X141.123 Y198.035 E1.00646
G1 X140.475 Y198.035 E.02341
G1 X160.156 Y217.715 E1.00646
G1 X159.508 Y217.715 E.02341
G1 X139.828 Y198.035 E1.00646
G1 X139.18 Y198.035 E.02341
G1 X158.861 Y217.715 E1.00646
G1 X158.213 Y217.715 E.02341
G1 X138.533 Y198.035 E1.00646
G1 X137.886 Y198.035 E.02341
G1 X157.566 Y217.715 E1.00646
G1 X156.919 Y217.715 E.02341
G1 X137.238 Y198.035 E1.00646
G1 X136.591 Y198.035 E.02341
G1 X156.271 Y217.715 E1.00646
G1 X155.624 Y217.715 E.02341
G1 X135.943 Y198.035 E1.00646
G1 X135.296 Y198.035 E.02341
G1 X154.976 Y217.715 E1.00646
G1 X154.329 Y217.715 E.02341
G1 X134.649 Y198.035 E1.00646
G1 X134.001 Y198.035 E.02341
G1 X153.682 Y217.715 E1.00646
G1 X153.034 Y217.715 E.02341
G1 X133.354 Y198.035 E1.00646
G1 X132.706 Y198.035 E.02341
G1 X152.387 Y217.715 E1.00646
G1 X151.739 Y217.715 E.02341
G1 X132.059 Y198.035 E1.00646
G1 X131.412 Y198.035 E.02341
G1 X151.092 Y217.715 E1.00646
G1 X150.445 Y217.715 E.02341
G1 X130.764 Y198.035 E1.00646
G1 X130.117 Y198.035 E.02341
G1 X149.797 Y217.715 E1.00646
G1 X149.15 Y217.715 E.02341
G1 X129.469 Y198.035 E1.00646
G1 X128.822 Y198.035 E.02341
G1 X148.502 Y217.715 E1.00646
G1 X147.855 Y217.715 E.02341
G1 X128.175 Y198.035 E1.00646
G1 X127.527 Y198.035 E.02341
G1 X147.208 Y217.715 E1.00646
G1 X146.56 Y217.715 E.02341
G1 X126.88 Y198.035 E1.00646
G1 X126.232 Y198.035 E.02341
G1 X145.913 Y217.715 E1.00646
G1 X145.266 Y217.715 E.02341
G1 X125.585 Y198.035 E1.00646
G1 X124.938 Y198.035 E.02341
G1 X144.618 Y217.715 E1.00646
G1 X143.971 Y217.715 E.02341
G1 X124.29 Y198.035 E1.00646
G1 X123.643 Y198.035 E.02341
G1 X143.323 Y217.715 E1.00646
G1 X142.676 Y217.715 E.02341
G1 X131.827 Y206.866 E.55481
G3 X131.951 Y207.637 I-3.866 J1.015 E.02828
G1 X142.029 Y217.715 E.51539
G1 X141.381 Y217.715 E.02341
G1 X131.942 Y208.276 E.48273
G3 X131.842 Y208.824 I-2.793 J-.225 E.02017
G1 X140.734 Y217.715 E.45471
G1 X140.086 Y217.715 E.02341
G1 X131.687 Y209.316 E.42954
G3 X131.484 Y209.761 I-2.324 J-.79 E.0177
G1 X139.439 Y217.715 E.40679
G1 X138.792 Y217.715 E.02341
G1 X131.235 Y210.159 E.38645
G3 X130.947 Y210.518 I-1.937 J-1.26 E.01668
G1 X138.144 Y217.715 E.36808
G1 X137.497 Y217.715 E.02341
G1 X130.621 Y210.84 E.35161
G3 X130.259 Y211.125 I-1.604 J-1.666 E.0167
G1 X136.849 Y217.715 E.33703
G1 X136.202 Y217.715 E.02341
G1 X129.858 Y211.372 E.32441
G3 X129.414 Y211.575 I-2.889 J-5.736 E.01767
G1 X135.555 Y217.715 E.31402
G1 X134.907 Y217.715 E.02341
G1 X128.917 Y211.725 E.30634
G3 X128.362 Y211.818 I-.742 J-2.728 E.02036
G1 X134.26 Y217.715 E.30159
G1 X133.612 Y217.715 E.02341
G1 X127.72 Y211.823 E.30135
G3 X126.937 Y211.687 I.282 J-3.959 E.02878
G1 X133.171 Y217.921 E.31881
; WIPE_START
G1 X131.756 Y216.507 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X130.256 Y209.023 Z.6 F30000
G1 X129.322 Y204.361 Z.6
M73 P25 R57
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X122.995 Y198.035 E.32354
G1 X122.348 Y198.035 E.02341
G1 X128.235 Y203.922 E.30108
G2 X127.602 Y203.936 I-.246 J3.165 E.02294
G1 X121.701 Y198.035 E.3018
G1 X121.053 Y198.035 E.02341
G1 X127.05 Y204.031 E.30666
G2 X126.56 Y204.189 I.542 J2.524 E.01864
G1 X120.406 Y198.035 E.31472
G1 X119.758 Y198.035 E.02341
G1 X126.117 Y204.393 E.32517
G2 X125.716 Y204.639 I1.029 J2.128 E.01705
G1 X119.111 Y198.035 E.33776
G1 X118.464 Y198.035 E.02341
G1 X125.355 Y204.926 E.35244
G2 X125.034 Y205.253 I1.473 J1.77 E.01658
G1 X117.816 Y198.035 E.36913
G1 X117.169 Y198.035 E.02341
G1 X124.75 Y205.616 E.38772
G2 X124.505 Y206.018 I1.89 J1.43 E.01706
G1 X116.521 Y198.035 E.40828
G1 X115.874 Y198.035 E.02341
G1 X124.301 Y206.462 E.43096
G2 X124.148 Y206.956 I5.123 J1.855 E.01872
G1 X115.227 Y198.035 E.45625
G1 X114.579 Y198.035 E.02341
G1 X124.059 Y207.514 E.48479
G2 X124.051 Y208.154 I4.286 J.375 E.02314
G1 X113.932 Y198.035 E.51748
G1 X113.284 Y198.035 E.02341
G1 X124.514 Y209.265 E.5743
; WIPE_START
G1 X123.1 Y207.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X128.315 Y213.424 Z.6 F30000
G1 X132.523 Y217.921 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X112.637 Y198.035 E1.01698
G1 X111.99 Y198.035 E.02341
G1 X131.67 Y217.715 E1.00646
G1 X131.023 Y217.715 E.02341
G1 X111.342 Y198.035 E1.00646
G1 X110.695 Y198.035 E.02341
G1 X130.375 Y217.715 E1.00646
G1 X129.728 Y217.715 E.02341
G1 X110.047 Y198.035 E1.00646
G1 X109.4 Y198.035 E.02341
G1 X129.081 Y217.715 E1.00646
G1 X128.433 Y217.715 E.02341
G1 X108.753 Y198.035 E1.00646
G1 X108.105 Y198.035 E.02341
G1 X127.786 Y217.715 E1.00646
G1 X127.138 Y217.715 E.02341
G1 X107.458 Y198.035 E1.00646
G1 X106.81 Y198.035 E.02341
G1 X126.491 Y217.715 E1.00646
G1 X125.844 Y217.715 E.02341
G1 X106.163 Y198.035 E1.00646
G1 X105.516 Y198.035 E.02341
G1 X125.196 Y217.715 E1.00646
G1 X124.549 Y217.715 E.02341
G1 X104.868 Y198.035 E1.00646
G1 X104.221 Y198.035 E.02341
G1 X123.901 Y217.715 E1.00646
G1 X123.254 Y217.715 E.02341
G1 X103.573 Y198.035 E1.00646
G1 X102.926 Y198.035 E.02341
G1 X122.607 Y217.715 E1.00646
G1 X121.959 Y217.715 E.02341
G1 X102.279 Y198.035 E1.00646
G1 X101.631 Y198.035 E.02341
G1 X121.312 Y217.715 E1.00646
G1 X120.664 Y217.715 E.02341
G1 X100.984 Y198.035 E1.00646
G1 X100.336 Y198.035 E.02341
G1 X120.017 Y217.715 E1.00646
G1 X119.37 Y217.715 E.02341
G1 X99.689 Y198.035 E1.00646
G1 X99.042 Y198.035 E.02341
G1 X118.722 Y217.715 E1.00646
G1 X118.075 Y217.715 E.02341
G1 X98.394 Y198.035 E1.00646
G1 X97.747 Y198.035 E.02341
G1 X117.427 Y217.715 E1.00646
G1 X116.78 Y217.715 E.02341
G1 X97.099 Y198.035 E1.00646
G1 X96.452 Y198.035 E.02341
G1 X116.133 Y217.715 E1.00646
G1 X115.485 Y217.715 E.02341
G1 X95.805 Y198.035 E1.00646
G1 X95.157 Y198.035 E.02341
G1 X114.838 Y217.715 E1.00646
G1 X114.19 Y217.715 E.02341
G1 X94.51 Y198.035 E1.00646
G1 X93.862 Y198.035 E.02341
G1 X113.543 Y217.715 E1.00646
G1 X112.896 Y217.715 E.02341
G1 X93.215 Y198.035 E1.00646
G1 X92.568 Y198.035 E.02341
G1 X112.248 Y217.715 E1.00646
G1 X111.601 Y217.715 E.02341
G1 X91.92 Y198.035 E1.00646
G1 X91.273 Y198.035 E.02341
G1 X110.953 Y217.715 E1.00646
G1 X110.306 Y217.715 E.02341
G1 X90.625 Y198.035 E1.00646
G1 X89.978 Y198.035 E.02341
G1 X109.659 Y217.715 E1.00646
G1 X109.011 Y217.715 E.02341
G1 X89.331 Y198.035 E1.00646
G1 X88.683 Y198.035 E.02341
G1 X108.364 Y217.715 E1.00646
G1 X107.716 Y217.715 E.02341
G1 X88.036 Y198.035 E1.00646
G1 X87.388 Y198.035 E.02341
G1 X107.069 Y217.715 E1.00646
G1 X106.422 Y217.715 E.02341
G1 X86.741 Y198.035 E1.00646
G1 X86.094 Y198.035 E.02341
G1 X105.774 Y217.715 E1.00646
G1 X105.127 Y217.715 E.02341
G1 X85.446 Y198.035 E1.00646
G1 X84.799 Y198.035 E.02341
G1 X104.479 Y217.715 E1.00646
G1 X103.832 Y217.715 E.02341
G1 X84.151 Y198.035 E1.00646
G1 X83.504 Y198.035 E.02341
G1 X103.185 Y217.715 E1.00646
G1 X102.537 Y217.715 E.02341
G1 X82.857 Y198.035 E1.00646
G1 X82.209 Y198.035 E.02341
G1 X101.89 Y217.715 E1.00646
G1 X101.242 Y217.715 E.02341
G1 X81.562 Y198.035 E1.00646
G1 X80.914 Y198.035 E.02341
G1 X100.595 Y217.715 E1.00646
G1 X99.948 Y217.715 E.02341
G1 X80.267 Y198.035 E1.00646
G1 X79.62 Y198.035 E.02341
G1 X99.3 Y217.715 E1.00646
G1 X98.653 Y217.715 E.02341
G1 X78.972 Y198.035 E1.00646
G1 X78.325 Y198.035 E.02341
G1 X98.005 Y217.715 E1.00646
G1 X97.358 Y217.715 E.02341
G1 X77.677 Y198.035 E1.00646
G1 X77.03 Y198.035 E.02341
G1 X96.711 Y217.715 E1.00646
G1 X96.063 Y217.715 E.02341
G1 X76.383 Y198.035 E1.00646
M73 P25 R56
G1 X75.735 Y198.035 E.02341
G1 X95.416 Y217.715 E1.00646
G1 X94.768 Y217.715 E.02341
G1 X75.088 Y198.035 E1.00646
G1 X74.44 Y198.035 E.02341
G1 X94.121 Y217.715 E1.00646
G1 X93.474 Y217.715 E.02341
G1 X73.793 Y198.035 E1.00646
G1 X73.146 Y198.035 E.02341
G1 X92.826 Y217.715 E1.00646
G1 X92.179 Y217.715 E.02341
G1 X72.498 Y198.035 E1.00646
G1 X71.851 Y198.035 E.02341
G1 X91.531 Y217.715 E1.00646
G1 X90.884 Y217.715 E.02341
G1 X71.203 Y198.035 E1.00646
G1 X70.556 Y198.035 E.02341
G1 X90.237 Y217.715 E1.00646
G1 X89.589 Y217.715 E.02341
G1 X69.909 Y198.035 E1.00646
G1 X69.261 Y198.035 E.02341
G1 X88.942 Y217.715 E1.00646
G1 X88.294 Y217.715 E.02341
G1 X68.614 Y198.035 E1.00646
G1 X67.966 Y198.035 E.02341
G1 X87.647 Y217.715 E1.00646
G1 X87 Y217.715 E.02341
G1 X67.319 Y198.035 E1.00646
G1 X66.672 Y198.035 E.02341
G1 X86.352 Y217.715 E1.00646
G1 X85.705 Y217.715 E.02341
G1 X66.024 Y198.035 E1.00646
G1 X65.377 Y198.035 E.02341
G1 X85.057 Y217.715 E1.00646
G1 X84.41 Y217.715 E.02341
G1 X64.729 Y198.035 E1.00646
G1 X64.082 Y198.035 E.02341
G1 X83.763 Y217.715 E1.00646
G1 X83.115 Y217.715 E.02341
G1 X63.435 Y198.035 E1.00646
G1 X62.787 Y198.035 E.02341
G1 X82.468 Y217.715 E1.00646
G1 X81.82 Y217.715 E.02341
G1 X62.14 Y198.035 E1.00646
G1 X61.492 Y198.035 E.02341
G1 X81.173 Y217.715 E1.00646
G1 X80.526 Y217.715 E.02341
G1 X60.845 Y198.035 E1.00646
G1 X60.198 Y198.035 E.02341
G1 X79.878 Y217.715 E1.00646
G1 X79.231 Y217.715 E.02341
G1 X59.55 Y198.035 E1.00646
G1 X58.903 Y198.035 E.02341
G1 X78.583 Y217.715 E1.00646
G1 X77.936 Y217.715 E.02341
G1 X58.255 Y198.035 E1.00646
G1 X57.608 Y198.035 E.02341
G1 X77.289 Y217.715 E1.00646
G1 X76.641 Y217.715 E.02341
G1 X56.961 Y198.035 E1.00646
G1 X56.313 Y198.035 E.02341
G1 X75.994 Y217.715 E1.00646
G1 X75.346 Y217.715 E.02341
G1 X55.666 Y198.035 E1.00646
G1 X55.018 Y198.035 E.02341
G1 X74.699 Y217.715 E1.00646
G1 X74.052 Y217.715 E.02341
G1 X54.371 Y198.035 E1.00646
G1 X53.724 Y198.035 E.02341
G1 X73.404 Y217.715 E1.00646
G1 X72.757 Y217.715 E.02341
G1 X53.076 Y198.035 E1.00646
G1 X52.429 Y198.035 E.02341
G1 X72.109 Y217.715 E1.00646
M73 P26 R56
G1 X71.462 Y217.715 E.02341
G1 X51.781 Y198.035 E1.00646
G1 X51.134 Y198.035 E.02341
G1 X70.815 Y217.715 E1.00646
G1 X70.167 Y217.715 E.02341
G1 X50.487 Y198.035 E1.00646
G1 X49.84 Y198.035 E.02338
G1 X49.84 Y197.388 E.02338
G1 X30.16 Y177.708 E1.00646
G1 X30.16 Y178.355 E.02341
G1 X69.52 Y217.715 E2.01287
G1 X68.872 Y217.715 E.02341
G1 X30.16 Y179.003 E1.97976
G1 X30.16 Y179.65 E.02341
G1 X68.225 Y217.715 E1.94666
G1 X67.578 Y217.715 E.02341
G1 X30.16 Y180.297 E1.91355
G1 X30.16 Y180.945 E.02341
G1 X66.93 Y217.715 E1.88044
G1 X66.283 Y217.715 E.02341
G1 X30.16 Y181.592 E1.84733
G1 X30.16 Y182.24 E.02341
G1 X65.635 Y217.715 E1.81422
G1 X64.988 Y217.715 E.02341
G1 X30.16 Y182.887 E1.78112
G1 X30.16 Y183.534 E.02341
G1 X64.341 Y217.715 E1.74801
G1 X63.693 Y217.715 E.02341
G1 X30.16 Y184.182 E1.7149
G1 X30.16 Y184.829 E.02341
G1 X63.046 Y217.715 E1.68179
G1 X62.398 Y217.715 E.02341
G1 X30.16 Y185.477 E1.64868
G1 X30.16 Y186.124 E.02341
G1 X61.751 Y217.715 E1.61558
G1 X61.104 Y217.715 E.02341
G1 X30.16 Y186.771 E1.58247
G1 X30.16 Y187.419 E.02341
G1 X60.456 Y217.715 E1.54936
G1 X59.809 Y217.715 E.02341
G1 X30.16 Y188.066 E1.51625
G1 X30.16 Y188.714 E.02341
G1 X59.161 Y217.715 E1.48315
G1 X58.514 Y217.715 E.02341
G1 X30.16 Y189.361 E1.45004
G1 X30.16 Y190.008 E.02341
G1 X57.867 Y217.715 E1.41693
G1 X57.219 Y217.715 E.02341
G1 X30.16 Y190.656 E1.38382
G1 X30.16 Y191.303 E.02341
G1 X56.572 Y217.715 E1.35071
G1 X55.924 Y217.715 E.02341
G1 X30.16 Y191.951 E1.31761
G1 X30.16 Y192.598 E.02341
G1 X55.277 Y217.715 E1.2845
G1 X54.63 Y217.715 E.02341
G1 X43.843 Y206.928 E.55164
G3 X43.953 Y207.686 I-3.859 J.948 E.02773
G1 X53.982 Y217.715 E.5129
G1 X53.335 Y217.715 E.02341
G1 X43.936 Y208.316 E.48067
G3 X43.833 Y208.861 I-2.774 J-.242 E.02007
G1 X52.687 Y217.715 E.45283
G1 X52.04 Y217.715 E.02341
G1 X43.675 Y209.35 E.42781
G3 X43.468 Y209.79 I-6.198 J-2.646 E.0176
G1 X51.393 Y217.715 E.40529
G1 X50.745 Y217.715 E.02341
G1 X43.215 Y210.185 E.3851
G3 X42.924 Y210.542 I-1.927 J-1.273 E.01667
G1 X50.098 Y217.715 E.36686
G1 X49.45 Y217.715 E.02341
G1 X42.597 Y210.862 E.3505
G3 X42.232 Y211.144 I-1.595 J-1.68 E.01671
G1 X48.803 Y217.715 E.33604
G1 X48.156 Y217.715 E.02341
G1 X41.829 Y211.389 E.32354
G3 X41.379 Y211.586 I-2.836 J-5.841 E.01777
G1 X47.508 Y217.715 E.31343
G1 X46.861 Y217.715 E.02341
G1 X40.879 Y211.734 E.3059
G3 X40.321 Y211.823 I-.727 J-2.745 E.02046
G1 X46.213 Y217.715 E.30132
G1 X45.566 Y217.715 E.02341
G1 X39.67 Y211.819 E.30154
G3 X38.872 Y211.669 I.339 J-3.998 E.02939
G1 X45.124 Y217.921 E.31973
; WIPE_START
G1 X43.71 Y216.507 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X42.199 Y209.025 Z.6 F30000
G1 X41.252 Y204.338 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X30.16 Y193.245 E.56727
G1 X30.16 Y193.893 E.02341
G1 X40.188 Y203.921 E.51284
G2 X39.559 Y203.939 I-.222 J3.144 E.02279
G1 X30.16 Y194.54 E.48068
G1 X30.16 Y195.188 E.02341
G1 X39.014 Y204.041 E.45279
G2 X38.527 Y204.202 I.557 J2.509 E.01857
G1 X30.16 Y195.835 E.42789
G1 X30.16 Y196.482 E.02341
G1 X38.086 Y204.409 E.40536
G2 X37.687 Y204.657 I1.042 J2.116 E.01702
G1 X30.16 Y197.13 E.38497
G1 X30.16 Y197.777 E.02341
G1 X37.332 Y204.949 E.36678
G2 X37.013 Y205.278 I1.482 J1.756 E.01658
G1 X30.16 Y198.425 E.35048
G1 X30.16 Y199.072 E.02341
G1 X36.732 Y205.644 E.33608
G2 X36.489 Y206.048 I1.901 J1.417 E.01709
G1 X30.16 Y199.719 E.32366
G1 X30.16 Y200.367 E.02341
G1 X36.287 Y206.494 E.31337
G2 X36.14 Y206.995 I5.397 J1.856 E.01887
G1 X30.16 Y201.014 E.30585
G1 X30.16 Y201.661 E.02341
G1 X36.055 Y207.556 E.30147
G2 X36.056 Y208.205 I4.139 J.317 E.02348
G1 X30.16 Y202.309 E.30152
G1 X30.16 Y202.956 E.02341
G1 X36.548 Y209.345 E.3267
; WIPE_START
G1 X35.134 Y207.93 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X29.954 Y203.398 Z.6 F30000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X44.271 Y217.715 E.73218
G1 X43.624 Y217.715 E.02341
G1 X30.16 Y204.251 E.68856
G1 X30.16 Y204.898 E.02341
G1 X42.976 Y217.715 E.65545
G1 X42.329 Y217.715 E.02341
G1 X30.16 Y205.546 E.62234
G1 X30.16 Y206.193 E.02341
G1 X41.682 Y217.715 E.58923
G1 X41.034 Y217.715 E.02341
G1 X30.16 Y206.841 E.55613
G1 X30.16 Y207.488 E.02341
G1 X40.387 Y217.715 E.52302
G1 X39.74 Y217.715 E.02341
G1 X30.16 Y208.135 E.48991
G1 X30.16 Y208.783 E.02341
G1 X39.092 Y217.715 E.4568
G1 X38.445 Y217.715 E.02341
G1 X30.16 Y209.43 E.42369
G1 X30.16 Y210.078 E.02341
G1 X37.797 Y217.715 E.39059
G1 X37.15 Y217.715 E.02341
G1 X30.16 Y210.725 E.35748
G1 X30.16 Y211.372 E.02341
G1 X36.503 Y217.715 E.32437
G1 X35.855 Y217.715 E.02341
G1 X30.16 Y212.02 E.29126
G1 X30.16 Y212.667 E.02341
G1 X35.208 Y217.715 E.25815
G1 X34.56 Y217.715 E.02341
G1 X30.16 Y213.315 E.22505
G1 X30.16 Y213.962 E.02341
G1 X33.913 Y217.715 E.19194
G1 X33.266 Y217.715 E.02341
G1 X30.16 Y214.609 E.15883
G1 X30.16 Y215.257 E.02341
G1 X32.618 Y217.715 E.12572
G1 X31.971 Y217.715 E.02341
G1 X30.16 Y215.904 E.09262
G1 X30.16 Y216.552 E.02341
G1 X31.323 Y217.715 E.05951
G1 X30.676 Y217.715 E.02341
G1 X29.954 Y216.993 E.03692
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6300
G1 X30.676 Y217.715 E-.38795
G1 X31.323 Y217.715 E-.24601
G1 X31.089 Y217.481 E-.12604
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/15
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
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
G1 X126.479 Y205.043
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X126.678 Y204.945 E.00711
G3 X127.624 Y204.68 I1.328 J2.929 E.03172
G3 X128.24 Y204.666 I.379 J3.066 E.01986
G3 X126.393 Y205.091 I-.235 J3.207 E.58783
G1 X126.427 Y205.072 E.00125
G1 X126.972 Y205.263 F30000
G1 F8843.478
G1 X127.106 Y205.213 E.00457
G3 X127.673 Y205.085 I.9 J2.66 E.01873
G3 X128.21 Y205.072 I.33 J2.672 E.0173
G3 X126.845 Y205.316 I-.205 J2.801 E.52237
G1 X126.917 Y205.286 E.00251
G1 X127.421 Y205.545 F30000
G1 F8843.478
G1 X127.468 Y205.533 E.00157
G3 X127.722 Y205.489 I.537 J2.34 E.00827
G3 X128.18 Y205.479 I.281 J2.279 E.01475
G3 X127.235 Y205.599 I-.175 J2.395 E.45432
G1 X127.364 Y205.562 E.00429
G1 X127.757 Y205.881 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P26 R55
G1 F9547.055
M204 S5000
G1 X127.769 Y205.879 E.00036
G1 X127.95 Y205.865 E.00541
G3 X127.554 Y205.917 I.06 J2.008 E.3641
G1 X127.698 Y205.891 E.00435
; WIPE_START
M204 S10000
G1 X127.769 Y205.879 E-.02744
G1 X127.95 Y205.865 E-.06897
G1 X128.349 Y205.895 E-.15213
G1 X128.734 Y206.004 E-.15213
G1 X129.091 Y206.186 E-.15213
G1 X129.404 Y206.436 E-.15209
G1 X129.497 Y206.547 E-.05512
; WIPE_END
G1 E-.04 F1800
G1 X137.128 Y206.412 Z.8 F30000
G1 X214.477 Y205.044 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X214.678 Y204.945 E.00721
G3 X215.624 Y204.68 I1.328 J2.929 E.03172
G3 X216.24 Y204.666 I.379 J3.066 E.01986
G3 X214.393 Y205.091 I-.235 J3.207 E.58783
G1 X214.425 Y205.073 E.00117
G1 X214.97 Y205.264 F30000
G1 F8843.478
G1 X215.105 Y205.213 E.00466
G3 X215.673 Y205.085 I.9 J2.66 E.01874
G3 X216.21 Y205.072 I.33 J2.673 E.0173
G3 X214.845 Y205.316 I-.205 J2.801 E.52238
G1 X214.914 Y205.287 E.0024
G1 X215.419 Y205.545 F30000
G1 F8843.478
G1 X215.468 Y205.533 E.00164
G3 X215.722 Y205.489 I.537 J2.34 E.00827
G3 X216.18 Y205.479 I.281 J2.279 E.01475
G3 X215.235 Y205.599 I-.175 J2.395 E.45431
G1 X215.361 Y205.562 E.00422
G1 X215.769 Y205.879 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X215.95 Y205.865 E.00541
G3 X215.709 Y205.887 I.06 J2.008 E.36881
; WIPE_START
M204 S10000
G1 X215.95 Y205.865 E-.09174
G1 X216.349 Y205.895 E-.15214
G1 X216.545 Y205.94 E-.07616
G1 X216.917 Y206.086 E-.1521
G1 X217.253 Y206.303 E-.15211
G1 X217.509 Y206.553 E-.13576
; WIPE_END
G1 E-.04 F1800
G1 X217.316 Y198.923 Z.8 F30000
G1 X215.549 Y129.184 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X215.285 Y129.132 E.00864
G3 X215.624 Y122.805 I.721 J-3.134 E.28917
G3 X216.24 Y122.791 I.379 J3.066 E.01986
G3 X215.609 Y129.189 I-.235 J3.207 E.33011
G1 X215.685 Y128.791 F30000
G1 F8843.478
G1 X215.651 Y128.784 E.00111
G3 X215.673 Y123.21 I.354 J-2.786 E.26157
G3 X216.21 Y123.197 I.33 J2.674 E.0173
G3 X215.93 Y128.806 I-.205 J2.801 E.27955
G1 X215.745 Y128.795 E.00597
G1 X215.703 Y128.372 F30000
M73 P27 R55
G1 F8843.478
G1 X215.466 Y128.339 E.00768
G3 X215.722 Y123.614 I.539 J-2.34 E.21597
G3 X216.18 Y123.604 I.281 J2.28 E.01475
G3 X215.94 Y128.399 I-.175 J2.395 E.23902
G1 X215.762 Y128.379 E.00575
G1 X215.84 Y127.997 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X215.751 Y127.991 E.00266
G3 X215.769 Y124.004 I.259 J-1.992 E.17309
G1 X215.95 Y123.99 E.00541
G3 X216.15 Y128.003 I.06 J2.008 E.18558
G1 X215.9 Y127.998 E.00746
; WIPE_START
M204 S10000
G1 X215.751 Y127.991 E-.05668
G1 X215.36 Y127.906 E-.15204
G1 X214.995 Y127.741 E-.1521
G1 X214.67 Y127.507 E-.15214
G1 X214.398 Y127.214 E-.15213
G1 X214.267 Y127.001 E-.09492
; WIPE_END
G1 E-.04 F1800
G1 X214.493 Y119.372 Z.8 F30000
G1 X216.815 Y41.014 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X216.872 Y41.026 E.00186
G3 X215.624 Y40.93 I-.866 J3.097 E.60921
G3 X216.24 Y40.916 I.379 J3.073 E.01986
G3 X216.559 Y40.955 I-.235 J3.207 E.01032
G1 X216.757 Y41.001 E.00653
G1 X216.392 Y41.345 F30000
G1 F8843.478
G1 X216.488 Y41.357 E.0031
G3 X215.673 Y41.335 I-.483 J2.767 E.54111
G3 X216.21 Y41.322 I.33 J2.677 E.0173
G1 X216.333 Y41.338 E.00398
G1 X216.009 Y41.733 F30000
G1 F8843.478
G1 X216.18 Y41.729 E.00548
G3 X215.722 Y41.739 I-.175 J2.395 E.47038
G1 X215.949 Y41.734 E.00731
G1 X215.772 Y42.129 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X215.95 Y42.115 E.00532
G3 X215.712 Y42.137 I.059 J2.008 E.3689
; WIPE_START
M204 S10000
G1 X215.95 Y42.115 E-.09068
G1 X216.349 Y42.145 E-.15213
G1 X216.734 Y42.254 E-.1521
G1 X217.091 Y42.436 E-.15215
G1 X217.404 Y42.686 E-.15208
G1 X217.507 Y42.809 E-.06086
; WIPE_END
G1 E-.04 F1800
G1 X209.875 Y42.682 Z.8 F30000
G1 X126.477 Y41.294 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X126.678 Y41.194 E.00721
G3 X127.624 Y40.93 I1.328 J2.929 E.03172
G3 X128.24 Y40.916 I.379 J3.073 E.01986
G3 X126.393 Y41.341 I-.235 J3.207 E.58782
G1 X126.424 Y41.324 E.00117
G1 X126.97 Y41.514 F30000
G1 F8843.478
G1 X127.106 Y41.463 E.00467
G3 X127.673 Y41.335 I.9 J2.66 E.01874
G3 X128.21 Y41.322 I.33 J2.677 E.0173
G3 X126.845 Y41.566 I-.205 J2.801 E.52238
G1 X126.914 Y41.537 E.0024
G1 X127.419 Y41.795 F30000
G1 F8843.478
G1 X127.468 Y41.783 E.00163
G3 X127.722 Y41.739 I.536 J2.34 E.00828
G3 X128.18 Y41.729 I.281 J2.281 E.01475
G3 X127.235 Y41.849 I-.175 J2.395 E.45432
G1 X127.362 Y41.812 E.00423
G1 X127.772 Y42.129 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X127.95 Y42.115 E.00533
G3 X127.712 Y42.137 I.059 J2.008 E.3689
; WIPE_START
M204 S10000
G1 X127.95 Y42.115 E-.0907
G1 X128.349 Y42.145 E-.15212
G1 X128.734 Y42.254 E-.15213
G1 X129.091 Y42.436 E-.15214
G1 X129.404 Y42.686 E-.15208
G1 X129.507 Y42.809 E-.06083
; WIPE_END
G1 E-.04 F1800
G1 X121.876 Y42.654 Z.8 F30000
G1 X40.814 Y41.014 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X40.872 Y41.026 E.0019
G3 X39.624 Y40.93 I-.866 J3.097 E.60921
G3 X40.24 Y40.916 I.379 J3.073 E.01986
G3 X40.559 Y40.955 I-.235 J3.207 E.01032
G1 X40.756 Y41.001 E.0065
G1 X40.391 Y41.345 F30000
G1 F8843.478
G1 X40.488 Y41.357 E.00314
G3 X39.673 Y41.335 I-.483 J2.767 E.54111
G3 X40.21 Y41.322 I.33 J2.677 E.0173
G1 X40.332 Y41.338 E.00394
G1 X40.007 Y41.733 F30000
G1 F8843.478
G1 X40.18 Y41.729 E.00555
G3 X39.722 Y41.739 I-.175 J2.395 E.47038
G1 X39.947 Y41.734 E.00724
G1 X39.795 Y42.127 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X39.95 Y42.115 E.00462
G3 X39.736 Y42.133 I.059 J2.008 E.36961
; WIPE_START
M204 S10000
G1 X39.95 Y42.115 E-.08167
G1 X40.349 Y42.145 E-.15212
G1 X40.734 Y42.254 E-.15211
G1 X41.091 Y42.436 E-.15216
G1 X41.404 Y42.686 E-.15208
G1 X41.522 Y42.827 E-.06986
; WIPE_END
G1 E-.04 F1800
G1 X47.076 Y48.062 Z.8 F30000
G1 X205.416 Y197.291 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X50.584 Y197.291 E4.97885
G1 X50.584 Y54.709 E4.58493
G1 X205.416 Y54.709 E4.97885
G1 X205.416 Y197.231 E4.583
G1 X205.009 Y196.884 F30000
G1 F8843.478
G1 X50.991 Y196.884 E4.95267
G1 X50.991 Y55.116 E4.55875
G1 X205.009 Y55.116 E4.95267
G1 X205.009 Y196.824 E4.55682
G1 X204.602 Y196.477 F30000
G1 F8843.478
G1 X51.398 Y196.477 E4.92649
G1 X51.398 Y55.523 E4.53257
G1 X204.602 Y55.523 E4.92649
G1 X204.602 Y196.417 E4.53064
G1 X204.21 Y196.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X51.79 Y196.085 E4.54007
G1 X51.79 Y55.915 E4.17519
G1 X204.21 Y55.915 E4.54007
G1 X204.21 Y196.025 E4.1734
; WIPE_START
M204 S10000
G1 X202.21 Y196.026 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X195.237 Y192.923 Z.8 F30000
G1 X38.477 Y123.169 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X38.678 Y123.07 E.00721
G3 X39.624 Y122.805 I1.328 J2.929 E.03172
G3 X40.24 Y122.791 I.379 J3.066 E.01986
G3 X38.393 Y123.216 I-.235 J3.207 E.58783
G1 X38.425 Y123.198 E.00116
G1 X38.97 Y123.389 F30000
G1 F8843.478
G1 X39.106 Y123.338 E.00466
G3 X39.673 Y123.21 I.9 J2.66 E.01874
G3 X40.21 Y123.197 I.33 J2.674 E.0173
G3 X38.845 Y123.441 I-.205 J2.801 E.52238
G1 X38.914 Y123.412 E.00241
G1 X39.419 Y123.67 F30000
G1 F8843.478
G1 X39.468 Y123.658 E.00163
G3 X39.722 Y123.614 I.537 J2.34 E.00828
G3 X40.18 Y123.604 I.281 J2.28 E.01475
G3 X39.235 Y123.724 I-.175 J2.395 E.45432
G1 X39.362 Y123.687 E.00423
G1 X39.772 Y124.004 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X39.95 Y123.99 E.00532
G3 X39.712 Y124.012 I.06 J2.008 E.3689
; WIPE_START
M204 S10000
G1 X39.95 Y123.99 E-.0907
G1 X40.349 Y124.02 E-.15211
G1 X40.734 Y124.129 E-.15211
G1 X41.091 Y124.311 E-.15214
G1 X41.404 Y124.561 E-.15211
G1 X41.507 Y124.684 E-.06083
; WIPE_END
G1 E-.04 F1800
G1 X41.441 Y132.316 Z.8 F30000
G1 X40.815 Y204.764 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X40.872 Y204.776 E.00187
G3 X39.624 Y204.68 I-.866 J3.097 E.60921
G3 X40.24 Y204.666 I.379 J3.066 E.01986
G3 X40.559 Y204.705 I-.235 J3.207 E.01032
G1 X40.756 Y204.751 E.00652
G1 X40.392 Y205.095 F30000
G1 F8843.478
G1 X40.488 Y205.107 E.00312
G3 X39.673 Y205.085 I-.483 J2.767 E.54111
G3 X40.21 Y205.072 I.33 J2.673 E.0173
G1 X40.332 Y205.088 E.00396
G1 X40.009 Y205.483 F30000
G1 F8843.478
G1 X40.18 Y205.479 E.00549
G3 X39.722 Y205.489 I-.175 J2.395 E.47038
G1 X39.949 Y205.484 E.00731
G1 X39.769 Y205.879 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X39.769 Y205.879 E.00001
G1 X39.95 Y205.865 E.00541
G3 X39.554 Y205.917 I.06 J2.008 E.3641
G1 X39.709 Y205.889 E.0047
; WIPE_START
M204 S10000
G1 X39.769 Y205.879 E-.02293
G1 X39.95 Y205.865 E-.06897
G1 X40.349 Y205.895 E-.15212
G1 X40.734 Y206.004 E-.15211
G1 X41.091 Y206.186 E-.15215
G1 X41.404 Y206.436 E-.15209
G1 X41.504 Y206.556 E-.05962
; WIPE_END
G1 E-.04 F1800
G1 X49.121 Y207.046 Z.8 F30000
G1 X226.584 Y218.459 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X29.416 Y218.459 E6.34019
G1 X29.416 Y33.541 E5.94628
G1 X226.584 Y33.541 E6.34019
G1 X226.584 Y218.399 E5.94435
G1 X226.991 Y218.866 F30000
G1 F8843.478
G1 X29.009 Y218.866 E6.36637
G1 X29.009 Y33.134 E5.97246
G1 X226.991 Y33.134 E6.36637
G1 X226.991 Y218.806 E5.97053
G1 X227.398 Y219.273 F30000
G1 F8843.478
G1 X28.602 Y219.273 E6.39255
G1 X28.602 Y32.727 E5.99864
G1 X227.398 Y32.727 E6.39255
G1 X227.398 Y219.213 E5.99671
G1 X227.79 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X28.21 Y219.665 E5.94481
G1 X28.21 Y32.335 E5.57992
G1 X227.79 Y32.335 E5.94481
G1 X227.79 Y219.605 E5.57813
; WIPE_START
M204 S10000
G1 X225.79 Y219.606 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X225.658 Y218.295 Z.8 F30000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42021
G1 F9541.731
G1 X226.251 Y217.702 E.025
G1 X226.251 Y217.169 E.0159
G1 X225.294 Y218.126 E.04033
G1 X224.76 Y218.126 E.0159
G1 X226.251 Y216.635 E.06282
G1 X226.251 Y216.101 E.0159
G1 X224.226 Y218.126 E.08531
G1 X223.693 Y218.126 E.0159
G1 X226.251 Y215.568 E.1078
G1 X226.251 Y215.034 E.0159
G1 X223.159 Y218.126 E.13029
G1 X222.626 Y218.126 E.0159
G1 X226.251 Y214.501 E.15278
G1 X226.251 Y213.967 E.0159
G1 X222.092 Y218.126 E.17527
G1 X221.559 Y218.126 E.0159
G1 X226.251 Y213.434 E.19775
G1 X226.251 Y212.9 E.0159
G1 X221.025 Y218.126 E.22024
G1 X220.492 Y218.126 E.0159
G1 X226.251 Y212.366 E.24273
G1 X226.251 Y211.833 E.0159
G1 X219.958 Y218.126 E.26522
G1 X219.424 Y218.126 E.0159
G1 X226.251 Y211.299 E.28771
G1 X226.251 Y210.766 E.0159
G1 X218.891 Y218.126 E.3102
G1 X218.357 Y218.126 E.0159
G1 X226.251 Y210.232 E.33269
G1 X226.251 Y209.699 E.0159
G1 X217.824 Y218.126 E.35518
G1 X217.29 Y218.126 E.0159
G1 X226.251 Y209.165 E.37767
G1 X226.251 Y208.632 E.0159
G1 X216.757 Y218.126 E.40015
G1 X216.223 Y218.126 E.0159
G1 X226.251 Y208.098 E.42264
G1 X226.251 Y207.564 E.0159
G1 X215.689 Y218.126 E.44513
G1 X215.156 Y218.126 E.0159
G1 X226.251 Y207.031 E.46762
G1 X226.251 Y206.497 E.0159
G1 X214.622 Y218.126 E.49011
G1 X214.089 Y218.126 E.0159
G1 X226.251 Y205.964 E.5126
G1 X226.251 Y205.43 E.0159
G1 X213.555 Y218.126 E.53509
G1 X213.022 Y218.126 E.0159
G1 X226.251 Y204.897 E.55758
G1 X226.251 Y204.363 E.0159
G1 X212.488 Y218.126 E.58007
G1 X211.954 Y218.126 E.0159
G1 X226.251 Y203.829 E.60256
G1 X226.251 Y203.296 E.0159
G1 X211.421 Y218.126 E.62504
G1 X210.887 Y218.126 E.0159
G1 X226.251 Y202.762 E.64753
G1 X226.251 Y202.229 E.0159
G1 X219.3 Y209.179 E.29294
G2 X219.501 Y208.444 I-3.423 J-1.332 E.02275
G1 X226.251 Y201.695 E.28446
G1 X226.251 Y201.162 E.0159
G1 X219.551 Y207.861 E.28237
G2 X219.511 Y207.368 I-2.486 J-.046 E.01478
G1 X226.251 Y200.628 E.28407
G1 X226.251 Y200.094 E.0159
G1 X219.419 Y206.926 E.28794
G2 X219.284 Y206.527 I-2.063 J.473 E.01257
G1 X226.251 Y199.561 E.29361
G1 X226.251 Y199.027 E.0159
G1 X219.112 Y206.165 E.30086
G2 X218.907 Y205.838 I-1.747 J.868 E.01155
G1 X226.251 Y198.494 E.30953
G1 X226.251 Y197.96 E.0159
G1 X218.672 Y205.539 E.31944
G2 X218.408 Y205.269 I-1.481 J1.182 E.01126
G1 X226.251 Y197.427 E.33055
G1 X226.251 Y196.893 E.0159
G1 X218.116 Y205.027 E.34285
G2 X217.795 Y204.815 I-1.223 J1.502 E.0115
G1 X226.251 Y196.359 E.3564
G1 X226.251 Y195.826 E.0159
G1 X217.442 Y204.634 E.37125
G2 X217.055 Y204.487 I-.929 J1.868 E.01235
G1 X226.251 Y195.292 E.38756
G1 X226.251 Y194.759 E.0159
G1 X216.629 Y204.38 E.40552
G2 X216.145 Y204.33 I-.771 J5.115 E.0145
G1 X226.251 Y194.225 E.42591
G1 X226.251 Y193.692 E.0159
G1 X215.594 Y204.348 E.44916
M73 P28 R55
G2 X214.913 Y204.496 I.668 J4.727 E.02079
G1 X226.251 Y193.158 E.47787
G1 X226.251 Y192.624 E.0159
G1 X200.749 Y218.126 E1.07482
G1 X201.283 Y218.126 E.0159
G1 X212.624 Y206.784 E.47801
G2 X212.476 Y207.466 I3.458 J1.109 E.02083
G1 X201.817 Y218.126 E.44927
G1 X202.35 Y218.126 E.0159
G1 X212.453 Y208.023 E.42581
G2 X212.508 Y208.502 I4.814 J-.31 E.01437
G1 X202.884 Y218.126 E.40563
G1 X203.417 Y218.126 E.0159
G1 X212.613 Y208.93 E.38759
G2 X212.759 Y209.318 I2.013 J-.533 E.01237
G1 X203.951 Y218.126 E.37123
G1 X204.484 Y218.126 E.0159
G1 X212.939 Y209.671 E.35634
G2 X213.151 Y209.993 I1.715 J-.898 E.0115
G1 X205.018 Y218.126 E.34278
G1 X205.552 Y218.126 E.0159
G1 X213.392 Y210.285 E.33045
G2 X213.663 Y210.548 I10.92 J-10.977 E.01125
G1 X206.085 Y218.126 E.31938
G1 X206.619 Y218.126 E.0159
G1 X213.962 Y210.782 E.30952
G2 X214.292 Y210.986 I1.183 J-1.544 E.01157
G1 X207.152 Y218.126 E.30093
G1 X207.686 Y218.126 E.0159
G1 X214.654 Y211.157 E.29369
G2 X215.052 Y211.293 I.878 J-1.922 E.01255
G1 X208.219 Y218.126 E.28797
G1 X208.753 Y218.126 E.0159
G1 X215.491 Y211.387 E.28401
G2 X215.988 Y211.424 I.563 J-4.269 E.01486
G1 X209.287 Y218.126 E.28247
G1 X209.82 Y218.126 E.0159
G1 X216.567 Y211.379 E.28436
G2 X217.299 Y211.181 I-.291 J-2.523 E.02268
G1 X210.184 Y218.295 E.29987
G1 X200.046 Y218.295 F30000
G1 F9541.731
G1 X226.251 Y192.091 E1.10446
G1 X226.251 Y191.557 E.0159
G1 X199.682 Y218.126 E1.1198
G1 X199.149 Y218.126 E.0159
G1 X226.251 Y191.024 E1.14229
G1 X226.251 Y190.49 E.0159
G1 X198.615 Y218.126 E1.16478
G1 X198.082 Y218.126 E.0159
G1 X226.251 Y189.957 E1.18727
G1 X226.251 Y189.423 E.0159
G1 X197.548 Y218.126 E1.20976
G1 X197.014 Y218.126 E.0159
G1 X226.251 Y188.889 E1.23224
G1 X226.251 Y188.356 E.0159
G1 X196.481 Y218.126 E1.25473
G1 X195.947 Y218.126 E.0159
G1 X226.251 Y187.822 E1.27722
G1 X226.251 Y187.289 E.0159
G1 X195.414 Y218.126 E1.29971
G1 X194.88 Y218.126 E.0159
G1 X226.251 Y186.755 E1.3222
G1 X226.251 Y186.222 E.0159
G1 X194.347 Y218.126 E1.34469
G1 X193.813 Y218.126 E.0159
G1 X226.251 Y185.688 E1.36718
G1 X226.251 Y185.155 E.0159
G1 X193.279 Y218.126 E1.38967
G1 X192.746 Y218.126 E.0159
G1 X226.251 Y184.621 E1.41216
G1 X226.251 Y184.087 E.0159
G1 X192.212 Y218.126 E1.43464
G1 X191.679 Y218.126 E.0159
G1 X226.251 Y183.554 E1.45713
G1 X226.251 Y183.02 E.0159
G1 X191.145 Y218.126 E1.47962
G1 X190.612 Y218.126 E.0159
G1 X226.251 Y182.487 E1.50211
G1 X226.251 Y181.953 E.0159
G1 X190.078 Y218.126 E1.5246
G1 X189.545 Y218.126 E.0159
G1 X226.251 Y181.42 E1.54709
G1 X226.251 Y180.886 E.0159
G1 X189.011 Y218.126 E1.56958
G1 X188.477 Y218.126 E.0159
G1 X226.251 Y180.352 E1.59207
G1 X226.251 Y179.819 E.0159
G1 X187.944 Y218.126 E1.61456
G1 X187.41 Y218.126 E.0159
G1 X226.251 Y179.285 E1.63704
G1 X226.251 Y178.752 E.0159
G1 X186.877 Y218.126 E1.65953
G1 X186.343 Y218.126 E.0159
G1 X226.251 Y178.218 E1.68202
G1 X226.251 Y177.685 E.0159
G1 X185.81 Y218.126 E1.70451
G1 X185.276 Y218.126 E.0159
G1 X226.251 Y177.151 E1.727
G1 X226.251 Y176.617 E.0159
G1 X205.749 Y197.118 E.86408
G1 X205.749 Y196.585 E.0159
G1 X226.251 Y176.084 E.86408
G1 X226.251 Y175.55 E.0159
G1 X205.749 Y196.051 E.86408
G1 X205.749 Y195.518 E.0159
G1 X226.251 Y175.017 E.86408
G1 X226.251 Y174.483 E.0159
G1 X205.749 Y194.984 E.86408
G1 X205.749 Y194.451 E.0159
G1 X226.251 Y173.95 E.86408
G1 X226.251 Y173.416 E.0159
G1 X205.749 Y193.917 E.86408
G1 X205.749 Y193.383 E.0159
G1 X226.251 Y172.882 E.86408
G1 X226.251 Y172.349 E.0159
G1 X205.749 Y192.85 E.86408
G1 X205.749 Y192.316 E.0159
G1 X226.251 Y171.815 E.86408
G1 X226.251 Y171.282 E.0159
G1 X205.749 Y191.783 E.86408
G1 X205.749 Y191.249 E.0159
G1 X226.251 Y170.748 E.86408
G1 X226.251 Y170.215 E.0159
G1 X205.749 Y190.716 E.86408
G1 X205.749 Y190.182 E.0159
G1 X226.251 Y169.681 E.86408
G1 X226.251 Y169.147 E.0159
G1 X205.749 Y189.649 E.86408
M73 P28 R54
G1 X205.749 Y189.115 E.0159
G1 X226.251 Y168.614 E.86408
G1 X226.251 Y168.08 E.0159
G1 X205.749 Y188.581 E.86408
G1 X205.749 Y188.048 E.0159
G1 X226.251 Y167.547 E.86408
G1 X226.251 Y167.013 E.0159
G1 X205.749 Y187.514 E.86408
G1 X205.749 Y186.981 E.0159
G1 X226.251 Y166.48 E.86408
G1 X226.251 Y165.946 E.0159
G1 X205.749 Y186.447 E.86408
G1 X205.749 Y185.914 E.0159
G1 X226.251 Y165.412 E.86408
G1 X226.251 Y164.879 E.0159
G1 X205.749 Y185.38 E.86408
G1 X205.749 Y184.846 E.0159
G1 X226.251 Y164.345 E.86408
G1 X226.251 Y163.812 E.0159
G1 X205.749 Y184.313 E.86408
G1 X205.749 Y183.779 E.0159
G1 X226.251 Y163.278 E.86408
G1 X226.251 Y162.745 E.0159
G1 X205.749 Y183.246 E.86408
G1 X205.749 Y182.712 E.0159
G1 X226.251 Y162.211 E.86408
G1 X226.251 Y161.677 E.0159
G1 X205.749 Y182.179 E.86408
G1 X205.749 Y181.645 E.0159
G1 X226.251 Y161.144 E.86408
G1 X226.251 Y160.61 E.0159
G1 X205.749 Y181.111 E.86408
G1 X205.749 Y180.578 E.0159
G1 X226.251 Y160.077 E.86408
G1 X226.251 Y159.543 E.0159
G1 X205.749 Y180.044 E.86408
G1 X205.749 Y179.511 E.0159
G1 X226.251 Y159.01 E.86408
G1 X226.251 Y158.476 E.0159
G1 X205.749 Y178.977 E.86408
G1 X205.749 Y178.444 E.0159
G1 X226.251 Y157.942 E.86408
G1 X226.251 Y157.409 E.0159
G1 X205.749 Y177.91 E.86408
G1 X205.749 Y177.376 E.0159
G1 X226.251 Y156.875 E.86408
G1 X226.251 Y156.342 E.0159
G1 X205.749 Y176.843 E.86408
G1 X205.749 Y176.309 E.0159
G1 X226.251 Y155.808 E.86408
G1 X226.251 Y155.275 E.0159
G1 X205.749 Y175.776 E.86408
G1 X205.749 Y175.242 E.0159
G1 X226.251 Y154.741 E.86408
G1 X226.251 Y154.208 E.0159
G1 X205.749 Y174.709 E.86408
G1 X205.749 Y174.175 E.0159
G1 X226.251 Y153.674 E.86408
G1 X226.251 Y153.14 E.0159
G1 X205.749 Y173.641 E.86408
G1 X205.749 Y173.108 E.0159
G1 X226.251 Y152.607 E.86408
G1 X226.251 Y152.073 E.0159
G1 X205.749 Y172.574 E.86408
G1 X205.749 Y172.041 E.0159
G1 X226.251 Y151.54 E.86408
G1 X226.251 Y151.006 E.0159
G1 X205.749 Y171.507 E.86408
G1 X205.749 Y170.974 E.0159
G1 X226.251 Y150.473 E.86408
G1 X226.251 Y149.939 E.0159
G1 X205.749 Y170.44 E.86408
G1 X205.749 Y169.906 E.0159
G1 X226.251 Y149.405 E.86408
G1 X226.251 Y148.872 E.0159
G1 X205.749 Y169.373 E.86408
G1 X205.749 Y168.839 E.0159
G1 X226.251 Y148.338 E.86408
G1 X226.251 Y147.805 E.0159
G1 X205.749 Y168.306 E.86408
G1 X205.749 Y167.772 E.0159
G1 X226.251 Y147.271 E.86408
G1 X226.251 Y146.738 E.0159
G1 X205.749 Y167.239 E.86408
G1 X205.749 Y166.705 E.0159
G1 X226.251 Y146.204 E.86408
G1 X226.251 Y145.67 E.0159
G1 X205.749 Y166.171 E.86408
G1 X205.749 Y165.638 E.0159
G1 X226.251 Y145.137 E.86408
G1 X226.251 Y144.603 E.0159
G1 X205.749 Y165.104 E.86408
G1 X205.749 Y164.571 E.0159
G1 X226.251 Y144.07 E.86408
G1 X226.251 Y143.536 E.0159
G1 X205.749 Y164.037 E.86408
G1 X205.749 Y163.504 E.0159
G1 X226.251 Y143.003 E.86408
G1 X226.251 Y142.469 E.0159
G1 X205.749 Y162.97 E.86408
G1 X205.749 Y162.437 E.0159
G1 X226.251 Y141.935 E.86408
G1 X226.251 Y141.402 E.0159
G1 X205.749 Y161.903 E.86408
G1 X205.749 Y161.369 E.0159
G1 X226.251 Y140.868 E.86408
G1 X226.251 Y140.335 E.0159
G1 X205.749 Y160.836 E.86408
G1 X205.749 Y160.302 E.0159
G1 X226.251 Y139.801 E.86408
G1 X226.251 Y139.268 E.0159
G1 X205.749 Y159.769 E.86408
G1 X205.749 Y159.235 E.0159
G1 X226.251 Y138.734 E.86408
G1 X226.251 Y138.2 E.0159
G1 X205.749 Y158.702 E.86408
G1 X205.749 Y158.168 E.0159
G1 X226.251 Y137.667 E.86408
G1 X226.251 Y137.133 E.0159
G1 X205.749 Y157.634 E.86408
G1 X205.749 Y157.101 E.0159
G1 X226.251 Y136.6 E.86408
G1 X226.251 Y136.066 E.0159
G1 X205.749 Y156.567 E.86408
G1 X205.749 Y156.034 E.0159
G1 X226.251 Y135.533 E.86408
G1 X226.251 Y134.999 E.0159
G1 X205.749 Y155.5 E.86408
G1 X205.749 Y154.967 E.0159
G1 X226.251 Y134.465 E.86408
G1 X226.251 Y133.932 E.0159
G1 X205.749 Y154.433 E.86408
G1 X205.749 Y153.899 E.0159
G1 X226.251 Y133.398 E.86408
G1 X226.251 Y132.865 E.0159
G1 X205.749 Y153.366 E.86408
G1 X205.749 Y152.832 E.0159
G1 X226.251 Y132.331 E.86408
G1 X226.251 Y131.798 E.0159
G1 X205.749 Y152.299 E.86408
G1 X205.749 Y151.765 E.0159
G1 X226.251 Y131.264 E.86408
G1 X226.251 Y130.731 E.0159
G1 X205.749 Y151.232 E.86408
G1 X205.749 Y150.698 E.0159
G1 X226.251 Y130.197 E.86408
G1 X226.251 Y129.663 E.0159
G1 X205.749 Y150.164 E.86408
G1 X205.749 Y149.631 E.0159
G1 X226.251 Y129.13 E.86408
G1 X226.251 Y128.596 E.0159
G1 X205.749 Y149.097 E.86408
G1 X205.749 Y148.564 E.0159
G1 X226.251 Y128.063 E.86408
G1 X226.251 Y127.529 E.0159
G1 X205.749 Y148.03 E.86408
G1 X205.749 Y147.497 E.0159
G1 X226.251 Y126.996 E.86408
G1 X226.251 Y126.462 E.0159
G1 X205.749 Y146.963 E.86408
G1 X205.749 Y146.429 E.0159
G1 X226.251 Y125.928 E.86408
G1 X226.251 Y125.395 E.0159
G1 X205.749 Y145.896 E.86408
G1 X205.749 Y145.362 E.0159
G1 X226.251 Y124.861 E.86408
G1 X226.251 Y124.328 E.0159
G1 X205.749 Y144.829 E.86408
G1 X205.749 Y144.295 E.0159
G1 X226.251 Y123.794 E.86408
G1 X226.251 Y123.261 E.0159
G1 X205.749 Y143.762 E.86408
G1 X205.749 Y143.228 E.0159
G1 X226.251 Y122.727 E.86408
G1 X226.251 Y122.193 E.0159
G1 X205.749 Y142.694 E.86408
G1 X205.749 Y142.161 E.0159
G1 X226.251 Y121.66 E.86408
G1 X226.251 Y121.126 E.0159
G1 X205.749 Y141.627 E.86408
G1 X205.749 Y141.094 E.0159
G1 X226.251 Y120.593 E.86408
G1 X226.251 Y120.059 E.0159
G1 X219.439 Y126.871 E.28711
G2 X219.54 Y126.236 I-3.507 J-.885 E.01918
G1 X226.251 Y119.526 E.28284
G1 X226.251 Y118.992 E.0159
G1 X219.537 Y125.706 E.28297
G2 X219.467 Y125.242 I-4.769 J.478 E.01399
G1 X226.251 Y118.458 E.2859
G1 X226.251 Y117.925 E.0159
G1 X219.348 Y124.827 E.29093
G2 X219.191 Y124.451 I-1.959 J.596 E.01218
G1 X226.251 Y117.391 E.29754
G1 X226.251 Y116.858 E.0159
G1 X219.001 Y124.108 E.30557
G2 X218.78 Y123.795 I-1.673 J.948 E.01143
G1 X226.251 Y116.324 E.31488
G1 X226.251 Y115.791 E.0159
G1 X218.53 Y123.511 E.32541
G2 X218.252 Y123.256 I-1.413 J1.261 E.01127
G1 X226.251 Y115.257 E.33714
G1 X226.251 Y114.723 E.0159
G1 X217.945 Y123.029 E.35008
G2 X217.607 Y122.833 I-5.427 J8.971 E.01164
G1 X226.251 Y114.19 E.36431
G1 X226.251 Y113.656 E.0159
G1 X217.234 Y122.673 E.38002
G2 X216.824 Y122.55 I-.82 J1.987 E.01279
G1 X226.251 Y113.123 E.39732
G1 X226.251 Y112.589 E.0159
G1 X216.369 Y122.471 E.41651
G2 X215.852 Y122.454 I-.398 J4.154 E.0154
G1 X226.251 Y112.056 E.43827
G1 X226.251 Y111.522 E.0159
G1 X215.241 Y122.531 E.46402
G2 X214.41 Y122.829 I.535 J2.804 E.02642
G1 X226.251 Y110.988 E.49905
G1 X226.251 Y110.455 E.0159
G1 X205.749 Y130.956 E.86408
G1 X205.749 Y131.49 E.0159
G1 X212.824 Y124.415 E.29818
G2 X212.535 Y125.237 I2.41 J1.309 E.02609
G1 X205.749 Y132.023 E.286
G1 X205.749 Y132.557 E.0159
G1 X212.453 Y125.853 E.28253
G2 X212.472 Y126.368 I2.58 J.162 E.01537
G1 X205.749 Y133.09 E.28334
G1 X205.749 Y133.624 E.0159
G1 X212.548 Y126.825 E.28654
G2 X212.671 Y127.236 I6.088 J-1.609 E.01277
G1 X205.749 Y134.157 E.29174
G1 X205.749 Y134.691 E.0159
G1 X212.835 Y127.605 E.29865
G2 X213.031 Y127.943 I1.784 J-.812 E.01165
G1 X205.749 Y135.225 E.30692
G1 X205.749 Y135.758 E.0159
G1 X213.257 Y128.25 E.31645
G2 X213.512 Y128.529 I1.522 J-1.136 E.01127
G1 X205.749 Y136.292 E.32719
G1 X205.749 Y136.825 E.0159
G1 X213.796 Y128.779 E.33913
G2 X214.108 Y129.001 I1.261 J-1.447 E.01142
G1 X205.749 Y137.359 E.35228
G1 X205.749 Y137.892 E.0159
G1 X214.45 Y129.192 E.36672
G2 X214.826 Y129.35 I.978 J-1.799 E.01216
G1 X205.749 Y138.426 E.38254
G1 X205.749 Y138.96 E.0159
G1 X215.241 Y129.468 E.40005
G2 X215.707 Y129.535 I.569 J-2.299 E.01407
G1 X205.749 Y139.493 E.4197
G1 X205.749 Y140.027 E.0159
G1 X216.234 Y129.543 E.44189
G2 X216.87 Y129.44 I-.369 J-4.313 E.01922
G1 X205.58 Y140.73 E.47585
G1 X205.58 Y130.592 F30000
G1 F9541.731
G1 X226.251 Y109.921 E.87123
G1 X226.251 Y109.388 E.0159
G1 X205.749 Y129.889 E.86408
G1 X205.749 Y129.355 E.0159
G1 X226.251 Y108.854 E.86408
G1 X226.251 Y108.321 E.0159
G1 X205.749 Y128.822 E.86408
G1 X205.749 Y128.288 E.0159
G1 X226.251 Y107.787 E.86408
G1 X226.251 Y107.253 E.0159
G1 X205.749 Y127.755 E.86408
G1 X205.749 Y127.221 E.0159
G1 X226.251 Y106.72 E.86408
G1 X226.251 Y106.186 E.0159
G1 X205.749 Y126.687 E.86408
G1 X205.749 Y126.154 E.0159
G1 X226.251 Y105.653 E.86408
G1 X226.251 Y105.119 E.0159
G1 X205.749 Y125.62 E.86408
G1 X205.749 Y125.087 E.0159
G1 X226.251 Y104.586 E.86408
G1 X226.251 Y104.052 E.0159
G1 X205.749 Y124.553 E.86408
G1 X205.749 Y124.02 E.0159
G1 X226.251 Y103.519 E.86408
G1 X226.251 Y102.985 E.0159
G1 X205.749 Y123.486 E.86408
G1 X205.749 Y122.952 E.0159
G1 X226.251 Y102.451 E.86408
G1 X226.251 Y101.918 E.0159
G1 X205.749 Y122.419 E.86408
G1 X205.749 Y121.885 E.0159
G1 X226.251 Y101.384 E.86408
G1 X226.251 Y100.851 E.0159
G1 X205.749 Y121.352 E.86408
G1 X205.749 Y120.818 E.0159
G1 X226.251 Y100.317 E.86408
G1 X226.251 Y99.784 E.0159
G1 X205.749 Y120.285 E.86408
G1 X205.749 Y119.751 E.0159
G1 X226.251 Y99.25 E.86408
G1 X226.251 Y98.716 E.0159
G1 X205.749 Y119.217 E.86408
G1 X205.749 Y118.684 E.0159
G1 X226.251 Y98.183 E.86408
G1 X226.251 Y97.649 E.0159
G1 X205.749 Y118.15 E.86408
G1 X205.749 Y117.617 E.0159
G1 X226.251 Y97.116 E.86408
G1 X226.251 Y96.582 E.0159
G1 X205.749 Y117.083 E.86408
G1 X205.749 Y116.55 E.0159
G1 X226.251 Y96.049 E.86408
G1 X226.251 Y95.515 E.0159
G1 X205.749 Y116.016 E.86408
G1 X205.749 Y115.482 E.0159
G1 X226.251 Y94.981 E.86408
G1 X226.251 Y94.448 E.0159
G1 X205.749 Y114.949 E.86408
G1 X205.749 Y114.415 E.0159
G1 X226.251 Y93.914 E.86408
G1 X226.251 Y93.381 E.0159
G1 X205.749 Y113.882 E.86408
G1 X205.749 Y113.348 E.0159
G1 X226.251 Y92.847 E.86408
G1 X226.251 Y92.314 E.0159
G1 X205.749 Y112.815 E.86408
G1 X205.749 Y112.281 E.0159
G1 X226.251 Y91.78 E.86408
G1 X226.251 Y91.246 E.0159
G1 X205.749 Y111.748 E.86408
G1 X205.749 Y111.214 E.0159
G1 X226.251 Y90.713 E.86408
G1 X226.251 Y90.179 E.0159
G1 X205.749 Y110.68 E.86408
G1 X205.749 Y110.147 E.0159
G1 X226.251 Y89.646 E.86408
G1 X226.251 Y89.112 E.0159
G1 X205.749 Y109.613 E.86408
G1 X205.749 Y109.08 E.0159
G1 X226.251 Y88.579 E.86408
G1 X226.251 Y88.045 E.0159
G1 X205.749 Y108.546 E.86408
G1 X205.749 Y108.013 E.0159
G1 X226.251 Y87.511 E.86408
G1 X226.251 Y86.978 E.0159
G1 X205.749 Y107.479 E.86408
G1 X205.749 Y106.945 E.0159
G1 X226.251 Y86.444 E.86408
G1 X226.251 Y85.911 E.0159
G1 X205.749 Y106.412 E.86408
G1 X205.749 Y105.878 E.0159
G1 X226.251 Y85.377 E.86408
G1 X226.251 Y84.844 E.0159
G1 X205.749 Y105.345 E.86408
G1 X205.749 Y104.811 E.0159
G1 X226.251 Y84.31 E.86408
G1 X226.251 Y83.776 E.0159
G1 X205.749 Y104.278 E.86408
G1 X205.749 Y103.744 E.0159
G1 X226.251 Y83.243 E.86408
G1 X226.251 Y82.709 E.0159
G1 X205.749 Y103.21 E.86408
M73 P29 R54
G1 X205.749 Y102.677 E.0159
G1 X226.251 Y82.176 E.86408
G1 X226.251 Y81.642 E.0159
G1 X205.749 Y102.143 E.86408
G1 X205.749 Y101.61 E.0159
G1 X226.251 Y81.109 E.86408
G1 X226.251 Y80.575 E.0159
G1 X205.749 Y101.076 E.86408
G1 X205.749 Y100.543 E.0159
G1 X226.251 Y80.041 E.86408
G1 X226.251 Y79.508 E.0159
G1 X205.749 Y100.009 E.86408
G1 X205.749 Y99.475 E.0159
G1 X226.251 Y78.974 E.86408
G1 X226.251 Y78.441 E.0159
G1 X205.749 Y98.942 E.86408
G1 X205.749 Y98.408 E.0159
G1 X226.251 Y77.907 E.86408
G1 X226.251 Y77.374 E.0159
G1 X205.749 Y97.875 E.86408
G1 X205.749 Y97.341 E.0159
G1 X226.251 Y76.84 E.86408
G1 X226.251 Y76.307 E.0159
G1 X205.749 Y96.808 E.86408
G1 X205.749 Y96.274 E.0159
G1 X226.251 Y75.773 E.86408
G1 X226.251 Y75.239 E.0159
G1 X205.749 Y95.74 E.86408
G1 X205.749 Y95.207 E.0159
G1 X226.251 Y74.706 E.86408
G1 X226.251 Y74.172 E.0159
G1 X205.749 Y94.673 E.86408
G1 X205.749 Y94.14 E.0159
G1 X226.251 Y73.639 E.86408
G1 X226.251 Y73.105 E.0159
G1 X205.749 Y93.606 E.86408
G1 X205.749 Y93.073 E.0159
G1 X226.251 Y72.572 E.86408
G1 X226.251 Y72.038 E.0159
G1 X205.749 Y92.539 E.86408
G1 X205.749 Y92.005 E.0159
G1 X226.251 Y71.504 E.86408
G1 X226.251 Y70.971 E.0159
G1 X205.749 Y91.472 E.86408
G1 X205.749 Y90.938 E.0159
G1 X226.251 Y70.437 E.86408
G1 X226.251 Y69.904 E.0159
G1 X205.749 Y90.405 E.86408
G1 X205.749 Y89.871 E.0159
G1 X226.251 Y69.37 E.86408
G1 X226.251 Y68.837 E.0159
G1 X205.749 Y89.338 E.86408
G1 X205.749 Y88.804 E.0159
G1 X226.251 Y68.303 E.86408
G1 X226.251 Y67.769 E.0159
G1 X205.749 Y88.27 E.86408
G1 X205.749 Y87.737 E.0159
G1 X226.251 Y67.236 E.86408
G1 X226.251 Y66.702 E.0159
G1 X205.749 Y87.203 E.86408
G1 X205.749 Y86.67 E.0159
G1 X226.251 Y66.169 E.86408
G1 X226.251 Y65.635 E.0159
G1 X205.749 Y86.136 E.86408
G1 X205.749 Y85.603 E.0159
G1 X226.251 Y65.102 E.86408
G1 X226.251 Y64.568 E.0159
G1 X205.749 Y85.069 E.86408
G1 X205.749 Y84.536 E.0159
G1 X226.251 Y64.034 E.86408
G1 X226.251 Y63.501 E.0159
G1 X205.749 Y84.002 E.86408
G1 X205.749 Y83.468 E.0159
G1 X226.251 Y62.967 E.86408
G1 X226.251 Y62.434 E.0159
G1 X205.749 Y82.935 E.86408
G1 X205.749 Y82.401 E.0159
G1 X226.251 Y61.9 E.86408
G1 X226.251 Y61.367 E.0159
G1 X205.749 Y81.868 E.86408
G1 X205.749 Y81.334 E.0159
G1 X226.251 Y60.833 E.86408
G1 X226.251 Y60.299 E.0159
G1 X205.749 Y80.801 E.86408
G1 X205.749 Y80.267 E.0159
G1 X226.251 Y59.766 E.86408
G1 X226.251 Y59.232 E.0159
G1 X205.749 Y79.733 E.86408
G1 X205.749 Y79.2 E.0159
G1 X226.251 Y58.699 E.86408
G1 X226.251 Y58.165 E.0159
G1 X205.749 Y78.666 E.86408
G1 X205.749 Y78.133 E.0159
G1 X226.251 Y57.632 E.86408
G1 X226.251 Y57.098 E.0159
G1 X205.749 Y77.599 E.86408
G1 X205.749 Y77.066 E.0159
G1 X226.251 Y56.564 E.86408
G1 X226.251 Y56.031 E.0159
G1 X205.749 Y76.532 E.86408
G1 X205.749 Y75.998 E.0159
G1 X226.251 Y55.497 E.86408
G1 X226.251 Y54.964 E.0159
G1 X205.749 Y75.465 E.86408
G1 X205.749 Y74.931 E.0159
G1 X226.251 Y54.43 E.86408
G1 X226.251 Y53.897 E.0159
G1 X205.749 Y74.398 E.86408
G1 X205.749 Y73.864 E.0159
G1 X226.251 Y53.363 E.86408
G1 X226.251 Y52.829 E.0159
G1 X205.749 Y73.331 E.86408
G1 X205.749 Y72.797 E.0159
G1 X226.251 Y52.296 E.86408
G1 X226.251 Y51.762 E.0159
G1 X205.749 Y72.263 E.86408
G1 X205.749 Y71.73 E.0159
G1 X226.251 Y51.229 E.86408
G1 X226.251 Y50.695 E.0159
G1 X205.749 Y71.196 E.86408
G1 X205.749 Y70.663 E.0159
G1 X226.251 Y50.162 E.86408
G1 X226.251 Y49.628 E.0159
G1 X205.749 Y70.129 E.86408
G1 X205.749 Y69.596 E.0159
G1 X226.251 Y49.095 E.86408
G1 X226.251 Y48.561 E.0159
G1 X205.749 Y69.062 E.86408
G1 X205.749 Y68.528 E.0159
G1 X226.251 Y48.027 E.86408
G1 X226.251 Y47.494 E.0159
G1 X205.749 Y67.995 E.86408
G1 X205.749 Y67.461 E.0159
G1 X226.251 Y46.96 E.86408
G1 X226.251 Y46.427 E.0159
G1 X205.749 Y66.928 E.86408
G1 X205.749 Y66.394 E.0159
G1 X226.251 Y45.893 E.86408
G1 X226.251 Y45.36 E.0159
G1 X205.749 Y65.861 E.86408
G1 X205.749 Y65.327 E.0159
G1 X226.251 Y44.826 E.86408
G1 X226.251 Y44.292 E.0159
G1 X205.749 Y64.793 E.86408
G1 X205.749 Y64.26 E.0159
G1 X226.251 Y43.759 E.86408
G1 X226.251 Y43.225 E.0159
G1 X205.749 Y63.726 E.86408
G1 X205.749 Y63.193 E.0159
G1 X226.251 Y42.692 E.86408
G1 X226.251 Y42.158 E.0159
G1 X205.749 Y62.659 E.86408
G1 X205.749 Y62.126 E.0159
G1 X226.251 Y41.625 E.86408
G1 X226.251 Y41.091 E.0159
G1 X205.749 Y61.592 E.86408
G1 X205.749 Y61.058 E.0159
G1 X226.251 Y40.557 E.86408
G1 X226.251 Y40.024 E.0159
G1 X205.749 Y60.525 E.86408
G1 X205.749 Y59.991 E.0159
G1 X226.251 Y39.49 E.86408
G1 X226.251 Y38.957 E.0159
G1 X205.749 Y59.458 E.86408
G1 X205.749 Y58.924 E.0159
G1 X217.215 Y47.459 E.48324
G3 X216.503 Y47.637 I-1.25 J-3.488 E.0219
G1 X205.749 Y58.391 E.45325
G1 X205.749 Y57.857 E.0159
G1 X215.932 Y47.675 E.42915
G3 X215.444 Y47.629 I.221 J-4.936 E.0146
G1 X205.749 Y57.324 E.40861
G1 X205.749 Y56.79 E.0159
G1 X215.008 Y47.531 E.39025
G3 X214.614 Y47.392 I.496 J-2.034 E.01248
G1 X205.749 Y56.256 E.37363
G1 X205.749 Y55.723 E.0159
G1 X214.255 Y47.217 E.35851
G3 X213.929 Y47.01 I.87 J-1.735 E.01154
G1 X205.749 Y55.189 E.34474
G1 X205.749 Y54.656 E.0159
G1 X213.633 Y46.772 E.33229
G3 X213.367 Y46.505 I1.199 J-1.466 E.01126
G1 X205.496 Y54.376 E.33173
G1 X204.962 Y54.376 E.0159
G1 X213.128 Y46.21 E.34417
G3 X212.919 Y45.885 I1.517 J-1.205 E.01153
G1 X204.429 Y54.376 E.35786
G1 X203.895 Y54.376 E.0159
G1 X212.742 Y45.529 E.37288
G3 X212.6 Y45.137 I1.889 J-.907 E.01243
G1 X203.362 Y54.376 E.38938
G1 X202.828 Y54.376 E.0159
G1 X212.498 Y44.705 E.40758
G3 X212.453 Y44.217 I4.415 J-.658 E.01461
G1 X202.295 Y54.376 E.42815
G1 X201.761 Y54.376 E.0159
G1 X212.482 Y43.654 E.45187
G3 X212.649 Y42.954 I4.041 J.593 E.02149
G1 X201.227 Y54.376 E.4814
G1 X200.694 Y54.376 E.0159
G1 X221.195 Y33.874 E.86408
G1 X221.729 Y33.874 E.0159
G1 X214.829 Y40.774 E.2908
G3 X215.528 Y40.608 I1.289 J3.884 E.02144
G1 X222.262 Y33.874 E.28382
G1 X222.796 Y33.874 E.0159
G1 X216.091 Y40.579 E.28258
G3 X216.581 Y40.623 I.026 J2.468 E.01468
G1 X223.329 Y33.874 E.28443
G1 X223.863 Y33.874 E.0159
G1 X217.014 Y40.724 E.28867
G3 X217.404 Y40.867 I-.522 J2.022 E.01241
G1 X224.396 Y33.874 E.29472
G1 X224.93 Y33.874 E.0159
G1 X217.76 Y41.045 E.30222
G3 X218.084 Y41.254 I-.885 J1.726 E.01152
G1 X225.464 Y33.874 E.31104
G1 X225.997 Y33.874 E.0159
G1 X218.379 Y41.493 E.32111
G3 X218.645 Y41.76 I-1.203 J1.465 E.01126
G1 X226.251 Y34.155 E.32057
G1 X226.251 Y34.688 E.0159
G1 X218.883 Y42.056 E.31054
G3 X219.091 Y42.381 I-1.524 J1.208 E.01153
G1 X226.251 Y35.222 E.30175
G1 X226.251 Y35.755 E.0159
G1 X219.269 Y42.737 E.29427
G3 X219.408 Y43.132 I-6.832 J2.623 E.01247
G1 X226.251 Y36.289 E.28842
G1 X226.251 Y36.822 E.0159
G1 X219.504 Y43.569 E.28437
G3 X219.548 Y44.058 I-2.421 J.468 E.01465
G1 X226.251 Y37.356 E.28249
G1 X226.251 Y37.89 E.0159
G1 X219.511 Y44.629 E.28404
G3 X219.332 Y45.342 I-3.514 J-.505 E.02195
G1 X226.42 Y38.253 E.29875
; WIPE_START
G1 X225.006 Y39.668 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X218.446 Y43.569 Z.8 F30000
G1 X199.991 Y54.545 Z.8
G1 Z.4
G1 E.8 F1800
G1 F9541.731
G1 X220.661 Y33.874 E.87123
G1 X220.128 Y33.874 E.0159
G1 X199.627 Y54.376 E.86408
G1 X199.093 Y54.376 E.0159
G1 X219.594 Y33.874 E.86408
G1 X219.061 Y33.874 E.0159
G1 X198.56 Y54.376 E.86408
G1 X198.026 Y54.376 E.0159
G1 X218.527 Y33.874 E.86408
M73 P29 R53
G1 X217.994 Y33.874 E.0159
G1 X197.493 Y54.376 E.86408
G1 X196.959 Y54.376 E.0159
G1 X217.46 Y33.874 E.86408
G1 X216.926 Y33.874 E.0159
G1 X196.425 Y54.376 E.86408
G1 X195.892 Y54.376 E.0159
G1 X216.393 Y33.874 E.86408
G1 X215.859 Y33.874 E.0159
G1 X195.358 Y54.376 E.86408
G1 X194.825 Y54.376 E.0159
G1 X215.326 Y33.874 E.86408
G1 X214.792 Y33.874 E.0159
G1 X194.291 Y54.376 E.86408
G1 X193.758 Y54.376 E.0159
G1 X214.259 Y33.874 E.86408
G1 X213.725 Y33.874 E.0159
G1 X193.224 Y54.376 E.86408
G1 X192.69 Y54.376 E.0159
G1 X213.191 Y33.874 E.86408
G1 X212.658 Y33.874 E.0159
G1 X192.157 Y54.376 E.86408
G1 X191.623 Y54.376 E.0159
G1 X212.124 Y33.874 E.86408
G1 X211.591 Y33.874 E.0159
G1 X191.09 Y54.376 E.86408
G1 X190.556 Y54.376 E.0159
G1 X211.057 Y33.874 E.86408
G1 X210.524 Y33.874 E.0159
G1 X190.023 Y54.376 E.86408
G1 X189.489 Y54.376 E.0159
G1 X209.99 Y33.874 E.86408
G1 X209.456 Y33.874 E.0159
G1 X188.955 Y54.376 E.86408
G1 X188.422 Y54.376 E.0159
G1 X208.923 Y33.874 E.86408
G1 X208.389 Y33.874 E.0159
G1 X187.888 Y54.376 E.86408
G1 X187.355 Y54.376 E.0159
G1 X207.856 Y33.874 E.86408
G1 X207.322 Y33.874 E.0159
G1 X186.821 Y54.376 E.86408
G1 X186.288 Y54.376 E.0159
G1 X206.789 Y33.874 E.86408
G1 X206.255 Y33.874 E.0159
G1 X185.754 Y54.376 E.86408
G1 X185.22 Y54.376 E.0159
G1 X205.722 Y33.874 E.86408
G1 X205.188 Y33.874 E.0159
G1 X184.687 Y54.376 E.86408
G1 X184.153 Y54.376 E.0159
G1 X204.654 Y33.874 E.86408
G1 X204.121 Y33.874 E.0159
G1 X183.62 Y54.376 E.86408
G1 X183.086 Y54.376 E.0159
G1 X203.587 Y33.874 E.86408
G1 X203.054 Y33.874 E.0159
G1 X182.553 Y54.376 E.86408
G1 X182.019 Y54.376 E.0159
G1 X202.52 Y33.874 E.86408
G1 X201.987 Y33.874 E.0159
G1 X181.485 Y54.376 E.86408
G1 X180.952 Y54.376 E.0159
G1 X201.453 Y33.874 E.86408
G1 X200.919 Y33.874 E.0159
G1 X180.418 Y54.376 E.86408
G1 X179.885 Y54.376 E.0159
G1 X200.386 Y33.874 E.86408
G1 X199.852 Y33.874 E.0159
G1 X179.351 Y54.376 E.86408
G1 X178.818 Y54.376 E.0159
G1 X199.319 Y33.874 E.86408
G1 X198.785 Y33.874 E.0159
G1 X178.284 Y54.376 E.86408
G1 X177.75 Y54.376 E.0159
G1 X198.252 Y33.874 E.86408
G1 X197.718 Y33.874 E.0159
G1 X177.217 Y54.376 E.86408
G1 X176.683 Y54.376 E.0159
G1 X197.184 Y33.874 E.86408
G1 X196.651 Y33.874 E.0159
G1 X176.15 Y54.376 E.86408
G1 X175.616 Y54.376 E.0159
G1 X196.117 Y33.874 E.86408
G1 X195.584 Y33.874 E.0159
G1 X175.083 Y54.376 E.86408
G1 X174.549 Y54.376 E.0159
G1 X195.05 Y33.874 E.86408
G1 X194.517 Y33.874 E.0159
G1 X174.015 Y54.376 E.86408
G1 X173.482 Y54.376 E.0159
G1 X193.983 Y33.874 E.86408
G1 X193.449 Y33.874 E.0159
G1 X172.948 Y54.376 E.86408
G1 X172.415 Y54.376 E.0159
G1 X192.916 Y33.874 E.86408
G1 X192.382 Y33.874 E.0159
G1 X171.881 Y54.376 E.86408
G1 X171.348 Y54.376 E.0159
G1 X191.849 Y33.874 E.86408
G1 X191.315 Y33.874 E.0159
G1 X170.814 Y54.376 E.86408
G1 X170.281 Y54.376 E.0159
G1 X190.782 Y33.874 E.86408
G1 X190.248 Y33.874 E.0159
G1 X169.747 Y54.376 E.86408
G1 X169.213 Y54.376 E.0159
G1 X189.714 Y33.874 E.86408
G1 X189.181 Y33.874 E.0159
G1 X168.68 Y54.376 E.86408
G1 X168.146 Y54.376 E.0159
G1 X188.647 Y33.874 E.86408
G1 X188.114 Y33.874 E.0159
G1 X167.613 Y54.376 E.86408
G1 X167.079 Y54.376 E.0159
G1 X187.58 Y33.874 E.86408
G1 X187.047 Y33.874 E.0159
G1 X166.546 Y54.376 E.86408
G1 X166.012 Y54.376 E.0159
G1 X186.513 Y33.874 E.86408
G1 X185.979 Y33.874 E.0159
G1 X165.478 Y54.376 E.86408
G1 X164.945 Y54.376 E.0159
G1 X185.446 Y33.874 E.86408
G1 X184.912 Y33.874 E.0159
G1 X164.411 Y54.376 E.86408
G1 X163.878 Y54.376 E.0159
G1 X184.379 Y33.874 E.86408
G1 X183.845 Y33.874 E.0159
G1 X163.344 Y54.376 E.86408
G1 X162.811 Y54.376 E.0159
G1 X183.312 Y33.874 E.86408
G1 X182.778 Y33.874 E.0159
G1 X162.277 Y54.376 E.86408
G1 X161.743 Y54.376 E.0159
G1 X182.244 Y33.874 E.86408
G1 X181.711 Y33.874 E.0159
G1 X161.21 Y54.376 E.86408
G1 X160.676 Y54.376 E.0159
G1 X181.177 Y33.874 E.86408
G1 X180.644 Y33.874 E.0159
G1 X160.143 Y54.376 E.86408
G1 X159.609 Y54.376 E.0159
G1 X180.11 Y33.874 E.86408
G1 X179.577 Y33.874 E.0159
G1 X159.076 Y54.376 E.86408
G1 X158.542 Y54.376 E.0159
G1 X179.043 Y33.874 E.86408
G1 X178.51 Y33.874 E.0159
G1 X158.008 Y54.376 E.86408
G1 X157.475 Y54.376 E.0159
G1 X177.976 Y33.874 E.86408
G1 X177.442 Y33.874 E.0159
G1 X156.941 Y54.376 E.86408
G1 X156.408 Y54.376 E.0159
G1 X176.909 Y33.874 E.86408
G1 X176.375 Y33.874 E.0159
G1 X155.874 Y54.376 E.86408
G1 X155.341 Y54.376 E.0159
G1 X175.842 Y33.874 E.86408
G1 X175.308 Y33.874 E.0159
G1 X154.807 Y54.376 E.86408
G1 X154.273 Y54.376 E.0159
G1 X174.775 Y33.874 E.86408
G1 X174.241 Y33.874 E.0159
G1 X153.74 Y54.376 E.86408
G1 X153.206 Y54.376 E.0159
G1 X173.707 Y33.874 E.86408
G1 X173.174 Y33.874 E.0159
G1 X152.673 Y54.376 E.86408
G1 X152.139 Y54.376 E.0159
G1 X172.64 Y33.874 E.86408
G1 X172.107 Y33.874 E.0159
G1 X151.606 Y54.376 E.86408
G1 X151.072 Y54.376 E.0159
G1 X171.573 Y33.874 E.86408
G1 X171.04 Y33.874 E.0159
G1 X150.538 Y54.376 E.86408
G1 X150.005 Y54.376 E.0159
G1 X170.506 Y33.874 E.86408
G1 X169.972 Y33.874 E.0159
G1 X149.471 Y54.376 E.86408
G1 X148.938 Y54.376 E.0159
G1 X169.439 Y33.874 E.86408
G1 X168.905 Y33.874 E.0159
G1 X148.404 Y54.376 E.86408
G1 X147.871 Y54.376 E.0159
G1 X168.372 Y33.874 E.86408
G1 X167.838 Y33.874 E.0159
G1 X147.337 Y54.376 E.86408
G1 X146.803 Y54.376 E.0159
G1 X167.305 Y33.874 E.86408
G1 X166.771 Y33.874 E.0159
G1 X146.27 Y54.376 E.86408
G1 X145.736 Y54.376 E.0159
G1 X166.237 Y33.874 E.86408
G1 X165.704 Y33.874 E.0159
G1 X145.203 Y54.376 E.86408
G1 X144.669 Y54.376 E.0159
G1 X165.17 Y33.874 E.86408
G1 X164.637 Y33.874 E.0159
G1 X144.136 Y54.376 E.86408
G1 X143.602 Y54.376 E.0159
G1 X164.103 Y33.874 E.86408
G1 X163.57 Y33.874 E.0159
G1 X143.068 Y54.376 E.86408
G1 X142.535 Y54.376 E.0159
G1 X163.036 Y33.874 E.86408
G1 X162.502 Y33.874 E.0159
G1 X142.001 Y54.376 E.86408
G1 X141.468 Y54.376 E.0159
G1 X161.969 Y33.874 E.86408
G1 X161.435 Y33.874 E.0159
G1 X140.934 Y54.376 E.86408
G1 X140.401 Y54.376 E.0159
G1 X160.902 Y33.874 E.86408
G1 X160.368 Y33.874 E.0159
G1 X139.867 Y54.376 E.86408
G1 X139.334 Y54.376 E.0159
G1 X159.835 Y33.874 E.86408
G1 X159.301 Y33.874 E.0159
G1 X138.8 Y54.376 E.86408
G1 X138.266 Y54.376 E.0159
G1 X158.767 Y33.874 E.86408
G1 X158.234 Y33.874 E.0159
G1 X137.733 Y54.376 E.86408
G1 X137.199 Y54.376 E.0159
G1 X157.7 Y33.874 E.86408
M73 P30 R53
G1 X157.167 Y33.874 E.0159
G1 X136.666 Y54.376 E.86408
G1 X136.132 Y54.376 E.0159
G1 X156.633 Y33.874 E.86408
G1 X156.1 Y33.874 E.0159
G1 X135.599 Y54.376 E.86408
G1 X135.065 Y54.376 E.0159
G1 X155.566 Y33.874 E.86408
G1 X155.032 Y33.874 E.0159
G1 X134.531 Y54.376 E.86408
G1 X133.998 Y54.376 E.0159
G1 X154.499 Y33.874 E.86408
G1 X153.965 Y33.874 E.0159
G1 X133.464 Y54.376 E.86408
G1 X132.931 Y54.376 E.0159
G1 X153.432 Y33.874 E.86408
G1 X152.898 Y33.874 E.0159
G1 X132.397 Y54.376 E.86408
G1 X131.864 Y54.376 E.0159
G1 X152.365 Y33.874 E.86408
G1 X151.831 Y33.874 E.0159
G1 X131.33 Y54.376 E.86408
G1 X130.796 Y54.376 E.0159
G1 X151.297 Y33.874 E.86408
G1 X150.764 Y33.874 E.0159
G1 X130.263 Y54.376 E.86408
G1 X129.729 Y54.376 E.0159
G1 X150.23 Y33.874 E.86408
G1 X149.697 Y33.874 E.0159
G1 X129.196 Y54.376 E.86408
G1 X128.662 Y54.376 E.0159
G1 X149.163 Y33.874 E.86408
G1 X148.63 Y33.874 E.0159
G1 X128.129 Y54.376 E.86408
G1 X127.595 Y54.376 E.0159
G1 X148.096 Y33.874 E.86408
G1 X147.563 Y33.874 E.0159
G1 X127.061 Y54.376 E.86408
G1 X126.528 Y54.376 E.0159
G1 X147.029 Y33.874 E.86408
G1 X146.495 Y33.874 E.0159
G1 X125.994 Y54.376 E.86408
G1 X125.461 Y54.376 E.0159
G1 X145.962 Y33.874 E.86408
G1 X145.428 Y33.874 E.0159
G1 X124.927 Y54.376 E.86408
G1 X124.394 Y54.376 E.0159
G1 X144.895 Y33.874 E.86408
G1 X144.361 Y33.874 E.0159
G1 X123.86 Y54.376 E.86408
G1 X123.326 Y54.376 E.0159
G1 X143.828 Y33.874 E.86408
G1 X143.294 Y33.874 E.0159
G1 X122.793 Y54.376 E.86408
G1 X122.259 Y54.376 E.0159
G1 X129.156 Y47.479 E.29069
G3 X128.459 Y47.642 I-1.159 J-3.369 E.02139
G1 X121.726 Y54.376 E.28378
G1 X121.192 Y54.376 E.0159
G1 X127.894 Y47.674 E.28245
G3 X127.411 Y47.623 I.014 J-2.434 E.01448
G1 X120.659 Y54.376 E.2846
G1 X120.125 Y54.376 E.0159
G1 X126.978 Y47.522 E.28885
G3 X126.586 Y47.381 I.512 J-2.029 E.01244
G1 X119.591 Y54.376 E.29482
G1 X119.058 Y54.376 E.0159
G1 X126.23 Y47.204 E.30228
G3 X125.907 Y46.993 I6.433 J-10.208 E.01149
G1 X118.524 Y54.376 E.31116
G1 X117.991 Y54.376 E.0159
G1 X125.614 Y46.753 E.32129
G3 X125.349 Y46.484 I1.207 J-1.455 E.01126
G1 X117.457 Y54.376 E.33262
G1 X116.924 Y54.376 E.0159
G1 X125.112 Y46.187 E.34514
G3 X124.906 Y45.86 I1.528 J-1.196 E.01154
G1 X116.39 Y54.376 E.35892
G1 X115.856 Y54.376 E.0159
G1 X124.731 Y45.501 E.37403
G3 X124.591 Y45.108 I1.898 J-.895 E.01247
G1 X115.323 Y54.376 E.39063
G1 X114.789 Y54.376 E.0159
G1 X124.492 Y44.673 E.40894
G3 X124.453 Y44.179 I4.852 J-.632 E.01479
G1 X114.256 Y54.376 E.42978
G1 X113.722 Y54.376 E.0159
G1 X124.486 Y43.611 E.45369
G3 X124.669 Y42.895 I2.422 J.236 E.0221
G1 X113.189 Y54.376 E.48387
G1 X112.655 Y54.376 E.0159
G1 X133.156 Y33.874 E.86408
G1 X133.69 Y33.874 E.0159
G1 X126.765 Y40.799 E.29185
G3 X127.482 Y40.616 I1.244 J3.379 E.02208
G1 X134.223 Y33.874 E.28415
G1 X134.757 Y33.874 E.0159
G1 X128.053 Y40.578 E.28254
G3 X128.546 Y40.618 I.044 J2.483 E.01477
G1 X135.29 Y33.874 E.28425
G1 X135.824 Y33.874 E.0159
G1 X128.985 Y40.714 E.28826
G3 X129.377 Y40.855 I-.508 J2.029 E.01245
G1 X136.358 Y33.874 E.29421
G1 X136.891 Y33.874 E.0159
G1 X129.735 Y41.031 E.30162
G3 X130.061 Y41.238 I-.872 J1.732 E.01154
G1 X137.425 Y33.874 E.31036
G1 X137.958 Y33.874 E.0159
G1 X130.358 Y41.475 E.32034
G3 X130.626 Y41.74 I-1.19 J1.472 E.01126
G1 X138.492 Y33.874 E.33152
G1 X139.025 Y33.874 E.0159
G1 X130.866 Y42.034 E.3439
G3 X131.077 Y42.357 I-1.513 J1.217 E.01151
G1 X139.559 Y33.874 E.35752
G1 X140.093 Y33.874 E.0159
G1 X131.256 Y42.711 E.37244
G3 X131.4 Y43.101 I-6.568 J2.638 E.01239
G1 X140.626 Y33.874 E.38888
G1 X141.16 Y33.874 E.0159
G1 X131.498 Y43.536 E.4072
G3 X131.546 Y44.021 I-2.402 J.483 E.01457
G1 X141.693 Y33.874 E.42767
G1 X142.227 Y33.874 E.0159
G1 X131.518 Y44.583 E.45135
G3 X131.354 Y45.281 I-3.634 J-.486 E.02139
G1 X142.93 Y33.705 E.4879
; WIPE_START
G1 X141.516 Y35.119 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X135.137 Y39.31 Z.8 F30000
G1 X111.952 Y54.545 Z.8
G1 Z.4
G1 E.8 F1800
G1 F9541.731
G1 X132.623 Y33.874 E.87123
G1 X132.089 Y33.874 E.0159
G1 X111.588 Y54.376 E.86408
G1 X111.054 Y54.376 E.0159
G1 X131.555 Y33.874 E.86408
G1 X131.022 Y33.874 E.0159
G1 X110.521 Y54.376 E.86408
G1 X109.987 Y54.376 E.0159
G1 X130.488 Y33.874 E.86408
G1 X129.955 Y33.874 E.0159
G1 X109.454 Y54.376 E.86408
G1 X108.92 Y54.376 E.0159
G1 X129.421 Y33.874 E.86408
G1 X128.888 Y33.874 E.0159
G1 X108.387 Y54.376 E.86408
G1 X107.853 Y54.376 E.0159
G1 X128.354 Y33.874 E.86408
G1 X127.82 Y33.874 E.0159
G1 X107.319 Y54.376 E.86408
G1 X106.786 Y54.376 E.0159
G1 X127.287 Y33.874 E.86408
G1 X126.753 Y33.874 E.0159
G1 X106.252 Y54.376 E.86408
G1 X105.719 Y54.376 E.0159
G1 X126.22 Y33.874 E.86408
G1 X125.686 Y33.874 E.0159
G1 X105.185 Y54.376 E.86408
G1 X104.652 Y54.376 E.0159
G1 X125.153 Y33.874 E.86408
G1 X124.619 Y33.874 E.0159
G1 X104.118 Y54.376 E.86408
G1 X103.584 Y54.376 E.0159
G1 X124.085 Y33.874 E.86408
G1 X123.552 Y33.874 E.0159
G1 X103.051 Y54.376 E.86408
G1 X102.517 Y54.376 E.0159
G1 X123.018 Y33.874 E.86408
G1 X122.485 Y33.874 E.0159
G1 X101.984 Y54.376 E.86408
G1 X101.45 Y54.376 E.0159
G1 X121.951 Y33.874 E.86408
G1 X121.418 Y33.874 E.0159
G1 X100.917 Y54.376 E.86408
G1 X100.383 Y54.376 E.0159
G1 X120.884 Y33.874 E.86408
G1 X120.351 Y33.874 E.0159
G1 X99.849 Y54.376 E.86408
G1 X99.316 Y54.376 E.0159
G1 X119.817 Y33.874 E.86408
G1 X119.283 Y33.874 E.0159
G1 X98.782 Y54.376 E.86408
G1 X98.249 Y54.376 E.0159
G1 X118.75 Y33.874 E.86408
G1 X118.216 Y33.874 E.0159
G1 X97.715 Y54.376 E.86408
G1 X97.182 Y54.376 E.0159
G1 X117.683 Y33.874 E.86408
G1 X117.149 Y33.874 E.0159
G1 X96.648 Y54.376 E.86408
G1 X96.114 Y54.376 E.0159
G1 X116.616 Y33.874 E.86408
G1 X116.082 Y33.874 E.0159
G1 X95.581 Y54.376 E.86408
G1 X95.047 Y54.376 E.0159
G1 X115.548 Y33.874 E.86408
G1 X115.015 Y33.874 E.0159
G1 X94.514 Y54.376 E.86408
G1 X93.98 Y54.376 E.0159
G1 X114.481 Y33.874 E.86408
G1 X113.948 Y33.874 E.0159
G1 X93.447 Y54.376 E.86408
G1 X92.913 Y54.376 E.0159
G1 X113.414 Y33.874 E.86408
G1 X112.881 Y33.874 E.0159
G1 X92.379 Y54.376 E.86408
G1 X91.846 Y54.376 E.0159
G1 X112.347 Y33.874 E.86408
G1 X111.813 Y33.874 E.0159
G1 X91.312 Y54.376 E.86408
G1 X90.779 Y54.376 E.0159
G1 X111.28 Y33.874 E.86408
G1 X110.746 Y33.874 E.0159
G1 X90.245 Y54.376 E.86408
G1 X89.712 Y54.376 E.0159
G1 X110.213 Y33.874 E.86408
G1 X109.679 Y33.874 E.0159
G1 X89.178 Y54.376 E.86408
G1 X88.644 Y54.376 E.0159
G1 X109.146 Y33.874 E.86408
G1 X108.612 Y33.874 E.0159
G1 X88.111 Y54.376 E.86408
G1 X87.577 Y54.376 E.0159
G1 X108.078 Y33.874 E.86408
G1 X107.545 Y33.874 E.0159
G1 X87.044 Y54.376 E.86408
G1 X86.51 Y54.376 E.0159
G1 X107.011 Y33.874 E.86408
G1 X106.478 Y33.874 E.0159
G1 X85.977 Y54.376 E.86408
G1 X85.443 Y54.376 E.0159
G1 X105.944 Y33.874 E.86408
G1 X105.411 Y33.874 E.0159
G1 X84.91 Y54.376 E.86408
G1 X84.376 Y54.376 E.0159
G1 X104.877 Y33.874 E.86408
G1 X104.343 Y33.874 E.0159
G1 X83.842 Y54.376 E.86408
G1 X83.309 Y54.376 E.0159
G1 X103.81 Y33.874 E.86408
G1 X103.276 Y33.874 E.0159
G1 X82.775 Y54.376 E.86408
G1 X82.242 Y54.376 E.0159
G1 X102.743 Y33.874 E.86408
G1 X102.209 Y33.874 E.0159
G1 X81.708 Y54.376 E.86408
G1 X81.175 Y54.376 E.0159
G1 X101.676 Y33.874 E.86408
G1 X101.142 Y33.874 E.0159
G1 X80.641 Y54.376 E.86408
G1 X80.107 Y54.376 E.0159
G1 X100.608 Y33.874 E.86408
G1 X100.075 Y33.874 E.0159
G1 X79.574 Y54.376 E.86408
G1 X79.04 Y54.376 E.0159
G1 X99.541 Y33.874 E.86408
G1 X99.008 Y33.874 E.0159
G1 X78.507 Y54.376 E.86408
G1 X77.973 Y54.376 E.0159
G1 X98.474 Y33.874 E.86408
G1 X97.941 Y33.874 E.0159
G1 X77.44 Y54.376 E.86408
G1 X76.906 Y54.376 E.0159
G1 X97.407 Y33.874 E.86408
G1 X96.873 Y33.874 E.0159
G1 X76.372 Y54.376 E.86408
G1 X75.839 Y54.376 E.0159
G1 X96.34 Y33.874 E.86408
G1 X95.806 Y33.874 E.0159
G1 X75.305 Y54.376 E.86408
G1 X74.772 Y54.376 E.0159
G1 X95.273 Y33.874 E.86408
G1 X94.739 Y33.874 E.0159
G1 X74.238 Y54.376 E.86408
G1 X73.705 Y54.376 E.0159
G1 X94.206 Y33.874 E.86408
G1 X93.672 Y33.874 E.0159
G1 X73.171 Y54.376 E.86408
G1 X72.637 Y54.376 E.0159
G1 X93.139 Y33.874 E.86408
G1 X92.605 Y33.874 E.0159
G1 X72.104 Y54.376 E.86408
G1 X71.57 Y54.376 E.0159
G1 X92.071 Y33.874 E.86408
G1 X91.538 Y33.874 E.0159
G1 X71.037 Y54.376 E.86408
G1 X70.503 Y54.376 E.0159
G1 X91.004 Y33.874 E.86408
G1 X90.471 Y33.874 E.0159
G1 X69.97 Y54.376 E.86408
G1 X69.436 Y54.376 E.0159
G1 X89.937 Y33.874 E.86408
G1 X89.404 Y33.874 E.0159
G1 X68.902 Y54.376 E.86408
G1 X68.369 Y54.376 E.0159
G1 X88.87 Y33.874 E.86408
G1 X88.336 Y33.874 E.0159
G1 X67.835 Y54.376 E.86408
G1 X67.302 Y54.376 E.0159
G1 X87.803 Y33.874 E.86408
G1 X87.269 Y33.874 E.0159
G1 X66.768 Y54.376 E.86408
G1 X66.235 Y54.376 E.0159
G1 X86.736 Y33.874 E.86408
G1 X86.202 Y33.874 E.0159
G1 X65.701 Y54.376 E.86408
G1 X65.167 Y54.376 E.0159
G1 X85.669 Y33.874 E.86408
G1 X85.135 Y33.874 E.0159
G1 X64.634 Y54.376 E.86408
G1 X64.1 Y54.376 E.0159
G1 X84.601 Y33.874 E.86408
G1 X84.068 Y33.874 E.0159
G1 X63.567 Y54.376 E.86408
G1 X63.033 Y54.376 E.0159
G1 X83.534 Y33.874 E.86408
G1 X83.001 Y33.874 E.0159
G1 X62.5 Y54.376 E.86408
G1 X61.966 Y54.376 E.0159
G1 X82.467 Y33.874 E.86408
G1 X81.934 Y33.874 E.0159
G1 X61.432 Y54.376 E.86408
G1 X60.899 Y54.376 E.0159
G1 X81.4 Y33.874 E.86408
G1 X80.866 Y33.874 E.0159
G1 X60.365 Y54.376 E.86408
G1 X59.832 Y54.376 E.0159
G1 X80.333 Y33.874 E.86408
G1 X79.799 Y33.874 E.0159
G1 X59.298 Y54.376 E.86408
G1 X58.765 Y54.376 E.0159
G1 X79.266 Y33.874 E.86408
G1 X78.732 Y33.874 E.0159
G1 X58.231 Y54.376 E.86408
G1 X57.697 Y54.376 E.0159
G1 X78.199 Y33.874 E.86408
G1 X77.665 Y33.874 E.0159
G1 X57.164 Y54.376 E.86408
G1 X56.63 Y54.376 E.0159
G1 X77.131 Y33.874 E.86408
G1 X76.598 Y33.874 E.0159
G1 X56.097 Y54.376 E.86408
G1 X55.563 Y54.376 E.0159
G1 X76.064 Y33.874 E.86408
G1 X75.531 Y33.874 E.0159
G1 X55.03 Y54.376 E.86408
G1 X54.496 Y54.376 E.0159
G1 X74.997 Y33.874 E.86408
G1 X74.464 Y33.874 E.0159
G1 X53.963 Y54.376 E.86408
G1 X53.429 Y54.376 E.0159
G1 X73.93 Y33.874 E.86408
G1 X73.396 Y33.874 E.0159
G1 X52.895 Y54.376 E.86408
G1 X52.362 Y54.376 E.0159
G1 X72.863 Y33.874 E.86408
G1 X72.329 Y33.874 E.0159
G1 X51.828 Y54.376 E.86408
G1 X51.295 Y54.376 E.0159
G1 X71.796 Y33.874 E.86408
G1 X71.262 Y33.874 E.0159
G1 X50.761 Y54.376 E.86408
G1 X50.251 Y54.376 E.01522
G1 X50.251 Y54.886 E.01522
G1 X29.749 Y75.387 E.86408
G1 X29.749 Y75.921 E.0159
G1 X50.251 Y55.42 E.86408
G1 X50.251 Y55.953 E.0159
G1 X29.749 Y76.454 E.86408
G1 X29.749 Y76.988 E.0159
G1 X50.251 Y56.487 E.86408
G1 X50.251 Y57.02 E.0159
G1 X29.749 Y77.521 E.86408
G1 X29.749 Y78.055 E.0159
G1 X50.251 Y57.554 E.86408
G1 X50.251 Y58.088 E.0159
G1 X29.749 Y78.589 E.86408
G1 X29.749 Y79.122 E.0159
G1 X50.251 Y58.621 E.86408
G1 X50.251 Y59.155 E.0159
G1 X29.749 Y79.656 E.86408
G1 X29.749 Y80.189 E.0159
G1 X50.251 Y59.688 E.86408
G1 X50.251 Y60.222 E.0159
G1 X29.749 Y80.723 E.86408
G1 X29.749 Y81.256 E.0159
G1 X50.251 Y60.755 E.86408
G1 X50.251 Y61.289 E.0159
G1 X29.749 Y81.79 E.86408
G1 X29.749 Y82.324 E.0159
G1 X50.251 Y61.822 E.86408
G1 X50.251 Y62.356 E.0159
G1 X29.749 Y82.857 E.86408
G1 X29.749 Y83.391 E.0159
G1 X50.251 Y62.89 E.86408
G1 X50.251 Y63.423 E.0159
G1 X29.749 Y83.924 E.86408
G1 X29.749 Y84.458 E.0159
G1 X50.251 Y63.957 E.86408
G1 X50.251 Y64.49 E.0159
G1 X29.749 Y84.991 E.86408
G1 X29.749 Y85.525 E.0159
G1 X50.251 Y65.024 E.86408
G1 X50.251 Y65.557 E.0159
G1 X29.749 Y86.059 E.86408
G1 X29.749 Y86.592 E.0159
G1 X50.251 Y66.091 E.86408
G1 X50.251 Y66.625 E.0159
M73 P30 R52
G1 X29.749 Y87.126 E.86408
G1 X29.749 Y87.659 E.0159
G1 X50.251 Y67.158 E.86408
G1 X50.251 Y67.692 E.0159
G1 X29.749 Y88.193 E.86408
G1 X29.749 Y88.726 E.0159
G1 X50.251 Y68.225 E.86408
G1 X50.251 Y68.759 E.0159
G1 X29.749 Y89.26 E.86408
G1 X29.749 Y89.794 E.0159
G1 X50.251 Y69.292 E.86408
G1 X50.251 Y69.826 E.0159
G1 X29.749 Y90.327 E.86408
G1 X29.749 Y90.861 E.0159
G1 X50.251 Y70.36 E.86408
G1 X50.251 Y70.893 E.0159
G1 X29.749 Y91.394 E.86408
G1 X29.749 Y91.928 E.0159
G1 X50.251 Y71.427 E.86408
G1 X50.251 Y71.96 E.0159
G1 X29.749 Y92.461 E.86408
G1 X29.749 Y92.995 E.0159
G1 X50.251 Y72.494 E.86408
G1 X50.251 Y73.027 E.0159
G1 X29.749 Y93.529 E.86408
G1 X29.749 Y94.062 E.0159
G1 X50.251 Y73.561 E.86408
G1 X50.251 Y74.095 E.0159
G1 X29.749 Y94.596 E.86408
G1 X29.749 Y95.129 E.0159
G1 X50.251 Y74.628 E.86408
G1 X50.251 Y75.162 E.0159
G1 X29.749 Y95.663 E.86408
G1 X29.749 Y96.196 E.0159
G1 X50.251 Y75.695 E.86408
G1 X50.251 Y76.229 E.0159
G1 X29.749 Y96.73 E.86408
G1 X29.749 Y97.263 E.0159
G1 X50.251 Y76.762 E.86408
G1 X50.251 Y77.296 E.0159
G1 X29.749 Y97.797 E.86408
G1 X29.749 Y98.331 E.0159
G1 X50.251 Y77.83 E.86408
G1 X50.251 Y78.363 E.0159
G1 X29.749 Y98.864 E.86408
G1 X29.749 Y99.398 E.0159
G1 X50.251 Y78.897 E.86408
G1 X50.251 Y79.43 E.0159
G1 X29.749 Y99.931 E.86408
G1 X29.749 Y100.465 E.0159
G1 X50.251 Y79.964 E.86408
G1 X50.251 Y80.497 E.0159
G1 X29.749 Y100.998 E.86408
G1 X29.749 Y101.532 E.0159
G1 X50.251 Y81.031 E.86408
G1 X50.251 Y81.565 E.0159
G1 X29.749 Y102.066 E.86408
G1 X29.749 Y102.599 E.0159
G1 X50.251 Y82.098 E.86408
G1 X50.251 Y82.632 E.0159
G1 X29.749 Y103.133 E.86408
G1 X29.749 Y103.666 E.0159
G1 X50.251 Y83.165 E.86408
G1 X50.251 Y83.699 E.0159
G1 X29.749 Y104.2 E.86408
G1 X29.749 Y104.733 E.0159
G1 X50.251 Y84.232 E.86408
G1 X50.251 Y84.766 E.0159
G1 X29.749 Y105.267 E.86408
G1 X29.749 Y105.801 E.0159
G1 X50.251 Y85.3 E.86408
M73 P31 R52
G1 X50.251 Y85.833 E.0159
G1 X29.749 Y106.334 E.86408
G1 X29.749 Y106.868 E.0159
G1 X50.251 Y86.367 E.86408
G1 X50.251 Y86.9 E.0159
G1 X29.749 Y107.401 E.86408
G1 X29.749 Y107.935 E.0159
G1 X50.251 Y87.434 E.86408
G1 X50.251 Y87.967 E.0159
G1 X29.749 Y108.468 E.86408
G1 X29.749 Y109.002 E.0159
G1 X50.251 Y88.501 E.86408
G1 X50.251 Y89.034 E.0159
G1 X29.749 Y109.536 E.86408
G1 X29.749 Y110.069 E.0159
G1 X50.251 Y89.568 E.86408
G1 X50.251 Y90.102 E.0159
G1 X29.749 Y110.603 E.86408
G1 X29.749 Y111.136 E.0159
G1 X50.251 Y90.635 E.86408
G1 X50.251 Y91.169 E.0159
G1 X29.749 Y111.67 E.86408
G1 X29.749 Y112.203 E.0159
G1 X50.251 Y91.702 E.86408
G1 X50.251 Y92.236 E.0159
G1 X29.749 Y112.737 E.86408
G1 X29.749 Y113.271 E.0159
G1 X50.251 Y92.769 E.86408
G1 X50.251 Y93.303 E.0159
G1 X29.749 Y113.804 E.86408
G1 X29.749 Y114.338 E.0159
G1 X50.251 Y93.837 E.86408
G1 X50.251 Y94.37 E.0159
G1 X29.749 Y114.871 E.86408
G1 X29.749 Y115.405 E.0159
G1 X50.251 Y94.904 E.86408
G1 X50.251 Y95.437 E.0159
G1 X29.749 Y115.938 E.86408
G1 X29.749 Y116.472 E.0159
G1 X50.251 Y95.971 E.86408
G1 X50.251 Y96.504 E.0159
G1 X29.749 Y117.006 E.86408
G1 X29.749 Y117.539 E.0159
G1 X50.251 Y97.038 E.86408
G1 X50.251 Y97.572 E.0159
G1 X29.749 Y118.073 E.86408
G1 X29.749 Y118.606 E.0159
G1 X50.251 Y98.105 E.86408
G1 X50.251 Y98.639 E.0159
G1 X29.749 Y119.14 E.86408
G1 X29.749 Y119.673 E.0159
G1 X50.251 Y99.172 E.86408
G1 X50.251 Y99.706 E.0159
G1 X29.749 Y120.207 E.86408
G1 X29.749 Y120.74 E.0159
G1 X50.251 Y100.239 E.86408
G1 X50.251 Y100.773 E.0159
G1 X29.749 Y121.274 E.86408
G1 X29.749 Y121.808 E.0159
G1 X50.251 Y101.307 E.86408
G1 X50.251 Y101.84 E.0159
G1 X29.749 Y122.341 E.86408
G1 X29.749 Y122.875 E.0159
G1 X50.251 Y102.374 E.86408
G1 X50.251 Y102.907 E.0159
G1 X29.749 Y123.408 E.86408
G1 X29.749 Y123.942 E.0159
G1 X50.251 Y103.441 E.86408
G1 X50.251 Y103.974 E.0159
G1 X29.749 Y124.475 E.86408
G1 X29.749 Y125.009 E.0159
G1 X50.251 Y104.508 E.86408
G1 X50.251 Y105.042 E.0159
G1 X29.749 Y125.543 E.86408
G1 X29.749 Y126.076 E.0159
G1 X50.251 Y105.575 E.86408
G1 X50.251 Y106.109 E.0159
G1 X29.749 Y126.61 E.86408
G1 X29.749 Y127.143 E.0159
G1 X50.251 Y106.642 E.86408
G1 X50.251 Y107.176 E.0159
G1 X29.749 Y127.677 E.86408
G1 X29.749 Y128.21 E.0159
G1 X50.251 Y107.709 E.86408
G1 X50.251 Y108.243 E.0159
G1 X29.749 Y128.744 E.86408
G1 X29.749 Y129.278 E.0159
G1 X50.251 Y108.777 E.86408
G1 X50.251 Y109.31 E.0159
G1 X29.749 Y129.811 E.86408
G1 X29.749 Y130.345 E.0159
G1 X50.251 Y109.844 E.86408
G1 X50.251 Y110.377 E.0159
G1 X29.58 Y131.048 E.87123
; WIPE_START
G1 X30.994 Y129.634 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X37.88 Y126.341 Z.8 F30000
G1 X50.42 Y120.345 Z.8
G1 Z.4
G1 E.8 F1800
G1 F9541.731
G1 X43.168 Y127.598 E.30569
G2 X43.465 Y126.767 I-3.313 J-1.655 E.02637
G1 X50.251 Y119.981 E.28599
G1 X50.251 Y119.448 E.0159
G1 X43.544 Y126.155 E.28267
G2 X43.532 Y125.633 I-4.855 J-.149 E.01556
G1 X50.251 Y118.914 E.28318
G1 X50.251 Y118.381 E.0159
G1 X43.452 Y125.18 E.28656
G2 X43.327 Y124.77 I-2.109 J.417 E.01277
G1 X50.251 Y117.847 E.2918
G1 X50.251 Y117.314 E.0159
G1 X43.166 Y124.398 E.29861
G2 X42.971 Y124.059 I-1.792 J.804 E.01167
G1 X50.251 Y116.78 E.30681
G1 X50.251 Y116.246 E.0159
G1 X42.746 Y123.751 E.31629
G2 X42.492 Y123.471 I-1.521 J1.125 E.01128
G1 X50.251 Y115.713 E.32699
G1 X50.251 Y115.179 E.0159
G1 X42.21 Y123.22 E.3389
G2 X41.897 Y122.999 I-1.263 J1.459 E.01143
G1 X50.251 Y114.646 E.35208
G1 X50.251 Y114.112 E.0159
G1 X41.553 Y122.809 E.36657
G2 X41.176 Y122.653 I-.969 J1.805 E.01219
G1 X50.251 Y113.579 E.38247
G1 X50.251 Y113.045 E.0159
G1 X40.76 Y122.535 E.39999
G2 X40.299 Y122.463 I-.593 J2.269 E.01393
G1 X50.251 Y112.512 E.41942
G1 X50.251 Y111.978 E.0159
G1 X39.768 Y122.46 E.44181
G2 X39.137 Y122.558 I.303 J4.044 E.01906
G1 X50.251 Y111.444 E.46841
G1 X50.251 Y110.911 E.0159
G1 X29.749 Y131.412 E.86408
G1 X29.749 Y131.945 E.0159
G1 X36.555 Y125.14 E.28683
G2 X36.458 Y125.77 I3.104 J.799 E.01904
G1 X29.749 Y132.479 E.28275
G1 X29.749 Y133.013 E.0159
G1 X36.465 Y126.297 E.28304
G2 X36.535 Y126.761 I2.351 J-.118 E.01399
G1 X29.749 Y133.546 E.28599
G1 X29.749 Y134.08 E.0159
G1 X36.651 Y127.178 E.2909
G2 X36.808 Y127.555 I7.277 J-2.801 E.01217
G1 X29.749 Y134.613 E.29749
G1 X29.749 Y135.147 E.0159
G1 X37 Y127.897 E.30559
G2 X37.222 Y128.208 I1.669 J-.956 E.01142
G1 X29.749 Y135.68 E.31495
G1 X29.749 Y136.214 E.0159
G1 X37.473 Y128.49 E.32553
G2 X37.752 Y128.745 I1.411 J-1.27 E.01128
G1 X29.749 Y136.748 E.33731
G1 X29.749 Y137.281 E.0159
G1 X38.06 Y128.97 E.35029
G2 X38.399 Y129.165 I1.145 J-1.594 E.01166
G1 X29.749 Y137.815 E.36455
G1 X29.749 Y138.348 E.0159
G1 X38.77 Y129.328 E.38019
G2 X39.178 Y129.454 I.833 J-1.977 E.01274
G1 X29.749 Y138.882 E.39738
G1 X29.749 Y139.415 E.0159
G1 X39.635 Y129.53 E.41666
G2 X40.154 Y129.545 I.333 J-2.584 E.0155
G1 X29.749 Y139.949 E.43853
G1 X29.749 Y140.483 E.0159
G1 X40.769 Y129.463 E.46446
G2 X41.593 Y129.173 I-.819 J-3.642 E.02608
G1 X29.749 Y141.016 E.49916
G1 X29.749 Y141.55 E.0159
G1 X50.251 Y121.049 E.86408
G1 X50.251 Y121.582 E.0159
G1 X29.749 Y142.083 E.86408
G1 X29.749 Y142.617 E.0159
G1 X50.251 Y122.116 E.86408
G1 X50.251 Y122.649 E.0159
G1 X29.749 Y143.15 E.86408
G1 X29.749 Y143.684 E.0159
G1 X50.251 Y123.183 E.86408
G1 X50.251 Y123.716 E.0159
G1 X29.749 Y144.218 E.86408
G1 X29.749 Y144.751 E.0159
G1 X50.251 Y124.25 E.86408
G1 X50.251 Y124.784 E.0159
G1 X29.749 Y145.285 E.86408
G1 X29.749 Y145.818 E.0159
G1 X50.251 Y125.317 E.86408
G1 X50.251 Y125.851 E.0159
G1 X29.749 Y146.352 E.86408
G1 X29.749 Y146.885 E.0159
G1 X50.251 Y126.384 E.86408
G1 X50.251 Y126.918 E.0159
G1 X29.749 Y147.419 E.86408
G1 X29.749 Y147.952 E.0159
G1 X50.251 Y127.451 E.86408
G1 X50.251 Y127.985 E.0159
G1 X29.749 Y148.486 E.86408
G1 X29.749 Y149.02 E.0159
G1 X50.251 Y128.519 E.86408
G1 X50.251 Y129.052 E.0159
G1 X29.749 Y149.553 E.86408
G1 X29.749 Y150.087 E.0159
G1 X50.251 Y129.586 E.86408
G1 X50.251 Y130.119 E.0159
G1 X29.749 Y150.62 E.86408
G1 X29.749 Y151.154 E.0159
G1 X50.251 Y130.653 E.86408
G1 X50.251 Y131.186 E.0159
G1 X29.749 Y151.687 E.86408
G1 X29.749 Y152.221 E.0159
G1 X50.251 Y131.72 E.86408
G1 X50.251 Y132.254 E.0159
G1 X29.749 Y152.755 E.86408
G1 X29.749 Y153.288 E.0159
G1 X50.251 Y132.787 E.86408
G1 X50.251 Y133.321 E.0159
G1 X29.749 Y153.822 E.86408
G1 X29.749 Y154.355 E.0159
G1 X50.251 Y133.854 E.86408
G1 X50.251 Y134.388 E.0159
G1 X29.749 Y154.889 E.86408
G1 X29.749 Y155.422 E.0159
G1 X50.251 Y134.921 E.86408
G1 X50.251 Y135.455 E.0159
G1 X29.749 Y155.956 E.86408
G1 X29.749 Y156.49 E.0159
G1 X50.251 Y135.989 E.86408
G1 X50.251 Y136.522 E.0159
G1 X29.749 Y157.023 E.86408
G1 X29.749 Y157.557 E.0159
G1 X50.251 Y137.056 E.86408
G1 X50.251 Y137.589 E.0159
G1 X29.749 Y158.09 E.86408
G1 X29.749 Y158.624 E.0159
G1 X50.251 Y138.123 E.86408
G1 X50.251 Y138.656 E.0159
G1 X29.749 Y159.157 E.86408
G1 X29.749 Y159.691 E.0159
G1 X50.251 Y139.19 E.86408
G1 X50.251 Y139.724 E.0159
G1 X29.749 Y160.225 E.86408
G1 X29.749 Y160.758 E.0159
G1 X50.251 Y140.257 E.86408
G1 X50.251 Y140.791 E.0159
G1 X29.749 Y161.292 E.86408
G1 X29.749 Y161.825 E.0159
G1 X50.251 Y141.324 E.86408
G1 X50.251 Y141.858 E.0159
G1 X29.749 Y162.359 E.86408
G1 X29.749 Y162.892 E.0159
G1 X50.251 Y142.391 E.86408
G1 X50.251 Y142.925 E.0159
G1 X29.749 Y163.426 E.86408
G1 X29.749 Y163.96 E.0159
G1 X50.251 Y143.458 E.86408
G1 X50.251 Y143.992 E.0159
G1 X29.749 Y164.493 E.86408
G1 X29.749 Y165.027 E.0159
G1 X50.251 Y144.526 E.86408
G1 X50.251 Y145.059 E.0159
G1 X29.749 Y165.56 E.86408
G1 X29.749 Y166.094 E.0159
G1 X50.251 Y145.593 E.86408
G1 X50.251 Y146.126 E.0159
G1 X29.749 Y166.627 E.86408
G1 X29.749 Y167.161 E.0159
G1 X50.251 Y146.66 E.86408
G1 X50.251 Y147.193 E.0159
G1 X29.749 Y167.695 E.86408
G1 X29.749 Y168.228 E.0159
G1 X50.251 Y147.727 E.86408
G1 X50.251 Y148.261 E.0159
G1 X29.749 Y168.762 E.86408
G1 X29.749 Y169.295 E.0159
G1 X50.251 Y148.794 E.86408
G1 X50.251 Y149.328 E.0159
G1 X29.749 Y169.829 E.86408
G1 X29.749 Y170.362 E.0159
G1 X50.251 Y149.861 E.86408
G1 X50.251 Y150.395 E.0159
G1 X29.749 Y170.896 E.86408
G1 X29.749 Y171.43 E.0159
G1 X50.251 Y150.928 E.86408
G1 X50.251 Y151.462 E.0159
G1 X29.749 Y171.963 E.86408
G1 X29.749 Y172.497 E.0159
G1 X50.251 Y151.996 E.86408
G1 X50.251 Y152.529 E.0159
G1 X29.749 Y173.03 E.86408
G1 X29.749 Y173.564 E.0159
G1 X50.251 Y153.063 E.86408
G1 X50.251 Y153.596 E.0159
G1 X29.749 Y174.097 E.86408
G1 X29.749 Y174.631 E.0159
G1 X50.251 Y154.13 E.86408
G1 X50.251 Y154.663 E.0159
G1 X29.749 Y175.164 E.86408
G1 X29.749 Y175.698 E.0159
G1 X50.251 Y155.197 E.86408
G1 X50.251 Y155.731 E.0159
G1 X29.749 Y176.232 E.86408
G1 X29.749 Y176.765 E.0159
G1 X50.251 Y156.264 E.86408
G1 X50.251 Y156.798 E.0159
G1 X29.749 Y177.299 E.86408
G1 X29.749 Y177.832 E.0159
G1 X50.251 Y157.331 E.86408
G1 X50.251 Y157.865 E.0159
G1 X29.749 Y178.366 E.86408
G1 X29.749 Y178.899 E.0159
G1 X50.251 Y158.398 E.86408
G1 X50.251 Y158.932 E.0159
G1 X29.749 Y179.433 E.86408
G1 X29.749 Y179.967 E.0159
G1 X50.251 Y159.466 E.86408
G1 X50.251 Y159.999 E.0159
G1 X29.749 Y180.5 E.86408
G1 X29.749 Y181.034 E.0159
G1 X50.251 Y160.533 E.86408
G1 X50.251 Y161.066 E.0159
G1 X29.749 Y181.567 E.86408
G1 X29.749 Y182.101 E.0159
G1 X50.251 Y161.6 E.86408
G1 X50.251 Y162.133 E.0159
G1 X29.749 Y182.634 E.86408
G1 X29.749 Y183.168 E.0159
G1 X50.251 Y162.667 E.86408
G1 X50.251 Y163.201 E.0159
G1 X29.749 Y183.702 E.86408
G1 X29.749 Y184.235 E.0159
G1 X50.251 Y163.734 E.86408
G1 X50.251 Y164.268 E.0159
G1 X29.749 Y184.769 E.86408
G1 X29.749 Y185.302 E.0159
G1 X50.251 Y164.801 E.86408
G1 X50.251 Y165.335 E.0159
G1 X29.749 Y185.836 E.86408
G1 X29.749 Y186.369 E.0159
G1 X50.251 Y165.868 E.86408
G1 X50.251 Y166.402 E.0159
G1 X29.749 Y186.903 E.86408
G1 X29.749 Y187.437 E.0159
G1 X50.251 Y166.935 E.86408
G1 X50.251 Y167.469 E.0159
G1 X29.749 Y187.97 E.86408
G1 X29.749 Y188.504 E.0159
G1 X50.251 Y168.003 E.86408
G1 X50.251 Y168.536 E.0159
G1 X29.749 Y189.037 E.86408
G1 X29.749 Y189.571 E.0159
G1 X50.251 Y169.07 E.86408
G1 X50.251 Y169.603 E.0159
G1 X29.749 Y190.104 E.86408
G1 X29.749 Y190.638 E.0159
G1 X50.251 Y170.137 E.86408
G1 X50.251 Y170.67 E.0159
G1 X29.749 Y191.172 E.86408
G1 X29.749 Y191.705 E.0159
G1 X50.251 Y171.204 E.86408
G1 X50.251 Y171.738 E.0159
G1 X29.749 Y192.239 E.86408
G1 X29.749 Y192.772 E.0159
G1 X50.251 Y172.271 E.86408
G1 X50.251 Y172.805 E.0159
G1 X29.749 Y193.306 E.86408
G1 X29.749 Y193.839 E.0159
G1 X50.251 Y173.338 E.86408
G1 X50.251 Y173.872 E.0159
G1 X29.749 Y194.373 E.86408
G1 X29.749 Y194.907 E.0159
G1 X50.251 Y174.405 E.86408
G1 X50.251 Y174.939 E.0159
G1 X29.749 Y195.44 E.86408
G1 X29.749 Y195.974 E.0159
G1 X50.251 Y175.473 E.86408
G1 X50.251 Y176.006 E.0159
G1 X29.749 Y196.507 E.86408
G1 X29.749 Y197.041 E.0159
G1 X50.251 Y176.54 E.86408
G1 X50.251 Y177.073 E.0159
G1 X29.749 Y197.574 E.86408
G1 X29.749 Y198.108 E.0159
G1 X50.251 Y177.607 E.86408
G1 X50.251 Y178.14 E.0159
G1 X29.749 Y198.642 E.86408
G1 X29.749 Y199.175 E.0159
G1 X50.251 Y178.674 E.86408
G1 X50.251 Y179.208 E.0159
G1 X29.749 Y199.709 E.86408
G1 X29.749 Y200.242 E.0159
G1 X50.251 Y179.741 E.86408
G1 X50.251 Y180.275 E.0159
G1 X29.749 Y200.776 E.86408
G1 X29.749 Y201.309 E.0159
G1 X50.251 Y180.808 E.86408
G1 X50.251 Y181.342 E.0159
G1 X29.749 Y201.843 E.86408
G1 X29.749 Y202.376 E.0159
G1 X50.251 Y181.875 E.86408
G1 X50.251 Y182.409 E.0159
G1 X29.749 Y202.91 E.86408
G1 X29.749 Y203.444 E.0159
G1 X50.251 Y182.943 E.86408
G1 X50.251 Y183.476 E.0159
G1 X29.749 Y203.977 E.86408
G1 X29.749 Y204.511 E.0159
G1 X50.251 Y184.01 E.86408
G1 X50.251 Y184.543 E.0159
G1 X29.749 Y205.044 E.86408
G1 X29.749 Y205.578 E.0159
G1 X50.251 Y185.077 E.86408
G1 X50.251 Y185.61 E.0159
G1 X29.749 Y206.111 E.86408
G1 X29.749 Y206.645 E.0159
G1 X50.251 Y186.144 E.86408
G1 X50.251 Y186.678 E.0159
G1 X29.749 Y207.179 E.86408
G1 X29.749 Y207.712 E.0159
G1 X50.251 Y187.211 E.86408
G1 X50.251 Y187.745 E.0159
G1 X29.749 Y208.246 E.86408
G1 X29.749 Y208.779 E.0159
G1 X50.251 Y188.278 E.86408
G1 X50.251 Y188.812 E.0159
G1 X29.749 Y209.313 E.86408
G1 X29.749 Y209.846 E.0159
G1 X50.251 Y189.345 E.86408
G1 X50.251 Y189.879 E.0159
G1 X29.749 Y210.38 E.86408
G1 X29.749 Y210.914 E.0159
G1 X50.251 Y190.413 E.86408
G1 X50.251 Y190.946 E.0159
G1 X29.749 Y211.447 E.86408
G1 X29.749 Y211.981 E.0159
G1 X50.251 Y191.48 E.86408
G1 X50.251 Y192.013 E.0159
G1 X29.58 Y212.684 E.87123
; WIPE_START
G1 X30.994 Y211.27 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X37.606 Y207.456 Z.8 F30000
G1 X54.947 Y197.455 Z.8
G1 Z.4
G1 E.8 F1800
G1 F9541.731
G1 X43.345 Y209.057 E.489
G2 X43.515 Y208.353 I-3.39 J-1.194 E.02163
G1 X54.244 Y197.624 E.45218
G1 X53.71 Y197.624 E.0159
G1 X43.547 Y207.787 E.42834
G2 X43.501 Y207.3 I-2.463 J-.01 E.0146
G1 X53.176 Y197.624 E.40781
G1 X52.643 Y197.624 E.0159
G1 X43.403 Y206.864 E.38944
G2 X43.262 Y206.472 I-6.623 J2.168 E.01242
G1 X52.109 Y197.624 E.37291
G1 X51.576 Y197.624 E.0159
G1 X43.083 Y206.117 E.35795
G2 X42.873 Y205.793 I-1.726 J.888 E.01152
G1 X51.042 Y197.624 E.3443
G1 X50.509 Y197.624 E.0159
G1 X42.634 Y205.499 E.33189
G2 X42.367 Y205.233 I-1.463 J1.202 E.01126
G1 X50.251 Y197.349 E.33229
G1 X50.251 Y196.815 E.0159
G1 X42.071 Y204.995 E.34476
G2 X41.746 Y204.787 I-1.203 J1.522 E.01153
G1 X50.251 Y196.282 E.35847
G1 X50.251 Y195.748 E.0159
G1 X41.389 Y204.61 E.37351
G2 X40.997 Y204.468 I-.907 J1.889 E.01243
G1 X50.251 Y195.215 E.39001
G1 X50.251 Y194.681 E.0159
G1 X40.561 Y204.37 E.40838
G2 X40.07 Y204.328 I-.456 J2.437 E.01473
G1 X50.251 Y194.147 E.42911
G1 X50.251 Y193.614 E.0159
G1 X39.502 Y204.363 E.45304
G2 X38.793 Y204.538 I.539 J3.698 E.0218
M73 P32 R52
G1 X50.251 Y193.08 E.48293
G1 X50.251 Y192.547 E.0159
G1 X29.749 Y213.048 E.86408
G1 X29.749 Y213.581 E.0159
G1 X36.659 Y206.672 E.29122
G2 X36.485 Y207.38 I4.218 J1.415 E.02175
G1 X29.749 Y214.115 E.28387
G1 X29.749 Y214.649 E.0159
G1 X36.453 Y207.945 E.28253
G2 X36.495 Y208.437 I4.627 J-.146 E.01471
G1 X29.749 Y215.182 E.2843
G1 X29.749 Y215.716 E.0159
G1 X36.595 Y208.87 E.28852
G2 X36.736 Y209.263 I2.033 J-.507 E.01246
G1 X29.749 Y216.249 E.29445
G1 X29.749 Y216.783 E.0159
G1 X36.912 Y209.621 E.30187
G2 X37.119 Y209.947 I1.731 J-.873 E.01154
G1 X29.749 Y217.316 E.31062
G1 X29.749 Y217.85 E.0159
G1 X37.356 Y210.243 E.32062
G2 X37.622 Y210.511 I1.471 J-1.194 E.01126
G1 X30.007 Y218.126 E.32094
G1 X30.541 Y218.126 E.0159
G1 X37.916 Y210.75 E.31085
G2 X38.241 Y210.959 I6.514 J-9.757 E.01151
G1 X31.075 Y218.126 E.30204
G1 X31.608 Y218.126 E.0159
G1 X38.598 Y211.136 E.29462
G2 X38.991 Y211.276 I.9 J-1.896 E.01246
G1 X32.142 Y218.126 E.28869
G1 X32.675 Y218.126 E.0159
G1 X39.425 Y211.376 E.2845
G2 X39.909 Y211.425 I.491 J-2.394 E.01452
G1 X33.209 Y218.126 E.2824
G1 X33.742 Y218.126 E.0159
G1 X40.478 Y211.39 E.28389
G2 X41.181 Y211.22 I-.49 J-3.571 E.02161
G1 X34.276 Y218.126 E.29105
G1 X34.81 Y218.126 E.0159
G1 X55.311 Y197.624 E.86408
G1 X55.844 Y197.624 E.0159
G1 X35.343 Y218.126 E.86408
G1 X35.877 Y218.126 E.0159
G1 X56.378 Y197.624 E.86408
G1 X56.911 Y197.624 E.0159
G1 X36.41 Y218.126 E.86408
G1 X36.944 Y218.126 E.0159
G1 X57.445 Y197.624 E.86408
G1 X57.979 Y197.624 E.0159
G1 X37.477 Y218.126 E.86408
G1 X38.011 Y218.126 E.0159
G1 X58.512 Y197.624 E.86408
G1 X59.046 Y197.624 E.0159
G1 X38.545 Y218.126 E.86408
G1 X39.078 Y218.126 E.0159
G1 X59.579 Y197.624 E.86408
G1 X60.113 Y197.624 E.0159
G1 X39.612 Y218.126 E.86408
G1 X40.145 Y218.126 E.0159
G1 X60.646 Y197.624 E.86408
G1 X61.18 Y197.624 E.0159
G1 X40.679 Y218.126 E.86408
G1 X41.212 Y218.126 E.0159
G1 X61.713 Y197.624 E.86408
G1 X62.247 Y197.624 E.0159
G1 X41.746 Y218.126 E.86408
G1 X42.28 Y218.126 E.0159
G1 X62.781 Y197.624 E.86408
G1 X63.314 Y197.624 E.0159
G1 X42.813 Y218.126 E.86408
G1 X43.347 Y218.126 E.0159
G1 X63.848 Y197.624 E.86408
G1 X64.381 Y197.624 E.0159
G1 X43.88 Y218.126 E.86408
G1 X44.414 Y218.126 E.0159
G1 X64.915 Y197.624 E.86408
G1 X65.448 Y197.624 E.0159
G1 X44.947 Y218.126 E.86408
G1 X45.481 Y218.126 E.0159
G1 X65.982 Y197.624 E.86408
G1 X66.516 Y197.624 E.0159
G1 X46.015 Y218.126 E.86408
G1 X46.548 Y218.126 E.0159
G1 X67.049 Y197.624 E.86408
G1 X67.583 Y197.624 E.0159
G1 X47.082 Y218.126 E.86408
G1 X47.615 Y218.126 E.0159
G1 X68.116 Y197.624 E.86408
G1 X68.65 Y197.624 E.0159
G1 X48.149 Y218.126 E.86408
G1 X48.682 Y218.126 E.0159
G1 X69.183 Y197.624 E.86408
G1 X69.717 Y197.624 E.0159
G1 X49.216 Y218.126 E.86408
G1 X49.75 Y218.126 E.0159
G1 X70.251 Y197.624 E.86408
G1 X70.784 Y197.624 E.0159
G1 X50.283 Y218.126 E.86408
G1 X50.817 Y218.126 E.0159
G1 X71.318 Y197.624 E.86408
G1 X71.851 Y197.624 E.0159
G1 X51.35 Y218.126 E.86408
G1 X51.884 Y218.126 E.0159
G1 X72.385 Y197.624 E.86408
G1 X72.918 Y197.624 E.0159
G1 X52.417 Y218.126 E.86408
M73 P32 R51
G1 X52.951 Y218.126 E.0159
G1 X73.452 Y197.624 E.86408
G1 X73.986 Y197.624 E.0159
G1 X53.484 Y218.126 E.86408
G1 X54.018 Y218.126 E.0159
G1 X74.519 Y197.624 E.86408
G1 X75.053 Y197.624 E.0159
G1 X54.552 Y218.126 E.86408
G1 X55.085 Y218.126 E.0159
G1 X75.586 Y197.624 E.86408
G1 X76.12 Y197.624 E.0159
G1 X55.619 Y218.126 E.86408
G1 X56.152 Y218.126 E.0159
G1 X76.653 Y197.624 E.86408
G1 X77.187 Y197.624 E.0159
G1 X56.686 Y218.126 E.86408
G1 X57.219 Y218.126 E.0159
G1 X77.721 Y197.624 E.86408
G1 X78.254 Y197.624 E.0159
G1 X57.753 Y218.126 E.86408
G1 X58.287 Y218.126 E.0159
G1 X78.788 Y197.624 E.86408
G1 X79.321 Y197.624 E.0159
G1 X58.82 Y218.126 E.86408
G1 X59.354 Y218.126 E.0159
G1 X79.855 Y197.624 E.86408
G1 X80.388 Y197.624 E.0159
G1 X59.887 Y218.126 E.86408
G1 X60.421 Y218.126 E.0159
G1 X80.922 Y197.624 E.86408
G1 X81.456 Y197.624 E.0159
G1 X60.954 Y218.126 E.86408
G1 X61.488 Y218.126 E.0159
G1 X81.989 Y197.624 E.86408
G1 X82.523 Y197.624 E.0159
G1 X62.022 Y218.126 E.86408
G1 X62.555 Y218.126 E.0159
G1 X83.056 Y197.624 E.86408
G1 X83.59 Y197.624 E.0159
G1 X63.089 Y218.126 E.86408
G1 X63.622 Y218.126 E.0159
G1 X84.123 Y197.624 E.86408
G1 X84.657 Y197.624 E.0159
G1 X64.156 Y218.126 E.86408
G1 X64.689 Y218.126 E.0159
G1 X85.191 Y197.624 E.86408
G1 X85.724 Y197.624 E.0159
G1 X65.223 Y218.126 E.86408
G1 X65.757 Y218.126 E.0159
G1 X86.258 Y197.624 E.86408
G1 X86.791 Y197.624 E.0159
G1 X66.29 Y218.126 E.86408
G1 X66.824 Y218.126 E.0159
G1 X87.325 Y197.624 E.86408
G1 X87.858 Y197.624 E.0159
G1 X67.357 Y218.126 E.86408
G1 X67.891 Y218.126 E.0159
G1 X88.392 Y197.624 E.86408
G1 X88.925 Y197.624 E.0159
G1 X68.424 Y218.126 E.86408
G1 X68.958 Y218.126 E.0159
G1 X89.459 Y197.624 E.86408
G1 X89.993 Y197.624 E.0159
G1 X69.492 Y218.126 E.86408
G1 X70.025 Y218.126 E.0159
G1 X90.526 Y197.624 E.86408
G1 X91.06 Y197.624 E.0159
G1 X70.559 Y218.126 E.86408
G1 X71.092 Y218.126 E.0159
G1 X91.593 Y197.624 E.86408
G1 X92.127 Y197.624 E.0159
G1 X71.626 Y218.126 E.86408
G1 X72.159 Y218.126 E.0159
G1 X92.66 Y197.624 E.86408
G1 X93.194 Y197.624 E.0159
G1 X72.693 Y218.126 E.86408
G1 X73.227 Y218.126 E.0159
G1 X93.728 Y197.624 E.86408
G1 X94.261 Y197.624 E.0159
G1 X73.76 Y218.126 E.86408
G1 X74.294 Y218.126 E.0159
G1 X94.795 Y197.624 E.86408
G1 X95.328 Y197.624 E.0159
G1 X74.827 Y218.126 E.86408
G1 X75.361 Y218.126 E.0159
G1 X95.862 Y197.624 E.86408
G1 X96.395 Y197.624 E.0159
G1 X75.894 Y218.126 E.86408
G1 X76.428 Y218.126 E.0159
G1 X96.929 Y197.624 E.86408
G1 X97.463 Y197.624 E.0159
G1 X76.962 Y218.126 E.86408
G1 X77.495 Y218.126 E.0159
G1 X97.996 Y197.624 E.86408
G1 X98.53 Y197.624 E.0159
G1 X78.029 Y218.126 E.86408
G1 X78.562 Y218.126 E.0159
G1 X99.063 Y197.624 E.86408
G1 X99.597 Y197.624 E.0159
G1 X79.096 Y218.126 E.86408
G1 X79.629 Y218.126 E.0159
G1 X100.13 Y197.624 E.86408
G1 X100.664 Y197.624 E.0159
G1 X80.163 Y218.126 E.86408
G1 X80.696 Y218.126 E.0159
G1 X101.198 Y197.624 E.86408
G1 X101.731 Y197.624 E.0159
G1 X81.23 Y218.126 E.86408
G1 X81.764 Y218.126 E.0159
G1 X102.265 Y197.624 E.86408
G1 X102.798 Y197.624 E.0159
G1 X82.297 Y218.126 E.86408
G1 X82.831 Y218.126 E.0159
G1 X103.332 Y197.624 E.86408
G1 X103.865 Y197.624 E.0159
G1 X83.364 Y218.126 E.86408
G1 X83.898 Y218.126 E.0159
G1 X104.399 Y197.624 E.86408
G1 X104.933 Y197.624 E.0159
G1 X84.431 Y218.126 E.86408
G1 X84.965 Y218.126 E.0159
G1 X105.466 Y197.624 E.86408
G1 X106 Y197.624 E.0159
G1 X85.499 Y218.126 E.86408
G1 X86.032 Y218.126 E.0159
G1 X106.533 Y197.624 E.86408
G1 X107.067 Y197.624 E.0159
G1 X86.566 Y218.126 E.86408
G1 X87.099 Y218.126 E.0159
G1 X107.6 Y197.624 E.86408
G1 X108.134 Y197.624 E.0159
G1 X87.633 Y218.126 E.86408
G1 X88.166 Y218.126 E.0159
G1 X108.668 Y197.624 E.86408
G1 X109.201 Y197.624 E.0159
G1 X88.7 Y218.126 E.86408
G1 X89.234 Y218.126 E.0159
G1 X109.735 Y197.624 E.86408
G1 X110.268 Y197.624 E.0159
G1 X89.767 Y218.126 E.86408
G1 X90.301 Y218.126 E.0159
G1 X110.802 Y197.624 E.86408
G1 X111.335 Y197.624 E.0159
G1 X90.834 Y218.126 E.86408
G1 X91.368 Y218.126 E.0159
G1 X111.869 Y197.624 E.86408
G1 X112.403 Y197.624 E.0159
G1 X91.901 Y218.126 E.86408
G1 X92.435 Y218.126 E.0159
G1 X112.936 Y197.624 E.86408
G1 X113.47 Y197.624 E.0159
G1 X92.969 Y218.126 E.86408
G1 X93.502 Y218.126 E.0159
G1 X114.003 Y197.624 E.86408
G1 X114.537 Y197.624 E.0159
G1 X94.036 Y218.126 E.86408
G1 X94.569 Y218.126 E.0159
G1 X115.07 Y197.624 E.86408
G1 X115.604 Y197.624 E.0159
G1 X95.103 Y218.126 E.86408
G1 X95.636 Y218.126 E.0159
G1 X116.138 Y197.624 E.86408
G1 X116.671 Y197.624 E.0159
G1 X96.17 Y218.126 E.86408
G1 X96.704 Y218.126 E.0159
G1 X117.205 Y197.624 E.86408
G1 X117.738 Y197.624 E.0159
G1 X97.237 Y218.126 E.86408
G1 X97.771 Y218.126 E.0159
G1 X118.272 Y197.624 E.86408
G1 X118.805 Y197.624 E.0159
G1 X98.304 Y218.126 E.86408
G1 X98.838 Y218.126 E.0159
G1 X119.339 Y197.624 E.86408
G1 X119.872 Y197.624 E.0159
G1 X99.371 Y218.126 E.86408
G1 X99.905 Y218.126 E.0159
G1 X120.406 Y197.624 E.86408
G1 X120.94 Y197.624 E.0159
G1 X100.439 Y218.126 E.86408
G1 X100.972 Y218.126 E.0159
G1 X121.473 Y197.624 E.86408
G1 X122.007 Y197.624 E.0159
G1 X101.506 Y218.126 E.86408
G1 X102.039 Y218.126 E.0159
G1 X122.54 Y197.624 E.86408
G1 X123.074 Y197.624 E.0159
G1 X102.573 Y218.126 E.86408
G1 X103.106 Y218.126 E.0159
G1 X123.607 Y197.624 E.86408
G1 X124.141 Y197.624 E.0159
G1 X103.64 Y218.126 E.86408
G1 X104.174 Y218.126 E.0159
G1 X124.675 Y197.624 E.86408
G1 X125.208 Y197.624 E.0159
G1 X104.707 Y218.126 E.86408
G1 X105.241 Y218.126 E.0159
G1 X125.742 Y197.624 E.86408
G1 X126.275 Y197.624 E.0159
G1 X105.774 Y218.126 E.86408
G1 X106.308 Y218.126 E.0159
G1 X126.809 Y197.624 E.86408
G1 X127.342 Y197.624 E.0159
G1 X106.841 Y218.126 E.86408
G1 X107.375 Y218.126 E.0159
G1 X127.876 Y197.624 E.86408
G1 X128.41 Y197.624 E.0159
G1 X107.909 Y218.126 E.86408
G1 X108.442 Y218.126 E.0159
G1 X128.943 Y197.624 E.86408
G1 X129.477 Y197.624 E.0159
G1 X108.976 Y218.126 E.86408
G1 X109.509 Y218.126 E.0159
G1 X130.01 Y197.624 E.86408
G1 X130.544 Y197.624 E.0159
G1 X110.043 Y218.126 E.86408
G1 X110.576 Y218.126 E.0159
G1 X131.077 Y197.624 E.86408
G1 X131.611 Y197.624 E.0159
G1 X111.11 Y218.126 E.86408
G1 X111.643 Y218.126 E.0159
G1 X132.145 Y197.624 E.86408
G1 X132.678 Y197.624 E.0159
G1 X112.007 Y218.295 E.87123
G1 X122.145 Y218.295 F30000
G1 F9541.731
G1 X129.24 Y211.201 E.29903
G3 X128.522 Y211.385 I-1.304 J-3.595 E.02211
G1 X121.781 Y218.126 E.28412
G1 X121.248 Y218.126 E.0159
G1 X127.949 Y211.425 E.28243
G3 X127.458 Y211.381 I.158 J-4.593 E.01468
G1 X120.714 Y218.126 E.28425
G1 X120.181 Y218.126 E.0159
G1 X127.021 Y211.285 E.28833
G3 X126.626 Y211.146 I.494 J-2.047 E.0125
G1 X119.647 Y218.126 E.29415
G1 X119.113 Y218.126 E.0159
G1 X126.266 Y210.973 E.30149
G3 X125.939 Y210.767 I.866 J-1.741 E.01155
G1 X118.58 Y218.126 E.31017
G1 X118.046 Y218.126 E.0159
G1 X125.642 Y210.53 E.32014
G3 X125.374 Y210.264 I1.197 J-1.473 E.01126
G1 X117.513 Y218.126 E.33134
G1 X116.979 Y218.126 E.0159
G1 X125.135 Y209.97 E.34375
G3 X124.925 Y209.646 I1.514 J-1.21 E.01152
G1 X116.446 Y218.126 E.3574
G1 X115.912 Y218.126 E.0159
G1 X124.747 Y209.29 E.37238
G3 X124.604 Y208.9 I1.885 J-.912 E.01241
G1 X115.378 Y218.126 E.38884
G1 X114.845 Y218.126 E.0159
G1 X124.501 Y208.469 E.40699
G3 X124.453 Y207.984 I4.402 J-.684 E.01454
G1 X114.311 Y218.126 E.42744
G1 X113.778 Y218.126 E.0159
G1 X124.48 Y207.423 E.45109
G3 X124.642 Y206.728 I3.861 J.53 E.02129
G1 X113.244 Y218.126 E.48038
G1 X112.711 Y218.126 E.0159
G1 X133.212 Y197.624 E.86408
G1 X133.745 Y197.624 E.0159
G1 X126.857 Y204.513 E.29034
G3 X127.548 Y204.355 I1.365 J4.379 E.02117
G1 X134.279 Y197.624 E.28368
G1 X134.812 Y197.624 E.0159
G1 X128.108 Y204.329 E.2826
G3 X128.596 Y204.375 I.017 J2.467 E.01464
G1 X135.346 Y197.624 E.28451
G1 X135.88 Y197.624 E.0159
G1 X129.026 Y204.478 E.28885
G3 X129.415 Y204.622 I-.527 J2.019 E.01239
G1 X136.413 Y197.624 E.29494
G1 X136.947 Y197.624 E.0159
G1 X129.77 Y204.801 E.30248
G3 X130.093 Y205.011 I-.891 J1.724 E.01151
G1 X137.48 Y197.624 E.31134
G1 X138.014 Y197.624 E.0159
G1 X130.387 Y205.251 E.32144
G3 X130.653 Y205.519 I-1.204 J1.457 E.01126
G1 X138.547 Y197.624 E.33274
G1 X139.081 Y197.624 E.0159
G1 X130.89 Y205.815 E.34524
G3 X131.098 Y206.141 I-1.525 J1.202 E.01154
G1 X139.615 Y197.624 E.35897
G1 X140.148 Y197.624 E.0159
G1 X131.274 Y206.499 E.37403
G3 X131.411 Y206.895 I-1.915 J.884 E.01252
G1 X140.682 Y197.624 E.39074
G1 X141.215 Y197.624 E.0159
G1 X131.506 Y207.334 E.40924
G3 X131.549 Y207.824 I-2.431 J.462 E.01469
G1 X141.749 Y197.624 E.4299
G1 X142.282 Y197.624 E.0159
G1 X131.508 Y208.398 E.4541
G3 X131.322 Y209.118 I-3.518 J-.525 E.02219
G1 X142.816 Y197.624 E.48443
G1 X143.35 Y197.624 E.0159
G1 X122.848 Y218.126 E.86408
G1 X123.382 Y218.126 E.0159
G1 X143.883 Y197.624 E.86408
G1 X144.417 Y197.624 E.0159
G1 X123.916 Y218.126 E.86408
G1 X124.449 Y218.126 E.0159
G1 X144.95 Y197.624 E.86408
G1 X145.484 Y197.624 E.0159
G1 X124.983 Y218.126 E.86408
G1 X125.516 Y218.126 E.0159
G1 X146.017 Y197.624 E.86408
G1 X146.551 Y197.624 E.0159
G1 X126.05 Y218.126 E.86408
G1 X126.583 Y218.126 E.0159
G1 X147.084 Y197.624 E.86408
G1 X147.618 Y197.624 E.0159
G1 X127.117 Y218.126 E.86408
G1 X127.651 Y218.126 E.0159
G1 X148.152 Y197.624 E.86408
G1 X148.685 Y197.624 E.0159
G1 X128.184 Y218.126 E.86408
G1 X128.718 Y218.126 E.0159
G1 X149.219 Y197.624 E.86408
G1 X149.752 Y197.624 E.0159
G1 X129.251 Y218.126 E.86408
G1 X129.785 Y218.126 E.0159
G1 X150.286 Y197.624 E.86408
G1 X150.819 Y197.624 E.0159
G1 X130.318 Y218.126 E.86408
G1 X130.852 Y218.126 E.0159
G1 X151.353 Y197.624 E.86408
G1 X151.887 Y197.624 E.0159
G1 X131.386 Y218.126 E.86408
G1 X131.919 Y218.126 E.0159
G1 X152.42 Y197.624 E.86408
G1 X152.954 Y197.624 E.0159
G1 X132.453 Y218.126 E.86408
G1 X132.986 Y218.126 E.0159
G1 X153.487 Y197.624 E.86408
G1 X154.021 Y197.624 E.0159
G1 X133.52 Y218.126 E.86408
G1 X134.053 Y218.126 E.0159
G1 X154.554 Y197.624 E.86408
G1 X155.088 Y197.624 E.0159
G1 X134.587 Y218.126 E.86408
G1 X135.121 Y218.126 E.0159
G1 X155.622 Y197.624 E.86408
G1 X156.155 Y197.624 E.0159
G1 X135.654 Y218.126 E.86408
G1 X136.188 Y218.126 E.0159
G1 X156.689 Y197.624 E.86408
G1 X157.222 Y197.624 E.0159
G1 X136.721 Y218.126 E.86408
G1 X137.255 Y218.126 E.0159
G1 X157.756 Y197.624 E.86408
G1 X158.289 Y197.624 E.0159
G1 X137.788 Y218.126 E.86408
G1 X138.322 Y218.126 E.0159
G1 X158.823 Y197.624 E.86408
G1 X159.357 Y197.624 E.0159
G1 X138.855 Y218.126 E.86408
G1 X139.389 Y218.126 E.0159
G1 X159.89 Y197.624 E.86408
G1 X160.424 Y197.624 E.0159
G1 X139.923 Y218.126 E.86408
G1 X140.456 Y218.126 E.0159
G1 X160.957 Y197.624 E.86408
G1 X161.491 Y197.624 E.0159
G1 X140.99 Y218.126 E.86408
G1 X141.523 Y218.126 E.0159
G1 X162.024 Y197.624 E.86408
G1 X162.558 Y197.624 E.0159
G1 X142.057 Y218.126 E.86408
G1 X142.59 Y218.126 E.0159
G1 X163.092 Y197.624 E.86408
G1 X163.625 Y197.624 E.0159
G1 X143.124 Y218.126 E.86408
G1 X143.658 Y218.126 E.0159
G1 X164.159 Y197.624 E.86408
G1 X164.692 Y197.624 E.0159
G1 X144.191 Y218.126 E.86408
G1 X144.725 Y218.126 E.0159
G1 X165.226 Y197.624 E.86408
G1 X165.759 Y197.624 E.0159
G1 X145.258 Y218.126 E.86408
G1 X145.792 Y218.126 E.0159
G1 X166.293 Y197.624 E.86408
G1 X166.827 Y197.624 E.0159
G1 X146.325 Y218.126 E.86408
G1 X146.859 Y218.126 E.0159
G1 X167.36 Y197.624 E.86408
G1 X167.894 Y197.624 E.0159
G1 X147.393 Y218.126 E.86408
G1 X147.926 Y218.126 E.0159
G1 X168.427 Y197.624 E.86408
G1 X168.961 Y197.624 E.0159
G1 X148.46 Y218.126 E.86408
G1 X148.993 Y218.126 E.0159
G1 X169.494 Y197.624 E.86408
G1 X170.028 Y197.624 E.0159
G1 X149.527 Y218.126 E.86408
G1 X150.06 Y218.126 E.0159
G1 X170.562 Y197.624 E.86408
G1 X171.095 Y197.624 E.0159
G1 X150.594 Y218.126 E.86408
G1 X151.128 Y218.126 E.0159
G1 X171.629 Y197.624 E.86408
G1 X172.162 Y197.624 E.0159
G1 X151.661 Y218.126 E.86408
G1 X152.195 Y218.126 E.0159
G1 X172.696 Y197.624 E.86408
G1 X173.229 Y197.624 E.0159
G1 X152.728 Y218.126 E.86408
M73 P33 R51
G1 X153.262 Y218.126 E.0159
G1 X173.763 Y197.624 E.86408
G1 X174.296 Y197.624 E.0159
G1 X153.795 Y218.126 E.86408
G1 X154.329 Y218.126 E.0159
G1 X174.83 Y197.624 E.86408
G1 X175.364 Y197.624 E.0159
G1 X154.863 Y218.126 E.86408
G1 X155.396 Y218.126 E.0159
G1 X175.897 Y197.624 E.86408
G1 X176.431 Y197.624 E.0159
G1 X155.93 Y218.126 E.86408
G1 X156.463 Y218.126 E.0159
G1 X176.964 Y197.624 E.86408
G1 X177.498 Y197.624 E.0159
G1 X156.997 Y218.126 E.86408
G1 X157.53 Y218.126 E.0159
G1 X178.031 Y197.624 E.86408
G1 X178.565 Y197.624 E.0159
G1 X158.064 Y218.126 E.86408
G1 X158.598 Y218.126 E.0159
G1 X179.099 Y197.624 E.86408
G1 X179.632 Y197.624 E.0159
G1 X159.131 Y218.126 E.86408
G1 X159.665 Y218.126 E.0159
G1 X180.166 Y197.624 E.86408
G1 X180.699 Y197.624 E.0159
G1 X160.198 Y218.126 E.86408
G1 X160.732 Y218.126 E.0159
G1 X181.233 Y197.624 E.86408
G1 X181.766 Y197.624 E.0159
G1 X161.265 Y218.126 E.86408
G1 X161.799 Y218.126 E.0159
G1 X182.3 Y197.624 E.86408
G1 X182.834 Y197.624 E.0159
G1 X162.333 Y218.126 E.86408
G1 X162.866 Y218.126 E.0159
G1 X183.367 Y197.624 E.86408
G1 X183.901 Y197.624 E.0159
G1 X163.4 Y218.126 E.86408
G1 X163.933 Y218.126 E.0159
G1 X184.434 Y197.624 E.86408
G1 X184.968 Y197.624 E.0159
G1 X164.467 Y218.126 E.86408
G1 X165 Y218.126 E.0159
G1 X185.501 Y197.624 E.86408
G1 X186.035 Y197.624 E.0159
G1 X165.534 Y218.126 E.86408
G1 X166.067 Y218.126 E.0159
G1 X186.569 Y197.624 E.86408
G1 X187.102 Y197.624 E.0159
G1 X166.601 Y218.126 E.86408
G1 X167.135 Y218.126 E.0159
G1 X187.636 Y197.624 E.86408
G1 X188.169 Y197.624 E.0159
G1 X167.668 Y218.126 E.86408
G1 X168.202 Y218.126 E.0159
G1 X188.703 Y197.624 E.86408
G1 X189.236 Y197.624 E.0159
G1 X168.735 Y218.126 E.86408
G1 X169.269 Y218.126 E.0159
G1 X189.77 Y197.624 E.86408
G1 X190.304 Y197.624 E.0159
G1 X169.802 Y218.126 E.86408
G1 X170.336 Y218.126 E.0159
G1 X190.837 Y197.624 E.86408
G1 X191.371 Y197.624 E.0159
G1 X170.87 Y218.126 E.86408
G1 X171.403 Y218.126 E.0159
G1 X191.904 Y197.624 E.86408
G1 X192.438 Y197.624 E.0159
G1 X171.937 Y218.126 E.86408
G1 X172.47 Y218.126 E.0159
G1 X192.971 Y197.624 E.86408
G1 X193.505 Y197.624 E.0159
G1 X173.004 Y218.126 E.86408
G1 X173.537 Y218.126 E.0159
G1 X194.039 Y197.624 E.86408
G1 X194.572 Y197.624 E.0159
G1 X174.071 Y218.126 E.86408
G1 X174.605 Y218.126 E.0159
G1 X195.106 Y197.624 E.86408
G1 X195.639 Y197.624 E.0159
G1 X175.138 Y218.126 E.86408
G1 X175.672 Y218.126 E.0159
G1 X196.173 Y197.624 E.86408
G1 X196.706 Y197.624 E.0159
G1 X176.205 Y218.126 E.86408
G1 X176.739 Y218.126 E.0159
G1 X197.24 Y197.624 E.86408
G1 X197.774 Y197.624 E.0159
G1 X177.272 Y218.126 E.86408
G1 X177.806 Y218.126 E.0159
G1 X198.307 Y197.624 E.86408
G1 X198.841 Y197.624 E.0159
G1 X178.34 Y218.126 E.86408
G1 X178.873 Y218.126 E.0159
G1 X199.374 Y197.624 E.86408
G1 X199.908 Y197.624 E.0159
G1 X179.407 Y218.126 E.86408
G1 X179.94 Y218.126 E.0159
G1 X200.441 Y197.624 E.86408
G1 X200.975 Y197.624 E.0159
G1 X180.474 Y218.126 E.86408
G1 X181.007 Y218.126 E.0159
G1 X201.509 Y197.624 E.86408
G1 X202.042 Y197.624 E.0159
G1 X181.541 Y218.126 E.86408
G1 X182.075 Y218.126 E.0159
G1 X202.576 Y197.624 E.86408
G1 X203.109 Y197.624 E.0159
G1 X182.608 Y218.126 E.86408
G1 X183.142 Y218.126 E.0159
G1 X203.643 Y197.624 E.86408
G1 X204.176 Y197.624 E.0159
G1 X183.675 Y218.126 E.86408
G1 X184.209 Y218.126 E.0159
G1 X204.71 Y197.624 E.86408
G1 X205.243 Y197.624 E.0159
G1 X184.573 Y218.295 E.87123
; WIPE_START
G1 X185.987 Y216.881 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X180.333 Y211.753 Z.8 F30000
G1 X29.58 Y75.023 Z.8
G1 Z.4
G1 E.8 F1800
G1 F9541.731
G1 X70.729 Y33.874 E1.73434
G1 X70.195 Y33.874 E.0159
G1 X29.749 Y74.32 E1.7047
G1 X29.749 Y73.786 E.0159
G1 X69.661 Y33.874 E1.68222
G1 X69.128 Y33.874 E.0159
G1 X29.749 Y73.253 E1.65973
G1 X29.749 Y72.719 E.0159
G1 X68.594 Y33.874 E1.63724
G1 X68.061 Y33.874 E.0159
G1 X29.749 Y72.186 E1.61475
G1 X29.749 Y71.652 E.0159
G1 X67.527 Y33.874 E1.59226
G1 X66.994 Y33.874 E.0159
G1 X29.749 Y71.119 E1.56977
G1 X29.749 Y70.585 E.0159
G1 X66.46 Y33.874 E1.54728
G1 X65.927 Y33.874 E.0159
G1 X29.749 Y70.051 E1.52479
G1 X29.749 Y69.518 E.0159
G1 X65.393 Y33.874 E1.5023
G1 X64.859 Y33.874 E.0159
G1 X29.749 Y68.984 E1.47982
G1 X29.749 Y68.451 E.0159
G1 X64.326 Y33.874 E1.45733
G1 X63.792 Y33.874 E.0159
G1 X29.749 Y67.917 E1.43484
G1 X29.749 Y67.384 E.0159
G1 X63.259 Y33.874 E1.41235
G1 X62.725 Y33.874 E.0159
G1 X29.749 Y66.85 E1.38986
G1 X29.749 Y66.317 E.0159
G1 X62.192 Y33.874 E1.36737
G1 X61.658 Y33.874 E.0159
G1 X29.749 Y65.783 E1.34488
G1 X29.749 Y65.249 E.0159
G1 X61.124 Y33.874 E1.32239
G1 X60.591 Y33.874 E.0159
G1 X29.749 Y64.716 E1.2999
G1 X29.749 Y64.182 E.0159
G1 X60.057 Y33.874 E1.27742
G1 X59.524 Y33.874 E.0159
G1 X29.749 Y63.649 E1.25493
G1 X29.749 Y63.115 E.0159
G1 X58.99 Y33.874 E1.23244
G1 X58.457 Y33.874 E.0159
G1 X29.749 Y62.582 E1.20995
G1 X29.749 Y62.048 E.0159
G1 X57.923 Y33.874 E1.18746
G1 X57.389 Y33.874 E.0159
G1 X29.749 Y61.514 E1.16497
G1 X29.749 Y60.981 E.0159
G1 X56.856 Y33.874 E1.14248
G1 X56.322 Y33.874 E.0159
G1 X29.749 Y60.447 E1.11999
G1 X29.749 Y59.914 E.0159
G1 X55.789 Y33.874 E1.0975
G1 X55.255 Y33.874 E.0159
G1 X29.749 Y59.38 E1.07502
G1 X29.749 Y58.847 E.0159
G1 X41.098 Y47.498 E.47831
G3 X40.414 Y47.648 I-1.104 J-3.402 E.02088
G1 X29.749 Y58.313 E.44951
M73 P33 R50
G1 X29.749 Y57.779 E.0159
G1 X39.857 Y47.671 E.42603
G3 X39.378 Y47.617 I.031 J-2.419 E.0144
G1 X29.749 Y57.246 E.40583
G1 X29.749 Y56.712 E.0159
G1 X38.948 Y47.514 E.38769
G3 X38.558 Y47.37 I.525 J-2.018 E.0124
G1 X29.749 Y56.179 E.37128
G1 X29.749 Y55.645 E.0159
G1 X38.206 Y47.189 E.35642
G3 X37.885 Y46.976 I.903 J-1.705 E.01149
G1 X29.749 Y55.112 E.34291
G1 X29.749 Y54.578 E.0159
G1 X37.594 Y46.733 E.33063
G3 X37.331 Y46.463 I1.219 J-1.448 E.01126
G1 X29.749 Y54.044 E.31955
G1 X29.749 Y53.511 E.0159
G1 X37.097 Y46.164 E.30967
G3 X36.892 Y45.835 I1.539 J-1.186 E.01156
G1 X29.749 Y52.977 E.30104
G1 X29.749 Y52.444 E.0159
G1 X36.719 Y45.474 E.29376
G3 X36.582 Y45.078 I1.912 J-.885 E.01252
G1 X29.749 Y51.91 E.28797
G1 X29.749 Y51.377 E.0159
G1 X36.487 Y44.64 E.28396
G3 X36.453 Y44.14 I2.48 J-.419 E.01495
G1 X29.749 Y50.843 E.28253
G1 X29.749 Y50.309 E.0159
G1 X36.494 Y43.565 E.28428
G3 X36.697 Y42.828 I3.855 J.666 E.0228
G1 X29.749 Y49.776 E.29283
G1 X29.749 Y49.242 E.0159
G1 X45.117 Y33.874 E.64773
G1 X45.651 Y33.874 E.0159
G1 X38.701 Y40.824 E.29291
G3 X39.435 Y40.624 I1.278 J3.239 E.02271
G1 X46.184 Y33.874 E.28448
G1 X46.718 Y33.874 E.0159
G1 X40.015 Y40.577 E.2825
G3 X40.512 Y40.614 I.063 J2.499 E.01486
G1 X47.252 Y33.874 E.28407
G1 X47.785 Y33.874 E.0159
G1 X40.955 Y40.705 E.28787
G3 X41.35 Y40.843 I-2.237 J7.034 E.01248
G1 X48.319 Y33.874 E.2937
G1 X48.852 Y33.874 E.0159
G1 X41.71 Y41.016 E.30102
G3 X42.039 Y41.222 I-.861 J1.742 E.01156
G1 X49.386 Y33.874 E.30968
G1 X49.919 Y33.874 E.0159
G1 X42.337 Y41.457 E.31957
G3 X42.607 Y41.72 I-1.181 J1.482 E.01126
G1 X50.453 Y33.874 E.33067
G1 X50.987 Y33.874 E.0159
G1 X42.849 Y42.012 E.34297
G3 X43.062 Y42.333 I-1.502 J1.226 E.01149
G1 X51.52 Y33.874 E.3565
G1 X52.054 Y33.874 E.0159
G1 X43.244 Y42.685 E.37133
G3 X43.391 Y43.071 I-1.853 J.93 E.01234
G1 X52.587 Y33.874 E.3876
G1 X53.121 Y33.874 E.0159
G1 X43.493 Y43.502 E.40578
G3 X43.545 Y43.984 I-2.39 J.498 E.01448
G1 X53.654 Y33.874 E.42611
G1 X54.188 Y33.874 E.0159
G1 X43.525 Y44.537 E.44942
G3 X43.377 Y45.219 I-4.094 J-.534 E.02083
G1 X54.891 Y33.705 E.48532
G1 X29.58 Y34.472 F30000
G1 F9541.731
G1 X30.177 Y33.874 E.02519
G1 X30.711 Y33.874 E.0159
G1 X29.749 Y34.836 E.04053
G1 X29.749 Y35.37 E.0159
G1 X31.245 Y33.874 E.06301
G1 X31.778 Y33.874 E.0159
G1 X29.749 Y35.903 E.0855
G1 X29.749 Y36.437 E.0159
G1 X32.312 Y33.874 E.10799
G1 X32.845 Y33.874 E.0159
G1 X29.749 Y36.97 E.13048
G1 X29.749 Y37.504 E.0159
G1 X33.379 Y33.874 E.15297
G1 X33.912 Y33.874 E.0159
G1 X29.749 Y38.037 E.17546
G1 X29.749 Y38.571 E.0159
G1 X34.446 Y33.874 E.19795
G1 X34.98 Y33.874 E.0159
G1 X29.749 Y39.105 E.22044
G1 X29.749 Y39.638 E.0159
G1 X35.513 Y33.874 E.24293
G1 X36.047 Y33.874 E.0159
G1 X29.749 Y40.172 E.26541
G1 X29.749 Y40.705 E.0159
G1 X36.58 Y33.874 E.2879
G1 X37.114 Y33.874 E.0159
G1 X29.749 Y41.239 E.31039
G1 X29.749 Y41.772 E.0159
G1 X37.647 Y33.874 E.33288
G1 X38.181 Y33.874 E.0159
G1 X29.749 Y42.306 E.35537
G1 X29.749 Y42.839 E.0159
G1 X38.714 Y33.874 E.37786
G1 X39.248 Y33.874 E.0159
G1 X29.749 Y43.373 E.40035
G1 X29.749 Y43.907 E.0159
G1 X39.782 Y33.874 E.42284
G1 X40.315 Y33.874 E.0159
G1 X29.749 Y44.44 E.44533
G1 X29.749 Y44.974 E.0159
G1 X40.849 Y33.874 E.46781
G1 X41.382 Y33.874 E.0159
G1 X29.749 Y45.507 E.4903
G1 X29.749 Y46.041 E.0159
G1 X41.916 Y33.874 E.51279
G1 X42.449 Y33.874 E.0159
G1 X29.749 Y46.574 E.53528
G1 X29.749 Y47.108 E.0159
G1 X42.983 Y33.874 E.55777
G1 X43.517 Y33.874 E.0159
G1 X29.749 Y47.642 E.58026
G1 X29.749 Y48.175 E.0159
G1 X44.05 Y33.874 E.60275
G1 X44.584 Y33.874 E.0159
G1 X29.58 Y48.878 E.63239
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9541.731
G1 X30.994 Y47.464 E-.76
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
G1 X126.509 Y205.028
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X126.679 Y204.948 E.00604
G3 X127.7 Y204.674 I1.33 J2.928 E.03414
G3 X128.872 Y204.777 I.315 J3.132 E.03804
G3 X126.394 Y205.095 I-.862 J3.098 E.56727
G1 X126.457 Y205.058 E.00235
G1 X126.996 Y205.254 F30000
G1 F8843.478
G1 X127.106 Y205.215 E.00377
G3 X127.731 Y205.08 I.901 J2.66 E.02058
G3 X128.761 Y205.17 I.282 J2.739 E.03346
G3 X126.846 Y205.318 I-.753 J2.706 E.50445
G1 X126.941 Y205.278 E.0033
G1 X127.423 Y205.547 F30000
G1 F8843.478
G1 X127.466 Y205.536 E.00143
G3 X127.761 Y205.486 I.542 J2.339 E.00962
G3 X128.417 Y205.509 I.24 J2.594 E.02117
G3 X127.014 Y205.689 I-.409 J2.366 E.43891
G1 X127.366 Y205.566 E.01201
G1 X127.787 Y205.878 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X127.79 Y205.877 E.00009
G3 X128.15 Y205.87 I.215 J1.793 E.01074
G3 X127.553 Y205.918 I-.141 J2.004 E.35812
G1 X127.728 Y205.888 E.00529
; WIPE_START
M204 S10000
G1 X127.79 Y205.877 E-.02389
G1 X128.15 Y205.87 E-.13677
G1 X128.544 Y205.94 E-.15214
G1 X128.917 Y206.086 E-.15209
G1 X129.253 Y206.303 E-.15215
G1 X129.404 Y206.436 E-.07615
G1 X129.517 Y206.571 E-.0668
; WIPE_END
G1 E-.04 F1800
G1 X137.148 Y206.432 Z1 F30000
G1 X214.509 Y205.028 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X214.679 Y204.948 E.00605
G3 X215.7 Y204.675 I1.33 J2.928 E.03414
G3 X216.872 Y204.777 I.315 J3.133 E.03804
G3 X214.395 Y205.094 I-.862 J3.098 E.56728
G1 X214.457 Y205.058 E.00232
G1 X214.995 Y205.254 F30000
G1 F8843.478
G1 X215.106 Y205.215 E.00379
G3 X215.731 Y205.08 I.901 J2.66 E.02058
G3 X216.761 Y205.17 I.282 J2.74 E.03347
G3 X214.846 Y205.318 I-.753 J2.706 E.50444
G1 X214.94 Y205.278 E.00329
G1 X215.423 Y205.547 F30000
G1 F8843.478
G1 X215.466 Y205.536 E.00144
G3 X215.761 Y205.486 I.542 J2.339 E.00962
G3 X216.417 Y205.509 I.24 J2.593 E.02117
G3 X215.014 Y205.689 I-.409 J2.366 E.43891
G1 X215.366 Y205.567 E.01199
G1 X215.78 Y205.879 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X215.79 Y205.877 E.00031
G3 X216.15 Y205.87 I.215 J1.793 E.01074
G3 X215.553 Y205.918 I-.141 J2.004 E.35812
G1 X215.721 Y205.889 E.00507
; WIPE_START
M204 S10000
G1 X215.79 Y205.877 E-.0267
G1 X216.15 Y205.87 E-.13678
G1 X216.544 Y205.94 E-.15215
G1 X216.917 Y206.086 E-.15208
G1 X217.253 Y206.303 E-.15215
G1 X217.404 Y206.436 E-.07614
G1 X217.512 Y206.565 E-.06399
; WIPE_END
G1 E-.04 F1800
G1 X217.349 Y198.934 Z1 F30000
G1 X215.863 Y129.213 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X215.6 Y129.19 E.00847
G3 X215.7 Y122.799 I.409 J-3.19 E.30172
G3 X216.871 Y122.902 I.315 J3.134 E.03803
G3 X215.923 Y129.215 I-.862 J3.098 E.2996
G1 X215.892 Y128.807 F30000
G1 F8843.478
G1 X215.651 Y128.786 E.00778
G3 X215.731 Y123.205 I.357 J-2.786 E.2633
G3 X216.761 Y123.295 I.282 J2.74 E.03346
G3 X215.952 Y128.808 I-.753 J2.706 E.26101
G1 X215.904 Y128.398 F30000
G1 F8843.478
G1 X215.466 Y128.338 E.0142
G3 X215.761 Y123.611 I.542 J-2.339 E.21701
G3 X216.417 Y123.634 I.24 J2.594 E.02117
G3 X215.964 Y128.4 I-.409 J2.366 E.23075
G1 X215.862 Y127.999 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X215.553 Y127.956 E.00927
G3 X215.79 Y124.002 I.455 J-1.957 E.1678
G3 X216.15 Y123.995 I.215 J1.794 E.01074
G3 X215.95 Y128.008 I-.141 J2.004 E.18556
G1 X215.921 Y128.005 E.00085
; WIPE_START
M204 S10000
G1 X215.553 Y127.956 E-.14104
G1 X215.36 Y127.906 E-.07611
G1 X214.995 Y127.741 E-.1521
G1 X214.67 Y127.507 E-.15215
G1 X214.398 Y127.214 E-.15209
G1 X214.279 Y127.02 E-.08652
; WIPE_END
G1 E-.04 F1800
G1 X214.299 Y119.387 Z1 F30000
G1 X214.508 Y41.278 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X214.679 Y41.198 E.00607
G3 X215.7 Y40.924 I1.33 J2.928 E.03414
G3 X216.871 Y41.027 I.315 J3.134 E.03804
G3 X214.395 Y41.344 I-.862 J3.098 E.56728
G1 X214.456 Y41.308 E.00231
G1 X214.995 Y41.504 F30000
G1 F8843.478
G1 X215.106 Y41.465 E.0038
G3 X215.731 Y41.33 I.901 J2.66 E.02058
G3 X216.761 Y41.42 I.282 J2.741 E.03346
G3 X214.846 Y41.568 I-.753 J2.706 E.50445
G1 X214.94 Y41.528 E.00327
G1 X215.422 Y41.797 F30000
G1 F8843.478
G1 X215.466 Y41.786 E.00146
G3 X215.761 Y41.736 I.542 J2.339 E.00962
G3 X216.417 Y41.759 I.24 J2.594 E.02117
G3 X215.014 Y41.939 I-.409 J2.366 E.4389
G1 X215.365 Y41.817 E.01197
G1 X215.786 Y42.128 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X215.79 Y42.127 E.00012
G3 X216.15 Y42.12 I.215 J1.794 E.01074
G3 X215.553 Y42.168 I-.141 J2.004 E.35812
G1 X215.727 Y42.138 E.00525
; WIPE_START
M204 S10000
G1 X215.79 Y42.127 E-.02439
G1 X216.15 Y42.12 E-.13678
G1 X216.544 Y42.19 E-.15213
G1 X216.917 Y42.336 E-.1521
G1 X217.253 Y42.553 E-.15216
G1 X217.522 Y42.815 E-.14244
; WIPE_END
G1 E-.04 F1800
G1 X209.89 Y42.686 Z1 F30000
G1 X126.509 Y41.278 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X126.679 Y41.198 E.00606
G3 X127.7 Y40.924 I1.33 J2.928 E.03415
G3 X128.872 Y41.027 I.315 J3.132 E.03804
G3 X126.395 Y41.344 I-.862 J3.098 E.56728
G1 X126.457 Y41.308 E.00231
G1 X126.995 Y41.504 F30000
G1 F8843.478
G1 X127.106 Y41.465 E.00379
G3 X127.731 Y41.33 I.901 J2.66 E.02059
G3 X128.761 Y41.42 I.282 J2.739 E.03346
G3 X126.846 Y41.568 I-.754 J2.706 E.50444
G1 X126.94 Y41.528 E.00328
G1 X127.422 Y41.797 F30000
G1 F8843.478
G1 X127.466 Y41.786 E.00145
G3 X127.761 Y41.736 I.542 J2.339 E.00962
G3 X128.417 Y41.759 I.24 J2.593 E.02117
G3 X127.014 Y41.939 I-.409 J2.366 E.43891
G1 X127.366 Y41.817 E.01199
G1 X127.786 Y42.128 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X127.79 Y42.127 E.00013
G3 X128.15 Y42.12 I.215 J1.794 E.01074
G3 X127.553 Y42.168 I-.141 J2.004 E.35812
G1 X127.727 Y42.138 E.00525
; WIPE_START
M204 S10000
G1 X127.79 Y42.127 E-.0244
G1 X128.15 Y42.12 E-.13677
G1 X128.544 Y42.19 E-.15214
G1 X128.917 Y42.336 E-.15208
G1 X129.253 Y42.553 E-.15216
G1 X129.522 Y42.815 E-.14245
; WIPE_END
G1 E-.04 F1800
G1 X121.891 Y42.663 Z1 F30000
G1 X40.93 Y41.047 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.176 Y41.129 E.00833
G3 X39.7 Y40.924 I-1.167 J2.997 E.6014
G3 X40.872 Y41.027 I.315 J3.132 E.03804
G1 X40.873 Y41.028 E.00006
G1 X40.412 Y41.348 F30000
G1 F8843.478
G1 X40.488 Y41.357 E.00245
G3 X40.761 Y41.42 I-.475 J2.712 E.00902
G3 X39.731 Y41.33 I-.754 J2.706 E.53402
G3 X40.21 Y41.323 I.282 J2.739 E.01544
G1 X40.353 Y41.341 E.00463
G1 X40.033 Y41.732 F30000
G1 F8843.478
G1 X40.179 Y41.731 E.0047
G3 X40.417 Y41.759 I-.178 J2.599 E.0077
G3 X39.761 Y41.736 I-.409 J2.366 E.46391
G1 X39.973 Y41.733 E.00682
G1 X39.798 Y42.127 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X40.15 Y42.12 E.01049
G3 X39.738 Y42.134 I-.141 J2.004 E.36373
; WIPE_START
M204 S10000
G1 X40.15 Y42.12 E-.15653
G1 X40.349 Y42.145 E-.0762
G1 X40.734 Y42.254 E-.15212
G1 X41.091 Y42.436 E-.15211
G1 X41.404 Y42.686 E-.1521
G1 X41.524 Y42.829 E-.07095
; WIPE_END
G1 E-.04 F1800
G1 X47.078 Y48.064 Z1 F30000
G1 X205.416 Y197.291 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X50.584 Y197.291 E4.97885
G1 X50.584 Y54.709 E4.58493
G1 X205.416 Y54.709 E4.97885
G1 X205.416 Y197.231 E4.583
G1 X205.009 Y196.884 F30000
G1 F8843.478
G1 X50.991 Y196.884 E4.95267
G1 X50.991 Y55.116 E4.55875
G1 X205.009 Y55.116 E4.95267
G1 X205.009 Y196.824 E4.55682
G1 X204.602 Y196.477 F30000
G1 F8843.478
G1 X51.398 Y196.477 E4.92649
G1 X51.398 Y55.523 E4.53257
G1 X204.602 Y55.523 E4.92649
G1 X204.602 Y196.417 E4.53064
G1 X204.21 Y196.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X51.79 Y196.085 E4.54007
G1 X51.79 Y55.915 E4.17519
G1 X204.21 Y55.915 E4.54007
G1 X204.21 Y196.025 E4.1734
; WIPE_START
M204 S10000
G1 X202.21 Y196.026 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X195.237 Y192.922 Z1 F30000
G1 X38.509 Y123.153 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X38.679 Y123.073 E.00606
G3 X39.7 Y122.799 I1.33 J2.928 E.03414
G3 X40.872 Y122.902 I.315 J3.133 E.03804
G3 X38.395 Y123.219 I-.862 J3.098 E.56728
G1 X38.457 Y123.183 E.00232
G1 X38.995 Y123.379 F30000
G1 F8843.478
G1 X39.106 Y123.34 E.00379
G3 X39.731 Y123.205 I.901 J2.66 E.02058
G3 X40.761 Y123.295 I.282 J2.74 E.03346
G3 X38.846 Y123.443 I-.753 J2.706 E.50445
G1 X38.94 Y123.403 E.00328
G1 X39.422 Y123.672 F30000
G1 F8843.478
G1 X39.466 Y123.661 E.00145
G3 X39.761 Y123.611 I.542 J2.339 E.00962
G3 X40.417 Y123.634 I.24 J2.594 E.02117
G3 X39.014 Y123.814 I-.409 J2.366 E.43891
G1 X39.366 Y123.692 E.01198
G1 X39.786 Y124.003 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X39.79 Y124.002 E.00012
G3 X40.15 Y123.995 I.215 J1.794 E.01074
G3 X39.553 Y124.043 I-.141 J2.004 E.35812
G1 X39.727 Y124.013 E.00525
; WIPE_START
M204 S10000
G1 X39.79 Y124.002 E-.02439
G1 X40.15 Y123.995 E-.13677
G1 X40.544 Y124.065 E-.15211
G1 X40.917 Y124.211 E-.15213
M73 P34 R50
G1 X41.253 Y124.428 E-.15214
G1 X41.522 Y124.69 E-.14245
; WIPE_END
G1 E-.04 F1800
G1 X41.236 Y132.317 Z1 F30000
G1 X38.509 Y205.028 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X38.679 Y204.948 E.00605
G3 X39.7 Y204.675 I1.33 J2.928 E.03414
G3 X40.872 Y204.777 I.315 J3.132 E.03804
G3 X38.395 Y205.094 I-.862 J3.099 E.56738
G1 X38.457 Y205.058 E.00232
G1 X38.995 Y205.254 F30000
G1 F8843.478
G1 X39.106 Y205.215 E.00378
G3 X39.73 Y205.08 I.901 J2.66 E.02058
G3 X40.761 Y205.17 I.282 J2.739 E.03347
G3 X38.846 Y205.318 I-.753 J2.706 E.50444
G1 X38.94 Y205.278 E.00328
G1 X39.423 Y205.547 F30000
G1 F8843.478
G1 X39.466 Y205.536 E.00144
G3 X39.761 Y205.486 I.542 J2.339 E.00962
G3 X40.417 Y205.509 I.24 J2.594 E.02117
G3 X39.014 Y205.689 I-.409 J2.366 E.43891
G1 X39.366 Y205.567 E.01199
G1 X39.78 Y205.879 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X39.79 Y205.877 E.00032
G3 X40.15 Y205.87 I.215 J1.793 E.01074
G3 X39.553 Y205.918 I-.141 J2.004 E.35812
G1 X39.721 Y205.889 E.00506
; WIPE_START
M204 S10000
G1 X39.79 Y205.877 E-.02686
G1 X40.15 Y205.87 E-.13678
G1 X40.544 Y205.94 E-.15214
G1 X40.917 Y206.086 E-.15209
G1 X41.253 Y206.303 E-.15215
G1 X41.404 Y206.436 E-.07614
G1 X41.512 Y206.565 E-.06383
; WIPE_END
G1 E-.04 F1800
G1 X49.128 Y207.054 Z1 F30000
G1 X226.584 Y218.459 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X29.416 Y218.459 E6.34019
G1 X29.416 Y33.541 E5.94628
G1 X226.584 Y33.541 E6.34019
G1 X226.584 Y218.399 E5.94435
G1 X226.991 Y218.866 F30000
G1 F8843.478
G1 X29.009 Y218.866 E6.36637
G1 X29.009 Y33.134 E5.97246
G1 X226.991 Y33.134 E6.36637
G1 X226.991 Y218.806 E5.97053
G1 X227.398 Y219.273 F30000
G1 F8843.478
G1 X28.602 Y219.273 E6.39255
G1 X28.602 Y32.727 E5.99864
G1 X227.398 Y32.727 E6.39255
G1 X227.398 Y219.213 E5.99671
G1 X227.79 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X28.21 Y219.665 E5.94481
G1 X28.21 Y32.335 E5.57992
G1 X227.79 Y32.335 E5.94481
G1 X227.79 Y219.605 E5.57813
; WIPE_START
M204 S10000
G1 X225.79 Y219.606 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X220.831 Y218.295 Z1 F30000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42021
G1 F9541.731
G1 X200.16 Y197.624 E.87123
G1 X199.627 Y197.624 E.0159
G1 X220.128 Y218.126 E.86408
G1 X219.594 Y218.126 E.0159
G1 X199.093 Y197.624 E.86408
G1 X198.56 Y197.624 E.0159
G1 X219.061 Y218.126 E.86408
G1 X218.527 Y218.126 E.0159
G1 X198.026 Y197.624 E.86408
G1 X197.492 Y197.624 E.0159
G1 X217.994 Y218.126 E.86408
G1 X217.46 Y218.126 E.0159
G1 X196.959 Y197.624 E.86408
G1 X196.425 Y197.624 E.0159
G1 X216.926 Y218.126 E.86408
G1 X216.393 Y218.126 E.0159
G1 X195.892 Y197.624 E.86408
G1 X195.358 Y197.624 E.0159
G1 X215.859 Y218.126 E.86408
G1 X215.326 Y218.126 E.0159
G1 X194.825 Y197.624 E.86408
G1 X194.291 Y197.624 E.0159
G1 X214.792 Y218.126 E.86408
G1 X214.259 Y218.126 E.0159
G1 X193.758 Y197.624 E.86408
G1 X193.224 Y197.624 E.0159
G1 X213.725 Y218.126 E.86408
G1 X213.191 Y218.126 E.0159
G1 X192.69 Y197.624 E.86408
G1 X192.157 Y197.624 E.0159
G1 X212.658 Y218.126 E.86408
G1 X212.124 Y218.126 E.0159
G1 X191.623 Y197.624 E.86408
G1 X191.09 Y197.624 E.0159
G1 X211.591 Y218.126 E.86408
G1 X211.057 Y218.126 E.0159
G1 X190.556 Y197.624 E.86408
G1 X190.023 Y197.624 E.0159
G1 X210.524 Y218.126 E.86408
G1 X209.99 Y218.126 E.0159
G1 X189.489 Y197.624 E.86408
G1 X188.955 Y197.624 E.0159
G1 X209.456 Y218.126 E.86408
G1 X208.923 Y218.126 E.0159
G1 X188.422 Y197.624 E.86408
G1 X187.888 Y197.624 E.0159
G1 X208.389 Y218.126 E.86408
G1 X207.856 Y218.126 E.0159
G1 X187.355 Y197.624 E.86408
G1 X186.821 Y197.624 E.0159
G1 X207.322 Y218.126 E.86408
G1 X206.789 Y218.126 E.0159
G1 X186.288 Y197.624 E.86408
G1 X185.754 Y197.624 E.0159
G1 X206.255 Y218.126 E.86408
M73 P34 R49
G1 X205.721 Y218.126 E.0159
G1 X185.22 Y197.624 E.86408
G1 X184.687 Y197.624 E.0159
G1 X205.188 Y218.126 E.86408
G1 X204.654 Y218.126 E.0159
G1 X184.153 Y197.624 E.86408
G1 X183.62 Y197.624 E.0159
G1 X204.121 Y218.126 E.86408
G1 X203.587 Y218.126 E.0159
G1 X183.086 Y197.624 E.86408
G1 X182.553 Y197.624 E.0159
G1 X203.054 Y218.126 E.86408
G1 X202.52 Y218.126 E.0159
G1 X182.019 Y197.624 E.86408
G1 X181.485 Y197.624 E.0159
G1 X201.987 Y218.126 E.86408
G1 X201.453 Y218.126 E.0159
G1 X180.952 Y197.624 E.86408
G1 X180.418 Y197.624 E.0159
G1 X200.919 Y218.126 E.86408
G1 X200.386 Y218.126 E.0159
G1 X179.885 Y197.624 E.86408
G1 X179.351 Y197.624 E.0159
G1 X199.852 Y218.126 E.86408
G1 X199.319 Y218.126 E.0159
G1 X178.818 Y197.624 E.86408
G1 X178.284 Y197.624 E.0159
G1 X198.785 Y218.126 E.86408
G1 X198.252 Y218.126 E.0159
G1 X177.75 Y197.624 E.86408
G1 X177.217 Y197.624 E.0159
G1 X197.718 Y218.126 E.86408
G1 X197.184 Y218.126 E.0159
G1 X176.683 Y197.624 E.86408
G1 X176.15 Y197.624 E.0159
G1 X196.651 Y218.126 E.86408
G1 X196.117 Y218.126 E.0159
G1 X175.616 Y197.624 E.86408
G1 X175.083 Y197.624 E.0159
G1 X195.584 Y218.126 E.86408
G1 X195.05 Y218.126 E.0159
G1 X174.549 Y197.624 E.86408
G1 X174.015 Y197.624 E.0159
G1 X194.517 Y218.126 E.86408
G1 X193.983 Y218.126 E.0159
G1 X173.482 Y197.624 E.86408
G1 X172.948 Y197.624 E.0159
G1 X193.449 Y218.126 E.86408
G1 X192.916 Y218.126 E.0159
G1 X172.415 Y197.624 E.86408
G1 X171.881 Y197.624 E.0159
G1 X192.382 Y218.126 E.86408
G1 X191.849 Y218.126 E.0159
G1 X171.348 Y197.624 E.86408
G1 X170.814 Y197.624 E.0159
G1 X191.315 Y218.126 E.86408
G1 X190.782 Y218.126 E.0159
G1 X170.28 Y197.624 E.86408
G1 X169.747 Y197.624 E.0159
G1 X190.248 Y218.126 E.86408
G1 X189.714 Y218.126 E.0159
G1 X169.213 Y197.624 E.86408
G1 X168.68 Y197.624 E.0159
G1 X189.181 Y218.126 E.86408
G1 X188.647 Y218.126 E.0159
G1 X168.146 Y197.624 E.86408
G1 X167.613 Y197.624 E.0159
G1 X188.114 Y218.126 E.86408
G1 X187.58 Y218.126 E.0159
G1 X167.079 Y197.624 E.86408
G1 X166.546 Y197.624 E.0159
G1 X187.047 Y218.126 E.86408
G1 X186.513 Y218.126 E.0159
G1 X166.012 Y197.624 E.86408
G1 X165.478 Y197.624 E.0159
G1 X185.979 Y218.126 E.86408
G1 X185.446 Y218.126 E.0159
G1 X164.945 Y197.624 E.86408
G1 X164.411 Y197.624 E.0159
G1 X184.912 Y218.126 E.86408
G1 X184.379 Y218.126 E.0159
G1 X163.878 Y197.624 E.86408
G1 X163.344 Y197.624 E.0159
G1 X183.845 Y218.126 E.86408
G1 X183.312 Y218.126 E.0159
G1 X162.811 Y197.624 E.86408
G1 X162.277 Y197.624 E.0159
G1 X182.778 Y218.126 E.86408
G1 X182.244 Y218.126 E.0159
G1 X161.743 Y197.624 E.86408
G1 X161.21 Y197.624 E.0159
G1 X181.711 Y218.126 E.86408
G1 X181.177 Y218.126 E.0159
G1 X160.676 Y197.624 E.86408
G1 X160.143 Y197.624 E.0159
G1 X180.644 Y218.126 E.86408
G1 X180.11 Y218.126 E.0159
G1 X159.609 Y197.624 E.86408
G1 X159.076 Y197.624 E.0159
G1 X179.577 Y218.126 E.86408
G1 X179.043 Y218.126 E.0159
G1 X158.542 Y197.624 E.86408
G1 X158.008 Y197.624 E.0159
G1 X178.509 Y218.126 E.86408
G1 X177.976 Y218.126 E.0159
G1 X157.475 Y197.624 E.86408
G1 X156.941 Y197.624 E.0159
G1 X177.442 Y218.126 E.86408
M73 P35 R49
G1 X176.909 Y218.126 E.0159
G1 X156.408 Y197.624 E.86408
G1 X155.874 Y197.624 E.0159
G1 X176.375 Y218.126 E.86408
G1 X175.842 Y218.126 E.0159
G1 X155.341 Y197.624 E.86408
G1 X154.807 Y197.624 E.0159
G1 X175.308 Y218.126 E.86408
G1 X174.775 Y218.126 E.0159
G1 X154.273 Y197.624 E.86408
G1 X153.74 Y197.624 E.0159
G1 X174.241 Y218.126 E.86408
G1 X173.707 Y218.126 E.0159
G1 X153.206 Y197.624 E.86408
G1 X152.673 Y197.624 E.0159
G1 X173.174 Y218.126 E.86408
G1 X172.64 Y218.126 E.0159
G1 X152.139 Y197.624 E.86408
G1 X151.606 Y197.624 E.0159
G1 X172.107 Y218.126 E.86408
G1 X171.573 Y218.126 E.0159
G1 X151.072 Y197.624 E.86408
G1 X150.538 Y197.624 E.0159
G1 X171.04 Y218.126 E.86408
G1 X170.506 Y218.126 E.0159
G1 X150.005 Y197.624 E.86408
G1 X149.471 Y197.624 E.0159
G1 X169.972 Y218.126 E.86408
G1 X169.439 Y218.126 E.0159
G1 X148.938 Y197.624 E.86408
G1 X148.404 Y197.624 E.0159
G1 X168.905 Y218.126 E.86408
G1 X168.372 Y218.126 E.0159
G1 X147.871 Y197.624 E.86408
G1 X147.337 Y197.624 E.0159
G1 X167.838 Y218.126 E.86408
G1 X167.305 Y218.126 E.0159
G1 X146.803 Y197.624 E.86408
G1 X146.27 Y197.624 E.0159
G1 X166.771 Y218.126 E.86408
G1 X166.237 Y218.126 E.0159
G1 X145.736 Y197.624 E.86408
G1 X145.203 Y197.624 E.0159
G1 X165.704 Y218.126 E.86408
G1 X165.17 Y218.126 E.0159
G1 X144.669 Y197.624 E.86408
G1 X144.136 Y197.624 E.0159
G1 X164.637 Y218.126 E.86408
G1 X164.103 Y218.126 E.0159
G1 X143.602 Y197.624 E.86408
G1 X143.068 Y197.624 E.0159
G1 X163.57 Y218.126 E.86408
G1 X163.036 Y218.126 E.0159
G1 X142.535 Y197.624 E.86408
G1 X142.001 Y197.624 E.0159
G1 X162.502 Y218.126 E.86408
G1 X161.969 Y218.126 E.0159
G1 X141.468 Y197.624 E.86408
G1 X140.934 Y197.624 E.0159
G1 X161.435 Y218.126 E.86408
G1 X160.902 Y218.126 E.0159
G1 X140.401 Y197.624 E.86408
G1 X139.867 Y197.624 E.0159
G1 X160.368 Y218.126 E.86408
G1 X159.835 Y218.126 E.0159
G1 X139.334 Y197.624 E.86408
G1 X138.8 Y197.624 E.0159
G1 X159.301 Y218.126 E.86408
G1 X158.767 Y218.126 E.0159
G1 X138.266 Y197.624 E.86408
G1 X137.733 Y197.624 E.0159
G1 X158.234 Y218.126 E.86408
G1 X157.7 Y218.126 E.0159
G1 X137.199 Y197.624 E.86408
G1 X136.666 Y197.624 E.0159
G1 X157.167 Y218.126 E.86408
G1 X156.633 Y218.126 E.0159
G1 X136.132 Y197.624 E.86408
G1 X135.599 Y197.624 E.0159
G1 X156.1 Y218.126 E.86408
G1 X155.566 Y218.126 E.0159
G1 X135.065 Y197.624 E.86408
G1 X134.531 Y197.624 E.0159
G1 X155.032 Y218.126 E.86408
G1 X154.499 Y218.126 E.0159
G1 X133.998 Y197.624 E.86408
G1 X133.464 Y197.624 E.0159
G1 X153.965 Y218.126 E.86408
G1 X153.432 Y218.126 E.0159
G1 X132.931 Y197.624 E.86408
G1 X132.397 Y197.624 E.0159
G1 X152.898 Y218.126 E.86408
G1 X152.365 Y218.126 E.0159
G1 X131.864 Y197.624 E.86408
G1 X131.33 Y197.624 E.0159
G1 X151.831 Y218.126 E.86408
G1 X151.297 Y218.126 E.0159
G1 X130.796 Y197.624 E.86408
G1 X130.263 Y197.624 E.0159
G1 X150.764 Y218.126 E.86408
G1 X150.23 Y218.126 E.0159
G1 X129.729 Y197.624 E.86408
G1 X129.196 Y197.624 E.0159
G1 X149.697 Y218.126 E.86408
G1 X149.163 Y218.126 E.0159
G1 X128.662 Y197.624 E.86408
G1 X128.129 Y197.624 E.0159
G1 X148.63 Y218.126 E.86408
G1 X148.096 Y218.126 E.0159
G1 X127.595 Y197.624 E.86408
G1 X127.061 Y197.624 E.0159
G1 X147.563 Y218.126 E.86408
G1 X147.029 Y218.126 E.0159
G1 X126.528 Y197.624 E.86408
G1 X125.994 Y197.624 E.0159
G1 X146.495 Y218.126 E.86408
G1 X145.962 Y218.126 E.0159
G1 X125.461 Y197.624 E.86408
G1 X124.927 Y197.624 E.0159
G1 X145.428 Y218.126 E.86408
G1 X144.895 Y218.126 E.0159
G1 X124.394 Y197.624 E.86408
G1 X123.86 Y197.624 E.0159
G1 X144.361 Y218.126 E.86408
G1 X143.828 Y218.126 E.0159
G1 X123.326 Y197.624 E.86408
G1 X122.793 Y197.624 E.0159
G1 X143.294 Y218.126 E.86408
G1 X142.76 Y218.126 E.0159
G1 X131.354 Y206.719 E.48074
G3 X131.518 Y207.417 I-3.472 J1.184 E.02139
G1 X142.227 Y218.126 E.45135
G1 X141.693 Y218.126 E.0159
G1 X131.546 Y207.979 E.42767
G3 X131.498 Y208.464 I-2.453 J.003 E.01457
G1 X141.16 Y218.126 E.4072
G1 X140.626 Y218.126 E.0159
G1 X131.4 Y208.899 E.38888
G3 X131.256 Y209.289 I-6.67 J-2.233 E.01239
G1 X140.093 Y218.126 E.37244
G1 X139.559 Y218.126 E.0159
G1 X131.077 Y209.643 E.35752
G3 X130.866 Y209.966 I-1.723 J-.894 E.01151
G1 X139.025 Y218.126 E.3439
G1 X138.492 Y218.126 E.0159
G1 X130.626 Y210.26 E.33152
G3 X130.358 Y210.525 I-1.462 J-1.21 E.01126
G1 X137.958 Y218.126 E.32034
G1 X137.425 Y218.126 E.0159
G1 X130.061 Y210.762 E.31036
G3 X129.735 Y210.969 I-1.201 J-1.529 E.01154
G1 X136.891 Y218.126 E.30162
G1 X136.358 Y218.126 E.0159
G1 X129.377 Y211.145 E.29421
G3 X128.985 Y211.286 I-.901 J-1.891 E.01245
G1 X135.824 Y218.126 E.28826
G1 X135.29 Y218.126 E.0159
G1 X128.546 Y211.382 E.28425
G3 X128.053 Y211.422 I-.449 J-2.446 E.01477
G1 X134.757 Y218.126 E.28254
G1 X134.223 Y218.126 E.0159
G1 X127.484 Y211.386 E.28406
G3 X126.765 Y211.201 I.567 J-3.693 E.02215
G1 X133.69 Y218.126 E.29186
G1 X133.156 Y218.126 E.0159
G1 X112.655 Y197.624 E.86408
G1 X113.189 Y197.624 E.0159
G1 X124.669 Y209.105 E.48387
G3 X124.486 Y208.389 I2.238 J-.951 E.0221
G1 X113.722 Y197.624 E.45369
G1 X114.256 Y197.624 E.0159
G1 X124.453 Y207.821 E.42978
G3 X124.492 Y207.327 I4.889 J.137 E.01479
G1 X114.789 Y197.624 E.40894
G1 X115.323 Y197.624 E.0159
G1 X124.591 Y206.892 E.39063
G3 X124.731 Y206.499 I2.036 J.501 E.01247
G1 X115.856 Y197.624 E.37403
G1 X116.39 Y197.624 E.0159
G1 X124.906 Y206.14 E.35892
G3 X125.112 Y205.813 I1.734 J.868 E.01154
G1 X116.924 Y197.624 E.34514
G1 X117.457 Y197.624 E.0159
G1 X125.349 Y205.516 E.33262
G3 X125.614 Y205.247 I1.476 J1.191 E.01126
G1 X117.991 Y197.624 E.32129
G1 X118.524 Y197.624 E.0159
G1 X125.907 Y205.007 E.31116
G3 X126.23 Y204.796 I6.728 J9.953 E.01149
G1 X119.058 Y197.624 E.30228
G1 X119.591 Y197.624 E.0159
G1 X126.586 Y204.619 E.29482
G3 X126.978 Y204.478 I.905 J1.89 E.01244
G1 X120.125 Y197.624 E.28885
G1 X120.659 Y197.624 E.0159
G1 X127.415 Y204.381 E.28476
G3 X127.893 Y204.326 I.601 J3.122 E.01437
G1 X121.192 Y197.624 E.28245
G1 X121.726 Y197.624 E.0159
G1 X128.459 Y204.357 E.28378
G3 X129.156 Y204.521 I-.463 J3.535 E.02139
G1 X122.09 Y197.455 E.29784
; WIPE_START
G1 X123.504 Y198.869 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.796 Y205.755 Z1 F30000
G1 X132.792 Y218.295 Z1
G1 Z.6
G1 E.8 F1800
G1 F9541.731
G1 X112.122 Y197.624 E.87123
G1 X111.588 Y197.624 E.0159
G1 X132.089 Y218.126 E.86408
G1 X131.555 Y218.126 E.0159
G1 X111.054 Y197.624 E.86408
G1 X110.521 Y197.624 E.0159
G1 X131.022 Y218.126 E.86408
G1 X130.488 Y218.126 E.0159
G1 X109.987 Y197.624 E.86408
G1 X109.454 Y197.624 E.0159
G1 X129.955 Y218.126 E.86408
G1 X129.421 Y218.126 E.0159
G1 X108.92 Y197.624 E.86408
G1 X108.387 Y197.624 E.0159
G1 X128.888 Y218.126 E.86408
G1 X128.354 Y218.126 E.0159
G1 X107.853 Y197.624 E.86408
G1 X107.319 Y197.624 E.0159
G1 X127.82 Y218.126 E.86408
G1 X127.287 Y218.126 E.0159
G1 X106.786 Y197.624 E.86408
G1 X106.252 Y197.624 E.0159
G1 X126.753 Y218.126 E.86408
G1 X126.22 Y218.126 E.0159
G1 X105.719 Y197.624 E.86408
G1 X105.185 Y197.624 E.0159
G1 X125.686 Y218.126 E.86408
G1 X125.153 Y218.126 E.0159
G1 X104.652 Y197.624 E.86408
G1 X104.118 Y197.624 E.0159
G1 X124.619 Y218.126 E.86408
G1 X124.085 Y218.126 E.0159
G1 X103.584 Y197.624 E.86408
G1 X103.051 Y197.624 E.0159
G1 X123.552 Y218.126 E.86408
G1 X123.018 Y218.126 E.0159
G1 X102.517 Y197.624 E.86408
G1 X101.984 Y197.624 E.0159
G1 X122.485 Y218.126 E.86408
G1 X121.951 Y218.126 E.0159
G1 X101.45 Y197.624 E.86408
G1 X100.917 Y197.624 E.0159
G1 X121.418 Y218.126 E.86408
G1 X120.884 Y218.126 E.0159
G1 X100.383 Y197.624 E.86408
G1 X99.849 Y197.624 E.0159
G1 X120.351 Y218.126 E.86408
G1 X119.817 Y218.126 E.0159
G1 X99.316 Y197.624 E.86408
G1 X98.782 Y197.624 E.0159
G1 X119.283 Y218.126 E.86408
G1 X118.75 Y218.126 E.0159
G1 X98.249 Y197.624 E.86408
G1 X97.715 Y197.624 E.0159
G1 X118.216 Y218.126 E.86408
G1 X117.683 Y218.126 E.0159
G1 X97.182 Y197.624 E.86408
G1 X96.648 Y197.624 E.0159
G1 X117.149 Y218.126 E.86408
G1 X116.616 Y218.126 E.0159
G1 X96.114 Y197.624 E.86408
G1 X95.581 Y197.624 E.0159
G1 X116.082 Y218.126 E.86408
G1 X115.548 Y218.126 E.0159
G1 X95.047 Y197.624 E.86408
G1 X94.514 Y197.624 E.0159
G1 X115.015 Y218.126 E.86408
G1 X114.481 Y218.126 E.0159
G1 X93.98 Y197.624 E.86408
G1 X93.447 Y197.624 E.0159
G1 X113.948 Y218.126 E.86408
G1 X113.414 Y218.126 E.0159
G1 X92.913 Y197.624 E.86408
G1 X92.379 Y197.624 E.0159
G1 X112.881 Y218.126 E.86408
G1 X112.347 Y218.126 E.0159
G1 X91.846 Y197.624 E.86408
G1 X91.312 Y197.624 E.0159
G1 X111.813 Y218.126 E.86408
G1 X111.28 Y218.126 E.0159
G1 X90.779 Y197.624 E.86408
G1 X90.245 Y197.624 E.0159
G1 X110.746 Y218.126 E.86408
G1 X110.213 Y218.126 E.0159
G1 X89.712 Y197.624 E.86408
G1 X89.178 Y197.624 E.0159
G1 X109.679 Y218.126 E.86408
G1 X109.146 Y218.126 E.0159
G1 X88.644 Y197.624 E.86408
G1 X88.111 Y197.624 E.0159
G1 X108.612 Y218.126 E.86408
G1 X108.078 Y218.126 E.0159
G1 X87.577 Y197.624 E.86408
G1 X87.044 Y197.624 E.0159
G1 X107.545 Y218.126 E.86408
G1 X107.011 Y218.126 E.0159
G1 X86.51 Y197.624 E.86408
G1 X85.977 Y197.624 E.0159
G1 X106.478 Y218.126 E.86408
G1 X105.944 Y218.126 E.0159
G1 X85.443 Y197.624 E.86408
G1 X84.91 Y197.624 E.0159
G1 X105.411 Y218.126 E.86408
G1 X104.877 Y218.126 E.0159
G1 X84.376 Y197.624 E.86408
G1 X83.842 Y197.624 E.0159
G1 X104.343 Y218.126 E.86408
G1 X103.81 Y218.126 E.0159
G1 X83.309 Y197.624 E.86408
G1 X82.775 Y197.624 E.0159
G1 X103.276 Y218.126 E.86408
G1 X102.743 Y218.126 E.0159
G1 X82.242 Y197.624 E.86408
G1 X81.708 Y197.624 E.0159
G1 X102.209 Y218.126 E.86408
G1 X101.676 Y218.126 E.0159
G1 X81.175 Y197.624 E.86408
G1 X80.641 Y197.624 E.0159
G1 X101.142 Y218.126 E.86408
G1 X100.608 Y218.126 E.0159
G1 X80.107 Y197.624 E.86408
G1 X79.574 Y197.624 E.0159
G1 X100.075 Y218.126 E.86408
G1 X99.541 Y218.126 E.0159
G1 X79.04 Y197.624 E.86408
G1 X78.507 Y197.624 E.0159
G1 X99.008 Y218.126 E.86408
G1 X98.474 Y218.126 E.0159
G1 X77.973 Y197.624 E.86408
G1 X77.44 Y197.624 E.0159
G1 X97.941 Y218.126 E.86408
G1 X97.407 Y218.126 E.0159
G1 X76.906 Y197.624 E.86408
G1 X76.372 Y197.624 E.0159
G1 X96.873 Y218.126 E.86408
G1 X96.34 Y218.126 E.0159
G1 X75.839 Y197.624 E.86408
G1 X75.305 Y197.624 E.0159
G1 X95.806 Y218.126 E.86408
G1 X95.273 Y218.126 E.0159
G1 X74.772 Y197.624 E.86408
G1 X74.238 Y197.624 E.0159
G1 X94.739 Y218.126 E.86408
G1 X94.206 Y218.126 E.0159
G1 X73.705 Y197.624 E.86408
G1 X73.171 Y197.624 E.0159
G1 X93.672 Y218.126 E.86408
G1 X93.139 Y218.126 E.0159
G1 X72.637 Y197.624 E.86408
G1 X72.104 Y197.624 E.0159
G1 X92.605 Y218.126 E.86408
G1 X92.071 Y218.126 E.0159
G1 X71.57 Y197.624 E.86408
G1 X71.037 Y197.624 E.0159
G1 X91.538 Y218.126 E.86408
G1 X91.004 Y218.126 E.0159
G1 X70.503 Y197.624 E.86408
G1 X69.97 Y197.624 E.0159
G1 X90.471 Y218.126 E.86408
G1 X89.937 Y218.126 E.0159
G1 X69.436 Y197.624 E.86408
G1 X68.902 Y197.624 E.0159
G1 X89.404 Y218.126 E.86408
G1 X88.87 Y218.126 E.0159
G1 X68.369 Y197.624 E.86408
G1 X67.835 Y197.624 E.0159
G1 X88.336 Y218.126 E.86408
G1 X87.803 Y218.126 E.0159
G1 X67.302 Y197.624 E.86408
G1 X66.768 Y197.624 E.0159
G1 X87.269 Y218.126 E.86408
G1 X86.736 Y218.126 E.0159
G1 X66.235 Y197.624 E.86408
G1 X65.701 Y197.624 E.0159
G1 X86.202 Y218.126 E.86408
G1 X85.669 Y218.126 E.0159
G1 X65.167 Y197.624 E.86408
G1 X64.634 Y197.624 E.0159
G1 X85.135 Y218.126 E.86408
G1 X84.601 Y218.126 E.0159
G1 X64.1 Y197.624 E.86408
G1 X63.567 Y197.624 E.0159
G1 X84.068 Y218.126 E.86408
G1 X83.534 Y218.126 E.0159
G1 X63.033 Y197.624 E.86408
G1 X62.5 Y197.624 E.0159
G1 X83.001 Y218.126 E.86408
G1 X82.467 Y218.126 E.0159
G1 X61.966 Y197.624 E.86408
G1 X61.432 Y197.624 E.0159
G1 X81.934 Y218.126 E.86408
G1 X81.4 Y218.126 E.0159
G1 X60.899 Y197.624 E.86408
G1 X60.365 Y197.624 E.0159
G1 X80.866 Y218.126 E.86408
G1 X80.333 Y218.126 E.0159
G1 X59.832 Y197.624 E.86408
G1 X59.298 Y197.624 E.0159
G1 X79.799 Y218.126 E.86408
G1 X79.266 Y218.126 E.0159
G1 X58.765 Y197.624 E.86408
G1 X58.231 Y197.624 E.0159
G1 X78.732 Y218.126 E.86408
G1 X78.199 Y218.126 E.0159
G1 X57.697 Y197.624 E.86408
G1 X57.164 Y197.624 E.0159
G1 X77.665 Y218.126 E.86408
G1 X77.131 Y218.126 E.0159
G1 X56.63 Y197.624 E.86408
G1 X56.097 Y197.624 E.0159
G1 X76.598 Y218.126 E.86408
G1 X76.064 Y218.126 E.0159
G1 X55.563 Y197.624 E.86408
G1 X55.03 Y197.624 E.0159
G1 X75.531 Y218.126 E.86408
G1 X74.997 Y218.126 E.0159
G1 X54.496 Y197.624 E.86408
G1 X53.963 Y197.624 E.0159
G1 X74.464 Y218.126 E.86408
G1 X73.93 Y218.126 E.0159
G1 X53.429 Y197.624 E.86408
G1 X52.895 Y197.624 E.0159
G1 X73.396 Y218.126 E.86408
G1 X72.863 Y218.126 E.0159
G1 X52.362 Y197.624 E.86408
G1 X51.828 Y197.624 E.0159
G1 X72.329 Y218.126 E.86408
G1 X71.796 Y218.126 E.0159
G1 X51.295 Y197.624 E.86408
G1 X50.761 Y197.624 E.0159
G1 X71.262 Y218.126 E.86408
G1 X70.729 Y218.126 E.0159
G1 X29.749 Y177.146 E1.72719
G1 X29.749 Y176.613 E.0159
G1 X50.251 Y197.114 E.86408
G1 X50.251 Y196.58 E.0159
G1 X29.749 Y176.079 E.86408
G1 X29.749 Y175.546 E.0159
G1 X50.251 Y196.047 E.86408
G1 X50.251 Y195.513 E.0159
G1 X29.749 Y175.012 E.86408
G1 X29.749 Y174.479 E.0159
G1 X50.251 Y194.98 E.86408
G1 X50.251 Y194.446 E.0159
G1 X29.749 Y173.945 E.86408
G1 X29.749 Y173.411 E.0159
G1 X50.251 Y193.912 E.86408
G1 X50.251 Y193.379 E.0159
G1 X29.749 Y172.878 E.86408
G1 X29.749 Y172.344 E.0159
G1 X50.251 Y192.845 E.86408
G1 X50.251 Y192.312 E.0159
G1 X29.749 Y171.811 E.86408
G1 X29.749 Y171.277 E.0159
G1 X50.251 Y191.778 E.86408
G1 X50.251 Y191.245 E.0159
G1 X29.749 Y170.744 E.86408
G1 X29.749 Y170.21 E.0159
G1 X50.251 Y190.711 E.86408
G1 X50.251 Y190.177 E.0159
G1 X29.749 Y169.676 E.86408
G1 X29.749 Y169.143 E.0159
G1 X50.251 Y189.644 E.86408
G1 X50.251 Y189.11 E.0159
G1 X29.749 Y168.609 E.86408
G1 X29.749 Y168.076 E.0159
G1 X50.251 Y188.577 E.86408
G1 X50.251 Y188.043 E.0159
G1 X29.749 Y167.542 E.86408
G1 X29.749 Y167.009 E.0159
G1 X50.251 Y187.51 E.86408
G1 X50.251 Y186.976 E.0159
G1 X29.749 Y166.475 E.86408
M73 P36 R49
G1 X29.749 Y165.941 E.0159
G1 X50.251 Y186.443 E.86408
G1 X50.251 Y185.909 E.0159
G1 X29.749 Y165.408 E.86408
G1 X29.749 Y164.874 E.0159
G1 X50.251 Y185.375 E.86408
G1 X50.251 Y184.842 E.0159
G1 X29.749 Y164.341 E.86408
G1 X29.749 Y163.807 E.0159
G1 X50.251 Y184.308 E.86408
G1 X50.251 Y183.775 E.0159
G1 X29.749 Y163.274 E.86408
G1 X29.749 Y162.74 E.0159
G1 X50.251 Y183.241 E.86408
G1 X50.251 Y182.708 E.0159
G1 X29.749 Y162.206 E.86408
G1 X29.749 Y161.673 E.0159
G1 X50.251 Y182.174 E.86408
G1 X50.251 Y181.64 E.0159
G1 X29.749 Y161.139 E.86408
G1 X29.749 Y160.606 E.0159
G1 X50.251 Y181.107 E.86408
G1 X50.251 Y180.573 E.0159
G1 X29.749 Y160.072 E.86408
G1 X29.749 Y159.539 E.0159
G1 X50.251 Y180.04 E.86408
M73 P36 R48
G1 X50.251 Y179.506 E.0159
G1 X29.749 Y159.005 E.86408
G1 X29.749 Y158.471 E.0159
G1 X50.251 Y178.973 E.86408
G1 X50.251 Y178.439 E.0159
G1 X29.749 Y157.938 E.86408
G1 X29.749 Y157.404 E.0159
G1 X50.251 Y177.905 E.86408
G1 X50.251 Y177.372 E.0159
G1 X29.749 Y156.871 E.86408
G1 X29.749 Y156.337 E.0159
G1 X50.251 Y176.838 E.86408
G1 X50.251 Y176.305 E.0159
G1 X29.749 Y155.804 E.86408
G1 X29.749 Y155.27 E.0159
G1 X50.251 Y175.771 E.86408
G1 X50.251 Y175.238 E.0159
G1 X29.749 Y154.736 E.86408
G1 X29.749 Y154.203 E.0159
G1 X50.251 Y174.704 E.86408
G1 X50.251 Y174.17 E.0159
G1 X29.749 Y153.669 E.86408
G1 X29.749 Y153.136 E.0159
G1 X50.251 Y173.637 E.86408
G1 X50.251 Y173.103 E.0159
G1 X29.749 Y152.602 E.86408
G1 X29.749 Y152.069 E.0159
G1 X50.251 Y172.57 E.86408
G1 X50.251 Y172.036 E.0159
G1 X29.749 Y151.535 E.86408
G1 X29.749 Y151.002 E.0159
G1 X50.251 Y171.503 E.86408
G1 X50.251 Y170.969 E.0159
G1 X29.749 Y150.468 E.86408
G1 X29.749 Y149.934 E.0159
G1 X50.251 Y170.435 E.86408
G1 X50.251 Y169.902 E.0159
G1 X29.749 Y149.401 E.86408
G1 X29.749 Y148.867 E.0159
G1 X50.251 Y169.368 E.86408
G1 X50.251 Y168.835 E.0159
G1 X29.749 Y148.334 E.86408
G1 X29.749 Y147.8 E.0159
G1 X50.251 Y168.301 E.86408
G1 X50.251 Y167.768 E.0159
G1 X29.749 Y147.267 E.86408
G1 X29.749 Y146.733 E.0159
G1 X50.251 Y167.234 E.86408
G1 X50.251 Y166.7 E.0159
G1 X29.749 Y146.199 E.86408
G1 X29.749 Y145.666 E.0159
G1 X50.251 Y166.167 E.86408
G1 X50.251 Y165.633 E.0159
G1 X29.749 Y145.132 E.86408
G1 X29.749 Y144.599 E.0159
G1 X50.251 Y165.1 E.86408
G1 X50.251 Y164.566 E.0159
G1 X29.749 Y144.065 E.86408
G1 X29.749 Y143.532 E.0159
G1 X50.251 Y164.033 E.86408
G1 X50.251 Y163.499 E.0159
G1 X29.749 Y142.998 E.86408
G1 X29.749 Y142.464 E.0159
G1 X50.251 Y162.965 E.86408
G1 X50.251 Y162.432 E.0159
G1 X29.749 Y141.931 E.86408
G1 X29.749 Y141.397 E.0159
G1 X50.251 Y161.898 E.86408
G1 X50.251 Y161.365 E.0159
G1 X29.749 Y140.864 E.86408
G1 X29.749 Y140.33 E.0159
G1 X50.251 Y160.831 E.86408
G1 X50.251 Y160.298 E.0159
G1 X29.749 Y139.797 E.86408
G1 X29.749 Y139.263 E.0159
G1 X50.251 Y159.764 E.86408
G1 X50.251 Y159.231 E.0159
G1 X29.749 Y138.729 E.86408
G1 X29.749 Y138.196 E.0159
G1 X50.251 Y158.697 E.86408
G1 X50.251 Y158.163 E.0159
G1 X29.749 Y137.662 E.86408
G1 X29.749 Y137.129 E.0159
G1 X50.251 Y157.63 E.86408
G1 X50.251 Y157.096 E.0159
G1 X29.749 Y136.595 E.86408
G1 X29.749 Y136.062 E.0159
G1 X50.251 Y156.563 E.86408
G1 X50.251 Y156.029 E.0159
G1 X29.749 Y135.528 E.86408
G1 X29.749 Y134.994 E.0159
G1 X50.251 Y155.496 E.86408
G1 X50.251 Y154.962 E.0159
G1 X29.749 Y134.461 E.86408
G1 X29.749 Y133.927 E.0159
G1 X50.251 Y154.428 E.86408
G1 X50.251 Y153.895 E.0159
G1 X29.749 Y133.394 E.86408
G1 X29.749 Y132.86 E.0159
G1 X50.251 Y153.361 E.86408
G1 X50.251 Y152.828 E.0159
G1 X29.749 Y132.327 E.86408
G1 X29.749 Y131.793 E.0159
G1 X50.251 Y152.294 E.86408
G1 X50.251 Y151.761 E.0159
G1 X29.749 Y131.259 E.86408
G1 X29.749 Y130.726 E.0159
G1 X50.251 Y151.227 E.86408
G1 X50.251 Y150.693 E.0159
G1 X29.749 Y130.192 E.86408
G1 X29.749 Y129.659 E.0159
G1 X50.251 Y150.16 E.86408
G1 X50.251 Y149.626 E.0159
G1 X29.749 Y129.125 E.86408
G1 X29.749 Y128.592 E.0159
G1 X50.251 Y149.093 E.86408
G1 X50.251 Y148.559 E.0159
G1 X29.749 Y128.058 E.86408
G1 X29.749 Y127.524 E.0159
G1 X50.251 Y148.026 E.86408
G1 X50.251 Y147.492 E.0159
G1 X29.749 Y126.991 E.86408
G1 X29.749 Y126.457 E.0159
G1 X50.251 Y146.958 E.86408
G1 X50.251 Y146.425 E.0159
G1 X29.749 Y125.924 E.86408
G1 X29.749 Y125.39 E.0159
G1 X50.251 Y145.891 E.86408
G1 X50.251 Y145.358 E.0159
G1 X29.749 Y124.857 E.86408
G1 X29.749 Y124.323 E.0159
G1 X50.251 Y144.824 E.86408
G1 X50.251 Y144.291 E.0159
G1 X29.749 Y123.79 E.86408
G1 X29.749 Y123.256 E.0159
G1 X50.251 Y143.757 E.86408
G1 X50.251 Y143.223 E.0159
G1 X29.749 Y122.722 E.86408
G1 X29.749 Y122.189 E.0159
G1 X50.251 Y142.69 E.86408
G1 X50.251 Y142.156 E.0159
G1 X29.749 Y121.655 E.86408
G1 X29.749 Y121.122 E.0159
G1 X50.42 Y141.792 E.87123
; WIPE_START
G1 X49.006 Y140.378 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X44.815 Y134 Z1 F30000
G1 X29.58 Y110.814 Z1
G1 Z.6
G1 E.8 F1800
G1 F9541.731
G1 X41.593 Y122.827 E.50632
G2 X40.769 Y122.537 I-1.643 J3.354 E.02608
G1 X29.749 Y111.517 E.46446
G1 X29.749 Y112.051 E.0159
G1 X40.154 Y122.455 E.43853
G2 X39.637 Y122.472 I-.154 J3.276 E.01543
G1 X29.749 Y112.585 E.41674
G1 X29.749 Y113.118 E.0159
G1 X39.178 Y122.546 E.39738
G2 X38.77 Y122.672 I.425 J2.103 E.01274
G1 X29.749 Y113.652 E.38019
G1 X29.749 Y114.185 E.0159
G1 X38.399 Y122.835 E.36455
G2 X38.06 Y123.03 I.807 J1.789 E.01166
G1 X29.749 Y114.719 E.35029
G1 X29.749 Y115.252 E.0159
G1 X37.752 Y123.255 E.33731
G2 X37.473 Y123.51 I1.131 J1.523 E.01128
G1 X29.749 Y115.786 E.32553
G1 X29.749 Y116.32 E.0159
G1 X37.222 Y123.792 E.31495
G2 X37 Y124.103 I1.444 J1.266 E.01142
G1 X29.749 Y116.853 E.30559
G1 X29.749 Y117.387 E.0159
G1 X36.808 Y124.445 E.29749
G2 X36.651 Y124.822 I7.171 J3.199 E.01217
G1 X29.749 Y117.92 E.29089
G1 X29.749 Y118.454 E.0159
G1 X36.535 Y125.239 E.28599
G2 X36.465 Y125.703 I2.284 J.582 E.014
G1 X29.749 Y118.987 E.28304
G1 X29.749 Y119.521 E.0159
G1 X36.458 Y126.23 E.28275
G2 X36.555 Y126.86 I3.197 J-.168 E.01904
G1 X29.749 Y120.055 E.28684
G1 X29.749 Y120.588 E.0159
G1 X50.251 Y141.089 E.86408
G1 X50.251 Y140.556 E.0159
G1 X39.137 Y129.442 E.46841
G2 X39.768 Y129.54 I.897 J-3.71 E.01906
G1 X50.251 Y140.022 E.44181
G1 X50.251 Y139.488 E.0159
G1 X40.299 Y129.537 E.41942
G2 X40.76 Y129.465 I-.132 J-2.339 E.01393
G1 X50.251 Y138.955 E.39999
G1 X50.251 Y138.421 E.0159
G1 X41.176 Y129.347 E.38247
G2 X41.553 Y129.191 I-.592 J-1.962 E.01219
G1 X50.251 Y137.888 E.36657
G1 X50.251 Y137.354 E.0159
G1 X41.897 Y129.001 E.35208
G2 X42.21 Y128.78 I-.942 J-1.667 E.01143
G1 X50.251 Y136.821 E.3389
G1 X50.251 Y136.287 E.0159
G1 X42.492 Y128.529 E.32699
G2 X42.746 Y128.249 I-1.271 J-1.408 E.01128
G1 X50.251 Y135.753 E.31629
G1 X50.251 Y135.22 E.0159
G1 X42.971 Y127.941 E.30681
G2 X43.166 Y127.602 I-1.596 J-1.141 E.01167
G1 X50.251 Y134.686 E.29861
G1 X50.251 Y134.153 E.0159
G1 X43.327 Y127.23 E.2918
G2 X43.452 Y126.82 I-1.982 J-.825 E.01277
G1 X50.251 Y133.619 E.28656
G1 X50.251 Y133.086 E.0159
G1 X43.532 Y126.367 E.28318
G2 X43.544 Y125.845 I-4.843 J-.372 E.01556
G1 X50.251 Y132.552 E.28267
G1 X50.251 Y132.019 E.0159
G1 X43.465 Y125.233 E.28599
G2 X43.168 Y124.402 I-3.611 J.824 E.02638
G1 X50.251 Y131.485 E.29853
G1 X50.251 Y130.951 E.0159
G1 X29.749 Y110.45 E.86408
G1 X29.749 Y109.917 E.0159
G1 X50.251 Y130.418 E.86408
G1 X50.251 Y129.884 E.0159
G1 X29.749 Y109.383 E.86408
G1 X29.749 Y108.85 E.0159
G1 X50.251 Y129.351 E.86408
G1 X50.251 Y128.817 E.0159
G1 X29.749 Y108.316 E.86408
G1 X29.749 Y107.782 E.0159
G1 X50.251 Y128.284 E.86408
G1 X50.251 Y127.75 E.0159
G1 X29.749 Y107.249 E.86408
G1 X29.749 Y106.715 E.0159
G1 X50.251 Y127.216 E.86408
G1 X50.251 Y126.683 E.0159
G1 X29.749 Y106.182 E.86408
G1 X29.749 Y105.648 E.0159
G1 X50.251 Y126.149 E.86408
G1 X50.251 Y125.616 E.0159
G1 X29.749 Y105.115 E.86408
G1 X29.749 Y104.581 E.0159
G1 X50.251 Y125.082 E.86408
G1 X50.251 Y124.549 E.0159
G1 X29.749 Y104.047 E.86408
G1 X29.749 Y103.514 E.0159
G1 X50.251 Y124.015 E.86408
G1 X50.251 Y123.481 E.0159
G1 X29.749 Y102.98 E.86408
G1 X29.749 Y102.447 E.0159
G1 X50.251 Y122.948 E.86408
G1 X50.251 Y122.414 E.0159
G1 X29.749 Y101.913 E.86408
G1 X29.749 Y101.38 E.0159
G1 X50.251 Y121.881 E.86408
G1 X50.251 Y121.347 E.0159
G1 X29.749 Y100.846 E.86408
G1 X29.749 Y100.312 E.0159
G1 X50.251 Y120.814 E.86408
G1 X50.251 Y120.28 E.0159
G1 X29.749 Y99.779 E.86408
G1 X29.749 Y99.245 E.0159
G1 X50.251 Y119.746 E.86408
G1 X50.251 Y119.213 E.0159
G1 X29.749 Y98.712 E.86408
G1 X29.749 Y98.178 E.0159
G1 X50.251 Y118.679 E.86408
G1 X50.251 Y118.146 E.0159
G1 X29.749 Y97.645 E.86408
G1 X29.749 Y97.111 E.0159
G1 X50.251 Y117.612 E.86408
G1 X50.251 Y117.079 E.0159
G1 X29.749 Y96.578 E.86408
G1 X29.749 Y96.044 E.0159
G1 X50.251 Y116.545 E.86408
G1 X50.251 Y116.011 E.0159
G1 X29.749 Y95.51 E.86408
G1 X29.749 Y94.977 E.0159
G1 X50.251 Y115.478 E.86408
G1 X50.251 Y114.944 E.0159
G1 X29.749 Y94.443 E.86408
G1 X29.749 Y93.91 E.0159
G1 X50.251 Y114.411 E.86408
G1 X50.251 Y113.877 E.0159
G1 X29.749 Y93.376 E.86408
G1 X29.749 Y92.843 E.0159
G1 X50.251 Y113.344 E.86408
G1 X50.251 Y112.81 E.0159
G1 X29.749 Y92.309 E.86408
G1 X29.749 Y91.775 E.0159
G1 X50.251 Y112.276 E.86408
G1 X50.251 Y111.743 E.0159
G1 X29.749 Y91.242 E.86408
G1 X29.749 Y90.708 E.0159
G1 X50.251 Y111.209 E.86408
G1 X50.251 Y110.676 E.0159
G1 X29.749 Y90.175 E.86408
G1 X29.749 Y89.641 E.0159
G1 X50.251 Y110.142 E.86408
G1 X50.251 Y109.609 E.0159
G1 X29.749 Y89.108 E.86408
G1 X29.749 Y88.574 E.0159
G1 X50.251 Y109.075 E.86408
G1 X50.251 Y108.541 E.0159
G1 X29.749 Y88.04 E.86408
G1 X29.749 Y87.507 E.0159
G1 X50.251 Y108.008 E.86408
G1 X50.251 Y107.474 E.0159
G1 X29.749 Y86.973 E.86408
G1 X29.749 Y86.44 E.0159
G1 X50.251 Y106.941 E.86408
G1 X50.251 Y106.407 E.0159
G1 X29.749 Y85.906 E.86408
G1 X29.749 Y85.373 E.0159
G1 X50.251 Y105.874 E.86408
G1 X50.251 Y105.34 E.0159
G1 X29.749 Y84.839 E.86408
G1 X29.749 Y84.305 E.0159
G1 X50.251 Y104.807 E.86408
G1 X50.251 Y104.273 E.0159
G1 X29.749 Y83.772 E.86408
G1 X29.749 Y83.238 E.0159
G1 X50.251 Y103.739 E.86408
G1 X50.251 Y103.206 E.0159
G1 X29.749 Y82.705 E.86408
G1 X29.749 Y82.171 E.0159
G1 X50.251 Y102.672 E.86408
G1 X50.251 Y102.139 E.0159
G1 X29.749 Y81.638 E.86408
G1 X29.749 Y81.104 E.0159
G1 X50.251 Y101.605 E.86408
G1 X50.251 Y101.072 E.0159
G1 X29.749 Y80.57 E.86408
G1 X29.749 Y80.037 E.0159
G1 X50.251 Y100.538 E.86408
G1 X50.251 Y100.004 E.0159
G1 X29.749 Y79.503 E.86408
G1 X29.749 Y78.97 E.0159
G1 X50.251 Y99.471 E.86408
G1 X50.251 Y98.937 E.0159
G1 X29.749 Y78.436 E.86408
G1 X29.749 Y77.903 E.0159
G1 X50.251 Y98.404 E.86408
G1 X50.251 Y97.87 E.0159
G1 X29.749 Y77.369 E.86408
G1 X29.749 Y76.835 E.0159
G1 X50.251 Y97.337 E.86408
G1 X50.251 Y96.803 E.0159
G1 X29.749 Y76.302 E.86408
G1 X29.749 Y75.768 E.0159
G1 X50.251 Y96.269 E.86408
G1 X50.251 Y95.736 E.0159
G1 X29.749 Y75.235 E.86408
G1 X29.749 Y74.701 E.0159
G1 X50.251 Y95.202 E.86408
G1 X50.251 Y94.669 E.0159
G1 X29.749 Y74.168 E.86408
G1 X29.749 Y73.634 E.0159
G1 X50.251 Y94.135 E.86408
G1 X50.251 Y93.602 E.0159
G1 X29.749 Y73.1 E.86408
G1 X29.749 Y72.567 E.0159
G1 X50.251 Y93.068 E.86408
G1 X50.251 Y92.534 E.0159
G1 X29.749 Y72.033 E.86408
G1 X29.749 Y71.5 E.0159
G1 X50.251 Y92.001 E.86408
G1 X50.251 Y91.467 E.0159
G1 X29.749 Y70.966 E.86408
G1 X29.749 Y70.433 E.0159
G1 X50.251 Y90.934 E.86408
G1 X50.251 Y90.4 E.0159
G1 X29.749 Y69.899 E.86408
G1 X29.749 Y69.366 E.0159
G1 X50.251 Y89.867 E.86408
G1 X50.251 Y89.333 E.0159
G1 X29.749 Y68.832 E.86408
G1 X29.749 Y68.298 E.0159
G1 X50.251 Y88.799 E.86408
G1 X50.251 Y88.266 E.0159
G1 X29.749 Y67.765 E.86408
G1 X29.749 Y67.231 E.0159
G1 X50.251 Y87.732 E.86408
G1 X50.251 Y87.199 E.0159
G1 X29.749 Y66.698 E.86408
G1 X29.749 Y66.164 E.0159
G1 X50.251 Y86.665 E.86408
G1 X50.251 Y86.132 E.0159
G1 X29.749 Y65.631 E.86408
G1 X29.749 Y65.097 E.0159
G1 X50.251 Y85.598 E.86408
G1 X50.251 Y85.064 E.0159
G1 X29.749 Y64.563 E.86408
G1 X29.749 Y64.03 E.0159
G1 X50.251 Y84.531 E.86408
G1 X50.251 Y83.997 E.0159
G1 X29.749 Y63.496 E.86408
G1 X29.749 Y62.963 E.0159
G1 X50.251 Y83.464 E.86408
G1 X50.251 Y82.93 E.0159
G1 X29.749 Y62.429 E.86408
G1 X29.749 Y61.896 E.0159
G1 X50.251 Y82.397 E.86408
G1 X50.251 Y81.863 E.0159
G1 X29.749 Y61.362 E.86408
G1 X29.749 Y60.828 E.0159
G1 X50.251 Y81.329 E.86408
G1 X50.251 Y80.796 E.0159
G1 X29.749 Y60.295 E.86408
G1 X29.749 Y59.761 E.0159
G1 X50.251 Y80.262 E.86408
G1 X50.251 Y79.729 E.0159
G1 X29.749 Y59.228 E.86408
G1 X29.749 Y58.694 E.0159
G1 X50.251 Y79.195 E.86408
G1 X50.251 Y78.662 E.0159
G1 X29.749 Y58.161 E.86408
G1 X29.749 Y57.627 E.0159
G1 X50.251 Y78.128 E.86408
G1 X50.251 Y77.595 E.0159
G1 X29.749 Y57.093 E.86408
G1 X29.749 Y56.56 E.0159
G1 X50.251 Y77.061 E.86408
G1 X50.251 Y76.527 E.0159
G1 X29.749 Y56.026 E.86408
G1 X29.749 Y55.493 E.0159
G1 X50.251 Y75.994 E.86408
G1 X50.251 Y75.46 E.0159
G1 X29.749 Y54.959 E.86408
G1 X29.749 Y54.426 E.0159
G1 X50.251 Y74.927 E.86408
G1 X50.251 Y74.393 E.0159
G1 X29.749 Y53.892 E.86408
G1 X29.749 Y53.358 E.0159
G1 X50.251 Y73.86 E.86408
G1 X50.251 Y73.326 E.0159
G1 X29.749 Y52.825 E.86408
G1 X29.749 Y52.291 E.0159
G1 X50.251 Y72.792 E.86408
G1 X50.251 Y72.259 E.0159
G1 X29.749 Y51.758 E.86408
G1 X29.749 Y51.224 E.0159
G1 X50.251 Y71.725 E.86408
G1 X50.251 Y71.192 E.0159
G1 X29.749 Y50.691 E.86408
G1 X29.749 Y50.157 E.0159
G1 X50.251 Y70.658 E.86408
G1 X50.251 Y70.125 E.0159
G1 X29.749 Y49.623 E.86408
M73 P37 R48
G1 X29.749 Y49.09 E.0159
G1 X50.251 Y69.591 E.86408
G1 X50.251 Y69.057 E.0159
G1 X29.749 Y48.556 E.86408
G1 X29.749 Y48.023 E.0159
G1 X50.251 Y68.524 E.86408
G1 X50.251 Y67.99 E.0159
G1 X29.749 Y47.489 E.86408
G1 X29.749 Y46.956 E.0159
G1 X50.251 Y67.457 E.86408
G1 X50.251 Y66.923 E.0159
G1 X29.749 Y46.422 E.86408
G1 X29.749 Y45.888 E.0159
G1 X50.251 Y66.39 E.86408
G1 X50.251 Y65.856 E.0159
G1 X29.749 Y45.355 E.86408
G1 X29.749 Y44.821 E.0159
G1 X50.251 Y65.322 E.86408
G1 X50.251 Y64.789 E.0159
G1 X29.749 Y44.288 E.86408
G1 X29.749 Y43.754 E.0159
G1 X50.251 Y64.255 E.86408
G1 X50.251 Y63.722 E.0159
G1 X29.749 Y43.221 E.86408
G1 X29.749 Y42.687 E.0159
G1 X50.251 Y63.188 E.86408
G1 X50.251 Y62.655 E.0159
G1 X29.749 Y42.154 E.86408
G1 X29.749 Y41.62 E.0159
G1 X50.251 Y62.121 E.86408
G1 X50.251 Y61.587 E.0159
G1 X29.749 Y41.086 E.86408
G1 X29.749 Y40.553 E.0159
G1 X50.251 Y61.054 E.86408
G1 X50.251 Y60.52 E.0159
G1 X29.749 Y40.019 E.86408
G1 X29.749 Y39.486 E.0159
G1 X50.42 Y60.156 E.87123
; WIPE_START
G1 X49.006 Y58.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X45.103 Y52.183 Z1 F30000
G1 X34.106 Y33.705 Z1
G1 Z.6
G1 E.8 F1800
G1 F9541.731
G1 X41.181 Y40.78 E.2982
G2 X40.478 Y40.61 I-1.195 J3.405 E.02161
G1 X33.742 Y33.874 E.28389
G1 X33.209 Y33.874 E.0159
G1 X39.909 Y40.575 E.2824
G2 X39.429 Y40.629 I.114 J3.179 E.0144
G1 X32.675 Y33.874 E.28467
G1 X32.142 Y33.874 E.0159
G1 X38.991 Y40.724 E.28869
G2 X38.598 Y40.864 I.506 J2.035 E.01246
G1 X31.608 Y33.874 E.29462
G1 X31.075 Y33.874 E.0159
G1 X38.241 Y41.041 E.30204
G2 X37.916 Y41.25 I6.124 J9.866 E.01151
G1 X30.541 Y33.874 E.31085
G1 X30.007 Y33.874 E.0159
G1 X37.622 Y41.489 E.32094
G2 X37.356 Y41.757 I1.204 J1.461 E.01126
G1 X29.749 Y34.15 E.32062
G1 X29.749 Y34.684 E.0159
G1 X37.119 Y42.053 E.31062
G2 X36.912 Y42.379 I1.525 J1.201 E.01154
G1 X29.749 Y35.217 E.30187
G1 X29.749 Y35.751 E.0159
G1 X36.736 Y42.737 E.29445
G2 X36.595 Y43.13 I1.892 J.9 E.01246
G1 X29.749 Y36.284 E.28852
G1 X29.749 Y36.818 E.0159
G1 X36.495 Y43.563 E.2843
G2 X36.453 Y44.055 I4.586 J.638 E.01471
G1 X29.749 Y37.351 E.28253
G1 X29.749 Y37.885 E.0159
G1 X36.485 Y44.62 E.28387
G2 X36.659 Y45.328 I4.405 J-.709 E.02175
G1 X29.749 Y38.419 E.29122
G1 X29.749 Y38.952 E.0159
G1 X50.251 Y59.453 E.86408
G1 X50.251 Y58.92 E.0159
G1 X38.793 Y47.462 E.48292
G2 X39.504 Y47.639 I1.297 J-3.68 E.02188
G1 X50.251 Y58.386 E.45295
G1 X50.251 Y57.852 E.0159
G1 X40.07 Y47.672 E.4291
G2 X40.561 Y47.63 I.036 J-2.481 E.01473
G1 X50.251 Y57.319 E.40838
G1 X50.251 Y56.785 E.0159
G1 X40.997 Y47.532 E.39001
G2 X41.389 Y47.39 I-.513 J-2.025 E.01243
G1 X50.251 Y56.252 E.37351
G1 X50.251 Y55.718 E.0159
G1 X41.746 Y47.213 E.35847
G2 X42.071 Y47.005 I-.877 J-1.729 E.01153
G1 X50.251 Y55.185 E.34476
G1 X50.251 Y54.651 E.0159
G1 X42.367 Y46.767 E.33228
G2 X42.634 Y46.501 I-1.194 J-1.467 E.01126
G1 X50.509 Y54.376 E.33189
G1 X51.042 Y54.376 E.0159
G1 X42.873 Y46.207 E.3443
G2 X43.083 Y45.883 I-1.514 J-1.21 E.01152
G1 X51.576 Y54.376 E.35795
G1 X52.109 Y54.376 E.0159
G1 X43.262 Y45.528 E.37291
G2 X43.403 Y45.136 I-6.491 J-2.565 E.01242
G1 X52.643 Y54.376 E.38944
G1 X53.176 Y54.376 E.0159
G1 X43.501 Y44.7 E.40781
G2 X43.547 Y44.213 I-2.418 J-.477 E.0146
G1 X53.71 Y54.376 E.42834
G1 X54.244 Y54.376 E.0159
G1 X43.515 Y43.647 E.45218
G2 X43.345 Y42.943 I-3.56 J.489 E.02163
G1 X54.777 Y54.376 E.48185
G1 X55.311 Y54.376 E.0159
G1 X34.81 Y33.874 E.86408
G1 X35.343 Y33.874 E.0159
G1 X55.844 Y54.376 E.86408
G1 X56.378 Y54.376 E.0159
G1 X35.877 Y33.874 E.86408
G1 X36.41 Y33.874 E.0159
G1 X56.911 Y54.376 E.86408
G1 X57.445 Y54.376 E.0159
G1 X36.944 Y33.874 E.86408
G1 X37.477 Y33.874 E.0159
G1 X57.979 Y54.376 E.86408
G1 X58.512 Y54.376 E.0159
G1 X38.011 Y33.874 E.86408
G1 X38.545 Y33.874 E.0159
G1 X59.046 Y54.376 E.86408
G1 X59.579 Y54.376 E.0159
G1 X39.078 Y33.874 E.86408
G1 X39.612 Y33.874 E.0159
G1 X60.113 Y54.376 E.86408
G1 X60.646 Y54.376 E.0159
G1 X40.145 Y33.874 E.86408
G1 X40.679 Y33.874 E.0159
G1 X61.18 Y54.376 E.86408
G1 X61.714 Y54.376 E.0159
G1 X41.212 Y33.874 E.86408
G1 X41.746 Y33.874 E.0159
G1 X62.247 Y54.376 E.86408
G1 X62.781 Y54.376 E.0159
G1 X42.28 Y33.874 E.86408
G1 X42.813 Y33.874 E.0159
G1 X63.314 Y54.376 E.86408
G1 X63.848 Y54.376 E.0159
G1 X43.347 Y33.874 E.86408
G1 X43.88 Y33.874 E.0159
G1 X64.381 Y54.376 E.86408
G1 X64.915 Y54.376 E.0159
G1 X44.414 Y33.874 E.86408
G1 X44.947 Y33.874 E.0159
G1 X65.448 Y54.376 E.86408
G1 X65.982 Y54.376 E.0159
G1 X45.481 Y33.874 E.86408
G1 X46.015 Y33.874 E.0159
G1 X66.516 Y54.376 E.86408
G1 X67.049 Y54.376 E.0159
G1 X46.548 Y33.874 E.86408
G1 X47.082 Y33.874 E.0159
G1 X67.583 Y54.376 E.86408
G1 X68.116 Y54.376 E.0159
G1 X47.615 Y33.874 E.86408
G1 X48.149 Y33.874 E.0159
G1 X68.65 Y54.376 E.86408
G1 X69.183 Y54.376 E.0159
G1 X48.682 Y33.874 E.86408
G1 X49.216 Y33.874 E.0159
G1 X69.717 Y54.376 E.86408
G1 X70.251 Y54.376 E.0159
G1 X49.75 Y33.874 E.86408
G1 X50.283 Y33.874 E.0159
G1 X70.784 Y54.376 E.86408
G1 X71.318 Y54.376 E.0159
G1 X50.817 Y33.874 E.86408
G1 X51.35 Y33.874 E.0159
G1 X71.851 Y54.376 E.86408
G1 X72.385 Y54.376 E.0159
G1 X51.884 Y33.874 E.86408
G1 X52.417 Y33.874 E.0159
G1 X72.918 Y54.376 E.86408
G1 X73.452 Y54.376 E.0159
G1 X52.951 Y33.874 E.86408
G1 X53.485 Y33.874 E.0159
G1 X73.986 Y54.376 E.86408
G1 X74.519 Y54.376 E.0159
G1 X54.018 Y33.874 E.86408
G1 X54.552 Y33.874 E.0159
G1 X75.053 Y54.376 E.86408
G1 X75.586 Y54.376 E.0159
G1 X55.085 Y33.874 E.86408
G1 X55.619 Y33.874 E.0159
G1 X76.12 Y54.376 E.86408
G1 X76.653 Y54.376 E.0159
G1 X56.152 Y33.874 E.86408
G1 X56.686 Y33.874 E.0159
G1 X77.187 Y54.376 E.86408
G1 X77.721 Y54.376 E.0159
G1 X57.22 Y33.874 E.86408
M73 P37 R47
G1 X57.753 Y33.874 E.0159
G1 X78.254 Y54.376 E.86408
G1 X78.788 Y54.376 E.0159
G1 X58.287 Y33.874 E.86408
G1 X58.82 Y33.874 E.0159
G1 X79.321 Y54.376 E.86408
G1 X79.855 Y54.376 E.0159
G1 X59.354 Y33.874 E.86408
G1 X59.887 Y33.874 E.0159
G1 X80.388 Y54.376 E.86408
G1 X80.922 Y54.376 E.0159
G1 X60.421 Y33.874 E.86408
G1 X60.954 Y33.874 E.0159
G1 X81.456 Y54.376 E.86408
G1 X81.989 Y54.376 E.0159
G1 X61.488 Y33.874 E.86408
G1 X62.022 Y33.874 E.0159
G1 X82.523 Y54.376 E.86408
G1 X83.056 Y54.376 E.0159
G1 X62.555 Y33.874 E.86408
G1 X63.089 Y33.874 E.0159
G1 X83.59 Y54.376 E.86408
G1 X84.123 Y54.376 E.0159
G1 X63.622 Y33.874 E.86408
G1 X64.156 Y33.874 E.0159
G1 X84.657 Y54.376 E.86408
G1 X85.191 Y54.376 E.0159
G1 X64.689 Y33.874 E.86408
G1 X65.223 Y33.874 E.0159
G1 X85.724 Y54.376 E.86408
G1 X86.258 Y54.376 E.0159
G1 X65.757 Y33.874 E.86408
G1 X66.29 Y33.874 E.0159
G1 X86.791 Y54.376 E.86408
G1 X87.325 Y54.376 E.0159
G1 X66.824 Y33.874 E.86408
G1 X67.357 Y33.874 E.0159
G1 X87.858 Y54.376 E.86408
G1 X88.392 Y54.376 E.0159
G1 X67.891 Y33.874 E.86408
G1 X68.424 Y33.874 E.0159
G1 X88.926 Y54.376 E.86408
G1 X89.459 Y54.376 E.0159
G1 X68.958 Y33.874 E.86408
G1 X69.492 Y33.874 E.0159
G1 X89.993 Y54.376 E.86408
G1 X90.526 Y54.376 E.0159
G1 X70.025 Y33.874 E.86408
G1 X70.559 Y33.874 E.0159
G1 X91.06 Y54.376 E.86408
G1 X91.593 Y54.376 E.0159
G1 X71.092 Y33.874 E.86408
G1 X71.626 Y33.874 E.0159
G1 X92.127 Y54.376 E.86408
G1 X92.66 Y54.376 E.0159
G1 X72.159 Y33.874 E.86408
G1 X72.693 Y33.874 E.0159
G1 X93.194 Y54.376 E.86408
G1 X93.728 Y54.376 E.0159
G1 X73.227 Y33.874 E.86408
G1 X73.76 Y33.874 E.0159
G1 X94.261 Y54.376 E.86408
G1 X94.795 Y54.376 E.0159
G1 X74.294 Y33.874 E.86408
G1 X74.827 Y33.874 E.0159
G1 X95.328 Y54.376 E.86408
G1 X95.862 Y54.376 E.0159
G1 X75.361 Y33.874 E.86408
G1 X75.894 Y33.874 E.0159
G1 X96.395 Y54.376 E.86408
G1 X96.929 Y54.376 E.0159
G1 X76.428 Y33.874 E.86408
G1 X76.962 Y33.874 E.0159
G1 X97.463 Y54.376 E.86408
G1 X97.996 Y54.376 E.0159
G1 X77.495 Y33.874 E.86408
G1 X78.029 Y33.874 E.0159
G1 X98.53 Y54.376 E.86408
G1 X99.063 Y54.376 E.0159
G1 X78.562 Y33.874 E.86408
G1 X79.096 Y33.874 E.0159
G1 X99.597 Y54.376 E.86408
G1 X100.13 Y54.376 E.0159
G1 X79.629 Y33.874 E.86408
G1 X80.163 Y33.874 E.0159
G1 X100.664 Y54.376 E.86408
G1 X101.198 Y54.376 E.0159
G1 X80.697 Y33.874 E.86408
G1 X81.23 Y33.874 E.0159
G1 X101.731 Y54.376 E.86408
G1 X102.265 Y54.376 E.0159
G1 X81.764 Y33.874 E.86408
G1 X82.297 Y33.874 E.0159
G1 X102.798 Y54.376 E.86408
G1 X103.332 Y54.376 E.0159
G1 X82.831 Y33.874 E.86408
G1 X83.364 Y33.874 E.0159
G1 X103.865 Y54.376 E.86408
G1 X104.399 Y54.376 E.0159
G1 X83.898 Y33.874 E.86408
G1 X84.432 Y33.874 E.0159
G1 X104.933 Y54.376 E.86408
G1 X105.466 Y54.376 E.0159
G1 X84.965 Y33.874 E.86408
G1 X85.499 Y33.874 E.0159
G1 X106 Y54.376 E.86408
G1 X106.533 Y54.376 E.0159
G1 X86.032 Y33.874 E.86408
G1 X86.566 Y33.874 E.0159
G1 X107.067 Y54.376 E.86408
G1 X107.6 Y54.376 E.0159
G1 X87.099 Y33.874 E.86408
G1 X87.633 Y33.874 E.0159
G1 X108.134 Y54.376 E.86408
G1 X108.668 Y54.376 E.0159
G1 X88.166 Y33.874 E.86408
G1 X88.7 Y33.874 E.0159
G1 X109.201 Y54.376 E.86408
G1 X109.735 Y54.376 E.0159
G1 X89.234 Y33.874 E.86408
G1 X89.767 Y33.874 E.0159
G1 X110.268 Y54.376 E.86408
G1 X110.802 Y54.376 E.0159
G1 X90.301 Y33.874 E.86408
G1 X90.834 Y33.874 E.0159
G1 X111.335 Y54.376 E.86408
G1 X111.869 Y54.376 E.0159
G1 X91.368 Y33.874 E.86408
G1 X91.901 Y33.874 E.0159
G1 X112.403 Y54.376 E.86408
G1 X112.936 Y54.376 E.0159
G1 X92.435 Y33.874 E.86408
G1 X92.969 Y33.874 E.0159
G1 X113.47 Y54.376 E.86408
G1 X114.003 Y54.376 E.0159
G1 X93.502 Y33.874 E.86408
G1 X94.036 Y33.874 E.0159
G1 X114.537 Y54.376 E.86408
G1 X115.07 Y54.376 E.0159
G1 X94.569 Y33.874 E.86408
G1 X95.103 Y33.874 E.0159
G1 X115.604 Y54.376 E.86408
G1 X116.138 Y54.376 E.0159
G1 X95.636 Y33.874 E.86408
G1 X96.17 Y33.874 E.0159
G1 X116.671 Y54.376 E.86408
G1 X117.205 Y54.376 E.0159
G1 X96.704 Y33.874 E.86408
G1 X97.237 Y33.874 E.0159
G1 X117.738 Y54.376 E.86408
G1 X118.272 Y54.376 E.0159
G1 X97.771 Y33.874 E.86408
G1 X98.304 Y33.874 E.0159
G1 X118.805 Y54.376 E.86408
G1 X119.339 Y54.376 E.0159
G1 X98.838 Y33.874 E.86408
G1 X99.371 Y33.874 E.0159
G1 X119.872 Y54.376 E.86408
G1 X120.406 Y54.376 E.0159
G1 X99.905 Y33.874 E.86408
G1 X100.439 Y33.874 E.0159
G1 X120.94 Y54.376 E.86408
G1 X121.473 Y54.376 E.0159
G1 X100.972 Y33.874 E.86408
G1 X101.506 Y33.874 E.0159
G1 X122.007 Y54.376 E.86408
G1 X122.54 Y54.376 E.0159
G1 X102.039 Y33.874 E.86408
G1 X102.573 Y33.874 E.0159
G1 X123.074 Y54.376 E.86408
G1 X123.607 Y54.376 E.0159
G1 X103.106 Y33.874 E.86408
G1 X103.64 Y33.874 E.0159
G1 X124.141 Y54.376 E.86408
G1 X124.675 Y54.376 E.0159
G1 X104.174 Y33.874 E.86408
G1 X104.707 Y33.874 E.0159
G1 X125.208 Y54.376 E.86408
G1 X125.742 Y54.376 E.0159
G1 X105.241 Y33.874 E.86408
G1 X105.774 Y33.874 E.0159
G1 X126.275 Y54.376 E.86408
G1 X126.809 Y54.376 E.0159
G1 X106.308 Y33.874 E.86408
G1 X106.841 Y33.874 E.0159
G1 X127.342 Y54.376 E.86408
G1 X127.876 Y54.376 E.0159
G1 X107.375 Y33.874 E.86408
G1 X107.909 Y33.874 E.0159
G1 X128.41 Y54.376 E.86408
G1 X128.943 Y54.376 E.0159
G1 X108.442 Y33.874 E.86408
G1 X108.976 Y33.874 E.0159
G1 X129.477 Y54.376 E.86408
G1 X130.01 Y54.376 E.0159
G1 X109.509 Y33.874 E.86408
G1 X110.043 Y33.874 E.0159
G1 X130.544 Y54.376 E.86408
G1 X131.077 Y54.376 E.0159
G1 X110.576 Y33.874 E.86408
G1 X111.11 Y33.874 E.0159
G1 X131.611 Y54.376 E.86408
G1 X132.145 Y54.376 E.0159
G1 X111.644 Y33.874 E.86408
G1 X112.177 Y33.874 E.0159
G1 X132.848 Y54.545 E.87123
; WIPE_START
G1 X131.434 Y53.131 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.141 Y46.245 Z1 F30000
G1 X122.145 Y33.705 Z1
G1 Z.6
G1 E.8 F1800
G1 F9541.731
G1 X129.24 Y40.799 E.29903
G2 X128.522 Y40.615 I-1.304 J3.595 E.02211
G1 X121.781 Y33.874 E.28412
G1 X121.248 Y33.874 E.0159
G1 X127.949 Y40.575 E.28243
G2 X127.463 Y40.623 I.101 J3.496 E.01455
G1 X120.714 Y33.874 E.28446
G1 X120.181 Y33.874 E.0159
G1 X127.022 Y40.715 E.28833
G2 X126.626 Y40.854 I.493 J2.045 E.0125
G1 X119.647 Y33.874 E.29416
G1 X119.113 Y33.874 E.0159
G1 X126.267 Y41.028 E.30149
G2 X125.939 Y41.233 I.868 J1.745 E.01155
G1 X118.58 Y33.874 E.31017
G1 X118.046 Y33.874 E.0159
G1 X125.642 Y41.47 E.32014
G2 X125.374 Y41.736 I1.193 J1.469 E.01126
G1 X117.513 Y33.874 E.33134
G1 X116.979 Y33.874 E.0159
G1 X125.135 Y42.03 E.34375
G2 X124.925 Y42.354 I1.513 J1.209 E.01152
G1 X116.446 Y33.874 E.3574
G1 X115.912 Y33.874 E.0159
G1 X124.747 Y42.71 E.37238
G2 X124.604 Y43.1 I1.879 J.91 E.01241
G1 X115.378 Y33.874 E.38884
G1 X114.845 Y33.874 E.0159
G1 X124.501 Y43.531 E.40699
G2 X124.453 Y44.016 I4.396 J.683 E.01454
G1 X114.311 Y33.874 E.42744
G1 X113.778 Y33.874 E.0159
G1 X124.48 Y44.577 E.45109
G2 X124.642 Y45.272 I3.859 J-.53 E.02129
G1 X113.244 Y33.874 E.48038
G1 X112.711 Y33.874 E.0159
G1 X133.212 Y54.376 E.86408
G1 X133.745 Y54.376 E.0159
G1 X126.857 Y47.487 E.29034
G2 X127.551 Y47.648 I1.45 J-4.678 E.02126
G1 X134.279 Y54.376 E.28356
G1 X134.812 Y54.376 E.0159
G1 X128.108 Y47.671 E.2826
G2 X128.596 Y47.625 I.017 J-2.464 E.01464
G1 X135.346 Y54.376 E.28451
G1 X135.88 Y54.376 E.0159
G1 X129.026 Y47.522 E.28885
G2 X129.416 Y47.378 I-.526 J-2.015 E.01239
G1 X136.413 Y54.376 E.29494
G1 X136.947 Y54.376 E.0159
G1 X129.77 Y47.199 E.30248
G2 X130.093 Y46.989 I-.886 J-1.716 E.01151
G1 X137.48 Y54.376 E.31134
G1 X138.014 Y54.376 E.0159
G1 X130.387 Y46.749 E.32144
G2 X130.653 Y46.481 I-1.207 J-1.461 E.01126
G1 X138.547 Y54.376 E.33274
G1 X139.081 Y54.376 E.0159
G1 X130.89 Y46.185 E.34524
G2 X131.098 Y45.859 I-1.528 J-1.203 E.01154
G1 X139.615 Y54.376 E.35897
G1 X140.148 Y54.376 E.0159
G1 X131.274 Y45.501 E.37403
G2 X131.411 Y45.105 I-1.912 J-.883 E.01253
G1 X140.682 Y54.376 E.39074
G1 X141.215 Y54.376 E.0159
G1 X131.506 Y44.666 E.40924
G2 X131.549 Y44.176 I-2.433 J-.462 E.01469
G1 X141.749 Y54.376 E.4299
G1 X142.282 Y54.376 E.0159
G1 X131.508 Y43.602 E.4541
G2 X131.323 Y42.882 I-3.519 J.525 E.02219
G1 X142.816 Y54.376 E.48443
G1 X143.35 Y54.376 E.0159
G1 X122.848 Y33.874 E.86408
G1 X123.382 Y33.874 E.0159
G1 X143.883 Y54.376 E.86408
G1 X144.417 Y54.376 E.0159
G1 X123.916 Y33.874 E.86408
G1 X124.449 Y33.874 E.0159
G1 X144.95 Y54.376 E.86408
G1 X145.484 Y54.376 E.0159
G1 X124.983 Y33.874 E.86408
G1 X125.516 Y33.874 E.0159
G1 X146.017 Y54.376 E.86408
G1 X146.551 Y54.376 E.0159
G1 X126.05 Y33.874 E.86408
G1 X126.583 Y33.874 E.0159
G1 X147.084 Y54.376 E.86408
M73 P38 R47
G1 X147.618 Y54.376 E.0159
G1 X127.117 Y33.874 E.86408
G1 X127.651 Y33.874 E.0159
G1 X148.152 Y54.376 E.86408
G1 X148.685 Y54.376 E.0159
G1 X128.184 Y33.874 E.86408
G1 X128.718 Y33.874 E.0159
G1 X149.219 Y54.376 E.86408
G1 X149.752 Y54.376 E.0159
G1 X129.251 Y33.874 E.86408
G1 X129.785 Y33.874 E.0159
G1 X150.286 Y54.376 E.86408
G1 X150.819 Y54.376 E.0159
G1 X130.318 Y33.874 E.86408
G1 X130.852 Y33.874 E.0159
G1 X151.353 Y54.376 E.86408
G1 X151.887 Y54.376 E.0159
G1 X131.386 Y33.874 E.86408
G1 X131.919 Y33.874 E.0159
G1 X152.42 Y54.376 E.86408
G1 X152.954 Y54.376 E.0159
G1 X132.453 Y33.874 E.86408
G1 X132.986 Y33.874 E.0159
G1 X153.487 Y54.376 E.86408
G1 X154.021 Y54.376 E.0159
G1 X133.52 Y33.874 E.86408
G1 X134.053 Y33.874 E.0159
G1 X154.554 Y54.376 E.86408
G1 X155.088 Y54.376 E.0159
G1 X134.587 Y33.874 E.86408
G1 X135.121 Y33.874 E.0159
G1 X155.622 Y54.376 E.86408
G1 X156.155 Y54.376 E.0159
G1 X135.654 Y33.874 E.86408
G1 X136.188 Y33.874 E.0159
G1 X156.689 Y54.376 E.86408
G1 X157.222 Y54.376 E.0159
G1 X136.721 Y33.874 E.86408
G1 X137.255 Y33.874 E.0159
G1 X157.756 Y54.376 E.86408
G1 X158.289 Y54.376 E.0159
G1 X137.788 Y33.874 E.86408
G1 X138.322 Y33.874 E.0159
G1 X158.823 Y54.376 E.86408
G1 X159.357 Y54.376 E.0159
G1 X138.856 Y33.874 E.86408
G1 X139.389 Y33.874 E.0159
G1 X159.89 Y54.376 E.86408
G1 X160.424 Y54.376 E.0159
G1 X139.923 Y33.874 E.86408
G1 X140.456 Y33.874 E.0159
G1 X160.957 Y54.376 E.86408
G1 X161.491 Y54.376 E.0159
G1 X140.99 Y33.874 E.86408
G1 X141.523 Y33.874 E.0159
G1 X162.024 Y54.376 E.86408
G1 X162.558 Y54.376 E.0159
G1 X142.057 Y33.874 E.86408
G1 X142.59 Y33.874 E.0159
G1 X163.092 Y54.376 E.86408
G1 X163.625 Y54.376 E.0159
G1 X143.124 Y33.874 E.86408
G1 X143.658 Y33.874 E.0159
G1 X164.159 Y54.376 E.86408
G1 X164.692 Y54.376 E.0159
G1 X144.191 Y33.874 E.86408
G1 X144.725 Y33.874 E.0159
G1 X165.226 Y54.376 E.86408
G1 X165.759 Y54.376 E.0159
G1 X145.258 Y33.874 E.86408
G1 X145.792 Y33.874 E.0159
G1 X166.293 Y54.376 E.86408
G1 X166.827 Y54.376 E.0159
G1 X146.325 Y33.874 E.86408
G1 X146.859 Y33.874 E.0159
G1 X167.36 Y54.376 E.86408
G1 X167.894 Y54.376 E.0159
G1 X147.393 Y33.874 E.86408
G1 X147.926 Y33.874 E.0159
G1 X168.427 Y54.376 E.86408
G1 X168.961 Y54.376 E.0159
G1 X148.46 Y33.874 E.86408
G1 X148.993 Y33.874 E.0159
G1 X169.494 Y54.376 E.86408
G1 X170.028 Y54.376 E.0159
G1 X149.527 Y33.874 E.86408
G1 X150.06 Y33.874 E.0159
G1 X170.562 Y54.376 E.86408
G1 X171.095 Y54.376 E.0159
G1 X150.594 Y33.874 E.86408
G1 X151.128 Y33.874 E.0159
G1 X171.629 Y54.376 E.86408
G1 X172.162 Y54.376 E.0159
G1 X151.661 Y33.874 E.86408
G1 X152.195 Y33.874 E.0159
G1 X172.696 Y54.376 E.86408
G1 X173.229 Y54.376 E.0159
G1 X152.728 Y33.874 E.86408
G1 X153.262 Y33.874 E.0159
G1 X173.763 Y54.376 E.86408
G1 X174.296 Y54.376 E.0159
G1 X153.795 Y33.874 E.86408
G1 X154.329 Y33.874 E.0159
G1 X174.83 Y54.376 E.86408
G1 X175.364 Y54.376 E.0159
G1 X154.863 Y33.874 E.86408
G1 X155.396 Y33.874 E.0159
G1 X175.897 Y54.376 E.86408
G1 X176.431 Y54.376 E.0159
G1 X155.93 Y33.874 E.86408
G1 X156.463 Y33.874 E.0159
G1 X176.964 Y54.376 E.86408
G1 X177.498 Y54.376 E.0159
G1 X156.997 Y33.874 E.86408
G1 X157.53 Y33.874 E.0159
G1 X178.031 Y54.376 E.86408
G1 X178.565 Y54.376 E.0159
G1 X158.064 Y33.874 E.86408
G1 X158.598 Y33.874 E.0159
G1 X179.099 Y54.376 E.86408
G1 X179.632 Y54.376 E.0159
G1 X159.131 Y33.874 E.86408
G1 X159.665 Y33.874 E.0159
G1 X180.166 Y54.376 E.86408
G1 X180.699 Y54.376 E.0159
G1 X160.198 Y33.874 E.86408
G1 X160.732 Y33.874 E.0159
G1 X181.233 Y54.376 E.86408
G1 X181.766 Y54.376 E.0159
G1 X161.265 Y33.874 E.86408
G1 X161.799 Y33.874 E.0159
G1 X182.3 Y54.376 E.86408
G1 X182.834 Y54.376 E.0159
G1 X162.333 Y33.874 E.86408
G1 X162.866 Y33.874 E.0159
G1 X183.367 Y54.376 E.86408
G1 X183.901 Y54.376 E.0159
G1 X163.4 Y33.874 E.86408
G1 X163.933 Y33.874 E.0159
G1 X184.434 Y54.376 E.86408
G1 X184.968 Y54.376 E.0159
G1 X164.467 Y33.874 E.86408
G1 X165 Y33.874 E.0159
G1 X185.501 Y54.376 E.86408
G1 X186.035 Y54.376 E.0159
G1 X165.534 Y33.874 E.86408
G1 X166.068 Y33.874 E.0159
G1 X186.569 Y54.376 E.86408
G1 X187.102 Y54.376 E.0159
G1 X166.601 Y33.874 E.86408
G1 X167.135 Y33.874 E.0159
G1 X187.636 Y54.376 E.86408
G1 X188.169 Y54.376 E.0159
G1 X167.668 Y33.874 E.86408
G1 X168.202 Y33.874 E.0159
G1 X188.703 Y54.376 E.86408
G1 X189.236 Y54.376 E.0159
G1 X168.735 Y33.874 E.86408
G1 X169.269 Y33.874 E.0159
G1 X189.77 Y54.376 E.86408
G1 X190.304 Y54.376 E.0159
G1 X169.802 Y33.874 E.86408
G1 X170.336 Y33.874 E.0159
G1 X190.837 Y54.376 E.86408
G1 X191.371 Y54.376 E.0159
G1 X170.87 Y33.874 E.86408
G1 X171.403 Y33.874 E.0159
G1 X191.904 Y54.376 E.86408
G1 X192.438 Y54.376 E.0159
G1 X171.937 Y33.874 E.86408
G1 X172.47 Y33.874 E.0159
G1 X192.971 Y54.376 E.86408
G1 X193.505 Y54.376 E.0159
G1 X173.004 Y33.874 E.86408
G1 X173.537 Y33.874 E.0159
G1 X194.039 Y54.376 E.86408
G1 X194.572 Y54.376 E.0159
G1 X174.071 Y33.874 E.86408
G1 X174.605 Y33.874 E.0159
G1 X195.106 Y54.376 E.86408
G1 X195.639 Y54.376 E.0159
G1 X175.138 Y33.874 E.86408
G1 X175.672 Y33.874 E.0159
G1 X196.173 Y54.376 E.86408
G1 X196.706 Y54.376 E.0159
G1 X176.205 Y33.874 E.86408
G1 X176.739 Y33.874 E.0159
G1 X197.24 Y54.376 E.86408
G1 X197.774 Y54.376 E.0159
G1 X177.272 Y33.874 E.86408
G1 X177.806 Y33.874 E.0159
G1 X198.307 Y54.376 E.86408
G1 X198.841 Y54.376 E.0159
G1 X178.34 Y33.874 E.86408
G1 X178.873 Y33.874 E.0159
G1 X199.374 Y54.376 E.86408
G1 X199.908 Y54.376 E.0159
G1 X179.407 Y33.874 E.86408
G1 X179.94 Y33.874 E.0159
G1 X200.441 Y54.376 E.86408
G1 X200.975 Y54.376 E.0159
G1 X180.474 Y33.874 E.86408
G1 X181.007 Y33.874 E.0159
G1 X201.509 Y54.376 E.86408
G1 X202.042 Y54.376 E.0159
G1 X181.541 Y33.874 E.86408
G1 X182.075 Y33.874 E.0159
G1 X202.576 Y54.376 E.86408
G1 X203.109 Y54.376 E.0159
G1 X182.608 Y33.874 E.86408
G1 X183.142 Y33.874 E.0159
G1 X203.643 Y54.376 E.86408
G1 X204.176 Y54.376 E.0159
G1 X183.675 Y33.874 E.86408
G1 X184.209 Y33.874 E.0159
G1 X204.71 Y54.376 E.86408
G1 X205.243 Y54.376 E.0159
G1 X184.742 Y33.874 E.86408
G1 X185.276 Y33.874 E.0159
G1 X226.251 Y74.849 E1.727
G1 X226.251 Y74.315 E.0159
G1 X185.81 Y33.874 E1.70451
G1 X186.343 Y33.874 E.0159
G1 X226.251 Y73.782 E1.68202
G1 X226.251 Y73.248 E.0159
G1 X186.877 Y33.874 E1.65953
G1 X187.41 Y33.874 E.0159
G1 X226.251 Y72.715 E1.63704
G1 X226.251 Y72.181 E.0159
G1 X187.944 Y33.874 E1.61456
G1 X188.477 Y33.874 E.0159
G1 X226.251 Y71.648 E1.59207
G1 X226.251 Y71.114 E.0159
G1 X189.011 Y33.874 E1.56958
G1 X189.545 Y33.874 E.0159
G1 X226.251 Y70.58 E1.54709
G1 X226.251 Y70.047 E.0159
G1 X190.078 Y33.874 E1.5246
G1 X190.612 Y33.874 E.0159
G1 X226.251 Y69.513 E1.50211
G1 X226.251 Y68.98 E.0159
G1 X191.145 Y33.874 E1.47962
G1 X191.679 Y33.874 E.0159
G1 X226.251 Y68.446 E1.45713
G1 X226.251 Y67.913 E.0159
G1 X192.212 Y33.874 E1.43464
G1 X192.746 Y33.874 E.0159
G1 X226.251 Y67.379 E1.41216
G1 X226.251 Y66.845 E.0159
G1 X193.279 Y33.874 E1.38967
G1 X193.813 Y33.874 E.0159
G1 X226.251 Y66.312 E1.36718
G1 X226.251 Y65.778 E.0159
G1 X194.347 Y33.874 E1.34469
G1 X194.88 Y33.874 E.0159
G1 X226.251 Y65.245 E1.3222
G1 X226.251 Y64.711 E.0159
G1 X195.414 Y33.874 E1.29971
G1 X195.947 Y33.874 E.0159
G1 X226.251 Y64.178 E1.27722
G1 X226.251 Y63.644 E.0159
G1 X196.481 Y33.874 E1.25473
G1 X197.014 Y33.874 E.0159
G1 X226.251 Y63.111 E1.23224
G1 X226.251 Y62.577 E.0159
G1 X197.548 Y33.874 E1.20976
G1 X198.082 Y33.874 E.0159
G1 X226.251 Y62.043 E1.18727
G1 X226.251 Y61.51 E.0159
G1 X198.615 Y33.874 E1.16478
G1 X199.149 Y33.874 E.0159
G1 X226.251 Y60.976 E1.14229
G1 X226.251 Y60.443 E.0159
G1 X199.682 Y33.874 E1.1198
G1 X200.216 Y33.874 E.0159
G1 X226.42 Y60.079 E1.10446
G1 X226.42 Y49.941 F30000
G1 F9541.731
G1 X219.3 Y42.821 E.30009
G3 X219.501 Y43.556 I-3.421 J1.332 E.02274
G1 X226.251 Y50.305 E.28446
G1 X226.251 Y50.838 E.0159
G1 X219.551 Y44.139 E.28237
G3 X219.511 Y44.632 I-2.489 J.046 E.01478
G1 X226.251 Y51.372 E.28407
G1 X226.251 Y51.906 E.0159
G1 X219.419 Y45.074 E.28794
G3 X219.284 Y45.473 I-2.06 J-.472 E.01257
G1 X226.251 Y52.439 E.29361
G1 X226.251 Y52.973 E.0159
G1 X219.112 Y45.835 E.30086
G3 X218.907 Y46.162 I-1.742 J-.865 E.01155
G1 X226.251 Y53.506 E.30953
G1 X226.251 Y54.04 E.0159
G1 X218.672 Y46.461 E.31944
G3 X218.408 Y46.731 I-1.481 J-1.182 E.01126
M73 P38 R46
G1 X226.251 Y54.573 E.33055
G1 X226.251 Y55.107 E.0159
G1 X218.116 Y46.972 E.34285
G3 X217.795 Y47.185 I-1.222 J-1.5 E.0115
G1 X226.251 Y55.641 E.3564
G1 X226.251 Y56.174 E.0159
G1 X217.442 Y47.366 E.37125
G3 X217.055 Y47.513 I-.926 J-1.859 E.01235
G1 X226.251 Y56.708 E.38756
G1 X226.251 Y57.241 E.0159
G1 X216.629 Y47.62 E.40552
G3 X216.145 Y47.67 I-.771 J-5.111 E.0145
G1 X226.251 Y57.775 E.42591
G1 X226.251 Y58.308 E.0159
G1 X215.594 Y47.652 E.44916
G3 X214.913 Y47.504 I.579 J-4.318 E.0208
G1 X226.251 Y58.842 E.47787
G1 X226.251 Y59.376 E.0159
G1 X200.749 Y33.874 E1.07482
G1 X201.283 Y33.874 E.0159
G1 X212.624 Y45.216 E.47801
G3 X212.476 Y44.534 I3.459 J-1.109 E.02083
G1 X201.817 Y33.874 E.44927
G1 X202.35 Y33.874 E.0159
G1 X212.453 Y43.977 E.42581
G3 X212.508 Y43.498 I4.814 J.31 E.01437
G1 X202.884 Y33.874 E.40563
G1 X203.417 Y33.874 E.0159
G1 X212.613 Y43.07 E.38759
G3 X212.759 Y42.682 I2.013 J.533 E.01237
G1 X203.951 Y33.874 E.37123
G1 X204.484 Y33.874 E.0159
G1 X212.939 Y42.329 E.35634
G3 X213.151 Y42.007 I1.716 J.899 E.0115
G1 X205.018 Y33.874 E.34278
G1 X205.552 Y33.874 E.0159
G1 X213.392 Y41.715 E.33045
G3 X213.663 Y41.452 I10.888 J10.946 E.01125
G1 X206.085 Y33.874 E.31938
G1 X206.619 Y33.874 E.0159
G1 X213.962 Y41.218 E.30953
G3 X214.292 Y41.014 I1.184 J1.546 E.01157
G1 X207.152 Y33.874 E.30093
G1 X207.686 Y33.874 E.0159
G1 X214.654 Y40.843 E.2937
G3 X215.052 Y40.707 I.878 J1.921 E.01255
G1 X208.219 Y33.874 E.28797
G1 X208.753 Y33.874 E.0159
G1 X215.497 Y40.618 E.28424
G3 X215.988 Y40.576 I.502 J2.986 E.01472
G1 X209.287 Y33.874 E.28247
G1 X209.82 Y33.874 E.0159
G1 X216.567 Y40.621 E.28435
G3 X217.298 Y40.819 I-.748 J4.21 E.0226
G1 X210.354 Y33.874 E.29269
G1 X210.887 Y33.874 E.0159
G1 X226.251 Y49.238 E.64753
G1 X226.251 Y48.704 E.0159
G1 X211.421 Y33.874 E.62504
G1 X211.954 Y33.874 E.0159
G1 X226.251 Y48.171 E.60256
G1 X226.251 Y47.637 E.0159
G1 X212.488 Y33.874 E.58007
G1 X213.022 Y33.874 E.0159
G1 X226.251 Y47.103 E.55758
G1 X226.251 Y46.57 E.0159
G1 X213.555 Y33.874 E.53509
G1 X214.089 Y33.874 E.0159
G1 X226.251 Y46.036 E.5126
G1 X226.251 Y45.503 E.0159
G1 X214.622 Y33.874 E.49011
G1 X215.156 Y33.874 E.0159
G1 X226.251 Y44.969 E.46762
G1 X226.251 Y44.436 E.0159
G1 X215.689 Y33.874 E.44513
G1 X216.223 Y33.874 E.0159
G1 X226.251 Y43.902 E.42264
G1 X226.251 Y43.368 E.0159
G1 X216.757 Y33.874 E.40016
G1 X217.29 Y33.874 E.0159
G1 X226.251 Y42.835 E.37767
G1 X226.251 Y42.301 E.0159
G1 X217.824 Y33.874 E.35518
G1 X218.357 Y33.874 E.0159
G1 X226.251 Y41.768 E.33269
G1 X226.251 Y41.234 E.0159
G1 X218.891 Y33.874 E.3102
G1 X219.424 Y33.874 E.0159
G1 X226.251 Y40.701 E.28771
G1 X226.251 Y40.167 E.0159
G1 X219.958 Y33.874 E.26522
G1 X220.492 Y33.874 E.0159
G1 X226.251 Y39.633 E.24273
G1 X226.251 Y39.1 E.0159
G1 X221.025 Y33.874 E.22024
G1 X221.559 Y33.874 E.0159
G1 X226.251 Y38.566 E.19775
G1 X226.251 Y38.033 E.0159
G1 X222.092 Y33.874 E.17527
G1 X222.626 Y33.874 E.0159
G1 X226.251 Y37.499 E.15278
G1 X226.251 Y36.966 E.0159
G1 X223.159 Y33.874 E.13029
G1 X223.693 Y33.874 E.0159
G1 X226.251 Y36.432 E.1078
G1 X226.251 Y35.899 E.0159
G1 X224.226 Y33.874 E.08531
G1 X224.76 Y33.874 E.0159
G1 X226.251 Y35.365 E.06282
G1 X226.251 Y34.831 E.0159
G1 X225.294 Y33.874 E.04033
G1 X225.827 Y33.874 E.0159
G1 X226.42 Y34.467 E.025
G1 X226.42 Y75.552 F30000
G1 F9541.731
G1 X205.749 Y54.882 E.87123
G1 X205.749 Y55.415 E.0159
G1 X226.251 Y75.916 E.86408
G1 X226.251 Y76.45 E.0159
G1 X205.749 Y55.949 E.86408
G1 X205.749 Y56.482 E.0159
G1 X226.251 Y76.983 E.86408
G1 X226.251 Y77.517 E.0159
G1 X205.749 Y57.016 E.86408
G1 X205.749 Y57.549 E.0159
G1 X226.251 Y78.05 E.86408
G1 X226.251 Y78.584 E.0159
G1 X205.749 Y58.083 E.86408
G1 X205.749 Y58.617 E.0159
G1 X226.251 Y79.118 E.86408
G1 X226.251 Y79.651 E.0159
G1 X205.749 Y59.15 E.86408
G1 X205.749 Y59.684 E.0159
G1 X226.251 Y80.185 E.86408
G1 X226.251 Y80.718 E.0159
G1 X205.749 Y60.217 E.86408
G1 X205.749 Y60.751 E.0159
G1 X226.251 Y81.252 E.86408
G1 X226.251 Y81.785 E.0159
G1 X205.749 Y61.284 E.86408
G1 X205.749 Y61.818 E.0159
G1 X226.251 Y82.319 E.86408
G1 X226.251 Y82.853 E.0159
G1 X205.749 Y62.351 E.86408
G1 X205.749 Y62.885 E.0159
G1 X226.251 Y83.386 E.86408
G1 X226.251 Y83.92 E.0159
G1 X205.749 Y63.419 E.86408
G1 X205.749 Y63.952 E.0159
G1 X226.251 Y84.453 E.86408
G1 X226.251 Y84.987 E.0159
G1 X205.749 Y64.486 E.86408
G1 X205.749 Y65.019 E.0159
G1 X226.251 Y85.52 E.86408
G1 X226.251 Y86.054 E.0159
G1 X205.749 Y65.553 E.86408
G1 X205.749 Y66.086 E.0159
G1 X226.251 Y86.588 E.86408
G1 X226.251 Y87.121 E.0159
G1 X205.749 Y66.62 E.86408
G1 X205.749 Y67.154 E.0159
G1 X226.251 Y87.655 E.86408
G1 X226.251 Y88.188 E.0159
G1 X205.749 Y67.687 E.86408
G1 X205.749 Y68.221 E.0159
G1 X226.251 Y88.722 E.86408
G1 X226.251 Y89.255 E.0159
G1 X205.749 Y68.754 E.86408
G1 X205.749 Y69.288 E.0159
G1 X226.251 Y89.789 E.86408
G1 X226.251 Y90.323 E.0159
G1 X205.749 Y69.821 E.86408
G1 X205.749 Y70.355 E.0159
G1 X226.251 Y90.856 E.86408
G1 X226.251 Y91.39 E.0159
G1 X205.749 Y70.889 E.86408
G1 X205.749 Y71.422 E.0159
G1 X226.251 Y91.923 E.86408
G1 X226.251 Y92.457 E.0159
G1 X205.749 Y71.956 E.86408
G1 X205.749 Y72.489 E.0159
G1 X226.251 Y92.99 E.86408
G1 X226.251 Y93.524 E.0159
G1 X205.749 Y73.023 E.86408
G1 X205.749 Y73.556 E.0159
G1 X226.251 Y94.058 E.86408
G1 X226.251 Y94.591 E.0159
G1 X205.749 Y74.09 E.86408
G1 X205.749 Y74.624 E.0159
G1 X226.251 Y95.125 E.86408
G1 X226.251 Y95.658 E.0159
G1 X205.749 Y75.157 E.86408
G1 X205.749 Y75.691 E.0159
G1 X226.251 Y96.192 E.86408
G1 X226.251 Y96.725 E.0159
G1 X205.749 Y76.224 E.86408
G1 X205.749 Y76.758 E.0159
G1 X226.251 Y97.259 E.86408
G1 X226.251 Y97.792 E.0159
G1 X205.749 Y77.291 E.86408
M73 P39 R46
G1 X205.749 Y77.825 E.0159
G1 X226.251 Y98.326 E.86408
G1 X226.251 Y98.86 E.0159
G1 X205.749 Y78.359 E.86408
G1 X205.749 Y78.892 E.0159
G1 X226.251 Y99.393 E.86408
G1 X226.251 Y99.927 E.0159
G1 X205.749 Y79.426 E.86408
G1 X205.749 Y79.959 E.0159
G1 X226.251 Y100.46 E.86408
G1 X226.251 Y100.994 E.0159
G1 X205.749 Y80.493 E.86408
G1 X205.749 Y81.026 E.0159
G1 X226.251 Y101.527 E.86408
G1 X226.251 Y102.061 E.0159
G1 X205.749 Y81.56 E.86408
G1 X205.749 Y82.094 E.0159
G1 X226.251 Y102.595 E.86408
G1 X226.251 Y103.128 E.0159
G1 X205.749 Y82.627 E.86408
G1 X205.749 Y83.161 E.0159
G1 X226.251 Y103.662 E.86408
G1 X226.251 Y104.195 E.0159
G1 X205.749 Y83.694 E.86408
G1 X205.749 Y84.228 E.0159
G1 X226.251 Y104.729 E.86408
G1 X226.251 Y105.262 E.0159
G1 X205.749 Y84.761 E.86408
G1 X205.749 Y85.295 E.0159
G1 X226.251 Y105.796 E.86408
G1 X226.251 Y106.33 E.0159
G1 X205.749 Y85.829 E.86408
G1 X205.749 Y86.362 E.0159
G1 X226.251 Y106.863 E.86408
G1 X226.251 Y107.397 E.0159
G1 X205.749 Y86.896 E.86408
G1 X205.749 Y87.429 E.0159
G1 X226.251 Y107.93 E.86408
G1 X226.251 Y108.464 E.0159
G1 X205.749 Y87.963 E.86408
G1 X205.749 Y88.496 E.0159
G1 X226.251 Y108.997 E.86408
G1 X226.251 Y109.531 E.0159
G1 X205.749 Y89.03 E.86408
G1 X205.749 Y89.563 E.0159
G1 X226.251 Y110.065 E.86408
G1 X226.251 Y110.598 E.0159
G1 X205.749 Y90.097 E.86408
G1 X205.749 Y90.631 E.0159
G1 X226.251 Y111.132 E.86408
G1 X226.251 Y111.665 E.0159
G1 X205.749 Y91.164 E.86408
G1 X205.749 Y91.698 E.0159
G1 X226.251 Y112.199 E.86408
G1 X226.251 Y112.732 E.0159
G1 X205.749 Y92.231 E.86408
G1 X205.749 Y92.765 E.0159
G1 X226.251 Y113.266 E.86408
G1 X226.251 Y113.8 E.0159
G1 X205.749 Y93.298 E.86408
G1 X205.749 Y93.832 E.0159
G1 X226.251 Y114.333 E.86408
G1 X226.251 Y114.867 E.0159
G1 X205.749 Y94.366 E.86408
G1 X205.749 Y94.899 E.0159
G1 X226.251 Y115.4 E.86408
G1 X226.251 Y115.934 E.0159
G1 X205.749 Y95.433 E.86408
G1 X205.749 Y95.966 E.0159
G1 X226.251 Y116.467 E.86408
G1 X226.251 Y117.001 E.0159
G1 X205.749 Y96.5 E.86408
G1 X205.749 Y97.033 E.0159
G1 X226.251 Y117.535 E.86408
G1 X226.251 Y118.068 E.0159
G1 X205.749 Y97.567 E.86408
G1 X205.749 Y98.101 E.0159
G1 X226.251 Y118.602 E.86408
G1 X226.251 Y119.135 E.0159
G1 X205.749 Y98.634 E.86408
G1 X205.749 Y99.168 E.0159
G1 X226.251 Y119.669 E.86408
G1 X226.251 Y120.202 E.0159
G1 X205.749 Y99.701 E.86408
G1 X205.749 Y100.235 E.0159
G1 X226.251 Y120.736 E.86408
G1 X226.251 Y121.27 E.0159
G1 X205.749 Y100.768 E.86408
G1 X205.749 Y101.302 E.0159
G1 X226.251 Y121.803 E.86408
G1 X226.251 Y122.337 E.0159
G1 X205.749 Y101.836 E.86408
G1 X205.749 Y102.369 E.0159
G1 X226.251 Y122.87 E.86408
G1 X226.251 Y123.404 E.0159
G1 X205.749 Y102.903 E.86408
G1 X205.749 Y103.436 E.0159
G1 X226.251 Y123.937 E.86408
G1 X226.251 Y124.471 E.0159
G1 X205.749 Y103.97 E.86408
G1 X205.749 Y104.503 E.0159
G1 X226.251 Y125.004 E.86408
G1 X226.251 Y125.538 E.0159
G1 X205.749 Y105.037 E.86408
G1 X205.749 Y105.571 E.0159
G1 X226.251 Y126.072 E.86408
G1 X226.251 Y126.605 E.0159
G1 X205.749 Y106.104 E.86408
G1 X205.749 Y106.638 E.0159
G1 X226.251 Y127.139 E.86408
G1 X226.251 Y127.672 E.0159
G1 X205.749 Y107.171 E.86408
G1 X205.749 Y107.705 E.0159
G1 X226.251 Y128.206 E.86408
G1 X226.251 Y128.739 E.0159
G1 X205.749 Y108.238 E.86408
G1 X205.749 Y108.772 E.0159
G1 X226.251 Y129.273 E.86408
G1 X226.251 Y129.807 E.0159
G1 X205.749 Y109.306 E.86408
G1 X205.749 Y109.839 E.0159
G1 X226.251 Y130.34 E.86408
G1 X226.251 Y130.874 E.0159
G1 X205.749 Y110.373 E.86408
G1 X205.749 Y110.906 E.0159
G1 X226.251 Y131.407 E.86408
G1 X226.251 Y131.941 E.0159
G1 X219.439 Y125.129 E.28711
G3 X219.54 Y125.764 I-3.509 J.885 E.01918
G1 X226.251 Y132.474 E.28284
G1 X226.251 Y133.008 E.0159
G1 X219.537 Y126.294 E.28297
G3 X219.467 Y126.758 I-4.774 J-.479 E.01399
G1 X226.251 Y133.542 E.2859
G1 X226.251 Y134.075 E.0159
G1 X219.348 Y127.173 E.29093
G3 X219.191 Y127.549 I-1.962 J-.597 E.01218
G1 X226.251 Y134.609 E.29754
G1 X226.251 Y135.142 E.0159
G1 X219.001 Y127.892 E.30557
G3 X218.78 Y128.205 I-1.671 J-.947 E.01143
G1 X226.251 Y135.676 E.31488
G1 X226.251 Y136.209 E.0159
G1 X218.53 Y128.489 E.32541
G3 X218.252 Y128.744 I-1.416 J-1.263 E.01127
G1 X226.251 Y136.743 E.33714
G1 X226.251 Y137.277 E.0159
G1 X217.945 Y128.971 E.35008
G3 X217.607 Y129.167 I-5.522 J-9.132 E.01164
G1 X226.251 Y137.81 E.36431
G1 X226.251 Y138.344 E.0159
G1 X217.234 Y129.327 E.38002
G3 X216.824 Y129.45 I-.821 J-1.992 E.01279
G1 X226.251 Y138.877 E.39732
G1 X226.251 Y139.411 E.0159
G1 X216.369 Y129.529 E.41651
G3 X215.852 Y129.546 I-.398 J-4.157 E.0154
G1 X226.251 Y139.944 E.43827
G1 X226.251 Y140.478 E.0159
G1 X215.241 Y129.468 E.46405
G3 X214.41 Y129.171 I.529 J-2.789 E.02639
G1 X226.251 Y141.012 E.49905
G1 X226.251 Y141.545 E.0159
G1 X205.749 Y121.044 E.86408
G1 X205.749 Y120.51 E.0159
G1 X212.824 Y127.585 E.29818
G3 X212.535 Y126.763 I2.413 J-1.31 E.02609
G1 X205.749 Y119.977 E.28601
G1 X205.749 Y119.443 E.0159
G1 X212.453 Y126.147 E.28253
G3 X212.472 Y125.632 I2.582 J-.162 E.01537
G1 X205.749 Y118.91 E.28334
G1 X205.749 Y118.376 E.0159
G1 X212.548 Y125.175 E.28654
G3 X212.671 Y124.764 I6.11 J1.615 E.01277
G1 X205.749 Y117.843 E.29174
G1 X205.749 Y117.309 E.0159
G1 X212.835 Y124.395 E.29865
G3 X213.031 Y124.057 I1.785 J.812 E.01165
G1 X205.749 Y116.775 E.30691
G1 X205.749 Y116.242 E.0159
G1 X213.257 Y123.75 E.31645
G3 X213.512 Y123.471 I1.519 J1.134 E.01127
G1 X205.749 Y115.708 E.32719
G1 X205.749 Y115.175 E.0159
G1 X213.796 Y123.221 E.33913
G3 X214.108 Y122.999 I1.262 J1.447 E.01142
G1 X205.749 Y114.641 E.35228
G1 X205.749 Y114.108 E.0159
G1 X214.45 Y122.808 E.36672
G3 X214.826 Y122.65 I.977 J1.797 E.01216
G1 X205.749 Y113.574 E.38254
G1 X205.749 Y113.041 E.0159
G1 X215.241 Y122.532 E.40005
G3 X215.707 Y122.465 I.675 J3.024 E.01405
G1 X205.749 Y112.507 E.4197
G1 X205.749 Y111.973 E.0159
G1 X216.234 Y122.457 E.44189
G3 X216.87 Y122.56 I-.369 J4.313 E.01922
G1 X205.58 Y111.27 E.47585
; WIPE_START
G1 X206.994 Y112.684 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X211.185 Y119.063 Z1 F30000
G1 X226.42 Y142.248 Z1
G1 Z.6
G1 E.8 F1800
G1 F9541.731
G1 X205.749 Y121.578 E.87123
G1 X205.749 Y122.111 E.0159
G1 X226.251 Y142.612 E.86408
G1 X226.251 Y143.146 E.0159
G1 X205.749 Y122.645 E.86408
G1 X205.749 Y123.178 E.0159
G1 X226.251 Y143.679 E.86408
G1 X226.251 Y144.213 E.0159
G1 X205.749 Y123.712 E.86408
G1 X205.749 Y124.245 E.0159
G1 X226.251 Y144.747 E.86408
G1 X226.251 Y145.28 E.0159
G1 X205.749 Y124.779 E.86408
G1 X205.749 Y125.313 E.0159
G1 X226.251 Y145.814 E.86408
G1 X226.251 Y146.347 E.0159
G1 X205.749 Y125.846 E.86408
G1 X205.749 Y126.38 E.0159
G1 X226.251 Y146.881 E.86408
G1 X226.251 Y147.414 E.0159
G1 X205.749 Y126.913 E.86408
G1 X205.749 Y127.447 E.0159
G1 X226.251 Y147.948 E.86408
G1 X226.251 Y148.482 E.0159
G1 X205.749 Y127.98 E.86408
G1 X205.749 Y128.514 E.0159
G1 X226.251 Y149.015 E.86408
G1 X226.251 Y149.549 E.0159
G1 X205.749 Y129.048 E.86408
G1 X205.749 Y129.581 E.0159
G1 X226.251 Y150.082 E.86408
G1 X226.251 Y150.616 E.0159
G1 X205.749 Y130.115 E.86408
G1 X205.749 Y130.648 E.0159
G1 X226.251 Y151.149 E.86408
G1 X226.251 Y151.683 E.0159
G1 X205.749 Y131.182 E.86408
G1 X205.749 Y131.715 E.0159
G1 X226.251 Y152.216 E.86408
G1 X226.251 Y152.75 E.0159
G1 X205.749 Y132.249 E.86408
G1 X205.749 Y132.783 E.0159
G1 X226.251 Y153.284 E.86408
G1 X226.251 Y153.817 E.0159
G1 X205.749 Y133.316 E.86408
G1 X205.749 Y133.85 E.0159
G1 X226.251 Y154.351 E.86408
G1 X226.251 Y154.884 E.0159
G1 X205.749 Y134.383 E.86408
G1 X205.749 Y134.917 E.0159
G1 X226.251 Y155.418 E.86408
G1 X226.251 Y155.951 E.0159
G1 X205.749 Y135.45 E.86408
G1 X205.749 Y135.984 E.0159
G1 X226.251 Y156.485 E.86408
G1 X226.251 Y157.019 E.0159
G1 X205.749 Y136.518 E.86408
G1 X205.749 Y137.051 E.0159
G1 X226.251 Y157.552 E.86408
G1 X226.251 Y158.086 E.0159
G1 X205.749 Y137.585 E.86408
G1 X205.749 Y138.118 E.0159
G1 X226.251 Y158.619 E.86408
G1 X226.251 Y159.153 E.0159
G1 X205.749 Y138.652 E.86408
G1 X205.749 Y139.185 E.0159
G1 X226.251 Y159.686 E.86408
G1 X226.251 Y160.22 E.0159
G1 X205.749 Y139.719 E.86408
G1 X205.749 Y140.253 E.0159
G1 X226.251 Y160.754 E.86408
G1 X226.251 Y161.287 E.0159
G1 X205.749 Y140.786 E.86408
G1 X205.749 Y141.32 E.0159
G1 X226.251 Y161.821 E.86408
G1 X226.251 Y162.354 E.0159
G1 X205.749 Y141.853 E.86408
G1 X205.749 Y142.387 E.0159
G1 X226.251 Y162.888 E.86408
G1 X226.251 Y163.421 E.0159
G1 X205.749 Y142.92 E.86408
G1 X205.749 Y143.454 E.0159
G1 X226.251 Y163.955 E.86408
G1 X226.251 Y164.489 E.0159
G1 X205.749 Y143.987 E.86408
G1 X205.749 Y144.521 E.0159
G1 X226.251 Y165.022 E.86408
G1 X226.251 Y165.556 E.0159
G1 X205.749 Y145.055 E.86408
G1 X205.749 Y145.588 E.0159
G1 X226.251 Y166.089 E.86408
G1 X226.251 Y166.623 E.0159
G1 X205.749 Y146.122 E.86408
G1 X205.749 Y146.655 E.0159
G1 X226.251 Y167.156 E.86408
G1 X226.251 Y167.69 E.0159
G1 X205.749 Y147.189 E.86408
G1 X205.749 Y147.722 E.0159
G1 X226.251 Y168.224 E.86408
G1 X226.251 Y168.757 E.0159
G1 X205.749 Y148.256 E.86408
G1 X205.749 Y148.79 E.0159
G1 X226.251 Y169.291 E.86408
G1 X226.251 Y169.824 E.0159
G1 X205.749 Y149.323 E.86408
G1 X205.749 Y149.857 E.0159
G1 X226.251 Y170.358 E.86408
G1 X226.251 Y170.891 E.0159
G1 X205.749 Y150.39 E.86408
G1 X205.749 Y150.924 E.0159
G1 X226.251 Y171.425 E.86408
G1 X226.251 Y171.959 E.0159
G1 X205.749 Y151.457 E.86408
G1 X205.749 Y151.991 E.0159
G1 X226.251 Y172.492 E.86408
G1 X226.251 Y173.026 E.0159
G1 X205.749 Y152.525 E.86408
G1 X205.749 Y153.058 E.0159
G1 X226.251 Y173.559 E.86408
G1 X226.251 Y174.093 E.0159
G1 X205.749 Y153.592 E.86408
G1 X205.749 Y154.125 E.0159
G1 X226.251 Y174.626 E.86408
G1 X226.251 Y175.16 E.0159
G1 X205.749 Y154.659 E.86408
G1 X205.749 Y155.192 E.0159
G1 X226.251 Y175.694 E.86408
G1 X226.251 Y176.227 E.0159
G1 X205.749 Y155.726 E.86408
G1 X205.749 Y156.26 E.0159
G1 X226.251 Y176.761 E.86408
G1 X226.251 Y177.294 E.0159
G1 X205.749 Y156.793 E.86408
G1 X205.749 Y157.327 E.0159
G1 X226.251 Y177.828 E.86408
G1 X226.251 Y178.361 E.0159
G1 X205.749 Y157.86 E.86408
G1 X205.749 Y158.394 E.0159
G1 X226.251 Y178.895 E.86408
G1 X226.251 Y179.428 E.0159
G1 X205.749 Y158.927 E.86408
G1 X205.749 Y159.461 E.0159
G1 X226.251 Y179.962 E.86408
G1 X226.251 Y180.496 E.0159
G1 X205.749 Y159.995 E.86408
G1 X205.749 Y160.528 E.0159
G1 X226.251 Y181.029 E.86408
G1 X226.251 Y181.563 E.0159
G1 X205.749 Y161.062 E.86408
G1 X205.749 Y161.595 E.0159
G1 X226.251 Y182.096 E.86408
G1 X226.251 Y182.63 E.0159
G1 X205.749 Y162.129 E.86408
G1 X205.749 Y162.662 E.0159
G1 X226.251 Y183.163 E.86408
G1 X226.251 Y183.697 E.0159
G1 X205.749 Y163.196 E.86408
G1 X205.749 Y163.73 E.0159
G1 X226.251 Y184.231 E.86408
G1 X226.251 Y184.764 E.0159
G1 X205.749 Y164.263 E.86408
G1 X205.749 Y164.797 E.0159
G1 X226.251 Y185.298 E.86408
G1 X226.251 Y185.831 E.0159
G1 X205.749 Y165.33 E.86408
G1 X205.749 Y165.864 E.0159
G1 X226.251 Y186.365 E.86408
G1 X226.251 Y186.898 E.0159
G1 X205.749 Y166.397 E.86408
G1 X205.749 Y166.931 E.0159
G1 X226.251 Y187.432 E.86408
G1 X226.251 Y187.966 E.0159
G1 X205.749 Y167.465 E.86408
G1 X205.749 Y167.998 E.0159
G1 X226.251 Y188.499 E.86408
G1 X226.251 Y189.033 E.0159
G1 X205.749 Y168.532 E.86408
G1 X205.749 Y169.065 E.0159
G1 X226.251 Y189.566 E.86408
G1 X226.251 Y190.1 E.0159
G1 X205.749 Y169.599 E.86408
G1 X205.749 Y170.132 E.0159
G1 X226.251 Y190.633 E.86408
G1 X226.251 Y191.167 E.0159
G1 X205.749 Y170.666 E.86408
G1 X205.749 Y171.199 E.0159
G1 X226.251 Y191.701 E.86408
G1 X226.251 Y192.234 E.0159
G1 X205.749 Y171.733 E.86408
G1 X205.749 Y172.267 E.0159
G1 X226.251 Y192.768 E.86408
G1 X226.251 Y193.301 E.0159
G1 X205.749 Y172.8 E.86408
G1 X205.749 Y173.334 E.0159
G1 X226.251 Y193.835 E.86408
G1 X226.251 Y194.368 E.0159
G1 X205.749 Y173.867 E.86408
G1 X205.749 Y174.401 E.0159
G1 X226.251 Y194.902 E.86408
G1 X226.251 Y195.436 E.0159
G1 X205.749 Y174.934 E.86408
G1 X205.749 Y175.468 E.0159
G1 X226.251 Y195.969 E.86408
G1 X226.251 Y196.503 E.0159
G1 X205.749 Y176.002 E.86408
G1 X205.749 Y176.535 E.0159
G1 X226.251 Y197.036 E.86408
G1 X226.251 Y197.57 E.0159
G1 X205.749 Y177.069 E.86408
G1 X205.749 Y177.602 E.0159
G1 X226.251 Y198.103 E.86408
G1 X226.251 Y198.637 E.0159
G1 X205.749 Y178.136 E.86408
G1 X205.749 Y178.669 E.0159
G1 X226.251 Y199.171 E.86408
G1 X226.251 Y199.704 E.0159
G1 X205.749 Y179.203 E.86408
G1 X205.749 Y179.737 E.0159
G1 X226.251 Y200.238 E.86408
G1 X226.251 Y200.771 E.0159
G1 X205.749 Y180.27 E.86408
G1 X205.749 Y180.804 E.0159
G1 X226.251 Y201.305 E.86408
G1 X226.251 Y201.838 E.0159
G1 X205.749 Y181.337 E.86408
G1 X205.749 Y181.871 E.0159
G1 X226.251 Y202.372 E.86408
G1 X226.251 Y202.906 E.0159
G1 X205.749 Y182.404 E.86408
G1 X205.749 Y182.938 E.0159
G1 X226.251 Y203.439 E.86408
G1 X226.251 Y203.973 E.0159
G1 X205.749 Y183.472 E.86408
G1 X205.749 Y184.005 E.0159
G1 X226.251 Y204.506 E.86408
G1 X226.251 Y205.04 E.0159
G1 X205.749 Y184.539 E.86408
G1 X205.749 Y185.072 E.0159
G1 X226.251 Y205.573 E.86408
G1 X226.251 Y206.107 E.0159
G1 X205.749 Y185.606 E.86408
G1 X205.749 Y186.139 E.0159
G1 X226.251 Y206.64 E.86408
G1 X226.251 Y207.174 E.0159
G1 X205.749 Y186.673 E.86408
G1 X205.749 Y187.207 E.0159
G1 X226.251 Y207.708 E.86408
G1 X226.251 Y208.241 E.0159
G1 X205.749 Y187.74 E.86408
G1 X205.749 Y188.274 E.0159
G1 X226.251 Y208.775 E.86408
G1 X226.251 Y209.308 E.0159
G1 X205.749 Y188.807 E.86408
G1 X205.749 Y189.341 E.0159
G1 X226.251 Y209.842 E.86408
G1 X226.251 Y210.375 E.0159
G1 X205.749 Y189.874 E.86408
G1 X205.749 Y190.408 E.0159
G1 X226.251 Y210.909 E.86408
G1 X226.251 Y211.443 E.0159
G1 X205.749 Y190.942 E.86408
G1 X205.749 Y191.475 E.0159
G1 X226.251 Y211.976 E.86408
G1 X226.251 Y212.51 E.0159
G1 X205.749 Y192.009 E.86408
M73 P39 R45
G1 X205.749 Y192.542 E.0159
G1 X226.251 Y213.043 E.86408
G1 X226.251 Y213.577 E.0159
G1 X219.332 Y206.658 E.2916
G3 X219.511 Y207.371 I-3.337 J1.218 E.02194
G1 X226.251 Y214.11 E.28404
G1 X226.251 Y214.644 E.0159
G1 X219.548 Y207.942 E.28249
G3 X219.504 Y208.431 I-2.47 J.02 E.01465
G1 X226.251 Y215.178 E.28437
M73 P40 R45
G1 X226.251 Y215.711 E.0159
G1 X219.408 Y208.868 E.28842
G3 X219.269 Y209.263 I-6.963 J-2.227 E.01247
G1 X226.251 Y216.245 E.29427
G1 X226.251 Y216.778 E.0159
G1 X219.091 Y209.619 E.30175
G3 X218.883 Y209.944 I-1.728 J-.88 E.01153
G1 X226.251 Y217.312 E.31054
G1 X226.251 Y217.845 E.0159
G1 X218.645 Y210.24 E.32057
G3 X218.379 Y210.507 I-1.471 J-1.199 E.01126
G1 X225.997 Y218.126 E.32111
G1 X225.464 Y218.126 E.0159
G1 X218.084 Y210.746 E.31104
G3 X217.76 Y210.955 I-1.21 J-1.519 E.01152
G1 X224.93 Y218.126 E.30222
G1 X224.396 Y218.126 E.0159
G1 X217.404 Y211.133 E.29472
G3 X217.014 Y211.276 I-.912 J-1.879 E.01241
G1 X223.863 Y218.126 E.28867
G1 X223.329 Y218.126 E.0159
G1 X216.581 Y211.377 E.28443
G3 X216.091 Y211.421 I-.464 J-2.427 E.01468
G1 X222.796 Y218.126 E.28258
G1 X222.262 Y218.126 E.0159
G1 X215.531 Y211.394 E.28371
G3 X214.829 Y211.226 I.647 J-4.247 E.02153
G1 X221.729 Y218.126 E.2908
G1 X221.195 Y218.126 E.0159
G1 X200.694 Y197.624 E.86408
G1 X201.227 Y197.624 E.0159
G1 X212.649 Y209.046 E.4814
G3 X212.482 Y208.346 I3.874 J-1.293 E.02149
G1 X201.761 Y197.624 E.45187
G1 X202.295 Y197.624 E.0159
G1 X212.453 Y207.783 E.42815
G3 X212.498 Y207.295 I4.455 J.17 E.01461
G1 X202.828 Y197.624 E.40758
G1 X203.362 Y197.624 E.0159
G1 X212.6 Y206.863 E.38938
G3 X212.742 Y206.471 I2.032 J.516 E.01243
G1 X203.895 Y197.624 E.37288
G1 X204.429 Y197.624 E.0159
G1 X212.919 Y206.115 E.35786
G3 X213.128 Y205.79 I1.73 J.883 E.01153
G1 X204.962 Y197.624 E.34417
G1 X205.496 Y197.624 E.0159
G1 X213.367 Y205.495 E.33173
G3 X213.633 Y205.228 I1.468 J1.202 E.01126
G1 X205.749 Y197.344 E.33229
G1 X205.749 Y196.811 E.0159
G1 X213.929 Y204.99 E.34474
G3 X214.255 Y204.783 I1.198 J1.53 E.01154
G1 X205.749 Y196.277 E.35851
G1 X205.749 Y195.744 E.0159
G1 X214.614 Y204.608 E.37363
G3 X215.008 Y204.469 I.894 J1.905 E.01248
G1 X205.749 Y195.21 E.39025
G1 X205.749 Y194.677 E.0159
G1 X215.449 Y204.376 E.4088
G3 X215.931 Y204.325 I.651 J3.876 E.01448
G1 X205.749 Y194.143 E.42915
G1 X205.749 Y193.609 E.0159
G1 X216.503 Y204.363 E.45325
G3 X217.215 Y204.541 I-.539 J3.667 E.02189
G1 X205.58 Y192.906 E.49039
; WIPE_START
G1 X206.994 Y194.32 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X199.476 Y195.639 Z1 F30000
G1 X70.365 Y218.295 Z1
G1 Z.6
G1 E.8 F1800
G1 F9541.731
G1 X29.749 Y177.68 E1.71186
G1 X29.749 Y178.214 E.0159
G1 X69.661 Y218.126 E1.68222
G1 X69.128 Y218.126 E.0159
G1 X29.749 Y178.747 E1.65973
G1 X29.749 Y179.281 E.0159
G1 X68.594 Y218.126 E1.63724
G1 X68.061 Y218.126 E.0159
G1 X29.749 Y179.814 E1.61475
G1 X29.749 Y180.348 E.0159
G1 X67.527 Y218.126 E1.59226
G1 X66.994 Y218.126 E.0159
G1 X29.749 Y180.881 E1.56977
G1 X29.749 Y181.415 E.0159
G1 X66.46 Y218.126 E1.54728
G1 X65.927 Y218.126 E.0159
G1 X29.749 Y181.948 E1.52479
G1 X29.749 Y182.482 E.0159
G1 X65.393 Y218.126 E1.5023
G1 X64.859 Y218.126 E.0159
G1 X29.749 Y183.016 E1.47982
G1 X29.749 Y183.549 E.0159
G1 X64.326 Y218.126 E1.45733
G1 X63.792 Y218.126 E.0159
G1 X29.749 Y184.083 E1.43484
G1 X29.749 Y184.616 E.0159
G1 X63.259 Y218.126 E1.41235
G1 X62.725 Y218.126 E.0159
G1 X29.749 Y185.15 E1.38986
G1 X29.749 Y185.683 E.0159
G1 X62.192 Y218.126 E1.36737
G1 X61.658 Y218.126 E.0159
G1 X29.749 Y186.217 E1.34488
G1 X29.749 Y186.751 E.0159
G1 X61.124 Y218.126 E1.32239
G1 X60.591 Y218.126 E.0159
G1 X29.749 Y187.284 E1.2999
G1 X29.749 Y187.818 E.0159
G1 X60.057 Y218.126 E1.27742
G1 X59.524 Y218.126 E.0159
G1 X29.749 Y188.351 E1.25493
G1 X29.749 Y188.885 E.0159
G1 X58.99 Y218.126 E1.23244
G1 X58.457 Y218.126 E.0159
G1 X29.749 Y189.418 E1.20995
G1 X29.749 Y189.952 E.0159
G1 X57.923 Y218.126 E1.18746
G1 X57.389 Y218.126 E.0159
G1 X29.749 Y190.486 E1.16497
G1 X29.749 Y191.019 E.0159
G1 X56.856 Y218.126 E1.14248
G1 X56.322 Y218.126 E.0159
G1 X29.749 Y191.553 E1.11999
G1 X29.749 Y192.086 E.0159
G1 X55.789 Y218.126 E1.0975
G1 X55.255 Y218.126 E.0159
G1 X29.749 Y192.62 E1.07502
G1 X29.749 Y193.153 E.0159
G1 X41.098 Y204.502 E.47831
G2 X40.414 Y204.352 I-1.104 J3.402 E.02088
G1 X29.749 Y193.687 E.44951
G1 X29.749 Y194.221 E.0159
G1 X39.857 Y204.328 E.42603
G2 X39.381 Y204.386 I.14 J3.165 E.01431
G1 X29.749 Y194.754 E.40596
G1 X29.749 Y195.288 E.0159
G1 X38.948 Y204.486 E.38769
G2 X38.558 Y204.63 I.527 J2.024 E.0124
G1 X29.749 Y195.821 E.37128
G1 X29.749 Y196.355 E.0159
G1 X38.206 Y204.811 E.35641
G2 X37.885 Y205.024 I.908 J1.711 E.01149
G1 X29.749 Y196.888 E.34291
G1 X29.749 Y197.422 E.0159
G1 X37.594 Y205.267 E.33063
G2 X37.331 Y205.537 I1.22 J1.448 E.01126
G1 X29.749 Y197.956 E.31955
G1 X29.749 Y198.489 E.0159
G1 X37.097 Y205.836 E.30967
G2 X36.892 Y206.165 I1.54 J1.187 E.01156
G1 X29.749 Y199.023 E.30104
G1 X29.749 Y199.556 E.0159
G1 X36.719 Y206.526 E.29376
G2 X36.582 Y206.922 I1.913 J.886 E.01252
G1 X29.749 Y200.09 E.28797
G1 X29.749 Y200.623 E.0159
G1 X36.487 Y207.36 E.28396
G2 X36.453 Y207.86 I2.481 J.419 E.01495
G1 X29.749 Y201.157 E.28253
G1 X29.749 Y201.691 E.0159
G1 X36.494 Y208.435 E.28428
G2 X36.697 Y209.172 I3.861 J-.667 E.0228
G1 X29.749 Y202.224 E.29283
G1 X29.749 Y202.758 E.0159
G1 X45.117 Y218.126 E.64773
G1 X45.651 Y218.126 E.0159
G1 X38.701 Y211.176 E.29291
G2 X39.437 Y211.378 I1.309 J-3.332 E.02276
G1 X46.184 Y218.126 E.28441
G1 X46.718 Y218.126 E.0159
G1 X40.015 Y211.423 E.2825
G2 X40.512 Y211.386 I.063 J-2.5 E.01486
G1 X47.252 Y218.126 E.28407
G1 X47.785 Y218.126 E.0159
G1 X40.955 Y211.295 E.28787
G2 X41.35 Y211.157 I-2.248 J-7.065 E.01248
G1 X48.319 Y218.126 E.2937
G1 X48.852 Y218.126 E.0159
G1 X41.71 Y210.984 E.30102
G2 X42.039 Y210.778 I-.864 J-1.746 E.01156
G1 X49.386 Y218.126 E.30968
G1 X49.919 Y218.126 E.0159
G1 X42.337 Y210.543 E.31957
G2 X42.607 Y210.28 I-1.183 J-1.484 E.01126
G1 X50.453 Y218.126 E.33067
G1 X50.987 Y218.126 E.0159
G1 X42.849 Y209.988 E.34297
G2 X43.062 Y209.667 I-1.5 J-1.225 E.01149
G1 X51.52 Y218.126 E.3565
G1 X52.054 Y218.126 E.0159
G1 X43.244 Y209.315 E.37133
G2 X43.391 Y208.929 I-1.857 J-.932 E.01234
G1 X52.587 Y218.126 E.3876
G1 X53.121 Y218.126 E.0159
G1 X43.493 Y208.498 E.40578
G2 X43.545 Y208.016 I-2.393 J-.498 E.01448
G1 X53.654 Y218.126 E.42611
G1 X54.188 Y218.126 E.0159
G1 X43.525 Y207.463 E.44942
G2 X43.377 Y206.78 I-4.09 J.534 E.02083
G1 X54.891 Y218.295 E.48532
G1 X44.753 Y218.295 F30000
G1 F9541.731
G1 X29.749 Y203.291 E.63239
G1 X29.749 Y203.825 E.0159
G1 X44.05 Y218.126 E.60275
G1 X43.517 Y218.126 E.0159
G1 X29.749 Y204.358 E.58026
G1 X29.749 Y204.892 E.0159
G1 X42.983 Y218.126 E.55777
G1 X42.449 Y218.126 E.0159
G1 X29.749 Y205.426 E.53528
G1 X29.749 Y205.959 E.0159
G1 X41.916 Y218.126 E.51279
G1 X41.382 Y218.126 E.0159
G1 X29.749 Y206.493 E.4903
G1 X29.749 Y207.026 E.0159
G1 X40.849 Y218.126 E.46781
G1 X40.315 Y218.126 E.0159
G1 X29.749 Y207.56 E.44533
G1 X29.749 Y208.093 E.0159
G1 X39.782 Y218.126 E.42284
G1 X39.248 Y218.126 E.0159
G1 X29.749 Y208.627 E.40035
G1 X29.749 Y209.16 E.0159
G1 X38.714 Y218.126 E.37786
G1 X38.181 Y218.126 E.0159
G1 X29.749 Y209.694 E.35537
G1 X29.749 Y210.228 E.0159
G1 X37.647 Y218.126 E.33288
G1 X37.114 Y218.126 E.0159
G1 X29.749 Y210.761 E.31039
G1 X29.749 Y211.295 E.0159
G1 X36.58 Y218.126 E.2879
G1 X36.047 Y218.126 E.0159
G1 X29.749 Y211.828 E.26541
G1 X29.749 Y212.362 E.0159
G1 X35.513 Y218.126 E.24293
G1 X34.98 Y218.126 E.0159
G1 X29.749 Y212.895 E.22044
G1 X29.749 Y213.429 E.0159
G1 X34.446 Y218.126 E.19795
G1 X33.912 Y218.126 E.0159
G1 X29.749 Y213.963 E.17546
G1 X29.749 Y214.496 E.0159
G1 X33.379 Y218.126 E.15297
G1 X32.845 Y218.126 E.0159
G1 X29.749 Y215.03 E.13048
G1 X29.749 Y215.563 E.0159
G1 X32.312 Y218.126 E.10799
G1 X31.778 Y218.126 E.0159
G1 X29.749 Y216.097 E.0855
G1 X29.749 Y216.63 E.0159
G1 X31.245 Y218.126 E.06301
G1 X30.711 Y218.126 E.0159
G1 X29.749 Y217.164 E.04053
G1 X29.749 Y217.698 E.0159
G1 X30.347 Y218.295 E.02519
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9541.731
G1 X29.749 Y217.698 E-.32116
G1 X29.749 Y217.164 E-.20276
G1 X30.189 Y217.603 E-.23608
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/15
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S102
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
G1 X128.946 Y204.802
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X129.176 Y204.88 E.0078
G3 X127.712 Y204.674 I-1.168 J2.996 E.60165
G3 X128.871 Y204.779 I.285 J3.279 E.03763
G1 X128.889 Y204.785 E.00058
G1 X128.428 Y205.1 F30000
G1 F8843.478
G1 X128.488 Y205.107 E.00194
G3 X128.761 Y205.17 I-.474 J2.705 E.00902
G3 X127.742 Y205.08 I-.753 J2.706 E.53445
G3 X128.21 Y205.073 I.272 J2.733 E.01505
G1 X128.369 Y205.092 E.00514
G1 X128.05 Y205.481 F30000
G1 F8843.478
G1 X128.179 Y205.481 E.00417
G3 X128.417 Y205.509 I-.177 J2.586 E.0077
G3 X127.773 Y205.485 I-.408 J2.366 E.46429
G1 X127.99 Y205.482 E.00697
G1 X127.817 Y205.876 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.15 Y205.872 E.00993
G3 X128.349 Y205.895 I-.149 J2.172 E.00597
G3 X127.757 Y205.882 I-.342 J1.979 E.35823
; WIPE_START
M204 S10000
G1 X128.15 Y205.872 E-.14939
G1 X128.349 Y205.895 E-.07615
G1 X128.734 Y206.004 E-.15213
G1 X129.091 Y206.186 E-.15212
G1 X129.404 Y206.436 E-.15209
G1 X129.536 Y206.593 E-.07812
; WIPE_END
G1 E-.04 F1800
G1 X137.167 Y206.437 Z1.2 F30000
G1 X216.944 Y204.802 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X217.176 Y204.879 E.00784
G3 X215.712 Y204.674 I-1.168 J2.996 E.60166
G3 X216.871 Y204.779 I.285 J3.279 E.03763
G1 X216.887 Y204.784 E.00053
G1 X216.427 Y205.1 F30000
G1 F8843.478
G1 X216.488 Y205.107 E.00197
G3 X216.761 Y205.17 I-.474 J2.706 E.00902
G3 X215.742 Y205.08 I-.753 J2.706 E.53437
G3 X216.21 Y205.073 I.272 J2.733 E.01506
G1 X216.368 Y205.092 E.00511
G1 X216.049 Y205.481 F30000
G1 F8843.478
G1 X216.179 Y205.481 E.0042
G3 X216.417 Y205.509 I-.177 J2.586 E.0077
G3 X215.773 Y205.485 I-.408 J2.366 E.46429
G1 X215.989 Y205.482 E.00694
G1 X215.791 Y205.878 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X215.802 Y205.876 E.00032
G3 X216.349 Y205.895 I.199 J2.168 E.01634
G3 X215.553 Y205.918 I-.342 J1.979 E.35206
G1 X215.732 Y205.888 E.00541
; WIPE_START
M204 S10000
G1 X215.802 Y205.876 E-.02693
G1 X216.15 Y205.87 E-.13224
G1 X216.349 Y205.895 E-.07618
G1 X216.734 Y206.004 E-.1521
G1 X217.091 Y206.186 E-.15215
G1 X217.404 Y206.436 E-.1521
G1 X217.519 Y206.574 E-.06831
; WIPE_END
G1 E-.04 F1800
G1 X217.356 Y198.943 Z1.2 F30000
G1 X215.863 Y129.213 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X215.6 Y129.189 E.00847
G3 X215.712 Y122.799 I.408 J-3.189 E.30214
G3 X217.176 Y123.005 I.285 J3.28 E.04794
G3 X215.923 Y129.214 I-1.168 J2.996 E.28912
G1 X215.892 Y128.807 F30000
G1 F8843.478
G1 X215.651 Y128.786 E.00778
G3 X215.743 Y123.205 I.358 J-2.786 E.26363
G3 X216.761 Y123.295 I.271 J2.736 E.03307
G3 X215.952 Y128.808 I-.753 J2.706 E.26104
G1 X215.904 Y128.398 F30000
G1 F8843.478
G1 X215.466 Y128.338 E.01421
G3 X215.773 Y123.61 I.543 J-2.339 E.21732
G3 X216.417 Y123.634 I.229 J2.581 E.02078
G3 X215.964 Y128.4 I-.408 J2.366 E.23082
G1 X215.878 Y128.001 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X215.553 Y127.956 E.00975
G3 X215.802 Y124.001 I.454 J-1.957 E.16822
G3 X216.349 Y124.02 I.199 J2.167 E.01634
G3 X215.95 Y128.007 I-.342 J1.979 E.17943
G1 X215.938 Y128.006 E.00037
; WIPE_START
M204 S10000
G1 X215.553 Y127.956 E-.14719
G1 X215.36 Y127.906 E-.07611
G1 X214.995 Y127.741 E-.15207
G1 X214.67 Y127.507 E-.15216
G1 X214.398 Y127.214 E-.15212
G1 X214.287 Y127.033 E-.08035
; WIPE_END
G1 E-.04 F1800
G1 X214.308 Y119.401 Z1.2 F30000
G1 X214.519 Y41.272 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X214.679 Y41.197 E.00567
G3 X215.712 Y40.924 I1.329 J2.928 E.03453
G3 X217.176 Y41.129 I.285 J3.28 E.04793
G3 X214.394 Y41.344 I-1.168 J2.996 E.55683
G1 X214.467 Y41.302 E.0027
G1 X215.005 Y41.5 F30000
G1 F8843.478
G1 X215.106 Y41.466 E.00343
G3 X215.743 Y41.33 I.902 J2.66 E.02097
G3 X216.761 Y41.42 I.271 J2.735 E.03308
G3 X214.846 Y41.569 I-.753 J2.706 E.5045
G1 X214.95 Y41.524 E.00364
G1 X215.432 Y41.794 F30000
G1 F8843.478
G1 X215.466 Y41.786 E.00113
G3 X215.773 Y41.735 I.543 J2.339 E.01001
G3 X216.417 Y41.759 I.229 J2.581 E.02078
G3 X215.014 Y41.94 I-.408 J2.366 E.4389
G1 X215.375 Y41.814 E.0123
G1 X215.798 Y42.127 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X215.802 Y42.126 E.00014
G3 X216.349 Y42.145 I.199 J2.167 E.01634
G3 X215.553 Y42.168 I-.342 J1.979 E.35206
G1 X215.739 Y42.137 E.0056
; WIPE_START
M204 S10000
G1 X215.802 Y42.126 E-.02453
G1 X216.15 Y42.12 E-.13224
G1 X216.349 Y42.145 E-.07617
G1 X216.544 Y42.19 E-.07616
G1 X216.917 Y42.336 E-.15216
G1 X217.253 Y42.553 E-.15209
G1 X217.53 Y42.823 E-.14665
; WIPE_END
G1 E-.04 F1800
G1 X209.898 Y42.693 Z1.2 F30000
G1 X126.52 Y41.272 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X126.679 Y41.198 E.00566
G3 X127.712 Y40.924 I1.329 J2.928 E.03453
G3 X129.176 Y41.129 I.285 J3.281 E.04794
G3 X126.395 Y41.344 I-1.168 J2.996 E.55684
G1 X126.468 Y41.302 E.00271
G1 X127.006 Y41.5 F30000
G1 F8843.478
G1 X127.106 Y41.466 E.00342
G3 X127.743 Y41.33 I.902 J2.66 E.02097
G3 X128.761 Y41.42 I.271 J2.735 E.03307
G3 X126.846 Y41.569 I-.753 J2.706 E.5045
G1 X126.951 Y41.524 E.00365
G1 X127.432 Y41.794 F30000
G1 F8843.478
G1 X127.466 Y41.786 E.00112
G3 X127.773 Y41.735 I.543 J2.339 E.01
G3 X128.417 Y41.759 I.229 J2.581 E.02078
G3 X127.014 Y41.94 I-.408 J2.366 E.4389
G1 X127.375 Y41.813 E.01231
G1 X127.798 Y42.127 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X127.802 Y42.126 E.00013
G3 X128.349 Y42.145 I.199 J2.167 E.01634
G3 X127.553 Y42.168 I-.342 J1.979 E.35206
G1 X127.739 Y42.137 E.0056
; WIPE_START
M204 S10000
G1 X127.802 Y42.126 E-.02451
G1 X128.15 Y42.12 E-.13223
G1 X128.349 Y42.145 E-.07618
G1 X128.734 Y42.254 E-.15213
G1 X128.917 Y42.336 E-.07614
G1 X129.253 Y42.553 E-.15212
G1 X129.53 Y42.823 E-.14668
; WIPE_END
G1 E-.04 F1800
G1 X121.899 Y42.67 Z1.2 F30000
G1 X40.944 Y41.052 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.176 Y41.129 E.00785
G3 X39.712 Y40.924 I-1.168 J2.996 E.60166
G3 X40.871 Y41.029 I.285 J3.281 E.03762
G1 X40.887 Y41.034 E.00054
G1 X40.427 Y41.35 F30000
G1 F8843.478
G1 X40.488 Y41.357 E.00196
G3 X40.761 Y41.42 I-.474 J2.707 E.00902
G3 X39.743 Y41.33 I-.753 J2.706 E.53446
G3 X40.21 Y41.323 I.271 J2.735 E.01505
G1 X40.368 Y41.342 E.00511
G1 X40.049 Y41.731 F30000
G1 F8843.478
G1 X40.179 Y41.731 E.00419
G3 X40.417 Y41.759 I-.177 J2.585 E.0077
G3 X39.773 Y41.735 I-.408 J2.366 E.46429
G1 X39.989 Y41.732 E.00695
G1 X39.803 Y42.126 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X40.15 Y42.122 E.01034
G3 X40.349 Y42.145 I-.149 J2.171 E.00597
G3 X39.743 Y42.133 I-.342 J1.979 E.35781
; WIPE_START
M204 S10000
G1 X40.15 Y42.122 E-.15463
G1 X40.349 Y42.145 E-.07614
G1 X40.734 Y42.254 E-.15213
G1 X40.917 Y42.336 E-.07614
G1 X41.253 Y42.553 E-.15212
G1 X41.534 Y42.827 E-.14883
; WIPE_END
G1 E-.04 F1800
G1 X47.088 Y48.062 Z1.2 F30000
G1 X205.416 Y197.291 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X50.584 Y197.291 E4.97885
G1 X50.584 Y54.709 E4.58493
G1 X205.416 Y54.709 E4.97885
G1 X205.416 Y197.231 E4.583
G1 X205.009 Y196.884 F30000
G1 F8843.478
G1 X50.991 Y196.884 E4.95267
G1 X50.991 Y55.116 E4.55875
G1 X205.009 Y55.116 E4.95267
G1 X205.009 Y196.824 E4.55682
G1 X204.602 Y196.477 F30000
G1 F8843.478
G1 X51.398 Y196.477 E4.92649
G1 X51.398 Y55.523 E4.53257
G1 X204.602 Y55.523 E4.92649
G1 X204.602 Y196.417 E4.53064
G1 X204.21 Y196.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X51.79 Y196.085 E4.54007
G1 X51.79 Y55.915 E4.17519
G1 X204.21 Y55.915 E4.54007
G1 X204.21 Y196.025 E4.1734
; WIPE_START
M204 S10000
G1 X202.21 Y196.026 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X195.237 Y192.921 Z1.2 F30000
G1 X38.52 Y123.147 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X38.679 Y123.072 E.00566
G3 X39.712 Y122.799 I1.329 J2.928 E.03453
G3 X41.176 Y123.004 I.285 J3.281 E.04793
G3 X38.395 Y123.219 I-1.168 J2.996 E.55684
G1 X38.468 Y123.177 E.00271
G1 X39.006 Y123.375 F30000
G1 F8843.478
G1 X39.106 Y123.341 E.00342
G3 X39.743 Y123.205 I.902 J2.66 E.02097
G3 X40.761 Y123.295 I.271 J2.735 E.03307
G3 X38.846 Y123.444 I-.753 J2.706 E.5045
G1 X38.951 Y123.399 E.00365
G1 X39.432 Y123.669 F30000
G1 F8843.478
G1 X39.466 Y123.661 E.00112
G3 X39.773 Y123.61 I.543 J2.339 E.01001
G3 X40.417 Y123.634 I.229 J2.581 E.02078
G3 X39.014 Y123.815 I-.408 J2.366 E.4389
G1 X39.376 Y123.688 E.01232
G1 X39.798 Y124.002 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X39.802 Y124.001 E.00013
G3 X40.349 Y124.02 I.199 J2.168 E.01634
G3 X39.553 Y124.043 I-.342 J1.979 E.35206
G1 X39.739 Y124.012 E.0056
; WIPE_START
M204 S10000
G1 X39.802 Y124.001 E-.02451
G1 X40.15 Y123.995 E-.13223
G1 X40.349 Y124.02 E-.0762
G1 X40.734 Y124.129 E-.15212
G1 X41.091 Y124.311 E-.15209
G1 X41.404 Y124.561 E-.15213
G1 X41.53 Y124.697 E-.07072
; WIPE_END
G1 E-.04 F1800
G1 X41.474 Y132.33 Z1.2 F30000
G1 X40.944 Y204.802 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.176 Y204.88 E.00785
G3 X39.712 Y204.674 I-1.168 J2.996 E.60165
G3 X40.871 Y204.779 I.285 J3.279 E.03763
G1 X40.887 Y204.784 E.00053
G1 X40.427 Y205.1 F30000
M73 P41 R45
G1 F8843.478
G1 X40.488 Y205.107 E.00197
G3 X40.761 Y205.17 I-.474 J2.705 E.00902
G3 X39.742 Y205.08 I-.753 J2.706 E.53445
G3 X40.21 Y205.073 I.272 J2.733 E.01505
G1 X40.368 Y205.092 E.00511
G1 X40.049 Y205.481 F30000
G1 F8843.478
G1 X40.179 Y205.481 E.0042
G3 X40.417 Y205.509 I-.177 J2.586 E.0077
G3 X39.773 Y205.485 I-.408 J2.366 E.46429
G1 X39.989 Y205.482 E.00694
G1 X39.791 Y205.878 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X39.802 Y205.876 E.00034
G3 X40.349 Y205.895 I.199 J2.168 E.01634
G3 X39.553 Y205.918 I-.342 J1.979 E.35206
G1 X39.732 Y205.888 E.00539
; WIPE_START
M204 S10000
G1 X39.802 Y205.876 E-.02709
G1 X40.15 Y205.87 E-.13223
G1 X40.349 Y205.895 E-.07619
G1 X40.734 Y206.004 E-.15213
G1 X41.091 Y206.186 E-.15212
G1 X41.404 Y206.436 E-.15209
G1 X41.519 Y206.573 E-.06814
; WIPE_END
G1 E-.04 F1800
G1 X49.136 Y207.062 Z1.2 F30000
G1 X226.584 Y218.459 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X29.416 Y218.459 E6.34019
G1 X29.416 Y33.541 E5.94628
G1 X226.584 Y33.541 E6.34019
G1 X226.584 Y218.399 E5.94435
G1 X226.991 Y218.866 F30000
G1 F8843.478
G1 X29.009 Y218.866 E6.36637
G1 X29.009 Y33.134 E5.97246
G1 X226.991 Y33.134 E6.36637
G1 X226.991 Y218.806 E5.97053
G1 X227.398 Y219.273 F30000
G1 F8843.478
G1 X28.602 Y219.273 E6.39255
G1 X28.602 Y32.727 E5.99864
G1 X227.398 Y32.727 E6.39255
G1 X227.398 Y219.213 E5.99671
G1 X227.79 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X28.21 Y219.665 E5.94481
G1 X28.21 Y32.335 E5.57992
G1 X227.79 Y32.335 E5.94481
G1 X227.79 Y219.605 E5.57813
; WIPE_START
M204 S10000
G1 X225.79 Y219.606 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X226.236 Y216.116 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X226.236 Y217.744 E.05236
G1 X225.868 Y218.111 E.01669
G1 X218.328 Y210.571 E.34285
G3 X215.334 Y211.375 I-2.365 J-2.833 E.10288
G1 X208.597 Y218.111 E.30636
G1 X188.126 Y197.639 E.93094
G1 X188.771 Y197.639 E.02075
G1 X168.298 Y218.111 E.93098
G1 X147.827 Y197.639 E.93094
G1 X148.472 Y197.639 E.02075
G1 X127.999 Y218.111 E.93098
G1 X107.528 Y197.639 E.93094
G1 X108.173 Y197.639 E.02075
G1 X87.7 Y218.111 E.93098
G1 X67.229 Y197.639 E.93094
G1 X67.874 Y197.639 E.02075
G1 X47.403 Y218.111 E.93094
G1 X40.667 Y211.376 E.30628
G3 X37.67 Y210.573 I-.625 J-3.663 E.10295
G1 X30.132 Y218.111 E.34277
G1 X29.764 Y217.744 E.01669
G1 X29.764 Y216.116 E.05236
G1 X36.564 Y208.821 F30000
G1 F8843.478
G3 X36.5 Y207.209 I4.085 J-.969 E.0522
G1 X29.764 Y200.473 E.30632
G1 X29.764 Y201.208 E.02361
G1 X50.236 Y180.737 E.93094
G1 X50.236 Y180.646 E.00292
G1 X29.764 Y160.175 E.93094
G1 X29.764 Y160.909 E.02361
G1 X50.236 Y140.438 E.93094
M73 P41 R44
G1 X50.236 Y140.347 E.00292
G1 X39.4 Y129.511 E.49276
G3 X38.441 Y129.204 I1.285 J-5.655 E.03241
G1 X29.764 Y137.881 E.39459
G1 X29.764 Y137.147 E.02361
G1 X50.236 Y157.618 E.93094
G1 X50.236 Y157.709 E.00292
G1 X29.764 Y178.18 E.93094
G1 X29.764 Y177.446 E.02361
G1 X70.429 Y218.111 E1.84928
G1 X90.902 Y197.639 E.93098
G1 X90.257 Y197.639 E.02075
G1 X110.728 Y218.111 E.93094
G1 X131.201 Y197.639 E.93098
G1 X130.556 Y197.639 E.02075
G1 X151.027 Y218.111 E.93094
G1 X171.5 Y197.639 E.93098
G1 X170.855 Y197.639 E.02075
G1 X191.328 Y218.111 E.93098
G1 X226.236 Y183.203 E1.58747
G1 X226.236 Y183.937 E.02361
G1 X205.764 Y163.466 E.93094
G1 X205.764 Y163.375 E.00292
G1 X226.236 Y142.904 E.93094
G1 X226.236 Y143.638 E.02361
G1 X205.764 Y123.167 E.93094
G1 X205.764 Y123.076 E.00292
G1 X226.236 Y102.605 E.93094
G1 X226.236 Y103.339 E.02361
G1 X205.764 Y82.868 E.93094
G1 X205.764 Y82.777 E.00292
G1 X226.236 Y62.306 E.93094
G1 X226.236 Y63.04 E.02361
G1 X197.085 Y33.889 E1.32567
G1 X176.612 Y54.361 E.93098
G1 X177.257 Y54.361 E.02075
G1 X156.786 Y33.889 E.93094
G1 X136.313 Y54.361 E.93098
G1 X136.958 Y54.361 E.02075
G1 X129.798 Y47.2 E.32562
G3 X126.2 Y47.203 I-1.801 J-3.19 E.12095
G1 X119.042 Y54.361 E.3255
G1 X119.687 Y54.361 E.02075
G1 X99.214 Y33.889 E.93098
G1 X78.743 Y54.361 E.93094
G1 X79.388 Y54.361 E.02075
G1 X58.915 Y33.889 E.93098
G1 X29.764 Y63.04 E1.32567
G1 X29.764 Y62.306 E.02361
G1 X50.236 Y82.777 E.93094
G1 X50.236 Y82.868 E.00292
G1 X29.764 Y103.339 E.93094
G1 X29.764 Y102.605 E.02361
G1 X50.236 Y123.076 E.93094
G1 X50.236 Y123.167 E.00292
G1 X29.764 Y143.638 E.93094
G1 X29.764 Y142.904 E.02361
G1 X50.236 Y163.375 E.93094
G1 X50.236 Y163.466 E.00292
G1 X29.764 Y183.937 E.93094
G1 X29.764 Y183.203 E.02361
G1 X64.672 Y218.111 E1.58747
G1 X85.145 Y197.639 E.93098
G1 X84.5 Y197.639 E.02075
G1 X104.971 Y218.111 E.93094
G1 X125.444 Y197.639 E.93098
G1 X124.799 Y197.639 E.02075
G1 X145.27 Y218.111 E.93094
G1 X165.743 Y197.639 E.93098
G1 X165.098 Y197.639 E.02075
G1 X185.571 Y218.111 E.93098
G1 X226.236 Y177.446 E1.84928
G1 X226.236 Y178.18 E.02361
G1 X205.764 Y157.709 E.93094
G1 X205.764 Y157.618 E.00292
G1 X226.236 Y137.147 E.93094
G1 X226.236 Y137.881 E.02361
G1 X217.559 Y129.205 E.39457
G3 X216.596 Y129.515 I-2.543 J-6.23 E.03257
G1 X205.764 Y140.347 E.49258
G1 X205.764 Y140.438 E.00292
G1 X226.236 Y160.909 E.93094
G1 X226.236 Y160.175 E.02361
G1 X205.764 Y180.646 E.93094
G1 X205.764 Y180.737 E.00292
G1 X226.236 Y201.208 E.93094
G1 X226.236 Y200.473 E.02361
G1 X219.502 Y207.207 E.30622
G3 X219.435 Y208.82 I-3.566 J.661 E.05233
; WIPE_START
G1 X219.567 Y207.875 E-.36237
G1 X219.502 Y207.207 E-.25496
G1 X219.767 Y206.942 E-.14267
; WIPE_END
G1 E-.04 F1800
G1 X214.982 Y204.461 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
G1 F8843.478
G3 X216.593 Y204.359 I1.028 J3.467 E.05235
G1 X226.236 Y194.716 E.43851
G1 X226.236 Y195.451 E.02361
G1 X205.764 Y174.98 E.93094
G1 X205.764 Y174.889 E.00292
G1 X226.236 Y154.418 E.93094
G1 X226.236 Y155.152 E.02361
G1 X205.764 Y134.681 E.93094
G1 X205.764 Y134.59 E.00292
G1 X212.794 Y127.561 E.31966
G3 X212.794 Y124.439 I3.243 J-1.561 E.10382
G1 X205.764 Y117.41 E.31966
G1 X205.764 Y117.319 E.00292
G1 X226.236 Y96.848 E.93094
G1 X226.236 Y97.582 E.02361
G1 X205.764 Y77.111 E.93094
G1 X205.764 Y77.02 E.00292
G1 X226.236 Y56.549 E.93094
G1 X226.236 Y57.284 E.02361
G1 X216.593 Y47.641 E.43851
G3 X214.982 Y47.539 I-.582 J-3.583 E.05233
; WIPE_START
G1 X215.911 Y47.691 E-.35766
G1 X216.593 Y47.641 E-.2597
G1 X216.858 Y47.906 E-.14264
; WIPE_END
G1 E-.04 F1800
G1 X219.435 Y43.18 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
G1 F8843.478
G3 X219.502 Y44.793 I-3.499 J.952 E.05233
G1 X226.236 Y51.527 E.30622
G1 X226.236 Y50.792 E.02361
G1 X205.764 Y71.263 E.93094
G1 X205.764 Y71.354 E.00292
G1 X226.236 Y91.825 E.93094
G1 X226.236 Y91.091 E.02361
G1 X205.764 Y111.562 E.93094
G1 X205.764 Y111.653 E.00292
G1 X216.596 Y122.485 E.49258
G3 X217.559 Y122.795 I-1.581 J6.545 E.03257
G1 X226.236 Y114.119 E.39457
G1 X226.236 Y114.853 E.02361
G1 X205.764 Y94.382 E.93094
G1 X205.764 Y94.291 E.00292
G1 X226.236 Y73.82 E.93094
G1 X226.236 Y74.554 E.02361
G1 X185.571 Y33.889 E1.84928
G1 X165.098 Y54.361 E.93098
G1 X165.743 Y54.361 E.02075
G1 X145.272 Y33.889 E.93094
G1 X124.799 Y54.361 E.93098
G1 X125.444 Y54.361 E.02075
G1 X104.973 Y33.889 E.93094
G1 X84.5 Y54.361 E.93098
G1 X85.145 Y54.361 E.02075
G1 X64.672 Y33.889 E.93098
G1 X29.764 Y68.797 E1.58747
G1 X29.764 Y68.063 E.02361
G1 X50.236 Y88.534 E.93094
G1 X50.236 Y88.625 E.00292
G1 X29.764 Y109.096 E.93094
G1 X29.764 Y108.362 E.02361
G1 X50.236 Y128.833 E.93094
G1 X50.236 Y128.924 E.00292
G1 X29.764 Y149.395 E.93094
G1 X29.764 Y148.661 E.02361
G1 X50.236 Y169.132 E.93094
G1 X50.236 Y169.223 E.00292
G1 X29.764 Y189.694 E.93094
G1 X29.764 Y188.96 E.02361
G1 X58.915 Y218.111 E1.32567
G1 X79.388 Y197.639 E.93098
G1 X78.743 Y197.639 E.02075
G1 X99.214 Y218.111 E.93094
G1 X119.687 Y197.639 E.93098
G1 X119.042 Y197.639 E.02075
G1 X126.2 Y204.797 E.3255
G3 X129.798 Y204.8 I1.797 J3.165 E.12102
G1 X136.958 Y197.639 E.32562
G1 X136.313 Y197.639 E.02075
G1 X156.786 Y218.111 E.93098
G1 X177.257 Y197.639 E.93094
G1 X176.612 Y197.639 E.02075
G1 X197.085 Y218.111 E.93098
G1 X226.236 Y188.96 E1.32567
G1 X226.236 Y189.694 E.02361
G1 X205.764 Y169.223 E.93094
G1 X205.764 Y169.132 E.00292
G1 X226.236 Y148.661 E.93094
G1 X226.236 Y149.395 E.02361
G1 X205.764 Y128.924 E.93094
G1 X205.764 Y128.833 E.00292
G1 X226.236 Y108.362 E.93094
G1 X226.236 Y109.096 E.02361
G1 X205.764 Y88.625 E.93094
G1 X205.764 Y88.534 E.00292
G1 X226.236 Y68.063 E.93094
G1 X226.236 Y68.797 E.02361
G1 X191.328 Y33.889 E1.58747
G1 X170.855 Y54.361 E.93098
G1 X171.5 Y54.361 E.02075
G1 X151.029 Y33.889 E.93094
G1 X130.556 Y54.361 E.93098
G1 X131.201 Y54.361 E.02075
G1 X110.73 Y33.889 E.93094
G1 X90.257 Y54.361 E.93098
G1 X90.902 Y54.361 E.02075
G1 X70.429 Y33.889 E.93098
G1 X29.764 Y74.554 E1.84928
G1 X29.764 Y73.82 E.02361
G1 X50.236 Y94.291 E.93094
G1 X50.236 Y94.382 E.00292
G1 X29.764 Y114.853 E.93094
G1 X29.764 Y114.119 E.02361
G1 X38.441 Y122.796 E.39459
G3 X39.395 Y122.494 I2.091 J4.945 E.0322
G1 X50.236 Y111.653 E.493
G1 X50.236 Y111.562 E.00292
G1 X29.764 Y91.091 E.93094
G1 X29.764 Y91.825 E.02361
G1 X50.236 Y71.354 E.93094
G1 X50.236 Y71.263 E.00292
G1 X29.764 Y50.792 E.93094
G1 X29.764 Y51.527 E.02361
G1 X36.5 Y44.791 E.30632
G3 X36.564 Y43.179 I4.148 J-.643 E.0522
; WIPE_START
G1 X36.438 Y43.947 E-.29591
G1 X36.5 Y44.791 E-.32142
M73 P42 R44
G1 X36.235 Y45.056 E-.14267
; WIPE_END
G1 E-.04 F1800
G1 X41.02 Y47.54 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
G1 F8843.478
G3 X39.41 Y47.638 I-1.056 J-4.073 E.0522
G1 X29.764 Y57.283 E.43863
G1 X29.764 Y56.549 E.02361
G1 X50.236 Y77.02 E.93094
G1 X50.236 Y77.111 E.00292
G1 X29.764 Y97.582 E.93094
G1 X29.764 Y96.848 E.02361
G1 X50.236 Y117.319 E.93094
G1 X50.236 Y117.41 E.00292
G1 X43.203 Y124.442 E.31979
G3 X43.203 Y127.558 I-3.341 J1.558 E.10345
G1 X50.236 Y134.59 E.31979
G1 X50.236 Y134.681 E.00292
G1 X29.764 Y155.152 E.93094
G1 X29.764 Y154.418 E.02361
G1 X50.236 Y174.889 E.93094
G1 X50.236 Y174.98 E.00292
G1 X29.764 Y195.451 E.93094
G1 X29.764 Y194.716 E.02361
G1 X39.414 Y204.366 E.43882
G3 X41.024 Y204.461 I.569 J4.041 E.0522
G1 X52.232 Y197.639 F30000
G1 F8843.478
G1 X50.604 Y197.639 E.05236
G1 X42.698 Y205.545 E.35952
G3 X43.513 Y208.465 I-2.854 J2.371 E.10044
G1 X53.16 Y218.111 E.43866
G1 X73.631 Y197.639 E.93094
G1 X72.986 Y197.639 E.02075
G1 X93.459 Y218.111 E.93098
G1 X113.93 Y197.639 E.93094
G1 X113.285 Y197.639 E.02075
G1 X124.607 Y208.962 E.5149
G2 X124.923 Y209.674 I3.531 J-1.141 E.0251
G1 X116.485 Y218.111 E.3837
G1 X96.014 Y197.639 E.93094
G1 X96.659 Y197.639 E.02075
G1 X76.186 Y218.111 E.93098
G1 X55.715 Y197.639 E.93094
G1 X56.36 Y197.639 E.02075
G1 X35.889 Y218.111 E.93094
G1 X29.764 Y211.987 E.2785
G1 X29.764 Y212.722 E.02361
G1 X50.236 Y192.251 E.93094
G1 X50.236 Y192.16 E.00292
G1 X29.764 Y171.689 E.93094
G1 X29.764 Y172.423 E.02361
G1 X50.236 Y151.952 E.93094
G1 X50.236 Y151.861 E.00292
G1 X29.764 Y131.39 E.93094
G1 X29.764 Y132.124 E.02361
G1 X36.487 Y125.402 E.3057
G2 X36.487 Y126.598 I3.637 J.598 E.03864
G1 X29.764 Y119.876 E.3057
G1 X29.764 Y120.61 E.02361
G1 X50.236 Y100.139 E.93094
G1 X50.236 Y100.048 E.00292
G1 X29.764 Y79.577 E.93094
G1 X29.764 Y80.311 E.02361
G1 X50.236 Y59.84 E.93094
G1 X50.236 Y59.749 E.00292
G1 X29.764 Y39.278 E.93094
G1 X29.764 Y40.013 E.02361
G1 X35.889 Y33.889 E.2785
G1 X56.361 Y54.361 E.93094
G1 X55.715 Y54.361 E.02075
G1 X76.186 Y33.889 E.93094
G1 X96.659 Y54.361 E.93098
G1 X96.014 Y54.361 E.02075
G1 X116.485 Y33.889 E.93094
G1 X124.924 Y42.326 E.3837
G2 X124.607 Y43.038 I3.206 J1.849 E.0251
G1 X113.285 Y54.361 E.5149
G1 X113.93 Y54.361 E.02075
G1 X93.459 Y33.889 E.93094
G1 X72.986 Y54.361 E.93098
G1 X73.631 Y54.361 E.02075
G1 X53.16 Y33.889 E.93094
G1 X43.513 Y43.535 E.43866
G3 X42.698 Y46.455 I-3.67 J.549 E.10044
G1 X50.604 Y54.361 E.35952
G1 X52.232 Y54.361 E.05236
; WIPE_START
G1 X50.604 Y54.361 E-.61876
G1 X50.341 Y54.098 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X44.626 Y49.039 Z1.2 F30000
G1 X29.764 Y35.884 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F8843.478
G1 X29.764 Y34.256 E.05236
G1 X30.132 Y33.889 E.01669
G1 X37.67 Y41.427 E.34277
G3 X40.667 Y40.624 I2.397 J2.951 E.10279
G1 X47.403 Y33.889 E.30628
G1 X67.874 Y54.361 E.93094
G1 X67.229 Y54.361 E.02075
G1 X87.7 Y33.889 E.93094
G1 X108.173 Y54.361 E.93098
G1 X107.528 Y54.361 E.02075
G1 X127.999 Y33.889 E.93094
G1 X148.472 Y54.361 E.93098
G1 X147.827 Y54.361 E.02075
G1 X168.298 Y33.889 E.93094
G1 X188.771 Y54.361 E.93098
G1 X188.126 Y54.361 E.02075
G1 X208.597 Y33.889 E.93094
G1 X215.337 Y40.628 E.30647
G3 X218.328 Y41.429 I.634 J3.621 E.1028
G1 X225.868 Y33.889 E.34285
G1 X226.236 Y34.256 E.01669
G1 X226.236 Y35.884 E.05236
; WIPE_START
G1 X226.236 Y34.256 E-.61876
G1 X225.972 Y33.993 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X220.347 Y39.153 Z1.2 F30000
G1 X203.768 Y54.361 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F8843.478
G1 X205.396 Y54.361 E.05236
G1 X213.304 Y46.453 E.35958
G3 X212.485 Y43.533 I2.849 J-2.373 E.10046
G1 X202.84 Y33.889 E.4386
G1 X182.369 Y54.361 E.93094
G1 X183.014 Y54.361 E.02075
G1 X162.541 Y33.889 E.93098
G1 X142.07 Y54.361 E.93094
G1 X142.715 Y54.361 E.02075
G1 X131.397 Y43.042 E.51471
G2 X131.076 Y42.327 I-3.655 J1.21 E.02526
G1 X139.515 Y33.889 E.38373
G1 X159.986 Y54.361 E.93094
G1 X159.341 Y54.361 E.02075
G1 X179.814 Y33.889 E.93098
G1 X200.285 Y54.361 E.93094
G1 X199.64 Y54.361 E.02075
G1 X220.111 Y33.889 E.93094
G1 X226.236 Y40.013 E.2785
G1 X226.236 Y39.278 E.02361
G1 X205.764 Y59.749 E.93094
G1 X205.764 Y59.84 E.00292
G1 X226.236 Y80.311 E.93094
G1 X226.236 Y79.577 E.02361
G1 X205.764 Y100.048 E.93094
G1 X205.764 Y100.139 E.00292
G1 X226.236 Y120.61 E.93094
G1 X226.236 Y119.876 E.02361
G1 X219.512 Y126.599 E.30575
G2 X219.512 Y125.401 I-4.864 J-.599 E.03864
G1 X226.236 Y132.124 E.30575
G1 X226.236 Y131.39 E.02361
G1 X205.764 Y151.861 E.93094
G1 X205.764 Y151.952 E.00292
G1 X226.236 Y172.423 E.93094
G1 X226.236 Y171.689 E.02361
G1 X205.764 Y192.16 E.93094
G1 X205.764 Y192.251 E.00292
G1 X226.236 Y212.722 E.93094
G1 X226.236 Y211.987 E.02361
G1 X220.111 Y218.111 E.2785
G1 X199.639 Y197.639 E.93094
G1 X200.285 Y197.639 E.02075
G1 X179.814 Y218.111 E.93094
G1 X159.341 Y197.639 E.93098
G1 X159.986 Y197.639 E.02075
G1 X139.515 Y218.111 E.93094
G1 X131.076 Y209.673 E.38373
G2 X131.397 Y208.958 I-3.338 J-1.927 E.02527
G1 X142.715 Y197.639 E.51471
G1 X142.07 Y197.639 E.02075
G1 X162.541 Y218.111 E.93094
G1 X183.014 Y197.639 E.93098
G1 X182.369 Y197.639 E.02075
G1 X202.84 Y218.111 E.93094
G1 X212.485 Y208.467 E.43861
G3 X213.304 Y205.547 I3.667 J-.547 E.10046
G1 X205.396 Y197.639 E.35958
G1 X203.768 Y197.639 E.05236
; WIPE_START
G1 X205.396 Y197.639 E-.61876
G1 X205.659 Y197.902 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X198.119 Y199.082 Z1.2 F30000
G1 X125.531 Y210.443 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F8843.478
G2 X126.916 Y211.271 I2.813 J-3.135 E.0522
G1 X133.758 Y218.111 E.3111
G1 X154.229 Y197.639 E.93094
G1 X153.584 Y197.639 E.02075
G1 X174.055 Y218.111 E.93094
G1 X194.528 Y197.639 E.93098
G1 X193.883 Y197.639 E.02075
G1 X214.354 Y218.111 E.93094
G1 X226.236 Y206.23 E.5403
G1 X226.236 Y206.965 E.02361
G1 X205.764 Y186.494 E.93094
G1 X205.764 Y186.403 E.00292
G1 X226.236 Y165.932 E.93094
G1 X226.236 Y166.666 E.02361
G1 X205.764 Y146.195 E.93094
G1 X205.764 Y146.104 E.00292
G1 X226.236 Y125.633 E.93094
G1 X226.236 Y126.367 E.02361
G1 X205.764 Y105.896 E.93094
G1 X205.764 Y105.805 E.00292
G1 X226.236 Y85.334 E.93094
G1 X226.236 Y86.068 E.02361
G1 X205.764 Y65.597 E.93094
G1 X205.764 Y65.506 E.00292
G1 X226.236 Y45.035 E.93094
G1 X226.236 Y45.77 E.02361
G1 X214.354 Y33.889 E.5403
G1 X193.883 Y54.361 E.93094
G1 X194.528 Y54.361 E.02075
G1 X174.055 Y33.889 E.93098
G1 X153.584 Y54.361 E.93094
G1 X154.229 Y54.361 E.02075
G1 X133.758 Y33.889 E.93094
G1 X126.916 Y40.729 E.3111
G3 X129.087 Y40.732 I1.081 J3.42 E.07091
G1 X122.242 Y33.889 E.31122
G1 X101.771 Y54.361 E.93094
G1 X102.416 Y54.361 E.02075
G1 X81.945 Y33.889 E.93094
G1 X61.472 Y54.361 E.93098
G1 X62.117 Y54.361 E.02075
G1 X41.646 Y33.889 E.93094
G1 X29.764 Y45.77 E.5403
G1 X29.764 Y45.035 E.02361
G1 X50.236 Y65.506 E.93094
G1 X50.236 Y65.597 E.00292
G1 X29.764 Y86.068 E.93094
G1 X29.764 Y85.334 E.02361
G1 X50.236 Y105.805 E.93094
G1 X50.236 Y105.896 E.00292
G1 X29.764 Y126.367 E.93094
G1 X29.764 Y125.633 E.02361
G1 X50.236 Y146.104 E.93094
G1 X50.236 Y146.195 E.00292
G1 X29.764 Y166.666 E.93094
G1 X29.764 Y165.932 E.02361
G1 X50.236 Y186.403 E.93094
G1 X50.236 Y186.494 E.00292
G1 X29.764 Y206.965 E.93094
G1 X29.764 Y206.23 E.02361
G1 X41.646 Y218.111 E.5403
G1 X62.117 Y197.639 E.93094
G1 X61.472 Y197.639 E.02075
G1 X81.945 Y218.111 E.93098
G1 X102.416 Y197.639 E.93094
G1 X101.771 Y197.639 E.02075
G1 X122.242 Y218.111 E.93094
G1 X129.087 Y211.268 E.31122
G2 X130.474 Y210.443 I-1.117 J-3.457 E.05233
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X129.935 Y210.871 E-.26147
G1 X129.087 Y211.268 E-.3559
G1 X128.821 Y211.533 E-.14264
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
G1 X128.963 Y204.808
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X129.175 Y204.879 E.00722
G3 X127.724 Y204.673 I-1.167 J2.996 E.60204
G3 X128.871 Y204.779 I.274 J3.278 E.03725
G1 X128.905 Y204.79 E.00115
G1 X128.444 Y205.102 F30000
M73 P42 R43
G1 F8843.478
G1 X128.488 Y205.107 E.00144
G3 X128.761 Y205.17 I-.473 J2.7 E.00902
G3 X127.754 Y205.079 I-.752 J2.706 E.53482
G3 X128.21 Y205.073 I.261 J2.729 E.01467
G1 X128.384 Y205.094 E.00564
G1 X128.066 Y205.481 F30000
G1 F8843.478
G1 X128.179 Y205.491 E.00364
G3 X128.651 Y205.562 I-.248 J3.247 E.01537
G3 X127.785 Y205.485 I-.643 J2.314 E.4571
G1 X128.006 Y205.481 E.00711
G1 X127.853 Y205.875 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.15 Y205.872 E.00884
G3 X128.349 Y205.895 I-.148 J2.159 E.00597
G3 X127.793 Y205.878 I-.341 J1.979 E.35931
; WIPE_START
M204 S10000
G1 X128.15 Y205.872 E-.13551
G1 X128.349 Y205.895 E-.07614
G1 X128.734 Y206.004 E-.15213
G1 X129.091 Y206.186 E-.15212
G1 X129.404 Y206.436 E-.15211
G1 X129.559 Y206.621 E-.092
; WIPE_END
G1 E-.04 F1800
G1 X137.19 Y206.477 Z1.4 F30000
G1 X214.528 Y205.018 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X214.679 Y204.948 E.00536
G3 X215.724 Y204.673 I1.329 J2.927 E.03491
G3 X217.176 Y204.88 I.274 J3.277 E.04756
G3 X214.395 Y205.094 I-1.167 J2.996 E.55683
G1 X214.476 Y205.048 E.003
G1 X215.014 Y205.247 F30000
G1 F8843.478
G1 X215.107 Y205.216 E.00313
G3 X215.754 Y205.079 I.903 J2.66 E.02134
G3 X216.761 Y205.17 I.261 J2.731 E.0327
G3 X214.847 Y205.319 I-.752 J2.706 E.50448
G1 X214.959 Y205.27 E.00394
G1 X215.502 Y205.527 F30000
G1 F8843.478
G1 X215.785 Y205.485 E.00921
G3 X216.651 Y205.562 I.145 J3.255 E.02804
G3 X215.443 Y205.541 I-.643 J2.314 E.44596
G1 X215.804 Y205.877 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X215.814 Y205.876 E.0003
G3 X216.349 Y205.895 I.188 J2.156 E.01599
G3 X215.553 Y205.918 I-.341 J1.979 E.35205
G1 X215.745 Y205.887 E.00578
; WIPE_START
M204 S10000
G1 X215.814 Y205.876 E-.02669
G1 X216.15 Y205.87 E-.12771
G1 X216.349 Y205.895 E-.07618
G1 X216.734 Y206.004 E-.15213
G1 X217.091 Y206.186 E-.15209
G1 X217.404 Y206.436 E-.15213
G1 X217.527 Y206.583 E-.07308
; WIPE_END
G1 E-.04 F1800
G1 X217.364 Y198.953 Z1.4 F30000
G1 X215.868 Y129.213 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X215.6 Y129.189 E.00864
G3 X215.724 Y122.798 I.408 J-3.189 E.30249
G3 X217.176 Y123.004 I.274 J3.279 E.04755
G3 X215.928 Y129.214 I-1.167 J2.996 E.28897
G1 X215.896 Y128.807 F30000
G1 F8843.478
G1 X215.651 Y128.787 E.00789
G3 X215.754 Y123.204 I.358 J-2.786 E.26401
G3 X216.761 Y123.295 I.261 J2.731 E.03269
G3 X215.956 Y128.809 I-.752 J2.706 E.261
G1 X215.94 Y128.39 F30000
G1 F8843.478
G1 X215.702 Y128.383 E.00768
G3 X215.785 Y123.61 I.306 J-2.382 E.22557
G3 X216.651 Y123.687 I.145 J3.257 E.02804
G3 X216.18 Y128.396 I-.643 J2.314 E.21613
G1 X216 Y128.392 E.00576
G1 X215.894 Y128.003 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X215.553 Y127.956 E.01025
G3 X215.814 Y124.001 I.455 J-1.956 E.16851
G3 X216.349 Y124.02 I.188 J2.156 E.01599
G3 X215.954 Y128.008 I-.341 J1.979 E.17936
; WIPE_START
M204 S10000
G1 X215.553 Y127.956 E-.15353
G1 X215.36 Y127.906 E-.07611
G1 X214.995 Y127.741 E-.15209
G1 X214.67 Y127.507 E-.15214
G1 X214.398 Y127.214 E-.15211
G1 X214.296 Y127.048 E-.07404
; WIPE_END
G1 E-.04 F1800
G1 X214.317 Y119.415 Z1.4 F30000
G1 X214.527 Y41.268 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X214.679 Y41.198 E.00538
G3 X215.724 Y40.923 I1.329 J2.927 E.03491
G3 X217.176 Y41.129 I.274 J3.279 E.04755
G3 X214.395 Y41.344 I-1.167 J2.996 E.55683
G1 X214.475 Y41.298 E.00298
G1 X215.014 Y41.497 F30000
G1 F8843.478
G1 X215.107 Y41.466 E.00315
G3 X215.754 Y41.329 I.902 J2.66 E.02134
G3 X216.761 Y41.42 I.261 J2.731 E.03269
G3 X214.847 Y41.569 I-.752 J2.706 E.50449
G1 X214.958 Y41.521 E.00392
G1 X215.501 Y41.777 F30000
G1 F8843.478
G1 X215.785 Y41.735 E.00923
G3 X216.651 Y41.812 I.145 J3.256 E.02804
G3 X215.443 Y41.792 I-.643 J2.314 E.44594
G1 X215.81 Y42.126 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X215.814 Y42.126 E.00012
G3 X216.349 Y42.145 I.188 J2.156 E.01599
G3 X215.553 Y42.168 I-.341 J1.979 E.35205
G1 X215.751 Y42.136 E.00596
; WIPE_START
M204 S10000
G1 X215.814 Y42.126 E-.02433
G1 X216.15 Y42.12 E-.1277
G1 X216.349 Y42.145 E-.07618
G1 X216.734 Y42.254 E-.15212
G1 X217.091 Y42.436 E-.15209
G1 X217.404 Y42.686 E-.15213
G1 X217.531 Y42.838 E-.07545
; WIPE_END
G1 E-.04 F1800
G1 X209.9 Y42.685 Z1.4 F30000
G1 X128.959 Y41.057 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X129.175 Y41.129 E.00734
G3 X127.724 Y40.923 I-1.167 J2.996 E.60205
G3 X128.871 Y41.029 I.274 J3.279 E.03724
G1 X128.902 Y41.039 E.00103
G1 X128.443 Y41.352 F30000
G1 F8843.478
G1 X128.488 Y41.357 E.00146
G3 X128.761 Y41.42 I-.473 J2.702 E.00902
G3 X127.754 Y41.329 I-.752 J2.706 E.53482
G3 X128.21 Y41.323 I.261 J2.73 E.01467
G1 X128.383 Y41.344 E.00561
G1 X128.065 Y41.731 F30000
G1 F8843.478
G1 X128.179 Y41.741 E.00367
G3 X128.651 Y41.812 I-.248 J3.249 E.01537
G3 X127.785 Y41.735 I-.643 J2.313 E.45703
G1 X128.005 Y41.731 E.00708
G1 X127.81 Y42.126 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X127.814 Y42.126 E.00012
G3 X128.349 Y42.145 I.188 J2.156 E.01599
G3 X127.553 Y42.168 I-.341 J1.979 E.35205
G1 X127.751 Y42.136 E.00596
; WIPE_START
M204 S10000
G1 X127.814 Y42.126 E-.02434
G1 X128.15 Y42.12 E-.1277
G1 X128.349 Y42.145 E-.07618
G1 X128.734 Y42.254 E-.15213
G1 X129.091 Y42.436 E-.15212
G1 X129.404 Y42.686 E-.1521
G1 X129.531 Y42.838 E-.07544
; WIPE_END
G1 E-.04 F1800
G1 X121.9 Y42.685 Z1.4 F30000
G1 X40.959 Y41.057 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.175 Y41.129 E.00736
G3 X39.724 Y40.923 I-1.167 J2.996 E.60205
G3 X40.871 Y41.029 I.274 J3.279 E.03724
G1 X40.901 Y41.039 E.00101
G1 X40.442 Y41.352 F30000
G1 F8843.478
G1 X40.488 Y41.357 E.00148
G3 X40.761 Y41.42 I-.473 J2.702 E.00902
G3 X39.754 Y41.329 I-.752 J2.706 E.53482
G3 X40.21 Y41.323 I.261 J2.73 E.01467
G1 X40.383 Y41.344 E.0056
G1 X40.065 Y41.731 F30000
G1 F8843.478
G1 X40.179 Y41.731 E.00369
G3 X40.417 Y41.759 I-.176 J2.575 E.0077
G3 X39.785 Y41.735 I-.407 J2.367 E.46481
G1 X40.005 Y41.731 E.00707
G1 X39.812 Y42.126 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X39.814 Y42.126 E.00008
G3 X40.349 Y42.145 I.188 J2.156 E.01599
G3 X39.553 Y42.168 I-.341 J1.979 E.35205
G1 X39.752 Y42.136 E.00601
; WIPE_START
M204 S10000
G1 X39.814 Y42.126 E-.02377
G1 X40.15 Y42.12 E-.1277
G1 X40.349 Y42.145 E-.07618
G1 X40.734 Y42.254 E-.15213
G1 X41.091 Y42.436 E-.15209
G1 X41.404 Y42.686 E-.15213
G1 X41.532 Y42.839 E-.07601
; WIPE_END
G1 E-.04 F1800
G1 X47.087 Y48.074 Z1.4 F30000
G1 X205.416 Y197.291 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X50.584 Y197.291 E4.97885
G1 X50.584 Y54.709 E4.58493
G1 X205.416 Y54.709 E4.97885
G1 X205.416 Y197.231 E4.583
G1 X205.009 Y196.884 F30000
G1 F8843.478
G1 X50.991 Y196.884 E4.95267
G1 X50.991 Y55.116 E4.55875
G1 X205.009 Y55.116 E4.95267
G1 X205.009 Y196.824 E4.55682
G1 X204.602 Y196.477 F30000
G1 F8843.478
G1 X51.398 Y196.477 E4.92649
G1 X51.398 Y55.523 E4.53257
G1 X204.602 Y55.523 E4.92649
G1 X204.602 Y196.417 E4.53064
G1 X204.21 Y196.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X51.79 Y196.085 E4.54007
G1 X51.79 Y55.915 E4.17519
G1 X204.21 Y55.915 E4.54007
G1 X204.21 Y196.025 E4.1734
; WIPE_START
M204 S10000
G1 X202.21 Y196.026 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X195.258 Y192.875 Z1.4 F30000
G1 X40.959 Y122.932 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.176 Y123.004 E.00735
G3 X39.724 Y122.798 I-1.167 J2.996 E.60203
G3 X40.871 Y122.904 I.274 J3.279 E.03723
G1 X40.902 Y122.914 E.00104
G1 X40.443 Y123.227 F30000
G1 F8843.478
G1 X40.488 Y123.232 E.00147
G3 X40.761 Y123.295 I-.473 J2.703 E.00901
G3 X39.754 Y123.204 I-.752 J2.706 E.53483
G3 X40.21 Y123.198 I.261 J2.732 E.01467
G1 X40.383 Y123.219 E.00561
G1 X40.065 Y123.606 F30000
G1 F8843.478
G1 X40.179 Y123.606 E.00368
G3 X40.417 Y123.634 I-.176 J2.575 E.0077
G3 X39.785 Y123.61 I-.407 J2.367 E.46481
G1 X40.005 Y123.606 E.00708
G1 X39.81 Y124.001 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X39.814 Y124.001 E.00012
G3 X40.349 Y124.02 I.188 J2.156 E.01599
G3 X39.553 Y124.043 I-.341 J1.979 E.35205
G1 X39.751 Y124.011 E.00596
; WIPE_START
M204 S10000
G1 X39.814 Y124.001 E-.02434
G1 X40.15 Y123.995 E-.1277
G1 X40.349 Y124.02 E-.07618
G1 X40.734 Y124.129 E-.15214
G1 X41.091 Y124.311 E-.15209
G1 X41.404 Y124.561 E-.15212
G1 X41.531 Y124.713 E-.07543
; WIPE_END
G1 E-.04 F1800
G1 X41.477 Y132.345 Z1.4 F30000
G1 X40.959 Y204.807 Z1.4
G1 Z1
M73 P43 R43
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.175 Y204.879 E.00735
G3 X39.724 Y204.673 I-1.167 J2.996 E.60204
G3 X40.871 Y204.779 I.274 J3.278 E.03725
G1 X40.901 Y204.789 E.00102
G1 X40.442 Y205.102 F30000
G1 F8843.478
G1 X40.488 Y205.107 E.00147
G3 X40.761 Y205.17 I-.473 J2.7 E.00902
G3 X39.754 Y205.079 I-.752 J2.706 E.53482
G3 X40.21 Y205.073 I.261 J2.729 E.01467
G1 X40.383 Y205.094 E.0056
G1 X40.065 Y205.481 F30000
G1 F8843.478
G1 X40.179 Y205.491 E.00368
G3 X40.651 Y205.562 I-.248 J3.246 E.01537
G3 X39.785 Y205.485 I-.643 J2.314 E.4571
G1 X40.005 Y205.481 E.00707
G1 X39.803 Y205.877 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X39.814 Y205.876 E.00032
G3 X40.349 Y205.895 I.188 J2.156 E.01599
G3 X39.553 Y205.918 I-.341 J1.979 E.35205
G1 X39.744 Y205.887 E.00576
; WIPE_START
M204 S10000
G1 X39.814 Y205.876 E-.02689
G1 X40.15 Y205.87 E-.1277
G1 X40.349 Y205.895 E-.07618
G1 X40.734 Y206.004 E-.15213
G1 X41.091 Y206.186 E-.15209
G1 X41.404 Y206.436 E-.15213
G1 X41.527 Y206.583 E-.07288
; WIPE_END
G1 E-.04 F1800
G1 X49.144 Y207.072 Z1.4 F30000
G1 X226.584 Y218.459 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X29.416 Y218.459 E6.34019
G1 X29.416 Y33.541 E5.94628
G1 X226.584 Y33.541 E6.34019
G1 X226.584 Y218.399 E5.94435
G1 X226.991 Y218.866 F30000
G1 F8843.478
G1 X29.009 Y218.866 E6.36637
G1 X29.009 Y33.134 E5.97246
G1 X226.991 Y33.134 E6.36637
G1 X226.991 Y218.806 E5.97053
G1 X227.398 Y219.273 F30000
G1 F8843.478
G1 X28.602 Y219.273 E6.39255
G1 X28.602 Y32.727 E5.99864
G1 X227.398 Y32.727 E6.39255
G1 X227.398 Y219.213 E5.99671
G1 X227.79 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X28.21 Y219.665 E5.94481
G1 X28.21 Y32.335 E5.57992
G1 X227.79 Y32.335 E5.94481
G1 X227.79 Y219.605 E5.57813
; WIPE_START
M204 S10000
G1 X225.79 Y219.606 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X221.916 Y213.03 Z1.4 F30000
G1 X219.435 Y208.82 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G2 X219.502 Y207.207 I-3.499 J-.952 E.05233
G1 X226.236 Y200.473 E.30622
G1 X226.236 Y201.208 E.02361
G1 X205.764 Y180.737 E.93094
G1 X205.764 Y180.646 E.00292
G1 X226.236 Y160.175 E.93094
G1 X226.236 Y160.909 E.02361
G1 X205.764 Y140.438 E.93094
G1 X205.764 Y140.347 E.00292
G1 X216.596 Y129.515 E.49258
G2 X217.559 Y129.205 I-1.581 J-6.546 E.03257
G1 X226.236 Y137.881 E.39457
G1 X226.236 Y137.147 E.02361
G1 X205.764 Y157.618 E.93094
G1 X205.764 Y157.709 E.00292
G1 X226.236 Y178.18 E.93094
G1 X226.236 Y177.446 E.02361
G1 X185.571 Y218.111 E1.84928
G1 X165.098 Y197.639 E.93098
G1 X165.743 Y197.639 E.02075
G1 X145.272 Y218.111 E.93094
G1 X124.799 Y197.639 E.93098
G1 X125.444 Y197.639 E.02075
G1 X104.973 Y218.111 E.93094
G1 X84.5 Y197.639 E.93098
G1 X85.145 Y197.639 E.02075
G1 X64.672 Y218.111 E.93098
G1 X29.764 Y183.203 E1.58747
G1 X29.764 Y183.937 E.02361
G1 X50.236 Y163.466 E.93094
G1 X50.236 Y163.375 E.00292
G1 X29.764 Y142.904 E.93094
G1 X29.764 Y143.638 E.02361
G1 X50.236 Y123.167 E.93094
G1 X50.236 Y123.076 E.00292
G1 X29.764 Y102.605 E.93094
G1 X29.764 Y103.339 E.02361
G1 X50.236 Y82.868 E.93094
G1 X50.236 Y82.777 E.00292
G1 X29.764 Y62.306 E.93094
G1 X29.764 Y63.04 E.02361
G1 X58.915 Y33.889 E1.32567
G1 X79.388 Y54.361 E.93098
G1 X78.743 Y54.361 E.02075
G1 X99.214 Y33.889 E.93094
G1 X119.687 Y54.361 E.93098
G1 X119.042 Y54.361 E.02075
G1 X126.2 Y47.203 E.3255
G2 X129.798 Y47.2 I1.797 J-3.192 E.12095
G1 X136.958 Y54.361 E.32562
G1 X136.313 Y54.361 E.02075
G1 X156.786 Y33.889 E.93098
G1 X177.257 Y54.361 E.93094
G1 X176.612 Y54.361 E.02075
G1 X197.085 Y33.889 E.93098
G1 X226.236 Y63.04 E1.32567
G1 X226.236 Y62.306 E.02361
G1 X205.764 Y82.777 E.93094
G1 X205.764 Y82.868 E.00292
G1 X226.236 Y103.339 E.93094
G1 X226.236 Y102.605 E.02361
G1 X205.764 Y123.076 E.93094
G1 X205.764 Y123.167 E.00292
G1 X226.236 Y143.638 E.93094
G1 X226.236 Y142.904 E.02361
G1 X205.764 Y163.375 E.93094
G1 X205.764 Y163.466 E.00292
G1 X226.236 Y183.937 E.93094
G1 X226.236 Y183.203 E.02361
G1 X191.328 Y218.111 E1.58747
G1 X170.855 Y197.639 E.93098
G1 X171.5 Y197.639 E.02075
G1 X151.029 Y218.111 E.93094
G1 X130.556 Y197.639 E.93098
G1 X131.201 Y197.639 E.02075
G1 X110.73 Y218.111 E.93094
G1 X90.257 Y197.639 E.93098
G1 X90.902 Y197.639 E.02075
G1 X70.429 Y218.111 E.93098
G1 X29.764 Y177.446 E1.84928
G1 X29.764 Y178.18 E.02361
G1 X50.236 Y157.709 E.93094
G1 X50.236 Y157.618 E.00292
G1 X29.764 Y137.147 E.93094
G1 X29.764 Y137.881 E.02361
G1 X38.441 Y129.204 E.39459
G2 X39.4 Y129.511 I2.244 J-5.35 E.03241
G1 X50.236 Y140.347 E.49276
G1 X50.236 Y140.438 E.00292
G1 X29.764 Y160.909 E.93094
G1 X29.764 Y160.175 E.02361
G1 X50.236 Y180.646 E.93094
G1 X50.236 Y180.737 E.00292
G1 X29.764 Y201.208 E.93094
G1 X29.764 Y200.473 E.02361
G1 X36.5 Y207.209 E.30632
G2 X36.564 Y208.821 I4.149 J.643 E.0522
; WIPE_START
G1 X36.438 Y208.053 E-.29591
G1 X36.5 Y207.209 E-.32143
G1 X36.235 Y206.944 E-.14267
; WIPE_END
G1 E-.04 F1800
G1 X41.024 Y204.461 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F8843.478
G2 X39.414 Y204.366 I-1.039 J3.937 E.0522
G1 X29.764 Y194.716 E.43884
G1 X29.764 Y195.451 E.02361
G1 X50.236 Y174.98 E.93094
G1 X50.236 Y174.889 E.00292
G1 X29.764 Y154.418 E.93094
G1 X29.764 Y155.152 E.02361
G1 X50.236 Y134.681 E.93094
G1 X50.236 Y134.59 E.00292
G1 X43.203 Y127.558 E.31979
G2 X43.203 Y124.442 I-3.341 J-1.558 E.10345
G1 X50.236 Y117.41 E.31979
G1 X50.236 Y117.319 E.00292
G1 X29.764 Y96.848 E.93094
G1 X29.764 Y97.582 E.02361
G1 X50.236 Y77.111 E.93094
G1 X50.236 Y77.02 E.00292
G1 X29.764 Y56.549 E.93094
G1 X29.764 Y57.283 E.02361
G1 X39.41 Y47.638 E.43863
G2 X41.02 Y47.54 I.554 J-4.17 E.0522
; WIPE_START
G1 X40.266 Y47.682 E-.29139
G1 X39.41 Y47.638 E-.32595
G1 X39.144 Y47.904 E-.14266
; WIPE_END
G1 E-.04 F1800
G1 X36.564 Y43.179 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F8843.478
M73 P43 R42
G2 X36.5 Y44.791 I4.085 J.969 E.0522
G1 X29.764 Y51.527 E.30632
G1 X29.764 Y50.792 E.02361
G1 X50.236 Y71.263 E.93094
G1 X50.236 Y71.354 E.00292
G1 X29.764 Y91.825 E.93094
G1 X29.764 Y91.091 E.02361
G1 X50.236 Y111.562 E.93094
G1 X50.236 Y111.653 E.00292
G1 X39.394 Y122.494 E.49302
G2 X38.441 Y122.796 I1.125 J5.211 E.03218
G1 X29.764 Y114.119 E.39459
G1 X29.764 Y114.853 E.02361
G1 X50.236 Y94.382 E.93094
G1 X50.236 Y94.291 E.00292
G1 X29.764 Y73.82 E.93094
G1 X29.764 Y74.554 E.02361
G1 X70.429 Y33.889 E1.84928
G1 X90.902 Y54.361 E.93098
G1 X90.257 Y54.361 E.02075
G1 X110.728 Y33.889 E.93094
G1 X131.201 Y54.361 E.93098
G1 X130.556 Y54.361 E.02075
G1 X151.027 Y33.889 E.93094
G1 X171.5 Y54.361 E.93098
G1 X170.855 Y54.361 E.02075
G1 X191.328 Y33.889 E.93098
G1 X226.236 Y68.797 E1.58747
G1 X226.236 Y68.063 E.02361
G1 X205.764 Y88.534 E.93094
G1 X205.764 Y88.625 E.00292
G1 X226.236 Y109.096 E.93094
G1 X226.236 Y108.362 E.02361
G1 X205.764 Y128.833 E.93094
G1 X205.764 Y128.924 E.00292
G1 X226.236 Y149.395 E.93094
G1 X226.236 Y148.661 E.02361
G1 X205.764 Y169.132 E.93094
G1 X205.764 Y169.223 E.00292
G1 X226.236 Y189.694 E.93094
G1 X226.236 Y188.96 E.02361
G1 X197.085 Y218.111 E1.32567
G1 X176.612 Y197.639 E.93098
G1 X177.257 Y197.639 E.02075
G1 X156.786 Y218.111 E.93094
G1 X136.313 Y197.639 E.93098
G1 X136.958 Y197.639 E.02075
G1 X129.798 Y204.8 E.32562
G2 X126.2 Y204.797 I-1.801 J3.16 E.12103
G1 X119.042 Y197.639 E.3255
G1 X119.687 Y197.639 E.02075
G1 X99.214 Y218.111 E.93098
G1 X78.743 Y197.639 E.93094
G1 X79.388 Y197.639 E.02075
G1 X58.915 Y218.111 E.93098
G1 X29.764 Y188.96 E1.32567
G1 X29.764 Y189.694 E.02361
G1 X50.236 Y169.223 E.93094
G1 X50.236 Y169.132 E.00292
G1 X29.764 Y148.661 E.93094
G1 X29.764 Y149.395 E.02361
G1 X50.236 Y128.924 E.93094
G1 X50.236 Y128.833 E.00292
G1 X29.764 Y108.362 E.93094
G1 X29.764 Y109.096 E.02361
G1 X50.236 Y88.625 E.93094
G1 X50.236 Y88.534 E.00292
G1 X29.764 Y68.063 E.93094
M73 P44 R42
G1 X29.764 Y68.797 E.02361
G1 X64.672 Y33.889 E1.58747
G1 X85.145 Y54.361 E.93098
G1 X84.5 Y54.361 E.02075
G1 X104.971 Y33.889 E.93094
G1 X125.444 Y54.361 E.93098
G1 X124.799 Y54.361 E.02075
G1 X145.27 Y33.889 E.93094
G1 X165.743 Y54.361 E.93098
G1 X165.098 Y54.361 E.02075
G1 X185.571 Y33.889 E.93098
G1 X226.236 Y74.554 E1.84928
G1 X226.236 Y73.82 E.02361
G1 X205.764 Y94.291 E.93094
G1 X205.764 Y94.382 E.00292
G1 X226.236 Y114.853 E.93094
G1 X226.236 Y114.119 E.02361
G1 X217.559 Y122.795 E.39457
G2 X216.596 Y122.485 I-2.544 J6.236 E.03257
G1 X205.764 Y111.653 E.49258
G1 X205.764 Y111.562 E.00292
G1 X226.236 Y91.091 E.93094
G1 X226.236 Y91.825 E.02361
G1 X205.764 Y71.354 E.93094
G1 X205.764 Y71.263 E.00292
G1 X226.236 Y50.792 E.93094
G1 X226.236 Y51.527 E.02361
G1 X219.502 Y44.793 E.30622
G2 X219.435 Y43.18 I-3.566 J-.661 E.05233
; WIPE_START
G1 X219.567 Y44.125 E-.36237
G1 X219.502 Y44.793 E-.25496
G1 X219.767 Y45.058 E-.14267
; WIPE_END
G1 E-.04 F1800
G1 X214.982 Y47.539 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F8843.478
G2 X216.593 Y47.641 I1.028 J-3.481 E.05233
G1 X226.236 Y57.284 E.43851
G1 X226.236 Y56.549 E.02361
G1 X205.764 Y77.02 E.93094
G1 X205.764 Y77.111 E.00292
G1 X226.236 Y97.582 E.93094
G1 X226.236 Y96.848 E.02361
G1 X205.764 Y117.319 E.93094
G1 X205.764 Y117.41 E.00292
G1 X212.794 Y124.439 E.31966
G2 X212.794 Y127.561 I3.244 J1.561 E.10382
G1 X205.764 Y134.59 E.31966
G1 X205.764 Y134.681 E.00292
G1 X226.236 Y155.152 E.93094
G1 X226.236 Y154.418 E.02361
G1 X205.764 Y174.889 E.93094
G1 X205.764 Y174.98 E.00292
G1 X226.236 Y195.451 E.93094
G1 X226.236 Y194.716 E.02361
G1 X216.593 Y204.359 E.43851
G2 X214.982 Y204.461 I-.584 J3.564 E.05235
G1 X203.768 Y197.639 F30000
G1 F8843.478
G1 X205.396 Y197.639 E.05236
G1 X213.304 Y205.547 E.35959
G2 X212.485 Y208.467 I2.849 J2.373 E.10046
G1 X202.84 Y218.111 E.43861
G1 X182.369 Y197.639 E.93094
G1 X183.014 Y197.639 E.02075
G1 X162.541 Y218.111 E.93098
G1 X142.07 Y197.639 E.93094
G1 X142.715 Y197.639 E.02075
G1 X131.397 Y208.958 E.51471
G3 X131.076 Y209.673 I-3.655 J-1.21 E.02526
G1 X139.515 Y218.111 E.38373
G1 X159.986 Y197.639 E.93094
G1 X159.341 Y197.639 E.02075
G1 X179.814 Y218.111 E.93098
G1 X200.285 Y197.639 E.93094
G1 X199.639 Y197.639 E.02075
G1 X220.111 Y218.111 E.93094
G1 X226.236 Y211.987 E.2785
G1 X226.236 Y212.722 E.02361
G1 X205.764 Y192.251 E.93094
G1 X205.764 Y192.16 E.00292
G1 X226.236 Y171.689 E.93094
G1 X226.236 Y172.423 E.02361
G1 X205.764 Y151.952 E.93094
G1 X205.764 Y151.861 E.00292
G1 X226.236 Y131.39 E.93094
G1 X226.236 Y132.124 E.02361
G1 X219.512 Y125.401 E.30575
G3 X219.512 Y126.599 I-4.862 J.599 E.03864
G1 X226.236 Y119.876 E.30575
G1 X226.236 Y120.61 E.02361
G1 X205.764 Y100.139 E.93094
G1 X205.764 Y100.048 E.00292
G1 X226.236 Y79.577 E.93094
G1 X226.236 Y80.311 E.02361
G1 X205.764 Y59.84 E.93094
G1 X205.764 Y59.749 E.00292
G1 X226.236 Y39.278 E.93094
G1 X226.236 Y40.013 E.02361
G1 X220.111 Y33.889 E.2785
G1 X199.64 Y54.361 E.93094
G1 X200.285 Y54.361 E.02075
G1 X179.814 Y33.889 E.93094
G1 X159.341 Y54.361 E.93098
G1 X159.986 Y54.361 E.02075
G1 X139.515 Y33.889 E.93094
G1 X131.076 Y42.327 E.38373
G3 X131.397 Y43.042 I-3.338 J1.927 E.02526
G1 X142.715 Y54.361 E.51471
G1 X142.07 Y54.361 E.02075
G1 X162.541 Y33.889 E.93094
G1 X183.014 Y54.361 E.93098
G1 X182.369 Y54.361 E.02075
G1 X202.84 Y33.889 E.93094
G1 X212.485 Y43.533 E.4386
G2 X213.304 Y46.453 I3.667 J.547 E.10046
G1 X205.396 Y54.361 E.35959
G1 X203.768 Y54.361 E.05236
; WIPE_START
G1 X205.396 Y54.361 E-.61876
G1 X205.659 Y54.098 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X211.374 Y49.039 Z1.4 F30000
G1 X226.236 Y35.884 Z1.4
G1 Z1
G1 E.8 F1800
G1 F8843.478
G1 X226.236 Y34.256 E.05236
G1 X225.868 Y33.889 E.01669
G1 X218.328 Y41.429 E.34285
G2 X215.337 Y40.628 I-2.357 J2.818 E.10279
G1 X208.597 Y33.889 E.30648
G1 X188.126 Y54.361 E.93094
G1 X188.771 Y54.361 E.02075
G1 X168.298 Y33.889 E.93098
G1 X147.827 Y54.361 E.93094
G1 X148.472 Y54.361 E.02075
G1 X127.999 Y33.889 E.93098
G1 X107.528 Y54.361 E.93094
G1 X108.173 Y54.361 E.02075
G1 X87.7 Y33.889 E.93098
G1 X67.229 Y54.361 E.93094
G1 X67.874 Y54.361 E.02075
G1 X47.403 Y33.889 E.93094
G1 X40.667 Y40.624 E.30628
G2 X37.67 Y41.427 I-.598 J3.764 E.10278
G1 X30.132 Y33.889 E.34277
G1 X29.764 Y34.256 E.01669
G1 X29.764 Y35.884 E.05236
; WIPE_START
G1 X29.764 Y34.256 E-.61876
G1 X30.028 Y33.993 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X35.653 Y39.153 Z1.4 F30000
G1 X52.232 Y54.361 Z1.4
G1 Z1
G1 E.8 F1800
G1 F8843.478
G1 X50.604 Y54.361 E.05236
G1 X42.698 Y46.455 E.35952
G2 X43.513 Y43.535 I-2.854 J-2.371 E.10044
G1 X53.16 Y33.889 E.43866
G1 X73.631 Y54.361 E.93094
G1 X72.986 Y54.361 E.02075
G1 X93.459 Y33.889 E.93098
G1 X113.93 Y54.361 E.93094
G1 X113.285 Y54.361 E.02075
G1 X124.607 Y43.038 E.5149
G3 X124.924 Y42.326 I3.524 J1.138 E.0251
G1 X116.485 Y33.889 E.3837
G1 X96.014 Y54.361 E.93094
G1 X96.659 Y54.361 E.02075
G1 X76.186 Y33.889 E.93098
G1 X55.715 Y54.361 E.93094
G1 X56.361 Y54.361 E.02075
G1 X35.889 Y33.889 E.93094
G1 X29.764 Y40.013 E.2785
G1 X29.764 Y39.278 E.02361
G1 X50.236 Y59.749 E.93094
G1 X50.236 Y59.84 E.00292
G1 X29.764 Y80.311 E.93094
G1 X29.764 Y79.577 E.02361
G1 X50.236 Y100.048 E.93094
G1 X50.236 Y100.139 E.00292
G1 X29.764 Y120.61 E.93094
G1 X29.764 Y119.876 E.02361
G1 X36.487 Y126.598 E.3057
G3 X36.487 Y125.402 I3.636 J-.598 E.03864
G1 X29.764 Y132.124 E.3057
G1 X29.764 Y131.39 E.02361
G1 X50.236 Y151.861 E.93094
G1 X50.236 Y151.952 E.00292
G1 X29.764 Y172.423 E.93094
G1 X29.764 Y171.689 E.02361
G1 X50.236 Y192.16 E.93094
G1 X50.236 Y192.251 E.00292
G1 X29.764 Y212.722 E.93094
G1 X29.764 Y211.987 E.02361
G1 X35.889 Y218.111 E.2785
G1 X56.36 Y197.639 E.93094
G1 X55.715 Y197.639 E.02075
G1 X76.186 Y218.111 E.93094
G1 X96.659 Y197.639 E.93098
G1 X96.014 Y197.639 E.02075
G1 X116.485 Y218.111 E.93094
G1 X124.923 Y209.674 E.3837
G3 X124.607 Y208.962 I3.212 J-1.852 E.0251
G1 X113.285 Y197.639 E.5149
G1 X113.93 Y197.639 E.02075
G1 X93.459 Y218.111 E.93094
G1 X72.986 Y197.639 E.93098
G1 X73.631 Y197.639 E.02075
G1 X53.16 Y218.111 E.93094
G1 X43.513 Y208.465 E.43866
G2 X42.698 Y205.545 I-3.67 J-.549 E.10044
G1 X50.604 Y197.639 E.35952
G1 X52.232 Y197.639 E.05236
; WIPE_START
G1 X50.604 Y197.639 E-.61876
G1 X50.341 Y197.902 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X44.626 Y202.961 Z1.4 F30000
G1 X29.764 Y216.116 Z1.4
G1 Z1
G1 E.8 F1800
G1 F8843.478
G1 X29.764 Y217.744 E.05236
G1 X30.132 Y218.111 E.01669
G1 X37.67 Y210.573 E.34277
G2 X40.667 Y211.376 I2.373 J-2.859 E.10295
G1 X47.403 Y218.111 E.30628
G1 X67.874 Y197.639 E.93094
G1 X67.229 Y197.639 E.02075
G1 X87.7 Y218.111 E.93094
G1 X108.173 Y197.639 E.93098
G1 X107.528 Y197.639 E.02075
G1 X127.999 Y218.111 E.93094
G1 X148.472 Y197.639 E.93098
G1 X147.827 Y197.639 E.02075
G1 X168.298 Y218.111 E.93094
G1 X188.771 Y197.639 E.93098
G1 X188.126 Y197.639 E.02075
G1 X208.597 Y218.111 E.93094
G1 X215.334 Y211.375 E.30636
G2 X218.328 Y210.571 I.629 J-3.637 E.10288
G1 X225.868 Y218.111 E.34285
G1 X226.236 Y217.744 E.01669
G1 X226.236 Y216.116 E.05236
G1 X130.474 Y210.443 F30000
G1 F8843.478
G3 X129.087 Y211.268 I-2.504 J-2.632 E.05233
G1 X122.242 Y218.111 E.31122
G1 X101.771 Y197.639 E.93094
G1 X102.416 Y197.639 E.02075
G1 X81.945 Y218.111 E.93094
G1 X61.472 Y197.639 E.93098
G1 X62.117 Y197.639 E.02075
G1 X41.646 Y218.111 E.93094
G1 X29.764 Y206.23 E.5403
G1 X29.764 Y206.965 E.02361
G1 X50.236 Y186.494 E.93094
G1 X50.236 Y186.403 E.00292
G1 X29.764 Y165.932 E.93094
G1 X29.764 Y166.666 E.02361
G1 X50.236 Y146.195 E.93094
G1 X50.236 Y146.104 E.00292
G1 X29.764 Y125.633 E.93094
G1 X29.764 Y126.367 E.02361
G1 X50.236 Y105.896 E.93094
G1 X50.236 Y105.805 E.00292
G1 X29.764 Y85.334 E.93094
G1 X29.764 Y86.068 E.02361
G1 X50.236 Y65.597 E.93094
G1 X50.236 Y65.506 E.00292
G1 X29.764 Y45.035 E.93094
G1 X29.764 Y45.77 E.02361
G1 X41.646 Y33.889 E.5403
G1 X62.117 Y54.361 E.93094
G1 X61.472 Y54.361 E.02075
G1 X81.945 Y33.889 E.93098
G1 X102.416 Y54.361 E.93094
G1 X101.771 Y54.361 E.02075
G1 X122.242 Y33.889 E.93094
G1 X129.087 Y40.732 E.31122
G2 X126.916 Y40.729 I-1.09 J3.418 E.07091
G1 X133.758 Y33.889 E.3111
G1 X154.229 Y54.361 E.93094
G1 X153.584 Y54.361 E.02075
G1 X174.055 Y33.889 E.93094
G1 X194.528 Y54.361 E.93098
G1 X193.883 Y54.361 E.02075
G1 X214.354 Y33.889 E.93094
G1 X226.236 Y45.77 E.5403
G1 X226.236 Y45.035 E.02361
G1 X205.764 Y65.506 E.93094
G1 X205.764 Y65.597 E.00292
G1 X226.236 Y86.068 E.93094
G1 X226.236 Y85.334 E.02361
G1 X205.764 Y105.805 E.93094
G1 X205.764 Y105.896 E.00292
G1 X226.236 Y126.367 E.93094
G1 X226.236 Y125.633 E.02361
G1 X205.764 Y146.104 E.93094
G1 X205.764 Y146.195 E.00292
G1 X226.236 Y166.666 E.93094
G1 X226.236 Y165.932 E.02361
G1 X205.764 Y186.403 E.93094
G1 X205.764 Y186.494 E.00292
G1 X226.236 Y206.965 E.93094
G1 X226.236 Y206.23 E.02361
G1 X214.354 Y218.111 E.5403
G1 X193.883 Y197.639 E.93094
G1 X194.528 Y197.639 E.02075
G1 X174.055 Y218.111 E.93098
G1 X153.584 Y197.639 E.93094
G1 X154.229 Y197.639 E.02075
G1 X133.758 Y218.111 E.93094
G1 X126.916 Y211.271 E.3111
G3 X125.531 Y210.443 I1.427 J-3.961 E.0522
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X126.217 Y210.964 E-.32709
G1 X126.916 Y211.271 E-.29025
G1 X127.182 Y211.536 E-.14266
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
G1 X128.974 Y204.812
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X129.175 Y204.879 E.00682
G3 X127.736 Y204.672 I-1.167 J2.996 E.60242
G3 X128.871 Y204.779 I.262 J3.277 E.03686
G1 X128.917 Y204.794 E.00155
G1 X128.527 Y205.116 F30000
G1 F8843.478
G1 X128.761 Y205.17 E.00771
G3 X127.766 Y205.078 I-.752 J2.706 E.53519
G3 X128.469 Y205.104 I.25 J2.725 E.02266
G1 X128.082 Y205.48 F30000
G1 F8843.478
G1 X128.179 Y205.491 E.00312
G3 X128.651 Y205.562 I-.252 J3.271 E.01537
G3 X127.797 Y205.484 I-.643 J2.314 E.45747
G1 X128.022 Y205.481 E.00725
G1 X127.892 Y205.874 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.15 Y205.872 E.0077
G3 X128.349 Y205.895 I-.147 J2.15 E.00597
G3 X127.826 Y205.875 I-.34 J1.98 E.36028
G1 X127.832 Y205.875 E.00017
; WIPE_START
M204 S10000
G1 X128.15 Y205.872 E-.12099
G1 X128.349 Y205.895 E-.07614
G1 X128.734 Y206.004 E-.15213
G1 X128.917 Y206.086 E-.07615
G1 X129.253 Y206.303 E-.15213
G1 X129.54 Y206.583 E-.15211
G1 X129.585 Y206.649 E-.03036
; WIPE_END
G1 E-.04 F1800
G1 X137.216 Y206.502 Z1.6 F30000
G1 X214.535 Y205.014 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X214.679 Y204.948 E.00509
G3 X215.736 Y204.672 I1.329 J2.927 E.03529
G3 X217.176 Y204.88 I.262 J3.277 E.04717
G3 X214.395 Y205.095 I-1.167 J2.996 E.55682
G1 X214.483 Y205.044 E.00329
G1 X215.022 Y205.243 F30000
G1 F8843.478
G1 X215.107 Y205.216 E.00286
G3 X215.766 Y205.078 I.903 J2.66 E.02173
G3 X216.761 Y205.17 I.25 J2.727 E.03231
G3 X214.847 Y205.319 I-.752 J2.706 E.50447
G1 X214.967 Y205.267 E.00421
G1 X215.511 Y205.526 F30000
G1 F8843.478
G1 X215.797 Y205.484 E.00929
G3 X216.651 Y205.562 I.13 J3.28 E.02766
G3 X215.453 Y205.539 I-.643 J2.314 E.44625
G1 X215.817 Y205.876 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X215.826 Y205.875 E.00027
G3 X216.349 Y205.895 I.177 J2.148 E.01563
G3 X215.553 Y205.919 I-.34 J1.98 E.35205
G1 X215.758 Y205.886 E.00617
; WIPE_START
M204 S10000
G1 X215.826 Y205.875 E-.02627
G1 X216.15 Y205.87 E-.12318
G1 X216.349 Y205.895 E-.07617
G1 X216.544 Y205.94 E-.07615
G1 X216.917 Y206.086 E-.15212
G1 X217.253 Y206.303 E-.15213
G1 X217.54 Y206.583 E-.15211
G1 X217.543 Y206.587 E-.00187
; WIPE_END
G1 E-.04 F1800
G1 X217.377 Y198.956 Z1.6 F30000
G1 X215.863 Y129.213 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X215.6 Y129.189 E.00847
G3 X215.736 Y122.797 I.408 J-3.189 E.30285
G3 X217.176 Y123.005 I.262 J3.278 E.04717
G3 X215.923 Y129.214 I-1.167 J2.996 E.28916
G1 X215.892 Y128.807 F30000
G1 F8843.478
G1 X215.651 Y128.787 E.00778
G3 X215.766 Y123.203 I.359 J-2.786 E.26435
G3 X216.761 Y123.295 I.25 J2.728 E.0323
G3 X215.952 Y128.809 I-.752 J2.706 E.26113
G1 X215.939 Y128.39 F30000
G1 F8843.478
G1 X215.702 Y128.383 E.00765
G3 X215.797 Y123.609 I.307 J-2.382 E.22591
G3 X216.651 Y123.687 I.13 J3.282 E.02765
G3 X216.18 Y128.396 I-.643 J2.314 E.21616
G1 X215.999 Y128.392 E.00579
G1 X215.913 Y128.005 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X215.554 Y127.956 E.0108
G3 X215.826 Y124 I.455 J-1.956 E.16881
G3 X216.349 Y124.02 I.177 J2.148 E.01563
G3 X215.973 Y128.008 I-.34 J1.98 E.17886
; WIPE_START
M204 S10000
G1 X215.554 Y127.956 E-.16049
G1 X215.36 Y127.906 E-.07611
G1 X214.995 Y127.741 E-.15211
G1 X214.67 Y127.507 E-.15212
G1 X214.398 Y127.214 E-.15209
G1 X214.306 Y127.063 E-.06708
; WIPE_END
G1 E-.04 F1800
G1 X214.326 Y119.431 Z1.6 F30000
G1 X214.535 Y41.264 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X214.679 Y41.198 E.0051
G3 X215.736 Y40.922 I1.33 J2.927 E.03529
G3 X217.176 Y41.129 I.262 J3.277 E.04717
G3 X214.395 Y41.345 I-1.167 J2.996 E.55683
G1 X214.483 Y41.294 E.00327
G1 X215.022 Y41.494 F30000
G1 F8843.478
G1 X215.107 Y41.466 E.00288
G3 X215.766 Y41.328 I.903 J2.66 E.02173
G3 X216.761 Y41.42 I.25 J2.728 E.03231
G3 X214.847 Y41.569 I-.752 J2.706 E.50447
G1 X214.967 Y41.517 E.0042
G1 X215.511 Y41.776 F30000
G1 F8843.478
G1 X215.797 Y41.734 E.0093
G3 X216.651 Y41.812 I.13 J3.282 E.02765
G3 X215.452 Y41.79 I-.643 J2.314 E.44624
G1 X215.823 Y42.125 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X215.826 Y42.125 E.00009
G3 X216.349 Y42.145 I.177 J2.148 E.01563
G3 X215.553 Y42.169 I-.34 J1.98 E.35205
G1 X215.764 Y42.135 E.00635
; WIPE_START
M204 S10000
G1 X215.826 Y42.125 E-.02391
G1 X216.15 Y42.12 E-.12317
G1 X216.349 Y42.145 E-.07617
G1 X216.544 Y42.19 E-.07615
G1 X216.917 Y42.336 E-.15212
G1 X217.253 Y42.553 E-.15213
G1 X217.54 Y42.833 E-.1521
G1 X217.546 Y42.842 E-.00424
; WIPE_END
G1 E-.04 F1800
G1 X209.915 Y42.689 Z1.6 F30000
G1 X128.974 Y41.062 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X129.176 Y41.129 E.00685
G3 X127.736 Y40.922 I-1.167 J2.996 E.60242
G3 X128.871 Y41.029 I.262 J3.278 E.03685
G1 X128.916 Y41.044 E.00153
G1 X128.526 Y41.366 F30000
G1 F8843.478
G1 X128.761 Y41.42 E.00774
G3 X127.766 Y41.328 I-.752 J2.706 E.5352
G3 X128.468 Y41.354 I.25 J2.727 E.02263
G1 X128.081 Y41.73 F30000
G1 F8843.478
G1 X128.179 Y41.741 E.00315
G3 X128.651 Y41.812 I-.252 J3.274 E.01537
G3 X127.797 Y41.734 I-.643 J2.314 E.45747
G1 X128.021 Y41.731 E.00722
G1 X127.823 Y42.125 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X127.826 Y42.125 E.00009
G3 X128.349 Y42.145 I.177 J2.148 E.01563
G3 X127.553 Y42.169 I-.34 J1.98 E.35205
G1 X127.764 Y42.135 E.00635
; WIPE_START
M204 S10000
G1 X127.826 Y42.125 E-.02391
G1 X128.15 Y42.12 E-.12317
G1 X128.349 Y42.145 E-.07618
G1 X128.544 Y42.19 E-.07614
G1 X128.917 Y42.336 E-.15213
G1 X129.253 Y42.553 E-.15212
G1 X129.54 Y42.833 E-.1521
G1 X129.546 Y42.842 E-.00425
; WIPE_END
G1 E-.04 F1800
G1 X121.915 Y42.71 Z1.6 F30000
G1 X38.536 Y41.264 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X38.679 Y41.198 E.00507
G3 X39.736 Y40.922 I1.33 J2.927 E.03529
G3 X41.176 Y41.129 I.262 J3.278 E.04716
G3 X38.395 Y41.345 I-1.167 J2.996 E.55683
G1 X38.484 Y41.294 E.0033
G1 X39.023 Y41.493 F30000
G1 F8843.478
G1 X39.107 Y41.466 E.00284
G3 X39.766 Y41.328 I.903 J2.66 E.02173
G3 X40.761 Y41.42 I.25 J2.727 E.03231
G3 X38.847 Y41.569 I-.752 J2.706 E.50447
G1 X38.967 Y41.517 E.00423
G1 X39.512 Y41.776 F30000
G1 F8843.478
G1 X39.797 Y41.734 E.00927
G3 X40.651 Y41.812 I.13 J3.281 E.02766
G3 X39.453 Y41.789 I-.643 J2.314 E.44627
G1 X39.816 Y42.126 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X39.826 Y42.125 E.00029
G3 X40.349 Y42.145 I.177 J2.148 E.01563
G3 X39.553 Y42.169 I-.34 J1.98 E.35205
G1 X39.757 Y42.136 E.00615
; WIPE_START
M204 S10000
G1 X39.826 Y42.125 E-.0265
G1 X40.15 Y42.12 E-.12317
G1 X40.349 Y42.145 E-.07618
G1 X40.734 Y42.254 E-.15213
G1 X41.091 Y42.436 E-.15209
G1 X41.404 Y42.686 E-.15213
G1 X41.535 Y42.843 E-.07781
; WIPE_END
G1 E-.04 F1800
G1 X47.09 Y48.078 Z1.6 F30000
G1 X205.416 Y197.291 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X50.584 Y197.291 E4.97885
G1 X50.584 Y54.709 E4.58493
G1 X205.416 Y54.709 E4.97885
G1 X205.416 Y197.231 E4.583
G1 X205.009 Y196.884 F30000
G1 F8843.478
G1 X50.991 Y196.884 E4.95267
G1 X50.991 Y55.116 E4.55875
G1 X205.009 Y55.116 E4.95267
G1 X205.009 Y196.824 E4.55682
G1 X204.602 Y196.477 F30000
G1 F8843.478
G1 X51.398 Y196.477 E4.92649
G1 X51.398 Y55.523 E4.53257
G1 X204.602 Y55.523 E4.92649
G1 X204.602 Y196.417 E4.53064
G1 X204.21 Y196.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X51.79 Y196.085 E4.54007
G1 X51.79 Y55.915 E4.17519
G1 X204.21 Y55.915 E4.54007
G1 X204.21 Y196.025 E4.1734
; WIPE_START
M204 S10000
G1 X202.21 Y196.026 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X195.258 Y192.875 Z1.6 F30000
G1 X40.974 Y122.937 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.176 Y123.004 E.00686
G3 X39.736 Y122.797 I-1.167 J2.996 E.60241
G3 X40.871 Y122.904 I.262 J3.278 E.03685
G1 X40.916 Y122.919 E.00153
G1 X40.526 Y123.241 F30000
G1 F8843.478
G1 X40.761 Y123.295 E.00774
G3 X39.766 Y123.203 I-.752 J2.706 E.5352
G3 X40.468 Y123.229 I.25 J2.728 E.02263
G1 X40.081 Y123.605 F30000
G1 F8843.478
G1 X40.179 Y123.616 E.00315
G3 X40.651 Y123.687 I-.252 J3.275 E.01537
G3 X39.797 Y123.609 I-.643 J2.314 E.45747
G1 X40.021 Y123.606 E.00722
G1 X39.823 Y124 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X39.826 Y124 E.00009
G3 X40.349 Y124.02 I.177 J2.148 E.01563
G3 X39.553 Y124.044 I-.34 J1.98 E.35205
G1 X39.764 Y124.01 E.00635
; WIPE_START
M204 S10000
G1 X39.826 Y124 E-.02392
G1 X40.15 Y123.995 E-.12317
G1 X40.349 Y124.02 E-.07617
M73 P45 R42
G1 X40.734 Y124.129 E-.15213
G1 X41.091 Y124.311 E-.15209
G1 X41.404 Y124.561 E-.15213
G1 X41.54 Y124.723 E-.08039
; WIPE_END
G1 E-.04 F1800
G1 X41.254 Y132.35 Z1.6 F30000
G1 X38.536 Y205.014 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X38.679 Y204.948 E.00509
G3 X39.736 Y204.672 I1.329 J2.927 E.03529
G3 X41.175 Y204.879 I.262 J3.277 E.04716
M73 P45 R41
G3 X38.395 Y205.095 I-1.167 J2.996 E.55684
G1 X38.483 Y205.044 E.00329
G1 X39.022 Y205.243 F30000
G1 F8843.478
G1 X39.107 Y205.216 E.00286
G3 X39.766 Y205.078 I.903 J2.66 E.02173
G3 X40.761 Y205.17 I.25 J2.725 E.03231
G3 X38.847 Y205.319 I-.752 J2.706 E.50447
G1 X38.967 Y205.267 E.00421
G1 X39.511 Y205.526 F30000
G1 F8843.478
G1 X39.797 Y205.484 E.00929
G3 X40.651 Y205.562 I.13 J3.278 E.02766
G3 X39.453 Y205.539 I-.643 J2.314 E.44625
G1 X39.817 Y205.876 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X39.826 Y205.875 E.00028
G3 X40.349 Y205.895 I.177 J2.148 E.01563
G3 X39.553 Y205.919 I-.34 J1.98 E.35205
G1 X39.757 Y205.886 E.00615
; WIPE_START
M204 S10000
G1 X39.826 Y205.875 E-.02643
G1 X40.15 Y205.87 E-.12317
G1 X40.349 Y205.895 E-.07618
G1 X40.734 Y206.004 E-.15213
G1 X40.917 Y206.086 E-.07614
G1 X41.253 Y206.303 E-.15213
G1 X41.54 Y206.583 E-.15211
G1 X41.542 Y206.587 E-.00171
; WIPE_END
G1 E-.04 F1800
G1 X49.159 Y207.075 Z1.6 F30000
G1 X226.584 Y218.459 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X29.416 Y218.459 E6.34019
G1 X29.416 Y33.541 E5.94628
G1 X226.584 Y33.541 E6.34019
G1 X226.584 Y218.399 E5.94435
G1 X226.991 Y218.866 F30000
G1 F8843.478
G1 X29.009 Y218.866 E6.36637
G1 X29.009 Y33.134 E5.97246
G1 X226.991 Y33.134 E6.36637
G1 X226.991 Y218.806 E5.97053
G1 X227.398 Y219.273 F30000
G1 F8843.478
G1 X28.602 Y219.273 E6.39255
G1 X28.602 Y32.727 E5.99864
G1 X227.398 Y32.727 E6.39255
G1 X227.398 Y219.213 E5.99671
G1 X227.79 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X28.21 Y219.665 E5.94481
G1 X28.21 Y32.335 E5.57992
G1 X227.79 Y32.335 E5.94481
G1 X227.79 Y219.605 E5.57813
; WIPE_START
M204 S10000
G1 X225.79 Y219.606 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X226.236 Y216.116 Z1.6 F30000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X226.236 Y217.744 E.05236
G1 X225.868 Y218.111 E.01669
G1 X218.328 Y210.571 E.34285
G3 X215.334 Y211.375 I-2.365 J-2.833 E.10288
G1 X208.597 Y218.111 E.30636
G1 X188.126 Y197.639 E.93094
G1 X188.771 Y197.639 E.02075
G1 X168.298 Y218.111 E.93098
G1 X147.827 Y197.639 E.93094
G1 X148.472 Y197.639 E.02075
G1 X127.999 Y218.111 E.93098
G1 X107.528 Y197.639 E.93094
G1 X108.173 Y197.639 E.02075
G1 X87.7 Y218.111 E.93098
G1 X67.229 Y197.639 E.93094
G1 X67.874 Y197.639 E.02075
G1 X47.403 Y218.111 E.93094
G1 X40.667 Y211.376 E.30628
G3 X37.67 Y210.573 I-.625 J-3.663 E.10295
G1 X30.132 Y218.111 E.34277
G1 X29.764 Y217.744 E.01669
G1 X29.764 Y216.116 E.05236
G1 X36.564 Y208.821 F30000
G1 F8843.478
G3 X36.5 Y207.209 I4.085 J-.969 E.0522
G1 X29.764 Y200.473 E.30632
G1 X29.764 Y201.208 E.02361
G1 X50.236 Y180.737 E.93094
G1 X50.236 Y180.646 E.00292
G1 X29.764 Y160.175 E.93094
G1 X29.764 Y160.909 E.02361
G1 X50.236 Y140.438 E.93094
G1 X50.236 Y140.347 E.00292
G1 X39.4 Y129.511 E.49276
G3 X38.441 Y129.204 I1.285 J-5.656 E.03241
G1 X29.764 Y137.881 E.39459
G1 X29.764 Y137.147 E.02361
G1 X50.236 Y157.618 E.93094
G1 X50.236 Y157.709 E.00292
G1 X29.764 Y178.18 E.93094
G1 X29.764 Y177.446 E.02361
G1 X70.429 Y218.111 E1.84928
G1 X90.902 Y197.639 E.93098
G1 X90.257 Y197.639 E.02075
G1 X110.728 Y218.111 E.93094
G1 X131.201 Y197.639 E.93098
G1 X130.556 Y197.639 E.02075
G1 X151.027 Y218.111 E.93094
G1 X171.5 Y197.639 E.93098
G1 X170.855 Y197.639 E.02075
G1 X191.328 Y218.111 E.93098
G1 X226.236 Y183.203 E1.58747
G1 X226.236 Y183.937 E.02361
G1 X205.764 Y163.466 E.93094
G1 X205.764 Y163.375 E.00292
G1 X226.236 Y142.904 E.93094
G1 X226.236 Y143.638 E.02361
G1 X205.764 Y123.167 E.93094
G1 X205.764 Y123.076 E.00292
G1 X226.236 Y102.605 E.93094
G1 X226.236 Y103.339 E.02361
G1 X205.764 Y82.868 E.93094
G1 X205.764 Y82.777 E.00292
G1 X226.236 Y62.306 E.93094
G1 X226.236 Y63.04 E.02361
G1 X197.085 Y33.889 E1.32567
G1 X176.612 Y54.361 E.93098
G1 X177.257 Y54.361 E.02075
G1 X156.786 Y33.889 E.93094
G1 X136.313 Y54.361 E.93098
G1 X136.958 Y54.361 E.02075
G1 X129.798 Y47.2 E.32562
G3 X126.2 Y47.203 I-1.801 J-3.19 E.12095
G1 X119.042 Y54.361 E.3255
G1 X119.687 Y54.361 E.02075
G1 X99.214 Y33.889 E.93098
G1 X78.743 Y54.361 E.93094
G1 X79.388 Y54.361 E.02075
G1 X58.915 Y33.889 E.93098
G1 X29.764 Y63.04 E1.32567
G1 X29.764 Y62.306 E.02361
G1 X50.236 Y82.777 E.93094
G1 X50.236 Y82.868 E.00292
G1 X29.764 Y103.339 E.93094
G1 X29.764 Y102.605 E.02361
G1 X50.236 Y123.076 E.93094
G1 X50.236 Y123.167 E.00292
G1 X29.764 Y143.638 E.93094
G1 X29.764 Y142.904 E.02361
G1 X50.236 Y163.375 E.93094
G1 X50.236 Y163.466 E.00292
G1 X29.764 Y183.937 E.93094
G1 X29.764 Y183.203 E.02361
G1 X64.672 Y218.111 E1.58747
G1 X85.145 Y197.639 E.93098
G1 X84.5 Y197.639 E.02075
G1 X104.971 Y218.111 E.93094
G1 X125.444 Y197.639 E.93098
G1 X124.799 Y197.639 E.02075
G1 X145.27 Y218.111 E.93094
G1 X165.743 Y197.639 E.93098
G1 X165.098 Y197.639 E.02075
G1 X185.571 Y218.111 E.93098
G1 X226.236 Y177.446 E1.84928
G1 X226.236 Y178.18 E.02361
G1 X205.764 Y157.709 E.93094
G1 X205.764 Y157.618 E.00292
G1 X226.236 Y137.147 E.93094
G1 X226.236 Y137.881 E.02361
G1 X217.559 Y129.205 E.39457
G3 X216.596 Y129.515 I-2.544 J-6.237 E.03257
G1 X205.764 Y140.347 E.49258
G1 X205.764 Y140.438 E.00292
G1 X226.236 Y160.909 E.93094
G1 X226.236 Y160.175 E.02361
G1 X205.764 Y180.646 E.93094
G1 X205.764 Y180.737 E.00292
G1 X226.236 Y201.208 E.93094
G1 X226.236 Y200.473 E.02361
G1 X219.502 Y207.207 E.30622
G3 X219.435 Y208.82 I-3.565 J.661 E.05233
; WIPE_START
G1 X219.567 Y207.875 E-.36238
G1 X219.502 Y207.207 E-.25495
G1 X219.767 Y206.942 E-.14267
; WIPE_END
G1 E-.04 F1800
G1 X214.981 Y204.461 Z1.6 F30000
G1 Z1.2
G1 E.8 F1800
G1 F8843.478
G3 X216.593 Y204.359 I1.168 J5.674 E.05209
M73 P46 R41
G1 X226.236 Y194.716 E.43851
G1 X226.236 Y195.451 E.02361
G1 X205.764 Y174.98 E.93094
G1 X205.764 Y174.889 E.00292
G1 X226.236 Y154.418 E.93094
G1 X226.236 Y155.152 E.02361
G1 X205.764 Y134.681 E.93094
G1 X205.764 Y134.59 E.00292
G1 X212.794 Y127.561 E.31966
G3 X212.794 Y124.439 I3.244 J-1.561 E.10382
G1 X205.764 Y117.41 E.31966
G1 X205.764 Y117.319 E.00292
G1 X226.236 Y96.848 E.93094
G1 X226.236 Y97.582 E.02361
G1 X205.764 Y77.111 E.93094
G1 X205.764 Y77.02 E.00292
G1 X226.236 Y56.549 E.93094
G1 X226.236 Y57.284 E.02361
G1 X216.593 Y47.641 E.43851
G3 X214.982 Y47.539 I-.582 J-3.583 E.05233
; WIPE_START
G1 X215.911 Y47.691 E-.35767
G1 X216.593 Y47.641 E-.25969
G1 X216.858 Y47.906 E-.14264
; WIPE_END
G1 E-.04 F1800
G1 X219.435 Y43.18 Z1.6 F30000
G1 Z1.2
G1 E.8 F1800
G1 F8843.478
G3 X219.502 Y44.793 I-3.501 J.952 E.05233
G1 X226.236 Y51.527 E.30622
G1 X226.236 Y50.792 E.02361
G1 X205.764 Y71.263 E.93094
G1 X205.764 Y71.354 E.00292
G1 X226.236 Y91.825 E.93094
G1 X226.236 Y91.091 E.02361
G1 X205.764 Y111.562 E.93094
G1 X205.764 Y111.653 E.00292
G1 X216.596 Y122.485 E.49258
G3 X217.559 Y122.795 I-1.581 J6.546 E.03257
G1 X226.236 Y114.119 E.39457
G1 X226.236 Y114.853 E.02361
G1 X205.764 Y94.382 E.93094
G1 X205.764 Y94.291 E.00292
G1 X226.236 Y73.82 E.93094
G1 X226.236 Y74.554 E.02361
G1 X185.571 Y33.889 E1.84928
G1 X165.098 Y54.361 E.93098
G1 X165.743 Y54.361 E.02075
G1 X145.272 Y33.889 E.93094
G1 X124.799 Y54.361 E.93098
G1 X125.444 Y54.361 E.02075
G1 X104.973 Y33.889 E.93094
G1 X84.5 Y54.361 E.93098
G1 X85.145 Y54.361 E.02075
G1 X64.672 Y33.889 E.93098
G1 X29.764 Y68.797 E1.58747
G1 X29.764 Y68.063 E.02361
G1 X50.236 Y88.534 E.93094
G1 X50.236 Y88.625 E.00292
G1 X29.764 Y109.096 E.93094
G1 X29.764 Y108.362 E.02361
G1 X50.236 Y128.833 E.93094
G1 X50.236 Y128.924 E.00292
G1 X29.764 Y149.395 E.93094
G1 X29.764 Y148.661 E.02361
G1 X50.236 Y169.132 E.93094
G1 X50.236 Y169.223 E.00292
G1 X29.764 Y189.694 E.93094
G1 X29.764 Y188.96 E.02361
G1 X58.915 Y218.111 E1.32567
G1 X79.388 Y197.639 E.93098
G1 X78.743 Y197.639 E.02075
G1 X99.214 Y218.111 E.93094
G1 X119.687 Y197.639 E.93098
G1 X119.042 Y197.639 E.02075
G1 X126.2 Y204.797 E.3255
G3 X129.798 Y204.8 I1.797 J3.15 E.12107
G1 X136.958 Y197.639 E.32562
G1 X136.313 Y197.639 E.02075
G1 X156.786 Y218.111 E.93098
G1 X177.257 Y197.639 E.93094
G1 X176.612 Y197.639 E.02075
G1 X197.085 Y218.111 E.93098
G1 X226.236 Y188.96 E1.32567
G1 X226.236 Y189.694 E.02361
G1 X205.764 Y169.223 E.93094
G1 X205.764 Y169.132 E.00292
G1 X226.236 Y148.661 E.93094
G1 X226.236 Y149.395 E.02361
G1 X205.764 Y128.924 E.93094
G1 X205.764 Y128.833 E.00292
G1 X226.236 Y108.362 E.93094
G1 X226.236 Y109.096 E.02361
G1 X205.764 Y88.625 E.93094
G1 X205.764 Y88.534 E.00292
G1 X226.236 Y68.063 E.93094
G1 X226.236 Y68.797 E.02361
G1 X191.328 Y33.889 E1.58747
G1 X170.855 Y54.361 E.93098
G1 X171.5 Y54.361 E.02075
G1 X151.029 Y33.889 E.93094
G1 X130.556 Y54.361 E.93098
G1 X131.201 Y54.361 E.02075
G1 X110.73 Y33.889 E.93094
G1 X90.257 Y54.361 E.93098
G1 X90.902 Y54.361 E.02075
G1 X70.429 Y33.889 E.93098
G1 X29.764 Y74.554 E1.84928
G1 X29.764 Y73.82 E.02361
G1 X50.236 Y94.291 E.93094
G1 X50.236 Y94.382 E.00292
G1 X29.764 Y114.853 E.93094
G1 X29.764 Y114.119 E.02361
G1 X38.441 Y122.796 E.3946
G3 X39.394 Y122.495 I2.068 J4.882 E.03216
G1 X50.236 Y111.653 E.49304
G1 X50.236 Y111.562 E.00292
G1 X29.764 Y91.091 E.93094
G1 X29.764 Y91.825 E.02361
G1 X50.236 Y71.354 E.93094
G1 X50.236 Y71.263 E.00292
G1 X29.764 Y50.792 E.93094
G1 X29.764 Y51.527 E.02361
G1 X36.5 Y44.791 E.30632
G3 X36.564 Y43.179 I4.149 J-.643 E.0522
; WIPE_START
G1 X36.438 Y43.947 E-.29591
G1 X36.5 Y44.791 E-.32142
G1 X36.235 Y45.056 E-.14267
; WIPE_END
G1 E-.04 F1800
G1 X41.02 Y47.54 Z1.6 F30000
G1 Z1.2
G1 E.8 F1800
G1 F8843.478
G3 X39.41 Y47.638 I-1.056 J-4.073 E.0522
G1 X29.764 Y57.283 E.43863
G1 X29.764 Y56.549 E.02361
G1 X50.236 Y77.02 E.93094
G1 X50.236 Y77.111 E.00292
G1 X29.764 Y97.582 E.93094
G1 X29.764 Y96.848 E.02361
G1 X50.236 Y117.319 E.93094
G1 X50.236 Y117.41 E.00292
G1 X43.203 Y124.442 E.31979
G3 X43.287 Y127.385 I-3.228 J1.564 E.09757
G1 X43.203 Y127.558 E.00616
G1 X50.236 Y134.59 E.31979
G1 X50.236 Y134.681 E.00292
G1 X29.764 Y155.152 E.93094
G1 X29.764 Y154.418 E.02361
G1 X50.236 Y174.889 E.93094
G1 X50.236 Y174.98 E.00292
G1 X29.764 Y195.451 E.93094
G1 X29.764 Y194.716 E.02361
G1 X39.415 Y204.367 E.43885
G3 X41.025 Y204.461 I.603 J3.475 E.05233
G1 X52.232 Y197.639 F30000
G1 F8843.478
G1 X50.604 Y197.639 E.05236
G1 X42.698 Y205.545 E.35952
G3 X43.513 Y208.465 I-2.854 J2.371 E.10044
G1 X53.16 Y218.111 E.43866
G1 X73.631 Y197.639 E.93094
G1 X72.986 Y197.639 E.02075
G1 X93.459 Y218.111 E.93098
G1 X113.93 Y197.639 E.93094
G1 X113.285 Y197.639 E.02075
G1 X124.607 Y208.962 E.5149
G2 X124.924 Y209.674 I3.527 J-1.139 E.0251
G1 X116.485 Y218.111 E.3837
G1 X96.014 Y197.639 E.93094
G1 X96.659 Y197.639 E.02075
G1 X76.186 Y218.111 E.93098
G1 X55.715 Y197.639 E.93094
G1 X56.36 Y197.639 E.02075
G1 X35.889 Y218.111 E.93094
G1 X29.764 Y211.987 E.2785
G1 X29.764 Y212.722 E.02361
G1 X50.236 Y192.251 E.93094
G1 X50.236 Y192.16 E.00292
G1 X29.764 Y171.689 E.93094
G1 X29.764 Y172.423 E.02361
G1 X50.236 Y151.952 E.93094
G1 X50.236 Y151.861 E.00292
G1 X29.764 Y131.39 E.93094
G1 X29.764 Y132.124 E.02361
G1 X36.487 Y125.402 E.3057
G2 X36.487 Y126.598 I3.637 J.598 E.03864
G1 X29.764 Y119.876 E.3057
G1 X29.764 Y120.61 E.02361
G1 X50.236 Y100.139 E.93094
G1 X50.236 Y100.048 E.00292
G1 X29.764 Y79.577 E.93094
G1 X29.764 Y80.311 E.02361
G1 X50.236 Y59.84 E.93094
G1 X50.236 Y59.749 E.00292
G1 X29.764 Y39.278 E.93094
G1 X29.764 Y40.013 E.02361
G1 X35.889 Y33.889 E.2785
G1 X56.361 Y54.361 E.93094
G1 X55.715 Y54.361 E.02075
G1 X76.186 Y33.889 E.93094
G1 X96.659 Y54.361 E.93098
G1 X96.014 Y54.361 E.02075
G1 X116.485 Y33.889 E.93094
G1 X124.924 Y42.326 E.3837
G2 X124.607 Y43.038 I3.211 J1.851 E.0251
G1 X113.285 Y54.361 E.5149
G1 X113.93 Y54.361 E.02075
G1 X93.459 Y33.889 E.93094
G1 X72.986 Y54.361 E.93098
G1 X73.631 Y54.361 E.02075
G1 X53.16 Y33.889 E.93094
G1 X43.513 Y43.535 E.43866
G3 X42.698 Y46.455 I-3.67 J.549 E.10044
G1 X50.604 Y54.361 E.35952
G1 X52.232 Y54.361 E.05236
; WIPE_START
G1 X50.604 Y54.361 E-.61876
G1 X50.341 Y54.098 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X44.626 Y49.039 Z1.6 F30000
G1 X29.764 Y35.884 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F8843.478
G1 X29.764 Y34.256 E.05236
G1 X30.132 Y33.889 E.01669
G1 X37.67 Y41.427 E.34277
G3 X40.667 Y40.624 I2.336 J2.723 E.1032
M73 P46 R40
G1 X47.403 Y33.889 E.30628
G1 X67.874 Y54.361 E.93094
G1 X67.229 Y54.361 E.02075
G1 X87.7 Y33.889 E.93094
G1 X108.173 Y54.361 E.93098
G1 X107.528 Y54.361 E.02075
G1 X127.999 Y33.889 E.93094
G1 X148.472 Y54.361 E.93098
G1 X147.827 Y54.361 E.02075
G1 X168.298 Y33.889 E.93094
G1 X188.771 Y54.361 E.93098
G1 X188.126 Y54.361 E.02075
G1 X208.597 Y33.889 E.93094
G1 X215.337 Y40.628 E.30648
G3 X218.328 Y41.429 I.67 J3.487 E.10304
G1 X225.868 Y33.889 E.34285
G1 X226.236 Y34.256 E.01669
G1 X226.236 Y35.884 E.05236
; WIPE_START
G1 X226.236 Y34.256 E-.61876
G1 X225.972 Y33.993 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X220.347 Y39.153 Z1.6 F30000
G1 X203.768 Y54.361 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F8843.478
G1 X205.396 Y54.361 E.05236
G1 X213.304 Y46.453 E.35958
G3 X212.485 Y43.533 I2.849 J-2.373 E.10046
G1 X202.84 Y33.889 E.4386
G1 X182.369 Y54.361 E.93094
G1 X183.014 Y54.361 E.02075
G1 X162.541 Y33.889 E.93098
G1 X142.07 Y54.361 E.93094
G1 X142.715 Y54.361 E.02075
G1 X131.397 Y43.042 E.51471
G2 X131.076 Y42.327 I-3.653 J1.209 E.02526
G1 X139.515 Y33.889 E.38373
G1 X159.986 Y54.361 E.93094
G1 X159.341 Y54.361 E.02075
G1 X179.814 Y33.889 E.93098
G1 X200.285 Y54.361 E.93094
G1 X199.64 Y54.361 E.02075
G1 X220.111 Y33.889 E.93094
G1 X226.236 Y40.013 E.2785
G1 X226.236 Y39.278 E.02361
G1 X205.764 Y59.749 E.93094
G1 X205.764 Y59.84 E.00292
G1 X226.236 Y80.311 E.93094
G1 X226.236 Y79.577 E.02361
G1 X205.764 Y100.048 E.93094
G1 X205.764 Y100.139 E.00292
G1 X226.236 Y120.61 E.93094
G1 X226.236 Y119.876 E.02361
G1 X219.512 Y126.599 E.30575
G2 X219.512 Y125.401 I-4.861 J-.599 E.03864
G1 X226.236 Y132.124 E.30575
G1 X226.236 Y131.39 E.02361
G1 X205.764 Y151.861 E.93094
G1 X205.764 Y151.952 E.00292
G1 X226.236 Y172.423 E.93094
G1 X226.236 Y171.689 E.02361
G1 X205.764 Y192.16 E.93094
G1 X205.764 Y192.251 E.00292
G1 X226.236 Y212.722 E.93094
G1 X226.236 Y211.987 E.02361
G1 X220.111 Y218.111 E.2785
G1 X199.639 Y197.639 E.93094
G1 X200.285 Y197.639 E.02075
G1 X179.814 Y218.111 E.93094
G1 X159.341 Y197.639 E.93098
G1 X159.986 Y197.639 E.02075
G1 X139.515 Y218.111 E.93094
G1 X131.076 Y209.673 E.38373
G2 X131.397 Y208.958 I-3.33 J-1.923 E.02526
G1 X142.715 Y197.639 E.51471
G1 X142.07 Y197.639 E.02075
G1 X162.541 Y218.111 E.93094
G1 X183.014 Y197.639 E.93098
G1 X182.369 Y197.639 E.02075
G1 X202.84 Y218.111 E.93094
G1 X212.485 Y208.467 E.43861
G3 X213.304 Y205.547 I3.667 J-.547 E.10046
G1 X205.396 Y197.639 E.35958
G1 X203.768 Y197.639 E.05236
; WIPE_START
G1 X205.396 Y197.639 E-.61876
G1 X205.659 Y197.902 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X198.119 Y199.082 Z1.6 F30000
G1 X125.531 Y210.443 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F8843.478
G2 X126.916 Y211.271 I2.813 J-3.135 E.0522
G1 X133.758 Y218.111 E.3111
G1 X154.229 Y197.639 E.93094
G1 X153.584 Y197.639 E.02075
G1 X174.055 Y218.111 E.93094
G1 X194.528 Y197.639 E.93098
G1 X193.883 Y197.639 E.02075
G1 X214.354 Y218.111 E.93094
G1 X226.236 Y206.23 E.5403
G1 X226.236 Y206.965 E.02361
G1 X205.764 Y186.494 E.93094
G1 X205.764 Y186.403 E.00292
G1 X226.236 Y165.932 E.93094
G1 X226.236 Y166.666 E.02361
G1 X205.764 Y146.195 E.93094
G1 X205.764 Y146.104 E.00292
G1 X226.236 Y125.633 E.93094
G1 X226.236 Y126.367 E.02361
G1 X205.764 Y105.896 E.93094
G1 X205.764 Y105.805 E.00292
G1 X226.236 Y85.334 E.93094
G1 X226.236 Y86.068 E.02361
G1 X205.764 Y65.597 E.93094
G1 X205.764 Y65.506 E.00292
G1 X226.236 Y45.035 E.93094
G1 X226.236 Y45.77 E.02361
G1 X214.354 Y33.889 E.5403
G1 X193.883 Y54.361 E.93094
G1 X194.528 Y54.361 E.02075
G1 X174.055 Y33.889 E.93098
G1 X153.584 Y54.361 E.93094
G1 X154.229 Y54.361 E.02075
G1 X133.758 Y33.889 E.93094
G1 X126.916 Y40.729 E.3111
G3 X129.087 Y40.732 I1.08 J4.109 E.07058
G1 X122.242 Y33.889 E.31122
G1 X101.771 Y54.361 E.93094
G1 X102.416 Y54.361 E.02075
G1 X81.945 Y33.889 E.93094
G1 X61.472 Y54.361 E.93098
G1 X62.117 Y54.361 E.02075
G1 X41.646 Y33.889 E.93094
G1 X29.764 Y45.77 E.5403
G1 X29.764 Y45.035 E.02361
G1 X50.236 Y65.506 E.93094
G1 X50.236 Y65.597 E.00292
G1 X29.764 Y86.068 E.93094
G1 X29.764 Y85.334 E.02361
G1 X50.236 Y105.805 E.93094
G1 X50.236 Y105.896 E.00292
G1 X29.764 Y126.367 E.93094
G1 X29.764 Y125.633 E.02361
G1 X50.236 Y146.104 E.93094
G1 X50.236 Y146.195 E.00292
G1 X29.764 Y166.666 E.93094
G1 X29.764 Y165.932 E.02361
G1 X50.236 Y186.403 E.93094
G1 X50.236 Y186.494 E.00292
G1 X29.764 Y206.965 E.93094
G1 X29.764 Y206.23 E.02361
G1 X41.646 Y218.111 E.5403
G1 X62.117 Y197.639 E.93094
G1 X61.472 Y197.639 E.02075
G1 X81.945 Y218.111 E.93098
G1 X102.416 Y197.639 E.93094
G1 X101.771 Y197.639 E.02075
G1 X122.242 Y218.111 E.93094
G1 X129.087 Y211.268 E.31122
G2 X130.474 Y210.443 I-1.117 J-3.457 E.05233
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X129.935 Y210.871 E-.2614
G1 X129.087 Y211.268 E-.35597
G1 X128.821 Y211.533 E-.14264
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
G1 X126.542 Y205.011
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X126.679 Y204.948 E.00485
G3 X127.748 Y204.671 I1.329 J2.927 E.03567
G3 X129.176 Y204.879 I.25 J3.278 E.04678
G3 X126.395 Y205.095 I-1.167 J2.996 E.55683
G1 X126.49 Y205.04 E.00353
G1 X127.029 Y205.241 F30000
G1 F8843.478
G1 X127.107 Y205.216 E.00262
G3 X127.778 Y205.077 I.903 J2.66 E.02211
G3 X128.761 Y205.17 I.239 J2.724 E.03192
G3 X126.847 Y205.319 I-.751 J2.706 E.50447
G1 X126.974 Y205.265 E.00445
G1 X127.519 Y205.525 F30000
G1 F8843.478
G1 X127.809 Y205.483 E.00941
G3 X128.651 Y205.562 I.113 J3.311 E.02727
G3 X127.461 Y205.538 I-.642 J2.314 E.4465
G1 X127.93 Y205.873 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.15 Y205.872 E.00656
G3 X128.349 Y205.895 I-.146 J2.146 E.00597
G3 X127.838 Y205.874 I-.339 J1.98 E.36063
G1 X127.87 Y205.873 E.00095
; WIPE_START
M204 S10000
G1 X128.15 Y205.872 E-.10646
G1 X128.349 Y205.895 E-.07614
G1 X128.544 Y205.94 E-.07616
G1 X128.917 Y206.086 E-.15212
G1 X129.253 Y206.303 E-.1521
G1 X129.54 Y206.583 E-.15214
G1 X129.606 Y206.68 E-.04489
; WIPE_END
G1 E-.04 F1800
G1 X137.237 Y206.518 Z1.8 F30000
G1 X216.988 Y204.816 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X217.176 Y204.88 E.00637
G3 X215.748 Y204.671 I-1.167 J2.996 E.60279
G3 X216.871 Y204.779 I.25 J3.277 E.03647
G1 X216.931 Y204.798 E.00202
G1 X216.541 Y205.119 F30000
G1 F8843.478
G1 X216.761 Y205.17 E.00726
G3 X215.778 Y205.077 I-.751 J2.706 E.53557
G3 X216.483 Y205.106 I.239 J2.725 E.02273
G1 X216.097 Y205.48 F30000
G1 F8843.478
G1 X216.179 Y205.491 E.00264
G3 X216.651 Y205.562 I-.257 J3.304 E.01537
G3 X215.809 Y205.483 I-.642 J2.314 E.45784
G1 X216.037 Y205.48 E.00735
G1 X215.83 Y205.875 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X215.838 Y205.874 E.00023
G3 X216.349 Y205.895 I.166 J2.144 E.01527
G3 X215.554 Y205.919 I-.339 J1.98 E.35205
G1 X215.771 Y205.884 E.00656
; WIPE_START
M204 S10000
G1 X215.838 Y205.874 E-.02576
G1 X216.15 Y205.87 E-.11863
G1 X216.349 Y205.895 E-.07617
G1 X216.734 Y206.004 E-.15214
G1 X217.091 Y206.186 E-.15208
G1 X217.404 Y206.436 E-.15213
G1 X217.544 Y206.603 E-.08309
; WIPE_END
G1 E-.04 F1800
G1 X217.379 Y198.973 Z1.8 F30000
G1 X215.868 Y129.213 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X215.6 Y129.189 E.00864
G3 X215.748 Y122.796 I.408 J-3.189 E.30323
G3 X217.176 Y123.005 I.25 J3.278 E.04678
G3 X215.928 Y129.214 I-1.167 J2.996 E.289
G1 X215.896 Y128.807 F30000
G1 F8843.478
G1 X215.651 Y128.787 E.0079
G3 X215.778 Y123.202 I.359 J-2.786 E.26471
G3 X216.761 Y123.295 I.238 J2.726 E.03192
G3 X215.956 Y128.809 I-.751 J2.706 E.26103
G1 X215.94 Y128.39 F30000
G1 F8843.478
G1 X215.702 Y128.382 E.00768
G3 X215.809 Y123.608 I.307 J-2.382 E.22627
G3 X216.651 Y123.687 I.113 J3.314 E.02727
G3 X216.18 Y128.396 I-.642 J2.314 E.21618
G1 X216 Y128.392 E.00576
G1 X215.931 Y128.007 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X215.554 Y127.956 E.01135
G3 X215.838 Y123.999 I.456 J-1.956 E.16913
G3 X216.349 Y124.02 I.166 J2.144 E.01527
G3 X215.991 Y128.008 I-.339 J1.98 E.17836
; WIPE_START
M204 S10000
G1 X215.554 Y127.956 E-.16736
G1 X215.36 Y127.906 E-.07611
G1 X214.995 Y127.741 E-.15208
G1 X214.67 Y127.507 E-.15214
G1 X214.398 Y127.214 E-.15211
G1 X214.315 Y127.079 E-.0602
; WIPE_END
G1 E-.04 F1800
G1 X214.335 Y119.446 Z1.8 F30000
G1 X214.543 Y41.26 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X214.679 Y41.198 E.00482
G3 X215.748 Y40.921 I1.33 J2.927 E.03568
G3 X217.176 Y41.13 I.25 J3.277 E.04678
G3 X214.395 Y41.345 I-1.167 J2.996 E.55683
G1 X214.491 Y41.29 E.00355
G1 X215.03 Y41.49 F30000
G1 F8843.478
G1 X215.107 Y41.466 E.0026
G3 X215.778 Y41.327 I.903 J2.66 E.02212
G3 X216.761 Y41.42 I.238 J2.725 E.03192
G3 X214.847 Y41.569 I-.751 J2.706 E.50447
G1 X214.975 Y41.514 E.00447
G1 X215.52 Y41.775 F30000
G1 F8843.478
G1 X215.809 Y41.733 E.00939
G3 X216.651 Y41.812 I.113 J3.313 E.02727
G3 X215.461 Y41.788 I-.642 J2.314 E.44653
M73 P47 R40
G1 X215.837 Y42.124 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X215.838 Y42.124 E.00004
G3 X216.349 Y42.145 I.166 J2.144 E.01527
G3 X215.554 Y42.169 I-.339 J1.98 E.35204
G1 X215.777 Y42.133 E.00675
; WIPE_START
M204 S10000
G1 X215.838 Y42.124 E-.02335
G1 X216.15 Y42.12 E-.11864
G1 X216.349 Y42.145 E-.07617
G1 X216.544 Y42.19 E-.07615
G1 X216.917 Y42.336 E-.15212
G1 X217.253 Y42.553 E-.15213
G1 X217.54 Y42.833 E-.15213
G1 X217.554 Y42.853 E-.00932
; WIPE_END
G1 E-.04 F1800
G1 X209.923 Y42.72 Z1.8 F30000
G1 X126.543 Y41.26 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X126.679 Y41.198 E.00481
G3 X127.748 Y40.921 I1.33 J2.927 E.03568
G3 X129.176 Y41.129 I.25 J3.278 E.04677
G3 X126.395 Y41.345 I-1.167 J2.996 E.55683
G1 X126.491 Y41.29 E.00356
G1 X127.03 Y41.49 F30000
G1 F8843.478
G1 X127.107 Y41.466 E.00259
G3 X127.778 Y41.327 I.903 J2.66 E.02211
G3 X128.761 Y41.42 I.238 J2.724 E.03192
G3 X126.847 Y41.569 I-.751 J2.706 E.50446
G1 X126.975 Y41.514 E.00448
G1 X127.52 Y41.775 F30000
G1 F8843.478
G1 X127.809 Y41.733 E.00938
G3 X128.651 Y41.812 I.113 J3.312 E.02727
G3 X127.462 Y41.788 I-.642 J2.314 E.44653
G1 X127.837 Y42.124 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X127.838 Y42.124 E.00004
G3 X128.349 Y42.145 I.166 J2.144 E.01527
G3 X127.554 Y42.169 I-.339 J1.98 E.35204
G1 X127.777 Y42.133 E.00675
; WIPE_START
M204 S10000
G1 X127.838 Y42.124 E-.02331
G1 X128.15 Y42.12 E-.11864
G1 X128.349 Y42.145 E-.07618
G1 X128.544 Y42.19 E-.07614
G1 X128.917 Y42.336 E-.15213
G1 X129.253 Y42.553 E-.1521
G1 X129.54 Y42.833 E-.15216
G1 X129.554 Y42.853 E-.00935
; WIPE_END
G1 E-.04 F1800
G1 X121.923 Y42.699 Z1.8 F30000
G1 X40.987 Y41.066 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.176 Y41.129 E.00639
G3 X39.748 Y40.921 I-1.167 J2.996 E.6028
G3 X40.871 Y41.029 I.25 J3.278 E.03646
G1 X40.93 Y41.048 E.00199
G1 X40.54 Y41.369 F30000
G1 F8843.478
G1 X40.761 Y41.42 E.00728
G3 X39.778 Y41.327 I-.751 J2.706 E.53557
G3 X40.482 Y41.356 I.238 J2.725 E.0227
G1 X40.096 Y41.73 F30000
G1 F8843.478
G1 X40.179 Y41.741 E.00267
G3 X40.651 Y41.812 I-.257 J3.304 E.01537
G3 X39.809 Y41.733 I-.642 J2.314 E.45784
G1 X40.036 Y41.73 E.00732
G1 X39.821 Y42.126 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X39.838 Y42.124 E.00051
G3 X40.349 Y42.145 I.166 J2.144 E.01527
G3 X39.554 Y42.169 I-.339 J1.98 E.35204
G1 X39.762 Y42.136 E.00629
; WIPE_START
M204 S10000
G1 X39.838 Y42.124 E-.02928
G1 X40.15 Y42.12 E-.11864
G1 X40.349 Y42.145 E-.07618
G1 X40.544 Y42.19 E-.07614
G1 X40.917 Y42.336 E-.15213
G1 X41.253 Y42.553 E-.1521
G1 X41.54 Y42.833 E-.15216
G1 X41.545 Y42.84 E-.00338
; WIPE_END
G1 E-.04 F1800
G1 X47.099 Y48.075 Z1.8 F30000
G1 X205.416 Y197.291 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X50.584 Y197.291 E4.97885
G1 X50.584 Y54.709 E4.58493
G1 X205.416 Y54.709 E4.97885
G1 X205.416 Y197.231 E4.583
G1 X205.009 Y196.884 F30000
G1 F8843.478
G1 X50.991 Y196.884 E4.95267
G1 X50.991 Y55.116 E4.55875
G1 X205.009 Y55.116 E4.95267
G1 X205.009 Y196.824 E4.55682
G1 X204.602 Y196.477 F30000
G1 F8843.478
G1 X51.398 Y196.477 E4.92649
G1 X51.398 Y55.523 E4.53257
G1 X204.602 Y55.523 E4.92649
G1 X204.602 Y196.417 E4.53064
G1 X204.21 Y196.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X51.79 Y196.085 E4.54007
G1 X51.79 Y55.915 E4.17519
G1 X204.21 Y55.915 E4.54007
G1 X204.21 Y196.025 E4.1734
; WIPE_START
M204 S10000
G1 X202.21 Y196.026 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X195.258 Y192.875 Z1.8 F30000
G1 X40.988 Y122.941 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.176 Y123.004 E.00636
G3 X39.748 Y122.796 I-1.167 J2.996 E.6028
G3 X40.871 Y122.904 I.25 J3.278 E.03646
G1 X40.931 Y122.923 E.00203
G1 X40.541 Y123.244 F30000
G1 F8843.478
G1 X40.761 Y123.295 E.00725
G3 X39.778 Y123.202 I-.751 J2.706 E.53558
G3 X40.483 Y123.231 I.238 J2.725 E.02273
G1 X40.097 Y123.605 F30000
G1 F8843.478
G1 X40.179 Y123.616 E.00263
G3 X40.651 Y123.687 I-.257 J3.305 E.01537
G3 X39.809 Y123.608 I-.642 J2.314 E.45785
G1 X40.037 Y123.605 E.00736
G1 X39.837 Y123.999 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X39.838 Y123.999 E.00004
G3 X40.349 Y124.02 I.166 J2.144 E.01527
G3 X39.554 Y124.044 I-.339 J1.98 E.35204
G1 X39.777 Y124.008 E.00675
; WIPE_START
M204 S10000
G1 X39.838 Y123.999 E-.02334
G1 X40.15 Y123.995 E-.11864
G1 X40.349 Y124.02 E-.07617
G1 X40.734 Y124.129 E-.15213
G1 X41.091 Y124.311 E-.15209
G1 X41.404 Y124.561 E-.15213
G1 X41.548 Y124.733 E-.08551
; WIPE_END
G1 E-.04 F1800
G1 X41.263 Y132.36 Z1.8 F30000
G1 X38.543 Y205.01 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X38.679 Y204.948 E.00481
G3 X39.748 Y204.671 I1.329 J2.927 E.03567
G3 X41.176 Y204.879 I.25 J3.277 E.04678
G3 X38.395 Y205.095 I-1.167 J2.996 E.55683
G1 X38.491 Y205.04 E.00357
G1 X39.03 Y205.24 F30000
G1 F8843.478
G1 X39.107 Y205.216 E.00258
G3 X39.778 Y205.077 I.903 J2.66 E.02211
G3 X40.761 Y205.17 I.239 J2.724 E.03192
G3 X38.847 Y205.319 I-.751 J2.706 E.50447
G1 X38.975 Y205.264 E.00448
G1 X39.52 Y205.524 F30000
G1 F8843.478
G1 X39.809 Y205.483 E.00937
G3 X40.651 Y205.562 I.113 J3.311 E.02727
G3 X39.462 Y205.537 I-.642 J2.314 E.44654
G1 X39.83 Y205.875 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X39.838 Y205.874 E.00024
G3 X40.349 Y205.895 I.166 J2.144 E.01527
G3 X39.554 Y205.919 I-.339 J1.98 E.35204
G1 X39.771 Y205.884 E.00655
; WIPE_START
M204 S10000
G1 X39.838 Y205.874 E-.02586
G1 X40.15 Y205.87 E-.11863
G1 X40.349 Y205.895 E-.07617
G1 X40.734 Y206.004 E-.15214
G1 X41.091 Y206.186 E-.15212
G1 X41.404 Y206.436 E-.1521
G1 X41.544 Y206.603 E-.08299
; WIPE_END
G1 E-.04 F1800
G1 X49.161 Y207.091 Z1.8 F30000
G1 X226.584 Y218.459 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X29.416 Y218.459 E6.34019
G1 X29.416 Y33.541 E5.94628
G1 X226.584 Y33.541 E6.34019
G1 X226.584 Y218.399 E5.94435
G1 X226.991 Y218.866 F30000
G1 F8843.478
G1 X29.009 Y218.866 E6.36637
G1 X29.009 Y33.134 E5.97246
G1 X226.991 Y33.134 E6.36637
G1 X226.991 Y218.806 E5.97053
G1 X227.398 Y219.273 F30000
G1 F8843.478
G1 X28.602 Y219.273 E6.39255
G1 X28.602 Y32.727 E5.99864
G1 X227.398 Y32.727 E6.39255
G1 X227.398 Y219.213 E5.99671
G1 X227.79 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X28.21 Y219.665 E5.94481
G1 X28.21 Y32.335 E5.57992
G1 X227.79 Y32.335 E5.94481
G1 X227.79 Y219.605 E5.57813
; WIPE_START
M204 S10000
G1 X225.79 Y219.606 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X221.916 Y213.03 Z1.8 F30000
G1 X219.435 Y208.82 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G2 X219.502 Y207.207 I-3.499 J-.952 E.05233
G1 X226.236 Y200.473 E.30622
G1 X226.236 Y201.208 E.02361
G1 X205.764 Y180.737 E.93094
G1 X205.764 Y180.646 E.00292
G1 X226.236 Y160.175 E.93094
G1 X226.236 Y160.909 E.02361
G1 X205.764 Y140.438 E.93094
G1 X205.764 Y140.347 E.00292
G1 X216.596 Y129.515 E.49258
G2 X217.559 Y129.205 I-1.581 J-6.547 E.03257
G1 X226.236 Y137.881 E.39457
G1 X226.236 Y137.147 E.02361
G1 X205.764 Y157.618 E.93094
G1 X205.764 Y157.709 E.00292
G1 X226.236 Y178.18 E.93094
G1 X226.236 Y177.446 E.02361
G1 X185.571 Y218.111 E1.84928
G1 X165.098 Y197.639 E.93098
G1 X165.743 Y197.639 E.02075
G1 X145.272 Y218.111 E.93094
G1 X124.799 Y197.639 E.93098
G1 X125.444 Y197.639 E.02075
G1 X104.973 Y218.111 E.93094
G1 X84.5 Y197.639 E.93098
G1 X85.145 Y197.639 E.02075
G1 X64.672 Y218.111 E.93098
G1 X29.764 Y183.203 E1.58747
G1 X29.764 Y183.937 E.02361
G1 X50.236 Y163.466 E.93094
G1 X50.236 Y163.375 E.00292
G1 X29.764 Y142.904 E.93094
G1 X29.764 Y143.638 E.02361
G1 X50.236 Y123.167 E.93094
G1 X50.236 Y123.076 E.00292
G1 X29.764 Y102.605 E.93094
G1 X29.764 Y103.339 E.02361
M73 P47 R39
G1 X50.236 Y82.868 E.93094
G1 X50.236 Y82.777 E.00292
G1 X29.764 Y62.306 E.93094
G1 X29.764 Y63.04 E.02361
G1 X58.915 Y33.889 E1.32567
G1 X79.388 Y54.361 E.93098
G1 X78.743 Y54.361 E.02075
G1 X99.214 Y33.889 E.93094
G1 X119.687 Y54.361 E.93098
G1 X119.042 Y54.361 E.02075
G1 X126.2 Y47.203 E.3255
G2 X129.798 Y47.2 I1.797 J-3.192 E.12095
G1 X136.958 Y54.361 E.32562
G1 X136.313 Y54.361 E.02075
G1 X156.786 Y33.889 E.93098
G1 X177.257 Y54.361 E.93094
G1 X176.612 Y54.361 E.02075
G1 X197.085 Y33.889 E.93098
G1 X226.236 Y63.04 E1.32567
G1 X226.236 Y62.306 E.02361
G1 X205.764 Y82.777 E.93094
G1 X205.764 Y82.868 E.00292
G1 X226.236 Y103.339 E.93094
G1 X226.236 Y102.605 E.02361
G1 X205.764 Y123.076 E.93094
G1 X205.764 Y123.167 E.00292
G1 X226.236 Y143.638 E.93094
G1 X226.236 Y142.904 E.02361
G1 X205.764 Y163.375 E.93094
G1 X205.764 Y163.466 E.00292
G1 X226.236 Y183.937 E.93094
G1 X226.236 Y183.203 E.02361
G1 X191.328 Y218.111 E1.58747
G1 X170.855 Y197.639 E.93098
G1 X171.5 Y197.639 E.02075
G1 X151.029 Y218.111 E.93094
G1 X130.556 Y197.639 E.93098
M73 P48 R39
G1 X131.201 Y197.639 E.02075
G1 X110.73 Y218.111 E.93094
G1 X90.257 Y197.639 E.93098
G1 X90.902 Y197.639 E.02075
G1 X70.429 Y218.111 E.93098
G1 X29.764 Y177.446 E1.84928
G1 X29.764 Y178.18 E.02361
G1 X50.236 Y157.709 E.93094
G1 X50.236 Y157.618 E.00292
G1 X29.764 Y137.147 E.93094
G1 X29.764 Y137.881 E.02361
G1 X38.441 Y129.204 E.39459
G2 X39.4 Y129.511 I2.244 J-5.35 E.03241
G1 X50.236 Y140.347 E.49276
G1 X50.236 Y140.438 E.00292
G1 X29.764 Y160.909 E.93094
G1 X29.764 Y160.175 E.02361
G1 X50.236 Y180.646 E.93094
G1 X50.236 Y180.737 E.00292
G1 X29.764 Y201.208 E.93094
G1 X29.764 Y200.473 E.02361
G1 X36.5 Y207.209 E.30632
G2 X36.564 Y208.821 I4.148 J.643 E.0522
; WIPE_START
G1 X36.438 Y208.053 E-.29591
G1 X36.5 Y207.209 E-.32142
G1 X36.235 Y206.944 E-.14267
; WIPE_END
G1 E-.04 F1800
G1 X41.025 Y204.461 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
G1 F8843.478
G2 X39.415 Y204.367 I-1.006 J3.376 E.05233
G1 X29.764 Y194.716 E.43887
G1 X29.764 Y195.451 E.02361
G1 X50.236 Y174.98 E.93094
G1 X50.236 Y174.889 E.00292
G1 X29.764 Y154.418 E.93094
G1 X29.764 Y155.152 E.02361
G1 X50.236 Y134.681 E.93094
G1 X50.236 Y134.59 E.00292
G1 X43.203 Y127.558 E.31979
G2 X43.203 Y124.442 I-3.341 J-1.558 E.10345
G1 X50.236 Y117.41 E.31979
G1 X50.236 Y117.319 E.00292
G1 X29.764 Y96.848 E.93094
G1 X29.764 Y97.582 E.02361
G1 X50.236 Y77.111 E.93094
G1 X50.236 Y77.02 E.00292
G1 X29.764 Y56.549 E.93094
G1 X29.764 Y57.283 E.02361
G1 X39.41 Y47.638 E.43863
G2 X41.02 Y47.54 I.554 J-4.17 E.0522
; WIPE_START
G1 X40.267 Y47.682 E-.29138
G1 X39.41 Y47.638 E-.32596
G1 X39.144 Y47.904 E-.14266
; WIPE_END
G1 E-.04 F1800
G1 X36.564 Y43.179 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
G1 F8843.478
G2 X36.5 Y44.791 I4.084 J.969 E.0522
G1 X29.764 Y51.527 E.30632
G1 X29.764 Y50.792 E.02361
G1 X50.236 Y71.263 E.93094
G1 X50.236 Y71.354 E.00292
G1 X29.764 Y91.825 E.93094
G1 X29.764 Y91.091 E.02361
G1 X50.236 Y111.562 E.93094
G1 X50.236 Y111.653 E.00292
G1 X39.393 Y122.495 E.49306
G2 X38.441 Y122.796 I1.109 J5.165 E.03215
G1 X29.764 Y114.119 E.39459
G1 X29.764 Y114.853 E.02361
G1 X50.236 Y94.382 E.93094
G1 X50.236 Y94.291 E.00292
G1 X29.764 Y73.82 E.93094
G1 X29.764 Y74.554 E.02361
G1 X70.429 Y33.889 E1.84928
G1 X90.902 Y54.361 E.93098
G1 X90.257 Y54.361 E.02075
G1 X110.728 Y33.889 E.93094
G1 X131.201 Y54.361 E.93098
G1 X130.556 Y54.361 E.02075
G1 X151.027 Y33.889 E.93094
G1 X171.5 Y54.361 E.93098
G1 X170.855 Y54.361 E.02075
G1 X191.328 Y33.889 E.93098
G1 X226.236 Y68.797 E1.58747
G1 X226.236 Y68.063 E.02361
G1 X205.764 Y88.534 E.93094
G1 X205.764 Y88.625 E.00292
G1 X226.236 Y109.096 E.93094
G1 X226.236 Y108.362 E.02361
G1 X205.764 Y128.833 E.93094
G1 X205.764 Y128.924 E.00292
G1 X226.236 Y149.395 E.93094
G1 X226.236 Y148.661 E.02361
G1 X205.764 Y169.132 E.93094
G1 X205.764 Y169.223 E.00292
G1 X226.236 Y189.694 E.93094
G1 X226.236 Y188.96 E.02361
G1 X197.085 Y218.111 E1.32567
G1 X176.612 Y197.639 E.93098
G1 X177.257 Y197.639 E.02075
G1 X156.786 Y218.111 E.93094
G1 X136.313 Y197.639 E.93098
G1 X136.958 Y197.639 E.02075
G1 X129.798 Y204.8 E.32562
G2 X126.2 Y204.797 I-1.801 J3.144 E.12108
G1 X119.042 Y197.639 E.3255
G1 X119.687 Y197.639 E.02075
G1 X99.214 Y218.111 E.93098
G1 X78.743 Y197.639 E.93094
G1 X79.388 Y197.639 E.02075
G1 X58.915 Y218.111 E.93098
G1 X29.764 Y188.96 E1.32567
G1 X29.764 Y189.694 E.02361
G1 X50.236 Y169.223 E.93094
G1 X50.236 Y169.132 E.00292
G1 X29.764 Y148.661 E.93094
G1 X29.764 Y149.395 E.02361
G1 X50.236 Y128.924 E.93094
G1 X50.236 Y128.833 E.00292
G1 X29.764 Y108.362 E.93094
G1 X29.764 Y109.096 E.02361
G1 X50.236 Y88.625 E.93094
G1 X50.236 Y88.534 E.00292
G1 X29.764 Y68.063 E.93094
G1 X29.764 Y68.797 E.02361
G1 X64.672 Y33.889 E1.58747
G1 X85.145 Y54.361 E.93098
G1 X84.5 Y54.361 E.02075
G1 X104.971 Y33.889 E.93094
G1 X125.444 Y54.361 E.93098
G1 X124.799 Y54.361 E.02075
G1 X145.27 Y33.889 E.93094
G1 X165.743 Y54.361 E.93098
G1 X165.098 Y54.361 E.02075
G1 X185.571 Y33.889 E.93098
G1 X226.236 Y74.554 E1.84928
G1 X226.236 Y73.82 E.02361
G1 X205.764 Y94.291 E.93094
G1 X205.764 Y94.382 E.00292
G1 X226.236 Y114.853 E.93094
G1 X226.236 Y114.119 E.02361
G1 X217.559 Y122.795 E.39457
G2 X216.596 Y122.485 I-2.543 J6.233 E.03257
G1 X205.764 Y111.653 E.49258
G1 X205.764 Y111.562 E.00292
G1 X226.236 Y91.091 E.93094
G1 X226.236 Y91.825 E.02361
G1 X205.764 Y71.354 E.93094
G1 X205.764 Y71.263 E.00292
G1 X226.236 Y50.792 E.93094
G1 X226.236 Y51.527 E.02361
G1 X219.502 Y44.793 E.30622
G2 X219.435 Y43.18 I-3.565 J-.661 E.05233
; WIPE_START
G1 X219.567 Y44.125 E-.36237
G1 X219.502 Y44.793 E-.25496
G1 X219.767 Y45.058 E-.14267
; WIPE_END
G1 E-.04 F1800
G1 X214.982 Y47.539 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
G1 F8843.478
G2 X216.593 Y47.641 I1.028 J-3.481 E.05233
G1 X226.236 Y57.284 E.43851
G1 X226.236 Y56.549 E.02361
G1 X205.764 Y77.02 E.93094
G1 X205.764 Y77.111 E.00292
G1 X226.236 Y97.582 E.93094
G1 X226.236 Y96.848 E.02361
G1 X205.764 Y117.319 E.93094
G1 X205.764 Y117.41 E.00292
G1 X212.794 Y124.439 E.31966
G2 X212.794 Y127.561 I3.243 J1.561 E.10382
G1 X205.764 Y134.59 E.31966
G1 X205.764 Y134.681 E.00292
G1 X226.236 Y155.152 E.93094
G1 X226.236 Y154.418 E.02361
G1 X205.764 Y174.889 E.93094
G1 X205.764 Y174.98 E.00292
G1 X226.236 Y195.451 E.93094
G1 X226.236 Y194.716 E.02361
G1 X216.593 Y204.359 E.43851
G2 X214.981 Y204.461 I-.444 J5.775 E.05209
G1 X203.768 Y197.639 F30000
G1 F8843.478
G1 X205.396 Y197.639 E.05236
G1 X213.304 Y205.547 E.35959
G2 X212.485 Y208.467 I2.849 J2.373 E.10046
G1 X202.84 Y218.111 E.43861
G1 X182.369 Y197.639 E.93094
G1 X183.014 Y197.639 E.02075
G1 X162.541 Y218.111 E.93098
G1 X142.07 Y197.639 E.93094
G1 X142.715 Y197.639 E.02075
G1 X131.397 Y208.958 E.51471
G3 X131.076 Y209.673 I-3.654 J-1.209 E.02526
G1 X139.515 Y218.111 E.38373
G1 X159.986 Y197.639 E.93094
G1 X159.341 Y197.639 E.02075
G1 X179.814 Y218.111 E.93098
G1 X200.285 Y197.639 E.93094
G1 X199.639 Y197.639 E.02075
G1 X220.111 Y218.111 E.93094
G1 X226.236 Y211.987 E.2785
G1 X226.236 Y212.722 E.02361
G1 X205.764 Y192.251 E.93094
G1 X205.764 Y192.16 E.00292
G1 X226.236 Y171.689 E.93094
G1 X226.236 Y172.423 E.02361
G1 X205.764 Y151.952 E.93094
G1 X205.764 Y151.861 E.00292
G1 X226.236 Y131.39 E.93094
G1 X226.236 Y132.124 E.02361
G1 X219.512 Y125.401 E.30575
G3 X219.512 Y126.599 I-4.86 J.599 E.03864
G1 X226.236 Y119.876 E.30575
G1 X226.236 Y120.61 E.02361
G1 X205.764 Y100.139 E.93094
G1 X205.764 Y100.048 E.00292
G1 X226.236 Y79.577 E.93094
G1 X226.236 Y80.311 E.02361
G1 X205.764 Y59.84 E.93094
G1 X205.764 Y59.749 E.00292
G1 X226.236 Y39.278 E.93094
G1 X226.236 Y40.013 E.02361
G1 X220.111 Y33.889 E.2785
G1 X199.64 Y54.361 E.93094
G1 X200.285 Y54.361 E.02075
G1 X179.814 Y33.889 E.93094
G1 X159.341 Y54.361 E.93098
G1 X159.986 Y54.361 E.02075
G1 X139.515 Y33.889 E.93094
G1 X131.076 Y42.327 E.38373
G3 X131.397 Y43.042 I-3.331 J1.924 E.02526
G1 X142.715 Y54.361 E.51471
G1 X142.07 Y54.361 E.02075
G1 X162.541 Y33.889 E.93094
G1 X183.014 Y54.361 E.93098
G1 X182.369 Y54.361 E.02075
G1 X202.84 Y33.889 E.93094
G1 X212.485 Y43.533 E.4386
G2 X213.304 Y46.453 I3.667 J.547 E.10046
G1 X205.396 Y54.361 E.35958
G1 X203.768 Y54.361 E.05236
; WIPE_START
G1 X205.396 Y54.361 E-.61876
G1 X205.659 Y54.098 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X211.374 Y49.039 Z1.8 F30000
G1 X226.236 Y35.884 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F8843.478
G1 X226.236 Y34.256 E.05236
G1 X225.868 Y33.889 E.01669
G1 X218.328 Y41.429 E.34285
G2 X215.337 Y40.628 I-2.321 J2.685 E.10303
G1 X208.597 Y33.889 E.30649
G1 X188.126 Y54.361 E.93094
G1 X188.771 Y54.361 E.02075
G1 X168.298 Y33.889 E.93098
G1 X147.827 Y54.361 E.93094
G1 X148.472 Y54.361 E.02075
G1 X127.999 Y33.889 E.93098
G1 X107.528 Y54.361 E.93094
G1 X108.173 Y54.361 E.02075
G1 X87.7 Y33.889 E.93098
G1 X67.229 Y54.361 E.93094
G1 X67.874 Y54.361 E.02075
G1 X47.403 Y33.889 E.93094
G1 X40.667 Y40.624 E.30628
G2 X37.67 Y41.427 I-.661 J3.526 E.1032
G1 X30.132 Y33.889 E.34277
G1 X29.764 Y34.256 E.01669
G1 X29.764 Y35.884 E.05236
; WIPE_START
G1 X29.764 Y34.256 E-.61876
G1 X30.028 Y33.993 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X35.653 Y39.153 Z1.8 F30000
G1 X52.232 Y54.361 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F8843.478
G1 X50.604 Y54.361 E.05236
G1 X42.698 Y46.455 E.35952
G2 X43.513 Y43.535 I-2.855 J-2.371 E.10044
G1 X53.16 Y33.889 E.43866
G1 X73.631 Y54.361 E.93094
G1 X72.986 Y54.361 E.02075
G1 X93.459 Y33.889 E.93098
G1 X113.93 Y54.361 E.93094
G1 X113.285 Y54.361 E.02075
G1 X124.607 Y43.038 E.5149
G3 X124.924 Y42.326 I3.524 J1.138 E.0251
G1 X116.485 Y33.889 E.3837
G1 X96.014 Y54.361 E.93094
G1 X96.659 Y54.361 E.02075
G1 X76.186 Y33.889 E.93098
G1 X55.715 Y54.361 E.93094
G1 X56.361 Y54.361 E.02075
G1 X35.889 Y33.889 E.93094
G1 X29.764 Y40.013 E.2785
G1 X29.764 Y39.278 E.02361
G1 X50.236 Y59.749 E.93094
G1 X50.236 Y59.84 E.00292
G1 X29.764 Y80.311 E.93094
G1 X29.764 Y79.577 E.02361
G1 X50.236 Y100.048 E.93094
G1 X50.236 Y100.139 E.00292
G1 X29.764 Y120.61 E.93094
G1 X29.764 Y119.876 E.02361
G1 X36.487 Y126.598 E.3057
G3 X36.487 Y125.402 I3.636 J-.598 E.03864
G1 X29.764 Y132.124 E.3057
G1 X29.764 Y131.39 E.02361
G1 X50.236 Y151.861 E.93094
G1 X50.236 Y151.952 E.00292
G1 X29.764 Y172.423 E.93094
G1 X29.764 Y171.689 E.02361
G1 X50.236 Y192.16 E.93094
G1 X50.236 Y192.251 E.00292
G1 X29.764 Y212.722 E.93094
G1 X29.764 Y211.987 E.02361
G1 X35.889 Y218.111 E.2785
G1 X56.36 Y197.639 E.93094
G1 X55.715 Y197.639 E.02075
G1 X76.186 Y218.111 E.93094
G1 X96.659 Y197.639 E.93098
G1 X96.014 Y197.639 E.02075
G1 X116.485 Y218.111 E.93094
G1 X124.924 Y209.674 E.3837
G3 X124.607 Y208.962 I3.208 J-1.85 E.0251
G1 X113.285 Y197.639 E.5149
G1 X113.93 Y197.639 E.02075
G1 X93.459 Y218.111 E.93094
G1 X72.986 Y197.639 E.93098
G1 X73.631 Y197.639 E.02075
G1 X53.16 Y218.111 E.93094
G1 X43.513 Y208.465 E.43866
G2 X42.698 Y205.545 I-3.67 J-.549 E.10044
G1 X50.604 Y197.639 E.35952
G1 X52.232 Y197.639 E.05236
; WIPE_START
G1 X50.604 Y197.639 E-.61876
G1 X50.341 Y197.902 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X44.626 Y202.961 Z1.8 F30000
G1 X29.764 Y216.116 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F8843.478
G1 X29.764 Y217.744 E.05236
G1 X30.132 Y218.111 E.01669
G1 X37.67 Y210.573 E.34277
G2 X40.667 Y211.376 I2.373 J-2.859 E.10295
G1 X47.403 Y218.111 E.30628
G1 X67.874 Y197.639 E.93094
G1 X67.229 Y197.639 E.02075
G1 X87.7 Y218.111 E.93094
G1 X108.173 Y197.639 E.93098
G1 X107.528 Y197.639 E.02075
G1 X127.999 Y218.111 E.93094
G1 X148.472 Y197.639 E.93098
G1 X147.827 Y197.639 E.02075
G1 X168.298 Y218.111 E.93094
G1 X188.771 Y197.639 E.93098
G1 X188.126 Y197.639 E.02075
G1 X208.597 Y218.111 E.93094
G1 X215.334 Y211.375 E.30636
G2 X218.328 Y210.571 I.629 J-3.636 E.10288
G1 X225.868 Y218.111 E.34285
G1 X226.236 Y217.744 E.01669
G1 X226.236 Y216.116 E.05236
G1 X130.474 Y210.443 F30000
G1 F8843.478
G3 X129.087 Y211.268 I-2.504 J-2.632 E.05233
G1 X122.242 Y218.111 E.31122
G1 X101.771 Y197.639 E.93094
G1 X102.416 Y197.639 E.02075
G1 X81.945 Y218.111 E.93094
G1 X61.472 Y197.639 E.93098
G1 X62.117 Y197.639 E.02075
G1 X41.646 Y218.111 E.93094
G1 X29.764 Y206.23 E.5403
G1 X29.764 Y206.965 E.02361
G1 X50.236 Y186.494 E.93094
G1 X50.236 Y186.403 E.00292
G1 X29.764 Y165.932 E.93094
G1 X29.764 Y166.666 E.02361
G1 X50.236 Y146.195 E.93094
G1 X50.236 Y146.104 E.00292
G1 X29.764 Y125.633 E.93094
G1 X29.764 Y126.367 E.02361
G1 X50.236 Y105.896 E.93094
G1 X50.236 Y105.805 E.00292
G1 X29.764 Y85.334 E.93094
G1 X29.764 Y86.068 E.02361
G1 X50.236 Y65.597 E.93094
G1 X50.236 Y65.506 E.00292
G1 X29.764 Y45.035 E.93094
G1 X29.764 Y45.77 E.02361
G1 X41.646 Y33.889 E.5403
G1 X62.117 Y54.361 E.93094
G1 X61.472 Y54.361 E.02075
G1 X81.945 Y33.889 E.93098
G1 X102.416 Y54.361 E.93094
G1 X101.771 Y54.361 E.02075
G1 X122.242 Y33.889 E.93094
G1 X129.087 Y40.732 E.31122
G2 X126.916 Y40.729 I-1.09 J4.084 E.07059
G1 X133.758 Y33.889 E.3111
G1 X154.229 Y54.361 E.93094
G1 X153.584 Y54.361 E.02075
G1 X174.055 Y33.889 E.93094
G1 X194.528 Y54.361 E.93098
G1 X193.883 Y54.361 E.02075
G1 X214.354 Y33.889 E.93094
G1 X226.236 Y45.77 E.5403
G1 X226.236 Y45.035 E.02361
G1 X205.764 Y65.506 E.93094
G1 X205.764 Y65.597 E.00292
G1 X226.236 Y86.068 E.93094
G1 X226.236 Y85.334 E.02361
G1 X205.764 Y105.805 E.93094
G1 X205.764 Y105.896 E.00292
G1 X226.236 Y126.367 E.93094
G1 X226.236 Y125.633 E.02361
G1 X205.764 Y146.104 E.93094
G1 X205.764 Y146.195 E.00292
G1 X226.236 Y166.666 E.93094
G1 X226.236 Y165.932 E.02361
G1 X205.764 Y186.403 E.93094
G1 X205.764 Y186.494 E.00292
G1 X226.236 Y206.965 E.93094
G1 X226.236 Y206.23 E.02361
G1 X214.354 Y218.111 E.5403
G1 X193.883 Y197.639 E.93094
G1 X194.528 Y197.639 E.02075
G1 X174.055 Y218.111 E.93098
G1 X153.584 Y197.639 E.93094
G1 X154.229 Y197.639 E.02075
G1 X133.758 Y218.111 E.93094
G1 X126.916 Y211.271 E.3111
G3 X125.531 Y210.443 I1.427 J-3.962 E.0522
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X126.217 Y210.964 E-.32709
G1 X126.916 Y211.271 E-.29025
G1 X127.182 Y211.536 E-.14266
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
G1 X127.977 Y204.659
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X128.24 Y204.666 E.00848
M73 P49 R39
G3 X127.6 Y204.682 I-.24 J3.207 E.62913
G1 X127.917 Y204.658 E.01022
G1 X127.968 Y205.066 F30000
G1 F8843.478
G1 X128.21 Y205.072 E.00779
G3 X127.651 Y205.086 I-.21 J2.801 E.54945
G1 X127.908 Y205.067 E.00829
G1 X127.976 Y205.476 F30000
G1 F8843.478
G1 X128.417 Y205.509 E.01423
G3 X127.701 Y205.491 I-.417 J2.365 E.46206
G1 X127.916 Y205.475 E.00693
G1 X127.972 Y205.867 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.349 Y205.895 E.01126
G3 X127.75 Y205.88 I-.349 J1.978 E.35808
G1 X127.912 Y205.868 E.00484
; WIPE_START
M204 S10000
G1 X128.349 Y205.895 E-.1663
G1 X128.734 Y206.004 E-.15214
G1 X129.091 Y206.186 E-.15215
G1 X129.404 Y206.436 E-.15207
G1 X129.636 Y206.713 E-.13735
; WIPE_END
G1 E-.04 F1800
G1 X137.267 Y206.564 Z2 F30000
G1 X214.448 Y205.059 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X214.677 Y204.942 E.00825
G3 X215.6 Y204.682 I1.324 J2.931 E.03096
G1 X215.92 Y204.658 E.01032
G3 X214.391 Y205.089 I.081 J3.215 E.59816
G1 X214.395 Y205.087 E.00013
G1 X214.938 Y205.277 F30000
G1 F8843.478
G1 X215.105 Y205.211 E.00577
G3 X215.651 Y205.086 I.895 J2.662 E.01803
G1 X215.93 Y205.065 E.00901
G3 X214.844 Y205.314 I.07 J2.808 E.53141
G1 X214.882 Y205.299 E.0013
G1 X215.402 Y205.559 F30000
G1 F8843.478
G1 X215.701 Y205.491 E.00986
G1 X215.94 Y205.473 E.0077
G3 X215.235 Y205.597 I.06 J2.401 E.46205
G1 X215.344 Y205.572 E.00361
G1 X215.841 Y205.873 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X215.95 Y205.865 E.00324
G3 X215.75 Y205.88 I.05 J2.008 E.37002
G1 X215.782 Y205.878 E.00094
; WIPE_START
M204 S10000
G1 X215.95 Y205.865 E-.06417
G1 X216.349 Y205.895 E-.15212
G1 X216.734 Y206.004 E-.15214
G1 X217.091 Y206.186 E-.15211
G1 X217.404 Y206.436 E-.1521
G1 X217.551 Y206.612 E-.08736
; WIPE_END
G1 E-.04 F1800
G1 X217.385 Y198.981 Z2 F30000
G1 X215.863 Y129.213 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X215.6 Y129.189 E.00847
G3 X215.76 Y122.795 I.409 J-3.189 E.3036
G3 X217.176 Y123.004 I.238 J3.279 E.0464
M73 P49 R38
G3 X215.923 Y129.214 I-1.167 J2.996 E.28918
G1 X215.892 Y128.807 F30000
G1 F8843.478
G1 X215.651 Y128.787 E.00779
G3 X215.79 Y123.201 I.359 J-2.786 E.26508
G3 X216.761 Y123.295 I.227 J2.724 E.03153
G3 X215.952 Y128.809 I-.751 J2.706 E.26115
G1 X215.939 Y128.39 F30000
G1 F8843.478
G1 X215.702 Y128.382 E.00765
G3 X215.821 Y123.607 I.307 J-2.382 E.22664
G3 X216.651 Y123.687 I.096 J3.352 E.02689
G3 X216.18 Y128.396 I-.642 J2.314 E.21619
G1 X215.999 Y128.392 E.00579
G1 X215.95 Y128.008 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X215.85 Y123.998 I.06 J-2.008 E.18139
G3 X216.349 Y124.02 I.154 J2.146 E.01492
G3 X216.01 Y128.009 I-.339 J1.98 E.17781
; WIPE_START
M204 S10000
G1 X215.553 Y127.96 E-.17476
G1 X215.36 Y127.906 E-.07616
G1 X214.995 Y127.741 E-.15207
G1 X214.67 Y127.507 E-.15216
G1 X214.398 Y127.214 E-.15212
G1 X214.325 Y127.095 E-.05273
; WIPE_END
G1 E-.04 F1800
G1 X214.563 Y119.467 Z2 F30000
G1 X217.003 Y41.071 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X217.176 Y41.129 E.00586
G3 X215.76 Y40.92 I-1.167 J2.996 E.60318
G3 X216.871 Y41.029 I.238 J3.279 E.03608
G1 X216.946 Y41.053 E.00252
G1 X216.556 Y41.373 F30000
G1 F8843.478
G1 X216.761 Y41.42 E.00675
G3 X215.79 Y41.326 I-.751 J2.706 E.53595
G3 X216.488 Y41.357 I.227 J2.723 E.02252
G1 X216.498 Y41.36 E.00033
G1 X216.114 Y41.729 F30000
G1 F8843.478
G1 X216.179 Y41.741 E.00211
G3 X216.651 Y41.812 I-.262 J3.343 E.01537
G3 X215.821 Y41.732 I-.642 J2.314 E.45822
G1 X216.054 Y41.73 E.0075
G1 X215.85 Y42.123 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X216.349 Y42.145 I.154 J2.146 E.01492
G3 X215.79 Y42.129 I-.339 J1.98 E.3592
; WIPE_START
M204 S10000
G1 X216.15 Y42.12 E-.13681
G1 X216.349 Y42.145 E-.07618
G1 X216.544 Y42.19 E-.07615
G1 X216.917 Y42.336 E-.15209
G1 X217.253 Y42.553 E-.15216
G1 X217.54 Y42.833 E-.1521
G1 X217.561 Y42.864 E-.01451
; WIPE_END
G1 E-.04 F1800
G1 X209.93 Y42.729 Z2 F30000
G1 X126.555 Y41.254 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X126.679 Y41.198 E.00437
G3 X127.76 Y40.92 I1.33 J2.927 E.03606
G3 X129.176 Y41.129 I.238 J3.279 E.0464
G3 X126.395 Y41.345 I-1.167 J2.996 E.55682
G1 X126.503 Y41.284 E.004
G1 X127.041 Y41.486 F30000
G1 F8843.478
G1 X127.107 Y41.467 E.00221
G3 X127.79 Y41.326 I.903 J2.659 E.02249
G3 X128.761 Y41.42 I.227 J2.722 E.03154
G3 X126.847 Y41.569 I-.751 J2.706 E.50446
G1 X126.986 Y41.51 E.00487
G1 X127.531 Y41.773 F30000
G1 F8843.478
G1 X127.821 Y41.732 E.0094
G3 X128.651 Y41.812 I.096 J3.351 E.02689
G3 X127.466 Y41.787 I-.642 J2.314 E.44668
G1 X127.472 Y41.785 E.0002
G1 X127.85 Y42.123 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X128.349 Y42.145 I.154 J2.146 E.01492
G3 X127.79 Y42.129 I-.339 J1.98 E.3592
; WIPE_START
M204 S10000
G1 X128.15 Y42.12 E-.13681
G1 X128.349 Y42.145 E-.07618
G1 X128.544 Y42.19 E-.07613
G1 X128.917 Y42.336 E-.1521
G1 X129.253 Y42.553 E-.15213
G1 X129.54 Y42.833 E-.15213
G1 X129.561 Y42.864 E-.01451
; WIPE_END
G1 E-.04 F1800
G1 X121.931 Y42.71 Z2 F30000
G1 X41.001 Y41.071 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.176 Y41.129 E.0059
G3 X39.76 Y40.92 I-1.166 J2.996 E.60319
G3 X40.871 Y41.029 I.238 J3.279 E.03608
G1 X40.944 Y41.053 E.00247
G1 X40.555 Y41.373 F30000
G1 F8843.478
G1 X40.761 Y41.42 E.0068
G3 X39.79 Y41.326 I-.751 J2.706 E.53595
G3 X40.488 Y41.357 I.227 J2.723 E.02252
G1 X40.497 Y41.359 E.00028
G1 X40.112 Y41.729 F30000
G1 F8843.478
G1 X40.179 Y41.741 E.00216
G3 X40.651 Y41.812 I-.262 J3.342 E.01537
G3 X39.821 Y41.732 I-.642 J2.314 E.45822
G1 X40.052 Y41.73 E.00746
G1 X39.826 Y42.126 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X39.85 Y42.123 E.00072
G3 X40.349 Y42.145 I.154 J2.146 E.01492
G3 X39.554 Y42.169 I-.339 J1.98 E.35204
G1 X39.767 Y42.136 E.00643
; WIPE_START
M204 S10000
G1 X39.85 Y42.123 E-.03196
G1 X40.15 Y42.12 E-.1141
G1 X40.349 Y42.145 E-.07618
G1 X40.544 Y42.19 E-.07613
G1 X40.917 Y42.336 E-.1521
G1 X41.253 Y42.553 E-.15216
G1 X41.54 Y42.833 E-.1521
G1 X41.548 Y42.844 E-.00527
; WIPE_END
G1 E-.04 F1800
G1 X47.102 Y48.079 Z2 F30000
G1 X205.416 Y197.291 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X50.584 Y197.291 E4.97885
G1 X50.584 Y54.709 E4.58493
G1 X205.416 Y54.709 E4.97885
G1 X205.416 Y197.231 E4.583
G1 X205.009 Y196.884 F30000
G1 F8843.478
G1 X50.991 Y196.884 E4.95267
G1 X50.991 Y55.116 E4.55875
G1 X205.009 Y55.116 E4.95267
G1 X205.009 Y196.824 E4.55682
G1 X204.602 Y196.477 F30000
G1 F8843.478
G1 X51.398 Y196.477 E4.92649
G1 X51.398 Y55.523 E4.53257
G1 X204.602 Y55.523 E4.92649
G1 X204.602 Y196.417 E4.53064
G1 X204.21 Y196.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X51.79 Y196.085 E4.54007
G1 X51.79 Y55.915 E4.17519
G1 X204.21 Y55.915 E4.54007
G1 X204.21 Y196.025 E4.1734
; WIPE_START
M204 S10000
G1 X202.21 Y196.026 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X195.258 Y192.874 Z2 F30000
G1 X41.003 Y122.946 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.176 Y123.004 E.00587
G3 X39.76 Y122.795 I-1.167 J2.996 E.60318
G3 X40.871 Y122.904 I.238 J3.28 E.03608
G1 X40.945 Y122.928 E.00252
G1 X40.556 Y123.248 F30000
G1 F8843.478
G1 X40.761 Y123.295 E.00675
G3 X39.79 Y123.201 I-.751 J2.706 E.53595
G3 X40.488 Y123.232 I.227 J2.724 E.02252
G1 X40.498 Y123.235 E.00032
G1 X40.114 Y123.604 F30000
G1 F8843.478
G1 X40.179 Y123.616 E.00211
G3 X40.651 Y123.687 I-.262 J3.343 E.01537
G3 X39.821 Y123.607 I-.642 J2.314 E.45822
G1 X40.054 Y123.605 E.0075
G1 X39.85 Y123.998 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X40.349 Y124.02 I.154 J2.146 E.01492
G3 X39.79 Y124.004 I-.339 J1.98 E.3592
; WIPE_START
M204 S10000
G1 X40.15 Y123.995 E-.13681
G1 X40.349 Y124.02 E-.07617
G1 X40.734 Y124.129 E-.15213
G1 X41.091 Y124.311 E-.15212
G1 X41.404 Y124.561 E-.1521
G1 X41.557 Y124.744 E-.09067
; WIPE_END
G1 E-.04 F1800
G1 X41.486 Y132.376 Z2 F30000
G1 X40.812 Y204.764 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X40.872 Y204.777 E.00197
G3 X39.6 Y204.682 I-.871 J3.096 E.60848
G1 X39.92 Y204.658 E.01032
G3 X40.559 Y204.706 I.081 J3.215 E.02063
G1 X40.753 Y204.75 E.00642
G1 X40.39 Y205.095 F30000
G1 F8843.478
G1 X40.488 Y205.107 E.00316
G3 X39.651 Y205.086 I-.488 J2.766 E.54043
G1 X39.93 Y205.065 E.00901
G3 X40.21 Y205.072 I.07 J2.808 E.00901
G1 X40.331 Y205.088 E.00391
G1 X40.044 Y205.481 F30000
G1 F8843.478
G1 X40.417 Y205.509 E.01204
G3 X39.701 Y205.491 I-.417 J2.365 E.46206
G1 X39.94 Y205.473 E.0077
G1 X39.984 Y205.476 E.00142
G1 X39.84 Y205.874 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X39.95 Y205.865 E.00329
G3 X39.75 Y205.88 I.05 J2.008 E.37002
G1 X39.78 Y205.878 E.00089
; WIPE_START
M204 S10000
G1 X39.95 Y205.865 E-.06477
G1 X40.349 Y205.895 E-.15212
G1 X40.734 Y206.004 E-.15214
G1 X41.091 Y206.186 E-.15211
G1 X41.404 Y206.436 E-.1521
G1 X41.55 Y206.611 E-.08677
; WIPE_END
G1 E-.04 F1800
G1 X49.167 Y207.099 Z2 F30000
G1 X226.584 Y218.459 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X29.416 Y218.459 E6.34019
G1 X29.416 Y33.541 E5.94628
G1 X226.584 Y33.541 E6.34019
G1 X226.584 Y218.399 E5.94435
G1 X226.991 Y218.866 F30000
G1 F8843.478
G1 X29.009 Y218.866 E6.36637
G1 X29.009 Y33.134 E5.97246
G1 X226.991 Y33.134 E6.36637
G1 X226.991 Y218.806 E5.97053
G1 X227.398 Y219.273 F30000
G1 F8843.478
G1 X28.602 Y219.273 E6.39255
G1 X28.602 Y32.727 E5.99864
G1 X227.398 Y32.727 E6.39255
G1 X227.398 Y219.213 E5.99671
G1 X227.79 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X28.21 Y219.665 E5.94481
G1 X28.21 Y32.335 E5.57992
G1 X227.79 Y32.335 E5.94481
G1 X227.79 Y219.605 E5.57813
; WIPE_START
M204 S10000
G1 X225.79 Y219.606 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X226.236 Y216.116 Z2 F30000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X226.236 Y217.744 E.05236
G1 X225.868 Y218.111 E.01669
G1 X218.328 Y210.571 E.34285
G3 X215.334 Y211.375 I-2.365 J-2.833 E.10288
G1 X208.597 Y218.111 E.30636
G1 X188.126 Y197.639 E.93094
G1 X188.771 Y197.639 E.02075
G1 X168.298 Y218.111 E.93098
G1 X147.827 Y197.639 E.93094
G1 X148.472 Y197.639 E.02075
G1 X127.999 Y218.111 E.93098
G1 X107.528 Y197.639 E.93094
G1 X108.173 Y197.639 E.02075
G1 X87.7 Y218.111 E.93098
G1 X67.229 Y197.639 E.93094
G1 X67.874 Y197.639 E.02075
G1 X47.403 Y218.111 E.93094
G1 X40.667 Y211.376 E.30628
G3 X37.67 Y210.573 I-.625 J-3.663 E.10295
G1 X30.132 Y218.111 E.34277
G1 X29.764 Y217.744 E.01669
G1 X29.764 Y216.116 E.05236
G1 X36.564 Y208.821 F30000
G1 F8843.478
G3 X36.5 Y207.209 I4.085 J-.969 E.0522
G1 X29.764 Y200.473 E.30632
G1 X29.764 Y201.208 E.02361
G1 X50.236 Y180.737 E.93094
G1 X50.236 Y180.646 E.00292
G1 X29.764 Y160.175 E.93094
G1 X29.764 Y160.909 E.02361
G1 X50.236 Y140.438 E.93094
G1 X50.236 Y140.347 E.00292
G1 X39.4 Y129.511 E.49276
G3 X38.441 Y129.204 I1.286 J-5.659 E.03241
G1 X29.764 Y137.881 E.39459
G1 X29.764 Y137.147 E.02361
G1 X50.236 Y157.618 E.93094
G1 X50.236 Y157.709 E.00292
G1 X29.764 Y178.18 E.93094
G1 X29.764 Y177.446 E.02361
M73 P50 R38
G1 X70.429 Y218.111 E1.84928
G1 X90.902 Y197.639 E.93098
G1 X90.257 Y197.639 E.02075
G1 X110.728 Y218.111 E.93094
G1 X131.201 Y197.639 E.93098
G1 X130.556 Y197.639 E.02075
G1 X151.027 Y218.111 E.93094
G1 X171.5 Y197.639 E.93098
G1 X170.855 Y197.639 E.02075
G1 X191.328 Y218.111 E.93098
G1 X226.236 Y183.203 E1.58747
G1 X226.236 Y183.937 E.02361
G1 X205.764 Y163.466 E.93094
G1 X205.764 Y163.375 E.00292
G1 X226.236 Y142.904 E.93094
G1 X226.236 Y143.638 E.02361
G1 X205.764 Y123.167 E.93094
G1 X205.764 Y123.076 E.00292
G1 X226.236 Y102.605 E.93094
G1 X226.236 Y103.339 E.02361
G1 X205.764 Y82.868 E.93094
G1 X205.764 Y82.777 E.00292
G1 X226.236 Y62.306 E.93094
G1 X226.236 Y63.04 E.02361
G1 X197.085 Y33.889 E1.32567
G1 X176.612 Y54.361 E.93098
G1 X177.257 Y54.361 E.02075
G1 X156.786 Y33.889 E.93094
G1 X136.313 Y54.361 E.93098
G1 X136.958 Y54.361 E.02075
G1 X129.798 Y47.2 E.32562
G3 X126.2 Y47.203 I-1.801 J-3.19 E.12095
G1 X119.042 Y54.361 E.3255
G1 X119.687 Y54.361 E.02075
G1 X99.214 Y33.889 E.93098
G1 X78.743 Y54.361 E.93094
G1 X79.388 Y54.361 E.02075
G1 X58.915 Y33.889 E.93098
G1 X29.764 Y63.04 E1.32567
G1 X29.764 Y62.306 E.02361
G1 X50.236 Y82.777 E.93094
G1 X50.236 Y82.868 E.00292
G1 X29.764 Y103.339 E.93094
G1 X29.764 Y102.605 E.02361
G1 X50.236 Y123.076 E.93094
G1 X50.236 Y123.167 E.00292
G1 X29.764 Y143.638 E.93094
G1 X29.764 Y142.904 E.02361
G1 X50.236 Y163.375 E.93094
G1 X50.236 Y163.466 E.00292
G1 X29.764 Y183.937 E.93094
G1 X29.764 Y183.203 E.02361
G1 X64.672 Y218.111 E1.58747
G1 X85.145 Y197.639 E.93098
G1 X84.5 Y197.639 E.02075
G1 X104.971 Y218.111 E.93094
G1 X125.444 Y197.639 E.93098
G1 X124.799 Y197.639 E.02075
G1 X145.27 Y218.111 E.93094
G1 X165.743 Y197.639 E.93098
G1 X165.098 Y197.639 E.02075
G1 X185.571 Y218.111 E.93098
G1 X226.236 Y177.446 E1.84928
G1 X226.236 Y178.18 E.02361
G1 X205.764 Y157.709 E.93094
G1 X205.764 Y157.618 E.00292
G1 X226.236 Y137.147 E.93094
G1 X226.236 Y137.881 E.02361
G1 X217.559 Y129.205 E.39457
G3 X216.596 Y129.515 I-2.544 J-6.237 E.03257
G1 X205.764 Y140.347 E.49258
G1 X205.764 Y140.438 E.00292
G1 X226.236 Y160.909 E.93094
G1 X226.236 Y160.175 E.02361
G1 X205.764 Y180.646 E.93094
G1 X205.764 Y180.737 E.00292
G1 X226.236 Y201.208 E.93094
G1 X226.236 Y200.473 E.02361
G1 X219.502 Y207.207 E.30622
G3 X219.435 Y208.82 I-3.565 J.661 E.05233
; WIPE_START
G1 X219.567 Y207.875 E-.36238
G1 X219.502 Y207.207 E-.25496
G1 X219.767 Y206.942 E-.14267
; WIPE_END
G1 E-.04 F1800
G1 X214.982 Y204.461 Z2 F30000
G1 Z1.6
G1 E.8 F1800
G1 F8843.478
G3 X216.593 Y204.359 I1.028 J3.482 E.05233
G1 X226.236 Y194.716 E.43851
G1 X226.236 Y195.451 E.02361
G1 X205.764 Y174.98 E.93094
G1 X205.764 Y174.889 E.00292
G1 X226.236 Y154.418 E.93094
G1 X226.236 Y155.152 E.02361
G1 X205.764 Y134.681 E.93094
G1 X205.764 Y134.59 E.00292
G1 X212.794 Y127.561 E.31966
G3 X212.794 Y124.439 I3.244 J-1.561 E.10382
G1 X205.764 Y117.41 E.31966
G1 X205.764 Y117.319 E.00292
G1 X226.236 Y96.848 E.93094
G1 X226.236 Y97.582 E.02361
G1 X205.764 Y77.111 E.93094
G1 X205.764 Y77.02 E.00292
G1 X226.236 Y56.549 E.93094
G1 X226.236 Y57.284 E.02361
G1 X216.593 Y47.641 E.43851
G3 X214.982 Y47.539 I-.582 J-3.583 E.05233
; WIPE_START
G1 X215.911 Y47.691 E-.35766
G1 X216.593 Y47.641 E-.2597
G1 X216.858 Y47.906 E-.14264
; WIPE_END
G1 E-.04 F1800
G1 X219.435 Y43.18 Z2 F30000
G1 Z1.6
G1 E.8 F1800
G1 F8843.478
G3 X219.502 Y44.793 I-3.499 J.952 E.05233
G1 X226.236 Y51.527 E.30622
G1 X226.236 Y50.792 E.02361
G1 X205.764 Y71.263 E.93094
G1 X205.764 Y71.354 E.00292
G1 X226.236 Y91.825 E.93094
G1 X226.236 Y91.091 E.02361
G1 X205.764 Y111.562 E.93094
G1 X205.764 Y111.653 E.00292
G1 X216.596 Y122.485 E.49258
G3 X217.559 Y122.795 I-1.579 J6.541 E.03257
G1 X226.236 Y114.119 E.39457
G1 X226.236 Y114.853 E.02361
G1 X205.764 Y94.382 E.93094
G1 X205.764 Y94.291 E.00292
G1 X226.236 Y73.82 E.93094
G1 X226.236 Y74.554 E.02361
G1 X185.571 Y33.889 E1.84928
G1 X165.098 Y54.361 E.93098
G1 X165.743 Y54.361 E.02075
G1 X145.272 Y33.889 E.93094
G1 X124.799 Y54.361 E.93098
G1 X125.444 Y54.361 E.02075
G1 X104.973 Y33.889 E.93094
G1 X84.5 Y54.361 E.93098
G1 X85.145 Y54.361 E.02075
G1 X64.672 Y33.889 E.93098
G1 X29.764 Y68.797 E1.58747
G1 X29.764 Y68.063 E.02361
G1 X50.236 Y88.534 E.93094
G1 X50.236 Y88.625 E.00292
G1 X29.764 Y109.096 E.93094
G1 X29.764 Y108.362 E.02361
G1 X50.236 Y128.833 E.93094
G1 X50.236 Y128.924 E.00292
M73 P50 R37
G1 X29.764 Y149.395 E.93094
G1 X29.764 Y148.661 E.02361
G1 X50.236 Y169.132 E.93094
G1 X50.236 Y169.223 E.00292
G1 X29.764 Y189.694 E.93094
G1 X29.764 Y188.96 E.02361
G1 X58.915 Y218.111 E1.32567
G1 X79.388 Y197.639 E.93098
G1 X78.743 Y197.639 E.02075
G1 X99.214 Y218.111 E.93094
G1 X119.687 Y197.639 E.93098
G1 X119.042 Y197.639 E.02075
G1 X126.2 Y204.797 E.3255
G3 X129.798 Y204.8 I1.797 J3.192 E.12095
G1 X136.958 Y197.639 E.32562
G1 X136.313 Y197.639 E.02075
G1 X156.786 Y218.111 E.93098
G1 X177.257 Y197.639 E.93094
G1 X176.612 Y197.639 E.02075
G1 X197.085 Y218.111 E.93098
G1 X226.236 Y188.96 E1.32567
G1 X226.236 Y189.694 E.02361
G1 X205.764 Y169.223 E.93094
G1 X205.764 Y169.132 E.00292
G1 X226.236 Y148.661 E.93094
G1 X226.236 Y149.395 E.02361
G1 X205.764 Y128.924 E.93094
G1 X205.764 Y128.833 E.00292
G1 X226.236 Y108.362 E.93094
G1 X226.236 Y109.096 E.02361
G1 X205.764 Y88.625 E.93094
G1 X205.764 Y88.534 E.00292
G1 X226.236 Y68.063 E.93094
G1 X226.236 Y68.797 E.02361
G1 X191.328 Y33.889 E1.58747
G1 X170.855 Y54.361 E.93098
G1 X171.5 Y54.361 E.02075
G1 X151.029 Y33.889 E.93094
G1 X130.556 Y54.361 E.93098
G1 X131.201 Y54.361 E.02075
G1 X110.73 Y33.889 E.93094
G1 X90.257 Y54.361 E.93098
G1 X90.902 Y54.361 E.02075
G1 X70.429 Y33.889 E.93098
G1 X29.764 Y74.554 E1.84928
G1 X29.764 Y73.82 E.02361
G1 X50.236 Y94.291 E.93094
G1 X50.236 Y94.382 E.00292
G1 X29.764 Y114.853 E.93094
G1 X29.764 Y114.119 E.02361
G1 X38.441 Y122.796 E.39459
G3 X39.393 Y122.495 I2.052 J4.841 E.03214
G1 X50.236 Y111.653 E.49307
G1 X50.236 Y111.562 E.00292
G1 X29.764 Y91.091 E.93094
G1 X29.764 Y91.825 E.02361
G1 X50.236 Y71.354 E.93094
G1 X50.236 Y71.263 E.00292
G1 X29.764 Y50.792 E.93094
G1 X29.764 Y51.527 E.02361
G1 X36.5 Y44.791 E.30632
G3 X36.564 Y43.179 I4.148 J-.643 E.0522
; WIPE_START
G1 X36.438 Y43.947 E-.29592
G1 X36.5 Y44.791 E-.32141
G1 X36.235 Y45.056 E-.14267
; WIPE_END
G1 E-.04 F1800
G1 X41.02 Y47.54 Z2 F30000
G1 Z1.6
G1 E.8 F1800
G1 F8843.478
G3 X39.41 Y47.638 I-1.056 J-4.072 E.0522
G1 X29.764 Y57.283 E.43863
G1 X29.764 Y56.549 E.02361
G1 X50.236 Y77.02 E.93094
G1 X50.236 Y77.111 E.00292
G1 X29.764 Y97.582 E.93094
G1 X29.764 Y96.848 E.02361
G1 X50.236 Y117.319 E.93094
G1 X50.236 Y117.41 E.00292
G1 X43.203 Y124.442 E.31979
G3 X43.203 Y127.558 I-3.341 J1.558 E.10345
G1 X50.236 Y134.59 E.31979
G1 X50.236 Y134.681 E.00292
G1 X29.764 Y155.152 E.93094
G1 X29.764 Y154.418 E.02361
G1 X50.236 Y174.889 E.93094
G1 X50.236 Y174.98 E.00292
G1 X29.764 Y195.451 E.93094
G1 X29.764 Y194.716 E.02361
G1 X39.41 Y204.362 E.43863
G3 X41.02 Y204.46 I.555 J4.169 E.0522
G1 X52.232 Y197.639 F30000
G1 F8843.478
G1 X50.604 Y197.639 E.05236
G1 X42.698 Y205.545 E.35952
G3 X43.513 Y208.465 I-2.854 J2.371 E.10044
G1 X53.16 Y218.111 E.43866
G1 X73.631 Y197.639 E.93094
G1 X72.986 Y197.639 E.02075
G1 X93.459 Y218.111 E.93098
G1 X113.93 Y197.639 E.93094
G1 X113.285 Y197.639 E.02075
G1 X124.607 Y208.962 E.5149
G2 X124.924 Y209.674 I3.527 J-1.139 E.0251
G1 X116.485 Y218.111 E.3837
G1 X96.014 Y197.639 E.93094
G1 X96.659 Y197.639 E.02075
G1 X76.186 Y218.111 E.93098
G1 X55.715 Y197.639 E.93094
G1 X56.36 Y197.639 E.02075
G1 X35.889 Y218.111 E.93094
G1 X29.764 Y211.987 E.2785
G1 X29.764 Y212.722 E.02361
G1 X50.236 Y192.251 E.93094
G1 X50.236 Y192.16 E.00292
G1 X29.764 Y171.689 E.93094
G1 X29.764 Y172.423 E.02361
G1 X50.236 Y151.952 E.93094
G1 X50.236 Y151.861 E.00292
G1 X29.764 Y131.39 E.93094
G1 X29.764 Y132.124 E.02361
G1 X36.487 Y125.402 E.3057
G2 X36.487 Y126.598 I3.636 J.598 E.03864
G1 X29.764 Y119.876 E.3057
G1 X29.764 Y120.61 E.02361
G1 X50.236 Y100.139 E.93094
G1 X50.236 Y100.048 E.00292
G1 X29.764 Y79.577 E.93094
G1 X29.764 Y80.311 E.02361
G1 X50.236 Y59.84 E.93094
G1 X50.236 Y59.749 E.00292
G1 X29.764 Y39.278 E.93094
G1 X29.764 Y40.013 E.02361
G1 X35.889 Y33.889 E.2785
G1 X56.361 Y54.361 E.93094
G1 X55.715 Y54.361 E.02075
G1 X76.186 Y33.889 E.93094
G1 X96.659 Y54.361 E.93098
G1 X96.014 Y54.361 E.02075
G1 X116.485 Y33.889 E.93094
G1 X124.924 Y42.326 E.3837
G2 X124.607 Y43.038 I3.206 J1.849 E.0251
G1 X113.285 Y54.361 E.5149
G1 X113.93 Y54.361 E.02075
G1 X93.459 Y33.889 E.93094
G1 X72.986 Y54.361 E.93098
G1 X73.631 Y54.361 E.02075
G1 X53.16 Y33.889 E.93094
G1 X43.513 Y43.535 E.43866
G3 X42.698 Y46.455 I-3.67 J.549 E.10044
G1 X50.604 Y54.361 E.35952
G1 X52.232 Y54.361 E.05236
; WIPE_START
G1 X50.604 Y54.361 E-.61876
G1 X50.341 Y54.098 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X44.626 Y49.039 Z2 F30000
G1 X29.764 Y35.884 Z2
G1 Z1.6
G1 E.8 F1800
G1 F8843.478
G1 X29.764 Y34.256 E.05236
G1 X30.132 Y33.889 E.01669
G1 X37.67 Y41.427 E.34277
G3 X40.667 Y40.624 I2.336 J2.723 E.1032
G1 X47.403 Y33.889 E.30628
G1 X67.874 Y54.361 E.93094
G1 X67.229 Y54.361 E.02075
G1 X87.7 Y33.889 E.93094
G1 X108.173 Y54.361 E.93098
G1 X107.528 Y54.361 E.02075
G1 X127.999 Y33.889 E.93094
G1 X148.472 Y54.361 E.93098
G1 X147.827 Y54.361 E.02075
G1 X168.298 Y33.889 E.93094
G1 X188.771 Y54.361 E.93098
G1 X188.126 Y54.361 E.02075
G1 X208.597 Y33.889 E.93094
G1 X215.337 Y40.628 E.3065
G3 X218.328 Y41.429 I.67 J3.485 E.10303
G1 X225.868 Y33.889 E.34285
G1 X226.236 Y34.256 E.01669
G1 X226.236 Y35.884 E.05236
; WIPE_START
G1 X226.236 Y34.256 E-.61876
G1 X225.972 Y33.993 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X220.347 Y39.153 Z2 F30000
G1 X203.768 Y54.361 Z2
G1 Z1.6
G1 E.8 F1800
G1 F8843.478
G1 X205.396 Y54.361 E.05236
G1 X213.304 Y46.453 E.35958
G3 X212.485 Y43.533 I2.849 J-2.373 E.10046
G1 X202.84 Y33.889 E.4386
G1 X182.369 Y54.361 E.93094
G1 X183.014 Y54.361 E.02075
G1 X162.541 Y33.889 E.93098
G1 X142.07 Y54.361 E.93094
G1 X142.715 Y54.361 E.02075
G1 X131.397 Y43.042 E.51471
G2 X131.076 Y42.327 I-3.653 J1.209 E.02526
G1 X139.515 Y33.889 E.38373
G1 X159.986 Y54.361 E.93094
G1 X159.341 Y54.361 E.02075
G1 X179.814 Y33.889 E.93098
G1 X200.285 Y54.361 E.93094
G1 X199.64 Y54.361 E.02075
G1 X220.111 Y33.889 E.93094
G1 X226.236 Y40.013 E.2785
G1 X226.236 Y39.278 E.02361
G1 X205.764 Y59.749 E.93094
G1 X205.764 Y59.84 E.00292
G1 X226.236 Y80.311 E.93094
G1 X226.236 Y79.577 E.02361
G1 X205.764 Y100.048 E.93094
G1 X205.764 Y100.139 E.00292
G1 X226.236 Y120.61 E.93094
G1 X226.236 Y119.876 E.02361
G1 X219.512 Y126.599 E.30575
G2 X219.512 Y125.401 I-4.86 J-.599 E.03864
G1 X226.236 Y132.124 E.30575
G1 X226.236 Y131.39 E.02361
G1 X205.764 Y151.861 E.93094
G1 X205.764 Y151.952 E.00292
G1 X226.236 Y172.423 E.93094
G1 X226.236 Y171.689 E.02361
G1 X205.764 Y192.16 E.93094
G1 X205.764 Y192.251 E.00292
G1 X226.236 Y212.722 E.93094
G1 X226.236 Y211.987 E.02361
G1 X220.111 Y218.111 E.2785
G1 X199.639 Y197.639 E.93094
G1 X200.285 Y197.639 E.02075
G1 X179.814 Y218.111 E.93094
G1 X159.341 Y197.639 E.93098
G1 X159.986 Y197.639 E.02075
G1 X139.515 Y218.111 E.93094
G1 X131.076 Y209.673 E.38373
G2 X131.397 Y208.958 I-3.33 J-1.923 E.02526
G1 X142.715 Y197.639 E.51471
G1 X142.07 Y197.639 E.02075
G1 X162.541 Y218.111 E.93094
G1 X183.014 Y197.639 E.93098
G1 X182.369 Y197.639 E.02075
G1 X202.84 Y218.111 E.93094
G1 X212.485 Y208.467 E.43861
G3 X213.304 Y205.547 I3.667 J-.547 E.10046
G1 X205.396 Y197.639 E.35958
G1 X203.768 Y197.639 E.05236
; WIPE_START
G1 X205.396 Y197.639 E-.61876
G1 X205.659 Y197.902 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X198.119 Y199.082 Z2 F30000
G1 X125.531 Y210.443 Z2
G1 Z1.6
G1 E.8 F1800
G1 F8843.478
G2 X126.916 Y211.271 I2.813 J-3.135 E.0522
G1 X133.758 Y218.111 E.3111
G1 X154.229 Y197.639 E.93094
G1 X153.584 Y197.639 E.02075
G1 X174.055 Y218.111 E.93094
G1 X194.528 Y197.639 E.93098
G1 X193.883 Y197.639 E.02075
G1 X214.354 Y218.111 E.93094
G1 X226.236 Y206.23 E.5403
G1 X226.236 Y206.965 E.02361
G1 X205.764 Y186.494 E.93094
G1 X205.764 Y186.403 E.00292
G1 X226.236 Y165.932 E.93094
G1 X226.236 Y166.666 E.02361
G1 X205.764 Y146.195 E.93094
G1 X205.764 Y146.104 E.00292
G1 X226.236 Y125.633 E.93094
G1 X226.236 Y126.367 E.02361
M73 P51 R37
G1 X205.764 Y105.896 E.93094
G1 X205.764 Y105.805 E.00292
G1 X226.236 Y85.334 E.93094
G1 X226.236 Y86.068 E.02361
G1 X205.764 Y65.597 E.93094
G1 X205.764 Y65.506 E.00292
G1 X226.236 Y45.035 E.93094
G1 X226.236 Y45.77 E.02361
G1 X214.354 Y33.889 E.5403
G1 X193.883 Y54.361 E.93094
G1 X194.528 Y54.361 E.02075
G1 X174.055 Y33.889 E.93098
G1 X153.584 Y54.361 E.93094
G1 X154.229 Y54.361 E.02075
G1 X133.758 Y33.889 E.93094
G1 X126.916 Y40.729 E.3111
G3 X129.087 Y40.732 I1.08 J4.065 E.0706
G1 X122.242 Y33.889 E.31122
G1 X101.771 Y54.361 E.93094
G1 X102.416 Y54.361 E.02075
G1 X81.945 Y33.889 E.93094
G1 X61.472 Y54.361 E.93098
G1 X62.117 Y54.361 E.02075
G1 X41.646 Y33.889 E.93094
G1 X29.764 Y45.77 E.5403
G1 X29.764 Y45.035 E.02361
G1 X50.236 Y65.506 E.93094
G1 X50.236 Y65.597 E.00292
G1 X29.764 Y86.068 E.93094
G1 X29.764 Y85.334 E.02361
G1 X50.236 Y105.805 E.93094
G1 X50.236 Y105.896 E.00292
G1 X29.764 Y126.367 E.93094
G1 X29.764 Y125.633 E.02361
G1 X50.236 Y146.104 E.93094
G1 X50.236 Y146.195 E.00292
G1 X29.764 Y166.666 E.93094
G1 X29.764 Y165.932 E.02361
G1 X50.236 Y186.403 E.93094
G1 X50.236 Y186.494 E.00292
G1 X29.764 Y206.965 E.93094
G1 X29.764 Y206.23 E.02361
G1 X41.646 Y218.111 E.5403
G1 X62.117 Y197.639 E.93094
G1 X61.472 Y197.639 E.02075
G1 X81.945 Y218.111 E.93098
G1 X102.416 Y197.639 E.93094
G1 X101.771 Y197.639 E.02075
G1 X122.242 Y218.111 E.93094
G1 X129.087 Y211.268 E.31122
G2 X130.474 Y210.443 I-1.117 J-3.457 E.05233
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X129.935 Y210.871 E-.26145
G1 X129.087 Y211.268 E-.35591
G1 X128.821 Y211.533 E-.14263
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
G1 X128.15 Y204.667
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X128.24 Y204.67 E.00292
G3 X129.176 Y204.879 I-.242 J3.279 E.03093
G3 X127.772 Y204.669 I-1.167 J2.996 E.60356
G1 X128.09 Y204.667 E.01022
G1 X128.15 Y205.073 F30000
G1 F8843.478
G1 X128.21 Y205.073 E.00193
G3 X128.761 Y205.17 I-.192 J2.724 E.01803
G3 X127.802 Y205.075 I-.751 J2.706 E.53633
G1 X128.09 Y205.073 E.00926
G1 X128.214 Y205.485 F30000
G1 F8843.478
G1 X128.651 Y205.562 E.01426
G3 X127.833 Y205.481 I-.642 J2.314 E.4586
G3 X128.155 Y205.489 I.077 J3.396 E.01036
G1 X128.016 Y205.871 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.15 Y205.872 E.004
G3 X128.349 Y205.895 I-.147 J2.154 E.00597
G3 X127.862 Y205.872 I-.339 J1.98 E.36134
G1 X127.956 Y205.871 E.0028
; WIPE_START
M204 S10000
G1 X128.15 Y205.872 E-.07382
G1 X128.349 Y205.895 E-.07614
G1 X128.544 Y205.94 E-.07616
G1 X128.917 Y206.086 E-.15209
G1 X129.253 Y206.303 E-.15216
G1 X129.54 Y206.583 E-.15211
G1 X129.655 Y206.751 E-.07753
; WIPE_END
G1 E-.04 F1800
G1 X122.024 Y206.586 Z2.2 F30000
G1 X41.02 Y204.827 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.176 Y204.879 E.0053
G3 X39.772 Y204.669 I-1.167 J2.996 E.60356
G3 X40.871 Y204.779 I.226 J3.281 E.0357
G1 X40.962 Y204.809 E.00309
G1 X40.573 Y205.127 F30000
G1 F8843.478
G1 X40.761 Y205.17 E.00621
G3 X39.802 Y205.075 I-.751 J2.706 E.53633
G3 X40.488 Y205.107 I.216 J2.722 E.02214
G1 X40.514 Y205.113 E.00087
G1 X40.131 Y205.479 F30000
G1 F8843.478
G1 X40.179 Y205.491 E.00157
G3 X40.651 Y205.562 I-.269 J3.386 E.01537
G3 X39.833 Y205.481 I-.642 J2.314 E.4586
G1 X40.071 Y205.48 E.00767
G1 X39.857 Y205.873 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X39.862 Y205.872 E.00014
G3 X40.349 Y205.895 I.141 J2.154 E.01456
G3 X39.554 Y205.919 I-.339 J1.98 E.35204
G1 X39.798 Y205.882 E.00737
; WIPE_START
M204 S10000
G1 X39.862 Y205.872 E-.02455
G1 X40.15 Y205.87 E-.10956
G1 X40.349 Y205.895 E-.07618
G1 X40.544 Y205.94 E-.07616
G1 X40.917 Y206.086 E-.15209
G1 X41.253 Y206.303 E-.15216
G1 X41.54 Y206.583 E-.15211
G1 X41.565 Y206.62 E-.0172
; WIPE_END
G1 E-.04 F1800
G1 X41.291 Y198.993 Z2.2 F30000
G1 X38.563 Y123.125 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X38.679 Y123.073 E.00409
G3 X39.772 Y122.794 I1.33 J2.927 E.03644
G3 X41.176 Y123.004 I.226 J3.281 E.04602
G3 X38.395 Y123.22 I-1.167 J2.996 E.55683
G1 X38.511 Y123.154 E.00429
G1 X39.049 Y123.358 F30000
G1 F8843.478
G1 X39.107 Y123.342 E.00192
G3 X39.802 Y123.2 I.903 J2.659 E.02288
G3 X40.761 Y123.295 I.216 J2.722 E.03115
G3 X38.847 Y123.445 I-.751 J2.706 E.50446
G1 X38.994 Y123.381 E.00515
G1 X39.54 Y123.647 F30000
G1 F8843.478
G1 X39.833 Y123.606 E.00948
G3 X40.651 Y123.687 I.077 J3.398 E.0265
G3 X39.466 Y123.662 I-.642 J2.314 E.44668
G1 X39.482 Y123.659 E.0005
G1 X39.863 Y123.997 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X40.15 Y123.997 E.00855
G3 X40.349 Y124.02 I-.147 J2.153 E.00597
G3 X39.803 Y124.002 I-.339 J1.98 E.35958
; WIPE_START
M204 S10000
G1 X40.15 Y123.997 E-.13182
G1 X40.349 Y124.02 E-.07615
G1 X40.734 Y124.129 E-.15213
G1 X40.917 Y124.211 E-.07612
G1 X41.253 Y124.428 E-.15208
G1 X41.54 Y124.708 E-.15216
G1 X41.569 Y124.75 E-.01954
; WIPE_END
G1 E-.04 F1800
G1 X48.548 Y127.84 Z2.2 F30000
G1 X205.416 Y197.291 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X50.584 Y197.291 E4.97885
G1 X50.584 Y54.709 E4.58493
G1 X205.416 Y54.709 E4.97885
G1 X205.416 Y197.231 E4.583
G1 X205.009 Y196.884 F30000
G1 F8843.478
G1 X50.991 Y196.884 E4.95267
G1 X50.991 Y55.116 E4.55875
G1 X205.009 Y55.116 E4.95267
G1 X205.009 Y196.824 E4.55682
G1 X204.602 Y196.477 F30000
G1 F8843.478
G1 X51.398 Y196.477 E4.92649
G1 X51.398 Y55.523 E4.53257
G1 X204.602 Y55.523 E4.92649
G1 X204.602 Y196.417 E4.53064
G1 X204.21 Y196.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X51.79 Y196.085 E4.54007
G1 X51.79 Y55.915 E4.17519
G1 X204.21 Y55.915 E4.54007
G1 X204.21 Y196.025 E4.1734
; WIPE_START
M204 S10000
G1 X202.21 Y196.026 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X196.708 Y190.736 Z2.2 F30000
G1 X41.018 Y41.077 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.176 Y41.129 E.00533
G3 X39.772 Y40.919 I-1.167 J2.996 E.60357
G3 X40.871 Y41.029 I.226 J3.281 E.0357
G1 X40.961 Y41.058 E.00305
G1 X40.572 Y41.376 F30000
G1 F8843.478
G1 X40.761 Y41.42 E.00625
G3 X39.802 Y41.325 I-.751 J2.706 E.53633
G3 X40.488 Y41.357 I.216 J2.722 E.02214
G1 X40.513 Y41.363 E.00083
G1 X40.13 Y41.729 F30000
G1 F8843.478
G1 X40.179 Y41.741 E.00162
G3 X40.651 Y41.812 I-.269 J3.387 E.01537
G3 X39.833 Y41.731 I-.642 J2.314 E.4586
G1 X40.07 Y41.73 E.00763
G1 X39.831 Y42.126 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X39.862 Y42.122 E.00092
G3 X40.349 Y42.145 I.141 J2.154 E.01456
G3 X39.554 Y42.169 I-.339 J1.98 E.35204
G1 X39.772 Y42.135 E.00659
; WIPE_START
M204 S10000
G1 X39.862 Y42.122 E-.03448
G1 X40.15 Y42.12 E-.10955
G1 X40.349 Y42.145 E-.0762
G1 X40.734 Y42.254 E-.15212
G1 X41.091 Y42.436 E-.15212
G1 X41.404 Y42.686 E-.1521
G1 X41.545 Y42.854 E-.08344
; WIPE_END
G1 E-.04 F1800
G1 X49.176 Y42.71 Z2.2 F30000
G1 X126.563 Y41.25 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X126.679 Y41.198 E.00408
G3 X127.772 Y40.919 I1.33 J2.927 E.03644
G3 X129.176 Y41.13 I.226 J3.281 E.04602
G3 X126.395 Y41.345 I-1.167 J2.996 E.55682
G1 X126.511 Y41.279 E.00429
G1 X127.049 Y41.483 F30000
G1 F8843.478
G1 X127.107 Y41.467 E.00192
G3 X127.802 Y41.325 I.903 J2.659 E.02288
G3 X128.761 Y41.42 I.216 J2.723 E.03115
G3 X126.847 Y41.57 I-.751 J2.706 E.50446
G1 X126.994 Y41.506 E.00515
G1 X127.541 Y41.772 F30000
G1 F8843.478
G1 X127.833 Y41.731 E.00948
G3 X128.651 Y41.812 I.077 J3.397 E.0265
G3 X127.466 Y41.787 I-.642 J2.314 E.44668
G1 X127.482 Y41.784 E.0005
G1 X127.863 Y42.122 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.15 Y42.122 E.00855
G3 X128.349 Y42.145 I-.147 J2.153 E.00597
G3 X127.803 Y42.127 I-.339 J1.98 E.35959
; WIPE_START
M204 S10000
G1 X128.15 Y42.122 E-.13178
G1 X128.349 Y42.145 E-.07616
G1 X128.734 Y42.254 E-.15212
G1 X129.091 Y42.436 E-.15212
G1 X129.404 Y42.686 E-.1521
G1 X129.566 Y42.879 E-.09573
; WIPE_END
G1 E-.04 F1800
G1 X137.196 Y42.722 Z2.2 F30000
G1 X217.02 Y41.077 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X217.176 Y41.129 E.00529
G3 X215.772 Y40.919 I-1.167 J2.996 E.60356
G3 X216.871 Y41.029 I.226 J3.281 E.0357
G1 X216.962 Y41.059 E.00309
G1 X216.573 Y41.377 F30000
G1 F8843.478
G1 X216.761 Y41.42 E.00621
G3 X215.802 Y41.325 I-.751 J2.706 E.53633
G3 X216.488 Y41.357 I.216 J2.722 E.02214
G1 X216.514 Y41.363 E.00087
G1 X216.131 Y41.729 F30000
G1 F8843.478
G1 X216.179 Y41.741 E.00157
G3 X216.651 Y41.812 I-.269 J3.388 E.01537
G3 X215.833 Y41.731 I-.642 J2.314 E.4586
G1 X216.071 Y41.73 E.00767
G1 X215.863 Y42.122 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X216.15 Y42.122 E.00855
G3 X216.349 Y42.145 I-.147 J2.153 E.00597
G3 X215.803 Y42.127 I-.339 J1.98 E.35958
; WIPE_START
M204 S10000
G1 X216.15 Y42.122 E-.13183
G1 X216.349 Y42.145 E-.07615
G1 X216.544 Y42.19 E-.07614
G1 X216.917 Y42.336 E-.15209
G1 X217.253 Y42.553 E-.15216
G1 X217.54 Y42.833 E-.1521
G1 X217.569 Y42.875 E-.01953
; WIPE_END
G1 E-.04 F1800
G1 X217.419 Y50.506 Z2.2 F30000
G1 X215.868 Y129.213 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X215.6 Y129.189 E.00865
G3 X215.772 Y122.794 I.409 J-3.189 E.30397
G3 X217.176 Y123.004 I.226 J3.281 E.04602
G3 X215.928 Y129.215 I-1.167 J2.996 E.28901
G1 X215.896 Y128.807 F30000
G1 F8843.478
G1 X215.651 Y128.787 E.0079
G3 X215.802 Y123.2 I.359 J-2.786 E.26545
G3 X216.761 Y123.295 I.216 J2.722 E.03115
G3 X215.956 Y128.809 I-.751 J2.706 E.26104
G1 X215.94 Y128.39 F30000
G1 F8843.478
G1 X215.701 Y128.382 E.00769
G3 X215.833 Y123.606 I.307 J-2.382 E.22702
G3 X216.651 Y123.687 I.077 J3.398 E.0265
G3 X216.18 Y128.396 I-.642 J2.314 E.21619
G1 X216 Y128.392 E.00576
G1 X215.968 Y128.008 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X215.95 Y128.008 E.00053
G3 X215.862 Y123.997 I.06 J-2.008 E.18174
G3 X216.349 Y124.02 I.141 J2.154 E.01456
G3 X216.349 Y127.98 I-.339 J1.98 E.16766
G1 X216.028 Y128.004 E.00961
; WIPE_START
M204 S10000
G1 X215.95 Y128.008 E-.0295
G1 X215.553 Y127.96 E-.15207
G1 X215.173 Y127.832 E-.15211
G1 X214.827 Y127.632 E-.1521
G1 X214.67 Y127.507 E-.07617
G1 X214.398 Y127.214 E-.15212
G1 X214.335 Y127.111 E-.04592
; WIPE_END
G1 E-.04 F1800
G1 X214.357 Y134.743 Z2.2 F30000
G1 X214.563 Y205 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X214.679 Y204.948 E.00409
G3 X215.772 Y204.669 I1.33 J2.927 E.03644
G3 X217.176 Y204.88 I.226 J3.281 E.04602
G3 X214.395 Y205.095 I-1.167 J2.996 E.55682
G1 X214.511 Y205.029 E.00429
G1 X215.049 Y205.233 F30000
G1 F8843.478
G1 X215.107 Y205.217 E.00192
G3 X215.802 Y205.075 I.903 J2.659 E.02288
G3 X216.761 Y205.17 I.216 J2.722 E.03115
M73 P51 R36
G3 X214.847 Y205.32 I-.751 J2.706 E.50446
G1 X214.994 Y205.256 E.00515
G1 X215.54 Y205.522 F30000
G1 F8843.478
G1 X215.833 Y205.481 E.00948
G3 X216.651 Y205.562 I.077 J3.396 E.0265
G3 X215.466 Y205.537 I-.642 J2.314 E.44668
G1 X215.482 Y205.534 E.0005
G1 X215.858 Y205.873 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X215.862 Y205.872 E.00013
G3 X216.349 Y205.895 I.141 J2.154 E.01456
G3 X215.554 Y205.919 I-.339 J1.98 E.35204
G1 X215.798 Y205.882 E.00737
; WIPE_START
M204 S10000
G1 X215.862 Y205.872 E-.02445
G1 X216.15 Y205.87 E-.10956
G1 X216.349 Y205.895 E-.07618
G1 X216.544 Y205.94 E-.07615
G1 X216.917 Y206.086 E-.15209
G1 X217.253 Y206.303 E-.15216
G1 X217.54 Y206.583 E-.15211
G1 X217.566 Y206.62 E-.01731
; WIPE_END
G1 E-.04 F1800
G1 X222.191 Y212.692 Z2.2 F30000
G1 X226.584 Y218.459 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X29.416 Y218.459 E6.34019
G1 X29.416 Y33.541 E5.94628
G1 X226.584 Y33.541 E6.34019
G1 X226.584 Y218.399 E5.94435
G1 X226.991 Y218.866 F30000
G1 F8843.478
G1 X29.009 Y218.866 E6.36637
G1 X29.009 Y33.134 E5.97246
G1 X226.991 Y33.134 E6.36637
G1 X226.991 Y218.806 E5.97053
G1 X227.398 Y219.273 F30000
G1 F8843.478
G1 X28.602 Y219.273 E6.39255
G1 X28.602 Y32.727 E5.99864
G1 X227.398 Y32.727 E6.39255
G1 X227.398 Y219.213 E5.99671
G1 X227.79 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X28.21 Y219.665 E5.94481
G1 X28.21 Y32.335 E5.57992
G1 X227.79 Y32.335 E5.94481
G1 X227.79 Y219.605 E5.57813
; WIPE_START
M204 S10000
G1 X225.79 Y219.606 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X221.916 Y213.03 Z2.2 F30000
G1 X219.435 Y208.82 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G2 X219.502 Y207.207 I-3.499 J-.952 E.05233
G1 X226.236 Y200.473 E.30622
G1 X226.236 Y201.208 E.02361
G1 X205.764 Y180.737 E.93094
G1 X205.764 Y180.646 E.00292
G1 X226.236 Y160.175 E.93094
G1 X226.236 Y160.909 E.02361
G1 X205.764 Y140.438 E.93094
G1 X205.764 Y140.347 E.00292
G1 X216.596 Y129.515 E.49258
G2 X217.559 Y129.205 I-1.581 J-6.546 E.03257
G1 X226.236 Y137.881 E.39457
G1 X226.236 Y137.147 E.02361
G1 X205.764 Y157.618 E.93094
G1 X205.764 Y157.709 E.00292
G1 X226.236 Y178.18 E.93094
G1 X226.236 Y177.446 E.02361
G1 X185.571 Y218.111 E1.84928
G1 X165.098 Y197.639 E.93098
G1 X165.743 Y197.639 E.02075
G1 X145.272 Y218.111 E.93094
G1 X124.799 Y197.639 E.93098
G1 X125.444 Y197.639 E.02075
G1 X104.973 Y218.111 E.93094
G1 X84.5 Y197.639 E.93098
G1 X85.145 Y197.639 E.02075
G1 X64.672 Y218.111 E.93098
G1 X29.764 Y183.203 E1.58747
G1 X29.764 Y183.937 E.02361
G1 X50.236 Y163.466 E.93094
G1 X50.236 Y163.375 E.00292
G1 X29.764 Y142.904 E.93094
G1 X29.764 Y143.638 E.02361
G1 X50.236 Y123.167 E.93094
M73 P52 R36
G1 X50.236 Y123.076 E.00292
G1 X29.764 Y102.605 E.93094
G1 X29.764 Y103.339 E.02361
G1 X50.236 Y82.868 E.93094
G1 X50.236 Y82.777 E.00292
G1 X29.764 Y62.306 E.93094
G1 X29.764 Y63.04 E.02361
G1 X58.915 Y33.889 E1.32567
G1 X79.388 Y54.361 E.93098
G1 X78.743 Y54.361 E.02075
G1 X99.214 Y33.889 E.93094
G1 X119.687 Y54.361 E.93098
G1 X119.042 Y54.361 E.02075
G1 X126.2 Y47.203 E.3255
G2 X129.798 Y47.2 I1.797 J-3.192 E.12095
G1 X136.958 Y54.361 E.32562
G1 X136.313 Y54.361 E.02075
G1 X156.786 Y33.889 E.93098
G1 X177.257 Y54.361 E.93094
G1 X176.612 Y54.361 E.02075
G1 X197.085 Y33.889 E.93098
G1 X226.236 Y63.04 E1.32567
G1 X226.236 Y62.306 E.02361
G1 X205.764 Y82.777 E.93094
G1 X205.764 Y82.868 E.00292
G1 X226.236 Y103.339 E.93094
G1 X226.236 Y102.605 E.02361
G1 X205.764 Y123.076 E.93094
G1 X205.764 Y123.167 E.00292
G1 X226.236 Y143.638 E.93094
G1 X226.236 Y142.904 E.02361
G1 X205.764 Y163.375 E.93094
G1 X205.764 Y163.466 E.00292
G1 X226.236 Y183.937 E.93094
G1 X226.236 Y183.203 E.02361
G1 X191.328 Y218.111 E1.58747
G1 X170.855 Y197.639 E.93098
G1 X171.5 Y197.639 E.02075
G1 X151.029 Y218.111 E.93094
G1 X130.556 Y197.639 E.93098
G1 X131.201 Y197.639 E.02075
G1 X110.73 Y218.111 E.93094
G1 X90.257 Y197.639 E.93098
G1 X90.902 Y197.639 E.02075
G1 X70.429 Y218.111 E.93098
G1 X29.764 Y177.446 E1.84928
G1 X29.764 Y178.18 E.02361
G1 X50.236 Y157.709 E.93094
G1 X50.236 Y157.618 E.00292
G1 X29.764 Y137.147 E.93094
G1 X29.764 Y137.881 E.02361
G1 X38.441 Y129.204 E.39459
G2 X39.4 Y129.511 I2.244 J-5.351 E.03241
G1 X50.236 Y140.347 E.49276
G1 X50.236 Y140.438 E.00292
G1 X29.764 Y160.909 E.93094
G1 X29.764 Y160.175 E.02361
G1 X50.236 Y180.646 E.93094
G1 X50.236 Y180.737 E.00292
G1 X29.764 Y201.208 E.93094
G1 X29.764 Y200.473 E.02361
G1 X36.5 Y207.209 E.30632
G2 X36.564 Y208.821 I4.149 J.643 E.0522
; WIPE_START
G1 X36.438 Y208.053 E-.29592
G1 X36.5 Y207.209 E-.32142
G1 X36.235 Y206.944 E-.14267
; WIPE_END
G1 E-.04 F1800
G1 X41.026 Y204.462 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
G1 F8843.478
G2 X39.415 Y204.368 I-1.005 J3.367 E.05233
G1 X29.764 Y194.716 E.43889
G1 X29.764 Y195.451 E.02361
G1 X50.236 Y174.98 E.93094
G1 X50.236 Y174.889 E.00292
G1 X29.764 Y154.418 E.93094
G1 X29.764 Y155.152 E.02361
G1 X50.236 Y134.681 E.93094
G1 X50.236 Y134.59 E.00292
G1 X43.203 Y127.558 E.31979
G2 X43.203 Y124.442 I-3.341 J-1.558 E.10345
G1 X50.236 Y117.41 E.31979
G1 X50.236 Y117.319 E.00292
G1 X29.764 Y96.848 E.93094
G1 X29.764 Y97.582 E.02361
G1 X50.236 Y77.111 E.93094
G1 X50.236 Y77.02 E.00292
G1 X29.764 Y56.549 E.93094
G1 X29.764 Y57.283 E.02361
G1 X39.41 Y47.638 E.43863
G2 X41.02 Y47.54 I.554 J-4.171 E.0522
; WIPE_START
G1 X40.267 Y47.682 E-.29138
G1 X39.41 Y47.638 E-.32596
G1 X39.144 Y47.904 E-.14266
; WIPE_END
G1 E-.04 F1800
G1 X36.564 Y43.179 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
G1 F8843.478
G2 X36.5 Y44.791 I4.085 J.969 E.0522
G1 X29.764 Y51.527 E.30632
G1 X29.764 Y50.792 E.02361
G1 X50.236 Y71.263 E.93094
G1 X50.236 Y71.354 E.00292
G1 X29.764 Y91.825 E.93094
G1 X29.764 Y91.091 E.02361
G1 X50.236 Y111.562 E.93094
G1 X50.236 Y111.653 E.00292
G1 X39.393 Y122.496 E.49308
G2 X38.441 Y122.796 I1.092 J5.119 E.03213
G1 X29.764 Y114.119 E.39459
G1 X29.764 Y114.853 E.02361
G1 X50.236 Y94.382 E.93094
G1 X50.236 Y94.291 E.00292
G1 X29.764 Y73.82 E.93094
G1 X29.764 Y74.554 E.02361
G1 X70.429 Y33.889 E1.84928
G1 X90.902 Y54.361 E.93098
G1 X90.257 Y54.361 E.02075
G1 X110.728 Y33.889 E.93094
G1 X131.201 Y54.361 E.93098
G1 X130.556 Y54.361 E.02075
G1 X151.027 Y33.889 E.93094
G1 X171.5 Y54.361 E.93098
G1 X170.855 Y54.361 E.02075
G1 X191.328 Y33.889 E.93098
G1 X226.236 Y68.797 E1.58747
G1 X226.236 Y68.063 E.02361
G1 X205.764 Y88.534 E.93094
G1 X205.764 Y88.625 E.00292
G1 X226.236 Y109.096 E.93094
G1 X226.236 Y108.362 E.02361
G1 X205.764 Y128.833 E.93094
G1 X205.764 Y128.924 E.00292
G1 X226.236 Y149.395 E.93094
G1 X226.236 Y148.661 E.02361
G1 X205.764 Y169.132 E.93094
G1 X205.764 Y169.223 E.00292
G1 X226.236 Y189.694 E.93094
G1 X226.236 Y188.96 E.02361
G1 X197.085 Y218.111 E1.32567
G1 X176.612 Y197.639 E.93098
G1 X177.257 Y197.639 E.02075
G1 X156.786 Y218.111 E.93094
G1 X136.313 Y197.639 E.93098
G1 X136.958 Y197.639 E.02075
G1 X129.798 Y204.8 E.32562
G2 X126.2 Y204.797 I-1.801 J3.137 E.1211
G1 X119.042 Y197.639 E.3255
G1 X119.687 Y197.639 E.02075
G1 X99.214 Y218.111 E.93098
G1 X78.743 Y197.639 E.93094
G1 X79.388 Y197.639 E.02075
G1 X58.915 Y218.111 E.93098
G1 X29.764 Y188.96 E1.32567
G1 X29.764 Y189.694 E.02361
G1 X50.236 Y169.223 E.93094
G1 X50.236 Y169.132 E.00292
G1 X29.764 Y148.661 E.93094
G1 X29.764 Y149.395 E.02361
G1 X50.236 Y128.924 E.93094
G1 X50.236 Y128.833 E.00292
G1 X29.764 Y108.362 E.93094
G1 X29.764 Y109.096 E.02361
G1 X50.236 Y88.625 E.93094
G1 X50.236 Y88.534 E.00292
G1 X29.764 Y68.063 E.93094
G1 X29.764 Y68.797 E.02361
G1 X64.672 Y33.889 E1.58747
G1 X85.145 Y54.361 E.93098
G1 X84.5 Y54.361 E.02075
G1 X104.971 Y33.889 E.93094
G1 X125.444 Y54.361 E.93098
G1 X124.799 Y54.361 E.02075
G1 X145.27 Y33.889 E.93094
G1 X165.743 Y54.361 E.93098
G1 X165.098 Y54.361 E.02075
G1 X185.571 Y33.889 E.93098
G1 X226.236 Y74.554 E1.84928
G1 X226.236 Y73.82 E.02361
G1 X205.764 Y94.291 E.93094
G1 X205.764 Y94.382 E.00292
G1 X226.236 Y114.853 E.93094
G1 X226.236 Y114.119 E.02361
G1 X217.559 Y122.795 E.39457
G2 X216.596 Y122.485 I-2.544 J6.235 E.03257
G1 X205.764 Y111.653 E.49258
G1 X205.764 Y111.562 E.00292
G1 X226.236 Y91.091 E.93094
G1 X226.236 Y91.825 E.02361
G1 X205.764 Y71.354 E.93094
G1 X205.764 Y71.263 E.00292
G1 X226.236 Y50.792 E.93094
G1 X226.236 Y51.527 E.02361
G1 X219.502 Y44.793 E.30622
G2 X219.435 Y43.18 I-3.565 J-.661 E.05233
; WIPE_START
G1 X219.567 Y44.125 E-.36237
G1 X219.502 Y44.793 E-.25496
G1 X219.767 Y45.058 E-.14267
; WIPE_END
G1 E-.04 F1800
G1 X214.982 Y47.539 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
G1 F8843.478
G2 X216.593 Y47.641 I1.028 J-3.481 E.05233
G1 X226.236 Y57.284 E.43851
G1 X226.236 Y56.549 E.02361
G1 X205.764 Y77.02 E.93094
G1 X205.764 Y77.111 E.00292
G1 X226.236 Y97.582 E.93094
G1 X226.236 Y96.848 E.02361
G1 X205.764 Y117.319 E.93094
G1 X205.764 Y117.41 E.00292
G1 X212.794 Y124.439 E.31966
G2 X212.794 Y127.561 I3.244 J1.561 E.10382
G1 X205.764 Y134.59 E.31966
G1 X205.764 Y134.681 E.00292
G1 X226.236 Y155.152 E.93094
G1 X226.236 Y154.418 E.02361
G1 X205.764 Y174.889 E.93094
G1 X205.764 Y174.98 E.00292
G1 X226.236 Y195.451 E.93094
G1 X226.236 Y194.716 E.02361
G1 X216.593 Y204.359 E.43851
G2 X214.981 Y204.461 I-.444 J5.777 E.05209
G1 X203.768 Y197.639 F30000
G1 F8843.478
G1 X205.396 Y197.639 E.05236
G1 X213.304 Y205.547 E.35959
G2 X212.485 Y208.467 I2.849 J2.373 E.10046
G1 X202.84 Y218.111 E.43861
G1 X182.369 Y197.639 E.93094
G1 X183.014 Y197.639 E.02075
G1 X162.541 Y218.111 E.93098
G1 X142.07 Y197.639 E.93094
G1 X142.715 Y197.639 E.02075
G1 X131.397 Y208.958 E.51471
G3 X131.076 Y209.673 I-3.66 J-1.212 E.02526
G1 X139.515 Y218.111 E.38373
G1 X159.986 Y197.639 E.93094
G1 X159.341 Y197.639 E.02075
G1 X179.814 Y218.111 E.93098
G1 X200.285 Y197.639 E.93094
G1 X199.639 Y197.639 E.02075
G1 X220.111 Y218.111 E.93094
G1 X226.236 Y211.987 E.2785
G1 X226.236 Y212.722 E.02361
G1 X205.764 Y192.251 E.93094
G1 X205.764 Y192.16 E.00292
G1 X226.236 Y171.689 E.93094
G1 X226.236 Y172.423 E.02361
G1 X205.764 Y151.952 E.93094
G1 X205.764 Y151.861 E.00292
G1 X226.236 Y131.39 E.93094
G1 X226.236 Y132.124 E.02361
G1 X219.512 Y125.401 E.30575
G3 X219.512 Y126.599 I-4.864 J.599 E.03864
G1 X226.236 Y119.876 E.30575
G1 X226.236 Y120.61 E.02361
G1 X205.764 Y100.139 E.93094
G1 X205.764 Y100.048 E.00292
G1 X226.236 Y79.577 E.93094
G1 X226.236 Y80.311 E.02361
G1 X205.764 Y59.84 E.93094
G1 X205.764 Y59.749 E.00292
G1 X226.236 Y39.278 E.93094
G1 X226.236 Y40.013 E.02361
G1 X220.111 Y33.889 E.2785
G1 X199.64 Y54.361 E.93094
G1 X200.285 Y54.361 E.02075
G1 X179.814 Y33.889 E.93094
G1 X159.341 Y54.361 E.93098
G1 X159.986 Y54.361 E.02075
G1 X139.515 Y33.889 E.93094
G1 X131.076 Y42.327 E.38373
G3 X131.397 Y43.042 I-3.335 J1.926 E.02526
G1 X142.715 Y54.361 E.51471
G1 X142.07 Y54.361 E.02075
G1 X162.541 Y33.889 E.93094
G1 X183.014 Y54.361 E.93098
G1 X182.369 Y54.361 E.02075
G1 X202.84 Y33.889 E.93094
G1 X212.485 Y43.533 E.4386
G2 X213.304 Y46.453 I3.667 J.547 E.10046
G1 X205.396 Y54.361 E.35959
G1 X203.768 Y54.361 E.05236
; WIPE_START
G1 X205.396 Y54.361 E-.61876
G1 X205.659 Y54.098 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X211.374 Y49.039 Z2.2 F30000
G1 X226.236 Y35.884 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F8843.478
G1 X226.236 Y34.256 E.05236
G1 X225.868 Y33.889 E.01669
G1 X218.328 Y41.429 E.34285
G2 X215.337 Y40.628 I-2.321 J2.684 E.10302
G1 X208.597 Y33.889 E.30651
G1 X188.126 Y54.361 E.93094
G1 X188.771 Y54.361 E.02075
G1 X168.298 Y33.889 E.93098
G1 X147.827 Y54.361 E.93094
G1 X148.472 Y54.361 E.02075
G1 X127.999 Y33.889 E.93098
G1 X107.528 Y54.361 E.93094
G1 X108.173 Y54.361 E.02075
G1 X87.7 Y33.889 E.93098
G1 X67.229 Y54.361 E.93094
G1 X67.874 Y54.361 E.02075
G1 X47.403 Y33.889 E.93094
G1 X40.667 Y40.624 E.30628
G2 X37.67 Y41.427 I-.661 J3.526 E.1032
G1 X30.132 Y33.889 E.34277
G1 X29.764 Y34.256 E.01669
G1 X29.764 Y35.884 E.05236
; WIPE_START
G1 X29.764 Y34.256 E-.61876
G1 X30.028 Y33.993 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X35.653 Y39.153 Z2.2 F30000
G1 X52.232 Y54.361 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F8843.478
G1 X50.604 Y54.361 E.05236
G1 X42.698 Y46.455 E.35952
G2 X43.513 Y43.535 I-2.855 J-2.371 E.10044
G1 X53.16 Y33.889 E.43866
G1 X73.631 Y54.361 E.93094
G1 X72.986 Y54.361 E.02075
G1 X93.459 Y33.889 E.93098
G1 X113.93 Y54.361 E.93094
G1 X113.285 Y54.361 E.02075
G1 X124.607 Y43.038 E.5149
G3 X124.924 Y42.326 I3.524 J1.138 E.0251
G1 X116.485 Y33.889 E.3837
G1 X96.014 Y54.361 E.93094
G1 X96.659 Y54.361 E.02075
G1 X76.186 Y33.889 E.93098
G1 X55.715 Y54.361 E.93094
G1 X56.361 Y54.361 E.02075
G1 X35.889 Y33.889 E.93094
G1 X29.764 Y40.013 E.2785
G1 X29.764 Y39.278 E.02361
G1 X50.236 Y59.749 E.93094
G1 X50.236 Y59.84 E.00292
G1 X29.764 Y80.311 E.93094
G1 X29.764 Y79.577 E.02361
G1 X50.236 Y100.048 E.93094
G1 X50.236 Y100.139 E.00292
G1 X29.764 Y120.61 E.93094
G1 X29.764 Y119.876 E.02361
G1 X36.487 Y126.598 E.3057
G3 X36.487 Y125.402 I3.636 J-.598 E.03864
G1 X29.764 Y132.124 E.3057
G1 X29.764 Y131.39 E.02361
G1 X50.236 Y151.861 E.93094
G1 X50.236 Y151.952 E.00292
G1 X29.764 Y172.423 E.93094
G1 X29.764 Y171.689 E.02361
G1 X50.236 Y192.16 E.93094
G1 X50.236 Y192.251 E.00292
M73 P53 R36
G1 X29.764 Y212.722 E.93094
G1 X29.764 Y211.987 E.02361
G1 X35.889 Y218.111 E.2785
G1 X56.36 Y197.639 E.93094
G1 X55.715 Y197.639 E.02075
G1 X76.186 Y218.111 E.93094
G1 X96.659 Y197.639 E.93098
G1 X96.014 Y197.639 E.02075
G1 X116.485 Y218.111 E.93094
G1 X124.924 Y209.674 E.3837
G3 X124.607 Y208.962 I3.209 J-1.851 E.0251
G1 X113.285 Y197.639 E.5149
G1 X113.93 Y197.639 E.02075
G1 X93.459 Y218.111 E.93094
G1 X72.986 Y197.639 E.93098
G1 X73.631 Y197.639 E.02075
G1 X53.16 Y218.111 E.93094
G1 X43.513 Y208.465 E.43866
G2 X42.698 Y205.545 I-3.67 J-.549 E.10044
G1 X50.604 Y197.639 E.35952
M73 P53 R35
G1 X52.232 Y197.639 E.05236
; WIPE_START
G1 X50.604 Y197.639 E-.61876
G1 X50.341 Y197.902 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X44.626 Y202.961 Z2.2 F30000
G1 X29.764 Y216.116 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F8843.478
G1 X29.764 Y217.744 E.05236
G1 X30.132 Y218.111 E.01669
G1 X37.67 Y210.573 E.34277
G2 X40.667 Y211.376 I2.373 J-2.859 E.10295
G1 X47.403 Y218.111 E.30628
G1 X67.874 Y197.639 E.93094
G1 X67.229 Y197.639 E.02075
G1 X87.7 Y218.111 E.93094
G1 X108.173 Y197.639 E.93098
G1 X107.528 Y197.639 E.02075
G1 X127.999 Y218.111 E.93094
G1 X148.472 Y197.639 E.93098
G1 X147.827 Y197.639 E.02075
G1 X168.298 Y218.111 E.93094
G1 X188.771 Y197.639 E.93098
G1 X188.126 Y197.639 E.02075
G1 X208.597 Y218.111 E.93094
G1 X215.334 Y211.375 E.30636
G2 X218.328 Y210.571 I.629 J-3.637 E.10288
G1 X225.868 Y218.111 E.34285
G1 X226.236 Y217.744 E.01669
G1 X226.236 Y216.116 E.05236
G1 X130.474 Y210.443 F30000
G1 F8843.478
G3 X129.087 Y211.268 I-2.504 J-2.632 E.05233
G1 X122.242 Y218.111 E.31122
G1 X101.771 Y197.639 E.93094
G1 X102.416 Y197.639 E.02075
G1 X81.945 Y218.111 E.93094
G1 X61.472 Y197.639 E.93098
G1 X62.117 Y197.639 E.02075
G1 X41.646 Y218.111 E.93094
G1 X29.764 Y206.23 E.5403
G1 X29.764 Y206.965 E.02361
G1 X50.236 Y186.494 E.93094
G1 X50.236 Y186.403 E.00292
G1 X29.764 Y165.932 E.93094
G1 X29.764 Y166.666 E.02361
G1 X50.236 Y146.195 E.93094
G1 X50.236 Y146.104 E.00292
G1 X29.764 Y125.633 E.93094
G1 X29.764 Y126.367 E.02361
G1 X50.236 Y105.896 E.93094
G1 X50.236 Y105.805 E.00292
G1 X29.764 Y85.334 E.93094
G1 X29.764 Y86.068 E.02361
G1 X50.236 Y65.597 E.93094
G1 X50.236 Y65.506 E.00292
G1 X29.764 Y45.035 E.93094
G1 X29.764 Y45.77 E.02361
G1 X41.646 Y33.889 E.5403
G1 X62.117 Y54.361 E.93094
G1 X61.472 Y54.361 E.02075
G1 X81.945 Y33.889 E.93098
G1 X102.416 Y54.361 E.93094
G1 X101.771 Y54.361 E.02075
G1 X122.242 Y33.889 E.93094
G1 X129.087 Y40.732 E.31122
G2 X126.916 Y40.729 I-1.09 J4.04 E.07061
G1 X133.758 Y33.889 E.3111
G1 X154.229 Y54.361 E.93094
G1 X153.584 Y54.361 E.02075
G1 X174.055 Y33.889 E.93094
G1 X194.528 Y54.361 E.93098
G1 X193.883 Y54.361 E.02075
G1 X214.354 Y33.889 E.93094
G1 X226.236 Y45.77 E.5403
G1 X226.236 Y45.035 E.02361
G1 X205.764 Y65.506 E.93094
G1 X205.764 Y65.597 E.00292
G1 X226.236 Y86.068 E.93094
G1 X226.236 Y85.334 E.02361
G1 X205.764 Y105.805 E.93094
G1 X205.764 Y105.896 E.00292
G1 X226.236 Y126.367 E.93094
G1 X226.236 Y125.633 E.02361
G1 X205.764 Y146.104 E.93094
G1 X205.764 Y146.195 E.00292
G1 X226.236 Y166.666 E.93094
G1 X226.236 Y165.932 E.02361
G1 X205.764 Y186.403 E.93094
G1 X205.764 Y186.494 E.00292
G1 X226.236 Y206.965 E.93094
G1 X226.236 Y206.23 E.02361
G1 X214.354 Y218.111 E.5403
G1 X193.883 Y197.639 E.93094
G1 X194.528 Y197.639 E.02075
G1 X174.055 Y218.111 E.93098
G1 X153.584 Y197.639 E.93094
G1 X154.229 Y197.639 E.02075
G1 X133.758 Y218.111 E.93094
G1 X126.916 Y211.271 E.3111
G3 X125.531 Y210.443 I1.428 J-3.962 E.0522
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X126.217 Y210.964 E-.32714
G1 X126.916 Y211.271 E-.2902
G1 X127.182 Y211.536 E-.14266
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
G1 X128.151 Y204.666
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X128.24 Y204.67 E.00285
G3 X129.176 Y204.879 I-.243 J3.282 E.03093
G3 X127.784 Y204.668 I-1.167 J2.996 E.60395
G1 X128.091 Y204.667 E.0099
G1 X128.151 Y205.073 F30000
G1 F8843.478
G1 X128.21 Y205.073 E.00188
G3 X128.761 Y205.17 I-.192 J2.723 E.01803
G3 X127.814 Y205.074 I-.751 J2.706 E.53672
G1 X128.091 Y205.073 E.00892
G1 X128.214 Y205.485 F30000
G1 F8843.478
G1 X128.651 Y205.562 E.01426
G3 X127.844 Y205.48 I-.642 J2.314 E.45899
G3 X128.155 Y205.489 I.057 J3.452 E.00998
G1 X128.056 Y205.871 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.15 Y205.872 E.0028
G3 X128.349 Y205.895 I-.149 J2.17 E.00597
G3 X127.874 Y205.871 I-.339 J1.98 E.3617
G1 X127.996 Y205.871 E.00365
; WIPE_START
M204 S10000
G1 X128.15 Y205.872 E-.05845
G1 X128.349 Y205.895 E-.07614
G1 X128.734 Y206.004 E-.15213
G1 X129.091 Y206.186 E-.15208
G1 X129.404 Y206.436 E-.15216
G1 X129.661 Y206.743 E-.15212
G1 X129.682 Y206.782 E-.01692
; WIPE_END
G1 E-.04 F1800
G1 X137.313 Y206.611 Z2.4 F30000
G1 X217.034 Y204.832 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X217.176 Y204.879 E.00481
G3 X215.784 Y204.668 I-1.167 J2.996 E.60394
G3 X216.871 Y204.779 I.214 J3.283 E.03531
G1 X216.977 Y204.813 E.00357
G1 X216.588 Y205.13 F30000
G1 F8843.478
G1 X216.761 Y205.17 E.00572
G3 X215.814 Y205.074 I-.751 J2.706 E.53672
G3 X216.488 Y205.107 I.204 J2.722 E.02175
G1 X216.529 Y205.117 E.00136
G1 X216.147 Y205.479 F30000
G1 F8843.478
G1 X216.179 Y205.491 E.00107
G3 X216.651 Y205.562 I-.277 J3.441 E.01537
G3 X215.844 Y205.48 I-.642 J2.314 E.45899
G1 X216.087 Y205.479 E.00781
G1 X215.871 Y205.871 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X215.874 Y205.871 E.00008
G3 X216.349 Y205.895 I.128 J2.171 E.0142
G3 X215.554 Y205.919 I-.339 J1.98 E.35204
G1 X215.812 Y205.88 E.00778
; WIPE_START
M204 S10000
G1 X215.874 Y205.871 E-.02381
G1 X216.15 Y205.87 E-.10504
G1 X216.349 Y205.895 E-.07617
G1 X216.734 Y206.004 E-.15214
G1 X217.091 Y206.186 E-.15207
G1 X217.404 Y206.436 E-.15213
G1 X217.57 Y206.635 E-.09864
; WIPE_END
G1 E-.04 F1800
G1 X217.402 Y199.004 Z2.4 F30000
G1 X215.864 Y129.213 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X215.6 Y129.189 E.00851
G3 X215.783 Y122.793 I.409 J-3.189 E.30436
G3 X217.176 Y123.004 I.214 J3.284 E.04563
G3 X215.924 Y129.214 I-1.167 J2.996 E.28914
G1 X215.893 Y128.807 F30000
G1 F8843.478
G1 X215.651 Y128.787 E.00781
G3 X215.814 Y123.199 I.359 J-2.786 E.26584
G3 X216.761 Y123.295 I.204 J2.723 E.03077
G3 X215.953 Y128.809 I-.751 J2.706 E.26113
G1 X215.94 Y128.39 F30000
G1 F8843.478
G1 X215.701 Y128.382 E.00769
G3 X215.844 Y123.605 I.307 J-2.382 E.22741
G3 X216.651 Y123.687 I.057 J3.454 E.02612
G3 X216.18 Y128.396 I-.642 J2.314 E.21618
G1 X216 Y128.392 E.00576
G1 X215.987 Y128.009 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X215.95 Y128.008 E.00109
G3 X215.874 Y123.996 I.06 J-2.008 E.18211
G3 X216.349 Y124.02 I.128 J2.17 E.0142
G3 X216.15 Y128.004 I-.339 J1.98 E.17362
G1 X216.047 Y128.007 E.00308
; WIPE_START
M204 S10000
G1 X215.95 Y128.008 E-.03673
G1 X215.75 Y127.995 E-.07611
G1 X215.36 Y127.906 E-.15215
G1 X214.995 Y127.741 E-.15212
G1 X214.67 Y127.507 E-.15212
G1 X214.398 Y127.214 E-.15212
G1 X214.345 Y127.127 E-.03865
; WIPE_END
G1 E-.04 F1800
G1 X214.365 Y119.495 Z2.4 F30000
G1 X214.571 Y41.246 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X214.679 Y41.198 E.00378
G3 X215.783 Y40.918 I1.33 J2.927 E.03683
G3 X217.176 Y41.129 I.214 J3.284 E.04563
G3 X214.395 Y41.345 I-1.167 J2.996 E.55683
G1 X214.519 Y41.275 E.00458
G1 X215.058 Y41.48 F30000
G1 F8843.478
G1 X215.107 Y41.467 E.00164
G3 X215.814 Y41.324 I.903 J2.659 E.02326
G3 X216.761 Y41.42 I.204 J2.723 E.03077
G3 X214.847 Y41.57 I-.751 J2.706 E.50446
G1 X215.002 Y41.503 E.00544
G1 X215.55 Y41.771 F30000
G1 F8843.478
G1 X215.844 Y41.73 E.00956
G3 X216.651 Y41.812 I.057 J3.454 E.02612
G3 X215.466 Y41.787 I-.642 J2.314 E.44669
G1 X215.491 Y41.782 E.0008
G1 X215.877 Y42.121 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X216.15 Y42.122 E.00813
G3 X216.349 Y42.145 I-.149 J2.169 E.00597
G3 X215.817 Y42.126 I-.339 J1.98 E.36001
; WIPE_START
M204 S10000
G1 X216.15 Y42.122 E-.12645
G1 X216.349 Y42.145 E-.07614
G1 X216.544 Y42.19 E-.07613
G1 X216.917 Y42.336 E-.15213
G1 X217.253 Y42.553 E-.15213
G1 X217.54 Y42.833 E-.15213
G1 X217.577 Y42.887 E-.02488
; WIPE_END
G1 E-.04 F1800
G1 X209.946 Y42.749 Z2.4 F30000
G1 X126.572 Y41.246 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X126.679 Y41.198 E.00378
G3 X127.783 Y40.918 I1.33 J2.927 E.03683
G3 X129.176 Y41.129 I.214 J3.284 E.04563
G3 X126.395 Y41.345 I-1.167 J2.996 E.55682
G1 X126.519 Y41.275 E.00459
G1 X127.058 Y41.48 F30000
G1 F8843.478
G1 X127.107 Y41.467 E.00163
G3 X127.814 Y41.324 I.903 J2.659 E.02326
G3 X128.761 Y41.42 I.204 J2.722 E.03077
G3 X126.847 Y41.569 I-.751 J2.706 E.50446
G1 X127.002 Y41.503 E.00544
G1 X127.55 Y41.771 F30000
G1 F8843.478
G1 X127.844 Y41.73 E.00956
G3 X128.651 Y41.812 I.057 J3.454 E.02612
G3 X127.466 Y41.786 I-.642 J2.314 E.44669
G1 X127.491 Y41.782 E.00081
G1 X127.877 Y42.121 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.15 Y42.122 E.00813
G3 X128.349 Y42.145 I-.149 J2.169 E.00597
G3 X127.817 Y42.126 I-.339 J1.98 E.36001
; WIPE_START
M204 S10000
G1 X128.15 Y42.122 E-.12639
G1 X128.349 Y42.145 E-.07615
G1 X128.544 Y42.19 E-.07614
G1 X128.917 Y42.336 E-.15213
G1 X129.253 Y42.553 E-.1521
G1 X129.54 Y42.833 E-.15216
G1 X129.577 Y42.887 E-.02494
; WIPE_END
G1 E-.04 F1800
G1 X121.946 Y42.749 Z2.4 F30000
G1 X38.572 Y41.245 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X38.679 Y41.198 E.00375
G3 X39.783 Y40.918 I1.33 J2.927 E.03683
G3 X41.176 Y41.129 I.214 J3.284 E.04563
G3 X38.395 Y41.345 I-1.167 J2.996 E.55682
G1 X38.52 Y41.275 E.00462
G1 X39.059 Y41.479 F30000
G1 F8843.478
G1 X39.107 Y41.467 E.0016
G3 X39.814 Y41.324 I.903 J2.659 E.02326
G3 X40.761 Y41.42 I.204 J2.722 E.03077
G3 X38.847 Y41.569 I-.751 J2.706 E.50446
G1 X39.004 Y41.503 E.00548
G1 X39.551 Y41.771 F30000
G1 F8843.478
G1 X39.844 Y41.73 E.00952
G3 X40.651 Y41.812 I.057 J3.454 E.02612
G3 X39.466 Y41.786 I-.642 J2.314 E.44669
G1 X39.492 Y41.782 E.00085
G1 X39.836 Y42.126 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X39.874 Y42.121 E.00115
G3 X40.349 Y42.145 I.128 J2.171 E.01421
G3 X39.554 Y42.169 I-.339 J1.98 E.35204
G1 X39.776 Y42.135 E.00671
; WIPE_START
M204 S10000
G1 X39.874 Y42.121 E-.03744
G1 X40.15 Y42.12 E-.10502
G1 X40.349 Y42.145 E-.07619
G1 X40.544 Y42.19 E-.07614
G1 X40.917 Y42.336 E-.15213
G1 X41.253 Y42.553 E-.1521
G1 X41.54 Y42.833 E-.15216
G1 X41.553 Y42.852 E-.00883
; WIPE_END
G1 E-.04 F1800
G1 X47.107 Y48.087 Z2.4 F30000
G1 X205.416 Y197.291 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X50.584 Y197.291 E4.97885
G1 X50.584 Y54.709 E4.58493
G1 X205.416 Y54.709 E4.97885
G1 X205.416 Y197.231 E4.583
G1 X205.009 Y196.884 F30000
G1 F8843.478
G1 X50.991 Y196.884 E4.95267
G1 X50.991 Y55.116 E4.55875
G1 X205.009 Y55.116 E4.95267
G1 X205.009 Y196.824 E4.55682
G1 X204.602 Y196.477 F30000
G1 F8843.478
G1 X51.398 Y196.477 E4.92649
G1 X51.398 Y55.523 E4.53257
G1 X204.602 Y55.523 E4.92649
G1 X204.602 Y196.417 E4.53064
G1 X204.21 Y196.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X51.79 Y196.085 E4.54007
G1 X51.79 Y55.915 E4.17519
G1 X204.21 Y55.915 E4.54007
G1 X204.21 Y196.025 E4.1734
; WIPE_START
M204 S10000
G1 X202.21 Y196.026 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X195.238 Y192.92 Z2.4 F30000
G1 X38.572 Y123.121 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X38.679 Y123.073 E.00378
G3 X39.783 Y122.793 I1.33 J2.927 E.03682
G3 X41.176 Y123.004 I.214 J3.284 E.04563
G3 X38.395 Y123.22 I-1.167 J2.996 E.55683
G1 X38.519 Y123.15 E.00458
G1 X39.058 Y123.355 F30000
G1 F8843.478
G1 X39.107 Y123.342 E.00163
G3 X39.814 Y123.199 I.903 J2.659 E.02326
G3 X40.761 Y123.295 I.204 J2.723 E.03077
G3 X38.847 Y123.444 I-.751 J2.706 E.50446
G1 X39.002 Y123.378 E.00544
G1 X39.55 Y123.646 F30000
G1 F8843.478
G1 X39.844 Y123.605 E.00956
G3 X40.651 Y123.687 I.057 J3.454 E.02612
G3 X39.466 Y123.661 I-.642 J2.314 E.44669
G1 X39.491 Y123.657 E.00081
G1 X39.877 Y123.996 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X40.15 Y123.997 E.00813
G3 X40.349 Y124.02 I-.149 J2.169 E.00597
G3 X39.817 Y124.001 I-.339 J1.98 E.36001
; WIPE_START
M204 S10000
G1 X40.15 Y123.997 E-.12643
G1 X40.349 Y124.02 E-.07615
G1 X40.734 Y124.129 E-.15213
G1 X41.091 Y124.311 E-.15209
G1 X41.404 Y124.561 E-.15213
G1 X41.575 Y124.765 E-.10107
; WIPE_END
G1 E-.04 F1800
G1 X41.523 Y132.397 Z2.4 F30000
G1 X41.034 Y204.832 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.176 Y204.879 E.00481
G3 X39.784 Y204.668 I-1.167 J2.996 E.60394
G3 X40.871 Y204.779 I.214 J3.284 E.03532
G1 X40.977 Y204.813 E.00357
G1 X40.588 Y205.13 F30000
G1 F8843.478
G1 X40.761 Y205.17 E.00572
G3 X39.814 Y205.074 I-.751 J2.706 E.53672
G3 X40.488 Y205.107 I.204 J2.722 E.02175
G1 X40.529 Y205.117 E.00136
G1 X40.147 Y205.479 F30000
G1 F8843.478
G1 X40.179 Y205.491 E.00107
G3 X40.651 Y205.562 I-.277 J3.441 E.01537
G3 X39.844 Y205.48 I-.642 J2.314 E.45899
G1 X40.087 Y205.479 E.00781
G1 X39.871 Y205.871 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X39.874 Y205.871 E.00009
G3 X40.349 Y205.895 I.128 J2.171 E.0142
G3 X39.554 Y205.919 I-.339 J1.98 E.35204
G1 X39.811 Y205.88 E.00777
; WIPE_START
M204 S10000
G1 X39.874 Y205.871 E-.02394
G1 X40.15 Y205.87 E-.10503
G1 X40.349 Y205.895 E-.07618
G1 X40.734 Y206.004 E-.15213
G1 X41.091 Y206.186 E-.15208
G1 X41.404 Y206.436 E-.15216
G1 X41.57 Y206.634 E-.09847
; WIPE_END
G1 E-.04 F1800
G1 X49.187 Y207.121 Z2.4 F30000
G1 X226.584 Y218.459 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X29.416 Y218.459 E6.34019
G1 X29.416 Y33.541 E5.94628
G1 X226.584 Y33.541 E6.34019
G1 X226.584 Y218.399 E5.94435
G1 X226.991 Y218.866 F30000
G1 F8843.478
G1 X29.009 Y218.866 E6.36637
G1 X29.009 Y33.134 E5.97246
G1 X226.991 Y33.134 E6.36637
G1 X226.991 Y218.806 E5.97053
G1 X227.398 Y219.273 F30000
G1 F8843.478
G1 X28.602 Y219.273 E6.39255
G1 X28.602 Y32.727 E5.99864
G1 X227.398 Y32.727 E6.39255
G1 X227.398 Y219.213 E5.99671
G1 X227.79 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X28.21 Y219.665 E5.94481
G1 X28.21 Y32.335 E5.57992
G1 X227.79 Y32.335 E5.94481
G1 X227.79 Y219.605 E5.57813
; WIPE_START
M204 S10000
G1 X225.79 Y219.606 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X225.858 Y216.473 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X225.858 Y217.733 E.04053
G1 X225.49 Y217.733 E.01183
G1 X218.595 Y210.839 E.31355
G3 X215.018 Y211.691 I-2.597 J-2.967 E.12303
G1 X208.976 Y217.733 E.27478
G1 X208.219 Y217.733 E.02432
G1 X188.503 Y198.017 E.89664
G1 X188.394 Y198.017 E.00351
G1 X168.677 Y217.733 E.89664
G1 X167.921 Y217.733 E.02432
G1 X148.204 Y198.017 E.89664
G1 X148.095 Y198.017 E.00351
G1 X128.378 Y217.733 E.89664
G1 X127.622 Y217.733 E.02432
G1 X107.905 Y198.017 E.89664
G1 X107.796 Y198.017 E.00351
G1 X88.079 Y217.733 E.89664
G1 X87.323 Y217.733 E.02432
G1 X67.606 Y198.017 E.89664
G1 X67.497 Y198.017 E.00351
G1 X47.781 Y217.733 E.89664
G1 X47.024 Y217.733 E.02432
G1 X40.982 Y211.691 E.27476
G3 X37.402 Y210.841 I-.949 J-3.971 E.12278
G1 X30.51 Y217.733 E.31342
G1 X30.142 Y217.733 E.01183
M73 P54 R35
G1 X30.142 Y216.473 E.04053
G1 X36.108 Y208.505 F30000
G1 F8843.478
G3 X36.181 Y206.89 I4.995 J-.584 E.05222
G1 X30.142 Y200.83 E.27512
G1 X49.858 Y181.114 E.89664
G1 X49.858 Y180.269 E.02718
G1 X30.142 Y160.552 E.89664
G1 X49.858 Y140.815 E.8971
G1 X49.858 Y139.97 E.02718
G1 X39.826 Y129.937 E.45623
G3 X38.161 Y129.484 I.189 J-3.979 E.05592
G1 X30.142 Y137.524 E.36516
G1 X49.858 Y157.241 E.89664
G1 X49.858 Y158.086 E.02718
G1 X30.142 Y177.823 E.8971
G1 X49.858 Y197.539 E.89664
G1 X49.858 Y195.911 E.05236
M73 P54 R34
G1 X43.563 Y207.518 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F10588.235
G1 X43.425 Y206.835 E.01873
G1 X43.151 Y206.177 E.01915
G1 X42.752 Y205.586 E.01914
G1 X42.244 Y205.086 E.01914
G1 X41.647 Y204.697 E.01915
G1 X40.985 Y204.433 E.01915
G1 X40.28 Y204.306 E.01923
G2 X39.22 Y204.381 I-.26 J3.874 E.02862
G1 X38.542 Y204.606 E.01919
G1 X37.923 Y204.959 E.01914
G1 X37.387 Y205.429 E.01915
G1 X36.954 Y205.995 E.01914
G1 X36.642 Y206.636 E.01915
G1 X36.463 Y207.326 E.01914
G1 X36.424 Y208.038 E.01915
G1 X36.527 Y208.743 E.01915
G1 X36.768 Y209.414 E.01914
G1 X37.137 Y210.024 E.01914
G1 X37.619 Y210.548 E.01914
G1 X38.196 Y210.967 E.01915
G1 X38.845 Y211.263 E.01914
G1 X39.539 Y211.425 E.01915
G1 X40.252 Y211.446 E.01914
G1 X40.954 Y211.325 E.01915
G1 X41.619 Y211.068 E.01915
G1 X42.22 Y210.683 E.01914
G1 X42.732 Y210.188 E.01915
G1 X43.136 Y209.601 E.01913
G1 X43.416 Y208.945 E.01915
G1 X43.56 Y208.247 E.01914
G1 X43.563 Y207.578 E.01796
G1 X43.563 Y125.643 F30000
G1 F10588.235
G1 X43.425 Y124.96 E.01873
G1 X43.151 Y124.302 E.01915
G1 X42.752 Y123.711 E.01914
G1 X42.244 Y123.211 E.01914
G1 X41.647 Y122.822 E.01915
G1 X40.985 Y122.558 E.01915
G1 X40.28 Y122.431 E.01923
G2 X39.221 Y122.506 I-.26 J3.873 E.02862
G1 X38.542 Y122.731 E.01919
G1 X37.923 Y123.084 E.01914
G1 X37.387 Y123.554 E.01914
G1 X36.954 Y124.12 E.01915
G1 X36.642 Y124.761 E.01915
G1 X36.463 Y125.451 E.01914
G1 X36.424 Y126.163 E.01915
G1 X36.527 Y126.868 E.01915
G1 X36.768 Y127.539 E.01914
G1 X37.137 Y128.149 E.01915
G1 X37.619 Y128.673 E.01914
G1 X38.196 Y129.092 E.01914
G1 X38.845 Y129.388 E.01914
G1 X39.539 Y129.55 E.01914
G1 X40.252 Y129.571 E.01915
G1 X40.954 Y129.45 E.01914
G1 X41.619 Y129.193 E.01915
G1 X42.22 Y128.808 E.01915
G1 X42.732 Y128.313 E.01914
G1 X43.136 Y127.726 E.01914
G1 X43.416 Y127.07 E.01915
G1 X43.56 Y126.372 E.01914
G1 X43.563 Y125.703 E.01796
G1 X49.858 Y56.089 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X49.858 Y54.461 E.05236
G1 X30.142 Y74.177 E.89664
G1 X49.858 Y93.914 E.8971
G1 X49.858 Y94.759 E.02718
G1 X30.142 Y114.476 E.89664
G1 X38.161 Y122.516 E.36516
G3 X39.821 Y122.068 I1.772 J3.266 E.05578
G1 X49.858 Y112.03 E.45646
G1 X49.858 Y111.185 E.02718
G1 X30.142 Y91.448 E.8971
G1 X49.858 Y71.731 E.89664
G1 X49.858 Y70.886 E.02718
G1 X30.142 Y51.169 E.89664
G1 X36.181 Y45.11 E.27512
G3 X36.108 Y43.495 I4.921 J-1.031 E.05222
; WIPE_START
G1 X36.061 Y44.322 E-.31483
G1 X36.181 Y45.11 E-.30297
G1 X35.917 Y45.375 E-.14221
; WIPE_END
G1 E-.04 F1800
G1 X40.704 Y48.005 Z2.4 F30000
G1 Z2
G1 E.8 F1800
G1 F8843.478
G3 X39.087 Y47.961 I-.672 J-4.98 E.05222
G1 X30.142 Y56.926 E.40728
G1 X49.858 Y76.643 E.89664
G1 X49.858 Y77.488 E.02718
G1 X30.142 Y97.225 E.8971
G1 X49.858 Y116.942 E.89664
G1 X49.858 Y117.787 E.02718
G1 X43.486 Y124.159 E.28979
G3 X43.486 Y127.841 I-3.642 J1.841 E.1228
G1 X49.858 Y134.213 E.28979
G1 X49.858 Y135.058 E.02718
G1 X30.142 Y154.775 E.89664
G1 X49.858 Y174.512 E.8971
G1 X49.858 Y175.357 E.02718
G1 X30.142 Y195.074 E.89664
G1 X39.087 Y204.039 E.40728
G3 X40.705 Y203.995 I.919 J4.006 E.05237
; WIPE_START
G1 X39.753 Y203.943 E-.36222
G1 X39.087 Y204.039 E-.25552
G1 X38.823 Y203.774 E-.14226
; WIPE_END
G1 E-.04 F1800
G1 X46.449 Y204.082 Z2.4 F30000
G1 X131.563 Y207.518 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F10588.235
G1 X131.425 Y206.835 E.01872
G1 X131.151 Y206.177 E.01915
G1 X130.752 Y205.586 E.01914
G1 X130.244 Y205.086 E.01914
G1 X129.647 Y204.697 E.01915
G1 X128.985 Y204.433 E.01915
G1 X128.28 Y204.306 E.01923
G2 X127.22 Y204.381 I-.26 J3.874 E.02862
G1 X126.542 Y204.606 E.01919
G1 X125.923 Y204.959 E.01914
G1 X125.387 Y205.429 E.01915
G1 X124.954 Y205.995 E.01914
G1 X124.642 Y206.636 E.01915
G1 X124.463 Y207.326 E.01914
G1 X124.424 Y208.038 E.01915
G1 X124.527 Y208.743 E.01915
G1 X124.768 Y209.414 E.01914
G1 X125.137 Y210.024 E.01915
G1 X125.619 Y210.548 E.01914
G1 X126.196 Y210.967 E.01915
G1 X126.845 Y211.263 E.01914
G1 X127.539 Y211.425 E.01914
G1 X128.252 Y211.446 E.01915
G1 X128.954 Y211.325 E.01914
G1 X129.619 Y211.068 E.01915
G1 X130.22 Y210.683 E.01914
G1 X130.732 Y210.188 E.01915
G1 X131.136 Y209.601 E.01913
G1 X131.416 Y208.945 E.01915
G1 X131.56 Y208.247 E.01915
G1 X131.563 Y207.578 E.01796
; WIPE_START
G1 X131.56 Y208.247 E-.25414
G1 X131.416 Y208.945 E-.27089
G1 X131.173 Y209.514 E-.23497
; WIPE_END
G1 E-.04 F1800
G1 X138.683 Y208.151 Z2.4 F30000
G1 X206.142 Y195.911 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X206.142 Y197.539 E.05236
G1 X225.858 Y177.823 E.89664
G1 X206.142 Y158.086 E.8971
G1 X206.142 Y157.241 E.02718
G1 X225.858 Y137.524 E.89664
G1 X217.841 Y129.486 E.36507
G3 X216.175 Y129.936 I-2.052 J-4.285 E.05578
G1 X206.142 Y139.97 E.45629
G1 X206.142 Y140.815 E.02718
G1 X225.858 Y160.552 E.8971
G1 X206.142 Y180.269 E.89664
G1 X206.142 Y181.114 E.02718
G1 X225.858 Y200.83 E.89664
G1 X219.815 Y206.894 E.27528
G3 X219.889 Y208.508 I-3.822 J.982 E.05232
G1 X219.563 Y207.519 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F10588.235
G1 X219.425 Y206.835 E.01873
G1 X219.151 Y206.177 E.01915
G1 X218.752 Y205.586 E.01915
G1 X218.244 Y205.086 E.01914
G1 X217.647 Y204.697 E.01914
G1 X216.985 Y204.433 E.01915
G1 X216.28 Y204.306 E.01923
G2 X215.22 Y204.381 I-.26 J3.875 E.02862
G1 X214.542 Y204.606 E.01919
G1 X213.923 Y204.959 E.01915
G1 X213.387 Y205.429 E.01914
G1 X212.954 Y205.995 E.01914
G1 X212.642 Y206.636 E.01915
G1 X212.463 Y207.326 E.01915
G1 X212.424 Y208.038 E.01915
G1 X212.527 Y208.743 E.01915
G1 X212.768 Y209.414 E.01915
G1 X213.137 Y210.024 E.01915
G1 X213.619 Y210.548 E.01914
G1 X214.196 Y210.967 E.01915
G1 X214.845 Y211.263 E.01914
G1 X215.539 Y211.425 E.01915
G1 X216.252 Y211.446 E.01914
G1 X216.954 Y211.325 E.01914
G1 X217.619 Y211.068 E.01916
G1 X218.219 Y210.684 E.01914
G1 X218.732 Y210.188 E.01915
G1 X219.136 Y209.601 E.01914
G1 X219.416 Y208.945 E.01915
G1 X219.56 Y208.247 E.01915
G1 X219.563 Y207.579 E.01796
; WIPE_START
G1 X219.56 Y208.247 E-.25409
G1 X219.416 Y208.945 E-.27089
G1 X219.173 Y209.514 E-.23502
; WIPE_END
G1 E-.04 F1800
G1 X215.295 Y204.004 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X216.91 Y204.042 I.712 J4.051 E.0523
G1 X225.858 Y195.074 E.40739
G1 X206.142 Y175.357 E.89664
G1 X206.142 Y174.512 E.02718
G1 X225.858 Y154.775 E.8971
G1 X206.142 Y135.058 E.89664
G1 X206.142 Y134.213 E.02718
G1 X212.516 Y127.839 E.28987
G3 X212.516 Y124.161 I3.487 J-1.839 E.12303
G1 X206.142 Y117.787 E.28987
G1 X206.142 Y116.942 E.02718
G1 X225.858 Y97.225 E.89664
G1 X206.142 Y77.488 E.8971
G1 X206.142 Y76.643 E.02718
G1 X225.858 Y56.926 E.89664
G1 X216.91 Y47.958 E.40739
G3 X215.295 Y48.001 I-.91 J-3.838 E.05232
; WIPE_START
G1 X216.295 Y48.058 E-.38049
G1 X216.91 Y47.958 E-.23691
G1 X217.175 Y48.224 E-.14261
; WIPE_END
G1 E-.04 F1800
G1 X219.563 Y43.769 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F10588.235
G1 X219.425 Y43.085 E.01873
G1 X219.151 Y42.427 E.01915
G1 X218.752 Y41.836 E.01914
G1 X218.244 Y41.336 E.01915
G1 X217.647 Y40.947 E.01915
G1 X216.985 Y40.683 E.01915
G1 X216.28 Y40.556 E.01922
G2 X215.221 Y40.631 I-.26 J3.874 E.02862
G1 X214.542 Y40.856 E.0192
G1 X213.923 Y41.209 E.01915
G1 X213.387 Y41.679 E.01914
G1 X212.954 Y42.245 E.01914
G1 X212.642 Y42.886 E.01914
G1 X212.463 Y43.576 E.01915
G1 X212.424 Y44.288 E.01915
G1 X212.527 Y44.993 E.01914
G1 X212.768 Y45.664 E.01915
G1 X213.137 Y46.274 E.01914
G1 X213.619 Y46.798 E.01914
G1 X214.197 Y47.217 E.01916
G1 X214.845 Y47.513 E.01913
G1 X215.539 Y47.675 E.01915
G1 X216.252 Y47.696 E.01915
G1 X216.954 Y47.575 E.01914
G1 X217.619 Y47.318 E.01914
G1 X218.219 Y46.934 E.01915
G1 X218.732 Y46.438 E.01915
G1 X219.136 Y45.851 E.01914
G1 X219.416 Y45.195 E.01915
G1 X219.56 Y44.497 E.01915
G1 X219.563 Y43.829 E.01796
G1 X219.889 Y43.492 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X219.815 Y45.106 I-3.896 J.632 E.05232
G1 X225.858 Y51.17 E.27527
G1 X206.142 Y70.886 E.89664
G1 X206.142 Y71.731 E.02718
G1 X225.858 Y91.448 E.89664
G1 X206.142 Y111.185 E.8971
G1 X206.142 Y112.03 E.02718
G1 X216.177 Y122.066 E.45638
G3 X217.841 Y122.514 I-.368 J4.678 E.05571
G1 X225.858 Y114.476 E.36507
G1 X206.142 Y94.759 E.89664
G1 X206.142 Y93.914 E.02718
G1 X225.858 Y74.177 E.8971
G1 X206.142 Y54.461 E.89664
G1 X206.142 Y56.089 E.05236
G1 X205.752 Y54.373 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.382949
G1 F10587.357
G1 X205.62 Y54.346 E.00362
G1 X50.38 Y54.346 E4.1697
G1 X50.248 Y54.373 E.00362
G1 X50.221 Y54.505 E.00362
G1 X50.221 Y197.495 E3.84067
G1 X50.248 Y197.627 E.00362
G1 X50.38 Y197.654 E.00362
G1 X205.62 Y197.654 E4.1697
G1 X205.752 Y197.627 E.00362
G1 X205.779 Y197.495 E.00362
G1 X205.779 Y54.505 E3.84067
G1 X205.764 Y54.432 E.00201
; WIPE_START
G1 X205.779 Y54.505 E-.02839
G1 X205.779 Y56.431 E-.73161
; WIPE_END
G1 E-.04 F1800
G1 X210.908 Y50.778 Z2.4 F30000
G1 X226.194 Y33.931 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.382942
G1 F10587.546
G1 X226.062 Y33.904 E.00362
G1 X29.938 Y33.904 E5.26774
G1 X29.806 Y33.931 E.00362
G1 X29.779 Y34.063 E.00362
G1 X29.779 Y217.937 E4.93872
G1 X29.806 Y218.069 E.00362
G1 X29.938 Y218.096 E.00362
G1 X226.062 Y218.096 E5.26774
G1 X226.194 Y218.069 E.00362
G1 X226.221 Y217.937 E.00362
G1 X226.221 Y34.063 E4.93872
G1 X226.206 Y33.99 E.00201
G1 X219.563 Y125.644 F30000
; LINE_WIDTH: 0.38292
G1 F10588.235
G1 X219.425 Y124.96 E.01873
G1 X219.151 Y124.302 E.01915
G1 X218.752 Y123.711 E.01914
G1 X218.244 Y123.211 E.01915
G1 X217.647 Y122.822 E.01914
G1 X216.985 Y122.558 E.01915
G1 X216.28 Y122.431 E.01922
G2 X215.221 Y122.506 I-.26 J3.873 E.02862
G1 X214.542 Y122.731 E.01919
G1 X213.923 Y123.084 E.01914
G1 X213.387 Y123.554 E.01915
G1 X212.954 Y124.12 E.01914
G1 X212.642 Y124.761 E.01915
G1 X212.463 Y125.451 E.01915
G1 X212.424 Y126.163 E.01915
G1 X212.527 Y126.868 E.01914
G1 X212.768 Y127.539 E.01914
G1 X213.137 Y128.149 E.01915
G1 X213.619 Y128.673 E.01914
G1 X214.197 Y129.092 E.01915
G1 X214.845 Y129.388 E.01914
G1 X215.539 Y129.55 E.01914
G1 X216.252 Y129.571 E.01915
G1 X216.954 Y129.45 E.01914
G1 X217.619 Y129.193 E.01914
G1 X218.219 Y128.809 E.01915
G1 X218.732 Y128.313 E.01915
G1 X219.136 Y127.726 E.01914
G1 X219.416 Y127.07 E.01915
G1 X219.56 Y126.372 E.01914
G1 X219.563 Y125.704 E.01796
; WIPE_START
G1 X219.56 Y126.372 E-.25409
G1 X219.416 Y127.07 E-.27086
G1 X219.173 Y127.639 E-.23505
; WIPE_END
G1 E-.04 F1800
G1 X213.66 Y122.361 Z2.4 F30000
G1 X131.563 Y43.768 Z2.4
G1 Z2
G1 E.8 F1800
G1 F10588.235
G1 X131.425 Y43.085 E.01873
G1 X131.151 Y42.427 E.01915
G1 X130.752 Y41.836 E.01913
G1 X130.244 Y41.336 E.01916
G1 X129.647 Y40.947 E.01914
G1 X128.985 Y40.683 E.01915
G1 X128.28 Y40.556 E.01923
G2 X127.221 Y40.631 I-.26 J3.874 E.02862
G1 X126.542 Y40.856 E.01919
G1 X125.923 Y41.209 E.01914
G1 X125.387 Y41.679 E.01914
G1 X124.954 Y42.245 E.01915
G1 X124.642 Y42.886 E.01915
G1 X124.463 Y43.576 E.01915
G1 X124.424 Y44.288 E.01915
G1 X124.527 Y44.993 E.01914
G1 X124.768 Y45.664 E.01915
G1 X125.137 Y46.274 E.01914
G1 X125.619 Y46.798 E.01914
G1 X126.197 Y47.217 E.01915
G1 X126.845 Y47.513 E.01914
G1 X127.539 Y47.675 E.01914
G1 X128.252 Y47.696 E.01915
G1 X128.954 Y47.575 E.01914
G1 X129.619 Y47.318 E.01915
G1 X130.22 Y46.933 E.01915
G1 X130.732 Y46.438 E.01914
G1 X131.136 Y45.851 E.01914
G1 X131.416 Y45.195 E.01915
G1 X131.56 Y44.497 E.01915
G1 X131.563 Y43.828 E.01796
G1 X130.098 Y40.788 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G2 X128.582 Y40.228 I-2.126 J3.423 E.05233
G1 X122.621 Y34.267 E.27109
G1 X121.865 Y34.267 E.02432
G1 X102.148 Y53.983 E.89664
G1 X102.039 Y53.983 E.00351
G1 X82.322 Y34.267 E.89664
G1 X81.566 Y34.267 E.02432
G1 X61.849 Y53.983 E.89664
G1 X61.74 Y53.983 E.00351
G1 X42.024 Y34.267 E.89664
G1 X41.267 Y34.267 E.02432
G1 X30.142 Y45.392 E.50596
G1 X49.858 Y65.129 E.8971
G1 X49.858 Y65.974 E.02718
G1 X30.142 Y85.691 E.89664
G1 X49.858 Y105.428 E.8971
G1 X49.858 Y106.273 E.02718
G1 X30.142 Y125.99 E.89664
G1 X49.858 Y145.727 E.8971
G1 X49.858 Y146.572 E.02718
G1 X30.142 Y166.289 E.89664
G1 X49.858 Y186.026 E.8971
G1 X49.858 Y186.871 E.02718
G1 X30.142 Y206.608 E.8971
G1 X41.267 Y217.733 E.50596
G1 X42.024 Y217.733 E.02432
G1 X61.74 Y198.017 E.89664
G1 X61.849 Y198.017 E.00351
G1 X81.566 Y217.733 E.89664
G1 X82.322 Y217.733 E.02432
G1 X102.039 Y198.017 E.89664
G1 X102.148 Y198.017 E.00351
G1 X121.865 Y217.733 E.89664
G1 X122.621 Y217.733 E.02432
G1 X128.582 Y211.772 E.27109
G3 X127.418 Y211.773 I-.584 J-6.312 E.03749
G1 X133.379 Y217.733 E.27107
G1 X134.135 Y217.733 E.02432
G1 X153.852 Y198.017 E.89664
G1 X153.961 Y198.017 E.00351
G1 X173.678 Y217.733 E.89664
G1 X174.434 Y217.733 E.02432
G1 X194.151 Y198.017 E.89664
G1 X194.26 Y198.017 E.00351
G1 X213.976 Y217.733 E.89664
G1 X214.733 Y217.733 E.02432
G1 X225.858 Y206.608 E.50596
G1 X206.142 Y186.871 E.8971
G1 X206.142 Y186.026 E.02718
G1 X225.858 Y166.309 E.89664
G1 X206.142 Y146.572 E.8971
G1 X206.142 Y145.727 E.02718
G1 X225.858 Y126.01 E.89664
G1 X206.142 Y106.273 E.8971
G1 X206.142 Y105.428 E.02718
G1 X225.858 Y85.711 E.89664
G1 X206.142 Y65.974 E.8971
G1 X206.142 Y65.129 E.02718
G1 X225.858 Y45.392 E.8971
G1 X214.733 Y34.267 E.50596
G1 X213.976 Y34.267 E.02432
G1 X194.26 Y53.983 E.89664
G1 X194.151 Y53.983 E.00351
G1 X174.434 Y34.267 E.89664
G1 X173.678 Y34.267 E.02432
G1 X153.961 Y53.983 E.89664
G1 X153.852 Y53.983 E.00351
G1 X134.135 Y34.267 E.89664
G1 X133.379 Y34.267 E.02432
G1 X127.407 Y40.238 E.27156
G2 X125.893 Y40.796 I.773 J4.432 E.05218
; WIPE_START
G1 X126.744 Y40.386 E-.35891
G1 X127.407 Y40.238 E-.25837
G1 X127.673 Y39.973 E-.14272
; WIPE_END
G1 E-.04 F1800
G1 X124.757 Y46.361 Z2.4 F30000
G1 Z2
G1 E.8 F1800
G1 F8843.478
G2 X125.927 Y47.476 I3.256 J-2.248 E.05232
G1 X119.419 Y53.983 E.29595
G1 X119.31 Y53.983 E.00351
G1 X99.593 Y34.267 E.89664
G1 X98.837 Y34.267 E.02432
G1 X79.12 Y53.983 E.89664
G1 X79.011 Y53.983 E.00351
G1 X59.295 Y34.267 E.89664
G1 X58.538 Y34.267 E.02432
G1 X30.142 Y62.663 E1.29137
G1 X49.858 Y82.4 E.8971
G1 X49.858 Y83.245 E.02718
G1 X30.142 Y102.962 E.89664
G1 X49.858 Y122.699 E.8971
G1 X49.858 Y123.544 E.02718
G1 X30.142 Y143.261 E.89664
G1 X49.858 Y162.998 E.8971
G1 X49.858 Y163.843 E.02718
G1 X30.142 Y183.58 E.8971
M73 P55 R34
G1 X64.295 Y217.733 E1.55317
G1 X65.051 Y217.733 E.02432
G1 X84.768 Y198.017 E.89664
G1 X84.877 Y198.017 E.00351
G1 X104.594 Y217.733 E.89664
G1 X105.35 Y217.733 E.02432
G1 X125.067 Y198.017 E.89664
G1 X125.176 Y198.017 E.00351
G1 X144.893 Y217.733 E.89664
G1 X145.649 Y217.733 E.02432
G1 X165.366 Y198.017 E.89664
G1 X165.475 Y198.017 E.00351
G1 X185.192 Y217.733 E.89664
G1 X185.948 Y217.733 E.02432
G1 X205.664 Y198.017 E.89664
G1 X205.774 Y198.017 E.00351
G1 X213.036 Y205.279 E.33026
G2 X212.165 Y208.787 I3.111 J2.634 E.12041
G1 X203.219 Y217.733 E.40685
G1 X202.462 Y217.733 E.02432
G1 X182.746 Y198.017 E.89664
G1 X182.637 Y198.017 E.00351
G1 X162.92 Y217.733 E.89664
G1 X162.164 Y217.733 E.02432
G1 X142.447 Y198.017 E.89664
G1 X142.338 Y198.017 E.00351
G1 X131.896 Y208.459 E.47486
G3 X131.35 Y209.948 I-3.898 J-.584 E.05135
G1 X139.136 Y217.733 E.35406
G1 X139.892 Y217.733 E.02432
G1 X159.609 Y198.017 E.89664
G1 X159.718 Y198.017 E.00351
G1 X179.435 Y217.733 E.89664
G1 X180.191 Y217.733 E.02432
G1 X199.908 Y198.017 E.89664
G1 X200.017 Y198.017 E.00351
G1 X219.733 Y217.733 E.89664
G1 X220.49 Y217.733 E.02432
G1 X225.858 Y212.344 E.24461
G1 X219.403 Y205.889 E.29355
G2 X217.988 Y204.474 I-3.771 J2.355 E.06493
G1 X206.142 Y192.628 E.53871
G1 X206.142 Y191.783 E.02718
G1 X225.858 Y172.046 E.89709
G1 X206.142 Y152.329 E.89664
G1 X206.142 Y151.484 E.02718
G1 X225.858 Y131.767 E.89664
G1 X219.936 Y125.824 E.26981
G1 X219.936 Y126.176 E.01132
G1 X225.858 Y120.233 E.26981
G1 X206.142 Y100.516 E.89664
G1 X206.142 Y99.671 E.02718
G1 X225.858 Y79.934 E.8971
G1 X206.142 Y60.217 E.89664
G1 X206.142 Y59.372 E.02718
G1 X217.988 Y47.526 E.53872
G2 X219.403 Y46.111 I-2.356 J-3.771 E.06493
G1 X225.858 Y39.656 E.29355
G1 X220.49 Y34.267 E.24461
G1 X219.733 Y34.267 E.02432
G1 X200.017 Y53.983 E.89664
G1 X199.908 Y53.983 E.00351
G1 X180.191 Y34.267 E.89664
G1 X179.435 Y34.267 E.02432
G1 X159.718 Y53.983 E.89664
G1 X159.609 Y53.983 E.00351
G1 X139.892 Y34.267 E.89664
G1 X139.136 Y34.267 E.02432
G1 X131.35 Y42.052 E.35406
G3 X131.896 Y43.541 I-3.352 J2.073 E.05135
G1 X142.338 Y53.983 E.47486
G1 X142.447 Y53.983 E.00351
G1 X162.164 Y34.267 E.89664
G1 X162.92 Y34.267 E.02432
G1 X182.637 Y53.983 E.89664
G1 X182.746 Y53.983 E.00351
G1 X202.463 Y34.267 E.89664
G1 X203.219 Y34.267 E.02432
G1 X212.165 Y43.213 E.40685
G2 X213.036 Y46.721 I3.981 J.874 E.12041
G1 X205.774 Y53.983 E.33026
G1 X205.664 Y53.983 E.00351
G1 X185.948 Y34.267 E.89664
G1 X185.192 Y34.267 E.02432
G1 X165.475 Y53.983 E.89664
G1 X165.366 Y53.983 E.00351
G1 X145.649 Y34.267 E.89664
G1 X144.893 Y34.267 E.02432
G1 X125.176 Y53.983 E.89664
G1 X125.067 Y53.983 E.00351
G1 X105.35 Y34.267 E.89664
G1 X104.594 Y34.267 E.02432
G1 X84.877 Y53.983 E.89664
G1 X84.768 Y53.983 E.00351
G1 X65.051 Y34.267 E.89664
G1 X64.295 Y34.267 E.02432
G1 X30.142 Y68.42 E1.55317
G1 X49.858 Y88.157 E.8971
G1 X49.858 Y89.002 E.02718
G1 X30.142 Y108.719 E.89664
G1 X49.858 Y128.456 E.8971
G1 X49.858 Y129.301 E.02718
G1 X30.142 Y149.018 E.89664
G1 X49.858 Y168.755 E.8971
G1 X49.858 Y169.6 E.02718
G1 X30.142 Y189.337 E.8971
G1 X58.538 Y217.733 E1.29137
G1 X59.294 Y217.733 E.02432
G1 X79.011 Y198.017 E.89664
G1 X79.12 Y198.017 E.00351
G1 X98.837 Y217.733 E.89664
G1 X99.593 Y217.733 E.02432
G1 X119.31 Y198.017 E.89664
G1 X119.419 Y198.017 E.00351
G1 X125.927 Y204.524 E.29595
G3 X130.074 Y204.524 I2.074 J3.358 E.14041
G1 X136.581 Y198.017 E.29591
G1 X136.69 Y198.017 E.00351
G1 X156.407 Y217.733 E.89664
G1 X157.163 Y217.733 E.02432
G1 X176.88 Y198.017 E.89664
G1 X176.989 Y198.017 E.00351
G1 X196.706 Y217.733 E.89664
G1 X197.462 Y217.733 E.02432
G1 X225.858 Y189.337 E1.29137
G1 X206.142 Y169.6 E.8971
G1 X206.142 Y168.755 E.02718
G1 X225.858 Y149.038 E.89664
G1 X206.142 Y129.301 E.8971
G1 X206.142 Y128.456 E.02718
G1 X225.858 Y108.739 E.89664
G1 X206.142 Y89.002 E.8971
G1 X206.142 Y88.157 E.02718
G1 X225.858 Y68.42 E.8971
G1 X191.705 Y34.267 E1.55317
G1 X190.949 Y34.267 E.02432
G1 X171.232 Y53.983 E.89664
G1 X171.123 Y53.983 E.00351
G1 X151.406 Y34.267 E.89664
G1 X150.65 Y34.267 E.02432
G1 X130.933 Y53.983 E.89664
G1 X130.824 Y53.983 E.00351
G1 X111.107 Y34.267 E.89664
G1 X110.351 Y34.267 E.02432
G1 X90.634 Y53.983 E.89664
G1 X90.525 Y53.983 E.00351
G1 X70.808 Y34.267 E.89664
G1 X70.052 Y34.267 E.02432
G1 X50.336 Y53.983 E.89664
G1 X50.226 Y53.983 E.00351
G1 X42.965 Y46.722 E.33023
G2 X43.833 Y43.215 I-2.974 J-2.598 E.12067
G1 X52.781 Y34.267 E.40692
G1 X53.538 Y34.267 E.02432
G1 X73.254 Y53.983 E.89664
G1 X73.363 Y53.983 E.00351
G1 X93.08 Y34.267 E.89664
G1 X93.836 Y34.267 E.02432
G1 X113.553 Y53.983 E.89664
G1 X113.662 Y53.983 E.00351
G1 X124.099 Y43.547 E.47462
G3 X124.647 Y42.05 I5.014 J.987 E.05148
G1 X116.864 Y34.267 E.35394
G1 X116.108 Y34.267 E.02432
G1 X96.391 Y53.983 E.89664
G1 X96.282 Y53.983 E.00351
G1 X76.565 Y34.267 E.89664
G1 X75.809 Y34.267 E.02432
G1 X56.092 Y53.983 E.89664
G1 X55.983 Y53.983 E.00351
G1 X36.267 Y34.267 E.89664
G1 X35.51 Y34.267 E.02432
G1 X30.142 Y39.656 E.24461
G1 X36.594 Y46.108 E.29345
G2 X38.025 Y47.539 I3.851 J-2.42 E.06562
G1 X49.858 Y59.372 E.53812
G1 X49.858 Y60.217 E.02718
G1 X30.142 Y79.954 E.89709
G1 X49.858 Y99.671 E.89664
G1 X49.858 Y100.516 E.02718
G1 X30.142 Y120.233 E.89664
G1 X36.061 Y126.172 E.26963
G1 X36.061 Y125.828 E.01107
G1 X30.142 Y131.767 E.26963
G1 X49.858 Y151.484 E.89664
G1 X49.858 Y152.329 E.02718
G1 X30.142 Y172.066 E.8971
G1 X49.858 Y191.783 E.89664
G1 X49.858 Y192.628 E.02718
G1 X38.025 Y204.461 E.53812
G2 X36.595 Y205.892 I2.42 J3.851 E.06561
G1 X30.142 Y212.344 E.29345
G1 X35.51 Y217.733 E.24461
G1 X36.267 Y217.733 E.02432
G1 X55.983 Y198.017 E.89664
G1 X56.092 Y198.017 E.00351
G1 X75.809 Y217.733 E.89664
G1 X76.565 Y217.733 E.02432
G1 X96.282 Y198.017 E.89664
G1 X96.391 Y198.017 E.00351
G1 X116.108 Y217.733 E.89664
G1 X116.864 Y217.733 E.02432
G1 X124.647 Y209.95 E.35394
G3 X124.099 Y208.453 I4.461 J-2.483 E.05148
G1 X113.662 Y198.017 E.47462
G1 X113.553 Y198.017 E.00351
G1 X93.836 Y217.733 E.89664
G1 X93.08 Y217.733 E.02432
G1 X73.363 Y198.017 E.89664
G1 X73.254 Y198.017 E.00351
G1 X53.537 Y217.733 E.89664
G1 X52.781 Y217.733 E.02432
G1 X43.833 Y208.785 E.40692
G2 X42.965 Y205.278 I-3.843 J-.909 E.12067
G1 X50.226 Y198.017 E.33023
G1 X50.336 Y198.017 E.00351
G1 X70.052 Y217.733 E.89664
G1 X70.808 Y217.733 E.02432
G1 X90.525 Y198.017 E.89664
G1 X90.634 Y198.017 E.00351
G1 X110.351 Y217.733 E.89664
G1 X111.107 Y217.733 E.02432
G1 X130.824 Y198.017 E.89664
G1 X130.933 Y198.017 E.00351
G1 X150.65 Y217.733 E.89664
G1 X151.406 Y217.733 E.02432
G1 X171.123 Y198.017 E.89664
G1 X171.232 Y198.017 E.00351
G1 X190.949 Y217.733 E.89664
G1 X191.705 Y217.733 E.02432
G1 X225.858 Y183.58 E1.55317
G1 X206.142 Y163.843 E.8971
G1 X206.142 Y162.998 E.02718
G1 X225.858 Y143.281 E.89664
G1 X206.142 Y123.544 E.8971
G1 X206.142 Y122.699 E.02718
G1 X225.858 Y102.982 E.89664
G1 X206.142 Y83.245 E.8971
G1 X206.142 Y82.4 E.02718
G1 X225.858 Y62.663 E.8971
G1 X197.462 Y34.267 E1.29137
G1 X196.706 Y34.267 E.02432
G1 X176.989 Y53.983 E.89664
G1 X176.88 Y53.983 E.00351
G1 X157.163 Y34.267 E.89664
G1 X156.407 Y34.267 E.02432
G1 X136.69 Y53.983 E.89664
G1 X136.581 Y53.983 E.00351
G1 X130.074 Y47.476 E.29591
G2 X131.246 Y46.363 I-2.163 J-3.452 E.05233
; WIPE_START
G1 X130.754 Y46.949 E-.29066
G1 X130.074 Y47.476 E-.32707
G1 X130.339 Y47.741 E-.14227
; WIPE_END
G1 E-.04 F1800
G1 X122.714 Y47.392 Z2.4 F30000
G1 X43.563 Y43.768 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F10588.235
G1 X43.425 Y43.085 E.01872
G1 X43.151 Y42.427 E.01915
G1 X42.752 Y41.836 E.01913
G1 X42.244 Y41.336 E.01916
G1 X41.647 Y40.947 E.01914
G1 X40.985 Y40.683 E.01915
G1 X40.28 Y40.556 E.01923
G2 X39.221 Y40.631 I-.26 J3.874 E.02862
G1 X38.542 Y40.856 E.01919
G1 X37.923 Y41.209 E.01914
G1 X37.387 Y41.679 E.01915
G1 X36.954 Y42.245 E.01915
G1 X36.642 Y42.886 E.01914
G1 X36.463 Y43.576 E.01915
G1 X36.424 Y44.288 E.01915
G1 X36.527 Y44.993 E.01914
G1 X36.768 Y45.664 E.01914
G1 X37.137 Y46.274 E.01915
G1 X37.619 Y46.798 E.01914
G1 X38.197 Y47.217 E.01915
G1 X38.845 Y47.513 E.01914
G1 X39.539 Y47.675 E.01914
G1 X40.252 Y47.696 E.01915
G1 X40.954 Y47.575 E.01914
G1 X41.619 Y47.318 E.01915
G1 X42.22 Y46.933 E.01915
G1 X42.732 Y46.438 E.01914
M73 P55 R33
G1 X43.136 Y45.851 E.01914
G1 X43.416 Y45.195 E.01915
G1 X43.56 Y44.497 E.01915
G1 X43.563 Y43.828 E.01796
; WIPE_START
G1 X43.56 Y44.497 E-.25412
G1 X43.416 Y45.195 E-.27088
G1 X43.173 Y45.764 E-.235
; WIPE_END
G1 E-.04 F1800
G1 X37.171 Y41.049 Z2.4 F30000
G1 X30.142 Y35.527 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X30.142 Y34.267 E.04053
G1 X30.51 Y34.267 E.01183
G1 X37.402 Y41.159 E.31342
G3 X40.982 Y40.309 I2.594 J2.958 E.12316
G1 X47.024 Y34.267 E.27476
G1 X47.781 Y34.267 E.02432
G1 X67.497 Y53.983 E.89664
G1 X67.606 Y53.983 E.00351
G1 X87.323 Y34.267 E.89664
G1 X88.079 Y34.267 E.02432
G1 X107.796 Y53.983 E.89664
G1 X107.905 Y53.983 E.00351
G1 X127.622 Y34.267 E.89664
G1 X128.378 Y34.267 E.02432
G1 X148.095 Y53.983 E.89664
G1 X148.204 Y53.983 E.00351
G1 X167.921 Y34.267 E.89664
G1 X168.677 Y34.267 E.02432
G1 X188.394 Y53.983 E.89664
G1 X188.503 Y53.983 E.00351
G1 X208.219 Y34.267 E.89664
G1 X208.976 Y34.267 E.02432
G1 X215.018 Y40.309 E.27478
G3 X218.596 Y41.161 I.948 J3.953 E.12272
G1 X225.49 Y34.267 E.31355
G1 X225.858 Y34.267 E.01183
G1 X225.858 Y35.527 E.04053
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X225.858 Y34.267 E-.47892
G1 X225.49 Y34.267 E-.13984
G1 X225.228 Y34.529 E-.14124
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
G1 X128.154 Y204.666
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X128.24 Y204.67 E.00279
G3 X129.175 Y204.879 I-.244 J3.285 E.03093
G3 X127.795 Y204.667 I-1.167 J2.996 E.60434
G1 X128.094 Y204.666 E.00959
G1 X128.153 Y205.073 F30000
G1 F8843.478
G1 X128.21 Y205.073 E.00183
G3 X128.761 Y205.17 I-.192 J2.722 E.01803
G3 X127.826 Y205.073 I-.752 J2.706 E.53711
G1 X128.093 Y205.073 E.00859
G1 X128.214 Y205.485 F30000
G1 F8843.478
G1 X128.651 Y205.562 E.01426
G3 X127.856 Y205.479 I-.643 J2.314 E.45939
G3 X128.155 Y205.489 I.035 J3.517 E.0096
G1 X128.094 Y205.87 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.15 Y205.872 E.00167
G3 X128.349 Y205.895 I-.151 J2.198 E.00597
G3 X127.886 Y205.87 I-.34 J1.98 E.36206
G1 X128.034 Y205.87 E.00441
; WIPE_START
M204 S10000
G1 X128.15 Y205.872 E-.04414
G1 X128.349 Y205.895 E-.07614
G1 X128.734 Y206.004 E-.15213
G1 X129.091 Y206.186 E-.15208
G1 X129.404 Y206.436 E-.15213
G1 X129.661 Y206.743 E-.15215
G1 X129.7 Y206.815 E-.03123
; WIPE_END
G1 E-.04 F1800
G1 X137.331 Y206.651 Z2.6 F30000
G1 X214.58 Y204.991 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X214.679 Y204.948 E.00349
G3 X215.795 Y204.667 I1.33 J2.927 E.03721
G3 X217.176 Y204.88 I.201 J3.288 E.04525
G3 X214.395 Y205.095 I-1.167 J2.996 E.55682
G1 X214.527 Y205.021 E.00488
G1 X215.066 Y205.226 F30000
G1 F8843.478
G1 X215.107 Y205.216 E.00135
G3 X215.826 Y205.073 I.903 J2.66 E.02365
G3 X216.761 Y205.17 I.192 J2.724 E.03038
G3 X214.847 Y205.319 I-.751 J2.706 E.50447
G1 X215.011 Y205.25 E.00572
G1 X215.559 Y205.52 F30000
G1 F8843.478
G1 X215.856 Y205.479 E.00965
G3 X216.651 Y205.562 I.035 J3.52 E.02574
G3 X215.466 Y205.536 I-.643 J2.314 E.4467
G1 X215.5 Y205.53 E.0011
G1 X215.884 Y205.87 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X215.886 Y205.87 E.00004
G3 X216.349 Y205.895 I.113 J2.201 E.01385
G3 X215.553 Y205.919 I-.34 J1.98 E.35205
G1 X215.825 Y205.879 E.00817
; WIPE_START
M204 S10000
G1 X215.886 Y205.87 E-.02336
G1 X216.15 Y205.87 E-.1005
G1 X216.349 Y205.895 E-.07617
G1 X216.734 Y206.004 E-.15214
G1 X217.091 Y206.186 E-.15207
G1 X217.404 Y206.436 E-.15212
G1 X217.579 Y206.645 E-.10363
; WIPE_END
G1 E-.04 F1800
G1 X217.41 Y199.014 Z2.6 F30000
G1 X215.868 Y129.213 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X215.6 Y129.189 E.00865
G3 X215.796 Y122.792 I.408 J-3.189 E.30477
G3 X217.176 Y123.004 I.201 J3.288 E.04524
G3 X215.928 Y129.214 I-1.167 J2.996 E.28899
G1 X215.896 Y128.807 F30000
G1 F8843.478
G1 X215.651 Y128.787 E.0079
G3 X215.826 Y123.198 I.359 J-2.786 E.26626
G3 X216.761 Y123.295 I.192 J2.724 E.03038
G3 X215.956 Y128.809 I-.751 J2.706 E.26102
G1 X215.94 Y128.39 F30000
G1 F8843.478
G1 X215.701 Y128.383 E.00769
G3 X215.856 Y123.604 I.307 J-2.382 E.22782
G3 X216.651 Y123.687 I.034 J3.522 E.02574
G3 X216.18 Y128.396 I-.643 J2.314 E.21616
G1 X216 Y128.392 E.00576
G1 X216.006 Y128.005 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X215.95 Y128.008 E.00168
G3 X215.886 Y123.995 I.059 J-2.008 E.1825
G3 X216.349 Y124.02 I.113 J2.2 E.01385
G3 X216.349 Y127.98 I-.34 J1.98 E.16762
G1 X216.066 Y128.001 E.00845
; WIPE_START
M204 S10000
G1 X215.95 Y128.008 E-.04419
G1 X215.553 Y127.96 E-.15208
G1 X215.36 Y127.906 E-.07615
G1 X214.995 Y127.741 E-.15209
G1 X214.67 Y127.507 E-.15214
G1 X214.398 Y127.214 E-.15212
G1 X214.355 Y127.144 E-.03124
; WIPE_END
G1 E-.04 F1800
G1 X214.593 Y119.515 Z2.6 F30000
G1 X217.047 Y41.086 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X217.176 Y41.129 E.00435
G3 X215.796 Y40.917 I-1.167 J2.996 E.60433
G3 X216.871 Y41.029 I.201 J3.288 E.03493
G1 X216.99 Y41.068 E.00404
G1 X216.602 Y41.383 F30000
G1 F8843.478
G1 X216.761 Y41.42 E.00525
G3 X215.826 Y41.323 I-.751 J2.706 E.53711
G3 X216.488 Y41.357 I.192 J2.725 E.02137
G1 X216.543 Y41.37 E.00183
G1 X216.225 Y41.737 F30000
G1 F8843.478
G1 X216.651 Y41.812 E.01392
G3 X215.856 Y41.729 I-.643 J2.314 E.45939
G3 X216.165 Y41.74 I.034 J3.522 E.00992
G1 X215.891 Y42.12 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X216.15 Y42.122 E.00772
G3 X216.349 Y42.145 I-.151 J2.198 E.00597
G3 X215.831 Y42.124 I-.34 J1.98 E.36042
; WIPE_START
M204 S10000
G1 X216.15 Y42.122 E-.12125
G1 X216.349 Y42.145 E-.07613
G1 X216.734 Y42.254 E-.15214
G1 X217.091 Y42.436 E-.15207
G1 X217.404 Y42.686 E-.15213
G1 X217.583 Y42.9 E-.10628
; WIPE_END
G1 E-.04 F1800
G1 X209.952 Y42.761 Z2.6 F30000
G1 X126.58 Y41.241 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X126.679 Y41.198 E.00348
G3 X127.796 Y40.917 I1.33 J2.927 E.03721
G3 X129.176 Y41.129 I.201 J3.288 E.04524
G3 X126.395 Y41.345 I-1.167 J2.996 E.55683
G1 X126.528 Y41.271 E.0049
G1 X127.066 Y41.476 F30000
G1 F8843.478
G1 X127.107 Y41.466 E.00134
G3 X127.826 Y41.323 I.903 J2.66 E.02365
G3 X128.761 Y41.42 I.192 J2.724 E.03038
G3 X126.847 Y41.569 I-.751 J2.706 E.50447
G1 X127.011 Y41.5 E.00574
G1 X127.559 Y41.77 F30000
G1 F8843.478
G1 X127.856 Y41.729 E.00964
G3 X128.651 Y41.812 I.034 J3.521 E.02574
G3 X127.466 Y41.786 I-.643 J2.314 E.4467
G1 X127.5 Y41.78 E.00112
G1 X127.891 Y42.12 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.15 Y42.122 E.00772
G3 X128.349 Y42.145 I-.151 J2.198 E.00597
G3 X127.831 Y42.124 I-.34 J1.98 E.36043
; WIPE_START
M204 S10000
G1 X128.15 Y42.122 E-.12114
G1 X128.349 Y42.145 E-.07614
G1 X128.734 Y42.254 E-.15213
G1 X129.091 Y42.436 E-.15212
G1 X129.404 Y42.686 E-.1521
G1 X129.584 Y42.9 E-.10638
; WIPE_END
G1 E-.04 F1800
G1 X121.953 Y42.744 Z2.6 F30000
G1 X41.05 Y41.087 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.176 Y41.129 E.00427
G3 X39.795 Y40.917 I-1.167 J2.996 E.60434
G3 X40.871 Y41.029 I.201 J3.288 E.03493
G1 X40.993 Y41.069 E.00411
G1 X40.601 Y41.383 F30000
G1 F8843.478
G1 X40.761 Y41.42 E.00529
G3 X39.826 Y41.323 I-.751 J2.706 E.53711
G3 X40.488 Y41.357 I.192 J2.724 E.02137
G1 X40.542 Y41.37 E.00179
G1 X40.223 Y41.737 F30000
G1 F8843.478
G1 X40.651 Y41.812 E.01396
G3 X39.856 Y41.729 I-.643 J2.314 E.45939
G3 X40.164 Y41.74 I.034 J3.521 E.00989
G1 X39.841 Y42.126 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X39.886 Y42.12 E.00134
G3 X40.349 Y42.145 I.113 J2.2 E.01385
G3 X39.553 Y42.169 I-.34 J1.98 E.35205
G1 X39.782 Y42.135 E.00688
; WIPE_START
M204 S10000
G1 X39.886 Y42.12 E-.03984
G1 X40.15 Y42.12 E-.1005
G1 X40.349 Y42.145 E-.07618
G1 X40.734 Y42.254 E-.15213
G1 X41.091 Y42.436 E-.15214
G1 X41.404 Y42.686 E-.15207
G1 X41.551 Y42.862 E-.08715
; WIPE_END
G1 E-.04 F1800
G1 X47.106 Y48.096 Z2.6 F30000
G1 X205.416 Y197.291 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X50.584 Y197.291 E4.97885
G1 X50.584 Y54.709 E4.58493
G1 X205.416 Y54.709 E4.97885
G1 X205.416 Y197.231 E4.583
G1 X205.009 Y196.884 F30000
G1 F8843.478
G1 X50.991 Y196.884 E4.95267
G1 X50.991 Y55.116 E4.55875
G1 X205.009 Y55.116 E4.95267
G1 X205.009 Y196.824 E4.55682
G1 X204.602 Y196.477 F30000
G1 F8843.478
G1 X51.398 Y196.477 E4.92649
G1 X51.398 Y55.523 E4.53257
G1 X204.602 Y55.523 E4.92649
G1 X204.602 Y196.417 E4.53064
G1 X204.21 Y196.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X51.79 Y196.085 E4.54007
G1 X51.79 Y55.915 E4.17519
G1 X204.21 Y55.915 E4.54007
G1 X204.21 Y196.025 E4.1734
; WIPE_START
M204 S10000
G1 X202.21 Y196.026 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X195.259 Y192.874 Z2.6 F30000
G1 X41.047 Y122.961 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.176 Y123.004 E.00436
G3 X39.796 Y122.792 I-1.167 J2.996 E.60434
G3 X40.871 Y122.904 I.201 J3.289 E.03493
G1 X40.99 Y122.943 E.00403
G1 X40.602 Y123.258 F30000
G1 F8843.478
G1 X40.761 Y123.295 E.00525
G3 X39.826 Y123.198 I-.752 J2.706 E.53711
G3 X40.488 Y123.232 I.192 J2.724 E.02137
G1 X40.543 Y123.245 E.00183
G1 X40.225 Y123.612 F30000
G1 F8843.478
G1 X40.651 Y123.687 E.01392
G3 X39.856 Y123.604 I-.643 J2.314 E.45939
G3 X40.165 Y123.615 I.034 J3.521 E.00993
G1 X39.891 Y123.995 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X40.15 Y123.997 E.00772
G3 X40.349 Y124.02 I-.151 J2.198 E.00597
G3 X39.831 Y123.999 I-.34 J1.98 E.36042
; WIPE_START
M204 S10000
G1 X40.15 Y123.997 E-.12123
G1 X40.349 Y124.02 E-.07614
G1 X40.734 Y124.129 E-.15213
G1 X41.091 Y124.311 E-.15212
G1 X41.404 Y124.561 E-.15209
G1 X41.583 Y124.775 E-.10629
; WIPE_END
G1 E-.03999 F1800
G1 X41.298 Y132.402 Z2.6 F30000
G1 X38.58 Y204.991 Z2.6
M73 P56 R33
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X38.679 Y204.948 E.00349
G3 X39.795 Y204.667 I1.33 J2.927 E.03721
G3 X41.176 Y204.879 I.201 J3.287 E.04524
G3 X38.395 Y205.095 I-1.167 J2.996 E.55683
G1 X38.527 Y205.021 E.00488
G1 X39.066 Y205.226 F30000
G1 F8843.478
G1 X39.107 Y205.216 E.00136
G3 X39.826 Y205.073 I.903 J2.66 E.02365
G3 X40.761 Y205.17 I.192 J2.722 E.03039
G3 X38.847 Y205.319 I-.752 J2.706 E.50446
G1 X39.011 Y205.25 E.00572
G1 X39.559 Y205.52 F30000
G1 F8843.478
G1 X39.856 Y205.479 E.00965
G3 X40.651 Y205.562 I.035 J3.518 E.02574
G3 X39.466 Y205.536 I-.643 J2.314 E.44669
G1 X39.5 Y205.53 E.0011
G1 X39.884 Y205.87 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X39.886 Y205.87 E.00005
G3 X40.349 Y205.895 I.113 J2.201 E.01385
G3 X39.553 Y205.919 I-.34 J1.98 E.35205
G1 X39.825 Y205.879 E.00816
; WIPE_START
M204 S10000
G1 X39.886 Y205.87 E-.02349
G1 X40.15 Y205.87 E-.10049
G1 X40.349 Y205.895 E-.07618
G1 X40.734 Y206.004 E-.15213
G1 X41.091 Y206.186 E-.15212
G1 X41.404 Y206.436 E-.1521
G1 X41.579 Y206.645 E-.10349
; WIPE_END
G1 E-.04 F1800
G1 X49.196 Y207.131 Z2.6 F30000
G1 X226.584 Y218.459 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X29.416 Y218.459 E6.34019
G1 X29.416 Y33.541 E5.94628
G1 X226.584 Y33.541 E6.34019
G1 X226.584 Y218.399 E5.94435
G1 X226.991 Y218.866 F30000
G1 F8843.478
G1 X29.009 Y218.866 E6.36637
G1 X29.009 Y33.134 E5.97246
G1 X226.991 Y33.134 E6.36637
G1 X226.991 Y218.806 E5.97053
G1 X227.398 Y219.273 F30000
G1 F8843.478
G1 X28.602 Y219.273 E6.39255
G1 X28.602 Y32.727 E5.99864
G1 X227.398 Y32.727 E6.39255
G1 X227.398 Y219.213 E5.99671
G1 X227.79 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X28.21 Y219.665 E5.94481
G1 X28.21 Y32.335 E5.57992
G1 X227.79 Y32.335 E5.94481
G1 X227.79 Y219.605 E5.57813
; WIPE_START
M204 S10000
G1 X225.79 Y219.606 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X225.506 Y218.292 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40036
; LAYER_HEIGHT: 0.4
M106 S229.5
G1 F3000
G1 X226.214 Y217.584 E.04978
G1 X226.214 Y216.947 E.03167
G1 X225.072 Y218.089 E.08033
G1 X224.435 Y218.089 E.03167
G1 X226.214 Y216.31 E.12511
G1 X226.214 Y215.673 E.03167
G1 X223.798 Y218.089 E.1699
G1 X223.161 Y218.089 E.03167
G1 X226.214 Y215.036 E.21468
G1 X226.214 Y214.399 E.03167
G1 X222.524 Y218.089 E.25947
G1 X221.887 Y218.089 E.03167
G1 X226.214 Y213.762 E.30425
G1 X226.214 Y213.125 E.03167
G1 X221.25 Y218.089 E.34904
G1 X220.613 Y218.089 E.03167
G1 X226.214 Y212.488 E.39383
G1 X226.214 Y211.851 E.03167
G1 X219.977 Y218.089 E.43861
G1 X219.34 Y218.089 E.03167
G1 X226.214 Y211.215 E.4834
G1 X226.214 Y210.578 E.03167
G1 X218.703 Y218.089 E.52818
G1 X218.066 Y218.089 E.03167
G1 X226.214 Y209.941 E.57297
G1 X226.214 Y209.304 E.03167
G1 X217.429 Y218.089 E.61775
G1 X216.792 Y218.089 E.03167
G1 X226.214 Y208.667 E.66254
G1 X226.214 Y208.03 E.03167
G1 X216.155 Y218.089 E.70732
G1 X215.518 Y218.089 E.03167
G1 X226.214 Y207.393 E.75211
G1 X226.214 Y206.756 E.03167
G1 X214.881 Y218.089 E.7969
G1 X214.244 Y218.089 E.03167
G1 X226.214 Y206.119 E.84168
G1 X226.214 Y205.482 E.03167
G1 X213.607 Y218.089 E.88647
G1 X212.971 Y218.089 E.03167
G1 X226.214 Y204.846 E.93125
G1 X226.214 Y204.209 E.03167
G1 X212.334 Y218.089 E.97604
G1 X211.697 Y218.089 E.03167
G1 X226.214 Y203.572 E1.02082
G1 X226.214 Y202.935 E.03167
G1 X211.06 Y218.089 E1.06561
G1 X210.423 Y218.089 E.03167
G1 X217.29 Y211.222 E.48286
G3 X216.444 Y211.431 I-1.325 J-3.549 E.04342
G1 X209.786 Y218.089 E.46817
G1 X209.149 Y218.089 E.03167
G1 X215.786 Y211.453 E.46665
G3 X215.224 Y211.377 I.234 J-3.861 E.02819
G1 X208.512 Y218.089 E.47196
G1 X207.875 Y218.089 E.03167
G1 X214.736 Y211.229 E.48241
G3 X214.298 Y211.03 I.775 J-2.287 E.02395
G1 X207.238 Y218.089 E.4964
G1 X206.601 Y218.089 E.03167
G1 X213.904 Y210.787 E.51347
G1 X213.556 Y210.497 E.02249
G1 X205.965 Y218.089 E.53382
G1 X205.328 Y218.089 E.03167
G1 X213.247 Y210.17 E.55688
G3 X212.977 Y209.803 I2.674 J-2.252 E.02266
G1 X204.691 Y218.089 E.58267
G1 X204.054 Y218.089 E.03167
G1 X212.751 Y209.392 E.61153
G3 X212.575 Y208.931 I2.219 J-1.106 E.02459
G1 X203.417 Y218.089 E.64399
G1 X202.78 Y218.089 E.03167
G1 X212.453 Y208.416 E.68019
G3 X212.416 Y207.816 I4.939 J-.605 E.02991
G1 X202.143 Y218.089 E.72238
G1 X201.506 Y218.089 E.03167
G1 X212.792 Y206.803 E.7936
M106 S102
; WIPE_START
G1 X211.378 Y208.217 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X218.883 Y209.606 Z2.6 F30000
G1 X218.903 Y209.609 Z2.6
G1 Z2.2
G1 E.8 F1800
M106 S229.5
G1 F3000
G1 X226.214 Y202.298 E.51411
G1 X226.214 Y201.661 E.03167
G1 X219.557 Y208.318 E.46808
G2 X219.577 Y207.661 I-3.762 J-.443 E.03272
G1 X226.214 Y201.024 E.46667
G1 X226.214 Y200.387 E.03167
G1 X219.501 Y207.1 E.47206
G1 X219.473 Y206.99 E.00569
G2 X219.354 Y206.611 I-1.951 J.405 E.01977
G1 X226.214 Y199.75 E.48241
G1 X226.214 Y199.113 E.03167
G1 X219.155 Y206.168 E.4962
G2 X218.91 Y205.781 I-5.059 J2.944 E.0228
G1 X226.214 Y198.476 E.51363
G1 X226.214 Y197.84 E.03167
G1 X218.622 Y205.432 E.53387
G2 X218.296 Y205.121 I-1.717 J1.477 E.02244
G1 X226.214 Y197.203 E.55681
G1 X226.214 Y196.566 E.03167
G1 X217.929 Y204.851 E.58258
G2 X217.516 Y204.627 I-1.321 J1.95 E.02341
G1 X226.214 Y195.929 E.61165
G1 X226.214 Y195.292 E.03167
G1 X217.057 Y204.449 E.64393
G2 X216.538 Y204.331 I-1.552 J5.584 E.02644
G1 X226.214 Y194.655 E.68037
G1 X226.214 Y194.018 E.03167
G1 X215.935 Y204.297 E.7228
G2 X215.222 Y204.373 I-.03 J3.103 E.03573
G1 X226.214 Y193.381 E.77292
G1 X226.214 Y192.744 E.03167
G1 X200.869 Y218.089 E1.78218
G1 X200.232 Y218.089 E.03167
G1 X226.214 Y192.107 E1.82697
G1 X226.214 Y191.471 E.03167
G1 X199.596 Y218.089 E1.87175
G1 X198.959 Y218.089 E.03167
G1 X226.214 Y190.834 E1.91654
G1 X226.214 Y190.197 E.03167
G1 X198.322 Y218.089 E1.96132
G1 X197.685 Y218.089 E.03167
G1 X226.214 Y189.56 E2.00611
G1 X226.214 Y188.923 E.03167
G1 X197.048 Y218.089 E2.05089
G1 X196.411 Y218.089 E.03167
G1 X226.214 Y188.286 E2.09568
G1 X226.214 Y187.649 E.03167
G1 X195.774 Y218.089 E2.14046
M73 P56 R32
G1 X195.137 Y218.089 E.03167
G1 X226.214 Y187.012 E2.18525
G1 X226.214 Y186.375 E.03167
G1 X194.5 Y218.089 E2.23004
G1 X193.863 Y218.089 E.03167
G1 X226.214 Y185.738 E2.27482
G1 X226.214 Y185.101 E.03167
G1 X193.226 Y218.089 E2.31961
G1 X192.59 Y218.089 E.03167
G1 X226.214 Y184.465 E2.36439
G1 X226.214 Y183.828 E.03167
G1 X191.953 Y218.089 E2.40918
G1 X191.316 Y218.089 E.03167
G1 X226.214 Y183.191 E2.45396
G1 X226.214 Y182.554 E.03167
G1 X190.679 Y218.089 E2.49875
G1 X190.042 Y218.089 E.03167
G1 X226.214 Y181.917 E2.54354
G1 X226.214 Y181.28 E.03167
G1 X189.405 Y218.089 E2.58832
G1 X188.768 Y218.089 E.03167
G1 X226.214 Y180.643 E2.63311
G1 X226.214 Y180.006 E.03167
G1 X188.131 Y218.089 E2.67789
G1 X187.494 Y218.089 E.03167
G1 X226.214 Y179.369 E2.72268
M73 P57 R32
G1 X226.214 Y178.732 E.03167
G1 X186.857 Y218.089 E2.76746
G1 X186.221 Y218.089 E.03167
G1 X226.214 Y178.096 E2.81225
G1 X226.214 Y177.459 E.03167
G1 X185.584 Y218.089 E2.85703
G1 X184.947 Y218.089 E.03167
G1 X205.375 Y197.661 E1.43646
G1 X204.738 Y197.661 E.03167
G1 X184.31 Y218.089 E1.43646
G1 X183.673 Y218.089 E.03167
G1 X204.101 Y197.661 E1.43646
G1 X203.464 Y197.661 E.03167
G1 X183.036 Y218.089 E1.43646
G1 X182.399 Y218.089 E.03167
G1 X202.827 Y197.661 E1.43646
G1 X202.19 Y197.661 E.03167
G1 X181.762 Y218.089 E1.43646
G1 X181.125 Y218.089 E.03167
G1 X201.553 Y197.661 E1.43646
G1 X200.917 Y197.661 E.03167
G1 X180.488 Y218.089 E1.43646
G1 X179.851 Y218.089 E.03167
G1 X200.28 Y197.661 E1.43646
G1 X199.643 Y197.661 E.03167
G1 X179.215 Y218.089 E1.43646
G1 X178.578 Y218.089 E.03167
G1 X199.006 Y197.661 E1.43646
G1 X198.369 Y197.661 E.03167
G1 X177.941 Y218.089 E1.43646
G1 X177.304 Y218.089 E.03167
G1 X197.732 Y197.661 E1.43646
G1 X197.095 Y197.661 E.03167
G1 X176.667 Y218.089 E1.43646
G1 X176.03 Y218.089 E.03167
G1 X196.458 Y197.661 E1.43646
G1 X195.821 Y197.661 E.03167
G1 X175.393 Y218.089 E1.43646
G1 X174.756 Y218.089 E.03167
G1 X195.184 Y197.661 E1.43646
G1 X194.547 Y197.661 E.03167
G1 X174.119 Y218.089 E1.43646
G1 X173.482 Y218.089 E.03167
G1 X193.911 Y197.661 E1.43646
G1 X193.274 Y197.661 E.03167
G1 X172.846 Y218.089 E1.43646
G1 X172.209 Y218.089 E.03167
G1 X192.637 Y197.661 E1.43646
G1 X192 Y197.661 E.03167
G1 X171.572 Y218.089 E1.43646
G1 X170.935 Y218.089 E.03167
G1 X191.363 Y197.661 E1.43646
G1 X190.726 Y197.661 E.03167
G1 X170.298 Y218.089 E1.43646
G1 X169.661 Y218.089 E.03167
G1 X190.089 Y197.661 E1.43646
G1 X189.452 Y197.661 E.03167
G1 X169.024 Y218.089 E1.43646
G1 X168.387 Y218.089 E.03167
G1 X188.815 Y197.661 E1.43646
G1 X188.178 Y197.661 E.03167
G1 X167.75 Y218.089 E1.43646
G1 X167.113 Y218.089 E.03167
G1 X187.542 Y197.661 E1.43646
G1 X186.905 Y197.661 E.03167
G1 X166.476 Y218.089 E1.43646
G1 X165.84 Y218.089 E.03167
G1 X186.268 Y197.661 E1.43646
G1 X185.631 Y197.661 E.03167
G1 X165.203 Y218.089 E1.43646
G1 X164.566 Y218.089 E.03167
G1 X184.994 Y197.661 E1.43646
G1 X184.357 Y197.661 E.03167
G1 X163.929 Y218.089 E1.43646
G1 X163.292 Y218.089 E.03167
G1 X183.72 Y197.661 E1.43646
G1 X183.083 Y197.661 E.03167
G1 X162.655 Y218.089 E1.43646
G1 X162.018 Y218.089 E.03167
G1 X182.446 Y197.661 E1.43646
G1 X181.809 Y197.661 E.03167
G1 X161.381 Y218.089 E1.43646
G1 X160.744 Y218.089 E.03167
G1 X181.172 Y197.661 E1.43646
G1 X180.536 Y197.661 E.03167
G1 X160.107 Y218.089 E1.43646
G1 X159.47 Y218.089 E.03167
G1 X179.899 Y197.661 E1.43646
G1 X179.262 Y197.661 E.03167
G1 X158.834 Y218.089 E1.43646
G1 X158.197 Y218.089 E.03167
G1 X178.625 Y197.661 E1.43646
G1 X177.988 Y197.661 E.03167
G1 X157.56 Y218.089 E1.43646
G1 X156.923 Y218.089 E.03167
G1 X177.351 Y197.661 E1.43646
G1 X176.714 Y197.661 E.03167
G1 X156.286 Y218.089 E1.43646
G1 X155.649 Y218.089 E.03167
G1 X176.077 Y197.661 E1.43646
G1 X175.44 Y197.661 E.03167
G1 X155.012 Y218.089 E1.43646
G1 X154.375 Y218.089 E.03167
G1 X174.803 Y197.661 E1.43646
G1 X174.166 Y197.661 E.03167
G1 X153.738 Y218.089 E1.43646
G1 X153.101 Y218.089 E.03167
G1 X173.53 Y197.661 E1.43646
G1 X172.893 Y197.661 E.03167
G1 X152.465 Y218.089 E1.43646
G1 X151.828 Y218.089 E.03167
G1 X172.256 Y197.661 E1.43646
G1 X171.619 Y197.661 E.03167
G1 X151.191 Y218.089 E1.43646
G1 X150.554 Y218.089 E.03167
G1 X170.982 Y197.661 E1.43646
G1 X170.345 Y197.661 E.03167
G1 X149.917 Y218.089 E1.43646
G1 X149.28 Y218.089 E.03167
G1 X169.708 Y197.661 E1.43646
G1 X169.071 Y197.661 E.03167
G1 X148.643 Y218.089 E1.43646
G1 X148.006 Y218.089 E.03167
G1 X168.434 Y197.661 E1.43646
G1 X167.797 Y197.661 E.03167
G1 X147.369 Y218.089 E1.43646
G1 X146.732 Y218.089 E.03167
G1 X167.161 Y197.661 E1.43646
M73 P58 R32
G1 X166.524 Y197.661 E.03167
G1 X146.095 Y218.089 E1.43646
G1 X145.459 Y218.089 E.03167
G1 X165.887 Y197.661 E1.43646
G1 X165.25 Y197.661 E.03167
G1 X144.822 Y218.089 E1.43646
G1 X144.185 Y218.089 E.03167
G1 X164.613 Y197.661 E1.43646
G1 X163.976 Y197.661 E.03167
G1 X143.548 Y218.089 E1.43646
G1 X142.911 Y218.089 E.03167
G1 X163.339 Y197.661 E1.43646
G1 X162.702 Y197.661 E.03167
G1 X142.274 Y218.089 E1.43646
G1 X141.637 Y218.089 E.03167
G1 X162.065 Y197.661 E1.43646
G1 X161.428 Y197.661 E.03167
G1 X141 Y218.089 E1.43646
G1 X140.363 Y218.089 E.03167
G1 X160.791 Y197.661 E1.43646
G1 X160.155 Y197.661 E.03167
G1 X139.726 Y218.089 E1.43646
G1 X139.09 Y218.089 E.03167
G1 X159.518 Y197.661 E1.43646
G1 X158.881 Y197.661 E.03167
G1 X138.453 Y218.089 E1.43646
G1 X137.816 Y218.089 E.03167
G1 X158.244 Y197.661 E1.43646
G1 X157.607 Y197.661 E.03167
G1 X137.179 Y218.089 E1.43646
G1 X136.542 Y218.089 E.03167
G1 X156.97 Y197.661 E1.43646
G1 X156.333 Y197.661 E.03167
G1 X135.905 Y218.089 E1.43646
G1 X135.268 Y218.089 E.03167
G1 X155.696 Y197.661 E1.43646
G1 X155.059 Y197.661 E.03167
G1 X134.631 Y218.089 E1.43646
M73 P58 R31
G1 X133.994 Y218.089 E.03167
G1 X154.422 Y197.661 E1.43646
G1 X153.786 Y197.661 E.03167
G1 X133.357 Y218.089 E1.43646
G1 X132.72 Y218.089 E.03167
G1 X153.149 Y197.661 E1.43646
G1 X152.512 Y197.661 E.03167
G1 X132.084 Y218.089 E1.43646
G1 X131.447 Y218.089 E.03167
G1 X151.875 Y197.661 E1.43646
G1 X151.238 Y197.661 E.03167
G1 X130.81 Y218.089 E1.43646
G1 X130.173 Y218.089 E.03167
G1 X150.601 Y197.661 E1.43646
G1 X149.964 Y197.661 E.03167
G1 X129.536 Y218.089 E1.43646
G1 X128.899 Y218.089 E.03167
G1 X149.327 Y197.661 E1.43646
G1 X148.69 Y197.661 E.03167
G1 X128.262 Y218.089 E1.43646
G1 X127.625 Y218.089 E.03167
G1 X148.053 Y197.661 E1.43646
G1 X147.416 Y197.661 E.03167
G1 X126.988 Y218.089 E1.43646
G1 X126.351 Y218.089 E.03167
G1 X146.78 Y197.661 E1.43646
G1 X146.143 Y197.661 E.03167
G1 X125.715 Y218.089 E1.43646
G1 X125.078 Y218.089 E.03167
G1 X145.506 Y197.661 E1.43646
G1 X144.869 Y197.661 E.03167
G1 X124.441 Y218.089 E1.43646
G1 X123.804 Y218.089 E.03167
G1 X144.232 Y197.661 E1.43646
G1 X143.595 Y197.661 E.03167
G1 X123.167 Y218.089 E1.43646
G1 X122.53 Y218.089 E.03167
G1 X129.48 Y211.139 E.48874
G3 X128.566 Y211.416 I-1.312 J-2.683 E.04769
G1 X121.893 Y218.089 E.46925
G1 X121.256 Y218.089 E.03167
G1 X127.885 Y211.46 E.46613
G1 X127.858 Y211.458 E.00136
G3 X127.315 Y211.393 I.053 J-2.744 E.02722
G1 X120.619 Y218.089 E.47084
G1 X119.982 Y218.089 E.03167
G1 X126.813 Y211.259 E.48029
G3 X126.369 Y211.066 I.741 J-2.313 E.02411
G1 X119.345 Y218.089 E.49385
G1 X118.709 Y218.089 E.03167
G1 X125.969 Y210.829 E.5105
G3 X125.61 Y210.55 I3.276 J-4.578 E.02257
G1 X118.072 Y218.089 E.53011
G1 X117.435 Y218.089 E.03167
G1 X125.296 Y210.228 E.55279
G3 X125.02 Y209.866 I1.663 J-1.555 E.02263
G1 X116.798 Y218.089 E.57819
G1 X116.161 Y218.089 E.03167
G1 X124.785 Y209.465 E.60643
G3 X124.601 Y209.013 I4.286 J-2.013 E.0243
G1 X115.524 Y218.089 E.63824
G1 X114.887 Y218.089 E.03167
G1 X124.471 Y208.505 E.67393
G3 X124.416 Y207.923 I3.729 J-.645 E.0291
G1 X114.25 Y218.089 E.71485
G1 X113.613 Y218.089 E.03167
G1 X124.744 Y206.958 E.78272
M106 S102
; WIPE_START
G1 X123.33 Y208.372 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.673 Y209.946 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
M106 S229.5
G1 F3000
G1 X142.958 Y197.661 E.86387
G1 X142.321 Y197.661 E.03167
G1 X131.538 Y208.444 E.75822
G2 X131.583 Y207.763 I-3.64 J-.578 E.03398
G1 X141.684 Y197.661 E.71033
G1 X141.047 Y197.661 E.03167
G1 X131.521 Y207.188 E.6699
G2 X131.382 Y206.689 I-4.591 J1.007 E.02573
G1 X140.411 Y197.661 E.63485
G1 X139.774 Y197.661 E.03167
G1 X131.192 Y206.243 E.60346
G2 X130.956 Y205.842 I-4.888 J2.606 E.02314
G1 X139.137 Y197.661 E.57526
G1 X138.5 Y197.661 E.03167
G1 X130.673 Y205.487 E.55034
G1 X130.61 Y205.42 E.0046
G2 X130.352 Y205.171 I-1.369 J1.165 E.01783
G1 X137.863 Y197.661 E.52812
G1 X137.226 Y197.661 E.03167
G1 X129.993 Y204.894 E.50861
G2 X129.589 Y204.661 I-2.946 J4.625 E.02318
G1 X136.589 Y197.661 E.4922
G1 X135.952 Y197.661 E.03167
G1 X129.137 Y204.476 E.47924
G1 X128.987 Y204.426 E.00788
G2 X128.633 Y204.344 I-4.446 J18.305 E.01806
G1 X135.315 Y197.661 E.4699
G1 X134.678 Y197.661 E.03167
G1 X128.042 Y204.297 E.46662
G1 X127.791 Y204.298 E.01249
G2 X127.352 Y204.35 I.157 J3.164 E.022
G1 X134.041 Y197.661 E.47038
G1 X133.405 Y197.661 E.03167
G1 X112.976 Y218.089 E1.43646
G1 X112.34 Y218.089 E.03167
G1 X132.768 Y197.661 E1.43646
G1 X132.131 Y197.661 E.03167
G1 X111.703 Y218.089 E1.43646
G1 X111.066 Y218.089 E.03167
G1 X131.494 Y197.661 E1.43646
G1 X130.857 Y197.661 E.03167
G1 X110.429 Y218.089 E1.43646
G1 X109.792 Y218.089 E.03167
G1 X130.22 Y197.661 E1.43646
G1 X129.583 Y197.661 E.03167
G1 X109.155 Y218.089 E1.43646
G1 X108.518 Y218.089 E.03167
G1 X128.946 Y197.661 E1.43646
G1 X128.309 Y197.661 E.03167
G1 X107.881 Y218.089 E1.43646
G1 X107.244 Y218.089 E.03167
G1 X127.672 Y197.661 E1.43646
G1 X127.035 Y197.661 E.03167
G1 X106.607 Y218.089 E1.43646
G1 X105.97 Y218.089 E.03167
G1 X126.399 Y197.661 E1.43646
G1 X125.762 Y197.661 E.03167
G1 X105.334 Y218.089 E1.43646
G1 X104.697 Y218.089 E.03167
G1 X125.125 Y197.661 E1.43646
G1 X124.488 Y197.661 E.03167
G1 X104.06 Y218.089 E1.43646
G1 X103.423 Y218.089 E.03167
G1 X123.851 Y197.661 E1.43646
G1 X123.214 Y197.661 E.03167
G1 X102.786 Y218.089 E1.43646
G1 X102.149 Y218.089 E.03167
G1 X122.577 Y197.661 E1.43646
G1 X121.94 Y197.661 E.03167
G1 X101.512 Y218.089 E1.43646
G1 X100.875 Y218.089 E.03167
G1 X121.303 Y197.661 E1.43646
G1 X120.666 Y197.661 E.03167
G1 X100.238 Y218.089 E1.43646
G1 X99.601 Y218.089 E.03167
G1 X120.03 Y197.661 E1.43646
G1 X119.393 Y197.661 E.03167
G1 X98.964 Y218.089 E1.43646
G1 X98.328 Y218.089 E.03167
G1 X118.756 Y197.661 E1.43646
G1 X118.119 Y197.661 E.03167
G1 X97.691 Y218.089 E1.43646
G1 X97.054 Y218.089 E.03167
G1 X117.482 Y197.661 E1.43646
G1 X116.845 Y197.661 E.03167
G1 X96.417 Y218.089 E1.43646
M73 P59 R31
G1 X95.78 Y218.089 E.03167
G1 X116.208 Y197.661 E1.43646
G1 X115.571 Y197.661 E.03167
G1 X95.143 Y218.089 E1.43646
G1 X94.506 Y218.089 E.03167
G1 X114.934 Y197.661 E1.43646
G1 X114.297 Y197.661 E.03167
G1 X93.869 Y218.089 E1.43646
G1 X93.232 Y218.089 E.03167
G1 X113.66 Y197.661 E1.43646
G1 X113.024 Y197.661 E.03167
G1 X92.595 Y218.089 E1.43646
G1 X91.959 Y218.089 E.03167
G1 X112.387 Y197.661 E1.43646
G1 X111.75 Y197.661 E.03167
G1 X91.322 Y218.089 E1.43646
G1 X90.685 Y218.089 E.03167
G1 X111.113 Y197.661 E1.43646
G1 X110.476 Y197.661 E.03167
G1 X90.048 Y218.089 E1.43646
G1 X89.411 Y218.089 E.03167
G1 X109.839 Y197.661 E1.43646
G1 X109.202 Y197.661 E.03167
G1 X88.774 Y218.089 E1.43646
G1 X88.137 Y218.089 E.03167
G1 X108.565 Y197.661 E1.43646
G1 X107.928 Y197.661 E.03167
G1 X87.5 Y218.089 E1.43646
G1 X86.863 Y218.089 E.03167
G1 X107.291 Y197.661 E1.43646
G1 X106.655 Y197.661 E.03167
G1 X86.226 Y218.089 E1.43646
G1 X85.589 Y218.089 E.03167
G1 X106.018 Y197.661 E1.43646
G1 X105.381 Y197.661 E.03167
G1 X84.953 Y218.089 E1.43646
G1 X84.316 Y218.089 E.03167
G1 X104.744 Y197.661 E1.43646
G1 X104.107 Y197.661 E.03167
G1 X83.679 Y218.089 E1.43646
G1 X83.042 Y218.089 E.03167
G1 X103.47 Y197.661 E1.43646
G1 X102.833 Y197.661 E.03167
G1 X82.405 Y218.089 E1.43646
G1 X81.768 Y218.089 E.03167
G1 X102.196 Y197.661 E1.43646
G1 X101.559 Y197.661 E.03167
G1 X81.131 Y218.089 E1.43646
G1 X80.494 Y218.089 E.03167
G1 X100.922 Y197.661 E1.43646
G1 X100.285 Y197.661 E.03167
G1 X79.857 Y218.089 E1.43646
G1 X79.22 Y218.089 E.03167
G1 X99.649 Y197.661 E1.43646
G1 X99.012 Y197.661 E.03167
G1 X78.584 Y218.089 E1.43646
G1 X77.947 Y218.089 E.03167
G1 X98.375 Y197.661 E1.43646
G1 X97.738 Y197.661 E.03167
G1 X77.31 Y218.089 E1.43646
G1 X76.673 Y218.089 E.03167
G1 X97.101 Y197.661 E1.43646
G1 X96.464 Y197.661 E.03167
G1 X76.036 Y218.089 E1.43646
G1 X75.399 Y218.089 E.03167
G1 X95.827 Y197.661 E1.43646
G1 X95.19 Y197.661 E.03167
G1 X74.762 Y218.089 E1.43646
G1 X74.125 Y218.089 E.03167
G1 X94.553 Y197.661 E1.43646
G1 X93.916 Y197.661 E.03167
G1 X73.488 Y218.089 E1.43646
G1 X72.851 Y218.089 E.03167
G1 X93.28 Y197.661 E1.43646
G1 X92.643 Y197.661 E.03167
G1 X72.214 Y218.089 E1.43646
G1 X71.578 Y218.089 E.03167
G1 X92.006 Y197.661 E1.43646
G1 X91.369 Y197.661 E.03167
G1 X70.941 Y218.089 E1.43646
G1 X70.304 Y218.089 E.03167
G1 X90.732 Y197.661 E1.43646
G1 X90.095 Y197.661 E.03167
G1 X69.667 Y218.089 E1.43646
G1 X69.03 Y218.089 E.03167
G1 X89.458 Y197.661 E1.43646
M73 P59 R30
G1 X88.821 Y197.661 E.03167
G1 X68.393 Y218.089 E1.43646
G1 X67.756 Y218.089 E.03167
G1 X88.184 Y197.661 E1.43646
G1 X87.547 Y197.661 E.03167
G1 X67.119 Y218.089 E1.43646
G1 X66.482 Y218.089 E.03167
G1 X86.91 Y197.661 E1.43646
G1 X86.274 Y197.661 E.03167
G1 X65.845 Y218.089 E1.43646
G1 X65.209 Y218.089 E.03167
G1 X85.637 Y197.661 E1.43646
G1 X85 Y197.661 E.03167
G1 X64.572 Y218.089 E1.43646
G1 X63.935 Y218.089 E.03167
G1 X84.363 Y197.661 E1.43646
G1 X83.726 Y197.661 E.03167
G1 X63.298 Y218.089 E1.43646
G1 X62.661 Y218.089 E.03167
G1 X83.089 Y197.661 E1.43646
G1 X82.452 Y197.661 E.03167
G1 X62.024 Y218.089 E1.43646
G1 X61.387 Y218.089 E.03167
G1 X81.815 Y197.661 E1.43646
G1 X81.178 Y197.661 E.03167
G1 X60.75 Y218.089 E1.43646
G1 X60.113 Y218.089 E.03167
G1 X80.541 Y197.661 E1.43646
G1 X79.904 Y197.661 E.03167
G1 X59.476 Y218.089 E1.43646
G1 X58.839 Y218.089 E.03167
G1 X79.268 Y197.661 E1.43646
G1 X78.631 Y197.661 E.03167
G1 X58.203 Y218.089 E1.43646
G1 X57.566 Y218.089 E.03167
G1 X77.994 Y197.661 E1.43646
G1 X77.357 Y197.661 E.03167
G1 X56.929 Y218.089 E1.43646
G1 X56.292 Y218.089 E.03167
G1 X76.72 Y197.661 E1.43646
G1 X76.083 Y197.661 E.03167
G1 X55.655 Y218.089 E1.43646
G1 X55.018 Y218.089 E.03167
G1 X75.446 Y197.661 E1.43646
G1 X74.809 Y197.661 E.03167
G1 X54.381 Y218.089 E1.43646
G1 X53.744 Y218.089 E.03167
G1 X74.172 Y197.661 E1.43646
G1 X73.535 Y197.661 E.03167
G1 X53.107 Y218.089 E1.43646
G1 X52.47 Y218.089 E.03167
G1 X72.899 Y197.661 E1.43646
G1 X72.262 Y197.661 E.03167
G1 X51.833 Y218.089 E1.43646
G1 X51.197 Y218.089 E.03167
G1 X71.625 Y197.661 E1.43646
G1 X70.988 Y197.661 E.03167
G1 X50.56 Y218.089 E1.43646
G1 X49.923 Y218.089 E.03167
G1 X70.351 Y197.661 E1.43646
G1 X69.714 Y197.661 E.03167
G1 X49.286 Y218.089 E1.43646
G1 X48.649 Y218.089 E.03167
G1 X69.077 Y197.661 E1.43646
G1 X68.44 Y197.661 E.03167
G1 X48.012 Y218.089 E1.43646
G1 X47.375 Y218.089 E.03167
G1 X67.803 Y197.661 E1.43646
M73 P60 R30
G1 X67.166 Y197.661 E.03167
G1 X46.738 Y218.089 E1.43646
G1 X46.101 Y218.089 E.03167
G1 X66.529 Y197.661 E1.43646
G1 X65.893 Y197.661 E.03167
G1 X45.464 Y218.089 E1.43646
G1 X44.828 Y218.089 E.03167
G1 X65.256 Y197.661 E1.43646
G1 X64.619 Y197.661 E.03167
G1 X44.191 Y218.089 E1.43646
G1 X43.554 Y218.089 E.03167
G1 X63.982 Y197.661 E1.43646
G1 X63.345 Y197.661 E.03167
G1 X42.917 Y218.089 E1.43646
G1 X42.28 Y218.089 E.03167
G1 X62.708 Y197.661 E1.43646
G1 X62.071 Y197.661 E.03167
G1 X41.643 Y218.089 E1.43646
G1 X41.006 Y218.089 E.03167
G1 X61.434 Y197.661 E1.43646
G1 X60.797 Y197.661 E.03167
G1 X40.369 Y218.089 E1.43646
G1 X39.732 Y218.089 E.03167
G1 X60.16 Y197.661 E1.43646
G1 X59.524 Y197.661 E.03167
G1 X39.095 Y218.089 E1.43646
G1 X38.458 Y218.089 E.03167
G1 X58.887 Y197.661 E1.43646
G1 X58.25 Y197.661 E.03167
G1 X37.822 Y218.089 E1.43646
G1 X37.185 Y218.089 E.03167
G1 X57.613 Y197.661 E1.43646
G1 X56.976 Y197.661 E.03167
G1 X36.548 Y218.089 E1.43646
G1 X35.911 Y218.089 E.03167
G1 X56.339 Y197.661 E1.43646
G1 X55.702 Y197.661 E.03167
G1 X35.274 Y218.089 E1.43646
G1 X34.637 Y218.089 E.03167
G1 X55.065 Y197.661 E1.43646
G1 X54.428 Y197.661 E.03167
G1 X43.519 Y208.57 E.76708
G1 X43.544 Y208.41 E.00805
G2 X43.588 Y207.865 I-4.902 J-.671 E.0272
G1 X53.791 Y197.661 E.7175
G1 X53.154 Y197.661 E.03167
G1 X43.535 Y207.281 E.67644
G2 X43.411 Y206.768 I-4.155 J.732 E.02626
G1 X52.518 Y197.661 E.64037
G1 X51.881 Y197.661 E.03167
G1 X43.226 Y206.315 E.60854
G1 X43.199 Y206.258 E.00316
G2 X42.997 Y205.907 I-1.851 J.83 E.02014
G1 X51.244 Y197.661 E.57986
G1 X50.607 Y197.661 E.03167
G1 X42.725 Y205.543 E.55424
G2 X42.409 Y205.222 I-1.764 J1.416 E.02243
G1 X50.214 Y197.417 E.54881
G1 X50.214 Y196.78 E.03167
G1 X42.055 Y204.939 E.57371
G2 X41.661 Y204.696 I-1.413 J1.852 E.02305
G1 X50.214 Y196.143 E.60142
G1 X50.214 Y195.506 E.03167
G1 X41.217 Y204.503 E.63266
G2 X40.72 Y204.363 I-.947 J2.413 E.02572
G1 X50.214 Y194.869 E.66761
G1 X50.214 Y194.232 E.03167
G1 X40.15 Y204.297 E.7077
G1 X39.791 Y204.298 E.01783
G2 X39.482 Y204.327 I.178 J3.471 E.01544
G1 X50.214 Y193.595 E.75465
G1 X50.214 Y192.958 E.03167
G1 X38.597 Y204.576 E.81692
G2 X36.704 Y206.469 I1.471 J3.363 E.13625
G1 X29.786 Y213.387 E.48644
G1 X29.786 Y214.024 E.03167
G1 X36.45 Y207.359 E.4686
G2 X36.416 Y208.03 I3.331 J.503 E.03344
G1 X29.786 Y214.66 E.46623
G1 X29.786 Y215.297 E.03167
G1 X36.489 Y208.594 E.47136
G2 X36.626 Y209.094 I2.568 J-.432 E.02583
G1 X29.786 Y215.934 E.48096
G1 X29.786 Y216.571 E.03167
G1 X36.823 Y209.534 E.49482
G2 X37.064 Y209.93 I2.669 J-1.352 E.02307
G1 X29.786 Y217.208 E.51176
G1 X29.786 Y217.845 E.03167
G1 X37.345 Y210.286 E.53153
G2 X37.668 Y210.599 I3.989 J-3.794 E.0224
G1 X30.179 Y218.089 E.52666
G1 X30.816 Y218.089 E.03167
G1 X38.034 Y210.871 E.50755
G2 X38.439 Y211.102 I1.358 J-1.914 E.02326
G1 X31.453 Y218.089 E.4913
G1 X32.089 Y218.089 E.03167
G1 X38.892 Y211.286 E.47836
G2 X39.406 Y211.409 I.871 J-2.502 E.02631
G1 X32.726 Y218.089 E.46971
G1 X33.363 Y218.089 E.03167
G1 X39.992 Y211.46 E.46614
G2 X40.698 Y211.392 I-.025 J-3.926 E.03528
G1 X33.798 Y218.292 E.48519
M106 S102
G1 X29.583 Y212.952 F30000
M106 S229.5
G1 F3000
G1 X50.214 Y192.322 E1.4507
G1 X50.214 Y191.685 E.03167
G1 X29.786 Y212.113 E1.43646
G1 X29.786 Y211.476 E.03167
G1 X50.214 Y191.048 E1.43646
G1 X50.214 Y190.411 E.03167
G1 X29.786 Y210.839 E1.43646
G1 X29.786 Y210.202 E.03167
G1 X50.214 Y189.774 E1.43646
G1 X50.214 Y189.137 E.03167
G1 X29.786 Y209.565 E1.43646
G1 X29.786 Y208.928 E.03167
G1 X50.214 Y188.5 E1.43646
G1 X50.214 Y187.863 E.03167
G1 X29.786 Y208.291 E1.43646
G1 X29.786 Y207.654 E.03167
G1 X50.214 Y187.226 E1.43646
G1 X50.214 Y186.589 E.03167
G1 X29.786 Y207.018 E1.43646
G1 X29.786 Y206.381 E.03167
G1 X50.214 Y185.953 E1.43646
G1 X50.214 Y185.316 E.03167
G1 X29.786 Y205.744 E1.43646
G1 X29.786 Y205.107 E.03167
G1 X50.214 Y184.679 E1.43646
G1 X50.214 Y184.042 E.03167
G1 X29.786 Y204.47 E1.43646
G1 X29.786 Y203.833 E.03167
G1 X50.214 Y183.405 E1.43646
G1 X50.214 Y182.768 E.03167
G1 X29.786 Y203.196 E1.43646
G1 X29.786 Y202.559 E.03167
G1 X50.214 Y182.131 E1.43646
G1 X50.214 Y181.494 E.03167
G1 X29.786 Y201.922 E1.43646
G1 X29.786 Y201.285 E.03167
G1 X50.214 Y180.857 E1.43646
G1 X50.214 Y180.22 E.03167
G1 X29.786 Y200.648 E1.43646
G1 X29.786 Y200.012 E.03167
G1 X50.214 Y179.583 E1.43646
G1 X50.214 Y178.947 E.03167
G1 X29.786 Y199.375 E1.43646
G1 X29.786 Y198.738 E.03167
G1 X50.214 Y178.31 E1.43646
G1 X50.214 Y177.673 E.03167
G1 X29.786 Y198.101 E1.43646
G1 X29.786 Y197.464 E.03167
G1 X50.214 Y177.036 E1.43646
G1 X50.214 Y176.399 E.03167
G1 X29.786 Y196.827 E1.43646
G1 X29.786 Y196.19 E.03167
G1 X50.214 Y175.762 E1.43646
G1 X50.214 Y175.125 E.03167
G1 X29.786 Y195.553 E1.43646
G1 X29.786 Y194.916 E.03167
G1 X50.214 Y174.488 E1.43646
G1 X50.214 Y173.851 E.03167
G1 X29.786 Y194.279 E1.43646
G1 X29.786 Y193.643 E.03167
G1 X50.214 Y173.214 E1.43646
G1 X50.214 Y172.578 E.03167
G1 X29.786 Y193.006 E1.43646
G1 X29.786 Y192.369 E.03167
G1 X50.214 Y171.941 E1.43646
G1 X50.214 Y171.304 E.03167
G1 X29.786 Y191.732 E1.43646
M73 P60 R29
G1 X29.786 Y191.095 E.03167
G1 X50.214 Y170.667 E1.43646
G1 X50.214 Y170.03 E.03167
G1 X29.786 Y190.458 E1.43646
G1 X29.786 Y189.821 E.03167
G1 X50.214 Y169.393 E1.43646
G1 X50.214 Y168.756 E.03167
G1 X29.786 Y189.184 E1.43646
G1 X29.786 Y188.547 E.03167
G1 X50.214 Y168.119 E1.43646
G1 X50.214 Y167.482 E.03167
G1 X29.786 Y187.91 E1.43646
G1 X29.786 Y187.273 E.03167
G1 X50.214 Y166.845 E1.43646
G1 X50.214 Y166.208 E.03167
G1 X29.786 Y186.637 E1.43646
G1 X29.786 Y186 E.03167
G1 X50.214 Y165.572 E1.43646
G1 X50.214 Y164.935 E.03167
G1 X29.786 Y185.363 E1.43646
G1 X29.786 Y184.726 E.03167
G1 X50.214 Y164.298 E1.43646
M73 P61 R29
G1 X50.214 Y163.661 E.03167
G1 X29.786 Y184.089 E1.43646
G1 X29.786 Y183.452 E.03167
G1 X50.214 Y163.024 E1.43646
G1 X50.214 Y162.387 E.03167
G1 X29.786 Y182.815 E1.43646
G1 X29.786 Y182.178 E.03167
G1 X50.214 Y161.75 E1.43646
G1 X50.214 Y161.113 E.03167
G1 X29.786 Y181.541 E1.43646
G1 X29.786 Y180.904 E.03167
G1 X50.214 Y160.476 E1.43646
G1 X50.214 Y159.839 E.03167
G1 X29.786 Y180.268 E1.43646
G1 X29.786 Y179.631 E.03167
G1 X50.214 Y159.203 E1.43646
G1 X50.214 Y158.566 E.03167
G1 X29.786 Y178.994 E1.43646
G1 X29.786 Y178.357 E.03167
G1 X50.214 Y157.929 E1.43646
G1 X50.214 Y157.292 E.03167
G1 X29.786 Y177.72 E1.43646
G1 X29.786 Y177.083 E.03167
G1 X50.214 Y156.655 E1.43646
G1 X50.214 Y156.018 E.03167
G1 X29.786 Y176.446 E1.43646
G1 X29.786 Y175.809 E.03167
G1 X50.214 Y155.381 E1.43646
G1 X50.214 Y154.744 E.03167
G1 X29.786 Y175.172 E1.43646
G1 X29.786 Y174.535 E.03167
G1 X50.214 Y154.107 E1.43646
G1 X50.214 Y153.47 E.03167
G1 X29.786 Y173.898 E1.43646
G1 X29.786 Y173.262 E.03167
G1 X50.214 Y152.833 E1.43646
G1 X50.214 Y152.197 E.03167
G1 X29.786 Y172.625 E1.43646
G1 X29.786 Y171.988 E.03167
G1 X50.214 Y151.56 E1.43646
G1 X50.214 Y150.923 E.03167
G1 X29.786 Y171.351 E1.43646
G1 X29.786 Y170.714 E.03167
G1 X50.214 Y150.286 E1.43646
G1 X50.214 Y149.649 E.03167
G1 X29.786 Y170.077 E1.43646
G1 X29.786 Y169.44 E.03167
G1 X50.214 Y149.012 E1.43646
G1 X50.214 Y148.375 E.03167
G1 X29.786 Y168.803 E1.43646
G1 X29.786 Y168.166 E.03167
G1 X50.214 Y147.738 E1.43646
G1 X50.214 Y147.101 E.03167
G1 X29.786 Y167.529 E1.43646
G1 X29.786 Y166.893 E.03167
G1 X50.214 Y146.464 E1.43646
G1 X50.214 Y145.827 E.03167
G1 X29.786 Y166.256 E1.43646
G1 X29.786 Y165.619 E.03167
G1 X50.214 Y145.191 E1.43646
G1 X50.214 Y144.554 E.03167
G1 X29.786 Y164.982 E1.43646
G1 X29.786 Y164.345 E.03167
G1 X50.214 Y143.917 E1.43646
G1 X50.214 Y143.28 E.03167
G1 X29.786 Y163.708 E1.43646
G1 X29.786 Y163.071 E.03167
G1 X50.214 Y142.643 E1.43646
G1 X50.214 Y142.006 E.03167
G1 X29.786 Y162.434 E1.43646
G1 X29.786 Y161.797 E.03167
G1 X50.214 Y141.369 E1.43646
G1 X50.214 Y140.732 E.03167
G1 X29.786 Y161.16 E1.43646
G1 X29.786 Y160.523 E.03167
G1 X50.214 Y140.095 E1.43646
G1 X50.214 Y139.458 E.03167
G1 X29.786 Y159.887 E1.43646
G1 X29.786 Y159.25 E.03167
G1 X50.214 Y138.822 E1.43646
G1 X50.214 Y138.185 E.03167
G1 X29.786 Y158.613 E1.43646
G1 X29.786 Y157.976 E.03167
G1 X50.214 Y137.548 E1.43646
G1 X50.214 Y136.911 E.03167
G1 X29.786 Y157.339 E1.43646
G1 X29.786 Y156.702 E.03167
G1 X50.214 Y136.274 E1.43646
G1 X50.214 Y135.637 E.03167
G1 X29.786 Y156.065 E1.43646
G1 X29.786 Y155.428 E.03167
G1 X50.214 Y135 E1.43646
G1 X50.214 Y134.363 E.03167
G1 X29.786 Y154.791 E1.43646
G1 X29.786 Y154.154 E.03167
G1 X50.214 Y133.726 E1.43646
G1 X50.214 Y133.089 E.03167
G1 X29.786 Y153.518 E1.43646
G1 X29.786 Y152.881 E.03167
G1 X50.214 Y132.452 E1.43646
G1 X50.214 Y131.816 E.03167
G1 X29.786 Y152.244 E1.43646
G1 X29.786 Y151.607 E.03167
G1 X50.214 Y131.179 E1.43646
G1 X50.214 Y130.542 E.03167
G1 X29.786 Y150.97 E1.43646
G1 X29.786 Y150.333 E.03167
G1 X50.214 Y129.905 E1.43646
G1 X50.214 Y129.268 E.03167
G1 X29.786 Y149.696 E1.43646
G1 X29.786 Y149.059 E.03167
G1 X50.214 Y128.631 E1.43646
G1 X50.214 Y127.994 E.03167
G1 X29.786 Y148.422 E1.43646
G1 X29.786 Y147.785 E.03167
G1 X50.214 Y127.357 E1.43646
G1 X50.214 Y126.72 E.03167
G1 X29.786 Y147.148 E1.43646
G1 X29.786 Y146.512 E.03167
G1 X50.214 Y126.083 E1.43646
G1 X50.214 Y125.447 E.03167
G1 X29.786 Y145.875 E1.43646
G1 X29.786 Y145.238 E.03167
G1 X50.214 Y124.81 E1.43646
G1 X50.214 Y124.173 E.03167
G1 X29.786 Y144.601 E1.43646
G1 X29.786 Y143.964 E.03167
G1 X50.214 Y123.536 E1.43646
G1 X50.214 Y122.899 E.03167
G1 X29.786 Y143.327 E1.43646
G1 X29.786 Y142.69 E.03167
G1 X50.214 Y122.262 E1.43646
G1 X50.214 Y121.625 E.03167
G1 X29.786 Y142.053 E1.43646
G1 X29.786 Y141.416 E.03167
G1 X50.214 Y120.988 E1.43646
G1 X50.214 Y120.351 E.03167
G1 X43.384 Y127.182 E.48031
G1 X43.425 Y127.069 E.00596
G2 X43.57 Y126.358 I-4.783 J-1.35 E.03611
G1 X50.214 Y119.714 E.46718
G1 X50.214 Y119.077 E.03167
G1 X43.574 Y125.718 E.46691
G2 X43.486 Y125.168 I-3.942 J.348 E.02768
G1 X50.214 Y118.441 E.47308
G1 X50.214 Y117.804 E.03167
G1 X43.334 Y124.683 E.48376
G2 X43.131 Y124.25 I-4.485 J1.847 E.02381
G1 X50.214 Y117.167 E.49809
G1 X50.214 Y116.53 E.03167
G1 X42.879 Y123.865 E.5158
G1 X42.855 Y123.834 E.00197
G2 X42.587 Y123.52 I-1.705 J1.181 E.02054
G1 X50.214 Y115.893 E.53629
M73 P62 R29
G1 X50.214 Y115.256 E.03167
G1 X42.258 Y123.213 E.55949
G2 X41.884 Y122.949 I-3.325 J4.325 E.02273
G1 X50.214 Y114.619 E.58577
G1 X50.214 Y113.982 E.03167
G1 X41.466 Y122.73 E.61512
G2 X41.003 Y122.556 I-1.238 J2.599 E.02463
G1 X50.214 Y113.345 E.6477
G1 X50.214 Y112.708 E.03167
G1 X40.475 Y122.448 E.68485
G2 X39.863 Y122.422 I-.405 J2.37 E.03052
G1 X50.214 Y112.072 E.72785
G1 X50.214 Y111.435 E.03167
G1 X38.816 Y122.832 E.80145
M106 S102
; WIPE_START
G1 X40.231 Y121.418 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X36.828 Y124.821 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
M106 S229.5
G1 F3000
G1 X29.786 Y131.863 E.49516
G1 X29.786 Y132.5 E.03167
G1 X36.416 Y125.869 E.46623
G2 X36.446 Y126.476 I3.048 J.155 E.03027
M73 P62 R28
G1 X29.786 Y133.137 E.46832
G1 X29.786 Y133.773 E.03167
G1 X36.558 Y127.001 E.47623
G2 X36.698 Y127.394 I2.029 J-.502 E.02076
G1 X36.729 Y127.467 E.00396
G1 X29.786 Y134.41 E.48824
G1 X29.786 Y135.047 E.03167
G1 X36.948 Y127.885 E.50362
G2 X37.214 Y128.256 I1.982 J-1.146 E.02273
G1 X29.786 Y135.684 E.52236
G1 X29.786 Y136.321 E.03167
G1 X37.52 Y128.587 E.54384
G2 X37.864 Y128.88 I1.636 J-1.572 E.0225
G1 X29.786 Y136.958 E.56802
G1 X29.786 Y137.595 E.03167
G1 X38.251 Y129.13 E.59521
G2 X38.684 Y129.333 I1.231 J-2.064 E.02386
G1 X29.786 Y138.232 E.62571
G1 X29.786 Y138.869 E.03167
G1 X39.166 Y129.488 E.65961
G2 X39.719 Y129.573 I.927 J-4.22 E.02781
G1 X29.786 Y139.506 E.69846
G1 X29.786 Y140.143 E.03167
G1 X40.362 Y129.566 E.74369
G2 X41.182 Y129.384 I-.23 J-2.958 E.0419
G1 X29.583 Y140.982 E.81557
M106 S102
G1 X29.583 Y131.428 F30000
M106 S229.5
G1 F3000
G1 X50.214 Y110.798 E1.4507
G1 X50.214 Y110.161 E.03167
G1 X29.786 Y130.589 E1.43646
G1 X29.786 Y129.952 E.03167
G1 X50.214 Y109.524 E1.43646
G1 X50.214 Y108.887 E.03167
G1 X29.786 Y129.315 E1.43646
G1 X29.786 Y128.678 E.03167
G1 X50.214 Y108.25 E1.43646
G1 X50.214 Y107.613 E.03167
G1 X29.786 Y128.041 E1.43646
G1 X29.786 Y127.404 E.03167
G1 X50.214 Y106.976 E1.43646
G1 X50.214 Y106.339 E.03167
G1 X29.786 Y126.768 E1.43646
G1 X29.786 Y126.131 E.03167
G1 X50.214 Y105.702 E1.43646
G1 X50.214 Y105.066 E.03167
G1 X29.786 Y125.494 E1.43646
G1 X29.786 Y124.857 E.03167
G1 X50.214 Y104.429 E1.43646
G1 X50.214 Y103.792 E.03167
G1 X29.786 Y124.22 E1.43646
G1 X29.786 Y123.583 E.03167
G1 X50.214 Y103.155 E1.43646
G1 X50.214 Y102.518 E.03167
G1 X29.786 Y122.946 E1.43646
G1 X29.786 Y122.309 E.03167
G1 X50.214 Y101.881 E1.43646
G1 X50.214 Y101.244 E.03167
G1 X29.786 Y121.672 E1.43646
G1 X29.786 Y121.035 E.03167
G1 X50.214 Y100.607 E1.43646
G1 X50.214 Y99.97 E.03167
G1 X29.786 Y120.398 E1.43646
G1 X29.786 Y119.762 E.03167
G1 X50.214 Y99.333 E1.43646
G1 X50.214 Y98.697 E.03167
G1 X29.786 Y119.125 E1.43646
G1 X29.786 Y118.488 E.03167
G1 X50.214 Y98.06 E1.43646
G1 X50.214 Y97.423 E.03167
G1 X29.786 Y117.851 E1.43646
G1 X29.786 Y117.214 E.03167
G1 X50.214 Y96.786 E1.43646
G1 X50.214 Y96.149 E.03167
G1 X29.786 Y116.577 E1.43646
G1 X29.786 Y115.94 E.03167
G1 X50.214 Y95.512 E1.43646
G1 X50.214 Y94.875 E.03167
G1 X29.786 Y115.303 E1.43646
G1 X29.786 Y114.666 E.03167
G1 X50.214 Y94.238 E1.43646
G1 X50.214 Y93.601 E.03167
G1 X29.786 Y114.029 E1.43646
G1 X29.786 Y113.392 E.03167
G1 X50.214 Y92.964 E1.43646
G1 X50.214 Y92.327 E.03167
G1 X29.786 Y112.756 E1.43646
G1 X29.786 Y112.119 E.03167
G1 X50.214 Y91.691 E1.43646
G1 X50.214 Y91.054 E.03167
G1 X29.786 Y111.482 E1.43646
G1 X29.786 Y110.845 E.03167
G1 X50.214 Y90.417 E1.43646
G1 X50.214 Y89.78 E.03167
G1 X29.786 Y110.208 E1.43646
G1 X29.786 Y109.571 E.03167
G1 X50.214 Y89.143 E1.43646
G1 X50.214 Y88.506 E.03167
G1 X29.786 Y108.934 E1.43646
G1 X29.786 Y108.297 E.03167
G1 X50.214 Y87.869 E1.43646
G1 X50.214 Y87.232 E.03167
G1 X29.786 Y107.66 E1.43646
G1 X29.786 Y107.023 E.03167
G1 X50.214 Y86.595 E1.43646
G1 X50.214 Y85.958 E.03167
G1 X29.786 Y106.387 E1.43646
G1 X29.786 Y105.75 E.03167
G1 X50.214 Y85.322 E1.43646
G1 X50.214 Y84.685 E.03167
G1 X29.786 Y105.113 E1.43646
G1 X29.786 Y104.476 E.03167
G1 X50.214 Y84.048 E1.43646
G1 X50.214 Y83.411 E.03167
G1 X29.786 Y103.839 E1.43646
G1 X29.786 Y103.202 E.03167
G1 X50.214 Y82.774 E1.43646
G1 X50.214 Y82.137 E.03167
G1 X29.786 Y102.565 E1.43646
G1 X29.786 Y101.928 E.03167
G1 X50.214 Y81.5 E1.43646
G1 X50.214 Y80.863 E.03167
G1 X29.786 Y101.291 E1.43646
G1 X29.786 Y100.654 E.03167
G1 X50.214 Y80.226 E1.43646
G1 X50.214 Y79.589 E.03167
G1 X29.786 Y100.017 E1.43646
G1 X29.786 Y99.381 E.03167
G1 X50.214 Y78.952 E1.43646
G1 X50.214 Y78.316 E.03167
G1 X29.786 Y98.744 E1.43646
G1 X29.786 Y98.107 E.03167
G1 X50.214 Y77.679 E1.43646
G1 X50.214 Y77.042 E.03167
G1 X29.786 Y97.47 E1.43646
G1 X29.786 Y96.833 E.03167
G1 X50.214 Y76.405 E1.43646
G1 X50.214 Y75.768 E.03167
G1 X29.786 Y96.196 E1.43646
G1 X29.786 Y95.559 E.03167
G1 X50.214 Y75.131 E1.43646
G1 X50.214 Y74.494 E.03167
G1 X29.786 Y94.922 E1.43646
G1 X29.786 Y94.285 E.03167
G1 X50.214 Y73.857 E1.43646
G1 X50.214 Y73.22 E.03167
G1 X29.786 Y93.648 E1.43646
G1 X29.786 Y93.012 E.03167
G1 X50.214 Y72.583 E1.43646
G1 X50.214 Y71.947 E.03167
G1 X29.786 Y92.375 E1.43646
G1 X29.786 Y91.738 E.03167
G1 X50.214 Y71.31 E1.43646
G1 X50.214 Y70.673 E.03167
G1 X29.786 Y91.101 E1.43646
G1 X29.786 Y90.464 E.03167
G1 X50.214 Y70.036 E1.43646
G1 X50.214 Y69.399 E.03167
G1 X29.786 Y89.827 E1.43646
G1 X29.786 Y89.19 E.03167
G1 X50.214 Y68.762 E1.43646
G1 X50.214 Y68.125 E.03167
G1 X29.786 Y88.553 E1.43646
G1 X29.786 Y87.916 E.03167
G1 X50.214 Y67.488 E1.43646
G1 X50.214 Y66.851 E.03167
G1 X29.786 Y87.279 E1.43646
G1 X29.786 Y86.642 E.03167
G1 X50.214 Y66.214 E1.43646
G1 X50.214 Y65.577 E.03167
G1 X29.786 Y86.006 E1.43646
G1 X29.786 Y85.369 E.03167
G1 X50.214 Y64.941 E1.43646
M73 P63 R28
G1 X50.214 Y64.304 E.03167
G1 X29.786 Y84.732 E1.43646
G1 X29.786 Y84.095 E.03167
G1 X50.214 Y63.667 E1.43646
G1 X50.214 Y63.03 E.03167
G1 X29.786 Y83.458 E1.43646
G1 X29.786 Y82.821 E.03167
G1 X50.214 Y62.393 E1.43646
G1 X50.214 Y61.756 E.03167
G1 X29.786 Y82.184 E1.43646
G1 X29.786 Y81.547 E.03167
G1 X50.214 Y61.119 E1.43646
G1 X50.214 Y60.482 E.03167
G1 X29.786 Y80.91 E1.43646
G1 X29.786 Y80.273 E.03167
G1 X50.214 Y59.845 E1.43646
G1 X50.214 Y59.208 E.03167
G1 X29.786 Y79.637 E1.43646
G1 X29.786 Y79 E.03167
G1 X50.214 Y58.572 E1.43646
G1 X50.214 Y57.935 E.03167
G1 X29.786 Y78.363 E1.43646
G1 X29.786 Y77.726 E.03167
G1 X50.214 Y57.298 E1.43646
G1 X50.214 Y56.661 E.03167
G1 X29.786 Y77.089 E1.43646
G1 X29.786 Y76.452 E.03167
G1 X50.214 Y56.024 E1.43646
G1 X50.214 Y55.387 E.03167
G1 X29.786 Y75.815 E1.43646
G1 X29.786 Y75.178 E.03167
G1 X50.214 Y54.75 E1.43646
G1 X50.214 Y54.339 E.02044
G1 X50.625 Y54.339 E.02044
G1 X71.053 Y33.911 E1.43646
G1 X71.69 Y33.911 E.03167
G1 X51.262 Y54.339 E1.43646
G1 X51.899 Y54.339 E.03167
G1 X72.327 Y33.911 E1.43646
G1 X72.964 Y33.911 E.03167
G1 X52.536 Y54.339 E1.43646
G1 X53.173 Y54.339 E.03167
G1 X73.601 Y33.911 E1.43646
G1 X74.238 Y33.911 E.03167
G1 X53.81 Y54.339 E1.43646
G1 X54.447 Y54.339 E.03167
G1 X74.875 Y33.911 E1.43646
G1 X75.512 Y33.911 E.03167
G1 X55.083 Y54.339 E1.43646
G1 X55.72 Y54.339 E.03167
G1 X76.148 Y33.911 E1.43646
G1 X76.785 Y33.911 E.03167
G1 X56.357 Y54.339 E1.43646
G1 X56.994 Y54.339 E.03167
G1 X77.422 Y33.911 E1.43646
G1 X78.059 Y33.911 E.03167
G1 X57.631 Y54.339 E1.43646
G1 X58.268 Y54.339 E.03167
G1 X78.696 Y33.911 E1.43646
G1 X79.333 Y33.911 E.03167
G1 X58.905 Y54.339 E1.43646
G1 X59.542 Y54.339 E.03167
G1 X79.97 Y33.911 E1.43646
G1 X80.607 Y33.911 E.03167
G1 X60.179 Y54.339 E1.43646
G1 X60.816 Y54.339 E.03167
G1 X81.244 Y33.911 E1.43646
G1 X81.881 Y33.911 E.03167
G1 X61.452 Y54.339 E1.43646
G1 X62.089 Y54.339 E.03167
G1 X82.518 Y33.911 E1.43646
G1 X83.154 Y33.911 E.03167
M73 P63 R27
G1 X62.726 Y54.339 E1.43646
G1 X63.363 Y54.339 E.03167
G1 X83.791 Y33.911 E1.43646
G1 X84.428 Y33.911 E.03167
G1 X64 Y54.339 E1.43646
G1 X64.637 Y54.339 E.03167
G1 X85.065 Y33.911 E1.43646
G1 X85.702 Y33.911 E.03167
G1 X65.274 Y54.339 E1.43646
G1 X65.911 Y54.339 E.03167
G1 X86.339 Y33.911 E1.43646
G1 X86.976 Y33.911 E.03167
G1 X66.548 Y54.339 E1.43646
G1 X67.185 Y54.339 E.03167
G1 X87.613 Y33.911 E1.43646
G1 X88.25 Y33.911 E.03167
G1 X67.822 Y54.339 E1.43646
G1 X68.458 Y54.339 E.03167
G1 X88.887 Y33.911 E1.43646
G1 X89.523 Y33.911 E.03167
G1 X69.095 Y54.339 E1.43646
G1 X69.732 Y54.339 E.03167
G1 X90.16 Y33.911 E1.43646
G1 X90.797 Y33.911 E.03167
G1 X70.369 Y54.339 E1.43646
G1 X71.006 Y54.339 E.03167
G1 X91.434 Y33.911 E1.43646
G1 X92.071 Y33.911 E.03167
G1 X71.643 Y54.339 E1.43646
G1 X72.28 Y54.339 E.03167
G1 X92.708 Y33.911 E1.43646
G1 X93.345 Y33.911 E.03167
G1 X72.917 Y54.339 E1.43646
G1 X73.554 Y54.339 E.03167
G1 X93.982 Y33.911 E1.43646
G1 X94.619 Y33.911 E.03167
G1 X74.191 Y54.339 E1.43646
G1 X74.827 Y54.339 E.03167
G1 X95.256 Y33.911 E1.43646
G1 X95.893 Y33.911 E.03167
G1 X75.464 Y54.339 E1.43646
G1 X76.101 Y54.339 E.03167
G1 X96.529 Y33.911 E1.43646
G1 X97.166 Y33.911 E.03167
G1 X76.738 Y54.339 E1.43646
G1 X77.375 Y54.339 E.03167
G1 X97.803 Y33.911 E1.43646
G1 X98.44 Y33.911 E.03167
G1 X78.012 Y54.339 E1.43646
G1 X78.649 Y54.339 E.03167
G1 X99.077 Y33.911 E1.43646
G1 X99.714 Y33.911 E.03167
G1 X79.286 Y54.339 E1.43646
G1 X79.923 Y54.339 E.03167
G1 X100.351 Y33.911 E1.43646
G1 X100.988 Y33.911 E.03167
G1 X80.56 Y54.339 E1.43646
G1 X81.197 Y54.339 E.03167
G1 X101.625 Y33.911 E1.43646
G1 X102.262 Y33.911 E.03167
G1 X81.833 Y54.339 E1.43646
G1 X82.47 Y54.339 E.03167
G1 X102.898 Y33.911 E1.43646
G1 X103.535 Y33.911 E.03167
G1 X83.107 Y54.339 E1.43646
G1 X83.744 Y54.339 E.03167
G1 X104.172 Y33.911 E1.43646
G1 X104.809 Y33.911 E.03167
G1 X84.381 Y54.339 E1.43646
G1 X85.018 Y54.339 E.03167
G1 X105.446 Y33.911 E1.43646
G1 X106.083 Y33.911 E.03167
G1 X85.655 Y54.339 E1.43646
G1 X86.292 Y54.339 E.03167
G1 X106.72 Y33.911 E1.43646
G1 X107.357 Y33.911 E.03167
G1 X86.929 Y54.339 E1.43646
G1 X87.566 Y54.339 E.03167
G1 X107.994 Y33.911 E1.43646
G1 X108.631 Y33.911 E.03167
G1 X88.202 Y54.339 E1.43646
G1 X88.839 Y54.339 E.03167
G1 X109.268 Y33.911 E1.43646
M73 P64 R27
G1 X109.904 Y33.911 E.03167
G1 X89.476 Y54.339 E1.43646
G1 X90.113 Y54.339 E.03167
G1 X110.541 Y33.911 E1.43646
G1 X111.178 Y33.911 E.03167
G1 X90.75 Y54.339 E1.43646
G1 X91.387 Y54.339 E.03167
G1 X111.815 Y33.911 E1.43646
G1 X112.452 Y33.911 E.03167
G1 X92.024 Y54.339 E1.43646
G1 X92.661 Y54.339 E.03167
G1 X113.089 Y33.911 E1.43646
G1 X113.726 Y33.911 E.03167
G1 X93.298 Y54.339 E1.43646
G1 X93.935 Y54.339 E.03167
G1 X114.363 Y33.911 E1.43646
G1 X115 Y33.911 E.03167
G1 X94.572 Y54.339 E1.43646
G1 X95.208 Y54.339 E.03167
G1 X115.637 Y33.911 E1.43646
G1 X116.273 Y33.911 E.03167
G1 X95.845 Y54.339 E1.43646
G1 X96.482 Y54.339 E.03167
G1 X116.91 Y33.911 E1.43646
G1 X117.547 Y33.911 E.03167
G1 X97.119 Y54.339 E1.43646
G1 X97.756 Y54.339 E.03167
G1 X118.184 Y33.911 E1.43646
G1 X118.821 Y33.911 E.03167
G1 X98.393 Y54.339 E1.43646
G1 X99.03 Y54.339 E.03167
G1 X119.458 Y33.911 E1.43646
G1 X120.095 Y33.911 E.03167
G1 X99.667 Y54.339 E1.43646
G1 X100.304 Y54.339 E.03167
G1 X120.732 Y33.911 E1.43646
G1 X121.369 Y33.911 E.03167
G1 X100.941 Y54.339 E1.43646
G1 X101.578 Y54.339 E.03167
G1 X122.006 Y33.911 E1.43646
G1 X122.643 Y33.911 E.03167
G1 X102.214 Y54.339 E1.43646
G1 X102.851 Y54.339 E.03167
G1 X123.279 Y33.911 E1.43646
G1 X123.916 Y33.911 E.03167
G1 X103.488 Y54.339 E1.43646
G1 X104.125 Y54.339 E.03167
G1 X124.553 Y33.911 E1.43646
G1 X125.19 Y33.911 E.03167
G1 X104.762 Y54.339 E1.43646
G1 X105.399 Y54.339 E.03167
G1 X125.827 Y33.911 E1.43646
G1 X126.464 Y33.911 E.03167
G1 X106.036 Y54.339 E1.43646
G1 X106.673 Y54.339 E.03167
G1 X127.101 Y33.911 E1.43646
G1 X127.738 Y33.911 E.03167
G1 X107.31 Y54.339 E1.43646
G1 X107.947 Y54.339 E.03167
G1 X128.375 Y33.911 E1.43646
G1 X129.012 Y33.911 E.03167
G1 X108.583 Y54.339 E1.43646
G1 X109.22 Y54.339 E.03167
G1 X129.649 Y33.911 E1.43646
G1 X130.285 Y33.911 E.03167
G1 X109.857 Y54.339 E1.43646
G1 X110.494 Y54.339 E.03167
G1 X130.922 Y33.911 E1.43646
G1 X131.559 Y33.911 E.03167
G1 X111.131 Y54.339 E1.43646
G1 X111.768 Y54.339 E.03167
G1 X132.196 Y33.911 E1.43646
G1 X132.833 Y33.911 E.03167
G1 X112.202 Y54.542 E1.4507
M106 S102
; WIPE_START
G1 X113.617 Y53.127 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.957 Y48.878 Z2.6 F30000
G1 X142.589 Y33.708 Z2.6
G1 Z2.2
G1 E.8 F1800
M106 S229.5
G1 F3000
G1 X131.527 Y44.771 E.77787
G2 X131.586 Y44.075 I-4.125 J-.699 E.03476
G1 X141.75 Y33.911 E.71471
G1 X141.113 Y33.911 E.03167
G1 X131.529 Y43.495 E.6739
G2 X131.4 Y42.987 I-4.058 J.766 E.02605
G1 X140.476 Y33.911 E.63822
G1 X139.839 Y33.911 E.03167
G1 X131.213 Y42.537 E.60657
G2 X130.982 Y42.131 I-2.145 J.954 E.02325
G1 X139.202 Y33.911 E.57804
G1 X138.565 Y33.911 E.03167
G1 X130.705 Y41.771 E.55272
G2 X130.387 Y41.452 I-1.751 J1.424 E.02243
G1 X137.928 Y33.911 E.53027
G1 X137.291 Y33.911 E.03167
G1 X130.031 Y41.171 E.51054
G2 X129.634 Y40.931 I-3.351 J5.077 E.02306
G1 X136.654 Y33.911 E.49363
G1 X136.018 Y33.911 E.03167
G1 X129.186 Y40.743 E.4804
G2 X128.963 Y40.669 I-.563 J1.325 E.0117
G1 X128.686 Y40.606 E.01411
G1 X135.381 Y33.911 E.47076
G1 X134.744 Y33.911 E.03167
G1 X128.108 Y40.547 E.46661
G2 X127.432 Y40.586 I-.151 J3.221 E.03376
G1 X134.107 Y33.911 E.46939
G1 X133.47 Y33.911 E.03167
G1 X126.528 Y40.853 E.48814
G2 X124.734 Y42.647 I1.506 J3.3 E.12887
G1 X113.042 Y54.339 E.82216
G1 X113.679 Y54.339 E.03167
G1 X124.458 Y43.56 E.75798
G2 X124.416 Y44.238 I4.393 J.611 E.03384
G1 X114.316 Y54.339 E.71026
G1 X114.953 Y54.339 E.03167
M73 P64 R26
G1 X124.482 Y44.809 E.6701
G2 X124.616 Y45.312 I3.015 J-.533 E.02592
G1 X115.589 Y54.339 E.63473
G1 X116.226 Y54.339 E.03167
G1 X124.808 Y45.757 E.60346
G2 X124.947 Y46.009 I8.135 J-4.324 E.01431
G1 X125.047 Y46.155 E.0088
G1 X116.863 Y54.339 E.57546
G1 X117.5 Y54.339 E.03167
G1 X125.326 Y46.513 E.55029
G2 X125.645 Y46.831 I4.129 J-3.835 E.0224
G1 X118.137 Y54.339 E.52796
G1 X118.774 Y54.339 E.03167
G1 X126.008 Y47.105 E.5087
G2 X126.412 Y47.338 I1.368 J-1.902 E.02322
G1 X119.411 Y54.339 E.4923
G1 X120.048 Y54.339 E.03167
G1 X126.86 Y47.527 E.47901
G2 X127.371 Y47.653 I.885 J-2.49 E.02621
G1 X120.685 Y54.339 E.47015
G1 X121.322 Y54.339 E.03167
G1 X127.95 Y47.711 E.46606
G2 X128.644 Y47.654 I-.037 J-4.689 E.03466
G1 X121.958 Y54.339 E.47008
G1 X122.595 Y54.339 E.03167
G1 X143.024 Y33.911 E1.43646
G1 X143.66 Y33.911 E.03167
G1 X123.232 Y54.339 E1.43646
G1 X123.869 Y54.339 E.03167
G1 X144.297 Y33.911 E1.43646
G1 X144.934 Y33.911 E.03167
G1 X124.506 Y54.339 E1.43646
G1 X125.143 Y54.339 E.03167
G1 X145.571 Y33.911 E1.43646
G1 X146.208 Y33.911 E.03167
G1 X125.78 Y54.339 E1.43646
G1 X126.417 Y54.339 E.03167
G1 X146.845 Y33.911 E1.43646
G1 X147.482 Y33.911 E.03167
G1 X127.054 Y54.339 E1.43646
G1 X127.691 Y54.339 E.03167
G1 X148.119 Y33.911 E1.43646
G1 X148.756 Y33.911 E.03167
G1 X128.328 Y54.339 E1.43646
G1 X128.964 Y54.339 E.03167
G1 X149.393 Y33.911 E1.43646
G1 X150.029 Y33.911 E.03167
G1 X129.601 Y54.339 E1.43646
G1 X130.238 Y54.339 E.03167
G1 X150.666 Y33.911 E1.43646
G1 X151.303 Y33.911 E.03167
G1 X130.875 Y54.339 E1.43646
G1 X131.512 Y54.339 E.03167
G1 X151.94 Y33.911 E1.43646
G1 X152.577 Y33.911 E.03167
G1 X132.149 Y54.339 E1.43646
G1 X132.786 Y54.339 E.03167
G1 X153.214 Y33.911 E1.43646
G1 X153.851 Y33.911 E.03167
G1 X133.423 Y54.339 E1.43646
G1 X134.06 Y54.339 E.03167
G1 X154.488 Y33.911 E1.43646
G1 X155.125 Y33.911 E.03167
G1 X134.697 Y54.339 E1.43646
G1 X135.333 Y54.339 E.03167
G1 X155.762 Y33.911 E1.43646
G1 X156.399 Y33.911 E.03167
G1 X135.97 Y54.339 E1.43646
G1 X136.607 Y54.339 E.03167
G1 X157.035 Y33.911 E1.43646
G1 X157.672 Y33.911 E.03167
G1 X137.244 Y54.339 E1.43646
G1 X137.881 Y54.339 E.03167
G1 X158.309 Y33.911 E1.43646
G1 X158.946 Y33.911 E.03167
G1 X138.518 Y54.339 E1.43646
G1 X139.155 Y54.339 E.03167
G1 X159.583 Y33.911 E1.43646
M73 P65 R26
G1 X160.22 Y33.911 E.03167
G1 X139.792 Y54.339 E1.43646
G1 X140.429 Y54.339 E.03167
G1 X160.857 Y33.911 E1.43646
G1 X161.494 Y33.911 E.03167
G1 X141.066 Y54.339 E1.43646
G1 X141.703 Y54.339 E.03167
G1 X162.131 Y33.911 E1.43646
G1 X162.768 Y33.911 E.03167
G1 X142.339 Y54.339 E1.43646
G1 X142.976 Y54.339 E.03167
G1 X163.404 Y33.911 E1.43646
G1 X164.041 Y33.911 E.03167
G1 X143.613 Y54.339 E1.43646
G1 X144.25 Y54.339 E.03167
G1 X164.678 Y33.911 E1.43646
G1 X165.315 Y33.911 E.03167
G1 X144.887 Y54.339 E1.43646
G1 X145.524 Y54.339 E.03167
G1 X165.952 Y33.911 E1.43646
G1 X166.589 Y33.911 E.03167
G1 X146.161 Y54.339 E1.43646
G1 X146.798 Y54.339 E.03167
G1 X167.226 Y33.911 E1.43646
G1 X167.863 Y33.911 E.03167
G1 X147.435 Y54.339 E1.43646
G1 X148.072 Y54.339 E.03167
G1 X168.5 Y33.911 E1.43646
G1 X169.137 Y33.911 E.03167
G1 X148.709 Y54.339 E1.43646
G1 X149.345 Y54.339 E.03167
G1 X169.774 Y33.911 E1.43646
G1 X170.41 Y33.911 E.03167
G1 X149.982 Y54.339 E1.43646
G1 X150.619 Y54.339 E.03167
G1 X171.047 Y33.911 E1.43646
G1 X171.684 Y33.911 E.03167
G1 X151.256 Y54.339 E1.43646
G1 X151.893 Y54.339 E.03167
G1 X172.321 Y33.911 E1.43646
G1 X172.958 Y33.911 E.03167
G1 X152.53 Y54.339 E1.43646
G1 X153.167 Y54.339 E.03167
G1 X173.595 Y33.911 E1.43646
G1 X174.232 Y33.911 E.03167
G1 X153.804 Y54.339 E1.43646
G1 X154.441 Y54.339 E.03167
G1 X174.869 Y33.911 E1.43646
G1 X175.506 Y33.911 E.03167
G1 X155.078 Y54.339 E1.43646
G1 X155.714 Y54.339 E.03167
G1 X176.143 Y33.911 E1.43646
G1 X176.779 Y33.911 E.03167
G1 X156.351 Y54.339 E1.43646
G1 X156.988 Y54.339 E.03167
G1 X177.416 Y33.911 E1.43646
G1 X178.053 Y33.911 E.03167
G1 X157.625 Y54.339 E1.43646
G1 X158.262 Y54.339 E.03167
G1 X178.69 Y33.911 E1.43646
G1 X179.327 Y33.911 E.03167
G1 X158.899 Y54.339 E1.43646
G1 X159.536 Y54.339 E.03167
G1 X179.964 Y33.911 E1.43646
G1 X180.601 Y33.911 E.03167
G1 X160.173 Y54.339 E1.43646
G1 X160.81 Y54.339 E.03167
G1 X181.238 Y33.911 E1.43646
G1 X181.875 Y33.911 E.03167
G1 X161.447 Y54.339 E1.43646
G1 X162.084 Y54.339 E.03167
G1 X182.512 Y33.911 E1.43646
G1 X183.149 Y33.911 E.03167
G1 X162.72 Y54.339 E1.43646
G1 X163.357 Y54.339 E.03167
G1 X183.785 Y33.911 E1.43646
G1 X184.422 Y33.911 E.03167
G1 X163.994 Y54.339 E1.43646
G1 X164.631 Y54.339 E.03167
G1 X185.059 Y33.911 E1.43646
G1 X185.696 Y33.911 E.03167
G1 X165.268 Y54.339 E1.43646
G1 X165.905 Y54.339 E.03167
G1 X186.333 Y33.911 E1.43646
G1 X186.97 Y33.911 E.03167
G1 X166.542 Y54.339 E1.43646
G1 X167.179 Y54.339 E.03167
G1 X187.607 Y33.911 E1.43646
G1 X188.244 Y33.911 E.03167
G1 X167.816 Y54.339 E1.43646
G1 X168.453 Y54.339 E.03167
G1 X188.881 Y33.911 E1.43646
G1 X189.518 Y33.911 E.03167
G1 X169.089 Y54.339 E1.43646
G1 X169.726 Y54.339 E.03167
G1 X190.155 Y33.911 E1.43646
G1 X190.791 Y33.911 E.03167
G1 X170.363 Y54.339 E1.43646
G1 X171 Y54.339 E.03167
G1 X191.428 Y33.911 E1.43646
G1 X192.065 Y33.911 E.03167
G1 X171.637 Y54.339 E1.43646
G1 X172.274 Y54.339 E.03167
G1 X192.702 Y33.911 E1.43646
G1 X193.339 Y33.911 E.03167
G1 X172.911 Y54.339 E1.43646
G1 X173.548 Y54.339 E.03167
G1 X193.976 Y33.911 E1.43646
G1 X194.613 Y33.911 E.03167
G1 X174.185 Y54.339 E1.43646
G1 X174.822 Y54.339 E.03167
G1 X195.25 Y33.911 E1.43646
G1 X195.887 Y33.911 E.03167
G1 X175.459 Y54.339 E1.43646
G1 X176.095 Y54.339 E.03167
G1 X196.524 Y33.911 E1.43646
G1 X197.16 Y33.911 E.03167
G1 X176.732 Y54.339 E1.43646
G1 X177.369 Y54.339 E.03167
G1 X197.797 Y33.911 E1.43646
G1 X198.434 Y33.911 E.03167
G1 X178.006 Y54.339 E1.43646
G1 X178.643 Y54.339 E.03167
G1 X199.071 Y33.911 E1.43646
G1 X199.708 Y33.911 E.03167
G1 X179.28 Y54.339 E1.43646
G1 X179.917 Y54.339 E.03167
G1 X200.345 Y33.911 E1.43646
G1 X200.982 Y33.911 E.03167
G1 X180.554 Y54.339 E1.43646
G1 X181.191 Y54.339 E.03167
G1 X201.619 Y33.911 E1.43646
G1 X202.256 Y33.911 E.03167
G1 X181.828 Y54.339 E1.43646
G1 X182.464 Y54.339 E.03167
G1 X202.893 Y33.911 E1.43646
G1 X203.53 Y33.911 E.03167
G1 X183.101 Y54.339 E1.43646
G1 X183.738 Y54.339 E.03167
G1 X204.166 Y33.911 E1.43646
G1 X204.803 Y33.911 E.03167
G1 X184.375 Y54.339 E1.43646
G1 X185.012 Y54.339 E.03167
G1 X205.44 Y33.911 E1.43646
G1 X206.077 Y33.911 E.03167
G1 X185.649 Y54.339 E1.43646
G1 X186.286 Y54.339 E.03167
G1 X206.714 Y33.911 E1.43646
G1 X207.351 Y33.911 E.03167
G1 X186.923 Y54.339 E1.43646
G1 X187.56 Y54.339 E.03167
G1 X207.988 Y33.911 E1.43646
G1 X208.625 Y33.911 E.03167
G1 X188.197 Y54.339 E1.43646
M73 P66 R26
G1 X188.834 Y54.339 E.03167
G1 X209.262 Y33.911 E1.43646
G1 X209.899 Y33.911 E.03167
G1 X189.47 Y54.339 E1.43646
G1 X190.107 Y54.339 E.03167
G1 X210.535 Y33.911 E1.43646
G1 X211.172 Y33.911 E.03167
G1 X190.744 Y54.339 E1.43646
G1 X191.381 Y54.339 E.03167
G1 X211.809 Y33.911 E1.43646
G1 X212.446 Y33.911 E.03167
G1 X192.018 Y54.339 E1.43646
M73 P66 R25
G1 X192.655 Y54.339 E.03167
G1 X213.083 Y33.911 E1.43646
G1 X213.72 Y33.911 E.03167
G1 X193.292 Y54.339 E1.43646
G1 X193.929 Y54.339 E.03167
G1 X214.357 Y33.911 E1.43646
G1 X214.994 Y33.911 E.03167
G1 X194.566 Y54.339 E1.43646
G1 X195.203 Y54.339 E.03167
G1 X215.631 Y33.911 E1.43646
G1 X216.268 Y33.911 E.03167
G1 X195.839 Y54.339 E1.43646
G1 X196.476 Y54.339 E.03167
G1 X216.905 Y33.911 E1.43646
G1 X217.541 Y33.911 E.03167
G1 X197.113 Y54.339 E1.43646
G1 X197.75 Y54.339 E.03167
G1 X218.178 Y33.911 E1.43646
G1 X218.815 Y33.911 E.03167
G1 X198.387 Y54.339 E1.43646
G1 X199.024 Y54.339 E.03167
G1 X219.452 Y33.911 E1.43646
G1 X220.089 Y33.911 E.03167
G1 X199.661 Y54.339 E1.43646
G1 X200.298 Y54.339 E.03167
G1 X220.726 Y33.911 E1.43646
G1 X221.363 Y33.911 E.03167
G1 X200.732 Y54.542 E1.4507
M106 S102
; WIPE_START
G1 X202.146 Y53.127 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X205.583 Y59.244 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
M106 S229.5
G1 F3000
G1 X217.404 Y47.423 E.83123
G3 X216.519 Y47.672 I-1.175 J-2.481 E.04596
G1 X205.786 Y58.405 E.7547
G1 X205.786 Y57.768 E.03167
G1 X215.846 Y47.707 E.70742
G1 X215.632 Y47.691 E.01069
G3 X215.28 Y47.637 I.362 J-3.528 E.01773
G1 X205.786 Y57.131 E.66758
G1 X205.786 Y56.494 E.03167
G1 X214.783 Y47.497 E.63263
G3 X214.341 Y47.302 I.755 J-2.304 E.02405
G1 X205.786 Y55.857 E.60158
G1 X205.786 Y55.22 E.03167
G1 X213.943 Y47.063 E.5736
G3 X213.589 Y46.78 I3.183 J-4.343 E.02254
G1 X205.786 Y54.583 E.54871
G1 X205.786 Y54.339 E.01213
G1 X205.393 Y54.339 E.01953
G1 X213.277 Y46.455 E.55438
G3 X213.004 Y46.092 I1.676 J-1.546 E.02265
G1 X204.756 Y54.339 E.57993
G1 X204.119 Y54.339 E.03167
G1 X212.77 Y45.688 E.60833
G3 X212.591 Y45.231 I4.962 J-2.214 E.02443
G1 X203.482 Y54.339 E.64048
G1 X202.845 Y54.339 E.03167
G1 X212.464 Y44.72 E.67636
G3 X212.416 Y44.131 I3.913 J-.614 E.02941
G1 X202.209 Y54.339 E.71779
G1 X201.572 Y54.339 E.03167
G1 X212.763 Y43.148 E.78695
M106 S102
; WIPE_START
G1 X211.349 Y44.562 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X215.023 Y40.887 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
M106 S229.5
G1 F3000
G1 X222 Y33.911 E.49056
G1 X222.637 Y33.911 E.03167
G1 X216.001 Y40.547 E.46663
G3 X216.596 Y40.588 I.138 J2.343 E.02978
G1 X223.274 Y33.911 E.46952
G1 X223.91 Y33.911 E.03167
G1 X217.106 Y40.716 E.47851
G3 X217.463 Y40.854 I-.51 J1.858 E.01909
G1 X217.561 Y40.898 E.00532
G1 X224.547 Y33.911 E.49129
G1 X225.184 Y33.911 E.03167
G1 X217.969 Y41.127 E.50739
G3 X218.33 Y41.402 I-1.195 J1.946 E.02264
G1 X225.821 Y33.911 E.52674
G1 X226.214 Y33.911 E.01953
G1 X226.214 Y34.155 E.01213
G1 X218.653 Y41.716 E.53166
G3 X218.938 Y42.068 I-1.623 J1.602 E.02256
G1 X226.214 Y34.792 E.51165
G1 X226.214 Y35.429 E.03167
G1 X219.178 Y42.465 E.49475
G3 X219.371 Y42.909 I-2.641 J1.412 E.0241
G1 X226.214 Y36.066 E.48119
G1 X226.214 Y36.703 E.03167
G1 X219.514 Y43.403 E.47112
G3 X219.581 Y43.973 I-4.776 J.845 E.02857
G1 X226.214 Y37.339 E.46645
G1 X226.214 Y37.976 E.03167
G1 X219.546 Y44.645 E.46889
G3 X219.311 Y45.505 I-3.763 J-.563 E.04445
G1 X219.304 Y45.523 E.00096
G1 X226.214 Y38.613 E.48587
G1 X226.214 Y39.25 E.03167
G1 X205.786 Y59.678 E1.43646
G1 X205.786 Y60.315 E.03167
G1 X226.214 Y39.887 E1.43646
G1 X226.214 Y40.524 E.03167
G1 X205.786 Y60.952 E1.43646
G1 X205.786 Y61.589 E.03167
G1 X226.214 Y41.161 E1.43646
G1 X226.214 Y41.798 E.03167
G1 X205.786 Y62.226 E1.43646
G1 X205.786 Y62.863 E.03167
G1 X226.214 Y42.435 E1.43646
G1 X226.214 Y43.072 E.03167
G1 X205.786 Y63.5 E1.43646
G1 X205.786 Y64.137 E.03167
G1 X226.214 Y43.709 E1.43646
G1 X226.214 Y44.345 E.03167
G1 X205.786 Y64.774 E1.43646
G1 X205.786 Y65.41 E.03167
G1 X226.214 Y44.982 E1.43646
G1 X226.214 Y45.619 E.03167
G1 X205.786 Y66.047 E1.43646
G1 X205.786 Y66.684 E.03167
G1 X226.214 Y46.256 E1.43646
G1 X226.214 Y46.893 E.03167
G1 X205.786 Y67.321 E1.43646
G1 X205.786 Y67.958 E.03167
G1 X226.214 Y47.53 E1.43646
G1 X226.214 Y48.167 E.03167
G1 X205.786 Y68.595 E1.43646
G1 X205.786 Y69.232 E.03167
G1 X226.214 Y48.804 E1.43646
G1 X226.214 Y49.441 E.03167
G1 X205.786 Y69.869 E1.43646
G1 X205.786 Y70.506 E.03167
G1 X226.214 Y50.078 E1.43646
G1 X226.214 Y50.715 E.03167
G1 X205.786 Y71.143 E1.43646
G1 X205.786 Y71.78 E.03167
G1 X226.214 Y51.351 E1.43646
G1 X226.214 Y51.988 E.03167
G1 X205.786 Y72.416 E1.43646
G1 X205.786 Y73.053 E.03167
G1 X226.214 Y52.625 E1.43646
G1 X226.214 Y53.262 E.03167
G1 X205.786 Y73.69 E1.43646
G1 X205.786 Y74.327 E.03167
G1 X226.214 Y53.899 E1.43646
G1 X226.214 Y54.536 E.03167
G1 X205.786 Y74.964 E1.43646
G1 X205.786 Y75.601 E.03167
G1 X226.214 Y55.173 E1.43646
G1 X226.214 Y55.81 E.03167
G1 X205.786 Y76.238 E1.43646
G1 X205.786 Y76.875 E.03167
G1 X226.214 Y56.447 E1.43646
G1 X226.214 Y57.084 E.03167
G1 X205.786 Y77.512 E1.43646
G1 X205.786 Y78.149 E.03167
G1 X226.214 Y57.72 E1.43646
G1 X226.214 Y58.357 E.03167
G1 X205.786 Y78.785 E1.43646
G1 X205.786 Y79.422 E.03167
G1 X226.214 Y58.994 E1.43646
G1 X226.214 Y59.631 E.03167
G1 X205.786 Y80.059 E1.43646
G1 X205.786 Y80.696 E.03167
G1 X226.214 Y60.268 E1.43646
G1 X226.214 Y60.905 E.03167
G1 X205.786 Y81.333 E1.43646
G1 X205.786 Y81.97 E.03167
G1 X226.214 Y61.542 E1.43646
G1 X226.214 Y62.179 E.03167
G1 X205.786 Y82.607 E1.43646
G1 X205.786 Y83.244 E.03167
G1 X226.214 Y62.816 E1.43646
G1 X226.214 Y63.453 E.03167
G1 X205.786 Y83.881 E1.43646
G1 X205.786 Y84.518 E.03167
G1 X226.214 Y64.09 E1.43646
G1 X226.214 Y64.726 E.03167
G1 X205.786 Y85.155 E1.43646
G1 X205.786 Y85.791 E.03167
G1 X226.214 Y65.363 E1.43646
G1 X226.214 Y66 E.03167
G1 X205.786 Y86.428 E1.43646
G1 X205.786 Y87.065 E.03167
G1 X226.214 Y66.637 E1.43646
M73 P67 R25
G1 X226.214 Y67.274 E.03167
G1 X205.786 Y87.702 E1.43646
G1 X205.786 Y88.339 E.03167
G1 X226.214 Y67.911 E1.43646
G1 X226.214 Y68.548 E.03167
G1 X205.786 Y88.976 E1.43646
G1 X205.786 Y89.613 E.03167
G1 X226.214 Y69.185 E1.43646
G1 X226.214 Y69.822 E.03167
G1 X205.786 Y90.25 E1.43646
G1 X205.786 Y90.887 E.03167
G1 X226.214 Y70.459 E1.43646
G1 X226.214 Y71.095 E.03167
G1 X205.786 Y91.524 E1.43646
G1 X205.786 Y92.16 E.03167
G1 X226.214 Y71.732 E1.43646
G1 X226.214 Y72.369 E.03167
G1 X205.786 Y92.797 E1.43646
G1 X205.786 Y93.434 E.03167
G1 X226.214 Y73.006 E1.43646
G1 X226.214 Y73.643 E.03167
G1 X205.786 Y94.071 E1.43646
G1 X205.786 Y94.708 E.03167
G1 X226.214 Y74.28 E1.43646
G1 X226.214 Y74.917 E.03167
G1 X205.786 Y95.345 E1.43646
G1 X205.786 Y95.982 E.03167
G1 X226.214 Y75.554 E1.43646
G1 X226.214 Y76.191 E.03167
G1 X205.786 Y96.619 E1.43646
G1 X205.786 Y97.256 E.03167
G1 X226.214 Y76.828 E1.43646
G1 X226.214 Y77.465 E.03167
G1 X205.786 Y97.893 E1.43646
G1 X205.786 Y98.53 E.03167
G1 X226.214 Y78.101 E1.43646
G1 X226.214 Y78.738 E.03167
G1 X205.786 Y99.166 E1.43646
G1 X205.786 Y99.803 E.03167
G1 X226.214 Y79.375 E1.43646
G1 X226.214 Y80.012 E.03167
G1 X205.786 Y100.44 E1.43646
G1 X205.786 Y101.077 E.03167
G1 X226.214 Y80.649 E1.43646
G1 X226.214 Y81.286 E.03167
G1 X205.786 Y101.714 E1.43646
G1 X205.786 Y102.351 E.03167
G1 X226.214 Y81.923 E1.43646
G1 X226.214 Y82.56 E.03167
G1 X205.786 Y102.988 E1.43646
G1 X205.786 Y103.625 E.03167
G1 X226.214 Y83.197 E1.43646
G1 X226.214 Y83.834 E.03167
G1 X205.786 Y104.262 E1.43646
G1 X205.786 Y104.899 E.03167
G1 X226.214 Y84.47 E1.43646
G1 X226.214 Y85.107 E.03167
G1 X205.786 Y105.536 E1.43646
G1 X205.786 Y106.172 E.03167
M73 P67 R24
G1 X226.214 Y85.744 E1.43646
G1 X226.214 Y86.381 E.03167
G1 X205.786 Y106.809 E1.43646
G1 X205.786 Y107.446 E.03167
G1 X226.214 Y87.018 E1.43646
G1 X226.214 Y87.655 E.03167
G1 X205.786 Y108.083 E1.43646
G1 X205.786 Y108.72 E.03167
G1 X226.214 Y88.292 E1.43646
G1 X226.214 Y88.929 E.03167
G1 X205.786 Y109.357 E1.43646
G1 X205.786 Y109.994 E.03167
G1 X226.214 Y89.566 E1.43646
G1 X226.214 Y90.203 E.03167
G1 X205.786 Y110.631 E1.43646
G1 X205.786 Y111.268 E.03167
G1 X226.214 Y90.84 E1.43646
G1 X226.214 Y91.476 E.03167
G1 X205.786 Y111.905 E1.43646
G1 X205.786 Y112.541 E.03167
G1 X226.214 Y92.113 E1.43646
G1 X226.214 Y92.75 E.03167
G1 X205.786 Y113.178 E1.43646
G1 X205.786 Y113.815 E.03167
G1 X226.214 Y93.387 E1.43646
G1 X226.214 Y94.024 E.03167
G1 X205.786 Y114.452 E1.43646
G1 X205.786 Y115.089 E.03167
G1 X226.214 Y94.661 E1.43646
G1 X226.214 Y95.298 E.03167
G1 X205.786 Y115.726 E1.43646
G1 X205.786 Y116.363 E.03167
G1 X226.214 Y95.935 E1.43646
G1 X226.214 Y96.572 E.03167
G1 X205.786 Y117 E1.43646
G1 X205.786 Y117.637 E.03167
G1 X226.214 Y97.209 E1.43646
G1 X226.214 Y97.845 E.03167
G1 X205.786 Y118.274 E1.43646
G1 X205.786 Y118.911 E.03167
G1 X226.214 Y98.482 E1.43646
G1 X226.214 Y99.119 E.03167
G1 X205.786 Y119.547 E1.43646
G1 X205.786 Y120.184 E.03167
G1 X226.214 Y99.756 E1.43646
G1 X226.214 Y100.393 E.03167
G1 X205.786 Y120.821 E1.43646
G1 X205.786 Y121.458 E.03167
G1 X226.214 Y101.03 E1.43646
G1 X226.214 Y101.667 E.03167
G1 X205.786 Y122.095 E1.43646
G1 X205.786 Y122.732 E.03167
G1 X226.214 Y102.304 E1.43646
G1 X226.214 Y102.941 E.03167
G1 X205.786 Y123.369 E1.43646
G1 X205.786 Y124.006 E.03167
G1 X226.214 Y103.578 E1.43646
G1 X226.214 Y104.215 E.03167
G1 X205.786 Y124.643 E1.43646
G1 X205.786 Y125.28 E.03167
G1 X226.214 Y104.851 E1.43646
G1 X226.214 Y105.488 E.03167
G1 X205.786 Y125.916 E1.43646
G1 X205.786 Y126.553 E.03167
G1 X226.214 Y106.125 E1.43646
G1 X226.214 Y106.762 E.03167
G1 X205.786 Y127.19 E1.43646
G1 X205.786 Y127.827 E.03167
G1 X226.214 Y107.399 E1.43646
G1 X226.214 Y108.036 E.03167
G1 X205.786 Y128.464 E1.43646
G1 X205.786 Y129.101 E.03167
G1 X226.214 Y108.673 E1.43646
G1 X226.214 Y109.31 E.03167
G1 X205.786 Y129.738 E1.43646
G1 X205.786 Y130.375 E.03167
G1 X226.214 Y109.947 E1.43646
G1 X226.214 Y110.584 E.03167
G1 X205.583 Y131.214 E1.4507
M106 S102
G1 X205.583 Y140.768 F30000
M106 S229.5
G1 F3000
G1 X216.875 Y129.476 E.794
G3 X216.133 Y129.582 I-.969 J-4.162 E.03733
G1 X205.786 Y139.928 E.72757
G1 X205.786 Y139.291 E.03167
G1 X215.523 Y129.555 E.68466
G3 X214.999 Y129.441 I.305 J-2.671 E.02667
G1 X205.786 Y138.655 E.64786
G1 X205.786 Y138.018 E.03167
G1 X214.531 Y129.273 E.6149
G3 X214.117 Y129.05 I2.523 J-5.171 E.02338
G1 X205.786 Y137.381 E.58581
G1 X205.786 Y136.744 E.03167
G1 X213.745 Y128.785 E.55964
G3 X213.412 Y128.481 I1.378 J-1.846 E.02245
M73 P68 R24
G1 X205.786 Y136.107 E.53621
G1 X205.786 Y135.47 E.03167
G1 X213.119 Y128.137 E.51567
G3 X212.871 Y127.748 I1.822 J-1.437 E.02297
G1 X205.786 Y134.833 E.49822
G1 X205.786 Y134.196 E.03167
G1 X212.666 Y127.316 E.48378
G3 X212.512 Y126.833 I4.09 J-1.566 E.02523
G1 X205.786 Y133.559 E.47297
G1 X205.786 Y132.922 E.03167
G1 X212.427 Y126.282 E.46696
G3 X212.435 Y125.637 I3.695 J-.276 E.03212
G1 X205.786 Y132.286 E.46753
G1 X205.786 Y131.649 E.03167
G1 X212.613 Y124.821 E.48008
G3 X214.701 Y122.66 I3.367 J1.163 E.15423
G1 X214.822 Y122.612 E.00648
G1 X226.214 Y111.22 E.80106
G1 X226.214 Y111.857 E.03167
G1 X215.638 Y122.433 E.74368
G3 X216.263 Y122.421 I.397 J4.327 E.03111
G1 X216.284 Y122.424 E.00107
G1 X226.214 Y112.494 E.69823
G1 X226.214 Y113.131 E.03167
G1 X216.831 Y122.514 E.65977
G3 X217.319 Y122.663 I-1.281 J5.045 E.02536
G1 X226.214 Y113.768 E.6255
G1 X226.214 Y114.405 E.03167
G1 X217.748 Y122.871 E.59531
G3 X218.087 Y123.087 I-.908 J1.803 E.02003
G1 X218.135 Y123.121 E.00291
G1 X226.214 Y115.042 E.56811
G1 X226.214 Y115.679 E.03167
G1 X218.482 Y123.411 E.54369
G3 X218.786 Y123.743 I-3.96 J3.929 E.02242
G1 X226.214 Y116.316 E.52229
G1 X226.214 Y116.953 E.03167
G1 X219.049 Y124.117 E.5038
G3 X219.271 Y124.533 I-1.962 J1.314 E.02345
G1 X226.214 Y117.59 E.48822
G1 X226.214 Y118.226 E.03167
G1 X219.443 Y124.998 E.47614
G1 X219.473 Y125.115 E.00601
G3 X219.553 Y125.525 I-2.005 J.603 E.02081
G1 X226.214 Y118.863 E.46842
G1 X226.214 Y119.5 E.03167
G1 X219.582 Y126.133 E.46638
G3 X219.475 Y126.876 I-3.611 J-.138 E.03741
G1 X226.214 Y120.137 E.47388
G1 X226.214 Y120.774 E.03167
G1 X205.786 Y141.202 E1.43646
G1 X205.786 Y141.839 E.03167
G1 X226.214 Y121.411 E1.43646
G1 X226.214 Y122.048 E.03167
G1 X205.786 Y142.476 E1.43646
G1 X205.786 Y143.113 E.03167
G1 X226.214 Y122.685 E1.43646
G1 X226.214 Y123.322 E.03167
G1 X205.786 Y143.75 E1.43646
G1 X205.786 Y144.387 E.03167
G1 X226.214 Y123.959 E1.43646
G1 X226.214 Y124.595 E.03167
G1 X205.786 Y145.024 E1.43646
G1 X205.786 Y145.661 E.03167
G1 X226.214 Y125.232 E1.43646
G1 X226.214 Y125.869 E.03167
G1 X205.786 Y146.297 E1.43646
G1 X205.786 Y146.934 E.03167
G1 X226.214 Y126.506 E1.43646
G1 X226.214 Y127.143 E.03167
G1 X205.786 Y147.571 E1.43646
G1 X205.786 Y148.208 E.03167
G1 X226.214 Y127.78 E1.43646
G1 X226.214 Y128.417 E.03167
G1 X205.786 Y148.845 E1.43646
G1 X205.786 Y149.482 E.03167
G1 X226.214 Y129.054 E1.43646
G1 X226.214 Y129.691 E.03167
G1 X205.786 Y150.119 E1.43646
G1 X205.786 Y150.756 E.03167
G1 X226.214 Y130.328 E1.43646
G1 X226.214 Y130.965 E.03167
G1 X205.786 Y151.393 E1.43646
G1 X205.786 Y152.03 E.03167
G1 X226.214 Y131.601 E1.43646
G1 X226.214 Y132.238 E.03167
G1 X205.786 Y152.666 E1.43646
G1 X205.786 Y153.303 E.03167
G1 X226.214 Y132.875 E1.43646
G1 X226.214 Y133.512 E.03167
G1 X205.786 Y153.94 E1.43646
G1 X205.786 Y154.577 E.03167
G1 X226.214 Y134.149 E1.43646
G1 X226.214 Y134.786 E.03167
G1 X205.786 Y155.214 E1.43646
G1 X205.786 Y155.851 E.03167
G1 X226.214 Y135.423 E1.43646
G1 X226.214 Y136.06 E.03167
G1 X205.786 Y156.488 E1.43646
G1 X205.786 Y157.125 E.03167
G1 X226.214 Y136.697 E1.43646
G1 X226.214 Y137.334 E.03167
G1 X205.786 Y157.762 E1.43646
G1 X205.786 Y158.399 E.03167
G1 X226.214 Y137.971 E1.43646
G1 X226.214 Y138.607 E.03167
G1 X205.786 Y159.036 E1.43646
G1 X205.786 Y159.672 E.03167
G1 X226.214 Y139.244 E1.43646
G1 X226.214 Y139.881 E.03167
G1 X205.786 Y160.309 E1.43646
G1 X205.786 Y160.946 E.03167
G1 X226.214 Y140.518 E1.43646
G1 X226.214 Y141.155 E.03167
G1 X205.786 Y161.583 E1.43646
G1 X205.786 Y162.22 E.03167
G1 X226.214 Y141.792 E1.43646
G1 X226.214 Y142.429 E.03167
G1 X205.786 Y162.857 E1.43646
G1 X205.786 Y163.494 E.03167
G1 X226.214 Y143.066 E1.43646
G1 X226.214 Y143.703 E.03167
G1 X205.786 Y164.131 E1.43646
G1 X205.786 Y164.768 E.03167
G1 X226.214 Y144.34 E1.43646
G1 X226.214 Y144.976 E.03167
G1 X205.786 Y165.405 E1.43646
G1 X205.786 Y166.041 E.03167
G1 X226.214 Y145.613 E1.43646
G1 X226.214 Y146.25 E.03167
G1 X205.786 Y166.678 E1.43646
G1 X205.786 Y167.315 E.03167
G1 X226.214 Y146.887 E1.43646
G1 X226.214 Y147.524 E.03167
G1 X205.786 Y167.952 E1.43646
G1 X205.786 Y168.589 E.03167
G1 X226.214 Y148.161 E1.43646
G1 X226.214 Y148.798 E.03167
G1 X205.786 Y169.226 E1.43646
G1 X205.786 Y169.863 E.03167
G1 X226.214 Y149.435 E1.43646
G1 X226.214 Y150.072 E.03167
G1 X205.786 Y170.5 E1.43646
G1 X205.786 Y171.137 E.03167
G1 X226.214 Y150.709 E1.43646
M73 P68 R23
G1 X226.214 Y151.346 E.03167
G1 X205.786 Y171.774 E1.43646
G1 X205.786 Y172.411 E.03167
G1 X226.214 Y151.982 E1.43646
G1 X226.214 Y152.619 E.03167
G1 X205.786 Y173.047 E1.43646
G1 X205.786 Y173.684 E.03167
G1 X226.214 Y153.256 E1.43646
G1 X226.214 Y153.893 E.03167
G1 X205.786 Y174.321 E1.43646
G1 X205.786 Y174.958 E.03167
G1 X226.214 Y154.53 E1.43646
G1 X226.214 Y155.167 E.03167
G1 X205.786 Y175.595 E1.43646
G1 X205.786 Y176.232 E.03167
G1 X226.214 Y155.804 E1.43646
G1 X226.214 Y156.441 E.03167
G1 X205.786 Y176.869 E1.43646
G1 X205.786 Y177.506 E.03167
G1 X226.214 Y157.078 E1.43646
G1 X226.214 Y157.715 E.03167
G1 X205.786 Y178.143 E1.43646
G1 X205.786 Y178.78 E.03167
G1 X226.214 Y158.351 E1.43646
G1 X226.214 Y158.988 E.03167
G1 X205.786 Y179.416 E1.43646
G1 X205.786 Y180.053 E.03167
G1 X226.214 Y159.625 E1.43646
G1 X226.214 Y160.262 E.03167
G1 X205.786 Y180.69 E1.43646
G1 X205.786 Y181.327 E.03167
G1 X226.214 Y160.899 E1.43646
G1 X226.214 Y161.536 E.03167
G1 X205.786 Y181.964 E1.43646
G1 X205.786 Y182.601 E.03167
G1 X226.214 Y162.173 E1.43646
G1 X226.214 Y162.81 E.03167
G1 X205.786 Y183.238 E1.43646
G1 X205.786 Y183.875 E.03167
G1 X226.214 Y163.447 E1.43646
G1 X226.214 Y164.084 E.03167
G1 X205.786 Y184.512 E1.43646
G1 X205.786 Y185.149 E.03167
G1 X226.214 Y164.721 E1.43646
G1 X226.214 Y165.357 E.03167
G1 X205.786 Y185.786 E1.43646
G1 X205.786 Y186.422 E.03167
G1 X226.214 Y165.994 E1.43646
M73 P69 R23
G1 X226.214 Y166.631 E.03167
G1 X205.786 Y187.059 E1.43646
G1 X205.786 Y187.696 E.03167
G1 X226.214 Y167.268 E1.43646
G1 X226.214 Y167.905 E.03167
G1 X205.786 Y188.333 E1.43646
G1 X205.786 Y188.97 E.03167
G1 X226.214 Y168.542 E1.43646
G1 X226.214 Y169.179 E.03167
G1 X205.786 Y189.607 E1.43646
G1 X205.786 Y190.244 E.03167
G1 X226.214 Y169.816 E1.43646
G1 X226.214 Y170.453 E.03167
G1 X205.786 Y190.881 E1.43646
G1 X205.786 Y191.518 E.03167
G1 X226.214 Y171.09 E1.43646
G1 X226.214 Y171.726 E.03167
G1 X205.786 Y192.155 E1.43646
G1 X205.786 Y192.791 E.03167
G1 X226.214 Y172.363 E1.43646
G1 X226.214 Y173 E.03167
G1 X205.786 Y193.428 E1.43646
G1 X205.786 Y194.065 E.03167
G1 X226.214 Y173.637 E1.43646
G1 X226.214 Y174.274 E.03167
G1 X205.786 Y194.702 E1.43646
G1 X205.786 Y195.339 E.03167
G1 X226.214 Y174.911 E1.43646
G1 X226.214 Y175.548 E.03167
G1 X205.786 Y195.976 E1.43646
G1 X205.786 Y196.613 E.03167
G1 X226.214 Y176.185 E1.43646
G1 X226.214 Y176.822 E.03167
G1 X205.583 Y197.452 E1.4507
M106 S102
; WIPE_START
G1 X206.998 Y196.038 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X200.697 Y191.73 Z2.6 F30000
G1 X29.583 Y74.744 Z2.6
G1 Z2.2
G1 E.8 F1800
M106 S229.5
G1 F3000
G1 X70.416 Y33.911 E2.87127
G1 X69.779 Y33.911 E.03167
G1 X29.786 Y73.904 E2.81224
G1 X29.786 Y73.267 E.03167
G1 X69.143 Y33.911 E2.76746
G1 X68.506 Y33.911 E.03167
G1 X29.786 Y72.631 E2.72267
G1 X29.786 Y71.994 E.03167
G1 X67.869 Y33.911 E2.67789
G1 X67.232 Y33.911 E.03167
G1 X29.786 Y71.357 E2.6331
G1 X29.786 Y70.72 E.03167
G1 X66.595 Y33.911 E2.58832
G1 X65.958 Y33.911 E.03167
G1 X29.786 Y70.083 E2.54353
G1 X29.786 Y69.446 E.03167
G1 X65.321 Y33.911 E2.49874
G1 X64.684 Y33.911 E.03167
G1 X29.786 Y68.809 E2.45396
G1 X29.786 Y68.172 E.03167
G1 X64.047 Y33.911 E2.40917
G1 X63.41 Y33.911 E.03167
G1 X29.786 Y67.535 E2.36439
G1 X29.786 Y66.898 E.03167
G1 X62.773 Y33.911 E2.3196
G1 X62.137 Y33.911 E.03167
G1 X29.786 Y66.262 E2.27482
G1 X29.786 Y65.625 E.03167
G1 X61.5 Y33.911 E2.23003
G1 X60.863 Y33.911 E.03167
G1 X29.786 Y64.988 E2.18524
G1 X29.786 Y64.351 E.03167
G1 X60.226 Y33.911 E2.14046
G1 X59.589 Y33.911 E.03167
G1 X29.786 Y63.714 E2.09567
G1 X29.786 Y63.077 E.03167
G1 X58.952 Y33.911 E2.05089
G1 X58.315 Y33.911 E.03167
G1 X29.786 Y62.44 E2.0061
G1 X29.786 Y61.803 E.03167
G1 X57.678 Y33.911 E1.96132
G1 X57.041 Y33.911 E.03167
G1 X29.786 Y61.166 E1.91653
G1 X29.786 Y60.529 E.03167
G1 X56.404 Y33.911 E1.87175
G1 X55.767 Y33.911 E.03167
G1 X29.786 Y59.892 E1.82696
G1 X29.786 Y59.256 E.03167
G1 X55.131 Y33.911 E1.78217
G1 X54.494 Y33.911 E.03167
G1 X43.499 Y44.905 E.77309
G2 X43.585 Y44.182 I-3.928 J-.833 E.03624
G1 X53.857 Y33.911 E.72227
G1 X53.22 Y33.911 E.03167
G1 X43.543 Y43.588 E.68044
G2 X43.428 Y43.066 I-5.197 J.872 E.02658
G1 X52.583 Y33.911 E.64374
G1 X51.946 Y33.911 E.03167
G1 X43.248 Y42.609 E.61165
G2 X43.022 Y42.198 I-2.17 J.922 E.02337
G1 X51.309 Y33.911 E.58272
G1 X50.672 Y33.911 E.03167
G1 X42.756 Y41.828 E.55668
G2 X42.444 Y41.502 I-4.533 J4.027 E.0224
G1 X50.035 Y33.911 E.5338
G1 X49.398 Y33.911 E.03167
G1 X42.093 Y41.216 E.51368
G2 X41.703 Y40.97 I-1.428 J1.833 E.023
G1 X48.762 Y33.911 E.49637
G1 X48.125 Y33.911 E.03167
G1 X41.266 Y40.77 E.48229
G1 X41.061 Y40.701 E.01072
G2 X40.773 Y40.626 I-.736 J2.222 E.01483
G1 X47.488 Y33.911 E.47216
G1 X46.851 Y33.911 E.03167
G1 X40.215 Y40.546 E.46659
G1 X39.561 Y40.564 E.03257
G1 X46.214 Y33.911 E.46784
G1 X45.577 Y33.911 E.03167
G1 X38.704 Y40.784 E.48328
G2 X36.656 Y42.832 I1.301 J3.349 E.14824
G1 X29.786 Y49.702 E.48308
G1 X29.786 Y50.339 E.03167
G1 X36.443 Y43.682 E.46809
G2 X36.42 Y44.342 I4.266 J.477 E.03285
G1 X29.786 Y50.976 E.4665
G1 X29.786 Y51.613 E.03167
G1 X36.5 Y44.898 E.47213
G2 X36.645 Y45.391 I4.637 J-1.092 E.02553
G1 X29.786 Y52.25 E.48228
M73 P69 R22
G1 X29.786 Y52.887 E.03167
M73 P70 R22
G1 X36.846 Y45.826 E.49644
G2 X37.09 Y46.219 I2.087 J-1.027 E.02303
G1 X29.786 Y53.523 E.51363
G1 X29.786 Y54.16 E.03167
G1 X37.375 Y46.571 E.53366
G2 X37.705 Y46.878 I1.701 J-1.494 E.02244
G1 X29.786 Y54.797 E.55684
G1 X29.786 Y55.434 E.03167
G1 X38.073 Y47.147 E.58275
G2 X38.483 Y47.374 I1.342 J-1.932 E.02333
G1 X29.786 Y56.071 E.61153
G1 X29.786 Y56.708 E.03167
G1 X38.943 Y47.551 E.64393
G2 X39.462 Y47.669 I.852 J-2.533 E.02648
G1 X29.786 Y57.345 E.68038
G1 X29.786 Y57.982 E.03167
G1 X40.059 Y47.708 E.7224
G2 X40.782 Y47.622 I-.062 J-3.599 E.03626
G1 X29.583 Y58.821 E.78747
M106 S102
G1 X29.583 Y49.268 F30000
M106 S229.5
G1 F3000
G1 X44.94 Y33.911 E1.07984
G1 X44.303 Y33.911 E.03167
G1 X29.786 Y48.428 E1.02082
G1 X29.786 Y47.791 E.03167
G1 X43.666 Y33.911 E.97603
G1 X43.029 Y33.911 E.03167
G1 X29.786 Y47.154 E.93125
G1 X29.786 Y46.517 E.03167
G1 X42.392 Y33.911 E.88646
G1 X41.756 Y33.911 E.03167
G1 X29.786 Y45.881 E.84168
G1 X29.786 Y45.244 E.03167
G1 X41.119 Y33.911 E.79689
G1 X40.482 Y33.911 E.03167
G1 X29.786 Y44.607 E.7521
G1 X29.786 Y43.97 E.03167
G1 X39.845 Y33.911 E.70732
G1 X39.208 Y33.911 E.03167
G1 X29.786 Y43.333 E.66253
G1 X29.786 Y42.696 E.03167
G1 X38.571 Y33.911 E.61775
G1 X37.934 Y33.911 E.03167
G1 X29.786 Y42.059 E.57296
G1 X29.786 Y41.422 E.03167
G1 X37.297 Y33.911 E.52818
G1 X36.66 Y33.911 E.03167
G1 X29.786 Y40.785 E.48339
G1 X29.786 Y40.148 E.03167
G1 X36.023 Y33.911 E.43861
G1 X35.387 Y33.911 E.03167
G1 X29.786 Y39.512 E.39382
G1 X29.786 Y38.875 E.03167
G1 X34.75 Y33.911 E.34903
G1 X34.113 Y33.911 E.03167
G1 X29.786 Y38.238 E.30425
G1 X29.786 Y37.601 E.03167
G1 X33.476 Y33.911 E.25946
G1 X32.839 Y33.911 E.03167
G1 X29.786 Y36.964 E.21468
G1 X29.786 Y36.327 E.03167
G1 X32.202 Y33.911 E.16989
G1 X31.565 Y33.911 E.03167
G1 X29.786 Y35.69 E.12511
G1 X29.786 Y35.053 E.03167
G1 X30.928 Y33.911 E.08032
G1 X30.291 Y33.911 E.03167
G1 X29.583 Y34.619 E.04977
M106 S102
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X30.291 Y33.911 E-.38039
G1 X30.928 Y33.911 E-.24203
G1 X30.672 Y34.167 E-.13758
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
G1 X128.156 Y204.666
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X128.24 Y204.67 E.00272
G3 X129.176 Y204.879 I-.245 J3.289 E.03094
G3 X127.807 Y204.666 I-1.167 J2.996 E.60471
G1 X128.096 Y204.666 E.00928
G1 X128.155 Y205.072 F30000
G1 F8843.478
G1 X128.21 Y205.073 E.00178
G3 X128.761 Y205.17 I-.192 J2.723 E.01803
G3 X127.838 Y205.072 I-.752 J2.706 E.53749
G1 X128.095 Y205.072 E.00827
G1 X128.214 Y205.485 F30000
G1 F8843.478
G1 X128.651 Y205.562 E.01425
G3 X127.868 Y205.478 I-.643 J2.314 E.45978
G3 X128.155 Y205.489 I.011 J3.598 E.00923
G1 X128.13 Y205.87 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.15 Y205.873 E.0006
G3 X128.349 Y205.895 I-.155 J2.242 E.00597
G3 X127.898 Y205.869 I-.34 J1.98 E.36242
G1 X128.07 Y205.87 E.00513
; WIPE_START
M204 S10000
G1 X128.15 Y205.873 E-.03043
G1 X128.349 Y205.895 E-.07613
G1 X128.734 Y206.004 E-.15214
G1 X128.917 Y206.086 E-.07614
G1 X129.253 Y206.303 E-.1521
G1 X129.54 Y206.583 E-.15214
G1 X129.719 Y206.846 E-.12092
; WIPE_END
G1 E-.04 F1800
G1 X122.089 Y206.661 Z2.8 F30000
G1 X39.895 Y204.666 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X40.24 Y204.67 E.01109
G3 X41.176 Y204.879 I-.245 J3.289 E.03094
G3 X39.807 Y204.666 I-1.167 J2.996 E.60471
G1 X39.835 Y204.666 E.00091
G1 X39.714 Y205.089 F30000
G1 F8843.478
G1 X39.838 Y205.072 E.004
G3 X40.761 Y205.17 I.18 J2.724 E.03001
G3 X39.376 Y205.14 I-.752 J2.706 E.52246
G1 X39.655 Y205.098 E.00909
G1 X39.808 Y205.486 F30000
G1 F8843.478
G1 X39.868 Y205.478 E.00195
G3 X40.651 Y205.562 I.011 J3.598 E.02536
G3 X39.466 Y205.536 I-.643 J2.314 E.44671
G1 X39.749 Y205.495 E.00918
G1 X39.897 Y205.869 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X39.898 Y205.869 E.00003
G3 X40.349 Y205.895 I.097 J2.245 E.01349
G3 X39.553 Y205.918 I-.34 J1.98 E.35205
G1 X39.837 Y205.878 E.00854
; WIPE_START
M204 S10000
G1 X39.898 Y205.869 E-.02321
G1 X39.898 Y205.869 E0
G1 X40.15 Y205.87 E-.09595
G1 X40.349 Y205.895 E-.07617
G1 X40.734 Y206.004 E-.15214
G1 X40.917 Y206.086 E-.07611
G1 X41.253 Y206.303 E-.15213
G1 X41.54 Y206.583 E-.15214
G1 X41.588 Y206.653 E-.03215
; WIPE_END
G1 E-.04 F1800
G1 X41.314 Y199.025 Z2.8 F30000
G1 X38.589 Y123.112 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X38.679 Y123.073 E.00317
G3 X39.807 Y122.791 I1.329 J2.927 E.03759
G3 X41.176 Y123.004 I.188 J3.294 E.04486
G3 X38.395 Y123.22 I-1.167 J2.996 E.55683
G1 X38.536 Y123.141 E.00521
G1 X39.14 Y123.326 F30000
G1 F8843.478
G1 X39.376 Y123.265 E.00783
G3 X39.838 Y123.197 I.634 J2.736 E.01503
G3 X40.761 Y123.295 I.18 J2.726 E.03
G3 X39.085 Y123.349 I-.752 J2.706 E.51273
G1 X39.569 Y123.644 F30000
G1 F8843.478
G1 X39.868 Y123.603 E.00972
G3 X40.651 Y123.687 I.01 J3.604 E.02535
G3 X39.466 Y123.661 I-.643 J2.314 E.44671
G1 X39.51 Y123.654 E.00142
G1 X39.904 Y123.994 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X40.15 Y123.998 E.00732
G3 X40.349 Y124.02 I-.155 J2.24 E.00597
G3 X39.844 Y123.998 I-.341 J1.98 E.36083
; WIPE_START
M204 S10000
G1 X40.15 Y123.998 E-.11614
G1 X40.349 Y124.02 E-.07614
G1 X40.734 Y124.129 E-.15213
G1 X41.091 Y124.311 E-.15214
G1 X41.404 Y124.561 E-.15207
G1 X41.592 Y124.785 E-.11138
; WIPE_END
G1 E-.04 F1800
G1 X48.571 Y127.874 Z2.8 F30000
G1 X205.416 Y197.291 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X50.584 Y197.291 E4.97885
G1 X50.584 Y54.709 E4.58493
G1 X205.416 Y54.709 E4.97885
G1 X205.416 Y197.231 E4.583
G1 X205.009 Y196.884 F30000
G1 F8843.478
G1 X50.991 Y196.884 E4.95267
G1 X50.991 Y55.116 E4.55875
G1 X205.009 Y55.116 E4.95267
G1 X205.009 Y196.824 E4.55682
G1 X204.602 Y196.477 F30000
G1 F8843.478
G1 X51.398 Y196.477 E4.92649
G1 X51.398 Y55.523 E4.53257
G1 X204.602 Y55.523 E4.92649
G1 X204.602 Y196.417 E4.53064
G1 X204.21 Y196.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X51.79 Y196.085 E4.54007
G1 X51.79 Y55.915 E4.17519
G1 X204.21 Y55.915 E4.54007
G1 X204.21 Y196.025 E4.1734
; WIPE_START
M204 S10000
G1 X202.21 Y196.026 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X196.705 Y190.739 Z2.8 F30000
G1 X40.787 Y41.008 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X40.871 Y41.029 E.0028
G3 X41.176 Y41.129 I-.876 J3.181 E.01031
G3 X39.807 Y40.916 I-1.167 J2.996 E.60473
G3 X40.558 Y40.959 I.188 J3.294 E.02424
G1 X40.728 Y40.995 E.00558
G1 X40.48 Y41.356 F30000
G1 F8843.478
G1 X40.488 Y41.357 E.00027
G3 X40.761 Y41.42 I-.471 J2.691 E.00901
G3 X39.838 Y41.322 I-.752 J2.706 E.53751
G3 X40.21 Y41.323 I.18 J2.726 E.01197
G1 X40.42 Y41.349 E.00681
G1 X40.19 Y41.731 F30000
G1 F8843.478
G1 X40.651 Y41.812 E.01506
G3 X39.868 Y41.728 I-.643 J2.314 E.45979
G3 X40.134 Y41.737 I.01 J3.604 E.00853
G1 X39.846 Y42.126 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X39.898 Y42.119 E.00155
G3 X40.349 Y42.145 I.097 J2.243 E.01349
G3 X39.553 Y42.168 I-.341 J1.98 E.35205
G1 X39.787 Y42.135 E.00702
; WIPE_START
M204 S10000
G1 X39.898 Y42.119 E-.0426
G1 X39.898 Y42.119 E0
G1 X40.15 Y42.12 E-.09595
G1 X40.349 Y42.145 E-.07618
G1 X40.544 Y42.19 E-.07613
G1 X40.917 Y42.336 E-.1521
G1 X41.253 Y42.553 E-.15212
G1 X41.54 Y42.833 E-.15214
G1 X41.559 Y42.861 E-.01276
; WIPE_END
G1 E-.04 F1800
G1 X49.19 Y42.715 Z2.8 F30000
G1 X126.589 Y41.237 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X126.679 Y41.198 E.00317
G3 X127.807 Y40.916 I1.329 J2.927 E.03759
G3 X129.176 Y41.129 I.188 J3.294 E.04486
G3 X126.395 Y41.345 I-1.167 J2.996 E.55683
G1 X126.536 Y41.266 E.00521
G1 X127.14 Y41.451 F30000
G1 F8843.478
G1 X127.376 Y41.39 E.00782
G3 X127.838 Y41.322 I.634 J2.736 E.01504
G3 X128.761 Y41.42 I.18 J2.726 E.03
G3 X127.085 Y41.474 I-.752 J2.706 E.51273
G1 X127.569 Y41.768 F30000
G1 F8843.478
G1 X127.868 Y41.728 E.00971
G3 X128.651 Y41.812 I.01 J3.604 E.02535
G3 X127.466 Y41.786 I-.643 J2.314 E.44671
G1 X127.51 Y41.779 E.00143
G1 X127.904 Y42.119 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.15 Y42.123 E.00732
G3 X128.349 Y42.145 I-.155 J2.24 E.00597
G3 X127.845 Y42.123 I-.341 J1.98 E.36083
; WIPE_START
M204 S10000
G1 X128.15 Y42.123 E-.11609
G1 X128.349 Y42.145 E-.07614
G1 X128.544 Y42.19 E-.07613
G1 X128.917 Y42.336 E-.15213
G1 X129.253 Y42.553 E-.15209
G1 X129.54 Y42.833 E-.15214
G1 X129.592 Y42.91 E-.03526
; WIPE_END
G1 E-.04 F1800
G1 X137.223 Y42.733 Z2.8 F30000
G1 X215.896 Y40.916 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X216.24 Y40.92 E.01108
G3 X217.176 Y41.13 I-.245 J3.289 E.03094
G3 X215.807 Y40.916 I-1.167 J2.996 E.60472
G1 X215.836 Y40.916 E.00091
G1 X215.714 Y41.339 F30000
G1 F8843.478
G1 X215.838 Y41.322 E.004
G3 X216.761 Y41.42 I.18 J2.727 E.03
G3 X215.376 Y41.39 I-.752 J2.706 E.52247
G1 X215.655 Y41.348 E.00909
G1 X215.808 Y41.736 F30000
G1 F8843.478
G1 X215.868 Y41.728 E.00195
G3 X216.651 Y41.812 I.01 J3.605 E.02535
G3 X215.466 Y41.786 I-.643 J2.314 E.44671
G1 X215.749 Y41.745 E.00918
G1 X215.904 Y42.119 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X216.15 Y42.123 E.00733
G3 X216.349 Y42.145 I-.155 J2.24 E.00597
G3 X215.844 Y42.123 I-.341 J1.98 E.36083
; WIPE_START
M204 S10000
G1 X216.15 Y42.123 E-.11623
G1 X216.349 Y42.145 E-.07613
G1 X216.544 Y42.19 E-.07613
G1 X216.917 Y42.336 E-.15213
G1 X217.253 Y42.553 E-.15213
G1 X217.54 Y42.833 E-.1521
G1 X217.592 Y42.909 E-.03514
; WIPE_END
G1 E-.04 F1800
G1 X217.44 Y50.54 Z2.8 F30000
G1 X215.868 Y129.213 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X215.6 Y129.189 E.00864
G3 X215.807 Y122.791 I.408 J-3.189 E.30517
G3 X217.176 Y123.004 I.188 J3.294 E.04486
G3 X215.928 Y129.214 I-1.167 J2.996 E.28898
G1 X215.896 Y128.807 F30000
G1 F8843.478
G1 X215.651 Y128.787 E.0079
G3 X215.838 Y123.197 I.358 J-2.786 E.26667
G3 X216.761 Y123.295 I.18 J2.727 E.03
G3 X215.956 Y128.809 I-.752 J2.706 E.26101
G1 X215.94 Y128.39 F30000
G1 F8843.478
G1 X215.702 Y128.383 E.00769
G3 X215.868 Y123.603 I.306 J-2.382 E.22825
G3 X216.651 Y123.687 I.01 J3.606 E.02535
G3 X216.18 Y128.396 I-.643 J2.314 E.21614
G1 X216 Y128.392 E.00576
G1 X216.024 Y128.004 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X215.95 Y128.008 E.00222
G3 X215.898 Y123.994 I.059 J-2.008 E.18291
G3 X216.349 Y124.02 I.097 J2.243 E.01349
G3 X216.349 Y127.979 I-.341 J1.98 E.16758
G1 X216.084 Y127.999 E.00791
; WIPE_START
M204 S10000
G1 X215.95 Y128.008 E-.05111
G1 X215.553 Y127.96 E-.15207
G1 X215.173 Y127.832 E-.1521
G1 X214.995 Y127.741 E-.07612
G1 X214.67 Y127.507 E-.15215
G1 X214.398 Y127.214 E-.15213
G1 X214.364 Y127.159 E-.02431
; WIPE_END
G1 E-.04 F1800
G1 X214.515 Y134.79 Z2.8 F30000
G1 X215.895 Y204.666 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X216.24 Y204.67 E.01109
G3 X217.176 Y204.88 I-.245 J3.289 E.03094
G3 X215.807 Y204.666 I-1.167 J2.996 E.6047
G1 X215.835 Y204.666 E.00091
G1 X215.714 Y205.089 F30000
G1 F8843.478
G1 X215.838 Y205.072 E.004
G3 X216.761 Y205.17 I.18 J2.727 E.03
G3 X215.376 Y205.14 I-.752 J2.706 E.52247
G1 X215.655 Y205.098 E.00908
G1 X215.808 Y205.486 F30000
G1 F8843.478
G1 X215.868 Y205.478 E.00195
G3 X216.651 Y205.562 I.011 J3.601 E.02536
G3 X215.466 Y205.536 I-.643 J2.314 E.44671
G1 X215.749 Y205.495 E.00918
G1 X215.897 Y205.869 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X215.898 Y205.869 E.00002
G3 X216.349 Y205.895 I.097 J2.243 E.01349
G3 X215.553 Y205.918 I-.341 J1.98 E.35205
G1 X215.838 Y205.878 E.00855
; WIPE_START
M204 S10000
G1 X215.898 Y205.869 E-.02309
G1 X215.898 Y205.869 E0
G1 X216.15 Y205.87 E-.09596
G1 X216.349 Y205.895 E-.07617
G1 X216.544 Y205.94 E-.07613
G1 X216.917 Y206.086 E-.15213
G1 X217.253 Y206.303 E-.15213
G1 X217.54 Y206.583 E-.1521
G1 X217.588 Y206.653 E-.03227
; WIPE_END
G1 E-.04 F1800
G1 X222.214 Y212.724 Z2.8 F30000
G1 X226.584 Y218.459 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X29.416 Y218.459 E6.34019
G1 X29.416 Y33.541 E5.94628
G1 X226.584 Y33.541 E6.34019
G1 X226.584 Y218.399 E5.94435
G1 X226.991 Y218.866 F30000
G1 F8843.478
G1 X29.009 Y218.866 E6.36637
G1 X29.009 Y33.134 E5.97246
G1 X226.991 Y33.134 E6.36637
G1 X226.991 Y218.806 E5.97053
G1 X227.398 Y219.273 F30000
G1 F8843.478
G1 X28.602 Y219.273 E6.39255
G1 X28.602 Y32.727 E5.99864
G1 X227.398 Y32.727 E6.39255
G1 X227.398 Y219.213 E5.99671
G1 X227.79 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X28.21 Y219.665 E5.94481
G1 X28.21 Y32.335 E5.57992
G1 X227.79 Y32.335 E5.94481
G1 X227.79 Y219.605 E5.57813
; WIPE_START
M204 S10000
G1 X225.79 Y219.606 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X225.658 Y218.295 Z2.8 F30000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42021
G1 F9541.731
G1 X226.251 Y217.702 E.025
G1 X226.251 Y217.169 E.0159
G1 X225.294 Y218.126 E.04033
G1 X224.76 Y218.126 E.0159
G1 X226.251 Y216.635 E.06282
G1 X226.251 Y216.101 E.0159
G1 X224.226 Y218.126 E.08531
G1 X223.693 Y218.126 E.0159
G1 X226.251 Y215.568 E.1078
G1 X226.251 Y215.034 E.0159
G1 X223.159 Y218.126 E.13029
G1 X222.626 Y218.126 E.0159
G1 X226.251 Y214.501 E.15278
G1 X226.251 Y213.967 E.0159
G1 X222.092 Y218.126 E.17527
G1 X221.559 Y218.126 E.0159
G1 X226.251 Y213.434 E.19775
G1 X226.251 Y212.9 E.0159
G1 X221.025 Y218.126 E.22024
G1 X220.492 Y218.126 E.0159
G1 X226.251 Y212.366 E.24273
G1 X226.251 Y211.833 E.0159
G1 X219.958 Y218.126 E.26522
G1 X219.424 Y218.126 E.0159
G1 X226.251 Y211.299 E.28771
G1 X226.251 Y210.766 E.0159
M73 P71 R22
G1 X218.891 Y218.126 E.3102
G1 X218.357 Y218.126 E.0159
G1 X226.251 Y210.232 E.33269
G1 X226.251 Y209.699 E.0159
G1 X217.824 Y218.126 E.35518
G1 X217.29 Y218.126 E.0159
G1 X226.251 Y209.165 E.37767
G1 X226.251 Y208.632 E.0159
G1 X216.757 Y218.126 E.40015
G1 X216.223 Y218.126 E.0159
G1 X226.251 Y208.098 E.42264
G1 X226.251 Y207.564 E.0159
G1 X215.689 Y218.126 E.44513
G1 X215.156 Y218.126 E.0159
G1 X226.251 Y207.031 E.46762
G1 X226.251 Y206.497 E.0159
G1 X214.622 Y218.126 E.49011
M73 P71 R21
G1 X214.089 Y218.126 E.0159
G1 X226.251 Y205.964 E.5126
G1 X226.251 Y205.43 E.0159
G1 X213.555 Y218.126 E.53509
G1 X213.022 Y218.126 E.0159
G1 X226.251 Y204.897 E.55758
G1 X226.251 Y204.363 E.0159
G1 X212.488 Y218.126 E.58007
G1 X211.954 Y218.126 E.0159
G1 X226.251 Y203.829 E.60256
G1 X226.251 Y203.296 E.0159
G1 X211.421 Y218.126 E.62504
G1 X210.887 Y218.126 E.0159
G1 X226.251 Y202.762 E.64753
G1 X226.251 Y202.229 E.0159
G1 X219.3 Y209.179 E.29294
G2 X219.502 Y208.444 I-3.418 J-1.331 E.02275
G1 X226.251 Y201.695 E.28446
G1 X226.251 Y201.162 E.0159
G1 X219.551 Y207.861 E.28237
G2 X219.511 Y207.368 I-2.489 J-.046 E.01478
G1 X226.251 Y200.628 E.28407
G1 X226.251 Y200.094 E.0159
G1 X219.419 Y206.926 E.28794
G2 X219.284 Y206.527 I-2.063 J.473 E.01257
G1 X226.251 Y199.561 E.29361
G1 X226.251 Y199.027 E.0159
G1 X219.112 Y206.165 E.30086
G2 X218.907 Y205.838 I-1.744 J.866 E.01155
G1 X226.251 Y198.494 E.30953
G1 X226.251 Y197.96 E.0159
G1 X218.672 Y205.539 E.31944
G2 X218.408 Y205.269 I-1.482 J1.183 E.01126
G1 X226.251 Y197.427 E.33055
G1 X226.251 Y196.893 E.0159
G1 X218.116 Y205.028 E.34285
G2 X217.795 Y204.815 I-1.221 J1.499 E.0115
G1 X226.251 Y196.359 E.3564
G1 X226.251 Y195.826 E.0159
G1 X217.442 Y204.634 E.37125
G2 X217.055 Y204.487 I-.929 J1.866 E.01235
G1 X226.251 Y195.292 E.38756
G1 X226.251 Y194.759 E.0159
G1 X216.629 Y204.38 E.40552
G2 X216.143 Y204.333 I-.66 J4.266 E.01457
G1 X226.251 Y194.225 E.42602
G1 X226.251 Y193.692 E.0159
G1 X215.594 Y204.348 E.44916
G2 X214.913 Y204.496 I.58 J4.318 E.0208
G1 X226.251 Y193.158 E.47787
G1 X226.251 Y192.624 E.0159
G1 X200.749 Y218.126 E1.07482
G1 X201.283 Y218.126 E.0159
G1 X212.624 Y206.784 E.47801
G2 X212.476 Y207.466 I3.458 J1.109 E.02083
G1 X201.817 Y218.126 E.44927
G1 X202.35 Y218.126 E.0159
G1 X212.453 Y208.023 E.42581
G2 X212.508 Y208.502 I4.814 J-.31 E.01437
G1 X202.884 Y218.126 E.40563
G1 X203.417 Y218.126 E.0159
G1 X212.613 Y208.93 E.38759
G2 X212.759 Y209.318 I2.016 J-.534 E.01237
G1 X203.951 Y218.126 E.37123
G1 X204.484 Y218.126 E.0159
G1 X212.939 Y209.671 E.35634
G2 X213.151 Y209.993 I1.712 J-.896 E.0115
G1 X205.018 Y218.126 E.34278
G1 X205.552 Y218.126 E.0159
G1 X213.392 Y210.285 E.33045
G2 X213.663 Y210.548 I10.787 J-10.84 E.01125
G1 X206.085 Y218.126 E.31938
G1 X206.619 Y218.126 E.0159
G1 X213.962 Y210.782 E.30953
G2 X214.292 Y210.986 I1.183 J-1.543 E.01157
G1 X207.152 Y218.126 E.30093
G1 X207.686 Y218.126 E.0159
G1 X214.654 Y211.157 E.29369
G2 X215.052 Y211.293 I.878 J-1.921 E.01255
G1 X208.219 Y218.126 E.28797
G1 X208.753 Y218.126 E.0159
G1 X215.491 Y211.387 E.28401
G2 X215.988 Y211.424 I.562 J-4.265 E.01486
G1 X209.287 Y218.126 E.28247
G1 X209.82 Y218.126 E.0159
G1 X216.567 Y211.379 E.28436
G2 X217.299 Y211.181 I-.291 J-2.525 E.02268
G1 X210.184 Y218.295 E.29986
G1 X200.046 Y218.295 F30000
G1 F9541.731
G1 X226.251 Y192.091 E1.10446
G1 X226.251 Y191.557 E.0159
G1 X199.682 Y218.126 E1.1198
G1 X199.149 Y218.126 E.0159
G1 X226.251 Y191.024 E1.14229
G1 X226.251 Y190.49 E.0159
G1 X198.615 Y218.126 E1.16478
G1 X198.082 Y218.126 E.0159
G1 X226.251 Y189.957 E1.18727
G1 X226.251 Y189.423 E.0159
G1 X197.548 Y218.126 E1.20976
G1 X197.014 Y218.126 E.0159
G1 X226.251 Y188.889 E1.23224
G1 X226.251 Y188.356 E.0159
G1 X196.481 Y218.126 E1.25473
G1 X195.947 Y218.126 E.0159
G1 X226.251 Y187.822 E1.27722
G1 X226.251 Y187.289 E.0159
G1 X195.414 Y218.126 E1.29971
G1 X194.88 Y218.126 E.0159
G1 X226.251 Y186.755 E1.3222
G1 X226.251 Y186.222 E.0159
G1 X194.347 Y218.126 E1.34469
G1 X193.813 Y218.126 E.0159
G1 X226.251 Y185.688 E1.36718
G1 X226.251 Y185.155 E.0159
G1 X193.279 Y218.126 E1.38967
G1 X192.746 Y218.126 E.0159
G1 X226.251 Y184.621 E1.41216
G1 X226.251 Y184.087 E.0159
G1 X192.212 Y218.126 E1.43464
G1 X191.679 Y218.126 E.0159
G1 X226.251 Y183.554 E1.45713
G1 X226.251 Y183.02 E.0159
G1 X191.145 Y218.126 E1.47962
G1 X190.612 Y218.126 E.0159
G1 X226.251 Y182.487 E1.50211
G1 X226.251 Y181.953 E.0159
G1 X190.078 Y218.126 E1.5246
G1 X189.545 Y218.126 E.0159
G1 X226.251 Y181.42 E1.54709
G1 X226.251 Y180.886 E.0159
G1 X189.011 Y218.126 E1.56958
G1 X188.477 Y218.126 E.0159
G1 X226.251 Y180.352 E1.59207
G1 X226.251 Y179.819 E.0159
G1 X187.944 Y218.126 E1.61456
G1 X187.41 Y218.126 E.0159
G1 X226.251 Y179.285 E1.63704
G1 X226.251 Y178.752 E.0159
G1 X186.877 Y218.126 E1.65953
G1 X186.343 Y218.126 E.0159
G1 X226.251 Y178.218 E1.68202
G1 X226.251 Y177.685 E.0159
G1 X185.81 Y218.126 E1.70451
G1 X185.276 Y218.126 E.0159
G1 X226.251 Y177.151 E1.727
G1 X226.251 Y176.617 E.0159
G1 X205.749 Y197.118 E.86408
G1 X205.749 Y196.585 E.0159
G1 X226.251 Y176.084 E.86408
G1 X226.251 Y175.55 E.0159
G1 X205.749 Y196.051 E.86408
G1 X205.749 Y195.518 E.0159
G1 X226.251 Y175.017 E.86408
G1 X226.251 Y174.483 E.0159
G1 X205.749 Y194.984 E.86408
G1 X205.749 Y194.451 E.0159
G1 X226.251 Y173.95 E.86408
G1 X226.251 Y173.416 E.0159
G1 X205.749 Y193.917 E.86408
G1 X205.749 Y193.383 E.0159
G1 X226.251 Y172.882 E.86408
G1 X226.251 Y172.349 E.0159
G1 X205.749 Y192.85 E.86408
G1 X205.749 Y192.316 E.0159
G1 X226.251 Y171.815 E.86408
G1 X226.251 Y171.282 E.0159
G1 X205.749 Y191.783 E.86408
G1 X205.749 Y191.249 E.0159
G1 X226.251 Y170.748 E.86408
G1 X226.251 Y170.215 E.0159
G1 X205.749 Y190.716 E.86408
G1 X205.749 Y190.182 E.0159
G1 X226.251 Y169.681 E.86408
G1 X226.251 Y169.147 E.0159
G1 X205.749 Y189.649 E.86408
G1 X205.749 Y189.115 E.0159
G1 X226.251 Y168.614 E.86408
G1 X226.251 Y168.08 E.0159
G1 X205.749 Y188.581 E.86408
G1 X205.749 Y188.048 E.0159
G1 X226.251 Y167.547 E.86408
G1 X226.251 Y167.013 E.0159
G1 X205.749 Y187.514 E.86408
G1 X205.749 Y186.981 E.0159
G1 X226.251 Y166.48 E.86408
G1 X226.251 Y165.946 E.0159
G1 X205.749 Y186.447 E.86408
G1 X205.749 Y185.914 E.0159
G1 X226.251 Y165.412 E.86408
G1 X226.251 Y164.879 E.0159
G1 X205.749 Y185.38 E.86408
G1 X205.749 Y184.846 E.0159
G1 X226.251 Y164.345 E.86408
G1 X226.251 Y163.812 E.0159
G1 X205.749 Y184.313 E.86408
G1 X205.749 Y183.779 E.0159
G1 X226.251 Y163.278 E.86408
G1 X226.251 Y162.745 E.0159
G1 X205.749 Y183.246 E.86408
G1 X205.749 Y182.712 E.0159
G1 X226.251 Y162.211 E.86408
G1 X226.251 Y161.677 E.0159
G1 X205.749 Y182.179 E.86408
G1 X205.749 Y181.645 E.0159
G1 X226.251 Y161.144 E.86408
G1 X226.251 Y160.61 E.0159
G1 X205.749 Y181.111 E.86408
G1 X205.749 Y180.578 E.0159
G1 X226.251 Y160.077 E.86408
G1 X226.251 Y159.543 E.0159
G1 X205.749 Y180.044 E.86408
G1 X205.749 Y179.511 E.0159
G1 X226.251 Y159.01 E.86408
G1 X226.251 Y158.476 E.0159
G1 X205.749 Y178.977 E.86408
G1 X205.749 Y178.444 E.0159
G1 X226.251 Y157.942 E.86408
G1 X226.251 Y157.409 E.0159
G1 X205.749 Y177.91 E.86408
G1 X205.749 Y177.376 E.0159
G1 X226.251 Y156.875 E.86408
G1 X226.251 Y156.342 E.0159
G1 X205.749 Y176.843 E.86408
G1 X205.749 Y176.309 E.0159
G1 X226.251 Y155.808 E.86408
G1 X226.251 Y155.275 E.0159
G1 X205.749 Y175.776 E.86408
G1 X205.749 Y175.242 E.0159
G1 X226.251 Y154.741 E.86408
G1 X226.251 Y154.208 E.0159
G1 X205.749 Y174.709 E.86408
G1 X205.749 Y174.175 E.0159
G1 X226.251 Y153.674 E.86408
G1 X226.251 Y153.14 E.0159
G1 X205.749 Y173.641 E.86408
G1 X205.749 Y173.108 E.0159
G1 X226.251 Y152.607 E.86408
G1 X226.251 Y152.073 E.0159
G1 X205.749 Y172.574 E.86408
G1 X205.749 Y172.041 E.0159
G1 X226.251 Y151.54 E.86408
G1 X226.251 Y151.006 E.0159
G1 X205.749 Y171.507 E.86408
G1 X205.749 Y170.974 E.0159
G1 X226.251 Y150.473 E.86408
G1 X226.251 Y149.939 E.0159
G1 X205.749 Y170.44 E.86408
G1 X205.749 Y169.906 E.0159
G1 X226.251 Y149.405 E.86408
G1 X226.251 Y148.872 E.0159
G1 X205.749 Y169.373 E.86408
G1 X205.749 Y168.839 E.0159
G1 X226.251 Y148.338 E.86408
G1 X226.251 Y147.805 E.0159
G1 X205.749 Y168.306 E.86408
G1 X205.749 Y167.772 E.0159
G1 X226.251 Y147.271 E.86408
G1 X226.251 Y146.738 E.0159
G1 X205.749 Y167.239 E.86408
G1 X205.749 Y166.705 E.0159
G1 X226.251 Y146.204 E.86408
G1 X226.251 Y145.67 E.0159
G1 X205.749 Y166.171 E.86408
G1 X205.749 Y165.638 E.0159
G1 X226.251 Y145.137 E.86408
G1 X226.251 Y144.603 E.0159
G1 X205.749 Y165.104 E.86408
G1 X205.749 Y164.571 E.0159
G1 X226.251 Y144.07 E.86408
G1 X226.251 Y143.536 E.0159
G1 X205.749 Y164.037 E.86408
G1 X205.749 Y163.504 E.0159
G1 X226.251 Y143.003 E.86408
G1 X226.251 Y142.469 E.0159
G1 X205.749 Y162.97 E.86408
G1 X205.749 Y162.437 E.0159
G1 X226.251 Y141.935 E.86408
G1 X226.251 Y141.402 E.0159
G1 X205.749 Y161.903 E.86408
G1 X205.749 Y161.369 E.0159
G1 X226.251 Y140.868 E.86408
G1 X226.251 Y140.335 E.0159
G1 X205.749 Y160.836 E.86408
G1 X205.749 Y160.302 E.0159
G1 X226.251 Y139.801 E.86408
G1 X226.251 Y139.268 E.0159
G1 X205.749 Y159.769 E.86408
G1 X205.749 Y159.235 E.0159
G1 X226.251 Y138.734 E.86408
G1 X226.251 Y138.2 E.0159
G1 X205.749 Y158.702 E.86408
G1 X205.749 Y158.168 E.0159
G1 X226.251 Y137.667 E.86408
G1 X226.251 Y137.133 E.0159
G1 X205.749 Y157.634 E.86408
G1 X205.749 Y157.101 E.0159
G1 X226.251 Y136.6 E.86408
G1 X226.251 Y136.066 E.0159
G1 X205.749 Y156.567 E.86408
G1 X205.749 Y156.034 E.0159
G1 X226.251 Y135.533 E.86408
G1 X226.251 Y134.999 E.0159
G1 X205.749 Y155.5 E.86408
G1 X205.749 Y154.967 E.0159
G1 X226.251 Y134.465 E.86408
G1 X226.251 Y133.932 E.0159
G1 X205.749 Y154.433 E.86408
G1 X205.749 Y153.899 E.0159
G1 X226.251 Y133.398 E.86408
G1 X226.251 Y132.865 E.0159
G1 X205.749 Y153.366 E.86408
G1 X205.749 Y152.832 E.0159
G1 X226.251 Y132.331 E.86408
G1 X226.251 Y131.798 E.0159
G1 X205.749 Y152.299 E.86408
G1 X205.749 Y151.765 E.0159
G1 X226.251 Y131.264 E.86408
G1 X226.251 Y130.731 E.0159
G1 X205.749 Y151.232 E.86408
G1 X205.749 Y150.698 E.0159
G1 X226.251 Y130.197 E.86408
G1 X226.251 Y129.663 E.0159
G1 X205.749 Y150.164 E.86408
G1 X205.749 Y149.631 E.0159
G1 X226.251 Y129.13 E.86408
G1 X226.251 Y128.596 E.0159
G1 X205.749 Y149.097 E.86408
M73 P72 R21
G1 X205.749 Y148.564 E.0159
G1 X226.251 Y128.063 E.86408
G1 X226.251 Y127.529 E.0159
G1 X205.749 Y148.03 E.86408
G1 X205.749 Y147.497 E.0159
G1 X226.251 Y126.996 E.86408
G1 X226.251 Y126.462 E.0159
G1 X205.749 Y146.963 E.86408
G1 X205.749 Y146.429 E.0159
G1 X226.251 Y125.928 E.86408
G1 X226.251 Y125.395 E.0159
G1 X205.749 Y145.896 E.86408
G1 X205.749 Y145.362 E.0159
G1 X226.251 Y124.861 E.86408
G1 X226.251 Y124.328 E.0159
G1 X205.749 Y144.829 E.86408
G1 X205.749 Y144.295 E.0159
G1 X226.251 Y123.794 E.86408
G1 X226.251 Y123.261 E.0159
G1 X205.749 Y143.762 E.86408
G1 X205.749 Y143.228 E.0159
G1 X226.251 Y122.727 E.86408
G1 X226.251 Y122.193 E.0159
G1 X205.749 Y142.694 E.86408
G1 X205.749 Y142.161 E.0159
G1 X226.251 Y121.66 E.86408
G1 X226.251 Y121.126 E.0159
G1 X205.749 Y141.627 E.86408
G1 X205.749 Y141.094 E.0159
G1 X226.251 Y120.593 E.86408
G1 X226.251 Y120.059 E.0159
G1 X219.439 Y126.871 E.28711
G2 X219.54 Y126.236 I-3.51 J-.885 E.01918
G1 X226.251 Y119.526 E.28284
G1 X226.251 Y118.992 E.0159
G1 X219.537 Y125.706 E.28297
G2 X219.467 Y125.242 I-4.781 J.48 E.01399
G1 X226.251 Y118.458 E.2859
G1 X226.251 Y117.925 E.0159
G1 X219.348 Y124.827 E.29093
G2 X219.191 Y124.451 I-1.957 J.595 E.01218
G1 X226.251 Y117.391 E.29754
G1 X226.251 Y116.858 E.0159
G1 X219.001 Y124.108 E.30557
G2 X218.78 Y123.795 I-1.673 J.948 E.01143
G1 X226.251 Y116.324 E.31488
G1 X226.251 Y115.791 E.0159
G1 X218.53 Y123.511 E.32541
G2 X218.252 Y123.256 I-1.414 J1.262 E.01127
G1 X226.251 Y115.257 E.33714
G1 X226.251 Y114.723 E.0159
G1 X217.945 Y123.029 E.35008
G2 X217.607 Y122.833 I-5.438 J8.991 E.01164
G1 X226.251 Y114.19 E.36431
G1 X226.251 Y113.656 E.0159
G1 X217.234 Y122.673 E.38002
G2 X216.824 Y122.55 I-.819 J1.986 E.01279
G1 X226.251 Y113.123 E.39732
G1 X226.251 Y112.589 E.0159
G1 X216.369 Y122.471 E.41651
G2 X215.848 Y122.458 I-.312 J2.053 E.01556
G1 X226.251 Y112.056 E.43845
G1 X226.251 Y111.522 E.0159
G1 X215.241 Y122.532 E.46405
G2 X214.41 Y122.829 I.528 J2.788 E.02639
G1 X226.251 Y110.988 E.49905
G1 X226.251 Y110.455 E.0159
G1 X205.749 Y130.956 E.86408
G1 X205.749 Y131.49 E.0159
G1 X212.824 Y124.415 E.29818
G2 X212.535 Y125.237 I2.411 J1.309 E.02609
G1 X205.749 Y132.023 E.286
G1 X205.749 Y132.557 E.0159
G1 X212.453 Y125.853 E.28253
G2 X212.472 Y126.368 I2.581 J.162 E.01537
G1 X205.749 Y133.09 E.28334
G1 X205.749 Y133.624 E.0159
G1 X212.548 Y126.825 E.28654
G2 X212.671 Y127.236 I6.118 J-1.618 E.01277
G1 X205.749 Y134.157 E.29174
G1 X205.749 Y134.691 E.0159
G1 X212.835 Y127.605 E.29865
G2 X213.031 Y127.943 I1.786 J-.813 E.01165
G1 X205.749 Y135.225 E.30692
G1 X205.749 Y135.758 E.0159
G1 X213.257 Y128.25 E.31645
G2 X213.512 Y128.529 I1.521 J-1.135 E.01127
G1 X205.749 Y136.292 E.32719
G1 X205.749 Y136.825 E.0159
G1 X213.796 Y128.779 E.33913
G2 X214.108 Y129.001 I1.263 J-1.45 E.01142
G1 X205.749 Y137.359 E.35228
G1 X205.749 Y137.892 E.0159
G1 X214.45 Y129.192 E.36672
G2 X214.826 Y129.35 I.977 J-1.797 E.01216
G1 X205.749 Y138.426 E.38254
G1 X205.749 Y138.96 E.0159
G1 X215.241 Y129.468 E.40005
G2 X215.707 Y129.535 I.569 J-2.301 E.01407
G1 X205.749 Y139.493 E.4197
G1 X205.749 Y140.027 E.0159
G1 X216.234 Y129.543 E.44189
G2 X216.87 Y129.44 I-.37 J-4.321 E.01922
G1 X205.58 Y140.73 E.47585
G1 X205.58 Y130.592 F30000
G1 F9541.731
G1 X226.251 Y109.921 E.87123
G1 X226.251 Y109.388 E.0159
G1 X205.749 Y129.889 E.86408
G1 X205.749 Y129.355 E.0159
G1 X226.251 Y108.854 E.86408
G1 X226.251 Y108.321 E.0159
G1 X205.749 Y128.822 E.86408
G1 X205.749 Y128.288 E.0159
G1 X226.251 Y107.787 E.86408
G1 X226.251 Y107.253 E.0159
G1 X205.749 Y127.755 E.86408
G1 X205.749 Y127.221 E.0159
G1 X226.251 Y106.72 E.86408
G1 X226.251 Y106.186 E.0159
G1 X205.749 Y126.687 E.86408
G1 X205.749 Y126.154 E.0159
G1 X226.251 Y105.653 E.86408
G1 X226.251 Y105.119 E.0159
G1 X205.749 Y125.62 E.86408
G1 X205.749 Y125.087 E.0159
G1 X226.251 Y104.586 E.86408
G1 X226.251 Y104.052 E.0159
G1 X205.749 Y124.553 E.86408
G1 X205.749 Y124.02 E.0159
G1 X226.251 Y103.519 E.86408
G1 X226.251 Y102.985 E.0159
G1 X205.749 Y123.486 E.86408
G1 X205.749 Y122.952 E.0159
G1 X226.251 Y102.451 E.86408
G1 X226.251 Y101.918 E.0159
G1 X205.749 Y122.419 E.86408
G1 X205.749 Y121.885 E.0159
G1 X226.251 Y101.384 E.86408
G1 X226.251 Y100.851 E.0159
G1 X205.749 Y121.352 E.86408
G1 X205.749 Y120.818 E.0159
G1 X226.251 Y100.317 E.86408
G1 X226.251 Y99.784 E.0159
G1 X205.749 Y120.285 E.86408
G1 X205.749 Y119.751 E.0159
G1 X226.251 Y99.25 E.86408
G1 X226.251 Y98.716 E.0159
G1 X205.749 Y119.217 E.86408
G1 X205.749 Y118.684 E.0159
G1 X226.251 Y98.183 E.86408
G1 X226.251 Y97.649 E.0159
G1 X205.749 Y118.15 E.86408
G1 X205.749 Y117.617 E.0159
G1 X226.251 Y97.116 E.86408
G1 X226.251 Y96.582 E.0159
G1 X205.749 Y117.083 E.86408
G1 X205.749 Y116.55 E.0159
G1 X226.251 Y96.049 E.86408
G1 X226.251 Y95.515 E.0159
G1 X205.749 Y116.016 E.86408
G1 X205.749 Y115.482 E.0159
G1 X226.251 Y94.981 E.86408
G1 X226.251 Y94.448 E.0159
G1 X205.749 Y114.949 E.86408
G1 X205.749 Y114.415 E.0159
G1 X226.251 Y93.914 E.86408
G1 X226.251 Y93.381 E.0159
G1 X205.749 Y113.882 E.86408
G1 X205.749 Y113.348 E.0159
G1 X226.251 Y92.847 E.86408
G1 X226.251 Y92.314 E.0159
G1 X205.749 Y112.815 E.86408
G1 X205.749 Y112.281 E.0159
G1 X226.251 Y91.78 E.86408
G1 X226.251 Y91.246 E.0159
G1 X205.749 Y111.748 E.86408
G1 X205.749 Y111.214 E.0159
G1 X226.251 Y90.713 E.86408
G1 X226.251 Y90.179 E.0159
G1 X205.749 Y110.68 E.86408
G1 X205.749 Y110.147 E.0159
G1 X226.251 Y89.646 E.86408
G1 X226.251 Y89.112 E.0159
G1 X205.749 Y109.613 E.86408
G1 X205.749 Y109.08 E.0159
G1 X226.251 Y88.579 E.86408
G1 X226.251 Y88.045 E.0159
G1 X205.749 Y108.546 E.86408
G1 X205.749 Y108.013 E.0159
G1 X226.251 Y87.511 E.86408
G1 X226.251 Y86.978 E.0159
G1 X205.749 Y107.479 E.86408
G1 X205.749 Y106.945 E.0159
G1 X226.251 Y86.444 E.86408
G1 X226.251 Y85.911 E.0159
G1 X205.749 Y106.412 E.86408
G1 X205.749 Y105.878 E.0159
G1 X226.251 Y85.377 E.86408
G1 X226.251 Y84.844 E.0159
G1 X205.749 Y105.345 E.86408
G1 X205.749 Y104.811 E.0159
G1 X226.251 Y84.31 E.86408
G1 X226.251 Y83.776 E.0159
G1 X205.749 Y104.278 E.86408
G1 X205.749 Y103.744 E.0159
G1 X226.251 Y83.243 E.86408
G1 X226.251 Y82.709 E.0159
G1 X205.749 Y103.21 E.86408
G1 X205.749 Y102.677 E.0159
G1 X226.251 Y82.176 E.86408
G1 X226.251 Y81.642 E.0159
G1 X205.749 Y102.143 E.86408
G1 X205.749 Y101.61 E.0159
G1 X226.251 Y81.109 E.86408
G1 X226.251 Y80.575 E.0159
G1 X205.749 Y101.076 E.86408
G1 X205.749 Y100.543 E.0159
G1 X226.251 Y80.041 E.86408
G1 X226.251 Y79.508 E.0159
G1 X205.749 Y100.009 E.86408
G1 X205.749 Y99.475 E.0159
G1 X226.251 Y78.974 E.86408
G1 X226.251 Y78.441 E.0159
G1 X205.749 Y98.942 E.86408
G1 X205.749 Y98.408 E.0159
G1 X226.251 Y77.907 E.86408
G1 X226.251 Y77.374 E.0159
G1 X205.749 Y97.875 E.86408
G1 X205.749 Y97.341 E.0159
G1 X226.251 Y76.84 E.86408
G1 X226.251 Y76.307 E.0159
G1 X205.749 Y96.808 E.86408
G1 X205.749 Y96.274 E.0159
G1 X226.251 Y75.773 E.86408
G1 X226.251 Y75.239 E.0159
G1 X205.749 Y95.74 E.86408
G1 X205.749 Y95.207 E.0159
G1 X226.251 Y74.706 E.86408
G1 X226.251 Y74.172 E.0159
G1 X205.749 Y94.673 E.86408
G1 X205.749 Y94.14 E.0159
G1 X226.251 Y73.639 E.86408
G1 X226.251 Y73.105 E.0159
G1 X205.749 Y93.606 E.86408
G1 X205.749 Y93.073 E.0159
G1 X226.251 Y72.572 E.86408
G1 X226.251 Y72.038 E.0159
G1 X205.749 Y92.539 E.86408
G1 X205.749 Y92.005 E.0159
G1 X226.251 Y71.504 E.86408
G1 X226.251 Y70.971 E.0159
G1 X205.749 Y91.472 E.86408
G1 X205.749 Y90.938 E.0159
G1 X226.251 Y70.437 E.86408
G1 X226.251 Y69.904 E.0159
G1 X205.749 Y90.405 E.86408
G1 X205.749 Y89.871 E.0159
G1 X226.251 Y69.37 E.86408
G1 X226.251 Y68.837 E.0159
G1 X205.749 Y89.338 E.86408
G1 X205.749 Y88.804 E.0159
G1 X226.251 Y68.303 E.86408
G1 X226.251 Y67.769 E.0159
G1 X205.749 Y88.27 E.86408
G1 X205.749 Y87.737 E.0159
G1 X226.251 Y67.236 E.86408
G1 X226.251 Y66.702 E.0159
G1 X205.749 Y87.203 E.86408
G1 X205.749 Y86.67 E.0159
G1 X226.251 Y66.169 E.86408
G1 X226.251 Y65.635 E.0159
G1 X205.749 Y86.136 E.86408
G1 X205.749 Y85.603 E.0159
G1 X226.251 Y65.102 E.86408
G1 X226.251 Y64.568 E.0159
G1 X205.749 Y85.069 E.86408
G1 X205.749 Y84.536 E.0159
G1 X226.251 Y64.034 E.86408
G1 X226.251 Y63.501 E.0159
G1 X205.749 Y84.002 E.86408
G1 X205.749 Y83.468 E.0159
G1 X226.251 Y62.967 E.86408
G1 X226.251 Y62.434 E.0159
G1 X205.749 Y82.935 E.86408
G1 X205.749 Y82.401 E.0159
G1 X226.251 Y61.9 E.86408
G1 X226.251 Y61.367 E.0159
G1 X205.749 Y81.868 E.86408
G1 X205.749 Y81.334 E.0159
G1 X226.251 Y60.833 E.86408
G1 X226.251 Y60.299 E.0159
G1 X205.749 Y80.801 E.86408
G1 X205.749 Y80.267 E.0159
G1 X226.251 Y59.766 E.86408
G1 X226.251 Y59.232 E.0159
G1 X205.749 Y79.733 E.86408
G1 X205.749 Y79.2 E.0159
G1 X226.251 Y58.699 E.86408
G1 X226.251 Y58.165 E.0159
G1 X205.749 Y78.666 E.86408
G1 X205.749 Y78.133 E.0159
G1 X226.251 Y57.632 E.86408
M73 P72 R20
G1 X226.251 Y57.098 E.0159
G1 X205.749 Y77.599 E.86408
G1 X205.749 Y77.066 E.0159
G1 X226.251 Y56.564 E.86408
G1 X226.251 Y56.031 E.0159
G1 X205.749 Y76.532 E.86408
G1 X205.749 Y75.998 E.0159
G1 X226.251 Y55.497 E.86408
G1 X226.251 Y54.964 E.0159
G1 X205.749 Y75.465 E.86408
G1 X205.749 Y74.931 E.0159
G1 X226.251 Y54.43 E.86408
G1 X226.251 Y53.897 E.0159
G1 X205.749 Y74.398 E.86408
G1 X205.749 Y73.864 E.0159
G1 X226.251 Y53.363 E.86408
G1 X226.251 Y52.829 E.0159
G1 X205.749 Y73.331 E.86408
G1 X205.749 Y72.797 E.0159
G1 X226.251 Y52.296 E.86408
G1 X226.251 Y51.762 E.0159
G1 X205.749 Y72.263 E.86408
G1 X205.749 Y71.73 E.0159
G1 X226.251 Y51.229 E.86408
G1 X226.251 Y50.695 E.0159
G1 X205.749 Y71.196 E.86408
G1 X205.749 Y70.663 E.0159
G1 X226.251 Y50.162 E.86408
G1 X226.251 Y49.628 E.0159
G1 X205.749 Y70.129 E.86408
G1 X205.749 Y69.596 E.0159
G1 X226.251 Y49.095 E.86408
G1 X226.251 Y48.561 E.0159
G1 X205.749 Y69.062 E.86408
G1 X205.749 Y68.528 E.0159
G1 X226.251 Y48.027 E.86408
G1 X226.251 Y47.494 E.0159
G1 X205.749 Y67.995 E.86408
G1 X205.749 Y67.461 E.0159
G1 X226.251 Y46.96 E.86408
G1 X226.251 Y46.427 E.0159
G1 X205.749 Y66.928 E.86408
G1 X205.749 Y66.394 E.0159
G1 X226.251 Y45.893 E.86408
G1 X226.251 Y45.36 E.0159
G1 X205.749 Y65.861 E.86408
G1 X205.749 Y65.327 E.0159
G1 X226.251 Y44.826 E.86408
G1 X226.251 Y44.292 E.0159
G1 X205.749 Y64.793 E.86408
G1 X205.749 Y64.26 E.0159
G1 X226.251 Y43.759 E.86408
G1 X226.251 Y43.225 E.0159
G1 X205.749 Y63.726 E.86408
G1 X205.749 Y63.193 E.0159
G1 X226.251 Y42.692 E.86408
G1 X226.251 Y42.158 E.0159
G1 X205.749 Y62.659 E.86408
G1 X205.749 Y62.126 E.0159
G1 X226.251 Y41.625 E.86408
G1 X226.251 Y41.091 E.0159
G1 X205.749 Y61.592 E.86408
G1 X205.749 Y61.058 E.0159
G1 X226.251 Y40.557 E.86408
G1 X226.251 Y40.024 E.0159
G1 X205.749 Y60.525 E.86408
G1 X205.749 Y59.991 E.0159
G1 X226.251 Y39.49 E.86408
G1 X226.251 Y38.957 E.0159
G1 X205.749 Y59.458 E.86408
G1 X205.749 Y58.924 E.0159
G1 X217.215 Y47.459 E.48324
G3 X216.503 Y47.637 I-1.25 J-3.487 E.0219
G1 X205.749 Y58.391 E.45325
G1 X205.749 Y57.857 E.0159
G1 X215.931 Y47.675 E.42915
G3 X215.444 Y47.629 I.223 J-4.947 E.0146
G1 X205.749 Y57.324 E.40861
G1 X205.749 Y56.79 E.0159
G1 X215.008 Y47.531 E.39025
G3 X214.614 Y47.392 I.499 J-2.042 E.01248
G1 X205.749 Y56.256 E.37363
G1 X205.749 Y55.723 E.0159
G1 X214.255 Y47.217 E.35851
G3 X213.929 Y47.01 I.869 J-1.734 E.01154
G1 X205.749 Y55.189 E.34474
G1 X205.749 Y54.656 E.0159
G1 X213.633 Y46.772 E.33229
G3 X213.367 Y46.505 I1.203 J-1.47 E.01126
G1 X205.496 Y54.376 E.33173
G1 X204.962 Y54.376 E.0159
G1 X213.128 Y46.21 E.34417
G3 X212.919 Y45.885 I1.52 J-1.206 E.01153
G1 X204.429 Y54.376 E.35786
G1 X203.895 Y54.376 E.0159
G1 X212.742 Y45.529 E.37288
G3 X212.6 Y45.137 I1.886 J-.906 E.01243
G1 X203.362 Y54.376 E.38938
G1 X202.828 Y54.376 E.0159
G1 X212.498 Y44.705 E.40758
G3 X212.453 Y44.217 I4.411 J-.658 E.01461
G1 X202.295 Y54.376 E.42815
G1 X201.761 Y54.376 E.0159
G1 X212.482 Y43.654 E.45187
G3 X212.649 Y42.954 I4.037 J.592 E.02149
G1 X201.227 Y54.376 E.4814
G1 X200.694 Y54.376 E.0159
G1 X221.195 Y33.874 E.86408
G1 X221.729 Y33.874 E.0159
G1 X214.829 Y40.774 E.2908
G3 X215.531 Y40.606 I1.349 J4.084 E.02153
G1 X222.262 Y33.874 E.28371
G1 X222.796 Y33.874 E.0159
G1 X216.087 Y40.583 E.28275
G3 X216.581 Y40.623 I.089 J1.974 E.0148
G1 X223.329 Y33.874 E.28443
G1 X223.863 Y33.874 E.0159
G1 X217.014 Y40.724 E.28867
G3 X217.404 Y40.867 I-.522 J2.024 E.01241
G1 X224.396 Y33.874 E.29472
G1 X224.93 Y33.874 E.0159
G1 X217.76 Y41.045 E.30222
G3 X218.084 Y41.254 I-.885 J1.725 E.01152
G1 X225.464 Y33.874 E.31105
G1 X225.997 Y33.874 E.0159
G1 X218.379 Y41.493 E.32111
G3 X218.645 Y41.76 I-1.203 J1.465 E.01126
G1 X226.251 Y34.155 E.32057
G1 X226.251 Y34.688 E.0159
G1 X218.883 Y42.056 E.31054
G3 X219.091 Y42.381 I-1.522 J1.207 E.01153
G1 X226.251 Y35.222 E.30175
G1 X226.251 Y35.755 E.0159
G1 X219.269 Y42.737 E.29427
G3 X219.408 Y43.132 I-6.82 J2.62 E.01247
G1 X226.251 Y36.289 E.28842
G1 X226.251 Y36.822 E.0159
G1 X219.504 Y43.569 E.28437
G3 X219.548 Y44.058 I-2.423 J.468 E.01465
G1 X226.251 Y37.356 E.28249
G1 X226.251 Y37.89 E.0159
G1 X219.511 Y44.629 E.28404
G3 X219.332 Y45.342 I-3.513 J-.505 E.02195
G1 X226.42 Y38.253 E.29875
; WIPE_START
G1 X225.006 Y39.668 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X218.446 Y43.569 Z2.8 F30000
G1 X199.991 Y54.545 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9541.731
G1 X220.661 Y33.874 E.87123
G1 X220.128 Y33.874 E.0159
G1 X199.627 Y54.376 E.86408
G1 X199.093 Y54.376 E.0159
G1 X219.594 Y33.874 E.86408
G1 X219.061 Y33.874 E.0159
G1 X198.56 Y54.376 E.86408
G1 X198.026 Y54.376 E.0159
G1 X218.527 Y33.874 E.86408
G1 X217.994 Y33.874 E.0159
G1 X197.493 Y54.376 E.86408
G1 X196.959 Y54.376 E.0159
G1 X217.46 Y33.874 E.86408
G1 X216.926 Y33.874 E.0159
G1 X196.425 Y54.376 E.86408
G1 X195.892 Y54.376 E.0159
G1 X216.393 Y33.874 E.86408
G1 X215.859 Y33.874 E.0159
G1 X195.358 Y54.376 E.86408
G1 X194.825 Y54.376 E.0159
G1 X215.326 Y33.874 E.86408
G1 X214.792 Y33.874 E.0159
G1 X194.291 Y54.376 E.86408
G1 X193.758 Y54.376 E.0159
G1 X214.259 Y33.874 E.86408
G1 X213.725 Y33.874 E.0159
G1 X193.224 Y54.376 E.86408
G1 X192.69 Y54.376 E.0159
G1 X213.191 Y33.874 E.86408
G1 X212.658 Y33.874 E.0159
G1 X192.157 Y54.376 E.86408
G1 X191.623 Y54.376 E.0159
G1 X212.124 Y33.874 E.86408
G1 X211.591 Y33.874 E.0159
G1 X191.09 Y54.376 E.86408
G1 X190.556 Y54.376 E.0159
G1 X211.057 Y33.874 E.86408
G1 X210.524 Y33.874 E.0159
G1 X190.023 Y54.376 E.86408
G1 X189.489 Y54.376 E.0159
G1 X209.99 Y33.874 E.86408
G1 X209.456 Y33.874 E.0159
G1 X188.955 Y54.376 E.86408
G1 X188.422 Y54.376 E.0159
G1 X208.923 Y33.874 E.86408
G1 X208.389 Y33.874 E.0159
G1 X187.888 Y54.376 E.86408
G1 X187.355 Y54.376 E.0159
G1 X207.856 Y33.874 E.86408
G1 X207.322 Y33.874 E.0159
G1 X186.821 Y54.376 E.86408
G1 X186.288 Y54.376 E.0159
G1 X206.789 Y33.874 E.86408
G1 X206.255 Y33.874 E.0159
G1 X185.754 Y54.376 E.86408
G1 X185.22 Y54.376 E.0159
G1 X205.722 Y33.874 E.86408
G1 X205.188 Y33.874 E.0159
G1 X184.687 Y54.376 E.86408
G1 X184.153 Y54.376 E.0159
G1 X204.654 Y33.874 E.86408
G1 X204.121 Y33.874 E.0159
G1 X183.62 Y54.376 E.86408
G1 X183.086 Y54.376 E.0159
G1 X203.587 Y33.874 E.86408
M73 P73 R20
G1 X203.054 Y33.874 E.0159
G1 X182.553 Y54.376 E.86408
G1 X182.019 Y54.376 E.0159
G1 X202.52 Y33.874 E.86408
G1 X201.987 Y33.874 E.0159
G1 X181.485 Y54.376 E.86408
G1 X180.952 Y54.376 E.0159
G1 X201.453 Y33.874 E.86408
G1 X200.919 Y33.874 E.0159
G1 X180.418 Y54.376 E.86408
G1 X179.885 Y54.376 E.0159
G1 X200.386 Y33.874 E.86408
G1 X199.852 Y33.874 E.0159
G1 X179.351 Y54.376 E.86408
G1 X178.818 Y54.376 E.0159
G1 X199.319 Y33.874 E.86408
G1 X198.785 Y33.874 E.0159
G1 X178.284 Y54.376 E.86408
G1 X177.75 Y54.376 E.0159
G1 X198.252 Y33.874 E.86408
G1 X197.718 Y33.874 E.0159
G1 X177.217 Y54.376 E.86408
G1 X176.683 Y54.376 E.0159
G1 X197.184 Y33.874 E.86408
G1 X196.651 Y33.874 E.0159
G1 X176.15 Y54.376 E.86408
G1 X175.616 Y54.376 E.0159
G1 X196.117 Y33.874 E.86408
G1 X195.584 Y33.874 E.0159
G1 X175.083 Y54.376 E.86408
G1 X174.549 Y54.376 E.0159
G1 X195.05 Y33.874 E.86408
G1 X194.517 Y33.874 E.0159
G1 X174.015 Y54.376 E.86408
G1 X173.482 Y54.376 E.0159
G1 X193.983 Y33.874 E.86408
G1 X193.449 Y33.874 E.0159
G1 X172.948 Y54.376 E.86408
G1 X172.415 Y54.376 E.0159
G1 X192.916 Y33.874 E.86408
G1 X192.382 Y33.874 E.0159
G1 X171.881 Y54.376 E.86408
G1 X171.348 Y54.376 E.0159
G1 X191.849 Y33.874 E.86408
G1 X191.315 Y33.874 E.0159
G1 X170.814 Y54.376 E.86408
G1 X170.281 Y54.376 E.0159
G1 X190.782 Y33.874 E.86408
G1 X190.248 Y33.874 E.0159
G1 X169.747 Y54.376 E.86408
G1 X169.213 Y54.376 E.0159
G1 X189.714 Y33.874 E.86408
G1 X189.181 Y33.874 E.0159
G1 X168.68 Y54.376 E.86408
G1 X168.146 Y54.376 E.0159
G1 X188.647 Y33.874 E.86408
G1 X188.114 Y33.874 E.0159
G1 X167.613 Y54.376 E.86408
G1 X167.079 Y54.376 E.0159
G1 X187.58 Y33.874 E.86408
G1 X187.047 Y33.874 E.0159
G1 X166.546 Y54.376 E.86408
G1 X166.012 Y54.376 E.0159
G1 X186.513 Y33.874 E.86408
G1 X185.979 Y33.874 E.0159
G1 X165.478 Y54.376 E.86408
G1 X164.945 Y54.376 E.0159
G1 X185.446 Y33.874 E.86408
G1 X184.912 Y33.874 E.0159
G1 X164.411 Y54.376 E.86408
G1 X163.878 Y54.376 E.0159
G1 X184.379 Y33.874 E.86408
G1 X183.845 Y33.874 E.0159
G1 X163.344 Y54.376 E.86408
G1 X162.811 Y54.376 E.0159
G1 X183.312 Y33.874 E.86408
G1 X182.778 Y33.874 E.0159
G1 X162.277 Y54.376 E.86408
G1 X161.743 Y54.376 E.0159
G1 X182.244 Y33.874 E.86408
G1 X181.711 Y33.874 E.0159
G1 X161.21 Y54.376 E.86408
G1 X160.676 Y54.376 E.0159
G1 X181.177 Y33.874 E.86408
G1 X180.644 Y33.874 E.0159
G1 X160.143 Y54.376 E.86408
G1 X159.609 Y54.376 E.0159
G1 X180.11 Y33.874 E.86408
G1 X179.577 Y33.874 E.0159
G1 X159.076 Y54.376 E.86408
G1 X158.542 Y54.376 E.0159
G1 X179.043 Y33.874 E.86408
G1 X178.51 Y33.874 E.0159
G1 X158.008 Y54.376 E.86408
G1 X157.475 Y54.376 E.0159
G1 X177.976 Y33.874 E.86408
G1 X177.442 Y33.874 E.0159
G1 X156.941 Y54.376 E.86408
G1 X156.408 Y54.376 E.0159
G1 X176.909 Y33.874 E.86408
G1 X176.375 Y33.874 E.0159
G1 X155.874 Y54.376 E.86408
G1 X155.341 Y54.376 E.0159
G1 X175.842 Y33.874 E.86408
G1 X175.308 Y33.874 E.0159
G1 X154.807 Y54.376 E.86408
G1 X154.273 Y54.376 E.0159
G1 X174.775 Y33.874 E.86408
G1 X174.241 Y33.874 E.0159
G1 X153.74 Y54.376 E.86408
G1 X153.206 Y54.376 E.0159
G1 X173.707 Y33.874 E.86408
G1 X173.174 Y33.874 E.0159
G1 X152.673 Y54.376 E.86408
G1 X152.139 Y54.376 E.0159
G1 X172.64 Y33.874 E.86408
G1 X172.107 Y33.874 E.0159
G1 X151.606 Y54.376 E.86408
G1 X151.072 Y54.376 E.0159
G1 X171.573 Y33.874 E.86408
G1 X171.04 Y33.874 E.0159
G1 X150.538 Y54.376 E.86408
G1 X150.005 Y54.376 E.0159
G1 X170.506 Y33.874 E.86408
G1 X169.972 Y33.874 E.0159
G1 X149.471 Y54.376 E.86408
G1 X148.938 Y54.376 E.0159
G1 X169.439 Y33.874 E.86408
G1 X168.905 Y33.874 E.0159
G1 X148.404 Y54.376 E.86408
G1 X147.871 Y54.376 E.0159
G1 X168.372 Y33.874 E.86408
G1 X167.838 Y33.874 E.0159
G1 X147.337 Y54.376 E.86408
G1 X146.803 Y54.376 E.0159
G1 X167.305 Y33.874 E.86408
G1 X166.771 Y33.874 E.0159
G1 X146.27 Y54.376 E.86408
G1 X145.736 Y54.376 E.0159
G1 X166.237 Y33.874 E.86408
G1 X165.704 Y33.874 E.0159
G1 X145.203 Y54.376 E.86408
G1 X144.669 Y54.376 E.0159
G1 X165.17 Y33.874 E.86408
G1 X164.637 Y33.874 E.0159
G1 X144.136 Y54.376 E.86408
G1 X143.602 Y54.376 E.0159
G1 X164.103 Y33.874 E.86408
G1 X163.57 Y33.874 E.0159
G1 X143.068 Y54.376 E.86408
G1 X142.535 Y54.376 E.0159
G1 X163.036 Y33.874 E.86408
G1 X162.502 Y33.874 E.0159
G1 X142.001 Y54.376 E.86408
G1 X141.468 Y54.376 E.0159
G1 X161.969 Y33.874 E.86408
G1 X161.435 Y33.874 E.0159
G1 X140.934 Y54.376 E.86408
G1 X140.401 Y54.376 E.0159
G1 X160.902 Y33.874 E.86408
G1 X160.368 Y33.874 E.0159
G1 X139.867 Y54.376 E.86408
G1 X139.334 Y54.376 E.0159
G1 X159.835 Y33.874 E.86408
G1 X159.301 Y33.874 E.0159
G1 X138.8 Y54.376 E.86408
G1 X138.266 Y54.376 E.0159
G1 X158.767 Y33.874 E.86408
G1 X158.234 Y33.874 E.0159
G1 X137.733 Y54.376 E.86408
G1 X137.199 Y54.376 E.0159
G1 X157.7 Y33.874 E.86408
G1 X157.167 Y33.874 E.0159
G1 X136.666 Y54.376 E.86408
G1 X136.132 Y54.376 E.0159
G1 X156.633 Y33.874 E.86408
G1 X156.1 Y33.874 E.0159
G1 X135.599 Y54.376 E.86408
G1 X135.065 Y54.376 E.0159
G1 X155.566 Y33.874 E.86408
G1 X155.032 Y33.874 E.0159
G1 X134.531 Y54.376 E.86408
G1 X133.998 Y54.376 E.0159
G1 X154.499 Y33.874 E.86408
G1 X153.965 Y33.874 E.0159
G1 X133.464 Y54.376 E.86408
G1 X132.931 Y54.376 E.0159
G1 X153.432 Y33.874 E.86408
G1 X152.898 Y33.874 E.0159
G1 X132.397 Y54.376 E.86408
G1 X131.864 Y54.376 E.0159
G1 X152.365 Y33.874 E.86408
G1 X151.831 Y33.874 E.0159
G1 X131.33 Y54.376 E.86408
G1 X130.796 Y54.376 E.0159
G1 X151.297 Y33.874 E.86408
G1 X150.764 Y33.874 E.0159
G1 X130.263 Y54.376 E.86408
G1 X129.729 Y54.376 E.0159
G1 X150.23 Y33.874 E.86408
G1 X149.697 Y33.874 E.0159
G1 X129.196 Y54.376 E.86408
G1 X128.662 Y54.376 E.0159
G1 X149.163 Y33.874 E.86408
G1 X148.63 Y33.874 E.0159
G1 X128.129 Y54.376 E.86408
G1 X127.595 Y54.376 E.0159
G1 X148.096 Y33.874 E.86408
G1 X147.563 Y33.874 E.0159
G1 X127.061 Y54.376 E.86408
G1 X126.528 Y54.376 E.0159
G1 X147.029 Y33.874 E.86408
G1 X146.495 Y33.874 E.0159
G1 X125.994 Y54.376 E.86408
G1 X125.461 Y54.376 E.0159
G1 X145.962 Y33.874 E.86408
G1 X145.428 Y33.874 E.0159
G1 X124.927 Y54.376 E.86408
G1 X124.394 Y54.376 E.0159
G1 X144.895 Y33.874 E.86408
G1 X144.361 Y33.874 E.0159
G1 X123.86 Y54.376 E.86408
G1 X123.326 Y54.376 E.0159
G1 X143.828 Y33.874 E.86408
G1 X143.294 Y33.874 E.0159
G1 X122.793 Y54.376 E.86408
G1 X122.259 Y54.376 E.0159
G1 X129.156 Y47.479 E.29069
G3 X128.459 Y47.642 I-1.159 J-3.368 E.02139
G1 X121.726 Y54.376 E.28379
G1 X121.192 Y54.376 E.0159
G1 X127.893 Y47.674 E.28245
G3 X127.411 Y47.623 I.015 J-2.441 E.01448
G1 X120.659 Y54.376 E.2846
G1 X120.125 Y54.376 E.0159
G1 X126.978 Y47.522 E.28885
G3 X126.586 Y47.381 I.512 J-2.029 E.01244
G1 X119.591 Y54.376 E.29482
G1 X119.058 Y54.376 E.0159
G1 X126.23 Y47.204 E.30228
G3 X125.907 Y46.993 I6.546 J-10.38 E.01149
G1 X118.524 Y54.376 E.31116
G1 X117.991 Y54.376 E.0159
G1 X125.614 Y46.753 E.32129
G3 X125.349 Y46.484 I1.209 J-1.457 E.01126
G1 X117.457 Y54.376 E.33262
G1 X116.924 Y54.376 E.0159
G1 X125.112 Y46.187 E.34514
G3 X124.906 Y45.86 I1.53 J-1.197 E.01154
G1 X116.39 Y54.376 E.35892
G1 X115.856 Y54.376 E.0159
G1 X124.731 Y45.501 E.37403
G3 X124.591 Y45.108 I1.897 J-.895 E.01247
G1 X115.323 Y54.376 E.39063
G1 X114.789 Y54.376 E.0159
G1 X124.492 Y44.673 E.40894
G3 X124.453 Y44.179 I4.85 J-.632 E.01479
G1 X114.256 Y54.376 E.42978
G1 X113.722 Y54.376 E.0159
G1 X124.486 Y43.611 E.45369
G3 X124.669 Y42.895 I2.417 J.234 E.0221
G1 X113.189 Y54.376 E.48387
G1 X112.655 Y54.376 E.0159
G1 X133.156 Y33.874 E.86408
G1 X133.69 Y33.874 E.0159
G1 X126.765 Y40.799 E.29186
G3 X127.484 Y40.614 I1.286 J3.507 E.02215
G1 X134.223 Y33.874 E.28406
G1 X134.757 Y33.874 E.0159
G1 X128.048 Y40.583 E.28275
G3 X128.546 Y40.618 I.108 J1.989 E.01492
G1 X135.29 Y33.874 E.28425
G1 X135.824 Y33.874 E.0159
G1 X128.985 Y40.714 E.28826
G3 X129.377 Y40.855 I-.51 J2.035 E.01245
G1 X136.358 Y33.874 E.29421
G1 X136.891 Y33.874 E.0159
G1 X129.735 Y41.031 E.30162
G3 X130.061 Y41.238 I-.874 J1.734 E.01154
G1 X137.425 Y33.874 E.31036
G1 X137.958 Y33.874 E.0159
G1 X130.358 Y41.475 E.32034
G3 X130.626 Y41.74 I-1.19 J1.472 E.01126
G1 X138.492 Y33.874 E.33152
G1 X139.025 Y33.874 E.0159
G1 X130.866 Y42.034 E.3439
G3 X131.077 Y42.357 I-1.51 J1.215 E.01151
G1 X139.559 Y33.874 E.35752
G1 X140.093 Y33.874 E.0159
G1 X131.256 Y42.711 E.37244
G3 X131.4 Y43.101 I-6.564 J2.637 E.01239
G1 X140.626 Y33.874 E.38888
G1 X141.16 Y33.874 E.0159
G1 X131.498 Y43.536 E.4072
G3 X131.546 Y44.021 I-2.408 J.483 E.01457
G1 X141.693 Y33.874 E.42767
G1 X142.227 Y33.874 E.0159
G1 X131.518 Y44.583 E.45135
G3 X131.354 Y45.281 I-3.634 J-.486 E.02139
G1 X142.93 Y33.705 E.4879
; WIPE_START
G1 X141.516 Y35.119 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X135.137 Y39.31 Z2.8 F30000
G1 X111.952 Y54.545 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9541.731
G1 X132.623 Y33.874 E.87123
G1 X132.089 Y33.874 E.0159
G1 X111.588 Y54.376 E.86408
G1 X111.054 Y54.376 E.0159
G1 X131.555 Y33.874 E.86408
G1 X131.022 Y33.874 E.0159
G1 X110.521 Y54.376 E.86408
G1 X109.987 Y54.376 E.0159
G1 X130.488 Y33.874 E.86408
G1 X129.955 Y33.874 E.0159
G1 X109.454 Y54.376 E.86408
G1 X108.92 Y54.376 E.0159
G1 X129.421 Y33.874 E.86408
G1 X128.888 Y33.874 E.0159
G1 X108.387 Y54.376 E.86408
G1 X107.853 Y54.376 E.0159
G1 X128.354 Y33.874 E.86408
G1 X127.82 Y33.874 E.0159
G1 X107.319 Y54.376 E.86408
G1 X106.786 Y54.376 E.0159
G1 X127.287 Y33.874 E.86408
G1 X126.753 Y33.874 E.0159
G1 X106.252 Y54.376 E.86408
G1 X105.719 Y54.376 E.0159
G1 X126.22 Y33.874 E.86408
G1 X125.686 Y33.874 E.0159
G1 X105.185 Y54.376 E.86408
G1 X104.652 Y54.376 E.0159
G1 X125.153 Y33.874 E.86408
G1 X124.619 Y33.874 E.0159
G1 X104.118 Y54.376 E.86408
G1 X103.584 Y54.376 E.0159
G1 X124.085 Y33.874 E.86408
G1 X123.552 Y33.874 E.0159
G1 X103.051 Y54.376 E.86408
G1 X102.517 Y54.376 E.0159
G1 X123.018 Y33.874 E.86408
G1 X122.485 Y33.874 E.0159
G1 X101.984 Y54.376 E.86408
G1 X101.45 Y54.376 E.0159
G1 X121.951 Y33.874 E.86408
G1 X121.418 Y33.874 E.0159
G1 X100.917 Y54.376 E.86408
G1 X100.383 Y54.376 E.0159
G1 X120.884 Y33.874 E.86408
G1 X120.351 Y33.874 E.0159
G1 X99.849 Y54.376 E.86408
G1 X99.316 Y54.376 E.0159
G1 X119.817 Y33.874 E.86408
G1 X119.283 Y33.874 E.0159
G1 X98.782 Y54.376 E.86408
G1 X98.249 Y54.376 E.0159
G1 X118.75 Y33.874 E.86408
G1 X118.216 Y33.874 E.0159
G1 X97.715 Y54.376 E.86408
G1 X97.182 Y54.376 E.0159
G1 X117.683 Y33.874 E.86408
G1 X117.149 Y33.874 E.0159
G1 X96.648 Y54.376 E.86408
G1 X96.114 Y54.376 E.0159
G1 X116.616 Y33.874 E.86408
G1 X116.082 Y33.874 E.0159
G1 X95.581 Y54.376 E.86408
G1 X95.047 Y54.376 E.0159
G1 X115.548 Y33.874 E.86408
G1 X115.015 Y33.874 E.0159
G1 X94.514 Y54.376 E.86408
G1 X93.98 Y54.376 E.0159
G1 X114.481 Y33.874 E.86408
G1 X113.948 Y33.874 E.0159
G1 X93.447 Y54.376 E.86408
G1 X92.913 Y54.376 E.0159
G1 X113.414 Y33.874 E.86408
G1 X112.881 Y33.874 E.0159
G1 X92.379 Y54.376 E.86408
G1 X91.846 Y54.376 E.0159
G1 X112.347 Y33.874 E.86408
G1 X111.813 Y33.874 E.0159
G1 X91.312 Y54.376 E.86408
G1 X90.779 Y54.376 E.0159
G1 X111.28 Y33.874 E.86408
G1 X110.746 Y33.874 E.0159
G1 X90.245 Y54.376 E.86408
G1 X89.712 Y54.376 E.0159
G1 X110.213 Y33.874 E.86408
G1 X109.679 Y33.874 E.0159
G1 X89.178 Y54.376 E.86408
G1 X88.644 Y54.376 E.0159
G1 X109.146 Y33.874 E.86408
G1 X108.612 Y33.874 E.0159
G1 X88.111 Y54.376 E.86408
G1 X87.577 Y54.376 E.0159
G1 X108.078 Y33.874 E.86408
G1 X107.545 Y33.874 E.0159
G1 X87.044 Y54.376 E.86408
G1 X86.51 Y54.376 E.0159
G1 X107.011 Y33.874 E.86408
G1 X106.478 Y33.874 E.0159
G1 X85.977 Y54.376 E.86408
G1 X85.443 Y54.376 E.0159
G1 X105.944 Y33.874 E.86408
G1 X105.411 Y33.874 E.0159
G1 X84.91 Y54.376 E.86408
G1 X84.376 Y54.376 E.0159
G1 X104.877 Y33.874 E.86408
G1 X104.343 Y33.874 E.0159
G1 X83.842 Y54.376 E.86408
G1 X83.309 Y54.376 E.0159
G1 X103.81 Y33.874 E.86408
G1 X103.276 Y33.874 E.0159
G1 X82.775 Y54.376 E.86408
G1 X82.242 Y54.376 E.0159
G1 X102.743 Y33.874 E.86408
G1 X102.209 Y33.874 E.0159
G1 X81.708 Y54.376 E.86408
G1 X81.175 Y54.376 E.0159
G1 X101.676 Y33.874 E.86408
G1 X101.142 Y33.874 E.0159
G1 X80.641 Y54.376 E.86408
G1 X80.107 Y54.376 E.0159
G1 X100.608 Y33.874 E.86408
G1 X100.075 Y33.874 E.0159
G1 X79.574 Y54.376 E.86408
G1 X79.04 Y54.376 E.0159
G1 X99.541 Y33.874 E.86408
G1 X99.008 Y33.874 E.0159
G1 X78.507 Y54.376 E.86408
G1 X77.973 Y54.376 E.0159
G1 X98.474 Y33.874 E.86408
G1 X97.941 Y33.874 E.0159
G1 X77.44 Y54.376 E.86408
G1 X76.906 Y54.376 E.0159
G1 X97.407 Y33.874 E.86408
G1 X96.873 Y33.874 E.0159
G1 X76.372 Y54.376 E.86408
M73 P73 R19
G1 X75.839 Y54.376 E.0159
G1 X96.34 Y33.874 E.86408
G1 X95.806 Y33.874 E.0159
G1 X75.305 Y54.376 E.86408
G1 X74.772 Y54.376 E.0159
G1 X95.273 Y33.874 E.86408
G1 X94.739 Y33.874 E.0159
G1 X74.238 Y54.376 E.86408
G1 X73.705 Y54.376 E.0159
G1 X94.206 Y33.874 E.86408
G1 X93.672 Y33.874 E.0159
G1 X73.171 Y54.376 E.86408
G1 X72.637 Y54.376 E.0159
G1 X93.139 Y33.874 E.86408
G1 X92.605 Y33.874 E.0159
G1 X72.104 Y54.376 E.86408
G1 X71.57 Y54.376 E.0159
G1 X92.071 Y33.874 E.86408
G1 X91.538 Y33.874 E.0159
G1 X71.037 Y54.376 E.86408
G1 X70.503 Y54.376 E.0159
G1 X91.004 Y33.874 E.86408
G1 X90.471 Y33.874 E.0159
G1 X69.97 Y54.376 E.86408
G1 X69.436 Y54.376 E.0159
G1 X89.937 Y33.874 E.86408
G1 X89.404 Y33.874 E.0159
G1 X68.902 Y54.376 E.86408
G1 X68.369 Y54.376 E.0159
G1 X88.87 Y33.874 E.86408
G1 X88.336 Y33.874 E.0159
G1 X67.835 Y54.376 E.86408
G1 X67.302 Y54.376 E.0159
G1 X87.803 Y33.874 E.86408
G1 X87.269 Y33.874 E.0159
G1 X66.768 Y54.376 E.86408
G1 X66.235 Y54.376 E.0159
G1 X86.736 Y33.874 E.86408
G1 X86.202 Y33.874 E.0159
G1 X65.701 Y54.376 E.86408
M73 P74 R19
G1 X65.167 Y54.376 E.0159
G1 X85.669 Y33.874 E.86408
G1 X85.135 Y33.874 E.0159
G1 X64.634 Y54.376 E.86408
G1 X64.1 Y54.376 E.0159
G1 X84.601 Y33.874 E.86408
G1 X84.068 Y33.874 E.0159
G1 X63.567 Y54.376 E.86408
G1 X63.033 Y54.376 E.0159
G1 X83.534 Y33.874 E.86408
G1 X83.001 Y33.874 E.0159
G1 X62.5 Y54.376 E.86408
G1 X61.966 Y54.376 E.0159
G1 X82.467 Y33.874 E.86408
G1 X81.934 Y33.874 E.0159
G1 X61.432 Y54.376 E.86408
G1 X60.899 Y54.376 E.0159
G1 X81.4 Y33.874 E.86408
G1 X80.866 Y33.874 E.0159
G1 X60.365 Y54.376 E.86408
G1 X59.832 Y54.376 E.0159
G1 X80.333 Y33.874 E.86408
G1 X79.799 Y33.874 E.0159
G1 X59.298 Y54.376 E.86408
G1 X58.765 Y54.376 E.0159
G1 X79.266 Y33.874 E.86408
G1 X78.732 Y33.874 E.0159
G1 X58.231 Y54.376 E.86408
G1 X57.697 Y54.376 E.0159
G1 X78.199 Y33.874 E.86408
G1 X77.665 Y33.874 E.0159
G1 X57.164 Y54.376 E.86408
G1 X56.63 Y54.376 E.0159
G1 X77.131 Y33.874 E.86408
G1 X76.598 Y33.874 E.0159
G1 X56.097 Y54.376 E.86408
G1 X55.563 Y54.376 E.0159
G1 X76.064 Y33.874 E.86408
G1 X75.531 Y33.874 E.0159
G1 X55.03 Y54.376 E.86408
G1 X54.496 Y54.376 E.0159
G1 X74.997 Y33.874 E.86408
G1 X74.464 Y33.874 E.0159
G1 X53.963 Y54.376 E.86408
G1 X53.429 Y54.376 E.0159
G1 X73.93 Y33.874 E.86408
G1 X73.396 Y33.874 E.0159
G1 X52.895 Y54.376 E.86408
G1 X52.362 Y54.376 E.0159
G1 X72.863 Y33.874 E.86408
G1 X72.329 Y33.874 E.0159
G1 X51.828 Y54.376 E.86408
G1 X51.295 Y54.376 E.0159
G1 X71.796 Y33.874 E.86408
G1 X71.262 Y33.874 E.0159
G1 X50.761 Y54.376 E.86408
G1 X50.251 Y54.376 E.01522
G1 X50.251 Y54.886 E.01522
G1 X29.749 Y75.387 E.86408
G1 X29.749 Y75.921 E.0159
G1 X50.251 Y55.42 E.86408
G1 X50.251 Y55.953 E.0159
G1 X29.749 Y76.454 E.86408
G1 X29.749 Y76.988 E.0159
G1 X50.251 Y56.487 E.86408
G1 X50.251 Y57.02 E.0159
G1 X29.749 Y77.521 E.86408
G1 X29.749 Y78.055 E.0159
G1 X50.251 Y57.554 E.86408
G1 X50.251 Y58.088 E.0159
G1 X29.749 Y78.589 E.86408
G1 X29.749 Y79.122 E.0159
G1 X50.251 Y58.621 E.86408
G1 X50.251 Y59.155 E.0159
G1 X29.749 Y79.656 E.86408
G1 X29.749 Y80.189 E.0159
G1 X50.251 Y59.688 E.86408
G1 X50.251 Y60.222 E.0159
G1 X29.749 Y80.723 E.86408
G1 X29.749 Y81.256 E.0159
G1 X50.251 Y60.755 E.86408
G1 X50.251 Y61.289 E.0159
G1 X29.749 Y81.79 E.86408
G1 X29.749 Y82.324 E.0159
G1 X50.251 Y61.822 E.86408
G1 X50.251 Y62.356 E.0159
G1 X29.749 Y82.857 E.86408
G1 X29.749 Y83.391 E.0159
G1 X50.251 Y62.89 E.86408
G1 X50.251 Y63.423 E.0159
G1 X29.749 Y83.924 E.86408
G1 X29.749 Y84.458 E.0159
G1 X50.251 Y63.957 E.86408
G1 X50.251 Y64.49 E.0159
G1 X29.749 Y84.991 E.86408
G1 X29.749 Y85.525 E.0159
G1 X50.251 Y65.024 E.86408
G1 X50.251 Y65.557 E.0159
G1 X29.749 Y86.059 E.86408
G1 X29.749 Y86.592 E.0159
G1 X50.251 Y66.091 E.86408
G1 X50.251 Y66.625 E.0159
G1 X29.749 Y87.126 E.86408
G1 X29.749 Y87.659 E.0159
G1 X50.251 Y67.158 E.86408
G1 X50.251 Y67.692 E.0159
G1 X29.749 Y88.193 E.86408
G1 X29.749 Y88.726 E.0159
G1 X50.251 Y68.225 E.86408
G1 X50.251 Y68.759 E.0159
G1 X29.749 Y89.26 E.86408
G1 X29.749 Y89.794 E.0159
G1 X50.251 Y69.292 E.86408
G1 X50.251 Y69.826 E.0159
G1 X29.749 Y90.327 E.86408
G1 X29.749 Y90.861 E.0159
G1 X50.251 Y70.36 E.86408
G1 X50.251 Y70.893 E.0159
G1 X29.749 Y91.394 E.86408
G1 X29.749 Y91.928 E.0159
G1 X50.251 Y71.427 E.86408
G1 X50.251 Y71.96 E.0159
G1 X29.749 Y92.461 E.86408
G1 X29.749 Y92.995 E.0159
G1 X50.251 Y72.494 E.86408
G1 X50.251 Y73.027 E.0159
G1 X29.749 Y93.529 E.86408
G1 X29.749 Y94.062 E.0159
G1 X50.251 Y73.561 E.86408
G1 X50.251 Y74.095 E.0159
G1 X29.749 Y94.596 E.86408
G1 X29.749 Y95.129 E.0159
G1 X50.251 Y74.628 E.86408
G1 X50.251 Y75.162 E.0159
G1 X29.749 Y95.663 E.86408
G1 X29.749 Y96.196 E.0159
G1 X50.251 Y75.695 E.86408
G1 X50.251 Y76.229 E.0159
G1 X29.749 Y96.73 E.86408
G1 X29.749 Y97.263 E.0159
G1 X50.251 Y76.762 E.86408
G1 X50.251 Y77.296 E.0159
G1 X29.749 Y97.797 E.86408
G1 X29.749 Y98.331 E.0159
G1 X50.251 Y77.83 E.86408
G1 X50.251 Y78.363 E.0159
G1 X29.749 Y98.864 E.86408
G1 X29.749 Y99.398 E.0159
G1 X50.251 Y78.897 E.86408
G1 X50.251 Y79.43 E.0159
G1 X29.749 Y99.931 E.86408
G1 X29.749 Y100.465 E.0159
G1 X50.251 Y79.964 E.86408
G1 X50.251 Y80.497 E.0159
G1 X29.749 Y100.998 E.86408
G1 X29.749 Y101.532 E.0159
G1 X50.251 Y81.031 E.86408
G1 X50.251 Y81.565 E.0159
G1 X29.749 Y102.066 E.86408
G1 X29.749 Y102.599 E.0159
G1 X50.251 Y82.098 E.86408
G1 X50.251 Y82.632 E.0159
G1 X29.749 Y103.133 E.86408
G1 X29.749 Y103.666 E.0159
G1 X50.251 Y83.165 E.86408
G1 X50.251 Y83.699 E.0159
G1 X29.749 Y104.2 E.86408
G1 X29.749 Y104.733 E.0159
G1 X50.251 Y84.232 E.86408
G1 X50.251 Y84.766 E.0159
G1 X29.749 Y105.267 E.86408
G1 X29.749 Y105.801 E.0159
G1 X50.251 Y85.3 E.86408
G1 X50.251 Y85.833 E.0159
G1 X29.749 Y106.334 E.86408
G1 X29.749 Y106.868 E.0159
G1 X50.251 Y86.367 E.86408
G1 X50.251 Y86.9 E.0159
G1 X29.749 Y107.401 E.86408
G1 X29.749 Y107.935 E.0159
G1 X50.251 Y87.434 E.86408
G1 X50.251 Y87.967 E.0159
G1 X29.749 Y108.468 E.86408
G1 X29.749 Y109.002 E.0159
G1 X50.251 Y88.501 E.86408
G1 X50.251 Y89.034 E.0159
G1 X29.749 Y109.536 E.86408
G1 X29.749 Y110.069 E.0159
G1 X50.251 Y89.568 E.86408
G1 X50.251 Y90.102 E.0159
G1 X29.749 Y110.603 E.86408
G1 X29.749 Y111.136 E.0159
G1 X50.251 Y90.635 E.86408
G1 X50.251 Y91.169 E.0159
G1 X29.749 Y111.67 E.86408
G1 X29.749 Y112.203 E.0159
G1 X50.251 Y91.702 E.86408
G1 X50.251 Y92.236 E.0159
G1 X29.749 Y112.737 E.86408
G1 X29.749 Y113.271 E.0159
G1 X50.251 Y92.769 E.86408
G1 X50.251 Y93.303 E.0159
G1 X29.749 Y113.804 E.86408
G1 X29.749 Y114.338 E.0159
G1 X50.251 Y93.837 E.86408
G1 X50.251 Y94.37 E.0159
G1 X29.749 Y114.871 E.86408
G1 X29.749 Y115.405 E.0159
G1 X50.251 Y94.904 E.86408
G1 X50.251 Y95.437 E.0159
G1 X29.749 Y115.938 E.86408
G1 X29.749 Y116.472 E.0159
G1 X50.251 Y95.971 E.86408
G1 X50.251 Y96.504 E.0159
G1 X29.749 Y117.006 E.86408
G1 X29.749 Y117.539 E.0159
G1 X50.251 Y97.038 E.86408
G1 X50.251 Y97.572 E.0159
G1 X29.749 Y118.073 E.86408
G1 X29.749 Y118.606 E.0159
G1 X50.251 Y98.105 E.86408
G1 X50.251 Y98.639 E.0159
G1 X29.749 Y119.14 E.86408
G1 X29.749 Y119.673 E.0159
G1 X50.251 Y99.172 E.86408
G1 X50.251 Y99.706 E.0159
G1 X29.749 Y120.207 E.86408
G1 X29.749 Y120.74 E.0159
G1 X50.251 Y100.239 E.86408
G1 X50.251 Y100.773 E.0159
G1 X29.749 Y121.274 E.86408
G1 X29.749 Y121.808 E.0159
G1 X50.251 Y101.307 E.86408
G1 X50.251 Y101.84 E.0159
G1 X29.749 Y122.341 E.86408
G1 X29.749 Y122.875 E.0159
G1 X50.251 Y102.374 E.86408
G1 X50.251 Y102.907 E.0159
G1 X29.749 Y123.408 E.86408
G1 X29.749 Y123.942 E.0159
G1 X50.251 Y103.441 E.86408
G1 X50.251 Y103.974 E.0159
G1 X29.749 Y124.475 E.86408
G1 X29.749 Y125.009 E.0159
G1 X50.251 Y104.508 E.86408
G1 X50.251 Y105.042 E.0159
G1 X29.749 Y125.543 E.86408
G1 X29.749 Y126.076 E.0159
G1 X50.251 Y105.575 E.86408
G1 X50.251 Y106.109 E.0159
G1 X29.749 Y126.61 E.86408
G1 X29.749 Y127.143 E.0159
G1 X50.251 Y106.642 E.86408
G1 X50.251 Y107.176 E.0159
G1 X29.749 Y127.677 E.86408
G1 X29.749 Y128.21 E.0159
G1 X50.251 Y107.709 E.86408
G1 X50.251 Y108.243 E.0159
G1 X29.749 Y128.744 E.86408
G1 X29.749 Y129.278 E.0159
G1 X50.251 Y108.777 E.86408
G1 X50.251 Y109.31 E.0159
G1 X29.749 Y129.811 E.86408
G1 X29.749 Y130.345 E.0159
G1 X50.251 Y109.844 E.86408
G1 X50.251 Y110.377 E.0159
G1 X29.58 Y131.048 E.87123
; WIPE_START
G1 X30.994 Y129.634 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X37.88 Y126.341 Z2.8 F30000
G1 X50.42 Y120.345 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9541.731
G1 X43.168 Y127.598 E.30568
G2 X43.465 Y126.767 I-3.315 J-1.656 E.02637
G1 X50.251 Y119.981 E.28599
G1 X50.251 Y119.448 E.0159
G1 X43.544 Y126.155 E.28267
G2 X43.532 Y125.633 I-4.858 J-.149 E.01556
G1 X50.251 Y118.914 E.28318
G1 X50.251 Y118.381 E.0159
G1 X43.452 Y125.18 E.28656
G2 X43.327 Y124.77 I-2.112 J.418 E.01277
G1 X50.251 Y117.847 E.2918
G1 X50.251 Y117.314 E.0159
G1 X43.166 Y124.398 E.29861
G2 X42.971 Y124.059 I-1.789 J.802 E.01167
G1 X50.251 Y116.78 E.30681
G1 X50.251 Y116.246 E.0159
G1 X42.746 Y123.751 E.31629
G2 X42.492 Y123.471 I-1.522 J1.126 E.01128
G1 X50.251 Y115.713 E.32699
G1 X50.251 Y115.179 E.0159
G1 X42.21 Y123.22 E.3389
G2 X41.897 Y122.999 I-1.258 J1.45 E.01143
G1 X50.251 Y114.646 E.35208
G1 X50.251 Y114.112 E.0159
G1 X41.553 Y122.809 E.36657
G2 X41.176 Y122.653 I-.968 J1.802 E.01219
G1 X50.251 Y113.579 E.38247
G1 X50.251 Y113.045 E.0159
G1 X40.76 Y122.535 E.39999
G2 X40.299 Y122.463 I-.593 J2.264 E.01393
G1 X50.251 Y112.512 E.41942
G1 X50.251 Y111.978 E.0159
G1 X39.768 Y122.46 E.44181
G2 X39.137 Y122.558 I.264 J3.796 E.01906
G1 X50.251 Y111.444 E.46841
G1 X50.251 Y110.911 E.0159
G1 X29.749 Y131.412 E.86408
G1 X29.749 Y131.945 E.0159
G1 X36.555 Y125.14 E.28684
G2 X36.458 Y125.77 I3.101 J.799 E.01904
G1 X29.749 Y132.479 E.28275
G1 X29.749 Y133.013 E.0159
G1 X36.465 Y126.297 E.28304
G2 X36.535 Y126.761 I2.351 J-.118 E.01399
G1 X29.749 Y133.546 E.28599
G1 X29.749 Y134.08 E.0159
G1 X36.651 Y127.178 E.2909
G2 X36.808 Y127.555 I7.301 J-2.809 E.01217
G1 X29.749 Y134.613 E.29749
G1 X29.749 Y135.147 E.0159
G1 X37 Y127.897 E.30559
G2 X37.222 Y128.208 I1.666 J-.954 E.01142
G1 X29.749 Y135.68 E.31495
G1 X29.749 Y136.214 E.0159
G1 X37.473 Y128.49 E.32553
G2 X37.752 Y128.745 I1.411 J-1.269 E.01128
G1 X29.749 Y136.748 E.33731
G1 X29.749 Y137.281 E.0159
G1 X38.06 Y128.97 E.35029
G2 X38.399 Y129.165 I1.145 J-1.593 E.01166
G1 X29.749 Y137.815 E.36455
G1 X29.749 Y138.348 E.0159
G1 X38.77 Y129.328 E.38019
G2 X39.178 Y129.454 I.833 J-1.976 E.01274
G1 X29.749 Y138.882 E.39738
G1 X29.749 Y139.415 E.0159
G1 X39.635 Y129.53 E.41666
G2 X40.154 Y129.545 I.333 J-2.58 E.0155
G1 X29.749 Y139.949 E.43853
G1 X29.749 Y140.483 E.0159
G1 X40.769 Y129.463 E.46446
G2 X41.593 Y129.173 I-.82 J-3.644 E.02608
G1 X29.749 Y141.016 E.49916
G1 X29.749 Y141.55 E.0159
G1 X50.251 Y121.049 E.86408
G1 X50.251 Y121.582 E.0159
G1 X29.749 Y142.083 E.86408
G1 X29.749 Y142.617 E.0159
G1 X50.251 Y122.116 E.86408
G1 X50.251 Y122.649 E.0159
G1 X29.749 Y143.15 E.86408
G1 X29.749 Y143.684 E.0159
G1 X50.251 Y123.183 E.86408
G1 X50.251 Y123.716 E.0159
G1 X29.749 Y144.218 E.86408
G1 X29.749 Y144.751 E.0159
G1 X50.251 Y124.25 E.86408
G1 X50.251 Y124.784 E.0159
G1 X29.749 Y145.285 E.86408
G1 X29.749 Y145.818 E.0159
G1 X50.251 Y125.317 E.86408
G1 X50.251 Y125.851 E.0159
G1 X29.749 Y146.352 E.86408
G1 X29.749 Y146.885 E.0159
G1 X50.251 Y126.384 E.86408
G1 X50.251 Y126.918 E.0159
G1 X29.749 Y147.419 E.86408
G1 X29.749 Y147.952 E.0159
G1 X50.251 Y127.451 E.86408
G1 X50.251 Y127.985 E.0159
G1 X29.749 Y148.486 E.86408
G1 X29.749 Y149.02 E.0159
G1 X50.251 Y128.519 E.86408
G1 X50.251 Y129.052 E.0159
G1 X29.749 Y149.553 E.86408
G1 X29.749 Y150.087 E.0159
G1 X50.251 Y129.586 E.86408
G1 X50.251 Y130.119 E.0159
G1 X29.749 Y150.62 E.86408
G1 X29.749 Y151.154 E.0159
G1 X50.251 Y130.653 E.86408
G1 X50.251 Y131.186 E.0159
G1 X29.749 Y151.687 E.86408
G1 X29.749 Y152.221 E.0159
G1 X50.251 Y131.72 E.86408
G1 X50.251 Y132.254 E.0159
G1 X29.749 Y152.755 E.86408
G1 X29.749 Y153.288 E.0159
G1 X50.251 Y132.787 E.86408
G1 X50.251 Y133.321 E.0159
G1 X29.749 Y153.822 E.86408
G1 X29.749 Y154.355 E.0159
G1 X50.251 Y133.854 E.86408
G1 X50.251 Y134.388 E.0159
G1 X29.749 Y154.889 E.86408
G1 X29.749 Y155.422 E.0159
G1 X50.251 Y134.921 E.86408
G1 X50.251 Y135.455 E.0159
G1 X29.749 Y155.956 E.86408
G1 X29.749 Y156.49 E.0159
G1 X50.251 Y135.989 E.86408
G1 X50.251 Y136.522 E.0159
G1 X29.749 Y157.023 E.86408
G1 X29.749 Y157.557 E.0159
G1 X50.251 Y137.056 E.86408
G1 X50.251 Y137.589 E.0159
G1 X29.749 Y158.09 E.86408
G1 X29.749 Y158.624 E.0159
G1 X50.251 Y138.123 E.86408
G1 X50.251 Y138.656 E.0159
G1 X29.749 Y159.157 E.86408
G1 X29.749 Y159.691 E.0159
G1 X50.251 Y139.19 E.86408
G1 X50.251 Y139.724 E.0159
G1 X29.749 Y160.225 E.86408
G1 X29.749 Y160.758 E.0159
G1 X50.251 Y140.257 E.86408
G1 X50.251 Y140.791 E.0159
G1 X29.749 Y161.292 E.86408
G1 X29.749 Y161.825 E.0159
G1 X50.251 Y141.324 E.86408
G1 X50.251 Y141.858 E.0159
G1 X29.749 Y162.359 E.86408
G1 X29.749 Y162.892 E.0159
G1 X50.251 Y142.391 E.86408
G1 X50.251 Y142.925 E.0159
G1 X29.749 Y163.426 E.86408
G1 X29.749 Y163.96 E.0159
G1 X50.251 Y143.458 E.86408
G1 X50.251 Y143.992 E.0159
G1 X29.749 Y164.493 E.86408
G1 X29.749 Y165.027 E.0159
G1 X50.251 Y144.526 E.86408
G1 X50.251 Y145.059 E.0159
G1 X29.749 Y165.56 E.86408
G1 X29.749 Y166.094 E.0159
G1 X50.251 Y145.593 E.86408
G1 X50.251 Y146.126 E.0159
G1 X29.749 Y166.627 E.86408
G1 X29.749 Y167.161 E.0159
G1 X50.251 Y146.66 E.86408
G1 X50.251 Y147.193 E.0159
G1 X29.749 Y167.695 E.86408
G1 X29.749 Y168.228 E.0159
G1 X50.251 Y147.727 E.86408
G1 X50.251 Y148.261 E.0159
G1 X29.749 Y168.762 E.86408
G1 X29.749 Y169.295 E.0159
G1 X50.251 Y148.794 E.86408
G1 X50.251 Y149.328 E.0159
G1 X29.749 Y169.829 E.86408
G1 X29.749 Y170.362 E.0159
G1 X50.251 Y149.861 E.86408
G1 X50.251 Y150.395 E.0159
G1 X29.749 Y170.896 E.86408
G1 X29.749 Y171.43 E.0159
G1 X50.251 Y150.928 E.86408
G1 X50.251 Y151.462 E.0159
G1 X29.749 Y171.963 E.86408
G1 X29.749 Y172.497 E.0159
G1 X50.251 Y151.996 E.86408
G1 X50.251 Y152.529 E.0159
G1 X29.749 Y173.03 E.86408
G1 X29.749 Y173.564 E.0159
G1 X50.251 Y153.063 E.86408
G1 X50.251 Y153.596 E.0159
G1 X29.749 Y174.097 E.86408
G1 X29.749 Y174.631 E.0159
G1 X50.251 Y154.13 E.86408
G1 X50.251 Y154.663 E.0159
G1 X29.749 Y175.164 E.86408
G1 X29.749 Y175.698 E.0159
G1 X50.251 Y155.197 E.86408
G1 X50.251 Y155.731 E.0159
G1 X29.749 Y176.232 E.86408
G1 X29.749 Y176.765 E.0159
G1 X50.251 Y156.264 E.86408
G1 X50.251 Y156.798 E.0159
G1 X29.749 Y177.299 E.86408
M73 P75 R19
G1 X29.749 Y177.832 E.0159
G1 X50.251 Y157.331 E.86408
G1 X50.251 Y157.865 E.0159
G1 X29.749 Y178.366 E.86408
G1 X29.749 Y178.899 E.0159
G1 X50.251 Y158.398 E.86408
G1 X50.251 Y158.932 E.0159
G1 X29.749 Y179.433 E.86408
G1 X29.749 Y179.967 E.0159
G1 X50.251 Y159.466 E.86408
G1 X50.251 Y159.999 E.0159
G1 X29.749 Y180.5 E.86408
G1 X29.749 Y181.034 E.0159
G1 X50.251 Y160.533 E.86408
G1 X50.251 Y161.066 E.0159
G1 X29.749 Y181.567 E.86408
G1 X29.749 Y182.101 E.0159
G1 X50.251 Y161.6 E.86408
G1 X50.251 Y162.133 E.0159
G1 X29.749 Y182.634 E.86408
G1 X29.749 Y183.168 E.0159
G1 X50.251 Y162.667 E.86408
G1 X50.251 Y163.201 E.0159
G1 X29.749 Y183.702 E.86408
G1 X29.749 Y184.235 E.0159
G1 X50.251 Y163.734 E.86408
G1 X50.251 Y164.268 E.0159
G1 X29.749 Y184.769 E.86408
G1 X29.749 Y185.302 E.0159
G1 X50.251 Y164.801 E.86408
G1 X50.251 Y165.335 E.0159
G1 X29.749 Y185.836 E.86408
G1 X29.749 Y186.369 E.0159
G1 X50.251 Y165.868 E.86408
G1 X50.251 Y166.402 E.0159
G1 X29.749 Y186.903 E.86408
G1 X29.749 Y187.437 E.0159
G1 X50.251 Y166.935 E.86408
G1 X50.251 Y167.469 E.0159
G1 X29.749 Y187.97 E.86408
G1 X29.749 Y188.504 E.0159
G1 X50.251 Y168.003 E.86408
G1 X50.251 Y168.536 E.0159
G1 X29.749 Y189.037 E.86408
G1 X29.749 Y189.571 E.0159
G1 X50.251 Y169.07 E.86408
G1 X50.251 Y169.603 E.0159
G1 X29.749 Y190.104 E.86408
G1 X29.749 Y190.638 E.0159
G1 X50.251 Y170.137 E.86408
G1 X50.251 Y170.67 E.0159
G1 X29.749 Y191.172 E.86408
G1 X29.749 Y191.705 E.0159
G1 X50.251 Y171.204 E.86408
G1 X50.251 Y171.738 E.0159
G1 X29.749 Y192.239 E.86408
G1 X29.749 Y192.772 E.0159
G1 X50.251 Y172.271 E.86408
G1 X50.251 Y172.805 E.0159
G1 X29.749 Y193.306 E.86408
G1 X29.749 Y193.839 E.0159
G1 X50.251 Y173.338 E.86408
G1 X50.251 Y173.872 E.0159
G1 X29.749 Y194.373 E.86408
G1 X29.749 Y194.907 E.0159
G1 X50.251 Y174.405 E.86408
G1 X50.251 Y174.939 E.0159
G1 X29.749 Y195.44 E.86408
G1 X29.749 Y195.974 E.0159
G1 X50.251 Y175.473 E.86408
G1 X50.251 Y176.006 E.0159
G1 X29.749 Y196.507 E.86408
G1 X29.749 Y197.041 E.0159
G1 X50.251 Y176.54 E.86408
G1 X50.251 Y177.073 E.0159
G1 X29.749 Y197.574 E.86408
G1 X29.749 Y198.108 E.0159
G1 X50.251 Y177.607 E.86408
G1 X50.251 Y178.14 E.0159
G1 X29.749 Y198.642 E.86408
G1 X29.749 Y199.175 E.0159
G1 X50.251 Y178.674 E.86408
G1 X50.251 Y179.208 E.0159
G1 X29.749 Y199.709 E.86408
G1 X29.749 Y200.242 E.0159
G1 X50.251 Y179.741 E.86408
G1 X50.251 Y180.275 E.0159
G1 X29.749 Y200.776 E.86408
G1 X29.749 Y201.309 E.0159
G1 X50.251 Y180.808 E.86408
G1 X50.251 Y181.342 E.0159
G1 X29.749 Y201.843 E.86408
G1 X29.749 Y202.376 E.0159
G1 X50.251 Y181.875 E.86408
M73 P75 R18
G1 X50.251 Y182.409 E.0159
G1 X29.749 Y202.91 E.86408
G1 X29.749 Y203.444 E.0159
G1 X50.251 Y182.943 E.86408
G1 X50.251 Y183.476 E.0159
G1 X29.749 Y203.977 E.86408
G1 X29.749 Y204.511 E.0159
G1 X50.251 Y184.01 E.86408
G1 X50.251 Y184.543 E.0159
G1 X29.749 Y205.044 E.86408
G1 X29.749 Y205.578 E.0159
G1 X50.251 Y185.077 E.86408
G1 X50.251 Y185.61 E.0159
G1 X29.749 Y206.111 E.86408
G1 X29.749 Y206.645 E.0159
G1 X50.251 Y186.144 E.86408
G1 X50.251 Y186.678 E.0159
G1 X29.749 Y207.179 E.86408
G1 X29.749 Y207.712 E.0159
G1 X50.251 Y187.211 E.86408
G1 X50.251 Y187.745 E.0159
G1 X29.749 Y208.246 E.86408
G1 X29.749 Y208.779 E.0159
G1 X50.251 Y188.278 E.86408
G1 X50.251 Y188.812 E.0159
G1 X29.749 Y209.313 E.86408
G1 X29.749 Y209.846 E.0159
G1 X50.251 Y189.345 E.86408
G1 X50.251 Y189.879 E.0159
G1 X29.749 Y210.38 E.86408
G1 X29.749 Y210.914 E.0159
G1 X50.251 Y190.413 E.86408
G1 X50.251 Y190.946 E.0159
G1 X29.749 Y211.447 E.86408
G1 X29.749 Y211.981 E.0159
G1 X50.251 Y191.48 E.86408
G1 X50.251 Y192.013 E.0159
G1 X29.58 Y212.684 E.87123
; WIPE_START
G1 X30.994 Y211.27 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X37.606 Y207.456 Z2.8 F30000
G1 X54.947 Y197.455 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9541.731
G1 X43.345 Y209.057 E.489
G2 X43.515 Y208.353 I-3.386 J-1.193 E.02163
G1 X54.244 Y197.624 E.45218
G1 X53.71 Y197.624 E.0159
G1 X43.547 Y207.787 E.42834
G2 X43.501 Y207.3 I-2.462 J-.01 E.0146
G1 X53.176 Y197.624 E.40781
G1 X52.643 Y197.624 E.0159
G1 X43.403 Y206.864 E.38944
G2 X43.262 Y206.472 I-6.643 J2.175 E.01242
G1 X52.109 Y197.624 E.37291
G1 X51.576 Y197.624 E.0159
G1 X43.083 Y206.117 E.35795
G2 X42.873 Y205.793 I-1.725 J.887 E.01152
G1 X51.042 Y197.624 E.3443
G1 X50.509 Y197.624 E.0159
G1 X42.634 Y205.499 E.33189
G2 X42.367 Y205.233 I-1.46 J1.2 E.01126
G1 X50.251 Y197.349 E.33229
G1 X50.251 Y196.815 E.0159
G1 X42.071 Y204.995 E.34476
G2 X41.746 Y204.787 I-1.202 J1.52 E.01153
G1 X50.251 Y196.282 E.35847
G1 X50.251 Y195.748 E.0159
G1 X41.389 Y204.61 E.37351
G2 X40.997 Y204.468 I-.905 J1.885 E.01243
G1 X50.251 Y195.215 E.39001
G1 X50.251 Y194.681 E.0159
G1 X40.561 Y204.37 E.40838
G2 X40.065 Y204.333 I-.396 J1.945 E.01487
G1 X50.251 Y194.147 E.4293
G1 X50.251 Y193.614 E.0159
G1 X39.504 Y204.361 E.45295
G2 X38.793 Y204.538 I.584 J3.851 E.02188
G1 X50.251 Y193.08 E.48293
G1 X50.251 Y192.547 E.0159
G1 X29.749 Y213.048 E.86408
G1 X29.749 Y213.581 E.0159
G1 X36.659 Y206.672 E.29122
G2 X36.485 Y207.38 I4.229 J1.417 E.02175
G1 X29.749 Y214.115 E.28387
G1 X29.749 Y214.649 E.0159
G1 X36.453 Y207.945 E.28253
G2 X36.495 Y208.437 I4.626 J-.146 E.01471
G1 X29.749 Y215.182 E.2843
G1 X29.749 Y215.716 E.0159
G1 X36.595 Y208.87 E.28852
G2 X36.736 Y209.263 I2.039 J-.509 E.01246
G1 X29.749 Y216.249 E.29445
G1 X29.749 Y216.783 E.0159
G1 X36.912 Y209.621 E.30187
G2 X37.119 Y209.947 I1.734 J-.876 E.01154
G1 X29.749 Y217.316 E.31062
G1 X29.749 Y217.85 E.0159
G1 X37.356 Y210.243 E.32062
G2 X37.622 Y210.511 I1.47 J-1.193 E.01126
G1 X30.007 Y218.126 E.32094
G1 X30.541 Y218.126 E.0159
G1 X37.916 Y210.75 E.31085
G2 X38.241 Y210.959 I6.411 J-9.599 E.01151
G1 X31.075 Y218.126 E.30204
G1 X31.608 Y218.126 E.0159
G1 X38.598 Y211.136 E.29462
G2 X38.991 Y211.276 I.9 J-1.896 E.01246
G1 X32.142 Y218.126 E.28869
G1 X32.675 Y218.126 E.0159
G1 X39.425 Y211.376 E.2845
G2 X39.909 Y211.425 I.491 J-2.396 E.01452
G1 X33.209 Y218.126 E.2824
G1 X33.742 Y218.126 E.0159
G1 X40.478 Y211.39 E.28389
G2 X41.181 Y211.22 I-.49 J-3.568 E.02161
G1 X34.276 Y218.126 E.29105
G1 X34.81 Y218.126 E.0159
G1 X55.311 Y197.624 E.86408
G1 X55.844 Y197.624 E.0159
G1 X35.343 Y218.126 E.86408
G1 X35.877 Y218.126 E.0159
G1 X56.378 Y197.624 E.86408
G1 X56.911 Y197.624 E.0159
G1 X36.41 Y218.126 E.86408
G1 X36.944 Y218.126 E.0159
G1 X57.445 Y197.624 E.86408
G1 X57.979 Y197.624 E.0159
G1 X37.477 Y218.126 E.86408
G1 X38.011 Y218.126 E.0159
G1 X58.512 Y197.624 E.86408
G1 X59.046 Y197.624 E.0159
G1 X38.545 Y218.126 E.86408
G1 X39.078 Y218.126 E.0159
G1 X59.579 Y197.624 E.86408
G1 X60.113 Y197.624 E.0159
G1 X39.612 Y218.126 E.86408
G1 X40.145 Y218.126 E.0159
G1 X60.646 Y197.624 E.86408
G1 X61.18 Y197.624 E.0159
G1 X40.679 Y218.126 E.86408
G1 X41.212 Y218.126 E.0159
G1 X61.713 Y197.624 E.86408
G1 X62.247 Y197.624 E.0159
G1 X41.746 Y218.126 E.86408
G1 X42.28 Y218.126 E.0159
G1 X62.781 Y197.624 E.86408
G1 X63.314 Y197.624 E.0159
G1 X42.813 Y218.126 E.86408
G1 X43.347 Y218.126 E.0159
G1 X63.848 Y197.624 E.86408
G1 X64.381 Y197.624 E.0159
G1 X43.88 Y218.126 E.86408
G1 X44.414 Y218.126 E.0159
G1 X64.915 Y197.624 E.86408
G1 X65.448 Y197.624 E.0159
G1 X44.947 Y218.126 E.86408
G1 X45.481 Y218.126 E.0159
G1 X65.982 Y197.624 E.86408
G1 X66.516 Y197.624 E.0159
G1 X46.015 Y218.126 E.86408
G1 X46.548 Y218.126 E.0159
G1 X67.049 Y197.624 E.86408
G1 X67.583 Y197.624 E.0159
G1 X47.082 Y218.126 E.86408
G1 X47.615 Y218.126 E.0159
G1 X68.116 Y197.624 E.86408
G1 X68.65 Y197.624 E.0159
G1 X48.149 Y218.126 E.86408
G1 X48.682 Y218.126 E.0159
G1 X69.183 Y197.624 E.86408
G1 X69.717 Y197.624 E.0159
G1 X49.216 Y218.126 E.86408
G1 X49.75 Y218.126 E.0159
G1 X70.251 Y197.624 E.86408
G1 X70.784 Y197.624 E.0159
G1 X50.283 Y218.126 E.86408
G1 X50.817 Y218.126 E.0159
G1 X71.318 Y197.624 E.86408
G1 X71.851 Y197.624 E.0159
G1 X51.35 Y218.126 E.86408
G1 X51.884 Y218.126 E.0159
G1 X72.385 Y197.624 E.86408
G1 X72.918 Y197.624 E.0159
G1 X52.417 Y218.126 E.86408
G1 X52.951 Y218.126 E.0159
G1 X73.452 Y197.624 E.86408
G1 X73.986 Y197.624 E.0159
G1 X53.484 Y218.126 E.86408
G1 X54.018 Y218.126 E.0159
G1 X74.519 Y197.624 E.86408
G1 X75.053 Y197.624 E.0159
G1 X54.552 Y218.126 E.86408
G1 X55.085 Y218.126 E.0159
G1 X75.586 Y197.624 E.86408
G1 X76.12 Y197.624 E.0159
G1 X55.619 Y218.126 E.86408
G1 X56.152 Y218.126 E.0159
G1 X76.653 Y197.624 E.86408
G1 X77.187 Y197.624 E.0159
G1 X56.686 Y218.126 E.86408
G1 X57.219 Y218.126 E.0159
G1 X77.721 Y197.624 E.86408
G1 X78.254 Y197.624 E.0159
G1 X57.753 Y218.126 E.86408
G1 X58.287 Y218.126 E.0159
G1 X78.788 Y197.624 E.86408
G1 X79.321 Y197.624 E.0159
G1 X58.82 Y218.126 E.86408
G1 X59.354 Y218.126 E.0159
G1 X79.855 Y197.624 E.86408
G1 X80.388 Y197.624 E.0159
G1 X59.887 Y218.126 E.86408
G1 X60.421 Y218.126 E.0159
G1 X80.922 Y197.624 E.86408
G1 X81.456 Y197.624 E.0159
G1 X60.954 Y218.126 E.86408
G1 X61.488 Y218.126 E.0159
G1 X81.989 Y197.624 E.86408
G1 X82.523 Y197.624 E.0159
G1 X62.022 Y218.126 E.86408
G1 X62.555 Y218.126 E.0159
G1 X83.056 Y197.624 E.86408
G1 X83.59 Y197.624 E.0159
G1 X63.089 Y218.126 E.86408
G1 X63.622 Y218.126 E.0159
G1 X84.123 Y197.624 E.86408
G1 X84.657 Y197.624 E.0159
G1 X64.156 Y218.126 E.86408
G1 X64.689 Y218.126 E.0159
G1 X85.191 Y197.624 E.86408
G1 X85.724 Y197.624 E.0159
G1 X65.223 Y218.126 E.86408
G1 X65.757 Y218.126 E.0159
G1 X86.258 Y197.624 E.86408
G1 X86.791 Y197.624 E.0159
G1 X66.29 Y218.126 E.86408
G1 X66.824 Y218.126 E.0159
G1 X87.325 Y197.624 E.86408
G1 X87.858 Y197.624 E.0159
G1 X67.357 Y218.126 E.86408
G1 X67.891 Y218.126 E.0159
G1 X88.392 Y197.624 E.86408
G1 X88.925 Y197.624 E.0159
G1 X68.424 Y218.126 E.86408
G1 X68.958 Y218.126 E.0159
G1 X89.459 Y197.624 E.86408
G1 X89.993 Y197.624 E.0159
G1 X69.492 Y218.126 E.86408
G1 X70.025 Y218.126 E.0159
G1 X90.526 Y197.624 E.86408
G1 X91.06 Y197.624 E.0159
G1 X70.559 Y218.126 E.86408
G1 X71.092 Y218.126 E.0159
G1 X91.593 Y197.624 E.86408
G1 X92.127 Y197.624 E.0159
G1 X71.626 Y218.126 E.86408
G1 X72.159 Y218.126 E.0159
G1 X92.66 Y197.624 E.86408
G1 X93.194 Y197.624 E.0159
G1 X72.693 Y218.126 E.86408
G1 X73.227 Y218.126 E.0159
G1 X93.728 Y197.624 E.86408
G1 X94.261 Y197.624 E.0159
G1 X73.76 Y218.126 E.86408
G1 X74.294 Y218.126 E.0159
G1 X94.795 Y197.624 E.86408
G1 X95.328 Y197.624 E.0159
G1 X74.827 Y218.126 E.86408
G1 X75.361 Y218.126 E.0159
G1 X95.862 Y197.624 E.86408
G1 X96.395 Y197.624 E.0159
G1 X75.894 Y218.126 E.86408
G1 X76.428 Y218.126 E.0159
G1 X96.929 Y197.624 E.86408
G1 X97.463 Y197.624 E.0159
G1 X76.962 Y218.126 E.86408
G1 X77.495 Y218.126 E.0159
G1 X97.996 Y197.624 E.86408
G1 X98.53 Y197.624 E.0159
G1 X78.029 Y218.126 E.86408
G1 X78.562 Y218.126 E.0159
G1 X99.063 Y197.624 E.86408
G1 X99.597 Y197.624 E.0159
G1 X79.096 Y218.126 E.86408
G1 X79.629 Y218.126 E.0159
G1 X100.13 Y197.624 E.86408
G1 X100.664 Y197.624 E.0159
G1 X80.163 Y218.126 E.86408
G1 X80.696 Y218.126 E.0159
G1 X101.198 Y197.624 E.86408
G1 X101.731 Y197.624 E.0159
G1 X81.23 Y218.126 E.86408
G1 X81.764 Y218.126 E.0159
G1 X102.265 Y197.624 E.86408
G1 X102.798 Y197.624 E.0159
G1 X82.297 Y218.126 E.86408
G1 X82.831 Y218.126 E.0159
G1 X103.332 Y197.624 E.86408
G1 X103.865 Y197.624 E.0159
G1 X83.364 Y218.126 E.86408
G1 X83.898 Y218.126 E.0159
G1 X104.399 Y197.624 E.86408
G1 X104.933 Y197.624 E.0159
G1 X84.431 Y218.126 E.86408
G1 X84.965 Y218.126 E.0159
G1 X105.466 Y197.624 E.86408
G1 X106 Y197.624 E.0159
G1 X85.499 Y218.126 E.86408
G1 X86.032 Y218.126 E.0159
G1 X106.533 Y197.624 E.86408
G1 X107.067 Y197.624 E.0159
G1 X86.566 Y218.126 E.86408
G1 X87.099 Y218.126 E.0159
G1 X107.6 Y197.624 E.86408
G1 X108.134 Y197.624 E.0159
G1 X87.633 Y218.126 E.86408
G1 X88.166 Y218.126 E.0159
G1 X108.668 Y197.624 E.86408
G1 X109.201 Y197.624 E.0159
G1 X88.7 Y218.126 E.86408
G1 X89.234 Y218.126 E.0159
G1 X109.735 Y197.624 E.86408
G1 X110.268 Y197.624 E.0159
G1 X89.767 Y218.126 E.86408
G1 X90.301 Y218.126 E.0159
G1 X110.802 Y197.624 E.86408
G1 X111.335 Y197.624 E.0159
G1 X90.834 Y218.126 E.86408
G1 X91.368 Y218.126 E.0159
G1 X111.869 Y197.624 E.86408
G1 X112.403 Y197.624 E.0159
G1 X91.901 Y218.126 E.86408
G1 X92.435 Y218.126 E.0159
G1 X112.936 Y197.624 E.86408
G1 X113.47 Y197.624 E.0159
G1 X92.969 Y218.126 E.86408
G1 X93.502 Y218.126 E.0159
G1 X114.003 Y197.624 E.86408
G1 X114.537 Y197.624 E.0159
G1 X94.036 Y218.126 E.86408
G1 X94.569 Y218.126 E.0159
G1 X115.07 Y197.624 E.86408
G1 X115.604 Y197.624 E.0159
G1 X95.103 Y218.126 E.86408
G1 X95.636 Y218.126 E.0159
G1 X116.138 Y197.624 E.86408
G1 X116.671 Y197.624 E.0159
G1 X96.17 Y218.126 E.86408
G1 X96.704 Y218.126 E.0159
G1 X117.205 Y197.624 E.86408
G1 X117.738 Y197.624 E.0159
G1 X97.237 Y218.126 E.86408
G1 X97.771 Y218.126 E.0159
G1 X118.272 Y197.624 E.86408
G1 X118.805 Y197.624 E.0159
G1 X98.304 Y218.126 E.86408
G1 X98.838 Y218.126 E.0159
G1 X119.339 Y197.624 E.86408
G1 X119.872 Y197.624 E.0159
G1 X99.371 Y218.126 E.86408
G1 X99.905 Y218.126 E.0159
G1 X120.406 Y197.624 E.86408
G1 X120.94 Y197.624 E.0159
G1 X100.439 Y218.126 E.86408
G1 X100.972 Y218.126 E.0159
G1 X121.473 Y197.624 E.86408
G1 X122.007 Y197.624 E.0159
G1 X101.506 Y218.126 E.86408
G1 X102.039 Y218.126 E.0159
G1 X122.54 Y197.624 E.86408
G1 X123.074 Y197.624 E.0159
G1 X102.573 Y218.126 E.86408
G1 X103.106 Y218.126 E.0159
G1 X123.607 Y197.624 E.86408
G1 X124.141 Y197.624 E.0159
G1 X103.64 Y218.126 E.86408
G1 X104.174 Y218.126 E.0159
G1 X124.675 Y197.624 E.86408
G1 X125.208 Y197.624 E.0159
G1 X104.707 Y218.126 E.86408
G1 X105.241 Y218.126 E.0159
G1 X125.742 Y197.624 E.86408
G1 X126.275 Y197.624 E.0159
G1 X105.774 Y218.126 E.86408
G1 X106.308 Y218.126 E.0159
G1 X126.809 Y197.624 E.86408
M73 P76 R18
G1 X127.342 Y197.624 E.0159
G1 X106.841 Y218.126 E.86408
G1 X107.375 Y218.126 E.0159
G1 X127.876 Y197.624 E.86408
G1 X128.41 Y197.624 E.0159
G1 X107.909 Y218.126 E.86408
G1 X108.442 Y218.126 E.0159
G1 X128.943 Y197.624 E.86408
G1 X129.477 Y197.624 E.0159
G1 X108.976 Y218.126 E.86408
G1 X109.509 Y218.126 E.0159
G1 X130.01 Y197.624 E.86408
G1 X130.544 Y197.624 E.0159
G1 X110.043 Y218.126 E.86408
G1 X110.576 Y218.126 E.0159
G1 X131.077 Y197.624 E.86408
G1 X131.611 Y197.624 E.0159
G1 X111.11 Y218.126 E.86408
G1 X111.643 Y218.126 E.0159
G1 X132.145 Y197.624 E.86408
G1 X132.678 Y197.624 E.0159
G1 X112.007 Y218.295 E.87123
G1 X122.145 Y218.295 F30000
G1 F9541.731
G1 X129.24 Y211.2 E.29903
G3 X128.522 Y211.385 I-1.303 J-3.591 E.02211
G1 X121.781 Y218.126 E.28412
G1 X121.248 Y218.126 E.0159
G1 X127.949 Y211.425 E.28243
G3 X127.458 Y211.381 I.158 J-4.589 E.01468
G1 X120.714 Y218.126 E.28425
G1 X120.181 Y218.126 E.0159
G1 X127.021 Y211.285 E.28833
G3 X126.626 Y211.146 I.493 J-2.046 E.0125
G1 X119.647 Y218.126 E.29416
G1 X119.113 Y218.126 E.0159
G1 X126.266 Y210.973 E.30149
G3 X125.939 Y210.767 I.866 J-1.741 E.01155
G1 X118.58 Y218.126 E.31017
G1 X118.046 Y218.126 E.0159
G1 X125.642 Y210.53 E.32014
G3 X125.374 Y210.264 I1.196 J-1.472 E.01126
G1 X117.513 Y218.126 E.33134
G1 X116.979 Y218.126 E.0159
G1 X125.135 Y209.97 E.34375
G3 X124.925 Y209.646 I1.511 J-1.208 E.01152
G1 X116.446 Y218.126 E.3574
G1 X115.912 Y218.126 E.0159
G1 X124.747 Y209.29 E.37238
G3 X124.604 Y208.9 I1.884 J-.912 E.01241
G1 X115.378 Y218.126 E.38884
G1 X114.845 Y218.126 E.0159
G1 X124.501 Y208.469 E.40699
G3 X124.453 Y207.984 I4.401 J-.684 E.01454
G1 X114.311 Y218.126 E.42744
G1 X113.778 Y218.126 E.0159
G1 X124.48 Y207.423 E.45109
G3 X124.642 Y206.728 I3.861 J.53 E.02129
G1 X113.244 Y218.126 E.48038
G1 X112.711 Y218.126 E.0159
G1 X133.212 Y197.624 E.86408
G1 X133.745 Y197.624 E.0159
G1 X126.857 Y204.513 E.29034
G3 X127.551 Y204.352 I1.447 J4.668 E.02126
G1 X134.279 Y197.624 E.28356
G1 X134.812 Y197.624 E.0159
G1 X128.104 Y204.333 E.28275
G3 X128.596 Y204.375 I.081 J1.968 E.01475
G1 X135.346 Y197.624 E.28451
G1 X135.88 Y197.624 E.0159
G1 X129.026 Y204.478 E.28885
G3 X129.416 Y204.622 I-.527 J2.018 E.01239
G1 X136.413 Y197.624 E.29494
G1 X136.947 Y197.624 E.0159
G1 X129.77 Y204.801 E.30248
G3 X130.093 Y205.011 I-.89 J1.722 E.01151
G1 X137.48 Y197.624 E.31134
G1 X138.014 Y197.624 E.0159
G1 X130.387 Y205.251 E.32144
G3 X130.653 Y205.519 I-1.203 J1.457 E.01126
G1 X138.547 Y197.624 E.33274
G1 X139.081 Y197.624 E.0159
G1 X130.89 Y205.815 E.34524
G3 X131.098 Y206.141 I-1.527 J1.203 E.01154
G1 X139.615 Y197.624 E.35897
G1 X140.148 Y197.624 E.0159
G1 X131.274 Y206.499 E.37403
G3 X131.411 Y206.895 I-1.917 J.884 E.01253
G1 X140.682 Y197.624 E.39074
G1 X141.215 Y197.624 E.0159
G1 X131.506 Y207.334 E.40924
G3 X131.549 Y207.824 I-2.432 J.462 E.01469
G1 X141.749 Y197.624 E.4299
G1 X142.282 Y197.624 E.0159
G1 X131.508 Y208.398 E.4541
G3 X131.323 Y209.118 I-3.52 J-.526 E.02219
G1 X142.816 Y197.624 E.48442
G1 X143.35 Y197.624 E.0159
G1 X122.848 Y218.126 E.86408
G1 X123.382 Y218.126 E.0159
G1 X143.883 Y197.624 E.86408
G1 X144.417 Y197.624 E.0159
G1 X123.916 Y218.126 E.86408
G1 X124.449 Y218.126 E.0159
G1 X144.95 Y197.624 E.86408
G1 X145.484 Y197.624 E.0159
G1 X124.983 Y218.126 E.86408
G1 X125.516 Y218.126 E.0159
G1 X146.017 Y197.624 E.86408
G1 X146.551 Y197.624 E.0159
G1 X126.05 Y218.126 E.86408
G1 X126.583 Y218.126 E.0159
G1 X147.084 Y197.624 E.86408
G1 X147.618 Y197.624 E.0159
G1 X127.117 Y218.126 E.86408
G1 X127.651 Y218.126 E.0159
G1 X148.152 Y197.624 E.86408
G1 X148.685 Y197.624 E.0159
G1 X128.184 Y218.126 E.86408
G1 X128.718 Y218.126 E.0159
G1 X149.219 Y197.624 E.86408
G1 X149.752 Y197.624 E.0159
G1 X129.251 Y218.126 E.86408
G1 X129.785 Y218.126 E.0159
G1 X150.286 Y197.624 E.86408
G1 X150.819 Y197.624 E.0159
G1 X130.318 Y218.126 E.86408
G1 X130.852 Y218.126 E.0159
G1 X151.353 Y197.624 E.86408
G1 X151.887 Y197.624 E.0159
G1 X131.386 Y218.126 E.86408
G1 X131.919 Y218.126 E.0159
G1 X152.42 Y197.624 E.86408
G1 X152.954 Y197.624 E.0159
G1 X132.453 Y218.126 E.86408
G1 X132.986 Y218.126 E.0159
G1 X153.487 Y197.624 E.86408
G1 X154.021 Y197.624 E.0159
G1 X133.52 Y218.126 E.86408
G1 X134.053 Y218.126 E.0159
G1 X154.554 Y197.624 E.86408
G1 X155.088 Y197.624 E.0159
G1 X134.587 Y218.126 E.86408
G1 X135.121 Y218.126 E.0159
G1 X155.622 Y197.624 E.86408
G1 X156.155 Y197.624 E.0159
G1 X135.654 Y218.126 E.86408
G1 X136.188 Y218.126 E.0159
G1 X156.689 Y197.624 E.86408
G1 X157.222 Y197.624 E.0159
G1 X136.721 Y218.126 E.86408
G1 X137.255 Y218.126 E.0159
G1 X157.756 Y197.624 E.86408
G1 X158.289 Y197.624 E.0159
G1 X137.788 Y218.126 E.86408
G1 X138.322 Y218.126 E.0159
G1 X158.823 Y197.624 E.86408
G1 X159.357 Y197.624 E.0159
G1 X138.855 Y218.126 E.86408
G1 X139.389 Y218.126 E.0159
G1 X159.89 Y197.624 E.86408
G1 X160.424 Y197.624 E.0159
G1 X139.923 Y218.126 E.86408
G1 X140.456 Y218.126 E.0159
G1 X160.957 Y197.624 E.86408
G1 X161.491 Y197.624 E.0159
G1 X140.99 Y218.126 E.86408
G1 X141.523 Y218.126 E.0159
G1 X162.024 Y197.624 E.86408
G1 X162.558 Y197.624 E.0159
G1 X142.057 Y218.126 E.86408
G1 X142.59 Y218.126 E.0159
G1 X163.092 Y197.624 E.86408
G1 X163.625 Y197.624 E.0159
G1 X143.124 Y218.126 E.86408
G1 X143.658 Y218.126 E.0159
G1 X164.159 Y197.624 E.86408
G1 X164.692 Y197.624 E.0159
G1 X144.191 Y218.126 E.86408
G1 X144.725 Y218.126 E.0159
G1 X165.226 Y197.624 E.86408
G1 X165.759 Y197.624 E.0159
G1 X145.258 Y218.126 E.86408
G1 X145.792 Y218.126 E.0159
G1 X166.293 Y197.624 E.86408
G1 X166.827 Y197.624 E.0159
G1 X146.325 Y218.126 E.86408
G1 X146.859 Y218.126 E.0159
G1 X167.36 Y197.624 E.86408
G1 X167.894 Y197.624 E.0159
G1 X147.393 Y218.126 E.86408
G1 X147.926 Y218.126 E.0159
G1 X168.427 Y197.624 E.86408
G1 X168.961 Y197.624 E.0159
G1 X148.46 Y218.126 E.86408
G1 X148.993 Y218.126 E.0159
G1 X169.494 Y197.624 E.86408
G1 X170.028 Y197.624 E.0159
G1 X149.527 Y218.126 E.86408
G1 X150.06 Y218.126 E.0159
G1 X170.562 Y197.624 E.86408
G1 X171.095 Y197.624 E.0159
G1 X150.594 Y218.126 E.86408
G1 X151.128 Y218.126 E.0159
G1 X171.629 Y197.624 E.86408
G1 X172.162 Y197.624 E.0159
G1 X151.661 Y218.126 E.86408
G1 X152.195 Y218.126 E.0159
G1 X172.696 Y197.624 E.86408
G1 X173.229 Y197.624 E.0159
G1 X152.728 Y218.126 E.86408
G1 X153.262 Y218.126 E.0159
G1 X173.763 Y197.624 E.86408
G1 X174.296 Y197.624 E.0159
G1 X153.795 Y218.126 E.86408
G1 X154.329 Y218.126 E.0159
G1 X174.83 Y197.624 E.86408
G1 X175.364 Y197.624 E.0159
G1 X154.863 Y218.126 E.86408
G1 X155.396 Y218.126 E.0159
G1 X175.897 Y197.624 E.86408
G1 X176.431 Y197.624 E.0159
G1 X155.93 Y218.126 E.86408
G1 X156.463 Y218.126 E.0159
G1 X176.964 Y197.624 E.86408
G1 X177.498 Y197.624 E.0159
G1 X156.997 Y218.126 E.86408
G1 X157.53 Y218.126 E.0159
G1 X178.031 Y197.624 E.86408
G1 X178.565 Y197.624 E.0159
G1 X158.064 Y218.126 E.86408
G1 X158.598 Y218.126 E.0159
G1 X179.099 Y197.624 E.86408
G1 X179.632 Y197.624 E.0159
G1 X159.131 Y218.126 E.86408
G1 X159.665 Y218.126 E.0159
G1 X180.166 Y197.624 E.86408
G1 X180.699 Y197.624 E.0159
G1 X160.198 Y218.126 E.86408
G1 X160.732 Y218.126 E.0159
G1 X181.233 Y197.624 E.86408
G1 X181.766 Y197.624 E.0159
G1 X161.265 Y218.126 E.86408
G1 X161.799 Y218.126 E.0159
G1 X182.3 Y197.624 E.86408
G1 X182.834 Y197.624 E.0159
G1 X162.333 Y218.126 E.86408
G1 X162.866 Y218.126 E.0159
G1 X183.367 Y197.624 E.86408
G1 X183.901 Y197.624 E.0159
G1 X163.4 Y218.126 E.86408
G1 X163.933 Y218.126 E.0159
G1 X184.434 Y197.624 E.86408
G1 X184.968 Y197.624 E.0159
G1 X164.467 Y218.126 E.86408
G1 X165 Y218.126 E.0159
G1 X185.501 Y197.624 E.86408
G1 X186.035 Y197.624 E.0159
G1 X165.534 Y218.126 E.86408
G1 X166.067 Y218.126 E.0159
G1 X186.569 Y197.624 E.86408
G1 X187.102 Y197.624 E.0159
G1 X166.601 Y218.126 E.86408
G1 X167.135 Y218.126 E.0159
G1 X187.636 Y197.624 E.86408
G1 X188.169 Y197.624 E.0159
G1 X167.668 Y218.126 E.86408
M73 P76 R17
G1 X168.202 Y218.126 E.0159
G1 X188.703 Y197.624 E.86408
G1 X189.236 Y197.624 E.0159
G1 X168.735 Y218.126 E.86408
G1 X169.269 Y218.126 E.0159
G1 X189.77 Y197.624 E.86408
G1 X190.304 Y197.624 E.0159
G1 X169.802 Y218.126 E.86408
G1 X170.336 Y218.126 E.0159
G1 X190.837 Y197.624 E.86408
G1 X191.371 Y197.624 E.0159
G1 X170.87 Y218.126 E.86408
G1 X171.403 Y218.126 E.0159
G1 X191.904 Y197.624 E.86408
G1 X192.438 Y197.624 E.0159
G1 X171.937 Y218.126 E.86408
G1 X172.47 Y218.126 E.0159
G1 X192.971 Y197.624 E.86408
G1 X193.505 Y197.624 E.0159
G1 X173.004 Y218.126 E.86408
G1 X173.537 Y218.126 E.0159
G1 X194.039 Y197.624 E.86408
G1 X194.572 Y197.624 E.0159
G1 X174.071 Y218.126 E.86408
G1 X174.605 Y218.126 E.0159
G1 X195.106 Y197.624 E.86408
G1 X195.639 Y197.624 E.0159
G1 X175.138 Y218.126 E.86408
G1 X175.672 Y218.126 E.0159
G1 X196.173 Y197.624 E.86408
G1 X196.706 Y197.624 E.0159
G1 X176.205 Y218.126 E.86408
G1 X176.739 Y218.126 E.0159
G1 X197.24 Y197.624 E.86408
G1 X197.774 Y197.624 E.0159
G1 X177.272 Y218.126 E.86408
G1 X177.806 Y218.126 E.0159
G1 X198.307 Y197.624 E.86408
G1 X198.841 Y197.624 E.0159
G1 X178.34 Y218.126 E.86408
G1 X178.873 Y218.126 E.0159
G1 X199.374 Y197.624 E.86408
G1 X199.908 Y197.624 E.0159
G1 X179.407 Y218.126 E.86408
G1 X179.94 Y218.126 E.0159
G1 X200.441 Y197.624 E.86408
G1 X200.975 Y197.624 E.0159
G1 X180.474 Y218.126 E.86408
G1 X181.007 Y218.126 E.0159
G1 X201.509 Y197.624 E.86408
G1 X202.042 Y197.624 E.0159
G1 X181.541 Y218.126 E.86408
G1 X182.075 Y218.126 E.0159
G1 X202.576 Y197.624 E.86408
G1 X203.109 Y197.624 E.0159
G1 X182.608 Y218.126 E.86408
G1 X183.142 Y218.126 E.0159
G1 X203.643 Y197.624 E.86408
G1 X204.176 Y197.624 E.0159
G1 X183.675 Y218.126 E.86408
G1 X184.209 Y218.126 E.0159
G1 X204.71 Y197.624 E.86408
G1 X205.243 Y197.624 E.0159
G1 X184.573 Y218.295 E.87123
; WIPE_START
G1 X185.987 Y216.881 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X180.333 Y211.753 Z2.8 F30000
G1 X29.58 Y75.023 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9541.731
G1 X70.729 Y33.874 E1.73434
G1 X70.195 Y33.874 E.0159
G1 X29.749 Y74.32 E1.7047
G1 X29.749 Y73.786 E.0159
G1 X69.661 Y33.874 E1.68222
G1 X69.128 Y33.874 E.0159
G1 X29.749 Y73.253 E1.65973
G1 X29.749 Y72.719 E.0159
G1 X68.594 Y33.874 E1.63724
G1 X68.061 Y33.874 E.0159
G1 X29.749 Y72.186 E1.61475
G1 X29.749 Y71.652 E.0159
G1 X67.527 Y33.874 E1.59226
G1 X66.994 Y33.874 E.0159
G1 X29.749 Y71.119 E1.56977
G1 X29.749 Y70.585 E.0159
G1 X66.46 Y33.874 E1.54728
G1 X65.927 Y33.874 E.0159
G1 X29.749 Y70.051 E1.52479
G1 X29.749 Y69.518 E.0159
G1 X65.393 Y33.874 E1.5023
G1 X64.859 Y33.874 E.0159
G1 X29.749 Y68.984 E1.47982
G1 X29.749 Y68.451 E.0159
G1 X64.326 Y33.874 E1.45733
G1 X63.792 Y33.874 E.0159
G1 X29.749 Y67.917 E1.43484
G1 X29.749 Y67.384 E.0159
G1 X63.259 Y33.874 E1.41235
G1 X62.725 Y33.874 E.0159
G1 X29.749 Y66.85 E1.38986
G1 X29.749 Y66.317 E.0159
G1 X62.192 Y33.874 E1.36737
G1 X61.658 Y33.874 E.0159
G1 X29.749 Y65.783 E1.34488
G1 X29.749 Y65.249 E.0159
G1 X61.124 Y33.874 E1.32239
G1 X60.591 Y33.874 E.0159
G1 X29.749 Y64.716 E1.2999
G1 X29.749 Y64.182 E.0159
G1 X60.057 Y33.874 E1.27742
G1 X59.524 Y33.874 E.0159
G1 X29.749 Y63.649 E1.25493
G1 X29.749 Y63.115 E.0159
G1 X58.99 Y33.874 E1.23244
G1 X58.457 Y33.874 E.0159
G1 X29.749 Y62.582 E1.20995
G1 X29.749 Y62.048 E.0159
G1 X57.923 Y33.874 E1.18746
G1 X57.389 Y33.874 E.0159
G1 X29.749 Y61.514 E1.16497
G1 X29.749 Y60.981 E.0159
G1 X56.856 Y33.874 E1.14248
G1 X56.322 Y33.874 E.0159
G1 X29.749 Y60.447 E1.11999
G1 X29.749 Y59.914 E.0159
G1 X55.789 Y33.874 E1.0975
G1 X55.255 Y33.874 E.0159
G1 X29.749 Y59.38 E1.07502
G1 X29.749 Y58.847 E.0159
G1 X41.098 Y47.498 E.47831
G3 X40.414 Y47.648 I-1.103 J-3.399 E.02088
G1 X29.749 Y58.313 E.44951
G1 X29.749 Y57.779 E.0159
G1 X39.857 Y47.671 E.42603
G3 X39.378 Y47.617 I.032 J-2.427 E.0144
G1 X29.749 Y57.246 E.40583
G1 X29.749 Y56.712 E.0159
G1 X38.948 Y47.514 E.38769
G3 X38.558 Y47.37 I.526 J-2.021 E.0124
G1 X29.749 Y56.179 E.37128
G1 X29.749 Y55.645 E.0159
G1 X38.206 Y47.189 E.35642
G3 X37.885 Y46.976 I.907 J-1.71 E.01149
G1 X29.749 Y55.112 E.34291
G1 X29.749 Y54.578 E.0159
G1 X37.594 Y46.733 E.33063
G3 X37.331 Y46.463 I1.223 J-1.451 E.01126
G1 X29.749 Y54.044 E.31955
G1 X29.749 Y53.511 E.0159
G1 X37.097 Y46.164 E.30967
G3 X36.892 Y45.835 I1.54 J-1.187 E.01156
G1 X29.749 Y52.977 E.30104
G1 X29.749 Y52.444 E.0159
G1 X36.719 Y45.474 E.29376
G3 X36.582 Y45.078 I1.91 J-.884 E.01252
G1 X29.749 Y51.91 E.28797
G1 X29.749 Y51.377 E.0159
G1 X36.487 Y44.64 E.28396
G3 X36.453 Y44.14 I2.48 J-.419 E.01495
G1 X29.749 Y50.843 E.28253
G1 X29.749 Y50.309 E.0159
G1 X36.494 Y43.565 E.28428
G3 X36.697 Y42.828 I3.852 J.665 E.0228
G1 X29.749 Y49.776 E.29283
G1 X29.749 Y49.242 E.0159
G1 X45.117 Y33.874 E.64773
G1 X45.651 Y33.874 E.0159
G1 X38.701 Y40.824 E.29291
G3 X39.436 Y40.622 I1.309 J3.331 E.02276
G1 X46.184 Y33.874 E.28441
G1 X46.718 Y33.874 E.0159
G1 X40.009 Y40.583 E.28275
G3 X40.512 Y40.614 I.128 J2.003 E.01504
G1 X47.252 Y33.874 E.28407
G1 X47.785 Y33.874 E.0159
G1 X40.955 Y40.705 E.28787
G3 X41.35 Y40.843 I-2.227 J7.006 E.01248
G1 X48.319 Y33.874 E.2937
M73 P77 R17
G1 X48.852 Y33.874 E.0159
G1 X41.71 Y41.016 E.30102
G3 X42.039 Y41.222 I-.862 J1.743 E.01156
G1 X49.386 Y33.874 E.30968
G1 X49.919 Y33.874 E.0159
G1 X42.337 Y41.457 E.31957
G3 X42.607 Y41.72 I-1.18 J1.481 E.01126
G1 X50.453 Y33.874 E.33067
G1 X50.987 Y33.874 E.0159
G1 X42.849 Y42.012 E.34297
G3 X43.062 Y42.333 I-1.5 J1.225 E.01149
G1 X51.52 Y33.874 E.3565
G1 X52.054 Y33.874 E.0159
G1 X43.243 Y42.685 E.37133
G3 X43.391 Y43.071 I-1.852 J.93 E.01234
G1 X52.587 Y33.874 E.3876
G1 X53.121 Y33.874 E.0159
G1 X43.493 Y43.502 E.40578
G3 X43.545 Y43.984 I-2.39 J.498 E.01448
G1 X53.654 Y33.874 E.42611
G1 X54.188 Y33.874 E.0159
G1 X43.525 Y44.537 E.44942
G3 X43.377 Y45.22 I-4.093 J-.534 E.02083
G1 X54.891 Y33.705 E.48532
G1 X29.58 Y34.472 F30000
G1 F9541.731
G1 X30.177 Y33.874 E.02519
G1 X30.711 Y33.874 E.0159
G1 X29.749 Y34.836 E.04053
G1 X29.749 Y35.37 E.0159
G1 X31.245 Y33.874 E.06301
G1 X31.778 Y33.874 E.0159
G1 X29.749 Y35.903 E.0855
G1 X29.749 Y36.437 E.0159
G1 X32.312 Y33.874 E.10799
G1 X32.845 Y33.874 E.0159
G1 X29.749 Y36.97 E.13048
G1 X29.749 Y37.504 E.0159
G1 X33.379 Y33.874 E.15297
G1 X33.912 Y33.874 E.0159
G1 X29.749 Y38.037 E.17546
G1 X29.749 Y38.571 E.0159
G1 X34.446 Y33.874 E.19795
G1 X34.98 Y33.874 E.0159
G1 X29.749 Y39.105 E.22044
G1 X29.749 Y39.638 E.0159
G1 X35.513 Y33.874 E.24293
G1 X36.047 Y33.874 E.0159
G1 X29.749 Y40.172 E.26541
G1 X29.749 Y40.705 E.0159
G1 X36.58 Y33.874 E.2879
G1 X37.114 Y33.874 E.0159
G1 X29.749 Y41.239 E.31039
G1 X29.749 Y41.772 E.0159
G1 X37.647 Y33.874 E.33288
G1 X38.181 Y33.874 E.0159
G1 X29.749 Y42.306 E.35537
G1 X29.749 Y42.839 E.0159
G1 X38.714 Y33.874 E.37786
G1 X39.248 Y33.874 E.0159
G1 X29.749 Y43.373 E.40035
G1 X29.749 Y43.907 E.0159
G1 X39.782 Y33.874 E.42284
G1 X40.315 Y33.874 E.0159
G1 X29.749 Y44.44 E.44533
G1 X29.749 Y44.974 E.0159
G1 X40.849 Y33.874 E.46781
G1 X41.382 Y33.874 E.0159
G1 X29.749 Y45.507 E.4903
G1 X29.749 Y46.041 E.0159
G1 X41.916 Y33.874 E.51279
G1 X42.449 Y33.874 E.0159
G1 X29.749 Y46.574 E.53528
G1 X29.749 Y47.108 E.0159
G1 X42.983 Y33.874 E.55777
G1 X43.517 Y33.874 E.0159
G1 X29.749 Y47.642 E.58026
G1 X29.749 Y48.175 E.0159
G1 X44.05 Y33.874 E.60275
G1 X44.584 Y33.874 E.0159
G1 X29.58 Y48.878 E.63239
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9541.731
G1 X30.994 Y47.464 E-.76
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
G1 X128.158 Y204.666
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X128.24 Y204.67 E.00265
G3 X129.175 Y204.879 I-.246 J3.296 E.03093
G3 X127.819 Y204.666 I-1.167 J2.996 E.60511
G1 X128.098 Y204.666 E.00897
G1 X128.157 Y205.072 F30000
G1 F8843.478
G1 X128.21 Y205.073 E.00172
G3 X128.761 Y205.17 I-.193 J2.728 E.01803
G3 X127.85 Y205.072 I-.752 J2.706 E.5379
G1 X128.097 Y205.072 E.00794
G1 X128.154 Y205.479 F30000
G1 F8843.478
G1 X128.179 Y205.482 E.00082
G3 X128.417 Y205.509 I-.187 J2.69 E.0077
G3 X127.88 Y205.477 I-.407 J2.367 E.46789
G1 X128.094 Y205.478 E.00688
G1 X128.165 Y205.872 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.349 Y205.895 E.00553
G3 X127.91 Y205.868 I-.342 J1.979 E.36279
G3 X128.105 Y205.87 I.079 J2.314 E.00582
; WIPE_START
M204 S10000
G1 X128.349 Y205.895 E-.09327
G1 X128.734 Y206.004 E-.15213
G1 X129.091 Y206.186 E-.15208
G1 X129.404 Y206.436 E-.15213
G1 X129.661 Y206.743 E-.15215
G1 X129.734 Y206.877 E-.05824
; WIPE_END
G1 E-.04 F1800
G1 X137.365 Y206.707 Z3 F30000
G1 X214.597 Y204.982 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X214.679 Y204.948 E.00286
G3 X215.819 Y204.666 I1.329 J2.928 E.03797
G3 X217.176 Y204.879 I.175 J3.3 E.04449
G3 X214.395 Y205.094 I-1.167 J2.996 E.55683
G1 X214.545 Y205.011 E.00552
G1 X215.149 Y205.199 F30000
G1 F8843.478
G1 X215.376 Y205.139 E.00753
G3 X215.85 Y205.072 I.633 J2.737 E.01541
G3 X216.761 Y205.17 I.167 J2.731 E.02962
G3 X215.093 Y205.22 I-.752 J2.706 E.51304
G1 X215.578 Y205.517 F30000
G1 F8843.478
G1 X215.88 Y205.477 E.00979
G3 X216.417 Y205.509 I.113 J2.695 E.01733
G3 X215.466 Y205.536 I-.407 J2.367 E.45443
G1 X215.519 Y205.527 E.00172
G1 X215.909 Y205.868 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X215.91 Y205.868 E.00002
G3 X216.349 Y205.895 I.079 J2.315 E.01313
G3 X215.553 Y205.918 I-.342 J1.979 E.35206
G1 X215.849 Y205.877 E.0089
; WIPE_START
M204 S10000
G1 X215.91 Y205.868 E-.0231
G1 X216.15 Y205.87 E-.09142
G1 X216.349 Y205.895 E-.07617
G1 X216.734 Y206.004 E-.15214
G1 X217.091 Y206.186 E-.15207
G1 X217.404 Y206.436 E-.15216
G1 X217.595 Y206.664 E-.11293
; WIPE_END
G1 E-.04 F1800
G1 X217.435 Y199.033 Z3 F30000
G1 X215.977 Y129.216 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X215.92 Y129.214 E.00183
G3 X215.819 Y122.791 I.088 J-3.214 E.31589
G3 X217.176 Y123.004 I.175 J3.301 E.04448
G3 X216.24 Y129.207 I-1.167 J2.996 E.27891
G1 X216.037 Y129.214 E.00655
G1 X215.968 Y128.809 F30000
G1 F8843.478
G1 X215.93 Y128.809 E.00121
G3 X215.85 Y123.196 I.079 J-2.808 E.27612
G3 X216.761 Y123.295 I.167 J2.731 E.02961
G3 X216.21 Y128.803 I-.752 J2.706 E.25279
G1 X216.028 Y128.807 E.00586
G1 X215.976 Y128.399 F30000
G1 F8843.478
G1 X215.94 Y128.401 E.00115
G3 X215.88 Y123.602 I.07 J-2.401 E.2362
G3 X216.417 Y123.634 I.112 J2.696 E.01732
G3 X216.417 Y128.367 I-.407 J2.367 E.21629
G1 X216.036 Y128.395 E.0123
G1 X216.041 Y128.003 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X215.95 Y128.007 E.00271
G3 X215.91 Y123.993 I.057 J-2.008 E.18334
G3 X216.349 Y124.02 I.079 J2.314 E.01313
G3 X216.349 Y127.979 I-.342 J1.979 E.16751
G1 X216.101 Y127.998 E.00742
; WIPE_START
M204 S10000
G1 X215.95 Y128.007 E-.05733
G1 X215.75 Y127.995 E-.07611
G1 X215.36 Y127.906 E-.15214
G1 X214.995 Y127.741 E-.15209
G1 X214.67 Y127.507 E-.15215
G1 X214.398 Y127.214 E-.15213
G1 X214.373 Y127.173 E-.01805
; WIPE_END
G1 E-.04 F1800
G1 X214.612 Y119.545 Z3 F30000
G1 X217.075 Y41.096 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X217.176 Y41.129 E.00342
G3 X215.819 Y40.916 I-1.168 J2.996 E.60512
G3 X216.871 Y41.029 I.174 J3.301 E.03416
G1 X217.018 Y41.077 E.00496
G1 X216.63 Y41.39 F30000
G1 F8843.478
G1 X216.761 Y41.42 E.00432
G3 X215.85 Y41.321 I-.752 J2.706 E.53792
G3 X216.488 Y41.357 I.167 J2.731 E.0206
G1 X216.572 Y41.376 E.00276
G1 X216.237 Y41.736 F30000
G1 F8843.478
G1 X216.417 Y41.759 E.00585
G3 X215.88 Y41.727 I-.407 J2.366 E.46775
G3 X216.177 Y41.731 I.112 J2.697 E.00954
G1 X215.916 Y42.118 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X216.15 Y42.123 E.00696
G3 X216.349 Y42.145 I-.162 J2.311 E.00597
G3 X215.857 Y42.122 I-.342 J1.979 E.36121
; WIPE_START
M204 S10000
G1 X216.15 Y42.123 E-.11147
G1 X216.349 Y42.145 E-.07614
G1 X216.544 Y42.19 E-.07613
G1 X216.917 Y42.336 E-.15213
G1 X217.253 Y42.553 E-.15213
G1 X217.54 Y42.833 E-.1521
G1 X217.599 Y42.92 E-.03989
; WIPE_END
G1 E-.04 F1800
G1 X209.968 Y42.762 Z3 F30000
G1 X129.075 Y41.095 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X129.176 Y41.129 E.00343
G3 X127.819 Y40.916 I-1.167 J2.996 E.60512
G3 X128.871 Y41.029 I.174 J3.301 E.03416
G1 X129.017 Y41.077 E.00495
G1 X128.63 Y41.39 F30000
G1 F8843.478
G1 X128.761 Y41.42 E.00432
G3 X127.85 Y41.321 I-.752 J2.706 E.53791
G3 X128.488 Y41.357 I.167 J2.731 E.0206
G1 X128.572 Y41.376 E.00276
G1 X128.237 Y41.736 F30000
G1 F8843.478
G1 X128.417 Y41.759 E.00585
G3 X127.88 Y41.727 I-.407 J2.366 E.46775
G3 X128.177 Y41.731 I.112 J2.696 E.00954
G1 X127.917 Y42.118 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.15 Y42.123 E.00695
G3 X128.349 Y42.145 I-.162 J2.311 E.00597
G3 X127.857 Y42.122 I-.342 J1.979 E.36121
; WIPE_START
M204 S10000
G1 X128.15 Y42.123 E-.1114
G1 X128.349 Y42.145 E-.07614
G1 X128.544 Y42.19 E-.07613
G1 X128.917 Y42.336 E-.15213
G1 X129.253 Y42.553 E-.15209
G1 X129.54 Y42.833 E-.15214
G1 X129.599 Y42.92 E-.03997
; WIPE_END
G1 E-.04 F1800
G1 X121.968 Y42.763 Z3 F30000
G1 X41.077 Y41.096 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.176 Y41.129 E.00334
G3 X39.819 Y40.916 I-1.168 J2.996 E.60512
G3 X40.871 Y41.029 I.174 J3.301 E.03416
G1 X41.02 Y41.078 E.00505
G1 X40.629 Y41.39 F30000
G1 F8843.478
G1 X40.761 Y41.42 E.00435
G3 X39.85 Y41.321 I-.752 J2.706 E.53791
G3 X40.488 Y41.357 I.167 J2.731 E.0206
G1 X40.571 Y41.376 E.00273
G1 X40.235 Y41.736 F30000
G1 F8843.478
G1 X40.417 Y41.759 E.00589
G3 X39.88 Y41.727 I-.407 J2.366 E.46775
G3 X40.176 Y41.731 I.112 J2.696 E.0095
G1 X39.851 Y42.126 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X39.91 Y42.118 E.00177
G3 X40.349 Y42.145 I.079 J2.316 E.01314
G3 X39.553 Y42.168 I-.342 J1.979 E.35206
G1 X39.791 Y42.134 E.00715
; WIPE_START
M204 S10000
G1 X39.91 Y42.118 E-.04544
G1 X40.15 Y42.12 E-.09143
G1 X40.349 Y42.145 E-.07618
G1 X40.735 Y42.254 E-.15214
G1 X41.091 Y42.436 E-.15212
G1 X41.404 Y42.686 E-.15208
G1 X41.54 Y42.833 E-.07616
G1 X41.561 Y42.864 E-.01445
; WIPE_END
G1 E-.04 F1800
G1 X47.116 Y48.099 Z3 F30000
G1 X205.416 Y197.291 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X50.584 Y197.291 E4.97885
G1 X50.584 Y54.709 E4.58493
G1 X205.416 Y54.709 E4.97885
G1 X205.416 Y197.231 E4.583
G1 X205.009 Y196.884 F30000
G1 F8843.478
G1 X50.991 Y196.884 E4.95267
G1 X50.991 Y55.116 E4.55875
G1 X205.009 Y55.116 E4.95267
G1 X205.009 Y196.824 E4.55682
G1 X204.602 Y196.477 F30000
G1 F8843.478
G1 X51.398 Y196.477 E4.92649
G1 X51.398 Y55.523 E4.53257
G1 X204.602 Y55.523 E4.92649
G1 X204.602 Y196.417 E4.53064
G1 X204.21 Y196.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X51.79 Y196.085 E4.54007
G1 X51.79 Y55.915 E4.17519
G1 X204.21 Y55.915 E4.54007
G1 X204.21 Y196.025 E4.1734
; WIPE_START
M204 S10000
G1 X202.21 Y196.026 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X195.259 Y192.874 Z3 F30000
G1 X41.075 Y122.971 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.176 Y123.004 E.00342
G3 X39.819 Y122.791 I-1.168 J2.996 E.60511
G3 X40.871 Y122.904 I.175 J3.301 E.03416
G1 X41.018 Y122.952 E.00496
G1 X40.63 Y123.265 F30000
G1 F8843.478
G1 X40.761 Y123.295 E.00431
G3 X39.85 Y123.196 I-.752 J2.706 E.53791
G3 X40.488 Y123.232 I.167 J2.731 E.0206
G1 X40.572 Y123.251 E.00277
G1 X40.237 Y123.611 F30000
G1 F8843.478
G1 X40.417 Y123.634 E.00585
G3 X39.88 Y123.602 I-.407 J2.367 E.4679
G3 X40.177 Y123.606 I.112 J2.696 E.00954
G1 X39.917 Y123.993 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X40.15 Y123.998 E.00696
G3 X40.349 Y124.02 I-.161 J2.31 E.00597
G3 X39.857 Y123.997 I-.342 J1.979 E.36121
; WIPE_START
M204 S10000
G1 X40.15 Y123.998 E-.11145
G1 X40.349 Y124.02 E-.07614
G1 X40.734 Y124.129 E-.15213
G1 X41.091 Y124.311 E-.15213
G1 X41.404 Y124.561 E-.15208
G1 X41.6 Y124.795 E-.11608
; WIPE_END
G1 E-.04 F1800
G1 X41.55 Y132.427 Z3 F30000
G1 X41.075 Y204.846 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.176 Y204.88 E.00342
G3 X39.819 Y204.666 I-1.168 J2.996 E.6051
G3 X40.871 Y204.78 I.175 J3.3 E.03417
G1 X41.018 Y204.827 E.00497
G1 X40.631 Y205.14 F30000
G1 F8843.478
G1 X40.761 Y205.17 E.0043
G3 X39.85 Y205.072 I-.752 J2.706 E.5379
G3 X40.488 Y205.107 I.167 J2.73 E.02061
G1 X40.572 Y205.127 E.00278
G1 X40.237 Y205.486 F30000
G1 F8843.478
G1 X40.417 Y205.509 E.00584
G3 X39.88 Y205.477 I-.407 J2.367 E.46789
G3 X40.177 Y205.481 I.113 J2.694 E.00956
G1 X39.909 Y205.869 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X39.91 Y205.868 E.00003
G3 X40.349 Y205.895 I.079 J2.314 E.01313
G3 X39.553 Y205.918 I-.342 J1.979 E.35206
G1 X39.849 Y205.877 E.0089
; WIPE_START
M204 S10000
G1 X39.91 Y205.868 E-.02322
G1 X40.15 Y205.87 E-.09142
G1 X40.349 Y205.895 E-.07617
G1 X40.734 Y206.004 E-.15214
G1 X41.091 Y206.186 E-.15209
G1 X41.404 Y206.436 E-.15211
G1 X41.595 Y206.663 E-.11284
; WIPE_END
G1 E-.04 F1800
G1 X49.211 Y207.149 Z3 F30000
G1 X226.584 Y218.459 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X29.416 Y218.459 E6.34019
G1 X29.416 Y33.541 E5.94628
G1 X226.584 Y33.541 E6.34019
G1 X226.584 Y218.399 E5.94435
G1 X226.991 Y218.866 F30000
G1 F8843.478
G1 X29.009 Y218.866 E6.36637
G1 X29.009 Y33.134 E5.97246
G1 X226.991 Y33.134 E6.36637
G1 X226.991 Y218.806 E5.97053
G1 X227.398 Y219.273 F30000
G1 F8843.478
G1 X28.602 Y219.273 E6.39255
G1 X28.602 Y32.727 E5.99864
G1 X227.398 Y32.727 E6.39255
G1 X227.398 Y219.213 E5.99671
G1 X227.79 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X28.21 Y219.665 E5.94481
G1 X28.21 Y32.335 E5.57992
G1 X227.79 Y32.335 E5.94481
G1 X227.79 Y219.605 E5.57813
; WIPE_START
M204 S10000
G1 X225.79 Y219.606 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X220.831 Y218.295 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42021
G1 F9541.731
G1 X200.16 Y197.624 E.87123
G1 X199.627 Y197.624 E.0159
G1 X220.128 Y218.126 E.86408
G1 X219.594 Y218.126 E.0159
G1 X199.093 Y197.624 E.86408
G1 X198.56 Y197.624 E.0159
G1 X219.061 Y218.126 E.86408
G1 X218.527 Y218.126 E.0159
G1 X198.026 Y197.624 E.86408
G1 X197.492 Y197.624 E.0159
G1 X217.994 Y218.126 E.86408
G1 X217.46 Y218.126 E.0159
G1 X196.959 Y197.624 E.86408
G1 X196.425 Y197.624 E.0159
G1 X216.926 Y218.126 E.86408
G1 X216.393 Y218.126 E.0159
G1 X195.892 Y197.624 E.86408
G1 X195.358 Y197.624 E.0159
G1 X215.859 Y218.126 E.86408
G1 X215.326 Y218.126 E.0159
G1 X194.825 Y197.624 E.86408
G1 X194.291 Y197.624 E.0159
G1 X214.792 Y218.126 E.86408
G1 X214.259 Y218.126 E.0159
G1 X193.758 Y197.624 E.86408
G1 X193.224 Y197.624 E.0159
G1 X213.725 Y218.126 E.86408
G1 X213.191 Y218.126 E.0159
G1 X192.69 Y197.624 E.86408
M73 P77 R16
G1 X192.157 Y197.624 E.0159
G1 X212.658 Y218.126 E.86408
G1 X212.124 Y218.126 E.0159
G1 X191.623 Y197.624 E.86408
G1 X191.09 Y197.624 E.0159
G1 X211.591 Y218.126 E.86408
G1 X211.057 Y218.126 E.0159
G1 X190.556 Y197.624 E.86408
G1 X190.023 Y197.624 E.0159
M73 P78 R16
G1 X210.524 Y218.126 E.86408
G1 X209.99 Y218.126 E.0159
G1 X189.489 Y197.624 E.86408
G1 X188.955 Y197.624 E.0159
G1 X209.456 Y218.126 E.86408
G1 X208.923 Y218.126 E.0159
G1 X188.422 Y197.624 E.86408
G1 X187.888 Y197.624 E.0159
G1 X208.389 Y218.126 E.86408
G1 X207.856 Y218.126 E.0159
G1 X187.355 Y197.624 E.86408
G1 X186.821 Y197.624 E.0159
G1 X207.322 Y218.126 E.86408
G1 X206.789 Y218.126 E.0159
G1 X186.288 Y197.624 E.86408
G1 X185.754 Y197.624 E.0159
G1 X206.255 Y218.126 E.86408
G1 X205.721 Y218.126 E.0159
G1 X185.22 Y197.624 E.86408
G1 X184.687 Y197.624 E.0159
G1 X205.188 Y218.126 E.86408
G1 X204.654 Y218.126 E.0159
G1 X184.153 Y197.624 E.86408
G1 X183.62 Y197.624 E.0159
G1 X204.121 Y218.126 E.86408
G1 X203.587 Y218.126 E.0159
G1 X183.086 Y197.624 E.86408
G1 X182.553 Y197.624 E.0159
G1 X203.054 Y218.126 E.86408
G1 X202.52 Y218.126 E.0159
G1 X182.019 Y197.624 E.86408
G1 X181.485 Y197.624 E.0159
G1 X201.987 Y218.126 E.86408
G1 X201.453 Y218.126 E.0159
G1 X180.952 Y197.624 E.86408
G1 X180.418 Y197.624 E.0159
G1 X200.919 Y218.126 E.86408
G1 X200.386 Y218.126 E.0159
G1 X179.885 Y197.624 E.86408
G1 X179.351 Y197.624 E.0159
G1 X199.852 Y218.126 E.86408
G1 X199.319 Y218.126 E.0159
G1 X178.818 Y197.624 E.86408
G1 X178.284 Y197.624 E.0159
G1 X198.785 Y218.126 E.86408
G1 X198.252 Y218.126 E.0159
G1 X177.75 Y197.624 E.86408
G1 X177.217 Y197.624 E.0159
G1 X197.718 Y218.126 E.86408
G1 X197.184 Y218.126 E.0159
G1 X176.683 Y197.624 E.86408
G1 X176.15 Y197.624 E.0159
G1 X196.651 Y218.126 E.86408
G1 X196.117 Y218.126 E.0159
G1 X175.616 Y197.624 E.86408
G1 X175.083 Y197.624 E.0159
G1 X195.584 Y218.126 E.86408
G1 X195.05 Y218.126 E.0159
G1 X174.549 Y197.624 E.86408
G1 X174.015 Y197.624 E.0159
G1 X194.517 Y218.126 E.86408
G1 X193.983 Y218.126 E.0159
G1 X173.482 Y197.624 E.86408
G1 X172.948 Y197.624 E.0159
G1 X193.449 Y218.126 E.86408
G1 X192.916 Y218.126 E.0159
G1 X172.415 Y197.624 E.86408
G1 X171.881 Y197.624 E.0159
G1 X192.382 Y218.126 E.86408
G1 X191.849 Y218.126 E.0159
G1 X171.348 Y197.624 E.86408
G1 X170.814 Y197.624 E.0159
G1 X191.315 Y218.126 E.86408
G1 X190.782 Y218.126 E.0159
G1 X170.28 Y197.624 E.86408
G1 X169.747 Y197.624 E.0159
G1 X190.248 Y218.126 E.86408
G1 X189.714 Y218.126 E.0159
G1 X169.213 Y197.624 E.86408
G1 X168.68 Y197.624 E.0159
G1 X189.181 Y218.126 E.86408
G1 X188.647 Y218.126 E.0159
G1 X168.146 Y197.624 E.86408
G1 X167.613 Y197.624 E.0159
G1 X188.114 Y218.126 E.86408
G1 X187.58 Y218.126 E.0159
G1 X167.079 Y197.624 E.86408
G1 X166.546 Y197.624 E.0159
G1 X187.047 Y218.126 E.86408
G1 X186.513 Y218.126 E.0159
G1 X166.012 Y197.624 E.86408
G1 X165.478 Y197.624 E.0159
G1 X185.979 Y218.126 E.86408
G1 X185.446 Y218.126 E.0159
G1 X164.945 Y197.624 E.86408
G1 X164.411 Y197.624 E.0159
G1 X184.912 Y218.126 E.86408
G1 X184.379 Y218.126 E.0159
G1 X163.878 Y197.624 E.86408
G1 X163.344 Y197.624 E.0159
G1 X183.845 Y218.126 E.86408
G1 X183.312 Y218.126 E.0159
G1 X162.811 Y197.624 E.86408
G1 X162.277 Y197.624 E.0159
G1 X182.778 Y218.126 E.86408
G1 X182.244 Y218.126 E.0159
G1 X161.743 Y197.624 E.86408
G1 X161.21 Y197.624 E.0159
G1 X181.711 Y218.126 E.86408
G1 X181.177 Y218.126 E.0159
G1 X160.676 Y197.624 E.86408
G1 X160.143 Y197.624 E.0159
G1 X180.644 Y218.126 E.86408
G1 X180.11 Y218.126 E.0159
G1 X159.609 Y197.624 E.86408
G1 X159.076 Y197.624 E.0159
G1 X179.577 Y218.126 E.86408
G1 X179.043 Y218.126 E.0159
G1 X158.542 Y197.624 E.86408
G1 X158.008 Y197.624 E.0159
G1 X178.509 Y218.126 E.86408
G1 X177.976 Y218.126 E.0159
G1 X157.475 Y197.624 E.86408
G1 X156.941 Y197.624 E.0159
G1 X177.442 Y218.126 E.86408
G1 X176.909 Y218.126 E.0159
G1 X156.408 Y197.624 E.86408
G1 X155.874 Y197.624 E.0159
G1 X176.375 Y218.126 E.86408
G1 X175.842 Y218.126 E.0159
G1 X155.341 Y197.624 E.86408
G1 X154.807 Y197.624 E.0159
G1 X175.308 Y218.126 E.86408
G1 X174.775 Y218.126 E.0159
G1 X154.273 Y197.624 E.86408
G1 X153.74 Y197.624 E.0159
G1 X174.241 Y218.126 E.86408
G1 X173.707 Y218.126 E.0159
G1 X153.206 Y197.624 E.86408
G1 X152.673 Y197.624 E.0159
G1 X173.174 Y218.126 E.86408
G1 X172.64 Y218.126 E.0159
G1 X152.139 Y197.624 E.86408
G1 X151.606 Y197.624 E.0159
G1 X172.107 Y218.126 E.86408
G1 X171.573 Y218.126 E.0159
G1 X151.072 Y197.624 E.86408
G1 X150.538 Y197.624 E.0159
G1 X171.04 Y218.126 E.86408
G1 X170.506 Y218.126 E.0159
G1 X150.005 Y197.624 E.86408
G1 X149.471 Y197.624 E.0159
G1 X169.972 Y218.126 E.86408
G1 X169.439 Y218.126 E.0159
G1 X148.938 Y197.624 E.86408
G1 X148.404 Y197.624 E.0159
G1 X168.905 Y218.126 E.86408
G1 X168.372 Y218.126 E.0159
G1 X147.871 Y197.624 E.86408
G1 X147.337 Y197.624 E.0159
G1 X167.838 Y218.126 E.86408
G1 X167.305 Y218.126 E.0159
G1 X146.803 Y197.624 E.86408
G1 X146.27 Y197.624 E.0159
G1 X166.771 Y218.126 E.86408
G1 X166.237 Y218.126 E.0159
G1 X145.736 Y197.624 E.86408
G1 X145.203 Y197.624 E.0159
G1 X165.704 Y218.126 E.86408
G1 X165.17 Y218.126 E.0159
G1 X144.669 Y197.624 E.86408
G1 X144.136 Y197.624 E.0159
G1 X164.637 Y218.126 E.86408
G1 X164.103 Y218.126 E.0159
G1 X143.602 Y197.624 E.86408
G1 X143.068 Y197.624 E.0159
G1 X163.57 Y218.126 E.86408
G1 X163.036 Y218.126 E.0159
G1 X142.535 Y197.624 E.86408
G1 X142.001 Y197.624 E.0159
G1 X162.502 Y218.126 E.86408
G1 X161.969 Y218.126 E.0159
G1 X141.468 Y197.624 E.86408
G1 X140.934 Y197.624 E.0159
G1 X161.435 Y218.126 E.86408
G1 X160.902 Y218.126 E.0159
G1 X140.401 Y197.624 E.86408
G1 X139.867 Y197.624 E.0159
G1 X160.368 Y218.126 E.86408
G1 X159.835 Y218.126 E.0159
G1 X139.334 Y197.624 E.86408
G1 X138.8 Y197.624 E.0159
G1 X159.301 Y218.126 E.86408
G1 X158.767 Y218.126 E.0159
G1 X138.266 Y197.624 E.86408
G1 X137.733 Y197.624 E.0159
G1 X158.234 Y218.126 E.86408
G1 X157.7 Y218.126 E.0159
G1 X137.199 Y197.624 E.86408
G1 X136.666 Y197.624 E.0159
G1 X157.167 Y218.126 E.86408
G1 X156.633 Y218.126 E.0159
G1 X136.132 Y197.624 E.86408
G1 X135.599 Y197.624 E.0159
G1 X156.1 Y218.126 E.86408
G1 X155.566 Y218.126 E.0159
G1 X135.065 Y197.624 E.86408
G1 X134.531 Y197.624 E.0159
G1 X155.032 Y218.126 E.86408
G1 X154.499 Y218.126 E.0159
G1 X133.998 Y197.624 E.86408
G1 X133.464 Y197.624 E.0159
G1 X153.965 Y218.126 E.86408
G1 X153.432 Y218.126 E.0159
G1 X132.931 Y197.624 E.86408
G1 X132.397 Y197.624 E.0159
G1 X152.898 Y218.126 E.86408
G1 X152.365 Y218.126 E.0159
G1 X131.864 Y197.624 E.86408
G1 X131.33 Y197.624 E.0159
G1 X151.831 Y218.126 E.86408
G1 X151.297 Y218.126 E.0159
G1 X130.796 Y197.624 E.86408
G1 X130.263 Y197.624 E.0159
G1 X150.764 Y218.126 E.86408
G1 X150.23 Y218.126 E.0159
G1 X129.729 Y197.624 E.86408
G1 X129.196 Y197.624 E.0159
G1 X149.697 Y218.126 E.86408
G1 X149.163 Y218.126 E.0159
G1 X128.662 Y197.624 E.86408
G1 X128.129 Y197.624 E.0159
G1 X148.63 Y218.126 E.86408
G1 X148.096 Y218.126 E.0159
G1 X127.595 Y197.624 E.86408
G1 X127.061 Y197.624 E.0159
G1 X147.563 Y218.126 E.86408
G1 X147.029 Y218.126 E.0159
G1 X126.528 Y197.624 E.86408
G1 X125.994 Y197.624 E.0159
G1 X146.495 Y218.126 E.86408
G1 X145.962 Y218.126 E.0159
G1 X125.461 Y197.624 E.86408
G1 X124.927 Y197.624 E.0159
G1 X145.428 Y218.126 E.86408
G1 X144.895 Y218.126 E.0159
G1 X124.394 Y197.624 E.86408
G1 X123.86 Y197.624 E.0159
G1 X144.361 Y218.126 E.86408
G1 X143.828 Y218.126 E.0159
G1 X123.326 Y197.624 E.86408
G1 X122.793 Y197.624 E.0159
G1 X143.294 Y218.126 E.86408
G1 X142.76 Y218.126 E.0159
G1 X131.354 Y206.719 E.48074
G3 X131.518 Y207.417 I-3.474 J1.185 E.02139
G1 X142.227 Y218.126 E.45135
G1 X141.693 Y218.126 E.0159
G1 X131.546 Y207.979 E.42767
G3 X131.498 Y208.464 I-2.453 J.003 E.01457
G1 X141.16 Y218.126 E.4072
G1 X140.626 Y218.126 E.0159
G1 X131.4 Y208.899 E.38888
G3 X131.256 Y209.289 I-6.742 J-2.26 E.01239
G1 X140.093 Y218.126 E.37244
G1 X139.559 Y218.126 E.0159
G1 X131.077 Y209.643 E.35752
G3 X130.866 Y209.966 I-1.723 J-.894 E.01151
G1 X139.025 Y218.126 E.3439
G1 X138.492 Y218.126 E.0159
G1 X130.626 Y210.26 E.33152
G3 X130.358 Y210.525 I-1.46 J-1.207 E.01126
G1 X137.958 Y218.126 E.32034
G1 X137.425 Y218.126 E.0159
G1 X130.061 Y210.762 E.31036
G3 X129.735 Y210.969 I-1.2 J-1.529 E.01154
G1 X136.891 Y218.126 E.30162
G1 X136.358 Y218.126 E.0159
G1 X129.377 Y211.145 E.29421
G3 X128.985 Y211.286 I-.902 J-1.892 E.01245
G1 X135.824 Y218.126 E.28826
G1 X135.29 Y218.126 E.0159
G1 X128.546 Y211.382 E.28425
G3 X128.053 Y211.422 I-.449 J-2.444 E.01477
G1 X134.757 Y218.126 E.28254
G1 X134.223 Y218.126 E.0159
G1 X127.484 Y211.386 E.28406
G3 X126.765 Y211.201 I.568 J-3.696 E.02215
G1 X133.69 Y218.126 E.29186
G1 X133.156 Y218.126 E.0159
G1 X112.655 Y197.624 E.86408
G1 X113.189 Y197.624 E.0159
G1 X124.669 Y209.105 E.48387
G3 X124.486 Y208.389 I2.237 J-.951 E.0221
G1 X113.722 Y197.624 E.45369
G1 X114.256 Y197.624 E.0159
G1 X124.453 Y207.821 E.42978
G3 X124.492 Y207.327 I4.889 J.137 E.01479
G1 X114.789 Y197.624 E.40894
G1 X115.323 Y197.624 E.0159
G1 X124.591 Y206.892 E.39063
G3 X124.731 Y206.499 I2.041 J.503 E.01247
G1 X115.856 Y197.624 E.37403
G1 X116.39 Y197.624 E.0159
G1 X124.906 Y206.14 E.35892
G3 X125.112 Y205.813 I1.737 J.87 E.01154
G1 X116.924 Y197.624 E.34514
G1 X117.457 Y197.624 E.0159
G1 X125.349 Y205.516 E.33262
G3 X125.614 Y205.247 I1.473 J1.188 E.01126
G1 X117.991 Y197.624 E.32129
G1 X118.524 Y197.624 E.0159
G1 X125.907 Y205.007 E.31116
G3 X126.23 Y204.796 I6.845 J10.131 E.01149
G1 X119.058 Y197.624 E.30228
G1 X119.591 Y197.624 E.0159
G1 X126.586 Y204.619 E.29482
G3 X126.978 Y204.478 I.904 J1.888 E.01244
G1 X120.125 Y197.624 E.28884
G1 X120.659 Y197.624 E.0159
G1 X127.411 Y204.377 E.2846
G3 X127.9 Y204.332 I.5 J2.782 E.01465
G1 X121.192 Y197.624 E.28273
G1 X121.726 Y197.624 E.0159
G1 X128.459 Y204.358 E.28378
G3 X129.156 Y204.521 I-.462 J3.533 E.02139
G1 X122.09 Y197.455 E.29784
; WIPE_START
G1 X123.504 Y198.869 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.796 Y205.755 Z3 F30000
G1 X132.792 Y218.295 Z3
G1 Z2.6
G1 E.8 F1800
G1 F9541.731
G1 X112.122 Y197.624 E.87123
G1 X111.588 Y197.624 E.0159
G1 X132.089 Y218.126 E.86408
G1 X131.555 Y218.126 E.0159
G1 X111.054 Y197.624 E.86408
G1 X110.521 Y197.624 E.0159
G1 X131.022 Y218.126 E.86408
G1 X130.488 Y218.126 E.0159
G1 X109.987 Y197.624 E.86408
G1 X109.454 Y197.624 E.0159
G1 X129.955 Y218.126 E.86408
G1 X129.421 Y218.126 E.0159
G1 X108.92 Y197.624 E.86408
G1 X108.387 Y197.624 E.0159
G1 X128.888 Y218.126 E.86408
G1 X128.354 Y218.126 E.0159
G1 X107.853 Y197.624 E.86408
G1 X107.319 Y197.624 E.0159
G1 X127.82 Y218.126 E.86408
G1 X127.287 Y218.126 E.0159
G1 X106.786 Y197.624 E.86408
G1 X106.252 Y197.624 E.0159
G1 X126.753 Y218.126 E.86408
G1 X126.22 Y218.126 E.0159
G1 X105.719 Y197.624 E.86408
G1 X105.185 Y197.624 E.0159
G1 X125.686 Y218.126 E.86408
G1 X125.153 Y218.126 E.0159
G1 X104.652 Y197.624 E.86408
G1 X104.118 Y197.624 E.0159
G1 X124.619 Y218.126 E.86408
G1 X124.085 Y218.126 E.0159
G1 X103.584 Y197.624 E.86408
G1 X103.051 Y197.624 E.0159
G1 X123.552 Y218.126 E.86408
G1 X123.018 Y218.126 E.0159
G1 X102.517 Y197.624 E.86408
G1 X101.984 Y197.624 E.0159
G1 X122.485 Y218.126 E.86408
G1 X121.951 Y218.126 E.0159
G1 X101.45 Y197.624 E.86408
G1 X100.917 Y197.624 E.0159
G1 X121.418 Y218.126 E.86408
G1 X120.884 Y218.126 E.0159
G1 X100.383 Y197.624 E.86408
G1 X99.849 Y197.624 E.0159
G1 X120.351 Y218.126 E.86408
G1 X119.817 Y218.126 E.0159
G1 X99.316 Y197.624 E.86408
G1 X98.782 Y197.624 E.0159
G1 X119.283 Y218.126 E.86408
G1 X118.75 Y218.126 E.0159
G1 X98.249 Y197.624 E.86408
G1 X97.715 Y197.624 E.0159
G1 X118.216 Y218.126 E.86408
G1 X117.683 Y218.126 E.0159
G1 X97.182 Y197.624 E.86408
G1 X96.648 Y197.624 E.0159
G1 X117.149 Y218.126 E.86408
G1 X116.616 Y218.126 E.0159
G1 X96.114 Y197.624 E.86408
G1 X95.581 Y197.624 E.0159
G1 X116.082 Y218.126 E.86408
G1 X115.548 Y218.126 E.0159
G1 X95.047 Y197.624 E.86408
G1 X94.514 Y197.624 E.0159
G1 X115.015 Y218.126 E.86408
G1 X114.481 Y218.126 E.0159
G1 X93.98 Y197.624 E.86408
G1 X93.447 Y197.624 E.0159
G1 X113.948 Y218.126 E.86408
G1 X113.414 Y218.126 E.0159
G1 X92.913 Y197.624 E.86408
G1 X92.379 Y197.624 E.0159
G1 X112.881 Y218.126 E.86408
G1 X112.347 Y218.126 E.0159
G1 X91.846 Y197.624 E.86408
G1 X91.312 Y197.624 E.0159
G1 X111.813 Y218.126 E.86408
G1 X111.28 Y218.126 E.0159
G1 X90.779 Y197.624 E.86408
G1 X90.245 Y197.624 E.0159
G1 X110.746 Y218.126 E.86408
G1 X110.213 Y218.126 E.0159
G1 X89.712 Y197.624 E.86408
G1 X89.178 Y197.624 E.0159
G1 X109.679 Y218.126 E.86408
G1 X109.146 Y218.126 E.0159
G1 X88.644 Y197.624 E.86408
G1 X88.111 Y197.624 E.0159
G1 X108.612 Y218.126 E.86408
G1 X108.078 Y218.126 E.0159
G1 X87.577 Y197.624 E.86408
G1 X87.044 Y197.624 E.0159
G1 X107.545 Y218.126 E.86408
G1 X107.011 Y218.126 E.0159
G1 X86.51 Y197.624 E.86408
G1 X85.977 Y197.624 E.0159
G1 X106.478 Y218.126 E.86408
M73 P79 R16
G1 X105.944 Y218.126 E.0159
G1 X85.443 Y197.624 E.86408
G1 X84.91 Y197.624 E.0159
G1 X105.411 Y218.126 E.86408
G1 X104.877 Y218.126 E.0159
G1 X84.376 Y197.624 E.86408
G1 X83.842 Y197.624 E.0159
G1 X104.343 Y218.126 E.86408
G1 X103.81 Y218.126 E.0159
G1 X83.309 Y197.624 E.86408
G1 X82.775 Y197.624 E.0159
G1 X103.276 Y218.126 E.86408
G1 X102.743 Y218.126 E.0159
G1 X82.242 Y197.624 E.86408
G1 X81.708 Y197.624 E.0159
G1 X102.209 Y218.126 E.86408
G1 X101.676 Y218.126 E.0159
G1 X81.175 Y197.624 E.86408
G1 X80.641 Y197.624 E.0159
G1 X101.142 Y218.126 E.86408
G1 X100.608 Y218.126 E.0159
G1 X80.107 Y197.624 E.86408
G1 X79.574 Y197.624 E.0159
G1 X100.075 Y218.126 E.86408
G1 X99.541 Y218.126 E.0159
G1 X79.04 Y197.624 E.86408
G1 X78.507 Y197.624 E.0159
G1 X99.008 Y218.126 E.86408
G1 X98.474 Y218.126 E.0159
G1 X77.973 Y197.624 E.86408
G1 X77.44 Y197.624 E.0159
G1 X97.941 Y218.126 E.86408
G1 X97.407 Y218.126 E.0159
G1 X76.906 Y197.624 E.86408
G1 X76.372 Y197.624 E.0159
G1 X96.873 Y218.126 E.86408
G1 X96.34 Y218.126 E.0159
G1 X75.839 Y197.624 E.86408
G1 X75.305 Y197.624 E.0159
G1 X95.806 Y218.126 E.86408
G1 X95.273 Y218.126 E.0159
G1 X74.772 Y197.624 E.86408
G1 X74.238 Y197.624 E.0159
G1 X94.739 Y218.126 E.86408
G1 X94.206 Y218.126 E.0159
G1 X73.705 Y197.624 E.86408
G1 X73.171 Y197.624 E.0159
G1 X93.672 Y218.126 E.86408
G1 X93.139 Y218.126 E.0159
G1 X72.637 Y197.624 E.86408
G1 X72.104 Y197.624 E.0159
G1 X92.605 Y218.126 E.86408
G1 X92.071 Y218.126 E.0159
G1 X71.57 Y197.624 E.86408
G1 X71.037 Y197.624 E.0159
G1 X91.538 Y218.126 E.86408
G1 X91.004 Y218.126 E.0159
G1 X70.503 Y197.624 E.86408
M73 P79 R15
G1 X69.97 Y197.624 E.0159
G1 X90.471 Y218.126 E.86408
G1 X89.937 Y218.126 E.0159
G1 X69.436 Y197.624 E.86408
G1 X68.902 Y197.624 E.0159
G1 X89.404 Y218.126 E.86408
G1 X88.87 Y218.126 E.0159
G1 X68.369 Y197.624 E.86408
G1 X67.835 Y197.624 E.0159
G1 X88.336 Y218.126 E.86408
G1 X87.803 Y218.126 E.0159
G1 X67.302 Y197.624 E.86408
G1 X66.768 Y197.624 E.0159
G1 X87.269 Y218.126 E.86408
G1 X86.736 Y218.126 E.0159
G1 X66.235 Y197.624 E.86408
G1 X65.701 Y197.624 E.0159
G1 X86.202 Y218.126 E.86408
G1 X85.669 Y218.126 E.0159
G1 X65.167 Y197.624 E.86408
G1 X64.634 Y197.624 E.0159
G1 X85.135 Y218.126 E.86408
G1 X84.601 Y218.126 E.0159
G1 X64.1 Y197.624 E.86408
G1 X63.567 Y197.624 E.0159
G1 X84.068 Y218.126 E.86408
G1 X83.534 Y218.126 E.0159
G1 X63.033 Y197.624 E.86408
G1 X62.5 Y197.624 E.0159
G1 X83.001 Y218.126 E.86408
G1 X82.467 Y218.126 E.0159
G1 X61.966 Y197.624 E.86408
G1 X61.432 Y197.624 E.0159
G1 X81.934 Y218.126 E.86408
G1 X81.4 Y218.126 E.0159
G1 X60.899 Y197.624 E.86408
G1 X60.365 Y197.624 E.0159
G1 X80.866 Y218.126 E.86408
G1 X80.333 Y218.126 E.0159
G1 X59.832 Y197.624 E.86408
G1 X59.298 Y197.624 E.0159
G1 X79.799 Y218.126 E.86408
G1 X79.266 Y218.126 E.0159
G1 X58.765 Y197.624 E.86408
G1 X58.231 Y197.624 E.0159
G1 X78.732 Y218.126 E.86408
G1 X78.199 Y218.126 E.0159
G1 X57.697 Y197.624 E.86408
G1 X57.164 Y197.624 E.0159
G1 X77.665 Y218.126 E.86408
G1 X77.131 Y218.126 E.0159
G1 X56.63 Y197.624 E.86408
G1 X56.097 Y197.624 E.0159
G1 X76.598 Y218.126 E.86408
G1 X76.064 Y218.126 E.0159
G1 X55.563 Y197.624 E.86408
G1 X55.03 Y197.624 E.0159
G1 X75.531 Y218.126 E.86408
G1 X74.997 Y218.126 E.0159
G1 X54.496 Y197.624 E.86408
G1 X53.963 Y197.624 E.0159
G1 X74.464 Y218.126 E.86408
G1 X73.93 Y218.126 E.0159
G1 X53.429 Y197.624 E.86408
G1 X52.895 Y197.624 E.0159
G1 X73.396 Y218.126 E.86408
G1 X72.863 Y218.126 E.0159
G1 X52.362 Y197.624 E.86408
G1 X51.828 Y197.624 E.0159
G1 X72.329 Y218.126 E.86408
G1 X71.796 Y218.126 E.0159
G1 X51.295 Y197.624 E.86408
G1 X50.761 Y197.624 E.0159
G1 X71.262 Y218.126 E.86408
G1 X70.729 Y218.126 E.0159
G1 X29.749 Y177.146 E1.72719
G1 X29.749 Y176.613 E.0159
G1 X50.251 Y197.114 E.86408
G1 X50.251 Y196.58 E.0159
G1 X29.749 Y176.079 E.86408
G1 X29.749 Y175.546 E.0159
G1 X50.251 Y196.047 E.86408
G1 X50.251 Y195.513 E.0159
G1 X29.749 Y175.012 E.86408
G1 X29.749 Y174.479 E.0159
G1 X50.251 Y194.98 E.86408
G1 X50.251 Y194.446 E.0159
G1 X29.749 Y173.945 E.86408
G1 X29.749 Y173.411 E.0159
G1 X50.251 Y193.912 E.86408
G1 X50.251 Y193.379 E.0159
G1 X29.749 Y172.878 E.86408
G1 X29.749 Y172.344 E.0159
G1 X50.251 Y192.845 E.86408
G1 X50.251 Y192.312 E.0159
G1 X29.749 Y171.811 E.86408
G1 X29.749 Y171.277 E.0159
G1 X50.251 Y191.778 E.86408
G1 X50.251 Y191.245 E.0159
G1 X29.749 Y170.744 E.86408
G1 X29.749 Y170.21 E.0159
G1 X50.251 Y190.711 E.86408
G1 X50.251 Y190.177 E.0159
G1 X29.749 Y169.676 E.86408
G1 X29.749 Y169.143 E.0159
G1 X50.251 Y189.644 E.86408
G1 X50.251 Y189.11 E.0159
G1 X29.749 Y168.609 E.86408
G1 X29.749 Y168.076 E.0159
G1 X50.251 Y188.577 E.86408
G1 X50.251 Y188.043 E.0159
G1 X29.749 Y167.542 E.86408
G1 X29.749 Y167.009 E.0159
G1 X50.251 Y187.51 E.86408
G1 X50.251 Y186.976 E.0159
G1 X29.749 Y166.475 E.86408
G1 X29.749 Y165.941 E.0159
G1 X50.251 Y186.443 E.86408
G1 X50.251 Y185.909 E.0159
G1 X29.749 Y165.408 E.86408
G1 X29.749 Y164.874 E.0159
G1 X50.251 Y185.375 E.86408
G1 X50.251 Y184.842 E.0159
G1 X29.749 Y164.341 E.86408
G1 X29.749 Y163.807 E.0159
G1 X50.251 Y184.308 E.86408
G1 X50.251 Y183.775 E.0159
G1 X29.749 Y163.274 E.86408
G1 X29.749 Y162.74 E.0159
G1 X50.251 Y183.241 E.86408
G1 X50.251 Y182.708 E.0159
G1 X29.749 Y162.206 E.86408
G1 X29.749 Y161.673 E.0159
G1 X50.251 Y182.174 E.86408
G1 X50.251 Y181.64 E.0159
G1 X29.749 Y161.139 E.86408
G1 X29.749 Y160.606 E.0159
G1 X50.251 Y181.107 E.86408
G1 X50.251 Y180.573 E.0159
G1 X29.749 Y160.072 E.86408
G1 X29.749 Y159.539 E.0159
G1 X50.251 Y180.04 E.86408
G1 X50.251 Y179.506 E.0159
G1 X29.749 Y159.005 E.86408
G1 X29.749 Y158.471 E.0159
G1 X50.251 Y178.973 E.86408
G1 X50.251 Y178.439 E.0159
G1 X29.749 Y157.938 E.86408
G1 X29.749 Y157.404 E.0159
G1 X50.251 Y177.905 E.86408
G1 X50.251 Y177.372 E.0159
G1 X29.749 Y156.871 E.86408
G1 X29.749 Y156.337 E.0159
G1 X50.251 Y176.838 E.86408
G1 X50.251 Y176.305 E.0159
G1 X29.749 Y155.804 E.86408
G1 X29.749 Y155.27 E.0159
G1 X50.251 Y175.771 E.86408
G1 X50.251 Y175.238 E.0159
G1 X29.749 Y154.736 E.86408
G1 X29.749 Y154.203 E.0159
G1 X50.251 Y174.704 E.86408
G1 X50.251 Y174.17 E.0159
G1 X29.749 Y153.669 E.86408
G1 X29.749 Y153.136 E.0159
G1 X50.251 Y173.637 E.86408
G1 X50.251 Y173.103 E.0159
G1 X29.749 Y152.602 E.86408
G1 X29.749 Y152.069 E.0159
G1 X50.251 Y172.57 E.86408
G1 X50.251 Y172.036 E.0159
G1 X29.749 Y151.535 E.86408
G1 X29.749 Y151.002 E.0159
G1 X50.251 Y171.503 E.86408
G1 X50.251 Y170.969 E.0159
G1 X29.749 Y150.468 E.86408
G1 X29.749 Y149.934 E.0159
G1 X50.251 Y170.435 E.86408
G1 X50.251 Y169.902 E.0159
G1 X29.749 Y149.401 E.86408
G1 X29.749 Y148.867 E.0159
G1 X50.251 Y169.368 E.86408
G1 X50.251 Y168.835 E.0159
G1 X29.749 Y148.334 E.86408
G1 X29.749 Y147.8 E.0159
G1 X50.251 Y168.301 E.86408
G1 X50.251 Y167.768 E.0159
G1 X29.749 Y147.267 E.86408
G1 X29.749 Y146.733 E.0159
G1 X50.251 Y167.234 E.86408
G1 X50.251 Y166.7 E.0159
G1 X29.749 Y146.199 E.86408
G1 X29.749 Y145.666 E.0159
G1 X50.251 Y166.167 E.86408
G1 X50.251 Y165.633 E.0159
G1 X29.749 Y145.132 E.86408
G1 X29.749 Y144.599 E.0159
G1 X50.251 Y165.1 E.86408
G1 X50.251 Y164.566 E.0159
G1 X29.749 Y144.065 E.86408
G1 X29.749 Y143.532 E.0159
G1 X50.251 Y164.033 E.86408
G1 X50.251 Y163.499 E.0159
G1 X29.749 Y142.998 E.86408
G1 X29.749 Y142.464 E.0159
G1 X50.251 Y162.965 E.86408
G1 X50.251 Y162.432 E.0159
G1 X29.749 Y141.931 E.86408
G1 X29.749 Y141.397 E.0159
G1 X50.251 Y161.898 E.86408
G1 X50.251 Y161.365 E.0159
G1 X29.749 Y140.864 E.86408
G1 X29.749 Y140.33 E.0159
G1 X50.251 Y160.831 E.86408
G1 X50.251 Y160.298 E.0159
G1 X29.749 Y139.797 E.86408
G1 X29.749 Y139.263 E.0159
G1 X50.251 Y159.764 E.86408
G1 X50.251 Y159.231 E.0159
G1 X29.749 Y138.729 E.86408
G1 X29.749 Y138.196 E.0159
G1 X50.251 Y158.697 E.86408
G1 X50.251 Y158.163 E.0159
G1 X29.749 Y137.662 E.86408
G1 X29.749 Y137.129 E.0159
G1 X50.251 Y157.63 E.86408
G1 X50.251 Y157.096 E.0159
G1 X29.749 Y136.595 E.86408
G1 X29.749 Y136.062 E.0159
G1 X50.251 Y156.563 E.86408
G1 X50.251 Y156.029 E.0159
G1 X29.749 Y135.528 E.86408
G1 X29.749 Y134.994 E.0159
G1 X50.251 Y155.496 E.86408
G1 X50.251 Y154.962 E.0159
G1 X29.749 Y134.461 E.86408
G1 X29.749 Y133.927 E.0159
G1 X50.251 Y154.428 E.86408
G1 X50.251 Y153.895 E.0159
G1 X29.749 Y133.394 E.86408
G1 X29.749 Y132.86 E.0159
G1 X50.251 Y153.361 E.86408
G1 X50.251 Y152.828 E.0159
G1 X29.749 Y132.327 E.86408
G1 X29.749 Y131.793 E.0159
G1 X50.251 Y152.294 E.86408
G1 X50.251 Y151.761 E.0159
G1 X29.749 Y131.259 E.86408
G1 X29.749 Y130.726 E.0159
G1 X50.251 Y151.227 E.86408
G1 X50.251 Y150.693 E.0159
G1 X29.749 Y130.192 E.86408
G1 X29.749 Y129.659 E.0159
G1 X50.251 Y150.16 E.86408
G1 X50.251 Y149.626 E.0159
G1 X29.749 Y129.125 E.86408
G1 X29.749 Y128.592 E.0159
G1 X50.251 Y149.093 E.86408
G1 X50.251 Y148.559 E.0159
G1 X29.749 Y128.058 E.86408
G1 X29.749 Y127.524 E.0159
G1 X50.251 Y148.026 E.86408
G1 X50.251 Y147.492 E.0159
G1 X29.749 Y126.991 E.86408
G1 X29.749 Y126.457 E.0159
G1 X50.251 Y146.958 E.86408
G1 X50.251 Y146.425 E.0159
G1 X29.749 Y125.924 E.86408
G1 X29.749 Y125.39 E.0159
G1 X50.251 Y145.891 E.86408
G1 X50.251 Y145.358 E.0159
G1 X29.749 Y124.857 E.86408
G1 X29.749 Y124.323 E.0159
G1 X50.251 Y144.824 E.86408
G1 X50.251 Y144.291 E.0159
G1 X29.749 Y123.79 E.86408
G1 X29.749 Y123.256 E.0159
G1 X50.251 Y143.757 E.86408
G1 X50.251 Y143.223 E.0159
G1 X29.749 Y122.722 E.86408
G1 X29.749 Y122.189 E.0159
G1 X50.251 Y142.69 E.86408
G1 X50.251 Y142.156 E.0159
G1 X29.749 Y121.655 E.86408
G1 X29.749 Y121.122 E.0159
G1 X50.42 Y141.792 E.87123
; WIPE_START
G1 X49.006 Y140.378 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X44.815 Y134 Z3 F30000
G1 X29.58 Y110.814 Z3
G1 Z2.6
G1 E.8 F1800
G1 F9541.731
G1 X41.593 Y122.827 E.50631
G2 X40.769 Y122.537 I-1.644 J3.355 E.02608
G1 X29.749 Y111.517 E.46446
G1 X29.749 Y112.051 E.0159
G1 X40.156 Y122.458 E.43862
G2 X39.635 Y122.47 I-.178 J3.44 E.01555
G1 X29.749 Y112.585 E.41666
G1 X29.749 Y113.118 E.0159
G1 X39.178 Y122.546 E.39738
G2 X38.77 Y122.672 I.424 J2.1 E.01274
G1 X29.749 Y113.652 E.38019
G1 X29.749 Y114.185 E.0159
G1 X38.399 Y122.835 E.36455
G2 X38.06 Y123.03 I.806 J1.788 E.01166
G1 X29.749 Y114.719 E.35029
G1 X29.749 Y115.252 E.0159
G1 X37.752 Y123.255 E.33731
G2 X37.473 Y123.51 I1.131 J1.524 E.01128
G1 X29.749 Y115.786 E.32553
G1 X29.749 Y116.32 E.0159
G1 X37.222 Y123.792 E.31495
G2 X37 Y124.103 I1.444 J1.265 E.01142
G1 X29.749 Y116.853 E.30559
G1 X29.749 Y117.387 E.0159
G1 X36.808 Y124.445 E.29749
G2 X36.651 Y124.822 I7.151 J3.189 E.01217
G1 X29.749 Y117.92 E.2909
G1 X29.749 Y118.454 E.0159
G1 X36.535 Y125.239 E.28599
G2 X36.465 Y125.703 I2.282 J.582 E.014
G1 X29.749 Y118.987 E.28304
G1 X29.749 Y119.521 E.0159
G1 X36.458 Y126.23 E.28275
G2 X36.555 Y126.86 I3.2 J-.169 E.01904
G1 X29.749 Y120.055 E.28683
G1 X29.749 Y120.588 E.0159
G1 X50.251 Y141.089 E.86408
G1 X50.251 Y140.556 E.0159
G1 X39.137 Y129.442 E.46841
G2 X39.768 Y129.54 I.896 J-3.701 E.01906
G1 X50.251 Y140.022 E.44181
G1 X50.251 Y139.488 E.0159
G1 X40.299 Y129.537 E.41942
G2 X40.76 Y129.465 I-.132 J-2.342 E.01393
G1 X50.251 Y138.955 E.39999
G1 X50.251 Y138.421 E.0159
G1 X41.176 Y129.347 E.38247
G2 X41.553 Y129.191 I-.594 J-1.968 E.01219
G1 X50.251 Y137.888 E.36657
G1 X50.251 Y137.354 E.0159
G1 X41.897 Y129.001 E.35208
G2 X42.21 Y128.78 I-.945 J-1.672 E.01143
G1 X50.251 Y136.821 E.3389
G1 X50.251 Y136.287 E.0159
G1 X42.492 Y128.529 E.32699
G2 X42.746 Y128.249 I-1.271 J-1.408 E.01128
G1 X50.251 Y135.753 E.31629
G1 X50.251 Y135.22 E.0159
G1 X42.971 Y127.941 E.30681
G2 X43.166 Y127.602 I-1.595 J-1.141 E.01167
G1 X50.251 Y134.686 E.29861
G1 X50.251 Y134.153 E.0159
G1 X43.327 Y127.23 E.2918
G2 X43.452 Y126.82 I-1.983 J-.825 E.01277
G1 X50.251 Y133.619 E.28656
G1 X50.251 Y133.086 E.0159
G1 X43.532 Y126.367 E.28318
G2 X43.544 Y125.845 I-4.843 J-.372 E.01556
G1 X50.251 Y132.552 E.28267
G1 X50.251 Y132.019 E.0159
G1 X43.465 Y125.233 E.28599
G2 X43.168 Y124.402 I-3.612 J.825 E.02638
G1 X50.251 Y131.485 E.29853
G1 X50.251 Y130.951 E.0159
G1 X29.749 Y110.45 E.86408
G1 X29.749 Y109.917 E.0159
G1 X50.251 Y130.418 E.86408
G1 X50.251 Y129.884 E.0159
G1 X29.749 Y109.383 E.86408
G1 X29.749 Y108.85 E.0159
G1 X50.251 Y129.351 E.86408
G1 X50.251 Y128.817 E.0159
G1 X29.749 Y108.316 E.86408
G1 X29.749 Y107.782 E.0159
G1 X50.251 Y128.284 E.86408
G1 X50.251 Y127.75 E.0159
G1 X29.749 Y107.249 E.86408
G1 X29.749 Y106.715 E.0159
G1 X50.251 Y127.216 E.86408
G1 X50.251 Y126.683 E.0159
G1 X29.749 Y106.182 E.86408
G1 X29.749 Y105.648 E.0159
G1 X50.251 Y126.149 E.86408
G1 X50.251 Y125.616 E.0159
G1 X29.749 Y105.115 E.86408
G1 X29.749 Y104.581 E.0159
G1 X50.251 Y125.082 E.86408
G1 X50.251 Y124.549 E.0159
G1 X29.749 Y104.047 E.86408
G1 X29.749 Y103.514 E.0159
G1 X50.251 Y124.015 E.86408
G1 X50.251 Y123.481 E.0159
G1 X29.749 Y102.98 E.86408
G1 X29.749 Y102.447 E.0159
G1 X50.251 Y122.948 E.86408
G1 X50.251 Y122.414 E.0159
G1 X29.749 Y101.913 E.86408
G1 X29.749 Y101.38 E.0159
G1 X50.251 Y121.881 E.86408
G1 X50.251 Y121.347 E.0159
G1 X29.749 Y100.846 E.86408
G1 X29.749 Y100.312 E.0159
G1 X50.251 Y120.814 E.86408
G1 X50.251 Y120.28 E.0159
G1 X29.749 Y99.779 E.86408
G1 X29.749 Y99.245 E.0159
G1 X50.251 Y119.746 E.86408
G1 X50.251 Y119.213 E.0159
G1 X29.749 Y98.712 E.86408
G1 X29.749 Y98.178 E.0159
G1 X50.251 Y118.679 E.86408
G1 X50.251 Y118.146 E.0159
G1 X29.749 Y97.645 E.86408
G1 X29.749 Y97.111 E.0159
G1 X50.251 Y117.612 E.86408
G1 X50.251 Y117.079 E.0159
G1 X29.749 Y96.578 E.86408
G1 X29.749 Y96.044 E.0159
G1 X50.251 Y116.545 E.86408
M73 P80 R15
G1 X50.251 Y116.011 E.0159
G1 X29.749 Y95.51 E.86408
G1 X29.749 Y94.977 E.0159
G1 X50.251 Y115.478 E.86408
G1 X50.251 Y114.944 E.0159
G1 X29.749 Y94.443 E.86408
G1 X29.749 Y93.91 E.0159
G1 X50.251 Y114.411 E.86408
G1 X50.251 Y113.877 E.0159
G1 X29.749 Y93.376 E.86408
G1 X29.749 Y92.843 E.0159
G1 X50.251 Y113.344 E.86408
G1 X50.251 Y112.81 E.0159
G1 X29.749 Y92.309 E.86408
G1 X29.749 Y91.775 E.0159
G1 X50.251 Y112.276 E.86408
G1 X50.251 Y111.743 E.0159
G1 X29.749 Y91.242 E.86408
G1 X29.749 Y90.708 E.0159
G1 X50.251 Y111.209 E.86408
G1 X50.251 Y110.676 E.0159
G1 X29.749 Y90.175 E.86408
G1 X29.749 Y89.641 E.0159
G1 X50.251 Y110.142 E.86408
G1 X50.251 Y109.609 E.0159
G1 X29.749 Y89.108 E.86408
G1 X29.749 Y88.574 E.0159
G1 X50.251 Y109.075 E.86408
G1 X50.251 Y108.541 E.0159
G1 X29.749 Y88.04 E.86408
G1 X29.749 Y87.507 E.0159
G1 X50.251 Y108.008 E.86408
G1 X50.251 Y107.474 E.0159
G1 X29.749 Y86.973 E.86408
G1 X29.749 Y86.44 E.0159
G1 X50.251 Y106.941 E.86408
G1 X50.251 Y106.407 E.0159
G1 X29.749 Y85.906 E.86408
G1 X29.749 Y85.373 E.0159
G1 X50.251 Y105.874 E.86408
G1 X50.251 Y105.34 E.0159
G1 X29.749 Y84.839 E.86408
G1 X29.749 Y84.305 E.0159
G1 X50.251 Y104.807 E.86408
G1 X50.251 Y104.273 E.0159
G1 X29.749 Y83.772 E.86408
G1 X29.749 Y83.238 E.0159
G1 X50.251 Y103.739 E.86408
G1 X50.251 Y103.206 E.0159
G1 X29.749 Y82.705 E.86408
G1 X29.749 Y82.171 E.0159
G1 X50.251 Y102.672 E.86408
G1 X50.251 Y102.139 E.0159
G1 X29.749 Y81.638 E.86408
G1 X29.749 Y81.104 E.0159
G1 X50.251 Y101.605 E.86408
G1 X50.251 Y101.072 E.0159
G1 X29.749 Y80.57 E.86408
G1 X29.749 Y80.037 E.0159
G1 X50.251 Y100.538 E.86408
G1 X50.251 Y100.004 E.0159
G1 X29.749 Y79.503 E.86408
G1 X29.749 Y78.97 E.0159
G1 X50.251 Y99.471 E.86408
G1 X50.251 Y98.937 E.0159
G1 X29.749 Y78.436 E.86408
G1 X29.749 Y77.903 E.0159
G1 X50.251 Y98.404 E.86408
G1 X50.251 Y97.87 E.0159
G1 X29.749 Y77.369 E.86408
G1 X29.749 Y76.835 E.0159
G1 X50.251 Y97.337 E.86408
G1 X50.251 Y96.803 E.0159
G1 X29.749 Y76.302 E.86408
G1 X29.749 Y75.768 E.0159
G1 X50.251 Y96.269 E.86408
G1 X50.251 Y95.736 E.0159
G1 X29.749 Y75.235 E.86408
G1 X29.749 Y74.701 E.0159
G1 X50.251 Y95.202 E.86408
G1 X50.251 Y94.669 E.0159
G1 X29.749 Y74.168 E.86408
G1 X29.749 Y73.634 E.0159
G1 X50.251 Y94.135 E.86408
G1 X50.251 Y93.602 E.0159
G1 X29.749 Y73.1 E.86408
G1 X29.749 Y72.567 E.0159
G1 X50.251 Y93.068 E.86408
G1 X50.251 Y92.534 E.0159
G1 X29.749 Y72.033 E.86408
G1 X29.749 Y71.5 E.0159
G1 X50.251 Y92.001 E.86408
G1 X50.251 Y91.467 E.0159
G1 X29.749 Y70.966 E.86408
G1 X29.749 Y70.433 E.0159
G1 X50.251 Y90.934 E.86408
G1 X50.251 Y90.4 E.0159
G1 X29.749 Y69.899 E.86408
G1 X29.749 Y69.366 E.0159
G1 X50.251 Y89.867 E.86408
G1 X50.251 Y89.333 E.0159
G1 X29.749 Y68.832 E.86408
G1 X29.749 Y68.298 E.0159
G1 X50.251 Y88.799 E.86408
G1 X50.251 Y88.266 E.0159
G1 X29.749 Y67.765 E.86408
G1 X29.749 Y67.231 E.0159
G1 X50.251 Y87.732 E.86408
G1 X50.251 Y87.199 E.0159
G1 X29.749 Y66.698 E.86408
G1 X29.749 Y66.164 E.0159
G1 X50.251 Y86.665 E.86408
G1 X50.251 Y86.132 E.0159
G1 X29.749 Y65.631 E.86408
G1 X29.749 Y65.097 E.0159
G1 X50.251 Y85.598 E.86408
G1 X50.251 Y85.064 E.0159
G1 X29.749 Y64.563 E.86408
G1 X29.749 Y64.03 E.0159
G1 X50.251 Y84.531 E.86408
G1 X50.251 Y83.997 E.0159
G1 X29.749 Y63.496 E.86408
G1 X29.749 Y62.963 E.0159
G1 X50.251 Y83.464 E.86408
G1 X50.251 Y82.93 E.0159
G1 X29.749 Y62.429 E.86408
G1 X29.749 Y61.896 E.0159
G1 X50.251 Y82.397 E.86408
G1 X50.251 Y81.863 E.0159
G1 X29.749 Y61.362 E.86408
G1 X29.749 Y60.828 E.0159
G1 X50.251 Y81.329 E.86408
G1 X50.251 Y80.796 E.0159
G1 X29.749 Y60.295 E.86408
G1 X29.749 Y59.761 E.0159
G1 X50.251 Y80.262 E.86408
G1 X50.251 Y79.729 E.0159
G1 X29.749 Y59.228 E.86408
G1 X29.749 Y58.694 E.0159
G1 X50.251 Y79.195 E.86408
G1 X50.251 Y78.662 E.0159
G1 X29.749 Y58.161 E.86408
G1 X29.749 Y57.627 E.0159
G1 X50.251 Y78.128 E.86408
G1 X50.251 Y77.595 E.0159
G1 X29.749 Y57.093 E.86408
G1 X29.749 Y56.56 E.0159
G1 X50.251 Y77.061 E.86408
G1 X50.251 Y76.527 E.0159
G1 X29.749 Y56.026 E.86408
G1 X29.749 Y55.493 E.0159
G1 X50.251 Y75.994 E.86408
G1 X50.251 Y75.46 E.0159
G1 X29.749 Y54.959 E.86408
G1 X29.749 Y54.426 E.0159
G1 X50.251 Y74.927 E.86408
G1 X50.251 Y74.393 E.0159
G1 X29.749 Y53.892 E.86408
G1 X29.749 Y53.358 E.0159
G1 X50.251 Y73.86 E.86408
G1 X50.251 Y73.326 E.0159
G1 X29.749 Y52.825 E.86408
G1 X29.749 Y52.291 E.0159
G1 X50.251 Y72.792 E.86408
G1 X50.251 Y72.259 E.0159
G1 X29.749 Y51.758 E.86408
G1 X29.749 Y51.224 E.0159
G1 X50.251 Y71.725 E.86408
G1 X50.251 Y71.192 E.0159
G1 X29.749 Y50.691 E.86408
G1 X29.749 Y50.157 E.0159
G1 X50.251 Y70.658 E.86408
G1 X50.251 Y70.125 E.0159
G1 X29.749 Y49.623 E.86408
G1 X29.749 Y49.09 E.0159
G1 X50.251 Y69.591 E.86408
G1 X50.251 Y69.057 E.0159
G1 X29.749 Y48.556 E.86408
G1 X29.749 Y48.023 E.0159
G1 X50.251 Y68.524 E.86408
G1 X50.251 Y67.99 E.0159
G1 X29.749 Y47.489 E.86408
G1 X29.749 Y46.956 E.0159
G1 X50.251 Y67.457 E.86408
G1 X50.251 Y66.923 E.0159
G1 X29.749 Y46.422 E.86408
G1 X29.749 Y45.888 E.0159
G1 X50.251 Y66.39 E.86408
G1 X50.251 Y65.856 E.0159
G1 X29.749 Y45.355 E.86408
G1 X29.749 Y44.821 E.0159
G1 X50.251 Y65.322 E.86408
M73 P80 R14
G1 X50.251 Y64.789 E.0159
G1 X29.749 Y44.288 E.86408
G1 X29.749 Y43.754 E.0159
G1 X50.251 Y64.255 E.86408
G1 X50.251 Y63.722 E.0159
G1 X29.749 Y43.221 E.86408
G1 X29.749 Y42.687 E.0159
G1 X50.251 Y63.188 E.86408
G1 X50.251 Y62.655 E.0159
G1 X29.749 Y42.154 E.86408
G1 X29.749 Y41.62 E.0159
G1 X50.251 Y62.121 E.86408
G1 X50.251 Y61.587 E.0159
G1 X29.749 Y41.086 E.86408
G1 X29.749 Y40.553 E.0159
G1 X50.251 Y61.054 E.86408
G1 X50.251 Y60.52 E.0159
G1 X29.749 Y40.019 E.86408
G1 X29.749 Y39.486 E.0159
G1 X50.42 Y60.156 E.87123
; WIPE_START
G1 X49.006 Y58.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X45.103 Y52.183 Z3 F30000
G1 X34.106 Y33.705 Z3
G1 Z2.6
G1 E.8 F1800
G1 F9541.731
G1 X41.181 Y40.78 E.2982
G2 X40.478 Y40.61 I-1.194 J3.403 E.02161
G1 X33.742 Y33.874 E.28389
G1 X33.209 Y33.874 E.0159
G1 X39.917 Y40.582 E.28273
G2 X39.425 Y40.624 I-.006 J2.826 E.01472
G1 X32.675 Y33.874 E.2845
G1 X32.142 Y33.874 E.0159
G1 X38.991 Y40.724 E.28869
G2 X38.598 Y40.865 I.506 J2.033 E.01246
G1 X31.608 Y33.874 E.29462
G1 X31.075 Y33.874 E.0159
G1 X38.241 Y41.041 E.30204
G2 X37.916 Y41.25 I6.209 J9.999 E.01151
G1 X30.541 Y33.874 E.31085
G1 X30.007 Y33.874 E.0159
G1 X37.622 Y41.489 E.32094
G2 X37.356 Y41.757 I1.207 J1.463 E.01126
G1 X29.749 Y34.15 E.32062
G1 X29.749 Y34.684 E.0159
G1 X37.119 Y42.053 E.31062
G2 X36.912 Y42.379 I1.526 J1.201 E.01154
G1 X29.749 Y35.217 E.30187
G1 X29.749 Y35.751 E.0159
G1 X36.736 Y42.737 E.29445
G2 X36.595 Y43.13 I1.896 J.901 E.01246
G1 X29.749 Y36.284 E.28852
G1 X29.749 Y36.818 E.0159
G1 X36.495 Y43.563 E.2843
G2 X36.453 Y44.055 I4.582 J.638 E.01471
G1 X29.749 Y37.351 E.28253
G1 X29.749 Y37.885 E.0159
G1 X36.485 Y44.62 E.28387
G2 X36.659 Y45.328 I4.402 J-.708 E.02175
G1 X29.749 Y38.419 E.29122
G1 X29.749 Y38.952 E.0159
G1 X50.251 Y59.453 E.86408
G1 X50.251 Y58.92 E.0159
G1 X38.793 Y47.462 E.48292
G2 X39.504 Y47.639 I1.296 J-3.676 E.02188
G1 X50.251 Y58.386 E.45295
G1 X50.251 Y57.852 E.0159
G1 X40.07 Y47.672 E.4291
G2 X40.561 Y47.63 I.036 J-2.479 E.01473
G1 X50.251 Y57.319 E.40838
G1 X50.251 Y56.785 E.0159
G1 X40.997 Y47.532 E.39001
G2 X41.389 Y47.39 I-.514 J-2.028 E.01243
G1 X50.251 Y56.252 E.37351
G1 X50.251 Y55.718 E.0159
G1 X41.746 Y47.213 E.35847
G2 X42.071 Y47.005 I-.876 J-1.728 E.01153
G1 X50.251 Y55.185 E.34476
G1 X50.251 Y54.651 E.0159
G1 X42.367 Y46.767 E.33229
G2 X42.634 Y46.501 I-1.196 J-1.469 E.01126
G1 X50.509 Y54.376 E.33189
G1 X51.042 Y54.376 E.0159
G1 X42.873 Y46.207 E.3443
G2 X43.083 Y45.883 I-1.516 J-1.212 E.01152
G1 X51.576 Y54.376 E.35795
G1 X52.109 Y54.376 E.0159
G1 X43.262 Y45.528 E.37291
G2 X43.403 Y45.136 I-6.481 J-2.561 E.01242
G1 X52.643 Y54.376 E.38944
G1 X53.176 Y54.376 E.0159
G1 X43.501 Y44.7 E.40781
G2 X43.547 Y44.213 I-2.416 J-.477 E.0146
G1 X53.71 Y54.376 E.42834
G1 X54.244 Y54.376 E.0159
G1 X43.515 Y43.647 E.45218
G2 X43.345 Y42.943 I-3.56 J.49 E.02163
G1 X54.777 Y54.376 E.48185
G1 X55.311 Y54.376 E.0159
G1 X34.81 Y33.874 E.86408
G1 X35.343 Y33.874 E.0159
G1 X55.844 Y54.376 E.86408
G1 X56.378 Y54.376 E.0159
G1 X35.877 Y33.874 E.86408
G1 X36.41 Y33.874 E.0159
G1 X56.911 Y54.376 E.86408
G1 X57.445 Y54.376 E.0159
G1 X36.944 Y33.874 E.86408
G1 X37.477 Y33.874 E.0159
G1 X57.979 Y54.376 E.86408
G1 X58.512 Y54.376 E.0159
G1 X38.011 Y33.874 E.86408
G1 X38.545 Y33.874 E.0159
G1 X59.046 Y54.376 E.86408
G1 X59.579 Y54.376 E.0159
G1 X39.078 Y33.874 E.86408
G1 X39.612 Y33.874 E.0159
G1 X60.113 Y54.376 E.86408
G1 X60.646 Y54.376 E.0159
G1 X40.145 Y33.874 E.86408
G1 X40.679 Y33.874 E.0159
G1 X61.18 Y54.376 E.86408
G1 X61.714 Y54.376 E.0159
G1 X41.212 Y33.874 E.86408
G1 X41.746 Y33.874 E.0159
G1 X62.247 Y54.376 E.86408
G1 X62.781 Y54.376 E.0159
G1 X42.28 Y33.874 E.86408
G1 X42.813 Y33.874 E.0159
G1 X63.314 Y54.376 E.86408
G1 X63.848 Y54.376 E.0159
G1 X43.347 Y33.874 E.86408
G1 X43.88 Y33.874 E.0159
G1 X64.381 Y54.376 E.86408
G1 X64.915 Y54.376 E.0159
G1 X44.414 Y33.874 E.86408
G1 X44.947 Y33.874 E.0159
G1 X65.448 Y54.376 E.86408
G1 X65.982 Y54.376 E.0159
G1 X45.481 Y33.874 E.86408
G1 X46.015 Y33.874 E.0159
G1 X66.516 Y54.376 E.86408
G1 X67.049 Y54.376 E.0159
G1 X46.548 Y33.874 E.86408
G1 X47.082 Y33.874 E.0159
G1 X67.583 Y54.376 E.86408
G1 X68.116 Y54.376 E.0159
G1 X47.615 Y33.874 E.86408
G1 X48.149 Y33.874 E.0159
G1 X68.65 Y54.376 E.86408
G1 X69.183 Y54.376 E.0159
G1 X48.682 Y33.874 E.86408
G1 X49.216 Y33.874 E.0159
G1 X69.717 Y54.376 E.86408
G1 X70.251 Y54.376 E.0159
G1 X49.75 Y33.874 E.86408
G1 X50.283 Y33.874 E.0159
G1 X70.784 Y54.376 E.86408
G1 X71.318 Y54.376 E.0159
G1 X50.817 Y33.874 E.86408
G1 X51.35 Y33.874 E.0159
G1 X71.851 Y54.376 E.86408
G1 X72.385 Y54.376 E.0159
G1 X51.884 Y33.874 E.86408
G1 X52.417 Y33.874 E.0159
G1 X72.918 Y54.376 E.86408
G1 X73.452 Y54.376 E.0159
G1 X52.951 Y33.874 E.86408
G1 X53.485 Y33.874 E.0159
G1 X73.986 Y54.376 E.86408
G1 X74.519 Y54.376 E.0159
G1 X54.018 Y33.874 E.86408
G1 X54.552 Y33.874 E.0159
G1 X75.053 Y54.376 E.86408
G1 X75.586 Y54.376 E.0159
G1 X55.085 Y33.874 E.86408
G1 X55.619 Y33.874 E.0159
G1 X76.12 Y54.376 E.86408
G1 X76.653 Y54.376 E.0159
G1 X56.152 Y33.874 E.86408
G1 X56.686 Y33.874 E.0159
G1 X77.187 Y54.376 E.86408
G1 X77.721 Y54.376 E.0159
G1 X57.22 Y33.874 E.86408
G1 X57.753 Y33.874 E.0159
G1 X78.254 Y54.376 E.86408
G1 X78.788 Y54.376 E.0159
G1 X58.287 Y33.874 E.86408
G1 X58.82 Y33.874 E.0159
G1 X79.321 Y54.376 E.86408
G1 X79.855 Y54.376 E.0159
G1 X59.354 Y33.874 E.86408
G1 X59.887 Y33.874 E.0159
G1 X80.388 Y54.376 E.86408
G1 X80.922 Y54.376 E.0159
G1 X60.421 Y33.874 E.86408
G1 X60.954 Y33.874 E.0159
G1 X81.456 Y54.376 E.86408
G1 X81.989 Y54.376 E.0159
G1 X61.488 Y33.874 E.86408
G1 X62.022 Y33.874 E.0159
G1 X82.523 Y54.376 E.86408
G1 X83.056 Y54.376 E.0159
G1 X62.555 Y33.874 E.86408
G1 X63.089 Y33.874 E.0159
G1 X83.59 Y54.376 E.86408
G1 X84.123 Y54.376 E.0159
G1 X63.622 Y33.874 E.86408
G1 X64.156 Y33.874 E.0159
G1 X84.657 Y54.376 E.86408
G1 X85.191 Y54.376 E.0159
G1 X64.689 Y33.874 E.86408
G1 X65.223 Y33.874 E.0159
G1 X85.724 Y54.376 E.86408
G1 X86.258 Y54.376 E.0159
G1 X65.757 Y33.874 E.86408
G1 X66.29 Y33.874 E.0159
G1 X86.791 Y54.376 E.86408
G1 X87.325 Y54.376 E.0159
G1 X66.824 Y33.874 E.86408
G1 X67.357 Y33.874 E.0159
G1 X87.858 Y54.376 E.86408
G1 X88.392 Y54.376 E.0159
G1 X67.891 Y33.874 E.86408
G1 X68.424 Y33.874 E.0159
G1 X88.926 Y54.376 E.86408
G1 X89.459 Y54.376 E.0159
G1 X68.958 Y33.874 E.86408
G1 X69.492 Y33.874 E.0159
G1 X89.993 Y54.376 E.86408
G1 X90.526 Y54.376 E.0159
G1 X70.025 Y33.874 E.86408
G1 X70.559 Y33.874 E.0159
G1 X91.06 Y54.376 E.86408
G1 X91.593 Y54.376 E.0159
G1 X71.092 Y33.874 E.86408
G1 X71.626 Y33.874 E.0159
G1 X92.127 Y54.376 E.86408
G1 X92.66 Y54.376 E.0159
G1 X72.159 Y33.874 E.86408
G1 X72.693 Y33.874 E.0159
G1 X93.194 Y54.376 E.86408
G1 X93.728 Y54.376 E.0159
G1 X73.227 Y33.874 E.86408
G1 X73.76 Y33.874 E.0159
G1 X94.261 Y54.376 E.86408
G1 X94.795 Y54.376 E.0159
G1 X74.294 Y33.874 E.86408
G1 X74.827 Y33.874 E.0159
G1 X95.328 Y54.376 E.86408
G1 X95.862 Y54.376 E.0159
G1 X75.361 Y33.874 E.86408
G1 X75.894 Y33.874 E.0159
G1 X96.395 Y54.376 E.86408
G1 X96.929 Y54.376 E.0159
G1 X76.428 Y33.874 E.86408
G1 X76.962 Y33.874 E.0159
G1 X97.463 Y54.376 E.86408
G1 X97.996 Y54.376 E.0159
G1 X77.495 Y33.874 E.86408
G1 X78.029 Y33.874 E.0159
G1 X98.53 Y54.376 E.86408
G1 X99.063 Y54.376 E.0159
G1 X78.562 Y33.874 E.86408
G1 X79.096 Y33.874 E.0159
G1 X99.597 Y54.376 E.86408
G1 X100.13 Y54.376 E.0159
G1 X79.629 Y33.874 E.86408
G1 X80.163 Y33.874 E.0159
G1 X100.664 Y54.376 E.86408
G1 X101.198 Y54.376 E.0159
G1 X80.697 Y33.874 E.86408
G1 X81.23 Y33.874 E.0159
G1 X101.731 Y54.376 E.86408
G1 X102.265 Y54.376 E.0159
G1 X81.764 Y33.874 E.86408
G1 X82.297 Y33.874 E.0159
G1 X102.798 Y54.376 E.86408
G1 X103.332 Y54.376 E.0159
G1 X82.831 Y33.874 E.86408
G1 X83.364 Y33.874 E.0159
G1 X103.865 Y54.376 E.86408
G1 X104.399 Y54.376 E.0159
G1 X83.898 Y33.874 E.86408
G1 X84.432 Y33.874 E.0159
G1 X104.933 Y54.376 E.86408
G1 X105.466 Y54.376 E.0159
G1 X84.965 Y33.874 E.86408
M73 P81 R14
G1 X85.499 Y33.874 E.0159
G1 X106 Y54.376 E.86408
G1 X106.533 Y54.376 E.0159
G1 X86.032 Y33.874 E.86408
G1 X86.566 Y33.874 E.0159
G1 X107.067 Y54.376 E.86408
G1 X107.6 Y54.376 E.0159
G1 X87.099 Y33.874 E.86408
G1 X87.633 Y33.874 E.0159
G1 X108.134 Y54.376 E.86408
G1 X108.668 Y54.376 E.0159
G1 X88.166 Y33.874 E.86408
G1 X88.7 Y33.874 E.0159
G1 X109.201 Y54.376 E.86408
G1 X109.735 Y54.376 E.0159
G1 X89.234 Y33.874 E.86408
G1 X89.767 Y33.874 E.0159
G1 X110.268 Y54.376 E.86408
G1 X110.802 Y54.376 E.0159
G1 X90.301 Y33.874 E.86408
G1 X90.834 Y33.874 E.0159
G1 X111.335 Y54.376 E.86408
G1 X111.869 Y54.376 E.0159
G1 X91.368 Y33.874 E.86408
G1 X91.901 Y33.874 E.0159
G1 X112.403 Y54.376 E.86408
G1 X112.936 Y54.376 E.0159
G1 X92.435 Y33.874 E.86408
G1 X92.969 Y33.874 E.0159
G1 X113.47 Y54.376 E.86408
G1 X114.003 Y54.376 E.0159
G1 X93.502 Y33.874 E.86408
G1 X94.036 Y33.874 E.0159
G1 X114.537 Y54.376 E.86408
G1 X115.07 Y54.376 E.0159
G1 X94.569 Y33.874 E.86408
G1 X95.103 Y33.874 E.0159
G1 X115.604 Y54.376 E.86408
G1 X116.138 Y54.376 E.0159
G1 X95.636 Y33.874 E.86408
G1 X96.17 Y33.874 E.0159
G1 X116.671 Y54.376 E.86408
G1 X117.205 Y54.376 E.0159
G1 X96.704 Y33.874 E.86408
G1 X97.237 Y33.874 E.0159
G1 X117.738 Y54.376 E.86408
G1 X118.272 Y54.376 E.0159
G1 X97.771 Y33.874 E.86408
G1 X98.304 Y33.874 E.0159
G1 X118.805 Y54.376 E.86408
G1 X119.339 Y54.376 E.0159
G1 X98.838 Y33.874 E.86408
G1 X99.371 Y33.874 E.0159
G1 X119.872 Y54.376 E.86408
G1 X120.406 Y54.376 E.0159
G1 X99.905 Y33.874 E.86408
G1 X100.439 Y33.874 E.0159
G1 X120.94 Y54.376 E.86408
G1 X121.473 Y54.376 E.0159
G1 X100.972 Y33.874 E.86408
G1 X101.506 Y33.874 E.0159
G1 X122.007 Y54.376 E.86408
G1 X122.54 Y54.376 E.0159
G1 X102.039 Y33.874 E.86408
G1 X102.573 Y33.874 E.0159
G1 X123.074 Y54.376 E.86408
G1 X123.607 Y54.376 E.0159
G1 X103.106 Y33.874 E.86408
G1 X103.64 Y33.874 E.0159
G1 X124.141 Y54.376 E.86408
G1 X124.675 Y54.376 E.0159
G1 X104.174 Y33.874 E.86408
G1 X104.707 Y33.874 E.0159
G1 X125.208 Y54.376 E.86408
G1 X125.742 Y54.376 E.0159
G1 X105.241 Y33.874 E.86408
G1 X105.774 Y33.874 E.0159
G1 X126.275 Y54.376 E.86408
G1 X126.809 Y54.376 E.0159
G1 X106.308 Y33.874 E.86408
G1 X106.841 Y33.874 E.0159
G1 X127.342 Y54.376 E.86408
G1 X127.876 Y54.376 E.0159
G1 X107.375 Y33.874 E.86408
G1 X107.909 Y33.874 E.0159
G1 X128.41 Y54.376 E.86408
G1 X128.943 Y54.376 E.0159
G1 X108.442 Y33.874 E.86408
G1 X108.976 Y33.874 E.0159
G1 X129.477 Y54.376 E.86408
G1 X130.01 Y54.376 E.0159
G1 X109.509 Y33.874 E.86408
G1 X110.043 Y33.874 E.0159
G1 X130.544 Y54.376 E.86408
G1 X131.077 Y54.376 E.0159
G1 X110.576 Y33.874 E.86408
G1 X111.11 Y33.874 E.0159
G1 X131.611 Y54.376 E.86408
G1 X132.145 Y54.376 E.0159
G1 X111.644 Y33.874 E.86408
G1 X112.177 Y33.874 E.0159
G1 X132.848 Y54.545 E.87123
; WIPE_START
G1 X131.434 Y53.131 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.141 Y46.245 Z3 F30000
G1 X122.145 Y33.705 Z3
G1 Z2.6
G1 E.8 F1800
G1 F9541.731
G1 X129.24 Y40.799 E.29903
G2 X128.522 Y40.615 I-1.304 J3.595 E.02211
G1 X121.781 Y33.874 E.28412
G1 X121.248 Y33.874 E.0159
G1 X127.956 Y40.582 E.28273
G2 X127.458 Y40.619 I-.039 J2.901 E.01488
G1 X120.714 Y33.874 E.28425
G1 X120.181 Y33.874 E.0159
G1 X127.022 Y40.715 E.28833
G2 X126.626 Y40.854 I.493 J2.045 E.0125
G1 X119.647 Y33.874 E.29416
G1 X119.113 Y33.874 E.0159
G1 X126.267 Y41.027 E.30149
G2 X125.939 Y41.233 I.866 J1.741 E.01155
G1 X118.58 Y33.874 E.31017
G1 X118.046 Y33.874 E.0159
G1 X125.642 Y41.47 E.32014
G2 X125.374 Y41.736 I1.195 J1.47 E.01126
G1 X117.513 Y33.874 E.33134
G1 X116.979 Y33.874 E.0159
G1 X125.135 Y42.03 E.34375
G2 X124.925 Y42.354 I1.512 J1.208 E.01152
G1 X116.446 Y33.874 E.3574
G1 X115.912 Y33.874 E.0159
G1 X124.747 Y42.71 E.37238
G2 X124.604 Y43.1 I1.885 J.912 E.01241
G1 X115.378 Y33.874 E.38884
G1 X114.845 Y33.874 E.0159
G1 X124.501 Y43.531 E.40699
G2 X124.453 Y44.016 I4.393 J.683 E.01454
G1 X114.311 Y33.874 E.42744
G1 X113.778 Y33.874 E.0159
G1 X124.48 Y44.577 E.45109
G2 X124.642 Y45.272 I3.86 J-.53 E.02129
G1 X113.244 Y33.874 E.48038
G1 X112.711 Y33.874 E.0159
G1 X133.212 Y54.376 E.86408
G1 X133.745 Y54.376 E.0159
G1 X126.857 Y47.487 E.29034
G2 X127.551 Y47.648 I1.449 J-4.676 E.02127
G1 X134.279 Y54.376 E.28356
G1 X134.812 Y54.376 E.0159
G1 X128.108 Y47.671 E.2826
G2 X128.596 Y47.625 I.017 J-2.464 E.01464
G1 X135.346 Y54.376 E.28451
G1 X135.88 Y54.376 E.0159
G1 X129.026 Y47.522 E.28885
G2 X129.416 Y47.378 I-.528 J-2.02 E.01239
G1 X136.413 Y54.376 E.29494
G1 X136.947 Y54.376 E.0159
G1 X129.77 Y47.199 E.30248
G2 X130.093 Y46.989 I-.888 J-1.719 E.01151
G1 X137.48 Y54.376 E.31134
G1 X138.014 Y54.376 E.0159
G1 X130.387 Y46.749 E.32144
G2 X130.653 Y46.481 I-1.207 J-1.461 E.01126
G1 X138.547 Y54.376 E.33274
G1 X139.081 Y54.376 E.0159
G1 X130.89 Y46.185 E.34524
G2 X131.098 Y45.859 I-1.525 J-1.202 E.01154
G1 X139.615 Y54.376 E.35897
G1 X140.148 Y54.376 E.0159
G1 X131.274 Y45.501 E.37403
G2 X131.411 Y45.105 I-1.917 J-.884 E.01253
G1 X140.682 Y54.376 E.39074
G1 X141.215 Y54.376 E.0159
G1 X131.506 Y44.666 E.40924
G2 X131.549 Y44.176 I-2.432 J-.462 E.01469
G1 X141.749 Y54.376 E.4299
G1 X142.282 Y54.376 E.0159
G1 X131.508 Y43.602 E.4541
G2 X131.323 Y42.882 I-3.517 J.525 E.02219
G1 X142.816 Y54.376 E.48443
G1 X143.35 Y54.376 E.0159
G1 X122.848 Y33.874 E.86408
G1 X123.382 Y33.874 E.0159
G1 X143.883 Y54.376 E.86408
G1 X144.417 Y54.376 E.0159
G1 X123.916 Y33.874 E.86408
G1 X124.449 Y33.874 E.0159
G1 X144.95 Y54.376 E.86408
G1 X145.484 Y54.376 E.0159
G1 X124.983 Y33.874 E.86408
G1 X125.516 Y33.874 E.0159
G1 X146.017 Y54.376 E.86408
G1 X146.551 Y54.376 E.0159
G1 X126.05 Y33.874 E.86408
G1 X126.583 Y33.874 E.0159
G1 X147.084 Y54.376 E.86408
G1 X147.618 Y54.376 E.0159
G1 X127.117 Y33.874 E.86408
G1 X127.651 Y33.874 E.0159
G1 X148.152 Y54.376 E.86408
G1 X148.685 Y54.376 E.0159
G1 X128.184 Y33.874 E.86408
G1 X128.718 Y33.874 E.0159
G1 X149.219 Y54.376 E.86408
G1 X149.752 Y54.376 E.0159
G1 X129.251 Y33.874 E.86408
G1 X129.785 Y33.874 E.0159
G1 X150.286 Y54.376 E.86408
G1 X150.819 Y54.376 E.0159
G1 X130.318 Y33.874 E.86408
G1 X130.852 Y33.874 E.0159
G1 X151.353 Y54.376 E.86408
G1 X151.887 Y54.376 E.0159
G1 X131.386 Y33.874 E.86408
G1 X131.919 Y33.874 E.0159
G1 X152.42 Y54.376 E.86408
G1 X152.954 Y54.376 E.0159
G1 X132.453 Y33.874 E.86408
G1 X132.986 Y33.874 E.0159
G1 X153.487 Y54.376 E.86408
G1 X154.021 Y54.376 E.0159
G1 X133.52 Y33.874 E.86408
G1 X134.053 Y33.874 E.0159
G1 X154.554 Y54.376 E.86408
G1 X155.088 Y54.376 E.0159
G1 X134.587 Y33.874 E.86408
G1 X135.121 Y33.874 E.0159
G1 X155.622 Y54.376 E.86408
G1 X156.155 Y54.376 E.0159
G1 X135.654 Y33.874 E.86408
G1 X136.188 Y33.874 E.0159
G1 X156.689 Y54.376 E.86408
G1 X157.222 Y54.376 E.0159
G1 X136.721 Y33.874 E.86408
G1 X137.255 Y33.874 E.0159
G1 X157.756 Y54.376 E.86408
G1 X158.289 Y54.376 E.0159
G1 X137.788 Y33.874 E.86408
G1 X138.322 Y33.874 E.0159
G1 X158.823 Y54.376 E.86408
G1 X159.357 Y54.376 E.0159
G1 X138.856 Y33.874 E.86408
G1 X139.389 Y33.874 E.0159
G1 X159.89 Y54.376 E.86408
G1 X160.424 Y54.376 E.0159
G1 X139.923 Y33.874 E.86408
G1 X140.456 Y33.874 E.0159
G1 X160.957 Y54.376 E.86408
G1 X161.491 Y54.376 E.0159
G1 X140.99 Y33.874 E.86408
G1 X141.523 Y33.874 E.0159
G1 X162.024 Y54.376 E.86408
G1 X162.558 Y54.376 E.0159
G1 X142.057 Y33.874 E.86408
G1 X142.59 Y33.874 E.0159
G1 X163.092 Y54.376 E.86408
G1 X163.625 Y54.376 E.0159
G1 X143.124 Y33.874 E.86408
G1 X143.658 Y33.874 E.0159
G1 X164.159 Y54.376 E.86408
G1 X164.692 Y54.376 E.0159
G1 X144.191 Y33.874 E.86408
G1 X144.725 Y33.874 E.0159
G1 X165.226 Y54.376 E.86408
G1 X165.759 Y54.376 E.0159
G1 X145.258 Y33.874 E.86408
G1 X145.792 Y33.874 E.0159
G1 X166.293 Y54.376 E.86408
G1 X166.827 Y54.376 E.0159
G1 X146.325 Y33.874 E.86408
G1 X146.859 Y33.874 E.0159
G1 X167.36 Y54.376 E.86408
G1 X167.894 Y54.376 E.0159
G1 X147.393 Y33.874 E.86408
G1 X147.926 Y33.874 E.0159
G1 X168.427 Y54.376 E.86408
G1 X168.961 Y54.376 E.0159
G1 X148.46 Y33.874 E.86408
G1 X148.993 Y33.874 E.0159
G1 X169.494 Y54.376 E.86408
G1 X170.028 Y54.376 E.0159
G1 X149.527 Y33.874 E.86408
G1 X150.06 Y33.874 E.0159
G1 X170.562 Y54.376 E.86408
G1 X171.095 Y54.376 E.0159
G1 X150.594 Y33.874 E.86408
G1 X151.128 Y33.874 E.0159
G1 X171.629 Y54.376 E.86408
G1 X172.162 Y54.376 E.0159
G1 X151.661 Y33.874 E.86408
G1 X152.195 Y33.874 E.0159
G1 X172.696 Y54.376 E.86408
G1 X173.229 Y54.376 E.0159
G1 X152.728 Y33.874 E.86408
G1 X153.262 Y33.874 E.0159
G1 X173.763 Y54.376 E.86408
G1 X174.296 Y54.376 E.0159
G1 X153.795 Y33.874 E.86408
G1 X154.329 Y33.874 E.0159
G1 X174.83 Y54.376 E.86408
G1 X175.364 Y54.376 E.0159
G1 X154.863 Y33.874 E.86408
G1 X155.396 Y33.874 E.0159
G1 X175.897 Y54.376 E.86408
G1 X176.431 Y54.376 E.0159
G1 X155.93 Y33.874 E.86408
G1 X156.463 Y33.874 E.0159
G1 X176.964 Y54.376 E.86408
G1 X177.498 Y54.376 E.0159
G1 X156.997 Y33.874 E.86408
G1 X157.53 Y33.874 E.0159
G1 X178.031 Y54.376 E.86408
G1 X178.565 Y54.376 E.0159
G1 X158.064 Y33.874 E.86408
G1 X158.598 Y33.874 E.0159
G1 X179.099 Y54.376 E.86408
G1 X179.632 Y54.376 E.0159
G1 X159.131 Y33.874 E.86408
G1 X159.665 Y33.874 E.0159
G1 X180.166 Y54.376 E.86408
G1 X180.699 Y54.376 E.0159
G1 X160.198 Y33.874 E.86408
G1 X160.732 Y33.874 E.0159
G1 X181.233 Y54.376 E.86408
G1 X181.766 Y54.376 E.0159
G1 X161.265 Y33.874 E.86408
G1 X161.799 Y33.874 E.0159
G1 X182.3 Y54.376 E.86408
G1 X182.834 Y54.376 E.0159
G1 X162.333 Y33.874 E.86408
G1 X162.866 Y33.874 E.0159
G1 X183.367 Y54.376 E.86408
G1 X183.901 Y54.376 E.0159
G1 X163.4 Y33.874 E.86408
G1 X163.933 Y33.874 E.0159
G1 X184.434 Y54.376 E.86408
G1 X184.968 Y54.376 E.0159
G1 X164.467 Y33.874 E.86408
G1 X165 Y33.874 E.0159
G1 X185.501 Y54.376 E.86408
G1 X186.035 Y54.376 E.0159
G1 X165.534 Y33.874 E.86408
G1 X166.068 Y33.874 E.0159
G1 X186.569 Y54.376 E.86408
G1 X187.102 Y54.376 E.0159
G1 X166.601 Y33.874 E.86408
G1 X167.135 Y33.874 E.0159
G1 X187.636 Y54.376 E.86408
G1 X188.169 Y54.376 E.0159
G1 X167.668 Y33.874 E.86408
G1 X168.202 Y33.874 E.0159
G1 X188.703 Y54.376 E.86408
G1 X189.236 Y54.376 E.0159
G1 X168.735 Y33.874 E.86408
G1 X169.269 Y33.874 E.0159
G1 X189.77 Y54.376 E.86408
G1 X190.304 Y54.376 E.0159
G1 X169.802 Y33.874 E.86408
G1 X170.336 Y33.874 E.0159
G1 X190.837 Y54.376 E.86408
G1 X191.371 Y54.376 E.0159
G1 X170.87 Y33.874 E.86408
G1 X171.403 Y33.874 E.0159
G1 X191.904 Y54.376 E.86408
G1 X192.438 Y54.376 E.0159
G1 X171.937 Y33.874 E.86408
M73 P81 R13
G1 X172.47 Y33.874 E.0159
G1 X192.971 Y54.376 E.86408
G1 X193.505 Y54.376 E.0159
G1 X173.004 Y33.874 E.86408
G1 X173.537 Y33.874 E.0159
G1 X194.039 Y54.376 E.86408
G1 X194.572 Y54.376 E.0159
G1 X174.071 Y33.874 E.86408
G1 X174.605 Y33.874 E.0159
G1 X195.106 Y54.376 E.86408
G1 X195.639 Y54.376 E.0159
G1 X175.138 Y33.874 E.86408
G1 X175.672 Y33.874 E.0159
G1 X196.173 Y54.376 E.86408
G1 X196.706 Y54.376 E.0159
G1 X176.205 Y33.874 E.86408
G1 X176.739 Y33.874 E.0159
G1 X197.24 Y54.376 E.86408
G1 X197.774 Y54.376 E.0159
G1 X177.272 Y33.874 E.86408
G1 X177.806 Y33.874 E.0159
G1 X198.307 Y54.376 E.86408
G1 X198.841 Y54.376 E.0159
G1 X178.34 Y33.874 E.86408
G1 X178.873 Y33.874 E.0159
G1 X199.374 Y54.376 E.86408
G1 X199.908 Y54.376 E.0159
G1 X179.407 Y33.874 E.86408
G1 X179.94 Y33.874 E.0159
G1 X200.441 Y54.376 E.86408
G1 X200.975 Y54.376 E.0159
G1 X180.474 Y33.874 E.86408
G1 X181.007 Y33.874 E.0159
G1 X201.509 Y54.376 E.86408
G1 X202.042 Y54.376 E.0159
G1 X181.541 Y33.874 E.86408
G1 X182.075 Y33.874 E.0159
G1 X202.576 Y54.376 E.86408
G1 X203.109 Y54.376 E.0159
G1 X182.608 Y33.874 E.86408
G1 X183.142 Y33.874 E.0159
G1 X203.643 Y54.376 E.86408
G1 X204.176 Y54.376 E.0159
G1 X183.675 Y33.874 E.86408
G1 X184.209 Y33.874 E.0159
G1 X204.71 Y54.376 E.86408
G1 X205.243 Y54.376 E.0159
G1 X184.742 Y33.874 E.86408
G1 X185.276 Y33.874 E.0159
G1 X226.251 Y74.849 E1.727
G1 X226.251 Y74.315 E.0159
G1 X185.81 Y33.874 E1.70451
G1 X186.343 Y33.874 E.0159
G1 X226.251 Y73.782 E1.68202
G1 X226.251 Y73.248 E.0159
G1 X186.877 Y33.874 E1.65953
G1 X187.41 Y33.874 E.0159
G1 X226.251 Y72.715 E1.63704
G1 X226.251 Y72.181 E.0159
G1 X187.944 Y33.874 E1.61456
G1 X188.477 Y33.874 E.0159
G1 X226.251 Y71.648 E1.59207
G1 X226.251 Y71.114 E.0159
G1 X189.011 Y33.874 E1.56958
G1 X189.545 Y33.874 E.0159
G1 X226.251 Y70.58 E1.54709
G1 X226.251 Y70.047 E.0159
G1 X190.078 Y33.874 E1.5246
G1 X190.612 Y33.874 E.0159
G1 X226.251 Y69.513 E1.50211
G1 X226.251 Y68.98 E.0159
G1 X191.145 Y33.874 E1.47962
G1 X191.679 Y33.874 E.0159
G1 X226.251 Y68.446 E1.45713
G1 X226.251 Y67.913 E.0159
G1 X192.212 Y33.874 E1.43464
G1 X192.746 Y33.874 E.0159
G1 X226.251 Y67.379 E1.41216
G1 X226.251 Y66.845 E.0159
G1 X193.279 Y33.874 E1.38967
G1 X193.813 Y33.874 E.0159
G1 X226.251 Y66.312 E1.36718
G1 X226.251 Y65.778 E.0159
G1 X194.347 Y33.874 E1.34469
G1 X194.88 Y33.874 E.0159
G1 X226.251 Y65.245 E1.3222
G1 X226.251 Y64.711 E.0159
G1 X195.414 Y33.874 E1.29971
G1 X195.947 Y33.874 E.0159
G1 X226.251 Y64.178 E1.27722
G1 X226.251 Y63.644 E.0159
G1 X196.481 Y33.874 E1.25473
G1 X197.014 Y33.874 E.0159
G1 X226.251 Y63.111 E1.23224
G1 X226.251 Y62.577 E.0159
G1 X197.548 Y33.874 E1.20976
G1 X198.082 Y33.874 E.0159
G1 X226.251 Y62.043 E1.18727
G1 X226.251 Y61.51 E.0159
G1 X198.615 Y33.874 E1.16478
G1 X199.149 Y33.874 E.0159
G1 X226.251 Y60.976 E1.14229
G1 X226.251 Y60.443 E.0159
G1 X199.682 Y33.874 E1.1198
G1 X200.216 Y33.874 E.0159
G1 X226.42 Y60.079 E1.10446
G1 X226.42 Y49.941 F30000
G1 F9541.731
M73 P82 R13
G1 X219.3 Y42.821 E.30009
G3 X219.502 Y43.556 I-3.419 J1.331 E.02275
G1 X226.251 Y50.305 E.28446
G1 X226.251 Y50.838 E.0159
G1 X219.551 Y44.139 E.28237
G3 X219.511 Y44.632 I-2.489 J.046 E.01478
G1 X226.251 Y51.372 E.28407
G1 X226.251 Y51.906 E.0159
G1 X219.419 Y45.074 E.28794
G3 X219.284 Y45.473 I-2.063 J-.473 E.01257
G1 X226.251 Y52.439 E.29361
G1 X226.251 Y52.973 E.0159
G1 X219.112 Y45.835 E.30086
G3 X218.907 Y46.162 I-1.742 J-.865 E.01155
G1 X226.251 Y53.506 E.30953
G1 X226.251 Y54.04 E.0159
G1 X218.672 Y46.461 E.31944
G3 X218.408 Y46.731 I-1.481 J-1.182 E.01126
G1 X226.251 Y54.573 E.33055
G1 X226.251 Y55.107 E.0159
G1 X218.116 Y46.972 E.34285
G3 X217.795 Y47.185 I-1.222 J-1.5 E.0115
G1 X226.251 Y55.641 E.3564
G1 X226.251 Y56.174 E.0159
G1 X217.442 Y47.366 E.37125
G3 X217.055 Y47.513 I-.928 J-1.863 E.01235
G1 X226.251 Y56.708 E.38756
G1 X226.251 Y57.241 E.0159
G1 X216.629 Y47.62 E.40552
G3 X216.145 Y47.67 I-.771 J-5.111 E.0145
G1 X226.251 Y57.775 E.42591
G1 X226.251 Y58.308 E.0159
G1 X215.594 Y47.652 E.44916
G3 X214.913 Y47.504 I.578 J-4.31 E.0208
G1 X226.251 Y58.842 E.47788
G1 X226.251 Y59.376 E.0159
G1 X200.749 Y33.874 E1.07482
G1 X201.283 Y33.874 E.0159
G1 X212.624 Y45.216 E.47801
G3 X212.476 Y44.534 I3.461 J-1.11 E.02083
G1 X201.817 Y33.874 E.44927
G1 X202.35 Y33.874 E.0159
G1 X212.453 Y43.977 E.42581
G3 X212.508 Y43.498 I4.814 J.31 E.01437
G1 X202.884 Y33.874 E.40563
G1 X203.417 Y33.874 E.0159
G1 X212.613 Y43.07 E.38759
G3 X212.759 Y42.682 I2.014 J.534 E.01237
G1 X203.951 Y33.874 E.37123
G1 X204.484 Y33.874 E.0159
G1 X212.939 Y42.329 E.35634
G3 X213.151 Y42.007 I1.711 J.896 E.0115
G1 X205.018 Y33.874 E.34278
G1 X205.552 Y33.874 E.0159
G1 X213.392 Y41.715 E.33045
G3 X213.663 Y41.452 I10.964 J11.027 E.01125
G1 X206.085 Y33.874 E.31938
G1 X206.619 Y33.874 E.0159
G1 X213.962 Y41.218 E.30952
G3 X214.292 Y41.014 I1.184 J1.546 E.01157
G1 X207.152 Y33.874 E.30093
G1 X207.686 Y33.874 E.0159
G1 X214.654 Y40.843 E.29369
G3 X215.052 Y40.707 I.877 J1.918 E.01255
G1 X208.219 Y33.874 E.28797
G1 X208.753 Y33.874 E.0159
G1 X215.491 Y40.613 E.28401
G3 X215.995 Y40.582 I.439 J3.092 E.01504
G1 X209.287 Y33.874 E.28273
G1 X209.82 Y33.874 E.0159
G1 X216.567 Y40.621 E.28436
G3 X217.298 Y40.819 I-.749 J4.215 E.0226
G1 X210.354 Y33.874 E.29268
G1 X210.887 Y33.874 E.0159
G1 X226.251 Y49.238 E.64753
G1 X226.251 Y48.704 E.0159
G1 X211.421 Y33.874 E.62504
G1 X211.954 Y33.874 E.0159
G1 X226.251 Y48.171 E.60256
G1 X226.251 Y47.637 E.0159
G1 X212.488 Y33.874 E.58007
G1 X213.022 Y33.874 E.0159
G1 X226.251 Y47.103 E.55758
G1 X226.251 Y46.57 E.0159
G1 X213.555 Y33.874 E.53509
G1 X214.089 Y33.874 E.0159
G1 X226.251 Y46.036 E.5126
G1 X226.251 Y45.503 E.0159
G1 X214.622 Y33.874 E.49011
G1 X215.156 Y33.874 E.0159
G1 X226.251 Y44.969 E.46762
G1 X226.251 Y44.436 E.0159
G1 X215.689 Y33.874 E.44513
G1 X216.223 Y33.874 E.0159
G1 X226.251 Y43.902 E.42264
G1 X226.251 Y43.368 E.0159
G1 X216.757 Y33.874 E.40016
G1 X217.29 Y33.874 E.0159
G1 X226.251 Y42.835 E.37767
G1 X226.251 Y42.301 E.0159
G1 X217.824 Y33.874 E.35518
G1 X218.357 Y33.874 E.0159
G1 X226.251 Y41.768 E.33269
G1 X226.251 Y41.234 E.0159
G1 X218.891 Y33.874 E.3102
G1 X219.424 Y33.874 E.0159
G1 X226.251 Y40.701 E.28771
G1 X226.251 Y40.167 E.0159
G1 X219.958 Y33.874 E.26522
G1 X220.492 Y33.874 E.0159
G1 X226.251 Y39.633 E.24273
G1 X226.251 Y39.1 E.0159
G1 X221.025 Y33.874 E.22024
G1 X221.559 Y33.874 E.0159
G1 X226.251 Y38.566 E.19775
G1 X226.251 Y38.033 E.0159
G1 X222.092 Y33.874 E.17527
G1 X222.626 Y33.874 E.0159
G1 X226.251 Y37.499 E.15278
G1 X226.251 Y36.966 E.0159
G1 X223.159 Y33.874 E.13029
G1 X223.693 Y33.874 E.0159
G1 X226.251 Y36.432 E.1078
G1 X226.251 Y35.899 E.0159
G1 X224.226 Y33.874 E.08531
G1 X224.76 Y33.874 E.0159
G1 X226.251 Y35.365 E.06282
G1 X226.251 Y34.831 E.0159
G1 X225.294 Y33.874 E.04033
G1 X225.827 Y33.874 E.0159
G1 X226.42 Y34.467 E.025
G1 X226.42 Y75.552 F30000
G1 F9541.731
G1 X205.749 Y54.882 E.87123
G1 X205.749 Y55.415 E.0159
G1 X226.251 Y75.916 E.86408
G1 X226.251 Y76.45 E.0159
G1 X205.749 Y55.949 E.86408
G1 X205.749 Y56.482 E.0159
G1 X226.251 Y76.983 E.86408
G1 X226.251 Y77.517 E.0159
G1 X205.749 Y57.016 E.86408
G1 X205.749 Y57.549 E.0159
G1 X226.251 Y78.05 E.86408
G1 X226.251 Y78.584 E.0159
G1 X205.749 Y58.083 E.86408
G1 X205.749 Y58.617 E.0159
G1 X226.251 Y79.118 E.86408
G1 X226.251 Y79.651 E.0159
G1 X205.749 Y59.15 E.86408
G1 X205.749 Y59.684 E.0159
G1 X226.251 Y80.185 E.86408
G1 X226.251 Y80.718 E.0159
G1 X205.749 Y60.217 E.86408
G1 X205.749 Y60.751 E.0159
G1 X226.251 Y81.252 E.86408
G1 X226.251 Y81.785 E.0159
G1 X205.749 Y61.284 E.86408
G1 X205.749 Y61.818 E.0159
G1 X226.251 Y82.319 E.86408
G1 X226.251 Y82.853 E.0159
G1 X205.749 Y62.351 E.86408
G1 X205.749 Y62.885 E.0159
G1 X226.251 Y83.386 E.86408
G1 X226.251 Y83.92 E.0159
G1 X205.749 Y63.419 E.86408
G1 X205.749 Y63.952 E.0159
G1 X226.251 Y84.453 E.86408
G1 X226.251 Y84.987 E.0159
G1 X205.749 Y64.486 E.86408
G1 X205.749 Y65.019 E.0159
G1 X226.251 Y85.52 E.86408
G1 X226.251 Y86.054 E.0159
G1 X205.749 Y65.553 E.86408
G1 X205.749 Y66.086 E.0159
G1 X226.251 Y86.588 E.86408
G1 X226.251 Y87.121 E.0159
G1 X205.749 Y66.62 E.86408
G1 X205.749 Y67.154 E.0159
G1 X226.251 Y87.655 E.86408
G1 X226.251 Y88.188 E.0159
G1 X205.749 Y67.687 E.86408
G1 X205.749 Y68.221 E.0159
G1 X226.251 Y88.722 E.86408
G1 X226.251 Y89.255 E.0159
G1 X205.749 Y68.754 E.86408
G1 X205.749 Y69.288 E.0159
G1 X226.251 Y89.789 E.86408
G1 X226.251 Y90.323 E.0159
G1 X205.749 Y69.821 E.86408
G1 X205.749 Y70.355 E.0159
G1 X226.251 Y90.856 E.86408
G1 X226.251 Y91.39 E.0159
G1 X205.749 Y70.889 E.86408
G1 X205.749 Y71.422 E.0159
G1 X226.251 Y91.923 E.86408
G1 X226.251 Y92.457 E.0159
G1 X205.749 Y71.956 E.86408
G1 X205.749 Y72.489 E.0159
G1 X226.251 Y92.99 E.86408
G1 X226.251 Y93.524 E.0159
G1 X205.749 Y73.023 E.86408
G1 X205.749 Y73.556 E.0159
G1 X226.251 Y94.058 E.86408
G1 X226.251 Y94.591 E.0159
G1 X205.749 Y74.09 E.86408
G1 X205.749 Y74.624 E.0159
G1 X226.251 Y95.125 E.86408
G1 X226.251 Y95.658 E.0159
G1 X205.749 Y75.157 E.86408
G1 X205.749 Y75.691 E.0159
G1 X226.251 Y96.192 E.86408
G1 X226.251 Y96.725 E.0159
G1 X205.749 Y76.224 E.86408
G1 X205.749 Y76.758 E.0159
G1 X226.251 Y97.259 E.86408
G1 X226.251 Y97.792 E.0159
G1 X205.749 Y77.291 E.86408
G1 X205.749 Y77.825 E.0159
G1 X226.251 Y98.326 E.86408
G1 X226.251 Y98.86 E.0159
G1 X205.749 Y78.359 E.86408
G1 X205.749 Y78.892 E.0159
G1 X226.251 Y99.393 E.86408
G1 X226.251 Y99.927 E.0159
G1 X205.749 Y79.426 E.86408
G1 X205.749 Y79.959 E.0159
G1 X226.251 Y100.46 E.86408
G1 X226.251 Y100.994 E.0159
G1 X205.749 Y80.493 E.86408
G1 X205.749 Y81.026 E.0159
G1 X226.251 Y101.527 E.86408
G1 X226.251 Y102.061 E.0159
G1 X205.749 Y81.56 E.86408
G1 X205.749 Y82.094 E.0159
G1 X226.251 Y102.595 E.86408
G1 X226.251 Y103.128 E.0159
G1 X205.749 Y82.627 E.86408
G1 X205.749 Y83.161 E.0159
G1 X226.251 Y103.662 E.86408
G1 X226.251 Y104.195 E.0159
G1 X205.749 Y83.694 E.86408
G1 X205.749 Y84.228 E.0159
G1 X226.251 Y104.729 E.86408
G1 X226.251 Y105.262 E.0159
G1 X205.749 Y84.761 E.86408
G1 X205.749 Y85.295 E.0159
G1 X226.251 Y105.796 E.86408
G1 X226.251 Y106.33 E.0159
G1 X205.749 Y85.829 E.86408
G1 X205.749 Y86.362 E.0159
G1 X226.251 Y106.863 E.86408
G1 X226.251 Y107.397 E.0159
G1 X205.749 Y86.896 E.86408
G1 X205.749 Y87.429 E.0159
G1 X226.251 Y107.93 E.86408
G1 X226.251 Y108.464 E.0159
G1 X205.749 Y87.963 E.86408
G1 X205.749 Y88.496 E.0159
G1 X226.251 Y108.997 E.86408
G1 X226.251 Y109.531 E.0159
G1 X205.749 Y89.03 E.86408
G1 X205.749 Y89.563 E.0159
G1 X226.251 Y110.065 E.86408
G1 X226.251 Y110.598 E.0159
G1 X205.749 Y90.097 E.86408
G1 X205.749 Y90.631 E.0159
G1 X226.251 Y111.132 E.86408
G1 X226.251 Y111.665 E.0159
G1 X205.749 Y91.164 E.86408
G1 X205.749 Y91.698 E.0159
G1 X226.251 Y112.199 E.86408
G1 X226.251 Y112.732 E.0159
G1 X205.749 Y92.231 E.86408
G1 X205.749 Y92.765 E.0159
G1 X226.251 Y113.266 E.86408
G1 X226.251 Y113.8 E.0159
G1 X205.749 Y93.298 E.86408
G1 X205.749 Y93.832 E.0159
G1 X226.251 Y114.333 E.86408
G1 X226.251 Y114.867 E.0159
G1 X205.749 Y94.366 E.86408
G1 X205.749 Y94.899 E.0159
G1 X226.251 Y115.4 E.86408
G1 X226.251 Y115.934 E.0159
G1 X205.749 Y95.433 E.86408
G1 X205.749 Y95.966 E.0159
G1 X226.251 Y116.467 E.86408
G1 X226.251 Y117.001 E.0159
G1 X205.749 Y96.5 E.86408
G1 X205.749 Y97.033 E.0159
G1 X226.251 Y117.535 E.86408
G1 X226.251 Y118.068 E.0159
G1 X205.749 Y97.567 E.86408
G1 X205.749 Y98.101 E.0159
G1 X226.251 Y118.602 E.86408
G1 X226.251 Y119.135 E.0159
G1 X205.749 Y98.634 E.86408
G1 X205.749 Y99.168 E.0159
G1 X226.251 Y119.669 E.86408
G1 X226.251 Y120.202 E.0159
G1 X205.749 Y99.701 E.86408
G1 X205.749 Y100.235 E.0159
G1 X226.251 Y120.736 E.86408
G1 X226.251 Y121.27 E.0159
G1 X205.749 Y100.768 E.86408
G1 X205.749 Y101.302 E.0159
G1 X226.251 Y121.803 E.86408
G1 X226.251 Y122.337 E.0159
G1 X205.749 Y101.836 E.86408
G1 X205.749 Y102.369 E.0159
G1 X226.251 Y122.87 E.86408
G1 X226.251 Y123.404 E.0159
G1 X205.749 Y102.903 E.86408
G1 X205.749 Y103.436 E.0159
G1 X226.251 Y123.937 E.86408
G1 X226.251 Y124.471 E.0159
G1 X205.749 Y103.97 E.86408
G1 X205.749 Y104.503 E.0159
G1 X226.251 Y125.004 E.86408
G1 X226.251 Y125.538 E.0159
G1 X205.749 Y105.037 E.86408
G1 X205.749 Y105.571 E.0159
G1 X226.251 Y126.072 E.86408
G1 X226.251 Y126.605 E.0159
G1 X205.749 Y106.104 E.86408
G1 X205.749 Y106.638 E.0159
G1 X226.251 Y127.139 E.86408
G1 X226.251 Y127.672 E.0159
G1 X205.749 Y107.171 E.86408
G1 X205.749 Y107.705 E.0159
G1 X226.251 Y128.206 E.86408
G1 X226.251 Y128.739 E.0159
G1 X205.749 Y108.238 E.86408
G1 X205.749 Y108.772 E.0159
G1 X226.251 Y129.273 E.86408
G1 X226.251 Y129.807 E.0159
G1 X205.749 Y109.306 E.86408
G1 X205.749 Y109.839 E.0159
G1 X226.251 Y130.34 E.86408
G1 X226.251 Y130.874 E.0159
G1 X205.749 Y110.373 E.86408
G1 X205.749 Y110.906 E.0159
G1 X226.251 Y131.407 E.86408
G1 X226.251 Y131.941 E.0159
G1 X219.439 Y125.129 E.28711
G3 X219.54 Y125.764 I-3.511 J.885 E.01918
G1 X226.251 Y132.474 E.28284
G1 X226.251 Y133.008 E.0159
G1 X219.537 Y126.294 E.28297
G3 X219.467 Y126.758 I-4.772 J-.478 E.01399
G1 X226.251 Y133.542 E.2859
G1 X226.251 Y134.075 E.0159
G1 X219.348 Y127.173 E.29093
G3 X219.191 Y127.549 I-1.962 J-.597 E.01218
G1 X226.251 Y134.609 E.29754
G1 X226.251 Y135.142 E.0159
G1 X219.001 Y127.892 E.30557
G3 X218.78 Y128.205 I-1.675 J-.95 E.01143
G1 X226.251 Y135.676 E.31488
G1 X226.251 Y136.209 E.0159
G1 X218.53 Y128.489 E.32541
G3 X218.252 Y128.744 I-1.414 J-1.262 E.01127
G1 X226.251 Y136.743 E.33714
G1 X226.251 Y137.277 E.0159
G1 X217.945 Y128.971 E.35008
G3 X217.607 Y129.167 I-5.45 J-9.012 E.01164
G1 X226.251 Y137.81 E.36431
G1 X226.251 Y138.344 E.0159
G1 X217.234 Y129.327 E.38002
G3 X216.824 Y129.45 I-.82 J-1.989 E.01279
G1 X226.251 Y138.877 E.39732
G1 X226.251 Y139.411 E.0159
G1 X216.369 Y129.529 E.41651
G3 X215.852 Y129.546 I-.398 J-4.154 E.0154
G1 X226.251 Y139.944 E.43827
G1 X226.251 Y140.478 E.0159
G1 X215.241 Y129.468 E.46405
G3 X214.41 Y129.171 I.529 J-2.79 E.02639
G1 X226.251 Y141.012 E.49905
G1 X226.251 Y141.545 E.0159
G1 X205.749 Y121.044 E.86408
G1 X205.749 Y120.51 E.0159
G1 X212.824 Y127.585 E.29818
G3 X212.535 Y126.763 I2.41 J-1.309 E.02609
G1 X205.749 Y119.977 E.28601
G1 X205.749 Y119.443 E.0159
G1 X212.453 Y126.147 E.28253
G3 X212.472 Y125.632 I2.581 J-.162 E.01537
G1 X205.749 Y118.91 E.28334
G1 X205.749 Y118.376 E.0159
G1 X212.548 Y125.175 E.28654
G3 X212.671 Y124.764 I6.096 J1.611 E.01277
G1 X205.749 Y117.843 E.29174
G1 X205.749 Y117.309 E.0159
G1 X212.835 Y124.395 E.29865
G3 X213.031 Y124.057 I1.785 J.813 E.01165
G1 X205.749 Y116.775 E.30691
G1 X205.749 Y116.242 E.0159
G1 X213.257 Y123.75 E.31645
G3 X213.512 Y123.471 I1.519 J1.133 E.01127
G1 X205.749 Y115.708 E.32719
G1 X205.749 Y115.175 E.0159
G1 X213.796 Y123.221 E.33913
G3 X214.108 Y122.999 I1.259 J1.444 E.01142
G1 X205.749 Y114.641 E.35228
G1 X205.749 Y114.108 E.0159
G1 X214.45 Y122.808 E.36672
G3 X214.826 Y122.65 I.978 J1.799 E.01216
G1 X205.749 Y113.574 E.38254
G1 X205.749 Y113.041 E.0159
G1 X215.241 Y122.532 E.40004
G3 X215.707 Y122.465 I.568 J2.293 E.01407
G1 X205.749 Y112.507 E.4197
G1 X205.749 Y111.973 E.0159
G1 X216.234 Y122.458 E.4419
G3 X216.87 Y122.56 I-.358 J4.254 E.01921
G1 X205.58 Y111.27 E.47585
; WIPE_START
G1 X206.994 Y112.684 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X211.185 Y119.063 Z3 F30000
G1 X226.42 Y142.248 Z3
G1 Z2.6
G1 E.8 F1800
G1 F9541.731
G1 X205.749 Y121.578 E.87123
G1 X205.749 Y122.111 E.0159
G1 X226.251 Y142.612 E.86408
G1 X226.251 Y143.146 E.0159
G1 X205.749 Y122.645 E.86408
G1 X205.749 Y123.178 E.0159
G1 X226.251 Y143.679 E.86408
G1 X226.251 Y144.213 E.0159
G1 X205.749 Y123.712 E.86408
G1 X205.749 Y124.245 E.0159
G1 X226.251 Y144.747 E.86408
G1 X226.251 Y145.28 E.0159
G1 X205.749 Y124.779 E.86408
G1 X205.749 Y125.313 E.0159
G1 X226.251 Y145.814 E.86408
G1 X226.251 Y146.347 E.0159
G1 X205.749 Y125.846 E.86408
G1 X205.749 Y126.38 E.0159
G1 X226.251 Y146.881 E.86408
G1 X226.251 Y147.414 E.0159
G1 X205.749 Y126.913 E.86408
G1 X205.749 Y127.447 E.0159
G1 X226.251 Y147.948 E.86408
G1 X226.251 Y148.482 E.0159
G1 X205.749 Y127.98 E.86408
G1 X205.749 Y128.514 E.0159
G1 X226.251 Y149.015 E.86408
G1 X226.251 Y149.549 E.0159
G1 X205.749 Y129.048 E.86408
G1 X205.749 Y129.581 E.0159
G1 X226.251 Y150.082 E.86408
G1 X226.251 Y150.616 E.0159
G1 X205.749 Y130.115 E.86408
G1 X205.749 Y130.648 E.0159
G1 X226.251 Y151.149 E.86408
G1 X226.251 Y151.683 E.0159
G1 X205.749 Y131.182 E.86408
G1 X205.749 Y131.715 E.0159
G1 X226.251 Y152.216 E.86408
G1 X226.251 Y152.75 E.0159
G1 X205.749 Y132.249 E.86408
G1 X205.749 Y132.783 E.0159
G1 X226.251 Y153.284 E.86408
G1 X226.251 Y153.817 E.0159
G1 X205.749 Y133.316 E.86408
G1 X205.749 Y133.85 E.0159
G1 X226.251 Y154.351 E.86408
G1 X226.251 Y154.884 E.0159
G1 X205.749 Y134.383 E.86408
G1 X205.749 Y134.917 E.0159
G1 X226.251 Y155.418 E.86408
G1 X226.251 Y155.951 E.0159
G1 X205.749 Y135.45 E.86408
G1 X205.749 Y135.984 E.0159
G1 X226.251 Y156.485 E.86408
G1 X226.251 Y157.019 E.0159
G1 X205.749 Y136.518 E.86408
G1 X205.749 Y137.051 E.0159
G1 X226.251 Y157.552 E.86408
G1 X226.251 Y158.086 E.0159
G1 X205.749 Y137.585 E.86408
G1 X205.749 Y138.118 E.0159
G1 X226.251 Y158.619 E.86408
G1 X226.251 Y159.153 E.0159
G1 X205.749 Y138.652 E.86408
G1 X205.749 Y139.185 E.0159
G1 X226.251 Y159.686 E.86408
G1 X226.251 Y160.22 E.0159
G1 X205.749 Y139.719 E.86408
G1 X205.749 Y140.253 E.0159
G1 X226.251 Y160.754 E.86408
G1 X226.251 Y161.287 E.0159
G1 X205.749 Y140.786 E.86408
G1 X205.749 Y141.32 E.0159
G1 X226.251 Y161.821 E.86408
G1 X226.251 Y162.354 E.0159
G1 X205.749 Y141.853 E.86408
G1 X205.749 Y142.387 E.0159
G1 X226.251 Y162.888 E.86408
G1 X226.251 Y163.421 E.0159
G1 X205.749 Y142.92 E.86408
G1 X205.749 Y143.454 E.0159
G1 X226.251 Y163.955 E.86408
G1 X226.251 Y164.489 E.0159
G1 X205.749 Y143.987 E.86408
G1 X205.749 Y144.521 E.0159
G1 X226.251 Y165.022 E.86408
G1 X226.251 Y165.556 E.0159
G1 X205.749 Y145.055 E.86408
G1 X205.749 Y145.588 E.0159
G1 X226.251 Y166.089 E.86408
G1 X226.251 Y166.623 E.0159
G1 X205.749 Y146.122 E.86408
G1 X205.749 Y146.655 E.0159
G1 X226.251 Y167.156 E.86408
G1 X226.251 Y167.69 E.0159
G1 X205.749 Y147.189 E.86408
G1 X205.749 Y147.722 E.0159
G1 X226.251 Y168.224 E.86408
G1 X226.251 Y168.757 E.0159
G1 X205.749 Y148.256 E.86408
M73 P83 R13
G1 X205.749 Y148.79 E.0159
G1 X226.251 Y169.291 E.86408
G1 X226.251 Y169.824 E.0159
G1 X205.749 Y149.323 E.86408
G1 X205.749 Y149.857 E.0159
G1 X226.251 Y170.358 E.86408
G1 X226.251 Y170.891 E.0159
G1 X205.749 Y150.39 E.86408
G1 X205.749 Y150.924 E.0159
G1 X226.251 Y171.425 E.86408
G1 X226.251 Y171.959 E.0159
G1 X205.749 Y151.457 E.86408
G1 X205.749 Y151.991 E.0159
G1 X226.251 Y172.492 E.86408
G1 X226.251 Y173.026 E.0159
G1 X205.749 Y152.525 E.86408
G1 X205.749 Y153.058 E.0159
G1 X226.251 Y173.559 E.86408
G1 X226.251 Y174.093 E.0159
G1 X205.749 Y153.592 E.86408
M73 P83 R12
G1 X205.749 Y154.125 E.0159
G1 X226.251 Y174.626 E.86408
G1 X226.251 Y175.16 E.0159
G1 X205.749 Y154.659 E.86408
G1 X205.749 Y155.192 E.0159
G1 X226.251 Y175.694 E.86408
G1 X226.251 Y176.227 E.0159
G1 X205.749 Y155.726 E.86408
G1 X205.749 Y156.26 E.0159
G1 X226.251 Y176.761 E.86408
G1 X226.251 Y177.294 E.0159
G1 X205.749 Y156.793 E.86408
G1 X205.749 Y157.327 E.0159
G1 X226.251 Y177.828 E.86408
G1 X226.251 Y178.361 E.0159
G1 X205.749 Y157.86 E.86408
G1 X205.749 Y158.394 E.0159
G1 X226.251 Y178.895 E.86408
G1 X226.251 Y179.428 E.0159
G1 X205.749 Y158.927 E.86408
G1 X205.749 Y159.461 E.0159
G1 X226.251 Y179.962 E.86408
G1 X226.251 Y180.496 E.0159
G1 X205.749 Y159.995 E.86408
G1 X205.749 Y160.528 E.0159
G1 X226.251 Y181.029 E.86408
G1 X226.251 Y181.563 E.0159
G1 X205.749 Y161.062 E.86408
G1 X205.749 Y161.595 E.0159
G1 X226.251 Y182.096 E.86408
G1 X226.251 Y182.63 E.0159
G1 X205.749 Y162.129 E.86408
G1 X205.749 Y162.662 E.0159
G1 X226.251 Y183.163 E.86408
G1 X226.251 Y183.697 E.0159
G1 X205.749 Y163.196 E.86408
G1 X205.749 Y163.73 E.0159
G1 X226.251 Y184.231 E.86408
G1 X226.251 Y184.764 E.0159
G1 X205.749 Y164.263 E.86408
G1 X205.749 Y164.797 E.0159
G1 X226.251 Y185.298 E.86408
G1 X226.251 Y185.831 E.0159
G1 X205.749 Y165.33 E.86408
G1 X205.749 Y165.864 E.0159
G1 X226.251 Y186.365 E.86408
G1 X226.251 Y186.898 E.0159
G1 X205.749 Y166.397 E.86408
G1 X205.749 Y166.931 E.0159
G1 X226.251 Y187.432 E.86408
G1 X226.251 Y187.966 E.0159
G1 X205.749 Y167.465 E.86408
G1 X205.749 Y167.998 E.0159
G1 X226.251 Y188.499 E.86408
G1 X226.251 Y189.033 E.0159
G1 X205.749 Y168.532 E.86408
G1 X205.749 Y169.065 E.0159
G1 X226.251 Y189.566 E.86408
G1 X226.251 Y190.1 E.0159
G1 X205.749 Y169.599 E.86408
G1 X205.749 Y170.132 E.0159
G1 X226.251 Y190.633 E.86408
G1 X226.251 Y191.167 E.0159
G1 X205.749 Y170.666 E.86408
G1 X205.749 Y171.199 E.0159
G1 X226.251 Y191.701 E.86408
G1 X226.251 Y192.234 E.0159
G1 X205.749 Y171.733 E.86408
G1 X205.749 Y172.267 E.0159
G1 X226.251 Y192.768 E.86408
G1 X226.251 Y193.301 E.0159
G1 X205.749 Y172.8 E.86408
G1 X205.749 Y173.334 E.0159
G1 X226.251 Y193.835 E.86408
G1 X226.251 Y194.368 E.0159
G1 X205.749 Y173.867 E.86408
G1 X205.749 Y174.401 E.0159
G1 X226.251 Y194.902 E.86408
G1 X226.251 Y195.436 E.0159
G1 X205.749 Y174.934 E.86408
G1 X205.749 Y175.468 E.0159
G1 X226.251 Y195.969 E.86408
G1 X226.251 Y196.503 E.0159
G1 X205.749 Y176.002 E.86408
G1 X205.749 Y176.535 E.0159
G1 X226.251 Y197.036 E.86408
G1 X226.251 Y197.57 E.0159
G1 X205.749 Y177.069 E.86408
G1 X205.749 Y177.602 E.0159
G1 X226.251 Y198.103 E.86408
G1 X226.251 Y198.637 E.0159
G1 X205.749 Y178.136 E.86408
G1 X205.749 Y178.669 E.0159
G1 X226.251 Y199.171 E.86408
G1 X226.251 Y199.704 E.0159
G1 X205.749 Y179.203 E.86408
G1 X205.749 Y179.737 E.0159
G1 X226.251 Y200.238 E.86408
G1 X226.251 Y200.771 E.0159
G1 X205.749 Y180.27 E.86408
G1 X205.749 Y180.804 E.0159
G1 X226.251 Y201.305 E.86408
G1 X226.251 Y201.838 E.0159
G1 X205.749 Y181.337 E.86408
G1 X205.749 Y181.871 E.0159
G1 X226.251 Y202.372 E.86408
G1 X226.251 Y202.906 E.0159
G1 X205.749 Y182.404 E.86408
G1 X205.749 Y182.938 E.0159
G1 X226.251 Y203.439 E.86408
G1 X226.251 Y203.973 E.0159
G1 X205.749 Y183.472 E.86408
G1 X205.749 Y184.005 E.0159
G1 X226.251 Y204.506 E.86408
G1 X226.251 Y205.04 E.0159
G1 X205.749 Y184.539 E.86408
G1 X205.749 Y185.072 E.0159
G1 X226.251 Y205.573 E.86408
G1 X226.251 Y206.107 E.0159
G1 X205.749 Y185.606 E.86408
G1 X205.749 Y186.139 E.0159
G1 X226.251 Y206.64 E.86408
G1 X226.251 Y207.174 E.0159
G1 X205.749 Y186.673 E.86408
G1 X205.749 Y187.207 E.0159
G1 X226.251 Y207.708 E.86408
G1 X226.251 Y208.241 E.0159
G1 X205.749 Y187.74 E.86408
G1 X205.749 Y188.274 E.0159
G1 X226.251 Y208.775 E.86408
G1 X226.251 Y209.308 E.0159
G1 X205.749 Y188.807 E.86408
G1 X205.749 Y189.341 E.0159
G1 X226.251 Y209.842 E.86408
G1 X226.251 Y210.375 E.0159
G1 X205.749 Y189.874 E.86408
G1 X205.749 Y190.408 E.0159
G1 X226.251 Y210.909 E.86408
G1 X226.251 Y211.443 E.0159
G1 X205.749 Y190.942 E.86408
G1 X205.749 Y191.475 E.0159
G1 X226.251 Y211.976 E.86408
G1 X226.251 Y212.51 E.0159
G1 X205.749 Y192.009 E.86408
G1 X205.749 Y192.542 E.0159
G1 X226.251 Y213.043 E.86408
G1 X226.251 Y213.577 E.0159
G1 X219.332 Y206.658 E.2916
G3 X219.511 Y207.371 I-3.336 J1.218 E.02195
G1 X226.251 Y214.11 E.28404
G1 X226.251 Y214.644 E.0159
G1 X219.548 Y207.942 E.28249
G3 X219.504 Y208.431 I-2.465 J.021 E.01465
G1 X226.251 Y215.178 E.28437
G1 X226.251 Y215.711 E.0159
G1 X219.408 Y208.868 E.28842
G3 X219.269 Y209.263 I-6.982 J-2.233 E.01247
G1 X226.251 Y216.245 E.29427
G1 X226.251 Y216.778 E.0159
G1 X219.091 Y209.619 E.30175
G3 X218.883 Y209.944 I-1.729 J-.881 E.01153
G1 X226.251 Y217.312 E.31054
G1 X226.251 Y217.845 E.0159
G1 X218.645 Y210.24 E.32057
G3 X218.379 Y210.507 I-1.468 J-1.196 E.01126
G1 X225.997 Y218.126 E.32111
G1 X225.464 Y218.126 E.0159
G1 X218.084 Y210.746 E.31104
G3 X217.76 Y210.955 I-1.21 J-1.518 E.01152
G1 X224.93 Y218.126 E.30222
G1 X224.396 Y218.126 E.0159
G1 X217.404 Y211.133 E.29472
G3 X217.014 Y211.276 I-.913 J-1.882 E.01241
G1 X223.863 Y218.126 E.28867
G1 X223.329 Y218.126 E.0159
G1 X216.581 Y211.377 E.28443
G3 X216.091 Y211.421 I-.464 J-2.426 E.01468
G1 X222.796 Y218.126 E.28258
G1 X222.262 Y218.126 E.0159
G1 X215.531 Y211.394 E.28371
G3 X214.829 Y211.226 I.647 J-4.248 E.02153
G1 X221.729 Y218.126 E.2908
G1 X221.195 Y218.126 E.0159
G1 X200.694 Y197.624 E.86408
G1 X201.227 Y197.624 E.0159
G1 X212.649 Y209.046 E.4814
G3 X212.482 Y208.346 I3.875 J-1.293 E.02149
G1 X201.761 Y197.624 E.45187
G1 X202.295 Y197.624 E.0159
G1 X212.453 Y207.783 E.42815
G3 X212.498 Y207.295 I4.455 J.17 E.01461
G1 X202.828 Y197.624 E.40758
G1 X203.362 Y197.624 E.0159
G1 X212.6 Y206.863 E.38938
G3 X212.742 Y206.471 I2.024 J.513 E.01243
G1 X203.895 Y197.624 E.37288
G1 X204.429 Y197.624 E.0159
G1 X212.919 Y206.115 E.35786
G3 X213.128 Y205.79 I1.725 J.879 E.01153
G1 X204.962 Y197.624 E.34417
G1 X205.496 Y197.624 E.0159
G1 X213.367 Y205.495 E.33173
G3 X213.633 Y205.228 I1.47 J1.204 E.01126
G1 X205.749 Y197.344 E.33229
G1 X205.749 Y196.811 E.0159
G1 X213.929 Y204.99 E.34474
G3 X214.255 Y204.783 I1.198 J1.53 E.01154
G1 X205.749 Y196.277 E.35851
G1 X205.749 Y195.744 E.0159
G1 X214.614 Y204.608 E.37363
G3 X215.008 Y204.469 I.893 J1.902 E.01248
G1 X205.749 Y195.21 E.39025
G1 X205.749 Y194.677 E.0159
G1 X215.444 Y204.371 E.40861
G3 X215.939 Y204.332 I.468 J2.807 E.01481
G1 X205.749 Y194.143 E.42947
G1 X205.749 Y193.609 E.0159
G1 X216.503 Y204.363 E.45325
G3 X217.215 Y204.541 I-.539 J3.665 E.02189
G1 X205.58 Y192.906 E.49039
; WIPE_START
G1 X206.994 Y194.32 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X199.476 Y195.639 Z3 F30000
G1 X70.365 Y218.295 Z3
G1 Z2.6
G1 E.8 F1800
G1 F9541.731
G1 X29.749 Y177.68 E1.71186
G1 X29.749 Y178.214 E.0159
G1 X69.661 Y218.126 E1.68222
G1 X69.128 Y218.126 E.0159
G1 X29.749 Y178.747 E1.65973
G1 X29.749 Y179.281 E.0159
G1 X68.594 Y218.126 E1.63724
G1 X68.061 Y218.126 E.0159
G1 X29.749 Y179.814 E1.61475
G1 X29.749 Y180.348 E.0159
G1 X67.527 Y218.126 E1.59226
G1 X66.994 Y218.126 E.0159
G1 X29.749 Y180.881 E1.56977
G1 X29.749 Y181.415 E.0159
G1 X66.46 Y218.126 E1.54728
G1 X65.927 Y218.126 E.0159
G1 X29.749 Y181.948 E1.52479
G1 X29.749 Y182.482 E.0159
G1 X65.393 Y218.126 E1.5023
G1 X64.859 Y218.126 E.0159
G1 X29.749 Y183.016 E1.47982
G1 X29.749 Y183.549 E.0159
G1 X64.326 Y218.126 E1.45733
G1 X63.792 Y218.126 E.0159
G1 X29.749 Y184.083 E1.43484
G1 X29.749 Y184.616 E.0159
G1 X63.259 Y218.126 E1.41235
G1 X62.725 Y218.126 E.0159
G1 X29.749 Y185.15 E1.38986
G1 X29.749 Y185.683 E.0159
G1 X62.192 Y218.126 E1.36737
G1 X61.658 Y218.126 E.0159
G1 X29.749 Y186.217 E1.34488
G1 X29.749 Y186.751 E.0159
G1 X61.124 Y218.126 E1.32239
G1 X60.591 Y218.126 E.0159
G1 X29.749 Y187.284 E1.2999
G1 X29.749 Y187.818 E.0159
G1 X60.057 Y218.126 E1.27742
G1 X59.524 Y218.126 E.0159
G1 X29.749 Y188.351 E1.25493
G1 X29.749 Y188.885 E.0159
G1 X58.99 Y218.126 E1.23244
G1 X58.457 Y218.126 E.0159
G1 X29.749 Y189.418 E1.20995
G1 X29.749 Y189.952 E.0159
G1 X57.923 Y218.126 E1.18746
G1 X57.389 Y218.126 E.0159
G1 X29.749 Y190.486 E1.16497
G1 X29.749 Y191.019 E.0159
G1 X56.856 Y218.126 E1.14248
G1 X56.322 Y218.126 E.0159
G1 X29.749 Y191.553 E1.11999
G1 X29.749 Y192.086 E.0159
G1 X55.789 Y218.126 E1.0975
G1 X55.255 Y218.126 E.0159
G1 X29.749 Y192.62 E1.07502
G1 X29.749 Y193.153 E.0159
G1 X41.098 Y204.502 E.47831
G2 X40.414 Y204.352 I-1.104 J3.401 E.02088
G1 X29.749 Y193.687 E.44951
G1 X29.749 Y194.221 E.0159
G1 X39.861 Y204.332 E.42619
G2 X39.378 Y204.383 I.063 J2.949 E.0145
G1 X29.749 Y194.754 E.40583
G1 X29.749 Y195.288 E.0159
G1 X38.948 Y204.486 E.38769
G2 X38.558 Y204.63 I.527 J2.022 E.0124
G1 X29.749 Y195.821 E.37128
G1 X29.749 Y196.355 E.0159
G1 X38.206 Y204.811 E.35642
G2 X37.885 Y205.024 I.904 J1.706 E.01149
G1 X29.749 Y196.888 E.34291
G1 X29.749 Y197.422 E.0159
G1 X37.594 Y205.267 E.33063
G2 X37.331 Y205.537 I1.219 J1.448 E.01126
G1 X29.749 Y197.956 E.31955
G1 X29.749 Y198.489 E.0159
G1 X37.097 Y205.836 E.30967
G2 X36.892 Y206.165 I1.541 J1.187 E.01156
G1 X29.749 Y199.023 E.30104
G1 X29.749 Y199.556 E.0159
G1 X36.719 Y206.526 E.29376
G2 X36.582 Y206.922 I1.914 J.885 E.01252
G1 X29.749 Y200.09 E.28797
G1 X29.749 Y200.623 E.0159
G1 X36.487 Y207.36 E.28396
G2 X36.453 Y207.86 I2.481 J.419 E.01495
G1 X29.749 Y201.157 E.28253
G1 X29.749 Y201.691 E.0159
G1 X36.494 Y208.435 E.28428
G2 X36.697 Y209.172 I3.854 J-.666 E.0228
G1 X29.749 Y202.224 E.29283
G1 X29.749 Y202.758 E.0159
G1 X45.117 Y218.126 E.64773
G1 X45.651 Y218.126 E.0159
G1 X38.701 Y211.176 E.29291
G2 X39.436 Y211.378 I1.31 J-3.335 E.02276
G1 X46.184 Y218.126 E.28441
G1 X46.718 Y218.126 E.0159
G1 X40.015 Y211.423 E.2825
G2 X40.512 Y211.386 I.062 J-2.503 E.01486
G1 X47.252 Y218.126 E.28407
G1 X47.785 Y218.126 E.0159
G1 X40.955 Y211.295 E.28787
G2 X41.35 Y211.157 I-2.249 J-7.067 E.01248
G1 X48.319 Y218.126 E.2937
G1 X48.852 Y218.126 E.0159
G1 X41.71 Y210.984 E.30102
G2 X42.039 Y210.778 I-.861 J-1.742 E.01156
G1 X49.386 Y218.126 E.30968
G1 X49.919 Y218.126 E.0159
G1 X42.337 Y210.543 E.31957
G2 X42.607 Y210.28 I-1.18 J-1.481 E.01126
G1 X50.453 Y218.126 E.33067
G1 X50.987 Y218.126 E.0159
G1 X42.849 Y209.988 E.34297
G2 X43.062 Y209.667 I-1.498 J-1.223 E.01149
G1 X51.52 Y218.126 E.3565
G1 X52.054 Y218.126 E.0159
G1 X43.244 Y209.315 E.37133
G2 X43.391 Y208.929 I-1.85 J-.929 E.01234
G1 X52.587 Y218.126 E.3876
G1 X53.121 Y218.126 E.0159
G1 X43.493 Y208.498 E.40578
G2 X43.545 Y208.016 I-2.388 J-.498 E.01448
G1 X53.654 Y218.126 E.42611
G1 X54.188 Y218.126 E.0159
G1 X43.525 Y207.463 E.44942
G2 X43.377 Y206.78 I-4.094 J.535 E.02083
G1 X54.891 Y218.295 E.48532
G1 X44.753 Y218.295 F30000
G1 F9541.731
G1 X29.749 Y203.291 E.63239
G1 X29.749 Y203.825 E.0159
G1 X44.05 Y218.126 E.60275
G1 X43.517 Y218.126 E.0159
G1 X29.749 Y204.358 E.58026
G1 X29.749 Y204.892 E.0159
G1 X42.983 Y218.126 E.55777
G1 X42.449 Y218.126 E.0159
G1 X29.749 Y205.426 E.53528
G1 X29.749 Y205.959 E.0159
G1 X41.916 Y218.126 E.51279
G1 X41.382 Y218.126 E.0159
G1 X29.749 Y206.493 E.4903
G1 X29.749 Y207.026 E.0159
G1 X40.849 Y218.126 E.46781
G1 X40.315 Y218.126 E.0159
G1 X29.749 Y207.56 E.44533
G1 X29.749 Y208.093 E.0159
G1 X39.782 Y218.126 E.42284
G1 X39.248 Y218.126 E.0159
G1 X29.749 Y208.627 E.40035
G1 X29.749 Y209.16 E.0159
G1 X38.714 Y218.126 E.37786
G1 X38.181 Y218.126 E.0159
G1 X29.749 Y209.694 E.35537
G1 X29.749 Y210.228 E.0159
G1 X37.647 Y218.126 E.33288
G1 X37.114 Y218.126 E.0159
G1 X29.749 Y210.761 E.31039
G1 X29.749 Y211.295 E.0159
G1 X36.58 Y218.126 E.2879
G1 X36.047 Y218.126 E.0159
G1 X29.749 Y211.828 E.26541
G1 X29.749 Y212.362 E.0159
G1 X35.513 Y218.126 E.24293
G1 X34.98 Y218.126 E.0159
G1 X29.749 Y212.895 E.22044
G1 X29.749 Y213.429 E.0159
G1 X34.446 Y218.126 E.19795
G1 X33.912 Y218.126 E.0159
G1 X29.749 Y213.963 E.17546
G1 X29.749 Y214.496 E.0159
G1 X33.379 Y218.126 E.15297
G1 X32.845 Y218.126 E.0159
G1 X29.749 Y215.03 E.13048
G1 X29.749 Y215.563 E.0159
G1 X32.312 Y218.126 E.10799
G1 X31.778 Y218.126 E.0159
G1 X29.749 Y216.097 E.0855
G1 X29.749 Y216.63 E.0159
G1 X31.245 Y218.126 E.06301
G1 X30.711 Y218.126 E.0159
G1 X29.749 Y217.164 E.04053
G1 X29.749 Y217.698 E.0159
G1 X30.347 Y218.295 E.02519
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9541.731
G1 X29.749 Y217.698 E-.32116
G1 X29.749 Y217.164 E-.20276
G1 X30.189 Y217.603 E-.23608
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
G1 X128.295 Y204.673
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X128.559 Y204.705 E.00854
G3 X127.6 Y204.682 I-.557 J3.167 E.61883
G3 X128.234 Y204.665 I.41 J3.476 E.02042
G1 X128.236 Y204.665 E.00005
G1 X128.246 Y205.077 F30000
G1 F8843.478
G1 X128.488 Y205.107 E.00784
G3 X127.651 Y205.086 I-.487 J2.766 E.54045
G3 X128.186 Y205.071 I.358 J3.041 E.01725
G1 X128.197 Y205.481 F30000
G1 F8843.478
G1 X128.417 Y205.512 E.00714
G3 X127.701 Y205.491 I-.427 J2.363 E.46212
G1 X127.92 Y205.474 E.00704
G3 X128.137 Y205.478 I.07 J2.401 E.00699
G1 X128.197 Y205.879 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.543 Y205.943 E.0105
G3 X127.75 Y205.88 I-.553 J1.932 E.35215
G1 X127.931 Y205.867 E.00541
G3 X128.137 Y205.871 I.06 J2.008 E.00615
; WIPE_START
M204 S10000
G1 X128.543 Y205.943 E-.15671
G1 X128.917 Y206.086 E-.15199
G1 X129.253 Y206.303 E-.15212
G1 X129.54 Y206.583 E-.1521
G1 X129.758 Y206.903 E-.14709
; WIPE_END
G1 E-.04 F1800
G1 X137.388 Y206.704 Z3.2 F30000
G1 X215.844 Y204.664 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X215.896 Y204.66 E.00165
G3 X216.234 Y204.665 I.114 J3.5 E.01088
G3 X215.6 Y204.682 I-.232 J3.208 E.62936
G1 X215.785 Y204.668 E.00595
G1 X215.874 Y205.07 F30000
G1 F8843.478
G1 X215.908 Y205.067 E.0011
G3 X216.205 Y205.072 I.101 J3.061 E.00958
G3 X215.651 Y205.086 I-.204 J2.801 E.54961
G1 X215.814 Y205.074 E.00526
G1 X215.936 Y205.475 F30000
G1 F8843.478
G1 X216.177 Y205.481 E.00774
G3 X215.701 Y205.491 I-.187 J2.394 E.46991
G1 X215.876 Y205.478 E.00564
G1 X215.921 Y205.868 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X215.931 Y205.867 E.0003
G3 X215.75 Y205.88 I.06 J2.008 E.37061
G1 X215.861 Y205.872 E.00331
; WIPE_START
M204 S10000
G1 X215.931 Y205.867 E-.02667
G1 X216.149 Y205.87 E-.08293
G1 X216.544 Y205.94 E-.15251
G1 X216.917 Y206.086 E-.15211
G1 X217.253 Y206.303 E-.15212
G1 X217.54 Y206.583 E-.15212
G1 X217.602 Y206.673 E-.04155
; WIPE_END
G1 E-.04 F1800
G1 X217.462 Y199.042 Z3.2 F30000
G1 X216.189 Y129.21 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X215.92 Y129.213 E.00865
G3 X215.6 Y122.807 I.082 J-3.215 E.3093
G3 X216.234 Y122.79 I.41 J3.487 E.02043
G3 X216.249 Y129.204 I-.232 J3.208 E.30947
G1 X216.244 Y128.798 F30000
G1 F8843.478
G1 X216.21 Y128.799 E.0011
G3 X215.65 Y123.211 I-.208 J-2.801 E.27914
G3 X216.205 Y123.197 I.358 J3.05 E.01788
G3 X216.487 Y128.764 I-.204 J2.801 E.26146
G1 X216.303 Y128.79 E.00598
G1 X216.146 Y128.395 F30000
G1 F8843.478
G1 X215.702 Y128.381 E.0143
G3 X215.701 Y123.616 I.299 J-2.383 E.22329
G3 X216.177 Y123.604 I.305 J2.612 E.01532
G3 X216.206 Y128.391 I-.176 J2.395 E.23032
G1 X216.058 Y128.002 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X215.75 Y127.995 E.00919
G3 X215.75 Y124.005 I.24 J-1.995 E.17365
G1 X215.931 Y123.992 E.00541
G3 X216.15 Y128.003 I.059 J2.008 E.18502
G1 X216.118 Y128.003 E.00094
; WIPE_START
M204 S10000
G1 X215.75 Y127.995 E-.14002
G1 X215.36 Y127.906 E-.15211
G1 X214.995 Y127.741 E-.15214
G1 X214.67 Y127.507 E-.15212
G1 X214.398 Y127.214 E-.15213
G1 X214.382 Y127.188 E-.01149
; WIPE_END
G1 E-.04 F1800
G1 X214.511 Y119.557 Z3.2 F30000
G1 X215.844 Y40.914 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X215.896 Y40.91 E.00165
G3 X216.234 Y40.915 I.114 J3.505 E.01088
G3 X215.6 Y40.932 I-.232 J3.208 E.62935
G1 X215.785 Y40.918 E.00596
G1 X215.874 Y41.32 F30000
G1 F8843.478
G1 X215.908 Y41.317 E.00109
G3 X216.205 Y41.322 I.1 J3.065 E.00958
G3 X215.65 Y41.336 I-.204 J2.801 E.54961
G1 X215.814 Y41.324 E.00527
G1 X215.921 Y41.735 F30000
G1 F8843.478
G1 X216.177 Y41.729 E.00823
G3 X215.701 Y41.741 I-.176 J2.395 E.46986
G1 X215.861 Y41.737 E.00514
G1 X215.927 Y42.117 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X215.931 Y42.117 E.00012
G3 X215.75 Y42.13 I.059 J2.008 E.3706
G1 X215.867 Y42.122 E.0035
; WIPE_START
M204 S10000
G1 X215.931 Y42.117 E-.0243
G1 X216.149 Y42.12 E-.08292
G1 X216.544 Y42.19 E-.15251
G1 X216.917 Y42.336 E-.15208
G1 X217.253 Y42.553 E-.15215
G1 X217.54 Y42.833 E-.15211
G1 X217.605 Y42.928 E-.04394
; WIPE_END
G1 E-.04 F1800
G1 X209.975 Y42.757 Z3.2 F30000
G1 X127.844 Y40.914 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X127.896 Y40.91 E.00165
G3 X128.234 Y40.915 I.114 J3.505 E.01088
G3 X127.6 Y40.932 I-.232 J3.208 E.62935
G1 X127.785 Y40.918 E.00596
G1 X127.874 Y41.32 F30000
G1 F8843.478
G1 X127.908 Y41.317 E.00109
G3 X128.205 Y41.322 I.1 J3.065 E.00958
G3 X127.65 Y41.336 I-.204 J2.801 E.54961
G1 X127.814 Y41.324 E.00527
G1 X127.921 Y41.735 F30000
G1 F8843.478
G1 X128.177 Y41.729 E.00822
G3 X127.701 Y41.741 I-.176 J2.395 E.46986
G1 X127.861 Y41.737 E.00515
G1 X127.927 Y42.117 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X127.931 Y42.117 E.00011
G3 X127.75 Y42.13 I.059 J2.008 E.3706
G1 X127.868 Y42.122 E.00351
; WIPE_START
M204 S10000
G1 X127.931 Y42.117 E-.0242
G1 X128.149 Y42.12 E-.08292
G1 X128.544 Y42.19 E-.15251
G1 X128.917 Y42.336 E-.15208
G1 X129.253 Y42.553 E-.15214
G1 X129.54 Y42.833 E-.15212
M73 P84 R12
G1 X129.605 Y42.929 E-.04402
; WIPE_END
G1 E-.04 F1800
G1 X121.974 Y42.798 Z3.2 F30000
G1 X38.345 Y41.368 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X38.391 Y41.339 E.00176
G3 X39.6 Y40.932 I1.61 J2.784 E.04127
G3 X40.234 Y40.915 I.41 J3.484 E.02043
G3 X38.122 Y41.513 I-.232 J3.208 E.57777
G1 X38.295 Y41.401 E.00663
G1 X38.919 Y41.534 F30000
G1 F8843.478
G1 X39.105 Y41.461 E.00643
G3 X39.65 Y41.336 I.896 J2.662 E.01802
G3 X40.205 Y41.322 I.358 J3.046 E.01787
G3 X38.844 Y41.564 I-.204 J2.801 E.52258
G1 X38.863 Y41.556 E.00065
G1 X39.387 Y41.813 F30000
G1 F8843.478
G1 X39.701 Y41.741 E.01036
G3 X40.177 Y41.729 I.305 J2.609 E.01532
G3 X39.235 Y41.847 I-.176 J2.395 E.45445
G1 X39.329 Y41.826 E.0031
G1 X39.85 Y42.123 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X39.931 Y42.117 E.00242
G3 X39.75 Y42.13 I.059 J2.008 E.3706
G1 X39.79 Y42.127 E.0012
; WIPE_START
M204 S10000
G1 X39.931 Y42.117 E-.05372
G1 X40.149 Y42.12 E-.08292
G1 X40.544 Y42.19 E-.15251
G1 X40.917 Y42.336 E-.15208
G1 X41.253 Y42.553 E-.15216
G1 X41.54 Y42.833 E-.15211
G1 X41.561 Y42.864 E-.01451
; WIPE_END
G1 E-.04 F1800
G1 X47.116 Y48.099 Z3.2 F30000
G1 X205.416 Y197.291 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X50.584 Y197.291 E4.97885
G1 X50.584 Y54.709 E4.58493
G1 X205.416 Y54.709 E4.97885
G1 X205.416 Y197.231 E4.583
G1 X205.009 Y196.884 F30000
G1 F8843.478
G1 X50.991 Y196.884 E4.95267
G1 X50.991 Y55.116 E4.55875
G1 X205.009 Y55.116 E4.95267
G1 X205.009 Y196.824 E4.55682
G1 X204.602 Y196.477 F30000
G1 F8843.478
G1 X51.398 Y196.477 E4.92649
G1 X51.398 Y55.523 E4.53257
G1 X204.602 Y55.523 E4.92649
G1 X204.602 Y196.417 E4.53064
G1 X204.21 Y196.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X51.79 Y196.085 E4.54007
G1 X51.79 Y55.915 E4.17519
G1 X204.21 Y55.915 E4.54007
G1 X204.21 Y196.025 E4.1734
; WIPE_START
M204 S10000
G1 X202.21 Y196.026 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X195.253 Y192.888 Z3.2 F30000
G1 X39.845 Y122.789 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X39.896 Y122.785 E.00165
G3 X40.234 Y122.79 I.114 J3.509 E.01089
G3 X39.6 Y122.807 I-.232 J3.208 E.62935
G1 X39.785 Y122.793 E.00597
G1 X39.874 Y123.195 F30000
G1 F8843.478
G1 X39.908 Y123.192 E.00109
G3 X40.205 Y123.197 I.101 J3.069 E.00958
G3 X39.65 Y123.211 I-.204 J2.801 E.5496
G1 X39.814 Y123.199 E.00527
G1 X39.921 Y123.61 F30000
G1 F8843.478
G1 X40.177 Y123.604 E.00823
G3 X39.701 Y123.616 I-.176 J2.395 E.46986
G1 X39.861 Y123.612 E.00515
G1 X39.927 Y123.992 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X39.931 Y123.992 E.00012
G3 X39.75 Y124.005 I.059 J2.008 E.3706
G1 X39.867 Y123.997 E.0035
; WIPE_START
M204 S10000
G1 X39.931 Y123.992 E-.02427
G1 X40.149 Y123.995 E-.08296
G1 X40.544 Y124.065 E-.15244
G1 X40.917 Y124.211 E-.15213
G1 X41.253 Y124.428 E-.1521
G1 X41.54 Y124.708 E-.15216
G1 X41.605 Y124.803 E-.04395
; WIPE_END
G1 E-.04 F1800
G1 X41.437 Y132.434 Z3.2 F30000
G1 X39.844 Y204.664 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X39.896 Y204.66 E.00165
G3 X40.234 Y204.665 I.114 J3.499 E.01088
G3 X39.6 Y204.682 I-.232 J3.208 E.62936
G1 X39.784 Y204.668 E.00595
G1 X39.874 Y205.07 F30000
G1 F8843.478
G1 X39.908 Y205.067 E.0011
G3 X40.205 Y205.072 I.101 J3.061 E.00958
M73 P84 R11
G3 X39.651 Y205.086 I-.204 J2.801 E.54961
G1 X39.814 Y205.074 E.00526
G1 X39.903 Y205.476 F30000
G1 F8843.478
G1 X39.92 Y205.474 E.00054
G3 X39.701 Y205.491 I.07 J2.401 E.47818
G1 X39.843 Y205.48 E.00457
G1 X39.921 Y205.868 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X39.931 Y205.867 E.00031
G3 X39.75 Y205.88 I.06 J2.008 E.37061
G1 X39.861 Y205.872 E.00331
; WIPE_START
M204 S10000
G1 X39.931 Y205.867 E-.02679
G1 X40.149 Y205.87 E-.08292
G1 X40.544 Y205.94 E-.15251
G1 X40.917 Y206.086 E-.15211
G1 X41.253 Y206.303 E-.15212
G1 X41.54 Y206.583 E-.15209
G1 X41.601 Y206.673 E-.04146
; WIPE_END
G1 E-.04 F1800
G1 X49.218 Y207.158 Z3.2 F30000
G1 X226.584 Y218.459 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X29.416 Y218.459 E6.34019
G1 X29.416 Y33.541 E5.94628
G1 X226.584 Y33.541 E6.34019
G1 X226.584 Y218.399 E5.94435
G1 X226.991 Y218.866 F30000
G1 F8843.478
G1 X29.009 Y218.866 E6.36637
G1 X29.009 Y33.134 E5.97246
G1 X226.991 Y33.134 E6.36637
G1 X226.991 Y218.806 E5.97053
G1 X227.398 Y219.273 F30000
G1 F8843.478
G1 X28.602 Y219.273 E6.39255
G1 X28.602 Y32.727 E5.99864
G1 X227.398 Y32.727 E6.39255
G1 X227.398 Y219.213 E5.99671
G1 X227.79 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X28.21 Y219.665 E5.94481
G1 X28.21 Y32.335 E5.57992
G1 X227.79 Y32.335 E5.94481
G1 X227.79 Y219.605 E5.57813
; WIPE_START
M204 S10000
G1 X225.79 Y219.606 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X225.658 Y218.295 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42021
G1 F9541.731
G1 X226.251 Y217.702 E.025
G1 X226.251 Y217.169 E.0159
G1 X225.294 Y218.126 E.04033
G1 X224.76 Y218.126 E.0159
G1 X226.251 Y216.635 E.06282
G1 X226.251 Y216.101 E.0159
G1 X224.226 Y218.126 E.08531
G1 X223.693 Y218.126 E.0159
G1 X226.251 Y215.568 E.1078
G1 X226.251 Y215.034 E.0159
G1 X223.159 Y218.126 E.13029
G1 X222.626 Y218.126 E.0159
G1 X226.251 Y214.501 E.15278
G1 X226.251 Y213.967 E.0159
G1 X222.092 Y218.126 E.17527
G1 X221.559 Y218.126 E.0159
G1 X226.251 Y213.434 E.19775
G1 X226.251 Y212.9 E.0159
G1 X221.025 Y218.126 E.22024
G1 X220.492 Y218.126 E.0159
G1 X226.251 Y212.366 E.24273
G1 X226.251 Y211.833 E.0159
G1 X219.958 Y218.126 E.26522
G1 X219.424 Y218.126 E.0159
G1 X226.251 Y211.299 E.28771
G1 X226.251 Y210.766 E.0159
G1 X218.891 Y218.126 E.3102
G1 X218.357 Y218.126 E.0159
G1 X226.251 Y210.232 E.33269
G1 X226.251 Y209.699 E.0159
G1 X217.824 Y218.126 E.35518
G1 X217.29 Y218.126 E.0159
G1 X226.251 Y209.165 E.37767
G1 X226.251 Y208.632 E.0159
G1 X216.757 Y218.126 E.40015
G1 X216.223 Y218.126 E.0159
G1 X226.251 Y208.098 E.42264
G1 X226.251 Y207.564 E.0159
G1 X215.689 Y218.126 E.44513
G1 X215.156 Y218.126 E.0159
G1 X226.251 Y207.031 E.46762
G1 X226.251 Y206.497 E.0159
G1 X214.622 Y218.126 E.49011
G1 X214.089 Y218.126 E.0159
G1 X226.251 Y205.964 E.5126
G1 X226.251 Y205.43 E.0159
G1 X213.555 Y218.126 E.53509
G1 X213.022 Y218.126 E.0159
G1 X226.251 Y204.897 E.55758
G1 X226.251 Y204.363 E.0159
G1 X212.488 Y218.126 E.58007
G1 X211.954 Y218.126 E.0159
G1 X226.251 Y203.829 E.60256
G1 X226.251 Y203.296 E.0159
G1 X211.421 Y218.126 E.62504
G1 X210.887 Y218.126 E.0159
G1 X226.251 Y202.762 E.64753
G1 X226.251 Y202.229 E.0159
G1 X219.3 Y209.179 E.29294
G2 X219.502 Y208.444 I-3.418 J-1.331 E.02275
G1 X226.251 Y201.695 E.28446
G1 X226.251 Y201.162 E.0159
G1 X219.551 Y207.861 E.28237
G2 X219.511 Y207.368 I-2.49 J-.046 E.01478
G1 X226.251 Y200.628 E.28407
G1 X226.251 Y200.094 E.0159
G1 X219.419 Y206.926 E.28794
G2 X219.284 Y206.527 I-2.065 J.474 E.01257
G1 X226.251 Y199.561 E.29361
G1 X226.251 Y199.027 E.0159
G1 X219.112 Y206.165 E.30086
G2 X218.907 Y205.838 I-1.738 J.862 E.01155
G1 X226.251 Y198.494 E.30953
G1 X226.251 Y197.96 E.0159
G1 X218.672 Y205.539 E.31944
G2 X218.408 Y205.269 I-1.478 J1.179 E.01126
G1 X226.251 Y197.427 E.33055
G1 X226.251 Y196.893 E.0159
G1 X218.116 Y205.028 E.34285
G2 X217.795 Y204.815 I-1.223 J1.501 E.0115
G1 X226.251 Y196.359 E.35639
G1 X226.251 Y195.826 E.0159
G1 X217.442 Y204.634 E.37125
G2 X217.055 Y204.487 I-.927 J1.862 E.01235
G1 X226.251 Y195.292 E.38756
G1 X226.251 Y194.759 E.0159
G1 X216.629 Y204.38 E.40552
G2 X216.145 Y204.33 I-.756 J4.99 E.0145
G1 X226.251 Y194.225 E.42592
G1 X226.251 Y193.692 E.0159
G1 X215.594 Y204.348 E.44916
G2 X214.913 Y204.496 I.579 J4.314 E.0208
G1 X226.251 Y193.158 E.47787
G1 X226.251 Y192.624 E.0159
G1 X200.749 Y218.126 E1.07482
G1 X201.283 Y218.126 E.0159
G1 X212.624 Y206.784 E.47801
G2 X212.476 Y207.466 I3.456 J1.109 E.02083
G1 X201.817 Y218.126 E.44927
G1 X202.35 Y218.126 E.0159
G1 X212.453 Y208.023 E.42581
G2 X212.508 Y208.502 I4.815 J-.31 E.01437
G1 X202.884 Y218.126 E.40563
G1 X203.417 Y218.126 E.0159
G1 X212.613 Y208.93 E.38759
G2 X212.759 Y209.318 I2.013 J-.533 E.01237
G1 X203.951 Y218.126 E.37123
G1 X204.484 Y218.126 E.0159
G1 X212.939 Y209.671 E.35634
G2 X213.151 Y209.993 I1.714 J-.897 E.0115
G1 X205.018 Y218.126 E.34278
G1 X205.552 Y218.126 E.0159
G1 X213.392 Y210.285 E.33045
G2 X213.663 Y210.548 I10.995 J-11.056 E.01125
G1 X206.085 Y218.126 E.31938
G1 X206.619 Y218.126 E.0159
G1 X213.962 Y210.782 E.30953
G2 X214.292 Y210.986 I1.182 J-1.542 E.01157
G1 X207.152 Y218.126 E.30093
G1 X207.686 Y218.126 E.0159
G1 X214.654 Y211.157 E.29369
G2 X215.052 Y211.293 I.878 J-1.922 E.01255
G1 X208.219 Y218.126 E.28797
G1 X208.753 Y218.126 E.0159
G1 X215.491 Y211.387 E.28401
G2 X215.988 Y211.424 I.563 J-4.284 E.01487
G1 X209.287 Y218.126 E.28247
G1 X209.82 Y218.126 E.0159
G1 X216.567 Y211.379 E.28436
G2 X217.299 Y211.181 I-.292 J-2.527 E.02268
M73 P85 R11
G1 X210.184 Y218.295 E.29987
G1 X200.046 Y218.295 F30000
G1 F9541.731
G1 X226.251 Y192.091 E1.10446
G1 X226.251 Y191.557 E.0159
G1 X199.682 Y218.126 E1.1198
G1 X199.149 Y218.126 E.0159
G1 X226.251 Y191.024 E1.14229
G1 X226.251 Y190.49 E.0159
G1 X198.615 Y218.126 E1.16478
G1 X198.082 Y218.126 E.0159
G1 X226.251 Y189.957 E1.18727
G1 X226.251 Y189.423 E.0159
G1 X197.548 Y218.126 E1.20976
G1 X197.014 Y218.126 E.0159
G1 X226.251 Y188.889 E1.23224
G1 X226.251 Y188.356 E.0159
G1 X196.481 Y218.126 E1.25473
G1 X195.947 Y218.126 E.0159
G1 X226.251 Y187.822 E1.27722
G1 X226.251 Y187.289 E.0159
G1 X195.414 Y218.126 E1.29971
G1 X194.88 Y218.126 E.0159
G1 X226.251 Y186.755 E1.3222
G1 X226.251 Y186.222 E.0159
G1 X194.347 Y218.126 E1.34469
G1 X193.813 Y218.126 E.0159
G1 X226.251 Y185.688 E1.36718
G1 X226.251 Y185.155 E.0159
G1 X193.279 Y218.126 E1.38967
G1 X192.746 Y218.126 E.0159
G1 X226.251 Y184.621 E1.41216
G1 X226.251 Y184.087 E.0159
G1 X192.212 Y218.126 E1.43464
G1 X191.679 Y218.126 E.0159
G1 X226.251 Y183.554 E1.45713
G1 X226.251 Y183.02 E.0159
G1 X191.145 Y218.126 E1.47962
G1 X190.612 Y218.126 E.0159
G1 X226.251 Y182.487 E1.50211
G1 X226.251 Y181.953 E.0159
G1 X190.078 Y218.126 E1.5246
G1 X189.545 Y218.126 E.0159
G1 X226.251 Y181.42 E1.54709
G1 X226.251 Y180.886 E.0159
G1 X189.011 Y218.126 E1.56958
G1 X188.477 Y218.126 E.0159
G1 X226.251 Y180.352 E1.59207
G1 X226.251 Y179.819 E.0159
G1 X187.944 Y218.126 E1.61456
G1 X187.41 Y218.126 E.0159
G1 X226.251 Y179.285 E1.63704
G1 X226.251 Y178.752 E.0159
G1 X186.877 Y218.126 E1.65953
G1 X186.343 Y218.126 E.0159
G1 X226.251 Y178.218 E1.68202
G1 X226.251 Y177.685 E.0159
G1 X185.81 Y218.126 E1.70451
G1 X185.276 Y218.126 E.0159
G1 X226.251 Y177.151 E1.727
G1 X226.251 Y176.617 E.0159
G1 X205.749 Y197.118 E.86408
G1 X205.749 Y196.585 E.0159
G1 X226.251 Y176.084 E.86408
G1 X226.251 Y175.55 E.0159
G1 X205.749 Y196.051 E.86408
G1 X205.749 Y195.518 E.0159
G1 X226.251 Y175.017 E.86408
G1 X226.251 Y174.483 E.0159
G1 X205.749 Y194.984 E.86408
G1 X205.749 Y194.451 E.0159
G1 X226.251 Y173.95 E.86408
G1 X226.251 Y173.416 E.0159
G1 X205.749 Y193.917 E.86408
G1 X205.749 Y193.383 E.0159
G1 X226.251 Y172.882 E.86408
G1 X226.251 Y172.349 E.0159
G1 X205.749 Y192.85 E.86408
G1 X205.749 Y192.316 E.0159
G1 X226.251 Y171.815 E.86408
G1 X226.251 Y171.282 E.0159
G1 X205.749 Y191.783 E.86408
G1 X205.749 Y191.249 E.0159
G1 X226.251 Y170.748 E.86408
G1 X226.251 Y170.215 E.0159
G1 X205.749 Y190.716 E.86408
G1 X205.749 Y190.182 E.0159
G1 X226.251 Y169.681 E.86408
G1 X226.251 Y169.147 E.0159
G1 X205.749 Y189.649 E.86408
G1 X205.749 Y189.115 E.0159
G1 X226.251 Y168.614 E.86408
G1 X226.251 Y168.08 E.0159
G1 X205.749 Y188.581 E.86408
G1 X205.749 Y188.048 E.0159
G1 X226.251 Y167.547 E.86408
G1 X226.251 Y167.013 E.0159
G1 X205.749 Y187.514 E.86408
G1 X205.749 Y186.981 E.0159
G1 X226.251 Y166.48 E.86408
G1 X226.251 Y165.946 E.0159
G1 X205.749 Y186.447 E.86408
G1 X205.749 Y185.914 E.0159
G1 X226.251 Y165.412 E.86408
G1 X226.251 Y164.879 E.0159
G1 X205.749 Y185.38 E.86408
G1 X205.749 Y184.846 E.0159
G1 X226.251 Y164.345 E.86408
G1 X226.251 Y163.812 E.0159
G1 X205.749 Y184.313 E.86408
G1 X205.749 Y183.779 E.0159
G1 X226.251 Y163.278 E.86408
G1 X226.251 Y162.745 E.0159
G1 X205.749 Y183.246 E.86408
G1 X205.749 Y182.712 E.0159
G1 X226.251 Y162.211 E.86408
G1 X226.251 Y161.677 E.0159
G1 X205.749 Y182.179 E.86408
G1 X205.749 Y181.645 E.0159
G1 X226.251 Y161.144 E.86408
G1 X226.251 Y160.61 E.0159
G1 X205.749 Y181.111 E.86408
G1 X205.749 Y180.578 E.0159
G1 X226.251 Y160.077 E.86408
G1 X226.251 Y159.543 E.0159
G1 X205.749 Y180.044 E.86408
G1 X205.749 Y179.511 E.0159
G1 X226.251 Y159.01 E.86408
G1 X226.251 Y158.476 E.0159
G1 X205.749 Y178.977 E.86408
G1 X205.749 Y178.444 E.0159
G1 X226.251 Y157.942 E.86408
G1 X226.251 Y157.409 E.0159
G1 X205.749 Y177.91 E.86408
G1 X205.749 Y177.376 E.0159
G1 X226.251 Y156.875 E.86408
G1 X226.251 Y156.342 E.0159
G1 X205.749 Y176.843 E.86408
G1 X205.749 Y176.309 E.0159
G1 X226.251 Y155.808 E.86408
G1 X226.251 Y155.275 E.0159
G1 X205.749 Y175.776 E.86408
G1 X205.749 Y175.242 E.0159
G1 X226.251 Y154.741 E.86408
G1 X226.251 Y154.208 E.0159
G1 X205.749 Y174.709 E.86408
G1 X205.749 Y174.175 E.0159
G1 X226.251 Y153.674 E.86408
G1 X226.251 Y153.14 E.0159
G1 X205.749 Y173.641 E.86408
G1 X205.749 Y173.108 E.0159
G1 X226.251 Y152.607 E.86408
G1 X226.251 Y152.073 E.0159
G1 X205.749 Y172.574 E.86408
G1 X205.749 Y172.041 E.0159
G1 X226.251 Y151.54 E.86408
G1 X226.251 Y151.006 E.0159
G1 X205.749 Y171.507 E.86408
G1 X205.749 Y170.974 E.0159
G1 X226.251 Y150.473 E.86408
G1 X226.251 Y149.939 E.0159
G1 X205.749 Y170.44 E.86408
G1 X205.749 Y169.906 E.0159
G1 X226.251 Y149.405 E.86408
G1 X226.251 Y148.872 E.0159
G1 X205.749 Y169.373 E.86408
G1 X205.749 Y168.839 E.0159
G1 X226.251 Y148.338 E.86408
G1 X226.251 Y147.805 E.0159
G1 X205.749 Y168.306 E.86408
G1 X205.749 Y167.772 E.0159
G1 X226.251 Y147.271 E.86408
G1 X226.251 Y146.738 E.0159
G1 X205.749 Y167.239 E.86408
G1 X205.749 Y166.705 E.0159
G1 X226.251 Y146.204 E.86408
G1 X226.251 Y145.67 E.0159
G1 X205.749 Y166.171 E.86408
G1 X205.749 Y165.638 E.0159
G1 X226.251 Y145.137 E.86408
G1 X226.251 Y144.603 E.0159
G1 X205.749 Y165.104 E.86408
G1 X205.749 Y164.571 E.0159
G1 X226.251 Y144.07 E.86408
G1 X226.251 Y143.536 E.0159
G1 X205.749 Y164.037 E.86408
G1 X205.749 Y163.504 E.0159
G1 X226.251 Y143.003 E.86408
G1 X226.251 Y142.469 E.0159
G1 X205.749 Y162.97 E.86408
G1 X205.749 Y162.437 E.0159
G1 X226.251 Y141.935 E.86408
G1 X226.251 Y141.402 E.0159
G1 X205.749 Y161.903 E.86408
G1 X205.749 Y161.369 E.0159
G1 X226.251 Y140.868 E.86408
G1 X226.251 Y140.335 E.0159
G1 X205.749 Y160.836 E.86408
G1 X205.749 Y160.302 E.0159
G1 X226.251 Y139.801 E.86408
G1 X226.251 Y139.268 E.0159
G1 X205.749 Y159.769 E.86408
G1 X205.749 Y159.235 E.0159
G1 X226.251 Y138.734 E.86408
G1 X226.251 Y138.2 E.0159
G1 X205.749 Y158.702 E.86408
G1 X205.749 Y158.168 E.0159
G1 X226.251 Y137.667 E.86408
G1 X226.251 Y137.133 E.0159
G1 X205.749 Y157.634 E.86408
G1 X205.749 Y157.101 E.0159
G1 X226.251 Y136.6 E.86408
G1 X226.251 Y136.066 E.0159
G1 X205.749 Y156.567 E.86408
G1 X205.749 Y156.034 E.0159
G1 X226.251 Y135.533 E.86408
G1 X226.251 Y134.999 E.0159
G1 X205.749 Y155.5 E.86408
G1 X205.749 Y154.967 E.0159
G1 X226.251 Y134.465 E.86408
G1 X226.251 Y133.932 E.0159
G1 X205.749 Y154.433 E.86408
G1 X205.749 Y153.899 E.0159
G1 X226.251 Y133.398 E.86408
G1 X226.251 Y132.865 E.0159
G1 X205.749 Y153.366 E.86408
G1 X205.749 Y152.832 E.0159
G1 X226.251 Y132.331 E.86408
G1 X226.251 Y131.798 E.0159
G1 X205.749 Y152.299 E.86408
G1 X205.749 Y151.765 E.0159
G1 X226.251 Y131.264 E.86408
G1 X226.251 Y130.731 E.0159
G1 X205.749 Y151.232 E.86408
G1 X205.749 Y150.698 E.0159
G1 X226.251 Y130.197 E.86408
G1 X226.251 Y129.663 E.0159
G1 X205.749 Y150.164 E.86408
G1 X205.749 Y149.631 E.0159
G1 X226.251 Y129.13 E.86408
G1 X226.251 Y128.596 E.0159
G1 X205.749 Y149.097 E.86408
G1 X205.749 Y148.564 E.0159
G1 X226.251 Y128.063 E.86408
G1 X226.251 Y127.529 E.0159
G1 X205.749 Y148.03 E.86408
G1 X205.749 Y147.497 E.0159
G1 X226.251 Y126.996 E.86408
G1 X226.251 Y126.462 E.0159
G1 X205.749 Y146.963 E.86408
G1 X205.749 Y146.429 E.0159
G1 X226.251 Y125.928 E.86408
G1 X226.251 Y125.395 E.0159
G1 X205.749 Y145.896 E.86408
G1 X205.749 Y145.362 E.0159
G1 X226.251 Y124.861 E.86408
G1 X226.251 Y124.328 E.0159
G1 X205.749 Y144.829 E.86408
G1 X205.749 Y144.295 E.0159
G1 X226.251 Y123.794 E.86408
G1 X226.251 Y123.261 E.0159
G1 X205.749 Y143.762 E.86408
G1 X205.749 Y143.228 E.0159
G1 X226.251 Y122.727 E.86408
G1 X226.251 Y122.193 E.0159
G1 X205.749 Y142.694 E.86408
G1 X205.749 Y142.161 E.0159
G1 X226.251 Y121.66 E.86408
G1 X226.251 Y121.126 E.0159
G1 X205.749 Y141.627 E.86408
G1 X205.749 Y141.094 E.0159
G1 X226.251 Y120.593 E.86408
G1 X226.251 Y120.059 E.0159
G1 X219.439 Y126.871 E.28711
G2 X219.54 Y126.236 I-3.509 J-.885 E.01918
G1 X226.251 Y119.526 E.28284
G1 X226.251 Y118.992 E.0159
G1 X219.537 Y125.706 E.28297
G2 X219.467 Y125.242 I-4.777 J.479 E.01399
G1 X226.251 Y118.458 E.2859
G1 X226.251 Y117.925 E.0159
G1 X219.348 Y124.827 E.29093
M73 P85 R10
G2 X219.191 Y124.451 I-1.957 J.595 E.01218
G1 X226.251 Y117.391 E.29754
G1 X226.251 Y116.858 E.0159
G1 X219.001 Y124.108 E.30557
G2 X218.78 Y123.795 I-1.675 J.949 E.01143
G1 X226.251 Y116.324 E.31488
G1 X226.251 Y115.791 E.0159
G1 X218.53 Y123.511 E.32541
G2 X218.252 Y123.256 I-1.413 J1.261 E.01127
G1 X226.251 Y115.257 E.33714
G1 X226.251 Y114.723 E.0159
G1 X217.945 Y123.029 E.35008
G2 X217.607 Y122.833 I-5.497 J9.092 E.01164
G1 X226.251 Y114.19 E.36431
G1 X226.251 Y113.656 E.0159
G1 X217.234 Y122.673 E.38002
G2 X216.824 Y122.55 I-.822 J1.996 E.01279
G1 X226.251 Y113.123 E.39732
G1 X226.251 Y112.589 E.0159
G1 X216.369 Y122.471 E.41651
G2 X215.852 Y122.454 I-.415 J4.696 E.0154
G1 X226.251 Y112.056 E.43827
G1 X226.251 Y111.522 E.0159
G1 X215.241 Y122.532 E.46405
G2 X214.41 Y122.829 I.529 J2.789 E.02639
G1 X226.251 Y110.988 E.49905
G1 X226.251 Y110.455 E.0159
G1 X205.749 Y130.956 E.86408
G1 X205.749 Y131.49 E.0159
G1 X212.824 Y124.415 E.29818
G2 X212.535 Y125.237 I2.409 J1.308 E.02609
G1 X205.749 Y132.023 E.286
G1 X205.749 Y132.557 E.0159
G1 X212.453 Y125.853 E.28253
G2 X212.472 Y126.368 I2.58 J.162 E.01537
G1 X205.749 Y133.09 E.28334
G1 X205.749 Y133.624 E.0159
G1 X212.548 Y126.825 E.28654
G2 X212.671 Y127.236 I6.108 J-1.614 E.01277
G1 X205.749 Y134.157 E.29174
G1 X205.749 Y134.691 E.0159
G1 X212.835 Y127.605 E.29865
G2 X213.031 Y127.943 I1.785 J-.812 E.01165
G1 X205.749 Y135.225 E.30692
G1 X205.749 Y135.758 E.0159
G1 X213.257 Y128.25 E.31645
G2 X213.512 Y128.529 I1.522 J-1.136 E.01127
G1 X205.749 Y136.292 E.32719
G1 X205.749 Y136.825 E.0159
G1 X213.796 Y128.779 E.33913
G2 X214.108 Y129.001 I1.263 J-1.45 E.01142
G1 X205.749 Y137.359 E.35228
G1 X205.749 Y137.892 E.0159
G1 X214.45 Y129.192 E.36672
G2 X214.826 Y129.35 I.977 J-1.797 E.01216
G1 X205.749 Y138.426 E.38254
G1 X205.749 Y138.96 E.0159
G1 X215.241 Y129.468 E.40005
G2 X215.707 Y129.535 I.569 J-2.301 E.01407
G1 X205.749 Y139.493 E.4197
G1 X205.749 Y140.027 E.0159
G1 X216.234 Y129.543 E.44189
G2 X216.87 Y129.44 I-.369 J-4.314 E.01922
G1 X205.58 Y140.73 E.47585
G1 X205.58 Y130.592 F30000
G1 F9541.731
G1 X226.251 Y109.921 E.87123
G1 X226.251 Y109.388 E.0159
G1 X205.749 Y129.889 E.86408
G1 X205.749 Y129.355 E.0159
G1 X226.251 Y108.854 E.86408
G1 X226.251 Y108.321 E.0159
G1 X205.749 Y128.822 E.86408
G1 X205.749 Y128.288 E.0159
G1 X226.251 Y107.787 E.86408
G1 X226.251 Y107.253 E.0159
G1 X205.749 Y127.755 E.86408
G1 X205.749 Y127.221 E.0159
G1 X226.251 Y106.72 E.86408
G1 X226.251 Y106.186 E.0159
G1 X205.749 Y126.687 E.86408
G1 X205.749 Y126.154 E.0159
G1 X226.251 Y105.653 E.86408
G1 X226.251 Y105.119 E.0159
G1 X205.749 Y125.62 E.86408
G1 X205.749 Y125.087 E.0159
G1 X226.251 Y104.586 E.86408
G1 X226.251 Y104.052 E.0159
G1 X205.749 Y124.553 E.86408
G1 X205.749 Y124.02 E.0159
G1 X226.251 Y103.519 E.86408
G1 X226.251 Y102.985 E.0159
G1 X205.749 Y123.486 E.86408
G1 X205.749 Y122.952 E.0159
G1 X226.251 Y102.451 E.86408
G1 X226.251 Y101.918 E.0159
G1 X205.749 Y122.419 E.86408
G1 X205.749 Y121.885 E.0159
G1 X226.251 Y101.384 E.86408
G1 X226.251 Y100.851 E.0159
G1 X205.749 Y121.352 E.86408
G1 X205.749 Y120.818 E.0159
G1 X226.251 Y100.317 E.86408
G1 X226.251 Y99.784 E.0159
G1 X205.749 Y120.285 E.86408
G1 X205.749 Y119.751 E.0159
G1 X226.251 Y99.25 E.86408
G1 X226.251 Y98.716 E.0159
G1 X205.749 Y119.217 E.86408
G1 X205.749 Y118.684 E.0159
G1 X226.251 Y98.183 E.86408
G1 X226.251 Y97.649 E.0159
G1 X205.749 Y118.15 E.86408
G1 X205.749 Y117.617 E.0159
G1 X226.251 Y97.116 E.86408
G1 X226.251 Y96.582 E.0159
G1 X205.749 Y117.083 E.86408
G1 X205.749 Y116.55 E.0159
G1 X226.251 Y96.049 E.86408
G1 X226.251 Y95.515 E.0159
G1 X205.749 Y116.016 E.86408
G1 X205.749 Y115.482 E.0159
G1 X226.251 Y94.981 E.86408
G1 X226.251 Y94.448 E.0159
G1 X205.749 Y114.949 E.86408
G1 X205.749 Y114.415 E.0159
G1 X226.251 Y93.914 E.86408
G1 X226.251 Y93.381 E.0159
G1 X205.749 Y113.882 E.86408
G1 X205.749 Y113.348 E.0159
G1 X226.251 Y92.847 E.86408
G1 X226.251 Y92.314 E.0159
G1 X205.749 Y112.815 E.86408
G1 X205.749 Y112.281 E.0159
G1 X226.251 Y91.78 E.86408
G1 X226.251 Y91.246 E.0159
G1 X205.749 Y111.748 E.86408
G1 X205.749 Y111.214 E.0159
G1 X226.251 Y90.713 E.86408
G1 X226.251 Y90.179 E.0159
G1 X205.749 Y110.68 E.86408
G1 X205.749 Y110.147 E.0159
G1 X226.251 Y89.646 E.86408
G1 X226.251 Y89.112 E.0159
G1 X205.749 Y109.613 E.86408
G1 X205.749 Y109.08 E.0159
G1 X226.251 Y88.579 E.86408
G1 X226.251 Y88.045 E.0159
G1 X205.749 Y108.546 E.86408
G1 X205.749 Y108.013 E.0159
G1 X226.251 Y87.511 E.86408
G1 X226.251 Y86.978 E.0159
G1 X205.749 Y107.479 E.86408
G1 X205.749 Y106.945 E.0159
G1 X226.251 Y86.444 E.86408
G1 X226.251 Y85.911 E.0159
G1 X205.749 Y106.412 E.86408
G1 X205.749 Y105.878 E.0159
G1 X226.251 Y85.377 E.86408
G1 X226.251 Y84.844 E.0159
G1 X205.749 Y105.345 E.86408
G1 X205.749 Y104.811 E.0159
G1 X226.251 Y84.31 E.86408
G1 X226.251 Y83.776 E.0159
G1 X205.749 Y104.278 E.86408
G1 X205.749 Y103.744 E.0159
G1 X226.251 Y83.243 E.86408
G1 X226.251 Y82.709 E.0159
G1 X205.749 Y103.21 E.86408
G1 X205.749 Y102.677 E.0159
G1 X226.251 Y82.176 E.86408
G1 X226.251 Y81.642 E.0159
G1 X205.749 Y102.143 E.86408
G1 X205.749 Y101.61 E.0159
G1 X226.251 Y81.109 E.86408
G1 X226.251 Y80.575 E.0159
G1 X205.749 Y101.076 E.86408
G1 X205.749 Y100.543 E.0159
G1 X226.251 Y80.041 E.86408
G1 X226.251 Y79.508 E.0159
G1 X205.749 Y100.009 E.86408
G1 X205.749 Y99.475 E.0159
G1 X226.251 Y78.974 E.86408
G1 X226.251 Y78.441 E.0159
G1 X205.749 Y98.942 E.86408
G1 X205.749 Y98.408 E.0159
G1 X226.251 Y77.907 E.86408
G1 X226.251 Y77.374 E.0159
G1 X205.749 Y97.875 E.86408
M73 P86 R10
G1 X205.749 Y97.341 E.0159
G1 X226.251 Y76.84 E.86408
G1 X226.251 Y76.307 E.0159
G1 X205.749 Y96.808 E.86408
G1 X205.749 Y96.274 E.0159
G1 X226.251 Y75.773 E.86408
G1 X226.251 Y75.239 E.0159
G1 X205.749 Y95.74 E.86408
G1 X205.749 Y95.207 E.0159
G1 X226.251 Y74.706 E.86408
G1 X226.251 Y74.172 E.0159
G1 X205.749 Y94.673 E.86408
G1 X205.749 Y94.14 E.0159
G1 X226.251 Y73.639 E.86408
G1 X226.251 Y73.105 E.0159
G1 X205.749 Y93.606 E.86408
G1 X205.749 Y93.073 E.0159
G1 X226.251 Y72.572 E.86408
G1 X226.251 Y72.038 E.0159
G1 X205.749 Y92.539 E.86408
G1 X205.749 Y92.005 E.0159
G1 X226.251 Y71.504 E.86408
G1 X226.251 Y70.971 E.0159
G1 X205.749 Y91.472 E.86408
G1 X205.749 Y90.938 E.0159
G1 X226.251 Y70.437 E.86408
G1 X226.251 Y69.904 E.0159
G1 X205.749 Y90.405 E.86408
G1 X205.749 Y89.871 E.0159
G1 X226.251 Y69.37 E.86408
G1 X226.251 Y68.837 E.0159
G1 X205.749 Y89.338 E.86408
G1 X205.749 Y88.804 E.0159
G1 X226.251 Y68.303 E.86408
G1 X226.251 Y67.769 E.0159
G1 X205.749 Y88.27 E.86408
G1 X205.749 Y87.737 E.0159
G1 X226.251 Y67.236 E.86408
G1 X226.251 Y66.702 E.0159
G1 X205.749 Y87.203 E.86408
G1 X205.749 Y86.67 E.0159
G1 X226.251 Y66.169 E.86408
G1 X226.251 Y65.635 E.0159
G1 X205.749 Y86.136 E.86408
G1 X205.749 Y85.603 E.0159
G1 X226.251 Y65.102 E.86408
G1 X226.251 Y64.568 E.0159
G1 X205.749 Y85.069 E.86408
G1 X205.749 Y84.536 E.0159
G1 X226.251 Y64.034 E.86408
G1 X226.251 Y63.501 E.0159
G1 X205.749 Y84.002 E.86408
G1 X205.749 Y83.468 E.0159
G1 X226.251 Y62.967 E.86408
G1 X226.251 Y62.434 E.0159
G1 X205.749 Y82.935 E.86408
G1 X205.749 Y82.401 E.0159
G1 X226.251 Y61.9 E.86408
G1 X226.251 Y61.367 E.0159
G1 X205.749 Y81.868 E.86408
G1 X205.749 Y81.334 E.0159
G1 X226.251 Y60.833 E.86408
G1 X226.251 Y60.299 E.0159
G1 X205.749 Y80.801 E.86408
G1 X205.749 Y80.267 E.0159
G1 X226.251 Y59.766 E.86408
G1 X226.251 Y59.232 E.0159
G1 X205.749 Y79.733 E.86408
G1 X205.749 Y79.2 E.0159
G1 X226.251 Y58.699 E.86408
G1 X226.251 Y58.165 E.0159
G1 X205.749 Y78.666 E.86408
G1 X205.749 Y78.133 E.0159
G1 X226.251 Y57.632 E.86408
G1 X226.251 Y57.098 E.0159
G1 X205.749 Y77.599 E.86408
G1 X205.749 Y77.066 E.0159
G1 X226.251 Y56.564 E.86408
G1 X226.251 Y56.031 E.0159
G1 X205.749 Y76.532 E.86408
G1 X205.749 Y75.998 E.0159
G1 X226.251 Y55.497 E.86408
G1 X226.251 Y54.964 E.0159
G1 X205.749 Y75.465 E.86408
G1 X205.749 Y74.931 E.0159
G1 X226.251 Y54.43 E.86408
G1 X226.251 Y53.897 E.0159
G1 X205.749 Y74.398 E.86408
G1 X205.749 Y73.864 E.0159
G1 X226.251 Y53.363 E.86408
G1 X226.251 Y52.829 E.0159
G1 X205.749 Y73.331 E.86408
G1 X205.749 Y72.797 E.0159
G1 X226.251 Y52.296 E.86408
G1 X226.251 Y51.762 E.0159
G1 X205.749 Y72.263 E.86408
G1 X205.749 Y71.73 E.0159
G1 X226.251 Y51.229 E.86408
G1 X226.251 Y50.695 E.0159
G1 X205.749 Y71.196 E.86408
G1 X205.749 Y70.663 E.0159
G1 X226.251 Y50.162 E.86408
G1 X226.251 Y49.628 E.0159
G1 X205.749 Y70.129 E.86408
G1 X205.749 Y69.596 E.0159
G1 X226.251 Y49.095 E.86408
G1 X226.251 Y48.561 E.0159
G1 X205.749 Y69.062 E.86408
G1 X205.749 Y68.528 E.0159
G1 X226.251 Y48.027 E.86408
G1 X226.251 Y47.494 E.0159
G1 X205.749 Y67.995 E.86408
G1 X205.749 Y67.461 E.0159
G1 X226.251 Y46.96 E.86408
G1 X226.251 Y46.427 E.0159
G1 X205.749 Y66.928 E.86408
G1 X205.749 Y66.394 E.0159
G1 X226.251 Y45.893 E.86408
G1 X226.251 Y45.36 E.0159
G1 X205.749 Y65.861 E.86408
G1 X205.749 Y65.327 E.0159
G1 X226.251 Y44.826 E.86408
G1 X226.251 Y44.292 E.0159
G1 X205.749 Y64.793 E.86408
G1 X205.749 Y64.26 E.0159
G1 X226.251 Y43.759 E.86408
G1 X226.251 Y43.225 E.0159
G1 X205.749 Y63.726 E.86408
G1 X205.749 Y63.193 E.0159
G1 X226.251 Y42.692 E.86408
G1 X226.251 Y42.158 E.0159
G1 X205.749 Y62.659 E.86408
G1 X205.749 Y62.126 E.0159
G1 X226.251 Y41.625 E.86408
G1 X226.251 Y41.091 E.0159
G1 X205.749 Y61.592 E.86408
G1 X205.749 Y61.058 E.0159
G1 X226.251 Y40.557 E.86408
G1 X226.251 Y40.024 E.0159
G1 X205.749 Y60.525 E.86408
G1 X205.749 Y59.991 E.0159
G1 X226.251 Y39.49 E.86408
G1 X226.251 Y38.957 E.0159
G1 X205.749 Y59.458 E.86408
G1 X205.749 Y58.924 E.0159
G1 X217.215 Y47.459 E.48324
G3 X216.503 Y47.637 I-1.251 J-3.489 E.0219
G1 X205.749 Y58.391 E.45325
G1 X205.749 Y57.857 E.0159
G1 X215.931 Y47.675 E.42915
G3 X215.444 Y47.629 I.223 J-4.954 E.0146
G1 X205.749 Y57.324 E.40861
G1 X205.749 Y56.79 E.0159
G1 X215.008 Y47.531 E.39025
G3 X214.614 Y47.392 I.499 J-2.04 E.01248
G1 X205.749 Y56.256 E.37363
G1 X205.749 Y55.723 E.0159
G1 X214.255 Y47.217 E.35851
G3 X213.929 Y47.01 I.873 J-1.74 E.01154
G1 X205.749 Y55.189 E.34474
G1 X205.749 Y54.656 E.0159
G1 X213.633 Y46.772 E.33229
G3 X213.367 Y46.505 I1.202 J-1.47 E.01126
G1 X205.496 Y54.376 E.33173
G1 X204.962 Y54.376 E.0159
G1 X213.128 Y46.21 E.34417
G3 X212.919 Y45.885 I1.518 J-1.206 E.01153
G1 X204.429 Y54.376 E.35786
G1 X203.895 Y54.376 E.0159
G1 X212.742 Y45.529 E.37288
G3 X212.6 Y45.137 I1.882 J-.905 E.01243
G1 X203.362 Y54.376 E.38938
G1 X202.828 Y54.376 E.0159
G1 X212.498 Y44.705 E.40758
G3 X212.453 Y44.217 I4.414 J-.658 E.01461
G1 X202.295 Y54.376 E.42815
G1 X201.761 Y54.376 E.0159
G1 X212.482 Y43.654 E.45187
G3 X212.649 Y42.954 I4.038 J.592 E.02149
G1 X201.227 Y54.376 E.4814
G1 X200.694 Y54.376 E.0159
G1 X221.195 Y33.874 E.86408
G1 X221.729 Y33.874 E.0159
G1 X214.829 Y40.774 E.2908
G3 X215.531 Y40.606 I1.35 J4.085 E.02153
G1 X222.262 Y33.874 E.28371
G1 X222.796 Y33.874 E.0159
G1 X216.091 Y40.58 E.28261
G3 X216.581 Y40.623 I.048 J2.266 E.0147
G1 X223.329 Y33.874 E.28443
G1 X223.863 Y33.874 E.0159
G1 X217.014 Y40.724 E.28867
G3 X217.404 Y40.867 I-.521 J2.022 E.01241
G1 X224.396 Y33.874 E.29472
G1 X224.93 Y33.874 E.0159
G1 X217.76 Y41.045 E.30222
G3 X218.084 Y41.254 I-.883 J1.723 E.01152
G1 X225.464 Y33.874 E.31104
G1 X225.997 Y33.874 E.0159
G1 X218.379 Y41.493 E.32111
G3 X218.645 Y41.76 I-1.203 J1.466 E.01126
G1 X226.251 Y34.155 E.32056
G1 X226.251 Y34.688 E.0159
G1 X218.883 Y42.056 E.31054
G3 X219.091 Y42.381 I-1.519 J1.205 E.01153
G1 X226.251 Y35.222 E.30175
G1 X226.251 Y35.755 E.0159
G1 X219.269 Y42.737 E.29427
G3 X219.408 Y43.132 I-6.874 J2.638 E.01247
G1 X226.251 Y36.289 E.28842
G1 X226.251 Y36.822 E.0159
G1 X219.504 Y43.569 E.28437
G3 X219.548 Y44.058 I-2.424 J.469 E.01465
G1 X226.251 Y37.356 E.28249
G1 X226.251 Y37.89 E.0159
G1 X219.511 Y44.629 E.28404
G3 X219.332 Y45.342 I-3.517 J-.506 E.02195
G1 X226.42 Y38.253 E.29875
; WIPE_START
G1 X225.006 Y39.668 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X218.446 Y43.569 Z3.2 F30000
G1 X199.991 Y54.545 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F9541.731
G1 X220.661 Y33.874 E.87123
G1 X220.128 Y33.874 E.0159
G1 X199.627 Y54.376 E.86408
G1 X199.093 Y54.376 E.0159
G1 X219.594 Y33.874 E.86408
G1 X219.061 Y33.874 E.0159
G1 X198.56 Y54.376 E.86408
G1 X198.026 Y54.376 E.0159
G1 X218.527 Y33.874 E.86408
G1 X217.994 Y33.874 E.0159
G1 X197.493 Y54.376 E.86408
G1 X196.959 Y54.376 E.0159
G1 X217.46 Y33.874 E.86408
G1 X216.926 Y33.874 E.0159
G1 X196.425 Y54.376 E.86408
G1 X195.892 Y54.376 E.0159
G1 X216.393 Y33.874 E.86408
G1 X215.859 Y33.874 E.0159
G1 X195.358 Y54.376 E.86408
G1 X194.825 Y54.376 E.0159
G1 X215.326 Y33.874 E.86408
G1 X214.792 Y33.874 E.0159
G1 X194.291 Y54.376 E.86408
G1 X193.758 Y54.376 E.0159
G1 X214.259 Y33.874 E.86408
G1 X213.725 Y33.874 E.0159
G1 X193.224 Y54.376 E.86408
G1 X192.69 Y54.376 E.0159
G1 X213.191 Y33.874 E.86408
G1 X212.658 Y33.874 E.0159
G1 X192.157 Y54.376 E.86408
G1 X191.623 Y54.376 E.0159
G1 X212.124 Y33.874 E.86408
G1 X211.591 Y33.874 E.0159
G1 X191.09 Y54.376 E.86408
G1 X190.556 Y54.376 E.0159
G1 X211.057 Y33.874 E.86408
G1 X210.524 Y33.874 E.0159
G1 X190.023 Y54.376 E.86408
G1 X189.489 Y54.376 E.0159
G1 X209.99 Y33.874 E.86408
G1 X209.456 Y33.874 E.0159
G1 X188.955 Y54.376 E.86408
G1 X188.422 Y54.376 E.0159
G1 X208.923 Y33.874 E.86408
G1 X208.389 Y33.874 E.0159
G1 X187.888 Y54.376 E.86408
G1 X187.355 Y54.376 E.0159
G1 X207.856 Y33.874 E.86408
G1 X207.322 Y33.874 E.0159
G1 X186.821 Y54.376 E.86408
G1 X186.288 Y54.376 E.0159
G1 X206.789 Y33.874 E.86408
G1 X206.255 Y33.874 E.0159
G1 X185.754 Y54.376 E.86408
G1 X185.22 Y54.376 E.0159
G1 X205.722 Y33.874 E.86408
G1 X205.188 Y33.874 E.0159
G1 X184.687 Y54.376 E.86408
G1 X184.153 Y54.376 E.0159
G1 X204.654 Y33.874 E.86408
G1 X204.121 Y33.874 E.0159
G1 X183.62 Y54.376 E.86408
G1 X183.086 Y54.376 E.0159
G1 X203.587 Y33.874 E.86408
G1 X203.054 Y33.874 E.0159
G1 X182.553 Y54.376 E.86408
G1 X182.019 Y54.376 E.0159
G1 X202.52 Y33.874 E.86408
G1 X201.987 Y33.874 E.0159
G1 X181.485 Y54.376 E.86408
G1 X180.952 Y54.376 E.0159
G1 X201.453 Y33.874 E.86408
G1 X200.919 Y33.874 E.0159
G1 X180.418 Y54.376 E.86408
G1 X179.885 Y54.376 E.0159
G1 X200.386 Y33.874 E.86408
G1 X199.852 Y33.874 E.0159
G1 X179.351 Y54.376 E.86408
G1 X178.818 Y54.376 E.0159
G1 X199.319 Y33.874 E.86408
G1 X198.785 Y33.874 E.0159
G1 X178.284 Y54.376 E.86408
G1 X177.75 Y54.376 E.0159
G1 X198.252 Y33.874 E.86408
G1 X197.718 Y33.874 E.0159
G1 X177.217 Y54.376 E.86408
G1 X176.683 Y54.376 E.0159
G1 X197.184 Y33.874 E.86408
G1 X196.651 Y33.874 E.0159
G1 X176.15 Y54.376 E.86408
G1 X175.616 Y54.376 E.0159
G1 X196.117 Y33.874 E.86408
G1 X195.584 Y33.874 E.0159
G1 X175.083 Y54.376 E.86408
G1 X174.549 Y54.376 E.0159
G1 X195.05 Y33.874 E.86408
G1 X194.517 Y33.874 E.0159
G1 X174.015 Y54.376 E.86408
G1 X173.482 Y54.376 E.0159
G1 X193.983 Y33.874 E.86408
G1 X193.449 Y33.874 E.0159
G1 X172.948 Y54.376 E.86408
G1 X172.415 Y54.376 E.0159
G1 X192.916 Y33.874 E.86408
G1 X192.382 Y33.874 E.0159
G1 X171.881 Y54.376 E.86408
G1 X171.348 Y54.376 E.0159
G1 X191.849 Y33.874 E.86408
G1 X191.315 Y33.874 E.0159
G1 X170.814 Y54.376 E.86408
G1 X170.281 Y54.376 E.0159
G1 X190.782 Y33.874 E.86408
G1 X190.248 Y33.874 E.0159
G1 X169.747 Y54.376 E.86408
G1 X169.213 Y54.376 E.0159
G1 X189.714 Y33.874 E.86408
G1 X189.181 Y33.874 E.0159
G1 X168.68 Y54.376 E.86408
G1 X168.146 Y54.376 E.0159
G1 X188.647 Y33.874 E.86408
G1 X188.114 Y33.874 E.0159
G1 X167.613 Y54.376 E.86408
G1 X167.079 Y54.376 E.0159
G1 X187.58 Y33.874 E.86408
G1 X187.047 Y33.874 E.0159
G1 X166.546 Y54.376 E.86408
G1 X166.012 Y54.376 E.0159
G1 X186.513 Y33.874 E.86408
G1 X185.979 Y33.874 E.0159
G1 X165.478 Y54.376 E.86408
G1 X164.945 Y54.376 E.0159
G1 X185.446 Y33.874 E.86408
G1 X184.912 Y33.874 E.0159
G1 X164.411 Y54.376 E.86408
G1 X163.878 Y54.376 E.0159
G1 X184.379 Y33.874 E.86408
G1 X183.845 Y33.874 E.0159
G1 X163.344 Y54.376 E.86408
G1 X162.811 Y54.376 E.0159
G1 X183.312 Y33.874 E.86408
G1 X182.778 Y33.874 E.0159
G1 X162.277 Y54.376 E.86408
G1 X161.743 Y54.376 E.0159
G1 X182.244 Y33.874 E.86408
G1 X181.711 Y33.874 E.0159
G1 X161.21 Y54.376 E.86408
G1 X160.676 Y54.376 E.0159
G1 X181.177 Y33.874 E.86408
G1 X180.644 Y33.874 E.0159
G1 X160.143 Y54.376 E.86408
G1 X159.609 Y54.376 E.0159
G1 X180.11 Y33.874 E.86408
G1 X179.577 Y33.874 E.0159
G1 X159.076 Y54.376 E.86408
G1 X158.542 Y54.376 E.0159
G1 X179.043 Y33.874 E.86408
G1 X178.51 Y33.874 E.0159
G1 X158.008 Y54.376 E.86408
G1 X157.475 Y54.376 E.0159
G1 X177.976 Y33.874 E.86408
G1 X177.442 Y33.874 E.0159
G1 X156.941 Y54.376 E.86408
G1 X156.408 Y54.376 E.0159
G1 X176.909 Y33.874 E.86408
G1 X176.375 Y33.874 E.0159
G1 X155.874 Y54.376 E.86408
G1 X155.341 Y54.376 E.0159
G1 X175.842 Y33.874 E.86408
G1 X175.308 Y33.874 E.0159
G1 X154.807 Y54.376 E.86408
G1 X154.273 Y54.376 E.0159
G1 X174.775 Y33.874 E.86408
G1 X174.241 Y33.874 E.0159
G1 X153.74 Y54.376 E.86408
G1 X153.206 Y54.376 E.0159
G1 X173.707 Y33.874 E.86408
G1 X173.174 Y33.874 E.0159
G1 X152.673 Y54.376 E.86408
G1 X152.139 Y54.376 E.0159
G1 X172.64 Y33.874 E.86408
G1 X172.107 Y33.874 E.0159
G1 X151.606 Y54.376 E.86408
G1 X151.072 Y54.376 E.0159
G1 X171.573 Y33.874 E.86408
G1 X171.04 Y33.874 E.0159
G1 X150.538 Y54.376 E.86408
G1 X150.005 Y54.376 E.0159
G1 X170.506 Y33.874 E.86408
G1 X169.972 Y33.874 E.0159
G1 X149.471 Y54.376 E.86408
G1 X148.938 Y54.376 E.0159
G1 X169.439 Y33.874 E.86408
G1 X168.905 Y33.874 E.0159
G1 X148.404 Y54.376 E.86408
G1 X147.871 Y54.376 E.0159
G1 X168.372 Y33.874 E.86408
G1 X167.838 Y33.874 E.0159
G1 X147.337 Y54.376 E.86408
G1 X146.803 Y54.376 E.0159
G1 X167.305 Y33.874 E.86408
G1 X166.771 Y33.874 E.0159
G1 X146.27 Y54.376 E.86408
G1 X145.736 Y54.376 E.0159
G1 X166.237 Y33.874 E.86408
G1 X165.704 Y33.874 E.0159
G1 X145.203 Y54.376 E.86408
G1 X144.669 Y54.376 E.0159
G1 X165.17 Y33.874 E.86408
G1 X164.637 Y33.874 E.0159
G1 X144.136 Y54.376 E.86408
G1 X143.602 Y54.376 E.0159
G1 X164.103 Y33.874 E.86408
G1 X163.57 Y33.874 E.0159
G1 X143.068 Y54.376 E.86408
G1 X142.535 Y54.376 E.0159
G1 X163.036 Y33.874 E.86408
G1 X162.502 Y33.874 E.0159
G1 X142.001 Y54.376 E.86408
G1 X141.468 Y54.376 E.0159
G1 X161.969 Y33.874 E.86408
G1 X161.435 Y33.874 E.0159
G1 X140.934 Y54.376 E.86408
G1 X140.401 Y54.376 E.0159
G1 X160.902 Y33.874 E.86408
G1 X160.368 Y33.874 E.0159
G1 X139.867 Y54.376 E.86408
G1 X139.334 Y54.376 E.0159
G1 X159.835 Y33.874 E.86408
G1 X159.301 Y33.874 E.0159
G1 X138.8 Y54.376 E.86408
G1 X138.266 Y54.376 E.0159
G1 X158.767 Y33.874 E.86408
G1 X158.234 Y33.874 E.0159
G1 X137.733 Y54.376 E.86408
G1 X137.199 Y54.376 E.0159
G1 X157.7 Y33.874 E.86408
G1 X157.167 Y33.874 E.0159
G1 X136.666 Y54.376 E.86408
G1 X136.132 Y54.376 E.0159
G1 X156.633 Y33.874 E.86408
M73 P86 R9
G1 X156.1 Y33.874 E.0159
G1 X135.599 Y54.376 E.86408
G1 X135.065 Y54.376 E.0159
G1 X155.566 Y33.874 E.86408
G1 X155.032 Y33.874 E.0159
G1 X134.531 Y54.376 E.86408
G1 X133.998 Y54.376 E.0159
G1 X154.499 Y33.874 E.86408
G1 X153.965 Y33.874 E.0159
G1 X133.464 Y54.376 E.86408
G1 X132.931 Y54.376 E.0159
G1 X153.432 Y33.874 E.86408
G1 X152.898 Y33.874 E.0159
G1 X132.397 Y54.376 E.86408
G1 X131.864 Y54.376 E.0159
G1 X152.365 Y33.874 E.86408
M73 P87 R9
G1 X151.831 Y33.874 E.0159
G1 X131.33 Y54.376 E.86408
G1 X130.796 Y54.376 E.0159
G1 X151.297 Y33.874 E.86408
G1 X150.764 Y33.874 E.0159
G1 X130.263 Y54.376 E.86408
G1 X129.729 Y54.376 E.0159
G1 X150.23 Y33.874 E.86408
G1 X149.697 Y33.874 E.0159
G1 X129.196 Y54.376 E.86408
G1 X128.662 Y54.376 E.0159
G1 X149.163 Y33.874 E.86408
G1 X148.63 Y33.874 E.0159
G1 X128.129 Y54.376 E.86408
G1 X127.595 Y54.376 E.0159
G1 X148.096 Y33.874 E.86408
G1 X147.563 Y33.874 E.0159
G1 X127.061 Y54.376 E.86408
G1 X126.528 Y54.376 E.0159
G1 X147.029 Y33.874 E.86408
G1 X146.495 Y33.874 E.0159
G1 X125.994 Y54.376 E.86408
G1 X125.461 Y54.376 E.0159
G1 X145.962 Y33.874 E.86408
G1 X145.428 Y33.874 E.0159
G1 X124.927 Y54.376 E.86408
G1 X124.394 Y54.376 E.0159
G1 X144.895 Y33.874 E.86408
G1 X144.361 Y33.874 E.0159
G1 X123.86 Y54.376 E.86408
G1 X123.326 Y54.376 E.0159
G1 X143.828 Y33.874 E.86408
G1 X143.294 Y33.874 E.0159
G1 X122.793 Y54.376 E.86408
G1 X122.259 Y54.376 E.0159
G1 X129.156 Y47.479 E.29069
G3 X128.459 Y47.642 I-1.159 J-3.368 E.02139
G1 X121.726 Y54.376 E.28378
G1 X121.192 Y54.376 E.0159
G1 X127.894 Y47.674 E.28245
G3 X127.411 Y47.623 I.015 J-2.44 E.01448
G1 X120.659 Y54.376 E.2846
G1 X120.125 Y54.376 E.0159
G1 X126.978 Y47.522 E.28885
G3 X126.586 Y47.381 I.512 J-2.029 E.01244
G1 X119.591 Y54.376 E.29482
G1 X119.058 Y54.376 E.0159
G1 X126.23 Y47.204 E.30228
G3 X125.907 Y46.993 I6.44 J-10.217 E.01149
G1 X118.524 Y54.376 E.31116
G1 X117.991 Y54.376 E.0159
G1 X125.614 Y46.753 E.32129
G3 X125.349 Y46.484 I1.213 J-1.461 E.01126
G1 X117.457 Y54.376 E.33262
G1 X116.924 Y54.376 E.0159
G1 X125.112 Y46.187 E.34514
G3 X124.906 Y45.86 I1.531 J-1.197 E.01154
G1 X116.39 Y54.376 E.35892
G1 X115.856 Y54.376 E.0159
G1 X124.731 Y45.501 E.37403
G3 X124.591 Y45.108 I1.901 J-.896 E.01247
G1 X115.323 Y54.376 E.39063
G1 X114.789 Y54.376 E.0159
G1 X124.492 Y44.673 E.40894
G3 X124.453 Y44.179 I4.856 J-.632 E.01479
G1 X114.256 Y54.376 E.42978
G1 X113.722 Y54.376 E.0159
G1 X124.486 Y43.611 E.45369
G3 X124.669 Y42.895 I2.417 J.234 E.0221
G1 X113.189 Y54.376 E.48387
G1 X112.655 Y54.376 E.0159
G1 X133.156 Y33.874 E.86408
G1 X133.69 Y33.874 E.0159
G1 X126.765 Y40.799 E.29186
G3 X127.484 Y40.614 I1.287 J3.512 E.02215
G1 X134.223 Y33.874 E.28406
G1 X134.757 Y33.874 E.0159
G1 X128.052 Y40.579 E.28258
G3 X128.546 Y40.618 I.067 J2.278 E.0148
G1 X135.29 Y33.874 E.28425
G1 X135.824 Y33.874 E.0159
G1 X128.985 Y40.714 E.28826
G3 X129.377 Y40.855 I-.508 J2.029 E.01245
G1 X136.358 Y33.874 E.29421
G1 X136.891 Y33.874 E.0159
G1 X129.735 Y41.031 E.30162
G3 X130.061 Y41.238 I-.872 J1.732 E.01154
G1 X137.425 Y33.874 E.31036
G1 X137.958 Y33.874 E.0159
G1 X130.358 Y41.475 E.32034
G3 X130.626 Y41.74 I-1.188 J1.469 E.01126
G1 X138.492 Y33.874 E.33152
G1 X139.025 Y33.874 E.0159
G1 X130.866 Y42.034 E.3439
G3 X131.077 Y42.357 I-1.507 J1.213 E.01151
G1 X139.559 Y33.874 E.35752
G1 X140.093 Y33.874 E.0159
G1 X131.256 Y42.711 E.37244
G3 X131.4 Y43.101 I-6.594 J2.648 E.01239
G1 X140.626 Y33.874 E.38888
G1 X141.16 Y33.874 E.0159
G1 X131.498 Y43.536 E.4072
G3 X131.546 Y44.021 I-2.406 J.483 E.01457
G1 X141.693 Y33.874 E.42767
G1 X142.227 Y33.874 E.0159
G1 X131.518 Y44.583 E.45135
G3 X131.354 Y45.281 I-3.633 J-.486 E.02139
G1 X142.93 Y33.705 E.4879
; WIPE_START
G1 X141.516 Y35.119 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X135.137 Y39.31 Z3.2 F30000
G1 X111.952 Y54.545 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F9541.731
G1 X132.623 Y33.874 E.87123
G1 X132.089 Y33.874 E.0159
G1 X111.588 Y54.376 E.86408
G1 X111.054 Y54.376 E.0159
G1 X131.555 Y33.874 E.86408
G1 X131.022 Y33.874 E.0159
G1 X110.521 Y54.376 E.86408
G1 X109.987 Y54.376 E.0159
G1 X130.488 Y33.874 E.86408
G1 X129.955 Y33.874 E.0159
G1 X109.454 Y54.376 E.86408
G1 X108.92 Y54.376 E.0159
G1 X129.421 Y33.874 E.86408
G1 X128.888 Y33.874 E.0159
G1 X108.387 Y54.376 E.86408
G1 X107.853 Y54.376 E.0159
G1 X128.354 Y33.874 E.86408
G1 X127.82 Y33.874 E.0159
G1 X107.319 Y54.376 E.86408
G1 X106.786 Y54.376 E.0159
G1 X127.287 Y33.874 E.86408
G1 X126.753 Y33.874 E.0159
G1 X106.252 Y54.376 E.86408
G1 X105.719 Y54.376 E.0159
G1 X126.22 Y33.874 E.86408
G1 X125.686 Y33.874 E.0159
G1 X105.185 Y54.376 E.86408
G1 X104.652 Y54.376 E.0159
G1 X125.153 Y33.874 E.86408
G1 X124.619 Y33.874 E.0159
G1 X104.118 Y54.376 E.86408
G1 X103.584 Y54.376 E.0159
G1 X124.085 Y33.874 E.86408
G1 X123.552 Y33.874 E.0159
G1 X103.051 Y54.376 E.86408
G1 X102.517 Y54.376 E.0159
G1 X123.018 Y33.874 E.86408
G1 X122.485 Y33.874 E.0159
G1 X101.984 Y54.376 E.86408
G1 X101.45 Y54.376 E.0159
G1 X121.951 Y33.874 E.86408
G1 X121.418 Y33.874 E.0159
G1 X100.917 Y54.376 E.86408
G1 X100.383 Y54.376 E.0159
G1 X120.884 Y33.874 E.86408
G1 X120.351 Y33.874 E.0159
G1 X99.849 Y54.376 E.86408
G1 X99.316 Y54.376 E.0159
G1 X119.817 Y33.874 E.86408
G1 X119.283 Y33.874 E.0159
G1 X98.782 Y54.376 E.86408
G1 X98.249 Y54.376 E.0159
G1 X118.75 Y33.874 E.86408
G1 X118.216 Y33.874 E.0159
G1 X97.715 Y54.376 E.86408
G1 X97.182 Y54.376 E.0159
G1 X117.683 Y33.874 E.86408
G1 X117.149 Y33.874 E.0159
G1 X96.648 Y54.376 E.86408
G1 X96.114 Y54.376 E.0159
G1 X116.616 Y33.874 E.86408
G1 X116.082 Y33.874 E.0159
G1 X95.581 Y54.376 E.86408
G1 X95.047 Y54.376 E.0159
G1 X115.548 Y33.874 E.86408
G1 X115.015 Y33.874 E.0159
G1 X94.514 Y54.376 E.86408
G1 X93.98 Y54.376 E.0159
G1 X114.481 Y33.874 E.86408
G1 X113.948 Y33.874 E.0159
G1 X93.447 Y54.376 E.86408
G1 X92.913 Y54.376 E.0159
G1 X113.414 Y33.874 E.86408
G1 X112.881 Y33.874 E.0159
G1 X92.379 Y54.376 E.86408
G1 X91.846 Y54.376 E.0159
G1 X112.347 Y33.874 E.86408
G1 X111.813 Y33.874 E.0159
G1 X91.312 Y54.376 E.86408
G1 X90.779 Y54.376 E.0159
G1 X111.28 Y33.874 E.86408
G1 X110.746 Y33.874 E.0159
G1 X90.245 Y54.376 E.86408
G1 X89.712 Y54.376 E.0159
G1 X110.213 Y33.874 E.86408
G1 X109.679 Y33.874 E.0159
G1 X89.178 Y54.376 E.86408
G1 X88.644 Y54.376 E.0159
G1 X109.146 Y33.874 E.86408
G1 X108.612 Y33.874 E.0159
G1 X88.111 Y54.376 E.86408
G1 X87.577 Y54.376 E.0159
G1 X108.078 Y33.874 E.86408
G1 X107.545 Y33.874 E.0159
G1 X87.044 Y54.376 E.86408
G1 X86.51 Y54.376 E.0159
G1 X107.011 Y33.874 E.86408
G1 X106.478 Y33.874 E.0159
G1 X85.977 Y54.376 E.86408
G1 X85.443 Y54.376 E.0159
G1 X105.944 Y33.874 E.86408
G1 X105.411 Y33.874 E.0159
G1 X84.91 Y54.376 E.86408
G1 X84.376 Y54.376 E.0159
G1 X104.877 Y33.874 E.86408
G1 X104.343 Y33.874 E.0159
G1 X83.842 Y54.376 E.86408
G1 X83.309 Y54.376 E.0159
G1 X103.81 Y33.874 E.86408
G1 X103.276 Y33.874 E.0159
G1 X82.775 Y54.376 E.86408
G1 X82.242 Y54.376 E.0159
G1 X102.743 Y33.874 E.86408
G1 X102.209 Y33.874 E.0159
G1 X81.708 Y54.376 E.86408
G1 X81.175 Y54.376 E.0159
G1 X101.676 Y33.874 E.86408
G1 X101.142 Y33.874 E.0159
G1 X80.641 Y54.376 E.86408
G1 X80.107 Y54.376 E.0159
G1 X100.608 Y33.874 E.86408
G1 X100.075 Y33.874 E.0159
G1 X79.574 Y54.376 E.86408
G1 X79.04 Y54.376 E.0159
G1 X99.541 Y33.874 E.86408
G1 X99.008 Y33.874 E.0159
G1 X78.507 Y54.376 E.86408
G1 X77.973 Y54.376 E.0159
G1 X98.474 Y33.874 E.86408
G1 X97.941 Y33.874 E.0159
G1 X77.44 Y54.376 E.86408
G1 X76.906 Y54.376 E.0159
G1 X97.407 Y33.874 E.86408
G1 X96.873 Y33.874 E.0159
G1 X76.372 Y54.376 E.86408
G1 X75.839 Y54.376 E.0159
G1 X96.34 Y33.874 E.86408
G1 X95.806 Y33.874 E.0159
G1 X75.305 Y54.376 E.86408
G1 X74.772 Y54.376 E.0159
G1 X95.273 Y33.874 E.86408
G1 X94.739 Y33.874 E.0159
G1 X74.238 Y54.376 E.86408
G1 X73.705 Y54.376 E.0159
G1 X94.206 Y33.874 E.86408
G1 X93.672 Y33.874 E.0159
G1 X73.171 Y54.376 E.86408
G1 X72.637 Y54.376 E.0159
G1 X93.139 Y33.874 E.86408
G1 X92.605 Y33.874 E.0159
G1 X72.104 Y54.376 E.86408
G1 X71.57 Y54.376 E.0159
G1 X92.071 Y33.874 E.86408
G1 X91.538 Y33.874 E.0159
G1 X71.037 Y54.376 E.86408
G1 X70.503 Y54.376 E.0159
G1 X91.004 Y33.874 E.86408
G1 X90.471 Y33.874 E.0159
G1 X69.97 Y54.376 E.86408
G1 X69.436 Y54.376 E.0159
G1 X89.937 Y33.874 E.86408
G1 X89.404 Y33.874 E.0159
G1 X68.902 Y54.376 E.86408
G1 X68.369 Y54.376 E.0159
G1 X88.87 Y33.874 E.86408
G1 X88.336 Y33.874 E.0159
G1 X67.835 Y54.376 E.86408
G1 X67.302 Y54.376 E.0159
G1 X87.803 Y33.874 E.86408
G1 X87.269 Y33.874 E.0159
G1 X66.768 Y54.376 E.86408
G1 X66.235 Y54.376 E.0159
G1 X86.736 Y33.874 E.86408
G1 X86.202 Y33.874 E.0159
G1 X65.701 Y54.376 E.86408
G1 X65.167 Y54.376 E.0159
G1 X85.669 Y33.874 E.86408
G1 X85.135 Y33.874 E.0159
G1 X64.634 Y54.376 E.86408
G1 X64.1 Y54.376 E.0159
G1 X84.601 Y33.874 E.86408
G1 X84.068 Y33.874 E.0159
G1 X63.567 Y54.376 E.86408
G1 X63.033 Y54.376 E.0159
G1 X83.534 Y33.874 E.86408
G1 X83.001 Y33.874 E.0159
G1 X62.5 Y54.376 E.86408
G1 X61.966 Y54.376 E.0159
G1 X82.467 Y33.874 E.86408
G1 X81.934 Y33.874 E.0159
G1 X61.432 Y54.376 E.86408
G1 X60.899 Y54.376 E.0159
G1 X81.4 Y33.874 E.86408
G1 X80.866 Y33.874 E.0159
G1 X60.365 Y54.376 E.86408
G1 X59.832 Y54.376 E.0159
G1 X80.333 Y33.874 E.86408
G1 X79.799 Y33.874 E.0159
G1 X59.298 Y54.376 E.86408
G1 X58.765 Y54.376 E.0159
G1 X79.266 Y33.874 E.86408
G1 X78.732 Y33.874 E.0159
G1 X58.231 Y54.376 E.86408
G1 X57.697 Y54.376 E.0159
G1 X78.199 Y33.874 E.86408
G1 X77.665 Y33.874 E.0159
G1 X57.164 Y54.376 E.86408
G1 X56.63 Y54.376 E.0159
G1 X77.131 Y33.874 E.86408
G1 X76.598 Y33.874 E.0159
G1 X56.097 Y54.376 E.86408
G1 X55.563 Y54.376 E.0159
G1 X76.064 Y33.874 E.86408
G1 X75.531 Y33.874 E.0159
G1 X55.03 Y54.376 E.86408
G1 X54.496 Y54.376 E.0159
G1 X74.997 Y33.874 E.86408
G1 X74.464 Y33.874 E.0159
G1 X53.963 Y54.376 E.86408
G1 X53.429 Y54.376 E.0159
G1 X73.93 Y33.874 E.86408
G1 X73.396 Y33.874 E.0159
G1 X52.895 Y54.376 E.86408
G1 X52.362 Y54.376 E.0159
G1 X72.863 Y33.874 E.86408
G1 X72.329 Y33.874 E.0159
G1 X51.828 Y54.376 E.86408
G1 X51.295 Y54.376 E.0159
G1 X71.796 Y33.874 E.86408
G1 X71.262 Y33.874 E.0159
G1 X50.761 Y54.376 E.86408
G1 X50.251 Y54.376 E.01522
G1 X50.251 Y54.886 E.01522
G1 X29.749 Y75.387 E.86408
G1 X29.749 Y75.921 E.0159
G1 X50.251 Y55.42 E.86408
G1 X50.251 Y55.953 E.0159
G1 X29.749 Y76.454 E.86408
G1 X29.749 Y76.988 E.0159
G1 X50.251 Y56.487 E.86408
G1 X50.251 Y57.02 E.0159
G1 X29.749 Y77.521 E.86408
G1 X29.749 Y78.055 E.0159
G1 X50.251 Y57.554 E.86408
G1 X50.251 Y58.088 E.0159
G1 X29.749 Y78.589 E.86408
G1 X29.749 Y79.122 E.0159
G1 X50.251 Y58.621 E.86408
G1 X50.251 Y59.155 E.0159
G1 X29.749 Y79.656 E.86408
G1 X29.749 Y80.189 E.0159
G1 X50.251 Y59.688 E.86408
G1 X50.251 Y60.222 E.0159
G1 X29.749 Y80.723 E.86408
G1 X29.749 Y81.256 E.0159
G1 X50.251 Y60.755 E.86408
G1 X50.251 Y61.289 E.0159
G1 X29.749 Y81.79 E.86408
G1 X29.749 Y82.324 E.0159
G1 X50.251 Y61.822 E.86408
G1 X50.251 Y62.356 E.0159
G1 X29.749 Y82.857 E.86408
G1 X29.749 Y83.391 E.0159
G1 X50.251 Y62.89 E.86408
G1 X50.251 Y63.423 E.0159
G1 X29.749 Y83.924 E.86408
G1 X29.749 Y84.458 E.0159
G1 X50.251 Y63.957 E.86408
G1 X50.251 Y64.49 E.0159
G1 X29.749 Y84.991 E.86408
G1 X29.749 Y85.525 E.0159
G1 X50.251 Y65.024 E.86408
G1 X50.251 Y65.557 E.0159
G1 X29.749 Y86.059 E.86408
G1 X29.749 Y86.592 E.0159
G1 X50.251 Y66.091 E.86408
G1 X50.251 Y66.625 E.0159
G1 X29.749 Y87.126 E.86408
G1 X29.749 Y87.659 E.0159
G1 X50.251 Y67.158 E.86408
G1 X50.251 Y67.692 E.0159
G1 X29.749 Y88.193 E.86408
G1 X29.749 Y88.726 E.0159
G1 X50.251 Y68.225 E.86408
G1 X50.251 Y68.759 E.0159
G1 X29.749 Y89.26 E.86408
G1 X29.749 Y89.794 E.0159
G1 X50.251 Y69.292 E.86408
G1 X50.251 Y69.826 E.0159
G1 X29.749 Y90.327 E.86408
G1 X29.749 Y90.861 E.0159
G1 X50.251 Y70.36 E.86408
G1 X50.251 Y70.893 E.0159
G1 X29.749 Y91.394 E.86408
G1 X29.749 Y91.928 E.0159
G1 X50.251 Y71.427 E.86408
G1 X50.251 Y71.96 E.0159
G1 X29.749 Y92.461 E.86408
G1 X29.749 Y92.995 E.0159
G1 X50.251 Y72.494 E.86408
G1 X50.251 Y73.027 E.0159
G1 X29.749 Y93.529 E.86408
G1 X29.749 Y94.062 E.0159
G1 X50.251 Y73.561 E.86408
G1 X50.251 Y74.095 E.0159
G1 X29.749 Y94.596 E.86408
G1 X29.749 Y95.129 E.0159
G1 X50.251 Y74.628 E.86408
G1 X50.251 Y75.162 E.0159
G1 X29.749 Y95.663 E.86408
G1 X29.749 Y96.196 E.0159
G1 X50.251 Y75.695 E.86408
G1 X50.251 Y76.229 E.0159
G1 X29.749 Y96.73 E.86408
G1 X29.749 Y97.263 E.0159
G1 X50.251 Y76.762 E.86408
G1 X50.251 Y77.296 E.0159
G1 X29.749 Y97.797 E.86408
G1 X29.749 Y98.331 E.0159
G1 X50.251 Y77.83 E.86408
G1 X50.251 Y78.363 E.0159
G1 X29.749 Y98.864 E.86408
G1 X29.749 Y99.398 E.0159
G1 X50.251 Y78.897 E.86408
G1 X50.251 Y79.43 E.0159
G1 X29.749 Y99.931 E.86408
G1 X29.749 Y100.465 E.0159
G1 X50.251 Y79.964 E.86408
G1 X50.251 Y80.497 E.0159
G1 X29.749 Y100.998 E.86408
G1 X29.749 Y101.532 E.0159
G1 X50.251 Y81.031 E.86408
G1 X50.251 Y81.565 E.0159
G1 X29.749 Y102.066 E.86408
G1 X29.749 Y102.599 E.0159
G1 X50.251 Y82.098 E.86408
G1 X50.251 Y82.632 E.0159
G1 X29.749 Y103.133 E.86408
G1 X29.749 Y103.666 E.0159
G1 X50.251 Y83.165 E.86408
G1 X50.251 Y83.699 E.0159
G1 X29.749 Y104.2 E.86408
G1 X29.749 Y104.733 E.0159
G1 X50.251 Y84.232 E.86408
G1 X50.251 Y84.766 E.0159
G1 X29.749 Y105.267 E.86408
G1 X29.749 Y105.801 E.0159
G1 X50.251 Y85.3 E.86408
G1 X50.251 Y85.833 E.0159
G1 X29.749 Y106.334 E.86408
G1 X29.749 Y106.868 E.0159
G1 X50.251 Y86.367 E.86408
G1 X50.251 Y86.9 E.0159
G1 X29.749 Y107.401 E.86408
G1 X29.749 Y107.935 E.0159
G1 X50.251 Y87.434 E.86408
G1 X50.251 Y87.967 E.0159
G1 X29.749 Y108.468 E.86408
G1 X29.749 Y109.002 E.0159
G1 X50.251 Y88.501 E.86408
G1 X50.251 Y89.034 E.0159
G1 X29.749 Y109.536 E.86408
G1 X29.749 Y110.069 E.0159
G1 X50.251 Y89.568 E.86408
G1 X50.251 Y90.102 E.0159
G1 X29.749 Y110.603 E.86408
G1 X29.749 Y111.136 E.0159
G1 X50.251 Y90.635 E.86408
M73 P88 R9
G1 X50.251 Y91.169 E.0159
G1 X29.749 Y111.67 E.86408
G1 X29.749 Y112.203 E.0159
G1 X50.251 Y91.702 E.86408
G1 X50.251 Y92.236 E.0159
G1 X29.749 Y112.737 E.86408
G1 X29.749 Y113.271 E.0159
G1 X50.251 Y92.769 E.86408
G1 X50.251 Y93.303 E.0159
G1 X29.749 Y113.804 E.86408
G1 X29.749 Y114.338 E.0159
G1 X50.251 Y93.837 E.86408
G1 X50.251 Y94.37 E.0159
G1 X29.749 Y114.871 E.86408
G1 X29.749 Y115.405 E.0159
G1 X50.251 Y94.904 E.86408
G1 X50.251 Y95.437 E.0159
G1 X29.749 Y115.938 E.86408
G1 X29.749 Y116.472 E.0159
G1 X50.251 Y95.971 E.86408
G1 X50.251 Y96.504 E.0159
G1 X29.749 Y117.006 E.86408
G1 X29.749 Y117.539 E.0159
G1 X50.251 Y97.038 E.86408
G1 X50.251 Y97.572 E.0159
G1 X29.749 Y118.073 E.86408
G1 X29.749 Y118.606 E.0159
G1 X50.251 Y98.105 E.86408
G1 X50.251 Y98.639 E.0159
G1 X29.749 Y119.14 E.86408
G1 X29.749 Y119.673 E.0159
G1 X50.251 Y99.172 E.86408
G1 X50.251 Y99.706 E.0159
G1 X29.749 Y120.207 E.86408
G1 X29.749 Y120.74 E.0159
G1 X50.251 Y100.239 E.86408
G1 X50.251 Y100.773 E.0159
G1 X29.749 Y121.274 E.86408
G1 X29.749 Y121.808 E.0159
G1 X50.251 Y101.307 E.86408
G1 X50.251 Y101.84 E.0159
G1 X29.749 Y122.341 E.86408
G1 X29.749 Y122.875 E.0159
G1 X50.251 Y102.374 E.86408
G1 X50.251 Y102.907 E.0159
G1 X29.749 Y123.408 E.86408
G1 X29.749 Y123.942 E.0159
G1 X50.251 Y103.441 E.86408
G1 X50.251 Y103.974 E.0159
G1 X29.749 Y124.475 E.86408
G1 X29.749 Y125.009 E.0159
G1 X50.251 Y104.508 E.86408
G1 X50.251 Y105.042 E.0159
G1 X29.749 Y125.543 E.86408
G1 X29.749 Y126.076 E.0159
G1 X50.251 Y105.575 E.86408
G1 X50.251 Y106.109 E.0159
G1 X29.749 Y126.61 E.86408
G1 X29.749 Y127.143 E.0159
G1 X50.251 Y106.642 E.86408
G1 X50.251 Y107.176 E.0159
G1 X29.749 Y127.677 E.86408
G1 X29.749 Y128.21 E.0159
G1 X50.251 Y107.709 E.86408
G1 X50.251 Y108.243 E.0159
G1 X29.749 Y128.744 E.86408
G1 X29.749 Y129.278 E.0159
G1 X50.251 Y108.777 E.86408
G1 X50.251 Y109.31 E.0159
G1 X29.749 Y129.811 E.86408
G1 X29.749 Y130.345 E.0159
G1 X50.251 Y109.844 E.86408
G1 X50.251 Y110.377 E.0159
G1 X29.58 Y131.048 E.87123
; WIPE_START
G1 X30.994 Y129.634 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X37.88 Y126.341 Z3.2 F30000
G1 X50.42 Y120.345 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F9541.731
G1 X43.168 Y127.598 E.30569
G2 X43.465 Y126.767 I-3.314 J-1.656 E.02638
G1 X50.251 Y119.981 E.28599
G1 X50.251 Y119.448 E.0159
G1 X43.544 Y126.155 E.28267
G2 X43.532 Y125.633 I-4.863 J-.149 E.01556
G1 X50.251 Y118.914 E.28318
G1 X50.251 Y118.381 E.0159
G1 X43.452 Y125.18 E.28656
G2 X43.327 Y124.77 I-2.11 J.417 E.01277
G1 X50.251 Y117.847 E.2918
G1 X50.251 Y117.314 E.0159
G1 X43.166 Y124.398 E.29861
G2 X42.971 Y124.059 I-1.793 J.804 E.01167
G1 X50.251 Y116.78 E.30681
G1 X50.251 Y116.246 E.0159
G1 X42.746 Y123.751 E.31629
G2 X42.492 Y123.471 I-1.528 J1.132 E.01128
G1 X50.251 Y115.713 E.32699
G1 X50.251 Y115.179 E.0159
G1 X42.21 Y123.22 E.3389
G2 X41.897 Y122.999 I-1.258 J1.451 E.01143
G1 X50.251 Y114.646 E.35208
G1 X50.251 Y114.112 E.0159
G1 X41.553 Y122.809 E.36657
G2 X41.176 Y122.653 I-.969 J1.807 E.01219
G1 X50.251 Y113.579 E.38247
G1 X50.251 Y113.045 E.0159
G1 X40.76 Y122.535 E.39999
G2 X40.3 Y122.463 I-.594 J2.271 E.01393
G1 X50.251 Y112.512 E.41942
G1 X50.251 Y111.978 E.0159
G1 X39.768 Y122.46 E.44181
G2 X39.137 Y122.558 I.264 J3.795 E.01906
G1 X50.251 Y111.444 E.46841
G1 X50.251 Y110.911 E.0159
G1 X29.749 Y131.412 E.86408
M73 P88 R8
G1 X29.749 Y131.945 E.0159
G1 X36.555 Y125.14 E.28683
G2 X36.458 Y125.77 I3.104 J.799 E.01904
G1 X29.749 Y132.479 E.28275
G1 X29.749 Y133.013 E.0159
G1 X36.465 Y126.297 E.28304
G2 X36.535 Y126.761 I2.348 J-.118 E.014
G1 X29.749 Y133.546 E.28599
G1 X29.749 Y134.08 E.0159
G1 X36.651 Y127.178 E.2909
G2 X36.808 Y127.555 I7.312 J-2.814 E.01217
G1 X29.749 Y134.613 E.29749
G1 X29.749 Y135.147 E.0159
G1 X37 Y127.897 E.30559
G2 X37.222 Y128.208 I1.668 J-.956 E.01142
G1 X29.749 Y135.68 E.31496
G1 X29.749 Y136.214 E.0159
G1 X37.473 Y128.49 E.32553
G2 X37.752 Y128.745 I1.411 J-1.27 E.01128
G1 X29.749 Y136.748 E.33731
G1 X29.749 Y137.281 E.0159
G1 X38.06 Y128.97 E.35029
G2 X38.399 Y129.165 I1.145 J-1.592 E.01166
G1 X29.749 Y137.815 E.36455
G1 X29.749 Y138.348 E.0159
G1 X38.77 Y129.328 E.38019
G2 X39.178 Y129.454 I.833 J-1.978 E.01274
G1 X29.749 Y138.882 E.39738
G1 X29.749 Y139.415 E.0159
G1 X39.635 Y129.53 E.41666
G2 X40.154 Y129.545 I.333 J-2.58 E.0155
G1 X29.749 Y139.949 E.43853
G1 X29.749 Y140.483 E.0159
G1 X40.769 Y129.463 E.46446
G2 X41.593 Y129.173 I-.82 J-3.644 E.02608
G1 X29.749 Y141.016 E.49916
G1 X29.749 Y141.55 E.0159
G1 X50.251 Y121.049 E.86408
G1 X50.251 Y121.582 E.0159
G1 X29.749 Y142.083 E.86408
G1 X29.749 Y142.617 E.0159
G1 X50.251 Y122.116 E.86408
G1 X50.251 Y122.649 E.0159
G1 X29.749 Y143.15 E.86408
G1 X29.749 Y143.684 E.0159
G1 X50.251 Y123.183 E.86408
G1 X50.251 Y123.716 E.0159
G1 X29.749 Y144.218 E.86408
G1 X29.749 Y144.751 E.0159
G1 X50.251 Y124.25 E.86408
G1 X50.251 Y124.784 E.0159
G1 X29.749 Y145.285 E.86408
G1 X29.749 Y145.818 E.0159
G1 X50.251 Y125.317 E.86408
G1 X50.251 Y125.851 E.0159
G1 X29.749 Y146.352 E.86408
G1 X29.749 Y146.885 E.0159
G1 X50.251 Y126.384 E.86408
G1 X50.251 Y126.918 E.0159
G1 X29.749 Y147.419 E.86408
G1 X29.749 Y147.952 E.0159
G1 X50.251 Y127.451 E.86408
G1 X50.251 Y127.985 E.0159
G1 X29.749 Y148.486 E.86408
G1 X29.749 Y149.02 E.0159
G1 X50.251 Y128.519 E.86408
G1 X50.251 Y129.052 E.0159
G1 X29.749 Y149.553 E.86408
G1 X29.749 Y150.087 E.0159
G1 X50.251 Y129.586 E.86408
G1 X50.251 Y130.119 E.0159
G1 X29.749 Y150.62 E.86408
G1 X29.749 Y151.154 E.0159
G1 X50.251 Y130.653 E.86408
G1 X50.251 Y131.186 E.0159
G1 X29.749 Y151.687 E.86408
G1 X29.749 Y152.221 E.0159
G1 X50.251 Y131.72 E.86408
G1 X50.251 Y132.254 E.0159
G1 X29.749 Y152.755 E.86408
G1 X29.749 Y153.288 E.0159
G1 X50.251 Y132.787 E.86408
G1 X50.251 Y133.321 E.0159
G1 X29.749 Y153.822 E.86408
G1 X29.749 Y154.355 E.0159
G1 X50.251 Y133.854 E.86408
G1 X50.251 Y134.388 E.0159
G1 X29.749 Y154.889 E.86408
G1 X29.749 Y155.422 E.0159
G1 X50.251 Y134.921 E.86408
G1 X50.251 Y135.455 E.0159
G1 X29.749 Y155.956 E.86408
G1 X29.749 Y156.49 E.0159
G1 X50.251 Y135.989 E.86408
G1 X50.251 Y136.522 E.0159
G1 X29.749 Y157.023 E.86408
G1 X29.749 Y157.557 E.0159
G1 X50.251 Y137.056 E.86408
G1 X50.251 Y137.589 E.0159
G1 X29.749 Y158.09 E.86408
G1 X29.749 Y158.624 E.0159
G1 X50.251 Y138.123 E.86408
G1 X50.251 Y138.656 E.0159
G1 X29.749 Y159.157 E.86408
G1 X29.749 Y159.691 E.0159
G1 X50.251 Y139.19 E.86408
G1 X50.251 Y139.724 E.0159
G1 X29.749 Y160.225 E.86408
G1 X29.749 Y160.758 E.0159
G1 X50.251 Y140.257 E.86408
G1 X50.251 Y140.791 E.0159
G1 X29.749 Y161.292 E.86408
G1 X29.749 Y161.825 E.0159
G1 X50.251 Y141.324 E.86408
G1 X50.251 Y141.858 E.0159
G1 X29.749 Y162.359 E.86408
G1 X29.749 Y162.892 E.0159
G1 X50.251 Y142.391 E.86408
G1 X50.251 Y142.925 E.0159
G1 X29.749 Y163.426 E.86408
G1 X29.749 Y163.96 E.0159
G1 X50.251 Y143.458 E.86408
G1 X50.251 Y143.992 E.0159
G1 X29.749 Y164.493 E.86408
G1 X29.749 Y165.027 E.0159
G1 X50.251 Y144.526 E.86408
G1 X50.251 Y145.059 E.0159
G1 X29.749 Y165.56 E.86408
G1 X29.749 Y166.094 E.0159
G1 X50.251 Y145.593 E.86408
G1 X50.251 Y146.126 E.0159
G1 X29.749 Y166.627 E.86408
G1 X29.749 Y167.161 E.0159
G1 X50.251 Y146.66 E.86408
G1 X50.251 Y147.193 E.0159
G1 X29.749 Y167.695 E.86408
G1 X29.749 Y168.228 E.0159
G1 X50.251 Y147.727 E.86408
G1 X50.251 Y148.261 E.0159
G1 X29.749 Y168.762 E.86408
G1 X29.749 Y169.295 E.0159
G1 X50.251 Y148.794 E.86408
G1 X50.251 Y149.328 E.0159
G1 X29.749 Y169.829 E.86408
G1 X29.749 Y170.362 E.0159
G1 X50.251 Y149.861 E.86408
G1 X50.251 Y150.395 E.0159
G1 X29.749 Y170.896 E.86408
G1 X29.749 Y171.43 E.0159
G1 X50.251 Y150.928 E.86408
G1 X50.251 Y151.462 E.0159
G1 X29.749 Y171.963 E.86408
G1 X29.749 Y172.497 E.0159
G1 X50.251 Y151.996 E.86408
G1 X50.251 Y152.529 E.0159
G1 X29.749 Y173.03 E.86408
G1 X29.749 Y173.564 E.0159
G1 X50.251 Y153.063 E.86408
G1 X50.251 Y153.596 E.0159
G1 X29.749 Y174.097 E.86408
G1 X29.749 Y174.631 E.0159
G1 X50.251 Y154.13 E.86408
G1 X50.251 Y154.663 E.0159
G1 X29.749 Y175.164 E.86408
G1 X29.749 Y175.698 E.0159
G1 X50.251 Y155.197 E.86408
G1 X50.251 Y155.731 E.0159
G1 X29.749 Y176.232 E.86408
G1 X29.749 Y176.765 E.0159
G1 X50.251 Y156.264 E.86408
G1 X50.251 Y156.798 E.0159
G1 X29.749 Y177.299 E.86408
G1 X29.749 Y177.832 E.0159
G1 X50.251 Y157.331 E.86408
G1 X50.251 Y157.865 E.0159
G1 X29.749 Y178.366 E.86408
G1 X29.749 Y178.899 E.0159
G1 X50.251 Y158.398 E.86408
G1 X50.251 Y158.932 E.0159
G1 X29.749 Y179.433 E.86408
G1 X29.749 Y179.967 E.0159
G1 X50.251 Y159.466 E.86408
G1 X50.251 Y159.999 E.0159
G1 X29.749 Y180.5 E.86408
G1 X29.749 Y181.034 E.0159
G1 X50.251 Y160.533 E.86408
G1 X50.251 Y161.066 E.0159
G1 X29.749 Y181.567 E.86408
G1 X29.749 Y182.101 E.0159
G1 X50.251 Y161.6 E.86408
G1 X50.251 Y162.133 E.0159
G1 X29.749 Y182.634 E.86408
G1 X29.749 Y183.168 E.0159
G1 X50.251 Y162.667 E.86408
G1 X50.251 Y163.201 E.0159
G1 X29.749 Y183.702 E.86408
G1 X29.749 Y184.235 E.0159
G1 X50.251 Y163.734 E.86408
G1 X50.251 Y164.268 E.0159
G1 X29.749 Y184.769 E.86408
G1 X29.749 Y185.302 E.0159
G1 X50.251 Y164.801 E.86408
G1 X50.251 Y165.335 E.0159
G1 X29.749 Y185.836 E.86408
G1 X29.749 Y186.369 E.0159
G1 X50.251 Y165.868 E.86408
G1 X50.251 Y166.402 E.0159
G1 X29.749 Y186.903 E.86408
G1 X29.749 Y187.437 E.0159
G1 X50.251 Y166.935 E.86408
G1 X50.251 Y167.469 E.0159
G1 X29.749 Y187.97 E.86408
G1 X29.749 Y188.504 E.0159
G1 X50.251 Y168.003 E.86408
G1 X50.251 Y168.536 E.0159
G1 X29.749 Y189.037 E.86408
G1 X29.749 Y189.571 E.0159
G1 X50.251 Y169.07 E.86408
G1 X50.251 Y169.603 E.0159
G1 X29.749 Y190.104 E.86408
G1 X29.749 Y190.638 E.0159
G1 X50.251 Y170.137 E.86408
G1 X50.251 Y170.67 E.0159
G1 X29.749 Y191.172 E.86408
G1 X29.749 Y191.705 E.0159
G1 X50.251 Y171.204 E.86408
G1 X50.251 Y171.738 E.0159
G1 X29.749 Y192.239 E.86408
G1 X29.749 Y192.772 E.0159
G1 X50.251 Y172.271 E.86408
G1 X50.251 Y172.805 E.0159
G1 X29.749 Y193.306 E.86408
G1 X29.749 Y193.839 E.0159
G1 X50.251 Y173.338 E.86408
G1 X50.251 Y173.872 E.0159
G1 X29.749 Y194.373 E.86408
G1 X29.749 Y194.907 E.0159
G1 X50.251 Y174.405 E.86408
G1 X50.251 Y174.939 E.0159
G1 X29.749 Y195.44 E.86408
G1 X29.749 Y195.974 E.0159
G1 X50.251 Y175.473 E.86408
G1 X50.251 Y176.006 E.0159
G1 X29.749 Y196.507 E.86408
G1 X29.749 Y197.041 E.0159
G1 X50.251 Y176.54 E.86408
G1 X50.251 Y177.073 E.0159
G1 X29.749 Y197.574 E.86408
G1 X29.749 Y198.108 E.0159
G1 X50.251 Y177.607 E.86408
G1 X50.251 Y178.14 E.0159
G1 X29.749 Y198.642 E.86408
G1 X29.749 Y199.175 E.0159
G1 X50.251 Y178.674 E.86408
G1 X50.251 Y179.208 E.0159
G1 X29.749 Y199.709 E.86408
G1 X29.749 Y200.242 E.0159
G1 X50.251 Y179.741 E.86408
G1 X50.251 Y180.275 E.0159
G1 X29.749 Y200.776 E.86408
G1 X29.749 Y201.309 E.0159
G1 X50.251 Y180.808 E.86408
G1 X50.251 Y181.342 E.0159
G1 X29.749 Y201.843 E.86408
G1 X29.749 Y202.376 E.0159
G1 X50.251 Y181.875 E.86408
G1 X50.251 Y182.409 E.0159
G1 X29.749 Y202.91 E.86408
G1 X29.749 Y203.444 E.0159
G1 X50.251 Y182.943 E.86408
G1 X50.251 Y183.476 E.0159
G1 X29.749 Y203.977 E.86408
G1 X29.749 Y204.511 E.0159
G1 X50.251 Y184.01 E.86408
G1 X50.251 Y184.543 E.0159
G1 X29.749 Y205.044 E.86408
G1 X29.749 Y205.578 E.0159
G1 X50.251 Y185.077 E.86408
G1 X50.251 Y185.61 E.0159
G1 X29.749 Y206.111 E.86408
G1 X29.749 Y206.645 E.0159
G1 X50.251 Y186.144 E.86408
G1 X50.251 Y186.678 E.0159
G1 X29.749 Y207.179 E.86408
G1 X29.749 Y207.712 E.0159
G1 X50.251 Y187.211 E.86408
G1 X50.251 Y187.745 E.0159
G1 X29.749 Y208.246 E.86408
G1 X29.749 Y208.779 E.0159
G1 X50.251 Y188.278 E.86408
G1 X50.251 Y188.812 E.0159
G1 X29.749 Y209.313 E.86408
G1 X29.749 Y209.846 E.0159
G1 X50.251 Y189.345 E.86408
G1 X50.251 Y189.879 E.0159
G1 X29.749 Y210.38 E.86408
G1 X29.749 Y210.914 E.0159
G1 X50.251 Y190.413 E.86408
G1 X50.251 Y190.946 E.0159
G1 X29.749 Y211.447 E.86408
G1 X29.749 Y211.981 E.0159
G1 X50.251 Y191.48 E.86408
G1 X50.251 Y192.013 E.0159
G1 X29.58 Y212.684 E.87123
; WIPE_START
G1 X30.994 Y211.27 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X37.606 Y207.456 Z3.2 F30000
G1 X54.947 Y197.455 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F9541.731
G1 X43.345 Y209.057 E.48901
G2 X43.515 Y208.353 I-3.392 J-1.194 E.02163
G1 X54.244 Y197.624 E.45218
G1 X53.71 Y197.624 E.0159
G1 X43.547 Y207.787 E.42834
G2 X43.501 Y207.3 I-2.46 J-.01 E.0146
G1 X53.176 Y197.624 E.40781
G1 X52.643 Y197.624 E.0159
G1 X43.403 Y206.864 E.38944
G2 X43.262 Y206.472 I-6.637 J2.174 E.01242
G1 X52.109 Y197.624 E.37291
G1 X51.576 Y197.624 E.0159
G1 X43.083 Y206.117 E.35795
G2 X42.873 Y205.793 I-1.72 J.884 E.01152
G1 X51.042 Y197.624 E.3443
G1 X50.509 Y197.624 E.0159
G1 X42.634 Y205.499 E.33189
G2 X42.367 Y205.233 I-1.459 J1.199 E.01126
G1 X50.251 Y197.349 E.33229
G1 X50.251 Y196.815 E.0159
G1 X42.071 Y204.995 E.34476
G2 X41.746 Y204.787 I-1.204 J1.522 E.01153
G1 X50.251 Y196.282 E.35847
G1 X50.251 Y195.748 E.0159
G1 X41.389 Y204.61 E.37351
G2 X40.997 Y204.468 I-.905 J1.885 E.01243
G1 X50.251 Y195.215 E.39001
G1 X50.251 Y194.681 E.0159
G1 X40.561 Y204.37 E.40838
G2 X40.069 Y204.329 I-.434 J2.231 E.01476
G1 X50.251 Y194.147 E.42914
G1 X50.251 Y193.614 E.0159
G1 X39.504 Y204.361 E.45295
G2 X38.793 Y204.538 I.583 J3.847 E.02188
G1 X50.251 Y193.08 E.48293
G1 X50.251 Y192.547 E.0159
G1 X29.749 Y213.048 E.86408
G1 X29.749 Y213.581 E.0159
G1 X36.659 Y206.672 E.29122
G2 X36.485 Y207.38 I4.223 J1.415 E.02175
G1 X29.749 Y214.115 E.28387
G1 X29.749 Y214.649 E.0159
G1 X36.453 Y207.945 E.28253
G2 X36.495 Y208.437 I4.627 J-.146 E.01472
G1 X29.749 Y215.182 E.2843
G1 X29.749 Y215.716 E.0159
G1 X36.595 Y208.87 E.28852
G2 X36.736 Y209.263 I2.037 J-.509 E.01246
G1 X29.749 Y216.249 E.29445
G1 X29.749 Y216.783 E.0159
G1 X36.912 Y209.621 E.30187
G2 X37.119 Y209.947 I1.732 J-.874 E.01154
G1 X29.749 Y217.316 E.31062
G1 X29.749 Y217.85 E.0159
G1 X37.356 Y210.243 E.32062
G2 X37.622 Y210.511 I1.47 J-1.193 E.01126
G1 X30.007 Y218.126 E.32094
G1 X30.541 Y218.126 E.0159
G1 X37.916 Y210.75 E.31085
G2 X38.241 Y210.959 I6.545 J-9.808 E.01151
G1 X31.075 Y218.126 E.30204
G1 X31.608 Y218.126 E.0159
G1 X38.598 Y211.136 E.29462
M73 P89 R8
G2 X38.991 Y211.276 I.899 J-1.894 E.01246
G1 X32.142 Y218.126 E.28869
G1 X32.675 Y218.126 E.0159
G1 X39.425 Y211.376 E.2845
G2 X39.909 Y211.425 I.491 J-2.398 E.01452
G1 X33.209 Y218.126 E.2824
G1 X33.742 Y218.126 E.0159
G1 X40.478 Y211.39 E.28389
G2 X41.181 Y211.22 I-.491 J-3.572 E.02161
G1 X34.276 Y218.126 E.29105
G1 X34.81 Y218.126 E.0159
G1 X55.311 Y197.624 E.86408
G1 X55.844 Y197.624 E.0159
G1 X35.343 Y218.126 E.86408
G1 X35.877 Y218.126 E.0159
G1 X56.378 Y197.624 E.86408
G1 X56.911 Y197.624 E.0159
G1 X36.41 Y218.126 E.86408
G1 X36.944 Y218.126 E.0159
G1 X57.445 Y197.624 E.86408
G1 X57.979 Y197.624 E.0159
G1 X37.477 Y218.126 E.86408
G1 X38.011 Y218.126 E.0159
G1 X58.512 Y197.624 E.86408
G1 X59.046 Y197.624 E.0159
G1 X38.545 Y218.126 E.86408
G1 X39.078 Y218.126 E.0159
G1 X59.579 Y197.624 E.86408
G1 X60.113 Y197.624 E.0159
G1 X39.612 Y218.126 E.86408
G1 X40.145 Y218.126 E.0159
G1 X60.646 Y197.624 E.86408
G1 X61.18 Y197.624 E.0159
G1 X40.679 Y218.126 E.86408
G1 X41.212 Y218.126 E.0159
G1 X61.713 Y197.624 E.86408
G1 X62.247 Y197.624 E.0159
G1 X41.746 Y218.126 E.86408
G1 X42.28 Y218.126 E.0159
G1 X62.781 Y197.624 E.86408
G1 X63.314 Y197.624 E.0159
G1 X42.813 Y218.126 E.86408
G1 X43.347 Y218.126 E.0159
G1 X63.848 Y197.624 E.86408
G1 X64.381 Y197.624 E.0159
G1 X43.88 Y218.126 E.86408
G1 X44.414 Y218.126 E.0159
G1 X64.915 Y197.624 E.86408
G1 X65.448 Y197.624 E.0159
G1 X44.947 Y218.126 E.86408
G1 X45.481 Y218.126 E.0159
G1 X65.982 Y197.624 E.86408
G1 X66.516 Y197.624 E.0159
G1 X46.015 Y218.126 E.86408
G1 X46.548 Y218.126 E.0159
G1 X67.049 Y197.624 E.86408
G1 X67.583 Y197.624 E.0159
G1 X47.082 Y218.126 E.86408
G1 X47.615 Y218.126 E.0159
G1 X68.116 Y197.624 E.86408
G1 X68.65 Y197.624 E.0159
G1 X48.149 Y218.126 E.86408
G1 X48.682 Y218.126 E.0159
G1 X69.183 Y197.624 E.86408
G1 X69.717 Y197.624 E.0159
G1 X49.216 Y218.126 E.86408
G1 X49.75 Y218.126 E.0159
G1 X70.251 Y197.624 E.86408
G1 X70.784 Y197.624 E.0159
G1 X50.283 Y218.126 E.86408
G1 X50.817 Y218.126 E.0159
G1 X71.318 Y197.624 E.86408
G1 X71.851 Y197.624 E.0159
G1 X51.35 Y218.126 E.86408
G1 X51.884 Y218.126 E.0159
G1 X72.385 Y197.624 E.86408
G1 X72.918 Y197.624 E.0159
G1 X52.417 Y218.126 E.86408
G1 X52.951 Y218.126 E.0159
G1 X73.452 Y197.624 E.86408
G1 X73.986 Y197.624 E.0159
G1 X53.484 Y218.126 E.86408
G1 X54.018 Y218.126 E.0159
G1 X74.519 Y197.624 E.86408
G1 X75.053 Y197.624 E.0159
G1 X54.552 Y218.126 E.86408
G1 X55.085 Y218.126 E.0159
G1 X75.586 Y197.624 E.86408
G1 X76.12 Y197.624 E.0159
G1 X55.619 Y218.126 E.86408
G1 X56.152 Y218.126 E.0159
G1 X76.653 Y197.624 E.86408
G1 X77.187 Y197.624 E.0159
G1 X56.686 Y218.126 E.86408
G1 X57.219 Y218.126 E.0159
G1 X77.721 Y197.624 E.86408
G1 X78.254 Y197.624 E.0159
G1 X57.753 Y218.126 E.86408
G1 X58.287 Y218.126 E.0159
G1 X78.788 Y197.624 E.86408
G1 X79.321 Y197.624 E.0159
G1 X58.82 Y218.126 E.86408
G1 X59.354 Y218.126 E.0159
G1 X79.855 Y197.624 E.86408
G1 X80.388 Y197.624 E.0159
G1 X59.887 Y218.126 E.86408
G1 X60.421 Y218.126 E.0159
G1 X80.922 Y197.624 E.86408
G1 X81.456 Y197.624 E.0159
G1 X60.954 Y218.126 E.86408
G1 X61.488 Y218.126 E.0159
G1 X81.989 Y197.624 E.86408
G1 X82.523 Y197.624 E.0159
G1 X62.022 Y218.126 E.86408
G1 X62.555 Y218.126 E.0159
G1 X83.056 Y197.624 E.86408
G1 X83.59 Y197.624 E.0159
G1 X63.089 Y218.126 E.86408
G1 X63.622 Y218.126 E.0159
G1 X84.123 Y197.624 E.86408
G1 X84.657 Y197.624 E.0159
G1 X64.156 Y218.126 E.86408
G1 X64.689 Y218.126 E.0159
G1 X85.191 Y197.624 E.86408
G1 X85.724 Y197.624 E.0159
G1 X65.223 Y218.126 E.86408
G1 X65.757 Y218.126 E.0159
G1 X86.258 Y197.624 E.86408
G1 X86.791 Y197.624 E.0159
G1 X66.29 Y218.126 E.86408
G1 X66.824 Y218.126 E.0159
G1 X87.325 Y197.624 E.86408
G1 X87.858 Y197.624 E.0159
G1 X67.357 Y218.126 E.86408
G1 X67.891 Y218.126 E.0159
G1 X88.392 Y197.624 E.86408
G1 X88.925 Y197.624 E.0159
G1 X68.424 Y218.126 E.86408
G1 X68.958 Y218.126 E.0159
G1 X89.459 Y197.624 E.86408
G1 X89.993 Y197.624 E.0159
G1 X69.492 Y218.126 E.86408
G1 X70.025 Y218.126 E.0159
G1 X90.526 Y197.624 E.86408
G1 X91.06 Y197.624 E.0159
G1 X70.559 Y218.126 E.86408
G1 X71.092 Y218.126 E.0159
G1 X91.593 Y197.624 E.86408
G1 X92.127 Y197.624 E.0159
G1 X71.626 Y218.126 E.86408
G1 X72.159 Y218.126 E.0159
G1 X92.66 Y197.624 E.86408
G1 X93.194 Y197.624 E.0159
G1 X72.693 Y218.126 E.86408
G1 X73.227 Y218.126 E.0159
G1 X93.728 Y197.624 E.86408
G1 X94.261 Y197.624 E.0159
G1 X73.76 Y218.126 E.86408
G1 X74.294 Y218.126 E.0159
G1 X94.795 Y197.624 E.86408
G1 X95.328 Y197.624 E.0159
G1 X74.827 Y218.126 E.86408
G1 X75.361 Y218.126 E.0159
G1 X95.862 Y197.624 E.86408
G1 X96.395 Y197.624 E.0159
G1 X75.894 Y218.126 E.86408
G1 X76.428 Y218.126 E.0159
G1 X96.929 Y197.624 E.86408
G1 X97.463 Y197.624 E.0159
G1 X76.962 Y218.126 E.86408
G1 X77.495 Y218.126 E.0159
G1 X97.996 Y197.624 E.86408
G1 X98.53 Y197.624 E.0159
G1 X78.029 Y218.126 E.86408
G1 X78.562 Y218.126 E.0159
G1 X99.063 Y197.624 E.86408
G1 X99.597 Y197.624 E.0159
G1 X79.096 Y218.126 E.86408
G1 X79.629 Y218.126 E.0159
G1 X100.13 Y197.624 E.86408
G1 X100.664 Y197.624 E.0159
G1 X80.163 Y218.126 E.86408
G1 X80.696 Y218.126 E.0159
G1 X101.198 Y197.624 E.86408
G1 X101.731 Y197.624 E.0159
G1 X81.23 Y218.126 E.86408
G1 X81.764 Y218.126 E.0159
G1 X102.265 Y197.624 E.86408
G1 X102.798 Y197.624 E.0159
G1 X82.297 Y218.126 E.86408
G1 X82.831 Y218.126 E.0159
G1 X103.332 Y197.624 E.86408
G1 X103.865 Y197.624 E.0159
G1 X83.364 Y218.126 E.86408
G1 X83.898 Y218.126 E.0159
G1 X104.399 Y197.624 E.86408
G1 X104.933 Y197.624 E.0159
G1 X84.431 Y218.126 E.86408
G1 X84.965 Y218.126 E.0159
G1 X105.466 Y197.624 E.86408
G1 X106 Y197.624 E.0159
G1 X85.499 Y218.126 E.86408
G1 X86.032 Y218.126 E.0159
G1 X106.533 Y197.624 E.86408
G1 X107.067 Y197.624 E.0159
G1 X86.566 Y218.126 E.86408
G1 X87.099 Y218.126 E.0159
G1 X107.6 Y197.624 E.86408
G1 X108.134 Y197.624 E.0159
G1 X87.633 Y218.126 E.86408
G1 X88.166 Y218.126 E.0159
G1 X108.668 Y197.624 E.86408
G1 X109.201 Y197.624 E.0159
G1 X88.7 Y218.126 E.86408
G1 X89.234 Y218.126 E.0159
G1 X109.735 Y197.624 E.86408
G1 X110.268 Y197.624 E.0159
G1 X89.767 Y218.126 E.86408
G1 X90.301 Y218.126 E.0159
G1 X110.802 Y197.624 E.86408
G1 X111.335 Y197.624 E.0159
G1 X90.834 Y218.126 E.86408
G1 X91.368 Y218.126 E.0159
G1 X111.869 Y197.624 E.86408
G1 X112.403 Y197.624 E.0159
G1 X91.901 Y218.126 E.86408
G1 X92.435 Y218.126 E.0159
G1 X112.936 Y197.624 E.86408
G1 X113.47 Y197.624 E.0159
G1 X92.969 Y218.126 E.86408
G1 X93.502 Y218.126 E.0159
G1 X114.003 Y197.624 E.86408
G1 X114.537 Y197.624 E.0159
G1 X94.036 Y218.126 E.86408
G1 X94.569 Y218.126 E.0159
G1 X115.07 Y197.624 E.86408
G1 X115.604 Y197.624 E.0159
G1 X95.103 Y218.126 E.86408
G1 X95.636 Y218.126 E.0159
G1 X116.138 Y197.624 E.86408
G1 X116.671 Y197.624 E.0159
G1 X96.17 Y218.126 E.86408
G1 X96.704 Y218.126 E.0159
G1 X117.205 Y197.624 E.86408
G1 X117.738 Y197.624 E.0159
G1 X97.237 Y218.126 E.86408
G1 X97.771 Y218.126 E.0159
G1 X118.272 Y197.624 E.86408
G1 X118.805 Y197.624 E.0159
G1 X98.304 Y218.126 E.86408
G1 X98.838 Y218.126 E.0159
G1 X119.339 Y197.624 E.86408
G1 X119.872 Y197.624 E.0159
G1 X99.371 Y218.126 E.86408
G1 X99.905 Y218.126 E.0159
G1 X120.406 Y197.624 E.86408
G1 X120.94 Y197.624 E.0159
G1 X100.439 Y218.126 E.86408
G1 X100.972 Y218.126 E.0159
G1 X121.473 Y197.624 E.86408
G1 X122.007 Y197.624 E.0159
G1 X101.506 Y218.126 E.86408
G1 X102.039 Y218.126 E.0159
G1 X122.54 Y197.624 E.86408
G1 X123.074 Y197.624 E.0159
G1 X102.573 Y218.126 E.86408
G1 X103.106 Y218.126 E.0159
G1 X123.607 Y197.624 E.86408
G1 X124.141 Y197.624 E.0159
G1 X103.64 Y218.126 E.86408
G1 X104.174 Y218.126 E.0159
G1 X124.675 Y197.624 E.86408
G1 X125.208 Y197.624 E.0159
G1 X104.707 Y218.126 E.86408
G1 X105.241 Y218.126 E.0159
G1 X125.742 Y197.624 E.86408
G1 X126.275 Y197.624 E.0159
G1 X105.774 Y218.126 E.86408
G1 X106.308 Y218.126 E.0159
G1 X126.809 Y197.624 E.86408
G1 X127.342 Y197.624 E.0159
G1 X106.841 Y218.126 E.86408
G1 X107.375 Y218.126 E.0159
G1 X127.876 Y197.624 E.86408
M73 P89 R7
G1 X128.41 Y197.624 E.0159
G1 X107.909 Y218.126 E.86408
G1 X108.442 Y218.126 E.0159
G1 X128.943 Y197.624 E.86408
G1 X129.477 Y197.624 E.0159
G1 X108.976 Y218.126 E.86408
G1 X109.509 Y218.126 E.0159
G1 X130.01 Y197.624 E.86408
G1 X130.544 Y197.624 E.0159
G1 X110.043 Y218.126 E.86408
G1 X110.576 Y218.126 E.0159
G1 X131.077 Y197.624 E.86408
G1 X131.611 Y197.624 E.0159
G1 X111.11 Y218.126 E.86408
G1 X111.643 Y218.126 E.0159
G1 X132.145 Y197.624 E.86408
G1 X132.678 Y197.624 E.0159
G1 X112.007 Y218.295 E.87123
G1 X122.145 Y218.295 F30000
G1 F9541.731
G1 X129.24 Y211.2 E.29903
G3 X128.522 Y211.385 I-1.304 J-3.593 E.02211
G1 X121.781 Y218.126 E.28412
G1 X121.248 Y218.126 E.0159
G1 X127.949 Y211.425 E.28243
G3 X127.458 Y211.381 I.158 J-4.597 E.01468
G1 X120.714 Y218.126 E.28425
G1 X120.181 Y218.126 E.0159
G1 X127.021 Y211.285 E.28833
G3 X126.626 Y211.146 I.494 J-2.048 E.0125
G1 X119.647 Y218.126 E.29416
G1 X119.113 Y218.126 E.0159
G1 X126.266 Y210.973 E.30149
G3 X125.939 Y210.767 I.864 J-1.738 E.01155
G1 X118.58 Y218.126 E.31017
G1 X118.046 Y218.126 E.0159
G1 X125.642 Y210.53 E.32014
G3 X125.374 Y210.264 I1.193 J-1.469 E.01126
G1 X117.513 Y218.126 E.33134
G1 X116.979 Y218.126 E.0159
G1 X125.135 Y209.97 E.34375
G3 X124.925 Y209.646 I1.514 J-1.21 E.01152
G1 X116.446 Y218.126 E.3574
G1 X115.912 Y218.126 E.0159
G1 X124.747 Y209.29 E.37238
G3 X124.604 Y208.9 I1.885 J-.912 E.01241
G1 X115.378 Y218.126 E.38884
G1 X114.845 Y218.126 E.0159
G1 X124.501 Y208.469 E.40699
G3 X124.453 Y207.984 I4.393 J-.683 E.01454
G1 X114.311 Y218.126 E.42744
G1 X113.778 Y218.126 E.0159
G1 X124.48 Y207.423 E.45109
G3 X124.642 Y206.728 I3.854 J.529 E.02129
G1 X113.244 Y218.126 E.48038
G1 X112.711 Y218.126 E.0159
G1 X133.212 Y197.624 E.86408
G1 X133.745 Y197.624 E.0159
G1 X126.857 Y204.513 E.29034
G3 X127.551 Y204.352 I1.445 J4.66 E.02126
G1 X134.279 Y197.624 E.28356
G1 X134.812 Y197.624 E.0159
G1 X128.107 Y204.33 E.28262
G3 X128.596 Y204.375 I.04 J2.258 E.01466
G1 X135.346 Y197.624 E.28451
G1 X135.88 Y197.624 E.0159
G1 X129.026 Y204.478 E.28885
G3 X129.415 Y204.622 I-.527 J2.018 E.01239
G1 X136.413 Y197.624 E.29494
G1 X136.947 Y197.624 E.0159
G1 X129.77 Y204.801 E.30248
G3 X130.093 Y205.011 I-.889 J1.722 E.01151
G1 X137.48 Y197.624 E.31134
G1 X138.014 Y197.624 E.0159
G1 X130.387 Y205.251 E.32144
G3 X130.653 Y205.519 I-1.205 J1.459 E.01126
G1 X138.547 Y197.624 E.33274
G1 X139.081 Y197.624 E.0159
G1 X130.89 Y205.815 E.34524
G3 X131.098 Y206.141 I-1.528 J1.203 E.01154
G1 X139.615 Y197.624 E.35897
G1 X140.148 Y197.624 E.0159
G1 X131.274 Y206.499 E.37403
G3 X131.411 Y206.895 I-1.914 J.883 E.01252
G1 X140.682 Y197.624 E.39074
G1 X141.215 Y197.624 E.0159
G1 X131.506 Y207.334 E.40924
G3 X131.549 Y207.824 I-2.432 J.462 E.01469
G1 X141.749 Y197.624 E.4299
G1 X142.282 Y197.624 E.0159
G1 X131.508 Y208.398 E.4541
G3 X131.323 Y209.118 I-3.519 J-.525 E.02219
G1 X142.816 Y197.624 E.48443
G1 X143.35 Y197.624 E.0159
G1 X122.848 Y218.126 E.86408
G1 X123.382 Y218.126 E.0159
G1 X143.883 Y197.624 E.86408
G1 X144.417 Y197.624 E.0159
G1 X123.916 Y218.126 E.86408
G1 X124.449 Y218.126 E.0159
G1 X144.95 Y197.624 E.86408
G1 X145.484 Y197.624 E.0159
G1 X124.983 Y218.126 E.86408
G1 X125.516 Y218.126 E.0159
G1 X146.017 Y197.624 E.86408
G1 X146.551 Y197.624 E.0159
G1 X126.05 Y218.126 E.86408
G1 X126.583 Y218.126 E.0159
G1 X147.084 Y197.624 E.86408
G1 X147.618 Y197.624 E.0159
G1 X127.117 Y218.126 E.86408
G1 X127.651 Y218.126 E.0159
G1 X148.152 Y197.624 E.86408
G1 X148.685 Y197.624 E.0159
G1 X128.184 Y218.126 E.86408
G1 X128.718 Y218.126 E.0159
G1 X149.219 Y197.624 E.86408
G1 X149.752 Y197.624 E.0159
G1 X129.251 Y218.126 E.86408
G1 X129.785 Y218.126 E.0159
G1 X150.286 Y197.624 E.86408
G1 X150.819 Y197.624 E.0159
G1 X130.318 Y218.126 E.86408
G1 X130.852 Y218.126 E.0159
G1 X151.353 Y197.624 E.86408
G1 X151.887 Y197.624 E.0159
G1 X131.386 Y218.126 E.86408
G1 X131.919 Y218.126 E.0159
G1 X152.42 Y197.624 E.86408
G1 X152.954 Y197.624 E.0159
G1 X132.453 Y218.126 E.86408
G1 X132.986 Y218.126 E.0159
G1 X153.487 Y197.624 E.86408
G1 X154.021 Y197.624 E.0159
G1 X133.52 Y218.126 E.86408
G1 X134.053 Y218.126 E.0159
G1 X154.554 Y197.624 E.86408
G1 X155.088 Y197.624 E.0159
G1 X134.587 Y218.126 E.86408
G1 X135.121 Y218.126 E.0159
G1 X155.622 Y197.624 E.86408
G1 X156.155 Y197.624 E.0159
G1 X135.654 Y218.126 E.86408
G1 X136.188 Y218.126 E.0159
G1 X156.689 Y197.624 E.86408
G1 X157.222 Y197.624 E.0159
G1 X136.721 Y218.126 E.86408
G1 X137.255 Y218.126 E.0159
G1 X157.756 Y197.624 E.86408
G1 X158.289 Y197.624 E.0159
G1 X137.788 Y218.126 E.86408
G1 X138.322 Y218.126 E.0159
G1 X158.823 Y197.624 E.86408
G1 X159.357 Y197.624 E.0159
G1 X138.855 Y218.126 E.86408
G1 X139.389 Y218.126 E.0159
G1 X159.89 Y197.624 E.86408
G1 X160.424 Y197.624 E.0159
G1 X139.923 Y218.126 E.86408
G1 X140.456 Y218.126 E.0159
G1 X160.957 Y197.624 E.86408
G1 X161.491 Y197.624 E.0159
G1 X140.99 Y218.126 E.86408
G1 X141.523 Y218.126 E.0159
G1 X162.024 Y197.624 E.86408
G1 X162.558 Y197.624 E.0159
G1 X142.057 Y218.126 E.86408
G1 X142.59 Y218.126 E.0159
G1 X163.092 Y197.624 E.86408
G1 X163.625 Y197.624 E.0159
G1 X143.124 Y218.126 E.86408
G1 X143.658 Y218.126 E.0159
G1 X164.159 Y197.624 E.86408
G1 X164.692 Y197.624 E.0159
G1 X144.191 Y218.126 E.86408
G1 X144.725 Y218.126 E.0159
G1 X165.226 Y197.624 E.86408
G1 X165.759 Y197.624 E.0159
G1 X145.258 Y218.126 E.86408
G1 X145.792 Y218.126 E.0159
G1 X166.293 Y197.624 E.86408
G1 X166.827 Y197.624 E.0159
G1 X146.325 Y218.126 E.86408
G1 X146.859 Y218.126 E.0159
G1 X167.36 Y197.624 E.86408
G1 X167.894 Y197.624 E.0159
G1 X147.393 Y218.126 E.86408
G1 X147.926 Y218.126 E.0159
G1 X168.427 Y197.624 E.86408
G1 X168.961 Y197.624 E.0159
G1 X148.46 Y218.126 E.86408
G1 X148.993 Y218.126 E.0159
G1 X169.494 Y197.624 E.86408
G1 X170.028 Y197.624 E.0159
G1 X149.527 Y218.126 E.86408
G1 X150.06 Y218.126 E.0159
G1 X170.562 Y197.624 E.86408
G1 X171.095 Y197.624 E.0159
G1 X150.594 Y218.126 E.86408
G1 X151.128 Y218.126 E.0159
G1 X171.629 Y197.624 E.86408
G1 X172.162 Y197.624 E.0159
G1 X151.661 Y218.126 E.86408
G1 X152.195 Y218.126 E.0159
G1 X172.696 Y197.624 E.86408
G1 X173.229 Y197.624 E.0159
G1 X152.728 Y218.126 E.86408
G1 X153.262 Y218.126 E.0159
G1 X173.763 Y197.624 E.86408
G1 X174.296 Y197.624 E.0159
G1 X153.795 Y218.126 E.86408
G1 X154.329 Y218.126 E.0159
G1 X174.83 Y197.624 E.86408
G1 X175.364 Y197.624 E.0159
G1 X154.863 Y218.126 E.86408
G1 X155.396 Y218.126 E.0159
G1 X175.897 Y197.624 E.86408
G1 X176.431 Y197.624 E.0159
G1 X155.93 Y218.126 E.86408
G1 X156.463 Y218.126 E.0159
G1 X176.964 Y197.624 E.86408
G1 X177.498 Y197.624 E.0159
G1 X156.997 Y218.126 E.86408
G1 X157.53 Y218.126 E.0159
G1 X178.031 Y197.624 E.86408
G1 X178.565 Y197.624 E.0159
G1 X158.064 Y218.126 E.86408
M73 P90 R7
G1 X158.598 Y218.126 E.0159
G1 X179.099 Y197.624 E.86408
G1 X179.632 Y197.624 E.0159
G1 X159.131 Y218.126 E.86408
G1 X159.665 Y218.126 E.0159
G1 X180.166 Y197.624 E.86408
G1 X180.699 Y197.624 E.0159
G1 X160.198 Y218.126 E.86408
G1 X160.732 Y218.126 E.0159
G1 X181.233 Y197.624 E.86408
G1 X181.766 Y197.624 E.0159
G1 X161.265 Y218.126 E.86408
G1 X161.799 Y218.126 E.0159
G1 X182.3 Y197.624 E.86408
G1 X182.834 Y197.624 E.0159
G1 X162.333 Y218.126 E.86408
G1 X162.866 Y218.126 E.0159
G1 X183.367 Y197.624 E.86408
G1 X183.901 Y197.624 E.0159
G1 X163.4 Y218.126 E.86408
G1 X163.933 Y218.126 E.0159
G1 X184.434 Y197.624 E.86408
G1 X184.968 Y197.624 E.0159
G1 X164.467 Y218.126 E.86408
G1 X165 Y218.126 E.0159
G1 X185.501 Y197.624 E.86408
G1 X186.035 Y197.624 E.0159
G1 X165.534 Y218.126 E.86408
G1 X166.067 Y218.126 E.0159
G1 X186.569 Y197.624 E.86408
G1 X187.102 Y197.624 E.0159
G1 X166.601 Y218.126 E.86408
G1 X167.135 Y218.126 E.0159
G1 X187.636 Y197.624 E.86408
G1 X188.169 Y197.624 E.0159
G1 X167.668 Y218.126 E.86408
G1 X168.202 Y218.126 E.0159
G1 X188.703 Y197.624 E.86408
G1 X189.236 Y197.624 E.0159
G1 X168.735 Y218.126 E.86408
G1 X169.269 Y218.126 E.0159
G1 X189.77 Y197.624 E.86408
G1 X190.304 Y197.624 E.0159
G1 X169.802 Y218.126 E.86408
G1 X170.336 Y218.126 E.0159
G1 X190.837 Y197.624 E.86408
G1 X191.371 Y197.624 E.0159
G1 X170.87 Y218.126 E.86408
G1 X171.403 Y218.126 E.0159
G1 X191.904 Y197.624 E.86408
G1 X192.438 Y197.624 E.0159
G1 X171.937 Y218.126 E.86408
G1 X172.47 Y218.126 E.0159
G1 X192.971 Y197.624 E.86408
G1 X193.505 Y197.624 E.0159
G1 X173.004 Y218.126 E.86408
G1 X173.537 Y218.126 E.0159
G1 X194.039 Y197.624 E.86408
G1 X194.572 Y197.624 E.0159
G1 X174.071 Y218.126 E.86408
G1 X174.605 Y218.126 E.0159
G1 X195.106 Y197.624 E.86408
G1 X195.639 Y197.624 E.0159
G1 X175.138 Y218.126 E.86408
G1 X175.672 Y218.126 E.0159
G1 X196.173 Y197.624 E.86408
G1 X196.706 Y197.624 E.0159
G1 X176.205 Y218.126 E.86408
G1 X176.739 Y218.126 E.0159
G1 X197.24 Y197.624 E.86408
G1 X197.774 Y197.624 E.0159
G1 X177.272 Y218.126 E.86408
G1 X177.806 Y218.126 E.0159
G1 X198.307 Y197.624 E.86408
G1 X198.841 Y197.624 E.0159
G1 X178.34 Y218.126 E.86408
G1 X178.873 Y218.126 E.0159
G1 X199.374 Y197.624 E.86408
G1 X199.908 Y197.624 E.0159
G1 X179.407 Y218.126 E.86408
G1 X179.94 Y218.126 E.0159
G1 X200.441 Y197.624 E.86408
G1 X200.975 Y197.624 E.0159
G1 X180.474 Y218.126 E.86408
G1 X181.007 Y218.126 E.0159
G1 X201.509 Y197.624 E.86408
G1 X202.042 Y197.624 E.0159
G1 X181.541 Y218.126 E.86408
G1 X182.075 Y218.126 E.0159
G1 X202.576 Y197.624 E.86408
G1 X203.109 Y197.624 E.0159
G1 X182.608 Y218.126 E.86408
G1 X183.142 Y218.126 E.0159
G1 X203.643 Y197.624 E.86408
G1 X204.176 Y197.624 E.0159
G1 X183.675 Y218.126 E.86408
G1 X184.209 Y218.126 E.0159
G1 X204.71 Y197.624 E.86408
G1 X205.243 Y197.624 E.0159
G1 X184.573 Y218.295 E.87123
; WIPE_START
G1 X185.987 Y216.881 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X180.333 Y211.753 Z3.2 F30000
G1 X29.58 Y75.023 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F9541.731
G1 X70.729 Y33.874 E1.73434
G1 X70.195 Y33.874 E.0159
G1 X29.749 Y74.32 E1.7047
G1 X29.749 Y73.786 E.0159
G1 X69.661 Y33.874 E1.68222
G1 X69.128 Y33.874 E.0159
G1 X29.749 Y73.253 E1.65973
G1 X29.749 Y72.719 E.0159
G1 X68.594 Y33.874 E1.63724
G1 X68.061 Y33.874 E.0159
G1 X29.749 Y72.186 E1.61475
G1 X29.749 Y71.652 E.0159
G1 X67.527 Y33.874 E1.59226
G1 X66.994 Y33.874 E.0159
G1 X29.749 Y71.119 E1.56977
G1 X29.749 Y70.585 E.0159
G1 X66.46 Y33.874 E1.54728
G1 X65.927 Y33.874 E.0159
G1 X29.749 Y70.051 E1.52479
G1 X29.749 Y69.518 E.0159
G1 X65.393 Y33.874 E1.5023
G1 X64.859 Y33.874 E.0159
G1 X29.749 Y68.984 E1.47982
G1 X29.749 Y68.451 E.0159
G1 X64.326 Y33.874 E1.45733
G1 X63.792 Y33.874 E.0159
G1 X29.749 Y67.917 E1.43484
G1 X29.749 Y67.384 E.0159
G1 X63.259 Y33.874 E1.41235
G1 X62.725 Y33.874 E.0159
G1 X29.749 Y66.85 E1.38986
G1 X29.749 Y66.317 E.0159
G1 X62.192 Y33.874 E1.36737
G1 X61.658 Y33.874 E.0159
G1 X29.749 Y65.783 E1.34488
G1 X29.749 Y65.249 E.0159
G1 X61.124 Y33.874 E1.32239
G1 X60.591 Y33.874 E.0159
G1 X29.749 Y64.716 E1.2999
G1 X29.749 Y64.182 E.0159
G1 X60.057 Y33.874 E1.27742
G1 X59.524 Y33.874 E.0159
G1 X29.749 Y63.649 E1.25493
G1 X29.749 Y63.115 E.0159
G1 X58.99 Y33.874 E1.23244
G1 X58.457 Y33.874 E.0159
G1 X29.749 Y62.582 E1.20995
G1 X29.749 Y62.048 E.0159
G1 X57.923 Y33.874 E1.18746
G1 X57.389 Y33.874 E.0159
G1 X29.749 Y61.514 E1.16497
G1 X29.749 Y60.981 E.0159
G1 X56.856 Y33.874 E1.14248
G1 X56.322 Y33.874 E.0159
G1 X29.749 Y60.447 E1.11999
G1 X29.749 Y59.914 E.0159
G1 X55.789 Y33.874 E1.0975
G1 X55.255 Y33.874 E.0159
G1 X29.749 Y59.38 E1.07502
G1 X29.749 Y58.847 E.0159
G1 X41.098 Y47.498 E.47831
G3 X40.414 Y47.648 I-1.104 J-3.402 E.02088
G1 X29.749 Y58.313 E.44951
G1 X29.749 Y57.779 E.0159
G1 X39.857 Y47.671 E.42603
G3 X39.378 Y47.617 I.032 J-2.427 E.0144
G1 X29.749 Y57.246 E.40583
G1 X29.749 Y56.712 E.0159
G1 X38.948 Y47.514 E.38769
G3 X38.558 Y47.37 I.527 J-2.022 E.0124
G1 X29.749 Y56.179 E.37128
G1 X29.749 Y55.645 E.0159
G1 X38.206 Y47.189 E.35641
G3 X37.885 Y46.976 I.906 J-1.708 E.01149
G1 X29.749 Y55.112 E.34291
G1 X29.749 Y54.578 E.0159
G1 X37.594 Y46.733 E.33063
G3 X37.331 Y46.463 I1.22 J-1.449 E.01126
G1 X29.749 Y54.044 E.31955
G1 X29.749 Y53.511 E.0159
G1 X37.097 Y46.164 E.30967
G3 X36.892 Y45.835 I1.539 J-1.186 E.01156
G1 X29.749 Y52.977 E.30104
G1 X29.749 Y52.444 E.0159
G1 X36.719 Y45.474 E.29376
G3 X36.582 Y45.078 I1.912 J-.885 E.01252
G1 X29.749 Y51.91 E.28797
G1 X29.749 Y51.377 E.0159
G1 X36.487 Y44.64 E.28395
G3 X36.453 Y44.14 I2.481 J-.419 E.01495
G1 X29.749 Y50.843 E.28253
G1 X29.749 Y50.309 E.0159
G1 X36.494 Y43.565 E.28428
G3 X36.697 Y42.828 I3.85 J.664 E.0228
G1 X29.749 Y49.776 E.29283
G1 X29.749 Y49.242 E.0159
G1 X45.117 Y33.874 E.64773
G1 X45.651 Y33.874 E.0159
G1 X38.701 Y40.824 E.29291
G3 X39.437 Y40.622 I1.311 J3.337 E.02276
G1 X46.184 Y33.874 E.28441
G1 X46.718 Y33.874 E.0159
G1 X40.014 Y40.578 E.28256
G3 X40.512 Y40.614 I.086 J2.295 E.0149
G1 X47.252 Y33.874 E.28407
G1 X47.785 Y33.874 E.0159
G1 X40.955 Y40.705 E.28787
G3 X41.35 Y40.843 I-2.241 J7.045 E.01248
G1 X48.319 Y33.874 E.2937
G1 X48.852 Y33.874 E.0159
G1 X41.71 Y41.016 E.30102
G3 X42.039 Y41.222 I-.861 J1.742 E.01156
G1 X49.386 Y33.874 E.30968
G1 X49.919 Y33.874 E.0159
G1 X42.337 Y41.457 E.31957
G3 X42.607 Y41.72 I-1.178 J1.479 E.01126
G1 X50.453 Y33.874 E.33067
G1 X50.987 Y33.874 E.0159
G1 X42.849 Y42.012 E.34297
G3 X43.062 Y42.333 I-1.499 J1.224 E.01149
G1 X51.52 Y33.874 E.3565
G1 X52.054 Y33.874 E.0159
G1 X43.244 Y42.685 E.37133
G3 X43.391 Y43.071 I-1.851 J.929 E.01234
G1 X52.587 Y33.874 E.3876
G1 X53.121 Y33.874 E.0159
G1 X43.493 Y43.502 E.40578
G3 X43.545 Y43.984 I-2.39 J.498 E.01448
G1 X53.654 Y33.874 E.42611
G1 X54.188 Y33.874 E.0159
G1 X43.525 Y44.537 E.44942
G3 X43.377 Y45.219 I-4.096 J-.535 E.02083
G1 X54.891 Y33.705 E.48532
G1 X29.58 Y34.472 F30000
G1 F9541.731
G1 X30.177 Y33.874 E.02519
G1 X30.711 Y33.874 E.0159
G1 X29.749 Y34.836 E.04053
G1 X29.749 Y35.37 E.0159
G1 X31.245 Y33.874 E.06301
G1 X31.778 Y33.874 E.0159
G1 X29.749 Y35.903 E.0855
G1 X29.749 Y36.437 E.0159
G1 X32.312 Y33.874 E.10799
G1 X32.845 Y33.874 E.0159
G1 X29.749 Y36.97 E.13048
G1 X29.749 Y37.504 E.0159
G1 X33.379 Y33.874 E.15297
G1 X33.912 Y33.874 E.0159
G1 X29.749 Y38.037 E.17546
G1 X29.749 Y38.571 E.0159
G1 X34.446 Y33.874 E.19795
G1 X34.98 Y33.874 E.0159
G1 X29.749 Y39.105 E.22044
G1 X29.749 Y39.638 E.0159
G1 X35.513 Y33.874 E.24293
G1 X36.047 Y33.874 E.0159
G1 X29.749 Y40.172 E.26541
G1 X29.749 Y40.705 E.0159
G1 X36.58 Y33.874 E.2879
G1 X37.114 Y33.874 E.0159
G1 X29.749 Y41.239 E.31039
G1 X29.749 Y41.772 E.0159
G1 X37.647 Y33.874 E.33288
G1 X38.181 Y33.874 E.0159
G1 X29.749 Y42.306 E.35537
G1 X29.749 Y42.839 E.0159
G1 X38.714 Y33.874 E.37786
G1 X39.248 Y33.874 E.0159
G1 X29.749 Y43.373 E.40035
G1 X29.749 Y43.907 E.0159
G1 X39.782 Y33.874 E.42284
G1 X40.315 Y33.874 E.0159
G1 X29.749 Y44.44 E.44533
G1 X29.749 Y44.974 E.0159
G1 X40.849 Y33.874 E.46781
G1 X41.382 Y33.874 E.0159
G1 X29.749 Y45.507 E.4903
G1 X29.749 Y46.041 E.0159
G1 X41.916 Y33.874 E.51279
G1 X42.449 Y33.874 E.0159
G1 X29.749 Y46.574 E.53528
G1 X29.749 Y47.108 E.0159
G1 X42.983 Y33.874 E.55777
G1 X43.517 Y33.874 E.0159
G1 X29.749 Y47.642 E.58026
G1 X29.749 Y48.175 E.0159
G1 X44.05 Y33.874 E.60275
G1 X44.584 Y33.874 E.0159
G1 X29.58 Y48.878 E.63239
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9541.731
G1 X30.994 Y47.464 E-.76
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
G1 X128.225 Y205.884
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.544 Y205.941 E.00965
G3 X127.75 Y205.88 I-.547 J1.929 E.3514
G1 X127.944 Y205.866 E.00578
G3 X128.15 Y205.871 I.053 J2.004 E.00615
G1 X128.166 Y205.874 E.00049
; WIPE_START
M204 S10000
G1 X128.544 Y205.941 E-.14589
G1 X128.917 Y206.086 E-.15209
G1 X129.253 Y206.303 E-.15209
G1 X129.54 Y206.583 E-.15212
G1 X129.765 Y206.914 E-.15213
G1 X129.771 Y206.927 E-.00569
; WIPE_END
G1 E-.04 F1800
G1 X122.139 Y206.837 Z3.4 F30000
G1 X39.931 Y205.867 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X39.944 Y205.866 E.00038
G3 X39.75 Y205.88 I.053 J2.004 E.3695
G1 X39.871 Y205.871 E.00361
; WIPE_START
M204 S10000
G1 X39.944 Y205.866 E-.0277
G1 X40.15 Y205.87 E-.07842
G1 X40.544 Y205.94 E-.15224
G1 X40.917 Y206.086 E-.15214
G1 X41.253 Y206.303 E-.15213
G1 X41.54 Y206.583 E-.15208
G1 X41.607 Y206.681 E-.0453
; WIPE_END
G1 E-.04 F1800
G1 X41.453 Y199.05 Z3.4 F30000
G1 X39.937 Y123.991 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X39.944 Y123.991 E.00019
G3 X39.75 Y124.005 I.053 J2.004 E.3695
G1 X39.877 Y123.996 E.0038
; WIPE_START
M204 S10000
G1 X39.944 Y123.991 E-.02521
G1 X40.15 Y123.995 E-.07842
G1 X40.544 Y124.065 E-.15222
G1 X40.917 Y124.211 E-.15213
G1 X41.253 Y124.428 E-.15215
G1 X41.54 Y124.708 E-.15207
G1 X41.611 Y124.812 E-.0478
; WIPE_END
G1 E-.04 F1800
G1 X48.601 Y127.876 Z3.4 F30000
G1 X204.21 Y196.085 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X51.79 Y196.085 E4.54007
G1 X51.79 Y55.915 E4.17519
G1 X204.21 Y55.915 E4.54007
G1 X204.21 Y196.025 E4.1734
; WIPE_START
M204 S10000
G1 X202.21 Y196.026 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X196.671 Y190.775 Z3.4 F30000
G1 X39.856 Y42.122 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X39.944 Y42.116 E.00262
G3 X39.75 Y42.13 I.053 J2.004 E.3695
G1 X39.796 Y42.127 E.00137
; WIPE_START
M204 S10000
G1 X39.944 Y42.116 E-.05625
G1 X40.15 Y42.12 E-.07842
G1 X40.544 Y42.19 E-.15224
G1 X40.917 Y42.336 E-.15213
G1 X41.253 Y42.553 E-.15215
G1 X41.54 Y42.833 E-.15213
G1 X41.565 Y42.869 E-.0167
; WIPE_END
G1 E-.04 F1800
G1 X49.197 Y42.803 Z3.4 F30000
G1 X127.937 Y42.116 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X127.944 Y42.116 E.00018
G3 X127.75 Y42.13 I.053 J2.004 E.3695
G1 X127.878 Y42.121 E.00381
; WIPE_START
M204 S10000
G1 X127.944 Y42.116 E-.0251
G1 X128.15 Y42.12 E-.07842
G1 X128.544 Y42.19 E-.15224
G1 X128.917 Y42.336 E-.15213
G1 X129.253 Y42.553 E-.15211
G1 X129.54 Y42.833 E-.15216
G1 X129.611 Y42.937 E-.04785
; WIPE_END
G1 E-.04 F1800
G1 X137.243 Y42.864 Z3.4 F30000
G1 X215.937 Y42.116 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X215.944 Y42.116 E.00019
G3 X215.75 Y42.13 I.053 J2.004 E.3695
G1 X215.877 Y42.121 E.0038
; WIPE_START
M204 S10000
G1 X215.944 Y42.116 E-.02521
G1 X216.15 Y42.12 E-.07842
G1 X216.544 Y42.19 E-.15225
G1 X216.917 Y42.336 E-.15211
G1 X217.253 Y42.553 E-.15215
G1 X217.54 Y42.833 E-.15212
G1 X217.611 Y42.937 E-.04775
; WIPE_END
G1 E-.04 F1800
G1 X217.473 Y50.568 Z3.4 F30000
G1 X216.072 Y128.003 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X215.751 Y127.985 E.00958
G3 X215.75 Y124.005 I.245 J-1.99 E.17295
G1 X215.944 Y123.991 E.00578
G3 X216.149 Y127.995 I.053 J2.004 E.18466
G1 X216.132 Y127.996 E.00052
; WIPE_START
M204 S10000
G1 X215.751 Y127.985 E-.1448
G1 X215.36 Y127.906 E-.1518
G1 X214.995 Y127.741 E-.15214
G1 X214.67 Y127.507 E-.15211
G1 X214.398 Y127.214 E-.15211
G1 X214.388 Y127.198 E-.00704
; WIPE_END
G1 E-.04 F1800
G1 X214.538 Y134.829 Z3.4 F30000
G1 X215.931 Y205.867 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X215.944 Y205.866 E.00037
G3 X215.75 Y205.88 I.053 J2.004 E.3695
G1 X215.871 Y205.871 E.00362
; WIPE_START
M204 S10000
G1 X215.944 Y205.866 E-.02758
G1 X216.15 Y205.87 E-.07842
G1 X216.544 Y205.94 E-.15224
G1 X216.917 Y206.086 E-.15213
G1 X217.253 Y206.303 E-.15212
G1 X217.54 Y206.583 E-.15208
G1 X217.607 Y206.681 E-.04541
; WIPE_END
G1 E-.04 F1800
G1 X222.317 Y212.687 Z3.4 F30000
G1 X227.79 Y219.665 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X28.21 Y219.665 E5.94481
G1 X28.21 Y32.335 E5.57992
G1 X227.79 Y32.335 E5.94481
G1 X227.79 Y219.605 E5.57813
; WIPE_START
M204 S10000
G1 X225.79 Y219.606 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X225.863 Y211.973 Z3.4 F30000
G1 X227.583 Y33.343 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Top surface
G1 F9547.055
M204 S2000
G1 X226.782 Y32.542 E.03374
G1 X226.248 Y32.542
G1 X227.583 Y33.877 E.0562
M73 P90 R6
G1 X227.583 Y34.41
G1 X225.715 Y32.542 E.07867
G1 X225.182 Y32.542
G1 X227.583 Y34.943 E.10113
G1 X227.583 Y35.476
G1 X224.649 Y32.542 E.12359
G1 X224.115 Y32.542
G1 X227.583 Y36.01 E.14606
G1 X227.583 Y36.543
G1 X223.582 Y32.542 E.16852
G1 X223.049 Y32.542
G1 X227.583 Y37.076 E.19098
G1 X227.583 Y37.609
G1 X222.516 Y32.542 E.21345
G1 X221.982 Y32.542
G1 X227.583 Y38.143 E.23591
G1 X227.583 Y38.676
G1 X221.449 Y32.542 E.25837
G1 X220.916 Y32.542
G1 X227.583 Y39.209 E.28084
G1 X227.583 Y39.742
G1 X220.383 Y32.542 E.3033
G1 X219.849 Y32.542
G1 X227.583 Y40.276 E.32576
G1 X227.583 Y40.809
G1 X219.316 Y32.542 E.34823
G1 X218.783 Y32.542
G1 X227.583 Y41.342 E.37069
G1 X227.583 Y41.875
G1 X218.25 Y32.542 E.39315
G1 X217.716 Y32.542
G1 X227.583 Y42.409 E.41562
G1 X227.583 Y42.942
G1 X217.183 Y32.542 E.43808
G1 X216.65 Y32.542
G1 X227.583 Y43.475 E.46054
G1 X227.583 Y44.009
G1 X216.116 Y32.542 E.48301
G1 X215.583 Y32.542
G1 X227.583 Y44.542 E.50547
M73 P91 R6
G1 X227.583 Y45.075
G1 X215.05 Y32.542 E.52793
G1 X214.517 Y32.542
G1 X227.583 Y45.608 E.5504
G1 X227.583 Y46.142
G1 X213.983 Y32.542 E.57286
G1 X213.45 Y32.542
G1 X227.583 Y46.675 E.59532
G1 X227.583 Y47.208
G1 X212.917 Y32.542 E.61779
G1 X212.384 Y32.542
G1 X227.583 Y47.741 E.64025
G1 X227.583 Y48.275
G1 X211.85 Y32.542 E.66271
G1 X211.317 Y32.542
G1 X227.583 Y48.808 E.68518
G1 X227.583 Y49.341
G1 X210.784 Y32.542 E.70764
G1 X210.251 Y32.542
G1 X227.583 Y49.874 E.7301
G1 X227.583 Y50.408
G1 X209.717 Y32.542 E.75257
G1 X209.184 Y32.542
G1 X227.583 Y50.941 E.77503
G1 X227.583 Y51.474
G1 X208.651 Y32.542 E.79749
G1 X208.118 Y32.542
G1 X227.583 Y52.007 E.81995
G1 X227.583 Y52.541
G1 X207.584 Y32.542 E.84242
G1 X207.051 Y32.542
G1 X216.476 Y41.967 E.39702
G1 X215.895 Y41.919
G1 X206.518 Y32.542 E.395
G1 X205.985 Y32.542
G1 X215.432 Y41.99 E.39798
G1 X215.044 Y42.135
G1 X205.451 Y32.542 E.40407
G1 X204.918 Y32.542
G1 X214.71 Y42.334 E.41246
G1 X214.422 Y42.58
G1 X204.385 Y32.542 E.42282
G1 X203.852 Y32.542
G1 X214.18 Y42.87 E.43506
G1 X213.984 Y43.208
G1 X203.318 Y32.542 E.4493
G1 X202.785 Y32.542
G1 X213.846 Y43.603 E.46594
G1 X213.787 Y44.078
G1 X202.252 Y32.542 E.48593
G1 X201.719 Y32.542
G1 X213.851 Y44.675 E.51109
; WIPE_START
M204 S10000
G1 X212.437 Y43.261 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X218.156 Y43.647 Z3.4 F30000
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X227.583 Y53.074 E.39711
G1 X227.583 Y53.607
G1 X218.208 Y44.232 E.39492
G1 X218.137 Y44.695
G1 X227.583 Y54.14 E.39789
G1 X227.583 Y54.674
G1 X217.992 Y45.083 E.404
G1 X217.792 Y45.416
G1 X227.583 Y55.207 E.41244
G1 X227.583 Y55.74
G1 X217.545 Y45.702 E.42284
G1 X217.253 Y45.944
G1 X227.583 Y56.273 E.43513
G1 X227.583 Y56.807
G1 X216.914 Y46.138 E.44942
G1 X216.518 Y46.275
G1 X227.583 Y57.34 E.46609
G1 X227.583 Y57.873
G1 X216.044 Y46.334 E.48607
G1 X215.437 Y46.261
G1 X227.583 Y58.406 E.51162
G1 X227.583 Y58.94
G1 X201.185 Y32.542 E1.11198
G1 X200.652 Y32.542
G1 X227.583 Y59.473 E1.13444
G1 X227.583 Y60.006
G1 X200.119 Y32.542 E1.1569
G1 X199.586 Y32.542
G1 X227.583 Y60.539 E1.17937
G1 X227.583 Y61.073
G1 X199.052 Y32.542 E1.20183
G1 X198.519 Y32.542
G1 X227.583 Y61.606 E1.22429
G1 X227.583 Y62.139
G1 X197.986 Y32.542 E1.24676
G1 X197.452 Y32.542
G1 X227.583 Y62.673 E1.26922
G1 X227.583 Y63.206
G1 X196.919 Y32.542 E1.29168
G1 X196.386 Y32.542
G1 X227.583 Y63.739 E1.31415
G1 X227.583 Y64.272
G1 X195.853 Y32.542 E1.33661
G1 X195.319 Y32.542
G1 X227.583 Y64.806 E1.35907
G1 X227.583 Y65.339
G1 X194.786 Y32.542 E1.38154
G1 X194.253 Y32.542
G1 X227.583 Y65.872 E1.404
G1 X227.583 Y66.405
G1 X193.72 Y32.542 E1.42646
G1 X193.186 Y32.542
G1 X227.583 Y66.939 E1.44893
G1 X227.583 Y67.472
G1 X192.653 Y32.542 E1.47139
G1 X192.12 Y32.542
G1 X227.583 Y68.005 E1.49385
G1 X227.583 Y68.538
G1 X191.587 Y32.542 E1.51632
G1 X191.053 Y32.542
G1 X227.583 Y69.072 E1.53878
G1 X227.583 Y69.605
G1 X190.52 Y32.542 E1.56124
G1 X189.987 Y32.542
G1 X227.583 Y70.138 E1.58371
G1 X227.583 Y70.671
G1 X189.454 Y32.542 E1.60617
G1 X188.92 Y32.542
G1 X227.583 Y71.205 E1.62863
G1 X227.583 Y71.738
G1 X188.387 Y32.542 E1.6511
G1 X187.854 Y32.542
G1 X227.583 Y72.271 E1.67356
G1 X227.583 Y72.804
G1 X187.321 Y32.542 E1.69602
G1 X186.787 Y32.542
G1 X227.583 Y73.338 E1.71849
G1 X227.583 Y73.871
G1 X186.254 Y32.542 E1.74095
G1 X185.721 Y32.542
G1 X227.583 Y74.404 E1.76341
G1 X227.583 Y74.937
G1 X185.188 Y32.542 E1.78587
G1 X184.654 Y32.542
G1 X227.583 Y75.471 E1.80834
G1 X227.583 Y76.004
G1 X184.121 Y32.542 E1.8308
G1 X183.588 Y32.542
G1 X227.583 Y76.537 E1.85326
G1 X227.583 Y77.07
G1 X183.055 Y32.542 E1.87573
G1 X182.521 Y32.542
G1 X227.583 Y77.604 E1.89819
G1 X227.583 Y78.137
G1 X181.988 Y32.542 E1.92065
G1 X181.455 Y32.542
G1 X227.583 Y78.67 E1.94312
G1 X227.583 Y79.203
G1 X204.417 Y56.038 E.97583
G1 X204.417 Y56.572
G1 X227.583 Y79.737 E.97583
G1 X227.583 Y80.27
G1 X204.417 Y57.105 E.97583
G1 X204.417 Y57.638
G1 X227.583 Y80.803 E.97583
G1 X227.583 Y81.337
G1 X204.417 Y58.171 E.97583
G1 X204.417 Y58.705
G1 X227.583 Y81.87 E.97583
G1 X227.583 Y82.403
G1 X204.417 Y59.238 E.97583
G1 X204.417 Y59.771
G1 X227.583 Y82.936 E.97583
G1 X227.583 Y83.47
G1 X204.417 Y60.304 E.97583
G1 X204.417 Y60.838
G1 X227.583 Y84.003 E.97583
G1 X227.583 Y84.536
G1 X204.417 Y61.371 E.97583
G1 X204.417 Y61.904
G1 X227.583 Y85.069 E.97583
G1 X227.583 Y85.603
G1 X204.417 Y62.437 E.97583
G1 X204.417 Y62.971
G1 X227.583 Y86.136 E.97583
G1 X227.583 Y86.669
G1 X204.417 Y63.504 E.97583
G1 X204.417 Y64.037
G1 X227.583 Y87.202 E.97583
G1 X227.583 Y87.736
G1 X204.417 Y64.57 E.97583
G1 X204.417 Y65.104
G1 X227.583 Y88.269 E.97583
G1 X227.583 Y88.802
G1 X204.417 Y65.637 E.97583
G1 X204.417 Y66.17
G1 X227.583 Y89.335 E.97583
G1 X227.583 Y89.869
G1 X204.417 Y66.703 E.97583
G1 X204.417 Y67.237
G1 X227.583 Y90.402 E.97583
G1 X227.583 Y90.935
G1 X204.417 Y67.77 E.97583
G1 X204.417 Y68.303
G1 X227.583 Y91.468 E.97583
G1 X227.583 Y92.002
G1 X204.417 Y68.836 E.97583
G1 X204.417 Y69.37
G1 X227.583 Y92.535 E.97583
G1 X227.583 Y93.068
G1 X204.417 Y69.903 E.97583
G1 X204.417 Y70.436
G1 X227.583 Y93.601 E.97583
G1 X227.583 Y94.135
G1 X204.417 Y70.969 E.97583
G1 X204.417 Y71.503
G1 X227.583 Y94.668 E.97583
G1 X227.583 Y95.201
G1 X204.417 Y72.036 E.97583
G1 X204.417 Y72.569
G1 X227.583 Y95.734 E.97583
G1 X227.583 Y96.268
G1 X204.417 Y73.102 E.97583
G1 X204.417 Y73.636
G1 X227.583 Y96.801 E.97583
G1 X227.583 Y97.334
G1 X204.417 Y74.169 E.97583
G1 X204.417 Y74.702
G1 X227.583 Y97.868 E.97583
G1 X227.583 Y98.401
G1 X204.417 Y75.236 E.97583
G1 X204.417 Y75.769
G1 X227.583 Y98.934 E.97583
G1 X227.583 Y99.467
G1 X204.417 Y76.302 E.97583
G1 X204.417 Y76.835
G1 X227.583 Y100.001 E.97583
G1 X227.583 Y100.534
G1 X204.417 Y77.369 E.97583
G1 X204.417 Y77.902
G1 X227.583 Y101.067 E.97583
G1 X227.583 Y101.6
G1 X204.417 Y78.435 E.97583
G1 X204.417 Y78.968
G1 X227.583 Y102.134 E.97583
G1 X227.583 Y102.667
G1 X204.417 Y79.502 E.97583
G1 X204.417 Y80.035
G1 X227.583 Y103.2 E.97583
G1 X227.583 Y103.733
G1 X204.417 Y80.568 E.97583
G1 X204.417 Y81.101
G1 X227.583 Y104.267 E.97583
G1 X227.583 Y104.8
G1 X204.417 Y81.635 E.97583
G1 X204.417 Y82.168
G1 X227.583 Y105.333 E.97583
G1 X227.583 Y105.866
G1 X204.417 Y82.701 E.97583
G1 X204.417 Y83.234
G1 X227.583 Y106.4 E.97583
G1 X227.583 Y106.933
G1 X204.417 Y83.768 E.97583
G1 X204.417 Y84.301
G1 X227.583 Y107.466 E.97583
G1 X227.583 Y107.999
G1 X204.417 Y84.834 E.97583
G1 X204.417 Y85.367
G1 X227.583 Y108.533 E.97583
G1 X227.583 Y109.066
G1 X204.417 Y85.901 E.97583
G1 X204.417 Y86.434
G1 X227.583 Y109.599 E.97583
G1 X227.583 Y110.132
G1 X204.417 Y86.967 E.97583
G1 X204.417 Y87.5
G1 X227.583 Y110.666 E.97583
G1 X227.583 Y111.199
G1 X204.417 Y88.034 E.97583
G1 X204.417 Y88.567
G1 X227.583 Y111.732 E.97583
G1 X227.583 Y112.265
G1 X204.417 Y89.1 E.97583
G1 X204.417 Y89.633
G1 X227.583 Y112.799 E.97583
G1 X227.583 Y113.332
G1 X204.417 Y90.167 E.97583
G1 X204.417 Y90.7
G1 X227.583 Y113.865 E.97583
G1 X227.583 Y114.398
G1 X204.417 Y91.233 E.97583
G1 X204.417 Y91.767
G1 X227.583 Y114.932 E.97583
G1 X227.583 Y115.465
G1 X204.417 Y92.3 E.97583
G1 X204.417 Y92.833
G1 X227.583 Y115.998 E.97583
G1 X227.583 Y116.532
G1 X204.417 Y93.366 E.97583
G1 X204.417 Y93.9
G1 X227.583 Y117.065 E.97583
G1 X227.583 Y117.598
G1 X204.417 Y94.433 E.97583
G1 X204.417 Y94.966
G1 X227.583 Y118.131 E.97583
G1 X227.583 Y118.665
G1 X204.417 Y95.499 E.97583
G1 X204.417 Y96.033
G1 X227.583 Y119.198 E.97583
G1 X227.583 Y119.731
G1 X204.417 Y96.566 E.97583
G1 X204.417 Y97.099
G1 X227.583 Y120.264 E.97583
G1 X227.583 Y120.798
G1 X204.417 Y97.632 E.97583
G1 X204.417 Y98.166
G1 X227.583 Y121.331 E.97583
G1 X227.583 Y121.864
G1 X204.417 Y98.699 E.97583
G1 X204.417 Y99.232
G1 X227.583 Y122.397 E.97583
G1 X227.583 Y122.931
G1 X204.417 Y99.765 E.97583
G1 X204.417 Y100.299
G1 X227.583 Y123.464 E.97583
G1 X227.583 Y123.997
G1 X204.417 Y100.832 E.97583
G1 X204.417 Y101.365
G1 X227.583 Y124.53 E.97583
G1 X227.583 Y125.064
G1 X204.417 Y101.898 E.97583
G1 X204.417 Y102.432
G1 X227.583 Y125.597 E.97583
M73 P92 R6
G1 X227.583 Y126.13
G1 X204.417 Y102.965 E.97583
G1 X204.417 Y103.498
G1 X227.583 Y126.663 E.97583
G1 X227.583 Y127.197
G1 X204.417 Y104.031 E.97583
G1 X204.417 Y104.565
G1 X227.583 Y127.73 E.97583
G1 X227.583 Y128.263
G1 X204.417 Y105.098 E.97583
G1 X204.417 Y105.631
G1 X227.583 Y128.796 E.97583
G1 X227.583 Y129.33
G1 X204.417 Y106.164 E.97583
G1 X204.417 Y106.698
G1 X227.583 Y129.863 E.97583
G1 X227.583 Y130.396
G1 X204.417 Y107.231 E.97583
G1 X204.417 Y107.764
G1 X227.583 Y130.929 E.97583
G1 X227.583 Y131.463
G1 X204.417 Y108.297 E.97583
G1 X204.417 Y108.831
G1 X227.583 Y131.996 E.97583
G1 X227.583 Y132.529
G1 X204.417 Y109.364 E.97583
G1 X204.417 Y109.897
G1 X227.583 Y133.063 E.97583
G1 X227.583 Y133.596
G1 X204.417 Y110.431 E.97583
G1 X204.417 Y110.964
G1 X227.583 Y134.129 E.97583
G1 X227.583 Y134.662
G1 X218.014 Y125.093 E.4031
G1 X218.208 Y125.821
G1 X227.583 Y135.196 E.39492
G1 X227.583 Y135.729
G1 X218.185 Y126.331 E.39586
G1 X218.077 Y126.756
G1 X227.583 Y136.262 E.40042
G1 X227.583 Y136.795
G1 X217.908 Y127.121 E.40754
G1 X217.69 Y127.436
G1 X227.583 Y137.329 E.41673
G1 X227.583 Y137.862
G1 X217.42 Y127.699 E.4281
G1 X217.103 Y127.916
G1 X227.583 Y138.395 E.44144
G1 X227.583 Y138.928
G1 X216.737 Y128.082 E.45688
G1 X216.308 Y128.187
G1 X227.583 Y139.462 E.47492
G1 X227.583 Y139.995
G1 X215.791 Y128.203 E.49672
M73 P92 R5
G1 X215.046 Y127.992
G1 X227.583 Y140.528 E.5281
; WIPE_START
M204 S10000
G1 X226.168 Y139.114 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X222.183 Y132.605 Z3.4 F30000
G1 X216.903 Y123.983 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X204.417 Y111.497 E.52596
G1 X204.417 Y112.03
G1 X216.177 Y123.789 E.49535
G1 X215.666 Y123.812
G1 X204.417 Y112.564 E.47383
G1 X204.417 Y113.097
G1 X215.241 Y123.92 E.45594
G1 X214.876 Y124.089
G1 X204.417 Y113.63 E.44058
G1 X204.417 Y114.163
G1 X214.566 Y124.312 E.42751
G1 X214.303 Y124.583
G1 X204.417 Y114.697 E.41645
G1 X204.417 Y115.23
G1 X214.086 Y124.898 E.40728
G1 X213.918 Y125.264
G1 X204.417 Y115.763 E.40023
G1 X204.417 Y116.296
G1 X213.814 Y125.693 E.39582
G1 X213.8 Y126.212
G1 X204.417 Y116.83 E.39525
G1 X204.417 Y117.363
G1 X213.992 Y126.937 E.40332
; WIPE_START
M204 S10000
G1 X212.578 Y125.523 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X207.002 Y120.311 Z3.4 F30000
G1 X204.417 Y117.896 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X227.583 Y141.061 E.97583
G1 X227.583 Y141.595
G1 X204.417 Y118.429 E.97583
G1 X204.417 Y118.963
G1 X227.583 Y142.128 E.97583
G1 X227.583 Y142.661
G1 X204.417 Y119.496 E.97583
G1 X204.417 Y120.029
G1 X227.583 Y143.194 E.97583
G1 X227.583 Y143.728
G1 X204.417 Y120.562 E.97583
G1 X204.417 Y121.096
G1 X227.583 Y144.261 E.97583
G1 X227.583 Y144.794
G1 X204.417 Y121.629 E.97583
G1 X204.417 Y122.162
G1 X227.583 Y145.327 E.97583
G1 X227.583 Y145.861
G1 X204.417 Y122.695 E.97583
G1 X204.417 Y123.229
G1 X227.583 Y146.394 E.97583
G1 X227.583 Y146.927
G1 X204.417 Y123.762 E.97583
G1 X204.417 Y124.295
G1 X227.583 Y147.46 E.97583
G1 X227.583 Y147.994
G1 X204.417 Y124.828 E.97583
G1 X204.417 Y125.362
G1 X227.583 Y148.527 E.97583
G1 X227.583 Y149.06
G1 X204.417 Y125.895 E.97583
G1 X204.417 Y126.428
G1 X227.583 Y149.593 E.97583
G1 X227.583 Y150.127
G1 X204.417 Y126.962 E.97583
G1 X204.417 Y127.495
G1 X227.583 Y150.66 E.97583
G1 X227.583 Y151.193
G1 X204.417 Y128.028 E.97583
G1 X204.417 Y128.561
G1 X227.583 Y151.727 E.97583
G1 X227.583 Y152.26
G1 X204.417 Y129.095 E.97583
G1 X204.417 Y129.628
G1 X227.583 Y152.793 E.97583
G1 X227.583 Y153.326
G1 X204.417 Y130.161 E.97583
G1 X204.417 Y130.694
G1 X227.583 Y153.86 E.97583
G1 X227.583 Y154.393
G1 X204.417 Y131.228 E.97583
G1 X204.417 Y131.761
G1 X227.583 Y154.926 E.97583
G1 X227.583 Y155.459
G1 X204.417 Y132.294 E.97583
G1 X204.417 Y132.827
G1 X227.583 Y155.993 E.97583
G1 X227.583 Y156.526
G1 X204.417 Y133.361 E.97583
G1 X204.417 Y133.894
G1 X227.583 Y157.059 E.97583
G1 X227.583 Y157.592
G1 X204.417 Y134.427 E.97583
G1 X204.417 Y134.96
G1 X227.583 Y158.126 E.97583
G1 X227.583 Y158.659
G1 X204.417 Y135.494 E.97583
G1 X204.417 Y136.027
G1 X227.583 Y159.192 E.97583
G1 X227.583 Y159.725
G1 X204.417 Y136.56 E.97583
G1 X204.417 Y137.093
G1 X227.583 Y160.259 E.97583
G1 X227.583 Y160.792
G1 X204.417 Y137.627 E.97583
G1 X204.417 Y138.16
G1 X227.583 Y161.325 E.97583
G1 X227.583 Y161.858
G1 X204.417 Y138.693 E.97583
G1 X204.417 Y139.226
G1 X227.583 Y162.392 E.97583
G1 X227.583 Y162.925
G1 X204.417 Y139.76 E.97583
G1 X204.417 Y140.293
G1 X227.583 Y163.458 E.97583
G1 X227.583 Y163.991
G1 X204.417 Y140.826 E.97583
G1 X204.417 Y141.359
G1 X227.583 Y164.525 E.97583
G1 X227.583 Y165.058
G1 X204.417 Y141.893 E.97583
G1 X204.417 Y142.426
G1 X227.583 Y165.591 E.97583
G1 X227.583 Y166.124
G1 X204.417 Y142.959 E.97583
G1 X204.417 Y143.492
G1 X227.583 Y166.658 E.97583
G1 X227.583 Y167.191
G1 X204.417 Y144.026 E.97583
G1 X204.417 Y144.559
G1 X227.583 Y167.724 E.97583
G1 X227.583 Y168.258
G1 X204.417 Y145.092 E.97583
G1 X204.417 Y145.626
G1 X227.583 Y168.791 E.97583
G1 X227.583 Y169.324
G1 X204.417 Y146.159 E.97583
G1 X204.417 Y146.692
G1 X227.583 Y169.857 E.97583
G1 X227.583 Y170.391
G1 X204.417 Y147.225 E.97583
G1 X204.417 Y147.759
G1 X227.583 Y170.924 E.97583
G1 X227.583 Y171.457
G1 X204.417 Y148.292 E.97583
G1 X204.417 Y148.825
G1 X227.583 Y171.99 E.97583
G1 X227.583 Y172.524
G1 X204.417 Y149.358 E.97583
G1 X204.417 Y149.892
G1 X227.583 Y173.057 E.97583
G1 X227.583 Y173.59
G1 X204.417 Y150.425 E.97583
G1 X204.417 Y150.958
G1 X227.583 Y174.123 E.97583
G1 X227.583 Y174.657
G1 X204.417 Y151.491 E.97583
G1 X204.417 Y152.025
G1 X227.583 Y175.19 E.97583
G1 X227.583 Y175.723
G1 X204.417 Y152.558 E.97583
G1 X204.417 Y153.091
G1 X227.583 Y176.256 E.97583
G1 X227.583 Y176.79
G1 X204.417 Y153.624 E.97583
G1 X204.417 Y154.158
G1 X227.583 Y177.323 E.97583
G1 X227.583 Y177.856
G1 X204.417 Y154.691 E.97583
G1 X204.417 Y155.224
G1 X227.583 Y178.389 E.97583
G1 X227.583 Y178.923
G1 X204.417 Y155.757 E.97583
G1 X204.417 Y156.291
G1 X227.583 Y179.456 E.97583
G1 X227.583 Y179.989
G1 X204.417 Y156.824 E.97583
G1 X204.417 Y157.357
G1 X227.583 Y180.522 E.97583
G1 X227.583 Y181.056
G1 X204.417 Y157.89 E.97583
G1 X204.417 Y158.424
G1 X227.583 Y181.589 E.97583
G1 X227.583 Y182.122
G1 X204.417 Y158.957 E.97583
G1 X204.417 Y159.49
G1 X227.583 Y182.655 E.97583
G1 X227.583 Y183.189
G1 X204.417 Y160.023 E.97583
G1 X204.417 Y160.557
G1 X227.583 Y183.722 E.97583
G1 X227.583 Y184.255
G1 X204.417 Y161.09 E.97583
G1 X204.417 Y161.623
G1 X227.583 Y184.788 E.97583
G1 X227.583 Y185.322
G1 X204.417 Y162.157 E.97583
G1 X204.417 Y162.69
G1 X227.583 Y185.855 E.97583
G1 X227.583 Y186.388
G1 X204.417 Y163.223 E.97583
G1 X204.417 Y163.756
G1 X227.583 Y186.922 E.97583
G1 X227.583 Y187.455
G1 X204.417 Y164.29 E.97583
G1 X204.417 Y164.823
G1 X227.583 Y187.988 E.97583
G1 X227.583 Y188.521
G1 X204.417 Y165.356 E.97583
G1 X204.417 Y165.889
G1 X227.583 Y189.055 E.97583
G1 X227.583 Y189.588
G1 X204.417 Y166.423 E.97583
G1 X204.417 Y166.956
G1 X227.583 Y190.121 E.97583
G1 X227.583 Y190.654
G1 X204.417 Y167.489 E.97583
G1 X204.417 Y168.022
G1 X227.583 Y191.188 E.97583
G1 X227.583 Y191.721
G1 X204.417 Y168.556 E.97583
G1 X204.417 Y169.089
G1 X227.583 Y192.254 E.97583
G1 X227.583 Y192.787
G1 X204.417 Y169.622 E.97583
G1 X204.417 Y170.155
G1 X227.583 Y193.321 E.97583
G1 X227.583 Y193.854
G1 X204.417 Y170.689 E.97583
G1 X204.417 Y171.222
G1 X227.583 Y194.387 E.97583
G1 X227.583 Y194.92
G1 X204.417 Y171.755 E.97583
G1 X204.417 Y172.288
G1 X227.583 Y195.454 E.97583
G1 X227.583 Y195.987
G1 X204.417 Y172.822 E.97583
G1 X204.417 Y173.355
G1 X227.583 Y196.52 E.97583
G1 X227.583 Y197.053
G1 X204.417 Y173.888 E.97583
G1 X204.417 Y174.421
G1 X227.583 Y197.587 E.97583
G1 X227.583 Y198.12
G1 X204.417 Y174.955 E.97583
G1 X204.417 Y175.488
G1 X227.583 Y198.653 E.97583
G1 X227.583 Y199.186
G1 X204.417 Y176.021 E.97583
G1 X204.417 Y176.554
G1 X227.583 Y199.72 E.97583
G1 X227.583 Y200.253
G1 X204.417 Y177.088 E.97583
G1 X204.417 Y177.621
G1 X227.583 Y200.786 E.97583
G1 X227.583 Y201.319
G1 X204.417 Y178.154 E.97583
G1 X204.417 Y178.687
G1 X227.583 Y201.853 E.97583
G1 X227.583 Y202.386
G1 X204.417 Y179.221 E.97583
G1 X204.417 Y179.754
G1 X227.583 Y202.919 E.97583
G1 X227.583 Y203.452
G1 X204.417 Y180.287 E.97583
G1 X204.417 Y180.821
G1 X227.583 Y203.986 E.97583
G1 X227.583 Y204.519
G1 X204.417 Y181.354 E.97583
G1 X204.417 Y181.887
G1 X227.583 Y205.052 E.97583
G1 X227.583 Y205.586
G1 X204.417 Y182.42 E.97583
M73 P93 R5
G1 X204.417 Y182.954
G1 X227.583 Y206.119 E.97583
G1 X227.583 Y206.652
G1 X204.417 Y183.487 E.97583
G1 X204.417 Y184.02
G1 X227.583 Y207.185 E.97583
G1 X227.583 Y207.719
G1 X204.417 Y184.553 E.97583
G1 X204.417 Y185.087
G1 X227.583 Y208.252 E.97583
G1 X227.583 Y208.785
G1 X204.417 Y185.62 E.97583
G1 X204.417 Y186.153
G1 X227.583 Y209.318 E.97583
G1 X227.583 Y209.852
G1 X204.417 Y186.686 E.97583
G1 X204.417 Y187.22
G1 X227.583 Y210.385 E.97583
G1 X227.583 Y210.918
G1 X204.417 Y187.753 E.97583
G1 X204.417 Y188.286
G1 X227.583 Y211.451 E.97583
G1 X227.583 Y211.985
G1 X204.417 Y188.819 E.97583
G1 X204.417 Y189.353
G1 X227.583 Y212.518 E.97583
G1 X227.583 Y213.051
G1 X204.417 Y189.886 E.97583
G1 X204.417 Y190.419
G1 X227.583 Y213.584 E.97583
G1 X227.583 Y214.118
G1 X204.417 Y190.952 E.97583
G1 X204.417 Y191.486
G1 X227.583 Y214.651 E.97583
G1 X227.583 Y215.184
G1 X204.417 Y192.019 E.97583
G1 X204.417 Y192.552
G1 X227.583 Y215.717 E.97583
G1 X227.583 Y216.251
G1 X204.417 Y193.085 E.97583
G1 X204.417 Y193.619
G1 X216.524 Y205.726 E.51
G1 X215.934 Y205.668
G1 X204.417 Y194.152 E.48512
G1 X204.417 Y194.685
G1 X215.465 Y205.733 E.46537
G1 X215.071 Y205.872
G1 X204.417 Y195.218 E.44878
G1 X204.417 Y195.752
G1 X214.733 Y206.067 E.43453
G1 X214.441 Y206.309
G1 X204.417 Y196.285 E.42226
G1 X203.892 Y196.292
G1 X214.195 Y206.596 E.43402
G1 X213.995 Y206.929
G1 X203.358 Y196.292 E.44807
G1 X202.825 Y196.292
G1 X213.853 Y207.32 E.46454
G1 X213.785 Y207.786
G1 X202.292 Y196.292 E.48415
G1 X201.758 Y196.292
G1 X213.841 Y208.375 E.50898
; WIPE_START
M204 S10000
G1 X212.427 Y206.961 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X218.146 Y207.347 Z3.4 F30000
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X227.583 Y216.784 E.39753
G1 X227.583 Y217.317
G1 X218.208 Y207.942 E.39492
G1 X218.144 Y208.412
G1 X227.583 Y217.85 E.39761
G1 X227.583 Y218.384
G1 X218.004 Y208.805 E.4035
G1 X217.808 Y209.142
G1 X227.583 Y218.917 E.41176
G1 X227.583 Y219.45
G1 X217.565 Y209.433 E.42199
G1 X217.277 Y209.678
G1 X227.057 Y219.458 E.41196
G1 X226.524 Y219.458
G1 X216.943 Y209.877 E.40359
G1 X216.552 Y210.019
G1 X225.99 Y219.458 E.39758
G1 X225.457 Y219.458
G1 X216.085 Y210.085 E.3948
G1 X215.489 Y210.023
G1 X224.924 Y219.458 E.39744
G1 X224.39 Y219.458
G1 X201.225 Y196.292 E.97583
G1 X200.692 Y196.292
G1 X223.857 Y219.458 E.97583
G1 X223.324 Y219.458
G1 X200.159 Y196.292 E.97583
G1 X199.625 Y196.292
G1 X222.791 Y219.458 E.97583
G1 X222.257 Y219.458
G1 X199.092 Y196.292 E.97583
G1 X198.559 Y196.292
G1 X221.724 Y219.458 E.97583
G1 X221.191 Y219.458
G1 X198.026 Y196.292 E.97583
G1 X197.492 Y196.292
G1 X220.658 Y219.458 E.97583
G1 X220.124 Y219.458
G1 X196.959 Y196.292 E.97583
G1 X196.426 Y196.292
G1 X219.591 Y219.458 E.97583
G1 X219.058 Y219.458
G1 X195.893 Y196.292 E.97583
G1 X195.359 Y196.292
G1 X218.525 Y219.458 E.97583
G1 X217.991 Y219.458
G1 X194.826 Y196.292 E.97583
G1 X194.293 Y196.292
G1 X217.458 Y219.458 E.97583
G1 X216.925 Y219.458
G1 X193.76 Y196.292 E.97583
G1 X193.226 Y196.292
G1 X216.392 Y219.458 E.97583
G1 X215.858 Y219.458
G1 X192.693 Y196.292 E.97583
G1 X192.16 Y196.292
G1 X215.325 Y219.458 E.97583
G1 X214.792 Y219.458
G1 X191.627 Y196.292 E.97583
G1 X191.093 Y196.292
G1 X214.259 Y219.458 E.97583
G1 X213.725 Y219.458
G1 X190.56 Y196.292 E.97583
G1 X190.027 Y196.292
G1 X213.192 Y219.458 E.97583
G1 X212.659 Y219.458
G1 X189.494 Y196.292 E.97583
G1 X188.96 Y196.292
G1 X212.126 Y219.458 E.97583
G1 X211.592 Y219.458
G1 X188.427 Y196.292 E.97583
G1 X187.894 Y196.292
G1 X211.059 Y219.458 E.97583
G1 X210.526 Y219.458
G1 X187.361 Y196.292 E.97583
G1 X186.827 Y196.292
G1 X209.993 Y219.458 E.97583
G1 X209.459 Y219.458
G1 X186.294 Y196.292 E.97583
G1 X185.761 Y196.292
G1 X208.926 Y219.458 E.97583
G1 X208.393 Y219.458
G1 X185.228 Y196.292 E.97583
G1 X184.694 Y196.292
G1 X207.859 Y219.458 E.97583
G1 X207.326 Y219.458
G1 X184.161 Y196.292 E.97583
G1 X183.628 Y196.292
G1 X206.793 Y219.458 E.97583
G1 X206.26 Y219.458
G1 X183.094 Y196.292 E.97583
G1 X182.561 Y196.292
G1 X205.726 Y219.458 E.97583
G1 X205.193 Y219.458
G1 X182.028 Y196.292 E.97583
G1 X181.495 Y196.292
G1 X204.66 Y219.458 E.97583
G1 X204.127 Y219.458
G1 X180.961 Y196.292 E.97583
G1 X180.428 Y196.292
G1 X203.593 Y219.458 E.97583
M73 P93 R4
G1 X203.06 Y219.458
G1 X179.895 Y196.292 E.97583
G1 X179.362 Y196.292
G1 X202.527 Y219.458 E.97583
G1 X201.994 Y219.458
G1 X178.828 Y196.292 E.97583
G1 X178.295 Y196.292
G1 X201.46 Y219.458 E.97583
G1 X200.927 Y219.458
G1 X177.762 Y196.292 E.97583
G1 X177.229 Y196.292
G1 X200.394 Y219.458 E.97583
G1 X199.861 Y219.458
G1 X176.695 Y196.292 E.97583
G1 X176.162 Y196.292
G1 X199.327 Y219.458 E.97583
G1 X198.794 Y219.458
G1 X175.629 Y196.292 E.97583
G1 X175.096 Y196.292
G1 X198.261 Y219.458 E.97583
G1 X197.728 Y219.458
G1 X174.562 Y196.292 E.97583
G1 X174.029 Y196.292
G1 X197.194 Y219.458 E.97583
G1 X196.661 Y219.458
G1 X173.496 Y196.292 E.97583
G1 X172.963 Y196.292
G1 X196.128 Y219.458 E.97583
G1 X195.595 Y219.458
G1 X172.429 Y196.292 E.97583
G1 X171.896 Y196.292
G1 X195.061 Y219.458 E.97583
G1 X194.528 Y219.458
G1 X171.363 Y196.292 E.97583
G1 X170.83 Y196.292
G1 X193.995 Y219.458 E.97583
G1 X193.462 Y219.458
G1 X170.296 Y196.292 E.97583
G1 X169.763 Y196.292
G1 X192.928 Y219.458 E.97583
G1 X192.395 Y219.458
G1 X169.23 Y196.292 E.97583
G1 X168.697 Y196.292
G1 X191.862 Y219.458 E.97583
G1 X191.329 Y219.458
G1 X168.163 Y196.292 E.97583
G1 X167.63 Y196.292
G1 X190.795 Y219.458 E.97583
G1 X190.262 Y219.458
G1 X167.097 Y196.292 E.97583
G1 X166.564 Y196.292
G1 X189.729 Y219.458 E.97583
G1 X189.195 Y219.458
G1 X166.03 Y196.292 E.97583
G1 X165.497 Y196.292
G1 X188.662 Y219.458 E.97583
G1 X188.129 Y219.458
G1 X164.964 Y196.292 E.97583
G1 X164.43 Y196.292
G1 X187.596 Y219.458 E.97583
G1 X187.062 Y219.458
G1 X163.897 Y196.292 E.97583
G1 X163.364 Y196.292
G1 X186.529 Y219.458 E.97583
G1 X185.996 Y219.458
G1 X162.831 Y196.292 E.97583
G1 X162.297 Y196.292
G1 X185.463 Y219.458 E.97583
G1 X184.929 Y219.458
G1 X161.764 Y196.292 E.97583
G1 X161.231 Y196.292
G1 X184.396 Y219.458 E.97583
G1 X183.863 Y219.458
G1 X160.698 Y196.292 E.97583
G1 X160.164 Y196.292
G1 X183.33 Y219.458 E.97583
G1 X182.796 Y219.458
G1 X159.631 Y196.292 E.97583
G1 X159.098 Y196.292
G1 X182.263 Y219.458 E.97583
G1 X181.73 Y219.458
G1 X158.565 Y196.292 E.97583
G1 X158.031 Y196.292
G1 X181.197 Y219.458 E.97583
G1 X180.663 Y219.458
G1 X157.498 Y196.292 E.97583
G1 X156.965 Y196.292
G1 X180.13 Y219.458 E.97583
G1 X179.597 Y219.458
G1 X156.432 Y196.292 E.97583
G1 X155.898 Y196.292
G1 X179.064 Y219.458 E.97583
G1 X178.53 Y219.458
G1 X155.365 Y196.292 E.97583
G1 X154.832 Y196.292
G1 X177.997 Y219.458 E.97583
G1 X177.464 Y219.458
G1 X154.299 Y196.292 E.97583
G1 X153.765 Y196.292
G1 X176.931 Y219.458 E.97583
G1 X176.397 Y219.458
G1 X153.232 Y196.292 E.97583
G1 X152.699 Y196.292
G1 X175.864 Y219.458 E.97583
G1 X175.331 Y219.458
G1 X152.166 Y196.292 E.97583
G1 X151.632 Y196.292
G1 X174.798 Y219.458 E.97583
G1 X174.264 Y219.458
G1 X151.099 Y196.292 E.97583
G1 X150.566 Y196.292
G1 X173.731 Y219.458 E.97583
G1 X173.198 Y219.458
G1 X150.033 Y196.292 E.97583
G1 X149.499 Y196.292
G1 X172.665 Y219.458 E.97583
G1 X172.131 Y219.458
G1 X148.966 Y196.292 E.97583
G1 X148.433 Y196.292
G1 X171.598 Y219.458 E.97583
G1 X171.065 Y219.458
G1 X147.899 Y196.292 E.97583
G1 X147.366 Y196.292
G1 X170.531 Y219.458 E.97583
G1 X169.998 Y219.458
G1 X146.833 Y196.292 E.97583
G1 X146.3 Y196.292
G1 X169.465 Y219.458 E.97583
G1 X168.932 Y219.458
G1 X145.766 Y196.292 E.97583
G1 X145.233 Y196.292
G1 X168.398 Y219.458 E.97583
G1 X167.865 Y219.458
G1 X144.7 Y196.292 E.97583
G1 X144.167 Y196.292
G1 X167.332 Y219.458 E.97583
G1 X166.799 Y219.458
G1 X143.633 Y196.292 E.97583
G1 X143.1 Y196.292
G1 X166.265 Y219.458 E.97583
G1 X165.732 Y219.458
G1 X142.567 Y196.292 E.97583
G1 X142.034 Y196.292
G1 X165.199 Y219.458 E.97583
G1 X164.666 Y219.458
G1 X141.5 Y196.292 E.97583
G1 X140.967 Y196.292
G1 X164.132 Y219.458 E.97583
G1 X163.599 Y219.458
G1 X140.434 Y196.292 E.97583
G1 X139.901 Y196.292
G1 X163.066 Y219.458 E.97583
G1 X162.533 Y219.458
G1 X139.367 Y196.292 E.97583
G1 X138.834 Y196.292
G1 X161.999 Y219.458 E.97583
G1 X161.466 Y219.458
G1 X138.301 Y196.292 E.97583
G1 X137.768 Y196.292
G1 X160.933 Y219.458 E.97583
M73 P94 R4
G1 X160.4 Y219.458
G1 X137.234 Y196.292 E.97583
G1 X136.701 Y196.292
G1 X159.866 Y219.458 E.97583
G1 X159.333 Y219.458
G1 X136.168 Y196.292 E.97583
G1 X135.635 Y196.292
G1 X158.8 Y219.458 E.97583
G1 X158.267 Y219.458
G1 X135.101 Y196.292 E.97583
G1 X134.568 Y196.292
G1 X157.733 Y219.458 E.97583
G1 X157.2 Y219.458
G1 X134.035 Y196.292 E.97583
G1 X133.502 Y196.292
G1 X156.667 Y219.458 E.97583
G1 X156.134 Y219.458
G1 X132.968 Y196.292 E.97583
G1 X132.435 Y196.292
G1 X155.6 Y219.458 E.97583
G1 X155.067 Y219.458
G1 X131.902 Y196.292 E.97583
G1 X131.369 Y196.292
G1 X154.534 Y219.458 E.97583
G1 X154 Y219.458
G1 X130.835 Y196.292 E.97583
G1 X130.302 Y196.292
G1 X153.467 Y219.458 E.97583
G1 X152.934 Y219.458
G1 X129.769 Y196.292 E.97583
G1 X129.235 Y196.292
G1 X152.401 Y219.458 E.97583
G1 X151.867 Y219.458
G1 X128.702 Y196.292 E.97583
G1 X128.169 Y196.292
G1 X151.334 Y219.458 E.97583
G1 X150.801 Y219.458
G1 X127.636 Y196.292 E.97583
G1 X127.102 Y196.292
G1 X150.268 Y219.458 E.97583
G1 X149.734 Y219.458
G1 X126.569 Y196.292 E.97583
G1 X126.036 Y196.292
G1 X149.201 Y219.458 E.97583
G1 X148.668 Y219.458
G1 X125.503 Y196.292 E.97583
G1 X124.969 Y196.292
G1 X148.135 Y219.458 E.97583
G1 X147.601 Y219.458
G1 X124.436 Y196.292 E.97583
G1 X123.903 Y196.292
G1 X147.068 Y219.458 E.97583
G1 X146.535 Y219.458
G1 X123.37 Y196.292 E.97583
G1 X122.836 Y196.292
G1 X146.002 Y219.458 E.97583
G1 X145.468 Y219.458
G1 X122.303 Y196.292 E.97583
G1 X121.77 Y196.292
G1 X144.935 Y219.458 E.97583
G1 X144.402 Y219.458
G1 X121.237 Y196.292 E.97583
G1 X120.703 Y196.292
G1 X143.869 Y219.458 E.97583
G1 X143.335 Y219.458
G1 X120.17 Y196.292 E.97583
G1 X119.637 Y196.292
G1 X142.802 Y219.458 E.97583
G1 X142.269 Y219.458
G1 X130.142 Y207.331 E.51082
G1 X130.208 Y207.93
G1 X141.736 Y219.458 E.48561
G1 X141.202 Y219.458
G1 X130.146 Y208.401 E.46575
G1 X130.007 Y208.796
G1 X140.669 Y219.458 E.44911
G1 X140.136 Y219.458
G1 X129.813 Y209.135 E.43484
G1 X129.571 Y209.426
G1 X139.603 Y219.458 E.42256
G1 X139.069 Y219.458
G1 X129.285 Y209.673 E.41216
G1 X128.952 Y209.873
G1 X138.536 Y219.458 E.40374
G1 X138.003 Y219.458
G1 X128.563 Y210.018 E.39766
G1 X128.098 Y210.086
G1 X137.47 Y219.458 E.39478
G1 X136.936 Y219.458
G1 X127.505 Y210.026 E.39728
; WIPE_START
M204 S10000
G1 X128.919 Y211.441 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.54 Y205.728 Z3.4 F30000
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X119.104 Y196.292 E.39749
G1 X118.57 Y196.292
G1 X127.946 Y205.668 E.39494
G1 X127.475 Y205.73
G1 X118.037 Y196.292 E.39757
G1 X117.504 Y196.292
G1 X127.08 Y205.868 E.40338
G1 X126.74 Y206.062
G1 X116.971 Y196.292 E.41153
G1 X116.437 Y196.292
G1 X126.447 Y206.303 E.42167
G1 X126.199 Y206.588
G1 X115.904 Y196.292 E.43369
G1 X115.371 Y196.292
G1 X125.998 Y206.92 E.44768
G1 X125.856 Y207.311
G1 X114.838 Y196.292 E.46415
G1 X114.304 Y196.292
G1 X125.784 Y207.773 E.4836
G1 X125.848 Y208.369
G1 X113.771 Y196.292 E.50873
G1 X113.238 Y196.292
G1 X136.403 Y219.458 E.97583
G1 X135.87 Y219.458
G1 X112.704 Y196.292 E.97583
G1 X112.171 Y196.292
G1 X135.336 Y219.458 E.97583
G1 X134.803 Y219.458
G1 X111.638 Y196.292 E.97583
G1 X111.105 Y196.292
G1 X134.27 Y219.458 E.97583
G1 X133.737 Y219.458
G1 X110.571 Y196.292 E.97583
G1 X110.038 Y196.292
G1 X133.203 Y219.458 E.97583
G1 X132.67 Y219.458
G1 X109.505 Y196.292 E.97583
G1 X108.972 Y196.292
G1 X132.137 Y219.458 E.97583
G1 X131.604 Y219.458
G1 X108.438 Y196.292 E.97583
G1 X107.905 Y196.292
G1 X131.07 Y219.458 E.97583
G1 X130.537 Y219.458
G1 X107.372 Y196.292 E.97583
G1 X106.839 Y196.292
G1 X130.004 Y219.458 E.97583
G1 X129.471 Y219.458
G1 X106.305 Y196.292 E.97583
G1 X105.772 Y196.292
G1 X128.937 Y219.458 E.97583
G1 X128.404 Y219.458
G1 X105.239 Y196.292 E.97583
G1 X104.706 Y196.292
G1 X127.871 Y219.458 E.97583
G1 X127.338 Y219.458
G1 X104.172 Y196.292 E.97583
G1 X103.639 Y196.292
G1 X126.804 Y219.458 E.97583
G1 X126.271 Y219.458
G1 X103.106 Y196.292 E.97583
G1 X102.573 Y196.292
G1 X125.738 Y219.458 E.97583
G1 X125.205 Y219.458
G1 X102.039 Y196.292 E.97583
G1 X101.506 Y196.292
G1 X124.671 Y219.458 E.97583
G1 X124.138 Y219.458
G1 X100.973 Y196.292 E.97583
G1 X100.44 Y196.292
G1 X123.605 Y219.458 E.97583
G1 X123.072 Y219.458
G1 X99.906 Y196.292 E.97583
G1 X99.373 Y196.292
G1 X122.538 Y219.458 E.97583
G1 X122.005 Y219.458
G1 X98.84 Y196.292 E.97583
G1 X98.307 Y196.292
G1 X121.472 Y219.458 E.97583
G1 X120.939 Y219.458
G1 X97.773 Y196.292 E.97583
G1 X97.24 Y196.292
G1 X120.405 Y219.458 E.97583
G1 X119.872 Y219.458
G1 X96.707 Y196.292 E.97583
G1 X96.174 Y196.292
G1 X119.339 Y219.458 E.97583
G1 X118.805 Y219.458
G1 X95.64 Y196.292 E.97583
G1 X95.107 Y196.292
G1 X118.272 Y219.458 E.97583
G1 X117.739 Y219.458
G1 X94.574 Y196.292 E.97583
G1 X94.04 Y196.292
G1 X117.206 Y219.458 E.97583
G1 X116.672 Y219.458
G1 X93.507 Y196.292 E.97583
G1 X92.974 Y196.292
G1 X116.139 Y219.458 E.97583
G1 X115.606 Y219.458
G1 X92.441 Y196.292 E.97583
G1 X91.907 Y196.292
G1 X115.073 Y219.458 E.97583
G1 X114.539 Y219.458
G1 X91.374 Y196.292 E.97583
G1 X90.841 Y196.292
G1 X114.006 Y219.458 E.97583
G1 X113.473 Y219.458
G1 X90.308 Y196.292 E.97583
G1 X89.774 Y196.292
G1 X112.94 Y219.458 E.97583
G1 X112.406 Y219.458
G1 X89.241 Y196.292 E.97583
G1 X88.708 Y196.292
G1 X111.873 Y219.458 E.97583
G1 X111.34 Y219.458
G1 X88.175 Y196.292 E.97583
G1 X87.641 Y196.292
G1 X110.807 Y219.458 E.97583
G1 X110.273 Y219.458
G1 X87.108 Y196.292 E.97583
G1 X86.575 Y196.292
G1 X109.74 Y219.458 E.97583
G1 X109.207 Y219.458
G1 X86.042 Y196.292 E.97583
G1 X85.508 Y196.292
G1 X108.674 Y219.458 E.97583
G1 X108.14 Y219.458
G1 X84.975 Y196.292 E.97583
G1 X84.442 Y196.292
G1 X107.607 Y219.458 E.97583
G1 X107.074 Y219.458
G1 X83.909 Y196.292 E.97583
G1 X83.375 Y196.292
G1 X106.541 Y219.458 E.97583
G1 X106.007 Y219.458
G1 X82.842 Y196.292 E.97583
G1 X82.309 Y196.292
G1 X105.474 Y219.458 E.97583
G1 X104.941 Y219.458
G1 X81.776 Y196.292 E.97583
G1 X81.242 Y196.292
G1 X104.408 Y219.458 E.97583
G1 X103.874 Y219.458
G1 X80.709 Y196.292 E.97583
G1 X80.176 Y196.292
G1 X103.341 Y219.458 E.97583
G1 X102.808 Y219.458
G1 X79.643 Y196.292 E.97583
G1 X79.109 Y196.292
G1 X102.275 Y219.458 E.97583
G1 X101.741 Y219.458
G1 X78.576 Y196.292 E.97583
G1 X78.043 Y196.292
G1 X101.208 Y219.458 E.97583
G1 X100.675 Y219.458
G1 X77.509 Y196.292 E.97583
G1 X76.976 Y196.292
G1 X100.141 Y219.458 E.97583
G1 X99.608 Y219.458
G1 X76.443 Y196.292 E.97583
G1 X75.91 Y196.292
G1 X99.075 Y219.458 E.97583
G1 X98.542 Y219.458
G1 X75.376 Y196.292 E.97583
G1 X74.843 Y196.292
G1 X98.008 Y219.458 E.97583
M73 P94 R3
G1 X97.475 Y219.458
G1 X74.31 Y196.292 E.97583
G1 X73.777 Y196.292
G1 X96.942 Y219.458 E.97583
G1 X96.409 Y219.458
G1 X73.243 Y196.292 E.97583
G1 X72.71 Y196.292
G1 X95.875 Y219.458 E.97583
G1 X95.342 Y219.458
G1 X72.177 Y196.292 E.97583
G1 X71.644 Y196.292
G1 X94.809 Y219.458 E.97583
G1 X94.276 Y219.458
G1 X71.11 Y196.292 E.97583
G1 X70.577 Y196.292
G1 X93.742 Y219.458 E.97583
G1 X93.209 Y219.458
G1 X70.044 Y196.292 E.97583
G1 X69.511 Y196.292
G1 X92.676 Y219.458 E.97583
G1 X92.143 Y219.458
G1 X68.977 Y196.292 E.97583
G1 X68.444 Y196.292
G1 X91.609 Y219.458 E.97583
G1 X91.076 Y219.458
G1 X67.911 Y196.292 E.97583
G1 X67.378 Y196.292
G1 X90.543 Y219.458 E.97583
G1 X90.01 Y219.458
G1 X66.844 Y196.292 E.97583
G1 X66.311 Y196.292
G1 X89.476 Y219.458 E.97583
G1 X88.943 Y219.458
G1 X65.778 Y196.292 E.97583
G1 X65.245 Y196.292
G1 X88.41 Y219.458 E.97583
G1 X87.877 Y219.458
G1 X64.711 Y196.292 E.97583
G1 X64.178 Y196.292
G1 X87.343 Y219.458 E.97583
G1 X86.81 Y219.458
G1 X63.645 Y196.292 E.97583
G1 X63.112 Y196.292
G1 X86.277 Y219.458 E.97583
G1 X85.744 Y219.458
G1 X62.578 Y196.292 E.97583
G1 X62.045 Y196.292
G1 X85.21 Y219.458 E.97583
G1 X84.677 Y219.458
G1 X61.512 Y196.292 E.97583
G1 X60.979 Y196.292
G1 X84.144 Y219.458 E.97583
G1 X83.61 Y219.458
G1 X60.445 Y196.292 E.97583
G1 X59.912 Y196.292
G1 X83.077 Y219.458 E.97583
G1 X82.544 Y219.458
G1 X59.379 Y196.292 E.97583
G1 X58.845 Y196.292
G1 X82.011 Y219.458 E.97583
G1 X81.477 Y219.458
G1 X58.312 Y196.292 E.97583
G1 X57.779 Y196.292
G1 X80.944 Y219.458 E.97583
G1 X80.411 Y219.458
G1 X57.246 Y196.292 E.97583
M73 P95 R3
G1 X56.712 Y196.292
G1 X79.878 Y219.458 E.97583
G1 X79.344 Y219.458
G1 X56.179 Y196.292 E.97583
G1 X55.646 Y196.292
G1 X78.811 Y219.458 E.97583
G1 X78.278 Y219.458
G1 X55.113 Y196.292 E.97583
G1 X54.579 Y196.292
G1 X77.745 Y219.458 E.97583
G1 X77.211 Y219.458
G1 X54.046 Y196.292 E.97583
G1 X53.513 Y196.292
G1 X76.678 Y219.458 E.97583
G1 X76.145 Y219.458
G1 X52.98 Y196.292 E.97583
G1 X52.446 Y196.292
G1 X75.612 Y219.458 E.97583
G1 X75.078 Y219.458
G1 X51.913 Y196.292 E.97583
; WIPE_START
M204 S10000
G1 X53.327 Y197.707 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X58.883 Y192.473 Z3.4 F30000
G1 X204.087 Y55.708 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X180.922 Y32.542 E.97583
G1 X180.388 Y32.542
G1 X203.553 Y55.708 E.97583
G1 X203.02 Y55.708
G1 X179.855 Y32.542 E.97583
G1 X179.322 Y32.542
G1 X202.487 Y55.708 E.97583
G1 X201.954 Y55.708
G1 X178.788 Y32.542 E.97583
G1 X178.255 Y32.542
G1 X201.42 Y55.708 E.97583
G1 X200.887 Y55.708
G1 X177.722 Y32.542 E.97583
G1 X177.189 Y32.542
G1 X200.354 Y55.708 E.97583
G1 X199.821 Y55.708
G1 X176.655 Y32.542 E.97583
G1 X176.122 Y32.542
G1 X199.287 Y55.708 E.97583
G1 X198.754 Y55.708
G1 X175.589 Y32.542 E.97583
G1 X175.056 Y32.542
G1 X198.221 Y55.708 E.97583
G1 X197.688 Y55.708
G1 X174.522 Y32.542 E.97583
G1 X173.989 Y32.542
G1 X197.154 Y55.708 E.97583
G1 X196.621 Y55.708
G1 X173.456 Y32.542 E.97583
G1 X172.923 Y32.542
G1 X196.088 Y55.708 E.97583
G1 X195.555 Y55.708
G1 X172.389 Y32.542 E.97583
G1 X171.856 Y32.542
G1 X195.021 Y55.708 E.97583
G1 X194.488 Y55.708
G1 X171.323 Y32.542 E.97583
G1 X170.79 Y32.542
G1 X193.955 Y55.708 E.97583
G1 X193.422 Y55.708
G1 X170.256 Y32.542 E.97583
G1 X169.723 Y32.542
G1 X192.888 Y55.708 E.97583
G1 X192.355 Y55.708
G1 X169.19 Y32.542 E.97583
G1 X168.657 Y32.542
G1 X191.822 Y55.708 E.97583
G1 X191.289 Y55.708
G1 X168.123 Y32.542 E.97583
G1 X167.59 Y32.542
G1 X190.755 Y55.708 E.97583
G1 X190.222 Y55.708
G1 X167.057 Y32.542 E.97583
G1 X166.524 Y32.542
G1 X189.689 Y55.708 E.97583
G1 X189.156 Y55.708
G1 X165.99 Y32.542 E.97583
G1 X165.457 Y32.542
G1 X188.622 Y55.708 E.97583
G1 X188.089 Y55.708
G1 X164.924 Y32.542 E.97583
G1 X164.391 Y32.542
G1 X187.556 Y55.708 E.97583
G1 X187.023 Y55.708
G1 X163.857 Y32.542 E.97583
G1 X163.324 Y32.542
G1 X186.489 Y55.708 E.97583
G1 X185.956 Y55.708
G1 X162.791 Y32.542 E.97583
G1 X162.257 Y32.542
G1 X185.423 Y55.708 E.97583
G1 X184.889 Y55.708
G1 X161.724 Y32.542 E.97583
G1 X161.191 Y32.542
G1 X184.356 Y55.708 E.97583
G1 X183.823 Y55.708
G1 X160.658 Y32.542 E.97583
G1 X160.124 Y32.542
G1 X183.29 Y55.708 E.97583
G1 X182.756 Y55.708
G1 X159.591 Y32.542 E.97583
G1 X159.058 Y32.542
G1 X182.223 Y55.708 E.97583
G1 X181.69 Y55.708
G1 X158.525 Y32.542 E.97583
G1 X157.991 Y32.542
G1 X181.157 Y55.708 E.97583
G1 X180.623 Y55.708
G1 X157.458 Y32.542 E.97583
G1 X156.925 Y32.542
G1 X180.09 Y55.708 E.97583
G1 X179.557 Y55.708
G1 X156.392 Y32.542 E.97583
G1 X155.858 Y32.542
G1 X179.024 Y55.708 E.97583
G1 X178.49 Y55.708
G1 X155.325 Y32.542 E.97583
G1 X154.792 Y32.542
G1 X177.957 Y55.708 E.97583
G1 X177.424 Y55.708
G1 X154.259 Y32.542 E.97583
G1 X153.725 Y32.542
G1 X176.891 Y55.708 E.97583
G1 X176.357 Y55.708
G1 X153.192 Y32.542 E.97583
G1 X152.659 Y32.542
G1 X175.824 Y55.708 E.97583
G1 X175.291 Y55.708
G1 X152.126 Y32.542 E.97583
G1 X151.592 Y32.542
G1 X174.758 Y55.708 E.97583
G1 X174.224 Y55.708
G1 X151.059 Y32.542 E.97583
G1 X150.526 Y32.542
G1 X173.691 Y55.708 E.97583
G1 X173.158 Y55.708
G1 X149.993 Y32.542 E.97583
G1 X149.459 Y32.542
G1 X172.625 Y55.708 E.97583
G1 X172.091 Y55.708
G1 X148.926 Y32.542 E.97583
G1 X148.393 Y32.542
G1 X171.558 Y55.708 E.97583
G1 X171.025 Y55.708
G1 X147.86 Y32.542 E.97583
G1 X147.326 Y32.542
G1 X170.492 Y55.708 E.97583
G1 X169.958 Y55.708
G1 X146.793 Y32.542 E.97583
G1 X146.26 Y32.542
G1 X169.425 Y55.708 E.97583
G1 X168.892 Y55.708
G1 X145.727 Y32.542 E.97583
G1 X145.193 Y32.542
G1 X168.358 Y55.708 E.97583
G1 X167.825 Y55.708
G1 X144.66 Y32.542 E.97583
G1 X144.127 Y32.542
G1 X167.292 Y55.708 E.97583
G1 X166.759 Y55.708
G1 X143.593 Y32.542 E.97583
G1 X143.06 Y32.542
G1 X166.225 Y55.708 E.97583
G1 X165.692 Y55.708
G1 X142.527 Y32.542 E.97583
G1 X141.994 Y32.542
G1 X165.159 Y55.708 E.97583
G1 X164.626 Y55.708
G1 X141.46 Y32.542 E.97583
G1 X140.927 Y32.542
G1 X164.092 Y55.708 E.97583
G1 X163.559 Y55.708
G1 X140.394 Y32.542 E.97583
G1 X139.861 Y32.542
G1 X163.026 Y55.708 E.97583
G1 X162.493 Y55.708
G1 X139.327 Y32.542 E.97583
G1 X138.794 Y32.542
G1 X161.959 Y55.708 E.97583
G1 X161.426 Y55.708
G1 X138.261 Y32.542 E.97583
G1 X137.728 Y32.542
G1 X160.893 Y55.708 E.97583
G1 X160.36 Y55.708
G1 X137.194 Y32.542 E.97583
G1 X136.661 Y32.542
G1 X159.826 Y55.708 E.97583
G1 X159.293 Y55.708
G1 X136.128 Y32.542 E.97583
G1 X135.595 Y32.542
G1 X158.76 Y55.708 E.97583
G1 X158.227 Y55.708
G1 X135.061 Y32.542 E.97583
G1 X134.528 Y32.542
G1 X157.693 Y55.708 E.97583
G1 X157.16 Y55.708
G1 X133.995 Y32.542 E.97583
G1 X133.462 Y32.542
G1 X156.627 Y55.708 E.97583
G1 X156.094 Y55.708
G1 X132.928 Y32.542 E.97583
G1 X132.395 Y32.542
G1 X155.56 Y55.708 E.97583
G1 X155.027 Y55.708
G1 X131.862 Y32.542 E.97583
G1 X131.329 Y32.542
G1 X154.494 Y55.708 E.97583
G1 X153.961 Y55.708
G1 X130.795 Y32.542 E.97583
G1 X130.262 Y32.542
G1 X153.427 Y55.708 E.97583
G1 X152.894 Y55.708
G1 X129.729 Y32.542 E.97583
G1 X129.196 Y32.542
G1 X152.361 Y55.708 E.97583
G1 X151.828 Y55.708
G1 X128.662 Y32.542 E.97583
G1 X128.129 Y32.542
G1 X151.294 Y55.708 E.97583
G1 X150.761 Y55.708
G1 X127.596 Y32.542 E.97583
G1 X127.062 Y32.542
G1 X150.228 Y55.708 E.97583
G1 X149.694 Y55.708
G1 X126.529 Y32.542 E.97583
G1 X125.996 Y32.542
G1 X149.161 Y55.708 E.97583
G1 X148.628 Y55.708
G1 X125.463 Y32.542 E.97583
G1 X124.929 Y32.542
G1 X148.095 Y55.708 E.97583
G1 X147.561 Y55.708
G1 X124.396 Y32.542 E.97583
G1 X123.863 Y32.542
G1 X147.028 Y55.708 E.97583
G1 X146.495 Y55.708
G1 X123.33 Y32.542 E.97583
G1 X122.796 Y32.542
G1 X145.962 Y55.708 E.97583
G1 X145.428 Y55.708
G1 X122.263 Y32.542 E.97583
G1 X121.73 Y32.542
G1 X144.895 Y55.708 E.97583
G1 X144.362 Y55.708
G1 X121.197 Y32.542 E.97583
G1 X120.663 Y32.542
G1 X143.829 Y55.708 E.97583
G1 X143.295 Y55.708
G1 X120.13 Y32.542 E.97583
G1 X119.597 Y32.542
G1 X142.762 Y55.708 E.97583
G1 X142.229 Y55.708
G1 X130.152 Y43.631 E.50871
G1 X130.208 Y44.22
G1 X141.696 Y55.708 E.48393
G1 X141.162 Y55.708
G1 X130.139 Y44.684 E.46435
G1 X129.996 Y45.074
G1 X140.629 Y55.708 E.44793
G1 X140.096 Y55.708
G1 X129.797 Y45.409 E.43384
G1 X129.551 Y45.696
G1 X139.563 Y55.708 E.42173
G1 X139.029 Y55.708
G1 X129.261 Y45.939 E.4115
G1 X128.923 Y46.134
G1 X138.496 Y55.708 E.40327
G1 X137.963 Y55.708
G1 X128.529 Y46.273 E.39741
G1 X128.057 Y46.335
G1 X137.43 Y55.708 E.39483
G1 X136.896 Y55.708
G1 X127.462 Y46.273 E.39743
; WIPE_START
M204 S10000
G1 X128.876 Y47.687 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.491 Y41.97 Z3.4 F30000
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X119.064 Y32.542 E.39713
G1 X118.53 Y32.542
G1 X127.907 Y41.919 E.39499
G1 X127.443 Y41.988
G1 X117.997 Y32.542 E.39789
G1 X117.464 Y32.542
G1 X127.052 Y42.131 E.4039
G1 X126.717 Y42.329
G1 X116.931 Y32.542 E.41224
G1 X116.397 Y32.542
G1 X126.428 Y42.573 E.42255
G1 X126.184 Y42.863
G1 X115.864 Y32.542 E.43473
G1 X115.331 Y32.542
G1 X125.988 Y43.199 E.44891
G1 X125.848 Y43.592
G1 X114.798 Y32.542 E.46548
G1 X114.264 Y32.542
G1 X125.787 Y44.065 E.48537
G1 X125.861 Y44.673
G1 X113.731 Y32.542 E.51098
G1 X113.198 Y32.542
G1 X136.363 Y55.708 E.97583
G1 X135.83 Y55.708
M73 P96 R3
G1 X112.665 Y32.542 E.97583
G1 X112.131 Y32.542
G1 X135.297 Y55.708 E.97583
G1 X134.763 Y55.708
G1 X111.598 Y32.542 E.97583
G1 X111.065 Y32.542
G1 X134.23 Y55.708 E.97583
G1 X133.697 Y55.708
G1 X110.532 Y32.542 E.97583
G1 X109.998 Y32.542
G1 X133.163 Y55.708 E.97583
G1 X132.63 Y55.708
G1 X109.465 Y32.542 E.97583
G1 X108.932 Y32.542
G1 X132.097 Y55.708 E.97583
G1 X131.564 Y55.708
G1 X108.398 Y32.542 E.97583
G1 X107.865 Y32.542
G1 X131.03 Y55.708 E.97583
G1 X130.497 Y55.708
G1 X107.332 Y32.542 E.97583
G1 X106.799 Y32.542
G1 X129.964 Y55.708 E.97583
G1 X129.431 Y55.708
G1 X106.265 Y32.542 E.97583
G1 X105.732 Y32.542
G1 X128.897 Y55.708 E.97583
G1 X128.364 Y55.708
G1 X105.199 Y32.542 E.97583
G1 X104.666 Y32.542
G1 X127.831 Y55.708 E.97583
G1 X127.298 Y55.708
G1 X104.132 Y32.542 E.97583
G1 X103.599 Y32.542
G1 X126.764 Y55.708 E.97583
G1 X126.231 Y55.708
G1 X103.066 Y32.542 E.97583
G1 X102.533 Y32.542
G1 X125.698 Y55.708 E.97583
G1 X125.165 Y55.708
G1 X101.999 Y32.542 E.97583
G1 X101.466 Y32.542
G1 X124.631 Y55.708 E.97583
G1 X124.098 Y55.708
G1 X100.933 Y32.542 E.97583
G1 X100.4 Y32.542
G1 X123.565 Y55.708 E.97583
G1 X123.032 Y55.708
G1 X99.866 Y32.542 E.97583
G1 X99.333 Y32.542
G1 X122.498 Y55.708 E.97583
M73 P96 R2
G1 X121.965 Y55.708
G1 X98.8 Y32.542 E.97583
G1 X98.267 Y32.542
G1 X121.432 Y55.708 E.97583
G1 X120.899 Y55.708
G1 X97.733 Y32.542 E.97583
G1 X97.2 Y32.542
G1 X120.365 Y55.708 E.97583
G1 X119.832 Y55.708
G1 X96.667 Y32.542 E.97583
G1 X96.134 Y32.542
G1 X119.299 Y55.708 E.97583
G1 X118.766 Y55.708
G1 X95.6 Y32.542 E.97583
G1 X95.067 Y32.542
G1 X118.232 Y55.708 E.97583
G1 X117.699 Y55.708
G1 X94.534 Y32.542 E.97583
G1 X94.001 Y32.542
G1 X117.166 Y55.708 E.97583
G1 X116.633 Y55.708
G1 X93.467 Y32.542 E.97583
G1 X92.934 Y32.542
G1 X116.099 Y55.708 E.97583
G1 X115.566 Y55.708
G1 X92.401 Y32.542 E.97583
G1 X91.867 Y32.542
G1 X115.033 Y55.708 E.97583
G1 X114.499 Y55.708
G1 X91.334 Y32.542 E.97583
G1 X90.801 Y32.542
G1 X113.966 Y55.708 E.97583
G1 X113.433 Y55.708
G1 X90.268 Y32.542 E.97583
G1 X89.734 Y32.542
G1 X112.9 Y55.708 E.97583
G1 X112.366 Y55.708
G1 X89.201 Y32.542 E.97583
G1 X88.668 Y32.542
G1 X111.833 Y55.708 E.97583
G1 X111.3 Y55.708
G1 X88.135 Y32.542 E.97583
G1 X87.601 Y32.542
G1 X110.767 Y55.708 E.97583
G1 X110.233 Y55.708
G1 X87.068 Y32.542 E.97583
G1 X86.535 Y32.542
G1 X109.7 Y55.708 E.97583
G1 X109.167 Y55.708
G1 X86.002 Y32.542 E.97583
G1 X85.468 Y32.542
G1 X108.634 Y55.708 E.97583
G1 X108.1 Y55.708
G1 X84.935 Y32.542 E.97583
G1 X84.402 Y32.542
G1 X107.567 Y55.708 E.97583
G1 X107.034 Y55.708
G1 X83.869 Y32.542 E.97583
G1 X83.335 Y32.542
G1 X106.501 Y55.708 E.97583
G1 X105.967 Y55.708
G1 X82.802 Y32.542 E.97583
G1 X82.269 Y32.542
G1 X105.434 Y55.708 E.97583
G1 X104.901 Y55.708
G1 X81.736 Y32.542 E.97583
G1 X81.202 Y32.542
G1 X104.368 Y55.708 E.97583
G1 X103.834 Y55.708
G1 X80.669 Y32.542 E.97583
G1 X80.136 Y32.542
G1 X103.301 Y55.708 E.97583
G1 X102.768 Y55.708
G1 X79.603 Y32.542 E.97583
G1 X79.069 Y32.542
G1 X102.235 Y55.708 E.97583
G1 X101.701 Y55.708
G1 X78.536 Y32.542 E.97583
G1 X78.003 Y32.542
G1 X101.168 Y55.708 E.97583
G1 X100.635 Y55.708
G1 X77.47 Y32.542 E.97583
G1 X76.936 Y32.542
G1 X100.102 Y55.708 E.97583
G1 X99.568 Y55.708
G1 X76.403 Y32.542 E.97583
G1 X75.87 Y32.542
G1 X99.035 Y55.708 E.97583
G1 X98.502 Y55.708
G1 X75.337 Y32.542 E.97583
G1 X74.803 Y32.542
G1 X97.969 Y55.708 E.97583
G1 X97.435 Y55.708
G1 X74.27 Y32.542 E.97583
G1 X73.737 Y32.542
G1 X96.902 Y55.708 E.97583
G1 X96.369 Y55.708
G1 X73.203 Y32.542 E.97583
G1 X72.67 Y32.542
G1 X95.835 Y55.708 E.97583
G1 X95.302 Y55.708
G1 X72.137 Y32.542 E.97583
G1 X71.604 Y32.542
G1 X94.769 Y55.708 E.97583
G1 X94.236 Y55.708
G1 X71.07 Y32.542 E.97583
G1 X70.537 Y32.542
G1 X93.702 Y55.708 E.97583
G1 X93.169 Y55.708
G1 X70.004 Y32.542 E.97583
G1 X69.471 Y32.542
G1 X92.636 Y55.708 E.97583
G1 X92.103 Y55.708
G1 X68.937 Y32.542 E.97583
G1 X68.404 Y32.542
G1 X91.569 Y55.708 E.97583
G1 X91.036 Y55.708
G1 X67.871 Y32.542 E.97583
G1 X67.338 Y32.542
G1 X90.503 Y55.708 E.97583
G1 X89.97 Y55.708
G1 X66.804 Y32.542 E.97583
G1 X66.271 Y32.542
G1 X89.436 Y55.708 E.97583
G1 X88.903 Y55.708
G1 X65.738 Y32.542 E.97583
G1 X65.205 Y32.542
G1 X88.37 Y55.708 E.97583
G1 X87.837 Y55.708
G1 X64.671 Y32.542 E.97583
G1 X64.138 Y32.542
G1 X87.303 Y55.708 E.97583
G1 X86.77 Y55.708
G1 X63.605 Y32.542 E.97583
G1 X63.072 Y32.542
G1 X86.237 Y55.708 E.97583
G1 X85.704 Y55.708
G1 X62.538 Y32.542 E.97583
G1 X62.005 Y32.542
G1 X85.17 Y55.708 E.97583
G1 X84.637 Y55.708
G1 X61.472 Y32.542 E.97583
G1 X60.939 Y32.542
G1 X84.104 Y55.708 E.97583
G1 X83.571 Y55.708
G1 X60.405 Y32.542 E.97583
G1 X59.872 Y32.542
G1 X83.037 Y55.708 E.97583
G1 X82.504 Y55.708
G1 X59.339 Y32.542 E.97583
G1 X58.806 Y32.542
G1 X81.971 Y55.708 E.97583
G1 X81.438 Y55.708
G1 X58.272 Y32.542 E.97583
G1 X57.739 Y32.542
G1 X80.904 Y55.708 E.97583
G1 X80.371 Y55.708
G1 X57.206 Y32.542 E.97583
G1 X56.673 Y32.542
G1 X79.838 Y55.708 E.97583
G1 X79.304 Y55.708
G1 X56.139 Y32.542 E.97583
G1 X55.606 Y32.542
G1 X78.771 Y55.708 E.97583
G1 X78.238 Y55.708
G1 X55.073 Y32.542 E.97583
G1 X54.539 Y32.542
G1 X77.705 Y55.708 E.97583
G1 X77.171 Y55.708
G1 X54.006 Y32.542 E.97583
G1 X53.473 Y32.542
G1 X76.638 Y55.708 E.97583
G1 X76.105 Y55.708
G1 X52.94 Y32.542 E.97583
G1 X52.406 Y32.542
G1 X75.572 Y55.708 E.97583
G1 X75.038 Y55.708
G1 X51.873 Y32.542 E.97583
G1 X51.34 Y32.542
G1 X74.505 Y55.708 E.97583
G1 X73.972 Y55.708
G1 X50.807 Y32.542 E.97583
G1 X50.273 Y32.542
G1 X73.439 Y55.708 E.97583
G1 X72.905 Y55.708
G1 X49.74 Y32.542 E.97583
G1 X49.207 Y32.542
G1 X72.372 Y55.708 E.97583
G1 X71.839 Y55.708
G1 X48.674 Y32.542 E.97583
G1 X48.14 Y32.542
G1 X71.306 Y55.708 E.97583
G1 X70.772 Y55.708
G1 X47.607 Y32.542 E.97583
G1 X47.074 Y32.542
G1 X70.239 Y55.708 E.97583
G1 X69.706 Y55.708
G1 X46.541 Y32.542 E.97583
G1 X46.007 Y32.542
G1 X69.173 Y55.708 E.97583
G1 X68.639 Y55.708
G1 X45.474 Y32.542 E.97583
G1 X44.941 Y32.542
G1 X68.106 Y55.708 E.97583
G1 X67.573 Y55.708
G1 X44.408 Y32.542 E.97583
G1 X43.874 Y32.542
G1 X67.04 Y55.708 E.97583
G1 X66.506 Y55.708
G1 X43.341 Y32.542 E.97583
G1 X42.808 Y32.542
G1 X65.973 Y55.708 E.97583
G1 X65.44 Y55.708
G1 X42.275 Y32.542 E.97583
G1 X41.741 Y32.542
G1 X64.907 Y55.708 E.97583
G1 X64.373 Y55.708
G1 X41.208 Y32.542 E.97583
G1 X40.675 Y32.542
G1 X63.84 Y55.708 E.97583
G1 X63.307 Y55.708
G1 X40.142 Y32.542 E.97583
G1 X39.608 Y32.542
G1 X62.774 Y55.708 E.97583
G1 X62.24 Y55.708
G1 X39.075 Y32.542 E.97583
G1 X38.542 Y32.542
G1 X61.707 Y55.708 E.97583
G1 X61.174 Y55.708
G1 X38.008 Y32.542 E.97583
G1 X37.475 Y32.542
G1 X60.64 Y55.708 E.97583
G1 X60.107 Y55.708
G1 X36.942 Y32.542 E.97583
G1 X36.409 Y32.542
G1 X59.574 Y55.708 E.97583
G1 X59.041 Y55.708
G1 X35.875 Y32.542 E.97583
G1 X35.342 Y32.542
G1 X58.507 Y55.708 E.97583
G1 X57.974 Y55.708
G1 X34.809 Y32.542 E.97583
G1 X34.276 Y32.542
G1 X57.441 Y55.708 E.97583
G1 X56.908 Y55.708
G1 X33.742 Y32.542 E.97583
G1 X33.209 Y32.542
G1 X56.374 Y55.708 E.97583
G1 X55.841 Y55.708
G1 X32.676 Y32.542 E.97583
G1 X32.143 Y32.542
G1 X55.308 Y55.708 E.97583
G1 X54.775 Y55.708
G1 X31.609 Y32.542 E.97583
G1 X31.076 Y32.542
G1 X40.506 Y41.973 E.39724
G1 X39.919 Y41.919
G1 X30.543 Y32.542 E.39497
G1 X30.01 Y32.542
G1 X39.453 Y41.985 E.39779
G1 X39.061 Y42.127
G1 X29.476 Y32.542 E.40374
G1 X28.943 Y32.542
G1 X38.724 Y42.323 E.41202
G1 X38.434 Y42.567
G1 X28.417 Y32.55 E.42196
G1 X28.417 Y33.083
G1 X38.189 Y42.855 E.41163
G1 X37.991 Y43.19
G1 X28.417 Y33.616 E.40328
G1 X28.417 Y34.15
G1 X37.849 Y43.582 E.39732
G1 X37.786 Y44.051
G1 X28.417 Y34.683 E.39465
G1 X28.417 Y35.216
G1 X37.857 Y44.656 E.39764
; WIPE_START
M204 S10000
G1 X36.443 Y43.242 E-.76
; WIPE_END
G1 E-.04 F1800
M73 P97 R2
G1 X42.149 Y43.616 Z3.4 F30000
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X54.241 Y55.708 E.50937
G1 X53.708 Y55.708
G1 X42.208 Y44.207 E.48445
G1 X42.141 Y44.674
G1 X53.175 Y55.708 E.46478
G1 X52.642 Y55.708
G1 X41.999 Y45.065 E.4483
G1 X41.802 Y45.401
G1 X52.108 Y55.708 E.43416
G1 X51.583 Y55.715
G1 X41.557 Y45.69 E.42231
G1 X41.268 Y45.934
G1 X51.583 Y56.248 E.43449
G1 X51.583 Y56.782
G1 X40.932 Y46.131 E.44866
G1 X40.539 Y46.272
G1 X51.583 Y57.315 E.46519
G1 X51.583 Y57.848
G1 X40.07 Y46.335 E.48498
G1 X39.481 Y46.279
G1 X51.583 Y58.381 E.50979
G1 X51.583 Y58.915
G1 X28.417 Y35.749 E.97583
G1 X28.417 Y36.283
G1 X51.583 Y59.448 E.97583
G1 X51.583 Y59.981
G1 X28.417 Y36.816 E.97583
G1 X28.417 Y37.349
G1 X51.583 Y60.514 E.97583
G1 X51.583 Y61.048
G1 X28.417 Y37.882 E.97583
G1 X28.417 Y38.416
G1 X51.583 Y61.581 E.97583
G1 X51.583 Y62.114
G1 X28.417 Y38.949 E.97583
G1 X28.417 Y39.482
G1 X51.583 Y62.647 E.97583
G1 X51.583 Y63.181
G1 X28.417 Y40.015 E.97583
G1 X28.417 Y40.549
G1 X51.583 Y63.714 E.97583
G1 X51.583 Y64.247
G1 X28.417 Y41.082 E.97583
G1 X28.417 Y41.615
G1 X51.583 Y64.781 E.97583
G1 X51.583 Y65.314
G1 X28.417 Y42.149 E.97583
G1 X28.417 Y42.682
G1 X51.583 Y65.847 E.97583
G1 X51.583 Y66.38
G1 X28.417 Y43.215 E.97583
G1 X28.417 Y43.748
G1 X51.583 Y66.914 E.97583
G1 X51.583 Y67.447
G1 X28.417 Y44.282 E.97583
G1 X28.417 Y44.815
G1 X51.583 Y67.98 E.97583
G1 X51.583 Y68.513
G1 X28.417 Y45.348 E.97583
G1 X28.417 Y45.881
G1 X51.583 Y69.047 E.97583
G1 X51.583 Y69.58
G1 X28.417 Y46.415 E.97583
G1 X28.417 Y46.948
G1 X51.583 Y70.113 E.97583
G1 X51.583 Y70.646
G1 X28.417 Y47.481 E.97583
G1 X28.417 Y48.014
G1 X51.583 Y71.18 E.97583
G1 X51.583 Y71.713
G1 X28.417 Y48.548 E.97583
G1 X28.417 Y49.081
G1 X51.583 Y72.246 E.97583
G1 X51.583 Y72.779
G1 X28.417 Y49.614 E.97583
G1 X28.417 Y50.147
G1 X51.583 Y73.313 E.97583
G1 X51.583 Y73.846
G1 X28.417 Y50.681 E.97583
G1 X28.417 Y51.214
G1 X51.583 Y74.379 E.97583
G1 X51.583 Y74.912
G1 X28.417 Y51.747 E.97583
G1 X28.417 Y52.28
G1 X51.583 Y75.446 E.97583
G1 X51.583 Y75.979
G1 X28.417 Y52.814 E.97583
G1 X28.417 Y53.347
G1 X51.583 Y76.512 E.97583
G1 X51.583 Y77.045
G1 X28.417 Y53.88 E.97583
G1 X28.417 Y54.413
G1 X51.583 Y77.579 E.97583
G1 X51.583 Y78.112
G1 X28.417 Y54.947 E.97583
G1 X28.417 Y55.48
G1 X51.583 Y78.645 E.97583
G1 X51.583 Y79.178
G1 X28.417 Y56.013 E.97583
G1 X28.417 Y56.546
G1 X51.583 Y79.712 E.97583
G1 X51.583 Y80.245
G1 X28.417 Y57.08 E.97583
G1 X28.417 Y57.613
G1 X51.583 Y80.778 E.97583
G1 X51.583 Y81.311
G1 X28.417 Y58.146 E.97583
G1 X28.417 Y58.68
G1 X51.583 Y81.845 E.97583
G1 X51.583 Y82.378
G1 X28.417 Y59.213 E.97583
G1 X28.417 Y59.746
G1 X51.583 Y82.911 E.97583
G1 X51.583 Y83.445
G1 X28.417 Y60.279 E.97583
G1 X28.417 Y60.813
G1 X51.583 Y83.978 E.97583
G1 X51.583 Y84.511
G1 X28.417 Y61.346 E.97583
G1 X28.417 Y61.879
G1 X51.583 Y85.044 E.97583
G1 X51.583 Y85.578
G1 X28.417 Y62.412 E.97583
G1 X28.417 Y62.946
G1 X51.583 Y86.111 E.97583
G1 X51.583 Y86.644
G1 X28.417 Y63.479 E.97583
G1 X28.417 Y64.012
G1 X51.583 Y87.177 E.97583
G1 X51.583 Y87.711
G1 X28.417 Y64.545 E.97583
G1 X28.417 Y65.079
G1 X51.583 Y88.244 E.97583
G1 X51.583 Y88.777
G1 X28.417 Y65.612 E.97583
G1 X28.417 Y66.145
G1 X51.583 Y89.31 E.97583
G1 X51.583 Y89.844
G1 X28.417 Y66.678 E.97583
G1 X28.417 Y67.212
G1 X51.583 Y90.377 E.97583
M73 P97 R1
G1 X51.583 Y90.91
G1 X28.417 Y67.745 E.97583
G1 X28.417 Y68.278
G1 X51.583 Y91.443 E.97583
G1 X51.583 Y91.977
G1 X28.417 Y68.811 E.97583
G1 X28.417 Y69.345
G1 X51.583 Y92.51 E.97583
G1 X51.583 Y93.043
G1 X28.417 Y69.878 E.97583
G1 X28.417 Y70.411
G1 X51.583 Y93.576 E.97583
G1 X51.583 Y94.11
G1 X28.417 Y70.944 E.97583
G1 X28.417 Y71.478
G1 X51.583 Y94.643 E.97583
G1 X51.583 Y95.176
G1 X28.417 Y72.011 E.97583
G1 X28.417 Y72.544
G1 X51.583 Y95.709 E.97583
G1 X51.583 Y96.243
G1 X28.417 Y73.077 E.97583
G1 X28.417 Y73.611
G1 X51.583 Y96.776 E.97583
G1 X51.583 Y97.309
G1 X28.417 Y74.144 E.97583
G1 X28.417 Y74.677
G1 X51.583 Y97.842 E.97583
G1 X51.583 Y98.376
G1 X28.417 Y75.21 E.97583
G1 X28.417 Y75.744
G1 X51.583 Y98.909 E.97583
G1 X51.583 Y99.442
G1 X28.417 Y76.277 E.97583
G1 X28.417 Y76.81
G1 X51.583 Y99.976 E.97583
G1 X51.583 Y100.509
G1 X28.417 Y77.344 E.97583
G1 X28.417 Y77.877
G1 X51.583 Y101.042 E.97583
G1 X51.583 Y101.575
G1 X28.417 Y78.41 E.97583
G1 X28.417 Y78.943
G1 X51.583 Y102.109 E.97583
G1 X51.583 Y102.642
G1 X28.417 Y79.477 E.97583
G1 X28.417 Y80.01
G1 X51.583 Y103.175 E.97583
G1 X51.583 Y103.708
G1 X28.417 Y80.543 E.97583
G1 X28.417 Y81.076
G1 X51.583 Y104.242 E.97583
G1 X51.583 Y104.775
G1 X28.417 Y81.61 E.97583
G1 X28.417 Y82.143
G1 X51.583 Y105.308 E.97583
G1 X51.583 Y105.841
G1 X28.417 Y82.676 E.97583
G1 X28.417 Y83.209
G1 X51.583 Y106.375 E.97583
G1 X51.583 Y106.908
G1 X28.417 Y83.743 E.97583
G1 X28.417 Y84.276
G1 X51.583 Y107.441 E.97583
G1 X51.583 Y107.974
G1 X28.417 Y84.809 E.97583
G1 X28.417 Y85.342
G1 X51.583 Y108.508 E.97583
G1 X51.583 Y109.041
G1 X28.417 Y85.876 E.97583
G1 X28.417 Y86.409
G1 X51.583 Y109.574 E.97583
G1 X51.583 Y110.107
G1 X28.417 Y86.942 E.97583
G1 X28.417 Y87.475
G1 X51.583 Y110.641 E.97583
G1 X51.583 Y111.174
G1 X28.417 Y88.009 E.97583
G1 X28.417 Y88.542
G1 X51.583 Y111.707 E.97583
G1 X51.583 Y112.24
G1 X28.417 Y89.075 E.97583
G1 X28.417 Y89.608
G1 X51.583 Y112.774 E.97583
G1 X51.583 Y113.307
G1 X28.417 Y90.142 E.97583
G1 X28.417 Y90.675
G1 X51.583 Y113.84 E.97583
G1 X51.583 Y114.373
G1 X28.417 Y91.208 E.97583
G1 X28.417 Y91.741
G1 X51.583 Y114.907 E.97583
G1 X51.583 Y115.44
G1 X28.417 Y92.275 E.97583
G1 X28.417 Y92.808
G1 X51.583 Y115.973 E.97583
G1 X51.583 Y116.506
G1 X28.417 Y93.341 E.97583
G1 X28.417 Y93.875
G1 X51.583 Y117.04 E.97583
G1 X51.583 Y117.573
G1 X28.417 Y94.408 E.97583
G1 X28.417 Y94.941
G1 X51.583 Y118.106 E.97583
G1 X51.583 Y118.64
G1 X28.417 Y95.474 E.97583
G1 X28.417 Y96.008
G1 X51.583 Y119.173 E.97583
G1 X51.583 Y119.706
G1 X28.417 Y96.541 E.97583
G1 X28.417 Y97.074
G1 X51.583 Y120.239 E.97583
G1 X51.583 Y120.773
G1 X28.417 Y97.607 E.97583
G1 X28.417 Y98.141
G1 X51.583 Y121.306 E.97583
G1 X51.583 Y121.839
G1 X28.417 Y98.674 E.97583
G1 X28.417 Y99.207
G1 X51.583 Y122.372 E.97583
G1 X51.583 Y122.906
G1 X28.417 Y99.74 E.97583
G1 X28.417 Y100.274
G1 X51.583 Y123.439 E.97583
G1 X51.583 Y123.972
G1 X28.417 Y100.807 E.97583
G1 X28.417 Y101.34
G1 X51.583 Y124.505 E.97583
G1 X51.583 Y125.039
G1 X28.417 Y101.873 E.97583
G1 X28.417 Y102.407
G1 X51.583 Y125.572 E.97583
G1 X51.583 Y126.105
G1 X28.417 Y102.94 E.97583
G1 X28.417 Y103.473
G1 X51.583 Y126.638 E.97583
G1 X51.583 Y127.172
G1 X28.417 Y104.006 E.97583
G1 X28.417 Y104.54
G1 X51.583 Y127.705 E.97583
G1 X51.583 Y128.238
G1 X28.417 Y105.073 E.97583
G1 X28.417 Y105.606
G1 X51.583 Y128.771 E.97583
G1 X51.583 Y129.305
G1 X28.417 Y106.139 E.97583
G1 X28.417 Y106.673
G1 X51.583 Y129.838 E.97583
G1 X51.583 Y130.371
G1 X28.417 Y107.206 E.97583
G1 X28.417 Y107.739
G1 X51.583 Y130.904 E.97583
G1 X51.583 Y131.438
G1 X28.417 Y108.272 E.97583
G1 X28.417 Y108.806
G1 X51.583 Y131.971 E.97583
G1 X51.583 Y132.504
G1 X28.417 Y109.339 E.97583
G1 X28.417 Y109.872
G1 X51.583 Y133.037 E.97583
G1 X51.583 Y133.571
G1 X28.417 Y110.405 E.97583
G1 X28.417 Y110.939
G1 X51.583 Y134.104 E.97583
G1 X51.583 Y134.637
G1 X41.995 Y125.05 E.40386
G1 X42.208 Y125.796
G1 X51.583 Y135.171 E.39492
G1 X51.583 Y135.704
G1 X42.19 Y126.311 E.39568
G1 X42.084 Y126.739
G1 X51.583 Y136.237 E.40011
G1 X51.583 Y136.77
G1 X41.918 Y127.106 E.40712
G1 X41.702 Y127.423
G1 X51.583 Y137.304 E.41622
G1 X51.583 Y137.837
G1 X41.432 Y127.687 E.42757
G1 X41.118 Y127.906
G1 X51.583 Y138.37 E.4408
G1 X51.583 Y138.903
G1 X40.755 Y128.075 E.45612
G1 X40.33 Y128.184
G1 X51.583 Y139.437 E.47403
M73 P98 R1
G1 X51.583 Y139.97
G1 X39.817 Y128.204 E.49564
G1 X39.092 Y128.012
G1 X51.583 Y140.503 E.52618
; WIPE_START
M204 S10000
G1 X50.168 Y139.089 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.188 Y132.577 Z3.4 F30000
G1 X40.944 Y123.999 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X28.417 Y111.472 E.5277
G1 X28.417 Y112.005
G1 X40.207 Y123.795 E.49663
G1 X39.685 Y123.806
G1 X28.417 Y112.539 E.47465
G1 X28.417 Y113.072
G1 X39.264 Y123.918 E.45691
G1 X38.899 Y124.087
G1 X28.417 Y113.605 E.44153
G1 X28.417 Y114.138
G1 X38.584 Y124.305 E.42827
G1 X38.315 Y124.569
G1 X28.417 Y114.672 E.41692
G1 X28.417 Y115.205
G1 X38.09 Y124.878 E.40746
G1 X37.917 Y125.238
G1 X28.417 Y115.738 E.40016
G1 X28.417 Y116.271
G1 X37.808 Y125.662 E.39558
G1 X37.795 Y126.182
G1 X28.417 Y116.805 E.39502
G1 X28.417 Y117.338
G1 X37.977 Y126.898 E.40272
; WIPE_START
M204 S10000
G1 X36.563 Y125.484 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X30.987 Y120.272 Z3.4 F30000
G1 X28.417 Y117.871 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X51.583 Y141.036 E.97583
G1 X51.583 Y141.57
G1 X28.417 Y118.404 E.97583
G1 X28.417 Y118.938
G1 X51.583 Y142.103 E.97583
G1 X51.583 Y142.636
G1 X28.417 Y119.471 E.97583
G1 X28.417 Y120.004
G1 X51.583 Y143.169 E.97583
G1 X51.583 Y143.703
G1 X28.417 Y120.537 E.97583
G1 X28.417 Y121.071
G1 X51.583 Y144.236 E.97583
G1 X51.583 Y144.769
G1 X28.417 Y121.604 E.97583
G1 X28.417 Y122.137
G1 X51.583 Y145.302 E.97583
G1 X51.583 Y145.836
G1 X28.417 Y122.67 E.97583
G1 X28.417 Y123.204
G1 X51.583 Y146.369 E.97583
G1 X51.583 Y146.902
G1 X28.417 Y123.737 E.97583
G1 X28.417 Y124.27
G1 X51.583 Y147.435 E.97583
G1 X51.583 Y147.969
G1 X28.417 Y124.803 E.97583
G1 X28.417 Y125.337
G1 X51.583 Y148.502 E.97583
G1 X51.583 Y149.035
G1 X28.417 Y125.87 E.97583
G1 X28.417 Y126.403
G1 X51.583 Y149.568 E.97583
G1 X51.583 Y150.102
G1 X28.417 Y126.936 E.97583
G1 X28.417 Y127.47
G1 X51.583 Y150.635 E.97583
G1 X51.583 Y151.168
G1 X28.417 Y128.003 E.97583
G1 X28.417 Y128.536
G1 X51.583 Y151.701 E.97583
G1 X51.583 Y152.235
G1 X28.417 Y129.07 E.97583
G1 X28.417 Y129.603
G1 X51.583 Y152.768 E.97583
G1 X51.583 Y153.301
G1 X28.417 Y130.136 E.97583
G1 X28.417 Y130.669
G1 X51.583 Y153.835 E.97583
G1 X51.583 Y154.368
G1 X28.417 Y131.203 E.97583
G1 X28.417 Y131.736
G1 X51.583 Y154.901 E.97583
G1 X51.583 Y155.434
G1 X28.417 Y132.269 E.97583
G1 X28.417 Y132.802
G1 X51.583 Y155.968 E.97583
G1 X51.583 Y156.501
G1 X28.417 Y133.336 E.97583
G1 X28.417 Y133.869
G1 X51.583 Y157.034 E.97583
G1 X51.583 Y157.567
G1 X28.417 Y134.402 E.97583
G1 X28.417 Y134.935
G1 X51.583 Y158.101 E.97583
G1 X51.583 Y158.634
G1 X28.417 Y135.469 E.97583
G1 X28.417 Y136.002
G1 X51.583 Y159.167 E.97583
G1 X51.583 Y159.7
G1 X28.417 Y136.535 E.97583
G1 X28.417 Y137.068
G1 X51.583 Y160.234 E.97583
G1 X51.583 Y160.767
G1 X28.417 Y137.602 E.97583
G1 X28.417 Y138.135
G1 X51.583 Y161.3 E.97583
G1 X51.583 Y161.833
G1 X28.417 Y138.668 E.97583
G1 X28.417 Y139.201
G1 X51.583 Y162.367 E.97583
G1 X51.583 Y162.9
G1 X28.417 Y139.735 E.97583
G1 X28.417 Y140.268
G1 X51.583 Y163.433 E.97583
G1 X51.583 Y163.966
G1 X28.417 Y140.801 E.97583
G1 X28.417 Y141.334
G1 X51.583 Y164.5 E.97583
G1 X51.583 Y165.033
G1 X28.417 Y141.868 E.97583
G1 X28.417 Y142.401
G1 X51.583 Y165.566 E.97583
G1 X51.583 Y166.099
G1 X28.417 Y142.934 E.97583
G1 X28.417 Y143.467
G1 X51.583 Y166.633 E.97583
G1 X51.583 Y167.166
G1 X28.417 Y144.001 E.97583
G1 X28.417 Y144.534
G1 X51.583 Y167.699 E.97583
G1 X51.583 Y168.232
G1 X28.417 Y145.067 E.97583
G1 X28.417 Y145.6
G1 X51.583 Y168.766 E.97583
G1 X51.583 Y169.299
G1 X28.417 Y146.134 E.97583
G1 X28.417 Y146.667
G1 X51.583 Y169.832 E.97583
G1 X51.583 Y170.366
G1 X28.417 Y147.2 E.97583
G1 X28.417 Y147.734
G1 X51.583 Y170.899 E.97583
G1 X51.583 Y171.432
G1 X28.417 Y148.267 E.97583
G1 X28.417 Y148.8
G1 X51.583 Y171.965 E.97583
G1 X51.583 Y172.499
G1 X28.417 Y149.333 E.97583
G1 X28.417 Y149.867
G1 X51.583 Y173.032 E.97583
G1 X51.583 Y173.565
G1 X28.417 Y150.4 E.97583
G1 X28.417 Y150.933
G1 X51.583 Y174.098 E.97583
G1 X51.583 Y174.632
G1 X28.417 Y151.466 E.97583
G1 X28.417 Y152
G1 X51.583 Y175.165 E.97583
G1 X51.583 Y175.698
G1 X28.417 Y152.533 E.97583
G1 X28.417 Y153.066
G1 X51.583 Y176.231 E.97583
G1 X51.583 Y176.765
G1 X28.417 Y153.599 E.97583
G1 X28.417 Y154.133
G1 X51.583 Y177.298 E.97583
G1 X51.583 Y177.831
G1 X28.417 Y154.666 E.97583
G1 X28.417 Y155.199
G1 X51.583 Y178.364 E.97583
G1 X51.583 Y178.898
G1 X28.417 Y155.732 E.97583
G1 X28.417 Y156.266
G1 X51.583 Y179.431 E.97583
G1 X51.583 Y179.964
G1 X28.417 Y156.799 E.97583
G1 X28.417 Y157.332
G1 X51.583 Y180.497 E.97583
G1 X51.583 Y181.031
G1 X28.417 Y157.865 E.97583
G1 X28.417 Y158.399
G1 X51.583 Y181.564 E.97583
G1 X51.583 Y182.097
G1 X28.417 Y158.932 E.97583
G1 X28.417 Y159.465
G1 X51.583 Y182.63 E.97583
G1 X51.583 Y183.164
G1 X28.417 Y159.998 E.97583
G1 X28.417 Y160.532
G1 X51.583 Y183.697 E.97583
G1 X51.583 Y184.23
G1 X28.417 Y161.065 E.97583
G1 X28.417 Y161.598
G1 X51.583 Y184.763 E.97583
G1 X51.583 Y185.297
G1 X28.417 Y162.131 E.97583
G1 X28.417 Y162.665
G1 X51.583 Y185.83 E.97583
G1 X51.583 Y186.363
G1 X28.417 Y163.198 E.97583
G1 X28.417 Y163.731
G1 X51.583 Y186.896 E.97583
G1 X51.583 Y187.43
G1 X28.417 Y164.264 E.97583
G1 X28.417 Y164.798
G1 X51.583 Y187.963 E.97583
G1 X51.583 Y188.496
G1 X28.417 Y165.331 E.97583
G1 X28.417 Y165.864
G1 X51.583 Y189.03 E.97583
G1 X51.583 Y189.563
G1 X28.417 Y166.398 E.97583
G1 X28.417 Y166.931
G1 X51.583 Y190.096 E.97583
G1 X51.583 Y190.629
G1 X28.417 Y167.464 E.97583
G1 X28.417 Y167.997
G1 X51.583 Y191.163 E.97583
G1 X51.583 Y191.696
G1 X28.417 Y168.531 E.97583
G1 X28.417 Y169.064
G1 X51.583 Y192.229 E.97583
G1 X51.583 Y192.762
G1 X28.417 Y169.597 E.97583
G1 X28.417 Y170.13
G1 X51.583 Y193.296 E.97583
G1 X51.583 Y193.829
G1 X28.417 Y170.664 E.97583
G1 X28.417 Y171.197
G1 X51.583 Y194.362 E.97583
G1 X51.583 Y194.895
G1 X28.417 Y171.73 E.97583
G1 X28.417 Y172.263
G1 X51.583 Y195.429 E.97583
M73 P98 R0
G1 X51.583 Y195.962
G1 X28.417 Y172.797 E.97583
G1 X28.417 Y173.33
G1 X74.545 Y219.458 E1.94311
G1 X74.012 Y219.458
G1 X28.417 Y173.863 E1.92065
G1 X28.417 Y174.396
G1 X73.479 Y219.458 E1.89819
G1 X72.945 Y219.458
G1 X28.417 Y174.93 E1.87572
G1 X28.417 Y175.463
G1 X72.412 Y219.458 E1.85326
G1 X71.879 Y219.458
G1 X28.417 Y175.996 E1.8308
G1 X28.417 Y176.529
G1 X71.346 Y219.458 E1.80833
G1 X70.812 Y219.458
G1 X28.417 Y177.063 E1.78587
G1 X28.417 Y177.596
G1 X70.279 Y219.458 E1.76341
G1 X69.746 Y219.458
G1 X28.417 Y178.129 E1.74094
G1 X28.417 Y178.662
G1 X69.213 Y219.458 E1.71848
G1 X68.679 Y219.458
G1 X28.417 Y179.196 E1.69602
G1 X28.417 Y179.729
G1 X68.146 Y219.458 E1.67355
G1 X67.613 Y219.458
G1 X28.417 Y180.262 E1.65109
G1 X28.417 Y180.795
G1 X67.08 Y219.458 E1.62863
G1 X66.546 Y219.458
G1 X28.417 Y181.329 E1.60616
G1 X28.417 Y181.862
G1 X66.013 Y219.458 E1.5837
G1 X65.48 Y219.458
G1 X28.417 Y182.395 E1.56124
G1 X28.417 Y182.929
G1 X64.946 Y219.458 E1.53877
G1 X64.413 Y219.458
G1 X28.417 Y183.462 E1.51631
G1 X28.417 Y183.995
G1 X63.88 Y219.458 E1.49385
G1 X63.347 Y219.458
G1 X28.417 Y184.528 E1.47138
G1 X28.417 Y185.062
G1 X62.813 Y219.458 E1.44892
G1 X62.28 Y219.458
G1 X28.417 Y185.595 E1.42646
G1 X28.417 Y186.128
G1 X61.747 Y219.458 E1.40399
G1 X61.214 Y219.458
G1 X28.417 Y186.661 E1.38153
G1 X28.417 Y187.195
G1 X60.68 Y219.458 E1.35907
G1 X60.147 Y219.458
G1 X28.417 Y187.728 E1.3366
G1 X28.417 Y188.261
G1 X59.614 Y219.458 E1.31414
G1 X59.081 Y219.458
G1 X28.417 Y188.794 E1.29168
G1 X28.417 Y189.328
G1 X58.547 Y219.458 E1.26921
G1 X58.014 Y219.458
G1 X28.417 Y189.861 E1.24675
G1 X28.417 Y190.394
G1 X57.481 Y219.458 E1.22429
G1 X56.948 Y219.458
G1 X28.417 Y190.927 E1.20182
G1 X28.417 Y191.461
G1 X56.414 Y219.458 E1.17936
G1 X55.881 Y219.458
G1 X28.417 Y191.994 E1.1569
G1 X28.417 Y192.527
G1 X55.348 Y219.458 E1.13444
M73 P99 R0
G1 X54.815 Y219.458
G1 X28.417 Y193.06 E1.11197
G1 X28.417 Y193.594
G1 X40.555 Y205.731 E.51129
G1 X39.958 Y205.668
G1 X28.417 Y194.127 E.48615
G1 X28.417 Y194.66
G1 X39.485 Y205.728 E.46623
G1 X39.088 Y205.864
G1 X28.417 Y195.193 E.44951
G1 X28.417 Y195.727
G1 X38.747 Y206.057 E.43514
G1 X38.453 Y206.296
G1 X28.417 Y196.26 E.42277
G1 X28.417 Y196.793
G1 X38.204 Y206.58 E.41226
G1 X38.002 Y206.911
G1 X28.417 Y197.326 E.40374
G1 X28.417 Y197.86
G1 X37.859 Y207.302 E.39774
G1 X37.785 Y207.76
G1 X28.417 Y198.393 E.39459
G1 X28.417 Y198.926
G1 X37.843 Y208.352 E.39707
; WIPE_START
M204 S10000
G1 X36.429 Y206.938 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X42.139 Y207.315 Z3.4 F30000
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X54.281 Y219.458 E.51148
G1 X53.748 Y219.458
G1 X42.208 Y207.917 E.48614
G1 X42.148 Y208.391
G1 X53.215 Y219.458 E.46618
G1 X52.682 Y219.458
G1 X42.011 Y208.787 E.44948
G1 X41.818 Y209.127
G1 X52.148 Y219.458 E.43516
G1 X51.615 Y219.458
G1 X41.578 Y209.42 E.42282
G1 X41.292 Y209.668
G1 X51.082 Y219.458 E.41237
G1 X50.549 Y219.458
G1 X40.961 Y209.87 E.40389
G1 X40.573 Y210.016
G1 X50.015 Y219.458 E.39774
G1 X49.482 Y219.458
G1 X40.112 Y210.088 E.39469
G1 X39.532 Y210.041
G1 X48.949 Y219.458 E.39666
G1 X48.415 Y219.458
G1 X28.417 Y199.459 E.84241
G1 X28.417 Y199.993
G1 X47.882 Y219.458 E.81995
G1 X47.349 Y219.458
G1 X28.417 Y200.526 E.79749
G1 X28.417 Y201.059
G1 X46.816 Y219.458 E.77502
G1 X46.282 Y219.458
G1 X28.417 Y201.593 E.75256
G1 X28.417 Y202.126
G1 X45.749 Y219.458 E.7301
G1 X45.216 Y219.458
G1 X28.417 Y202.659 E.70763
G1 X28.417 Y203.192
G1 X44.683 Y219.458 E.68517
G1 X44.149 Y219.458
G1 X28.417 Y203.726 E.66271
G1 X28.417 Y204.259
G1 X43.616 Y219.458 E.64024
G1 X43.083 Y219.458
G1 X28.417 Y204.792 E.61778
G1 X28.417 Y205.325
G1 X42.55 Y219.458 E.59532
G1 X42.016 Y219.458
G1 X28.417 Y205.859 E.57285
G1 X28.417 Y206.392
G1 X41.483 Y219.458 E.55039
G1 X40.95 Y219.458
G1 X28.417 Y206.925 E.52793
G1 X28.417 Y207.458
G1 X40.417 Y219.458 E.50546
G1 X39.883 Y219.458
G1 X28.417 Y207.992 E.483
G1 X28.417 Y208.525
G1 X39.35 Y219.458 E.46054
G1 X38.817 Y219.458
G1 X28.417 Y209.058 E.43807
G1 X28.417 Y209.591
G1 X38.284 Y219.458 E.41561
G1 X37.75 Y219.458
G1 X28.417 Y210.125 E.39315
G1 X28.417 Y210.658
G1 X37.217 Y219.458 E.37068
G1 X36.684 Y219.458
G1 X28.417 Y211.191 E.34822
G1 X28.417 Y211.724
G1 X36.151 Y219.458 E.32576
G1 X35.617 Y219.458
G1 X28.417 Y212.258 E.30329
G1 X28.417 Y212.791
G1 X35.084 Y219.458 E.28083
G1 X34.551 Y219.458
G1 X28.417 Y213.324 E.25837
G1 X28.417 Y213.857
G1 X34.018 Y219.458 E.23591
G1 X33.484 Y219.458
G1 X28.417 Y214.391 E.21344
G1 X28.417 Y214.924
G1 X32.951 Y219.458 E.19098
G1 X32.418 Y219.458
G1 X28.417 Y215.457 E.16852
G1 X28.417 Y215.99
G1 X31.885 Y219.458 E.14605
G1 X31.351 Y219.458
G1 X28.417 Y216.524 E.12359
G1 X28.417 Y217.057
G1 X30.818 Y219.458 E.10113
G1 X30.285 Y219.458
G1 X28.417 Y217.59 E.07866
G1 X28.417 Y218.124
G1 X29.751 Y219.458 E.0562
G1 X29.218 Y219.458
G1 X28.417 Y218.657 E.03374
; WIPE_START
M204 S10000
G1 X29.218 Y219.458 E-.43038
G1 X29.751 Y219.458 E-.20264
G1 X29.515 Y219.221 E-.12698
; WIPE_END
G1 E-.04 F1800
G1 X33.311 Y212.6 Z3.4 F30000
G1 X130.218 Y43.566 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.177857
G1 F15000
G1 X130.157 Y43.453 E.00136
; LINE_WIDTH: 0.143634
G1 X130.097 Y43.364 E.00086
; LINE_WIDTH: 0.106661
G1 X130.037 Y43.275 E.00054
; WIPE_START
G1 X130.097 Y43.364 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.992 Y45.043 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.101123
G1 F15000
G1 X125.94 Y44.971 E.00041
; LINE_WIDTH: 0.137231
G3 X125.791 Y44.743 I2.162 J-1.588 E.00203
; WIPE_START
G1 X125.94 Y44.971 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X118.308 Y44.975 Z3.4 F30000
G1 X37.98 Y45.019 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.122853
G1 F15000
G3 X37.786 Y44.727 I2.799 J-2.078 E.00221
; WIPE_START
G1 X37.98 Y45.019 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X42.215 Y43.55 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.182923
G1 F15000
G1 X42.161 Y43.452 E.00124
; LINE_WIDTH: 0.150518
G1 X42.094 Y43.352 E.00102
; LINE_WIDTH: 0.108956
G1 X42.028 Y43.253 E.00062
; WIPE_START
G1 X42.094 Y43.352 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.702 Y49.437 Z3.4 F30000
G1 X51.601 Y55.907 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.101835
G1 F15000
G1 X51.572 Y55.93 E.00017
G1 X51.483 Y55.815 E.00068
; WIPE_START
G1 X51.572 Y55.93 E-.60649
G1 X51.601 Y55.907 E-.15351
; WIPE_END
G1 E-.04 F1800
G1 X57.226 Y61.067 Z3.4 F30000
G1 X204.518 Y196.185 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.101821
G1 F15000
G1 X204.428 Y196.07 E.00068
G1 X204.399 Y196.093 E.00017
; WIPE_START
G1 X204.428 Y196.07 E-.15353
G1 X204.518 Y196.185 E-.60647
; WIPE_END
G1 E-.04 F1800
G1 X197.46 Y193.28 Z3.4 F30000
G1 X39.03 Y128.074 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.193343
G1 F15000
G3 X38.862 Y127.958 I1.076 J-1.725 E.00242
; LINE_WIDTH: 0.154722
G1 X38.695 Y127.815 E.00194
; LINE_WIDTH: 0.112475
G1 X38.527 Y127.673 E.00121
G3 X38.214 Y127.348 I55.912 J-54.156 E.00248
; LINE_WIDTH: 0.1422
G1 X38.063 Y127.156 E.00192
; LINE_WIDTH: 0.189834
G1 X37.912 Y126.964 E.00284
; WIPE_START
G1 X38.063 Y127.156 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X42.057 Y124.988 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.210131
G1 F15000
G1 X41.999 Y124.902 E.00137
; LINE_WIDTH: 0.184981
G1 X41.859 Y124.733 E.00247
; LINE_WIDTH: 0.131456
G1 X41.718 Y124.563 E.00154
G2 X41.395 Y124.244 I-44.205 J44.442 E.00318
; LINE_WIDTH: 0.150673
G1 X41.236 Y124.116 E.00174
; LINE_WIDTH: 0.192982
G1 X41.078 Y123.988 E.00242
G1 X41.036 Y123.992 E.0005
; LINE_WIDTH: 0.1545
G1 X40.936 Y124.008 E.00089
; WIPE_START
G1 X41.036 Y123.992 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X40.757 Y131.62 Z3.4 F30000
G1 X37.943 Y208.692 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.10152
G1 F15000
G3 X37.77 Y208.425 I2.449 J-1.778 E.00147
; WIPE_START
G1 X37.943 Y208.692 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X40.773 Y205.683 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.10706
G1 F15000
G1 X40.543 Y205.743 E.0012
; WIPE_START
G1 X40.773 Y205.683 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X42.132 Y207.323 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.167533
G1 F15000
G2 X42.165 Y207.182 I-1.429 J-.417 E.00143
; LINE_WIDTH: 0.176588
G1 X42.11 Y207.1 E.00105
; LINE_WIDTH: 0.141223
G1 X42.054 Y207.017 E.00077
; LINE_WIDTH: 0.105858
G1 X41.999 Y206.934 E.0005
; WIPE_START
G1 X42.054 Y207.017 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X49.685 Y207.171 Z3.4 F30000
G1 X125.955 Y208.716 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.108891
G1 F15000
G3 X125.775 Y208.442 I2.648 J-1.934 E.00171
; WIPE_START
G1 X125.955 Y208.716 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.192 Y205.67 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0923538
G1 F15000
G2 X128.023 Y205.591 I-.891 J1.682 E.00073
G1 X128.757 Y205.68 F30000
; LINE_WIDTH: 0.124117
G1 F15000
G1 X128.529 Y205.739 E.00151
; WIPE_START
G1 X128.757 Y205.68 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.136 Y207.337 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.183203
G1 F15000
G1 X130.17 Y207.198 E.00159
; LINE_WIDTH: 0.174234
G1 X130.116 Y207.117 E.00101
; LINE_WIDTH: 0.139811
G1 X130.062 Y207.037 E.00074
; LINE_WIDTH: 0.105387
G1 X130.008 Y206.956 E.00048
; WIPE_START
G1 X130.062 Y207.037 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.434 Y210.098 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.137996
G1 F15000
G1 X127.28 Y210.002 E.00136
; LINE_WIDTH: 0.111966
G1 X127.153 Y209.914 E.00085
; WIPE_START
G1 X127.28 Y210.002 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X134.913 Y210.01 Z3.4 F30000
G1 X215.418 Y210.093 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.147348
G1 F15000
G1 X215.278 Y210.007 E.00136
; LINE_WIDTH: 0.130727
G1 X215.204 Y209.955 E.00063
; LINE_WIDTH: 0.102355
G1 X215.13 Y209.904 E.00042
; WIPE_START
G1 X215.204 Y209.955 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X218.211 Y207.281 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.189185
G1 F15000
G1 X218.166 Y207.2 E.00108
; LINE_WIDTH: 0.158739
G1 X218.091 Y207.089 E.00122
; LINE_WIDTH: 0.111696
G1 X218.017 Y206.977 E.00073
; WIPE_START
G1 X218.091 Y207.089 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X213.793 Y208.594 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.115344
G1 F15000
G1 X213.853 Y208.363 E.00136
; WIPE_START
G1 X213.793 Y208.594 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X214.184 Y200.971 Z3.4 F30000
G1 X218.076 Y125.031 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.200217
G1 F15000
G1 X217.992 Y124.907 E.00186
; LINE_WIDTH: 0.167123
G1 X217.851 Y124.738 E.00216
; LINE_WIDTH: 0.113734
G1 X217.711 Y124.568 E.00123
G2 X217.39 Y124.251 I-55.974 J56.362 E.00252
; LINE_WIDTH: 0.134506
G1 X217.219 Y124.113 E.00159
; LINE_WIDTH: 0.181118
G1 X217.047 Y123.975 E.0024
; LINE_WIDTH: 0.206335
G1 X216.89 Y123.996 E.00204
; WIPE_START
G1 X217.047 Y123.975 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X214.984 Y128.054 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.202686
G1 F15000
G3 X214.857 Y127.965 I.838 J-1.336 E.00196
; LINE_WIDTH: 0.17251
G1 X214.69 Y127.823 E.00225
; LINE_WIDTH: 0.1302
G1 X214.522 Y127.68 E.00151
G3 X214.207 Y127.353 I44.293 J-42.964 E.00314
; LINE_WIDTH: 0.157559
G1 X214.068 Y127.176 E.00203
; LINE_WIDTH: 0.199953
G1 X213.929 Y127 E.00278
; WIPE_START
G1 X214.068 Y127.176 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X214.447 Y119.553 Z3.4 F30000
G1 X218.226 Y43.577 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.155722
G1 F15000
G1 X218.153 Y43.455 E.00126
; LINE_WIDTH: 0.136744
G1 X218.099 Y43.376 E.00071
; LINE_WIDTH: 0.104365
G1 X218.046 Y43.297 E.00046
; WIPE_START
G1 X218.099 Y43.376 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X215.372 Y46.326 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.185508
G1 F15000
G1 X215.272 Y46.27 E.00129
; LINE_WIDTH: 0.158038
G1 X215.199 Y46.219 E.00081
; LINE_WIDTH: 0.125936
G1 X215.126 Y46.168 E.00059
; LINE_WIDTH: 0.0990322
G1 X215.057 Y46.121 E.00037
; WIPE_START
G1 X215.126 Y46.168 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X216.836 Y42.07 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.185371
G1 F15000
G1 X216.609 Y41.936 E.00296
G1 X216.46 Y41.983 E.00176
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F15000
G1 X216.609 Y41.936 E-.28304
G1 X216.836 Y42.07 E-.47696
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

