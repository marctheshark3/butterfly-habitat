; HEADER_BLOCK_START
; BambuStudio 02.04.00.70
; model printing time: 1h 1m 27s; total estimated time: 1h 8m 40s
; total layer number: 58
; total filament length [mm] : 10538.61
; total filament volume [cm^3] : 25348.33
; total filament weight [g] : 32.19
; filament_density: 1.27
; filament_diameter: 1.75
; max_z_height: 11.60
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
M73 P0 R68
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
M73 P2 R67
G1 E50 F200
M400
M104 S255
G92 E0
M73 P8 R62
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S235 ; drop nozzle temp, make filament shink a bit
G92 E0
G1 E-0.5 F300

M73 P9 R62
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
    G29 A X41.3293 Y38.3293 I173.341 J179.341
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
; layer num/total_layer_count: 1/58
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
M73 P9 R61
G1 X42.926 Y37.797
G1 Z.2
G1 E.8 F1800
; FEATURE: Brim
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X43.419 Y37.386 E.02317
G1 X43.964 Y37.053 E.02305
G1 X44.802 Y36.727 E.03248
G1 X45.429 Y36.596 E.02313
G1 X46.008 Y36.558 E.02093
G1 X209.992 Y36.558 E5.92081
G1 X210.64 Y36.606 E.02347
G1 X211.263 Y36.746 E.02304
G1 X212.106 Y37.103 E.03306
G1 X212.724 Y37.5 E.02653
G1 X213.203 Y37.926 E.02313
M73 P10 R61
G1 X213.614 Y38.419 E.02317
G1 X213.947 Y38.964 E.02305
G1 X214.273 Y39.802 E.03248
G1 X214.404 Y40.429 E.02313
G1 X214.442 Y41.008 E.02094
G1 X214.442 Y210.991 E6.13744
G1 X214.394 Y211.64 E.02348
G1 X214.254 Y212.263 E.02304
G1 X213.897 Y213.106 E.03306
G1 X213.5 Y213.724 E.02653
G1 X213.074 Y214.203 E.02313
G1 X212.581 Y214.614 E.02317
G1 X212.036 Y214.947 E.02305
G1 X211.198 Y215.273 E.03248
G1 X210.571 Y215.404 E.02313
G1 X209.992 Y215.442 E.02094
G1 X46.009 Y215.442 E5.9208
G1 X45.36 Y215.394 E.02348
G1 X44.737 Y215.254 E.02304
G1 X43.894 Y214.897 E.03306
G1 X43.276 Y214.5 E.02653
G1 X42.797 Y214.074 E.02313
G1 X42.386 Y213.581 E.02317
G1 X42.053 Y213.036 E.02305
G1 X41.727 Y212.198 E.03248
G1 X41.596 Y211.571 E.02313
G1 X41.558 Y210.992 E.02093
G1 X41.558 Y41.008 E6.13745
G1 X41.606 Y40.36 E.02347
G1 X41.746 Y39.737 E.02304
G1 X42.103 Y38.894 E.03306
G1 X42.5 Y38.276 E.02653
G1 X42.886 Y37.842 E.02097
M204 S6000
G1 X43.228 Y38.145 F30000
G1 F3000
M204 S500
G1 X43.238 Y38.134 E.00053
G1 X43.694 Y37.753 E.02145
G1 X44.178 Y37.46 E.02043
G1 X44.944 Y37.165 E.02962
G1 X45.482 Y37.052 E.01985
G1 X46.027 Y37.015 E.01974
G1 X209.98 Y37.015 E5.91967
G1 X210.562 Y37.058 E.02109
G1 X211.11 Y37.18 E.02026
G1 X211.881 Y37.505 E.0302
G1 X212.438 Y37.86 E.02385
G1 X212.866 Y38.238 E.02063
G1 X213.247 Y38.694 E.02145
G1 X213.54 Y39.178 E.02043
G1 X213.836 Y39.944 E.02962
G1 X213.948 Y40.482 E.01985
G1 X213.985 Y41.027 E.01975
G1 X213.985 Y210.969 E6.13593
G1 X213.942 Y211.562 E.02146
G1 X213.812 Y212.133 E.02114
G1 X213.485 Y212.901 E.03015
G1 X213.141 Y213.438 E.02302
G1 X212.762 Y213.866 E.02063
G1 X212.306 Y214.247 E.02145
G1 X211.822 Y214.54 E.02043
G1 X211.056 Y214.835 E.02962
G1 X210.518 Y214.948 E.01985
G1 X209.973 Y214.985 E.01975
G1 X46.031 Y214.985 E5.91929
G1 X45.438 Y214.942 E.02146
G1 X44.867 Y214.812 E.02114
G1 X44.099 Y214.485 E.03015
G1 X43.562 Y214.14 E.02302
G1 X43.134 Y213.762 E.02063
G1 X42.753 Y213.306 E.02145
G1 X42.46 Y212.822 E.02043
G1 X42.165 Y212.056 E.02962
G1 X42.052 Y211.518 E.01985
G1 X42.015 Y210.973 E.01974
G1 X42.015 Y41.03 E6.13594
G1 X42.058 Y40.438 E.02146
G1 X42.188 Y39.867 E.02114
G1 X42.515 Y39.099 E.03015
G1 X42.86 Y38.562 E.02302
G1 X43.189 Y38.19 E.01793
M204 S6000
G1 X43.532 Y38.492 F30000
G1 F3000
M204 S500
G1 X43.551 Y38.47 E.00102
G1 X43.952 Y38.133 E.01894
G1 X44.392 Y37.868 E.01853
G1 X45.085 Y37.602 E.02679
G1 X45.554 Y37.505 E.0173
G1 X46.047 Y37.472 E.01786
G1 X209.958 Y37.472 E5.91814
G1 X210.485 Y37.511 E.01911
G1 X210.982 Y37.622 E.01837
G1 X211.678 Y37.917 E.02729
G1 X212.153 Y38.22 E.02034
G1 X212.53 Y38.551 E.01809
G1 X212.867 Y38.952 E.01894
G1 X213.132 Y39.392 E.01853
G1 X213.398 Y40.085 E.02679
G1 X213.495 Y40.554 E.0173
G1 X213.528 Y41.048 E.01787
G1 X213.528 Y210.948 E6.13441
G1 X213.489 Y211.484 E.01943
G1 X213.371 Y212.003 E.01922
G1 X213.073 Y212.697 E.02724
M73 P11 R61
G1 X212.781 Y213.153 E.01956
G1 X212.449 Y213.53 E.01811
G1 X212.048 Y213.867 E.01894
G1 X211.608 Y214.132 E.01853
G1 X210.915 Y214.398 E.02679
G1 X210.446 Y214.495 E.0173
G1 X209.952 Y214.528 E.01787
G1 X46.052 Y214.528 E5.91778
G1 X45.516 Y214.489 E.01943
G1 X44.997 Y214.371 E.01922
G1 X44.303 Y214.073 E.02724
G1 X43.847 Y213.78 E.01956
G1 X43.47 Y213.449 E.01811
G1 X43.133 Y213.048 E.01894
G1 X42.868 Y212.608 E.01853
G1 X42.602 Y211.915 E.02679
G1 X42.505 Y211.446 E.0173
G1 X42.472 Y210.953 E.01786
G1 X42.472 Y41.052 E6.13442
G1 X42.511 Y40.516 E.01942
G1 X42.629 Y39.997 E.01922
G1 X42.927 Y39.303 E.02724
G1 X43.22 Y38.847 E.01956
G1 X43.492 Y38.537 E.01492
M204 S6000
G1 X43.837 Y38.837 F30000
G1 F3000
M204 S500
G1 X43.864 Y38.806 E.0015
G1 X44.211 Y38.513 E.01639
G1 X44.605 Y38.276 E.0166
G1 X45.224 Y38.04 E.02395
G1 X45.625 Y37.959 E.01475
G1 X46.068 Y37.929 E.01602
G1 X209.936 Y37.929 E5.91663
G1 X210.408 Y37.964 E.0171
G1 X210.853 Y38.064 E.01647
G1 X211.474 Y38.329 E.02438
M73 P11 R60
G1 X211.869 Y38.581 E.0169
G1 X212.194 Y38.864 E.01557
G1 X212.487 Y39.211 E.01639
G1 X212.724 Y39.605 E.0166
G1 X212.96 Y40.224 E.02395
G1 X213.041 Y40.625 E.01475
G1 X213.071 Y41.068 E.01602
G1 X213.071 Y210.926 E6.13291
G1 X213.036 Y211.406 E.01738
G1 X212.929 Y211.873 E.01728
G1 X212.662 Y212.491 E.02434
G1 X212.42 Y212.868 E.01617
G1 X212.136 Y213.194 E.01561
G1 X211.789 Y213.487 E.01639
G1 X211.395 Y213.724 E.0166
G1 X210.776 Y213.96 E.02395
G1 X210.375 Y214.041 E.01475
G1 X209.932 Y214.071 E.01602
G1 X46.074 Y214.071 E5.91627
G1 X45.594 Y214.036 E.01738
G1 X45.127 Y213.929 E.01728
G1 X44.509 Y213.662 E.02434
G1 X44.132 Y213.42 E.01617
G1 X43.806 Y213.136 E.01561
G1 X43.513 Y212.789 E.01639
G1 X43.276 Y212.395 E.0166
G1 X43.04 Y211.776 E.02395
G1 X42.959 Y211.375 E.01475
G1 X42.929 Y210.932 E.01602
G1 X42.929 Y41.074 E6.13292
G1 X42.964 Y40.594 E.01737
G1 X43.071 Y40.127 E.01728
G1 X43.338 Y39.509 E.02434
G1 X43.58 Y39.132 E.01617
G1 X43.797 Y38.882 E.01194
M204 S6000
G1 X44.143 Y39.182 F30000
G1 F3000
M204 S500
G1 X44.179 Y39.14 E.00198
G1 X44.487 Y38.88 E.01458
G1 X44.817 Y38.684 E.01384
G1 X45.363 Y38.478 E.02108
G1 X45.695 Y38.412 E.01222
G1 X46.087 Y38.386 E.0142
G1 X209.914 Y38.386 E5.91514
G1 X210.331 Y38.416 E.01507
G1 X210.723 Y38.506 E.01454
G1 X211.27 Y38.741 E.02148
G1 X211.586 Y38.942 E.01353
G1 X211.86 Y39.179 E.01307
G1 X212.12 Y39.487 E.01458
G1 X212.316 Y39.817 E.01384
G1 X212.522 Y40.363 E.02108
G1 X212.588 Y40.695 E.01222
G1 X212.614 Y41.087 E.0142
G1 X212.614 Y210.905 E6.13142
G1 X212.581 Y211.348 E.01607
G1 X212.488 Y211.741 E.01456
G1 X212.251 Y212.285 E.02143
G1 X212.059 Y212.585 E.01285
G1 X211.821 Y212.86 E.01313
G1 X211.513 Y213.12 E.01458
G1 X211.183 Y213.316 E.01384
G1 X210.637 Y213.522 E.02108
G1 X210.305 Y213.588 E.01222
G1 X209.913 Y213.614 E.0142
G1 X46.095 Y213.614 E5.91479
G1 X45.652 Y213.581 E.01607
G1 X45.259 Y213.488 E.01456
G1 X44.715 Y213.251 E.02143
G1 X44.415 Y213.059 E.01285
G1 X44.14 Y212.821 E.01313
G1 X43.88 Y212.513 E.01458
G1 X43.684 Y212.183 E.01384
G1 X43.478 Y211.637 E.02108
G1 X43.412 Y211.305 E.01222
G1 X43.386 Y210.913 E.0142
G1 X43.386 Y41.095 E6.13143
G1 X43.419 Y40.652 E.01606
G1 X43.512 Y40.259 E.01456
G1 X43.749 Y39.715 E.02143
G1 X43.941 Y39.415 E.01285
G1 X44.104 Y39.227 E.00898
M204 S6000
G1 X44.471 Y39.519 F30000
G1 F3000
M204 S500
G1 X44.48 Y39.508 E.00052
G1 X44.842 Y39.208 E.01696
G1 X45.185 Y39.023 E.01408
G1 X45.553 Y38.904 E.01396
G1 X46.036 Y38.843 E.0176
G1 X209.958 Y38.843 E5.91857
G1 X210.5 Y38.92 E.01976
G1 X210.875 Y39.05 E.01433
G1 X211.22 Y39.255 E.01449
G1 X211.576 Y39.566 E.01706
G1 X211.85 Y39.934 E.01658
G1 X212.014 Y40.277 E.0137
G1 X212.116 Y40.649 E.01394
G1 X212.157 Y41.035 E.01401
G1 X212.157 Y210.968 E6.13561
G1 X212.113 Y211.352 E.01394
G1 X211.967 Y211.832 E.01814
G1 X211.741 Y212.227 E.01643
G1 X211.433 Y212.577 E.0168
G1 X211.066 Y212.85 E.01654
G1 X210.723 Y213.014 E.0137
M73 P12 R60
G1 X210.351 Y213.116 E.01394
G1 X209.965 Y213.157 E.01401
G1 X46.032 Y213.157 E5.91898
G1 X45.648 Y213.113 E.01394
G1 X45.168 Y212.967 E.01814
G1 X44.773 Y212.741 E.01643
G1 X44.423 Y212.433 E.0168
G1 X44.15 Y212.066 E.01655
G1 X43.986 Y211.723 E.0137
G1 X43.884 Y211.351 E.01395
G1 X43.843 Y210.965 E.014
G1 X43.843 Y41.041 E6.1353
G1 X43.899 Y40.592 E.01634
G1 X44.003 Y40.233 E.01348
G1 X44.198 Y39.862 E.01514
G1 X44.433 Y39.566 E.01364
M204 S6000
G1 X44.784 Y39.857 F30000
G1 F3000
M204 S500
G1 X44.839 Y39.791 E.0031
G1 X45.131 Y39.562 E.01339
G1 X45.398 Y39.427 E.01082
G1 X45.692 Y39.339 E.01108
G1 X46.027 Y39.3 E.01218
G1 X209.968 Y39.3 E5.91923
G1 X210.355 Y39.353 E.01413
G1 X210.642 Y39.443 E.01082
G1 X210.922 Y39.6 E.01162
G1 X211.209 Y39.839 E.01348
G1 X211.438 Y40.131 E.01339
G1 X211.573 Y40.398 E.01082
G1 X211.661 Y40.692 E.01107
G1 X211.7 Y41.027 E.01219
G1 X211.7 Y210.976 E6.13616
G1 X211.659 Y211.306 E.01203
G1 X211.529 Y211.702 E.01502
G1 X211.396 Y211.927 E.00945
G1 X211.161 Y212.21 E.01328
G1 X210.869 Y212.438 E.01336
G1 X210.602 Y212.573 E.01082
G1 X210.308 Y212.661 E.01107
G1 X209.973 Y212.7 E.01219
G1 X46.024 Y212.7 E5.91952
G1 X45.694 Y212.659 E.01203
G1 X45.299 Y212.529 E.01502
G1 X45.073 Y212.396 E.00945
G1 X44.79 Y212.161 E.01328
G1 X44.562 Y211.869 E.01337
G1 X44.427 Y211.602 E.01082
G1 X44.339 Y211.308 E.01108
G1 X44.3 Y210.973 E.01218
G1 X44.3 Y41.032 E6.13587
G1 X44.353 Y40.645 E.01413
G1 X44.443 Y40.358 E.01082
G1 X44.6 Y40.078 E.01162
G1 X44.746 Y39.903 E.00821
M204 S6000
G1 X45.097 Y40.195 F30000
G1 F3000
M204 S500
G1 X45.196 Y40.076 E.00559
G1 X45.403 Y39.929 E.00914
G1 X45.6 Y39.837 E.00786
G1 X45.742 Y39.794 E.00535
G1 X46.019 Y39.757 E.01012
G1 X209.977 Y39.757 E5.91986
G1 X210.295 Y39.806 E.01161
G1 X210.503 Y39.878 E.00794
G1 X210.621 Y39.944 E.00489
G1 X210.925 Y40.196 E.01425
G1 X211.071 Y40.403 E.00914
G1 X211.163 Y40.6 E.00785
G1 X211.206 Y40.742 E.00535
G1 X211.243 Y41.019 E.01012
G1 X211.243 Y210.984 E6.13675
G1 X211.224 Y211.166 E.00658
G1 X211.13 Y211.48 E.01184
G1 X211.052 Y211.626 E.00598
G1 X210.804 Y211.924 E.01401
G1 X210.597 Y212.071 E.00915
G1 X210.4 Y212.163 E.00785
G1 X210.258 Y212.206 E.00535
G1 X209.981 Y212.243 E.01012
G1 X46.016 Y212.243 E5.92011
G1 X45.834 Y212.224 E.00658
G1 X45.52 Y212.13 E.01184
M73 P12 R59
G1 X45.374 Y212.052 E.00598
G1 X45.076 Y211.804 E.01401
G1 X44.929 Y211.597 E.00915
G1 X44.837 Y211.4 E.00786
G1 X44.794 Y211.258 E.00535
G1 X44.757 Y210.981 E.01012
G1 X44.757 Y41.023 E6.13649
G1 X44.806 Y40.705 E.01161
G1 X44.878 Y40.497 E.00794
G1 X44.944 Y40.379 E.00489
G1 X45.059 Y40.241 E.00649
M204 S6000
G1 X45.417 Y40.512 F30000
G1 F3000
M204 S500
G1 X45.473 Y40.439 E.00334
G1 X45.586 Y40.348 E.00525
G1 X45.803 Y40.246 E.00865
G1 X46.011 Y40.214 E.00758
G1 X209.988 Y40.214 E5.92056
G1 X210.221 Y40.257 E.00857
G1 X210.34 Y40.304 E.0046
G1 X210.561 Y40.473 E.01005
G1 X210.652 Y40.586 E.00525
G1 X210.754 Y40.803 E.00865
G1 X210.786 Y41.011 E.00758
G1 X210.786 Y210.991 E6.13733
G1 X210.77 Y211.118 E.0046
G1 X210.694 Y211.343 E.00857
G1 X210.527 Y211.561 E.00992
G1 X210.414 Y211.652 E.00525
G1 X210.197 Y211.754 E.00865
G1 X209.989 Y211.786 E.00758
G1 X46.009 Y211.786 E5.92069
G1 X45.882 Y211.77 E.0046
G1 X45.657 Y211.694 E.00857
G1 X45.439 Y211.527 E.00992
G1 X45.348 Y211.414 E.00525
G1 X45.246 Y211.197 E.00865
G1 X45.214 Y210.989 E.00758
G1 X45.214 Y41.012 E6.13719
M73 P13 R59
G1 X45.257 Y40.779 E.00857
G1 X45.304 Y40.661 E.0046
G1 X45.38 Y40.56 E.00455
M204 S6000
G1 X45.747 Y40.805 F30000
G1 F3000
M204 S500
G1 X45.884 Y40.696 E.00632
G1 X46 Y40.671 E.00429
G1 X210 Y40.671 E5.92139
G1 X210.111 Y40.7 E.00413
G1 X210.195 Y40.747 E.0035
G1 X210.304 Y40.884 E.00632
G1 X210.329 Y41 E.00429
G1 X210.329 Y211 E6.13802
G1 X210.3 Y211.111 E.00413
G1 X210.253 Y211.195 E.0035
G1 X210.116 Y211.304 E.00632
G1 X210 Y211.329 E.00429
G1 X46 Y211.329 E5.92139
G1 X45.889 Y211.3 E.00413
G1 X45.805 Y211.253 E.0035
G1 X45.696 Y211.116 E.00632
G1 X45.671 Y211 E.00429
G1 X45.671 Y41 E6.13802
G1 X45.7 Y40.889 E.00413
G1 X45.718 Y40.857 E.00133
; WIPE_START
G1 X45.884 Y40.696 E-.08797
G1 X46 Y40.671 E-.04514
G1 X47.65 Y40.671 E-.6269
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X52.915 Y46.197 Z.6 F30000
G1 X209.6 Y210.6 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X46.4 Y210.6 E5.8925
G1 X46.4 Y41.4 E6.10914
G1 X209.6 Y41.4 E5.8925
G1 X209.6 Y210.54 E6.10697
M204 S6000
G1 X209.143 Y210.143 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X46.857 Y210.143 E5.8595
G1 X46.857 Y41.857 E6.07613
G1 X209.143 Y41.857 E5.8595
G1 X209.143 Y210.083 E6.07397
M204 S6000
G1 X208.686 Y209.686 F30000
G1 F3000
M204 S500
G1 X47.314 Y209.686 E5.82649
G1 X47.314 Y42.314 E6.04313
G1 X208.686 Y42.314 E5.82649
G1 X208.686 Y209.626 E6.04096
M204 S6000
G1 X208.229 Y209.229 F30000
G1 F3000
M204 S500
G1 X47.771 Y209.229 E5.79348
G1 X47.771 Y42.771 E6.01012
G1 X208.229 Y42.771 E5.79348
G1 X208.229 Y209.169 E6.00795
; WIPE_START
G1 X206.229 Y209.17 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X198.614 Y208.646 Z.6 F30000
G1 X55.74 Y198.816 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X55.945 Y198.8 E.00743
G3 X55.681 Y198.823 I.058 J2.199 E.48938
M204 S6000
G1 X55.2 Y198.467 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X55.41 Y198.409 E.00789
G3 X55.677 Y198.362 I.594 J2.59 E.00978
G1 X55.934 Y198.343 E.0093
G3 X55.142 Y198.485 I.07 J2.656 E.57363
M204 S6000
G1 X54.637 Y198.202 F30000
G1 F3000
M204 S500
G1 X54.719 Y198.162 E.00331
G3 X55.621 Y197.908 I1.285 J2.837 E.03394
G1 X55.922 Y197.885 E.01093
G3 X54.443 Y198.304 I.082 J3.113 E.65043
G1 X54.584 Y198.23 E.00574
M204 S6000
G1 X54.073 Y197.996 F30000
G1 F3000
M204 S500
G1 X54.214 Y197.908 E.00602
G3 X55.564 Y197.454 I1.79 J3.091 E.05177
G1 X55.911 Y197.428 E.01255
G3 X53.916 Y198.101 I.094 J3.571 E.73314
G1 X54.023 Y198.029 E.00465
; WIPE_START
G1 X54.214 Y197.908 E-.08612
M73 P14 R59
G1 X54.53 Y197.743 E-.1354
M73 P14 R58
G1 X54.862 Y197.613 E-.13552
G1 X55.208 Y197.515 E-.13655
G1 X55.564 Y197.454 E-.13737
G1 X55.903 Y197.428 E-.12904
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X56.109 Y189.799 Z.6 F30000
G1 X57.8 Y127.247 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X57.68 Y127.41 E.00729
G3 X55.733 Y123.816 I-1.677 J-1.416 E.30813
G1 X55.945 Y123.8 E.00768
G3 X57.928 Y127.05 I.058 J2.194 E.16633
G1 X57.832 Y127.197 E.00633
M204 S6000
G1 X58.323 Y127.289 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
M73 P15 R58
G1 X58.197 Y127.498 E.0088
G3 X55.677 Y123.362 I-2.193 J-1.499 E.38269
G1 X55.934 Y123.343 E.00931
G3 X58.354 Y127.238 I.07 J2.656 E.19976
M204 S6000
G1 X58.714 Y127.527 F30000
G1 F3000
M204 S500
G1 X58.575 Y127.756 E.00967
G3 X55.621 Y122.908 I-2.571 J-1.757 E.44859
G1 X55.922 Y122.885 E.01093
G3 X58.746 Y127.476 I.082 J3.113 E.23517
M204 S6000
G1 X59.105 Y127.764 F30000
G1 F3000
M204 S500
G1 X58.954 Y128.014 E.01053
G3 X55.564 Y122.454 I-2.949 J-2.015 E.51448
G1 X55.911 Y122.428 E.01255
G3 X59.14 Y127.71 I.094 J3.571 E.27041
G1 X59.137 Y127.714 E.00016
; WIPE_START
G1 X58.954 Y128.014 E-.13367
G1 X58.737 Y128.297 E-.1355
G1 X58.495 Y128.558 E-.13539
G1 X58.228 Y128.794 E-.13523
G1 X57.939 Y129.002 E-.1354
G1 X57.746 Y129.113 E-.08482
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X64.654 Y132.357 Z.6 F30000
G1 X190.4 Y191.4 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X65.6 Y191.4 E4.50603
G1 X65.6 Y60.6 E4.72267
G1 X190.4 Y60.6 E4.50603
G1 X190.4 Y191.34 E4.7205
M204 S6000
G1 X190.857 Y191.857 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X65.143 Y191.857 E4.53904
G1 X65.143 Y60.143 E4.75567
G1 X190.857 Y60.143 E4.53904
G1 X190.857 Y191.797 E4.75351
M204 S6000
G1 X191.314 Y192.314 F30000
G1 F3000
M204 S500
G1 X64.686 Y192.314 E4.57204
G1 X64.686 Y59.686 E4.78868
G1 X191.314 Y59.686 E4.57204
G1 X191.314 Y192.254 E4.78651
M204 S6000
G1 X191.771 Y192.771 F30000
G1 F3000
M204 S500
G1 X64.229 Y192.771 E4.60505
G1 X64.229 Y59.229 E4.82168
G1 X191.771 Y59.229 E4.60505
G1 X191.771 Y192.711 E4.81952
; WIPE_START
G1 X189.771 Y192.712 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X184.569 Y187.127 Z.6 F30000
G1 X55.747 Y48.815 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X55.945 Y48.8 E.00718
G3 X55.687 Y48.822 I.058 J2.194 E.4886
M204 S6000
G1 X55.2 Y48.467 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X55.41 Y48.409 E.00789
G3 X55.677 Y48.362 I.594 J2.59 E.00978
G1 X55.934 Y48.343 E.0093
G3 X55.143 Y48.485 I.07 J2.656 E.57364
M204 S6000
G1 X54.637 Y48.202 F30000
G1 F3000
M204 S500
G1 X54.719 Y48.162 E.0033
G3 X55.621 Y47.908 I1.285 J2.837 E.03394
G1 X55.922 Y47.885 E.01093
G3 X54.443 Y48.304 I.082 J3.113 E.65044
G1 X54.584 Y48.23 E.00574
M204 S6000
G1 X54.073 Y47.996 F30000
G1 F3000
M204 S500
G1 X54.214 Y47.907 E.00603
G3 X55.564 Y47.454 I1.79 J3.091 E.05176
G1 X55.911 Y47.428 E.01255
G3 X53.916 Y48.101 I.094 J3.571 E.73313
G1 X54.023 Y48.029 E.00466
; WIPE_START
G1 X54.214 Y47.907 E-.08621
G1 X54.53 Y47.743 E-.13528
G1 X54.862 Y47.613 E-.13553
M73 P15 R57
G1 X55.208 Y47.515 E-.1365
G1 X55.564 Y47.454 E-.13742
G1 X55.903 Y47.428 E-.12906
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X63.534 Y47.576 Z.6 F30000
G1 X127.747 Y48.815 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X127.945 Y48.8 E.00718
G3 X127.687 Y48.822 I.058 J2.194 E.4886
M204 S6000
M73 P16 R57
G1 X127.2 Y48.467 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X127.41 Y48.409 E.00789
G3 X127.677 Y48.362 I.594 J2.59 E.00978
G1 X127.934 Y48.343 E.00931
G3 X127.142 Y48.485 I.07 J2.656 E.57359
M204 S6000
G1 X126.637 Y48.202 F30000
G1 F3000
M204 S500
G1 X126.719 Y48.162 E.00331
G3 X127.621 Y47.908 I1.285 J2.837 E.03394
G1 X127.922 Y47.885 E.01093
G3 X126.443 Y48.304 I.082 J3.113 E.65044
G1 X126.584 Y48.23 E.00573
M204 S6000
G1 X126.073 Y47.996 F30000
G1 F3000
M204 S500
G1 X126.214 Y47.907 E.00603
G3 X127.564 Y47.454 I1.79 J3.091 E.05176
G1 X127.911 Y47.428 E.01255
G3 X125.916 Y48.101 I.094 J3.571 E.73314
G1 X126.023 Y48.029 E.00466
; WIPE_START
G1 X126.214 Y47.907 E-.08621
G1 X126.53 Y47.743 E-.1353
G1 X126.862 Y47.613 E-.13539
G1 X127.208 Y47.515 E-.13654
G1 X127.564 Y47.454 E-.13749
G1 X127.903 Y47.428 E-.12906
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X135.534 Y47.576 Z.6 F30000
G1 X199.747 Y48.815 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X199.945 Y48.8 E.00717
G3 X199.687 Y48.822 I.058 J2.194 E.48861
M204 S6000
G1 X199.199 Y48.468 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X199.41 Y48.409 E.00792
G3 X199.677 Y48.362 I.594 J2.59 E.00978
G1 X199.934 Y48.343 E.0093
G3 X199.142 Y48.486 I.07 J2.656 E.5736
M204 S6000
G1 X198.636 Y48.202 F30000
G1 F3000
M204 S500
G1 X198.719 Y48.162 E.00334
G3 X199.621 Y47.908 I1.285 J2.837 E.03394
G1 X199.922 Y47.885 E.01093
G3 X198.443 Y48.304 I.082 J3.113 E.65044
G1 X198.583 Y48.23 E.00571
M204 S6000
G1 X198.072 Y47.996 F30000
G1 F3000
M204 S500
G1 X198.214 Y47.907 E.00605
G3 X199.564 Y47.454 I1.79 J3.091 E.05176
G1 X199.911 Y47.428 E.01255
G3 X197.916 Y48.101 I.094 J3.571 E.73314
G1 X198.022 Y48.03 E.00463
; WIPE_START
G1 X198.214 Y47.907 E-.0865
G1 X198.53 Y47.743 E-.13528
G1 X198.862 Y47.613 E-.1355
G1 X199.208 Y47.515 E-.13654
G1 X199.564 Y47.454 E-.13742
G1 X199.902 Y47.428 E-.12875
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X199.887 Y55.061 Z.6 F30000
G1 X199.747 Y123.815 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X199.945 Y123.8 E.00718
G3 X199.687 Y123.822 I.058 J2.194 E.4886
M204 S6000
G1 X199.199 Y123.467 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X199.41 Y123.409 E.0079
G3 X199.677 Y123.362 I.594 J2.59 E.00978
G1 X199.934 Y123.343 E.0093
G3 X199.142 Y123.485 I.07 J2.656 E.57363
M204 S6000
G1 X198.637 Y123.202 F30000
G1 F3000
M204 S500
G1 X198.719 Y123.162 E.00331
G3 X199.621 Y122.908 I1.285 J2.837 E.03394
G1 X199.922 Y122.885 E.01093
G3 X198.443 Y123.303 I.082 J3.113 E.65045
G1 X198.584 Y123.23 E.00572
M204 S6000
G1 X198.073 Y122.996 F30000
G1 F3000
M204 S500
G1 X198.215 Y122.907 E.00605
G3 X199.564 Y122.454 I1.79 J3.091 E.05175
G1 X199.911 Y122.428 E.01255
G3 X197.916 Y123.101 I.094 J3.571 E.73314
G1 X198.023 Y123.029 E.00465
; WIPE_START
G1 X198.215 Y122.907 E-.08644
G1 X198.53 Y122.743 E-.13516
G1 X198.862 Y122.613 E-.13546
G1 X199.208 Y122.515 E-.13655
G1 X199.564 Y122.454 E-.13742
G1 X199.903 Y122.428 E-.12895
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X199.886 Y130.061 Z.6 F30000
G1 X199.741 Y198.816 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X199.945 Y198.8 E.00741
G3 X199.681 Y198.823 I.058 J2.199 E.4894
M204 S6000
G1 X199.199 Y198.467 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X199.41 Y198.409 E.0079
G3 X199.677 Y198.362 I.594 J2.59 E.00978
G1 X199.934 Y198.343 E.0093
G3 X199.142 Y198.485 I.07 J2.656 E.57358
M204 S6000
G1 X198.637 Y198.202 F30000
G1 F3000
M204 S500
G1 X198.719 Y198.162 E.00331
G3 X199.62 Y197.908 I1.285 J2.837 E.03394
G1 X199.922 Y197.885 E.01093
G3 X198.443 Y198.304 I.082 J3.113 E.65044
G1 X198.584 Y198.23 E.00573
M204 S6000
G1 X198.073 Y197.996 F30000
G1 F3000
M204 S500
G1 X198.214 Y197.907 E.00603
G3 X199.564 Y197.454 I1.79 J3.091 E.05176
G1 X199.911 Y197.428 E.01255
G3 X197.916 Y198.101 I.094 J3.571 E.73314
G1 X198.023 Y198.029 E.00466
; WIPE_START
G1 X198.214 Y197.907 E-.08627
G1 X198.53 Y197.743 E-.13522
G1 X198.862 Y197.613 E-.13557
G1 X199.208 Y197.515 E-.13654
G1 X199.564 Y197.454 E-.13738
G1 X199.903 Y197.428 E-.12903
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X192.272 Y197.575 Z.6 F30000
G1 X127.74 Y198.816 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X127.945 Y198.8 E.00743
G3 X127.681 Y198.823 I.058 J2.199 E.48939
M204 S6000
G1 X127.2 Y198.467 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X127.41 Y198.409 E.00788
G3 X127.677 Y198.362 I.594 J2.59 E.00979
G1 X127.934 Y198.343 E.0093
G3 X127.142 Y198.485 I.07 J2.656 E.57362
M204 S6000
G1 X126.637 Y198.202 F30000
G1 F3000
M204 S500
G1 X126.719 Y198.162 E.00331
G3 X127.621 Y197.908 I1.285 J2.837 E.03394
G1 X127.922 Y197.885 E.01092
G3 X126.443 Y198.304 I.082 J3.113 E.65047
G1 X126.584 Y198.23 E.00574
M204 S6000
G1 X126.073 Y197.996 F30000
G1 F3000
M204 S500
G1 X126.214 Y197.908 E.00602
G3 X127.565 Y197.454 I1.791 J3.09 E.05178
G1 X127.911 Y197.428 E.01254
G3 X125.916 Y198.101 I.094 J3.571 E.73312
G1 X126.023 Y198.029 E.00465
; WIPE_START
G1 X126.214 Y197.908 E-.08614
G1 X126.53 Y197.743 E-.13541
G1 X126.862 Y197.613 E-.13542
G1 X127.207 Y197.515 E-.13636
G1 X127.565 Y197.454 E-.13775
G1 X127.903 Y197.428 E-.12892
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X131.434 Y190.662 Z.6 F30000
G1 X208.046 Y43.879 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50068
G1 F6300
M204 S500
G1 X207.326 Y43.16 E.03681
G1 X206.679 Y43.16 E.02341
G1 X207.84 Y44.321 E.05939
G1 X207.84 Y44.969 E.02341
G1 X206.032 Y43.16 E.0925
G1 X205.384 Y43.16 E.02341
G1 X207.84 Y45.616 E.1256
G1 X207.84 Y46.263 E.02341
G1 X204.737 Y43.16 E.15871
G1 X204.089 Y43.16 E.02341
G1 X207.84 Y46.911 E.19181
G1 X207.84 Y47.558 E.02341
G1 X203.442 Y43.16 E.22492
G1 X202.795 Y43.16 E.02341
G1 X207.84 Y48.205 E.25802
G1 X207.84 Y48.853 E.02341
G1 X202.147 Y43.16 E.29113
G1 X201.5 Y43.16 E.02341
G1 X207.84 Y49.5 E.32423
G1 X207.84 Y50.147 E.02341
G1 X200.853 Y43.16 E.35734
G1 X200.205 Y43.16 E.02341
G1 X207.84 Y50.795 E.39044
G1 X207.84 Y51.442 E.02341
G1 X199.558 Y43.16 E.42355
G1 X198.91 Y43.16 E.02341
G1 X207.84 Y52.09 E.45665
G1 X207.84 Y52.737 E.02341
G1 X198.263 Y43.16 E.48976
G1 X197.616 Y43.16 E.02341
G1 X207.84 Y53.384 E.52286
G1 X207.84 Y54.032 E.02341
G1 X203.836 Y50.028 E.20476
G3 X203.952 Y50.791 I-3.842 J.973 E.02796
G1 X207.84 Y54.679 E.19884
G1 X207.84 Y55.326 E.02341
G1 X203.938 Y51.424 E.19954
G3 X203.837 Y51.97 I-2.776 J-.234 E.02011
G1 X207.84 Y55.974 E.20473
G1 X207.84 Y56.621 E.02341
G1 X203.68 Y52.461 E.21276
G3 X203.475 Y52.903 I-6.601 J-2.788 E.01764
G1 X207.84 Y57.269 E.22324
G1 X207.84 Y57.916 E.02341
G1 X203.223 Y53.299 E.2361
G3 X202.934 Y53.657 I-1.932 J-1.269 E.01667
G1 X207.84 Y58.563 E.25092
G1 X207.84 Y59.211 E.02341
G1 X202.607 Y53.977 E.26762
G3 X202.243 Y54.261 I-1.6 J-1.676 E.01671
G1 X207.84 Y59.858 E.28621
G1 X207.84 Y60.505 E.02341
G1 X201.841 Y54.507 E.30677
G3 X201.394 Y54.706 I-2.808 J-5.682 E.01772
G1 X207.84 Y61.153 E.32965
G1 X207.84 Y61.8 E.02341
G1 X200.895 Y54.855 E.35516
G3 X200.339 Y54.946 I-.733 J-2.735 E.02042
G1 X207.84 Y62.448 E.38361
G1 X207.84 Y63.095 E.02341
G1 X199.691 Y54.945 E.41675
G3 X198.9 Y54.801 I.312 J-3.961 E.02913
G1 X208.046 Y63.948 E.46773
; WIPE_START
G1 X206.632 Y62.534 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X203.196 Y55.718 Z.6 F30000
G1 X196.763 Y42.954 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X200.971 Y47.162 E.21521
G2 X200.208 Y47.046 I-1.022 J4.16 E.02795
G1 X196.321 Y43.16 E.19876
G1 X195.674 Y43.16 E.02341
G1 X199.577 Y47.063 E.19961
G2 X199.029 Y47.162 I.608 J4.936 E.02016
G1 X195.026 Y43.16 E.20468
G1 X194.379 Y43.16 E.02341
G1 X198.541 Y47.321 E.21282
G2 X198.099 Y47.527 I.806 J2.305 E.01764
G1 X193.731 Y43.16 E.22335
G1 X193.084 Y43.16 E.02341
G1 X197.699 Y47.775 E.23601
G2 X197.342 Y48.065 I5.147 J6.716 E.01664
G1 X192.437 Y43.16 E.25083
G1 X191.789 Y43.16 E.02341
G1 X197.022 Y48.392 E.26758
G2 X196.739 Y48.757 I1.682 J1.595 E.01671
G1 X191.142 Y43.16 E.28624
G1 X190.495 Y43.16 E.02341
G1 X196.495 Y49.161 E.30687
G2 X196.293 Y49.606 I2.121 J1.233 E.01771
G1 X189.847 Y43.16 E.32963
G1 X189.2 Y43.16 E.02341
G1 X196.144 Y50.104 E.35509
G2 X196.056 Y50.664 I2.754 J.716 E.02053
G1 X188.553 Y43.16 E.38373
G1 X187.905 Y43.16 E.02341
G1 X196.054 Y51.308 E.41669
G2 X196.198 Y52.1 I4.097 J-.337 E.02914
G1 X187.258 Y43.16 E.45717
G1 X186.61 Y43.16 E.02341
G1 X207.84 Y64.39 E1.08565
G1 X207.84 Y65.037 E.02341
G1 X185.963 Y43.16 E1.11875
G1 X185.316 Y43.16 E.02341
G1 X207.84 Y65.684 E1.15186
G1 X207.84 Y66.332 E.02341
G1 X184.668 Y43.16 E1.18496
G1 X184.021 Y43.16 E.02341
G1 X207.84 Y66.979 E1.21807
G1 X207.84 Y67.626 E.02341
G1 X183.374 Y43.16 E1.25117
G1 X182.726 Y43.16 E.02341
G1 X207.84 Y68.274 E1.28428
G1 X207.84 Y68.921 E.02341
G1 X182.079 Y43.16 E1.31738
G1 X181.431 Y43.16 E.02341
G1 X207.84 Y69.569 E1.35049
G1 X207.84 Y70.216 E.02341
G1 X180.784 Y43.16 E1.38359
G1 X180.137 Y43.16 E.02341
G1 X207.84 Y70.863 E1.4167
G1 X207.84 Y71.511 E.02341
G1 X179.489 Y43.16 E1.4498
G1 X178.842 Y43.16 E.02341
G1 X207.84 Y72.158 E1.48291
G1 X207.84 Y72.805 E.02341
G1 X178.195 Y43.16 E1.51601
G1 X177.547 Y43.16 E.02341
G1 X207.84 Y73.453 E1.54912
G1 X207.84 Y74.1 E.02341
G1 X176.9 Y43.16 E1.58222
G1 X176.252 Y43.16 E.02341
G1 X207.84 Y74.748 E1.61533
G1 X207.84 Y75.395 E.02341
G1 X192.16 Y59.714 E.80187
G1 X192.16 Y60.362 E.02341
G1 X207.84 Y76.042 E.80187
G1 X207.84 Y76.69 E.02341
G1 X192.16 Y61.009 E.80187
G1 X192.16 Y61.656 E.02341
G1 X207.84 Y77.337 E.80187
G1 X207.84 Y77.984 E.02341
G1 X192.16 Y62.304 E.80187
G1 X192.16 Y62.951 E.02341
G1 X207.84 Y78.632 E.80187
G1 X207.84 Y79.279 E.02341
G1 X192.16 Y63.599 E.80187
G1 X192.16 Y64.246 E.02341
G1 X207.84 Y79.927 E.80187
M73 P17 R57
G1 X207.84 Y80.574 E.02341
G1 X192.16 Y64.893 E.80187
G1 X192.16 Y65.541 E.02341
M73 P17 R56
G1 X207.84 Y81.221 E.80187
G1 X207.84 Y81.869 E.02341
G1 X192.16 Y66.188 E.80187
G1 X192.16 Y66.835 E.02341
G1 X207.84 Y82.516 E.80187
G1 X207.84 Y83.163 E.02341
G1 X192.16 Y67.483 E.80187
G1 X192.16 Y68.13 E.02341
G1 X207.84 Y83.811 E.80187
G1 X207.84 Y84.458 E.02341
G1 X192.16 Y68.778 E.80187
G1 X192.16 Y69.425 E.02341
G1 X207.84 Y85.105 E.80187
G1 X207.84 Y85.753 E.02341
G1 X192.16 Y70.072 E.80187
G1 X192.16 Y70.72 E.02341
G1 X207.84 Y86.4 E.80187
G1 X207.84 Y87.048 E.02341
G1 X192.16 Y71.367 E.80187
G1 X192.16 Y72.014 E.02341
G1 X207.84 Y87.695 E.80187
G1 X207.84 Y88.342 E.02341
G1 X192.16 Y72.662 E.80187
G1 X192.16 Y73.309 E.02341
G1 X207.84 Y88.99 E.80187
G1 X207.84 Y89.637 E.02341
G1 X192.16 Y73.956 E.80187
G1 X192.16 Y74.604 E.02341
G1 X207.84 Y90.284 E.80187
G1 X207.84 Y90.932 E.02341
G1 X192.16 Y75.251 E.80187
G1 X192.16 Y75.899 E.02341
G1 X207.84 Y91.579 E.80187
G1 X207.84 Y92.227 E.02341
G1 X192.16 Y76.546 E.80187
G1 X192.16 Y77.193 E.02341
G1 X207.84 Y92.874 E.80187
G1 X207.84 Y93.521 E.02341
G1 X192.16 Y77.841 E.80187
G1 X192.16 Y78.488 E.02341
G1 X207.84 Y94.169 E.80187
G1 X207.84 Y94.816 E.02341
G1 X192.16 Y79.135 E.80187
G1 X192.16 Y79.783 E.02341
G1 X207.84 Y95.463 E.80187
G1 X207.84 Y96.111 E.02341
G1 X192.16 Y80.43 E.80187
G1 X192.16 Y81.078 E.02341
G1 X207.84 Y96.758 E.80187
G1 X207.84 Y97.406 E.02341
G1 X192.16 Y81.725 E.80187
G1 X192.16 Y82.372 E.02341
G1 X207.84 Y98.053 E.80187
G1 X207.84 Y98.7 E.02341
G1 X192.16 Y83.02 E.80187
G1 X192.16 Y83.667 E.02341
G1 X207.84 Y99.348 E.80187
G1 X207.84 Y99.995 E.02341
G1 X192.16 Y84.314 E.80187
G1 X192.16 Y84.962 E.02341
G1 X207.84 Y100.642 E.80187
G1 X207.84 Y101.29 E.02341
G1 X192.16 Y85.609 E.80187
G1 X192.16 Y86.257 E.02341
G1 X207.84 Y101.937 E.80187
G1 X207.84 Y102.584 E.02341
G1 X192.16 Y86.904 E.80187
G1 X192.16 Y87.551 E.02341
G1 X207.84 Y103.232 E.80187
G1 X207.84 Y103.879 E.02341
G1 X192.16 Y88.199 E.80187
G1 X192.16 Y88.846 E.02341
G1 X207.84 Y104.527 E.80187
G1 X207.84 Y105.174 E.02341
G1 X192.16 Y89.493 E.80187
G1 X192.16 Y90.141 E.02341
G1 X207.84 Y105.821 E.80187
G1 X207.84 Y106.469 E.02341
G1 X192.16 Y90.788 E.80187
G1 X192.16 Y91.435 E.02341
G1 X207.84 Y107.116 E.80187
G1 X207.84 Y107.763 E.02341
G1 X192.16 Y92.083 E.80187
G1 X192.16 Y92.73 E.02341
G1 X207.84 Y108.411 E.80187
G1 X207.84 Y109.058 E.02341
G1 X192.16 Y93.378 E.80187
G1 X192.16 Y94.025 E.02341
G1 X207.84 Y109.706 E.80187
G1 X207.84 Y110.353 E.02341
G1 X192.16 Y94.672 E.80187
G1 X192.16 Y95.32 E.02341
G1 X207.84 Y111 E.80187
G1 X207.84 Y111.648 E.02341
G1 X192.16 Y95.967 E.80187
G1 X192.16 Y96.614 E.02341
G1 X207.84 Y112.295 E.80187
G1 X207.84 Y112.942 E.02341
G1 X192.16 Y97.262 E.80187
G1 X192.16 Y97.909 E.02341
G1 X207.84 Y113.59 E.80187
G1 X207.84 Y114.237 E.02341
G1 X192.16 Y98.557 E.80187
G1 X192.16 Y99.204 E.02341
G1 X207.84 Y114.885 E.80187
G1 X207.84 Y115.532 E.02341
G1 X192.16 Y99.851 E.80187
G1 X192.16 Y100.499 E.02341
G1 X207.84 Y116.179 E.80187
G1 X207.84 Y116.827 E.02341
G1 X192.16 Y101.146 E.80187
G1 X192.16 Y101.793 E.02341
G1 X207.84 Y117.474 E.80187
G1 X207.84 Y118.121 E.02341
G1 X192.16 Y102.441 E.80187
G1 X192.16 Y103.088 E.02341
G1 X207.84 Y118.769 E.80187
G1 X207.84 Y119.416 E.02341
G1 X192.16 Y103.736 E.80187
G1 X192.16 Y104.383 E.02341
G1 X207.84 Y120.063 E.80187
G1 X207.84 Y120.711 E.02341
G1 X192.16 Y105.03 E.80187
G1 X192.16 Y105.678 E.02341
G1 X207.84 Y121.358 E.80187
G1 X207.84 Y122.006 E.02341
G1 X192.16 Y106.325 E.80187
G1 X192.16 Y106.972 E.02341
G1 X207.84 Y122.653 E.80187
G1 X207.84 Y123.3 E.02341
G1 X192.16 Y107.62 E.80187
G1 X192.16 Y108.267 E.02341
G1 X207.84 Y123.948 E.80187
G1 X207.84 Y124.595 E.02341
G1 X192.16 Y108.914 E.80187
G1 X192.16 Y109.562 E.02341
G1 X207.84 Y125.242 E.80187
G1 X207.84 Y125.89 E.02341
G1 X192.16 Y110.209 E.80187
G1 X192.16 Y110.857 E.02341
G1 X207.84 Y126.537 E.80187
G1 X207.84 Y127.185 E.02341
G1 X192.16 Y111.504 E.80187
G1 X192.16 Y112.151 E.02341
G1 X207.84 Y127.832 E.80187
G1 X207.84 Y128.479 E.02341
G1 X192.16 Y112.799 E.80187
G1 X192.16 Y113.446 E.02341
G1 X200.848 Y122.134 E.44429
G2 X200.11 Y122.044 I-.849 J3.883 E.02691
G1 X192.16 Y114.093 E.40657
G1 X192.16 Y114.741 E.02341
G1 X199.491 Y122.072 E.3749
G2 X198.955 Y122.183 I.269 J2.653 E.01984
G1 X192.16 Y115.388 E.34747
G1 X192.16 Y116.036 E.02341
G1 X198.472 Y122.348 E.32281
G2 X198.036 Y122.559 I.84 J2.289 E.01755
G1 X192.16 Y116.683 E.30051
G1 X192.16 Y117.33 E.02341
G1 X197.645 Y122.816 E.28052
G2 X197.294 Y123.112 I1.3 J1.905 E.01664
G1 X192.16 Y117.978 E.26253
G1 X192.16 Y118.625 E.02341
G1 X196.979 Y123.444 E.24643
G2 X196.701 Y123.814 I1.711 J1.575 E.01675
G1 X192.16 Y119.272 E.23223
G1 X192.16 Y119.92 E.02341
G1 X196.462 Y124.222 E.22001
G2 X196.267 Y124.675 I5.75 J2.74 E.01782
G1 X192.16 Y120.567 E.21005
G1 X192.16 Y121.215 E.02341
G1 X196.128 Y125.183 E.20291
G2 X196.048 Y125.75 I2.792 J.683 E.02076
G1 X192.16 Y121.862 E.19883
G1 X192.16 Y122.509 E.02341
G1 X196.305 Y126.654 E.21196
; WIPE_START
G1 X194.89 Y125.24 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X202.516 Y124.912 Z.6 F30000
G1 X203.58 Y124.866 Z.6
M73 P18 R56
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X207.84 Y129.127 E.21787
G1 X207.84 Y129.774 E.02341
G1 X203.957 Y125.891 E.19858
G3 X203.926 Y126.507 I-4.288 J.092 E.02233
G1 X207.84 Y130.421 E.20018
G1 X207.84 Y131.069 E.02341
G1 X203.817 Y127.046 E.20572
G3 X203.654 Y127.53 I-2.502 J-.572 E.01851
G1 X207.84 Y131.716 E.21405
G1 X207.84 Y132.364 E.02341
G1 X203.439 Y127.962 E.22508
G3 X203.182 Y128.353 I-2.081 J-1.087 E.01693
G1 X207.84 Y133.011 E.2382
G1 X207.84 Y133.658 E.02341
G1 X202.888 Y128.706 E.25325
G3 X202.557 Y129.022 I-1.746 J-1.499 E.01658
G1 X207.84 Y134.306 E.27019
G1 X207.84 Y134.953 E.02341
G1 X202.188 Y129.301 E.28903
G3 X201.779 Y129.539 I-3.827 J-6.108 E.01712
G1 X207.84 Y135.6 E.30997
G1 X207.84 Y136.248 E.02341
G1 X201.323 Y129.73 E.33328
G3 X200.818 Y129.873 I-.962 J-2.45 E.01901
G1 X207.84 Y136.895 E.35911
G1 X207.84 Y137.542 E.02341
G1 X200.25 Y129.952 E.38813
G3 X199.588 Y129.938 I-.257 J-3.31 E.02399
G1 X207.84 Y138.19 E.422
G1 X207.84 Y138.837 E.02341
G1 X198.767 Y129.764 E.46397
G3 X196.24 Y127.237 I1.249 J-3.776 E.13404
G1 X192.16 Y123.157 E.20866
G1 X192.16 Y123.804 E.02341
G1 X207.84 Y139.485 E.80187
G1 X207.84 Y140.132 E.02341
G1 X192.16 Y124.451 E.80187
G1 X192.16 Y125.099 E.02341
G1 X207.84 Y140.779 E.80187
G1 X207.84 Y141.427 E.02341
G1 X192.16 Y125.746 E.80187
G1 X192.16 Y126.394 E.02341
G1 X207.84 Y142.074 E.80187
G1 X207.84 Y142.721 E.02341
G1 X192.16 Y127.041 E.80187
G1 X192.16 Y127.688 E.02341
G1 X207.84 Y143.369 E.80187
G1 X207.84 Y144.016 E.02341
G1 X192.16 Y128.336 E.80187
G1 X192.16 Y128.983 E.02341
G1 X207.84 Y144.664 E.80187
G1 X207.84 Y145.311 E.02341
G1 X192.16 Y129.63 E.80187
G1 X192.16 Y130.278 E.02341
G1 X207.84 Y145.958 E.80187
G1 X207.84 Y146.606 E.02341
G1 X192.16 Y130.925 E.80187
G1 X192.16 Y131.572 E.02341
G1 X207.84 Y147.253 E.80187
G1 X207.84 Y147.9 E.02341
G1 X192.16 Y132.22 E.80187
G1 X192.16 Y132.867 E.02341
G1 X207.84 Y148.548 E.80187
G1 X207.84 Y149.195 E.02341
G1 X192.16 Y133.515 E.80187
G1 X192.16 Y134.162 E.02341
G1 X207.84 Y149.843 E.80187
G1 X207.84 Y150.49 E.02341
G1 X192.16 Y134.809 E.80187
G1 X192.16 Y135.457 E.02341
G1 X207.84 Y151.137 E.80187
G1 X207.84 Y151.785 E.02341
G1 X192.16 Y136.104 E.80187
G1 X192.16 Y136.751 E.02341
G1 X207.84 Y152.432 E.80187
G1 X207.84 Y153.079 E.02341
G1 X192.16 Y137.399 E.80187
G1 X192.16 Y138.046 E.02341
G1 X207.84 Y153.727 E.80187
G1 X207.84 Y154.374 E.02341
G1 X192.16 Y138.694 E.80187
G1 X192.16 Y139.341 E.02341
G1 X207.84 Y155.021 E.80187
G1 X207.84 Y155.669 E.02341
G1 X192.16 Y139.988 E.80187
G1 X192.16 Y140.636 E.02341
G1 X207.84 Y156.316 E.80187
G1 X207.84 Y156.964 E.02341
G1 X192.16 Y141.283 E.80187
G1 X192.16 Y141.93 E.02341
G1 X207.84 Y157.611 E.80187
G1 X207.84 Y158.258 E.02341
G1 X192.16 Y142.578 E.80187
G1 X192.16 Y143.225 E.02341
G1 X207.84 Y158.906 E.80187
G1 X207.84 Y159.553 E.02341
G1 X192.16 Y143.873 E.80187
G1 X192.16 Y144.52 E.02341
G1 X207.84 Y160.2 E.80187
G1 X207.84 Y160.848 E.02341
G1 X192.16 Y145.167 E.80187
G1 X192.16 Y145.815 E.02341
G1 X207.84 Y161.495 E.80187
G1 X207.84 Y162.143 E.02341
G1 X192.16 Y146.462 E.80187
G1 X192.16 Y147.109 E.02341
G1 X207.84 Y162.79 E.80187
G1 X207.84 Y163.437 E.02341
G1 X192.16 Y147.757 E.80187
G1 X192.16 Y148.404 E.02341
G1 X207.84 Y164.085 E.80187
G1 X207.84 Y164.732 E.02341
G1 X192.16 Y149.051 E.80187
G1 X192.16 Y149.699 E.02341
G1 X207.84 Y165.379 E.80187
G1 X207.84 Y166.027 E.02341
G1 X192.16 Y150.346 E.80187
G1 X192.16 Y150.994 E.02341
G1 X207.84 Y166.674 E.80187
G1 X207.84 Y167.322 E.02341
G1 X192.16 Y151.641 E.80187
M73 P18 R55
G1 X192.16 Y152.288 E.02341
G1 X207.84 Y167.969 E.80187
G1 X207.84 Y168.616 E.02341
G1 X192.16 Y152.936 E.80187
G1 X192.16 Y153.583 E.02341
G1 X207.84 Y169.264 E.80187
G1 X207.84 Y169.911 E.02341
G1 X192.16 Y154.23 E.80187
G1 X192.16 Y154.878 E.02341
G1 X207.84 Y170.558 E.80187
G1 X207.84 Y171.206 E.02341
G1 X192.16 Y155.525 E.80187
G1 X192.16 Y156.173 E.02341
G1 X207.84 Y171.853 E.80187
G1 X207.84 Y172.5 E.02341
G1 X192.16 Y156.82 E.80187
G1 X192.16 Y157.467 E.02341
G1 X207.84 Y173.148 E.80187
G1 X207.84 Y173.795 E.02341
G1 X192.16 Y158.115 E.80187
G1 X192.16 Y158.762 E.02341
G1 X207.84 Y174.443 E.80187
G1 X207.84 Y175.09 E.02341
G1 X192.16 Y159.409 E.80187
G1 X192.16 Y160.057 E.02341
G1 X207.84 Y175.737 E.80187
G1 X207.84 Y176.385 E.02341
G1 X192.16 Y160.704 E.80187
G1 X192.16 Y161.352 E.02341
G1 X207.84 Y177.032 E.80187
G1 X207.84 Y177.679 E.02341
G1 X192.16 Y161.999 E.80187
G1 X192.16 Y162.646 E.02341
G1 X207.84 Y178.327 E.80187
G1 X207.84 Y178.974 E.02341
G1 X192.16 Y163.294 E.80187
G1 X192.16 Y163.941 E.02341
G1 X207.84 Y179.622 E.80187
G1 X207.84 Y180.269 E.02341
G1 X192.16 Y164.588 E.80187
G1 X192.16 Y165.236 E.02341
G1 X207.84 Y180.916 E.80187
G1 X207.84 Y181.564 E.02341
G1 X192.16 Y165.883 E.80187
G1 X192.16 Y166.53 E.02341
G1 X207.84 Y182.211 E.80187
G1 X207.84 Y182.858 E.02341
G1 X192.16 Y167.178 E.80187
G1 X192.16 Y167.825 E.02341
G1 X207.84 Y183.506 E.80187
G1 X207.84 Y184.153 E.02341
G1 X192.16 Y168.473 E.80187
G1 X192.16 Y169.12 E.02341
G1 X207.84 Y184.801 E.80187
G1 X207.84 Y185.448 E.02341
G1 X192.16 Y169.767 E.80187
G1 X192.16 Y170.415 E.02341
G1 X207.84 Y186.095 E.80187
G1 X207.84 Y186.743 E.02341
G1 X192.16 Y171.062 E.80187
G1 X192.16 Y171.709 E.02341
G1 X207.84 Y187.39 E.80187
G1 X207.84 Y188.037 E.02341
G1 X192.16 Y172.357 E.80187
G1 X192.16 Y173.004 E.02341
G1 X207.84 Y188.685 E.80187
G1 X207.84 Y189.332 E.02341
G1 X192.16 Y173.652 E.80187
G1 X192.16 Y174.299 E.02341
G1 X207.84 Y189.979 E.80187
G1 X207.84 Y190.627 E.02341
G1 X192.16 Y174.946 E.80187
G1 X192.16 Y175.594 E.02341
G1 X207.84 Y191.274 E.80187
G1 X207.84 Y191.922 E.02341
G1 X192.16 Y176.241 E.80187
G1 X192.16 Y176.888 E.02341
G1 X207.84 Y192.569 E.80187
G1 X207.84 Y193.216 E.02341
G1 X192.16 Y177.536 E.80187
G1 X192.16 Y178.183 E.02341
G1 X207.84 Y193.864 E.80187
G1 X207.84 Y194.511 E.02341
G1 X192.16 Y178.831 E.80187
G1 X192.16 Y179.478 E.02341
G1 X207.84 Y195.158 E.80187
G1 X207.84 Y195.806 E.02341
G1 X192.16 Y180.125 E.80187
G1 X192.16 Y180.773 E.02341
G1 X207.84 Y196.453 E.80187
G1 X207.84 Y197.101 E.02341
G1 X192.16 Y181.42 E.80187
G1 X192.16 Y182.067 E.02341
G1 X207.84 Y197.748 E.80187
G1 X207.84 Y198.395 E.02341
G1 X192.16 Y182.715 E.80187
G1 X192.16 Y183.362 E.02341
G1 X207.84 Y199.043 E.80187
G1 X207.84 Y199.69 E.02341
G1 X192.16 Y184.009 E.80187
G1 X192.16 Y184.657 E.02341
G1 X207.84 Y200.337 E.80187
M73 P19 R55
G1 X207.84 Y200.985 E.02341
G1 X192.16 Y185.304 E.80187
G1 X192.16 Y185.952 E.02341
G1 X207.84 Y201.632 E.80187
G1 X207.84 Y202.28 E.02341
G1 X192.16 Y186.599 E.80187
G1 X192.16 Y187.246 E.02341
G1 X207.84 Y202.927 E.80187
G1 X207.84 Y203.574 E.02341
G1 X203.581 Y199.315 E.21781
G2 X201.684 Y197.418 I-3.523 J1.627 E.09904
G1 X192.16 Y187.894 E.48706
G1 X192.16 Y188.541 E.02341
G1 X200.725 Y197.106 E.438
G2 X200.013 Y197.042 I-.788 J4.729 E.02587
G1 X192.16 Y189.188 E.40159
G1 X192.16 Y189.836 E.02341
G1 X199.41 Y197.086 E.37076
G2 X198.88 Y197.204 I.305 J2.623 E.01965
G1 X192.16 Y190.483 E.34368
G1 X192.16 Y191.131 E.02341
G1 X198.404 Y197.375 E.31933
G2 X197.977 Y197.595 I2.884 J6.111 E.01738
G1 X192.16 Y191.778 E.29749
G1 X192.16 Y192.425 E.02341
G1 X197.593 Y197.858 E.27782
G2 X197.246 Y198.158 I1.324 J1.881 E.01662
G1 X192.16 Y193.073 E.26008
G1 X192.16 Y193.16 E.00315
G1 X191.599 Y193.16 E.02026
G1 X196.935 Y198.496 E.27286
G2 X196.662 Y198.87 I1.733 J1.549 E.01678
G1 X190.952 Y193.16 E.29201
G1 X190.305 Y193.16 E.02341
G1 X196.429 Y199.284 E.31317
G2 X196.245 Y199.747 I2.226 J1.151 E.01806
G1 X189.657 Y193.16 E.33688
G1 X189.01 Y193.16 E.02341
G1 X196.112 Y200.262 E.36317
G2 X196.043 Y200.84 I4.868 J.876 E.02107
G1 X188.363 Y193.16 E.39274
G1 X187.715 Y193.16 E.02341
G1 X196.329 Y201.773 E.44047
; WIPE_START
G1 X194.914 Y200.359 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X202.54 Y200.042 Z.6 F30000
G1 X203.616 Y199.998 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X207.84 Y204.222 E.216
G1 X207.84 Y204.869 E.02341
G1 X203.962 Y200.991 E.19833
G3 X203.913 Y201.589 I-5.537 J-.148 E.02173
G1 X207.84 Y205.516 E.20082
G1 X207.84 Y206.164 E.02341
G1 X203.798 Y202.122 E.20671
G3 X203.624 Y202.595 I-5.554 J-1.771 E.01825
G1 X207.84 Y206.811 E.2156
G1 X207.84 Y207.458 E.02341
G1 X203.403 Y203.021 E.22692
G3 X203.141 Y203.407 I-2.061 J-1.114 E.01688
G1 X207.84 Y208.106 E.24029
G1 X207.84 Y208.753 E.02341
G1 X202.842 Y203.755 E.25559
G3 X202.506 Y204.066 I-1.723 J-1.523 E.01659
G1 X207.28 Y208.84 E.24412
G1 X206.633 Y208.84 E.02341
G1 X202.131 Y204.339 E.23018
G3 X201.714 Y204.569 I-1.352 J-1.967 E.01727
G1 X205.985 Y208.84 E.21845
G1 X205.338 Y208.84 E.02341
G1 X201.252 Y204.754 E.20895
G3 X200.74 Y204.89 I-.934 J-2.482 E.01917
G1 X204.691 Y208.84 E.20199
G1 X204.043 Y208.84 E.02341
G1 X200.158 Y204.955 E.1987
G3 X199.483 Y204.927 I-.134 J-4.998 E.02444
G1 X203.396 Y208.84 E.2001
G1 X202.748 Y208.84 E.02341
G1 X198.616 Y204.708 E.2113
G3 X196.286 Y202.378 I1.397 J-3.728 E.12286
G1 X187.068 Y193.16 E.47141
G1 X186.42 Y193.16 E.02341
G1 X202.101 Y208.84 E.80187
G1 X201.454 Y208.84 E.02341
G1 X185.773 Y193.16 E.80187
G1 X185.126 Y193.16 E.02341
G1 X200.806 Y208.84 E.80187
G1 X200.159 Y208.84 E.02341
G1 X184.478 Y193.16 E.80187
G1 X183.831 Y193.16 E.02341
G1 X199.512 Y208.84 E.80187
G1 X198.864 Y208.84 E.02341
G1 X183.184 Y193.16 E.80187
G1 X182.536 Y193.16 E.02341
G1 X198.217 Y208.84 E.80187
G1 X197.569 Y208.84 E.02341
G1 X181.889 Y193.16 E.80187
G1 X181.241 Y193.16 E.02341
G1 X196.922 Y208.84 E.80187
G1 X196.275 Y208.84 E.02341
G1 X180.594 Y193.16 E.80187
G1 X179.947 Y193.16 E.02341
G1 X195.627 Y208.84 E.80187
G1 X194.98 Y208.84 E.02341
G1 X179.299 Y193.16 E.80187
G1 X178.652 Y193.16 E.02341
G1 X194.333 Y208.84 E.80187
G1 X193.685 Y208.84 E.02341
G1 X178.005 Y193.16 E.80187
G1 X177.357 Y193.16 E.02341
G1 X193.038 Y208.84 E.80187
G1 X192.39 Y208.84 E.02341
G1 X176.71 Y193.16 E.80187
G1 X176.063 Y193.16 E.02341
G1 X191.743 Y208.84 E.80187
G1 X191.096 Y208.84 E.02341
G1 X175.415 Y193.16 E.80187
G1 X174.768 Y193.16 E.02341
G1 X190.448 Y208.84 E.80187
G1 X189.801 Y208.84 E.02341
G1 X174.12 Y193.16 E.80187
G1 X173.473 Y193.16 E.02341
G1 X189.154 Y208.84 E.80187
G1 X188.506 Y208.84 E.02341
G1 X172.826 Y193.16 E.80187
G1 X172.178 Y193.16 E.02341
G1 X187.859 Y208.84 E.80187
G1 X187.212 Y208.84 E.02341
G1 X171.531 Y193.16 E.80187
G1 X170.884 Y193.16 E.02341
G1 X186.564 Y208.84 E.80187
G1 X185.917 Y208.84 E.02341
G1 X170.236 Y193.16 E.80187
G1 X169.589 Y193.16 E.02341
G1 X185.269 Y208.84 E.80187
G1 X184.622 Y208.84 E.02341
G1 X168.941 Y193.16 E.80187
G1 X168.294 Y193.16 E.02341
G1 X183.975 Y208.84 E.80187
G1 X183.327 Y208.84 E.02341
G1 X167.647 Y193.16 E.80187
G1 X166.999 Y193.16 E.02341
G1 X182.68 Y208.84 E.80187
G1 X182.033 Y208.84 E.02341
G1 X166.352 Y193.16 E.80187
G1 X165.705 Y193.16 E.02341
G1 X181.385 Y208.84 E.80187
G1 X180.738 Y208.84 E.02341
G1 X165.057 Y193.16 E.80187
G1 X164.41 Y193.16 E.02341
G1 X180.09 Y208.84 E.80187
G1 X179.443 Y208.84 E.02341
G1 X163.762 Y193.16 E.80187
G1 X163.115 Y193.16 E.02341
G1 X178.796 Y208.84 E.80187
G1 X178.148 Y208.84 E.02341
G1 X162.468 Y193.16 E.80187
G1 X161.82 Y193.16 E.02341
G1 X177.501 Y208.84 E.80187
G1 X176.854 Y208.84 E.02341
G1 X161.173 Y193.16 E.80187
G1 X160.526 Y193.16 E.02341
G1 X176.206 Y208.84 E.80187
G1 X175.559 Y208.84 E.02341
G1 X159.878 Y193.16 E.80187
G1 X159.231 Y193.16 E.02341
G1 X174.911 Y208.84 E.80187
G1 X174.264 Y208.84 E.02341
G1 X158.584 Y193.16 E.80187
G1 X157.936 Y193.16 E.02341
G1 X173.617 Y208.84 E.80187
G1 X172.969 Y208.84 E.02341
G1 X157.289 Y193.16 E.80187
G1 X156.641 Y193.16 E.02341
G1 X172.322 Y208.84 E.80187
G1 X171.675 Y208.84 E.02341
G1 X155.994 Y193.16 E.80187
G1 X155.347 Y193.16 E.02341
G1 X171.027 Y208.84 E.80187
G1 X170.38 Y208.84 E.02341
G1 X154.699 Y193.16 E.80187
G1 X154.052 Y193.16 E.02341
G1 X169.733 Y208.84 E.80187
G1 X169.085 Y208.84 E.02341
G1 X153.405 Y193.16 E.80187
G1 X152.757 Y193.16 E.02341
G1 X168.438 Y208.84 E.80187
G1 X167.79 Y208.84 E.02341
G1 X152.11 Y193.16 E.80187
G1 X151.462 Y193.16 E.02341
G1 X167.143 Y208.84 E.80187
G1 X166.496 Y208.84 E.02341
G1 X150.815 Y193.16 E.80187
G1 X150.168 Y193.16 E.02341
G1 X165.848 Y208.84 E.80187
G1 X165.201 Y208.84 E.02341
G1 X149.52 Y193.16 E.80187
G1 X148.873 Y193.16 E.02341
G1 X164.554 Y208.84 E.80187
G1 X163.906 Y208.84 E.02341
G1 X148.226 Y193.16 E.80187
G1 X147.578 Y193.16 E.02341
G1 X163.259 Y208.84 E.80187
G1 X162.611 Y208.84 E.02341
G1 X146.931 Y193.16 E.80187
G1 X146.283 Y193.16 E.02341
G1 X161.964 Y208.84 E.80187
G1 X161.317 Y208.84 E.02341
G1 X145.636 Y193.16 E.80187
G1 X144.989 Y193.16 E.02341
G1 X160.669 Y208.84 E.80187
G1 X160.022 Y208.84 E.02341
G1 X144.341 Y193.16 E.80187
G1 X143.694 Y193.16 E.02341
G1 X159.375 Y208.84 E.80187
M73 P19 R54
G1 X158.727 Y208.84 E.02341
G1 X143.047 Y193.16 E.80187
G1 X142.399 Y193.16 E.02341
G1 X158.08 Y208.84 E.80187
G1 X157.432 Y208.84 E.02341
G1 X141.752 Y193.16 E.80187
G1 X141.105 Y193.16 E.02341
G1 X156.785 Y208.84 E.80187
G1 X156.138 Y208.84 E.02341
G1 X140.457 Y193.16 E.80187
G1 X139.81 Y193.16 E.02341
G1 X155.49 Y208.84 E.80187
M73 P20 R54
G1 X154.843 Y208.84 E.02341
G1 X139.162 Y193.16 E.80187
G1 X138.515 Y193.16 E.02341
G1 X154.196 Y208.84 E.80187
G1 X153.548 Y208.84 E.02341
G1 X137.868 Y193.16 E.80187
G1 X137.22 Y193.16 E.02341
G1 X152.901 Y208.84 E.80187
G1 X152.254 Y208.84 E.02341
G1 X136.573 Y193.16 E.80187
G1 X135.926 Y193.16 E.02341
G1 X151.606 Y208.84 E.80187
G1 X150.959 Y208.84 E.02341
G1 X135.278 Y193.16 E.80187
G1 X134.631 Y193.16 E.02341
G1 X150.311 Y208.84 E.80187
G1 X149.664 Y208.84 E.02341
G1 X133.983 Y193.16 E.80187
G1 X133.336 Y193.16 E.02341
G1 X149.017 Y208.84 E.80187
G1 X148.369 Y208.84 E.02341
G1 X132.689 Y193.16 E.80187
G1 X132.041 Y193.16 E.02341
G1 X147.722 Y208.84 E.80187
G1 X147.075 Y208.84 E.02341
G1 X131.394 Y193.16 E.80187
G1 X130.747 Y193.16 E.02341
G1 X146.427 Y208.84 E.80187
G1 X145.78 Y208.84 E.02341
G1 X130.099 Y193.16 E.80187
G1 X129.452 Y193.16 E.02341
G1 X145.132 Y208.84 E.80187
G1 X144.485 Y208.84 E.02341
G1 X128.804 Y193.16 E.80187
G1 X128.157 Y193.16 E.02341
G1 X143.838 Y208.84 E.80187
G1 X143.19 Y208.84 E.02341
G1 X127.51 Y193.16 E.80187
G1 X126.862 Y193.16 E.02341
G1 X142.543 Y208.84 E.80187
G1 X141.896 Y208.84 E.02341
G1 X126.215 Y193.16 E.80187
G1 X125.568 Y193.16 E.02341
G1 X141.248 Y208.84 E.80187
G1 X140.601 Y208.84 E.02341
G1 X131.853 Y200.092 E.44737
G3 X131.954 Y200.841 I-3.954 J.919 E.02738
G1 X139.953 Y208.84 E.40905
G1 X139.306 Y208.84 E.02341
G1 X131.932 Y201.466 E.3771
G3 X131.827 Y202.009 I-2.765 J-.254 E.02001
G1 X138.659 Y208.84 E.34936
G1 X138.011 Y208.84 E.02341
G1 X131.667 Y202.496 E.32443
G3 X131.457 Y202.933 I-5.992 J-2.615 E.01754
G1 X137.364 Y208.84 E.30209
G1 X136.717 Y208.84 E.02341
G1 X131.203 Y203.326 E.28197
G3 X130.911 Y203.682 I-1.92 J-1.281 E.01666
G1 X136.069 Y208.84 E.2638
G1 X135.422 Y208.84 E.02341
G1 X130.582 Y204 E.24752
G3 X130.215 Y204.281 I-1.588 J-1.687 E.01672
G1 X134.775 Y208.84 E.23314
G1 X134.127 Y208.84 E.02341
G1 X129.811 Y204.524 E.22072
G3 X129.358 Y204.719 I-3.065 J-6.515 E.01783
G1 X133.48 Y208.84 E.21077
G1 X132.832 Y208.84 E.02341
G1 X128.856 Y204.864 E.20334
G3 X128.296 Y204.951 I-1.223 J-5.997 E.0205
G1 X132.185 Y208.84 E.19887
G1 X131.538 Y208.84 E.02341
G1 X127.639 Y204.941 E.19937
G3 X126.833 Y204.783 I.391 J-4.11 E.02976
G1 X131.096 Y209.046 E.21801
; WIPE_START
G1 X129.682 Y207.632 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X129.328 Y200.008 Z.6 F30000
G1 X129.209 Y197.448 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X124.92 Y193.16 E.21931
G1 X124.273 Y193.16 E.02341
G1 X128.158 Y197.045 E.1987
G2 X127.532 Y197.067 I-.207 J3.13 E.02269
G1 X123.626 Y193.16 E.19978
G1 X122.978 Y193.16 E.02341
G1 X126.991 Y197.173 E.20521
G2 X126.506 Y197.335 I.568 J2.504 E.01853
G1 X122.331 Y193.16 E.21351
G1 X121.683 Y193.16 E.02341
G1 X126.067 Y197.544 E.22418
G2 X125.671 Y197.795 I3.891 J6.56 E.01696
G1 X121.036 Y193.16 E.23704
G1 X120.389 Y193.16 E.02341
G1 X125.317 Y198.088 E.25204
G2 X125 Y198.418 I1.493 J1.752 E.01658
G1 X119.741 Y193.16 E.26892
G1 X119.094 Y193.16 E.02341
G1 X124.72 Y198.786 E.2877
G2 X124.479 Y199.192 I1.91 J1.411 E.01711
G1 X118.447 Y193.16 E.30846
G1 X117.799 Y193.16 E.02341
G1 X124.279 Y199.639 E.33136
G2 X124.136 Y200.143 I6.004 J1.979 E.01896
G1 X117.152 Y193.16 E.35713
G1 X116.504 Y193.16 E.02341
G1 X124.052 Y200.707 E.38597
G2 X124.059 Y201.362 I4.191 J.283 E.02368
G1 X115.857 Y193.16 E.41942
G1 X115.21 Y193.16 E.02341
G1 X124.569 Y202.519 E.47859
; WIPE_START
G1 X123.154 Y201.104 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X128.317 Y206.726 Z.6 F30000
G1 X130.449 Y209.046 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X114.562 Y193.16 E.81238
G1 X113.915 Y193.16 E.02341
G1 X129.596 Y208.84 E.80187
G1 X128.948 Y208.84 E.02341
G1 X113.268 Y193.16 E.80187
G1 X112.62 Y193.16 E.02341
G1 X128.301 Y208.84 E.80187
G1 X127.653 Y208.84 E.02341
G1 X111.973 Y193.16 E.80187
G1 X111.326 Y193.16 E.02341
G1 X127.006 Y208.84 E.80187
G1 X126.359 Y208.84 E.02341
G1 X110.678 Y193.16 E.80187
G1 X110.031 Y193.16 E.02341
G1 X125.711 Y208.84 E.80187
G1 X125.064 Y208.84 E.02341
G1 X109.383 Y193.16 E.80187
G1 X108.736 Y193.16 E.02341
G1 X124.417 Y208.84 E.80187
G1 X123.769 Y208.84 E.02341
G1 X108.089 Y193.16 E.80187
G1 X107.441 Y193.16 E.02341
G1 X123.122 Y208.84 E.80187
G1 X122.474 Y208.84 E.02341
G1 X106.794 Y193.16 E.80187
G1 X106.147 Y193.16 E.02341
G1 X121.827 Y208.84 E.80187
G1 X121.18 Y208.84 E.02341
G1 X105.499 Y193.16 E.80187
G1 X104.852 Y193.16 E.02341
G1 X120.532 Y208.84 E.80187
G1 X119.885 Y208.84 E.02341
G1 X104.204 Y193.16 E.80187
G1 X103.557 Y193.16 E.02341
G1 X119.238 Y208.84 E.80187
G1 X118.59 Y208.84 E.02341
G1 X102.91 Y193.16 E.80187
G1 X102.262 Y193.16 E.02341
G1 X117.943 Y208.84 E.80187
G1 X117.296 Y208.84 E.02341
G1 X101.615 Y193.16 E.80187
G1 X100.968 Y193.16 E.02341
G1 X116.648 Y208.84 E.80187
G1 X116.001 Y208.84 E.02341
G1 X100.32 Y193.16 E.80187
G1 X99.673 Y193.16 E.02341
G1 X115.353 Y208.84 E.80187
G1 X114.706 Y208.84 E.02341
G1 X99.025 Y193.16 E.80187
G1 X98.378 Y193.16 E.02341
G1 X114.059 Y208.84 E.80187
G1 X113.411 Y208.84 E.02341
G1 X97.731 Y193.16 E.80187
G1 X97.083 Y193.16 E.02341
G1 X112.764 Y208.84 E.80187
G1 X112.117 Y208.84 E.02341
G1 X96.436 Y193.16 E.80187
G1 X95.789 Y193.16 E.02341
G1 X111.469 Y208.84 E.80187
G1 X110.822 Y208.84 E.02341
G1 X95.141 Y193.16 E.80187
G1 X94.494 Y193.16 E.02341
G1 X110.174 Y208.84 E.80187
G1 X109.527 Y208.84 E.02341
G1 X93.846 Y193.16 E.80187
G1 X93.199 Y193.16 E.02341
G1 X108.88 Y208.84 E.80187
G1 X108.232 Y208.84 E.02341
G1 X92.552 Y193.16 E.80187
G1 X91.904 Y193.16 E.02341
G1 X107.585 Y208.84 E.80187
G1 X106.938 Y208.84 E.02341
G1 X91.257 Y193.16 E.80187
G1 X90.61 Y193.16 E.02341
G1 X106.29 Y208.84 E.80187
G1 X105.643 Y208.84 E.02341
G1 X89.962 Y193.16 E.80187
G1 X89.315 Y193.16 E.02341
G1 X104.995 Y208.84 E.80187
G1 X104.348 Y208.84 E.02341
G1 X88.668 Y193.16 E.80187
G1 X88.02 Y193.16 E.02341
G1 X103.701 Y208.84 E.80187
G1 X103.053 Y208.84 E.02341
G1 X87.373 Y193.16 E.80187
G1 X86.725 Y193.16 E.02341
G1 X102.406 Y208.84 E.80187
G1 X101.759 Y208.84 E.02341
G1 X86.078 Y193.16 E.80187
G1 X85.431 Y193.16 E.02341
G1 X101.111 Y208.84 E.80187
G1 X100.464 Y208.84 E.02341
G1 X84.783 Y193.16 E.80187
G1 X84.136 Y193.16 E.02341
G1 X99.816 Y208.84 E.80187
G1 X99.169 Y208.84 E.02341
G1 X83.489 Y193.16 E.80187
G1 X82.841 Y193.16 E.02341
G1 X98.522 Y208.84 E.80187
G1 X97.874 Y208.84 E.02341
G1 X82.194 Y193.16 E.80187
G1 X81.546 Y193.16 E.02341
G1 X97.227 Y208.84 E.80187
G1 X96.58 Y208.84 E.02341
G1 X80.899 Y193.16 E.80187
G1 X80.252 Y193.16 E.02341
G1 X95.932 Y208.84 E.80187
G1 X95.285 Y208.84 E.02341
G1 X79.604 Y193.16 E.80187
G1 X78.957 Y193.16 E.02341
G1 X94.638 Y208.84 E.80187
M73 P21 R54
G1 X93.99 Y208.84 E.02341
G1 X78.31 Y193.16 E.80187
G1 X77.662 Y193.16 E.02341
G1 X93.343 Y208.84 E.80187
G1 X92.695 Y208.84 E.02341
G1 X77.015 Y193.16 E.80187
G1 X76.367 Y193.16 E.02341
G1 X92.048 Y208.84 E.80187
G1 X91.401 Y208.84 E.02341
G1 X75.72 Y193.16 E.80187
G1 X75.073 Y193.16 E.02341
G1 X90.753 Y208.84 E.80187
G1 X90.106 Y208.84 E.02341
G1 X74.425 Y193.16 E.80187
G1 X73.778 Y193.16 E.02341
G1 X89.459 Y208.84 E.80187
G1 X88.811 Y208.84 E.02341
G1 X73.131 Y193.16 E.80187
G1 X72.483 Y193.16 E.02341
G1 X88.164 Y208.84 E.80187
G1 X87.516 Y208.84 E.02341
G1 X71.836 Y193.16 E.80187
G1 X71.189 Y193.16 E.02341
G1 X86.869 Y208.84 E.80187
G1 X86.222 Y208.84 E.02341
G1 X70.541 Y193.16 E.80187
G1 X69.894 Y193.16 E.02341
G1 X85.574 Y208.84 E.80187
G1 X84.927 Y208.84 E.02341
G1 X69.246 Y193.16 E.80187
G1 X68.599 Y193.16 E.02341
G1 X84.28 Y208.84 E.80187
G1 X83.632 Y208.84 E.02341
G1 X67.952 Y193.16 E.80187
G1 X67.304 Y193.16 E.02341
G1 X82.985 Y208.84 E.80187
G1 X82.338 Y208.84 E.02341
G1 X66.657 Y193.16 E.80187
G1 X66.01 Y193.16 E.02341
G1 X81.69 Y208.84 E.80187
G1 X81.043 Y208.84 E.02341
G1 X65.362 Y193.16 E.80187
G1 X64.715 Y193.16 E.02341
G1 X80.601 Y209.046 E.81238
; WIPE_START
G1 X79.187 Y207.632 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X83.789 Y201.543 Z.6 F30000
G1 X191.491 Y59.046 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X175.605 Y43.16 E.81238
G1 X174.958 Y43.16 E.02341
G1 X190.638 Y58.84 E.80187
G1 X189.991 Y58.84 E.02341
G1 X174.31 Y43.16 E.80187
G1 X173.663 Y43.16 E.02341
G1 X189.344 Y58.84 E.80187
G1 X188.696 Y58.84 E.02341
G1 X173.016 Y43.16 E.80187
G1 X172.368 Y43.16 E.02341
G1 X188.049 Y58.84 E.80187
G1 X187.401 Y58.84 E.02341
G1 X171.721 Y43.16 E.80187
G1 X171.074 Y43.16 E.02341
G1 X186.754 Y58.84 E.80187
G1 X186.107 Y58.84 E.02341
G1 X170.426 Y43.16 E.80187
G1 X169.779 Y43.16 E.02341
G1 X185.459 Y58.84 E.80187
G1 X184.812 Y58.84 E.02341
G1 X169.131 Y43.16 E.80187
G1 X168.484 Y43.16 E.02341
G1 X184.165 Y58.84 E.80187
G1 X183.517 Y58.84 E.02341
G1 X167.837 Y43.16 E.80187
M73 P21 R53
G1 X167.189 Y43.16 E.02341
G1 X182.87 Y58.84 E.80187
G1 X182.222 Y58.84 E.02341
G1 X166.542 Y43.16 E.80187
G1 X165.895 Y43.16 E.02341
G1 X181.575 Y58.84 E.80187
G1 X180.928 Y58.84 E.02341
G1 X165.247 Y43.16 E.80187
G1 X164.6 Y43.16 E.02341
G1 X180.28 Y58.84 E.80187
G1 X179.633 Y58.84 E.02341
G1 X163.952 Y43.16 E.80187
G1 X163.305 Y43.16 E.02341
G1 X178.986 Y58.84 E.80187
G1 X178.338 Y58.84 E.02341
G1 X162.658 Y43.16 E.80187
G1 X162.01 Y43.16 E.02341
G1 X177.691 Y58.84 E.80187
G1 X177.044 Y58.84 E.02341
G1 X161.363 Y43.16 E.80187
G1 X160.716 Y43.16 E.02341
G1 X176.396 Y58.84 E.80187
G1 X175.749 Y58.84 E.02341
G1 X160.068 Y43.16 E.80187
G1 X159.421 Y43.16 E.02341
G1 X175.101 Y58.84 E.80187
G1 X174.454 Y58.84 E.02341
G1 X158.773 Y43.16 E.80187
G1 X158.126 Y43.16 E.02341
G1 X173.807 Y58.84 E.80187
G1 X173.159 Y58.84 E.02341
G1 X157.479 Y43.16 E.80187
G1 X156.831 Y43.16 E.02341
G1 X172.512 Y58.84 E.80187
G1 X171.865 Y58.84 E.02341
G1 X156.184 Y43.16 E.80187
G1 X155.537 Y43.16 E.02341
G1 X171.217 Y58.84 E.80187
G1 X170.57 Y58.84 E.02341
G1 X154.889 Y43.16 E.80187
G1 X154.242 Y43.16 E.02341
G1 X169.922 Y58.84 E.80187
G1 X169.275 Y58.84 E.02341
G1 X153.595 Y43.16 E.80187
G1 X152.947 Y43.16 E.02341
G1 X168.628 Y58.84 E.80187
G1 X167.98 Y58.84 E.02341
G1 X152.3 Y43.16 E.80187
G1 X151.652 Y43.16 E.02341
G1 X167.333 Y58.84 E.80187
G1 X166.686 Y58.84 E.02341
G1 X151.005 Y43.16 E.80187
G1 X150.358 Y43.16 E.02341
G1 X166.038 Y58.84 E.80187
G1 X165.391 Y58.84 E.02341
G1 X149.71 Y43.16 E.80187
G1 X149.063 Y43.16 E.02341
G1 X164.743 Y58.84 E.80187
G1 X164.096 Y58.84 E.02341
G1 X148.416 Y43.16 E.80187
G1 X147.768 Y43.16 E.02341
G1 X163.449 Y58.84 E.80187
G1 X162.801 Y58.84 E.02341
G1 X147.121 Y43.16 E.80187
G1 X146.473 Y43.16 E.02341
G1 X162.154 Y58.84 E.80187
G1 X161.507 Y58.84 E.02341
G1 X145.826 Y43.16 E.80187
G1 X145.179 Y43.16 E.02341
G1 X160.859 Y58.84 E.80187
G1 X160.212 Y58.84 E.02341
G1 X144.531 Y43.16 E.80187
G1 X143.884 Y43.16 E.02341
G1 X159.565 Y58.84 E.80187
G1 X158.917 Y58.84 E.02341
G1 X143.237 Y43.16 E.80187
G1 X142.589 Y43.16 E.02341
G1 X158.27 Y58.84 E.80187
G1 X157.622 Y58.84 E.02341
G1 X141.942 Y43.16 E.80187
G1 X141.294 Y43.16 E.02341
G1 X156.975 Y58.84 E.80187
G1 X156.328 Y58.84 E.02341
G1 X140.647 Y43.16 E.80187
G1 X140 Y43.16 E.02341
G1 X155.68 Y58.84 E.80187
G1 X155.033 Y58.84 E.02341
G1 X139.352 Y43.16 E.80187
G1 X138.705 Y43.16 E.02341
G1 X154.386 Y58.84 E.80187
G1 X153.738 Y58.84 E.02341
G1 X138.058 Y43.16 E.80187
G1 X137.41 Y43.16 E.02341
G1 X153.091 Y58.84 E.80187
G1 X152.443 Y58.84 E.02341
G1 X136.763 Y43.16 E.80187
G1 X136.116 Y43.16 E.02341
G1 X151.796 Y58.84 E.80187
G1 X151.149 Y58.84 E.02341
G1 X135.468 Y43.16 E.80187
G1 X134.821 Y43.16 E.02341
G1 X150.501 Y58.84 E.80187
G1 X149.854 Y58.84 E.02341
G1 X134.173 Y43.16 E.80187
G1 X133.526 Y43.16 E.02341
G1 X149.207 Y58.84 E.80187
G1 X148.559 Y58.84 E.02341
G1 X132.879 Y43.16 E.80187
G1 X132.231 Y43.16 E.02341
G1 X147.912 Y58.84 E.80187
G1 X147.264 Y58.84 E.02341
G1 X131.584 Y43.16 E.80187
G1 X130.937 Y43.16 E.02341
G1 X146.617 Y58.84 E.80187
G1 X145.97 Y58.84 E.02341
G1 X130.289 Y43.16 E.80187
G1 X129.642 Y43.16 E.02341
G1 X145.322 Y58.84 E.80187
G1 X144.675 Y58.84 E.02341
G1 X128.994 Y43.16 E.80187
G1 X128.347 Y43.16 E.02341
G1 X144.028 Y58.84 E.80187
G1 X143.38 Y58.84 E.02341
G1 X127.7 Y43.16 E.80187
M73 P22 R53
G1 X127.052 Y43.16 E.02341
G1 X142.733 Y58.84 E.80187
G1 X142.086 Y58.84 E.02341
G1 X126.405 Y43.16 E.80187
G1 X125.758 Y43.16 E.02341
G1 X141.438 Y58.84 E.80187
G1 X140.791 Y58.84 E.02341
G1 X131.788 Y49.837 E.46039
G3 X131.945 Y50.641 I-4.842 J1.361 E.02966
G1 X140.143 Y58.84 E.41927
G1 X139.496 Y58.84 E.02341
G1 X131.948 Y51.292 E.386
G3 X131.866 Y51.857 I-4.642 J-.388 E.02066
G1 X138.849 Y58.84 E.3571
G1 X138.201 Y58.84 E.02341
G1 X131.718 Y52.357 E.33156
G3 X131.522 Y52.808 I-2.354 J-.753 E.01782
G1 X137.554 Y58.84 E.30847
G1 X136.907 Y58.84 E.02341
G1 X131.283 Y53.217 E.28756
G3 X131.002 Y53.583 I-6.659 J-4.825 E.0167
G1 X136.259 Y58.84 E.26884
G1 X135.612 Y58.84 E.02341
G1 X130.682 Y53.911 E.25208
G3 X130.326 Y54.202 I-1.634 J-1.638 E.01666
G1 X134.964 Y58.84 E.2372
G1 X134.317 Y58.84 E.02341
G1 X129.931 Y54.455 E.22427
G3 X129.496 Y54.667 I-1.281 J-2.077 E.01754
G1 X133.67 Y58.84 E.21343
G1 X133.022 Y58.84 E.02341
G1 X129.011 Y54.829 E.20515
G3 X128.465 Y54.93 I-.781 J-2.678 E.02011
G1 X132.375 Y58.84 E.19995
G1 X131.728 Y58.84 E.02341
G1 X127.844 Y54.957 E.19859
G3 X127.097 Y54.857 I.311 J-5.179 E.02728
G1 X131.286 Y59.046 E.21421
; WIPE_START
G1 X129.872 Y57.632 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X127.425 Y50.402 Z.6 F30000
G1 X124.905 Y42.954 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X129.168 Y47.218 E.21803
G2 X128.36 Y47.057 I-1.24 J4.118 E.02985
G1 X124.463 Y43.16 E.19928
G1 X123.815 Y43.16 E.02341
G1 X127.709 Y47.053 E.19911
G2 X127.141 Y47.133 I.127 J2.978 E.02077
G1 X123.168 Y43.16 E.20317
G1 X122.521 Y43.16 E.02341
G1 X126.642 Y47.281 E.21077
G2 X126.193 Y47.479 I.762 J2.342 E.01779
G1 X121.873 Y43.16 E.22089
G1 X121.226 Y43.16 E.02341
G1 X125.785 Y47.719 E.23316
G2 X125.417 Y47.998 I1.208 J1.978 E.01674
G1 X120.579 Y43.16 E.24742
G1 X119.931 Y43.16 E.02341
G1 X125.087 Y48.315 E.26364
G2 X124.797 Y48.673 I1.644 J1.629 E.01667
G1 X119.284 Y43.16 E.28192
G1 X118.637 Y43.16 E.02341
G1 X124.545 Y49.069 E.30217
G2 X124.335 Y49.506 I2.074 J1.267 E.01757
G1 X117.989 Y43.16 E.32452
G1 X117.342 Y43.16 E.02341
G1 X124.171 Y49.988 E.34921
G2 X124.069 Y50.535 I5.005 J1.21 E.0201
G1 X116.694 Y43.16 E.37714
G1 X116.047 Y43.16 E.02341
G1 X124.043 Y51.155 E.40887
G2 X124.146 Y51.906 I4.771 J-.273 E.02742
G1 X115.4 Y43.16 E.44725
G1 X114.752 Y43.16 E.02341
G1 X130.433 Y58.84 E.80187
G1 X129.785 Y58.84 E.02341
G1 X114.105 Y43.16 E.80187
G1 X113.458 Y43.16 E.02341
G1 X129.138 Y58.84 E.80187
G1 X128.491 Y58.84 E.02341
G1 X112.81 Y43.16 E.80187
G1 X112.163 Y43.16 E.02341
G1 X127.843 Y58.84 E.80187
G1 X127.196 Y58.84 E.02341
G1 X111.515 Y43.16 E.80187
G1 X110.868 Y43.16 E.02341
G1 X126.549 Y58.84 E.80187
G1 X125.901 Y58.84 E.02341
G1 X110.221 Y43.16 E.80187
G1 X109.573 Y43.16 E.02341
G1 X125.254 Y58.84 E.80187
G1 X124.607 Y58.84 E.02341
G1 X108.926 Y43.16 E.80187
G1 X108.279 Y43.16 E.02341
G1 X123.959 Y58.84 E.80187
G1 X123.312 Y58.84 E.02341
G1 X107.631 Y43.16 E.80187
G1 X106.984 Y43.16 E.02341
G1 X122.664 Y58.84 E.80187
G1 X122.017 Y58.84 E.02341
G1 X106.336 Y43.16 E.80187
G1 X105.689 Y43.16 E.02341
G1 X121.37 Y58.84 E.80187
G1 X120.722 Y58.84 E.02341
G1 X105.042 Y43.16 E.80187
G1 X104.394 Y43.16 E.02341
G1 X120.075 Y58.84 E.80187
G1 X119.428 Y58.84 E.02341
G1 X103.747 Y43.16 E.80187
G1 X103.1 Y43.16 E.02341
G1 X118.78 Y58.84 E.80187
G1 X118.133 Y58.84 E.02341
G1 X102.452 Y43.16 E.80187
G1 X101.805 Y43.16 E.02341
G1 X117.485 Y58.84 E.80187
G1 X116.838 Y58.84 E.02341
G1 X101.158 Y43.16 E.80187
G1 X100.51 Y43.16 E.02341
G1 X116.191 Y58.84 E.80187
G1 X115.543 Y58.84 E.02341
G1 X99.863 Y43.16 E.80187
G1 X99.215 Y43.16 E.02341
G1 X114.896 Y58.84 E.80187
G1 X114.249 Y58.84 E.02341
G1 X98.568 Y43.16 E.80187
G1 X97.921 Y43.16 E.02341
G1 X113.601 Y58.84 E.80187
G1 X112.954 Y58.84 E.02341
G1 X97.273 Y43.16 E.80187
G1 X96.626 Y43.16 E.02341
G1 X112.306 Y58.84 E.80187
G1 X111.659 Y58.84 E.02341
G1 X95.979 Y43.16 E.80187
G1 X95.331 Y43.16 E.02341
G1 X111.012 Y58.84 E.80187
G1 X110.364 Y58.84 E.02341
G1 X94.684 Y43.16 E.80187
G1 X94.036 Y43.16 E.02341
G1 X109.717 Y58.84 E.80187
G1 X109.07 Y58.84 E.02341
G1 X93.389 Y43.16 E.80187
G1 X92.742 Y43.16 E.02341
G1 X108.422 Y58.84 E.80187
G1 X107.775 Y58.84 E.02341
G1 X92.094 Y43.16 E.80187
G1 X91.447 Y43.16 E.02341
G1 X107.128 Y58.84 E.80187
G1 X106.48 Y58.84 E.02341
G1 X90.8 Y43.16 E.80187
G1 X90.152 Y43.16 E.02341
G1 X105.833 Y58.84 E.80187
G1 X105.185 Y58.84 E.02341
G1 X89.505 Y43.16 E.80187
G1 X88.857 Y43.16 E.02341
G1 X104.538 Y58.84 E.80187
G1 X103.891 Y58.84 E.02341
G1 X88.21 Y43.16 E.80187
G1 X87.563 Y43.16 E.02341
G1 X103.243 Y58.84 E.80187
G1 X102.596 Y58.84 E.02341
G1 X86.915 Y43.16 E.80187
G1 X86.268 Y43.16 E.02341
G1 X101.949 Y58.84 E.80187
G1 X101.301 Y58.84 E.02341
G1 X85.621 Y43.16 E.80187
G1 X84.973 Y43.16 E.02341
G1 X100.654 Y58.84 E.80187
G1 X100.006 Y58.84 E.02341
G1 X84.326 Y43.16 E.80187
G1 X83.679 Y43.16 E.02341
G1 X99.359 Y58.84 E.80187
G1 X98.712 Y58.84 E.02341
G1 X83.031 Y43.16 E.80187
G1 X82.384 Y43.16 E.02341
G1 X98.064 Y58.84 E.80187
G1 X97.417 Y58.84 E.02341
G1 X81.736 Y43.16 E.80187
G1 X81.089 Y43.16 E.02341
G1 X96.77 Y58.84 E.80187
G1 X96.122 Y58.84 E.02341
G1 X80.442 Y43.16 E.80187
G1 X79.794 Y43.16 E.02341
G1 X95.475 Y58.84 E.80187
G1 X94.827 Y58.84 E.02341
G1 X79.147 Y43.16 E.80187
G1 X78.5 Y43.16 E.02341
G1 X94.18 Y58.84 E.80187
G1 X93.533 Y58.84 E.02341
G1 X77.852 Y43.16 E.80187
G1 X77.205 Y43.16 E.02341
G1 X92.885 Y58.84 E.80187
G1 X92.238 Y58.84 E.02341
G1 X76.557 Y43.16 E.80187
M73 P22 R52
G1 X75.91 Y43.16 E.02341
G1 X91.591 Y58.84 E.80187
G1 X90.943 Y58.84 E.02341
G1 X75.263 Y43.16 E.80187
G1 X74.615 Y43.16 E.02341
G1 X90.296 Y58.84 E.80187
G1 X89.649 Y58.84 E.02341
G1 X73.968 Y43.16 E.80187
G1 X73.321 Y43.16 E.02341
G1 X89.001 Y58.84 E.80187
G1 X88.354 Y58.84 E.02341
G1 X72.673 Y43.16 E.80187
G1 X72.026 Y43.16 E.02341
G1 X87.706 Y58.84 E.80187
G1 X87.059 Y58.84 E.02341
G1 X71.378 Y43.16 E.80187
G1 X70.731 Y43.16 E.02341
G1 X86.412 Y58.84 E.80187
G1 X85.764 Y58.84 E.02341
G1 X70.084 Y43.16 E.80187
G1 X69.436 Y43.16 E.02341
G1 X85.117 Y58.84 E.80187
G1 X84.47 Y58.84 E.02341
G1 X68.789 Y43.16 E.80187
G1 X68.142 Y43.16 E.02341
G1 X83.822 Y58.84 E.80187
G1 X83.175 Y58.84 E.02341
G1 X67.494 Y43.16 E.80187
G1 X66.847 Y43.16 E.02341
G1 X82.527 Y58.84 E.80187
M73 P23 R52
G1 X81.88 Y58.84 E.02341
G1 X66.2 Y43.16 E.80187
G1 X65.552 Y43.16 E.02341
G1 X81.233 Y58.84 E.80187
G1 X80.585 Y58.84 E.02341
G1 X64.905 Y43.16 E.80187
G1 X64.257 Y43.16 E.02341
G1 X79.938 Y58.84 E.80187
G1 X79.291 Y58.84 E.02341
G1 X63.61 Y43.16 E.80187
G1 X62.963 Y43.16 E.02341
G1 X78.643 Y58.84 E.80187
G1 X77.996 Y58.84 E.02341
G1 X62.315 Y43.16 E.80187
G1 X61.668 Y43.16 E.02341
G1 X77.348 Y58.84 E.80187
G1 X76.701 Y58.84 E.02341
G1 X61.021 Y43.16 E.80187
G1 X60.373 Y43.16 E.02341
G1 X76.054 Y58.84 E.80187
G1 X75.406 Y58.84 E.02341
G1 X59.726 Y43.16 E.80187
G1 X59.078 Y43.16 E.02341
G1 X74.759 Y58.84 E.80187
G1 X74.112 Y58.84 E.02341
G1 X58.431 Y43.16 E.80187
G1 X57.784 Y43.16 E.02341
G1 X73.464 Y58.84 E.80187
G1 X72.817 Y58.84 E.02341
G1 X57.136 Y43.16 E.80187
G1 X56.489 Y43.16 E.02341
G1 X72.17 Y58.84 E.80187
G1 X71.522 Y58.84 E.02341
G1 X55.842 Y43.16 E.80187
G1 X55.194 Y43.16 E.02341
G1 X70.875 Y58.84 E.80187
G1 X70.227 Y58.84 E.02341
G1 X54.547 Y43.16 E.80187
G1 X53.899 Y43.16 E.02341
G1 X69.58 Y58.84 E.80187
G1 X68.933 Y58.84 E.02341
G1 X59.707 Y49.615 E.47176
G2 X57.382 Y47.289 I-3.679 J1.354 E.12273
G1 X53.252 Y43.16 E.21118
G1 X52.605 Y43.16 E.02341
G1 X56.522 Y47.077 E.20032
G2 X55.841 Y47.043 I-.559 J4.412 E.02468
G1 X51.957 Y43.16 E.1986
G1 X51.31 Y43.16 E.02341
G1 X55.262 Y47.112 E.2021
G2 X54.745 Y47.242 I.372 J2.569 E.01932
G1 X50.663 Y43.16 E.20876
G1 X50.015 Y43.16 E.02341
G1 X54.287 Y47.431 E.21843
G2 X53.872 Y47.664 I.952 J2.187 E.01723
G1 X49.368 Y43.16 E.23031
G1 X48.72 Y43.16 E.02341
G1 X53.496 Y47.935 E.2442
G2 X53.158 Y48.244 I1.373 J1.843 E.0166
G1 X48.16 Y43.246 E.25558
G1 X48.16 Y43.894 E.02341
G1 X52.856 Y48.59 E.24016
G2 X52.596 Y48.977 I6.274 J4.508 E.01687
G1 X48.16 Y44.541 E.22684
G1 X48.16 Y45.188 E.02341
G1 X52.377 Y49.406 E.21567
G2 X52.204 Y49.88 I2.286 J1.104 E.01828
G1 X48.16 Y45.836 E.20681
G1 X48.16 Y46.483 E.02341
G1 X52.083 Y50.406 E.2006
G2 X52.043 Y51.013 I5.697 J.68 E.02202
G1 X48.16 Y47.131 E.19856
G1 X48.16 Y47.778 E.02341
G1 X52.382 Y52.001 E.21594
; WIPE_START
G1 X50.968 Y50.586 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X58.594 Y50.275 Z.6 F30000
G1 X59.676 Y50.231 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X68.285 Y58.84 E.44028
G1 X67.638 Y58.84 E.02341
G1 X59.955 Y51.157 E.39291
G3 X59.891 Y51.74 I-2.951 J-.028 E.02126
G1 X66.991 Y58.84 E.36307
G1 X66.343 Y58.84 E.02341
G1 X59.756 Y52.253 E.33688
G3 X59.568 Y52.712 I-2.386 J-.706 E.01798
G1 X65.696 Y58.84 E.31337
G1 X65.048 Y58.84 E.02341
G1 X59.337 Y53.129 E.29207
G3 X59.067 Y53.506 I-2.018 J-1.162 E.0168
G1 X64.401 Y58.84 E.27279
G1 X63.84 Y58.84 E.02028
G1 X63.84 Y58.927 E.00313
G1 X58.758 Y53.844 E.25991
G3 X58.409 Y54.142 I-1.667 J-1.6 E.01663
G1 X63.84 Y59.574 E.27777
G1 X63.84 Y60.222 E.02341
G1 X58.021 Y54.403 E.29757
G3 X57.594 Y54.623 I-1.313 J-2.027 E.01741
G1 X63.84 Y60.869 E.31943
G1 X63.84 Y61.516 E.02341
G1 X57.122 Y54.798 E.34356
G3 X56.591 Y54.914 I-1.35 J-4.886 E.01966
G1 X63.84 Y62.164 E.37071
G1 X63.84 Y62.811 E.02341
G1 X55.988 Y54.959 E.40154
G3 X55.272 Y54.89 I.045 J-4.231 E.02605
G1 X63.84 Y63.458 E.43817
G1 X63.84 Y64.106 E.02341
G1 X54.321 Y54.586 E.4868
G3 X52.413 Y52.678 I1.652 J-3.56 E.09961
G1 X48.16 Y48.425 E.21749
G1 X48.16 Y49.073 E.02341
G1 X63.84 Y64.753 E.80187
G1 X63.84 Y65.401 E.02341
G1 X48.16 Y49.72 E.80187
G1 X48.16 Y50.367 E.02341
G1 X63.84 Y66.048 E.80187
G1 X63.84 Y66.695 E.02341
G1 X48.16 Y51.015 E.80187
G1 X48.16 Y51.662 E.02341
G1 X63.84 Y67.343 E.80187
G1 X63.84 Y67.99 E.02341
G1 X48.16 Y52.31 E.80187
G1 X48.16 Y52.957 E.02341
G1 X63.84 Y68.637 E.80187
G1 X63.84 Y69.285 E.02341
G1 X48.16 Y53.604 E.80187
G1 X48.16 Y54.252 E.02341
G1 X63.84 Y69.932 E.80187
G1 X63.84 Y70.58 E.02341
G1 X48.16 Y54.899 E.80187
G1 X48.16 Y55.546 E.02341
G1 X63.84 Y71.227 E.80187
G1 X63.84 Y71.874 E.02341
G1 X48.16 Y56.194 E.80187
G1 X48.16 Y56.841 E.02341
G1 X63.84 Y72.522 E.80187
G1 X63.84 Y73.169 E.02341
G1 X48.16 Y57.488 E.80187
G1 X48.16 Y58.136 E.02341
G1 X63.84 Y73.816 E.80187
G1 X63.84 Y74.464 E.02341
G1 X48.16 Y58.783 E.80187
G1 X48.16 Y59.431 E.02341
G1 X63.84 Y75.111 E.80187
G1 X63.84 Y75.759 E.02341
G1 X48.16 Y60.078 E.80187
G1 X48.16 Y60.725 E.02341
G1 X63.84 Y76.406 E.80187
G1 X63.84 Y77.053 E.02341
G1 X48.16 Y61.373 E.80187
G1 X48.16 Y62.02 E.02341
G1 X63.84 Y77.701 E.80187
G1 X63.84 Y78.348 E.02341
G1 X48.16 Y62.667 E.80187
G1 X48.16 Y63.315 E.02341
G1 X63.84 Y78.995 E.80187
G1 X63.84 Y79.643 E.02341
G1 X48.16 Y63.962 E.80187
G1 X48.16 Y64.61 E.02341
G1 X63.84 Y80.29 E.80187
G1 X63.84 Y80.937 E.02341
G1 X48.16 Y65.257 E.80187
G1 X48.16 Y65.904 E.02341
G1 X63.84 Y81.585 E.80187
G1 X63.84 Y82.232 E.02341
G1 X48.16 Y66.552 E.80187
G1 X48.16 Y67.199 E.02341
G1 X63.84 Y82.88 E.80187
G1 X63.84 Y83.527 E.02341
G1 X48.16 Y67.846 E.80187
G1 X48.16 Y68.494 E.02341
G1 X63.84 Y84.174 E.80187
G1 X63.84 Y84.822 E.02341
G1 X48.16 Y69.141 E.80187
G1 X48.16 Y69.789 E.02341
G1 X63.84 Y85.469 E.80187
G1 X63.84 Y86.116 E.02341
G1 X48.16 Y70.436 E.80187
G1 X48.16 Y71.083 E.02341
G1 X63.84 Y86.764 E.80187
G1 X63.84 Y87.411 E.02341
G1 X48.16 Y71.731 E.80187
G1 X48.16 Y72.378 E.02341
G1 X63.84 Y88.059 E.80187
G1 X63.84 Y88.706 E.02341
G1 X48.16 Y73.025 E.80187
G1 X48.16 Y73.673 E.02341
G1 X63.84 Y89.353 E.80187
G1 X63.84 Y90.001 E.02341
G1 X48.16 Y74.32 E.80187
G1 X48.16 Y74.967 E.02341
G1 X63.84 Y90.648 E.80187
G1 X63.84 Y91.295 E.02341
G1 X48.16 Y75.615 E.80187
G1 X48.16 Y76.262 E.02341
G1 X63.84 Y91.943 E.80187
G1 X63.84 Y92.59 E.02341
G1 X48.16 Y76.91 E.80187
G1 X48.16 Y77.557 E.02341
G1 X63.84 Y93.238 E.80187
G1 X63.84 Y93.885 E.02341
G1 X48.16 Y78.204 E.80187
G1 X48.16 Y78.852 E.02341
G1 X63.84 Y94.532 E.80187
G1 X63.84 Y95.18 E.02341
G1 X48.16 Y79.499 E.80187
G1 X48.16 Y80.146 E.02341
G1 X63.84 Y95.827 E.80187
G1 X63.84 Y96.474 E.02341
G1 X48.16 Y80.794 E.80187
G1 X48.16 Y81.441 E.02341
G1 X63.84 Y97.122 E.80187
G1 X63.84 Y97.769 E.02341
G1 X48.16 Y82.089 E.80187
G1 X48.16 Y82.736 E.02341
G1 X63.84 Y98.416 E.80187
G1 X63.84 Y99.064 E.02341
G1 X48.16 Y83.383 E.80187
G1 X48.16 Y84.031 E.02341
G1 X63.84 Y99.711 E.80187
G1 X63.84 Y100.359 E.02341
G1 X48.16 Y84.678 E.80187
G1 X48.16 Y85.325 E.02341
G1 X63.84 Y101.006 E.80187
M73 P24 R52
G1 X63.84 Y101.653 E.02341
G1 X48.16 Y85.973 E.80187
G1 X48.16 Y86.62 E.02341
G1 X63.84 Y102.301 E.80187
G1 X63.84 Y102.948 E.02341
G1 X48.16 Y87.268 E.80187
G1 X48.16 Y87.915 E.02341
G1 X63.84 Y103.595 E.80187
G1 X63.84 Y104.243 E.02341
G1 X48.16 Y88.562 E.80187
G1 X48.16 Y89.21 E.02341
G1 X63.84 Y104.89 E.80187
G1 X63.84 Y105.538 E.02341
G1 X48.16 Y89.857 E.80187
G1 X48.16 Y90.504 E.02341
G1 X63.84 Y106.185 E.80187
G1 X63.84 Y106.832 E.02341
G1 X48.16 Y91.152 E.80187
G1 X48.16 Y91.799 E.02341
G1 X63.84 Y107.48 E.80187
G1 X63.84 Y108.127 E.02341
G1 X48.16 Y92.446 E.80187
G1 X48.16 Y93.094 E.02341
G1 X63.84 Y108.774 E.80187
G1 X63.84 Y109.422 E.02341
G1 X48.16 Y93.741 E.80187
G1 X48.16 Y94.389 E.02341
G1 X63.84 Y110.069 E.80187
G1 X63.84 Y110.717 E.02341
G1 X48.16 Y95.036 E.80187
G1 X48.16 Y95.683 E.02341
G1 X63.84 Y111.364 E.80187
G1 X63.84 Y112.011 E.02341
G1 X48.16 Y96.331 E.80187
G1 X48.16 Y96.978 E.02341
G1 X63.84 Y112.659 E.80187
G1 X63.84 Y113.306 E.02341
G1 X48.16 Y97.625 E.80187
G1 X48.16 Y98.273 E.02341
G1 X63.84 Y113.953 E.80187
G1 X63.84 Y114.601 E.02341
G1 X48.16 Y98.92 E.80187
G1 X48.16 Y99.568 E.02341
G1 X63.84 Y115.248 E.80187
G1 X63.84 Y115.895 E.02341
G1 X48.16 Y100.215 E.80187
G1 X48.16 Y100.862 E.02341
G1 X63.84 Y116.543 E.80187
G1 X63.84 Y117.19 E.02341
G1 X48.16 Y101.51 E.80187
G1 X48.16 Y102.157 E.02341
G1 X63.84 Y117.838 E.80187
G1 X63.84 Y118.485 E.02341
G1 X48.16 Y102.804 E.80187
G1 X48.16 Y103.452 E.02341
G1 X63.84 Y119.132 E.80187
G1 X63.84 Y119.78 E.02341
G1 X48.16 Y104.099 E.80187
M73 P24 R51
G1 X48.16 Y104.747 E.02341
G1 X63.84 Y120.427 E.80187
G1 X63.84 Y121.074 E.02341
G1 X48.16 Y105.394 E.80187
G1 X48.16 Y106.041 E.02341
G1 X63.84 Y121.722 E.80187
G1 X63.84 Y122.369 E.02341
G1 X48.16 Y106.689 E.80187
G1 X48.16 Y107.336 E.02341
G1 X63.84 Y123.017 E.80187
G1 X63.84 Y123.664 E.02341
G1 X48.16 Y107.983 E.80187
G1 X48.16 Y108.631 E.02341
G1 X63.84 Y124.311 E.80187
G1 X63.84 Y124.959 E.02341
G1 X48.16 Y109.278 E.80187
G1 X48.16 Y109.925 E.02341
G1 X63.84 Y125.606 E.80187
G1 X63.84 Y126.253 E.02341
G1 X48.16 Y110.573 E.80187
G1 X48.16 Y111.22 E.02341
G1 X63.84 Y126.901 E.80187
G1 X63.84 Y127.548 E.02341
G1 X48.16 Y111.868 E.80187
G1 X48.16 Y112.515 E.02341
G1 X63.84 Y128.196 E.80187
G1 X63.84 Y128.843 E.02341
G1 X59.762 Y124.764 E.20857
G2 X57.239 Y122.241 I-3.735 J1.212 E.13393
G1 X48.16 Y113.162 E.46428
G1 X48.16 Y113.81 E.02341
G1 X56.413 Y122.063 E.42208
G2 X55.753 Y122.05 I-.414 J4.099 E.02393
G1 X48.16 Y114.457 E.38828
G1 X48.16 Y115.104 E.02341
G1 X55.181 Y122.126 E.35905
G2 X54.676 Y122.268 I1.207 J5.241 E.01898
G1 X48.16 Y115.752 E.33323
G1 X48.16 Y116.399 E.02341
G1 X54.224 Y122.463 E.31011
G2 X53.814 Y122.701 I.982 J2.167 E.01716
G1 X48.16 Y117.047 E.28914
G1 X48.16 Y117.694 E.02341
G1 X53.443 Y122.977 E.27018
G2 X53.11 Y123.291 I1.4 J1.823 E.01659
G1 X48.16 Y118.341 E.25312
G1 X48.16 Y118.989 E.02341
G1 X52.816 Y123.645 E.23811
G2 X52.562 Y124.038 I1.839 J1.466 E.01696
G1 X48.16 Y119.636 E.22512
G1 X48.16 Y120.283 E.02341
G1 X52.349 Y124.473 E.21423
G2 X52.182 Y124.953 I2.314 J1.077 E.01841
G1 X48.16 Y120.931 E.20567
G1 X48.16 Y121.578 E.02341
G1 X52.074 Y125.492 E.20015
G2 X52.043 Y126.108 I3.063 J.463 E.02235
G1 X48.16 Y122.226 E.19856
G1 X48.16 Y122.873 E.02341
G1 X52.425 Y127.138 E.2181
; WIPE_START
G1 X51.011 Y125.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X58.636 Y125.392 Z.6 F30000
G1 X59.696 Y125.346 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X63.84 Y129.49 E.21195
G1 X63.84 Y130.138 E.02341
G1 X59.95 Y126.247 E.19894
G3 X59.875 Y126.82 I-4.982 J-.362 E.02088
G1 X63.84 Y130.785 E.20277
G1 X63.84 Y131.432 E.02341
G1 X59.73 Y127.322 E.21018
G3 X59.537 Y127.776 I-2.365 J-.738 E.01788
G1 X63.84 Y132.08 E.22006
G1 X63.84 Y132.727 E.02341
G1 X59.301 Y128.188 E.23213
G3 X59.025 Y128.559 I-6.756 J-4.747 E.01673
G1 X63.84 Y133.374 E.24627
G1 X63.84 Y134.022 E.02341
G1 X58.707 Y128.889 E.26249
G3 X58.353 Y129.182 I-1.645 J-1.626 E.01665
G1 X63.84 Y134.669 E.28059
G1 X63.84 Y135.317 E.02341
G1 X57.961 Y129.437 E.30065
G3 X57.528 Y129.652 I-1.289 J-2.055 E.0175
G1 X63.84 Y135.964 E.32278
G1 X63.84 Y136.611 E.02341
G1 X57.049 Y129.82 E.3473
G3 X56.507 Y129.925 I-.797 J-2.662 E.02001
G1 X63.84 Y137.259 E.37503
G1 X63.84 Y137.906 E.02341
G1 X55.895 Y129.961 E.40631
G3 X55.157 Y129.87 I.086 J-3.742 E.02694
G1 X63.84 Y138.553 E.44406
G1 X63.84 Y139.201 E.02341
G1 X48.16 Y123.52 E.80187
G1 X48.16 Y124.168 E.02341
G1 X63.84 Y139.848 E.80187
G1 X63.84 Y140.496 E.02341
G1 X48.16 Y124.815 E.80187
G1 X48.16 Y125.462 E.02341
G1 X63.84 Y141.143 E.80187
G1 X63.84 Y141.79 E.02341
G1 X48.16 Y126.11 E.80187
G1 X48.16 Y126.757 E.02341
G1 X63.84 Y142.438 E.80187
G1 X63.84 Y143.085 E.02341
G1 X48.16 Y127.404 E.80187
G1 X48.16 Y128.052 E.02341
G1 X63.84 Y143.732 E.80187
G1 X63.84 Y144.38 E.02341
G1 X48.16 Y128.699 E.80187
G1 X48.16 Y129.347 E.02341
G1 X63.84 Y145.027 E.80187
G1 X63.84 Y145.675 E.02341
G1 X48.16 Y129.994 E.80187
G1 X48.16 Y130.641 E.02341
G1 X63.84 Y146.322 E.80187
G1 X63.84 Y146.969 E.02341
G1 X48.16 Y131.289 E.80187
G1 X48.16 Y131.936 E.02341
G1 X63.84 Y147.617 E.80187
G1 X63.84 Y148.264 E.02341
G1 X48.16 Y132.583 E.80187
G1 X48.16 Y133.231 E.02341
G1 X63.84 Y148.911 E.80187
G1 X63.84 Y149.559 E.02341
G1 X48.16 Y133.878 E.80187
G1 X48.16 Y134.526 E.02341
G1 X63.84 Y150.206 E.80187
G1 X63.84 Y150.853 E.02341
G1 X48.16 Y135.173 E.80187
G1 X48.16 Y135.82 E.02341
G1 X63.84 Y151.501 E.80187
G1 X63.84 Y152.148 E.02341
G1 X48.16 Y136.468 E.80187
G1 X48.16 Y137.115 E.02341
G1 X63.84 Y152.796 E.80187
G1 X63.84 Y153.443 E.02341
G1 X48.16 Y137.762 E.80187
G1 X48.16 Y138.41 E.02341
G1 X63.84 Y154.09 E.80187
G1 X63.84 Y154.738 E.02341
G1 X48.16 Y139.057 E.80187
G1 X48.16 Y139.705 E.02341
G1 X63.84 Y155.385 E.80187
G1 X63.84 Y156.032 E.02341
G1 X48.16 Y140.352 E.80187
G1 X48.16 Y140.999 E.02341
G1 X63.84 Y156.68 E.80187
G1 X63.84 Y157.327 E.02341
G1 X48.16 Y141.647 E.80187
G1 X48.16 Y142.294 E.02341
G1 X63.84 Y157.975 E.80187
G1 X63.84 Y158.622 E.02341
G1 X48.16 Y142.941 E.80187
G1 X48.16 Y143.589 E.02341
G1 X63.84 Y159.269 E.80187
G1 X63.84 Y159.917 E.02341
G1 X48.16 Y144.236 E.80187
G1 X48.16 Y144.883 E.02341
G1 X63.84 Y160.564 E.80187
G1 X63.84 Y161.211 E.02341
G1 X48.16 Y145.531 E.80187
G1 X48.16 Y146.178 E.02341
G1 X63.84 Y161.859 E.80187
M73 P25 R51
G1 X63.84 Y162.506 E.02341
G1 X48.16 Y146.826 E.80187
G1 X48.16 Y147.473 E.02341
G1 X63.84 Y163.154 E.80187
G1 X63.84 Y163.801 E.02341
G1 X48.16 Y148.12 E.80187
G1 X48.16 Y148.768 E.02341
G1 X63.84 Y164.448 E.80187
G1 X63.84 Y165.096 E.02341
G1 X48.16 Y149.415 E.80187
G1 X48.16 Y150.062 E.02341
G1 X63.84 Y165.743 E.80187
G1 X63.84 Y166.39 E.02341
G1 X48.16 Y150.71 E.80187
G1 X48.16 Y151.357 E.02341
G1 X63.84 Y167.038 E.80187
G1 X63.84 Y167.685 E.02341
G1 X48.16 Y152.005 E.80187
G1 X48.16 Y152.652 E.02341
G1 X63.84 Y168.332 E.80187
G1 X63.84 Y168.98 E.02341
G1 X48.16 Y153.299 E.80187
G1 X48.16 Y153.947 E.02341
G1 X63.84 Y169.627 E.80187
G1 X63.84 Y170.275 E.02341
G1 X48.16 Y154.594 E.80187
G1 X48.16 Y155.241 E.02341
G1 X63.84 Y170.922 E.80187
G1 X63.84 Y171.569 E.02341
G1 X48.16 Y155.889 E.80187
G1 X48.16 Y156.536 E.02341
G1 X63.84 Y172.217 E.80187
G1 X63.84 Y172.864 E.02341
G1 X48.16 Y157.184 E.80187
G1 X48.16 Y157.831 E.02341
G1 X63.84 Y173.511 E.80187
G1 X63.84 Y174.159 E.02341
G1 X48.16 Y158.478 E.80187
G1 X48.16 Y159.126 E.02341
G1 X63.84 Y174.806 E.80187
G1 X63.84 Y175.454 E.02341
G1 X48.16 Y159.773 E.80187
G1 X48.16 Y160.42 E.02341
G1 X63.84 Y176.101 E.80187
G1 X63.84 Y176.748 E.02341
G1 X48.16 Y161.068 E.80187
G1 X48.16 Y161.715 E.02341
G1 X63.84 Y177.396 E.80187
G1 X63.84 Y178.043 E.02341
G1 X48.16 Y162.362 E.80187
G1 X48.16 Y163.01 E.02341
G1 X63.84 Y178.69 E.80187
G1 X63.84 Y179.338 E.02341
G1 X48.16 Y163.657 E.80187
G1 X48.16 Y164.305 E.02341
G1 X63.84 Y179.985 E.80187
G1 X63.84 Y180.633 E.02341
G1 X48.16 Y164.952 E.80187
G1 X48.16 Y165.599 E.02341
G1 X63.84 Y181.28 E.80187
G1 X63.84 Y181.927 E.02341
G1 X48.16 Y166.247 E.80187
G1 X48.16 Y166.894 E.02341
G1 X63.84 Y182.575 E.80187
G1 X63.84 Y183.222 E.02341
G1 X48.16 Y167.541 E.80187
G1 X48.16 Y168.189 E.02341
G1 X63.84 Y183.869 E.80187
G1 X63.84 Y184.517 E.02341
G1 X48.16 Y168.836 E.80187
G1 X48.16 Y169.484 E.02341
G1 X63.84 Y185.164 E.80187
G1 X63.84 Y185.811 E.02341
G1 X48.16 Y170.131 E.80187
G1 X48.16 Y170.778 E.02341
G1 X63.84 Y186.459 E.80187
G1 X63.84 Y187.106 E.02341
G1 X48.16 Y171.426 E.80187
G1 X48.16 Y172.073 E.02341
G1 X63.84 Y187.754 E.80187
G1 X63.84 Y188.401 E.02341
G1 X48.16 Y172.72 E.80187
G1 X48.16 Y173.368 E.02341
G1 X63.84 Y189.048 E.80187
G1 X63.84 Y189.696 E.02341
G1 X48.16 Y174.015 E.80187
G1 X48.16 Y174.663 E.02341
G1 X63.84 Y190.343 E.80187
G1 X63.84 Y190.99 E.02341
G1 X48.16 Y175.31 E.80187
G1 X48.16 Y175.957 E.02341
G1 X63.84 Y191.638 E.80187
G1 X63.84 Y192.285 E.02341
G1 X48.16 Y176.605 E.80187
G1 X48.16 Y177.252 E.02341
G1 X79.748 Y208.84 E1.61535
G1 X79.101 Y208.84 E.02341
G1 X48.16 Y177.899 E1.58224
G1 X48.16 Y178.547 E.02341
G1 X78.453 Y208.84 E1.54914
G1 X77.806 Y208.84 E.02341
G1 X48.16 Y179.194 E1.51603
G1 X48.16 Y179.841 E.02341
G1 X77.159 Y208.84 E1.48293
G1 X76.511 Y208.84 E.02341
G1 X48.16 Y180.489 E1.44982
G1 X48.16 Y181.136 E.02341
G1 X75.864 Y208.84 E1.41672
G1 X75.216 Y208.84 E.02341
G1 X48.16 Y181.784 E1.38361
G1 X48.16 Y182.431 E.02341
G1 X74.569 Y208.84 E1.35051
G1 X73.922 Y208.84 E.02341
G1 X48.16 Y183.078 E1.3174
G1 X48.16 Y183.726 E.02341
G1 X73.274 Y208.84 E1.2843
G1 X72.627 Y208.84 E.02341
G1 X48.16 Y184.373 E1.25119
G1 X48.16 Y185.02 E.02341
G1 X71.98 Y208.84 E1.21809
G1 X71.332 Y208.84 E.02341
G1 X48.16 Y185.668 E1.18498
G1 X48.16 Y186.315 E.02341
G1 X70.685 Y208.84 E1.15188
G1 X70.037 Y208.84 E.02341
G1 X48.16 Y186.963 E1.11877
G1 X48.16 Y187.61 E.02341
G1 X69.39 Y208.84 E1.08567
G1 X68.743 Y208.84 E.02341
G1 X59.804 Y199.902 E.4571
G3 X59.947 Y200.692 I-4.198 J1.167 E.02908
G1 X68.095 Y208.84 E.41669
G1 X67.448 Y208.84 E.02341
G1 X59.946 Y201.338 E.38366
G3 X59.856 Y201.895 I-4.786 J-.485 E.02043
G1 X66.801 Y208.84 E.35514
G1 X66.153 Y208.84 E.02341
G1 X59.705 Y202.392 E.32976
G3 X59.506 Y202.841 I-2.336 J-.767 E.01777
G1 X65.506 Y208.84 E.30681
G1 X64.858 Y208.84 E.02341
G1 X59.264 Y203.246 E.2861
G3 X58.979 Y203.608 I-1.954 J-1.243 E.0167
G1 X64.211 Y208.84 E.26757
G1 X63.564 Y208.84 E.02341
G1 X58.657 Y203.933 E.25092
G3 X58.298 Y204.222 I-1.618 J-1.645 E.01668
G1 X62.916 Y208.84 E.23617
M73 P25 R50
G1 X62.269 Y208.84 E.02341
G1 X57.901 Y204.472 E.22337
G3 X57.463 Y204.682 I-1.264 J-2.08 E.01758
G1 X61.622 Y208.84 E.21266
G1 X60.974 Y208.84 E.02341
G1 X56.972 Y204.838 E.20469
G3 X56.422 Y204.936 I-.765 J-2.699 E.02021
G1 X60.327 Y208.84 E.19968
G1 X59.68 Y208.84 E.02341
G1 X55.792 Y204.953 E.19879
G3 X55.03 Y204.838 I.252 J-4.258 E.02791
G1 X59.238 Y209.046 E.21517
; WIPE_START
G1 X57.824 Y207.632 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X57.529 Y200.005 Z.6 F30000
G1 X57.433 Y197.531 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X48.16 Y188.257 E.47421
G1 X48.16 Y188.905 E.02341
G1 X56.305 Y197.05 E.41652
G2 X55.664 Y197.057 I-.263 J5.434 E.02318
G1 X48.16 Y189.552 E.38377
G1 X48.16 Y190.199 E.02341
G1 X55.102 Y197.142 E.35501
G2 X54.608 Y197.295 I.518 J2.541 E.01873
G1 X48.16 Y190.847 E.32975
G1 X48.16 Y191.494 E.02341
G1 X54.161 Y197.496 E.3069
G2 X53.756 Y197.738 I1.011 J2.147 E.01709
G1 X48.16 Y192.142 E.28619
G1 X48.16 Y192.789 E.02341
G1 X53.39 Y198.019 E.26748
G2 X53.065 Y198.341 I5.901 J6.292 E.01655
G1 X48.16 Y193.436 E.25083
G1 X48.16 Y194.084 E.02341
G1 X52.777 Y198.701 E.23614
G2 X52.529 Y199.1 I1.868 J1.444 E.01702
M73 P26 R50
G1 X48.16 Y194.731 E.22341
G1 X48.16 Y195.378 E.02341
G1 X52.321 Y199.54 E.21279
G2 X52.159 Y200.025 I6.284 J2.359 E.01852
G1 X48.16 Y196.026 E.20454
G1 X48.16 Y196.673 E.02341
G1 X52.065 Y200.578 E.1997
G2 X52.043 Y201.204 I5.543 J.506 E.02265
G1 X48.16 Y197.32 E.19859
G1 X48.16 Y197.968 E.02341
G1 X52.467 Y202.275 E.22027
; WIPE_START
G1 X51.053 Y200.861 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X47.954 Y198.41 Z.6 F30000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X58.385 Y208.84 E.5334
G1 X57.737 Y208.84 E.02341
G1 X48.16 Y199.263 E.48978
G1 X48.16 Y199.91 E.02341
G1 X57.09 Y208.84 E.45668
G1 X56.443 Y208.84 E.02341
G1 X48.16 Y200.557 E.42357
G1 X48.16 Y201.205 E.02341
G1 X55.795 Y208.84 E.39047
G1 X55.148 Y208.84 E.02341
G1 X48.16 Y201.852 E.35736
G1 X48.16 Y202.499 E.02341
G1 X54.501 Y208.84 E.32426
G1 X53.853 Y208.84 E.02341
G1 X48.16 Y203.147 E.29115
G1 X48.16 Y203.794 E.02341
G1 X53.206 Y208.84 E.25805
G1 X52.558 Y208.84 E.02341
G1 X48.16 Y204.442 E.22494
G1 X48.16 Y205.089 E.02341
G1 X51.911 Y208.84 E.19184
G1 X51.264 Y208.84 E.02341
G1 X48.16 Y205.736 E.15873
G1 X48.16 Y206.384 E.02341
G1 X50.616 Y208.84 E.12563
G1 X49.969 Y208.84 E.02341
G1 X48.16 Y207.031 E.09252
G1 X48.16 Y207.678 E.02341
G1 X49.322 Y208.84 E.05942
G1 X48.674 Y208.84 E.02341
G1 X47.954 Y208.12 E.03683
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6300
G1 X48.674 Y208.84 E-.38703
G1 X49.322 Y208.84 E-.246
G1 X49.085 Y208.604 E-.12697
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/58
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
G1 X198.477 Y123.169
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X198.678 Y123.07 E.0072
G3 X199.624 Y122.805 I1.328 J2.929 E.03172
G3 X200.24 Y122.791 I.379 J3.067 E.01986
G3 X198.393 Y123.216 I-.235 J3.207 E.58783
G1 X198.425 Y123.198 E.00117
G1 X198.97 Y123.389 F30000
G1 F8843.478
G1 X199.106 Y123.338 E.00465
G3 X199.673 Y123.21 I.9 J2.66 E.01874
G3 X200.21 Y123.197 I.33 J2.674 E.0173
G3 X198.845 Y123.441 I-.205 J2.801 E.52238
G1 X198.915 Y123.412 E.00242
G1 X199.403 Y123.678 F30000
G1 F8843.478
G1 X199.468 Y123.658 E.0022
G3 X199.722 Y123.614 I.537 J2.34 E.00828
G3 X200.18 Y123.604 I.281 J2.28 E.01475
G3 X199.013 Y123.812 I-.175 J2.395 E.44662
G1 X199.346 Y123.698 E.01134
G1 X199.771 Y124.004 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X199.95 Y123.99 E.00533
G3 X199.712 Y124.012 I.06 J2.008 E.36889
; WIPE_START
M204 S10000
G1 X199.95 Y123.99 E-.09077
G1 X200.349 Y124.02 E-.15212
G1 X200.734 Y124.129 E-.1521
G1 X201.091 Y124.311 E-.15214
G1 X201.404 Y124.561 E-.15212
G1 X201.506 Y124.683 E-.06075
; WIPE_END
G1 E-.04 F1800
G1 X201.192 Y132.309 Z.8 F30000
G1 X198.477 Y198.169 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X198.678 Y198.07 E.00719
G3 X199.624 Y197.805 I1.328 J2.928 E.03172
G3 X200.24 Y197.791 I.379 J3.066 E.01986
G3 X198.393 Y198.216 I-.235 J3.207 E.58783
G1 X198.425 Y198.198 E.00118
G1 X198.97 Y198.389 F30000
G1 F8843.478
G1 X199.106 Y198.338 E.00465
G3 X199.673 Y198.21 I.9 J2.66 E.01874
G3 X200.21 Y198.197 I.33 J2.673 E.0173
G3 X198.845 Y198.441 I-.205 J2.801 E.52237
G1 X198.915 Y198.412 E.00243
G1 X199.419 Y198.67 F30000
G1 F8843.478
G1 X199.468 Y198.658 E.00162
G3 X199.722 Y198.614 I.537 J2.34 E.00827
G3 X200.18 Y198.604 I.281 J2.279 E.01475
G3 X199.235 Y198.724 I-.175 J2.395 E.45432
G1 X199.362 Y198.687 E.00424
G1 X199.769 Y199.004 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X199.769 Y199.004 E0
G1 X199.95 Y198.99 E.00541
G3 X199.554 Y199.042 I.06 J2.008 E.3641
G1 X199.71 Y199.014 E.00471
; WIPE_START
M204 S10000
G1 X199.769 Y199.004 E-.02284
G1 X199.95 Y198.99 E-.06897
G1 X200.349 Y199.02 E-.15213
G1 X200.734 Y199.129 E-.15209
G1 X201.091 Y199.311 E-.15216
G1 X201.404 Y199.561 E-.15211
G1 X201.505 Y199.681 E-.05969
; WIPE_END
G1 E-.04 F1800
G1 X193.875 Y199.493 Z.8 F30000
G1 X128.814 Y197.889 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X128.872 Y197.901 E.0019
G3 X127.624 Y197.805 I-.866 J3.097 E.6092
G3 X128.24 Y197.791 I.379 J3.066 E.01986
G3 X128.559 Y197.83 I-.235 J3.207 E.01032
G1 X128.756 Y197.876 E.00651
G1 X128.391 Y198.22 F30000
G1 F8843.478
G1 X128.488 Y198.232 E.00314
G3 X127.673 Y198.21 I-.483 J2.767 E.54111
G3 X128.21 Y198.197 I.33 J2.672 E.0173
G1 X128.332 Y198.213 E.00394
G1 X128.008 Y198.608 F30000
G1 F8843.478
G1 X128.18 Y198.604 E.00551
G3 X127.722 Y198.614 I-.175 J2.395 E.47038
G1 X127.948 Y198.609 E.00729
G1 X127.768 Y199.004 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X127.769 Y199.004 E.00002
G1 X127.95 Y198.99 E.00541
G3 X127.554 Y199.042 I.06 J2.008 E.3641
G1 X127.709 Y199.014 E.00469
; WIPE_START
M204 S10000
G1 X127.769 Y199.004 E-.02304
G1 X127.95 Y198.99 E-.06897
G1 X128.349 Y199.02 E-.15213
G1 X128.734 Y199.129 E-.15213
G1 X129.091 Y199.311 E-.15213
G1 X129.404 Y199.561 E-.15209
G1 X129.504 Y199.681 E-.05952
; WIPE_END
G1 E-.04 F1800
G1 X121.874 Y199.493 Z.8 F30000
G1 X56.814 Y197.889 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X56.872 Y197.901 E.00189
G3 X55.624 Y197.805 I-.866 J3.097 E.6092
G3 X56.24 Y197.791 I.379 J3.066 E.01986
G3 X56.559 Y197.83 I-.235 J3.207 E.01032
G1 X56.756 Y197.876 E.00651
G1 X56.391 Y198.22 F30000
G1 F8843.478
G1 X56.488 Y198.232 E.00314
G3 X55.673 Y198.21 I-.483 J2.767 E.54111
G3 X56.21 Y198.197 I.33 J2.672 E.0173
G1 X56.332 Y198.213 E.00394
G1 X56.008 Y198.608 F30000
G1 F8843.478
G1 X56.18 Y198.604 E.00551
G3 X55.722 Y198.614 I-.175 J2.395 E.47038
G1 X55.948 Y198.609 E.00729
G1 X55.768 Y199.004 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X55.769 Y199.004 E.00002
G1 X55.95 Y198.99 E.00541
G3 X55.554 Y199.042 I.06 J2.008 E.3641
G1 X55.709 Y199.014 E.00469
; WIPE_START
M204 S10000
G1 X55.769 Y199.004 E-.02304
G1 X55.95 Y198.99 E-.06897
G1 X56.349 Y199.02 E-.15212
G1 X56.734 Y199.129 E-.15213
G1 X57.091 Y199.311 E-.15213
G1 X57.404 Y199.561 E-.15208
G1 X57.504 Y199.681 E-.05952
; WIPE_END
G1 E-.04 F1800
G1 X57.624 Y192.049 Z.8 F30000
G1 X58.628 Y127.854 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X58.466 Y128.069 E.00865
G3 X55.624 Y122.805 I-2.46 J-2.071 E.40262
G3 X56.241 Y122.791 I.379 J3.066 E.01986
G3 X58.665 Y127.807 I-.235 J3.207 E.21665
G1 X58.301 Y127.611 F30000
G1 F8843.478
G1 X58.154 Y127.807 E.0079
G3 X55.673 Y123.21 I-2.148 J-1.809 E.35165
G3 X56.21 Y123.197 I.33 J2.674 E.0173
G3 X58.338 Y127.563 I-.205 J2.801 E.18863
G1 X57.963 Y127.38 F30000
G1 F8843.478
G1 X57.678 Y127.721 E.0143
G3 X55.722 Y123.614 I-1.673 J-1.722 E.29297
G3 X56.18 Y123.604 I.281 J2.28 E.01475
G3 X58.001 Y127.333 I-.175 J2.395 E.16116
G1 X57.641 Y127.156 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X57.407 Y127.442 E.01101
G3 X55.769 Y124.004 I-1.397 J-1.444 E.22685
G1 X55.95 Y123.99 E.00541
G3 X57.681 Y127.113 I.06 J2.008 E.13096
; WIPE_START
M204 S10000
G1 X57.407 Y127.442 E-.16294
G1 X57.091 Y127.689 E-.1523
G1 X56.734 Y127.871 E-.15209
G1 X56.544 Y127.935 E-.07619
G1 X56.15 Y128.005 E-.15207
G1 X55.981 Y128 E-.0644
; WIPE_END
G1 E-.04 F1800
G1 X62.873 Y131.279 Z.8 F30000
G1 X191.416 Y192.416 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X64.584 Y192.416 E4.07847
G1 X64.584 Y59.584 E4.27141
G1 X191.416 Y59.584 E4.07847
G1 X191.416 Y192.356 E4.26948
G1 X191.009 Y192.009 F30000
G1 F8843.478
G1 X64.991 Y192.009 E4.05229
G1 X64.991 Y59.991 E4.24523
G1 X191.009 Y59.991 E4.05229
G1 X191.009 Y191.949 E4.2433
G1 X190.602 Y191.602 F30000
G1 F8843.478
G1 X65.398 Y191.602 E4.02611
G1 X65.398 Y60.398 E4.21905
G1 X190.602 Y60.398 E4.02611
G1 X190.602 Y191.542 E4.21712
G1 X190.21 Y191.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X65.79 Y191.21 E3.70605
G1 X65.79 Y60.79 E3.88477
G1 X190.21 Y60.79 E3.70605
G1 X190.21 Y191.15 E3.88298
; WIPE_START
M204 S10000
G1 X188.21 Y191.151 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X182.996 Y185.577 Z.8 F30000
G1 X54.477 Y48.169 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X54.678 Y48.07 E.00718
G3 X55.624 Y47.805 I1.328 J2.929 E.03173
G3 X56.24 Y47.791 I.379 J3.073 E.01986
G3 X54.393 Y48.216 I-.235 J3.207 E.58783
G1 X54.425 Y48.198 E.00119
G1 X54.97 Y48.389 F30000
G1 F8843.478
G1 X55.106 Y48.338 E.00464
G3 X55.673 Y48.21 I.9 J2.66 E.01874
G3 X56.21 Y48.197 I.33 J2.677 E.0173
G3 X54.845 Y48.441 I-.205 J2.801 E.52237
G1 X54.915 Y48.412 E.00244
G1 X55.42 Y48.67 F30000
G1 F8843.478
G1 X55.468 Y48.658 E.0016
G3 X55.722 Y48.614 I.536 J2.34 E.00828
G3 X56.18 Y48.604 I.281 J2.281 E.01475
G3 X55.235 Y48.724 I-.175 J2.395 E.45432
G1 X55.362 Y48.687 E.00425
G1 X55.771 Y49.004 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X55.95 Y48.99 E.00533
G3 X55.712 Y49.012 I.059 J2.008 E.36889
; WIPE_START
M204 S10000
G1 X55.95 Y48.99 E-.0908
G1 X56.349 Y49.02 E-.15212
G1 X56.734 Y49.129 E-.15213
G1 X57.091 Y49.311 E-.15213
G1 X57.404 Y49.561 E-.15208
G1 X57.506 Y49.683 E-.06075
; WIPE_END
G1 E-.04 F1800
G1 X65.137 Y49.516 Z.8 F30000
G1 X126.477 Y48.169 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X126.678 Y48.069 E.0072
G3 X127.624 Y47.805 I1.328 J2.929 E.03172
G3 X128.24 Y47.791 I.379 J3.073 E.01986
G3 X126.393 Y48.216 I-.235 J3.207 E.58782
G1 X126.425 Y48.198 E.00119
G1 X126.97 Y48.389 F30000
G1 F8843.478
G1 X127.106 Y48.338 E.00465
G3 X127.673 Y48.21 I.9 J2.66 E.01874
G3 X128.21 Y48.197 I.33 J2.677 E.0173
G3 X126.845 Y48.441 I-.205 J2.801 E.52238
G1 X126.915 Y48.412 E.00242
G1 X127.42 Y48.67 F30000
G1 F8843.478
G1 X127.468 Y48.658 E.00161
G3 X127.722 Y48.614 I.536 J2.34 E.00828
G3 X128.18 Y48.604 I.281 J2.281 E.01475
G3 X127.235 Y48.724 I-.175 J2.395 E.45432
G1 X127.362 Y48.687 E.00425
G1 X127.771 Y49.004 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X127.95 Y48.99 E.00533
G3 X127.712 Y49.012 I.059 J2.008 E.36889
; WIPE_START
M204 S10000
G1 X127.95 Y48.99 E-.09079
G1 X128.349 Y49.02 E-.15212
G1 X128.734 Y49.129 E-.15213
G1 X129.091 Y49.311 E-.15214
G1 X129.404 Y49.561 E-.15208
G1 X129.506 Y49.683 E-.06075
; WIPE_END
G1 E-.04 F1800
G1 X137.137 Y49.516 Z.8 F30000
G1 X198.477 Y48.169 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X198.678 Y48.07 E.00722
G3 X199.624 Y47.805 I1.328 J2.929 E.03173
G3 X200.24 Y47.791 I.379 J3.073 E.01986
G3 X198.393 Y48.216 I-.235 J3.207 E.58782
G1 X198.424 Y48.199 E.00117
G1 X198.969 Y48.389 F30000
G1 F8843.478
G1 X199.106 Y48.338 E.00467
G3 X199.673 Y48.21 I.9 J2.66 E.01874
G3 X200.21 Y48.197 I.33 J2.677 E.0173
G3 X198.845 Y48.441 I-.205 J2.801 E.52237
G1 X198.914 Y48.412 E.0024
G1 X199.419 Y48.67 F30000
G1 F8843.478
G1 X199.468 Y48.658 E.00163
G3 X199.722 Y48.614 I.537 J2.34 E.00828
G3 X200.18 Y48.604 I.281 J2.281 E.01475
G3 X199.235 Y48.724 I-.175 J2.395 E.45431
G1 X199.361 Y48.687 E.00423
G1 X199.772 Y49.004 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X199.95 Y48.99 E.00533
G3 X199.712 Y49.012 I.059 J2.008 E.3689
; WIPE_START
M204 S10000
G1 X199.95 Y48.99 E-.09071
G1 X200.349 Y49.02 E-.15213
G1 X200.734 Y49.129 E-.1521
G1 X201.091 Y49.311 E-.15216
G1 X201.404 Y49.561 E-.15207
G1 X201.507 Y49.684 E-.06083
; WIPE_END
G1 E-.04 F1800
G1 X201.844 Y57.309 Z.8 F30000
G1 X208.584 Y209.584 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X47.416 Y209.584 E5.18256
G1 X47.416 Y42.416 E5.3755
G1 X208.584 Y42.416 E5.18256
G1 X208.584 Y209.524 E5.37357
G1 X208.991 Y209.991 F30000
G1 F8843.478
G1 X47.009 Y209.991 E5.20874
G1 X47.009 Y42.009 E5.40168
G1 X208.991 Y42.009 E5.20874
G1 X208.991 Y209.931 E5.39975
G1 X209.398 Y210.398 F30000
G1 F8843.478
G1 X46.602 Y210.398 E5.23492
G1 X46.602 Y41.602 E5.42786
G1 X209.398 Y41.602 E5.23492
G1 X209.398 Y210.338 E5.42593
G1 X209.79 Y210.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X46.21 Y210.79 E4.87249
G1 X46.21 Y41.21 E5.05121
G1 X209.79 Y41.21 E4.87249
G1 X209.79 Y210.73 E5.04942
; WIPE_START
M204 S10000
G1 X207.79 Y210.731 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X207.657 Y209.42 Z.8 F30000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42037
G1 F9537.687
G1 X208.251 Y208.827 E.02502
G1 X208.251 Y208.293 E.01592
G1 X207.293 Y209.251 E.04037
G1 X206.759 Y209.251 E.01592
G1 X208.251 Y207.759 E.06288
G1 X208.251 Y207.225 E.01592
G1 X206.225 Y209.251 E.08539
G1 X205.692 Y209.251 E.01592
G1 X208.251 Y206.692 E.1079
G1 X208.251 Y206.158 E.01592
G1 X205.158 Y209.251 E.13041
G1 X204.624 Y209.251 E.01592
G1 X208.251 Y205.624 E.15291
G1 X208.251 Y205.09 E.01592
G1 X204.09 Y209.251 E.17542
G1 X203.557 Y209.251 E.01592
G1 X208.251 Y204.556 E.19793
G1 X208.251 Y204.023 E.01592
G1 X203.023 Y209.251 E.22044
G1 X202.489 Y209.251 E.01592
G1 X208.251 Y203.489 E.24295
G1 X208.251 Y202.955 E.01592
G1 X201.955 Y209.251 E.26545
G1 X201.421 Y209.251 E.01592
G1 X208.251 Y202.421 E.28796
G1 X208.251 Y201.888 E.01592
G1 X200.888 Y209.251 E.31047
G1 X200.354 Y209.251 E.01592
G1 X208.251 Y201.354 E.33298
G1 X208.251 Y200.82 E.01592
G1 X199.82 Y209.251 E.35549
M73 P27 R50
G1 X199.286 Y209.251 E.01592
G1 X208.251 Y200.286 E.37799
G1 X208.251 Y199.752 E.01592
G1 X198.752 Y209.251 E.4005
G1 X198.219 Y209.251 E.01592
G1 X208.251 Y199.219 E.42301
G1 X208.251 Y198.685 E.01592
G1 X197.685 Y209.251 E.44552
G1 X197.151 Y209.251 E.01592
G1 X208.251 Y198.151 E.46803
G1 X208.251 Y197.617 E.01592
G1 X196.617 Y209.251 E.49053
M73 P27 R49
G1 X196.083 Y209.251 E.01592
G1 X200.901 Y204.433 E.20314
G3 X200.258 Y204.542 I-1.147 J-4.811 E.01946
G1 X195.55 Y209.251 E.19854
G1 X195.016 Y209.251 E.01592
G1 X199.729 Y204.537 E.19875
G3 X199.261 Y204.472 I.092 J-2.375 E.01413
G1 X194.482 Y209.251 E.20151
G1 X193.948 Y209.251 E.01592
G1 X198.842 Y204.356 E.20637
G3 X198.465 Y204.199 I.595 J-1.962 E.01219
G1 X193.414 Y209.251 E.21298
G1 X192.881 Y209.251 E.01592
G1 X198.122 Y204.01 E.22099
G3 X197.808 Y203.789 I.945 J-1.677 E.01144
G1 X192.347 Y209.251 E.23028
G1 X191.813 Y209.251 E.01592
G1 X197.524 Y203.54 E.2408
G3 X197.268 Y203.262 I1.259 J-1.418 E.01128
G1 X191.279 Y209.251 E.25251
G1 X190.745 Y209.251 E.01592
G1 X197.04 Y202.956 E.26543
G3 X196.843 Y202.619 I1.583 J-1.155 E.01165
G1 X190.212 Y209.251 E.27961
G1 X189.678 Y209.251 E.01592
G1 X196.678 Y202.251 E.29516
G3 X196.551 Y201.843 I5.909 J-2.054 E.01272
G1 X189.144 Y209.251 E.31234
G1 X188.61 Y209.251 E.01592
G1 X196.474 Y201.387 E.33157
G3 X196.453 Y200.874 I2.552 J-.361 E.01533
G1 X188.076 Y209.251 E.3532
G1 X187.543 Y209.251 E.01592
G1 X196.53 Y200.263 E.37896
G3 X196.8 Y199.459 I3.742 J.809 E.02533
G1 X187.009 Y209.251 E.41285
G1 X186.475 Y209.251 E.01592
G1 X208.251 Y187.475 E.91818
G1 X208.251 Y188.009 E.01592
G1 X198.452 Y197.807 E.41317
G3 X199.266 Y197.527 I1.274 J2.377 E.02578
G1 X208.251 Y188.543 E.37884
G1 X208.251 Y189.076 E.01592
G1 X199.875 Y197.452 E.35317
G3 X200.387 Y197.474 I.072 J4.423 E.0153
G1 X208.251 Y189.61 E.33156
G1 X208.251 Y190.144 E.01592
G1 X200.841 Y197.554 E.31243
G3 X201.25 Y197.678 I-.418 J2.108 E.01278
G1 X208.251 Y190.678 E.29517
G1 X208.251 Y191.212 E.01592
G1 X201.622 Y197.84 E.27951
G3 X201.957 Y198.038 I-.822 J1.776 E.01164
G1 X208.251 Y191.745 E.26535
G1 X208.251 Y192.279 E.01592
G1 X202.263 Y198.266 E.25246
G3 X202.541 Y198.523 I-1.143 J1.513 E.01128
G1 X208.251 Y192.813 E.24077
G1 X208.251 Y193.347 E.01592
G1 X202.79 Y198.808 E.23027
G3 X203.009 Y199.122 I-1.458 J1.255 E.01145
G1 X208.251 Y193.881 E.221
G1 X208.251 Y194.414 E.01592
G1 X203.199 Y199.466 E.21302
G3 X203.354 Y199.844 I-1.813 J.968 E.01221
G1 X208.251 Y194.948 E.20646
G1 X208.251 Y195.482 E.01592
G1 X203.472 Y200.26 E.20149
G3 X203.538 Y200.728 I-4.768 J.911 E.01409
G1 X208.251 Y196.016 E.19871
G1 X208.251 Y196.55 E.01592
G1 X203.539 Y201.262 E.19868
G3 X203.43 Y201.904 I-3.703 J-.294 E.01944
G1 X208.42 Y196.914 E.2104
G1 X208.42 Y46.917 F30000
G1 F9537.687
G1 X203.429 Y51.908 E.21045
G2 X203.538 Y51.265 I-3.616 J-.945 E.01947
G1 X208.251 Y46.553 E.19869
G1 X208.251 Y46.019 E.01592
G1 X203.538 Y50.732 E.1987
G2 X203.473 Y50.263 I-4.871 J.441 E.01411
G1 X208.251 Y45.486 E.20146
G1 X208.251 Y44.952 E.01592
G1 X203.355 Y49.847 E.20641
G2 X203.2 Y49.469 I-1.968 J.588 E.01222
G1 X208.251 Y44.418 E.21297
G1 X208.251 Y43.884 E.01592
G1 X203.011 Y49.124 E.22094
G2 X202.791 Y48.81 I-1.684 J.943 E.01145
G1 X208.251 Y43.35 E.2302
G1 X208.251 Y42.817 E.01592
G1 X202.542 Y48.525 E.24069
G2 X202.265 Y48.268 I-1.419 J1.253 E.01128
G1 X207.784 Y42.749 E.2327
G1 X207.25 Y42.749 E.01592
G1 X201.96 Y48.04 E.22308
G2 X201.624 Y47.842 I-1.159 J1.578 E.01164
G1 X206.716 Y42.749 E.21472
G1 X206.183 Y42.749 E.01592
G1 X201.253 Y47.679 E.20786
G2 X200.844 Y47.554 I-.828 J1.981 E.01277
G1 X205.649 Y42.749 E.2026
G1 X205.115 Y42.749 E.01592
G1 X200.39 Y47.474 E.19921
G2 X199.879 Y47.452 I-.449 J4.466 E.01528
G1 X204.581 Y42.749 E.19828
G1 X204.047 Y42.749 E.01592
G1 X199.27 Y47.526 E.20142
G2 X198.459 Y47.804 I.446 J2.631 E.02567
G1 X203.514 Y42.749 E.21311
G1 X202.98 Y42.749 E.01592
G1 X186.479 Y59.251 E.69578
G1 X187.013 Y59.251 E.01592
G1 X196.797 Y49.466 E.41258
G2 X196.529 Y50.268 I3.454 J1.601 E.02526
G1 X187.546 Y59.251 E.37877
G1 X188.08 Y59.251 E.01592
G1 X196.453 Y50.878 E.35304
G2 X196.474 Y51.39 I2.573 J.15 E.01532
G1 X188.614 Y59.251 E.33143
G1 X189.148 Y59.251 E.01592
G1 X196.552 Y51.846 E.31221
G2 X196.679 Y52.253 I6.052 J-1.66 E.01271
G1 X189.681 Y59.251 E.29505
G1 X190.215 Y59.251 E.01592
G1 X196.844 Y52.622 E.27951
G2 X197.042 Y52.958 I1.776 J-.818 E.01165
G1 X190.749 Y59.251 E.26533
G1 X191.283 Y59.251 E.01592
G1 X197.269 Y53.264 E.25242
G2 X197.526 Y53.542 I1.513 J-1.14 E.01128
G1 X191.749 Y59.318 E.24355
G1 X191.749 Y59.852 E.01592
G1 X197.81 Y53.791 E.25556
G2 X198.124 Y54.011 I1.259 J-1.459 E.01144
G1 X191.749 Y60.385 E.26878
G1 X191.749 Y60.919 E.01592
G1 X198.468 Y54.201 E.28329
G2 X198.845 Y54.357 I.973 J-1.81 E.0122
G1 X191.749 Y61.453 E.29919
G1 X191.749 Y61.987 E.01592
G1 X199.264 Y54.472 E.31686
G2 X199.733 Y54.537 I.559 J-2.306 E.01413
G1 X191.749 Y62.52 E.33662
G1 X191.749 Y63.054 E.01592
G1 X200.262 Y54.542 E.35894
G2 X200.906 Y54.432 I-.533 J-5.056 E.01949
G1 X191.749 Y63.588 E.38609
G1 X191.749 Y64.122 E.01592
G1 X208.251 Y47.621 E.69578
G1 X208.251 Y48.155 E.01592
G1 X191.749 Y64.656 E.69578
G1 X191.749 Y65.189 E.01592
G1 X208.251 Y48.688 E.69578
G1 X208.251 Y49.222 E.01592
G1 X191.749 Y65.723 E.69578
G1 X191.749 Y66.257 E.01592
G1 X208.251 Y49.756 E.69578
G1 X208.251 Y50.29 E.01592
G1 X191.749 Y66.791 E.69578
G1 X191.749 Y67.325 E.01592
G1 X208.251 Y50.824 E.69578
G1 X208.251 Y51.357 E.01592
G1 X191.749 Y67.858 E.69578
G1 X191.749 Y68.392 E.01592
G1 X208.251 Y51.891 E.69578
G1 X208.251 Y52.425 E.01592
G1 X191.749 Y68.926 E.69578
G1 X191.749 Y69.46 E.01592
G1 X208.251 Y52.959 E.69578
G1 X208.251 Y53.493 E.01592
G1 X191.749 Y69.994 E.69578
G1 X191.749 Y70.527 E.01592
G1 X208.251 Y54.026 E.69578
G1 X208.251 Y54.56 E.01592
G1 X191.749 Y71.061 E.69578
G1 X191.749 Y71.595 E.01592
G1 X208.251 Y55.094 E.69578
G1 X208.251 Y55.628 E.01592
G1 X191.749 Y72.129 E.69578
G1 X191.749 Y72.663 E.01592
G1 X208.251 Y56.162 E.69578
G1 X208.251 Y56.695 E.01592
G1 X191.749 Y73.196 E.69578
G1 X191.749 Y73.73 E.01592
G1 X208.251 Y57.229 E.69578
G1 X208.251 Y57.763 E.01592
G1 X191.749 Y74.264 E.69578
G1 X191.749 Y74.798 E.01592
G1 X208.251 Y58.297 E.69578
G1 X208.251 Y58.83 E.01592
G1 X191.749 Y75.332 E.69578
G1 X191.749 Y75.865 E.01592
G1 X208.251 Y59.364 E.69578
G1 X208.251 Y59.898 E.01592
G1 X191.749 Y76.399 E.69578
G1 X191.749 Y76.933 E.01592
G1 X208.251 Y60.432 E.69578
G1 X208.251 Y60.966 E.01592
G1 X191.749 Y77.467 E.69578
G1 X191.749 Y78.001 E.01592
G1 X208.251 Y61.499 E.69578
G1 X208.251 Y62.033 E.01592
G1 X191.749 Y78.534 E.69578
G1 X191.749 Y79.068 E.01592
G1 X208.251 Y62.567 E.69578
G1 X208.251 Y63.101 E.01592
G1 X191.749 Y79.602 E.69578
G1 X191.749 Y80.136 E.01592
G1 X208.251 Y63.635 E.69578
G1 X208.251 Y64.168 E.01592
G1 X191.749 Y80.67 E.69578
G1 X191.749 Y81.203 E.01592
G1 X208.251 Y64.702 E.69578
G1 X208.251 Y65.236 E.01592
G1 X191.749 Y81.737 E.69578
G1 X191.749 Y82.271 E.01592
G1 X208.251 Y65.77 E.69578
G1 X208.251 Y66.304 E.01592
G1 X191.749 Y82.805 E.69578
G1 X191.749 Y83.338 E.01592
G1 X208.251 Y66.837 E.69578
G1 X208.251 Y67.371 E.01592
G1 X191.749 Y83.872 E.69578
G1 X191.749 Y84.406 E.01592
G1 X208.251 Y67.905 E.69578
G1 X208.251 Y68.439 E.01592
G1 X191.749 Y84.94 E.69578
G1 X191.749 Y85.474 E.01592
G1 X208.251 Y68.973 E.69578
G1 X208.251 Y69.506 E.01592
G1 X191.749 Y86.007 E.69578
G1 X191.749 Y86.541 E.01592
G1 X208.251 Y70.04 E.69578
G1 X208.251 Y70.574 E.01592
G1 X191.749 Y87.075 E.69578
G1 X191.749 Y87.609 E.01592
G1 X208.251 Y71.108 E.69578
G1 X208.251 Y71.642 E.01592
G1 X191.749 Y88.143 E.69578
G1 X191.749 Y88.676 E.01592
G1 X208.251 Y72.175 E.69578
G1 X208.251 Y72.709 E.01592
G1 X191.749 Y89.21 E.69578
G1 X191.749 Y89.744 E.01592
G1 X208.251 Y73.243 E.69578
G1 X208.251 Y73.777 E.01592
G1 X191.749 Y90.278 E.69578
G1 X191.749 Y90.812 E.01592
G1 X208.251 Y74.311 E.69578
G1 X208.251 Y74.844 E.01592
G1 X191.749 Y91.345 E.69578
G1 X191.749 Y91.879 E.01592
G1 X208.251 Y75.378 E.69578
G1 X208.251 Y75.912 E.01592
G1 X191.749 Y92.413 E.69578
G1 X191.749 Y92.947 E.01592
G1 X208.251 Y76.446 E.69578
G1 X208.251 Y76.98 E.01592
G1 X191.749 Y93.481 E.69578
G1 X191.749 Y94.014 E.01592
G1 X208.251 Y77.513 E.69578
G1 X208.251 Y78.047 E.01592
G1 X191.749 Y94.548 E.69578
G1 X191.749 Y95.082 E.01592
G1 X208.251 Y78.581 E.69578
G1 X208.251 Y79.115 E.01592
G1 X191.749 Y95.616 E.69578
G1 X191.749 Y96.15 E.01592
G1 X208.251 Y79.648 E.69578
G1 X208.251 Y80.182 E.01592
G1 X191.749 Y96.683 E.69578
G1 X191.749 Y97.217 E.01592
G1 X208.251 Y80.716 E.69578
G1 X208.251 Y81.25 E.01592
G1 X191.749 Y97.751 E.69578
G1 X191.749 Y98.285 E.01592
G1 X208.251 Y81.784 E.69578
G1 X208.251 Y82.317 E.01592
G1 X191.749 Y98.819 E.69578
G1 X191.749 Y99.352 E.01592
G1 X208.251 Y82.851 E.69578
G1 X208.251 Y83.385 E.01592
G1 X191.749 Y99.886 E.69578
G1 X191.749 Y100.42 E.01592
G1 X208.251 Y83.919 E.69578
G1 X208.251 Y84.453 E.01592
G1 X191.749 Y100.954 E.69578
G1 X191.749 Y101.488 E.01592
G1 X208.251 Y84.986 E.69578
G1 X208.251 Y85.52 E.01592
G1 X191.749 Y102.021 E.69578
G1 X191.749 Y102.555 E.01592
G1 X208.251 Y86.054 E.69578
G1 X208.251 Y86.588 E.01592
G1 X191.749 Y103.089 E.69578
G1 X191.749 Y103.623 E.01592
G1 X208.251 Y87.122 E.69578
G1 X208.251 Y87.655 E.01592
G1 X191.749 Y104.156 E.69578
G1 X191.749 Y104.69 E.01592
G1 X208.251 Y88.189 E.69578
G1 X208.251 Y88.723 E.01592
G1 X191.749 Y105.224 E.69578
G1 X191.749 Y105.758 E.01592
G1 X208.251 Y89.257 E.69578
G1 X208.251 Y89.791 E.01592
G1 X191.749 Y106.292 E.69578
G1 X191.749 Y106.825 E.01592
G1 X208.251 Y90.324 E.69578
G1 X208.251 Y90.858 E.01592
G1 X191.749 Y107.359 E.69578
G1 X191.749 Y107.893 E.01592
G1 X208.251 Y91.392 E.69578
G1 X208.251 Y91.926 E.01592
G1 X191.749 Y108.427 E.69578
G1 X191.749 Y108.961 E.01592
G1 X208.251 Y92.46 E.69578
G1 X208.251 Y92.993 E.01592
G1 X191.749 Y109.494 E.69578
G1 X191.749 Y110.028 E.01592
G1 X208.251 Y93.527 E.69578
G1 X208.251 Y94.061 E.01592
G1 X191.749 Y110.562 E.69578
G1 X191.749 Y111.096 E.01592
G1 X208.251 Y94.595 E.69578
G1 X208.251 Y95.129 E.01592
G1 X191.749 Y111.63 E.69578
G1 X191.749 Y112.163 E.01592
G1 X208.251 Y95.662 E.69578
G1 X208.251 Y96.196 E.01592
G1 X191.749 Y112.697 E.69578
G1 X191.749 Y113.231 E.01592
G1 X208.251 Y96.73 E.69578
G1 X208.251 Y97.264 E.01592
G1 X191.749 Y113.765 E.69578
G1 X191.749 Y114.299 E.01592
G1 X208.251 Y97.798 E.69578
G1 X208.251 Y98.331 E.01592
G1 X191.749 Y114.832 E.69578
G1 X191.749 Y115.366 E.01592
G1 X208.251 Y98.865 E.69578
G1 X208.251 Y99.399 E.01592
G1 X191.749 Y115.9 E.69578
G1 X191.749 Y116.434 E.01592
G1 X208.251 Y99.933 E.69578
G1 X208.251 Y100.466 E.01592
G1 X191.749 Y116.968 E.69578
G1 X191.749 Y117.501 E.01592
G1 X208.251 Y101 E.69578
G1 X208.251 Y101.534 E.01592
G1 X191.749 Y118.035 E.69578
G1 X191.749 Y118.569 E.01592
G1 X208.251 Y102.068 E.69578
G1 X208.251 Y102.602 E.01592
G1 X191.749 Y119.103 E.69578
G1 X191.749 Y119.637 E.01592
G1 X208.251 Y103.135 E.69578
G1 X208.251 Y103.669 E.01592
G1 X191.749 Y120.17 E.69578
G1 X191.749 Y120.704 E.01592
G1 X208.251 Y104.203 E.69578
G1 X208.251 Y104.737 E.01592
G1 X191.749 Y121.238 E.69578
G1 X191.749 Y121.772 E.01592
G1 X208.251 Y105.271 E.69578
G1 X208.251 Y105.804 E.01592
G1 X191.749 Y122.306 E.69578
G1 X191.749 Y122.839 E.01592
G1 X208.251 Y106.338 E.69578
G1 X208.251 Y106.872 E.01592
G1 X191.749 Y123.373 E.69578
G1 X191.749 Y123.907 E.01592
G1 X208.251 Y107.406 E.69578
G1 X208.251 Y107.94 E.01592
G1 X191.749 Y124.441 E.69578
G1 X191.749 Y124.974 E.01592
G1 X208.251 Y108.473 E.69578
G1 X208.251 Y109.007 E.01592
G1 X191.749 Y125.508 E.69578
G1 X191.749 Y126.042 E.01592
G1 X208.251 Y109.541 E.69578
G1 X208.251 Y110.075 E.01592
G1 X191.749 Y126.576 E.69578
G1 X191.749 Y127.11 E.01592
G1 X208.251 Y110.609 E.69578
G1 X208.251 Y111.142 E.01592
G1 X191.749 Y127.643 E.69578
G1 X191.749 Y128.177 E.01592
G1 X208.251 Y111.676 E.69578
G1 X208.251 Y112.21 E.01592
G1 X191.58 Y128.881 E.70294
G1 X191.58 Y139.023 F30000
G1 F9537.687
G1 X201.296 Y129.307 E.40969
G3 X200.565 Y129.504 I-1.469 J-3.987 E.02262
G1 X191.749 Y138.319 E.3717
G1 X191.749 Y137.786 E.01592
G1 X199.986 Y129.549 E.34732
G3 X199.489 Y129.512 I.069 J-4.3 E.01487
G1 X191.749 Y137.252 E.32636
G1 X191.749 Y136.718 E.01592
G1 X199.05 Y129.418 E.30783
G3 X198.652 Y129.282 I.481 J-2.057 E.01256
G1 X191.749 Y136.184 E.29105
G1 X191.749 Y135.65 E.01592
G1 X198.29 Y129.11 E.2758
G3 X197.961 Y128.906 I.855 J-1.749 E.01158
G1 X191.749 Y135.117 E.26189
G1 X191.749 Y134.583 E.01592
G1 X197.661 Y128.672 E.24925
G3 X197.39 Y128.408 I10.638 J-11.2 E.01126
G1 X191.749 Y134.049 E.23785
G1 X191.749 Y133.515 E.01592
G1 X197.149 Y128.116 E.22768
G3 X196.938 Y127.793 I1.503 J-1.218 E.01151
G1 X191.749 Y132.981 E.21876
G1 X191.749 Y132.448 E.01592
G1 X196.757 Y127.44 E.21116
G3 X196.612 Y127.051 I1.869 J-.92 E.01239
G1 X191.749 Y131.914 E.20504
G1 X191.749 Y131.38 E.01592
G1 X196.507 Y126.623 E.2006
G3 X196.453 Y126.143 I4.668 J-.769 E.0144
G1 X191.749 Y130.846 E.19832
G1 X191.749 Y130.312 E.01592
G1 X196.477 Y125.585 E.19932
G3 X196.627 Y124.901 I3.628 J.438 E.02091
G1 X191.749 Y129.779 E.20565
G1 X191.749 Y129.245 E.01592
G1 X208.251 Y112.744 E.69578
G1 X208.251 Y113.278 E.01592
G1 X198.905 Y122.623 E.39407
G3 X199.588 Y122.474 I1.39 J4.715 E.02087
G1 X208.251 Y113.811 E.36526
G1 X208.251 Y114.345 E.01592
G1 X200.141 Y122.455 E.34197
G3 X200.625 Y122.504 I-.292 J5.295 E.01453
G1 X208.251 Y114.879 E.32153
G1 X208.251 Y115.413 E.01592
G1 X201.052 Y122.611 E.30354
G3 X201.439 Y122.758 I-.539 J2.011 E.01237
G1 X208.251 Y115.947 E.2872
G1 X208.251 Y116.48 E.01592
G1 X201.792 Y122.939 E.27232
G3 X202.114 Y123.151 I-.898 J1.712 E.01151
G1 X208.251 Y117.014 E.25876
G1 X208.251 Y117.548 E.01592
G1 X202.406 Y123.392 E.24644
G3 X202.67 Y123.662 I-1.217 J1.453 E.01127
G1 X208.251 Y118.082 E.23531
G1 X208.251 Y118.616 E.01592
G1 X202.905 Y123.961 E.22539
G3 X203.111 Y124.289 I-1.536 J1.194 E.01156
G1 X208.251 Y119.149 E.2167
G1 X208.251 Y119.683 E.01592
G1 X203.284 Y124.65 E.20944
G3 X203.418 Y125.049 I-1.93 J.874 E.01258
G1 X208.251 Y120.217 E.20376
G1 X208.251 Y120.751 E.01592
G1 X203.511 Y125.491 E.19987
G3 X203.551 Y125.984 I-2.452 J.449 E.01479
G1 X208.251 Y121.284 E.19817
G1 X208.251 Y121.818 E.01592
G1 X203.502 Y126.567 E.20023
G3 X203.301 Y127.301 I-3.613 J-.592 E.02274
G1 X208.251 Y122.352 E.20869
G1 X208.251 Y122.886 E.01592
G1 X191.749 Y139.387 E.69578
G1 X191.749 Y139.921 E.01592
G1 X208.251 Y123.42 E.69578
G1 X208.251 Y123.953 E.01592
G1 X191.749 Y140.455 E.69578
G1 X191.749 Y140.988 E.01592
M73 P28 R49
G1 X208.251 Y124.487 E.69578
G1 X208.251 Y125.021 E.01592
G1 X191.749 Y141.522 E.69578
G1 X191.749 Y142.056 E.01592
G1 X208.251 Y125.555 E.69578
G1 X208.251 Y126.089 E.01592
G1 X191.749 Y142.59 E.69578
G1 X191.749 Y143.124 E.01592
G1 X208.251 Y126.622 E.69578
G1 X208.251 Y127.156 E.01592
G1 X191.749 Y143.657 E.69578
G1 X191.749 Y144.191 E.01592
G1 X208.251 Y127.69 E.69578
G1 X208.251 Y128.224 E.01592
G1 X191.749 Y144.725 E.69578
G1 X191.749 Y145.259 E.01592
G1 X208.251 Y128.758 E.69578
G1 X208.251 Y129.291 E.01592
G1 X191.749 Y145.792 E.69578
G1 X191.749 Y146.326 E.01592
G1 X208.251 Y129.825 E.69578
G1 X208.251 Y130.359 E.01592
G1 X191.749 Y146.86 E.69578
G1 X191.749 Y147.394 E.01592
G1 X208.251 Y130.893 E.69578
G1 X208.251 Y131.427 E.01592
G1 X191.749 Y147.928 E.69578
G1 X191.749 Y148.461 E.01592
G1 X208.251 Y131.96 E.69578
G1 X208.251 Y132.494 E.01592
G1 X191.749 Y148.995 E.69578
G1 X191.749 Y149.529 E.01592
G1 X208.251 Y133.028 E.69578
G1 X208.251 Y133.562 E.01592
G1 X191.749 Y150.063 E.69578
G1 X191.749 Y150.597 E.01592
G1 X208.251 Y134.096 E.69578
G1 X208.251 Y134.629 E.01592
G1 X191.749 Y151.13 E.69578
G1 X191.749 Y151.664 E.01592
G1 X208.251 Y135.163 E.69578
G1 X208.251 Y135.697 E.01592
G1 X191.749 Y152.198 E.69578
G1 X191.749 Y152.732 E.01592
G1 X208.251 Y136.231 E.69578
G1 X208.251 Y136.765 E.01592
G1 X191.749 Y153.266 E.69578
G1 X191.749 Y153.799 E.01592
G1 X208.251 Y137.298 E.69578
G1 X208.251 Y137.832 E.01592
G1 X191.749 Y154.333 E.69578
G1 X191.749 Y154.867 E.01592
G1 X208.251 Y138.366 E.69578
G1 X208.251 Y138.9 E.01592
G1 X191.749 Y155.401 E.69578
G1 X191.749 Y155.935 E.01592
G1 X208.251 Y139.434 E.69578
G1 X208.251 Y139.967 E.01592
G1 X191.749 Y156.468 E.69578
G1 X191.749 Y157.002 E.01592
G1 X208.251 Y140.501 E.69578
G1 X208.251 Y141.035 E.01592
G1 X191.749 Y157.536 E.69578
G1 X191.749 Y158.07 E.01592
G1 X208.251 Y141.569 E.69578
G1 X208.251 Y142.102 E.01592
G1 X191.749 Y158.604 E.69578
G1 X191.749 Y159.137 E.01592
G1 X208.251 Y142.636 E.69578
G1 X208.251 Y143.17 E.01592
G1 X191.749 Y159.671 E.69578
G1 X191.749 Y160.205 E.01592
G1 X208.251 Y143.704 E.69578
G1 X208.251 Y144.238 E.01592
G1 X191.749 Y160.739 E.69578
G1 X191.749 Y161.273 E.01592
G1 X208.251 Y144.771 E.69578
G1 X208.251 Y145.305 E.01592
G1 X191.749 Y161.806 E.69578
G1 X191.749 Y162.34 E.01592
G1 X208.251 Y145.839 E.69578
G1 X208.251 Y146.373 E.01592
G1 X191.749 Y162.874 E.69578
G1 X191.749 Y163.408 E.01592
G1 X208.251 Y146.907 E.69578
G1 X208.251 Y147.44 E.01592
G1 X191.749 Y163.942 E.69578
G1 X191.749 Y164.475 E.01592
G1 X208.251 Y147.974 E.69578
G1 X208.251 Y148.508 E.01592
G1 X191.749 Y165.009 E.69578
G1 X191.749 Y165.543 E.01592
G1 X208.251 Y149.042 E.69578
G1 X208.251 Y149.576 E.01592
G1 X191.749 Y166.077 E.69578
G1 X191.749 Y166.61 E.01592
G1 X208.251 Y150.109 E.69578
G1 X208.251 Y150.643 E.01592
G1 X191.749 Y167.144 E.69578
G1 X191.749 Y167.678 E.01592
G1 X208.251 Y151.177 E.69578
G1 X208.251 Y151.711 E.01592
G1 X191.749 Y168.212 E.69578
G1 X191.749 Y168.746 E.01592
G1 X208.251 Y152.245 E.69578
G1 X208.251 Y152.778 E.01592
G1 X191.749 Y169.279 E.69578
G1 X191.749 Y169.813 E.01592
G1 X208.251 Y153.312 E.69578
G1 X208.251 Y153.846 E.01592
G1 X191.749 Y170.347 E.69578
G1 X191.749 Y170.881 E.01592
G1 X208.251 Y154.38 E.69578
G1 X208.251 Y154.914 E.01592
G1 X191.749 Y171.415 E.69578
G1 X191.749 Y171.948 E.01592
G1 X208.251 Y155.447 E.69578
G1 X208.251 Y155.981 E.01592
G1 X191.749 Y172.482 E.69578
G1 X191.749 Y173.016 E.01592
G1 X208.251 Y156.515 E.69578
G1 X208.251 Y157.049 E.01592
G1 X191.749 Y173.55 E.69578
G1 X191.749 Y174.084 E.01592
G1 X208.251 Y157.583 E.69578
G1 X208.251 Y158.116 E.01592
G1 X191.749 Y174.617 E.69578
G1 X191.749 Y175.151 E.01592
G1 X208.251 Y158.65 E.69578
G1 X208.251 Y159.184 E.01592
G1 X191.749 Y175.685 E.69578
G1 X191.749 Y176.219 E.01592
G1 X208.251 Y159.718 E.69578
G1 X208.251 Y160.252 E.01592
G1 X191.749 Y176.753 E.69578
G1 X191.749 Y177.286 E.01592
G1 X208.251 Y160.785 E.69578
G1 X208.251 Y161.319 E.01592
G1 X191.749 Y177.82 E.69578
G1 X191.749 Y178.354 E.01592
G1 X208.251 Y161.853 E.69578
G1 X208.251 Y162.387 E.01592
G1 X191.749 Y178.888 E.69578
G1 X191.749 Y179.422 E.01592
G1 X208.251 Y162.92 E.69578
G1 X208.251 Y163.454 E.01592
G1 X191.749 Y179.955 E.69578
G1 X191.749 Y180.489 E.01592
G1 X208.251 Y163.988 E.69578
G1 X208.251 Y164.522 E.01592
G1 X191.749 Y181.023 E.69578
G1 X191.749 Y181.557 E.01592
G1 X208.251 Y165.056 E.69578
G1 X208.251 Y165.589 E.01592
G1 X191.749 Y182.091 E.69578
G1 X191.749 Y182.624 E.01592
G1 X208.251 Y166.123 E.69578
G1 X208.251 Y166.657 E.01592
G1 X191.749 Y183.158 E.69578
G1 X191.749 Y183.692 E.01592
G1 X208.251 Y167.191 E.69578
G1 X208.251 Y167.725 E.01592
G1 X191.749 Y184.226 E.69578
G1 X191.749 Y184.759 E.01592
G1 X208.251 Y168.258 E.69578
G1 X208.251 Y168.792 E.01592
G1 X191.749 Y185.293 E.69578
G1 X191.749 Y185.827 E.01592
G1 X208.251 Y169.326 E.69578
G1 X208.251 Y169.86 E.01592
G1 X191.749 Y186.361 E.69578
G1 X191.749 Y186.895 E.01592
G1 X208.251 Y170.394 E.69578
G1 X208.251 Y170.927 E.01592
G1 X191.749 Y187.428 E.69578
G1 X191.749 Y187.962 E.01592
G1 X208.251 Y171.461 E.69578
G1 X208.251 Y171.995 E.01592
G1 X191.749 Y188.496 E.69578
G1 X191.749 Y189.03 E.01592
G1 X208.251 Y172.529 E.69578
G1 X208.251 Y173.063 E.01592
G1 X191.749 Y189.564 E.69578
G1 X191.749 Y190.097 E.01592
G1 X208.251 Y173.596 E.69578
G1 X208.251 Y174.13 E.01592
G1 X191.749 Y190.631 E.69578
G1 X191.749 Y191.165 E.01592
G1 X208.251 Y174.664 E.69578
G1 X208.251 Y175.198 E.01592
G1 X191.749 Y191.699 E.69578
G1 X191.749 Y192.233 E.01592
G1 X208.251 Y175.732 E.69578
G1 X208.251 Y176.265 E.01592
G1 X175.265 Y209.251 E1.39085
G1 X175.799 Y209.251 E.01592
G1 X208.251 Y176.799 E1.36834
G1 X208.251 Y177.333 E.01592
G1 X176.333 Y209.251 E1.34584
G1 X176.867 Y209.251 E.01592
G1 X208.251 Y177.867 E1.32333
G1 X208.251 Y178.401 E.01592
G1 X177.401 Y209.251 E1.30082
G1 X177.934 Y209.251 E.01592
G1 X208.251 Y178.934 E1.27831
G1 X208.251 Y179.468 E.01592
G1 X178.468 Y209.251 E1.2558
G1 X179.002 Y209.251 E.01592
G1 X208.251 Y180.002 E1.2333
G1 X208.251 Y180.536 E.01592
G1 X179.536 Y209.251 E1.21079
G1 X180.07 Y209.251 E.01592
G1 X208.251 Y181.07 E1.18828
G1 X208.251 Y181.603 E.01592
G1 X180.603 Y209.251 E1.16577
G1 X181.137 Y209.251 E.01592
G1 X208.251 Y182.137 E1.14326
G1 X208.251 Y182.671 E.01592
G1 X181.671 Y209.251 E1.12076
G1 X182.205 Y209.251 E.01592
G1 X208.251 Y183.205 E1.09825
G1 X208.251 Y183.738 E.01592
G1 X182.738 Y209.251 E1.07574
G1 X183.272 Y209.251 E.01592
G1 X208.251 Y184.272 E1.05323
G1 X208.251 Y184.806 E.01592
G1 X183.806 Y209.251 E1.03072
G1 X184.34 Y209.251 E.01592
G1 X208.251 Y185.34 E1.00822
G1 X208.251 Y185.874 E.01592
G1 X184.874 Y209.251 E.98571
G1 X185.407 Y209.251 E.01592
G1 X208.251 Y186.407 E.9632
G1 X208.251 Y186.941 E.01592
G1 X185.772 Y209.42 E.94785
G1 X174.562 Y209.42 F30000
G1 F9537.687
G1 X191.233 Y192.749 E.70294
G1 X190.699 Y192.749 E.01592
G1 X174.198 Y209.251 E.69578
G1 X173.664 Y209.251 E.01592
G1 X190.165 Y192.749 E.69578
G1 X189.631 Y192.749 E.01592
G1 X173.13 Y209.251 E.69578
G1 X172.596 Y209.251 E.01592
G1 X189.097 Y192.749 E.69578
G1 X188.564 Y192.749 E.01592
G1 X172.063 Y209.251 E.69578
G1 X171.529 Y209.251 E.01592
G1 X188.03 Y192.749 E.69578
G1 X187.496 Y192.749 E.01592
G1 X170.995 Y209.251 E.69578
G1 X170.461 Y209.251 E.01592
G1 X186.962 Y192.749 E.69578
G1 X186.428 Y192.749 E.01592
G1 X169.927 Y209.251 E.69578
G1 X169.394 Y209.251 E.01592
G1 X185.895 Y192.749 E.69578
G1 X185.361 Y192.749 E.01592
G1 X168.86 Y209.251 E.69578
G1 X168.326 Y209.251 E.01592
G1 X184.827 Y192.749 E.69578
G1 X184.293 Y192.749 E.01592
G1 X167.792 Y209.251 E.69578
G1 X167.258 Y209.251 E.01592
G1 X183.76 Y192.749 E.69578
G1 X183.226 Y192.749 E.01592
G1 X166.725 Y209.251 E.69578
G1 X166.191 Y209.251 E.01592
G1 X182.692 Y192.749 E.69578
G1 X182.158 Y192.749 E.01592
G1 X165.657 Y209.251 E.69578
G1 X165.123 Y209.251 E.01592
G1 X181.624 Y192.749 E.69578
G1 X181.091 Y192.749 E.01592
G1 X164.589 Y209.251 E.69578
G1 X164.056 Y209.251 E.01592
G1 X180.557 Y192.749 E.69578
G1 X180.023 Y192.749 E.01592
G1 X163.522 Y209.251 E.69578
G1 X162.988 Y209.251 E.01592
G1 X179.489 Y192.749 E.69578
G1 X178.955 Y192.749 E.01592
G1 X162.454 Y209.251 E.69578
G1 X161.92 Y209.251 E.01592
G1 X178.422 Y192.749 E.69578
G1 X177.888 Y192.749 E.01592
G1 X161.387 Y209.251 E.69578
G1 X160.853 Y209.251 E.01592
G1 X177.354 Y192.749 E.69578
G1 X176.82 Y192.749 E.01592
G1 X160.319 Y209.251 E.69578
G1 X159.785 Y209.251 E.01592
G1 X176.286 Y192.749 E.69578
G1 X175.753 Y192.749 E.01592
G1 X159.252 Y209.251 E.69578
G1 X158.718 Y209.251 E.01592
G1 X175.219 Y192.749 E.69578
G1 X174.685 Y192.749 E.01592
G1 X158.184 Y209.251 E.69578
G1 X157.65 Y209.251 E.01592
G1 X174.151 Y192.749 E.69578
G1 X173.617 Y192.749 E.01592
G1 X157.116 Y209.251 E.69578
G1 X156.583 Y209.251 E.01592
G1 X173.084 Y192.749 E.69578
G1 X172.55 Y192.749 E.01592
G1 X156.049 Y209.251 E.69578
G1 X155.515 Y209.251 E.01592
G1 X172.016 Y192.749 E.69578
G1 X171.482 Y192.749 E.01592
G1 X154.981 Y209.251 E.69578
G1 X154.447 Y209.251 E.01592
G1 X170.948 Y192.749 E.69578
G1 X170.415 Y192.749 E.01592
G1 X153.914 Y209.251 E.69578
M73 P28 R48
G1 X153.38 Y209.251 E.01592
G1 X169.881 Y192.749 E.69578
G1 X169.347 Y192.749 E.01592
G1 X152.846 Y209.251 E.69578
G1 X152.312 Y209.251 E.01592
G1 X168.813 Y192.749 E.69578
G1 X168.279 Y192.749 E.01592
G1 X151.778 Y209.251 E.69578
G1 X151.245 Y209.251 E.01592
G1 X167.746 Y192.749 E.69578
G1 X167.212 Y192.749 E.01592
G1 X150.711 Y209.251 E.69578
G1 X150.177 Y209.251 E.01592
G1 X166.678 Y192.749 E.69578
G1 X166.144 Y192.749 E.01592
G1 X149.643 Y209.251 E.69578
G1 X149.109 Y209.251 E.01592
G1 X165.61 Y192.749 E.69578
G1 X165.077 Y192.749 E.01592
G1 X148.576 Y209.251 E.69578
G1 X148.042 Y209.251 E.01592
G1 X164.543 Y192.749 E.69578
G1 X164.009 Y192.749 E.01592
G1 X147.508 Y209.251 E.69578
G1 X146.974 Y209.251 E.01592
G1 X163.475 Y192.749 E.69578
G1 X162.942 Y192.749 E.01592
G1 X146.44 Y209.251 E.69578
G1 X145.907 Y209.251 E.01592
G1 X162.408 Y192.749 E.69578
G1 X161.874 Y192.749 E.01592
G1 X145.373 Y209.251 E.69578
G1 X144.839 Y209.251 E.01592
G1 X161.34 Y192.749 E.69578
G1 X160.806 Y192.749 E.01592
G1 X144.305 Y209.251 E.69578
G1 X143.771 Y209.251 E.01592
G1 X160.273 Y192.749 E.69578
G1 X159.739 Y192.749 E.01592
G1 X143.238 Y209.251 E.69578
G1 X142.704 Y209.251 E.01592
G1 X159.205 Y192.749 E.69578
G1 X158.671 Y192.749 E.01592
G1 X142.17 Y209.251 E.69578
G1 X141.636 Y209.251 E.01592
G1 X158.137 Y192.749 E.69578
G1 X157.604 Y192.749 E.01592
G1 X141.102 Y209.251 E.69578
G1 X140.569 Y209.251 E.01592
G1 X157.07 Y192.749 E.69578
G1 X156.536 Y192.749 E.01592
G1 X140.035 Y209.251 E.69578
G1 X139.501 Y209.251 E.01592
G1 X156.002 Y192.749 E.69578
G1 X155.468 Y192.749 E.01592
G1 X138.967 Y209.251 E.69578
G1 X138.434 Y209.251 E.01592
G1 X154.935 Y192.749 E.69578
G1 X154.401 Y192.749 E.01592
G1 X137.9 Y209.251 E.69578
G1 X137.366 Y209.251 E.01592
G1 X153.867 Y192.749 E.69578
G1 X153.333 Y192.749 E.01592
G1 X136.832 Y209.251 E.69578
G1 X136.298 Y209.251 E.01592
G1 X152.799 Y192.749 E.69578
G1 X152.266 Y192.749 E.01592
G1 X135.765 Y209.251 E.69578
G1 X135.231 Y209.251 E.01592
G1 X151.732 Y192.749 E.69578
G1 X151.198 Y192.749 E.01592
G1 X134.697 Y209.251 E.69578
G1 X134.163 Y209.251 E.01592
G1 X150.664 Y192.749 E.69578
G1 X150.13 Y192.749 E.01592
G1 X133.629 Y209.251 E.69578
G1 X133.096 Y209.251 E.01592
G1 X149.597 Y192.749 E.69578
G1 X149.063 Y192.749 E.01592
G1 X132.562 Y209.251 E.69578
G1 X132.028 Y209.251 E.01592
G1 X148.529 Y192.749 E.69578
G1 X147.995 Y192.749 E.01592
G1 X131.494 Y209.251 E.69578
G1 X130.96 Y209.251 E.01592
G1 X147.461 Y192.749 E.69578
G1 X146.928 Y192.749 E.01592
G1 X130.427 Y209.251 E.69578
G1 X129.893 Y209.251 E.01592
G1 X146.394 Y192.749 E.69578
G1 X145.86 Y192.749 E.01592
G1 X129.359 Y209.251 E.69578
G1 X128.825 Y209.251 E.01592
G1 X145.326 Y192.749 E.69578
G1 X144.792 Y192.749 E.01592
G1 X128.291 Y209.251 E.69578
G1 X127.758 Y209.251 E.01592
G1 X144.259 Y192.749 E.69578
G1 X143.725 Y192.749 E.01592
G1 X127.224 Y209.251 E.69578
G1 X126.69 Y209.251 E.01592
G1 X143.191 Y192.749 E.69578
G1 X142.657 Y192.749 E.01592
G1 X126.156 Y209.251 E.69578
G1 X125.622 Y209.251 E.01592
G1 X142.124 Y192.749 E.69578
G1 X141.59 Y192.749 E.01592
G1 X125.089 Y209.251 E.69578
G1 X124.555 Y209.251 E.01592
G1 X141.056 Y192.749 E.69578
G1 X140.522 Y192.749 E.01592
G1 X131.452 Y201.82 E.38247
G2 X131.542 Y201.196 I-3.524 J-.828 E.01882
G1 X139.988 Y192.749 E.35615
G1 X139.455 Y192.749 E.01592
G1 X131.535 Y200.669 E.33393
G2 X131.459 Y200.211 I-5.192 J.622 E.01385
G1 X138.921 Y192.749 E.31461
G1 X138.387 Y192.749 E.01592
G1 X131.338 Y199.799 E.29724
G2 X131.178 Y199.424 I-1.949 J.608 E.01215
G1 X137.853 Y192.749 E.28145
G1 X137.319 Y192.749 E.01592
G1 X130.986 Y199.083 E.26706
G2 X130.763 Y198.772 I-1.667 J.961 E.01142
G1 X136.786 Y192.749 E.25396
G1 X136.252 Y192.749 E.01592
G1 X130.511 Y198.491 E.24208
G2 X130.23 Y198.237 I-1.405 J1.273 E.01129
G1 X135.718 Y192.749 E.2314
G1 X135.184 Y192.749 E.01592
G1 X129.921 Y198.013 E.22194
G2 X129.579 Y197.821 I-1.13 J1.61 E.01171
G1 X134.65 Y192.749 E.21384
G1 X134.117 Y192.749 E.01592
G1 X129.204 Y197.662 E.20716
G2 X128.79 Y197.542 I-.809 J2.008 E.01286
G1 X133.583 Y192.749 E.20208
G1 X133.049 Y192.749 E.01592
G1 X128.332 Y197.467 E.1989
G2 X127.807 Y197.457 I-.335 J4.059 E.01565
G1 X132.515 Y192.749 E.19851
G1 X131.981 Y192.749 E.01592
G1 X126.942 Y197.789 E.2125
; WIPE_START
G1 X128.356 Y196.375 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.793 Y199.938 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F9537.687
G1 X115.48 Y209.251 E.39268
G1 X116.014 Y209.251 E.01592
G1 X124.454 Y200.811 E.35588
G2 X124.468 Y201.33 I4.917 J.127 E.01551
G1 X116.548 Y209.251 E.33396
G1 X117.082 Y209.251 E.01592
G1 X124.541 Y201.791 E.31453
G2 X124.66 Y202.206 I2.129 J-.386 E.01289
M73 P29 R48
G1 X117.615 Y209.251 E.29704
G1 X118.149 Y209.251 E.01592
G1 X124.821 Y202.579 E.28131
G2 X125.015 Y202.919 I1.795 J-.801 E.01168
G1 X118.683 Y209.251 E.26699
G1 X119.217 Y209.251 E.01592
G1 X125.239 Y203.228 E.25394
G2 X125.492 Y203.509 I1.531 J-1.125 E.01129
G1 X119.751 Y209.251 E.2421
G1 X120.284 Y209.251 E.01592
G1 X125.774 Y203.762 E.23145
G2 X126.084 Y203.985 I1.274 J-1.441 E.01142
G1 X120.818 Y209.251 E.22202
G1 X121.352 Y209.251 E.01592
G1 X126.424 Y204.178 E.21387
G2 X126.798 Y204.339 I.986 J-1.782 E.01214
G1 X121.886 Y209.251 E.20711
G1 X122.42 Y209.251 E.01592
G1 X127.208 Y204.462 E.20191
G2 X127.671 Y204.533 I1.118 J-5.795 E.01398
G1 X122.953 Y209.251 E.19894
G1 X123.487 Y209.251 E.01592
G1 X128.194 Y204.544 E.19848
G2 X128.82 Y204.451 I-.244 J-3.827 E.01889
G1 X123.851 Y209.42 E.20952
G1 X114.777 Y209.42 F30000
G1 F9537.687
G1 X131.448 Y192.749 E.70294
G1 X130.914 Y192.749 E.01592
G1 X114.413 Y209.251 E.69578
G1 X113.879 Y209.251 E.01592
G1 X130.38 Y192.749 E.69578
G1 X129.846 Y192.749 E.01592
G1 X113.345 Y209.251 E.69578
G1 X112.811 Y209.251 E.01592
G1 X129.312 Y192.749 E.69578
G1 X128.779 Y192.749 E.01592
G1 X112.278 Y209.251 E.69578
G1 X111.744 Y209.251 E.01592
G1 X128.245 Y192.749 E.69578
G1 X127.711 Y192.749 E.01592
G1 X111.21 Y209.251 E.69578
G1 X110.676 Y209.251 E.01592
G1 X127.177 Y192.749 E.69578
G1 X126.643 Y192.749 E.01592
G1 X110.142 Y209.251 E.69578
G1 X109.609 Y209.251 E.01592
G1 X126.11 Y192.749 E.69578
G1 X125.576 Y192.749 E.01592
G1 X109.075 Y209.251 E.69578
G1 X108.541 Y209.251 E.01592
G1 X125.042 Y192.749 E.69578
G1 X124.508 Y192.749 E.01592
G1 X108.007 Y209.251 E.69578
G1 X107.473 Y209.251 E.01592
G1 X123.974 Y192.749 E.69578
G1 X123.441 Y192.749 E.01592
G1 X106.94 Y209.251 E.69578
G1 X106.406 Y209.251 E.01592
G1 X122.907 Y192.749 E.69578
G1 X122.373 Y192.749 E.01592
G1 X105.872 Y209.251 E.69578
G1 X105.338 Y209.251 E.01592
G1 X121.839 Y192.749 E.69578
G1 X121.305 Y192.749 E.01592
G1 X104.804 Y209.251 E.69578
G1 X104.271 Y209.251 E.01592
G1 X120.772 Y192.749 E.69578
G1 X120.238 Y192.749 E.01592
G1 X103.737 Y209.251 E.69578
G1 X103.203 Y209.251 E.01592
G1 X119.704 Y192.749 E.69578
G1 X119.17 Y192.749 E.01592
G1 X102.669 Y209.251 E.69578
G1 X102.135 Y209.251 E.01592
G1 X118.637 Y192.749 E.69578
G1 X118.103 Y192.749 E.01592
G1 X101.602 Y209.251 E.69578
G1 X101.068 Y209.251 E.01592
G1 X117.569 Y192.749 E.69578
G1 X117.035 Y192.749 E.01592
G1 X100.534 Y209.251 E.69578
G1 X100 Y209.251 E.01592
G1 X116.501 Y192.749 E.69578
G1 X115.968 Y192.749 E.01592
G1 X99.466 Y209.251 E.69578
G1 X98.933 Y209.251 E.01592
G1 X115.434 Y192.749 E.69578
G1 X114.9 Y192.749 E.01592
G1 X98.399 Y209.251 E.69578
G1 X97.865 Y209.251 E.01592
G1 X114.366 Y192.749 E.69578
G1 X113.832 Y192.749 E.01592
G1 X97.331 Y209.251 E.69578
G1 X96.797 Y209.251 E.01592
G1 X113.299 Y192.749 E.69578
G1 X112.765 Y192.749 E.01592
G1 X96.264 Y209.251 E.69578
G1 X95.73 Y209.251 E.01592
G1 X112.231 Y192.749 E.69578
G1 X111.697 Y192.749 E.01592
G1 X95.196 Y209.251 E.69578
G1 X94.662 Y209.251 E.01592
G1 X111.163 Y192.749 E.69578
G1 X110.63 Y192.749 E.01592
G1 X94.129 Y209.251 E.69578
G1 X93.595 Y209.251 E.01592
G1 X110.096 Y192.749 E.69578
G1 X109.562 Y192.749 E.01592
G1 X93.061 Y209.251 E.69578
G1 X92.527 Y209.251 E.01592
G1 X109.028 Y192.749 E.69578
G1 X108.494 Y192.749 E.01592
G1 X91.993 Y209.251 E.69578
G1 X91.46 Y209.251 E.01592
G1 X107.961 Y192.749 E.69578
G1 X107.427 Y192.749 E.01592
G1 X90.926 Y209.251 E.69578
G1 X90.392 Y209.251 E.01592
G1 X106.893 Y192.749 E.69578
G1 X106.359 Y192.749 E.01592
G1 X89.858 Y209.251 E.69578
G1 X89.324 Y209.251 E.01592
G1 X105.825 Y192.749 E.69578
G1 X105.292 Y192.749 E.01592
G1 X88.791 Y209.251 E.69578
G1 X88.257 Y209.251 E.01592
G1 X104.758 Y192.749 E.69578
G1 X104.224 Y192.749 E.01592
G1 X87.723 Y209.251 E.69578
G1 X87.189 Y209.251 E.01592
G1 X103.69 Y192.749 E.69578
G1 X103.156 Y192.749 E.01592
G1 X86.655 Y209.251 E.69578
G1 X86.122 Y209.251 E.01592
G1 X102.623 Y192.749 E.69578
G1 X102.089 Y192.749 E.01592
G1 X85.588 Y209.251 E.69578
G1 X85.054 Y209.251 E.01592
G1 X101.555 Y192.749 E.69578
G1 X101.021 Y192.749 E.01592
G1 X84.52 Y209.251 E.69578
G1 X83.986 Y209.251 E.01592
G1 X100.487 Y192.749 E.69578
G1 X99.954 Y192.749 E.01592
G1 X83.453 Y209.251 E.69578
G1 X82.919 Y209.251 E.01592
G1 X99.42 Y192.749 E.69578
G1 X98.886 Y192.749 E.01592
G1 X82.385 Y209.251 E.69578
G1 X81.851 Y209.251 E.01592
G1 X98.352 Y192.749 E.69578
G1 X97.819 Y192.749 E.01592
G1 X81.317 Y209.251 E.69578
G1 X80.784 Y209.251 E.01592
G1 X97.285 Y192.749 E.69578
G1 X96.751 Y192.749 E.01592
G1 X80.25 Y209.251 E.69578
G1 X79.716 Y209.251 E.01592
G1 X96.217 Y192.749 E.69578
G1 X95.683 Y192.749 E.01592
G1 X79.182 Y209.251 E.69578
G1 X78.648 Y209.251 E.01592
G1 X95.15 Y192.749 E.69578
G1 X94.616 Y192.749 E.01592
G1 X78.115 Y209.251 E.69578
G1 X77.581 Y209.251 E.01592
G1 X94.082 Y192.749 E.69578
G1 X93.548 Y192.749 E.01592
G1 X77.047 Y209.251 E.69578
G1 X76.513 Y209.251 E.01592
G1 X93.014 Y192.749 E.69578
G1 X92.481 Y192.749 E.01592
G1 X75.979 Y209.251 E.69578
G1 X75.446 Y209.251 E.01592
G1 X91.947 Y192.749 E.69578
G1 X91.413 Y192.749 E.01592
G1 X74.912 Y209.251 E.69578
G1 X74.378 Y209.251 E.01592
G1 X90.879 Y192.749 E.69578
G1 X90.345 Y192.749 E.01592
G1 X73.844 Y209.251 E.69578
G1 X73.311 Y209.251 E.01592
G1 X89.812 Y192.749 E.69578
G1 X89.278 Y192.749 E.01592
G1 X72.777 Y209.251 E.69578
G1 X72.243 Y209.251 E.01592
G1 X88.744 Y192.749 E.69578
G1 X88.21 Y192.749 E.01592
G1 X71.709 Y209.251 E.69578
G1 X71.175 Y209.251 E.01592
G1 X87.676 Y192.749 E.69578
G1 X87.143 Y192.749 E.01592
G1 X70.642 Y209.251 E.69578
G1 X70.108 Y209.251 E.01592
G1 X86.609 Y192.749 E.69578
G1 X86.075 Y192.749 E.01592
G1 X69.574 Y209.251 E.69578
G1 X69.04 Y209.251 E.01592
G1 X85.541 Y192.749 E.69578
G1 X85.007 Y192.749 E.01592
G1 X68.506 Y209.251 E.69578
G1 X67.973 Y209.251 E.01592
G1 X84.474 Y192.749 E.69578
G1 X83.94 Y192.749 E.01592
G1 X67.439 Y209.251 E.69578
G1 X66.905 Y209.251 E.01592
G1 X83.406 Y192.749 E.69578
G1 X82.872 Y192.749 E.01592
G1 X66.371 Y209.251 E.69578
G1 X65.837 Y209.251 E.01592
G1 X82.338 Y192.749 E.69578
G1 X81.805 Y192.749 E.01592
G1 X65.304 Y209.251 E.69578
G1 X64.77 Y209.251 E.01592
G1 X81.271 Y192.749 E.69578
G1 X80.737 Y192.749 E.01592
G1 X64.236 Y209.251 E.69578
G1 X63.702 Y209.251 E.01592
G1 X80.203 Y192.749 E.69578
G1 X79.669 Y192.749 E.01592
G1 X63.168 Y209.251 E.69578
G1 X62.635 Y209.251 E.01592
G1 X79.136 Y192.749 E.69578
G1 X78.602 Y192.749 E.01592
G1 X62.101 Y209.251 E.69578
G1 X61.567 Y209.251 E.01592
G1 X78.068 Y192.749 E.69578
G1 X77.534 Y192.749 E.01592
G1 X61.033 Y209.251 E.69578
G1 X60.499 Y209.251 E.01592
G1 X77.001 Y192.749 E.69578
G1 X76.467 Y192.749 E.01592
G1 X59.966 Y209.251 E.69578
G1 X59.432 Y209.251 E.01592
G1 X75.933 Y192.749 E.69578
G1 X75.399 Y192.749 E.01592
G1 X58.898 Y209.251 E.69578
G1 X58.364 Y209.251 E.01592
G1 X74.865 Y192.749 E.69578
G1 X74.332 Y192.749 E.01592
G1 X57.83 Y209.251 E.69578
G1 X57.297 Y209.251 E.01592
G1 X73.798 Y192.749 E.69578
G1 X73.264 Y192.749 E.01592
G1 X56.763 Y209.251 E.69578
G1 X56.229 Y209.251 E.01592
G1 X72.73 Y192.749 E.69578
G1 X72.196 Y192.749 E.01592
G1 X55.695 Y209.251 E.69578
G1 X55.161 Y209.251 E.01592
G1 X71.663 Y192.749 E.69578
G1 X71.129 Y192.749 E.01592
G1 X54.628 Y209.251 E.69578
G1 X54.094 Y209.251 E.01592
G1 X70.595 Y192.749 E.69578
G1 X70.061 Y192.749 E.01592
G1 X53.56 Y209.251 E.69578
G1 X53.026 Y209.251 E.01592
G1 X69.527 Y192.749 E.69578
G1 X68.994 Y192.749 E.01592
G1 X59.189 Y202.555 E.41344
G2 X59.473 Y201.736 I-3.358 J-1.626 E.02589
G1 X68.46 Y192.749 E.37894
G1 X67.926 Y192.749 E.01592
G1 X59.545 Y201.13 E.35339
G2 X59.529 Y200.613 I-4.426 J-.12 E.01545
G1 X67.392 Y192.749 E.33156
G1 X66.858 Y192.749 E.01592
G1 X59.447 Y200.161 E.31252
G2 X59.321 Y199.753 I-2.103 J.425 E.01275
G1 X66.325 Y192.749 E.29531
G1 X65.791 Y192.749 E.01592
G1 X59.158 Y199.382 E.27968
G2 X58.962 Y199.044 I-1.783 J.809 E.01166
G1 X65.257 Y192.749 E.26543
G1 X64.723 Y192.749 E.01592
G1 X58.736 Y198.737 E.25247
G2 X58.481 Y198.458 I-1.521 J1.137 E.01128
G1 X64.251 Y192.688 E.24329
G1 X64.251 Y192.155 E.01592
G1 X58.196 Y198.21 E.25532
G2 X57.881 Y197.99 I-1.256 J1.464 E.01145
G1 X64.251 Y191.621 E.26857
G1 X64.251 Y191.087 E.01592
G1 X57.536 Y197.801 E.28312
G2 X57.157 Y197.647 I-.964 J1.818 E.01223
G1 X64.251 Y190.553 E.2991
G1 X64.251 Y190.019 E.01592
G1 X56.74 Y197.53 E.31671
G2 X56.276 Y197.46 I-.585 J2.277 E.01399
G1 X64.251 Y189.486 E.33623
G1 X64.251 Y188.952 E.01592
G1 X55.74 Y197.462 E.35885
G2 X55.1 Y197.568 I.306 J3.831 E.01935
G1 X64.251 Y188.418 E.38583
G1 X64.251 Y187.884 E.01592
G1 X47.749 Y204.385 E.69578
G1 X47.749 Y204.919 E.01592
G1 X52.564 Y200.104 E.20301
G2 X52.461 Y200.741 I4.456 J1.048 E.01925
G1 X47.749 Y205.453 E.19866
G1 X47.749 Y205.987 E.01592
G1 X52.462 Y201.274 E.19873
G2 X52.531 Y201.739 I2.362 J-.107 E.01406
G1 X47.749 Y206.52 E.2016
G1 X47.749 Y207.054 E.01592
G1 X52.645 Y202.159 E.20643
G2 X52.799 Y202.538 I1.975 J-.578 E.01224
G1 X47.749 Y207.588 E.21292
G1 X47.749 Y208.122 E.01592
G1 X52.99 Y202.882 E.22096
G2 X53.211 Y203.194 I1.675 J-.95 E.01144
G1 X47.749 Y208.656 E.23028
G1 X47.749 Y209.189 E.01592
G1 X53.461 Y203.478 E.24082
G2 X53.739 Y203.734 I1.416 J-1.262 E.01128
G1 X48.222 Y209.251 E.23262
G1 X48.756 Y209.251 E.01592
G1 X54.046 Y203.961 E.22305
G2 X54.383 Y204.157 I1.149 J-1.584 E.01166
G1 X49.29 Y209.251 E.21476
G1 X49.824 Y209.251 E.01592
G1 X54.753 Y204.321 E.20785
G2 X55.159 Y204.448 I.84 J-1.972 E.01272
G1 X50.357 Y209.251 E.20248
G1 X50.891 Y209.251 E.01592
G1 X55.613 Y204.528 E.19912
G2 X56.13 Y204.545 I.343 J-2.569 E.01545
G1 X51.425 Y209.251 E.19841
G1 X51.959 Y209.251 E.01592
G1 X56.74 Y204.47 E.20159
G2 X57.551 Y204.192 I-.776 J-3.59 E.02565
G1 X52.323 Y209.42 E.22047
G1 X47.58 Y204.021 F30000
G1 F9537.687
G1 X64.251 Y187.35 E.70294
G1 X64.251 Y186.817 E.01592
G1 X47.749 Y203.318 E.69578
G1 X47.749 Y202.784 E.01592
G1 X64.251 Y186.283 E.69578
G1 X64.251 Y185.749 E.01592
G1 X47.749 Y202.25 E.69578
G1 X47.749 Y201.716 E.01592
G1 X64.251 Y185.215 E.69578
G1 X64.251 Y184.681 E.01592
G1 X47.749 Y201.182 E.69578
G1 X47.749 Y200.649 E.01592
G1 X64.251 Y184.148 E.69578
G1 X64.251 Y183.614 E.01592
G1 X47.749 Y200.115 E.69578
G1 X47.749 Y199.581 E.01592
G1 X64.251 Y183.08 E.69578
G1 X64.251 Y182.546 E.01592
G1 X47.749 Y199.047 E.69578
G1 X47.749 Y198.514 E.01592
G1 X64.251 Y182.012 E.69578
G1 X64.251 Y181.479 E.01592
G1 X47.749 Y197.98 E.69578
G1 X47.749 Y197.446 E.01592
G1 X64.251 Y180.945 E.69578
G1 X64.251 Y180.411 E.01592
G1 X47.749 Y196.912 E.69578
G1 X47.749 Y196.378 E.01592
G1 X64.251 Y179.877 E.69578
G1 X64.251 Y179.343 E.01592
G1 X47.749 Y195.845 E.69578
G1 X47.749 Y195.311 E.01592
G1 X64.251 Y178.81 E.69578
G1 X64.251 Y178.276 E.01592
G1 X47.749 Y194.777 E.69578
G1 X47.749 Y194.243 E.01592
G1 X64.251 Y177.742 E.69578
G1 X64.251 Y177.208 E.01592
G1 X47.749 Y193.709 E.69578
G1 X47.749 Y193.176 E.01592
G1 X64.251 Y176.675 E.69578
G1 X64.251 Y176.141 E.01592
G1 X47.749 Y192.642 E.69578
G1 X47.749 Y192.108 E.01592
G1 X64.251 Y175.607 E.69578
G1 X64.251 Y175.073 E.01592
G1 X47.749 Y191.574 E.69578
G1 X47.749 Y191.04 E.01592
G1 X64.251 Y174.539 E.69578
G1 X64.251 Y174.006 E.01592
G1 X47.749 Y190.507 E.69578
G1 X47.749 Y189.973 E.01592
G1 X64.251 Y173.472 E.69578
G1 X64.251 Y172.938 E.01592
G1 X47.749 Y189.439 E.69578
G1 X47.749 Y188.905 E.01592
G1 X64.251 Y172.404 E.69578
G1 X64.251 Y171.87 E.01592
G1 X47.749 Y188.371 E.69578
G1 X47.749 Y187.838 E.01592
G1 X64.251 Y171.337 E.69578
G1 X64.251 Y170.803 E.01592
G1 X47.749 Y187.304 E.69578
G1 X47.749 Y186.77 E.01592
G1 X64.251 Y170.269 E.69578
G1 X64.251 Y169.735 E.01592
G1 X47.749 Y186.236 E.69578
G1 X47.749 Y185.702 E.01592
G1 X64.251 Y169.201 E.69578
G1 X64.251 Y168.668 E.01592
G1 X47.749 Y185.169 E.69578
G1 X47.749 Y184.635 E.01592
G1 X64.251 Y168.134 E.69578
G1 X64.251 Y167.6 E.01592
G1 X47.749 Y184.101 E.69578
G1 X47.749 Y183.567 E.01592
G1 X64.251 Y167.066 E.69578
G1 X64.251 Y166.532 E.01592
G1 X47.749 Y183.033 E.69578
G1 X47.749 Y182.5 E.01592
G1 X64.251 Y165.999 E.69578
G1 X64.251 Y165.465 E.01592
G1 X47.749 Y181.966 E.69578
G1 X47.749 Y181.432 E.01592
G1 X64.251 Y164.931 E.69578
G1 X64.251 Y164.397 E.01592
G1 X47.749 Y180.898 E.69578
G1 X47.749 Y180.365 E.01592
G1 X64.251 Y163.863 E.69578
G1 X64.251 Y163.33 E.01592
G1 X47.749 Y179.831 E.69578
G1 X47.749 Y179.297 E.01592
G1 X64.251 Y162.796 E.69578
G1 X64.251 Y162.262 E.01592
G1 X47.749 Y178.763 E.69578
G1 X47.749 Y178.229 E.01592
G1 X64.251 Y161.728 E.69578
G1 X64.251 Y161.194 E.01592
G1 X47.749 Y177.696 E.69578
G1 X47.749 Y177.162 E.01592
G1 X64.251 Y160.661 E.69578
G1 X64.251 Y160.127 E.01592
G1 X47.749 Y176.628 E.69578
G1 X47.749 Y176.094 E.01592
G1 X64.251 Y159.593 E.69578
G1 X64.251 Y159.059 E.01592
G1 X47.749 Y175.56 E.69578
G1 X47.749 Y175.027 E.01592
G1 X64.251 Y158.525 E.69578
G1 X64.251 Y157.992 E.01592
G1 X47.749 Y174.493 E.69578
G1 X47.749 Y173.959 E.01592
G1 X64.251 Y157.458 E.69578
G1 X64.251 Y156.924 E.01592
G1 X47.749 Y173.425 E.69578
G1 X47.749 Y172.891 E.01592
G1 X64.251 Y156.39 E.69578
G1 X64.251 Y155.857 E.01592
G1 X47.749 Y172.358 E.69578
G1 X47.749 Y171.824 E.01592
G1 X64.251 Y155.323 E.69578
G1 X64.251 Y154.789 E.01592
G1 X47.749 Y171.29 E.69578
G1 X47.749 Y170.756 E.01592
G1 X64.251 Y154.255 E.69578
G1 X64.251 Y153.721 E.01592
G1 X47.749 Y170.222 E.69578
G1 X47.749 Y169.689 E.01592
G1 X64.251 Y153.188 E.69578
G1 X64.251 Y152.654 E.01592
G1 X47.749 Y169.155 E.69578
G1 X47.749 Y168.621 E.01592
G1 X64.251 Y152.12 E.69578
G1 X64.251 Y151.586 E.01592
G1 X47.749 Y168.087 E.69578
G1 X47.749 Y167.553 E.01592
G1 X64.251 Y151.052 E.69578
G1 X64.251 Y150.519 E.01592
G1 X47.749 Y167.02 E.69578
G1 X47.749 Y166.486 E.01592
G1 X64.251 Y149.985 E.69578
G1 X64.251 Y149.451 E.01592
G1 X47.749 Y165.952 E.69578
G1 X47.749 Y165.418 E.01592
G1 X64.251 Y148.917 E.69578
G1 X64.251 Y148.383 E.01592
G1 X47.749 Y164.884 E.69578
G1 X47.749 Y164.351 E.01592
G1 X64.251 Y147.85 E.69578
G1 X64.251 Y147.316 E.01592
G1 X47.749 Y163.817 E.69578
G1 X47.749 Y163.283 E.01592
G1 X64.251 Y146.782 E.69578
G1 X64.251 Y146.248 E.01592
G1 X47.749 Y162.749 E.69578
G1 X47.749 Y162.215 E.01592
G1 X64.251 Y145.714 E.69578
G1 X64.251 Y145.181 E.01592
G1 X47.749 Y161.682 E.69578
G1 X47.749 Y161.148 E.01592
G1 X64.251 Y144.647 E.69578
G1 X64.251 Y144.113 E.01592
G1 X47.749 Y160.614 E.69578
G1 X47.749 Y160.08 E.01592
G1 X64.251 Y143.579 E.69578
G1 X64.251 Y143.045 E.01592
G1 X47.749 Y159.546 E.69578
G1 X47.749 Y159.013 E.01592
G1 X64.251 Y142.512 E.69578
G1 X64.251 Y141.978 E.01592
G1 X47.749 Y158.479 E.69578
G1 X47.749 Y157.945 E.01592
G1 X64.251 Y141.444 E.69578
G1 X64.251 Y140.91 E.01592
G1 X47.749 Y157.411 E.69578
G1 X47.749 Y156.878 E.01592
G1 X64.251 Y140.376 E.69578
G1 X64.251 Y139.843 E.01592
G1 X47.749 Y156.344 E.69578
G1 X47.749 Y155.81 E.01592
G1 X64.251 Y139.309 E.69578
G1 X64.251 Y138.775 E.01592
G1 X47.749 Y155.276 E.69578
G1 X47.749 Y154.742 E.01592
G1 X64.251 Y138.241 E.69578
G1 X64.251 Y137.707 E.01592
G1 X47.749 Y154.209 E.69578
G1 X47.749 Y153.675 E.01592
G1 X64.251 Y137.174 E.69578
G1 X64.251 Y136.64 E.01592
G1 X47.749 Y153.141 E.69578
G1 X47.749 Y152.607 E.01592
G1 X64.251 Y136.106 E.69578
G1 X64.251 Y135.572 E.01592
G1 X47.749 Y152.073 E.69578
G1 X47.749 Y151.54 E.01592
G1 X64.251 Y135.039 E.69578
G1 X64.251 Y134.505 E.01592
G1 X47.749 Y151.006 E.69578
G1 X47.749 Y150.472 E.01592
G1 X64.251 Y133.971 E.69578
G1 X64.251 Y133.437 E.01592
G1 X47.749 Y149.938 E.69578
G1 X47.749 Y149.404 E.01592
G1 X64.251 Y132.903 E.69578
G1 X64.251 Y132.37 E.01592
G1 X47.749 Y148.871 E.69578
G1 X47.749 Y148.337 E.01592
G1 X64.251 Y131.836 E.69578
G1 X64.251 Y131.302 E.01592
G1 X47.749 Y147.803 E.69578
G1 X47.749 Y147.269 E.01592
G1 X64.251 Y130.768 E.69578
G1 X64.251 Y130.234 E.01592
G1 X47.749 Y146.735 E.69578
G1 X47.749 Y146.202 E.01592
G1 X64.251 Y129.701 E.69578
G1 X64.251 Y129.167 E.01592
G1 X47.749 Y145.668 E.69578
M73 P30 R48
G1 X47.749 Y145.134 E.01592
G1 X64.251 Y128.633 E.69578
G1 X64.251 Y128.099 E.01592
G1 X47.749 Y144.6 E.69578
G1 X47.749 Y144.066 E.01592
G1 X64.251 Y127.565 E.69578
G1 X64.251 Y127.032 E.01592
G1 X47.749 Y143.533 E.69578
G1 X47.749 Y142.999 E.01592
G1 X64.251 Y126.498 E.69578
G1 X64.251 Y125.964 E.01592
G1 X47.749 Y142.465 E.69578
G1 X47.749 Y141.931 E.01592
G1 X64.251 Y125.43 E.69578
G1 X64.251 Y124.896 E.01592
G1 X47.749 Y141.397 E.69578
G1 X47.749 Y140.864 E.01592
G1 X64.251 Y124.363 E.69578
G1 X64.251 Y123.829 E.01592
G1 X47.749 Y140.33 E.69578
G1 X47.749 Y139.796 E.01592
G1 X64.251 Y123.295 E.69578
G1 X64.251 Y122.761 E.01592
G1 X47.749 Y139.262 E.69578
G1 X47.749 Y138.729 E.01592
G1 X57.108 Y129.37 E.39462
G3 X56.422 Y129.522 I-1.111 J-3.384 E.02099
G1 X47.749 Y138.195 E.36569
G1 X47.749 Y137.661 E.01592
G1 X55.863 Y129.547 E.34213
G3 X55.383 Y129.493 I.029 J-2.427 E.01443
G1 X47.749 Y137.127 E.32189
G1 X47.749 Y136.593 E.01592
G1 X54.953 Y129.39 E.30372
G3 X54.563 Y129.246 I.524 J-2.023 E.01241
G1 X47.749 Y136.06 E.28728
G1 X47.749 Y135.526 E.01592
G1 X54.209 Y129.066 E.27238
G3 X53.888 Y128.853 I.906 J-1.713 E.0115
G1 X47.749 Y134.992 E.25885
G1 X47.749 Y134.458 E.01592
G1 X53.597 Y128.611 E.24655
G3 X53.333 Y128.341 I1.219 J-1.45 E.01127
G1 X47.749 Y133.924 E.23545
G1 X47.749 Y133.391 E.01592
G1 X53.099 Y128.041 E.22555
G3 X52.894 Y127.713 I1.542 J-1.19 E.01157
G1 X47.749 Y132.857 E.21691
G1 X47.749 Y132.323 E.01592
G1 X52.72 Y127.352 E.20961
G3 X52.583 Y126.956 I1.913 J-.887 E.01252
G1 X47.749 Y131.789 E.2038
G1 X47.749 Y131.255 E.01592
G1 X52.487 Y126.518 E.19976
G3 X52.453 Y126.018 I2.479 J-.42 E.01496
G1 X47.749 Y130.722 E.19832
G1 X47.749 Y130.188 E.01592
G1 X52.493 Y125.444 E.20004
G3 X52.695 Y124.709 I3.894 J.671 E.02276
G1 X47.749 Y129.654 E.20853
M73 P30 R47
G1 X47.749 Y129.12 E.01592
G1 X64.251 Y112.619 E.69578
G1 X64.251 Y113.153 E.01592
G1 X54.706 Y122.697 E.40244
G3 X55.439 Y122.498 I1.274 J3.246 E.02268
G1 X64.251 Y113.687 E.37155
G1 X64.251 Y114.221 E.01592
G1 X56.019 Y122.452 E.34709
G3 X56.515 Y122.49 I.061 J2.502 E.01486
G1 X64.251 Y114.754 E.32616
G1 X64.251 Y115.288 E.01592
G1 X56.958 Y122.58 E.30748
G3 X57.353 Y122.719 I-2.317 J7.228 E.01249
G1 X64.251 Y115.822 E.29082
G1 X64.251 Y116.356 E.01592
G1 X57.713 Y122.893 E.27566
G3 X58.041 Y123.099 I-.865 J1.746 E.01157
G1 X64.251 Y116.889 E.26182
G1 X64.251 Y117.423 E.01592
G1 X58.34 Y123.334 E.24923
G3 X58.61 Y123.598 I-1.184 J1.482 E.01127
G1 X64.251 Y117.957 E.23784
G1 X64.251 Y118.491 E.01592
G1 X58.852 Y123.89 E.22765
G3 X59.064 Y124.211 I-1.501 J1.223 E.01151
G1 X64.251 Y119.025 E.21869
G1 X64.251 Y119.558 E.01592
G1 X59.245 Y124.564 E.21105
G3 X59.393 Y124.95 I-1.857 J.929 E.01235
G1 X64.251 Y120.092 E.20483
G1 X64.251 Y120.626 E.01592
G1 X59.494 Y125.382 E.20056
G3 X59.545 Y125.865 I-2.392 J.495 E.01451
G1 X64.251 Y121.16 E.19842
G1 X64.251 Y121.694 E.01592
G1 X59.524 Y126.42 E.1993
G3 X59.373 Y127.105 I-3.97 J-.518 E.02095
G1 X64.42 Y122.058 E.21284
; WIPE_START
G1 X63.006 Y123.472 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X55.785 Y125.945 Z.8 F30000
G1 X47.58 Y128.756 Z.8
G1 Z.4
G1 E.8 F1800
G1 F9537.687
G1 X64.251 Y112.085 E.70294
G1 X64.251 Y111.552 E.01592
G1 X47.749 Y128.053 E.69578
G1 X47.749 Y127.519 E.01592
G1 X64.251 Y111.018 E.69578
G1 X64.251 Y110.484 E.01592
G1 X47.749 Y126.985 E.69578
G1 X47.749 Y126.451 E.01592
G1 X64.251 Y109.95 E.69578
G1 X64.251 Y109.416 E.01592
G1 X47.749 Y125.917 E.69578
G1 X47.749 Y125.384 E.01592
G1 X64.251 Y108.883 E.69578
G1 X64.251 Y108.349 E.01592
G1 X47.749 Y124.85 E.69578
G1 X47.749 Y124.316 E.01592
G1 X64.251 Y107.815 E.69578
G1 X64.251 Y107.281 E.01592
G1 X47.749 Y123.782 E.69578
G1 X47.749 Y123.248 E.01592
G1 X64.251 Y106.747 E.69578
G1 X64.251 Y106.214 E.01592
G1 X47.749 Y122.715 E.69578
G1 X47.749 Y122.181 E.01592
G1 X64.251 Y105.68 E.69578
G1 X64.251 Y105.146 E.01592
G1 X47.749 Y121.647 E.69578
G1 X47.749 Y121.113 E.01592
G1 X64.251 Y104.612 E.69578
G1 X64.251 Y104.078 E.01592
G1 X47.749 Y120.579 E.69578
G1 X47.749 Y120.046 E.01592
G1 X64.251 Y103.545 E.69578
G1 X64.251 Y103.011 E.01592
G1 X47.749 Y119.512 E.69578
G1 X47.749 Y118.978 E.01592
G1 X64.251 Y102.477 E.69578
G1 X64.251 Y101.943 E.01592
G1 X47.749 Y118.444 E.69578
G1 X47.749 Y117.911 E.01592
G1 X64.251 Y101.409 E.69578
G1 X64.251 Y100.876 E.01592
G1 X47.749 Y117.377 E.69578
G1 X47.749 Y116.843 E.01592
G1 X64.251 Y100.342 E.69578
G1 X64.251 Y99.808 E.01592
G1 X47.749 Y116.309 E.69578
G1 X47.749 Y115.775 E.01592
G1 X64.251 Y99.274 E.69578
G1 X64.251 Y98.74 E.01592
G1 X47.749 Y115.242 E.69578
G1 X47.749 Y114.708 E.01592
G1 X64.251 Y98.207 E.69578
G1 X64.251 Y97.673 E.01592
G1 X47.749 Y114.174 E.69578
G1 X47.749 Y113.64 E.01592
G1 X64.251 Y97.139 E.69578
G1 X64.251 Y96.605 E.01592
G1 X47.749 Y113.106 E.69578
G1 X47.749 Y112.573 E.01592
G1 X64.251 Y96.071 E.69578
G1 X64.251 Y95.538 E.01592
G1 X47.749 Y112.039 E.69578
G1 X47.749 Y111.505 E.01592
G1 X64.251 Y95.004 E.69578
G1 X64.251 Y94.47 E.01592
G1 X47.749 Y110.971 E.69578
G1 X47.749 Y110.437 E.01592
G1 X64.251 Y93.936 E.69578
G1 X64.251 Y93.403 E.01592
G1 X47.749 Y109.904 E.69578
G1 X47.749 Y109.37 E.01592
G1 X64.251 Y92.869 E.69578
G1 X64.251 Y92.335 E.01592
G1 X47.749 Y108.836 E.69578
G1 X47.749 Y108.302 E.01592
G1 X64.251 Y91.801 E.69578
G1 X64.251 Y91.267 E.01592
G1 X47.749 Y107.768 E.69578
G1 X47.749 Y107.235 E.01592
G1 X64.251 Y90.734 E.69578
G1 X64.251 Y90.2 E.01592
G1 X47.749 Y106.701 E.69578
G1 X47.749 Y106.167 E.01592
G1 X64.251 Y89.666 E.69578
G1 X64.251 Y89.132 E.01592
G1 X47.749 Y105.633 E.69578
G1 X47.749 Y105.099 E.01592
G1 X64.251 Y88.598 E.69578
G1 X64.251 Y88.065 E.01592
G1 X47.749 Y104.566 E.69578
G1 X47.749 Y104.032 E.01592
G1 X64.251 Y87.531 E.69578
G1 X64.251 Y86.997 E.01592
G1 X47.749 Y103.498 E.69578
G1 X47.749 Y102.964 E.01592
G1 X64.251 Y86.463 E.69578
G1 X64.251 Y85.929 E.01592
G1 X47.749 Y102.43 E.69578
G1 X47.749 Y101.897 E.01592
G1 X64.251 Y85.396 E.69578
G1 X64.251 Y84.862 E.01592
G1 X47.749 Y101.363 E.69578
G1 X47.749 Y100.829 E.01592
G1 X64.251 Y84.328 E.69578
G1 X64.251 Y83.794 E.01592
G1 X47.749 Y100.295 E.69578
G1 X47.749 Y99.761 E.01592
G1 X64.251 Y83.26 E.69578
G1 X64.251 Y82.727 E.01592
G1 X47.749 Y99.228 E.69578
G1 X47.749 Y98.694 E.01592
G1 X64.251 Y82.193 E.69578
G1 X64.251 Y81.659 E.01592
G1 X47.749 Y98.16 E.69578
G1 X47.749 Y97.626 E.01592
G1 X64.251 Y81.125 E.69578
G1 X64.251 Y80.591 E.01592
G1 X47.749 Y97.093 E.69578
G1 X47.749 Y96.559 E.01592
G1 X64.251 Y80.058 E.69578
G1 X64.251 Y79.524 E.01592
G1 X47.749 Y96.025 E.69578
G1 X47.749 Y95.491 E.01592
G1 X64.251 Y78.99 E.69578
G1 X64.251 Y78.456 E.01592
G1 X47.749 Y94.957 E.69578
G1 X47.749 Y94.424 E.01592
G1 X64.251 Y77.922 E.69578
G1 X64.251 Y77.389 E.01592
G1 X47.749 Y93.89 E.69578
G1 X47.749 Y93.356 E.01592
G1 X64.251 Y76.855 E.69578
G1 X64.251 Y76.321 E.01592
G1 X47.749 Y92.822 E.69578
G1 X47.749 Y92.288 E.01592
G1 X64.251 Y75.787 E.69578
G1 X64.251 Y75.253 E.01592
G1 X47.749 Y91.755 E.69578
G1 X47.749 Y91.221 E.01592
G1 X64.251 Y74.72 E.69578
G1 X64.251 Y74.186 E.01592
G1 X47.749 Y90.687 E.69578
G1 X47.749 Y90.153 E.01592
G1 X64.251 Y73.652 E.69578
G1 X64.251 Y73.118 E.01592
G1 X47.749 Y89.619 E.69578
G1 X47.749 Y89.086 E.01592
G1 X64.251 Y72.585 E.69578
G1 X64.251 Y72.051 E.01592
G1 X47.749 Y88.552 E.69578
G1 X47.749 Y88.018 E.01592
G1 X64.251 Y71.517 E.69578
G1 X64.251 Y70.983 E.01592
G1 X47.749 Y87.484 E.69578
G1 X47.749 Y86.95 E.01592
G1 X64.251 Y70.449 E.69578
G1 X64.251 Y69.916 E.01592
G1 X47.749 Y86.417 E.69578
G1 X47.749 Y85.883 E.01592
G1 X64.251 Y69.382 E.69578
G1 X64.251 Y68.848 E.01592
G1 X47.749 Y85.349 E.69578
G1 X47.749 Y84.815 E.01592
G1 X64.251 Y68.314 E.69578
G1 X64.251 Y67.78 E.01592
G1 X47.749 Y84.281 E.69578
G1 X47.749 Y83.748 E.01592
G1 X64.251 Y67.247 E.69578
G1 X64.251 Y66.713 E.01592
G1 X47.749 Y83.214 E.69578
G1 X47.749 Y82.68 E.01592
G1 X64.251 Y66.179 E.69578
G1 X64.251 Y65.645 E.01592
G1 X47.749 Y82.146 E.69578
G1 X47.749 Y81.612 E.01592
G1 X64.251 Y65.111 E.69578
G1 X64.251 Y64.578 E.01592
G1 X47.749 Y81.079 E.69578
G1 X47.749 Y80.545 E.01592
G1 X64.251 Y64.044 E.69578
G1 X64.251 Y63.51 E.01592
G1 X47.749 Y80.011 E.69578
G1 X47.749 Y79.477 E.01592
G1 X64.251 Y62.976 E.69578
G1 X64.251 Y62.442 E.01592
G1 X47.749 Y78.943 E.69578
G1 X47.749 Y78.41 E.01592
G1 X64.251 Y61.909 E.69578
G1 X64.251 Y61.375 E.01592
G1 X47.749 Y77.876 E.69578
G1 X47.749 Y77.342 E.01592
G1 X64.251 Y60.841 E.69578
G1 X64.251 Y60.307 E.01592
G1 X47.749 Y76.808 E.69578
G1 X47.749 Y76.275 E.01592
G1 X64.251 Y59.773 E.69578
G1 X64.251 Y59.251 E.01559
G1 X64.773 Y59.251 E.01559
G1 X81.275 Y42.749 E.69578
G1 X81.808 Y42.749 E.01592
G1 X65.307 Y59.251 E.69578
G1 X65.841 Y59.251 E.01592
G1 X82.342 Y42.749 E.69578
G1 X82.876 Y42.749 E.01592
G1 X66.375 Y59.251 E.69578
G1 X66.909 Y59.251 E.01592
G1 X83.41 Y42.749 E.69578
G1 X83.944 Y42.749 E.01592
G1 X67.442 Y59.251 E.69578
G1 X67.976 Y59.251 E.01592
G1 X84.477 Y42.749 E.69578
G1 X85.011 Y42.749 E.01592
G1 X68.51 Y59.251 E.69578
G1 X69.044 Y59.251 E.01592
G1 X85.545 Y42.749 E.69578
G1 X86.079 Y42.749 E.01592
G1 X69.578 Y59.251 E.69578
G1 X70.111 Y59.251 E.01592
G1 X86.612 Y42.749 E.69578
G1 X87.146 Y42.749 E.01592
G1 X70.645 Y59.251 E.69578
G1 X71.179 Y59.251 E.01592
G1 X87.68 Y42.749 E.69578
G1 X88.214 Y42.749 E.01592
G1 X71.713 Y59.251 E.69578
G1 X72.247 Y59.251 E.01592
G1 X88.748 Y42.749 E.69578
G1 X89.281 Y42.749 E.01592
G1 X72.78 Y59.251 E.69578
G1 X73.314 Y59.251 E.01592
G1 X89.815 Y42.749 E.69578
G1 X90.349 Y42.749 E.01592
G1 X73.848 Y59.251 E.69578
G1 X74.382 Y59.251 E.01592
G1 X90.883 Y42.749 E.69578
G1 X91.417 Y42.749 E.01592
G1 X74.916 Y59.251 E.69578
G1 X75.449 Y59.251 E.01592
G1 X91.95 Y42.749 E.69578
G1 X92.484 Y42.749 E.01592
G1 X75.983 Y59.251 E.69578
G1 X76.517 Y59.251 E.01592
G1 X93.018 Y42.749 E.69578
G1 X93.552 Y42.749 E.01592
G1 X77.051 Y59.251 E.69578
G1 X77.585 Y59.251 E.01592
G1 X94.086 Y42.749 E.69578
G1 X94.619 Y42.749 E.01592
G1 X78.118 Y59.251 E.69578
G1 X78.652 Y59.251 E.01592
G1 X95.153 Y42.749 E.69578
G1 X95.687 Y42.749 E.01592
G1 X79.186 Y59.251 E.69578
G1 X79.72 Y59.251 E.01592
G1 X96.221 Y42.749 E.69578
G1 X96.755 Y42.749 E.01592
G1 X80.254 Y59.251 E.69578
G1 X80.787 Y59.251 E.01592
G1 X97.288 Y42.749 E.69578
G1 X97.822 Y42.749 E.01592
G1 X81.321 Y59.251 E.69578
G1 X81.855 Y59.251 E.01592
G1 X98.356 Y42.749 E.69578
G1 X98.89 Y42.749 E.01592
G1 X82.389 Y59.251 E.69578
G1 X82.922 Y59.251 E.01592
G1 X99.424 Y42.749 E.69578
G1 X99.957 Y42.749 E.01592
G1 X83.456 Y59.251 E.69578
G1 X83.99 Y59.251 E.01592
G1 X100.491 Y42.749 E.69578
G1 X101.025 Y42.749 E.01592
G1 X84.524 Y59.251 E.69578
G1 X85.058 Y59.251 E.01592
G1 X101.559 Y42.749 E.69578
G1 X102.093 Y42.749 E.01592
G1 X85.591 Y59.251 E.69578
G1 X86.125 Y59.251 E.01592
G1 X102.626 Y42.749 E.69578
G1 X103.16 Y42.749 E.01592
G1 X86.659 Y59.251 E.69578
G1 X87.193 Y59.251 E.01592
G1 X103.694 Y42.749 E.69578
G1 X104.228 Y42.749 E.01592
G1 X87.727 Y59.251 E.69578
G1 X88.26 Y59.251 E.01592
G1 X104.762 Y42.749 E.69578
G1 X105.295 Y42.749 E.01592
G1 X88.794 Y59.251 E.69578
G1 X89.328 Y59.251 E.01592
G1 X105.829 Y42.749 E.69578
G1 X106.363 Y42.749 E.01592
G1 X89.862 Y59.251 E.69578
G1 X90.396 Y59.251 E.01592
G1 X106.897 Y42.749 E.69578
G1 X107.43 Y42.749 E.01592
G1 X90.929 Y59.251 E.69578
G1 X91.463 Y59.251 E.01592
G1 X107.964 Y42.749 E.69578
G1 X108.498 Y42.749 E.01592
G1 X91.997 Y59.251 E.69578
G1 X92.531 Y59.251 E.01592
G1 X109.032 Y42.749 E.69578
G1 X109.566 Y42.749 E.01592
G1 X93.065 Y59.251 E.69578
G1 X93.598 Y59.251 E.01592
G1 X110.099 Y42.749 E.69578
G1 X110.633 Y42.749 E.01592
G1 X94.132 Y59.251 E.69578
G1 X94.666 Y59.251 E.01592
G1 X111.167 Y42.749 E.69578
G1 X111.701 Y42.749 E.01592
G1 X95.2 Y59.251 E.69578
G1 X95.734 Y59.251 E.01592
G1 X112.235 Y42.749 E.69578
G1 X112.768 Y42.749 E.01592
G1 X96.267 Y59.251 E.69578
G1 X96.801 Y59.251 E.01592
G1 X113.302 Y42.749 E.69578
G1 X113.836 Y42.749 E.01592
G1 X97.335 Y59.251 E.69578
G1 X97.869 Y59.251 E.01592
G1 X114.37 Y42.749 E.69578
G1 X114.904 Y42.749 E.01592
G1 X98.403 Y59.251 E.69578
G1 X98.936 Y59.251 E.01592
G1 X115.437 Y42.749 E.69578
G1 X115.971 Y42.749 E.01592
G1 X99.47 Y59.251 E.69578
G1 X100.004 Y59.251 E.01592
G1 X116.505 Y42.749 E.69578
G1 X117.039 Y42.749 E.01592
G1 X100.538 Y59.251 E.69578
G1 X101.072 Y59.251 E.01592
G1 X117.573 Y42.749 E.69578
G1 X118.106 Y42.749 E.01592
G1 X101.605 Y59.251 E.69578
G1 X102.139 Y59.251 E.01592
G1 X118.64 Y42.749 E.69578
G1 X119.174 Y42.749 E.01592
G1 X102.673 Y59.251 E.69578
G1 X103.207 Y59.251 E.01592
G1 X119.708 Y42.749 E.69578
G1 X120.242 Y42.749 E.01592
G1 X103.74 Y59.251 E.69578
G1 X104.274 Y59.251 E.01592
G1 X120.775 Y42.749 E.69578
G1 X121.309 Y42.749 E.01592
G1 X104.808 Y59.251 E.69578
G1 X105.342 Y59.251 E.01592
G1 X121.843 Y42.749 E.69578
G1 X122.377 Y42.749 E.01592
G1 X105.876 Y59.251 E.69578
G1 X106.409 Y59.251 E.01592
G1 X122.911 Y42.749 E.69578
G1 X123.444 Y42.749 E.01592
G1 X106.943 Y59.251 E.69578
G1 X107.477 Y59.251 E.01592
G1 X123.978 Y42.749 E.69578
G1 X124.512 Y42.749 E.01592
G1 X108.011 Y59.251 E.69578
G1 X108.545 Y59.251 E.01592
G1 X125.046 Y42.749 E.69578
G1 X125.58 Y42.749 E.01592
G1 X109.078 Y59.251 E.69578
G1 X109.612 Y59.251 E.01592
G1 X126.113 Y42.749 E.69578
G1 X126.647 Y42.749 E.01592
G1 X110.146 Y59.251 E.69578
G1 X110.68 Y59.251 E.01592
G1 X127.181 Y42.749 E.69578
G1 X127.715 Y42.749 E.01592
G1 X111.214 Y59.251 E.69578
G1 X111.747 Y59.251 E.01592
G1 X128.249 Y42.749 E.69578
G1 X128.782 Y42.749 E.01592
G1 X112.281 Y59.251 E.69578
G1 X112.815 Y59.251 E.01592
G1 X129.316 Y42.749 E.69578
G1 X129.85 Y42.749 E.01592
G1 X113.349 Y59.251 E.69578
G1 X113.883 Y59.251 E.01592
G1 X130.384 Y42.749 E.69578
G1 X130.917 Y42.749 E.01592
G1 X114.416 Y59.251 E.69578
G1 X114.95 Y59.251 E.01592
G1 X131.451 Y42.749 E.69578
G1 X131.985 Y42.749 E.01592
G1 X127.192 Y47.542 E.2021
G3 X127.811 Y47.457 I.983 J4.839 E.01865
G1 X132.519 Y42.749 E.1985
G1 X133.053 Y42.749 E.01592
G1 X128.335 Y47.467 E.19892
G3 X128.793 Y47.543 I-.149 J2.327 E.01387
G1 X133.586 Y42.749 E.20211
G1 X134.12 Y42.749 E.01592
G1 X129.206 Y47.663 E.20719
G3 X129.582 Y47.822 I-.606 J1.954 E.01216
G1 X134.654 Y42.749 E.21389
G1 X135.188 Y42.749 E.01592
G1 X129.923 Y48.014 E.222
G3 X130.232 Y48.239 I-7.695 J10.915 E.01139
G1 X135.722 Y42.749 E.23147
G1 X136.255 Y42.749 E.01592
G1 X130.512 Y48.492 E.24216
G3 X130.764 Y48.774 I-1.28 J1.397 E.01129
G1 X136.789 Y42.749 E.25405
G1 X137.323 Y42.749 E.01592
G1 X130.987 Y49.085 E.26716
G3 X131.18 Y49.427 I-1.603 J1.129 E.0117
G1 X137.857 Y42.749 E.28156
G1 X138.391 Y42.749 E.01592
G1 X131.339 Y49.801 E.29735
M73 P31 R47
G3 X131.46 Y50.214 I-2 J.814 E.01284
G1 X138.924 Y42.749 E.31474
G1 X139.458 Y42.749 E.01592
G1 X131.535 Y50.672 E.33408
G3 X131.542 Y51.2 I-2.626 J.296 E.01575
G1 X139.992 Y42.749 E.35632
G1 X140.526 Y42.749 E.01592
G1 X131.205 Y52.071 E.39303
; WIPE_START
G1 X132.619 Y50.656 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.018 Y49.964 Z.8 F30000
G1 X124.791 Y49.943 Z.8
G1 Z.4
G1 E.8 F1800
G1 F9537.687
G1 X115.484 Y59.251 E.39246
G1 X116.018 Y59.251 E.01592
G1 X124.454 Y50.815 E.3557
G2 X124.468 Y51.334 I5.059 J.115 E.01549
G1 X116.552 Y59.251 E.33382
G1 X117.085 Y59.251 E.01592
G1 X124.542 Y51.794 E.3144
G2 X124.661 Y52.209 I2.13 J-.388 E.01288
G1 X117.619 Y59.251 E.29692
G1 X118.153 Y59.251 E.01592
G1 X124.822 Y52.581 E.28121
G2 X125.016 Y52.921 I1.793 J-.801 E.01168
G1 X118.687 Y59.251 E.2669
G1 X119.221 Y59.251 E.01592
G1 X125.241 Y53.23 E.25385
G2 X125.494 Y53.511 I1.525 J-1.121 E.01129
G1 X119.754 Y59.251 E.24202
G1 X120.288 Y59.251 E.01592
G1 X125.776 Y53.763 E.23138
G2 X126.086 Y53.987 I1.269 J-1.436 E.01142
G1 X120.822 Y59.251 E.22196
G1 X121.356 Y59.251 E.01592
G1 X126.427 Y54.18 E.21382
G2 X126.8 Y54.34 I.987 J-1.787 E.01214
G1 X121.89 Y59.251 E.20707
G1 X122.423 Y59.251 E.01592
G1 X127.211 Y54.463 E.20188
G2 X127.675 Y54.533 I.581 J-2.281 E.01401
G1 X122.957 Y59.251 E.19893
G1 X123.491 Y59.251 E.01592
G1 X128.198 Y54.543 E.19848
G2 X128.825 Y54.45 I-.254 J-3.859 E.01892
G1 X124.025 Y59.251 E.20241
G1 X124.558 Y59.251 E.01592
G1 X141.06 Y42.749 E.69578
G1 X141.593 Y42.749 E.01592
G1 X125.092 Y59.251 E.69578
G1 X125.626 Y59.251 E.01592
G1 X142.127 Y42.749 E.69578
G1 X142.661 Y42.749 E.01592
G1 X126.16 Y59.251 E.69578
G1 X126.694 Y59.251 E.01592
G1 X143.195 Y42.749 E.69578
G1 X143.729 Y42.749 E.01592
G1 X127.227 Y59.251 E.69578
G1 X127.761 Y59.251 E.01592
G1 X144.262 Y42.749 E.69578
G1 X144.796 Y42.749 E.01592
G1 X128.295 Y59.251 E.69578
G1 X128.829 Y59.251 E.01592
G1 X145.33 Y42.749 E.69578
G1 X145.864 Y42.749 E.01592
G1 X129.363 Y59.251 E.69578
G1 X129.896 Y59.251 E.01592
G1 X146.398 Y42.749 E.69578
G1 X146.931 Y42.749 E.01592
G1 X130.43 Y59.251 E.69578
G1 X130.964 Y59.251 E.01592
G1 X147.465 Y42.749 E.69578
G1 X147.999 Y42.749 E.01592
G1 X131.498 Y59.251 E.69578
G1 X132.032 Y59.251 E.01592
G1 X148.533 Y42.749 E.69578
G1 X149.067 Y42.749 E.01592
G1 X132.565 Y59.251 E.69578
G1 X133.099 Y59.251 E.01592
G1 X149.6 Y42.749 E.69578
G1 X150.134 Y42.749 E.01592
G1 X133.633 Y59.251 E.69578
G1 X134.167 Y59.251 E.01592
G1 X150.668 Y42.749 E.69578
G1 X151.202 Y42.749 E.01592
G1 X134.701 Y59.251 E.69578
G1 X135.234 Y59.251 E.01592
G1 X151.735 Y42.749 E.69578
G1 X152.269 Y42.749 E.01592
G1 X135.768 Y59.251 E.69578
G1 X136.302 Y59.251 E.01592
G1 X152.803 Y42.749 E.69578
G1 X153.337 Y42.749 E.01592
G1 X136.836 Y59.251 E.69578
G1 X137.37 Y59.251 E.01592
G1 X153.871 Y42.749 E.69578
G1 X154.404 Y42.749 E.01592
G1 X137.903 Y59.251 E.69578
G1 X138.437 Y59.251 E.01592
G1 X154.938 Y42.749 E.69578
G1 X155.472 Y42.749 E.01592
G1 X138.971 Y59.251 E.69578
G1 X139.505 Y59.251 E.01592
G1 X156.006 Y42.749 E.69578
G1 X156.54 Y42.749 E.01592
G1 X140.039 Y59.251 E.69578
G1 X140.572 Y59.251 E.01592
G1 X157.073 Y42.749 E.69578
G1 X157.607 Y42.749 E.01592
G1 X141.106 Y59.251 E.69578
G1 X141.64 Y59.251 E.01592
G1 X158.141 Y42.749 E.69578
G1 X158.675 Y42.749 E.01592
G1 X142.174 Y59.251 E.69578
G1 X142.708 Y59.251 E.01592
G1 X159.209 Y42.749 E.69578
G1 X159.742 Y42.749 E.01592
G1 X143.241 Y59.251 E.69578
G1 X143.775 Y59.251 E.01592
G1 X160.276 Y42.749 E.69578
G1 X160.81 Y42.749 E.01592
G1 X144.309 Y59.251 E.69578
G1 X144.843 Y59.251 E.01592
G1 X161.344 Y42.749 E.69578
G1 X161.878 Y42.749 E.01592
G1 X145.377 Y59.251 E.69578
G1 X145.91 Y59.251 E.01592
G1 X162.411 Y42.749 E.69578
G1 X162.945 Y42.749 E.01592
G1 X146.444 Y59.251 E.69578
G1 X146.978 Y59.251 E.01592
G1 X163.479 Y42.749 E.69578
G1 X164.013 Y42.749 E.01592
G1 X147.512 Y59.251 E.69578
G1 X148.045 Y59.251 E.01592
G1 X164.547 Y42.749 E.69578
G1 X165.08 Y42.749 E.01592
G1 X148.579 Y59.251 E.69578
G1 X149.113 Y59.251 E.01592
G1 X165.614 Y42.749 E.69578
G1 X166.148 Y42.749 E.01592
G1 X149.647 Y59.251 E.69578
G1 X150.181 Y59.251 E.01592
G1 X166.682 Y42.749 E.69578
G1 X167.216 Y42.749 E.01592
G1 X150.714 Y59.251 E.69578
G1 X151.248 Y59.251 E.01592
G1 X167.749 Y42.749 E.69578
G1 X168.283 Y42.749 E.01592
G1 X151.782 Y59.251 E.69578
G1 X152.316 Y59.251 E.01592
G1 X168.817 Y42.749 E.69578
G1 X169.351 Y42.749 E.01592
G1 X152.85 Y59.251 E.69578
G1 X153.383 Y59.251 E.01592
G1 X169.885 Y42.749 E.69578
G1 X170.418 Y42.749 E.01592
G1 X153.917 Y59.251 E.69578
G1 X154.451 Y59.251 E.01592
G1 X170.952 Y42.749 E.69578
G1 X171.486 Y42.749 E.01592
G1 X154.985 Y59.251 E.69578
G1 X155.519 Y59.251 E.01592
G1 X172.02 Y42.749 E.69578
G1 X172.553 Y42.749 E.01592
G1 X156.052 Y59.251 E.69578
G1 X156.586 Y59.251 E.01592
G1 X173.087 Y42.749 E.69578
G1 X173.621 Y42.749 E.01592
G1 X157.12 Y59.251 E.69578
G1 X157.654 Y59.251 E.01592
G1 X174.155 Y42.749 E.69578
G1 X174.689 Y42.749 E.01592
G1 X158.188 Y59.251 E.69578
G1 X158.721 Y59.251 E.01592
G1 X175.222 Y42.749 E.69578
G1 X175.756 Y42.749 E.01592
G1 X159.255 Y59.251 E.69578
G1 X159.789 Y59.251 E.01592
G1 X176.29 Y42.749 E.69578
G1 X176.824 Y42.749 E.01592
G1 X160.323 Y59.251 E.69578
G1 X160.857 Y59.251 E.01592
G1 X177.358 Y42.749 E.69578
G1 X177.891 Y42.749 E.01592
G1 X161.39 Y59.251 E.69578
G1 X161.924 Y59.251 E.01592
G1 X178.425 Y42.749 E.69578
G1 X178.959 Y42.749 E.01592
G1 X162.458 Y59.251 E.69578
G1 X162.992 Y59.251 E.01592
G1 X179.493 Y42.749 E.69578
G1 X180.027 Y42.749 E.01592
G1 X163.526 Y59.251 E.69578
G1 X164.059 Y59.251 E.01592
G1 X180.56 Y42.749 E.69578
G1 X181.094 Y42.749 E.01592
G1 X164.593 Y59.251 E.69578
G1 X165.127 Y59.251 E.01592
G1 X181.628 Y42.749 E.69578
G1 X182.162 Y42.749 E.01592
G1 X165.661 Y59.251 E.69578
G1 X166.195 Y59.251 E.01592
G1 X182.696 Y42.749 E.69578
G1 X183.229 Y42.749 E.01592
G1 X166.728 Y59.251 E.69578
G1 X167.262 Y59.251 E.01592
G1 X183.763 Y42.749 E.69578
G1 X184.297 Y42.749 E.01592
G1 X167.796 Y59.251 E.69578
G1 X168.33 Y59.251 E.01592
G1 X184.831 Y42.749 E.69578
G1 X185.365 Y42.749 E.01592
G1 X168.863 Y59.251 E.69578
G1 X169.397 Y59.251 E.01592
G1 X185.898 Y42.749 E.69578
G1 X186.432 Y42.749 E.01592
G1 X169.931 Y59.251 E.69578
G1 X170.465 Y59.251 E.01592
G1 X186.966 Y42.749 E.69578
G1 X187.5 Y42.749 E.01592
G1 X170.999 Y59.251 E.69578
G1 X171.532 Y59.251 E.01592
G1 X188.034 Y42.749 E.69578
G1 X188.567 Y42.749 E.01592
G1 X172.066 Y59.251 E.69578
G1 X172.6 Y59.251 E.01592
G1 X189.101 Y42.749 E.69578
G1 X189.635 Y42.749 E.01592
G1 X173.134 Y59.251 E.69578
G1 X173.668 Y59.251 E.01592
G1 X190.169 Y42.749 E.69578
G1 X190.703 Y42.749 E.01592
G1 X174.201 Y59.251 E.69578
G1 X174.735 Y59.251 E.01592
G1 X191.236 Y42.749 E.69578
G1 X191.77 Y42.749 E.01592
G1 X175.269 Y59.251 E.69578
G1 X175.803 Y59.251 E.01592
G1 X192.304 Y42.749 E.69578
G1 X192.838 Y42.749 E.01592
G1 X176.337 Y59.251 E.69578
G1 X176.87 Y59.251 E.01592
G1 X193.371 Y42.749 E.69578
G1 X193.905 Y42.749 E.01592
G1 X177.404 Y59.251 E.69578
G1 X177.938 Y59.251 E.01592
G1 X194.439 Y42.749 E.69578
G1 X194.973 Y42.749 E.01592
G1 X178.472 Y59.251 E.69578
G1 X179.006 Y59.251 E.01592
G1 X195.507 Y42.749 E.69578
G1 X196.04 Y42.749 E.01592
G1 X179.539 Y59.251 E.69578
G1 X180.073 Y59.251 E.01592
G1 X196.574 Y42.749 E.69578
G1 X197.108 Y42.749 E.01592
G1 X180.607 Y59.251 E.69578
G1 X181.141 Y59.251 E.01592
G1 X197.642 Y42.749 E.69578
G1 X198.176 Y42.749 E.01592
G1 X181.675 Y59.251 E.69578
G1 X182.208 Y59.251 E.01592
G1 X198.709 Y42.749 E.69578
G1 X199.243 Y42.749 E.01592
G1 X182.742 Y59.251 E.69578
G1 X183.276 Y59.251 E.01592
G1 X199.777 Y42.749 E.69578
G1 X200.311 Y42.749 E.01592
G1 X183.81 Y59.251 E.69578
G1 X184.344 Y59.251 E.01592
G1 X200.845 Y42.749 E.69578
G1 X201.378 Y42.749 E.01592
G1 X184.877 Y59.251 E.69578
G1 X185.411 Y59.251 E.01592
G1 X201.912 Y42.749 E.69578
G1 X202.446 Y42.749 E.01592
G1 X185.775 Y59.42 E.70294
G1 X47.58 Y54.025 F30000
G1 F9537.687
G1 X58.855 Y42.749 E.47544
G1 X58.321 Y42.749 E.01592
G1 X47.749 Y53.321 E.44577
G1 X47.749 Y52.788 E.01592
G1 X57.788 Y42.749 E.42327
G1 X57.254 Y42.749 E.01592
G1 X47.749 Y52.254 E.40076
G1 X47.749 Y51.72 E.01592
G1 X56.72 Y42.749 E.37825
G1 X56.186 Y42.749 E.01592
G1 X47.749 Y51.186 E.35574
G1 X47.749 Y50.652 E.01592
G1 X55.652 Y42.749 E.33323
G1 X55.119 Y42.749 E.01592
G1 X47.749 Y50.119 E.31073
G1 X47.749 Y49.585 E.01592
G1 X54.585 Y42.749 E.28822
G1 X54.051 Y42.749 E.01592
G1 X47.749 Y49.051 E.26571
G1 X47.749 Y48.517 E.01592
G1 X53.517 Y42.749 E.2432
G1 X52.983 Y42.749 E.01592
G1 X47.749 Y47.983 E.22069
G1 X47.749 Y47.45 E.01592
G1 X52.45 Y42.749 E.19819
G1 X51.916 Y42.749 E.01592
G1 X47.749 Y46.916 E.17568
G1 X47.749 Y46.382 E.01592
G1 X51.382 Y42.749 E.15317
G1 X50.848 Y42.749 E.01592
G1 X47.749 Y45.848 E.13066
G1 X47.749 Y45.314 E.01592
G1 X50.314 Y42.749 E.10815
G1 X49.781 Y42.749 E.01592
M73 P31 R46
G1 X47.749 Y44.781 E.08565
G1 X47.749 Y44.247 E.01592
G1 X49.247 Y42.749 E.06314
G1 X48.713 Y42.749 E.01592
G1 X47.749 Y43.713 E.04063
G1 X47.749 Y43.179 E.01592
G1 X48.349 Y42.58 E.02528
G1 X69.167 Y42.58 F30000
G1 F9537.687
G1 X59.185 Y52.562 E.42089
G2 X59.472 Y51.741 I-3.348 J-1.63 E.02597
G1 X68.463 Y42.749 E.37914
G1 X67.93 Y42.749 E.01592
G1 X59.545 Y51.134 E.35355
G2 X59.529 Y50.616 I-4.481 J-.125 E.01547
G1 X67.396 Y42.749 E.3317
G1 X66.862 Y42.749 E.01592
G1 X59.448 Y50.164 E.31264
G2 X59.322 Y49.756 I-2.107 J.424 E.01276
G1 X66.328 Y42.749 E.29543
G1 X65.794 Y42.749 E.01592
G1 X59.159 Y49.385 E.27978
G2 X58.963 Y49.047 I-1.783 J.807 E.01167
G1 X65.261 Y42.749 E.26553
G1 X64.727 Y42.749 E.01592
G1 X58.737 Y48.739 E.25255
G2 X58.482 Y48.46 I-1.522 J1.136 E.01128
G1 X64.193 Y42.749 E.2408
G1 X63.659 Y42.749 E.01592
G1 X58.198 Y48.211 E.2303
G2 X57.883 Y47.991 I-1.259 J1.466 E.01145
G1 X63.126 Y42.749 E.22103
G1 X62.592 Y42.749 E.01592
G1 X57.539 Y47.803 E.21307
G2 X57.16 Y47.648 I-.964 J1.816 E.01222
G1 X62.058 Y42.749 E.20653
G1 X61.524 Y42.749 E.01592
G1 X56.743 Y47.531 E.20162
G2 X56.28 Y47.46 I-.586 J2.277 E.01398
G1 X60.99 Y42.749 E.19863
G1 X60.457 Y42.749 E.01592
G1 X55.744 Y47.462 E.19871
G2 X55.105 Y47.567 I.304 J3.85 E.01932
G1 X59.923 Y42.749 E.20313
G1 X59.389 Y42.749 E.01592
G1 X47.749 Y54.389 E.49079
G1 X47.749 Y54.923 E.01592
G1 X52.562 Y50.11 E.20294
G2 X52.461 Y50.745 I4.605 J1.064 E.01921
G1 X47.749 Y55.457 E.19865
G1 X47.749 Y55.99 E.01592
G1 X52.463 Y51.277 E.19874
G2 X52.531 Y51.742 I2.359 J-.109 E.01405
G1 X47.749 Y56.524 E.20162
G1 X47.749 Y57.058 E.01592
G1 X52.646 Y52.161 E.20647
G2 X52.8 Y52.541 I1.974 J-.58 E.01224
G1 X47.749 Y57.592 E.21297
G1 X47.749 Y58.125 E.01592
G1 X52.991 Y52.884 E.22102
G2 X53.212 Y53.196 I1.673 J-.95 E.01144
G1 X47.749 Y58.659 E.23035
G1 X47.749 Y59.193 E.01592
G1 X53.462 Y53.48 E.24089
G2 X53.741 Y53.735 I1.413 J-1.261 E.01128
G1 X47.749 Y59.727 E.25263
G1 X47.749 Y60.261 E.01592
G1 X54.048 Y53.962 E.26559
G2 X54.385 Y54.158 I1.15 J-1.587 E.01166
G1 X47.749 Y60.794 E.27981
G1 X47.749 Y61.328 E.01592
G1 X54.756 Y54.322 E.29542
G2 X55.162 Y54.449 I.838 J-1.97 E.01273
G1 X47.749 Y61.862 E.31257
G1 X47.749 Y62.396 E.01592
G1 X55.617 Y54.528 E.33174
G2 X56.134 Y54.545 I.341 J-2.578 E.01546
G1 X47.749 Y62.93 E.35355
G1 X47.749 Y63.463 E.01592
G1 X56.744 Y54.469 E.37928
G2 X57.558 Y54.189 I-.782 J-3.595 E.02572
G1 X47.749 Y63.997 E.41359
G1 X47.749 Y64.531 E.01592
G1 X69.531 Y42.749 E.91844
G1 X70.065 Y42.749 E.01592
G1 X47.749 Y65.065 E.94095
G1 X47.749 Y65.599 E.01592
G1 X70.599 Y42.749 E.96346
G1 X71.132 Y42.749 E.01592
G1 X47.749 Y66.132 E.98596
G1 X47.749 Y66.666 E.01592
G1 X71.666 Y42.749 E1.00847
G1 X72.2 Y42.749 E.01592
G1 X47.749 Y67.2 E1.03098
G1 X47.749 Y67.734 E.01592
G1 X72.734 Y42.749 E1.05349
G1 X73.268 Y42.749 E.01592
G1 X47.749 Y68.268 E1.076
G1 X47.749 Y68.801 E.01592
G1 X73.801 Y42.749 E1.0985
G1 X74.335 Y42.749 E.01592
G1 X47.749 Y69.335 E1.12101
G1 X47.749 Y69.869 E.01592
G1 X74.869 Y42.749 E1.14352
G1 X75.403 Y42.749 E.01592
G1 X47.749 Y70.403 E1.16603
G1 X47.749 Y70.937 E.01592
G1 X75.937 Y42.749 E1.18854
G1 X76.47 Y42.749 E.01592
G1 X47.749 Y71.47 E1.21105
G1 X47.749 Y72.004 E.01592
G1 X77.004 Y42.749 E1.23355
G1 X77.538 Y42.749 E.01592
G1 X47.749 Y72.538 E1.25606
G1 X47.749 Y73.072 E.01592
G1 X78.072 Y42.749 E1.27857
G1 X78.606 Y42.749 E.01592
G1 X47.749 Y73.606 E1.30108
G1 X47.749 Y74.139 E.01592
G1 X79.139 Y42.749 E1.32358
G1 X79.673 Y42.749 E.01592
G1 X47.749 Y74.673 E1.34609
G1 X47.749 Y75.207 E.01592
G1 X80.207 Y42.749 E1.3686
G1 X80.741 Y42.749 E.01592
G1 X47.58 Y75.91 E1.39826
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9537.687
G1 X48.994 Y74.496 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/58
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
G1 X200.93 Y122.922
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X201.176 Y123.004 E.00834
G3 X199.7 Y122.799 I-1.166 J2.997 E.60141
G3 X200.871 Y122.902 I.315 J3.134 E.03803
G1 X200.873 Y122.903 E.00005
G1 X200.412 Y123.223 F30000
G1 F8843.478
G1 X200.488 Y123.232 E.00246
G3 X200.761 Y123.295 I-.475 J2.713 E.00901
G3 X199.731 Y123.205 I-.753 J2.706 E.53402
G3 X200.21 Y123.198 I.282 J2.74 E.01544
G1 X200.352 Y123.215 E.00462
G1 X200.033 Y123.607 F30000
G1 F8843.478
G1 X200.179 Y123.606 E.0047
G3 X200.417 Y123.634 I-.178 J2.599 E.0077
G3 X199.761 Y123.611 I-.409 J2.366 E.46391
G1 X199.973 Y123.608 E.00682
G1 X199.786 Y124.003 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X199.79 Y124.002 E.00013
G3 X200.15 Y123.995 I.215 J1.794 E.01074
G3 X199.553 Y124.043 I-.141 J2.004 E.35812
G1 X199.727 Y124.013 E.00524
; WIPE_START
M204 S10000
G1 X199.79 Y124.002 E-.02449
G1 X200.15 Y123.995 E-.13677
G1 X200.544 Y124.065 E-.15212
G1 X200.917 Y124.211 E-.15212
G1 X201.253 Y124.428 E-.15214
G1 X201.522 Y124.69 E-.14236
; WIPE_END
G1 E-.04 F1800
G1 X201.221 Y117.063 Z1 F30000
G1 X198.508 Y48.153 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X198.679 Y48.073 E.00607
G3 X199.7 Y47.799 I1.33 J2.928 E.03414
G3 X200.871 Y47.902 I.315 J3.134 E.03803
G3 X198.395 Y48.219 I-.862 J3.098 E.56728
G1 X198.457 Y48.183 E.00231
G1 X198.995 Y48.379 F30000
G1 F8843.478
G1 X199.106 Y48.34 E.00379
G3 X199.731 Y48.205 I.902 J2.66 E.02058
G3 X200.761 Y48.295 I.282 J2.741 E.03346
G3 X198.846 Y48.443 I-.753 J2.706 E.50445
G1 X198.94 Y48.403 E.00327
G1 X199.422 Y48.672 F30000
G1 F8843.478
G1 X199.466 Y48.661 E.00146
G3 X199.761 Y48.611 I.542 J2.339 E.00962
G3 X200.417 Y48.634 I.24 J2.594 E.02117
G3 X199.014 Y48.814 I-.409 J2.366 E.4389
G1 X199.366 Y48.692 E.01198
G1 X199.786 Y49.003 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X199.79 Y49.002 E.00013
G3 X200.15 Y48.995 I.215 J1.794 E.01074
G3 X199.553 Y49.043 I-.141 J2.004 E.35812
G1 X199.727 Y49.013 E.00525
; WIPE_START
M204 S10000
G1 X199.79 Y49.002 E-.02441
G1 X200.15 Y48.995 E-.13676
G1 X200.544 Y49.065 E-.15214
G1 X200.917 Y49.211 E-.1521
G1 X201.253 Y49.428 E-.15217
G1 X201.522 Y49.69 E-.14242
; WIPE_END
G1 E-.04 F1800
G1 X193.892 Y49.504 Z1 F30000
G1 X128.93 Y47.922 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X129.176 Y48.004 E.00835
G3 X127.7 Y47.799 I-1.167 J2.997 E.6014
G3 X128.872 Y47.902 I.315 J3.132 E.03804
G1 X128.873 Y47.903 E.00003
G1 X128.412 Y48.223 F30000
G1 F8843.478
G1 X128.488 Y48.232 E.00247
G3 X128.761 Y48.295 I-.475 J2.712 E.00902
G3 X127.731 Y48.205 I-.754 J2.706 E.53402
G3 X128.21 Y48.198 I.282 J2.739 E.01543
G1 X128.352 Y48.215 E.00461
G1 X128.033 Y48.607 F30000
G1 F8843.478
G1 X128.179 Y48.606 E.00471
G3 X128.417 Y48.634 I-.178 J2.598 E.0077
G3 X127.761 Y48.611 I-.409 J2.366 E.46392
G1 X127.973 Y48.608 E.00681
G1 X127.786 Y49.003 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X127.79 Y49.002 E.00013
G3 X128.15 Y48.995 I.215 J1.794 E.01074
G3 X127.553 Y49.043 I-.141 J2.004 E.35812
G1 X127.727 Y49.013 E.00524
; WIPE_START
M204 S10000
G1 X127.79 Y49.002 E-.0245
G1 X128.15 Y48.995 E-.13677
G1 X128.544 Y49.065 E-.15214
G1 X128.917 Y49.211 E-.15208
G1 X129.253 Y49.428 E-.15216
G1 X129.522 Y49.69 E-.14235
; WIPE_END
G1 E-.04 F1800
G1 X121.891 Y49.504 Z1 F30000
G1 X56.929 Y47.922 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X57.176 Y48.004 E.00835
G3 X55.7 Y47.799 I-1.167 J2.997 E.6014
G3 X56.872 Y47.902 I.315 J3.132 E.03804
G1 X56.873 Y47.903 E.00003
G1 X56.412 Y48.223 F30000
G1 F8843.478
G1 X56.488 Y48.232 E.00247
G3 X56.761 Y48.295 I-.475 J2.712 E.00902
G3 X55.731 Y48.205 I-.754 J2.706 E.53402
G3 X56.21 Y48.198 I.282 J2.739 E.01544
G1 X56.352 Y48.215 E.00461
G1 X56.033 Y48.607 F30000
G1 F8843.478
G1 X56.179 Y48.606 E.00471
G3 X56.417 Y48.634 I-.178 J2.599 E.0077
G3 X55.761 Y48.611 I-.409 J2.366 E.46391
G1 X55.973 Y48.608 E.00681
G1 X55.786 Y49.003 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X55.79 Y49.002 E.00013
G3 X56.15 Y48.995 I.215 J1.794 E.01074
G3 X55.553 Y49.043 I-.141 J2.004 E.35812
G1 X55.727 Y49.013 E.00524
; WIPE_START
M204 S10000
G1 X55.79 Y49.002 E-.0245
G1 X56.15 Y48.995 E-.13676
G1 X56.544 Y49.065 E-.15215
G1 X56.917 Y49.211 E-.15208
G1 X57.253 Y49.428 E-.15217
G1 X57.522 Y49.69 E-.14234
; WIPE_END
G1 E-.04 F1800
G1 X62.744 Y55.256 Z1 F30000
G1 X191.416 Y192.416 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X64.584 Y192.416 E4.07847
G1 X64.584 Y59.584 E4.27141
G1 X191.416 Y59.584 E4.07847
G1 X191.416 Y192.356 E4.26948
G1 X191.009 Y192.009 F30000
G1 F8843.478
G1 X64.991 Y192.009 E4.05229
G1 X64.991 Y59.991 E4.24523
G1 X191.009 Y59.991 E4.05229
G1 X191.009 Y191.949 E4.2433
G1 X190.602 Y191.602 F30000
G1 F8843.478
G1 X65.398 Y191.602 E4.02611
G1 X65.398 Y60.398 E4.21905
G1 X190.602 Y60.398 E4.02611
G1 X190.602 Y191.542 E4.21712
G1 X190.21 Y191.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X65.79 Y191.21 E3.70605
G1 X65.79 Y60.79 E3.88477
G1 X190.21 Y60.79 E3.70605
G1 X190.21 Y191.15 E3.88298
; WIPE_START
M204 S10000
G1 X188.21 Y191.151 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X181.352 Y187.801 Z1 F30000
G1 X58.627 Y127.854 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X58.469 Y128.072 E.00866
G3 X55.7 Y122.799 I-2.46 J-2.072 E.40497
G3 X56.872 Y122.902 I.315 J3.134 E.03804
G3 X58.668 Y127.81 I-.862 J3.098 E.19617
G1 X58.301 Y127.611 F30000
G1 F8843.478
G1 X58.156 Y127.809 E.00791
G3 X55.731 Y123.205 I-2.149 J-1.809 E.35347
G3 X56.761 Y123.295 I.282 J2.74 E.03346
G3 X58.34 Y127.565 I-.753 J2.706 E.17072
G1 X57.975 Y127.347 F30000
G1 F8843.478
G1 X57.844 Y127.547 E.00771
G3 X55.761 Y123.611 I-1.836 J-1.548 E.30178
G3 X56.417 Y123.634 I.24 J2.594 E.02117
G3 X58.115 Y127.152 I-.409 J2.366 E.1467
G1 X58.01 Y127.298 E.00578
G1 X57.631 Y127.169 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X57.407 Y127.442 E.01053
G3 X55.79 Y124.002 I-1.398 J-1.443 E.22755
G3 X56.15 Y123.995 I.215 J1.794 E.01074
M73 P32 R46
G3 X57.673 Y127.126 I-.141 J2.004 E.12542
; WIPE_START
M204 S10000
G1 X57.407 Y127.442 E-.15699
G1 X57.091 Y127.689 E-.15233
G1 X56.734 Y127.871 E-.15212
G1 X56.349 Y127.98 E-.15211
G1 X55.965 Y128.008 E-.14646
; WIPE_END
G1 E-.04 F1800
G1 X56.07 Y135.64 Z1 F30000
G1 X56.929 Y197.922 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X57.176 Y198.004 E.00836
G3 X55.7 Y197.8 I-1.167 J2.997 E.60149
G3 X56.872 Y197.902 I.316 J3.131 E.03805
G1 X56.872 Y197.903 E.00002
G1 X56.411 Y198.223 F30000
G1 F8843.478
G1 X56.488 Y198.232 E.00248
G3 X56.761 Y198.295 I-.475 J2.711 E.00902
G3 X55.731 Y198.205 I-.754 J2.706 E.53402
G3 X56.21 Y198.198 I.282 J2.738 E.01544
G1 X56.352 Y198.215 E.0046
G1 X56.033 Y198.607 F30000
G1 F8843.478
G1 X56.179 Y198.606 E.00472
G3 X56.417 Y198.634 I-.178 J2.599 E.0077
G3 X55.761 Y198.611 I-.409 J2.366 E.46391
G1 X55.973 Y198.608 E.0068
G1 X55.779 Y199.004 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X55.79 Y199.002 E.00034
G3 X56.15 Y198.995 I.215 J1.793 E.01074
G3 X55.553 Y199.043 I-.141 J2.004 E.35812
G1 X55.72 Y199.014 E.00504
; WIPE_START
M204 S10000
G1 X55.79 Y199.002 E-.02709
G1 X56.15 Y198.995 E-.13677
G1 X56.349 Y199.02 E-.07618
G1 X56.734 Y199.129 E-.15213
G1 X57.091 Y199.311 E-.15212
G1 X57.404 Y199.561 E-.1521
G1 X57.511 Y199.689 E-.0636
; WIPE_END
G1 E-.04 F1800
G1 X65.141 Y199.5 Z1 F30000
G1 X128.929 Y197.922 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X129.176 Y198.004 E.00836
G3 X127.7 Y197.799 I-1.167 J2.997 E.6014
G3 X128.872 Y197.902 I.315 J3.132 E.03804
G1 X128.872 Y197.903 E.00002
G1 X128.411 Y198.223 F30000
G1 F8843.478
G1 X128.488 Y198.232 E.00248
G3 X128.761 Y198.295 I-.475 J2.712 E.00902
G3 X127.731 Y198.205 I-.753 J2.706 E.53402
G3 X128.21 Y198.198 I.282 J2.739 E.01543
G1 X128.352 Y198.215 E.0046
G1 X128.032 Y198.607 F30000
G1 F8843.478
G1 X128.179 Y198.606 E.00472
G3 X128.417 Y198.634 I-.178 J2.599 E.0077
G3 X127.761 Y198.611 I-.409 J2.366 E.46392
G1 X127.973 Y198.608 E.0068
G1 X127.779 Y199.004 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X127.79 Y199.002 E.00034
G3 X128.15 Y198.995 I.215 J1.793 E.01074
G3 X127.553 Y199.043 I-.141 J2.004 E.35812
G1 X127.72 Y199.014 E.00504
; WIPE_START
M204 S10000
G1 X127.79 Y199.002 E-.0271
G1 X128.15 Y198.995 E-.13677
G1 X128.544 Y199.065 E-.15214
G1 X128.917 Y199.211 E-.15209
G1 X129.253 Y199.428 E-.15215
G1 X129.404 Y199.561 E-.07615
G1 X129.511 Y199.689 E-.0636
; WIPE_END
G1 E-.04 F1800
G1 X137.141 Y199.5 Z1 F30000
G1 X200.93 Y197.922 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X201.176 Y198.004 E.00835
G3 X199.7 Y197.799 I-1.167 J2.997 E.6014
G3 X200.872 Y197.902 I.315 J3.134 E.03804
G1 X200.873 Y197.903 E.00003
G1 X200.412 Y198.223 F30000
G1 F8843.478
G1 X200.488 Y198.232 E.00247
G3 X200.761 Y198.295 I-.475 J2.713 E.00902
G3 X199.731 Y198.205 I-.753 J2.706 E.53402
G3 X200.21 Y198.198 I.282 J2.74 E.01543
G1 X200.352 Y198.215 E.0046
G1 X200.033 Y198.607 F30000
G1 F8843.478
G1 X200.179 Y198.606 E.00472
G3 X200.417 Y198.634 I-.178 J2.598 E.0077
G3 X199.761 Y198.611 I-.409 J2.366 E.46391
G1 X199.973 Y198.608 E.00681
G1 X199.78 Y199.004 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X199.79 Y199.002 E.00032
G3 X200.15 Y198.995 I.215 J1.793 E.01074
G3 X199.553 Y199.043 I-.141 J2.004 E.35812
G1 X199.721 Y199.014 E.00505
; WIPE_START
M204 S10000
G1 X199.79 Y199.002 E-.0269
G1 X200.15 Y198.995 E-.13677
G1 X200.545 Y199.065 E-.15216
G1 X200.917 Y199.211 E-.15207
G1 X201.253 Y199.428 E-.15217
G1 X201.404 Y199.561 E-.07613
G1 X201.512 Y199.69 E-.0638
; WIPE_END
G1 E-.04 F1800
G1 X205.95 Y205.899 Z1 F30000
G1 X208.584 Y209.584 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X47.416 Y209.584 E5.18256
G1 X47.416 Y42.416 E5.3755
G1 X208.584 Y42.416 E5.18256
G1 X208.584 Y209.524 E5.37357
G1 X208.991 Y209.991 F30000
G1 F8843.478
G1 X47.009 Y209.991 E5.20874
G1 X47.009 Y42.009 E5.40168
G1 X208.991 Y42.009 E5.20874
G1 X208.991 Y209.931 E5.39975
G1 X209.398 Y210.398 F30000
G1 F8843.478
G1 X46.602 Y210.398 E5.23492
G1 X46.602 Y41.602 E5.42786
G1 X209.398 Y41.602 E5.23492
G1 X209.398 Y210.338 E5.42593
G1 X209.79 Y210.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X46.21 Y210.79 E4.87249
G1 X46.21 Y41.21 E5.05121
G1 X209.79 Y41.21 E4.87249
G1 X209.79 Y210.73 E5.04942
; WIPE_START
M204 S10000
G1 X207.79 Y210.731 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X202.616 Y209.42 Z1 F30000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42037
G1 F9537.687
G1 X185.945 Y192.749 E.70294
G1 X185.411 Y192.749 E.01592
G1 X201.912 Y209.251 E.69578
G1 X201.378 Y209.251 E.01592
G1 X184.877 Y192.749 E.69578
G1 X184.344 Y192.749 E.01592
G1 X200.845 Y209.251 E.69578
G1 X200.311 Y209.251 E.01592
G1 X183.81 Y192.749 E.69578
G1 X183.276 Y192.749 E.01592
G1 X199.777 Y209.251 E.69578
G1 X199.243 Y209.251 E.01592
G1 X182.742 Y192.749 E.69578
G1 X182.208 Y192.749 E.01592
G1 X198.709 Y209.251 E.69578
G1 X198.176 Y209.251 E.01592
G1 X181.675 Y192.749 E.69578
G1 X181.141 Y192.749 E.01592
G1 X197.642 Y209.251 E.69578
G1 X197.108 Y209.251 E.01592
G1 X180.607 Y192.749 E.69578
G1 X180.073 Y192.749 E.01592
G1 X196.574 Y209.251 E.69578
G1 X196.04 Y209.251 E.01592
G1 X179.539 Y192.749 E.69578
G1 X179.006 Y192.749 E.01592
G1 X195.507 Y209.251 E.69578
G1 X194.973 Y209.251 E.01592
G1 X178.472 Y192.749 E.69578
G1 X177.938 Y192.749 E.01592
G1 X194.439 Y209.251 E.69578
G1 X193.905 Y209.251 E.01592
G1 X177.404 Y192.749 E.69578
G1 X176.87 Y192.749 E.01592
G1 X193.371 Y209.251 E.69578
G1 X192.838 Y209.251 E.01592
G1 X176.337 Y192.749 E.69578
G1 X175.803 Y192.749 E.01592
G1 X192.304 Y209.251 E.69578
G1 X191.77 Y209.251 E.01592
G1 X175.269 Y192.749 E.69578
G1 X174.735 Y192.749 E.01592
G1 X191.236 Y209.251 E.69578
G1 X190.702 Y209.251 E.01592
G1 X174.201 Y192.749 E.69578
G1 X173.668 Y192.749 E.01592
G1 X190.169 Y209.251 E.69578
G1 X189.635 Y209.251 E.01592
G1 X173.134 Y192.749 E.69578
G1 X172.6 Y192.749 E.01592
G1 X189.101 Y209.251 E.69578
G1 X188.567 Y209.251 E.01592
G1 X172.066 Y192.749 E.69578
G1 X171.532 Y192.749 E.01592
G1 X188.034 Y209.251 E.69578
G1 X187.5 Y209.251 E.01592
G1 X170.999 Y192.749 E.69578
G1 X170.465 Y192.749 E.01592
G1 X186.966 Y209.251 E.69578
G1 X186.432 Y209.251 E.01592
G1 X169.931 Y192.749 E.69578
G1 X169.397 Y192.749 E.01592
G1 X185.898 Y209.251 E.69578
G1 X185.365 Y209.251 E.01592
G1 X168.863 Y192.749 E.69578
G1 X168.33 Y192.749 E.01592
G1 X184.831 Y209.251 E.69578
G1 X184.297 Y209.251 E.01592
G1 X167.796 Y192.749 E.69578
G1 X167.262 Y192.749 E.01592
G1 X183.763 Y209.251 E.69578
G1 X183.229 Y209.251 E.01592
G1 X166.728 Y192.749 E.69578
G1 X166.194 Y192.749 E.01592
G1 X182.696 Y209.251 E.69578
G1 X182.162 Y209.251 E.01592
G1 X165.661 Y192.749 E.69578
G1 X165.127 Y192.749 E.01592
G1 X181.628 Y209.251 E.69578
G1 X181.094 Y209.251 E.01592
G1 X164.593 Y192.749 E.69578
G1 X164.059 Y192.749 E.01592
G1 X180.56 Y209.251 E.69578
G1 X180.027 Y209.251 E.01592
G1 X163.526 Y192.749 E.69578
G1 X162.992 Y192.749 E.01592
G1 X179.493 Y209.251 E.69578
G1 X178.959 Y209.251 E.01592
G1 X162.458 Y192.749 E.69578
G1 X161.924 Y192.749 E.01592
G1 X178.425 Y209.251 E.69578
G1 X177.891 Y209.251 E.01592
G1 X161.39 Y192.749 E.69578
G1 X160.857 Y192.749 E.01592
G1 X177.358 Y209.251 E.69578
G1 X176.824 Y209.251 E.01592
G1 X160.323 Y192.749 E.69578
G1 X159.789 Y192.749 E.01592
G1 X176.29 Y209.251 E.69578
G1 X175.756 Y209.251 E.01592
G1 X159.255 Y192.749 E.69578
G1 X158.721 Y192.749 E.01592
G1 X175.222 Y209.251 E.69578
G1 X174.689 Y209.251 E.01592
G1 X158.188 Y192.749 E.69578
G1 X157.654 Y192.749 E.01592
G1 X174.155 Y209.251 E.69578
G1 X173.621 Y209.251 E.01592
G1 X157.12 Y192.749 E.69578
G1 X156.586 Y192.749 E.01592
G1 X173.087 Y209.251 E.69578
G1 X172.553 Y209.251 E.01592
G1 X156.052 Y192.749 E.69578
G1 X155.519 Y192.749 E.01592
G1 X172.02 Y209.251 E.69578
G1 X171.486 Y209.251 E.01592
G1 X154.985 Y192.749 E.69578
G1 X154.451 Y192.749 E.01592
G1 X170.952 Y209.251 E.69578
M73 P33 R46
G1 X170.418 Y209.251 E.01592
G1 X153.917 Y192.749 E.69578
G1 X153.383 Y192.749 E.01592
G1 X169.884 Y209.251 E.69578
G1 X169.351 Y209.251 E.01592
G1 X152.85 Y192.749 E.69578
G1 X152.316 Y192.749 E.01592
G1 X168.817 Y209.251 E.69578
G1 X168.283 Y209.251 E.01592
G1 X151.782 Y192.749 E.69578
G1 X151.248 Y192.749 E.01592
G1 X167.749 Y209.251 E.69578
G1 X167.216 Y209.251 E.01592
G1 X150.714 Y192.749 E.69578
G1 X150.181 Y192.749 E.01592
G1 X166.682 Y209.251 E.69578
G1 X166.148 Y209.251 E.01592
G1 X149.647 Y192.749 E.69578
M73 P33 R45
G1 X149.113 Y192.749 E.01592
G1 X165.614 Y209.251 E.69578
G1 X165.08 Y209.251 E.01592
G1 X148.579 Y192.749 E.69578
G1 X148.045 Y192.749 E.01592
G1 X164.547 Y209.251 E.69578
G1 X164.013 Y209.251 E.01592
G1 X147.512 Y192.749 E.69578
G1 X146.978 Y192.749 E.01592
G1 X163.479 Y209.251 E.69578
G1 X162.945 Y209.251 E.01592
G1 X146.444 Y192.749 E.69578
G1 X145.91 Y192.749 E.01592
G1 X162.411 Y209.251 E.69578
G1 X161.878 Y209.251 E.01592
G1 X145.376 Y192.749 E.69578
G1 X144.843 Y192.749 E.01592
G1 X161.344 Y209.251 E.69578
G1 X160.81 Y209.251 E.01592
G1 X144.309 Y192.749 E.69578
G1 X143.775 Y192.749 E.01592
G1 X160.276 Y209.251 E.69578
G1 X159.742 Y209.251 E.01592
G1 X143.241 Y192.749 E.69578
G1 X142.708 Y192.749 E.01592
G1 X159.209 Y209.251 E.69578
G1 X158.675 Y209.251 E.01592
G1 X142.174 Y192.749 E.69578
G1 X141.64 Y192.749 E.01592
G1 X158.141 Y209.251 E.69578
G1 X157.607 Y209.251 E.01592
G1 X141.106 Y192.749 E.69578
G1 X140.572 Y192.749 E.01592
G1 X157.073 Y209.251 E.69578
G1 X156.54 Y209.251 E.01592
G1 X140.039 Y192.749 E.69578
G1 X139.505 Y192.749 E.01592
G1 X156.006 Y209.251 E.69578
G1 X155.472 Y209.251 E.01592
G1 X138.971 Y192.749 E.69578
G1 X138.437 Y192.749 E.01592
G1 X154.938 Y209.251 E.69578
G1 X154.404 Y209.251 E.01592
G1 X137.903 Y192.749 E.69578
G1 X137.37 Y192.749 E.01592
G1 X153.871 Y209.251 E.69578
G1 X153.337 Y209.251 E.01592
G1 X136.836 Y192.749 E.69578
G1 X136.302 Y192.749 E.01592
G1 X152.803 Y209.251 E.69578
G1 X152.269 Y209.251 E.01592
G1 X135.768 Y192.749 E.69578
G1 X135.234 Y192.749 E.01592
G1 X151.735 Y209.251 E.69578
G1 X151.202 Y209.251 E.01592
G1 X134.701 Y192.749 E.69578
G1 X134.167 Y192.749 E.01592
G1 X150.668 Y209.251 E.69578
G1 X150.134 Y209.251 E.01592
G1 X133.633 Y192.749 E.69578
G1 X133.099 Y192.749 E.01592
G1 X149.6 Y209.251 E.69578
G1 X149.066 Y209.251 E.01592
G1 X132.565 Y192.749 E.69578
G1 X132.032 Y192.749 E.01592
G1 X148.533 Y209.251 E.69578
G1 X147.999 Y209.251 E.01592
G1 X131.498 Y192.749 E.69578
G1 X130.964 Y192.749 E.01592
G1 X147.465 Y209.251 E.69578
G1 X146.931 Y209.251 E.01592
G1 X130.43 Y192.749 E.69578
G1 X129.896 Y192.749 E.01592
G1 X146.398 Y209.251 E.69578
G1 X145.864 Y209.251 E.01592
G1 X129.363 Y192.749 E.69578
G1 X128.829 Y192.749 E.01592
G1 X145.33 Y209.251 E.69578
G1 X144.796 Y209.251 E.01592
G1 X128.295 Y192.749 E.69578
G1 X127.761 Y192.749 E.01592
G1 X144.262 Y209.251 E.69578
G1 X143.729 Y209.251 E.01592
G1 X127.227 Y192.749 E.69578
G1 X126.694 Y192.749 E.01592
G1 X143.195 Y209.251 E.69578
G1 X142.661 Y209.251 E.01592
G1 X126.16 Y192.749 E.69578
G1 X125.626 Y192.749 E.01592
G1 X142.127 Y209.251 E.69578
G1 X141.593 Y209.251 E.01592
G1 X125.092 Y192.749 E.69578
G1 X124.558 Y192.749 E.01592
G1 X141.06 Y209.251 E.69578
G1 X140.526 Y209.251 E.01592
G1 X131.45 Y200.175 E.38267
G3 X131.542 Y200.8 I-3.513 J.832 E.01886
G1 X139.992 Y209.251 E.35632
G1 X139.458 Y209.251 E.01592
G1 X131.535 Y201.328 E.33408
G3 X131.46 Y201.786 I-5.116 J-.602 E.01386
G1 X138.924 Y209.251 E.31473
G1 X138.391 Y209.251 E.01592
G1 X131.339 Y202.199 E.29735
G3 X131.18 Y202.573 I-1.951 J-.607 E.01216
G1 X137.857 Y209.251 E.28155
G1 X137.323 Y209.251 E.01592
G1 X130.987 Y202.915 E.26716
G3 X130.764 Y203.226 I-1.67 J-.962 E.01142
G1 X136.789 Y209.251 E.25405
G1 X136.255 Y209.251 E.01592
G1 X130.512 Y203.507 E.24216
G3 X130.232 Y203.761 I-1.405 J-1.271 E.01129
G1 X135.722 Y209.251 E.23147
G1 X135.188 Y209.251 E.01592
G1 X129.923 Y203.986 E.222
G3 X129.582 Y204.178 I-1.132 J-1.61 E.0117
G1 X134.654 Y209.251 E.21389
G1 X134.12 Y209.251 E.01592
G1 X129.206 Y204.337 E.20719
G3 X128.793 Y204.457 I-.81 J-2.006 E.01285
G1 X133.586 Y209.251 E.20211
G1 X133.053 Y209.251 E.01592
G1 X128.335 Y204.533 E.19892
G3 X127.811 Y204.543 I-.34 J-4.049 E.01563
G1 X132.519 Y209.251 E.1985
G1 X131.985 Y209.251 E.01592
G1 X126.947 Y204.212 E.21244
; WIPE_START
G1 X128.361 Y205.627 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.052 Y198.025 Z1 F30000
G1 X129.072 Y197.797 Z1
G1 Z.6
G1 E.8 F1800
G1 F9537.687
G1 X124.025 Y192.749 E.21284
G1 X123.491 Y192.749 E.01592
G1 X128.198 Y197.457 E.19848
G2 X127.675 Y197.467 I-.209 J2.616 E.01563
G1 X122.957 Y192.749 E.19893
G1 X122.423 Y192.749 E.01592
G1 X127.211 Y197.537 E.20187
G2 X126.8 Y197.66 I.411 J2.116 E.0128
G1 X121.89 Y192.749 E.20707
G1 X121.356 Y192.749 E.01592
G1 X126.427 Y197.82 E.21382
G2 X126.086 Y198.013 I.796 J1.801 E.0117
G1 X120.822 Y192.749 E.22196
G1 X120.288 Y192.749 E.01592
G1 X125.776 Y198.237 E.23138
G2 X125.494 Y198.489 I1.121 J1.534 E.01129
G1 X119.754 Y192.749 E.24202
G1 X119.221 Y192.749 E.01592
G1 X125.241 Y198.77 E.25385
G2 X125.016 Y199.079 I1.435 J1.277 E.01141
G1 X118.687 Y192.749 E.2669
G1 X118.153 Y192.749 E.01592
G1 X124.822 Y199.419 E.28121
G2 X124.661 Y199.791 I7.734 J3.572 E.0121
G1 X117.619 Y192.749 E.29692
G1 X117.085 Y192.749 E.01592
G1 X124.542 Y200.206 E.3144
G2 X124.468 Y200.666 I2.268 J.596 E.01393
G1 X116.552 Y192.749 E.33382
G1 X116.018 Y192.749 E.01592
G1 X124.454 Y201.185 E.35571
G2 X124.545 Y201.81 I3.167 J-.143 E.01887
G1 X115.484 Y192.749 E.38206
G1 X114.95 Y192.749 E.01592
G1 X131.451 Y209.251 E.69578
G1 X130.917 Y209.251 E.01592
G1 X114.416 Y192.749 E.69578
G1 X113.883 Y192.749 E.01592
G1 X130.384 Y209.251 E.69578
G1 X129.85 Y209.251 E.01592
G1 X113.349 Y192.749 E.69578
G1 X112.815 Y192.749 E.01592
G1 X129.316 Y209.251 E.69578
G1 X128.782 Y209.251 E.01592
G1 X112.281 Y192.749 E.69578
G1 X111.747 Y192.749 E.01592
G1 X128.248 Y209.251 E.69578
G1 X127.715 Y209.251 E.01592
G1 X111.214 Y192.749 E.69578
G1 X110.68 Y192.749 E.01592
G1 X127.181 Y209.251 E.69578
G1 X126.647 Y209.251 E.01592
G1 X110.146 Y192.749 E.69578
G1 X109.612 Y192.749 E.01592
G1 X126.113 Y209.251 E.69578
G1 X125.58 Y209.251 E.01592
G1 X109.078 Y192.749 E.69578
G1 X108.545 Y192.749 E.01592
G1 X125.046 Y209.251 E.69578
G1 X124.512 Y209.251 E.01592
G1 X108.011 Y192.749 E.69578
G1 X107.477 Y192.749 E.01592
G1 X123.978 Y209.251 E.69578
G1 X123.444 Y209.251 E.01592
G1 X106.943 Y192.749 E.69578
G1 X106.409 Y192.749 E.01592
G1 X122.911 Y209.251 E.69578
G1 X122.377 Y209.251 E.01592
G1 X105.876 Y192.749 E.69578
G1 X105.342 Y192.749 E.01592
G1 X121.843 Y209.251 E.69578
G1 X121.309 Y209.251 E.01592
G1 X104.808 Y192.749 E.69578
G1 X104.274 Y192.749 E.01592
G1 X120.775 Y209.251 E.69578
G1 X120.242 Y209.251 E.01592
G1 X103.74 Y192.749 E.69578
G1 X103.207 Y192.749 E.01592
G1 X119.708 Y209.251 E.69578
G1 X119.174 Y209.251 E.01592
G1 X102.673 Y192.749 E.69578
G1 X102.139 Y192.749 E.01592
G1 X118.64 Y209.251 E.69578
G1 X118.106 Y209.251 E.01592
G1 X101.605 Y192.749 E.69578
G1 X101.072 Y192.749 E.01592
G1 X117.573 Y209.251 E.69578
G1 X117.039 Y209.251 E.01592
G1 X100.538 Y192.749 E.69578
G1 X100.004 Y192.749 E.01592
G1 X116.505 Y209.251 E.69578
G1 X115.971 Y209.251 E.01592
G1 X99.47 Y192.749 E.69578
G1 X98.936 Y192.749 E.01592
G1 X115.437 Y209.251 E.69578
G1 X114.904 Y209.251 E.01592
G1 X98.403 Y192.749 E.69578
G1 X97.869 Y192.749 E.01592
G1 X114.37 Y209.251 E.69578
G1 X113.836 Y209.251 E.01592
G1 X97.335 Y192.749 E.69578
G1 X96.801 Y192.749 E.01592
G1 X113.302 Y209.251 E.69578
G1 X112.768 Y209.251 E.01592
G1 X96.267 Y192.749 E.69578
G1 X95.734 Y192.749 E.01592
G1 X112.235 Y209.251 E.69578
G1 X111.701 Y209.251 E.01592
G1 X95.2 Y192.749 E.69578
G1 X94.666 Y192.749 E.01592
G1 X111.167 Y209.251 E.69578
G1 X110.633 Y209.251 E.01592
G1 X94.132 Y192.749 E.69578
G1 X93.598 Y192.749 E.01592
G1 X110.099 Y209.251 E.69578
G1 X109.566 Y209.251 E.01592
G1 X93.065 Y192.749 E.69578
G1 X92.531 Y192.749 E.01592
G1 X109.032 Y209.251 E.69578
G1 X108.498 Y209.251 E.01592
G1 X91.997 Y192.749 E.69578
G1 X91.463 Y192.749 E.01592
G1 X107.964 Y209.251 E.69578
G1 X107.43 Y209.251 E.01592
G1 X90.929 Y192.749 E.69578
G1 X90.396 Y192.749 E.01592
G1 X106.897 Y209.251 E.69578
G1 X106.363 Y209.251 E.01592
G1 X89.862 Y192.749 E.69578
G1 X89.328 Y192.749 E.01592
G1 X105.829 Y209.251 E.69578
G1 X105.295 Y209.251 E.01592
G1 X88.794 Y192.749 E.69578
G1 X88.26 Y192.749 E.01592
G1 X104.762 Y209.251 E.69578
G1 X104.228 Y209.251 E.01592
G1 X87.727 Y192.749 E.69578
G1 X87.193 Y192.749 E.01592
G1 X103.694 Y209.251 E.69578
G1 X103.16 Y209.251 E.01592
G1 X86.659 Y192.749 E.69578
G1 X86.125 Y192.749 E.01592
G1 X102.626 Y209.251 E.69578
G1 X102.093 Y209.251 E.01592
G1 X85.591 Y192.749 E.69578
G1 X85.058 Y192.749 E.01592
G1 X101.559 Y209.251 E.69578
G1 X101.025 Y209.251 E.01592
G1 X84.524 Y192.749 E.69578
G1 X83.99 Y192.749 E.01592
G1 X100.491 Y209.251 E.69578
G1 X99.957 Y209.251 E.01592
G1 X83.456 Y192.749 E.69578
G1 X82.922 Y192.749 E.01592
G1 X99.424 Y209.251 E.69578
G1 X98.89 Y209.251 E.01592
G1 X82.389 Y192.749 E.69578
G1 X81.855 Y192.749 E.01592
G1 X98.356 Y209.251 E.69578
G1 X97.822 Y209.251 E.01592
G1 X81.321 Y192.749 E.69578
G1 X80.787 Y192.749 E.01592
G1 X97.288 Y209.251 E.69578
G1 X96.755 Y209.251 E.01592
G1 X80.254 Y192.749 E.69578
G1 X79.72 Y192.749 E.01592
G1 X96.221 Y209.251 E.69578
G1 X95.687 Y209.251 E.01592
G1 X79.186 Y192.749 E.69578
G1 X78.652 Y192.749 E.01592
G1 X95.153 Y209.251 E.69578
G1 X94.619 Y209.251 E.01592
G1 X78.118 Y192.749 E.69578
G1 X77.585 Y192.749 E.01592
G1 X94.086 Y209.251 E.69578
G1 X93.552 Y209.251 E.01592
G1 X77.051 Y192.749 E.69578
G1 X76.517 Y192.749 E.01592
G1 X93.018 Y209.251 E.69578
G1 X92.484 Y209.251 E.01592
G1 X75.983 Y192.749 E.69578
G1 X75.449 Y192.749 E.01592
G1 X91.95 Y209.251 E.69578
G1 X91.417 Y209.251 E.01592
G1 X74.916 Y192.749 E.69578
G1 X74.382 Y192.749 E.01592
G1 X90.883 Y209.251 E.69578
G1 X90.349 Y209.251 E.01592
G1 X73.848 Y192.749 E.69578
G1 X73.314 Y192.749 E.01592
G1 X89.815 Y209.251 E.69578
G1 X89.281 Y209.251 E.01592
G1 X72.78 Y192.749 E.69578
G1 X72.247 Y192.749 E.01592
G1 X88.748 Y209.251 E.69578
G1 X88.214 Y209.251 E.01592
G1 X71.713 Y192.749 E.69578
G1 X71.179 Y192.749 E.01592
G1 X87.68 Y209.251 E.69578
G1 X87.146 Y209.251 E.01592
G1 X70.645 Y192.749 E.69578
G1 X70.111 Y192.749 E.01592
G1 X86.612 Y209.251 E.69578
G1 X86.079 Y209.251 E.01592
G1 X69.578 Y192.749 E.69578
G1 X69.044 Y192.749 E.01592
G1 X85.545 Y209.251 E.69578
G1 X85.011 Y209.251 E.01592
G1 X68.51 Y192.749 E.69578
G1 X67.976 Y192.749 E.01592
G1 X84.477 Y209.251 E.69578
G1 X83.944 Y209.251 E.01592
G1 X67.442 Y192.749 E.69578
G1 X66.909 Y192.749 E.01592
G1 X83.41 Y209.251 E.69578
G1 X82.876 Y209.251 E.01592
G1 X66.375 Y192.749 E.69578
G1 X65.841 Y192.749 E.01592
G1 X82.342 Y209.251 E.69578
G1 X81.808 Y209.251 E.01592
G1 X65.307 Y192.749 E.69578
G1 X64.773 Y192.749 E.01592
G1 X81.275 Y209.251 E.69578
G1 X80.741 Y209.251 E.01592
G1 X47.749 Y176.259 E1.39111
G1 X47.749 Y175.725 E.01592
G1 X64.251 Y192.227 E.69578
G1 X64.251 Y191.693 E.01592
G1 X47.749 Y175.192 E.69578
G1 X47.749 Y174.658 E.01592
G1 X64.251 Y191.159 E.69578
G1 X64.251 Y190.625 E.01592
G1 X47.749 Y174.124 E.69578
G1 X47.749 Y173.59 E.01592
G1 X64.251 Y190.091 E.69578
G1 X64.251 Y189.558 E.01592
G1 X47.749 Y173.057 E.69578
G1 X47.749 Y172.523 E.01592
G1 X64.251 Y189.024 E.69578
G1 X64.251 Y188.49 E.01592
G1 X47.749 Y171.989 E.69578
G1 X47.749 Y171.455 E.01592
G1 X64.251 Y187.956 E.69578
G1 X64.251 Y187.422 E.01592
G1 X47.749 Y170.921 E.69578
G1 X47.749 Y170.388 E.01592
G1 X64.251 Y186.889 E.69578
G1 X64.251 Y186.355 E.01592
G1 X47.749 Y169.854 E.69578
G1 X47.749 Y169.32 E.01592
G1 X64.251 Y185.821 E.69578
G1 X64.251 Y185.287 E.01592
G1 X47.749 Y168.786 E.69578
G1 X47.749 Y168.252 E.01592
G1 X64.251 Y184.753 E.69578
G1 X64.251 Y184.22 E.01592
G1 X47.749 Y167.719 E.69578
G1 X47.749 Y167.185 E.01592
G1 X64.251 Y183.686 E.69578
G1 X64.251 Y183.152 E.01592
G1 X47.749 Y166.651 E.69578
G1 X47.749 Y166.117 E.01592
G1 X64.251 Y182.618 E.69578
G1 X64.251 Y182.084 E.01592
G1 X47.749 Y165.583 E.69578
G1 X47.749 Y165.05 E.01592
G1 X64.251 Y181.551 E.69578
G1 X64.251 Y181.017 E.01592
G1 X47.749 Y164.516 E.69578
G1 X47.749 Y163.982 E.01592
G1 X64.251 Y180.483 E.69578
G1 X64.251 Y179.949 E.01592
G1 X47.749 Y163.448 E.69578
G1 X47.749 Y162.914 E.01592
G1 X64.251 Y179.415 E.69578
G1 X64.251 Y178.882 E.01592
G1 X47.749 Y162.381 E.69578
G1 X47.749 Y161.847 E.01592
G1 X64.251 Y178.348 E.69578
G1 X64.251 Y177.814 E.01592
G1 X47.749 Y161.313 E.69578
G1 X47.749 Y160.779 E.01592
G1 X64.251 Y177.28 E.69578
G1 X64.251 Y176.746 E.01592
G1 X47.749 Y160.245 E.69578
G1 X47.749 Y159.712 E.01592
G1 X64.251 Y176.213 E.69578
G1 X64.251 Y175.679 E.01592
G1 X47.749 Y159.178 E.69578
G1 X47.749 Y158.644 E.01592
G1 X64.251 Y175.145 E.69578
G1 X64.251 Y174.611 E.01592
G1 X47.749 Y158.11 E.69578
G1 X47.749 Y157.576 E.01592
G1 X64.251 Y174.078 E.69578
G1 X64.251 Y173.544 E.01592
G1 X47.749 Y157.043 E.69578
G1 X47.749 Y156.509 E.01592
G1 X64.251 Y173.01 E.69578
G1 X64.251 Y172.476 E.01592
G1 X47.749 Y155.975 E.69578
G1 X47.749 Y155.441 E.01592
G1 X64.251 Y171.942 E.69578
G1 X64.251 Y171.409 E.01592
G1 X47.749 Y154.907 E.69578
G1 X47.749 Y154.374 E.01592
G1 X64.251 Y170.875 E.69578
G1 X64.251 Y170.341 E.01592
G1 X47.749 Y153.84 E.69578
G1 X47.749 Y153.306 E.01592
G1 X64.251 Y169.807 E.69578
G1 X64.251 Y169.273 E.01592
G1 X47.749 Y152.772 E.69578
G1 X47.749 Y152.238 E.01592
G1 X64.251 Y168.74 E.69578
G1 X64.251 Y168.206 E.01592
G1 X47.749 Y151.705 E.69578
G1 X47.749 Y151.171 E.01592
G1 X64.251 Y167.672 E.69578
G1 X64.251 Y167.138 E.01592
G1 X47.749 Y150.637 E.69578
G1 X47.749 Y150.103 E.01592
G1 X64.251 Y166.604 E.69578
G1 X64.251 Y166.071 E.01592
G1 X47.749 Y149.57 E.69578
G1 X47.749 Y149.036 E.01592
G1 X64.251 Y165.537 E.69578
G1 X64.251 Y165.003 E.01592
G1 X47.749 Y148.502 E.69578
G1 X47.749 Y147.968 E.01592
G1 X64.251 Y164.469 E.69578
G1 X64.251 Y163.935 E.01592
G1 X47.749 Y147.434 E.69578
G1 X47.749 Y146.901 E.01592
G1 X64.251 Y163.402 E.69578
G1 X64.251 Y162.868 E.01592
G1 X47.749 Y146.367 E.69578
G1 X47.749 Y145.833 E.01592
G1 X64.251 Y162.334 E.69578
G1 X64.251 Y161.8 E.01592
G1 X47.749 Y145.299 E.69578
G1 X47.749 Y144.765 E.01592
G1 X64.251 Y161.266 E.69578
G1 X64.251 Y160.733 E.01592
G1 X47.749 Y144.232 E.69578
G1 X47.749 Y143.698 E.01592
G1 X64.251 Y160.199 E.69578
G1 X64.251 Y159.665 E.01592
G1 X47.749 Y143.164 E.69578
G1 X47.749 Y142.63 E.01592
G1 X64.251 Y159.131 E.69578
G1 X64.251 Y158.597 E.01592
G1 X47.749 Y142.096 E.69578
G1 X47.749 Y141.563 E.01592
G1 X64.251 Y158.064 E.69578
G1 X64.251 Y157.53 E.01592
G1 X47.749 Y141.029 E.69578
G1 X47.749 Y140.495 E.01592
G1 X64.251 Y156.996 E.69578
G1 X64.251 Y156.462 E.01592
G1 X47.749 Y139.961 E.69578
G1 X47.749 Y139.427 E.01592
G1 X64.251 Y155.928 E.69578
M73 P34 R45
G1 X64.251 Y155.395 E.01592
G1 X47.749 Y138.894 E.69578
G1 X47.749 Y138.36 E.01592
G1 X64.251 Y154.861 E.69578
G1 X64.251 Y154.327 E.01592
G1 X47.749 Y137.826 E.69578
G1 X47.749 Y137.292 E.01592
G1 X64.251 Y153.793 E.69578
G1 X64.251 Y153.26 E.01592
G1 X47.749 Y136.758 E.69578
G1 X47.749 Y136.225 E.01592
G1 X64.251 Y152.726 E.69578
G1 X64.251 Y152.192 E.01592
G1 X47.749 Y135.691 E.69578
G1 X47.749 Y135.157 E.01592
G1 X64.251 Y151.658 E.69578
G1 X64.251 Y151.124 E.01592
G1 X47.749 Y134.623 E.69578
G1 X47.749 Y134.089 E.01592
G1 X64.251 Y150.591 E.69578
G1 X64.251 Y150.057 E.01592
G1 X47.749 Y133.556 E.69578
G1 X47.749 Y133.022 E.01592
G1 X64.251 Y149.523 E.69578
G1 X64.251 Y148.989 E.01592
G1 X47.749 Y132.488 E.69578
G1 X47.749 Y131.954 E.01592
G1 X64.251 Y148.455 E.69578
G1 X64.251 Y147.922 E.01592
G1 X47.749 Y131.42 E.69578
G1 X47.749 Y130.887 E.01592
G1 X64.251 Y147.388 E.69578
G1 X64.251 Y146.854 E.01592
G1 X47.749 Y130.353 E.69578
G1 X47.749 Y129.819 E.01592
G1 X64.251 Y146.32 E.69578
G1 X64.251 Y145.786 E.01592
G1 X47.749 Y129.285 E.69578
G1 X47.749 Y128.752 E.01592
G1 X64.251 Y145.253 E.69578
G1 X64.251 Y144.719 E.01592
G1 X47.749 Y128.218 E.69578
G1 X47.749 Y127.684 E.01592
G1 X64.251 Y144.185 E.69578
G1 X64.251 Y143.651 E.01592
G1 X47.749 Y127.15 E.69578
G1 X47.749 Y126.616 E.01592
G1 X64.251 Y143.117 E.69578
G1 X64.251 Y142.584 E.01592
G1 X47.749 Y126.083 E.69578
G1 X47.749 Y125.549 E.01592
G1 X64.251 Y142.05 E.69578
G1 X64.251 Y141.516 E.01592
G1 X47.749 Y125.015 E.69578
G1 X47.749 Y124.481 E.01592
G1 X64.251 Y140.982 E.69578
G1 X64.251 Y140.448 E.01592
G1 X47.749 Y123.947 E.69578
G1 X47.749 Y123.414 E.01592
G1 X64.42 Y140.084 E.70294
; WIPE_START
G1 X63.006 Y138.67 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X59.063 Y132.135 Z1 F30000
G1 X47.58 Y113.102 Z1
G1 Z.6
G1 E.8 F1800
G1 F9537.687
G1 X57.108 Y122.63 E.40178
G2 X56.422 Y122.478 I-1.111 J3.385 E.02099
G1 X47.749 Y113.805 E.36569
G1 X47.749 Y114.339 E.01592
G1 X55.863 Y122.453 E.34213
G2 X55.387 Y122.51 I.136 J3.16 E.01433
G1 X47.749 Y114.873 E.32203
G1 X47.749 Y115.407 E.01592
G1 X54.953 Y122.61 E.30373
G2 X54.563 Y122.754 I.523 J2.021 E.01241
G1 X47.749 Y115.94 E.28728
G1 X47.749 Y116.474 E.01592
G1 X54.209 Y122.934 E.27238
G2 X53.888 Y123.147 I.906 J1.712 E.0115
G1 X47.749 Y117.008 E.25885
G1 X47.749 Y117.542 E.01592
G1 X53.597 Y123.389 E.24655
G2 X53.333 Y123.659 I1.22 J1.451 E.01127
G1 X47.749 Y118.076 E.23545
G1 X47.749 Y118.609 E.01592
G1 X53.099 Y123.959 E.22555
G2 X52.894 Y124.287 I1.538 J1.187 E.01157
G1 X47.749 Y119.143 E.21691
G1 X47.749 Y119.677 E.01592
G1 X52.72 Y124.648 E.2096
G2 X52.583 Y125.044 I1.909 J.886 E.01252
G1 X47.749 Y120.211 E.2038
G1 X47.749 Y120.745 E.01592
G1 X52.487 Y125.482 E.19976
G2 X52.453 Y125.982 I2.481 J.42 E.01496
G1 X47.749 Y121.278 E.19832
G1 X47.749 Y121.812 E.01592
G1 X52.493 Y126.556 E.20004
G2 X52.695 Y127.291 I3.9 J-.673 E.02276
G1 X47.749 Y122.346 E.20853
G1 X47.749 Y122.88 E.01592
G1 X64.251 Y139.381 E.69578
G1 X64.251 Y138.847 E.01592
G1 X54.706 Y129.303 E.40244
G2 X55.441 Y129.503 I1.306 J-3.34 E.02273
G1 X64.251 Y138.313 E.37148
G1 X64.251 Y137.779 E.01592
G1 X56.019 Y129.548 E.34709
G2 X56.515 Y129.51 I.061 J-2.498 E.01487
G1 X64.251 Y137.246 E.32617
G1 X64.251 Y136.712 E.01592
G1 X56.958 Y129.42 E.30748
G2 X57.353 Y129.281 I-2.305 J-7.195 E.01249
G1 X64.251 Y136.178 E.29082
G1 X64.251 Y135.644 E.01592
G1 X57.713 Y129.107 E.27565
G2 X58.041 Y128.901 I-.861 J-1.739 E.01157
G1 X64.251 Y135.11 E.26182
G1 X64.251 Y134.577 E.01592
G1 X58.34 Y128.666 E.24923
G2 X58.61 Y128.402 I-1.182 J-1.48 E.01127
G1 X64.251 Y134.043 E.23784
G1 X64.251 Y133.509 E.01592
G1 X58.852 Y128.11 E.22765
G2 X59.064 Y127.789 I-1.502 J-1.224 E.0115
G1 X64.251 Y132.975 E.2187
G1 X64.251 Y132.442 E.01592
G1 X59.245 Y127.436 E.21105
G2 X59.393 Y127.05 I-1.859 J-.93 E.01235
G1 X64.251 Y131.908 E.20483
G1 X64.251 Y131.374 E.01592
G1 X59.494 Y126.618 E.20055
G2 X59.545 Y126.135 I-2.393 J-.495 E.01451
G1 X64.251 Y130.84 E.19842
G1 X64.251 Y130.306 E.01592
G1 X59.524 Y125.58 E.1993
G2 X59.373 Y124.895 I-3.978 J.52 E.02095
G1 X64.251 Y129.773 E.20569
G1 X64.251 Y129.239 E.01592
G1 X47.749 Y112.738 E.69578
G1 X47.749 Y112.204 E.01592
G1 X64.251 Y128.705 E.69578
G1 X64.251 Y128.171 E.01592
G1 X47.749 Y111.67 E.69578
G1 X47.749 Y111.136 E.01592
G1 X64.251 Y127.637 E.69578
G1 X64.251 Y127.104 E.01592
G1 X47.749 Y110.602 E.69578
G1 X47.749 Y110.069 E.01592
G1 X64.251 Y126.57 E.69578
G1 X64.251 Y126.036 E.01592
G1 X47.749 Y109.535 E.69578
G1 X47.749 Y109.001 E.01592
G1 X64.251 Y125.502 E.69578
G1 X64.251 Y124.968 E.01592
G1 X47.749 Y108.467 E.69578
G1 X47.749 Y107.934 E.01592
G1 X64.251 Y124.435 E.69578
G1 X64.251 Y123.901 E.01592
G1 X47.749 Y107.4 E.69578
G1 X47.749 Y106.866 E.01592
G1 X64.251 Y123.367 E.69578
G1 X64.251 Y122.833 E.01592
G1 X47.749 Y106.332 E.69578
G1 X47.749 Y105.798 E.01592
G1 X64.251 Y122.299 E.69578
G1 X64.251 Y121.766 E.01592
G1 X47.749 Y105.265 E.69578
G1 X47.749 Y104.731 E.01592
G1 X64.251 Y121.232 E.69578
G1 X64.251 Y120.698 E.01592
G1 X47.749 Y104.197 E.69578
G1 X47.749 Y103.663 E.01592
G1 X64.251 Y120.164 E.69578
G1 X64.251 Y119.63 E.01592
G1 X47.749 Y103.129 E.69578
G1 X47.749 Y102.596 E.01592
G1 X64.251 Y119.097 E.69578
G1 X64.251 Y118.563 E.01592
G1 X47.749 Y102.062 E.69578
G1 X47.749 Y101.528 E.01592
G1 X64.251 Y118.029 E.69578
G1 X64.251 Y117.495 E.01592
G1 X47.749 Y100.994 E.69578
G1 X47.749 Y100.46 E.01592
G1 X64.251 Y116.961 E.69578
G1 X64.251 Y116.428 E.01592
G1 X47.749 Y99.927 E.69578
G1 X47.749 Y99.393 E.01592
G1 X64.251 Y115.894 E.69578
G1 X64.251 Y115.36 E.01592
G1 X47.749 Y98.859 E.69578
G1 X47.749 Y98.325 E.01592
G1 X64.251 Y114.826 E.69578
G1 X64.251 Y114.292 E.01592
G1 X47.749 Y97.791 E.69578
G1 X47.749 Y97.258 E.01592
G1 X64.251 Y113.759 E.69578
G1 X64.251 Y113.225 E.01592
G1 X47.749 Y96.724 E.69578
G1 X47.749 Y96.19 E.01592
G1 X64.251 Y112.691 E.69578
G1 X64.251 Y112.157 E.01592
G1 X47.749 Y95.656 E.69578
G1 X47.749 Y95.122 E.01592
G1 X64.251 Y111.624 E.69578
G1 X64.251 Y111.09 E.01592
G1 X47.749 Y94.589 E.69578
G1 X47.749 Y94.055 E.01592
G1 X64.251 Y110.556 E.69578
G1 X64.251 Y110.022 E.01592
G1 X47.749 Y93.521 E.69578
G1 X47.749 Y92.987 E.01592
G1 X64.251 Y109.488 E.69578
G1 X64.251 Y108.955 E.01592
G1 X47.749 Y92.453 E.69578
G1 X47.749 Y91.92 E.01592
G1 X64.251 Y108.421 E.69578
G1 X64.251 Y107.887 E.01592
G1 X47.749 Y91.386 E.69578
G1 X47.749 Y90.852 E.01592
G1 X64.251 Y107.353 E.69578
G1 X64.251 Y106.819 E.01592
G1 X47.749 Y90.318 E.69578
G1 X47.749 Y89.784 E.01592
G1 X64.251 Y106.286 E.69578
G1 X64.251 Y105.752 E.01592
G1 X47.749 Y89.251 E.69578
G1 X47.749 Y88.717 E.01592
G1 X64.251 Y105.218 E.69578
G1 X64.251 Y104.684 E.01592
G1 X47.749 Y88.183 E.69578
G1 X47.749 Y87.649 E.01592
G1 X64.251 Y104.15 E.69578
G1 X64.251 Y103.617 E.01592
G1 X47.749 Y87.116 E.69578
G1 X47.749 Y86.582 E.01592
G1 X64.251 Y103.083 E.69578
G1 X64.251 Y102.549 E.01592
G1 X47.749 Y86.048 E.69578
G1 X47.749 Y85.514 E.01592
G1 X64.251 Y102.015 E.69578
G1 X64.251 Y101.481 E.01592
G1 X47.749 Y84.98 E.69578
G1 X47.749 Y84.447 E.01592
G1 X64.251 Y100.948 E.69578
G1 X64.251 Y100.414 E.01592
G1 X47.749 Y83.913 E.69578
G1 X47.749 Y83.379 E.01592
G1 X64.251 Y99.88 E.69578
G1 X64.251 Y99.346 E.01592
G1 X47.749 Y82.845 E.69578
G1 X47.749 Y82.311 E.01592
G1 X64.251 Y98.812 E.69578
G1 X64.251 Y98.279 E.01592
G1 X47.749 Y81.778 E.69578
G1 X47.749 Y81.244 E.01592
G1 X64.251 Y97.745 E.69578
G1 X64.251 Y97.211 E.01592
G1 X47.749 Y80.71 E.69578
G1 X47.749 Y80.176 E.01592
G1 X64.251 Y96.677 E.69578
G1 X64.251 Y96.143 E.01592
G1 X47.749 Y79.642 E.69578
G1 X47.749 Y79.109 E.01592
G1 X64.251 Y95.61 E.69578
G1 X64.251 Y95.076 E.01592
G1 X47.749 Y78.575 E.69578
G1 X47.749 Y78.041 E.01592
G1 X64.251 Y94.542 E.69578
G1 X64.251 Y94.008 E.01592
G1 X47.749 Y77.507 E.69578
G1 X47.749 Y76.973 E.01592
G1 X64.251 Y93.474 E.69578
M73 P34 R44
G1 X64.251 Y92.941 E.01592
G1 X47.749 Y76.44 E.69578
G1 X47.749 Y75.906 E.01592
G1 X64.251 Y92.407 E.69578
G1 X64.251 Y91.873 E.01592
G1 X47.749 Y75.372 E.69578
G1 X47.749 Y74.838 E.01592
G1 X64.251 Y91.339 E.69578
G1 X64.251 Y90.806 E.01592
G1 X47.749 Y74.304 E.69578
G1 X47.749 Y73.771 E.01592
G1 X64.251 Y90.272 E.69578
G1 X64.251 Y89.738 E.01592
G1 X47.749 Y73.237 E.69578
G1 X47.749 Y72.703 E.01592
G1 X64.251 Y89.204 E.69578
G1 X64.251 Y88.67 E.01592
G1 X47.749 Y72.169 E.69578
G1 X47.749 Y71.635 E.01592
G1 X64.251 Y88.137 E.69578
G1 X64.251 Y87.603 E.01592
G1 X47.749 Y71.102 E.69578
G1 X47.749 Y70.568 E.01592
G1 X64.251 Y87.069 E.69578
G1 X64.251 Y86.535 E.01592
G1 X47.749 Y70.034 E.69578
G1 X47.749 Y69.5 E.01592
G1 X64.251 Y86.001 E.69578
G1 X64.251 Y85.468 E.01592
G1 X47.749 Y68.966 E.69578
G1 X47.749 Y68.433 E.01592
G1 X64.251 Y84.934 E.69578
G1 X64.251 Y84.4 E.01592
G1 X47.749 Y67.899 E.69578
G1 X47.749 Y67.365 E.01592
G1 X64.251 Y83.866 E.69578
G1 X64.251 Y83.332 E.01592
G1 X47.749 Y66.831 E.69578
G1 X47.749 Y66.298 E.01592
G1 X64.251 Y82.799 E.69578
G1 X64.251 Y82.265 E.01592
G1 X47.749 Y65.764 E.69578
G1 X47.749 Y65.23 E.01592
G1 X64.251 Y81.731 E.69578
G1 X64.251 Y81.197 E.01592
G1 X47.749 Y64.696 E.69578
G1 X47.749 Y64.162 E.01592
G1 X64.251 Y80.663 E.69578
G1 X64.251 Y80.13 E.01592
G1 X47.749 Y63.629 E.69578
G1 X47.749 Y63.095 E.01592
G1 X64.251 Y79.596 E.69578
G1 X64.251 Y79.062 E.01592
G1 X47.749 Y62.561 E.69578
G1 X47.749 Y62.027 E.01592
G1 X64.251 Y78.528 E.69578
G1 X64.251 Y77.994 E.01592
G1 X47.749 Y61.493 E.69578
G1 X47.749 Y60.96 E.01592
G1 X64.251 Y77.461 E.69578
G1 X64.251 Y76.927 E.01592
G1 X47.749 Y60.426 E.69578
G1 X47.749 Y59.892 E.01592
G1 X64.251 Y76.393 E.69578
G1 X64.251 Y75.859 E.01592
G1 X47.749 Y59.358 E.69578
G1 X47.749 Y58.824 E.01592
G1 X64.251 Y75.325 E.69578
G1 X64.251 Y74.792 E.01592
G1 X47.749 Y58.291 E.69578
G1 X47.749 Y57.757 E.01592
G1 X64.251 Y74.258 E.69578
G1 X64.251 Y73.724 E.01592
G1 X47.749 Y57.223 E.69578
G1 X47.749 Y56.689 E.01592
G1 X64.251 Y73.19 E.69578
G1 X64.251 Y72.656 E.01592
G1 X47.749 Y56.155 E.69578
G1 X47.749 Y55.622 E.01592
G1 X64.251 Y72.123 E.69578
G1 X64.251 Y71.589 E.01592
G1 X47.749 Y55.088 E.69578
G1 X47.749 Y54.554 E.01592
G1 X64.251 Y71.055 E.69578
G1 X64.251 Y70.521 E.01592
G1 X47.749 Y54.02 E.69578
G1 X47.749 Y53.486 E.01592
G1 X64.251 Y69.988 E.69578
G1 X64.251 Y69.454 E.01592
G1 X47.749 Y52.953 E.69578
G1 X47.749 Y52.419 E.01592
G1 X64.251 Y68.92 E.69578
G1 X64.251 Y68.386 E.01592
G1 X47.749 Y51.885 E.69578
G1 X47.749 Y51.351 E.01592
G1 X64.251 Y67.852 E.69578
G1 X64.251 Y67.319 E.01592
G1 X47.749 Y50.817 E.69578
G1 X47.749 Y50.284 E.01592
G1 X64.251 Y66.785 E.69578
G1 X64.251 Y66.251 E.01592
G1 X47.749 Y49.75 E.69578
G1 X47.749 Y49.216 E.01592
G1 X64.251 Y65.717 E.69578
G1 X64.251 Y65.183 E.01592
G1 X47.749 Y48.682 E.69578
G1 X47.749 Y48.148 E.01592
G1 X64.42 Y64.819 E.70294
; WIPE_START
G1 X63.006 Y63.405 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X59.522 Y56.614 Z1 F30000
G1 X52.323 Y42.58 Z1
G1 Z.6
G1 E.8 F1800
G1 F9537.687
G1 X57.552 Y47.808 E.22047
G2 X56.74 Y47.53 I-1.588 J3.311 E.02565
G1 X51.959 Y42.749 E.20159
G1 X51.425 Y42.749 E.01592
G1 X56.13 Y47.455 E.19841
G2 X55.617 Y47.475 I-.137 J3.053 E.01534
G1 X50.891 Y42.749 E.19926
G1 X50.357 Y42.749 E.01592
G1 X55.159 Y47.552 E.20249
G2 X54.753 Y47.679 I.432 J2.094 E.01272
G1 X49.824 Y42.749 E.20785
G1 X49.29 Y42.749 E.01592
G1 X54.383 Y47.843 E.21476
G2 X54.046 Y48.039 I.816 J1.787 E.01166
G1 X48.756 Y42.749 E.22305
G1 X48.222 Y42.749 E.01592
G1 X53.739 Y48.266 E.23262
G2 X53.461 Y48.522 I1.136 J1.516 E.01128
G1 X47.749 Y42.811 E.24082
G1 X47.749 Y43.344 E.01592
G1 X53.211 Y48.806 E.23028
G2 X52.99 Y49.118 I1.454 J1.262 E.01144
G1 X47.749 Y43.878 E.22096
G1 X47.749 Y44.412 E.01592
G1 X52.799 Y49.461 E.21292
G2 X52.645 Y49.841 I1.822 J.959 E.01224
G1 X47.749 Y44.946 E.20643
G1 X47.749 Y45.48 E.01592
G1 X52.53 Y50.261 E.2016
G2 X52.462 Y50.726 I2.293 J.573 E.01406
G1 X47.749 Y46.013 E.19873
G1 X47.749 Y46.547 E.01592
G1 X52.461 Y51.259 E.19866
G2 X52.564 Y51.896 I4.556 J-.411 E.01926
G1 X47.749 Y47.081 E.20301
G1 X47.749 Y47.615 E.01592
G1 X64.251 Y64.116 E.69578
G1 X64.251 Y63.582 E.01592
G1 X55.1 Y54.432 E.38583
G2 X55.74 Y54.538 I.909 J-3.507 E.01936
G1 X64.251 Y63.048 E.35885
G1 X64.251 Y62.514 E.01592
G1 X56.276 Y54.54 E.33623
G2 X56.74 Y54.47 I-.121 J-2.347 E.01399
G1 X64.251 Y61.981 E.31671
G1 X64.251 Y61.447 E.01592
G1 X57.157 Y54.353 E.2991
G2 X57.536 Y54.199 I-.582 J-1.967 E.01223
G1 X64.251 Y60.913 E.28312
G1 X64.251 Y60.379 E.01592
G1 X57.881 Y54.01 E.26857
G2 X58.196 Y53.79 I-.938 J-1.678 E.01145
G1 X64.251 Y59.845 E.25532
G1 X64.251 Y59.312 E.01592
G1 X58.481 Y53.542 E.24329
G2 X58.736 Y53.263 I-1.265 J-1.415 E.01128
G1 X64.723 Y59.251 E.25247
G1 X65.257 Y59.251 E.01592
G1 X58.962 Y52.956 E.26543
G2 X59.158 Y52.618 I-1.59 J-1.148 E.01166
G1 X65.791 Y59.251 E.27968
G1 X66.325 Y59.251 E.01592
G1 X59.321 Y52.247 E.29531
G2 X59.447 Y51.839 I-1.979 J-.833 E.01275
G1 X66.858 Y59.251 E.31252
G1 X67.392 Y59.251 E.01592
G1 X59.529 Y51.387 E.33156
G2 X59.545 Y50.87 I-4.412 J-.398 E.01545
G1 X67.926 Y59.251 E.35339
G1 X68.46 Y59.251 E.01592
G1 X59.473 Y50.264 E.37894
G2 X59.188 Y49.445 I-3.64 J.807 E.02589
G1 X68.994 Y59.251 E.41344
G1 X69.527 Y59.251 E.01592
G1 X53.026 Y42.749 E.69578
G1 X53.56 Y42.749 E.01592
G1 X70.061 Y59.251 E.69578
G1 X70.595 Y59.251 E.01592
G1 X54.094 Y42.749 E.69578
G1 X54.628 Y42.749 E.01592
G1 X71.129 Y59.251 E.69578
G1 X71.663 Y59.251 E.01592
G1 X55.161 Y42.749 E.69578
G1 X55.695 Y42.749 E.01592
G1 X72.196 Y59.251 E.69578
G1 X72.73 Y59.251 E.01592
G1 X56.229 Y42.749 E.69578
G1 X56.763 Y42.749 E.01592
G1 X73.264 Y59.251 E.69578
G1 X73.798 Y59.251 E.01592
G1 X57.297 Y42.749 E.69578
G1 X57.83 Y42.749 E.01592
G1 X74.332 Y59.251 E.69578
G1 X74.865 Y59.251 E.01592
G1 X58.364 Y42.749 E.69578
G1 X58.898 Y42.749 E.01592
G1 X75.399 Y59.251 E.69578
G1 X75.933 Y59.251 E.01592
G1 X59.432 Y42.749 E.69578
G1 X59.966 Y42.749 E.01592
G1 X76.467 Y59.251 E.69578
G1 X77.001 Y59.251 E.01592
G1 X60.499 Y42.749 E.69578
G1 X61.033 Y42.749 E.01592
G1 X77.534 Y59.251 E.69578
G1 X78.068 Y59.251 E.01592
G1 X61.567 Y42.749 E.69578
G1 X62.101 Y42.749 E.01592
G1 X78.602 Y59.251 E.69578
G1 X79.136 Y59.251 E.01592
G1 X62.635 Y42.749 E.69578
G1 X63.168 Y42.749 E.01592
G1 X79.67 Y59.251 E.69578
G1 X80.203 Y59.251 E.01592
G1 X63.702 Y42.749 E.69578
G1 X64.236 Y42.749 E.01592
G1 X80.737 Y59.251 E.69578
G1 X81.271 Y59.251 E.01592
G1 X64.77 Y42.749 E.69578
G1 X65.304 Y42.749 E.01592
G1 X81.805 Y59.251 E.69578
G1 X82.338 Y59.251 E.01592
G1 X65.837 Y42.749 E.69578
G1 X66.371 Y42.749 E.01592
G1 X82.872 Y59.251 E.69578
G1 X83.406 Y59.251 E.01592
G1 X66.905 Y42.749 E.69578
G1 X67.439 Y42.749 E.01592
G1 X83.94 Y59.251 E.69578
G1 X84.474 Y59.251 E.01592
G1 X67.973 Y42.749 E.69578
G1 X68.506 Y42.749 E.01592
G1 X85.007 Y59.251 E.69578
G1 X85.541 Y59.251 E.01592
G1 X69.04 Y42.749 E.69578
G1 X69.574 Y42.749 E.01592
G1 X86.075 Y59.251 E.69578
G1 X86.609 Y59.251 E.01592
G1 X70.108 Y42.749 E.69578
G1 X70.642 Y42.749 E.01592
G1 X87.143 Y59.251 E.69578
G1 X87.676 Y59.251 E.01592
G1 X71.175 Y42.749 E.69578
G1 X71.709 Y42.749 E.01592
G1 X88.21 Y59.251 E.69578
G1 X88.744 Y59.251 E.01592
G1 X72.243 Y42.749 E.69578
G1 X72.777 Y42.749 E.01592
G1 X89.278 Y59.251 E.69578
G1 X89.812 Y59.251 E.01592
G1 X73.311 Y42.749 E.69578
G1 X73.844 Y42.749 E.01592
G1 X90.345 Y59.251 E.69578
G1 X90.879 Y59.251 E.01592
G1 X74.378 Y42.749 E.69578
G1 X74.912 Y42.749 E.01592
G1 X91.413 Y59.251 E.69578
G1 X91.947 Y59.251 E.01592
G1 X75.446 Y42.749 E.69578
G1 X75.98 Y42.749 E.01592
G1 X92.481 Y59.251 E.69578
G1 X93.014 Y59.251 E.01592
G1 X76.513 Y42.749 E.69578
G1 X77.047 Y42.749 E.01592
G1 X93.548 Y59.251 E.69578
G1 X94.082 Y59.251 E.01592
G1 X77.581 Y42.749 E.69578
M73 P35 R44
G1 X78.115 Y42.749 E.01592
G1 X94.616 Y59.251 E.69578
G1 X95.15 Y59.251 E.01592
G1 X78.648 Y42.749 E.69578
G1 X79.182 Y42.749 E.01592
G1 X95.683 Y59.251 E.69578
G1 X96.217 Y59.251 E.01592
G1 X79.716 Y42.749 E.69578
G1 X80.25 Y42.749 E.01592
G1 X96.751 Y59.251 E.69578
G1 X97.285 Y59.251 E.01592
G1 X80.784 Y42.749 E.69578
G1 X81.317 Y42.749 E.01592
G1 X97.819 Y59.251 E.69578
G1 X98.352 Y59.251 E.01592
G1 X81.851 Y42.749 E.69578
G1 X82.385 Y42.749 E.01592
G1 X98.886 Y59.251 E.69578
G1 X99.42 Y59.251 E.01592
G1 X82.919 Y42.749 E.69578
G1 X83.453 Y42.749 E.01592
G1 X99.954 Y59.251 E.69578
G1 X100.488 Y59.251 E.01592
G1 X83.986 Y42.749 E.69578
G1 X84.52 Y42.749 E.01592
G1 X101.021 Y59.251 E.69578
G1 X101.555 Y59.251 E.01592
G1 X85.054 Y42.749 E.69578
G1 X85.588 Y42.749 E.01592
G1 X102.089 Y59.251 E.69578
G1 X102.623 Y59.251 E.01592
G1 X86.122 Y42.749 E.69578
G1 X86.655 Y42.749 E.01592
G1 X103.156 Y59.251 E.69578
G1 X103.69 Y59.251 E.01592
G1 X87.189 Y42.749 E.69578
G1 X87.723 Y42.749 E.01592
G1 X104.224 Y59.251 E.69578
G1 X104.758 Y59.251 E.01592
G1 X88.257 Y42.749 E.69578
G1 X88.791 Y42.749 E.01592
G1 X105.292 Y59.251 E.69578
G1 X105.825 Y59.251 E.01592
G1 X89.324 Y42.749 E.69578
G1 X89.858 Y42.749 E.01592
G1 X106.359 Y59.251 E.69578
G1 X106.893 Y59.251 E.01592
G1 X90.392 Y42.749 E.69578
G1 X90.926 Y42.749 E.01592
G1 X107.427 Y59.251 E.69578
G1 X107.961 Y59.251 E.01592
G1 X91.46 Y42.749 E.69578
G1 X91.993 Y42.749 E.01592
G1 X108.494 Y59.251 E.69578
G1 X109.028 Y59.251 E.01592
G1 X92.527 Y42.749 E.69578
G1 X93.061 Y42.749 E.01592
G1 X109.562 Y59.251 E.69578
G1 X110.096 Y59.251 E.01592
G1 X93.595 Y42.749 E.69578
G1 X94.129 Y42.749 E.01592
G1 X110.63 Y59.251 E.69578
G1 X111.163 Y59.251 E.01592
G1 X94.662 Y42.749 E.69578
G1 X95.196 Y42.749 E.01592
G1 X111.697 Y59.251 E.69578
G1 X112.231 Y59.251 E.01592
G1 X95.73 Y42.749 E.69578
G1 X96.264 Y42.749 E.01592
G1 X112.765 Y59.251 E.69578
G1 X113.299 Y59.251 E.01592
G1 X96.798 Y42.749 E.69578
G1 X97.331 Y42.749 E.01592
G1 X113.832 Y59.251 E.69578
G1 X114.366 Y59.251 E.01592
G1 X97.865 Y42.749 E.69578
G1 X98.399 Y42.749 E.01592
G1 X114.9 Y59.251 E.69578
G1 X115.434 Y59.251 E.01592
G1 X98.933 Y42.749 E.69578
G1 X99.466 Y42.749 E.01592
G1 X115.968 Y59.251 E.69578
G1 X116.501 Y59.251 E.01592
G1 X100 Y42.749 E.69578
G1 X100.534 Y42.749 E.01592
G1 X117.035 Y59.251 E.69578
G1 X117.569 Y59.251 E.01592
G1 X101.068 Y42.749 E.69578
G1 X101.602 Y42.749 E.01592
G1 X118.103 Y59.251 E.69578
G1 X118.637 Y59.251 E.01592
G1 X102.135 Y42.749 E.69578
G1 X102.669 Y42.749 E.01592
G1 X119.17 Y59.251 E.69578
G1 X119.704 Y59.251 E.01592
G1 X103.203 Y42.749 E.69578
G1 X103.737 Y42.749 E.01592
G1 X120.238 Y59.251 E.69578
G1 X120.772 Y59.251 E.01592
G1 X104.271 Y42.749 E.69578
G1 X104.804 Y42.749 E.01592
G1 X121.306 Y59.251 E.69578
G1 X121.839 Y59.251 E.01592
G1 X105.338 Y42.749 E.69578
G1 X105.872 Y42.749 E.01592
G1 X122.373 Y59.251 E.69578
G1 X122.907 Y59.251 E.01592
G1 X106.406 Y42.749 E.69578
G1 X106.94 Y42.749 E.01592
G1 X123.441 Y59.251 E.69578
G1 X123.974 Y59.251 E.01592
G1 X107.473 Y42.749 E.69578
G1 X108.007 Y42.749 E.01592
G1 X124.508 Y59.251 E.69578
G1 X125.042 Y59.251 E.01592
G1 X108.541 Y42.749 E.69578
G1 X109.075 Y42.749 E.01592
G1 X125.576 Y59.251 E.69578
G1 X126.11 Y59.251 E.01592
G1 X109.609 Y42.749 E.69578
G1 X110.142 Y42.749 E.01592
G1 X126.643 Y59.251 E.69578
G1 X127.177 Y59.251 E.01592
G1 X110.676 Y42.749 E.69578
G1 X111.21 Y42.749 E.01592
G1 X127.711 Y59.251 E.69578
G1 X128.245 Y59.251 E.01592
G1 X111.744 Y42.749 E.69578
G1 X112.278 Y42.749 E.01592
G1 X128.779 Y59.251 E.69578
G1 X129.312 Y59.251 E.01592
G1 X112.811 Y42.749 E.69578
G1 X113.345 Y42.749 E.01592
G1 X129.846 Y59.251 E.69578
G1 X130.38 Y59.251 E.01592
G1 X113.879 Y42.749 E.69578
G1 X114.413 Y42.749 E.01592
G1 X130.914 Y59.251 E.69578
G1 X131.448 Y59.251 E.01592
G1 X114.947 Y42.749 E.69578
G1 X115.48 Y42.749 E.01592
G1 X124.546 Y51.815 E.38225
G3 X124.454 Y51.189 I3.079 J-.771 E.01888
G1 X116.014 Y42.749 E.35588
G1 X116.548 Y42.749 E.01592
G1 X124.468 Y50.67 E.33396
G3 X124.541 Y50.209 I2.341 J.134 E.01394
G1 X117.082 Y42.749 E.31453
G1 X117.616 Y42.749 E.01592
G1 X124.66 Y49.794 E.29703
G3 X124.821 Y49.421 I7.72 J3.11 E.01211
G1 X118.149 Y42.749 E.28131
G1 X118.683 Y42.749 E.01592
G1 X125.015 Y49.081 E.26699
G3 X125.239 Y48.772 I1.662 J.968 E.01142
G1 X119.217 Y42.749 E.25394
G1 X119.751 Y42.749 E.01592
G1 X125.492 Y48.491 E.24209
G3 X125.774 Y48.238 I1.401 J1.279 E.01129
G1 X120.284 Y42.749 E.23145
G1 X120.818 Y42.749 E.01592
G1 X126.084 Y48.015 E.22202
G3 X126.424 Y47.822 I1.137 J1.607 E.01169
G1 X121.352 Y42.749 E.21387
G1 X121.886 Y42.749 E.01592
G1 X126.798 Y47.661 E.20711
G3 X127.208 Y47.538 I.821 J1.986 E.0128
G1 X122.42 Y42.749 E.20191
G1 X122.953 Y42.749 E.01592
G1 X127.671 Y47.467 E.19894
G3 X128.194 Y47.456 I.316 J2.604 E.01562
G1 X123.487 Y42.749 E.19848
G1 X124.021 Y42.749 E.01592
G1 X129.067 Y47.795 E.21277
; WIPE_START
G1 X127.653 Y46.381 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.963 Y53.982 Z1 F30000
G1 X126.942 Y54.211 Z1
G1 Z.6
G1 E.8 F1800
G1 F9537.687
G1 X131.981 Y59.251 E.2125
G1 X132.515 Y59.251 E.01592
G1 X127.807 Y54.543 E.19851
G2 X128.332 Y54.533 I.19 J-4.068 E.01565
G1 X133.049 Y59.251 E.1989
G1 X133.583 Y59.251 E.01592
G1 X128.79 Y54.458 E.20208
G2 X129.204 Y54.338 I-.395 J-2.128 E.01286
G1 X134.117 Y59.251 E.20716
G1 X134.65 Y59.251 E.01592
G1 X129.579 Y54.179 E.21384
G2 X129.921 Y53.987 I-.791 J-1.808 E.01171
G1 X135.184 Y59.251 E.22194
G1 X135.718 Y59.251 E.01592
G1 X130.23 Y53.763 E.2314
G2 X130.511 Y53.509 I-1.128 J-1.53 E.01129
G1 X136.252 Y59.251 E.24208
G1 X136.786 Y59.251 E.01592
G1 X130.763 Y53.228 E.25396
G2 X130.986 Y52.917 I-1.444 J-1.272 E.01142
G1 X137.319 Y59.251 E.26706
G1 X137.853 Y59.251 E.01592
G1 X131.178 Y52.576 E.28145
G2 X131.338 Y52.201 I-1.791 J-.983 E.01215
G1 X138.387 Y59.251 E.29724
G1 X138.921 Y59.251 E.01592
G1 X131.459 Y51.789 E.31461
G2 X131.535 Y51.331 I-5.12 J-1.081 E.01385
G1 X139.455 Y59.251 E.33393
G1 X139.988 Y59.251 E.01592
G1 X131.542 Y50.804 E.35615
G2 X131.452 Y50.18 I-3.614 J.204 E.01882
G1 X140.522 Y59.251 E.38246
G1 X141.056 Y59.251 E.01592
G1 X124.555 Y42.749 E.69578
G1 X125.089 Y42.749 E.01592
G1 X141.59 Y59.251 E.69578
G1 X142.124 Y59.251 E.01592
G1 X125.622 Y42.749 E.69578
G1 X126.156 Y42.749 E.01592
G1 X142.657 Y59.251 E.69578
G1 X143.191 Y59.251 E.01592
G1 X126.69 Y42.749 E.69578
G1 X127.224 Y42.749 E.01592
G1 X143.725 Y59.251 E.69578
G1 X144.259 Y59.251 E.01592
G1 X127.758 Y42.749 E.69578
G1 X128.291 Y42.749 E.01592
G1 X144.792 Y59.251 E.69578
G1 X145.326 Y59.251 E.01592
G1 X128.825 Y42.749 E.69578
G1 X129.359 Y42.749 E.01592
G1 X145.86 Y59.251 E.69578
G1 X146.394 Y59.251 E.01592
G1 X129.893 Y42.749 E.69578
G1 X130.427 Y42.749 E.01592
G1 X146.928 Y59.251 E.69578
G1 X147.461 Y59.251 E.01592
G1 X130.96 Y42.749 E.69578
G1 X131.494 Y42.749 E.01592
G1 X147.995 Y59.251 E.69578
G1 X148.529 Y59.251 E.01592
G1 X132.028 Y42.749 E.69578
G1 X132.562 Y42.749 E.01592
G1 X149.063 Y59.251 E.69578
G1 X149.597 Y59.251 E.01592
G1 X133.096 Y42.749 E.69578
G1 X133.629 Y42.749 E.01592
G1 X150.13 Y59.251 E.69578
G1 X150.664 Y59.251 E.01592
G1 X134.163 Y42.749 E.69578
G1 X134.697 Y42.749 E.01592
G1 X151.198 Y59.251 E.69578
G1 X151.732 Y59.251 E.01592
G1 X135.231 Y42.749 E.69578
G1 X135.765 Y42.749 E.01592
G1 X152.266 Y59.251 E.69578
G1 X152.799 Y59.251 E.01592
G1 X136.298 Y42.749 E.69578
G1 X136.832 Y42.749 E.01592
G1 X153.333 Y59.251 E.69578
G1 X153.867 Y59.251 E.01592
G1 X137.366 Y42.749 E.69578
G1 X137.9 Y42.749 E.01592
G1 X154.401 Y59.251 E.69578
G1 X154.935 Y59.251 E.01592
G1 X138.434 Y42.749 E.69578
G1 X138.967 Y42.749 E.01592
G1 X155.468 Y59.251 E.69578
G1 X156.002 Y59.251 E.01592
G1 X139.501 Y42.749 E.69578
G1 X140.035 Y42.749 E.01592
G1 X156.536 Y59.251 E.69578
G1 X157.07 Y59.251 E.01592
G1 X140.569 Y42.749 E.69578
G1 X141.102 Y42.749 E.01592
G1 X157.604 Y59.251 E.69578
G1 X158.137 Y59.251 E.01592
G1 X141.636 Y42.749 E.69578
G1 X142.17 Y42.749 E.01592
G1 X158.671 Y59.251 E.69578
G1 X159.205 Y59.251 E.01592
G1 X142.704 Y42.749 E.69578
G1 X143.238 Y42.749 E.01592
G1 X159.739 Y59.251 E.69578
G1 X160.273 Y59.251 E.01592
G1 X143.771 Y42.749 E.69578
G1 X144.305 Y42.749 E.01592
G1 X160.806 Y59.251 E.69578
G1 X161.34 Y59.251 E.01592
G1 X144.839 Y42.749 E.69578
G1 X145.373 Y42.749 E.01592
G1 X161.874 Y59.251 E.69578
G1 X162.408 Y59.251 E.01592
G1 X145.907 Y42.749 E.69578
G1 X146.44 Y42.749 E.01592
G1 X162.942 Y59.251 E.69578
G1 X163.475 Y59.251 E.01592
G1 X146.974 Y42.749 E.69578
G1 X147.508 Y42.749 E.01592
G1 X164.009 Y59.251 E.69578
G1 X164.543 Y59.251 E.01592
G1 X148.042 Y42.749 E.69578
G1 X148.576 Y42.749 E.01592
G1 X165.077 Y59.251 E.69578
G1 X165.61 Y59.251 E.01592
G1 X149.109 Y42.749 E.69578
G1 X149.643 Y42.749 E.01592
G1 X166.144 Y59.251 E.69578
G1 X166.678 Y59.251 E.01592
G1 X150.177 Y42.749 E.69578
G1 X150.711 Y42.749 E.01592
G1 X167.212 Y59.251 E.69578
G1 X167.746 Y59.251 E.01592
G1 X151.245 Y42.749 E.69578
G1 X151.778 Y42.749 E.01592
G1 X168.279 Y59.251 E.69578
G1 X168.813 Y59.251 E.01592
G1 X152.312 Y42.749 E.69578
G1 X152.846 Y42.749 E.01592
G1 X169.347 Y59.251 E.69578
G1 X169.881 Y59.251 E.01592
G1 X153.38 Y42.749 E.69578
G1 X153.914 Y42.749 E.01592
G1 X170.415 Y59.251 E.69578
G1 X170.948 Y59.251 E.01592
G1 X154.447 Y42.749 E.69578
G1 X154.981 Y42.749 E.01592
G1 X171.482 Y59.251 E.69578
G1 X172.016 Y59.251 E.01592
G1 X155.515 Y42.749 E.69578
G1 X156.049 Y42.749 E.01592
G1 X172.55 Y59.251 E.69578
G1 X173.084 Y59.251 E.01592
G1 X156.583 Y42.749 E.69578
G1 X157.116 Y42.749 E.01592
G1 X173.617 Y59.251 E.69578
G1 X174.151 Y59.251 E.01592
G1 X157.65 Y42.749 E.69578
G1 X158.184 Y42.749 E.01592
G1 X174.685 Y59.251 E.69578
G1 X175.219 Y59.251 E.01592
G1 X158.718 Y42.749 E.69578
G1 X159.252 Y42.749 E.01592
G1 X175.753 Y59.251 E.69578
G1 X176.286 Y59.251 E.01592
G1 X159.785 Y42.749 E.69578
G1 X160.319 Y42.749 E.01592
G1 X176.82 Y59.251 E.69578
G1 X177.354 Y59.251 E.01592
G1 X160.853 Y42.749 E.69578
G1 X161.387 Y42.749 E.01592
G1 X177.888 Y59.251 E.69578
G1 X178.422 Y59.251 E.01592
G1 X161.92 Y42.749 E.69578
G1 X162.454 Y42.749 E.01592
G1 X178.955 Y59.251 E.69578
G1 X179.489 Y59.251 E.01592
G1 X162.988 Y42.749 E.69578
G1 X163.522 Y42.749 E.01592
G1 X180.023 Y59.251 E.69578
G1 X180.557 Y59.251 E.01592
G1 X164.056 Y42.749 E.69578
G1 X164.589 Y42.749 E.01592
G1 X181.091 Y59.251 E.69578
G1 X181.624 Y59.251 E.01592
G1 X165.123 Y42.749 E.69578
G1 X165.657 Y42.749 E.01592
G1 X182.158 Y59.251 E.69578
G1 X182.692 Y59.251 E.01592
G1 X166.191 Y42.749 E.69578
G1 X166.725 Y42.749 E.01592
G1 X183.226 Y59.251 E.69578
G1 X183.76 Y59.251 E.01592
G1 X167.258 Y42.749 E.69578
G1 X167.792 Y42.749 E.01592
G1 X184.293 Y59.251 E.69578
G1 X184.827 Y59.251 E.01592
G1 X168.326 Y42.749 E.69578
G1 X168.86 Y42.749 E.01592
G1 X185.361 Y59.251 E.69578
G1 X185.895 Y59.251 E.01592
G1 X169.394 Y42.749 E.69578
G1 X169.927 Y42.749 E.01592
G1 X186.428 Y59.251 E.69578
G1 X186.962 Y59.251 E.01592
G1 X170.461 Y42.749 E.69578
G1 X170.995 Y42.749 E.01592
G1 X187.496 Y59.251 E.69578
G1 X188.03 Y59.251 E.01592
G1 X171.529 Y42.749 E.69578
G1 X172.063 Y42.749 E.01592
G1 X188.564 Y59.251 E.69578
G1 X189.097 Y59.251 E.01592
G1 X172.596 Y42.749 E.69578
G1 X173.13 Y42.749 E.01592
G1 X189.631 Y59.251 E.69578
G1 X190.165 Y59.251 E.01592
G1 X173.664 Y42.749 E.69578
G1 X174.198 Y42.749 E.01592
G1 X190.699 Y59.251 E.69578
G1 X191.233 Y59.251 E.01592
G1 X174.732 Y42.749 E.69578
G1 X175.265 Y42.749 E.01592
G1 X208.251 Y75.735 E1.39085
G1 X208.251 Y75.201 E.01592
G1 X175.799 Y42.749 E1.36834
G1 X176.333 Y42.749 E.01592
G1 X208.251 Y74.667 E1.34584
G1 X208.251 Y74.133 E.01592
G1 X176.867 Y42.749 E1.32333
G1 X177.401 Y42.749 E.01592
G1 X208.251 Y73.599 E1.30082
G1 X208.251 Y73.066 E.01592
G1 X177.934 Y42.749 E1.27831
G1 X178.468 Y42.749 E.01592
G1 X208.251 Y72.532 E1.2558
G1 X208.251 Y71.998 E.01592
G1 X179.002 Y42.749 E1.2333
G1 X179.536 Y42.749 E.01592
G1 X208.251 Y71.464 E1.21079
G1 X208.251 Y70.93 E.01592
G1 X180.07 Y42.749 E1.18828
G1 X180.603 Y42.749 E.01592
G1 X208.251 Y70.397 E1.16577
G1 X208.251 Y69.863 E.01592
G1 X181.137 Y42.749 E1.14326
G1 X181.671 Y42.749 E.01592
G1 X208.251 Y69.329 E1.12076
G1 X208.251 Y68.795 E.01592
G1 X182.205 Y42.749 E1.09825
G1 X182.738 Y42.749 E.01592
G1 X208.251 Y68.262 E1.07574
G1 X208.251 Y67.728 E.01592
G1 X183.272 Y42.749 E1.05323
G1 X183.806 Y42.749 E.01592
G1 X208.251 Y67.194 E1.03072
G1 X208.251 Y66.66 E.01592
G1 X184.34 Y42.749 E1.00822
G1 X184.874 Y42.749 E.01592
G1 X208.251 Y66.126 E.98571
G1 X208.251 Y65.593 E.01592
G1 X185.407 Y42.749 E.9632
G1 X185.941 Y42.749 E.01592
G1 X208.42 Y65.228 E.94785
G1 X208.42 Y76.438 F30000
G1 F9537.687
G1 X191.749 Y59.767 E.70294
G1 X191.749 Y60.301 E.01592
G1 X208.251 Y76.802 E.69578
G1 X208.251 Y77.336 E.01592
G1 X191.749 Y60.835 E.69578
G1 X191.749 Y61.369 E.01592
G1 X208.251 Y77.87 E.69578
G1 X208.251 Y78.404 E.01592
G1 X191.749 Y61.903 E.69578
G1 X191.749 Y62.436 E.01592
G1 X208.251 Y78.937 E.69578
G1 X208.251 Y79.471 E.01592
G1 X191.749 Y62.97 E.69578
G1 X191.749 Y63.504 E.01592
G1 X208.251 Y80.005 E.69578
G1 X208.251 Y80.539 E.01592
G1 X191.749 Y64.038 E.69578
G1 X191.749 Y64.572 E.01592
G1 X208.251 Y81.073 E.69578
G1 X208.251 Y81.606 E.01592
G1 X191.749 Y65.105 E.69578
G1 X191.749 Y65.639 E.01592
G1 X208.251 Y82.14 E.69578
G1 X208.251 Y82.674 E.01592
G1 X191.749 Y66.173 E.69578
G1 X191.749 Y66.707 E.01592
G1 X208.251 Y83.208 E.69578
G1 X208.251 Y83.742 E.01592
M73 P35 R43
G1 X191.749 Y67.24 E.69578
G1 X191.749 Y67.774 E.01592
G1 X208.251 Y84.275 E.69578
G1 X208.251 Y84.809 E.01592
G1 X191.749 Y68.308 E.69578
G1 X191.749 Y68.842 E.01592
G1 X208.251 Y85.343 E.69578
G1 X208.251 Y85.877 E.01592
G1 X191.749 Y69.376 E.69578
G1 X191.749 Y69.909 E.01592
G1 X208.251 Y86.411 E.69578
G1 X208.251 Y86.944 E.01592
G1 X191.749 Y70.443 E.69578
G1 X191.749 Y70.977 E.01592
G1 X208.251 Y87.478 E.69578
G1 X208.251 Y88.012 E.01592
G1 X191.749 Y71.511 E.69578
G1 X191.749 Y72.045 E.01592
M73 P36 R43
G1 X208.251 Y88.546 E.69578
G1 X208.251 Y89.08 E.01592
G1 X191.749 Y72.578 E.69578
G1 X191.749 Y73.112 E.01592
G1 X208.251 Y89.613 E.69578
G1 X208.251 Y90.147 E.01592
G1 X191.749 Y73.646 E.69578
G1 X191.749 Y74.18 E.01592
G1 X208.251 Y90.681 E.69578
G1 X208.251 Y91.215 E.01592
G1 X191.749 Y74.714 E.69578
G1 X191.749 Y75.247 E.01592
G1 X208.251 Y91.748 E.69578
G1 X208.251 Y92.282 E.01592
G1 X191.749 Y75.781 E.69578
G1 X191.749 Y76.315 E.01592
G1 X208.251 Y92.816 E.69578
G1 X208.251 Y93.35 E.01592
G1 X191.749 Y76.849 E.69578
G1 X191.749 Y77.383 E.01592
G1 X208.251 Y93.884 E.69578
G1 X208.251 Y94.417 E.01592
G1 X191.749 Y77.916 E.69578
G1 X191.749 Y78.45 E.01592
G1 X208.251 Y94.951 E.69578
G1 X208.251 Y95.485 E.01592
G1 X191.749 Y78.984 E.69578
G1 X191.749 Y79.518 E.01592
G1 X208.251 Y96.019 E.69578
G1 X208.251 Y96.553 E.01592
G1 X191.749 Y80.052 E.69578
G1 X191.749 Y80.585 E.01592
G1 X208.251 Y97.086 E.69578
G1 X208.251 Y97.62 E.01592
G1 X191.749 Y81.119 E.69578
G1 X191.749 Y81.653 E.01592
G1 X208.251 Y98.154 E.69578
G1 X208.251 Y98.688 E.01592
G1 X191.749 Y82.187 E.69578
G1 X191.749 Y82.721 E.01592
G1 X208.251 Y99.222 E.69578
G1 X208.251 Y99.755 E.01592
G1 X191.749 Y83.254 E.69578
G1 X191.749 Y83.788 E.01592
G1 X208.251 Y100.289 E.69578
G1 X208.251 Y100.823 E.01592
G1 X191.749 Y84.322 E.69578
G1 X191.749 Y84.856 E.01592
G1 X208.251 Y101.357 E.69578
G1 X208.251 Y101.891 E.01592
G1 X191.749 Y85.39 E.69578
G1 X191.749 Y85.923 E.01592
G1 X208.251 Y102.424 E.69578
G1 X208.251 Y102.958 E.01592
G1 X191.749 Y86.457 E.69578
G1 X191.749 Y86.991 E.01592
G1 X208.251 Y103.492 E.69578
G1 X208.251 Y104.026 E.01592
G1 X191.749 Y87.525 E.69578
G1 X191.749 Y88.058 E.01592
G1 X208.251 Y104.56 E.69578
G1 X208.251 Y105.093 E.01592
G1 X191.749 Y88.592 E.69578
G1 X191.749 Y89.126 E.01592
G1 X208.251 Y105.627 E.69578
G1 X208.251 Y106.161 E.01592
G1 X191.749 Y89.66 E.69578
G1 X191.749 Y90.194 E.01592
G1 X208.251 Y106.695 E.69578
G1 X208.251 Y107.229 E.01592
G1 X191.749 Y90.727 E.69578
G1 X191.749 Y91.261 E.01592
G1 X208.251 Y107.762 E.69578
G1 X208.251 Y108.296 E.01592
G1 X191.749 Y91.795 E.69578
G1 X191.749 Y92.329 E.01592
G1 X208.251 Y108.83 E.69578
G1 X208.251 Y109.364 E.01592
G1 X191.749 Y92.863 E.69578
G1 X191.749 Y93.396 E.01592
G1 X208.251 Y109.898 E.69578
G1 X208.251 Y110.431 E.01592
G1 X191.749 Y93.93 E.69578
G1 X191.749 Y94.464 E.01592
G1 X208.251 Y110.965 E.69578
G1 X208.251 Y111.499 E.01592
G1 X191.749 Y94.998 E.69578
G1 X191.749 Y95.532 E.01592
G1 X208.251 Y112.033 E.69578
G1 X208.251 Y112.566 E.01592
G1 X191.749 Y96.065 E.69578
G1 X191.749 Y96.599 E.01592
G1 X208.251 Y113.1 E.69578
G1 X208.251 Y113.634 E.01592
G1 X191.749 Y97.133 E.69578
G1 X191.749 Y97.667 E.01592
G1 X208.251 Y114.168 E.69578
G1 X208.251 Y114.702 E.01592
G1 X191.749 Y98.201 E.69578
G1 X191.749 Y98.734 E.01592
G1 X208.251 Y115.235 E.69578
G1 X208.251 Y115.769 E.01592
G1 X191.749 Y99.268 E.69578
G1 X191.749 Y99.802 E.01592
G1 X208.251 Y116.303 E.69578
G1 X208.251 Y116.837 E.01592
G1 X191.749 Y100.336 E.69578
G1 X191.749 Y100.87 E.01592
G1 X208.251 Y117.371 E.69578
G1 X208.251 Y117.904 E.01592
G1 X191.749 Y101.403 E.69578
G1 X191.749 Y101.937 E.01592
G1 X208.251 Y118.438 E.69578
G1 X208.251 Y118.972 E.01592
G1 X191.749 Y102.471 E.69578
G1 X191.749 Y103.005 E.01592
G1 X208.251 Y119.506 E.69578
G1 X208.251 Y120.04 E.01592
G1 X191.749 Y103.539 E.69578
G1 X191.749 Y104.072 E.01592
G1 X208.251 Y120.573 E.69578
G1 X208.251 Y121.107 E.01592
G1 X191.749 Y104.606 E.69578
G1 X191.749 Y105.14 E.01592
G1 X208.251 Y121.641 E.69578
G1 X208.251 Y122.175 E.01592
G1 X191.749 Y105.674 E.69578
G1 X191.749 Y106.208 E.01592
G1 X208.251 Y122.709 E.69578
G1 X208.251 Y123.242 E.01592
G1 X191.749 Y106.741 E.69578
G1 X191.749 Y107.275 E.01592
G1 X208.251 Y123.776 E.69578
G1 X208.251 Y124.31 E.01592
G1 X191.749 Y107.809 E.69578
G1 X191.749 Y108.343 E.01592
G1 X208.251 Y124.844 E.69578
G1 X208.251 Y125.378 E.01592
G1 X191.749 Y108.876 E.69578
G1 X191.749 Y109.41 E.01592
G1 X208.251 Y125.911 E.69578
G1 X208.251 Y126.445 E.01592
G1 X191.749 Y109.944 E.69578
G1 X191.749 Y110.478 E.01592
G1 X208.251 Y126.979 E.69578
G1 X208.251 Y127.513 E.01592
G1 X191.749 Y111.012 E.69578
G1 X191.749 Y111.545 E.01592
G1 X208.251 Y128.047 E.69578
G1 X208.251 Y128.58 E.01592
G1 X191.749 Y112.079 E.69578
G1 X191.749 Y112.613 E.01592
G1 X208.251 Y129.114 E.69578
G1 X208.251 Y129.648 E.01592
G1 X203.301 Y124.699 E.20869
G3 X203.502 Y125.433 I-3.417 J1.328 E.02274
G1 X208.251 Y130.182 E.20023
G1 X208.251 Y130.716 E.01592
G1 X203.551 Y126.016 E.19817
G3 X203.511 Y126.509 I-2.49 J.045 E.01479
G1 X208.251 Y131.249 E.19987
G1 X208.251 Y131.783 E.01592
G1 X203.418 Y126.951 E.20376
G3 X203.284 Y127.35 I-2.066 J-.475 E.01258
G1 X208.251 Y132.317 E.20944
G1 X208.251 Y132.851 E.01592
G1 X203.111 Y127.711 E.2167
G3 X202.905 Y128.039 I-1.745 J-.868 E.01156
G1 X208.251 Y133.384 E.22539
G1 X208.251 Y133.918 E.01592
G1 X202.67 Y128.338 E.23531
G3 X202.406 Y128.608 I-1.481 J-1.183 E.01127
G1 X208.251 Y134.452 E.24644
G1 X208.251 Y134.986 E.01592
G1 X202.114 Y128.849 E.25876
G3 X201.792 Y129.061 I-1.219 J-1.498 E.01151
G1 X208.251 Y135.52 E.27232
G1 X208.251 Y136.053 E.01592
G1 X201.439 Y129.242 E.2872
G3 X201.052 Y129.389 I-.925 J-1.862 E.01237
G1 X208.251 Y136.587 E.30354
G1 X208.251 Y137.121 E.01592
G1 X200.625 Y129.496 E.32153
G3 X200.141 Y129.545 I-.776 J-5.249 E.01453
G1 X208.251 Y137.655 E.34197
G1 X208.251 Y138.189 E.01592
G1 X199.588 Y129.526 E.36526
G3 X198.905 Y129.377 I.611 J-4.43 E.02087
G1 X208.251 Y138.722 E.39407
G1 X208.251 Y139.256 E.01592
G1 X191.749 Y122.755 E.69578
G1 X191.749 Y122.221 E.01592
G1 X196.627 Y127.099 E.20565
G3 X196.477 Y126.415 I3.48 J-1.122 E.02091
G1 X191.749 Y121.688 E.19932
G1 X191.749 Y121.154 E.01592
G1 X196.453 Y125.857 E.19832
G3 X196.507 Y125.377 I4.729 J.291 E.0144
G1 X191.749 Y120.62 E.2006
G1 X191.749 Y120.086 E.01592
G1 X196.612 Y124.949 E.20504
G3 X196.757 Y124.56 I2.011 J.531 E.01239
G1 X191.749 Y119.552 E.21116
G1 X191.749 Y119.019 E.01592
G1 X196.938 Y124.207 E.21876
G3 X197.149 Y123.884 I1.716 J.896 E.01151
G1 X191.749 Y118.485 E.22768
G1 X191.749 Y117.951 E.01592
G1 X197.39 Y123.592 E.23785
G3 X197.661 Y123.328 I10.908 J10.935 E.01126
G1 X191.749 Y117.417 E.24925
G1 X191.749 Y116.883 E.01592
G1 X197.961 Y123.094 E.26189
G3 X198.29 Y122.89 I1.183 J1.542 E.01158
G1 X191.749 Y116.35 E.2758
G1 X191.749 Y115.816 E.01592
G1 X198.652 Y122.718 E.29105
G3 X199.05 Y122.582 I.879 J1.922 E.01256
G1 X191.749 Y115.282 E.30783
G1 X191.749 Y114.748 E.01592
G1 X199.495 Y122.494 E.32659
G3 X199.986 Y122.451 I.506 J3.002 E.01473
G1 X191.749 Y114.214 E.34732
G1 X191.749 Y113.681 E.01592
G1 X200.565 Y122.496 E.3717
G3 X201.296 Y122.693 I-.739 J4.189 E.02262
G1 X191.58 Y112.977 E.40969
; WIPE_START
G1 X192.994 Y114.391 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X196.937 Y120.927 Z1 F30000
G1 X208.42 Y139.96 Z1
G1 Z.6
G1 E.8 F1800
G1 F9537.687
G1 X191.749 Y123.289 E.70294
G1 X191.749 Y123.823 E.01592
G1 X208.251 Y140.324 E.69578
G1 X208.251 Y140.858 E.01592
G1 X191.749 Y124.357 E.69578
G1 X191.749 Y124.89 E.01592
G1 X208.251 Y141.391 E.69578
G1 X208.251 Y141.925 E.01592
G1 X191.749 Y125.424 E.69578
G1 X191.749 Y125.958 E.01592
G1 X208.251 Y142.459 E.69578
G1 X208.251 Y142.993 E.01592
G1 X191.749 Y126.492 E.69578
G1 X191.749 Y127.026 E.01592
G1 X208.251 Y143.527 E.69578
G1 X208.251 Y144.06 E.01592
G1 X191.749 Y127.559 E.69578
G1 X191.749 Y128.093 E.01592
G1 X208.251 Y144.594 E.69578
G1 X208.251 Y145.128 E.01592
G1 X191.749 Y128.627 E.69578
G1 X191.749 Y129.161 E.01592
G1 X208.251 Y145.662 E.69578
G1 X208.251 Y146.196 E.01592
G1 X191.749 Y129.695 E.69578
G1 X191.749 Y130.228 E.01592
G1 X208.251 Y146.729 E.69578
G1 X208.251 Y147.263 E.01592
G1 X191.749 Y130.762 E.69578
G1 X191.749 Y131.296 E.01592
G1 X208.251 Y147.797 E.69578
G1 X208.251 Y148.331 E.01592
G1 X191.749 Y131.83 E.69578
G1 X191.749 Y132.363 E.01592
G1 X208.251 Y148.865 E.69578
G1 X208.251 Y149.398 E.01592
G1 X191.749 Y132.897 E.69578
G1 X191.749 Y133.431 E.01592
G1 X208.251 Y149.932 E.69578
G1 X208.251 Y150.466 E.01592
G1 X191.749 Y133.965 E.69578
G1 X191.749 Y134.499 E.01592
G1 X208.251 Y151 E.69578
G1 X208.251 Y151.534 E.01592
G1 X191.749 Y135.032 E.69578
G1 X191.749 Y135.566 E.01592
G1 X208.251 Y152.067 E.69578
G1 X208.251 Y152.601 E.01592
G1 X191.749 Y136.1 E.69578
G1 X191.749 Y136.634 E.01592
G1 X208.251 Y153.135 E.69578
G1 X208.251 Y153.669 E.01592
G1 X191.749 Y137.168 E.69578
G1 X191.749 Y137.701 E.01592
G1 X208.251 Y154.202 E.69578
G1 X208.251 Y154.736 E.01592
G1 X191.749 Y138.235 E.69578
G1 X191.749 Y138.769 E.01592
G1 X208.251 Y155.27 E.69578
G1 X208.251 Y155.804 E.01592
G1 X191.749 Y139.303 E.69578
G1 X191.749 Y139.837 E.01592
G1 X208.251 Y156.338 E.69578
G1 X208.251 Y156.871 E.01592
G1 X191.749 Y140.37 E.69578
G1 X191.749 Y140.904 E.01592
G1 X208.251 Y157.405 E.69578
G1 X208.251 Y157.939 E.01592
G1 X191.749 Y141.438 E.69578
G1 X191.749 Y141.972 E.01592
G1 X208.251 Y158.473 E.69578
G1 X208.251 Y159.007 E.01592
G1 X191.749 Y142.506 E.69578
G1 X191.749 Y143.039 E.01592
G1 X208.251 Y159.54 E.69578
G1 X208.251 Y160.074 E.01592
G1 X191.749 Y143.573 E.69578
G1 X191.749 Y144.107 E.01592
G1 X208.251 Y160.608 E.69578
G1 X208.251 Y161.142 E.01592
G1 X191.749 Y144.641 E.69578
G1 X191.749 Y145.175 E.01592
G1 X208.251 Y161.676 E.69578
G1 X208.251 Y162.209 E.01592
G1 X191.749 Y145.708 E.69578
G1 X191.749 Y146.242 E.01592
G1 X208.251 Y162.743 E.69578
G1 X208.251 Y163.277 E.01592
G1 X191.749 Y146.776 E.69578
G1 X191.749 Y147.31 E.01592
G1 X208.251 Y163.811 E.69578
G1 X208.251 Y164.345 E.01592
G1 X191.749 Y147.844 E.69578
G1 X191.749 Y148.377 E.01592
G1 X208.251 Y164.878 E.69578
G1 X208.251 Y165.412 E.01592
G1 X191.749 Y148.911 E.69578
G1 X191.749 Y149.445 E.01592
G1 X208.251 Y165.946 E.69578
G1 X208.251 Y166.48 E.01592
G1 X191.749 Y149.979 E.69578
G1 X191.749 Y150.513 E.01592
G1 X208.251 Y167.014 E.69578
G1 X208.251 Y167.547 E.01592
G1 X191.749 Y151.046 E.69578
G1 X191.749 Y151.58 E.01592
G1 X208.251 Y168.081 E.69578
G1 X208.251 Y168.615 E.01592
G1 X191.749 Y152.114 E.69578
G1 X191.749 Y152.648 E.01592
G1 X208.251 Y169.149 E.69578
G1 X208.251 Y169.683 E.01592
G1 X191.749 Y153.181 E.69578
G1 X191.749 Y153.715 E.01592
G1 X208.251 Y170.216 E.69578
G1 X208.251 Y170.75 E.01592
G1 X191.749 Y154.249 E.69578
G1 X191.749 Y154.783 E.01592
G1 X208.251 Y171.284 E.69578
G1 X208.251 Y171.818 E.01592
G1 X191.749 Y155.317 E.69578
G1 X191.749 Y155.85 E.01592
G1 X208.251 Y172.352 E.69578
G1 X208.251 Y172.885 E.01592
G1 X191.749 Y156.384 E.69578
G1 X191.749 Y156.918 E.01592
G1 X208.251 Y173.419 E.69578
G1 X208.251 Y173.953 E.01592
G1 X191.749 Y157.452 E.69578
G1 X191.749 Y157.986 E.01592
G1 X208.251 Y174.487 E.69578
G1 X208.251 Y175.02 E.01592
G1 X191.749 Y158.519 E.69578
G1 X191.749 Y159.053 E.01592
G1 X208.251 Y175.554 E.69578
G1 X208.251 Y176.088 E.01592
G1 X191.749 Y159.587 E.69578
G1 X191.749 Y160.121 E.01592
G1 X208.251 Y176.622 E.69578
G1 X208.251 Y177.156 E.01592
G1 X191.749 Y160.655 E.69578
G1 X191.749 Y161.188 E.01592
G1 X208.251 Y177.689 E.69578
G1 X208.251 Y178.223 E.01592
G1 X191.749 Y161.722 E.69578
G1 X191.749 Y162.256 E.01592
G1 X208.251 Y178.757 E.69578
G1 X208.251 Y179.291 E.01592
G1 X191.749 Y162.79 E.69578
G1 X191.749 Y163.324 E.01592
G1 X208.251 Y179.825 E.69578
G1 X208.251 Y180.358 E.01592
G1 X191.749 Y163.857 E.69578
G1 X191.749 Y164.391 E.01592
G1 X208.251 Y180.892 E.69578
G1 X208.251 Y181.426 E.01592
G1 X191.749 Y164.925 E.69578
G1 X191.749 Y165.459 E.01592
G1 X208.251 Y181.96 E.69578
G1 X208.251 Y182.494 E.01592
G1 X191.749 Y165.993 E.69578
G1 X191.749 Y166.526 E.01592
G1 X208.251 Y183.027 E.69578
G1 X208.251 Y183.561 E.01592
G1 X191.749 Y167.06 E.69578
G1 X191.749 Y167.594 E.01592
G1 X208.251 Y184.095 E.69578
G1 X208.251 Y184.629 E.01592
G1 X191.749 Y168.128 E.69578
G1 X191.749 Y168.662 E.01592
G1 X208.251 Y185.163 E.69578
G1 X208.251 Y185.696 E.01592
G1 X191.749 Y169.195 E.69578
G1 X191.749 Y169.729 E.01592
G1 X208.251 Y186.23 E.69578
G1 X208.251 Y186.764 E.01592
G1 X191.749 Y170.263 E.69578
G1 X191.749 Y170.797 E.01592
G1 X208.251 Y187.298 E.69578
G1 X208.251 Y187.832 E.01592
G1 X191.749 Y171.331 E.69578
G1 X191.749 Y171.864 E.01592
G1 X208.251 Y188.365 E.69578
G1 X208.251 Y188.899 E.01592
G1 X191.749 Y172.398 E.69578
G1 X191.749 Y172.932 E.01592
G1 X208.251 Y189.433 E.69578
G1 X208.251 Y189.967 E.01592
G1 X191.749 Y173.466 E.69578
G1 X191.749 Y173.999 E.01592
G1 X208.251 Y190.501 E.69578
G1 X208.251 Y191.034 E.01592
G1 X191.749 Y174.533 E.69578
G1 X191.749 Y175.067 E.01592
G1 X208.251 Y191.568 E.69578
G1 X208.251 Y192.102 E.01592
G1 X191.749 Y175.601 E.69578
G1 X191.749 Y176.135 E.01592
G1 X208.251 Y192.636 E.69578
G1 X208.251 Y193.17 E.01592
G1 X191.749 Y176.668 E.69578
G1 X191.749 Y177.202 E.01592
G1 X208.251 Y193.703 E.69578
G1 X208.251 Y194.237 E.01592
G1 X191.749 Y177.736 E.69578
G1 X191.749 Y178.27 E.01592
G1 X208.251 Y194.771 E.69578
G1 X208.251 Y195.305 E.01592
G1 X191.749 Y178.804 E.69578
G1 X191.749 Y179.337 E.01592
G1 X208.251 Y195.838 E.69578
G1 X208.251 Y196.372 E.01592
G1 X191.749 Y179.871 E.69578
G1 X191.749 Y180.405 E.01592
G1 X208.251 Y196.906 E.69578
G1 X208.251 Y197.44 E.01592
G1 X191.749 Y180.939 E.69578
G1 X191.749 Y181.473 E.01592
G1 X208.251 Y197.974 E.69578
G1 X208.251 Y198.507 E.01592
G1 X191.749 Y182.006 E.69578
G1 X191.749 Y182.54 E.01592
G1 X208.251 Y199.041 E.69578
G1 X208.251 Y199.575 E.01592
G1 X191.749 Y183.074 E.69578
G1 X191.749 Y183.608 E.01592
G1 X208.251 Y200.109 E.69578
G1 X208.251 Y200.643 E.01592
G1 X191.749 Y184.142 E.69578
G1 X191.749 Y184.675 E.01592
G1 X208.251 Y201.176 E.69578
G1 X208.251 Y201.71 E.01592
G1 X191.749 Y185.209 E.69578
G1 X191.749 Y185.743 E.01592
G1 X208.251 Y202.244 E.69578
G1 X208.251 Y202.778 E.01592
G1 X191.749 Y186.277 E.69578
G1 X191.749 Y186.811 E.01592
G1 X208.251 Y203.312 E.69578
G1 X208.251 Y203.845 E.01592
G1 X191.749 Y187.344 E.69578
G1 X191.749 Y187.878 E.01592
G1 X208.251 Y204.379 E.69578
G1 X208.251 Y204.913 E.01592
G1 X203.429 Y200.092 E.2033
G3 X203.538 Y200.735 I-3.616 J.945 E.01947
G1 X208.251 Y205.447 E.19869
G1 X208.251 Y205.981 E.01592
G1 X203.538 Y201.268 E.1987
G3 X203.473 Y201.737 I-4.866 J-.44 E.01411
G1 X208.251 Y206.514 E.20146
G1 X208.251 Y207.048 E.01592
G1 X203.355 Y202.153 E.20641
G3 X203.2 Y202.531 I-1.964 J-.586 E.01221
G1 X208.251 Y207.582 E.21297
G1 X208.251 Y208.116 E.01592
G1 X203.011 Y202.876 E.22094
G3 X202.791 Y203.19 I-1.681 J-.941 E.01145
G1 X208.251 Y208.65 E.2302
G1 X208.251 Y209.183 E.01592
G1 X202.542 Y203.475 E.24069
G3 X202.265 Y203.732 I-1.421 J-1.256 E.01128
G1 X207.784 Y209.251 E.2327
G1 X207.25 Y209.251 E.01592
G1 X201.96 Y203.96 E.22308
G3 X201.624 Y204.158 I-1.157 J-1.575 E.01164
G1 X206.716 Y209.251 E.21472
G1 X206.183 Y209.251 E.01592
G1 X201.253 Y204.321 E.20786
G3 X200.844 Y204.446 I-.827 J-1.979 E.01277
G1 X205.649 Y209.251 E.2026
G1 X205.115 Y209.251 E.01592
G1 X200.39 Y204.526 E.19921
G3 X199.879 Y204.548 I-.449 J-4.463 E.01528
G1 X204.581 Y209.251 E.19828
G1 X204.047 Y209.251 E.01592
G1 X199.27 Y204.473 E.20144
G3 X198.459 Y204.196 I.444 J-2.624 E.02565
G1 X203.514 Y209.251 E.21311
G1 X202.98 Y209.251 E.01592
G1 X186.479 Y192.749 E.69578
G1 X187.012 Y192.749 E.01592
G1 X196.797 Y202.534 E.41258
M73 P37 R43
G3 X196.529 Y201.732 I3.457 J-1.602 E.02526
G1 X187.546 Y192.749 E.37877
G1 X188.08 Y192.749 E.01592
G1 X196.453 Y201.122 E.35304
G3 X196.474 Y200.61 I2.57 J-.15 E.01532
G1 X188.614 Y192.749 E.33144
G1 X189.148 Y192.749 E.01592
G1 X196.552 Y200.154 E.31221
G3 X196.679 Y199.747 I6.054 J1.662 E.01271
G1 X189.681 Y192.749 E.29505
G1 X190.215 Y192.749 E.01592
G1 X196.844 Y199.378 E.27951
G3 X197.042 Y199.042 I1.78 J.82 E.01165
G1 X190.749 Y192.749 E.26533
G1 X191.283 Y192.749 E.01592
G1 X197.269 Y198.736 E.25242
G3 X197.526 Y198.458 I1.516 J1.143 E.01128
G1 X191.749 Y192.682 E.24355
G1 X191.749 Y192.149 E.01592
G1 X197.81 Y198.209 E.25556
G3 X198.124 Y197.989 I1.258 J1.458 E.01144
G1 X191.749 Y191.615 E.26878
G1 X191.749 Y191.081 E.01592
G1 X198.468 Y197.799 E.28329
G3 X198.845 Y197.643 I.97 J1.804 E.0122
G1 X191.749 Y190.547 E.29919
G1 X191.749 Y190.013 E.01592
G1 X199.265 Y197.529 E.31689
G3 X199.733 Y197.463 I.666 J3.045 E.01411
G1 X191.749 Y189.48 E.33662
G1 X191.749 Y188.946 E.01592
G1 X200.262 Y197.458 E.35894
G3 X200.906 Y197.568 I-.531 J5.044 E.01949
G1 X191.58 Y188.242 E.39324
; WIPE_START
G1 X192.994 Y189.656 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X185.476 Y190.976 Z1 F30000
G1 X80.377 Y209.42 Z1
G1 Z.6
G1 E.8 F1800
G1 F9537.687
G1 X47.749 Y176.793 E1.37576
G1 X47.749 Y177.327 E.01592
G1 X79.673 Y209.251 E1.34609
G1 X79.139 Y209.251 E.01592
G1 X47.749 Y177.861 E1.32358
G1 X47.749 Y178.394 E.01592
G1 X78.606 Y209.251 E1.30108
G1 X78.072 Y209.251 E.01592
G1 X47.749 Y178.928 E1.27857
G1 X47.749 Y179.462 E.01592
G1 X77.538 Y209.251 E1.25606
G1 X77.004 Y209.251 E.01592
G1 X47.749 Y179.996 E1.23355
G1 X47.749 Y180.53 E.01592
G1 X76.47 Y209.251 E1.21104
G1 X75.937 Y209.251 E.01592
G1 X47.749 Y181.063 E1.18854
G1 X47.749 Y181.597 E.01592
G1 X75.403 Y209.251 E1.16603
G1 X74.869 Y209.251 E.01592
G1 X47.749 Y182.131 E1.14352
G1 X47.749 Y182.665 E.01592
G1 X74.335 Y209.251 E1.12101
G1 X73.801 Y209.251 E.01592
G1 X47.749 Y183.199 E1.0985
G1 X47.749 Y183.732 E.01592
G1 X73.268 Y209.251 E1.076
G1 X72.734 Y209.251 E.01592
G1 X47.749 Y184.266 E1.05349
G1 X47.749 Y184.8 E.01592
G1 X72.2 Y209.251 E1.03098
G1 X71.666 Y209.251 E.01592
G1 X47.749 Y185.334 E1.00847
G1 X47.749 Y185.868 E.01592
G1 X71.132 Y209.251 E.98597
G1 X70.599 Y209.251 E.01592
G1 X47.749 Y186.401 E.96346
G1 X47.749 Y186.935 E.01592
G1 X70.065 Y209.251 E.94095
G1 X69.531 Y209.251 E.01592
G1 X47.749 Y187.469 E.91844
G1 X47.749 Y188.003 E.01592
G1 X57.558 Y197.811 E.41359
G2 X56.744 Y197.531 I-1.596 J3.316 E.02572
G1 X47.749 Y188.537 E.37928
G1 X47.749 Y189.07 E.01592
G1 X56.134 Y197.455 E.35355
G2 X55.62 Y197.475 I-.14 J3.08 E.01536
G1 X47.749 Y189.604 E.33187
G1 X47.749 Y190.138 E.01592
G1 X55.162 Y197.551 E.31257
G2 X54.756 Y197.678 I.432 J2.097 E.01273
G1 X47.749 Y190.672 E.29542
G1 X47.749 Y191.206 E.01592
G1 X54.385 Y197.842 E.27981
G2 X54.048 Y198.038 I.812 J1.783 E.01166
G1 X47.749 Y191.739 E.26559
G1 X47.749 Y192.273 E.01592
G1 X53.741 Y198.265 E.25263
G2 X53.462 Y198.52 I1.134 J1.516 E.01128
G1 X47.749 Y192.807 E.24089
G1 X47.749 Y193.341 E.01592
G1 X53.212 Y198.804 E.23035
G2 X52.991 Y199.116 I1.446 J1.258 E.01144
G1 X47.749 Y193.875 E.22102
G1 X47.749 Y194.408 E.01592
G1 X52.8 Y199.459 E.21297
G2 X52.646 Y199.839 I1.822 J.96 E.01223
G1 X47.749 Y194.942 E.20647
G1 X47.749 Y195.476 E.01592
G1 X52.531 Y200.258 E.20162
G2 X52.463 Y200.723 I2.293 J.574 E.01405
G1 X47.749 Y196.01 E.19874
G1 X47.749 Y196.543 E.01592
G1 X52.461 Y201.255 E.19865
G2 X52.562 Y201.89 I4.701 J-.428 E.01921
G1 X47.749 Y197.077 E.20295
G1 X47.749 Y197.611 E.01592
G1 X59.389 Y209.251 E.49079
G1 X59.923 Y209.251 E.01592
G1 X55.105 Y204.433 E.20313
G2 X55.744 Y204.538 I.907 J-3.53 E.01932
G1 X60.457 Y209.251 E.19871
G1 X60.99 Y209.251 E.01592
G1 X56.28 Y204.54 E.19863
G2 X56.743 Y204.469 I-.123 J-2.347 E.01398
G1 X61.524 Y209.251 E.20162
G1 X62.058 Y209.251 E.01592
G1 X57.16 Y204.352 E.20653
G2 X57.539 Y204.197 I-.586 J-1.972 E.01222
G1 X62.592 Y209.251 E.21307
G1 X63.125 Y209.251 E.01592
G1 X57.884 Y204.009 E.22103
G2 X58.198 Y203.789 I-.944 J-1.684 E.01145
G1 X63.659 Y209.251 E.2303
G1 X64.193 Y209.251 E.01592
G1 X58.482 Y203.54 E.2408
G2 X58.737 Y203.261 I-1.264 J-1.412 E.01128
G1 X64.727 Y209.251 E.25255
G1 X65.261 Y209.251 E.01592
G1 X58.963 Y202.953 E.26553
G2 X59.159 Y202.615 I-1.592 J-1.148 E.01167
G1 X65.794 Y209.251 E.27978
G1 X66.328 Y209.251 E.01592
G1 X59.322 Y202.244 E.29543
G2 X59.448 Y201.836 I-1.98 J-.832 E.01276
G1 X66.862 Y209.251 E.31264
G1 X67.396 Y209.251 E.01592
G1 X59.529 Y201.384 E.3317
G2 X59.545 Y200.866 I-4.466 J-.393 E.01547
G1 X67.93 Y209.251 E.35355
G1 X68.463 Y209.251 E.01592
G1 X59.472 Y200.259 E.37915
G2 X59.185 Y199.438 I-3.633 J.809 E.02597
G1 X69.167 Y209.42 E.42089
G1 X59.025 Y209.42 F30000
G1 F9537.687
G1 X47.749 Y198.145 E.47544
G1 X47.749 Y198.679 E.01592
G1 X58.321 Y209.251 E.44577
G1 X57.788 Y209.251 E.01592
G1 X47.749 Y199.212 E.42327
G1 X47.749 Y199.746 E.01592
G1 X57.254 Y209.251 E.40076
G1 X56.72 Y209.251 E.01592
G1 X47.749 Y200.28 E.37825
G1 X47.749 Y200.814 E.01592
G1 X56.186 Y209.251 E.35574
G1 X55.652 Y209.251 E.01592
G1 X47.749 Y201.348 E.33323
G1 X47.749 Y201.881 E.01592
G1 X55.119 Y209.251 E.31073
G1 X54.585 Y209.251 E.01592
G1 X47.749 Y202.415 E.28822
G1 X47.749 Y202.949 E.01592
G1 X54.051 Y209.251 E.26571
G1 X53.517 Y209.251 E.01592
G1 X47.749 Y203.483 E.2432
G1 X47.749 Y204.017 E.01592
G1 X52.983 Y209.251 E.22069
G1 X52.45 Y209.251 E.01592
G1 X47.749 Y204.55 E.19819
G1 X47.749 Y205.084 E.01592
G1 X51.916 Y209.251 E.17568
G1 X51.382 Y209.251 E.01592
G1 X47.749 Y205.618 E.15317
G1 X47.749 Y206.152 E.01592
G1 X50.848 Y209.251 E.13066
G1 X50.314 Y209.251 E.01592
G1 X47.749 Y206.686 E.10815
G1 X47.749 Y207.219 E.01592
G1 X49.781 Y209.251 E.08565
G1 X49.247 Y209.251 E.01592
G1 X47.749 Y207.753 E.06314
G1 X47.749 Y208.287 E.01592
G1 X48.713 Y209.251 E.04063
G1 X48.179 Y209.251 E.01592
G1 X47.58 Y208.651 E.02528
; WIPE_START
G1 X48.179 Y209.251 E-.32215
G1 X48.713 Y209.251 E-.20284
G1 X48.276 Y208.813 E-.23501
; WIPE_END
G1 E-.04 F1800
G1 X53.344 Y203.107 Z1 F30000
G1 X195.914 Y42.58 Z1
G1 Z.6
G1 E.8 F1800
G1 F9537.687
G1 X200.901 Y47.567 E.2103
G2 X200.258 Y47.458 I-1.148 J4.815 E.01946
G1 X195.55 Y42.749 E.19854
G1 X195.016 Y42.749 E.01592
G1 X199.729 Y47.463 E.19875
G2 X199.262 Y47.529 I.199 J3.108 E.0141
G1 X194.482 Y42.749 E.20153
G1 X193.948 Y42.749 E.01592
G1 X198.842 Y47.644 E.20637
G2 X198.465 Y47.801 I.594 J1.96 E.01219
G1 X193.414 Y42.749 E.21298
G1 X192.881 Y42.749 E.01592
G1 X198.122 Y47.99 E.22099
G2 X197.808 Y48.211 I.943 J1.674 E.01144
G1 X192.347 Y42.749 E.23028
G1 X191.813 Y42.749 E.01592
G1 X197.524 Y48.46 E.2408
G2 X197.268 Y48.738 I1.261 J1.42 E.01128
G1 X191.279 Y42.749 E.25251
G1 X190.745 Y42.749 E.01592
G1 X197.04 Y49.044 E.26543
G2 X196.843 Y49.381 I1.583 J1.155 E.01165
G1 X190.212 Y42.749 E.27961
G1 X189.678 Y42.749 E.01592
G1 X196.678 Y49.749 E.29516
G2 X196.551 Y50.157 I5.883 J2.046 E.01272
G1 X189.144 Y42.749 E.31234
G1 X188.61 Y42.749 E.01592
G1 X196.474 Y50.613 E.33157
G2 X196.453 Y51.126 I2.553 J.361 E.01533
G1 X188.076 Y42.749 E.3532
G1 X187.543 Y42.749 E.01592
G1 X196.53 Y51.737 E.37896
G2 X196.8 Y52.54 I3.74 J-.809 E.02533
G1 X187.009 Y42.749 E.41285
G1 X186.475 Y42.749 E.01592
G1 X208.251 Y64.525 E.91818
G1 X208.251 Y63.991 E.01592
G1 X198.452 Y54.193 E.41316
G2 X199.266 Y54.472 I1.27 J-2.369 E.02576
G1 X208.251 Y63.457 E.37886
G1 X208.251 Y62.924 E.01592
G1 X199.875 Y54.548 E.35317
G2 X200.387 Y54.526 I.073 J-4.419 E.0153
G1 X208.251 Y62.39 E.33156
G1 X208.251 Y61.856 E.01592
G1 X200.841 Y54.446 E.31243
G2 X201.25 Y54.322 I-.417 J-2.107 E.01278
G1 X208.251 Y61.322 E.29517
G1 X208.251 Y60.788 E.01592
G1 X201.622 Y54.16 E.27951
G2 X201.958 Y53.962 I-.822 J-1.777 E.01164
G1 X208.251 Y60.255 E.26535
G1 X208.251 Y59.721 E.01592
G1 X202.263 Y53.734 E.25246
G2 X202.541 Y53.477 I-1.143 J-1.513 E.01128
G1 X208.251 Y59.187 E.24077
G1 X208.251 Y58.653 E.01592
G1 X202.79 Y53.192 E.23027
G2 X203.009 Y52.878 I-1.462 J-1.257 E.01145
G1 X208.251 Y58.119 E.221
G1 X208.251 Y57.586 E.01592
G1 X203.199 Y52.534 E.21302
G2 X203.354 Y52.156 I-1.811 J-.967 E.01221
G1 X208.251 Y57.052 E.20645
G1 X208.251 Y56.518 E.01592
G1 X203.472 Y51.74 E.20149
G2 X203.538 Y51.272 I-4.767 J-.91 E.01409
G1 X208.251 Y55.984 E.19871
G1 X208.251 Y55.45 E.01592
G1 X203.539 Y50.738 E.19868
G2 X203.43 Y50.096 I-3.7 J.294 E.01944
G1 X208.251 Y54.917 E.20325
G1 X208.251 Y54.383 E.01592
G1 X196.617 Y42.749 E.49053
G1 X197.151 Y42.749 E.01592
G1 X208.251 Y53.849 E.46803
G1 X208.251 Y53.315 E.01592
G1 X197.685 Y42.749 E.44552
G1 X198.219 Y42.749 E.01592
G1 X208.251 Y52.781 E.42301
M73 P37 R42
G1 X208.251 Y52.248 E.01592
G1 X198.752 Y42.749 E.4005
G1 X199.286 Y42.749 E.01592
G1 X208.251 Y51.714 E.37799
G1 X208.251 Y51.18 E.01592
G1 X199.82 Y42.749 E.35549
G1 X200.354 Y42.749 E.01592
G1 X208.251 Y50.646 E.33298
G1 X208.251 Y50.112 E.01592
G1 X200.888 Y42.749 E.31047
G1 X201.421 Y42.749 E.01592
G1 X208.251 Y49.579 E.28796
G1 X208.251 Y49.045 E.01592
G1 X201.955 Y42.749 E.26545
G1 X202.489 Y42.749 E.01592
G1 X208.251 Y48.511 E.24295
G1 X208.251 Y47.977 E.01592
G1 X203.023 Y42.749 E.22044
G1 X203.557 Y42.749 E.01592
G1 X208.251 Y47.444 E.19793
G1 X208.251 Y46.91 E.01592
G1 X204.09 Y42.749 E.17542
G1 X204.624 Y42.749 E.01592
G1 X208.251 Y46.376 E.15291
G1 X208.251 Y45.842 E.01592
G1 X205.158 Y42.749 E.13041
G1 X205.692 Y42.749 E.01592
G1 X208.251 Y45.308 E.1079
G1 X208.251 Y44.775 E.01592
G1 X206.225 Y42.749 E.08539
G1 X206.759 Y42.749 E.01592
G1 X208.251 Y44.241 E.06288
G1 X208.251 Y43.707 E.01592
G1 X207.293 Y42.749 E.04037
G1 X207.827 Y42.749 E.01592
G1 X208.42 Y43.343 E.02502
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9537.687
G1 X207.827 Y42.749 E-.31888
G1 X207.293 Y42.749 E-.20284
G1 X207.736 Y43.193 E-.23828
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/58
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
G1 X198.52 Y123.147
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X198.679 Y123.072 E.00565
G3 X199.712 Y122.799 I1.329 J2.928 E.03453
G3 X201.176 Y123.005 I.285 J3.28 E.04794
G3 X198.395 Y123.219 I-1.168 J2.996 E.55683
G1 X198.468 Y123.177 E.00272
G1 X199.006 Y123.375 F30000
G1 F8843.478
G1 X199.106 Y123.341 E.00341
G3 X199.743 Y123.205 I.902 J2.66 E.02097
G3 X200.761 Y123.295 I.271 J2.736 E.03307
G3 X198.846 Y123.444 I-.753 J2.706 E.5045
G1 X198.951 Y123.399 E.00366
G1 X199.432 Y123.668 F30000
G1 F8843.478
G1 X199.466 Y123.661 E.00111
G3 X199.773 Y123.61 I.543 J2.339 E.01001
G3 X200.417 Y123.634 I.229 J2.581 E.02078
G3 X199.014 Y123.815 I-.408 J2.366 E.4389
G1 X199.376 Y123.688 E.01232
G1 X199.798 Y124.002 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X199.802 Y124.001 E.00014
G3 X200.349 Y124.02 I.199 J2.167 E.01634
G3 X199.553 Y124.043 I-.342 J1.979 E.35206
G1 X199.738 Y124.012 E.00559
; WIPE_START
M204 S10000
G1 X199.802 Y124.001 E-.02456
G1 X200.15 Y123.995 E-.13224
G1 X200.349 Y124.02 E-.07618
G1 X200.544 Y124.065 E-.07612
G1 X200.917 Y124.211 E-.15216
G1 X201.253 Y124.428 E-.15208
G1 X201.53 Y124.698 E-.14666
; WIPE_END
G1 E-.04 F1800
G1 X201.471 Y117.066 Z1.2 F30000
G1 X200.945 Y47.927 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X201.176 Y48.004 E.00783
G3 X199.712 Y47.799 I-1.168 J2.996 E.60166
G3 X200.871 Y47.904 I.285 J3.28 E.03762
G1 X200.887 Y47.909 E.00055
G1 X200.428 Y48.225 F30000
G1 F8843.478
G1 X200.488 Y48.232 E.00195
G3 X200.761 Y48.295 I-.474 J2.707 E.00902
G3 X199.743 Y48.205 I-.753 J2.706 E.53438
G3 X200.21 Y48.198 I.271 J2.735 E.01505
G1 X200.368 Y48.217 E.00512
G1 X200.049 Y48.606 F30000
G1 F8843.478
G1 X200.179 Y48.606 E.00418
G3 X200.417 Y48.634 I-.177 J2.585 E.0077
G3 X199.773 Y48.61 I-.408 J2.366 E.46429
G1 X199.989 Y48.607 E.00696
G1 X199.798 Y49.002 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X199.802 Y49.001 E.00014
G3 X200.349 Y49.02 I.199 J2.167 E.01634
G3 X199.553 Y49.043 I-.342 J1.979 E.35206
G1 X199.738 Y49.012 E.00559
; WIPE_START
M204 S10000
G1 X199.802 Y49.001 E-.02456
G1 X200.15 Y48.995 E-.13224
G1 X200.349 Y49.02 E-.07617
G1 X200.544 Y49.065 E-.07616
G1 X200.917 Y49.211 E-.15216
G1 X201.253 Y49.428 E-.15209
G1 X201.53 Y49.698 E-.14662
; WIPE_END
G1 E-.04 F1800
G1 X193.899 Y49.54 Z1.2 F30000
G1 X126.52 Y48.147 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X126.679 Y48.073 E.00564
G3 X127.712 Y47.799 I1.329 J2.928 E.03453
G3 X129.176 Y48.004 I.285 J3.281 E.04794
G3 X126.395 Y48.219 I-1.168 J2.996 E.55684
G1 X126.468 Y48.177 E.00272
G1 X127.006 Y48.375 F30000
G1 F8843.478
G1 X127.107 Y48.341 E.00341
G3 X127.743 Y48.205 I.902 J2.66 E.02097
G3 X128.761 Y48.295 I.271 J2.735 E.03307
G3 X126.846 Y48.444 I-.753 J2.706 E.5045
G1 X126.951 Y48.398 E.00366
G1 X127.433 Y48.668 F30000
G1 F8843.478
G1 X127.466 Y48.661 E.00111
G3 X127.773 Y48.61 I.543 J2.339 E.01
G3 X128.417 Y48.634 I.229 J2.581 E.02078
G3 X127.014 Y48.815 I-.408 J2.366 E.4389
G1 X127.376 Y48.688 E.01233
G1 X127.798 Y49.002 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X127.802 Y49.001 E.00014
G3 X128.349 Y49.02 I.199 J2.167 E.01634
G3 X127.553 Y49.043 I-.342 J1.979 E.35206
G1 X127.738 Y49.012 E.00559
; WIPE_START
M204 S10000
G1 X127.802 Y49.001 E-.02456
G1 X128.15 Y48.995 E-.13223
G1 X128.349 Y49.02 E-.07618
G1 X128.734 Y49.129 E-.15213
G1 X128.917 Y49.211 E-.07614
G1 X129.253 Y49.428 E-.15212
G1 X129.53 Y49.698 E-.14663
; WIPE_END
G1 E-.04 F1800
G1 X121.899 Y49.512 Z1.2 F30000
G1 X56.944 Y47.927 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X57.176 Y48.004 E.00787
G3 X55.712 Y47.799 I-1.168 J2.996 E.60166
G3 X56.871 Y47.904 I.285 J3.281 E.03762
G1 X56.887 Y47.909 E.00052
G1 X56.427 Y48.225 F30000
G1 F8843.478
G1 X56.488 Y48.232 E.00198
G3 X56.761 Y48.295 I-.474 J2.707 E.00902
G3 X55.743 Y48.205 I-.753 J2.706 E.53438
G3 X56.21 Y48.198 I.271 J2.735 E.01505
G1 X56.367 Y48.217 E.0051
G1 X56.049 Y48.606 F30000
G1 F8843.478
G1 X56.179 Y48.606 E.00421
G3 X56.417 Y48.634 I-.177 J2.585 E.0077
G3 X55.773 Y48.61 I-.408 J2.366 E.46429
G1 X55.989 Y48.607 E.00693
G1 X55.798 Y49.002 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X55.802 Y49.001 E.00014
G3 X56.349 Y49.02 I.199 J2.167 E.01634
G3 X55.553 Y49.043 I-.342 J1.979 E.35206
G1 X55.738 Y49.012 E.00559
; WIPE_START
M204 S10000
G1 X55.802 Y49.001 E-.0246
G1 X56.15 Y48.995 E-.13224
G1 X56.349 Y49.02 E-.07618
G1 X56.734 Y49.129 E-.15213
G1 X56.917 Y49.211 E-.07614
G1 X57.253 Y49.428 E-.15212
G1 X57.53 Y49.698 E-.1466
; WIPE_END
G1 E-.04 F1800
G1 X62.752 Y55.264 Z1.2 F30000
G1 X191.416 Y192.416 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X64.584 Y192.416 E4.07847
G1 X64.584 Y59.584 E4.27141
G1 X191.416 Y59.584 E4.07847
G1 X191.416 Y192.356 E4.26948
G1 X191.009 Y192.009 F30000
G1 F8843.478
G1 X64.991 Y192.009 E4.05229
G1 X64.991 Y59.991 E4.24523
G1 X191.009 Y59.991 E4.05229
G1 X191.009 Y191.949 E4.2433
G1 X190.602 Y191.602 F30000
G1 F8843.478
G1 X65.398 Y191.602 E4.02611
G1 X65.398 Y60.398 E4.21905
G1 X190.602 Y60.398 E4.02611
G1 X190.602 Y191.542 E4.21712
G1 X190.21 Y191.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X65.79 Y191.21 E3.70605
G1 X65.79 Y60.79 E3.88477
G1 X190.21 Y60.79 E3.70605
G1 X190.21 Y191.15 E3.88298
; WIPE_START
M204 S10000
G1 X188.21 Y191.151 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X181.347 Y187.811 Z1.2 F30000
G1 X58.497 Y128.027 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X58.468 Y128.071 E.00168
G3 X55.712 Y122.799 I-2.46 J-2.07 E.40534
G3 X57.176 Y123.004 I.285 J3.28 E.04793
G3 X58.662 Y127.815 I-1.168 J2.996 E.18599
G1 X58.533 Y127.98 E.00673
G1 X58.174 Y127.779 F30000
G1 F8843.478
G1 X58.157 Y127.81 E.00113
G3 X55.743 Y123.205 I-2.149 J-1.809 E.35387
G3 X56.761 Y123.295 I.271 J2.735 E.03307
G3 X58.327 Y127.586 I-.753 J2.706 E.17156
G1 X58.211 Y127.732 E.00598
G1 X57.832 Y127.537 F30000
G1 F8843.478
G1 X57.681 Y127.723 E.00771
G3 X55.773 Y123.61 I-1.671 J-1.723 E.29438
G3 X56.417 Y123.634 I.229 J2.581 E.02078
G3 X57.99 Y127.357 I-.408 J2.366 E.15447
G1 X57.871 Y127.492 E.00578
G1 X57.614 Y127.184 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X57.543 Y127.294 E.00391
G3 X55.802 Y124.001 I-1.536 J-1.295 E.23392
G3 X56.349 Y124.02 I.199 J2.167 E.01634
G3 X57.769 Y126.964 I-.342 J1.979 E.11369
G1 X57.648 Y127.135 E.00625
; WIPE_START
M204 S10000
G1 X57.543 Y127.294 E-.07272
G1 X57.253 Y127.572 E-.15224
G1 X56.917 Y127.789 E-.1521
G1 X56.734 Y127.871 E-.0762
G1 X56.349 Y127.98 E-.15209
G1 X55.95 Y128.01 E-.15213
G1 X55.943 Y128.009 E-.00251
; WIPE_END
G1 E-.04 F1800
G1 X55.789 Y135.64 Z1.2 F30000
G1 X54.52 Y198.147 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X54.679 Y198.072 E.00564
G3 X55.712 Y197.799 I1.329 J2.928 E.03452
G3 X57.176 Y198.004 I.285 J3.279 E.04794
G3 X54.394 Y198.219 I-1.168 J2.996 E.55683
G1 X54.468 Y198.177 E.00274
G1 X55.006 Y198.375 F30000
G1 F8843.478
G1 X55.107 Y198.341 E.0034
G3 X55.742 Y198.205 I.902 J2.66 E.02096
G3 X56.761 Y198.295 I.272 J2.733 E.03309
G3 X54.847 Y198.443 I-.753 J2.706 E.50442
G1 X54.951 Y198.398 E.00367
G1 X55.433 Y198.668 F30000
G1 F8843.478
G1 X55.466 Y198.661 E.0011
G3 X55.773 Y198.61 I.543 J2.339 E.01
G3 X56.417 Y198.634 I.23 J2.582 E.02079
G3 X55.014 Y198.815 I-.408 J2.366 E.43891
G1 X55.376 Y198.688 E.01234
G1 X55.791 Y199.003 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X55.802 Y199.001 E.00034
G3 X56.349 Y199.02 I.199 J2.168 E.01634
G3 X55.553 Y199.043 I-.342 J1.979 E.35206
G1 X55.732 Y199.013 E.00539
; WIPE_START
M204 S10000
G1 X55.802 Y199.001 E-.02713
G1 X56.15 Y198.995 E-.13224
G1 X56.349 Y199.02 E-.07618
G1 X56.734 Y199.129 E-.15213
G1 X57.091 Y199.311 E-.15212
G1 X57.404 Y199.561 E-.15209
G1 X57.519 Y199.698 E-.06811
; WIPE_END
G1 E-.04 F1800
G1 X65.149 Y199.527 Z1.2 F30000
G1 X126.52 Y198.147 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X126.679 Y198.072 E.00564
G3 X127.712 Y197.799 I1.329 J2.928 E.03452
G3 X129.176 Y198.005 I.285 J3.279 E.04795
G3 X126.395 Y198.219 I-1.168 J2.996 E.55683
G1 X126.468 Y198.177 E.00274
G1 X127.006 Y198.375 F30000
G1 F8843.478
G1 X127.106 Y198.341 E.0034
G3 X127.742 Y198.205 I.902 J2.66 E.02096
G3 X128.761 Y198.295 I.272 J2.733 E.03309
G3 X126.847 Y198.443 I-.753 J2.706 E.5045
G1 X126.951 Y198.398 E.00367
G1 X127.433 Y198.668 F30000
G1 F8843.478
G1 X127.466 Y198.661 E.00109
G3 X127.773 Y198.61 I.543 J2.339 E.01
G3 X128.417 Y198.634 I.23 J2.582 E.02079
G3 X127.014 Y198.815 I-.408 J2.366 E.43891
G1 X127.376 Y198.688 E.01234
G1 X127.791 Y199.003 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X127.802 Y199.001 E.00034
G3 X128.349 Y199.02 I.199 J2.168 E.01634
G3 X127.553 Y199.043 I-.342 J1.979 E.35206
G1 X127.732 Y199.013 E.00539
; WIPE_START
M204 S10000
G1 X127.802 Y199.001 E-.02713
G1 X128.15 Y198.995 E-.13223
G1 X128.349 Y199.02 E-.07619
G1 X128.734 Y199.129 E-.15213
G1 X129.091 Y199.311 E-.15212
G1 X129.404 Y199.561 E-.15209
G1 X129.519 Y199.698 E-.0681
; WIPE_END
G1 E-.04 F1800
G1 X137.149 Y199.509 Z1.2 F30000
G1 X200.944 Y197.927 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X201.176 Y198.004 E.00786
G3 X199.712 Y197.799 I-1.168 J2.996 E.60166
G3 X200.871 Y197.904 I.285 J3.279 E.03763
G1 X200.886 Y197.909 E.00051
G1 X200.427 Y198.225 F30000
G1 F8843.478
G1 X200.488 Y198.232 E.00198
G3 X200.761 Y198.295 I-.474 J2.706 E.00902
G3 X199.742 Y198.205 I-.753 J2.706 E.53445
G3 X200.21 Y198.198 I.272 J2.733 E.01505
G1 X200.367 Y198.217 E.00509
G1 X200.048 Y198.606 F30000
G1 F8843.478
G1 X200.179 Y198.606 E.00421
G3 X200.417 Y198.634 I-.177 J2.586 E.0077
G3 X199.773 Y198.61 I-.408 J2.366 E.46429
G1 X199.988 Y198.607 E.00693
G1 X199.791 Y199.003 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X199.802 Y199.001 E.00033
G3 X200.349 Y199.02 I.199 J2.168 E.01634
G3 X199.553 Y199.043 I-.342 J1.979 E.35206
G1 X199.732 Y199.013 E.0054
; WIPE_START
M204 S10000
G1 X199.802 Y199.001 E-.02699
G1 X200.15 Y198.995 E-.13224
G1 X200.349 Y199.02 E-.07618
G1 X200.734 Y199.129 E-.1521
G1 X201.091 Y199.311 E-.15215
G1 X201.404 Y199.561 E-.1521
G1 X201.519 Y199.698 E-.06825
; WIPE_END
G1 E-.04 F1800
G1 X205.957 Y205.908 Z1.2 F30000
G1 X208.584 Y209.584 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M73 P38 R42
G1 X47.416 Y209.584 E5.18256
G1 X47.416 Y42.416 E5.3755
G1 X208.584 Y42.416 E5.18256
G1 X208.584 Y209.524 E5.37357
G1 X208.991 Y209.991 F30000
G1 F8843.478
G1 X47.009 Y209.991 E5.20874
G1 X47.009 Y42.009 E5.40168
G1 X208.991 Y42.009 E5.20874
G1 X208.991 Y209.931 E5.39975
G1 X209.398 Y210.398 F30000
G1 F8843.478
G1 X46.602 Y210.398 E5.23492
G1 X46.602 Y41.602 E5.42786
G1 X209.398 Y41.602 E5.23492
G1 X209.398 Y210.338 E5.42593
G1 X209.79 Y210.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X46.21 Y210.79 E4.87249
G1 X46.21 Y41.21 E5.05121
G1 X209.79 Y41.21 E4.87249
G1 X209.79 Y210.73 E5.04942
; WIPE_START
M204 S10000
G1 X207.79 Y210.731 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X201.52 Y206.379 Z1.2 F30000
G1 X197.755 Y203.766 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G2 X199.204 Y204.477 I2.289 J-2.835 E.05233
G1 X194.446 Y209.236 E.21641
G1 X193.965 Y209.236 E.01547
G1 X177.494 Y192.764 E.74904
G1 X176.375 Y192.764 E.03597
G1 X159.904 Y209.236 E.74904
G1 X159.423 Y209.236 E.01547
G1 X142.952 Y192.764 E.74904
G1 X141.833 Y192.764 E.03597
G1 X125.362 Y209.236 E.74904
G1 X124.881 Y209.236 E.01547
G1 X108.41 Y192.764 E.74904
G1 X107.291 Y192.764 E.03597
G1 X90.82 Y209.236 E.74904
G1 X90.339 Y209.236 E.01546
G1 X73.868 Y192.764 E.74904
G1 X72.749 Y192.764 E.03597
G1 X56.278 Y209.236 E.74904
G1 X55.797 Y209.236 E.01546
G1 X47.764 Y201.203 E.36531
G1 X47.764 Y200.479 E.02328
G1 X64.236 Y184.007 E.74904
G1 X64.236 Y183.132 E.02816
G1 X47.764 Y166.661 E.74904
G1 X47.764 Y165.937 E.02328
G1 X64.236 Y149.466 E.74904
G1 X64.236 Y148.59 E.02816
G1 X47.764 Y132.119 E.74904
G1 X47.764 Y131.395 E.02328
G1 X52.499 Y126.66 E.21532
G3 X52.499 Y125.34 I3.518 J-.66 E.04271
G1 X47.764 Y120.605 E.21532
G1 X47.764 Y119.881 E.02328
G1 X64.236 Y103.41 E.74904
G1 X64.236 Y102.534 E.02816
G1 X47.764 Y86.063 E.74904
G1 X47.764 Y85.339 E.02328
G1 X64.236 Y68.868 E.74904
G1 X64.236 Y67.993 E.02816
G1 X47.764 Y51.521 E.74904
G1 X47.764 Y50.797 E.02328
G1 X55.797 Y42.764 E.36531
G1 X56.278 Y42.764 E.01547
G1 X72.749 Y59.236 E.74904
G1 X73.868 Y59.236 E.03597
G1 X90.339 Y42.764 E.74904
G1 X90.82 Y42.764 E.01547
G1 X107.291 Y59.236 E.74904
G1 X108.41 Y59.236 E.03597
G1 X124.881 Y42.764 E.74904
G1 X125.362 Y42.764 E.01546
G1 X141.833 Y59.236 E.74904
G1 X142.952 Y59.236 E.03597
G1 X159.423 Y42.764 E.74904
G1 X159.904 Y42.764 E.01546
G1 X176.375 Y59.236 E.74904
G1 X177.494 Y59.236 E.03597
G1 X193.965 Y42.764 E.74904
G1 X194.446 Y42.764 E.01546
G1 X199.204 Y47.523 E.21641
G3 X200.73 Y47.513 I.791 J4.101 E.04934
G1 X205.479 Y42.764 E.21594
G1 X205.96 Y42.764 E.01546
G1 X208.236 Y45.04 E.10351
G1 X208.236 Y45.764 E.02328
G1 X203.524 Y50.476 E.21428
G3 X203.474 Y51.793 I-3.559 J.525 E.0426
G1 X208.236 Y56.554 E.21654
G1 X208.236 Y57.278 E.02328
G1 X191.764 Y73.749 E.74904
G1 X191.764 Y74.625 E.02816
G1 X208.236 Y91.096 E.74904
G1 X208.236 Y91.82 E.02328
G1 X191.764 Y108.291 E.74904
G1 X191.764 Y109.167 E.02816
G1 X208.236 Y125.638 E.74904
G1 X208.236 Y126.362 E.02328
G1 X191.764 Y142.833 E.74904
G1 X191.764 Y143.709 E.02816
G1 X208.236 Y160.18 E.74904
G1 X208.236 Y160.904 E.02328
G1 X191.764 Y177.375 E.74904
G1 X191.764 Y178.251 E.02816
G1 X208.236 Y194.722 E.74904
G1 X208.236 Y195.446 E.02328
G1 X203.474 Y200.207 E.21654
G3 X203.524 Y201.524 I-3.509 J.791 E.0426
G1 X208.236 Y206.236 E.21428
G1 X208.236 Y206.959 E.02328
G1 X205.96 Y209.236 E.10351
G1 X205.479 Y209.236 E.01547
G1 X200.73 Y204.487 E.21594
G2 X202.195 Y203.809 I-.753 J-3.549 E.05233
; WIPE_START
G1 X201.627 Y204.174 E-.25622
G1 X200.73 Y204.487 E-.36112
G1 X200.996 Y204.753 E-.14266
; WIPE_END
G1 E-.04 F1800
G1 X201.105 Y197.121 Z1.2 F30000
G1 X202.085 Y128.888 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F8843.478
G3 X200.599 Y129.515 I-2.367 J-3.537 E.0522
G1 X208.236 Y137.152 E.34729
G1 X208.236 Y137.876 E.02328
G1 X191.764 Y154.347 E.74904
G1 X191.764 Y155.223 E.02816
G1 X208.236 Y171.694 E.74904
G1 X208.236 Y172.418 E.02328
G1 X191.764 Y188.889 E.74904
G1 X191.764 Y189.764 E.02816
G1 X199.481 Y197.481 E.35092
G3 X200.457 Y197.467 I.552 J4.508 E.03145
G1 X208.236 Y189.689 E.35374
G1 X208.236 Y188.965 E.02328
G1 X191.764 Y172.494 E.74904
G1 X191.764 Y171.618 E.02816
G1 X208.236 Y155.147 E.74904
G1 X208.236 Y154.423 E.02328
G1 X191.764 Y137.952 E.74904
G1 X191.764 Y137.076 E.02816
G1 X199.34 Y129.501 E.34449
G3 X196.486 Y126.597 I.663 J-3.505 E.13931
G1 X191.764 Y131.319 E.21474
G1 X191.764 Y132.195 E.02816
G1 X208.236 Y148.666 E.74904
G1 X208.236 Y149.39 E.02328
G1 X191.764 Y165.861 E.74904
G1 X191.764 Y166.737 E.02816
G1 X208.236 Y183.208 E.74904
G1 X208.236 Y183.932 E.02328
G1 X182.932 Y209.236 E1.15072
G1 X182.451 Y209.236 E.01547
G1 X165.98 Y192.764 E.74904
G1 X164.861 Y192.764 E.03597
G1 X148.39 Y209.236 E.74904
G1 X147.909 Y209.236 E.01547
G1 X131.438 Y192.764 E.74904
G1 X130.319 Y192.764 E.03597
G1 X113.848 Y209.236 E.74904
G1 X113.367 Y209.236 E.01546
G1 X96.896 Y192.764 E.74904
G1 X95.777 Y192.764 E.03597
G1 X79.306 Y209.236 E.74904
G1 X78.825 Y209.236 E.01546
G1 X47.764 Y178.175 E1.41252
G1 X47.764 Y177.451 E.02328
G1 X64.236 Y160.98 E.74904
G1 X64.236 Y160.104 E.02816
G1 X47.764 Y143.633 E.74904
G1 X47.764 Y142.909 E.02328
G1 X64.236 Y126.438 E.74904
G1 X64.236 Y125.562 E.02816
G1 X47.764 Y109.091 E.74904
G1 X47.764 Y108.367 E.02328
G1 X64.236 Y91.896 E.74904
G1 X64.236 Y91.02 E.02816
G1 X47.764 Y74.549 E.74904
G1 X47.764 Y73.825 E.02328
G1 X78.825 Y42.764 E1.41252
G1 X79.306 Y42.764 E.01547
G1 X95.777 Y59.236 E.74904
G1 X96.896 Y59.236 E.03597
G1 X113.367 Y42.764 E.74904
G1 X113.848 Y42.764 E.01546
G1 X130.319 Y59.236 E.74904
G1 X131.438 Y59.236 E.03597
G1 X147.909 Y42.764 E.74904
G1 X148.39 Y42.764 E.01547
G1 X164.861 Y59.236 E.74904
G1 X165.98 Y59.236 E.03597
G1 X182.451 Y42.764 E.74904
G1 X182.932 Y42.764 E.01546
G1 X208.236 Y68.068 E1.15072
G1 X208.236 Y68.792 E.02328
G1 X191.764 Y85.263 E.74904
G1 X191.764 Y86.139 E.02816
G1 X208.236 Y102.61 E.74904
G1 X208.236 Y103.334 E.02328
G1 X191.764 Y119.805 E.74904
G1 X191.764 Y120.681 E.02816
G1 X196.486 Y125.403 E.21474
G3 X199.342 Y122.502 I3.508 J.598 E.13936
G1 X191.764 Y114.924 E.34461
G1 X191.764 Y114.048 E.02816
G1 X208.236 Y97.577 E.74904
G1 X208.236 Y96.853 E.02328
G1 X191.764 Y80.382 E.74904
G1 X191.764 Y79.506 E.02816
G1 X208.236 Y63.035 E.74904
G1 X208.236 Y62.311 E.02328
G1 X200.457 Y54.533 E.35374
G3 X199.475 Y54.525 I-.44 J-6.083 E.0316
G1 X191.764 Y62.236 E.35066
G1 X191.764 Y63.111 E.02816
G1 X208.236 Y79.582 E.74904
G1 X208.236 Y80.306 E.02328
G1 X191.764 Y96.777 E.74904
G1 X191.764 Y97.653 E.02816
G1 X208.236 Y114.124 E.74904
G1 X208.236 Y114.848 E.02328
G1 X200.599 Y122.485 E.34729
G3 X202.085 Y123.112 I-.88 J4.163 E.0522
; WIPE_START
G1 X201.303 Y122.68 E-.3396
G1 X200.599 Y122.485 E-.27778
G1 X200.864 Y122.22 E-.14262
; WIPE_END
G1 E-.04 F1800
G1 X195.575 Y116.717 Z1.2 F30000
G1 X131.41 Y49.956 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F8843.478
G2 X130.597 Y48.562 I-4.039 J1.42 E.05221
G1 X136.395 Y42.764 E.26365
G1 X136.876 Y42.764 E.01546
G1 X153.347 Y59.236 E.74904
G1 X154.466 Y59.236 E.03597
G1 X170.937 Y42.764 E.74904
G1 X171.418 Y42.764 E.01546
G1 X187.889 Y59.236 E.74904
G1 X189.008 Y59.236 E.03597
G1 X196.513 Y51.73 E.34133
G3 X196.466 Y50.542 I4.886 J-.79 E.03833
G1 X188.689 Y42.764 E.35368
G1 X188.208 Y42.764 E.01546
G1 X171.737 Y59.236 E.74904
G1 X170.618 Y59.236 E.03597
G1 X154.147 Y42.764 E.74904
G1 X153.666 Y42.764 E.01546
G1 X137.195 Y59.236 E.74904
G1 X136.076 Y59.236 E.03597
G1 X130.439 Y53.598 E.25635
G3 X125.562 Y53.598 I-2.438 J-2.653 E.17228
G1 X119.924 Y59.236 E.25638
G1 X118.805 Y59.236 E.03597
G1 X102.334 Y42.764 E.74904
G1 X101.853 Y42.764 E.01546
G1 X85.382 Y59.236 E.74904
G1 X84.263 Y59.236 E.03597
G1 X67.792 Y42.764 E.74904
G1 X67.311 Y42.764 E.01547
G1 X59.533 Y50.542 E.35371
G3 X59.489 Y51.732 I-3.688 J.459 E.03846
G1 X66.992 Y59.236 E.34121
G1 X68.111 Y59.236 E.03597
G1 X84.582 Y42.764 E.74904
G1 X85.063 Y42.764 E.01547
G1 X101.534 Y59.236 E.74904
G1 X102.653 Y59.236 E.03597
G1 X119.124 Y42.764 E.74904
G1 X119.605 Y42.764 E.01546
G1 X125.4 Y48.56 E.26354
M73 P38 R41
G3 X126.744 Y47.666 I2.633 J2.503 E.05233
; WIPE_START
G1 X125.918 Y48.104 E-.35531
G1 X125.4 Y48.56 E-.26206
G1 X125.135 Y48.294 E-.14263
; WIPE_END
G1 E-.04 F1800
G1 X119.872 Y53.822 Z1.2 F30000
G1 X53.917 Y123.105 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F8843.478
G1 X53.918 Y123.104 E.00006
G3 X55.408 Y122.492 I2.056 J2.885 E.05226
G1 X47.764 Y114.848 E.34761
G1 X47.764 Y114.124 E.02328
G1 X64.236 Y97.653 E.74904
G1 X64.236 Y96.777 E.02816
G1 X47.764 Y80.306 E.74904
G1 X47.764 Y79.582 E.02328
G1 X64.236 Y63.111 E.74904
G1 X64.236 Y62.236 E.02816
G1 X56.524 Y54.524 E.35067
G3 X55.54 Y54.536 I-.575 J-7.017 E.03169
G1 X47.764 Y62.311 E.35359
G1 X47.764 Y63.035 E.02328
G1 X64.236 Y79.506 E.74904
G1 X64.236 Y80.382 E.02816
G1 X47.764 Y96.853 E.74904
G1 X47.764 Y97.577 E.02328
G1 X64.236 Y114.048 E.74904
G1 X64.236 Y114.924 E.02816
G1 X56.662 Y122.497 E.34441
G3 X59.513 Y125.404 I-.669 J3.508 E.13929
G1 X64.236 Y120.681 E.21478
G1 X64.236 Y119.805 E.02816
G1 X47.764 Y103.334 E.74904
G1 X47.764 Y102.61 E.02328
G1 X64.236 Y86.139 E.74904
G1 X64.236 Y85.263 E.02816
G1 X47.764 Y68.792 E.74904
G1 X47.764 Y68.068 E.02328
G1 X73.068 Y42.764 E1.15072
G1 X73.549 Y42.764 E.01547
G1 X90.02 Y59.236 E.74904
G1 X91.139 Y59.236 E.03597
G1 X107.61 Y42.764 E.74904
G1 X108.091 Y42.764 E.01547
G1 X124.562 Y59.236 E.74904
G1 X125.681 Y59.236 E.03597
G1 X142.152 Y42.764 E.74904
G1 X142.633 Y42.764 E.01546
G1 X159.104 Y59.236 E.74904
G1 X160.223 Y59.236 E.03597
G1 X176.694 Y42.764 E.74904
G1 X177.175 Y42.764 E.01546
G1 X208.236 Y73.825 E1.41252
G1 X208.236 Y74.549 E.02328
G1 X191.764 Y91.02 E.74904
G1 X191.764 Y91.896 E.02816
G1 X208.236 Y108.367 E.74904
G1 X208.236 Y109.091 E.02328
G1 X191.764 Y125.562 E.74904
G1 X191.764 Y126.438 E.02816
G1 X208.236 Y142.909 E.74904
G1 X208.236 Y143.633 E.02328
G1 X191.764 Y160.104 E.74904
G1 X191.764 Y160.98 E.02816
G1 X208.236 Y177.451 E.74904
G1 X208.236 Y178.175 E.02328
G1 X177.175 Y209.236 E1.41252
G1 X176.694 Y209.236 E.01547
G1 X160.223 Y192.764 E.74904
G1 X159.104 Y192.764 E.03597
G1 X142.633 Y209.236 E.74904
G1 X142.152 Y209.236 E.01546
G1 X125.681 Y192.764 E.74904
G1 X124.562 Y192.764 E.03597
G1 X108.091 Y209.236 E.74904
G1 X107.61 Y209.236 E.01547
G1 X91.139 Y192.764 E.74904
G1 X90.02 Y192.764 E.03597
G1 X73.549 Y209.236 E.74904
G1 X73.068 Y209.236 E.01546
G1 X47.764 Y183.932 E1.15072
G1 X47.764 Y183.208 E.02328
G1 X64.236 Y166.737 E.74904
G1 X64.236 Y165.861 E.02816
G1 X47.764 Y149.39 E.74904
M73 P39 R41
G1 X47.764 Y148.666 E.02328
G1 X64.236 Y132.195 E.74904
G1 X64.236 Y131.319 E.02816
G1 X59.513 Y126.596 E.21478
G3 X56.662 Y129.503 I-3.52 J-.601 E.13929
G1 X64.236 Y137.076 E.34441
G1 X64.236 Y137.952 E.02816
G1 X47.764 Y154.423 E.74904
G1 X47.764 Y155.147 E.02328
G1 X64.236 Y171.618 E.74904
G1 X64.236 Y172.494 E.02816
G1 X47.764 Y188.965 E.74904
G1 X47.764 Y189.689 E.02328
G1 X55.547 Y197.471 E.35392
G3 X56.524 Y197.476 I.468 J4.626 E.03149
G1 X64.236 Y189.764 E.35067
G1 X64.236 Y188.889 E.02816
G1 X47.764 Y172.418 E.74904
G1 X47.764 Y171.694 E.02328
G1 X64.236 Y155.223 E.74904
G1 X64.236 Y154.347 E.02816
G1 X47.764 Y137.876 E.74904
G1 X47.764 Y137.152 E.02328
G1 X55.404 Y129.512 E.34743
G3 X53.914 Y128.893 I.871 J-4.197 E.05221
; WIPE_START
G1 X54.533 Y129.251 E-.27178
G1 X55.404 Y129.512 E-.34562
G1 X55.139 Y129.777 E-.1426
; WIPE_END
G1 E-.04 F1800
G1 X55.002 Y137.409 Z1.2 F30000
G1 X53.806 Y203.807 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F8843.478
G2 X55.269 Y204.488 I2.473 J-3.397 E.0522
G1 X50.521 Y209.236 E.21589
G1 X50.04 Y209.236 E.01546
G1 X47.764 Y206.96 E.1035
G1 X47.764 Y206.235 E.02328
G1 X52.473 Y201.527 E.21411
G3 X52.526 Y200.207 I4.762 J-.469 E.04262
G1 X47.764 Y195.446 E.21654
G1 X47.764 Y194.722 E.02328
G1 X64.236 Y178.251 E.74904
G1 X64.236 Y177.375 E.02816
G1 X47.764 Y160.904 E.74904
G1 X47.764 Y160.18 E.02328
G1 X64.236 Y143.709 E.74904
G1 X64.236 Y142.833 E.02816
G1 X47.764 Y126.362 E.74904
G1 X47.764 Y125.638 E.02328
G1 X64.236 Y109.167 E.74904
G1 X64.236 Y108.291 E.02816
G1 X47.764 Y91.82 E.74904
G1 X47.764 Y91.096 E.02328
G1 X64.236 Y74.625 E.74904
G1 X64.236 Y73.749 E.02816
G1 X47.764 Y57.278 E.74904
G1 X47.764 Y56.554 E.02328
G1 X52.526 Y51.793 E.21654
G3 X52.473 Y50.473 I4.708 J-.851 E.04262
G1 X47.764 Y45.764 E.21411
G1 X47.764 Y45.04 E.02328
G1 X50.04 Y42.764 E.1035
G1 X50.521 Y42.764 E.01547
G1 X55.27 Y47.513 E.21593
G3 X56.792 Y47.527 I.729 J3.502 E.04933
G1 X61.554 Y42.764 E.21658
G1 X62.035 Y42.764 E.01547
G1 X78.506 Y59.236 E.74904
G1 X79.625 Y59.236 E.03597
G1 X96.096 Y42.764 E.74904
G1 X96.577 Y42.764 E.01547
G1 X113.048 Y59.236 E.74904
G1 X114.167 Y59.236 E.03597
G1 X130.638 Y42.764 E.74904
G1 X131.119 Y42.764 E.01547
G1 X147.59 Y59.236 E.74904
G1 X148.709 Y59.236 E.03597
G1 X165.18 Y42.764 E.74904
G1 X165.661 Y42.764 E.01546
G1 X182.132 Y59.236 E.74904
G1 X183.251 Y59.236 E.03597
G1 X199.722 Y42.764 E.74904
G1 X200.203 Y42.764 E.01546
G1 X208.236 Y50.797 E.36531
G1 X208.236 Y51.521 E.02328
G1 X191.764 Y67.993 E.74904
G1 X191.764 Y68.868 E.02816
G1 X208.236 Y85.339 E.74904
G1 X208.236 Y86.063 E.02328
G1 X191.764 Y102.534 E.74904
G1 X191.764 Y103.41 E.02816
G1 X208.236 Y119.881 E.74904
G1 X208.236 Y120.605 E.02328
G1 X203.503 Y125.338 E.21523
G3 X203.503 Y126.662 I-4.717 J.662 E.04272
G1 X208.236 Y131.395 E.21523
G1 X208.236 Y132.119 E.02328
G1 X191.764 Y148.59 E.74904
G1 X191.764 Y149.466 E.02816
G1 X208.236 Y165.937 E.74904
G1 X208.236 Y166.661 E.02328
G1 X191.764 Y183.132 E.74904
G1 X191.764 Y184.008 E.02816
G1 X208.236 Y200.479 E.74904
G1 X208.236 Y201.203 E.02328
G1 X200.203 Y209.236 E.36531
G1 X199.722 Y209.236 E.01547
G1 X183.251 Y192.764 E.74904
G1 X182.132 Y192.764 E.03597
G1 X165.661 Y209.236 E.74904
G1 X165.18 Y209.236 E.01547
G1 X148.709 Y192.764 E.74904
G1 X147.59 Y192.764 E.03597
G1 X131.119 Y209.236 E.74904
G1 X130.638 Y209.236 E.01546
G1 X114.167 Y192.764 E.74904
G1 X113.048 Y192.764 E.03597
G1 X96.577 Y209.236 E.74904
G1 X96.096 Y209.236 E.01546
G1 X79.625 Y192.764 E.74904
G1 X78.506 Y192.764 E.03597
G1 X62.035 Y209.236 E.74904
G1 X61.554 Y209.236 E.01546
G1 X56.792 Y204.473 E.21658
G2 X58.244 Y203.77 I-1.089 J-4.104 E.0522
G1 X124.594 Y202.043 F30000
G1 F8843.478
G2 X125.4 Y203.44 I4.025 J-1.391 E.0522
G1 X119.605 Y209.236 E.26354
G1 X119.124 Y209.236 E.01546
G1 X102.653 Y192.764 E.74904
G1 X101.534 Y192.764 E.03597
G1 X85.063 Y209.236 E.74904
G1 X84.582 Y209.236 E.01546
G1 X68.111 Y192.764 E.74904
G1 X66.992 Y192.764 E.03597
G1 X59.489 Y200.268 E.34121
G3 X59.533 Y201.458 I-3.645 J.731 E.03846
G1 X67.311 Y209.236 E.35371
G1 X67.792 Y209.236 E.01546
G1 X84.263 Y192.764 E.74904
G1 X85.382 Y192.764 E.03597
G1 X101.853 Y209.236 E.74904
G1 X102.334 Y209.236 E.01546
G1 X118.805 Y192.764 E.74904
G1 X119.924 Y192.764 E.03597
G1 X125.562 Y198.402 E.25638
G3 X130.439 Y198.401 I2.439 J2.639 E.17239
G1 X136.076 Y192.764 E.25635
G1 X137.195 Y192.764 E.03597
G1 X153.666 Y209.236 E.74904
G1 X154.147 Y209.236 E.01546
G1 X170.618 Y192.764 E.74904
G1 X171.737 Y192.764 E.03597
G1 X188.208 Y209.236 E.74904
G1 X188.689 Y209.236 E.01547
G1 X196.466 Y201.458 E.35368
G3 X196.513 Y200.27 I4.932 J-.398 E.03833
G1 X189.008 Y192.764 E.34133
G1 X187.889 Y192.764 E.03597
G1 X171.418 Y209.236 E.74904
G1 X170.937 Y209.236 E.01547
G1 X154.466 Y192.764 E.74904
G1 X153.347 Y192.764 E.03597
G1 X136.876 Y209.236 E.74904
G1 X136.395 Y209.236 E.01546
G1 X130.597 Y203.438 E.26365
G3 X129.257 Y204.336 I-2.973 J-2.989 E.0522
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X129.935 Y203.996 E-.28822
G1 X130.597 Y203.438 E-.32913
G1 X130.863 Y203.703 E-.14265
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/58
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
G1 X198.528 Y123.143
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X198.679 Y123.073 E.00537
G3 X199.724 Y122.798 I1.329 J2.928 E.03491
G3 X201.176 Y123.004 I.274 J3.279 E.04755
G3 X198.395 Y123.219 I-1.167 J2.996 E.55683
G1 X198.476 Y123.173 E.00301
G1 X199.014 Y123.372 F30000
G1 F8843.478
G1 X199.107 Y123.341 E.00313
G3 X199.754 Y123.204 I.903 J2.66 E.02135
G3 X200.761 Y123.295 I.261 J2.731 E.03269
G3 X198.847 Y123.444 I-.752 J2.706 E.50449
G1 X198.959 Y123.395 E.00393
G1 X199.502 Y123.652 F30000
G1 F8843.478
G1 X199.785 Y123.61 E.00921
G3 X200.651 Y123.687 I.145 J3.257 E.02804
G3 X199.443 Y123.666 I-.643 J2.314 E.44596
G1 X199.81 Y124.001 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X199.814 Y124.001 E.00012
G3 X200.349 Y124.02 I.188 J2.156 E.01599
G3 X199.553 Y124.043 I-.341 J1.979 E.35205
G1 X199.751 Y124.011 E.00596
; WIPE_START
M204 S10000
G1 X199.814 Y124.001 E-.02435
G1 X200.15 Y123.995 E-.1277
G1 X200.349 Y124.02 E-.07618
G1 X200.734 Y124.129 E-.15213
G1 X201.091 Y124.311 E-.15209
G1 X201.404 Y124.561 E-.15215
G1 X201.531 Y124.713 E-.0754
; WIPE_END
G1 E-.04 F1800
G1 X201.232 Y117.086 Z1.4 F30000
G1 X198.527 Y48.143 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X198.679 Y48.073 E.00539
G3 X199.724 Y47.798 I1.329 J2.928 E.0349
G3 X201.176 Y48.004 I.274 J3.279 E.04755
G3 X198.395 Y48.219 I-1.167 J2.996 E.55683
G1 X198.475 Y48.173 E.00299
G1 X199.014 Y48.372 F30000
G1 F8843.478
G1 X199.107 Y48.341 E.00314
G3 X199.754 Y48.204 I.903 J2.66 E.02135
G3 X200.761 Y48.295 I.261 J2.731 E.03269
G3 X198.847 Y48.444 I-.752 J2.706 E.50449
G1 X198.959 Y48.396 E.00392
G1 X199.501 Y48.652 F30000
G1 F8843.478
G1 X199.785 Y48.61 E.00922
G3 X200.417 Y48.634 I.219 J2.572 E.0204
G3 X199.443 Y48.667 I-.407 J2.367 E.45366
G1 X199.81 Y49.001 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X199.814 Y49.001 E.00012
G3 X200.349 Y49.02 I.188 J2.156 E.01599
G3 X199.553 Y49.043 I-.341 J1.979 E.35205
G1 X199.751 Y49.011 E.00596
; WIPE_START
M204 S10000
G1 X199.814 Y49.001 E-.02435
G1 X200.15 Y48.995 E-.1277
G1 X200.349 Y49.02 E-.07618
G1 X200.544 Y49.065 E-.07615
G1 X200.917 Y49.211 E-.15213
G1 X201.253 Y49.428 E-.15213
G1 X201.539 Y49.706 E-.15137
; WIPE_END
G1 E-.04 F1800
G1 X193.908 Y49.52 Z1.4 F30000
G1 X128.959 Y47.932 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X129.175 Y48.004 E.00735
G3 X127.724 Y47.798 I-1.167 J2.996 E.60205
G3 X128.871 Y47.904 I.274 J3.279 E.03724
G1 X128.901 Y47.914 E.00102
G1 X128.442 Y48.227 F30000
G1 F8843.478
G1 X128.488 Y48.232 E.00148
G3 X128.761 Y48.295 I-.473 J2.702 E.00902
G3 X127.754 Y48.204 I-.752 J2.706 E.53482
G3 X128.21 Y48.198 I.261 J2.73 E.01467
G1 X128.383 Y48.219 E.0056
G1 X128.065 Y48.606 F30000
G1 F8843.478
G1 X128.179 Y48.616 E.00368
G3 X128.651 Y48.687 I-.248 J3.249 E.01537
G3 X127.785 Y48.61 I-.643 J2.313 E.45703
G1 X128.005 Y48.606 E.00707
G1 X127.81 Y49.001 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X127.814 Y49.001 E.00012
G3 X128.349 Y49.02 I.188 J2.156 E.01599
G3 X127.553 Y49.043 I-.341 J1.979 E.35205
G1 X127.751 Y49.011 E.00596
; WIPE_START
M204 S10000
G1 X127.814 Y49.001 E-.02437
G1 X128.15 Y48.995 E-.1277
G1 X128.349 Y49.02 E-.07618
G1 X128.734 Y49.129 E-.15213
G1 X129.091 Y49.311 E-.15212
G1 X129.404 Y49.561 E-.1521
G1 X129.531 Y49.713 E-.07541
; WIPE_END
G1 E-.04 F1800
G1 X121.901 Y49.526 Z1.4 F30000
G1 X56.959 Y47.932 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X57.176 Y48.004 E.00736
G3 X55.724 Y47.798 I-1.167 J2.996 E.60204
G3 X56.871 Y47.904 I.274 J3.279 E.03724
G1 X56.901 Y47.914 E.00102
G1 X56.442 Y48.227 F30000
G1 F8843.478
G1 X56.488 Y48.232 E.00148
G3 X56.761 Y48.295 I-.473 J2.702 E.00902
G3 X55.754 Y48.204 I-.752 J2.706 E.53482
G3 X56.21 Y48.198 I.261 J2.731 E.01467
G1 X56.383 Y48.219 E.0056
G1 X56.065 Y48.606 F30000
G1 F8843.478
G1 X56.179 Y48.606 E.00369
G3 X56.417 Y48.634 I-.176 J2.575 E.0077
G3 X55.785 Y48.61 I-.407 J2.367 E.46481
G1 X56.005 Y48.606 E.00706
G1 X55.81 Y49.001 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X55.814 Y49.001 E.00013
G3 X56.349 Y49.02 I.188 J2.156 E.01599
G3 X55.553 Y49.043 I-.341 J1.979 E.35205
G1 X55.751 Y49.011 E.00596
; WIPE_START
M204 S10000
G1 X55.814 Y49.001 E-.02439
G1 X56.15 Y48.995 E-.1277
G1 X56.349 Y49.02 E-.07618
G1 X56.544 Y49.065 E-.07615
G1 X56.917 Y49.211 E-.15213
G1 X57.253 Y49.428 E-.15209
G1 X57.538 Y49.706 E-.15136
; WIPE_END
G1 E-.04 F1800
G1 X62.76 Y55.273 Z1.4 F30000
G1 X191.416 Y192.416 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X64.584 Y192.416 E4.07847
G1 X64.584 Y59.584 E4.27141
G1 X191.416 Y59.584 E4.07847
G1 X191.416 Y192.356 E4.26948
G1 X191.009 Y192.009 F30000
G1 F8843.478
G1 X64.991 Y192.009 E4.05229
G1 X64.991 Y59.991 E4.24523
G1 X191.009 Y59.991 E4.05229
G1 X191.009 Y191.949 E4.2433
G1 X190.602 Y191.602 F30000
G1 F8843.478
G1 X65.398 Y191.602 E4.02611
G1 X65.398 Y60.398 E4.21905
G1 X190.602 Y60.398 E4.02611
G1 X190.602 Y191.542 E4.21712
G1 X190.21 Y191.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X65.79 Y191.21 E3.70605
G1 X65.79 Y60.79 E3.88477
G1 X190.21 Y60.79 E3.70605
G1 X190.21 Y191.15 E3.88298
; WIPE_START
M204 S10000
G1 X188.21 Y191.151 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X181.347 Y187.811 Z1.4 F30000
G1 X58.496 Y128.027 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X58.468 Y128.071 E.00168
G3 X55.724 Y122.798 I-2.46 J-2.071 E.4057
G3 X57.176 Y123.004 I.274 J3.279 E.04755
G3 X58.662 Y127.815 I-1.167 J2.996 E.186
G1 X58.533 Y127.98 E.00673
G1 X58.174 Y127.779 F30000
G1 F8843.478
G1 X58.157 Y127.81 E.00113
G3 X55.754 Y123.204 I-2.148 J-1.809 E.35421
G3 X56.761 Y123.295 I.261 J2.731 E.03269
G3 X58.327 Y127.587 I-.752 J2.706 E.17158
G1 X58.211 Y127.732 E.00599
G1 X57.86 Y127.516 F30000
G1 F8843.478
G1 X57.846 Y127.549 E.00114
G3 X55.785 Y123.61 I-1.836 J-1.548 E.30254
G3 X56.417 Y123.634 I.219 J2.572 E.0204
G3 X58.117 Y127.153 I-.407 J2.367 E.14681
G1 X57.895 Y127.467 E.01239
G1 X57.604 Y127.199 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X57.543 Y127.295 E.00338
G3 X55.814 Y124.001 I-1.535 J-1.295 E.23422
G3 X56.349 Y124.02 I.188 J2.156 E.01598
G3 X57.77 Y126.964 I-.341 J1.979 E.11373
G1 X57.638 Y127.15 E.00679
; WIPE_START
M204 S10000
G1 X57.543 Y127.295 E-.06591
G1 X57.253 Y127.572 E-.15227
G1 X56.917 Y127.789 E-.15214
G1 X56.734 Y127.871 E-.07614
G1 X56.349 Y127.98 E-.15213
G1 X55.95 Y128.01 E-.15212
G1 X55.926 Y128.007 E-.0093
; WIPE_END
G1 E-.04 F1800
G1 X56.038 Y135.638 Z1.4 F30000
G1 X56.958 Y197.931 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X57.176 Y198.004 E.00737
G3 X55.724 Y197.798 I-1.167 J2.996 E.60204
G3 X56.871 Y197.904 I.274 J3.277 E.03724
G1 X56.901 Y197.914 E.00101
G1 X56.442 Y198.227 F30000
G1 F8843.478
G1 X56.488 Y198.232 E.00149
G3 X56.761 Y198.295 I-.473 J2.7 E.00902
G3 X55.754 Y198.204 I-.752 J2.706 E.53482
G3 X56.21 Y198.198 I.261 J2.729 E.01467
G1 X56.382 Y198.219 E.00559
G1 X56.064 Y198.606 F30000
G1 F8843.478
G1 X56.179 Y198.616 E.00369
G3 X56.651 Y198.687 I-.248 J3.246 E.01537
G3 X55.785 Y198.61 I-.643 J2.314 E.4571
G1 X56.004 Y198.606 E.00706
G1 X55.803 Y199.002 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X55.814 Y199.001 E.00033
G3 X56.349 Y199.02 I.188 J2.156 E.01599
G3 X55.553 Y199.043 I-.341 J1.979 E.35205
G1 X55.744 Y199.012 E.00576
; WIPE_START
M204 S10000
G1 X55.814 Y199.001 E-.02699
G1 X56.15 Y198.995 E-.1277
G1 X56.349 Y199.02 E-.07617
G1 X56.734 Y199.129 E-.15212
G1 X57.091 Y199.311 E-.15213
G1 X57.404 Y199.561 E-.1521
G1 X57.527 Y199.708 E-.07278
; WIPE_END
G1 E-.04 F1800
G1 X65.157 Y199.518 Z1.4 F30000
G1 X128.958 Y197.931 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X129.175 Y198.004 E.00737
G3 X127.724 Y197.798 I-1.167 J2.996 E.60204
G3 X128.871 Y197.904 I.274 J3.278 E.03725
G1 X128.901 Y197.914 E.001
G1 X128.442 Y198.227 F30000
G1 F8843.478
G1 X128.488 Y198.232 E.00149
G3 X128.761 Y198.295 I-.473 J2.7 E.00902
G3 X127.754 Y198.204 I-.752 J2.706 E.53482
G3 X128.21 Y198.198 I.261 J2.729 E.01467
G1 X128.382 Y198.219 E.00559
G1 X128.064 Y198.606 F30000
G1 F8843.478
G1 X128.179 Y198.616 E.00369
G3 X128.651 Y198.687 I-.248 J3.247 E.01537
G3 X127.785 Y198.61 I-.643 J2.314 E.4571
G1 X128.004 Y198.606 E.00706
G1 X127.803 Y199.002 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X127.814 Y199.001 E.00033
G3 X128.349 Y199.02 I.188 J2.156 E.01599
G3 X127.553 Y199.043 I-.341 J1.979 E.35205
G1 X127.744 Y199.012 E.00576
; WIPE_START
M204 S10000
G1 X127.814 Y199.001 E-.02698
G1 X128.15 Y198.995 E-.1277
G1 X128.349 Y199.02 E-.07618
G1 X128.734 Y199.129 E-.15213
G1 X129.091 Y199.311 E-.15212
G1 X129.404 Y199.561 E-.15211
G1 X129.527 Y199.708 E-.07278
; WIPE_END
G1 E-.04 F1800
G1 X137.157 Y199.535 Z1.4 F30000
G1 X198.528 Y198.143 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X198.679 Y198.073 E.00536
G3 X199.724 Y197.798 I1.329 J2.928 E.0349
G3 X201.176 Y198.005 I.274 J3.278 E.04756
G3 X198.394 Y198.22 I-1.167 J2.996 E.55682
G1 X198.476 Y198.173 E.00302
G1 X199.014 Y198.371 F30000
G1 F8843.478
G1 X199.107 Y198.341 E.00313
G3 X199.754 Y198.204 I.902 J2.66 E.02134
G3 X200.761 Y198.295 I.261 J2.731 E.0327
G3 X198.847 Y198.444 I-.752 J2.706 E.50449
G1 X198.959 Y198.395 E.00394
G1 X199.502 Y198.652 F30000
G1 F8843.478
G1 X199.785 Y198.61 E.0092
G3 X200.651 Y198.687 I.145 J3.255 E.02804
G3 X199.444 Y198.666 I-.643 J2.314 E.44597
G1 X199.804 Y199.002 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X199.814 Y199.001 E.00031
G3 X200.349 Y199.02 I.188 J2.156 E.01599
G3 X199.553 Y199.043 I-.341 J1.979 E.35205
G1 X199.745 Y199.012 E.00578
; WIPE_START
M204 S10000
G1 X199.814 Y199.001 E-.02675
G1 X200.15 Y198.995 E-.1277
G1 X200.349 Y199.02 E-.07618
G1 X200.544 Y199.065 E-.07615
G1 X200.917 Y199.211 E-.15213
G1 X201.253 Y199.428 E-.1521
G1 X201.534 Y199.702 E-.149
; WIPE_END
G1 E-.04 F1800
G1 X205.967 Y205.915 Z1.4 F30000
G1 X208.584 Y209.584 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X47.416 Y209.584 E5.18256
G1 X47.416 Y42.416 E5.3755
G1 X208.584 Y42.416 E5.18256
G1 X208.584 Y209.524 E5.37357
G1 X208.991 Y209.991 F30000
G1 F8843.478
G1 X47.009 Y209.991 E5.20874
G1 X47.009 Y42.009 E5.40168
G1 X208.991 Y42.009 E5.20874
G1 X208.991 Y209.931 E5.39975
G1 X209.398 Y210.398 F30000
G1 F8843.478
G1 X46.602 Y210.398 E5.23492
G1 X46.602 Y41.602 E5.42786
G1 X209.398 Y41.602 E5.23492
G1 X209.398 Y210.338 E5.42593
G1 X209.79 Y210.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X46.21 Y210.79 E4.87249
G1 X46.21 Y41.21 E5.05121
G1 X209.79 Y41.21 E4.87249
G1 X209.79 Y210.73 E5.04942
; WIPE_START
M204 S10000
G1 X207.79 Y210.731 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X202.992 Y204.795 Z1.4 F30000
G1 X202.195 Y203.809 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X200.73 Y204.487 I-2.217 J-2.87 E.05233
G1 X205.479 Y209.236 E.21594
G1 X205.96 Y209.236 E.01547
G1 X208.236 Y206.959 E.10351
G1 X208.236 Y206.236 E.02328
G1 X203.524 Y201.524 E.21428
G2 X203.474 Y200.207 I-3.559 J-.525 E.0426
G1 X208.236 Y195.446 E.21654
G1 X208.236 Y194.722 E.02328
G1 X191.764 Y178.251 E.74904
G1 X191.764 Y177.375 E.02816
G1 X208.236 Y160.904 E.74904
G1 X208.236 Y160.18 E.02328
G1 X191.764 Y143.709 E.74904
G1 X191.764 Y142.833 E.02816
G1 X208.236 Y126.362 E.74904
G1 X208.236 Y125.638 E.02328
G1 X191.764 Y109.167 E.74904
G1 X191.764 Y108.291 E.02816
G1 X208.236 Y91.82 E.74904
G1 X208.236 Y91.096 E.02328
G1 X191.764 Y74.625 E.74904
G1 X191.764 Y73.749 E.02816
M73 P40 R41
G1 X208.236 Y57.278 E.74904
G1 X208.236 Y56.554 E.02328
G1 X203.474 Y51.793 E.21654
G2 X203.524 Y50.476 I-3.51 J-.791 E.0426
G1 X208.236 Y45.764 E.21428
G1 X208.236 Y45.04 E.02328
G1 X205.96 Y42.764 E.10351
G1 X205.479 Y42.764 E.01546
G1 X200.73 Y47.513 E.21594
G2 X199.204 Y47.523 I-.735 J4.086 E.04935
G1 X194.446 Y42.764 E.21641
G1 X193.965 Y42.764 E.01546
G1 X177.494 Y59.236 E.74904
G1 X176.375 Y59.236 E.03597
G1 X159.904 Y42.764 E.74904
G1 X159.423 Y42.764 E.01546
G1 X142.952 Y59.236 E.74904
M73 P40 R40
G1 X141.833 Y59.236 E.03597
G1 X125.362 Y42.764 E.74904
G1 X124.881 Y42.764 E.01546
G1 X108.41 Y59.236 E.74904
G1 X107.291 Y59.236 E.03597
G1 X90.82 Y42.764 E.74904
G1 X90.339 Y42.764 E.01547
G1 X73.868 Y59.236 E.74904
G1 X72.749 Y59.236 E.03597
G1 X56.278 Y42.764 E.74904
G1 X55.797 Y42.764 E.01547
G1 X47.764 Y50.797 E.36531
G1 X47.764 Y51.521 E.02328
G1 X64.236 Y67.993 E.74904
G1 X64.236 Y68.868 E.02816
G1 X47.764 Y85.339 E.74904
G1 X47.764 Y86.063 E.02328
G1 X64.236 Y102.534 E.74904
G1 X64.236 Y103.41 E.02816
G1 X47.764 Y119.881 E.74904
G1 X47.764 Y120.605 E.02328
G1 X52.499 Y125.34 E.21532
G2 X52.499 Y126.66 I3.518 J.66 E.04271
G1 X47.764 Y131.395 E.21532
G1 X47.764 Y132.119 E.02328
G1 X64.236 Y148.59 E.74904
G1 X64.236 Y149.466 E.02816
G1 X47.764 Y165.937 E.74904
G1 X47.764 Y166.661 E.02328
G1 X64.236 Y183.132 E.74904
G1 X64.236 Y184.007 E.02816
G1 X47.764 Y200.479 E.74904
G1 X47.764 Y201.203 E.02328
G1 X55.797 Y209.236 E.36531
G1 X56.278 Y209.236 E.01546
G1 X72.749 Y192.764 E.74904
G1 X73.868 Y192.764 E.03597
G1 X90.339 Y209.236 E.74904
G1 X90.82 Y209.236 E.01546
G1 X107.291 Y192.764 E.74904
G1 X108.41 Y192.764 E.03597
G1 X124.881 Y209.236 E.74904
G1 X125.362 Y209.236 E.01547
G1 X141.833 Y192.764 E.74904
G1 X142.952 Y192.764 E.03597
G1 X159.423 Y209.236 E.74904
G1 X159.904 Y209.236 E.01547
G1 X176.375 Y192.764 E.74904
G1 X177.494 Y192.764 E.03597
G1 X193.965 Y209.236 E.74904
G1 X194.446 Y209.236 E.01547
G1 X199.204 Y204.477 E.21641
G3 X197.755 Y203.766 I.84 J-3.545 E.05233
G1 X129.257 Y204.336 F30000
G1 F8843.478
G2 X130.597 Y203.438 I-1.632 J-3.887 E.0522
G1 X136.395 Y209.236 E.26365
G1 X136.876 Y209.236 E.01546
G1 X153.347 Y192.764 E.74904
G1 X154.466 Y192.764 E.03597
G1 X170.937 Y209.236 E.74904
G1 X171.418 Y209.236 E.01547
G1 X187.889 Y192.764 E.74904
G1 X189.008 Y192.764 E.03597
G1 X196.513 Y200.27 E.34133
G2 X196.466 Y201.458 I4.885 J.79 E.03833
G1 X188.689 Y209.236 E.35368
G1 X188.208 Y209.236 E.01547
G1 X171.737 Y192.764 E.74904
G1 X170.618 Y192.764 E.03597
G1 X154.147 Y209.236 E.74904
G1 X153.666 Y209.236 E.01546
G1 X137.195 Y192.764 E.74904
G1 X136.076 Y192.764 E.03597
G1 X130.439 Y198.401 E.25635
G2 X125.562 Y198.402 I-2.438 J2.638 E.1724
G1 X119.924 Y192.764 E.25638
G1 X118.805 Y192.764 E.03597
G1 X102.334 Y209.236 E.74904
G1 X101.853 Y209.236 E.01546
G1 X85.382 Y192.764 E.74904
G1 X84.263 Y192.764 E.03597
G1 X67.792 Y209.236 E.74904
G1 X67.311 Y209.236 E.01546
G1 X59.533 Y201.458 E.35371
G2 X59.489 Y200.268 I-3.689 J-.459 E.03846
G1 X66.992 Y192.764 E.34121
G1 X68.111 Y192.764 E.03597
G1 X84.582 Y209.236 E.74904
G1 X85.063 Y209.236 E.01546
G1 X101.534 Y192.764 E.74904
G1 X102.653 Y192.764 E.03597
G1 X119.124 Y209.236 E.74904
G1 X119.605 Y209.236 E.01546
G1 X125.4 Y203.44 E.26354
G3 X124.594 Y202.043 I3.217 J-2.787 E.0522
G1 X58.244 Y203.77 F30000
G1 F8843.478
G3 X56.792 Y204.473 I-2.542 J-3.402 E.0522
G1 X61.554 Y209.236 E.21658
G1 X62.035 Y209.236 E.01546
G1 X78.506 Y192.764 E.74904
G1 X79.625 Y192.764 E.03597
G1 X96.096 Y209.236 E.74904
G1 X96.577 Y209.236 E.01546
G1 X113.048 Y192.764 E.74904
G1 X114.167 Y192.764 E.03597
G1 X130.638 Y209.236 E.74904
G1 X131.119 Y209.236 E.01546
G1 X147.59 Y192.764 E.74904
G1 X148.709 Y192.764 E.03597
G1 X165.18 Y209.236 E.74904
G1 X165.661 Y209.236 E.01547
G1 X182.132 Y192.764 E.74904
G1 X183.251 Y192.764 E.03597
G1 X199.722 Y209.236 E.74904
G1 X200.203 Y209.236 E.01547
G1 X208.236 Y201.203 E.36531
G1 X208.236 Y200.479 E.02328
G1 X191.764 Y184.008 E.74904
G1 X191.764 Y183.132 E.02816
G1 X208.236 Y166.661 E.74904
G1 X208.236 Y165.937 E.02328
G1 X191.764 Y149.466 E.74904
G1 X191.764 Y148.59 E.02816
G1 X208.236 Y132.119 E.74904
G1 X208.236 Y131.395 E.02328
G1 X203.503 Y126.662 E.21523
G2 X203.503 Y125.338 I-4.717 J-.662 E.04272
G1 X208.236 Y120.605 E.21523
G1 X208.236 Y119.881 E.02328
G1 X191.764 Y103.41 E.74904
G1 X191.764 Y102.534 E.02816
G1 X208.236 Y86.063 E.74904
G1 X208.236 Y85.339 E.02328
G1 X191.764 Y68.868 E.74904
G1 X191.764 Y67.993 E.02816
G1 X208.236 Y51.521 E.74904
G1 X208.236 Y50.797 E.02328
G1 X200.203 Y42.764 E.36531
G1 X199.722 Y42.764 E.01546
G1 X183.251 Y59.236 E.74904
G1 X182.132 Y59.236 E.03597
G1 X165.661 Y42.764 E.74904
G1 X165.18 Y42.764 E.01546
G1 X148.709 Y59.236 E.74904
G1 X147.59 Y59.236 E.03597
G1 X131.119 Y42.764 E.74904
G1 X130.638 Y42.764 E.01547
G1 X114.167 Y59.236 E.74904
G1 X113.048 Y59.236 E.03597
G1 X96.577 Y42.764 E.74904
G1 X96.096 Y42.764 E.01547
G1 X79.625 Y59.236 E.74904
G1 X78.506 Y59.236 E.03597
G1 X62.035 Y42.764 E.74904
G1 X61.554 Y42.764 E.01547
G1 X56.792 Y47.527 E.21658
G2 X55.27 Y47.513 I-.794 J3.485 E.04933
G1 X50.521 Y42.764 E.21593
G1 X50.04 Y42.764 E.01547
G1 X47.764 Y45.04 E.1035
G1 X47.764 Y45.764 E.02328
G1 X52.473 Y50.473 E.21411
G2 X52.526 Y51.793 I4.76 J.469 E.04262
G1 X47.764 Y56.554 E.21654
G1 X47.764 Y57.278 E.02328
G1 X64.236 Y73.749 E.74904
G1 X64.236 Y74.625 E.02816
G1 X47.764 Y91.096 E.74904
G1 X47.764 Y91.82 E.02328
G1 X64.236 Y108.291 E.74904
G1 X64.236 Y109.167 E.02816
G1 X47.764 Y125.638 E.74904
G1 X47.764 Y126.362 E.02328
G1 X64.236 Y142.833 E.74904
G1 X64.236 Y143.709 E.02816
G1 X47.764 Y160.18 E.74904
G1 X47.764 Y160.904 E.02328
G1 X64.236 Y177.375 E.74904
G1 X64.236 Y178.251 E.02816
G1 X47.764 Y194.722 E.74904
G1 X47.764 Y195.446 E.02328
G1 X52.526 Y200.207 E.21654
G2 X52.473 Y201.527 I4.708 J.851 E.04262
G1 X47.764 Y206.235 E.21411
G1 X47.764 Y206.96 E.02328
G1 X50.04 Y209.236 E.1035
G1 X50.521 Y209.236 E.01546
G1 X55.269 Y204.488 E.21589
G3 X53.806 Y203.807 I1.01 J-4.078 E.0522
; WIPE_START
G1 X54.533 Y204.251 E-.32357
G1 X55.269 Y204.488 E-.29377
G1 X55.003 Y204.754 E-.14266
; WIPE_END
G1 E-.04 F1800
G1 X54.894 Y197.122 Z1.4 F30000
G1 X53.914 Y128.893 Z1.4
G1 Z1
G1 E.8 F1800
G1 F8843.478
G2 X55.404 Y129.512 I2.36 J-3.576 E.05221
G1 X47.764 Y137.152 E.34743
G1 X47.764 Y137.876 E.02328
G1 X64.236 Y154.347 E.74904
G1 X64.236 Y155.223 E.02816
G1 X47.764 Y171.694 E.74904
G1 X47.764 Y172.418 E.02328
G1 X64.236 Y188.889 E.74904
G1 X64.236 Y189.764 E.02816
G1 X56.524 Y197.476 E.35067
G2 X55.548 Y197.472 I-.506 J4.487 E.03147
G1 X47.764 Y189.689 E.35394
G1 X47.764 Y188.965 E.02328
G1 X64.236 Y172.494 E.74904
G1 X64.236 Y171.618 E.02816
G1 X47.764 Y155.147 E.74904
G1 X47.764 Y154.423 E.02328
G1 X64.236 Y137.952 E.74904
G1 X64.236 Y137.076 E.02816
G1 X56.662 Y129.503 E.34441
G2 X59.513 Y126.596 I-.669 J-3.507 E.13929
G1 X64.236 Y131.319 E.21478
G1 X64.236 Y132.195 E.02816
G1 X47.764 Y148.666 E.74904
G1 X47.764 Y149.39 E.02328
G1 X64.236 Y165.861 E.74904
G1 X64.236 Y166.737 E.02816
G1 X47.764 Y183.208 E.74904
G1 X47.764 Y183.932 E.02328
G1 X73.068 Y209.236 E1.15072
G1 X73.549 Y209.236 E.01546
G1 X90.02 Y192.764 E.74904
G1 X91.139 Y192.764 E.03597
G1 X107.61 Y209.236 E.74904
G1 X108.091 Y209.236 E.01547
G1 X124.562 Y192.764 E.74904
G1 X125.681 Y192.764 E.03597
G1 X142.152 Y209.236 E.74904
G1 X142.633 Y209.236 E.01546
G1 X159.104 Y192.764 E.74904
G1 X160.223 Y192.764 E.03597
G1 X176.694 Y209.236 E.74904
G1 X177.175 Y209.236 E.01547
G1 X208.236 Y178.175 E1.41252
G1 X208.236 Y177.451 E.02328
G1 X191.764 Y160.98 E.74904
G1 X191.764 Y160.104 E.02816
G1 X208.236 Y143.633 E.74904
G1 X208.236 Y142.909 E.02328
G1 X191.764 Y126.438 E.74904
G1 X191.764 Y125.562 E.02816
G1 X208.236 Y109.091 E.74904
G1 X208.236 Y108.367 E.02328
G1 X191.764 Y91.896 E.74904
G1 X191.764 Y91.02 E.02816
G1 X208.236 Y74.549 E.74904
G1 X208.236 Y73.825 E.02328
G1 X177.175 Y42.764 E1.41252
G1 X176.694 Y42.764 E.01546
G1 X160.223 Y59.236 E.74904
G1 X159.104 Y59.236 E.03597
G1 X142.633 Y42.764 E.74904
G1 X142.152 Y42.764 E.01546
G1 X125.681 Y59.236 E.74904
G1 X124.562 Y59.236 E.03597
G1 X108.091 Y42.764 E.74904
G1 X107.61 Y42.764 E.01547
G1 X91.139 Y59.236 E.74904
G1 X90.02 Y59.236 E.03597
G1 X73.549 Y42.764 E.74904
G1 X73.068 Y42.764 E.01547
G1 X47.764 Y68.068 E1.15072
G1 X47.764 Y68.792 E.02328
G1 X64.236 Y85.263 E.74904
G1 X64.236 Y86.139 E.02816
G1 X47.764 Y102.61 E.74904
G1 X47.764 Y103.334 E.02328
G1 X64.236 Y119.805 E.74904
G1 X64.236 Y120.681 E.02816
G1 X59.513 Y125.404 E.21478
G2 X56.662 Y122.497 I-3.52 J.601 E.13929
G1 X64.236 Y114.924 E.34441
G1 X64.236 Y114.048 E.02816
G1 X47.764 Y97.577 E.74904
G1 X47.764 Y96.853 E.02328
G1 X64.236 Y80.382 E.74904
G1 X64.236 Y79.506 E.02816
G1 X47.764 Y63.035 E.74904
G1 X47.764 Y62.311 E.02328
G1 X55.54 Y54.536 E.35359
G2 X56.524 Y54.524 I.409 J-7.034 E.03169
G1 X64.236 Y62.236 E.35067
G1 X64.236 Y63.111 E.02816
G1 X47.764 Y79.582 E.74904
G1 X47.764 Y80.306 E.02328
G1 X64.236 Y96.777 E.74904
G1 X64.236 Y97.653 E.02816
G1 X47.764 Y114.124 E.74904
G1 X47.764 Y114.848 E.02328
G1 X55.409 Y122.492 E.34763
G2 X53.917 Y123.105 I.809 J4.093 E.05219
; WIPE_START
G1 X54.533 Y122.749 E-.27052
G1 X55.409 Y122.492 E-.34663
G1 X55.143 Y122.226 E-.14285
; WIPE_END
G1 E-.04 F1800
G1 X60.429 Y116.721 Z1.4 F30000
G1 X126.744 Y47.666 Z1.4
G1 Z1
G1 E.8 F1800
G1 F8843.478
G2 X125.4 Y48.56 I1.29 J3.397 E.05233
G1 X119.605 Y42.764 E.26354
G1 X119.124 Y42.764 E.01546
G1 X102.653 Y59.236 E.74904
G1 X101.534 Y59.236 E.03597
G1 X85.063 Y42.764 E.74904
G1 X84.582 Y42.764 E.01547
G1 X68.111 Y59.236 E.74904
G1 X66.992 Y59.236 E.03597
G1 X59.489 Y51.732 E.34121
G2 X59.533 Y50.542 I-3.644 J-.731 E.03846
G1 X67.311 Y42.764 E.35371
G1 X67.792 Y42.764 E.01547
G1 X84.263 Y59.236 E.74904
G1 X85.382 Y59.236 E.03597
G1 X101.853 Y42.764 E.74904
M73 P41 R40
G1 X102.334 Y42.764 E.01546
G1 X118.805 Y59.236 E.74904
G1 X119.924 Y59.236 E.03597
G1 X125.562 Y53.598 E.25638
G2 X130.439 Y53.599 I2.439 J-2.652 E.17228
G1 X136.076 Y59.236 E.25635
G1 X137.195 Y59.236 E.03597
G1 X153.666 Y42.764 E.74904
G1 X154.147 Y42.764 E.01546
G1 X170.618 Y59.236 E.74904
G1 X171.737 Y59.236 E.03597
G1 X188.208 Y42.764 E.74904
G1 X188.689 Y42.764 E.01546
G1 X196.466 Y50.542 E.35368
G2 X196.513 Y51.73 I4.932 J.398 E.03833
G1 X189.008 Y59.236 E.34133
G1 X187.889 Y59.236 E.03597
G1 X171.418 Y42.764 E.74904
G1 X170.937 Y42.764 E.01546
G1 X154.466 Y59.236 E.74904
G1 X153.347 Y59.236 E.03597
G1 X136.876 Y42.764 E.74904
G1 X136.395 Y42.764 E.01546
G1 X130.597 Y48.562 E.26365
G3 X131.41 Y49.956 I-3.226 J2.815 E.05221
; WIPE_START
G1 X131.132 Y49.294 E-.27289
G1 X130.597 Y48.562 E-.34451
G1 X130.863 Y48.297 E-.14259
; WIPE_END
G1 E-.04 F1800
G1 X136.125 Y53.825 Z1.4 F30000
G1 X202.085 Y123.112 Z1.4
G1 Z1
G1 E.8 F1800
G1 F8843.478
G2 X200.599 Y122.485 I-2.367 J3.537 E.0522
G1 X208.236 Y114.848 E.34729
G1 X208.236 Y114.124 E.02328
G1 X191.764 Y97.653 E.74904
G1 X191.764 Y96.777 E.02816
G1 X208.236 Y80.306 E.74904
G1 X208.236 Y79.582 E.02328
G1 X191.764 Y63.111 E.74904
G1 X191.764 Y62.236 E.02816
G1 X199.475 Y54.525 E.35066
G2 X200.457 Y54.533 I.541 J-6.077 E.0316
G1 X208.236 Y62.311 E.35374
G1 X208.236 Y63.035 E.02328
G1 X191.764 Y79.506 E.74904
G1 X191.764 Y80.382 E.02816
G1 X208.236 Y96.853 E.74904
G1 X208.236 Y97.577 E.02328
G1 X191.764 Y114.048 E.74904
G1 X191.764 Y114.924 E.02816
G1 X199.343 Y122.502 E.34462
G2 X196.486 Y125.403 I.652 J3.498 E.13936
G1 X191.764 Y120.681 E.21474
G1 X191.764 Y119.805 E.02816
G1 X208.236 Y103.334 E.74904
G1 X208.236 Y102.61 E.02328
G1 X191.764 Y86.139 E.74904
G1 X191.764 Y85.263 E.02816
G1 X208.236 Y68.792 E.74904
G1 X208.236 Y68.068 E.02328
G1 X182.932 Y42.764 E1.15072
G1 X182.451 Y42.764 E.01546
G1 X165.98 Y59.236 E.74904
G1 X164.861 Y59.236 E.03597
G1 X148.39 Y42.764 E.74904
G1 X147.909 Y42.764 E.01547
G1 X131.438 Y59.236 E.74904
G1 X130.319 Y59.236 E.03597
G1 X113.848 Y42.764 E.74904
G1 X113.367 Y42.764 E.01546
G1 X96.896 Y59.236 E.74904
G1 X95.777 Y59.236 E.03597
G1 X79.306 Y42.764 E.74904
G1 X78.825 Y42.764 E.01547
G1 X47.764 Y73.825 E1.41252
G1 X47.764 Y74.549 E.02328
G1 X64.236 Y91.02 E.74904
G1 X64.236 Y91.896 E.02816
G1 X47.764 Y108.367 E.74904
G1 X47.764 Y109.091 E.02328
G1 X64.236 Y125.562 E.74904
G1 X64.236 Y126.438 E.02816
G1 X47.764 Y142.909 E.74904
G1 X47.764 Y143.633 E.02328
G1 X64.236 Y160.104 E.74904
G1 X64.236 Y160.98 E.02816
G1 X47.764 Y177.451 E.74904
G1 X47.764 Y178.175 E.02328
G1 X78.825 Y209.236 E1.41252
G1 X79.306 Y209.236 E.01546
G1 X95.777 Y192.764 E.74904
G1 X96.896 Y192.764 E.03597
G1 X113.367 Y209.236 E.74904
G1 X113.848 Y209.236 E.01546
G1 X130.319 Y192.764 E.74904
G1 X131.438 Y192.764 E.03597
G1 X147.909 Y209.236 E.74904
G1 X148.39 Y209.236 E.01547
G1 X164.861 Y192.764 E.74904
G1 X165.98 Y192.764 E.03597
G1 X182.451 Y209.236 E.74904
G1 X182.932 Y209.236 E.01547
G1 X208.236 Y183.932 E1.15072
G1 X208.236 Y183.208 E.02328
G1 X191.764 Y166.737 E.74904
G1 X191.764 Y165.861 E.02816
G1 X208.236 Y149.39 E.74904
G1 X208.236 Y148.666 E.02328
G1 X191.764 Y132.195 E.74904
G1 X191.764 Y131.319 E.02816
G1 X196.486 Y126.597 E.21474
G2 X199.34 Y129.501 I3.516 J-.602 E.13931
G1 X191.764 Y137.076 E.3445
G1 X191.764 Y137.952 E.02816
G1 X208.236 Y154.423 E.74904
G1 X208.236 Y155.147 E.02328
G1 X191.764 Y171.618 E.74904
G1 X191.764 Y172.494 E.02816
G1 X208.236 Y188.965 E.74904
G1 X208.236 Y189.689 E.02328
G1 X200.457 Y197.467 E.35374
G2 X199.482 Y197.481 I-.423 J4.416 E.03144
G1 X191.764 Y189.764 E.35094
G1 X191.764 Y188.889 E.02816
G1 X208.236 Y172.418 E.74904
G1 X208.236 Y171.694 E.02328
G1 X191.764 Y155.223 E.74904
G1 X191.764 Y154.347 E.02816
G1 X208.236 Y137.876 E.74904
G1 X208.236 Y137.152 E.02328
G1 X200.599 Y129.515 E.34729
G2 X202.085 Y128.888 I-.881 J-4.164 E.0522
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X201.303 Y129.32 E-.33961
G1 X200.599 Y129.515 E-.27777
G1 X200.864 Y129.78 E-.14262
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/58
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
G1 X128.973 Y197.936
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X129.175 Y198.004 E.00687
G3 X127.736 Y197.797 I-1.167 J2.996 E.60242
G3 X128.871 Y197.904 I.262 J3.277 E.03686
G1 X128.916 Y197.918 E.0015
G1 X128.526 Y198.241 F30000
G1 F8843.478
G1 X128.761 Y198.295 E.00777
G3 X127.766 Y198.203 I-.752 J2.706 E.53519
G3 X128.467 Y198.229 I.25 J2.725 E.02261
G1 X128.08 Y198.605 F30000
G1 F8843.478
G1 X128.179 Y198.616 E.00317
G3 X128.651 Y198.687 I-.252 J3.271 E.01537
G3 X127.797 Y198.609 I-.643 J2.314 E.45747
G1 X128.02 Y198.606 E.00719
G1 X127.816 Y199.001 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X127.826 Y199 E.00029
G3 X128.349 Y199.02 I.177 J2.148 E.01563
G3 X127.553 Y199.044 I-.34 J1.98 E.35205
G1 X127.757 Y199.011 E.00614
; WIPE_START
M204 S10000
G1 X127.826 Y199 E-.02655
G1 X128.15 Y198.995 E-.12317
G1 X128.349 Y199.02 E-.07618
G1 X128.734 Y199.129 E-.15213
G1 X128.917 Y199.211 E-.07615
G1 X129.253 Y199.428 E-.15213
G1 X129.54 Y199.708 E-.15211
G1 X129.542 Y199.711 E-.00159
; WIPE_END
G1 E-.04 F1800
G1 X137.173 Y199.537 Z1.6 F30000
G1 X198.536 Y198.139 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X198.679 Y198.073 E.00508
G3 X199.736 Y197.797 I1.329 J2.927 E.03529
G3 X201.176 Y198.005 I.262 J3.277 E.04717
G3 X198.395 Y198.22 I-1.167 J2.996 E.55682
G1 X198.484 Y198.169 E.0033
G1 X199.022 Y198.368 F30000
G1 F8843.478
G1 X199.107 Y198.341 E.00285
G3 X199.766 Y198.203 I.903 J2.66 E.02172
G3 X200.761 Y198.295 I.25 J2.727 E.03231
G3 X198.847 Y198.444 I-.752 J2.706 E.50447
G1 X198.967 Y198.392 E.00422
G1 X199.511 Y198.651 F30000
G1 F8843.478
G1 X199.797 Y198.609 E.00928
G3 X200.651 Y198.687 I.13 J3.28 E.02766
G3 X199.453 Y198.664 I-.643 J2.314 E.44626
G1 X199.817 Y199.001 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X199.826 Y199 E.00028
G3 X200.349 Y199.02 I.177 J2.148 E.01563
G3 X199.553 Y199.044 I-.34 J1.98 E.35205
G1 X199.758 Y199.011 E.00616
; WIPE_START
M204 S10000
G1 X199.826 Y199 E-.02631
G1 X200.15 Y198.995 E-.12317
G1 X200.349 Y199.02 E-.07617
G1 X200.544 Y199.065 E-.07615
G1 X200.917 Y199.211 E-.15212
G1 X201.253 Y199.428 E-.15211
G1 X201.54 Y199.708 E-.15213
G1 X201.543 Y199.712 E-.00183
; WIPE_END
G1 E-.04 F1800
G1 X201.486 Y192.08 Z1.6 F30000
G1 X200.973 Y122.937 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X201.176 Y123.004 E.00686
G3 X199.736 Y122.797 I-1.167 J2.996 E.60241
G3 X200.871 Y122.904 I.262 J3.278 E.03685
G1 X200.916 Y122.919 E.00153
G1 X200.526 Y123.241 F30000
G1 F8843.478
G1 X200.761 Y123.295 E.00775
G3 X199.766 Y123.203 I-.752 J2.706 E.5352
G3 X200.467 Y123.229 I.25 J2.728 E.02262
G1 X200.081 Y123.605 F30000
G1 F8843.478
G1 X200.179 Y123.616 E.00316
G3 X200.651 Y123.687 I-.252 J3.275 E.01537
G3 X199.797 Y123.609 I-.643 J2.314 E.45747
G1 X200.021 Y123.606 E.00721
G1 X199.823 Y124 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X199.826 Y124 E.00009
G3 X200.349 Y124.02 I.177 J2.148 E.01563
G3 X199.553 Y124.044 I-.34 J1.98 E.35205
G1 X199.764 Y124.01 E.00635
; WIPE_START
M204 S10000
G1 X199.826 Y124 E-.02395
G1 X200.15 Y123.995 E-.12317
G1 X200.349 Y124.02 E-.07617
G1 X200.734 Y124.129 E-.15213
G1 X201.091 Y124.311 E-.15208
G1 X201.404 Y124.561 E-.15216
G1 X201.54 Y124.723 E-.08034
; WIPE_END
G1 E-.04 F1800
G1 X201.24 Y117.096 Z1.6 F30000
G1 X198.535 Y48.139 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X198.679 Y48.073 E.0051
G3 X199.736 Y47.797 I1.329 J2.927 E.03529
G3 X201.176 Y48.004 I.262 J3.278 E.04717
G3 X198.395 Y48.22 I-1.167 J2.996 E.55683
G1 X198.483 Y48.169 E.00327
G1 X199.022 Y48.369 F30000
G1 F8843.478
G1 X199.107 Y48.341 E.00287
G3 X199.766 Y48.203 I.903 J2.66 E.02173
G3 X200.761 Y48.295 I.25 J2.727 E.03231
G3 X198.847 Y48.444 I-.752 J2.706 E.50448
G1 X198.967 Y48.392 E.0042
G1 X199.511 Y48.651 F30000
G1 F8843.478
G1 X199.797 Y48.609 E.0093
G3 X200.651 Y48.687 I.13 J3.281 E.02765
G3 X199.452 Y48.665 I-.643 J2.314 E.44624
G1 X199.823 Y49 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X199.826 Y49 E.00009
G3 X200.349 Y49.02 I.177 J2.148 E.01563
G3 X199.553 Y49.044 I-.34 J1.98 E.35205
G1 X199.764 Y49.01 E.00635
; WIPE_START
M204 S10000
G1 X199.826 Y49 E-.02393
G1 X200.15 Y48.995 E-.12317
G1 X200.349 Y49.02 E-.07617
G1 X200.544 Y49.065 E-.07615
G1 X200.917 Y49.211 E-.15212
G1 X201.253 Y49.428 E-.1521
G1 X201.54 Y49.708 E-.15213
G1 X201.546 Y49.717 E-.00423
; WIPE_END
G1 E-.04 F1800
G1 X193.916 Y49.53 Z1.6 F30000
G1 X128.973 Y47.936 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X129.176 Y48.004 E.00686
G3 X127.736 Y47.797 I-1.167 J2.996 E.60242
G3 X128.871 Y47.904 I.262 J3.278 E.03685
G1 X128.916 Y47.919 E.00152
G1 X128.526 Y48.241 F30000
G1 F8843.478
G1 X128.761 Y48.295 E.00775
G3 X127.766 Y48.203 I-.752 J2.706 E.5352
G3 X128.467 Y48.229 I.25 J2.727 E.02262
G1 X128.081 Y48.605 F30000
G1 F8843.478
G1 X128.179 Y48.616 E.00316
G3 X128.651 Y48.687 I-.252 J3.274 E.01537
G3 X127.797 Y48.609 I-.643 J2.314 E.45747
G1 X128.021 Y48.606 E.00721
G1 X127.823 Y49 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X127.826 Y49 E.00009
G3 X128.349 Y49.02 I.177 J2.148 E.01563
G3 X127.553 Y49.044 I-.34 J1.98 E.35205
G1 X127.764 Y49.01 E.00635
; WIPE_START
M204 S10000
G1 X127.826 Y49 E-.02394
G1 X128.15 Y48.995 E-.12316
G1 X128.349 Y49.02 E-.07618
G1 X128.544 Y49.065 E-.07614
G1 X128.917 Y49.211 E-.15213
G1 X129.253 Y49.428 E-.15212
G1 X129.54 Y49.708 E-.1521
G1 X129.546 Y49.717 E-.00422
; WIPE_END
G1 E-.04 F1800
G1 X121.915 Y49.556 Z1.6 F30000
G1 X54.536 Y48.139 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X54.679 Y48.073 E.00508
G3 X55.736 Y47.797 I1.33 J2.927 E.03529
G3 X57.176 Y48.004 I.262 J3.278 E.04717
G3 X54.395 Y48.22 I-1.167 J2.996 E.55683
G1 X54.484 Y48.169 E.00329
G1 X55.022 Y48.368 F30000
G1 F8843.478
G1 X55.107 Y48.341 E.00285
G3 X55.766 Y48.203 I.903 J2.66 E.02173
G3 X56.761 Y48.295 I.25 J2.727 E.03231
G3 X54.847 Y48.444 I-.752 J2.706 E.50447
G1 X54.967 Y48.392 E.00422
G1 X55.511 Y48.651 F30000
G1 F8843.478
G1 X55.797 Y48.609 E.00928
G3 X56.651 Y48.687 I.13 J3.281 E.02766
G3 X55.453 Y48.664 I-.643 J2.314 E.44626
G1 X55.823 Y49 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X55.826 Y49 E.00009
G3 X56.349 Y49.02 I.177 J2.148 E.01563
G3 X55.554 Y49.044 I-.34 J1.98 E.35205
G1 X55.764 Y49.01 E.00635
; WIPE_START
M204 S10000
G1 X55.826 Y49 E-.02394
G1 X56.15 Y48.995 E-.12317
G1 X56.349 Y49.02 E-.07617
G1 X56.544 Y49.065 E-.07614
G1 X56.917 Y49.211 E-.15213
G1 X57.253 Y49.428 E-.15213
G1 X57.54 Y49.708 E-.1521
G1 X57.546 Y49.717 E-.00421
; WIPE_END
G1 E-.04 F1800
G1 X62.768 Y55.283 Z1.6 F30000
G1 X191.416 Y192.416 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X64.584 Y192.416 E4.07847
G1 X64.584 Y59.584 E4.27141
G1 X191.416 Y59.584 E4.07847
G1 X191.416 Y192.356 E4.26948
G1 X191.009 Y192.009 F30000
G1 F8843.478
G1 X64.991 Y192.009 E4.05229
G1 X64.991 Y59.991 E4.24523
G1 X191.009 Y59.991 E4.05229
G1 X191.009 Y191.949 E4.2433
G1 X190.602 Y191.602 F30000
G1 F8843.478
G1 X65.398 Y191.602 E4.02611
G1 X65.398 Y60.398 E4.21905
G1 X190.602 Y60.398 E4.02611
G1 X190.602 Y191.542 E4.21712
G1 X190.21 Y191.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X65.79 Y191.21 E3.70605
G1 X65.79 Y60.79 E3.88477
G1 X190.21 Y60.79 E3.70605
G1 X190.21 Y191.15 E3.88298
; WIPE_START
M204 S10000
G1 X188.21 Y191.151 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X181.345 Y187.816 Z1.6 F30000
G1 X58.43 Y128.106 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X58.249 Y128.306 E.00866
G3 X55.736 Y122.797 I-2.241 J-2.306 E.39573
G3 X57.176 Y123.004 I.262 J3.278 E.04717
G3 X58.473 Y128.065 I-1.167 J2.996 E.19609
G1 X58.174 Y127.779 F30000
G1 F8843.478
G1 X58.158 Y127.811 E.00113
G3 X55.766 Y123.203 I-2.148 J-1.81 E.35456
G3 X56.761 Y123.295 I.25 J2.728 E.0323
G3 X58.328 Y127.587 I-.752 J2.706 E.1716
G1 X58.211 Y127.732 E.00599
G1 X57.816 Y127.568 F30000
G1 F8843.478
G1 X57.501 Y127.882 E.01431
G3 X55.797 Y123.609 I-1.493 J-1.881 E.2876
G3 X56.651 Y123.687 I.13 J3.282 E.02765
G3 X57.861 Y127.529 I-.643 J2.314 E.15363
G1 X57.593 Y127.214 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X57.544 Y127.295 E.00282
G3 X55.826 Y124 I-1.535 J-1.296 E.23454
G3 X56.349 Y124.02 I.177 J2.148 E.01563
G3 X57.771 Y126.964 I-.34 J1.98 E.11377
G1 X57.628 Y127.165 E.00735
; WIPE_START
M204 S10000
G1 X57.544 Y127.295 E-.05879
G1 X57.253 Y127.572 E-.15233
G1 X56.917 Y127.789 E-.15211
G1 X56.734 Y127.871 E-.07614
G1 X56.349 Y127.98 E-.15213
G1 X55.95 Y128.01 E-.15211
G1 X55.907 Y128.004 E-.01638
; WIPE_END
G1 E-.04 F1800
G1 X56.023 Y135.636 Z1.6 F30000
G1 X56.973 Y197.936 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X57.176 Y198.004 E.00688
G3 X55.736 Y197.797 I-1.167 J2.996 E.60241
G3 X56.871 Y197.904 I.262 J3.277 E.03686
M73 P41 R39
G1 X56.916 Y197.918 E.0015
G1 X56.526 Y198.241 F30000
G1 F8843.478
G1 X56.761 Y198.295 E.00776
G3 X55.766 Y198.203 I-.752 J2.706 E.53519
G3 X56.467 Y198.229 I.25 J2.725 E.02262
G1 X56.081 Y198.605 F30000
G1 F8843.478
G1 X56.179 Y198.616 E.00317
G3 X56.651 Y198.687 I-.252 J3.271 E.01537
G3 X55.797 Y198.609 I-.643 J2.314 E.45747
G1 X56.021 Y198.606 E.0072
G1 X55.816 Y199.001 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X55.826 Y199 E.00029
G3 X56.349 Y199.02 I.177 J2.148 E.01563
G3 X55.553 Y199.044 I-.34 J1.98 E.35205
G1 X55.757 Y199.011 E.00614
; WIPE_START
M204 S10000
G1 X55.826 Y199 E-.02655
G1 X56.15 Y198.995 E-.12317
G1 X56.349 Y199.02 E-.07618
G1 X56.734 Y199.129 E-.15213
G1 X56.917 Y199.211 E-.07614
G1 X57.253 Y199.428 E-.15213
G1 X57.54 Y199.708 E-.15211
G1 X57.542 Y199.711 E-.00159
; WIPE_END
G1 E-.04 F1800
G1 X65.159 Y200.209 Z1.6 F30000
G1 X208.584 Y209.584 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X47.416 Y209.584 E5.18256
G1 X47.416 Y42.416 E5.3755
G1 X208.584 Y42.416 E5.18256
G1 X208.584 Y209.524 E5.37357
G1 X208.991 Y209.991 F30000
G1 F8843.478
G1 X47.009 Y209.991 E5.20874
G1 X47.009 Y42.009 E5.40168
G1 X208.991 Y42.009 E5.20874
G1 X208.991 Y209.931 E5.39975
G1 X209.398 Y210.398 F30000
G1 F8843.478
G1 X46.602 Y210.398 E5.23492
G1 X46.602 Y41.602 E5.42786
G1 X209.398 Y41.602 E5.23492
G1 X209.398 Y210.338 E5.42593
G1 X209.79 Y210.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X46.21 Y210.79 E4.87249
G1 X46.21 Y41.21 E5.05121
G1 X209.79 Y41.21 E4.87249
G1 X209.79 Y210.73 E5.04942
; WIPE_START
M204 S10000
G1 X207.79 Y210.731 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X201.52 Y206.379 Z1.6 F30000
G1 X197.755 Y203.766 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G2 X199.204 Y204.477 I2.289 J-2.835 E.05233
G1 X194.446 Y209.236 E.21641
G1 X193.965 Y209.236 E.01547
G1 X177.494 Y192.764 E.74904
G1 X176.375 Y192.764 E.03597
G1 X159.904 Y209.236 E.74904
G1 X159.423 Y209.236 E.01547
G1 X142.952 Y192.764 E.74904
G1 X141.833 Y192.764 E.03597
G1 X125.362 Y209.236 E.74904
G1 X124.881 Y209.236 E.01547
G1 X108.41 Y192.764 E.74904
G1 X107.291 Y192.764 E.03597
G1 X90.82 Y209.236 E.74904
G1 X90.339 Y209.236 E.01546
G1 X73.868 Y192.764 E.74904
G1 X72.749 Y192.764 E.03597
G1 X56.278 Y209.236 E.74904
G1 X55.797 Y209.236 E.01546
G1 X47.764 Y201.203 E.36531
G1 X47.764 Y200.479 E.02328
G1 X64.236 Y184.007 E.74904
G1 X64.236 Y183.132 E.02816
G1 X47.764 Y166.661 E.74904
G1 X47.764 Y165.937 E.02328
M73 P42 R39
G1 X64.236 Y149.466 E.74904
G1 X64.236 Y148.59 E.02816
G1 X47.764 Y132.119 E.74904
G1 X47.764 Y131.395 E.02328
G1 X52.499 Y126.66 E.21532
G3 X52.499 Y125.34 I3.518 J-.66 E.04271
G1 X47.764 Y120.605 E.21532
G1 X47.764 Y119.881 E.02328
G1 X64.236 Y103.41 E.74904
G1 X64.236 Y102.534 E.02816
G1 X47.764 Y86.063 E.74904
G1 X47.764 Y85.339 E.02328
G1 X64.236 Y68.868 E.74904
G1 X64.236 Y67.993 E.02816
G1 X47.764 Y51.521 E.74904
G1 X47.764 Y50.797 E.02328
G1 X55.797 Y42.764 E.36531
G1 X56.278 Y42.764 E.01547
G1 X72.749 Y59.236 E.74904
G1 X73.868 Y59.236 E.03597
G1 X90.339 Y42.764 E.74904
G1 X90.82 Y42.764 E.01547
G1 X107.291 Y59.236 E.74904
G1 X108.41 Y59.236 E.03597
G1 X124.881 Y42.764 E.74904
G1 X125.362 Y42.764 E.01546
G1 X141.833 Y59.236 E.74904
G1 X142.952 Y59.236 E.03597
G1 X159.423 Y42.764 E.74904
G1 X159.904 Y42.764 E.01546
G1 X176.375 Y59.236 E.74904
G1 X177.494 Y59.236 E.03597
G1 X193.965 Y42.764 E.74904
G1 X194.446 Y42.764 E.01546
G1 X199.204 Y47.523 E.21641
G3 X200.73 Y47.513 I.79 J3.984 E.04936
G1 X205.479 Y42.764 E.21594
G1 X205.96 Y42.764 E.01546
G1 X208.236 Y45.04 E.10351
G1 X208.236 Y45.764 E.02328
G1 X203.524 Y50.476 E.21428
G3 X203.474 Y51.793 I-3.559 J.525 E.0426
G1 X208.236 Y56.554 E.21654
G1 X208.236 Y57.278 E.02328
G1 X191.764 Y73.749 E.74904
G1 X191.764 Y74.625 E.02816
G1 X208.236 Y91.096 E.74904
G1 X208.236 Y91.82 E.02328
G1 X191.764 Y108.291 E.74904
G1 X191.764 Y109.167 E.02816
G1 X208.236 Y125.638 E.74904
G1 X208.236 Y126.362 E.02328
G1 X191.764 Y142.833 E.74904
G1 X191.764 Y143.709 E.02816
G1 X208.236 Y160.18 E.74904
G1 X208.236 Y160.904 E.02328
G1 X191.764 Y177.375 E.74904
G1 X191.764 Y178.251 E.02816
G1 X208.236 Y194.722 E.74904
G1 X208.236 Y195.446 E.02328
G1 X203.474 Y200.207 E.21654
G3 X203.524 Y201.524 I-3.509 J.791 E.0426
G1 X208.236 Y206.236 E.21428
G1 X208.236 Y206.959 E.02328
G1 X205.96 Y209.236 E.10351
G1 X205.479 Y209.236 E.01547
G1 X200.73 Y204.487 E.21594
G2 X202.195 Y203.809 I-.753 J-3.548 E.05233
; WIPE_START
G1 X201.627 Y204.174 E-.25629
G1 X200.73 Y204.487 E-.36105
G1 X200.996 Y204.753 E-.14266
; WIPE_END
G1 E-.04 F1800
G1 X201.105 Y197.121 Z1.6 F30000
G1 X202.085 Y128.888 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F8843.478
G3 X200.599 Y129.515 I-2.367 J-3.536 E.0522
G1 X208.236 Y137.152 E.34729
G1 X208.236 Y137.876 E.02328
G1 X191.764 Y154.347 E.74904
G1 X191.764 Y155.223 E.02816
G1 X208.236 Y171.694 E.74904
G1 X208.236 Y172.418 E.02328
G1 X191.764 Y188.889 E.74904
G1 X191.764 Y189.764 E.02816
G1 X199.482 Y197.482 E.35096
G3 X200.457 Y197.467 I.55 J4.125 E.03143
G1 X208.236 Y189.689 E.35374
G1 X208.236 Y188.965 E.02328
G1 X191.764 Y172.494 E.74904
G1 X191.764 Y171.618 E.02816
G1 X208.236 Y155.147 E.74904
G1 X208.236 Y154.423 E.02328
G1 X191.764 Y137.952 E.74904
G1 X191.764 Y137.076 E.02816
G1 X199.34 Y129.501 E.3445
G3 X196.486 Y126.597 I.663 J-3.505 E.13931
G1 X191.764 Y131.319 E.21474
G1 X191.764 Y132.195 E.02816
G1 X208.236 Y148.666 E.74904
G1 X208.236 Y149.39 E.02328
G1 X191.764 Y165.861 E.74904
G1 X191.764 Y166.737 E.02816
G1 X208.236 Y183.208 E.74904
G1 X208.236 Y183.932 E.02328
G1 X182.932 Y209.236 E1.15072
G1 X182.451 Y209.236 E.01547
G1 X165.98 Y192.764 E.74904
G1 X164.861 Y192.764 E.03597
G1 X148.39 Y209.236 E.74904
G1 X147.909 Y209.236 E.01547
G1 X131.438 Y192.764 E.74904
G1 X130.319 Y192.764 E.03597
G1 X113.848 Y209.236 E.74904
G1 X113.367 Y209.236 E.01546
G1 X96.896 Y192.764 E.74904
G1 X95.777 Y192.764 E.03597
G1 X79.306 Y209.236 E.74904
G1 X78.825 Y209.236 E.01546
G1 X47.764 Y178.175 E1.41252
G1 X47.764 Y177.451 E.02328
G1 X64.236 Y160.98 E.74904
G1 X64.236 Y160.104 E.02816
G1 X47.764 Y143.633 E.74904
G1 X47.764 Y142.909 E.02328
G1 X64.236 Y126.438 E.74904
G1 X64.236 Y125.562 E.02816
G1 X47.764 Y109.091 E.74904
G1 X47.764 Y108.367 E.02328
G1 X64.236 Y91.896 E.74904
G1 X64.236 Y91.02 E.02816
G1 X47.764 Y74.549 E.74904
G1 X47.764 Y73.825 E.02328
G1 X78.825 Y42.764 E1.41252
G1 X79.306 Y42.764 E.01547
G1 X95.777 Y59.236 E.74904
G1 X96.896 Y59.236 E.03597
G1 X113.367 Y42.764 E.74904
G1 X113.848 Y42.764 E.01546
G1 X130.319 Y59.236 E.74904
G1 X131.438 Y59.236 E.03597
G1 X147.909 Y42.764 E.74904
G1 X148.39 Y42.764 E.01547
G1 X164.861 Y59.236 E.74904
G1 X165.98 Y59.236 E.03597
G1 X182.451 Y42.764 E.74904
G1 X182.932 Y42.764 E.01546
G1 X208.236 Y68.068 E1.15072
G1 X208.236 Y68.792 E.02328
G1 X191.764 Y85.263 E.74904
G1 X191.764 Y86.139 E.02816
G1 X208.236 Y102.61 E.74904
G1 X208.236 Y103.334 E.02328
G1 X191.764 Y119.805 E.74904
G1 X191.764 Y120.681 E.02816
G1 X196.486 Y125.403 E.21474
G3 X199.343 Y122.502 I3.507 J.597 E.13937
G1 X191.764 Y114.924 E.34463
G1 X191.764 Y114.048 E.02816
G1 X208.236 Y97.577 E.74904
G1 X208.236 Y96.853 E.02328
G1 X191.764 Y80.382 E.74904
G1 X191.764 Y79.506 E.02816
G1 X208.236 Y63.035 E.74904
G1 X208.236 Y62.311 E.02328
G1 X200.457 Y54.533 E.35374
G3 X199.475 Y54.525 I-.44 J-6.083 E.0316
G1 X191.764 Y62.236 E.35066
G1 X191.764 Y63.111 E.02816
G1 X208.236 Y79.582 E.74904
G1 X208.236 Y80.306 E.02328
G1 X191.764 Y96.777 E.74904
G1 X191.764 Y97.653 E.02816
G1 X208.236 Y114.124 E.74904
G1 X208.236 Y114.848 E.02328
G1 X200.599 Y122.485 E.34729
G3 X202.085 Y123.112 I-.88 J4.164 E.0522
; WIPE_START
G1 X201.303 Y122.68 E-.33962
G1 X200.599 Y122.485 E-.27776
G1 X200.864 Y122.22 E-.14262
; WIPE_END
G1 E-.04 F1800
G1 X195.575 Y116.717 Z1.6 F30000
G1 X131.41 Y49.956 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F8843.478
G2 X130.597 Y48.562 I-4.04 J1.421 E.05221
G1 X136.395 Y42.764 E.26365
G1 X136.876 Y42.764 E.01546
G1 X153.347 Y59.236 E.74904
G1 X154.466 Y59.236 E.03597
G1 X170.937 Y42.764 E.74904
G1 X171.418 Y42.764 E.01546
G1 X187.889 Y59.236 E.74904
G1 X189.008 Y59.236 E.03597
G1 X196.513 Y51.73 E.34133
G3 X196.466 Y50.542 I4.885 J-.79 E.03833
G1 X188.689 Y42.764 E.35368
G1 X188.208 Y42.764 E.01546
G1 X171.737 Y59.236 E.74904
G1 X170.618 Y59.236 E.03597
G1 X154.147 Y42.764 E.74904
G1 X153.666 Y42.764 E.01546
G1 X137.195 Y59.236 E.74904
G1 X136.076 Y59.236 E.03597
G1 X130.439 Y53.599 E.25635
G3 X125.562 Y53.598 I-2.438 J-2.653 E.17228
G1 X119.924 Y59.236 E.25638
G1 X118.805 Y59.236 E.03597
G1 X102.334 Y42.764 E.74904
G1 X101.853 Y42.764 E.01546
G1 X85.382 Y59.236 E.74904
G1 X84.263 Y59.236 E.03597
G1 X67.792 Y42.764 E.74904
G1 X67.311 Y42.764 E.01547
G1 X59.533 Y50.542 E.35371
G3 X59.489 Y51.732 I-3.688 J.459 E.03846
G1 X66.992 Y59.236 E.34121
G1 X68.111 Y59.236 E.03597
G1 X84.582 Y42.764 E.74904
G1 X85.063 Y42.764 E.01547
G1 X101.534 Y59.236 E.74904
G1 X102.653 Y59.236 E.03597
G1 X119.124 Y42.764 E.74904
G1 X119.605 Y42.764 E.01546
G1 X125.4 Y48.56 E.26354
G3 X126.744 Y47.666 I2.633 J2.503 E.05233
; WIPE_START
G1 X125.918 Y48.104 E-.35528
G1 X125.4 Y48.56 E-.2621
G1 X125.135 Y48.294 E-.14263
; WIPE_END
G1 E-.04 F1800
G1 X119.872 Y53.822 Z1.6 F30000
G1 X53.917 Y123.105 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F8843.478
G1 X53.918 Y123.104 E.00004
G3 X55.409 Y122.493 I2.049 J2.873 E.05228
G1 X47.764 Y114.848 E.34764
G1 X47.764 Y114.124 E.02328
G1 X64.236 Y97.653 E.74904
G1 X64.236 Y96.777 E.02816
G1 X47.764 Y80.306 E.74904
G1 X47.764 Y79.582 E.02328
G1 X64.236 Y63.111 E.74904
G1 X64.236 Y62.236 E.02816
G1 X56.524 Y54.524 E.35067
G3 X55.54 Y54.536 I-.575 J-7.018 E.03169
G1 X47.764 Y62.311 E.35359
G1 X47.764 Y63.035 E.02328
G1 X64.236 Y79.506 E.74904
G1 X64.236 Y80.382 E.02816
G1 X47.764 Y96.853 E.74904
G1 X47.764 Y97.577 E.02328
G1 X64.236 Y114.048 E.74904
G1 X64.236 Y114.924 E.02816
G1 X56.662 Y122.497 E.34441
G3 X59.513 Y125.404 I-.669 J3.507 E.13929
G1 X64.236 Y120.681 E.21478
G1 X64.236 Y119.805 E.02816
G1 X47.764 Y103.334 E.74904
G1 X47.764 Y102.61 E.02328
G1 X64.236 Y86.139 E.74904
G1 X64.236 Y85.263 E.02816
G1 X47.764 Y68.792 E.74904
G1 X47.764 Y68.068 E.02328
G1 X73.068 Y42.764 E1.15072
G1 X73.549 Y42.764 E.01547
G1 X90.02 Y59.236 E.74904
G1 X91.139 Y59.236 E.03597
G1 X107.61 Y42.764 E.74904
G1 X108.091 Y42.764 E.01547
G1 X124.562 Y59.236 E.74904
G1 X125.681 Y59.236 E.03597
G1 X142.152 Y42.764 E.74904
G1 X142.633 Y42.764 E.01546
G1 X159.104 Y59.236 E.74904
G1 X160.223 Y59.236 E.03597
G1 X176.694 Y42.764 E.74904
G1 X177.175 Y42.764 E.01546
G1 X208.236 Y73.825 E1.41252
G1 X208.236 Y74.549 E.02328
G1 X191.764 Y91.02 E.74904
G1 X191.764 Y91.896 E.02816
G1 X208.236 Y108.367 E.74904
G1 X208.236 Y109.091 E.02328
G1 X191.764 Y125.562 E.74904
G1 X191.764 Y126.438 E.02816
G1 X208.236 Y142.909 E.74904
G1 X208.236 Y143.633 E.02328
G1 X191.764 Y160.104 E.74904
G1 X191.764 Y160.98 E.02816
G1 X208.236 Y177.451 E.74904
G1 X208.236 Y178.175 E.02328
G1 X177.175 Y209.236 E1.41252
G1 X176.694 Y209.236 E.01547
G1 X160.223 Y192.764 E.74904
G1 X159.104 Y192.764 E.03597
G1 X142.633 Y209.236 E.74904
G1 X142.152 Y209.236 E.01546
G1 X125.681 Y192.764 E.74904
G1 X124.562 Y192.764 E.03597
G1 X108.091 Y209.236 E.74904
G1 X107.61 Y209.236 E.01547
G1 X91.139 Y192.764 E.74904
G1 X90.02 Y192.764 E.03597
G1 X73.549 Y209.236 E.74904
G1 X73.068 Y209.236 E.01546
G1 X47.764 Y183.932 E1.15072
G1 X47.764 Y183.208 E.02328
G1 X64.236 Y166.737 E.74904
G1 X64.236 Y165.861 E.02816
G1 X47.764 Y149.39 E.74904
G1 X47.764 Y148.666 E.02328
G1 X64.236 Y132.195 E.74904
G1 X64.236 Y131.319 E.02816
G1 X59.513 Y126.596 E.21478
G3 X56.662 Y129.503 I-3.52 J-.601 E.13929
G1 X64.236 Y137.076 E.34441
G1 X64.236 Y137.952 E.02816
G1 X47.764 Y154.423 E.74904
G1 X47.764 Y155.147 E.02328
G1 X64.236 Y171.618 E.74904
G1 X64.236 Y172.494 E.02816
G1 X47.764 Y188.965 E.74904
G1 X47.764 Y189.689 E.02328
G1 X55.548 Y197.472 E.35397
G3 X56.524 Y197.476 I.474 J4.184 E.03146
G1 X64.236 Y189.764 E.35067
G1 X64.236 Y188.889 E.02816
G1 X47.764 Y172.418 E.74904
G1 X47.764 Y171.694 E.02328
G1 X64.236 Y155.223 E.74904
G1 X64.236 Y154.347 E.02816
G1 X47.764 Y137.876 E.74904
G1 X47.764 Y137.152 E.02328
G1 X55.404 Y129.512 E.34743
G3 X53.914 Y128.893 I.87 J-4.196 E.05221
; WIPE_START
G1 X54.533 Y129.251 E-.27178
G1 X55.404 Y129.512 E-.34563
G1 X55.139 Y129.777 E-.14259
; WIPE_END
G1 E-.04 F1800
G1 X55.002 Y137.409 Z1.6 F30000
G1 X53.806 Y203.807 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F8843.478
G2 X55.269 Y204.488 I2.473 J-3.397 E.0522
G1 X50.521 Y209.236 E.21589
G1 X50.04 Y209.236 E.01546
G1 X47.764 Y206.96 E.1035
G1 X47.764 Y206.235 E.02328
G1 X52.473 Y201.527 E.21411
G3 X52.526 Y200.207 I4.76 J-.469 E.04262
G1 X47.764 Y195.446 E.21654
G1 X47.764 Y194.722 E.02328
G1 X64.236 Y178.251 E.74904
G1 X64.236 Y177.375 E.02816
G1 X47.764 Y160.904 E.74904
G1 X47.764 Y160.18 E.02328
G1 X64.236 Y143.709 E.74904
G1 X64.236 Y142.833 E.02816
G1 X47.764 Y126.362 E.74904
G1 X47.764 Y125.638 E.02328
G1 X64.236 Y109.167 E.74904
G1 X64.236 Y108.291 E.02816
G1 X47.764 Y91.82 E.74904
M73 P43 R39
G1 X47.764 Y91.096 E.02328
G1 X64.236 Y74.625 E.74904
G1 X64.236 Y73.749 E.02816
G1 X47.764 Y57.278 E.74904
G1 X47.764 Y56.554 E.02328
G1 X52.526 Y51.793 E.21654
G3 X52.473 Y50.473 I4.707 J-.851 E.04262
G1 X47.764 Y45.764 E.21411
G1 X47.764 Y45.04 E.02328
G1 X50.04 Y42.764 E.1035
G1 X50.521 Y42.764 E.01547
G1 X55.27 Y47.513 E.21594
G3 X56.792 Y47.527 I.712 J5.286 E.04912
G1 X61.554 Y42.764 E.21658
G1 X62.035 Y42.764 E.01547
G1 X78.506 Y59.236 E.74904
G1 X79.625 Y59.236 E.03597
G1 X96.096 Y42.764 E.74904
G1 X96.577 Y42.764 E.01547
G1 X113.048 Y59.236 E.74904
G1 X114.167 Y59.236 E.03597
G1 X130.638 Y42.764 E.74904
G1 X131.119 Y42.764 E.01547
G1 X147.59 Y59.236 E.74904
G1 X148.709 Y59.236 E.03597
G1 X165.18 Y42.764 E.74904
G1 X165.661 Y42.764 E.01546
G1 X182.132 Y59.236 E.74904
G1 X183.251 Y59.236 E.03597
G1 X199.722 Y42.764 E.74904
G1 X200.203 Y42.764 E.01546
G1 X208.236 Y50.797 E.36531
G1 X208.236 Y51.521 E.02328
G1 X191.764 Y67.993 E.74904
G1 X191.764 Y68.868 E.02816
G1 X208.236 Y85.339 E.74904
G1 X208.236 Y86.063 E.02328
G1 X191.764 Y102.534 E.74904
G1 X191.764 Y103.41 E.02816
G1 X208.236 Y119.881 E.74904
G1 X208.236 Y120.605 E.02328
G1 X203.503 Y125.338 E.21523
G3 X203.503 Y126.662 I-4.716 J.662 E.04272
G1 X208.236 Y131.395 E.21523
G1 X208.236 Y132.119 E.02328
G1 X191.764 Y148.59 E.74904
G1 X191.764 Y149.466 E.02816
G1 X208.236 Y165.937 E.74904
G1 X208.236 Y166.661 E.02328
G1 X191.764 Y183.132 E.74904
G1 X191.764 Y184.008 E.02816
G1 X208.236 Y200.479 E.74904
G1 X208.236 Y201.203 E.02328
G1 X200.203 Y209.236 E.36531
G1 X199.722 Y209.236 E.01547
G1 X183.251 Y192.764 E.74904
G1 X182.132 Y192.764 E.03597
G1 X165.661 Y209.236 E.74904
G1 X165.18 Y209.236 E.01547
G1 X148.709 Y192.764 E.74904
G1 X147.59 Y192.764 E.03597
G1 X131.119 Y209.236 E.74904
G1 X130.638 Y209.236 E.01546
G1 X114.167 Y192.764 E.74904
G1 X113.048 Y192.764 E.03597
G1 X96.577 Y209.236 E.74904
G1 X96.096 Y209.236 E.01546
G1 X79.625 Y192.764 E.74904
G1 X78.506 Y192.764 E.03597
G1 X62.035 Y209.236 E.74904
G1 X61.554 Y209.236 E.01546
G1 X56.792 Y204.473 E.21658
G2 X58.244 Y203.77 I-1.09 J-4.105 E.0522
G1 X124.594 Y202.043 F30000
G1 F8843.478
G2 X125.4 Y203.44 I4.025 J-1.391 E.0522
G1 X119.605 Y209.236 E.26354
G1 X119.124 Y209.236 E.01546
G1 X102.653 Y192.764 E.74904
G1 X101.534 Y192.764 E.03597
G1 X85.063 Y209.236 E.74904
G1 X84.582 Y209.236 E.01546
G1 X68.111 Y192.764 E.74904
G1 X66.992 Y192.764 E.03597
G1 X59.489 Y200.268 E.34121
G3 X59.533 Y201.458 I-3.645 J.731 E.03846
G1 X67.311 Y209.236 E.35371
G1 X67.792 Y209.236 E.01546
G1 X84.263 Y192.764 E.74904
G1 X85.382 Y192.764 E.03597
G1 X101.853 Y209.236 E.74904
G1 X102.334 Y209.236 E.01546
G1 X118.805 Y192.764 E.74904
G1 X119.924 Y192.764 E.03597
G1 X125.562 Y198.402 E.25638
G3 X130.439 Y198.401 I2.439 J2.631 E.17245
G1 X136.076 Y192.764 E.25635
G1 X137.195 Y192.764 E.03597
G1 X153.666 Y209.236 E.74904
G1 X154.147 Y209.236 E.01546
G1 X170.618 Y192.764 E.74904
G1 X171.737 Y192.764 E.03597
G1 X188.208 Y209.236 E.74904
G1 X188.689 Y209.236 E.01547
G1 X196.466 Y201.458 E.35368
G3 X196.513 Y200.27 I4.931 J-.398 E.03833
G1 X189.008 Y192.764 E.34133
G1 X187.889 Y192.764 E.03597
G1 X171.418 Y209.236 E.74904
G1 X170.937 Y209.236 E.01547
G1 X154.466 Y192.764 E.74904
G1 X153.347 Y192.764 E.03597
G1 X136.876 Y209.236 E.74904
G1 X136.395 Y209.236 E.01546
G1 X130.597 Y203.438 E.26365
G3 X129.257 Y204.336 I-2.972 J-2.988 E.0522
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X129.935 Y203.996 E-.28829
G1 X130.597 Y203.438 E-.32906
G1 X130.863 Y203.703 E-.14265
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/58
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
G1 X128.988 Y197.941
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X129.176 Y198.004 E.00638
G3 X127.748 Y197.796 I-1.167 J2.996 E.6028
G3 X128.871 Y197.904 I.25 J3.278 E.03647
M73 P43 R38
G1 X128.93 Y197.923 E.002
G1 X128.541 Y198.244 F30000
G1 F8843.478
G1 X128.761 Y198.295 E.00727
G3 X127.778 Y198.202 I-.751 J2.706 E.53557
G3 X128.482 Y198.231 I.239 J2.724 E.02272
G1 X128.097 Y198.605 F30000
G1 F8843.478
G1 X128.179 Y198.616 E.00265
G3 X128.651 Y198.687 I-.257 J3.303 E.01537
G3 X127.809 Y198.608 I-.642 J2.314 E.45784
G1 X128.037 Y198.605 E.00734
G1 X127.83 Y199 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X127.838 Y198.999 E.00025
G3 X128.349 Y199.02 I.166 J2.144 E.01527
G3 X127.554 Y199.044 I-.339 J1.98 E.35204
G1 X127.771 Y199.009 E.00654
; WIPE_START
M204 S10000
G1 X127.838 Y198.999 E-.02597
G1 X128.15 Y198.995 E-.11863
G1 X128.349 Y199.02 E-.07617
G1 X128.544 Y199.065 E-.07616
G1 X128.917 Y199.211 E-.15212
G1 X129.253 Y199.428 E-.1521
G1 X129.54 Y199.708 E-.15214
G1 X129.55 Y199.722 E-.00671
; WIPE_END
G1 E-.04 F1800
G1 X121.92 Y199.535 Z1.8 F30000
G1 X56.988 Y197.941 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X57.176 Y198.004 E.00637
G3 X55.748 Y197.796 I-1.167 J2.996 E.6028
G3 X56.871 Y197.904 I.25 J3.278 E.03647
G1 X56.93 Y197.923 E.002
G1 X56.541 Y198.244 F30000
G1 F8843.478
G1 X56.761 Y198.295 E.00727
G3 X55.778 Y198.202 I-.751 J2.706 E.53557
G3 X56.482 Y198.231 I.239 J2.724 E.02272
G1 X56.097 Y198.605 F30000
G1 F8843.478
G1 X56.179 Y198.616 E.00265
G3 X56.651 Y198.687 I-.257 J3.303 E.01537
G3 X55.809 Y198.608 I-.642 J2.314 E.45784
G1 X56.037 Y198.605 E.00734
G1 X55.83 Y199 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X55.838 Y198.999 E.00025
G3 X56.349 Y199.02 I.166 J2.144 E.01527
G3 X55.554 Y199.044 I-.339 J1.98 E.35204
G1 X55.771 Y199.009 E.00654
; WIPE_START
M204 S10000
G1 X55.838 Y198.999 E-.02598
G1 X56.15 Y198.995 E-.11863
G1 X56.349 Y199.02 E-.07617
G1 X56.544 Y199.065 E-.07616
G1 X56.917 Y199.211 E-.15212
G1 X57.253 Y199.428 E-.1521
G1 X57.54 Y199.708 E-.15213
G1 X57.55 Y199.722 E-.00671
; WIPE_END
G1 E-.04 F1800
G1 X57.651 Y192.091 Z1.8 F30000
G1 X58.496 Y128.027 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X58.468 Y128.071 E.00168
G3 X55.748 Y122.796 I-2.459 J-2.071 E.40644
G3 X57.176 Y123.004 I.25 J3.278 E.04678
G3 X58.663 Y127.815 I-1.167 J2.996 E.18602
G1 X58.534 Y127.98 E.00672
G1 X58.13 Y127.832 F30000
G1 F8843.478
G1 X57.966 Y128.016 E.00792
G3 X55.778 Y123.202 I-1.957 J-2.015 E.34589
G3 X56.761 Y123.295 I.238 J2.725 E.03191
G3 X58.174 Y127.792 I-.751 J2.706 E.17986
G1 X57.86 Y127.517 F30000
G1 F8843.478
G1 X57.845 Y127.548 E.00112
G3 X55.809 Y123.608 I-1.836 J-1.547 E.3034
G3 X56.651 Y123.687 I.113 J3.313 E.02727
G3 X58.116 Y127.152 I-.642 J2.314 E.139
G1 X57.894 Y127.467 E.01239
G1 X57.582 Y127.23 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X57.544 Y127.296 E.00225
G3 X55.838 Y123.999 I-1.535 J-1.296 E.23486
G3 X56.349 Y124.02 I.166 J2.144 E.01527
G3 X57.771 Y126.965 I-.339 J1.98 E.11379
G1 X57.617 Y127.181 E.00793
; WIPE_START
M204 S10000
G1 X57.544 Y127.296 E-.05147
G1 X57.253 Y127.572 E-.15232
G1 X57.091 Y127.689 E-.07616
G1 X56.734 Y127.871 E-.15211
G1 X56.349 Y127.98 E-.15213
G1 X55.95 Y128.01 E-.15212
G1 X55.888 Y128.002 E-.02368
; WIPE_END
G1 E-.04 F1800
G1 X62.782 Y131.278 Z1.8 F30000
G1 X191.416 Y192.416 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X64.584 Y192.416 E4.07847
G1 X64.584 Y59.584 E4.27141
G1 X191.416 Y59.584 E4.07847
G1 X191.416 Y192.356 E4.26948
G1 X191.009 Y192.009 F30000
G1 F8843.478
G1 X64.991 Y192.009 E4.05229
G1 X64.991 Y59.991 E4.24523
G1 X191.009 Y59.991 E4.05229
G1 X191.009 Y191.949 E4.2433
G1 X190.602 Y191.602 F30000
G1 F8843.478
G1 X65.398 Y191.602 E4.02611
G1 X65.398 Y60.398 E4.21905
G1 X190.602 Y60.398 E4.02611
G1 X190.602 Y191.542 E4.21712
G1 X190.21 Y191.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X65.79 Y191.21 E3.70605
G1 X65.79 Y60.79 E3.88477
G1 X190.21 Y60.79 E3.70605
G1 X190.21 Y191.15 E3.88298
; WIPE_START
M204 S10000
G1 X188.21 Y191.151 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X183.054 Y185.524 Z1.8 F30000
G1 X56.988 Y47.941 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X57.176 Y48.004 E.00637
G3 X55.748 Y47.796 I-1.167 J2.996 E.6028
G3 X56.871 Y47.904 I.25 J3.278 E.03646
G1 X56.931 Y47.923 E.00201
G1 X56.541 Y48.244 F30000
G1 F8843.478
G1 X56.761 Y48.295 E.00726
G3 X55.778 Y48.202 I-.751 J2.706 E.53557
G3 X56.482 Y48.231 I.239 J2.724 E.02272
G1 X56.097 Y48.605 F30000
G1 F8843.478
G1 X56.179 Y48.616 E.00265
G3 X56.651 Y48.687 I-.257 J3.304 E.01537
G3 X55.809 Y48.608 I-.642 J2.314 E.45784
G1 X56.037 Y48.605 E.00734
G1 X55.837 Y48.999 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X55.838 Y48.999 E.00004
G3 X56.349 Y49.02 I.166 J2.144 E.01527
G3 X55.554 Y49.044 I-.339 J1.98 E.35204
G1 X55.777 Y49.008 E.00675
; WIPE_START
M204 S10000
G1 X55.838 Y48.999 E-.02337
G1 X56.15 Y48.995 E-.11864
G1 X56.349 Y49.02 E-.07617
G1 X56.544 Y49.065 E-.07614
G1 X56.917 Y49.211 E-.15213
G1 X57.253 Y49.428 E-.1521
G1 X57.54 Y49.708 E-.15216
G1 X57.554 Y49.728 E-.0093
; WIPE_END
G1 E-.04 F1800
G1 X65.184 Y49.552 Z1.8 F30000
G1 X126.543 Y48.135 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X126.679 Y48.073 E.0048
G3 X127.748 Y47.796 I1.33 J2.927 E.03568
G3 X129.176 Y48.004 I.25 J3.278 E.04677
G3 X126.395 Y48.22 I-1.167 J2.996 E.55683
G1 X126.491 Y48.165 E.00357
G1 X127.03 Y48.365 F30000
G1 F8843.478
G1 X127.107 Y48.341 E.00258
G3 X127.778 Y48.202 I.903 J2.66 E.02211
G3 X128.761 Y48.295 I.238 J2.724 E.03192
G3 X126.847 Y48.444 I-.751 J2.706 E.50446
G1 X126.975 Y48.389 E.00449
G1 X127.52 Y48.649 F30000
G1 F8843.478
G1 X127.809 Y48.608 E.00937
G3 X128.651 Y48.687 I.113 J3.312 E.02727
G3 X127.462 Y48.663 I-.642 J2.314 E.44654
G1 X127.837 Y48.999 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X127.838 Y48.999 E.00004
G3 X128.349 Y49.02 I.166 J2.144 E.01527
G3 X127.554 Y49.044 I-.339 J1.98 E.35204
G1 X127.777 Y49.008 E.00675
; WIPE_START
M204 S10000
G1 X127.838 Y48.999 E-.02333
G1 X128.15 Y48.995 E-.11864
G1 X128.349 Y49.02 E-.07618
G1 X128.544 Y49.065 E-.07614
G1 X128.917 Y49.211 E-.15213
G1 X129.253 Y49.428 E-.1521
G1 X129.54 Y49.708 E-.15216
G1 X129.554 Y49.728 E-.00933
; WIPE_END
G1 E-.04 F1800
G1 X137.184 Y49.552 Z1.8 F30000
G1 X198.543 Y48.135 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X198.679 Y48.073 E.00482
G3 X199.748 Y47.796 I1.33 J2.927 E.03568
G3 X201.176 Y48.005 I.25 J3.277 E.04678
G3 X198.395 Y48.22 I-1.167 J2.996 E.55682
G1 X198.491 Y48.165 E.00356
G1 X199.03 Y48.365 F30000
G1 F8843.478
G1 X199.107 Y48.341 E.00259
G3 X199.778 Y48.202 I.903 J2.66 E.02212
G3 X200.761 Y48.295 I.238 J2.725 E.03192
G3 X198.847 Y48.444 I-.751 J2.706 E.50447
G1 X198.975 Y48.389 E.00448
G1 X199.52 Y48.65 F30000
G1 F8843.478
G1 X199.809 Y48.608 E.00938
G3 X200.651 Y48.687 I.113 J3.312 E.02727
G3 X199.461 Y48.663 I-.642 J2.314 E.44653
G1 X199.837 Y48.999 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X199.838 Y48.999 E.00004
G3 X200.349 Y49.02 I.166 J2.144 E.01527
G3 X199.554 Y49.044 I-.339 J1.98 E.35204
G1 X199.777 Y49.008 E.00675
; WIPE_START
M204 S10000
G1 X199.838 Y48.999 E-.02336
G1 X200.15 Y48.995 E-.11864
G1 X200.349 Y49.02 E-.07617
G1 X200.544 Y49.065 E-.07615
G1 X200.917 Y49.211 E-.15212
G1 X201.253 Y49.428 E-.15214
G1 X201.54 Y49.708 E-.15213
G1 X201.554 Y49.728 E-.00931
; WIPE_END
G1 E-.04 F1800
G1 X201.241 Y57.354 Z1.8 F30000
G1 X198.543 Y123.135 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X198.679 Y123.073 E.0048
G3 X199.748 Y122.796 I1.33 J2.927 E.03568
G3 X201.176 Y123.005 I.25 J3.278 E.04678
G3 X198.395 Y123.22 I-1.167 J2.996 E.55683
G1 X198.491 Y123.165 E.00356
G1 X199.03 Y123.365 F30000
G1 F8843.478
G1 X199.107 Y123.341 E.00258
G3 X199.778 Y123.202 I.903 J2.66 E.02212
G3 X200.761 Y123.295 I.238 J2.726 E.03191
G3 X198.847 Y123.444 I-.751 J2.706 E.50447
G1 X198.975 Y123.389 E.00449
G1 X199.52 Y123.649 F30000
G1 F8843.478
G1 X199.809 Y123.608 E.00937
G3 X200.651 Y123.687 I.113 J3.314 E.02727
G3 X199.462 Y123.663 I-.642 J2.314 E.44654
G1 X199.837 Y123.999 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X199.838 Y123.999 E.00004
G3 X200.349 Y124.02 I.166 J2.143 E.01527
G3 X199.554 Y124.044 I-.339 J1.98 E.35204
G1 X199.777 Y124.008 E.00675
; WIPE_START
M204 S10000
G1 X199.838 Y123.999 E-.02336
G1 X200.15 Y123.995 E-.11864
G1 X200.349 Y124.02 E-.07617
G1 X200.544 Y124.065 E-.07613
G1 X200.917 Y124.211 E-.15216
G1 X201.253 Y124.428 E-.15208
G1 X201.54 Y124.708 E-.15213
G1 X201.554 Y124.728 E-.00933
; WIPE_END
G1 E-.04 F1800
G1 X201.241 Y132.354 Z1.8 F30000
G1 X198.544 Y198.135 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X198.679 Y198.073 E.0048
G3 X199.748 Y197.796 I1.329 J2.927 E.03567
G3 X201.176 Y198.005 I.25 J3.277 E.04679
G3 X198.395 Y198.22 I-1.167 J2.996 E.55682
G1 X198.491 Y198.165 E.00357
G1 X199.03 Y198.365 F30000
G1 F8843.478
G1 X199.107 Y198.341 E.00257
G3 X199.778 Y198.202 I.903 J2.66 E.02211
G3 X200.761 Y198.295 I.239 J2.725 E.03192
G3 X198.847 Y198.444 I-.751 J2.706 E.50447
G1 X198.975 Y198.389 E.00449
G1 X199.521 Y198.649 F30000
G1 F8843.478
G1 X199.809 Y198.608 E.00936
G3 X200.651 Y198.687 I.113 J3.312 E.02727
G3 X199.462 Y198.662 I-.642 J2.314 E.44655
G1 X199.83 Y199 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X199.838 Y198.999 E.00023
G3 X200.349 Y199.02 I.166 J2.144 E.01527
G3 X199.554 Y199.044 I-.339 J1.98 E.35204
G1 X199.771 Y199.009 E.00656
; WIPE_START
M204 S10000
G1 X199.838 Y198.999 E-.02576
G1 X200.15 Y198.995 E-.11863
G1 X200.349 Y199.02 E-.07617
G1 X200.544 Y199.065 E-.07617
G1 X200.917 Y199.211 E-.15211
G1 X201.253 Y199.428 E-.15214
G1 X201.54 Y199.708 E-.1521
G1 X201.55 Y199.723 E-.00693
; WIPE_END
G1 E-.04 F1800
G1 X205.982 Y205.937 Z1.8 F30000
G1 X208.584 Y209.584 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X47.416 Y209.584 E5.18256
G1 X47.416 Y42.416 E5.3755
G1 X208.584 Y42.416 E5.18256
G1 X208.584 Y209.524 E5.37357
G1 X208.991 Y209.991 F30000
G1 F8843.478
G1 X47.009 Y209.991 E5.20874
G1 X47.009 Y42.009 E5.40168
G1 X208.991 Y42.009 E5.20874
G1 X208.991 Y209.931 E5.39975
G1 X209.398 Y210.398 F30000
G1 F8843.478
G1 X46.602 Y210.398 E5.23492
G1 X46.602 Y41.602 E5.42786
G1 X209.398 Y41.602 E5.23492
G1 X209.398 Y210.338 E5.42593
G1 X209.79 Y210.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X46.21 Y210.79 E4.87249
G1 X46.21 Y41.21 E5.05121
G1 X209.79 Y41.21 E4.87249
G1 X209.79 Y210.73 E5.04942
; WIPE_START
M204 S10000
G1 X207.79 Y210.731 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X202.992 Y204.795 Z1.8 F30000
G1 X202.195 Y203.809 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X200.73 Y204.487 I-2.218 J-2.871 E.05233
G1 X205.479 Y209.236 E.21594
G1 X205.96 Y209.236 E.01547
G1 X208.236 Y206.959 E.10351
G1 X208.236 Y206.236 E.02328
G1 X203.524 Y201.524 E.21428
G2 X203.474 Y200.207 I-3.558 J-.525 E.0426
G1 X208.236 Y195.446 E.21654
G1 X208.236 Y194.722 E.02328
G1 X191.764 Y178.251 E.74904
G1 X191.764 Y177.375 E.02816
G1 X208.236 Y160.904 E.74904
G1 X208.236 Y160.18 E.02328
G1 X191.764 Y143.709 E.74904
G1 X191.764 Y142.833 E.02816
G1 X208.236 Y126.362 E.74904
G1 X208.236 Y125.638 E.02328
G1 X191.764 Y109.167 E.74904
G1 X191.764 Y108.291 E.02816
G1 X208.236 Y91.82 E.74904
G1 X208.236 Y91.096 E.02328
G1 X191.764 Y74.625 E.74904
G1 X191.764 Y73.749 E.02816
G1 X208.236 Y57.278 E.74904
G1 X208.236 Y56.554 E.02328
G1 X203.474 Y51.793 E.21654
G2 X203.524 Y50.476 I-3.509 J-.791 E.0426
G1 X208.236 Y45.764 E.21428
G1 X208.236 Y45.04 E.02328
G1 X205.96 Y42.764 E.10351
M73 P44 R38
G1 X205.479 Y42.764 E.01546
G1 X200.73 Y47.513 E.21594
G2 X199.204 Y47.523 I-.736 J3.969 E.04936
G1 X194.446 Y42.764 E.21641
G1 X193.965 Y42.764 E.01546
G1 X177.494 Y59.236 E.74904
G1 X176.375 Y59.236 E.03597
G1 X159.904 Y42.764 E.74904
G1 X159.423 Y42.764 E.01546
G1 X142.952 Y59.236 E.74904
G1 X141.833 Y59.236 E.03597
G1 X125.362 Y42.764 E.74904
G1 X124.881 Y42.764 E.01546
G1 X108.41 Y59.236 E.74904
G1 X107.291 Y59.236 E.03597
G1 X90.82 Y42.764 E.74904
G1 X90.339 Y42.764 E.01547
G1 X73.868 Y59.236 E.74904
G1 X72.749 Y59.236 E.03597
G1 X56.278 Y42.764 E.74904
G1 X55.797 Y42.764 E.01547
G1 X47.764 Y50.797 E.36531
G1 X47.764 Y51.521 E.02328
G1 X64.236 Y67.993 E.74904
G1 X64.236 Y68.868 E.02816
G1 X47.764 Y85.339 E.74904
G1 X47.764 Y86.063 E.02328
G1 X64.236 Y102.534 E.74904
G1 X64.236 Y103.41 E.02816
G1 X47.764 Y119.881 E.74904
G1 X47.764 Y120.605 E.02328
G1 X52.499 Y125.34 E.21532
G2 X52.499 Y126.66 I3.518 J.66 E.04271
G1 X47.764 Y131.395 E.21532
G1 X47.764 Y132.119 E.02328
G1 X64.236 Y148.59 E.74904
G1 X64.236 Y149.466 E.02816
G1 X47.764 Y165.937 E.74904
G1 X47.764 Y166.661 E.02328
G1 X64.236 Y183.132 E.74904
G1 X64.236 Y184.007 E.02816
G1 X47.764 Y200.479 E.74904
G1 X47.764 Y201.203 E.02328
G1 X55.797 Y209.236 E.36531
G1 X56.278 Y209.236 E.01546
G1 X72.749 Y192.764 E.74904
G1 X73.868 Y192.764 E.03597
G1 X90.339 Y209.236 E.74904
G1 X90.82 Y209.236 E.01546
G1 X107.291 Y192.764 E.74904
G1 X108.41 Y192.764 E.03597
G1 X124.881 Y209.236 E.74904
G1 X125.362 Y209.236 E.01547
G1 X141.833 Y192.764 E.74904
G1 X142.952 Y192.764 E.03597
G1 X159.423 Y209.236 E.74904
G1 X159.904 Y209.236 E.01547
G1 X176.375 Y192.764 E.74904
G1 X177.494 Y192.764 E.03597
G1 X193.965 Y209.236 E.74904
G1 X194.446 Y209.236 E.01547
G1 X199.204 Y204.477 E.21641
G3 X197.755 Y203.766 I.839 J-3.545 E.05233
G1 X129.257 Y204.336 F30000
G1 F8843.478
G2 X130.597 Y203.438 I-1.632 J-3.887 E.0522
G1 X136.395 Y209.236 E.26365
G1 X136.876 Y209.236 E.01546
G1 X153.347 Y192.764 E.74904
G1 X154.466 Y192.764 E.03597
G1 X170.937 Y209.236 E.74904
G1 X171.418 Y209.236 E.01547
G1 X187.889 Y192.764 E.74904
G1 X189.008 Y192.764 E.03597
G1 X196.513 Y200.27 E.34133
G2 X196.466 Y201.458 I4.885 J.79 E.03833
G1 X188.689 Y209.236 E.35368
G1 X188.208 Y209.236 E.01547
G1 X171.737 Y192.764 E.74904
G1 X170.618 Y192.764 E.03597
G1 X154.147 Y209.236 E.74904
G1 X153.666 Y209.236 E.01546
G1 X137.195 Y192.764 E.74904
G1 X136.076 Y192.764 E.03597
G1 X130.439 Y198.401 E.25635
G2 X125.562 Y198.402 I-2.438 J2.631 E.17246
G1 X119.924 Y192.764 E.25638
G1 X118.805 Y192.764 E.03597
G1 X102.334 Y209.236 E.74904
G1 X101.853 Y209.236 E.01546
G1 X85.382 Y192.764 E.74904
G1 X84.263 Y192.764 E.03597
G1 X67.792 Y209.236 E.74904
G1 X67.311 Y209.236 E.01546
G1 X59.533 Y201.458 E.35371
G2 X59.489 Y200.268 I-3.688 J-.459 E.03846
G1 X66.992 Y192.764 E.34121
G1 X68.111 Y192.764 E.03597
G1 X84.582 Y209.236 E.74904
G1 X85.063 Y209.236 E.01546
G1 X101.534 Y192.764 E.74904
G1 X102.653 Y192.764 E.03597
G1 X119.124 Y209.236 E.74904
G1 X119.605 Y209.236 E.01546
G1 X125.4 Y203.44 E.26354
G3 X124.594 Y202.043 I3.218 J-2.788 E.0522
G1 X58.244 Y203.77 F30000
G1 F8843.478
G3 X56.792 Y204.473 I-2.542 J-3.402 E.0522
G1 X61.554 Y209.236 E.21658
G1 X62.035 Y209.236 E.01546
G1 X78.506 Y192.764 E.74904
G1 X79.625 Y192.764 E.03597
G1 X96.096 Y209.236 E.74904
G1 X96.577 Y209.236 E.01546
G1 X113.048 Y192.764 E.74904
G1 X114.167 Y192.764 E.03597
G1 X130.638 Y209.236 E.74904
G1 X131.119 Y209.236 E.01546
G1 X147.59 Y192.764 E.74904
G1 X148.709 Y192.764 E.03597
G1 X165.18 Y209.236 E.74904
G1 X165.661 Y209.236 E.01547
G1 X182.132 Y192.764 E.74904
G1 X183.251 Y192.764 E.03597
G1 X199.722 Y209.236 E.74904
G1 X200.203 Y209.236 E.01547
G1 X208.236 Y201.203 E.36531
G1 X208.236 Y200.479 E.02328
G1 X191.764 Y184.008 E.74904
G1 X191.764 Y183.132 E.02816
G1 X208.236 Y166.661 E.74904
G1 X208.236 Y165.937 E.02328
G1 X191.764 Y149.466 E.74904
G1 X191.764 Y148.59 E.02816
G1 X208.236 Y132.119 E.74904
G1 X208.236 Y131.395 E.02328
G1 X203.503 Y126.662 E.21523
G2 X203.503 Y125.338 I-4.717 J-.662 E.04272
G1 X208.236 Y120.605 E.21523
G1 X208.236 Y119.881 E.02328
G1 X191.764 Y103.41 E.74904
G1 X191.764 Y102.534 E.02816
G1 X208.236 Y86.063 E.74904
G1 X208.236 Y85.339 E.02328
G1 X191.764 Y68.868 E.74904
G1 X191.764 Y67.993 E.02816
G1 X208.236 Y51.521 E.74904
G1 X208.236 Y50.797 E.02328
G1 X200.203 Y42.764 E.36531
G1 X199.722 Y42.764 E.01546
G1 X183.251 Y59.236 E.74904
G1 X182.132 Y59.236 E.03597
G1 X165.661 Y42.764 E.74904
G1 X165.18 Y42.764 E.01546
G1 X148.709 Y59.236 E.74904
G1 X147.59 Y59.236 E.03597
G1 X131.119 Y42.764 E.74904
G1 X130.638 Y42.764 E.01547
G1 X114.167 Y59.236 E.74904
G1 X113.048 Y59.236 E.03597
G1 X96.577 Y42.764 E.74904
G1 X96.096 Y42.764 E.01547
G1 X79.625 Y59.236 E.74904
G1 X78.506 Y59.236 E.03597
G1 X62.035 Y42.764 E.74904
G1 X61.554 Y42.764 E.01547
G1 X56.792 Y47.527 E.21658
G2 X55.27 Y47.513 I-.809 J5.2 E.04912
G1 X50.521 Y42.764 E.21594
G1 X50.04 Y42.764 E.01547
G1 X47.764 Y45.04 E.1035
G1 X47.764 Y45.764 E.02328
G1 X52.473 Y50.473 E.21411
G2 X52.526 Y51.793 I4.761 J.469 E.04262
G1 X47.764 Y56.554 E.21654
G1 X47.764 Y57.278 E.02328
G1 X64.236 Y73.749 E.74904
G1 X64.236 Y74.625 E.02816
G1 X47.764 Y91.096 E.74904
G1 X47.764 Y91.82 E.02328
G1 X64.236 Y108.291 E.74904
G1 X64.236 Y109.167 E.02816
G1 X47.764 Y125.638 E.74904
G1 X47.764 Y126.362 E.02328
G1 X64.236 Y142.833 E.74904
G1 X64.236 Y143.709 E.02816
G1 X47.764 Y160.18 E.74904
G1 X47.764 Y160.904 E.02328
G1 X64.236 Y177.375 E.74904
G1 X64.236 Y178.251 E.02816
G1 X47.764 Y194.722 E.74904
G1 X47.764 Y195.446 E.02328
G1 X52.526 Y200.207 E.21654
G2 X52.473 Y201.527 I4.708 J.851 E.04262
G1 X47.764 Y206.235 E.21411
G1 X47.764 Y206.96 E.02328
G1 X50.04 Y209.236 E.1035
G1 X50.521 Y209.236 E.01546
G1 X55.269 Y204.488 E.21589
G3 X53.806 Y203.807 I1.011 J-4.079 E.0522
; WIPE_START
G1 X54.533 Y204.251 E-.32358
G1 X55.269 Y204.488 E-.29376
G1 X55.003 Y204.754 E-.14266
; WIPE_END
G1 E-.04 F1800
G1 X54.894 Y197.122 Z1.8 F30000
G1 X53.914 Y128.893 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F8843.478
G2 X55.404 Y129.512 I2.36 J-3.577 E.05221
G1 X47.764 Y137.152 E.34743
G1 X47.764 Y137.876 E.02328
G1 X64.236 Y154.347 E.74904
G1 X64.236 Y155.223 E.02816
G1 X47.764 Y171.694 E.74904
G1 X47.764 Y172.418 E.02328
G1 X64.236 Y188.889 E.74904
G1 X64.236 Y189.764 E.02816
G1 X56.524 Y197.476 E.35067
G2 X55.549 Y197.473 I-.5 J4.077 E.03145
G1 X47.764 Y189.689 E.35399
G1 X47.764 Y188.965 E.02328
G1 X64.236 Y172.494 E.74904
G1 X64.236 Y171.618 E.02816
G1 X47.764 Y155.147 E.74904
G1 X47.764 Y154.423 E.02328
G1 X64.236 Y137.952 E.74904
G1 X64.236 Y137.076 E.02816
G1 X56.662 Y129.503 E.34441
G2 X59.513 Y126.596 I-.669 J-3.507 E.13929
G1 X64.236 Y131.319 E.21478
G1 X64.236 Y132.195 E.02816
G1 X47.764 Y148.666 E.74904
G1 X47.764 Y149.39 E.02328
G1 X64.236 Y165.861 E.74904
G1 X64.236 Y166.737 E.02816
G1 X47.764 Y183.208 E.74904
G1 X47.764 Y183.932 E.02328
G1 X73.068 Y209.236 E1.15072
G1 X73.549 Y209.236 E.01546
G1 X90.02 Y192.764 E.74904
G1 X91.139 Y192.764 E.03597
G1 X107.61 Y209.236 E.74904
G1 X108.091 Y209.236 E.01547
G1 X124.562 Y192.764 E.74904
G1 X125.681 Y192.764 E.03597
G1 X142.152 Y209.236 E.74904
M73 P44 R37
G1 X142.633 Y209.236 E.01546
G1 X159.104 Y192.764 E.74904
G1 X160.223 Y192.764 E.03597
G1 X176.694 Y209.236 E.74904
G1 X177.175 Y209.236 E.01547
G1 X208.236 Y178.175 E1.41252
G1 X208.236 Y177.451 E.02328
G1 X191.764 Y160.98 E.74904
G1 X191.764 Y160.104 E.02816
G1 X208.236 Y143.633 E.74904
G1 X208.236 Y142.909 E.02328
G1 X191.764 Y126.438 E.74904
G1 X191.764 Y125.562 E.02816
G1 X208.236 Y109.091 E.74904
G1 X208.236 Y108.367 E.02328
G1 X191.764 Y91.896 E.74904
G1 X191.764 Y91.02 E.02816
G1 X208.236 Y74.549 E.74904
G1 X208.236 Y73.825 E.02328
G1 X177.175 Y42.764 E1.41252
G1 X176.694 Y42.764 E.01546
G1 X160.223 Y59.236 E.74904
G1 X159.104 Y59.236 E.03597
G1 X142.633 Y42.764 E.74904
G1 X142.152 Y42.764 E.01546
G1 X125.681 Y59.236 E.74904
G1 X124.562 Y59.236 E.03597
G1 X108.091 Y42.764 E.74904
G1 X107.61 Y42.764 E.01547
G1 X91.139 Y59.236 E.74904
G1 X90.02 Y59.236 E.03597
G1 X73.549 Y42.764 E.74904
G1 X73.068 Y42.764 E.01547
G1 X47.764 Y68.068 E1.15072
G1 X47.764 Y68.792 E.02328
G1 X64.236 Y85.263 E.74904
G1 X64.236 Y86.139 E.02816
G1 X47.764 Y102.61 E.74904
G1 X47.764 Y103.334 E.02328
G1 X64.236 Y119.805 E.74904
G1 X64.236 Y120.681 E.02816
G1 X59.513 Y125.404 E.21478
G2 X56.662 Y122.497 I-3.52 J.601 E.13929
G1 X64.236 Y114.924 E.34441
G1 X64.236 Y114.048 E.02816
G1 X47.764 Y97.577 E.74904
G1 X47.764 Y96.853 E.02328
G1 X64.236 Y80.382 E.74904
G1 X64.236 Y79.506 E.02816
G1 X47.764 Y63.035 E.74904
G1 X47.764 Y62.311 E.02328
G1 X55.54 Y54.536 E.35359
G2 X56.524 Y54.524 I.409 J-7.029 E.03169
G1 X64.236 Y62.236 E.35067
G1 X64.236 Y63.111 E.02816
G1 X47.764 Y79.582 E.74904
G1 X47.764 Y80.306 E.02328
G1 X64.236 Y96.777 E.74904
G1 X64.236 Y97.653 E.02816
G1 X47.764 Y114.124 E.74904
G1 X47.764 Y114.848 E.02328
G1 X55.409 Y122.493 E.34765
G2 X53.917 Y123.105 I.801 J4.078 E.05218
; WIPE_START
G1 X54.533 Y122.749 E-.27021
G1 X55.409 Y122.493 E-.34691
G1 X55.143 Y122.227 E-.14288
; WIPE_END
G1 E-.04 F1800
G1 X60.43 Y116.722 Z1.8 F30000
G1 X126.744 Y47.666 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F8843.478
G2 X125.4 Y48.56 I1.289 J3.397 E.05233
G1 X119.605 Y42.764 E.26354
G1 X119.124 Y42.764 E.01546
G1 X102.653 Y59.236 E.74904
G1 X101.534 Y59.236 E.03597
G1 X85.063 Y42.764 E.74904
G1 X84.582 Y42.764 E.01547
G1 X68.111 Y59.236 E.74904
G1 X66.992 Y59.236 E.03597
G1 X59.489 Y51.732 E.34121
G2 X59.533 Y50.542 I-3.644 J-.731 E.03846
G1 X67.311 Y42.764 E.35371
G1 X67.792 Y42.764 E.01547
G1 X84.263 Y59.236 E.74904
G1 X85.382 Y59.236 E.03597
G1 X101.853 Y42.764 E.74904
G1 X102.334 Y42.764 E.01546
G1 X118.805 Y59.236 E.74904
G1 X119.924 Y59.236 E.03597
G1 X125.562 Y53.598 E.25638
G2 X130.439 Y53.599 I2.439 J-2.652 E.17228
G1 X136.076 Y59.236 E.25635
G1 X137.195 Y59.236 E.03597
G1 X153.666 Y42.764 E.74904
G1 X154.147 Y42.764 E.01546
G1 X170.618 Y59.236 E.74904
G1 X171.737 Y59.236 E.03597
G1 X188.208 Y42.764 E.74904
G1 X188.689 Y42.764 E.01546
G1 X196.466 Y50.542 E.35368
G2 X196.513 Y51.73 I4.932 J.398 E.03833
G1 X189.008 Y59.236 E.34133
G1 X187.889 Y59.236 E.03597
G1 X171.418 Y42.764 E.74904
G1 X170.937 Y42.764 E.01546
G1 X154.466 Y59.236 E.74904
G1 X153.347 Y59.236 E.03597
G1 X136.876 Y42.764 E.74904
G1 X136.395 Y42.764 E.01546
G1 X130.597 Y48.562 E.26365
G3 X131.41 Y49.956 I-3.224 J2.814 E.05221
; WIPE_START
G1 X131.132 Y49.294 E-.27289
G1 X130.597 Y48.562 E-.34451
G1 X130.863 Y48.297 E-.1426
; WIPE_END
G1 E-.04 F1800
G1 X136.125 Y53.825 Z1.8 F30000
G1 X202.085 Y123.112 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F8843.478
G2 X200.599 Y122.485 I-2.367 J3.535 E.0522
G1 X208.236 Y114.848 E.34729
G1 X208.236 Y114.124 E.02328
G1 X191.764 Y97.653 E.74904
G1 X191.764 Y96.777 E.02816
G1 X208.236 Y80.306 E.74904
G1 X208.236 Y79.582 E.02328
G1 X191.764 Y63.111 E.74904
G1 X191.764 Y62.236 E.02816
G1 X199.475 Y54.525 E.35066
G2 X200.457 Y54.533 I.541 J-6.079 E.0316
G1 X208.236 Y62.311 E.35374
G1 X208.236 Y63.035 E.02328
G1 X191.764 Y79.506 E.74904
G1 X191.764 Y80.382 E.02816
G1 X208.236 Y96.853 E.74904
G1 X208.236 Y97.577 E.02328
G1 X191.764 Y114.048 E.74904
G1 X191.764 Y114.924 E.02816
G1 X199.343 Y122.502 E.34464
G2 X196.486 Y125.403 I.65 J3.497 E.13937
G1 X191.764 Y120.681 E.21474
G1 X191.764 Y119.805 E.02816
G1 X208.236 Y103.334 E.74904
G1 X208.236 Y102.61 E.02328
G1 X191.764 Y86.139 E.74904
G1 X191.764 Y85.263 E.02816
G1 X208.236 Y68.792 E.74904
G1 X208.236 Y68.068 E.02328
G1 X182.932 Y42.764 E1.15072
G1 X182.451 Y42.764 E.01546
G1 X165.98 Y59.236 E.74904
G1 X164.861 Y59.236 E.03597
G1 X148.39 Y42.764 E.74904
G1 X147.909 Y42.764 E.01547
G1 X131.438 Y59.236 E.74904
G1 X130.319 Y59.236 E.03597
G1 X113.848 Y42.764 E.74904
G1 X113.367 Y42.764 E.01546
G1 X96.896 Y59.236 E.74904
G1 X95.777 Y59.236 E.03597
G1 X79.306 Y42.764 E.74904
G1 X78.825 Y42.764 E.01547
G1 X47.764 Y73.825 E1.41252
G1 X47.764 Y74.549 E.02328
G1 X64.236 Y91.02 E.74904
G1 X64.236 Y91.896 E.02816
M73 P45 R37
G1 X47.764 Y108.367 E.74904
G1 X47.764 Y109.091 E.02328
G1 X64.236 Y125.562 E.74904
G1 X64.236 Y126.438 E.02816
G1 X47.764 Y142.909 E.74904
G1 X47.764 Y143.633 E.02328
G1 X64.236 Y160.104 E.74904
G1 X64.236 Y160.98 E.02816
G1 X47.764 Y177.451 E.74904
G1 X47.764 Y178.175 E.02328
G1 X78.825 Y209.236 E1.41252
G1 X79.306 Y209.236 E.01546
G1 X95.777 Y192.764 E.74904
G1 X96.896 Y192.764 E.03597
G1 X113.367 Y209.236 E.74904
G1 X113.848 Y209.236 E.01546
G1 X130.319 Y192.764 E.74904
G1 X131.438 Y192.764 E.03597
G1 X147.909 Y209.236 E.74904
G1 X148.39 Y209.236 E.01547
G1 X164.861 Y192.764 E.74904
G1 X165.98 Y192.764 E.03597
G1 X182.451 Y209.236 E.74904
G1 X182.932 Y209.236 E.01547
G1 X208.236 Y183.932 E1.15072
G1 X208.236 Y183.208 E.02328
G1 X191.764 Y166.737 E.74904
G1 X191.764 Y165.861 E.02816
G1 X208.236 Y149.39 E.74904
G1 X208.236 Y148.666 E.02328
G1 X191.764 Y132.195 E.74904
G1 X191.764 Y131.319 E.02816
G1 X196.486 Y126.597 E.21474
G2 X199.34 Y129.501 I3.517 J-.602 E.13931
G1 X191.764 Y137.076 E.3445
G1 X191.764 Y137.952 E.02816
G1 X208.236 Y154.423 E.74904
G1 X208.236 Y155.147 E.02328
G1 X191.764 Y171.618 E.74904
G1 X191.764 Y172.494 E.02816
G1 X208.236 Y188.965 E.74904
G1 X208.236 Y189.689 E.02328
G1 X200.457 Y197.467 E.35374
G2 X199.482 Y197.482 I-.425 J4.055 E.03142
G1 X191.764 Y189.764 E.35097
G1 X191.764 Y188.889 E.02816
G1 X208.236 Y172.418 E.74904
G1 X208.236 Y171.694 E.02328
G1 X191.764 Y155.223 E.74904
G1 X191.764 Y154.347 E.02816
G1 X208.236 Y137.876 E.74904
G1 X208.236 Y137.152 E.02328
G1 X200.599 Y129.515 E.34729
G2 X202.085 Y128.888 I-.88 J-4.163 E.0522
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X201.303 Y129.32 E-.33961
G1 X200.599 Y129.515 E-.27776
G1 X200.864 Y129.78 E-.14262
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/58
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
G1 X126.446 Y198.185
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X126.677 Y198.067 E.00833
G3 X127.6 Y197.807 I1.324 J2.931 E.03096
G1 X127.92 Y197.783 E.01032
G3 X126.391 Y198.214 I.081 J3.215 E.59817
G1 X126.393 Y198.213 E.00005
G1 X126.936 Y198.402 F30000
G1 F8843.478
G1 X127.105 Y198.336 E.00583
G3 X127.651 Y198.211 I.896 J2.662 E.01803
G1 X127.93 Y198.19 E.00901
G3 X126.844 Y198.439 I.07 J2.808 E.53141
G1 X126.88 Y198.424 E.00125
G1 X127.367 Y198.69 F30000
G1 F8843.478
G1 X127.465 Y198.658 E.00333
G3 X127.701 Y198.616 I.535 J2.341 E.00771
G1 X127.94 Y198.598 E.0077
G3 X127.012 Y198.81 I.06 J2.401 E.45435
G1 X127.31 Y198.71 E.01013
G1 X127.84 Y198.999 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X127.95 Y198.99 E.0033
G3 X127.75 Y199.005 I.05 J2.008 E.37002
G1 X127.78 Y199.003 E.00089
; WIPE_START
M204 S10000
G1 X127.95 Y198.99 E-.06484
G1 X128.349 Y199.02 E-.15212
G1 X128.734 Y199.129 E-.15214
G1 X129.091 Y199.311 E-.15215
G1 X129.404 Y199.561 E-.15207
G1 X129.55 Y199.736 E-.08669
; WIPE_END
G1 E-.04 F1800
G1 X121.919 Y199.578 Z2 F30000
G1 X54.446 Y198.185 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X54.677 Y198.067 E.00833
G3 X55.6 Y197.807 I1.324 J2.931 E.03096
G1 X55.92 Y197.783 E.01032
G3 X54.391 Y198.214 I.081 J3.216 E.59829
G1 X54.393 Y198.213 E.00005
G1 X54.936 Y198.402 F30000
G1 F8843.478
G1 X55.105 Y198.336 E.00583
G3 X55.651 Y198.211 I.896 J2.663 E.01803
G1 X55.93 Y198.19 E.00901
G3 X54.844 Y198.439 I.07 J2.808 E.53153
G1 X54.88 Y198.424 E.00125
G1 X55.402 Y198.684 F30000
G1 F8843.478
G1 X55.701 Y198.616 E.00988
G1 X55.94 Y198.598 E.0077
G3 X55.235 Y198.723 I.06 J2.396 E.46115
G1 X55.343 Y198.698 E.00358
G1 X55.84 Y198.999 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X55.95 Y198.99 E.0033
G3 X55.75 Y199.005 I.05 J2.005 E.36932
G1 X55.78 Y199.003 E.00088
; WIPE_START
M204 S10000
G1 X55.95 Y198.99 E-.06484
G1 X56.349 Y199.02 E-.15212
G1 X56.734 Y199.129 E-.15213
G1 X57.091 Y199.311 E-.15212
G1 X57.404 Y199.561 E-.1521
G1 X57.55 Y199.736 E-.08669
; WIPE_END
G1 E-.04 F1800
G1 X57.651 Y192.104 Z2 F30000
G1 X58.496 Y128.027 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X58.468 Y128.071 E.00168
G3 X55.76 Y122.795 I-2.459 J-2.071 E.40682
G3 X57.176 Y123.004 I.238 J3.279 E.0464
G3 X58.663 Y127.816 I-1.167 J2.996 E.18603
G1 X58.534 Y127.98 E.00673
G1 X58.174 Y127.779 F30000
G1 F8843.478
G1 X58.158 Y127.811 E.00114
G3 X55.79 Y123.201 I-2.148 J-1.81 E.3553
G3 X56.761 Y123.295 I.227 J2.723 E.03154
G3 X58.328 Y127.587 I-.751 J2.706 E.17162
G1 X58.211 Y127.732 E.00599
G1 X57.86 Y127.517 F30000
G1 F8843.478
G1 X57.845 Y127.548 E.00112
G3 X55.821 Y123.607 I-1.836 J-1.547 E.30377
G3 X56.651 Y123.687 I.096 J3.351 E.02689
G3 X58.116 Y127.152 I-.642 J2.314 E.13901
G1 X57.894 Y127.467 E.01239
G1 X57.571 Y127.247 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X57.544 Y127.296 E.00167
G3 X55.85 Y123.998 I-1.534 J-1.296 E.2352
G3 X56.349 Y124.02 I.154 J2.146 E.01492
G3 X57.772 Y126.965 I-.339 J1.98 E.11381
G1 X57.606 Y127.198 E.00852
; WIPE_START
M204 S10000
G1 X57.544 Y127.296 E-.04403
G1 X57.253 Y127.572 E-.15233
G1 X57.091 Y127.689 E-.07616
G1 X56.734 Y127.871 E-.15211
G1 X56.349 Y127.98 E-.15213
G1 X55.95 Y128.01 E-.15212
G1 X55.869 Y127.999 E-.03111
; WIPE_END
G1 E-.04 F1800
G1 X62.762 Y131.276 Z2 F30000
G1 X191.416 Y192.416 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X64.584 Y192.416 E4.07847
G1 X64.584 Y59.584 E4.27141
G1 X191.416 Y59.584 E4.07847
G1 X191.416 Y192.356 E4.26948
G1 X191.009 Y192.009 F30000
G1 F8843.478
G1 X64.991 Y192.009 E4.05229
G1 X64.991 Y59.991 E4.24523
G1 X191.009 Y59.991 E4.05229
G1 X191.009 Y191.949 E4.2433
G1 X190.602 Y191.602 F30000
G1 F8843.478
G1 X65.398 Y191.602 E4.02611
G1 X65.398 Y60.398 E4.21905
G1 X190.602 Y60.398 E4.02611
G1 X190.602 Y191.542 E4.21712
G1 X190.21 Y191.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X65.79 Y191.21 E3.70605
G1 X65.79 Y60.79 E3.88477
G1 X190.21 Y60.79 E3.70605
G1 X190.21 Y191.15 E3.88298
; WIPE_START
M204 S10000
G1 X188.21 Y191.151 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X182.999 Y185.574 Z2 F30000
G1 X54.556 Y48.129 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X54.679 Y48.073 E.00436
G3 X55.76 Y47.795 I1.33 J2.927 E.03606
G3 X57.176 Y48.004 I.238 J3.279 E.0464
G3 X54.395 Y48.22 I-1.167 J2.996 E.55682
G1 X54.503 Y48.158 E.00401
G1 X55.041 Y48.361 F30000
G1 F8843.478
G1 X55.107 Y48.342 E.00219
G3 X55.79 Y48.201 I.903 J2.659 E.02249
G3 X56.761 Y48.295 I.227 J2.723 E.03154
G3 X54.847 Y48.444 I-.751 J2.706 E.50446
G1 X54.986 Y48.385 E.00488
G1 X55.532 Y48.648 F30000
G1 F8843.478
G1 X55.821 Y48.607 E.00939
G3 X56.651 Y48.687 I.096 J3.351 E.02689
G3 X55.466 Y48.662 I-.642 J2.314 E.44668
G1 X55.473 Y48.66 E.00021
G1 X55.85 Y48.998 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X56.349 Y49.02 I.154 J2.146 E.01492
G3 X55.79 Y49.004 I-.339 J1.98 E.3592
; WIPE_START
M204 S10000
G1 X56.15 Y48.995 E-.1368
G1 X56.349 Y49.02 E-.07618
G1 X56.544 Y49.065 E-.07613
G1 X56.917 Y49.211 E-.1521
G1 X57.253 Y49.428 E-.15217
G1 X57.54 Y49.708 E-.15212
G1 X57.561 Y49.739 E-.01449
; WIPE_END
G1 E-.04 F1800
G1 X65.192 Y49.561 Z2 F30000
G1 X126.555 Y48.129 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X126.679 Y48.073 E.00437
G3 X127.76 Y47.795 I1.33 J2.927 E.03606
G3 X129.176 Y48.004 I.238 J3.279 E.0464
G3 X126.395 Y48.22 I-1.167 J2.996 E.55682
G1 X126.503 Y48.158 E.00401
G1 X127.041 Y48.361 F30000
G1 F8843.478
G1 X127.107 Y48.342 E.0022
G3 X127.79 Y48.201 I.903 J2.659 E.02249
G3 X128.761 Y48.295 I.227 J2.722 E.03154
G3 X126.847 Y48.444 I-.751 J2.706 E.50446
G1 X126.986 Y48.385 E.00487
G1 X127.531 Y48.648 F30000
G1 F8843.478
G1 X127.821 Y48.607 E.0094
G3 X128.651 Y48.687 I.096 J3.351 E.02689
G3 X127.466 Y48.662 I-.642 J2.314 E.44668
G1 X127.473 Y48.66 E.00021
G1 X127.85 Y48.998 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X128.349 Y49.02 I.154 J2.146 E.01492
G3 X127.79 Y49.004 I-.339 J1.98 E.3592
; WIPE_START
M204 S10000
G1 X128.15 Y48.995 E-.13681
G1 X128.349 Y49.02 E-.07618
G1 X128.544 Y49.065 E-.07613
G1 X128.917 Y49.211 E-.1521
G1 X129.253 Y49.428 E-.15213
G1 X129.54 Y49.708 E-.15213
G1 X129.561 Y49.739 E-.01451
; WIPE_END
G1 E-.04 F1800
G1 X137.192 Y49.548 Z2 F30000
G1 X201.003 Y47.946 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X201.176 Y48.005 E.00587
G3 X199.76 Y47.795 I-1.167 J2.996 E.60318
G3 X200.871 Y47.904 I.238 J3.279 E.03608
G1 X200.946 Y47.928 E.00252
G1 X200.556 Y48.248 F30000
G1 F8843.478
G1 X200.761 Y48.295 E.00675
G3 X199.79 Y48.201 I-.751 J2.706 E.53595
G3 X200.488 Y48.232 I.227 J2.723 E.02252
G1 X200.498 Y48.235 E.00033
G1 X200.114 Y48.604 F30000
G1 F8843.478
G1 X200.179 Y48.616 E.00211
G3 X200.651 Y48.687 I-.262 J3.342 E.01537
G3 X199.821 Y48.607 I-.642 J2.314 E.45822
G1 X200.054 Y48.605 E.0075
G1 X199.85 Y48.998 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X200.349 Y49.02 I.154 J2.146 E.01492
G3 X199.79 Y49.004 I-.339 J1.98 E.3592
; WIPE_START
M204 S10000
G1 X200.15 Y48.995 E-.13681
G1 X200.349 Y49.02 E-.07618
G1 X200.544 Y49.065 E-.07615
G1 X200.917 Y49.211 E-.15209
G1 X201.253 Y49.428 E-.15217
G1 X201.54 Y49.708 E-.15212
G1 X201.561 Y49.739 E-.01449
; WIPE_END
G1 E-.04 F1800
G1 X201.249 Y57.365 Z2 F30000
G1 X198.555 Y123.129 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X198.679 Y123.073 E.00437
G3 X199.76 Y122.795 I1.33 J2.927 E.03606
G3 X201.176 Y123.004 I.238 J3.279 E.0464
G3 X198.395 Y123.22 I-1.167 J2.996 E.55683
G1 X198.503 Y123.158 E.004
G1 X199.041 Y123.361 F30000
G1 F8843.478
G1 X199.107 Y123.342 E.0022
G3 X199.79 Y123.201 I.903 J2.659 E.0225
G3 X200.761 Y123.295 I.227 J2.724 E.03153
G3 X198.847 Y123.445 I-.751 J2.706 E.50446
G1 X198.986 Y123.385 E.00487
G1 X199.531 Y123.648 F30000
G1 F8843.478
G1 X199.821 Y123.607 E.0094
G3 X200.651 Y123.687 I.096 J3.352 E.02689
G3 X199.466 Y123.662 I-.642 J2.314 E.44668
G1 X199.473 Y123.66 E.00021
G1 X199.85 Y123.998 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X200.349 Y124.02 I.154 J2.146 E.01492
G3 X199.79 Y124.004 I-.339 J1.98 E.3592
; WIPE_START
M204 S10000
G1 X200.15 Y123.995 E-.13681
G1 X200.349 Y124.02 E-.07618
G1 X200.734 Y124.129 E-.15213
G1 X201.091 Y124.311 E-.15212
G1 X201.404 Y124.561 E-.15212
G1 X201.557 Y124.744 E-.09064
; WIPE_END
G1 E-.04 F1800
G1 X201.477 Y132.376 Z2 F30000
G1 X200.792 Y197.884 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X200.872 Y197.902 E.00263
G3 X199.6 Y197.807 I-.871 J3.096 E.60861
G1 X199.92 Y197.783 E.01032
G3 X200.559 Y197.831 I.081 J3.216 E.02063
G1 X200.733 Y197.871 E.00576
G1 X200.379 Y198.219 F30000
G1 F8843.478
G1 X200.488 Y198.232 E.00352
G3 X199.651 Y198.211 I-.488 J2.767 E.54055
G1 X199.93 Y198.19 E.00901
G3 X200.21 Y198.197 I.07 J2.808 E.00901
G1 X200.32 Y198.211 E.00356
G1 X200.039 Y198.605 F30000
G1 F8843.478
G1 X200.417 Y198.634 E.01219
G3 X199.701 Y198.616 I-.417 J2.36 E.46116
G1 X199.94 Y198.598 E.0077
G1 X199.979 Y198.601 E.00126
G1 X199.841 Y198.999 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X199.95 Y198.99 E.00324
G3 X199.75 Y199.005 I.05 J2.005 E.36933
G1 X199.781 Y199.003 E.00093
; WIPE_START
M204 S10000
G1 X199.95 Y198.99 E-.0642
G1 X200.349 Y199.02 E-.15211
G1 X200.734 Y199.129 E-.15214
G1 X201.091 Y199.311 E-.15211
G1 X201.404 Y199.561 E-.15213
G1 X201.551 Y199.737 E-.08731
; WIPE_END
G1 E-.04 F1800
G1 X205.987 Y205.948 Z2 F30000
G1 X208.584 Y209.584 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X47.416 Y209.584 E5.18256
G1 X47.416 Y42.416 E5.3755
G1 X208.584 Y42.416 E5.18256
G1 X208.584 Y209.524 E5.37357
G1 X208.991 Y209.991 F30000
G1 F8843.478
G1 X47.009 Y209.991 E5.20874
G1 X47.009 Y42.009 E5.40168
G1 X208.991 Y42.009 E5.20874
G1 X208.991 Y209.931 E5.39975
G1 X209.398 Y210.398 F30000
G1 F8843.478
G1 X46.602 Y210.398 E5.23492
G1 X46.602 Y41.602 E5.42786
G1 X209.398 Y41.602 E5.23492
G1 X209.398 Y210.338 E5.42593
G1 X209.79 Y210.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X46.21 Y210.79 E4.87249
G1 X46.21 Y41.21 E5.05121
G1 X209.79 Y41.21 E4.87249
G1 X209.79 Y210.73 E5.04942
; WIPE_START
M204 S10000
G1 X207.79 Y210.731 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X201.52 Y206.379 Z2 F30000
G1 X197.755 Y203.766 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G2 X199.204 Y204.477 I2.289 J-2.835 E.05233
G1 X194.446 Y209.236 E.21641
G1 X193.965 Y209.236 E.01547
G1 X177.494 Y192.764 E.74904
G1 X176.375 Y192.764 E.03597
G1 X159.904 Y209.236 E.74904
G1 X159.423 Y209.236 E.01547
G1 X142.952 Y192.764 E.74904
G1 X141.833 Y192.764 E.03597
G1 X125.362 Y209.236 E.74904
G1 X124.881 Y209.236 E.01547
G1 X108.41 Y192.764 E.74904
G1 X107.291 Y192.764 E.03597
G1 X90.82 Y209.236 E.74904
G1 X90.339 Y209.236 E.01546
G1 X73.868 Y192.764 E.74904
G1 X72.749 Y192.764 E.03597
G1 X56.278 Y209.236 E.74904
G1 X55.797 Y209.236 E.01546
G1 X47.764 Y201.203 E.36531
G1 X47.764 Y200.479 E.02328
G1 X64.236 Y184.007 E.74904
G1 X64.236 Y183.132 E.02816
G1 X47.764 Y166.661 E.74904
G1 X47.764 Y165.937 E.02328
G1 X64.236 Y149.466 E.74904
G1 X64.236 Y148.59 E.02816
G1 X47.764 Y132.119 E.74904
G1 X47.764 Y131.395 E.02328
G1 X52.499 Y126.66 E.21532
G3 X52.499 Y125.34 I3.518 J-.66 E.04271
G1 X47.764 Y120.605 E.21532
G1 X47.764 Y119.881 E.02328
G1 X64.236 Y103.41 E.74904
M73 P46 R37
G1 X64.236 Y102.534 E.02816
G1 X47.764 Y86.063 E.74904
G1 X47.764 Y85.339 E.02328
G1 X64.236 Y68.868 E.74904
G1 X64.236 Y67.993 E.02816
G1 X47.764 Y51.521 E.74904
G1 X47.764 Y50.797 E.02328
G1 X55.797 Y42.764 E.36531
M73 P46 R36
G1 X56.278 Y42.764 E.01547
G1 X72.749 Y59.236 E.74904
G1 X73.868 Y59.236 E.03597
G1 X90.339 Y42.764 E.74904
G1 X90.82 Y42.764 E.01547
G1 X107.291 Y59.236 E.74904
G1 X108.41 Y59.236 E.03597
G1 X124.881 Y42.764 E.74904
G1 X125.362 Y42.764 E.01546
G1 X141.833 Y59.236 E.74904
G1 X142.952 Y59.236 E.03597
G1 X159.423 Y42.764 E.74904
G1 X159.904 Y42.764 E.01546
G1 X176.375 Y59.236 E.74904
G1 X177.494 Y59.236 E.03597
G1 X193.965 Y42.764 E.74904
G1 X194.446 Y42.764 E.01546
G1 X199.204 Y47.523 E.21641
G3 X200.73 Y47.513 I.79 J3.934 E.04937
G1 X205.479 Y42.764 E.21594
G1 X205.96 Y42.764 E.01546
G1 X208.236 Y45.04 E.10351
G1 X208.236 Y45.764 E.02328
G1 X203.524 Y50.476 E.21428
G3 X203.474 Y51.793 I-3.559 J.525 E.0426
G1 X208.236 Y56.554 E.21654
G1 X208.236 Y57.278 E.02328
G1 X191.764 Y73.749 E.74904
G1 X191.764 Y74.625 E.02816
G1 X208.236 Y91.096 E.74904
G1 X208.236 Y91.82 E.02328
G1 X191.764 Y108.291 E.74904
G1 X191.764 Y109.167 E.02816
G1 X208.236 Y125.638 E.74904
G1 X208.236 Y126.362 E.02328
G1 X191.764 Y142.833 E.74904
G1 X191.764 Y143.709 E.02816
G1 X208.236 Y160.18 E.74904
G1 X208.236 Y160.904 E.02328
G1 X191.764 Y177.375 E.74904
G1 X191.764 Y178.251 E.02816
G1 X208.236 Y194.722 E.74904
G1 X208.236 Y195.446 E.02328
G1 X203.474 Y200.207 E.21654
G3 X203.524 Y201.524 I-3.51 J.791 E.0426
G1 X208.236 Y206.236 E.21428
G1 X208.236 Y206.959 E.02328
G1 X205.96 Y209.236 E.10351
G1 X205.479 Y209.236 E.01547
G1 X200.73 Y204.487 E.21594
G2 X202.195 Y203.809 I-.753 J-3.548 E.05233
; WIPE_START
G1 X201.627 Y204.174 E-.25629
G1 X200.73 Y204.487 E-.36105
G1 X200.996 Y204.753 E-.14266
; WIPE_END
G1 E-.04 F1800
G1 X201.105 Y197.121 Z2 F30000
G1 X202.085 Y128.888 Z2
G1 Z1.6
G1 E.8 F1800
G1 F8843.478
G3 X200.599 Y129.515 I-2.367 J-3.536 E.0522
G1 X208.236 Y137.152 E.34729
G1 X208.236 Y137.876 E.02328
G1 X191.764 Y154.347 E.74904
G1 X191.764 Y155.223 E.02816
G1 X208.236 Y171.694 E.74904
G1 X208.236 Y172.418 E.02328
G1 X191.764 Y188.889 E.74904
G1 X191.764 Y189.764 E.02816
G1 X199.475 Y197.475 E.35066
G3 X200.457 Y197.467 I.541 J6.071 E.0316
G1 X208.236 Y189.689 E.35374
G1 X208.236 Y188.965 E.02328
G1 X191.764 Y172.494 E.74904
G1 X191.764 Y171.618 E.02816
G1 X208.236 Y155.147 E.74904
G1 X208.236 Y154.423 E.02328
G1 X191.764 Y137.952 E.74904
G1 X191.764 Y137.076 E.02816
G1 X199.34 Y129.501 E.3445
G3 X196.486 Y126.597 I.663 J-3.505 E.13931
G1 X191.764 Y131.319 E.21474
G1 X191.764 Y132.195 E.02816
G1 X208.236 Y148.666 E.74904
G1 X208.236 Y149.39 E.02328
G1 X191.764 Y165.861 E.74904
G1 X191.764 Y166.737 E.02816
G1 X208.236 Y183.208 E.74904
G1 X208.236 Y183.932 E.02328
G1 X182.932 Y209.236 E1.15072
G1 X182.451 Y209.236 E.01547
G1 X165.98 Y192.764 E.74904
G1 X164.861 Y192.764 E.03597
G1 X148.39 Y209.236 E.74904
G1 X147.909 Y209.236 E.01547
G1 X131.438 Y192.764 E.74904
G1 X130.319 Y192.764 E.03597
G1 X113.848 Y209.236 E.74904
G1 X113.367 Y209.236 E.01546
G1 X96.896 Y192.764 E.74904
G1 X95.777 Y192.764 E.03597
G1 X79.306 Y209.236 E.74904
G1 X78.825 Y209.236 E.01546
G1 X47.764 Y178.175 E1.41252
G1 X47.764 Y177.451 E.02328
G1 X64.236 Y160.98 E.74904
G1 X64.236 Y160.104 E.02816
G1 X47.764 Y143.633 E.74904
G1 X47.764 Y142.909 E.02328
G1 X64.236 Y126.438 E.74904
G1 X64.236 Y125.562 E.02816
G1 X47.764 Y109.091 E.74904
G1 X47.764 Y108.367 E.02328
G1 X64.236 Y91.896 E.74904
G1 X64.236 Y91.02 E.02816
G1 X47.764 Y74.549 E.74904
G1 X47.764 Y73.825 E.02328
G1 X78.825 Y42.764 E1.41252
G1 X79.306 Y42.764 E.01547
G1 X95.777 Y59.236 E.74904
G1 X96.896 Y59.236 E.03597
G1 X113.367 Y42.764 E.74904
G1 X113.848 Y42.764 E.01546
G1 X130.319 Y59.236 E.74904
G1 X131.438 Y59.236 E.03597
G1 X147.909 Y42.764 E.74904
G1 X148.39 Y42.764 E.01547
G1 X164.861 Y59.236 E.74904
G1 X165.98 Y59.236 E.03597
G1 X182.451 Y42.764 E.74904
G1 X182.932 Y42.764 E.01546
G1 X208.236 Y68.068 E1.15072
G1 X208.236 Y68.792 E.02328
G1 X191.764 Y85.263 E.74904
G1 X191.764 Y86.139 E.02816
G1 X208.236 Y102.61 E.74904
G1 X208.236 Y103.334 E.02328
G1 X191.764 Y119.805 E.74904
G1 X191.764 Y120.681 E.02816
G1 X196.486 Y125.403 E.21474
G3 X199.343 Y122.503 I3.506 J.596 E.13937
G1 X191.764 Y114.924 E.34464
G1 X191.764 Y114.048 E.02816
G1 X208.236 Y97.577 E.74904
G1 X208.236 Y96.853 E.02328
G1 X191.764 Y80.382 E.74904
G1 X191.764 Y79.506 E.02816
G1 X208.236 Y63.035 E.74904
G1 X208.236 Y62.311 E.02328
G1 X200.457 Y54.533 E.35374
G3 X199.475 Y54.525 I-.44 J-6.085 E.0316
G1 X191.764 Y62.236 E.35066
G1 X191.764 Y63.111 E.02816
G1 X208.236 Y79.582 E.74904
G1 X208.236 Y80.306 E.02328
G1 X191.764 Y96.777 E.74904
G1 X191.764 Y97.653 E.02816
G1 X208.236 Y114.124 E.74904
G1 X208.236 Y114.848 E.02328
G1 X200.599 Y122.485 E.34729
G3 X202.085 Y123.112 I-.881 J4.164 E.0522
; WIPE_START
G1 X201.303 Y122.68 E-.3396
G1 X200.599 Y122.485 E-.27778
G1 X200.864 Y122.22 E-.14262
; WIPE_END
G1 E-.04 F1800
G1 X195.575 Y116.717 Z2 F30000
G1 X131.41 Y49.956 Z2
G1 Z1.6
G1 E.8 F1800
G1 F8843.478
G2 X130.597 Y48.562 I-4.038 J1.42 E.05221
G1 X136.395 Y42.764 E.26365
G1 X136.876 Y42.764 E.01546
G1 X153.347 Y59.236 E.74904
G1 X154.466 Y59.236 E.03597
G1 X170.937 Y42.764 E.74904
G1 X171.418 Y42.764 E.01546
G1 X187.889 Y59.236 E.74904
G1 X189.008 Y59.236 E.03597
G1 X196.513 Y51.73 E.34133
G3 X196.466 Y50.542 I4.885 J-.79 E.03833
G1 X188.689 Y42.764 E.35368
G1 X188.208 Y42.764 E.01546
G1 X171.737 Y59.236 E.74904
G1 X170.618 Y59.236 E.03597
G1 X154.147 Y42.764 E.74904
G1 X153.666 Y42.764 E.01546
G1 X137.195 Y59.236 E.74904
G1 X136.076 Y59.236 E.03597
G1 X130.439 Y53.599 E.25635
G3 X125.562 Y53.598 I-2.438 J-2.653 E.17228
G1 X119.924 Y59.236 E.25638
G1 X118.805 Y59.236 E.03597
G1 X102.334 Y42.764 E.74904
G1 X101.853 Y42.764 E.01546
G1 X85.382 Y59.236 E.74904
G1 X84.263 Y59.236 E.03597
G1 X67.792 Y42.764 E.74904
G1 X67.311 Y42.764 E.01547
G1 X59.533 Y50.542 E.35371
G3 X59.489 Y51.732 I-3.688 J.459 E.03846
G1 X66.992 Y59.236 E.34121
G1 X68.111 Y59.236 E.03597
G1 X84.582 Y42.764 E.74904
G1 X85.063 Y42.764 E.01547
G1 X101.534 Y59.236 E.74904
G1 X102.653 Y59.236 E.03597
G1 X119.124 Y42.764 E.74904
G1 X119.605 Y42.764 E.01546
G1 X125.4 Y48.56 E.26354
G3 X126.744 Y47.666 I2.633 J2.503 E.05233
; WIPE_START
G1 X125.918 Y48.104 E-.35532
G1 X125.4 Y48.56 E-.26205
G1 X125.135 Y48.294 E-.14263
; WIPE_END
G1 E-.04 F1800
G1 X119.872 Y53.822 Z2 F30000
G1 X53.917 Y123.105 Z2
G1 Z1.6
G1 E.8 F1800
G1 F8843.478
G1 X53.918 Y123.104 E.00002
G3 X55.409 Y122.493 I2.043 J2.861 E.0523
G1 X47.764 Y114.848 E.34766
G1 X47.764 Y114.124 E.02328
G1 X64.236 Y97.653 E.74904
G1 X64.236 Y96.777 E.02816
G1 X47.764 Y80.306 E.74904
G1 X47.764 Y79.582 E.02328
G1 X64.236 Y63.111 E.74904
G1 X64.236 Y62.236 E.02816
G1 X56.524 Y54.524 E.35067
G3 X55.54 Y54.536 I-.576 J-7.024 E.03169
G1 X47.764 Y62.311 E.35359
G1 X47.764 Y63.035 E.02328
G1 X64.236 Y79.506 E.74904
G1 X64.236 Y80.382 E.02816
G1 X47.764 Y96.853 E.74904
G1 X47.764 Y97.577 E.02328
G1 X64.236 Y114.048 E.74904
G1 X64.236 Y114.924 E.02816
G1 X56.662 Y122.497 E.34441
G3 X59.513 Y125.404 I-.669 J3.507 E.13929
G1 X64.236 Y120.681 E.21478
G1 X64.236 Y119.805 E.02816
G1 X47.764 Y103.334 E.74904
G1 X47.764 Y102.61 E.02328
G1 X64.236 Y86.139 E.74904
G1 X64.236 Y85.263 E.02816
G1 X47.764 Y68.792 E.74904
G1 X47.764 Y68.068 E.02328
G1 X73.068 Y42.764 E1.15072
G1 X73.549 Y42.764 E.01547
G1 X90.02 Y59.236 E.74904
G1 X91.139 Y59.236 E.03597
G1 X107.61 Y42.764 E.74904
G1 X108.091 Y42.764 E.01547
G1 X124.562 Y59.236 E.74904
G1 X125.681 Y59.236 E.03597
G1 X142.152 Y42.764 E.74904
G1 X142.633 Y42.764 E.01546
G1 X159.104 Y59.236 E.74904
G1 X160.223 Y59.236 E.03597
G1 X176.694 Y42.764 E.74904
G1 X177.175 Y42.764 E.01546
G1 X208.236 Y73.825 E1.41252
G1 X208.236 Y74.549 E.02328
G1 X191.764 Y91.02 E.74904
G1 X191.764 Y91.896 E.02816
G1 X208.236 Y108.367 E.74904
G1 X208.236 Y109.091 E.02328
G1 X191.764 Y125.562 E.74904
G1 X191.764 Y126.438 E.02816
G1 X208.236 Y142.909 E.74904
G1 X208.236 Y143.633 E.02328
G1 X191.764 Y160.104 E.74904
G1 X191.764 Y160.98 E.02816
G1 X208.236 Y177.451 E.74904
G1 X208.236 Y178.175 E.02328
G1 X177.175 Y209.236 E1.41252
G1 X176.694 Y209.236 E.01547
G1 X160.223 Y192.764 E.74904
G1 X159.104 Y192.764 E.03597
G1 X142.633 Y209.236 E.74904
G1 X142.152 Y209.236 E.01546
G1 X125.681 Y192.764 E.74904
G1 X124.562 Y192.764 E.03597
G1 X108.091 Y209.236 E.74904
G1 X107.61 Y209.236 E.01547
G1 X91.139 Y192.764 E.74904
G1 X90.02 Y192.764 E.03597
G1 X73.549 Y209.236 E.74904
G1 X73.068 Y209.236 E.01546
G1 X47.764 Y183.932 E1.15072
G1 X47.764 Y183.208 E.02328
G1 X64.236 Y166.737 E.74904
G1 X64.236 Y165.861 E.02816
G1 X47.764 Y149.39 E.74904
G1 X47.764 Y148.666 E.02328
G1 X64.236 Y132.195 E.74904
G1 X64.236 Y131.319 E.02816
G1 X59.513 Y126.596 E.21478
G3 X56.662 Y129.503 I-3.52 J-.601 E.13929
G1 X64.236 Y137.076 E.34441
G1 X64.236 Y137.952 E.02816
G1 X47.764 Y154.423 E.74904
G1 X47.764 Y155.147 E.02328
G1 X64.236 Y171.618 E.74904
G1 X64.236 Y172.494 E.02816
G1 X47.764 Y188.965 E.74904
G1 X47.764 Y189.689 E.02328
G1 X55.54 Y197.464 E.35359
G3 X56.524 Y197.476 I.41 J7.025 E.03169
G1 X64.236 Y189.764 E.35067
G1 X64.236 Y188.889 E.02816
G1 X47.764 Y172.418 E.74904
G1 X47.764 Y171.694 E.02328
G1 X64.236 Y155.223 E.74904
G1 X64.236 Y154.347 E.02816
G1 X47.764 Y137.876 E.74904
G1 X47.764 Y137.152 E.02328
G1 X55.404 Y129.512 E.34743
G3 X53.914 Y128.893 I.87 J-4.197 E.05221
; WIPE_START
G1 X54.533 Y129.251 E-.27174
G1 X55.404 Y129.512 E-.34566
G1 X55.139 Y129.777 E-.14259
; WIPE_END
G1 E-.04 F1800
G1 X55.002 Y137.409 Z2 F30000
G1 X53.806 Y203.807 Z2
G1 Z1.6
G1 E.8 F1800
G1 F8843.478
G2 X55.269 Y204.488 I2.473 J-3.397 E.0522
G1 X50.521 Y209.236 E.21589
G1 X50.04 Y209.236 E.01546
G1 X47.764 Y206.96 E.1035
G1 X47.764 Y206.235 E.02328
G1 X52.473 Y201.527 E.21411
G3 X52.526 Y200.207 I4.76 J-.469 E.04262
G1 X47.764 Y195.446 E.21654
G1 X47.764 Y194.722 E.02328
G1 X64.236 Y178.251 E.74904
G1 X64.236 Y177.375 E.02816
G1 X47.764 Y160.904 E.74904
G1 X47.764 Y160.18 E.02328
G1 X64.236 Y143.709 E.74904
G1 X64.236 Y142.833 E.02816
G1 X47.764 Y126.362 E.74904
G1 X47.764 Y125.638 E.02328
G1 X64.236 Y109.167 E.74904
G1 X64.236 Y108.291 E.02816
G1 X47.764 Y91.82 E.74904
G1 X47.764 Y91.096 E.02328
G1 X64.236 Y74.625 E.74904
G1 X64.236 Y73.749 E.02816
G1 X47.764 Y57.278 E.74904
G1 X47.764 Y56.554 E.02328
G1 X52.526 Y51.793 E.21654
G3 X52.473 Y50.473 I4.706 J-.851 E.04262
G1 X47.764 Y45.764 E.21411
G1 X47.764 Y45.04 E.02328
G1 X50.04 Y42.764 E.1035
G1 X50.521 Y42.764 E.01547
G1 X55.27 Y47.513 E.21594
G3 X56.792 Y47.527 I.714 J5.146 E.04912
G1 X61.554 Y42.764 E.21658
G1 X62.035 Y42.764 E.01547
G1 X78.506 Y59.236 E.74904
G1 X79.625 Y59.236 E.03597
G1 X96.096 Y42.764 E.74904
G1 X96.577 Y42.764 E.01547
G1 X113.048 Y59.236 E.74904
G1 X114.167 Y59.236 E.03597
G1 X130.638 Y42.764 E.74904
G1 X131.119 Y42.764 E.01547
G1 X147.59 Y59.236 E.74904
G1 X148.709 Y59.236 E.03597
G1 X165.18 Y42.764 E.74904
G1 X165.661 Y42.764 E.01546
G1 X182.132 Y59.236 E.74904
G1 X183.251 Y59.236 E.03597
G1 X199.722 Y42.764 E.74904
G1 X200.203 Y42.764 E.01546
G1 X208.236 Y50.797 E.36531
G1 X208.236 Y51.521 E.02328
G1 X191.764 Y67.993 E.74904
G1 X191.764 Y68.868 E.02816
G1 X208.236 Y85.339 E.74904
G1 X208.236 Y86.063 E.02328
G1 X191.764 Y102.534 E.74904
G1 X191.764 Y103.41 E.02816
G1 X208.236 Y119.881 E.74904
G1 X208.236 Y120.605 E.02328
G1 X203.503 Y125.338 E.21523
G3 X203.503 Y126.662 I-4.717 J.662 E.04272
G1 X208.236 Y131.395 E.21523
G1 X208.236 Y132.119 E.02328
G1 X191.764 Y148.59 E.74904
G1 X191.764 Y149.466 E.02816
G1 X208.236 Y165.937 E.74904
G1 X208.236 Y166.661 E.02328
G1 X191.764 Y183.132 E.74904
G1 X191.764 Y184.008 E.02816
G1 X208.236 Y200.479 E.74904
G1 X208.236 Y201.203 E.02328
G1 X200.203 Y209.236 E.36531
G1 X199.722 Y209.236 E.01547
G1 X183.251 Y192.764 E.74904
G1 X182.132 Y192.764 E.03597
G1 X165.661 Y209.236 E.74904
G1 X165.18 Y209.236 E.01547
G1 X148.709 Y192.764 E.74904
G1 X147.59 Y192.764 E.03597
G1 X131.119 Y209.236 E.74904
G1 X130.638 Y209.236 E.01546
G1 X114.167 Y192.764 E.74904
G1 X113.048 Y192.764 E.03597
G1 X96.577 Y209.236 E.74904
G1 X96.096 Y209.236 E.01546
G1 X79.625 Y192.764 E.74904
G1 X78.506 Y192.764 E.03597
G1 X62.035 Y209.236 E.74904
G1 X61.554 Y209.236 E.01546
G1 X56.792 Y204.473 E.21658
G2 X58.244 Y203.77 I-1.09 J-4.104 E.0522
G1 X124.594 Y202.043 F30000
G1 F8843.478
G2 X125.4 Y203.44 I4.025 J-1.391 E.0522
G1 X119.605 Y209.236 E.26354
G1 X119.124 Y209.236 E.01546
G1 X102.653 Y192.764 E.74904
G1 X101.534 Y192.764 E.03597
G1 X85.063 Y209.236 E.74904
G1 X84.582 Y209.236 E.01546
G1 X68.111 Y192.764 E.74904
G1 X66.992 Y192.764 E.03597
G1 X59.489 Y200.268 E.34121
M73 P47 R36
G3 X59.533 Y201.458 I-3.644 J.731 E.03846
G1 X67.311 Y209.236 E.35371
G1 X67.792 Y209.236 E.01546
G1 X84.263 Y192.764 E.74904
G1 X85.382 Y192.764 E.03597
G1 X101.853 Y209.236 E.74904
G1 X102.334 Y209.236 E.01546
G1 X118.805 Y192.764 E.74904
G1 X119.924 Y192.764 E.03597
G1 X125.562 Y198.402 E.25638
G3 X130.439 Y198.401 I2.439 J2.652 E.17228
G1 X136.076 Y192.764 E.25635
G1 X137.195 Y192.764 E.03597
G1 X153.666 Y209.236 E.74904
G1 X154.147 Y209.236 E.01546
G1 X170.618 Y192.764 E.74904
G1 X171.737 Y192.764 E.03597
G1 X188.208 Y209.236 E.74904
G1 X188.689 Y209.236 E.01547
G1 X196.466 Y201.458 E.35368
G3 X196.513 Y200.27 I4.931 J-.398 E.03833
G1 X189.008 Y192.764 E.34133
G1 X187.889 Y192.764 E.03597
G1 X171.418 Y209.236 E.74904
G1 X170.937 Y209.236 E.01547
G1 X154.466 Y192.764 E.74904
G1 X153.347 Y192.764 E.03597
G1 X136.876 Y209.236 E.74904
G1 X136.395 Y209.236 E.01546
G1 X130.597 Y203.438 E.26365
G3 X129.257 Y204.336 I-2.973 J-2.99 E.0522
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X129.935 Y203.996 E-.28822
G1 X130.597 Y203.438 E-.32913
G1 X130.863 Y203.703 E-.14265
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/58
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
G1 X126.564 Y198.125
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X126.679 Y198.073 E.00408
G3 X127.772 Y197.794 I1.33 J2.927 E.03644
G3 X129.176 Y198.004 I.226 J3.281 E.04601
G3 X126.395 Y198.22 I-1.167 J2.996 E.55683
G1 X126.511 Y198.154 E.00429
G1 X127.049 Y198.358 F30000
G1 F8843.478
G1 X127.107 Y198.342 E.00192
G3 X127.802 Y198.2 I.903 J2.659 E.02288
G3 X128.761 Y198.295 I.216 J2.722 E.03115
G3 X126.847 Y198.445 I-.751 J2.706 E.50446
G1 X126.994 Y198.381 E.00516
G1 X127.541 Y198.647 F30000
G1 F8843.478
G1 X127.833 Y198.606 E.00947
G3 X128.651 Y198.687 I.077 J3.396 E.02651
G3 X127.466 Y198.662 I-.642 J2.314 E.44668
G1 X127.482 Y198.658 E.00051
G1 X127.857 Y198.998 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X127.862 Y198.997 E.00014
G3 X128.349 Y199.02 I.141 J2.154 E.01456
G3 X127.554 Y199.044 I-.339 J1.98 E.35204
G1 X127.798 Y199.007 E.00736
; WIPE_START
M204 S10000
G1 X127.862 Y198.997 E-.02464
G1 X128.15 Y198.995 E-.10956
G1 X128.349 Y199.02 E-.07618
G1 X128.544 Y199.065 E-.07616
G1 X128.917 Y199.211 E-.15209
G1 X129.253 Y199.428 E-.15216
G1 X129.54 Y199.708 E-.15211
G1 X129.565 Y199.745 E-.01711
; WIPE_END
G1 E-.04 F1800
G1 X121.935 Y199.556 Z2.2 F30000
G1 X57.019 Y197.952 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X57.176 Y198.004 E.0053
G3 X55.772 Y197.794 I-1.167 J2.996 E.60356
G3 X56.871 Y197.904 I.226 J3.281 E.0357
G1 X56.962 Y197.934 E.00308
G1 X56.573 Y198.252 F30000
G1 F8843.478
G1 X56.761 Y198.295 E.00621
G3 X55.802 Y198.2 I-.751 J2.706 E.53633
G3 X56.488 Y198.232 I.216 J2.722 E.02214
G1 X56.514 Y198.238 E.00087
G1 X56.131 Y198.604 F30000
G1 F8843.478
G1 X56.179 Y198.616 E.00158
G3 X56.651 Y198.687 I-.269 J3.386 E.01537
G3 X55.833 Y198.606 I-.642 J2.314 E.4586
G1 X56.071 Y198.605 E.00766
G1 X55.857 Y198.998 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X55.862 Y198.997 E.00014
G3 X56.349 Y199.02 I.141 J2.154 E.01456
G3 X55.554 Y199.044 I-.339 J1.98 E.35204
G1 X55.798 Y199.007 E.00736
; WIPE_START
M204 S10000
G1 X55.862 Y198.997 E-.02461
G1 X56.15 Y198.995 E-.10956
G1 X56.349 Y199.02 E-.07617
G1 X56.544 Y199.065 E-.07616
G1 X56.917 Y199.211 E-.15208
G1 X57.253 Y199.428 E-.15216
G1 X57.54 Y199.708 E-.15211
G1 X57.565 Y199.745 E-.01715
; WIPE_END
G1 E-.04 F1800
G1 X57.657 Y192.113 Z2.2 F30000
G1 X58.43 Y128.106 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X58.25 Y128.306 E.00866
G3 X55.772 Y122.794 I-2.241 J-2.306 E.39687
G3 X57.176 Y123.004 I.226 J3.281 E.04602
G3 X58.474 Y128.065 I-1.167 J2.996 E.1961
G1 X58.13 Y127.832 F30000
G1 F8843.478
G1 X57.967 Y128.016 E.00792
G3 X55.802 Y123.2 I-1.956 J-2.015 E.34664
G3 X56.761 Y123.295 I.216 J2.722 E.03115
G3 X58.174 Y127.792 I-.751 J2.706 E.17986
G1 X57.817 Y127.568 F30000
G1 F8843.478
G1 X57.501 Y127.882 E.01432
G3 X55.833 Y123.606 I-1.492 J-1.881 E.28871
G3 X56.651 Y123.687 I.077 J3.398 E.0265
G3 X57.861 Y127.529 I-.642 J2.314 E.15365
G1 X57.56 Y127.263 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X57.545 Y127.296 E.00109
G3 X55.862 Y123.997 I-1.534 J-1.296 E.23555
G3 X56.349 Y124.02 I.141 J2.154 E.01456
G3 X57.772 Y126.965 I-.339 J1.98 E.11381
G1 X57.595 Y127.214 E.0091
; WIPE_START
M204 S10000
G1 X57.545 Y127.296 E-.03659
G1 X57.253 Y127.572 E-.15235
G1 X57.091 Y127.689 E-.07615
G1 X56.735 Y127.871 E-.15212
G1 X56.349 Y127.98 E-.15213
G1 X55.95 Y128.01 E-.15212
G1 X55.849 Y127.997 E-.03855
; WIPE_END
G1 E-.04 F1800
G1 X62.743 Y131.273 Z2.2 F30000
G1 X191.416 Y192.416 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X64.584 Y192.416 E4.07847
G1 X64.584 Y59.584 E4.27141
G1 X191.416 Y59.584 E4.07847
G1 X191.416 Y192.356 E4.26948
G1 X191.009 Y192.009 F30000
G1 F8843.478
G1 X64.991 Y192.009 E4.05229
G1 X64.991 Y59.991 E4.24523
G1 X191.009 Y59.991 E4.05229
G1 X191.009 Y191.949 E4.2433
G1 X190.602 Y191.602 F30000
G1 F8843.478
G1 X65.398 Y191.602 E4.02611
G1 X65.398 Y60.398 E4.21905
G1 X190.602 Y60.398 E4.02611
G1 X190.602 Y191.542 E4.21712
G1 X190.21 Y191.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X65.79 Y191.21 E3.70605
G1 X65.79 Y60.79 E3.88477
G1 X190.21 Y60.79 E3.70605
G1 X190.21 Y191.15 E3.88298
; WIPE_START
M204 S10000
G1 X188.21 Y191.151 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X183.054 Y185.523 Z2.2 F30000
G1 X57.019 Y47.952 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X57.176 Y48.004 E.00531
G3 X55.772 Y47.794 I-1.167 J2.996 E.60356
G3 X56.871 Y47.904 I.226 J3.281 E.0357
G1 X56.962 Y47.934 E.00308
G1 X56.573 Y48.252 F30000
G1 F8843.478
G1 X56.761 Y48.295 E.00622
G3 X55.802 Y48.2 I-.751 J2.706 E.53633
G3 X56.488 Y48.232 I.216 J2.722 E.02214
G1 X56.514 Y48.238 E.00086
G1 X56.131 Y48.604 F30000
G1 F8843.478
G1 X56.179 Y48.616 E.00158
G3 X56.651 Y48.687 I-.269 J3.387 E.01537
G3 X55.833 Y48.606 I-.642 J2.314 E.45861
G1 X56.071 Y48.605 E.00766
G1 X55.863 Y48.997 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X56.15 Y48.997 E.00856
G3 X56.349 Y49.02 I-.147 J2.153 E.00597
G3 X55.803 Y49.002 I-.339 J1.98 E.35958
; WIPE_START
M204 S10000
G1 X56.15 Y48.997 E-.13187
G1 X56.349 Y49.02 E-.07615
G1 X56.734 Y49.129 E-.15212
G1 X57.091 Y49.311 E-.15212
G1 X57.404 Y49.561 E-.1521
G1 X57.565 Y49.754 E-.09565
; WIPE_END
G1 E-.04 F1800
G1 X65.195 Y49.561 Z2.2 F30000
G1 X129.019 Y47.952 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X129.176 Y48.005 E.00531
G3 X127.772 Y47.794 I-1.167 J2.996 E.60356
G3 X128.871 Y47.904 I.226 J3.281 E.0357
G1 X128.962 Y47.934 E.00308
G1 X128.573 Y48.252 F30000
G1 F8843.478
G1 X128.761 Y48.295 E.00621
G3 X127.802 Y48.2 I-.751 J2.706 E.53633
G3 X128.488 Y48.232 I.216 J2.723 E.02214
G1 X128.514 Y48.238 E.00087
G1 X128.131 Y48.604 F30000
G1 F8843.478
G1 X128.179 Y48.616 E.00158
G3 X128.651 Y48.687 I-.269 J3.388 E.01537
G3 X127.833 Y48.606 I-.642 J2.314 E.45861
G1 X128.071 Y48.605 E.00767
G1 X127.863 Y48.997 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.15 Y48.997 E.00855
G3 X128.349 Y49.02 I-.147 J2.153 E.00597
G3 X127.803 Y49.002 I-.339 J1.98 E.35959
; WIPE_START
M204 S10000
G1 X128.15 Y48.997 E-.13179
G1 X128.349 Y49.02 E-.07616
G1 X128.734 Y49.129 E-.15212
G1 X129.091 Y49.311 E-.15212
G1 X129.404 Y49.561 E-.1521
G1 X129.566 Y49.754 E-.09572
; WIPE_END
G1 E-.04 F1800
G1 X137.196 Y49.561 Z2.2 F30000
G1 X201.02 Y47.952 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X201.176 Y48.005 E.0053
G3 X199.772 Y47.794 I-1.167 J2.996 E.60356
G3 X200.871 Y47.904 I.226 J3.281 E.0357
G1 X200.962 Y47.934 E.00309
G1 X200.573 Y48.252 F30000
G1 F8843.478
G1 X200.761 Y48.295 E.00621
G3 X199.802 Y48.2 I-.751 J2.706 E.53633
G3 X200.488 Y48.232 I.216 J2.723 E.02214
G1 X200.514 Y48.238 E.00087
G1 X200.131 Y48.604 F30000
G1 F8843.478
G1 X200.179 Y48.616 E.00157
M73 P47 R35
G3 X200.651 Y48.687 I-.269 J3.388 E.01537
G3 X199.833 Y48.606 I-.642 J2.314 E.45861
G1 X200.071 Y48.605 E.00767
G1 X199.863 Y48.997 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X200.15 Y48.997 E.00855
G3 X200.349 Y49.02 I-.147 J2.153 E.00597
G3 X199.803 Y49.002 I-.339 J1.98 E.35958
; WIPE_START
M204 S10000
G1 X200.15 Y48.997 E-.13185
G1 X200.349 Y49.02 E-.07615
G1 X200.544 Y49.065 E-.07614
G1 X200.917 Y49.211 E-.15209
G1 X201.253 Y49.428 E-.15214
G1 X201.54 Y49.708 E-.15213
G1 X201.569 Y49.75 E-.01951
; WIPE_END
G1 E-.04 F1800
G1 X201.512 Y57.382 Z2.2 F30000
G1 X201.019 Y122.952 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X201.176 Y123.005 E.00531
G3 X199.772 Y122.794 I-1.167 J2.996 E.60356
G3 X200.871 Y122.904 I.226 J3.281 E.03569
G1 X200.962 Y122.934 E.00308
G1 X200.573 Y123.252 F30000
G1 F8843.478
G1 X200.761 Y123.295 E.00621
G3 X199.802 Y123.2 I-.751 J2.706 E.53633
G3 X200.488 Y123.232 I.216 J2.722 E.02214
G1 X200.514 Y123.238 E.00086
G1 X200.131 Y123.604 F30000
G1 F8843.478
G1 X200.179 Y123.616 E.00158
G3 X200.651 Y123.687 I-.269 J3.388 E.01537
G3 X199.833 Y123.606 I-.642 J2.314 E.45861
G1 X200.071 Y123.605 E.00766
G1 X199.863 Y123.997 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X200.15 Y123.997 E.00856
G3 X200.349 Y124.02 I-.147 J2.153 E.00597
G3 X199.803 Y124.002 I-.339 J1.98 E.35958
; WIPE_START
M204 S10000
G1 X200.15 Y123.997 E-.13186
G1 X200.349 Y124.02 E-.07614
G1 X200.734 Y124.129 E-.15212
G1 X201.091 Y124.311 E-.15212
G1 X201.404 Y124.561 E-.1521
G1 X201.565 Y124.754 E-.09567
; WIPE_END
G1 E-.04 F1800
G1 X201.509 Y132.386 Z2.2 F30000
G1 X201.019 Y197.952 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X201.176 Y198.005 E.0053
G3 X199.772 Y197.794 I-1.167 J2.996 E.60356
G3 X200.871 Y197.904 I.226 J3.281 E.0357
G1 X200.962 Y197.934 E.00308
G1 X200.573 Y198.252 F30000
G1 F8843.478
G1 X200.761 Y198.295 E.00621
G3 X199.802 Y198.2 I-.751 J2.706 E.53633
G3 X200.488 Y198.232 I.216 J2.722 E.02214
G1 X200.514 Y198.238 E.00087
G1 X200.131 Y198.604 F30000
G1 F8843.478
G1 X200.179 Y198.616 E.00158
G3 X200.651 Y198.687 I-.269 J3.387 E.01537
G3 X199.833 Y198.606 I-.642 J2.314 E.45861
G1 X200.071 Y198.605 E.00767
G1 X199.858 Y198.998 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X199.862 Y198.997 E.00013
G3 X200.349 Y199.02 I.141 J2.154 E.01456
G3 X199.554 Y199.044 I-.339 J1.98 E.35204
G1 X199.798 Y199.007 E.00738
; WIPE_START
M204 S10000
G1 X199.862 Y198.997 E-.02442
G1 X200.15 Y198.995 E-.10956
G1 X200.349 Y199.02 E-.07618
G1 X200.544 Y199.065 E-.07615
G1 X200.917 Y199.211 E-.15209
G1 X201.253 Y199.428 E-.15214
G1 X201.54 Y199.708 E-.15213
G1 X201.566 Y199.746 E-.01734
; WIPE_END
G1 E-.04 F1800
G1 X205.998 Y205.959 Z2.2 F30000
G1 X208.584 Y209.584 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X47.416 Y209.584 E5.18256
G1 X47.416 Y42.416 E5.3755
G1 X208.584 Y42.416 E5.18256
G1 X208.584 Y209.524 E5.37357
G1 X208.991 Y209.991 F30000
G1 F8843.478
G1 X47.009 Y209.991 E5.20874
G1 X47.009 Y42.009 E5.40168
G1 X208.991 Y42.009 E5.20874
G1 X208.991 Y209.931 E5.39975
G1 X209.398 Y210.398 F30000
G1 F8843.478
G1 X46.602 Y210.398 E5.23492
G1 X46.602 Y41.602 E5.42786
G1 X209.398 Y41.602 E5.23492
G1 X209.398 Y210.338 E5.42593
G1 X209.79 Y210.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X46.21 Y210.79 E4.87249
G1 X46.21 Y41.21 E5.05121
G1 X209.79 Y41.21 E4.87249
G1 X209.79 Y210.73 E5.04942
; WIPE_START
M204 S10000
G1 X207.79 Y210.731 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X202.992 Y204.795 Z2.2 F30000
G1 X202.195 Y203.809 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X200.73 Y204.487 I-2.218 J-2.871 E.05233
G1 X205.479 Y209.236 E.21594
G1 X205.96 Y209.236 E.01547
G1 X208.236 Y206.959 E.10351
G1 X208.236 Y206.236 E.02328
G1 X203.524 Y201.524 E.21428
G2 X203.474 Y200.207 I-3.559 J-.525 E.0426
G1 X208.236 Y195.446 E.21654
G1 X208.236 Y194.722 E.02328
G1 X191.764 Y178.251 E.74904
G1 X191.764 Y177.375 E.02816
G1 X208.236 Y160.904 E.74904
G1 X208.236 Y160.18 E.02328
G1 X191.764 Y143.709 E.74904
G1 X191.764 Y142.833 E.02816
G1 X208.236 Y126.362 E.74904
G1 X208.236 Y125.638 E.02328
G1 X191.764 Y109.167 E.74904
G1 X191.764 Y108.291 E.02816
G1 X208.236 Y91.82 E.74904
G1 X208.236 Y91.096 E.02328
G1 X191.764 Y74.625 E.74904
G1 X191.764 Y73.749 E.02816
G1 X208.236 Y57.278 E.74904
G1 X208.236 Y56.554 E.02328
G1 X203.474 Y51.793 E.21654
G2 X203.524 Y50.476 I-3.509 J-.791 E.0426
G1 X208.236 Y45.764 E.21428
G1 X208.236 Y45.04 E.02328
G1 X205.96 Y42.764 E.10351
G1 X205.479 Y42.764 E.01546
G1 X200.73 Y47.513 E.21594
G2 X199.204 Y47.523 I-.736 J3.919 E.04937
G1 X194.446 Y42.764 E.21641
G1 X193.965 Y42.764 E.01546
G1 X177.494 Y59.236 E.74904
G1 X176.375 Y59.236 E.03597
M73 P48 R35
G1 X159.904 Y42.764 E.74904
G1 X159.423 Y42.764 E.01546
G1 X142.952 Y59.236 E.74904
G1 X141.833 Y59.236 E.03597
G1 X125.362 Y42.764 E.74904
G1 X124.881 Y42.764 E.01546
G1 X108.41 Y59.236 E.74904
G1 X107.291 Y59.236 E.03597
G1 X90.82 Y42.764 E.74904
G1 X90.339 Y42.764 E.01547
G1 X73.868 Y59.236 E.74904
G1 X72.749 Y59.236 E.03597
G1 X56.278 Y42.764 E.74904
G1 X55.797 Y42.764 E.01547
G1 X47.764 Y50.797 E.36531
G1 X47.764 Y51.521 E.02328
G1 X64.236 Y67.993 E.74904
G1 X64.236 Y68.868 E.02816
G1 X47.764 Y85.339 E.74904
G1 X47.764 Y86.063 E.02328
G1 X64.236 Y102.534 E.74904
G1 X64.236 Y103.41 E.02816
G1 X47.764 Y119.881 E.74904
G1 X47.764 Y120.605 E.02328
G1 X52.499 Y125.34 E.21532
G2 X52.499 Y126.66 I3.518 J.66 E.04271
G1 X47.764 Y131.395 E.21532
G1 X47.764 Y132.119 E.02328
G1 X64.236 Y148.59 E.74904
G1 X64.236 Y149.466 E.02816
G1 X47.764 Y165.937 E.74904
G1 X47.764 Y166.661 E.02328
G1 X64.236 Y183.132 E.74904
G1 X64.236 Y184.007 E.02816
G1 X47.764 Y200.479 E.74904
G1 X47.764 Y201.203 E.02328
G1 X55.797 Y209.236 E.36531
G1 X56.278 Y209.236 E.01546
G1 X72.749 Y192.764 E.74904
G1 X73.868 Y192.764 E.03597
G1 X90.339 Y209.236 E.74904
G1 X90.82 Y209.236 E.01546
G1 X107.291 Y192.764 E.74904
G1 X108.41 Y192.764 E.03597
G1 X124.881 Y209.236 E.74904
G1 X125.362 Y209.236 E.01547
G1 X141.833 Y192.764 E.74904
G1 X142.952 Y192.764 E.03597
G1 X159.423 Y209.236 E.74904
G1 X159.904 Y209.236 E.01547
G1 X176.375 Y192.764 E.74904
G1 X177.494 Y192.764 E.03597
G1 X193.965 Y209.236 E.74904
G1 X194.446 Y209.236 E.01547
G1 X199.204 Y204.477 E.21641
G3 X197.755 Y203.766 I.84 J-3.546 E.05233
G1 X129.257 Y204.336 F30000
G1 F8843.478
G2 X130.597 Y203.438 I-1.631 J-3.886 E.0522
G1 X136.395 Y209.236 E.26365
G1 X136.876 Y209.236 E.01546
G1 X153.347 Y192.764 E.74904
G1 X154.466 Y192.764 E.03597
G1 X170.937 Y209.236 E.74904
G1 X171.418 Y209.236 E.01547
G1 X187.889 Y192.764 E.74904
G1 X189.008 Y192.764 E.03597
G1 X196.513 Y200.27 E.34133
G2 X196.466 Y201.458 I4.884 J.79 E.03833
G1 X188.689 Y209.236 E.35368
G1 X188.208 Y209.236 E.01547
G1 X171.737 Y192.764 E.74904
G1 X170.618 Y192.764 E.03597
G1 X154.147 Y209.236 E.74904
G1 X153.666 Y209.236 E.01546
G1 X137.195 Y192.764 E.74904
G1 X136.076 Y192.764 E.03597
G1 X130.439 Y198.401 E.25635
G2 X125.562 Y198.402 I-2.438 J2.627 E.17249
G1 X119.924 Y192.764 E.25638
G1 X118.805 Y192.764 E.03597
G1 X102.334 Y209.236 E.74904
G1 X101.853 Y209.236 E.01546
G1 X85.382 Y192.764 E.74904
G1 X84.263 Y192.764 E.03597
G1 X67.792 Y209.236 E.74904
G1 X67.311 Y209.236 E.01546
G1 X59.533 Y201.458 E.35371
G2 X59.489 Y200.268 I-3.688 J-.459 E.03846
G1 X66.992 Y192.764 E.34121
G1 X68.111 Y192.764 E.03597
G1 X84.582 Y209.236 E.74904
G1 X85.063 Y209.236 E.01546
G1 X101.534 Y192.764 E.74904
G1 X102.653 Y192.764 E.03597
G1 X119.124 Y209.236 E.74904
G1 X119.605 Y209.236 E.01546
G1 X125.4 Y203.44 E.26354
G3 X124.594 Y202.043 I3.216 J-2.787 E.0522
G1 X58.244 Y203.77 F30000
G1 F8843.478
G3 X56.792 Y204.473 I-2.542 J-3.401 E.0522
G1 X61.554 Y209.236 E.21658
G1 X62.035 Y209.236 E.01546
G1 X78.506 Y192.764 E.74904
G1 X79.625 Y192.764 E.03597
G1 X96.096 Y209.236 E.74904
G1 X96.577 Y209.236 E.01546
G1 X113.048 Y192.764 E.74904
G1 X114.167 Y192.764 E.03597
G1 X130.638 Y209.236 E.74904
G1 X131.119 Y209.236 E.01546
G1 X147.59 Y192.764 E.74904
G1 X148.709 Y192.764 E.03597
G1 X165.18 Y209.236 E.74904
G1 X165.661 Y209.236 E.01547
G1 X182.132 Y192.764 E.74904
G1 X183.251 Y192.764 E.03597
G1 X199.722 Y209.236 E.74904
G1 X200.203 Y209.236 E.01547
G1 X208.236 Y201.203 E.36531
G1 X208.236 Y200.479 E.02328
G1 X191.764 Y184.008 E.74904
G1 X191.764 Y183.132 E.02816
G1 X208.236 Y166.661 E.74904
G1 X208.236 Y165.937 E.02328
G1 X191.764 Y149.466 E.74904
G1 X191.764 Y148.59 E.02816
G1 X208.236 Y132.119 E.74904
G1 X208.236 Y131.395 E.02328
G1 X203.503 Y126.662 E.21523
G2 X203.503 Y125.338 I-4.717 J-.662 E.04272
G1 X208.236 Y120.605 E.21523
G1 X208.236 Y119.881 E.02328
G1 X191.764 Y103.41 E.74904
G1 X191.764 Y102.534 E.02816
G1 X208.236 Y86.063 E.74904
G1 X208.236 Y85.339 E.02328
G1 X191.764 Y68.868 E.74904
G1 X191.764 Y67.993 E.02816
G1 X208.236 Y51.521 E.74904
G1 X208.236 Y50.797 E.02328
G1 X200.203 Y42.764 E.36531
G1 X199.722 Y42.764 E.01546
G1 X183.251 Y59.236 E.74904
G1 X182.132 Y59.236 E.03597
G1 X165.661 Y42.764 E.74904
G1 X165.18 Y42.764 E.01546
G1 X148.709 Y59.236 E.74904
G1 X147.59 Y59.236 E.03597
G1 X131.119 Y42.764 E.74904
G1 X130.638 Y42.764 E.01547
G1 X114.167 Y59.236 E.74904
G1 X113.048 Y59.236 E.03597
G1 X96.577 Y42.764 E.74904
G1 X96.096 Y42.764 E.01547
G1 X79.625 Y59.236 E.74904
G1 X78.506 Y59.236 E.03597
G1 X62.035 Y42.764 E.74904
G1 X61.554 Y42.764 E.01547
G1 X56.792 Y47.527 E.21658
G2 X55.27 Y47.513 I-.807 J5.063 E.04913
G1 X50.521 Y42.764 E.21594
G1 X50.04 Y42.764 E.01547
G1 X47.764 Y45.04 E.1035
G1 X47.764 Y45.764 E.02328
G1 X52.473 Y50.473 E.21411
G2 X52.526 Y51.793 I4.76 J.469 E.04262
G1 X47.764 Y56.554 E.21654
G1 X47.764 Y57.278 E.02328
G1 X64.236 Y73.749 E.74904
G1 X64.236 Y74.625 E.02816
G1 X47.764 Y91.096 E.74904
G1 X47.764 Y91.82 E.02328
G1 X64.236 Y108.291 E.74904
G1 X64.236 Y109.167 E.02816
G1 X47.764 Y125.638 E.74904
G1 X47.764 Y126.362 E.02328
G1 X64.236 Y142.833 E.74904
G1 X64.236 Y143.709 E.02816
G1 X47.764 Y160.18 E.74904
G1 X47.764 Y160.904 E.02328
G1 X64.236 Y177.375 E.74904
G1 X64.236 Y178.251 E.02816
G1 X47.764 Y194.722 E.74904
G1 X47.764 Y195.446 E.02328
G1 X52.526 Y200.207 E.21654
G2 X52.473 Y201.527 I4.707 J.851 E.04262
G1 X47.764 Y206.235 E.21411
G1 X47.764 Y206.96 E.02328
G1 X50.04 Y209.236 E.1035
G1 X50.521 Y209.236 E.01546
G1 X55.269 Y204.488 E.21589
G3 X53.806 Y203.807 I1.011 J-4.079 E.0522
; WIPE_START
G1 X54.533 Y204.251 E-.32364
G1 X55.269 Y204.488 E-.2937
G1 X55.003 Y204.754 E-.14266
; WIPE_END
G1 E-.04 F1800
G1 X54.894 Y197.122 Z2.2 F30000
G1 X53.914 Y128.893 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F8843.478
G2 X55.404 Y129.512 I2.361 J-3.578 E.05221
G1 X47.764 Y137.152 E.34743
G1 X47.764 Y137.876 E.02328
G1 X64.236 Y154.347 E.74904
G1 X64.236 Y155.223 E.02816
G1 X47.764 Y171.694 E.74904
G1 X47.764 Y172.418 E.02328
G1 X64.236 Y188.889 E.74904
G1 X64.236 Y189.764 E.02816
G1 X56.524 Y197.476 E.35067
G2 X55.55 Y197.474 I-.495 J3.892 E.03143
G1 X47.764 Y189.689 E.35403
G1 X47.764 Y188.965 E.02328
G1 X64.236 Y172.494 E.74904
G1 X64.236 Y171.618 E.02816
G1 X47.764 Y155.147 E.74904
G1 X47.764 Y154.423 E.02328
G1 X64.236 Y137.952 E.74904
G1 X64.236 Y137.076 E.02816
G1 X56.662 Y129.503 E.34441
G2 X59.513 Y126.596 I-.669 J-3.507 E.13929
G1 X64.236 Y131.319 E.21478
G1 X64.236 Y132.195 E.02816
G1 X47.764 Y148.666 E.74904
G1 X47.764 Y149.39 E.02328
G1 X64.236 Y165.861 E.74904
G1 X64.236 Y166.737 E.02816
G1 X47.764 Y183.208 E.74904
G1 X47.764 Y183.932 E.02328
G1 X73.068 Y209.236 E1.15072
G1 X73.549 Y209.236 E.01546
G1 X90.02 Y192.764 E.74904
G1 X91.139 Y192.764 E.03597
G1 X107.61 Y209.236 E.74904
G1 X108.091 Y209.236 E.01547
G1 X124.562 Y192.764 E.74904
G1 X125.681 Y192.764 E.03597
G1 X142.152 Y209.236 E.74904
G1 X142.633 Y209.236 E.01546
G1 X159.104 Y192.764 E.74904
G1 X160.223 Y192.764 E.03597
G1 X176.694 Y209.236 E.74904
G1 X177.175 Y209.236 E.01547
G1 X208.236 Y178.175 E1.41252
G1 X208.236 Y177.451 E.02328
G1 X191.764 Y160.98 E.74904
G1 X191.764 Y160.104 E.02816
G1 X208.236 Y143.633 E.74904
G1 X208.236 Y142.909 E.02328
G1 X191.764 Y126.438 E.74904
G1 X191.764 Y125.562 E.02816
G1 X208.236 Y109.091 E.74904
G1 X208.236 Y108.367 E.02328
G1 X191.764 Y91.896 E.74904
G1 X191.764 Y91.02 E.02816
G1 X208.236 Y74.549 E.74904
G1 X208.236 Y73.825 E.02328
G1 X177.175 Y42.764 E1.41252
G1 X176.694 Y42.764 E.01546
G1 X160.223 Y59.236 E.74904
G1 X159.104 Y59.236 E.03597
G1 X142.633 Y42.764 E.74904
G1 X142.152 Y42.764 E.01546
G1 X125.681 Y59.236 E.74904
G1 X124.562 Y59.236 E.03597
G1 X108.091 Y42.764 E.74904
G1 X107.61 Y42.764 E.01547
G1 X91.139 Y59.236 E.74904
G1 X90.02 Y59.236 E.03597
G1 X73.549 Y42.764 E.74904
G1 X73.068 Y42.764 E.01547
G1 X47.764 Y68.068 E1.15072
G1 X47.764 Y68.792 E.02328
G1 X64.236 Y85.263 E.74904
G1 X64.236 Y86.139 E.02816
G1 X47.764 Y102.61 E.74904
G1 X47.764 Y103.334 E.02328
G1 X64.236 Y119.805 E.74904
G1 X64.236 Y120.681 E.02816
G1 X59.513 Y125.404 E.21478
G2 X56.662 Y122.497 I-3.52 J.601 E.13929
G1 X64.236 Y114.924 E.34441
G1 X64.236 Y114.048 E.02816
G1 X47.764 Y97.577 E.74904
G1 X47.764 Y96.853 E.02328
G1 X64.236 Y80.382 E.74904
G1 X64.236 Y79.506 E.02816
G1 X47.764 Y63.035 E.74904
G1 X47.764 Y62.311 E.02328
G1 X55.54 Y54.536 E.35359
G2 X56.524 Y54.524 I.409 J-7.029 E.03169
G1 X64.236 Y62.236 E.35067
G1 X64.236 Y63.111 E.02816
G1 X47.764 Y79.582 E.74904
G1 X47.764 Y80.306 E.02328
G1 X64.236 Y96.777 E.74904
G1 X64.236 Y97.653 E.02816
G1 X47.764 Y114.124 E.74904
G1 X47.764 Y114.848 E.02328
G1 X55.41 Y122.493 E.34768
G2 X53.918 Y123.104 I.794 J4.066 E.05218
; WIPE_START
G1 X54.533 Y122.749 E-.27006
G1 X55.41 Y122.493 E-.34702
G1 X55.144 Y122.227 E-.14291
; WIPE_END
G1 E-.04 F1800
G1 X60.43 Y116.722 Z2.2 F30000
G1 X126.744 Y47.666 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F8843.478
G2 X125.4 Y48.56 I1.289 J3.397 E.05233
G1 X119.605 Y42.764 E.26354
G1 X119.124 Y42.764 E.01546
G1 X102.653 Y59.236 E.74904
G1 X101.534 Y59.236 E.03597
G1 X85.063 Y42.764 E.74904
G1 X84.582 Y42.764 E.01547
G1 X68.111 Y59.236 E.74904
G1 X66.992 Y59.236 E.03597
G1 X59.489 Y51.732 E.34121
G2 X59.533 Y50.542 I-3.644 J-.731 E.03846
G1 X67.311 Y42.764 E.35371
G1 X67.792 Y42.764 E.01547
G1 X84.263 Y59.236 E.74904
G1 X85.382 Y59.236 E.03597
G1 X101.853 Y42.764 E.74904
G1 X102.334 Y42.764 E.01546
G1 X118.805 Y59.236 E.74904
G1 X119.924 Y59.236 E.03597
G1 X125.562 Y53.598 E.25638
G2 X130.439 Y53.599 I2.439 J-2.652 E.17228
G1 X136.076 Y59.236 E.25635
G1 X137.195 Y59.236 E.03597
G1 X153.666 Y42.764 E.74904
G1 X154.147 Y42.764 E.01546
G1 X170.618 Y59.236 E.74904
G1 X171.737 Y59.236 E.03597
G1 X188.208 Y42.764 E.74904
G1 X188.689 Y42.764 E.01546
G1 X196.466 Y50.542 E.35368
G2 X196.513 Y51.73 I4.932 J.398 E.03833
G1 X189.008 Y59.236 E.34133
G1 X187.889 Y59.236 E.03597
G1 X171.418 Y42.764 E.74904
G1 X170.937 Y42.764 E.01546
G1 X154.466 Y59.236 E.74904
G1 X153.347 Y59.236 E.03597
G1 X136.876 Y42.764 E.74904
G1 X136.395 Y42.764 E.01546
G1 X130.597 Y48.562 E.26365
G3 X131.41 Y49.956 I-3.226 J2.815 E.05221
; WIPE_START
G1 X131.132 Y49.294 E-.27289
G1 X130.597 Y48.562 E-.34452
G1 X130.863 Y48.297 E-.14259
; WIPE_END
G1 E-.04 F1800
G1 X136.125 Y53.825 Z2.2 F30000
G1 X202.085 Y123.112 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F8843.478
G2 X200.599 Y122.485 I-2.367 J3.535 E.0522
G1 X208.236 Y114.848 E.34729
G1 X208.236 Y114.124 E.02328
G1 X191.764 Y97.653 E.74904
G1 X191.764 Y96.777 E.02816
G1 X208.236 Y80.306 E.74904
G1 X208.236 Y79.582 E.02328
G1 X191.764 Y63.111 E.74904
G1 X191.764 Y62.236 E.02816
G1 X199.475 Y54.525 E.35066
G2 X200.457 Y54.533 I.541 J-6.077 E.0316
G1 X208.236 Y62.311 E.35374
G1 X208.236 Y63.035 E.02328
G1 X191.764 Y79.506 E.74904
G1 X191.764 Y80.382 E.02816
G1 X208.236 Y96.853 E.74904
G1 X208.236 Y97.577 E.02328
G1 X191.764 Y114.048 E.74904
G1 X191.764 Y114.924 E.02816
G1 X199.343 Y122.503 E.34465
G2 X196.486 Y125.403 I.649 J3.496 E.13937
G1 X191.764 Y120.681 E.21474
G1 X191.764 Y119.805 E.02816
G1 X208.236 Y103.334 E.74904
G1 X208.236 Y102.61 E.02328
G1 X191.764 Y86.139 E.74904
G1 X191.764 Y85.263 E.02816
G1 X208.236 Y68.792 E.74904
G1 X208.236 Y68.068 E.02328
G1 X182.932 Y42.764 E1.15072
G1 X182.451 Y42.764 E.01546
G1 X165.98 Y59.236 E.74904
G1 X164.861 Y59.236 E.03597
G1 X148.39 Y42.764 E.74904
G1 X147.909 Y42.764 E.01547
G1 X131.438 Y59.236 E.74904
G1 X130.319 Y59.236 E.03597
G1 X113.848 Y42.764 E.74904
G1 X113.367 Y42.764 E.01546
G1 X96.896 Y59.236 E.74904
G1 X95.777 Y59.236 E.03597
G1 X79.306 Y42.764 E.74904
G1 X78.825 Y42.764 E.01547
G1 X47.764 Y73.825 E1.41252
G1 X47.764 Y74.549 E.02328
G1 X64.236 Y91.02 E.74904
G1 X64.236 Y91.896 E.02816
G1 X47.764 Y108.367 E.74904
G1 X47.764 Y109.091 E.02328
G1 X64.236 Y125.562 E.74904
G1 X64.236 Y126.438 E.02816
G1 X47.764 Y142.909 E.74904
G1 X47.764 Y143.633 E.02328
G1 X64.236 Y160.104 E.74904
G1 X64.236 Y160.98 E.02816
G1 X47.764 Y177.451 E.74904
G1 X47.764 Y178.175 E.02328
G1 X78.825 Y209.236 E1.41252
G1 X79.306 Y209.236 E.01546
G1 X95.777 Y192.764 E.74904
G1 X96.896 Y192.764 E.03597
G1 X113.367 Y209.236 E.74904
G1 X113.848 Y209.236 E.01546
G1 X130.319 Y192.764 E.74904
G1 X131.438 Y192.764 E.03597
G1 X147.909 Y209.236 E.74904
G1 X148.39 Y209.236 E.01547
G1 X164.861 Y192.764 E.74904
G1 X165.98 Y192.764 E.03597
G1 X182.451 Y209.236 E.74904
G1 X182.932 Y209.236 E.01547
G1 X208.236 Y183.932 E1.15072
G1 X208.236 Y183.208 E.02328
G1 X191.764 Y166.737 E.74904
G1 X191.764 Y165.861 E.02816
G1 X208.236 Y149.39 E.74904
G1 X208.236 Y148.666 E.02328
G1 X191.764 Y132.195 E.74904
G1 X191.764 Y131.319 E.02816
G1 X196.486 Y126.597 E.21474
G2 X199.34 Y129.501 I3.516 J-.602 E.13931
G1 X191.764 Y137.076 E.3445
G1 X191.764 Y137.952 E.02816
G1 X208.236 Y154.423 E.74904
G1 X208.236 Y155.147 E.02328
G1 X191.764 Y171.618 E.74904
G1 X191.764 Y172.494 E.02816
G1 X208.236 Y188.965 E.74904
G1 X208.236 Y189.689 E.02328
G1 X200.457 Y197.467 E.35374
G2 X199.483 Y197.483 I-.424 J3.897 E.0314
G1 X191.764 Y189.764 E.35101
G1 X191.764 Y188.889 E.02816
G1 X208.236 Y172.418 E.74904
G1 X208.236 Y171.694 E.02328
G1 X191.764 Y155.223 E.74904
G1 X191.764 Y154.347 E.02816
G1 X208.236 Y137.876 E.74904
G1 X208.236 Y137.152 E.02328
G1 X200.599 Y129.515 E.34729
G2 X202.085 Y128.888 I-.88 J-4.163 E.0522
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X201.303 Y129.32 E-.33961
G1 X200.599 Y129.515 E-.27777
G1 X200.864 Y129.78 E-.14262
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/58
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
G1 X129.034 Y197.957
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X129.176 Y198.004 E.00482
M73 P49 R35
G3 X127.784 Y197.793 I-1.167 J2.996 E.60395
G3 X128.871 Y197.904 I.214 J3.284 E.03532
G1 X128.977 Y197.938 E.00357
G1 X128.588 Y198.255 F30000
G1 F8843.478
G1 X128.761 Y198.295 E.00572
G3 X127.814 Y198.199 I-.751 J2.706 E.53672
G3 X128.488 Y198.232 I.204 J2.722 E.02175
G1 X128.529 Y198.242 E.00136
G1 X128.147 Y198.604 F30000
G1 F8843.478
G1 X128.179 Y198.616 E.00108
G3 X128.651 Y198.687 I-.277 J3.441 E.01537
G3 X127.844 Y198.605 I-.642 J2.314 E.45899
G1 X128.087 Y198.604 E.00781
G1 X127.871 Y198.996 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X127.874 Y198.996 E.00009
G3 X128.349 Y199.02 I.128 J2.171 E.0142
G3 X127.554 Y199.044 I-.339 J1.98 E.35204
G1 X127.811 Y199.005 E.00777
; WIPE_START
M204 S10000
G1 X127.874 Y198.996 E-.02399
G1 X128.15 Y198.995 E-.10503
G1 X128.349 Y199.02 E-.07618
M73 P49 R34
G1 X128.734 Y199.129 E-.15213
G1 X129.091 Y199.311 E-.15208
G1 X129.404 Y199.561 E-.15216
G1 X129.57 Y199.759 E-.09843
; WIPE_END
G1 E-.04 F1800
G1 X121.94 Y199.593 Z2.4 F30000
G1 X54.571 Y198.121 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X54.679 Y198.073 E.00379
G3 X55.784 Y197.793 I1.33 J2.927 E.03683
G3 X57.176 Y198.004 I.214 J3.283 E.04563
G3 X54.395 Y198.22 I-1.167 J2.996 E.55683
G1 X54.519 Y198.15 E.00458
G1 X55.057 Y198.355 F30000
G1 F8843.478
G1 X55.107 Y198.342 E.00164
G3 X55.814 Y198.199 I.903 J2.659 E.02326
G3 X56.761 Y198.295 I.204 J2.722 E.03077
G3 X54.847 Y198.444 I-.751 J2.706 E.50446
G1 X55.002 Y198.378 E.00543
G1 X55.55 Y198.646 F30000
G1 F8843.478
G1 X55.844 Y198.605 E.00957
G3 X56.651 Y198.687 I.057 J3.452 E.02612
G3 X55.466 Y198.662 I-.642 J2.314 E.44669
G1 X55.491 Y198.657 E.0008
G1 X55.871 Y198.996 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X55.874 Y198.996 E.0001
G3 X56.349 Y199.02 I.128 J2.171 E.0142
G3 X55.554 Y199.044 I-.339 J1.98 E.35204
G1 X55.811 Y199.005 E.00776
; WIPE_START
M204 S10000
G1 X55.874 Y198.996 E-.02402
G1 X56.15 Y198.995 E-.10503
G1 X56.349 Y199.02 E-.07618
G1 X56.734 Y199.129 E-.15213
G1 X57.091 Y199.311 E-.15208
G1 X57.404 Y199.561 E-.15213
G1 X57.57 Y199.759 E-.09843
; WIPE_END
G1 E-.04 F1800
G1 X57.669 Y192.128 Z2.4 F30000
G1 X58.496 Y128.027 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X58.468 Y128.071 E.00167
G3 X55.784 Y122.793 I-2.459 J-2.071 E.40758
G3 X57.176 Y123.004 I.214 J3.284 E.04563
G3 X58.663 Y127.815 I-1.167 J2.996 E.18602
G1 X58.533 Y127.98 E.00674
G1 X58.174 Y127.779 F30000
G1 F8843.478
G1 X58.158 Y127.811 E.00113
G3 X55.814 Y123.199 I-2.148 J-1.81 E.35606
G3 X56.761 Y123.295 I.204 J2.723 E.03077
G3 X58.328 Y127.587 I-.751 J2.706 E.17162
G1 X58.211 Y127.732 E.00599
G1 X57.86 Y127.517 F30000
G1 F8843.478
G1 X57.845 Y127.548 E.00112
G3 X55.844 Y123.605 I-1.836 J-1.547 E.30454
G3 X56.651 Y123.687 I.057 J3.453 E.02612
G3 X58.116 Y127.152 I-.642 J2.314 E.139
G1 X57.894 Y127.468 E.0124
G1 X57.549 Y127.279 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X57.544 Y127.296 E.00053
G3 X55.874 Y123.996 I-1.534 J-1.296 E.23591
G3 X56.349 Y124.02 I.128 J2.17 E.01421
G3 X57.772 Y126.965 I-.339 J1.98 E.1138
G1 X57.584 Y127.23 E.00967
; WIPE_START
M204 S10000
G1 X57.544 Y127.296 E-.02924
G1 X57.253 Y127.572 E-.15233
G1 X57.091 Y127.689 E-.07616
G1 X56.735 Y127.871 E-.15211
G1 X56.349 Y127.98 E-.15213
G1 X55.95 Y128.01 E-.15212
G1 X55.829 Y128.001 E-.0459
; WIPE_END
G1 E-.04 F1800
G1 X62.723 Y131.276 Z2.4 F30000
G1 X191.416 Y192.416 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X64.584 Y192.416 E4.07847
G1 X64.584 Y59.584 E4.27141
G1 X191.416 Y59.584 E4.07847
G1 X191.416 Y192.356 E4.26948
G1 X191.009 Y192.009 F30000
G1 F8843.478
G1 X64.991 Y192.009 E4.05229
G1 X64.991 Y59.991 E4.24523
G1 X191.009 Y59.991 E4.05229
G1 X191.009 Y191.949 E4.2433
G1 X190.602 Y191.602 F30000
G1 F8843.478
G1 X65.398 Y191.602 E4.02611
G1 X65.398 Y60.398 E4.21905
G1 X190.602 Y60.398 E4.02611
G1 X190.602 Y191.542 E4.21712
G1 X190.21 Y191.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X65.79 Y191.21 E3.70605
G1 X65.79 Y60.79 E3.88477
G1 X190.21 Y60.79 E3.70605
G1 X190.21 Y191.15 E3.88298
; WIPE_START
M204 S10000
G1 X188.21 Y191.151 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X182.999 Y185.574 Z2.4 F30000
G1 X54.572 Y48.12 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X54.679 Y48.073 E.00378
G3 X55.784 Y47.793 I1.33 J2.927 E.03682
G3 X57.176 Y48.004 I.214 J3.284 E.04563
G3 X54.395 Y48.22 I-1.167 J2.996 E.55683
G1 X54.519 Y48.15 E.00459
G1 X55.058 Y48.354 F30000
G1 F8843.478
G1 X55.107 Y48.342 E.00163
G3 X55.814 Y48.199 I.903 J2.659 E.02326
G3 X56.761 Y48.295 I.204 J2.722 E.03077
G3 X54.847 Y48.444 I-.751 J2.706 E.50446
G1 X55.003 Y48.378 E.00544
G1 X55.55 Y48.646 F30000
G1 F8843.478
G1 X55.844 Y48.605 E.00955
G3 X56.651 Y48.687 I.057 J3.453 E.02612
G3 X55.466 Y48.661 I-.642 J2.314 E.44669
G1 X55.491 Y48.657 E.00081
G1 X55.877 Y48.996 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X56.15 Y48.997 E.00813
G3 X56.349 Y49.02 I-.149 J2.169 E.00597
G3 X55.817 Y49.001 I-.339 J1.98 E.36001
; WIPE_START
M204 S10000
G1 X56.15 Y48.997 E-.12646
G1 X56.349 Y49.02 E-.07614
G1 X56.734 Y49.129 E-.15212
G1 X57.091 Y49.311 E-.15212
G1 X57.404 Y49.561 E-.1521
G1 X57.575 Y49.765 E-.10106
; WIPE_END
G1 E-.04 F1800
G1 X65.205 Y49.583 Z2.4 F30000
G1 X126.572 Y48.121 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X126.679 Y48.073 E.00378
G3 X127.783 Y47.793 I1.33 J2.927 E.03683
G3 X129.176 Y48.004 I.214 J3.284 E.04563
G3 X126.395 Y48.22 I-1.167 J2.996 E.55682
G1 X126.519 Y48.15 E.00459
G1 X127.058 Y48.355 F30000
G1 F8843.478
G1 X127.107 Y48.342 E.00163
G3 X127.814 Y48.199 I.903 J2.659 E.02326
G3 X128.761 Y48.295 I.204 J2.722 E.03077
G3 X126.847 Y48.444 I-.751 J2.706 E.50446
G1 X127.002 Y48.378 E.00544
G1 X127.55 Y48.646 F30000
G1 F8843.478
G1 X127.844 Y48.605 E.00956
G3 X128.651 Y48.687 I.057 J3.454 E.02612
G3 X127.466 Y48.661 I-.642 J2.314 E.44669
G1 X127.491 Y48.657 E.00081
G1 X127.877 Y48.996 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.15 Y48.997 E.00813
G3 X128.349 Y49.02 I-.149 J2.169 E.00597
G3 X127.817 Y49.001 I-.339 J1.98 E.36001
; WIPE_START
M204 S10000
G1 X128.15 Y48.997 E-.12637
G1 X128.349 Y49.02 E-.07615
G1 X128.544 Y49.065 E-.07614
G1 X128.917 Y49.211 E-.15213
G1 X129.253 Y49.428 E-.1521
G1 X129.54 Y49.708 E-.15216
G1 X129.577 Y49.762 E-.02496
; WIPE_END
G1 E-.04 F1800
G1 X137.207 Y49.581 Z2.4 F30000
G1 X198.572 Y48.121 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X198.679 Y48.073 E.00379
G3 X199.784 Y47.793 I1.33 J2.927 E.03682
G3 X201.176 Y48.005 I.214 J3.283 E.04564
G3 X198.395 Y48.22 I-1.167 J2.996 E.55682
G1 X198.519 Y48.15 E.00458
G1 X199.058 Y48.355 F30000
G1 F8843.478
G1 X199.107 Y48.342 E.00164
G3 X199.814 Y48.199 I.903 J2.659 E.02326
G3 X200.761 Y48.295 I.204 J2.723 E.03077
G3 X198.847 Y48.444 I-.751 J2.706 E.50447
G1 X199.002 Y48.378 E.00544
G1 X199.55 Y48.646 F30000
G1 F8843.478
G1 X199.844 Y48.605 E.00956
G3 X200.651 Y48.687 I.057 J3.454 E.02612
G3 X199.466 Y48.662 I-.642 J2.314 E.44669
G1 X199.491 Y48.657 E.0008
G1 X199.877 Y48.996 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X200.15 Y48.997 E.00813
G3 X200.349 Y49.02 I-.149 J2.169 E.00597
G3 X199.817 Y49.001 I-.339 J1.98 E.36001
; WIPE_START
M204 S10000
G1 X200.15 Y48.997 E-.12646
G1 X200.349 Y49.02 E-.07614
G1 X200.544 Y49.065 E-.07613
G1 X200.917 Y49.211 E-.15213
G1 X201.253 Y49.428 E-.15214
G1 X201.54 Y49.708 E-.15212
G1 X201.577 Y49.762 E-.02488
; WIPE_END
G1 E-.04 F1800
G1 X201.264 Y57.388 Z2.4 F30000
G1 X198.572 Y123.121 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X198.679 Y123.073 E.00378
G3 X199.784 Y122.793 I1.33 J2.927 E.03682
G3 X201.176 Y123.004 I.214 J3.284 E.04563
G3 X198.395 Y123.22 I-1.167 J2.996 E.55683
G1 X198.519 Y123.15 E.00459
G1 X199.058 Y123.354 F30000
G1 F8843.478
G1 X199.107 Y123.342 E.00163
G3 X199.814 Y123.199 I.903 J2.659 E.02326
G3 X200.761 Y123.295 I.204 J2.723 E.03077
G3 X198.847 Y123.444 I-.751 J2.706 E.50446
G1 X199.003 Y123.378 E.00544
G1 X199.55 Y123.646 F30000
G1 F8843.478
G1 X199.844 Y123.605 E.00956
G3 X200.651 Y123.687 I.057 J3.454 E.02612
G3 X199.466 Y123.661 I-.642 J2.314 E.44669
G1 X199.491 Y123.657 E.00081
G1 X199.877 Y123.996 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X200.15 Y123.997 E.00813
G3 X200.349 Y124.02 I-.149 J2.169 E.00597
G3 X199.817 Y124.001 I-.339 J1.98 E.36001
; WIPE_START
M204 S10000
G1 X200.15 Y123.997 E-.12645
G1 X200.349 Y124.02 E-.07614
G1 X200.734 Y124.129 E-.15212
G1 X201.091 Y124.311 E-.15212
G1 X201.404 Y124.561 E-.1521
G1 X201.575 Y124.765 E-.10107
; WIPE_END
G1 E-.04 F1800
G1 X201.262 Y132.391 Z2.4 F30000
G1 X198.571 Y198.121 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X198.679 Y198.073 E.00379
G3 X199.784 Y197.793 I1.33 J2.927 E.03683
G3 X201.176 Y198.004 I.214 J3.283 E.04563
G3 X198.395 Y198.22 I-1.167 J2.996 E.55682
G1 X198.519 Y198.15 E.00458
G1 X199.057 Y198.355 F30000
G1 F8843.478
G1 X199.107 Y198.342 E.00165
G3 X199.814 Y198.199 I.903 J2.659 E.02326
G3 X200.761 Y198.295 I.204 J2.722 E.03077
G3 X198.847 Y198.444 I-.751 J2.706 E.50446
G1 X199.002 Y198.378 E.00543
G1 X199.55 Y198.646 F30000
G1 F8843.478
G1 X199.844 Y198.605 E.00957
G3 X200.651 Y198.687 I.057 J3.452 E.02612
G3 X199.466 Y198.662 I-.642 J2.314 E.44669
G1 X199.491 Y198.657 E.0008
G1 X199.871 Y198.996 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X199.874 Y198.996 E.00008
G3 X200.349 Y199.02 I.128 J2.171 E.0142
G3 X199.554 Y199.044 I-.339 J1.98 E.35204
G1 X199.812 Y199.005 E.00778
; WIPE_START
M204 S10000
G1 X199.874 Y198.996 E-.02384
G1 X200.15 Y198.995 E-.10503
G1 X200.349 Y199.02 E-.07617
G1 X200.735 Y199.129 E-.15214
G1 X201.091 Y199.311 E-.15207
G1 X201.404 Y199.561 E-.15213
G1 X201.57 Y199.76 E-.09862
; WIPE_END
G1 E-.04 F1800
G1 X206.005 Y205.972 Z2.4 F30000
G1 X208.584 Y209.584 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X47.416 Y209.584 E5.18256
G1 X47.416 Y42.416 E5.3755
G1 X208.584 Y42.416 E5.18256
G1 X208.584 Y209.524 E5.37357
G1 X208.991 Y209.991 F30000
G1 F8843.478
G1 X47.009 Y209.991 E5.20874
G1 X47.009 Y42.009 E5.40168
G1 X208.991 Y42.009 E5.20874
G1 X208.991 Y209.931 E5.39975
G1 X209.398 Y210.398 F30000
G1 F8843.478
G1 X46.602 Y210.398 E5.23492
G1 X46.602 Y41.602 E5.42786
G1 X209.398 Y41.602 E5.23492
G1 X209.398 Y210.338 E5.42593
G1 X209.79 Y210.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X46.21 Y210.79 E4.87249
G1 X46.21 Y41.21 E5.05121
G1 X209.79 Y41.21 E4.87249
G1 X209.79 Y210.73 E5.04942
; WIPE_START
M204 S10000
G1 X207.79 Y210.731 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X204.84 Y203.691 Z2.4 F30000
G1 X203.563 Y200.643 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F10588.235
G1 X203.425 Y199.96 E.01872
G1 X203.151 Y199.302 E.01915
G1 X202.752 Y198.711 E.01915
G1 X202.244 Y198.211 E.01915
G1 X201.647 Y197.822 E.01914
G1 X200.985 Y197.558 E.01915
G1 X200.28 Y197.431 E.01923
G2 X199.22 Y197.506 I-.26 J3.875 E.02862
G1 X198.542 Y197.731 E.01919
G1 X197.923 Y198.084 E.01914
G1 X197.387 Y198.554 E.01916
G1 X196.954 Y199.12 E.01914
G1 X196.642 Y199.761 E.01914
G1 X196.463 Y200.451 E.01915
G1 X196.424 Y201.163 E.01915
G1 X196.527 Y201.868 E.01915
G1 X196.768 Y202.539 E.01914
G1 X197.137 Y203.149 E.01915
G1 X197.62 Y203.673 E.01914
G1 X198.196 Y204.092 E.01914
G1 X198.845 Y204.388 E.01914
G1 X199.539 Y204.55 E.01915
G1 X200.252 Y204.571 E.01914
G1 X200.954 Y204.45 E.01914
G1 X201.619 Y204.193 E.01916
G1 X202.219 Y203.809 E.01914
G1 X202.732 Y203.313 E.01915
G1 X203.136 Y202.726 E.01914
G1 X203.416 Y202.07 E.01915
G1 X203.56 Y201.372 E.01914
G1 X203.563 Y200.703 E.01796
; WIPE_START
G1 X203.56 Y201.372 E-.25414
G1 X203.416 Y202.07 E-.27079
G1 X203.173 Y202.639 E-.23507
; WIPE_END
G1 E-.04 F1800
G1 X197.473 Y204.023 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G2 X198.899 Y204.782 I2.538 J-3.048 E.05232
G1 X194.823 Y208.858 E.18536
G1 X193.587 Y208.858 E.03972
M73 P50 R34
G1 X177.871 Y193.142 E.71473
G1 X175.998 Y193.142 E.06023
G1 X160.281 Y208.858 E.71473
G1 X159.046 Y208.858 E.03972
G1 X143.329 Y193.142 E.71473
G1 X141.456 Y193.142 E.06023
G1 X125.739 Y208.858 E.71473
G1 X124.504 Y208.858 E.03972
G1 X108.787 Y193.142 E.71473
G1 X106.914 Y193.142 E.06023
G1 X91.197 Y208.858 E.71473
G1 X89.962 Y208.858 E.03972
G1 X74.245 Y193.142 E.71473
G1 X72.372 Y193.142 E.06023
G1 X56.656 Y208.858 E.71473
G1 X55.42 Y208.858 E.03972
G1 X48.142 Y201.58 E.331
G1 X48.142 Y200.101 E.04754
G1 X63.858 Y184.385 E.71473
G1 X63.858 Y182.755 E.05241
G1 X48.142 Y167.038 E.71473
G1 X48.142 Y165.56 E.04754
G1 X63.858 Y149.843 E.71473
G1 X63.858 Y148.213 E.05241
G1 X48.142 Y132.496 E.71473
G1 X48.142 Y131.018 E.04754
G1 X52.18 Y126.98 E.18363
G3 X52.18 Y125.02 I3.972 J-.98 E.06363
G1 X48.142 Y120.982 E.18363
G1 X48.142 Y119.504 E.04754
G1 X63.858 Y103.787 E.71473
G1 X63.858 Y102.157 E.05241
G1 X48.142 Y86.44 E.71473
G1 X48.142 Y84.962 E.04754
G1 X63.858 Y69.245 E.71473
G1 X63.858 Y67.615 E.05241
G1 X48.142 Y51.899 E.71473
G1 X48.142 Y50.42 E.04754
G1 X55.42 Y43.142 E.331
G1 X56.656 Y43.142 E.03972
G1 X72.372 Y58.858 E.71473
G1 X74.245 Y58.858 E.06023
G1 X89.962 Y43.142 E.71473
G1 X91.197 Y43.142 E.03972
G1 X106.914 Y58.858 E.71473
G1 X108.787 Y58.858 E.06023
G1 X124.504 Y43.142 E.71474
G1 X125.739 Y43.142 E.03972
G1 X141.456 Y58.858 E.71474
G1 X143.329 Y58.858 E.06023
G1 X159.046 Y43.141 E.71474
G1 X160.281 Y43.141 E.03971
G1 X175.998 Y58.858 E.71474
G1 X177.871 Y58.858 E.06023
G1 X193.588 Y43.142 E.71474
G1 X194.823 Y43.142 E.03972
G1 X198.899 Y47.218 E.18536
G3 X201.045 Y47.198 I1.108 J3.822 E.06989
G1 X205.101 Y43.142 E.18446
G1 X206.337 Y43.142 E.03972
G1 X207.858 Y44.663 E.0692
G1 X207.858 Y46.142 E.04754
G1 X203.849 Y50.151 E.18233
G3 X203.784 Y52.103 I-4.489 J.828 E.06329
G1 X207.858 Y56.177 E.18528
G1 X207.858 Y57.656 E.04754
G1 X192.142 Y73.372 E.71473
G1 X192.142 Y75.002 E.05242
G1 X207.858 Y90.719 E.71473
G1 X207.858 Y92.197 E.04754
G1 X192.142 Y107.914 E.71473
G1 X192.142 Y109.544 E.05242
G1 X207.858 Y125.261 E.71473
G1 X207.858 Y126.739 E.04754
G1 X192.142 Y142.456 E.71473
G1 X192.142 Y144.086 E.05242
G1 X207.858 Y159.803 E.71473
G1 X207.858 Y161.281 E.04754
G1 X192.142 Y176.998 E.71473
G1 X192.142 Y178.628 E.05242
G1 X207.858 Y194.344 E.71473
G1 X207.858 Y195.823 E.04754
G1 X203.784 Y199.897 E.18528
G3 X203.849 Y201.849 I-4.424 J1.124 E.06329
G1 X207.858 Y205.858 E.18233
G1 X207.858 Y207.337 E.04754
G1 X206.337 Y208.858 E.0692
G1 X205.101 Y208.858 E.03972
G1 X201.045 Y204.802 E.18446
G2 X202.483 Y204.063 I-1.551 J-4.784 E.05222
; WIPE_START
G1 X201.8 Y204.51 E-.31036
G1 X201.045 Y204.802 E-.30743
G1 X201.31 Y205.067 E-.1422
; WIPE_END
G1 E-.04 F1800
G1 X193.693 Y204.584 Z2.4 F30000
G1 X131.563 Y200.643 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F10588.235
G1 X131.425 Y199.96 E.01872
G1 X131.151 Y199.302 E.01915
G1 X130.752 Y198.711 E.01914
G1 X130.244 Y198.211 E.01914
G1 X129.647 Y197.822 E.01915
G1 X128.985 Y197.558 E.01915
G1 X128.28 Y197.431 E.01923
G2 X127.22 Y197.506 I-.26 J3.874 E.02862
G1 X126.542 Y197.731 E.01919
G1 X125.923 Y198.084 E.01914
G1 X125.387 Y198.554 E.01915
G1 X124.954 Y199.12 E.01914
G1 X124.642 Y199.761 E.01915
G1 X124.463 Y200.451 E.01914
G1 X124.424 Y201.163 E.01915
G1 X124.527 Y201.868 E.01915
G1 X124.768 Y202.539 E.01914
G1 X125.137 Y203.149 E.01915
G1 X125.619 Y203.673 E.01914
G1 X126.196 Y204.092 E.01915
G1 X126.845 Y204.388 E.01914
G1 X127.539 Y204.55 E.01914
G1 X128.252 Y204.571 E.01915
G1 X128.954 Y204.45 E.01914
G1 X129.619 Y204.193 E.01915
G1 X130.22 Y203.808 E.01914
G1 X130.732 Y203.313 E.01915
G1 X131.136 Y202.726 E.01913
G1 X131.416 Y202.07 E.01915
G1 X131.56 Y201.372 E.01915
G1 X131.563 Y200.703 E.01796
G1 X130.706 Y198.134 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X135.699 Y193.142 E.22704
G1 X137.572 Y193.142 E.06023
G1 X153.289 Y208.858 E.71473
G1 X154.524 Y208.858 E.03972
G1 X170.241 Y193.142 E.71473
G1 X172.114 Y193.142 E.06023
G1 X187.831 Y208.858 E.71473
G1 X189.066 Y208.858 E.03972
G1 X196.14 Y201.785 E.32169
G3 X196.199 Y199.956 I4.537 J-.767 E.05922
G1 X189.385 Y193.142 E.30991
G1 X187.512 Y193.142 E.06023
G1 X171.795 Y208.858 E.71473
G1 X170.56 Y208.858 E.03972
G1 X154.843 Y193.142 E.71473
G1 X152.97 Y193.142 E.06023
G1 X137.253 Y208.858 E.71473
G1 X136.018 Y208.858 E.03972
G1 X130.864 Y203.705 E.23436
; WIPE_START
G1 X132.278 Y205.119 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.881 Y199.722 Z2.4 F30000
G1 X125.295 Y198.136 Z2.4
G1 Z2
G1 E.8 F1800
G1 F8843.478
G1 X120.301 Y193.142 E.2271
G1 X118.428 Y193.142 E.06023
G1 X102.711 Y208.858 E.71473
G1 X101.476 Y208.858 E.03972
G1 X85.759 Y193.142 E.71473
G1 X83.886 Y193.142 E.06023
G1 X68.169 Y208.858 E.71473
G1 X66.934 Y208.858 E.03972
G1 X59.864 Y201.789 E.32151
G2 X59.8 Y199.957 I-4.65 J-.752 E.0593
G1 X66.615 Y193.142 E.30995
G1 X68.488 Y193.142 E.06023
G1 X84.205 Y208.858 E.71473
G1 X85.44 Y208.858 E.03972
G1 X101.157 Y193.142 E.71473
G1 X103.03 Y193.142 E.06023
G1 X118.747 Y208.858 E.71473
G1 X119.982 Y208.858 E.03972
G1 X125.133 Y203.707 E.23426
G1 X88.015 Y193.142 F30000
G1 F8843.478
G1 X89.643 Y193.142 E.05236
G1 X73.926 Y208.858 E.71473
G1 X72.691 Y208.858 E.03972
G1 X48.142 Y184.309 E1.11641
G1 X48.142 Y182.83 E.04754
G1 X63.858 Y167.114 E.71473
G1 X63.858 Y165.484 E.05241
G1 X48.142 Y149.767 E.71473
G1 X48.142 Y148.289 E.04754
G1 X63.858 Y132.572 E.71473
G1 X63.858 Y130.942 E.05241
G1 X59.832 Y126.916 E.1831
G2 X59.832 Y125.084 I-4.475 J-.916 E.05929
G1 X63.858 Y121.058 E.1831
G1 X63.858 Y119.428 E.05241
G1 X48.142 Y103.711 E.71473
G1 X48.142 Y102.233 E.04754
G1 X63.858 Y86.516 E.71473
G1 X63.858 Y84.886 E.05241
G1 X48.142 Y69.17 E.71473
G1 X48.142 Y67.691 E.04754
G1 X72.691 Y43.142 E1.11641
G1 X73.926 Y43.142 E.03972
G1 X89.643 Y58.858 E.71473
G1 X91.516 Y58.858 E.06023
G1 X107.233 Y43.142 E.71473
G1 X108.468 Y43.142 E.03972
G1 X124.185 Y58.858 E.71473
G1 X126.058 Y58.858 E.06023
G1 X141.775 Y43.141 E.71475
G1 X143.01 Y43.141 E.03971
G1 X158.727 Y58.858 E.71475
G1 X160.6 Y58.858 E.06023
G1 X176.317 Y43.142 E.71474
G1 X177.552 Y43.142 E.03971
G1 X207.858 Y73.448 E1.37822
G1 X207.858 Y74.926 E.04754
G1 X192.142 Y90.643 E.71473
G1 X192.142 Y92.273 E.05242
G1 X207.858 Y107.99 E.71473
G1 X207.858 Y109.468 E.04754
G1 X192.142 Y125.185 E.71473
G1 X192.142 Y126.815 E.05242
G1 X207.858 Y142.532 E.71473
G1 X207.858 Y144.01 E.04754
G1 X192.142 Y159.727 E.71473
G1 X192.142 Y161.357 E.05242
G1 X207.858 Y177.074 E.71473
G1 X207.858 Y178.552 E.04754
G1 X177.552 Y208.858 E1.37822
G1 X176.317 Y208.858 E.03972
G1 X160.6 Y193.142 E.71473
G1 X158.727 Y193.142 E.06023
G1 X143.01 Y208.858 E.71473
G1 X141.775 Y208.858 E.03972
G1 X126.058 Y193.142 E.71473
G1 X124.185 Y193.142 E.06023
G1 X108.468 Y208.858 E.71473
G1 X107.233 Y208.858 E.03972
G1 X91.516 Y193.142 E.71473
G1 X93.145 Y193.142 E.05236
G1 X59.563 Y200.643 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F10588.235
G1 X59.425 Y199.96 E.01872
G1 X59.151 Y199.302 E.01916
G1 X58.752 Y198.711 E.01914
G1 X58.244 Y198.211 E.01915
G1 X57.647 Y197.822 E.01914
G1 X56.985 Y197.558 E.01915
G1 X56.28 Y197.431 E.01923
G2 X55.22 Y197.506 I-.26 J3.875 E.02862
G1 X54.542 Y197.731 E.01919
G1 X53.923 Y198.084 E.01915
G1 X53.387 Y198.554 E.01914
G1 X52.954 Y199.12 E.01915
G1 X52.642 Y199.761 E.01915
G1 X52.463 Y200.451 E.01914
G1 X52.424 Y201.163 E.01915
G1 X52.527 Y201.868 E.01915
G1 X52.768 Y202.539 E.01915
G1 X53.137 Y203.149 E.01914
G1 X53.62 Y203.673 E.01915
G1 X54.197 Y204.092 E.01915
G1 X54.845 Y204.388 E.01914
G1 X55.539 Y204.55 E.01915
G1 X56.252 Y204.571 E.01914
G1 X56.954 Y204.45 E.01914
G1 X57.619 Y204.193 E.01915
G1 X58.22 Y203.808 E.01914
G1 X58.732 Y203.313 E.01915
G1 X59.136 Y202.726 E.01914
G1 X59.416 Y202.07 E.01915
G1 X59.56 Y201.372 E.01914
G1 X59.563 Y200.703 E.01796
; WIPE_START
G1 X59.56 Y201.372 E-.25414
G1 X59.416 Y202.07 E-.2708
G1 X59.173 Y202.639 E-.23506
; WIPE_END
G1 E-.04 F1800
G1 X53.521 Y204.061 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G2 X54.958 Y204.799 I2.481 J-3.064 E.05232
G1 X50.899 Y208.858 E.1846
G1 X49.663 Y208.858 E.03972
G1 X48.142 Y207.337 E.0692
G1 X48.142 Y205.858 E.04754
G1 X52.152 Y201.848 E.18239
G3 X52.217 Y199.898 I4.409 J-.829 E.06322
G1 X48.142 Y195.823 E.18534
G1 X48.142 Y194.344 E.04754
G1 X63.858 Y178.628 E.71473
G1 X63.858 Y176.998 E.05241
G1 X48.142 Y161.281 E.71473
G1 X48.142 Y159.803 E.04754
G1 X63.858 Y144.086 E.71473
G1 X63.858 Y142.456 E.05241
G1 X48.142 Y126.739 E.71473
G1 X48.142 Y125.261 E.04754
G1 X63.858 Y109.544 E.71473
G1 X63.858 Y107.914 E.05241
G1 X48.142 Y92.197 E.71473
G1 X48.142 Y90.719 E.04754
G1 X63.858 Y75.002 E.71473
G1 X63.858 Y73.372 E.05241
G1 X48.142 Y57.656 E.71473
G1 X48.142 Y56.177 E.04754
G1 X52.217 Y52.102 E.18534
G3 X52.152 Y50.152 I4.343 J-1.12 E.06322
G1 X48.142 Y46.142 E.18239
G1 X48.142 Y44.663 E.04754
G1 X49.663 Y43.142 E.0692
G1 X50.899 Y43.142 E.03972
G1 X54.958 Y47.201 E.1846
G3 X57.104 Y47.215 I1.046 J4.063 E.06978
G1 X61.177 Y43.142 E.18524
G1 X62.413 Y43.142 E.03972
G1 X78.129 Y58.858 E.71473
G1 X80.002 Y58.858 E.06023
G1 X95.719 Y43.142 E.71473
G1 X96.954 Y43.142 E.03972
G1 X112.671 Y58.858 E.71473
G1 X114.544 Y58.858 E.06023
G1 X130.261 Y43.142 E.71474
G1 X131.496 Y43.142 E.03972
G1 X147.213 Y58.858 E.71473
G1 X149.086 Y58.858 E.06023
G1 X164.803 Y43.141 E.71474
G1 X166.038 Y43.141 E.03971
G1 X181.755 Y58.858 E.71474
G1 X183.628 Y58.858 E.06023
G1 X199.344 Y43.142 E.71473
G1 X200.58 Y43.142 E.03972
G1 X207.858 Y50.42 E.33101
G1 X207.858 Y51.899 E.04754
G1 X192.142 Y67.615 E.71473
G1 X192.142 Y69.245 E.05242
G1 X207.858 Y84.962 E.71473
G1 X207.858 Y86.44 E.04754
G1 X192.142 Y102.157 E.71473
G1 X192.142 Y103.787 E.05242
G1 X207.858 Y119.504 E.71473
G1 X207.858 Y120.982 E.04754
G1 X203.817 Y125.024 E.18381
G3 X203.817 Y126.976 I-4.352 J.976 E.06328
G1 X207.858 Y131.018 E.1838
G1 X207.858 Y132.496 E.04754
G1 X192.142 Y148.213 E.71473
G1 X192.142 Y149.843 E.05242
G1 X207.858 Y165.56 E.71473
M73 P50 R33
G1 X207.858 Y167.038 E.04754
G1 X192.142 Y182.755 E.71473
G1 X192.142 Y184.385 E.05242
G1 X207.858 Y200.101 E.71473
G1 X207.858 Y201.58 E.04754
G1 X200.58 Y208.858 E.331
G1 X199.344 Y208.858 E.03972
G1 X183.628 Y193.142 E.71473
G1 X181.755 Y193.142 E.06023
G1 X166.038 Y208.858 E.71473
G1 X164.803 Y208.858 E.03972
G1 X149.086 Y193.142 E.71473
G1 X147.213 Y193.142 E.06023
G1 X131.496 Y208.858 E.71473
G1 X130.261 Y208.858 E.03972
G1 X114.544 Y193.142 E.71473
G1 X112.671 Y193.142 E.06023
G1 X96.954 Y208.858 E.71473
G1 X95.719 Y208.858 E.03972
G1 X80.002 Y193.142 E.71473
G1 X78.129 Y193.142 E.06023
G1 X62.412 Y208.858 E.71473
G1 X61.177 Y208.858 E.03972
G1 X57.104 Y204.785 E.18524
G2 X58.529 Y204.022 I-1.159 J-3.878 E.05233
; WIPE_START
G1 X57.8 Y204.51 E-.33338
G1 X57.104 Y204.785 E-.28431
G1 X57.369 Y205.05 E-.14231
; WIPE_END
G1 E-.04 F1800
G1 X57.475 Y197.418 Z2.4 F30000
G1 X58.428 Y129.106 Z2.4
G1 Z2
G1 E.8 F1800
G1 F8843.478
G3 X56.977 Y129.818 I-2.471 J-3.202 E.05233
G1 X63.858 Y136.699 E.31293
G1 X63.858 Y138.329 E.05241
G1 X48.142 Y154.046 E.71473
G1 X48.142 Y155.524 E.04754
G1 X63.858 Y171.241 E.71473
G1 X63.858 Y172.871 E.05241
G1 X48.142 Y188.587 E.71473
G1 X48.142 Y190.066 E.04754
G1 X55.216 Y197.14 E.3217
G3 X56.847 Y197.153 I.783 J4.153 E.0528
G1 X63.858 Y190.142 E.31884
G1 X63.858 Y188.512 E.05241
G1 X48.142 Y172.795 E.71473
G1 X48.142 Y171.317 E.04754
G1 X63.858 Y155.6 E.71473
G1 X63.858 Y153.97 E.05241
G1 X48.142 Y138.253 E.71473
G1 X48.142 Y136.775 E.04754
G1 X55.082 Y129.834 E.31563
G3 X53.622 Y129.142 I.964 J-3.922 E.05233
; WIPE_START
G1 X54.378 Y129.595 E-.33505
G1 X55.082 Y129.834 E-.28262
G1 X54.817 Y130.099 E-.14233
; WIPE_END
G1 E-.04 F1800
G1 X53.622 Y122.858 Z2.4 F30000
G1 Z2
G1 E.8 F1800
G1 F8843.478
G3 X55.082 Y122.166 I2.425 J3.229 E.05233
G1 X48.142 Y115.225 E.31563
G1 X48.142 Y113.747 E.04754
G1 X63.858 Y98.03 E.71473
G1 X63.858 Y96.4 E.05241
G1 X48.142 Y80.683 E.71473
G1 X48.142 Y79.205 E.04754
G1 X63.858 Y63.488 E.71473
G1 X63.858 Y61.858 E.05241
G1 X56.847 Y54.847 E.31883
G3 X55.214 Y54.862 I-.851 J-3.879 E.05289
G1 X48.142 Y61.934 E.32163
G1 X48.142 Y63.413 E.04754
G1 X63.858 Y79.129 E.71473
G1 X63.858 Y80.759 E.05241
G1 X48.142 Y96.476 E.71473
G1 X48.142 Y97.954 E.04754
G1 X63.858 Y113.671 E.71473
G1 X63.858 Y115.301 E.05241
G1 X56.977 Y122.182 E.31293
G3 X58.428 Y122.894 I-1.019 J3.914 E.05233
G1 X59.563 Y125.644 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F10588.235
G1 X59.425 Y124.96 E.01872
G1 X59.151 Y124.302 E.01915
G1 X58.752 Y123.711 E.01914
G1 X58.244 Y123.211 E.01915
G1 X57.647 Y122.822 E.01914
G1 X56.985 Y122.558 E.01915
G1 X56.28 Y122.431 E.01923
G2 X55.221 Y122.506 I-.26 J3.874 E.02862
G1 X54.542 Y122.731 E.0192
G1 X53.923 Y123.084 E.01914
G1 X53.387 Y123.554 E.01915
G1 X52.954 Y124.12 E.01914
G1 X52.642 Y124.761 E.01915
G1 X52.463 Y125.451 E.01914
G1 X52.424 Y126.163 E.01915
G1 X52.527 Y126.868 E.01914
G1 X52.768 Y127.539 E.01914
G1 X53.137 Y128.149 E.01914
G1 X53.62 Y128.673 E.01915
G1 X54.196 Y129.092 E.01914
G1 X54.845 Y129.388 E.01915
G1 X55.539 Y129.55 E.01914
G1 X56.252 Y129.571 E.01915
G1 X56.954 Y129.45 E.01914
G1 X57.619 Y129.193 E.01915
G1 X58.219 Y128.809 E.01914
G1 X58.732 Y128.313 E.01915
G1 X59.136 Y127.726 E.01914
G1 X59.416 Y127.07 E.01915
G1 X59.56 Y126.372 E.01914
G1 X59.563 Y125.704 E.01796
G1 X59.563 Y50.643 F30000
G1 F10588.235
G1 X59.425 Y49.96 E.01873
G1 X59.151 Y49.302 E.01915
G1 X58.752 Y48.711 E.01914
G1 X58.244 Y48.211 E.01915
G1 X57.647 Y47.822 E.01914
G1 X56.985 Y47.558 E.01915
G1 X56.28 Y47.431 E.01923
G2 X55.221 Y47.506 I-.26 J3.874 E.02862
G1 X54.542 Y47.731 E.01919
G1 X53.923 Y48.085 E.01916
G1 X53.387 Y48.554 E.01913
G1 X52.954 Y49.12 E.01915
G1 X52.642 Y49.761 E.01914
G1 X52.463 Y50.451 E.01915
G1 X52.424 Y51.163 E.01915
G1 X52.527 Y51.868 E.01914
G1 X52.768 Y52.539 E.01915
G1 X53.137 Y53.149 E.01914
G1 X53.62 Y53.673 E.01915
G1 X54.196 Y54.092 E.01914
G1 X54.845 Y54.388 E.01914
G1 X55.539 Y54.55 E.01915
G1 X56.252 Y54.571 E.01915
G1 X56.954 Y54.45 E.01915
G1 X57.619 Y54.193 E.01915
G1 X58.219 Y53.809 E.01914
G1 X58.732 Y53.313 E.01915
G1 X59.136 Y52.726 E.01914
G1 X59.416 Y52.07 E.01915
G1 X59.56 Y51.372 E.01914
G1 X59.563 Y50.703 E.01796
G1 X122.878 Y42.779 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X125.756 Y42.779 E.07731
; Slow Down End
G1 X128.603 Y42.779 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X131.499 Y42.779 E.07778
; Slow Down End
G1 X134.328 Y42.779 F30000
; Slow Down Start
; LINE_WIDTH: 0.382948
G1 F3000;_EXTRUDE_SET_SPEED
G1 X208.062 Y42.779 E1.98046
G1 X208.194 Y42.806 E.00362
G1 X208.221 Y42.938 E.00362
G1 X208.221 Y209.062 E4.46204
G1 X208.194 Y209.194 E.00362
G1 X208.062 Y209.221 E.00362
G1 X47.938 Y209.221 E4.30088
G1 X47.806 Y209.194 E.00362
G1 X47.779 Y209.062 E.00362
G1 X47.779 Y42.938 E4.46204
G1 X47.806 Y42.806 E.00362
G1 X47.938 Y42.779 E.00362
G1 X120.014 Y42.779 E1.93594
; Slow Down End
G1 X125.133 Y48.293 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X119.982 Y43.142 E.23426
G1 X118.747 Y43.142 E.03972
G1 X103.03 Y58.858 E.71473
G1 X101.157 Y58.858 E.06023
G1 X85.44 Y43.142 E.71473
G1 X84.205 Y43.142 E.03972
G1 X68.488 Y58.858 E.71473
G1 X66.615 Y58.858 E.06023
G1 X59.8 Y52.043 E.30995
G2 X59.864 Y50.211 I-4.586 J-1.079 E.0593
G1 X66.934 Y43.142 E.32151
G1 X68.17 Y43.142 E.03972
G1 X83.886 Y58.858 E.71473
G1 X85.759 Y58.858 E.06023
G1 X101.476 Y43.142 E.71473
G1 X102.711 Y43.142 E.03972
G1 X118.428 Y58.858 E.71473
G1 X120.301 Y58.858 E.06023
G1 X125.295 Y53.865 E.2271
; WIPE_START
G1 X123.881 Y55.279 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.706 Y53.866 Z2.4 F30000
G1 Z2
G1 E.8 F1800
G1 F8843.478
G1 X135.699 Y58.858 E.22704
G1 X137.572 Y58.858 E.06023
G1 X153.289 Y43.141 E.71474
G1 X154.524 Y43.141 E.03971
G1 X170.241 Y58.858 E.71474
G1 X172.114 Y58.858 E.06023
G1 X187.831 Y43.142 E.71474
G1 X189.066 Y43.142 E.03972
G1 X196.14 Y50.215 E.32169
G2 X196.199 Y52.044 I4.537 J.767 E.05922
G1 X189.385 Y58.858 E.3099
G1 X187.512 Y58.858 E.06023
G1 X171.795 Y43.141 E.71474
G1 X170.56 Y43.141 E.03971
G1 X154.843 Y58.858 E.71474
G1 X152.97 Y58.858 E.06023
G1 X137.253 Y43.141 E.71475
G1 X136.018 Y43.141 E.0397
G1 X130.864 Y48.295 E.23437
G1 X131.563 Y50.643 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
M73 P51 R33
G1 F10588.235
G1 X131.425 Y49.96 E.01873
G1 X131.151 Y49.302 E.01915
G1 X130.753 Y48.711 E.01913
G1 X130.244 Y48.211 E.01916
G1 X129.647 Y47.822 E.01914
G1 X128.985 Y47.558 E.01915
G1 X128.28 Y47.431 E.01923
G2 X127.221 Y47.506 I-.26 J3.874 E.02862
G1 X126.542 Y47.731 E.01919
G1 X125.923 Y48.084 E.01914
G1 X125.387 Y48.554 E.01914
G1 X124.954 Y49.12 E.01915
G1 X124.642 Y49.761 E.01915
G1 X124.463 Y50.451 E.01915
G1 X124.424 Y51.163 E.01915
G1 X124.527 Y51.868 E.01914
G1 X124.768 Y52.539 E.01915
G1 X125.137 Y53.149 E.01914
G1 X125.619 Y53.673 E.01914
G1 X126.197 Y54.092 E.01915
G1 X126.845 Y54.388 E.01914
G1 X127.539 Y54.55 E.01914
G1 X128.252 Y54.571 E.01915
G1 X128.954 Y54.45 E.01914
G1 X129.619 Y54.193 E.01915
G1 X130.22 Y53.808 E.01915
G1 X130.732 Y53.313 E.01914
G1 X131.136 Y52.726 E.01914
G1 X131.416 Y52.07 E.01915
G1 X131.56 Y51.372 E.01915
G1 X131.563 Y50.703 E.01796
G1 X167.985 Y58.858 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X166.357 Y58.858 E.05236
G1 X182.074 Y43.142 E.71474
G1 X183.309 Y43.142 E.03972
G1 X207.858 Y67.691 E1.11642
G1 X207.858 Y69.169 E.04754
G1 X192.142 Y84.886 E.71473
G1 X192.142 Y86.516 E.05242
G1 X207.858 Y102.233 E.71473
G1 X207.858 Y103.711 E.04754
G1 X192.142 Y119.428 E.71473
G1 X192.142 Y121.058 E.05242
G1 X196.166 Y125.083 E.18303
G2 X196.166 Y126.917 I3.926 J.917 E.05951
G1 X192.142 Y130.942 E.18303
G1 X192.142 Y132.572 E.05242
G1 X207.858 Y148.289 E.71473
G1 X207.858 Y149.767 E.04754
G1 X192.142 Y165.484 E.71473
G1 X192.142 Y167.114 E.05242
G1 X207.858 Y182.831 E.71473
G1 X207.858 Y184.309 E.04754
G1 X183.309 Y208.858 E1.11641
G1 X182.074 Y208.858 E.03972
G1 X166.357 Y193.142 E.71473
G1 X164.484 Y193.142 E.06023
G1 X148.767 Y208.858 E.71473
G1 X147.532 Y208.858 E.03972
G1 X131.815 Y193.142 E.71473
G1 X129.942 Y193.142 E.06023
G1 X114.225 Y208.858 E.71473
G1 X112.99 Y208.858 E.03972
G1 X97.273 Y193.142 E.71473
G1 X95.4 Y193.142 E.06023
G1 X79.683 Y208.858 E.71473
G1 X78.448 Y208.858 E.03972
G1 X48.142 Y178.552 E1.37822
G1 X48.142 Y177.073 E.04754
G1 X63.858 Y161.357 E.71473
G1 X63.858 Y159.727 E.05241
G1 X48.142 Y144.01 E.71473
G1 X48.142 Y142.532 E.04754
G1 X63.858 Y126.815 E.71473
G1 X63.858 Y125.185 E.05241
G1 X48.142 Y109.468 E.71473
G1 X48.142 Y107.99 E.04754
G1 X63.858 Y92.273 E.71473
G1 X63.858 Y90.643 E.05241
G1 X48.142 Y74.926 E.71473
G1 X48.142 Y73.448 E.04754
G1 X78.448 Y43.142 E1.37822
G1 X79.683 Y43.142 E.03972
G1 X95.4 Y58.858 E.71473
G1 X97.273 Y58.858 E.06023
G1 X112.99 Y43.142 E.71473
G1 X114.225 Y43.142 E.03972
G1 X129.942 Y58.858 E.71473
G1 X131.815 Y58.858 E.06023
G1 X147.532 Y43.141 E.71474
G1 X148.767 Y43.141 E.03971
G1 X164.484 Y58.858 E.71474
G1 X162.855 Y58.858 E.05236
G1 X191.752 Y59.248 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.382953
G1 F10587.23
G1 X191.62 Y59.221 E.00362
G1 X64.38 Y59.221 E3.41767
G1 X64.248 Y59.248 E.00362
G1 X64.221 Y59.38 E.00362
G1 X64.221 Y192.62 E3.57883
G1 X64.248 Y192.752 E.00362
G1 X64.38 Y192.779 E.00362
G1 X191.62 Y192.779 E3.41767
G1 X191.752 Y192.752 E.00362
G1 X191.779 Y192.62 E.00362
G1 X191.779 Y59.38 E3.57883
G1 X191.764 Y59.307 E.00201
; WIPE_START
G1 X191.779 Y59.38 E-.02839
G1 X191.779 Y61.306 E-.73161
; WIPE_END
G1 E-.04 F1800
G1 X197.439 Y56.185 Z2.4 F30000
G1 X203.563 Y50.643 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.38292
G1 F10588.235
G1 X203.425 Y49.96 E.01873
G1 X203.151 Y49.302 E.01915
G1 X202.752 Y48.711 E.01914
G1 X202.244 Y48.211 E.01915
G1 X201.647 Y47.822 E.01914
G1 X200.985 Y47.558 E.01915
G1 X200.28 Y47.431 E.01922
G2 X199.221 Y47.506 I-.26 J3.874 E.02862
G1 X198.542 Y47.731 E.01919
G1 X197.923 Y48.084 E.01915
G1 X197.387 Y48.554 E.01914
G1 X196.954 Y49.12 E.01914
G1 X196.642 Y49.761 E.01915
G1 X196.463 Y50.451 E.01915
G1 X196.424 Y51.163 E.01915
G1 X196.527 Y51.868 E.01914
G1 X196.768 Y52.539 E.01915
G1 X197.137 Y53.149 E.01915
G1 X197.619 Y53.673 E.01914
G1 X198.197 Y54.092 E.01915
G1 X198.845 Y54.388 E.01914
G1 X199.539 Y54.55 E.01915
G1 X200.252 Y54.571 E.01915
G1 X200.954 Y54.45 E.01914
G1 X201.619 Y54.193 E.01914
G1 X202.22 Y53.808 E.01915
G1 X202.732 Y53.313 E.01914
G1 X203.136 Y52.726 E.01914
G1 X203.416 Y52.07 E.01915
G1 X203.56 Y51.372 E.01914
G1 X203.563 Y50.703 E.01796
G1 X197.574 Y122.896 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X199.023 Y122.183 I2.441 J3.127 E.05232
G1 X192.142 Y115.301 E.31294
G1 X192.142 Y113.671 E.05242
G1 X207.858 Y97.954 E.71473
G1 X207.858 Y96.476 E.04754
G1 X192.142 Y80.759 E.71473
G1 X192.142 Y79.129 E.05242
G1 X207.858 Y63.413 E.71473
G1 X207.858 Y61.934 E.04754
G1 X200.786 Y54.861 E.32164
G3 X199.15 Y54.85 I-.791 J-3.965 E.05297
G1 X192.142 Y61.858 E.3187
G1 X192.142 Y63.488 E.05242
G1 X207.858 Y79.205 E.71473
G1 X207.858 Y80.683 E.04754
G1 X192.142 Y96.4 E.71473
G1 X192.142 Y98.03 E.05242
G1 X207.858 Y113.747 E.71473
G1 X207.858 Y115.225 E.04754
G1 X200.915 Y122.168 E.31574
G3 X202.377 Y122.857 I-.926 J3.86 E.05232
G1 X203.563 Y125.644 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F10588.235
G1 X203.425 Y124.96 E.01872
G1 X203.151 Y124.302 E.01915
G1 X202.752 Y123.711 E.01915
G1 X202.244 Y123.211 E.01914
G1 X201.647 Y122.822 E.01914
G1 X200.985 Y122.558 E.01915
G1 X200.28 Y122.431 E.01922
G2 X199.221 Y122.506 I-.26 J3.873 E.02862
G1 X198.542 Y122.731 E.01919
G1 X197.923 Y123.084 E.01915
G1 X197.387 Y123.554 E.01914
G1 X196.954 Y124.12 E.01914
G1 X196.642 Y124.761 E.01914
G1 X196.463 Y125.451 E.01915
G1 X196.424 Y126.163 E.01915
G1 X196.527 Y126.868 E.01914
G1 X196.768 Y127.539 E.01914
G1 X197.137 Y128.149 E.01915
G1 X197.62 Y128.673 E.01915
G1 X198.196 Y129.092 E.01914
G1 X198.845 Y129.388 E.01914
G1 X199.539 Y129.55 E.01914
G1 X200.252 Y129.571 E.01915
G1 X200.954 Y129.45 E.01914
G1 X201.619 Y129.193 E.01914
G1 X202.22 Y128.808 E.01915
G1 X202.732 Y128.313 E.01914
G1 X203.136 Y127.726 E.01914
G1 X203.416 Y127.07 E.01915
G1 X203.56 Y126.372 E.01914
G1 X203.563 Y125.704 E.01796
G1 X202.377 Y129.143 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X200.915 Y129.832 I-2.388 J-3.171 E.05232
G1 X207.858 Y136.775 E.31574
G1 X207.858 Y138.253 E.04754
G1 X192.142 Y153.97 E.71473
G1 X192.142 Y155.6 E.05242
G1 X207.858 Y171.317 E.71473
G1 X207.858 Y172.795 E.04754
G1 X192.142 Y188.512 E.71473
G1 X192.142 Y190.142 E.05242
G1 X199.15 Y197.15 E.3187
G3 X200.786 Y197.139 I.848 J4.377 E.05291
G1 X207.858 Y190.066 E.32164
G1 X207.858 Y188.587 E.04754
G1 X192.142 Y172.871 E.71473
G1 X192.142 Y171.241 E.05242
G1 X207.858 Y155.524 E.71473
G1 X207.858 Y154.046 E.04754
G1 X192.142 Y138.329 E.71473
G1 X192.142 Y136.699 E.05242
G1 X199.023 Y129.817 E.31294
G3 X197.574 Y129.104 I.991 J-3.841 E.05232
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X198.378 Y129.595 E-.35822
G1 X199.023 Y129.817 E-.25929
G1 X198.758 Y130.083 E-.14248
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/58
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
G1 X129.048 Y197.961
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X129.176 Y198.004 E.00434
G3 X127.795 Y197.792 I-1.167 J2.996 E.60434
G3 X128.871 Y197.904 I.201 J3.288 E.03494
G1 X128.991 Y197.943 E.00403
G1 X128.602 Y198.258 F30000
G1 F8843.478
G1 X128.761 Y198.295 E.00525
G3 X127.826 Y198.198 I-.752 J2.706 E.53711
G3 X128.488 Y198.232 I.192 J2.722 E.02137
G1 X128.544 Y198.245 E.00184
G1 X128.225 Y198.612 F30000
G1 F8843.478
G1 X128.651 Y198.687 E.01391
G3 X127.856 Y198.604 I-.643 J2.314 E.45939
G3 X128.165 Y198.615 I.035 J3.517 E.00993
G1 X127.884 Y198.995 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X127.886 Y198.995 E.00006
G3 X128.349 Y199.02 I.113 J2.201 E.01385
G3 X127.554 Y199.044 I-.34 J1.98 E.35205
G1 X127.825 Y199.004 E.00816
; WIPE_START
M204 S10000
G1 X127.886 Y198.995 E-.02351
G1 X128.15 Y198.995 E-.1005
G1 X128.349 Y199.02 E-.07618
G1 X128.734 Y199.129 E-.15213
G1 X129.091 Y199.311 E-.15208
G1 X129.404 Y199.561 E-.15213
G1 X129.579 Y199.769 E-.10347
; WIPE_END
G1 E-.04 F1800
G1 X121.948 Y199.601 Z2.6 F30000
G1 X54.58 Y198.116 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X54.679 Y198.073 E.00349
G3 X55.795 Y197.792 I1.33 J2.927 E.03722
G3 X57.176 Y198.004 I.201 J3.288 E.04525
G3 X54.395 Y198.22 I-1.167 J2.996 E.55683
G1 X54.527 Y198.146 E.00488
G1 X55.066 Y198.351 F30000
G1 F8843.478
G1 X55.107 Y198.341 E.00135
G3 X55.826 Y198.198 I.903 J2.66 E.02365
G3 X56.761 Y198.295 I.192 J2.722 E.03039
G3 X54.847 Y198.444 I-.752 J2.706 E.50446
G1 X55.011 Y198.375 E.00572
G1 X55.559 Y198.645 F30000
G1 F8843.478
G1 X55.856 Y198.604 E.00965
G3 X56.651 Y198.687 I.035 J3.517 E.02574
G3 X55.466 Y198.661 I-.643 J2.314 E.44669
G1 X55.5 Y198.655 E.0011
G1 X55.884 Y198.995 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X55.886 Y198.995 E.00006
G3 X56.349 Y199.02 I.113 J2.201 E.01385
G3 X55.554 Y199.044 I-.34 J1.98 E.35205
G1 X55.824 Y199.004 E.00816
; WIPE_START
M204 S10000
G1 X55.886 Y198.995 E-.02354
G1 X56.15 Y198.995 E-.10049
G1 X56.349 Y199.02 E-.07618
G1 X56.734 Y199.129 E-.15213
G1 X57.091 Y199.311 E-.15208
G1 X57.404 Y199.561 E-.15213
G1 X57.579 Y199.769 E-.10345
; WIPE_END
G1 E-.04 F1800
G1 X57.669 Y192.138 Z2.6 F30000
G1 X58.43 Y128.106 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X58.249 Y128.306 E.00866
G3 X55.796 Y122.792 I-2.241 J-2.306 E.39765
G3 X57.176 Y123.004 I.201 J3.289 E.04525
G3 X58.473 Y128.065 I-1.167 J2.996 E.1961
G1 X58.13 Y127.832 F30000
G1 F8843.478
G1 X57.966 Y128.016 E.00792
G3 X55.826 Y123.198 I-1.957 J-2.015 E.34743
G3 X56.761 Y123.295 I.192 J2.725 E.03038
G3 X58.174 Y127.792 I-.751 J2.706 E.17985
G1 X57.817 Y127.568 F30000
G1 F8843.478
G1 X57.501 Y127.882 E.01432
G3 X55.856 Y123.604 I-1.493 J-1.881 E.28951
G3 X56.651 Y123.687 I.034 J3.523 E.02573
G3 X57.861 Y127.528 I-.643 J2.314 E.15362
G1 X57.538 Y127.294 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X57.256 Y127.575 E.01185
G3 X55.886 Y123.995 I-1.247 J-1.575 E.22433
G3 X56.349 Y124.02 I.113 J2.2 E.01385
G3 X57.578 Y127.254 I-.34 J1.98 E.12417
; WIPE_START
M204 S10000
G1 X57.256 Y127.575 E-.17263
G1 X57.091 Y127.689 E-.07624
G1 X56.734 Y127.871 E-.15213
G1 X56.349 Y127.98 E-.15211
G1 X55.95 Y128.01 E-.15212
G1 X55.807 Y127.992 E-.05476
; WIPE_END
G1 E-.04 F1800
G1 X62.701 Y131.267 Z2.6 F30000
G1 X191.416 Y192.416 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X64.584 Y192.416 E4.07847
G1 X64.584 Y59.584 E4.27141
G1 X191.416 Y59.584 E4.07847
G1 X191.416 Y192.356 E4.26948
G1 X191.009 Y192.009 F30000
G1 F8843.478
G1 X64.991 Y192.009 E4.05229
G1 X64.991 Y59.991 E4.24523
G1 X191.009 Y59.991 E4.05229
G1 X191.009 Y191.949 E4.2433
G1 X190.602 Y191.602 F30000
G1 F8843.478
G1 X65.398 Y191.602 E4.02611
G1 X65.398 Y60.398 E4.21905
G1 X190.602 Y60.398 E4.02611
G1 X190.602 Y191.542 E4.21712
G1 X190.21 Y191.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X65.79 Y191.21 E3.70605
G1 X65.79 Y60.79 E3.88477
G1 X190.21 Y60.79 E3.70605
G1 X190.21 Y191.15 E3.88298
; WIPE_START
M204 S10000
G1 X188.21 Y191.151 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X183 Y185.574 Z2.6 F30000
G1 X54.58 Y48.116 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X54.679 Y48.073 E.00348
G3 X55.796 Y47.792 I1.329 J2.927 E.03721
G3 X57.176 Y48.004 I.201 J3.288 E.04524
G3 X54.395 Y48.22 I-1.167 J2.996 E.55682
G1 X54.528 Y48.145 E.0049
G1 X55.066 Y48.351 F30000
G1 F8843.478
G1 X55.107 Y48.341 E.00134
G3 X55.826 Y48.198 I.903 J2.66 E.02365
G3 X56.761 Y48.295 I.192 J2.724 E.03038
G3 X54.847 Y48.444 I-.751 J2.706 E.50447
G1 X55.011 Y48.375 E.00574
G1 X55.56 Y48.645 F30000
G1 F8843.478
G1 X55.856 Y48.604 E.00963
G3 X56.651 Y48.687 I.035 J3.521 E.02574
G3 X55.466 Y48.661 I-.643 J2.314 E.4467
G1 X55.501 Y48.655 E.00112
G1 X55.891 Y48.995 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X56.15 Y48.997 E.00772
G3 X56.349 Y49.02 I-.151 J2.198 E.00597
G3 X55.831 Y48.999 I-.34 J1.98 E.36043
; WIPE_START
M204 S10000
G1 X56.15 Y48.997 E-.1212
G1 X56.349 Y49.02 E-.07613
G1 X56.734 Y49.129 E-.15213
G1 X57.091 Y49.311 E-.15211
G1 X57.404 Y49.561 E-.1521
G1 X57.583 Y49.775 E-.10633
; WIPE_END
G1 E-.04 F1800
G1 X65.214 Y49.592 Z2.6 F30000
G1 X126.58 Y48.116 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X126.679 Y48.073 E.00348
G3 X127.796 Y47.792 I1.33 J2.927 E.03721
G3 X129.176 Y48.004 I.201 J3.288 E.04524
G3 X126.395 Y48.22 I-1.167 J2.996 E.55683
G1 X126.528 Y48.146 E.00489
G1 X127.066 Y48.351 F30000
G1 F8843.478
G1 X127.107 Y48.341 E.00134
G3 X127.826 Y48.198 I.903 J2.66 E.02365
G3 X128.761 Y48.295 I.192 J2.724 E.03038
G3 X126.847 Y48.444 I-.751 J2.706 E.50447
G1 X127.011 Y48.375 E.00573
G1 X127.559 Y48.645 F30000
G1 F8843.478
G1 X127.856 Y48.604 E.00964
G3 X128.651 Y48.687 I.034 J3.521 E.02574
G3 X127.466 Y48.661 I-.643 J2.314 E.4467
G1 X127.5 Y48.655 E.00111
G1 X127.891 Y48.995 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.15 Y48.997 E.00771
G3 X128.349 Y49.02 I-.151 J2.198 E.00597
G3 X127.831 Y48.999 I-.34 J1.98 E.36044
; WIPE_START
M204 S10000
G1 X128.15 Y48.997 E-.1211
G1 X128.349 Y49.02 E-.07614
G1 X128.734 Y49.129 E-.15213
G1 X129.091 Y49.311 E-.15212
G1 X129.404 Y49.561 E-.1521
G1 X129.584 Y49.775 E-.10641
; WIPE_END
G1 E-.04 F1800
G1 X137.214 Y49.582 Z2.6 F30000
G1 X201.047 Y47.961 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X201.176 Y48.005 E.00435
G3 X199.796 Y47.792 I-1.167 J2.996 E.60433
G3 X200.871 Y47.904 I.201 J3.288 E.03492
G1 X200.99 Y47.943 E.00404
G1 X200.602 Y48.258 F30000
G1 F8843.478
G1 X200.761 Y48.295 E.00525
G3 X199.826 Y48.198 I-.751 J2.706 E.53711
G3 X200.488 Y48.232 I.192 J2.724 E.02137
G1 X200.543 Y48.245 E.00182
G1 X200.225 Y48.612 F30000
G1 F8843.478
G1 X200.651 Y48.687 E.01392
G3 X199.856 Y48.604 I-.643 J2.314 E.45939
G3 X200.165 Y48.615 I.034 J3.522 E.00992
G1 X199.891 Y48.995 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X200.15 Y48.997 E.00772
G3 X200.349 Y49.02 I-.151 J2.198 E.00597
G3 X199.831 Y48.999 I-.34 J1.98 E.36042
; WIPE_START
M204 S10000
G1 X200.15 Y48.997 E-.12125
G1 X200.349 Y49.02 E-.07613
G1 X200.735 Y49.129 E-.15214
G1 X201.091 Y49.311 E-.15207
G1 X201.404 Y49.561 E-.15214
G1 X201.583 Y49.775 E-.10627
; WIPE_END
G1 E-.04 F1800
G1 X201.271 Y57.401 Z2.6 F30000
G1 X198.58 Y123.116 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X198.679 Y123.073 E.00348
G3 X199.796 Y122.792 I1.33 J2.927 E.03721
G3 X201.176 Y123.004 I.201 J3.289 E.04524
G3 X198.395 Y123.22 I-1.167 J2.996 E.55683
G1 X198.528 Y123.145 E.0049
G1 X199.066 Y123.351 F30000
G1 F8843.478
G1 X199.107 Y123.341 E.00134
G3 X199.826 Y123.198 I.903 J2.66 E.02365
G3 X200.761 Y123.295 I.192 J2.724 E.03038
G3 X198.847 Y123.444 I-.751 J2.706 E.50447
G1 X199.011 Y123.375 E.00573
G1 X199.559 Y123.645 F30000
G1 F8843.478
G1 X199.856 Y123.604 E.00964
G3 X200.651 Y123.687 I.034 J3.522 E.02574
G3 X199.466 Y123.661 I-.643 J2.314 E.4467
G1 X199.5 Y123.655 E.00112
G1 X199.891 Y123.995 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X200.15 Y123.997 E.00772
G3 X200.349 Y124.02 I-.151 J2.198 E.00597
G3 X199.831 Y123.999 I-.34 J1.98 E.36043
; WIPE_START
M204 S10000
G1 X200.15 Y123.997 E-.12119
G1 X200.349 Y124.02 E-.07613
G1 X200.735 Y124.129 E-.15215
G1 X201.091 Y124.311 E-.15209
G1 X201.404 Y124.561 E-.1521
G1 X201.583 Y124.775 E-.10633
; WIPE_END
G1 E-.04 F1800
G1 X201.271 Y132.401 Z2.6 F30000
G1 X198.58 Y198.116 Z2.6
M73 P51 R32
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X198.679 Y198.073 E.00349
G3 X199.796 Y197.792 I1.33 J2.927 E.03722
G3 X201.176 Y198.004 I.201 J3.288 E.04525
G3 X198.395 Y198.22 I-1.167 J2.996 E.55683
G1 X198.527 Y198.146 E.00487
G1 X199.066 Y198.351 F30000
G1 F8843.478
G1 X199.107 Y198.341 E.00136
G3 X199.826 Y198.198 I.903 J2.66 E.02365
G3 X200.761 Y198.295 I.192 J2.724 E.03038
G3 X198.847 Y198.444 I-.751 J2.706 E.50447
G1 X199.01 Y198.375 E.00572
G1 X199.559 Y198.645 F30000
G1 F8843.478
G1 X199.856 Y198.604 E.00965
G3 X200.651 Y198.687 I.035 J3.52 E.02574
G3 X199.466 Y198.661 I-.643 J2.314 E.4467
G1 X199.5 Y198.655 E.0011
G1 X199.884 Y198.995 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X199.886 Y198.995 E.00004
G3 X200.349 Y199.02 I.113 J2.201 E.01385
G3 X199.554 Y199.044 I-.34 J1.98 E.35205
G1 X199.825 Y199.004 E.00817
; WIPE_START
M204 S10000
G1 X199.886 Y198.995 E-.02335
G1 X200.15 Y198.995 E-.1005
G1 X200.349 Y199.02 E-.07617
G1 X200.735 Y199.129 E-.15214
G1 X201.091 Y199.311 E-.15207
G1 X201.404 Y199.561 E-.15213
G1 X201.579 Y199.77 E-.10364
; WIPE_END
G1 E-.04 F1800
G1 X206.013 Y205.982 Z2.6 F30000
G1 X208.584 Y209.584 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X47.416 Y209.584 E5.18256
G1 X47.416 Y42.416 E5.3755
G1 X208.584 Y42.416 E5.18256
G1 X208.584 Y209.524 E5.37357
G1 X208.991 Y209.991 F30000
G1 F8843.478
G1 X47.009 Y209.991 E5.20874
G1 X47.009 Y42.009 E5.40168
G1 X208.991 Y42.009 E5.20874
G1 X208.991 Y209.931 E5.39975
G1 X209.398 Y210.398 F30000
G1 F8843.478
G1 X46.602 Y210.398 E5.23492
G1 X46.602 Y41.602 E5.42786
G1 X209.398 Y41.602 E5.23492
G1 X209.398 Y210.338 E5.42593
G1 X209.79 Y210.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P52 R32
G1 F9547.055
M204 S5000
G1 X46.21 Y210.79 E4.87249
G1 X46.21 Y41.21 E5.05121
G1 X209.79 Y41.21 E4.87249
G1 X209.79 Y210.73 E5.04942
; WIPE_START
M204 S10000
G1 X207.79 Y210.731 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X207.507 Y209.417 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40001
; LAYER_HEIGHT: 0.4
M106 S229.5
G1 F3000
G1 X208.214 Y208.709 E.04964
G1 X208.214 Y208.073 E.03159
G1 X207.073 Y209.214 E.0801
G1 X206.437 Y209.214 E.03159
G1 X208.214 Y207.437 E.12477
G1 X208.214 Y206.8 E.03159
G1 X205.8 Y209.214 E.16944
G1 X205.164 Y209.214 E.03159
G1 X208.214 Y206.164 E.21412
G1 X208.214 Y205.527 E.03159
G1 X204.527 Y209.214 E.25879
G1 X203.891 Y209.214 E.03159
G1 X208.214 Y204.891 E.30346
G1 X208.214 Y204.255 E.03159
G1 X203.255 Y209.214 E.34813
G1 X202.618 Y209.214 E.03159
G1 X208.214 Y203.618 E.39281
G1 X208.214 Y202.982 E.03159
G1 X201.982 Y209.214 E.43748
G1 X201.345 Y209.214 E.03159
G1 X208.214 Y202.345 E.48215
G1 X208.214 Y201.709 E.03159
G1 X200.709 Y209.214 E.52682
G1 X200.073 Y209.214 E.03159
G1 X208.214 Y201.073 E.5715
G1 X208.214 Y200.436 E.03159
G1 X199.436 Y209.214 E.61617
G1 X198.8 Y209.214 E.03159
G1 X208.214 Y199.8 E.66084
G1 X208.214 Y199.163 E.03159
G1 X198.163 Y209.214 E.70551
G1 X197.527 Y209.214 E.03159
G1 X208.214 Y198.527 E.75019
G1 X208.214 Y197.891 E.03159
G1 X196.891 Y209.214 E.79486
G1 X196.254 Y209.214 E.03159
G1 X201.036 Y204.432 E.33565
G3 X200.253 Y204.578 I-.865 J-2.468 E.03966
G1 X195.618 Y209.214 E.32541
G1 X194.981 Y209.214 E.03159
G1 X199.63 Y204.566 E.32628
G3 X199.092 Y204.467 I.451 J-3.975 E.02716
G1 X194.345 Y209.214 E.33321
G1 X193.708 Y209.214 E.03159
G1 X198.616 Y204.307 E.34449
G3 X198.189 Y204.097 I2.107 J-4.822 E.0236
G1 X193.072 Y209.214 E.35922
G1 X192.436 Y209.214 E.03159
G1 X197.811 Y203.838 E.37735
G3 X197.473 Y203.541 I1.315 J-1.84 E.02242
G1 X191.799 Y209.214 E.39824
G1 X191.163 Y209.214 E.03159
G1 X197.172 Y203.205 E.42182
G3 X196.914 Y202.826 I4.199 J-3.139 E.02274
G1 X190.526 Y209.214 E.44838
G1 X189.89 Y209.214 E.03159
G1 X196.702 Y202.402 E.47817
G3 X196.537 Y201.931 I2.272 J-1.061 E.02483
G1 X189.254 Y209.214 E.51125
G1 X188.617 Y209.214 E.03159
G1 X196.438 Y201.393 E.54897
G3 X196.421 Y200.774 I4.094 J-.421 E.0308
G1 X187.981 Y209.214 E.59247
G1 X187.344 Y209.214 E.03159
G1 X196.558 Y200 E.64676
G1 X196.576 Y199.943 E.003
G3 X198.246 Y197.872 I3.441 J1.066 E.13525
G3 X199 Y197.559 I1.812 J3.296 E.04059
G1 X208.214 Y188.344 E.64679
G1 X208.214 Y188.981 E.03159
G1 X199.771 Y197.423 E.59263
G3 X200.394 Y197.438 I.163 J6.502 E.0309
G1 X208.214 Y189.617 E.54896
G1 X208.214 Y190.254 E.03159
G1 X200.931 Y197.537 E.51124
G3 X201.403 Y197.701 I-1.266 J4.385 E.02481
G1 X208.214 Y190.89 E.47813
G1 X208.214 Y191.526 E.03159
G1 X201.825 Y197.916 E.44849
G3 X202.205 Y198.172 I-1.093 J2.033 E.0228
G1 X208.214 Y192.163 E.4218
G1 X208.214 Y192.799 E.03159
G1 X202.542 Y198.471 E.39814
G3 X202.838 Y198.812 I-1.555 J1.65 E.02243
G1 X208.214 Y193.436 E.37737
G1 X208.214 Y194.072 E.03159
G1 X203.095 Y199.192 E.35936
G3 X203.309 Y199.614 I-4.935 J2.772 E.0235
G1 X208.214 Y194.708 E.34432
G1 X208.214 Y195.345 E.03159
G1 X203.467 Y200.092 E.33324
G3 X203.568 Y200.628 I-2.622 J.772 E.02709
G1 X208.214 Y195.981 E.32614
G1 X208.214 Y196.618 E.03159
G1 X203.575 Y201.257 E.32563
G3 X203.435 Y202.033 I-4.942 J-.492 E.03922
G1 X208.417 Y197.052 E.3497
M106 S102
; WIPE_START
G1 X207.002 Y198.466 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X200.271 Y202.062 Z2.6 F30000
G1 X186.505 Y209.417 Z2.6
G1 Z2.2
G1 E.8 F1800
M106 S229.5
G1 F3000
G1 X208.214 Y187.708 E1.52384
G1 X208.214 Y187.072 E.03159
G1 X186.072 Y209.214 E1.55429
G1 X185.435 Y209.214 E.03159
G1 X208.214 Y186.435 E1.59897
G1 X208.214 Y185.799 E.03159
G1 X184.799 Y209.214 E1.64364
G1 X184.162 Y209.214 E.03159
G1 X208.214 Y185.162 E1.68831
G1 X208.214 Y184.526 E.03159
G1 X183.526 Y209.214 E1.73298
G1 X182.89 Y209.214 E.03159
G1 X208.214 Y183.889 E1.77766
G1 X208.214 Y183.253 E.03159
G1 X182.253 Y209.214 E1.82233
G1 X181.617 Y209.214 E.03159
G1 X208.214 Y182.617 E1.867
G1 X208.214 Y181.98 E.03159
G1 X180.98 Y209.214 E1.91168
G1 X180.344 Y209.214 E.03159
G1 X208.214 Y181.344 E1.95635
G1 X208.214 Y180.707 E.03159
G1 X179.707 Y209.214 E2.00102
G1 X179.071 Y209.214 E.03159
G1 X208.214 Y180.071 E2.04569
G1 X208.214 Y179.435 E.03159
G1 X178.435 Y209.214 E2.09037
G1 X177.798 Y209.214 E.03159
G1 X208.214 Y178.798 E2.13504
G1 X208.214 Y178.162 E.03159
G1 X177.162 Y209.214 E2.17971
G1 X176.525 Y209.214 E.03159
G1 X208.214 Y177.525 E2.22438
G1 X208.214 Y176.889 E.03159
G1 X175.889 Y209.214 E2.26906
G1 X175.253 Y209.214 E.03159
G1 X208.214 Y176.253 E2.31373
G1 X208.214 Y175.616 E.03159
G1 X191.786 Y192.044 E1.15318
G1 X191.786 Y191.408 E.03159
G1 X208.214 Y174.98 E1.15318
G1 X208.214 Y174.343 E.03159
G1 X191.786 Y190.772 E1.15318
G1 X191.786 Y190.135 E.03159
G1 X208.214 Y173.707 E1.15318
G1 X208.214 Y173.071 E.03159
G1 X191.786 Y189.499 E1.15318
G1 X191.786 Y188.862 E.03159
G1 X208.214 Y172.434 E1.15318
G1 X208.214 Y171.798 E.03159
G1 X191.786 Y188.226 E1.15318
G1 X191.786 Y187.59 E.03159
G1 X208.214 Y171.161 E1.15318
G1 X208.214 Y170.525 E.03159
G1 X191.786 Y186.953 E1.15318
G1 X191.786 Y186.317 E.03159
G1 X208.214 Y169.888 E1.15318
G1 X208.214 Y169.252 E.03159
G1 X191.786 Y185.68 E1.15318
G1 X191.786 Y185.044 E.03159
G1 X208.214 Y168.616 E1.15318
G1 X208.214 Y167.979 E.03159
G1 X191.786 Y184.408 E1.15318
G1 X191.786 Y183.771 E.03159
G1 X208.214 Y167.343 E1.15318
G1 X208.214 Y166.706 E.03159
G1 X191.786 Y183.135 E1.15318
G1 X191.786 Y182.498 E.03159
G1 X208.214 Y166.07 E1.15318
G1 X208.214 Y165.434 E.03159
G1 X191.786 Y181.862 E1.15318
G1 X191.786 Y181.226 E.03159
G1 X208.214 Y164.797 E1.15318
G1 X208.214 Y164.161 E.03159
G1 X191.786 Y180.589 E1.15318
G1 X191.786 Y179.953 E.03159
G1 X208.214 Y163.524 E1.15318
G1 X208.214 Y162.888 E.03159
G1 X191.786 Y179.316 E1.15318
G1 X191.786 Y178.68 E.03159
G1 X208.214 Y162.252 E1.15318
G1 X208.214 Y161.615 E.03159
G1 X191.786 Y178.043 E1.15318
G1 X191.786 Y177.407 E.03159
G1 X208.214 Y160.979 E1.15318
M73 P53 R32
G1 X208.214 Y160.342 E.03159
G1 X191.786 Y176.771 E1.15318
G1 X191.786 Y176.134 E.03159
G1 X208.214 Y159.706 E1.15318
G1 X208.214 Y159.069 E.03159
G1 X191.786 Y175.498 E1.15318
G1 X191.786 Y174.861 E.03159
G1 X208.214 Y158.433 E1.15318
G1 X208.214 Y157.797 E.03159
G1 X191.786 Y174.225 E1.15318
G1 X191.786 Y173.589 E.03159
G1 X208.214 Y157.16 E1.15318
G1 X208.214 Y156.524 E.03159
G1 X191.786 Y172.952 E1.15318
G1 X191.786 Y172.316 E.03159
G1 X208.214 Y155.887 E1.15318
G1 X208.214 Y155.251 E.03159
G1 X191.786 Y171.679 E1.15318
G1 X191.786 Y171.043 E.03159
G1 X208.214 Y154.615 E1.15318
G1 X208.214 Y153.978 E.03159
G1 X191.786 Y170.407 E1.15318
G1 X191.786 Y169.77 E.03159
G1 X208.214 Y153.342 E1.15318
G1 X208.214 Y152.705 E.03159
G1 X191.786 Y169.134 E1.15318
G1 X191.786 Y168.497 E.03159
G1 X208.214 Y152.069 E1.15318
G1 X208.214 Y151.433 E.03159
G1 X191.786 Y167.861 E1.15318
G1 X191.786 Y167.224 E.03159
G1 X208.214 Y150.796 E1.15318
G1 X208.214 Y150.16 E.03159
G1 X191.786 Y166.588 E1.15318
G1 X191.786 Y165.952 E.03159
G1 X208.214 Y149.523 E1.15318
G1 X208.214 Y148.887 E.03159
G1 X191.786 Y165.315 E1.15318
G1 X191.786 Y164.679 E.03159
G1 X208.214 Y148.251 E1.15318
G1 X208.214 Y147.614 E.03159
G1 X191.786 Y164.042 E1.15318
G1 X191.786 Y163.406 E.03159
G1 X208.214 Y146.978 E1.15318
G1 X208.214 Y146.341 E.03159
G1 X191.786 Y162.77 E1.15318
G1 X191.786 Y162.133 E.03159
G1 X208.214 Y145.705 E1.15318
G1 X208.214 Y145.068 E.03159
G1 X191.786 Y161.497 E1.15318
G1 X191.786 Y160.86 E.03159
G1 X208.214 Y144.432 E1.15318
G1 X208.214 Y143.796 E.03159
G1 X191.786 Y160.224 E1.15318
G1 X191.786 Y159.588 E.03159
G1 X208.214 Y143.159 E1.15318
G1 X208.214 Y142.523 E.03159
G1 X191.786 Y158.951 E1.15318
G1 X191.786 Y158.315 E.03159
G1 X208.214 Y141.886 E1.15318
G1 X208.214 Y141.25 E.03159
G1 X191.786 Y157.678 E1.15318
G1 X191.786 Y157.042 E.03159
G1 X208.214 Y140.614 E1.15318
G1 X208.214 Y139.977 E.03159
G1 X191.786 Y156.406 E1.15318
M73 P53 R31
G1 X191.786 Y155.769 E.03159
G1 X208.214 Y139.341 E1.15318
G1 X208.214 Y138.704 E.03159
G1 X191.786 Y155.133 E1.15318
G1 X191.786 Y154.496 E.03159
G1 X208.214 Y138.068 E1.15318
G1 X208.214 Y137.432 E.03159
G1 X191.786 Y153.86 E1.15318
G1 X191.786 Y153.223 E.03159
G1 X208.214 Y136.795 E1.15318
G1 X208.214 Y136.159 E.03159
G1 X191.786 Y152.587 E1.15318
G1 X191.786 Y151.951 E.03159
G1 X208.214 Y135.522 E1.15318
G1 X208.214 Y134.886 E.03159
G1 X191.786 Y151.314 E1.15318
G1 X191.786 Y150.678 E.03159
G1 X208.214 Y134.249 E1.15318
G1 X208.214 Y133.613 E.03159
G1 X191.786 Y150.041 E1.15318
G1 X191.786 Y149.405 E.03159
G1 X208.214 Y132.977 E1.15318
G1 X208.214 Y132.34 E.03159
G1 X191.786 Y148.769 E1.15318
G1 X191.786 Y148.132 E.03159
G1 X208.214 Y131.704 E1.15318
G1 X208.214 Y131.067 E.03159
G1 X191.786 Y147.496 E1.15318
G1 X191.786 Y146.859 E.03159
G1 X208.214 Y130.431 E1.15318
G1 X208.214 Y129.795 E.03159
G1 X191.786 Y146.223 E1.15318
G1 X191.786 Y145.587 E.03159
G1 X208.214 Y129.158 E1.15318
G1 X208.214 Y128.522 E.03159
G1 X191.786 Y144.95 E1.15318
G1 X191.786 Y144.314 E.03159
G1 X208.214 Y127.885 E1.15318
G1 X208.214 Y127.249 E.03159
G1 X191.786 Y143.677 E1.15318
G1 X191.786 Y143.041 E.03159
G1 X208.214 Y126.613 E1.15318
G1 X208.214 Y125.976 E.03159
G1 X191.786 Y142.404 E1.15318
G1 X191.786 Y141.768 E.03159
G1 X208.214 Y125.34 E1.15318
G1 X208.214 Y124.703 E.03159
G1 X191.786 Y141.132 E1.15318
G1 X191.786 Y140.495 E.03159
G1 X208.214 Y124.067 E1.15318
G1 X208.214 Y123.431 E.03159
G1 X191.786 Y139.859 E1.15318
G1 X191.786 Y139.222 E.03159
G1 X208.214 Y122.794 E1.15318
G1 X208.214 Y122.158 E.03159
G1 X203.468 Y126.904 E.33317
G2 X203.58 Y126.155 I-3.483 J-.906 E.03766
G1 X208.214 Y121.521 E.32527
G1 X208.214 Y120.885 E.03159
G1 X203.555 Y125.544 E.32703
G2 X203.447 Y125.015 I-3.614 J.464 E.02679
G1 X208.214 Y120.248 E.33461
G1 X208.214 Y119.612 E.03159
G1 X203.278 Y124.548 E.34648
G1 X203.228 Y124.444 E.00575
G2 X203.058 Y124.132 I-1.644 J.693 E.01765
G1 X208.214 Y118.976 E.36193
G1 X208.214 Y118.339 E.03159
G1 X202.797 Y123.757 E.38029
G2 X202.495 Y123.422 I-4.577 J3.822 E.02237
G1 X208.214 Y117.703 E.40147
G1 X208.214 Y117.066 E.03159
G1 X202.149 Y123.131 E.42573
G2 X201.764 Y122.88 I-1.45 J1.804 E.02286
G1 X208.214 Y116.43 E.45278
G1 X208.214 Y115.794 E.03159
G1 X201.336 Y122.671 E.48279
G2 X200.853 Y122.519 I-1.657 J4.41 E.02519
G1 X208.214 Y115.157 E.51675
G1 X208.214 Y114.521 E.03159
G1 X200.308 Y122.427 E.55497
G1 X199.8 Y122.423 E.02523
G2 X199.667 Y122.431 I-.006 J.928 E.00659
G1 X208.214 Y113.884 E.59995
G1 X208.214 Y113.248 E.03159
G1 X198.866 Y122.596 E.65621
G2 X196.601 Y124.861 I1.158 J3.422 E.16469
G1 X191.786 Y129.676 E.33801
G1 X191.786 Y130.313 E.03159
G1 X196.432 Y125.667 E.32613
G2 X196.429 Y126.306 I3.631 J.335 E.03177
G1 X191.786 Y130.949 E.32593
G1 X191.786 Y131.586 E.03159
G1 X196.517 Y126.855 E.33208
G2 X196.673 Y127.334 I4.51 J-1.209 E.02506
G1 X191.786 Y132.222 E.34308
G1 X191.786 Y132.858 E.03159
G1 X196.88 Y127.764 E.35759
G2 X197.129 Y128.151 I3.512 J-1.987 E.02287
G1 X191.786 Y133.495 E.37509
M73 P54 R31
G1 X191.786 Y134.131 E.03159
G1 X197.424 Y128.493 E.39575
G2 X197.758 Y128.796 I1.677 J-1.518 E.0224
G1 X191.786 Y134.768 E.4192
G1 X191.786 Y135.404 E.03159
G1 X198.131 Y129.059 E.44539
G2 X198.547 Y129.279 I2.567 J-4.339 E.02337
G1 X191.786 Y136.04 E.47459
G1 X191.786 Y136.677 E.03159
G1 X199.017 Y129.446 E.50756
G2 X199.541 Y129.558 I.821 J-2.563 E.02666
G1 X191.786 Y137.313 E.54438
G1 X191.786 Y137.95 E.03159
G1 X200.155 Y129.581 E.58744
G2 X200.902 Y129.47 I-.182 J-3.797 E.03757
G1 X191.583 Y138.789 E.65412
M106 S102
G1 X191.583 Y129.242 F30000
M106 S229.5
G1 F3000
G1 X208.214 Y112.612 E1.1674
G1 X208.214 Y111.975 E.03159
G1 X191.786 Y128.403 E1.15318
G1 X191.786 Y127.767 E.03159
G1 X208.214 Y111.339 E1.15318
G1 X208.214 Y110.702 E.03159
G1 X191.786 Y127.131 E1.15318
G1 X191.786 Y126.494 E.03159
G1 X208.214 Y110.066 E1.15318
G1 X208.214 Y109.429 E.03159
G1 X191.786 Y125.858 E1.15318
G1 X191.786 Y125.221 E.03159
G1 X208.214 Y108.793 E1.15318
G1 X208.214 Y108.157 E.03159
G1 X191.786 Y124.585 E1.15318
G1 X191.786 Y123.949 E.03159
G1 X208.214 Y107.52 E1.15318
G1 X208.214 Y106.884 E.03159
G1 X191.786 Y123.312 E1.15318
G1 X191.786 Y122.676 E.03159
G1 X208.214 Y106.247 E1.15318
G1 X208.214 Y105.611 E.03159
G1 X191.786 Y122.039 E1.15318
G1 X191.786 Y121.403 E.03159
G1 X208.214 Y104.975 E1.15318
G1 X208.214 Y104.338 E.03159
G1 X191.786 Y120.767 E1.15318
G1 X191.786 Y120.13 E.03159
G1 X208.214 Y103.702 E1.15318
G1 X208.214 Y103.065 E.03159
G1 X191.786 Y119.494 E1.15318
G1 X191.786 Y118.857 E.03159
G1 X208.214 Y102.429 E1.15318
G1 X208.214 Y101.793 E.03159
G1 X191.786 Y118.221 E1.15318
G1 X191.786 Y117.584 E.03159
G1 X208.214 Y101.156 E1.15318
G1 X208.214 Y100.52 E.03159
G1 X191.786 Y116.948 E1.15318
G1 X191.786 Y116.312 E.03159
G1 X208.214 Y99.883 E1.15318
G1 X208.214 Y99.247 E.03159
G1 X191.786 Y115.675 E1.15318
G1 X191.786 Y115.039 E.03159
G1 X208.214 Y98.611 E1.15318
G1 X208.214 Y97.974 E.03159
G1 X191.786 Y114.402 E1.15318
G1 X191.786 Y113.766 E.03159
G1 X208.214 Y97.338 E1.15318
G1 X208.214 Y96.701 E.03159
G1 X191.786 Y113.13 E1.15318
G1 X191.786 Y112.493 E.03159
G1 X208.214 Y96.065 E1.15318
G1 X208.214 Y95.428 E.03159
G1 X191.786 Y111.857 E1.15318
G1 X191.786 Y111.22 E.03159
G1 X208.214 Y94.792 E1.15318
G1 X208.214 Y94.156 E.03159
G1 X191.786 Y110.584 E1.15318
G1 X191.786 Y109.948 E.03159
G1 X208.214 Y93.519 E1.15318
G1 X208.214 Y92.883 E.03159
G1 X191.786 Y109.311 E1.15318
G1 X191.786 Y108.675 E.03159
G1 X208.214 Y92.246 E1.15318
G1 X208.214 Y91.61 E.03159
G1 X191.786 Y108.038 E1.15318
G1 X191.786 Y107.402 E.03159
G1 X208.214 Y90.974 E1.15318
G1 X208.214 Y90.337 E.03159
G1 X191.786 Y106.766 E1.15318
G1 X191.786 Y106.129 E.03159
G1 X208.214 Y89.701 E1.15318
G1 X208.214 Y89.064 E.03159
G1 X191.786 Y105.493 E1.15318
G1 X191.786 Y104.856 E.03159
G1 X208.214 Y88.428 E1.15318
G1 X208.214 Y87.792 E.03159
G1 X191.786 Y104.22 E1.15318
G1 X191.786 Y103.583 E.03159
G1 X208.214 Y87.155 E1.15318
G1 X208.214 Y86.519 E.03159
G1 X191.786 Y102.947 E1.15318
G1 X191.786 Y102.311 E.03159
G1 X208.214 Y85.882 E1.15318
G1 X208.214 Y85.246 E.03159
G1 X191.786 Y101.674 E1.15318
G1 X191.786 Y101.038 E.03159
G1 X208.214 Y84.61 E1.15318
G1 X208.214 Y83.973 E.03159
G1 X191.786 Y100.401 E1.15318
G1 X191.786 Y99.765 E.03159
G1 X208.214 Y83.337 E1.15318
G1 X208.214 Y82.7 E.03159
G1 X191.786 Y99.129 E1.15318
G1 X191.786 Y98.492 E.03159
G1 X208.214 Y82.064 E1.15318
G1 X208.214 Y81.427 E.03159
G1 X191.786 Y97.856 E1.15318
G1 X191.786 Y97.219 E.03159
G1 X208.214 Y80.791 E1.15318
G1 X208.214 Y80.155 E.03159
G1 X191.786 Y96.583 E1.15318
G1 X191.786 Y95.947 E.03159
G1 X208.214 Y79.518 E1.15318
G1 X208.214 Y78.882 E.03159
G1 X191.786 Y95.31 E1.15318
G1 X191.786 Y94.674 E.03159
G1 X208.214 Y78.245 E1.15318
G1 X208.214 Y77.609 E.03159
G1 X191.786 Y94.037 E1.15318
G1 X191.786 Y93.401 E.03159
G1 X208.214 Y76.973 E1.15318
G1 X208.214 Y76.336 E.03159
G1 X191.786 Y92.764 E1.15318
G1 X191.786 Y92.128 E.03159
G1 X208.214 Y75.7 E1.15318
G1 X208.214 Y75.063 E.03159
G1 X191.786 Y91.492 E1.15318
G1 X191.786 Y90.855 E.03159
G1 X208.214 Y74.427 E1.15318
G1 X208.214 Y73.791 E.03159
G1 X191.786 Y90.219 E1.15318
G1 X191.786 Y89.582 E.03159
G1 X208.214 Y73.154 E1.15318
G1 X208.214 Y72.518 E.03159
G1 X191.786 Y88.946 E1.15318
G1 X191.786 Y88.31 E.03159
G1 X208.214 Y71.881 E1.15318
G1 X208.214 Y71.245 E.03159
G1 X191.786 Y87.673 E1.15318
G1 X191.786 Y87.037 E.03159
G1 X208.214 Y70.608 E1.15318
G1 X208.214 Y69.972 E.03159
G1 X191.786 Y86.4 E1.15318
G1 X191.786 Y85.764 E.03159
G1 X208.214 Y69.336 E1.15318
G1 X208.214 Y68.699 E.03159
G1 X191.786 Y85.128 E1.15318
G1 X191.786 Y84.491 E.03159
G1 X208.214 Y68.063 E1.15318
G1 X208.214 Y67.426 E.03159
G1 X191.786 Y83.855 E1.15318
G1 X191.786 Y83.218 E.03159
G1 X208.214 Y66.79 E1.15318
G1 X208.214 Y66.154 E.03159
G1 X191.786 Y82.582 E1.15318
G1 X191.786 Y81.946 E.03159
G1 X208.214 Y65.517 E1.15318
G1 X208.214 Y64.881 E.03159
G1 X191.786 Y81.309 E1.15318
G1 X191.786 Y80.673 E.03159
G1 X208.214 Y64.244 E1.15318
G1 X208.214 Y63.608 E.03159
G1 X191.786 Y80.036 E1.15318
G1 X191.786 Y79.4 E.03159
G1 X208.214 Y62.972 E1.15318
G1 X208.214 Y62.335 E.03159
G1 X191.786 Y78.763 E1.15318
G1 X191.786 Y78.127 E.03159
G1 X208.214 Y61.699 E1.15318
G1 X208.214 Y61.062 E.03159
G1 X191.786 Y77.491 E1.15318
G1 X191.786 Y76.854 E.03159
G1 X208.214 Y60.426 E1.15318
G1 X208.214 Y59.79 E.03159
G1 X191.786 Y76.218 E1.15318
G1 X191.786 Y75.581 E.03159
G1 X208.214 Y59.153 E1.15318
M73 P54 R30
G1 X208.214 Y58.517 E.03159
G1 X191.786 Y74.945 E1.15318
G1 X191.786 Y74.309 E.03159
G1 X208.214 Y57.88 E1.15318
G1 X208.214 Y57.244 E.03159
G1 X191.786 Y73.672 E1.15318
G1 X191.786 Y73.036 E.03159
G1 X208.214 Y56.607 E1.15318
G1 X208.214 Y55.971 E.03159
G1 X191.786 Y72.399 E1.15318
G1 X191.786 Y71.763 E.03159
G1 X208.214 Y55.335 E1.15318
G1 X208.214 Y54.698 E.03159
G1 X191.786 Y71.127 E1.15318
G1 X191.786 Y70.49 E.03159
G1 X208.214 Y54.062 E1.15318
G1 X208.214 Y53.425 E.03159
G1 X191.786 Y69.854 E1.15318
G1 X191.786 Y69.217 E.03159
G1 X208.214 Y52.789 E1.15318
G1 X208.214 Y52.153 E.03159
G1 X191.786 Y68.581 E1.15318
M73 P55 R30
G1 X191.786 Y67.945 E.03159
G1 X208.214 Y51.516 E1.15318
G1 X208.214 Y50.88 E.03159
G1 X191.786 Y67.308 E1.15318
G1 X191.786 Y66.672 E.03159
G1 X208.214 Y50.243 E1.15318
G1 X208.214 Y49.607 E.03159
G1 X191.786 Y66.035 E1.15318
G1 X191.786 Y65.399 E.03159
G1 X208.214 Y48.971 E1.15318
G1 X208.214 Y48.334 E.03159
G1 X191.786 Y64.762 E1.15318
G1 X191.786 Y64.126 E.03159
G1 X208.214 Y47.698 E1.15318
G1 X208.214 Y47.061 E.03159
G1 X203.501 Y51.775 E.33086
G2 X203.585 Y51.054 I-3.978 J-.833 E.03609
G1 X208.214 Y46.425 E.32492
G1 X208.214 Y45.788 E.03159
G1 X203.543 Y50.46 E.32791
G2 X203.427 Y49.939 I-4.267 J.671 E.02651
G1 X208.214 Y45.152 E.33601
G1 X208.214 Y44.516 E.03159
G1 X203.247 Y49.483 E.34868
G1 X203.228 Y49.443 E.00217
G2 X203.022 Y49.072 I-1.963 J.847 E.02113
G1 X208.214 Y43.879 E.3645
G1 X208.214 Y43.243 E.03159
G1 X202.755 Y48.702 E.38321
G2 X202.444 Y48.377 I-4.57 J4.065 E.02235
G1 X208.035 Y42.786 E.39247
G1 X207.398 Y42.786 E.03159
G1 X202.093 Y48.091 E.37241
G2 X201.703 Y47.845 I-1.428 J1.832 E.02294
G1 X206.762 Y42.786 E.35513
G1 X206.126 Y42.786 E.03159
G1 X201.266 Y47.645 E.34109
G2 X200.774 Y47.501 I-.965 J2.383 E.0255
G1 X205.489 Y42.786 E.33097
G1 X204.853 Y42.786 E.03159
G1 X200.217 Y47.421 E.3254
G1 X199.792 Y47.423 E.02112
G2 X199.563 Y47.439 I.839 J13.301 E.01137
G1 X204.216 Y42.786 E.32663
G1 X203.58 Y42.786 E.03159
G1 X198.709 Y47.657 E.34194
G1 X198.532 Y47.727 E.00943
G2 X196.654 Y49.712 I1.5 J3.299 E.13906
G1 X187.152 Y59.214 E.66703
G1 X187.788 Y59.214 E.03159
G1 X196.443 Y50.56 E.60751
G2 X196.42 Y51.218 I4.241 J.473 E.03274
G1 X188.424 Y59.214 E.56127
G1 X189.061 Y59.214 E.03159
G1 X196.5 Y51.774 E.52223
G2 X196.645 Y52.266 I4.321 J-1.001 E.02546
G1 X189.697 Y59.214 E.48769
G1 X190.334 Y59.214 E.03159
G1 X196.846 Y52.702 E.45714
G2 X197.09 Y53.094 I2.085 J-1.026 E.02297
G1 X190.97 Y59.214 E.42961
G1 X191.606 Y59.214 E.03159
G1 X197.375 Y53.446 E.40492
G2 X197.704 Y53.753 I1.697 J-1.489 E.02239
G1 X191.786 Y59.671 E.41544
G1 X191.786 Y60.308 E.03159
G1 X198.072 Y54.021 E.44128
G2 X198.481 Y54.249 I1.797 J-2.749 E.02325
G1 X191.786 Y60.944 E.46999
G1 X191.786 Y61.58 E.03159
G1 X198.941 Y54.425 E.50228
G2 X199.459 Y54.544 I.852 J-2.527 E.02641
G1 X191.786 Y62.217 E.53863
G1 X191.786 Y62.853 E.03159
G1 X200.056 Y54.583 E.5805
G2 X200.777 Y54.498 I-.059 J-3.605 E.03611
G1 X191.583 Y63.692 E.64535
M106 S102
; WIPE_START
G1 X192.998 Y62.278 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X186.313 Y59.417 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
M106 S229.5
G1 F3000
G1 X202.944 Y42.786 E1.1674
G1 X202.307 Y42.786 E.03159
G1 X185.879 Y59.214 E1.15318
G1 X185.242 Y59.214 E.03159
G1 X201.671 Y42.786 E1.15318
G1 X201.034 Y42.786 E.03159
G1 X184.606 Y59.214 E1.15318
G1 X183.97 Y59.214 E.03159
G1 X200.398 Y42.786 E1.15318
G1 X199.761 Y42.786 E.03159
G1 X183.333 Y59.214 E1.15318
G1 X182.697 Y59.214 E.03159
G1 X199.125 Y42.786 E1.15318
G1 X198.489 Y42.786 E.03159
G1 X182.06 Y59.214 E1.15318
G1 X181.424 Y59.214 E.03159
G1 X197.852 Y42.786 E1.15318
G1 X197.216 Y42.786 E.03159
G1 X180.787 Y59.214 E1.15318
G1 X180.151 Y59.214 E.03159
G1 X196.579 Y42.786 E1.15318
G1 X195.943 Y42.786 E.03159
G1 X179.515 Y59.214 E1.15318
G1 X178.878 Y59.214 E.03159
G1 X195.307 Y42.786 E1.15318
G1 X194.67 Y42.786 E.03159
G1 X178.242 Y59.214 E1.15318
G1 X177.605 Y59.214 E.03159
G1 X194.034 Y42.786 E1.15318
G1 X193.397 Y42.786 E.03159
G1 X176.969 Y59.214 E1.15318
G1 X176.333 Y59.214 E.03159
G1 X192.761 Y42.786 E1.15318
G1 X192.125 Y42.786 E.03159
G1 X175.696 Y59.214 E1.15318
G1 X175.06 Y59.214 E.03159
G1 X191.488 Y42.786 E1.15318
G1 X190.852 Y42.786 E.03159
G1 X174.423 Y59.214 E1.15318
G1 X173.787 Y59.214 E.03159
G1 X190.215 Y42.786 E1.15318
G1 X189.579 Y42.786 E.03159
G1 X173.151 Y59.214 E1.15318
G1 X172.514 Y59.214 E.03159
G1 X188.942 Y42.786 E1.15318
G1 X188.306 Y42.786 E.03159
G1 X171.878 Y59.214 E1.15318
G1 X171.241 Y59.214 E.03159
G1 X187.67 Y42.786 E1.15318
G1 X187.033 Y42.786 E.03159
G1 X170.605 Y59.214 E1.15318
G1 X169.969 Y59.214 E.03159
G1 X186.397 Y42.786 E1.15318
G1 X185.76 Y42.786 E.03159
G1 X169.332 Y59.214 E1.15318
G1 X168.696 Y59.214 E.03159
G1 X185.124 Y42.786 E1.15318
G1 X184.488 Y42.786 E.03159
G1 X168.059 Y59.214 E1.15318
G1 X167.423 Y59.214 E.03159
G1 X183.851 Y42.786 E1.15318
G1 X183.215 Y42.786 E.03159
G1 X166.786 Y59.214 E1.15318
G1 X166.15 Y59.214 E.03159
G1 X182.578 Y42.786 E1.15318
G1 X181.942 Y42.786 E.03159
G1 X165.514 Y59.214 E1.15318
G1 X164.877 Y59.214 E.03159
G1 X181.306 Y42.786 E1.15318
G1 X180.669 Y42.786 E.03159
G1 X164.241 Y59.214 E1.15318
G1 X163.604 Y59.214 E.03159
G1 X180.033 Y42.786 E1.15318
G1 X179.396 Y42.786 E.03159
G1 X162.968 Y59.214 E1.15318
G1 X162.332 Y59.214 E.03159
G1 X178.76 Y42.786 E1.15318
G1 X178.124 Y42.786 E.03159
G1 X161.695 Y59.214 E1.15318
G1 X161.059 Y59.214 E.03159
G1 X177.487 Y42.786 E1.15318
G1 X176.851 Y42.786 E.03159
G1 X160.422 Y59.214 E1.15318
G1 X159.786 Y59.214 E.03159
G1 X176.214 Y42.786 E1.15318
G1 X175.578 Y42.786 E.03159
G1 X159.15 Y59.214 E1.15318
G1 X158.513 Y59.214 E.03159
G1 X174.941 Y42.786 E1.15318
G1 X174.305 Y42.786 E.03159
G1 X157.877 Y59.214 E1.15318
G1 X157.24 Y59.214 E.03159
G1 X173.669 Y42.786 E1.15318
G1 X173.032 Y42.786 E.03159
G1 X156.604 Y59.214 E1.15318
G1 X155.967 Y59.214 E.03159
G1 X172.396 Y42.786 E1.15318
G1 X171.759 Y42.786 E.03159
G1 X155.331 Y59.214 E1.15318
G1 X154.695 Y59.214 E.03159
G1 X171.123 Y42.786 E1.15318
G1 X170.487 Y42.786 E.03159
G1 X154.058 Y59.214 E1.15318
G1 X153.422 Y59.214 E.03159
G1 X169.85 Y42.786 E1.15318
G1 X169.214 Y42.786 E.03159
G1 X152.785 Y59.214 E1.15318
G1 X152.149 Y59.214 E.03159
G1 X168.577 Y42.786 E1.15318
G1 X167.941 Y42.786 E.03159
G1 X151.513 Y59.214 E1.15318
G1 X150.876 Y59.214 E.03159
G1 X167.305 Y42.786 E1.15318
G1 X166.668 Y42.786 E.03159
G1 X150.24 Y59.214 E1.15318
G1 X149.603 Y59.214 E.03159
G1 X166.032 Y42.786 E1.15318
G1 X165.395 Y42.786 E.03159
G1 X148.967 Y59.214 E1.15318
G1 X148.331 Y59.214 E.03159
G1 X164.759 Y42.786 E1.15318
G1 X164.122 Y42.786 E.03159
G1 X147.694 Y59.214 E1.15318
G1 X147.058 Y59.214 E.03159
G1 X163.486 Y42.786 E1.15318
G1 X162.85 Y42.786 E.03159
G1 X146.421 Y59.214 E1.15318
G1 X145.785 Y59.214 E.03159
G1 X162.213 Y42.786 E1.15318
G1 X161.577 Y42.786 E.03159
G1 X145.149 Y59.214 E1.15318
M73 P56 R30
G1 X144.512 Y59.214 E.03159
G1 X160.94 Y42.786 E1.15318
G1 X160.304 Y42.786 E.03159
G1 X143.876 Y59.214 E1.15318
G1 X143.239 Y59.214 E.03159
G1 X159.668 Y42.786 E1.15318
G1 X159.031 Y42.786 E.03159
G1 X142.603 Y59.214 E1.15318
G1 X141.966 Y59.214 E.03159
G1 X158.395 Y42.786 E1.15318
G1 X157.758 Y42.786 E.03159
G1 X141.33 Y59.214 E1.15318
G1 X140.694 Y59.214 E.03159
G1 X157.122 Y42.786 E1.15318
G1 X156.486 Y42.786 E.03159
G1 X140.057 Y59.214 E1.15318
G1 X139.421 Y59.214 E.03159
G1 X155.849 Y42.786 E1.15318
G1 X155.213 Y42.786 E.03159
G1 X138.784 Y59.214 E1.15318
G1 X138.148 Y59.214 E.03159
G1 X154.576 Y42.786 E1.15318
G1 X153.94 Y42.786 E.03159
G1 X137.512 Y59.214 E1.15318
G1 X136.875 Y59.214 E.03159
G1 X153.304 Y42.786 E1.15318
G1 X152.667 Y42.786 E.03159
G1 X136.239 Y59.214 E1.15318
G1 X135.602 Y59.214 E.03159
G1 X152.031 Y42.786 E1.15318
G1 X151.394 Y42.786 E.03159
G1 X134.966 Y59.214 E1.15318
G1 X134.33 Y59.214 E.03159
G1 X150.758 Y42.786 E1.15318
G1 X150.121 Y42.786 E.03159
G1 X133.693 Y59.214 E1.15318
G1 X133.057 Y59.214 E.03159
G1 X149.485 Y42.786 E1.15318
G1 X148.849 Y42.786 E.03159
G1 X132.42 Y59.214 E1.15318
G1 X131.784 Y59.214 E.03159
G1 X148.212 Y42.786 E1.15318
G1 X147.576 Y42.786 E.03159
G1 X131.147 Y59.214 E1.15318
G1 X130.511 Y59.214 E.03159
G1 X146.939 Y42.786 E1.15318
G1 X146.303 Y42.786 E.03159
G1 X129.875 Y59.214 E1.15318
G1 X129.238 Y59.214 E.03159
G1 X145.667 Y42.786 E1.15318
G1 X145.03 Y42.786 E.03159
G1 X128.602 Y59.214 E1.15318
G1 X127.965 Y59.214 E.03159
G1 X144.394 Y42.786 E1.15318
G1 X143.757 Y42.786 E.03159
G1 X127.329 Y59.214 E1.15318
M73 P56 R29
G1 X126.693 Y59.214 E.03159
G1 X143.121 Y42.786 E1.15318
G1 X142.485 Y42.786 E.03159
G1 X126.056 Y59.214 E1.15318
G1 X125.42 Y59.214 E.03159
G1 X141.848 Y42.786 E1.15318
G1 X141.212 Y42.786 E.03159
G1 X124.783 Y59.214 E1.15318
G1 X124.147 Y59.214 E.03159
G1 X128.888 Y54.473 E.3328
G3 X128.144 Y54.581 I-.905 J-3.614 E.0374
G1 X123.511 Y59.214 E.32521
G1 X122.874 Y59.214 E.03159
G1 X127.532 Y54.556 E.32695
G3 X127.008 Y54.444 I.301 J-2.672 E.02663
G1 X122.238 Y59.214 E.33486
G1 X121.601 Y59.214 E.03159
G1 X126.539 Y54.276 E.34661
G3 X126.124 Y54.055 I2.352 J-4.898 E.02335
G1 X120.965 Y59.214 E.36217
G1 X120.329 Y59.214 E.03159
G1 X125.752 Y53.791 E.38069
G1 X125.635 Y53.697 E.00743
G3 X125.418 Y53.488 I.898 J-1.144 E.01498
G1 X119.692 Y59.214 E.40195
G1 X119.056 Y59.214 E.03159
G1 X125.125 Y53.145 E.42604
G1 X125.02 Y52.991 E.00924
G3 X124.876 Y52.757 I1.096 J-.835 E.01365
G1 X118.419 Y59.214 E.45325
G1 X117.783 Y59.214 E.03159
G1 X124.67 Y52.327 E.48346
G3 X124.515 Y51.846 I4.216 J-1.627 E.0251
G1 X117.146 Y59.214 E.51723
G1 X116.51 Y59.214 E.03159
G1 X124.428 Y51.296 E.55581
G3 X124.433 Y50.655 I3.649 J-.293 E.03187
G1 X115.874 Y59.214 E.60083
G1 X115.237 Y59.214 E.03159
G1 X124.606 Y49.845 E.65763
G3 X126.85 Y47.602 I3.415 J1.172 E.16306
G1 X131.527 Y42.925 E.32832
G1 X131.845 Y43.243 E.02234
G1 X127.656 Y47.432 E.29407
G3 X128.298 Y47.426 I.399 J7.818 E.03192
G1 X132.163 Y43.561 E.27129
G1 X132.481 Y43.879 E.02234
G1 X128.844 Y47.517 E.25535
G3 X129.329 Y47.668 I-1.206 J4.722 E.02523
G1 X133.788 Y43.209 E.31298
G1 X134.436 Y42.786 E.03842
G1 X134.848 Y42.786 E.02045
G1 X129.757 Y47.876 E.35733
G3 X130.143 Y48.127 I-1.385 J2.556 E.02286
G1 X135.484 Y42.786 E.37492
G1 X136.12 Y42.786 E.03159
G1 X130.489 Y48.417 E.39529
G3 X130.792 Y48.751 I-4.094 J4.019 E.02237
G1 X136.757 Y42.786 E.41871
G1 X137.393 Y42.786 E.03159
G1 X131.054 Y49.125 E.44498
G3 X131.275 Y49.541 I-1.969 J1.312 E.0234
G1 X136.923 Y43.893 E.39646
G1 X137.073 Y43.209 E.03475
G1 X137.34 Y43.476 E.01875
G1 X138.03 Y42.786 E.04844
G1 X138.666 Y42.786 E.03159
G1 X131.445 Y50.007 E.50687
G1 X131.487 Y50.17 E.00835
G3 X131.554 Y50.534 I-1.782 J.518 E.01843
G1 X139.302 Y42.786 E.54391
G1 X139.939 Y42.786 E.03159
G1 X131.581 Y51.144 E.58669
G3 X131.471 Y51.89 I-3.6 J-.147 E.03748
G1 X140.778 Y42.583 E.65326
M106 S102
G1 X133.473 Y42.859 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.52132
; LAYER_HEIGHT: 0.2
G1 F7525.084
G1 X132.178 Y42.859 E.04895
G1 X127.75 Y42.859 F30000
; LINE_WIDTH: 0.5213
G1 F7525.398
G1 X126.421 Y42.859 E.05025
G1 X122.028 Y42.859 F30000
; LINE_WIDTH: 0.52134
G1 F7524.769
G1 X120.664 Y42.859 E.05155
G1 X114.398 Y59.417 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.40001
; LAYER_HEIGHT: 0.4
M106 S229.5
G1 F3000
G1 X131.029 Y42.786 E1.1674
G1 X130.393 Y42.786 E.03159
G1 X113.964 Y59.214 E1.15318
G1 X113.328 Y59.214 E.03159
G1 X129.756 Y42.786 E1.15318
G1 X129.12 Y42.786 E.03159
G1 X112.692 Y59.214 E1.15318
G1 X112.055 Y59.214 E.03159
G1 X128.051 Y43.219 E1.1228
G1 X126.851 Y44.006 E.07121
G1 X126.739 Y43.894 E.00787
G1 X111.419 Y59.214 E1.07541
G1 X110.782 Y59.214 E.03159
G1 X126.421 Y43.576 E1.09774
G1 X126.103 Y43.257 E.02234
G1 X110.146 Y59.214 E1.12008
G1 X109.51 Y59.214 E.03159
G1 X125.784 Y42.939 E1.14242
G1 X125.751 Y42.786 E.00779
G1 X125.301 Y42.786 E.0223
G1 X108.873 Y59.214 E1.15318
G1 X108.237 Y59.214 E.03159
G1 X124.665 Y42.786 E1.15318
G1 X124.029 Y42.786 E.03159
G1 X107.6 Y59.214 E1.15318
G1 X106.964 Y59.214 E.03159
G1 X123.392 Y42.786 E1.15318
G1 X122.985 Y42.786 E.02023
G1 X122.314 Y43.228 E.03989
G1 X106.327 Y59.214 E1.12214
G1 X105.691 Y59.214 E.03159
G1 X120.997 Y43.908 E1.07438
G1 X120.679 Y43.59 E.02234
G1 X105.055 Y59.214 E1.09672
G1 X104.418 Y59.214 E.03159
G1 X120.36 Y43.272 E1.11905
G1 X120.042 Y42.954 E.02234
G1 X103.782 Y59.214 E1.14139
G1 X103.145 Y59.214 E.03159
G1 X119.574 Y42.786 E1.15318
G1 X118.937 Y42.786 E.03159
G1 X102.509 Y59.214 E1.15318
G1 X101.873 Y59.214 E.03159
G1 X118.301 Y42.786 E1.15318
G1 X117.665 Y42.786 E.03159
G1 X101.236 Y59.214 E1.15318
G1 X100.6 Y59.214 E.03159
G1 X117.028 Y42.786 E1.15318
G1 X116.392 Y42.786 E.03159
G1 X99.963 Y59.214 E1.15318
G1 X99.327 Y59.214 E.03159
G1 X115.755 Y42.786 E1.15318
G1 X115.119 Y42.786 E.03159
G1 X98.691 Y59.214 E1.15318
G1 X98.054 Y59.214 E.03159
G1 X114.482 Y42.786 E1.15318
G1 X113.846 Y42.786 E.03159
G1 X97.418 Y59.214 E1.15318
G1 X96.781 Y59.214 E.03159
G1 X113.21 Y42.786 E1.15318
G1 X112.573 Y42.786 E.03159
G1 X96.145 Y59.214 E1.15318
G1 X95.509 Y59.214 E.03159
G1 X111.937 Y42.786 E1.15318
G1 X111.3 Y42.786 E.03159
G1 X94.872 Y59.214 E1.15318
G1 X94.236 Y59.214 E.03159
G1 X110.664 Y42.786 E1.15318
G1 X110.028 Y42.786 E.03159
G1 X93.599 Y59.214 E1.15318
G1 X92.963 Y59.214 E.03159
G1 X109.391 Y42.786 E1.15318
G1 X108.755 Y42.786 E.03159
G1 X92.326 Y59.214 E1.15318
G1 X91.69 Y59.214 E.03159
G1 X108.118 Y42.786 E1.15318
G1 X107.482 Y42.786 E.03159
G1 X91.054 Y59.214 E1.15318
G1 X90.417 Y59.214 E.03159
G1 X106.846 Y42.786 E1.15318
G1 X106.209 Y42.786 E.03159
G1 X89.781 Y59.214 E1.15318
G1 X89.144 Y59.214 E.03159
G1 X105.573 Y42.786 E1.15318
M73 P57 R29
G1 X104.936 Y42.786 E.03159
G1 X88.508 Y59.214 E1.15318
G1 X87.872 Y59.214 E.03159
G1 X104.3 Y42.786 E1.15318
G1 X103.663 Y42.786 E.03159
G1 X87.235 Y59.214 E1.15318
G1 X86.599 Y59.214 E.03159
G1 X103.027 Y42.786 E1.15318
G1 X102.391 Y42.786 E.03159
G1 X85.962 Y59.214 E1.15318
G1 X85.326 Y59.214 E.03159
G1 X101.754 Y42.786 E1.15318
G1 X101.118 Y42.786 E.03159
G1 X84.69 Y59.214 E1.15318
G1 X84.053 Y59.214 E.03159
G1 X100.481 Y42.786 E1.15318
G1 X99.845 Y42.786 E.03159
G1 X83.417 Y59.214 E1.15318
G1 X82.78 Y59.214 E.03159
G1 X99.209 Y42.786 E1.15318
G1 X98.572 Y42.786 E.03159
G1 X82.144 Y59.214 E1.15318
G1 X81.507 Y59.214 E.03159
G1 X97.936 Y42.786 E1.15318
G1 X97.299 Y42.786 E.03159
G1 X80.871 Y59.214 E1.15318
G1 X80.235 Y59.214 E.03159
G1 X96.663 Y42.786 E1.15318
G1 X96.027 Y42.786 E.03159
G1 X79.598 Y59.214 E1.15318
G1 X78.962 Y59.214 E.03159
G1 X95.39 Y42.786 E1.15318
G1 X94.754 Y42.786 E.03159
G1 X78.325 Y59.214 E1.15318
G1 X77.689 Y59.214 E.03159
G1 X94.117 Y42.786 E1.15318
G1 X93.481 Y42.786 E.03159
G1 X77.053 Y59.214 E1.15318
G1 X76.416 Y59.214 E.03159
G1 X92.845 Y42.786 E1.15318
G1 X92.208 Y42.786 E.03159
G1 X75.78 Y59.214 E1.15318
G1 X75.143 Y59.214 E.03159
G1 X91.572 Y42.786 E1.15318
G1 X90.935 Y42.786 E.03159
G1 X74.507 Y59.214 E1.15318
G1 X73.871 Y59.214 E.03159
G1 X90.299 Y42.786 E1.15318
G1 X89.662 Y42.786 E.03159
G1 X73.234 Y59.214 E1.15318
G1 X72.598 Y59.214 E.03159
G1 X89.026 Y42.786 E1.15318
G1 X88.39 Y42.786 E.03159
G1 X71.961 Y59.214 E1.15318
G1 X71.325 Y59.214 E.03159
G1 X87.753 Y42.786 E1.15318
G1 X87.117 Y42.786 E.03159
G1 X70.688 Y59.214 E1.15318
G1 X70.052 Y59.214 E.03159
G1 X86.48 Y42.786 E1.15318
G1 X85.844 Y42.786 E.03159
G1 X69.416 Y59.214 E1.15318
G1 X68.779 Y59.214 E.03159
G1 X85.208 Y42.786 E1.15318
G1 X84.571 Y42.786 E.03159
G1 X68.143 Y59.214 E1.15318
G1 X67.506 Y59.214 E.03159
G1 X83.935 Y42.786 E1.15318
G1 X83.298 Y42.786 E.03159
G1 X66.87 Y59.214 E1.15318
G1 X66.234 Y59.214 E.03159
G1 X82.662 Y42.786 E1.15318
G1 X82.026 Y42.786 E.03159
G1 X65.597 Y59.214 E1.15318
G1 X64.961 Y59.214 E.03159
G1 X81.389 Y42.786 E1.15318
G1 X80.753 Y42.786 E.03159
G1 X47.786 Y75.753 E2.3141
G1 X47.786 Y75.116 E.03159
G1 X80.116 Y42.786 E2.26943
G1 X79.48 Y42.786 E.03159
G1 X47.786 Y74.48 E2.22475
G1 X47.786 Y73.843 E.03159
G1 X78.843 Y42.786 E2.18008
G1 X78.207 Y42.786 E.03159
G1 X47.786 Y73.207 E2.13541
G1 X47.786 Y72.571 E.03159
G1 X77.571 Y42.786 E2.09074
G1 X76.934 Y42.786 E.03159
G1 X47.786 Y71.934 E2.04606
G1 X47.786 Y71.298 E.03159
G1 X76.298 Y42.786 E2.00139
G1 X75.661 Y42.786 E.03159
G1 X47.786 Y70.661 E1.95672
G1 X47.786 Y70.025 E.03159
G1 X75.025 Y42.786 E1.91205
G1 X74.389 Y42.786 E.03159
G1 X47.786 Y69.389 E1.86737
G1 X47.786 Y68.752 E.03159
G1 X73.752 Y42.786 E1.8227
G1 X73.116 Y42.786 E.03159
G1 X47.786 Y68.116 E1.77803
G1 X47.786 Y67.479 E.03159
G1 X72.479 Y42.786 E1.73335
G1 X71.843 Y42.786 E.03159
G1 X47.786 Y66.843 E1.68868
G1 X47.786 Y66.207 E.03159
G1 X71.207 Y42.786 E1.64401
G1 X70.57 Y42.786 E.03159
G1 X47.786 Y65.57 E1.59934
G1 X47.786 Y64.934 E.03159
G1 X69.934 Y42.786 E1.55466
G1 X69.297 Y42.786 E.03159
G1 X47.786 Y64.297 E1.50999
G1 X47.786 Y63.661 E.03159
G1 X57.003 Y54.443 E.64702
G3 X56.231 Y54.579 I-1.052 J-3.724 E.03897
G1 X47.786 Y63.024 E.59283
G1 X47.786 Y62.388 E.03159
G1 X55.61 Y54.564 E.54918
G3 X55.075 Y54.462 I.503 J-4.089 E.02703
G1 X47.786 Y61.752 E.51166
G1 X47.786 Y61.115 E.03159
G1 X54.601 Y54.3 E.47836
G3 X54.176 Y54.088 I2.005 J-4.537 E.02355
G1 X47.786 Y60.479 E.44859
G1 X47.786 Y59.842 E.03159
G1 X53.8 Y53.829 E.42213
G1 X53.686 Y53.739 E.00719
G3 X53.462 Y53.53 I2.153 J-2.546 E.01521
M73 P57 R28
G1 X47.786 Y59.206 E.39842
G1 X47.786 Y58.57 E.03159
G1 X53.162 Y53.193 E.3774
G3 X52.907 Y52.813 I4.261 J-3.139 E.02277
G1 X47.786 Y57.933 E.35945
G1 X47.786 Y57.297 E.03159
G1 X52.696 Y52.387 E.34464
G3 X52.532 Y51.914 I2.283 J-1.056 E.02487
G1 X47.786 Y56.66 E.33314
G1 X47.786 Y56.024 E.03159
G1 X52.436 Y51.374 E.32641
G3 X52.424 Y50.75 I3.858 J-.389 E.03101
G1 X47.786 Y55.388 E.32554
G1 X47.786 Y54.751 E.03159
G1 X52.568 Y49.969 E.33566
G3 X54.97 Y47.567 I3.434 J1.032 E.17566
G1 X59.751 Y42.786 E.33562
G1 X60.388 Y42.786 E.03159
G1 X55.748 Y47.425 E.32566
G1 X56.263 Y47.421 E.02556
G1 X56.375 Y47.435 E.00558
G1 X61.024 Y42.786 E.32637
M73 P58 R28
G1 X61.66 Y42.786 E.03159
G1 X56.914 Y47.533 E.33321
G3 X57.388 Y47.695 I-1.183 J4.24 E.0249
G1 X62.297 Y42.786 E.34458
G1 X62.933 Y42.786 E.03159
G1 X57.811 Y47.908 E.35953
G3 X58.193 Y48.163 I-1.087 J2.038 E.02281
G1 X63.57 Y42.786 E.37743
G1 X64.206 Y42.786 E.03159
G1 X58.532 Y48.46 E.3983
G3 X58.829 Y48.799 I-1.551 J1.656 E.02242
G1 X64.842 Y42.786 E.42213
G1 X65.479 Y42.786 E.03159
G1 X59.086 Y49.178 E.44871
G3 X59.303 Y49.599 I-1.993 J1.291 E.0235
G1 X66.115 Y42.786 E.47821
G1 X66.752 Y42.786 E.03159
G1 X59.462 Y50.075 E.51167
G3 X59.565 Y50.609 I-2.61 J.779 E.02702
G1 X67.388 Y42.786 E.54913
G1 X68.025 Y42.786 E.03159
G1 X59.576 Y51.234 E.59301
G3 X59.442 Y52.005 I-3.777 J-.261 E.0389
G1 X68.863 Y42.583 E.66132
M106 S102
G1 X64.417 Y59.758 F30000
M106 S229.5
G1 F3000
G1 X47.786 Y76.389 E1.1674
G1 X47.786 Y77.026 E.03159
G1 X64.214 Y60.597 E1.15318
G1 X64.214 Y61.234 E.03159
G1 X47.786 Y77.662 E1.15318
G1 X47.786 Y78.298 E.03159
G1 X64.214 Y61.87 E1.15318
G1 X64.214 Y62.506 E.03159
G1 X47.786 Y78.935 E1.15318
G1 X47.786 Y79.571 E.03159
G1 X64.214 Y63.143 E1.15318
G1 X64.214 Y63.779 E.03159
G1 X47.786 Y80.208 E1.15318
G1 X47.786 Y80.844 E.03159
G1 X64.214 Y64.416 E1.15318
G1 X64.214 Y65.052 E.03159
G1 X47.786 Y81.48 E1.15318
G1 X47.786 Y82.117 E.03159
G1 X64.214 Y65.688 E1.15318
G1 X64.214 Y66.325 E.03159
G1 X47.786 Y82.753 E1.15318
G1 X47.786 Y83.39 E.03159
G1 X64.214 Y66.961 E1.15318
G1 X64.214 Y67.598 E.03159
G1 X47.786 Y84.026 E1.15318
G1 X47.786 Y84.662 E.03159
G1 X64.214 Y68.234 E1.15318
G1 X64.214 Y68.871 E.03159
G1 X47.786 Y85.299 E1.15318
G1 X47.786 Y85.935 E.03159
G1 X64.214 Y69.507 E1.15318
G1 X64.214 Y70.143 E.03159
G1 X47.786 Y86.572 E1.15318
G1 X47.786 Y87.208 E.03159
G1 X64.214 Y70.78 E1.15318
G1 X64.214 Y71.416 E.03159
G1 X47.786 Y87.844 E1.15318
G1 X47.786 Y88.481 E.03159
G1 X64.214 Y72.053 E1.15318
G1 X64.214 Y72.689 E.03159
G1 X47.786 Y89.117 E1.15318
G1 X47.786 Y89.754 E.03159
G1 X64.214 Y73.325 E1.15318
G1 X64.214 Y73.962 E.03159
G1 X47.786 Y90.39 E1.15318
G1 X47.786 Y91.027 E.03159
G1 X64.214 Y74.598 E1.15318
G1 X64.214 Y75.235 E.03159
G1 X47.786 Y91.663 E1.15318
G1 X47.786 Y92.299 E.03159
G1 X64.214 Y75.871 E1.15318
G1 X64.214 Y76.507 E.03159
G1 X47.786 Y92.936 E1.15318
G1 X47.786 Y93.572 E.03159
G1 X64.214 Y77.144 E1.15318
G1 X64.214 Y77.78 E.03159
G1 X47.786 Y94.209 E1.15318
G1 X47.786 Y94.845 E.03159
G1 X64.214 Y78.417 E1.15318
G1 X64.214 Y79.053 E.03159
G1 X47.786 Y95.481 E1.15318
G1 X47.786 Y96.118 E.03159
G1 X64.214 Y79.689 E1.15318
G1 X64.214 Y80.326 E.03159
G1 X47.786 Y96.754 E1.15318
G1 X47.786 Y97.391 E.03159
G1 X64.214 Y80.962 E1.15318
G1 X64.214 Y81.599 E.03159
G1 X47.786 Y98.027 E1.15318
G1 X47.786 Y98.663 E.03159
G1 X64.214 Y82.235 E1.15318
G1 X64.214 Y82.872 E.03159
G1 X47.786 Y99.3 E1.15318
G1 X47.786 Y99.936 E.03159
G1 X64.214 Y83.508 E1.15318
G1 X64.214 Y84.144 E.03159
G1 X47.786 Y100.573 E1.15318
G1 X47.786 Y101.209 E.03159
G1 X64.214 Y84.781 E1.15318
G1 X64.214 Y85.417 E.03159
G1 X47.786 Y101.846 E1.15318
G1 X47.786 Y102.482 E.03159
G1 X64.214 Y86.054 E1.15318
G1 X64.214 Y86.69 E.03159
G1 X47.786 Y103.118 E1.15318
G1 X47.786 Y103.755 E.03159
G1 X64.214 Y87.326 E1.15318
G1 X64.214 Y87.963 E.03159
G1 X47.786 Y104.391 E1.15318
G1 X47.786 Y105.028 E.03159
G1 X64.214 Y88.599 E1.15318
G1 X64.214 Y89.236 E.03159
G1 X47.786 Y105.664 E1.15318
G1 X47.786 Y106.3 E.03159
G1 X64.214 Y89.872 E1.15318
G1 X64.214 Y90.508 E.03159
G1 X47.786 Y106.937 E1.15318
G1 X47.786 Y107.573 E.03159
G1 X64.214 Y91.145 E1.15318
G1 X64.214 Y91.781 E.03159
G1 X47.786 Y108.21 E1.15318
G1 X47.786 Y108.846 E.03159
G1 X64.214 Y92.418 E1.15318
G1 X64.214 Y93.054 E.03159
G1 X47.786 Y109.482 E1.15318
G1 X47.786 Y110.119 E.03159
G1 X64.214 Y93.691 E1.15318
G1 X64.214 Y94.327 E.03159
G1 X47.786 Y110.755 E1.15318
G1 X47.786 Y111.392 E.03159
G1 X64.214 Y94.963 E1.15318
G1 X64.214 Y95.6 E.03159
G1 X47.786 Y112.028 E1.15318
G1 X47.786 Y112.664 E.03159
G1 X64.214 Y96.236 E1.15318
G1 X64.214 Y96.873 E.03159
G1 X47.786 Y113.301 E1.15318
G1 X47.786 Y113.937 E.03159
G1 X64.214 Y97.509 E1.15318
G1 X64.214 Y98.145 E.03159
G1 X47.786 Y114.574 E1.15318
G1 X47.786 Y115.21 E.03159
G1 X64.214 Y98.782 E1.15318
G1 X64.214 Y99.418 E.03159
G1 X47.786 Y115.847 E1.15318
G1 X47.786 Y116.483 E.03159
G1 X64.214 Y100.055 E1.15318
G1 X64.214 Y100.691 E.03159
G1 X47.786 Y117.119 E1.15318
G1 X47.786 Y117.756 E.03159
G1 X64.214 Y101.327 E1.15318
G1 X64.214 Y101.964 E.03159
G1 X47.786 Y118.392 E1.15318
G1 X47.786 Y119.029 E.03159
G1 X64.214 Y102.6 E1.15318
G1 X64.214 Y103.237 E.03159
G1 X47.786 Y119.665 E1.15318
G1 X47.786 Y120.301 E.03159
G1 X64.214 Y103.873 E1.15318
G1 X64.214 Y104.509 E.03159
G1 X47.786 Y120.938 E1.15318
G1 X47.786 Y121.574 E.03159
G1 X64.214 Y105.146 E1.15318
G1 X64.214 Y105.782 E.03159
G1 X47.786 Y122.211 E1.15318
G1 X47.786 Y122.847 E.03159
G1 X64.214 Y106.419 E1.15318
G1 X64.214 Y107.055 E.03159
G1 X47.786 Y123.483 E1.15318
G1 X47.786 Y124.12 E.03159
G1 X64.214 Y107.692 E1.15318
G1 X64.214 Y108.328 E.03159
G1 X47.786 Y124.756 E1.15318
G1 X47.786 Y125.393 E.03159
G1 X64.214 Y108.964 E1.15318
G1 X64.214 Y109.601 E.03159
G1 X47.786 Y126.029 E1.15318
G1 X47.786 Y126.666 E.03159
G1 X64.214 Y110.237 E1.15318
G1 X64.214 Y110.874 E.03159
G1 X47.786 Y127.302 E1.15318
G1 X47.786 Y127.938 E.03159
G1 X64.214 Y111.51 E1.15318
G1 X64.214 Y112.146 E.03159
G1 X47.786 Y128.575 E1.15318
G1 X47.786 Y129.211 E.03159
G1 X64.214 Y112.783 E1.15318
G1 X64.214 Y113.419 E.03159
G1 X55.104 Y122.529 E.63948
G3 X55.8 Y122.423 I.803 J2.919 E.03501
G1 X55.847 Y122.423 E.00236
G1 X64.214 Y114.056 E.58731
G1 X64.214 Y114.692 E.03159
G1 X56.46 Y122.446 E.54429
G3 X56.99 Y122.552 I-.69 J4.817 E.02685
G1 X64.214 Y115.328 E.50707
G1 X64.214 Y115.965 E.03159
M73 P59 R28
G1 X57.454 Y122.725 E.4745
G3 X57.872 Y122.943 I-.883 J2.201 E.02345
G1 X64.214 Y116.601 E.44516
G1 X64.214 Y117.238 E.03159
G1 X58.248 Y123.204 E.41881
G3 X58.578 Y123.51 I-2.677 J3.224 E.02236
G1 X64.214 Y117.874 E.39561
G1 X64.214 Y118.511 E.03159
G1 X58.87 Y123.854 E.37511
G3 X59.123 Y124.238 I-1.792 J1.455 E.02284
G1 X64.214 Y119.147 E.35737
G1 X64.214 Y119.783 E.03159
G1 X59.329 Y124.669 E.34291
G3 X59.454 Y125.04 I-1.801 J.811 E.01949
G1 X59.482 Y125.152 E.00572
G1 X64.214 Y120.42 E.33217
G1 X64.214 Y121.056 E.03159
G1 X59.573 Y125.697 E.32579
G3 X59.571 Y126.335 I-3.181 J.311 E.03172
G1 X64.214 Y121.693 E.3259
G1 X64.214 Y122.329 E.03159
G1 X59.019 Y127.525 E.36471
M106 S102
; WIPE_START
G1 X60.433 Y126.11 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X52.912 Y124.807 Z2.6 F30000
G1 X52.839 Y124.794 Z2.6
G1 Z2.2
G1 E.8 F1800
M106 S229.5
G1 F3000
G1 X47.786 Y129.848 E.3547
G1 X47.786 Y130.484 E.03159
G1 X52.416 Y125.853 E.32504
G2 X52.445 Y126.462 I3.052 J.163 E.03027
G1 X47.786 Y131.12 E.32703
G1 X47.786 Y131.757 E.03159
G1 X52.555 Y126.988 E.33474
G2 X52.724 Y127.455 I2.416 J-.614 E.02469
G1 X47.786 Y132.393 E.34665
G1 X47.786 Y133.03 E.03159
G1 X52.941 Y127.875 E.36185
G2 X53.206 Y128.246 I1.986 J-1.14 E.02268
G1 X47.786 Y133.666 E.38048
G1 X47.786 Y134.302 E.03159
M73 P59 R27
G1 X53.511 Y128.578 E.40184
G2 X53.853 Y128.872 I1.642 J-1.568 E.02244
G1 X47.786 Y134.939 E.42589
G1 X47.786 Y135.575 E.03159
G1 X54.238 Y129.124 E.45288
G2 X54.67 Y129.328 I1.852 J-3.362 E.02374
G1 X47.786 Y136.212 E.48322
G1 X47.786 Y136.848 E.03159
G1 X55.15 Y129.484 E.51694
G2 X55.699 Y129.571 I1.131 J-5.33 E.0276
G1 X47.786 Y137.484 E.55548
G1 X47.786 Y138.121 E.03159
G1 X56.337 Y129.569 E.60027
G2 X57.089 Y129.414 I-.759 J-5.585 E.03813
G1 X57.149 Y129.395 E.00311
G1 X47.786 Y138.757 E.65722
G1 X47.786 Y139.394 E.03159
G1 X64.214 Y122.965 E1.15318
G1 X64.214 Y123.602 E.03159
G1 X47.786 Y140.03 E1.15318
G1 X47.786 Y140.667 E.03159
G1 X64.214 Y124.238 E1.15318
G1 X64.214 Y124.875 E.03159
G1 X47.786 Y141.303 E1.15318
G1 X47.786 Y141.939 E.03159
G1 X64.214 Y125.511 E1.15318
G1 X64.214 Y126.147 E.03159
G1 X47.786 Y142.576 E1.15318
G1 X47.786 Y143.212 E.03159
G1 X64.214 Y126.784 E1.15318
G1 X64.214 Y127.42 E.03159
G1 X47.786 Y143.849 E1.15318
G1 X47.786 Y144.485 E.03159
G1 X64.214 Y128.057 E1.15318
G1 X64.214 Y128.693 E.03159
G1 X47.786 Y145.121 E1.15318
G1 X47.786 Y145.758 E.03159
G1 X64.214 Y129.329 E1.15318
G1 X64.214 Y129.966 E.03159
G1 X47.786 Y146.394 E1.15318
G1 X47.786 Y147.031 E.03159
G1 X64.214 Y130.602 E1.15318
G1 X64.214 Y131.239 E.03159
G1 X47.786 Y147.667 E1.15318
G1 X47.786 Y148.303 E.03159
G1 X64.214 Y131.875 E1.15318
G1 X64.214 Y132.512 E.03159
G1 X47.786 Y148.94 E1.15318
G1 X47.786 Y149.576 E.03159
G1 X64.214 Y133.148 E1.15318
G1 X64.214 Y133.784 E.03159
G1 X47.786 Y150.213 E1.15318
G1 X47.786 Y150.849 E.03159
G1 X64.214 Y134.421 E1.15318
G1 X64.214 Y135.057 E.03159
G1 X47.786 Y151.485 E1.15318
G1 X47.786 Y152.122 E.03159
G1 X64.214 Y135.694 E1.15318
G1 X64.214 Y136.33 E.03159
G1 X47.786 Y152.758 E1.15318
G1 X47.786 Y153.395 E.03159
G1 X64.214 Y136.966 E1.15318
G1 X64.214 Y137.603 E.03159
G1 X47.786 Y154.031 E1.15318
G1 X47.786 Y154.668 E.03159
G1 X64.214 Y138.239 E1.15318
G1 X64.214 Y138.876 E.03159
G1 X47.786 Y155.304 E1.15318
G1 X47.786 Y155.94 E.03159
G1 X64.214 Y139.512 E1.15318
G1 X64.214 Y140.148 E.03159
G1 X47.786 Y156.577 E1.15318
G1 X47.786 Y157.213 E.03159
G1 X64.214 Y140.785 E1.15318
G1 X64.214 Y141.421 E.03159
G1 X47.786 Y157.85 E1.15318
G1 X47.786 Y158.486 E.03159
G1 X64.214 Y142.058 E1.15318
G1 X64.214 Y142.694 E.03159
G1 X47.786 Y159.122 E1.15318
G1 X47.786 Y159.759 E.03159
G1 X64.214 Y143.331 E1.15318
G1 X64.214 Y143.967 E.03159
G1 X47.786 Y160.395 E1.15318
G1 X47.786 Y161.032 E.03159
G1 X64.214 Y144.603 E1.15318
G1 X64.214 Y145.24 E.03159
G1 X47.786 Y161.668 E1.15318
G1 X47.786 Y162.304 E.03159
G1 X64.214 Y145.876 E1.15318
G1 X64.214 Y146.513 E.03159
G1 X47.786 Y162.941 E1.15318
G1 X47.786 Y163.577 E.03159
G1 X64.214 Y147.149 E1.15318
G1 X64.214 Y147.785 E.03159
G1 X47.786 Y164.214 E1.15318
G1 X47.786 Y164.85 E.03159
G1 X64.214 Y148.422 E1.15318
G1 X64.214 Y149.058 E.03159
G1 X47.786 Y165.487 E1.15318
G1 X47.786 Y166.123 E.03159
G1 X64.214 Y149.695 E1.15318
G1 X64.214 Y150.331 E.03159
G1 X47.786 Y166.759 E1.15318
G1 X47.786 Y167.396 E.03159
G1 X64.214 Y150.967 E1.15318
G1 X64.214 Y151.604 E.03159
G1 X47.786 Y168.032 E1.15318
G1 X47.786 Y168.669 E.03159
G1 X64.214 Y152.24 E1.15318
G1 X64.214 Y152.877 E.03159
G1 X47.786 Y169.305 E1.15318
G1 X47.786 Y169.941 E.03159
G1 X64.214 Y153.513 E1.15318
G1 X64.214 Y154.149 E.03159
G1 X47.786 Y170.578 E1.15318
G1 X47.786 Y171.214 E.03159
G1 X64.214 Y154.786 E1.15318
G1 X64.214 Y155.422 E.03159
G1 X47.786 Y171.851 E1.15318
G1 X47.786 Y172.487 E.03159
G1 X64.214 Y156.059 E1.15318
G1 X64.214 Y156.695 E.03159
G1 X47.786 Y173.123 E1.15318
G1 X47.786 Y173.76 E.03159
G1 X64.214 Y157.332 E1.15318
G1 X64.214 Y157.968 E.03159
G1 X47.786 Y174.396 E1.15318
G1 X47.786 Y175.033 E.03159
G1 X64.214 Y158.604 E1.15318
G1 X64.214 Y159.241 E.03159
G1 X47.786 Y175.669 E1.15318
G1 X47.786 Y176.305 E.03159
G1 X64.214 Y159.877 E1.15318
G1 X64.214 Y160.514 E.03159
G1 X47.786 Y176.942 E1.15318
G1 X47.786 Y177.578 E.03159
G1 X64.214 Y161.15 E1.15318
G1 X64.214 Y161.786 E.03159
G1 X47.786 Y178.215 E1.15318
G1 X47.786 Y178.851 E.03159
G1 X64.214 Y162.423 E1.15318
G1 X64.214 Y163.059 E.03159
G1 X47.786 Y179.488 E1.15318
G1 X47.786 Y180.124 E.03159
G1 X64.214 Y163.696 E1.15318
G1 X64.214 Y164.332 E.03159
G1 X47.786 Y180.76 E1.15318
G1 X47.786 Y181.397 E.03159
G1 X64.214 Y164.968 E1.15318
G1 X64.214 Y165.605 E.03159
G1 X47.786 Y182.033 E1.15318
G1 X47.786 Y182.67 E.03159
G1 X64.214 Y166.241 E1.15318
G1 X64.214 Y166.878 E.03159
G1 X47.786 Y183.306 E1.15318
G1 X47.786 Y183.942 E.03159
G1 X64.214 Y167.514 E1.15318
G1 X64.214 Y168.151 E.03159
G1 X47.786 Y184.579 E1.15318
G1 X47.786 Y185.215 E.03159
G1 X64.214 Y168.787 E1.15318
G1 X64.214 Y169.423 E.03159
G1 X47.786 Y185.852 E1.15318
G1 X47.786 Y186.488 E.03159
G1 X64.214 Y170.06 E1.15318
G1 X64.214 Y170.696 E.03159
G1 X47.786 Y187.124 E1.15318
G1 X47.786 Y187.761 E.03159
G1 X64.214 Y171.333 E1.15318
G1 X64.214 Y171.969 E.03159
G1 X47.786 Y188.397 E1.15318
M73 P60 R27
G1 X47.786 Y189.034 E.03159
G1 X64.214 Y172.605 E1.15318
G1 X64.214 Y173.242 E.03159
G1 X47.786 Y189.67 E1.15318
G1 X47.786 Y190.307 E.03159
G1 X64.214 Y173.878 E1.15318
G1 X64.214 Y174.515 E.03159
G1 X47.786 Y190.943 E1.15318
G1 X47.786 Y191.579 E.03159
G1 X64.214 Y175.151 E1.15318
G1 X64.214 Y175.787 E.03159
G1 X47.786 Y192.216 E1.15318
G1 X47.786 Y192.852 E.03159
G1 X64.214 Y176.424 E1.15318
G1 X64.214 Y177.06 E.03159
G1 X47.786 Y193.489 E1.15318
G1 X47.786 Y194.125 E.03159
G1 X64.214 Y177.697 E1.15318
G1 X64.214 Y178.333 E.03159
G1 X47.786 Y194.761 E1.15318
G1 X47.786 Y195.398 E.03159
G1 X64.214 Y178.969 E1.15318
G1 X64.214 Y179.606 E.03159
G1 X47.786 Y196.034 E1.15318
G1 X47.786 Y196.671 E.03159
G1 X64.214 Y180.242 E1.15318
G1 X64.214 Y180.879 E.03159
G1 X47.786 Y197.307 E1.15318
G1 X47.786 Y197.943 E.03159
G1 X64.214 Y181.515 E1.15318
G1 X64.214 Y182.152 E.03159
G1 X47.786 Y198.58 E1.15318
G1 X47.786 Y199.216 E.03159
G1 X64.214 Y182.788 E1.15318
G1 X64.214 Y183.424 E.03159
G1 X47.786 Y199.853 E1.15318
G1 X47.786 Y200.489 E.03159
G1 X64.214 Y184.061 E1.15318
G1 X64.214 Y184.697 E.03159
G1 X47.786 Y201.125 E1.15318
G1 X47.786 Y201.762 E.03159
G1 X64.214 Y185.334 E1.15318
G1 X64.214 Y185.97 E.03159
G1 X47.786 Y202.398 E1.15318
G1 X47.786 Y203.035 E.03159
G1 X64.214 Y186.606 E1.15318
G1 X64.214 Y187.243 E.03159
G1 X47.786 Y203.671 E1.15318
G1 X47.786 Y204.308 E.03159
G1 X64.214 Y187.879 E1.15318
G1 X64.214 Y188.516 E.03159
G1 X55.234 Y197.496 E.63039
G3 X55.791 Y197.423 I.739 J3.453 E.02795
G1 X55.944 Y197.422 E.00758
G1 X64.214 Y189.152 E.58053
G1 X64.214 Y189.788 E.03159
G1 X56.546 Y197.457 E.53827
G3 X57.063 Y197.577 I-.663 J4.036 E.02634
G1 X64.214 Y190.425 E.50201
G1 X64.214 Y191.061 E.03159
G1 X57.521 Y197.755 E.46984
G3 X57.649 Y197.814 I-.205 J.611 E.007
G1 X57.934 Y197.978 E.01633
G1 X64.214 Y191.698 E.44087
G1 X64.214 Y192.334 E.03159
G1 X58.299 Y198.249 E.41521
G3 X58.625 Y198.56 I-1.389 J1.781 E.02238
G1 X64.399 Y192.786 E.40532
G1 X65.035 Y192.786 E.03159
G1 X58.912 Y198.909 E.42983
G3 X59.158 Y199.299 I-4.949 J3.402 E.0229
G1 X65.672 Y192.786 E.4572
G1 X66.308 Y192.786 E.03159
G1 X59.355 Y199.739 E.48809
G3 X59.502 Y200.229 I-2.378 J.98 E.02541
G1 X66.944 Y192.786 E.52245
G1 X67.581 Y192.786 E.03159
G1 X59.578 Y200.789 E.56179
G3 X59.557 Y201.446 I-3.759 J.21 E.03268
G1 X68.217 Y192.786 E.60792
G1 X68.854 Y192.786 E.03159
G1 X58.899 Y202.741 E.6988
M106 S102
; WIPE_START
G1 X60.313 Y201.327 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X52.806 Y199.945 Z2.6 F30000
G1 X52.788 Y199.942 Z2.6
G1 Z2.2
G1 E.8 F1800
M106 S229.5
G1 F3000
G1 X47.786 Y204.944 E.35114
G1 X47.786 Y205.58 E.03159
G1 X52.416 Y200.95 E.32504
G2 X52.455 Y201.548 I4.753 J-.004 E.02977
G1 X47.786 Y206.217 E.32773
G1 X47.786 Y206.853 E.03159
G1 X52.577 Y202.062 E.33633
G2 X52.753 Y202.523 I2.394 J-.648 E.02452
G1 X47.786 Y207.49 E.34866
G1 X47.786 Y208.126 E.03159
G1 X52.98 Y202.932 E.3646
G2 X53.148 Y203.176 I9.559 J-6.398 E.01473
G1 X53.25 Y203.298 E.00788
G1 X47.786 Y208.762 E.38357
G1 X47.786 Y209.214 E.02242
G1 X47.97 Y209.214 E.00917
G1 X53.559 Y203.625 E.3923
G2 X53.907 Y203.914 I1.616 J-1.59 E.02247
G1 X48.607 Y209.214 E.37202
G1 X49.243 Y209.214 E.03159
G1 X54.301 Y204.156 E.35504
G2 X54.739 Y204.355 I1.211 J-2.087 E.0239
G1 X49.88 Y209.214 E.3411
G1 X50.516 Y209.214 E.03159
G1 X55.228 Y204.503 E.33072
G2 X55.789 Y204.578 I.656 J-2.769 E.02815
G1 X51.153 Y209.214 E.32545
G1 X51.789 Y209.214 E.03159
G1 X56.448 Y204.556 E.32701
G2 X57.047 Y204.429 I-1.117 J-6.76 E.03042
G1 X57.294 Y204.346 E.01292
G1 X52.425 Y209.214 E.34174
G1 X53.062 Y209.214 E.03159
G1 X69.49 Y192.786 E1.15318
G1 X70.127 Y192.786 E.03159
G1 X53.698 Y209.214 E1.15318
G1 X54.335 Y209.214 E.03159
G1 X70.763 Y192.786 E1.15318
G1 X71.399 Y192.786 E.03159
G1 X54.971 Y209.214 E1.15318
G1 X55.607 Y209.214 E.03159
G1 X72.036 Y192.786 E1.15318
G1 X72.672 Y192.786 E.03159
G1 X56.244 Y209.214 E1.15318
G1 X56.88 Y209.214 E.03159
G1 X73.309 Y192.786 E1.15318
G1 X73.945 Y192.786 E.03159
G1 X57.517 Y209.214 E1.15318
G1 X58.153 Y209.214 E.03159
G1 X74.581 Y192.786 E1.15318
G1 X75.218 Y192.786 E.03159
G1 X58.789 Y209.214 E1.15318
G1 X59.426 Y209.214 E.03159
G1 X75.854 Y192.786 E1.15318
G1 X76.491 Y192.786 E.03159
G1 X60.062 Y209.214 E1.15318
G1 X60.699 Y209.214 E.03159
G1 X77.127 Y192.786 E1.15318
G1 X77.763 Y192.786 E.03159
G1 X61.335 Y209.214 E1.15318
G1 X61.972 Y209.214 E.03159
G1 X78.4 Y192.786 E1.15318
G1 X79.036 Y192.786 E.03159
G1 X62.608 Y209.214 E1.15318
M73 P60 R26
G1 X63.244 Y209.214 E.03159
G1 X79.673 Y192.786 E1.15318
G1 X80.309 Y192.786 E.03159
G1 X63.881 Y209.214 E1.15318
G1 X64.517 Y209.214 E.03159
G1 X80.946 Y192.786 E1.15318
G1 X81.582 Y192.786 E.03159
G1 X65.154 Y209.214 E1.15318
G1 X65.79 Y209.214 E.03159
G1 X82.218 Y192.786 E1.15318
G1 X82.855 Y192.786 E.03159
G1 X66.426 Y209.214 E1.15318
G1 X67.063 Y209.214 E.03159
G1 X83.491 Y192.786 E1.15318
G1 X84.128 Y192.786 E.03159
G1 X67.699 Y209.214 E1.15318
G1 X68.336 Y209.214 E.03159
G1 X84.764 Y192.786 E1.15318
G1 X85.4 Y192.786 E.03159
G1 X68.972 Y209.214 E1.15318
G1 X69.608 Y209.214 E.03159
G1 X86.037 Y192.786 E1.15318
G1 X86.673 Y192.786 E.03159
G1 X70.245 Y209.214 E1.15318
G1 X70.881 Y209.214 E.03159
G1 X87.31 Y192.786 E1.15318
G1 X87.946 Y192.786 E.03159
G1 X71.518 Y209.214 E1.15318
G1 X72.154 Y209.214 E.03159
G1 X88.582 Y192.786 E1.15318
G1 X89.219 Y192.786 E.03159
G1 X72.791 Y209.214 E1.15318
G1 X73.427 Y209.214 E.03159
G1 X89.855 Y192.786 E1.15318
G1 X90.492 Y192.786 E.03159
G1 X74.063 Y209.214 E1.15318
G1 X74.7 Y209.214 E.03159
G1 X91.128 Y192.786 E1.15318
G1 X91.764 Y192.786 E.03159
G1 X75.336 Y209.214 E1.15318
G1 X75.973 Y209.214 E.03159
G1 X92.401 Y192.786 E1.15318
G1 X93.037 Y192.786 E.03159
G1 X76.609 Y209.214 E1.15318
G1 X77.245 Y209.214 E.03159
G1 X93.674 Y192.786 E1.15318
G1 X94.31 Y192.786 E.03159
G1 X77.882 Y209.214 E1.15318
G1 X78.518 Y209.214 E.03159
G1 X94.947 Y192.786 E1.15318
G1 X95.583 Y192.786 E.03159
G1 X79.155 Y209.214 E1.15318
G1 X79.791 Y209.214 E.03159
G1 X96.219 Y192.786 E1.15318
G1 X96.856 Y192.786 E.03159
G1 X80.427 Y209.214 E1.15318
G1 X81.064 Y209.214 E.03159
G1 X97.492 Y192.786 E1.15318
G1 X98.129 Y192.786 E.03159
G1 X81.7 Y209.214 E1.15318
G1 X82.337 Y209.214 E.03159
G1 X98.765 Y192.786 E1.15318
G1 X99.401 Y192.786 E.03159
G1 X82.973 Y209.214 E1.15318
M73 P61 R26
G1 X83.609 Y209.214 E.03159
G1 X100.038 Y192.786 E1.15318
G1 X100.674 Y192.786 E.03159
G1 X84.246 Y209.214 E1.15318
G1 X84.882 Y209.214 E.03159
G1 X101.311 Y192.786 E1.15318
G1 X101.947 Y192.786 E.03159
G1 X85.519 Y209.214 E1.15318
G1 X86.155 Y209.214 E.03159
G1 X102.583 Y192.786 E1.15318
G1 X103.22 Y192.786 E.03159
G1 X86.792 Y209.214 E1.15318
G1 X87.428 Y209.214 E.03159
G1 X103.856 Y192.786 E1.15318
G1 X104.493 Y192.786 E.03159
G1 X88.064 Y209.214 E1.15318
G1 X88.701 Y209.214 E.03159
G1 X105.129 Y192.786 E1.15318
G1 X105.766 Y192.786 E.03159
G1 X89.337 Y209.214 E1.15318
G1 X89.974 Y209.214 E.03159
G1 X106.402 Y192.786 E1.15318
G1 X107.038 Y192.786 E.03159
G1 X90.61 Y209.214 E1.15318
G1 X91.246 Y209.214 E.03159
G1 X107.675 Y192.786 E1.15318
G1 X108.311 Y192.786 E.03159
G1 X91.883 Y209.214 E1.15318
G1 X92.519 Y209.214 E.03159
G1 X108.948 Y192.786 E1.15318
G1 X109.584 Y192.786 E.03159
G1 X93.156 Y209.214 E1.15318
G1 X93.792 Y209.214 E.03159
G1 X110.22 Y192.786 E1.15318
G1 X110.857 Y192.786 E.03159
G1 X94.428 Y209.214 E1.15318
G1 X95.065 Y209.214 E.03159
G1 X111.493 Y192.786 E1.15318
G1 X112.13 Y192.786 E.03159
G1 X95.701 Y209.214 E1.15318
G1 X96.338 Y209.214 E.03159
G1 X112.766 Y192.786 E1.15318
G1 X113.402 Y192.786 E.03159
G1 X96.974 Y209.214 E1.15318
G1 X97.611 Y209.214 E.03159
G1 X114.039 Y192.786 E1.15318
G1 X114.675 Y192.786 E.03159
G1 X98.247 Y209.214 E1.15318
G1 X98.883 Y209.214 E.03159
G1 X115.312 Y192.786 E1.15318
G1 X115.948 Y192.786 E.03159
G1 X99.52 Y209.214 E1.15318
G1 X100.156 Y209.214 E.03159
G1 X116.584 Y192.786 E1.15318
G1 X117.221 Y192.786 E.03159
G1 X100.793 Y209.214 E1.15318
G1 X101.429 Y209.214 E.03159
G1 X117.857 Y192.786 E1.15318
G1 X118.494 Y192.786 E.03159
G1 X102.065 Y209.214 E1.15318
G1 X102.702 Y209.214 E.03159
G1 X119.13 Y192.786 E1.15318
G1 X119.767 Y192.786 E.03159
G1 X103.338 Y209.214 E1.15318
G1 X103.975 Y209.214 E.03159
G1 X120.403 Y192.786 E1.15318
G1 X121.039 Y192.786 E.03159
G1 X104.611 Y209.214 E1.15318
G1 X105.247 Y209.214 E.03159
G1 X121.676 Y192.786 E1.15318
G1 X122.312 Y192.786 E.03159
G1 X105.884 Y209.214 E1.15318
G1 X106.52 Y209.214 E.03159
G1 X122.949 Y192.786 E1.15318
G1 X123.585 Y192.786 E.03159
G1 X107.157 Y209.214 E1.15318
G1 X107.793 Y209.214 E.03159
G1 X124.221 Y192.786 E1.15318
G1 X124.858 Y192.786 E.03159
G1 X108.429 Y209.214 E1.15318
G1 X109.066 Y209.214 E.03159
G1 X125.494 Y192.786 E1.15318
G1 X126.131 Y192.786 E.03159
G1 X109.702 Y209.214 E1.15318
G1 X110.339 Y209.214 E.03159
G1 X126.767 Y192.786 E1.15318
G1 X127.403 Y192.786 E.03159
G1 X110.975 Y209.214 E1.15318
G1 X111.612 Y209.214 E.03159
G1 X128.04 Y192.786 E1.15318
G1 X128.676 Y192.786 E.03159
G1 X112.248 Y209.214 E1.15318
G1 X112.884 Y209.214 E.03159
G1 X129.313 Y192.786 E1.15318
G1 X129.949 Y192.786 E.03159
G1 X113.521 Y209.214 E1.15318
G1 X114.157 Y209.214 E.03159
G1 X130.586 Y192.786 E1.15318
G1 X131.222 Y192.786 E.03159
G1 X114.591 Y209.417 E1.1674
M106 S102
G1 X124.137 Y209.417 F30000
M106 S229.5
G1 F3000
G1 X129.165 Y204.389 E.35291
G3 X128.35 Y204.568 I-1.443 J-4.635 E.04147
G1 X123.703 Y209.214 E.32615
G1 X123.067 Y209.214 E.03159
G1 X127.709 Y204.572 E.32586
G3 X127.159 Y204.486 I.373 J-4.2 E.02768
G1 X122.431 Y209.214 E.33189
G1 X121.794 Y209.214 E.03159
G1 X126.678 Y204.331 E.34279
G3 X126.245 Y204.127 I.799 J-2.262 E.02378
G1 X121.158 Y209.214 E.35708
G1 X120.521 Y209.214 E.03159
G1 X125.859 Y203.876 E.37469
G3 X125.516 Y203.583 I1.296 J-1.864 E.02244
G1 X119.885 Y209.214 E.39527
G1 X119.248 Y209.214 E.03159
G1 X125.211 Y203.251 E.41855
G3 X124.945 Y202.881 I1.711 J-1.509 E.02267
G1 X118.612 Y209.214 E.44455
G1 X117.976 Y209.214 E.03159
G1 X124.727 Y202.462 E.47394
G3 X124.557 Y201.996 I2.245 J-1.085 E.02467
G1 X117.339 Y209.214 E.50666
G1 X116.703 Y209.214 E.03159
G1 X124.446 Y201.471 E.54351
G3 X124.416 Y200.864 I3.02 J-.45 E.03022
G1 X116.066 Y209.214 E.58613
G1 X115.43 Y209.214 E.03159
G1 X124.831 Y199.813 E.65991
M106 S102
; WIPE_START
G1 X123.417 Y201.227 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.809 Y197.835 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
M106 S229.5
G1 F3000
G1 X131.858 Y192.786 E.35445
G1 X132.495 Y192.786 E.03159
G1 X127.858 Y197.423 E.32547
G3 X128.47 Y197.447 I.21 J2.396 E.03047
G1 X133.131 Y192.786 E.3272
G1 X133.768 Y192.786 E.03159
G1 X128.998 Y197.555 E.33477
G3 X129.462 Y197.728 I-.633 J2.402 E.02459
G1 X134.404 Y192.786 E.34692
G1 X135.04 Y192.786 E.03159
G1 X129.879 Y197.947 E.36228
G3 X130.253 Y198.209 I-3.016 J4.704 E.02269
G1 X135.677 Y192.786 E.38069
G1 X136.313 Y192.786 E.03159
G1 X130.583 Y198.516 E.4022
G3 X130.875 Y198.86 I-1.577 J1.629 E.02245
G1 X136.95 Y192.786 E.42641
G1 X137.586 Y192.786 E.03159
G1 X131.127 Y199.245 E.45338
G3 X131.332 Y199.676 I-4.242 J2.276 E.02372
G1 X138.222 Y192.786 E.48368
G1 X138.859 Y192.786 E.03159
G1 X131.484 Y200.16 E.51766
G3 X131.573 Y200.708 I-3.918 J.92 E.02754
G1 X139.495 Y192.786 E.55607
G1 X140.132 Y192.786 E.03159
G1 X131.571 Y201.347 E.60093
G3 X131.39 Y202.164 I-2.761 J-.182 E.0417
G1 X140.768 Y192.786 E.65829
G1 X141.404 Y192.786 E.03159
G1 X124.976 Y209.214 E1.15318
G1 X125.613 Y209.214 E.03159
G1 X142.041 Y192.786 E1.15318
G1 X142.677 Y192.786 E.03159
G1 X126.249 Y209.214 E1.15318
G1 X126.885 Y209.214 E.03159
G1 X143.314 Y192.786 E1.15318
G1 X143.95 Y192.786 E.03159
G1 X127.522 Y209.214 E1.15318
G1 X128.158 Y209.214 E.03159
G1 X144.587 Y192.786 E1.15318
G1 X145.223 Y192.786 E.03159
G1 X128.795 Y209.214 E1.15318
G1 X129.431 Y209.214 E.03159
G1 X145.859 Y192.786 E1.15318
G1 X146.496 Y192.786 E.03159
G1 X130.067 Y209.214 E1.15318
G1 X130.704 Y209.214 E.03159
G1 X147.132 Y192.786 E1.15318
G1 X147.769 Y192.786 E.03159
G1 X131.34 Y209.214 E1.15318
G1 X131.977 Y209.214 E.03159
G1 X148.405 Y192.786 E1.15318
G1 X149.041 Y192.786 E.03159
G1 X132.613 Y209.214 E1.15318
G1 X133.249 Y209.214 E.03159
G1 X149.678 Y192.786 E1.15318
G1 X150.314 Y192.786 E.03159
G1 X133.886 Y209.214 E1.15318
G1 X134.522 Y209.214 E.03159
G1 X150.951 Y192.786 E1.15318
G1 X151.587 Y192.786 E.03159
G1 X135.159 Y209.214 E1.15318
G1 X135.795 Y209.214 E.03159
G1 X152.223 Y192.786 E1.15318
G1 X152.86 Y192.786 E.03159
G1 X136.432 Y209.214 E1.15318
G1 X137.068 Y209.214 E.03159
G1 X153.496 Y192.786 E1.15318
G1 X154.133 Y192.786 E.03159
G1 X137.704 Y209.214 E1.15318
M73 P62 R26
G1 X138.341 Y209.214 E.03159
G1 X154.769 Y192.786 E1.15318
G1 X155.406 Y192.786 E.03159
G1 X138.977 Y209.214 E1.15318
G1 X139.614 Y209.214 E.03159
G1 X156.042 Y192.786 E1.15318
G1 X156.678 Y192.786 E.03159
G1 X140.25 Y209.214 E1.15318
G1 X140.886 Y209.214 E.03159
G1 X157.315 Y192.786 E1.15318
G1 X157.951 Y192.786 E.03159
G1 X141.523 Y209.214 E1.15318
G1 X142.159 Y209.214 E.03159
G1 X158.588 Y192.786 E1.15318
G1 X159.224 Y192.786 E.03159
G1 X142.796 Y209.214 E1.15318
G1 X143.432 Y209.214 E.03159
G1 X159.86 Y192.786 E1.15318
G1 X160.497 Y192.786 E.03159
G1 X144.068 Y209.214 E1.15318
G1 X144.705 Y209.214 E.03159
G1 X161.133 Y192.786 E1.15318
G1 X161.77 Y192.786 E.03159
G1 X145.341 Y209.214 E1.15318
G1 X145.978 Y209.214 E.03159
G1 X162.406 Y192.786 E1.15318
G1 X163.042 Y192.786 E.03159
G1 X146.614 Y209.214 E1.15318
G1 X147.251 Y209.214 E.03159
G1 X163.679 Y192.786 E1.15318
M73 P62 R25
G1 X164.315 Y192.786 E.03159
G1 X147.887 Y209.214 E1.15318
G1 X148.523 Y209.214 E.03159
G1 X164.952 Y192.786 E1.15318
G1 X165.588 Y192.786 E.03159
G1 X149.16 Y209.214 E1.15318
G1 X149.796 Y209.214 E.03159
G1 X166.224 Y192.786 E1.15318
G1 X166.861 Y192.786 E.03159
G1 X150.433 Y209.214 E1.15318
G1 X151.069 Y209.214 E.03159
G1 X167.497 Y192.786 E1.15318
G1 X168.134 Y192.786 E.03159
G1 X151.705 Y209.214 E1.15318
G1 X152.342 Y209.214 E.03159
G1 X168.77 Y192.786 E1.15318
G1 X169.407 Y192.786 E.03159
G1 X152.978 Y209.214 E1.15318
G1 X153.615 Y209.214 E.03159
G1 X170.043 Y192.786 E1.15318
G1 X170.679 Y192.786 E.03159
G1 X154.251 Y209.214 E1.15318
G1 X154.887 Y209.214 E.03159
G1 X171.316 Y192.786 E1.15318
G1 X171.952 Y192.786 E.03159
G1 X155.524 Y209.214 E1.15318
G1 X156.16 Y209.214 E.03159
G1 X172.589 Y192.786 E1.15318
G1 X173.225 Y192.786 E.03159
G1 X156.797 Y209.214 E1.15318
G1 X157.433 Y209.214 E.03159
G1 X173.861 Y192.786 E1.15318
G1 X174.498 Y192.786 E.03159
G1 X158.069 Y209.214 E1.15318
G1 X158.706 Y209.214 E.03159
G1 X175.134 Y192.786 E1.15318
G1 X175.771 Y192.786 E.03159
G1 X159.342 Y209.214 E1.15318
G1 X159.979 Y209.214 E.03159
G1 X176.407 Y192.786 E1.15318
G1 X177.043 Y192.786 E.03159
G1 X160.615 Y209.214 E1.15318
G1 X161.252 Y209.214 E.03159
G1 X177.68 Y192.786 E1.15318
G1 X178.316 Y192.786 E.03159
G1 X161.888 Y209.214 E1.15318
G1 X162.524 Y209.214 E.03159
G1 X178.953 Y192.786 E1.15318
G1 X179.589 Y192.786 E.03159
G1 X163.161 Y209.214 E1.15318
G1 X163.797 Y209.214 E.03159
G1 X180.226 Y192.786 E1.15318
G1 X180.862 Y192.786 E.03159
G1 X164.434 Y209.214 E1.15318
G1 X165.07 Y209.214 E.03159
G1 X181.498 Y192.786 E1.15318
G1 X182.135 Y192.786 E.03159
G1 X165.706 Y209.214 E1.15318
G1 X166.343 Y209.214 E.03159
G1 X182.771 Y192.786 E1.15318
G1 X183.408 Y192.786 E.03159
G1 X166.979 Y209.214 E1.15318
G1 X167.616 Y209.214 E.03159
G1 X184.044 Y192.786 E1.15318
G1 X184.68 Y192.786 E.03159
G1 X168.252 Y209.214 E1.15318
G1 X168.888 Y209.214 E.03159
G1 X185.317 Y192.786 E1.15318
G1 X185.953 Y192.786 E.03159
G1 X169.525 Y209.214 E1.15318
G1 X170.161 Y209.214 E.03159
G1 X186.59 Y192.786 E1.15318
G1 X187.226 Y192.786 E.03159
G1 X170.798 Y209.214 E1.15318
G1 X171.434 Y209.214 E.03159
G1 X187.862 Y192.786 E1.15318
G1 X188.499 Y192.786 E.03159
G1 X172.071 Y209.214 E1.15318
G1 X172.707 Y209.214 E.03159
G1 X189.135 Y192.786 E1.15318
G1 X189.772 Y192.786 E.03159
G1 X173.343 Y209.214 E1.15318
G1 X173.98 Y209.214 E.03159
G1 X190.408 Y192.786 E1.15318
G1 X191.044 Y192.786 E.03159
G1 X174.414 Y209.417 E1.1674
M106 S102
; WIPE_START
G1 X175.828 Y208.002 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X170.938 Y202.142 Z2.6 F30000
G1 X47.583 Y54.317 Z2.6
G1 Z2.2
G1 E.8 F1800
M106 S229.5
G1 F3000
G1 X59.115 Y42.786 E.80945
G1 X58.478 Y42.786 E.03159
G1 X47.786 Y53.478 E.75056
G1 X47.786 Y52.842 E.03159
G1 X57.842 Y42.786 E.70589
G1 X57.206 Y42.786 E.03159
G1 X47.786 Y52.206 E.66121
G1 X47.786 Y51.569 E.03159
G1 X56.569 Y42.786 E.61654
G1 X55.933 Y42.786 E.03159
G1 X47.786 Y50.933 E.57187
G1 X47.786 Y50.296 E.03159
G1 X55.296 Y42.786 E.52719
G1 X54.66 Y42.786 E.03159
G1 X47.786 Y49.66 E.48252
G1 X47.786 Y49.023 E.03159
G1 X54.023 Y42.786 E.43785
G1 X53.387 Y42.786 E.03159
G1 X47.786 Y48.387 E.39318
G1 X47.786 Y47.751 E.03159
G1 X52.751 Y42.786 E.3485
G1 X52.114 Y42.786 E.03159
G1 X47.786 Y47.114 E.30383
G1 X47.786 Y46.478 E.03159
G1 X51.478 Y42.786 E.25916
G1 X50.841 Y42.786 E.03159
G1 X47.786 Y45.841 E.21449
G1 X47.786 Y45.205 E.03159
G1 X50.205 Y42.786 E.16981
G1 X49.569 Y42.786 E.03159
G1 X47.786 Y44.569 E.12514
G1 X47.786 Y43.932 E.03159
G1 X48.932 Y42.786 E.08047
G1 X48.296 Y42.786 E.03159
G1 X47.583 Y43.498 E.05001
M106 S102
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X48.296 Y42.786 E-.38287
G1 X48.932 Y42.786 E-.24184
G1 X48.68 Y43.038 E-.13529
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/58
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
G1 X127.895 Y197.791
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X128.24 Y197.795 E.01109
G3 X129.176 Y198.004 I-.245 J3.289 E.03094
G3 X127.807 Y197.791 I-1.167 J2.996 E.60471
G1 X127.835 Y197.791 E.00091
G1 X127.714 Y198.214 F30000
G1 F8843.478
G1 X127.838 Y198.197 E.004
G3 X128.761 Y198.295 I.18 J2.724 E.03001
G3 X127.376 Y198.265 I-.752 J2.706 E.52246
G1 X127.655 Y198.223 E.00909
G1 X127.808 Y198.611 F30000
G1 F8843.478
G1 X127.868 Y198.603 E.00195
M73 P63 R25
G3 X128.651 Y198.687 I.011 J3.598 E.02536
G3 X127.466 Y198.661 I-.643 J2.314 E.44671
G1 X127.749 Y198.62 E.00918
G1 X127.897 Y198.994 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X127.898 Y198.994 E.00003
G3 X128.349 Y199.02 I.097 J2.245 E.01349
G3 X127.553 Y199.043 I-.34 J1.98 E.35205
G1 X127.837 Y199.003 E.00854
; WIPE_START
M204 S10000
G1 X127.898 Y198.994 E-.02324
G1 X127.898 Y198.994 E0
G1 X128.15 Y198.995 E-.09596
G1 X128.349 Y199.02 E-.07617
G1 X128.734 Y199.129 E-.15214
G1 X128.917 Y199.211 E-.07614
G1 X129.253 Y199.428 E-.1521
G1 X129.54 Y199.708 E-.15214
G1 X129.588 Y199.778 E-.03211
; WIPE_END
G1 E-.04 F1800
G1 X121.958 Y199.572 Z2.8 F30000
G1 X55.895 Y197.791 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X56.24 Y197.795 E.01109
G3 X57.176 Y198.004 I-.245 J3.289 E.03094
G3 X55.807 Y197.791 I-1.167 J2.996 E.60471
G1 X55.835 Y197.791 E.00091
G1 X55.714 Y198.214 F30000
G1 F8843.478
G1 X55.838 Y198.197 E.004
G3 X56.761 Y198.295 I.18 J2.724 E.03001
G3 X55.376 Y198.265 I-.752 J2.706 E.52246
G1 X55.655 Y198.223 E.00909
G1 X55.808 Y198.611 F30000
G1 F8843.478
G1 X55.868 Y198.603 E.00195
G3 X56.651 Y198.687 I.011 J3.598 E.02536
G3 X55.466 Y198.661 I-.643 J2.314 E.44671
G1 X55.749 Y198.62 E.00918
G1 X55.897 Y198.994 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X55.898 Y198.994 E.00004
G3 X56.349 Y199.02 I.097 J2.245 E.01349
G3 X55.553 Y199.043 I-.34 J1.98 E.35205
G1 X55.837 Y199.003 E.00854
; WIPE_START
M204 S10000
G1 X55.898 Y198.994 E-.02325
G1 X55.898 Y198.994 E0
G1 X56.15 Y198.995 E-.09595
G1 X56.349 Y199.02 E-.07617
G1 X56.734 Y199.129 E-.15214
G1 X56.917 Y199.211 E-.07614
G1 X57.253 Y199.428 E-.15213
G1 X57.54 Y199.708 E-.15211
G1 X57.588 Y199.778 E-.03211
; WIPE_END
G1 E-.04 F1800
G1 X57.684 Y192.146 Z2.8 F30000
G1 X58.496 Y128.027 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X58.468 Y128.071 E.00167
G3 X55.807 Y122.791 I-2.46 J-2.071 E.40838
G3 X57.176 Y123.004 I.188 J3.294 E.04486
G3 X58.662 Y127.815 I-1.167 J2.996 E.18601
G1 X58.533 Y127.98 E.00673
G1 X58.13 Y127.832 F30000
G1 F8843.478
G1 X57.966 Y128.016 E.00792
G3 X55.838 Y123.197 I-1.957 J-2.015 E.34785
G3 X56.761 Y123.295 I.18 J2.726 E.03
G3 X58.174 Y127.791 I-.752 J2.706 E.17982
G1 X57.86 Y127.517 F30000
G1 F8843.478
G1 X57.845 Y127.548 E.00111
G3 X55.868 Y123.603 I-1.837 J-1.547 E.30538
G3 X56.651 Y123.687 I.01 J3.604 E.02535
G3 X58.115 Y127.152 I-.643 J2.314 E.13897
G1 X57.894 Y127.468 E.0124
G1 X57.524 Y127.307 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X57.256 Y127.574 E.01129
G3 X55.898 Y123.994 I-1.247 J-1.575 E.22473
G3 X56.349 Y124.02 I.097 J2.243 E.01349
G3 X57.567 Y127.267 I-.341 J1.98 E.12461
; WIPE_START
M204 S10000
G1 X57.256 Y127.574 E-.16651
G1 X57.091 Y127.689 E-.07622
G1 X56.734 Y127.871 E-.15213
G1 X56.349 Y127.98 E-.15211
G1 X55.95 Y128.01 E-.15212
G1 X55.791 Y127.99 E-.0609
; WIPE_END
G1 E-.04 F1800
G1 X62.685 Y131.265 Z2.8 F30000
G1 X191.416 Y192.416 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X64.584 Y192.416 E4.07847
G1 X64.584 Y59.584 E4.27141
G1 X191.416 Y59.584 E4.07847
G1 X191.416 Y192.356 E4.26948
G1 X191.009 Y192.009 F30000
G1 F8843.478
G1 X64.991 Y192.009 E4.05229
G1 X64.991 Y59.991 E4.24523
G1 X191.009 Y59.991 E4.05229
G1 X191.009 Y191.949 E4.2433
G1 X190.602 Y191.602 F30000
G1 F8843.478
G1 X65.398 Y191.602 E4.02611
G1 X65.398 Y60.398 E4.21905
G1 X190.602 Y60.398 E4.02611
G1 X190.602 Y191.542 E4.21712
G1 X190.21 Y191.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X65.79 Y191.21 E3.70605
G1 X65.79 Y60.79 E3.88477
G1 X190.21 Y60.79 E3.70605
G1 X190.21 Y191.15 E3.88298
; WIPE_START
M204 S10000
G1 X188.21 Y191.151 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X183.033 Y185.542 Z2.8 F30000
G1 X55.896 Y47.791 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X56.24 Y47.795 E.01108
G3 X57.176 Y48.004 I-.245 J3.29 E.03093
G3 X55.807 Y47.791 I-1.167 J2.996 E.60472
G1 X55.836 Y47.791 E.00091
G1 X55.715 Y48.214 F30000
G1 F8843.478
G1 X55.838 Y48.197 E.004
G3 X56.761 Y48.295 I.18 J2.726 E.03
G3 X55.376 Y48.265 I-.752 J2.706 E.52247
G1 X55.655 Y48.223 E.00909
G1 X55.808 Y48.611 F30000
G1 F8843.478
G1 X55.868 Y48.603 E.00195
G3 X56.651 Y48.687 I.01 J3.604 E.02535
G3 X55.466 Y48.661 I-.643 J2.314 E.44671
G1 X55.749 Y48.62 E.00918
G1 X55.904 Y48.994 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X56.15 Y48.998 E.00733
G3 X56.349 Y49.02 I-.155 J2.24 E.00597
G3 X55.844 Y48.998 I-.341 J1.98 E.36083
; WIPE_START
M204 S10000
G1 X56.15 Y48.998 E-.11619
G1 X56.349 Y49.02 E-.07613
G1 X56.544 Y49.065 E-.07613
G1 X56.917 Y49.211 E-.15213
G1 X57.253 Y49.428 E-.15213
G1 X57.54 Y49.708 E-.1521
G1 X57.592 Y49.784 E-.03518
; WIPE_END
G1 E-.04 F1800
G1 X65.222 Y49.599 Z2.8 F30000
G1 X126.589 Y48.112 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X126.679 Y48.073 E.00318
G3 X127.807 Y47.791 I1.329 J2.927 E.03759
G3 X129.176 Y48.004 I.188 J3.294 E.04486
G3 X126.395 Y48.22 I-1.167 J2.996 E.55683
G1 X126.536 Y48.141 E.0052
G1 X127.14 Y48.326 F30000
G1 F8843.478
G1 X127.376 Y48.265 E.00783
G3 X127.838 Y48.197 I.634 J2.736 E.01504
G3 X128.761 Y48.295 I.18 J2.726 E.03
G3 X127.085 Y48.349 I-.752 J2.706 E.51272
G1 X127.569 Y48.644 F30000
G1 F8843.478
G1 X127.868 Y48.603 E.00972
G3 X128.651 Y48.687 I.01 J3.604 E.02535
G3 X127.466 Y48.661 I-.643 J2.314 E.44671
G1 X127.51 Y48.654 E.00142
G1 X127.904 Y48.994 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.15 Y48.998 E.00732
G3 X128.349 Y49.02 I-.155 J2.24 E.00597
G3 X127.845 Y48.998 I-.341 J1.98 E.36084
; WIPE_START
M204 S10000
G1 X128.15 Y48.998 E-.11604
G1 X128.349 Y49.02 E-.07614
G1 X128.544 Y49.065 E-.07613
G1 X128.917 Y49.211 E-.15213
G1 X129.253 Y49.428 E-.15209
G1 X129.54 Y49.708 E-.15214
G1 X129.592 Y49.785 E-.03532
; WIPE_END
G1 E-.04 F1800
G1 X137.222 Y49.568 Z2.8 F30000
G1 X199.896 Y47.791 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X200.24 Y47.795 E.01108
G3 X201.176 Y48.004 I-.245 J3.29 E.03094
G3 X199.807 Y47.791 I-1.167 J2.996 E.60472
G1 X199.836 Y47.791 E.00091
G1 X199.714 Y48.214 F30000
G1 F8843.478
G1 X199.838 Y48.197 E.004
G3 X200.761 Y48.295 I.18 J2.727 E.03
G3 X199.376 Y48.265 I-.752 J2.706 E.52247
G1 X199.655 Y48.223 E.00909
G1 X199.808 Y48.611 F30000
G1 F8843.478
G1 X199.868 Y48.603 E.00195
G3 X200.651 Y48.687 I.01 J3.605 E.02535
G3 X199.466 Y48.661 I-.643 J2.314 E.44671
G1 X199.749 Y48.62 E.00919
G1 X199.904 Y48.994 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X200.15 Y48.998 E.00733
G3 X200.349 Y49.02 I-.155 J2.24 E.00597
G3 X199.844 Y48.998 I-.341 J1.98 E.36083
; WIPE_START
M204 S10000
G1 X200.15 Y48.998 E-.11622
G1 X200.349 Y49.02 E-.07613
G1 X200.544 Y49.065 E-.07613
G1 X200.917 Y49.211 E-.15213
G1 X201.253 Y49.428 E-.15214
G1 X201.54 Y49.708 E-.1521
G1 X201.592 Y49.784 E-.03515
; WIPE_END
G1 E-.04 F1800
G1 X201.415 Y57.415 Z2.8 F30000
G1 X199.896 Y122.791 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X200.24 Y122.795 E.01108
G3 X201.176 Y123.004 I-.245 J3.29 E.03094
G3 X199.807 Y122.791 I-1.167 J2.996 E.60472
G1 X199.836 Y122.791 E.00091
G1 X199.714 Y123.214 F30000
G1 F8843.478
G1 X199.838 Y123.197 E.004
G3 X200.761 Y123.295 I.18 J2.727 E.03
G3 X199.376 Y123.265 I-.752 J2.706 E.52247
G1 X199.655 Y123.223 E.00909
G1 X199.808 Y123.611 F30000
G1 F8843.478
G1 X199.868 Y123.603 E.00195
G3 X200.651 Y123.687 I.01 J3.605 E.02535
G3 X199.466 Y123.661 I-.643 J2.314 E.44671
G1 X199.749 Y123.62 E.00919
G1 X199.904 Y123.994 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X200.15 Y123.998 E.00733
G3 X200.349 Y124.02 I-.155 J2.24 E.00597
G3 X199.844 Y123.998 I-.341 J1.98 E.36083
; WIPE_START
M204 S10000
G1 X200.15 Y123.998 E-.11619
G1 X200.349 Y124.02 E-.07613
G1 X200.734 Y124.129 E-.15213
G1 X201.091 Y124.311 E-.15208
G1 X201.404 Y124.561 E-.15213
G1 X201.592 Y124.785 E-.11134
; WIPE_END
G1 E-.04 F1800
G1 X201.415 Y132.416 Z2.8 F30000
G1 X199.895 Y197.791 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X200.24 Y197.795 E.01109
G3 X201.176 Y198.005 I-.245 J3.289 E.03094
G3 X199.807 Y197.791 I-1.167 J2.996 E.6047
G1 X199.835 Y197.791 E.00091
G1 X199.714 Y198.214 F30000
G1 F8843.478
G1 X199.838 Y198.197 E.004
G3 X200.761 Y198.295 I.18 J2.727 E.03
G3 X199.376 Y198.265 I-.752 J2.706 E.52247
G1 X199.655 Y198.223 E.00908
G1 X199.808 Y198.611 F30000
G1 F8843.478
G1 X199.868 Y198.603 E.00195
G3 X200.651 Y198.687 I.011 J3.601 E.02536
G3 X199.466 Y198.661 I-.643 J2.314 E.44671
G1 X199.749 Y198.62 E.00918
G1 X199.897 Y198.994 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X199.898 Y198.994 E.00002
G3 X200.349 Y199.02 I.097 J2.243 E.01349
G3 X199.553 Y199.043 I-.341 J1.98 E.35205
G1 X199.838 Y199.003 E.00855
; WIPE_START
M204 S10000
G1 X199.898 Y198.994 E-.02307
G1 X199.898 Y198.994 E0
G1 X200.15 Y198.995 E-.09596
G1 X200.349 Y199.02 E-.07617
G1 X200.544 Y199.065 E-.07613
G1 X200.917 Y199.211 E-.15213
G1 X201.253 Y199.428 E-.15214
G1 X201.54 Y199.708 E-.1521
G1 X201.588 Y199.778 E-.03229
; WIPE_END
G1 E-.04 F1800
G1 X206.021 Y205.991 Z2.8 F30000
G1 X208.584 Y209.584 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X47.416 Y209.584 E5.18256
G1 X47.416 Y42.416 E5.3755
G1 X208.584 Y42.416 E5.18256
G1 X208.584 Y209.524 E5.37357
G1 X208.991 Y209.991 F30000
G1 F8843.478
G1 X47.009 Y209.991 E5.20874
G1 X47.009 Y42.009 E5.40168
G1 X208.991 Y42.009 E5.20874
G1 X208.991 Y209.931 E5.39975
G1 X209.398 Y210.398 F30000
G1 F8843.478
G1 X46.602 Y210.398 E5.23492
G1 X46.602 Y41.602 E5.42786
G1 X209.398 Y41.602 E5.23492
G1 X209.398 Y210.338 E5.42593
G1 X209.79 Y210.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X46.21 Y210.79 E4.87249
G1 X46.21 Y41.21 E5.05121
G1 X209.79 Y41.21 E4.87249
G1 X209.79 Y210.73 E5.04942
; WIPE_START
M204 S10000
G1 X207.79 Y210.731 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X207.657 Y209.42 Z2.8 F30000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42037
G1 F9537.687
G1 X208.251 Y208.827 E.02502
G1 X208.251 Y208.293 E.01592
G1 X207.293 Y209.251 E.04037
G1 X206.759 Y209.251 E.01592
G1 X208.251 Y207.759 E.06288
G1 X208.251 Y207.225 E.01592
G1 X206.225 Y209.251 E.08539
G1 X205.692 Y209.251 E.01592
G1 X208.251 Y206.692 E.1079
G1 X208.251 Y206.158 E.01592
G1 X205.158 Y209.251 E.13041
G1 X204.624 Y209.251 E.01592
G1 X208.251 Y205.624 E.15291
G1 X208.251 Y205.09 E.01592
G1 X204.09 Y209.251 E.17542
G1 X203.557 Y209.251 E.01592
G1 X208.251 Y204.556 E.19793
G1 X208.251 Y204.023 E.01592
G1 X203.023 Y209.251 E.22044
G1 X202.489 Y209.251 E.01592
G1 X208.251 Y203.489 E.24295
G1 X208.251 Y202.955 E.01592
G1 X201.955 Y209.251 E.26545
M73 P63 R24
G1 X201.421 Y209.251 E.01592
G1 X208.251 Y202.421 E.28796
G1 X208.251 Y201.888 E.01592
G1 X200.888 Y209.251 E.31047
G1 X200.354 Y209.251 E.01592
G1 X208.251 Y201.354 E.33298
G1 X208.251 Y200.82 E.01592
G1 X199.82 Y209.251 E.35549
G1 X199.286 Y209.251 E.01592
G1 X208.251 Y200.286 E.37799
G1 X208.251 Y199.752 E.01592
G1 X198.752 Y209.251 E.4005
G1 X198.219 Y209.251 E.01592
G1 X208.251 Y199.219 E.42301
G1 X208.251 Y198.685 E.01592
G1 X197.685 Y209.251 E.44552
G1 X197.151 Y209.251 E.01592
G1 X208.251 Y198.151 E.46803
G1 X208.251 Y197.617 E.01592
G1 X196.617 Y209.251 E.49053
G1 X196.083 Y209.251 E.01592
M73 P64 R24
G1 X200.901 Y204.433 E.20314
G3 X200.258 Y204.542 I-1.148 J-4.815 E.01946
G1 X195.55 Y209.251 E.19854
G1 X195.016 Y209.251 E.01592
G1 X199.729 Y204.537 E.19875
G3 X199.261 Y204.472 I.093 J-2.378 E.01413
G1 X194.482 Y209.251 E.20151
G1 X193.948 Y209.251 E.01592
G1 X198.842 Y204.356 E.20637
G3 X198.465 Y204.2 I.593 J-1.958 E.01219
G1 X193.414 Y209.251 E.21298
G1 X192.881 Y209.251 E.01592
G1 X198.122 Y204.01 E.22099
G3 X197.808 Y203.789 I.946 J-1.678 E.01144
G1 X192.347 Y209.251 E.23028
G1 X191.813 Y209.251 E.01592
G1 X197.524 Y203.54 E.2408
G3 X197.268 Y203.262 I1.26 J-1.419 E.01128
G1 X191.279 Y209.251 E.25251
G1 X190.745 Y209.251 E.01592
G1 X197.04 Y202.956 E.26543
G3 X196.843 Y202.619 I1.582 J-1.155 E.01165
G1 X190.212 Y209.251 E.27961
G1 X189.678 Y209.251 E.01592
G1 X196.678 Y202.251 E.29516
G3 X196.551 Y201.843 I5.887 J-2.047 E.01272
G1 X189.144 Y209.251 E.31234
G1 X188.61 Y209.251 E.01592
G1 X196.474 Y201.387 E.33157
G3 X196.453 Y200.874 I2.552 J-.361 E.01533
G1 X188.076 Y209.251 E.3532
G1 X187.543 Y209.251 E.01592
G1 X196.53 Y200.263 E.37896
G3 X196.8 Y199.46 I3.738 J.808 E.02533
G1 X187.009 Y209.251 E.41285
G1 X186.475 Y209.251 E.01592
G1 X208.251 Y187.475 E.91818
G1 X208.251 Y188.009 E.01592
G1 X198.452 Y197.807 E.41316
G3 X199.266 Y197.528 I1.27 J2.37 E.02576
G1 X208.251 Y188.543 E.37886
G1 X208.251 Y189.076 E.01592
G1 X199.869 Y197.458 E.35342
G3 X200.387 Y197.474 I.198 J2.057 E.0155
G1 X208.251 Y189.61 E.33156
G1 X208.251 Y190.144 E.01592
G1 X200.841 Y197.553 E.31243
G3 X201.25 Y197.678 I-.416 J2.102 E.01278
G1 X208.251 Y190.678 E.29517
G1 X208.251 Y191.212 E.01592
G1 X201.622 Y197.84 E.27951
G3 X201.957 Y198.038 I-.825 J1.781 E.01164
G1 X208.251 Y191.745 E.26535
G1 X208.251 Y192.279 E.01592
G1 X202.263 Y198.266 E.25246
G3 X202.541 Y198.523 I-1.144 J1.514 E.01128
G1 X208.251 Y192.813 E.24077
G1 X208.251 Y193.347 E.01592
G1 X202.789 Y198.808 E.23027
G3 X203.009 Y199.122 I-1.462 J1.258 E.01145
G1 X208.251 Y193.881 E.221
G1 X208.251 Y194.414 E.01592
G1 X203.199 Y199.466 E.21302
G3 X203.354 Y199.844 I-1.808 J.966 E.01221
G1 X208.251 Y194.948 E.20646
G1 X208.251 Y195.482 E.01592
G1 X203.472 Y200.26 E.20149
G3 X203.538 Y200.728 I-4.771 J.911 E.01409
G1 X208.251 Y196.016 E.19871
G1 X208.251 Y196.55 E.01592
G1 X203.539 Y201.262 E.19868
G3 X203.43 Y201.904 I-3.703 J-.294 E.01944
G1 X208.42 Y196.914 E.2104
G1 X208.42 Y46.917 F30000
G1 F9537.687
G1 X203.429 Y51.908 E.21046
G2 X203.538 Y51.265 I-3.613 J-.945 E.01947
G1 X208.251 Y46.553 E.19869
G1 X208.251 Y46.019 E.01592
G1 X203.538 Y50.732 E.1987
G2 X203.473 Y50.263 I-4.868 J.441 E.01411
G1 X208.251 Y45.486 E.20146
G1 X208.251 Y44.952 E.01592
G1 X203.355 Y49.847 E.20641
G2 X203.2 Y49.469 I-1.967 J.587 E.01221
G1 X208.251 Y44.418 E.21297
G1 X208.251 Y43.884 E.01592
G1 X203.011 Y49.124 E.22094
G2 X202.791 Y48.81 I-1.683 J.943 E.01145
G1 X208.251 Y43.35 E.2302
G1 X208.251 Y42.817 E.01592
G1 X202.542 Y48.525 E.24069
G2 X202.265 Y48.268 I-1.419 J1.254 E.01128
G1 X207.784 Y42.749 E.2327
G1 X207.25 Y42.749 E.01592
G1 X201.96 Y48.04 E.22308
G2 X201.624 Y47.842 I-1.157 J1.575 E.01164
G1 X206.716 Y42.749 E.21472
G1 X206.183 Y42.749 E.01592
G1 X201.253 Y47.679 E.20786
G2 X200.844 Y47.554 I-.827 J1.98 E.01277
G1 X205.649 Y42.749 E.2026
G1 X205.115 Y42.749 E.01592
G1 X200.39 Y47.474 E.19921
G2 X199.872 Y47.458 I-.321 J2.041 E.01549
G1 X204.581 Y42.749 E.19855
G1 X204.047 Y42.749 E.01592
G1 X199.27 Y47.527 E.20144
G2 X198.46 Y47.804 I.444 J2.625 E.02565
G1 X203.514 Y42.749 E.21311
G1 X202.98 Y42.749 E.01592
G1 X186.479 Y59.251 E.69578
G1 X187.013 Y59.251 E.01592
G1 X196.797 Y49.466 E.41258
G2 X196.529 Y50.268 I3.449 J1.599 E.02526
G1 X187.546 Y59.251 E.37877
G1 X188.08 Y59.251 E.01592
G1 X196.453 Y50.878 E.35304
G2 X196.474 Y51.39 I2.573 J.15 E.01532
G1 X188.614 Y59.251 E.33143
G1 X189.148 Y59.251 E.01592
G1 X196.552 Y51.846 E.31221
G2 X196.679 Y52.253 I6.084 J-1.67 E.01271
G1 X189.681 Y59.251 E.29505
G1 X190.215 Y59.251 E.01592
G1 X196.844 Y52.622 E.27951
G2 X197.042 Y52.958 I1.778 J-.819 E.01165
G1 X190.749 Y59.251 E.26533
G1 X191.283 Y59.251 E.01592
G1 X197.269 Y53.264 E.25242
G2 X197.526 Y53.542 I1.517 J-1.144 E.01128
G1 X191.749 Y59.318 E.24355
G1 X191.749 Y59.852 E.01592
G1 X197.81 Y53.791 E.25556
G2 X198.124 Y54.011 I1.258 J-1.457 E.01144
G1 X191.749 Y60.385 E.26878
G1 X191.749 Y60.919 E.01592
G1 X198.468 Y54.201 E.28329
G2 X198.845 Y54.357 I.97 J-1.803 E.0122
G1 X191.749 Y61.453 E.29919
G1 X191.749 Y61.987 E.01592
G1 X199.264 Y54.472 E.31686
G2 X199.733 Y54.537 I.56 J-2.314 E.01414
G1 X191.749 Y62.52 E.33663
G1 X191.749 Y63.054 E.01592
G1 X200.262 Y54.542 E.35894
G2 X200.906 Y54.432 I-.531 J-5.046 E.01949
G1 X191.749 Y63.588 E.38609
G1 X191.749 Y64.122 E.01592
G1 X208.251 Y47.621 E.69578
G1 X208.251 Y48.155 E.01592
G1 X191.749 Y64.656 E.69578
G1 X191.749 Y65.189 E.01592
G1 X208.251 Y48.688 E.69578
G1 X208.251 Y49.222 E.01592
G1 X191.749 Y65.723 E.69578
G1 X191.749 Y66.257 E.01592
G1 X208.251 Y49.756 E.69578
G1 X208.251 Y50.29 E.01592
G1 X191.749 Y66.791 E.69578
G1 X191.749 Y67.325 E.01592
G1 X208.251 Y50.824 E.69578
G1 X208.251 Y51.357 E.01592
G1 X191.749 Y67.858 E.69578
G1 X191.749 Y68.392 E.01592
G1 X208.251 Y51.891 E.69578
G1 X208.251 Y52.425 E.01592
G1 X191.749 Y68.926 E.69578
G1 X191.749 Y69.46 E.01592
G1 X208.251 Y52.959 E.69578
G1 X208.251 Y53.493 E.01592
G1 X191.749 Y69.994 E.69578
G1 X191.749 Y70.527 E.01592
G1 X208.251 Y54.026 E.69578
G1 X208.251 Y54.56 E.01592
G1 X191.749 Y71.061 E.69578
G1 X191.749 Y71.595 E.01592
G1 X208.251 Y55.094 E.69578
G1 X208.251 Y55.628 E.01592
G1 X191.749 Y72.129 E.69578
G1 X191.749 Y72.663 E.01592
G1 X208.251 Y56.162 E.69578
G1 X208.251 Y56.695 E.01592
G1 X191.749 Y73.196 E.69578
G1 X191.749 Y73.73 E.01592
G1 X208.251 Y57.229 E.69578
G1 X208.251 Y57.763 E.01592
G1 X191.749 Y74.264 E.69578
G1 X191.749 Y74.798 E.01592
G1 X208.251 Y58.297 E.69578
G1 X208.251 Y58.83 E.01592
G1 X191.749 Y75.332 E.69578
G1 X191.749 Y75.865 E.01592
G1 X208.251 Y59.364 E.69578
G1 X208.251 Y59.898 E.01592
G1 X191.749 Y76.399 E.69578
G1 X191.749 Y76.933 E.01592
G1 X208.251 Y60.432 E.69578
G1 X208.251 Y60.966 E.01592
G1 X191.749 Y77.467 E.69578
G1 X191.749 Y78.001 E.01592
G1 X208.251 Y61.499 E.69578
G1 X208.251 Y62.033 E.01592
G1 X191.749 Y78.534 E.69578
G1 X191.749 Y79.068 E.01592
G1 X208.251 Y62.567 E.69578
G1 X208.251 Y63.101 E.01592
G1 X191.749 Y79.602 E.69578
G1 X191.749 Y80.136 E.01592
G1 X208.251 Y63.635 E.69578
G1 X208.251 Y64.168 E.01592
G1 X191.749 Y80.67 E.69578
G1 X191.749 Y81.203 E.01592
G1 X208.251 Y64.702 E.69578
G1 X208.251 Y65.236 E.01592
G1 X191.749 Y81.737 E.69578
G1 X191.749 Y82.271 E.01592
G1 X208.251 Y65.77 E.69578
G1 X208.251 Y66.304 E.01592
G1 X191.749 Y82.805 E.69578
G1 X191.749 Y83.338 E.01592
G1 X208.251 Y66.837 E.69578
G1 X208.251 Y67.371 E.01592
G1 X191.749 Y83.872 E.69578
G1 X191.749 Y84.406 E.01592
G1 X208.251 Y67.905 E.69578
G1 X208.251 Y68.439 E.01592
G1 X191.749 Y84.94 E.69578
G1 X191.749 Y85.474 E.01592
G1 X208.251 Y68.973 E.69578
G1 X208.251 Y69.506 E.01592
G1 X191.749 Y86.007 E.69578
G1 X191.749 Y86.541 E.01592
G1 X208.251 Y70.04 E.69578
G1 X208.251 Y70.574 E.01592
G1 X191.749 Y87.075 E.69578
G1 X191.749 Y87.609 E.01592
G1 X208.251 Y71.108 E.69578
G1 X208.251 Y71.642 E.01592
G1 X191.749 Y88.143 E.69578
G1 X191.749 Y88.676 E.01592
G1 X208.251 Y72.175 E.69578
G1 X208.251 Y72.709 E.01592
G1 X191.749 Y89.21 E.69578
G1 X191.749 Y89.744 E.01592
G1 X208.251 Y73.243 E.69578
G1 X208.251 Y73.777 E.01592
G1 X191.749 Y90.278 E.69578
G1 X191.749 Y90.812 E.01592
G1 X208.251 Y74.311 E.69578
G1 X208.251 Y74.844 E.01592
G1 X191.749 Y91.345 E.69578
G1 X191.749 Y91.879 E.01592
G1 X208.251 Y75.378 E.69578
G1 X208.251 Y75.912 E.01592
G1 X191.749 Y92.413 E.69578
G1 X191.749 Y92.947 E.01592
G1 X208.251 Y76.446 E.69578
G1 X208.251 Y76.98 E.01592
G1 X191.749 Y93.481 E.69578
G1 X191.749 Y94.014 E.01592
G1 X208.251 Y77.513 E.69578
G1 X208.251 Y78.047 E.01592
G1 X191.749 Y94.548 E.69578
G1 X191.749 Y95.082 E.01592
G1 X208.251 Y78.581 E.69578
G1 X208.251 Y79.115 E.01592
G1 X191.749 Y95.616 E.69578
G1 X191.749 Y96.15 E.01592
G1 X208.251 Y79.648 E.69578
G1 X208.251 Y80.182 E.01592
G1 X191.749 Y96.683 E.69578
G1 X191.749 Y97.217 E.01592
G1 X208.251 Y80.716 E.69578
G1 X208.251 Y81.25 E.01592
G1 X191.749 Y97.751 E.69578
G1 X191.749 Y98.285 E.01592
G1 X208.251 Y81.784 E.69578
G1 X208.251 Y82.317 E.01592
G1 X191.749 Y98.819 E.69578
G1 X191.749 Y99.352 E.01592
G1 X208.251 Y82.851 E.69578
G1 X208.251 Y83.385 E.01592
G1 X191.749 Y99.886 E.69578
G1 X191.749 Y100.42 E.01592
G1 X208.251 Y83.919 E.69578
G1 X208.251 Y84.453 E.01592
G1 X191.749 Y100.954 E.69578
G1 X191.749 Y101.488 E.01592
G1 X208.251 Y84.986 E.69578
G1 X208.251 Y85.52 E.01592
G1 X191.749 Y102.021 E.69578
G1 X191.749 Y102.555 E.01592
G1 X208.251 Y86.054 E.69578
G1 X208.251 Y86.588 E.01592
G1 X191.749 Y103.089 E.69578
G1 X191.749 Y103.623 E.01592
G1 X208.251 Y87.122 E.69578
G1 X208.251 Y87.655 E.01592
G1 X191.749 Y104.156 E.69578
G1 X191.749 Y104.69 E.01592
G1 X208.251 Y88.189 E.69578
G1 X208.251 Y88.723 E.01592
G1 X191.749 Y105.224 E.69578
G1 X191.749 Y105.758 E.01592
G1 X208.251 Y89.257 E.69578
G1 X208.251 Y89.791 E.01592
G1 X191.749 Y106.292 E.69578
G1 X191.749 Y106.825 E.01592
G1 X208.251 Y90.324 E.69578
G1 X208.251 Y90.858 E.01592
G1 X191.749 Y107.359 E.69578
G1 X191.749 Y107.893 E.01592
G1 X208.251 Y91.392 E.69578
G1 X208.251 Y91.926 E.01592
G1 X191.749 Y108.427 E.69578
G1 X191.749 Y108.961 E.01592
G1 X208.251 Y92.46 E.69578
G1 X208.251 Y92.993 E.01592
G1 X191.749 Y109.494 E.69578
G1 X191.749 Y110.028 E.01592
G1 X208.251 Y93.527 E.69578
G1 X208.251 Y94.061 E.01592
G1 X191.749 Y110.562 E.69578
G1 X191.749 Y111.096 E.01592
G1 X208.251 Y94.595 E.69578
G1 X208.251 Y95.129 E.01592
G1 X191.749 Y111.63 E.69578
G1 X191.749 Y112.163 E.01592
G1 X208.251 Y95.662 E.69578
G1 X208.251 Y96.196 E.01592
G1 X191.749 Y112.697 E.69578
G1 X191.749 Y113.231 E.01592
G1 X208.251 Y96.73 E.69578
G1 X208.251 Y97.264 E.01592
G1 X191.749 Y113.765 E.69578
G1 X191.749 Y114.299 E.01592
G1 X208.251 Y97.798 E.69578
G1 X208.251 Y98.331 E.01592
G1 X191.749 Y114.832 E.69578
G1 X191.749 Y115.366 E.01592
G1 X208.251 Y98.865 E.69578
G1 X208.251 Y99.399 E.01592
G1 X191.749 Y115.9 E.69578
G1 X191.749 Y116.434 E.01592
G1 X208.251 Y99.933 E.69578
G1 X208.251 Y100.466 E.01592
G1 X191.749 Y116.968 E.69578
G1 X191.749 Y117.501 E.01592
G1 X208.251 Y101 E.69578
G1 X208.251 Y101.534 E.01592
G1 X191.749 Y118.035 E.69578
G1 X191.749 Y118.569 E.01592
G1 X208.251 Y102.068 E.69578
G1 X208.251 Y102.602 E.01592
G1 X191.749 Y119.103 E.69578
G1 X191.749 Y119.637 E.01592
G1 X208.251 Y103.135 E.69578
G1 X208.251 Y103.669 E.01592
G1 X191.749 Y120.17 E.69578
G1 X191.749 Y120.704 E.01592
G1 X208.251 Y104.203 E.69578
G1 X208.251 Y104.737 E.01592
G1 X191.749 Y121.238 E.69578
G1 X191.749 Y121.772 E.01592
G1 X208.251 Y105.271 E.69578
G1 X208.251 Y105.804 E.01592
G1 X191.749 Y122.306 E.69578
G1 X191.749 Y122.839 E.01592
G1 X208.251 Y106.338 E.69578
G1 X208.251 Y106.872 E.01592
G1 X191.749 Y123.373 E.69578
G1 X191.749 Y123.907 E.01592
G1 X208.251 Y107.406 E.69578
G1 X208.251 Y107.94 E.01592
G1 X191.749 Y124.441 E.69578
G1 X191.749 Y124.974 E.01592
G1 X208.251 Y108.473 E.69578
G1 X208.251 Y109.007 E.01592
G1 X191.749 Y125.508 E.69578
G1 X191.749 Y126.042 E.01592
G1 X208.251 Y109.541 E.69578
G1 X208.251 Y110.075 E.01592
G1 X191.749 Y126.576 E.69578
G1 X191.749 Y127.11 E.01592
G1 X208.251 Y110.609 E.69578
G1 X208.251 Y111.142 E.01592
G1 X191.749 Y127.643 E.69578
G1 X191.749 Y128.177 E.01592
G1 X208.251 Y111.676 E.69578
G1 X208.251 Y112.21 E.01592
G1 X191.58 Y128.881 E.70294
G1 X191.58 Y139.023 F30000
G1 F9537.687
G1 X201.296 Y129.307 E.40969
G3 X200.565 Y129.504 I-1.47 J-3.991 E.02262
G1 X191.749 Y138.319 E.3717
G1 X191.749 Y137.786 E.01592
G1 X199.986 Y129.549 E.34731
G3 X199.489 Y129.512 I.07 J-4.311 E.01487
G1 X191.749 Y137.252 E.32636
G1 X191.749 Y136.718 E.01592
G1 X199.05 Y129.418 E.30783
G3 X198.652 Y129.282 I.481 J-2.058 E.01256
G1 X191.749 Y136.184 E.29105
G1 X191.749 Y135.65 E.01592
G1 X198.29 Y129.11 E.2758
G3 X197.961 Y128.906 I.855 J-1.749 E.01158
G1 X191.749 Y135.117 E.2619
G1 X191.749 Y134.583 E.01592
G1 X197.661 Y128.672 E.24925
G3 X197.39 Y128.408 I10.557 J-11.118 E.01126
G1 X191.749 Y134.049 E.23785
G1 X191.749 Y133.515 E.01592
G1 X197.149 Y128.116 E.22768
G3 X196.938 Y127.793 I1.504 J-1.219 E.01151
G1 X191.749 Y132.981 E.21876
G1 X191.749 Y132.448 E.01592
G1 X196.757 Y127.44 E.21116
G3 X196.612 Y127.051 I1.872 J-.921 E.01239
G1 X191.749 Y131.914 E.20504
G1 X191.749 Y131.38 E.01592
G1 X196.507 Y126.623 E.2006
G3 X196.453 Y126.143 I4.669 J-.769 E.0144
G1 X191.749 Y130.846 E.19832
G1 X191.749 Y130.312 E.01592
G1 X196.477 Y125.585 E.19932
G3 X196.627 Y124.901 I3.628 J.438 E.02091
G1 X191.749 Y129.779 E.20565
G1 X191.749 Y129.245 E.01592
G1 X208.251 Y112.744 E.69578
G1 X208.251 Y113.278 E.01592
G1 X198.905 Y122.623 E.39407
G3 X199.588 Y122.474 I1.295 J4.282 E.02088
G1 X208.251 Y113.811 E.36526
G1 X208.251 Y114.345 E.01592
G1 X200.138 Y122.458 E.34208
G3 X200.625 Y122.504 I-.171 J4.383 E.01461
G1 X208.251 Y114.879 E.32153
G1 X208.251 Y115.413 E.01592
G1 X201.052 Y122.611 E.30354
G3 X201.439 Y122.758 I-.539 J2.01 E.01237
G1 X208.251 Y115.947 E.2872
G1 X208.251 Y116.48 E.01592
G1 X201.792 Y122.939 E.27232
G3 X202.114 Y123.151 I-.9 J1.715 E.01151
G1 X208.251 Y117.014 E.25876
G1 X208.251 Y117.548 E.01592
G1 X202.406 Y123.392 E.24644
G3 X202.67 Y123.662 I-1.218 J1.454 E.01127
G1 X208.251 Y118.082 E.23531
G1 X208.251 Y118.616 E.01592
G1 X202.905 Y123.961 E.22539
G3 X203.111 Y124.289 I-1.534 J1.193 E.01156
G1 X208.251 Y119.149 E.2167
G1 X208.251 Y119.683 E.01592
G1 X203.284 Y124.65 E.20944
G3 X203.418 Y125.049 I-1.931 J.874 E.01258
G1 X208.251 Y120.217 E.20376
G1 X208.251 Y120.751 E.01592
G1 X203.511 Y125.491 E.19987
G3 X203.551 Y125.984 I-2.456 J.449 E.01479
G1 X208.251 Y121.284 E.19817
G1 X208.251 Y121.818 E.01592
G1 X203.502 Y126.567 E.20023
G3 X203.301 Y127.301 I-3.617 J-.593 E.02274
G1 X208.251 Y122.352 E.20869
G1 X208.251 Y122.886 E.01592
G1 X191.749 Y139.387 E.69578
G1 X191.749 Y139.921 E.01592
G1 X208.251 Y123.42 E.69578
G1 X208.251 Y123.953 E.01592
G1 X191.749 Y140.455 E.69578
G1 X191.749 Y140.988 E.01592
G1 X208.251 Y124.487 E.69578
G1 X208.251 Y125.021 E.01592
G1 X191.749 Y141.522 E.69578
G1 X191.749 Y142.056 E.01592
G1 X208.251 Y125.555 E.69578
G1 X208.251 Y126.089 E.01592
G1 X191.749 Y142.59 E.69578
G1 X191.749 Y143.124 E.01592
G1 X208.251 Y126.622 E.69578
G1 X208.251 Y127.156 E.01592
G1 X191.749 Y143.657 E.69578
G1 X191.749 Y144.191 E.01592
G1 X208.251 Y127.69 E.69578
G1 X208.251 Y128.224 E.01592
G1 X191.749 Y144.725 E.69578
G1 X191.749 Y145.259 E.01592
G1 X208.251 Y128.758 E.69578
G1 X208.251 Y129.291 E.01592
G1 X191.749 Y145.792 E.69578
G1 X191.749 Y146.326 E.01592
G1 X208.251 Y129.825 E.69578
G1 X208.251 Y130.359 E.01592
G1 X191.749 Y146.86 E.69578
G1 X191.749 Y147.394 E.01592
G1 X208.251 Y130.893 E.69578
G1 X208.251 Y131.427 E.01592
G1 X191.749 Y147.928 E.69578
G1 X191.749 Y148.461 E.01592
G1 X208.251 Y131.96 E.69578
G1 X208.251 Y132.494 E.01592
G1 X191.749 Y148.995 E.69578
G1 X191.749 Y149.529 E.01592
G1 X208.251 Y133.028 E.69578
G1 X208.251 Y133.562 E.01592
G1 X191.749 Y150.063 E.69578
G1 X191.749 Y150.597 E.01592
G1 X208.251 Y134.096 E.69578
G1 X208.251 Y134.629 E.01592
G1 X191.749 Y151.13 E.69578
G1 X191.749 Y151.664 E.01592
G1 X208.251 Y135.163 E.69578
G1 X208.251 Y135.697 E.01592
G1 X191.749 Y152.198 E.69578
G1 X191.749 Y152.732 E.01592
G1 X208.251 Y136.231 E.69578
G1 X208.251 Y136.765 E.01592
G1 X191.749 Y153.266 E.69578
G1 X191.749 Y153.799 E.01592
G1 X208.251 Y137.298 E.69578
G1 X208.251 Y137.832 E.01592
G1 X191.749 Y154.333 E.69578
G1 X191.749 Y154.867 E.01592
G1 X208.251 Y138.366 E.69578
G1 X208.251 Y138.9 E.01592
G1 X191.749 Y155.401 E.69578
G1 X191.749 Y155.935 E.01592
G1 X208.251 Y139.434 E.69578
G1 X208.251 Y139.967 E.01592
G1 X191.749 Y156.468 E.69578
G1 X191.749 Y157.002 E.01592
G1 X208.251 Y140.501 E.69578
G1 X208.251 Y141.035 E.01592
G1 X191.749 Y157.536 E.69578
G1 X191.749 Y158.07 E.01592
G1 X208.251 Y141.569 E.69578
G1 X208.251 Y142.102 E.01592
G1 X191.749 Y158.604 E.69578
G1 X191.749 Y159.137 E.01592
G1 X208.251 Y142.636 E.69578
G1 X208.251 Y143.17 E.01592
G1 X191.749 Y159.671 E.69578
G1 X191.749 Y160.205 E.01592
G1 X208.251 Y143.704 E.69578
G1 X208.251 Y144.238 E.01592
G1 X191.749 Y160.739 E.69578
G1 X191.749 Y161.273 E.01592
G1 X208.251 Y144.771 E.69578
G1 X208.251 Y145.305 E.01592
G1 X191.749 Y161.806 E.69578
G1 X191.749 Y162.34 E.01592
G1 X208.251 Y145.839 E.69578
G1 X208.251 Y146.373 E.01592
G1 X191.749 Y162.874 E.69578
G1 X191.749 Y163.408 E.01592
G1 X208.251 Y146.907 E.69578
G1 X208.251 Y147.44 E.01592
G1 X191.749 Y163.942 E.69578
G1 X191.749 Y164.475 E.01592
G1 X208.251 Y147.974 E.69578
G1 X208.251 Y148.508 E.01592
G1 X191.749 Y165.009 E.69578
G1 X191.749 Y165.543 E.01592
G1 X208.251 Y149.042 E.69578
G1 X208.251 Y149.576 E.01592
G1 X191.749 Y166.077 E.69578
G1 X191.749 Y166.61 E.01592
G1 X208.251 Y150.109 E.69578
G1 X208.251 Y150.643 E.01592
G1 X191.749 Y167.144 E.69578
G1 X191.749 Y167.678 E.01592
G1 X208.251 Y151.177 E.69578
G1 X208.251 Y151.711 E.01592
G1 X191.749 Y168.212 E.69578
G1 X191.749 Y168.746 E.01592
G1 X208.251 Y152.245 E.69578
G1 X208.251 Y152.778 E.01592
G1 X191.749 Y169.279 E.69578
G1 X191.749 Y169.813 E.01592
G1 X208.251 Y153.312 E.69578
G1 X208.251 Y153.846 E.01592
G1 X191.749 Y170.347 E.69578
G1 X191.749 Y170.881 E.01592
G1 X208.251 Y154.38 E.69578
G1 X208.251 Y154.914 E.01592
G1 X191.749 Y171.415 E.69578
G1 X191.749 Y171.948 E.01592
G1 X208.251 Y155.447 E.69578
G1 X208.251 Y155.981 E.01592
G1 X191.749 Y172.482 E.69578
G1 X191.749 Y173.016 E.01592
G1 X208.251 Y156.515 E.69578
G1 X208.251 Y157.049 E.01592
G1 X191.749 Y173.55 E.69578
G1 X191.749 Y174.084 E.01592
G1 X208.251 Y157.583 E.69578
G1 X208.251 Y158.116 E.01592
G1 X191.749 Y174.617 E.69578
G1 X191.749 Y175.151 E.01592
G1 X208.251 Y158.65 E.69578
M73 P65 R24
G1 X208.251 Y159.184 E.01592
G1 X191.749 Y175.685 E.69578
G1 X191.749 Y176.219 E.01592
G1 X208.251 Y159.718 E.69578
G1 X208.251 Y160.252 E.01592
G1 X191.749 Y176.753 E.69578
G1 X191.749 Y177.286 E.01592
G1 X208.251 Y160.785 E.69578
G1 X208.251 Y161.319 E.01592
G1 X191.749 Y177.82 E.69578
G1 X191.749 Y178.354 E.01592
G1 X208.251 Y161.853 E.69578
G1 X208.251 Y162.387 E.01592
G1 X191.749 Y178.888 E.69578
G1 X191.749 Y179.422 E.01592
G1 X208.251 Y162.92 E.69578
G1 X208.251 Y163.454 E.01592
G1 X191.749 Y179.955 E.69578
G1 X191.749 Y180.489 E.01592
G1 X208.251 Y163.988 E.69578
G1 X208.251 Y164.522 E.01592
G1 X191.749 Y181.023 E.69578
G1 X191.749 Y181.557 E.01592
G1 X208.251 Y165.056 E.69578
G1 X208.251 Y165.589 E.01592
G1 X191.749 Y182.091 E.69578
G1 X191.749 Y182.624 E.01592
G1 X208.251 Y166.123 E.69578
G1 X208.251 Y166.657 E.01592
G1 X191.749 Y183.158 E.69578
G1 X191.749 Y183.692 E.01592
G1 X208.251 Y167.191 E.69578
M73 P65 R23
G1 X208.251 Y167.725 E.01592
G1 X191.749 Y184.226 E.69578
G1 X191.749 Y184.759 E.01592
G1 X208.251 Y168.258 E.69578
G1 X208.251 Y168.792 E.01592
G1 X191.749 Y185.293 E.69578
G1 X191.749 Y185.827 E.01592
G1 X208.251 Y169.326 E.69578
G1 X208.251 Y169.86 E.01592
G1 X191.749 Y186.361 E.69578
G1 X191.749 Y186.895 E.01592
G1 X208.251 Y170.394 E.69578
G1 X208.251 Y170.927 E.01592
G1 X191.749 Y187.428 E.69578
G1 X191.749 Y187.962 E.01592
G1 X208.251 Y171.461 E.69578
G1 X208.251 Y171.995 E.01592
G1 X191.749 Y188.496 E.69578
G1 X191.749 Y189.03 E.01592
G1 X208.251 Y172.529 E.69578
G1 X208.251 Y173.063 E.01592
G1 X191.749 Y189.564 E.69578
G1 X191.749 Y190.097 E.01592
G1 X208.251 Y173.596 E.69578
G1 X208.251 Y174.13 E.01592
G1 X191.749 Y190.631 E.69578
G1 X191.749 Y191.165 E.01592
G1 X208.251 Y174.664 E.69578
G1 X208.251 Y175.198 E.01592
G1 X191.749 Y191.699 E.69578
G1 X191.749 Y192.233 E.01592
G1 X208.251 Y175.732 E.69578
G1 X208.251 Y176.265 E.01592
G1 X175.265 Y209.251 E1.39085
G1 X175.799 Y209.251 E.01592
G1 X208.251 Y176.799 E1.36834
G1 X208.251 Y177.333 E.01592
G1 X176.333 Y209.251 E1.34584
G1 X176.867 Y209.251 E.01592
G1 X208.251 Y177.867 E1.32333
G1 X208.251 Y178.401 E.01592
G1 X177.401 Y209.251 E1.30082
G1 X177.934 Y209.251 E.01592
G1 X208.251 Y178.934 E1.27831
G1 X208.251 Y179.468 E.01592
G1 X178.468 Y209.251 E1.2558
G1 X179.002 Y209.251 E.01592
G1 X208.251 Y180.002 E1.2333
G1 X208.251 Y180.536 E.01592
G1 X179.536 Y209.251 E1.21079
G1 X180.07 Y209.251 E.01592
G1 X208.251 Y181.07 E1.18828
G1 X208.251 Y181.603 E.01592
G1 X180.603 Y209.251 E1.16577
G1 X181.137 Y209.251 E.01592
G1 X208.251 Y182.137 E1.14326
G1 X208.251 Y182.671 E.01592
G1 X181.671 Y209.251 E1.12076
G1 X182.205 Y209.251 E.01592
G1 X208.251 Y183.205 E1.09825
G1 X208.251 Y183.738 E.01592
G1 X182.738 Y209.251 E1.07574
G1 X183.272 Y209.251 E.01592
G1 X208.251 Y184.272 E1.05323
G1 X208.251 Y184.806 E.01592
G1 X183.806 Y209.251 E1.03072
G1 X184.34 Y209.251 E.01592
G1 X208.251 Y185.34 E1.00822
G1 X208.251 Y185.874 E.01592
G1 X184.874 Y209.251 E.98571
G1 X185.407 Y209.251 E.01592
G1 X208.251 Y186.407 E.9632
G1 X208.251 Y186.941 E.01592
G1 X185.772 Y209.42 E.94785
G1 X174.562 Y209.42 F30000
G1 F9537.687
G1 X191.233 Y192.749 E.70294
G1 X190.699 Y192.749 E.01592
G1 X174.198 Y209.251 E.69578
G1 X173.664 Y209.251 E.01592
G1 X190.165 Y192.749 E.69578
G1 X189.631 Y192.749 E.01592
G1 X173.13 Y209.251 E.69578
G1 X172.596 Y209.251 E.01592
G1 X189.097 Y192.749 E.69578
G1 X188.564 Y192.749 E.01592
G1 X172.063 Y209.251 E.69578
G1 X171.529 Y209.251 E.01592
G1 X188.03 Y192.749 E.69578
G1 X187.496 Y192.749 E.01592
G1 X170.995 Y209.251 E.69578
G1 X170.461 Y209.251 E.01592
G1 X186.962 Y192.749 E.69578
G1 X186.428 Y192.749 E.01592
G1 X169.927 Y209.251 E.69578
G1 X169.394 Y209.251 E.01592
G1 X185.895 Y192.749 E.69578
G1 X185.361 Y192.749 E.01592
G1 X168.86 Y209.251 E.69578
G1 X168.326 Y209.251 E.01592
G1 X184.827 Y192.749 E.69578
G1 X184.293 Y192.749 E.01592
G1 X167.792 Y209.251 E.69578
G1 X167.258 Y209.251 E.01592
G1 X183.76 Y192.749 E.69578
G1 X183.226 Y192.749 E.01592
G1 X166.725 Y209.251 E.69578
G1 X166.191 Y209.251 E.01592
G1 X182.692 Y192.749 E.69578
G1 X182.158 Y192.749 E.01592
G1 X165.657 Y209.251 E.69578
G1 X165.123 Y209.251 E.01592
G1 X181.624 Y192.749 E.69578
G1 X181.091 Y192.749 E.01592
G1 X164.589 Y209.251 E.69578
G1 X164.056 Y209.251 E.01592
G1 X180.557 Y192.749 E.69578
G1 X180.023 Y192.749 E.01592
G1 X163.522 Y209.251 E.69578
G1 X162.988 Y209.251 E.01592
G1 X179.489 Y192.749 E.69578
G1 X178.955 Y192.749 E.01592
G1 X162.454 Y209.251 E.69578
G1 X161.92 Y209.251 E.01592
G1 X178.422 Y192.749 E.69578
G1 X177.888 Y192.749 E.01592
G1 X161.387 Y209.251 E.69578
G1 X160.853 Y209.251 E.01592
G1 X177.354 Y192.749 E.69578
G1 X176.82 Y192.749 E.01592
G1 X160.319 Y209.251 E.69578
G1 X159.785 Y209.251 E.01592
G1 X176.286 Y192.749 E.69578
G1 X175.753 Y192.749 E.01592
G1 X159.252 Y209.251 E.69578
G1 X158.718 Y209.251 E.01592
G1 X175.219 Y192.749 E.69578
G1 X174.685 Y192.749 E.01592
G1 X158.184 Y209.251 E.69578
G1 X157.65 Y209.251 E.01592
G1 X174.151 Y192.749 E.69578
G1 X173.617 Y192.749 E.01592
G1 X157.116 Y209.251 E.69578
G1 X156.583 Y209.251 E.01592
G1 X173.084 Y192.749 E.69578
G1 X172.55 Y192.749 E.01592
G1 X156.049 Y209.251 E.69578
G1 X155.515 Y209.251 E.01592
G1 X172.016 Y192.749 E.69578
G1 X171.482 Y192.749 E.01592
G1 X154.981 Y209.251 E.69578
G1 X154.447 Y209.251 E.01592
G1 X170.948 Y192.749 E.69578
G1 X170.415 Y192.749 E.01592
G1 X153.914 Y209.251 E.69578
G1 X153.38 Y209.251 E.01592
G1 X169.881 Y192.749 E.69578
G1 X169.347 Y192.749 E.01592
G1 X152.846 Y209.251 E.69578
G1 X152.312 Y209.251 E.01592
G1 X168.813 Y192.749 E.69578
G1 X168.279 Y192.749 E.01592
G1 X151.778 Y209.251 E.69578
G1 X151.245 Y209.251 E.01592
G1 X167.746 Y192.749 E.69578
G1 X167.212 Y192.749 E.01592
G1 X150.711 Y209.251 E.69578
G1 X150.177 Y209.251 E.01592
G1 X166.678 Y192.749 E.69578
G1 X166.144 Y192.749 E.01592
G1 X149.643 Y209.251 E.69578
G1 X149.109 Y209.251 E.01592
G1 X165.61 Y192.749 E.69578
G1 X165.077 Y192.749 E.01592
G1 X148.576 Y209.251 E.69578
G1 X148.042 Y209.251 E.01592
G1 X164.543 Y192.749 E.69578
G1 X164.009 Y192.749 E.01592
G1 X147.508 Y209.251 E.69578
G1 X146.974 Y209.251 E.01592
G1 X163.475 Y192.749 E.69578
G1 X162.942 Y192.749 E.01592
G1 X146.44 Y209.251 E.69578
G1 X145.907 Y209.251 E.01592
G1 X162.408 Y192.749 E.69578
G1 X161.874 Y192.749 E.01592
G1 X145.373 Y209.251 E.69578
G1 X144.839 Y209.251 E.01592
G1 X161.34 Y192.749 E.69578
G1 X160.806 Y192.749 E.01592
G1 X144.305 Y209.251 E.69578
G1 X143.771 Y209.251 E.01592
G1 X160.273 Y192.749 E.69578
G1 X159.739 Y192.749 E.01592
G1 X143.238 Y209.251 E.69578
G1 X142.704 Y209.251 E.01592
G1 X159.205 Y192.749 E.69578
G1 X158.671 Y192.749 E.01592
G1 X142.17 Y209.251 E.69578
G1 X141.636 Y209.251 E.01592
G1 X158.137 Y192.749 E.69578
G1 X157.604 Y192.749 E.01592
G1 X141.102 Y209.251 E.69578
G1 X140.569 Y209.251 E.01592
G1 X157.07 Y192.749 E.69578
G1 X156.536 Y192.749 E.01592
G1 X140.035 Y209.251 E.69578
G1 X139.501 Y209.251 E.01592
G1 X156.002 Y192.749 E.69578
G1 X155.468 Y192.749 E.01592
G1 X138.967 Y209.251 E.69578
G1 X138.434 Y209.251 E.01592
G1 X154.935 Y192.749 E.69578
G1 X154.401 Y192.749 E.01592
G1 X137.9 Y209.251 E.69578
G1 X137.366 Y209.251 E.01592
G1 X153.867 Y192.749 E.69578
G1 X153.333 Y192.749 E.01592
G1 X136.832 Y209.251 E.69578
G1 X136.298 Y209.251 E.01592
G1 X152.799 Y192.749 E.69578
G1 X152.266 Y192.749 E.01592
G1 X135.765 Y209.251 E.69578
G1 X135.231 Y209.251 E.01592
G1 X151.732 Y192.749 E.69578
G1 X151.198 Y192.749 E.01592
G1 X134.697 Y209.251 E.69578
G1 X134.163 Y209.251 E.01592
G1 X150.664 Y192.749 E.69578
G1 X150.13 Y192.749 E.01592
G1 X133.629 Y209.251 E.69578
G1 X133.096 Y209.251 E.01592
G1 X149.597 Y192.749 E.69578
G1 X149.063 Y192.749 E.01592
G1 X132.562 Y209.251 E.69578
G1 X132.028 Y209.251 E.01592
G1 X148.529 Y192.749 E.69578
G1 X147.995 Y192.749 E.01592
G1 X131.494 Y209.251 E.69578
G1 X130.96 Y209.251 E.01592
G1 X147.461 Y192.749 E.69578
G1 X146.928 Y192.749 E.01592
G1 X130.427 Y209.251 E.69578
G1 X129.893 Y209.251 E.01592
G1 X146.394 Y192.749 E.69578
G1 X145.86 Y192.749 E.01592
G1 X129.359 Y209.251 E.69578
G1 X128.825 Y209.251 E.01592
G1 X145.326 Y192.749 E.69578
G1 X144.792 Y192.749 E.01592
G1 X128.291 Y209.251 E.69578
G1 X127.758 Y209.251 E.01592
G1 X144.259 Y192.749 E.69578
G1 X143.725 Y192.749 E.01592
G1 X127.224 Y209.251 E.69578
G1 X126.69 Y209.251 E.01592
G1 X143.191 Y192.749 E.69578
G1 X142.657 Y192.749 E.01592
G1 X126.156 Y209.251 E.69578
G1 X125.622 Y209.251 E.01592
G1 X142.124 Y192.749 E.69578
G1 X141.59 Y192.749 E.01592
G1 X125.089 Y209.251 E.69578
G1 X124.555 Y209.251 E.01592
G1 X141.056 Y192.749 E.69578
G1 X140.522 Y192.749 E.01592
G1 X131.452 Y201.82 E.38246
G2 X131.542 Y201.196 I-3.524 J-.828 E.01882
G1 X139.988 Y192.749 E.35615
G1 X139.455 Y192.749 E.01592
G1 X131.535 Y200.669 E.33393
G2 X131.459 Y200.211 I-5.192 J.622 E.01385
G1 X138.921 Y192.749 E.31461
G1 X138.387 Y192.749 E.01592
G1 X131.338 Y199.799 E.29724
G2 X131.178 Y199.424 I-1.947 J.607 E.01215
G1 X137.853 Y192.749 E.28145
G1 X137.319 Y192.749 E.01592
G1 X130.986 Y199.083 E.26706
G2 X130.763 Y198.772 I-1.664 J.959 E.01142
G1 X136.786 Y192.749 E.25396
G1 X136.252 Y192.749 E.01592
G1 X130.511 Y198.491 E.24208
G2 X130.23 Y198.237 I-1.406 J1.274 E.01129
G1 X135.718 Y192.749 E.2314
G1 X135.184 Y192.749 E.01592
G1 X129.921 Y198.013 E.22194
G2 X129.579 Y197.821 I-1.131 J1.612 E.01171
G1 X134.65 Y192.749 E.21384
G1 X134.117 Y192.749 E.01592
G1 X129.204 Y197.662 E.20716
G2 X128.79 Y197.542 I-.81 J2.01 E.01286
G1 X133.583 Y192.749 E.20208
G1 X133.049 Y192.749 E.01592
G1 X128.332 Y197.467 E.1989
G1 X127.806 Y197.458 E.01567
G1 X132.515 Y192.749 E.19855
G1 X131.981 Y192.749 E.01592
G1 X126.942 Y197.789 E.2125
; WIPE_START
G1 X128.356 Y196.375 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.793 Y199.938 Z2.8 F30000
G1 Z2.4
G1 E.8 F1800
G1 F9537.687
G1 X115.48 Y209.251 E.39268
G1 X116.014 Y209.251 E.01592
G1 X124.454 Y200.811 E.35588
G2 X124.468 Y201.33 I4.917 J.127 E.01551
G1 X116.548 Y209.251 E.33396
G1 X117.082 Y209.251 E.01592
G1 X124.541 Y201.791 E.31453
G2 X124.66 Y202.206 I2.131 J-.387 E.01289
G1 X117.615 Y209.251 E.29704
G1 X118.149 Y209.251 E.01592
G1 X124.821 Y202.579 E.28131
G2 X125.015 Y202.919 I1.796 J-.801 E.01168
G1 X118.683 Y209.251 E.26699
G1 X119.217 Y209.251 E.01592
G1 X125.239 Y203.228 E.25393
G2 X125.492 Y203.509 I1.531 J-1.125 E.01129
G1 X119.751 Y209.251 E.2421
G1 X120.284 Y209.251 E.01592
G1 X125.774 Y203.761 E.23145
G2 X126.084 Y203.985 I1.273 J-1.439 E.01142
G1 X120.818 Y209.251 E.22202
G1 X121.352 Y209.251 E.01592
G1 X126.424 Y204.178 E.21387
G2 X126.798 Y204.339 I.986 J-1.782 E.01214
G1 X121.886 Y209.251 E.20711
G1 X122.42 Y209.251 E.01592
G1 X127.208 Y204.462 E.20191
G2 X127.671 Y204.533 I1.119 J-5.803 E.01398
G1 X122.953 Y209.251 E.19894
G1 X123.487 Y209.251 E.01592
G1 X128.194 Y204.544 E.19848
G2 X128.82 Y204.451 I-.245 J-3.835 E.01889
G1 X123.851 Y209.42 E.20952
G1 X114.777 Y209.42 F30000
G1 F9537.687
G1 X131.448 Y192.749 E.70294
G1 X130.914 Y192.749 E.01592
G1 X114.413 Y209.251 E.69578
G1 X113.879 Y209.251 E.01592
G1 X130.38 Y192.749 E.69578
G1 X129.846 Y192.749 E.01592
G1 X113.345 Y209.251 E.69578
G1 X112.811 Y209.251 E.01592
G1 X129.312 Y192.749 E.69578
G1 X128.779 Y192.749 E.01592
G1 X112.278 Y209.251 E.69578
G1 X111.744 Y209.251 E.01592
G1 X128.245 Y192.749 E.69578
G1 X127.711 Y192.749 E.01592
G1 X111.21 Y209.251 E.69578
G1 X110.676 Y209.251 E.01592
G1 X127.177 Y192.749 E.69578
G1 X126.643 Y192.749 E.01592
G1 X110.142 Y209.251 E.69578
G1 X109.609 Y209.251 E.01592
G1 X126.11 Y192.749 E.69578
G1 X125.576 Y192.749 E.01592
G1 X109.075 Y209.251 E.69578
G1 X108.541 Y209.251 E.01592
G1 X125.042 Y192.749 E.69578
G1 X124.508 Y192.749 E.01592
G1 X108.007 Y209.251 E.69578
G1 X107.473 Y209.251 E.01592
G1 X123.974 Y192.749 E.69578
G1 X123.441 Y192.749 E.01592
G1 X106.94 Y209.251 E.69578
G1 X106.406 Y209.251 E.01592
G1 X122.907 Y192.749 E.69578
G1 X122.373 Y192.749 E.01592
G1 X105.872 Y209.251 E.69578
G1 X105.338 Y209.251 E.01592
G1 X121.839 Y192.749 E.69578
G1 X121.305 Y192.749 E.01592
G1 X104.804 Y209.251 E.69578
G1 X104.271 Y209.251 E.01592
G1 X120.772 Y192.749 E.69578
G1 X120.238 Y192.749 E.01592
G1 X103.737 Y209.251 E.69578
G1 X103.203 Y209.251 E.01592
G1 X119.704 Y192.749 E.69578
G1 X119.17 Y192.749 E.01592
G1 X102.669 Y209.251 E.69578
G1 X102.135 Y209.251 E.01592
G1 X118.637 Y192.749 E.69578
G1 X118.103 Y192.749 E.01592
G1 X101.602 Y209.251 E.69578
G1 X101.068 Y209.251 E.01592
G1 X117.569 Y192.749 E.69578
G1 X117.035 Y192.749 E.01592
G1 X100.534 Y209.251 E.69578
G1 X100 Y209.251 E.01592
G1 X116.501 Y192.749 E.69578
G1 X115.968 Y192.749 E.01592
G1 X99.466 Y209.251 E.69578
G1 X98.933 Y209.251 E.01592
G1 X115.434 Y192.749 E.69578
G1 X114.9 Y192.749 E.01592
G1 X98.399 Y209.251 E.69578
G1 X97.865 Y209.251 E.01592
G1 X114.366 Y192.749 E.69578
G1 X113.832 Y192.749 E.01592
G1 X97.331 Y209.251 E.69578
G1 X96.797 Y209.251 E.01592
G1 X113.299 Y192.749 E.69578
G1 X112.765 Y192.749 E.01592
G1 X96.264 Y209.251 E.69578
G1 X95.73 Y209.251 E.01592
G1 X112.231 Y192.749 E.69578
G1 X111.697 Y192.749 E.01592
G1 X95.196 Y209.251 E.69578
G1 X94.662 Y209.251 E.01592
G1 X111.163 Y192.749 E.69578
G1 X110.63 Y192.749 E.01592
G1 X94.129 Y209.251 E.69578
G1 X93.595 Y209.251 E.01592
G1 X110.096 Y192.749 E.69578
G1 X109.562 Y192.749 E.01592
G1 X93.061 Y209.251 E.69578
G1 X92.527 Y209.251 E.01592
G1 X109.028 Y192.749 E.69578
G1 X108.494 Y192.749 E.01592
G1 X91.993 Y209.251 E.69578
G1 X91.46 Y209.251 E.01592
G1 X107.961 Y192.749 E.69578
G1 X107.427 Y192.749 E.01592
G1 X90.926 Y209.251 E.69578
G1 X90.392 Y209.251 E.01592
G1 X106.893 Y192.749 E.69578
G1 X106.359 Y192.749 E.01592
G1 X89.858 Y209.251 E.69578
G1 X89.324 Y209.251 E.01592
G1 X105.825 Y192.749 E.69578
G1 X105.292 Y192.749 E.01592
G1 X88.791 Y209.251 E.69578
G1 X88.257 Y209.251 E.01592
G1 X104.758 Y192.749 E.69578
G1 X104.224 Y192.749 E.01592
G1 X87.723 Y209.251 E.69578
G1 X87.189 Y209.251 E.01592
G1 X103.69 Y192.749 E.69578
G1 X103.156 Y192.749 E.01592
G1 X86.655 Y209.251 E.69578
G1 X86.122 Y209.251 E.01592
G1 X102.623 Y192.749 E.69578
G1 X102.089 Y192.749 E.01592
G1 X85.588 Y209.251 E.69578
G1 X85.054 Y209.251 E.01592
G1 X101.555 Y192.749 E.69578
G1 X101.021 Y192.749 E.01592
G1 X84.52 Y209.251 E.69578
G1 X83.986 Y209.251 E.01592
G1 X100.487 Y192.749 E.69578
G1 X99.954 Y192.749 E.01592
G1 X83.453 Y209.251 E.69578
G1 X82.919 Y209.251 E.01592
G1 X99.42 Y192.749 E.69578
M73 P66 R23
G1 X98.886 Y192.749 E.01592
G1 X82.385 Y209.251 E.69578
G1 X81.851 Y209.251 E.01592
G1 X98.352 Y192.749 E.69578
G1 X97.819 Y192.749 E.01592
G1 X81.317 Y209.251 E.69578
G1 X80.784 Y209.251 E.01592
G1 X97.285 Y192.749 E.69578
G1 X96.751 Y192.749 E.01592
G1 X80.25 Y209.251 E.69578
G1 X79.716 Y209.251 E.01592
G1 X96.217 Y192.749 E.69578
G1 X95.683 Y192.749 E.01592
G1 X79.182 Y209.251 E.69578
G1 X78.648 Y209.251 E.01592
G1 X95.15 Y192.749 E.69578
G1 X94.616 Y192.749 E.01592
G1 X78.115 Y209.251 E.69578
G1 X77.581 Y209.251 E.01592
G1 X94.082 Y192.749 E.69578
G1 X93.548 Y192.749 E.01592
G1 X77.047 Y209.251 E.69578
G1 X76.513 Y209.251 E.01592
G1 X93.014 Y192.749 E.69578
G1 X92.481 Y192.749 E.01592
G1 X75.979 Y209.251 E.69578
G1 X75.446 Y209.251 E.01592
G1 X91.947 Y192.749 E.69578
G1 X91.413 Y192.749 E.01592
G1 X74.912 Y209.251 E.69578
G1 X74.378 Y209.251 E.01592
G1 X90.879 Y192.749 E.69578
G1 X90.345 Y192.749 E.01592
G1 X73.844 Y209.251 E.69578
G1 X73.311 Y209.251 E.01592
G1 X89.812 Y192.749 E.69578
G1 X89.278 Y192.749 E.01592
G1 X72.777 Y209.251 E.69578
G1 X72.243 Y209.251 E.01592
G1 X88.744 Y192.749 E.69578
G1 X88.21 Y192.749 E.01592
G1 X71.709 Y209.251 E.69578
G1 X71.175 Y209.251 E.01592
G1 X87.676 Y192.749 E.69578
G1 X87.143 Y192.749 E.01592
G1 X70.642 Y209.251 E.69578
G1 X70.108 Y209.251 E.01592
G1 X86.609 Y192.749 E.69578
G1 X86.075 Y192.749 E.01592
G1 X69.574 Y209.251 E.69578
G1 X69.04 Y209.251 E.01592
G1 X85.541 Y192.749 E.69578
G1 X85.007 Y192.749 E.01592
G1 X68.506 Y209.251 E.69578
G1 X67.973 Y209.251 E.01592
G1 X84.474 Y192.749 E.69578
G1 X83.94 Y192.749 E.01592
G1 X67.439 Y209.251 E.69578
G1 X66.905 Y209.251 E.01592
G1 X83.406 Y192.749 E.69578
G1 X82.872 Y192.749 E.01592
G1 X66.371 Y209.251 E.69578
G1 X65.837 Y209.251 E.01592
G1 X82.338 Y192.749 E.69578
G1 X81.805 Y192.749 E.01592
G1 X65.304 Y209.251 E.69578
G1 X64.77 Y209.251 E.01592
G1 X81.271 Y192.749 E.69578
G1 X80.737 Y192.749 E.01592
G1 X64.236 Y209.251 E.69578
G1 X63.702 Y209.251 E.01592
G1 X80.203 Y192.749 E.69578
G1 X79.669 Y192.749 E.01592
G1 X63.168 Y209.251 E.69578
G1 X62.635 Y209.251 E.01592
G1 X79.136 Y192.749 E.69578
G1 X78.602 Y192.749 E.01592
G1 X62.101 Y209.251 E.69578
G1 X61.567 Y209.251 E.01592
G1 X78.068 Y192.749 E.69578
G1 X77.534 Y192.749 E.01592
G1 X61.033 Y209.251 E.69578
G1 X60.499 Y209.251 E.01592
G1 X77.001 Y192.749 E.69578
G1 X76.467 Y192.749 E.01592
G1 X59.966 Y209.251 E.69578
G1 X59.432 Y209.251 E.01592
G1 X75.933 Y192.749 E.69578
G1 X75.399 Y192.749 E.01592
G1 X58.898 Y209.251 E.69578
G1 X58.364 Y209.251 E.01592
G1 X74.865 Y192.749 E.69578
G1 X74.332 Y192.749 E.01592
G1 X57.83 Y209.251 E.69578
G1 X57.297 Y209.251 E.01592
G1 X73.798 Y192.749 E.69578
G1 X73.264 Y192.749 E.01592
G1 X56.763 Y209.251 E.69578
G1 X56.229 Y209.251 E.01592
G1 X72.73 Y192.749 E.69578
G1 X72.196 Y192.749 E.01592
G1 X55.695 Y209.251 E.69578
G1 X55.161 Y209.251 E.01592
G1 X71.663 Y192.749 E.69578
G1 X71.129 Y192.749 E.01592
G1 X54.628 Y209.251 E.69578
G1 X54.094 Y209.251 E.01592
G1 X70.595 Y192.749 E.69578
G1 X70.061 Y192.749 E.01592
G1 X53.56 Y209.251 E.69578
G1 X53.026 Y209.251 E.01592
G1 X69.527 Y192.749 E.69578
G1 X68.994 Y192.749 E.01592
G1 X59.188 Y202.555 E.41344
G2 X59.473 Y201.736 I-3.357 J-1.626 E.02589
G1 X68.46 Y192.749 E.37894
G1 X67.926 Y192.749 E.01592
G1 X59.545 Y201.13 E.35339
G2 X59.529 Y200.613 I-4.43 J-.12 E.01545
G1 X67.392 Y192.749 E.33156
G1 X66.858 Y192.749 E.01592
G1 X59.447 Y200.161 E.31252
G2 X59.321 Y199.753 I-2.106 J.426 E.01275
G1 X66.325 Y192.749 E.29531
G1 X65.791 Y192.749 E.01592
G1 X59.158 Y199.382 E.27968
G2 X58.962 Y199.044 I-1.786 J.81 E.01166
G1 X65.257 Y192.749 E.26543
G1 X64.723 Y192.749 E.01592
G1 X58.736 Y198.737 E.25247
G2 X58.481 Y198.458 I-1.519 J1.135 E.01128
G1 X64.251 Y192.688 E.24329
G1 X64.251 Y192.155 E.01592
G1 X58.195 Y198.21 E.25532
G2 X57.881 Y197.99 I-1.257 J1.465 E.01145
G1 X64.251 Y191.621 E.26857
G1 X64.251 Y191.087 E.01592
G1 X57.536 Y197.801 E.28312
G2 X57.157 Y197.647 I-.963 J1.815 E.01223
G1 X64.251 Y190.553 E.2991
G1 X64.251 Y190.019 E.01592
G1 X56.74 Y197.53 E.31671
G2 X56.276 Y197.46 I-.584 J2.275 E.01399
G1 X64.251 Y189.486 E.33623
G1 X64.251 Y188.952 E.01592
G1 X55.74 Y197.462 E.35885
G2 X55.1 Y197.568 I.27 J3.617 E.01936
G1 X64.251 Y188.418 E.38583
G1 X64.251 Y187.884 E.01592
G1 X47.749 Y204.385 E.69578
G1 X47.749 Y204.919 E.01592
G1 X52.564 Y200.104 E.20301
G2 X52.461 Y200.741 I4.47 J1.051 E.01925
G1 X47.749 Y205.453 E.19866
G1 X47.749 Y205.987 E.01592
G1 X52.462 Y201.274 E.19873
G2 X52.531 Y201.739 I2.361 J-.107 E.01406
G1 X47.749 Y206.52 E.2016
G1 X47.749 Y207.054 E.01592
G1 X52.645 Y202.159 E.20643
G2 X52.799 Y202.538 I1.977 J-.579 E.01224
G1 X47.749 Y207.588 E.21292
G1 X47.749 Y208.122 E.01592
G1 X52.99 Y202.882 E.22096
G2 X53.211 Y203.194 I1.67 J-.946 E.01144
G1 X47.749 Y208.656 E.23028
G1 X47.749 Y209.189 E.01592
G1 X53.461 Y203.478 E.24082
G2 X53.739 Y203.734 I1.416 J-1.262 E.01128
G1 X48.222 Y209.251 E.23262
G1 X48.756 Y209.251 E.01592
G1 X54.046 Y203.961 E.22305
G2 X54.383 Y204.157 I1.151 J-1.585 E.01166
G1 X49.29 Y209.251 E.21476
G1 X49.824 Y209.251 E.01592
G1 X54.753 Y204.321 E.20785
G2 X55.159 Y204.448 I.84 J-1.97 E.01272
G1 X50.357 Y209.251 E.20248
G1 X50.891 Y209.251 E.01592
G1 X55.613 Y204.528 E.19912
G2 X56.13 Y204.545 I.343 J-2.571 E.01545
G1 X51.425 Y209.251 E.19841
G1 X51.959 Y209.251 E.01592
G1 X56.74 Y204.47 E.20159
G2 X57.551 Y204.192 I-.776 J-3.589 E.02565
G1 X52.323 Y209.42 E.22047
G1 X47.58 Y204.021 F30000
G1 F9537.687
G1 X64.251 Y187.35 E.70294
G1 X64.251 Y186.817 E.01592
G1 X47.749 Y203.318 E.69578
G1 X47.749 Y202.784 E.01592
G1 X64.251 Y186.283 E.69578
G1 X64.251 Y185.749 E.01592
G1 X47.749 Y202.25 E.69578
G1 X47.749 Y201.716 E.01592
G1 X64.251 Y185.215 E.69578
G1 X64.251 Y184.681 E.01592
G1 X47.749 Y201.182 E.69578
G1 X47.749 Y200.649 E.01592
G1 X64.251 Y184.148 E.69578
G1 X64.251 Y183.614 E.01592
G1 X47.749 Y200.115 E.69578
G1 X47.749 Y199.581 E.01592
G1 X64.251 Y183.08 E.69578
G1 X64.251 Y182.546 E.01592
G1 X47.749 Y199.047 E.69578
G1 X47.749 Y198.514 E.01592
G1 X64.251 Y182.012 E.69578
G1 X64.251 Y181.479 E.01592
G1 X47.749 Y197.98 E.69578
G1 X47.749 Y197.446 E.01592
G1 X64.251 Y180.945 E.69578
G1 X64.251 Y180.411 E.01592
G1 X47.749 Y196.912 E.69578
G1 X47.749 Y196.378 E.01592
G1 X64.251 Y179.877 E.69578
G1 X64.251 Y179.343 E.01592
G1 X47.749 Y195.845 E.69578
G1 X47.749 Y195.311 E.01592
G1 X64.251 Y178.81 E.69578
G1 X64.251 Y178.276 E.01592
G1 X47.749 Y194.777 E.69578
G1 X47.749 Y194.243 E.01592
G1 X64.251 Y177.742 E.69578
G1 X64.251 Y177.208 E.01592
G1 X47.749 Y193.709 E.69578
G1 X47.749 Y193.176 E.01592
G1 X64.251 Y176.675 E.69578
G1 X64.251 Y176.141 E.01592
G1 X47.749 Y192.642 E.69578
G1 X47.749 Y192.108 E.01592
G1 X64.251 Y175.607 E.69578
G1 X64.251 Y175.073 E.01592
G1 X47.749 Y191.574 E.69578
G1 X47.749 Y191.04 E.01592
G1 X64.251 Y174.539 E.69578
G1 X64.251 Y174.006 E.01592
G1 X47.749 Y190.507 E.69578
G1 X47.749 Y189.973 E.01592
G1 X64.251 Y173.472 E.69578
G1 X64.251 Y172.938 E.01592
G1 X47.749 Y189.439 E.69578
G1 X47.749 Y188.905 E.01592
G1 X64.251 Y172.404 E.69578
G1 X64.251 Y171.87 E.01592
G1 X47.749 Y188.371 E.69578
G1 X47.749 Y187.838 E.01592
G1 X64.251 Y171.337 E.69578
G1 X64.251 Y170.803 E.01592
G1 X47.749 Y187.304 E.69578
G1 X47.749 Y186.77 E.01592
G1 X64.251 Y170.269 E.69578
G1 X64.251 Y169.735 E.01592
G1 X47.749 Y186.236 E.69578
G1 X47.749 Y185.702 E.01592
G1 X64.251 Y169.201 E.69578
G1 X64.251 Y168.668 E.01592
G1 X47.749 Y185.169 E.69578
G1 X47.749 Y184.635 E.01592
G1 X64.251 Y168.134 E.69578
G1 X64.251 Y167.6 E.01592
G1 X47.749 Y184.101 E.69578
G1 X47.749 Y183.567 E.01592
G1 X64.251 Y167.066 E.69578
G1 X64.251 Y166.532 E.01592
G1 X47.749 Y183.033 E.69578
G1 X47.749 Y182.5 E.01592
G1 X64.251 Y165.999 E.69578
G1 X64.251 Y165.465 E.01592
G1 X47.749 Y181.966 E.69578
G1 X47.749 Y181.432 E.01592
G1 X64.251 Y164.931 E.69578
G1 X64.251 Y164.397 E.01592
G1 X47.749 Y180.898 E.69578
G1 X47.749 Y180.365 E.01592
G1 X64.251 Y163.863 E.69578
G1 X64.251 Y163.33 E.01592
G1 X47.749 Y179.831 E.69578
G1 X47.749 Y179.297 E.01592
G1 X64.251 Y162.796 E.69578
G1 X64.251 Y162.262 E.01592
G1 X47.749 Y178.763 E.69578
G1 X47.749 Y178.229 E.01592
G1 X64.251 Y161.728 E.69578
G1 X64.251 Y161.194 E.01592
G1 X47.749 Y177.696 E.69578
M73 P66 R22
G1 X47.749 Y177.162 E.01592
G1 X64.251 Y160.661 E.69578
G1 X64.251 Y160.127 E.01592
G1 X47.749 Y176.628 E.69578
G1 X47.749 Y176.094 E.01592
G1 X64.251 Y159.593 E.69578
G1 X64.251 Y159.059 E.01592
G1 X47.749 Y175.56 E.69578
G1 X47.749 Y175.027 E.01592
G1 X64.251 Y158.525 E.69578
G1 X64.251 Y157.992 E.01592
G1 X47.749 Y174.493 E.69578
G1 X47.749 Y173.959 E.01592
G1 X64.251 Y157.458 E.69578
G1 X64.251 Y156.924 E.01592
G1 X47.749 Y173.425 E.69578
G1 X47.749 Y172.891 E.01592
G1 X64.251 Y156.39 E.69578
G1 X64.251 Y155.857 E.01592
G1 X47.749 Y172.358 E.69578
G1 X47.749 Y171.824 E.01592
G1 X64.251 Y155.323 E.69578
G1 X64.251 Y154.789 E.01592
G1 X47.749 Y171.29 E.69578
G1 X47.749 Y170.756 E.01592
G1 X64.251 Y154.255 E.69578
G1 X64.251 Y153.721 E.01592
G1 X47.749 Y170.222 E.69578
G1 X47.749 Y169.689 E.01592
G1 X64.251 Y153.188 E.69578
G1 X64.251 Y152.654 E.01592
G1 X47.749 Y169.155 E.69578
G1 X47.749 Y168.621 E.01592
G1 X64.251 Y152.12 E.69578
G1 X64.251 Y151.586 E.01592
G1 X47.749 Y168.087 E.69578
G1 X47.749 Y167.553 E.01592
G1 X64.251 Y151.052 E.69578
G1 X64.251 Y150.519 E.01592
G1 X47.749 Y167.02 E.69578
G1 X47.749 Y166.486 E.01592
G1 X64.251 Y149.985 E.69578
G1 X64.251 Y149.451 E.01592
G1 X47.749 Y165.952 E.69578
G1 X47.749 Y165.418 E.01592
G1 X64.251 Y148.917 E.69578
G1 X64.251 Y148.383 E.01592
G1 X47.749 Y164.884 E.69578
G1 X47.749 Y164.351 E.01592
G1 X64.251 Y147.85 E.69578
G1 X64.251 Y147.316 E.01592
G1 X47.749 Y163.817 E.69578
G1 X47.749 Y163.283 E.01592
G1 X64.251 Y146.782 E.69578
G1 X64.251 Y146.248 E.01592
G1 X47.749 Y162.749 E.69578
G1 X47.749 Y162.215 E.01592
G1 X64.251 Y145.714 E.69578
G1 X64.251 Y145.181 E.01592
G1 X47.749 Y161.682 E.69578
G1 X47.749 Y161.148 E.01592
G1 X64.251 Y144.647 E.69578
G1 X64.251 Y144.113 E.01592
G1 X47.749 Y160.614 E.69578
G1 X47.749 Y160.08 E.01592
G1 X64.251 Y143.579 E.69578
G1 X64.251 Y143.045 E.01592
G1 X47.749 Y159.546 E.69578
G1 X47.749 Y159.013 E.01592
G1 X64.251 Y142.512 E.69578
G1 X64.251 Y141.978 E.01592
G1 X47.749 Y158.479 E.69578
G1 X47.749 Y157.945 E.01592
G1 X64.251 Y141.444 E.69578
G1 X64.251 Y140.91 E.01592
G1 X47.749 Y157.411 E.69578
G1 X47.749 Y156.878 E.01592
G1 X64.251 Y140.376 E.69578
G1 X64.251 Y139.843 E.01592
G1 X47.749 Y156.344 E.69578
G1 X47.749 Y155.81 E.01592
G1 X64.251 Y139.309 E.69578
G1 X64.251 Y138.775 E.01592
G1 X47.749 Y155.276 E.69578
G1 X47.749 Y154.742 E.01592
G1 X64.251 Y138.241 E.69578
G1 X64.251 Y137.707 E.01592
G1 X47.749 Y154.209 E.69578
G1 X47.749 Y153.675 E.01592
G1 X64.251 Y137.174 E.69578
G1 X64.251 Y136.64 E.01592
G1 X47.749 Y153.141 E.69578
G1 X47.749 Y152.607 E.01592
G1 X64.251 Y136.106 E.69578
G1 X64.251 Y135.572 E.01592
G1 X47.749 Y152.073 E.69578
G1 X47.749 Y151.54 E.01592
G1 X64.251 Y135.039 E.69578
G1 X64.251 Y134.505 E.01592
G1 X47.749 Y151.006 E.69578
G1 X47.749 Y150.472 E.01592
G1 X64.251 Y133.971 E.69578
G1 X64.251 Y133.437 E.01592
G1 X47.749 Y149.938 E.69578
G1 X47.749 Y149.404 E.01592
G1 X64.251 Y132.903 E.69578
G1 X64.251 Y132.37 E.01592
G1 X47.749 Y148.871 E.69578
G1 X47.749 Y148.337 E.01592
G1 X64.251 Y131.836 E.69578
G1 X64.251 Y131.302 E.01592
G1 X47.749 Y147.803 E.69578
G1 X47.749 Y147.269 E.01592
G1 X64.251 Y130.768 E.69578
G1 X64.251 Y130.234 E.01592
G1 X47.749 Y146.735 E.69578
G1 X47.749 Y146.202 E.01592
G1 X64.251 Y129.701 E.69578
G1 X64.251 Y129.167 E.01592
G1 X47.749 Y145.668 E.69578
G1 X47.749 Y145.134 E.01592
G1 X64.251 Y128.633 E.69578
G1 X64.251 Y128.099 E.01592
G1 X47.749 Y144.6 E.69578
G1 X47.749 Y144.066 E.01592
G1 X64.251 Y127.565 E.69578
G1 X64.251 Y127.032 E.01592
G1 X47.749 Y143.533 E.69578
G1 X47.749 Y142.999 E.01592
G1 X64.251 Y126.498 E.69578
G1 X64.251 Y125.964 E.01592
G1 X47.749 Y142.465 E.69578
G1 X47.749 Y141.931 E.01592
G1 X64.251 Y125.43 E.69578
G1 X64.251 Y124.896 E.01592
G1 X47.749 Y141.397 E.69578
G1 X47.749 Y140.864 E.01592
G1 X64.251 Y124.363 E.69578
G1 X64.251 Y123.829 E.01592
G1 X47.749 Y140.33 E.69578
G1 X47.749 Y139.796 E.01592
G1 X64.251 Y123.295 E.69578
G1 X64.251 Y122.761 E.01592
G1 X47.749 Y139.262 E.69578
G1 X47.749 Y138.729 E.01592
G1 X57.108 Y129.37 E.39462
G3 X56.422 Y129.522 I-1.111 J-3.382 E.02099
G1 X47.749 Y138.195 E.36569
G1 X47.749 Y137.661 E.01592
G1 X55.863 Y129.547 E.34213
G3 X55.383 Y129.493 I.029 J-2.43 E.01443
G1 X47.749 Y137.127 E.32189
G1 X47.749 Y136.593 E.01592
G1 X54.953 Y129.39 E.30373
G3 X54.563 Y129.246 I.524 J-2.023 E.01241
G1 X47.749 Y136.06 E.28728
G1 X47.749 Y135.526 E.01592
G1 X54.209 Y129.066 E.27238
G3 X53.888 Y128.853 I.905 J-1.71 E.0115
G1 X47.749 Y134.992 E.25885
G1 X47.749 Y134.458 E.01592
G1 X53.597 Y128.611 E.24655
G3 X53.333 Y128.34 I1.221 J-1.452 E.01127
G1 X47.749 Y133.924 E.23545
G1 X47.749 Y133.391 E.01592
G1 X53.099 Y128.041 E.22555
G3 X52.894 Y127.713 I1.537 J-1.187 E.01157
G1 X47.749 Y132.857 E.21691
G1 X47.749 Y132.323 E.01592
G1 X52.72 Y127.352 E.20961
G3 X52.583 Y126.956 I1.91 J-.886 E.01252
G1 X47.749 Y131.789 E.2038
G1 X47.749 Y131.255 E.01592
G1 X52.487 Y126.518 E.19976
G3 X52.453 Y126.018 I2.48 J-.42 E.01496
G1 X47.749 Y130.722 E.19832
G1 X47.749 Y130.188 E.01592
G1 X52.493 Y125.444 E.20004
G3 X52.695 Y124.709 I3.9 J.673 E.02276
G1 X47.749 Y129.654 E.20853
G1 X47.749 Y129.12 E.01592
G1 X64.251 Y112.619 E.69578
G1 X64.251 Y113.153 E.01592
G1 X54.706 Y122.697 E.40244
G3 X55.441 Y122.497 I1.307 J3.344 E.02273
G1 X64.251 Y113.687 E.37148
G1 X64.251 Y114.221 E.01592
G1 X56.013 Y122.458 E.34734
G3 X56.515 Y122.49 I.126 J2.002 E.01504
G1 X64.251 Y114.754 E.32617
G1 X64.251 Y115.288 E.01592
G1 X56.958 Y122.58 E.30748
G3 X57.353 Y122.719 I-2.307 J7.201 E.01249
G1 X64.251 Y115.822 E.29082
G1 X64.251 Y116.356 E.01592
G1 X57.713 Y122.893 E.27566
G3 X58.041 Y123.099 I-.863 J1.741 E.01157
G1 X64.251 Y116.889 E.26182
G1 X64.251 Y117.423 E.01592
G1 X58.34 Y123.334 E.24923
G3 X58.61 Y123.598 I-1.183 J1.482 E.01127
G1 X64.251 Y117.957 E.23784
G1 X64.251 Y118.491 E.01592
G1 X58.852 Y123.89 E.22765
G3 X59.064 Y124.211 I-1.501 J1.223 E.01151
G1 X64.251 Y119.025 E.21869
G1 X64.251 Y119.558 E.01592
G1 X59.245 Y124.564 E.21105
G3 X59.393 Y124.95 I-1.854 J.928 E.01235
G1 X64.251 Y120.092 E.20483
G1 X64.251 Y120.626 E.01592
G1 X59.494 Y125.382 E.20055
G3 X59.545 Y125.865 I-2.395 J.496 E.01451
G1 X64.251 Y121.16 E.19842
G1 X64.251 Y121.694 E.01592
G1 X59.524 Y126.42 E.1993
G3 X59.373 Y127.105 I-3.967 J-.517 E.02095
G1 X64.42 Y122.058 E.21284
; WIPE_START
G1 X63.006 Y123.472 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X55.785 Y125.945 Z2.8 F30000
G1 X47.58 Y128.756 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9537.687
G1 X64.251 Y112.085 E.70294
G1 X64.251 Y111.552 E.01592
G1 X47.749 Y128.053 E.69578
G1 X47.749 Y127.519 E.01592
G1 X64.251 Y111.018 E.69578
G1 X64.251 Y110.484 E.01592
G1 X47.749 Y126.985 E.69578
G1 X47.749 Y126.451 E.01592
G1 X64.251 Y109.95 E.69578
G1 X64.251 Y109.416 E.01592
G1 X47.749 Y125.917 E.69578
G1 X47.749 Y125.384 E.01592
G1 X64.251 Y108.883 E.69578
G1 X64.251 Y108.349 E.01592
G1 X47.749 Y124.85 E.69578
G1 X47.749 Y124.316 E.01592
G1 X64.251 Y107.815 E.69578
G1 X64.251 Y107.281 E.01592
G1 X47.749 Y123.782 E.69578
G1 X47.749 Y123.248 E.01592
G1 X64.251 Y106.747 E.69578
G1 X64.251 Y106.214 E.01592
G1 X47.749 Y122.715 E.69578
G1 X47.749 Y122.181 E.01592
G1 X64.251 Y105.68 E.69578
G1 X64.251 Y105.146 E.01592
G1 X47.749 Y121.647 E.69578
G1 X47.749 Y121.113 E.01592
G1 X64.251 Y104.612 E.69578
G1 X64.251 Y104.078 E.01592
G1 X47.749 Y120.579 E.69578
G1 X47.749 Y120.046 E.01592
G1 X64.251 Y103.545 E.69578
G1 X64.251 Y103.011 E.01592
G1 X47.749 Y119.512 E.69578
M73 P67 R22
G1 X47.749 Y118.978 E.01592
G1 X64.251 Y102.477 E.69578
G1 X64.251 Y101.943 E.01592
G1 X47.749 Y118.444 E.69578
G1 X47.749 Y117.911 E.01592
G1 X64.251 Y101.409 E.69578
G1 X64.251 Y100.876 E.01592
G1 X47.749 Y117.377 E.69578
G1 X47.749 Y116.843 E.01592
G1 X64.251 Y100.342 E.69578
G1 X64.251 Y99.808 E.01592
G1 X47.749 Y116.309 E.69578
G1 X47.749 Y115.775 E.01592
G1 X64.251 Y99.274 E.69578
G1 X64.251 Y98.74 E.01592
G1 X47.749 Y115.242 E.69578
G1 X47.749 Y114.708 E.01592
G1 X64.251 Y98.207 E.69578
G1 X64.251 Y97.673 E.01592
G1 X47.749 Y114.174 E.69578
G1 X47.749 Y113.64 E.01592
G1 X64.251 Y97.139 E.69578
G1 X64.251 Y96.605 E.01592
G1 X47.749 Y113.106 E.69578
G1 X47.749 Y112.573 E.01592
G1 X64.251 Y96.071 E.69578
G1 X64.251 Y95.538 E.01592
G1 X47.749 Y112.039 E.69578
G1 X47.749 Y111.505 E.01592
G1 X64.251 Y95.004 E.69578
G1 X64.251 Y94.47 E.01592
G1 X47.749 Y110.971 E.69578
G1 X47.749 Y110.437 E.01592
G1 X64.251 Y93.936 E.69578
G1 X64.251 Y93.403 E.01592
G1 X47.749 Y109.904 E.69578
G1 X47.749 Y109.37 E.01592
G1 X64.251 Y92.869 E.69578
G1 X64.251 Y92.335 E.01592
G1 X47.749 Y108.836 E.69578
G1 X47.749 Y108.302 E.01592
G1 X64.251 Y91.801 E.69578
G1 X64.251 Y91.267 E.01592
G1 X47.749 Y107.768 E.69578
G1 X47.749 Y107.235 E.01592
G1 X64.251 Y90.734 E.69578
G1 X64.251 Y90.2 E.01592
G1 X47.749 Y106.701 E.69578
G1 X47.749 Y106.167 E.01592
G1 X64.251 Y89.666 E.69578
G1 X64.251 Y89.132 E.01592
G1 X47.749 Y105.633 E.69578
G1 X47.749 Y105.099 E.01592
G1 X64.251 Y88.598 E.69578
G1 X64.251 Y88.065 E.01592
G1 X47.749 Y104.566 E.69578
G1 X47.749 Y104.032 E.01592
G1 X64.251 Y87.531 E.69578
G1 X64.251 Y86.997 E.01592
G1 X47.749 Y103.498 E.69578
G1 X47.749 Y102.964 E.01592
G1 X64.251 Y86.463 E.69578
G1 X64.251 Y85.929 E.01592
G1 X47.749 Y102.43 E.69578
G1 X47.749 Y101.897 E.01592
G1 X64.251 Y85.396 E.69578
G1 X64.251 Y84.862 E.01592
G1 X47.749 Y101.363 E.69578
G1 X47.749 Y100.829 E.01592
G1 X64.251 Y84.328 E.69578
G1 X64.251 Y83.794 E.01592
G1 X47.749 Y100.295 E.69578
G1 X47.749 Y99.761 E.01592
G1 X64.251 Y83.26 E.69578
G1 X64.251 Y82.727 E.01592
G1 X47.749 Y99.228 E.69578
G1 X47.749 Y98.694 E.01592
G1 X64.251 Y82.193 E.69578
G1 X64.251 Y81.659 E.01592
G1 X47.749 Y98.16 E.69578
G1 X47.749 Y97.626 E.01592
G1 X64.251 Y81.125 E.69578
G1 X64.251 Y80.591 E.01592
G1 X47.749 Y97.093 E.69578
G1 X47.749 Y96.559 E.01592
G1 X64.251 Y80.058 E.69578
G1 X64.251 Y79.524 E.01592
G1 X47.749 Y96.025 E.69578
G1 X47.749 Y95.491 E.01592
G1 X64.251 Y78.99 E.69578
G1 X64.251 Y78.456 E.01592
G1 X47.749 Y94.957 E.69578
G1 X47.749 Y94.424 E.01592
G1 X64.251 Y77.922 E.69578
G1 X64.251 Y77.389 E.01592
G1 X47.749 Y93.89 E.69578
G1 X47.749 Y93.356 E.01592
G1 X64.251 Y76.855 E.69578
G1 X64.251 Y76.321 E.01592
G1 X47.749 Y92.822 E.69578
G1 X47.749 Y92.288 E.01592
G1 X64.251 Y75.787 E.69578
G1 X64.251 Y75.253 E.01592
G1 X47.749 Y91.755 E.69578
G1 X47.749 Y91.221 E.01592
G1 X64.251 Y74.72 E.69578
G1 X64.251 Y74.186 E.01592
G1 X47.749 Y90.687 E.69578
G1 X47.749 Y90.153 E.01592
G1 X64.251 Y73.652 E.69578
G1 X64.251 Y73.118 E.01592
G1 X47.749 Y89.619 E.69578
G1 X47.749 Y89.086 E.01592
G1 X64.251 Y72.585 E.69578
G1 X64.251 Y72.051 E.01592
G1 X47.749 Y88.552 E.69578
G1 X47.749 Y88.018 E.01592
G1 X64.251 Y71.517 E.69578
G1 X64.251 Y70.983 E.01592
G1 X47.749 Y87.484 E.69578
G1 X47.749 Y86.95 E.01592
G1 X64.251 Y70.449 E.69578
G1 X64.251 Y69.916 E.01592
G1 X47.749 Y86.417 E.69578
G1 X47.749 Y85.883 E.01592
G1 X64.251 Y69.382 E.69578
G1 X64.251 Y68.848 E.01592
G1 X47.749 Y85.349 E.69578
G1 X47.749 Y84.815 E.01592
G1 X64.251 Y68.314 E.69578
G1 X64.251 Y67.78 E.01592
G1 X47.749 Y84.281 E.69578
G1 X47.749 Y83.748 E.01592
G1 X64.251 Y67.247 E.69578
G1 X64.251 Y66.713 E.01592
G1 X47.749 Y83.214 E.69578
G1 X47.749 Y82.68 E.01592
G1 X64.251 Y66.179 E.69578
G1 X64.251 Y65.645 E.01592
G1 X47.749 Y82.146 E.69578
G1 X47.749 Y81.612 E.01592
G1 X64.251 Y65.111 E.69578
G1 X64.251 Y64.578 E.01592
G1 X47.749 Y81.079 E.69578
G1 X47.749 Y80.545 E.01592
G1 X64.251 Y64.044 E.69578
G1 X64.251 Y63.51 E.01592
G1 X47.749 Y80.011 E.69578
G1 X47.749 Y79.477 E.01592
G1 X64.251 Y62.976 E.69578
G1 X64.251 Y62.442 E.01592
G1 X47.749 Y78.943 E.69578
G1 X47.749 Y78.41 E.01592
G1 X64.251 Y61.909 E.69578
G1 X64.251 Y61.375 E.01592
G1 X47.749 Y77.876 E.69578
G1 X47.749 Y77.342 E.01592
G1 X64.251 Y60.841 E.69578
G1 X64.251 Y60.307 E.01592
G1 X47.749 Y76.808 E.69578
G1 X47.749 Y76.275 E.01592
G1 X64.251 Y59.773 E.69578
G1 X64.251 Y59.251 E.01559
G1 X64.773 Y59.251 E.01559
G1 X81.275 Y42.749 E.69578
G1 X81.808 Y42.749 E.01592
G1 X65.307 Y59.251 E.69578
G1 X65.841 Y59.251 E.01592
G1 X82.342 Y42.749 E.69578
G1 X82.876 Y42.749 E.01592
G1 X66.375 Y59.251 E.69578
G1 X66.909 Y59.251 E.01592
G1 X83.41 Y42.749 E.69578
G1 X83.944 Y42.749 E.01592
G1 X67.442 Y59.251 E.69578
G1 X67.976 Y59.251 E.01592
G1 X84.477 Y42.749 E.69578
G1 X85.011 Y42.749 E.01592
G1 X68.51 Y59.251 E.69578
G1 X69.044 Y59.251 E.01592
G1 X85.545 Y42.749 E.69578
G1 X86.079 Y42.749 E.01592
G1 X69.578 Y59.251 E.69578
G1 X70.111 Y59.251 E.01592
G1 X86.612 Y42.749 E.69578
G1 X87.146 Y42.749 E.01592
G1 X70.645 Y59.251 E.69578
G1 X71.179 Y59.251 E.01592
G1 X87.68 Y42.749 E.69578
G1 X88.214 Y42.749 E.01592
G1 X71.713 Y59.251 E.69578
G1 X72.247 Y59.251 E.01592
G1 X88.748 Y42.749 E.69578
G1 X89.281 Y42.749 E.01592
G1 X72.78 Y59.251 E.69578
G1 X73.314 Y59.251 E.01592
G1 X89.815 Y42.749 E.69578
G1 X90.349 Y42.749 E.01592
G1 X73.848 Y59.251 E.69578
G1 X74.382 Y59.251 E.01592
G1 X90.883 Y42.749 E.69578
G1 X91.417 Y42.749 E.01592
G1 X74.916 Y59.251 E.69578
G1 X75.449 Y59.251 E.01592
G1 X91.95 Y42.749 E.69578
G1 X92.484 Y42.749 E.01592
G1 X75.983 Y59.251 E.69578
G1 X76.517 Y59.251 E.01592
G1 X93.018 Y42.749 E.69578
G1 X93.552 Y42.749 E.01592
G1 X77.051 Y59.251 E.69578
G1 X77.585 Y59.251 E.01592
G1 X94.086 Y42.749 E.69578
G1 X94.619 Y42.749 E.01592
G1 X78.118 Y59.251 E.69578
G1 X78.652 Y59.251 E.01592
G1 X95.153 Y42.749 E.69578
G1 X95.687 Y42.749 E.01592
G1 X79.186 Y59.251 E.69578
G1 X79.72 Y59.251 E.01592
G1 X96.221 Y42.749 E.69578
G1 X96.755 Y42.749 E.01592
G1 X80.254 Y59.251 E.69578
G1 X80.787 Y59.251 E.01592
G1 X97.288 Y42.749 E.69578
G1 X97.822 Y42.749 E.01592
G1 X81.321 Y59.251 E.69578
G1 X81.855 Y59.251 E.01592
G1 X98.356 Y42.749 E.69578
G1 X98.89 Y42.749 E.01592
G1 X82.389 Y59.251 E.69578
G1 X82.922 Y59.251 E.01592
G1 X99.424 Y42.749 E.69578
G1 X99.957 Y42.749 E.01592
G1 X83.456 Y59.251 E.69578
G1 X83.99 Y59.251 E.01592
G1 X100.491 Y42.749 E.69578
G1 X101.025 Y42.749 E.01592
G1 X84.524 Y59.251 E.69578
G1 X85.058 Y59.251 E.01592
G1 X101.559 Y42.749 E.69578
G1 X102.093 Y42.749 E.01592
G1 X85.591 Y59.251 E.69578
G1 X86.125 Y59.251 E.01592
G1 X102.626 Y42.749 E.69578
G1 X103.16 Y42.749 E.01592
G1 X86.659 Y59.251 E.69578
G1 X87.193 Y59.251 E.01592
G1 X103.694 Y42.749 E.69578
G1 X104.228 Y42.749 E.01592
G1 X87.727 Y59.251 E.69578
G1 X88.26 Y59.251 E.01592
G1 X104.762 Y42.749 E.69578
G1 X105.295 Y42.749 E.01592
G1 X88.794 Y59.251 E.69578
G1 X89.328 Y59.251 E.01592
G1 X105.829 Y42.749 E.69578
G1 X106.363 Y42.749 E.01592
G1 X89.862 Y59.251 E.69578
G1 X90.396 Y59.251 E.01592
G1 X106.897 Y42.749 E.69578
G1 X107.43 Y42.749 E.01592
G1 X90.929 Y59.251 E.69578
G1 X91.463 Y59.251 E.01592
G1 X107.964 Y42.749 E.69578
G1 X108.498 Y42.749 E.01592
G1 X91.997 Y59.251 E.69578
G1 X92.531 Y59.251 E.01592
G1 X109.032 Y42.749 E.69578
G1 X109.566 Y42.749 E.01592
G1 X93.065 Y59.251 E.69578
G1 X93.598 Y59.251 E.01592
G1 X110.099 Y42.749 E.69578
G1 X110.633 Y42.749 E.01592
G1 X94.132 Y59.251 E.69578
G1 X94.666 Y59.251 E.01592
G1 X111.167 Y42.749 E.69578
G1 X111.701 Y42.749 E.01592
G1 X95.2 Y59.251 E.69578
G1 X95.734 Y59.251 E.01592
G1 X112.235 Y42.749 E.69578
G1 X112.768 Y42.749 E.01592
G1 X96.267 Y59.251 E.69578
G1 X96.801 Y59.251 E.01592
G1 X113.302 Y42.749 E.69578
G1 X113.836 Y42.749 E.01592
G1 X97.335 Y59.251 E.69578
G1 X97.869 Y59.251 E.01592
G1 X114.37 Y42.749 E.69578
G1 X114.904 Y42.749 E.01592
G1 X98.403 Y59.251 E.69578
G1 X98.936 Y59.251 E.01592
G1 X115.437 Y42.749 E.69578
G1 X115.971 Y42.749 E.01592
G1 X99.47 Y59.251 E.69578
G1 X100.004 Y59.251 E.01592
G1 X116.505 Y42.749 E.69578
G1 X117.039 Y42.749 E.01592
G1 X100.538 Y59.251 E.69578
G1 X101.072 Y59.251 E.01592
G1 X117.573 Y42.749 E.69578
G1 X118.106 Y42.749 E.01592
G1 X101.605 Y59.251 E.69578
G1 X102.139 Y59.251 E.01592
G1 X118.64 Y42.749 E.69578
G1 X119.174 Y42.749 E.01592
G1 X102.673 Y59.251 E.69578
G1 X103.207 Y59.251 E.01592
G1 X119.708 Y42.749 E.69578
G1 X120.242 Y42.749 E.01592
G1 X103.74 Y59.251 E.69578
G1 X104.274 Y59.251 E.01592
G1 X120.775 Y42.749 E.69578
G1 X121.309 Y42.749 E.01592
G1 X104.808 Y59.251 E.69578
G1 X105.342 Y59.251 E.01592
G1 X121.843 Y42.749 E.69578
G1 X122.377 Y42.749 E.01592
G1 X105.876 Y59.251 E.69578
G1 X106.409 Y59.251 E.01592
G1 X122.911 Y42.749 E.69578
G1 X123.444 Y42.749 E.01592
G1 X106.943 Y59.251 E.69578
G1 X107.477 Y59.251 E.01592
G1 X123.978 Y42.749 E.69578
G1 X124.512 Y42.749 E.01592
G1 X108.011 Y59.251 E.69578
G1 X108.545 Y59.251 E.01592
G1 X125.046 Y42.749 E.69578
G1 X125.58 Y42.749 E.01592
G1 X109.078 Y59.251 E.69578
G1 X109.612 Y59.251 E.01592
G1 X126.113 Y42.749 E.69578
G1 X126.647 Y42.749 E.01592
G1 X110.146 Y59.251 E.69578
G1 X110.68 Y59.251 E.01592
G1 X127.181 Y42.749 E.69578
G1 X127.715 Y42.749 E.01592
G1 X111.214 Y59.251 E.69578
G1 X111.747 Y59.251 E.01592
G1 X128.249 Y42.749 E.69578
G1 X128.782 Y42.749 E.01592
G1 X112.281 Y59.251 E.69578
G1 X112.815 Y59.251 E.01592
G1 X129.316 Y42.749 E.69578
G1 X129.85 Y42.749 E.01592
G1 X113.349 Y59.251 E.69578
G1 X113.883 Y59.251 E.01592
G1 X130.384 Y42.749 E.69578
G1 X130.917 Y42.749 E.01592
G1 X114.416 Y59.251 E.69578
G1 X114.95 Y59.251 E.01592
G1 X131.451 Y42.749 E.69578
G1 X131.985 Y42.749 E.01592
G1 X127.192 Y47.542 E.2021
G3 X127.81 Y47.458 I.612 J2.182 E.01865
G1 X132.519 Y42.749 E.19855
G1 X133.053 Y42.749 E.01592
G1 X128.335 Y47.467 E.19892
G3 X128.793 Y47.543 I-.148 J2.325 E.01387
G1 X133.586 Y42.749 E.20211
G1 X134.12 Y42.749 E.01592
G1 X129.206 Y47.663 E.20719
G3 X129.582 Y47.822 I-.606 J1.953 E.01216
G1 X134.654 Y42.749 E.21389
G1 X135.188 Y42.749 E.01592
G1 X129.923 Y48.014 E.222
G3 X130.232 Y48.239 I-7.695 J10.917 E.01139
G1 X135.722 Y42.749 E.23147
G1 X136.255 Y42.749 E.01592
G1 X130.512 Y48.492 E.24216
G3 X130.764 Y48.774 I-1.283 J1.4 E.01129
G1 X136.789 Y42.749 E.25405
G1 X137.323 Y42.749 E.01592
G1 X130.987 Y49.085 E.26716
G3 X131.18 Y49.427 I-1.612 J1.133 E.0117
G1 X137.857 Y42.749 E.28156
G1 X138.391 Y42.749 E.01592
G1 X131.339 Y49.801 E.29735
G3 X131.46 Y50.214 I-2.003 J.815 E.01284
G1 X138.924 Y42.749 E.31473
G1 X139.458 Y42.749 E.01592
G1 X131.535 Y50.672 E.33408
G3 X131.542 Y51.2 I-2.626 J.296 E.01575
G1 X139.992 Y42.749 E.35632
G1 X140.526 Y42.749 E.01592
G1 X131.205 Y52.071 E.39303
; WIPE_START
G1 X132.619 Y50.656 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.018 Y49.964 Z2.8 F30000
G1 X124.791 Y49.943 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9537.687
G1 X115.484 Y59.251 E.39246
G1 X116.018 Y59.251 E.01592
G1 X124.454 Y50.815 E.35571
G2 X124.468 Y51.334 I5.053 J.115 E.01549
G1 X116.552 Y59.251 E.33382
G1 X117.085 Y59.251 E.01592
G1 X124.542 Y51.794 E.3144
G2 X124.661 Y52.209 I2.129 J-.388 E.01288
G1 X117.619 Y59.251 E.29691
G1 X118.153 Y59.251 E.01592
G1 X124.822 Y52.581 E.28121
G2 X125.016 Y52.921 I1.795 J-.802 E.01168
G1 X118.687 Y59.251 E.2669
G1 X119.221 Y59.251 E.01592
G1 X125.241 Y53.23 E.25385
G2 X125.494 Y53.511 I1.528 J-1.124 E.01129
G1 X119.754 Y59.251 E.24202
G1 X120.288 Y59.251 E.01592
G1 X125.776 Y53.763 E.23138
G2 X126.086 Y53.987 I1.271 J-1.439 E.01142
G1 X120.822 Y59.251 E.22196
G1 X121.356 Y59.251 E.01592
G1 X126.427 Y54.18 E.21382
G2 X126.8 Y54.34 I.987 J-1.787 E.01214
G1 X121.89 Y59.251 E.20707
G1 X122.423 Y59.251 E.01592
G1 X127.211 Y54.463 E.20188
G2 X127.675 Y54.533 I.582 J-2.288 E.01401
G1 X122.957 Y59.251 E.19893
G1 X123.491 Y59.251 E.01592
G1 X128.198 Y54.543 E.19848
G2 X128.825 Y54.45 I-.253 J-3.857 E.01892
G1 X124.025 Y59.251 E.20241
G1 X124.558 Y59.251 E.01592
G1 X141.06 Y42.749 E.69578
G1 X141.593 Y42.749 E.01592
G1 X125.092 Y59.251 E.69578
G1 X125.626 Y59.251 E.01592
G1 X142.127 Y42.749 E.69578
G1 X142.661 Y42.749 E.01592
G1 X126.16 Y59.251 E.69578
G1 X126.694 Y59.251 E.01592
G1 X143.195 Y42.749 E.69578
G1 X143.729 Y42.749 E.01592
G1 X127.227 Y59.251 E.69578
G1 X127.761 Y59.251 E.01592
G1 X144.262 Y42.749 E.69578
G1 X144.796 Y42.749 E.01592
G1 X128.295 Y59.251 E.69578
G1 X128.829 Y59.251 E.01592
G1 X145.33 Y42.749 E.69578
G1 X145.864 Y42.749 E.01592
G1 X129.363 Y59.251 E.69578
G1 X129.896 Y59.251 E.01592
G1 X146.398 Y42.749 E.69578
G1 X146.931 Y42.749 E.01592
G1 X130.43 Y59.251 E.69578
G1 X130.964 Y59.251 E.01592
G1 X147.465 Y42.749 E.69578
G1 X147.999 Y42.749 E.01592
G1 X131.498 Y59.251 E.69578
G1 X132.032 Y59.251 E.01592
G1 X148.533 Y42.749 E.69578
G1 X149.067 Y42.749 E.01592
G1 X132.565 Y59.251 E.69578
G1 X133.099 Y59.251 E.01592
G1 X149.6 Y42.749 E.69578
G1 X150.134 Y42.749 E.01592
G1 X133.633 Y59.251 E.69578
G1 X134.167 Y59.251 E.01592
G1 X150.668 Y42.749 E.69578
G1 X151.202 Y42.749 E.01592
G1 X134.701 Y59.251 E.69578
G1 X135.234 Y59.251 E.01592
G1 X151.735 Y42.749 E.69578
G1 X152.269 Y42.749 E.01592
G1 X135.768 Y59.251 E.69578
G1 X136.302 Y59.251 E.01592
G1 X152.803 Y42.749 E.69578
G1 X153.337 Y42.749 E.01592
G1 X136.836 Y59.251 E.69578
G1 X137.37 Y59.251 E.01592
G1 X153.871 Y42.749 E.69578
G1 X154.404 Y42.749 E.01592
G1 X137.903 Y59.251 E.69578
G1 X138.437 Y59.251 E.01592
G1 X154.938 Y42.749 E.69578
G1 X155.472 Y42.749 E.01592
G1 X138.971 Y59.251 E.69578
G1 X139.505 Y59.251 E.01592
G1 X156.006 Y42.749 E.69578
G1 X156.54 Y42.749 E.01592
G1 X140.039 Y59.251 E.69578
G1 X140.572 Y59.251 E.01592
G1 X157.073 Y42.749 E.69578
G1 X157.607 Y42.749 E.01592
G1 X141.106 Y59.251 E.69578
G1 X141.64 Y59.251 E.01592
G1 X158.141 Y42.749 E.69578
G1 X158.675 Y42.749 E.01592
G1 X142.174 Y59.251 E.69578
G1 X142.708 Y59.251 E.01592
G1 X159.209 Y42.749 E.69578
G1 X159.742 Y42.749 E.01592
G1 X143.241 Y59.251 E.69578
G1 X143.775 Y59.251 E.01592
G1 X160.276 Y42.749 E.69578
G1 X160.81 Y42.749 E.01592
G1 X144.309 Y59.251 E.69578
G1 X144.843 Y59.251 E.01592
G1 X161.344 Y42.749 E.69578
G1 X161.878 Y42.749 E.01592
G1 X145.377 Y59.251 E.69578
G1 X145.91 Y59.251 E.01592
G1 X162.411 Y42.749 E.69578
G1 X162.945 Y42.749 E.01592
G1 X146.444 Y59.251 E.69578
G1 X146.978 Y59.251 E.01592
G1 X163.479 Y42.749 E.69578
G1 X164.013 Y42.749 E.01592
G1 X147.512 Y59.251 E.69578
G1 X148.045 Y59.251 E.01592
G1 X164.547 Y42.749 E.69578
M73 P67 R21
G1 X165.08 Y42.749 E.01592
G1 X148.579 Y59.251 E.69578
G1 X149.113 Y59.251 E.01592
G1 X165.614 Y42.749 E.69578
G1 X166.148 Y42.749 E.01592
G1 X149.647 Y59.251 E.69578
G1 X150.181 Y59.251 E.01592
G1 X166.682 Y42.749 E.69578
G1 X167.216 Y42.749 E.01592
G1 X150.714 Y59.251 E.69578
M73 P68 R21
G1 X151.248 Y59.251 E.01592
G1 X167.749 Y42.749 E.69578
G1 X168.283 Y42.749 E.01592
G1 X151.782 Y59.251 E.69578
G1 X152.316 Y59.251 E.01592
G1 X168.817 Y42.749 E.69578
G1 X169.351 Y42.749 E.01592
G1 X152.85 Y59.251 E.69578
G1 X153.383 Y59.251 E.01592
G1 X169.885 Y42.749 E.69578
G1 X170.418 Y42.749 E.01592
G1 X153.917 Y59.251 E.69578
G1 X154.451 Y59.251 E.01592
G1 X170.952 Y42.749 E.69578
G1 X171.486 Y42.749 E.01592
G1 X154.985 Y59.251 E.69578
G1 X155.519 Y59.251 E.01592
G1 X172.02 Y42.749 E.69578
G1 X172.553 Y42.749 E.01592
G1 X156.052 Y59.251 E.69578
G1 X156.586 Y59.251 E.01592
G1 X173.087 Y42.749 E.69578
G1 X173.621 Y42.749 E.01592
G1 X157.12 Y59.251 E.69578
G1 X157.654 Y59.251 E.01592
G1 X174.155 Y42.749 E.69578
G1 X174.689 Y42.749 E.01592
G1 X158.188 Y59.251 E.69578
G1 X158.721 Y59.251 E.01592
G1 X175.222 Y42.749 E.69578
G1 X175.756 Y42.749 E.01592
G1 X159.255 Y59.251 E.69578
G1 X159.789 Y59.251 E.01592
G1 X176.29 Y42.749 E.69578
G1 X176.824 Y42.749 E.01592
G1 X160.323 Y59.251 E.69578
G1 X160.857 Y59.251 E.01592
G1 X177.358 Y42.749 E.69578
G1 X177.891 Y42.749 E.01592
G1 X161.39 Y59.251 E.69578
G1 X161.924 Y59.251 E.01592
G1 X178.425 Y42.749 E.69578
G1 X178.959 Y42.749 E.01592
G1 X162.458 Y59.251 E.69578
G1 X162.992 Y59.251 E.01592
G1 X179.493 Y42.749 E.69578
G1 X180.027 Y42.749 E.01592
G1 X163.526 Y59.251 E.69578
G1 X164.059 Y59.251 E.01592
G1 X180.56 Y42.749 E.69578
G1 X181.094 Y42.749 E.01592
G1 X164.593 Y59.251 E.69578
G1 X165.127 Y59.251 E.01592
G1 X181.628 Y42.749 E.69578
G1 X182.162 Y42.749 E.01592
G1 X165.661 Y59.251 E.69578
G1 X166.195 Y59.251 E.01592
G1 X182.696 Y42.749 E.69578
G1 X183.229 Y42.749 E.01592
G1 X166.728 Y59.251 E.69578
G1 X167.262 Y59.251 E.01592
G1 X183.763 Y42.749 E.69578
G1 X184.297 Y42.749 E.01592
G1 X167.796 Y59.251 E.69578
G1 X168.33 Y59.251 E.01592
G1 X184.831 Y42.749 E.69578
G1 X185.365 Y42.749 E.01592
G1 X168.863 Y59.251 E.69578
G1 X169.397 Y59.251 E.01592
G1 X185.898 Y42.749 E.69578
G1 X186.432 Y42.749 E.01592
G1 X169.931 Y59.251 E.69578
G1 X170.465 Y59.251 E.01592
G1 X186.966 Y42.749 E.69578
G1 X187.5 Y42.749 E.01592
G1 X170.999 Y59.251 E.69578
G1 X171.532 Y59.251 E.01592
G1 X188.034 Y42.749 E.69578
G1 X188.567 Y42.749 E.01592
G1 X172.066 Y59.251 E.69578
G1 X172.6 Y59.251 E.01592
G1 X189.101 Y42.749 E.69578
G1 X189.635 Y42.749 E.01592
G1 X173.134 Y59.251 E.69578
G1 X173.668 Y59.251 E.01592
G1 X190.169 Y42.749 E.69578
G1 X190.703 Y42.749 E.01592
G1 X174.201 Y59.251 E.69578
G1 X174.735 Y59.251 E.01592
G1 X191.236 Y42.749 E.69578
G1 X191.77 Y42.749 E.01592
G1 X175.269 Y59.251 E.69578
G1 X175.803 Y59.251 E.01592
G1 X192.304 Y42.749 E.69578
G1 X192.838 Y42.749 E.01592
G1 X176.337 Y59.251 E.69578
G1 X176.87 Y59.251 E.01592
G1 X193.371 Y42.749 E.69578
G1 X193.905 Y42.749 E.01592
G1 X177.404 Y59.251 E.69578
G1 X177.938 Y59.251 E.01592
G1 X194.439 Y42.749 E.69578
G1 X194.973 Y42.749 E.01592
G1 X178.472 Y59.251 E.69578
G1 X179.006 Y59.251 E.01592
G1 X195.507 Y42.749 E.69578
G1 X196.04 Y42.749 E.01592
G1 X179.539 Y59.251 E.69578
G1 X180.073 Y59.251 E.01592
G1 X196.574 Y42.749 E.69578
G1 X197.108 Y42.749 E.01592
G1 X180.607 Y59.251 E.69578
G1 X181.141 Y59.251 E.01592
G1 X197.642 Y42.749 E.69578
G1 X198.176 Y42.749 E.01592
G1 X181.675 Y59.251 E.69578
G1 X182.208 Y59.251 E.01592
G1 X198.709 Y42.749 E.69578
G1 X199.243 Y42.749 E.01592
G1 X182.742 Y59.251 E.69578
G1 X183.276 Y59.251 E.01592
G1 X199.777 Y42.749 E.69578
G1 X200.311 Y42.749 E.01592
G1 X183.81 Y59.251 E.69578
G1 X184.344 Y59.251 E.01592
G1 X200.845 Y42.749 E.69578
G1 X201.378 Y42.749 E.01592
G1 X184.877 Y59.251 E.69578
G1 X185.411 Y59.251 E.01592
G1 X201.912 Y42.749 E.69578
G1 X202.446 Y42.749 E.01592
G1 X185.775 Y59.42 E.70294
G1 X47.58 Y54.025 F30000
G1 F9537.687
G1 X58.855 Y42.749 E.47544
G1 X58.321 Y42.749 E.01592
G1 X47.749 Y53.321 E.44577
G1 X47.749 Y52.788 E.01592
G1 X57.788 Y42.749 E.42327
G1 X57.254 Y42.749 E.01592
G1 X47.749 Y52.254 E.40076
G1 X47.749 Y51.72 E.01592
G1 X56.72 Y42.749 E.37825
G1 X56.186 Y42.749 E.01592
G1 X47.749 Y51.186 E.35574
G1 X47.749 Y50.652 E.01592
G1 X55.652 Y42.749 E.33323
G1 X55.119 Y42.749 E.01592
G1 X47.749 Y50.119 E.31073
G1 X47.749 Y49.585 E.01592
G1 X54.585 Y42.749 E.28822
G1 X54.051 Y42.749 E.01592
G1 X47.749 Y49.051 E.26571
G1 X47.749 Y48.517 E.01592
G1 X53.517 Y42.749 E.2432
G1 X52.983 Y42.749 E.01592
G1 X47.749 Y47.983 E.22069
G1 X47.749 Y47.45 E.01592
G1 X52.45 Y42.749 E.19819
G1 X51.916 Y42.749 E.01592
G1 X47.749 Y46.916 E.17568
G1 X47.749 Y46.382 E.01592
G1 X51.382 Y42.749 E.15317
G1 X50.848 Y42.749 E.01592
G1 X47.749 Y45.848 E.13066
G1 X47.749 Y45.314 E.01592
G1 X50.314 Y42.749 E.10815
G1 X49.781 Y42.749 E.01592
G1 X47.749 Y44.781 E.08565
G1 X47.749 Y44.247 E.01592
G1 X49.247 Y42.749 E.06314
G1 X48.713 Y42.749 E.01592
G1 X47.749 Y43.713 E.04063
G1 X47.749 Y43.179 E.01592
G1 X48.349 Y42.58 E.02528
G1 X69.167 Y42.58 F30000
G1 F9537.687
G1 X59.185 Y52.562 E.42089
G2 X59.472 Y51.741 I-3.348 J-1.63 E.02597
G1 X68.463 Y42.749 E.37914
G1 X67.93 Y42.749 E.01592
G1 X59.545 Y51.134 E.35355
G2 X59.529 Y50.616 I-4.483 J-.125 E.01547
G1 X67.396 Y42.749 E.3317
G1 X66.862 Y42.749 E.01592
G1 X59.448 Y50.164 E.31264
G2 X59.322 Y49.756 I-2.107 J.424 E.01276
G1 X66.328 Y42.749 E.29543
G1 X65.794 Y42.749 E.01592
G1 X59.159 Y49.385 E.27978
G2 X58.963 Y49.047 I-1.785 J.808 E.01167
G1 X65.261 Y42.749 E.26553
G1 X64.727 Y42.749 E.01592
G1 X58.737 Y48.739 E.25255
G2 X58.482 Y48.46 I-1.521 J1.135 E.01128
G1 X64.193 Y42.749 E.2408
G1 X63.659 Y42.749 E.01592
G1 X58.198 Y48.211 E.2303
G2 X57.884 Y47.991 I-1.256 J1.461 E.01145
G1 X63.126 Y42.749 E.22103
G1 X62.592 Y42.749 E.01592
G1 X57.539 Y47.803 E.21307
G2 X57.16 Y47.648 I-.963 J1.814 E.01222
G1 X62.058 Y42.749 E.20653
G1 X61.524 Y42.749 E.01592
G1 X56.743 Y47.531 E.20162
G2 X56.28 Y47.46 I-.586 J2.275 E.01398
G1 X60.99 Y42.749 E.19863
G1 X60.457 Y42.749 E.01592
G1 X55.744 Y47.462 E.19871
G2 X55.105 Y47.567 I.268 J3.632 E.01932
G1 X59.923 Y42.749 E.20313
G1 X59.389 Y42.749 E.01592
G1 X47.749 Y54.389 E.49079
G1 X47.749 Y54.923 E.01592
G1 X52.562 Y50.11 E.20294
G2 X52.461 Y50.745 I4.611 J1.065 E.01921
G1 X47.749 Y55.457 E.19865
G1 X47.749 Y55.99 E.01592
G1 X52.463 Y51.277 E.19874
G2 X52.531 Y51.742 I2.358 J-.108 E.01405
G1 X47.749 Y56.524 E.20162
G1 X47.749 Y57.058 E.01592
G1 X52.646 Y52.161 E.20647
G2 X52.8 Y52.541 I1.975 J-.58 E.01223
G1 X47.749 Y57.592 E.21297
G1 X47.749 Y58.125 E.01592
G1 X52.991 Y52.884 E.22102
G2 X53.212 Y53.196 I1.672 J-.949 E.01144
G1 X47.749 Y58.659 E.23035
G1 X47.749 Y59.193 E.01592
G1 X53.462 Y53.48 E.24089
G2 X53.741 Y53.735 I1.413 J-1.261 E.01128
G1 X47.749 Y59.727 E.25263
G1 X47.749 Y60.261 E.01592
G1 X54.048 Y53.962 E.26559
G2 X54.385 Y54.158 I1.151 J-1.588 E.01166
G1 X47.749 Y60.794 E.27981
G1 X47.749 Y61.328 E.01592
G1 X54.756 Y54.322 E.29542
G2 X55.162 Y54.449 I.839 J-1.971 E.01273
G1 X47.749 Y61.862 E.31257
G1 X47.749 Y62.396 E.01592
G1 X55.617 Y54.528 E.33174
G2 X56.134 Y54.545 I.341 J-2.57 E.01546
G1 X47.749 Y62.93 E.35355
G1 X47.749 Y63.463 E.01592
G1 X56.744 Y54.469 E.37928
G2 X57.558 Y54.189 I-.781 J-3.593 E.02572
G1 X47.749 Y63.997 E.41359
G1 X47.749 Y64.531 E.01592
G1 X69.531 Y42.749 E.91844
G1 X70.065 Y42.749 E.01592
G1 X47.749 Y65.065 E.94095
G1 X47.749 Y65.599 E.01592
G1 X70.599 Y42.749 E.96346
G1 X71.132 Y42.749 E.01592
G1 X47.749 Y66.132 E.98596
G1 X47.749 Y66.666 E.01592
G1 X71.666 Y42.749 E1.00847
G1 X72.2 Y42.749 E.01592
G1 X47.749 Y67.2 E1.03098
G1 X47.749 Y67.734 E.01592
G1 X72.734 Y42.749 E1.05349
G1 X73.268 Y42.749 E.01592
G1 X47.749 Y68.268 E1.076
G1 X47.749 Y68.801 E.01592
G1 X73.801 Y42.749 E1.0985
G1 X74.335 Y42.749 E.01592
G1 X47.749 Y69.335 E1.12101
G1 X47.749 Y69.869 E.01592
G1 X74.869 Y42.749 E1.14352
G1 X75.403 Y42.749 E.01592
G1 X47.749 Y70.403 E1.16603
G1 X47.749 Y70.937 E.01592
G1 X75.937 Y42.749 E1.18854
G1 X76.47 Y42.749 E.01592
G1 X47.749 Y71.47 E1.21105
G1 X47.749 Y72.004 E.01592
G1 X77.004 Y42.749 E1.23355
G1 X77.538 Y42.749 E.01592
G1 X47.749 Y72.538 E1.25606
G1 X47.749 Y73.072 E.01592
G1 X78.072 Y42.749 E1.27857
G1 X78.606 Y42.749 E.01592
G1 X47.749 Y73.606 E1.30108
G1 X47.749 Y74.139 E.01592
G1 X79.139 Y42.749 E1.32358
G1 X79.673 Y42.749 E.01592
G1 X47.749 Y74.673 E1.34609
G1 X47.749 Y75.207 E.01592
G1 X80.207 Y42.749 E1.3686
G1 X80.741 Y42.749 E.01592
G1 X47.58 Y75.91 E1.39826
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9537.687
G1 X48.994 Y74.496 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/58
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
G1 X126.597 Y198.107
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X126.679 Y198.073 E.00285
G3 X127.819 Y197.791 I1.329 J2.928 E.03798
G3 X129.175 Y198.004 I.175 J3.3 E.04448
G3 X126.395 Y198.219 I-1.167 J2.996 E.55684
G1 X126.545 Y198.136 E.00551
G1 X127.149 Y198.324 F30000
G1 F8843.478
G1 X127.375 Y198.264 E.00753
G3 X127.85 Y198.197 I.633 J2.737 E.01542
G3 X128.761 Y198.295 I.167 J2.73 E.02962
G3 X127.093 Y198.345 I-.752 J2.706 E.51303
G1 X127.578 Y198.642 F30000
G1 F8843.478
G1 X127.88 Y198.602 E.00979
G3 X128.417 Y198.634 I.113 J2.694 E.01733
G3 X127.466 Y198.661 I-.407 J2.367 E.45443
G1 X127.519 Y198.652 E.00173
G1 X127.908 Y198.994 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X127.91 Y198.993 E.00004
G3 X128.349 Y199.02 I.079 J2.314 E.01313
G3 X127.553 Y199.043 I-.342 J1.979 E.35206
G1 X127.849 Y199.002 E.00889
; WIPE_START
M204 S10000
G1 X127.91 Y198.993 E-.02325
G1 X128.15 Y198.995 E-.09142
G1 X128.349 Y199.02 E-.07617
G1 X128.734 Y199.129 E-.15213
G1 X129.091 Y199.311 E-.15208
G1 X129.404 Y199.561 E-.15213
G1 X129.594 Y199.788 E-.11281
; WIPE_END
G1 E-.04 F1800
G1 X121.964 Y199.617 Z3 F30000
G1 X54.597 Y198.107 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X54.679 Y198.073 E.00286
G3 X55.819 Y197.791 I1.329 J2.928 E.03798
G3 X57.176 Y198.004 I.175 J3.301 E.04448
G3 X54.395 Y198.219 I-1.167 J2.996 E.55683
G1 X54.545 Y198.136 E.00551
G1 X55.149 Y198.324 F30000
G1 F8843.478
G1 X55.376 Y198.264 E.00754
G3 X55.85 Y198.196 I.633 J2.737 E.01542
G3 X56.761 Y198.295 I.167 J2.73 E.02962
G3 X55.093 Y198.345 I-.752 J2.706 E.51303
G1 X55.578 Y198.642 F30000
G1 F8843.478
G1 X55.88 Y198.602 E.0098
G3 X56.417 Y198.634 I.112 J2.695 E.01732
G3 X55.466 Y198.661 I-.407 J2.367 E.45443
G1 X55.519 Y198.652 E.00172
G1 X55.908 Y198.994 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X55.91 Y198.993 E.00004
G3 X56.349 Y199.02 I.079 J2.314 E.01313
G3 X55.553 Y199.043 I-.342 J1.979 E.35206
G1 X55.849 Y199.002 E.00889
; WIPE_START
M204 S10000
G1 X55.91 Y198.993 E-.02326
G1 X56.15 Y198.995 E-.09143
G1 X56.349 Y199.02 E-.07617
G1 X56.734 Y199.129 E-.15213
G1 X57.091 Y199.311 E-.15208
G1 X57.404 Y199.561 E-.15216
G1 X57.594 Y199.788 E-.11277
; WIPE_END
G1 E-.04 F1800
G1 X57.683 Y192.156 Z3 F30000
G1 X58.43 Y128.106 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X58.249 Y128.306 E.00866
G3 X55.819 Y122.791 I-2.241 J-2.306 E.39846
G3 X57.176 Y123.004 I.174 J3.301 E.04448
G3 X58.473 Y128.065 I-1.168 J2.996 E.19606
G1 X58.13 Y127.832 F30000
G1 F8843.478
G1 X57.966 Y128.016 E.00792
G3 X55.85 Y123.196 I-1.957 J-2.015 E.34828
G3 X56.761 Y123.295 I.167 J2.731 E.02961
G3 X58.173 Y127.791 I-.752 J2.706 E.1798
G1 X57.832 Y127.537 F30000
G1 F8843.478
G1 X57.682 Y127.724 E.00772
G3 X55.88 Y123.602 I-1.672 J-1.724 E.29791
G3 X56.417 Y123.634 I.112 J2.696 E.01732
G3 X57.991 Y127.358 I-.407 J2.367 E.15452
G1 X57.871 Y127.492 E.00579
G1 X57.512 Y127.32 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X57.255 Y127.574 E.01077
G3 X55.91 Y123.993 I-1.248 J-1.574 E.22515
G3 X56.349 Y124.02 I.079 J2.314 E.01314
G3 X57.556 Y127.279 I-.342 J1.979 E.12507
; WIPE_START
M204 S10000
G1 X57.255 Y127.574 E-.15999
G1 X56.917 Y127.789 E-.15225
G1 X56.544 Y127.935 E-.15212
G1 X56.15 Y128.005 E-.15211
G1 X55.95 Y128.01 E-.07614
G1 X55.773 Y127.996 E-.06739
; WIPE_END
G1 E-.04 F1800
G1 X62.668 Y131.271 Z3 F30000
G1 X191.416 Y192.416 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X64.584 Y192.416 E4.07847
G1 X64.584 Y59.584 E4.27141
G1 X191.416 Y59.584 E4.07847
G1 X191.416 Y192.356 E4.26948
G1 X191.009 Y192.009 F30000
G1 F8843.478
G1 X64.991 Y192.009 E4.05229
G1 X64.991 Y59.991 E4.24523
G1 X191.009 Y59.991 E4.05229
G1 X191.009 Y191.949 E4.2433
G1 X190.602 Y191.602 F30000
G1 F8843.478
G1 X65.398 Y191.602 E4.02611
G1 X65.398 Y60.398 E4.21905
G1 X190.602 Y60.398 E4.02611
G1 X190.602 Y191.542 E4.21712
G1 X190.21 Y191.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X65.79 Y191.21 E3.70605
G1 X65.79 Y60.79 E3.88477
G1 X190.21 Y60.79 E3.70605
G1 X190.21 Y191.15 E3.88298
; WIPE_START
M204 S10000
G1 X188.21 Y191.151 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X183.055 Y185.522 Z3 F30000
G1 X57.075 Y47.971 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X57.176 Y48.004 E.00342
G3 X55.819 Y47.791 I-1.167 J2.996 E.60512
G3 X56.871 Y47.904 I.174 J3.301 E.03416
G1 X57.018 Y47.952 E.00496
G1 X56.63 Y48.265 F30000
G1 F8843.478
G1 X56.761 Y48.295 E.00432
G3 X55.85 Y48.196 I-.752 J2.706 E.53791
G3 X56.488 Y48.232 I.167 J2.731 E.0206
G1 X56.572 Y48.251 E.00277
G1 X56.237 Y48.611 F30000
G1 F8843.478
G1 X56.417 Y48.634 E.00585
G3 X55.88 Y48.602 I-.407 J2.366 E.46775
G3 X56.177 Y48.606 I.112 J2.696 E.00954
G1 X55.917 Y48.993 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X56.15 Y48.998 E.00695
G3 X56.349 Y49.02 I-.162 J2.312 E.00597
G3 X55.857 Y48.997 I-.342 J1.979 E.36121
; WIPE_START
M204 S10000
G1 X56.15 Y48.998 E-.11144
G1 X56.349 Y49.02 E-.07614
G1 X56.544 Y49.065 E-.07613
G1 X56.917 Y49.211 E-.15213
G1 X57.253 Y49.428 E-.1521
G1 X57.54 Y49.708 E-.15213
G1 X57.599 Y49.795 E-.03993
; WIPE_END
G1 E-.04 F1800
G1 X65.229 Y49.608 Z3 F30000
G1 X126.597 Y48.107 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X126.679 Y48.073 E.00285
G3 X127.819 Y47.791 I1.329 J2.928 E.03799
G3 X129.176 Y48.004 I.174 J3.301 E.04448
G3 X126.395 Y48.219 I-1.167 J2.996 E.55684
G1 X126.545 Y48.136 E.00552
G1 X127.149 Y48.323 F30000
G1 F8843.478
M73 P69 R21
G1 X127.376 Y48.264 E.00753
G3 X127.85 Y48.196 I.633 J2.737 E.01542
G3 X128.761 Y48.295 I.167 J2.731 E.02961
G3 X127.093 Y48.345 I-.752 J2.706 E.51304
G1 X127.579 Y48.642 F30000
G1 F8843.478
G1 X127.88 Y48.602 E.00979
G3 X128.417 Y48.634 I.112 J2.696 E.01732
G3 X127.466 Y48.661 I-.407 J2.366 E.45428
G1 X127.519 Y48.652 E.00173
G1 X127.917 Y48.993 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.15 Y48.998 E.00694
G3 X128.349 Y49.02 I-.162 J2.311 E.00597
G3 X127.857 Y48.997 I-.342 J1.979 E.36122
; WIPE_START
M204 S10000
G1 X128.15 Y48.998 E-.11127
G1 X128.349 Y49.02 E-.07614
G1 X128.544 Y49.065 E-.07613
G1 X128.917 Y49.211 E-.15213
G1 X129.253 Y49.428 E-.15209
G1 X129.54 Y49.708 E-.15214
G1 X129.599 Y49.795 E-.0401
; WIPE_END
G1 E-.04 F1800
G1 X137.229 Y49.6 Z3 F30000
G1 X201.075 Y47.971 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X201.176 Y48.004 E.00342
G3 X199.819 Y47.791 I-1.168 J2.996 E.60512
G3 X200.871 Y47.904 I.174 J3.301 E.03416
G1 X201.018 Y47.952 E.00496
G1 X200.63 Y48.265 F30000
G1 F8843.478
G1 X200.761 Y48.295 E.00432
G3 X199.85 Y48.196 I-.752 J2.706 E.53792
G3 X200.488 Y48.232 I.167 J2.731 E.0206
G1 X200.572 Y48.251 E.00276
G1 X200.237 Y48.611 F30000
G1 F8843.478
G1 X200.417 Y48.634 E.00585
G3 X199.88 Y48.602 I-.407 J2.366 E.46775
G3 X200.177 Y48.606 I.112 J2.697 E.00954
G1 X199.916 Y48.993 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X200.15 Y48.998 E.00696
G3 X200.349 Y49.02 I-.162 J2.311 E.00597
G3 X199.857 Y48.997 I-.342 J1.979 E.36121
; WIPE_START
M204 S10000
G1 X200.15 Y48.998 E-.11147
G1 X200.349 Y49.02 E-.07614
G1 X200.544 Y49.065 E-.07613
G1 X200.917 Y49.211 E-.15213
G1 X201.253 Y49.428 E-.15214
G1 X201.54 Y49.708 E-.15209
G1 X201.599 Y49.795 E-.03989
; WIPE_END
G1 E-.04 F1800
G1 X201.544 Y57.427 Z3 F30000
G1 X201.075 Y122.971 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X201.176 Y123.004 E.00342
G3 X199.819 Y122.791 I-1.167 J2.996 E.60511
G3 X200.871 Y122.904 I.174 J3.301 E.03416
G1 X201.018 Y122.952 E.00496
G1 X200.63 Y123.265 F30000
G1 F8843.478
G1 X200.761 Y123.295 E.00431
G3 X199.85 Y123.196 I-.752 J2.706 E.53791
G3 X200.488 Y123.232 I.167 J2.731 E.0206
G1 X200.572 Y123.251 E.00277
G1 X200.237 Y123.611 F30000
G1 F8843.478
G1 X200.417 Y123.634 E.00585
G3 X199.88 Y123.602 I-.407 J2.366 E.46775
G3 X200.177 Y123.606 I.112 J2.696 E.00954
G1 X199.917 Y123.993 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X200.15 Y123.998 E.00695
G3 X200.349 Y124.02 I-.161 J2.31 E.00597
G3 X199.857 Y123.997 I-.342 J1.979 E.36121
; WIPE_START
M204 S10000
G1 X200.15 Y123.998 E-.11144
G1 X200.349 Y124.02 E-.07614
G1 X200.734 Y124.129 E-.15212
G1 X201.091 Y124.311 E-.15212
G1 X201.404 Y124.561 E-.15213
G1 X201.6 Y124.795 E-.11606
; WIPE_END
G1 E-.04 F1800
G1 X201.288 Y132.421 Z3 F30000
G1 X198.597 Y198.108 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X198.679 Y198.073 E.00287
G3 X199.819 Y197.791 I1.329 J2.928 E.03798
G3 X201.176 Y198.004 I.175 J3.3 E.04448
G3 X198.394 Y198.219 I-1.167 J2.996 E.55683
G1 X198.545 Y198.137 E.00551
G1 X199.149 Y198.324 F30000
G1 F8843.478
G1 X199.376 Y198.264 E.00754
G3 X199.85 Y198.196 I.633 J2.737 E.01542
G3 X200.761 Y198.295 I.167 J2.731 E.02962
G3 X199.093 Y198.345 I-.752 J2.706 E.51303
G1 X199.578 Y198.642 F30000
G1 F8843.478
G1 X199.88 Y198.602 E.0098
G3 X200.417 Y198.634 I.112 J2.695 E.01732
G3 X199.466 Y198.661 I-.407 J2.367 E.45443
G1 X199.519 Y198.652 E.00172
G1 X199.91 Y198.993 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X200.15 Y198.998 E.00714
G3 X200.349 Y199.02 I-.161 J2.31 E.00597
G3 X199.851 Y198.997 I-.342 J1.979 E.36103
; WIPE_START
M204 S10000
G1 X200.15 Y198.998 E-.11379
G1 X200.349 Y199.02 E-.07613
G1 X200.734 Y199.129 E-.15214
G1 X201.091 Y199.311 E-.15207
G1 X201.404 Y199.561 E-.15216
G1 X201.596 Y199.79 E-.11371
; WIPE_END
G1 E-.04 F1800
G1 X206.029 Y206.003 Z3 F30000
G1 X208.584 Y209.584 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X47.416 Y209.584 E5.18256
G1 X47.416 Y42.416 E5.3755
G1 X208.584 Y42.416 E5.18256
G1 X208.584 Y209.524 E5.37357
G1 X208.991 Y209.991 F30000
G1 F8843.478
G1 X47.009 Y209.991 E5.20874
G1 X47.009 Y42.009 E5.40168
G1 X208.991 Y42.009 E5.20874
G1 X208.991 Y209.931 E5.39975
G1 X209.398 Y210.398 F30000
G1 F8843.478
G1 X46.602 Y210.398 E5.23492
G1 X46.602 Y41.602 E5.42786
G1 X209.398 Y41.602 E5.23492
G1 X209.398 Y210.338 E5.42593
G1 X209.79 Y210.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X46.21 Y210.79 E4.87249
G1 X46.21 Y41.21 E5.05121
G1 X209.79 Y41.21 E4.87249
G1 X209.79 Y210.73 E5.04942
; WIPE_START
M204 S10000
G1 X207.79 Y210.731 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X202.616 Y209.42 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42037
G1 F9537.687
G1 X185.945 Y192.749 E.70294
G1 X185.411 Y192.749 E.01592
G1 X201.912 Y209.251 E.69578
G1 X201.378 Y209.251 E.01592
G1 X184.877 Y192.749 E.69578
G1 X184.344 Y192.749 E.01592
G1 X200.845 Y209.251 E.69578
G1 X200.311 Y209.251 E.01592
G1 X183.81 Y192.749 E.69578
G1 X183.276 Y192.749 E.01592
G1 X199.777 Y209.251 E.69578
G1 X199.243 Y209.251 E.01592
G1 X182.742 Y192.749 E.69578
G1 X182.208 Y192.749 E.01592
G1 X198.709 Y209.251 E.69578
G1 X198.176 Y209.251 E.01592
G1 X181.675 Y192.749 E.69578
G1 X181.141 Y192.749 E.01592
G1 X197.642 Y209.251 E.69578
G1 X197.108 Y209.251 E.01592
G1 X180.607 Y192.749 E.69578
G1 X180.073 Y192.749 E.01592
G1 X196.574 Y209.251 E.69578
G1 X196.04 Y209.251 E.01592
G1 X179.539 Y192.749 E.69578
G1 X179.006 Y192.749 E.01592
G1 X195.507 Y209.251 E.69578
G1 X194.973 Y209.251 E.01592
G1 X178.472 Y192.749 E.69578
G1 X177.938 Y192.749 E.01592
G1 X194.439 Y209.251 E.69578
G1 X193.905 Y209.251 E.01592
G1 X177.404 Y192.749 E.69578
G1 X176.87 Y192.749 E.01592
G1 X193.371 Y209.251 E.69578
M73 P69 R20
G1 X192.838 Y209.251 E.01592
G1 X176.337 Y192.749 E.69578
G1 X175.803 Y192.749 E.01592
G1 X192.304 Y209.251 E.69578
G1 X191.77 Y209.251 E.01592
G1 X175.269 Y192.749 E.69578
G1 X174.735 Y192.749 E.01592
G1 X191.236 Y209.251 E.69578
G1 X190.702 Y209.251 E.01592
G1 X174.201 Y192.749 E.69578
G1 X173.668 Y192.749 E.01592
G1 X190.169 Y209.251 E.69578
G1 X189.635 Y209.251 E.01592
G1 X173.134 Y192.749 E.69578
G1 X172.6 Y192.749 E.01592
G1 X189.101 Y209.251 E.69578
G1 X188.567 Y209.251 E.01592
G1 X172.066 Y192.749 E.69578
G1 X171.532 Y192.749 E.01592
G1 X188.034 Y209.251 E.69578
G1 X187.5 Y209.251 E.01592
G1 X170.999 Y192.749 E.69578
G1 X170.465 Y192.749 E.01592
G1 X186.966 Y209.251 E.69578
G1 X186.432 Y209.251 E.01592
G1 X169.931 Y192.749 E.69578
G1 X169.397 Y192.749 E.01592
G1 X185.898 Y209.251 E.69578
G1 X185.365 Y209.251 E.01592
G1 X168.863 Y192.749 E.69578
G1 X168.33 Y192.749 E.01592
G1 X184.831 Y209.251 E.69578
G1 X184.297 Y209.251 E.01592
G1 X167.796 Y192.749 E.69578
G1 X167.262 Y192.749 E.01592
G1 X183.763 Y209.251 E.69578
G1 X183.229 Y209.251 E.01592
G1 X166.728 Y192.749 E.69578
G1 X166.194 Y192.749 E.01592
G1 X182.696 Y209.251 E.69578
G1 X182.162 Y209.251 E.01592
G1 X165.661 Y192.749 E.69578
G1 X165.127 Y192.749 E.01592
G1 X181.628 Y209.251 E.69578
G1 X181.094 Y209.251 E.01592
G1 X164.593 Y192.749 E.69578
G1 X164.059 Y192.749 E.01592
G1 X180.56 Y209.251 E.69578
G1 X180.027 Y209.251 E.01592
G1 X163.526 Y192.749 E.69578
G1 X162.992 Y192.749 E.01592
G1 X179.493 Y209.251 E.69578
G1 X178.959 Y209.251 E.01592
G1 X162.458 Y192.749 E.69578
G1 X161.924 Y192.749 E.01592
G1 X178.425 Y209.251 E.69578
G1 X177.891 Y209.251 E.01592
G1 X161.39 Y192.749 E.69578
G1 X160.857 Y192.749 E.01592
G1 X177.358 Y209.251 E.69578
G1 X176.824 Y209.251 E.01592
G1 X160.323 Y192.749 E.69578
G1 X159.789 Y192.749 E.01592
G1 X176.29 Y209.251 E.69578
G1 X175.756 Y209.251 E.01592
G1 X159.255 Y192.749 E.69578
G1 X158.721 Y192.749 E.01592
G1 X175.222 Y209.251 E.69578
G1 X174.689 Y209.251 E.01592
G1 X158.188 Y192.749 E.69578
G1 X157.654 Y192.749 E.01592
G1 X174.155 Y209.251 E.69578
G1 X173.621 Y209.251 E.01592
G1 X157.12 Y192.749 E.69578
G1 X156.586 Y192.749 E.01592
G1 X173.087 Y209.251 E.69578
G1 X172.553 Y209.251 E.01592
G1 X156.052 Y192.749 E.69578
G1 X155.519 Y192.749 E.01592
G1 X172.02 Y209.251 E.69578
G1 X171.486 Y209.251 E.01592
G1 X154.985 Y192.749 E.69578
G1 X154.451 Y192.749 E.01592
G1 X170.952 Y209.251 E.69578
G1 X170.418 Y209.251 E.01592
G1 X153.917 Y192.749 E.69578
G1 X153.383 Y192.749 E.01592
G1 X169.884 Y209.251 E.69578
G1 X169.351 Y209.251 E.01592
G1 X152.85 Y192.749 E.69578
G1 X152.316 Y192.749 E.01592
G1 X168.817 Y209.251 E.69578
G1 X168.283 Y209.251 E.01592
G1 X151.782 Y192.749 E.69578
G1 X151.248 Y192.749 E.01592
G1 X167.749 Y209.251 E.69578
G1 X167.216 Y209.251 E.01592
G1 X150.714 Y192.749 E.69578
G1 X150.181 Y192.749 E.01592
G1 X166.682 Y209.251 E.69578
G1 X166.148 Y209.251 E.01592
G1 X149.647 Y192.749 E.69578
G1 X149.113 Y192.749 E.01592
G1 X165.614 Y209.251 E.69578
G1 X165.08 Y209.251 E.01592
G1 X148.579 Y192.749 E.69578
G1 X148.045 Y192.749 E.01592
G1 X164.547 Y209.251 E.69578
G1 X164.013 Y209.251 E.01592
G1 X147.512 Y192.749 E.69578
G1 X146.978 Y192.749 E.01592
G1 X163.479 Y209.251 E.69578
G1 X162.945 Y209.251 E.01592
G1 X146.444 Y192.749 E.69578
G1 X145.91 Y192.749 E.01592
G1 X162.411 Y209.251 E.69578
G1 X161.878 Y209.251 E.01592
G1 X145.376 Y192.749 E.69578
G1 X144.843 Y192.749 E.01592
G1 X161.344 Y209.251 E.69578
G1 X160.81 Y209.251 E.01592
G1 X144.309 Y192.749 E.69578
G1 X143.775 Y192.749 E.01592
G1 X160.276 Y209.251 E.69578
G1 X159.742 Y209.251 E.01592
G1 X143.241 Y192.749 E.69578
G1 X142.708 Y192.749 E.01592
G1 X159.209 Y209.251 E.69578
G1 X158.675 Y209.251 E.01592
G1 X142.174 Y192.749 E.69578
G1 X141.64 Y192.749 E.01592
G1 X158.141 Y209.251 E.69578
G1 X157.607 Y209.251 E.01592
G1 X141.106 Y192.749 E.69578
G1 X140.572 Y192.749 E.01592
G1 X157.073 Y209.251 E.69578
G1 X156.54 Y209.251 E.01592
G1 X140.039 Y192.749 E.69578
G1 X139.505 Y192.749 E.01592
G1 X156.006 Y209.251 E.69578
G1 X155.472 Y209.251 E.01592
G1 X138.971 Y192.749 E.69578
G1 X138.437 Y192.749 E.01592
G1 X154.938 Y209.251 E.69578
G1 X154.404 Y209.251 E.01592
G1 X137.903 Y192.749 E.69578
G1 X137.37 Y192.749 E.01592
G1 X153.871 Y209.251 E.69578
G1 X153.337 Y209.251 E.01592
G1 X136.836 Y192.749 E.69578
G1 X136.302 Y192.749 E.01592
G1 X152.803 Y209.251 E.69578
G1 X152.269 Y209.251 E.01592
G1 X135.768 Y192.749 E.69578
G1 X135.234 Y192.749 E.01592
G1 X151.735 Y209.251 E.69578
G1 X151.202 Y209.251 E.01592
G1 X134.701 Y192.749 E.69578
G1 X134.167 Y192.749 E.01592
G1 X150.668 Y209.251 E.69578
G1 X150.134 Y209.251 E.01592
G1 X133.633 Y192.749 E.69578
G1 X133.099 Y192.749 E.01592
G1 X149.6 Y209.251 E.69578
G1 X149.066 Y209.251 E.01592
G1 X132.565 Y192.749 E.69578
G1 X132.032 Y192.749 E.01592
G1 X148.533 Y209.251 E.69578
G1 X147.999 Y209.251 E.01592
G1 X131.498 Y192.749 E.69578
G1 X130.964 Y192.749 E.01592
G1 X147.465 Y209.251 E.69578
G1 X146.931 Y209.251 E.01592
G1 X130.43 Y192.749 E.69578
G1 X129.896 Y192.749 E.01592
G1 X146.398 Y209.251 E.69578
G1 X145.864 Y209.251 E.01592
G1 X129.363 Y192.749 E.69578
G1 X128.829 Y192.749 E.01592
G1 X145.33 Y209.251 E.69578
G1 X144.796 Y209.251 E.01592
G1 X128.295 Y192.749 E.69578
G1 X127.761 Y192.749 E.01592
G1 X144.262 Y209.251 E.69578
G1 X143.729 Y209.251 E.01592
G1 X127.227 Y192.749 E.69578
G1 X126.694 Y192.749 E.01592
G1 X143.195 Y209.251 E.69578
G1 X142.661 Y209.251 E.01592
G1 X126.16 Y192.749 E.69578
G1 X125.626 Y192.749 E.01592
G1 X142.127 Y209.251 E.69578
M73 P70 R20
G1 X141.593 Y209.251 E.01592
G1 X125.092 Y192.749 E.69578
G1 X124.558 Y192.749 E.01592
G1 X141.06 Y209.251 E.69578
G1 X140.526 Y209.251 E.01592
G1 X131.45 Y200.175 E.38267
G3 X131.542 Y200.8 I-3.514 J.832 E.01886
G1 X139.992 Y209.251 E.35631
G1 X139.458 Y209.251 E.01592
G1 X131.535 Y201.328 E.33408
G3 X131.46 Y201.786 I-5.115 J-.601 E.01386
G1 X138.924 Y209.251 E.31473
G1 X138.391 Y209.251 E.01592
G1 X131.339 Y202.199 E.29735
G3 X131.18 Y202.573 I-1.953 J-.608 E.01216
G1 X137.857 Y209.251 E.28155
G1 X137.323 Y209.251 E.01592
G1 X130.987 Y202.915 E.26716
G3 X130.764 Y203.226 I-1.669 J-.961 E.01142
G1 X136.789 Y209.251 E.25405
G1 X136.255 Y209.251 E.01592
G1 X130.512 Y203.508 E.24216
G3 X130.232 Y203.761 I-1.41 J-1.276 E.01129
G1 X135.722 Y209.251 E.23147
G1 X135.188 Y209.251 E.01592
G1 X129.923 Y203.986 E.222
G3 X129.581 Y204.178 I-1.134 J-1.614 E.01171
G1 X134.654 Y209.251 E.21389
G1 X134.12 Y209.251 E.01592
G1 X129.206 Y204.337 E.2072
G3 X128.793 Y204.457 I-.808 J-1.999 E.01285
G1 X133.586 Y209.251 E.20211
G1 X133.053 Y209.251 E.01592
G1 X128.335 Y204.533 E.19892
G3 X127.811 Y204.543 I-.34 J-4.049 E.01563
G1 X132.519 Y209.251 E.1985
G1 X131.985 Y209.251 E.01592
G1 X126.947 Y204.212 E.21244
; WIPE_START
G1 X128.361 Y205.627 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.052 Y198.025 Z3 F30000
G1 X129.072 Y197.797 Z3
G1 Z2.6
G1 E.8 F1800
G1 F9537.687
G1 X124.025 Y192.749 E.21284
G1 X123.491 Y192.749 E.01592
G1 X128.199 Y197.458 E.19853
G2 X127.675 Y197.467 I-.2 J3.451 E.01565
G1 X122.957 Y192.749 E.19893
G1 X122.423 Y192.749 E.01592
G1 X127.21 Y197.537 E.20185
G2 X126.8 Y197.66 I.41 J2.109 E.01276
G1 X121.89 Y192.749 E.20707
G1 X121.356 Y192.749 E.01592
G1 X126.427 Y197.82 E.21382
G2 X126.086 Y198.013 I.794 J1.798 E.0117
G1 X120.822 Y192.749 E.22196
G1 X120.288 Y192.749 E.01592
G1 X125.776 Y198.237 E.23138
G2 X125.494 Y198.489 I1.12 J1.533 E.01129
G1 X119.754 Y192.749 E.24202
G1 X119.221 Y192.749 E.01592
G1 X125.241 Y198.77 E.25385
G2 X125.016 Y199.079 I1.434 J1.277 E.01141
G1 X118.687 Y192.749 E.2669
G1 X118.153 Y192.749 E.01592
G1 X124.822 Y199.419 E.28121
G2 X124.661 Y199.791 I7.707 J3.558 E.0121
G1 X117.619 Y192.749 E.29692
G1 X117.085 Y192.749 E.01592
G1 X124.542 Y200.206 E.3144
G2 X124.468 Y200.666 I2.266 J.596 E.01393
G1 X116.552 Y192.749 E.33382
G1 X116.018 Y192.749 E.01592
G1 X124.454 Y201.185 E.35571
G2 X124.545 Y201.81 I3.167 J-.143 E.01886
G1 X115.484 Y192.749 E.38206
G1 X114.95 Y192.749 E.01592
G1 X131.451 Y209.251 E.69578
G1 X130.917 Y209.251 E.01592
G1 X114.416 Y192.749 E.69578
G1 X113.883 Y192.749 E.01592
G1 X130.384 Y209.251 E.69578
G1 X129.85 Y209.251 E.01592
G1 X113.349 Y192.749 E.69578
G1 X112.815 Y192.749 E.01592
G1 X129.316 Y209.251 E.69578
G1 X128.782 Y209.251 E.01592
G1 X112.281 Y192.749 E.69578
G1 X111.747 Y192.749 E.01592
G1 X128.248 Y209.251 E.69578
G1 X127.715 Y209.251 E.01592
G1 X111.214 Y192.749 E.69578
G1 X110.68 Y192.749 E.01592
G1 X127.181 Y209.251 E.69578
G1 X126.647 Y209.251 E.01592
G1 X110.146 Y192.749 E.69578
G1 X109.612 Y192.749 E.01592
G1 X126.113 Y209.251 E.69578
G1 X125.58 Y209.251 E.01592
G1 X109.078 Y192.749 E.69578
G1 X108.545 Y192.749 E.01592
G1 X125.046 Y209.251 E.69578
G1 X124.512 Y209.251 E.01592
G1 X108.011 Y192.749 E.69578
G1 X107.477 Y192.749 E.01592
G1 X123.978 Y209.251 E.69578
G1 X123.444 Y209.251 E.01592
G1 X106.943 Y192.749 E.69578
G1 X106.409 Y192.749 E.01592
G1 X122.911 Y209.251 E.69578
G1 X122.377 Y209.251 E.01592
G1 X105.876 Y192.749 E.69578
G1 X105.342 Y192.749 E.01592
G1 X121.843 Y209.251 E.69578
G1 X121.309 Y209.251 E.01592
G1 X104.808 Y192.749 E.69578
G1 X104.274 Y192.749 E.01592
G1 X120.775 Y209.251 E.69578
G1 X120.242 Y209.251 E.01592
G1 X103.74 Y192.749 E.69578
G1 X103.207 Y192.749 E.01592
G1 X119.708 Y209.251 E.69578
G1 X119.174 Y209.251 E.01592
G1 X102.673 Y192.749 E.69578
G1 X102.139 Y192.749 E.01592
G1 X118.64 Y209.251 E.69578
G1 X118.106 Y209.251 E.01592
G1 X101.605 Y192.749 E.69578
G1 X101.072 Y192.749 E.01592
G1 X117.573 Y209.251 E.69578
G1 X117.039 Y209.251 E.01592
G1 X100.538 Y192.749 E.69578
G1 X100.004 Y192.749 E.01592
G1 X116.505 Y209.251 E.69578
G1 X115.971 Y209.251 E.01592
G1 X99.47 Y192.749 E.69578
G1 X98.936 Y192.749 E.01592
G1 X115.437 Y209.251 E.69578
G1 X114.904 Y209.251 E.01592
G1 X98.403 Y192.749 E.69578
G1 X97.869 Y192.749 E.01592
G1 X114.37 Y209.251 E.69578
G1 X113.836 Y209.251 E.01592
G1 X97.335 Y192.749 E.69578
G1 X96.801 Y192.749 E.01592
G1 X113.302 Y209.251 E.69578
G1 X112.768 Y209.251 E.01592
G1 X96.267 Y192.749 E.69578
G1 X95.734 Y192.749 E.01592
G1 X112.235 Y209.251 E.69578
G1 X111.701 Y209.251 E.01592
G1 X95.2 Y192.749 E.69578
G1 X94.666 Y192.749 E.01592
G1 X111.167 Y209.251 E.69578
G1 X110.633 Y209.251 E.01592
G1 X94.132 Y192.749 E.69578
G1 X93.598 Y192.749 E.01592
G1 X110.099 Y209.251 E.69578
G1 X109.566 Y209.251 E.01592
G1 X93.065 Y192.749 E.69578
G1 X92.531 Y192.749 E.01592
G1 X109.032 Y209.251 E.69578
G1 X108.498 Y209.251 E.01592
G1 X91.997 Y192.749 E.69578
G1 X91.463 Y192.749 E.01592
G1 X107.964 Y209.251 E.69578
G1 X107.43 Y209.251 E.01592
G1 X90.929 Y192.749 E.69578
G1 X90.396 Y192.749 E.01592
G1 X106.897 Y209.251 E.69578
G1 X106.363 Y209.251 E.01592
G1 X89.862 Y192.749 E.69578
G1 X89.328 Y192.749 E.01592
G1 X105.829 Y209.251 E.69578
G1 X105.295 Y209.251 E.01592
G1 X88.794 Y192.749 E.69578
G1 X88.26 Y192.749 E.01592
G1 X104.762 Y209.251 E.69578
G1 X104.228 Y209.251 E.01592
G1 X87.727 Y192.749 E.69578
G1 X87.193 Y192.749 E.01592
G1 X103.694 Y209.251 E.69578
G1 X103.16 Y209.251 E.01592
G1 X86.659 Y192.749 E.69578
G1 X86.125 Y192.749 E.01592
G1 X102.626 Y209.251 E.69578
G1 X102.093 Y209.251 E.01592
G1 X85.591 Y192.749 E.69578
G1 X85.058 Y192.749 E.01592
G1 X101.559 Y209.251 E.69578
G1 X101.025 Y209.251 E.01592
G1 X84.524 Y192.749 E.69578
G1 X83.99 Y192.749 E.01592
G1 X100.491 Y209.251 E.69578
G1 X99.957 Y209.251 E.01592
G1 X83.456 Y192.749 E.69578
G1 X82.922 Y192.749 E.01592
G1 X99.424 Y209.251 E.69578
G1 X98.89 Y209.251 E.01592
G1 X82.389 Y192.749 E.69578
G1 X81.855 Y192.749 E.01592
G1 X98.356 Y209.251 E.69578
G1 X97.822 Y209.251 E.01592
G1 X81.321 Y192.749 E.69578
G1 X80.787 Y192.749 E.01592
G1 X97.288 Y209.251 E.69578
G1 X96.755 Y209.251 E.01592
G1 X80.254 Y192.749 E.69578
G1 X79.72 Y192.749 E.01592
G1 X96.221 Y209.251 E.69578
G1 X95.687 Y209.251 E.01592
G1 X79.186 Y192.749 E.69578
G1 X78.652 Y192.749 E.01592
G1 X95.153 Y209.251 E.69578
G1 X94.619 Y209.251 E.01592
G1 X78.118 Y192.749 E.69578
G1 X77.585 Y192.749 E.01592
G1 X94.086 Y209.251 E.69578
G1 X93.552 Y209.251 E.01592
G1 X77.051 Y192.749 E.69578
G1 X76.517 Y192.749 E.01592
G1 X93.018 Y209.251 E.69578
G1 X92.484 Y209.251 E.01592
G1 X75.983 Y192.749 E.69578
G1 X75.449 Y192.749 E.01592
G1 X91.95 Y209.251 E.69578
G1 X91.417 Y209.251 E.01592
G1 X74.916 Y192.749 E.69578
G1 X74.382 Y192.749 E.01592
G1 X90.883 Y209.251 E.69578
G1 X90.349 Y209.251 E.01592
G1 X73.848 Y192.749 E.69578
G1 X73.314 Y192.749 E.01592
G1 X89.815 Y209.251 E.69578
G1 X89.281 Y209.251 E.01592
G1 X72.78 Y192.749 E.69578
G1 X72.247 Y192.749 E.01592
G1 X88.748 Y209.251 E.69578
G1 X88.214 Y209.251 E.01592
G1 X71.713 Y192.749 E.69578
G1 X71.179 Y192.749 E.01592
G1 X87.68 Y209.251 E.69578
G1 X87.146 Y209.251 E.01592
G1 X70.645 Y192.749 E.69578
G1 X70.111 Y192.749 E.01592
G1 X86.612 Y209.251 E.69578
G1 X86.079 Y209.251 E.01592
G1 X69.578 Y192.749 E.69578
G1 X69.044 Y192.749 E.01592
G1 X85.545 Y209.251 E.69578
G1 X85.011 Y209.251 E.01592
G1 X68.51 Y192.749 E.69578
G1 X67.976 Y192.749 E.01592
G1 X84.477 Y209.251 E.69578
G1 X83.944 Y209.251 E.01592
G1 X67.442 Y192.749 E.69578
G1 X66.909 Y192.749 E.01592
G1 X83.41 Y209.251 E.69578
G1 X82.876 Y209.251 E.01592
G1 X66.375 Y192.749 E.69578
G1 X65.841 Y192.749 E.01592
G1 X82.342 Y209.251 E.69578
G1 X81.808 Y209.251 E.01592
G1 X65.307 Y192.749 E.69578
G1 X64.773 Y192.749 E.01592
G1 X81.275 Y209.251 E.69578
G1 X80.741 Y209.251 E.01592
G1 X47.749 Y176.259 E1.39111
G1 X47.749 Y175.725 E.01592
G1 X64.251 Y192.227 E.69578
G1 X64.251 Y191.693 E.01592
G1 X47.749 Y175.192 E.69578
G1 X47.749 Y174.658 E.01592
G1 X64.251 Y191.159 E.69578
G1 X64.251 Y190.625 E.01592
G1 X47.749 Y174.124 E.69578
G1 X47.749 Y173.59 E.01592
G1 X64.251 Y190.091 E.69578
G1 X64.251 Y189.558 E.01592
G1 X47.749 Y173.057 E.69578
G1 X47.749 Y172.523 E.01592
G1 X64.251 Y189.024 E.69578
G1 X64.251 Y188.49 E.01592
G1 X47.749 Y171.989 E.69578
G1 X47.749 Y171.455 E.01592
G1 X64.251 Y187.956 E.69578
G1 X64.251 Y187.422 E.01592
G1 X47.749 Y170.921 E.69578
G1 X47.749 Y170.388 E.01592
G1 X64.251 Y186.889 E.69578
G1 X64.251 Y186.355 E.01592
G1 X47.749 Y169.854 E.69578
G1 X47.749 Y169.32 E.01592
G1 X64.251 Y185.821 E.69578
G1 X64.251 Y185.287 E.01592
G1 X47.749 Y168.786 E.69578
G1 X47.749 Y168.252 E.01592
G1 X64.251 Y184.753 E.69578
G1 X64.251 Y184.22 E.01592
G1 X47.749 Y167.719 E.69578
G1 X47.749 Y167.185 E.01592
G1 X64.251 Y183.686 E.69578
G1 X64.251 Y183.152 E.01592
G1 X47.749 Y166.651 E.69578
G1 X47.749 Y166.117 E.01592
G1 X64.251 Y182.618 E.69578
G1 X64.251 Y182.084 E.01592
G1 X47.749 Y165.583 E.69578
G1 X47.749 Y165.05 E.01592
G1 X64.251 Y181.551 E.69578
G1 X64.251 Y181.017 E.01592
G1 X47.749 Y164.516 E.69578
G1 X47.749 Y163.982 E.01592
G1 X64.251 Y180.483 E.69578
G1 X64.251 Y179.949 E.01592
G1 X47.749 Y163.448 E.69578
G1 X47.749 Y162.914 E.01592
G1 X64.251 Y179.415 E.69578
G1 X64.251 Y178.882 E.01592
G1 X47.749 Y162.381 E.69578
G1 X47.749 Y161.847 E.01592
G1 X64.251 Y178.348 E.69578
G1 X64.251 Y177.814 E.01592
G1 X47.749 Y161.313 E.69578
G1 X47.749 Y160.779 E.01592
G1 X64.251 Y177.28 E.69578
G1 X64.251 Y176.746 E.01592
G1 X47.749 Y160.245 E.69578
G1 X47.749 Y159.712 E.01592
G1 X64.251 Y176.213 E.69578
G1 X64.251 Y175.679 E.01592
G1 X47.749 Y159.178 E.69578
G1 X47.749 Y158.644 E.01592
G1 X64.251 Y175.145 E.69578
G1 X64.251 Y174.611 E.01592
G1 X47.749 Y158.11 E.69578
G1 X47.749 Y157.576 E.01592
G1 X64.251 Y174.078 E.69578
G1 X64.251 Y173.544 E.01592
G1 X47.749 Y157.043 E.69578
G1 X47.749 Y156.509 E.01592
G1 X64.251 Y173.01 E.69578
G1 X64.251 Y172.476 E.01592
G1 X47.749 Y155.975 E.69578
G1 X47.749 Y155.441 E.01592
G1 X64.251 Y171.942 E.69578
G1 X64.251 Y171.409 E.01592
G1 X47.749 Y154.907 E.69578
G1 X47.749 Y154.374 E.01592
G1 X64.251 Y170.875 E.69578
G1 X64.251 Y170.341 E.01592
G1 X47.749 Y153.84 E.69578
G1 X47.749 Y153.306 E.01592
G1 X64.251 Y169.807 E.69578
G1 X64.251 Y169.273 E.01592
G1 X47.749 Y152.772 E.69578
G1 X47.749 Y152.238 E.01592
G1 X64.251 Y168.74 E.69578
G1 X64.251 Y168.206 E.01592
G1 X47.749 Y151.705 E.69578
G1 X47.749 Y151.171 E.01592
G1 X64.251 Y167.672 E.69578
G1 X64.251 Y167.138 E.01592
G1 X47.749 Y150.637 E.69578
G1 X47.749 Y150.103 E.01592
G1 X64.251 Y166.604 E.69578
G1 X64.251 Y166.071 E.01592
G1 X47.749 Y149.57 E.69578
G1 X47.749 Y149.036 E.01592
G1 X64.251 Y165.537 E.69578
G1 X64.251 Y165.003 E.01592
G1 X47.749 Y148.502 E.69578
G1 X47.749 Y147.968 E.01592
G1 X64.251 Y164.469 E.69578
G1 X64.251 Y163.935 E.01592
G1 X47.749 Y147.434 E.69578
G1 X47.749 Y146.901 E.01592
G1 X64.251 Y163.402 E.69578
G1 X64.251 Y162.868 E.01592
G1 X47.749 Y146.367 E.69578
G1 X47.749 Y145.833 E.01592
G1 X64.251 Y162.334 E.69578
G1 X64.251 Y161.8 E.01592
G1 X47.749 Y145.299 E.69578
G1 X47.749 Y144.765 E.01592
G1 X64.251 Y161.266 E.69578
G1 X64.251 Y160.733 E.01592
G1 X47.749 Y144.232 E.69578
G1 X47.749 Y143.698 E.01592
G1 X64.251 Y160.199 E.69578
G1 X64.251 Y159.665 E.01592
G1 X47.749 Y143.164 E.69578
G1 X47.749 Y142.63 E.01592
G1 X64.251 Y159.131 E.69578
G1 X64.251 Y158.597 E.01592
G1 X47.749 Y142.096 E.69578
G1 X47.749 Y141.563 E.01592
G1 X64.251 Y158.064 E.69578
G1 X64.251 Y157.53 E.01592
G1 X47.749 Y141.029 E.69578
G1 X47.749 Y140.495 E.01592
G1 X64.251 Y156.996 E.69578
G1 X64.251 Y156.462 E.01592
G1 X47.749 Y139.961 E.69578
G1 X47.749 Y139.427 E.01592
G1 X64.251 Y155.928 E.69578
G1 X64.251 Y155.395 E.01592
G1 X47.749 Y138.894 E.69578
G1 X47.749 Y138.36 E.01592
G1 X64.251 Y154.861 E.69578
G1 X64.251 Y154.327 E.01592
G1 X47.749 Y137.826 E.69578
G1 X47.749 Y137.292 E.01592
G1 X64.251 Y153.793 E.69578
G1 X64.251 Y153.26 E.01592
G1 X47.749 Y136.758 E.69578
G1 X47.749 Y136.225 E.01592
G1 X64.251 Y152.726 E.69578
G1 X64.251 Y152.192 E.01592
G1 X47.749 Y135.691 E.69578
G1 X47.749 Y135.157 E.01592
G1 X64.251 Y151.658 E.69578
G1 X64.251 Y151.124 E.01592
G1 X47.749 Y134.623 E.69578
G1 X47.749 Y134.089 E.01592
G1 X64.251 Y150.591 E.69578
G1 X64.251 Y150.057 E.01592
G1 X47.749 Y133.556 E.69578
G1 X47.749 Y133.022 E.01592
G1 X64.251 Y149.523 E.69578
G1 X64.251 Y148.989 E.01592
G1 X47.749 Y132.488 E.69578
G1 X47.749 Y131.954 E.01592
G1 X64.251 Y148.455 E.69578
G1 X64.251 Y147.922 E.01592
G1 X47.749 Y131.42 E.69578
G1 X47.749 Y130.887 E.01592
G1 X64.251 Y147.388 E.69578
G1 X64.251 Y146.854 E.01592
G1 X47.749 Y130.353 E.69578
G1 X47.749 Y129.819 E.01592
G1 X64.251 Y146.32 E.69578
G1 X64.251 Y145.786 E.01592
G1 X47.749 Y129.285 E.69578
G1 X47.749 Y128.752 E.01592
G1 X64.251 Y145.253 E.69578
G1 X64.251 Y144.719 E.01592
G1 X47.749 Y128.218 E.69578
G1 X47.749 Y127.684 E.01592
G1 X64.251 Y144.185 E.69578
G1 X64.251 Y143.651 E.01592
G1 X47.749 Y127.15 E.69578
G1 X47.749 Y126.616 E.01592
G1 X64.251 Y143.117 E.69578
G1 X64.251 Y142.584 E.01592
G1 X47.749 Y126.083 E.69578
G1 X47.749 Y125.549 E.01592
G1 X64.251 Y142.05 E.69578
G1 X64.251 Y141.516 E.01592
G1 X47.749 Y125.015 E.69578
G1 X47.749 Y124.481 E.01592
M73 P70 R19
G1 X64.251 Y140.982 E.69578
G1 X64.251 Y140.448 E.01592
G1 X47.749 Y123.947 E.69578
G1 X47.749 Y123.414 E.01592
G1 X64.42 Y140.084 E.70294
; WIPE_START
G1 X63.006 Y138.67 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X59.063 Y132.135 Z3 F30000
G1 X47.58 Y113.102 Z3
G1 Z2.6
G1 E.8 F1800
G1 F9537.687
G1 X57.108 Y122.63 E.40178
G2 X56.422 Y122.478 I-1.111 J3.384 E.02099
G1 X47.749 Y113.805 E.36569
G1 X47.749 Y114.339 E.01592
G1 X55.868 Y122.457 E.34232
G2 X55.383 Y122.507 I.053 J2.92 E.01453
G1 X47.749 Y114.873 E.32189
G1 X47.749 Y115.407 E.01592
G1 X54.953 Y122.61 E.30373
G2 X54.563 Y122.754 I.523 J2.02 E.01241
G1 X47.749 Y115.94 E.28728
G1 X47.749 Y116.474 E.01592
G1 X54.209 Y122.934 E.27238
G2 X53.888 Y123.147 I.903 J1.708 E.0115
G1 X47.749 Y117.008 E.25885
G1 X47.749 Y117.542 E.01592
G1 X53.597 Y123.389 E.24655
G2 X53.333 Y123.659 I1.217 J1.448 E.01127
G1 X47.749 Y118.076 E.23545
G1 X47.749 Y118.609 E.01592
G1 X53.099 Y123.959 E.22555
G2 X52.894 Y124.287 I1.537 J1.187 E.01157
G1 X47.749 Y119.143 E.21691
G1 X47.749 Y119.677 E.01592
G1 X52.72 Y124.648 E.20961
G2 X52.583 Y125.044 I1.907 J.885 E.01252
G1 X47.749 Y120.211 E.2038
G1 X47.749 Y120.745 E.01592
G1 X52.487 Y125.482 E.19976
G2 X52.453 Y125.982 I2.48 J.42 E.01496
G1 X47.749 Y121.278 E.19832
G1 X47.749 Y121.812 E.01592
G1 X52.493 Y126.556 E.20004
G2 X52.695 Y127.291 I3.895 J-.672 E.02276
G1 X47.749 Y122.346 E.20853
G1 X47.749 Y122.88 E.01592
G1 X64.251 Y139.381 E.69578
G1 X64.251 Y138.847 E.01592
G1 X54.706 Y129.303 E.40244
M73 P71 R19
G2 X55.441 Y129.503 I1.306 J-3.342 E.02273
G1 X64.251 Y138.313 E.37148
G1 X64.251 Y137.779 E.01592
G1 X56.019 Y129.548 E.34709
G2 X56.515 Y129.51 I.061 J-2.502 E.01486
G1 X64.251 Y137.246 E.32617
G1 X64.251 Y136.712 E.01592
G1 X56.958 Y129.42 E.30748
G2 X57.353 Y129.281 I-2.326 J-7.249 E.01248
G1 X64.251 Y136.178 E.29083
G1 X64.251 Y135.644 E.01592
G1 X57.713 Y129.107 E.27566
G2 X58.041 Y128.901 I-.863 J-1.741 E.01157
G1 X64.251 Y135.11 E.26182
G1 X64.251 Y134.577 E.01592
G1 X58.34 Y128.666 E.24923
G2 X58.61 Y128.402 I-1.181 J-1.48 E.01127
G1 X64.251 Y134.043 E.23784
G1 X64.251 Y133.509 E.01592
G1 X58.852 Y128.11 E.22765
G2 X59.064 Y127.789 I-1.499 J-1.222 E.01151
G1 X64.251 Y132.975 E.2187
G1 X64.251 Y132.442 E.01592
G1 X59.245 Y127.436 E.21105
G2 X59.393 Y127.05 I-1.854 J-.928 E.01235
G1 X64.251 Y131.908 E.20483
G1 X64.251 Y131.374 E.01592
G1 X59.494 Y126.618 E.20055
G2 X59.545 Y126.135 I-2.393 J-.495 E.01451
G1 X64.251 Y130.84 E.19842
G1 X64.251 Y130.306 E.01592
G1 X59.524 Y125.58 E.1993
G2 X59.372 Y124.894 I-3.966 J.517 E.02095
G1 X64.251 Y129.773 E.20569
G1 X64.251 Y129.239 E.01592
G1 X47.749 Y112.738 E.69578
G1 X47.749 Y112.204 E.01592
G1 X64.251 Y128.705 E.69578
G1 X64.251 Y128.171 E.01592
G1 X47.749 Y111.67 E.69578
G1 X47.749 Y111.136 E.01592
G1 X64.251 Y127.637 E.69578
G1 X64.251 Y127.104 E.01592
G1 X47.749 Y110.602 E.69578
G1 X47.749 Y110.069 E.01592
G1 X64.251 Y126.57 E.69578
G1 X64.251 Y126.036 E.01592
G1 X47.749 Y109.535 E.69578
G1 X47.749 Y109.001 E.01592
G1 X64.251 Y125.502 E.69578
G1 X64.251 Y124.968 E.01592
G1 X47.749 Y108.467 E.69578
G1 X47.749 Y107.934 E.01592
G1 X64.251 Y124.435 E.69578
G1 X64.251 Y123.901 E.01592
G1 X47.749 Y107.4 E.69578
G1 X47.749 Y106.866 E.01592
G1 X64.251 Y123.367 E.69578
G1 X64.251 Y122.833 E.01592
G1 X47.749 Y106.332 E.69578
G1 X47.749 Y105.798 E.01592
G1 X64.251 Y122.299 E.69578
G1 X64.251 Y121.766 E.01592
G1 X47.749 Y105.265 E.69578
G1 X47.749 Y104.731 E.01592
G1 X64.251 Y121.232 E.69578
G1 X64.251 Y120.698 E.01592
G1 X47.749 Y104.197 E.69578
G1 X47.749 Y103.663 E.01592
G1 X64.251 Y120.164 E.69578
G1 X64.251 Y119.63 E.01592
G1 X47.749 Y103.129 E.69578
G1 X47.749 Y102.596 E.01592
G1 X64.251 Y119.097 E.69578
G1 X64.251 Y118.563 E.01592
G1 X47.749 Y102.062 E.69578
G1 X47.749 Y101.528 E.01592
G1 X64.251 Y118.029 E.69578
G1 X64.251 Y117.495 E.01592
G1 X47.749 Y100.994 E.69578
G1 X47.749 Y100.46 E.01592
G1 X64.251 Y116.961 E.69578
G1 X64.251 Y116.428 E.01592
G1 X47.749 Y99.927 E.69578
G1 X47.749 Y99.393 E.01592
G1 X64.251 Y115.894 E.69578
G1 X64.251 Y115.36 E.01592
G1 X47.749 Y98.859 E.69578
G1 X47.749 Y98.325 E.01592
G1 X64.251 Y114.826 E.69578
G1 X64.251 Y114.292 E.01592
G1 X47.749 Y97.791 E.69578
G1 X47.749 Y97.258 E.01592
G1 X64.251 Y113.759 E.69578
G1 X64.251 Y113.225 E.01592
G1 X47.749 Y96.724 E.69578
G1 X47.749 Y96.19 E.01592
G1 X64.251 Y112.691 E.69578
G1 X64.251 Y112.157 E.01592
G1 X47.749 Y95.656 E.69578
G1 X47.749 Y95.122 E.01592
G1 X64.251 Y111.624 E.69578
G1 X64.251 Y111.09 E.01592
G1 X47.749 Y94.589 E.69578
G1 X47.749 Y94.055 E.01592
G1 X64.251 Y110.556 E.69578
G1 X64.251 Y110.022 E.01592
G1 X47.749 Y93.521 E.69578
G1 X47.749 Y92.987 E.01592
G1 X64.251 Y109.488 E.69578
G1 X64.251 Y108.955 E.01592
G1 X47.749 Y92.453 E.69578
G1 X47.749 Y91.92 E.01592
G1 X64.251 Y108.421 E.69578
G1 X64.251 Y107.887 E.01592
G1 X47.749 Y91.386 E.69578
G1 X47.749 Y90.852 E.01592
G1 X64.251 Y107.353 E.69578
G1 X64.251 Y106.819 E.01592
G1 X47.749 Y90.318 E.69578
G1 X47.749 Y89.784 E.01592
G1 X64.251 Y106.286 E.69578
G1 X64.251 Y105.752 E.01592
G1 X47.749 Y89.251 E.69578
G1 X47.749 Y88.717 E.01592
G1 X64.251 Y105.218 E.69578
G1 X64.251 Y104.684 E.01592
G1 X47.749 Y88.183 E.69578
G1 X47.749 Y87.649 E.01592
G1 X64.251 Y104.15 E.69578
G1 X64.251 Y103.617 E.01592
G1 X47.749 Y87.116 E.69578
G1 X47.749 Y86.582 E.01592
G1 X64.251 Y103.083 E.69578
G1 X64.251 Y102.549 E.01592
G1 X47.749 Y86.048 E.69578
G1 X47.749 Y85.514 E.01592
G1 X64.251 Y102.015 E.69578
G1 X64.251 Y101.481 E.01592
G1 X47.749 Y84.98 E.69578
G1 X47.749 Y84.447 E.01592
G1 X64.251 Y100.948 E.69578
G1 X64.251 Y100.414 E.01592
G1 X47.749 Y83.913 E.69578
G1 X47.749 Y83.379 E.01592
G1 X64.251 Y99.88 E.69578
G1 X64.251 Y99.346 E.01592
G1 X47.749 Y82.845 E.69578
G1 X47.749 Y82.311 E.01592
G1 X64.251 Y98.812 E.69578
G1 X64.251 Y98.279 E.01592
G1 X47.749 Y81.778 E.69578
G1 X47.749 Y81.244 E.01592
G1 X64.251 Y97.745 E.69578
G1 X64.251 Y97.211 E.01592
G1 X47.749 Y80.71 E.69578
G1 X47.749 Y80.176 E.01592
G1 X64.251 Y96.677 E.69578
G1 X64.251 Y96.143 E.01592
G1 X47.749 Y79.642 E.69578
G1 X47.749 Y79.109 E.01592
G1 X64.251 Y95.61 E.69578
G1 X64.251 Y95.076 E.01592
G1 X47.749 Y78.575 E.69578
G1 X47.749 Y78.041 E.01592
G1 X64.251 Y94.542 E.69578
G1 X64.251 Y94.008 E.01592
G1 X47.749 Y77.507 E.69578
G1 X47.749 Y76.973 E.01592
G1 X64.251 Y93.474 E.69578
G1 X64.251 Y92.941 E.01592
G1 X47.749 Y76.44 E.69578
G1 X47.749 Y75.906 E.01592
G1 X64.251 Y92.407 E.69578
G1 X64.251 Y91.873 E.01592
G1 X47.749 Y75.372 E.69578
G1 X47.749 Y74.838 E.01592
G1 X64.251 Y91.339 E.69578
G1 X64.251 Y90.806 E.01592
G1 X47.749 Y74.304 E.69578
G1 X47.749 Y73.771 E.01592
G1 X64.251 Y90.272 E.69578
G1 X64.251 Y89.738 E.01592
G1 X47.749 Y73.237 E.69578
G1 X47.749 Y72.703 E.01592
G1 X64.251 Y89.204 E.69578
G1 X64.251 Y88.67 E.01592
G1 X47.749 Y72.169 E.69578
G1 X47.749 Y71.635 E.01592
G1 X64.251 Y88.137 E.69578
G1 X64.251 Y87.603 E.01592
G1 X47.749 Y71.102 E.69578
G1 X47.749 Y70.568 E.01592
G1 X64.251 Y87.069 E.69578
G1 X64.251 Y86.535 E.01592
G1 X47.749 Y70.034 E.69578
G1 X47.749 Y69.5 E.01592
G1 X64.251 Y86.001 E.69578
G1 X64.251 Y85.468 E.01592
G1 X47.749 Y68.966 E.69578
G1 X47.749 Y68.433 E.01592
G1 X64.251 Y84.934 E.69578
G1 X64.251 Y84.4 E.01592
G1 X47.749 Y67.899 E.69578
G1 X47.749 Y67.365 E.01592
G1 X64.251 Y83.866 E.69578
G1 X64.251 Y83.332 E.01592
G1 X47.749 Y66.831 E.69578
G1 X47.749 Y66.298 E.01592
G1 X64.251 Y82.799 E.69578
G1 X64.251 Y82.265 E.01592
G1 X47.749 Y65.764 E.69578
G1 X47.749 Y65.23 E.01592
G1 X64.251 Y81.731 E.69578
G1 X64.251 Y81.197 E.01592
G1 X47.749 Y64.696 E.69578
G1 X47.749 Y64.162 E.01592
G1 X64.251 Y80.663 E.69578
G1 X64.251 Y80.13 E.01592
G1 X47.749 Y63.629 E.69578
G1 X47.749 Y63.095 E.01592
G1 X64.251 Y79.596 E.69578
G1 X64.251 Y79.062 E.01592
G1 X47.749 Y62.561 E.69578
G1 X47.749 Y62.027 E.01592
G1 X64.251 Y78.528 E.69578
G1 X64.251 Y77.994 E.01592
G1 X47.749 Y61.493 E.69578
G1 X47.749 Y60.96 E.01592
G1 X64.251 Y77.461 E.69578
G1 X64.251 Y76.927 E.01592
G1 X47.749 Y60.426 E.69578
G1 X47.749 Y59.892 E.01592
G1 X64.251 Y76.393 E.69578
G1 X64.251 Y75.859 E.01592
G1 X47.749 Y59.358 E.69578
G1 X47.749 Y58.824 E.01592
G1 X64.251 Y75.325 E.69578
G1 X64.251 Y74.792 E.01592
G1 X47.749 Y58.291 E.69578
G1 X47.749 Y57.757 E.01592
G1 X64.251 Y74.258 E.69578
G1 X64.251 Y73.724 E.01592
G1 X47.749 Y57.223 E.69578
G1 X47.749 Y56.689 E.01592
G1 X64.251 Y73.19 E.69578
G1 X64.251 Y72.656 E.01592
G1 X47.749 Y56.155 E.69578
G1 X47.749 Y55.622 E.01592
G1 X64.251 Y72.123 E.69578
G1 X64.251 Y71.589 E.01592
G1 X47.749 Y55.088 E.69578
G1 X47.749 Y54.554 E.01592
G1 X64.251 Y71.055 E.69578
G1 X64.251 Y70.521 E.01592
G1 X47.749 Y54.02 E.69578
G1 X47.749 Y53.486 E.01592
G1 X64.251 Y69.988 E.69578
G1 X64.251 Y69.454 E.01592
G1 X47.749 Y52.953 E.69578
G1 X47.749 Y52.419 E.01592
G1 X64.251 Y68.92 E.69578
G1 X64.251 Y68.386 E.01592
G1 X47.749 Y51.885 E.69578
G1 X47.749 Y51.351 E.01592
G1 X64.251 Y67.852 E.69578
G1 X64.251 Y67.319 E.01592
G1 X47.749 Y50.817 E.69578
G1 X47.749 Y50.284 E.01592
G1 X64.251 Y66.785 E.69578
G1 X64.251 Y66.251 E.01592
G1 X47.749 Y49.75 E.69578
G1 X47.749 Y49.216 E.01592
G1 X64.251 Y65.717 E.69578
G1 X64.251 Y65.183 E.01592
G1 X47.749 Y48.682 E.69578
G1 X47.749 Y48.148 E.01592
G1 X64.42 Y64.819 E.70294
; WIPE_START
G1 X63.006 Y63.405 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X59.522 Y56.614 Z3 F30000
G1 X52.323 Y42.58 Z3
G1 Z2.6
G1 E.8 F1800
G1 F9537.687
G1 X57.552 Y47.808 E.22047
G2 X56.74 Y47.53 I-1.587 J3.309 E.02565
G1 X51.959 Y42.749 E.20159
G1 X51.425 Y42.749 E.01592
G1 X56.133 Y47.458 E.19853
G2 X55.613 Y47.472 I-.167 J3.417 E.01551
G1 X50.891 Y42.749 E.19912
G1 X50.357 Y42.749 E.01592
G1 X55.159 Y47.552 E.20248
G2 X54.753 Y47.679 I.434 J2.098 E.01272
G1 X49.824 Y42.749 E.20785
G1 X49.29 Y42.749 E.01592
G1 X54.383 Y47.843 E.21476
G2 X54.046 Y48.039 I.815 J1.785 E.01166
G1 X48.756 Y42.749 E.22305
G1 X48.222 Y42.749 E.01592
G1 X53.739 Y48.266 E.23262
G2 X53.461 Y48.522 I1.137 J1.518 E.01128
G1 X47.749 Y42.811 E.24082
G1 X47.749 Y43.344 E.01592
G1 X53.211 Y48.806 E.23028
G2 X52.99 Y49.118 I1.455 J1.263 E.01144
G1 X47.749 Y43.878 E.22096
G1 X47.749 Y44.412 E.01592
G1 X52.799 Y49.462 E.21292
G2 X52.645 Y49.841 I1.822 J.959 E.01224
G1 X47.749 Y44.946 E.20643
G1 X47.749 Y45.48 E.01592
G1 X52.531 Y50.261 E.2016
G2 X52.462 Y50.726 I2.294 J.573 E.01406
G1 X47.749 Y46.013 E.19873
G1 X47.749 Y46.547 E.01592
G1 X52.461 Y51.259 E.19866
G2 X52.564 Y51.895 I4.568 J-.413 E.01925
G1 X47.749 Y47.081 E.20301
G1 X47.749 Y47.615 E.01592
G1 X64.251 Y64.116 E.69578
G1 X64.251 Y63.582 E.01592
G1 X55.1 Y54.432 E.38582
G2 X55.74 Y54.538 I.909 J-3.509 E.01936
G1 X64.251 Y63.048 E.35885
G1 X64.251 Y62.514 E.01592
G1 X56.276 Y54.54 E.33623
G2 X56.74 Y54.47 I-.122 J-2.35 E.01399
G1 X64.251 Y61.981 E.31671
G1 X64.251 Y61.447 E.01592
G1 X57.157 Y54.353 E.2991
G2 X57.536 Y54.199 I-.584 J-1.972 E.01223
G1 X64.251 Y60.913 E.28312
G1 X64.251 Y60.379 E.01592
G1 X57.881 Y54.01 E.26857
G2 X58.196 Y53.79 I-.939 J-1.679 E.01145
G1 X64.251 Y59.845 E.25532
G1 X64.251 Y59.312 E.01592
G1 X58.481 Y53.542 E.24329
G2 X58.736 Y53.263 I-1.269 J-1.418 E.01128
G1 X64.723 Y59.251 E.25247
G1 X65.257 Y59.251 E.01592
G1 X58.962 Y52.956 E.26543
G2 X59.158 Y52.618 I-1.59 J-1.148 E.01166
G1 X65.791 Y59.251 E.27968
G1 X66.325 Y59.251 E.01592
G1 X59.321 Y52.247 E.29531
G2 X59.447 Y51.839 I-1.979 J-.833 E.01275
G1 X66.858 Y59.251 E.31252
G1 X67.392 Y59.251 E.01592
G1 X59.529 Y51.387 E.33156
G2 X59.545 Y50.87 I-4.416 J-.398 E.01545
G1 X67.926 Y59.251 E.35339
G1 X68.46 Y59.251 E.01592
G1 X59.473 Y50.264 E.37894
G2 X59.189 Y49.445 I-3.643 J.808 E.02589
G1 X68.994 Y59.251 E.41344
G1 X69.527 Y59.251 E.01592
G1 X53.026 Y42.749 E.69578
G1 X53.56 Y42.749 E.01592
G1 X70.061 Y59.251 E.69578
G1 X70.595 Y59.251 E.01592
G1 X54.094 Y42.749 E.69578
G1 X54.628 Y42.749 E.01592
G1 X71.129 Y59.251 E.69578
G1 X71.663 Y59.251 E.01592
G1 X55.161 Y42.749 E.69578
G1 X55.695 Y42.749 E.01592
G1 X72.196 Y59.251 E.69578
G1 X72.73 Y59.251 E.01592
G1 X56.229 Y42.749 E.69578
G1 X56.763 Y42.749 E.01592
G1 X73.264 Y59.251 E.69578
G1 X73.798 Y59.251 E.01592
G1 X57.297 Y42.749 E.69578
G1 X57.83 Y42.749 E.01592
G1 X74.332 Y59.251 E.69578
G1 X74.865 Y59.251 E.01592
G1 X58.364 Y42.749 E.69578
G1 X58.898 Y42.749 E.01592
G1 X75.399 Y59.251 E.69578
G1 X75.933 Y59.251 E.01592
G1 X59.432 Y42.749 E.69578
G1 X59.966 Y42.749 E.01592
G1 X76.467 Y59.251 E.69578
G1 X77.001 Y59.251 E.01592
G1 X60.499 Y42.749 E.69578
G1 X61.033 Y42.749 E.01592
G1 X77.534 Y59.251 E.69578
G1 X78.068 Y59.251 E.01592
G1 X61.567 Y42.749 E.69578
G1 X62.101 Y42.749 E.01592
G1 X78.602 Y59.251 E.69578
G1 X79.136 Y59.251 E.01592
G1 X62.635 Y42.749 E.69578
G1 X63.168 Y42.749 E.01592
G1 X79.67 Y59.251 E.69578
G1 X80.203 Y59.251 E.01592
G1 X63.702 Y42.749 E.69578
G1 X64.236 Y42.749 E.01592
G1 X80.737 Y59.251 E.69578
G1 X81.271 Y59.251 E.01592
G1 X64.77 Y42.749 E.69578
G1 X65.304 Y42.749 E.01592
G1 X81.805 Y59.251 E.69578
G1 X82.338 Y59.251 E.01592
G1 X65.837 Y42.749 E.69578
G1 X66.371 Y42.749 E.01592
G1 X82.872 Y59.251 E.69578
G1 X83.406 Y59.251 E.01592
G1 X66.905 Y42.749 E.69578
G1 X67.439 Y42.749 E.01592
G1 X83.94 Y59.251 E.69578
G1 X84.474 Y59.251 E.01592
G1 X67.973 Y42.749 E.69578
G1 X68.506 Y42.749 E.01592
G1 X85.007 Y59.251 E.69578
G1 X85.541 Y59.251 E.01592
G1 X69.04 Y42.749 E.69578
G1 X69.574 Y42.749 E.01592
G1 X86.075 Y59.251 E.69578
G1 X86.609 Y59.251 E.01592
G1 X70.108 Y42.749 E.69578
G1 X70.642 Y42.749 E.01592
G1 X87.143 Y59.251 E.69578
G1 X87.676 Y59.251 E.01592
G1 X71.175 Y42.749 E.69578
G1 X71.709 Y42.749 E.01592
G1 X88.21 Y59.251 E.69578
G1 X88.744 Y59.251 E.01592
G1 X72.243 Y42.749 E.69578
G1 X72.777 Y42.749 E.01592
G1 X89.278 Y59.251 E.69578
G1 X89.812 Y59.251 E.01592
G1 X73.311 Y42.749 E.69578
G1 X73.844 Y42.749 E.01592
G1 X90.345 Y59.251 E.69578
G1 X90.879 Y59.251 E.01592
G1 X74.378 Y42.749 E.69578
G1 X74.912 Y42.749 E.01592
G1 X91.413 Y59.251 E.69578
G1 X91.947 Y59.251 E.01592
G1 X75.446 Y42.749 E.69578
G1 X75.98 Y42.749 E.01592
G1 X92.481 Y59.251 E.69578
G1 X93.014 Y59.251 E.01592
G1 X76.513 Y42.749 E.69578
G1 X77.047 Y42.749 E.01592
G1 X93.548 Y59.251 E.69578
G1 X94.082 Y59.251 E.01592
G1 X77.581 Y42.749 E.69578
G1 X78.115 Y42.749 E.01592
G1 X94.616 Y59.251 E.69578
G1 X95.15 Y59.251 E.01592
G1 X78.648 Y42.749 E.69578
G1 X79.182 Y42.749 E.01592
G1 X95.683 Y59.251 E.69578
G1 X96.217 Y59.251 E.01592
G1 X79.716 Y42.749 E.69578
G1 X80.25 Y42.749 E.01592
G1 X96.751 Y59.251 E.69578
G1 X97.285 Y59.251 E.01592
G1 X80.784 Y42.749 E.69578
G1 X81.317 Y42.749 E.01592
G1 X97.819 Y59.251 E.69578
G1 X98.352 Y59.251 E.01592
G1 X81.851 Y42.749 E.69578
G1 X82.385 Y42.749 E.01592
G1 X98.886 Y59.251 E.69578
G1 X99.42 Y59.251 E.01592
G1 X82.919 Y42.749 E.69578
G1 X83.453 Y42.749 E.01592
G1 X99.954 Y59.251 E.69578
G1 X100.488 Y59.251 E.01592
G1 X83.986 Y42.749 E.69578
G1 X84.52 Y42.749 E.01592
G1 X101.021 Y59.251 E.69578
G1 X101.555 Y59.251 E.01592
G1 X85.054 Y42.749 E.69578
G1 X85.588 Y42.749 E.01592
G1 X102.089 Y59.251 E.69578
G1 X102.623 Y59.251 E.01592
G1 X86.122 Y42.749 E.69578
G1 X86.655 Y42.749 E.01592
G1 X103.156 Y59.251 E.69578
G1 X103.69 Y59.251 E.01592
G1 X87.189 Y42.749 E.69578
G1 X87.723 Y42.749 E.01592
G1 X104.224 Y59.251 E.69578
G1 X104.758 Y59.251 E.01592
G1 X88.257 Y42.749 E.69578
G1 X88.791 Y42.749 E.01592
G1 X105.292 Y59.251 E.69578
G1 X105.825 Y59.251 E.01592
G1 X89.324 Y42.749 E.69578
G1 X89.858 Y42.749 E.01592
G1 X106.359 Y59.251 E.69578
G1 X106.893 Y59.251 E.01592
G1 X90.392 Y42.749 E.69578
G1 X90.926 Y42.749 E.01592
G1 X107.427 Y59.251 E.69578
G1 X107.961 Y59.251 E.01592
G1 X91.46 Y42.749 E.69578
G1 X91.993 Y42.749 E.01592
G1 X108.494 Y59.251 E.69578
G1 X109.028 Y59.251 E.01592
G1 X92.527 Y42.749 E.69578
G1 X93.061 Y42.749 E.01592
G1 X109.562 Y59.251 E.69578
G1 X110.096 Y59.251 E.01592
G1 X93.595 Y42.749 E.69578
G1 X94.129 Y42.749 E.01592
G1 X110.63 Y59.251 E.69578
G1 X111.163 Y59.251 E.01592
G1 X94.662 Y42.749 E.69578
G1 X95.196 Y42.749 E.01592
G1 X111.697 Y59.251 E.69578
G1 X112.231 Y59.251 E.01592
G1 X95.73 Y42.749 E.69578
G1 X96.264 Y42.749 E.01592
G1 X112.765 Y59.251 E.69578
G1 X113.299 Y59.251 E.01592
G1 X96.798 Y42.749 E.69578
G1 X97.331 Y42.749 E.01592
G1 X113.832 Y59.251 E.69578
G1 X114.366 Y59.251 E.01592
G1 X97.865 Y42.749 E.69578
G1 X98.399 Y42.749 E.01592
G1 X114.9 Y59.251 E.69578
G1 X115.434 Y59.251 E.01592
G1 X98.933 Y42.749 E.69578
G1 X99.466 Y42.749 E.01592
G1 X115.968 Y59.251 E.69578
G1 X116.501 Y59.251 E.01592
G1 X100 Y42.749 E.69578
G1 X100.534 Y42.749 E.01592
G1 X117.035 Y59.251 E.69578
G1 X117.569 Y59.251 E.01592
G1 X101.068 Y42.749 E.69578
G1 X101.602 Y42.749 E.01592
G1 X118.103 Y59.251 E.69578
G1 X118.637 Y59.251 E.01592
G1 X102.135 Y42.749 E.69578
G1 X102.669 Y42.749 E.01592
G1 X119.17 Y59.251 E.69578
G1 X119.704 Y59.251 E.01592
G1 X103.203 Y42.749 E.69578
G1 X103.737 Y42.749 E.01592
G1 X120.238 Y59.251 E.69578
G1 X120.772 Y59.251 E.01592
G1 X104.271 Y42.749 E.69578
G1 X104.804 Y42.749 E.01592
G1 X121.306 Y59.251 E.69578
G1 X121.839 Y59.251 E.01592
G1 X105.338 Y42.749 E.69578
G1 X105.872 Y42.749 E.01592
G1 X122.373 Y59.251 E.69578
G1 X122.907 Y59.251 E.01592
G1 X106.406 Y42.749 E.69578
M73 P72 R19
G1 X106.94 Y42.749 E.01592
G1 X123.441 Y59.251 E.69578
G1 X123.974 Y59.251 E.01592
G1 X107.473 Y42.749 E.69578
G1 X108.007 Y42.749 E.01592
G1 X124.508 Y59.251 E.69578
G1 X125.042 Y59.251 E.01592
G1 X108.541 Y42.749 E.69578
G1 X109.075 Y42.749 E.01592
G1 X125.576 Y59.251 E.69578
G1 X126.11 Y59.251 E.01592
G1 X109.609 Y42.749 E.69578
G1 X110.142 Y42.749 E.01592
G1 X126.643 Y59.251 E.69578
G1 X127.177 Y59.251 E.01592
G1 X110.676 Y42.749 E.69578
G1 X111.21 Y42.749 E.01592
G1 X127.711 Y59.251 E.69578
G1 X128.245 Y59.251 E.01592
G1 X111.744 Y42.749 E.69578
G1 X112.278 Y42.749 E.01592
G1 X128.779 Y59.251 E.69578
G1 X129.312 Y59.251 E.01592
G1 X112.811 Y42.749 E.69578
G1 X113.345 Y42.749 E.01592
G1 X129.846 Y59.251 E.69578
G1 X130.38 Y59.251 E.01592
G1 X113.879 Y42.749 E.69578
G1 X114.413 Y42.749 E.01592
G1 X130.914 Y59.251 E.69578
G1 X131.448 Y59.251 E.01592
G1 X114.947 Y42.749 E.69578
G1 X115.48 Y42.749 E.01592
G1 X124.546 Y51.815 E.38225
G3 X124.454 Y51.189 I3.079 J-.771 E.01888
G1 X116.014 Y42.749 E.35588
G1 X116.548 Y42.749 E.01592
G1 X124.468 Y50.67 E.33396
G3 X124.541 Y50.209 I2.339 J.134 E.01394
G1 X117.082 Y42.749 E.31453
G1 X117.616 Y42.749 E.01592
G1 X124.66 Y49.794 E.29703
G3 X124.821 Y49.421 I7.718 J3.108 E.01211
G1 X118.149 Y42.749 E.28131
G1 X118.683 Y42.749 E.01592
G1 X125.015 Y49.081 E.26699
G3 X125.239 Y48.772 I1.658 J.965 E.01142
G1 X119.217 Y42.749 E.25394
G1 X119.751 Y42.749 E.01592
G1 X125.492 Y48.491 E.24209
G3 X125.774 Y48.238 I1.401 J1.279 E.01129
G1 X120.284 Y42.749 E.23145
G1 X120.818 Y42.749 E.01592
G1 X126.084 Y48.015 E.22202
G3 X126.424 Y47.822 I1.137 J1.607 E.01169
G1 X121.352 Y42.749 E.21387
G1 X121.886 Y42.749 E.01592
G1 X126.798 Y47.661 E.20711
G3 X127.208 Y47.538 I.822 J1.989 E.0128
G1 X122.42 Y42.749 E.20191
G1 X122.953 Y42.749 E.01592
G1 X127.671 Y47.467 E.19894
G3 X128.196 Y47.458 I.326 J3.437 E.01564
G1 X123.487 Y42.749 E.19853
G1 X124.021 Y42.749 E.01592
G1 X129.067 Y47.795 E.21277
; WIPE_START
G1 X127.653 Y46.381 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.963 Y53.982 Z3 F30000
G1 X126.942 Y54.211 Z3
G1 Z2.6
G1 E.8 F1800
G1 F9537.687
G1 X131.981 Y59.251 E.2125
G1 X132.515 Y59.251 E.01592
G1 X127.807 Y54.543 E.19851
G2 X128.332 Y54.533 I.19 J-4.068 E.01565
G1 X133.049 Y59.251 E.1989
G1 X133.583 Y59.251 E.01592
G1 X128.79 Y54.458 E.20208
G2 X129.204 Y54.338 I-.395 J-2.126 E.01286
G1 X134.117 Y59.251 E.20716
G1 X134.65 Y59.251 E.01592
G1 X129.579 Y54.179 E.21384
G2 X129.921 Y53.987 I-.791 J-1.807 E.01171
G1 X135.184 Y59.251 E.22194
G1 X135.718 Y59.251 E.01592
G1 X130.23 Y53.763 E.23139
G2 X130.511 Y53.509 I-1.129 J-1.53 E.01129
G1 X136.252 Y59.251 E.24208
G1 X136.786 Y59.251 E.01592
G1 X130.763 Y53.228 E.25396
G2 X130.986 Y52.917 I-1.442 J-1.271 E.01142
G1 X137.319 Y59.251 E.26706
G1 X137.853 Y59.251 E.01592
G1 X131.178 Y52.576 E.28145
G2 X131.338 Y52.201 I-1.789 J-.982 E.01215
G1 X138.387 Y59.251 E.29724
G1 X138.921 Y59.251 E.01592
G1 X131.459 Y51.789 E.31461
G2 X131.535 Y51.331 I-5.119 J-1.08 E.01385
G1 X139.455 Y59.251 E.33393
G1 X139.988 Y59.251 E.01592
G1 X131.542 Y50.804 E.35615
G2 X131.452 Y50.18 I-3.613 J.204 E.01882
G1 X140.522 Y59.251 E.38246
G1 X141.056 Y59.251 E.01592
G1 X124.555 Y42.749 E.69578
G1 X125.089 Y42.749 E.01592
G1 X141.59 Y59.251 E.69578
G1 X142.124 Y59.251 E.01592
G1 X125.622 Y42.749 E.69578
G1 X126.156 Y42.749 E.01592
G1 X142.657 Y59.251 E.69578
G1 X143.191 Y59.251 E.01592
G1 X126.69 Y42.749 E.69578
G1 X127.224 Y42.749 E.01592
G1 X143.725 Y59.251 E.69578
G1 X144.259 Y59.251 E.01592
G1 X127.758 Y42.749 E.69578
G1 X128.291 Y42.749 E.01592
G1 X144.792 Y59.251 E.69578
G1 X145.326 Y59.251 E.01592
G1 X128.825 Y42.749 E.69578
G1 X129.359 Y42.749 E.01592
G1 X145.86 Y59.251 E.69578
G1 X146.394 Y59.251 E.01592
G1 X129.893 Y42.749 E.69578
G1 X130.427 Y42.749 E.01592
G1 X146.928 Y59.251 E.69578
G1 X147.461 Y59.251 E.01592
G1 X130.96 Y42.749 E.69578
G1 X131.494 Y42.749 E.01592
G1 X147.995 Y59.251 E.69578
G1 X148.529 Y59.251 E.01592
G1 X132.028 Y42.749 E.69578
G1 X132.562 Y42.749 E.01592
G1 X149.063 Y59.251 E.69578
G1 X149.597 Y59.251 E.01592
G1 X133.096 Y42.749 E.69578
G1 X133.629 Y42.749 E.01592
G1 X150.13 Y59.251 E.69578
G1 X150.664 Y59.251 E.01592
G1 X134.163 Y42.749 E.69578
G1 X134.697 Y42.749 E.01592
G1 X151.198 Y59.251 E.69578
G1 X151.732 Y59.251 E.01592
G1 X135.231 Y42.749 E.69578
G1 X135.765 Y42.749 E.01592
G1 X152.266 Y59.251 E.69578
G1 X152.799 Y59.251 E.01592
G1 X136.298 Y42.749 E.69578
G1 X136.832 Y42.749 E.01592
G1 X153.333 Y59.251 E.69578
G1 X153.867 Y59.251 E.01592
G1 X137.366 Y42.749 E.69578
G1 X137.9 Y42.749 E.01592
G1 X154.401 Y59.251 E.69578
G1 X154.935 Y59.251 E.01592
G1 X138.434 Y42.749 E.69578
G1 X138.967 Y42.749 E.01592
G1 X155.468 Y59.251 E.69578
G1 X156.002 Y59.251 E.01592
G1 X139.501 Y42.749 E.69578
G1 X140.035 Y42.749 E.01592
G1 X156.536 Y59.251 E.69578
G1 X157.07 Y59.251 E.01592
G1 X140.569 Y42.749 E.69578
G1 X141.102 Y42.749 E.01592
G1 X157.604 Y59.251 E.69578
G1 X158.137 Y59.251 E.01592
G1 X141.636 Y42.749 E.69578
G1 X142.17 Y42.749 E.01592
G1 X158.671 Y59.251 E.69578
G1 X159.205 Y59.251 E.01592
G1 X142.704 Y42.749 E.69578
G1 X143.238 Y42.749 E.01592
G1 X159.739 Y59.251 E.69578
G1 X160.273 Y59.251 E.01592
G1 X143.771 Y42.749 E.69578
G1 X144.305 Y42.749 E.01592
G1 X160.806 Y59.251 E.69578
G1 X161.34 Y59.251 E.01592
G1 X144.839 Y42.749 E.69578
G1 X145.373 Y42.749 E.01592
G1 X161.874 Y59.251 E.69578
G1 X162.408 Y59.251 E.01592
G1 X145.907 Y42.749 E.69578
G1 X146.44 Y42.749 E.01592
G1 X162.942 Y59.251 E.69578
G1 X163.475 Y59.251 E.01592
G1 X146.974 Y42.749 E.69578
G1 X147.508 Y42.749 E.01592
G1 X164.009 Y59.251 E.69578
G1 X164.543 Y59.251 E.01592
G1 X148.042 Y42.749 E.69578
G1 X148.576 Y42.749 E.01592
G1 X165.077 Y59.251 E.69578
G1 X165.61 Y59.251 E.01592
G1 X149.109 Y42.749 E.69578
G1 X149.643 Y42.749 E.01592
G1 X166.144 Y59.251 E.69578
G1 X166.678 Y59.251 E.01592
G1 X150.177 Y42.749 E.69578
G1 X150.711 Y42.749 E.01592
G1 X167.212 Y59.251 E.69578
M73 P72 R18
G1 X167.746 Y59.251 E.01592
G1 X151.245 Y42.749 E.69578
G1 X151.778 Y42.749 E.01592
G1 X168.279 Y59.251 E.69578
G1 X168.813 Y59.251 E.01592
G1 X152.312 Y42.749 E.69578
G1 X152.846 Y42.749 E.01592
G1 X169.347 Y59.251 E.69578
G1 X169.881 Y59.251 E.01592
G1 X153.38 Y42.749 E.69578
G1 X153.914 Y42.749 E.01592
G1 X170.415 Y59.251 E.69578
G1 X170.948 Y59.251 E.01592
G1 X154.447 Y42.749 E.69578
G1 X154.981 Y42.749 E.01592
G1 X171.482 Y59.251 E.69578
G1 X172.016 Y59.251 E.01592
G1 X155.515 Y42.749 E.69578
G1 X156.049 Y42.749 E.01592
G1 X172.55 Y59.251 E.69578
G1 X173.084 Y59.251 E.01592
G1 X156.583 Y42.749 E.69578
G1 X157.116 Y42.749 E.01592
G1 X173.617 Y59.251 E.69578
G1 X174.151 Y59.251 E.01592
G1 X157.65 Y42.749 E.69578
G1 X158.184 Y42.749 E.01592
G1 X174.685 Y59.251 E.69578
G1 X175.219 Y59.251 E.01592
G1 X158.718 Y42.749 E.69578
G1 X159.252 Y42.749 E.01592
G1 X175.753 Y59.251 E.69578
G1 X176.286 Y59.251 E.01592
G1 X159.785 Y42.749 E.69578
G1 X160.319 Y42.749 E.01592
G1 X176.82 Y59.251 E.69578
G1 X177.354 Y59.251 E.01592
G1 X160.853 Y42.749 E.69578
G1 X161.387 Y42.749 E.01592
G1 X177.888 Y59.251 E.69578
G1 X178.422 Y59.251 E.01592
G1 X161.92 Y42.749 E.69578
G1 X162.454 Y42.749 E.01592
G1 X178.955 Y59.251 E.69578
G1 X179.489 Y59.251 E.01592
G1 X162.988 Y42.749 E.69578
G1 X163.522 Y42.749 E.01592
G1 X180.023 Y59.251 E.69578
G1 X180.557 Y59.251 E.01592
G1 X164.056 Y42.749 E.69578
G1 X164.589 Y42.749 E.01592
G1 X181.091 Y59.251 E.69578
G1 X181.624 Y59.251 E.01592
G1 X165.123 Y42.749 E.69578
G1 X165.657 Y42.749 E.01592
G1 X182.158 Y59.251 E.69578
G1 X182.692 Y59.251 E.01592
G1 X166.191 Y42.749 E.69578
G1 X166.725 Y42.749 E.01592
G1 X183.226 Y59.251 E.69578
G1 X183.76 Y59.251 E.01592
G1 X167.258 Y42.749 E.69578
G1 X167.792 Y42.749 E.01592
G1 X184.293 Y59.251 E.69578
G1 X184.827 Y59.251 E.01592
G1 X168.326 Y42.749 E.69578
G1 X168.86 Y42.749 E.01592
G1 X185.361 Y59.251 E.69578
G1 X185.895 Y59.251 E.01592
G1 X169.394 Y42.749 E.69578
G1 X169.927 Y42.749 E.01592
G1 X186.428 Y59.251 E.69578
G1 X186.962 Y59.251 E.01592
G1 X170.461 Y42.749 E.69578
G1 X170.995 Y42.749 E.01592
G1 X187.496 Y59.251 E.69578
G1 X188.03 Y59.251 E.01592
G1 X171.529 Y42.749 E.69578
G1 X172.063 Y42.749 E.01592
G1 X188.564 Y59.251 E.69578
G1 X189.097 Y59.251 E.01592
G1 X172.596 Y42.749 E.69578
G1 X173.13 Y42.749 E.01592
G1 X189.631 Y59.251 E.69578
G1 X190.165 Y59.251 E.01592
G1 X173.664 Y42.749 E.69578
G1 X174.198 Y42.749 E.01592
G1 X190.699 Y59.251 E.69578
G1 X191.233 Y59.251 E.01592
G1 X174.732 Y42.749 E.69578
G1 X175.265 Y42.749 E.01592
G1 X208.251 Y75.735 E1.39085
G1 X208.251 Y75.201 E.01592
G1 X175.799 Y42.749 E1.36834
G1 X176.333 Y42.749 E.01592
G1 X208.251 Y74.667 E1.34584
G1 X208.251 Y74.133 E.01592
G1 X176.867 Y42.749 E1.32333
G1 X177.401 Y42.749 E.01592
G1 X208.251 Y73.599 E1.30082
G1 X208.251 Y73.066 E.01592
G1 X177.934 Y42.749 E1.27831
G1 X178.468 Y42.749 E.01592
G1 X208.251 Y72.532 E1.2558
G1 X208.251 Y71.998 E.01592
G1 X179.002 Y42.749 E1.2333
G1 X179.536 Y42.749 E.01592
G1 X208.251 Y71.464 E1.21079
G1 X208.251 Y70.93 E.01592
G1 X180.07 Y42.749 E1.18828
G1 X180.603 Y42.749 E.01592
G1 X208.251 Y70.397 E1.16577
G1 X208.251 Y69.863 E.01592
G1 X181.137 Y42.749 E1.14326
G1 X181.671 Y42.749 E.01592
G1 X208.251 Y69.329 E1.12076
G1 X208.251 Y68.795 E.01592
G1 X182.205 Y42.749 E1.09825
G1 X182.738 Y42.749 E.01592
G1 X208.251 Y68.262 E1.07574
G1 X208.251 Y67.728 E.01592
G1 X183.272 Y42.749 E1.05323
G1 X183.806 Y42.749 E.01592
G1 X208.251 Y67.194 E1.03072
G1 X208.251 Y66.66 E.01592
G1 X184.34 Y42.749 E1.00822
G1 X184.874 Y42.749 E.01592
G1 X208.251 Y66.126 E.98571
G1 X208.251 Y65.593 E.01592
G1 X185.407 Y42.749 E.9632
G1 X185.941 Y42.749 E.01592
G1 X208.42 Y65.228 E.94785
G1 X208.42 Y76.438 F30000
G1 F9537.687
G1 X191.749 Y59.767 E.70294
G1 X191.749 Y60.301 E.01592
G1 X208.251 Y76.802 E.69578
G1 X208.251 Y77.336 E.01592
G1 X191.749 Y60.835 E.69578
G1 X191.749 Y61.369 E.01592
G1 X208.251 Y77.87 E.69578
G1 X208.251 Y78.404 E.01592
G1 X191.749 Y61.903 E.69578
G1 X191.749 Y62.436 E.01592
G1 X208.251 Y78.937 E.69578
G1 X208.251 Y79.471 E.01592
G1 X191.749 Y62.97 E.69578
G1 X191.749 Y63.504 E.01592
G1 X208.251 Y80.005 E.69578
G1 X208.251 Y80.539 E.01592
G1 X191.749 Y64.038 E.69578
G1 X191.749 Y64.572 E.01592
G1 X208.251 Y81.073 E.69578
G1 X208.251 Y81.606 E.01592
G1 X191.749 Y65.105 E.69578
G1 X191.749 Y65.639 E.01592
G1 X208.251 Y82.14 E.69578
G1 X208.251 Y82.674 E.01592
G1 X191.749 Y66.173 E.69578
G1 X191.749 Y66.707 E.01592
G1 X208.251 Y83.208 E.69578
G1 X208.251 Y83.742 E.01592
G1 X191.749 Y67.24 E.69578
G1 X191.749 Y67.774 E.01592
G1 X208.251 Y84.275 E.69578
G1 X208.251 Y84.809 E.01592
G1 X191.749 Y68.308 E.69578
G1 X191.749 Y68.842 E.01592
G1 X208.251 Y85.343 E.69578
G1 X208.251 Y85.877 E.01592
G1 X191.749 Y69.376 E.69578
G1 X191.749 Y69.909 E.01592
G1 X208.251 Y86.411 E.69578
G1 X208.251 Y86.944 E.01592
G1 X191.749 Y70.443 E.69578
G1 X191.749 Y70.977 E.01592
G1 X208.251 Y87.478 E.69578
G1 X208.251 Y88.012 E.01592
G1 X191.749 Y71.511 E.69578
G1 X191.749 Y72.045 E.01592
G1 X208.251 Y88.546 E.69578
G1 X208.251 Y89.08 E.01592
G1 X191.749 Y72.578 E.69578
G1 X191.749 Y73.112 E.01592
G1 X208.251 Y89.613 E.69578
G1 X208.251 Y90.147 E.01592
G1 X191.749 Y73.646 E.69578
G1 X191.749 Y74.18 E.01592
G1 X208.251 Y90.681 E.69578
G1 X208.251 Y91.215 E.01592
G1 X191.749 Y74.714 E.69578
G1 X191.749 Y75.247 E.01592
G1 X208.251 Y91.748 E.69578
G1 X208.251 Y92.282 E.01592
G1 X191.749 Y75.781 E.69578
G1 X191.749 Y76.315 E.01592
G1 X208.251 Y92.816 E.69578
G1 X208.251 Y93.35 E.01592
G1 X191.749 Y76.849 E.69578
G1 X191.749 Y77.383 E.01592
G1 X208.251 Y93.884 E.69578
G1 X208.251 Y94.417 E.01592
G1 X191.749 Y77.916 E.69578
G1 X191.749 Y78.45 E.01592
G1 X208.251 Y94.951 E.69578
G1 X208.251 Y95.485 E.01592
G1 X191.749 Y78.984 E.69578
G1 X191.749 Y79.518 E.01592
G1 X208.251 Y96.019 E.69578
G1 X208.251 Y96.553 E.01592
G1 X191.749 Y80.052 E.69578
G1 X191.749 Y80.585 E.01592
G1 X208.251 Y97.086 E.69578
G1 X208.251 Y97.62 E.01592
G1 X191.749 Y81.119 E.69578
G1 X191.749 Y81.653 E.01592
G1 X208.251 Y98.154 E.69578
G1 X208.251 Y98.688 E.01592
G1 X191.749 Y82.187 E.69578
G1 X191.749 Y82.721 E.01592
G1 X208.251 Y99.222 E.69578
G1 X208.251 Y99.755 E.01592
G1 X191.749 Y83.254 E.69578
G1 X191.749 Y83.788 E.01592
G1 X208.251 Y100.289 E.69578
G1 X208.251 Y100.823 E.01592
G1 X191.749 Y84.322 E.69578
G1 X191.749 Y84.856 E.01592
G1 X208.251 Y101.357 E.69578
G1 X208.251 Y101.891 E.01592
G1 X191.749 Y85.39 E.69578
G1 X191.749 Y85.923 E.01592
G1 X208.251 Y102.424 E.69578
G1 X208.251 Y102.958 E.01592
G1 X191.749 Y86.457 E.69578
G1 X191.749 Y86.991 E.01592
G1 X208.251 Y103.492 E.69578
G1 X208.251 Y104.026 E.01592
G1 X191.749 Y87.525 E.69578
G1 X191.749 Y88.058 E.01592
G1 X208.251 Y104.56 E.69578
G1 X208.251 Y105.093 E.01592
G1 X191.749 Y88.592 E.69578
G1 X191.749 Y89.126 E.01592
G1 X208.251 Y105.627 E.69578
G1 X208.251 Y106.161 E.01592
G1 X191.749 Y89.66 E.69578
G1 X191.749 Y90.194 E.01592
G1 X208.251 Y106.695 E.69578
G1 X208.251 Y107.229 E.01592
G1 X191.749 Y90.727 E.69578
G1 X191.749 Y91.261 E.01592
G1 X208.251 Y107.762 E.69578
G1 X208.251 Y108.296 E.01592
G1 X191.749 Y91.795 E.69578
G1 X191.749 Y92.329 E.01592
G1 X208.251 Y108.83 E.69578
G1 X208.251 Y109.364 E.01592
G1 X191.749 Y92.863 E.69578
G1 X191.749 Y93.396 E.01592
G1 X208.251 Y109.898 E.69578
G1 X208.251 Y110.431 E.01592
G1 X191.749 Y93.93 E.69578
G1 X191.749 Y94.464 E.01592
G1 X208.251 Y110.965 E.69578
G1 X208.251 Y111.499 E.01592
G1 X191.749 Y94.998 E.69578
G1 X191.749 Y95.532 E.01592
G1 X208.251 Y112.033 E.69578
G1 X208.251 Y112.566 E.01592
G1 X191.749 Y96.065 E.69578
G1 X191.749 Y96.599 E.01592
G1 X208.251 Y113.1 E.69578
G1 X208.251 Y113.634 E.01592
G1 X191.749 Y97.133 E.69578
G1 X191.749 Y97.667 E.01592
G1 X208.251 Y114.168 E.69578
G1 X208.251 Y114.702 E.01592
G1 X191.749 Y98.201 E.69578
G1 X191.749 Y98.734 E.01592
G1 X208.251 Y115.235 E.69578
G1 X208.251 Y115.769 E.01592
G1 X191.749 Y99.268 E.69578
G1 X191.749 Y99.802 E.01592
G1 X208.251 Y116.303 E.69578
G1 X208.251 Y116.837 E.01592
G1 X191.749 Y100.336 E.69578
M73 P73 R18
G1 X191.749 Y100.87 E.01592
G1 X208.251 Y117.371 E.69578
G1 X208.251 Y117.904 E.01592
G1 X191.749 Y101.403 E.69578
G1 X191.749 Y101.937 E.01592
G1 X208.251 Y118.438 E.69578
G1 X208.251 Y118.972 E.01592
G1 X191.749 Y102.471 E.69578
G1 X191.749 Y103.005 E.01592
G1 X208.251 Y119.506 E.69578
G1 X208.251 Y120.04 E.01592
G1 X191.749 Y103.539 E.69578
G1 X191.749 Y104.072 E.01592
G1 X208.251 Y120.573 E.69578
G1 X208.251 Y121.107 E.01592
G1 X191.749 Y104.606 E.69578
G1 X191.749 Y105.14 E.01592
G1 X208.251 Y121.641 E.69578
G1 X208.251 Y122.175 E.01592
G1 X191.749 Y105.674 E.69578
G1 X191.749 Y106.208 E.01592
G1 X208.251 Y122.709 E.69578
G1 X208.251 Y123.242 E.01592
G1 X191.749 Y106.741 E.69578
G1 X191.749 Y107.275 E.01592
G1 X208.251 Y123.776 E.69578
G1 X208.251 Y124.31 E.01592
G1 X191.749 Y107.809 E.69578
G1 X191.749 Y108.343 E.01592
G1 X208.251 Y124.844 E.69578
G1 X208.251 Y125.378 E.01592
G1 X191.749 Y108.876 E.69578
G1 X191.749 Y109.41 E.01592
G1 X208.251 Y125.911 E.69578
G1 X208.251 Y126.445 E.01592
G1 X191.749 Y109.944 E.69578
G1 X191.749 Y110.478 E.01592
G1 X208.251 Y126.979 E.69578
G1 X208.251 Y127.513 E.01592
G1 X191.749 Y111.012 E.69578
G1 X191.749 Y111.545 E.01592
G1 X208.251 Y128.047 E.69578
G1 X208.251 Y128.58 E.01592
G1 X191.749 Y112.079 E.69578
G1 X191.749 Y112.613 E.01592
G1 X208.251 Y129.114 E.69578
G1 X208.251 Y129.648 E.01592
G1 X203.301 Y124.699 E.20869
G3 X203.502 Y125.433 I-3.416 J1.328 E.02274
G1 X208.251 Y130.182 E.20023
G1 X208.251 Y130.716 E.01592
G1 X203.551 Y126.016 E.19817
G3 X203.511 Y126.509 I-2.49 J.045 E.01479
G1 X208.251 Y131.249 E.19987
G1 X208.251 Y131.783 E.01592
G1 X203.418 Y126.951 E.20376
G3 X203.284 Y127.35 I-2.068 J-.476 E.01258
G1 X208.251 Y132.317 E.20944
G1 X208.251 Y132.851 E.01592
G1 X203.111 Y127.711 E.2167
G3 X202.905 Y128.039 I-1.741 J-.865 E.01156
G1 X208.251 Y133.384 E.22539
G1 X208.251 Y133.918 E.01592
G1 X202.67 Y128.338 E.23531
G3 X202.406 Y128.608 I-1.482 J-1.185 E.01127
G1 X208.251 Y134.452 E.24644
G1 X208.251 Y134.986 E.01592
G1 X202.114 Y128.849 E.25876
G3 X201.792 Y129.061 I-1.221 J-1.501 E.01151
G1 X208.251 Y135.52 E.27232
G1 X208.251 Y136.053 E.01592
G1 X201.439 Y129.242 E.2872
G3 X201.052 Y129.389 I-.927 J-1.866 E.01237
G1 X208.251 Y136.587 E.30354
G1 X208.251 Y137.121 E.01592
G1 X200.625 Y129.496 E.32153
G3 X200.141 Y129.545 I-.776 J-5.244 E.01453
G1 X208.251 Y137.655 E.34197
G1 X208.251 Y138.189 E.01592
G1 X199.588 Y129.526 E.36526
G3 X198.905 Y129.377 I.609 J-4.421 E.02087
G1 X208.251 Y138.722 E.39407
G1 X208.251 Y139.256 E.01592
G1 X191.749 Y122.755 E.69578
G1 X191.749 Y122.221 E.01592
G1 X196.627 Y127.099 E.20566
G3 X196.477 Y126.415 I3.478 J-1.122 E.02091
G1 X191.749 Y121.688 E.19932
G1 X191.749 Y121.154 E.01592
G1 X196.453 Y125.857 E.19832
G3 X196.507 Y125.377 I4.728 J.29 E.0144
G1 X191.749 Y120.62 E.2006
G1 X191.749 Y120.086 E.01592
G1 X196.612 Y124.949 E.20504
G3 X196.757 Y124.56 I2.015 J.532 E.01239
G1 X191.749 Y119.552 E.21116
G1 X191.749 Y119.019 E.01592
G1 X196.938 Y124.207 E.21876
G3 X197.149 Y123.884 I1.716 J.897 E.01151
G1 X191.749 Y118.485 E.22768
G1 X191.749 Y117.951 E.01592
G1 X197.39 Y123.592 E.23785
G3 X197.661 Y123.328 I10.905 J10.933 E.01126
G1 X191.749 Y117.417 E.24925
G1 X191.749 Y116.883 E.01592
G1 X197.961 Y123.094 E.2619
G3 X198.29 Y122.89 I1.185 J1.545 E.01158
G1 X191.749 Y116.35 E.2758
G1 X191.749 Y115.816 E.01592
G1 X198.652 Y122.718 E.29105
G3 X199.05 Y122.582 I.878 J1.919 E.01256
G1 X191.749 Y115.282 E.30783
G1 X191.749 Y114.748 E.01592
G1 X199.489 Y122.488 E.32636
G3 X199.993 Y122.457 I.44 J3.075 E.01505
G1 X191.749 Y114.214 E.34758
G1 X191.749 Y113.681 E.01592
G1 X200.565 Y122.496 E.3717
G3 X201.296 Y122.693 I-.739 J4.189 E.02262
G1 X191.58 Y112.977 E.40969
; WIPE_START
G1 X192.994 Y114.391 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X196.937 Y120.927 Z3 F30000
G1 X208.42 Y139.96 Z3
G1 Z2.6
G1 E.8 F1800
G1 F9537.687
G1 X191.749 Y123.289 E.70294
G1 X191.749 Y123.823 E.01592
G1 X208.251 Y140.324 E.69578
G1 X208.251 Y140.858 E.01592
G1 X191.749 Y124.357 E.69578
G1 X191.749 Y124.89 E.01592
G1 X208.251 Y141.391 E.69578
G1 X208.251 Y141.925 E.01592
G1 X191.749 Y125.424 E.69578
G1 X191.749 Y125.958 E.01592
G1 X208.251 Y142.459 E.69578
G1 X208.251 Y142.993 E.01592
G1 X191.749 Y126.492 E.69578
G1 X191.749 Y127.026 E.01592
G1 X208.251 Y143.527 E.69578
G1 X208.251 Y144.06 E.01592
G1 X191.749 Y127.559 E.69578
G1 X191.749 Y128.093 E.01592
G1 X208.251 Y144.594 E.69578
G1 X208.251 Y145.128 E.01592
G1 X191.749 Y128.627 E.69578
G1 X191.749 Y129.161 E.01592
G1 X208.251 Y145.662 E.69578
G1 X208.251 Y146.196 E.01592
G1 X191.749 Y129.695 E.69578
G1 X191.749 Y130.228 E.01592
G1 X208.251 Y146.729 E.69578
G1 X208.251 Y147.263 E.01592
G1 X191.749 Y130.762 E.69578
G1 X191.749 Y131.296 E.01592
G1 X208.251 Y147.797 E.69578
G1 X208.251 Y148.331 E.01592
G1 X191.749 Y131.83 E.69578
G1 X191.749 Y132.363 E.01592
G1 X208.251 Y148.865 E.69578
G1 X208.251 Y149.398 E.01592
G1 X191.749 Y132.897 E.69578
G1 X191.749 Y133.431 E.01592
G1 X208.251 Y149.932 E.69578
G1 X208.251 Y150.466 E.01592
G1 X191.749 Y133.965 E.69578
G1 X191.749 Y134.499 E.01592
G1 X208.251 Y151 E.69578
G1 X208.251 Y151.534 E.01592
G1 X191.749 Y135.032 E.69578
G1 X191.749 Y135.566 E.01592
G1 X208.251 Y152.067 E.69578
G1 X208.251 Y152.601 E.01592
G1 X191.749 Y136.1 E.69578
G1 X191.749 Y136.634 E.01592
G1 X208.251 Y153.135 E.69578
G1 X208.251 Y153.669 E.01592
G1 X191.749 Y137.168 E.69578
G1 X191.749 Y137.701 E.01592
G1 X208.251 Y154.202 E.69578
G1 X208.251 Y154.736 E.01592
G1 X191.749 Y138.235 E.69578
G1 X191.749 Y138.769 E.01592
G1 X208.251 Y155.27 E.69578
G1 X208.251 Y155.804 E.01592
G1 X191.749 Y139.303 E.69578
G1 X191.749 Y139.837 E.01592
G1 X208.251 Y156.338 E.69578
G1 X208.251 Y156.871 E.01592
G1 X191.749 Y140.37 E.69578
G1 X191.749 Y140.904 E.01592
G1 X208.251 Y157.405 E.69578
G1 X208.251 Y157.939 E.01592
G1 X191.749 Y141.438 E.69578
G1 X191.749 Y141.972 E.01592
G1 X208.251 Y158.473 E.69578
G1 X208.251 Y159.007 E.01592
G1 X191.749 Y142.506 E.69578
G1 X191.749 Y143.039 E.01592
G1 X208.251 Y159.54 E.69578
G1 X208.251 Y160.074 E.01592
G1 X191.749 Y143.573 E.69578
G1 X191.749 Y144.107 E.01592
G1 X208.251 Y160.608 E.69578
G1 X208.251 Y161.142 E.01592
G1 X191.749 Y144.641 E.69578
G1 X191.749 Y145.175 E.01592
G1 X208.251 Y161.676 E.69578
G1 X208.251 Y162.209 E.01592
G1 X191.749 Y145.708 E.69578
G1 X191.749 Y146.242 E.01592
G1 X208.251 Y162.743 E.69578
G1 X208.251 Y163.277 E.01592
G1 X191.749 Y146.776 E.69578
G1 X191.749 Y147.31 E.01592
G1 X208.251 Y163.811 E.69578
G1 X208.251 Y164.345 E.01592
G1 X191.749 Y147.844 E.69578
G1 X191.749 Y148.377 E.01592
G1 X208.251 Y164.878 E.69578
G1 X208.251 Y165.412 E.01592
G1 X191.749 Y148.911 E.69578
G1 X191.749 Y149.445 E.01592
G1 X208.251 Y165.946 E.69578
G1 X208.251 Y166.48 E.01592
G1 X191.749 Y149.979 E.69578
G1 X191.749 Y150.513 E.01592
G1 X208.251 Y167.014 E.69578
G1 X208.251 Y167.547 E.01592
G1 X191.749 Y151.046 E.69578
G1 X191.749 Y151.58 E.01592
G1 X208.251 Y168.081 E.69578
G1 X208.251 Y168.615 E.01592
G1 X191.749 Y152.114 E.69578
G1 X191.749 Y152.648 E.01592
G1 X208.251 Y169.149 E.69578
G1 X208.251 Y169.683 E.01592
G1 X191.749 Y153.181 E.69578
G1 X191.749 Y153.715 E.01592
G1 X208.251 Y170.216 E.69578
G1 X208.251 Y170.75 E.01592
G1 X191.749 Y154.249 E.69578
G1 X191.749 Y154.783 E.01592
G1 X208.251 Y171.284 E.69578
G1 X208.251 Y171.818 E.01592
G1 X191.749 Y155.317 E.69578
G1 X191.749 Y155.85 E.01592
G1 X208.251 Y172.352 E.69578
G1 X208.251 Y172.885 E.01592
G1 X191.749 Y156.384 E.69578
G1 X191.749 Y156.918 E.01592
G1 X208.251 Y173.419 E.69578
G1 X208.251 Y173.953 E.01592
G1 X191.749 Y157.452 E.69578
G1 X191.749 Y157.986 E.01592
G1 X208.251 Y174.487 E.69578
G1 X208.251 Y175.02 E.01592
G1 X191.749 Y158.519 E.69578
G1 X191.749 Y159.053 E.01592
G1 X208.251 Y175.554 E.69578
G1 X208.251 Y176.088 E.01592
G1 X191.749 Y159.587 E.69578
G1 X191.749 Y160.121 E.01592
G1 X208.251 Y176.622 E.69578
G1 X208.251 Y177.156 E.01592
G1 X191.749 Y160.655 E.69578
G1 X191.749 Y161.188 E.01592
G1 X208.251 Y177.689 E.69578
G1 X208.251 Y178.223 E.01592
G1 X191.749 Y161.722 E.69578
G1 X191.749 Y162.256 E.01592
G1 X208.251 Y178.757 E.69578
G1 X208.251 Y179.291 E.01592
G1 X191.749 Y162.79 E.69578
G1 X191.749 Y163.324 E.01592
G1 X208.251 Y179.825 E.69578
G1 X208.251 Y180.358 E.01592
G1 X191.749 Y163.857 E.69578
G1 X191.749 Y164.391 E.01592
G1 X208.251 Y180.892 E.69578
G1 X208.251 Y181.426 E.01592
G1 X191.749 Y164.925 E.69578
G1 X191.749 Y165.459 E.01592
G1 X208.251 Y181.96 E.69578
G1 X208.251 Y182.494 E.01592
G1 X191.749 Y165.993 E.69578
G1 X191.749 Y166.526 E.01592
G1 X208.251 Y183.027 E.69578
G1 X208.251 Y183.561 E.01592
G1 X191.749 Y167.06 E.69578
G1 X191.749 Y167.594 E.01592
G1 X208.251 Y184.095 E.69578
G1 X208.251 Y184.629 E.01592
G1 X191.749 Y168.128 E.69578
G1 X191.749 Y168.662 E.01592
G1 X208.251 Y185.163 E.69578
G1 X208.251 Y185.696 E.01592
G1 X191.749 Y169.195 E.69578
G1 X191.749 Y169.729 E.01592
G1 X208.251 Y186.23 E.69578
G1 X208.251 Y186.764 E.01592
G1 X191.749 Y170.263 E.69578
G1 X191.749 Y170.797 E.01592
G1 X208.251 Y187.298 E.69578
G1 X208.251 Y187.832 E.01592
G1 X191.749 Y171.331 E.69578
G1 X191.749 Y171.864 E.01592
G1 X208.251 Y188.365 E.69578
G1 X208.251 Y188.899 E.01592
G1 X191.749 Y172.398 E.69578
G1 X191.749 Y172.932 E.01592
G1 X208.251 Y189.433 E.69578
G1 X208.251 Y189.967 E.01592
G1 X191.749 Y173.466 E.69578
G1 X191.749 Y173.999 E.01592
G1 X208.251 Y190.501 E.69578
G1 X208.251 Y191.034 E.01592
G1 X191.749 Y174.533 E.69578
G1 X191.749 Y175.067 E.01592
G1 X208.251 Y191.568 E.69578
G1 X208.251 Y192.102 E.01592
G1 X191.749 Y175.601 E.69578
G1 X191.749 Y176.135 E.01592
G1 X208.251 Y192.636 E.69578
G1 X208.251 Y193.17 E.01592
G1 X191.749 Y176.668 E.69578
G1 X191.749 Y177.202 E.01592
G1 X208.251 Y193.703 E.69578
G1 X208.251 Y194.237 E.01592
G1 X191.749 Y177.736 E.69578
G1 X191.749 Y178.27 E.01592
G1 X208.251 Y194.771 E.69578
G1 X208.251 Y195.305 E.01592
G1 X191.749 Y178.804 E.69578
G1 X191.749 Y179.337 E.01592
G1 X208.251 Y195.838 E.69578
G1 X208.251 Y196.372 E.01592
G1 X191.749 Y179.871 E.69578
G1 X191.749 Y180.405 E.01592
G1 X208.251 Y196.906 E.69578
G1 X208.251 Y197.44 E.01592
G1 X191.749 Y180.939 E.69578
G1 X191.749 Y181.473 E.01592
G1 X208.251 Y197.974 E.69578
G1 X208.251 Y198.507 E.01592
G1 X191.749 Y182.006 E.69578
G1 X191.749 Y182.54 E.01592
G1 X208.251 Y199.041 E.69578
G1 X208.251 Y199.575 E.01592
G1 X191.749 Y183.074 E.69578
G1 X191.749 Y183.608 E.01592
G1 X208.251 Y200.109 E.69578
G1 X208.251 Y200.643 E.01592
G1 X191.749 Y184.142 E.69578
G1 X191.749 Y184.675 E.01592
G1 X208.251 Y201.176 E.69578
G1 X208.251 Y201.71 E.01592
G1 X191.749 Y185.209 E.69578
G1 X191.749 Y185.743 E.01592
G1 X208.251 Y202.244 E.69578
G1 X208.251 Y202.778 E.01592
G1 X191.749 Y186.277 E.69578
G1 X191.749 Y186.811 E.01592
G1 X208.251 Y203.312 E.69578
G1 X208.251 Y203.845 E.01592
G1 X191.749 Y187.344 E.69578
G1 X191.749 Y187.878 E.01592
G1 X208.251 Y204.379 E.69578
G1 X208.251 Y204.913 E.01592
G1 X203.429 Y200.092 E.2033
G3 X203.538 Y200.735 I-3.614 J.945 E.01947
G1 X208.251 Y205.447 E.19869
G1 X208.251 Y205.981 E.01592
G1 X203.538 Y201.268 E.1987
G3 X203.473 Y201.737 I-4.873 J-.441 E.01411
G1 X208.251 Y206.514 E.20146
G1 X208.251 Y207.048 E.01592
G1 X203.355 Y202.153 E.20641
G3 X203.2 Y202.531 I-1.969 J-.589 E.01221
G1 X208.251 Y207.582 E.21297
G1 X208.251 Y208.116 E.01592
G1 X203.011 Y202.876 E.22094
G3 X202.791 Y203.19 I-1.68 J-.941 E.01145
G1 X208.251 Y208.65 E.2302
G1 X208.251 Y209.183 E.01592
G1 X202.542 Y203.475 E.24069
G3 X202.265 Y203.732 I-1.423 J-1.258 E.01128
G1 X207.784 Y209.251 E.2327
G1 X207.25 Y209.251 E.01592
G1 X201.96 Y203.96 E.22308
G3 X201.624 Y204.158 I-1.162 J-1.582 E.01164
G1 X206.716 Y209.251 E.21472
G1 X206.183 Y209.251 E.01592
G1 X201.253 Y204.321 E.20786
G3 X200.844 Y204.446 I-.826 J-1.976 E.01277
G1 X205.649 Y209.251 E.2026
G1 X205.115 Y209.251 E.01592
G1 X200.39 Y204.526 E.19921
G3 X199.879 Y204.548 I-.448 J-4.459 E.01528
G1 X204.581 Y209.251 E.19828
G1 X204.047 Y209.251 E.01592
G1 X199.27 Y204.473 E.20144
G3 X198.459 Y204.196 I.444 J-2.626 E.02565
G1 X203.514 Y209.251 E.21311
G1 X202.98 Y209.251 E.01592
G1 X186.479 Y192.749 E.69578
G1 X187.012 Y192.749 E.01592
G1 X196.797 Y202.534 E.41258
G3 X196.529 Y201.732 I3.452 J-1.6 E.02526
G1 X187.546 Y192.749 E.37877
G1 X188.08 Y192.749 E.01592
G1 X196.453 Y201.122 E.35304
G3 X196.474 Y200.61 I2.571 J-.15 E.01532
G1 X188.614 Y192.749 E.33143
G1 X189.148 Y192.749 E.01592
G1 X196.552 Y200.154 E.31221
G3 X196.679 Y199.747 I6.087 J1.671 E.01271
G1 X189.681 Y192.749 E.29505
G1 X190.215 Y192.749 E.01592
G1 X196.844 Y199.378 E.27951
G3 X197.042 Y199.042 I1.78 J.821 E.01165
G1 X190.749 Y192.749 E.26533
G1 X191.283 Y192.749 E.01592
G1 X197.269 Y198.736 E.25242
G3 X197.526 Y198.458 I1.513 J1.14 E.01128
M73 P73 R17
G1 X191.749 Y192.682 E.24355
G1 X191.749 Y192.149 E.01592
G1 X197.81 Y198.209 E.25556
G3 X198.124 Y197.989 I1.257 J1.456 E.01144
G1 X191.749 Y191.615 E.26878
G1 X191.749 Y191.081 E.01592
G1 X198.468 Y197.799 E.28329
G3 X198.845 Y197.643 I.97 J1.804 E.0122
G1 X191.749 Y190.547 E.29919
G1 X191.749 Y190.013 E.01592
G1 X199.264 Y197.528 E.31686
G3 X199.733 Y197.463 I.56 J2.314 E.01413
G1 X191.749 Y189.48 E.33662
G1 X191.749 Y188.946 E.01592
G1 X200.262 Y197.458 E.35892
G3 X200.906 Y197.568 I-.23 J3.273 E.01952
G1 X191.58 Y188.242 E.39324
; WIPE_START
G1 X192.994 Y189.656 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X185.476 Y190.976 Z3 F30000
G1 X80.377 Y209.42 Z3
G1 Z2.6
G1 E.8 F1800
G1 F9537.687
G1 X47.749 Y176.793 E1.37576
G1 X47.749 Y177.327 E.01592
G1 X79.673 Y209.251 E1.34609
G1 X79.139 Y209.251 E.01592
G1 X47.749 Y177.861 E1.32358
G1 X47.749 Y178.394 E.01592
G1 X78.606 Y209.251 E1.30108
G1 X78.072 Y209.251 E.01592
G1 X47.749 Y178.928 E1.27857
G1 X47.749 Y179.462 E.01592
G1 X77.538 Y209.251 E1.25606
G1 X77.004 Y209.251 E.01592
G1 X47.749 Y179.996 E1.23355
G1 X47.749 Y180.53 E.01592
G1 X76.47 Y209.251 E1.21104
G1 X75.937 Y209.251 E.01592
G1 X47.749 Y181.063 E1.18854
G1 X47.749 Y181.597 E.01592
G1 X75.403 Y209.251 E1.16603
G1 X74.869 Y209.251 E.01592
G1 X47.749 Y182.131 E1.14352
G1 X47.749 Y182.665 E.01592
G1 X74.335 Y209.251 E1.12101
G1 X73.801 Y209.251 E.01592
G1 X47.749 Y183.199 E1.0985
G1 X47.749 Y183.732 E.01592
G1 X73.268 Y209.251 E1.076
G1 X72.734 Y209.251 E.01592
G1 X47.749 Y184.266 E1.05349
G1 X47.749 Y184.8 E.01592
G1 X72.2 Y209.251 E1.03098
G1 X71.666 Y209.251 E.01592
G1 X47.749 Y185.334 E1.00847
G1 X47.749 Y185.868 E.01592
G1 X71.132 Y209.251 E.98597
G1 X70.599 Y209.251 E.01592
G1 X47.749 Y186.401 E.96346
G1 X47.749 Y186.935 E.01592
G1 X70.065 Y209.251 E.94095
G1 X69.531 Y209.251 E.01592
G1 X47.749 Y187.469 E.91844
G1 X47.749 Y188.003 E.01592
G1 X57.558 Y197.811 E.41359
G2 X56.744 Y197.531 I-1.595 J3.315 E.02572
G1 X47.749 Y188.537 E.37928
G1 X47.749 Y189.07 E.01592
G1 X56.137 Y197.458 E.35366
G2 X55.617 Y197.472 I-.169 J3.424 E.01552
G1 X47.749 Y189.604 E.33174
G1 X47.749 Y190.138 E.01592
G1 X55.162 Y197.551 E.31257
G2 X54.756 Y197.678 I.431 J2.094 E.01273
G1 X47.749 Y190.672 E.29542
G1 X47.749 Y191.206 E.01592
G1 X54.385 Y197.842 E.27981
G2 X54.048 Y198.038 I.812 J1.783 E.01166
G1 X47.749 Y191.739 E.26559
G1 X47.749 Y192.273 E.01592
G1 X53.741 Y198.265 E.25263
G2 X53.462 Y198.52 I1.138 J1.521 E.01128
G1 X47.749 Y192.807 E.24089
G1 X47.749 Y193.341 E.01592
G1 X53.212 Y198.804 E.23035
G2 X52.991 Y199.116 I1.453 J1.263 E.01144
G1 X47.749 Y193.875 E.22102
G1 X47.749 Y194.408 E.01592
G1 X52.8 Y199.459 E.21296
G2 X52.646 Y199.839 I1.826 J.962 E.01224
G1 X47.749 Y194.942 E.20647
G1 X47.749 Y195.476 E.01592
G1 X52.531 Y200.258 E.20162
G2 X52.463 Y200.723 I2.289 J.574 E.01405
G1 X47.749 Y196.01 E.19874
G1 X47.749 Y196.543 E.01592
G1 X52.461 Y201.255 E.19865
G2 X52.562 Y201.89 I4.702 J-.428 E.01921
G1 X47.749 Y197.077 E.20295
G1 X47.749 Y197.611 E.01592
G1 X59.389 Y209.251 E.49079
G1 X59.923 Y209.251 E.01592
G1 X55.105 Y204.433 E.20313
G2 X55.744 Y204.538 I.906 J-3.526 E.01932
G1 X60.457 Y209.251 E.19871
G1 X60.99 Y209.251 E.01592
G1 X56.28 Y204.54 E.19863
M73 P74 R17
G2 X56.743 Y204.469 I-.124 J-2.351 E.01398
G1 X61.524 Y209.251 E.20162
G1 X62.058 Y209.251 E.01592
G1 X57.16 Y204.352 E.20653
G2 X57.539 Y204.197 I-.586 J-1.971 E.01222
G1 X62.592 Y209.251 E.21307
G1 X63.125 Y209.251 E.01592
G1 X57.884 Y204.009 E.22103
G2 X58.198 Y203.789 I-.942 J-1.682 E.01145
G1 X63.659 Y209.251 E.2303
G1 X64.193 Y209.251 E.01592
G1 X58.482 Y203.54 E.2408
G2 X58.737 Y203.261 I-1.266 J-1.414 E.01128
G1 X64.727 Y209.251 E.25255
G1 X65.261 Y209.251 E.01592
G1 X58.963 Y202.953 E.26553
G2 X59.159 Y202.615 I-1.586 J-1.145 E.01167
G1 X65.794 Y209.251 E.27978
G1 X66.328 Y209.251 E.01592
G1 X59.322 Y202.244 E.29543
G2 X59.448 Y201.836 I-1.975 J-.831 E.01276
G1 X66.862 Y209.251 E.31264
G1 X67.396 Y209.251 E.01592
G1 X59.529 Y201.384 E.3317
G2 X59.545 Y200.866 I-4.466 J-.393 E.01547
G1 X67.93 Y209.251 E.35355
G1 X68.463 Y209.251 E.01592
G1 X59.472 Y200.259 E.37914
G2 X59.185 Y199.438 I-3.634 J.809 E.02597
G1 X69.167 Y209.42 E.42089
G1 X59.025 Y209.42 F30000
G1 F9537.687
G1 X47.749 Y198.145 E.47544
G1 X47.749 Y198.679 E.01592
G1 X58.321 Y209.251 E.44577
G1 X57.788 Y209.251 E.01592
G1 X47.749 Y199.212 E.42327
G1 X47.749 Y199.746 E.01592
G1 X57.254 Y209.251 E.40076
G1 X56.72 Y209.251 E.01592
G1 X47.749 Y200.28 E.37825
G1 X47.749 Y200.814 E.01592
G1 X56.186 Y209.251 E.35574
G1 X55.652 Y209.251 E.01592
G1 X47.749 Y201.348 E.33323
G1 X47.749 Y201.881 E.01592
G1 X55.119 Y209.251 E.31073
G1 X54.585 Y209.251 E.01592
G1 X47.749 Y202.415 E.28822
G1 X47.749 Y202.949 E.01592
G1 X54.051 Y209.251 E.26571
G1 X53.517 Y209.251 E.01592
G1 X47.749 Y203.483 E.2432
G1 X47.749 Y204.017 E.01592
G1 X52.983 Y209.251 E.22069
G1 X52.45 Y209.251 E.01592
G1 X47.749 Y204.55 E.19819
G1 X47.749 Y205.084 E.01592
G1 X51.916 Y209.251 E.17568
G1 X51.382 Y209.251 E.01592
G1 X47.749 Y205.618 E.15317
G1 X47.749 Y206.152 E.01592
G1 X50.848 Y209.251 E.13066
G1 X50.314 Y209.251 E.01592
G1 X47.749 Y206.686 E.10815
G1 X47.749 Y207.219 E.01592
G1 X49.781 Y209.251 E.08565
G1 X49.247 Y209.251 E.01592
G1 X47.749 Y207.753 E.06314
G1 X47.749 Y208.287 E.01592
G1 X48.713 Y209.251 E.04063
G1 X48.179 Y209.251 E.01592
G1 X47.58 Y208.651 E.02528
; WIPE_START
G1 X48.179 Y209.251 E-.32215
G1 X48.713 Y209.251 E-.20284
G1 X48.276 Y208.813 E-.23501
; WIPE_END
G1 E-.04 F1800
G1 X53.344 Y203.107 Z3 F30000
G1 X195.914 Y42.58 Z3
G1 Z2.6
G1 E.8 F1800
G1 F9537.687
G1 X200.901 Y47.567 E.2103
G2 X200.258 Y47.458 I-1.173 J4.948 E.01947
G1 X195.55 Y42.749 E.19853
G1 X195.016 Y42.749 E.01592
G1 X199.729 Y47.463 E.19875
G2 X199.261 Y47.528 I.092 J2.377 E.01413
G1 X194.482 Y42.749 E.20151
G1 X193.948 Y42.749 E.01592
G1 X198.842 Y47.644 E.20637
G2 X198.465 Y47.801 I.595 J1.961 E.01219
G1 X193.414 Y42.749 E.21298
G1 X192.881 Y42.749 E.01592
G1 X198.122 Y47.99 E.22099
G2 X197.808 Y48.211 I.946 J1.679 E.01144
G1 X192.347 Y42.749 E.23029
G1 X191.813 Y42.749 E.01592
G1 X197.524 Y48.46 E.2408
G2 X197.268 Y48.738 I1.261 J1.42 E.01128
G1 X191.279 Y42.749 E.25251
G1 X190.745 Y42.749 E.01592
G1 X197.04 Y49.044 E.26543
G2 X196.843 Y49.381 I1.585 J1.156 E.01165
G1 X190.212 Y42.749 E.27961
G1 X189.678 Y42.749 E.01592
G1 X196.678 Y49.749 E.29516
G2 X196.551 Y50.157 I5.916 J2.056 E.01272
G1 X189.144 Y42.749 E.31234
G1 X188.61 Y42.749 E.01592
G1 X196.474 Y50.613 E.33157
G2 X196.453 Y51.126 I2.553 J.361 E.01533
G1 X188.076 Y42.749 E.3532
G1 X187.543 Y42.749 E.01592
G1 X196.53 Y51.737 E.37896
G2 X196.8 Y52.54 I3.742 J-.809 E.02533
G1 X187.009 Y42.749 E.41285
G1 X186.475 Y42.749 E.01592
G1 X208.251 Y64.525 E.91818
G1 X208.251 Y63.991 E.01592
G1 X198.452 Y54.193 E.41316
G2 X199.266 Y54.472 I1.271 J-2.372 E.02576
G1 X208.251 Y63.457 E.37886
G1 X208.251 Y62.924 E.01592
G1 X199.875 Y54.548 E.35317
G2 X200.387 Y54.526 I.073 J-4.416 E.0153
G1 X208.251 Y62.39 E.33156
G1 X208.251 Y61.856 E.01592
G1 X200.841 Y54.446 E.31243
G2 X201.25 Y54.322 I-.417 J-2.106 E.01278
G1 X208.251 Y61.322 E.29517
G1 X208.251 Y60.788 E.01592
G1 X201.622 Y54.16 E.27951
G2 X201.957 Y53.962 I-.824 J-1.779 E.01164
G1 X208.251 Y60.255 E.26535
G1 X208.251 Y59.721 E.01592
G1 X202.263 Y53.734 E.25246
G2 X202.541 Y53.477 I-1.146 J-1.516 E.01128
G1 X208.251 Y59.187 E.24077
G1 X208.251 Y58.653 E.01592
G1 X202.789 Y53.192 E.23027
G2 X203.009 Y52.878 I-1.458 J-1.255 E.01145
G1 X208.251 Y58.119 E.221
G1 X208.251 Y57.586 E.01592
G1 X203.199 Y52.534 E.21302
G2 X203.354 Y52.156 I-1.81 J-.966 E.01221
G1 X208.251 Y57.052 E.20646
G1 X208.251 Y56.518 E.01592
G1 X203.472 Y51.74 E.20149
G2 X203.538 Y51.272 I-4.777 J-.912 E.01409
G1 X208.251 Y55.984 E.19871
G1 X208.251 Y55.45 E.01592
G1 X203.539 Y50.738 E.19868
G2 X203.43 Y50.096 I-3.703 J.294 E.01944
G1 X208.251 Y54.917 E.20325
G1 X208.251 Y54.383 E.01592
G1 X196.617 Y42.749 E.49053
G1 X197.151 Y42.749 E.01592
G1 X208.251 Y53.849 E.46803
G1 X208.251 Y53.315 E.01592
G1 X197.685 Y42.749 E.44552
G1 X198.219 Y42.749 E.01592
G1 X208.251 Y52.781 E.42301
G1 X208.251 Y52.248 E.01592
G1 X198.752 Y42.749 E.4005
G1 X199.286 Y42.749 E.01592
G1 X208.251 Y51.714 E.37799
G1 X208.251 Y51.18 E.01592
G1 X199.82 Y42.749 E.35549
G1 X200.354 Y42.749 E.01592
G1 X208.251 Y50.646 E.33298
G1 X208.251 Y50.112 E.01592
G1 X200.888 Y42.749 E.31047
G1 X201.421 Y42.749 E.01592
G1 X208.251 Y49.579 E.28796
G1 X208.251 Y49.045 E.01592
G1 X201.955 Y42.749 E.26545
G1 X202.489 Y42.749 E.01592
G1 X208.251 Y48.511 E.24295
G1 X208.251 Y47.977 E.01592
G1 X203.023 Y42.749 E.22044
G1 X203.557 Y42.749 E.01592
G1 X208.251 Y47.444 E.19793
G1 X208.251 Y46.91 E.01592
G1 X204.09 Y42.749 E.17542
G1 X204.624 Y42.749 E.01592
G1 X208.251 Y46.376 E.15291
G1 X208.251 Y45.842 E.01592
G1 X205.158 Y42.749 E.13041
G1 X205.692 Y42.749 E.01592
G1 X208.251 Y45.308 E.1079
G1 X208.251 Y44.775 E.01592
G1 X206.225 Y42.749 E.08539
G1 X206.759 Y42.749 E.01592
G1 X208.251 Y44.241 E.06288
G1 X208.251 Y43.707 E.01592
G1 X207.293 Y42.749 E.04037
G1 X207.827 Y42.749 E.01592
G1 X208.42 Y43.343 E.02502
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9537.687
G1 X207.827 Y42.749 E-.31888
G1 X207.293 Y42.749 E-.20284
G1 X207.736 Y43.193 E-.23828
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/58
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
G1 X199.845 Y122.789
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X199.896 Y122.785 E.00165
G3 X200.234 Y122.79 I.114 J3.511 E.01089
G3 X199.6 Y122.807 I-.232 J3.208 E.62935
G1 X199.785 Y122.793 E.00596
G1 X199.874 Y123.195 F30000
G1 F8843.478
G1 X199.908 Y123.192 E.00109
G3 X200.205 Y123.197 I.101 J3.071 E.00958
G3 X199.651 Y123.211 I-.204 J2.801 E.54961
G1 X199.814 Y123.199 E.00527
G1 X199.921 Y123.61 F30000
G1 F8843.478
G1 X200.177 Y123.604 E.00823
G3 X199.701 Y123.616 I-.176 J2.395 E.46986
G1 X199.861 Y123.612 E.00514
G1 X199.927 Y123.992 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X199.931 Y123.992 E.00011
G3 X199.75 Y124.005 I.059 J2.008 E.3706
G1 X199.867 Y123.997 E.0035
; WIPE_START
M204 S10000
G1 X199.931 Y123.992 E-.02425
G1 X200.149 Y123.995 E-.08296
G1 X200.544 Y124.065 E-.15244
G1 X200.917 Y124.211 E-.15211
G1 X201.253 Y124.428 E-.15213
G1 X201.54 Y124.708 E-.15213
G1 X201.605 Y124.803 E-.04398
; WIPE_END
G1 E-.04 F1800
G1 X201.431 Y117.173 Z3.2 F30000
G1 X199.845 Y47.789 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X199.896 Y47.785 E.00165
G3 X200.234 Y47.79 I.114 J3.51 E.01088
G3 X199.6 Y47.807 I-.232 J3.208 E.62936
G1 X199.785 Y47.793 E.00596
G1 X199.874 Y48.195 F30000
G1 F8843.478
G1 X199.908 Y48.192 E.00109
G3 X200.205 Y48.197 I.1 J3.07 E.00958
G3 X199.651 Y48.211 I-.204 J2.801 E.54961
G1 X199.814 Y48.199 E.00527
G1 X199.921 Y48.61 F30000
G1 F8843.478
G1 X200.177 Y48.604 E.00822
G3 X199.701 Y48.616 I-.176 J2.395 E.46986
G1 X199.861 Y48.612 E.00514
G1 X199.927 Y48.992 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X199.931 Y48.992 E.00012
G3 X199.75 Y49.005 I.059 J2.008 E.3706
G1 X199.867 Y48.997 E.0035
; WIPE_START
M204 S10000
G1 X199.931 Y48.992 E-.02429
G1 X200.149 Y48.995 E-.08292
G1 X200.544 Y49.065 E-.15251
G1 X200.917 Y49.211 E-.15208
G1 X201.253 Y49.428 E-.15217
G1 X201.54 Y49.708 E-.15209
G1 X201.605 Y49.803 E-.04394
; WIPE_END
G1 E-.04 F1800
G1 X193.975 Y49.595 Z3.2 F30000
G1 X127.845 Y47.789 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X127.896 Y47.785 E.00165
G3 X128.234 Y47.79 I.114 J3.505 E.01088
G3 X127.6 Y47.807 I-.232 J3.208 E.62935
G1 X127.785 Y47.793 E.00596
G1 X127.874 Y48.195 F30000
G1 F8843.478
G1 X127.908 Y48.192 E.00109
G3 X128.205 Y48.197 I.1 J3.065 E.00958
G3 X127.65 Y48.211 I-.204 J2.801 E.54961
G1 X127.814 Y48.199 E.00527
G1 X127.921 Y48.61 F30000
G1 F8843.478
G1 X128.177 Y48.604 E.00822
G3 X127.701 Y48.616 I-.176 J2.395 E.46986
G1 X127.861 Y48.612 E.00515
G1 X127.928 Y48.992 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X127.931 Y48.992 E.0001
G3 X127.75 Y49.005 I.059 J2.008 E.3706
G1 X127.868 Y48.997 E.00351
; WIPE_START
M204 S10000
G1 X127.931 Y48.992 E-.02414
G1 X128.149 Y48.995 E-.08292
G1 X128.544 Y49.065 E-.15251
G1 X128.917 Y49.211 E-.15208
G1 X129.253 Y49.428 E-.15214
G1 X129.54 Y49.708 E-.15212
G1 X129.605 Y49.804 E-.04408
; WIPE_END
G1 E-.04 F1800
G1 X121.976 Y49.595 Z3.2 F30000
G1 X55.844 Y47.789 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X55.896 Y47.785 E.00165
G3 X56.234 Y47.79 I.114 J3.504 E.01088
G3 X55.6 Y47.807 I-.232 J3.208 E.62935
G1 X55.785 Y47.793 E.00596
G1 X55.874 Y48.195 F30000
G1 F8843.478
G1 X55.908 Y48.192 E.00109
G3 X56.205 Y48.197 I.1 J3.064 E.00958
G3 X55.65 Y48.211 I-.204 J2.801 E.54961
G1 X55.814 Y48.199 E.00527
G1 X55.903 Y48.601 F30000
G1 F8843.478
G1 X55.92 Y48.599 E.00054
G3 X55.701 Y48.616 I.07 J2.401 E.47818
G1 X55.843 Y48.605 E.00458
G1 X55.927 Y48.992 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X55.931 Y48.992 E.00011
G3 X55.75 Y49.005 I.059 J2.008 E.37061
G1 X55.867 Y48.997 E.00351
; WIPE_START
M204 S10000
G1 X55.931 Y48.992 E-.02424
G1 X56.149 Y48.995 E-.08292
G1 X56.544 Y49.065 E-.15251
G1 X56.917 Y49.211 E-.15208
G1 X57.253 Y49.428 E-.15215
G1 X57.54 Y49.708 E-.15211
G1 X57.605 Y49.803 E-.04399
; WIPE_END
G1 E-.04 F1800
G1 X62.828 Y55.369 Z3.2 F30000
G1 X191.416 Y192.416 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X64.584 Y192.416 E4.07847
G1 X64.584 Y59.584 E4.27141
G1 X191.416 Y59.584 E4.07847
G1 X191.416 Y192.356 E4.26948
G1 X191.009 Y192.009 F30000
G1 F8843.478
G1 X64.991 Y192.009 E4.05229
G1 X64.991 Y59.991 E4.24523
G1 X191.009 Y59.991 E4.05229
G1 X191.009 Y191.949 E4.2433
G1 X190.602 Y191.602 F30000
G1 F8843.478
G1 X65.398 Y191.602 E4.02611
G1 X65.398 Y60.398 E4.21905
G1 X190.602 Y60.398 E4.02611
G1 X190.602 Y191.542 E4.21712
G1 X190.21 Y191.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X65.79 Y191.21 E3.70605
G1 X65.79 Y60.79 E3.88477
G1 X190.21 Y60.79 E3.70605
G1 X190.21 Y191.15 E3.88298
; WIPE_START
M204 S10000
G1 X188.21 Y191.151 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X181.345 Y187.816 Z3.2 F30000
G1 X58.43 Y128.106 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X58.245 Y128.302 E.00866
G3 X55.6 Y122.807 I-2.243 J-2.304 E.39177
G3 X56.234 Y122.79 I.41 J3.486 E.02043
G3 X58.469 Y128.061 I-.232 J3.208 E.22699
G1 X58.13 Y127.832 F30000
G1 F8843.478
G1 X57.961 Y128.01 E.00791
G3 X55.65 Y123.211 I-1.96 J-2.012 E.34217
G3 X56.205 Y123.197 I.358 J3.049 E.01788
G3 X58.168 Y127.785 I-.204 J2.801 E.1976
G1 X57.817 Y127.568 F30000
G1 F8843.478
G1 X57.497 Y127.877 E.0143
G3 X55.701 Y123.616 I-1.496 J-1.878 E.28487
G3 X56.177 Y123.604 I.305 J2.612 E.01532
G3 X57.856 Y127.523 I-.176 J2.395 E.16874
G1 X57.5 Y127.331 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X57.249 Y127.566 E.01026
G3 X55.75 Y124.005 I-1.258 J-1.566 E.22133
G1 X55.931 Y123.992 E.00541
G3 X57.537 Y127.283 I.059 J2.008 E.13723
; WIPE_START
M204 S10000
G1 X57.249 Y127.566 E-.1534
G1 X56.917 Y127.789 E-.15189
G1 X56.544 Y127.935 E-.15208
G1 X56.15 Y128.005 E-.15214
G1 X55.754 Y127.995 E-.15049
; WIPE_END
G1 E-.04 F1800
G1 X55.764 Y135.627 Z3.2 F30000
G1 X55.844 Y197.789 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X55.896 Y197.785 E.00165
G3 X56.234 Y197.79 I.114 J3.5 E.01088
G3 X55.6 Y197.807 I-.232 J3.208 E.62936
G1 X55.785 Y197.793 E.00595
G1 X55.874 Y198.195 F30000
G1 F8843.478
G1 X55.908 Y198.192 E.00109
G3 X56.205 Y198.197 I.1 J3.062 E.00958
G3 X55.651 Y198.211 I-.204 J2.801 E.54961
G1 X55.814 Y198.199 E.00526
G1 X55.903 Y198.601 F30000
G1 F8843.478
G1 X55.92 Y198.599 E.00054
G3 X55.701 Y198.616 I.07 J2.401 E.47818
G1 X55.843 Y198.605 E.00457
G1 X55.921 Y198.993 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X55.931 Y198.992 E.00031
G3 X55.75 Y199.005 I.06 J2.008 E.37061
G1 X55.861 Y198.997 E.0033
; WIPE_START
M204 S10000
G1 X55.931 Y198.992 E-.0268
G1 X56.149 Y198.995 E-.08293
G1 X56.544 Y199.065 E-.15251
G1 X56.917 Y199.211 E-.15211
G1 X57.253 Y199.428 E-.15212
G1 X57.54 Y199.708 E-.15212
G1 X57.601 Y199.798 E-.04141
; WIPE_END
G1 E-.04 F1800
G1 X65.231 Y199.58 Z3.2 F30000
G1 X127.844 Y197.789 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X127.896 Y197.785 E.00165
G3 X128.234 Y197.79 I.114 J3.499 E.01088
G3 X127.6 Y197.807 I-.232 J3.208 E.62936
G1 X127.785 Y197.793 E.00595
G1 X127.874 Y198.195 F30000
G1 F8843.478
G1 X127.908 Y198.192 E.0011
G3 X128.205 Y198.197 I.101 J3.061 E.00958
G3 X127.651 Y198.211 I-.204 J2.801 E.54961
G1 X127.814 Y198.199 E.00526
G1 X127.903 Y198.601 F30000
G1 F8843.478
G1 X127.92 Y198.599 E.00054
G3 X127.701 Y198.616 I.07 J2.401 E.47818
G1 X127.843 Y198.605 E.00457
G1 X127.921 Y198.993 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X127.931 Y198.992 E.00031
G3 X127.75 Y199.005 I.06 J2.008 E.37061
G1 X127.861 Y198.997 E.0033
; WIPE_START
M204 S10000
G1 X127.931 Y198.992 E-.0268
G1 X128.149 Y198.995 E-.08292
G1 X128.544 Y199.065 E-.15251
G1 X128.917 Y199.211 E-.15211
G1 X129.253 Y199.428 E-.15212
G1 X129.54 Y199.708 E-.1521
G1 X129.601 Y199.798 E-.04144
; WIPE_END
G1 E-.04 F1800
G1 X137.231 Y199.58 Z3.2 F30000
G1 X199.844 Y197.789 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X199.896 Y197.785 E.00165
G3 X200.234 Y197.79 I.114 J3.5 E.01088
G3 X199.6 Y197.807 I-.232 J3.208 E.62936
G1 X199.785 Y197.793 E.00595
G1 X199.874 Y198.195 F30000
G1 F8843.478
G1 X199.908 Y198.192 E.0011
G3 X200.205 Y198.197 I.101 J3.06 E.00958
G3 X199.651 Y198.211 I-.204 J2.801 E.54961
G1 X199.814 Y198.199 E.00526
G1 X199.936 Y198.6 F30000
G1 F8843.478
G1 X200.177 Y198.606 E.00774
G3 X199.701 Y198.616 I-.187 J2.394 E.46991
G1 X199.876 Y198.603 E.00564
G1 X199.921 Y198.993 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X199.931 Y198.992 E.0003
G3 X199.75 Y199.005 I.06 J2.008 E.37061
G1 X199.861 Y198.997 E.00332
; WIPE_START
M204 S10000
G1 X199.931 Y198.992 E-.02663
G1 X200.149 Y198.995 E-.08293
G1 X200.544 Y199.065 E-.15251
G1 X200.917 Y199.211 E-.15211
G1 X201.253 Y199.428 E-.15214
G1 X201.54 Y199.708 E-.1521
G1 X201.602 Y199.798 E-.04159
; WIPE_END
G1 E-.04 F1800
G1 X206.035 Y206.011 Z3.2 F30000
G1 X208.584 Y209.584 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X47.416 Y209.584 E5.18256
G1 X47.416 Y42.416 E5.3755
G1 X208.584 Y42.416 E5.18256
G1 X208.584 Y209.524 E5.37357
G1 X208.991 Y209.991 F30000
G1 F8843.478
G1 X47.009 Y209.991 E5.20874
G1 X47.009 Y42.009 E5.40168
G1 X208.991 Y42.009 E5.20874
G1 X208.991 Y209.931 E5.39975
G1 X209.398 Y210.398 F30000
G1 F8843.478
G1 X46.602 Y210.398 E5.23492
G1 X46.602 Y41.602 E5.42786
G1 X209.398 Y41.602 E5.23492
G1 X209.398 Y210.338 E5.42593
G1 X209.79 Y210.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X46.21 Y210.79 E4.87249
G1 X46.21 Y41.21 E5.05121
G1 X209.79 Y41.21 E4.87249
G1 X209.79 Y210.73 E5.04942
; WIPE_START
M204 S10000
G1 X207.79 Y210.731 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X207.657 Y209.42 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42037
G1 F9537.687
G1 X208.251 Y208.827 E.02502
G1 X208.251 Y208.293 E.01592
G1 X207.293 Y209.251 E.04037
G1 X206.759 Y209.251 E.01592
G1 X208.251 Y207.759 E.06288
G1 X208.251 Y207.225 E.01592
G1 X206.225 Y209.251 E.08539
G1 X205.692 Y209.251 E.01592
G1 X208.251 Y206.692 E.1079
G1 X208.251 Y206.158 E.01592
G1 X205.158 Y209.251 E.13041
G1 X204.624 Y209.251 E.01592
G1 X208.251 Y205.624 E.15291
G1 X208.251 Y205.09 E.01592
G1 X204.09 Y209.251 E.17542
G1 X203.557 Y209.251 E.01592
G1 X208.251 Y204.556 E.19793
G1 X208.251 Y204.023 E.01592
G1 X203.023 Y209.251 E.22044
G1 X202.489 Y209.251 E.01592
G1 X208.251 Y203.489 E.24295
G1 X208.251 Y202.955 E.01592
G1 X201.955 Y209.251 E.26545
G1 X201.421 Y209.251 E.01592
G1 X208.251 Y202.421 E.28796
G1 X208.251 Y201.888 E.01592
G1 X200.888 Y209.251 E.31047
G1 X200.354 Y209.251 E.01592
G1 X208.251 Y201.354 E.33298
G1 X208.251 Y200.82 E.01592
G1 X199.82 Y209.251 E.35549
G1 X199.286 Y209.251 E.01592
M73 P75 R17
G1 X208.251 Y200.286 E.37799
G1 X208.251 Y199.752 E.01592
G1 X198.752 Y209.251 E.4005
G1 X198.219 Y209.251 E.01592
G1 X208.251 Y199.219 E.42301
G1 X208.251 Y198.685 E.01592
G1 X197.685 Y209.251 E.44552
G1 X197.151 Y209.251 E.01592
G1 X208.251 Y198.151 E.46803
G1 X208.251 Y197.617 E.01592
G1 X196.617 Y209.251 E.49053
G1 X196.083 Y209.251 E.01592
G1 X200.901 Y204.433 E.20314
G3 X200.258 Y204.542 I-1.148 J-4.815 E.01946
G1 X195.55 Y209.251 E.19854
G1 X195.016 Y209.251 E.01592
G1 X199.729 Y204.537 E.19875
G3 X199.261 Y204.472 I.092 J-2.377 E.01413
G1 X194.482 Y209.251 E.20151
G1 X193.948 Y209.251 E.01592
G1 X198.842 Y204.356 E.20637
G3 X198.465 Y204.199 I.596 J-1.963 E.01219
G1 X193.414 Y209.251 E.21298
G1 X192.881 Y209.251 E.01592
G1 X198.122 Y204.01 E.22099
G3 X197.808 Y203.789 I.944 J-1.676 E.01144
G1 X192.347 Y209.251 E.23028
G1 X191.813 Y209.251 E.01592
G1 X197.524 Y203.54 E.2408
G3 X197.268 Y203.262 I1.261 J-1.42 E.01128
G1 X191.279 Y209.251 E.25251
G1 X190.745 Y209.251 E.01592
G1 X197.04 Y202.956 E.26543
G3 X196.843 Y202.619 I1.582 J-1.155 E.01165
G1 X190.212 Y209.251 E.27961
G1 X189.678 Y209.251 E.01592
G1 X196.678 Y202.251 E.29516
G3 X196.551 Y201.843 I5.934 J-2.061 E.01272
G1 X189.144 Y209.251 E.31234
G1 X188.61 Y209.251 E.01592
G1 X196.474 Y201.387 E.33157
G3 X196.453 Y200.874 I2.552 J-.361 E.01533
G1 X188.076 Y209.251 E.3532
G1 X187.543 Y209.251 E.01592
G1 X196.53 Y200.263 E.37896
M73 P75 R16
G3 X196.8 Y199.459 I3.737 J.808 E.02533
G1 X187.009 Y209.251 E.41285
G1 X186.475 Y209.251 E.01592
G1 X208.251 Y187.475 E.91818
G1 X208.251 Y188.009 E.01592
G1 X198.452 Y197.807 E.41317
G3 X199.266 Y197.528 I1.27 J2.37 E.02577
G1 X208.251 Y188.543 E.37886
G1 X208.251 Y189.076 E.01592
G1 X199.875 Y197.452 E.35317
G3 X200.387 Y197.474 I.044 J5.128 E.0153
G1 X208.251 Y189.61 E.33156
G1 X208.251 Y190.144 E.01592
G1 X200.841 Y197.554 E.31243
G3 X201.25 Y197.678 I-.419 J2.111 E.01278
G1 X208.251 Y190.678 E.29517
G1 X208.251 Y191.212 E.01592
G1 X201.622 Y197.84 E.27951
G3 X201.957 Y198.038 I-.823 J1.778 E.01164
G1 X208.251 Y191.745 E.26535
G1 X208.251 Y192.279 E.01592
G1 X202.263 Y198.266 E.25246
G3 X202.541 Y198.523 I-1.143 J1.513 E.01128
G1 X208.251 Y192.813 E.24077
G1 X208.251 Y193.347 E.01592
G1 X202.79 Y198.808 E.23027
G3 X203.009 Y199.122 I-1.46 J1.257 E.01145
G1 X208.251 Y193.881 E.221
G1 X208.251 Y194.414 E.01592
G1 X203.199 Y199.466 E.21302
G3 X203.354 Y199.844 I-1.807 J.965 E.01221
G1 X208.251 Y194.948 E.20646
G1 X208.251 Y195.482 E.01592
G1 X203.472 Y200.26 E.20149
G3 X203.538 Y200.728 I-4.769 J.911 E.01409
G1 X208.251 Y196.016 E.19871
G1 X208.251 Y196.55 E.01592
G1 X203.539 Y201.262 E.19868
G3 X203.43 Y201.904 I-3.702 J-.294 E.01944
G1 X208.42 Y196.914 E.2104
G1 X208.42 Y46.917 F30000
G1 F9537.687
G1 X203.429 Y51.908 E.21045
G2 X203.538 Y51.265 I-3.613 J-.945 E.01947
G1 X208.251 Y46.553 E.19869
G1 X208.251 Y46.019 E.01592
G1 X203.538 Y50.732 E.1987
G2 X203.473 Y50.263 I-4.876 J.442 E.01411
G1 X208.251 Y45.486 E.20146
G1 X208.251 Y44.952 E.01592
G1 X203.355 Y49.847 E.20641
G2 X203.2 Y49.469 I-1.967 J.587 E.01222
G1 X208.251 Y44.418 E.21297
G1 X208.251 Y43.884 E.01592
G1 X203.011 Y49.124 E.22094
G2 X202.791 Y48.81 I-1.682 J.942 E.01145
G1 X208.251 Y43.35 E.2302
G1 X208.251 Y42.817 E.01592
G1 X202.542 Y48.525 E.24069
G2 X202.265 Y48.268 I-1.421 J1.255 E.01128
G1 X207.784 Y42.749 E.2327
G1 X207.25 Y42.749 E.01592
G1 X201.96 Y48.04 E.22308
G2 X201.624 Y47.842 I-1.159 J1.578 E.01164
G1 X206.716 Y42.749 E.21472
G1 X206.183 Y42.749 E.01592
G1 X201.253 Y47.679 E.20786
G2 X200.844 Y47.554 I-.829 J1.984 E.01277
G1 X205.649 Y42.749 E.2026
G1 X205.115 Y42.749 E.01592
G1 X200.39 Y47.474 E.19921
G2 X199.879 Y47.452 I-.48 J5.208 E.01528
G1 X204.581 Y42.749 E.19829
G1 X204.047 Y42.749 E.01592
G1 X199.27 Y47.527 E.20144
G2 X198.459 Y47.804 I.444 J2.625 E.02565
G1 X203.514 Y42.749 E.21311
G1 X202.98 Y42.749 E.01592
G1 X186.479 Y59.251 E.69578
G1 X187.013 Y59.251 E.01592
G1 X196.797 Y49.466 E.41258
G2 X196.529 Y50.268 I3.45 J1.599 E.02527
G1 X187.546 Y59.251 E.37877
G1 X188.08 Y59.251 E.01592
G1 X196.453 Y50.878 E.35304
G2 X196.474 Y51.39 I2.572 J.15 E.01532
G1 X188.614 Y59.251 E.33143
G1 X189.148 Y59.251 E.01592
G1 X196.552 Y51.846 E.31221
G2 X196.679 Y52.253 I6.083 J-1.669 E.01272
G1 X189.681 Y59.251 E.29505
G1 X190.215 Y59.251 E.01592
G1 X196.844 Y52.622 E.27951
G2 X197.042 Y52.958 I1.78 J-.82 E.01165
G1 X190.749 Y59.251 E.26533
G1 X191.283 Y59.251 E.01592
G1 X197.269 Y53.264 E.25242
G2 X197.526 Y53.542 I1.518 J-1.144 E.01128
G1 X191.749 Y59.318 E.24355
G1 X191.749 Y59.852 E.01592
G1 X197.81 Y53.791 E.25556
G2 X198.124 Y54.011 I1.258 J-1.459 E.01144
G1 X191.749 Y60.385 E.26878
G1 X191.749 Y60.919 E.01592
G1 X198.468 Y54.201 E.28329
G2 X198.845 Y54.357 I.971 J-1.806 E.0122
G1 X191.749 Y61.453 E.29919
G1 X191.749 Y61.987 E.01592
G1 X199.264 Y54.472 E.31686
G2 X199.733 Y54.537 I.559 J-2.313 E.01414
G1 X191.749 Y62.52 E.33662
G1 X191.749 Y63.054 E.01592
G1 X200.262 Y54.542 E.35894
G2 X200.906 Y54.432 I-.531 J-5.044 E.01949
G1 X191.749 Y63.588 E.38609
G1 X191.749 Y64.122 E.01592
G1 X208.251 Y47.621 E.69578
G1 X208.251 Y48.155 E.01592
G1 X191.749 Y64.656 E.69578
G1 X191.749 Y65.189 E.01592
G1 X208.251 Y48.688 E.69578
G1 X208.251 Y49.222 E.01592
G1 X191.749 Y65.723 E.69578
G1 X191.749 Y66.257 E.01592
G1 X208.251 Y49.756 E.69578
G1 X208.251 Y50.29 E.01592
G1 X191.749 Y66.791 E.69578
G1 X191.749 Y67.325 E.01592
G1 X208.251 Y50.824 E.69578
G1 X208.251 Y51.357 E.01592
G1 X191.749 Y67.858 E.69578
G1 X191.749 Y68.392 E.01592
G1 X208.251 Y51.891 E.69578
G1 X208.251 Y52.425 E.01592
G1 X191.749 Y68.926 E.69578
G1 X191.749 Y69.46 E.01592
G1 X208.251 Y52.959 E.69578
G1 X208.251 Y53.493 E.01592
G1 X191.749 Y69.994 E.69578
G1 X191.749 Y70.527 E.01592
G1 X208.251 Y54.026 E.69578
G1 X208.251 Y54.56 E.01592
G1 X191.749 Y71.061 E.69578
G1 X191.749 Y71.595 E.01592
G1 X208.251 Y55.094 E.69578
G1 X208.251 Y55.628 E.01592
G1 X191.749 Y72.129 E.69578
G1 X191.749 Y72.663 E.01592
G1 X208.251 Y56.162 E.69578
G1 X208.251 Y56.695 E.01592
G1 X191.749 Y73.196 E.69578
G1 X191.749 Y73.73 E.01592
G1 X208.251 Y57.229 E.69578
G1 X208.251 Y57.763 E.01592
G1 X191.749 Y74.264 E.69578
G1 X191.749 Y74.798 E.01592
G1 X208.251 Y58.297 E.69578
G1 X208.251 Y58.83 E.01592
G1 X191.749 Y75.332 E.69578
G1 X191.749 Y75.865 E.01592
G1 X208.251 Y59.364 E.69578
G1 X208.251 Y59.898 E.01592
G1 X191.749 Y76.399 E.69578
G1 X191.749 Y76.933 E.01592
G1 X208.251 Y60.432 E.69578
G1 X208.251 Y60.966 E.01592
G1 X191.749 Y77.467 E.69578
G1 X191.749 Y78.001 E.01592
G1 X208.251 Y61.499 E.69578
G1 X208.251 Y62.033 E.01592
G1 X191.749 Y78.534 E.69578
G1 X191.749 Y79.068 E.01592
G1 X208.251 Y62.567 E.69578
G1 X208.251 Y63.101 E.01592
G1 X191.749 Y79.602 E.69578
G1 X191.749 Y80.136 E.01592
G1 X208.251 Y63.635 E.69578
G1 X208.251 Y64.168 E.01592
G1 X191.749 Y80.67 E.69578
G1 X191.749 Y81.203 E.01592
G1 X208.251 Y64.702 E.69578
G1 X208.251 Y65.236 E.01592
G1 X191.749 Y81.737 E.69578
G1 X191.749 Y82.271 E.01592
G1 X208.251 Y65.77 E.69578
G1 X208.251 Y66.304 E.01592
G1 X191.749 Y82.805 E.69578
G1 X191.749 Y83.338 E.01592
G1 X208.251 Y66.837 E.69578
G1 X208.251 Y67.371 E.01592
G1 X191.749 Y83.872 E.69578
G1 X191.749 Y84.406 E.01592
G1 X208.251 Y67.905 E.69578
G1 X208.251 Y68.439 E.01592
G1 X191.749 Y84.94 E.69578
G1 X191.749 Y85.474 E.01592
G1 X208.251 Y68.973 E.69578
G1 X208.251 Y69.506 E.01592
G1 X191.749 Y86.007 E.69578
G1 X191.749 Y86.541 E.01592
G1 X208.251 Y70.04 E.69578
G1 X208.251 Y70.574 E.01592
G1 X191.749 Y87.075 E.69578
G1 X191.749 Y87.609 E.01592
G1 X208.251 Y71.108 E.69578
G1 X208.251 Y71.642 E.01592
G1 X191.749 Y88.143 E.69578
G1 X191.749 Y88.676 E.01592
G1 X208.251 Y72.175 E.69578
G1 X208.251 Y72.709 E.01592
G1 X191.749 Y89.21 E.69578
G1 X191.749 Y89.744 E.01592
G1 X208.251 Y73.243 E.69578
G1 X208.251 Y73.777 E.01592
G1 X191.749 Y90.278 E.69578
G1 X191.749 Y90.812 E.01592
G1 X208.251 Y74.311 E.69578
G1 X208.251 Y74.844 E.01592
G1 X191.749 Y91.345 E.69578
G1 X191.749 Y91.879 E.01592
G1 X208.251 Y75.378 E.69578
G1 X208.251 Y75.912 E.01592
G1 X191.749 Y92.413 E.69578
G1 X191.749 Y92.947 E.01592
G1 X208.251 Y76.446 E.69578
G1 X208.251 Y76.98 E.01592
G1 X191.749 Y93.481 E.69578
G1 X191.749 Y94.014 E.01592
G1 X208.251 Y77.513 E.69578
G1 X208.251 Y78.047 E.01592
G1 X191.749 Y94.548 E.69578
G1 X191.749 Y95.082 E.01592
G1 X208.251 Y78.581 E.69578
G1 X208.251 Y79.115 E.01592
G1 X191.749 Y95.616 E.69578
G1 X191.749 Y96.15 E.01592
G1 X208.251 Y79.648 E.69578
G1 X208.251 Y80.182 E.01592
G1 X191.749 Y96.683 E.69578
G1 X191.749 Y97.217 E.01592
G1 X208.251 Y80.716 E.69578
G1 X208.251 Y81.25 E.01592
G1 X191.749 Y97.751 E.69578
G1 X191.749 Y98.285 E.01592
G1 X208.251 Y81.784 E.69578
G1 X208.251 Y82.317 E.01592
G1 X191.749 Y98.819 E.69578
G1 X191.749 Y99.352 E.01592
G1 X208.251 Y82.851 E.69578
G1 X208.251 Y83.385 E.01592
G1 X191.749 Y99.886 E.69578
G1 X191.749 Y100.42 E.01592
G1 X208.251 Y83.919 E.69578
G1 X208.251 Y84.453 E.01592
G1 X191.749 Y100.954 E.69578
G1 X191.749 Y101.488 E.01592
G1 X208.251 Y84.986 E.69578
G1 X208.251 Y85.52 E.01592
G1 X191.749 Y102.021 E.69578
G1 X191.749 Y102.555 E.01592
G1 X208.251 Y86.054 E.69578
G1 X208.251 Y86.588 E.01592
G1 X191.749 Y103.089 E.69578
G1 X191.749 Y103.623 E.01592
G1 X208.251 Y87.122 E.69578
G1 X208.251 Y87.655 E.01592
G1 X191.749 Y104.156 E.69578
G1 X191.749 Y104.69 E.01592
G1 X208.251 Y88.189 E.69578
G1 X208.251 Y88.723 E.01592
G1 X191.749 Y105.224 E.69578
G1 X191.749 Y105.758 E.01592
G1 X208.251 Y89.257 E.69578
G1 X208.251 Y89.791 E.01592
G1 X191.749 Y106.292 E.69578
G1 X191.749 Y106.825 E.01592
G1 X208.251 Y90.324 E.69578
G1 X208.251 Y90.858 E.01592
G1 X191.749 Y107.359 E.69578
G1 X191.749 Y107.893 E.01592
G1 X208.251 Y91.392 E.69578
G1 X208.251 Y91.926 E.01592
G1 X191.749 Y108.427 E.69578
G1 X191.749 Y108.961 E.01592
G1 X208.251 Y92.46 E.69578
G1 X208.251 Y92.993 E.01592
G1 X191.749 Y109.494 E.69578
G1 X191.749 Y110.028 E.01592
G1 X208.251 Y93.527 E.69578
G1 X208.251 Y94.061 E.01592
G1 X191.749 Y110.562 E.69578
G1 X191.749 Y111.096 E.01592
G1 X208.251 Y94.595 E.69578
G1 X208.251 Y95.129 E.01592
G1 X191.749 Y111.63 E.69578
G1 X191.749 Y112.163 E.01592
G1 X208.251 Y95.662 E.69578
G1 X208.251 Y96.196 E.01592
G1 X191.749 Y112.697 E.69578
G1 X191.749 Y113.231 E.01592
G1 X208.251 Y96.73 E.69578
G1 X208.251 Y97.264 E.01592
G1 X191.749 Y113.765 E.69578
G1 X191.749 Y114.299 E.01592
G1 X208.251 Y97.798 E.69578
G1 X208.251 Y98.331 E.01592
G1 X191.749 Y114.832 E.69578
G1 X191.749 Y115.366 E.01592
G1 X208.251 Y98.865 E.69578
G1 X208.251 Y99.399 E.01592
G1 X191.749 Y115.9 E.69578
G1 X191.749 Y116.434 E.01592
G1 X208.251 Y99.933 E.69578
G1 X208.251 Y100.466 E.01592
G1 X191.749 Y116.968 E.69578
G1 X191.749 Y117.501 E.01592
G1 X208.251 Y101 E.69578
G1 X208.251 Y101.534 E.01592
G1 X191.749 Y118.035 E.69578
G1 X191.749 Y118.569 E.01592
G1 X208.251 Y102.068 E.69578
G1 X208.251 Y102.602 E.01592
G1 X191.749 Y119.103 E.69578
G1 X191.749 Y119.637 E.01592
G1 X208.251 Y103.135 E.69578
G1 X208.251 Y103.669 E.01592
G1 X191.749 Y120.17 E.69578
G1 X191.749 Y120.704 E.01592
G1 X208.251 Y104.203 E.69578
G1 X208.251 Y104.737 E.01592
G1 X191.749 Y121.238 E.69578
G1 X191.749 Y121.772 E.01592
G1 X208.251 Y105.271 E.69578
G1 X208.251 Y105.804 E.01592
G1 X191.749 Y122.306 E.69578
G1 X191.749 Y122.839 E.01592
G1 X208.251 Y106.338 E.69578
G1 X208.251 Y106.872 E.01592
G1 X191.749 Y123.373 E.69578
G1 X191.749 Y123.907 E.01592
G1 X208.251 Y107.406 E.69578
G1 X208.251 Y107.94 E.01592
G1 X191.749 Y124.441 E.69578
G1 X191.749 Y124.974 E.01592
G1 X208.251 Y108.473 E.69578
G1 X208.251 Y109.007 E.01592
G1 X191.749 Y125.508 E.69578
G1 X191.749 Y126.042 E.01592
G1 X208.251 Y109.541 E.69578
G1 X208.251 Y110.075 E.01592
G1 X191.749 Y126.576 E.69578
G1 X191.749 Y127.11 E.01592
G1 X208.251 Y110.609 E.69578
G1 X208.251 Y111.142 E.01592
G1 X191.749 Y127.643 E.69578
G1 X191.749 Y128.177 E.01592
G1 X208.251 Y111.676 E.69578
G1 X208.251 Y112.21 E.01592
G1 X191.58 Y128.881 E.70294
G1 X191.58 Y139.023 F30000
G1 F9537.687
G1 X201.296 Y129.307 E.40969
G3 X200.565 Y129.504 I-1.47 J-3.99 E.02262
G1 X191.749 Y138.319 E.3717
G1 X191.749 Y137.786 E.01592
G1 X199.986 Y129.549 E.34731
G3 X199.489 Y129.512 I.07 J-4.319 E.01487
G1 X191.749 Y137.252 E.32636
G1 X191.749 Y136.718 E.01592
G1 X199.05 Y129.418 E.30783
G3 X198.652 Y129.282 I.48 J-2.055 E.01256
G1 X191.749 Y136.184 E.29105
G1 X191.749 Y135.65 E.01592
G1 X198.29 Y129.11 E.2758
G3 X197.961 Y128.906 I.855 J-1.749 E.01158
G1 X191.749 Y135.117 E.2619
G1 X191.749 Y134.583 E.01592
G1 X197.661 Y128.672 E.24925
G3 X197.39 Y128.408 I10.503 J-11.058 E.01126
G1 X191.749 Y134.049 E.23785
G1 X191.749 Y133.515 E.01592
G1 X197.149 Y128.116 E.22768
G3 X196.938 Y127.793 I1.505 J-1.219 E.01151
G1 X191.749 Y132.981 E.21876
G1 X191.749 Y132.448 E.01592
G1 X196.757 Y127.44 E.21116
G3 X196.612 Y127.051 I1.867 J-.92 E.01239
G1 X191.749 Y131.914 E.20504
G1 X191.749 Y131.38 E.01592
G1 X196.507 Y126.623 E.2006
G3 X196.453 Y126.143 I4.673 J-.77 E.0144
G1 X191.749 Y130.846 E.19832
G1 X191.749 Y130.312 E.01592
G1 X196.477 Y125.585 E.19932
G3 X196.627 Y124.901 I3.628 J.438 E.02091
G1 X191.749 Y129.779 E.20565
G1 X191.749 Y129.245 E.01592
G1 X208.251 Y112.744 E.69578
G1 X208.251 Y113.278 E.01592
G1 X198.905 Y122.623 E.39407
G3 X199.588 Y122.474 I1.293 J4.274 E.02088
G1 X208.251 Y113.811 E.36525
G1 X208.251 Y114.345 E.01592
G1 X200.14 Y122.455 E.34198
G3 X200.625 Y122.504 I-.272 J5.134 E.01454
G1 X208.251 Y114.879 E.32153
G1 X208.251 Y115.413 E.01592
G1 X201.052 Y122.611 E.30354
G3 X201.439 Y122.758 I-.537 J2.005 E.01237
G1 X208.251 Y115.947 E.2872
G1 X208.251 Y116.48 E.01592
G1 X201.792 Y122.939 E.27232
G3 X202.114 Y123.151 I-.899 J1.713 E.01151
G1 X208.251 Y117.014 E.25876
G1 X208.251 Y117.548 E.01592
G1 X202.406 Y123.392 E.24644
G3 X202.67 Y123.662 I-1.215 J1.451 E.01127
G1 X208.251 Y118.082 E.23531
G1 X208.251 Y118.616 E.01592
G1 X202.905 Y123.961 E.22539
G3 X203.111 Y124.289 I-1.534 J1.193 E.01156
G1 X208.251 Y119.149 E.2167
G1 X208.251 Y119.683 E.01592
G1 X203.284 Y124.65 E.20944
G3 X203.418 Y125.049 I-1.933 J.875 E.01258
G1 X208.251 Y120.217 E.20376
G1 X208.251 Y120.751 E.01592
G1 X203.511 Y125.491 E.19987
G3 X203.551 Y125.984 I-2.448 J.449 E.01479
G1 X208.251 Y121.284 E.19817
G1 X208.251 Y121.818 E.01592
G1 X203.502 Y126.567 E.20023
G3 X203.301 Y127.301 I-3.614 J-.593 E.02274
G1 X208.251 Y122.352 E.20869
G1 X208.251 Y122.886 E.01592
G1 X191.749 Y139.387 E.69578
G1 X191.749 Y139.921 E.01592
G1 X208.251 Y123.42 E.69578
G1 X208.251 Y123.953 E.01592
G1 X191.749 Y140.455 E.69578
G1 X191.749 Y140.988 E.01592
G1 X208.251 Y124.487 E.69578
G1 X208.251 Y125.021 E.01592
G1 X191.749 Y141.522 E.69578
G1 X191.749 Y142.056 E.01592
G1 X208.251 Y125.555 E.69578
G1 X208.251 Y126.089 E.01592
G1 X191.749 Y142.59 E.69578
G1 X191.749 Y143.124 E.01592
G1 X208.251 Y126.622 E.69578
M73 P76 R16
G1 X208.251 Y127.156 E.01592
G1 X191.749 Y143.657 E.69578
G1 X191.749 Y144.191 E.01592
G1 X208.251 Y127.69 E.69578
G1 X208.251 Y128.224 E.01592
G1 X191.749 Y144.725 E.69578
G1 X191.749 Y145.259 E.01592
G1 X208.251 Y128.758 E.69578
G1 X208.251 Y129.291 E.01592
G1 X191.749 Y145.792 E.69578
G1 X191.749 Y146.326 E.01592
G1 X208.251 Y129.825 E.69578
G1 X208.251 Y130.359 E.01592
G1 X191.749 Y146.86 E.69578
G1 X191.749 Y147.394 E.01592
G1 X208.251 Y130.893 E.69578
G1 X208.251 Y131.427 E.01592
G1 X191.749 Y147.928 E.69578
G1 X191.749 Y148.461 E.01592
G1 X208.251 Y131.96 E.69578
G1 X208.251 Y132.494 E.01592
G1 X191.749 Y148.995 E.69578
G1 X191.749 Y149.529 E.01592
G1 X208.251 Y133.028 E.69578
G1 X208.251 Y133.562 E.01592
G1 X191.749 Y150.063 E.69578
G1 X191.749 Y150.597 E.01592
G1 X208.251 Y134.096 E.69578
G1 X208.251 Y134.629 E.01592
G1 X191.749 Y151.13 E.69578
G1 X191.749 Y151.664 E.01592
G1 X208.251 Y135.163 E.69578
G1 X208.251 Y135.697 E.01592
G1 X191.749 Y152.198 E.69578
G1 X191.749 Y152.732 E.01592
G1 X208.251 Y136.231 E.69578
G1 X208.251 Y136.765 E.01592
G1 X191.749 Y153.266 E.69578
G1 X191.749 Y153.799 E.01592
G1 X208.251 Y137.298 E.69578
G1 X208.251 Y137.832 E.01592
G1 X191.749 Y154.333 E.69578
G1 X191.749 Y154.867 E.01592
G1 X208.251 Y138.366 E.69578
G1 X208.251 Y138.9 E.01592
G1 X191.749 Y155.401 E.69578
G1 X191.749 Y155.935 E.01592
G1 X208.251 Y139.434 E.69578
G1 X208.251 Y139.967 E.01592
G1 X191.749 Y156.468 E.69578
G1 X191.749 Y157.002 E.01592
G1 X208.251 Y140.501 E.69578
G1 X208.251 Y141.035 E.01592
G1 X191.749 Y157.536 E.69578
G1 X191.749 Y158.07 E.01592
G1 X208.251 Y141.569 E.69578
G1 X208.251 Y142.102 E.01592
G1 X191.749 Y158.604 E.69578
G1 X191.749 Y159.137 E.01592
G1 X208.251 Y142.636 E.69578
G1 X208.251 Y143.17 E.01592
G1 X191.749 Y159.671 E.69578
G1 X191.749 Y160.205 E.01592
G1 X208.251 Y143.704 E.69578
G1 X208.251 Y144.238 E.01592
G1 X191.749 Y160.739 E.69578
G1 X191.749 Y161.273 E.01592
G1 X208.251 Y144.771 E.69578
G1 X208.251 Y145.305 E.01592
G1 X191.749 Y161.806 E.69578
G1 X191.749 Y162.34 E.01592
G1 X208.251 Y145.839 E.69578
G1 X208.251 Y146.373 E.01592
G1 X191.749 Y162.874 E.69578
G1 X191.749 Y163.408 E.01592
G1 X208.251 Y146.907 E.69578
G1 X208.251 Y147.44 E.01592
G1 X191.749 Y163.942 E.69578
G1 X191.749 Y164.475 E.01592
G1 X208.251 Y147.974 E.69578
G1 X208.251 Y148.508 E.01592
G1 X191.749 Y165.009 E.69578
G1 X191.749 Y165.543 E.01592
G1 X208.251 Y149.042 E.69578
G1 X208.251 Y149.576 E.01592
G1 X191.749 Y166.077 E.69578
G1 X191.749 Y166.61 E.01592
G1 X208.251 Y150.109 E.69578
G1 X208.251 Y150.643 E.01592
G1 X191.749 Y167.144 E.69578
G1 X191.749 Y167.678 E.01592
G1 X208.251 Y151.177 E.69578
G1 X208.251 Y151.711 E.01592
G1 X191.749 Y168.212 E.69578
G1 X191.749 Y168.746 E.01592
G1 X208.251 Y152.245 E.69578
G1 X208.251 Y152.778 E.01592
G1 X191.749 Y169.279 E.69578
G1 X191.749 Y169.813 E.01592
G1 X208.251 Y153.312 E.69578
G1 X208.251 Y153.846 E.01592
G1 X191.749 Y170.347 E.69578
G1 X191.749 Y170.881 E.01592
G1 X208.251 Y154.38 E.69578
G1 X208.251 Y154.914 E.01592
G1 X191.749 Y171.415 E.69578
G1 X191.749 Y171.948 E.01592
G1 X208.251 Y155.447 E.69578
G1 X208.251 Y155.981 E.01592
G1 X191.749 Y172.482 E.69578
G1 X191.749 Y173.016 E.01592
G1 X208.251 Y156.515 E.69578
G1 X208.251 Y157.049 E.01592
G1 X191.749 Y173.55 E.69578
G1 X191.749 Y174.084 E.01592
G1 X208.251 Y157.583 E.69578
G1 X208.251 Y158.116 E.01592
G1 X191.749 Y174.617 E.69578
G1 X191.749 Y175.151 E.01592
G1 X208.251 Y158.65 E.69578
G1 X208.251 Y159.184 E.01592
G1 X191.749 Y175.685 E.69578
G1 X191.749 Y176.219 E.01592
G1 X208.251 Y159.718 E.69578
G1 X208.251 Y160.252 E.01592
G1 X191.749 Y176.753 E.69578
G1 X191.749 Y177.286 E.01592
G1 X208.251 Y160.785 E.69578
G1 X208.251 Y161.319 E.01592
G1 X191.749 Y177.82 E.69578
G1 X191.749 Y178.354 E.01592
G1 X208.251 Y161.853 E.69578
G1 X208.251 Y162.387 E.01592
G1 X191.749 Y178.888 E.69578
G1 X191.749 Y179.422 E.01592
G1 X208.251 Y162.92 E.69578
G1 X208.251 Y163.454 E.01592
G1 X191.749 Y179.955 E.69578
G1 X191.749 Y180.489 E.01592
G1 X208.251 Y163.988 E.69578
G1 X208.251 Y164.522 E.01592
G1 X191.749 Y181.023 E.69578
G1 X191.749 Y181.557 E.01592
G1 X208.251 Y165.056 E.69578
G1 X208.251 Y165.589 E.01592
G1 X191.749 Y182.091 E.69578
G1 X191.749 Y182.624 E.01592
G1 X208.251 Y166.123 E.69578
G1 X208.251 Y166.657 E.01592
G1 X191.749 Y183.158 E.69578
G1 X191.749 Y183.692 E.01592
G1 X208.251 Y167.191 E.69578
G1 X208.251 Y167.725 E.01592
G1 X191.749 Y184.226 E.69578
G1 X191.749 Y184.759 E.01592
G1 X208.251 Y168.258 E.69578
G1 X208.251 Y168.792 E.01592
G1 X191.749 Y185.293 E.69578
G1 X191.749 Y185.827 E.01592
G1 X208.251 Y169.326 E.69578
G1 X208.251 Y169.86 E.01592
G1 X191.749 Y186.361 E.69578
G1 X191.749 Y186.895 E.01592
G1 X208.251 Y170.394 E.69578
G1 X208.251 Y170.927 E.01592
G1 X191.749 Y187.428 E.69578
G1 X191.749 Y187.962 E.01592
G1 X208.251 Y171.461 E.69578
G1 X208.251 Y171.995 E.01592
G1 X191.749 Y188.496 E.69578
G1 X191.749 Y189.03 E.01592
G1 X208.251 Y172.529 E.69578
G1 X208.251 Y173.063 E.01592
G1 X191.749 Y189.564 E.69578
G1 X191.749 Y190.097 E.01592
G1 X208.251 Y173.596 E.69578
G1 X208.251 Y174.13 E.01592
G1 X191.749 Y190.631 E.69578
G1 X191.749 Y191.165 E.01592
G1 X208.251 Y174.664 E.69578
G1 X208.251 Y175.198 E.01592
G1 X191.749 Y191.699 E.69578
G1 X191.749 Y192.233 E.01592
G1 X208.251 Y175.732 E.69578
G1 X208.251 Y176.265 E.01592
G1 X175.265 Y209.251 E1.39085
G1 X175.799 Y209.251 E.01592
G1 X208.251 Y176.799 E1.36834
G1 X208.251 Y177.333 E.01592
G1 X176.333 Y209.251 E1.34584
G1 X176.867 Y209.251 E.01592
G1 X208.251 Y177.867 E1.32333
G1 X208.251 Y178.401 E.01592
G1 X177.401 Y209.251 E1.30082
G1 X177.934 Y209.251 E.01592
G1 X208.251 Y178.934 E1.27831
G1 X208.251 Y179.468 E.01592
G1 X178.468 Y209.251 E1.2558
G1 X179.002 Y209.251 E.01592
G1 X208.251 Y180.002 E1.2333
G1 X208.251 Y180.536 E.01592
G1 X179.536 Y209.251 E1.21079
G1 X180.07 Y209.251 E.01592
G1 X208.251 Y181.07 E1.18828
G1 X208.251 Y181.603 E.01592
G1 X180.603 Y209.251 E1.16577
G1 X181.137 Y209.251 E.01592
G1 X208.251 Y182.137 E1.14326
G1 X208.251 Y182.671 E.01592
G1 X181.671 Y209.251 E1.12076
G1 X182.205 Y209.251 E.01592
G1 X208.251 Y183.205 E1.09825
G1 X208.251 Y183.738 E.01592
G1 X182.738 Y209.251 E1.07574
G1 X183.272 Y209.251 E.01592
G1 X208.251 Y184.272 E1.05323
G1 X208.251 Y184.806 E.01592
G1 X183.806 Y209.251 E1.03072
G1 X184.34 Y209.251 E.01592
G1 X208.251 Y185.34 E1.00822
G1 X208.251 Y185.874 E.01592
G1 X184.874 Y209.251 E.98571
G1 X185.407 Y209.251 E.01592
G1 X208.251 Y186.407 E.9632
G1 X208.251 Y186.941 E.01592
G1 X185.772 Y209.42 E.94785
G1 X174.562 Y209.42 F30000
G1 F9537.687
G1 X191.233 Y192.749 E.70294
G1 X190.699 Y192.749 E.01592
G1 X174.198 Y209.251 E.69578
G1 X173.664 Y209.251 E.01592
G1 X190.165 Y192.749 E.69578
G1 X189.631 Y192.749 E.01592
G1 X173.13 Y209.251 E.69578
G1 X172.596 Y209.251 E.01592
G1 X189.097 Y192.749 E.69578
G1 X188.564 Y192.749 E.01592
G1 X172.063 Y209.251 E.69578
G1 X171.529 Y209.251 E.01592
G1 X188.03 Y192.749 E.69578
G1 X187.496 Y192.749 E.01592
G1 X170.995 Y209.251 E.69578
G1 X170.461 Y209.251 E.01592
G1 X186.962 Y192.749 E.69578
G1 X186.428 Y192.749 E.01592
G1 X169.927 Y209.251 E.69578
G1 X169.394 Y209.251 E.01592
G1 X185.895 Y192.749 E.69578
G1 X185.361 Y192.749 E.01592
G1 X168.86 Y209.251 E.69578
G1 X168.326 Y209.251 E.01592
G1 X184.827 Y192.749 E.69578
G1 X184.293 Y192.749 E.01592
G1 X167.792 Y209.251 E.69578
G1 X167.258 Y209.251 E.01592
G1 X183.76 Y192.749 E.69578
G1 X183.226 Y192.749 E.01592
G1 X166.725 Y209.251 E.69578
G1 X166.191 Y209.251 E.01592
G1 X182.692 Y192.749 E.69578
G1 X182.158 Y192.749 E.01592
G1 X165.657 Y209.251 E.69578
G1 X165.123 Y209.251 E.01592
G1 X181.624 Y192.749 E.69578
G1 X181.091 Y192.749 E.01592
G1 X164.589 Y209.251 E.69578
G1 X164.056 Y209.251 E.01592
G1 X180.557 Y192.749 E.69578
G1 X180.023 Y192.749 E.01592
G1 X163.522 Y209.251 E.69578
G1 X162.988 Y209.251 E.01592
G1 X179.489 Y192.749 E.69578
G1 X178.955 Y192.749 E.01592
G1 X162.454 Y209.251 E.69578
G1 X161.92 Y209.251 E.01592
G1 X178.422 Y192.749 E.69578
G1 X177.888 Y192.749 E.01592
G1 X161.387 Y209.251 E.69578
G1 X160.853 Y209.251 E.01592
G1 X177.354 Y192.749 E.69578
G1 X176.82 Y192.749 E.01592
G1 X160.319 Y209.251 E.69578
G1 X159.785 Y209.251 E.01592
G1 X176.286 Y192.749 E.69578
G1 X175.753 Y192.749 E.01592
G1 X159.252 Y209.251 E.69578
G1 X158.718 Y209.251 E.01592
G1 X175.219 Y192.749 E.69578
G1 X174.685 Y192.749 E.01592
G1 X158.184 Y209.251 E.69578
G1 X157.65 Y209.251 E.01592
G1 X174.151 Y192.749 E.69578
G1 X173.617 Y192.749 E.01592
G1 X157.116 Y209.251 E.69578
G1 X156.583 Y209.251 E.01592
G1 X173.084 Y192.749 E.69578
G1 X172.55 Y192.749 E.01592
G1 X156.049 Y209.251 E.69578
G1 X155.515 Y209.251 E.01592
G1 X172.016 Y192.749 E.69578
G1 X171.482 Y192.749 E.01592
G1 X154.981 Y209.251 E.69578
G1 X154.447 Y209.251 E.01592
G1 X170.948 Y192.749 E.69578
G1 X170.415 Y192.749 E.01592
G1 X153.914 Y209.251 E.69578
G1 X153.38 Y209.251 E.01592
G1 X169.881 Y192.749 E.69578
G1 X169.347 Y192.749 E.01592
G1 X152.846 Y209.251 E.69578
G1 X152.312 Y209.251 E.01592
G1 X168.813 Y192.749 E.69578
G1 X168.279 Y192.749 E.01592
G1 X151.778 Y209.251 E.69578
G1 X151.245 Y209.251 E.01592
G1 X167.746 Y192.749 E.69578
G1 X167.212 Y192.749 E.01592
G1 X150.711 Y209.251 E.69578
G1 X150.177 Y209.251 E.01592
G1 X166.678 Y192.749 E.69578
G1 X166.144 Y192.749 E.01592
G1 X149.643 Y209.251 E.69578
G1 X149.109 Y209.251 E.01592
G1 X165.61 Y192.749 E.69578
G1 X165.077 Y192.749 E.01592
G1 X148.576 Y209.251 E.69578
G1 X148.042 Y209.251 E.01592
G1 X164.543 Y192.749 E.69578
G1 X164.009 Y192.749 E.01592
G1 X147.508 Y209.251 E.69578
G1 X146.974 Y209.251 E.01592
G1 X163.475 Y192.749 E.69578
G1 X162.942 Y192.749 E.01592
G1 X146.44 Y209.251 E.69578
M73 P76 R15
G1 X145.907 Y209.251 E.01592
G1 X162.408 Y192.749 E.69578
G1 X161.874 Y192.749 E.01592
G1 X145.373 Y209.251 E.69578
G1 X144.839 Y209.251 E.01592
G1 X161.34 Y192.749 E.69578
G1 X160.806 Y192.749 E.01592
G1 X144.305 Y209.251 E.69578
G1 X143.771 Y209.251 E.01592
G1 X160.273 Y192.749 E.69578
G1 X159.739 Y192.749 E.01592
G1 X143.238 Y209.251 E.69578
G1 X142.704 Y209.251 E.01592
G1 X159.205 Y192.749 E.69578
G1 X158.671 Y192.749 E.01592
G1 X142.17 Y209.251 E.69578
G1 X141.636 Y209.251 E.01592
G1 X158.137 Y192.749 E.69578
G1 X157.604 Y192.749 E.01592
G1 X141.102 Y209.251 E.69578
G1 X140.569 Y209.251 E.01592
G1 X157.07 Y192.749 E.69578
G1 X156.536 Y192.749 E.01592
G1 X140.035 Y209.251 E.69578
G1 X139.501 Y209.251 E.01592
G1 X156.002 Y192.749 E.69578
G1 X155.468 Y192.749 E.01592
G1 X138.967 Y209.251 E.69578
G1 X138.434 Y209.251 E.01592
G1 X154.935 Y192.749 E.69578
G1 X154.401 Y192.749 E.01592
G1 X137.9 Y209.251 E.69578
G1 X137.366 Y209.251 E.01592
G1 X153.867 Y192.749 E.69578
G1 X153.333 Y192.749 E.01592
G1 X136.832 Y209.251 E.69578
G1 X136.298 Y209.251 E.01592
G1 X152.799 Y192.749 E.69578
G1 X152.266 Y192.749 E.01592
G1 X135.765 Y209.251 E.69578
G1 X135.231 Y209.251 E.01592
G1 X151.732 Y192.749 E.69578
G1 X151.198 Y192.749 E.01592
G1 X134.697 Y209.251 E.69578
G1 X134.163 Y209.251 E.01592
G1 X150.664 Y192.749 E.69578
G1 X150.13 Y192.749 E.01592
G1 X133.629 Y209.251 E.69578
G1 X133.096 Y209.251 E.01592
G1 X149.597 Y192.749 E.69578
G1 X149.063 Y192.749 E.01592
G1 X132.562 Y209.251 E.69578
G1 X132.028 Y209.251 E.01592
G1 X148.529 Y192.749 E.69578
G1 X147.995 Y192.749 E.01592
G1 X131.494 Y209.251 E.69578
G1 X130.96 Y209.251 E.01592
G1 X147.461 Y192.749 E.69578
G1 X146.928 Y192.749 E.01592
G1 X130.427 Y209.251 E.69578
G1 X129.893 Y209.251 E.01592
G1 X146.394 Y192.749 E.69578
G1 X145.86 Y192.749 E.01592
G1 X129.359 Y209.251 E.69578
G1 X128.825 Y209.251 E.01592
G1 X145.326 Y192.749 E.69578
G1 X144.792 Y192.749 E.01592
G1 X128.291 Y209.251 E.69578
G1 X127.758 Y209.251 E.01592
G1 X144.259 Y192.749 E.69578
G1 X143.725 Y192.749 E.01592
G1 X127.224 Y209.251 E.69578
G1 X126.69 Y209.251 E.01592
G1 X143.191 Y192.749 E.69578
G1 X142.657 Y192.749 E.01592
G1 X126.156 Y209.251 E.69578
G1 X125.622 Y209.251 E.01592
G1 X142.124 Y192.749 E.69578
G1 X141.59 Y192.749 E.01592
G1 X125.089 Y209.251 E.69578
G1 X124.555 Y209.251 E.01592
G1 X141.056 Y192.749 E.69578
G1 X140.522 Y192.749 E.01592
G1 X131.452 Y201.82 E.38246
G2 X131.542 Y201.196 I-3.525 J-.828 E.01882
G1 X139.988 Y192.749 E.35615
G1 X139.455 Y192.749 E.01592
G1 X131.535 Y200.669 E.33393
G2 X131.459 Y200.211 I-5.193 J.622 E.01385
G1 X138.921 Y192.749 E.31461
G1 X138.387 Y192.749 E.01592
G1 X131.338 Y199.799 E.29724
G2 X131.178 Y199.424 I-1.948 J.608 E.01215
G1 X137.853 Y192.749 E.28145
G1 X137.319 Y192.749 E.01592
G1 X130.986 Y199.083 E.26706
G2 X130.763 Y198.772 I-1.667 J.961 E.01142
G1 X136.786 Y192.749 E.25396
G1 X136.252 Y192.749 E.01592
G1 X130.511 Y198.491 E.24208
G2 X130.23 Y198.237 I-1.405 J1.272 E.01129
G1 X135.718 Y192.749 E.2314
G1 X135.184 Y192.749 E.01592
G1 X129.921 Y198.013 E.22194
G2 X129.579 Y197.821 I-1.128 J1.607 E.01171
G1 X134.65 Y192.749 E.21384
G1 X134.117 Y192.749 E.01592
G1 X129.204 Y197.662 E.20716
G2 X128.79 Y197.542 I-.808 J2.006 E.01286
G1 X133.583 Y192.749 E.20208
G1 X133.049 Y192.749 E.01592
G1 X128.332 Y197.467 E.1989
G2 X127.807 Y197.457 I-.342 J4.494 E.01565
G1 X132.515 Y192.749 E.19851
G1 X131.981 Y192.749 E.01592
G1 X126.942 Y197.789 E.2125
; WIPE_START
G1 X128.356 Y196.375 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.793 Y199.938 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
G1 F9537.687
G1 X115.48 Y209.251 E.39268
G1 X116.014 Y209.251 E.01592
G1 X124.454 Y200.811 E.35588
G2 X124.468 Y201.33 I4.922 J.126 E.01551
G1 X116.548 Y209.251 E.33396
G1 X117.082 Y209.251 E.01592
G1 X124.541 Y201.791 E.31453
G2 X124.66 Y202.206 I2.132 J-.387 E.01289
G1 X117.615 Y209.251 E.29703
G1 X118.149 Y209.251 E.01592
G1 X124.821 Y202.579 E.28131
G2 X125.015 Y202.919 I1.794 J-.8 E.01168
G1 X118.683 Y209.251 E.26699
G1 X119.217 Y209.251 E.01592
G1 X125.239 Y203.228 E.25394
G2 X125.492 Y203.509 I1.529 J-1.124 E.01129
M73 P77 R15
G1 X119.751 Y209.251 E.2421
G1 X120.284 Y209.251 E.01592
G1 X125.774 Y203.762 E.23145
G2 X126.084 Y203.985 I1.273 J-1.439 E.01142
G1 X120.818 Y209.251 E.22202
G1 X121.352 Y209.251 E.01592
G1 X126.424 Y204.178 E.21387
G2 X126.798 Y204.339 I.988 J-1.785 E.01214
G1 X121.886 Y209.251 E.20711
G1 X122.42 Y209.251 E.01592
G1 X127.208 Y204.462 E.20191
G2 X127.671 Y204.533 I1.116 J-5.785 E.01398
G1 X122.953 Y209.251 E.19894
G1 X123.487 Y209.251 E.01592
G1 X128.194 Y204.544 E.19848
G2 X128.82 Y204.451 I-.245 J-3.832 E.01889
G1 X123.851 Y209.42 E.20952
G1 X114.777 Y209.42 F30000
G1 F9537.687
G1 X131.448 Y192.749 E.70294
G1 X130.914 Y192.749 E.01592
G1 X114.413 Y209.251 E.69578
G1 X113.879 Y209.251 E.01592
G1 X130.38 Y192.749 E.69578
G1 X129.846 Y192.749 E.01592
G1 X113.345 Y209.251 E.69578
G1 X112.811 Y209.251 E.01592
G1 X129.312 Y192.749 E.69578
G1 X128.779 Y192.749 E.01592
G1 X112.278 Y209.251 E.69578
G1 X111.744 Y209.251 E.01592
G1 X128.245 Y192.749 E.69578
G1 X127.711 Y192.749 E.01592
G1 X111.21 Y209.251 E.69578
G1 X110.676 Y209.251 E.01592
G1 X127.177 Y192.749 E.69578
G1 X126.643 Y192.749 E.01592
G1 X110.142 Y209.251 E.69578
G1 X109.609 Y209.251 E.01592
G1 X126.11 Y192.749 E.69578
G1 X125.576 Y192.749 E.01592
G1 X109.075 Y209.251 E.69578
G1 X108.541 Y209.251 E.01592
G1 X125.042 Y192.749 E.69578
G1 X124.508 Y192.749 E.01592
G1 X108.007 Y209.251 E.69578
G1 X107.473 Y209.251 E.01592
G1 X123.974 Y192.749 E.69578
G1 X123.441 Y192.749 E.01592
G1 X106.94 Y209.251 E.69578
G1 X106.406 Y209.251 E.01592
G1 X122.907 Y192.749 E.69578
G1 X122.373 Y192.749 E.01592
G1 X105.872 Y209.251 E.69578
G1 X105.338 Y209.251 E.01592
G1 X121.839 Y192.749 E.69578
G1 X121.305 Y192.749 E.01592
G1 X104.804 Y209.251 E.69578
G1 X104.271 Y209.251 E.01592
G1 X120.772 Y192.749 E.69578
G1 X120.238 Y192.749 E.01592
G1 X103.737 Y209.251 E.69578
G1 X103.203 Y209.251 E.01592
G1 X119.704 Y192.749 E.69578
G1 X119.17 Y192.749 E.01592
G1 X102.669 Y209.251 E.69578
G1 X102.135 Y209.251 E.01592
G1 X118.637 Y192.749 E.69578
G1 X118.103 Y192.749 E.01592
G1 X101.602 Y209.251 E.69578
G1 X101.068 Y209.251 E.01592
G1 X117.569 Y192.749 E.69578
G1 X117.035 Y192.749 E.01592
G1 X100.534 Y209.251 E.69578
G1 X100 Y209.251 E.01592
G1 X116.501 Y192.749 E.69578
G1 X115.968 Y192.749 E.01592
G1 X99.466 Y209.251 E.69578
G1 X98.933 Y209.251 E.01592
G1 X115.434 Y192.749 E.69578
G1 X114.9 Y192.749 E.01592
G1 X98.399 Y209.251 E.69578
G1 X97.865 Y209.251 E.01592
G1 X114.366 Y192.749 E.69578
G1 X113.832 Y192.749 E.01592
G1 X97.331 Y209.251 E.69578
G1 X96.797 Y209.251 E.01592
G1 X113.299 Y192.749 E.69578
G1 X112.765 Y192.749 E.01592
G1 X96.264 Y209.251 E.69578
G1 X95.73 Y209.251 E.01592
G1 X112.231 Y192.749 E.69578
G1 X111.697 Y192.749 E.01592
G1 X95.196 Y209.251 E.69578
G1 X94.662 Y209.251 E.01592
G1 X111.163 Y192.749 E.69578
G1 X110.63 Y192.749 E.01592
G1 X94.129 Y209.251 E.69578
G1 X93.595 Y209.251 E.01592
G1 X110.096 Y192.749 E.69578
G1 X109.562 Y192.749 E.01592
G1 X93.061 Y209.251 E.69578
G1 X92.527 Y209.251 E.01592
G1 X109.028 Y192.749 E.69578
G1 X108.494 Y192.749 E.01592
G1 X91.993 Y209.251 E.69578
G1 X91.46 Y209.251 E.01592
G1 X107.961 Y192.749 E.69578
G1 X107.427 Y192.749 E.01592
G1 X90.926 Y209.251 E.69578
G1 X90.392 Y209.251 E.01592
G1 X106.893 Y192.749 E.69578
G1 X106.359 Y192.749 E.01592
G1 X89.858 Y209.251 E.69578
G1 X89.324 Y209.251 E.01592
G1 X105.825 Y192.749 E.69578
G1 X105.292 Y192.749 E.01592
G1 X88.791 Y209.251 E.69578
G1 X88.257 Y209.251 E.01592
G1 X104.758 Y192.749 E.69578
G1 X104.224 Y192.749 E.01592
G1 X87.723 Y209.251 E.69578
G1 X87.189 Y209.251 E.01592
G1 X103.69 Y192.749 E.69578
G1 X103.156 Y192.749 E.01592
G1 X86.655 Y209.251 E.69578
G1 X86.122 Y209.251 E.01592
G1 X102.623 Y192.749 E.69578
G1 X102.089 Y192.749 E.01592
G1 X85.588 Y209.251 E.69578
G1 X85.054 Y209.251 E.01592
G1 X101.555 Y192.749 E.69578
G1 X101.021 Y192.749 E.01592
G1 X84.52 Y209.251 E.69578
G1 X83.986 Y209.251 E.01592
G1 X100.487 Y192.749 E.69578
G1 X99.954 Y192.749 E.01592
G1 X83.453 Y209.251 E.69578
G1 X82.919 Y209.251 E.01592
G1 X99.42 Y192.749 E.69578
G1 X98.886 Y192.749 E.01592
G1 X82.385 Y209.251 E.69578
G1 X81.851 Y209.251 E.01592
G1 X98.352 Y192.749 E.69578
G1 X97.819 Y192.749 E.01592
G1 X81.317 Y209.251 E.69578
G1 X80.784 Y209.251 E.01592
G1 X97.285 Y192.749 E.69578
G1 X96.751 Y192.749 E.01592
G1 X80.25 Y209.251 E.69578
G1 X79.716 Y209.251 E.01592
G1 X96.217 Y192.749 E.69578
G1 X95.683 Y192.749 E.01592
G1 X79.182 Y209.251 E.69578
G1 X78.648 Y209.251 E.01592
G1 X95.15 Y192.749 E.69578
G1 X94.616 Y192.749 E.01592
G1 X78.115 Y209.251 E.69578
G1 X77.581 Y209.251 E.01592
G1 X94.082 Y192.749 E.69578
G1 X93.548 Y192.749 E.01592
G1 X77.047 Y209.251 E.69578
G1 X76.513 Y209.251 E.01592
G1 X93.014 Y192.749 E.69578
G1 X92.481 Y192.749 E.01592
G1 X75.979 Y209.251 E.69578
G1 X75.446 Y209.251 E.01592
G1 X91.947 Y192.749 E.69578
G1 X91.413 Y192.749 E.01592
G1 X74.912 Y209.251 E.69578
G1 X74.378 Y209.251 E.01592
G1 X90.879 Y192.749 E.69578
G1 X90.345 Y192.749 E.01592
G1 X73.844 Y209.251 E.69578
G1 X73.311 Y209.251 E.01592
G1 X89.812 Y192.749 E.69578
G1 X89.278 Y192.749 E.01592
G1 X72.777 Y209.251 E.69578
G1 X72.243 Y209.251 E.01592
G1 X88.744 Y192.749 E.69578
G1 X88.21 Y192.749 E.01592
G1 X71.709 Y209.251 E.69578
G1 X71.175 Y209.251 E.01592
G1 X87.676 Y192.749 E.69578
G1 X87.143 Y192.749 E.01592
G1 X70.642 Y209.251 E.69578
G1 X70.108 Y209.251 E.01592
G1 X86.609 Y192.749 E.69578
G1 X86.075 Y192.749 E.01592
G1 X69.574 Y209.251 E.69578
G1 X69.04 Y209.251 E.01592
G1 X85.541 Y192.749 E.69578
G1 X85.007 Y192.749 E.01592
G1 X68.506 Y209.251 E.69578
G1 X67.973 Y209.251 E.01592
G1 X84.474 Y192.749 E.69578
G1 X83.94 Y192.749 E.01592
G1 X67.439 Y209.251 E.69578
G1 X66.905 Y209.251 E.01592
G1 X83.406 Y192.749 E.69578
G1 X82.872 Y192.749 E.01592
G1 X66.371 Y209.251 E.69578
G1 X65.837 Y209.251 E.01592
G1 X82.338 Y192.749 E.69578
G1 X81.805 Y192.749 E.01592
G1 X65.304 Y209.251 E.69578
G1 X64.77 Y209.251 E.01592
G1 X81.271 Y192.749 E.69578
G1 X80.737 Y192.749 E.01592
G1 X64.236 Y209.251 E.69578
G1 X63.702 Y209.251 E.01592
G1 X80.203 Y192.749 E.69578
G1 X79.669 Y192.749 E.01592
G1 X63.168 Y209.251 E.69578
G1 X62.635 Y209.251 E.01592
G1 X79.136 Y192.749 E.69578
G1 X78.602 Y192.749 E.01592
G1 X62.101 Y209.251 E.69578
G1 X61.567 Y209.251 E.01592
G1 X78.068 Y192.749 E.69578
G1 X77.534 Y192.749 E.01592
G1 X61.033 Y209.251 E.69578
G1 X60.499 Y209.251 E.01592
G1 X77.001 Y192.749 E.69578
G1 X76.467 Y192.749 E.01592
G1 X59.966 Y209.251 E.69578
G1 X59.432 Y209.251 E.01592
G1 X75.933 Y192.749 E.69578
G1 X75.399 Y192.749 E.01592
G1 X58.898 Y209.251 E.69578
G1 X58.364 Y209.251 E.01592
G1 X74.865 Y192.749 E.69578
G1 X74.332 Y192.749 E.01592
G1 X57.83 Y209.251 E.69578
G1 X57.297 Y209.251 E.01592
G1 X73.798 Y192.749 E.69578
G1 X73.264 Y192.749 E.01592
G1 X56.763 Y209.251 E.69578
G1 X56.229 Y209.251 E.01592
G1 X72.73 Y192.749 E.69578
G1 X72.196 Y192.749 E.01592
G1 X55.695 Y209.251 E.69578
G1 X55.161 Y209.251 E.01592
G1 X71.663 Y192.749 E.69578
G1 X71.129 Y192.749 E.01592
G1 X54.628 Y209.251 E.69578
G1 X54.094 Y209.251 E.01592
G1 X70.595 Y192.749 E.69578
G1 X70.061 Y192.749 E.01592
G1 X53.56 Y209.251 E.69578
G1 X53.026 Y209.251 E.01592
G1 X69.527 Y192.749 E.69578
G1 X68.994 Y192.749 E.01592
G1 X59.189 Y202.555 E.41344
G2 X59.473 Y201.736 I-3.357 J-1.626 E.02589
G1 X68.46 Y192.749 E.37894
G1 X67.926 Y192.749 E.01592
G1 X59.545 Y201.13 E.35339
G2 X59.529 Y200.613 I-4.43 J-.12 E.01545
G1 X67.392 Y192.749 E.33156
G1 X66.858 Y192.749 E.01592
G1 X59.447 Y200.161 E.31252
G2 X59.321 Y199.753 I-2.105 J.426 E.01275
G1 X66.325 Y192.749 E.29531
G1 X65.791 Y192.749 E.01592
G1 X59.158 Y199.382 E.27968
G2 X58.962 Y199.044 I-1.789 J.812 E.01166
G1 X65.257 Y192.749 E.26543
G1 X64.723 Y192.749 E.01592
G1 X58.736 Y198.737 E.25247
G2 X58.481 Y198.458 I-1.524 J1.14 E.01128
G1 X64.251 Y192.688 E.24329
G1 X64.251 Y192.155 E.01592
G1 X58.195 Y198.21 E.25532
G2 X57.881 Y197.99 I-1.252 J1.458 E.01145
G1 X64.251 Y191.621 E.26857
G1 X64.251 Y191.087 E.01592
G1 X57.536 Y197.801 E.28312
G2 X57.157 Y197.647 I-.963 J1.816 E.01223
G1 X64.251 Y190.553 E.2991
G1 X64.251 Y190.019 E.01592
G1 X56.74 Y197.53 E.31671
G2 X56.276 Y197.46 I-.585 J2.279 E.01399
G1 X64.251 Y189.486 E.33623
G1 X64.251 Y188.952 E.01592
G1 X55.74 Y197.462 E.35885
G2 X55.1 Y197.568 I.27 J3.616 E.01936
G1 X64.251 Y188.418 E.38583
G1 X64.251 Y187.884 E.01592
G1 X47.749 Y204.385 E.69578
G1 X47.749 Y204.919 E.01592
G1 X52.564 Y200.104 E.20301
G2 X52.461 Y200.741 I4.458 J1.049 E.01925
G1 X47.749 Y205.453 E.19866
G1 X47.749 Y205.987 E.01592
G1 X52.462 Y201.274 E.19873
G2 X52.531 Y201.739 I2.361 J-.107 E.01406
G1 X47.749 Y206.52 E.2016
G1 X47.749 Y207.054 E.01592
G1 X52.645 Y202.158 E.20643
G2 X52.799 Y202.538 I1.976 J-.579 E.01224
G1 X47.749 Y207.588 E.21292
G1 X47.749 Y208.122 E.01592
G1 X52.99 Y202.882 E.22096
G2 X53.211 Y203.194 I1.671 J-.946 E.01144
G1 X47.749 Y208.656 E.23028
G1 X47.749 Y209.189 E.01592
G1 X53.461 Y203.478 E.24082
G2 X53.739 Y203.734 I1.417 J-1.264 E.01128
G1 X48.222 Y209.251 E.23262
G1 X48.756 Y209.251 E.01592
G1 X54.046 Y203.961 E.22305
G2 X54.383 Y204.157 I1.15 J-1.585 E.01166
G1 X49.29 Y209.251 E.21476
G1 X49.824 Y209.251 E.01592
G1 X54.753 Y204.321 E.20785
G2 X55.159 Y204.448 I.84 J-1.971 E.01272
G1 X50.357 Y209.251 E.20248
G1 X50.891 Y209.251 E.01592
G1 X55.613 Y204.528 E.19912
G2 X56.13 Y204.545 I.343 J-2.568 E.01545
G1 X51.425 Y209.251 E.19841
G1 X51.959 Y209.251 E.01592
G1 X56.74 Y204.47 E.20159
G2 X57.551 Y204.192 I-.776 J-3.591 E.02565
G1 X52.323 Y209.42 E.22047
G1 X47.58 Y204.021 F30000
G1 F9537.687
G1 X64.251 Y187.35 E.70294
G1 X64.251 Y186.817 E.01592
G1 X47.749 Y203.318 E.69578
G1 X47.749 Y202.784 E.01592
G1 X64.251 Y186.283 E.69578
G1 X64.251 Y185.749 E.01592
G1 X47.749 Y202.25 E.69578
G1 X47.749 Y201.716 E.01592
G1 X64.251 Y185.215 E.69578
G1 X64.251 Y184.681 E.01592
G1 X47.749 Y201.182 E.69578
G1 X47.749 Y200.649 E.01592
G1 X64.251 Y184.148 E.69578
G1 X64.251 Y183.614 E.01592
G1 X47.749 Y200.115 E.69578
G1 X47.749 Y199.581 E.01592
G1 X64.251 Y183.08 E.69578
G1 X64.251 Y182.546 E.01592
G1 X47.749 Y199.047 E.69578
G1 X47.749 Y198.514 E.01592
G1 X64.251 Y182.012 E.69578
G1 X64.251 Y181.479 E.01592
G1 X47.749 Y197.98 E.69578
G1 X47.749 Y197.446 E.01592
G1 X64.251 Y180.945 E.69578
G1 X64.251 Y180.411 E.01592
G1 X47.749 Y196.912 E.69578
G1 X47.749 Y196.378 E.01592
G1 X64.251 Y179.877 E.69578
G1 X64.251 Y179.343 E.01592
G1 X47.749 Y195.845 E.69578
G1 X47.749 Y195.311 E.01592
G1 X64.251 Y178.81 E.69578
G1 X64.251 Y178.276 E.01592
G1 X47.749 Y194.777 E.69578
G1 X47.749 Y194.243 E.01592
G1 X64.251 Y177.742 E.69578
G1 X64.251 Y177.208 E.01592
G1 X47.749 Y193.709 E.69578
G1 X47.749 Y193.176 E.01592
G1 X64.251 Y176.675 E.69578
G1 X64.251 Y176.141 E.01592
G1 X47.749 Y192.642 E.69578
G1 X47.749 Y192.108 E.01592
G1 X64.251 Y175.607 E.69578
G1 X64.251 Y175.073 E.01592
G1 X47.749 Y191.574 E.69578
G1 X47.749 Y191.04 E.01592
G1 X64.251 Y174.539 E.69578
G1 X64.251 Y174.006 E.01592
G1 X47.749 Y190.507 E.69578
G1 X47.749 Y189.973 E.01592
G1 X64.251 Y173.472 E.69578
G1 X64.251 Y172.938 E.01592
G1 X47.749 Y189.439 E.69578
G1 X47.749 Y188.905 E.01592
G1 X64.251 Y172.404 E.69578
G1 X64.251 Y171.87 E.01592
G1 X47.749 Y188.371 E.69578
G1 X47.749 Y187.838 E.01592
G1 X64.251 Y171.337 E.69578
G1 X64.251 Y170.803 E.01592
G1 X47.749 Y187.304 E.69578
G1 X47.749 Y186.77 E.01592
G1 X64.251 Y170.269 E.69578
G1 X64.251 Y169.735 E.01592
G1 X47.749 Y186.236 E.69578
G1 X47.749 Y185.702 E.01592
G1 X64.251 Y169.201 E.69578
G1 X64.251 Y168.668 E.01592
G1 X47.749 Y185.169 E.69578
G1 X47.749 Y184.635 E.01592
G1 X64.251 Y168.134 E.69578
G1 X64.251 Y167.6 E.01592
G1 X47.749 Y184.101 E.69578
G1 X47.749 Y183.567 E.01592
G1 X64.251 Y167.066 E.69578
G1 X64.251 Y166.532 E.01592
G1 X47.749 Y183.033 E.69578
G1 X47.749 Y182.5 E.01592
G1 X64.251 Y165.999 E.69578
G1 X64.251 Y165.465 E.01592
G1 X47.749 Y181.966 E.69578
G1 X47.749 Y181.432 E.01592
G1 X64.251 Y164.931 E.69578
G1 X64.251 Y164.397 E.01592
G1 X47.749 Y180.898 E.69578
G1 X47.749 Y180.365 E.01592
G1 X64.251 Y163.863 E.69578
G1 X64.251 Y163.33 E.01592
G1 X47.749 Y179.831 E.69578
G1 X47.749 Y179.297 E.01592
G1 X64.251 Y162.796 E.69578
G1 X64.251 Y162.262 E.01592
G1 X47.749 Y178.763 E.69578
G1 X47.749 Y178.229 E.01592
G1 X64.251 Y161.728 E.69578
G1 X64.251 Y161.194 E.01592
G1 X47.749 Y177.696 E.69578
G1 X47.749 Y177.162 E.01592
G1 X64.251 Y160.661 E.69578
G1 X64.251 Y160.127 E.01592
G1 X47.749 Y176.628 E.69578
G1 X47.749 Y176.094 E.01592
G1 X64.251 Y159.593 E.69578
G1 X64.251 Y159.059 E.01592
G1 X47.749 Y175.56 E.69578
G1 X47.749 Y175.027 E.01592
G1 X64.251 Y158.525 E.69578
G1 X64.251 Y157.992 E.01592
G1 X47.749 Y174.493 E.69578
G1 X47.749 Y173.959 E.01592
G1 X64.251 Y157.458 E.69578
G1 X64.251 Y156.924 E.01592
G1 X47.749 Y173.425 E.69578
G1 X47.749 Y172.891 E.01592
G1 X64.251 Y156.39 E.69578
G1 X64.251 Y155.857 E.01592
G1 X47.749 Y172.358 E.69578
G1 X47.749 Y171.824 E.01592
G1 X64.251 Y155.323 E.69578
G1 X64.251 Y154.789 E.01592
G1 X47.749 Y171.29 E.69578
G1 X47.749 Y170.756 E.01592
G1 X64.251 Y154.255 E.69578
G1 X64.251 Y153.721 E.01592
G1 X47.749 Y170.222 E.69578
G1 X47.749 Y169.689 E.01592
G1 X64.251 Y153.188 E.69578
G1 X64.251 Y152.654 E.01592
G1 X47.749 Y169.155 E.69578
G1 X47.749 Y168.621 E.01592
G1 X64.251 Y152.12 E.69578
G1 X64.251 Y151.586 E.01592
G1 X47.749 Y168.087 E.69578
G1 X47.749 Y167.553 E.01592
G1 X64.251 Y151.052 E.69578
G1 X64.251 Y150.519 E.01592
G1 X47.749 Y167.02 E.69578
G1 X47.749 Y166.486 E.01592
G1 X64.251 Y149.985 E.69578
G1 X64.251 Y149.451 E.01592
G1 X47.749 Y165.952 E.69578
G1 X47.749 Y165.418 E.01592
G1 X64.251 Y148.917 E.69578
G1 X64.251 Y148.383 E.01592
G1 X47.749 Y164.884 E.69578
G1 X47.749 Y164.351 E.01592
G1 X64.251 Y147.85 E.69578
G1 X64.251 Y147.316 E.01592
G1 X47.749 Y163.817 E.69578
G1 X47.749 Y163.283 E.01592
G1 X64.251 Y146.782 E.69578
G1 X64.251 Y146.248 E.01592
G1 X47.749 Y162.749 E.69578
G1 X47.749 Y162.215 E.01592
G1 X64.251 Y145.714 E.69578
G1 X64.251 Y145.181 E.01592
G1 X47.749 Y161.682 E.69578
G1 X47.749 Y161.148 E.01592
G1 X64.251 Y144.647 E.69578
G1 X64.251 Y144.113 E.01592
G1 X47.749 Y160.614 E.69578
G1 X47.749 Y160.08 E.01592
G1 X64.251 Y143.579 E.69578
G1 X64.251 Y143.045 E.01592
G1 X47.749 Y159.546 E.69578
G1 X47.749 Y159.013 E.01592
G1 X64.251 Y142.512 E.69578
G1 X64.251 Y141.978 E.01592
G1 X47.749 Y158.479 E.69578
G1 X47.749 Y157.945 E.01592
G1 X64.251 Y141.444 E.69578
G1 X64.251 Y140.91 E.01592
G1 X47.749 Y157.411 E.69578
G1 X47.749 Y156.878 E.01592
G1 X64.251 Y140.376 E.69578
G1 X64.251 Y139.843 E.01592
G1 X47.749 Y156.344 E.69578
G1 X47.749 Y155.81 E.01592
G1 X64.251 Y139.309 E.69578
G1 X64.251 Y138.775 E.01592
G1 X47.749 Y155.276 E.69578
G1 X47.749 Y154.742 E.01592
G1 X64.251 Y138.241 E.69578
G1 X64.251 Y137.707 E.01592
G1 X47.749 Y154.209 E.69578
G1 X47.749 Y153.675 E.01592
G1 X64.251 Y137.174 E.69578
G1 X64.251 Y136.64 E.01592
G1 X47.749 Y153.141 E.69578
G1 X47.749 Y152.607 E.01592
G1 X64.251 Y136.106 E.69578
G1 X64.251 Y135.572 E.01592
G1 X47.749 Y152.073 E.69578
G1 X47.749 Y151.54 E.01592
G1 X64.251 Y135.039 E.69578
G1 X64.251 Y134.505 E.01592
G1 X47.749 Y151.006 E.69578
G1 X47.749 Y150.472 E.01592
G1 X64.251 Y133.971 E.69578
G1 X64.251 Y133.437 E.01592
G1 X47.749 Y149.938 E.69578
G1 X47.749 Y149.404 E.01592
G1 X64.251 Y132.903 E.69578
G1 X64.251 Y132.37 E.01592
G1 X47.749 Y148.871 E.69578
G1 X47.749 Y148.337 E.01592
G1 X64.251 Y131.836 E.69578
G1 X64.251 Y131.302 E.01592
G1 X47.749 Y147.803 E.69578
G1 X47.749 Y147.269 E.01592
G1 X64.251 Y130.768 E.69578
G1 X64.251 Y130.234 E.01592
G1 X47.749 Y146.735 E.69578
G1 X47.749 Y146.202 E.01592
G1 X64.251 Y129.701 E.69578
G1 X64.251 Y129.167 E.01592
G1 X47.749 Y145.668 E.69578
G1 X47.749 Y145.134 E.01592
G1 X64.251 Y128.633 E.69578
G1 X64.251 Y128.099 E.01592
G1 X47.749 Y144.6 E.69578
G1 X47.749 Y144.066 E.01592
G1 X64.251 Y127.565 E.69578
M73 P78 R15
G1 X64.251 Y127.032 E.01592
G1 X47.749 Y143.533 E.69578
G1 X47.749 Y142.999 E.01592
G1 X64.251 Y126.498 E.69578
G1 X64.251 Y125.964 E.01592
G1 X47.749 Y142.465 E.69578
G1 X47.749 Y141.931 E.01592
G1 X64.251 Y125.43 E.69578
G1 X64.251 Y124.896 E.01592
G1 X47.749 Y141.397 E.69578
G1 X47.749 Y140.864 E.01592
G1 X64.251 Y124.363 E.69578
G1 X64.251 Y123.829 E.01592
G1 X47.749 Y140.33 E.69578
G1 X47.749 Y139.796 E.01592
G1 X64.251 Y123.295 E.69578
G1 X64.251 Y122.761 E.01592
G1 X47.749 Y139.262 E.69578
G1 X47.749 Y138.729 E.01592
G1 X57.108 Y129.37 E.39462
G3 X56.422 Y129.522 I-1.111 J-3.382 E.02099
G1 X47.749 Y138.195 E.36569
G1 X47.749 Y137.661 E.01592
G1 X55.863 Y129.547 E.34213
G3 X55.383 Y129.493 I.029 J-2.431 E.01443
G1 X47.749 Y137.127 E.32189
G1 X47.749 Y136.593 E.01592
G1 X54.953 Y129.39 E.30373
G3 X54.563 Y129.246 I.524 J-2.022 E.01241
G1 X47.749 Y136.06 E.28728
G1 X47.749 Y135.526 E.01592
G1 X54.209 Y129.066 E.27238
G3 X53.888 Y128.853 I.904 J-1.709 E.0115
G1 X47.749 Y134.992 E.25885
G1 X47.749 Y134.458 E.01592
G1 X53.597 Y128.611 E.24655
G3 X53.333 Y128.34 I1.219 J-1.45 E.01127
G1 X47.749 Y133.924 E.23545
G1 X47.749 Y133.391 E.01592
G1 X53.099 Y128.041 E.22555
G3 X52.894 Y127.713 I1.541 J-1.19 E.01157
G1 X47.749 Y132.857 E.21691
G1 X47.749 Y132.323 E.01592
G1 X52.72 Y127.352 E.2096
G3 X52.583 Y126.956 I1.914 J-.887 E.01252
G1 X47.749 Y131.789 E.2038
G1 X47.749 Y131.255 E.01592
G1 X52.487 Y126.518 E.19976
G3 X52.453 Y126.018 I2.48 J-.42 E.01496
G1 X47.749 Y130.722 E.19832
G1 X47.749 Y130.188 E.01592
G1 X52.493 Y125.444 E.20004
G3 X52.695 Y124.709 I3.895 J.672 E.02276
G1 X47.749 Y129.654 E.20853
G1 X47.749 Y129.12 E.01592
G1 X64.251 Y112.619 E.69578
G1 X64.251 Y113.153 E.01592
G1 X54.706 Y122.697 E.40244
G3 X55.441 Y122.497 I1.306 J3.341 E.02273
G1 X64.251 Y113.687 E.37148
G1 X64.251 Y114.221 E.01592
G1 X56.018 Y122.453 E.34715
G3 X56.515 Y122.49 I.084 J2.292 E.01491
G1 X64.251 Y114.754 E.32616
G1 X64.251 Y115.288 E.01592
G1 X56.958 Y122.58 E.30748
G3 X57.353 Y122.719 I-2.312 J7.214 E.01249
G1 X64.251 Y115.822 E.29082
G1 X64.251 Y116.356 E.01592
G1 X57.713 Y122.893 E.27566
G3 X58.041 Y123.099 I-.863 J1.741 E.01157
G1 X64.251 Y116.889 E.26182
G1 X64.251 Y117.423 E.01592
G1 X58.34 Y123.334 E.24923
G3 X58.61 Y123.598 I-1.182 J1.481 E.01127
G1 X64.251 Y117.957 E.23784
G1 X64.251 Y118.491 E.01592
G1 X58.852 Y123.89 E.22765
G3 X59.064 Y124.211 I-1.499 J1.222 E.01151
G1 X64.251 Y119.025 E.21869
G1 X64.251 Y119.558 E.01592
G1 X59.245 Y124.564 E.21105
G3 X59.393 Y124.95 I-1.86 J.93 E.01235
G1 X64.251 Y120.092 E.20483
G1 X64.251 Y120.626 E.01592
G1 X59.494 Y125.382 E.20055
G3 X59.545 Y125.865 I-2.394 J.496 E.01451
G1 X64.251 Y121.16 E.19842
G1 X64.251 Y121.694 E.01592
G1 X59.524 Y126.42 E.1993
G3 X59.373 Y127.105 I-3.968 J-.517 E.02095
G1 X64.42 Y122.058 E.21284
; WIPE_START
G1 X63.006 Y123.472 E-.76
; WIPE_END
M73 P78 R14
G1 E-.04 F1800
G1 X55.785 Y125.945 Z3.2 F30000
G1 X47.58 Y128.756 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F9537.687
G1 X64.251 Y112.085 E.70294
G1 X64.251 Y111.552 E.01592
G1 X47.749 Y128.053 E.69578
G1 X47.749 Y127.519 E.01592
G1 X64.251 Y111.018 E.69578
G1 X64.251 Y110.484 E.01592
G1 X47.749 Y126.985 E.69578
G1 X47.749 Y126.451 E.01592
G1 X64.251 Y109.95 E.69578
G1 X64.251 Y109.416 E.01592
G1 X47.749 Y125.917 E.69578
G1 X47.749 Y125.384 E.01592
G1 X64.251 Y108.883 E.69578
G1 X64.251 Y108.349 E.01592
G1 X47.749 Y124.85 E.69578
G1 X47.749 Y124.316 E.01592
G1 X64.251 Y107.815 E.69578
G1 X64.251 Y107.281 E.01592
G1 X47.749 Y123.782 E.69578
G1 X47.749 Y123.248 E.01592
G1 X64.251 Y106.747 E.69578
G1 X64.251 Y106.214 E.01592
G1 X47.749 Y122.715 E.69578
G1 X47.749 Y122.181 E.01592
G1 X64.251 Y105.68 E.69578
G1 X64.251 Y105.146 E.01592
G1 X47.749 Y121.647 E.69578
G1 X47.749 Y121.113 E.01592
G1 X64.251 Y104.612 E.69578
G1 X64.251 Y104.078 E.01592
G1 X47.749 Y120.579 E.69578
G1 X47.749 Y120.046 E.01592
G1 X64.251 Y103.545 E.69578
G1 X64.251 Y103.011 E.01592
G1 X47.749 Y119.512 E.69578
G1 X47.749 Y118.978 E.01592
G1 X64.251 Y102.477 E.69578
G1 X64.251 Y101.943 E.01592
G1 X47.749 Y118.444 E.69578
G1 X47.749 Y117.911 E.01592
G1 X64.251 Y101.409 E.69578
G1 X64.251 Y100.876 E.01592
G1 X47.749 Y117.377 E.69578
G1 X47.749 Y116.843 E.01592
G1 X64.251 Y100.342 E.69578
G1 X64.251 Y99.808 E.01592
G1 X47.749 Y116.309 E.69578
G1 X47.749 Y115.775 E.01592
G1 X64.251 Y99.274 E.69578
G1 X64.251 Y98.74 E.01592
G1 X47.749 Y115.242 E.69578
G1 X47.749 Y114.708 E.01592
G1 X64.251 Y98.207 E.69578
G1 X64.251 Y97.673 E.01592
G1 X47.749 Y114.174 E.69578
G1 X47.749 Y113.64 E.01592
G1 X64.251 Y97.139 E.69578
G1 X64.251 Y96.605 E.01592
G1 X47.749 Y113.106 E.69578
G1 X47.749 Y112.573 E.01592
G1 X64.251 Y96.071 E.69578
G1 X64.251 Y95.538 E.01592
G1 X47.749 Y112.039 E.69578
G1 X47.749 Y111.505 E.01592
G1 X64.251 Y95.004 E.69578
G1 X64.251 Y94.47 E.01592
G1 X47.749 Y110.971 E.69578
G1 X47.749 Y110.437 E.01592
G1 X64.251 Y93.936 E.69578
G1 X64.251 Y93.403 E.01592
G1 X47.749 Y109.904 E.69578
G1 X47.749 Y109.37 E.01592
G1 X64.251 Y92.869 E.69578
G1 X64.251 Y92.335 E.01592
G1 X47.749 Y108.836 E.69578
G1 X47.749 Y108.302 E.01592
G1 X64.251 Y91.801 E.69578
G1 X64.251 Y91.267 E.01592
G1 X47.749 Y107.768 E.69578
G1 X47.749 Y107.235 E.01592
G1 X64.251 Y90.734 E.69578
G1 X64.251 Y90.2 E.01592
G1 X47.749 Y106.701 E.69578
G1 X47.749 Y106.167 E.01592
G1 X64.251 Y89.666 E.69578
G1 X64.251 Y89.132 E.01592
G1 X47.749 Y105.633 E.69578
G1 X47.749 Y105.099 E.01592
G1 X64.251 Y88.598 E.69578
G1 X64.251 Y88.065 E.01592
G1 X47.749 Y104.566 E.69578
G1 X47.749 Y104.032 E.01592
G1 X64.251 Y87.531 E.69578
G1 X64.251 Y86.997 E.01592
G1 X47.749 Y103.498 E.69578
G1 X47.749 Y102.964 E.01592
G1 X64.251 Y86.463 E.69578
G1 X64.251 Y85.929 E.01592
G1 X47.749 Y102.43 E.69578
G1 X47.749 Y101.897 E.01592
G1 X64.251 Y85.396 E.69578
G1 X64.251 Y84.862 E.01592
G1 X47.749 Y101.363 E.69578
G1 X47.749 Y100.829 E.01592
G1 X64.251 Y84.328 E.69578
G1 X64.251 Y83.794 E.01592
G1 X47.749 Y100.295 E.69578
G1 X47.749 Y99.761 E.01592
G1 X64.251 Y83.26 E.69578
G1 X64.251 Y82.727 E.01592
G1 X47.749 Y99.228 E.69578
G1 X47.749 Y98.694 E.01592
G1 X64.251 Y82.193 E.69578
G1 X64.251 Y81.659 E.01592
G1 X47.749 Y98.16 E.69578
G1 X47.749 Y97.626 E.01592
G1 X64.251 Y81.125 E.69578
G1 X64.251 Y80.591 E.01592
G1 X47.749 Y97.093 E.69578
G1 X47.749 Y96.559 E.01592
G1 X64.251 Y80.058 E.69578
G1 X64.251 Y79.524 E.01592
G1 X47.749 Y96.025 E.69578
G1 X47.749 Y95.491 E.01592
G1 X64.251 Y78.99 E.69578
G1 X64.251 Y78.456 E.01592
G1 X47.749 Y94.957 E.69578
G1 X47.749 Y94.424 E.01592
G1 X64.251 Y77.922 E.69578
G1 X64.251 Y77.389 E.01592
G1 X47.749 Y93.89 E.69578
G1 X47.749 Y93.356 E.01592
G1 X64.251 Y76.855 E.69578
G1 X64.251 Y76.321 E.01592
G1 X47.749 Y92.822 E.69578
G1 X47.749 Y92.288 E.01592
G1 X64.251 Y75.787 E.69578
G1 X64.251 Y75.253 E.01592
G1 X47.749 Y91.755 E.69578
G1 X47.749 Y91.221 E.01592
G1 X64.251 Y74.72 E.69578
G1 X64.251 Y74.186 E.01592
G1 X47.749 Y90.687 E.69578
G1 X47.749 Y90.153 E.01592
G1 X64.251 Y73.652 E.69578
G1 X64.251 Y73.118 E.01592
G1 X47.749 Y89.619 E.69578
G1 X47.749 Y89.086 E.01592
G1 X64.251 Y72.585 E.69578
G1 X64.251 Y72.051 E.01592
G1 X47.749 Y88.552 E.69578
G1 X47.749 Y88.018 E.01592
G1 X64.251 Y71.517 E.69578
G1 X64.251 Y70.983 E.01592
G1 X47.749 Y87.484 E.69578
G1 X47.749 Y86.95 E.01592
G1 X64.251 Y70.449 E.69578
G1 X64.251 Y69.916 E.01592
G1 X47.749 Y86.417 E.69578
G1 X47.749 Y85.883 E.01592
G1 X64.251 Y69.382 E.69578
G1 X64.251 Y68.848 E.01592
G1 X47.749 Y85.349 E.69578
G1 X47.749 Y84.815 E.01592
G1 X64.251 Y68.314 E.69578
G1 X64.251 Y67.78 E.01592
G1 X47.749 Y84.281 E.69578
G1 X47.749 Y83.748 E.01592
G1 X64.251 Y67.247 E.69578
G1 X64.251 Y66.713 E.01592
G1 X47.749 Y83.214 E.69578
G1 X47.749 Y82.68 E.01592
G1 X64.251 Y66.179 E.69578
G1 X64.251 Y65.645 E.01592
G1 X47.749 Y82.146 E.69578
G1 X47.749 Y81.612 E.01592
G1 X64.251 Y65.111 E.69578
G1 X64.251 Y64.578 E.01592
G1 X47.749 Y81.079 E.69578
G1 X47.749 Y80.545 E.01592
G1 X64.251 Y64.044 E.69578
G1 X64.251 Y63.51 E.01592
G1 X47.749 Y80.011 E.69578
G1 X47.749 Y79.477 E.01592
G1 X64.251 Y62.976 E.69578
G1 X64.251 Y62.442 E.01592
G1 X47.749 Y78.943 E.69578
G1 X47.749 Y78.41 E.01592
G1 X64.251 Y61.909 E.69578
G1 X64.251 Y61.375 E.01592
G1 X47.749 Y77.876 E.69578
G1 X47.749 Y77.342 E.01592
G1 X64.251 Y60.841 E.69578
G1 X64.251 Y60.307 E.01592
G1 X47.749 Y76.808 E.69578
G1 X47.749 Y76.275 E.01592
G1 X64.251 Y59.773 E.69578
G1 X64.251 Y59.251 E.01559
G1 X64.773 Y59.251 E.01559
G1 X81.275 Y42.749 E.69578
G1 X81.808 Y42.749 E.01592
G1 X65.307 Y59.251 E.69578
G1 X65.841 Y59.251 E.01592
G1 X82.342 Y42.749 E.69578
G1 X82.876 Y42.749 E.01592
G1 X66.375 Y59.251 E.69578
G1 X66.909 Y59.251 E.01592
G1 X83.41 Y42.749 E.69578
G1 X83.944 Y42.749 E.01592
G1 X67.442 Y59.251 E.69578
G1 X67.976 Y59.251 E.01592
G1 X84.477 Y42.749 E.69578
G1 X85.011 Y42.749 E.01592
G1 X68.51 Y59.251 E.69578
G1 X69.044 Y59.251 E.01592
G1 X85.545 Y42.749 E.69578
G1 X86.079 Y42.749 E.01592
G1 X69.578 Y59.251 E.69578
G1 X70.111 Y59.251 E.01592
G1 X86.612 Y42.749 E.69578
G1 X87.146 Y42.749 E.01592
G1 X70.645 Y59.251 E.69578
G1 X71.179 Y59.251 E.01592
G1 X87.68 Y42.749 E.69578
G1 X88.214 Y42.749 E.01592
G1 X71.713 Y59.251 E.69578
G1 X72.247 Y59.251 E.01592
G1 X88.748 Y42.749 E.69578
G1 X89.281 Y42.749 E.01592
G1 X72.78 Y59.251 E.69578
G1 X73.314 Y59.251 E.01592
G1 X89.815 Y42.749 E.69578
G1 X90.349 Y42.749 E.01592
G1 X73.848 Y59.251 E.69578
G1 X74.382 Y59.251 E.01592
G1 X90.883 Y42.749 E.69578
G1 X91.417 Y42.749 E.01592
G1 X74.916 Y59.251 E.69578
G1 X75.449 Y59.251 E.01592
G1 X91.95 Y42.749 E.69578
G1 X92.484 Y42.749 E.01592
G1 X75.983 Y59.251 E.69578
G1 X76.517 Y59.251 E.01592
G1 X93.018 Y42.749 E.69578
G1 X93.552 Y42.749 E.01592
G1 X77.051 Y59.251 E.69578
G1 X77.585 Y59.251 E.01592
G1 X94.086 Y42.749 E.69578
G1 X94.619 Y42.749 E.01592
G1 X78.118 Y59.251 E.69578
G1 X78.652 Y59.251 E.01592
G1 X95.153 Y42.749 E.69578
G1 X95.687 Y42.749 E.01592
G1 X79.186 Y59.251 E.69578
G1 X79.72 Y59.251 E.01592
G1 X96.221 Y42.749 E.69578
G1 X96.755 Y42.749 E.01592
G1 X80.254 Y59.251 E.69578
G1 X80.787 Y59.251 E.01592
G1 X97.288 Y42.749 E.69578
G1 X97.822 Y42.749 E.01592
G1 X81.321 Y59.251 E.69578
G1 X81.855 Y59.251 E.01592
G1 X98.356 Y42.749 E.69578
G1 X98.89 Y42.749 E.01592
G1 X82.389 Y59.251 E.69578
G1 X82.922 Y59.251 E.01592
G1 X99.424 Y42.749 E.69578
G1 X99.957 Y42.749 E.01592
G1 X83.456 Y59.251 E.69578
G1 X83.99 Y59.251 E.01592
G1 X100.491 Y42.749 E.69578
G1 X101.025 Y42.749 E.01592
G1 X84.524 Y59.251 E.69578
G1 X85.058 Y59.251 E.01592
G1 X101.559 Y42.749 E.69578
G1 X102.093 Y42.749 E.01592
G1 X85.591 Y59.251 E.69578
G1 X86.125 Y59.251 E.01592
G1 X102.626 Y42.749 E.69578
G1 X103.16 Y42.749 E.01592
G1 X86.659 Y59.251 E.69578
G1 X87.193 Y59.251 E.01592
G1 X103.694 Y42.749 E.69578
G1 X104.228 Y42.749 E.01592
G1 X87.727 Y59.251 E.69578
G1 X88.26 Y59.251 E.01592
G1 X104.762 Y42.749 E.69578
G1 X105.295 Y42.749 E.01592
G1 X88.794 Y59.251 E.69578
G1 X89.328 Y59.251 E.01592
G1 X105.829 Y42.749 E.69578
G1 X106.363 Y42.749 E.01592
G1 X89.862 Y59.251 E.69578
G1 X90.396 Y59.251 E.01592
G1 X106.897 Y42.749 E.69578
G1 X107.43 Y42.749 E.01592
G1 X90.929 Y59.251 E.69578
G1 X91.463 Y59.251 E.01592
G1 X107.964 Y42.749 E.69578
G1 X108.498 Y42.749 E.01592
G1 X91.997 Y59.251 E.69578
G1 X92.531 Y59.251 E.01592
G1 X109.032 Y42.749 E.69578
G1 X109.566 Y42.749 E.01592
G1 X93.065 Y59.251 E.69578
G1 X93.598 Y59.251 E.01592
G1 X110.099 Y42.749 E.69578
G1 X110.633 Y42.749 E.01592
G1 X94.132 Y59.251 E.69578
G1 X94.666 Y59.251 E.01592
G1 X111.167 Y42.749 E.69578
G1 X111.701 Y42.749 E.01592
G1 X95.2 Y59.251 E.69578
G1 X95.734 Y59.251 E.01592
G1 X112.235 Y42.749 E.69578
G1 X112.768 Y42.749 E.01592
G1 X96.267 Y59.251 E.69578
G1 X96.801 Y59.251 E.01592
G1 X113.302 Y42.749 E.69578
G1 X113.836 Y42.749 E.01592
G1 X97.335 Y59.251 E.69578
G1 X97.869 Y59.251 E.01592
G1 X114.37 Y42.749 E.69578
G1 X114.904 Y42.749 E.01592
G1 X98.403 Y59.251 E.69578
G1 X98.936 Y59.251 E.01592
G1 X115.437 Y42.749 E.69578
G1 X115.971 Y42.749 E.01592
G1 X99.47 Y59.251 E.69578
G1 X100.004 Y59.251 E.01592
G1 X116.505 Y42.749 E.69578
G1 X117.039 Y42.749 E.01592
G1 X100.538 Y59.251 E.69578
G1 X101.072 Y59.251 E.01592
G1 X117.573 Y42.749 E.69578
G1 X118.106 Y42.749 E.01592
G1 X101.605 Y59.251 E.69578
G1 X102.139 Y59.251 E.01592
G1 X118.64 Y42.749 E.69578
G1 X119.174 Y42.749 E.01592
G1 X102.673 Y59.251 E.69578
G1 X103.207 Y59.251 E.01592
G1 X119.708 Y42.749 E.69578
G1 X120.242 Y42.749 E.01592
G1 X103.74 Y59.251 E.69578
G1 X104.274 Y59.251 E.01592
G1 X120.775 Y42.749 E.69578
G1 X121.309 Y42.749 E.01592
G1 X104.808 Y59.251 E.69578
G1 X105.342 Y59.251 E.01592
G1 X121.843 Y42.749 E.69578
G1 X122.377 Y42.749 E.01592
G1 X105.876 Y59.251 E.69578
G1 X106.409 Y59.251 E.01592
G1 X122.911 Y42.749 E.69578
G1 X123.444 Y42.749 E.01592
G1 X106.943 Y59.251 E.69578
G1 X107.477 Y59.251 E.01592
G1 X123.978 Y42.749 E.69578
G1 X124.512 Y42.749 E.01592
G1 X108.011 Y59.251 E.69578
G1 X108.545 Y59.251 E.01592
G1 X125.046 Y42.749 E.69578
G1 X125.58 Y42.749 E.01592
G1 X109.078 Y59.251 E.69578
G1 X109.612 Y59.251 E.01592
G1 X126.113 Y42.749 E.69578
G1 X126.647 Y42.749 E.01592
G1 X110.146 Y59.251 E.69578
G1 X110.68 Y59.251 E.01592
G1 X127.181 Y42.749 E.69578
G1 X127.715 Y42.749 E.01592
G1 X111.214 Y59.251 E.69578
G1 X111.747 Y59.251 E.01592
G1 X128.249 Y42.749 E.69578
G1 X128.782 Y42.749 E.01592
G1 X112.281 Y59.251 E.69578
G1 X112.815 Y59.251 E.01592
G1 X129.316 Y42.749 E.69578
G1 X129.85 Y42.749 E.01592
G1 X113.349 Y59.251 E.69578
G1 X113.883 Y59.251 E.01592
G1 X130.384 Y42.749 E.69578
G1 X130.917 Y42.749 E.01592
G1 X114.416 Y59.251 E.69578
G1 X114.95 Y59.251 E.01592
G1 X131.451 Y42.749 E.69578
G1 X131.985 Y42.749 E.01592
G1 X127.192 Y47.542 E.2021
G3 X127.811 Y47.457 I.935 J4.495 E.01865
G1 X132.519 Y42.749 E.1985
G1 X133.053 Y42.749 E.01592
G1 X128.335 Y47.467 E.19892
G3 X128.793 Y47.543 I-.149 J2.329 E.01387
G1 X133.586 Y42.749 E.20211
G1 X134.12 Y42.749 E.01592
G1 X129.206 Y47.663 E.20719
G3 X129.581 Y47.822 I-.604 J1.95 E.01216
G1 X134.654 Y42.749 E.21389
G1 X135.188 Y42.749 E.01592
G1 X129.923 Y48.014 E.222
G3 X130.232 Y48.239 I-7.769 J11.018 E.01139
G1 X135.722 Y42.749 E.23147
G1 X136.255 Y42.749 E.01592
G1 X130.512 Y48.492 E.24216
G3 X130.764 Y48.774 I-1.289 J1.404 E.01129
G1 X136.789 Y42.749 E.25405
G1 X137.323 Y42.749 E.01592
G1 X130.987 Y49.085 E.26716
G3 X131.18 Y49.427 I-1.609 J1.132 E.0117
G1 X137.857 Y42.749 E.28155
G1 X138.391 Y42.749 E.01592
G1 X131.339 Y49.801 E.29735
G3 X131.46 Y50.214 I-2.001 J.814 E.01284
G1 X138.924 Y42.749 E.31473
G1 X139.458 Y42.749 E.01592
G1 X131.535 Y50.672 E.33408
M73 P79 R14
G3 X131.542 Y51.2 I-2.626 J.296 E.01575
G1 X139.992 Y42.749 E.35632
G1 X140.526 Y42.749 E.01592
G1 X131.205 Y52.071 E.39303
; WIPE_START
G1 X132.619 Y50.656 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.018 Y49.964 Z3.2 F30000
G1 X124.791 Y49.943 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F9537.687
G1 X115.484 Y59.251 E.39246
G1 X116.018 Y59.251 E.01592
G1 X124.454 Y50.815 E.3557
G2 X124.468 Y51.334 I5.059 J.115 E.01549
G1 X116.552 Y59.251 E.33382
G1 X117.085 Y59.251 E.01592
G1 X124.542 Y51.794 E.3144
G2 X124.661 Y52.209 I2.132 J-.389 E.01288
G1 X117.619 Y59.251 E.29692
G1 X118.153 Y59.251 E.01592
G1 X124.822 Y52.581 E.28121
G2 X125.016 Y52.921 I1.794 J-.802 E.01168
G1 X118.687 Y59.251 E.2669
G1 X119.221 Y59.251 E.01592
G1 X125.241 Y53.23 E.25385
G2 X125.494 Y53.511 I1.53 J-1.125 E.01129
G1 X119.754 Y59.251 E.24202
G1 X120.288 Y59.251 E.01592
G1 X125.776 Y53.763 E.23138
G2 X126.086 Y53.987 I1.271 J-1.439 E.01142
G1 X120.822 Y59.251 E.22196
G1 X121.356 Y59.251 E.01592
G1 X126.427 Y54.18 E.21382
G2 X126.8 Y54.34 I.988 J-1.789 E.01214
G1 X121.89 Y59.251 E.20707
G1 X122.423 Y59.251 E.01592
G1 X127.211 Y54.463 E.20188
G2 X127.675 Y54.533 I.582 J-2.288 E.01401
G1 X122.957 Y59.251 E.19893
G1 X123.491 Y59.251 E.01592
G1 X128.198 Y54.543 E.19848
G2 X128.825 Y54.45 I-.253 J-3.858 E.01892
G1 X124.025 Y59.251 E.20241
G1 X124.558 Y59.251 E.01592
G1 X141.06 Y42.749 E.69578
G1 X141.593 Y42.749 E.01592
G1 X125.092 Y59.251 E.69578
G1 X125.626 Y59.251 E.01592
G1 X142.127 Y42.749 E.69578
G1 X142.661 Y42.749 E.01592
G1 X126.16 Y59.251 E.69578
G1 X126.694 Y59.251 E.01592
G1 X143.195 Y42.749 E.69578
G1 X143.729 Y42.749 E.01592
G1 X127.227 Y59.251 E.69578
G1 X127.761 Y59.251 E.01592
G1 X144.262 Y42.749 E.69578
G1 X144.796 Y42.749 E.01592
G1 X128.295 Y59.251 E.69578
G1 X128.829 Y59.251 E.01592
G1 X145.33 Y42.749 E.69578
G1 X145.864 Y42.749 E.01592
G1 X129.363 Y59.251 E.69578
G1 X129.896 Y59.251 E.01592
G1 X146.398 Y42.749 E.69578
G1 X146.931 Y42.749 E.01592
G1 X130.43 Y59.251 E.69578
G1 X130.964 Y59.251 E.01592
G1 X147.465 Y42.749 E.69578
G1 X147.999 Y42.749 E.01592
G1 X131.498 Y59.251 E.69578
G1 X132.032 Y59.251 E.01592
G1 X148.533 Y42.749 E.69578
G1 X149.067 Y42.749 E.01592
G1 X132.565 Y59.251 E.69578
G1 X133.099 Y59.251 E.01592
G1 X149.6 Y42.749 E.69578
G1 X150.134 Y42.749 E.01592
G1 X133.633 Y59.251 E.69578
G1 X134.167 Y59.251 E.01592
G1 X150.668 Y42.749 E.69578
G1 X151.202 Y42.749 E.01592
G1 X134.701 Y59.251 E.69578
G1 X135.234 Y59.251 E.01592
G1 X151.735 Y42.749 E.69578
G1 X152.269 Y42.749 E.01592
G1 X135.768 Y59.251 E.69578
G1 X136.302 Y59.251 E.01592
G1 X152.803 Y42.749 E.69578
G1 X153.337 Y42.749 E.01592
G1 X136.836 Y59.251 E.69578
G1 X137.37 Y59.251 E.01592
G1 X153.871 Y42.749 E.69578
G1 X154.404 Y42.749 E.01592
G1 X137.903 Y59.251 E.69578
G1 X138.437 Y59.251 E.01592
G1 X154.938 Y42.749 E.69578
G1 X155.472 Y42.749 E.01592
G1 X138.971 Y59.251 E.69578
G1 X139.505 Y59.251 E.01592
G1 X156.006 Y42.749 E.69578
G1 X156.54 Y42.749 E.01592
G1 X140.039 Y59.251 E.69578
G1 X140.572 Y59.251 E.01592
G1 X157.073 Y42.749 E.69578
G1 X157.607 Y42.749 E.01592
G1 X141.106 Y59.251 E.69578
G1 X141.64 Y59.251 E.01592
G1 X158.141 Y42.749 E.69578
G1 X158.675 Y42.749 E.01592
G1 X142.174 Y59.251 E.69578
G1 X142.708 Y59.251 E.01592
G1 X159.209 Y42.749 E.69578
G1 X159.742 Y42.749 E.01592
G1 X143.241 Y59.251 E.69578
G1 X143.775 Y59.251 E.01592
G1 X160.276 Y42.749 E.69578
G1 X160.81 Y42.749 E.01592
G1 X144.309 Y59.251 E.69578
G1 X144.843 Y59.251 E.01592
G1 X161.344 Y42.749 E.69578
G1 X161.878 Y42.749 E.01592
G1 X145.377 Y59.251 E.69578
G1 X145.91 Y59.251 E.01592
G1 X162.411 Y42.749 E.69578
G1 X162.945 Y42.749 E.01592
G1 X146.444 Y59.251 E.69578
G1 X146.978 Y59.251 E.01592
G1 X163.479 Y42.749 E.69578
G1 X164.013 Y42.749 E.01592
G1 X147.512 Y59.251 E.69578
G1 X148.045 Y59.251 E.01592
G1 X164.547 Y42.749 E.69578
G1 X165.08 Y42.749 E.01592
G1 X148.579 Y59.251 E.69578
G1 X149.113 Y59.251 E.01592
G1 X165.614 Y42.749 E.69578
G1 X166.148 Y42.749 E.01592
G1 X149.647 Y59.251 E.69578
G1 X150.181 Y59.251 E.01592
G1 X166.682 Y42.749 E.69578
G1 X167.216 Y42.749 E.01592
G1 X150.714 Y59.251 E.69578
G1 X151.248 Y59.251 E.01592
G1 X167.749 Y42.749 E.69578
G1 X168.283 Y42.749 E.01592
G1 X151.782 Y59.251 E.69578
G1 X152.316 Y59.251 E.01592
G1 X168.817 Y42.749 E.69578
G1 X169.351 Y42.749 E.01592
G1 X152.85 Y59.251 E.69578
G1 X153.383 Y59.251 E.01592
G1 X169.885 Y42.749 E.69578
G1 X170.418 Y42.749 E.01592
G1 X153.917 Y59.251 E.69578
G1 X154.451 Y59.251 E.01592
G1 X170.952 Y42.749 E.69578
G1 X171.486 Y42.749 E.01592
G1 X154.985 Y59.251 E.69578
G1 X155.519 Y59.251 E.01592
G1 X172.02 Y42.749 E.69578
G1 X172.553 Y42.749 E.01592
G1 X156.052 Y59.251 E.69578
G1 X156.586 Y59.251 E.01592
G1 X173.087 Y42.749 E.69578
G1 X173.621 Y42.749 E.01592
G1 X157.12 Y59.251 E.69578
G1 X157.654 Y59.251 E.01592
G1 X174.155 Y42.749 E.69578
G1 X174.689 Y42.749 E.01592
G1 X158.188 Y59.251 E.69578
G1 X158.721 Y59.251 E.01592
G1 X175.222 Y42.749 E.69578
G1 X175.756 Y42.749 E.01592
G1 X159.255 Y59.251 E.69578
G1 X159.789 Y59.251 E.01592
G1 X176.29 Y42.749 E.69578
G1 X176.824 Y42.749 E.01592
G1 X160.323 Y59.251 E.69578
G1 X160.857 Y59.251 E.01592
G1 X177.358 Y42.749 E.69578
G1 X177.891 Y42.749 E.01592
G1 X161.39 Y59.251 E.69578
G1 X161.924 Y59.251 E.01592
G1 X178.425 Y42.749 E.69578
G1 X178.959 Y42.749 E.01592
G1 X162.458 Y59.251 E.69578
G1 X162.992 Y59.251 E.01592
G1 X179.493 Y42.749 E.69578
G1 X180.027 Y42.749 E.01592
G1 X163.526 Y59.251 E.69578
G1 X164.059 Y59.251 E.01592
G1 X180.56 Y42.749 E.69578
G1 X181.094 Y42.749 E.01592
G1 X164.593 Y59.251 E.69578
G1 X165.127 Y59.251 E.01592
G1 X181.628 Y42.749 E.69578
G1 X182.162 Y42.749 E.01592
G1 X165.661 Y59.251 E.69578
G1 X166.195 Y59.251 E.01592
G1 X182.696 Y42.749 E.69578
G1 X183.229 Y42.749 E.01592
G1 X166.728 Y59.251 E.69578
G1 X167.262 Y59.251 E.01592
G1 X183.763 Y42.749 E.69578
G1 X184.297 Y42.749 E.01592
G1 X167.796 Y59.251 E.69578
G1 X168.33 Y59.251 E.01592
G1 X184.831 Y42.749 E.69578
G1 X185.365 Y42.749 E.01592
G1 X168.863 Y59.251 E.69578
G1 X169.397 Y59.251 E.01592
G1 X185.898 Y42.749 E.69578
G1 X186.432 Y42.749 E.01592
G1 X169.931 Y59.251 E.69578
G1 X170.465 Y59.251 E.01592
G1 X186.966 Y42.749 E.69578
G1 X187.5 Y42.749 E.01592
G1 X170.999 Y59.251 E.69578
G1 X171.532 Y59.251 E.01592
G1 X188.034 Y42.749 E.69578
G1 X188.567 Y42.749 E.01592
G1 X172.066 Y59.251 E.69578
G1 X172.6 Y59.251 E.01592
G1 X189.101 Y42.749 E.69578
G1 X189.635 Y42.749 E.01592
G1 X173.134 Y59.251 E.69578
G1 X173.668 Y59.251 E.01592
G1 X190.169 Y42.749 E.69578
G1 X190.703 Y42.749 E.01592
G1 X174.201 Y59.251 E.69578
G1 X174.735 Y59.251 E.01592
G1 X191.236 Y42.749 E.69578
G1 X191.77 Y42.749 E.01592
G1 X175.269 Y59.251 E.69578
G1 X175.803 Y59.251 E.01592
G1 X192.304 Y42.749 E.69578
G1 X192.838 Y42.749 E.01592
G1 X176.337 Y59.251 E.69578
G1 X176.87 Y59.251 E.01592
G1 X193.371 Y42.749 E.69578
G1 X193.905 Y42.749 E.01592
G1 X177.404 Y59.251 E.69578
G1 X177.938 Y59.251 E.01592
G1 X194.439 Y42.749 E.69578
G1 X194.973 Y42.749 E.01592
G1 X178.472 Y59.251 E.69578
G1 X179.006 Y59.251 E.01592
G1 X195.507 Y42.749 E.69578
G1 X196.04 Y42.749 E.01592
G1 X179.539 Y59.251 E.69578
G1 X180.073 Y59.251 E.01592
G1 X196.574 Y42.749 E.69578
G1 X197.108 Y42.749 E.01592
G1 X180.607 Y59.251 E.69578
G1 X181.141 Y59.251 E.01592
G1 X197.642 Y42.749 E.69578
G1 X198.176 Y42.749 E.01592
G1 X181.675 Y59.251 E.69578
G1 X182.208 Y59.251 E.01592
G1 X198.709 Y42.749 E.69578
G1 X199.243 Y42.749 E.01592
G1 X182.742 Y59.251 E.69578
G1 X183.276 Y59.251 E.01592
G1 X199.777 Y42.749 E.69578
G1 X200.311 Y42.749 E.01592
G1 X183.81 Y59.251 E.69578
G1 X184.344 Y59.251 E.01592
G1 X200.845 Y42.749 E.69578
G1 X201.378 Y42.749 E.01592
G1 X184.877 Y59.251 E.69578
G1 X185.411 Y59.251 E.01592
G1 X201.912 Y42.749 E.69578
G1 X202.446 Y42.749 E.01592
G1 X185.775 Y59.42 E.70294
G1 X47.58 Y54.025 F30000
G1 F9537.687
G1 X58.855 Y42.749 E.47544
G1 X58.321 Y42.749 E.01592
G1 X47.749 Y53.321 E.44577
G1 X47.749 Y52.788 E.01592
G1 X57.788 Y42.749 E.42327
G1 X57.254 Y42.749 E.01592
G1 X47.749 Y52.254 E.40076
G1 X47.749 Y51.72 E.01592
G1 X56.72 Y42.749 E.37825
G1 X56.186 Y42.749 E.01592
G1 X47.749 Y51.186 E.35574
G1 X47.749 Y50.652 E.01592
G1 X55.652 Y42.749 E.33323
G1 X55.119 Y42.749 E.01592
G1 X47.749 Y50.119 E.31073
G1 X47.749 Y49.585 E.01592
G1 X54.585 Y42.749 E.28822
G1 X54.051 Y42.749 E.01592
G1 X47.749 Y49.051 E.26571
G1 X47.749 Y48.517 E.01592
G1 X53.517 Y42.749 E.2432
G1 X52.983 Y42.749 E.01592
G1 X47.749 Y47.983 E.22069
G1 X47.749 Y47.45 E.01592
G1 X52.45 Y42.749 E.19819
G1 X51.916 Y42.749 E.01592
G1 X47.749 Y46.916 E.17568
G1 X47.749 Y46.382 E.01592
G1 X51.382 Y42.749 E.15317
G1 X50.848 Y42.749 E.01592
G1 X47.749 Y45.848 E.13066
G1 X47.749 Y45.314 E.01592
G1 X50.314 Y42.749 E.10815
G1 X49.781 Y42.749 E.01592
G1 X47.749 Y44.781 E.08565
G1 X47.749 Y44.247 E.01592
G1 X49.247 Y42.749 E.06314
G1 X48.713 Y42.749 E.01592
G1 X47.749 Y43.713 E.04063
G1 X47.749 Y43.179 E.01592
G1 X48.349 Y42.58 E.02528
G1 X69.167 Y42.58 F30000
G1 F9537.687
G1 X59.185 Y52.562 E.42089
G2 X59.472 Y51.741 I-3.347 J-1.63 E.02597
G1 X68.463 Y42.749 E.37914
G1 X67.93 Y42.749 E.01592
G1 X59.545 Y51.134 E.35355
G2 X59.529 Y50.616 I-4.481 J-.125 E.01547
G1 X67.396 Y42.749 E.3317
G1 X66.862 Y42.749 E.01592
G1 X59.448 Y50.164 E.31264
G2 X59.322 Y49.756 I-2.106 J.424 E.01276
G1 X66.328 Y42.749 E.29543
G1 X65.794 Y42.749 E.01592
G1 X59.159 Y49.385 E.27978
G2 X58.963 Y49.047 I-1.788 J.81 E.01167
G1 X65.261 Y42.749 E.26553
G1 X64.727 Y42.749 E.01592
G1 X58.737 Y48.739 E.25255
G2 X58.482 Y48.46 I-1.521 J1.135 E.01128
G1 X64.193 Y42.749 E.2408
G1 X63.659 Y42.749 E.01592
G1 X58.198 Y48.211 E.2303
G2 X57.884 Y47.991 I-1.254 J1.459 E.01145
M73 P79 R13
G1 X63.126 Y42.749 E.22103
G1 X62.592 Y42.749 E.01592
G1 X57.539 Y47.803 E.21307
G2 X57.16 Y47.648 I-.964 J1.814 E.01222
G1 X62.058 Y42.749 E.20653
G1 X61.524 Y42.749 E.01592
G1 X56.743 Y47.531 E.20162
G2 X56.28 Y47.46 I-.586 J2.279 E.01398
G1 X60.99 Y42.749 E.19863
G1 X60.457 Y42.749 E.01592
G1 X55.744 Y47.462 E.19871
G2 X55.105 Y47.567 I.267 J3.628 E.01932
G1 X59.923 Y42.749 E.20313
G1 X59.389 Y42.749 E.01592
G1 X47.749 Y54.389 E.49079
G1 X47.749 Y54.923 E.01592
G1 X52.562 Y50.11 E.20294
G2 X52.461 Y50.745 I4.606 J1.064 E.01921
G1 X47.749 Y55.457 E.19865
G1 X47.749 Y55.99 E.01592
G1 X52.463 Y51.277 E.19874
G2 X52.531 Y51.742 I2.357 J-.108 E.01405
G1 X47.749 Y56.524 E.20162
G1 X47.749 Y57.058 E.01592
G1 X52.646 Y52.161 E.20647
G2 X52.8 Y52.541 I1.972 J-.579 E.01224
G1 X47.749 Y57.592 E.21297
G1 X47.749 Y58.125 E.01592
G1 X52.991 Y52.884 E.22102
G2 X53.212 Y53.196 I1.671 J-.949 E.01144
G1 X47.749 Y58.659 E.23035
G1 X47.749 Y59.193 E.01592
G1 X53.462 Y53.48 E.24089
G2 X53.741 Y53.735 I1.417 J-1.265 E.01128
G1 X47.749 Y59.727 E.25263
G1 X47.749 Y60.261 E.01592
G1 X54.048 Y53.962 E.26559
G2 X54.385 Y54.158 I1.151 J-1.588 E.01166
G1 X47.749 Y60.794 E.27981
G1 X47.749 Y61.328 E.01592
G1 X54.756 Y54.322 E.29542
G2 X55.162 Y54.449 I.837 J-1.966 E.01273
G1 X47.749 Y61.862 E.31257
G1 X47.749 Y62.396 E.01592
G1 X55.617 Y54.528 E.33174
G2 X56.134 Y54.545 I.341 J-2.571 E.01546
G1 X47.749 Y62.93 E.35355
G1 X47.749 Y63.463 E.01592
G1 X56.744 Y54.469 E.37928
G2 X57.558 Y54.189 I-.782 J-3.595 E.02572
G1 X47.749 Y63.997 E.41359
G1 X47.749 Y64.531 E.01592
G1 X69.531 Y42.749 E.91844
G1 X70.065 Y42.749 E.01592
G1 X47.749 Y65.065 E.94095
G1 X47.749 Y65.599 E.01592
G1 X70.599 Y42.749 E.96346
G1 X71.132 Y42.749 E.01592
G1 X47.749 Y66.132 E.98596
G1 X47.749 Y66.666 E.01592
G1 X71.666 Y42.749 E1.00847
G1 X72.2 Y42.749 E.01592
G1 X47.749 Y67.2 E1.03098
G1 X47.749 Y67.734 E.01592
G1 X72.734 Y42.749 E1.05349
G1 X73.268 Y42.749 E.01592
G1 X47.749 Y68.268 E1.076
G1 X47.749 Y68.801 E.01592
G1 X73.801 Y42.749 E1.0985
G1 X74.335 Y42.749 E.01592
G1 X47.749 Y69.335 E1.12101
G1 X47.749 Y69.869 E.01592
G1 X74.869 Y42.749 E1.14352
G1 X75.403 Y42.749 E.01592
G1 X47.749 Y70.403 E1.16603
G1 X47.749 Y70.937 E.01592
G1 X75.937 Y42.749 E1.18854
G1 X76.47 Y42.749 E.01592
G1 X47.749 Y71.47 E1.21105
G1 X47.749 Y72.004 E.01592
G1 X77.004 Y42.749 E1.23355
G1 X77.538 Y42.749 E.01592
G1 X47.749 Y72.538 E1.25606
G1 X47.749 Y73.072 E.01592
G1 X78.072 Y42.749 E1.27857
G1 X78.606 Y42.749 E.01592
G1 X47.749 Y73.606 E1.30108
G1 X47.749 Y74.139 E.01592
G1 X79.139 Y42.749 E1.32358
G1 X79.673 Y42.749 E.01592
G1 X47.749 Y74.673 E1.34609
G1 X47.749 Y75.207 E.01592
G1 X80.207 Y42.749 E1.3686
G1 X80.741 Y42.749 E.01592
G1 X47.58 Y75.91 E1.39826
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9537.687
G1 X48.994 Y74.496 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/58
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
G1 X199.937 Y123.991
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X199.944 Y123.991 E.00018
G3 X199.75 Y124.005 I.053 J2.004 E.3695
G1 X199.878 Y123.996 E.00381
; WIPE_START
M204 S10000
G1 X199.944 Y123.991 E-.02515
G1 X200.15 Y123.995 E-.07842
G1 X200.544 Y124.065 E-.15222
G1 X200.917 Y124.211 E-.15213
G1 X201.253 Y124.428 E-.15215
G1 X201.54 Y124.708 E-.15207
G1 X201.611 Y124.812 E-.04785
; WIPE_END
G1 E-.04 F1800
G1 X201.442 Y117.181 Z3.4 F30000
G1 X199.937 Y48.991 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X199.944 Y48.991 E.00019
G3 X199.75 Y49.005 I.053 J2.004 E.3695
G1 X199.877 Y48.996 E.0038
; WIPE_START
M204 S10000
G1 X199.944 Y48.991 E-.0252
G1 X200.15 Y48.995 E-.07842
G1 X200.544 Y49.065 E-.15225
G1 X200.917 Y49.211 E-.15211
G1 X201.253 Y49.428 E-.15215
G1 X201.54 Y49.708 E-.15212
G1 X201.611 Y49.812 E-.04776
; WIPE_END
G1 E-.04 F1800
G1 X193.992 Y49.359 Z3.4 F30000
G1 X127.937 Y45.434 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X117.566 Y45.434 E.33348
G1 X117.566 Y44.566 E.0279
G1 X138.434 Y44.566 E.67102
G1 X138.434 Y45.434 E.0279
G1 X127.997 Y45.434 E.33561
; WIPE_START
G1 X125.997 Y45.434 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.938 Y48.991 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X127.944 Y48.991 E.00018
G3 X127.75 Y49.005 I.053 J2.004 E.3695
G1 X127.878 Y48.996 E.00382
; WIPE_START
M204 S10000
G1 X127.944 Y48.991 E-.02503
G1 X128.15 Y48.995 E-.07842
G1 X128.544 Y49.065 E-.15224
G1 X128.917 Y49.211 E-.15213
G1 X129.253 Y49.428 E-.15211
G1 X129.54 Y49.708 E-.15216
G1 X129.611 Y49.812 E-.04792
; WIPE_END
G1 E-.04 F1800
G1 X132.618 Y56.827 Z3.4 F30000
G1 X190.21 Y191.21 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X65.79 Y191.21 E3.70605
G1 X65.79 Y60.79 E3.88477
G1 X190.21 Y60.79 E3.70605
G1 X190.21 Y191.15 E3.88298
; WIPE_START
M204 S10000
G1 X188.21 Y191.151 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X183.011 Y185.563 Z3.4 F30000
G1 X55.937 Y48.991 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X55.944 Y48.991 E.00018
G3 X55.75 Y49.005 I.053 J2.004 E.3695
G1 X55.878 Y48.996 E.00381
; WIPE_START
M204 S10000
G1 X55.944 Y48.991 E-.02514
G1 X56.15 Y48.995 E-.07842
G1 X56.544 Y49.065 E-.15223
G1 X56.917 Y49.211 E-.15213
G1 X57.253 Y49.428 E-.15215
G1 X57.54 Y49.708 E-.15212
G1 X57.611 Y49.812 E-.04782
; WIPE_END
G1 E-.04 F1800
G1 X57.599 Y57.444 Z3.4 F30000
G1 X57.49 Y127.341 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X57.247 Y127.563 E.00982
G3 X55.75 Y124.005 I-1.25 J-1.568 E.22049
G1 X55.944 Y123.991 E.00578
G3 X57.532 Y127.285 I.053 J2.004 E.13713
G1 X57.526 Y127.293 E.00028
; WIPE_START
M204 S10000
G1 X57.247 Y127.563 E-.14769
G1 X56.917 Y127.789 E-.15182
G1 X56.544 Y127.935 E-.15212
G1 X56.15 Y128.005 E-.15209
G1 X55.75 Y127.995 E-.15209
G1 X55.739 Y127.992 E-.00419
; WIPE_END
G1 E-.04 F1800
G1 X55.76 Y135.625 Z3.4 F30000
G1 X55.931 Y198.992 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X55.944 Y198.991 E.00038
G3 X55.75 Y199.005 I.053 J2.004 E.3695
G1 X55.871 Y198.996 E.00361
; WIPE_START
M204 S10000
G1 X55.944 Y198.991 E-.02771
G1 X56.15 Y198.995 E-.07842
G1 X56.544 Y199.065 E-.15223
G1 X56.917 Y199.211 E-.15215
G1 X57.253 Y199.428 E-.15212
G1 X57.54 Y199.708 E-.15207
G1 X57.607 Y199.806 E-.04529
; WIPE_END
M73 P80 R13
G1 E-.04 F1800
G1 X65.239 Y199.718 Z3.4 F30000
G1 X127.931 Y198.992 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X127.944 Y198.991 E.00038
G3 X127.75 Y199.005 I.053 J2.004 E.3695
G1 X127.871 Y198.996 E.00361
; WIPE_START
M204 S10000
G1 X127.944 Y198.991 E-.0277
G1 X128.15 Y198.995 E-.07842
G1 X128.544 Y199.065 E-.15224
G1 X128.917 Y199.211 E-.15214
G1 X129.253 Y199.428 E-.15209
G1 X129.54 Y199.708 E-.15212
G1 X129.607 Y199.806 E-.0453
; WIPE_END
G1 E-.04 F1800
G1 X137.239 Y199.718 Z3.4 F30000
G1 X199.931 Y198.992 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X199.944 Y198.991 E.00037
G3 X199.75 Y199.005 I.053 J2.004 E.3695
G1 X199.871 Y198.996 E.00362
; WIPE_START
M204 S10000
G1 X199.944 Y198.991 E-.02753
G1 X200.15 Y198.995 E-.07842
G1 X200.544 Y199.065 E-.15224
G1 X200.917 Y199.211 E-.15213
G1 X201.253 Y199.428 E-.15215
G1 X201.54 Y199.708 E-.15205
G1 X201.607 Y199.807 E-.04547
; WIPE_END
G1 E-.04 F1800
G1 X206.167 Y205.927 Z3.4 F30000
G1 X209.79 Y210.79 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X46.21 Y210.79 E4.87249
G1 X46.21 Y41.21 E5.05121
G1 X209.79 Y41.21 E4.87249
G1 X209.79 Y210.73 E5.04942
; WIPE_START
M204 S10000
G1 X207.79 Y210.731 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X207.844 Y203.098 Z3.4 F30000
G1 X208.994 Y41.417 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Top surface
G1 F9547.055
M204 S2000
G1 X209.583 Y42.006 E.02481
G1 X209.583 Y42.539
G1 X208.461 Y41.417 E.04727
G1 X207.927 Y41.417
G1 X209.583 Y43.073 E.06973
G1 X209.583 Y43.606
G1 X207.394 Y41.417 E.09219
G1 X206.861 Y41.417
G1 X209.583 Y44.139 E.11466
G1 X209.583 Y44.673
G1 X206.327 Y41.417 E.13712
G1 X205.794 Y41.417
G1 X209.583 Y45.206 E.15958
G1 X209.583 Y45.739
G1 X205.261 Y41.417 E.18205
G1 X204.728 Y41.417
G1 X209.583 Y46.272 E.20451
G1 X209.583 Y46.806
G1 X204.194 Y41.417 E.22697
G1 X203.661 Y41.417
G1 X209.583 Y47.339 E.24944
G1 X209.583 Y47.872
G1 X203.128 Y41.417 E.2719
G1 X202.595 Y41.417
G1 X209.583 Y48.405 E.29436
G1 X209.583 Y48.939
G1 X202.061 Y41.417 E.31683
G1 X201.528 Y41.417
G1 X209.583 Y49.472 E.33929
G1 X209.583 Y50.005
G1 X200.995 Y41.417 E.36175
G1 X200.462 Y41.417
G1 X209.583 Y50.538 E.38422
G1 X209.583 Y51.072
G1 X199.928 Y41.417 E.40668
G1 X199.395 Y41.417
G1 X209.583 Y51.605 E.42914
G1 X209.583 Y52.138
G1 X198.862 Y41.417 E.45161
G1 X198.329 Y41.417
G1 X209.583 Y52.671 E.47407
G1 X209.583 Y53.205
G1 X197.795 Y41.417 E.49653
G1 X197.262 Y41.417
G1 X209.583 Y53.738 E.519
G1 X209.583 Y54.271
G1 X196.729 Y41.417 E.54146
G1 X196.196 Y41.417
G1 X209.583 Y54.804 E.56392
G1 X209.583 Y55.338
G1 X195.662 Y41.417 E.58639
G1 X195.129 Y41.417
G1 X209.583 Y55.871 E.60885
G1 X209.583 Y56.404
G1 X194.596 Y41.417 E.63131
G1 X194.063 Y41.417
G1 X209.583 Y56.937 E.65378
G1 X209.583 Y57.471
G1 X201.739 Y49.627 E.33042
G1 X202.18 Y50.601
G1 X209.583 Y58.004 E.31183
G1 X209.583 Y58.537
G1 X202.21 Y51.164 E.31058
G1 X202.129 Y51.617
G1 X209.583 Y59.07 E.31399
G1 X209.583 Y59.604
G1 X201.978 Y51.999 E.32036
G1 X201.773 Y52.328
G1 X209.583 Y60.137 E.32897
G1 X209.583 Y60.67
G1 X201.523 Y52.61 E.33951
G1 X201.226 Y52.847
G1 X209.583 Y61.204 E.35202
G1 X209.583 Y61.737
G1 X200.879 Y53.033 E.36662
G1 X200.476 Y53.163
G1 X209.583 Y62.27 E.38361
G1 X209.583 Y62.803
G1 X199.995 Y53.216 E.40386
G1 X199.37 Y53.124
G1 X209.583 Y63.337 E.4302
; WIPE_START
M204 S10000
G1 X208.168 Y61.922 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X204.558 Y55.198 Z3.4 F30000
G1 X201.365 Y49.253 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X193.529 Y41.417 E.33009
G1 X192.996 Y41.417
G1 X200.397 Y48.819 E.31177
G1 X199.836 Y48.791
G1 X192.463 Y41.417 E.31061
G1 X191.93 Y41.417
G1 X199.384 Y48.872 E.31403
G1 X199.002 Y49.023
G1 X191.396 Y41.417 E.32037
G1 X190.863 Y41.417
G1 X198.672 Y49.226 E.32894
G1 X198.389 Y49.477
G1 X190.33 Y41.417 E.3395
G1 X189.797 Y41.417
G1 X198.154 Y49.775 E.35206
G1 X197.967 Y50.121
G1 X189.263 Y41.417 E.36663
G1 X188.73 Y41.417
G1 X197.836 Y50.524 E.3836
G1 X197.785 Y51.006
G1 X188.197 Y41.417 E.4039
G1 X187.663 Y41.417
G1 X197.876 Y51.63 E.43021
; WIPE_START
M204 S10000
G1 X196.462 Y50.216 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X190.909 Y44.98 Z3.4 F30000
G1 X187.13 Y41.417 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X209.583 Y63.87 E.9458
G1 X209.583 Y64.403
G1 X186.597 Y41.417 E.96826
G1 X186.064 Y41.417
G1 X209.583 Y64.936 E.99072
G1 X209.583 Y65.47
G1 X185.53 Y41.417 E1.01319
G1 X184.997 Y41.417
G1 X209.583 Y66.003 E1.03565
G1 X209.583 Y66.536
G1 X184.464 Y41.417 E1.05811
G1 X183.931 Y41.417
G1 X209.583 Y67.069 E1.08058
G1 X209.583 Y67.603
G1 X183.397 Y41.417 E1.10304
G1 X182.864 Y41.417
G1 X209.583 Y68.136 E1.1255
G1 X209.583 Y68.669
G1 X182.331 Y41.417 E1.14797
G1 X181.798 Y41.417
G1 X209.583 Y69.202 E1.17043
G1 X209.583 Y69.736
G1 X181.264 Y41.417 E1.19289
G1 X180.731 Y41.417
G1 X209.583 Y70.269 E1.21536
G1 X209.583 Y70.802
G1 X180.198 Y41.417 E1.23782
G1 X179.665 Y41.417
G1 X209.583 Y71.335 E1.26028
G1 X209.583 Y71.869
G1 X179.131 Y41.417 E1.28275
G1 X178.598 Y41.417
G1 X209.583 Y72.402 E1.30521
G1 X209.583 Y72.935
G1 X178.065 Y41.417 E1.32767
G1 X177.532 Y41.417
G1 X209.583 Y73.468 E1.35014
G1 X209.583 Y74.002
G1 X176.998 Y41.417 E1.3726
G1 X176.465 Y41.417
G1 X209.583 Y74.535 E1.39506
G1 X209.583 Y75.068
G1 X175.932 Y41.417 E1.41753
G1 X175.399 Y41.417
G1 X209.583 Y75.601 E1.43999
G1 X209.583 Y76.135
G1 X174.865 Y41.417 E1.46245
G1 X174.332 Y41.417
G1 X209.583 Y76.668 E1.48492
G1 X209.583 Y77.201
G1 X173.799 Y41.417 E1.50738
G1 X173.266 Y41.417
G1 X209.583 Y77.734 E1.52984
G1 X209.583 Y78.268
G1 X172.732 Y41.417 E1.55231
G1 X172.199 Y41.417
G1 X209.583 Y78.801 E1.57477
G1 X209.583 Y79.334
G1 X171.666 Y41.417 E1.59723
G1 X171.133 Y41.417
G1 X190.298 Y60.583 E.80733
G1 X189.764 Y60.583
G1 X170.599 Y41.417 E.80733
G1 X170.066 Y41.417
G1 X189.231 Y60.583 E.80733
G1 X188.698 Y60.583
G1 X169.533 Y41.417 E.80733
G1 X168.999 Y41.417
G1 X188.165 Y60.583 E.80733
G1 X187.631 Y60.583
G1 X168.466 Y41.417 E.80733
G1 X167.933 Y41.417
G1 X187.098 Y60.583 E.80733
G1 X186.565 Y60.583
G1 X167.4 Y41.417 E.80733
G1 X166.866 Y41.417
G1 X186.032 Y60.583 E.80733
G1 X185.498 Y60.583
G1 X166.333 Y41.417 E.80733
G1 X165.8 Y41.417
G1 X184.965 Y60.583 E.80733
G1 X184.432 Y60.583
G1 X165.267 Y41.417 E.80733
G1 X164.733 Y41.417
G1 X183.899 Y60.583 E.80733
G1 X183.365 Y60.583
G1 X164.2 Y41.417 E.80733
G1 X163.667 Y41.417
G1 X182.832 Y60.583 E.80733
G1 X182.299 Y60.583
G1 X163.134 Y41.417 E.80733
G1 X162.6 Y41.417
G1 X181.766 Y60.583 E.80733
G1 X181.232 Y60.583
G1 X162.067 Y41.417 E.80733
G1 X161.534 Y41.417
G1 X180.699 Y60.583 E.80733
G1 X180.166 Y60.583
G1 X161.001 Y41.417 E.80733
G1 X160.467 Y41.417
G1 X179.633 Y60.583 E.80733
G1 X179.099 Y60.583
G1 X159.934 Y41.417 E.80733
G1 X159.401 Y41.417
G1 X178.566 Y60.583 E.80733
G1 X178.033 Y60.583
G1 X158.868 Y41.417 E.80733
G1 X158.334 Y41.417
G1 X177.5 Y60.583 E.80733
G1 X176.966 Y60.583
G1 X157.801 Y41.417 E.80733
G1 X157.268 Y41.417
G1 X176.433 Y60.583 E.80733
G1 X175.9 Y60.583
G1 X156.735 Y41.417 E.80733
G1 X156.201 Y41.417
G1 X175.367 Y60.583 E.80733
G1 X174.833 Y60.583
G1 X155.668 Y41.417 E.80733
G1 X155.135 Y41.417
G1 X174.3 Y60.583 E.80733
G1 X173.767 Y60.583
G1 X154.602 Y41.417 E.80733
G1 X154.068 Y41.417
G1 X173.233 Y60.583 E.80733
G1 X172.7 Y60.583
G1 X153.535 Y41.417 E.80733
G1 X153.002 Y41.417
G1 X172.167 Y60.583 E.80733
G1 X171.634 Y60.583
G1 X152.468 Y41.417 E.80733
G1 X151.935 Y41.417
G1 X171.1 Y60.583 E.80733
G1 X170.567 Y60.583
G1 X151.402 Y41.417 E.80733
G1 X150.869 Y41.417
G1 X170.034 Y60.583 E.80733
G1 X169.501 Y60.583
G1 X150.335 Y41.417 E.80733
G1 X149.802 Y41.417
G1 X168.967 Y60.583 E.80733
G1 X168.434 Y60.583
G1 X149.269 Y41.417 E.80733
G1 X148.736 Y41.417
G1 X167.901 Y60.583 E.80733
G1 X167.368 Y60.583
G1 X148.202 Y41.417 E.80733
G1 X147.669 Y41.417
G1 X166.834 Y60.583 E.80733
G1 X166.301 Y60.583
G1 X147.136 Y41.417 E.80733
G1 X146.603 Y41.417
G1 X165.768 Y60.583 E.80733
G1 X165.235 Y60.583
G1 X146.069 Y41.417 E.80733
G1 X145.536 Y41.417
G1 X164.701 Y60.583 E.80733
G1 X164.168 Y60.583
G1 X145.003 Y41.417 E.80733
G1 X144.47 Y41.417
G1 X163.635 Y60.583 E.80733
G1 X163.102 Y60.583
G1 X143.936 Y41.417 E.80733
G1 X143.403 Y41.417
G1 X162.568 Y60.583 E.80733
G1 X162.035 Y60.583
G1 X142.87 Y41.417 E.80733
G1 X142.337 Y41.417
G1 X161.502 Y60.583 E.80733
G1 X160.969 Y60.583
G1 X141.803 Y41.417 E.80733
G1 X141.27 Y41.417
G1 X160.435 Y60.583 E.80733
G1 X159.902 Y60.583
G1 X140.737 Y41.417 E.80733
G1 X140.204 Y41.417
G1 X159.369 Y60.583 E.80733
G1 X158.836 Y60.583
G1 X139.67 Y41.417 E.80733
G1 X139.137 Y41.417
G1 X158.302 Y60.583 E.80733
G1 X157.769 Y60.583
G1 X138.604 Y41.417 E.80733
G1 X138.071 Y41.417
G1 X157.236 Y60.583 E.80733
G1 X156.703 Y60.583
G1 X137.537 Y41.417 E.80733
G1 X137.004 Y41.417
G1 X156.169 Y60.583 E.80733
G1 X155.636 Y60.583
G1 X136.471 Y41.417 E.80733
G1 X135.938 Y41.417
G1 X155.103 Y60.583 E.80733
G1 X154.569 Y60.583
G1 X138.656 Y44.669 E.67034
G1 X138.656 Y45.203
G1 X154.036 Y60.583 E.64787
G1 X153.503 Y60.583
G1 X138.577 Y45.656 E.62877
G1 X138.043 Y45.656
G1 X152.97 Y60.583 E.62877
G1 X152.436 Y60.583
G1 X137.51 Y45.656 E.62877
G1 X136.977 Y45.656
G1 X151.903 Y60.583 E.62877
G1 X151.37 Y60.583
G1 X136.444 Y45.656 E.62877
G1 X135.91 Y45.656
G1 X150.837 Y60.583 E.62877
G1 X150.303 Y60.583
G1 X135.377 Y45.656 E.62877
G1 X134.844 Y45.656
G1 X149.77 Y60.583 E.62877
M73 P81 R13
G1 X149.237 Y60.583
G1 X134.311 Y45.656 E.62877
G1 X133.777 Y45.656
G1 X148.704 Y60.583 E.62877
G1 X148.17 Y60.583
G1 X133.244 Y45.656 E.62877
G1 X132.711 Y45.656
G1 X147.637 Y60.583 E.62877
G1 X147.104 Y60.583
G1 X132.177 Y45.656 E.62877
G1 X131.644 Y45.656
G1 X146.571 Y60.583 E.62877
G1 X146.037 Y60.583
G1 X131.111 Y45.656 E.62877
G1 X130.578 Y45.656
G1 X145.504 Y60.583 E.62877
G1 X144.971 Y60.583
G1 X130.044 Y45.656 E.62877
G1 X129.511 Y45.656
G1 X144.438 Y60.583 E.62877
G1 X143.904 Y60.583
G1 X128.978 Y45.656 E.62877
G1 X128.445 Y45.656
G1 X143.371 Y60.583 E.62877
G1 X142.838 Y60.583
G1 X127.911 Y45.656 E.62877
M73 P81 R12
G1 X127.378 Y45.656
G1 X142.305 Y60.583 E.62877
G1 X141.771 Y60.583
G1 X126.845 Y45.656 E.62877
G1 X126.312 Y45.656
G1 X141.238 Y60.583 E.62877
G1 X140.705 Y60.583
G1 X129.707 Y49.585 E.46329
G1 X130.178 Y50.589
G1 X140.172 Y60.583 E.42096
G1 X139.638 Y60.583
G1 X130.21 Y51.155 E.39715
G1 X130.131 Y51.609
G1 X139.105 Y60.583 E.37803
G1 X138.572 Y60.583
G1 X129.981 Y51.992 E.36188
G1 X129.778 Y52.322
G1 X138.038 Y60.583 E.34798
G1 X137.505 Y60.583
G1 X129.528 Y52.606 E.33602
G1 X129.232 Y52.843
G1 X136.972 Y60.583 E.32605
G1 X136.439 Y60.583
G1 X128.886 Y53.03 E.31814
G1 X128.484 Y53.162
G1 X135.905 Y60.583 E.31261
G1 X135.372 Y60.583
G1 X128.005 Y53.216 E.31033
G1 X127.384 Y53.128
G1 X134.839 Y60.583 E.31403
; WIPE_START
M204 S10000
G1 X133.425 Y59.168 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.558 Y52.095 Z3.4 F30000
G1 X129.428 Y49.306 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X125.778 Y45.656 E.15373
G1 X125.245 Y45.656
G1 X128.41 Y48.822 E.13334
G1 X127.846 Y48.79
G1 X124.712 Y45.656 E.13202
G1 X124.179 Y45.656
G1 X127.392 Y48.87 E.13537
G1 X127.008 Y49.019
G1 X123.645 Y45.656 E.14166
G1 X123.112 Y45.656
G1 X126.677 Y49.221 E.15019
G1 X126.394 Y49.472
G1 X122.579 Y45.656 E.16073
G1 X122.046 Y45.656
G1 X126.158 Y49.769 E.17325
G1 X125.97 Y50.114
G1 X121.512 Y45.656 E.18777
G1 X120.979 Y45.656
G1 X125.838 Y50.515 E.20468
G1 X125.785 Y50.995
G1 X120.446 Y45.656 E.22491
G1 X119.913 Y45.656
G1 X125.872 Y51.615 E.25103
; WIPE_START
M204 S10000
G1 X124.457 Y50.201 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.379 Y45.656 Z3.4 F30000
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X134.306 Y60.583 E.62877
G1 X133.772 Y60.583
G1 X118.846 Y45.656 E.62877
G1 X118.313 Y45.656
G1 X133.239 Y60.583 E.62877
G1 X132.706 Y60.583
G1 X117.78 Y45.656 E.62877
; WIPE_START
M204 S10000
G1 X119.194 Y47.07 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.401 Y44.557 Z3.4 F30000
G1 X135.404 Y41.417 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X138.331 Y44.344 E.12327
G1 X137.797 Y44.344
G1 X134.871 Y41.417 E.12327
G1 X134.338 Y41.417
G1 X137.264 Y44.344 E.12327
G1 X136.731 Y44.344
G1 X133.804 Y41.417 E.12327
G1 X133.271 Y41.417
G1 X136.198 Y44.344 E.12327
G1 X135.664 Y44.344
G1 X132.738 Y41.417 E.12327
G1 X132.205 Y41.417
G1 X135.131 Y44.344 E.12327
G1 X134.598 Y44.344
G1 X131.671 Y41.417 E.12327
G1 X131.138 Y41.417
G1 X134.065 Y44.344 E.12327
G1 X133.531 Y44.344
G1 X130.605 Y41.417 E.12327
G1 X130.072 Y41.417
G1 X132.998 Y44.344 E.12327
G1 X132.465 Y44.344
G1 X129.538 Y41.417 E.12327
G1 X129.005 Y41.417
G1 X131.932 Y44.344 E.12327
G1 X131.398 Y44.344
G1 X128.472 Y41.417 E.12327
G1 X127.939 Y41.417
G1 X130.865 Y44.344 E.12327
G1 X130.332 Y44.344
G1 X127.405 Y41.417 E.12327
G1 X126.872 Y41.417
G1 X129.799 Y44.344 E.12327
G1 X129.265 Y44.344
G1 X126.339 Y41.417 E.12327
G1 X125.806 Y41.417
G1 X128.732 Y44.344 E.12327
G1 X128.199 Y44.344
G1 X125.272 Y41.417 E.12327
G1 X124.739 Y41.417
G1 X127.665 Y44.344 E.12327
G1 X127.132 Y44.344
G1 X124.206 Y41.417 E.12327
G1 X123.673 Y41.417
G1 X126.599 Y44.344 E.12327
G1 X126.066 Y44.344
G1 X123.139 Y41.417 E.12327
G1 X122.606 Y41.417
G1 X125.532 Y44.344 E.12327
G1 X124.999 Y44.344
G1 X122.073 Y41.417 E.12327
G1 X121.54 Y41.417
G1 X124.466 Y44.344 E.12327
G1 X123.933 Y44.344
G1 X121.006 Y41.417 E.12327
G1 X120.473 Y41.417
G1 X123.399 Y44.344 E.12327
G1 X122.866 Y44.344
G1 X119.94 Y41.417 E.12327
G1 X119.407 Y41.417
G1 X122.333 Y44.344 E.12327
G1 X121.8 Y44.344
G1 X118.873 Y41.417 E.12327
G1 X118.34 Y41.417
G1 X121.266 Y44.344 E.12327
G1 X120.733 Y44.344
G1 X117.807 Y41.417 E.12327
G1 X117.273 Y41.417
G1 X120.2 Y44.344 E.12327
G1 X119.667 Y44.344
G1 X116.74 Y41.417 E.12327
G1 X116.207 Y41.417
G1 X119.133 Y44.344 E.12327
G1 X118.6 Y44.344
G1 X115.674 Y41.417 E.12327
G1 X115.14 Y41.417
G1 X118.067 Y44.344 E.12327
G1 X117.534 Y44.344
G1 X114.607 Y41.417 E.12327
G1 X114.074 Y41.417
G1 X117.344 Y44.687 E.13774
G1 X117.344 Y45.22
G1 X113.541 Y41.417 E.1602
G1 X113.007 Y41.417
G1 X132.173 Y60.583 E.80733
G1 X131.639 Y60.583
G1 X112.474 Y41.417 E.80733
G1 X111.941 Y41.417
G1 X131.106 Y60.583 E.80733
G1 X130.573 Y60.583
G1 X111.408 Y41.417 E.80733
G1 X110.874 Y41.417
G1 X130.04 Y60.583 E.80733
G1 X129.506 Y60.583
G1 X110.341 Y41.417 E.80733
G1 X109.808 Y41.417
G1 X128.973 Y60.583 E.80733
G1 X128.44 Y60.583
G1 X109.275 Y41.417 E.80733
G1 X108.741 Y41.417
G1 X127.907 Y60.583 E.80733
G1 X127.373 Y60.583
G1 X108.208 Y41.417 E.80733
G1 X107.675 Y41.417
G1 X126.84 Y60.583 E.80733
G1 X126.307 Y60.583
G1 X107.142 Y41.417 E.80733
G1 X106.608 Y41.417
G1 X125.774 Y60.583 E.80733
G1 X125.24 Y60.583
G1 X106.075 Y41.417 E.80733
G1 X105.542 Y41.417
G1 X124.707 Y60.583 E.80733
G1 X124.174 Y60.583
G1 X105.009 Y41.417 E.80733
G1 X104.475 Y41.417
G1 X123.641 Y60.583 E.80733
G1 X123.107 Y60.583
G1 X103.942 Y41.417 E.80733
G1 X103.409 Y41.417
G1 X122.574 Y60.583 E.80733
G1 X122.041 Y60.583
G1 X102.876 Y41.417 E.80733
G1 X102.342 Y41.417
G1 X121.508 Y60.583 E.80733
G1 X120.974 Y60.583
G1 X101.809 Y41.417 E.80733
G1 X101.276 Y41.417
G1 X120.441 Y60.583 E.80733
G1 X119.908 Y60.583
G1 X100.742 Y41.417 E.80733
G1 X100.209 Y41.417
G1 X119.374 Y60.583 E.80733
G1 X118.841 Y60.583
G1 X99.676 Y41.417 E.80733
G1 X99.143 Y41.417
G1 X118.308 Y60.583 E.80733
G1 X117.775 Y60.583
G1 X98.609 Y41.417 E.80733
G1 X98.076 Y41.417
G1 X117.241 Y60.583 E.80733
G1 X116.708 Y60.583
G1 X97.543 Y41.417 E.80733
G1 X97.01 Y41.417
G1 X116.175 Y60.583 E.80733
G1 X115.642 Y60.583
G1 X96.476 Y41.417 E.80733
G1 X95.943 Y41.417
G1 X115.108 Y60.583 E.80733
G1 X114.575 Y60.583
G1 X95.41 Y41.417 E.80733
G1 X94.877 Y41.417
G1 X114.042 Y60.583 E.80733
G1 X113.509 Y60.583
G1 X94.343 Y41.417 E.80733
G1 X93.81 Y41.417
G1 X112.975 Y60.583 E.80733
G1 X112.442 Y60.583
G1 X93.277 Y41.417 E.80733
G1 X92.744 Y41.417
G1 X111.909 Y60.583 E.80733
G1 X111.376 Y60.583
G1 X92.21 Y41.417 E.80733
G1 X91.677 Y41.417
G1 X110.842 Y60.583 E.80733
G1 X110.309 Y60.583
G1 X91.144 Y41.417 E.80733
G1 X90.611 Y41.417
G1 X109.776 Y60.583 E.80733
G1 X109.243 Y60.583
G1 X90.077 Y41.417 E.80733
G1 X89.544 Y41.417
G1 X108.709 Y60.583 E.80733
G1 X108.176 Y60.583
G1 X89.011 Y41.417 E.80733
G1 X88.478 Y41.417
G1 X107.643 Y60.583 E.80733
G1 X107.11 Y60.583
G1 X87.944 Y41.417 E.80733
G1 X87.411 Y41.417
G1 X106.576 Y60.583 E.80733
G1 X106.043 Y60.583
G1 X86.878 Y41.417 E.80733
G1 X86.345 Y41.417
G1 X105.51 Y60.583 E.80733
G1 X104.977 Y60.583
G1 X85.811 Y41.417 E.80733
G1 X85.278 Y41.417
G1 X104.443 Y60.583 E.80733
G1 X103.91 Y60.583
G1 X84.745 Y41.417 E.80733
G1 X84.212 Y41.417
G1 X103.377 Y60.583 E.80733
G1 X102.843 Y60.583
G1 X83.678 Y41.417 E.80733
G1 X83.145 Y41.417
G1 X102.31 Y60.583 E.80733
G1 X101.777 Y60.583
G1 X82.612 Y41.417 E.80733
G1 X82.078 Y41.417
G1 X101.244 Y60.583 E.80733
G1 X100.71 Y60.583
G1 X81.545 Y41.417 E.80733
G1 X81.012 Y41.417
G1 X100.177 Y60.583 E.80733
G1 X99.644 Y60.583
G1 X80.479 Y41.417 E.80733
G1 X79.945 Y41.417
G1 X99.111 Y60.583 E.80733
G1 X98.577 Y60.583
G1 X79.412 Y41.417 E.80733
G1 X78.879 Y41.417
G1 X98.044 Y60.583 E.80733
G1 X97.511 Y60.583
G1 X78.346 Y41.417 E.80733
G1 X77.812 Y41.417
G1 X96.978 Y60.583 E.80733
G1 X96.444 Y60.583
G1 X77.279 Y41.417 E.80733
G1 X76.746 Y41.417
G1 X95.911 Y60.583 E.80733
G1 X95.378 Y60.583
G1 X76.213 Y41.417 E.80733
G1 X75.679 Y41.417
G1 X94.845 Y60.583 E.80733
G1 X94.311 Y60.583
G1 X75.146 Y41.417 E.80733
G1 X74.613 Y41.417
G1 X93.778 Y60.583 E.80733
G1 X93.245 Y60.583
G1 X74.08 Y41.417 E.80733
G1 X73.546 Y41.417
G1 X92.712 Y60.583 E.80733
G1 X92.178 Y60.583
G1 X73.013 Y41.417 E.80733
G1 X72.48 Y41.417
G1 X91.645 Y60.583 E.80733
G1 X91.112 Y60.583
G1 X71.947 Y41.417 E.80733
G1 X71.413 Y41.417
G1 X90.579 Y60.583 E.80733
G1 X90.045 Y60.583
G1 X70.88 Y41.417 E.80733
G1 X70.347 Y41.417
G1 X89.512 Y60.583 E.80733
G1 X88.979 Y60.583
G1 X69.814 Y41.417 E.80733
G1 X69.28 Y41.417
G1 X88.446 Y60.583 E.80733
G1 X87.912 Y60.583
G1 X68.747 Y41.417 E.80733
G1 X68.214 Y41.417
G1 X87.379 Y60.583 E.80733
G1 X86.846 Y60.583
G1 X67.681 Y41.417 E.80733
G1 X67.147 Y41.417
G1 X86.313 Y60.583 E.80733
G1 X85.779 Y60.583
G1 X66.614 Y41.417 E.80733
G1 X66.081 Y41.417
G1 X85.246 Y60.583 E.80733
G1 X84.713 Y60.583
G1 X65.547 Y41.417 E.80733
G1 X65.014 Y41.417
G1 X84.179 Y60.583 E.80733
G1 X83.646 Y60.583
G1 X64.481 Y41.417 E.80733
G1 X63.948 Y41.417
G1 X83.113 Y60.583 E.80733
G1 X82.58 Y60.583
G1 X63.414 Y41.417 E.80733
G1 X62.881 Y41.417
G1 X82.046 Y60.583 E.80733
G1 X81.513 Y60.583
G1 X62.348 Y41.417 E.80733
G1 X61.815 Y41.417
G1 X80.98 Y60.583 E.80733
G1 X80.447 Y60.583
G1 X61.281 Y41.417 E.80733
G1 X60.748 Y41.417
G1 X79.913 Y60.583 E.80733
G1 X79.38 Y60.583
G1 X60.215 Y41.417 E.80733
G1 X59.682 Y41.417
G1 X78.847 Y60.583 E.80733
G1 X78.314 Y60.583
G1 X59.148 Y41.417 E.80733
G1 X58.615 Y41.417
G1 X77.78 Y60.583 E.80733
G1 X77.247 Y60.583
G1 X58.082 Y41.417 E.80733
G1 X57.549 Y41.417
G1 X76.714 Y60.583 E.80733
G1 X76.181 Y60.583
G1 X57.015 Y41.417 E.80733
G1 X56.482 Y41.417
G1 X75.647 Y60.583 E.80733
G1 X75.114 Y60.583
G1 X55.949 Y41.417 E.80733
G1 X55.416 Y41.417
G1 X74.581 Y60.583 E.80733
G1 X74.048 Y60.583
G1 X54.882 Y41.417 E.80733
M73 P82 R12
G1 X54.349 Y41.417
G1 X73.514 Y60.583 E.80733
G1 X72.981 Y60.583
G1 X53.816 Y41.417 E.80733
G1 X53.283 Y41.417
G1 X72.448 Y60.583 E.80733
G1 X71.915 Y60.583
G1 X52.749 Y41.417 E.80733
G1 X52.216 Y41.417
G1 X71.381 Y60.583 E.80733
G1 X70.848 Y60.583
G1 X51.683 Y41.417 E.80733
G1 X51.15 Y41.417
G1 X70.315 Y60.583 E.80733
G1 X69.782 Y60.583
G1 X50.616 Y41.417 E.80733
G1 X50.083 Y41.417
G1 X69.248 Y60.583 E.80733
G1 X68.715 Y60.583
G1 X57.6 Y49.467 E.46823
G1 X58.176 Y50.577
G1 X68.182 Y60.583 E.42147
G1 X67.648 Y60.583
G1 X58.211 Y51.145 E.39756
G1 X58.133 Y51.6
G1 X67.115 Y60.583 E.37837
G1 X66.582 Y60.583
G1 X57.984 Y51.985 E.36217
G1 X57.782 Y52.316
G1 X66.049 Y60.583 E.34823
G1 X65.583 Y60.65
G1 X57.534 Y52.601 E.33906
G1 X57.238 Y52.838
G1 X65.583 Y61.183 E.35152
G1 X65.583 Y61.716
G1 X56.893 Y53.027 E.36603
G1 X56.493 Y53.16
G1 X65.583 Y62.25 E.38291
G1 X65.583 Y62.783
G1 X56.015 Y53.215 E.40302
G1 X55.398 Y53.132
G1 X65.583 Y63.316 E.429
; WIPE_START
M204 S10000
G1 X64.168 Y61.902 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X60.587 Y55.162 Z3.4 F30000
G1 X57.515 Y49.382 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X49.55 Y41.417 E.33553
G1 X49.017 Y41.417
G1 X56.424 Y48.825 E.31203
G1 X55.855 Y48.789
G1 X48.483 Y41.417 E.31055
G1 X47.95 Y41.417
G1 X55.4 Y48.868 E.31384
G1 X55.015 Y49.016
G1 X47.417 Y41.417 E.32008
G1 X46.883 Y41.417
G1 X54.683 Y49.217 E.32855
G1 X54.4 Y49.467
G1 X46.417 Y41.485 E.33625
G1 X46.417 Y42.018
G1 X54.162 Y49.763 E.32626
G1 X53.973 Y50.106
G1 X46.417 Y42.551 E.31827
G1 X46.417 Y43.084
G1 X53.84 Y50.507 E.31267
G1 X53.785 Y50.985
G1 X46.417 Y43.618 E.31035
G1 X46.417 Y44.151
G1 X53.867 Y51.601 E.31382
; WIPE_START
M204 S10000
G1 X52.453 Y50.186 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.813 Y45.044 Z3.4 F30000
G1 X46.417 Y44.684 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X65.583 Y63.849 E.80733
G1 X65.583 Y64.383
G1 X46.417 Y45.217 E.80733
G1 X46.417 Y45.751
G1 X65.583 Y64.916 E.80733
G1 X65.583 Y65.449
G1 X46.417 Y46.284 E.80733
G1 X46.417 Y46.817
G1 X65.583 Y65.982 E.80733
G1 X65.583 Y66.516
G1 X46.417 Y47.35 E.80733
G1 X46.417 Y47.884
G1 X65.583 Y67.049 E.80733
G1 X65.583 Y67.582
G1 X46.417 Y48.417 E.80733
G1 X46.417 Y48.95
G1 X65.583 Y68.115 E.80733
G1 X65.583 Y68.649
G1 X46.417 Y49.483 E.80733
G1 X46.417 Y50.017
G1 X65.583 Y69.182 E.80733
G1 X65.583 Y69.715
G1 X46.417 Y50.55 E.80733
G1 X46.417 Y51.083
G1 X65.583 Y70.248 E.80733
G1 X65.583 Y70.782
G1 X46.417 Y51.616 E.80733
G1 X46.417 Y52.15
G1 X65.583 Y71.315 E.80733
G1 X65.583 Y71.848
G1 X46.417 Y52.683 E.80733
G1 X46.417 Y53.216
G1 X65.583 Y72.381 E.80733
G1 X65.583 Y72.915
G1 X46.417 Y53.749 E.80733
G1 X46.417 Y54.283
G1 X65.583 Y73.448 E.80733
G1 X65.583 Y73.981
G1 X46.417 Y54.816 E.80733
G1 X46.417 Y55.349
G1 X65.583 Y74.514 E.80733
G1 X65.583 Y75.048
G1 X46.417 Y55.882 E.80733
G1 X46.417 Y56.416
G1 X65.583 Y75.581 E.80733
G1 X65.583 Y76.114
G1 X46.417 Y56.949 E.80733
G1 X46.417 Y57.482
G1 X65.583 Y76.647 E.80733
G1 X65.583 Y77.181
G1 X46.417 Y58.016 E.80733
G1 X46.417 Y58.549
G1 X65.583 Y77.714 E.80733
G1 X65.583 Y78.247
G1 X46.417 Y59.082 E.80733
G1 X46.417 Y59.615
G1 X65.583 Y78.781 E.80733
G1 X65.583 Y79.314
G1 X46.417 Y60.149 E.80733
G1 X46.417 Y60.682
G1 X65.583 Y79.847 E.80733
G1 X65.583 Y80.38
G1 X46.417 Y61.215 E.80733
G1 X46.417 Y61.748
G1 X65.583 Y80.914 E.80733
G1 X65.583 Y81.447
G1 X46.417 Y62.282 E.80733
G1 X46.417 Y62.815
G1 X65.583 Y81.98 E.80733
G1 X65.583 Y82.513
G1 X46.417 Y63.348 E.80733
G1 X46.417 Y63.881
G1 X65.583 Y83.047 E.80733
G1 X65.583 Y83.58
G1 X46.417 Y64.415 E.80733
G1 X46.417 Y64.948
G1 X65.583 Y84.113 E.80733
G1 X65.583 Y84.646
G1 X46.417 Y65.481 E.80733
G1 X46.417 Y66.014
G1 X65.583 Y85.18 E.80733
G1 X65.583 Y85.713
G1 X46.417 Y66.548 E.80733
G1 X46.417 Y67.081
G1 X65.583 Y86.246 E.80733
G1 X65.583 Y86.779
G1 X46.417 Y67.614 E.80733
G1 X46.417 Y68.147
G1 X65.583 Y87.313 E.80733
G1 X65.583 Y87.846
G1 X46.417 Y68.681 E.80733
G1 X46.417 Y69.214
G1 X65.583 Y88.379 E.80733
G1 X65.583 Y88.912
G1 X46.417 Y69.747 E.80733
G1 X46.417 Y70.28
G1 X65.583 Y89.446 E.80733
G1 X65.583 Y89.979
G1 X46.417 Y70.814 E.80733
G1 X46.417 Y71.347
G1 X65.583 Y90.512 E.80733
G1 X65.583 Y91.045
G1 X46.417 Y71.88 E.80733
G1 X46.417 Y72.413
G1 X65.583 Y91.579 E.80733
G1 X65.583 Y92.112
G1 X46.417 Y72.947 E.80733
G1 X46.417 Y73.48
G1 X65.583 Y92.645 E.80733
G1 X65.583 Y93.178
G1 X46.417 Y74.013 E.80733
G1 X46.417 Y74.546
G1 X65.583 Y93.712 E.80733
G1 X65.583 Y94.245
G1 X46.417 Y75.08 E.80733
G1 X46.417 Y75.613
G1 X65.583 Y94.778 E.80733
M73 P82 R11
G1 X65.583 Y95.312
G1 X46.417 Y76.146 E.80733
G1 X46.417 Y76.68
G1 X65.583 Y95.845 E.80733
G1 X65.583 Y96.378
G1 X46.417 Y77.213 E.80733
G1 X46.417 Y77.746
G1 X65.583 Y96.911 E.80733
G1 X65.583 Y97.445
G1 X46.417 Y78.279 E.80733
G1 X46.417 Y78.813
G1 X65.583 Y97.978 E.80733
G1 X65.583 Y98.511
G1 X46.417 Y79.346 E.80733
G1 X46.417 Y79.879
G1 X65.583 Y99.044 E.80733
G1 X65.583 Y99.578
G1 X46.417 Y80.412 E.80733
G1 X46.417 Y80.946
G1 X65.583 Y100.111 E.80733
G1 X65.583 Y100.644
G1 X46.417 Y81.479 E.80733
G1 X46.417 Y82.012
G1 X65.583 Y101.177 E.80733
G1 X65.583 Y101.711
G1 X46.417 Y82.545 E.80733
G1 X46.417 Y83.079
G1 X65.583 Y102.244 E.80733
G1 X65.583 Y102.777
G1 X46.417 Y83.612 E.80733
G1 X46.417 Y84.145
G1 X65.583 Y103.31 E.80733
G1 X65.583 Y103.844
G1 X46.417 Y84.678 E.80733
G1 X46.417 Y85.212
G1 X65.583 Y104.377 E.80733
G1 X65.583 Y104.91
G1 X46.417 Y85.745 E.80733
G1 X46.417 Y86.278
G1 X65.583 Y105.443 E.80733
G1 X65.583 Y105.977
G1 X46.417 Y86.811 E.80733
G1 X46.417 Y87.345
G1 X65.583 Y106.51 E.80733
G1 X65.583 Y107.043
G1 X46.417 Y87.878 E.80733
G1 X46.417 Y88.411
G1 X65.583 Y107.576 E.80733
G1 X65.583 Y108.11
G1 X46.417 Y88.944 E.80733
G1 X46.417 Y89.478
G1 X65.583 Y108.643 E.80733
G1 X65.583 Y109.176
G1 X46.417 Y90.011 E.80733
G1 X46.417 Y90.544
G1 X65.583 Y109.709 E.80733
G1 X65.583 Y110.243
G1 X46.417 Y91.077 E.80733
G1 X46.417 Y91.611
G1 X65.583 Y110.776 E.80733
G1 X65.583 Y111.309
G1 X46.417 Y92.144 E.80733
G1 X46.417 Y92.677
G1 X65.583 Y111.842 E.80733
G1 X65.583 Y112.376
G1 X46.417 Y93.211 E.80733
G1 X46.417 Y93.744
G1 X65.583 Y112.909 E.80733
G1 X65.583 Y113.442
G1 X46.417 Y94.277 E.80733
G1 X46.417 Y94.81
G1 X65.583 Y113.976 E.80733
G1 X65.583 Y114.509
G1 X46.417 Y95.344 E.80733
G1 X46.417 Y95.877
G1 X65.583 Y115.042 E.80733
G1 X65.583 Y115.575
G1 X46.417 Y96.41 E.80733
G1 X46.417 Y96.943
G1 X65.583 Y116.109 E.80733
G1 X65.583 Y116.642
G1 X46.417 Y97.477 E.80733
G1 X46.417 Y98.01
G1 X65.583 Y117.175 E.80733
G1 X65.583 Y117.708
G1 X46.417 Y98.543 E.80733
G1 X46.417 Y99.076
G1 X65.583 Y118.242 E.80733
G1 X65.583 Y118.775
G1 X46.417 Y99.61 E.80733
G1 X46.417 Y100.143
G1 X65.583 Y119.308 E.80733
G1 X65.583 Y119.841
G1 X46.417 Y100.676 E.80733
G1 X46.417 Y101.209
G1 X65.583 Y120.375 E.80733
G1 X65.583 Y120.908
G1 X46.417 Y101.743 E.80733
G1 X46.417 Y102.276
G1 X65.583 Y121.441 E.80733
G1 X65.583 Y121.974
G1 X46.417 Y102.809 E.80733
G1 X46.417 Y103.342
G1 X65.583 Y122.508 E.80733
G1 X65.583 Y123.041
G1 X46.417 Y103.876 E.80733
G1 X46.417 Y104.409
G1 X65.583 Y123.574 E.80733
G1 X65.583 Y124.107
G1 X46.417 Y104.942 E.80733
G1 X46.417 Y105.475
G1 X65.583 Y124.641 E.80733
G1 X65.583 Y125.174
G1 X46.417 Y106.009 E.80733
G1 X46.417 Y106.542
G1 X65.583 Y125.707 E.80733
G1 X65.583 Y126.24
G1 X46.417 Y107.075 E.80733
G1 X46.417 Y107.608
G1 X65.583 Y126.774 E.80733
G1 X65.583 Y127.307
G1 X46.417 Y108.142 E.80733
G1 X46.417 Y108.675
G1 X65.583 Y127.84 E.80733
G1 X65.583 Y128.373
G1 X46.417 Y109.208 E.80733
G1 X46.417 Y109.741
G1 X65.583 Y128.907 E.80733
G1 X65.583 Y129.44
G1 X46.417 Y110.275 E.80733
G1 X46.417 Y110.808
G1 X65.583 Y129.973 E.80733
G1 X65.583 Y130.506
G1 X46.417 Y111.341 E.80733
G1 X46.417 Y111.875
G1 X65.583 Y131.04 E.80733
G1 X65.583 Y131.573
G1 X46.417 Y112.408 E.80733
G1 X46.417 Y112.941
G1 X65.583 Y132.106 E.80733
G1 X65.583 Y132.64
G1 X58.009 Y125.066 E.31905
G1 X58.208 Y125.798
G1 X65.583 Y133.173 E.31066
M73 P83 R11
G1 X65.583 Y133.706
G1 X58.193 Y126.316 E.3113
G1 X58.087 Y126.743
G1 X65.583 Y134.239 E.31576
G1 X65.583 Y134.773
G1 X57.919 Y127.109 E.32284
G1 X57.7 Y127.424
G1 X65.583 Y135.306 E.33203
G1 X65.583 Y135.839
G1 X57.433 Y127.69 E.34329
G1 X57.121 Y127.911
G1 X65.583 Y136.372 E.35645
G1 X65.583 Y136.906
G1 X56.759 Y128.082 E.3717
G1 X56.334 Y128.191
G1 X65.583 Y137.439 E.38958
G1 X65.583 Y137.972
G1 X55.818 Y128.208 E.41132
G1 X55.106 Y128.029
G1 X65.583 Y138.505 E.44132
; WIPE_START
M204 S10000
G1 X64.168 Y137.091 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X60.479 Y130.41 Z3.4 F30000
G1 X56.935 Y123.991 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X46.417 Y113.474 E.44303
G1 X46.417 Y114.008
G1 X56.203 Y123.793 E.41221
G1 X55.683 Y123.807
G1 X46.417 Y114.541 E.39032
G1 X46.417 Y115.074
G1 X55.256 Y123.912 E.37231
G1 X54.89 Y124.08
G1 X46.417 Y115.607 E.35691
G1 X46.417 Y116.141
G1 X54.578 Y124.301 E.34375
G1 X54.311 Y124.567
G1 X46.417 Y116.674 E.3325
G1 X46.417 Y117.207
G1 X54.089 Y124.878 E.32314
G1 X53.917 Y125.24
G1 X46.417 Y117.74 E.3159
G1 X46.417 Y118.274
G1 X53.808 Y125.664 E.31132
G1 X53.792 Y126.181
G1 X46.417 Y118.807 E.31065
G1 X46.417 Y119.34
G1 X53.974 Y126.897 E.31833
; WIPE_START
M204 S10000
G1 X52.56 Y125.483 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.924 Y120.336 Z3.4 F30000
G1 X46.417 Y119.873 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X65.583 Y139.039 E.80733
G1 X65.583 Y139.572
G1 X46.417 Y120.407 E.80733
G1 X46.417 Y120.94
G1 X65.583 Y140.105 E.80733
G1 X65.583 Y140.638
G1 X46.417 Y121.473 E.80733
G1 X46.417 Y122.006
G1 X65.583 Y141.172 E.80733
G1 X65.583 Y141.705
G1 X46.417 Y122.54 E.80733
G1 X46.417 Y123.073
G1 X65.583 Y142.238 E.80733
G1 X65.583 Y142.771
G1 X46.417 Y123.606 E.80733
G1 X46.417 Y124.139
G1 X65.583 Y143.305 E.80733
G1 X65.583 Y143.838
G1 X46.417 Y124.673 E.80733
G1 X46.417 Y125.206
G1 X65.583 Y144.371 E.80733
G1 X65.583 Y144.904
G1 X46.417 Y125.739 E.80733
G1 X46.417 Y126.272
G1 X65.583 Y145.438 E.80733
G1 X65.583 Y145.971
G1 X46.417 Y126.806 E.80733
G1 X46.417 Y127.339
G1 X65.583 Y146.504 E.80733
G1 X65.583 Y147.037
G1 X46.417 Y127.872 E.80733
G1 X46.417 Y128.406
G1 X65.583 Y147.571 E.80733
G1 X65.583 Y148.104
G1 X46.417 Y128.939 E.80733
G1 X46.417 Y129.472
G1 X65.583 Y148.637 E.80733
G1 X65.583 Y149.171
G1 X46.417 Y130.005 E.80733
G1 X46.417 Y130.539
G1 X65.583 Y149.704 E.80733
G1 X65.583 Y150.237
G1 X46.417 Y131.072 E.80733
G1 X46.417 Y131.605
G1 X65.583 Y150.77 E.80733
G1 X65.583 Y151.304
G1 X46.417 Y132.138 E.80733
G1 X46.417 Y132.672
G1 X65.583 Y151.837 E.80733
G1 X65.583 Y152.37
G1 X46.417 Y133.205 E.80733
G1 X46.417 Y133.738
G1 X65.583 Y152.903 E.80733
G1 X65.583 Y153.437
G1 X46.417 Y134.271 E.80733
G1 X46.417 Y134.805
G1 X65.583 Y153.97 E.80733
G1 X65.583 Y154.503
G1 X46.417 Y135.338 E.80733
G1 X46.417 Y135.871
G1 X65.583 Y155.036 E.80733
G1 X65.583 Y155.57
G1 X46.417 Y136.404 E.80733
G1 X46.417 Y136.938
G1 X65.583 Y156.103 E.80733
G1 X65.583 Y156.636
G1 X46.417 Y137.471 E.80733
G1 X46.417 Y138.004
G1 X65.583 Y157.169 E.80733
G1 X65.583 Y157.703
G1 X46.417 Y138.537 E.80733
G1 X46.417 Y139.071
G1 X65.583 Y158.236 E.80733
G1 X65.583 Y158.769
G1 X46.417 Y139.604 E.80733
G1 X46.417 Y140.137
G1 X65.583 Y159.302 E.80733
G1 X65.583 Y159.836
G1 X46.417 Y140.67 E.80733
G1 X46.417 Y141.204
G1 X65.583 Y160.369 E.80733
G1 X65.583 Y160.902
G1 X46.417 Y141.737 E.80733
G1 X46.417 Y142.27
G1 X65.583 Y161.435 E.80733
G1 X65.583 Y161.969
G1 X46.417 Y142.803 E.80733
G1 X46.417 Y143.337
G1 X65.583 Y162.502 E.80733
G1 X65.583 Y163.035
G1 X46.417 Y143.87 E.80733
G1 X46.417 Y144.403
G1 X65.583 Y163.568 E.80733
G1 X65.583 Y164.102
G1 X46.417 Y144.936 E.80733
G1 X46.417 Y145.47
G1 X65.583 Y164.635 E.80733
G1 X65.583 Y165.168
G1 X46.417 Y146.003 E.80733
G1 X46.417 Y146.536
G1 X65.583 Y165.701 E.80733
G1 X65.583 Y166.235
G1 X46.417 Y147.07 E.80733
G1 X46.417 Y147.603
G1 X65.583 Y166.768 E.80733
G1 X65.583 Y167.301
G1 X46.417 Y148.136 E.80733
G1 X46.417 Y148.669
G1 X65.583 Y167.835 E.80733
G1 X65.583 Y168.368
G1 X46.417 Y149.203 E.80733
G1 X46.417 Y149.736
G1 X65.583 Y168.901 E.80733
G1 X65.583 Y169.434
G1 X46.417 Y150.269 E.80733
G1 X46.417 Y150.802
G1 X65.583 Y169.968 E.80733
G1 X65.583 Y170.501
G1 X46.417 Y151.336 E.80733
G1 X46.417 Y151.869
G1 X65.583 Y171.034 E.80733
G1 X65.583 Y171.567
G1 X46.417 Y152.402 E.80733
G1 X46.417 Y152.935
G1 X65.583 Y172.101 E.80733
G1 X65.583 Y172.634
G1 X46.417 Y153.469 E.80733
G1 X46.417 Y154.002
G1 X65.583 Y173.167 E.80733
G1 X65.583 Y173.7
G1 X46.417 Y154.535 E.80733
G1 X46.417 Y155.068
G1 X65.583 Y174.234 E.80733
G1 X65.583 Y174.767
G1 X46.417 Y155.602 E.80733
G1 X46.417 Y156.135
G1 X65.583 Y175.3 E.80733
G1 X65.583 Y175.833
G1 X46.417 Y156.668 E.80733
G1 X46.417 Y157.201
G1 X65.583 Y176.367 E.80733
G1 X65.583 Y176.9
G1 X46.417 Y157.735 E.80733
G1 X46.417 Y158.268
G1 X65.583 Y177.433 E.80733
G1 X65.583 Y177.966
G1 X46.417 Y158.801 E.80733
G1 X46.417 Y159.334
G1 X65.583 Y178.5 E.80733
G1 X65.583 Y179.033
G1 X46.417 Y159.868 E.80733
G1 X46.417 Y160.401
G1 X65.583 Y179.566 E.80733
G1 X65.583 Y180.099
G1 X46.417 Y160.934 E.80733
G1 X46.417 Y161.467
G1 X65.583 Y180.633 E.80733
G1 X65.583 Y181.166
G1 X46.417 Y162.001 E.80733
G1 X46.417 Y162.534
G1 X65.583 Y181.699 E.80733
G1 X65.583 Y182.232
G1 X46.417 Y163.067 E.80733
G1 X46.417 Y163.601
G1 X65.583 Y182.766 E.80733
G1 X65.583 Y183.299
G1 X46.417 Y164.134 E.80733
G1 X46.417 Y164.667
G1 X65.583 Y183.832 E.80733
G1 X65.583 Y184.366
G1 X46.417 Y165.2 E.80733
G1 X46.417 Y165.734
G1 X65.583 Y184.899 E.80733
G1 X65.583 Y185.432
G1 X46.417 Y166.267 E.80733
G1 X46.417 Y166.8
G1 X65.583 Y185.965 E.80733
G1 X65.583 Y186.499
G1 X46.417 Y167.333 E.80733
G1 X46.417 Y167.867
G1 X65.583 Y187.032 E.80733
G1 X65.583 Y187.565
G1 X46.417 Y168.4 E.80733
G1 X46.417 Y168.933
G1 X65.583 Y188.098 E.80733
G1 X65.583 Y188.632
G1 X46.417 Y169.466 E.80733
G1 X46.417 Y170
G1 X65.583 Y189.165 E.80733
G1 X65.583 Y189.698
G1 X46.417 Y170.533 E.80733
G1 X46.417 Y171.066
G1 X65.583 Y190.231 E.80733
G1 X65.583 Y190.765
G1 X46.417 Y171.599 E.80733
G1 X46.417 Y172.133
G1 X65.583 Y191.298 E.80733
; WIPE_START
M204 S10000
G1 X64.168 Y189.884 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X69.503 Y184.425 Z3.4 F30000
G1 X190.417 Y60.702 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X209.583 Y79.868 E.80733
G1 X209.583 Y80.401
G1 X190.417 Y61.236 E.80733
G1 X190.417 Y61.769
G1 X209.583 Y80.934 E.80733
G1 X209.583 Y81.467
G1 X190.417 Y62.302 E.80733
G1 X190.417 Y62.835
G1 X209.583 Y82.001 E.80733
G1 X209.583 Y82.534
G1 X190.417 Y63.369 E.80733
G1 X190.417 Y63.902
G1 X209.583 Y83.067 E.80733
G1 X209.583 Y83.6
G1 X190.417 Y64.435 E.80733
G1 X190.417 Y64.968
G1 X209.583 Y84.134 E.80733
G1 X209.583 Y84.667
G1 X190.417 Y65.502 E.80733
G1 X190.417 Y66.035
G1 X209.583 Y85.2 E.80733
G1 X209.583 Y85.733
G1 X190.417 Y66.568 E.80733
G1 X190.417 Y67.101
G1 X209.583 Y86.267 E.80733
G1 X209.583 Y86.8
G1 X190.417 Y67.635 E.80733
G1 X190.417 Y68.168
G1 X209.583 Y87.333 E.80733
G1 X209.583 Y87.866
G1 X190.417 Y68.701 E.80733
G1 X190.417 Y69.234
G1 X209.583 Y88.4 E.80733
G1 X209.583 Y88.933
G1 X190.417 Y69.768 E.80733
G1 X190.417 Y70.301
G1 X209.583 Y89.466 E.80733
G1 X209.583 Y89.999
G1 X190.417 Y70.834 E.80733
G1 X190.417 Y71.367
G1 X209.583 Y90.533 E.80733
G1 X209.583 Y91.066
G1 X190.417 Y71.901 E.80733
G1 X190.417 Y72.434
G1 X209.583 Y91.599 E.80733
G1 X209.583 Y92.132
G1 X190.417 Y72.967 E.80733
G1 X190.417 Y73.5
G1 X209.583 Y92.666 E.80733
G1 X209.583 Y93.199
G1 X190.417 Y74.034 E.80733
G1 X190.417 Y74.567
G1 X209.583 Y93.732 E.80733
G1 X209.583 Y94.265
G1 X190.417 Y75.1 E.80733
G1 X190.417 Y75.634
G1 X209.583 Y94.799 E.80733
G1 X209.583 Y95.332
G1 X190.417 Y76.167 E.80733
G1 X190.417 Y76.7
G1 X209.583 Y95.865 E.80733
G1 X209.583 Y96.398
G1 X190.417 Y77.233 E.80733
G1 X190.417 Y77.767
G1 X209.583 Y96.932 E.80733
G1 X209.583 Y97.465
G1 X190.417 Y78.3 E.80733
G1 X190.417 Y78.833
G1 X209.583 Y97.998 E.80733
G1 X209.583 Y98.532
G1 X190.417 Y79.366 E.80733
G1 X190.417 Y79.9
G1 X209.583 Y99.065 E.80733
G1 X209.583 Y99.598
G1 X190.417 Y80.433 E.80733
G1 X190.417 Y80.966
G1 X209.583 Y100.131 E.80733
G1 X209.583 Y100.665
G1 X190.417 Y81.499 E.80733
G1 X190.417 Y82.033
M73 P83 R10
G1 X209.583 Y101.198 E.80733
M73 P84 R10
G1 X209.583 Y101.731
G1 X190.417 Y82.566 E.80733
G1 X190.417 Y83.099
G1 X209.583 Y102.264 E.80733
G1 X209.583 Y102.798
G1 X190.417 Y83.632 E.80733
G1 X190.417 Y84.166
G1 X209.583 Y103.331 E.80733
G1 X209.583 Y103.864
G1 X190.417 Y84.699 E.80733
G1 X190.417 Y85.232
G1 X209.583 Y104.397 E.80733
G1 X209.583 Y104.931
G1 X190.417 Y85.765 E.80733
G1 X190.417 Y86.299
G1 X209.583 Y105.464 E.80733
G1 X209.583 Y105.997
G1 X190.417 Y86.832 E.80733
G1 X190.417 Y87.365
G1 X209.583 Y106.53 E.80733
G1 X209.583 Y107.064
G1 X190.417 Y87.898 E.80733
G1 X190.417 Y88.432
G1 X209.583 Y107.597 E.80733
G1 X209.583 Y108.13
G1 X190.417 Y88.965 E.80733
G1 X190.417 Y89.498
G1 X209.583 Y108.663 E.80733
G1 X209.583 Y109.197
G1 X190.417 Y90.031 E.80733
G1 X190.417 Y90.565
G1 X209.583 Y109.73 E.80733
G1 X209.583 Y110.263
G1 X190.417 Y91.098 E.80733
G1 X190.417 Y91.631
G1 X209.583 Y110.796 E.80733
G1 X209.583 Y111.33
G1 X190.417 Y92.164 E.80733
G1 X190.417 Y92.698
G1 X209.583 Y111.863 E.80733
G1 X209.583 Y112.396
G1 X190.417 Y93.231 E.80733
G1 X190.417 Y93.764
G1 X209.583 Y112.929 E.80733
G1 X209.583 Y113.463
G1 X190.417 Y94.298 E.80733
G1 X190.417 Y94.831
G1 X209.583 Y113.996 E.80733
G1 X209.583 Y114.529
G1 X190.417 Y95.364 E.80733
G1 X190.417 Y95.897
G1 X209.583 Y115.063 E.80733
G1 X209.583 Y115.596
G1 X190.417 Y96.431 E.80733
G1 X190.417 Y96.964
G1 X209.583 Y116.129 E.80733
G1 X209.583 Y116.662
G1 X190.417 Y97.497 E.80733
G1 X190.417 Y98.03
G1 X209.583 Y117.196 E.80733
G1 X209.583 Y117.729
G1 X190.417 Y98.564 E.80733
G1 X190.417 Y99.097
G1 X209.583 Y118.262 E.80733
G1 X209.583 Y118.795
G1 X190.417 Y99.63 E.80733
G1 X190.417 Y100.163
G1 X209.583 Y119.329 E.80733
G1 X209.583 Y119.862
G1 X190.417 Y100.697 E.80733
G1 X190.417 Y101.23
G1 X209.583 Y120.395 E.80733
G1 X209.583 Y120.928
G1 X190.417 Y101.763 E.80733
G1 X190.417 Y102.296
G1 X209.583 Y121.462 E.80733
G1 X209.583 Y121.995
G1 X190.417 Y102.83 E.80733
G1 X190.417 Y103.363
G1 X209.583 Y122.528 E.80733
G1 X209.583 Y123.061
G1 X190.417 Y103.896 E.80733
G1 X190.417 Y104.429
G1 X209.583 Y123.595 E.80733
G1 X209.583 Y124.128
G1 X190.417 Y104.963 E.80733
G1 X190.417 Y105.496
G1 X209.583 Y124.661 E.80733
G1 X209.583 Y125.194
G1 X190.417 Y106.029 E.80733
G1 X190.417 Y106.562
G1 X209.583 Y125.728 E.80733
G1 X209.583 Y126.261
G1 X190.417 Y107.096 E.80733
G1 X190.417 Y107.629
G1 X209.583 Y126.794 E.80733
G1 X209.583 Y127.327
G1 X190.417 Y108.162 E.80733
G1 X190.417 Y108.695
G1 X209.583 Y127.861 E.80733
G1 X209.583 Y128.394
G1 X190.417 Y109.229 E.80733
G1 X190.417 Y109.762
G1 X209.583 Y128.927 E.80733
G1 X209.583 Y129.46
G1 X190.417 Y110.295 E.80733
G1 X190.417 Y110.828
G1 X209.583 Y129.994 E.80733
G1 X209.583 Y130.527
G1 X190.417 Y111.362 E.80733
G1 X190.417 Y111.895
G1 X209.583 Y131.06 E.80733
G1 X209.583 Y131.593
G1 X190.417 Y112.428 E.80733
G1 X190.417 Y112.962
G1 X209.583 Y132.127 E.80733
G1 X209.583 Y132.66
G1 X202.028 Y125.105 E.31825
G1 X202.209 Y125.82
G1 X209.583 Y133.193 E.31061
G1 X209.583 Y133.727
G1 X202.19 Y126.334 E.31142
G1 X202.081 Y126.758
G1 X209.583 Y134.26 E.31599
G1 X209.583 Y134.793
G1 X201.911 Y127.121 E.32317
G1 X201.691 Y127.434
G1 X209.583 Y135.326 E.33244
G1 X209.583 Y135.86
G1 X201.422 Y127.699 E.34375
G1 X201.108 Y127.918
G1 X209.583 Y136.393 E.35699
G1 X209.583 Y136.926
G1 X200.744 Y128.087 E.37234
G1 X200.316 Y128.193
G1 X209.583 Y137.459 E.39035
G1 X209.583 Y137.993
G1 X199.796 Y128.206 E.41225
G1 X199.069 Y128.012
G1 X209.583 Y138.526 E.4429
; WIPE_START
M204 S10000
G1 X208.168 Y137.112 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X204.472 Y130.434 Z3.4 F30000
G1 X200.897 Y123.975 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X190.417 Y113.495 E.44146
G1 X190.417 Y114.028
G1 X200.179 Y123.79 E.41122
G1 X199.666 Y123.81
G1 X190.417 Y114.561 E.38958
G1 X190.417 Y115.095
G1 X199.241 Y123.918 E.37169
G1 X198.878 Y124.088
G1 X190.417 Y115.628 E.35638
G1 X190.417 Y116.161
G1 X198.566 Y124.31 E.34327
G1 X198.301 Y124.578
G1 X190.417 Y116.694 E.33211
G1 X190.417 Y117.228
G1 X198.081 Y124.892 E.32284
G1 X197.912 Y125.255
G1 X190.417 Y117.761 E.31569
G1 X190.417 Y118.294
G1 X197.806 Y125.682 E.31122
G1 X197.794 Y126.204
G1 X190.417 Y118.827 E.31075
G1 X190.417 Y119.361
G1 X197.989 Y126.932 E.31895
; WIPE_START
M204 S10000
G1 X196.575 Y125.518 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X190.939 Y120.371 Z3.4 F30000
G1 X190.417 Y119.894 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X209.583 Y139.059 E.80733
G1 X209.583 Y139.592
G1 X190.417 Y120.427 E.80733
G1 X190.417 Y120.96
G1 X209.583 Y140.126 E.80733
G1 X209.583 Y140.659
G1 X190.417 Y121.494 E.80733
G1 X190.417 Y122.027
G1 X209.583 Y141.192 E.80733
G1 X209.583 Y141.725
G1 X190.417 Y122.56 E.80733
G1 X190.417 Y123.093
G1 X209.583 Y142.259 E.80733
G1 X209.583 Y142.792
G1 X190.417 Y123.627 E.80733
G1 X190.417 Y124.16
G1 X209.583 Y143.325 E.80733
G1 X209.583 Y143.858
G1 X190.417 Y124.693 E.80733
G1 X190.417 Y125.226
G1 X209.583 Y144.392 E.80733
G1 X209.583 Y144.925
G1 X190.417 Y125.76 E.80733
G1 X190.417 Y126.293
G1 X209.583 Y145.458 E.80733
G1 X209.583 Y145.991
G1 X190.417 Y126.826 E.80733
G1 X190.417 Y127.359
G1 X209.583 Y146.525 E.80733
G1 X209.583 Y147.058
G1 X190.417 Y127.893 E.80733
G1 X190.417 Y128.426
G1 X209.583 Y147.591 E.80733
G1 X209.583 Y148.124
G1 X190.417 Y128.959 E.80733
G1 X190.417 Y129.493
G1 X209.583 Y148.658 E.80733
G1 X209.583 Y149.191
G1 X190.417 Y130.026 E.80733
G1 X190.417 Y130.559
G1 X209.583 Y149.724 E.80733
G1 X209.583 Y150.258
G1 X190.417 Y131.092 E.80733
G1 X190.417 Y131.626
G1 X209.583 Y150.791 E.80733
G1 X209.583 Y151.324
G1 X190.417 Y132.159 E.80733
G1 X190.417 Y132.692
G1 X209.583 Y151.857 E.80733
G1 X209.583 Y152.391
G1 X190.417 Y133.225 E.80733
G1 X190.417 Y133.759
G1 X209.583 Y152.924 E.80733
G1 X209.583 Y153.457
G1 X190.417 Y134.292 E.80733
G1 X190.417 Y134.825
G1 X209.583 Y153.99 E.80733
G1 X209.583 Y154.524
G1 X190.417 Y135.358 E.80733
G1 X190.417 Y135.892
G1 X209.583 Y155.057 E.80733
G1 X209.583 Y155.59
G1 X190.417 Y136.425 E.80733
G1 X190.417 Y136.958
G1 X209.583 Y156.123 E.80733
G1 X209.583 Y156.657
G1 X190.417 Y137.491 E.80733
G1 X190.417 Y138.025
G1 X209.583 Y157.19 E.80733
G1 X209.583 Y157.723
G1 X190.417 Y138.558 E.80733
G1 X190.417 Y139.091
G1 X209.583 Y158.256 E.80733
G1 X209.583 Y158.79
G1 X190.417 Y139.624 E.80733
G1 X190.417 Y140.158
G1 X209.583 Y159.323 E.80733
G1 X209.583 Y159.856
G1 X190.417 Y140.691 E.80733
G1 X190.417 Y141.224
G1 X209.583 Y160.389 E.80733
G1 X209.583 Y160.923
G1 X190.417 Y141.757 E.80733
G1 X190.417 Y142.291
G1 X209.583 Y161.456 E.80733
G1 X209.583 Y161.989
G1 X190.417 Y142.824 E.80733
G1 X190.417 Y143.357
G1 X209.583 Y162.522 E.80733
G1 X209.583 Y163.056
G1 X190.417 Y143.89 E.80733
G1 X190.417 Y144.424
G1 X209.583 Y163.589 E.80733
G1 X209.583 Y164.122
G1 X190.417 Y144.957 E.80733
G1 X190.417 Y145.49
G1 X209.583 Y164.655 E.80733
G1 X209.583 Y165.189
G1 X190.417 Y146.023 E.80733
G1 X190.417 Y146.557
G1 X209.583 Y165.722 E.80733
G1 X209.583 Y166.255
G1 X190.417 Y147.09 E.80733
G1 X190.417 Y147.623
G1 X209.583 Y166.788 E.80733
G1 X209.583 Y167.322
G1 X190.417 Y148.157 E.80733
G1 X190.417 Y148.69
G1 X209.583 Y167.855 E.80733
G1 X209.583 Y168.388
G1 X190.417 Y149.223 E.80733
G1 X190.417 Y149.756
G1 X209.583 Y168.922 E.80733
G1 X209.583 Y169.455
G1 X190.417 Y150.29 E.80733
G1 X190.417 Y150.823
G1 X209.583 Y169.988 E.80733
G1 X209.583 Y170.521
G1 X190.417 Y151.356 E.80733
G1 X190.417 Y151.889
G1 X209.583 Y171.055 E.80733
G1 X209.583 Y171.588
G1 X190.417 Y152.423 E.80733
G1 X190.417 Y152.956
G1 X209.583 Y172.121 E.80733
G1 X209.583 Y172.654
G1 X190.417 Y153.489 E.80733
G1 X190.417 Y154.022
G1 X209.583 Y173.188 E.80733
G1 X209.583 Y173.721
G1 X190.417 Y154.556 E.80733
G1 X190.417 Y155.089
G1 X209.583 Y174.254 E.80733
G1 X209.583 Y174.787
G1 X190.417 Y155.622 E.80733
G1 X190.417 Y156.155
G1 X209.583 Y175.321 E.80733
G1 X209.583 Y175.854
G1 X190.417 Y156.689 E.80733
G1 X190.417 Y157.222
G1 X209.583 Y176.387 E.80733
G1 X209.583 Y176.92
G1 X190.417 Y157.755 E.80733
G1 X190.417 Y158.288
G1 X209.583 Y177.454 E.80733
G1 X209.583 Y177.987
G1 X190.417 Y158.822 E.80733
G1 X190.417 Y159.355
G1 X209.583 Y178.52 E.80733
G1 X209.583 Y179.053
G1 X190.417 Y159.888 E.80733
G1 X190.417 Y160.421
G1 X209.583 Y179.587 E.80733
G1 X209.583 Y180.12
G1 X190.417 Y160.955 E.80733
G1 X190.417 Y161.488
G1 X209.583 Y180.653 E.80733
G1 X209.583 Y181.186
G1 X190.417 Y162.021 E.80733
G1 X190.417 Y162.554
G1 X209.583 Y181.72 E.80733
G1 X209.583 Y182.253
G1 X190.417 Y163.088 E.80733
M73 P85 R10
G1 X190.417 Y163.621
G1 X209.583 Y182.786 E.80733
G1 X209.583 Y183.319
G1 X190.417 Y164.154 E.80733
G1 X190.417 Y164.688
G1 X209.583 Y183.853 E.80733
G1 X209.583 Y184.386
G1 X190.417 Y165.221 E.80733
G1 X190.417 Y165.754
G1 X209.583 Y184.919 E.80733
G1 X209.583 Y185.453
G1 X190.417 Y166.287 E.80733
G1 X190.417 Y166.821
G1 X209.583 Y185.986 E.80733
G1 X209.583 Y186.519
G1 X190.417 Y167.354 E.80733
G1 X190.417 Y167.887
G1 X209.583 Y187.052 E.80733
G1 X209.583 Y187.586
G1 X190.417 Y168.42 E.80733
G1 X190.417 Y168.954
G1 X209.583 Y188.119 E.80733
G1 X209.583 Y188.652
G1 X190.417 Y169.487 E.80733
G1 X190.417 Y170.02
G1 X209.583 Y189.185 E.80733
G1 X209.583 Y189.719
G1 X190.417 Y170.553 E.80733
G1 X190.417 Y171.087
G1 X209.583 Y190.252 E.80733
G1 X209.583 Y190.785
G1 X190.417 Y171.62 E.80733
G1 X190.417 Y172.153
G1 X209.583 Y191.318 E.80733
G1 X209.583 Y191.852
G1 X190.417 Y172.686 E.80733
G1 X190.417 Y173.22
G1 X209.583 Y192.385 E.80733
G1 X209.583 Y192.918
G1 X190.417 Y173.753 E.80733
G1 X190.417 Y174.286
G1 X209.583 Y193.451 E.80733
G1 X209.583 Y193.985
G1 X190.417 Y174.819 E.80733
G1 X190.417 Y175.353
G1 X209.583 Y194.518 E.80733
G1 X209.583 Y195.051
G1 X190.417 Y175.886 E.80733
G1 X190.417 Y176.419
G1 X209.583 Y195.584 E.80733
G1 X209.583 Y196.118
G1 X190.417 Y176.952 E.80733
G1 X190.417 Y177.486
G1 X209.583 Y196.651 E.80733
G1 X209.583 Y197.184
G1 X190.417 Y178.019 E.80733
G1 X190.417 Y178.552
G1 X209.583 Y197.717 E.80733
G1 X209.583 Y198.251
G1 X190.417 Y179.085 E.80733
G1 X190.417 Y179.619
G1 X209.583 Y198.784 E.80733
G1 X209.583 Y199.317
G1 X190.417 Y180.152 E.80733
G1 X190.417 Y180.685
G1 X209.583 Y199.85 E.80733
G1 X209.583 Y200.384
G1 X190.417 Y181.218 E.80733
G1 X190.417 Y181.752
G1 X209.583 Y200.917 E.80733
G1 X209.583 Y201.45
G1 X190.417 Y182.285 E.80733
G1 X190.417 Y182.818
G1 X209.583 Y201.983 E.80733
G1 X209.583 Y202.517
G1 X190.417 Y183.352 E.80733
G1 X190.417 Y183.885
G1 X209.583 Y203.05 E.80733
G1 X209.583 Y203.583
G1 X190.417 Y184.418 E.80733
G1 X190.417 Y184.951
G1 X209.583 Y204.117 E.80733
G1 X209.583 Y204.65
G1 X190.417 Y185.485 E.80733
G1 X190.417 Y186.018
G1 X209.583 Y205.183 E.80733
G1 X209.583 Y205.716
G1 X190.417 Y186.551 E.80733
G1 X190.417 Y187.084
G1 X209.583 Y206.25 E.80733
G1 X209.583 Y206.783
G1 X190.417 Y187.618 E.80733
G1 X190.417 Y188.151
G1 X209.583 Y207.316 E.80733
G1 X209.583 Y207.849
G1 X202.133 Y200.4 E.31381
G1 X202.217 Y201.017
G1 X209.583 Y208.383 E.31027
G1 X209.583 Y208.916
G1 X202.16 Y201.493 E.31267
G1 X202.028 Y201.894
G1 X209.583 Y209.449 E.31824
G1 X209.583 Y209.982
G1 X201.839 Y202.239 E.3262
G1 X201.6 Y202.533
G1 X209.583 Y210.516 E.33628
G1 X209.116 Y210.583
G1 X201.316 Y202.782 E.32859
G1 X200.986 Y202.985
G1 X208.583 Y210.583 E.32003
G1 X208.05 Y210.583
G1 X200.602 Y203.135 E.31374
G1 X200.146 Y203.212
G1 X207.517 Y210.583 E.31048
G1 X206.983 Y210.583
G1 X199.575 Y203.174 E.31207
; WIPE_START
M204 S10000
G1 X200.989 Y204.589 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X198.45 Y202.583 Z3.4 F30000
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X206.45 Y210.583 E.337
; WIPE_START
M204 S10000
G1 X205.036 Y209.168 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X202.017 Y202.159 Z3.4 F30000
G1 X200.598 Y198.864 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X190.417 Y188.684 E.42884
G1 X190.417 Y189.217
G1 X199.984 Y198.784 E.403
G1 X199.505 Y198.838
G1 X190.417 Y189.751 E.38281
G1 X190.417 Y190.284
G1 X199.105 Y198.972 E.36597
G1 X198.763 Y199.162
G1 X190.417 Y190.817 E.35153
G1 X190.417 Y191.35
G1 X198.467 Y199.4 E.33911
G1 X198.217 Y199.683
M73 P85 R9
G1 X189.951 Y191.417 E.34819
G1 X189.418 Y191.417
G1 X198.015 Y200.014 E.36213
G1 X197.867 Y200.4
G1 X188.885 Y191.417 E.37838
G1 X188.351 Y191.417
G1 X197.788 Y200.854 E.39753
G1 X197.826 Y201.425
G1 X187.818 Y191.417 E.42158
G1 X187.285 Y191.417
G1 X198.365 Y202.497 E.46673
; WIPE_START
M204 S10000
G1 X196.95 Y201.083 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X202.189 Y206.633 Z3.4 F30000
G1 X205.917 Y210.583 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X186.752 Y191.417 E.80733
G1 X186.218 Y191.417
G1 X205.384 Y210.583 E.80733
G1 X204.85 Y210.583
G1 X185.685 Y191.417 E.80733
G1 X185.152 Y191.417
G1 X204.317 Y210.583 E.80733
G1 X203.784 Y210.583
G1 X184.619 Y191.417 E.80733
G1 X184.085 Y191.417
G1 X203.251 Y210.583 E.80733
G1 X202.717 Y210.583
G1 X183.552 Y191.417 E.80733
G1 X183.019 Y191.417
G1 X202.184 Y210.583 E.80733
G1 X201.651 Y210.583
G1 X182.486 Y191.417 E.80733
G1 X181.952 Y191.417
G1 X201.118 Y210.583 E.80733
G1 X200.584 Y210.583
G1 X181.419 Y191.417 E.80733
G1 X180.886 Y191.417
G1 X200.051 Y210.583 E.80733
G1 X199.518 Y210.583
G1 X180.353 Y191.417 E.80733
G1 X179.819 Y191.417
G1 X198.984 Y210.583 E.80733
G1 X198.451 Y210.583
G1 X179.286 Y191.417 E.80733
G1 X178.753 Y191.417
G1 X197.918 Y210.583 E.80733
G1 X197.385 Y210.583
G1 X178.219 Y191.417 E.80733
G1 X177.686 Y191.417
G1 X196.851 Y210.583 E.80733
G1 X196.318 Y210.583
G1 X177.153 Y191.417 E.80733
G1 X176.62 Y191.417
G1 X195.785 Y210.583 E.80733
G1 X195.252 Y210.583
G1 X176.086 Y191.417 E.80733
G1 X175.553 Y191.417
G1 X194.718 Y210.583 E.80733
G1 X194.185 Y210.583
G1 X175.02 Y191.417 E.80733
G1 X174.487 Y191.417
G1 X193.652 Y210.583 E.80733
G1 X193.119 Y210.583
G1 X173.953 Y191.417 E.80733
G1 X173.42 Y191.417
G1 X192.585 Y210.583 E.80733
G1 X192.052 Y210.583
G1 X172.887 Y191.417 E.80733
G1 X172.354 Y191.417
G1 X191.519 Y210.583 E.80733
G1 X190.986 Y210.583
G1 X171.82 Y191.417 E.80733
G1 X171.287 Y191.417
G1 X190.452 Y210.583 E.80733
G1 X189.919 Y210.583
G1 X170.754 Y191.417 E.80733
G1 X170.221 Y191.417
G1 X189.386 Y210.583 E.80733
G1 X188.853 Y210.583
G1 X169.687 Y191.417 E.80733
G1 X169.154 Y191.417
G1 X188.319 Y210.583 E.80733
G1 X187.786 Y210.583
G1 X168.621 Y191.417 E.80733
G1 X168.088 Y191.417
G1 X187.253 Y210.583 E.80733
G1 X186.72 Y210.583
G1 X167.554 Y191.417 E.80733
G1 X167.021 Y191.417
G1 X186.186 Y210.583 E.80733
G1 X185.653 Y210.583
G1 X166.488 Y191.417 E.80733
G1 X165.955 Y191.417
G1 X185.12 Y210.583 E.80733
G1 X184.587 Y210.583
G1 X165.421 Y191.417 E.80733
G1 X164.888 Y191.417
G1 X184.053 Y210.583 E.80733
G1 X183.52 Y210.583
G1 X164.355 Y191.417 E.80733
G1 X163.822 Y191.417
G1 X182.987 Y210.583 E.80733
G1 X182.454 Y210.583
G1 X163.288 Y191.417 E.80733
G1 X162.755 Y191.417
G1 X181.92 Y210.583 E.80733
G1 X181.387 Y210.583
G1 X162.222 Y191.417 E.80733
G1 X161.689 Y191.417
G1 X180.854 Y210.583 E.80733
G1 X180.32 Y210.583
G1 X161.155 Y191.417 E.80733
G1 X160.622 Y191.417
G1 X179.787 Y210.583 E.80733
G1 X179.254 Y210.583
G1 X160.089 Y191.417 E.80733
G1 X159.555 Y191.417
G1 X178.721 Y210.583 E.80733
G1 X178.187 Y210.583
G1 X159.022 Y191.417 E.80733
G1 X158.489 Y191.417
G1 X177.654 Y210.583 E.80733
G1 X177.121 Y210.583
G1 X157.956 Y191.417 E.80733
G1 X157.422 Y191.417
G1 X176.588 Y210.583 E.80733
G1 X176.054 Y210.583
G1 X156.889 Y191.417 E.80733
G1 X156.356 Y191.417
G1 X175.521 Y210.583 E.80733
G1 X174.988 Y210.583
G1 X155.823 Y191.417 E.80733
G1 X155.289 Y191.417
G1 X174.455 Y210.583 E.80733
G1 X173.921 Y210.583
G1 X154.756 Y191.417 E.80733
G1 X154.223 Y191.417
G1 X173.388 Y210.583 E.80733
G1 X172.855 Y210.583
G1 X153.69 Y191.417 E.80733
G1 X153.156 Y191.417
G1 X172.322 Y210.583 E.80733
G1 X171.788 Y210.583
G1 X152.623 Y191.417 E.80733
G1 X152.09 Y191.417
G1 X171.255 Y210.583 E.80733
G1 X170.722 Y210.583
G1 X151.557 Y191.417 E.80733
G1 X151.023 Y191.417
G1 X170.189 Y210.583 E.80733
G1 X169.655 Y210.583
G1 X150.49 Y191.417 E.80733
G1 X149.957 Y191.417
G1 X169.122 Y210.583 E.80733
G1 X168.589 Y210.583
G1 X149.424 Y191.417 E.80733
G1 X148.89 Y191.417
G1 X168.056 Y210.583 E.80733
G1 X167.522 Y210.583
G1 X148.357 Y191.417 E.80733
G1 X147.824 Y191.417
G1 X166.989 Y210.583 E.80733
G1 X166.456 Y210.583
G1 X147.291 Y191.417 E.80733
G1 X146.757 Y191.417
G1 X165.923 Y210.583 E.80733
G1 X165.389 Y210.583
G1 X146.224 Y191.417 E.80733
G1 X145.691 Y191.417
G1 X164.856 Y210.583 E.80733
G1 X164.323 Y210.583
G1 X145.158 Y191.417 E.80733
G1 X144.624 Y191.417
G1 X163.789 Y210.583 E.80733
G1 X163.256 Y210.583
G1 X144.091 Y191.417 E.80733
G1 X143.558 Y191.417
G1 X162.723 Y210.583 E.80733
G1 X162.19 Y210.583
G1 X143.024 Y191.417 E.80733
G1 X142.491 Y191.417
G1 X161.656 Y210.583 E.80733
G1 X161.123 Y210.583
G1 X141.958 Y191.417 E.80733
G1 X141.425 Y191.417
G1 X160.59 Y210.583 E.80733
G1 X160.057 Y210.583
G1 X140.891 Y191.417 E.80733
G1 X140.358 Y191.417
G1 X159.523 Y210.583 E.80733
G1 X158.99 Y210.583
G1 X139.825 Y191.417 E.80733
G1 X139.292 Y191.417
G1 X158.457 Y210.583 E.80733
G1 X157.924 Y210.583
G1 X138.758 Y191.417 E.80733
G1 X138.225 Y191.417
G1 X157.39 Y210.583 E.80733
G1 X156.857 Y210.583
G1 X137.692 Y191.417 E.80733
M73 P86 R9
G1 X137.159 Y191.417
G1 X156.324 Y210.583 E.80733
G1 X155.791 Y210.583
G1 X136.625 Y191.417 E.80733
G1 X136.092 Y191.417
G1 X155.257 Y210.583 E.80733
G1 X154.724 Y210.583
G1 X135.559 Y191.417 E.80733
G1 X135.026 Y191.417
G1 X154.191 Y210.583 E.80733
G1 X153.658 Y210.583
G1 X134.492 Y191.417 E.80733
G1 X133.959 Y191.417
G1 X153.124 Y210.583 E.80733
G1 X152.591 Y210.583
G1 X133.426 Y191.417 E.80733
G1 X132.893 Y191.417
G1 X152.058 Y210.583 E.80733
G1 X151.525 Y210.583
G1 X132.359 Y191.417 E.80733
G1 X131.826 Y191.417
G1 X150.991 Y210.583 E.80733
G1 X150.458 Y210.583
G1 X131.293 Y191.417 E.80733
G1 X130.76 Y191.417
G1 X149.925 Y210.583 E.80733
G1 X149.392 Y210.583
G1 X130.226 Y191.417 E.80733
G1 X129.693 Y191.417
G1 X148.858 Y210.583 E.80733
G1 X148.325 Y210.583
G1 X129.16 Y191.417 E.80733
G1 X128.627 Y191.417
G1 X147.792 Y210.583 E.80733
G1 X147.259 Y210.583
G1 X128.093 Y191.417 E.80733
G1 X127.56 Y191.417
G1 X146.725 Y210.583 E.80733
G1 X146.192 Y210.583
G1 X127.027 Y191.417 E.80733
G1 X126.494 Y191.417
G1 X145.659 Y210.583 E.80733
G1 X145.125 Y210.583
G1 X125.96 Y191.417 E.80733
G1 X125.427 Y191.417
G1 X144.592 Y210.583 E.80733
G1 X144.059 Y210.583
G1 X124.894 Y191.417 E.80733
G1 X124.36 Y191.417
G1 X143.526 Y210.583 E.80733
G1 X142.992 Y210.583
G1 X123.827 Y191.417 E.80733
G1 X123.294 Y191.417
G1 X142.459 Y210.583 E.80733
G1 X141.926 Y210.583
G1 X122.761 Y191.417 E.80733
G1 X122.227 Y191.417
G1 X141.393 Y210.583 E.80733
G1 X140.859 Y210.583
G1 X121.694 Y191.417 E.80733
G1 X121.161 Y191.417
G1 X128.612 Y198.869 E.31389
G1 X127.995 Y198.785
G1 X120.628 Y191.417 E.31034
G1 X120.094 Y191.417
G1 X127.513 Y198.836 E.31252
G1 X127.112 Y198.969
G1 X119.561 Y191.417 E.3181
G1 X119.028 Y191.417
G1 X126.769 Y199.158 E.32608
G1 X126.473 Y199.395
G1 X118.495 Y191.417 E.33607
G1 X117.961 Y191.417
G1 X126.221 Y199.677 E.34793
G1 X126.018 Y200.007
G1 X117.428 Y191.417 E.36185
G1 X116.895 Y191.417
G1 X125.869 Y200.392 E.37805
G1 X125.789 Y200.845
G1 X116.362 Y191.417 E.39714
G1 X115.828 Y191.417
G1 X125.823 Y201.412 E.42104
G1 X126.311 Y202.433
G1 X115.295 Y191.417 E.46404
; WIPE_START
M204 S10000
G1 X116.709 Y192.832 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.36 Y196.576 Z3.4 F30000
G1 X130.13 Y200.386 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X140.326 Y210.583 E.42953
G1 X139.793 Y210.583
G1 X130.218 Y201.007 E.40336
G1 X130.162 Y201.485
G1 X139.26 Y210.583 E.38322
G1 X138.726 Y210.583
G1 X130.031 Y201.887 E.36628
G1 X129.843 Y202.232
G1 X138.193 Y210.583 E.35175
G1 X137.66 Y210.583
G1 X129.605 Y202.527 E.33932
G1 X129.322 Y202.778
G1 X137.127 Y210.583 E.32877
G1 X136.593 Y210.583
G1 X128.993 Y202.982 E.32016
G1 X128.61 Y203.132
G1 X136.06 Y210.583 E.31385
G1 X135.527 Y210.583
G1 X128.156 Y203.212 E.31049
G1 X127.588 Y203.177
G1 X134.994 Y210.583 E.31198
G1 X134.46 Y210.583
G1 X126.573 Y202.695 E.33225
; WIPE_START
M204 S10000
G1 X127.987 Y204.109 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.48 Y198.825 Z3.4 F30000
G1 X114.762 Y191.417 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X133.927 Y210.583 E.80733
G1 X133.394 Y210.583
G1 X114.229 Y191.417 E.80733
G1 X113.695 Y191.417
G1 X132.861 Y210.583 E.80733
G1 X132.327 Y210.583
G1 X113.162 Y191.417 E.80733
G1 X112.629 Y191.417
G1 X131.794 Y210.583 E.80733
G1 X131.261 Y210.583
G1 X112.096 Y191.417 E.80733
G1 X111.562 Y191.417
G1 X130.728 Y210.583 E.80733
G1 X130.194 Y210.583
G1 X111.029 Y191.417 E.80733
G1 X110.496 Y191.417
G1 X129.661 Y210.583 E.80733
G1 X129.128 Y210.583
G1 X109.963 Y191.417 E.80733
G1 X109.429 Y191.417
G1 X128.594 Y210.583 E.80733
G1 X128.061 Y210.583
G1 X108.896 Y191.417 E.80733
G1 X108.363 Y191.417
G1 X127.528 Y210.583 E.80733
G1 X126.995 Y210.583
G1 X107.83 Y191.417 E.80733
G1 X107.296 Y191.417
G1 X126.461 Y210.583 E.80733
G1 X125.928 Y210.583
G1 X106.763 Y191.417 E.80733
G1 X106.23 Y191.417
G1 X125.395 Y210.583 E.80733
G1 X124.862 Y210.583
G1 X105.696 Y191.417 E.80733
G1 X105.163 Y191.417
G1 X124.328 Y210.583 E.80733
G1 X123.795 Y210.583
G1 X104.63 Y191.417 E.80733
G1 X104.097 Y191.417
G1 X123.262 Y210.583 E.80733
G1 X122.729 Y210.583
G1 X103.563 Y191.417 E.80733
G1 X103.03 Y191.417
G1 X122.195 Y210.583 E.80733
G1 X121.662 Y210.583
G1 X102.497 Y191.417 E.80733
G1 X101.964 Y191.417
G1 X121.129 Y210.583 E.80733
G1 X120.596 Y210.583
G1 X101.43 Y191.417 E.80733
G1 X100.897 Y191.417
G1 X120.062 Y210.583 E.80733
G1 X119.529 Y210.583
G1 X100.364 Y191.417 E.80733
G1 X99.831 Y191.417
G1 X118.996 Y210.583 E.80733
G1 X118.463 Y210.583
G1 X99.297 Y191.417 E.80733
G1 X98.764 Y191.417
G1 X117.929 Y210.583 E.80733
G1 X117.396 Y210.583
G1 X98.231 Y191.417 E.80733
G1 X97.698 Y191.417
G1 X116.863 Y210.583 E.80733
G1 X116.33 Y210.583
G1 X97.164 Y191.417 E.80733
G1 X96.631 Y191.417
G1 X115.796 Y210.583 E.80733
G1 X115.263 Y210.583
G1 X96.098 Y191.417 E.80733
G1 X95.565 Y191.417
G1 X114.73 Y210.583 E.80733
G1 X114.197 Y210.583
G1 X95.031 Y191.417 E.80733
G1 X94.498 Y191.417
G1 X113.663 Y210.583 E.80733
G1 X113.13 Y210.583
G1 X93.965 Y191.417 E.80733
G1 X93.432 Y191.417
G1 X112.597 Y210.583 E.80733
G1 X112.064 Y210.583
G1 X92.898 Y191.417 E.80733
G1 X92.365 Y191.417
G1 X111.53 Y210.583 E.80733
G1 X110.997 Y210.583
G1 X91.832 Y191.417 E.80733
G1 X91.299 Y191.417
G1 X110.464 Y210.583 E.80733
G1 X109.93 Y210.583
G1 X90.765 Y191.417 E.80733
G1 X90.232 Y191.417
G1 X109.397 Y210.583 E.80733
G1 X108.864 Y210.583
G1 X89.699 Y191.417 E.80733
G1 X89.165 Y191.417
G1 X108.331 Y210.583 E.80733
G1 X107.797 Y210.583
G1 X88.632 Y191.417 E.80733
G1 X88.099 Y191.417
G1 X107.264 Y210.583 E.80733
G1 X106.731 Y210.583
G1 X87.566 Y191.417 E.80733
G1 X87.032 Y191.417
G1 X106.198 Y210.583 E.80733
G1 X105.664 Y210.583
G1 X86.499 Y191.417 E.80733
G1 X85.966 Y191.417
G1 X105.131 Y210.583 E.80733
G1 X104.598 Y210.583
G1 X85.433 Y191.417 E.80733
G1 X84.899 Y191.417
G1 X104.065 Y210.583 E.80733
G1 X103.531 Y210.583
G1 X84.366 Y191.417 E.80733
G1 X83.833 Y191.417
G1 X102.998 Y210.583 E.80733
G1 X102.465 Y210.583
G1 X83.3 Y191.417 E.80733
G1 X82.766 Y191.417
G1 X101.932 Y210.583 E.80733
G1 X101.398 Y210.583
G1 X82.233 Y191.417 E.80733
G1 X81.7 Y191.417
G1 X100.865 Y210.583 E.80733
G1 X100.332 Y210.583
G1 X81.167 Y191.417 E.80733
G1 X80.633 Y191.417
G1 X99.799 Y210.583 E.80733
G1 X99.265 Y210.583
G1 X80.1 Y191.417 E.80733
G1 X79.567 Y191.417
G1 X98.732 Y210.583 E.80733
G1 X98.199 Y210.583
G1 X79.034 Y191.417 E.80733
G1 X78.5 Y191.417
G1 X97.666 Y210.583 E.80733
G1 X97.132 Y210.583
G1 X77.967 Y191.417 E.80733
G1 X77.434 Y191.417
G1 X96.599 Y210.583 E.80733
G1 X96.066 Y210.583
G1 X76.901 Y191.417 E.80733
G1 X76.367 Y191.417
G1 X95.533 Y210.583 E.80733
G1 X94.999 Y210.583
G1 X75.834 Y191.417 E.80733
G1 X75.301 Y191.417
G1 X94.466 Y210.583 E.80733
G1 X93.933 Y210.583
G1 X74.768 Y191.417 E.80733
G1 X74.234 Y191.417
G1 X93.399 Y210.583 E.80733
G1 X92.866 Y210.583
G1 X73.701 Y191.417 E.80733
G1 X73.168 Y191.417
G1 X92.333 Y210.583 E.80733
G1 X91.8 Y210.583
G1 X72.635 Y191.417 E.80733
G1 X72.101 Y191.417
G1 X91.266 Y210.583 E.80733
G1 X90.733 Y210.583
G1 X71.568 Y191.417 E.80733
G1 X71.035 Y191.417
G1 X90.2 Y210.583 E.80733
G1 X89.667 Y210.583
G1 X70.501 Y191.417 E.80733
G1 X69.968 Y191.417
G1 X89.133 Y210.583 E.80733
G1 X88.6 Y210.583
G1 X69.435 Y191.417 E.80733
G1 X68.902 Y191.417
G1 X88.067 Y210.583 E.80733
G1 X87.534 Y210.583
G1 X68.368 Y191.417 E.80733
G1 X67.835 Y191.417
G1 X87 Y210.583 E.80733
G1 X86.467 Y210.583
G1 X67.302 Y191.417 E.80733
G1 X66.769 Y191.417
G1 X85.934 Y210.583 E.80733
G1 X85.401 Y210.583
G1 X66.235 Y191.417 E.80733
G1 X65.702 Y191.417
G1 X84.867 Y210.583 E.80733
G1 X84.334 Y210.583
G1 X46.417 Y172.666 E1.59723
G1 X46.417 Y173.199
G1 X83.801 Y210.583 E1.57476
G1 X83.268 Y210.583
G1 X46.417 Y173.732 E1.5523
M73 P86 R8
G1 X46.417 Y174.266
G1 X82.734 Y210.583 E1.52984
G1 X82.201 Y210.583
G1 X46.417 Y174.799 E1.50737
G1 X46.417 Y175.332
G1 X81.668 Y210.583 E1.48491
G1 X81.135 Y210.583
G1 X46.417 Y175.865 E1.46245
G1 X46.417 Y176.399
G1 X80.601 Y210.583 E1.43998
G1 X80.068 Y210.583
G1 X46.417 Y176.932 E1.41752
G1 X46.417 Y177.465
G1 X79.535 Y210.583 E1.39506
G1 X79.002 Y210.583
G1 X46.417 Y177.998 E1.37259
G1 X46.417 Y178.532
G1 X78.468 Y210.583 E1.35013
G1 X77.935 Y210.583
G1 X46.417 Y179.065 E1.32767
G1 X46.417 Y179.598
G1 X77.402 Y210.583 E1.3052
G1 X76.869 Y210.583
G1 X46.417 Y180.131 E1.28274
G1 X46.417 Y180.665
G1 X76.335 Y210.583 E1.26028
G1 X75.802 Y210.583
G1 X46.417 Y181.198 E1.23781
M73 P87 R8
G1 X46.417 Y181.731
G1 X75.269 Y210.583 E1.21535
G1 X74.735 Y210.583
G1 X46.417 Y182.265 E1.19289
G1 X46.417 Y182.798
G1 X74.202 Y210.583 E1.17042
G1 X73.669 Y210.583
G1 X46.417 Y183.331 E1.14796
G1 X46.417 Y183.864
G1 X73.136 Y210.583 E1.1255
G1 X72.602 Y210.583
G1 X46.417 Y184.398 E1.10304
G1 X46.417 Y184.931
G1 X72.069 Y210.583 E1.08057
G1 X71.536 Y210.583
G1 X46.417 Y185.464 E1.05811
G1 X46.417 Y185.997
G1 X71.003 Y210.583 E1.03565
G1 X70.469 Y210.583
G1 X46.417 Y186.531 E1.01318
G1 X46.417 Y187.064
G1 X69.936 Y210.583 E.99072
G1 X69.403 Y210.583
G1 X46.417 Y187.597 E.96826
G1 X46.417 Y188.13
G1 X68.87 Y210.583 E.94579
G1 X68.336 Y210.583
G1 X58.126 Y200.372 E.43011
G1 X58.218 Y200.997
G1 X67.803 Y210.583 E.40378
G1 X67.27 Y210.583
G1 X58.164 Y201.477 E.38357
G1 X58.035 Y201.881
G1 X66.737 Y210.583 E.36657
G1 X66.203 Y210.583
G1 X57.847 Y202.226 E.35202
G1 X57.61 Y202.522
G1 X65.67 Y210.583 E.33955
G1 X65.137 Y210.583
G1 X57.328 Y202.774 E.32895
G1 X57 Y202.979
G1 X64.604 Y210.583 E.3203
G1 X64.07 Y210.583
G1 X56.617 Y203.129 E.31396
G1 X56.166 Y203.212
G1 X63.537 Y210.583 E.3105
G1 X63.004 Y210.583
G1 X55.6 Y203.179 E.31188
G1 X54.623 Y202.736
G1 X62.471 Y210.583 E.33055
; WIPE_START
M204 S10000
G1 X61.056 Y209.168 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X58.04 Y202.157 Z3.4 F30000
G1 X56.628 Y198.874 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X46.417 Y188.664 E.43011
G1 X46.417 Y189.197
G1 X56.005 Y198.785 E.40389
G1 X55.522 Y198.835
G1 X46.417 Y189.73 E.38354
G1 X46.417 Y190.263
G1 X55.12 Y198.966 E.36659
G1 X54.775 Y199.154
G1 X46.417 Y190.797 E.35206
G1 X46.417 Y191.33
G1 X54.478 Y199.39 E.33954
G1 X54.225 Y199.671
G1 X46.417 Y191.863 E.3289
G1 X46.417 Y192.396
G1 X54.022 Y200.001 E.32033
G1 X53.872 Y200.384
G1 X46.417 Y192.93 E.31402
G1 X46.417 Y193.463
G1 X53.79 Y200.836 E.31058
G1 X53.821 Y201.4
G1 X46.417 Y193.996 E.31187
G1 X46.417 Y194.529
G1 X54.258 Y202.37 E.33027
; WIPE_START
M204 S10000
G1 X52.843 Y200.955 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.218 Y195.797 Z3.4 F30000
G1 X46.417 Y195.063 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X61.937 Y210.583 E.65377
G1 X61.404 Y210.583
G1 X46.417 Y195.596 E.63131
G1 X46.417 Y196.129
G1 X60.871 Y210.583 E.60884
G1 X60.338 Y210.583
G1 X46.417 Y196.662 E.58638
G1 X46.417 Y197.196
G1 X59.804 Y210.583 E.56392
G1 X59.271 Y210.583
G1 X46.417 Y197.729 E.54145
G1 X46.417 Y198.262
G1 X58.738 Y210.583 E.51899
G1 X58.205 Y210.583
G1 X46.417 Y198.795 E.49653
G1 X46.417 Y199.329
G1 X57.671 Y210.583 E.47406
G1 X57.138 Y210.583
G1 X46.417 Y199.862 E.4516
G1 X46.417 Y200.395
G1 X56.605 Y210.583 E.42914
G1 X56.071 Y210.583
G1 X46.417 Y200.929 E.40667
G1 X46.417 Y201.462
G1 X55.538 Y210.583 E.38421
G1 X55.005 Y210.583
G1 X46.417 Y201.995 E.36175
G1 X46.417 Y202.528
G1 X54.472 Y210.583 E.33928
G1 X53.938 Y210.583
G1 X46.417 Y203.062 E.31682
G1 X46.417 Y203.595
G1 X53.405 Y210.583 E.29436
G1 X52.872 Y210.583
G1 X46.417 Y204.128 E.27189
G1 X46.417 Y204.661
G1 X52.339 Y210.583 E.24943
G1 X51.805 Y210.583
G1 X46.417 Y205.195 E.22697
G1 X46.417 Y205.728
G1 X51.272 Y210.583 E.20451
G1 X50.739 Y210.583
G1 X46.417 Y206.261 E.18204
G1 X46.417 Y206.794
G1 X50.206 Y210.583 E.15958
G1 X49.672 Y210.583
G1 X46.417 Y207.328 E.13712
G1 X46.417 Y207.861
G1 X49.139 Y210.583 E.11465
G1 X48.606 Y210.583
G1 X46.417 Y208.394 E.09219
G1 X46.417 Y208.927
G1 X48.073 Y210.583 E.06973
G1 X47.539 Y210.583
G1 X46.417 Y209.461 E.04726
G1 X46.417 Y209.994
G1 X47.006 Y210.583 E.0248
; WIPE_START
M204 S10000
G1 X46.417 Y209.994 E-.31637
G1 X46.417 Y209.461 E-.20264
G1 X46.866 Y209.909 E-.24099
; WIPE_END
G1 E-.04 F1800
G1 X47.625 Y202.314 Z3.4 F30000
G1 X55.044 Y128.091 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.196305
G1 F15000
G1 X54.864 Y127.96 E.00269
; LINE_WIDTH: 0.151654
G1 X54.69 Y127.819 E.00193
; LINE_WIDTH: 0.109326
G1 X54.215 Y127.35 E.0035
; LINE_WIDTH: 0.141453
G1 X54.071 Y127.175 E.00176
; LINE_WIDTH: 0.175819
G1 X53.991 Y127.068 E.00141
; LINE_WIDTH: 0.201708
G1 X53.91 Y126.961 E.00168
; WIPE_START
G1 X53.991 Y127.068 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X56.498 Y123.841 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.143136
G1 F15000
G1 X56.272 Y123.724 E.00202
; WIPE_START
G1 X56.498 Y123.841 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X58.07 Y125.004 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.211454
G1 F15000
G1 X58.001 Y124.906 E.0016
; LINE_WIDTH: 0.192339
G1 X57.932 Y124.819 E.0013
; LINE_WIDTH: 0.165616
G1 X57.86 Y124.728 E.00112
; LINE_WIDTH: 0.130105
G1 X57.559 Y124.399 E.00307
G1 X57.228 Y124.104 E.00305
; LINE_WIDTH: 0.164015
G1 X57.224 Y124.1 E.00006
; LINE_WIDTH: 0.177466
G1 X57.146 Y124.04 E.00104
; LINE_WIDTH: 0.188302
G1 X57.068 Y123.981 E.00113
G1 X56.924 Y124.002 E.00167
; WIPE_START
G1 X57.068 Y123.981 E-.45418
G1 X57.146 Y124.04 E-.30582
; WIPE_END
G1 E-.04 F1800
G1 X56.896 Y131.669 Z3.4 F30000
G1 X54.563 Y202.796 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.23704
G1 F15000
G1 X54.198 Y202.43 E.00793
G1 X53.905 Y201.732 F30000
; LINE_WIDTH: 0.176645
G1 F15000
G3 X53.755 Y201.465 I5.282 J-3.122 E.00323
; WIPE_START
G1 X53.905 Y201.732 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X53.864 Y200.417 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0953689
G1 F15000
G2 X53.781 Y200.56 I2.795 J1.706 E.00068
; WIPE_START
G1 X53.864 Y200.417 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X57.028 Y199.034 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.107869
G1 F15000
G1 X56.928 Y198.965 E.00062
; LINE_WIDTH: 0.159278
G2 X56.694 Y198.808 I-3.35 J4.743 E.00259
; WIPE_START
G1 X56.928 Y198.965 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X58.193 Y200.305 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.145487
G1 F15000
G1 X58.072 Y200.124 E.00177
; LINE_WIDTH: 0.130421
G1 X58.017 Y200.046 E.00066
; LINE_WIDTH: 0.102257
G1 X57.962 Y199.968 E.00045
; WIPE_START
G1 X58.017 Y200.046 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X56.092 Y203.286 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0912167
G1 F15000
G1 X55.885 Y203.197 E.00086
; WIPE_START
G1 X56.092 Y203.286 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X63.712 Y202.841 Z3.4 F30000
G1 X129.009 Y199.025 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.105992
G1 F15000
G1 X128.918 Y198.963 E.00055
; LINE_WIDTH: 0.153385
G2 X128.679 Y198.803 I-3.332 J4.726 E.00251
; WIPE_START
G1 X128.918 Y198.963 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.807 Y200.827 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0914783
G1 F15000
G1 X125.714 Y201.036 E.00088
; WIPE_START
G1 X125.807 Y200.827 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.511 Y202.757 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.239377
G1 F15000
G1 X126.318 Y202.566 E.00421
G1 X126.321 Y202.423 E.00222
; WIPE_START
G1 X126.318 Y202.566 E-.26277
G1 X126.511 Y202.757 E-.49723
; WIPE_END
G1 E-.04 F1800
G1 X127.516 Y203.249 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0950976
G1 F15000
G3 X127.257 Y203.087 I3.169 J-5.363 E.00126
; WIPE_START
G1 X127.516 Y203.249 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.29 Y200.935 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0974551
G1 F15000
G2 X130.198 Y200.743 I-3.636 J1.618 E.00092
G1 X130.198 Y200.317 F30000
; LINE_WIDTH: 0.138081
G1 F15000
G1 X130.069 Y200.125 E.00174
; LINE_WIDTH: 0.112662
G1 X129.971 Y199.988 E.00093
G1 X130.174 Y200.164 F30000
; LINE_WIDTH: 0.102964
G1 F15000
G1 X130.116 Y200.399 E.00115
; WIPE_START
G1 X130.174 Y200.164 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137.806 Y200.041 Z3.4 F30000
G1 X200.991 Y199.017 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.104128
G1 F15000
G1 X200.908 Y198.96 E.00048
; LINE_WIDTH: 0.147308
G2 X200.665 Y198.797 I-3.576 J5.087 E.00242
G1 X200.248 Y198.8 F30000
; LINE_WIDTH: 0.131447
G1 F15000
G1 X200.056 Y198.712 E.00147
; WIPE_START
G1 X200.248 Y198.8 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X197.914 Y201.762 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.189062
G1 F15000
G1 X197.797 Y201.559 E.00271
G1 X197.84 Y201.411 E.00177
; WIPE_START
G1 X197.797 Y201.559 E-.3009
G1 X197.914 Y201.762 E-.4591
; WIPE_END
G1 E-.04 F1800
G1 X199.504 Y203.246 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.101756
G1 F15000
G3 X199.24 Y203.081 I3.178 J-5.369 E.00145
G1 X199.588 Y203.162 F30000
; LINE_WIDTH: 0.130771
G1 F15000
G1 X199.361 Y203.227 E.00164
G1 X200.073 Y203.286 F30000
; LINE_WIDTH: 0.108019
G1 F15000
G1 X199.864 Y203.197 E.00117
; WIPE_START
G1 X200.073 Y203.286 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X202.247 Y201.314 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0907534
G1 F15000
G1 X202.165 Y201.465 E.00065
; WIPE_START
G1 X202.247 Y201.314 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X202.202 Y200.33 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.1224
G1 F15000
G2 X201.981 Y200.008 I-6.461 J4.194 E.00246
G1 X202.178 Y200.178 F30000
; LINE_WIDTH: 0.119524
G1 F15000
G1 X202.12 Y200.412 E.00146
; WIPE_START
G1 X202.178 Y200.178 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X202.169 Y192.546 Z3.4 F30000
G1 X202.089 Y125.043 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.203806
G1 F15000
G1 X201.994 Y124.91 E.00208
; LINE_WIDTH: 0.177665
G1 X201.926 Y124.823 E.00117
; LINE_WIDTH: 0.151032
G1 X201.855 Y124.733 E.00098
; LINE_WIDTH: 0.115616
G1 X201.554 Y124.405 E.00255
G1 X201.224 Y124.11 E.00254
; LINE_WIDTH: 0.149382
G1 X201.22 Y124.106 E.00004
; LINE_WIDTH: 0.164366
G1 X201.132 Y124.039 E.00106
; LINE_WIDTH: 0.202118
G1 X200.959 Y123.913 E.00269
G1 X200.472 Y123.836 F30000
; LINE_WIDTH: 0.127233
G1 F15000
G1 X200.249 Y123.72 E.00167
; WIPE_START
G1 X200.472 Y123.836 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X197.841 Y126.498 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.178472
G1 F15000
G1 X197.758 Y126.337 E.00194
G1 X197.808 Y126.19 E.00167
; WIPE_START
G1 X197.758 Y126.337 E-.35168
G1 X197.841 Y126.498 E-.40832
; WIPE_END
G1 E-.04 F1800
G1 X199.007 Y128.073 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.204642
G1 F15000
G1 X198.861 Y127.966 E.00232
; LINE_WIDTH: 0.166216
G1 X198.685 Y127.824 E.0022
; LINE_WIDTH: 0.123813
G1 X198.209 Y127.354 E.00428
; LINE_WIDTH: 0.156137
G1 X198.065 Y127.179 E.00203
; LINE_WIDTH: 0.197849
G1 X197.927 Y126.995 E.00282
; WIPE_START
G1 X198.065 Y127.179 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X198.192 Y119.548 Z3.4 F30000
G1 X199.3 Y53.194 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.11824
G1 F15000
G3 X198.966 Y52.96 I4.58 J-6.865 E.00243
; WIPE_START
G1 X199.3 Y53.194 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X200.45 Y53.169 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.114508
G1 F15000
G1 X200.295 Y53.249 E.00099
; WIPE_START
G1 X200.45 Y53.169 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X201.801 Y49.565 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.236819
G1 F15000
G1 X201.426 Y49.193 E.00809
G1 X200.732 Y48.907 F30000
; LINE_WIDTH: 0.143288
G1 F15000
G1 X200.465 Y48.751 E.00246
; WIPE_START
G1 X200.732 Y48.907 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X198.039 Y52.032 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0965347
G1 F15000
G1 X197.99 Y51.966 E.00035
; LINE_WIDTH: 0.126768
G1 X197.928 Y51.874 E.00074
; LINE_WIDTH: 0.171179
G1 X197.861 Y51.774 E.00121
; LINE_WIDTH: 0.197571
G1 X197.813 Y51.694 E.00115
; WIPE_START
G1 X197.861 Y51.774 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X190.23 Y51.928 Z3.4 F30000
G1 X127.313 Y53.199 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.1128
G1 F15000
G3 X126.987 Y52.97 I4.217 J-6.368 E.0022
; WIPE_START
G1 X127.313 Y53.199 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.748 Y48.912 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.151073
G1 F15000
G1 X128.478 Y48.754 E.00267
; WIPE_START
G1 X128.748 Y48.912 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.027 Y52.01 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0927526
G1 F15000
G1 X125.993 Y51.965 E.00022
; LINE_WIDTH: 0.119251
G1 X125.931 Y51.872 E.00067
; LINE_WIDTH: 0.163571
G1 X125.865 Y51.773 E.00113
; LINE_WIDTH: 0.193709
G1 X125.808 Y51.679 E.00131
; WIPE_START
G1 X125.865 Y51.773 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.845 Y58.783 Z3.4 F30000
G1 X65.696 Y191.423 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.161002
G1 F15000
G1 X65.569 Y191.457 E.00123
G1 X65.543 Y191.431 E.00034
G1 X65.577 Y191.304 E.00123
; WIPE_START
G1 X65.543 Y191.431 E-.33428
G1 X65.569 Y191.457 E-.09143
G1 X65.696 Y191.423 E-.33428
; WIPE_END
G1 E-.04 F1800
G1 X70.965 Y185.901 Z3.4 F30000
G1 X190.423 Y60.696 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.161029
G1 F15000
G1 X190.457 Y60.569 E.00123
G1 X190.431 Y60.543 E.00034
G1 X190.304 Y60.577 E.00123
; WIPE_START
G1 X190.431 Y60.543 E-.33398
G1 X190.457 Y60.569 E-.092
G1 X190.423 Y60.696 E-.33401
; WIPE_END
G1 E-.04 F1800
G1 X182.802 Y60.274 Z3.4 F30000
G1 X55.327 Y53.204 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.106982
G1 F15000
G3 X55.008 Y52.981 I4.28 J-6.46 E.00197
; WIPE_START
G1 X55.327 Y53.204 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X54.015 Y51.987 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0889137
G1 F15000
G1 X53.997 Y51.963 E.00011
; LINE_WIDTH: 0.111735
G1 X53.935 Y51.871 E.00061
; LINE_WIDTH: 0.155968
G1 X53.869 Y51.772 E.00106
; LINE_WIDTH: 0.18986
G1 X53.803 Y51.664 E.00146
; WIPE_START
G1 X53.869 Y51.772 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X56.764 Y48.917 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.158741
G1 F15000
G1 X56.491 Y48.757 E.00289
; WIPE_START
G1 X56.764 Y48.917 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X64.381 Y48.428 Z3.4 F30000
G1 X117.77 Y45 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.50333
G1 F7819.118
G1 X138.23 Y45 E.74413
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7819.118
G1 X136.23 Y45 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/58
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
M106 S226.95
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
G1 X117.416 Y45.584
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1230
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1230
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1230
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1230
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.81 Y45.19 Z3.6 F30000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423185
G1 F1230
G1 X138.19 Y45.19 E.61219
G1 X138.19 Y44.81 E.01142
G1 X117.81 Y44.81 E.61219
G1 X117.81 Y45.13 E.00962
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9467.083
G1 X117.81 Y44.81 E-.1217
G1 X119.49 Y44.81 E-.6383
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/58
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
G1 X117.416 Y45.584
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1226
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1226
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1226
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1226
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.81 Y45.19 Z3.8 F30000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423185
G1 F1226
G1 X138.19 Y45.19 E.61219
G1 X138.19 Y44.81 E.01142
G1 X117.81 Y44.81 E.61219
G1 X117.81 Y45.13 E.00962
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9467.083
G1 X117.81 Y44.81 E-.1217
G1 X119.49 Y44.81 E-.6383
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/58
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
M106 S229.5
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
G1 X117.416 Y45.584
G1 Z3.6
M73 P88 R8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1200
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.869 Y44.78 Z4 F30000
G1 X136.023 Y44.764 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X134.395 Y44.764 E.05236
G1 X133.924 Y45.236 E.02142
G1 X133.59 Y45.236 E.01074
G1 X133.119 Y44.764 E.02142
G1 X128.638 Y44.764 E.14409
G1 X128.167 Y45.236 E.02142
G1 X127.833 Y45.236 E.01074
G1 X127.362 Y44.764 E.02142
G1 X122.881 Y44.764 E.14409
G1 X122.41 Y45.236 E.02142
G1 X122.076 Y45.236 E.01074
G1 X121.605 Y44.764 E.02142
G1 X119.977 Y44.764 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X121.605 Y44.764 E-.61876
G1 X121.868 Y45.027 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/58
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
G1 X117.416 Y45.584
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
M73 P88 R7
G1 F1200
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.977 Y44.764 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X121.605 Y44.764 E.05236
G1 X122.076 Y45.236 E.02142
G1 X122.41 Y45.236 E.01074
G1 X122.881 Y44.764 E.02142
G1 X127.362 Y44.764 E.14409
G1 X127.833 Y45.236 E.02142
G1 X128.167 Y45.236 E.01074
G1 X128.638 Y44.764 E.02142
G1 X133.119 Y44.764 E.14409
G1 X133.59 Y45.236 E.02142
G1 X133.924 Y45.236 E.01074
G1 X134.395 Y44.764 E.02142
G1 X136.023 Y44.764 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X134.395 Y44.764 E-.61876
G1 X134.132 Y45.027 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/58
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
G1 X117.416 Y45.584
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1200
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.869 Y44.78 Z4.4 F30000
G1 X136.023 Y44.764 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X134.395 Y44.764 E.05236
G1 X133.924 Y45.236 E.02142
G1 X133.59 Y45.236 E.01074
G1 X133.119 Y44.764 E.02142
G1 X128.638 Y44.764 E.14409
G1 X128.167 Y45.236 E.02142
G1 X127.833 Y45.236 E.01074
G1 X127.362 Y44.764 E.02142
G1 X122.881 Y44.764 E.14409
G1 X122.41 Y45.236 E.02142
G1 X122.076 Y45.236 E.01074
G1 X121.605 Y44.764 E.02142
G1 X119.977 Y44.764 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X121.605 Y44.764 E-.61876
G1 X121.868 Y45.027 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/58
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
G1 X117.416 Y45.584
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1200
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
M73 P89 R7
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.977 Y44.764 Z4.6 F30000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X121.605 Y44.764 E.05236
G1 X122.076 Y45.236 E.02142
G1 X122.41 Y45.236 E.01074
G1 X122.881 Y44.764 E.02142
G1 X127.362 Y44.764 E.14409
G1 X127.833 Y45.236 E.02142
G1 X128.167 Y45.236 E.01074
G1 X128.638 Y44.764 E.02142
G1 X133.119 Y44.764 E.14409
G1 X133.59 Y45.236 E.02142
G1 X133.924 Y45.236 E.01074
G1 X134.395 Y44.764 E.02142
G1 X136.023 Y44.764 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X134.395 Y44.764 E-.61876
G1 X134.132 Y45.027 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/58
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
G1 X117.416 Y45.584
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1200
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.869 Y44.78 Z4.8 F30000
G1 X136.023 Y44.764 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X134.395 Y44.764 E.05236
G1 X133.924 Y45.236 E.02142
G1 X133.59 Y45.236 E.01074
G1 X133.119 Y44.764 E.02142
G1 X128.638 Y44.764 E.14409
G1 X128.167 Y45.236 E.02142
G1 X127.833 Y45.236 E.01074
G1 X127.362 Y44.764 E.02142
G1 X122.881 Y44.764 E.14409
G1 X122.41 Y45.236 E.02142
G1 X122.076 Y45.236 E.01074
G1 X121.605 Y44.764 E.02142
G1 X119.977 Y44.764 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X121.605 Y44.764 E-.61876
G1 X121.868 Y45.027 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/58
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
G17
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
G1 X117.416 Y45.584
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1200
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.977 Y44.764 Z5 F30000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X121.605 Y44.764 E.05236
G1 X122.076 Y45.236 E.02142
G1 X122.41 Y45.236 E.01074
G1 X122.881 Y44.764 E.02142
G1 X127.362 Y44.764 E.14409
G1 X127.833 Y45.236 E.02142
G1 X128.167 Y45.236 E.01074
G1 X128.638 Y44.764 E.02142
G1 X133.119 Y44.764 E.14409
G1 X133.59 Y45.236 E.02142
G1 X133.924 Y45.236 E.01074
G1 X134.395 Y44.764 E.02142
G1 X136.023 Y44.764 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X134.395 Y44.764 E-.61876
G1 X134.132 Y45.027 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/58
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
G1 X117.416 Y45.584
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1200
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
M73 P89 R6
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.869 Y44.78 Z5.2 F30000
G1 X136.023 Y44.764 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X134.395 Y44.764 E.05236
G1 X133.924 Y45.236 E.02142
G1 X133.59 Y45.236 E.01074
G1 X133.119 Y44.764 E.02142
G1 X128.638 Y44.764 E.14409
G1 X128.167 Y45.236 E.02142
G1 X127.833 Y45.236 E.01074
G1 X127.362 Y44.764 E.02142
G1 X122.881 Y44.764 E.14409
G1 X122.41 Y45.236 E.02142
G1 X122.076 Y45.236 E.01074
G1 X121.605 Y44.764 E.02142
G1 X119.977 Y44.764 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X121.605 Y44.764 E-.61876
G1 X121.868 Y45.027 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/58
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
G1 X117.416 Y45.584
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1200
M73 P90 R6
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.977 Y44.764 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X121.605 Y44.764 E.05236
G1 X122.076 Y45.236 E.02142
G1 X122.41 Y45.236 E.01074
G1 X122.881 Y44.764 E.02142
G1 X127.362 Y44.764 E.14409
G1 X127.833 Y45.236 E.02142
G1 X128.167 Y45.236 E.01074
G1 X128.638 Y44.764 E.02142
G1 X133.119 Y44.764 E.14409
G1 X133.59 Y45.236 E.02142
G1 X133.924 Y45.236 E.01074
G1 X134.395 Y44.764 E.02142
G1 X136.023 Y44.764 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X134.395 Y44.764 E-.61876
G1 X134.132 Y45.027 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/58
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
G1 X117.416 Y45.584
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1200
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.869 Y44.78 Z5.6 F30000
G1 X136.023 Y44.764 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X134.395 Y44.764 E.05236
G1 X133.924 Y45.236 E.02142
G1 X133.59 Y45.236 E.01074
G1 X133.119 Y44.764 E.02142
G1 X128.638 Y44.764 E.14409
G1 X128.167 Y45.236 E.02142
G1 X127.833 Y45.236 E.01074
G1 X127.362 Y44.764 E.02142
G1 X122.881 Y44.764 E.14409
G1 X122.41 Y45.236 E.02142
G1 X122.076 Y45.236 E.01074
G1 X121.605 Y44.764 E.02142
G1 X119.977 Y44.764 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X121.605 Y44.764 E-.61876
G1 X121.868 Y45.027 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/58
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
G1 X117.416 Y45.584
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1200
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.977 Y44.764 Z5.8 F30000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X121.605 Y44.764 E.05236
G1 X122.076 Y45.236 E.02142
G1 X122.41 Y45.236 E.01074
G1 X122.881 Y44.764 E.02142
G1 X127.362 Y44.764 E.14409
G1 X127.833 Y45.236 E.02142
G1 X128.167 Y45.236 E.01074
G1 X128.638 Y44.764 E.02142
G1 X133.119 Y44.764 E.14409
G1 X133.59 Y45.236 E.02142
G1 X133.924 Y45.236 E.01074
G1 X134.395 Y44.764 E.02142
G1 X136.023 Y44.764 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X134.395 Y44.764 E-.61876
G1 X134.132 Y45.027 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/58
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
G1 X117.416 Y45.584
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1200
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
M73 P91 R6
G1 X123.869 Y44.78 Z6 F30000
G1 X136.023 Y44.764 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X134.395 Y44.764 E.05236
G1 X133.924 Y45.236 E.02142
G1 X133.59 Y45.236 E.01074
G1 X133.119 Y44.764 E.02142
G1 X128.638 Y44.764 E.14409
G1 X128.167 Y45.236 E.02142
G1 X127.833 Y45.236 E.01074
G1 X127.362 Y44.764 E.02142
G1 X122.881 Y44.764 E.14409
G1 X122.41 Y45.236 E.02142
G1 X122.076 Y45.236 E.01074
G1 X121.605 Y44.764 E.02142
G1 X119.977 Y44.764 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X121.605 Y44.764 E-.61876
G1 X121.868 Y45.027 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/58
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
G1 X117.416 Y45.584
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1200
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.977 Y44.764 Z6.2 F30000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
M73 P91 R5
G1 X121.605 Y44.764 E.05236
G1 X122.076 Y45.236 E.02142
G1 X122.41 Y45.236 E.01074
G1 X122.881 Y44.764 E.02142
G1 X127.362 Y44.764 E.14409
G1 X127.833 Y45.236 E.02142
G1 X128.167 Y45.236 E.01074
G1 X128.638 Y44.764 E.02142
G1 X133.119 Y44.764 E.14409
G1 X133.59 Y45.236 E.02142
G1 X133.924 Y45.236 E.01074
G1 X134.395 Y44.764 E.02142
G1 X136.023 Y44.764 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X134.395 Y44.764 E-.61876
G1 X134.132 Y45.027 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/58
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
G1 X117.416 Y45.584
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1200
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.869 Y44.78 Z6.4 F30000
G1 X136.023 Y44.764 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X134.395 Y44.764 E.05236
G1 X133.924 Y45.236 E.02142
G1 X133.59 Y45.236 E.01074
G1 X133.119 Y44.764 E.02142
G1 X128.638 Y44.764 E.14409
G1 X128.167 Y45.236 E.02142
G1 X127.833 Y45.236 E.01074
G1 X127.362 Y44.764 E.02142
G1 X122.881 Y44.764 E.14409
G1 X122.41 Y45.236 E.02142
G1 X122.076 Y45.236 E.01074
G1 X121.605 Y44.764 E.02142
G1 X119.977 Y44.764 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X121.605 Y44.764 E-.61876
G1 X121.868 Y45.027 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/58
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
G1 X117.416 Y45.584
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1200
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.977 Y44.764 Z6.6 F30000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X121.605 Y44.764 E.05236
G1 X122.076 Y45.236 E.02142
G1 X122.41 Y45.236 E.01074
G1 X122.881 Y44.764 E.02142
G1 X127.362 Y44.764 E.14409
G1 X127.833 Y45.236 E.02142
G1 X128.167 Y45.236 E.01074
G1 X128.638 Y44.764 E.02142
G1 X133.119 Y44.764 E.14409
G1 X133.59 Y45.236 E.02142
G1 X133.924 Y45.236 E.01074
G1 X134.395 Y44.764 E.02142
G1 X136.023 Y44.764 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X134.395 Y44.764 E-.61876
G1 X134.132 Y45.027 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/58
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
G1 X117.416 Y45.584
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1200
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
M73 P92 R5
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.869 Y44.78 Z6.8 F30000
G1 X136.023 Y44.764 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X134.395 Y44.764 E.05236
G1 X133.924 Y45.236 E.02142
G1 X133.59 Y45.236 E.01074
G1 X133.119 Y44.764 E.02142
G1 X128.638 Y44.764 E.14409
G1 X128.167 Y45.236 E.02142
G1 X127.833 Y45.236 E.01074
G1 X127.362 Y44.764 E.02142
G1 X122.881 Y44.764 E.14409
G1 X122.41 Y45.236 E.02142
G1 X122.076 Y45.236 E.01074
G1 X121.605 Y44.764 E.02142
G1 X119.977 Y44.764 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X121.605 Y44.764 E-.61876
G1 X121.868 Y45.027 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/58
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
G1 X117.416 Y45.584
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1200
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.977 Y44.764 Z7 F30000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X121.605 Y44.764 E.05236
G1 X122.076 Y45.236 E.02142
G1 X122.41 Y45.236 E.01074
G1 X122.881 Y44.764 E.02142
G1 X127.362 Y44.764 E.14409
G1 X127.833 Y45.236 E.02142
G1 X128.167 Y45.236 E.01074
G1 X128.638 Y44.764 E.02142
G1 X133.119 Y44.764 E.14409
G1 X133.59 Y45.236 E.02142
G1 X133.924 Y45.236 E.01074
G1 X134.395 Y44.764 E.02142
G1 X136.023 Y44.764 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X134.395 Y44.764 E-.61876
G1 X134.132 Y45.027 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/58
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
G1 X117.416 Y45.584
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1200
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.869 Y44.78 Z7.2 F30000
G1 X136.023 Y44.764 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X134.395 Y44.764 E.05236
G1 X133.924 Y45.236 E.02142
G1 X133.59 Y45.236 E.01074
G1 X133.119 Y44.764 E.02142
G1 X128.638 Y44.764 E.14409
G1 X128.167 Y45.236 E.02142
G1 X127.833 Y45.236 E.01074
G1 X127.362 Y44.764 E.02142
G1 X122.881 Y44.764 E.14409
G1 X122.41 Y45.236 E.02142
G1 X122.076 Y45.236 E.01074
G1 X121.605 Y44.764 E.02142
G1 X119.977 Y44.764 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X121.605 Y44.764 E-.61876
G1 X121.868 Y45.027 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/58
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
G1 X117.416 Y45.584
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1200
M73 P92 R4
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.977 Y44.764 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X121.605 Y44.764 E.05236
G1 X122.076 Y45.236 E.02142
G1 X122.41 Y45.236 E.01074
G1 X122.881 Y44.764 E.02142
G1 X127.362 Y44.764 E.14409
G1 X127.833 Y45.236 E.02142
G1 X128.167 Y45.236 E.01074
G1 X128.638 Y44.764 E.02142
G1 X133.119 Y44.764 E.14409
G1 X133.59 Y45.236 E.02142
G1 X133.924 Y45.236 E.01074
G1 X134.395 Y44.764 E.02142
G1 X136.023 Y44.764 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X134.395 Y44.764 E-.61876
G1 X134.132 Y45.027 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/58
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
G1 X117.416 Y45.584
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1200
G1 X117.009 Y44.009 E.06373
M73 P93 R4
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.869 Y44.78 Z7.6 F30000
G1 X136.023 Y44.764 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X134.395 Y44.764 E.05236
G1 X133.924 Y45.236 E.02142
G1 X133.59 Y45.236 E.01074
G1 X133.119 Y44.764 E.02142
G1 X128.638 Y44.764 E.14409
G1 X128.167 Y45.236 E.02142
G1 X127.833 Y45.236 E.01074
G1 X127.362 Y44.764 E.02142
G1 X122.881 Y44.764 E.14409
G1 X122.41 Y45.236 E.02142
G1 X122.076 Y45.236 E.01074
G1 X121.605 Y44.764 E.02142
G1 X119.977 Y44.764 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X121.605 Y44.764 E-.61876
G1 X121.868 Y45.027 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/58
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
G1 X117.416 Y45.584
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1200
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.977 Y44.764 Z7.8 F30000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X121.605 Y44.764 E.05236
G1 X122.076 Y45.236 E.02142
G1 X122.41 Y45.236 E.01074
G1 X122.881 Y44.764 E.02142
G1 X127.362 Y44.764 E.14409
G1 X127.833 Y45.236 E.02142
G1 X128.167 Y45.236 E.01074
G1 X128.638 Y44.764 E.02142
G1 X133.119 Y44.764 E.14409
G1 X133.59 Y45.236 E.02142
G1 X133.924 Y45.236 E.01074
G1 X134.395 Y44.764 E.02142
G1 X136.023 Y44.764 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X134.395 Y44.764 E-.61876
G1 X134.132 Y45.027 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/58
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
G1 X117.416 Y45.584
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1200
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.869 Y44.78 Z8 F30000
G1 X136.023 Y44.764 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X134.395 Y44.764 E.05236
G1 X133.924 Y45.236 E.02142
G1 X133.59 Y45.236 E.01074
G1 X133.119 Y44.764 E.02142
G1 X128.638 Y44.764 E.14409
G1 X128.167 Y45.236 E.02142
G1 X127.833 Y45.236 E.01074
G1 X127.362 Y44.764 E.02142
G1 X122.881 Y44.764 E.14409
G1 X122.41 Y45.236 E.02142
G1 X122.076 Y45.236 E.01074
G1 X121.605 Y44.764 E.02142
G1 X119.977 Y44.764 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X121.605 Y44.764 E-.61876
G1 X121.868 Y45.027 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/58
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
G1 X117.416 Y45.584
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1200
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.977 Y44.764 Z8.2 F30000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X121.605 Y44.764 E.05236
G1 X122.076 Y45.236 E.02142
G1 X122.41 Y45.236 E.01074
G1 X122.881 Y44.764 E.02142
M73 P94 R4
G1 X127.362 Y44.764 E.14409
G1 X127.833 Y45.236 E.02142
G1 X128.167 Y45.236 E.01074
G1 X128.638 Y44.764 E.02142
G1 X133.119 Y44.764 E.14409
G1 X133.59 Y45.236 E.02142
G1 X133.924 Y45.236 E.01074
G1 X134.395 Y44.764 E.02142
G1 X136.023 Y44.764 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X134.395 Y44.764 E-.61876
G1 X134.132 Y45.027 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/58
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
G1 X117.416 Y45.584
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1200
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
M73 P94 R3
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.869 Y44.78 Z8.4 F30000
G1 X136.023 Y44.764 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X134.395 Y44.764 E.05236
G1 X133.924 Y45.236 E.02142
G1 X133.59 Y45.236 E.01074
G1 X133.119 Y44.764 E.02142
G1 X128.638 Y44.764 E.14409
G1 X128.167 Y45.236 E.02142
G1 X127.833 Y45.236 E.01074
G1 X127.362 Y44.764 E.02142
G1 X122.881 Y44.764 E.14409
G1 X122.41 Y45.236 E.02142
G1 X122.076 Y45.236 E.01074
G1 X121.605 Y44.764 E.02142
G1 X119.977 Y44.764 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X121.605 Y44.764 E-.61876
G1 X121.868 Y45.027 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/58
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
G1 X117.416 Y45.584
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1200
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.977 Y44.764 Z8.6 F30000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X121.605 Y44.764 E.05236
G1 X122.076 Y45.236 E.02142
G1 X122.41 Y45.236 E.01074
G1 X122.881 Y44.764 E.02142
G1 X127.362 Y44.764 E.14409
G1 X127.833 Y45.236 E.02142
G1 X128.167 Y45.236 E.01074
G1 X128.638 Y44.764 E.02142
G1 X133.119 Y44.764 E.14409
G1 X133.59 Y45.236 E.02142
G1 X133.924 Y45.236 E.01074
G1 X134.395 Y44.764 E.02142
G1 X136.023 Y44.764 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X134.395 Y44.764 E-.61876
G1 X134.132 Y45.027 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/58
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
G1 X117.416 Y45.584
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1200
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.869 Y44.78 Z8.8 F30000
G1 X136.023 Y44.764 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X134.395 Y44.764 E.05236
G1 X133.924 Y45.236 E.02142
G1 X133.59 Y45.236 E.01074
G1 X133.119 Y44.764 E.02142
G1 X128.638 Y44.764 E.14409
G1 X128.167 Y45.236 E.02142
G1 X127.833 Y45.236 E.01074
G1 X127.362 Y44.764 E.02142
G1 X122.881 Y44.764 E.14409
G1 X122.41 Y45.236 E.02142
G1 X122.076 Y45.236 E.01074
G1 X121.605 Y44.764 E.02142
G1 X119.977 Y44.764 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F8843.478
G1 X121.605 Y44.764 E-.61876
G1 X121.868 Y45.027 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/58
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
G1 X117.416 Y45.584
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1200
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
M73 P95 R3
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.977 Y44.764 Z9 F30000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X121.605 Y44.764 E.05236
G1 X122.076 Y45.236 E.02142
G1 X122.41 Y45.236 E.01074
G1 X122.881 Y44.764 E.02142
G1 X127.362 Y44.764 E.14409
G1 X127.833 Y45.236 E.02142
G1 X128.167 Y45.236 E.01074
G1 X128.638 Y44.764 E.02142
G1 X133.119 Y44.764 E.14409
G1 X133.59 Y45.236 E.02142
G1 X133.924 Y45.236 E.01074
G1 X134.395 Y44.764 E.02142
G1 X136.023 Y44.764 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X134.395 Y44.764 E-.61876
G1 X134.132 Y45.027 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/58
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
G1 X117.416 Y45.584
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1200
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.869 Y44.78 Z9.2 F30000
G1 X136.023 Y44.764 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X134.395 Y44.764 E.05236
G1 X133.924 Y45.236 E.02142
G1 X133.59 Y45.236 E.01074
G1 X133.119 Y44.764 E.02142
G1 X128.638 Y44.764 E.14409
G1 X128.167 Y45.236 E.02142
G1 X127.833 Y45.236 E.01074
G1 X127.362 Y44.764 E.02142
G1 X122.881 Y44.764 E.14409
G1 X122.41 Y45.236 E.02142
G1 X122.076 Y45.236 E.01074
G1 X121.605 Y44.764 E.02142
G1 X119.977 Y44.764 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X121.605 Y44.764 E-.61876
G1 X121.868 Y45.027 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/58
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
G1 X117.416 Y45.584
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1200
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.977 Y44.764 Z9.4 F30000
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X121.605 Y44.764 E.05236
G1 X122.076 Y45.236 E.02142
G1 X122.41 Y45.236 E.01074
G1 X122.881 Y44.764 E.02142
G1 X127.362 Y44.764 E.14409
G1 X127.833 Y45.236 E.02142
G1 X128.167 Y45.236 E.01074
G1 X128.638 Y44.764 E.02142
M73 P95 R2
G1 X133.119 Y44.764 E.14409
G1 X133.59 Y45.236 E.02142
G1 X133.924 Y45.236 E.01074
G1 X134.395 Y44.764 E.02142
G1 X136.023 Y44.764 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X134.395 Y44.764 E-.61876
G1 X134.132 Y45.027 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/58
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
G17
G3 Z9.4 I1.217 J0 P1  F30000
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
G1 X117.416 Y45.584
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1200
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.869 Y44.78 Z9.6 F30000
G1 X136.023 Y44.764 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X134.395 Y44.764 E.05236
G1 X133.924 Y45.236 E.02142
G1 X133.59 Y45.236 E.01074
G1 X133.119 Y44.764 E.02142
G1 X128.638 Y44.764 E.14409
G1 X128.167 Y45.236 E.02142
G1 X127.833 Y45.236 E.01074
G1 X127.362 Y44.764 E.02142
G1 X122.881 Y44.764 E.14409
G1 X122.41 Y45.236 E.02142
G1 X122.076 Y45.236 E.01074
G1 X121.605 Y44.764 E.02142
G1 X119.977 Y44.764 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X121.605 Y44.764 E-.61876
G1 X121.868 Y45.027 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/58
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
G17
G3 Z9.6 I1.217 J0 P1  F30000
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
G1 X117.416 Y45.584
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1200
M73 P96 R2
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.977 Y44.764 Z9.8 F30000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X121.605 Y44.764 E.05236
G1 X122.076 Y45.236 E.02142
G1 X122.41 Y45.236 E.01074
G1 X122.881 Y44.764 E.02142
G1 X127.362 Y44.764 E.14409
G1 X127.833 Y45.236 E.02142
G1 X128.167 Y45.236 E.01074
G1 X128.638 Y44.764 E.02142
G1 X133.119 Y44.764 E.14409
G1 X133.59 Y45.236 E.02142
G1 X133.924 Y45.236 E.01074
G1 X134.395 Y44.764 E.02142
G1 X136.023 Y44.764 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F8843.478
G1 X134.395 Y44.764 E-.61876
G1 X134.132 Y45.027 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/58
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
G17
G3 Z9.8 I1.217 J0 P1  F30000
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
G1 X117.416 Y45.584
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1200
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.869 Y44.78 Z10 F30000
G1 X136.023 Y44.764 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X134.395 Y44.764 E.05236
G1 X133.924 Y45.236 E.02142
G1 X133.59 Y45.236 E.01074
G1 X133.119 Y44.764 E.02142
G1 X128.638 Y44.764 E.14409
G1 X128.167 Y45.236 E.02142
G1 X127.833 Y45.236 E.01074
G1 X127.362 Y44.764 E.02142
G1 X122.881 Y44.764 E.14409
G1 X122.41 Y45.236 E.02142
G1 X122.076 Y45.236 E.01074
G1 X121.605 Y44.764 E.02142
G1 X119.977 Y44.764 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X121.605 Y44.764 E-.61876
G1 X121.868 Y45.027 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/58
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
G17
G3 Z10 I1.217 J0 P1  F30000
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
G1 X117.416 Y45.584
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1200
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.977 Y44.764 Z10.2 F30000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X121.605 Y44.764 E.05236
G1 X122.076 Y45.236 E.02142
G1 X122.41 Y45.236 E.01074
G1 X122.881 Y44.764 E.02142
G1 X127.362 Y44.764 E.14409
G1 X127.833 Y45.236 E.02142
G1 X128.167 Y45.236 E.01074
G1 X128.638 Y44.764 E.02142
G1 X133.119 Y44.764 E.14409
G1 X133.59 Y45.236 E.02142
G1 X133.924 Y45.236 E.01074
G1 X134.395 Y44.764 E.02142
G1 X136.023 Y44.764 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X134.395 Y44.764 E-.61876
G1 X134.132 Y45.027 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/58
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
G17
G3 Z10.2 I1.217 J0 P1  F30000
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
G1 X117.416 Y45.584
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1200
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.869 Y44.78 Z10.4 F30000
G1 X136.023 Y44.764 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X134.395 Y44.764 E.05236
G1 X133.924 Y45.236 E.02142
G1 X133.59 Y45.236 E.01074
G1 X133.119 Y44.764 E.02142
G1 X128.638 Y44.764 E.14409
G1 X128.167 Y45.236 E.02142
G1 X127.833 Y45.236 E.01074
M73 P97 R2
G1 X127.362 Y44.764 E.02142
G1 X122.881 Y44.764 E.14409
G1 X122.41 Y45.236 E.02142
G1 X122.076 Y45.236 E.01074
G1 X121.605 Y44.764 E.02142
G1 X119.977 Y44.764 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X121.605 Y44.764 E-.61876
G1 X121.868 Y45.027 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/58
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
G17
G3 Z10.4 I1.217 J0 P1  F30000
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
G1 X117.416 Y45.584
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1200
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
M73 P97 R1
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.977 Y44.764 Z10.6 F30000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X121.605 Y44.764 E.05236
G1 X122.076 Y45.236 E.02142
G1 X122.41 Y45.236 E.01074
G1 X122.881 Y44.764 E.02142
G1 X127.362 Y44.764 E.14409
G1 X127.833 Y45.236 E.02142
G1 X128.167 Y45.236 E.01074
G1 X128.638 Y44.764 E.02142
G1 X133.119 Y44.764 E.14409
G1 X133.59 Y45.236 E.02142
G1 X133.924 Y45.236 E.01074
G1 X134.395 Y44.764 E.02142
G1 X136.023 Y44.764 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X134.395 Y44.764 E-.61876
G1 X134.132 Y45.027 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/58
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
G17
G3 Z10.6 I1.217 J0 P1  F30000
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
G1 X117.416 Y45.584
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1200
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.869 Y44.78 Z10.8 F30000
G1 X136.023 Y44.764 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X134.395 Y44.764 E.05236
G1 X133.924 Y45.236 E.02142
G1 X133.59 Y45.236 E.01074
G1 X133.119 Y44.764 E.02142
G1 X128.638 Y44.764 E.14409
G1 X128.167 Y45.236 E.02142
G1 X127.833 Y45.236 E.01074
G1 X127.362 Y44.764 E.02142
G1 X122.881 Y44.764 E.14409
G1 X122.41 Y45.236 E.02142
G1 X122.076 Y45.236 E.01074
G1 X121.605 Y44.764 E.02142
G1 X119.977 Y44.764 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F8843.478
G1 X121.605 Y44.764 E-.61876
G1 X121.868 Y45.027 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/58
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
G17
G3 Z10.8 I1.217 J0 P1  F30000
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
G1 X117.416 Y45.584
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1200
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.977 Y44.764 Z11 F30000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X121.605 Y44.764 E.05236
G1 X122.076 Y45.236 E.02142
G1 X122.41 Y45.236 E.01074
G1 X122.881 Y44.764 E.02142
G1 X127.362 Y44.764 E.14409
G1 X127.833 Y45.236 E.02142
G1 X128.167 Y45.236 E.01074
G1 X128.638 Y44.764 E.02142
G1 X133.119 Y44.764 E.14409
G1 X133.59 Y45.236 E.02142
G1 X133.924 Y45.236 E.01074
G1 X134.395 Y44.764 E.02142
G1 X136.023 Y44.764 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X134.395 Y44.764 E-.61876
G1 X134.132 Y45.027 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/58
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
G17
G3 Z11 I1.217 J0 P1  F30000
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
G1 X117.416 Y45.584
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1200
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1200
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
M73 P98 R1
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.868 Y44.929 Z11.2 F30000
G1 X138.19 Y45.19 Z11.2
G1 Z10.8
G1 E.8 F1800
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.423185
G1 F3000;_EXTRUDE_SET_SPEED
G1 X117.81 Y45.19 E.61219
G1 X117.81 Y44.81 E.01142
G1 X138.19 Y44.81 E.61219
G1 X138.19 Y45.13 E.00962
; Slow Down End
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X138.19 Y44.81 E-.1217
G1 X136.51 Y44.81 E-.6383
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/58
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
M106 S226.95
G17
G3 Z11.2 I1.217 J0 P1  F30000
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
G1 X117.416 Y45.584
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1232
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1232
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1232
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1232
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.81 Y45.19 Z11.4 F30000
G1 Z11
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423185
G1 F1232
G1 X138.19 Y45.19 E.61219
G1 X138.19 Y44.81 E.01142
G1 X117.81 Y44.81 E.61219
G1 X117.81 Y45.13 E.00962
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9467.083
G1 X117.81 Y44.81 E-.1217
G1 X119.49 Y44.81 E-.6383
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/58
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
G17
G3 Z11.4 I1.217 J0 P1  F30000
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
G1 X117.416 Y45.584
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1226
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1226
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1226
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1226
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.81 Y45.19 Z11.6 F30000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423185
M73 P98 R0
G1 F1226
G1 X138.19 Y45.19 E.61219
G1 X138.19 Y44.81 E.01142
G1 X117.81 Y44.81 E.61219
G1 X117.81 Y45.13 E.00962
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9467.083
G1 X117.81 Y44.81 E-.1217
G1 X119.49 Y44.81 E-.6383
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/58
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
G17
G3 Z11.6 I1.217 J0 P1  F30000
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
G1 X117.416 Y45.584
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1226
G1 X117.416 Y44.416 E.03755
G1 X138.584 Y44.416 E.68067
G1 X138.584 Y45.584 E.03755
G1 X117.476 Y45.584 E.67874
G1 X117.009 Y45.991 F30000
G1 F1226
G1 X117.009 Y44.009 E.06373
G1 X138.991 Y44.009 E.70685
G1 X138.991 Y45.991 E.06373
G1 X117.069 Y45.991 E.70492
G1 X116.602 Y46.398 F30000
G1 F1226
G1 X116.602 Y43.602 E.08991
G1 X139.398 Y43.602 E.73303
G1 X139.398 Y46.398 E.08991
G1 X116.662 Y46.398 E.7311
G1 X116.21 Y46.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1226
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.81 Y45.19 Z11.8 F30000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423185
G1 F1226
G1 X138.19 Y45.19 E.61219
G1 X138.19 Y44.81 E.01142
G1 X117.81 Y44.81 E.61219
G1 X117.81 Y45.13 E.00962
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9467.083
G1 X117.81 Y44.81 E-.1217
G1 X119.49 Y44.81 E-.6383
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/58
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
G17
G3 Z11.8 I1.217 J0 P1  F30000
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
M73 P99 R0
G1 X116.21 Y46.79
G1 Z11.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1450
M204 S5000
G1 X116.21 Y43.21 E.10664
G1 X139.79 Y43.21 E.70237
G1 X139.79 Y46.79 E.10664
G1 X116.27 Y46.79 E.70058
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.236 Y44.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.845 Y45.392 Z12 F30000
G1 X138.894 Y46.583 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Top surface
G1 F1450
M204 S2000
G1 X139.583 Y45.894 E.02902
G1 X139.583 Y45.36
G1 X138.36 Y46.583 E.05148
G1 X137.827 Y46.583
G1 X139.583 Y44.827 E.07395
G1 X139.583 Y44.294
G1 X137.294 Y46.583 E.09641
G1 X136.761 Y46.583
G1 X139.583 Y43.761 E.11887
G1 X139.393 Y43.417
G1 X136.227 Y46.583 E.13333
G1 X135.694 Y46.583
G1 X138.859 Y43.417 E.13333
G1 X138.326 Y43.417
G1 X135.161 Y46.583 E.13333
G1 X134.628 Y46.583
G1 X137.793 Y43.417 E.13333
G1 X137.26 Y43.417
G1 X134.094 Y46.583 E.13333
G1 X133.561 Y46.583
G1 X136.726 Y43.417 E.13333
G1 X136.193 Y43.417
G1 X133.028 Y46.583 E.13333
G1 X132.495 Y46.583
G1 X135.66 Y43.417 E.13333
G1 X135.127 Y43.417
G1 X131.961 Y46.583 E.13333
G1 X131.428 Y46.583
G1 X134.593 Y43.417 E.13333
G1 X134.06 Y43.417
G1 X130.895 Y46.583 E.13333
G1 X130.362 Y46.583
G1 X133.527 Y43.417 E.13333
G1 X132.994 Y43.417
G1 X129.828 Y46.583 E.13333
G1 X129.295 Y46.583
G1 X132.46 Y43.417 E.13333
G1 X131.927 Y43.417
G1 X128.762 Y46.583 E.13333
G1 X128.229 Y46.583
G1 X131.394 Y43.417 E.13333
G1 X130.861 Y43.417
G1 X127.695 Y46.583 E.13333
G1 X127.162 Y46.583
G1 X130.327 Y43.417 E.13333
G1 X129.794 Y43.417
G1 X126.629 Y46.583 E.13333
G1 X126.096 Y46.583
G1 X129.261 Y43.417 E.13333
G1 X128.728 Y43.417
G1 X125.562 Y46.583 E.13333
G1 X125.029 Y46.583
G1 X128.194 Y43.417 E.13333
G1 X127.661 Y43.417
G1 X124.496 Y46.583 E.13333
G1 X123.963 Y46.583
G1 X127.128 Y43.417 E.13333
G1 X126.595 Y43.417
G1 X123.429 Y46.583 E.13333
G1 X122.896 Y46.583
G1 X126.061 Y43.417 E.13333
G1 X125.528 Y43.417
G1 X122.363 Y46.583 E.13333
G1 X121.83 Y46.583
G1 X124.995 Y43.417 E.13333
G1 X124.461 Y43.417
G1 X121.296 Y46.583 E.13333
G1 X120.763 Y46.583
G1 X123.928 Y43.417 E.13333
G1 X123.395 Y43.417
G1 X120.23 Y46.583 E.13333
G1 X119.696 Y46.583
G1 X122.862 Y43.417 E.13333
G1 X122.328 Y43.417
G1 X119.163 Y46.583 E.13333
G1 X118.63 Y46.583
G1 X121.795 Y43.417 E.13333
G1 X121.262 Y43.417
G1 X118.097 Y46.583 E.13333
G1 X117.563 Y46.583
G1 X120.729 Y43.417 E.13333
G1 X120.195 Y43.417
G1 X117.03 Y46.583 E.13333
G1 X116.497 Y46.583
G1 X119.662 Y43.417 E.13333
G1 X119.129 Y43.417
G1 X116.417 Y46.129 E.11422
G1 X116.417 Y45.596
G1 X118.596 Y43.417 E.09176
G1 X118.062 Y43.417
G1 X116.417 Y45.062 E.0693
G1 X116.417 Y44.529
G1 X117.529 Y43.417 E.04683
G1 X116.996 Y43.417
G1 X116.417 Y43.996 E.02437
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F9547.055
M204 S10000
G1 X116.996 Y43.417 E-.31088
G1 X117.529 Y43.417 E-.20264
G1 X117.071 Y43.876 E-.24648
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
G1 Z12.1 F900 ; lower z a little
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

    G1 Z111.6 F600
    G1 Z109.6

M400 P100
M17 R ; restore z current

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M73 P100 R0
; EXECUTABLE_BLOCK_END

