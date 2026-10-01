; HEADER_BLOCK_START
; BambuStudio 02.04.00.70
; model printing time: 5m 2s; total estimated time: 12m 15s
; total layer number: 45
; total filament length [mm] : 342.68
; total filament volume [cm^3] : 824.24
; total filament weight [g] : 1.05
; filament_density: 1.27
; filament_diameter: 1.75
; max_z_height: 9.00
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
M73 P0 R12
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
M73 P12 R10
G1 E50 F200
M400
M104 S255
G92 E0
M73 P47 R6
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S235 ; drop nozzle temp, make filament shink a bit
G92 E0
M73 P49 R6
G1 E-0.5 F300

M73 P52 R5
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
M73 P53 R5
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
M73 P54 R5
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
G1 X111.169 Y117.886 E.02317
M73 P55 R5
G1 X111.714 Y117.553 E.02305
G1 X112.552 Y117.227 E.03248
G1 X113.179 Y117.096 E.02313
G1 X113.758 Y117.058 E.02093
G1 X142.242 Y117.058 E1.02845
G1 X142.89 Y117.106 E.02347
G1 X143.513 Y117.246 E.02304
G1 X144.356 Y117.603 E.03306
G1 X144.974 Y118 E.02653
G1 X145.453 Y118.426 E.02313
M73 P56 R5
G1 X145.864 Y118.919 E.02317
G1 X146.197 Y119.464 E.02307
G1 X146.508 Y120.25 E.03052
G1 X146.654 Y120.93 E.0251
G1 X146.692 Y121.508 E.02091
G1 X146.692 Y130.491 E.32437
G1 X146.644 Y131.14 E.02348
G1 X146.504 Y131.763 E.02304
M73 P57 R5
G1 X146.147 Y132.606 E.03306
G1 X145.75 Y133.224 E.02653
G1 X145.324 Y133.703 E.02313
G1 X144.831 Y134.114 E.02317
G1 X144.286 Y134.447 E.02305
G1 X143.448 Y134.773 E.03248
G1 X142.821 Y134.904 E.02313
G1 X142.242 Y134.942 E.02094
G1 X113.759 Y134.942 E1.02844
G1 X113.11 Y134.894 E.02348
G1 X112.489 Y134.754 E.023
G1 X111.562 Y134.351 E.0365
G1 X111.027 Y134.001 E.02309
G1 X110.547 Y133.574 E.02317
G1 X110.136 Y133.081 E.02317
G1 X109.803 Y132.536 E.02305
G1 X109.477 Y131.698 E.03248
G1 X109.346 Y131.071 E.02313
G1 X109.308 Y130.492 E.02093
G1 X109.308 Y121.508 E.32438
M73 P58 R5
G1 X109.356 Y120.86 E.02347
G1 X109.496 Y120.237 E.02304
G1 X109.853 Y119.394 E.03306
G1 X110.25 Y118.776 E.02653
G1 X110.636 Y118.342 E.02097
M204 S6000
G1 X110.979 Y118.647 F30000
G1 F3000
M204 S500
G1 X111.003 Y118.62 E.0013
G1 X111.444 Y118.253 E.02072
G1 X111.928 Y117.96 E.02043
G1 X112.694 Y117.665 E.02962
G1 X113.232 Y117.552 E.01985
G1 X113.777 Y117.515 E.01974
G1 X142.23 Y117.515 E1.0273
G1 X142.832 Y117.561 E.02182
G1 X143.383 Y117.688 E.02041
G1 X144.131 Y118.005 E.02932
G1 X144.705 Y118.373 E.02463
G1 X145.13 Y118.753 E.02058
G1 X145.485 Y119.178 E.01999
G1 X145.78 Y119.659 E.02038
G1 X146.065 Y120.373 E.02774
G1 X146.201 Y121.003 E.02329
G1 X146.235 Y121.527 E.01897
G1 X146.235 Y130.469 E.32286
G1 X146.189 Y131.082 E.02219
G1 X146.062 Y131.633 E.02041
G1 X145.745 Y132.381 E.02932
G1 X145.391 Y132.938 E.02385
G1 X144.997 Y133.38 E.02136
G1 X144.556 Y133.747 E.02072
G1 X144.072 Y134.04 E.02043
M73 P59 R5
G1 X143.306 Y134.335 E.02962
G1 X142.768 Y134.448 E.01985
G1 X142.223 Y134.485 E.01975
G1 X113.77 Y134.485 E1.02729
G1 X113.188 Y134.442 E.0211
G1 X112.644 Y134.32 E.02012
G1 X111.77 Y133.941 E.03441
G1 X111.298 Y133.63 E.02041
G1 X110.87 Y133.247 E.02072
G1 X110.503 Y132.806 E.02072
G1 X110.21 Y132.322 E.02043
G1 X109.915 Y131.556 E.02962
G1 X109.802 Y131.018 E.01985
G1 X109.765 Y130.482 E.01941
G1 X109.765 Y121.53 E.3232
G1 X109.808 Y120.938 E.02146
G1 X109.938 Y120.367 E.02114
G1 X110.255 Y119.619 E.02932
G1 X110.61 Y119.062 E.02385
G1 X110.939 Y118.692 E.01789
M204 S6000
G1 X111.282 Y118.996 F30000
G1 F3000
M204 S500
G1 X111.329 Y118.943 E.00258
G1 X111.719 Y118.621 E.01823
G1 X112.142 Y118.368 E.01781
G1 X112.835 Y118.102 E.02679
G1 X113.304 Y118.005 E.0173
G1 X113.797 Y117.972 E.01786
G1 X142.207 Y117.972 E1.02576
G1 X142.753 Y118.014 E.01977
G1 X143.253 Y118.129 E.01852
G1 X143.906 Y118.406 E.02562
G1 X144.436 Y118.745 E.02271
G1 X144.807 Y119.079 E.01802
G1 X145.118 Y119.453 E.01758
G1 X145.364 Y119.854 E.01698
G1 X145.622 Y120.496 E.02495
G1 X145.748 Y121.077 E.02146
G1 X145.778 Y121.547 E.01702
G1 X145.778 Y130.447 E.32135
G1 X145.736 Y131.003 E.02014
G1 X145.621 Y131.503 E.01852
G1 X145.344 Y132.157 E.02565
G1 X145.031 Y132.653 E.02116
G1 X144.671 Y133.057 E.01955
G1 X144.281 Y133.379 E.01823
G1 X143.858 Y133.632 E.01781
G1 X143.165 Y133.898 E.02679
G1 X142.696 Y133.995 E.0173
G1 X142.202 Y134.028 E.01787
M73 P59 R4
G1 X113.782 Y134.027 E1.02613
G1 X113.265 Y133.989 E.01875
G1 X112.799 Y133.887 E.01722
G1 X111.978 Y133.531 E.0323
G1 X111.57 Y133.26 E.01769
G1 X111.193 Y132.922 E.01827
G1 X110.871 Y132.531 E.01826
G1 X110.618 Y132.108 E.01781
G1 X110.352 Y131.415 E.02679
G1 X110.255 Y130.946 E.0173
G1 X110.222 Y130.461 E.01754
G1 X110.222 Y121.552 E.32167
G1 X110.261 Y121.016 E.01942
G1 X110.38 Y120.496 E.01923
G1 X110.656 Y119.843 E.02562
G1 X110.969 Y119.347 E.02116
G1 X111.242 Y119.041 E.0148
M204 S6000
G1 X111.585 Y119.346 F30000
G1 F3000
M204 S500
G1 X111.655 Y119.266 E.00385
G1 X111.992 Y118.99 E.0157
G1 X112.354 Y118.776 E.01519
G1 X112.974 Y118.54 E.02398
G1 X113.375 Y118.459 E.01475
G1 X113.818 Y118.429 E.01602
G1 X142.184 Y118.429 E1.02422
G1 X142.674 Y118.466 E.01771
G1 X143.122 Y118.57 E.01663
G1 X143.682 Y118.807 E.02194
G1 X144.167 Y119.117 E.02077
G1 X144.483 Y119.404 E.01541
G1 X144.739 Y119.713 E.01449
G1 X144.948 Y120.051 E.01435
G1 X145.179 Y120.619 E.02215
G1 X145.294 Y121.15 E.01962
G1 X145.321 Y121.566 E.01505
G1 X145.321 Y130.425 E.31984
G1 X145.284 Y130.924 E.01808
G1 X145.18 Y131.372 E.01662
G1 X144.942 Y131.934 E.02203
G1 X144.67 Y132.367 E.01847
G1 X144.345 Y132.734 E.0177
G1 X144.008 Y133.01 E.0157
G1 X143.646 Y133.224 E.01519
G1 X143.026 Y133.46 E.02398
G1 X142.625 Y133.541 E.01475
G1 X142.182 Y133.571 E.01602
G1 X113.794 Y133.57 E1.02498
G1 X113.341 Y133.536 E.01643
G1 X112.953 Y133.453 E.01432
G1 X112.187 Y133.121 E.03015
G1 X111.843 Y132.891 E.01494
G1 X111.518 Y132.597 E.01583
G1 X111.241 Y132.258 E.0158
G1 X111.026 Y131.896 E.01519
G1 X110.79 Y131.276 E.02398
G1 X110.709 Y130.875 E.01476
G1 X110.679 Y130.441 E.01569
G1 X110.679 Y121.574 E.32017
G1 X110.714 Y121.094 E.01737
G1 X110.821 Y120.626 E.01732
G1 X111.058 Y120.066 E.02197
G1 X111.33 Y119.633 E.01847
G1 X111.545 Y119.391 E.01169
M204 S6000
G1 X111.888 Y119.695 F30000
G1 F3000
M204 S500
G1 X111.982 Y119.59 E.00508
G1 X112.264 Y119.361 E.01312
G1 X112.564 Y119.185 E.01256
G1 X113.113 Y118.978 E.02119
G1 X113.445 Y118.912 E.01222
G1 X113.837 Y118.886 E.0142
G1 X142.162 Y118.886 E1.0227
G1 X142.594 Y118.919 E.01563
G1 X142.991 Y119.011 E.01473
G1 X143.478 Y119.219 E.0191
G1 X143.897 Y119.489 E.01799
G1 X144.158 Y119.728 E.01279
G1 X144.361 Y119.973 E.01148
G1 X144.533 Y120.248 E.01173
G1 X144.736 Y120.744 E.01933
G1 X144.841 Y121.224 E.01774
G1 X144.864 Y121.585 E.01307
G1 X144.864 Y130.402 E.31835
G1 X144.831 Y130.844 E.016
G1 X144.739 Y131.241 E.01472
G1 X144.54 Y131.712 E.01846
G1 X144.309 Y132.083 E.01575
G1 X144.018 Y132.41 E.01581
G1 X143.736 Y132.639 E.01312
G1 X143.436 Y132.815 E.01256
G1 X142.887 Y133.022 E.02119
G1 X142.555 Y133.088 E.01222
G1 X142.163 Y133.114 E.0142
G1 X113.816 Y133.113 E1.02347
G1 X113.416 Y133.083 E.01451
G1 X113.107 Y133.018 E.0114
G1 X112.396 Y132.711 E.02795
G1 X112.117 Y132.523 E.01215
G1 X111.843 Y132.273 E.01338
G1 X111.611 Y131.986 E.01332
G1 X111.435 Y131.686 E.01256
G1 X111.228 Y131.137 E.02119
G1 X111.162 Y130.805 E.01223
G1 X111.136 Y130.421 E.01387
G1 X111.136 Y121.595 E.31868
G1 X111.166 Y121.172 E.01531
G1 X111.262 Y120.756 E.0154
G1 X111.461 Y120.288 E.01837
G1 X111.691 Y119.917 E.01575
G1 X111.848 Y119.74 E.00856
M204 S6000
G1 X112.212 Y120.03 F30000
G1 F3000
M204 S500
G1 X112.23 Y120.008 E.00101
G1 X112.592 Y119.708 E.01696
G1 X112.935 Y119.523 E.01408
G1 X113.303 Y119.404 E.01396
G1 X113.786 Y119.343 E.0176
G1 X142.209 Y119.343 E1.02625
G1 X142.661 Y119.399 E.01642
G1 X142.901 Y119.462 E.00898
G1 X143.474 Y119.753 E.02321
M73 P60 R4
G1 X143.574 Y119.823 E.00441
G1 X143.747 Y119.977 E.00835
G1 X143.932 Y120.182 E.00996
G1 X144.074 Y120.393 E.00921
G1 X144.258 Y120.765 E.01498
G1 X144.35 Y121.067 E.01139
G1 X144.397 Y121.384 E.01158
G1 X144.407 Y130.459 E.32765
G1 X144.35 Y130.911 E.01644
G1 X144.288 Y131.151 E.00897
G1 X143.997 Y131.724 E.02321
G1 X143.928 Y131.824 E.00437
G1 X143.722 Y132.048 E.01099
G1 X143.516 Y132.222 E.00975
G1 X143.359 Y132.323 E.00672
G1 X142.88 Y132.547 E.01911
G1 X142.605 Y132.615 E.01024
G1 X142.215 Y132.657 E.01414
G1 X113.791 Y132.657 E1.02629
G1 X113.339 Y132.6 E.01643
G1 X113.099 Y132.538 E.00897
G1 X112.526 Y132.247 E.02321
G1 X112.253 Y132.023 E.01274
G1 X112.076 Y131.826 E.00957
G1 X111.752 Y131.261 E.02351
G1 X111.689 Y131.076 E.00705
G1 X111.624 Y130.779 E.01098
G1 X111.593 Y121.542 E.33351
G1 X111.649 Y121.092 E.01639
G1 X111.753 Y120.733 E.01348
G1 X111.948 Y120.362 E.01514
G1 X112.175 Y120.077 E.01315
M204 S6000
G1 X112.525 Y120.367 F30000
G1 F3000
M204 S500
G1 X112.589 Y120.291 E.00359
G1 X112.881 Y120.062 E.01339
G1 X113.148 Y119.927 E.01082
G1 X113.442 Y119.839 E.01108
G1 X113.777 Y119.8 E.01218
G1 X142.218 Y119.8 E1.02687
G1 X142.606 Y119.853 E.01414
G1 X142.79 Y119.905 E.00691
G1 X143.264 Y120.159 E.01943
G1 X143.449 Y120.323 E.00892
G1 X143.592 Y120.488 E.00788
G1 X143.66 Y120.588 E.00439
G1 X143.853 Y120.978 E.01572
G1 X143.911 Y121.191 E.00797
G1 X143.945 Y121.451 E.00947
G1 X143.95 Y130.468 E.32555
G1 X143.897 Y130.856 E.01415
G1 X143.845 Y131.04 E.0069
G1 X143.591 Y131.514 E.01943
G1 X143.427 Y131.699 E.00892
G1 X143.262 Y131.842 E.00787
G1 X143.162 Y131.91 E.00439
G1 X142.772 Y132.103 E.01572
G1 X142.56 Y132.16 E.00793
G1 X142.223 Y132.2 E.01225
G1 X113.782 Y132.2 E1.02686
G1 X113.394 Y132.147 E.01415
G1 X113.21 Y132.095 E.0069
G1 X112.736 Y131.841 E.01943
G1 X112.551 Y131.677 E.00891
G1 X112.412 Y131.517 E.00767
G1 X112.184 Y131.115 E.01667
G1 X112.138 Y130.986 E.00496
G1 X112.069 Y130.674 E.01151
G1 X112.05 Y121.533 E.33007
G1 X112.103 Y121.144 E.01414
G1 X112.193 Y120.858 E.01082
G1 X112.35 Y120.578 E.01162
G1 X112.487 Y120.413 E.00772
M204 S6000
G1 X112.839 Y120.705 F30000
G1 F3000
M204 S500
G1 X112.946 Y120.576 E.00609
G1 X113.153 Y120.429 E.00914
G1 X113.35 Y120.337 E.00786
G1 X113.492 Y120.294 E.00535
G1 X113.769 Y120.257 E.01012
G1 X142.227 Y120.257 E1.02749
G1 X142.543 Y120.306 E.01156
G1 X142.661 Y120.343 E.00446
G1 X142.965 Y120.504 E.01241
G1 X143.098 Y120.617 E.00629
G1 X143.253 Y120.794 E.00848
G1 X143.414 Y121.103 E.01259
G1 X143.456 Y121.242 E.00524
G1 X143.493 Y121.519 E.01012
G1 X143.493 Y130.477 E.32342
G1 X143.444 Y130.794 E.01156
G1 X143.407 Y130.911 E.00446
G1 X143.246 Y131.215 E.01241
G1 X143.133 Y131.348 E.00629
G1 X142.956 Y131.502 E.00848
G1 X142.647 Y131.664 E.01259
G1 X142.508 Y131.706 E.00524
G1 X142.231 Y131.743 E.01012
G1 X113.773 Y131.743 E1.02749
G1 X113.456 Y131.694 E.01156
G1 X113.339 Y131.657 E.00446
G1 X113.035 Y131.496 E.01241
G1 X112.902 Y131.383 E.00629
G1 X112.748 Y131.206 E.00848
G1 X112.586 Y130.897 E.01259
G1 X112.514 Y130.569 E.01211
G1 X112.507 Y121.523 E.32664
G1 X112.556 Y121.205 E.01161
G1 X112.628 Y120.997 E.00794
G1 X112.694 Y120.879 E.00489
G1 X112.8 Y120.751 E.006
M204 S6000
G1 X113.158 Y121.023 F30000
G1 F3000
M204 S500
G1 X113.223 Y120.939 E.00383
G1 X113.336 Y120.848 E.00525
G1 X113.553 Y120.746 E.00865
G1 X113.761 Y120.714 E.00758
G1 X142.238 Y120.714 E1.02819
G1 X142.468 Y120.757 E.00845
G1 X142.659 Y120.844 E.00759
G1 X142.811 Y120.973 E.0072
G1 X142.902 Y121.086 E.00525
G1 X143.004 Y121.303 E.00865
G1 X143.036 Y121.511 E.00758
G1 X143.036 Y130.488 E.32412
G1 X142.993 Y130.718 E.00845
G1 X142.906 Y130.909 E.00759
G1 X142.777 Y131.061 E.0072
G1 X142.664 Y131.152 E.00525
G1 X142.447 Y131.254 E.00865
G1 X142.239 Y131.286 E.00758
G1 X113.762 Y131.286 E1.02819
G1 X113.532 Y131.243 E.00845
G1 X113.341 Y131.156 E.00759
G1 X113.189 Y131.027 E.0072
G1 X113.098 Y130.914 E.00525
G1 X112.996 Y130.697 E.00865
G1 X112.964 Y130.489 E.00758
G1 X112.964 Y121.512 E.32412
G1 X113.007 Y121.279 E.00857
G1 X113.054 Y121.161 E.0046
G1 X113.122 Y121.071 E.00405
M204 S6000
G1 X113.497 Y121.305 F30000
G1 F3000
M204 S500
G1 X113.634 Y121.196 E.00632
G1 X113.75 Y121.171 E.00429
G1 X142.25 Y121.171 E1.02902
G1 X142.361 Y121.2 E.00413
G1 X142.445 Y121.247 E.0035
G1 X142.554 Y121.384 E.00632
G1 X142.579 Y121.5 E.00429
G1 X142.579 Y130.5 E.32495
G1 X142.55 Y130.611 E.00413
G1 X142.503 Y130.695 E.0035
G1 X142.366 Y130.804 E.00632
G1 X142.25 Y130.829 E.00429
G1 X113.75 Y130.829 E1.02902
M73 P61 R4
G1 X113.639 Y130.8 E.00413
G1 X113.555 Y130.753 E.0035
G1 X113.446 Y130.616 E.00632
G1 X113.421 Y130.5 E.00429
G1 X113.421 Y121.5 E.32495
G1 X113.45 Y121.389 E.00413
G1 X113.468 Y121.357 E.00133
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
G1 X114.15 Y130.1 E1.00014
G1 X114.15 Y121.9 E.29607
G1 X141.85 Y121.9 E1.00014
G1 X141.85 Y130.04 E.2939
M204 S6000
G1 X141.393 Y129.643 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X114.607 Y129.643 E.96713
G1 X114.607 Y122.357 E.26306
G1 X141.393 Y122.357 E.96713
G1 X141.393 Y129.583 E.2609
M204 S6000
G1 X140.936 Y129.186 F30000
G1 F3000
M204 S500
G1 X120.39 Y129.186 E.74181
G2 X121.28 Y128.319 I-2.497 J-3.451 E.04501
G2 X116.631 Y128.784 I-2.53 J-1.819 E.51609
G1 X117.11 Y129.186 E.02257
G1 X115.064 Y129.186 E.07385
G1 X115.064 Y122.814 E.23006
G1 X140.936 Y122.814 E.93413
G1 X140.936 Y129.126 E.22789
M204 S6000
G1 X140.479 Y128.729 F30000
G1 F3000
M204 S500
G1 X121.559 Y128.729 E.68311
G2 X121.544 Y124.272 I-2.891 J-2.218 E.17314
G2 X120.638 Y123.471 I-2.716 J2.158 E.04388
G1 X120.694 Y123.271 E.0075
G1 X140.479 Y123.271 E.71434
G1 X140.479 Y128.669 E.19489
; WIPE_START
G1 X138.479 Y128.675 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X130.847 Y128.577 Z.6 F30000
G1 X115.718 Y128.384 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X115.941 Y128.729 E.01484
G1 X115.521 Y128.729 E.01515
G1 X115.521 Y128.442 E.01037
G1 X115.66 Y128.401 E.00524
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
G1 X116.456 Y123.766 E.0075
G2 X115.711 Y124.613 I2.382 J2.847 E.04086
G1 X115.521 Y124.551 E.00721
G1 X115.521 Y123.271 E.04622
G1 X116.806 Y123.271 E.04638
G1 X116.862 Y123.471 E.0075
G1 X116.671 Y123.607 E.00845
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
G1 X118.522 Y124.312 Z.6 F30000
M73 P62 R4
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X118.538 Y124.31 E.00056
G1 X118.75 Y124.3 E.00768
G3 X118.315 Y124.344 I.003 J2.195 E.48213
G1 X118.463 Y124.321 E.00541
M204 S6000
G1 X118.014 Y123.948 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X118.225 Y123.895 E.00787
G3 X118.493 Y123.855 I.529 J2.604 E.00978
G1 X118.75 Y123.842 E.0093
G3 X117.956 Y123.964 I.004 J2.657 E.57363
M204 S6000
G1 X117.899 Y123.154 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.245199
G1 F3000
M204 S500
G1 X118.068 Y123.133 E.00271
; LINE_WIDTH: 0.223219
G1 X118.077 Y123.132 E.00013
; LINE_WIDTH: 0.197423
G1 X118.416 Y123.107 E.00415
; LINE_WIDTH: 0.164039
G1 X119.093 Y123.108 E.00648
; LINE_WIDTH: 0.198006
G1 X119.426 Y123.133 E.0041
; LINE_WIDTH: 0.244571
G1 X119.602 Y123.154 E.00282
; LINE_WIDTH: 0.287458
G1 X119.769 Y123.175 E.00325
; LINE_WIDTH: 0.329663
G1 X119.893 Y123.197 E.00286
; LINE_WIDTH: 0.371146
G1 X120.004 Y123.217 E.00293
; LINE_WIDTH: 0.410323
G1 X120.115 Y123.236 E.00327
; LINE_WIDTH: 0.43385
G1 X120.448 Y123.303 E.01048
; WIPE_START
G1 X120.115 Y123.236 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X117.899 Y123.154 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.289048
G1 F3000
M204 S500
G1 X117.718 Y123.177 E.00356
; LINE_WIDTH: 0.332038
G1 X117.607 Y123.197 E.00258
; LINE_WIDTH: 0.371207
G1 X117.496 Y123.217 E.00292
; LINE_WIDTH: 0.428016
G2 X117.052 Y123.303 I1.533 J9.021 E.01375
; WIPE_START
G1 X117.496 Y123.217 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X115.549 Y124.8 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.399422
G1 F3000
M204 S500
G1 X115.469 Y125.222 E.01208
; LINE_WIDTH: 0.377879
G1 X115.451 Y125.333 E.00298
; LINE_WIDTH: 0.341543
G1 X115.433 Y125.444 E.00266
; LINE_WIDTH: 0.30327
G1 X115.413 Y125.567 E.00257
; LINE_WIDTH: 0.264933
G1 X115.394 Y125.734 E.00294
; LINE_WIDTH: 0.226451
G1 X115.375 Y125.909 E.00255
; LINE_WIDTH: 0.185941
G1 X115.354 Y126.248 E.00384
; LINE_WIDTH: 0.165218
G1 X115.363 Y126.928 E.00657
; LINE_WIDTH: 0.197279
G1 X115.377 Y127.095 E.00204
; LINE_WIDTH: 0.227311
G1 X115.393 Y127.271 E.00258
; LINE_WIDTH: 0.266262
G1 X115.416 Y127.438 E.00297
; LINE_WIDTH: 0.312301
G1 X115.439 Y127.605 E.00358
; LINE_WIDTH: 0.337733
G1 X115.441 Y127.62 E.00035
; LINE_WIDTH: 0.36116
G1 X115.462 Y127.731 E.00284
; LINE_WIDTH: 0.403216
G1 X115.483 Y127.842 E.00322
; LINE_WIDTH: 0.445272
G1 X115.504 Y127.953 E.00359
; LINE_WIDTH: 0.476242
G2 X115.561 Y128.191 I4.827 J-1.028 E.00839
M204 S6000
G1 X116.295 Y128.806 F30000
; LINE_WIDTH: 0.114005
G1 F3000
M204 S500
G1 X116.416 Y128.957 E.00109
M204 S6000
G1 X117.342 Y129.047 F30000
; LINE_WIDTH: 0.116162
G1 F3000
M204 S500
G1 X117.477 Y129.139 E.00094
; LINE_WIDTH: 0.151538
G1 X117.605 Y129.217 E.00129
; LINE_WIDTH: 0.195566
G1 X117.729 Y129.293 E.00175
; LINE_WIDTH: 0.220677
G2 X117.896 Y129.336 I.152 J-.243 E.00247
; LINE_WIDTH: 0.180941
G1 X118.02 Y129.355 E.00136
; LINE_WIDTH: 0.146903
G1 X118.186 Y129.371 E.00137
; LINE_WIDTH: 0.1174
G1 X118.345 Y129.387 E.00094
M204 S6000
G1 X119.153 Y129.358 F30000
; LINE_WIDTH: 0.114
G1 F3000
M204 S500
G1 X119.185 Y129.384 E.00023
G1 X119.33 Y129.37 E.00082
; LINE_WIDTH: 0.1464
G1 X119.474 Y129.355 E.00118
; LINE_WIDTH: 0.180016
G1 X119.604 Y129.336 E.00142
; LINE_WIDTH: 0.218166
G1 X119.727 Y129.317 E.00173
; LINE_WIDTH: 0.22857
G1 X119.764 Y129.298 E.00061
; LINE_WIDTH: 0.196902
G1 X119.896 Y129.217 E.00188
; LINE_WIDTH: 0.152201
G1 X120.02 Y129.141 E.00126
; LINE_WIDTH: 0.116536
G1 X120.158 Y129.047 E.00097
M204 S6000
G1 X121.084 Y128.957 F30000
; LINE_WIDTH: 0.114012
G1 F3000
M204 S500
G1 X121.205 Y128.806 E.00109
; WIPE_START
G1 X121.084 Y128.957 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X128.51 Y127.192 Z.6 F30000
G1 X140.296 Y124.391 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50601
G1 F6300
M204 S500
G1 X139.565 Y123.66 E.03782
G1 X138.91 Y123.66 E.02396
G1 X140.09 Y124.84 E.06106
G1 X140.09 Y125.495 E.02396
G1 X138.255 Y123.66 E.09494
G1 X137.6 Y123.66 E.02396
G1 X140.09 Y126.15 E.12882
G1 X140.09 Y126.805 E.02396
G1 X136.945 Y123.66 E.1627
G1 X136.291 Y123.66 E.02396
G1 X140.09 Y127.46 E.19658
G1 X140.09 Y128.114 E.02396
G1 X135.636 Y123.66 E.23046
G1 X134.981 Y123.66 E.02396
G1 X139.661 Y128.34 E.24215
G1 X139.007 Y128.34 E.02396
G1 X134.326 Y123.66 E.24215
G1 X133.671 Y123.66 E.02396
G1 X138.352 Y128.34 E.24215
G1 X137.697 Y128.34 E.02396
G1 X133.016 Y123.66 E.24215
G1 X132.361 Y123.66 E.02396
G1 X137.042 Y128.34 E.24215
G1 X136.387 Y128.34 E.02396
G1 X131.706 Y123.66 E.24215
G1 X131.051 Y123.66 E.02396
G1 X135.732 Y128.34 E.24215
G1 X135.077 Y128.34 E.02396
G1 X130.396 Y123.66 E.24215
G1 X129.741 Y123.66 E.02396
G1 X134.422 Y128.34 E.24215
G1 X133.767 Y128.34 E.02396
G1 X129.087 Y123.66 E.24215
G1 X128.432 Y123.66 E.02396
G1 X133.112 Y128.34 E.24215
G1 X132.457 Y128.34 E.02396
G1 X127.777 Y123.66 E.24215
G1 X127.122 Y123.66 E.02396
G1 X131.803 Y128.34 E.24215
G1 X131.148 Y128.34 E.02396
G1 X126.467 Y123.66 E.24215
G1 X125.812 Y123.66 E.02396
G1 X130.493 Y128.34 E.24215
G1 X129.838 Y128.34 E.02396
G1 X125.157 Y123.66 E.24215
G1 X124.502 Y123.66 E.02396
G1 X129.183 Y128.34 E.24215
G1 X128.528 Y128.34 E.02396
G1 X123.847 Y123.66 E.24215
G1 X123.192 Y123.66 E.02396
G1 X127.873 Y128.34 E.24215
G1 X127.218 Y128.34 E.02396
G1 X122.537 Y123.66 E.24215
G1 X121.883 Y123.66 E.02396
G1 X126.563 Y128.34 E.24215
G1 X125.908 Y128.34 E.02396
G1 X122.289 Y124.721 E.18725
G3 X122.631 Y125.717 I-3.808 J1.863 E.03864
G1 X125.253 Y128.34 E.13569
G1 X124.599 Y128.34 E.02396
G1 X122.707 Y126.449 E.09784
G3 X122.669 Y127.065 I-4.404 J.033 E.02261
G1 X123.944 Y128.34 E.06596
M73 P63 R4
G1 X123.289 Y128.34 E.02396
G1 X122.551 Y127.602 E.03817
G3 X122.379 Y128.086 I-2.5 J-.617 E.01879
G1 X122.84 Y128.546 E.02382
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6300
G1 X122.379 Y128.086 E-.24747
G1 X122.551 Y127.602 E-.19484
G1 X123.142 Y128.194 E-.31769
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/45
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
G1 X118.818 Y124.109
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3255
G1 X118.989 Y124.109 E.00551
G3 X118.531 Y124.108 I-.234 J2.39 E.47038
G1 X118.758 Y124.109 E.00728
G1 X118.56 Y124.5 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3255
M204 S5000
G1 X118.569 Y124.499 E.00025
G1 X118.75 Y124.49 E.00541
G3 X118.353 Y124.531 I.009 J2.009 E.3641
G1 X118.501 Y124.509 E.00446
; WIPE_START
G1 F9547.055
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
G1 X127.782 Y126.625 Z.8 F30000
G1 X140.834 Y129.084 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3255
G1 X120.671 Y129.084 E.64837
G2 X116.829 Y129.084 I-1.921 J-2.581 E.51767
G1 X115.166 Y129.084 E.05348
G1 X115.166 Y122.916 E.19833
G1 X140.834 Y122.916 E.82538
G1 X140.834 Y129.024 E.1964
G1 X141.241 Y129.491 F30000
G1 F3255
G1 X119.231 Y129.491 E.70777
G1 X119.209 Y129.271 E.00711
G2 X118.291 Y129.271 I-.459 J-2.771 E.53792
G1 X118.269 Y129.491 E.00711
G1 X114.759 Y129.491 E.11288
G1 X114.759 Y122.509 E.22451
G1 X141.241 Y122.509 E.85156
G1 X141.241 Y129.431 E.22258
G1 X141.648 Y129.898 F30000
G1 F3255
G1 X114.352 Y129.898 E.87774
G1 X114.352 Y122.102 E.25069
G1 X141.648 Y122.102 E.87774
G1 X141.648 Y129.838 E.24876
G1 X142.04 Y130.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3255
M204 S5000
G1 X113.96 Y130.29 E.83641
G1 X113.96 Y121.71 E.25557
G1 X142.04 Y121.71 E.83641
G1 X142.04 Y130.23 E.25378
; WIPE_START
G1 F9547.055
M204 S10000
G1 X140.04 Y130.234 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.694 Y128.164 Z.8 F30000
G1 X125.015 Y126 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.52447
G1 F3255
G1 X137.69 Y126 E.48214
G1 X124.645 Y126.429 F30000
; LINE_WIDTH: 0.41999
G1 F3255
G1 X138.179 Y126.429 E.40314
G1 X138.179 Y125.571 E.02558
G1 X124.537 Y125.571 E.40635
G1 X124.613 Y126.382 E.02428
G1 X124.239 Y126.43 F30000
G1 F3255
G1 X124.229 Y126.806 E.01122
G1 X138.556 Y126.806 E.42674
G1 X138.556 Y125.194 E.04804
G1 X124.074 Y125.194 E.43138
G3 X124.234 Y126.37 I-4.525 J1.216 E.03546
G1 X123.835 Y126.089 F30000
G1 F3255
M73 P64 R4
G1 X123.854 Y126.796 E.02108
G1 X123.806 Y127.183 E.01163
G1 X138.933 Y127.183 E.45059
G1 X138.933 Y124.817 E.0705
G1 X123.576 Y124.817 E.45743
G1 X123.753 Y125.446 E.01948
G1 X123.827 Y126.029 E.0175
G1 X123.459 Y126.117 F30000
G1 F3255
G1 X123.48 Y126.749 E.01885
G1 X123.365 Y127.561 E.02441
G1 X139.311 Y127.561 E.47496
G1 X139.311 Y124.439 E.09296
G1 X123.003 Y124.439 E.48574
G1 X123.206 Y124.893 E.01479
G1 X123.39 Y125.548 E.02029
G1 X123.452 Y126.057 E.01527
G1 X123.111 Y126.515 F30000
G1 F3255
G1 X123.021 Y127.378 E.02587
G1 X122.853 Y127.938 E.01739
G1 X139.688 Y127.938 E.50143
G1 X139.688 Y124.062 E.11543
G1 X122.366 Y124.062 E.51595
G1 X122.774 Y124.82 E.02564
G1 X123.027 Y125.65 E.02586
G1 X123.105 Y126.455 E.02407
G1 X122.735 Y126.543 F30000
G1 F3255
G1 X122.647 Y127.331 E.02364
G1 X122.405 Y128.087 E.02364
G1 X122.287 Y128.315 E.00763
G1 X140.065 Y128.315 E.52953
G1 X140.065 Y123.685 E.13789
G1 X121.571 Y123.685 E.55084
G1 X122.067 Y124.291 E.0233
G1 X122.439 Y124.992 E.02365
G1 X122.664 Y125.752 E.02363
G1 X122.729 Y126.483 E.02185
G1 X122.359 Y126.571 F30000
G1 F3255
G1 X122.273 Y127.285 E.02141
G1 X122.048 Y127.967 E.02141
G1 X121.692 Y128.592 E.02141
G1 X121.61 Y128.692 E.00384
G1 X140.442 Y128.692 E.56091
G1 X140.442 Y123.308 E.16035
G1 X121.015 Y123.308 E.57863
G1 X120.947 Y123.648 E.01033
G1 X121.347 Y123.993 E.01574
G1 X121.772 Y124.526 E.02029
G1 X122.103 Y125.164 E.02142
G1 X122.301 Y125.855 E.0214
G1 X122.354 Y126.511 E.01962
; WIPE_START
G1 F9547.299
M73 P65 R4
G1 X122.301 Y125.855 E-.2503
G1 X122.103 Y125.164 E-.273
G1 X121.816 Y124.611 E-.2367
; WIPE_END
G1 E-.04 F1800
G1 X120.253 Y129.137 Z.8 F30000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.112403
G1 F3255
G1 X120.096 Y129.244 E.00104
G1 X119.995 Y129.266 E.00057
; WIPE_START
G1 F15000
G1 X120.096 Y129.244 E-.26797
G1 X120.253 Y129.137 E-.49203
; WIPE_END
G1 E-.04 F1800
G1 X117.505 Y129.266 Z.8 F30000
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.11237
G1 F3255
G1 X117.404 Y129.244 E.00057
G1 X117.248 Y129.137 E.00104
; WIPE_START
G1 F15000
G1 X117.404 Y129.244 E-.49203
G1 X117.505 Y129.266 E-.26797
; WIPE_END
G1 E-.04 F1800
G1 X115.709 Y128.514 Z.8 F30000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.64544
G1 F3255
G2 X115.716 Y128.631 I-.034 J.061 E.01434
G1 X115.394 Y125.739 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.113678
G1 F3255
G1 X115.414 Y125.563 E.00099
; LINE_WIDTH: 0.149543
G1 X115.433 Y125.445 E.00101
; LINE_WIDTH: 0.187449
G1 X115.451 Y125.332 E.00132
; LINE_WIDTH: 0.224642
G1 X115.47 Y125.218 E.00165
; LINE_WIDTH: 0.24514
G1 X115.579 Y124.641 E.00938
G1 X115.603 Y124.649 F30000
; LINE_WIDTH: 0.400036
G1 F3255
G2 X115.37 Y125.593 I18.65 J5.112 E.02744
G1 X116.554 Y123.648 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F3255
G1 X116.485 Y123.308 E.01033
G1 X115.558 Y123.308 E.02759
G1 X115.558 Y124.231 E.02748
G1 X115.887 Y124.319 E.01012
G3 X116.508 Y123.687 I2.11 J1.454 E.02653
G1 X115.957 Y123.643 F30000
; LINE_WIDTH: 0.41588
G1 F3255
G1 X115.887 Y123.683 E.00238
G1 X115.945 Y123.717 E.00198
G1 X116.89 Y123.336 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.275365
G1 F3255
G3 X117.495 Y123.217 I2.641 J11.766 E.01131
; LINE_WIDTH: 0.217024
G1 X117.608 Y123.197 E.00159
; LINE_WIDTH: 0.17692
G1 X117.722 Y123.177 E.00122
; LINE_WIDTH: 0.141242
G1 X117.857 Y123.16 E.00106
; LINE_WIDTH: 0.111473
G1 X117.987 Y123.143 E.00071
G1 X119.513 Y123.143 F30000
; LINE_WIDTH: 0.111474
G1 F3255
G1 X119.643 Y123.16 E.00071
; LINE_WIDTH: 0.14058
G1 X119.772 Y123.176 E.00101
; LINE_WIDTH: 0.175893
G1 X119.892 Y123.197 E.00127
; LINE_WIDTH: 0.216985
G1 X120.005 Y123.217 E.00159
; LINE_WIDTH: 0.257095
G1 X120.119 Y123.237 E.00195
; LINE_WIDTH: 0.279545
G1 X120.61 Y123.336 E.00936
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X120.119 Y123.237 E-.76
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
G1 F3248
G1 X119.226 Y124.145 E.01273
G3 X118.511 Y124.109 I-.476 J2.354 E.46205
G1 X118.75 Y124.097 E.0077
G1 X118.773 Y124.099 E.00074
G1 X118.568 Y124.499 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3248
M204 S5000
G1 X118.75 Y124.49 E.00542
G3 X118.509 Y124.504 I0 J2.009 E.36879
; WIPE_START
G1 F9547.055
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
G1 F3248
G1 X120.671 Y129.084 E.64837
G2 X116.829 Y129.084 I-1.921 J-2.581 E.51761
G1 X115.166 Y129.084 E.05348
G1 X115.166 Y122.916 E.19833
G1 X140.834 Y122.916 E.82538
G1 X140.834 Y129.024 E.1964
G1 X141.241 Y129.491 F30000
G1 F3248
G1 X119.231 Y129.491 E.70777
G1 X119.209 Y129.271 E.00711
G2 X118.291 Y129.271 I-.459 J-2.77 E.53767
G1 X118.269 Y129.491 E.00711
G1 X114.759 Y129.491 E.11288
G1 X114.759 Y122.509 E.22451
G1 X141.241 Y122.509 E.85156
G1 X141.241 Y129.431 E.22258
G1 X141.648 Y129.898 F30000
G1 F3248
G1 X114.352 Y129.898 E.87774
G1 X114.352 Y122.102 E.25069
G1 X141.648 Y122.102 E.87774
G1 X141.648 Y129.838 E.24876
G1 X142.04 Y130.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3248
M204 S5000
G1 X113.96 Y130.29 E.83641
G1 X113.96 Y121.71 E.25557
G1 X142.04 Y121.71 E.83641
G1 X142.04 Y130.23 E.25378
; WIPE_START
G1 F9547.055
M204 S10000
G1 X140.04 Y130.234 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.694 Y128.164 Z1 F30000
G1 X125.015 Y126 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.52446
G1 F3248
G1 X137.69 Y126 E.48213
G1 X124.644 Y126.429 F30000
; LINE_WIDTH: 0.41999
G1 F3248
G1 X138.179 Y126.429 E.40315
G1 X138.179 Y125.571 E.02558
G1 X124.537 Y125.571 E.40634
G1 X124.613 Y126.382 E.02428
G1 X124.239 Y126.43 F30000
G1 F3248
G1 X124.229 Y126.806 E.01121
G1 X138.556 Y126.806 E.42674
G1 X138.556 Y125.194 E.04804
G1 X124.074 Y125.194 E.43138
G3 X124.234 Y126.37 I-4.522 J1.216 E.03547
G1 X123.835 Y126.088 F30000
G1 F3248
G1 X123.854 Y126.796 E.02109
G1 X123.806 Y127.183 E.01163
G1 X138.933 Y127.183 E.45059
G1 X138.933 Y124.817 E.0705
G1 X123.576 Y124.817 E.45744
G1 X123.753 Y125.446 E.01948
G1 X123.828 Y126.029 E.0175
G1 X123.459 Y126.117 F30000
G1 F3248
G1 X123.48 Y126.749 E.01885
G1 X123.365 Y127.561 E.02441
M73 P66 R4
G1 X139.311 Y127.561 E.47496
G1 X139.311 Y124.439 E.09296
G1 X123.003 Y124.439 E.48574
G1 X123.206 Y124.892 E.01477
G1 X123.39 Y125.548 E.0203
G1 X123.452 Y126.057 E.01526
G1 X123.111 Y126.515 F30000
G1 F3248
G1 X123.021 Y127.379 E.02587
G1 X122.853 Y127.938 E.01738
G1 X139.688 Y127.938 E.50143
G1 X139.688 Y124.062 E.11543
G1 X122.366 Y124.062 E.51595
G1 X122.774 Y124.82 E.02562
G1 X123.027 Y125.651 E.02587
G1 X123.105 Y126.455 E.02407
G1 X122.735 Y126.543 F30000
G1 F3248
G1 X122.647 Y127.332 E.02364
G1 X122.405 Y128.088 E.02364
G1 X122.287 Y128.315 E.00762
G1 X140.065 Y128.315 E.52953
G1 X140.065 Y123.685 E.13789
G1 X121.571 Y123.685 E.55084
G1 X122.067 Y124.291 E.02331
G1 X122.438 Y124.992 E.02363
G1 X122.664 Y125.753 E.02364
G1 X122.729 Y126.483 E.02184
G1 X122.359 Y126.571 F30000
G1 F3248
G1 X122.273 Y127.285 E.02142
G1 X122.048 Y127.968 E.02141
G1 X121.692 Y128.592 E.0214
G1 X121.61 Y128.692 E.00384
G1 X140.442 Y128.692 E.56091
G1 X140.442 Y123.308 E.16035
G1 X121.015 Y123.308 E.57863
G1 X120.947 Y123.648 E.01034
G1 X121.347 Y123.993 E.01574
G1 X121.772 Y124.526 E.0203
G1 X122.103 Y125.164 E.0214
G1 X122.301 Y125.855 E.02142
G1 X122.354 Y126.511 E.01961
; WIPE_START
G1 F9547.299
G1 X122.301 Y125.855 E-.25023
G1 X122.103 Y125.164 E-.27324
G1 X121.816 Y124.611 E-.23653
; WIPE_END
G1 E-.04 F1800
G1 X120.252 Y129.138 Z1 F30000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.112283
G1 F3248
G1 X120.096 Y129.244 E.00103
G1 X119.995 Y129.266 E.00056
; WIPE_START
G1 F15000
G1 X120.096 Y129.244 E-.26792
G1 X120.252 Y129.138 E-.49208
; WIPE_END
G1 E-.04 F1800
G1 X117.505 Y129.266 Z1 F30000
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.112345
G1 F3248
G1 X117.404 Y129.244 E.00057
M73 P67 R4
G1 X117.248 Y129.137 E.00104
; WIPE_START
G1 F15000
G1 X117.404 Y129.244 E-.49211
G1 X117.505 Y129.266 E-.26789
; WIPE_END
G1 E-.04 F1800
G1 X115.709 Y128.514 Z1 F30000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.64542
G1 F3248
G2 X115.716 Y128.631 I-.034 J.061 E.01434
G1 X115.394 Y125.739 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.113666
G1 F3248
G1 X115.413 Y125.564 E.00099
; LINE_WIDTH: 0.149503
G1 X115.433 Y125.445 E.00101
; LINE_WIDTH: 0.187407
G1 X115.451 Y125.332 E.00131
; LINE_WIDTH: 0.224599
G1 X115.47 Y125.218 E.00165
; LINE_WIDTH: 0.245087
G1 X115.579 Y124.641 E.00937
G1 X115.603 Y124.649 F30000
; LINE_WIDTH: 0.400135
G1 F3248
G2 X115.37 Y125.594 I18.876 J5.164 E.02746
G1 X116.553 Y123.648 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F3248
G1 X116.485 Y123.308 E.01033
G1 X115.558 Y123.308 E.02759
G1 X115.558 Y124.231 E.02749
G1 X115.887 Y124.319 E.01012
G3 X116.508 Y123.687 I2.109 J1.452 E.02652
G1 X115.957 Y123.643 F30000
; LINE_WIDTH: 0.41586
G1 F3248
G1 X115.887 Y123.683 E.00238
G1 X115.945 Y123.717 E.00198
G1 X116.89 Y123.336 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.275308
G1 F3248
G3 X117.495 Y123.217 I2.712 J12.168 E.01131
; LINE_WIDTH: 0.216976
G1 X117.608 Y123.197 E.00159
; LINE_WIDTH: 0.176866
G1 X117.722 Y123.177 E.00122
; LINE_WIDTH: 0.141213
G1 X117.857 Y123.16 E.00106
; LINE_WIDTH: 0.111463
G1 X117.987 Y123.143 E.00071
G1 X119.513 Y123.143 F30000
; LINE_WIDTH: 0.111467
G1 F3248
G1 X119.643 Y123.16 E.00071
; LINE_WIDTH: 0.140562
G1 X119.772 Y123.176 E.00101
; LINE_WIDTH: 0.175875
G1 X119.892 Y123.197 E.00127
; LINE_WIDTH: 0.216971
G1 X120.005 Y123.217 E.00159
; LINE_WIDTH: 0.257086
G1 X120.119 Y123.237 E.00195
; LINE_WIDTH: 0.279549
G1 X120.61 Y123.336 E.00936
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
M106 S226.95
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
G1 F2039
G1 X118.583 Y124.106 E.002
G3 X119.226 Y124.145 I.165 J2.587 E.02078
G3 X118.275 Y124.148 I-.467 J2.355 E.45428
G1 X118.462 Y124.122 E.00607
G1 X118.585 Y124.499 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2039
M204 S5000
G1 X118.602 Y124.497 E.00051
G3 X119.148 Y124.53 I.145 J2.172 E.01634
G3 X118.352 Y124.532 I-.391 J1.97 E.35206
G1 X118.526 Y124.508 E.00522
; WIPE_START
G1 F9547.055
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
G1 F2039
G1 X120.671 Y129.084 E.64837
G2 X116.829 Y129.084 I-1.921 J-2.581 E.51765
G1 X115.166 Y129.084 E.05348
G1 X115.166 Y122.916 E.19833
G1 X140.834 Y122.916 E.82538
G1 X140.834 Y129.024 E.1964
G1 X141.241 Y129.491 F30000
G1 F2039
G1 X119.231 Y129.491 E.70777
G1 X119.209 Y129.271 E.00711
G2 X118.291 Y129.271 I-.459 J-2.77 E.53771
G1 X118.269 Y129.491 E.00711
G1 X114.759 Y129.491 E.11288
G1 X114.759 Y122.509 E.22451
G1 X141.241 Y122.509 E.85156
G1 X141.241 Y129.431 E.22258
G1 X141.648 Y129.898 F30000
G1 F2039
G1 X114.352 Y129.898 E.87774
G1 X114.352 Y122.102 E.25069
G1 X141.648 Y122.102 E.87774
G1 X141.648 Y129.838 E.24876
G1 X142.04 Y130.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2039
M204 S5000
G1 X113.96 Y130.29 E.83641
G1 X113.96 Y121.71 E.25557
G1 X142.04 Y121.71 E.83641
G1 X142.04 Y130.23 E.25378
; WIPE_START
G1 F9547.055
M204 S10000
G1 X140.04 Y130.234 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.486 Y128.6 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P67 R3
G1 F2039
G1 X140.486 Y126.972 E.05236
G1 X136.778 Y123.264 E.16859
G1 X136.493 Y123.264 E.00919
G1 X131.021 Y128.736 E.2488
G1 X130.736 Y128.736 E.00919
G1 X125.264 Y123.264 E.2488
G1 X124.979 Y123.264 E.00919
G1 X122.274 Y125.969 E.12301
G1 X122.282 Y126.039 E.00227
G1 X124.979 Y128.736 E.12261
G1 X125.264 Y128.736 E.00919
G1 X130.736 Y123.264 E.2488
G1 X131.021 Y123.264 E.00919
G1 X136.493 Y128.736 E.2488
G1 X136.778 Y128.736 E.00919
G1 X140.486 Y125.028 E.16859
G1 X140.486 Y123.4 E.05236
G1 X120.61 Y123.336 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.279521
G1 F2039
G1 X120.119 Y123.237 E.00936
; LINE_WIDTH: 0.257073
G1 X120.005 Y123.217 E.00195
; LINE_WIDTH: 0.216972
G1 X119.892 Y123.197 E.00159
; LINE_WIDTH: 0.175889
G1 X119.772 Y123.176 E.00127
; LINE_WIDTH: 0.14058
G1 X119.643 Y123.16 E.00101
; LINE_WIDTH: 0.111474
G1 X119.513 Y123.143 E.00071
G1 X117.987 Y123.143 F30000
; LINE_WIDTH: 0.111492
G1 F2039
G1 X117.857 Y123.16 E.00071
; LINE_WIDTH: 0.141289
M73 P68 R3
G1 X117.722 Y123.177 E.00106
; LINE_WIDTH: 0.176966
G1 X117.608 Y123.197 E.00122
; LINE_WIDTH: 0.217036
G1 X117.495 Y123.217 E.00159
; LINE_WIDTH: 0.275327
G2 X116.89 Y123.336 I2.045 J11.939 E.01131
G1 X116.554 Y123.648 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F2039
G1 X116.485 Y123.308 E.01033
G1 X115.558 Y123.308 E.02759
G1 X115.558 Y124.231 E.02749
G1 X115.887 Y124.319 E.01012
G3 X116.508 Y123.687 I2.109 J1.453 E.02653
G1 X115.957 Y123.643 F30000
; LINE_WIDTH: 0.41588
G1 F2039
G1 X115.887 Y123.683 E.00238
G1 X115.945 Y123.717 E.00198
G1 X115.37 Y125.593 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.400172
G1 F2039
G3 X115.603 Y124.649 I19.24 J4.253 E.02745
G1 X115.58 Y124.641 F30000
; LINE_WIDTH: 0.245106
G1 F2039
G1 X115.47 Y125.218 E.00938
; LINE_WIDTH: 0.224623
G1 X115.451 Y125.332 E.00165
; LINE_WIDTH: 0.18743
G1 X115.433 Y125.445 E.00132
; LINE_WIDTH: 0.149524
G1 X115.413 Y125.563 E.00101
; LINE_WIDTH: 0.113676
G1 X115.394 Y125.739 E.00099
G1 X115.709 Y128.514 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.6454
G1 F2039
G2 X115.716 Y128.631 I-.034 J.061 E.01434
; WIPE_START
G1 F5975.302
G1 X115.633 Y128.644 E-.20603
G1 X115.596 Y128.579 E-.18466
G1 X115.633 Y128.514 E-.18467
G1 X115.709 Y128.514 E-.18464
; WIPE_END
G1 E-.04 F1800
G1 X117.248 Y129.137 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.112351
G1 F2039
G1 X117.404 Y129.244 E.00104
G1 X117.505 Y129.266 E.00057
; WIPE_START
G1 F15000
G1 X117.404 Y129.244 E-.26793
G1 X117.248 Y129.137 E-.49207
; WIPE_END
G1 E-.04 F1800
G1 X119.995 Y129.266 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.112398
G1 F2039
G1 X120.096 Y129.244 E.00057
G1 X120.253 Y129.137 E.00104
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P69 R3
G1 F15000
G1 X120.096 Y129.244 E-.4921
G1 X119.995 Y129.266 E-.2679
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
G1 F2053
G1 X118.988 Y124.121 E.0037
G3 X119.458 Y124.204 I-.329 J3.242 E.01536
G3 X118.595 Y124.105 I-.701 J2.297 E.45711
G1 X118.814 Y124.107 E.00705
G1 X118.599 Y124.498 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2053
M204 S5000
G1 X118.614 Y124.497 E.00045
G3 X119.148 Y124.53 I.134 J2.161 E.01599
G3 X118.352 Y124.533 I-.39 J1.97 E.35206
G1 X118.54 Y124.507 E.00563
; WIPE_START
G1 F9547.055
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
G1 F2053
G1 X120.671 Y129.084 E.64837
G2 X116.829 Y129.084 I-1.921 J-2.581 E.51766
G1 X115.166 Y129.084 E.05348
G1 X115.166 Y122.916 E.19833
G1 X140.834 Y122.916 E.82538
G1 X140.834 Y129.024 E.1964
G1 X141.241 Y129.491 F30000
G1 F2053
G1 X119.231 Y129.491 E.70777
G1 X119.209 Y129.271 E.00711
G2 X118.291 Y129.271 I-.459 J-2.77 E.53772
G1 X118.269 Y129.491 E.00711
G1 X114.759 Y129.491 E.11288
G1 X114.759 Y122.509 E.22451
G1 X141.241 Y122.509 E.85156
G1 X141.241 Y129.431 E.22258
G1 X141.648 Y129.898 F30000
G1 F2053
G1 X114.352 Y129.898 E.87774
G1 X114.352 Y122.102 E.25069
G1 X141.648 Y122.102 E.87774
G1 X141.648 Y129.838 E.24876
G1 X142.04 Y130.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2053
M204 S5000
G1 X113.96 Y130.29 E.83641
G1 X113.96 Y121.71 E.25557
G1 X142.04 Y121.71 E.83641
G1 X142.04 Y130.23 E.25378
; WIPE_START
G1 F9547.055
M204 S10000
G1 X140.04 Y130.234 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.486 Y123.4 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2053
G1 X140.486 Y125.028 E.05236
G1 X136.778 Y128.736 E.16859
G1 X136.493 Y128.736 E.00919
G1 X131.021 Y123.264 E.2488
G1 X130.736 Y123.264 E.00919
G1 X125.264 Y128.736 E.2488
G1 X124.979 Y128.736 E.00919
G1 X122.282 Y126.039 E.12261
G1 X122.274 Y125.969 E.00227
G1 X124.979 Y123.264 E.12301
G1 X125.264 Y123.264 E.00919
G1 X130.736 Y128.736 E.2488
G1 X131.021 Y128.736 E.00919
G1 X136.493 Y123.264 E.2488
G1 X136.778 Y123.264 E.00919
G1 X140.486 Y126.972 E.16859
G1 X140.486 Y128.6 E.05236
; WIPE_START
G1 F8843.478
G1 X140.486 Y126.972 E-.61876
G1 X140.223 Y126.709 E-.14125
; WIPE_END
G1 E-.04 F1800
G1 X132.646 Y127.63 Z1.4 F30000
G1 X120.253 Y129.137 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.112384
G1 F2053
G1 X120.096 Y129.244 E.00104
G1 X119.995 Y129.266 E.00057
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
M73 P70 R3
G1 F2053
G1 X117.404 Y129.244 E.00057
G1 X117.248 Y129.137 E.00104
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
G1 F2053
G2 X115.716 Y128.631 I-.034 J.061 E.01434
G1 X115.394 Y125.739 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.113678
G1 F2053
G1 X115.414 Y125.563 E.00099
; LINE_WIDTH: 0.149511
G1 X115.433 Y125.445 E.00101
; LINE_WIDTH: 0.187383
G1 X115.451 Y125.332 E.00131
; LINE_WIDTH: 0.224544
G1 X115.47 Y125.218 E.00165
; LINE_WIDTH: 0.245045
G1 X115.579 Y124.641 E.00938
G1 X115.603 Y124.649 F30000
; LINE_WIDTH: 0.400138
G1 F2053
G2 X115.37 Y125.592 I19.393 J5.298 E.02741
G1 X116.554 Y123.648 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F2053
G1 X116.485 Y123.308 E.01033
G1 X115.558 Y123.308 E.02759
G1 X115.558 Y124.231 E.02749
G1 X115.887 Y124.319 E.01012
G3 X116.508 Y123.687 I2.11 J1.453 E.02653
G1 X115.957 Y123.643 F30000
; LINE_WIDTH: 0.4159
G1 F2053
G1 X115.887 Y123.683 E.00238
G1 X115.945 Y123.717 E.00198
G1 X116.89 Y123.336 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.275329
G1 F2053
G3 X117.495 Y123.217 I2.636 J11.743 E.01131
; LINE_WIDTH: 0.217026
G1 X117.608 Y123.197 E.00159
; LINE_WIDTH: 0.17695
G1 X117.722 Y123.177 E.00122
; LINE_WIDTH: 0.141288
G1 X117.857 Y123.16 E.00106
; LINE_WIDTH: 0.111491
G1 X117.987 Y123.143 E.00071
G1 X119.513 Y123.143 F30000
; LINE_WIDTH: 0.111463
G1 F2053
G1 X119.643 Y123.16 E.00071
; LINE_WIDTH: 0.140547
G1 X119.772 Y123.176 E.00101
; LINE_WIDTH: 0.175866
G1 X119.892 Y123.197 E.00127
; LINE_WIDTH: 0.216984
G1 X120.005 Y123.217 E.00159
; LINE_WIDTH: 0.257119
G1 X120.119 Y123.237 E.00196
; LINE_WIDTH: 0.279564
G1 X120.61 Y123.336 E.00935
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
G1 F2038
G1 X118.988 Y124.121 E.00318
G3 X119.458 Y124.204 I-.334 J3.267 E.01536
G3 X118.606 Y124.104 I-.7 J2.297 E.45747
G1 X118.83 Y124.107 E.00719
G1 X118.614 Y124.497 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2038
M204 S5000
G1 X118.626 Y124.496 E.00037
G3 X119.148 Y124.53 I.123 J2.152 E.01563
G3 X118.352 Y124.533 I-.389 J1.971 E.35205
G1 X118.554 Y124.506 E.00607
; WIPE_START
G1 F9547.055
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
G1 F2038
G1 X120.671 Y129.084 E.64837
G2 X116.829 Y129.084 I-1.921 J-2.581 E.51768
G1 X115.166 Y129.084 E.05348
G1 X115.166 Y122.916 E.19833
G1 X140.834 Y122.916 E.82538
G1 X140.834 Y129.024 E.1964
G1 X141.241 Y129.491 F30000
G1 F2038
G1 X119.231 Y129.491 E.70777
G1 X119.209 Y129.271 E.00711
G2 X118.291 Y129.271 I-.459 J-2.77 E.53773
G1 X118.269 Y129.491 E.00711
G1 X114.759 Y129.491 E.11288
G1 X114.759 Y122.509 E.22451
G1 X141.241 Y122.509 E.85156
G1 X141.241 Y129.431 E.22258
G1 X141.648 Y129.898 F30000
G1 F2038
G1 X114.352 Y129.898 E.87774
G1 X114.352 Y122.102 E.25069
G1 X141.648 Y122.102 E.87774
G1 X141.648 Y129.838 E.24876
G1 X142.04 Y130.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2038
M204 S5000
G1 X113.96 Y130.29 E.83641
G1 X113.96 Y121.71 E.25557
G1 X142.04 Y121.71 E.83641
G1 X142.04 Y130.23 E.25378
; WIPE_START
G1 F9547.055
M204 S10000
G1 X140.04 Y130.234 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.486 Y128.6 Z1.6 F30000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2038
G1 X140.486 Y126.972 E.05236
G1 X136.778 Y123.264 E.16859
G1 X136.493 Y123.264 E.00919
G1 X131.021 Y128.736 E.2488
G1 X130.736 Y128.736 E.00919
G1 X125.264 Y123.264 E.2488
G1 X124.979 Y123.264 E.00919
G1 X122.274 Y125.969 E.12301
G1 X122.282 Y126.039 E.00227
G1 X124.979 Y128.736 E.12261
G1 X125.264 Y128.736 E.00919
G1 X130.736 Y123.264 E.2488
G1 X131.021 Y123.264 E.00919
G1 X136.493 Y128.736 E.2488
G1 X136.778 Y128.736 E.00919
G1 X140.486 Y125.028 E.16859
M73 P71 R3
G1 X140.486 Y123.4 E.05236
G1 X120.61 Y123.336 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.279526
G1 F2038
G1 X120.119 Y123.237 E.00935
; LINE_WIDTH: 0.257083
G1 X120.005 Y123.217 E.00195
; LINE_WIDTH: 0.216978
G1 X119.892 Y123.197 E.00159
; LINE_WIDTH: 0.175893
G1 X119.772 Y123.176 E.00127
; LINE_WIDTH: 0.14058
G1 X119.643 Y123.16 E.00101
; LINE_WIDTH: 0.111474
G1 X119.513 Y123.143 E.00071
G1 X117.987 Y123.143 F30000
; LINE_WIDTH: 0.111454
G1 F2038
G1 X117.857 Y123.16 E.00071
; LINE_WIDTH: 0.141182
G1 X117.722 Y123.177 E.00106
; LINE_WIDTH: 0.176852
G1 X117.608 Y123.197 E.00122
; LINE_WIDTH: 0.216983
G1 X117.495 Y123.217 E.00159
; LINE_WIDTH: 0.275342
G2 X116.89 Y123.336 I2.117 J12.344 E.01131
G1 X116.553 Y123.648 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F2038
G1 X116.485 Y123.308 E.01034
G1 X115.558 Y123.308 E.02759
G1 X115.558 Y124.231 E.02748
G1 X115.887 Y124.319 E.01012
G3 X116.508 Y123.687 I2.11 J1.453 E.02652
G1 X115.957 Y123.643 F30000
; LINE_WIDTH: 0.41588
M73 P72 R3
G1 F2038
G1 X115.887 Y123.683 E.00238
G1 X115.945 Y123.717 E.00198
G1 X115.37 Y125.593 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.400102
G1 F2038
G3 X115.603 Y124.649 I19.126 J4.229 E.02743
G1 X115.579 Y124.641 F30000
; LINE_WIDTH: 0.245144
G1 F2038
G1 X115.47 Y125.218 E.00938
; LINE_WIDTH: 0.224639
G1 X115.451 Y125.332 E.00165
; LINE_WIDTH: 0.187439
G1 X115.433 Y125.445 E.00132
; LINE_WIDTH: 0.149527
G1 X115.413 Y125.564 E.00101
; LINE_WIDTH: 0.113666
G1 X115.394 Y125.739 E.00099
G1 X115.709 Y128.514 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.64544
G1 F2038
G2 X115.716 Y128.631 I-.034 J.061 E.01434
; WIPE_START
G1 F5974.905
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
G1 F2038
G1 X117.404 Y129.244 E.00104
G1 X117.505 Y129.266 E.00056
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
G1 F2038
G1 X120.096 Y129.244 E.00057
G1 X120.252 Y129.137 E.00104
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
G1 F2053
G1 X118.618 Y124.104 E.00187
G3 X119.458 Y124.204 I.031 J3.315 E.02727
G3 X118.275 Y124.149 I-.7 J2.297 E.44669
G1 X118.501 Y124.119 E.00735
G1 X118.629 Y124.496 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2053
M204 S5000
G1 X118.638 Y124.495 E.00028
G3 X119.148 Y124.53 I.112 J2.148 E.01527
G3 X118.352 Y124.533 I-.389 J1.971 E.35204
G1 X118.569 Y124.504 E.00651
; WIPE_START
G1 F9547.055
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
G1 F2053
G1 X120.671 Y129.084 E.64837
G2 X116.829 Y129.084 I-1.921 J-2.581 E.51769
G1 X115.166 Y129.084 E.05348
G1 X115.166 Y122.916 E.19833
G1 X140.834 Y122.916 E.82538
G1 X140.834 Y129.024 E.1964
G1 X141.241 Y129.491 F30000
G1 F2053
G1 X119.231 Y129.491 E.70777
G1 X119.209 Y129.271 E.00711
G2 X118.291 Y129.271 I-.459 J-2.77 E.53775
G1 X118.269 Y129.491 E.00711
G1 X114.759 Y129.491 E.11288
G1 X114.759 Y122.509 E.22451
G1 X141.241 Y122.509 E.85156
G1 X141.241 Y129.431 E.22258
G1 X141.648 Y129.898 F30000
G1 F2053
G1 X114.352 Y129.898 E.87774
G1 X114.352 Y122.102 E.25069
G1 X141.648 Y122.102 E.87774
G1 X141.648 Y129.838 E.24876
G1 X142.04 Y130.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2053
M204 S5000
G1 X113.96 Y130.29 E.83641
G1 X113.96 Y121.71 E.25557
G1 X142.04 Y121.71 E.83641
G1 X142.04 Y130.23 E.25378
; WIPE_START
G1 F9547.055
M204 S10000
G1 X140.04 Y130.234 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.486 Y123.4 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2053
G1 X140.486 Y125.028 E.05236
G1 X136.778 Y128.736 E.16859
G1 X136.493 Y128.736 E.00919
G1 X131.021 Y123.264 E.2488
G1 X130.736 Y123.264 E.00919
G1 X125.264 Y128.736 E.2488
G1 X124.979 Y128.736 E.00919
G1 X122.282 Y126.039 E.12261
G1 X122.274 Y125.969 E.00227
G1 X124.979 Y123.264 E.12301
G1 X125.264 Y123.264 E.00919
G1 X130.736 Y128.736 E.2488
G1 X131.021 Y128.736 E.00919
G1 X136.493 Y123.264 E.2488
G1 X136.778 Y123.264 E.00919
G1 X140.486 Y126.972 E.16859
G1 X140.486 Y128.6 E.05236
; WIPE_START
G1 F8843.478
G1 X140.486 Y126.972 E-.61876
G1 X140.223 Y126.709 E-.14125
; WIPE_END
G1 E-.04 F1800
M73 P73 R3
G1 X132.646 Y127.63 Z1.8 F30000
G1 X120.253 Y129.137 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.112406
G1 F2053
G1 X120.096 Y129.244 E.00104
G1 X119.995 Y129.266 E.00057
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
G1 F2053
G1 X117.404 Y129.244 E.00057
G1 X117.248 Y129.138 E.00104
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
G1 F2053
G2 X115.716 Y128.631 I-.034 J.061 E.01434
G1 X115.394 Y125.739 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.113666
G1 F2053
G1 X115.413 Y125.564 E.00099
; LINE_WIDTH: 0.149527
G1 X115.433 Y125.445 E.00101
; LINE_WIDTH: 0.187439
G1 X115.451 Y125.332 E.00132
; LINE_WIDTH: 0.224639
G1 X115.47 Y125.218 E.00165
; LINE_WIDTH: 0.245144
G1 X115.579 Y124.641 E.00938
G1 X115.603 Y124.649 F30000
; LINE_WIDTH: 0.400125
M73 P74 R3
G1 F2053
G2 X115.37 Y125.593 I18.984 J5.193 E.02744
G1 X116.553 Y123.648 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F2053
G1 X116.485 Y123.308 E.01033
G1 X115.558 Y123.308 E.02759
G1 X115.558 Y124.231 E.02748
G1 X115.887 Y124.319 E.01012
G3 X116.508 Y123.687 I2.109 J1.452 E.02652
G1 X115.957 Y123.643 F30000
; LINE_WIDTH: 0.41588
G1 F2053
G1 X115.887 Y123.683 E.00238
G1 X115.945 Y123.717 E.00198
G1 X116.89 Y123.336 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.275363
G1 F2053
G3 X117.495 Y123.217 I2.714 J12.181 E.01131
; LINE_WIDTH: 0.216993
G1 X117.608 Y123.197 E.00159
; LINE_WIDTH: 0.176855
G1 X117.722 Y123.177 E.00122
; LINE_WIDTH: 0.141182
G1 X117.857 Y123.16 E.00106
; LINE_WIDTH: 0.111452
G1 X117.987 Y123.143 E.00071
G1 X119.513 Y123.143 F30000
; LINE_WIDTH: 0.111463
G1 F2053
G1 X119.643 Y123.16 E.00071
; LINE_WIDTH: 0.140547
G1 X119.772 Y123.176 E.00101
; LINE_WIDTH: 0.175863
G1 X119.892 Y123.197 E.00127
; LINE_WIDTH: 0.216974
G1 X120.005 Y123.217 E.00159
; LINE_WIDTH: 0.257104
G1 X120.119 Y123.237 E.00196
; LINE_WIDTH: 0.279564
G1 X120.61 Y123.336 E.00936
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
G1 F2038
G1 X119.226 Y124.145 E.01221
G3 X118.511 Y124.109 I-.476 J2.349 E.46115
G1 X118.75 Y124.097 E.0077
G1 X118.789 Y124.101 E.00125
G1 X118.641 Y124.495 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2038
M204 S5000
G1 X118.75 Y124.49 E.00325
G3 X118.55 Y124.5 I0 J2.005 E.36932
G1 X118.581 Y124.498 E.00093
; WIPE_START
G1 F9547.055
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
G1 F2038
G1 X120.671 Y129.084 E.64837
G2 X116.829 Y129.084 I-1.921 J-2.581 E.51769
G1 X115.166 Y129.084 E.05348
G1 X115.166 Y122.916 E.19833
G1 X140.834 Y122.916 E.82538
G1 X140.834 Y129.024 E.1964
G1 X141.241 Y129.491 F30000
G1 F2038
G1 X119.231 Y129.491 E.70777
G1 X119.209 Y129.271 E.00711
G2 X118.291 Y129.271 I-.459 J-2.772 E.53802
G1 X118.269 Y129.491 E.00711
G1 X114.759 Y129.491 E.11288
G1 X114.759 Y122.509 E.22451
G1 X141.241 Y122.509 E.85156
G1 X141.241 Y129.431 E.22258
G1 X141.648 Y129.898 F30000
G1 F2038
G1 X114.352 Y129.898 E.87774
G1 X114.352 Y122.102 E.25069
G1 X141.648 Y122.102 E.87774
G1 X141.648 Y129.838 E.24876
G1 X142.04 Y130.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2038
M204 S5000
G1 X113.96 Y130.29 E.83641
G1 X113.96 Y121.71 E.25557
G1 X142.04 Y121.71 E.83641
G1 X142.04 Y130.23 E.25378
; WIPE_START
G1 F9547.055
M204 S10000
G1 X140.04 Y130.234 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.486 Y128.6 Z2 F30000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2038
G1 X140.486 Y126.972 E.05236
G1 X136.778 Y123.264 E.16859
G1 X136.493 Y123.264 E.00919
G1 X131.021 Y128.736 E.2488
G1 X130.736 Y128.736 E.00919
G1 X125.264 Y123.264 E.2488
G1 X124.979 Y123.264 E.00919
G1 X122.274 Y125.969 E.12301
G1 X122.282 Y126.039 E.00227
G1 X124.979 Y128.736 E.12261
G1 X125.264 Y128.736 E.00919
G1 X130.736 Y123.264 E.2488
G1 X131.021 Y123.264 E.00919
G1 X136.493 Y128.736 E.2488
G1 X136.778 Y128.736 E.00919
G1 X140.486 Y125.028 E.16859
G1 X140.486 Y123.4 E.05236
G1 X120.61 Y123.336 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.279511
G1 F2038
G1 X120.119 Y123.237 E.00935
; LINE_WIDTH: 0.257086
G1 X120.005 Y123.217 E.00195
; LINE_WIDTH: 0.216971
G1 X119.892 Y123.197 E.00159
; LINE_WIDTH: 0.175875
G1 X119.772 Y123.176 E.00127
; LINE_WIDTH: 0.140547
G1 X119.643 Y123.16 E.00101
; LINE_WIDTH: 0.111463
G1 X119.513 Y123.143 E.00071
G1 X117.987 Y123.143 F30000
; LINE_WIDTH: 0.111452
G1 F2038
G1 X117.857 Y123.16 E.00071
; LINE_WIDTH: 0.141182
G1 X117.722 Y123.177 E.00106
; LINE_WIDTH: 0.176845
G1 X117.608 Y123.197 E.00122
; LINE_WIDTH: 0.216963
M73 P75 R3
G1 X117.495 Y123.217 E.00159
; LINE_WIDTH: 0.275328
G2 X116.89 Y123.336 I2.065 J12.045 E.01131
G1 X116.553 Y123.648 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F2038
G1 X116.485 Y123.308 E.01033
G1 X115.558 Y123.308 E.02759
G1 X115.558 Y124.231 E.02748
G1 X115.887 Y124.319 E.01012
G3 X116.508 Y123.687 I2.11 J1.453 E.02653
G1 X115.957 Y123.643 F30000
; LINE_WIDTH: 0.41588
G1 F2038
G1 X115.887 Y123.683 E.00238
M73 P75 R2
G1 X115.945 Y123.717 E.00198
G1 X115.37 Y125.593 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.400176
G1 F2038
G3 X115.603 Y124.649 I19.158 J4.233 E.02745
G1 X115.579 Y124.641 F30000
; LINE_WIDTH: 0.245064
G1 F2038
G1 X115.47 Y125.218 E.00938
; LINE_WIDTH: 0.224583
G1 X115.451 Y125.332 E.00165
; LINE_WIDTH: 0.187398
G1 X115.433 Y125.445 E.00131
; LINE_WIDTH: 0.1495
G1 X115.413 Y125.564 E.00101
; LINE_WIDTH: 0.113666
G1 X115.394 Y125.739 E.00099
G1 X115.709 Y128.514 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.64542
G1 F2038
G2 X115.716 Y128.631 I-.034 J.061 E.01434
; WIPE_START
G1 F5975.104
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
G1 F2038
G1 X117.404 Y129.244 E.00104
G1 X117.505 Y129.266 E.00057
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
G1 F2038
G1 X120.096 Y129.244 E.00057
G1 X120.252 Y129.137 E.00104
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
G1 F2040
G1 X118.988 Y124.121 E.00158
G3 X119.458 Y124.204 I-.353 J3.379 E.01537
G3 X118.642 Y124.103 I-.7 J2.297 E.45861
G1 X118.881 Y124.107 E.00766
G1 X118.659 Y124.494 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2040
M204 S5000
G1 X118.662 Y124.494 E.00009
G3 X119.148 Y124.53 I.087 J2.157 E.01456
G3 X118.352 Y124.534 I-.388 J1.971 E.35204
G1 X118.599 Y124.502 E.00742
; WIPE_START
G1 F9547.055
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
G1 F2040
G1 X120.671 Y129.084 E.64837
G2 X116.829 Y129.084 I-1.921 J-2.581 E.51772
G1 X115.166 Y129.084 E.05348
G1 X115.166 Y122.916 E.19833
G1 X140.834 Y122.916 E.82538
G1 X140.834 Y129.024 E.1964
G1 X141.241 Y129.491 F30000
G1 F2040
G1 X119.231 Y129.491 E.70777
G1 X119.209 Y129.271 E.00711
G2 X118.291 Y129.271 I-.459 J-2.771 E.53778
G1 X118.269 Y129.491 E.00711
G1 X114.759 Y129.491 E.11288
G1 X114.759 Y122.509 E.22451
G1 X141.241 Y122.509 E.85156
G1 X141.241 Y129.431 E.22258
M73 P76 R2
G1 X141.648 Y129.898 F30000
G1 F2040
G1 X114.352 Y129.898 E.87774
G1 X114.352 Y122.102 E.25069
G1 X141.648 Y122.102 E.87774
G1 X141.648 Y129.838 E.24876
G1 X142.04 Y130.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2040
M204 S5000
G1 X113.96 Y130.29 E.83641
G1 X113.96 Y121.71 E.25557
G1 X142.04 Y121.71 E.83641
G1 X142.04 Y130.23 E.25378
; WIPE_START
G1 F9547.055
M204 S10000
G1 X140.04 Y130.234 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.486 Y128.6 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2040
G1 X140.486 Y126.972 E.05236
G1 X136.778 Y123.264 E.16859
G1 X136.493 Y123.264 E.00919
G1 X131.021 Y128.736 E.2488
G1 X130.736 Y128.736 E.00919
G1 X125.264 Y123.264 E.2488
G1 X124.979 Y123.264 E.00919
G1 X122.274 Y125.969 E.12301
G1 X122.282 Y126.039 E.00227
G1 X124.979 Y128.736 E.12261
G1 X125.264 Y128.736 E.00919
G1 X130.736 Y123.264 E.2488
G1 X131.021 Y123.264 E.00919
G1 X136.493 Y128.736 E.2488
G1 X136.778 Y128.736 E.00919
G1 X140.486 Y125.028 E.16859
G1 X140.486 Y123.4 E.05236
G1 X120.61 Y123.336 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.279521
G1 F2040
G1 X120.119 Y123.237 E.00935
; LINE_WIDTH: 0.257092
G1 X120.005 Y123.217 E.00195
; LINE_WIDTH: 0.216991
G1 X119.892 Y123.197 E.00159
; LINE_WIDTH: 0.175909
G1 X119.772 Y123.176 E.00127
; LINE_WIDTH: 0.140594
G1 X119.643 Y123.16 E.00101
; LINE_WIDTH: 0.111478
G1 X119.513 Y123.143 E.00071
G1 X117.987 Y123.143 F30000
; LINE_WIDTH: 0.111463
G1 F2040
G1 X117.857 Y123.16 E.00071
; LINE_WIDTH: 0.141213
G1 X117.722 Y123.177 E.00106
; LINE_WIDTH: 0.176866
G1 X117.608 Y123.197 E.00122
; LINE_WIDTH: 0.216976
G1 X117.495 Y123.217 E.00159
; LINE_WIDTH: 0.275308
G2 X116.89 Y123.336 I2.107 J12.287 E.01131
G1 X116.553 Y123.648 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F2040
G1 X116.485 Y123.308 E.01033
G1 X115.558 Y123.308 E.02759
M73 P77 R2
G1 X115.558 Y124.231 E.02749
G1 X115.887 Y124.319 E.01012
G3 X116.508 Y123.687 I2.109 J1.452 E.02652
G1 X115.957 Y123.643 F30000
; LINE_WIDTH: 0.41586
G1 F2040
G1 X115.887 Y123.683 E.00238
G1 X115.945 Y123.717 E.00198
G1 X115.37 Y125.593 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.400155
G1 F2040
G3 X115.603 Y124.649 I19.466 J4.31 E.02744
G1 X115.579 Y124.641 F30000
; LINE_WIDTH: 0.245095
G1 F2040
G1 X115.47 Y125.218 E.00937
; LINE_WIDTH: 0.224593
G1 X115.451 Y125.332 E.00165
; LINE_WIDTH: 0.187404
G1 X115.433 Y125.445 E.00132
; LINE_WIDTH: 0.149503
G1 X115.413 Y125.563 E.00101
; LINE_WIDTH: 0.113666
G1 X115.394 Y125.739 E.00099
G1 X115.709 Y128.514 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.64542
G1 F2040
G2 X115.716 Y128.631 I-.034 J.061 E.01434
; WIPE_START
G1 F5975.104
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
G1 F2040
G1 X117.404 Y129.244 E.00104
G1 X117.505 Y129.266 E.00056
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
G1 F2040
G1 X120.096 Y129.244 E.00057
G1 X120.252 Y129.137 E.00104
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
G1 F2292
G1 X118.988 Y124.121 E.00108
G3 X119.458 Y124.204 I-.363 J3.434 E.01536
G3 X118.654 Y124.102 I-.7 J2.297 E.459
G1 X118.897 Y124.107 E.00781
G1 X118.674 Y124.494 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2292
M204 S5000
G3 X119.148 Y124.53 I.073 J2.174 E.0142
G3 X118.614 Y124.497 I-.388 J1.971 E.35991
; WIPE_START
G1 F9547.055
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
G1 F2292
G1 X120.671 Y129.084 E.64837
G2 X116.829 Y129.084 I-1.921 J-2.581 E.51773
G1 X115.166 Y129.084 E.05348
G1 X115.166 Y122.916 E.19833
G1 X140.834 Y122.916 E.82538
G1 X140.834 Y129.024 E.1964
G1 X141.241 Y129.491 F30000
G1 F2292
G1 X119.231 Y129.491 E.70777
G1 X119.209 Y129.271 E.00711
G2 X118.291 Y129.271 I-.459 J-2.771 E.53779
G1 X118.269 Y129.491 E.00711
G1 X114.759 Y129.491 E.11288
G1 X114.759 Y122.509 E.22451
G1 X141.241 Y122.509 E.85156
G1 X141.241 Y129.431 E.22258
G1 X141.648 Y129.898 F30000
G1 F2292
G1 X114.352 Y129.898 E.87774
G1 X114.352 Y122.102 E.25069
G1 X141.648 Y122.102 E.87774
G1 X141.648 Y129.838 E.24876
G1 X142.04 Y130.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2292
M204 S5000
G1 X113.96 Y130.29 E.83641
G1 X113.96 Y121.71 E.25557
G1 X142.04 Y121.71 E.83641
G1 X142.04 Y130.23 E.25378
; WIPE_START
G1 F9547.055
M204 S10000
G1 X140.04 Y130.234 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.471 Y128.562 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383272
G1 F2292
G1 X140.471 Y123.438 E.13775
G1 X140.444 Y123.306 E.00362
G1 X140.312 Y123.279 E.00362
G1 X121.122 Y123.279 E.51593
G1 X121.008 Y123.299 E.0031
G1 X120.931 Y123.583 E.0079
G1 X120.931 Y123.654 E.00191
G1 X121.303 Y123.99 E.01347
G1 X121.748 Y124.545 E.01914
G1 X122.076 Y125.177 E.01916
G1 X122.272 Y125.863 E.01917
G1 X122.329 Y126.573 E.01916
G1 X122.243 Y127.281 E.01917
G1 X122.019 Y127.958 E.01916
G1 X121.724 Y128.482 E.01618
; LINE_WIDTH: 0.406595
G1 X121.699 Y128.573 E.00269
; LINE_WIDTH: 0.437803
G1 X121.673 Y128.663 E.00293
M73 P78 R2
G1 X121.866 Y128.721 E.00627
; LINE_WIDTH: 0.383106
G1 X140.312 Y128.721 E.49569
G1 X140.444 Y128.694 E.00362
G1 X140.459 Y128.621 E.00201
G1 X140.108 Y123.777 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2292
G1 X140.108 Y125.406 E.05236
G1 X137.156 Y128.358 E.13428
G1 X136.115 Y128.358 E.03345
G1 X131.399 Y123.642 E.2145
G1 X130.358 Y123.642 E.03345
G1 X125.642 Y128.358 E.2145
G1 X124.601 Y128.358 E.03345
G1 X122.689 Y126.446 E.08695
G2 X122.596 Y125.647 I-3.972 J.058 E.02592
G1 X124.601 Y123.642 E.0912
G1 X125.642 Y123.642 E.03345
G1 X130.358 Y128.358 E.2145
G1 X131.399 Y128.358 E.03345
G1 X136.115 Y123.642 E.2145
G1 X137.156 Y123.642 E.03345
G1 X140.108 Y126.594 E.13428
G1 X140.108 Y128.223 E.05236
; WIPE_START
G1 F8843.478
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
G1 F2292
G1 X120.096 Y129.244 E.00104
G1 X119.995 Y129.266 E.00057
; WIPE_START
M73 P79 R2
G1 F15000
G1 X120.096 Y129.244 E-.2679
G1 X120.252 Y129.137 E-.4921
; WIPE_END
G1 E-.04 F1800
G1 X117.505 Y129.266 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.112356
G1 F2292
G1 X117.404 Y129.244 E.00057
G1 X117.248 Y129.137 E.00104
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
G1 F2292
G2 X115.716 Y128.631 I-.034 J.061 E.01434
G1 X115.394 Y125.739 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.113666
G1 F2292
G1 X115.413 Y125.564 E.00099
; LINE_WIDTH: 0.149527
G1 X115.433 Y125.445 E.00101
; LINE_WIDTH: 0.187439
G1 X115.451 Y125.332 E.00132
; LINE_WIDTH: 0.224639
G1 X115.47 Y125.218 E.00165
; LINE_WIDTH: 0.245144
G1 X115.579 Y124.641 E.00938
G1 X115.603 Y124.649 F30000
; LINE_WIDTH: 0.400156
G1 F2292
G2 X115.37 Y125.593 I19.064 J5.214 E.02744
G1 X116.553 Y123.648 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F2292
G1 X116.485 Y123.308 E.01033
G1 X115.558 Y123.308 E.02759
G1 X115.558 Y124.231 E.02749
G1 X115.887 Y124.319 E.01012
G3 X116.508 Y123.687 I2.109 J1.452 E.02652
G1 X115.957 Y123.643 F30000
; LINE_WIDTH: 0.41588
G1 F2292
G1 X115.887 Y123.683 E.00238
G1 X115.945 Y123.717 E.00198
G1 X116.89 Y123.336 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.275311
G1 F2292
G3 X117.495 Y123.217 I2.709 J12.155 E.01131
; LINE_WIDTH: 0.217004
G1 X117.608 Y123.197 E.00159
; LINE_WIDTH: 0.176913
G1 X117.722 Y123.177 E.00122
; LINE_WIDTH: 0.141242
G1 X117.857 Y123.16 E.00106
; LINE_WIDTH: 0.111473
G1 X117.987 Y123.143 E.00071
G1 X119.513 Y123.143 F30000
; LINE_WIDTH: 0.111474
G1 F2292
G1 X119.643 Y123.16 E.00071
; LINE_WIDTH: 0.14058
G1 X119.772 Y123.176 E.00101
; LINE_WIDTH: 0.175889
G1 X119.892 Y123.197 E.00127
; LINE_WIDTH: 0.216972
G1 X120.005 Y123.217 E.00159
; LINE_WIDTH: 0.257073
G1 X120.119 Y123.237 E.00195
; LINE_WIDTH: 0.279521
G1 X120.61 Y123.336 E.00936
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
G1 F3014
G1 X119.458 Y124.204 E.01391
G3 X118.666 Y124.101 I-.7 J2.297 E.45939
G3 X118.974 Y124.12 I-.053 J3.521 E.00993
G1 X118.689 Y124.493 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3014
M204 S5000
G1 X118.95 Y124.502 E.00778
G3 X119.148 Y124.53 I-.206 J2.194 E.00597
G3 X118.629 Y124.496 I-.389 J1.971 E.36037
; WIPE_START
G1 F9547.055
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
G1 F3014
G1 X120.671 Y129.084 E.64837
G2 X116.829 Y129.084 I-1.921 J-2.582 E.51775
G1 X115.166 Y129.084 E.05348
G1 X115.166 Y122.916 E.19833
G1 X140.834 Y122.916 E.82538
G1 X140.834 Y129.024 E.1964
G1 X141.241 Y129.491 F30000
G1 F3014
G1 X119.231 Y129.491 E.70777
G1 X119.209 Y129.271 E.00711
G2 X118.291 Y129.271 I-.459 J-2.771 E.53781
G1 X118.269 Y129.491 E.00711
G1 X114.759 Y129.491 E.11288
G1 X114.759 Y122.509 E.22451
G1 X141.241 Y122.509 E.85156
G1 X141.241 Y129.431 E.22258
G1 X141.648 Y129.898 F30000
G1 F3014
G1 X114.352 Y129.898 E.87774
G1 X114.352 Y122.102 E.25069
G1 X141.648 Y122.102 E.87774
G1 X141.648 Y129.838 E.24876
G1 X142.04 Y130.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3014
M204 S5000
G1 X113.96 Y130.29 E.83641
G1 X113.96 Y121.71 E.25557
G1 X142.04 Y121.71 E.83641
G1 X142.04 Y130.23 E.25378
; WIPE_START
G1 F9547.055
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
M106 S229.5
G1 F3000
G1 X140.464 Y128.198 E.05176
G1 X140.464 Y127.554 E.0328
G1 X139.304 Y128.714 E.08356
G1 X138.661 Y128.714 E.0328
G1 X140.464 Y126.911 E.12995
G1 X140.464 Y126.267 E.0328
G1 X138.017 Y128.714 E.17634
G1 X137.373 Y128.714 E.0328
G1 X140.464 Y125.623 E.22273
G1 X140.464 Y124.979 E.0328
G1 X136.729 Y128.714 E.26912
G1 X136.085 Y128.714 E.0328
G1 X140.464 Y124.335 E.31551
G1 X140.464 Y123.691 E.0328
G1 X135.441 Y128.714 E.36191
G1 X134.797 Y128.714 E.0328
G1 X140.226 Y123.286 E.39111
G1 X139.582 Y123.286 E.0328
G1 X134.154 Y128.714 E.39111
G1 X133.51 Y128.714 E.0328
G1 X138.938 Y123.286 E.39111
G1 X138.294 Y123.286 E.0328
G1 X132.866 Y128.714 E.39111
G1 X132.222 Y128.714 E.0328
G1 X137.65 Y123.286 E.39111
G1 X137.006 Y123.286 E.0328
G1 X131.578 Y128.714 E.39111
G1 X130.934 Y128.714 E.0328
G1 X136.362 Y123.286 E.39111
G1 X135.719 Y123.286 E.0328
M73 P80 R2
G1 X130.291 Y128.714 E.39111
G1 X129.647 Y128.714 E.0328
G1 X135.075 Y123.286 E.39111
G1 X134.431 Y123.286 E.0328
G1 X129.003 Y128.714 E.39111
G1 X128.359 Y128.714 E.0328
G1 X133.787 Y123.286 E.39111
G1 X133.143 Y123.286 E.0328
G1 X127.715 Y128.714 E.39111
G1 X127.071 Y128.714 E.0328
G1 X132.499 Y123.286 E.39111
G1 X131.856 Y123.286 E.0328
G1 X126.427 Y128.714 E.39111
G1 X125.784 Y128.714 E.0328
G1 X131.212 Y123.286 E.39111
G1 X130.568 Y123.286 E.0328
G1 X125.14 Y128.714 E.39111
G1 X124.496 Y128.714 E.0328
G1 X129.924 Y123.286 E.39111
G1 X129.28 Y123.286 E.0328
G1 X123.852 Y128.714 E.39111
G1 X123.208 Y128.714 E.0328
G1 X128.636 Y123.286 E.39111
G1 X127.992 Y123.286 E.0328
G1 X122.564 Y128.714 E.39111
G1 X121.92 Y128.714 E.0328
G1 X127.349 Y123.286 E.39111
G1 X126.705 Y123.286 E.0328
G1 X122.024 Y127.966 E.33724
G2 X122.291 Y127.056 I-3.528 J-1.528 E.04846
G1 X126.061 Y123.286 E.27163
G1 X125.417 Y123.286 E.0328
G1 X122.332 Y126.371 E.22231
G2 X122.265 Y125.794 I-4.02 J.173 E.02962
G1 X124.773 Y123.286 E.18074
G1 X124.129 Y123.286 E.0328
G1 X122.124 Y125.291 E.14447
G1 X122.094 Y125.199 E.00492
G2 X121.93 Y124.841 I-9.771 J4.236 E.02006
G1 X123.486 Y123.286 E.11206
G1 X122.842 Y123.286 E.0328
G1 X121.685 Y124.443 E.08336
G2 X121.399 Y124.085 I-1.931 J1.252 E.02338
G1 X122.198 Y123.286 E.05759
G1 X121.554 Y123.286 E.0328
G1 X120.93 Y123.91 E.04497
M106 S226.95
G1 X120.61 Y123.336 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.279564
; LAYER_HEIGHT: 0.2
G1 F3014
G1 X120.119 Y123.237 E.00936
; LINE_WIDTH: 0.257127
G1 X120.005 Y123.217 E.00195
; LINE_WIDTH: 0.21702
G1 X119.892 Y123.197 E.00159
; LINE_WIDTH: 0.175931
G1 X119.772 Y123.176 E.00127
; LINE_WIDTH: 0.140594
G1 X119.643 Y123.16 E.00101
; LINE_WIDTH: 0.111478
G1 X119.513 Y123.143 E.00071
G1 X117.987 Y123.143 F30000
; LINE_WIDTH: 0.111463
G1 F3014
G1 X117.857 Y123.16 E.00071
; LINE_WIDTH: 0.141212
G1 X117.722 Y123.177 E.00106
; LINE_WIDTH: 0.176866
G1 X117.608 Y123.197 E.00122
; LINE_WIDTH: 0.216976
G1 X117.495 Y123.217 E.00159
; LINE_WIDTH: 0.275315
G2 X116.89 Y123.336 I2.105 J12.275 E.01131
G1 X116.553 Y123.648 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F3014
G1 X116.485 Y123.308 E.01034
G1 X115.558 Y123.308 E.02759
G1 X115.558 Y124.231 E.02748
G1 X115.887 Y124.319 E.01012
G3 X116.508 Y123.687 I2.11 J1.453 E.02652
G1 X115.957 Y123.643 F30000
; LINE_WIDTH: 0.4159
G1 F3014
G1 X115.887 Y123.683 E.00238
G1 X115.945 Y123.717 E.00198
G1 X115.37 Y125.593 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.400104
M73 P81 R2
G1 F3014
G3 X115.603 Y124.649 I19.227 J4.253 E.02743
G1 X115.579 Y124.641 F30000
; LINE_WIDTH: 0.245144
G1 F3014
G1 X115.47 Y125.218 E.00938
; LINE_WIDTH: 0.224639
G1 X115.451 Y125.332 E.00165
; LINE_WIDTH: 0.187439
G1 X115.433 Y125.445 E.00132
; LINE_WIDTH: 0.149527
G1 X115.413 Y125.563 E.00101
; LINE_WIDTH: 0.113666
G1 X115.394 Y125.739 E.00099
G1 X115.709 Y128.514 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.6454
G1 F3014
G2 X115.716 Y128.631 I-.034 J.061 E.01434
; WIPE_START
G1 F5975.302
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
G1 F3014
G1 X117.404 Y129.244 E.00104
G1 X117.505 Y129.266 E.00056
; WIPE_START
G1 F15000
G1 X117.404 Y129.244 E-.26794
G1 X117.248 Y129.138 E-.49206
; WIPE_END
G1 E-.04 F1800
G1 X119.995 Y129.266 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.112375
G1 F3014
G1 X120.096 Y129.244 E.00057
G1 X120.252 Y129.137 E.00104
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
G1 F3250
G1 X119.458 Y124.204 E.01344
G3 X118.678 Y124.101 I-.701 J2.297 E.45979
G3 X118.988 Y124.121 I-.079 J3.601 E.00999
G1 X118.989 Y124.121 E.00002
G1 X118.703 Y124.493 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3250
M204 S5000
G1 X118.95 Y124.502 E.00735
G3 X119.148 Y124.53 I-.211 J2.238 E.00596
G3 X118.644 Y124.495 I-.39 J1.97 E.36081
; WIPE_START
G1 F9547.055
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
G1 F3250
G1 X120.671 Y129.084 E.64837
G2 X116.829 Y129.084 I-1.921 J-2.582 E.51776
G1 X115.166 Y129.084 E.05347
G1 X115.166 Y122.916 E.19833
G1 X140.834 Y122.916 E.82538
G1 X140.834 Y129.024 E.1964
G1 X141.241 Y129.491 F30000
G1 F3250
G1 X119.231 Y129.491 E.70777
G1 X119.209 Y129.271 E.00711
G2 X118.291 Y129.271 I-.459 J-2.771 E.53783
G1 X118.269 Y129.491 E.00711
G1 X114.759 Y129.491 E.11288
G1 X114.759 Y122.509 E.22451
G1 X141.241 Y122.509 E.85156
G1 X141.241 Y129.431 E.22258
G1 X141.648 Y129.898 F30000
G1 F3250
G1 X114.352 Y129.898 E.87774
G1 X114.352 Y122.102 E.25069
G1 X141.648 Y122.102 E.87774
G1 X141.648 Y129.838 E.24876
G1 X142.04 Y130.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3250
M204 S5000
G1 X113.96 Y130.29 E.83641
G1 X113.96 Y121.71 E.25557
G1 X142.04 Y121.71 E.83641
G1 X142.04 Y130.23 E.25378
; WIPE_START
G1 F9547.055
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
G1 F3250
G1 X137.69 Y126 E.48214
G1 X124.644 Y126.429 F30000
; LINE_WIDTH: 0.41999
G1 F3250
G1 X138.179 Y126.429 E.40315
G1 X138.179 Y125.571 E.02558
G1 X124.537 Y125.571 E.40635
G1 X124.613 Y126.382 E.02428
G1 X124.239 Y126.43 F30000
G1 F3250
G1 X124.229 Y126.806 E.01121
G1 X138.556 Y126.806 E.42674
G1 X138.556 Y125.194 E.04804
G1 X124.074 Y125.194 E.43138
G3 X124.234 Y126.37 I-4.524 J1.216 E.03546
G1 X123.835 Y126.089 F30000
G1 F3250
G1 X123.854 Y126.796 E.02109
G1 X123.806 Y127.183 E.01163
G1 X138.933 Y127.183 E.45059
G1 X138.933 Y124.817 E.0705
G1 X123.576 Y124.817 E.45744
G1 X123.753 Y125.446 E.01948
G1 X123.827 Y126.029 E.0175
G1 X123.459 Y126.117 F30000
G1 F3250
G1 X123.48 Y126.749 E.01885
G1 X123.365 Y127.561 E.02441
G1 X139.311 Y127.561 E.47496
G1 X139.311 Y124.439 E.09296
G1 X123.003 Y124.439 E.48574
G1 X123.205 Y124.892 E.01477
G1 X123.39 Y125.548 E.02031
G1 X123.452 Y126.057 E.01527
G1 X123.111 Y126.515 F30000
G1 F3250
G1 X123.021 Y127.379 E.02588
G1 X122.853 Y127.938 E.01738
G1 X139.688 Y127.938 E.50142
G1 X139.688 Y124.062 E.11543
M73 P82 R2
G1 X122.366 Y124.062 E.51595
G1 X122.774 Y124.819 E.02562
G1 X123.027 Y125.65 E.02588
G1 X123.105 Y126.455 E.02407
G1 X122.735 Y126.543 F30000
G1 F3250
G1 X122.647 Y127.332 E.02365
G1 X122.405 Y128.087 E.02363
G1 X122.287 Y128.315 E.00763
G1 X140.065 Y128.315 E.52953
G1 X140.065 Y123.685 E.13789
G1 X121.571 Y123.685 E.55084
G1 X122.067 Y124.291 E.0233
G1 X122.438 Y124.991 E.02362
G1 X122.664 Y125.753 E.02365
G1 X122.729 Y126.483 E.02184
G1 X122.359 Y126.571 F30000
G1 F3250
G1 X122.273 Y127.285 E.02142
G1 X122.048 Y127.967 E.0214
G1 X121.692 Y128.592 E.02141
G1 X121.61 Y128.692 E.00384
G1 X140.442 Y128.692 E.56091
G1 X140.442 Y123.308 E.16035
G1 X121.015 Y123.308 E.57863
G1 X120.947 Y123.648 E.01033
G1 X121.347 Y123.993 E.01574
G1 X121.772 Y124.526 E.02029
G1 X122.103 Y125.163 E.0214
G1 X122.301 Y125.855 E.02142
G1 X122.354 Y126.511 E.01962
; WIPE_START
G1 F9547.299
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
G1 F3250
G1 X120.096 Y129.244 E.00104
G1 X119.995 Y129.266 E.00056
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
G1 F3250
G1 X117.404 Y129.244 E.00057
G1 X117.247 Y129.137 E.00104
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
G1 F3250
G2 X115.716 Y128.631 I-.034 J.061 E.01434
G1 X115.394 Y125.739 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.113656
G1 F3250
G1 X115.413 Y125.564 E.00099
; LINE_WIDTH: 0.149494
G1 X115.433 Y125.445 E.00101
; LINE_WIDTH: 0.187419
G1 X115.451 Y125.332 E.00132
; LINE_WIDTH: 0.224632
G1 X115.47 Y125.218 E.00165
; LINE_WIDTH: 0.245144
G1 X115.579 Y124.641 E.00938
G1 X115.603 Y124.649 F30000
; LINE_WIDTH: 0.400129
G1 F3250
G2 X115.37 Y125.593 I18.764 J5.139 E.02744
G1 X116.554 Y123.648 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F3250
G1 X116.485 Y123.308 E.01033
G1 X115.558 Y123.308 E.02759
G1 X115.558 Y124.231 E.02748
G1 X115.887 Y124.319 E.01012
G3 X116.508 Y123.687 I2.11 J1.453 E.02653
G1 X115.957 Y123.643 F30000
; LINE_WIDTH: 0.41588
G1 F3250
G1 X115.887 Y123.683 E.00238
G1 X115.945 Y123.717 E.00198
G1 X116.89 Y123.336 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.275341
G1 F3250
G3 X117.495 Y123.217 I2.641 J11.768 E.01131
; LINE_WIDTH: 0.216964
G1 X117.608 Y123.197 E.00159
; LINE_WIDTH: 0.176833
G1 X117.722 Y123.177 E.00122
; LINE_WIDTH: 0.141181
G1 X117.857 Y123.16 E.00106
; LINE_WIDTH: 0.111451
G1 X117.987 Y123.143 E.00071
G1 X119.513 Y123.143 F30000
; LINE_WIDTH: 0.111478
G1 F3250
G1 X119.643 Y123.16 E.00071
; LINE_WIDTH: 0.140594
G1 X119.772 Y123.176 E.00101
; LINE_WIDTH: 0.175928
G1 X119.892 Y123.197 E.00127
; LINE_WIDTH: 0.217011
G1 X120.005 Y123.217 E.00159
; LINE_WIDTH: 0.257111
G1 X120.119 Y123.237 E.00195
; LINE_WIDTH: 0.279564
G1 X120.61 Y123.336 E.00936
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
G1 F3247
G1 X119.226 Y124.145 E.01423
G3 X118.511 Y124.109 I-.476 J2.354 E.46205
G1 X118.726 Y124.098 E.00693
G1 X118.717 Y124.491 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3247
M204 S5000
G1 X118.75 Y124.49 E.00098
G3 X118.55 Y124.5 I0 J2.009 E.37002
G1 X118.657 Y124.494 E.00321
; WIPE_START
G1 F9547.055
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
G1 F3247
G1 X120.671 Y129.084 E.64837
G2 X121.946 Y126.16 I-1.943 J-2.588 E.10727
M73 P83 R2
G2 X116.829 Y129.084 I-3.198 J.342 E.41029
G1 X115.166 Y129.084 E.05347
G1 X115.166 Y122.916 E.19833
G1 X140.834 Y122.916 E.82538
G1 X140.834 Y129.024 E.1964
G1 X141.241 Y129.491 F30000
G1 F3247
G1 X119.231 Y129.491 E.70777
G1 X119.209 Y129.271 E.00711
G2 X118.291 Y129.271 I-.459 J-2.77 E.53767
G1 X118.269 Y129.491 E.00711
G1 X114.759 Y129.491 E.11288
G1 X114.759 Y122.509 E.22451
G1 X141.241 Y122.509 E.85156
G1 X141.241 Y129.431 E.22258
G1 X141.648 Y129.898 F30000
G1 F3247
G1 X114.352 Y129.898 E.87774
G1 X114.352 Y122.102 E.25069
G1 X141.648 Y122.102 E.87774
G1 X141.648 Y129.838 E.24876
G1 X142.04 Y130.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3247
M204 S5000
G1 X113.96 Y130.29 E.83641
G1 X113.96 Y121.71 E.25557
G1 X142.04 Y121.71 E.83641
G1 X142.04 Y130.23 E.25378
; WIPE_START
G1 F9547.055
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
G1 F3247
G1 X137.69 Y126 E.48212
G1 X124.648 Y126.429 F30000
; LINE_WIDTH: 0.41999
G1 F3247
G1 X138.179 Y126.429 E.40303
G1 X138.179 Y125.571 E.02558
G1 X124.537 Y125.571 E.40634
G1 X124.614 Y126.384 E.02433
G1 X124.239 Y126.427 F30000
G1 F3247
G1 X124.23 Y126.806 E.01132
G1 X138.556 Y126.806 E.42674
G1 X138.556 Y125.194 E.04804
G1 X124.074 Y125.194 E.43138
G3 X124.234 Y126.367 I-4.52 J1.216 E.03536
G1 X123.835 Y126.089 F30000
G1 F3247
G1 X123.855 Y126.793 E.02099
G1 X123.806 Y127.183 E.01171
G1 X138.933 Y127.183 E.45059
G1 X138.933 Y124.817 E.0705
G1 X123.576 Y124.817 E.45744
G1 X123.753 Y125.446 E.01948
G1 X123.828 Y126.03 E.01752
G1 X123.459 Y126.117 F30000
G1 F3247
G1 X123.48 Y126.747 E.01875
G1 X123.365 Y127.561 E.02449
G1 X139.311 Y127.561 E.47496
G1 X139.311 Y124.439 E.09296
G1 X123.003 Y124.439 E.48574
G1 X123.206 Y124.892 E.01478
G1 X123.39 Y125.548 E.0203
G1 X123.452 Y126.058 E.01529
G1 X123.111 Y126.512 F30000
G1 F3247
G1 X123.021 Y127.378 E.02595
G1 X122.853 Y127.938 E.01739
G1 X139.688 Y127.938 E.50143
G1 X139.688 Y124.062 E.11543
M73 P83 R1
G1 X122.366 Y124.062 E.51595
G1 X122.774 Y124.82 E.02563
G1 X123.027 Y125.65 E.02586
G1 X123.105 Y126.452 E.02399
G1 X122.735 Y126.54 F30000
G1 F3247
G1 X122.647 Y127.332 E.02372
G1 X122.405 Y128.087 E.02364
G1 X122.287 Y128.315 E.00763
G1 X140.065 Y128.315 E.52953
G1 X140.065 Y123.685 E.13789
G1 X121.571 Y123.685 E.55085
G1 X122.067 Y124.291 E.0233
G1 X122.439 Y124.992 E.02364
G1 X122.664 Y125.753 E.02364
M73 P84 R1
G1 X122.73 Y126.48 E.02177
G1 X122.359 Y126.569 F30000
G1 F3247
G1 X122.273 Y127.285 E.02149
G1 X122.048 Y127.967 E.02141
G1 X121.692 Y128.592 E.02141
G1 X121.61 Y128.692 E.00384
G1 X140.442 Y128.692 E.56091
G1 X140.442 Y123.308 E.16035
G1 X121.015 Y123.308 E.57863
G1 X120.946 Y123.648 E.01033
G1 X121.347 Y123.993 E.01575
G1 X121.772 Y124.526 E.02029
G1 X122.103 Y125.164 E.02141
G1 X122.301 Y125.855 E.02141
G1 X122.354 Y126.509 E.01954
; WIPE_START
G1 F9547.299
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
G1 F3247
G1 X120.096 Y129.244 E.00104
G1 X119.995 Y129.266 E.00057
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
G1 F3247
G1 X117.404 Y129.244 E.00057
G1 X117.248 Y129.137 E.00104
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
G1 F3247
G2 X115.716 Y128.631 I-.034 J.061 E.01434
G1 X115.394 Y125.739 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.11371
G1 F3247
G1 X115.414 Y125.563 E.00099
; LINE_WIDTH: 0.149553
G1 X115.433 Y125.445 E.00101
; LINE_WIDTH: 0.18739
G1 X115.451 Y125.332 E.00131
; LINE_WIDTH: 0.224517
G1 X115.47 Y125.218 E.00165
; LINE_WIDTH: 0.244983
G1 X115.579 Y124.641 E.00938
G1 X115.603 Y124.649 F30000
; LINE_WIDTH: 0.40019
G1 F3247
G2 X115.37 Y125.594 I18.373 J5.04 E.02748
G1 X116.553 Y123.648 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F3247
G1 X116.485 Y123.308 E.01034
G1 X115.558 Y123.308 E.0276
G1 X115.558 Y124.231 E.02748
G1 X115.887 Y124.319 E.01012
G3 X116.508 Y123.687 I2.11 J1.453 E.02652
G1 X115.957 Y123.643 F30000
; LINE_WIDTH: 0.41592
G1 F3247
G1 X115.887 Y123.683 E.00238
G1 X115.945 Y123.717 E.00198
G1 X116.89 Y123.336 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.275362
G1 F3247
G3 X117.495 Y123.217 I2.726 J12.251 E.01131
; LINE_WIDTH: 0.216993
G1 X117.608 Y123.197 E.00159
; LINE_WIDTH: 0.176855
G1 X117.722 Y123.177 E.00122
; LINE_WIDTH: 0.141182
G1 X117.857 Y123.16 E.00106
; LINE_WIDTH: 0.111452
G1 X117.987 Y123.143 E.00071
G1 X119.513 Y123.143 F30000
; LINE_WIDTH: 0.111483
G1 F3247
G1 X119.643 Y123.16 E.00071
; LINE_WIDTH: 0.140609
G1 X119.772 Y123.176 E.00101
; LINE_WIDTH: 0.175951
G1 X119.892 Y123.197 E.00127
; LINE_WIDTH: 0.21704
G1 X120.006 Y123.217 E.00159
; LINE_WIDTH: 0.257146
G1 X120.119 Y123.237 E.00195
; LINE_WIDTH: 0.279572
G1 X120.61 Y123.336 E.00935
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
G1 F3247
G1 X118.987 Y124.109 E.00823
G3 X118.511 Y124.109 I-.236 J2.39 E.46986
G1 X118.671 Y124.109 E.00514
G1 X118.729 Y124.491 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3247
M204 S5000
G1 X118.731 Y124.491 E.00006
G3 X118.55 Y124.5 I.009 J2.009 E.3706
G1 X118.669 Y124.494 E.00356
; WIPE_START
G1 F9547.055
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
G1 F3247
G1 X120.671 Y129.084 E.64837
G2 X116.829 Y129.084 I-1.921 J-2.581 E.51767
G1 X115.166 Y129.084 E.05348
G1 X115.166 Y122.916 E.19833
G1 X140.834 Y122.916 E.82538
G1 X140.834 Y129.024 E.1964
G1 X141.241 Y129.491 F30000
G1 F3247
G1 X119.231 Y129.491 E.70777
G1 X119.209 Y129.271 E.00711
G2 X118.291 Y129.271 I-.459 J-2.772 E.53802
G1 X118.269 Y129.491 E.00711
G1 X114.759 Y129.491 E.11288
G1 X114.759 Y122.509 E.22451
G1 X141.241 Y122.509 E.85156
G1 X141.241 Y129.431 E.22258
G1 X141.648 Y129.898 F30000
G1 F3247
G1 X114.352 Y129.898 E.87774
G1 X114.352 Y122.102 E.25069
G1 X141.648 Y122.102 E.87774
G1 X141.648 Y129.838 E.24876
G1 X142.04 Y130.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3247
M204 S5000
G1 X113.96 Y130.29 E.83641
G1 X113.96 Y121.71 E.25557
G1 X142.04 Y121.71 E.83641
G1 X142.04 Y130.23 E.25378
; WIPE_START
G1 F9547.055
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
G1 F3247
G1 X137.69 Y126 E.48214
G1 X124.644 Y126.429 F30000
; LINE_WIDTH: 0.41999
G1 F3247
G1 X138.179 Y126.429 E.40315
G1 X138.179 Y125.571 E.02558
G1 X124.537 Y125.571 E.40634
G1 X124.613 Y126.382 E.02428
G1 X124.239 Y126.43 F30000
G1 F3247
G1 X124.229 Y126.806 E.01121
G1 X138.556 Y126.806 E.42674
G1 X138.556 Y125.194 E.04804
G1 X124.074 Y125.194 E.43138
G3 X124.234 Y126.37 I-4.523 J1.216 E.03546
G1 X123.835 Y126.089 F30000
G1 F3247
M73 P85 R1
G1 X123.854 Y126.796 E.02108
G1 X123.806 Y127.183 E.01163
G1 X138.933 Y127.183 E.45059
G1 X138.933 Y124.817 E.0705
G1 X123.576 Y124.817 E.45744
G1 X123.753 Y125.446 E.01948
G1 X123.828 Y126.029 E.0175
G1 X123.459 Y126.117 F30000
G1 F3247
G1 X123.48 Y126.749 E.01885
G1 X123.365 Y127.561 E.02441
G1 X139.311 Y127.561 E.47496
G1 X139.311 Y124.439 E.09296
G1 X123.003 Y124.439 E.48574
G1 X123.206 Y124.892 E.01478
G1 X123.39 Y125.548 E.0203
G1 X123.452 Y126.057 E.01526
G1 X123.111 Y126.515 F30000
G1 F3247
G1 X123.021 Y127.379 E.02587
G1 X122.853 Y127.938 E.01739
G1 X139.688 Y127.938 E.50143
G1 X139.688 Y124.062 E.11543
G1 X122.366 Y124.062 E.51595
G1 X122.774 Y124.82 E.02563
G1 X123.027 Y125.651 E.02587
G1 X123.105 Y126.455 E.02407
G1 X122.735 Y126.543 F30000
G1 F3247
G1 X122.647 Y127.332 E.02364
G1 X122.405 Y128.087 E.02364
G1 X122.287 Y128.315 E.00763
G1 X140.065 Y128.315 E.52953
G1 X140.065 Y123.685 E.13789
G1 X121.571 Y123.685 E.55084
G1 X122.067 Y124.291 E.0233
G1 X122.439 Y124.992 E.02364
G1 X122.664 Y125.753 E.02364
G1 X122.729 Y126.483 E.02184
G1 X122.359 Y126.571 F30000
G1 F3247
G1 X122.273 Y127.285 E.02141
G1 X122.048 Y127.967 E.02141
G1 X121.692 Y128.592 E.02141
G1 X121.61 Y128.692 E.00384
G1 X140.442 Y128.692 E.56091
G1 X140.442 Y123.308 E.16035
G1 X121.015 Y123.308 E.57863
G1 X120.947 Y123.648 E.01033
G1 X121.347 Y123.993 E.01575
G1 X121.772 Y124.526 E.02029
G1 X122.103 Y125.164 E.02141
G1 X122.301 Y125.855 E.02141
G1 X122.354 Y126.511 E.01961
; WIPE_START
G1 F9547.299
M73 P86 R1
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
G1 F3247
G1 X120.096 Y129.244 E.00104
G1 X119.995 Y129.266 E.00057
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
G1 F3247
G1 X117.404 Y129.244 E.00057
G1 X117.248 Y129.137 E.00104
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
G1 F3247
G2 X115.716 Y128.631 I-.034 J.061 E.01434
G1 X115.394 Y125.739 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.113678
G1 F3247
G1 X115.413 Y125.563 E.00099
; LINE_WIDTH: 0.149521
G1 X115.433 Y125.445 E.00101
; LINE_WIDTH: 0.187417
G1 X115.451 Y125.332 E.00131
; LINE_WIDTH: 0.224602
G1 X115.47 Y125.218 E.00165
; LINE_WIDTH: 0.245083
G1 X115.579 Y124.641 E.00938
G1 X115.603 Y124.649 F30000
; LINE_WIDTH: 0.400168
G1 F3247
G2 X115.37 Y125.594 I18.918 J5.174 E.02746
G1 X116.553 Y123.648 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F3247
G1 X116.485 Y123.308 E.01033
G1 X115.558 Y123.308 E.02759
G1 X115.558 Y124.231 E.02748
G1 X115.887 Y124.319 E.01012
G3 X116.508 Y123.687 I2.11 J1.453 E.02652
G1 X115.957 Y123.643 F30000
; LINE_WIDTH: 0.41588
G1 F3247
G1 X115.887 Y123.683 E.00238
G1 X115.945 Y123.717 E.00198
G1 X116.89 Y123.336 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.275379
G1 F3247
G3 X117.495 Y123.217 I2.665 J11.905 E.01131
; LINE_WIDTH: 0.217002
G1 X117.608 Y123.197 E.00159
; LINE_WIDTH: 0.17687
G1 X117.722 Y123.177 E.00122
; LINE_WIDTH: 0.141211
G1 X117.857 Y123.16 E.00106
; LINE_WIDTH: 0.111462
G1 X117.987 Y123.143 E.00071
G1 X119.513 Y123.143 F30000
; LINE_WIDTH: 0.111467
G1 F3247
G1 X119.643 Y123.16 E.00071
; LINE_WIDTH: 0.140562
G1 X119.772 Y123.176 E.00101
; LINE_WIDTH: 0.175908
G1 X119.892 Y123.197 E.00127
; LINE_WIDTH: 0.217035
G1 X120.006 Y123.217 E.00159
; LINE_WIDTH: 0.257179
G1 X120.119 Y123.237 E.00196
; LINE_WIDTH: 0.279644
G1 X120.61 Y123.336 E.00935
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
G1 F3799
M204 S5000
G1 X118.744 Y124.49 E.0001
G3 X118.55 Y124.5 I.003 J2.005 E.3695
G1 X118.68 Y124.493 E.0039
; WIPE_START
G1 F9547.055
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
G1 F3799
M204 S5000
G1 X113.96 Y130.29 E.83641
G1 X113.96 Y121.71 E.25557
G1 X142.04 Y121.71 E.83641
G1 X142.04 Y130.23 E.25378
; WIPE_START
G1 F9547.055
M204 S10000
G1 X140.04 Y130.234 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.844 Y123.7 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.30247
G1 F3799
G1 X138.62 Y123.7 E.0661
; WIPE_START
G1 F13870.158
G1 X140.62 Y123.7 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.248 Y121.917 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3799
M204 S2000
G1 X141.833 Y122.502 E.02462
G1 X141.833 Y123.035
G1 X140.715 Y121.917 E.04708
G1 X140.182 Y121.917
G1 X141.808 Y123.544 E.06851
G1 X141.275 Y123.544
G1 X139.648 Y121.917 E.06851
G1 X139.115 Y121.917
G1 X140.742 Y123.544 E.06851
G1 X140.208 Y123.544
G1 X138.582 Y121.917 E.06851
G1 X138.049 Y121.917
G1 X139.675 Y123.544 E.06851
G1 X139.142 Y123.544
G1 X137.515 Y121.917 E.06851
G1 X136.982 Y121.917
G1 X138.609 Y123.544 E.06851
M204 S10000
G1 X141.054 Y123.856 F30000
G1 F3799
M204 S2000
G1 X141.833 Y124.635 E.0328
G1 X141.833 Y125.168
G1 X140.521 Y123.856 E.05526
G1 X139.988 Y123.856
G1 X141.833 Y125.701 E.07773
G1 X141.833 Y126.235
G1 X139.454 Y123.856 E.10019
G1 X138.921 Y123.856
G1 X141.833 Y126.768 E.12265
G1 X141.833 Y127.301
G1 X136.449 Y121.917 E.22679
G1 X135.916 Y121.917
G1 X141.833 Y127.834 E.24925
G1 X141.833 Y128.368
G1 X135.382 Y121.917 E.27171
G1 X134.849 Y121.917
G1 X141.833 Y128.901 E.29418
G1 X141.833 Y129.434
G1 X134.316 Y121.917 E.31664
G1 X133.783 Y121.917
G1 X141.833 Y129.967 E.3391
G1 X141.415 Y130.083
G1 X133.249 Y121.917 E.34396
G1 X132.716 Y121.917
G1 X140.881 Y130.083 E.34396
G1 X140.348 Y130.083
G1 X132.183 Y121.917 E.34396
G1 X131.65 Y121.917
G1 X139.815 Y130.083 E.34396
G1 X139.282 Y130.083
G1 X131.116 Y121.917 E.34396
G1 X130.583 Y121.917
G1 X138.748 Y130.083 E.34396
G1 X138.215 Y130.083
G1 X130.05 Y121.917 E.34396
G1 X129.517 Y121.917
G1 X137.682 Y130.083 E.34396
G1 X137.149 Y130.083
G1 X128.983 Y121.917 E.34396
G1 X128.45 Y121.917
G1 X136.615 Y130.083 E.34396
G1 X136.082 Y130.083
G1 X127.917 Y121.917 E.34396
G1 X127.384 Y121.917
G1 X135.549 Y130.083 E.34396
G1 X135.015 Y130.083
G1 X126.85 Y121.917 E.34396
G1 X126.317 Y121.917
G1 X134.482 Y130.083 E.34396
G1 X133.949 Y130.083
G1 X125.784 Y121.917 E.34396
G1 X125.25 Y121.917
G1 X133.416 Y130.083 E.34396
G1 X132.882 Y130.083
G1 X124.717 Y121.917 E.34396
G1 X124.184 Y121.917
G1 X132.349 Y130.083 E.34396
G1 X131.816 Y130.083
M73 P87 R1
G1 X123.651 Y121.917 E.34396
G1 X123.117 Y121.917
G1 X131.283 Y130.083 E.34396
G1 X130.749 Y130.083
G1 X122.584 Y121.917 E.34396
G1 X122.051 Y121.917
G1 X130.216 Y130.083 E.34396
G1 X129.683 Y130.083
G1 X121.518 Y121.917 E.34396
G1 X120.984 Y121.917
G1 X129.15 Y130.083 E.34396
G1 X128.616 Y130.083
G1 X120.451 Y121.917 E.34396
G1 X119.918 Y121.917
G1 X128.083 Y130.083 E.34396
G1 X127.55 Y130.083
G1 X119.385 Y121.917 E.34396
G1 X118.851 Y121.917
G1 X127.017 Y130.083 E.34396
G1 X126.483 Y130.083
G1 X118.318 Y121.917 E.34396
G1 X117.785 Y121.917
G1 X125.95 Y130.083 E.34396
G1 X125.417 Y130.083
G1 X120.568 Y125.233 E.20427
G1 X120.937 Y126.136
G1 X124.884 Y130.083 E.16626
G1 X124.35 Y130.083
G1 X120.957 Y126.689 E.14294
G1 X120.872 Y127.137
G1 X123.817 Y130.083 E.12407
G1 X123.284 Y130.083
G1 X120.718 Y127.517 E.10808
G1 X120.512 Y127.844
G1 X122.751 Y130.083 E.09431
G1 X122.217 Y130.083
G1 X120.26 Y128.125 E.08247
G1 X119.959 Y128.357
G1 X121.684 Y130.083 E.07269
G1 X121.151 Y130.083
G1 X119.61 Y128.542 E.06492
G1 X119.203 Y128.668
G1 X120.618 Y130.083 E.05958
G1 X120.084 Y130.083
G1 X118.717 Y128.715 E.0576
G1 X118.08 Y128.611
G1 X119.551 Y130.083 E.06197
; WIPE_START
G1 F9547.055
M204 S10000
G1 X118.137 Y128.668 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X120.009 Y124.675 Z3.4 F30000
G1 Z3
G1 E.8 F1800
G1 F3799
M204 S2000
G1 X117.252 Y121.917 E.11615
G1 X116.718 Y121.917
G1 X119.116 Y124.315 E.101
G1 X118.559 Y124.292
G1 X116.185 Y121.917 E.10001
G1 X115.652 Y121.917
G1 X118.111 Y124.377 E.1036
G1 X117.733 Y124.531
G1 X115.119 Y121.917 E.11011
G1 X114.585 Y121.917
G1 X117.407 Y124.739 E.11885
G1 X117.127 Y124.992
G1 X114.167 Y122.033 E.12465
M73 P88 R1
G1 X114.167 Y122.566
G1 X116.892 Y125.29 E.11476
G1 X116.708 Y125.64
G1 X114.167 Y123.099 E.10702
G1 X114.167 Y123.632
G1 X116.581 Y126.046 E.10169
G1 X116.533 Y126.532
G1 X114.167 Y124.166 E.09967
G1 X114.167 Y124.699
G1 X116.637 Y127.169 E.10403
; WIPE_START
G1 F9547.055
M204 S10000
G1 X115.223 Y125.754 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X114.167 Y125.232 Z3.4 F30000
G1 Z3
G1 E.8 F1800
G1 F3799
M204 S2000
G1 X119.018 Y130.083 E.20432
G1 X118.485 Y130.083
G1 X114.167 Y125.766 E.18186
G1 X114.167 Y126.299
G1 X117.951 Y130.083 E.15939
G1 X117.418 Y130.083
G1 X114.167 Y126.832 E.13693
G1 X114.167 Y127.365
G1 X116.885 Y130.083 E.11447
G1 X116.351 Y130.083
G1 X114.167 Y127.899 E.092
G1 X114.167 Y128.432
G1 X115.818 Y130.083 E.06954
G1 X115.285 Y130.083
G1 X114.167 Y128.965 E.04708
G1 X114.167 Y129.498
G1 X114.752 Y130.083 E.02461
; WIPE_START
G1 F9547.055
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
G1 F3799
G1 X117.947 Y128.632 E.00151
; LINE_WIDTH: 0.18355
G1 X117.863 Y128.575 E.00112
; LINE_WIDTH: 0.144153
G1 X117.776 Y128.517 E.00084
; LINE_WIDTH: 0.106209
G1 X117.657 Y128.428 E.00074
; WIPE_START
G1 F15000
G1 X117.776 Y128.517 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X120.948 Y126.414 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.159439
G1 F3799
G1 X121.007 Y126.556 E.00142
G1 X120.94 Y126.707 E.00152
; WIPE_START
G1 F15000
G1 X121.007 Y126.556 E-.39296
G1 X120.948 Y126.414 E-.36704
; WIPE_END
G1 E-.04 F1800
G1 X120.628 Y125.173 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223538
G1 F3799
G1 X120.382 Y124.902 E.00522
G1 X120.069 Y124.614 E.00607
G1 X119.328 Y124.26 F30000
; LINE_WIDTH: 0.133474
G1 F3799
G1 X119.103 Y124.328 E.00168
G1 X119.436 Y124.394 F30000
; LINE_WIDTH: 0.093552
G1 F3799
G2 X119.188 Y124.243 I-3.172 J4.948 E.00116
; WIPE_START
G1 F15000
G1 X119.436 Y124.394 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X116.556 Y126.799 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0897697
G1 F3799
G3 X116.461 Y126.604 I4.062 J-2.119 E.0008
G1 X116.595 Y127.393 F30000
; LINE_WIDTH: 0.102071
G1 F3799
G1 X116.65 Y127.155 E.00114
G1 X116.82 Y127.591 F30000
; LINE_WIDTH: 0.102079
G1 F3799
G1 X116.76 Y127.509 E.00047
; LINE_WIDTH: 0.140226
G3 X116.569 Y127.237 I5.459 J-4.039 E.00256
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
M106 S229.5
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
G1 X138.259 Y123.209 E.03157
G1 X141.241 Y123.209 E.09588
G1 X141.241 Y124.191 E.03157
G1 X138.319 Y124.191 E.09395
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05775
G1 X141.648 Y122.802 E.12206
G1 X141.648 Y124.598 E.05775
G1 X137.912 Y124.598 E.12013
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07685
G1 X142.04 Y122.41 E.13642
G1 X142.04 Y124.99 E.07685
G1 X137.52 Y124.99 E.13464
; WIPE_START
G1 F9547.055
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
G1 X141.037 Y123.7 E.11687
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6264.574
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
G1 X138.259 Y123.209 E.03157
G1 X141.241 Y123.209 E.09588
G1 X141.241 Y124.191 E.03157
G1 X138.319 Y124.191 E.09395
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05775
G1 X141.648 Y122.802 E.12206
G1 X141.648 Y124.598 E.05775
G1 X137.912 Y124.598 E.12013
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07685
G1 X142.04 Y122.41 E.13642
G1 X142.04 Y124.99 E.07685
G1 X137.52 Y124.99 E.13464
; WIPE_START
G1 F9547.055
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
G1 X141.037 Y123.7 E.11687
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6264.574
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
G1 X138.259 Y123.209 E.03157
G1 X141.241 Y123.209 E.09588
G1 X141.241 Y124.191 E.03157
G1 X138.319 Y124.191 E.09395
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05775
G1 X141.648 Y122.802 E.12206
G1 X141.648 Y124.598 E.05775
G1 X137.912 Y124.598 E.12013
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07685
G1 X142.04 Y122.41 E.13642
M73 P89 R1
G1 X142.04 Y124.99 E.07685
G1 X137.52 Y124.99 E.13464
; WIPE_START
G1 F9547.055
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
G1 X141.037 Y123.7 E.11687
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6264.574
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
G1 X138.259 Y123.209 E.03157
G1 X141.241 Y123.209 E.09588
G1 X141.241 Y124.191 E.03157
G1 X138.319 Y124.191 E.09395
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05775
G1 X141.648 Y122.802 E.12206
G1 X141.648 Y124.598 E.05775
G1 X137.912 Y124.598 E.12013
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07685
G1 X142.04 Y122.41 E.13642
G1 X142.04 Y124.99 E.07685
G1 X137.52 Y124.99 E.13464
; WIPE_START
G1 F9547.055
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
G1 X141.037 Y123.7 E.11687
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6264.574
G1 X139.037 Y123.7 E-.76
; WIPE_END
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
G1 X138.259 Y123.209 E.03157
G1 X141.241 Y123.209 E.09588
G1 X141.241 Y124.191 E.03157
G1 X138.319 Y124.191 E.09395
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05775
G1 X141.648 Y122.802 E.12206
G1 X141.648 Y124.598 E.05775
G1 X137.912 Y124.598 E.12013
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07685
G1 X142.04 Y122.41 E.13642
G1 X142.04 Y124.99 E.07685
G1 X137.52 Y124.99 E.13464
; WIPE_START
G1 F9547.055
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
G1 X141.037 Y123.7 E.11687
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6264.574
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
G1 X138.259 Y123.209 E.03157
G1 X141.241 Y123.209 E.09588
G1 X141.241 Y124.191 E.03157
G1 X138.319 Y124.191 E.09395
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05775
G1 X141.648 Y122.802 E.12206
G1 X141.648 Y124.598 E.05775
G1 X137.912 Y124.598 E.12013
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07685
G1 X142.04 Y122.41 E.13642
G1 X142.04 Y124.99 E.07685
G1 X137.52 Y124.99 E.13464
; WIPE_START
G1 F9547.055
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
G1 X141.037 Y123.7 E.11687
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6264.574
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
M73 P90 R1
G1 X138.259 Y124.191
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X138.259 Y123.209 E.03157
G1 X141.241 Y123.209 E.09588
G1 X141.241 Y124.191 E.03157
G1 X138.319 Y124.191 E.09395
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05775
G1 X141.648 Y122.802 E.12206
G1 X141.648 Y124.598 E.05775
G1 X137.912 Y124.598 E.12013
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07685
G1 X142.04 Y122.41 E.13642
G1 X142.04 Y124.99 E.07685
G1 X137.52 Y124.99 E.13464
; WIPE_START
G1 F9547.055
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
G1 X141.037 Y123.7 E.11687
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6264.574
G1 X139.037 Y123.7 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/45
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
G1 X138.259 Y124.191
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X138.259 Y123.209 E.03157
G1 X141.241 Y123.209 E.09588
G1 X141.241 Y124.191 E.03157
G1 X138.319 Y124.191 E.09395
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05775
G1 X141.648 Y122.802 E.12206
G1 X141.648 Y124.598 E.05775
G1 X137.912 Y124.598 E.12013
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07685
G1 X142.04 Y122.41 E.13642
G1 X142.04 Y124.99 E.07685
G1 X137.52 Y124.99 E.13464
; WIPE_START
G1 F9547.055
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
G1 X141.037 Y123.7 E.11687
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6264.574
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
G1 X138.259 Y123.209 E.03157
G1 X141.241 Y123.209 E.09588
G1 X141.241 Y124.191 E.03157
G1 X138.319 Y124.191 E.09395
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05775
G1 X141.648 Y122.802 E.12206
G1 X141.648 Y124.598 E.05775
G1 X137.912 Y124.598 E.12013
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07685
G1 X142.04 Y122.41 E.13642
G1 X142.04 Y124.99 E.07685
G1 X137.52 Y124.99 E.13464
; WIPE_START
G1 F9547.055
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
G1 X141.037 Y123.7 E.11687
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6264.574
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
G1 X138.259 Y123.209 E.03157
G1 X141.241 Y123.209 E.09588
G1 X141.241 Y124.191 E.03157
G1 X138.319 Y124.191 E.09395
G1 X137.852 Y124.598 F30000
G1 F1200
M73 P91 R1
G1 X137.852 Y122.802 E.05775
G1 X141.648 Y122.802 E.12206
G1 X141.648 Y124.598 E.05775
G1 X137.912 Y124.598 E.12013
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07685
G1 X142.04 Y122.41 E.13642
G1 X142.04 Y124.99 E.07685
G1 X137.52 Y124.99 E.13464
; WIPE_START
G1 F9547.055
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
G1 X141.037 Y123.7 E.11687
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6264.574
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
G1 X138.259 Y124.191
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X138.259 Y123.209 E.03157
G1 X141.241 Y123.209 E.09588
G1 X141.241 Y124.191 E.03157
G1 X138.319 Y124.191 E.09395
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05775
G1 X141.648 Y122.802 E.12206
G1 X141.648 Y124.598 E.05775
G1 X137.912 Y124.598 E.12013
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07685
G1 X142.04 Y122.41 E.13642
G1 X142.04 Y124.99 E.07685
G1 X137.52 Y124.99 E.13464
; WIPE_START
G1 F9547.055
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
G1 X141.037 Y123.7 E.11687
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6264.574
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
G1 X138.259 Y123.209 E.03157
G1 X141.241 Y123.209 E.09588
G1 X141.241 Y124.191 E.03157
G1 X138.319 Y124.191 E.09395
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05775
G1 X141.648 Y122.802 E.12206
G1 X141.648 Y124.598 E.05775
G1 X137.912 Y124.598 E.12013
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07685
G1 X142.04 Y122.41 E.13642
G1 X142.04 Y124.99 E.07685
G1 X137.52 Y124.99 E.13464
; WIPE_START
G1 F9547.055
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
G1 X141.037 Y123.7 E.11687
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6264.574
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
G1 X138.259 Y123.209 E.03157
G1 X141.241 Y123.209 E.09588
G1 X141.241 Y124.191 E.03157
G1 X138.319 Y124.191 E.09395
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05775
G1 X141.648 Y122.802 E.12206
G1 X141.648 Y124.598 E.05775
G1 X137.912 Y124.598 E.12013
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07685
G1 X142.04 Y122.41 E.13642
M73 P91 R0
G1 X142.04 Y124.99 E.07685
G1 X137.52 Y124.99 E.13464
; WIPE_START
G1 F9547.055
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
G1 X141.037 Y123.7 E.11687
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6264.574
G1 X139.037 Y123.7 E-.76
; WIPE_END
M73 P92 R0
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
G1 X138.259 Y124.191
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X138.259 Y123.209 E.03157
G1 X141.241 Y123.209 E.09588
G1 X141.241 Y124.191 E.03157
G1 X138.319 Y124.191 E.09395
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05775
G1 X141.648 Y122.802 E.12206
G1 X141.648 Y124.598 E.05775
G1 X137.912 Y124.598 E.12013
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07685
G1 X142.04 Y122.41 E.13642
G1 X142.04 Y124.99 E.07685
G1 X137.52 Y124.99 E.13464
; WIPE_START
G1 F9547.055
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
G1 X141.037 Y123.7 E.11687
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6264.574
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
G1 X138.259 Y123.209 E.03157
G1 X141.241 Y123.209 E.09588
G1 X141.241 Y124.191 E.03157
G1 X138.319 Y124.191 E.09395
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05775
G1 X141.648 Y122.802 E.12206
G1 X141.648 Y124.598 E.05775
G1 X137.912 Y124.598 E.12013
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07685
G1 X142.04 Y122.41 E.13642
G1 X142.04 Y124.99 E.07685
G1 X137.52 Y124.99 E.13464
; WIPE_START
G1 F9547.055
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
G1 X141.037 Y123.7 E.11687
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6264.574
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
G1 X138.259 Y123.209 E.03157
G1 X141.241 Y123.209 E.09588
G1 X141.241 Y124.191 E.03157
G1 X138.319 Y124.191 E.09395
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05775
G1 X141.648 Y122.802 E.12206
G1 X141.648 Y124.598 E.05775
G1 X137.912 Y124.598 E.12013
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07685
G1 X142.04 Y122.41 E.13642
G1 X142.04 Y124.99 E.07685
G1 X137.52 Y124.99 E.13464
; WIPE_START
G1 F9547.055
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
G1 X141.037 Y123.7 E.11687
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6264.574
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
G1 X138.259 Y124.191
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X138.259 Y123.209 E.03157
G1 X141.241 Y123.209 E.09588
M73 P93 R0
G1 X141.241 Y124.191 E.03157
G1 X138.319 Y124.191 E.09395
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05775
G1 X141.648 Y122.802 E.12206
G1 X141.648 Y124.598 E.05775
G1 X137.912 Y124.598 E.12013
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07685
G1 X142.04 Y122.41 E.13642
G1 X142.04 Y124.99 E.07685
G1 X137.52 Y124.99 E.13464
; WIPE_START
G1 F9547.055
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
G1 X141.037 Y123.7 E.11687
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6264.574
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
G1 X138.259 Y123.209 E.03157
G1 X141.241 Y123.209 E.09588
G1 X141.241 Y124.191 E.03157
G1 X138.319 Y124.191 E.09395
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05775
G1 X141.648 Y122.802 E.12206
G1 X141.648 Y124.598 E.05775
G1 X137.912 Y124.598 E.12013
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07685
G1 X142.04 Y122.41 E.13642
G1 X142.04 Y124.99 E.07685
G1 X137.52 Y124.99 E.13464
; WIPE_START
G1 F9547.055
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
G1 X141.037 Y123.7 E.11687
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6264.574
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
G1 X138.259 Y123.209 E.03157
G1 X141.241 Y123.209 E.09588
G1 X141.241 Y124.191 E.03157
G1 X138.319 Y124.191 E.09395
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05775
G1 X141.648 Y122.802 E.12206
G1 X141.648 Y124.598 E.05775
G1 X137.912 Y124.598 E.12013
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07685
G1 X142.04 Y122.41 E.13642
G1 X142.04 Y124.99 E.07685
G1 X137.52 Y124.99 E.13464
; WIPE_START
G1 F9547.055
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
G1 X141.037 Y123.7 E.11687
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6264.574
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
G1 F1200
G1 X138.259 Y123.209 E.03157
G1 X141.241 Y123.209 E.09588
G1 X141.241 Y124.191 E.03157
G1 X138.319 Y124.191 E.09395
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05775
G1 X141.648 Y122.802 E.12206
G1 X141.648 Y124.598 E.05775
G1 X137.912 Y124.598 E.12013
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07685
G1 X142.04 Y122.41 E.13642
G1 X142.04 Y124.99 E.07685
G1 X137.52 Y124.99 E.13464
; WIPE_START
G1 F9547.055
M204 S10000
G1 X137.474 Y122.991 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.463 Y123.7 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.61758
M73 P94 R0
G1 F1200
G1 X141.037 Y123.7 E.11687
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6264.574
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
G1 X138.259 Y123.209 E.03157
G1 X141.241 Y123.209 E.09588
G1 X141.241 Y124.191 E.03157
G1 X138.319 Y124.191 E.09395
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05775
G1 X141.648 Y122.802 E.12206
G1 X141.648 Y124.598 E.05775
G1 X137.912 Y124.598 E.12013
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07685
G1 X142.04 Y122.41 E.13642
G1 X142.04 Y124.99 E.07685
G1 X137.52 Y124.99 E.13464
; WIPE_START
G1 F9547.055
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
G1 X141.037 Y123.7 E.11687
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6264.574
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
G1 X138.259 Y123.209 E.03157
G1 X141.241 Y123.209 E.09588
G1 X141.241 Y124.191 E.03157
G1 X138.319 Y124.191 E.09395
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05775
G1 X141.648 Y122.802 E.12206
G1 X141.648 Y124.598 E.05775
G1 X137.912 Y124.598 E.12013
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07685
G1 X142.04 Y122.41 E.13642
G1 X142.04 Y124.99 E.07685
G1 X137.52 Y124.99 E.13464
; WIPE_START
G1 F9547.055
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
G1 X141.037 Y123.7 E.11687
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6264.574
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
G1 X138.259 Y123.209 E.03157
G1 X141.241 Y123.209 E.09588
G1 X141.241 Y124.191 E.03157
G1 X138.319 Y124.191 E.09395
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05775
G1 X141.648 Y122.802 E.12206
G1 X141.648 Y124.598 E.05775
G1 X137.912 Y124.598 E.12013
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07685
G1 X142.04 Y122.41 E.13642
G1 X142.04 Y124.99 E.07685
G1 X137.52 Y124.99 E.13464
; WIPE_START
G1 F9547.055
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
G1 X141.037 Y123.7 E.11687
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6264.574
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
M73 P95 R0
G1 X138.259 Y123.209 E.03157
G1 X141.241 Y123.209 E.09588
G1 X141.241 Y124.191 E.03157
G1 X138.319 Y124.191 E.09395
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05775
G1 X141.648 Y122.802 E.12206
G1 X141.648 Y124.598 E.05775
G1 X137.912 Y124.598 E.12013
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07685
G1 X142.04 Y122.41 E.13642
G1 X142.04 Y124.99 E.07685
G1 X137.52 Y124.99 E.13464
; WIPE_START
G1 F9547.055
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
G1 X141.037 Y123.7 E.11687
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6264.574
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
G1 X138.259 Y123.209 E.03157
G1 X141.241 Y123.209 E.09588
G1 X141.241 Y124.191 E.03157
G1 X138.319 Y124.191 E.09395
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05775
G1 X141.648 Y122.802 E.12206
G1 X141.648 Y124.598 E.05775
G1 X137.912 Y124.598 E.12013
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07685
G1 X142.04 Y122.41 E.13642
G1 X142.04 Y124.99 E.07685
G1 X137.52 Y124.99 E.13464
; WIPE_START
G1 F9547.055
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
G1 X141.037 Y123.7 E.11687
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6264.574
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
G1 X138.259 Y123.209 E.03157
G1 X141.241 Y123.209 E.09588
G1 X141.241 Y124.191 E.03157
G1 X138.319 Y124.191 E.09395
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05775
G1 X141.648 Y122.802 E.12206
G1 X141.648 Y124.598 E.05775
G1 X137.912 Y124.598 E.12013
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07685
G1 X142.04 Y122.41 E.13642
G1 X142.04 Y124.99 E.07685
G1 X137.52 Y124.99 E.13464
; WIPE_START
G1 F9547.055
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
G1 X141.037 Y123.7 E.11687
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6264.574
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
M73 P96 R0
G1 F1200
G1 X138.259 Y123.209 E.03157
G1 X141.241 Y123.209 E.09588
G1 X141.241 Y124.191 E.03157
G1 X138.319 Y124.191 E.09395
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05775
G1 X141.648 Y122.802 E.12206
G1 X141.648 Y124.598 E.05775
G1 X137.912 Y124.598 E.12013
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07685
G1 X142.04 Y122.41 E.13642
G1 X142.04 Y124.99 E.07685
G1 X137.52 Y124.99 E.13464
; WIPE_START
G1 F9547.055
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
G1 X141.037 Y123.7 E.11687
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F6264.574
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
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X138.259 Y123.209 E.03157
G1 X141.241 Y123.209 E.09588
G1 X141.241 Y124.191 E.03157
G1 X138.319 Y124.191 E.09395
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05775
G1 X141.648 Y122.802 E.12206
G1 X141.648 Y124.598 E.05775
G1 X137.912 Y124.598 E.12013
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07685
G1 X142.04 Y122.41 E.13642
G1 X142.04 Y124.99 E.07685
G1 X137.52 Y124.99 E.13464
; WIPE_START
G1 F9547.055
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
G1 X141.037 Y123.7 E.11687
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6264.574
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
G1 X138.259 Y123.209 E.03157
G1 X141.241 Y123.209 E.09588
G1 X141.241 Y124.191 E.03157
G1 X138.319 Y124.191 E.09395
G1 X137.852 Y124.598 F30000
G1 F1200
G1 X137.852 Y122.802 E.05775
G1 X141.648 Y122.802 E.12206
G1 X141.648 Y124.598 E.05775
G1 X137.912 Y124.598 E.12013
G1 X137.46 Y124.99 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.46 Y122.41 E.07685
G1 X142.04 Y122.41 E.13642
G1 X142.04 Y124.99 E.07685
G1 X137.52 Y124.99 E.13464
; WIPE_START
G1 F9547.055
M204 S10000
G1 X137.474 Y122.991 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.463 Y123.7 Z9.2 F30000
M73 P97 R0
G1 Z8.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.61758
G1 F1200
G1 X141.037 Y123.7 E.11687
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6264.574
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
G1 X137.46 Y122.41 E.07685
G1 X142.04 Y122.41 E.13642
G1 X142.04 Y124.99 E.07685
G1 X137.52 Y124.99 E.13464
; WIPE_START
G1 F9547.055
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
G1 X141.415 Y122.617 E.0176
G1 X140.882 Y122.617
G1 X141.833 Y123.568 E.04006
G1 X141.833 Y124.102
G1 X140.348 Y122.617 E.06252
G1 X139.815 Y122.617
G1 X141.833 Y124.635 E.08499
G1 X141.447 Y124.783
G1 X139.282 Y122.617 E.09121
G1 X138.749 Y122.617
G1 X140.914 Y124.783 E.09121
G1 X140.381 Y124.783
G1 X138.215 Y122.617 E.09121
G1 X137.682 Y122.617
G1 X139.847 Y124.783 E.09121
G1 X139.314 Y124.783
G1 X137.667 Y123.136 E.06937
G1 X137.667 Y123.669
G1 X138.781 Y124.783 E.0469
G1 X138.248 Y124.783
G1 X137.667 Y124.202 E.02444
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F9547.055
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

