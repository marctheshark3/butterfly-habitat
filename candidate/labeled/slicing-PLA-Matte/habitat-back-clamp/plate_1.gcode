; HEADER_BLOCK_START
; BambuStudio 02.04.00.70
; model printing time: 58m 44s; total estimated time: 1h 5m 56s
; total layer number: 15
; total filament length [mm] : 14362.55
; total filament volume [cm^3] : 34545.99
; total filament weight [g] : 45.60
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
M73 P0 R65
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
M73 P2 R64
G1 E50 F200
M400
M104 S220
G92 E0
M73 P8 R60
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
M73 P9 R59
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
M73 P10 R59
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
G1 X25.419 Y28.511
G1 Z.2
G1 E.8 F1800
; FEATURE: Brim
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X25.964 Y28.178 E.02378
G1 X26.802 Y27.852 E.03351
G1 X27.429 Y27.721 E.02386
G1 X28.008 Y27.683 E.02159
G1 X227.992 Y27.683 E7.44865
G1 X228.64 Y27.731 E.02422
G1 X229.263 Y27.871 E.02377
G1 X230.106 Y28.228 E.0341
G1 X230.724 Y28.625 E.02737
G1 X231.203 Y29.051 E.02386
G1 X231.614 Y29.544 E.0239
G1 X231.947 Y30.089 E.02378
G1 X232.273 Y30.927 E.03351
G1 X232.404 Y31.554 E.02386
G1 X232.442 Y32.133 E.0216
G1 X232.442 Y219.866 E6.99237
M73 P10 R58
G1 X232.394 Y220.515 E.02422
G1 X232.254 Y221.138 E.02377
G1 X231.897 Y221.981 E.0341
G1 X231.5 Y222.599 E.02737
G1 X231.074 Y223.078 E.02386
G1 X230.581 Y223.489 E.0239
G1 X230.036 Y223.822 E.02378
G1 X229.198 Y224.148 E.03351
G1 X228.571 Y224.279 E.02386
G1 X227.992 Y224.317 E.0216
G1 X28.009 Y224.317 E7.44864
G1 X27.36 Y224.269 E.02422
G1 X26.737 Y224.129 E.02377
G1 X25.894 Y223.772 E.0341
G1 X25.276 Y223.375 E.02737
G1 X24.797 Y222.949 E.02386
G1 X24.386 Y222.456 E.0239
G1 X24.053 Y221.911 E.02378
G1 X23.727 Y221.073 E.03351
G1 X23.596 Y220.446 E.02386
G1 X23.558 Y219.867 E.02159
G1 X23.558 Y32.133 E6.99238
G1 X23.606 Y31.485 E.02422
G1 X23.746 Y30.862 E.02377
G1 X24.103 Y30.019 E.0341
G1 X24.5 Y29.401 E.02737
G1 X24.926 Y28.922 E.02386
G1 X25.372 Y28.549 E.02167
M204 S6000
G1 X25.665 Y28.902 F30000
G1 F3000
M204 S500
G1 X25.694 Y28.878 E.00139
G1 X26.178 Y28.585 E.02108
G1 X26.944 Y28.29 E.03056
G1 X27.482 Y28.177 E.02048
G1 X28.027 Y28.14 E.02036
G1 X227.98 Y28.14 E7.44747
G1 X228.562 Y28.183 E.02176
G1 X229.11 Y28.305 E.0209
G1 X229.881 Y28.63 E.03115
M73 P11 R58
G1 X230.438 Y28.985 E.02461
G1 X230.866 Y29.363 E.02128
G1 X231.247 Y29.819 E.02213
G1 X231.54 Y30.303 E.02108
G1 X231.835 Y31.069 E.03056
G1 X231.948 Y31.607 E.02048
G1 X231.985 Y32.152 E.02037
G1 X231.985 Y219.844 E6.99082
G1 X231.942 Y220.437 E.02214
G1 X231.82 Y220.985 E.0209
G1 X231.495 Y221.756 E.03115
G1 X231.14 Y222.313 E.02461
G1 X230.747 Y222.755 E.02203
G1 X230.306 Y223.122 E.02137
G1 X229.822 Y223.415 E.02108
G1 X229.056 Y223.71 E.03056
G1 X228.518 Y223.823 E.02048
G1 X227.973 Y223.86 E.02037
G1 X28.031 Y223.86 E7.44708
G1 X27.438 Y223.817 E.02214
G1 X26.89 Y223.694 E.0209
G1 X26.119 Y223.37 E.03115
G1 X25.562 Y223.015 E.02461
G1 X25.12 Y222.622 E.02203
G1 X24.753 Y222.181 E.02137
G1 X24.46 Y221.697 E.02108
G1 X24.165 Y220.931 E.03056
G1 X24.052 Y220.393 E.02048
G1 X24.015 Y219.848 E.02036
G1 X24.015 Y32.155 E6.99083
G1 X24.058 Y31.563 E.02214
G1 X24.181 Y31.015 E.0209
G1 X24.505 Y30.244 E.03115
G1 X24.86 Y29.687 E.02461
G1 X25.253 Y29.245 E.02203
G1 X25.619 Y28.94 E.01775
M204 S6000
G1 X25.911 Y29.294 F30000
G1 F3000
M204 S500
G1 X25.969 Y29.246 E.00278
G1 X26.392 Y28.993 E.01837
G1 X27.085 Y28.727 E.02764
G1 X27.554 Y28.63 E.01784
G1 X28.047 Y28.597 E.01843
G1 X227.958 Y28.597 E7.44589
G1 X228.485 Y28.636 E.01971
G1 X228.982 Y28.747 E.01895
G1 X229.678 Y29.042 E.02815
G1 X230.153 Y29.345 E.02099
G1 X230.53 Y29.676 E.01866
G1 X230.867 Y30.077 E.01954
G1 X231.132 Y30.517 E.01912
G1 X231.398 Y31.21 E.02764
G1 X231.495 Y31.679 E.01784
G1 X231.528 Y32.173 E.01843
G1 X231.528 Y219.823 E6.98925
G1 X231.489 Y220.36 E.02008
G1 X231.385 Y220.834 E.01804
G1 X231.094 Y221.532 E.0282
G1 X230.781 Y222.028 E.02182
G1 X230.421 Y222.432 E.02016
G1 X230.031 Y222.754 E.01881
G1 X229.608 Y223.007 E.01837
G1 X228.915 Y223.273 E.02764
G1 X228.446 Y223.37 E.01784
G1 X227.952 Y223.403 E.01843
G1 X28.052 Y223.403 E7.44552
G1 X27.515 Y223.364 E.02008
G1 X27.041 Y223.26 E.01804
G1 X26.343 Y222.969 E.0282
G1 X25.847 Y222.656 E.02182
G1 X25.443 Y222.296 E.02016
G1 X25.121 Y221.906 E.01881
G1 X24.868 Y221.483 E.01837
G1 X24.602 Y220.79 E.02764
G1 X24.505 Y220.321 E.01784
G1 X24.472 Y219.828 E.01843
G1 X24.472 Y32.177 E6.98926
G1 X24.511 Y31.64 E.02008
G1 X24.615 Y31.166 E.01804
G1 X24.906 Y30.468 E.0282
G1 X25.219 Y29.972 E.02182
G1 X25.579 Y29.568 E.02016
G1 X25.865 Y29.332 E.01379
M204 S6000
G1 X26.155 Y29.687 F30000
G1 F3000
M204 S500
G1 X26.242 Y29.615 E.00418
G1 X26.604 Y29.401 E.01567
G1 X27.224 Y29.165 E.02474
G1 X27.625 Y29.084 E.01522
G1 X28.068 Y29.054 E.01652
G1 X227.936 Y29.054 E7.44433
G1 X228.408 Y29.089 E.01764
G1 X228.853 Y29.189 E.01699
G1 X229.474 Y29.454 E.02515
G1 X229.869 Y29.706 E.01743
G1 X230.194 Y29.989 E.01606
G1 X230.487 Y30.336 E.01691
G1 X230.724 Y30.73 E.01712
G1 X230.96 Y31.349 E.0247
G1 X231.041 Y31.75 E.01522
G1 X231.071 Y32.193 E.01653
G1 X231.071 Y219.801 E6.9877
G1 X231.036 Y220.285 E.01806
G1 X230.95 Y220.683 E.0152
G1 X230.691 Y221.31 E.02526
G1 X230.42 Y221.742 E.019
G1 X230.095 Y222.109 E.01826
G1 X229.758 Y222.385 E.0162
G1 X229.396 Y222.599 E.01567
G1 X228.776 Y222.835 E.02474
G1 X228.375 Y222.916 E.01522
G1 X227.932 Y222.946 E.01653
G1 X28.074 Y222.946 E7.44397
G1 X27.59 Y222.911 E.01806
G1 X27.192 Y222.825 E.0152
G1 X26.565 Y222.566 E.02526
M73 P12 R58
G1 X26.133 Y222.295 E.019
G1 X25.766 Y221.97 E.01826
G1 X25.49 Y221.633 E.0162
G1 X25.276 Y221.271 E.01567
G1 X25.04 Y220.651 E.02474
G1 X24.959 Y220.25 E.01522
G1 X24.929 Y219.807 E.01652
G1 X24.929 Y32.199 E6.98771
G1 X24.964 Y31.715 E.01805
G1 X25.05 Y31.317 E.0152
G1 X25.309 Y30.69 E.02526
M73 P12 R57
G1 X25.58 Y30.258 E.019
G1 X25.905 Y29.891 E.01826
G1 X26.109 Y29.725 E.00979
M204 S6000
G1 X26.398 Y30.078 F30000
G1 F3000
M204 S500
G1 X26.497 Y29.998 E.00473
G1 X26.793 Y29.82 E.01286
G1 X27.342 Y29.609 E.0219
G1 X27.695 Y29.537 E.01343
G1 X28.087 Y29.511 E.01465
G1 X227.914 Y29.511 E7.4428
G1 X228.331 Y29.541 E.01555
G1 X228.723 Y29.631 E.015
G1 X229.27 Y29.866 E.02216
G1 X229.586 Y30.067 E.01395
G1 X229.86 Y30.304 E.01348
G1 X230.12 Y30.612 E.01504
G1 X230.316 Y30.942 E.01427
G1 X230.522 Y31.488 E.02174
G1 X230.588 Y31.82 E.0126
G1 X230.614 Y32.212 E.01465
G1 X230.614 Y219.78 E6.98617
G1 X230.583 Y220.21 E.01607
G1 X230.514 Y220.535 E.01237
G1 X230.288 Y221.089 E.02231
G1 X230.059 Y221.458 E.01615
G1 X229.768 Y221.785 E.01631
G1 X229.503 Y222.002 E.01276
G1 X229.207 Y222.18 E.01286
G1 X228.658 Y222.391 E.0219
G1 X228.305 Y222.463 E.01343
G1 X227.913 Y222.489 E.01465
G1 X28.095 Y222.489 E7.44243
G1 X27.665 Y222.458 E.01607
G1 X27.34 Y222.389 E.01237
G1 X26.786 Y222.163 E.02231
G1 X26.417 Y221.934 E.01615
G1 X26.09 Y221.643 E.01631
G1 X25.873 Y221.378 E.01276
G1 X25.695 Y221.082 E.01286
G1 X25.484 Y220.533 E.0219
G1 X25.412 Y220.18 E.01343
G1 X25.386 Y219.788 E.01465
G1 X25.386 Y32.22 E6.98618
G1 X25.417 Y31.79 E.01607
G1 X25.486 Y31.465 E.01237
G1 X25.712 Y30.911 E.02231
G1 X25.941 Y30.542 E.01615
G1 X26.232 Y30.215 E.01631
G1 X26.352 Y30.116 E.0058
M204 S6000
G1 X26.658 Y30.486 F30000
G1 F3000
M204 S500
G1 X26.842 Y30.333 E.00889
G1 X27.185 Y30.148 E.01452
G1 X27.553 Y30.029 E.0144
G1 X28.036 Y29.968 E.01815
G1 X227.959 Y29.968 E7.44638
G1 X228.407 Y30.024 E.0168
G1 X228.858 Y30.165 E.0176
G1 X229.045 Y30.267 E.00793
G1 X229.436 Y30.554 E.01808
G1 X229.53 Y30.642 E.0048
G1 X229.825 Y31.019 E.01781
G1 X230.002 Y31.378 E.01492
G1 X230.116 Y31.776 E.0154
G1 X230.157 Y32.16 E.01439
G1 X230.157 Y219.843 E6.99049
G1 X230.113 Y220.227 E.01438
G1 X229.966 Y220.71 E.01884
G1 X229.81 Y221.006 E.01244
G1 X229.561 Y221.326 E.01509
G1 X229.203 Y221.636 E.01766
G1 X228.839 Y221.839 E.0155
G1 X228.453 Y221.969 E.0152
G1 X227.964 Y222.032 E.01836
G1 X28.032 Y222.032 E7.4467
G1 X27.648 Y221.988 E.01438
G1 X27.165 Y221.841 E.01884
G1 X26.869 Y221.685 E.01244
G1 X26.549 Y221.436 E.01509
G1 X26.239 Y221.078 E.01766
G1 X26.036 Y220.714 E.0155
G1 X25.906 Y220.328 E.0152
G1 X25.843 Y219.839 E.01836
G1 X25.843 Y32.166 E6.99011
G1 X25.899 Y31.717 E.01686
G1 X26.003 Y31.358 E.01391
G1 X26.198 Y30.987 E.01562
G1 X26.48 Y30.633 E.01684
G1 X26.612 Y30.524 E.00638
M204 S6000
G1 X26.888 Y30.877 F30000
G1 F3000
M204 S500
G1 X27.131 Y30.687 E.01148
G1 X27.398 Y30.552 E.01116
G1 X27.692 Y30.464 E.01143
G1 X28.027 Y30.425 E.01256
G1 X227.968 Y30.425 E7.44702
G1 X228.355 Y30.478 E.01457
G1 X228.645 Y30.568 E.01128
G1 X228.767 Y30.63 E.00513
G1 X229.173 Y30.928 E.01873
G1 X229.415 Y31.221 E.01415
G1 X229.563 Y31.505 E.01194
G1 X229.661 Y31.818 E.01221
G1 X229.7 Y32.152 E.01254
G1 X229.7 Y219.851 E6.99105
G1 X229.659 Y220.181 E.01241
M73 P13 R57
G1 X229.529 Y220.577 E.01553
G1 X229.409 Y220.787 E.00896
G1 X229.199 Y221.047 E.01248
G1 X228.904 Y221.29 E.01422
G1 X228.62 Y221.438 E.01195
G1 X228.307 Y221.536 E.01221
G1 X227.973 Y221.575 E.01254
G1 X28.024 Y221.575 E7.44732
G1 X27.694 Y221.534 E.01241
G1 X27.298 Y221.404 E.01553
G1 X27.088 Y221.284 E.00896
G1 X26.828 Y221.074 E.01248
G1 X26.585 Y220.779 E.01422
G1 X26.437 Y220.495 E.01195
G1 X26.339 Y220.182 E.01221
G1 X26.3 Y219.848 E.01253
G1 X26.3 Y32.157 E6.99075
G1 X26.353 Y31.77 E.01457
G1 X26.443 Y31.483 E.01116
G1 X26.6 Y31.203 E.01199
G1 X26.839 Y30.916 E.0139
G1 X26.841 Y30.914 E.0001
M204 S6000
G1 X27.192 Y31.205 F30000
G1 F3000
M204 S500
G1 X27.196 Y31.201 E.00024
G1 X27.403 Y31.054 E.00943
G1 X27.6 Y30.962 E.0081
G1 X27.742 Y30.919 E.00552
G1 X28.019 Y30.882 E.01043
G1 X227.977 Y30.882 E7.44766
G1 X228.295 Y30.931 E.01198
G1 X228.503 Y31.003 E.00819
G1 X228.827 Y31.226 E.01467
G1 X229.003 Y31.42 E.00976
G1 X229.164 Y31.728 E.01293
G1 X229.206 Y31.867 E.0054
G1 X229.243 Y32.144 E.01044
G1 X229.243 Y219.859 E6.99166
G1 X229.224 Y220.041 E.00679
G1 X229.13 Y220.355 E.01222
G1 X229.051 Y220.504 E.00628
G1 X228.899 Y220.703 E.00934
G1 X228.705 Y220.878 E.00972
G1 X228.397 Y221.039 E.01294
G1 X228.258 Y221.081 E.0054
G1 X227.981 Y221.118 E.01044
G1 X28.016 Y221.118 E7.44793
G1 X27.834 Y221.099 E.00679
G1 X27.52 Y221.005 E.01222
G1 X27.371 Y220.926 E.00628
G1 X27.172 Y220.774 E.00934
G1 X26.997 Y220.58 E.00972
G1 X26.836 Y220.272 E.01294
G1 X26.794 Y220.133 E.0054
G1 X26.757 Y219.856 E.01043
G1 X26.757 Y32.148 E6.9914
G1 X26.806 Y31.83 E.01198
G1 X26.878 Y31.622 E.00819
M73 P13 R56
G1 X26.944 Y31.504 E.00504
G1 X27.154 Y31.252 E.01223
M204 S6000
G1 X27.473 Y31.564 F30000
G1 F3000
M204 S500
G1 X27.586 Y31.473 E.00541
G1 X27.803 Y31.371 E.00893
G1 X28.011 Y31.339 E.00782
G1 X227.988 Y31.339 E7.44838
G1 X228.221 Y31.382 E.00884
G1 X228.339 Y31.429 E.00475
G1 X228.561 Y31.598 E.01037
G1 X228.652 Y31.711 E.00541
G1 X228.754 Y31.928 E.00892
G1 X228.786 Y32.136 E.00782
G1 X228.786 Y219.866 E6.99226
G1 X228.77 Y219.993 E.00475
G1 X228.694 Y220.218 E.00884
G1 X228.527 Y220.436 E.01023
G1 X228.414 Y220.527 E.00541
G1 X228.197 Y220.629 E.00892
G1 X227.989 Y220.661 E.00782
G1 X28.009 Y220.661 E7.44852
G1 X27.882 Y220.645 E.00475
G1 X27.657 Y220.569 E.00884
G1 X27.439 Y220.402 E.01023
G1 X27.348 Y220.289 E.00541
G1 X27.246 Y220.072 E.00893
G1 X27.214 Y219.864 E.00782
G1 X27.214 Y32.137 E6.99212
G1 X27.257 Y31.904 E.00884
G1 X27.304 Y31.786 E.00475
G1 X27.436 Y31.612 E.00814
M204 S6000
G1 X27.747 Y31.93 F30000
G1 F3000
M204 S500
G1 X27.884 Y31.821 E.00651
G1 X28 Y31.796 E.00442
G1 X228 Y31.796 E7.44924
G1 X228.111 Y31.825 E.00426
G1 X228.195 Y31.872 E.00361
M73 P14 R56
G1 X228.304 Y32.009 E.00651
G1 X228.329 Y32.125 E.00442
G1 X228.329 Y219.875 E6.99297
G1 X228.3 Y219.986 E.00426
G1 X228.253 Y220.07 E.00361
G1 X228.116 Y220.179 E.00651
G1 X228 Y220.204 E.00442
G1 X28 Y220.204 E7.44924
G1 X27.889 Y220.175 E.00426
G1 X27.805 Y220.128 E.00361
G1 X27.696 Y219.991 E.00651
G1 X27.671 Y219.875 E.00442
G1 X27.671 Y32.125 E6.99297
G1 X27.7 Y32.014 E.00426
G1 X27.718 Y31.982 E.00137
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
G1 X28.4 Y219.475 E7.41944
G1 X28.4 Y32.525 E6.96318
G1 X227.6 Y32.525 E7.41944
G1 X227.6 Y219.415 E6.96094
M204 S6000
G1 X227.143 Y219.018 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X28.857 Y219.018 E7.3854
G1 X28.857 Y32.982 E6.92913
G1 X227.143 Y32.982 E7.3854
G1 X227.143 Y218.958 E6.92689
M204 S6000
G1 X226.686 Y218.561 F30000
G1 F3000
M204 S500
G1 X29.314 Y218.561 E7.35135
G1 X29.314 Y33.439 E6.89508
G1 X226.686 Y33.439 E7.35135
G1 X226.686 Y218.501 E6.89285
M204 S6000
G1 X226.229 Y218.104 F30000
G1 F3000
M204 S500
G1 X29.771 Y218.104 E7.3173
G1 X29.771 Y33.896 E6.86103
G1 X226.229 Y33.896 E7.3173
G1 X226.229 Y218.044 E6.8588
; WIPE_START
G1 X224.229 Y218.044 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X216.613 Y217.535 Z.6 F30000
G1 X39.697 Y205.697 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X39.733 Y205.691 E.00136
G1 X39.945 Y205.675 E.00792
G3 X39.511 Y205.73 I.058 J2.199 E.49842
G1 X39.638 Y205.708 E.0048
M204 S6000
G1 X39.204 Y205.341 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X39.41 Y205.284 E.00798
G3 X39.677 Y205.237 I.594 J2.59 E.01008
G1 X39.934 Y205.218 E.0096
G3 X39.147 Y205.359 I.07 J2.656 E.59191
M204 S6000
G1 X38.641 Y205.075 F30000
G1 F3000
M204 S500
G1 X38.719 Y205.037 E.00326
G3 X39.62 Y204.783 I1.285 J2.837 E.03501
G1 X39.922 Y204.76 E.01127
G3 X38.443 Y205.179 I.082 J3.113 E.67097
G1 X38.587 Y205.103 E.00608
M204 S6000
G1 X38.076 Y204.869 F30000
G1 F3000
M204 S500
G1 X38.214 Y204.783 E.00606
G3 X39.564 Y204.329 I1.791 J3.091 E.05341
G1 X39.911 Y204.303 E.01295
M73 P15 R56
G3 X37.916 Y204.976 I.094 J3.571 E.75629
M73 P15 R55
G1 X38.026 Y204.902 E.00495
; WIPE_START
G1 X38.214 Y204.783 E-.08461
G1 X38.53 Y204.618 E-.13545
G1 X38.862 Y204.488 E-.13537
G1 X39.208 Y204.39 E-.13665
G1 X39.564 Y204.329 E-.13738
G1 X39.907 Y204.303 E-.13055
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X39.892 Y196.671 Z.6 F30000
G1 X39.747 Y123.815 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
M73 P16 R55
G1 X39.945 Y123.8 E.0074
G3 X39.688 Y123.822 I.058 J2.194 E.50404
M204 S6000
G1 X39.199 Y123.467 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X39.41 Y123.409 E.00816
G3 X39.677 Y123.362 I.594 J2.59 E.01009
G1 X39.934 Y123.343 E.0096
G3 X39.142 Y123.485 I.07 J2.656 E.59173
M204 S6000
G1 X38.636 Y123.202 F30000
G1 F3000
M204 S500
G1 X38.719 Y123.162 E.00344
G3 X39.621 Y122.908 I1.285 J2.837 E.035
G1 X39.922 Y122.885 E.01127
G3 X38.443 Y123.304 I.082 J3.113 E.67098
G1 X38.583 Y123.23 E.0059
M204 S6000
G1 X38.072 Y122.996 F30000
G1 F3000
M204 S500
G1 X38.214 Y122.907 E.00624
G3 X39.564 Y122.454 I1.79 J3.091 E.0534
G1 X39.911 Y122.428 E.01295
G3 X37.916 Y123.101 I.094 J3.571 E.7563
G1 X38.023 Y123.03 E.00478
; WIPE_START
G1 X38.214 Y122.907 E-.08643
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
G1 X51.6 Y196.275 E5.69122
G1 X51.6 Y55.725 E5.23495
G1 X204.4 Y55.725 E5.69122
M73 P16 R54
G1 X204.4 Y196.215 E5.23272
M204 S6000
G1 X204.857 Y196.732 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X51.143 Y196.732 E5.72527
G1 X51.143 Y55.268 E5.269
G1 X204.857 Y55.268 E5.72527
G1 X204.857 Y196.672 E5.26677
M204 S6000
G1 X205.314 Y197.189 F30000
G1 F3000
M204 S500
G1 X50.686 Y197.189 E5.75932
G1 X50.686 Y54.811 E5.30305
G1 X205.314 Y54.811 E5.75932
G1 X205.314 Y197.129 E5.30082
M204 S6000
G1 X205.771 Y197.646 F30000
G1 F3000
M204 S500
G1 X50.229 Y197.646 E5.79336
G1 X50.229 Y54.354 E5.3371
G1 X205.771 Y54.354 E5.79336
G1 X205.771 Y197.586 E5.33486
; WIPE_START
G1 X203.771 Y197.587 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X198.235 Y192.333 Z.6 F30000
G1 X39.747 Y41.94 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X39.945 Y41.925 E.00741
G3 X39.687 Y41.947 I.058 J2.194 E.50403
M204 S6000
G1 X39.2 Y41.592 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X39.41 Y41.534 E.00814
G3 X39.677 Y41.487 I.594 J2.59 E.01009
G1 X39.934 Y41.468 E.0096
G3 X39.142 Y41.61 I.07 J2.656 E.59175
M204 S6000
G1 X38.637 Y41.327 F30000
G1 F3000
M204 S500
G1 X38.719 Y41.287 E.00341
G3 X39.621 Y41.033 I1.285 J2.837 E.03501
G1 X39.922 Y41.01 E.01127
G3 X38.443 Y41.429 I.082 J3.113 E.67098
G1 X38.584 Y41.355 E.00593
M204 S6000
G1 X38.073 Y41.121 F30000
G1 F3000
M204 S500
G1 X38.214 Y41.033 E.00621
G3 X39.564 Y40.579 I1.79 J3.091 E.0534
G1 X39.911 Y40.553 E.01295
G3 X37.916 Y41.226 I.094 J3.571 E.7563
G1 X38.023 Y41.154 E.0048
; WIPE_START
G1 X38.214 Y41.033 E-.08616
G1 X38.53 Y40.868 E-.13536
G1 X38.862 Y40.738 E-.13538
G1 X39.208 Y40.64 E-.13662
G1 X39.564 Y40.579 E-.13741
G1 X39.903 Y40.553 E-.12906
; WIPE_END
M73 P17 R54
G1 E-.04 F1800
M204 S6000
G1 X47.534 Y40.674 Z.6 F30000
G1 X127.747 Y41.94 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X127.945 Y41.925 E.0074
G3 X127.688 Y41.947 I.058 J2.194 E.50404
M204 S6000
G1 X127.199 Y41.593 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X127.41 Y41.534 E.00816
G3 X127.677 Y41.487 I.594 J2.59 E.01009
G1 X127.934 Y41.468 E.0096
G3 X127.142 Y41.611 I.07 J2.656 E.59168
M204 S6000
G1 X126.636 Y41.327 F30000
G1 F3000
M204 S500
G1 X126.719 Y41.287 E.00344
G3 X127.62 Y41.033 I1.285 J2.837 E.03501
G1 X127.922 Y41.01 E.01127
G3 X126.443 Y41.429 I.082 J3.113 E.67098
G1 X126.583 Y41.355 E.00589
M204 S6000
G1 X126.072 Y41.121 F30000
G1 F3000
M204 S500
G1 X126.214 Y41.032 E.00624
G3 X127.564 Y40.579 I1.79 J3.091 E.0534
G1 X127.911 Y40.553 E.01295
G3 X125.916 Y41.226 I.094 J3.571 E.75629
G1 X126.023 Y41.155 E.00478
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
G1 X215.945 Y41.925 E.0074
G3 X215.688 Y41.947 I.058 J2.194 E.50404
M204 S6000
G1 X216.165 Y41.473 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X216.199 Y41.474 E.00125
G3 X215.677 Y41.487 I-.195 J2.65 E.60234
G1 X215.934 Y41.468 E.0096
G1 X216.105 Y41.472 E.00639
M204 S6000
G1 X216.645 Y41.08 F30000
G1 F3000
M204 S500
G1 X216.844 Y41.124 E.00761
G3 X215.621 Y41.033 I-.84 J2.999 E.68283
G1 X215.922 Y41.01 E.01127
G3 X216.541 Y41.056 I.082 J3.113 E.02315
G1 X216.586 Y41.066 E.00172
M204 S6000
G1 X217.14 Y40.743 F30000
G1 F3000
M204 S500
G1 X217.306 Y40.797 E.00651
G3 X215.564 Y40.579 I-1.302 J3.326 E.76984
G1 X215.911 Y40.553 E.01295
G3 X216.968 Y40.684 I.094 J3.571 E.03982
G1 X217.083 Y40.723 E.00454
; WIPE_START
G1 X217.306 Y40.797 E-.0892
G1 X217.63 Y40.945 E-.13548
M73 P18 R54
G1 X217.939 Y41.123 E-.13533
G1 X218.228 Y41.331 E-.13536
G1 X218.495 Y41.567 E-.13529
G1 X218.726 Y41.816 E-.12934
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X218.449 Y49.444 Z.6 F30000
G1 X215.747 Y123.815 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X215.945 Y123.8 E.00741
G3 X215.687 Y123.822 I.058 J2.194 E.50402
M204 S6000
G1 X215.199 Y123.467 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X215.41 Y123.409 E.00816
G3 X215.677 Y123.362 I.594 J2.59 E.01009
G1 X215.934 Y123.343 E.0096
G3 X215.142 Y123.485 I.07 J2.656 E.59174
M204 S6000
G1 X214.637 Y123.202 F30000
G1 F3000
M204 S500
G1 X214.719 Y123.162 E.00342
G3 X215.621 Y122.908 I1.285 J2.837 E.03501
G1 X215.922 Y122.885 E.01127
G3 X214.443 Y123.304 I.082 J3.113 E.67099
G1 X214.583 Y123.23 E.0059
M204 S6000
G1 X214.073 Y122.996 F30000
G1 F3000
M204 S500
G1 X214.215 Y122.907 E.00624
G3 X215.564 Y122.454 I1.79 J3.091 E.05339
G1 X215.911 Y122.428 E.01295
G3 X213.916 Y123.101 I.094 J3.571 E.75629
G1 X214.023 Y123.029 E.00479
; WIPE_START
G1 X214.215 Y122.907 E-.08641
G1 X214.53 Y122.743 E-.13522
G1 X214.862 Y122.613 E-.13541
G1 X215.208 Y122.515 E-.13661
G1 X215.564 Y122.454 E-.13741
G1 X215.903 Y122.428 E-.12894
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X215.884 Y130.061 Z.6 F30000
G1 X215.697 Y205.697 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X215.733 Y205.691 E.00135
G1 X215.945 Y205.675 E.00792
G3 X215.511 Y205.73 I.058 J2.199 E.49842
G1 X215.638 Y205.708 E.0048
M204 S6000
G1 X216.16 Y205.223 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X216.199 Y205.224 E.00145
G3 X215.677 Y205.237 I-.195 J2.65 E.60233
G1 X215.934 Y205.218 E.0096
G1 X216.1 Y205.222 E.00619
M204 S6000
G1 X216.64 Y204.829 F30000
G1 F3000
M204 S500
G1 X216.844 Y204.875 E.00781
G3 X215.62 Y204.783 I-.84 J2.999 E.68282
G1 X215.922 Y204.76 E.01127
G3 X216.541 Y204.806 I.082 J3.113 E.02315
G1 X216.581 Y204.815 E.00153
M204 S6000
G1 X217.135 Y204.491 F30000
M73 P18 R53
G1 F3000
M204 S500
G1 X217.306 Y204.547 E.00668
G3 X215.564 Y204.329 I-1.301 J3.326 E.76984
G1 X215.911 Y204.303 E.01295
G3 X216.968 Y204.434 I.094 J3.571 E.03983
G1 X217.079 Y204.472 E.00435
; WIPE_START
G1 X217.306 Y204.547 E-.09098
G1 X217.63 Y204.695 E-.13545
G1 X217.939 Y204.873 E-.13541
G1 X218.228 Y205.081 E-.13534
G1 X218.495 Y205.317 E-.13537
G1 X218.723 Y205.563 E-.12744
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X211.091 Y205.573 Z.6 F30000
G1 X127.74 Y205.691 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X127.945 Y205.675 E.00765
G3 X127.681 Y205.698 I.058 J2.199 E.50485
M204 S6000
G1 X128.165 Y205.223 F30000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X128.199 Y205.224 E.00127
G3 X127.677 Y205.237 I-.195 J2.65 E.60233
G1 X127.934 Y205.218 E.0096
G1 X128.105 Y205.222 E.00637
M204 S6000
G1 X128.644 Y204.83 F30000
G1 F3000
M204 S500
G1 X128.844 Y204.874 E.00764
G3 X127.621 Y204.783 I-.84 J2.999 E.68287
G1 X127.922 Y204.76 E.01127
G3 X128.541 Y204.806 I.082 J3.113 E.02316
G1 X128.586 Y204.816 E.00169
M204 S6000
G1 X129.14 Y204.493 F30000
G1 F3000
M204 S500
G1 X129.306 Y204.547 E.00652
G3 X127.565 Y204.329 I-1.301 J3.326 E.76983
G1 X127.911 Y204.303 E.01293
G3 X128.968 Y204.434 I.094 J3.571 E.03984
G1 X129.083 Y204.473 E.00452
; WIPE_START
G1 X129.306 Y204.547 E-.08933
G1 X129.63 Y204.695 E-.13538
G1 X129.939 Y204.873 E-.13544
G1 X130.228 Y205.081 E-.13529
G1 X130.495 Y205.317 E-.13547
G1 X130.726 Y205.566 E-.12909
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X134.45 Y198.903 Z.6 F30000
G1 X226.046 Y35.004 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.5007
G1 F6300
M204 S500
G1 X225.326 Y34.285 E.03797
G1 X224.679 Y34.285 E.02415
G1 X225.84 Y35.446 E.06127
G1 X225.84 Y36.094 E.02415
G1 X224.031 Y34.285 E.09543
G1 X223.384 Y34.285 E.02415
G1 X225.84 Y36.741 E.12958
G1 X225.84 Y37.388 E.02415
G1 X222.737 Y34.285 E.16373
G1 X222.089 Y34.285 E.02415
G1 X225.84 Y38.036 E.19789
G1 X225.84 Y38.683 E.02415
G1 X221.442 Y34.285 E.23204
G1 X220.794 Y34.285 E.02415
G1 X225.84 Y39.331 E.26619
G1 X225.84 Y39.978 E.02415
G1 X220.147 Y34.285 E.30035
G1 X219.5 Y34.285 E.02415
G1 X225.84 Y40.625 E.3345
G1 X225.84 Y41.273 E.02415
G1 X218.852 Y34.285 E.36865
G1 X218.205 Y34.285 E.02415
G1 X225.84 Y41.92 E.40281
G1 X225.84 Y42.568 E.02415
G1 X217.557 Y34.285 E.43696
G1 X216.91 Y34.285 E.02415
G1 X225.84 Y43.215 E.47111
G1 X225.84 Y43.862 E.02415
G1 X216.263 Y34.285 E.50527
G1 X215.615 Y34.285 E.02415
G1 X225.84 Y44.51 E.53942
G1 X225.84 Y45.157 E.02415
G1 X214.968 Y34.285 E.57358
G1 X214.32 Y34.285 E.02415
G1 X225.84 Y45.805 E.60773
G1 X225.84 Y46.452 E.02415
G1 X213.673 Y34.285 E.64188
G1 X213.026 Y34.285 E.02415
G1 X225.84 Y47.099 E.67604
G1 X225.84 Y47.747 E.02415
G1 X212.378 Y34.285 E.71019
G1 X211.731 Y34.285 E.02415
G1 X225.84 Y48.394 E.74434
G1 X225.84 Y49.042 E.02415
G1 X219.797 Y42.998 E.31882
G3 X219.946 Y43.795 I-4.421 J1.24 E.03026
G1 X225.84 Y49.689 E.31096
G1 X225.84 Y50.336 E.02415
G1 X219.947 Y44.443 E.31092
G3 X219.86 Y45.004 I-4.668 J-.433 E.02118
G1 X225.84 Y50.984 E.31549
G1 X225.84 Y51.631 E.02415
G1 X219.711 Y45.501 E.32338
G3 X219.513 Y45.951 I-2.344 J-.761 E.01836
G1 X225.84 Y52.279 E.3338
G1 X225.84 Y52.926 E.02415
G1 X219.273 Y46.358 E.34647
G3 X218.989 Y46.722 I-1.956 J-1.235 E.01723
G1 X225.84 Y53.573 E.36144
G1 X225.84 Y54.221 E.02415
G1 X218.668 Y47.049 E.37837
G3 X218.31 Y47.338 I-1.628 J-1.646 E.0172
G1 X225.84 Y54.868 E.39724
G1 X225.84 Y55.516 E.02415
G1 X217.914 Y47.589 E.41814
G3 X217.477 Y47.8 I-1.273 J-2.082 E.01812
G1 X225.84 Y56.163 E.44118
G1 X225.84 Y56.81 E.02415
G1 X216.989 Y47.959 E.46697
G3 X216.441 Y48.058 I-.772 J-2.69 E.02081
G1 X225.84 Y57.458 E.49587
G1 X225.84 Y58.105 E.02415
G1 X215.815 Y48.08 E.52889
G3 X215.059 Y47.971 I.262 J-4.521 E.02851
G1 X226.046 Y58.958 E.57961
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
G1 X211.083 Y34.285 E.33701
G1 X210.436 Y34.285 E.02415
G1 X216.329 Y40.178 E.31089
G2 X215.684 Y40.18 I-.305 J4.84 E.02408
G1 X209.789 Y34.285 E.31101
G1 X209.141 Y34.285 E.02415
G1 X215.118 Y40.262 E.31533
G2 X214.623 Y40.414 I.511 J2.546 E.01936
G1 X208.494 Y34.285 E.32335
G1 X207.846 Y34.285 E.02415
G1 X214.175 Y40.613 E.33387
G2 X213.769 Y40.855 I1.002 J2.147 E.01765
G1 X207.199 Y34.285 E.3466
G1 X206.552 Y34.285 E.02415
G1 X213.402 Y41.135 E.36139
G2 X213.074 Y41.455 I5.663 J6.128 E.01708
G1 X205.904 Y34.285 E.37826
G1 X205.257 Y34.285 E.02415
G1 X212.786 Y41.814 E.3972
G2 X212.536 Y42.211 I1.863 J1.45 E.01754
G1 X204.609 Y34.285 E.41816
G1 X203.962 Y34.285 E.02415
G1 X212.327 Y42.65 E.4413
G2 X212.164 Y43.134 I2.346 J1.059 E.0191
G1 X203.315 Y34.285 E.46685
G1 X202.667 Y34.285 E.02415
G1 X212.067 Y43.684 E.49588
G2 X212.043 Y44.307 I3.101 J.433 E.0233
G1 X202.02 Y34.285 E.52874
G1 X201.372 Y34.285 E.02415
G1 X212.458 Y45.37 E.58481
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
G1 X225.84 Y59.4 E1.3358
G1 X225.84 Y60.047 E.02415
G1 X200.078 Y34.285 E1.3591
G1 X199.43 Y34.285 E.02415
G1 X225.84 Y60.695 E1.39326
G1 X225.84 Y61.342 E.02415
G1 X198.783 Y34.285 E1.42741
G1 X198.135 Y34.285 E.02415
G1 X225.84 Y61.99 E1.46156
G1 X225.84 Y62.637 E.02415
G1 X197.488 Y34.285 E1.49572
G1 X196.841 Y34.285 E.02415
G1 X225.84 Y63.284 E1.52987
G1 X225.84 Y63.932 E.02415
G1 X196.193 Y34.285 E1.56402
G1 X195.546 Y34.285 E.02415
G1 X225.84 Y64.579 E1.59818
G1 X225.84 Y65.227 E.02415
G1 X194.898 Y34.285 E1.63233
G1 X194.251 Y34.285 E.02415
G1 X225.84 Y65.874 E1.66648
G1 X225.84 Y66.521 E.02415
G1 X193.604 Y34.285 E1.70064
G1 X192.956 Y34.285 E.02415
G1 X225.84 Y67.169 E1.73479
G1 X225.84 Y67.816 E.02415
G1 X192.309 Y34.285 E1.76894
G1 X191.661 Y34.285 E.02415
G1 X225.84 Y68.464 E1.8031
G1 X225.84 Y69.111 E.02415
G1 X191.014 Y34.285 E1.83725
G1 X190.367 Y34.285 E.02415
G1 X225.84 Y69.758 E1.8714
G1 X225.84 Y70.406 E.02415
G1 X189.719 Y34.285 E1.90556
G1 X189.072 Y34.285 E.02415
G1 X225.84 Y71.053 E1.93971
G1 X225.84 Y71.701 E.02415
G1 X188.424 Y34.285 E1.97386
G1 X187.777 Y34.285 E.02415
G1 X225.84 Y72.348 E2.00802
G1 X225.84 Y72.995 E.02415
G1 X187.13 Y34.285 E2.04217
G1 X186.482 Y34.285 E.02415
G1 X225.84 Y73.643 E2.07632
G1 X225.84 Y74.29 E.02415
G1 X206.16 Y54.61 E1.03824
G1 X206.16 Y53.965 E.02403
G1 X205.515 Y53.965 E.02403
G1 X185.835 Y34.285 E1.03824
G1 X185.187 Y34.285 E.02415
G1 X204.868 Y53.965 E1.03824
G1 X204.221 Y53.965 E.02415
G1 X184.54 Y34.285 E1.03824
G1 X183.893 Y34.285 E.02415
G1 X203.573 Y53.965 E1.03824
G1 X202.926 Y53.965 E.02415
G1 X183.245 Y34.285 E1.03824
G1 X182.598 Y34.285 E.02415
G1 X202.278 Y53.965 E1.03824
G1 X201.631 Y53.965 E.02415
G1 X181.95 Y34.285 E1.03824
G1 X181.303 Y34.285 E.02415
G1 X200.984 Y53.965 E1.03824
G1 X200.336 Y53.965 E.02415
G1 X180.656 Y34.285 E1.03824
G1 X180.008 Y34.285 E.02415
G1 X199.689 Y53.965 E1.03824
G1 X199.041 Y53.965 E.02415
G1 X179.361 Y34.285 E1.03824
G1 X178.713 Y34.285 E.02415
G1 X198.394 Y53.965 E1.03824
G1 X197.747 Y53.965 E.02415
G1 X178.066 Y34.285 E1.03824
G1 X177.419 Y34.285 E.02415
G1 X197.099 Y53.965 E1.03824
G1 X196.452 Y53.965 E.02415
G1 X176.771 Y34.285 E1.03824
G1 X176.124 Y34.285 E.02415
G1 X195.804 Y53.965 E1.03824
G1 X195.157 Y53.965 E.02415
G1 X175.476 Y34.285 E1.03824
G1 X174.829 Y34.285 E.02415
G1 X194.51 Y53.965 E1.03824
G1 X193.862 Y53.965 E.02415
G1 X174.182 Y34.285 E1.03824
G1 X173.534 Y34.285 E.02415
M73 P19 R53
G1 X193.215 Y53.965 E1.03824
G1 X192.567 Y53.965 E.02415
G1 X172.887 Y34.285 E1.03824
G1 X172.24 Y34.285 E.02415
G1 X191.92 Y53.965 E1.03824
G1 X191.273 Y53.965 E.02415
G1 X171.592 Y34.285 E1.03824
G1 X170.945 Y34.285 E.02415
G1 X190.625 Y53.965 E1.03824
G1 X189.978 Y53.965 E.02415
G1 X170.297 Y34.285 E1.03824
G1 X169.65 Y34.285 E.02415
G1 X189.33 Y53.965 E1.03824
G1 X188.683 Y53.965 E.02415
G1 X169.003 Y34.285 E1.03824
G1 X168.355 Y34.285 E.02415
G1 X188.036 Y53.965 E1.03824
G1 X187.388 Y53.965 E.02415
G1 X167.708 Y34.285 E1.03824
G1 X167.06 Y34.285 E.02415
G1 X186.741 Y53.965 E1.03824
G1 X186.093 Y53.965 E.02415
G1 X166.413 Y34.285 E1.03824
G1 X165.766 Y34.285 E.02415
G1 X185.446 Y53.965 E1.03824
G1 X184.799 Y53.965 E.02415
G1 X165.118 Y34.285 E1.03824
G1 X164.471 Y34.285 E.02415
G1 X184.151 Y53.965 E1.03824
G1 X183.504 Y53.965 E.02415
G1 X163.823 Y34.285 E1.03824
G1 X163.176 Y34.285 E.02415
G1 X182.856 Y53.965 E1.03824
G1 X182.209 Y53.965 E.02415
G1 X162.529 Y34.285 E1.03824
G1 X161.881 Y34.285 E.02415
G1 X181.562 Y53.965 E1.03824
G1 X180.914 Y53.965 E.02415
G1 X161.234 Y34.285 E1.03824
G1 X160.586 Y34.285 E.02415
G1 X180.267 Y53.965 E1.03824
G1 X179.619 Y53.965 E.02415
G1 X159.939 Y34.285 E1.03824
G1 X159.292 Y34.285 E.02415
G1 X178.972 Y53.965 E1.03824
G1 X178.325 Y53.965 E.02415
G1 X158.644 Y34.285 E1.03824
G1 X157.997 Y34.285 E.02415
G1 X177.677 Y53.965 E1.03824
G1 X177.03 Y53.965 E.02415
G1 X157.349 Y34.285 E1.03824
G1 X156.702 Y34.285 E.02415
G1 X176.382 Y53.965 E1.03824
G1 X175.735 Y53.965 E.02415
G1 X156.055 Y34.285 E1.03824
G1 X155.407 Y34.285 E.02415
G1 X175.088 Y53.965 E1.03824
G1 X174.44 Y53.965 E.02415
G1 X154.76 Y34.285 E1.03824
G1 X154.112 Y34.285 E.02415
G1 X173.793 Y53.965 E1.03824
G1 X173.146 Y53.965 E.02415
G1 X153.465 Y34.285 E1.03824
G1 X152.818 Y34.285 E.02415
G1 X172.498 Y53.965 E1.03824
G1 X171.851 Y53.965 E.02415
G1 X152.17 Y34.285 E1.03824
G1 X151.523 Y34.285 E.02415
G1 X171.203 Y53.965 E1.03824
G1 X170.556 Y53.965 E.02415
G1 X150.875 Y34.285 E1.03824
G1 X150.228 Y34.285 E.02415
G1 X169.909 Y53.965 E1.03824
G1 X169.261 Y53.965 E.02415
G1 X149.581 Y34.285 E1.03824
G1 X148.933 Y34.285 E.02415
G1 X168.614 Y53.965 E1.03824
G1 X167.966 Y53.965 E.02415
G1 X148.286 Y34.285 E1.03824
G1 X147.638 Y34.285 E.02415
G1 X167.319 Y53.965 E1.03824
G1 X166.672 Y53.965 E.02415
G1 X146.991 Y34.285 E1.03824
G1 X146.344 Y34.285 E.02415
G1 X166.024 Y53.965 E1.03824
G1 X165.377 Y53.965 E.02415
G1 X145.696 Y34.285 E1.03824
G1 X145.049 Y34.285 E.02415
G1 X164.729 Y53.965 E1.03824
G1 X164.082 Y53.965 E.02415
G1 X144.401 Y34.285 E1.03824
G1 X143.754 Y34.285 E.02415
G1 X163.435 Y53.965 E1.03824
G1 X162.787 Y53.965 E.02415
G1 X143.107 Y34.285 E1.03824
G1 X142.459 Y34.285 E.02415
G1 X162.14 Y53.965 E1.03824
G1 X161.492 Y53.965 E.02415
G1 X141.812 Y34.285 E1.03824
G1 X141.164 Y34.285 E.02415
G1 X160.845 Y53.965 E1.03824
G1 X160.198 Y53.965 E.02415
G1 X140.517 Y34.285 E1.03824
M73 P19 R52
G1 X139.87 Y34.285 E.02415
G1 X159.55 Y53.965 E1.03824
G1 X158.903 Y53.965 E.02415
G1 X139.222 Y34.285 E1.03824
G1 X138.575 Y34.285 E.02415
G1 X158.255 Y53.965 E1.03824
G1 X157.608 Y53.965 E.02415
G1 X137.927 Y34.285 E1.03824
G1 X137.28 Y34.285 E.02415
G1 X156.961 Y53.965 E1.03824
G1 X156.313 Y53.965 E.02415
G1 X136.633 Y34.285 E1.03824
G1 X135.985 Y34.285 E.02415
G1 X155.666 Y53.965 E1.03824
G1 X155.018 Y53.965 E.02415
G1 X135.338 Y34.285 E1.03824
G1 X134.69 Y34.285 E.02415
G1 X154.371 Y53.965 E1.03824
G1 X153.724 Y53.965 E.02415
G1 X134.043 Y34.285 E1.03824
G1 X133.396 Y34.285 E.02415
G1 X153.076 Y53.965 E1.03824
G1 X152.429 Y53.965 E.02415
G1 X132.748 Y34.285 E1.03824
G1 X132.101 Y34.285 E.02415
G1 X151.781 Y53.965 E1.03824
G1 X151.134 Y53.965 E.02415
G1 X131.453 Y34.285 E1.03824
G1 X130.806 Y34.285 E.02415
G1 X150.487 Y53.965 E1.03824
G1 X149.839 Y53.965 E.02415
G1 X130.159 Y34.285 E1.03824
G1 X129.511 Y34.285 E.02415
G1 X149.192 Y53.965 E1.03824
G1 X148.544 Y53.965 E.02415
G1 X128.864 Y34.285 E1.03824
G1 X128.216 Y34.285 E.02415
G1 X147.897 Y53.965 E1.03824
G1 X147.25 Y53.965 E.02415
G1 X127.569 Y34.285 E1.03824
G1 X126.922 Y34.285 E.02415
G1 X146.602 Y53.965 E1.03824
G1 X145.955 Y53.965 E.02415
G1 X126.274 Y34.285 E1.03824
G1 X125.627 Y34.285 E.02415
G1 X145.307 Y53.965 E1.03824
G1 X144.66 Y53.965 E.02415
G1 X124.979 Y34.285 E1.03824
G1 X124.332 Y34.285 E.02415
G1 X144.013 Y53.965 E1.03824
G1 X143.365 Y53.965 E.02415
G1 X123.685 Y34.285 E1.03824
G1 X123.037 Y34.285 E.02415
G1 X129.06 Y40.308 E.31774
G2 X128.278 Y40.173 I-1.298 J5.206 E.02962
G1 X122.39 Y34.285 E.31065
G1 X121.742 Y34.285 E.02415
G1 X127.641 Y40.183 E.31118
G2 X127.082 Y40.272 I.534 J5.166 E.02111
G1 X121.095 Y34.285 E.31586
G1 X120.448 Y34.285 E.02415
M73 P20 R52
G1 X126.59 Y40.427 E.32404
G2 X126.145 Y40.629 I.785 J2.324 E.01827
G1 X119.8 Y34.285 E.33469
G1 X119.153 Y34.285 E.02415
G1 X125.741 Y40.873 E.34756
G2 X125.376 Y41.156 I5.319 J7.231 E.01721
G1 X118.505 Y34.285 E.36248
G1 X117.858 Y34.285 E.02415
G1 X125.053 Y41.48 E.37959
G2 X124.767 Y41.841 I1.663 J1.611 E.01722
G1 X117.211 Y34.285 E.39865
G1 X116.563 Y34.285 E.02415
G1 X124.52 Y42.241 E.41974
G2 X124.313 Y42.682 I2.095 J1.248 E.0182
G1 X115.916 Y34.285 E.44301
G1 X115.268 Y34.285 E.02415
G1 X124.155 Y43.172 E.46882
G2 X124.063 Y43.726 I2.726 J.74 E.02102
G1 X114.621 Y34.285 E.49809
G1 X113.974 Y34.285 E.02415
G1 X124.046 Y44.357 E.53137
G2 X124.167 Y45.126 I5.158 J-.42 E.02905
G1 X113.121 Y34.079 E.58277
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
G1 X142.718 Y53.965 E.59251
G1 X142.07 Y53.965 E.02415
G1 X131.948 Y43.843 E.53399
G3 X131.944 Y44.487 I-3.212 J.302 E.02404
G1 X141.423 Y53.965 E.50004
G1 X140.776 Y53.965 E.02415
G1 X131.851 Y45.04 E.47083
G3 X131.698 Y45.535 I-2.548 J-.514 E.01935
G1 X140.128 Y53.965 E.44472
G1 X139.481 Y53.965 E.02415
G1 X131.498 Y45.982 E.42113
G3 X131.253 Y46.385 I-6.339 J-3.585 E.01758
G1 X138.833 Y53.965 E.39991
G1 X138.186 Y53.965 E.02415
G1 X130.967 Y46.746 E.38085
G3 X130.644 Y47.07 I-1.782 J-1.453 E.01711
G1 X137.539 Y53.965 E.36375
G1 X136.891 Y53.965 E.02415
G1 X130.283 Y47.357 E.34859
G3 X129.885 Y47.606 I-1.441 J-1.863 E.01756
G1 X136.244 Y53.965 E.33546
G1 X135.596 Y53.965 E.02415
G1 X129.445 Y47.814 E.32449
G3 X128.951 Y47.967 I-1.011 J-2.392 E.01934
G1 X134.949 Y53.965 E.31642
G1 X134.302 Y53.965 E.02415
G1 X128.4 Y48.063 E.31136
G3 X127.765 Y48.076 I-.401 J-4.199 E.02371
G1 X133.654 Y53.965 E.31069
G1 X133.007 Y53.965 E.02415
G1 X126.678 Y47.637 E.33387
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
G1 X112.679 Y34.285 E1.04909
G1 X112.031 Y34.285 E.02415
G1 X131.712 Y53.965 E1.03824
G1 X131.065 Y53.965 E.02415
G1 X111.384 Y34.285 E1.03824
G1 X110.737 Y34.285 E.02415
G1 X130.417 Y53.965 E1.03824
G1 X129.77 Y53.965 E.02415
G1 X110.089 Y34.285 E1.03824
G1 X109.442 Y34.285 E.02415
G1 X129.122 Y53.965 E1.03824
G1 X128.475 Y53.965 E.02415
G1 X108.794 Y34.285 E1.03824
G1 X108.147 Y34.285 E.02415
G1 X127.828 Y53.965 E1.03824
G1 X127.18 Y53.965 E.02415
G1 X107.5 Y34.285 E1.03824
G1 X106.852 Y34.285 E.02415
G1 X126.533 Y53.965 E1.03824
G1 X125.885 Y53.965 E.02415
G1 X106.205 Y34.285 E1.03824
G1 X105.557 Y34.285 E.02415
G1 X125.238 Y53.965 E1.03824
G1 X124.591 Y53.965 E.02415
G1 X104.91 Y34.285 E1.03824
G1 X104.263 Y34.285 E.02415
G1 X123.943 Y53.965 E1.03824
G1 X123.296 Y53.965 E.02415
G1 X103.615 Y34.285 E1.03824
G1 X102.968 Y34.285 E.02415
G1 X122.648 Y53.965 E1.03824
G1 X122.001 Y53.965 E.02415
G1 X102.32 Y34.285 E1.03824
G1 X101.673 Y34.285 E.02415
G1 X121.354 Y53.965 E1.03824
G1 X120.706 Y53.965 E.02415
G1 X101.026 Y34.285 E1.03824
G1 X100.378 Y34.285 E.02415
G1 X120.059 Y53.965 E1.03824
G1 X119.411 Y53.965 E.02415
G1 X99.731 Y34.285 E1.03824
G1 X99.083 Y34.285 E.02415
G1 X118.764 Y53.965 E1.03824
G1 X118.117 Y53.965 E.02415
G1 X98.436 Y34.285 E1.03824
G1 X97.789 Y34.285 E.02415
G1 X117.469 Y53.965 E1.03824
G1 X116.822 Y53.965 E.02415
G1 X97.141 Y34.285 E1.03824
G1 X96.494 Y34.285 E.02415
G1 X116.174 Y53.965 E1.03824
G1 X115.527 Y53.965 E.02415
G1 X95.846 Y34.285 E1.03824
G1 X95.199 Y34.285 E.02415
G1 X114.88 Y53.965 E1.03824
G1 X114.232 Y53.965 E.02415
G1 X94.552 Y34.285 E1.03824
G1 X93.904 Y34.285 E.02415
G1 X113.585 Y53.965 E1.03824
G1 X112.937 Y53.965 E.02415
G1 X93.257 Y34.285 E1.03824
G1 X92.609 Y34.285 E.02415
G1 X112.29 Y53.965 E1.03824
G1 X111.643 Y53.965 E.02415
G1 X91.962 Y34.285 E1.03824
G1 X91.315 Y34.285 E.02415
G1 X110.995 Y53.965 E1.03824
G1 X110.348 Y53.965 E.02415
G1 X90.667 Y34.285 E1.03824
G1 X90.02 Y34.285 E.02415
G1 X109.7 Y53.965 E1.03824
G1 X109.053 Y53.965 E.02415
G1 X89.372 Y34.285 E1.03824
G1 X88.725 Y34.285 E.02415
G1 X108.406 Y53.965 E1.03824
G1 X107.758 Y53.965 E.02415
G1 X88.078 Y34.285 E1.03824
G1 X87.43 Y34.285 E.02415
G1 X107.111 Y53.965 E1.03824
G1 X106.463 Y53.965 E.02415
G1 X86.783 Y34.285 E1.03824
G1 X86.135 Y34.285 E.02415
G1 X105.816 Y53.965 E1.03824
G1 X105.169 Y53.965 E.02415
G1 X85.488 Y34.285 E1.03824
G1 X84.841 Y34.285 E.02415
G1 X104.521 Y53.965 E1.03824
G1 X103.874 Y53.965 E.02415
G1 X84.193 Y34.285 E1.03824
G1 X83.546 Y34.285 E.02415
G1 X103.226 Y53.965 E1.03824
G1 X102.579 Y53.965 E.02415
G1 X82.898 Y34.285 E1.03824
G1 X82.251 Y34.285 E.02415
G1 X101.932 Y53.965 E1.03824
G1 X101.284 Y53.965 E.02415
G1 X81.604 Y34.285 E1.03824
G1 X80.956 Y34.285 E.02415
G1 X100.637 Y53.965 E1.03824
G1 X99.989 Y53.965 E.02415
G1 X80.309 Y34.285 E1.03824
G1 X79.661 Y34.285 E.02415
G1 X99.342 Y53.965 E1.03824
G1 X98.695 Y53.965 E.02415
G1 X79.014 Y34.285 E1.03824
G1 X78.367 Y34.285 E.02415
G1 X98.047 Y53.965 E1.03824
G1 X97.4 Y53.965 E.02415
G1 X77.719 Y34.285 E1.03824
G1 X77.072 Y34.285 E.02415
G1 X96.752 Y53.965 E1.03824
G1 X96.105 Y53.965 E.02415
G1 X76.424 Y34.285 E1.03824
G1 X75.777 Y34.285 E.02415
G1 X95.458 Y53.965 E1.03824
G1 X94.81 Y53.965 E.02415
G1 X75.13 Y34.285 E1.03824
G1 X74.482 Y34.285 E.02415
G1 X94.163 Y53.965 E1.03824
G1 X93.515 Y53.965 E.02415
G1 X73.835 Y34.285 E1.03824
G1 X73.188 Y34.285 E.02415
G1 X92.868 Y53.965 E1.03824
G1 X92.221 Y53.965 E.02415
G1 X72.54 Y34.285 E1.03824
G1 X71.893 Y34.285 E.02415
G1 X91.573 Y53.965 E1.03824
G1 X90.926 Y53.965 E.02415
G1 X71.245 Y34.285 E1.03824
G1 X70.598 Y34.285 E.02415
G1 X90.278 Y53.965 E1.03824
G1 X89.631 Y53.965 E.02415
G1 X69.951 Y34.285 E1.03824
M73 P21 R52
G1 X69.303 Y34.285 E.02415
G1 X88.984 Y53.965 E1.03824
G1 X88.336 Y53.965 E.02415
G1 X68.656 Y34.285 E1.03824
G1 X68.008 Y34.285 E.02415
G1 X87.689 Y53.965 E1.03824
G1 X87.041 Y53.965 E.02415
G1 X67.361 Y34.285 E1.03824
G1 X66.714 Y34.285 E.02415
G1 X86.394 Y53.965 E1.03824
G1 X85.747 Y53.965 E.02415
G1 X66.066 Y34.285 E1.03824
G1 X65.419 Y34.285 E.02415
G1 X85.099 Y53.965 E1.03824
G1 X84.452 Y53.965 E.02415
G1 X64.771 Y34.285 E1.03824
G1 X64.124 Y34.285 E.02415
G1 X83.804 Y53.965 E1.03824
G1 X83.157 Y53.965 E.02415
G1 X63.477 Y34.285 E1.03824
G1 X62.829 Y34.285 E.02415
G1 X82.51 Y53.965 E1.03824
G1 X81.862 Y53.965 E.02415
G1 X62.182 Y34.285 E1.03824
G1 X61.534 Y34.285 E.02415
M73 P21 R51
G1 X81.215 Y53.965 E1.03824
G1 X80.567 Y53.965 E.02415
G1 X60.887 Y34.285 E1.03824
G1 X60.24 Y34.285 E.02415
G1 X79.92 Y53.965 E1.03824
G1 X79.273 Y53.965 E.02415
G1 X59.592 Y34.285 E1.03824
G1 X58.945 Y34.285 E.02415
G1 X78.625 Y53.965 E1.03824
G1 X77.978 Y53.965 E.02415
G1 X58.297 Y34.285 E1.03824
G1 X57.65 Y34.285 E.02415
G1 X77.331 Y53.965 E1.03824
G1 X76.683 Y53.965 E.02415
G1 X57.003 Y34.285 E1.03824
G1 X56.355 Y34.285 E.02415
G1 X76.036 Y53.965 E1.03824
G1 X75.388 Y53.965 E.02415
G1 X55.708 Y34.285 E1.03824
G1 X55.06 Y34.285 E.02415
G1 X74.741 Y53.965 E1.03824
G1 X74.094 Y53.965 E.02415
G1 X54.413 Y34.285 E1.03824
G1 X53.766 Y34.285 E.02415
G1 X73.446 Y53.965 E1.03824
G1 X72.799 Y53.965 E.02415
G1 X53.118 Y34.285 E1.03824
G1 X52.471 Y34.285 E.02415
G1 X72.151 Y53.965 E1.03824
G1 X71.504 Y53.965 E.02415
G1 X51.823 Y34.285 E1.03824
G1 X51.176 Y34.285 E.02415
G1 X70.857 Y53.965 E1.03824
G1 X70.209 Y53.965 E.02415
G1 X50.529 Y34.285 E1.03824
G1 X49.881 Y34.285 E.02415
G1 X69.562 Y53.965 E1.03824
G1 X68.914 Y53.965 E.02415
G1 X49.234 Y34.285 E1.03824
G1 X48.586 Y34.285 E.02415
G1 X68.267 Y53.965 E1.03824
G1 X67.62 Y53.965 E.02415
G1 X47.939 Y34.285 E1.03824
G1 X47.292 Y34.285 E.02415
G1 X66.972 Y53.965 E1.03824
G1 X66.325 Y53.965 E.02415
G1 X46.644 Y34.285 E1.03824
G1 X45.997 Y34.285 E.02415
G1 X65.677 Y53.965 E1.03824
G1 X65.03 Y53.965 E.02415
G1 X45.349 Y34.285 E1.03824
G1 X44.702 Y34.285 E.02415
G1 X64.383 Y53.965 E1.03824
G1 X63.735 Y53.965 E.02415
G1 X44.055 Y34.285 E1.03824
G1 X43.407 Y34.285 E.02415
G1 X63.088 Y53.965 E1.03824
G1 X62.44 Y53.965 E.02415
G1 X42.76 Y34.285 E1.03824
G1 X42.112 Y34.285 E.02415
G1 X61.793 Y53.965 E1.03824
G1 X61.146 Y53.965 E.02415
G1 X41.465 Y34.285 E1.03824
G1 X40.818 Y34.285 E.02415
G1 X60.498 Y53.965 E1.03824
G1 X59.851 Y53.965 E.02415
G1 X40.17 Y34.285 E1.03824
G1 X39.523 Y34.285 E.02415
G1 X59.203 Y53.965 E1.03824
G1 X58.556 Y53.965 E.02415
G1 X38.875 Y34.285 E1.03824
G1 X38.228 Y34.285 E.02415
G1 X57.909 Y53.965 E1.03824
G1 X57.261 Y53.965 E.02415
G1 X37.581 Y34.285 E1.03824
G1 X36.933 Y34.285 E.02415
G1 X56.614 Y53.965 E1.03824
G1 X55.966 Y53.965 E.02415
G1 X36.286 Y34.285 E1.03824
G1 X35.638 Y34.285 E.02415
G1 X55.319 Y53.965 E1.03824
G1 X54.672 Y53.965 E.02415
G1 X43.828 Y43.122 E.57203
G3 X43.951 Y43.892 I-3.858 J1.008 E.02912
G1 X54.024 Y53.965 E.53142
G1 X53.377 Y53.965 E.02415
G1 X43.941 Y44.53 E.49777
G3 X43.841 Y45.077 I-2.79 J-.226 E.0208
G1 X52.729 Y53.965 E.46889
G1 X52.082 Y53.965 E.02415
G1 X43.686 Y45.569 E.44294
G3 X43.483 Y46.014 I-2.324 J-.792 E.01826
G1 X51.435 Y53.965 E.41949
G1 X50.787 Y53.965 E.02415
G1 X43.233 Y46.411 E.39852
G3 X42.944 Y46.77 I-1.937 J-1.262 E.01721
G1 X50.14 Y53.965 E.37959
G1 X49.84 Y53.965 E.01117
G1 X49.84 Y54.313 E.01298
G1 X42.619 Y47.092 E.38096
G3 X42.256 Y47.377 I-1.606 J-1.67 E.01723
G1 X49.84 Y54.961 E.40008
G1 X49.84 Y55.608 E.02415
G1 X41.856 Y47.623 E.42123
G3 X41.411 Y47.826 I-2.865 J-5.701 E.01824
G1 X49.84 Y56.255 E.4447
G1 X49.84 Y56.903 E.02415
G1 X40.913 Y47.976 E.47094
G3 X40.359 Y48.068 I-.741 J-2.729 E.02102
G1 X49.84 Y57.55 E.50021
G1 X49.84 Y58.198 E.02415
G1 X39.715 Y48.072 E.53416
G3 X38.931 Y47.935 I.286 J-3.952 E.02975
G1 X50.046 Y59.051 E.58639
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
G1 X34.991 Y34.285 E.33364
G1 X34.344 Y34.285 E.02415
G1 X40.231 Y40.172 E.31059
G2 X39.598 Y40.187 I-.244 J3.164 E.02365
G1 X33.696 Y34.285 E.31135
G1 X33.049 Y34.285 E.02415
G1 X39.046 Y40.282 E.3164
G2 X38.557 Y40.44 I.542 J2.519 E.01922
G1 X32.401 Y34.285 E.32473
G1 X31.754 Y34.285 E.02415
G1 X38.114 Y40.645 E.33552
G2 X37.713 Y40.891 I1.029 J2.125 E.01759
G1 X31.107 Y34.285 E.34851
G1 X30.459 Y34.285 E.02415
G1 X37.353 Y41.179 E.36368
G2 X37.032 Y41.505 I1.473 J1.768 E.01711
G1 X30.16 Y34.633 E.36256
G1 X30.16 Y35.28 E.02415
G1 X36.748 Y41.869 E.34759
G2 X36.503 Y42.271 I1.888 J1.427 E.0176
G1 X30.16 Y35.927 E.33466
G1 X30.16 Y36.575 E.02415
G1 X36.3 Y42.715 E.32392
G2 X36.147 Y43.21 I5.141 J1.852 E.01933
G1 X30.16 Y37.222 E.31588
G1 X30.16 Y37.87 E.02415
M73 P22 R51
G1 X36.058 Y43.768 E.31119
G2 X36.051 Y44.408 I4.255 J.369 E.0239
G1 X30.16 Y38.517 E.3108
G1 X30.16 Y39.164 E.02415
G1 X36.518 Y45.522 E.3354
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
G1 X49.84 Y59.492 E1.04909
G1 X49.84 Y60.14 E.02415
G1 X30.16 Y40.459 E1.03824
G1 X30.16 Y41.107 E.02415
G1 X49.84 Y60.787 E1.03824
G1 X49.84 Y61.435 E.02415
G1 X30.16 Y41.754 E1.03824
G1 X30.16 Y42.401 E.02415
G1 X49.84 Y62.082 E1.03824
G1 X49.84 Y62.729 E.02415
G1 X30.16 Y43.049 E1.03824
G1 X30.16 Y43.696 E.02415
G1 X49.84 Y63.377 E1.03824
G1 X49.84 Y64.024 E.02415
G1 X30.16 Y44.344 E1.03824
G1 X30.16 Y44.991 E.02415
G1 X49.84 Y64.672 E1.03824
G1 X49.84 Y65.319 E.02415
G1 X30.16 Y45.638 E1.03824
G1 X30.16 Y46.286 E.02415
G1 X49.84 Y65.966 E1.03824
G1 X49.84 Y66.614 E.02415
G1 X30.16 Y46.933 E1.03824
G1 X30.16 Y47.581 E.02415
G1 X49.84 Y67.261 E1.03824
G1 X49.84 Y67.909 E.02415
G1 X30.16 Y48.228 E1.03824
G1 X30.16 Y48.875 E.02415
G1 X49.84 Y68.556 E1.03824
G1 X49.84 Y69.203 E.02415
G1 X30.16 Y49.523 E1.03824
G1 X30.16 Y50.17 E.02415
G1 X49.84 Y69.851 E1.03824
G1 X49.84 Y70.498 E.02415
G1 X30.16 Y50.818 E1.03824
G1 X30.16 Y51.465 E.02415
G1 X49.84 Y71.146 E1.03824
G1 X49.84 Y71.793 E.02415
G1 X30.16 Y52.112 E1.03824
G1 X30.16 Y52.76 E.02415
G1 X49.84 Y72.44 E1.03824
G1 X49.84 Y73.088 E.02415
G1 X30.16 Y53.407 E1.03824
G1 X30.16 Y54.055 E.02415
G1 X49.84 Y73.735 E1.03824
G1 X49.84 Y74.383 E.02415
G1 X30.16 Y54.702 E1.03824
G1 X30.16 Y55.349 E.02415
G1 X49.84 Y75.03 E1.03824
G1 X49.84 Y75.677 E.02415
G1 X30.16 Y55.997 E1.03824
G1 X30.16 Y56.644 E.02415
G1 X49.84 Y76.325 E1.03824
G1 X49.84 Y76.972 E.02415
G1 X30.16 Y57.292 E1.03824
G1 X30.16 Y57.939 E.02415
G1 X49.84 Y77.62 E1.03824
G1 X49.84 Y78.267 E.02415
G1 X30.16 Y58.586 E1.03824
G1 X30.16 Y59.234 E.02415
G1 X49.84 Y78.914 E1.03824
G1 X49.84 Y79.562 E.02415
G1 X30.16 Y59.881 E1.03824
G1 X30.16 Y60.529 E.02415
G1 X49.84 Y80.209 E1.03824
G1 X49.84 Y80.857 E.02415
G1 X30.16 Y61.176 E1.03824
G1 X30.16 Y61.823 E.02415
G1 X49.84 Y81.504 E1.03824
G1 X49.84 Y82.151 E.02415
G1 X30.16 Y62.471 E1.03824
G1 X30.16 Y63.118 E.02415
G1 X49.84 Y82.799 E1.03824
G1 X49.84 Y83.446 E.02415
G1 X30.16 Y63.766 E1.03824
G1 X30.16 Y64.413 E.02415
G1 X49.84 Y84.094 E1.03824
G1 X49.84 Y84.741 E.02415
G1 X30.16 Y65.06 E1.03824
G1 X30.16 Y65.708 E.02415
G1 X49.84 Y85.388 E1.03824
G1 X49.84 Y86.036 E.02415
G1 X30.16 Y66.355 E1.03824
G1 X30.16 Y67.003 E.02415
G1 X49.84 Y86.683 E1.03824
G1 X49.84 Y87.331 E.02415
G1 X30.16 Y67.65 E1.03824
G1 X30.16 Y68.297 E.02415
G1 X49.84 Y87.978 E1.03824
G1 X49.84 Y88.625 E.02415
G1 X30.16 Y68.945 E1.03824
G1 X30.16 Y69.592 E.02415
G1 X49.84 Y89.273 E1.03824
G1 X49.84 Y89.92 E.02415
G1 X30.16 Y70.24 E1.03824
G1 X30.16 Y70.887 E.02415
G1 X49.84 Y90.568 E1.03824
G1 X49.84 Y91.215 E.02415
G1 X30.16 Y71.534 E1.03824
G1 X30.16 Y72.182 E.02415
G1 X49.84 Y91.862 E1.03824
G1 X49.84 Y92.51 E.02415
G1 X30.16 Y72.829 E1.03824
G1 X30.16 Y73.477 E.02415
G1 X49.84 Y93.157 E1.03824
G1 X49.84 Y93.805 E.02415
G1 X30.16 Y74.124 E1.03824
G1 X30.16 Y74.771 E.02415
G1 X49.84 Y94.452 E1.03824
G1 X49.84 Y95.099 E.02415
G1 X30.16 Y75.419 E1.03824
G1 X30.16 Y76.066 E.02415
G1 X49.84 Y95.747 E1.03824
G1 X49.84 Y96.394 E.02415
G1 X30.16 Y76.714 E1.03824
G1 X30.16 Y77.361 E.02415
G1 X49.84 Y97.042 E1.03824
G1 X49.84 Y97.689 E.02415
G1 X30.16 Y78.008 E1.03824
G1 X30.16 Y78.656 E.02415
G1 X49.84 Y98.336 E1.03824
G1 X49.84 Y98.984 E.02415
G1 X30.16 Y79.303 E1.03824
G1 X30.16 Y79.951 E.02415
G1 X49.84 Y99.631 E1.03824
G1 X49.84 Y100.279 E.02415
G1 X30.16 Y80.598 E1.03824
G1 X30.16 Y81.245 E.02415
G1 X49.84 Y100.926 E1.03824
M73 P22 R50
G1 X49.84 Y101.573 E.02415
G1 X30.16 Y81.893 E1.03824
G1 X30.16 Y82.54 E.02415
G1 X49.84 Y102.221 E1.03824
G1 X49.84 Y102.868 E.02415
G1 X30.16 Y83.188 E1.03824
G1 X30.16 Y83.835 E.02415
G1 X49.84 Y103.515 E1.03824
G1 X49.84 Y104.163 E.02415
G1 X30.16 Y84.482 E1.03824
G1 X30.16 Y85.13 E.02415
G1 X49.84 Y104.81 E1.03824
G1 X49.84 Y105.458 E.02415
G1 X30.16 Y85.777 E1.03824
G1 X30.16 Y86.425 E.02415
G1 X49.84 Y106.105 E1.03824
G1 X49.84 Y106.752 E.02415
G1 X30.16 Y87.072 E1.03824
G1 X30.16 Y87.719 E.02415
G1 X49.84 Y107.4 E1.03824
G1 X49.84 Y108.047 E.02415
G1 X30.16 Y88.367 E1.03824
G1 X30.16 Y89.014 E.02415
G1 X49.84 Y108.695 E1.03824
G1 X49.84 Y109.342 E.02415
G1 X30.16 Y89.662 E1.03824
G1 X30.16 Y90.309 E.02415
G1 X49.84 Y109.989 E1.03824
G1 X49.84 Y110.637 E.02415
G1 X30.16 Y90.956 E1.03824
G1 X30.16 Y91.604 E.02415
G1 X49.84 Y111.284 E1.03824
G1 X49.84 Y111.932 E.02415
G1 X30.16 Y92.251 E1.03824
G1 X30.16 Y92.899 E.02415
G1 X49.84 Y112.579 E1.03824
G1 X49.84 Y113.226 E.02415
G1 X30.16 Y93.546 E1.03824
G1 X30.16 Y94.193 E.02415
G1 X49.84 Y113.874 E1.03824
G1 X49.84 Y114.521 E.02415
G1 X30.16 Y94.841 E1.03824
G1 X30.16 Y95.488 E.02415
G1 X49.84 Y115.169 E1.03824
G1 X49.84 Y115.816 E.02415
G1 X30.16 Y96.136 E1.03824
G1 X30.16 Y96.783 E.02415
G1 X49.84 Y116.463 E1.03824
G1 X49.84 Y117.111 E.02415
G1 X30.16 Y97.43 E1.03824
G1 X30.16 Y98.078 E.02415
G1 X49.84 Y117.758 E1.03824
G1 X49.84 Y118.406 E.02415
G1 X30.16 Y98.725 E1.03824
G1 X30.16 Y99.373 E.02415
G1 X49.84 Y119.053 E1.03824
M73 P23 R50
G1 X49.84 Y119.7 E.02415
G1 X30.16 Y100.02 E1.03824
G1 X30.16 Y100.667 E.02415
G1 X49.84 Y120.348 E1.03824
G1 X49.84 Y120.995 E.02415
G1 X30.16 Y101.315 E1.03824
G1 X30.16 Y101.962 E.02415
G1 X49.84 Y121.643 E1.03824
G1 X49.84 Y122.29 E.02415
G1 X30.16 Y102.609 E1.03824
G1 X30.16 Y103.257 E.02415
G1 X49.84 Y122.937 E1.03824
G1 X49.84 Y123.585 E.02415
G1 X30.16 Y103.904 E1.03824
G1 X30.16 Y104.552 E.02415
G1 X49.84 Y124.232 E1.03824
G1 X49.84 Y124.88 E.02415
G1 X30.16 Y105.199 E1.03824
G1 X30.16 Y105.846 E.02415
G1 X49.84 Y125.527 E1.03824
G1 X49.84 Y126.174 E.02415
G1 X30.16 Y106.494 E1.03824
G1 X30.16 Y107.141 E.02415
G1 X49.84 Y126.822 E1.03824
G1 X49.84 Y127.469 E.02415
G1 X30.16 Y107.789 E1.03824
G1 X30.16 Y108.436 E.02415
G1 X49.84 Y128.117 E1.03824
G1 X49.84 Y128.764 E.02415
G1 X30.16 Y109.083 E1.03824
G1 X30.16 Y109.731 E.02415
G1 X49.84 Y129.411 E1.03824
G1 X49.84 Y130.059 E.02415
G1 X30.16 Y110.378 E1.03824
G1 X30.16 Y111.026 E.02415
G1 X41.444 Y122.31 E.59532
G3 X43.684 Y124.55 I-1.437 J3.676 E.12155
G1 X49.84 Y130.706 E.3248
G1 X49.84 Y131.354 E.02415
G1 X43.916 Y125.43 E.31252
G3 X43.957 Y126.117 I-4.04 J.582 E.02573
G1 X49.84 Y132.001 E.31039
G1 X49.84 Y132.648 E.02415
G1 X43.896 Y126.704 E.31359
G3 X43.767 Y127.222 I-5.074 J-.993 E.01992
G1 X49.84 Y133.296 E.32041
G1 X49.84 Y133.943 E.02415
G1 X43.581 Y127.684 E.33019
G3 X43.353 Y128.103 I-2.207 J-.933 E.01783
G1 X49.84 Y134.591 E.34225
G1 X49.84 Y135.238 E.02415
G1 X43.084 Y128.482 E.3564
G3 X42.779 Y128.824 I-1.858 J-1.356 E.01713
G1 X49.84 Y135.885 E.37254
G1 X49.84 Y136.533 E.02415
G1 X42.433 Y129.125 E.39079
G3 X42.048 Y129.388 I-1.501 J-1.789 E.01741
G1 X49.84 Y137.18 E.4111
G1 X49.84 Y137.828 E.02415
G1 X41.622 Y129.61 E.43354
G3 X41.153 Y129.788 I-1.121 J-2.25 E.01876
G1 X49.84 Y138.475 E.45831
G1 X49.84 Y139.122 E.02415
G1 X40.628 Y129.91 E.48601
G3 X40.028 Y129.958 I-.541 J-2.97 E.02246
G1 X49.84 Y139.77 E.51762
G1 X49.84 Y140.417 E.02415
G1 X39.055 Y129.631 E.569
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
G1 X30.16 Y111.673 E.56276
G1 X30.16 Y112.32 E.02415
G1 X39.88 Y122.04 E.51277
G2 X39.297 Y122.106 I.046 J3.044 E.02189
G1 X30.16 Y112.968 E.48206
G1 X30.16 Y113.615 E.02415
G1 X38.777 Y122.233 E.45462
G2 X38.314 Y122.417 I1.994 J5.69 E.0186
G1 X30.16 Y114.263 E.43018
G1 X30.16 Y114.91 E.02415
G1 X37.897 Y122.647 E.40817
G2 X37.519 Y122.917 I1.159 J2.024 E.01734
G1 X30.16 Y115.557 E.38824
G1 X30.16 Y116.205 E.02415
G1 X37.179 Y123.224 E.37028
G2 X36.875 Y123.568 I1.567 J1.69 E.01714
G1 X30.16 Y116.852 E.35426
G1 X30.16 Y117.5 E.02415
G1 X36.61 Y123.95 E.34029
G2 X36.389 Y124.377 I2.019 J1.314 E.01795
G1 X30.16 Y118.147 E.32865
G1 X30.16 Y118.794 E.02415
G1 X36.214 Y124.848 E.31938
G2 X36.089 Y125.372 I2.554 J.883 E.02009
G1 X30.16 Y119.442 E.31282
G1 X30.16 Y120.089 E.02415
G1 X36.043 Y125.972 E.31035
G2 X36.099 Y126.676 I4.228 J.014 E.02638
G1 X30.16 Y120.737 E.31333
G1 X30.16 Y121.384 E.02415
G1 X36.383 Y127.607 E.32829
G2 X38.398 Y129.623 I3.643 J-1.628 E.10874
G1 X49.84 Y141.065 E.60361
G1 X49.84 Y141.712 E.02415
G1 X30.16 Y122.031 E1.03824
G1 X30.16 Y122.679 E.02415
G1 X49.84 Y142.359 E1.03824
G1 X49.84 Y143.007 E.02415
G1 X30.16 Y123.326 E1.03824
G1 X30.16 Y123.974 E.02415
G1 X49.84 Y143.654 E1.03824
G1 X49.84 Y144.302 E.02415
G1 X30.16 Y124.621 E1.03824
G1 X30.16 Y125.268 E.02415
G1 X49.84 Y144.949 E1.03824
G1 X49.84 Y145.596 E.02415
G1 X30.16 Y125.916 E1.03824
G1 X30.16 Y126.563 E.02415
G1 X49.84 Y146.244 E1.03824
G1 X49.84 Y146.891 E.02415
G1 X30.16 Y127.211 E1.03824
G1 X30.16 Y127.858 E.02415
G1 X49.84 Y147.539 E1.03824
G1 X49.84 Y148.186 E.02415
G1 X30.16 Y128.505 E1.03824
G1 X30.16 Y129.153 E.02415
G1 X49.84 Y148.833 E1.03824
G1 X49.84 Y149.481 E.02415
G1 X30.16 Y129.8 E1.03824
G1 X30.16 Y130.448 E.02415
G1 X49.84 Y150.128 E1.03824
G1 X49.84 Y150.776 E.02415
G1 X30.16 Y131.095 E1.03824
G1 X30.16 Y131.742 E.02415
G1 X49.84 Y151.423 E1.03824
G1 X49.84 Y152.07 E.02415
G1 X30.16 Y132.39 E1.03824
G1 X30.16 Y133.037 E.02415
G1 X49.84 Y152.718 E1.03824
G1 X49.84 Y153.365 E.02415
G1 X30.16 Y133.685 E1.03824
G1 X30.16 Y134.332 E.02415
G1 X49.84 Y154.013 E1.03824
G1 X49.84 Y154.66 E.02415
G1 X30.16 Y134.979 E1.03824
G1 X30.16 Y135.627 E.02415
G1 X49.84 Y155.307 E1.03824
G1 X49.84 Y155.955 E.02415
G1 X30.16 Y136.274 E1.03824
G1 X30.16 Y136.922 E.02415
G1 X49.84 Y156.602 E1.03824
G1 X49.84 Y157.25 E.02415
G1 X30.16 Y137.569 E1.03824
G1 X30.16 Y138.216 E.02415
G1 X49.84 Y157.897 E1.03824
G1 X49.84 Y158.544 E.02415
G1 X30.16 Y138.864 E1.03824
G1 X30.16 Y139.511 E.02415
G1 X49.84 Y159.192 E1.03824
G1 X49.84 Y159.839 E.02415
G1 X30.16 Y140.159 E1.03824
G1 X30.16 Y140.806 E.02415
G1 X49.84 Y160.487 E1.03824
G1 X49.84 Y161.134 E.02415
G1 X30.16 Y141.453 E1.03824
G1 X30.16 Y142.101 E.02415
G1 X49.84 Y161.781 E1.03824
G1 X49.84 Y162.429 E.02415
G1 X30.16 Y142.748 E1.03824
G1 X30.16 Y143.396 E.02415
G1 X49.84 Y163.076 E1.03824
G1 X49.84 Y163.724 E.02415
G1 X30.16 Y144.043 E1.03824
G1 X30.16 Y144.69 E.02415
G1 X49.84 Y164.371 E1.03824
G1 X49.84 Y165.018 E.02415
G1 X30.16 Y145.338 E1.03824
G1 X30.16 Y145.985 E.02415
G1 X49.84 Y165.666 E1.03824
G1 X49.84 Y166.313 E.02415
G1 X30.16 Y146.633 E1.03824
G1 X30.16 Y147.28 E.02415
G1 X49.84 Y166.961 E1.03824
G1 X49.84 Y167.608 E.02415
G1 X30.16 Y147.927 E1.03824
G1 X30.16 Y148.575 E.02415
G1 X49.84 Y168.255 E1.03824
G1 X49.84 Y168.903 E.02415
G1 X30.16 Y149.222 E1.03824
G1 X30.16 Y149.87 E.02415
G1 X49.84 Y169.55 E1.03824
G1 X49.84 Y170.198 E.02415
G1 X30.16 Y150.517 E1.03824
M73 P24 R50
G1 X30.16 Y151.164 E.02415
G1 X49.84 Y170.845 E1.03824
G1 X49.84 Y171.492 E.02415
G1 X30.16 Y151.812 E1.03824
G1 X30.16 Y152.459 E.02415
G1 X49.84 Y172.14 E1.03824
G1 X49.84 Y172.787 E.02415
G1 X30.16 Y153.107 E1.03824
G1 X30.16 Y153.754 E.02415
G1 X49.84 Y173.435 E1.03824
G1 X49.84 Y174.082 E.02415
G1 X30.16 Y154.401 E1.03824
G1 X30.16 Y155.049 E.02415
G1 X49.84 Y174.729 E1.03824
G1 X49.84 Y175.377 E.02415
G1 X30.16 Y155.696 E1.03824
G1 X30.16 Y156.344 E.02415
G1 X49.84 Y176.024 E1.03824
G1 X49.84 Y176.672 E.02415
G1 X30.16 Y156.991 E1.03824
G1 X30.16 Y157.638 E.02415
G1 X49.84 Y177.319 E1.03824
G1 X49.84 Y177.966 E.02415
G1 X30.16 Y158.286 E1.03824
G1 X30.16 Y158.933 E.02415
G1 X49.84 Y178.614 E1.03824
G1 X49.84 Y179.261 E.02415
G1 X30.16 Y159.581 E1.03824
G1 X30.16 Y160.228 E.02415
G1 X49.84 Y179.909 E1.03824
M73 P24 R49
G1 X49.84 Y180.556 E.02415
G1 X30.16 Y160.875 E1.03824
G1 X30.16 Y161.523 E.02415
G1 X49.84 Y181.203 E1.03824
G1 X49.84 Y181.851 E.02415
G1 X30.16 Y162.17 E1.03824
G1 X30.16 Y162.818 E.02415
G1 X49.84 Y182.498 E1.03824
G1 X49.84 Y183.146 E.02415
G1 X30.16 Y163.465 E1.03824
G1 X30.16 Y164.112 E.02415
G1 X49.84 Y183.793 E1.03824
G1 X49.84 Y184.44 E.02415
G1 X30.16 Y164.76 E1.03824
G1 X30.16 Y165.407 E.02415
G1 X49.84 Y185.088 E1.03824
G1 X49.84 Y185.735 E.02415
G1 X30.16 Y166.055 E1.03824
G1 X30.16 Y166.702 E.02415
G1 X49.84 Y186.383 E1.03824
G1 X49.84 Y187.03 E.02415
G1 X30.16 Y167.349 E1.03824
G1 X30.16 Y167.997 E.02415
G1 X49.84 Y187.677 E1.03824
G1 X49.84 Y188.325 E.02415
G1 X30.16 Y168.644 E1.03824
G1 X30.16 Y169.292 E.02415
G1 X49.84 Y188.972 E1.03824
G1 X49.84 Y189.62 E.02415
G1 X30.16 Y169.939 E1.03824
G1 X30.16 Y170.586 E.02415
G1 X49.84 Y190.267 E1.03824
G1 X49.84 Y190.914 E.02415
G1 X30.16 Y171.234 E1.03824
G1 X30.16 Y171.881 E.02415
G1 X49.84 Y191.562 E1.03824
G1 X49.84 Y192.209 E.02415
G1 X30.16 Y172.529 E1.03824
G1 X30.16 Y173.176 E.02415
G1 X49.84 Y192.857 E1.03824
G1 X49.84 Y193.504 E.02415
G1 X30.16 Y173.823 E1.03824
G1 X30.16 Y174.471 E.02415
G1 X49.84 Y194.151 E1.03824
G1 X49.84 Y194.799 E.02415
G1 X30.16 Y175.118 E1.03824
G1 X30.16 Y175.766 E.02415
G1 X49.84 Y195.446 E1.03824
G1 X49.84 Y196.094 E.02415
G1 X30.16 Y176.413 E1.03824
G1 X30.16 Y177.06 E.02415
G1 X50.046 Y196.947 E1.04909
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
G1 X225.84 Y74.938 E1.04909
G1 X225.84 Y75.585 E.02415
G1 X206.16 Y55.904 E1.03824
G1 X206.16 Y56.552 E.02415
G1 X225.84 Y76.232 E1.03824
G1 X225.84 Y76.88 E.02415
G1 X206.16 Y57.199 E1.03824
G1 X206.16 Y57.847 E.02415
G1 X225.84 Y77.527 E1.03824
G1 X225.84 Y78.175 E.02415
G1 X206.16 Y58.494 E1.03824
G1 X206.16 Y59.141 E.02415
G1 X225.84 Y78.822 E1.03824
G1 X225.84 Y79.469 E.02415
G1 X206.16 Y59.789 E1.03824
G1 X206.16 Y60.436 E.02415
G1 X225.84 Y80.117 E1.03824
G1 X225.84 Y80.764 E.02415
G1 X206.16 Y61.084 E1.03824
G1 X206.16 Y61.731 E.02415
G1 X225.84 Y81.412 E1.03824
G1 X225.84 Y82.059 E.02415
G1 X206.16 Y62.378 E1.03824
G1 X206.16 Y63.026 E.02415
G1 X225.84 Y82.706 E1.03824
G1 X225.84 Y83.354 E.02415
G1 X206.16 Y63.673 E1.03824
G1 X206.16 Y64.321 E.02415
G1 X225.84 Y84.001 E1.03824
G1 X225.84 Y84.649 E.02415
G1 X206.16 Y64.968 E1.03824
G1 X206.16 Y65.615 E.02415
G1 X225.84 Y85.296 E1.03824
G1 X225.84 Y85.943 E.02415
G1 X206.16 Y66.263 E1.03824
G1 X206.16 Y66.91 E.02415
G1 X225.84 Y86.591 E1.03824
G1 X225.84 Y87.238 E.02415
G1 X206.16 Y67.558 E1.03824
G1 X206.16 Y68.205 E.02415
G1 X225.84 Y87.885 E1.03824
G1 X225.84 Y88.533 E.02415
G1 X206.16 Y68.852 E1.03824
G1 X206.16 Y69.5 E.02415
G1 X225.84 Y89.18 E1.03824
G1 X225.84 Y89.828 E.02415
G1 X206.16 Y70.147 E1.03824
G1 X206.16 Y70.795 E.02415
G1 X225.84 Y90.475 E1.03824
G1 X225.84 Y91.122 E.02415
G1 X206.16 Y71.442 E1.03824
G1 X206.16 Y72.089 E.02415
G1 X225.84 Y91.77 E1.03824
G1 X225.84 Y92.417 E.02415
G1 X206.16 Y72.737 E1.03824
G1 X206.16 Y73.384 E.02415
G1 X225.84 Y93.065 E1.03824
G1 X225.84 Y93.712 E.02415
G1 X206.16 Y74.032 E1.03824
G1 X206.16 Y74.679 E.02415
G1 X225.84 Y94.359 E1.03824
G1 X225.84 Y95.007 E.02415
G1 X206.16 Y75.326 E1.03824
G1 X206.16 Y75.974 E.02415
G1 X225.84 Y95.654 E1.03824
G1 X225.84 Y96.302 E.02415
G1 X206.16 Y76.621 E1.03824
G1 X206.16 Y77.269 E.02415
G1 X225.84 Y96.949 E1.03824
G1 X225.84 Y97.596 E.02415
G1 X206.16 Y77.916 E1.03824
G1 X206.16 Y78.563 E.02415
G1 X225.84 Y98.244 E1.03824
G1 X225.84 Y98.891 E.02415
G1 X206.16 Y79.211 E1.03824
G1 X206.16 Y79.858 E.02415
G1 X225.84 Y99.539 E1.03824
G1 X225.84 Y100.186 E.02415
G1 X206.16 Y80.506 E1.03824
G1 X206.16 Y81.153 E.02415
G1 X225.84 Y100.833 E1.03824
M73 P25 R49
G1 X225.84 Y101.481 E.02415
G1 X206.16 Y81.8 E1.03824
G1 X206.16 Y82.448 E.02415
G1 X225.84 Y102.128 E1.03824
G1 X225.84 Y102.776 E.02415
G1 X206.16 Y83.095 E1.03824
G1 X206.16 Y83.743 E.02415
G1 X225.84 Y103.423 E1.03824
G1 X225.84 Y104.07 E.02415
G1 X206.16 Y84.39 E1.03824
G1 X206.16 Y85.037 E.02415
G1 X225.84 Y104.718 E1.03824
G1 X225.84 Y105.365 E.02415
G1 X206.16 Y85.685 E1.03824
G1 X206.16 Y86.332 E.02415
G1 X225.84 Y106.013 E1.03824
G1 X225.84 Y106.66 E.02415
G1 X206.16 Y86.979 E1.03824
G1 X206.16 Y87.627 E.02415
G1 X225.84 Y107.307 E1.03824
G1 X225.84 Y107.955 E.02415
G1 X206.16 Y88.274 E1.03824
G1 X206.16 Y88.922 E.02415
G1 X225.84 Y108.602 E1.03824
G1 X225.84 Y109.25 E.02415
G1 X206.16 Y89.569 E1.03824
G1 X206.16 Y90.216 E.02415
G1 X225.84 Y109.897 E1.03824
G1 X225.84 Y110.544 E.02415
G1 X206.16 Y90.864 E1.03824
G1 X206.16 Y91.511 E.02415
G1 X225.84 Y111.192 E1.03824
G1 X225.84 Y111.839 E.02415
G1 X206.16 Y92.159 E1.03824
G1 X206.16 Y92.806 E.02415
G1 X225.84 Y112.487 E1.03824
G1 X225.84 Y113.134 E.02415
G1 X206.16 Y93.453 E1.03824
G1 X206.16 Y94.101 E.02415
G1 X225.84 Y113.781 E1.03824
G1 X225.84 Y114.429 E.02415
G1 X206.16 Y94.748 E1.03824
G1 X206.16 Y95.396 E.02415
G1 X225.84 Y115.076 E1.03824
G1 X225.84 Y115.724 E.02415
G1 X206.16 Y96.043 E1.03824
G1 X206.16 Y96.69 E.02415
G1 X225.84 Y116.371 E1.03824
G1 X225.84 Y117.018 E.02415
G1 X206.16 Y97.338 E1.03824
G1 X206.16 Y97.985 E.02415
G1 X225.84 Y117.666 E1.03824
G1 X225.84 Y118.313 E.02415
G1 X206.16 Y98.633 E1.03824
G1 X206.16 Y99.28 E.02415
G1 X225.84 Y118.961 E1.03824
G1 X225.84 Y119.608 E.02415
G1 X206.16 Y99.927 E1.03824
G1 X206.16 Y100.575 E.02415
G1 X225.84 Y120.255 E1.03824
G1 X225.84 Y120.903 E.02415
G1 X206.16 Y101.222 E1.03824
G1 X206.16 Y101.87 E.02415
G1 X225.84 Y121.55 E1.03824
G1 X225.84 Y122.198 E.02415
G1 X206.16 Y102.517 E1.03824
G1 X206.16 Y103.164 E.02415
G1 X225.84 Y122.845 E1.03824
G1 X225.84 Y123.492 E.02415
G1 X206.16 Y103.812 E1.03824
G1 X206.16 Y104.459 E.02415
G1 X225.84 Y124.14 E1.03824
G1 X225.84 Y124.787 E.02415
G1 X206.16 Y105.107 E1.03824
G1 X206.16 Y105.754 E.02415
G1 X225.84 Y125.435 E1.03824
G1 X225.84 Y126.082 E.02415
G1 X206.16 Y106.401 E1.03824
G1 X206.16 Y107.049 E.02415
G1 X225.84 Y126.729 E1.03824
G1 X225.84 Y127.377 E.02415
G1 X206.16 Y107.696 E1.03824
G1 X206.16 Y108.344 E.02415
G1 X225.84 Y128.024 E1.03824
G1 X225.84 Y128.672 E.02415
G1 X206.16 Y108.991 E1.03824
G1 X206.16 Y109.638 E.02415
G1 X225.84 Y129.319 E1.03824
G1 X225.84 Y129.966 E.02415
G1 X206.16 Y110.286 E1.03824
G1 X206.16 Y110.933 E.02415
G1 X217.612 Y122.386 E.60418
G3 X219.618 Y124.391 I-1.569 J3.574 E.10828
G1 X225.84 Y130.614 E.32827
G1 X225.84 Y131.261 E.02415
G1 X219.9 Y125.321 E.31339
G3 X219.961 Y126.029 I-4.88 J.778 E.02655
G1 X225.84 Y131.909 E.31016
G1 X225.84 Y132.556 E.02415
G1 X219.908 Y126.624 E.31295
G3 X219.79 Y127.153 I-2.703 J-.325 E.02027
G1 X225.84 Y133.203 E.31918
G1 X225.84 Y133.851 E.02415
G1 X219.611 Y127.622 E.3286
G3 X219.388 Y128.046 I-2.23 J-.905 E.0179
G1 X225.84 Y134.498 E.3404
G1 X225.84 Y135.146 E.02415
G1 X219.124 Y128.43 E.3543
G3 X218.823 Y128.776 I-1.88 J-1.331 E.01715
G1 X225.84 Y135.793 E.37019
G1 X225.84 Y136.44 E.02415
G1 X218.485 Y129.085 E.38803
G3 X218.106 Y129.354 I-4.815 J-6.391 E.01732
G1 X225.84 Y137.088 E.40801
G1 X225.84 Y137.735 E.02415
G1 X217.686 Y129.581 E.43018
M73 P25 R48
G3 X217.222 Y129.764 I-1.147 J-2.222 E.01864
G1 X225.84 Y138.383 E.45466
G1 X225.84 Y139.03 E.02415
G1 X216.708 Y129.898 E.48178
G3 X216.119 Y129.956 I-.806 J-5.152 E.0221
G1 X225.84 Y139.677 E.51286
G1 X225.84 Y140.325 E.02415
G1 X215.181 Y129.665 E.56234
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
G1 X206.16 Y111.581 E.56907
G1 X206.16 Y112.228 E.02415
G1 X215.972 Y122.041 E.51766
G2 X215.376 Y122.092 I.08 J4.416 E.02233
G1 X206.16 Y112.875 E.48621
G1 X206.16 Y113.523 E.02415
G1 X214.849 Y122.213 E.45843
G2 X214.376 Y122.386 I.629 J2.45 E.01885
G1 X206.16 Y114.17 E.43343
G1 X206.16 Y114.818 E.02415
G1 X213.953 Y122.611 E.41113
G2 X213.57 Y122.876 I1.131 J2.044 E.01739
G1 X206.16 Y115.465 E.39095
G1 X206.16 Y116.112 E.02415
G1 X213.225 Y123.178 E.37275
G2 X212.917 Y123.517 I1.545 J1.714 E.01712
G1 X206.16 Y116.76 E.35649
G1 X206.16 Y117.407 E.02415
G1 X212.646 Y123.894 E.3422
G2 X212.417 Y124.312 I5.995 J3.561 E.01779
G1 X206.16 Y118.055 E.3301
G1 X206.16 Y118.702 E.02415
G1 X212.236 Y124.778 E.32053
G2 X212.105 Y125.295 I2.52 J.911 E.01992
G1 X206.16 Y119.349 E.31364
G1 X206.16 Y119.997 E.02415
G1 X212.043 Y125.88 E.31035
G2 X212.079 Y126.564 I3.436 J.159 E.0256
G1 X206.16 Y120.644 E.31228
G1 X206.16 Y121.292 E.02415
G1 X212.315 Y127.447 E.32474
G2 X214.551 Y129.683 I3.688 J-1.453 E.12129
G1 X225.84 Y140.972 E.59558
G1 X225.84 Y141.62 E.02415
G1 X206.16 Y121.939 E1.03824
G1 X206.16 Y122.586 E.02415
G1 X225.84 Y142.267 E1.03824
G1 X225.84 Y142.914 E.02415
G1 X206.16 Y123.234 E1.03824
G1 X206.16 Y123.881 E.02415
G1 X225.84 Y143.562 E1.03824
G1 X225.84 Y144.209 E.02415
G1 X206.16 Y124.529 E1.03824
G1 X206.16 Y125.176 E.02415
G1 X225.84 Y144.857 E1.03824
G1 X225.84 Y145.504 E.02415
G1 X206.16 Y125.823 E1.03824
G1 X206.16 Y126.471 E.02415
G1 X225.84 Y146.151 E1.03824
G1 X225.84 Y146.799 E.02415
G1 X206.16 Y127.118 E1.03824
G1 X206.16 Y127.766 E.02415
G1 X225.84 Y147.446 E1.03824
G1 X225.84 Y148.094 E.02415
G1 X206.16 Y128.413 E1.03824
M73 P26 R48
G1 X206.16 Y129.06 E.02415
G1 X225.84 Y148.741 E1.03824
G1 X225.84 Y149.388 E.02415
G1 X206.16 Y129.708 E1.03824
G1 X206.16 Y130.355 E.02415
G1 X225.84 Y150.036 E1.03824
G1 X225.84 Y150.683 E.02415
G1 X206.16 Y131.003 E1.03824
G1 X206.16 Y131.65 E.02415
G1 X225.84 Y151.331 E1.03824
G1 X225.84 Y151.978 E.02415
G1 X206.16 Y132.297 E1.03824
G1 X206.16 Y132.945 E.02415
G1 X225.84 Y152.625 E1.03824
G1 X225.84 Y153.273 E.02415
G1 X206.16 Y133.592 E1.03824
G1 X206.16 Y134.24 E.02415
G1 X225.84 Y153.92 E1.03824
G1 X225.84 Y154.568 E.02415
G1 X206.16 Y134.887 E1.03824
G1 X206.16 Y135.534 E.02415
G1 X225.84 Y155.215 E1.03824
G1 X225.84 Y155.862 E.02415
G1 X206.16 Y136.182 E1.03824
G1 X206.16 Y136.829 E.02415
G1 X225.84 Y156.51 E1.03824
G1 X225.84 Y157.157 E.02415
G1 X206.16 Y137.477 E1.03824
G1 X206.16 Y138.124 E.02415
G1 X225.84 Y157.805 E1.03824
G1 X225.84 Y158.452 E.02415
G1 X206.16 Y138.771 E1.03824
G1 X206.16 Y139.419 E.02415
G1 X225.84 Y159.099 E1.03824
G1 X225.84 Y159.747 E.02415
G1 X206.16 Y140.066 E1.03824
G1 X206.16 Y140.714 E.02415
G1 X225.84 Y160.394 E1.03824
G1 X225.84 Y161.042 E.02415
G1 X206.16 Y141.361 E1.03824
G1 X206.16 Y142.008 E.02415
G1 X225.84 Y161.689 E1.03824
G1 X225.84 Y162.336 E.02415
G1 X206.16 Y142.656 E1.03824
G1 X206.16 Y143.303 E.02415
G1 X225.84 Y162.984 E1.03824
G1 X225.84 Y163.631 E.02415
G1 X206.16 Y143.951 E1.03824
G1 X206.16 Y144.598 E.02415
G1 X225.84 Y164.279 E1.03824
G1 X225.84 Y164.926 E.02415
G1 X206.16 Y145.245 E1.03824
G1 X206.16 Y145.893 E.02415
G1 X225.84 Y165.573 E1.03824
G1 X225.84 Y166.221 E.02415
G1 X206.16 Y146.54 E1.03824
G1 X206.16 Y147.188 E.02415
G1 X225.84 Y166.868 E1.03824
G1 X225.84 Y167.516 E.02415
G1 X206.16 Y147.835 E1.03824
G1 X206.16 Y148.482 E.02415
G1 X225.84 Y168.163 E1.03824
G1 X225.84 Y168.81 E.02415
G1 X206.16 Y149.13 E1.03824
G1 X206.16 Y149.777 E.02415
G1 X225.84 Y169.458 E1.03824
G1 X225.84 Y170.105 E.02415
G1 X206.16 Y150.425 E1.03824
G1 X206.16 Y151.072 E.02415
G1 X225.84 Y170.753 E1.03824
G1 X225.84 Y171.4 E.02415
G1 X206.16 Y151.719 E1.03824
G1 X206.16 Y152.367 E.02415
G1 X225.84 Y172.047 E1.03824
G1 X225.84 Y172.695 E.02415
G1 X206.16 Y153.014 E1.03824
G1 X206.16 Y153.662 E.02415
G1 X225.84 Y173.342 E1.03824
G1 X225.84 Y173.99 E.02415
G1 X206.16 Y154.309 E1.03824
G1 X206.16 Y154.956 E.02415
G1 X225.84 Y174.637 E1.03824
G1 X225.84 Y175.284 E.02415
G1 X206.16 Y155.604 E1.03824
G1 X206.16 Y156.251 E.02415
G1 X225.84 Y175.932 E1.03824
G1 X225.84 Y176.579 E.02415
G1 X206.16 Y156.899 E1.03824
G1 X206.16 Y157.546 E.02415
G1 X225.84 Y177.227 E1.03824
G1 X225.84 Y177.874 E.02415
G1 X206.16 Y158.193 E1.03824
G1 X206.16 Y158.841 E.02415
G1 X225.84 Y178.521 E1.03824
G1 X225.84 Y179.169 E.02415
G1 X206.16 Y159.488 E1.03824
G1 X206.16 Y160.136 E.02415
G1 X225.84 Y179.816 E1.03824
G1 X225.84 Y180.464 E.02415
G1 X206.16 Y160.783 E1.03824
G1 X206.16 Y161.43 E.02415
G1 X225.84 Y181.111 E1.03824
G1 X225.84 Y181.758 E.02415
G1 X206.16 Y162.078 E1.03824
G1 X206.16 Y162.725 E.02415
G1 X225.84 Y182.406 E1.03824
G1 X225.84 Y183.053 E.02415
G1 X206.16 Y163.373 E1.03824
G1 X206.16 Y164.02 E.02415
G1 X225.84 Y183.701 E1.03824
G1 X225.84 Y184.348 E.02415
G1 X206.16 Y164.667 E1.03824
G1 X206.16 Y165.315 E.02415
G1 X225.84 Y184.995 E1.03824
G1 X225.84 Y185.643 E.02415
G1 X206.16 Y165.962 E1.03824
G1 X206.16 Y166.61 E.02415
G1 X225.84 Y186.29 E1.03824
G1 X225.84 Y186.937 E.02415
G1 X206.16 Y167.257 E1.03824
G1 X206.16 Y167.904 E.02415
G1 X225.84 Y187.585 E1.03824
G1 X225.84 Y188.232 E.02415
G1 X206.16 Y168.552 E1.03824
G1 X206.16 Y169.199 E.02415
G1 X225.84 Y188.88 E1.03824
G1 X225.84 Y189.527 E.02415
G1 X206.16 Y169.847 E1.03824
G1 X206.16 Y170.494 E.02415
G1 X225.84 Y190.174 E1.03824
G1 X225.84 Y190.822 E.02415
G1 X206.16 Y171.141 E1.03824
G1 X206.16 Y171.789 E.02415
G1 X225.84 Y191.469 E1.03824
G1 X225.84 Y192.117 E.02415
G1 X206.16 Y172.436 E1.03824
G1 X206.16 Y173.084 E.02415
G1 X225.84 Y192.764 E1.03824
G1 X225.84 Y193.411 E.02415
G1 X206.16 Y173.731 E1.03824
G1 X206.16 Y174.378 E.02415
G1 X225.84 Y194.059 E1.03824
G1 X225.84 Y194.706 E.02415
G1 X206.16 Y175.026 E1.03824
G1 X206.16 Y175.673 E.02415
G1 X225.84 Y195.354 E1.03824
G1 X225.84 Y196.001 E.02415
G1 X206.16 Y176.321 E1.03824
G1 X206.16 Y176.968 E.02415
G1 X225.84 Y196.648 E1.03824
G1 X225.84 Y197.296 E.02415
G1 X206.16 Y177.615 E1.03824
G1 X206.16 Y178.263 E.02415
G1 X225.84 Y197.943 E1.03824
G1 X225.84 Y198.591 E.02415
G1 X206.16 Y178.91 E1.03824
G1 X206.16 Y179.558 E.02415
G1 X225.84 Y199.238 E1.03824
G1 X225.84 Y199.885 E.02415
G1 X206.16 Y180.205 E1.03824
G1 X206.16 Y180.852 E.02415
G1 X225.84 Y200.533 E1.03824
G1 X225.84 Y201.18 E.02415
G1 X206.16 Y181.5 E1.03824
G1 X206.16 Y182.147 E.02415
G1 X225.84 Y201.828 E1.03824
G1 X225.84 Y202.475 E.02415
G1 X206.16 Y182.795 E1.03824
G1 X206.16 Y183.442 E.02415
G1 X225.84 Y203.122 E1.03824
G1 X225.84 Y203.77 E.02415
G1 X206.16 Y184.089 E1.03824
G1 X206.16 Y184.737 E.02415
G1 X225.84 Y204.417 E1.03824
G1 X225.84 Y205.065 E.02415
G1 X206.16 Y185.384 E1.03824
G1 X206.16 Y186.031 E.02415
G1 X225.84 Y205.712 E1.03824
M73 P27 R48
G1 X225.84 Y206.359 E.02415
G1 X206.16 Y186.679 E1.03824
G1 X206.16 Y187.326 E.02415
G1 X225.84 Y207.007 E1.03824
G1 X225.84 Y207.654 E.02415
G1 X206.16 Y187.974 E1.03824
G1 X206.16 Y188.621 E.02415
G1 X225.84 Y208.302 E1.03824
G1 X225.84 Y208.949 E.02415
G1 X206.16 Y189.268 E1.03824
G1 X206.16 Y189.916 E.02415
G1 X225.84 Y209.596 E1.03824
G1 X225.84 Y210.244 E.02415
G1 X206.16 Y190.563 E1.03824
G1 X206.16 Y191.211 E.02415
G1 X225.84 Y210.891 E1.03824
G1 X225.84 Y211.539 E.02415
G1 X206.16 Y191.858 E1.03824
G1 X206.16 Y192.505 E.02415
G1 X225.84 Y212.186 E1.03824
G1 X225.84 Y212.833 E.02415
G1 X219.811 Y206.804 E.31806
G3 X219.948 Y207.589 I-4.05 J1.111 E.02975
G1 X225.84 Y213.481 E.31084
G1 X225.84 Y214.128 E.02415
G1 X219.945 Y208.233 E.31103
G3 X219.852 Y208.787 I-5.044 J-.561 E.02098
G1 X225.84 Y214.776 E.31593
G1 X225.84 Y215.423 E.02415
G1 X219.699 Y209.282 E.32397
G3 X219.499 Y209.729 I-2.337 J-.776 E.01831
G1 X225.84 Y216.07 E.33451
G1 X225.84 Y216.718 E.02415
G1 X219.255 Y210.132 E.34742
G3 X218.969 Y210.494 I-1.947 J-1.246 E.01722
G1 X225.84 Y217.365 E.3625
M73 P27 R47
G1 X225.84 Y217.715 E.01306
G1 X225.543 Y217.715 E.01109
G1 X218.646 Y210.818 E.36385
G3 X218.286 Y211.106 I-1.615 J-1.653 E.01721
G1 X224.896 Y217.715 E.34869
G1 X224.248 Y217.715 E.02415
G1 X217.888 Y211.355 E.33554
G3 X217.449 Y211.563 I-1.255 J-2.079 E.01816
G1 X223.601 Y217.715 E.32456
G1 X222.953 Y217.715 E.02415
G1 X216.954 Y211.716 E.31647
G3 X216.404 Y211.813 I-.758 J-2.707 E.0209
G1 X222.306 Y217.715 E.31138
G1 X221.659 Y217.715 E.02415
G1 X215.77 Y211.826 E.31067
G3 X215.001 Y211.705 I.253 J-4.097 E.02907
G1 X221.217 Y217.921 E.32792
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
G1 X206.16 Y193.153 E.59274
G1 X206.16 Y193.8 E.02415
G1 X216.283 Y203.923 E.53404
G2 X215.645 Y203.933 I-.27 J3.188 E.02383
G1 X206.16 Y194.448 E.5004
G1 X206.16 Y195.095 E.02415
G1 X215.086 Y204.021 E.47089
G2 X214.593 Y204.176 I.525 J2.534 E.0193
G1 X206.16 Y195.742 E.4449
G1 X206.16 Y196.39 E.02415
G1 X214.147 Y204.378 E.42139
G2 X213.744 Y204.621 I1.017 J2.141 E.01762
G1 X206.16 Y197.037 E.40009
G1 X206.16 Y197.685 E.02415
G1 X213.378 Y204.904 E.38083
G2 X213.055 Y205.228 I1.459 J1.779 E.01708
G1 X205.862 Y198.035 E.37946
G1 X205.215 Y198.035 E.02415
G1 X212.769 Y205.589 E.39851
G2 X212.521 Y205.988 I1.878 J1.442 E.01757
G1 X204.568 Y198.035 E.41959
G1 X203.92 Y198.035 E.02415
G1 X212.315 Y206.429 E.44285
G2 X212.156 Y206.918 I5.644 J2.104 E.01917
G1 X203.273 Y198.035 E.46863
G1 X202.625 Y198.035 E.02415
G1 X212.063 Y207.472 E.49788
G2 X212.046 Y208.102 I4.903 J.452 E.02352
G1 X201.978 Y198.035 E.53111
G1 X201.331 Y198.035 E.02415
G1 X212.481 Y209.185 E.58822
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
G1 X200.683 Y198.035 E1.04909
G1 X200.036 Y198.035 E.02415
G1 X219.716 Y217.715 E1.03824
G1 X219.069 Y217.715 E.02415
G1 X199.388 Y198.035 E1.03824
G1 X198.741 Y198.035 E.02415
G1 X218.422 Y217.715 E1.03824
G1 X217.774 Y217.715 E.02415
G1 X198.094 Y198.035 E1.03824
G1 X197.446 Y198.035 E.02415
G1 X217.127 Y217.715 E1.03824
G1 X216.479 Y217.715 E.02415
G1 X196.799 Y198.035 E1.03824
G1 X196.151 Y198.035 E.02415
G1 X215.832 Y217.715 E1.03824
G1 X215.185 Y217.715 E.02415
G1 X195.504 Y198.035 E1.03824
G1 X194.857 Y198.035 E.02415
G1 X214.537 Y217.715 E1.03824
G1 X213.89 Y217.715 E.02415
G1 X194.209 Y198.035 E1.03824
G1 X193.562 Y198.035 E.02415
G1 X213.242 Y217.715 E1.03824
G1 X212.595 Y217.715 E.02415
G1 X192.914 Y198.035 E1.03824
G1 X192.267 Y198.035 E.02415
G1 X211.948 Y217.715 E1.03824
G1 X211.3 Y217.715 E.02415
G1 X191.62 Y198.035 E1.03824
G1 X190.972 Y198.035 E.02415
G1 X210.653 Y217.715 E1.03824
G1 X210.005 Y217.715 E.02415
G1 X190.325 Y198.035 E1.03824
G1 X189.677 Y198.035 E.02415
G1 X209.358 Y217.715 E1.03824
G1 X208.711 Y217.715 E.02415
G1 X189.03 Y198.035 E1.03824
G1 X188.383 Y198.035 E.02415
G1 X208.063 Y217.715 E1.03824
G1 X207.416 Y217.715 E.02415
G1 X187.735 Y198.035 E1.03824
G1 X187.088 Y198.035 E.02415
G1 X206.768 Y217.715 E1.03824
G1 X206.121 Y217.715 E.02415
G1 X186.44 Y198.035 E1.03824
G1 X185.793 Y198.035 E.02415
G1 X205.474 Y217.715 E1.03824
G1 X204.826 Y217.715 E.02415
G1 X185.146 Y198.035 E1.03824
G1 X184.498 Y198.035 E.02415
G1 X204.179 Y217.715 E1.03824
G1 X203.531 Y217.715 E.02415
G1 X183.851 Y198.035 E1.03824
G1 X183.203 Y198.035 E.02415
G1 X202.884 Y217.715 E1.03824
G1 X202.237 Y217.715 E.02415
G1 X182.556 Y198.035 E1.03824
G1 X181.909 Y198.035 E.02415
G1 X201.589 Y217.715 E1.03824
G1 X200.942 Y217.715 E.02415
G1 X181.261 Y198.035 E1.03824
G1 X180.614 Y198.035 E.02415
G1 X200.294 Y217.715 E1.03824
G1 X199.647 Y217.715 E.02415
G1 X179.966 Y198.035 E1.03824
G1 X179.319 Y198.035 E.02415
G1 X199 Y217.715 E1.03824
G1 X198.352 Y217.715 E.02415
G1 X178.672 Y198.035 E1.03824
G1 X178.024 Y198.035 E.02415
G1 X197.705 Y217.715 E1.03824
G1 X197.057 Y217.715 E.02415
G1 X177.377 Y198.035 E1.03824
G1 X176.729 Y198.035 E.02415
G1 X196.41 Y217.715 E1.03824
G1 X195.763 Y217.715 E.02415
G1 X176.082 Y198.035 E1.03824
G1 X175.435 Y198.035 E.02415
G1 X195.115 Y217.715 E1.03824
G1 X194.468 Y217.715 E.02415
G1 X174.787 Y198.035 E1.03824
G1 X174.14 Y198.035 E.02415
G1 X193.82 Y217.715 E1.03824
G1 X193.173 Y217.715 E.02415
G1 X173.492 Y198.035 E1.03824
G1 X172.845 Y198.035 E.02415
G1 X192.526 Y217.715 E1.03824
G1 X191.878 Y217.715 E.02415
G1 X172.198 Y198.035 E1.03824
G1 X171.55 Y198.035 E.02415
G1 X191.231 Y217.715 E1.03824
G1 X190.583 Y217.715 E.02415
G1 X170.903 Y198.035 E1.03824
G1 X170.255 Y198.035 E.02415
G1 X189.936 Y217.715 E1.03824
G1 X189.289 Y217.715 E.02415
G1 X169.608 Y198.035 E1.03824
G1 X168.961 Y198.035 E.02415
G1 X188.641 Y217.715 E1.03824
G1 X187.994 Y217.715 E.02415
G1 X168.313 Y198.035 E1.03824
G1 X167.666 Y198.035 E.02415
G1 X187.346 Y217.715 E1.03824
G1 X186.699 Y217.715 E.02415
G1 X167.018 Y198.035 E1.03824
M73 P28 R47
G1 X166.371 Y198.035 E.02415
G1 X186.052 Y217.715 E1.03824
G1 X185.404 Y217.715 E.02415
G1 X165.724 Y198.035 E1.03824
G1 X165.076 Y198.035 E.02415
G1 X184.757 Y217.715 E1.03824
G1 X184.109 Y217.715 E.02415
G1 X164.429 Y198.035 E1.03824
G1 X163.781 Y198.035 E.02415
G1 X183.462 Y217.715 E1.03824
G1 X182.815 Y217.715 E.02415
G1 X163.134 Y198.035 E1.03824
G1 X162.487 Y198.035 E.02415
G1 X182.167 Y217.715 E1.03824
G1 X181.52 Y217.715 E.02415
G1 X161.839 Y198.035 E1.03824
G1 X161.192 Y198.035 E.02415
G1 X180.872 Y217.715 E1.03824
G1 X180.225 Y217.715 E.02415
G1 X160.544 Y198.035 E1.03824
G1 X159.897 Y198.035 E.02415
G1 X179.578 Y217.715 E1.03824
G1 X178.93 Y217.715 E.02415
G1 X159.25 Y198.035 E1.03824
G1 X158.602 Y198.035 E.02415
G1 X178.283 Y217.715 E1.03824
G1 X177.635 Y217.715 E.02415
G1 X157.955 Y198.035 E1.03824
G1 X157.307 Y198.035 E.02415
G1 X176.988 Y217.715 E1.03824
G1 X176.341 Y217.715 E.02415
G1 X156.66 Y198.035 E1.03824
G1 X156.013 Y198.035 E.02415
G1 X175.693 Y217.715 E1.03824
G1 X175.046 Y217.715 E.02415
G1 X155.365 Y198.035 E1.03824
G1 X154.718 Y198.035 E.02415
G1 X174.398 Y217.715 E1.03824
G1 X173.751 Y217.715 E.02415
G1 X154.07 Y198.035 E1.03824
G1 X153.423 Y198.035 E.02415
G1 X173.104 Y217.715 E1.03824
G1 X172.456 Y217.715 E.02415
G1 X152.776 Y198.035 E1.03824
G1 X152.128 Y198.035 E.02415
G1 X171.809 Y217.715 E1.03824
G1 X171.161 Y217.715 E.02415
G1 X151.481 Y198.035 E1.03824
G1 X150.833 Y198.035 E.02415
G1 X170.514 Y217.715 E1.03824
G1 X169.867 Y217.715 E.02415
G1 X150.186 Y198.035 E1.03824
G1 X149.539 Y198.035 E.02415
G1 X169.219 Y217.715 E1.03824
G1 X168.572 Y217.715 E.02415
G1 X148.891 Y198.035 E1.03824
G1 X148.244 Y198.035 E.02415
G1 X167.924 Y217.715 E1.03824
G1 X167.277 Y217.715 E.02415
G1 X147.596 Y198.035 E1.03824
G1 X146.949 Y198.035 E.02415
G1 X166.63 Y217.715 E1.03824
G1 X165.982 Y217.715 E.02415
G1 X146.302 Y198.035 E1.03824
G1 X145.654 Y198.035 E.02415
G1 X165.335 Y217.715 E1.03824
G1 X164.687 Y217.715 E.02415
G1 X145.007 Y198.035 E1.03824
G1 X144.359 Y198.035 E.02415
G1 X164.04 Y217.715 E1.03824
G1 X163.393 Y217.715 E.02415
G1 X143.712 Y198.035 E1.03824
G1 X143.065 Y198.035 E.02415
G1 X162.745 Y217.715 E1.03824
G1 X162.098 Y217.715 E.02415
G1 X142.417 Y198.035 E1.03824
G1 X141.77 Y198.035 E.02415
G1 X161.45 Y217.715 E1.03824
G1 X160.803 Y217.715 E.02415
G1 X141.123 Y198.035 E1.03824
G1 X140.475 Y198.035 E.02415
G1 X160.156 Y217.715 E1.03824
G1 X159.508 Y217.715 E.02415
G1 X139.828 Y198.035 E1.03824
G1 X139.18 Y198.035 E.02415
G1 X158.861 Y217.715 E1.03824
G1 X158.213 Y217.715 E.02415
G1 X138.533 Y198.035 E1.03824
G1 X137.886 Y198.035 E.02415
G1 X157.566 Y217.715 E1.03824
G1 X156.919 Y217.715 E.02415
G1 X137.238 Y198.035 E1.03824
G1 X136.591 Y198.035 E.02415
G1 X156.271 Y217.715 E1.03824
G1 X155.624 Y217.715 E.02415
G1 X135.943 Y198.035 E1.03824
G1 X135.296 Y198.035 E.02415
G1 X154.976 Y217.715 E1.03824
G1 X154.329 Y217.715 E.02415
G1 X134.649 Y198.035 E1.03824
G1 X134.001 Y198.035 E.02415
G1 X153.682 Y217.715 E1.03824
G1 X153.034 Y217.715 E.02415
G1 X133.354 Y198.035 E1.03824
G1 X132.706 Y198.035 E.02415
G1 X152.387 Y217.715 E1.03824
G1 X151.739 Y217.715 E.02415
G1 X132.059 Y198.035 E1.03824
G1 X131.412 Y198.035 E.02415
G1 X151.092 Y217.715 E1.03824
G1 X150.445 Y217.715 E.02415
G1 X130.764 Y198.035 E1.03824
G1 X130.117 Y198.035 E.02415
G1 X149.797 Y217.715 E1.03824
G1 X149.15 Y217.715 E.02415
G1 X129.469 Y198.035 E1.03824
G1 X128.822 Y198.035 E.02415
G1 X148.502 Y217.715 E1.03824
G1 X147.855 Y217.715 E.02415
G1 X128.175 Y198.035 E1.03824
G1 X127.527 Y198.035 E.02415
G1 X147.208 Y217.715 E1.03824
M73 P28 R46
G1 X146.56 Y217.715 E.02415
G1 X126.88 Y198.035 E1.03824
G1 X126.232 Y198.035 E.02415
G1 X145.913 Y217.715 E1.03824
G1 X145.266 Y217.715 E.02415
G1 X125.585 Y198.035 E1.03824
G1 X124.938 Y198.035 E.02415
G1 X144.618 Y217.715 E1.03824
G1 X143.971 Y217.715 E.02415
G1 X124.29 Y198.035 E1.03824
G1 X123.643 Y198.035 E.02415
G1 X143.323 Y217.715 E1.03824
G1 X142.676 Y217.715 E.02415
G1 X131.827 Y206.866 E.57234
G3 X131.951 Y207.637 I-3.866 J1.015 E.02917
G1 X142.029 Y217.715 E.53166
G1 X141.381 Y217.715 E.02415
G1 X131.942 Y208.276 E.49797
G3 X131.842 Y208.824 I-2.793 J-.225 E.0208
G1 X140.734 Y217.715 E.46907
G1 X140.086 Y217.715 E.02415
G1 X131.687 Y209.316 E.4431
G3 X131.484 Y209.761 I-2.324 J-.79 E.01826
G1 X139.439 Y217.715 E.41964
G1 X138.792 Y217.715 E.02415
G1 X131.235 Y210.159 E.39865
G3 X130.947 Y210.518 I-1.937 J-1.26 E.01721
G1 X138.144 Y217.715 E.37971
G1 X137.497 Y217.715 E.02415
G1 X130.621 Y210.84 E.36271
G3 X130.259 Y211.125 I-1.604 J-1.666 E.01723
G1 X136.849 Y217.715 E.34767
G1 X136.202 Y217.715 E.02415
G1 X129.858 Y211.372 E.33465
G3 X129.414 Y211.575 I-2.889 J-5.736 E.01823
G1 X135.555 Y217.715 E.32394
G1 X134.907 Y217.715 E.02415
G1 X128.917 Y211.725 E.31602
G3 X128.362 Y211.818 I-.742 J-2.728 E.02101
G1 X134.26 Y217.715 E.31111
G1 X133.612 Y217.715 E.02415
G1 X127.72 Y211.823 E.31087
G3 X126.937 Y211.687 I.282 J-3.959 E.02969
G1 X133.171 Y217.921 E.32887
; WIPE_START
M73 P29 R46
G1 X131.756 Y216.507 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X130.256 Y209.023 Z.6 F30000
G1 X129.322 Y204.361 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X122.995 Y198.035 E.33375
G1 X122.348 Y198.035 E.02415
G1 X128.235 Y203.922 E.31059
G2 X127.602 Y203.936 I-.246 J3.165 E.02367
G1 X121.701 Y198.035 E.31133
G1 X121.053 Y198.035 E.02415
G1 X127.05 Y204.031 E.31634
G2 X126.56 Y204.189 I.542 J2.524 E.01923
G1 X120.406 Y198.035 E.32466
G1 X119.758 Y198.035 E.02415
G1 X126.117 Y204.393 E.33544
G2 X125.716 Y204.639 I1.029 J2.128 E.01759
G1 X119.111 Y198.035 E.34842
G1 X118.464 Y198.035 E.02415
G1 X125.355 Y204.926 E.36357
G2 X125.034 Y205.253 I1.473 J1.77 E.01711
G1 X117.816 Y198.035 E.38079
G1 X117.169 Y198.035 E.02415
G1 X124.75 Y205.616 E.39996
G2 X124.505 Y206.018 I1.89 J1.43 E.0176
G1 X116.521 Y198.035 E.42117
G1 X115.874 Y198.035 E.02415
G1 X124.301 Y206.462 E.44457
G2 X124.148 Y206.956 I5.123 J1.855 E.01932
G1 X115.227 Y198.035 E.47066
G1 X114.579 Y198.035 E.02415
G1 X124.059 Y207.514 E.5001
G2 X124.051 Y208.154 I4.286 J.375 E.02387
G1 X113.932 Y198.035 E.53382
G1 X113.284 Y198.035 E.02415
G1 X124.514 Y209.265 E.59243
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
G1 X112.637 Y198.035 E1.04909
G1 X111.99 Y198.035 E.02415
G1 X131.67 Y217.715 E1.03824
G1 X131.023 Y217.715 E.02415
G1 X111.342 Y198.035 E1.03824
G1 X110.695 Y198.035 E.02415
G1 X130.375 Y217.715 E1.03824
G1 X129.728 Y217.715 E.02415
G1 X110.047 Y198.035 E1.03824
G1 X109.4 Y198.035 E.02415
G1 X129.081 Y217.715 E1.03824
G1 X128.433 Y217.715 E.02415
G1 X108.753 Y198.035 E1.03824
G1 X108.105 Y198.035 E.02415
G1 X127.786 Y217.715 E1.03824
G1 X127.138 Y217.715 E.02415
G1 X107.458 Y198.035 E1.03824
G1 X106.81 Y198.035 E.02415
G1 X126.491 Y217.715 E1.03824
G1 X125.844 Y217.715 E.02415
G1 X106.163 Y198.035 E1.03824
G1 X105.516 Y198.035 E.02415
G1 X125.196 Y217.715 E1.03824
G1 X124.549 Y217.715 E.02415
G1 X104.868 Y198.035 E1.03824
G1 X104.221 Y198.035 E.02415
G1 X123.901 Y217.715 E1.03824
G1 X123.254 Y217.715 E.02415
G1 X103.573 Y198.035 E1.03824
G1 X102.926 Y198.035 E.02415
G1 X122.607 Y217.715 E1.03824
G1 X121.959 Y217.715 E.02415
G1 X102.279 Y198.035 E1.03824
G1 X101.631 Y198.035 E.02415
G1 X121.312 Y217.715 E1.03824
G1 X120.664 Y217.715 E.02415
G1 X100.984 Y198.035 E1.03824
G1 X100.336 Y198.035 E.02415
G1 X120.017 Y217.715 E1.03824
G1 X119.37 Y217.715 E.02415
G1 X99.689 Y198.035 E1.03824
G1 X99.042 Y198.035 E.02415
G1 X118.722 Y217.715 E1.03824
G1 X118.075 Y217.715 E.02415
G1 X98.394 Y198.035 E1.03824
G1 X97.747 Y198.035 E.02415
G1 X117.427 Y217.715 E1.03824
G1 X116.78 Y217.715 E.02415
G1 X97.099 Y198.035 E1.03824
G1 X96.452 Y198.035 E.02415
G1 X116.133 Y217.715 E1.03824
G1 X115.485 Y217.715 E.02415
G1 X95.805 Y198.035 E1.03824
G1 X95.157 Y198.035 E.02415
G1 X114.838 Y217.715 E1.03824
G1 X114.19 Y217.715 E.02415
G1 X94.51 Y198.035 E1.03824
G1 X93.862 Y198.035 E.02415
G1 X113.543 Y217.715 E1.03824
G1 X112.896 Y217.715 E.02415
G1 X93.215 Y198.035 E1.03824
G1 X92.568 Y198.035 E.02415
G1 X112.248 Y217.715 E1.03824
G1 X111.601 Y217.715 E.02415
G1 X91.92 Y198.035 E1.03824
G1 X91.273 Y198.035 E.02415
G1 X110.953 Y217.715 E1.03824
G1 X110.306 Y217.715 E.02415
G1 X90.625 Y198.035 E1.03824
G1 X89.978 Y198.035 E.02415
G1 X109.659 Y217.715 E1.03824
G1 X109.011 Y217.715 E.02415
G1 X89.331 Y198.035 E1.03824
G1 X88.683 Y198.035 E.02415
G1 X108.364 Y217.715 E1.03824
G1 X107.716 Y217.715 E.02415
G1 X88.036 Y198.035 E1.03824
G1 X87.388 Y198.035 E.02415
G1 X107.069 Y217.715 E1.03824
G1 X106.422 Y217.715 E.02415
G1 X86.741 Y198.035 E1.03824
G1 X86.094 Y198.035 E.02415
G1 X105.774 Y217.715 E1.03824
G1 X105.127 Y217.715 E.02415
G1 X85.446 Y198.035 E1.03824
G1 X84.799 Y198.035 E.02415
G1 X104.479 Y217.715 E1.03824
G1 X103.832 Y217.715 E.02415
G1 X84.151 Y198.035 E1.03824
G1 X83.504 Y198.035 E.02415
G1 X103.185 Y217.715 E1.03824
G1 X102.537 Y217.715 E.02415
G1 X82.857 Y198.035 E1.03824
G1 X82.209 Y198.035 E.02415
G1 X101.89 Y217.715 E1.03824
G1 X101.242 Y217.715 E.02415
G1 X81.562 Y198.035 E1.03824
G1 X80.914 Y198.035 E.02415
G1 X100.595 Y217.715 E1.03824
G1 X99.948 Y217.715 E.02415
G1 X80.267 Y198.035 E1.03824
G1 X79.62 Y198.035 E.02415
G1 X99.3 Y217.715 E1.03824
G1 X98.653 Y217.715 E.02415
G1 X78.972 Y198.035 E1.03824
G1 X78.325 Y198.035 E.02415
G1 X98.005 Y217.715 E1.03824
G1 X97.358 Y217.715 E.02415
G1 X77.677 Y198.035 E1.03824
G1 X77.03 Y198.035 E.02415
G1 X96.711 Y217.715 E1.03824
G1 X96.063 Y217.715 E.02415
G1 X76.383 Y198.035 E1.03824
G1 X75.735 Y198.035 E.02415
G1 X95.416 Y217.715 E1.03824
G1 X94.768 Y217.715 E.02415
G1 X75.088 Y198.035 E1.03824
G1 X74.44 Y198.035 E.02415
G1 X94.121 Y217.715 E1.03824
G1 X93.474 Y217.715 E.02415
G1 X73.793 Y198.035 E1.03824
G1 X73.146 Y198.035 E.02415
G1 X92.826 Y217.715 E1.03824
G1 X92.179 Y217.715 E.02415
G1 X72.498 Y198.035 E1.03824
G1 X71.851 Y198.035 E.02415
G1 X91.531 Y217.715 E1.03824
G1 X90.884 Y217.715 E.02415
G1 X71.203 Y198.035 E1.03824
G1 X70.556 Y198.035 E.02415
G1 X90.237 Y217.715 E1.03824
G1 X89.589 Y217.715 E.02415
G1 X69.909 Y198.035 E1.03824
G1 X69.261 Y198.035 E.02415
G1 X88.942 Y217.715 E1.03824
G1 X88.294 Y217.715 E.02415
G1 X68.614 Y198.035 E1.03824
G1 X67.966 Y198.035 E.02415
G1 X87.647 Y217.715 E1.03824
G1 X87 Y217.715 E.02415
G1 X67.319 Y198.035 E1.03824
G1 X66.672 Y198.035 E.02415
G1 X86.352 Y217.715 E1.03824
G1 X85.705 Y217.715 E.02415
G1 X66.024 Y198.035 E1.03824
G1 X65.377 Y198.035 E.02415
G1 X85.057 Y217.715 E1.03824
G1 X84.41 Y217.715 E.02415
G1 X64.729 Y198.035 E1.03824
G1 X64.082 Y198.035 E.02415
G1 X83.763 Y217.715 E1.03824
G1 X83.115 Y217.715 E.02415
G1 X63.435 Y198.035 E1.03824
G1 X62.787 Y198.035 E.02415
G1 X82.468 Y217.715 E1.03824
G1 X81.82 Y217.715 E.02415
G1 X62.14 Y198.035 E1.03824
M73 P30 R46
G1 X61.492 Y198.035 E.02415
G1 X81.173 Y217.715 E1.03824
G1 X80.526 Y217.715 E.02415
G1 X60.845 Y198.035 E1.03824
G1 X60.198 Y198.035 E.02415
G1 X79.878 Y217.715 E1.03824
G1 X79.231 Y217.715 E.02415
G1 X59.55 Y198.035 E1.03824
G1 X58.903 Y198.035 E.02415
G1 X78.583 Y217.715 E1.03824
G1 X77.936 Y217.715 E.02415
G1 X58.255 Y198.035 E1.03824
G1 X57.608 Y198.035 E.02415
G1 X77.289 Y217.715 E1.03824
G1 X76.641 Y217.715 E.02415
G1 X56.961 Y198.035 E1.03824
G1 X56.313 Y198.035 E.02415
G1 X75.994 Y217.715 E1.03824
G1 X75.346 Y217.715 E.02415
G1 X55.666 Y198.035 E1.03824
G1 X55.018 Y198.035 E.02415
G1 X74.699 Y217.715 E1.03824
G1 X74.052 Y217.715 E.02415
G1 X54.371 Y198.035 E1.03824
G1 X53.724 Y198.035 E.02415
G1 X73.404 Y217.715 E1.03824
G1 X72.757 Y217.715 E.02415
G1 X53.076 Y198.035 E1.03824
G1 X52.429 Y198.035 E.02415
G1 X72.109 Y217.715 E1.03824
G1 X71.462 Y217.715 E.02415
G1 X51.781 Y198.035 E1.03824
G1 X51.134 Y198.035 E.02415
G1 X70.815 Y217.715 E1.03824
G1 X70.167 Y217.715 E.02415
G1 X50.487 Y198.035 E1.03824
G1 X49.84 Y198.035 E.02411
G1 X49.84 Y197.388 E.02411
G1 X30.16 Y177.708 E1.03824
G1 X30.16 Y178.355 E.02415
M73 P30 R45
G1 X69.52 Y217.715 E2.07644
G1 X68.872 Y217.715 E.02415
G1 X30.16 Y179.003 E2.04228
G1 X30.16 Y179.65 E.02415
G1 X68.225 Y217.715 E2.00813
G1 X67.578 Y217.715 E.02415
G1 X30.16 Y180.297 E1.97398
G1 X30.16 Y180.945 E.02415
G1 X66.93 Y217.715 E1.93982
G1 X66.283 Y217.715 E.02415
G1 X30.16 Y181.592 E1.90567
G1 X30.16 Y182.24 E.02415
G1 X65.635 Y217.715 E1.87152
G1 X64.988 Y217.715 E.02415
G1 X30.16 Y182.887 E1.83736
G1 X30.16 Y183.534 E.02415
G1 X64.341 Y217.715 E1.80321
G1 X63.693 Y217.715 E.02415
G1 X30.16 Y184.182 E1.76906
G1 X30.16 Y184.829 E.02415
G1 X63.046 Y217.715 E1.7349
G1 X62.398 Y217.715 E.02415
G1 X30.16 Y185.477 E1.70075
G1 X30.16 Y186.124 E.02415
G1 X61.751 Y217.715 E1.6666
G1 X61.104 Y217.715 E.02415
G1 X30.16 Y186.771 E1.63244
G1 X30.16 Y187.419 E.02415
G1 X60.456 Y217.715 E1.59829
G1 X59.809 Y217.715 E.02415
G1 X30.16 Y188.066 E1.56413
G1 X30.16 Y188.714 E.02415
G1 X59.161 Y217.715 E1.52998
G1 X58.514 Y217.715 E.02415
G1 X30.16 Y189.361 E1.49583
G1 X30.16 Y190.008 E.02415
G1 X57.867 Y217.715 E1.46167
G1 X57.219 Y217.715 E.02415
G1 X30.16 Y190.656 E1.42752
G1 X30.16 Y191.303 E.02415
G1 X56.572 Y217.715 E1.39337
G1 X55.924 Y217.715 E.02415
G1 X30.16 Y191.951 E1.35921
G1 X30.16 Y192.598 E.02415
G1 X55.277 Y217.715 E1.32506
G1 X54.63 Y217.715 E.02415
G1 X43.843 Y206.928 E.56906
G3 X43.953 Y207.686 I-3.859 J.948 E.0286
G1 X53.982 Y217.715 E.52909
G1 X53.335 Y217.715 E.02415
G1 X43.936 Y208.316 E.49585
G3 X43.833 Y208.861 I-2.774 J-.242 E.02071
G1 X52.687 Y217.715 E.46713
G1 X52.04 Y217.715 E.02415
G1 X43.675 Y209.35 E.44132
G3 X43.468 Y209.79 I-6.198 J-2.646 E.01816
G1 X51.393 Y217.715 E.41809
G1 X50.745 Y217.715 E.02415
G1 X43.215 Y210.185 E.39726
G3 X42.924 Y210.542 I-1.927 J-1.273 E.01719
G1 X50.098 Y217.715 E.37844
G1 X49.45 Y217.715 E.02415
G1 X42.597 Y210.862 E.36157
G3 X42.232 Y211.144 I-1.595 J-1.68 E.01724
G1 X48.803 Y217.715 E.34665
G1 X48.156 Y217.715 E.02415
G1 X41.829 Y211.389 E.33376
G3 X41.379 Y211.586 I-2.836 J-5.841 E.01833
G1 X47.508 Y217.715 E.32333
G1 X46.861 Y217.715 E.02415
G1 X40.879 Y211.734 E.31556
G3 X40.321 Y211.823 I-.727 J-2.745 E.02111
G1 X46.213 Y217.715 E.31084
G1 X45.566 Y217.715 E.02415
G1 X39.67 Y211.819 E.31107
G3 X38.872 Y211.669 I.339 J-3.998 E.03032
G1 X45.124 Y217.921 E.32983
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
G1 X30.16 Y193.245 E.58518
G1 X30.16 Y193.893 E.02415
G1 X40.188 Y203.921 E.52904
G2 X39.559 Y203.939 I-.222 J3.144 E.02351
G1 X30.16 Y194.54 E.49586
G1 X30.16 Y195.188 E.02415
G1 X39.014 Y204.041 E.46709
G2 X38.527 Y204.202 I.557 J2.509 E.01916
G1 X30.16 Y195.835 E.4414
G1 X30.16 Y196.482 E.02415
G1 X38.086 Y204.409 E.41816
G2 X37.687 Y204.657 I1.042 J2.116 E.01756
G1 X30.16 Y197.13 E.39713
G1 X30.16 Y197.777 E.02415
G1 X37.332 Y204.949 E.37836
G2 X37.013 Y205.278 I1.482 J1.756 E.01711
G1 X30.16 Y198.425 E.36155
G1 X30.16 Y199.072 E.02415
G1 X36.732 Y205.644 E.34669
G2 X36.489 Y206.048 I1.901 J1.417 E.01763
G1 X30.16 Y199.719 E.33388
G1 X30.16 Y200.367 E.02415
G1 X36.287 Y206.494 E.32326
G2 X36.14 Y206.995 I5.397 J1.856 E.01946
G1 X30.16 Y201.014 E.31551
G1 X30.16 Y201.661 E.02415
G1 X36.055 Y207.556 E.31099
G2 X36.056 Y208.205 I4.139 J.317 E.02422
G1 X30.16 Y202.309 E.31105
G1 X30.16 Y202.956 E.02415
G1 X36.548 Y209.345 E.33701
; WIPE_START
G1 X35.134 Y207.93 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X29.954 Y203.398 Z.6 F30000
G1 Z.2
M73 P31 R45
G1 E.8 F1800
G1 F6300
M204 S500
G1 X44.271 Y217.715 E.7553
G1 X43.624 Y217.715 E.02415
G1 X30.16 Y204.251 E.7103
G1 X30.16 Y204.898 E.02415
G1 X42.976 Y217.715 E.67615
G1 X42.329 Y217.715 E.02415
G1 X30.16 Y205.546 E.64199
G1 X30.16 Y206.193 E.02415
G1 X41.682 Y217.715 E.60784
G1 X41.034 Y217.715 E.02415
G1 X30.16 Y206.841 E.57369
G1 X30.16 Y207.488 E.02415
G1 X40.387 Y217.715 E.53953
G1 X39.74 Y217.715 E.02415
G1 X30.16 Y208.135 E.50538
G1 X30.16 Y208.783 E.02415
G1 X39.092 Y217.715 E.47123
G1 X38.445 Y217.715 E.02415
G1 X30.16 Y209.43 E.43707
G1 X30.16 Y210.078 E.02415
G1 X37.797 Y217.715 E.40292
G1 X37.15 Y217.715 E.02415
G1 X30.16 Y210.725 E.36877
G1 X30.16 Y211.372 E.02415
G1 X36.503 Y217.715 E.33461
G1 X35.855 Y217.715 E.02415
G1 X30.16 Y212.02 E.30046
G1 X30.16 Y212.667 E.02415
G1 X35.208 Y217.715 E.26631
G1 X34.56 Y217.715 E.02415
G1 X30.16 Y213.315 E.23215
G1 X30.16 Y213.962 E.02415
G1 X33.913 Y217.715 E.198
G1 X33.266 Y217.715 E.02415
G1 X30.16 Y214.609 E.16385
G1 X30.16 Y215.257 E.02415
G1 X32.618 Y217.715 E.12969
G1 X31.971 Y217.715 E.02415
G1 X30.16 Y215.904 E.09554
G1 X30.16 Y216.552 E.02415
G1 X31.323 Y217.715 E.06139
G1 X30.676 Y217.715 E.02415
G1 X29.954 Y216.993 E.03808
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
G1 X126.477 Y205.044
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X126.678 Y204.945 E.00742
G3 X127.624 Y204.68 I1.328 J2.929 E.03273
G3 X128.24 Y204.666 I.379 J3.066 E.02049
G3 X126.393 Y205.091 I-.235 J3.207 E.6064
G1 X126.425 Y205.073 E.00121
G1 X126.97 Y205.264 F30000
G1 F16213.044
G1 X127.106 Y205.213 E.00481
G3 X127.673 Y205.085 I.9 J2.66 E.01933
G3 X128.21 Y205.072 I.33 J2.672 E.01785
G3 X126.845 Y205.316 I-.205 J2.801 E.53887
G1 X126.915 Y205.287 E.0025
G1 X127.419 Y205.545 F30000
G1 F16213.044
G1 X127.468 Y205.533 E.00168
G3 X127.722 Y205.489 I.537 J2.34 E.00853
G3 X128.18 Y205.479 I.281 J2.279 E.01521
G3 X127.235 Y205.599 I-.175 J2.395 E.46867
G1 X127.362 Y205.562 E.00436
G1 X127.768 Y205.879 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X127.769 Y205.879 E.00001
G1 X127.95 Y205.865 E.00558
G3 X127.554 Y205.917 I.06 J2.008 E.3756
G1 X127.709 Y205.889 E.00485
; WIPE_START
M204 S10000
G1 X127.769 Y205.879 E-.02296
G1 X127.95 Y205.865 E-.06897
G1 X128.349 Y205.895 E-.15213
G1 X128.734 Y206.004 E-.15213
G1 X129.091 Y206.186 E-.15213
G1 X129.404 Y206.436 E-.15209
G1 X129.504 Y206.556 E-.0596
; WIPE_END
G1 E-.04 F1800
G1 X137.136 Y206.42 Z.8 F30000
G1 X214.479 Y205.043 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X214.678 Y204.945 E.00735
G3 X215.624 Y204.68 I1.328 J2.929 E.03272
G3 X216.24 Y204.666 I.379 J3.066 E.02049
G3 X214.393 Y205.091 I-.235 J3.207 E.60639
G1 X214.427 Y205.072 E.00129
G1 X214.972 Y205.263 F30000
G1 F16213.044
G1 X215.105 Y205.213 E.00472
G3 X215.673 Y205.085 I.9 J2.66 E.01933
G3 X216.21 Y205.072 I.33 J2.673 E.01785
G3 X214.845 Y205.316 I-.205 J2.801 E.53887
G1 X214.917 Y205.286 E.00257
G1 X215.421 Y205.545 F30000
G1 F16213.044
G1 X215.468 Y205.533 E.00162
G3 X215.722 Y205.489 I.537 J2.34 E.00853
G3 X216.18 Y205.479 I.281 J2.279 E.01521
G3 X215.235 Y205.599 I-.175 J2.395 E.46866
G1 X215.363 Y205.562 E.00443
G1 X215.756 Y205.881 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X215.769 Y205.879 E.00039
G1 X215.95 Y205.865 E.00558
G3 X215.554 Y205.917 I.06 J2.008 E.3756
G1 X215.697 Y205.891 E.00447
; WIPE_START
M204 S10000
G1 X215.769 Y205.879 E-.0276
G1 X215.95 Y205.865 E-.06897
G1 X216.349 Y205.895 E-.15214
G1 X216.545 Y205.94 E-.07616
G1 X216.917 Y206.086 E-.1521
G1 X217.253 Y206.303 E-.15211
G1 X217.5 Y206.544 E-.13093
; WIPE_END
G1 E-.04 F1800
G1 X217.223 Y198.916 Z.8 F30000
G1 X214.474 Y123.171 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X214.678 Y123.07 E.00755
G3 X215.624 Y122.805 I1.328 J2.929 E.03272
G3 X216.24 Y122.791 I.379 J3.066 E.02049
G3 X214.393 Y123.216 I-.235 J3.207 E.60639
G1 X214.422 Y123.2 E.00109
G1 X214.968 Y123.39 F30000
G1 F16213.044
G1 X215.106 Y123.338 E.00489
G3 X215.673 Y123.21 I.9 J2.66 E.01933
G3 X216.21 Y123.197 I.33 J2.674 E.01785
G3 X214.845 Y123.441 I-.205 J2.801 E.53887
G1 X214.912 Y123.413 E.0024
G1 X215.402 Y123.679 F30000
G1 F16213.044
G1 X215.468 Y123.658 E.00232
G3 X215.722 Y123.614 I.537 J2.34 E.00854
G3 X216.18 Y123.604 I.281 J2.28 E.01521
G3 X215.013 Y123.812 I-.175 J2.395 E.46072
G1 X215.345 Y123.698 E.01164
G1 X215.771 Y124.004 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X215.95 Y123.99 E.00551
G3 X215.712 Y124.012 I.06 J2.008 E.38054
; WIPE_START
M204 S10000
G1 X215.95 Y123.99 E-.09085
G1 X216.15 Y123.995 E-.07613
G1 X216.544 Y124.065 E-.15213
G1 X216.917 Y124.211 E-.15208
G1 X217.253 Y124.428 E-.15217
G1 X217.511 Y124.679 E-.13662
; WIPE_END
G1 E-.04 F1800
G1 X217.447 Y117.047 Z.8 F30000
G1 X216.815 Y41.014 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X216.872 Y41.026 E.00192
G3 X215.624 Y40.93 I-.866 J3.097 E.62845
G3 X216.24 Y40.916 I.379 J3.073 E.02049
G3 X216.559 Y40.955 I-.235 J3.207 E.01064
G1 X216.757 Y41.001 E.00674
G1 X216.392 Y41.345 F30000
G1 F16213.044
G1 X216.488 Y41.357 E.0032
G3 X215.673 Y41.335 I-.483 J2.767 E.55819
G3 X216.21 Y41.322 I.33 J2.677 E.01785
G1 X216.333 Y41.338 E.0041
G1 X216.009 Y41.733 F30000
G1 F16213.044
G1 X216.18 Y41.729 E.00566
G3 X215.722 Y41.739 I-.175 J2.395 E.48524
G1 X215.949 Y41.734 E.00754
G1 X215.772 Y42.129 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X215.95 Y42.115 E.00549
G3 X215.712 Y42.137 I.059 J2.008 E.38055
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
G1 F16213.044
G1 X126.678 Y41.194 E.00744
G3 X127.624 Y40.93 I1.328 J2.929 E.03272
G3 X128.24 Y40.916 I.379 J3.073 E.02049
G3 X126.393 Y41.341 I-.235 J3.207 E.60639
G1 X126.424 Y41.324 E.00121
G1 X126.97 Y41.514 F30000
G1 F16213.044
G1 X127.106 Y41.463 E.00482
G3 X127.673 Y41.335 I.9 J2.66 E.01933
G3 X128.21 Y41.322 I.33 J2.677 E.01785
G3 X126.845 Y41.566 I-.205 J2.801 E.53888
G1 X126.914 Y41.537 E.00248
G1 X127.419 Y41.795 F30000
G1 F16213.044
G1 X127.468 Y41.783 E.00168
G3 X127.722 Y41.739 I.536 J2.34 E.00854
G3 X128.18 Y41.729 I.281 J2.281 E.01521
G3 X127.235 Y41.849 I-.175 J2.395 E.46866
G1 X127.362 Y41.812 E.00436
G1 X127.772 Y42.129 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X127.95 Y42.115 E.00549
G3 X127.712 Y42.137 I.059 J2.008 E.38055
; WIPE_START
M204 S10000
G1 X127.95 Y42.115 E-.0907
G1 X128.349 Y42.145 E-.15212
G1 X128.734 Y42.254 E-.15213
G1 X129.091 Y42.436 E-.15214
G1 X129.404 Y42.686 E-.15208
G1 X129.507 Y42.809 E-.06084
; WIPE_END
G1 E-.04 F1800
G1 X121.876 Y42.654 Z.8 F30000
G1 X40.814 Y41.014 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X40.872 Y41.026 E.00195
G3 X39.624 Y40.93 I-.866 J3.097 E.62845
G3 X40.24 Y40.916 I.379 J3.073 E.02049
G3 X40.559 Y40.955 I-.235 J3.207 E.01064
G1 X40.756 Y41.001 E.00671
G1 X40.391 Y41.345 F30000
G1 F16213.044
G1 X40.488 Y41.357 E.00324
G3 X39.673 Y41.335 I-.483 J2.767 E.5582
G3 X40.21 Y41.322 I.33 J2.677 E.01785
G1 X40.332 Y41.338 E.00407
G1 X40.008 Y41.733 F30000
G1 F16213.044
G1 X40.18 Y41.729 E.00569
G3 X39.722 Y41.739 I-.175 J2.395 E.48524
G1 X39.948 Y41.734 E.00751
G1 X39.771 Y42.129 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X39.95 Y42.115 E.0055
G3 X39.712 Y42.137 I.059 J2.008 E.38054
; WIPE_START
M204 S10000
G1 X39.95 Y42.115 E-.09081
G1 X40.349 Y42.145 E-.15212
G1 X40.734 Y42.254 E-.15211
G1 X41.091 Y42.436 E-.15216
G1 X41.404 Y42.686 E-.15208
G1 X41.506 Y42.808 E-.06072
; WIPE_END
G1 E-.04 F1800
G1 X47.061 Y48.043 Z.8 F30000
G1 X205.416 Y197.291 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X50.584 Y197.291 E5.13608
G1 X50.584 Y54.709 E4.72972
G1 X205.416 Y54.709 E5.13608
G1 X205.416 Y197.231 E4.72773
G1 X205.009 Y196.884 F30000
G1 F16213.044
G1 X50.991 Y196.884 E5.10907
G1 X50.991 Y55.116 E4.70271
G1 X205.009 Y55.116 E5.10907
G1 X205.009 Y196.824 E4.70072
G1 X204.602 Y196.477 F30000
G1 F16213.044
G1 X51.398 Y196.477 E5.08206
G1 X51.398 Y55.523 E4.67571
G1 X204.602 Y55.523 E5.08206
G1 X204.602 Y196.417 E4.67372
G1 X204.21 Y196.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X51.79 Y196.085 E4.68344
G1 X51.79 Y55.915 E4.30703
G1 X204.21 Y55.915 E4.68344
G1 X204.21 Y196.025 E4.30519
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
G1 F16213.044
G1 X38.678 Y123.07 E.00744
G3 X39.624 Y122.805 I1.328 J2.929 E.03272
G3 X40.24 Y122.791 I.379 J3.066 E.02049
G3 X38.393 Y123.216 I-.235 J3.207 E.60639
G1 X38.425 Y123.198 E.0012
G1 X38.97 Y123.389 F30000
G1 F16213.044
G1 X39.106 Y123.338 E.00481
G3 X39.673 Y123.21 I.9 J2.66 E.01933
G3 X40.21 Y123.197 I.33 J2.674 E.01785
G3 X38.845 Y123.441 I-.205 J2.801 E.53887
G1 X38.914 Y123.412 E.00248
G1 X39.419 Y123.67 F30000
G1 F16213.044
G1 X39.468 Y123.658 E.00168
G3 X39.722 Y123.614 I.537 J2.34 E.00854
G3 X40.18 Y123.604 I.281 J2.28 E.01521
G3 X39.235 Y123.724 I-.175 J2.395 E.46866
G1 X39.362 Y123.687 E.00436
G1 X39.772 Y124.004 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X39.95 Y123.99 E.00549
G3 X39.712 Y124.012 I.06 J2.008 E.38055
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
G1 X41.44 Y132.316 Z.8 F30000
G1 X40.812 Y204.764 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X40.872 Y204.776 E.00202
G3 X39.624 Y204.68 I-.866 J3.097 E.62845
G3 X40.24 Y204.666 I.379 J3.066 E.02049
G3 X40.559 Y204.705 I-.235 J3.207 E.01064
G1 X40.754 Y204.75 E.00664
G1 X40.389 Y205.095 F30000
G1 F16213.044
G1 X40.488 Y205.107 E.00331
G3 X39.673 Y205.085 I-.483 J2.767 E.55819
G3 X40.21 Y205.072 I.33 J2.673 E.01785
G1 X40.329 Y205.087 E.004
G1 X40.007 Y205.483 F30000
G1 F16213.044
G1 X40.18 Y205.479 E.00573
G3 X39.722 Y205.489 I-.175 J2.395 E.48524
G1 X39.947 Y205.484 E.00747
G1 X39.756 Y205.881 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X39.769 Y205.879 E.00039
G1 X39.95 Y205.865 E.00558
G3 X39.554 Y205.917 I.06 J2.008 E.3756
G1 X39.697 Y205.891 E.00447
; WIPE_START
M204 S10000
G1 X39.769 Y205.879 E-.02764
G1 X39.95 Y205.865 E-.06897
G1 X40.349 Y205.895 E-.15212
G1 X40.734 Y206.004 E-.15211
G1 X41.091 Y206.186 E-.15215
G1 X41.404 Y206.436 E-.15209
G1 X41.497 Y206.547 E-.05491
; WIPE_END
G1 E-.04 F1800
G1 X49.113 Y207.037 Z.8 F30000
G1 X226.584 Y218.459 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X29.416 Y218.459 E6.54041
G1 X29.416 Y33.541 E6.13406
G1 X226.584 Y33.541 E6.54041
G1 X226.584 Y218.399 E6.13207
G1 X226.991 Y218.866 F30000
G1 F16213.044
G1 X29.009 Y218.866 E6.56742
G1 X29.009 Y33.134 E6.16106
G1 X226.991 Y33.134 E6.56742
G1 X226.991 Y218.806 E6.15907
G1 X227.398 Y219.273 F30000
G1 F16213.044
G1 X28.602 Y219.273 E6.59442
G1 X28.602 Y32.727 E6.18807
G1 X227.398 Y32.727 E6.59442
G1 X227.398 Y219.213 E6.18608
G1 X227.79 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X28.21 Y219.665 E6.13254
G1 X28.21 Y32.335 E5.75613
G1 X227.79 Y32.335 E6.13254
G1 X227.79 Y219.605 E5.75429
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
G1 F15000
G1 X226.251 Y217.702 E.02578
G1 X226.251 Y217.169 E.0164
G1 X225.294 Y218.126 E.04161
G1 X224.76 Y218.126 E.0164
G1 X226.251 Y216.635 E.06481
G1 X226.251 Y216.101 E.0164
G1 X224.226 Y218.126 E.088
G1 X223.693 Y218.126 E.0164
G1 X226.251 Y215.568 E.1112
G1 X226.251 Y215.034 E.0164
G1 X223.159 Y218.126 E.1344
G1 X222.626 Y218.126 E.0164
G1 X226.251 Y214.501 E.1576
G1 X226.251 Y213.967 E.0164
G1 X222.092 Y218.126 E.1808
G1 X221.559 Y218.126 E.0164
G1 X226.251 Y213.434 E.204
G1 X226.251 Y212.9 E.0164
G1 X221.025 Y218.126 E.2272
M73 P31 R44
G1 X220.492 Y218.126 E.0164
G1 X226.251 Y212.366 E.2504
G1 X226.251 Y211.833 E.0164
G1 X219.958 Y218.126 E.2736
G1 X219.424 Y218.126 E.0164
G1 X226.251 Y211.299 E.2968
G1 X226.251 Y210.766 E.0164
G1 X218.891 Y218.126 E.32
G1 X218.357 Y218.126 E.0164
G1 X226.251 Y210.232 E.34319
G1 X226.251 Y209.699 E.0164
G1 X217.824 Y218.126 E.36639
G1 X217.29 Y218.126 E.0164
G1 X226.251 Y209.165 E.38959
G1 X226.251 Y208.632 E.0164
G1 X216.757 Y218.126 E.41279
G1 X216.223 Y218.126 E.0164
G1 X226.251 Y208.098 E.43599
G1 X226.251 Y207.564 E.0164
G1 X215.689 Y218.126 E.45919
G1 X215.156 Y218.126 E.0164
G1 X226.251 Y207.031 E.48239
M73 P32 R44
G1 X226.251 Y206.497 E.0164
G1 X214.622 Y218.126 E.50559
G1 X214.089 Y218.126 E.0164
G1 X226.251 Y205.964 E.52879
G1 X226.251 Y205.43 E.0164
G1 X213.555 Y218.126 E.55199
G1 X213.022 Y218.126 E.0164
G1 X226.251 Y204.897 E.57518
G1 X226.251 Y204.363 E.0164
G1 X212.488 Y218.126 E.59838
G1 X211.954 Y218.126 E.0164
G1 X226.251 Y203.829 E.62158
G1 X226.251 Y203.296 E.0164
G1 X211.421 Y218.126 E.64478
G1 X210.887 Y218.126 E.0164
G1 X226.251 Y202.762 E.66798
G1 X226.251 Y202.229 E.0164
G1 X219.3 Y209.179 E.30219
G2 X219.501 Y208.444 I-3.423 J-1.332 E.02346
G1 X226.251 Y201.695 E.29344
G1 X226.251 Y201.162 E.0164
G1 X219.551 Y207.861 E.29129
G2 X219.511 Y207.368 I-2.486 J-.046 E.01525
G1 X226.251 Y200.628 E.29304
G1 X226.251 Y200.094 E.0164
G1 X219.419 Y206.926 E.29704
G2 X219.284 Y206.527 I-2.063 J.473 E.01297
G1 X226.251 Y199.561 E.30289
G1 X226.251 Y199.027 E.0164
G1 X219.112 Y206.165 E.31036
G2 X218.907 Y205.838 I-1.747 J.868 E.01192
G1 X226.251 Y198.494 E.3193
G1 X226.251 Y197.96 E.0164
G1 X218.672 Y205.539 E.32953
G2 X218.408 Y205.269 I-1.481 J1.182 E.01162
G1 X226.251 Y197.427 E.34099
G1 X226.251 Y196.893 E.0164
G1 X218.116 Y205.027 E.35368
G2 X217.795 Y204.815 I-1.223 J1.502 E.01186
G1 X226.251 Y196.359 E.36765
G1 X226.251 Y195.826 E.0164
G1 X217.442 Y204.634 E.38298
G2 X217.055 Y204.487 I-.929 J1.868 E.01274
G1 X226.251 Y195.292 E.3998
G1 X226.251 Y194.759 E.0164
G1 X216.629 Y204.38 E.41833
G2 X216.145 Y204.33 I-.771 J5.115 E.01496
G1 X226.251 Y194.225 E.43936
G1 X226.251 Y193.692 E.0164
G1 X215.594 Y204.348 E.46334
G2 X214.913 Y204.496 I.668 J4.727 E.02145
G1 X226.251 Y193.158 E.49296
G1 X226.251 Y192.624 E.0164
G1 X200.749 Y218.126 E1.10876
G1 X201.283 Y218.126 E.0164
G1 X212.624 Y206.784 E.49311
G2 X212.476 Y207.466 I3.458 J1.109 E.02149
G1 X201.817 Y218.126 E.46346
G1 X202.35 Y218.126 E.0164
G1 X212.453 Y208.023 E.43925
G2 X212.508 Y208.502 I4.814 J-.31 E.01482
G1 X202.884 Y218.126 E.41844
G1 X203.417 Y218.126 E.0164
G1 X212.613 Y208.93 E.39983
G2 X212.759 Y209.318 I2.013 J-.533 E.01276
G1 X203.951 Y218.126 E.38295
G1 X204.484 Y218.126 E.0164
G1 X212.939 Y209.671 E.36759
G2 X213.151 Y209.993 I1.715 J-.898 E.01186
G1 X205.018 Y218.126 E.3536
G1 X205.552 Y218.126 E.0164
G1 X213.392 Y210.285 E.34089
G2 X213.663 Y210.548 I10.92 J-10.977 E.0116
G1 X206.085 Y218.126 E.32946
G1 X206.619 Y218.126 E.0164
G1 X213.962 Y210.782 E.3193
G2 X214.292 Y210.986 I1.183 J-1.544 E.01194
G1 X207.152 Y218.126 E.31043
G1 X207.686 Y218.126 E.0164
G1 X214.654 Y211.157 E.30297
G2 X215.052 Y211.293 I.878 J-1.922 E.01294
G1 X208.219 Y218.126 E.29707
G1 X208.753 Y218.126 E.0164
G1 X215.491 Y211.387 E.29298
G2 X215.988 Y211.424 I.563 J-4.269 E.01533
G1 X209.287 Y218.126 E.29139
G1 X209.82 Y218.126 E.0164
G1 X216.567 Y211.379 E.29333
G2 X217.299 Y211.181 I-.291 J-2.523 E.0234
G1 X210.184 Y218.295 E.30934
G1 X200.046 Y218.295 F30000
G1 F15000
G1 X226.251 Y192.091 E1.13934
G1 X226.251 Y191.557 E.0164
G1 X199.682 Y218.126 E1.15516
G1 X199.149 Y218.126 E.0164
G1 X226.251 Y191.024 E1.17836
G1 X226.251 Y190.49 E.0164
G1 X198.615 Y218.126 E1.20156
G1 X198.082 Y218.126 E.0164
G1 X226.251 Y189.957 E1.22476
G1 X226.251 Y189.423 E.0164
G1 X197.548 Y218.126 E1.24796
G1 X197.014 Y218.126 E.0164
G1 X226.251 Y188.889 E1.27116
G1 X226.251 Y188.356 E.0164
G1 X196.481 Y218.126 E1.29436
G1 X195.947 Y218.126 E.0164
G1 X226.251 Y187.822 E1.31756
G1 X226.251 Y187.289 E.0164
G1 X195.414 Y218.126 E1.34075
G1 X194.88 Y218.126 E.0164
G1 X226.251 Y186.755 E1.36395
G1 X226.251 Y186.222 E.0164
G1 X194.347 Y218.126 E1.38715
G1 X193.813 Y218.126 E.0164
G1 X226.251 Y185.688 E1.41035
G1 X226.251 Y185.155 E.0164
G1 X193.279 Y218.126 E1.43355
G1 X192.746 Y218.126 E.0164
G1 X226.251 Y184.621 E1.45675
G1 X226.251 Y184.087 E.0164
G1 X192.212 Y218.126 E1.47995
G1 X191.679 Y218.126 E.0164
G1 X226.251 Y183.554 E1.50315
G1 X226.251 Y183.02 E.0164
G1 X191.145 Y218.126 E1.52635
G1 X190.612 Y218.126 E.0164
G1 X226.251 Y182.487 E1.54955
G1 X226.251 Y181.953 E.0164
G1 X190.078 Y218.126 E1.57275
G1 X189.545 Y218.126 E.0164
G1 X226.251 Y181.42 E1.59594
G1 X226.251 Y180.886 E.0164
G1 X189.011 Y218.126 E1.61914
G1 X188.477 Y218.126 E.0164
G1 X226.251 Y180.352 E1.64234
G1 X226.251 Y179.819 E.0164
G1 X187.944 Y218.126 E1.66554
G1 X187.41 Y218.126 E.0164
G1 X226.251 Y179.285 E1.68874
G1 X226.251 Y178.752 E.0164
G1 X186.877 Y218.126 E1.71194
G1 X186.343 Y218.126 E.0164
G1 X226.251 Y178.218 E1.73514
G1 X226.251 Y177.685 E.0164
G1 X185.81 Y218.126 E1.75834
G1 X185.276 Y218.126 E.0164
G1 X226.251 Y177.151 E1.78154
G1 X226.251 Y176.617 E.0164
G1 X205.749 Y197.118 E.89137
G1 X205.749 Y196.585 E.0164
G1 X226.251 Y176.084 E.89137
G1 X226.251 Y175.55 E.0164
G1 X205.749 Y196.051 E.89137
G1 X205.749 Y195.518 E.0164
G1 X226.251 Y175.017 E.89137
G1 X226.251 Y174.483 E.0164
G1 X205.749 Y194.984 E.89137
G1 X205.749 Y194.451 E.0164
G1 X226.251 Y173.95 E.89137
G1 X226.251 Y173.416 E.0164
G1 X205.749 Y193.917 E.89137
G1 X205.749 Y193.383 E.0164
G1 X226.251 Y172.882 E.89137
G1 X226.251 Y172.349 E.0164
G1 X205.749 Y192.85 E.89137
G1 X205.749 Y192.316 E.0164
G1 X226.251 Y171.815 E.89137
G1 X226.251 Y171.282 E.0164
G1 X205.749 Y191.783 E.89137
G1 X205.749 Y191.249 E.0164
G1 X226.251 Y170.748 E.89137
G1 X226.251 Y170.215 E.0164
G1 X205.749 Y190.716 E.89137
G1 X205.749 Y190.182 E.0164
G1 X226.251 Y169.681 E.89137
G1 X226.251 Y169.147 E.0164
G1 X205.749 Y189.649 E.89137
G1 X205.749 Y189.115 E.0164
G1 X226.251 Y168.614 E.89137
G1 X226.251 Y168.08 E.0164
G1 X205.749 Y188.581 E.89137
G1 X205.749 Y188.048 E.0164
G1 X226.251 Y167.547 E.89137
G1 X226.251 Y167.013 E.0164
G1 X205.749 Y187.514 E.89137
G1 X205.749 Y186.981 E.0164
G1 X226.251 Y166.48 E.89137
G1 X226.251 Y165.946 E.0164
G1 X205.749 Y186.447 E.89137
G1 X205.749 Y185.914 E.0164
G1 X226.251 Y165.412 E.89137
G1 X226.251 Y164.879 E.0164
G1 X205.749 Y185.38 E.89137
G1 X205.749 Y184.846 E.0164
G1 X226.251 Y164.345 E.89137
G1 X226.251 Y163.812 E.0164
G1 X205.749 Y184.313 E.89137
G1 X205.749 Y183.779 E.0164
G1 X226.251 Y163.278 E.89137
G1 X226.251 Y162.745 E.0164
G1 X205.749 Y183.246 E.89137
G1 X205.749 Y182.712 E.0164
G1 X226.251 Y162.211 E.89137
G1 X226.251 Y161.677 E.0164
G1 X205.749 Y182.179 E.89137
G1 X205.749 Y181.645 E.0164
G1 X226.251 Y161.144 E.89137
G1 X226.251 Y160.61 E.0164
G1 X205.749 Y181.111 E.89137
G1 X205.749 Y180.578 E.0164
G1 X226.251 Y160.077 E.89137
G1 X226.251 Y159.543 E.0164
G1 X205.749 Y180.044 E.89137
G1 X205.749 Y179.511 E.0164
G1 X226.251 Y159.01 E.89137
G1 X226.251 Y158.476 E.0164
G1 X205.749 Y178.977 E.89137
G1 X205.749 Y178.444 E.0164
G1 X226.251 Y157.942 E.89137
G1 X226.251 Y157.409 E.0164
G1 X205.749 Y177.91 E.89137
G1 X205.749 Y177.376 E.0164
G1 X226.251 Y156.875 E.89137
G1 X226.251 Y156.342 E.0164
G1 X205.749 Y176.843 E.89137
G1 X205.749 Y176.309 E.0164
G1 X226.251 Y155.808 E.89137
G1 X226.251 Y155.275 E.0164
G1 X205.749 Y175.776 E.89137
G1 X205.749 Y175.242 E.0164
G1 X226.251 Y154.741 E.89137
G1 X226.251 Y154.208 E.0164
G1 X205.749 Y174.709 E.89137
G1 X205.749 Y174.175 E.0164
G1 X226.251 Y153.674 E.89137
G1 X226.251 Y153.14 E.0164
G1 X205.749 Y173.641 E.89137
G1 X205.749 Y173.108 E.0164
G1 X226.251 Y152.607 E.89137
G1 X226.251 Y152.073 E.0164
G1 X205.749 Y172.574 E.89137
G1 X205.749 Y172.041 E.0164
G1 X226.251 Y151.54 E.89137
G1 X226.251 Y151.006 E.0164
G1 X205.749 Y171.507 E.89137
G1 X205.749 Y170.974 E.0164
G1 X226.251 Y150.473 E.89137
G1 X226.251 Y149.939 E.0164
G1 X205.749 Y170.44 E.89137
G1 X205.749 Y169.906 E.0164
G1 X226.251 Y149.405 E.89137
G1 X226.251 Y148.872 E.0164
G1 X205.749 Y169.373 E.89137
G1 X205.749 Y168.839 E.0164
G1 X226.251 Y148.338 E.89137
G1 X226.251 Y147.805 E.0164
G1 X205.749 Y168.306 E.89137
G1 X205.749 Y167.772 E.0164
G1 X226.251 Y147.271 E.89137
G1 X226.251 Y146.738 E.0164
G1 X205.749 Y167.239 E.89137
G1 X205.749 Y166.705 E.0164
G1 X226.251 Y146.204 E.89137
G1 X226.251 Y145.67 E.0164
G1 X205.749 Y166.171 E.89137
G1 X205.749 Y165.638 E.0164
G1 X226.251 Y145.137 E.89137
G1 X226.251 Y144.603 E.0164
G1 X205.749 Y165.104 E.89137
G1 X205.749 Y164.571 E.0164
G1 X226.251 Y144.07 E.89137
G1 X226.251 Y143.536 E.0164
G1 X205.749 Y164.037 E.89137
G1 X205.749 Y163.504 E.0164
G1 X226.251 Y143.003 E.89137
G1 X226.251 Y142.469 E.0164
G1 X205.749 Y162.97 E.89137
G1 X205.749 Y162.437 E.0164
G1 X226.251 Y141.935 E.89137
G1 X226.251 Y141.402 E.0164
G1 X205.749 Y161.903 E.89137
G1 X205.749 Y161.369 E.0164
G1 X226.251 Y140.868 E.89137
G1 X226.251 Y140.335 E.0164
G1 X205.749 Y160.836 E.89137
G1 X205.749 Y160.302 E.0164
G1 X226.251 Y139.801 E.89137
G1 X226.251 Y139.268 E.0164
G1 X205.749 Y159.769 E.89137
G1 X205.749 Y159.235 E.0164
G1 X226.251 Y138.734 E.89137
G1 X226.251 Y138.2 E.0164
G1 X205.749 Y158.702 E.89137
G1 X205.749 Y158.168 E.0164
G1 X226.251 Y137.667 E.89137
G1 X226.251 Y137.133 E.0164
G1 X205.749 Y157.634 E.89137
G1 X205.749 Y157.101 E.0164
G1 X226.251 Y136.6 E.89137
G1 X226.251 Y136.066 E.0164
G1 X205.749 Y156.567 E.89137
G1 X205.749 Y156.034 E.0164
G1 X226.251 Y135.533 E.89137
G1 X226.251 Y134.999 E.0164
G1 X205.749 Y155.5 E.89137
G1 X205.749 Y154.967 E.0164
G1 X226.251 Y134.465 E.89137
G1 X226.251 Y133.932 E.0164
G1 X205.749 Y154.433 E.89137
G1 X205.749 Y153.899 E.0164
G1 X226.251 Y133.398 E.89137
G1 X226.251 Y132.865 E.0164
G1 X205.749 Y153.366 E.89137
G1 X205.749 Y152.832 E.0164
G1 X226.251 Y132.331 E.89137
G1 X226.251 Y131.798 E.0164
G1 X205.749 Y152.299 E.89137
G1 X205.749 Y151.765 E.0164
G1 X226.251 Y131.264 E.89137
G1 X226.251 Y130.731 E.0164
G1 X205.749 Y151.232 E.89137
G1 X205.749 Y150.698 E.0164
G1 X226.251 Y130.197 E.89137
G1 X226.251 Y129.663 E.0164
G1 X205.749 Y150.164 E.89137
G1 X205.749 Y149.631 E.0164
G1 X226.251 Y129.13 E.89137
G1 X226.251 Y128.596 E.0164
G1 X205.749 Y149.097 E.89137
G1 X205.749 Y148.564 E.0164
G1 X226.251 Y128.063 E.89137
G1 X226.251 Y127.529 E.0164
G1 X205.749 Y148.03 E.89137
G1 X205.749 Y147.497 E.0164
G1 X226.251 Y126.996 E.89137
G1 X226.251 Y126.462 E.0164
G1 X205.749 Y146.963 E.89137
G1 X205.749 Y146.429 E.0164
G1 X226.251 Y125.928 E.89137
G1 X226.251 Y125.395 E.0164
G1 X205.749 Y145.896 E.89137
G1 X205.749 Y145.362 E.0164
G1 X226.251 Y124.861 E.89137
G1 X226.251 Y124.328 E.0164
G1 X205.749 Y144.829 E.89137
G1 X205.749 Y144.295 E.0164
G1 X226.251 Y123.794 E.89137
G1 X226.251 Y123.261 E.0164
G1 X205.749 Y143.762 E.89137
G1 X205.749 Y143.228 E.0164
G1 X226.251 Y122.727 E.89137
G1 X226.251 Y122.193 E.0164
G1 X205.749 Y142.694 E.89137
G1 X205.749 Y142.161 E.0164
G1 X226.251 Y121.66 E.89137
G1 X226.251 Y121.126 E.0164
G1 X205.749 Y141.627 E.89137
G1 X205.749 Y141.094 E.0164
G1 X226.251 Y120.593 E.89137
G1 X226.251 Y120.059 E.0164
G1 X219.439 Y126.871 E.29618
G2 X219.54 Y126.236 I-3.507 J-.885 E.01979
G1 X226.251 Y119.526 E.29178
G1 X226.251 Y118.992 E.0164
G1 X219.537 Y125.706 E.2919
G2 X219.467 Y125.242 I-4.769 J.478 E.01443
G1 X226.251 Y118.458 E.29493
G1 X226.251 Y117.925 E.0164
G1 X219.348 Y124.827 E.30011
G2 X219.191 Y124.451 I-1.959 J.596 E.01256
G1 X226.251 Y117.391 E.30694
G1 X226.251 Y116.858 E.0164
G1 X219.001 Y124.108 E.31522
G2 X218.78 Y123.795 I-1.673 J.948 E.01179
G1 X226.251 Y116.324 E.32482
G1 X226.251 Y115.791 E.0164
G1 X218.53 Y123.511 E.33569
G2 X218.252 Y123.256 I-1.413 J1.261 E.01163
G1 X226.251 Y115.257 E.34779
G1 X226.251 Y114.723 E.0164
G1 X217.945 Y123.029 E.36113
G2 X217.607 Y122.833 I-5.427 J8.971 E.012
G1 X226.251 Y114.19 E.37582
G1 X226.251 Y113.656 E.0164
G1 X217.234 Y122.673 E.39202
G2 X216.824 Y122.55 I-.82 J1.987 E.0132
G1 X226.251 Y113.123 E.40987
G1 X226.251 Y112.589 E.0164
G1 X216.369 Y122.471 E.42966
G2 X215.852 Y122.454 I-.398 J4.154 E.01589
G1 X226.251 Y112.056 E.45211
G1 X226.251 Y111.522 E.0164
G1 X215.241 Y122.531 E.47867
G2 X214.41 Y122.829 I.535 J2.804 E.02725
G1 X226.251 Y110.988 E.51481
G1 X226.251 Y110.455 E.0164
G1 X205.749 Y130.956 E.89137
G1 X205.749 Y131.49 E.0164
G1 X212.824 Y124.415 E.3076
G2 X212.535 Y125.237 I2.41 J1.309 E.02691
G1 X205.749 Y132.023 E.29504
G1 X205.749 Y132.557 E.0164
G1 X212.453 Y125.853 E.29145
G2 X212.472 Y126.368 I2.58 J.162 E.01585
G1 X205.749 Y133.09 E.29228
G1 X205.749 Y133.624 E.0164
G1 X212.548 Y126.825 E.29559
G2 X212.671 Y127.236 I6.088 J-1.609 E.01317
G1 X205.749 Y134.157 E.30096
G1 X205.749 Y134.691 E.0164
G1 X212.835 Y127.605 E.30808
G2 X213.031 Y127.943 I1.784 J-.812 E.01202
G1 X205.749 Y135.225 E.31661
G1 X205.749 Y135.758 E.0164
G1 X213.257 Y128.25 E.32644
G2 X213.512 Y128.529 I1.522 J-1.136 E.01163
G1 X205.749 Y136.292 E.33752
G1 X205.749 Y136.825 E.0164
G1 X213.796 Y128.779 E.34984
G2 X214.108 Y129.001 I1.261 J-1.447 E.01179
G1 X205.749 Y137.359 E.36341
G1 X205.749 Y137.892 E.0164
G1 X214.45 Y129.192 E.3783
G2 X214.826 Y129.35 I.978 J-1.799 E.01255
G1 X205.749 Y138.426 E.39462
G1 X205.749 Y138.96 E.0164
G1 X215.241 Y129.468 E.41268
G2 X215.707 Y129.535 I.569 J-2.299 E.01451
G1 X205.749 Y139.493 E.43296
G1 X205.749 Y140.027 E.0164
G1 X216.234 Y129.543 E.45584
G2 X216.87 Y129.44 I-.369 J-4.313 E.01983
G1 X205.58 Y140.73 E.49088
G1 X205.58 Y130.592 F30000
G1 F15000
G1 X226.251 Y109.921 E.89875
G1 X226.251 Y109.388 E.0164
G1 X205.749 Y129.889 E.89137
G1 X205.749 Y129.355 E.0164
G1 X226.251 Y108.854 E.89137
G1 X226.251 Y108.321 E.0164
G1 X205.749 Y128.822 E.89137
G1 X205.749 Y128.288 E.0164
G1 X226.251 Y107.787 E.89137
G1 X226.251 Y107.253 E.0164
G1 X205.749 Y127.755 E.89137
G1 X205.749 Y127.221 E.0164
G1 X226.251 Y106.72 E.89137
G1 X226.251 Y106.186 E.0164
G1 X205.749 Y126.687 E.89137
G1 X205.749 Y126.154 E.0164
G1 X226.251 Y105.653 E.89137
G1 X226.251 Y105.119 E.0164
G1 X205.749 Y125.62 E.89137
G1 X205.749 Y125.087 E.0164
G1 X226.251 Y104.586 E.89137
G1 X226.251 Y104.052 E.0164
G1 X205.749 Y124.553 E.89137
G1 X205.749 Y124.02 E.0164
G1 X226.251 Y103.519 E.89137
G1 X226.251 Y102.985 E.0164
G1 X205.749 Y123.486 E.89137
G1 X205.749 Y122.952 E.0164
G1 X226.251 Y102.451 E.89137
G1 X226.251 Y101.918 E.0164
G1 X205.749 Y122.419 E.89137
G1 X205.749 Y121.885 E.0164
G1 X226.251 Y101.384 E.89137
G1 X226.251 Y100.851 E.0164
G1 X205.749 Y121.352 E.89137
G1 X205.749 Y120.818 E.0164
G1 X226.251 Y100.317 E.89137
G1 X226.251 Y99.784 E.0164
G1 X205.749 Y120.285 E.89137
G1 X205.749 Y119.751 E.0164
G1 X226.251 Y99.25 E.89137
G1 X226.251 Y98.716 E.0164
G1 X205.749 Y119.217 E.89137
G1 X205.749 Y118.684 E.0164
G1 X226.251 Y98.183 E.89137
G1 X226.251 Y97.649 E.0164
G1 X205.749 Y118.15 E.89137
G1 X205.749 Y117.617 E.0164
G1 X226.251 Y97.116 E.89137
G1 X226.251 Y96.582 E.0164
G1 X205.749 Y117.083 E.89137
G1 X205.749 Y116.55 E.0164
G1 X226.251 Y96.049 E.89137
G1 X226.251 Y95.515 E.0164
G1 X205.749 Y116.016 E.89137
G1 X205.749 Y115.482 E.0164
G1 X226.251 Y94.981 E.89137
G1 X226.251 Y94.448 E.0164
G1 X205.749 Y114.949 E.89137
G1 X205.749 Y114.415 E.0164
G1 X226.251 Y93.914 E.89137
G1 X226.251 Y93.381 E.0164
G1 X205.749 Y113.882 E.89137
G1 X205.749 Y113.348 E.0164
G1 X226.251 Y92.847 E.89137
G1 X226.251 Y92.314 E.0164
G1 X205.749 Y112.815 E.89137
G1 X205.749 Y112.281 E.0164
G1 X226.251 Y91.78 E.89137
G1 X226.251 Y91.246 E.0164
G1 X205.749 Y111.748 E.89137
G1 X205.749 Y111.214 E.0164
G1 X226.251 Y90.713 E.89137
G1 X226.251 Y90.179 E.0164
G1 X205.749 Y110.68 E.89137
G1 X205.749 Y110.147 E.0164
G1 X226.251 Y89.646 E.89137
G1 X226.251 Y89.112 E.0164
G1 X205.749 Y109.613 E.89137
G1 X205.749 Y109.08 E.0164
G1 X226.251 Y88.579 E.89137
G1 X226.251 Y88.045 E.0164
G1 X205.749 Y108.546 E.89137
G1 X205.749 Y108.013 E.0164
G1 X226.251 Y87.511 E.89137
G1 X226.251 Y86.978 E.0164
G1 X205.749 Y107.479 E.89137
G1 X205.749 Y106.945 E.0164
G1 X226.251 Y86.444 E.89137
G1 X226.251 Y85.911 E.0164
G1 X205.749 Y106.412 E.89137
G1 X205.749 Y105.878 E.0164
G1 X226.251 Y85.377 E.89137
G1 X226.251 Y84.844 E.0164
G1 X205.749 Y105.345 E.89137
G1 X205.749 Y104.811 E.0164
G1 X226.251 Y84.31 E.89137
G1 X226.251 Y83.776 E.0164
G1 X205.749 Y104.278 E.89137
G1 X205.749 Y103.744 E.0164
G1 X226.251 Y83.243 E.89137
G1 X226.251 Y82.709 E.0164
G1 X205.749 Y103.21 E.89137
G1 X205.749 Y102.677 E.0164
G1 X226.251 Y82.176 E.89137
G1 X226.251 Y81.642 E.0164
G1 X205.749 Y102.143 E.89137
M73 P33 R44
G1 X205.749 Y101.61 E.0164
G1 X226.251 Y81.109 E.89137
G1 X226.251 Y80.575 E.0164
G1 X205.749 Y101.076 E.89137
G1 X205.749 Y100.543 E.0164
G1 X226.251 Y80.041 E.89137
G1 X226.251 Y79.508 E.0164
G1 X205.749 Y100.009 E.89137
G1 X205.749 Y99.475 E.0164
G1 X226.251 Y78.974 E.89137
G1 X226.251 Y78.441 E.0164
G1 X205.749 Y98.942 E.89137
G1 X205.749 Y98.408 E.0164
G1 X226.251 Y77.907 E.89137
G1 X226.251 Y77.374 E.0164
G1 X205.749 Y97.875 E.89137
G1 X205.749 Y97.341 E.0164
G1 X226.251 Y76.84 E.89137
G1 X226.251 Y76.307 E.0164
G1 X205.749 Y96.808 E.89137
G1 X205.749 Y96.274 E.0164
G1 X226.251 Y75.773 E.89137
G1 X226.251 Y75.239 E.0164
G1 X205.749 Y95.74 E.89137
G1 X205.749 Y95.207 E.0164
G1 X226.251 Y74.706 E.89137
G1 X226.251 Y74.172 E.0164
G1 X205.749 Y94.673 E.89137
G1 X205.749 Y94.14 E.0164
G1 X226.251 Y73.639 E.89137
G1 X226.251 Y73.105 E.0164
G1 X205.749 Y93.606 E.89137
G1 X205.749 Y93.073 E.0164
G1 X226.251 Y72.572 E.89137
G1 X226.251 Y72.038 E.0164
G1 X205.749 Y92.539 E.89137
G1 X205.749 Y92.005 E.0164
G1 X226.251 Y71.504 E.89137
G1 X226.251 Y70.971 E.0164
G1 X205.749 Y91.472 E.89137
G1 X205.749 Y90.938 E.0164
G1 X226.251 Y70.437 E.89137
G1 X226.251 Y69.904 E.0164
G1 X205.749 Y90.405 E.89137
G1 X205.749 Y89.871 E.0164
G1 X226.251 Y69.37 E.89137
G1 X226.251 Y68.837 E.0164
G1 X205.749 Y89.338 E.89137
G1 X205.749 Y88.804 E.0164
G1 X226.251 Y68.303 E.89137
G1 X226.251 Y67.769 E.0164
G1 X205.749 Y88.27 E.89137
G1 X205.749 Y87.737 E.0164
G1 X226.251 Y67.236 E.89137
G1 X226.251 Y66.702 E.0164
G1 X205.749 Y87.203 E.89137
G1 X205.749 Y86.67 E.0164
G1 X226.251 Y66.169 E.89137
G1 X226.251 Y65.635 E.0164
G1 X205.749 Y86.136 E.89137
G1 X205.749 Y85.603 E.0164
G1 X226.251 Y65.102 E.89137
G1 X226.251 Y64.568 E.0164
G1 X205.749 Y85.069 E.89137
G1 X205.749 Y84.536 E.0164
G1 X226.251 Y64.034 E.89137
G1 X226.251 Y63.501 E.0164
G1 X205.749 Y84.002 E.89137
G1 X205.749 Y83.468 E.0164
G1 X226.251 Y62.967 E.89137
G1 X226.251 Y62.434 E.0164
G1 X205.749 Y82.935 E.89137
G1 X205.749 Y82.401 E.0164
G1 X226.251 Y61.9 E.89137
G1 X226.251 Y61.367 E.0164
G1 X205.749 Y81.868 E.89137
G1 X205.749 Y81.334 E.0164
G1 X226.251 Y60.833 E.89137
G1 X226.251 Y60.299 E.0164
G1 X205.749 Y80.801 E.89137
G1 X205.749 Y80.267 E.0164
G1 X226.251 Y59.766 E.89137
G1 X226.251 Y59.232 E.0164
G1 X205.749 Y79.733 E.89137
G1 X205.749 Y79.2 E.0164
G1 X226.251 Y58.699 E.89137
G1 X226.251 Y58.165 E.0164
G1 X205.749 Y78.666 E.89137
G1 X205.749 Y78.133 E.0164
G1 X226.251 Y57.632 E.89137
G1 X226.251 Y57.098 E.0164
G1 X205.749 Y77.599 E.89137
G1 X205.749 Y77.066 E.0164
G1 X226.251 Y56.564 E.89137
G1 X226.251 Y56.031 E.0164
G1 X205.749 Y76.532 E.89137
G1 X205.749 Y75.998 E.0164
G1 X226.251 Y55.497 E.89137
G1 X226.251 Y54.964 E.0164
G1 X205.749 Y75.465 E.89137
G1 X205.749 Y74.931 E.0164
G1 X226.251 Y54.43 E.89137
G1 X226.251 Y53.897 E.0164
G1 X205.749 Y74.398 E.89137
G1 X205.749 Y73.864 E.0164
G1 X226.251 Y53.363 E.89137
G1 X226.251 Y52.829 E.0164
G1 X205.749 Y73.331 E.89137
G1 X205.749 Y72.797 E.0164
G1 X226.251 Y52.296 E.89137
G1 X226.251 Y51.762 E.0164
G1 X205.749 Y72.263 E.89137
G1 X205.749 Y71.73 E.0164
G1 X226.251 Y51.229 E.89137
G1 X226.251 Y50.695 E.0164
G1 X205.749 Y71.196 E.89137
G1 X205.749 Y70.663 E.0164
G1 X226.251 Y50.162 E.89137
G1 X226.251 Y49.628 E.0164
G1 X205.749 Y70.129 E.89137
G1 X205.749 Y69.596 E.0164
G1 X226.251 Y49.095 E.89137
G1 X226.251 Y48.561 E.0164
G1 X205.749 Y69.062 E.89137
G1 X205.749 Y68.528 E.0164
G1 X226.251 Y48.027 E.89137
G1 X226.251 Y47.494 E.0164
G1 X205.749 Y67.995 E.89137
G1 X205.749 Y67.461 E.0164
G1 X226.251 Y46.96 E.89137
G1 X226.251 Y46.427 E.0164
G1 X205.749 Y66.928 E.89137
G1 X205.749 Y66.394 E.0164
G1 X226.251 Y45.893 E.89137
G1 X226.251 Y45.36 E.0164
G1 X205.749 Y65.861 E.89137
G1 X205.749 Y65.327 E.0164
G1 X226.251 Y44.826 E.89137
G1 X226.251 Y44.292 E.0164
G1 X205.749 Y64.793 E.89137
G1 X205.749 Y64.26 E.0164
G1 X226.251 Y43.759 E.89137
G1 X226.251 Y43.225 E.0164
G1 X205.749 Y63.726 E.89137
G1 X205.749 Y63.193 E.0164
G1 X226.251 Y42.692 E.89137
M73 P33 R43
G1 X226.251 Y42.158 E.0164
G1 X205.749 Y62.659 E.89137
G1 X205.749 Y62.126 E.0164
G1 X226.251 Y41.625 E.89137
G1 X226.251 Y41.091 E.0164
G1 X205.749 Y61.592 E.89137
G1 X205.749 Y61.058 E.0164
G1 X226.251 Y40.557 E.89137
G1 X226.251 Y40.024 E.0164
G1 X205.749 Y60.525 E.89137
G1 X205.749 Y59.991 E.0164
G1 X226.251 Y39.49 E.89137
G1 X226.251 Y38.957 E.0164
G1 X205.749 Y59.458 E.89137
G1 X205.749 Y58.924 E.0164
G1 X217.215 Y47.459 E.4985
G3 X216.503 Y47.637 I-1.25 J-3.488 E.02259
G1 X205.749 Y58.391 E.46756
G1 X205.749 Y57.857 E.0164
G1 X215.932 Y47.675 E.44271
G3 X215.444 Y47.629 I.221 J-4.936 E.01506
G1 X205.749 Y57.324 E.42151
G1 X205.749 Y56.79 E.0164
G1 X215.008 Y47.531 E.40257
G3 X214.614 Y47.392 I.496 J-2.034 E.01288
G1 X205.749 Y56.256 E.38543
G1 X205.749 Y55.723 E.0164
G1 X214.255 Y47.217 E.36983
G3 X213.929 Y47.01 I.87 J-1.735 E.01191
G1 X205.749 Y55.189 E.35563
G1 X205.749 Y54.656 E.0164
G1 X213.633 Y46.772 E.34278
G3 X213.367 Y46.505 I1.199 J-1.466 E.01162
G1 X205.496 Y54.376 E.3422
G1 X204.962 Y54.376 E.0164
G1 X213.128 Y46.21 E.35504
G3 X212.919 Y45.885 I1.517 J-1.205 E.01189
G1 X204.429 Y54.376 E.36916
G1 X203.895 Y54.376 E.0164
G1 X212.742 Y45.529 E.38465
G3 X212.6 Y45.137 I1.889 J-.907 E.01282
G1 X203.362 Y54.376 E.40167
G1 X202.828 Y54.376 E.0164
G1 X212.498 Y44.705 E.42045
G3 X212.453 Y44.217 I4.415 J-.658 E.01508
G1 X202.295 Y54.376 E.44167
G1 X201.761 Y54.376 E.0164
G1 X212.482 Y43.654 E.46614
G3 X212.649 Y42.954 I4.041 J.593 E.02217
G1 X201.227 Y54.376 E.4966
G1 X200.694 Y54.376 E.0164
G1 X221.195 Y33.874 E.89137
G1 X221.729 Y33.874 E.0164
G1 X214.829 Y40.774 E.29998
G3 X215.528 Y40.608 I1.289 J3.884 E.02212
G1 X222.262 Y33.874 E.29278
G1 X222.796 Y33.874 E.0164
G1 X216.091 Y40.579 E.2915
G3 X216.581 Y40.623 I.026 J2.468 E.01514
G1 X223.329 Y33.874 E.29341
G1 X223.863 Y33.874 E.0164
G1 X217.014 Y40.724 E.29779
G3 X217.404 Y40.867 I-.522 J2.022 E.0128
G1 X224.396 Y33.874 E.30402
G1 X224.93 Y33.874 E.0164
G1 X217.76 Y41.045 E.31176
G3 X218.084 Y41.254 I-.885 J1.726 E.01188
G1 X225.464 Y33.874 E.32087
G1 X225.997 Y33.874 E.0164
G1 X218.379 Y41.493 E.33125
G3 X218.645 Y41.76 I-1.203 J1.465 E.01162
G1 X226.251 Y34.155 E.33069
G1 X226.251 Y34.688 E.0164
G1 X218.883 Y42.056 E.32035
G3 X219.091 Y42.381 I-1.524 J1.208 E.01189
G1 X226.251 Y35.222 E.31128
G1 X226.251 Y35.755 E.0164
G1 X219.269 Y42.737 E.30356
G3 X219.408 Y43.132 I-6.832 J2.623 E.01287
G1 X226.251 Y36.289 E.29753
G1 X226.251 Y36.822 E.0164
G1 X219.504 Y43.569 E.29335
G3 X219.548 Y44.058 I-2.421 J.468 E.01512
G1 X226.251 Y37.356 E.29141
G1 X226.251 Y37.89 E.0164
G1 X219.511 Y44.629 E.29301
G3 X219.332 Y45.342 I-3.514 J-.505 E.02264
G1 X226.42 Y38.253 E.30819
; WIPE_START
G1 X225.006 Y39.668 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X218.446 Y43.569 Z.8 F30000
G1 X199.991 Y54.545 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X220.661 Y33.874 E.89875
G1 X220.128 Y33.874 E.0164
G1 X199.627 Y54.376 E.89137
G1 X199.093 Y54.376 E.0164
G1 X219.594 Y33.874 E.89137
G1 X219.061 Y33.874 E.0164
G1 X198.56 Y54.376 E.89137
G1 X198.026 Y54.376 E.0164
G1 X218.527 Y33.874 E.89137
G1 X217.994 Y33.874 E.0164
G1 X197.493 Y54.376 E.89137
G1 X196.959 Y54.376 E.0164
G1 X217.46 Y33.874 E.89137
G1 X216.926 Y33.874 E.0164
G1 X196.425 Y54.376 E.89137
G1 X195.892 Y54.376 E.0164
G1 X216.393 Y33.874 E.89137
G1 X215.859 Y33.874 E.0164
G1 X195.358 Y54.376 E.89137
G1 X194.825 Y54.376 E.0164
G1 X215.326 Y33.874 E.89137
G1 X214.792 Y33.874 E.0164
G1 X194.291 Y54.376 E.89137
G1 X193.758 Y54.376 E.0164
G1 X214.259 Y33.874 E.89137
G1 X213.725 Y33.874 E.0164
G1 X193.224 Y54.376 E.89137
G1 X192.69 Y54.376 E.0164
G1 X213.191 Y33.874 E.89137
G1 X212.658 Y33.874 E.0164
G1 X192.157 Y54.376 E.89137
G1 X191.623 Y54.376 E.0164
G1 X212.124 Y33.874 E.89137
G1 X211.591 Y33.874 E.0164
G1 X191.09 Y54.376 E.89137
G1 X190.556 Y54.376 E.0164
G1 X211.057 Y33.874 E.89137
G1 X210.524 Y33.874 E.0164
G1 X190.023 Y54.376 E.89137
G1 X189.489 Y54.376 E.0164
G1 X209.99 Y33.874 E.89137
G1 X209.456 Y33.874 E.0164
G1 X188.955 Y54.376 E.89137
G1 X188.422 Y54.376 E.0164
G1 X208.923 Y33.874 E.89137
G1 X208.389 Y33.874 E.0164
G1 X187.888 Y54.376 E.89137
G1 X187.355 Y54.376 E.0164
G1 X207.856 Y33.874 E.89137
G1 X207.322 Y33.874 E.0164
G1 X186.821 Y54.376 E.89137
G1 X186.288 Y54.376 E.0164
G1 X206.789 Y33.874 E.89137
G1 X206.255 Y33.874 E.0164
G1 X185.754 Y54.376 E.89137
G1 X185.22 Y54.376 E.0164
G1 X205.722 Y33.874 E.89137
G1 X205.188 Y33.874 E.0164
G1 X184.687 Y54.376 E.89137
G1 X184.153 Y54.376 E.0164
G1 X204.654 Y33.874 E.89137
G1 X204.121 Y33.874 E.0164
G1 X183.62 Y54.376 E.89137
G1 X183.086 Y54.376 E.0164
G1 X203.587 Y33.874 E.89137
G1 X203.054 Y33.874 E.0164
G1 X182.553 Y54.376 E.89137
G1 X182.019 Y54.376 E.0164
G1 X202.52 Y33.874 E.89137
G1 X201.987 Y33.874 E.0164
G1 X181.485 Y54.376 E.89137
G1 X180.952 Y54.376 E.0164
G1 X201.453 Y33.874 E.89137
G1 X200.919 Y33.874 E.0164
G1 X180.418 Y54.376 E.89137
G1 X179.885 Y54.376 E.0164
G1 X200.386 Y33.874 E.89137
G1 X199.852 Y33.874 E.0164
G1 X179.351 Y54.376 E.89137
G1 X178.818 Y54.376 E.0164
G1 X199.319 Y33.874 E.89137
G1 X198.785 Y33.874 E.0164
G1 X178.284 Y54.376 E.89137
G1 X177.75 Y54.376 E.0164
G1 X198.252 Y33.874 E.89137
G1 X197.718 Y33.874 E.0164
G1 X177.217 Y54.376 E.89137
G1 X176.683 Y54.376 E.0164
G1 X197.184 Y33.874 E.89137
G1 X196.651 Y33.874 E.0164
G1 X176.15 Y54.376 E.89137
G1 X175.616 Y54.376 E.0164
G1 X196.117 Y33.874 E.89137
G1 X195.584 Y33.874 E.0164
G1 X175.083 Y54.376 E.89137
G1 X174.549 Y54.376 E.0164
G1 X195.05 Y33.874 E.89137
G1 X194.517 Y33.874 E.0164
G1 X174.015 Y54.376 E.89137
G1 X173.482 Y54.376 E.0164
G1 X193.983 Y33.874 E.89137
G1 X193.449 Y33.874 E.0164
G1 X172.948 Y54.376 E.89137
G1 X172.415 Y54.376 E.0164
G1 X192.916 Y33.874 E.89137
G1 X192.382 Y33.874 E.0164
G1 X171.881 Y54.376 E.89137
G1 X171.348 Y54.376 E.0164
G1 X191.849 Y33.874 E.89137
G1 X191.315 Y33.874 E.0164
G1 X170.814 Y54.376 E.89137
G1 X170.281 Y54.376 E.0164
G1 X190.782 Y33.874 E.89137
G1 X190.248 Y33.874 E.0164
G1 X169.747 Y54.376 E.89137
G1 X169.213 Y54.376 E.0164
G1 X189.714 Y33.874 E.89137
G1 X189.181 Y33.874 E.0164
G1 X168.68 Y54.376 E.89137
G1 X168.146 Y54.376 E.0164
G1 X188.647 Y33.874 E.89137
G1 X188.114 Y33.874 E.0164
G1 X167.613 Y54.376 E.89137
G1 X167.079 Y54.376 E.0164
G1 X187.58 Y33.874 E.89137
G1 X187.047 Y33.874 E.0164
G1 X166.546 Y54.376 E.89137
G1 X166.012 Y54.376 E.0164
G1 X186.513 Y33.874 E.89137
G1 X185.979 Y33.874 E.0164
G1 X165.478 Y54.376 E.89137
G1 X164.945 Y54.376 E.0164
G1 X185.446 Y33.874 E.89137
G1 X184.912 Y33.874 E.0164
G1 X164.411 Y54.376 E.89137
G1 X163.878 Y54.376 E.0164
G1 X184.379 Y33.874 E.89137
G1 X183.845 Y33.874 E.0164
G1 X163.344 Y54.376 E.89137
G1 X162.811 Y54.376 E.0164
G1 X183.312 Y33.874 E.89137
G1 X182.778 Y33.874 E.0164
G1 X162.277 Y54.376 E.89137
G1 X161.743 Y54.376 E.0164
G1 X182.244 Y33.874 E.89137
G1 X181.711 Y33.874 E.0164
G1 X161.21 Y54.376 E.89137
G1 X160.676 Y54.376 E.0164
G1 X181.177 Y33.874 E.89137
G1 X180.644 Y33.874 E.0164
G1 X160.143 Y54.376 E.89137
G1 X159.609 Y54.376 E.0164
G1 X180.11 Y33.874 E.89137
G1 X179.577 Y33.874 E.0164
G1 X159.076 Y54.376 E.89137
G1 X158.542 Y54.376 E.0164
G1 X179.043 Y33.874 E.89137
G1 X178.51 Y33.874 E.0164
G1 X158.008 Y54.376 E.89137
G1 X157.475 Y54.376 E.0164
G1 X177.976 Y33.874 E.89137
G1 X177.442 Y33.874 E.0164
G1 X156.941 Y54.376 E.89137
G1 X156.408 Y54.376 E.0164
G1 X176.909 Y33.874 E.89137
G1 X176.375 Y33.874 E.0164
G1 X155.874 Y54.376 E.89137
G1 X155.341 Y54.376 E.0164
G1 X175.842 Y33.874 E.89137
G1 X175.308 Y33.874 E.0164
G1 X154.807 Y54.376 E.89137
G1 X154.273 Y54.376 E.0164
G1 X174.775 Y33.874 E.89137
G1 X174.241 Y33.874 E.0164
G1 X153.74 Y54.376 E.89137
G1 X153.206 Y54.376 E.0164
G1 X173.707 Y33.874 E.89137
G1 X173.174 Y33.874 E.0164
G1 X152.673 Y54.376 E.89137
G1 X152.139 Y54.376 E.0164
G1 X172.64 Y33.874 E.89137
G1 X172.107 Y33.874 E.0164
G1 X151.606 Y54.376 E.89137
G1 X151.072 Y54.376 E.0164
G1 X171.573 Y33.874 E.89137
G1 X171.04 Y33.874 E.0164
G1 X150.538 Y54.376 E.89137
G1 X150.005 Y54.376 E.0164
G1 X170.506 Y33.874 E.89137
G1 X169.972 Y33.874 E.0164
G1 X149.471 Y54.376 E.89137
G1 X148.938 Y54.376 E.0164
G1 X169.439 Y33.874 E.89137
G1 X168.905 Y33.874 E.0164
G1 X148.404 Y54.376 E.89137
G1 X147.871 Y54.376 E.0164
G1 X168.372 Y33.874 E.89137
G1 X167.838 Y33.874 E.0164
G1 X147.337 Y54.376 E.89137
G1 X146.803 Y54.376 E.0164
G1 X167.305 Y33.874 E.89137
G1 X166.771 Y33.874 E.0164
G1 X146.27 Y54.376 E.89137
G1 X145.736 Y54.376 E.0164
G1 X166.237 Y33.874 E.89137
G1 X165.704 Y33.874 E.0164
G1 X145.203 Y54.376 E.89137
G1 X144.669 Y54.376 E.0164
G1 X165.17 Y33.874 E.89137
G1 X164.637 Y33.874 E.0164
G1 X144.136 Y54.376 E.89137
G1 X143.602 Y54.376 E.0164
G1 X164.103 Y33.874 E.89137
G1 X163.57 Y33.874 E.0164
G1 X143.068 Y54.376 E.89137
G1 X142.535 Y54.376 E.0164
G1 X163.036 Y33.874 E.89137
G1 X162.502 Y33.874 E.0164
G1 X142.001 Y54.376 E.89137
G1 X141.468 Y54.376 E.0164
G1 X161.969 Y33.874 E.89137
G1 X161.435 Y33.874 E.0164
G1 X140.934 Y54.376 E.89137
G1 X140.401 Y54.376 E.0164
G1 X160.902 Y33.874 E.89137
G1 X160.368 Y33.874 E.0164
G1 X139.867 Y54.376 E.89137
G1 X139.334 Y54.376 E.0164
G1 X159.835 Y33.874 E.89137
G1 X159.301 Y33.874 E.0164
G1 X138.8 Y54.376 E.89137
G1 X138.266 Y54.376 E.0164
G1 X158.767 Y33.874 E.89137
G1 X158.234 Y33.874 E.0164
G1 X137.733 Y54.376 E.89137
G1 X137.199 Y54.376 E.0164
G1 X157.7 Y33.874 E.89137
G1 X157.167 Y33.874 E.0164
G1 X136.666 Y54.376 E.89137
G1 X136.132 Y54.376 E.0164
G1 X156.633 Y33.874 E.89137
G1 X156.1 Y33.874 E.0164
G1 X135.599 Y54.376 E.89137
G1 X135.065 Y54.376 E.0164
G1 X155.566 Y33.874 E.89137
G1 X155.032 Y33.874 E.0164
G1 X134.531 Y54.376 E.89137
G1 X133.998 Y54.376 E.0164
G1 X154.499 Y33.874 E.89137
G1 X153.965 Y33.874 E.0164
G1 X133.464 Y54.376 E.89137
G1 X132.931 Y54.376 E.0164
G1 X153.432 Y33.874 E.89137
G1 X152.898 Y33.874 E.0164
G1 X132.397 Y54.376 E.89137
G1 X131.864 Y54.376 E.0164
G1 X152.365 Y33.874 E.89137
G1 X151.831 Y33.874 E.0164
G1 X131.33 Y54.376 E.89137
G1 X130.796 Y54.376 E.0164
G1 X151.297 Y33.874 E.89137
G1 X150.764 Y33.874 E.0164
G1 X130.263 Y54.376 E.89137
G1 X129.729 Y54.376 E.0164
G1 X150.23 Y33.874 E.89137
G1 X149.697 Y33.874 E.0164
G1 X129.196 Y54.376 E.89137
G1 X128.662 Y54.376 E.0164
G1 X149.163 Y33.874 E.89137
G1 X148.63 Y33.874 E.0164
G1 X128.129 Y54.376 E.89137
G1 X127.595 Y54.376 E.0164
G1 X148.096 Y33.874 E.89137
G1 X147.563 Y33.874 E.0164
G1 X127.061 Y54.376 E.89137
G1 X126.528 Y54.376 E.0164
G1 X147.029 Y33.874 E.89137
G1 X146.495 Y33.874 E.0164
G1 X125.994 Y54.376 E.89137
G1 X125.461 Y54.376 E.0164
G1 X145.962 Y33.874 E.89137
G1 X145.428 Y33.874 E.0164
G1 X124.927 Y54.376 E.89137
G1 X124.394 Y54.376 E.0164
G1 X144.895 Y33.874 E.89137
G1 X144.361 Y33.874 E.0164
G1 X123.86 Y54.376 E.89137
G1 X123.326 Y54.376 E.0164
G1 X143.828 Y33.874 E.89137
G1 X143.294 Y33.874 E.0164
G1 X122.793 Y54.376 E.89137
G1 X122.259 Y54.376 E.0164
G1 X129.156 Y47.479 E.29987
G3 X128.459 Y47.642 I-1.159 J-3.369 E.02206
G1 X121.726 Y54.376 E.29275
G1 X121.192 Y54.376 E.0164
G1 X127.894 Y47.674 E.29137
G3 X127.411 Y47.623 I.014 J-2.434 E.01494
G1 X120.659 Y54.376 E.29359
G1 X120.125 Y54.376 E.0164
G1 X126.978 Y47.522 E.29797
G3 X126.586 Y47.381 I.512 J-2.029 E.01283
G1 X119.591 Y54.376 E.30413
G1 X119.058 Y54.376 E.0164
G1 X126.23 Y47.204 E.31183
G3 X125.907 Y46.993 I6.433 J-10.208 E.01185
G1 X118.524 Y54.376 E.32099
G1 X117.991 Y54.376 E.0164
G1 X125.614 Y46.753 E.33144
G3 X125.349 Y46.484 I1.207 J-1.455 E.01162
G1 X117.457 Y54.376 E.34312
G1 X116.924 Y54.376 E.0164
G1 X125.112 Y46.187 E.35604
G3 X124.906 Y45.86 I1.528 J-1.196 E.01191
G1 X116.39 Y54.376 E.37025
G1 X115.856 Y54.376 E.0164
G1 X124.731 Y45.501 E.38584
M73 P34 R43
G3 X124.591 Y45.108 I1.898 J-.895 E.01287
G1 X115.323 Y54.376 E.40296
G1 X114.789 Y54.376 E.0164
G1 X124.492 Y44.673 E.42185
G3 X124.453 Y44.179 I4.852 J-.632 E.01526
G1 X114.256 Y54.376 E.44336
G1 X113.722 Y54.376 E.0164
G1 X124.486 Y43.611 E.46802
G3 X124.669 Y42.895 I2.422 J.236 E.0228
G1 X113.189 Y54.376 E.49915
G1 X112.655 Y54.376 E.0164
G1 X133.156 Y33.874 E.89137
G1 X133.69 Y33.874 E.0164
G1 X126.765 Y40.799 E.30107
G3 X127.482 Y40.616 I1.244 J3.379 E.02277
G1 X134.223 Y33.874 E.29312
G1 X134.757 Y33.874 E.0164
G1 X128.053 Y40.578 E.29146
G3 X128.546 Y40.618 I.044 J2.483 E.01524
G1 X135.29 Y33.874 E.29322
G1 X135.824 Y33.874 E.0164
G1 X128.985 Y40.714 E.29737
G3 X129.377 Y40.855 I-.508 J2.029 E.01284
G1 X136.358 Y33.874 E.3035
G1 X136.891 Y33.874 E.0164
G1 X129.735 Y41.031 E.31115
G3 X130.061 Y41.238 I-.872 J1.732 E.0119
G1 X137.425 Y33.874 E.32016
G1 X137.958 Y33.874 E.0164
G1 X130.358 Y41.475 E.33046
G3 X130.626 Y41.74 I-1.19 J1.472 E.01162
G1 X138.492 Y33.874 E.34199
G1 X139.025 Y33.874 E.0164
G1 X130.866 Y42.034 E.35476
G3 X131.077 Y42.357 I-1.513 J1.217 E.01187
G1 X139.559 Y33.874 E.36881
G1 X140.093 Y33.874 E.0164
G1 X131.256 Y42.711 E.3842
G3 X131.4 Y43.101 I-6.568 J2.638 E.01278
G1 X140.626 Y33.874 E.40116
G1 X141.16 Y33.874 E.0164
G1 X131.498 Y43.536 E.42006
G3 X131.546 Y44.021 I-2.402 J.483 E.01503
G1 X141.693 Y33.874 E.44117
G1 X142.227 Y33.874 E.0164
G1 X131.518 Y44.583 E.4656
G3 X131.354 Y45.281 I-3.634 J-.486 E.02206
G1 X142.93 Y33.705 E.5033
; WIPE_START
G1 X141.516 Y35.119 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X135.137 Y39.31 Z.8 F30000
G1 X111.952 Y54.545 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X132.623 Y33.874 E.89875
G1 X132.089 Y33.874 E.0164
G1 X111.588 Y54.376 E.89137
G1 X111.054 Y54.376 E.0164
G1 X131.555 Y33.874 E.89137
G1 X131.022 Y33.874 E.0164
G1 X110.521 Y54.376 E.89137
G1 X109.987 Y54.376 E.0164
G1 X130.488 Y33.874 E.89137
G1 X129.955 Y33.874 E.0164
G1 X109.454 Y54.376 E.89137
G1 X108.92 Y54.376 E.0164
G1 X129.421 Y33.874 E.89137
G1 X128.888 Y33.874 E.0164
G1 X108.387 Y54.376 E.89137
G1 X107.853 Y54.376 E.0164
G1 X128.354 Y33.874 E.89137
G1 X127.82 Y33.874 E.0164
G1 X107.319 Y54.376 E.89137
G1 X106.786 Y54.376 E.0164
G1 X127.287 Y33.874 E.89137
G1 X126.753 Y33.874 E.0164
G1 X106.252 Y54.376 E.89137
G1 X105.719 Y54.376 E.0164
G1 X126.22 Y33.874 E.89137
G1 X125.686 Y33.874 E.0164
G1 X105.185 Y54.376 E.89137
G1 X104.652 Y54.376 E.0164
G1 X125.153 Y33.874 E.89137
G1 X124.619 Y33.874 E.0164
G1 X104.118 Y54.376 E.89137
G1 X103.584 Y54.376 E.0164
G1 X124.085 Y33.874 E.89137
G1 X123.552 Y33.874 E.0164
G1 X103.051 Y54.376 E.89137
G1 X102.517 Y54.376 E.0164
G1 X123.018 Y33.874 E.89137
G1 X122.485 Y33.874 E.0164
G1 X101.984 Y54.376 E.89137
G1 X101.45 Y54.376 E.0164
G1 X121.951 Y33.874 E.89137
G1 X121.418 Y33.874 E.0164
G1 X100.917 Y54.376 E.89137
G1 X100.383 Y54.376 E.0164
G1 X120.884 Y33.874 E.89137
G1 X120.351 Y33.874 E.0164
G1 X99.849 Y54.376 E.89137
G1 X99.316 Y54.376 E.0164
G1 X119.817 Y33.874 E.89137
G1 X119.283 Y33.874 E.0164
G1 X98.782 Y54.376 E.89137
G1 X98.249 Y54.376 E.0164
G1 X118.75 Y33.874 E.89137
G1 X118.216 Y33.874 E.0164
G1 X97.715 Y54.376 E.89137
G1 X97.182 Y54.376 E.0164
G1 X117.683 Y33.874 E.89137
G1 X117.149 Y33.874 E.0164
G1 X96.648 Y54.376 E.89137
G1 X96.114 Y54.376 E.0164
G1 X116.616 Y33.874 E.89137
G1 X116.082 Y33.874 E.0164
G1 X95.581 Y54.376 E.89137
G1 X95.047 Y54.376 E.0164
G1 X115.548 Y33.874 E.89137
G1 X115.015 Y33.874 E.0164
G1 X94.514 Y54.376 E.89137
G1 X93.98 Y54.376 E.0164
G1 X114.481 Y33.874 E.89137
G1 X113.948 Y33.874 E.0164
G1 X93.447 Y54.376 E.89137
G1 X92.913 Y54.376 E.0164
G1 X113.414 Y33.874 E.89137
G1 X112.881 Y33.874 E.0164
G1 X92.379 Y54.376 E.89137
G1 X91.846 Y54.376 E.0164
G1 X112.347 Y33.874 E.89137
G1 X111.813 Y33.874 E.0164
G1 X91.312 Y54.376 E.89137
G1 X90.779 Y54.376 E.0164
G1 X111.28 Y33.874 E.89137
G1 X110.746 Y33.874 E.0164
G1 X90.245 Y54.376 E.89137
G1 X89.712 Y54.376 E.0164
G1 X110.213 Y33.874 E.89137
G1 X109.679 Y33.874 E.0164
G1 X89.178 Y54.376 E.89137
G1 X88.644 Y54.376 E.0164
G1 X109.146 Y33.874 E.89137
G1 X108.612 Y33.874 E.0164
G1 X88.111 Y54.376 E.89137
G1 X87.577 Y54.376 E.0164
G1 X108.078 Y33.874 E.89137
G1 X107.545 Y33.874 E.0164
G1 X87.044 Y54.376 E.89137
G1 X86.51 Y54.376 E.0164
G1 X107.011 Y33.874 E.89137
G1 X106.478 Y33.874 E.0164
G1 X85.977 Y54.376 E.89137
G1 X85.443 Y54.376 E.0164
G1 X105.944 Y33.874 E.89137
G1 X105.411 Y33.874 E.0164
G1 X84.91 Y54.376 E.89137
G1 X84.376 Y54.376 E.0164
G1 X104.877 Y33.874 E.89137
G1 X104.343 Y33.874 E.0164
G1 X83.842 Y54.376 E.89137
G1 X83.309 Y54.376 E.0164
G1 X103.81 Y33.874 E.89137
G1 X103.276 Y33.874 E.0164
G1 X82.775 Y54.376 E.89137
G1 X82.242 Y54.376 E.0164
G1 X102.743 Y33.874 E.89137
G1 X102.209 Y33.874 E.0164
G1 X81.708 Y54.376 E.89137
G1 X81.175 Y54.376 E.0164
G1 X101.676 Y33.874 E.89137
G1 X101.142 Y33.874 E.0164
G1 X80.641 Y54.376 E.89137
G1 X80.107 Y54.376 E.0164
G1 X100.608 Y33.874 E.89137
G1 X100.075 Y33.874 E.0164
G1 X79.574 Y54.376 E.89137
G1 X79.04 Y54.376 E.0164
G1 X99.541 Y33.874 E.89137
G1 X99.008 Y33.874 E.0164
G1 X78.507 Y54.376 E.89137
G1 X77.973 Y54.376 E.0164
G1 X98.474 Y33.874 E.89137
G1 X97.941 Y33.874 E.0164
G1 X77.44 Y54.376 E.89137
G1 X76.906 Y54.376 E.0164
G1 X97.407 Y33.874 E.89137
G1 X96.873 Y33.874 E.0164
G1 X76.372 Y54.376 E.89137
G1 X75.839 Y54.376 E.0164
G1 X96.34 Y33.874 E.89137
G1 X95.806 Y33.874 E.0164
G1 X75.305 Y54.376 E.89137
G1 X74.772 Y54.376 E.0164
G1 X95.273 Y33.874 E.89137
G1 X94.739 Y33.874 E.0164
G1 X74.238 Y54.376 E.89137
G1 X73.705 Y54.376 E.0164
G1 X94.206 Y33.874 E.89137
G1 X93.672 Y33.874 E.0164
G1 X73.171 Y54.376 E.89137
G1 X72.637 Y54.376 E.0164
G1 X93.139 Y33.874 E.89137
G1 X92.605 Y33.874 E.0164
G1 X72.104 Y54.376 E.89137
G1 X71.57 Y54.376 E.0164
G1 X92.071 Y33.874 E.89137
G1 X91.538 Y33.874 E.0164
G1 X71.037 Y54.376 E.89137
G1 X70.503 Y54.376 E.0164
G1 X91.004 Y33.874 E.89137
G1 X90.471 Y33.874 E.0164
G1 X69.97 Y54.376 E.89137
G1 X69.436 Y54.376 E.0164
G1 X89.937 Y33.874 E.89137
G1 X89.404 Y33.874 E.0164
G1 X68.902 Y54.376 E.89137
G1 X68.369 Y54.376 E.0164
G1 X88.87 Y33.874 E.89137
G1 X88.336 Y33.874 E.0164
G1 X67.835 Y54.376 E.89137
G1 X67.302 Y54.376 E.0164
G1 X87.803 Y33.874 E.89137
G1 X87.269 Y33.874 E.0164
G1 X66.768 Y54.376 E.89137
G1 X66.235 Y54.376 E.0164
G1 X86.736 Y33.874 E.89137
G1 X86.202 Y33.874 E.0164
G1 X65.701 Y54.376 E.89137
G1 X65.167 Y54.376 E.0164
G1 X85.669 Y33.874 E.89137
G1 X85.135 Y33.874 E.0164
G1 X64.634 Y54.376 E.89137
G1 X64.1 Y54.376 E.0164
G1 X84.601 Y33.874 E.89137
G1 X84.068 Y33.874 E.0164
G1 X63.567 Y54.376 E.89137
G1 X63.033 Y54.376 E.0164
G1 X83.534 Y33.874 E.89137
G1 X83.001 Y33.874 E.0164
G1 X62.5 Y54.376 E.89137
G1 X61.966 Y54.376 E.0164
G1 X82.467 Y33.874 E.89137
G1 X81.934 Y33.874 E.0164
G1 X61.432 Y54.376 E.89137
G1 X60.899 Y54.376 E.0164
G1 X81.4 Y33.874 E.89137
G1 X80.866 Y33.874 E.0164
G1 X60.365 Y54.376 E.89137
G1 X59.832 Y54.376 E.0164
G1 X80.333 Y33.874 E.89137
G1 X79.799 Y33.874 E.0164
G1 X59.298 Y54.376 E.89137
G1 X58.765 Y54.376 E.0164
G1 X79.266 Y33.874 E.89137
G1 X78.732 Y33.874 E.0164
G1 X58.231 Y54.376 E.89137
G1 X57.697 Y54.376 E.0164
G1 X78.199 Y33.874 E.89137
G1 X77.665 Y33.874 E.0164
G1 X57.164 Y54.376 E.89137
G1 X56.63 Y54.376 E.0164
G1 X77.131 Y33.874 E.89137
G1 X76.598 Y33.874 E.0164
G1 X56.097 Y54.376 E.89137
G1 X55.563 Y54.376 E.0164
G1 X76.064 Y33.874 E.89137
G1 X75.531 Y33.874 E.0164
G1 X55.03 Y54.376 E.89137
G1 X54.496 Y54.376 E.0164
G1 X74.997 Y33.874 E.89137
G1 X74.464 Y33.874 E.0164
G1 X53.963 Y54.376 E.89137
G1 X53.429 Y54.376 E.0164
G1 X73.93 Y33.874 E.89137
G1 X73.396 Y33.874 E.0164
G1 X52.895 Y54.376 E.89137
G1 X52.362 Y54.376 E.0164
G1 X72.863 Y33.874 E.89137
G1 X72.329 Y33.874 E.0164
G1 X51.828 Y54.376 E.89137
G1 X51.295 Y54.376 E.0164
G1 X71.796 Y33.874 E.89137
G1 X71.262 Y33.874 E.0164
G1 X50.761 Y54.376 E.89137
G1 X50.251 Y54.376 E.0157
G1 X50.251 Y54.886 E.0157
G1 X29.749 Y75.387 E.89137
G1 X29.749 Y75.921 E.0164
G1 X50.251 Y55.42 E.89137
G1 X50.251 Y55.953 E.0164
G1 X29.749 Y76.454 E.89137
G1 X29.749 Y76.988 E.0164
G1 X50.251 Y56.487 E.89137
G1 X50.251 Y57.02 E.0164
G1 X29.749 Y77.521 E.89137
G1 X29.749 Y78.055 E.0164
G1 X50.251 Y57.554 E.89137
G1 X50.251 Y58.088 E.0164
G1 X29.749 Y78.589 E.89137
G1 X29.749 Y79.122 E.0164
G1 X50.251 Y58.621 E.89137
G1 X50.251 Y59.155 E.0164
G1 X29.749 Y79.656 E.89137
G1 X29.749 Y80.189 E.0164
G1 X50.251 Y59.688 E.89137
G1 X50.251 Y60.222 E.0164
G1 X29.749 Y80.723 E.89137
G1 X29.749 Y81.256 E.0164
G1 X50.251 Y60.755 E.89137
G1 X50.251 Y61.289 E.0164
G1 X29.749 Y81.79 E.89137
G1 X29.749 Y82.324 E.0164
G1 X50.251 Y61.822 E.89137
G1 X50.251 Y62.356 E.0164
G1 X29.749 Y82.857 E.89137
G1 X29.749 Y83.391 E.0164
G1 X50.251 Y62.89 E.89137
G1 X50.251 Y63.423 E.0164
G1 X29.749 Y83.924 E.89137
G1 X29.749 Y84.458 E.0164
G1 X50.251 Y63.957 E.89137
G1 X50.251 Y64.49 E.0164
G1 X29.749 Y84.991 E.89137
G1 X29.749 Y85.525 E.0164
G1 X50.251 Y65.024 E.89137
G1 X50.251 Y65.557 E.0164
G1 X29.749 Y86.059 E.89137
G1 X29.749 Y86.592 E.0164
G1 X50.251 Y66.091 E.89137
G1 X50.251 Y66.625 E.0164
G1 X29.749 Y87.126 E.89137
G1 X29.749 Y87.659 E.0164
G1 X50.251 Y67.158 E.89137
G1 X50.251 Y67.692 E.0164
G1 X29.749 Y88.193 E.89137
G1 X29.749 Y88.726 E.0164
G1 X50.251 Y68.225 E.89137
G1 X50.251 Y68.759 E.0164
G1 X29.749 Y89.26 E.89137
G1 X29.749 Y89.794 E.0164
G1 X50.251 Y69.292 E.89137
G1 X50.251 Y69.826 E.0164
G1 X29.749 Y90.327 E.89137
G1 X29.749 Y90.861 E.0164
G1 X50.251 Y70.36 E.89137
G1 X50.251 Y70.893 E.0164
G1 X29.749 Y91.394 E.89137
G1 X29.749 Y91.928 E.0164
G1 X50.251 Y71.427 E.89137
G1 X50.251 Y71.96 E.0164
G1 X29.749 Y92.461 E.89137
G1 X29.749 Y92.995 E.0164
G1 X50.251 Y72.494 E.89137
G1 X50.251 Y73.027 E.0164
G1 X29.749 Y93.529 E.89137
G1 X29.749 Y94.062 E.0164
G1 X50.251 Y73.561 E.89137
G1 X50.251 Y74.095 E.0164
G1 X29.749 Y94.596 E.89137
G1 X29.749 Y95.129 E.0164
G1 X50.251 Y74.628 E.89137
G1 X50.251 Y75.162 E.0164
G1 X29.749 Y95.663 E.89137
G1 X29.749 Y96.196 E.0164
G1 X50.251 Y75.695 E.89137
G1 X50.251 Y76.229 E.0164
G1 X29.749 Y96.73 E.89137
G1 X29.749 Y97.263 E.0164
G1 X50.251 Y76.762 E.89137
G1 X50.251 Y77.296 E.0164
G1 X29.749 Y97.797 E.89137
G1 X29.749 Y98.331 E.0164
G1 X50.251 Y77.83 E.89137
G1 X50.251 Y78.363 E.0164
G1 X29.749 Y98.864 E.89137
G1 X29.749 Y99.398 E.0164
G1 X50.251 Y78.897 E.89137
G1 X50.251 Y79.43 E.0164
G1 X29.749 Y99.931 E.89137
G1 X29.749 Y100.465 E.0164
G1 X50.251 Y79.964 E.89137
G1 X50.251 Y80.497 E.0164
G1 X29.749 Y100.998 E.89137
G1 X29.749 Y101.532 E.0164
G1 X50.251 Y81.031 E.89137
G1 X50.251 Y81.565 E.0164
G1 X29.749 Y102.066 E.89137
G1 X29.749 Y102.599 E.0164
G1 X50.251 Y82.098 E.89137
G1 X50.251 Y82.632 E.0164
G1 X29.749 Y103.133 E.89137
G1 X29.749 Y103.666 E.0164
G1 X50.251 Y83.165 E.89137
G1 X50.251 Y83.699 E.0164
G1 X29.749 Y104.2 E.89137
G1 X29.749 Y104.733 E.0164
G1 X50.251 Y84.232 E.89137
G1 X50.251 Y84.766 E.0164
G1 X29.749 Y105.267 E.89137
G1 X29.749 Y105.801 E.0164
G1 X50.251 Y85.3 E.89137
G1 X50.251 Y85.833 E.0164
G1 X29.749 Y106.334 E.89137
G1 X29.749 Y106.868 E.0164
G1 X50.251 Y86.367 E.89137
G1 X50.251 Y86.9 E.0164
G1 X29.749 Y107.401 E.89137
G1 X29.749 Y107.935 E.0164
G1 X50.251 Y87.434 E.89137
G1 X50.251 Y87.967 E.0164
G1 X29.749 Y108.468 E.89137
G1 X29.749 Y109.002 E.0164
G1 X50.251 Y88.501 E.89137
G1 X50.251 Y89.034 E.0164
G1 X29.749 Y109.536 E.89137
G1 X29.749 Y110.069 E.0164
G1 X50.251 Y89.568 E.89137
G1 X50.251 Y90.102 E.0164
G1 X29.749 Y110.603 E.89137
G1 X29.749 Y111.136 E.0164
G1 X50.251 Y90.635 E.89137
G1 X50.251 Y91.169 E.0164
G1 X29.749 Y111.67 E.89137
G1 X29.749 Y112.203 E.0164
G1 X50.251 Y91.702 E.89137
G1 X50.251 Y92.236 E.0164
G1 X29.749 Y112.737 E.89137
G1 X29.749 Y113.271 E.0164
G1 X50.251 Y92.769 E.89137
G1 X50.251 Y93.303 E.0164
G1 X29.749 Y113.804 E.89137
G1 X29.749 Y114.338 E.0164
G1 X50.251 Y93.837 E.89137
G1 X50.251 Y94.37 E.0164
G1 X29.749 Y114.871 E.89137
G1 X29.749 Y115.405 E.0164
G1 X50.251 Y94.904 E.89137
G1 X50.251 Y95.437 E.0164
G1 X29.749 Y115.938 E.89137
G1 X29.749 Y116.472 E.0164
G1 X50.251 Y95.971 E.89137
G1 X50.251 Y96.504 E.0164
G1 X29.749 Y117.006 E.89137
G1 X29.749 Y117.539 E.0164
G1 X50.251 Y97.038 E.89137
G1 X50.251 Y97.572 E.0164
G1 X29.749 Y118.073 E.89137
G1 X29.749 Y118.606 E.0164
G1 X50.251 Y98.105 E.89137
G1 X50.251 Y98.639 E.0164
G1 X29.749 Y119.14 E.89137
M73 P34 R42
G1 X29.749 Y119.673 E.0164
G1 X50.251 Y99.172 E.89137
G1 X50.251 Y99.706 E.0164
G1 X29.749 Y120.207 E.89137
G1 X29.749 Y120.74 E.0164
G1 X50.251 Y100.239 E.89137
G1 X50.251 Y100.773 E.0164
G1 X29.749 Y121.274 E.89137
G1 X29.749 Y121.808 E.0164
G1 X50.251 Y101.307 E.89137
G1 X50.251 Y101.84 E.0164
G1 X29.749 Y122.341 E.89137
G1 X29.749 Y122.875 E.0164
G1 X50.251 Y102.374 E.89137
G1 X50.251 Y102.907 E.0164
G1 X29.749 Y123.408 E.89137
G1 X29.749 Y123.942 E.0164
G1 X50.251 Y103.441 E.89137
G1 X50.251 Y103.974 E.0164
G1 X29.749 Y124.475 E.89137
G1 X29.749 Y125.009 E.0164
G1 X50.251 Y104.508 E.89137
G1 X50.251 Y105.042 E.0164
G1 X29.749 Y125.543 E.89137
G1 X29.749 Y126.076 E.0164
G1 X50.251 Y105.575 E.89137
G1 X50.251 Y106.109 E.0164
G1 X29.749 Y126.61 E.89137
G1 X29.749 Y127.143 E.0164
G1 X50.251 Y106.642 E.89137
G1 X50.251 Y107.176 E.0164
G1 X29.749 Y127.677 E.89137
G1 X29.749 Y128.21 E.0164
G1 X50.251 Y107.709 E.89137
G1 X50.251 Y108.243 E.0164
G1 X29.749 Y128.744 E.89137
G1 X29.749 Y129.278 E.0164
G1 X50.251 Y108.777 E.89137
G1 X50.251 Y109.31 E.0164
G1 X29.749 Y129.811 E.89137
G1 X29.749 Y130.345 E.0164
G1 X50.251 Y109.844 E.89137
G1 X50.251 Y110.377 E.0164
G1 X29.58 Y131.048 E.89875
; WIPE_START
G1 X30.994 Y129.634 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X37.88 Y126.341 Z.8 F30000
G1 X50.42 Y120.345 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X43.168 Y127.598 E.31534
G2 X43.465 Y126.767 I-3.313 J-1.655 E.02721
G1 X50.251 Y119.981 E.29502
G1 X50.251 Y119.448 E.0164
G1 X43.544 Y126.155 E.2916
G2 X43.532 Y125.633 I-4.855 J-.149 E.01605
G1 X50.251 Y118.914 E.29212
G1 X50.251 Y118.381 E.0164
G1 X43.452 Y125.18 E.29561
G2 X43.327 Y124.77 I-2.109 J.417 E.01317
G1 X50.251 Y117.847 E.30101
G1 X50.251 Y117.314 E.0164
G1 X43.166 Y124.398 E.30804
G2 X42.971 Y124.059 I-1.792 J.804 E.01204
G1 X50.251 Y116.78 E.3165
G1 X50.251 Y116.246 E.0164
G1 X42.746 Y123.751 E.32628
G2 X42.492 Y123.471 I-1.521 J1.125 E.01163
G1 X50.251 Y115.713 E.33732
G1 X50.251 Y115.179 E.0164
G1 X42.21 Y123.22 E.3496
G2 X41.897 Y122.999 I-1.263 J1.459 E.01179
G1 X50.251 Y114.646 E.3632
G1 X50.251 Y114.112 E.0164
G1 X41.553 Y122.809 E.37814
G2 X41.176 Y122.653 I-.969 J1.805 E.01258
G1 X50.251 Y113.579 E.39455
G1 X50.251 Y113.045 E.0164
G1 X40.76 Y122.535 E.41262
G2 X40.299 Y122.463 I-.593 J2.269 E.01437
G1 X50.251 Y112.512 E.43266
G1 X50.251 Y111.978 E.0164
G1 X39.768 Y122.46 E.45576
G2 X39.137 Y122.558 I.303 J4.044 E.01966
G1 X50.251 Y111.444 E.4832
G1 X50.251 Y110.911 E.0164
G1 X29.749 Y131.412 E.89137
G1 X29.749 Y131.945 E.0164
G1 X36.555 Y125.14 E.29589
G2 X36.458 Y125.77 I3.104 J.799 E.01964
G1 X29.749 Y132.479 E.29168
G1 X29.749 Y133.013 E.0164
G1 X36.465 Y126.297 E.29198
G2 X36.535 Y126.761 I2.351 J-.118 E.01444
G1 X29.749 Y133.546 E.29502
G1 X29.749 Y134.08 E.0164
G1 X36.651 Y127.178 E.30008
G2 X36.808 Y127.555 I7.277 J-2.801 E.01255
G1 X29.749 Y134.613 E.30689
G1 X29.749 Y135.147 E.0164
G1 X37 Y127.897 E.31524
G2 X37.222 Y128.208 I1.669 J-.956 E.01178
G1 X29.749 Y135.68 E.3249
G1 X29.749 Y136.214 E.0164
G1 X37.473 Y128.49 E.33581
G2 X37.752 Y128.745 I1.411 J-1.27 E.01163
G1 X29.749 Y136.748 E.34796
G1 X29.749 Y137.281 E.0164
G1 X38.06 Y128.97 E.36136
G2 X38.399 Y129.165 I1.145 J-1.594 E.01203
G1 X29.749 Y137.815 E.37607
G1 X29.749 Y138.348 E.0164
G1 X38.77 Y129.328 E.3922
G2 X39.178 Y129.454 I.833 J-1.977 E.01314
G1 X29.749 Y138.882 E.40993
G1 X29.749 Y139.415 E.0164
G1 X39.635 Y129.53 E.42982
G2 X40.154 Y129.545 I.333 J-2.584 E.01599
G1 X29.749 Y139.949 E.45238
M73 P35 R42
G1 X29.749 Y140.483 E.0164
G1 X40.769 Y129.463 E.47912
G2 X41.593 Y129.173 I-.819 J-3.642 E.0269
G1 X29.749 Y141.016 E.51493
G1 X29.749 Y141.55 E.0164
G1 X50.251 Y121.049 E.89137
G1 X50.251 Y121.582 E.0164
G1 X29.749 Y142.083 E.89137
G1 X29.749 Y142.617 E.0164
G1 X50.251 Y122.116 E.89137
G1 X50.251 Y122.649 E.0164
G1 X29.749 Y143.15 E.89137
G1 X29.749 Y143.684 E.0164
G1 X50.251 Y123.183 E.89137
G1 X50.251 Y123.716 E.0164
G1 X29.749 Y144.218 E.89137
G1 X29.749 Y144.751 E.0164
G1 X50.251 Y124.25 E.89137
G1 X50.251 Y124.784 E.0164
G1 X29.749 Y145.285 E.89137
G1 X29.749 Y145.818 E.0164
G1 X50.251 Y125.317 E.89137
G1 X50.251 Y125.851 E.0164
G1 X29.749 Y146.352 E.89137
G1 X29.749 Y146.885 E.0164
G1 X50.251 Y126.384 E.89137
G1 X50.251 Y126.918 E.0164
G1 X29.749 Y147.419 E.89137
G1 X29.749 Y147.952 E.0164
G1 X50.251 Y127.451 E.89137
G1 X50.251 Y127.985 E.0164
G1 X29.749 Y148.486 E.89137
G1 X29.749 Y149.02 E.0164
G1 X50.251 Y128.519 E.89137
G1 X50.251 Y129.052 E.0164
G1 X29.749 Y149.553 E.89137
G1 X29.749 Y150.087 E.0164
G1 X50.251 Y129.586 E.89137
G1 X50.251 Y130.119 E.0164
G1 X29.749 Y150.62 E.89137
G1 X29.749 Y151.154 E.0164
G1 X50.251 Y130.653 E.89137
G1 X50.251 Y131.186 E.0164
G1 X29.749 Y151.687 E.89137
G1 X29.749 Y152.221 E.0164
G1 X50.251 Y131.72 E.89137
G1 X50.251 Y132.254 E.0164
G1 X29.749 Y152.755 E.89137
G1 X29.749 Y153.288 E.0164
G1 X50.251 Y132.787 E.89137
G1 X50.251 Y133.321 E.0164
G1 X29.749 Y153.822 E.89137
G1 X29.749 Y154.355 E.0164
G1 X50.251 Y133.854 E.89137
G1 X50.251 Y134.388 E.0164
G1 X29.749 Y154.889 E.89137
G1 X29.749 Y155.422 E.0164
G1 X50.251 Y134.921 E.89137
G1 X50.251 Y135.455 E.0164
G1 X29.749 Y155.956 E.89137
G1 X29.749 Y156.49 E.0164
G1 X50.251 Y135.989 E.89137
G1 X50.251 Y136.522 E.0164
G1 X29.749 Y157.023 E.89137
G1 X29.749 Y157.557 E.0164
G1 X50.251 Y137.056 E.89137
G1 X50.251 Y137.589 E.0164
G1 X29.749 Y158.09 E.89137
G1 X29.749 Y158.624 E.0164
G1 X50.251 Y138.123 E.89137
G1 X50.251 Y138.656 E.0164
G1 X29.749 Y159.157 E.89137
G1 X29.749 Y159.691 E.0164
G1 X50.251 Y139.19 E.89137
G1 X50.251 Y139.724 E.0164
G1 X29.749 Y160.225 E.89137
G1 X29.749 Y160.758 E.0164
G1 X50.251 Y140.257 E.89137
G1 X50.251 Y140.791 E.0164
G1 X29.749 Y161.292 E.89137
G1 X29.749 Y161.825 E.0164
G1 X50.251 Y141.324 E.89137
G1 X50.251 Y141.858 E.0164
G1 X29.749 Y162.359 E.89137
G1 X29.749 Y162.892 E.0164
G1 X50.251 Y142.391 E.89137
G1 X50.251 Y142.925 E.0164
G1 X29.749 Y163.426 E.89137
G1 X29.749 Y163.96 E.0164
G1 X50.251 Y143.458 E.89137
G1 X50.251 Y143.992 E.0164
G1 X29.749 Y164.493 E.89137
G1 X29.749 Y165.027 E.0164
G1 X50.251 Y144.526 E.89137
G1 X50.251 Y145.059 E.0164
G1 X29.749 Y165.56 E.89137
G1 X29.749 Y166.094 E.0164
G1 X50.251 Y145.593 E.89137
G1 X50.251 Y146.126 E.0164
G1 X29.749 Y166.627 E.89137
G1 X29.749 Y167.161 E.0164
G1 X50.251 Y146.66 E.89137
G1 X50.251 Y147.193 E.0164
G1 X29.749 Y167.695 E.89137
G1 X29.749 Y168.228 E.0164
G1 X50.251 Y147.727 E.89137
G1 X50.251 Y148.261 E.0164
G1 X29.749 Y168.762 E.89137
G1 X29.749 Y169.295 E.0164
G1 X50.251 Y148.794 E.89137
G1 X50.251 Y149.328 E.0164
G1 X29.749 Y169.829 E.89137
G1 X29.749 Y170.362 E.0164
G1 X50.251 Y149.861 E.89137
G1 X50.251 Y150.395 E.0164
G1 X29.749 Y170.896 E.89137
G1 X29.749 Y171.43 E.0164
G1 X50.251 Y150.928 E.89137
G1 X50.251 Y151.462 E.0164
G1 X29.749 Y171.963 E.89137
G1 X29.749 Y172.497 E.0164
G1 X50.251 Y151.996 E.89137
G1 X50.251 Y152.529 E.0164
G1 X29.749 Y173.03 E.89137
G1 X29.749 Y173.564 E.0164
G1 X50.251 Y153.063 E.89137
G1 X50.251 Y153.596 E.0164
G1 X29.749 Y174.097 E.89137
G1 X29.749 Y174.631 E.0164
G1 X50.251 Y154.13 E.89137
G1 X50.251 Y154.663 E.0164
G1 X29.749 Y175.164 E.89137
G1 X29.749 Y175.698 E.0164
G1 X50.251 Y155.197 E.89137
G1 X50.251 Y155.731 E.0164
G1 X29.749 Y176.232 E.89137
G1 X29.749 Y176.765 E.0164
G1 X50.251 Y156.264 E.89137
G1 X50.251 Y156.798 E.0164
G1 X29.749 Y177.299 E.89137
G1 X29.749 Y177.832 E.0164
G1 X50.251 Y157.331 E.89137
G1 X50.251 Y157.865 E.0164
G1 X29.749 Y178.366 E.89137
G1 X29.749 Y178.899 E.0164
G1 X50.251 Y158.398 E.89137
G1 X50.251 Y158.932 E.0164
G1 X29.749 Y179.433 E.89137
G1 X29.749 Y179.967 E.0164
G1 X50.251 Y159.466 E.89137
G1 X50.251 Y159.999 E.0164
G1 X29.749 Y180.5 E.89137
G1 X29.749 Y181.034 E.0164
G1 X50.251 Y160.533 E.89137
G1 X50.251 Y161.066 E.0164
G1 X29.749 Y181.567 E.89137
G1 X29.749 Y182.101 E.0164
G1 X50.251 Y161.6 E.89137
G1 X50.251 Y162.133 E.0164
G1 X29.749 Y182.634 E.89137
G1 X29.749 Y183.168 E.0164
G1 X50.251 Y162.667 E.89137
G1 X50.251 Y163.201 E.0164
G1 X29.749 Y183.702 E.89137
G1 X29.749 Y184.235 E.0164
G1 X50.251 Y163.734 E.89137
G1 X50.251 Y164.268 E.0164
G1 X29.749 Y184.769 E.89137
G1 X29.749 Y185.302 E.0164
G1 X50.251 Y164.801 E.89137
G1 X50.251 Y165.335 E.0164
G1 X29.749 Y185.836 E.89137
G1 X29.749 Y186.369 E.0164
G1 X50.251 Y165.868 E.89137
G1 X50.251 Y166.402 E.0164
G1 X29.749 Y186.903 E.89137
G1 X29.749 Y187.437 E.0164
G1 X50.251 Y166.935 E.89137
G1 X50.251 Y167.469 E.0164
G1 X29.749 Y187.97 E.89137
G1 X29.749 Y188.504 E.0164
G1 X50.251 Y168.003 E.89137
G1 X50.251 Y168.536 E.0164
G1 X29.749 Y189.037 E.89137
G1 X29.749 Y189.571 E.0164
G1 X50.251 Y169.07 E.89137
G1 X50.251 Y169.603 E.0164
G1 X29.749 Y190.104 E.89137
G1 X29.749 Y190.638 E.0164
G1 X50.251 Y170.137 E.89137
G1 X50.251 Y170.67 E.0164
G1 X29.749 Y191.172 E.89137
G1 X29.749 Y191.705 E.0164
G1 X50.251 Y171.204 E.89137
G1 X50.251 Y171.738 E.0164
G1 X29.749 Y192.239 E.89137
G1 X29.749 Y192.772 E.0164
G1 X50.251 Y172.271 E.89137
G1 X50.251 Y172.805 E.0164
G1 X29.749 Y193.306 E.89137
G1 X29.749 Y193.839 E.0164
G1 X50.251 Y173.338 E.89137
G1 X50.251 Y173.872 E.0164
G1 X29.749 Y194.373 E.89137
G1 X29.749 Y194.907 E.0164
G1 X50.251 Y174.405 E.89137
G1 X50.251 Y174.939 E.0164
G1 X29.749 Y195.44 E.89137
G1 X29.749 Y195.974 E.0164
G1 X50.251 Y175.473 E.89137
G1 X50.251 Y176.006 E.0164
G1 X29.749 Y196.507 E.89137
G1 X29.749 Y197.041 E.0164
G1 X50.251 Y176.54 E.89137
G1 X50.251 Y177.073 E.0164
G1 X29.749 Y197.574 E.89137
G1 X29.749 Y198.108 E.0164
G1 X50.251 Y177.607 E.89137
G1 X50.251 Y178.14 E.0164
G1 X29.749 Y198.642 E.89137
G1 X29.749 Y199.175 E.0164
G1 X50.251 Y178.674 E.89137
G1 X50.251 Y179.208 E.0164
G1 X29.749 Y199.709 E.89137
G1 X29.749 Y200.242 E.0164
G1 X50.251 Y179.741 E.89137
G1 X50.251 Y180.275 E.0164
G1 X29.749 Y200.776 E.89137
G1 X29.749 Y201.309 E.0164
G1 X50.251 Y180.808 E.89137
G1 X50.251 Y181.342 E.0164
G1 X29.749 Y201.843 E.89137
G1 X29.749 Y202.376 E.0164
G1 X50.251 Y181.875 E.89137
G1 X50.251 Y182.409 E.0164
G1 X29.749 Y202.91 E.89137
G1 X29.749 Y203.444 E.0164
G1 X50.251 Y182.943 E.89137
G1 X50.251 Y183.476 E.0164
G1 X29.749 Y203.977 E.89137
G1 X29.749 Y204.511 E.0164
G1 X50.251 Y184.01 E.89137
G1 X50.251 Y184.543 E.0164
G1 X29.749 Y205.044 E.89137
G1 X29.749 Y205.578 E.0164
G1 X50.251 Y185.077 E.89137
G1 X50.251 Y185.61 E.0164
G1 X29.749 Y206.111 E.89137
G1 X29.749 Y206.645 E.0164
G1 X50.251 Y186.144 E.89137
G1 X50.251 Y186.678 E.0164
G1 X29.749 Y207.179 E.89137
G1 X29.749 Y207.712 E.0164
G1 X50.251 Y187.211 E.89137
G1 X50.251 Y187.745 E.0164
G1 X29.749 Y208.246 E.89137
G1 X29.749 Y208.779 E.0164
G1 X50.251 Y188.278 E.89137
G1 X50.251 Y188.812 E.0164
G1 X29.749 Y209.313 E.89137
G1 X29.749 Y209.846 E.0164
G1 X50.251 Y189.345 E.89137
G1 X50.251 Y189.879 E.0164
G1 X29.749 Y210.38 E.89137
G1 X29.749 Y210.914 E.0164
G1 X50.251 Y190.413 E.89137
G1 X50.251 Y190.946 E.0164
G1 X29.749 Y211.447 E.89137
G1 X29.749 Y211.981 E.0164
G1 X50.251 Y191.48 E.89137
G1 X50.251 Y192.013 E.0164
G1 X29.58 Y212.684 E.89875
; WIPE_START
G1 X30.994 Y211.27 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X37.606 Y207.456 Z.8 F30000
G1 X54.947 Y197.455 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X43.345 Y209.057 E.50445
G2 X43.515 Y208.353 I-3.39 J-1.194 E.02231
G1 X54.244 Y197.624 E.46645
G1 X53.71 Y197.624 E.0164
G1 X43.547 Y207.787 E.44186
G2 X43.501 Y207.3 I-2.463 J-.01 E.01506
G1 X53.176 Y197.624 E.42069
G1 X52.643 Y197.624 E.0164
G1 X43.403 Y206.864 E.40174
G2 X43.262 Y206.472 I-6.623 J2.168 E.01282
G1 X52.109 Y197.624 E.38469
G1 X51.576 Y197.624 E.0164
G1 X43.083 Y206.117 E.36926
G2 X42.873 Y205.793 I-1.726 J.888 E.01188
G1 X51.042 Y197.624 E.35518
G1 X50.509 Y197.624 E.0164
G1 X42.634 Y205.499 E.34237
G2 X42.367 Y205.233 I-1.463 J1.202 E.01162
G1 X50.251 Y197.349 E.34278
G1 X50.251 Y196.815 E.0164
G1 X42.071 Y204.995 E.35564
G2 X41.746 Y204.787 I-1.203 J1.522 E.0119
G1 X50.251 Y196.282 E.36979
G1 X50.251 Y195.748 E.0164
G1 X41.389 Y204.61 E.3853
G2 X40.997 Y204.468 I-.907 J1.889 E.01283
G1 X50.251 Y195.215 E.40233
G1 X50.251 Y194.681 E.0164
G1 X40.561 Y204.37 E.42128
G2 X40.07 Y204.328 I-.456 J2.437 E.01519
G1 X50.251 Y194.147 E.44266
G1 X50.251 Y193.614 E.0164
G1 X39.502 Y204.363 E.46735
G2 X38.793 Y204.538 I.539 J3.698 E.02249
G1 X50.251 Y193.08 E.49818
G1 X50.251 Y192.547 E.0164
G1 X29.749 Y213.048 E.89137
G1 X29.749 Y213.581 E.0164
G1 X36.659 Y206.672 E.30042
G2 X36.485 Y207.38 I4.218 J1.415 E.02244
G1 X29.749 Y214.115 E.29284
G1 X29.749 Y214.649 E.0164
G1 X36.453 Y207.945 E.29145
G2 X36.495 Y208.437 I4.627 J-.146 E.01518
G1 X29.749 Y215.182 E.29327
G1 X29.749 Y215.716 E.0164
G1 X36.595 Y208.87 E.29763
G2 X36.736 Y209.263 I2.033 J-.507 E.01285
G1 X29.749 Y216.249 E.30375
G1 X29.749 Y216.783 E.0164
G1 X36.912 Y209.621 E.3114
G2 X37.119 Y209.947 I1.731 J-.873 E.0119
G1 X29.749 Y217.316 E.32043
G1 X29.749 Y217.85 E.0164
G1 X37.356 Y210.243 E.33074
G2 X37.622 Y210.511 I1.471 J-1.194 E.01162
G1 X30.007 Y218.126 E.33108
G1 X30.541 Y218.126 E.0164
G1 X37.916 Y210.75 E.32067
G2 X38.241 Y210.959 I6.514 J-9.757 E.01187
G1 X31.075 Y218.126 E.31158
G1 X31.608 Y218.126 E.0164
G1 X38.598 Y211.136 E.30392
G2 X38.991 Y211.276 I.9 J-1.896 E.01285
G1 X32.142 Y218.126 E.29781
G1 X32.675 Y218.126 E.0164
G1 X39.425 Y211.376 E.29348
G2 X39.909 Y211.425 I.491 J-2.394 E.01498
G1 X33.209 Y218.126 E.29132
G1 X33.742 Y218.126 E.0164
G1 X40.478 Y211.39 E.29285
G2 X41.181 Y211.22 I-.49 J-3.571 E.02229
G1 X34.276 Y218.126 E.30024
G1 X34.81 Y218.126 E.0164
G1 X55.311 Y197.624 E.89137
G1 X55.844 Y197.624 E.0164
G1 X35.343 Y218.126 E.89137
G1 X35.877 Y218.126 E.0164
G1 X56.378 Y197.624 E.89137
G1 X56.911 Y197.624 E.0164
G1 X36.41 Y218.126 E.89137
G1 X36.944 Y218.126 E.0164
G1 X57.445 Y197.624 E.89137
G1 X57.979 Y197.624 E.0164
G1 X37.477 Y218.126 E.89137
G1 X38.011 Y218.126 E.0164
G1 X58.512 Y197.624 E.89137
G1 X59.046 Y197.624 E.0164
G1 X38.545 Y218.126 E.89137
G1 X39.078 Y218.126 E.0164
G1 X59.579 Y197.624 E.89137
G1 X60.113 Y197.624 E.0164
G1 X39.612 Y218.126 E.89137
G1 X40.145 Y218.126 E.0164
G1 X60.646 Y197.624 E.89137
G1 X61.18 Y197.624 E.0164
G1 X40.679 Y218.126 E.89137
G1 X41.212 Y218.126 E.0164
G1 X61.713 Y197.624 E.89137
G1 X62.247 Y197.624 E.0164
G1 X41.746 Y218.126 E.89137
G1 X42.28 Y218.126 E.0164
G1 X62.781 Y197.624 E.89137
G1 X63.314 Y197.624 E.0164
G1 X42.813 Y218.126 E.89137
G1 X43.347 Y218.126 E.0164
G1 X63.848 Y197.624 E.89137
G1 X64.381 Y197.624 E.0164
G1 X43.88 Y218.126 E.89137
G1 X44.414 Y218.126 E.0164
G1 X64.915 Y197.624 E.89137
G1 X65.448 Y197.624 E.0164
G1 X44.947 Y218.126 E.89137
G1 X45.481 Y218.126 E.0164
G1 X65.982 Y197.624 E.89137
G1 X66.516 Y197.624 E.0164
G1 X46.015 Y218.126 E.89137
G1 X46.548 Y218.126 E.0164
G1 X67.049 Y197.624 E.89137
G1 X67.583 Y197.624 E.0164
G1 X47.082 Y218.126 E.89137
G1 X47.615 Y218.126 E.0164
G1 X68.116 Y197.624 E.89137
G1 X68.65 Y197.624 E.0164
G1 X48.149 Y218.126 E.89137
G1 X48.682 Y218.126 E.0164
G1 X69.183 Y197.624 E.89137
G1 X69.717 Y197.624 E.0164
G1 X49.216 Y218.126 E.89137
G1 X49.75 Y218.126 E.0164
G1 X70.251 Y197.624 E.89137
G1 X70.784 Y197.624 E.0164
G1 X50.283 Y218.126 E.89137
G1 X50.817 Y218.126 E.0164
G1 X71.318 Y197.624 E.89137
G1 X71.851 Y197.624 E.0164
G1 X51.35 Y218.126 E.89137
G1 X51.884 Y218.126 E.0164
G1 X72.385 Y197.624 E.89137
G1 X72.918 Y197.624 E.0164
G1 X52.417 Y218.126 E.89137
G1 X52.951 Y218.126 E.0164
G1 X73.452 Y197.624 E.89137
G1 X73.986 Y197.624 E.0164
G1 X53.484 Y218.126 E.89137
G1 X54.018 Y218.126 E.0164
G1 X74.519 Y197.624 E.89137
G1 X75.053 Y197.624 E.0164
G1 X54.552 Y218.126 E.89137
G1 X55.085 Y218.126 E.0164
G1 X75.586 Y197.624 E.89137
G1 X76.12 Y197.624 E.0164
G1 X55.619 Y218.126 E.89137
G1 X56.152 Y218.126 E.0164
G1 X76.653 Y197.624 E.89137
G1 X77.187 Y197.624 E.0164
G1 X56.686 Y218.126 E.89137
G1 X57.219 Y218.126 E.0164
G1 X77.721 Y197.624 E.89137
G1 X78.254 Y197.624 E.0164
G1 X57.753 Y218.126 E.89137
G1 X58.287 Y218.126 E.0164
G1 X78.788 Y197.624 E.89137
G1 X79.321 Y197.624 E.0164
G1 X58.82 Y218.126 E.89137
G1 X59.354 Y218.126 E.0164
G1 X79.855 Y197.624 E.89137
G1 X80.388 Y197.624 E.0164
G1 X59.887 Y218.126 E.89137
G1 X60.421 Y218.126 E.0164
G1 X80.922 Y197.624 E.89137
G1 X81.456 Y197.624 E.0164
G1 X60.954 Y218.126 E.89137
G1 X61.488 Y218.126 E.0164
G1 X81.989 Y197.624 E.89137
G1 X82.523 Y197.624 E.0164
G1 X62.022 Y218.126 E.89137
G1 X62.555 Y218.126 E.0164
G1 X83.056 Y197.624 E.89137
G1 X83.59 Y197.624 E.0164
G1 X63.089 Y218.126 E.89137
G1 X63.622 Y218.126 E.0164
G1 X84.123 Y197.624 E.89137
G1 X84.657 Y197.624 E.0164
G1 X64.156 Y218.126 E.89137
G1 X64.689 Y218.126 E.0164
G1 X85.191 Y197.624 E.89137
G1 X85.724 Y197.624 E.0164
G1 X65.223 Y218.126 E.89137
G1 X65.757 Y218.126 E.0164
G1 X86.258 Y197.624 E.89137
G1 X86.791 Y197.624 E.0164
G1 X66.29 Y218.126 E.89137
G1 X66.824 Y218.126 E.0164
G1 X87.325 Y197.624 E.89137
G1 X87.858 Y197.624 E.0164
G1 X67.357 Y218.126 E.89137
G1 X67.891 Y218.126 E.0164
G1 X88.392 Y197.624 E.89137
G1 X88.925 Y197.624 E.0164
G1 X68.424 Y218.126 E.89137
G1 X68.958 Y218.126 E.0164
G1 X89.459 Y197.624 E.89137
G1 X89.993 Y197.624 E.0164
G1 X69.492 Y218.126 E.89137
G1 X70.025 Y218.126 E.0164
G1 X90.526 Y197.624 E.89137
G1 X91.06 Y197.624 E.0164
G1 X70.559 Y218.126 E.89137
G1 X71.092 Y218.126 E.0164
G1 X91.593 Y197.624 E.89137
G1 X92.127 Y197.624 E.0164
G1 X71.626 Y218.126 E.89137
G1 X72.159 Y218.126 E.0164
G1 X92.66 Y197.624 E.89137
G1 X93.194 Y197.624 E.0164
G1 X72.693 Y218.126 E.89137
G1 X73.227 Y218.126 E.0164
G1 X93.728 Y197.624 E.89137
G1 X94.261 Y197.624 E.0164
G1 X73.76 Y218.126 E.89137
G1 X74.294 Y218.126 E.0164
G1 X94.795 Y197.624 E.89137
G1 X95.328 Y197.624 E.0164
G1 X74.827 Y218.126 E.89137
G1 X75.361 Y218.126 E.0164
G1 X95.862 Y197.624 E.89137
G1 X96.395 Y197.624 E.0164
G1 X75.894 Y218.126 E.89137
G1 X76.428 Y218.126 E.0164
G1 X96.929 Y197.624 E.89137
G1 X97.463 Y197.624 E.0164
G1 X76.962 Y218.126 E.89137
G1 X77.495 Y218.126 E.0164
G1 X97.996 Y197.624 E.89137
G1 X98.53 Y197.624 E.0164
G1 X78.029 Y218.126 E.89137
G1 X78.562 Y218.126 E.0164
G1 X99.063 Y197.624 E.89137
G1 X99.597 Y197.624 E.0164
G1 X79.096 Y218.126 E.89137
G1 X79.629 Y218.126 E.0164
G1 X100.13 Y197.624 E.89137
G1 X100.664 Y197.624 E.0164
G1 X80.163 Y218.126 E.89137
G1 X80.696 Y218.126 E.0164
G1 X101.198 Y197.624 E.89137
G1 X101.731 Y197.624 E.0164
G1 X81.23 Y218.126 E.89137
G1 X81.764 Y218.126 E.0164
G1 X102.265 Y197.624 E.89137
G1 X102.798 Y197.624 E.0164
G1 X82.297 Y218.126 E.89137
G1 X82.831 Y218.126 E.0164
G1 X103.332 Y197.624 E.89137
G1 X103.865 Y197.624 E.0164
G1 X83.364 Y218.126 E.89137
G1 X83.898 Y218.126 E.0164
G1 X104.399 Y197.624 E.89137
G1 X104.933 Y197.624 E.0164
G1 X84.431 Y218.126 E.89137
G1 X84.965 Y218.126 E.0164
G1 X105.466 Y197.624 E.89137
G1 X106 Y197.624 E.0164
G1 X85.499 Y218.126 E.89137
G1 X86.032 Y218.126 E.0164
G1 X106.533 Y197.624 E.89137
G1 X107.067 Y197.624 E.0164
G1 X86.566 Y218.126 E.89137
G1 X87.099 Y218.126 E.0164
G1 X107.6 Y197.624 E.89137
G1 X108.134 Y197.624 E.0164
G1 X87.633 Y218.126 E.89137
G1 X88.166 Y218.126 E.0164
G1 X108.668 Y197.624 E.89137
G1 X109.201 Y197.624 E.0164
G1 X88.7 Y218.126 E.89137
G1 X89.234 Y218.126 E.0164
G1 X109.735 Y197.624 E.89137
G1 X110.268 Y197.624 E.0164
G1 X89.767 Y218.126 E.89137
G1 X90.301 Y218.126 E.0164
G1 X110.802 Y197.624 E.89137
G1 X111.335 Y197.624 E.0164
G1 X90.834 Y218.126 E.89137
G1 X91.368 Y218.126 E.0164
G1 X111.869 Y197.624 E.89137
G1 X112.403 Y197.624 E.0164
G1 X91.901 Y218.126 E.89137
G1 X92.435 Y218.126 E.0164
G1 X112.936 Y197.624 E.89137
G1 X113.47 Y197.624 E.0164
G1 X92.969 Y218.126 E.89137
G1 X93.502 Y218.126 E.0164
G1 X114.003 Y197.624 E.89137
G1 X114.537 Y197.624 E.0164
G1 X94.036 Y218.126 E.89137
G1 X94.569 Y218.126 E.0164
G1 X115.07 Y197.624 E.89137
G1 X115.604 Y197.624 E.0164
G1 X95.103 Y218.126 E.89137
G1 X95.636 Y218.126 E.0164
G1 X116.138 Y197.624 E.89137
M73 P36 R42
G1 X116.671 Y197.624 E.0164
G1 X96.17 Y218.126 E.89137
G1 X96.704 Y218.126 E.0164
G1 X117.205 Y197.624 E.89137
G1 X117.738 Y197.624 E.0164
G1 X97.237 Y218.126 E.89137
G1 X97.771 Y218.126 E.0164
G1 X118.272 Y197.624 E.89137
G1 X118.805 Y197.624 E.0164
G1 X98.304 Y218.126 E.89137
G1 X98.838 Y218.126 E.0164
G1 X119.339 Y197.624 E.89137
G1 X119.872 Y197.624 E.0164
G1 X99.371 Y218.126 E.89137
G1 X99.905 Y218.126 E.0164
G1 X120.406 Y197.624 E.89137
G1 X120.94 Y197.624 E.0164
G1 X100.439 Y218.126 E.89137
G1 X100.972 Y218.126 E.0164
G1 X121.473 Y197.624 E.89137
G1 X122.007 Y197.624 E.0164
G1 X101.506 Y218.126 E.89137
G1 X102.039 Y218.126 E.0164
G1 X122.54 Y197.624 E.89137
G1 X123.074 Y197.624 E.0164
G1 X102.573 Y218.126 E.89137
G1 X103.106 Y218.126 E.0164
G1 X123.607 Y197.624 E.89137
G1 X124.141 Y197.624 E.0164
G1 X103.64 Y218.126 E.89137
G1 X104.174 Y218.126 E.0164
G1 X124.675 Y197.624 E.89137
G1 X125.208 Y197.624 E.0164
G1 X104.707 Y218.126 E.89137
G1 X105.241 Y218.126 E.0164
G1 X125.742 Y197.624 E.89137
G1 X126.275 Y197.624 E.0164
G1 X105.774 Y218.126 E.89137
G1 X106.308 Y218.126 E.0164
G1 X126.809 Y197.624 E.89137
G1 X127.342 Y197.624 E.0164
G1 X106.841 Y218.126 E.89137
G1 X107.375 Y218.126 E.0164
G1 X127.876 Y197.624 E.89137
G1 X128.41 Y197.624 E.0164
G1 X107.909 Y218.126 E.89137
G1 X108.442 Y218.126 E.0164
G1 X128.943 Y197.624 E.89137
G1 X129.477 Y197.624 E.0164
G1 X108.976 Y218.126 E.89137
G1 X109.509 Y218.126 E.0164
G1 X130.01 Y197.624 E.89137
G1 X130.544 Y197.624 E.0164
G1 X110.043 Y218.126 E.89137
G1 X110.576 Y218.126 E.0164
G1 X131.077 Y197.624 E.89137
G1 X131.611 Y197.624 E.0164
G1 X111.11 Y218.126 E.89137
G1 X111.643 Y218.126 E.0164
G1 X132.145 Y197.624 E.89137
G1 X132.678 Y197.624 E.0164
G1 X112.007 Y218.295 E.89875
G1 X122.145 Y218.295 F30000
G1 F15000
G1 X129.24 Y211.201 E.30847
G3 X128.522 Y211.385 I-1.304 J-3.595 E.02281
G1 X121.781 Y218.126 E.29309
G1 X121.248 Y218.126 E.0164
G1 X127.949 Y211.425 E.29135
G3 X127.458 Y211.381 I.158 J-4.593 E.01514
G1 X120.714 Y218.126 E.29323
G1 X120.181 Y218.126 E.0164
G1 X127.021 Y211.285 E.29744
G3 X126.626 Y211.146 I.494 J-2.047 E.0129
G1 X119.647 Y218.126 E.30344
G1 X119.113 Y218.126 E.0164
G1 X126.266 Y210.973 E.31101
G3 X125.939 Y210.767 I.866 J-1.741 E.01192
G1 X118.58 Y218.126 E.31996
G1 X118.046 Y218.126 E.0164
G1 X125.642 Y210.53 E.33025
G3 X125.374 Y210.264 I1.197 J-1.473 E.01162
G1 X117.513 Y218.126 E.34181
G1 X116.979 Y218.126 E.0164
G1 X125.135 Y209.97 E.35461
G3 X124.925 Y209.646 I1.514 J-1.21 E.01188
G1 X116.446 Y218.126 E.36869
G1 X115.912 Y218.126 E.0164
G1 X124.747 Y209.29 E.38414
G3 X124.604 Y208.9 I1.885 J-.912 E.01281
G1 X115.378 Y218.126 E.40112
G1 X114.845 Y218.126 E.0164
G1 X124.501 Y208.469 E.41985
G3 X124.453 Y207.984 I4.402 J-.684 E.015
G1 X114.311 Y218.126 E.44094
G1 X113.778 Y218.126 E.0164
G1 X124.48 Y207.423 E.46534
G3 X124.642 Y206.728 I3.861 J.53 E.02196
G1 X113.244 Y218.126 E.49555
G1 X112.711 Y218.126 E.0164
G1 X133.212 Y197.624 E.89137
G1 X133.745 Y197.624 E.0164
G1 X126.857 Y204.513 E.29951
G3 X127.548 Y204.355 I1.365 J4.379 E.02184
G1 X134.279 Y197.624 E.29264
G1 X134.812 Y197.624 E.0164
G1 X128.108 Y204.329 E.29152
G3 X128.596 Y204.375 I.017 J2.467 E.0151
G1 X135.346 Y197.624 E.29349
G1 X135.88 Y197.624 E.0164
G1 X129.026 Y204.478 E.29797
G3 X129.415 Y204.622 I-.527 J2.019 E.01278
G1 X136.413 Y197.624 E.30425
G1 X136.947 Y197.624 E.0164
G1 X129.77 Y204.801 E.31203
G3 X130.093 Y205.011 I-.891 J1.724 E.01188
G1 X137.48 Y197.624 E.32117
G1 X138.014 Y197.624 E.0164
G1 X130.387 Y205.251 E.33159
G3 X130.653 Y205.519 I-1.204 J1.457 E.01162
G1 X138.547 Y197.624 E.34325
G1 X139.081 Y197.624 E.0164
G1 X130.89 Y205.815 E.35614
G3 X131.098 Y206.141 I-1.525 J1.202 E.0119
G1 X139.615 Y197.624 E.3703
G1 X140.148 Y197.624 E.0164
G1 X131.274 Y206.499 E.38584
G3 X131.411 Y206.895 I-1.915 J.884 E.01292
G1 X140.682 Y197.624 E.40308
G1 X141.215 Y197.624 E.0164
G1 X131.506 Y207.334 E.42216
G3 X131.549 Y207.824 I-2.431 J.462 E.01515
G1 X141.749 Y197.624 E.44347
G1 X142.282 Y197.624 E.0164
G1 X131.508 Y208.398 E.46844
G3 X131.322 Y209.118 I-3.518 J-.525 E.02289
G1 X142.816 Y197.624 E.49972
G1 X143.35 Y197.624 E.0164
G1 X122.848 Y218.126 E.89137
G1 X123.382 Y218.126 E.0164
G1 X143.883 Y197.624 E.89137
G1 X144.417 Y197.624 E.0164
G1 X123.916 Y218.126 E.89137
G1 X124.449 Y218.126 E.0164
G1 X144.95 Y197.624 E.89137
G1 X145.484 Y197.624 E.0164
G1 X124.983 Y218.126 E.89137
G1 X125.516 Y218.126 E.0164
G1 X146.017 Y197.624 E.89137
G1 X146.551 Y197.624 E.0164
G1 X126.05 Y218.126 E.89137
G1 X126.583 Y218.126 E.0164
G1 X147.084 Y197.624 E.89137
G1 X147.618 Y197.624 E.0164
G1 X127.117 Y218.126 E.89137
G1 X127.651 Y218.126 E.0164
G1 X148.152 Y197.624 E.89137
G1 X148.685 Y197.624 E.0164
G1 X128.184 Y218.126 E.89137
G1 X128.718 Y218.126 E.0164
G1 X149.219 Y197.624 E.89137
G1 X149.752 Y197.624 E.0164
G1 X129.251 Y218.126 E.89137
G1 X129.785 Y218.126 E.0164
G1 X150.286 Y197.624 E.89137
G1 X150.819 Y197.624 E.0164
G1 X130.318 Y218.126 E.89137
G1 X130.852 Y218.126 E.0164
G1 X151.353 Y197.624 E.89137
G1 X151.887 Y197.624 E.0164
G1 X131.386 Y218.126 E.89137
G1 X131.919 Y218.126 E.0164
G1 X152.42 Y197.624 E.89137
G1 X152.954 Y197.624 E.0164
G1 X132.453 Y218.126 E.89137
G1 X132.986 Y218.126 E.0164
G1 X153.487 Y197.624 E.89137
G1 X154.021 Y197.624 E.0164
G1 X133.52 Y218.126 E.89137
G1 X134.053 Y218.126 E.0164
G1 X154.554 Y197.624 E.89137
G1 X155.088 Y197.624 E.0164
G1 X134.587 Y218.126 E.89137
G1 X135.121 Y218.126 E.0164
G1 X155.622 Y197.624 E.89137
G1 X156.155 Y197.624 E.0164
G1 X135.654 Y218.126 E.89137
G1 X136.188 Y218.126 E.0164
G1 X156.689 Y197.624 E.89137
G1 X157.222 Y197.624 E.0164
G1 X136.721 Y218.126 E.89137
G1 X137.255 Y218.126 E.0164
G1 X157.756 Y197.624 E.89137
G1 X158.289 Y197.624 E.0164
G1 X137.788 Y218.126 E.89137
G1 X138.322 Y218.126 E.0164
G1 X158.823 Y197.624 E.89137
M73 P36 R41
G1 X159.357 Y197.624 E.0164
G1 X138.855 Y218.126 E.89137
G1 X139.389 Y218.126 E.0164
G1 X159.89 Y197.624 E.89137
G1 X160.424 Y197.624 E.0164
G1 X139.923 Y218.126 E.89137
G1 X140.456 Y218.126 E.0164
G1 X160.957 Y197.624 E.89137
G1 X161.491 Y197.624 E.0164
G1 X140.99 Y218.126 E.89137
G1 X141.523 Y218.126 E.0164
G1 X162.024 Y197.624 E.89137
G1 X162.558 Y197.624 E.0164
G1 X142.057 Y218.126 E.89137
G1 X142.59 Y218.126 E.0164
G1 X163.092 Y197.624 E.89137
G1 X163.625 Y197.624 E.0164
G1 X143.124 Y218.126 E.89137
G1 X143.658 Y218.126 E.0164
G1 X164.159 Y197.624 E.89137
G1 X164.692 Y197.624 E.0164
G1 X144.191 Y218.126 E.89137
G1 X144.725 Y218.126 E.0164
G1 X165.226 Y197.624 E.89137
G1 X165.759 Y197.624 E.0164
G1 X145.258 Y218.126 E.89137
G1 X145.792 Y218.126 E.0164
G1 X166.293 Y197.624 E.89137
G1 X166.827 Y197.624 E.0164
G1 X146.325 Y218.126 E.89137
G1 X146.859 Y218.126 E.0164
G1 X167.36 Y197.624 E.89137
G1 X167.894 Y197.624 E.0164
G1 X147.393 Y218.126 E.89137
G1 X147.926 Y218.126 E.0164
G1 X168.427 Y197.624 E.89137
G1 X168.961 Y197.624 E.0164
G1 X148.46 Y218.126 E.89137
G1 X148.993 Y218.126 E.0164
G1 X169.494 Y197.624 E.89137
G1 X170.028 Y197.624 E.0164
G1 X149.527 Y218.126 E.89137
G1 X150.06 Y218.126 E.0164
G1 X170.562 Y197.624 E.89137
G1 X171.095 Y197.624 E.0164
G1 X150.594 Y218.126 E.89137
G1 X151.128 Y218.126 E.0164
G1 X171.629 Y197.624 E.89137
G1 X172.162 Y197.624 E.0164
G1 X151.661 Y218.126 E.89137
G1 X152.195 Y218.126 E.0164
G1 X172.696 Y197.624 E.89137
G1 X173.229 Y197.624 E.0164
G1 X152.728 Y218.126 E.89137
G1 X153.262 Y218.126 E.0164
G1 X173.763 Y197.624 E.89137
G1 X174.296 Y197.624 E.0164
G1 X153.795 Y218.126 E.89137
G1 X154.329 Y218.126 E.0164
G1 X174.83 Y197.624 E.89137
G1 X175.364 Y197.624 E.0164
G1 X154.863 Y218.126 E.89137
G1 X155.396 Y218.126 E.0164
G1 X175.897 Y197.624 E.89137
G1 X176.431 Y197.624 E.0164
G1 X155.93 Y218.126 E.89137
G1 X156.463 Y218.126 E.0164
G1 X176.964 Y197.624 E.89137
G1 X177.498 Y197.624 E.0164
G1 X156.997 Y218.126 E.89137
G1 X157.53 Y218.126 E.0164
G1 X178.031 Y197.624 E.89137
G1 X178.565 Y197.624 E.0164
G1 X158.064 Y218.126 E.89137
G1 X158.598 Y218.126 E.0164
G1 X179.099 Y197.624 E.89137
G1 X179.632 Y197.624 E.0164
G1 X159.131 Y218.126 E.89137
G1 X159.665 Y218.126 E.0164
G1 X180.166 Y197.624 E.89137
G1 X180.699 Y197.624 E.0164
G1 X160.198 Y218.126 E.89137
G1 X160.732 Y218.126 E.0164
G1 X181.233 Y197.624 E.89137
G1 X181.766 Y197.624 E.0164
G1 X161.265 Y218.126 E.89137
G1 X161.799 Y218.126 E.0164
G1 X182.3 Y197.624 E.89137
G1 X182.834 Y197.624 E.0164
G1 X162.333 Y218.126 E.89137
G1 X162.866 Y218.126 E.0164
G1 X183.367 Y197.624 E.89137
G1 X183.901 Y197.624 E.0164
G1 X163.4 Y218.126 E.89137
G1 X163.933 Y218.126 E.0164
G1 X184.434 Y197.624 E.89137
G1 X184.968 Y197.624 E.0164
G1 X164.467 Y218.126 E.89137
G1 X165 Y218.126 E.0164
G1 X185.501 Y197.624 E.89137
G1 X186.035 Y197.624 E.0164
G1 X165.534 Y218.126 E.89137
G1 X166.067 Y218.126 E.0164
G1 X186.569 Y197.624 E.89137
G1 X187.102 Y197.624 E.0164
G1 X166.601 Y218.126 E.89137
G1 X167.135 Y218.126 E.0164
G1 X187.636 Y197.624 E.89137
G1 X188.169 Y197.624 E.0164
G1 X167.668 Y218.126 E.89137
G1 X168.202 Y218.126 E.0164
G1 X188.703 Y197.624 E.89137
G1 X189.236 Y197.624 E.0164
G1 X168.735 Y218.126 E.89137
G1 X169.269 Y218.126 E.0164
G1 X189.77 Y197.624 E.89137
G1 X190.304 Y197.624 E.0164
G1 X169.802 Y218.126 E.89137
G1 X170.336 Y218.126 E.0164
G1 X190.837 Y197.624 E.89137
G1 X191.371 Y197.624 E.0164
G1 X170.87 Y218.126 E.89137
G1 X171.403 Y218.126 E.0164
G1 X191.904 Y197.624 E.89137
G1 X192.438 Y197.624 E.0164
G1 X171.937 Y218.126 E.89137
G1 X172.47 Y218.126 E.0164
G1 X192.971 Y197.624 E.89137
G1 X193.505 Y197.624 E.0164
G1 X173.004 Y218.126 E.89137
G1 X173.537 Y218.126 E.0164
G1 X194.039 Y197.624 E.89137
G1 X194.572 Y197.624 E.0164
G1 X174.071 Y218.126 E.89137
G1 X174.605 Y218.126 E.0164
G1 X195.106 Y197.624 E.89137
G1 X195.639 Y197.624 E.0164
G1 X175.138 Y218.126 E.89137
G1 X175.672 Y218.126 E.0164
G1 X196.173 Y197.624 E.89137
G1 X196.706 Y197.624 E.0164
G1 X176.205 Y218.126 E.89137
G1 X176.739 Y218.126 E.0164
G1 X197.24 Y197.624 E.89137
G1 X197.774 Y197.624 E.0164
G1 X177.272 Y218.126 E.89137
G1 X177.806 Y218.126 E.0164
G1 X198.307 Y197.624 E.89137
G1 X198.841 Y197.624 E.0164
G1 X178.34 Y218.126 E.89137
G1 X178.873 Y218.126 E.0164
G1 X199.374 Y197.624 E.89137
G1 X199.908 Y197.624 E.0164
G1 X179.407 Y218.126 E.89137
G1 X179.94 Y218.126 E.0164
G1 X200.441 Y197.624 E.89137
G1 X200.975 Y197.624 E.0164
G1 X180.474 Y218.126 E.89137
G1 X181.007 Y218.126 E.0164
G1 X201.509 Y197.624 E.89137
G1 X202.042 Y197.624 E.0164
G1 X181.541 Y218.126 E.89137
G1 X182.075 Y218.126 E.0164
G1 X202.576 Y197.624 E.89137
G1 X203.109 Y197.624 E.0164
G1 X182.608 Y218.126 E.89137
G1 X183.142 Y218.126 E.0164
G1 X203.643 Y197.624 E.89137
G1 X204.176 Y197.624 E.0164
G1 X183.675 Y218.126 E.89137
G1 X184.209 Y218.126 E.0164
G1 X204.71 Y197.624 E.89137
G1 X205.243 Y197.624 E.0164
G1 X184.573 Y218.295 E.89875
; WIPE_START
G1 X185.987 Y216.881 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X180.333 Y211.753 Z.8 F30000
G1 X29.58 Y75.023 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X70.729 Y33.874 E1.78911
G1 X70.195 Y33.874 E.0164
G1 X29.749 Y74.32 E1.75854
G1 X29.749 Y73.786 E.0164
G1 X69.661 Y33.874 E1.73534
G1 X69.128 Y33.874 E.0164
G1 X29.749 Y73.253 E1.71214
G1 X29.749 Y72.719 E.0164
G1 X68.594 Y33.874 E1.68894
G1 X68.061 Y33.874 E.0164
G1 X29.749 Y72.186 E1.66574
G1 X29.749 Y71.652 E.0164
G1 X67.527 Y33.874 E1.64254
G1 X66.994 Y33.874 E.0164
G1 X29.749 Y71.119 E1.61934
G1 X29.749 Y70.585 E.0164
G1 X66.46 Y33.874 E1.59614
G1 X65.927 Y33.874 E.0164
G1 X29.749 Y70.051 E1.57294
G1 X29.749 Y69.518 E.0164
G1 X65.393 Y33.874 E1.54975
G1 X64.859 Y33.874 E.0164
G1 X29.749 Y68.984 E1.52655
G1 X29.749 Y68.451 E.0164
G1 X64.326 Y33.874 E1.50335
G1 X63.792 Y33.874 E.0164
G1 X29.749 Y67.917 E1.48015
G1 X29.749 Y67.384 E.0164
G1 X63.259 Y33.874 E1.45695
G1 X62.725 Y33.874 E.0164
G1 X29.749 Y66.85 E1.43375
G1 X29.749 Y66.317 E.0164
G1 X62.192 Y33.874 E1.41055
G1 X61.658 Y33.874 E.0164
G1 X29.749 Y65.783 E1.38735
G1 X29.749 Y65.249 E.0164
G1 X61.124 Y33.874 E1.36415
G1 X60.591 Y33.874 E.0164
G1 X29.749 Y64.716 E1.34095
G1 X29.749 Y64.182 E.0164
G1 X60.057 Y33.874 E1.31775
G1 X59.524 Y33.874 E.0164
G1 X29.749 Y63.649 E1.29456
G1 X29.749 Y63.115 E.0164
G1 X58.99 Y33.874 E1.27136
G1 X58.457 Y33.874 E.0164
G1 X29.749 Y62.582 E1.24816
G1 X29.749 Y62.048 E.0164
G1 X57.923 Y33.874 E1.22496
G1 X57.389 Y33.874 E.0164
G1 X29.749 Y61.514 E1.20176
G1 X29.749 Y60.981 E.0164
G1 X56.856 Y33.874 E1.17856
G1 X56.322 Y33.874 E.0164
G1 X29.749 Y60.447 E1.15536
G1 X29.749 Y59.914 E.0164
G1 X55.789 Y33.874 E1.13216
G1 X55.255 Y33.874 E.0164
G1 X29.749 Y59.38 E1.10896
G1 X29.749 Y58.847 E.0164
G1 X41.098 Y47.498 E.49341
G3 X40.414 Y47.648 I-1.104 J-3.402 E.02154
G1 X29.749 Y58.313 E.4637
G1 X29.749 Y57.779 E.0164
G1 X39.857 Y47.671 E.43948
G3 X39.378 Y47.617 I.031 J-2.419 E.01486
G1 X29.749 Y57.246 E.41864
G1 X29.749 Y56.712 E.0164
G1 X38.948 Y47.514 E.39994
G3 X38.558 Y47.37 I.525 J-2.018 E.01279
G1 X29.749 Y56.179 E.383
G1 X29.749 Y55.645 E.0164
G1 X38.206 Y47.189 E.36767
G3 X37.885 Y46.976 I.903 J-1.705 E.01185
G1 X29.749 Y55.112 E.35374
G1 X29.749 Y54.578 E.0164
G1 X37.594 Y46.733 E.34107
G3 X37.331 Y46.463 I1.219 J-1.448 E.01162
G1 X29.749 Y54.044 E.32964
G1 X29.749 Y53.511 E.0164
G1 X37.097 Y46.164 E.31945
G3 X36.892 Y45.835 I1.539 J-1.186 E.01193
G1 X29.749 Y52.977 E.31055
G1 X29.749 Y52.444 E.0164
G1 X36.719 Y45.474 E.30304
G3 X36.582 Y45.078 I1.912 J-.885 E.01291
G1 X29.749 Y51.91 E.29706
G1 X29.749 Y51.377 E.0164
G1 X36.487 Y44.64 E.29292
G3 X36.453 Y44.14 I2.48 J-.419 E.01543
G1 X29.749 Y50.843 E.29145
G1 X29.749 Y50.309 E.0164
G1 X36.494 Y43.565 E.29326
G3 X36.697 Y42.828 I3.855 J.666 E.02352
G1 X29.749 Y49.776 E.30208
G1 X29.749 Y49.242 E.0164
G1 X45.117 Y33.874 E.66818
G1 X45.651 Y33.874 E.0164
G1 X38.701 Y40.824 E.30216
G3 X39.435 Y40.624 I1.278 J3.239 E.02343
G1 X46.184 Y33.874 E.29346
G1 X46.718 Y33.874 E.0164
G1 X40.015 Y40.577 E.29142
G3 X40.512 Y40.614 I.063 J2.499 E.01533
G1 X47.252 Y33.874 E.29304
G1 X47.785 Y33.874 E.0164
G1 X40.955 Y40.705 E.29697
G3 X41.35 Y40.843 I-2.237 J7.034 E.01288
G1 X48.319 Y33.874 E.30297
G1 X48.852 Y33.874 E.0164
G1 X41.71 Y41.016 E.31053
G3 X42.039 Y41.222 I-.861 J1.742 E.01192
G1 X49.386 Y33.874 E.31945
G1 X49.919 Y33.874 E.0164
G1 X42.337 Y41.457 E.32967
G3 X42.607 Y41.72 I-1.181 J1.482 E.01162
G1 X50.453 Y33.874 E.34112
G1 X50.987 Y33.874 E.0164
G1 X42.849 Y42.012 E.3538
G3 X43.062 Y42.333 I-1.502 J1.226 E.01186
G1 X51.52 Y33.874 E.36776
G1 X52.054 Y33.874 E.0164
G1 X43.244 Y42.685 E.38306
G3 X43.391 Y43.071 I-1.853 J.93 E.01273
G1 X52.587 Y33.874 E.39984
G1 X53.121 Y33.874 E.0164
G1 X43.493 Y43.502 E.41859
G3 X43.545 Y43.984 I-2.39 J.498 E.01494
G1 X53.654 Y33.874 E.43957
G1 X54.188 Y33.874 E.0164
G1 X43.525 Y44.537 E.46361
G3 X43.377 Y45.219 I-4.094 J-.534 E.02149
G1 X54.891 Y33.705 E.50065
G1 X29.58 Y34.472 F30000
G1 F15000
G1 X30.177 Y33.874 E.02598
G1 X30.711 Y33.874 E.0164
G1 X29.749 Y34.836 E.04181
G1 X29.749 Y35.37 E.0164
G1 X31.245 Y33.874 E.065
G1 X31.778 Y33.874 E.0164
G1 X29.749 Y35.903 E.0882
G1 X29.749 Y36.437 E.0164
G1 X32.312 Y33.874 E.1114
G1 X32.845 Y33.874 E.0164
G1 X29.749 Y36.97 E.1346
G1 X29.749 Y37.504 E.0164
G1 X33.379 Y33.874 E.1578
G1 X33.912 Y33.874 E.0164
G1 X29.749 Y38.037 E.181
G1 X29.749 Y38.571 E.0164
G1 X34.446 Y33.874 E.2042
G1 X34.98 Y33.874 E.0164
G1 X29.749 Y39.105 E.2274
G1 X29.749 Y39.638 E.0164
G1 X35.513 Y33.874 E.2506
G1 X36.047 Y33.874 E.0164
G1 X29.749 Y40.172 E.2738
G1 X29.749 Y40.705 E.0164
G1 X36.58 Y33.874 E.297
G1 X37.114 Y33.874 E.0164
G1 X29.749 Y41.239 E.32019
G1 X29.749 Y41.772 E.0164
G1 X37.647 Y33.874 E.34339
G1 X38.181 Y33.874 E.0164
G1 X29.749 Y42.306 E.36659
G1 X29.749 Y42.839 E.0164
G1 X38.714 Y33.874 E.38979
G1 X39.248 Y33.874 E.0164
G1 X29.749 Y43.373 E.41299
G1 X29.749 Y43.907 E.0164
G1 X39.782 Y33.874 E.43619
G1 X40.315 Y33.874 E.0164
G1 X29.749 Y44.44 E.45939
G1 X29.749 Y44.974 E.0164
G1 X40.849 Y33.874 E.48259
G1 X41.382 Y33.874 E.0164
G1 X29.749 Y45.507 E.50579
G1 X29.749 Y46.041 E.0164
G1 X41.916 Y33.874 E.52899
M73 P37 R41
G1 X42.449 Y33.874 E.0164
G1 X29.749 Y46.574 E.55219
G1 X29.749 Y47.108 E.0164
G1 X42.983 Y33.874 E.57538
G1 X43.517 Y33.874 E.0164
G1 X29.749 Y47.642 E.59858
G1 X29.749 Y48.175 E.0164
G1 X44.05 Y33.874 E.62178
G1 X44.584 Y33.874 E.0164
G1 X29.58 Y48.878 E.65236
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
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
G1 F16213.044
G1 X126.679 Y204.948 E.00624
G3 X127.7 Y204.674 I1.33 J2.928 E.03522
G3 X128.872 Y204.777 I.315 J3.132 E.03924
G3 X126.394 Y205.095 I-.862 J3.098 E.58519
G1 X126.457 Y205.058 E.00241
G1 X126.995 Y205.254 F30000
G1 F16213.044
G1 X127.106 Y205.215 E.0039
G3 X127.731 Y205.08 I.901 J2.66 E.02123
G3 X128.761 Y205.17 I.282 J2.739 E.03452
G3 X126.846 Y205.318 I-.753 J2.706 E.52038
G1 X126.94 Y205.278 E.00339
G1 X127.423 Y205.547 F30000
G1 F16213.044
G1 X127.466 Y205.536 E.00148
G3 X127.761 Y205.486 I.542 J2.339 E.00992
G3 X128.417 Y205.509 I.24 J2.594 E.02184
G3 X127.014 Y205.689 I-.409 J2.366 E.45277
G1 X127.366 Y205.566 E.01238
G1 X127.78 Y205.879 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X127.79 Y205.877 E.00033
G3 X128.15 Y205.87 I.215 J1.793 E.01108
G3 X127.553 Y205.918 I-.141 J2.004 E.36943
G1 X127.721 Y205.889 E.00521
; WIPE_START
M204 S10000
G1 X127.79 Y205.877 E-.02689
G1 X128.15 Y205.87 E-.13677
G1 X128.544 Y205.94 E-.15214
G1 X128.917 Y206.086 E-.15209
G1 X129.253 Y206.303 E-.15215
G1 X129.404 Y206.436 E-.07615
G1 X129.512 Y206.565 E-.0638
; WIPE_END
G1 E-.04 F1800
G1 X137.143 Y206.427 Z1 F30000
G1 X214.509 Y205.028 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X214.679 Y204.948 E.00623
G3 X215.7 Y204.675 I1.33 J2.928 E.03522
G3 X216.872 Y204.777 I.315 J3.133 E.03924
G3 X214.395 Y205.094 I-.862 J3.098 E.5852
G1 X214.457 Y205.058 E.00241
G1 X214.996 Y205.254 F30000
G1 F16213.044
G1 X215.106 Y205.215 E.0039
G3 X215.731 Y205.08 I.901 J2.66 E.02123
G3 X216.761 Y205.17 I.282 J2.74 E.03452
G3 X214.846 Y205.318 I-.753 J2.706 E.52037
G1 X214.94 Y205.278 E.0034
G1 X215.423 Y205.547 F30000
G1 F16213.044
G1 X215.466 Y205.536 E.00148
G3 X215.761 Y205.486 I.542 J2.339 E.00992
G3 X216.417 Y205.509 I.24 J2.593 E.02184
G3 X215.014 Y205.689 I-.409 J2.366 E.45277
G1 X215.366 Y205.566 E.01238
G1 X215.787 Y205.878 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X215.79 Y205.877 E.0001
G3 X216.15 Y205.87 I.215 J1.793 E.01108
G3 X215.553 Y205.918 I-.141 J2.004 E.36943
G1 X215.728 Y205.888 E.00544
; WIPE_START
M204 S10000
G1 X215.79 Y205.877 E-.02404
G1 X216.15 Y205.87 E-.13678
G1 X216.544 Y205.94 E-.15215
G1 X216.917 Y206.086 E-.15208
G1 X217.253 Y206.303 E-.15215
G1 X217.404 Y206.436 E-.07614
G1 X217.516 Y206.57 E-.06665
; WIPE_END
G1 E-.04 F1800
G1 X217.463 Y198.938 Z1 F30000
G1 X216.93 Y122.922 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X217.176 Y123.004 E.0086
G3 X215.7 Y122.799 I-1.166 J2.997 E.6204
G3 X216.871 Y122.902 I.315 J3.134 E.03923
G1 X216.873 Y122.903 E.00005
G1 X216.412 Y123.223 F30000
G1 F16213.044
G1 X216.488 Y123.232 E.00254
G3 X216.761 Y123.295 I-.475 J2.713 E.0093
G3 X215.731 Y123.205 I-.753 J2.706 E.55089
G3 X216.21 Y123.198 I.282 J2.74 E.01592
G1 X216.353 Y123.215 E.00476
G1 X216.033 Y123.607 F30000
G1 F16213.044
G1 X216.179 Y123.606 E.00485
G3 X216.417 Y123.634 I-.178 J2.599 E.00795
G3 X215.761 Y123.611 I-.409 J2.366 E.47856
G1 X215.973 Y123.608 E.00704
G1 X215.786 Y124.003 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X215.79 Y124.002 E.00014
G3 X216.15 Y123.995 I.215 J1.794 E.01108
G3 X215.553 Y124.043 I-.141 J2.004 E.36943
G1 X215.727 Y124.013 E.0054
; WIPE_START
M204 S10000
G1 X215.79 Y124.002 E-.02455
G1 X216.15 Y123.995 E-.13678
G1 X216.544 Y124.065 E-.15211
G1 X216.917 Y124.211 E-.15212
G1 X217.253 Y124.428 E-.15214
G1 X217.521 Y124.69 E-.14229
; WIPE_END
G1 E-.04 F1800
G1 X217.246 Y117.062 Z1 F30000
G1 X214.508 Y41.278 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X214.679 Y41.198 E.00627
G3 X215.7 Y40.924 I1.33 J2.928 E.03522
G3 X216.871 Y41.027 I.315 J3.134 E.03924
G3 X214.395 Y41.344 I-.862 J3.098 E.5852
G1 X214.456 Y41.308 E.00238
G1 X214.995 Y41.504 F30000
G1 F16213.044
G1 X215.106 Y41.465 E.00392
G3 X215.731 Y41.33 I.901 J2.66 E.02123
G3 X216.761 Y41.42 I.282 J2.741 E.03452
G3 X214.846 Y41.568 I-.753 J2.706 E.52038
G1 X214.94 Y41.528 E.00337
G1 X215.422 Y41.797 F30000
G1 F16213.044
G1 X215.466 Y41.786 E.00151
G3 X215.761 Y41.736 I.542 J2.339 E.00992
G3 X216.417 Y41.759 I.24 J2.594 E.02184
G3 X215.014 Y41.939 I-.409 J2.366 E.45277
G1 X215.365 Y41.817 E.01235
G1 X215.786 Y42.128 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X215.79 Y42.127 E.00013
G3 X216.15 Y42.12 I.215 J1.794 E.01108
G3 X215.553 Y42.168 I-.141 J2.004 E.36943
G1 X215.727 Y42.138 E.00542
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
G1 F16213.044
G1 X126.679 Y41.198 E.00625
G3 X127.7 Y40.924 I1.33 J2.928 E.03522
G3 X128.872 Y41.027 I.315 J3.132 E.03924
G3 X126.395 Y41.344 I-.862 J3.098 E.58519
G1 X126.457 Y41.308 E.00239
G1 X126.995 Y41.504 F30000
G1 F16213.044
G1 X127.106 Y41.465 E.00391
G3 X127.731 Y41.33 I.901 J2.66 E.02124
G3 X128.761 Y41.42 I.282 J2.739 E.03452
G3 X126.846 Y41.568 I-.754 J2.706 E.52037
G1 X126.94 Y41.528 E.00338
G1 X127.422 Y41.797 F30000
G1 F16213.044
G1 X127.466 Y41.786 E.0015
G3 X127.761 Y41.736 I.542 J2.339 E.00993
G3 X128.417 Y41.759 I.24 J2.593 E.02184
G3 X127.014 Y41.939 I-.409 J2.366 E.45277
G1 X127.366 Y41.817 E.01236
G1 X127.786 Y42.128 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X127.79 Y42.127 E.00013
G3 X128.15 Y42.12 I.215 J1.794 E.01108
G3 X127.553 Y42.168 I-.141 J2.004 E.36943
G1 X127.727 Y42.138 E.00542
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
G1 F16213.044
G1 X41.176 Y41.129 E.00862
G3 X39.7 Y40.924 I-1.167 J2.997 E.62039
G3 X40.872 Y41.027 I.315 J3.132 E.03924
G1 X40.873 Y41.028 E.00003
G1 X40.412 Y41.348 F30000
G1 F16213.044
G1 X40.488 Y41.357 E.00255
G3 X40.761 Y41.42 I-.475 J2.712 E.0093
G3 X39.731 Y41.33 I-.754 J2.706 E.55088
G3 X40.21 Y41.323 I.282 J2.739 E.01592
G1 X40.352 Y41.34 E.00475
G1 X40.033 Y41.732 F30000
G1 F16213.044
G1 X40.179 Y41.731 E.00486
G3 X40.417 Y41.759 I-.178 J2.599 E.00795
G3 X39.761 Y41.736 I-.409 J2.366 E.47856
G1 X39.973 Y41.733 E.00703
G1 X39.786 Y42.128 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X39.79 Y42.127 E.00014
G3 X40.15 Y42.12 I.215 J1.794 E.01108
G3 X39.553 Y42.168 I-.141 J2.004 E.36943
G1 X39.727 Y42.138 E.00541
; WIPE_START
M204 S10000
G1 X39.79 Y42.127 E-.02452
G1 X40.15 Y42.12 E-.13677
G1 X40.349 Y42.145 E-.0762
G1 X40.734 Y42.254 E-.15212
G1 X41.091 Y42.436 E-.15211
G1 X41.404 Y42.686 E-.1521
G1 X41.516 Y42.819 E-.06619
; WIPE_END
G1 E-.04 F1800
G1 X47.07 Y48.054 Z1 F30000
G1 X205.416 Y197.291 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X50.584 Y197.291 E5.13608
G1 X50.584 Y54.709 E4.72972
G1 X205.416 Y54.709 E5.13608
G1 X205.416 Y197.231 E4.72773
G1 X205.009 Y196.884 F30000
G1 F16213.044
G1 X50.991 Y196.884 E5.10907
G1 X50.991 Y55.116 E4.70271
G1 X205.009 Y55.116 E5.10907
G1 X205.009 Y196.824 E4.70072
G1 X204.602 Y196.477 F30000
G1 F16213.044
G1 X51.398 Y196.477 E5.08206
G1 X51.398 Y55.523 E4.67571
G1 X204.602 Y55.523 E5.08206
G1 X204.602 Y196.417 E4.67372
G1 X204.21 Y196.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X51.79 Y196.085 E4.68344
G1 X51.79 Y55.915 E4.30703
G1 X204.21 Y55.915 E4.68344
G1 X204.21 Y196.025 E4.30519
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
G1 F16213.044
G1 X38.679 Y123.073 E.00625
G3 X39.7 Y122.799 I1.33 J2.928 E.03522
G3 X40.872 Y122.902 I.315 J3.133 E.03924
G3 X38.395 Y123.219 I-.862 J3.098 E.5852
G1 X38.457 Y123.183 E.00239
G1 X38.995 Y123.379 F30000
G1 F16213.044
G1 X39.106 Y123.34 E.00391
G3 X39.731 Y123.205 I.901 J2.66 E.02123
G3 X40.761 Y123.295 I.282 J2.74 E.03452
G3 X38.846 Y123.443 I-.753 J2.706 E.52038
G1 X38.94 Y123.403 E.00338
G1 X39.422 Y123.672 F30000
G1 F16213.044
G1 X39.466 Y123.661 E.0015
G3 X39.761 Y123.611 I.542 J2.339 E.00992
G3 X40.417 Y123.634 I.24 J2.594 E.02184
G3 X39.014 Y123.814 I-.409 J2.366 E.45277
G1 X39.366 Y123.692 E.01236
G1 X39.786 Y124.003 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X39.79 Y124.002 E.00013
G3 X40.15 Y123.995 I.215 J1.794 E.01108
G3 X39.553 Y124.043 I-.141 J2.004 E.36943
G1 X39.727 Y124.013 E.00542
; WIPE_START
M204 S10000
G1 X39.79 Y124.002 E-.02439
G1 X40.15 Y123.995 E-.13677
G1 X40.544 Y124.065 E-.15211
G1 X40.917 Y124.211 E-.15213
G1 X41.253 Y124.428 E-.15214
G1 X41.522 Y124.69 E-.14245
; WIPE_END
G1 E-.04 F1800
G1 X41.236 Y132.317 Z1 F30000
G1 X38.509 Y205.027 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X38.679 Y204.948 E.00623
G3 X39.7 Y204.675 I1.33 J2.928 E.03521
G3 X40.872 Y204.777 I.315 J3.132 E.03925
G3 X38.395 Y205.094 I-.862 J3.099 E.58529
G1 X38.457 Y205.058 E.00241
G1 X38.996 Y205.254 F30000
G1 F16213.044
G1 X39.106 Y205.215 E.00389
G3 X39.73 Y205.08 I.901 J2.66 E.02123
G3 X40.761 Y205.17 I.282 J2.739 E.03452
G3 X38.846 Y205.318 I-.753 J2.706 E.52037
G1 X38.941 Y205.278 E.0034
G1 X39.423 Y205.547 F30000
G1 F16213.044
G1 X39.466 Y205.536 E.00147
G3 X39.761 Y205.486 I.542 J2.339 E.00992
G3 X40.417 Y205.509 I.24 J2.594 E.02184
G3 X39.014 Y205.689 I-.409 J2.366 E.45277
G1 X39.366 Y205.566 E.01238
G1 X39.787 Y205.878 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X39.79 Y205.877 E.0001
G3 X40.15 Y205.87 I.215 J1.793 E.01108
G3 X39.553 Y205.918 I-.141 J2.004 E.36943
G1 X39.728 Y205.888 E.00544
; WIPE_START
M204 S10000
G1 X39.79 Y205.877 E-.02408
G1 X40.15 Y205.87 E-.13678
G1 X40.544 Y205.94 E-.15214
G1 X40.917 Y206.086 E-.15209
G1 X41.253 Y206.303 E-.15215
G1 X41.404 Y206.436 E-.07614
G1 X41.516 Y206.57 E-.06662
; WIPE_END
G1 E-.04 F1800
G1 X49.133 Y207.059 Z1 F30000
G1 X226.584 Y218.459 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X29.416 Y218.459 E6.54041
G1 X29.416 Y33.541 E6.13406
G1 X226.584 Y33.541 E6.54041
G1 X226.584 Y218.399 E6.13207
G1 X226.991 Y218.866 F30000
G1 F16213.044
G1 X29.009 Y218.866 E6.56742
G1 X29.009 Y33.134 E6.16106
G1 X226.991 Y33.134 E6.56742
G1 X226.991 Y218.806 E6.15907
G1 X227.398 Y219.273 F30000
G1 F16213.044
G1 X28.602 Y219.273 E6.59442
G1 X28.602 Y32.727 E6.18807
G1 X227.398 Y32.727 E6.59442
G1 X227.398 Y219.213 E6.18608
G1 X227.79 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X28.21 Y219.665 E6.13254
G1 X28.21 Y32.335 E5.75613
G1 X227.79 Y32.335 E6.13254
G1 X227.79 Y219.605 E5.75429
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
G1 F15000
G1 X200.16 Y197.624 E.89875
G1 X199.627 Y197.624 E.0164
G1 X220.128 Y218.126 E.89137
G1 X219.594 Y218.126 E.0164
G1 X199.093 Y197.624 E.89137
G1 X198.56 Y197.624 E.0164
G1 X219.061 Y218.126 E.89137
G1 X218.527 Y218.126 E.0164
G1 X198.026 Y197.624 E.89137
G1 X197.492 Y197.624 E.0164
G1 X217.994 Y218.126 E.89137
G1 X217.46 Y218.126 E.0164
G1 X196.959 Y197.624 E.89137
G1 X196.425 Y197.624 E.0164
G1 X216.926 Y218.126 E.89137
G1 X216.393 Y218.126 E.0164
G1 X195.892 Y197.624 E.89137
G1 X195.358 Y197.624 E.0164
G1 X215.859 Y218.126 E.89137
G1 X215.326 Y218.126 E.0164
G1 X194.825 Y197.624 E.89137
G1 X194.291 Y197.624 E.0164
G1 X214.792 Y218.126 E.89137
G1 X214.259 Y218.126 E.0164
G1 X193.758 Y197.624 E.89137
G1 X193.224 Y197.624 E.0164
G1 X213.725 Y218.126 E.89137
G1 X213.191 Y218.126 E.0164
G1 X192.69 Y197.624 E.89137
G1 X192.157 Y197.624 E.0164
G1 X212.658 Y218.126 E.89137
G1 X212.124 Y218.126 E.0164
G1 X191.623 Y197.624 E.89137
G1 X191.09 Y197.624 E.0164
G1 X211.591 Y218.126 E.89137
G1 X211.057 Y218.126 E.0164
G1 X190.556 Y197.624 E.89137
G1 X190.023 Y197.624 E.0164
G1 X210.524 Y218.126 E.89137
G1 X209.99 Y218.126 E.0164
G1 X189.489 Y197.624 E.89137
G1 X188.955 Y197.624 E.0164
G1 X209.456 Y218.126 E.89137
G1 X208.923 Y218.126 E.0164
M73 P37 R40
G1 X188.422 Y197.624 E.89137
G1 X187.888 Y197.624 E.0164
G1 X208.389 Y218.126 E.89137
G1 X207.856 Y218.126 E.0164
G1 X187.355 Y197.624 E.89137
G1 X186.821 Y197.624 E.0164
G1 X207.322 Y218.126 E.89137
G1 X206.789 Y218.126 E.0164
G1 X186.288 Y197.624 E.89137
G1 X185.754 Y197.624 E.0164
G1 X206.255 Y218.126 E.89137
G1 X205.721 Y218.126 E.0164
G1 X185.22 Y197.624 E.89137
G1 X184.687 Y197.624 E.0164
G1 X205.188 Y218.126 E.89137
G1 X204.654 Y218.126 E.0164
G1 X184.153 Y197.624 E.89137
G1 X183.62 Y197.624 E.0164
G1 X204.121 Y218.126 E.89137
G1 X203.587 Y218.126 E.0164
G1 X183.086 Y197.624 E.89137
G1 X182.553 Y197.624 E.0164
G1 X203.054 Y218.126 E.89137
G1 X202.52 Y218.126 E.0164
G1 X182.019 Y197.624 E.89137
G1 X181.485 Y197.624 E.0164
G1 X201.987 Y218.126 E.89137
G1 X201.453 Y218.126 E.0164
G1 X180.952 Y197.624 E.89137
G1 X180.418 Y197.624 E.0164
G1 X200.919 Y218.126 E.89137
G1 X200.386 Y218.126 E.0164
G1 X179.885 Y197.624 E.89137
G1 X179.351 Y197.624 E.0164
G1 X199.852 Y218.126 E.89137
G1 X199.319 Y218.126 E.0164
G1 X178.818 Y197.624 E.89137
G1 X178.284 Y197.624 E.0164
G1 X198.785 Y218.126 E.89137
G1 X198.252 Y218.126 E.0164
G1 X177.75 Y197.624 E.89137
G1 X177.217 Y197.624 E.0164
G1 X197.718 Y218.126 E.89137
G1 X197.184 Y218.126 E.0164
G1 X176.683 Y197.624 E.89137
G1 X176.15 Y197.624 E.0164
G1 X196.651 Y218.126 E.89137
G1 X196.117 Y218.126 E.0164
G1 X175.616 Y197.624 E.89137
G1 X175.083 Y197.624 E.0164
G1 X195.584 Y218.126 E.89137
G1 X195.05 Y218.126 E.0164
G1 X174.549 Y197.624 E.89137
G1 X174.015 Y197.624 E.0164
G1 X194.517 Y218.126 E.89137
G1 X193.983 Y218.126 E.0164
G1 X173.482 Y197.624 E.89137
G1 X172.948 Y197.624 E.0164
G1 X193.449 Y218.126 E.89137
G1 X192.916 Y218.126 E.0164
G1 X172.415 Y197.624 E.89137
G1 X171.881 Y197.624 E.0164
G1 X192.382 Y218.126 E.89137
G1 X191.849 Y218.126 E.0164
G1 X171.348 Y197.624 E.89137
G1 X170.814 Y197.624 E.0164
G1 X191.315 Y218.126 E.89137
G1 X190.782 Y218.126 E.0164
G1 X170.28 Y197.624 E.89137
G1 X169.747 Y197.624 E.0164
G1 X190.248 Y218.126 E.89137
G1 X189.714 Y218.126 E.0164
G1 X169.213 Y197.624 E.89137
G1 X168.68 Y197.624 E.0164
G1 X189.181 Y218.126 E.89137
G1 X188.647 Y218.126 E.0164
G1 X168.146 Y197.624 E.89137
G1 X167.613 Y197.624 E.0164
G1 X188.114 Y218.126 E.89137
G1 X187.58 Y218.126 E.0164
G1 X167.079 Y197.624 E.89137
M73 P38 R40
G1 X166.546 Y197.624 E.0164
G1 X187.047 Y218.126 E.89137
G1 X186.513 Y218.126 E.0164
G1 X166.012 Y197.624 E.89137
G1 X165.478 Y197.624 E.0164
G1 X185.979 Y218.126 E.89137
G1 X185.446 Y218.126 E.0164
G1 X164.945 Y197.624 E.89137
G1 X164.411 Y197.624 E.0164
G1 X184.912 Y218.126 E.89137
G1 X184.379 Y218.126 E.0164
G1 X163.878 Y197.624 E.89137
G1 X163.344 Y197.624 E.0164
G1 X183.845 Y218.126 E.89137
G1 X183.312 Y218.126 E.0164
G1 X162.811 Y197.624 E.89137
G1 X162.277 Y197.624 E.0164
G1 X182.778 Y218.126 E.89137
G1 X182.244 Y218.126 E.0164
G1 X161.743 Y197.624 E.89137
G1 X161.21 Y197.624 E.0164
G1 X181.711 Y218.126 E.89137
G1 X181.177 Y218.126 E.0164
G1 X160.676 Y197.624 E.89137
G1 X160.143 Y197.624 E.0164
G1 X180.644 Y218.126 E.89137
G1 X180.11 Y218.126 E.0164
G1 X159.609 Y197.624 E.89137
G1 X159.076 Y197.624 E.0164
G1 X179.577 Y218.126 E.89137
G1 X179.043 Y218.126 E.0164
G1 X158.542 Y197.624 E.89137
G1 X158.008 Y197.624 E.0164
G1 X178.509 Y218.126 E.89137
G1 X177.976 Y218.126 E.0164
G1 X157.475 Y197.624 E.89137
G1 X156.941 Y197.624 E.0164
G1 X177.442 Y218.126 E.89137
G1 X176.909 Y218.126 E.0164
G1 X156.408 Y197.624 E.89137
G1 X155.874 Y197.624 E.0164
G1 X176.375 Y218.126 E.89137
G1 X175.842 Y218.126 E.0164
G1 X155.341 Y197.624 E.89137
G1 X154.807 Y197.624 E.0164
G1 X175.308 Y218.126 E.89137
G1 X174.775 Y218.126 E.0164
G1 X154.273 Y197.624 E.89137
G1 X153.74 Y197.624 E.0164
G1 X174.241 Y218.126 E.89137
G1 X173.707 Y218.126 E.0164
G1 X153.206 Y197.624 E.89137
G1 X152.673 Y197.624 E.0164
G1 X173.174 Y218.126 E.89137
G1 X172.64 Y218.126 E.0164
G1 X152.139 Y197.624 E.89137
G1 X151.606 Y197.624 E.0164
G1 X172.107 Y218.126 E.89137
G1 X171.573 Y218.126 E.0164
G1 X151.072 Y197.624 E.89137
G1 X150.538 Y197.624 E.0164
G1 X171.04 Y218.126 E.89137
G1 X170.506 Y218.126 E.0164
G1 X150.005 Y197.624 E.89137
G1 X149.471 Y197.624 E.0164
G1 X169.972 Y218.126 E.89137
G1 X169.439 Y218.126 E.0164
G1 X148.938 Y197.624 E.89137
G1 X148.404 Y197.624 E.0164
G1 X168.905 Y218.126 E.89137
G1 X168.372 Y218.126 E.0164
G1 X147.871 Y197.624 E.89137
G1 X147.337 Y197.624 E.0164
G1 X167.838 Y218.126 E.89137
G1 X167.305 Y218.126 E.0164
G1 X146.803 Y197.624 E.89137
G1 X146.27 Y197.624 E.0164
G1 X166.771 Y218.126 E.89137
G1 X166.237 Y218.126 E.0164
G1 X145.736 Y197.624 E.89137
G1 X145.203 Y197.624 E.0164
G1 X165.704 Y218.126 E.89137
G1 X165.17 Y218.126 E.0164
G1 X144.669 Y197.624 E.89137
G1 X144.136 Y197.624 E.0164
G1 X164.637 Y218.126 E.89137
G1 X164.103 Y218.126 E.0164
G1 X143.602 Y197.624 E.89137
G1 X143.068 Y197.624 E.0164
G1 X163.57 Y218.126 E.89137
G1 X163.036 Y218.126 E.0164
G1 X142.535 Y197.624 E.89137
G1 X142.001 Y197.624 E.0164
G1 X162.502 Y218.126 E.89137
G1 X161.969 Y218.126 E.0164
G1 X141.468 Y197.624 E.89137
G1 X140.934 Y197.624 E.0164
G1 X161.435 Y218.126 E.89137
G1 X160.902 Y218.126 E.0164
G1 X140.401 Y197.624 E.89137
G1 X139.867 Y197.624 E.0164
G1 X160.368 Y218.126 E.89137
G1 X159.835 Y218.126 E.0164
G1 X139.334 Y197.624 E.89137
G1 X138.8 Y197.624 E.0164
G1 X159.301 Y218.126 E.89137
G1 X158.767 Y218.126 E.0164
G1 X138.266 Y197.624 E.89137
G1 X137.733 Y197.624 E.0164
G1 X158.234 Y218.126 E.89137
G1 X157.7 Y218.126 E.0164
G1 X137.199 Y197.624 E.89137
G1 X136.666 Y197.624 E.0164
G1 X157.167 Y218.126 E.89137
G1 X156.633 Y218.126 E.0164
G1 X136.132 Y197.624 E.89137
G1 X135.599 Y197.624 E.0164
G1 X156.1 Y218.126 E.89137
G1 X155.566 Y218.126 E.0164
G1 X135.065 Y197.624 E.89137
G1 X134.531 Y197.624 E.0164
G1 X155.032 Y218.126 E.89137
G1 X154.499 Y218.126 E.0164
G1 X133.998 Y197.624 E.89137
G1 X133.464 Y197.624 E.0164
G1 X153.965 Y218.126 E.89137
G1 X153.432 Y218.126 E.0164
G1 X132.931 Y197.624 E.89137
G1 X132.397 Y197.624 E.0164
G1 X152.898 Y218.126 E.89137
G1 X152.365 Y218.126 E.0164
G1 X131.864 Y197.624 E.89137
G1 X131.33 Y197.624 E.0164
G1 X151.831 Y218.126 E.89137
G1 X151.297 Y218.126 E.0164
G1 X130.796 Y197.624 E.89137
G1 X130.263 Y197.624 E.0164
G1 X150.764 Y218.126 E.89137
G1 X150.23 Y218.126 E.0164
G1 X129.729 Y197.624 E.89137
G1 X129.196 Y197.624 E.0164
G1 X149.697 Y218.126 E.89137
G1 X149.163 Y218.126 E.0164
G1 X128.662 Y197.624 E.89137
G1 X128.129 Y197.624 E.0164
G1 X148.63 Y218.126 E.89137
G1 X148.096 Y218.126 E.0164
G1 X127.595 Y197.624 E.89137
G1 X127.061 Y197.624 E.0164
G1 X147.563 Y218.126 E.89137
G1 X147.029 Y218.126 E.0164
G1 X126.528 Y197.624 E.89137
G1 X125.994 Y197.624 E.0164
G1 X146.495 Y218.126 E.89137
G1 X145.962 Y218.126 E.0164
G1 X125.461 Y197.624 E.89137
G1 X124.927 Y197.624 E.0164
G1 X145.428 Y218.126 E.89137
G1 X144.895 Y218.126 E.0164
G1 X124.394 Y197.624 E.89137
G1 X123.86 Y197.624 E.0164
G1 X144.361 Y218.126 E.89137
G1 X143.828 Y218.126 E.0164
G1 X123.326 Y197.624 E.89137
G1 X122.793 Y197.624 E.0164
G1 X143.294 Y218.126 E.89137
G1 X142.76 Y218.126 E.0164
G1 X131.354 Y206.719 E.49593
G3 X131.518 Y207.417 I-3.472 J1.184 E.02206
G1 X142.227 Y218.126 E.4656
G1 X141.693 Y218.126 E.0164
G1 X131.546 Y207.979 E.44117
G3 X131.498 Y208.464 I-2.453 J.003 E.01503
G1 X141.16 Y218.126 E.42006
G1 X140.626 Y218.126 E.0164
G1 X131.4 Y208.899 E.40116
G3 X131.256 Y209.289 I-6.67 J-2.233 E.01278
G1 X140.093 Y218.126 E.3842
G1 X139.559 Y218.126 E.0164
G1 X131.077 Y209.643 E.36881
G3 X130.866 Y209.966 I-1.723 J-.894 E.01187
G1 X139.025 Y218.126 E.35476
G1 X138.492 Y218.126 E.0164
G1 X130.626 Y210.26 E.34199
G3 X130.358 Y210.525 I-1.462 J-1.21 E.01162
G1 X137.958 Y218.126 E.33046
G1 X137.425 Y218.126 E.0164
G1 X130.061 Y210.762 E.32016
G3 X129.735 Y210.969 I-1.201 J-1.529 E.0119
G1 X136.891 Y218.126 E.31115
G1 X136.358 Y218.126 E.0164
G1 X129.377 Y211.145 E.3035
G3 X128.985 Y211.286 I-.901 J-1.891 E.01284
G1 X135.824 Y218.126 E.29737
G1 X135.29 Y218.126 E.0164
G1 X128.546 Y211.382 E.29322
G3 X128.053 Y211.422 I-.449 J-2.446 E.01523
G1 X134.757 Y218.126 E.29146
G1 X134.223 Y218.126 E.0164
G1 X127.484 Y211.386 E.29303
G3 X126.765 Y211.201 I.567 J-3.693 E.02284
G1 X133.69 Y218.126 E.30107
G1 X133.156 Y218.126 E.0164
G1 X112.655 Y197.624 E.89137
G1 X113.189 Y197.624 E.0164
G1 X124.669 Y209.105 E.49915
G3 X124.486 Y208.389 I2.238 J-.951 E.0228
G1 X113.722 Y197.624 E.46802
G1 X114.256 Y197.624 E.0164
G1 X124.453 Y207.821 E.44336
G3 X124.492 Y207.327 I4.889 J.137 E.01526
G1 X114.789 Y197.624 E.42185
G1 X115.323 Y197.624 E.0164
G1 X124.591 Y206.892 E.40296
G3 X124.731 Y206.499 I2.036 J.501 E.01287
G1 X115.856 Y197.624 E.38584
G1 X116.39 Y197.624 E.0164
G1 X124.906 Y206.14 E.37025
G3 X125.112 Y205.813 I1.734 J.868 E.01191
G1 X116.924 Y197.624 E.35604
G1 X117.457 Y197.624 E.0164
G1 X125.349 Y205.516 E.34312
G3 X125.614 Y205.247 I1.476 J1.191 E.01162
G1 X117.991 Y197.624 E.33144
G1 X118.524 Y197.624 E.0164
G1 X125.907 Y205.007 E.32099
G3 X126.23 Y204.796 I6.728 J9.953 E.01185
G1 X119.058 Y197.624 E.31183
G1 X119.591 Y197.624 E.0164
G1 X126.586 Y204.619 E.30413
G3 X126.978 Y204.478 I.905 J1.89 E.01283
G1 X120.125 Y197.624 E.29797
G1 X120.659 Y197.624 E.0164
G1 X127.415 Y204.381 E.29376
G3 X127.893 Y204.326 I.601 J3.122 E.01483
G1 X121.192 Y197.624 E.29137
G1 X121.726 Y197.624 E.0164
G1 X128.459 Y204.357 E.29275
G3 X129.156 Y204.521 I-.463 J3.535 E.02206
G1 X122.09 Y197.455 E.30725
; WIPE_START
G1 X123.504 Y198.869 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.796 Y205.755 Z1 F30000
G1 X132.792 Y218.295 Z1
G1 Z.6
G1 E.8 F1800
G1 F15000
G1 X112.122 Y197.624 E.89875
G1 X111.588 Y197.624 E.0164
G1 X132.089 Y218.126 E.89137
G1 X131.555 Y218.126 E.0164
G1 X111.054 Y197.624 E.89137
G1 X110.521 Y197.624 E.0164
G1 X131.022 Y218.126 E.89137
G1 X130.488 Y218.126 E.0164
G1 X109.987 Y197.624 E.89137
G1 X109.454 Y197.624 E.0164
G1 X129.955 Y218.126 E.89137
G1 X129.421 Y218.126 E.0164
G1 X108.92 Y197.624 E.89137
G1 X108.387 Y197.624 E.0164
G1 X128.888 Y218.126 E.89137
G1 X128.354 Y218.126 E.0164
G1 X107.853 Y197.624 E.89137
G1 X107.319 Y197.624 E.0164
G1 X127.82 Y218.126 E.89137
G1 X127.287 Y218.126 E.0164
G1 X106.786 Y197.624 E.89137
G1 X106.252 Y197.624 E.0164
G1 X126.753 Y218.126 E.89137
G1 X126.22 Y218.126 E.0164
G1 X105.719 Y197.624 E.89137
G1 X105.185 Y197.624 E.0164
G1 X125.686 Y218.126 E.89137
G1 X125.153 Y218.126 E.0164
G1 X104.652 Y197.624 E.89137
G1 X104.118 Y197.624 E.0164
G1 X124.619 Y218.126 E.89137
G1 X124.085 Y218.126 E.0164
G1 X103.584 Y197.624 E.89137
G1 X103.051 Y197.624 E.0164
G1 X123.552 Y218.126 E.89137
G1 X123.018 Y218.126 E.0164
G1 X102.517 Y197.624 E.89137
G1 X101.984 Y197.624 E.0164
G1 X122.485 Y218.126 E.89137
G1 X121.951 Y218.126 E.0164
G1 X101.45 Y197.624 E.89137
G1 X100.917 Y197.624 E.0164
G1 X121.418 Y218.126 E.89137
G1 X120.884 Y218.126 E.0164
G1 X100.383 Y197.624 E.89137
G1 X99.849 Y197.624 E.0164
G1 X120.351 Y218.126 E.89137
G1 X119.817 Y218.126 E.0164
G1 X99.316 Y197.624 E.89137
G1 X98.782 Y197.624 E.0164
G1 X119.283 Y218.126 E.89137
G1 X118.75 Y218.126 E.0164
G1 X98.249 Y197.624 E.89137
G1 X97.715 Y197.624 E.0164
G1 X118.216 Y218.126 E.89137
G1 X117.683 Y218.126 E.0164
G1 X97.182 Y197.624 E.89137
G1 X96.648 Y197.624 E.0164
G1 X117.149 Y218.126 E.89137
G1 X116.616 Y218.126 E.0164
G1 X96.114 Y197.624 E.89137
G1 X95.581 Y197.624 E.0164
G1 X116.082 Y218.126 E.89137
G1 X115.548 Y218.126 E.0164
G1 X95.047 Y197.624 E.89137
G1 X94.514 Y197.624 E.0164
G1 X115.015 Y218.126 E.89137
G1 X114.481 Y218.126 E.0164
G1 X93.98 Y197.624 E.89137
G1 X93.447 Y197.624 E.0164
G1 X113.948 Y218.126 E.89137
G1 X113.414 Y218.126 E.0164
G1 X92.913 Y197.624 E.89137
G1 X92.379 Y197.624 E.0164
G1 X112.881 Y218.126 E.89137
G1 X112.347 Y218.126 E.0164
G1 X91.846 Y197.624 E.89137
G1 X91.312 Y197.624 E.0164
G1 X111.813 Y218.126 E.89137
G1 X111.28 Y218.126 E.0164
G1 X90.779 Y197.624 E.89137
G1 X90.245 Y197.624 E.0164
G1 X110.746 Y218.126 E.89137
G1 X110.213 Y218.126 E.0164
G1 X89.712 Y197.624 E.89137
G1 X89.178 Y197.624 E.0164
G1 X109.679 Y218.126 E.89137
G1 X109.146 Y218.126 E.0164
G1 X88.644 Y197.624 E.89137
G1 X88.111 Y197.624 E.0164
G1 X108.612 Y218.126 E.89137
G1 X108.078 Y218.126 E.0164
G1 X87.577 Y197.624 E.89137
G1 X87.044 Y197.624 E.0164
G1 X107.545 Y218.126 E.89137
G1 X107.011 Y218.126 E.0164
G1 X86.51 Y197.624 E.89137
G1 X85.977 Y197.624 E.0164
G1 X106.478 Y218.126 E.89137
G1 X105.944 Y218.126 E.0164
G1 X85.443 Y197.624 E.89137
G1 X84.91 Y197.624 E.0164
G1 X105.411 Y218.126 E.89137
G1 X104.877 Y218.126 E.0164
G1 X84.376 Y197.624 E.89137
G1 X83.842 Y197.624 E.0164
G1 X104.343 Y218.126 E.89137
G1 X103.81 Y218.126 E.0164
G1 X83.309 Y197.624 E.89137
G1 X82.775 Y197.624 E.0164
G1 X103.276 Y218.126 E.89137
G1 X102.743 Y218.126 E.0164
G1 X82.242 Y197.624 E.89137
G1 X81.708 Y197.624 E.0164
G1 X102.209 Y218.126 E.89137
G1 X101.676 Y218.126 E.0164
G1 X81.175 Y197.624 E.89137
G1 X80.641 Y197.624 E.0164
G1 X101.142 Y218.126 E.89137
G1 X100.608 Y218.126 E.0164
G1 X80.107 Y197.624 E.89137
G1 X79.574 Y197.624 E.0164
G1 X100.075 Y218.126 E.89137
G1 X99.541 Y218.126 E.0164
G1 X79.04 Y197.624 E.89137
G1 X78.507 Y197.624 E.0164
G1 X99.008 Y218.126 E.89137
G1 X98.474 Y218.126 E.0164
G1 X77.973 Y197.624 E.89137
G1 X77.44 Y197.624 E.0164
G1 X97.941 Y218.126 E.89137
G1 X97.407 Y218.126 E.0164
G1 X76.906 Y197.624 E.89137
G1 X76.372 Y197.624 E.0164
G1 X96.873 Y218.126 E.89137
G1 X96.34 Y218.126 E.0164
G1 X75.839 Y197.624 E.89137
G1 X75.305 Y197.624 E.0164
G1 X95.806 Y218.126 E.89137
G1 X95.273 Y218.126 E.0164
G1 X74.772 Y197.624 E.89137
G1 X74.238 Y197.624 E.0164
G1 X94.739 Y218.126 E.89137
G1 X94.206 Y218.126 E.0164
G1 X73.705 Y197.624 E.89137
G1 X73.171 Y197.624 E.0164
G1 X93.672 Y218.126 E.89137
G1 X93.139 Y218.126 E.0164
G1 X72.637 Y197.624 E.89137
G1 X72.104 Y197.624 E.0164
G1 X92.605 Y218.126 E.89137
G1 X92.071 Y218.126 E.0164
G1 X71.57 Y197.624 E.89137
G1 X71.037 Y197.624 E.0164
G1 X91.538 Y218.126 E.89137
G1 X91.004 Y218.126 E.0164
G1 X70.503 Y197.624 E.89137
G1 X69.97 Y197.624 E.0164
G1 X90.471 Y218.126 E.89137
G1 X89.937 Y218.126 E.0164
G1 X69.436 Y197.624 E.89137
G1 X68.902 Y197.624 E.0164
G1 X89.404 Y218.126 E.89137
G1 X88.87 Y218.126 E.0164
G1 X68.369 Y197.624 E.89137
G1 X67.835 Y197.624 E.0164
G1 X88.336 Y218.126 E.89137
G1 X87.803 Y218.126 E.0164
G1 X67.302 Y197.624 E.89137
G1 X66.768 Y197.624 E.0164
G1 X87.269 Y218.126 E.89137
G1 X86.736 Y218.126 E.0164
G1 X66.235 Y197.624 E.89137
G1 X65.701 Y197.624 E.0164
G1 X86.202 Y218.126 E.89137
G1 X85.669 Y218.126 E.0164
G1 X65.167 Y197.624 E.89137
G1 X64.634 Y197.624 E.0164
G1 X85.135 Y218.126 E.89137
G1 X84.601 Y218.126 E.0164
G1 X64.1 Y197.624 E.89137
G1 X63.567 Y197.624 E.0164
G1 X84.068 Y218.126 E.89137
G1 X83.534 Y218.126 E.0164
G1 X63.033 Y197.624 E.89137
G1 X62.5 Y197.624 E.0164
G1 X83.001 Y218.126 E.89137
G1 X82.467 Y218.126 E.0164
G1 X61.966 Y197.624 E.89137
G1 X61.432 Y197.624 E.0164
G1 X81.934 Y218.126 E.89137
G1 X81.4 Y218.126 E.0164
G1 X60.899 Y197.624 E.89137
G1 X60.365 Y197.624 E.0164
G1 X80.866 Y218.126 E.89137
G1 X80.333 Y218.126 E.0164
G1 X59.832 Y197.624 E.89137
G1 X59.298 Y197.624 E.0164
G1 X79.799 Y218.126 E.89137
G1 X79.266 Y218.126 E.0164
G1 X58.765 Y197.624 E.89137
G1 X58.231 Y197.624 E.0164
G1 X78.732 Y218.126 E.89137
G1 X78.199 Y218.126 E.0164
G1 X57.697 Y197.624 E.89137
G1 X57.164 Y197.624 E.0164
G1 X77.665 Y218.126 E.89137
G1 X77.131 Y218.126 E.0164
G1 X56.63 Y197.624 E.89137
G1 X56.097 Y197.624 E.0164
G1 X76.598 Y218.126 E.89137
G1 X76.064 Y218.126 E.0164
G1 X55.563 Y197.624 E.89137
G1 X55.03 Y197.624 E.0164
G1 X75.531 Y218.126 E.89137
G1 X74.997 Y218.126 E.0164
G1 X54.496 Y197.624 E.89137
G1 X53.963 Y197.624 E.0164
G1 X74.464 Y218.126 E.89137
G1 X73.93 Y218.126 E.0164
G1 X53.429 Y197.624 E.89137
G1 X52.895 Y197.624 E.0164
G1 X73.396 Y218.126 E.89137
G1 X72.863 Y218.126 E.0164
G1 X52.362 Y197.624 E.89137
G1 X51.828 Y197.624 E.0164
G1 X72.329 Y218.126 E.89137
G1 X71.796 Y218.126 E.0164
G1 X51.295 Y197.624 E.89137
G1 X50.761 Y197.624 E.0164
G1 X71.262 Y218.126 E.89137
G1 X70.729 Y218.126 E.0164
G1 X29.749 Y177.146 E1.78174
G1 X29.749 Y176.613 E.0164
G1 X50.251 Y197.114 E.89137
G1 X50.251 Y196.58 E.0164
G1 X29.749 Y176.079 E.89137
G1 X29.749 Y175.546 E.0164
G1 X50.251 Y196.047 E.89137
G1 X50.251 Y195.513 E.0164
G1 X29.749 Y175.012 E.89137
G1 X29.749 Y174.479 E.0164
G1 X50.251 Y194.98 E.89137
G1 X50.251 Y194.446 E.0164
G1 X29.749 Y173.945 E.89137
G1 X29.749 Y173.411 E.0164
G1 X50.251 Y193.912 E.89137
G1 X50.251 Y193.379 E.0164
G1 X29.749 Y172.878 E.89137
G1 X29.749 Y172.344 E.0164
G1 X50.251 Y192.845 E.89137
G1 X50.251 Y192.312 E.0164
G1 X29.749 Y171.811 E.89137
G1 X29.749 Y171.277 E.0164
G1 X50.251 Y191.778 E.89137
G1 X50.251 Y191.245 E.0164
G1 X29.749 Y170.744 E.89137
G1 X29.749 Y170.21 E.0164
G1 X50.251 Y190.711 E.89137
G1 X50.251 Y190.177 E.0164
G1 X29.749 Y169.676 E.89137
G1 X29.749 Y169.143 E.0164
G1 X50.251 Y189.644 E.89137
G1 X50.251 Y189.11 E.0164
G1 X29.749 Y168.609 E.89137
G1 X29.749 Y168.076 E.0164
G1 X50.251 Y188.577 E.89137
G1 X50.251 Y188.043 E.0164
G1 X29.749 Y167.542 E.89137
G1 X29.749 Y167.009 E.0164
G1 X50.251 Y187.51 E.89137
G1 X50.251 Y186.976 E.0164
G1 X29.749 Y166.475 E.89137
G1 X29.749 Y165.941 E.0164
G1 X50.251 Y186.443 E.89137
G1 X50.251 Y185.909 E.0164
G1 X29.749 Y165.408 E.89137
G1 X29.749 Y164.874 E.0164
G1 X50.251 Y185.375 E.89137
G1 X50.251 Y184.842 E.0164
G1 X29.749 Y164.341 E.89137
G1 X29.749 Y163.807 E.0164
G1 X50.251 Y184.308 E.89137
G1 X50.251 Y183.775 E.0164
G1 X29.749 Y163.274 E.89137
G1 X29.749 Y162.74 E.0164
G1 X50.251 Y183.241 E.89137
G1 X50.251 Y182.708 E.0164
G1 X29.749 Y162.206 E.89137
G1 X29.749 Y161.673 E.0164
G1 X50.251 Y182.174 E.89137
G1 X50.251 Y181.64 E.0164
G1 X29.749 Y161.139 E.89137
G1 X29.749 Y160.606 E.0164
G1 X50.251 Y181.107 E.89137
G1 X50.251 Y180.573 E.0164
G1 X29.749 Y160.072 E.89137
G1 X29.749 Y159.539 E.0164
G1 X50.251 Y180.04 E.89137
G1 X50.251 Y179.506 E.0164
G1 X29.749 Y159.005 E.89137
G1 X29.749 Y158.471 E.0164
G1 X50.251 Y178.973 E.89137
G1 X50.251 Y178.439 E.0164
G1 X29.749 Y157.938 E.89137
G1 X29.749 Y157.404 E.0164
G1 X50.251 Y177.905 E.89137
G1 X50.251 Y177.372 E.0164
G1 X29.749 Y156.871 E.89137
G1 X29.749 Y156.337 E.0164
G1 X50.251 Y176.838 E.89137
M73 P39 R40
G1 X50.251 Y176.305 E.0164
G1 X29.749 Y155.804 E.89137
G1 X29.749 Y155.27 E.0164
G1 X50.251 Y175.771 E.89137
G1 X50.251 Y175.238 E.0164
G1 X29.749 Y154.736 E.89137
G1 X29.749 Y154.203 E.0164
G1 X50.251 Y174.704 E.89137
G1 X50.251 Y174.17 E.0164
G1 X29.749 Y153.669 E.89137
G1 X29.749 Y153.136 E.0164
G1 X50.251 Y173.637 E.89137
G1 X50.251 Y173.103 E.0164
G1 X29.749 Y152.602 E.89137
G1 X29.749 Y152.069 E.0164
G1 X50.251 Y172.57 E.89137
G1 X50.251 Y172.036 E.0164
G1 X29.749 Y151.535 E.89137
G1 X29.749 Y151.002 E.0164
G1 X50.251 Y171.503 E.89137
G1 X50.251 Y170.969 E.0164
G1 X29.749 Y150.468 E.89137
G1 X29.749 Y149.934 E.0164
G1 X50.251 Y170.435 E.89137
G1 X50.251 Y169.902 E.0164
G1 X29.749 Y149.401 E.89137
G1 X29.749 Y148.867 E.0164
G1 X50.251 Y169.368 E.89137
G1 X50.251 Y168.835 E.0164
G1 X29.749 Y148.334 E.89137
G1 X29.749 Y147.8 E.0164
G1 X50.251 Y168.301 E.89137
G1 X50.251 Y167.768 E.0164
G1 X29.749 Y147.267 E.89137
G1 X29.749 Y146.733 E.0164
G1 X50.251 Y167.234 E.89137
G1 X50.251 Y166.7 E.0164
G1 X29.749 Y146.199 E.89137
G1 X29.749 Y145.666 E.0164
G1 X50.251 Y166.167 E.89137
G1 X50.251 Y165.633 E.0164
G1 X29.749 Y145.132 E.89137
G1 X29.749 Y144.599 E.0164
G1 X50.251 Y165.1 E.89137
G1 X50.251 Y164.566 E.0164
G1 X29.749 Y144.065 E.89137
G1 X29.749 Y143.532 E.0164
G1 X50.251 Y164.033 E.89137
G1 X50.251 Y163.499 E.0164
G1 X29.749 Y142.998 E.89137
G1 X29.749 Y142.464 E.0164
G1 X50.251 Y162.965 E.89137
G1 X50.251 Y162.432 E.0164
G1 X29.749 Y141.931 E.89137
G1 X29.749 Y141.397 E.0164
G1 X50.251 Y161.898 E.89137
G1 X50.251 Y161.365 E.0164
G1 X29.749 Y140.864 E.89137
G1 X29.749 Y140.33 E.0164
G1 X50.251 Y160.831 E.89137
G1 X50.251 Y160.298 E.0164
G1 X29.749 Y139.797 E.89137
G1 X29.749 Y139.263 E.0164
G1 X50.251 Y159.764 E.89137
G1 X50.251 Y159.231 E.0164
G1 X29.749 Y138.729 E.89137
G1 X29.749 Y138.196 E.0164
G1 X50.251 Y158.697 E.89137
G1 X50.251 Y158.163 E.0164
G1 X29.749 Y137.662 E.89137
G1 X29.749 Y137.129 E.0164
G1 X50.251 Y157.63 E.89137
G1 X50.251 Y157.096 E.0164
G1 X29.749 Y136.595 E.89137
G1 X29.749 Y136.062 E.0164
G1 X50.251 Y156.563 E.89137
G1 X50.251 Y156.029 E.0164
G1 X29.749 Y135.528 E.89137
G1 X29.749 Y134.994 E.0164
G1 X50.251 Y155.496 E.89137
G1 X50.251 Y154.962 E.0164
G1 X29.749 Y134.461 E.89137
G1 X29.749 Y133.927 E.0164
G1 X50.251 Y154.428 E.89137
G1 X50.251 Y153.895 E.0164
G1 X29.749 Y133.394 E.89137
G1 X29.749 Y132.86 E.0164
G1 X50.251 Y153.361 E.89137
G1 X50.251 Y152.828 E.0164
G1 X29.749 Y132.327 E.89137
G1 X29.749 Y131.793 E.0164
G1 X50.251 Y152.294 E.89137
G1 X50.251 Y151.761 E.0164
G1 X29.749 Y131.259 E.89137
G1 X29.749 Y130.726 E.0164
G1 X50.251 Y151.227 E.89137
G1 X50.251 Y150.693 E.0164
G1 X29.749 Y130.192 E.89137
G1 X29.749 Y129.659 E.0164
G1 X50.251 Y150.16 E.89137
G1 X50.251 Y149.626 E.0164
G1 X29.749 Y129.125 E.89137
G1 X29.749 Y128.592 E.0164
G1 X50.251 Y149.093 E.89137
G1 X50.251 Y148.559 E.0164
G1 X29.749 Y128.058 E.89137
G1 X29.749 Y127.524 E.0164
G1 X50.251 Y148.026 E.89137
G1 X50.251 Y147.492 E.0164
G1 X29.749 Y126.991 E.89137
G1 X29.749 Y126.457 E.0164
G1 X50.251 Y146.958 E.89137
G1 X50.251 Y146.425 E.0164
G1 X29.749 Y125.924 E.89137
G1 X29.749 Y125.39 E.0164
G1 X50.251 Y145.891 E.89137
G1 X50.251 Y145.358 E.0164
G1 X29.749 Y124.857 E.89137
G1 X29.749 Y124.323 E.0164
G1 X50.251 Y144.824 E.89137
G1 X50.251 Y144.291 E.0164
G1 X29.749 Y123.79 E.89137
G1 X29.749 Y123.256 E.0164
G1 X50.251 Y143.757 E.89137
G1 X50.251 Y143.223 E.0164
G1 X29.749 Y122.722 E.89137
G1 X29.749 Y122.189 E.0164
G1 X50.251 Y142.69 E.89137
G1 X50.251 Y142.156 E.0164
G1 X29.749 Y121.655 E.89137
G1 X29.749 Y121.122 E.0164
G1 X50.42 Y141.792 E.89875
; WIPE_START
G1 X49.006 Y140.378 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X44.815 Y134 Z1 F30000
G1 X29.58 Y110.814 Z1
G1 Z.6
G1 E.8 F1800
G1 F15000
G1 X41.593 Y122.827 E.5223
G2 X40.769 Y122.537 I-1.643 J3.354 E.0269
G1 X29.749 Y111.517 E.47912
G1 X29.749 Y112.051 E.0164
G1 X40.154 Y122.455 E.45238
G2 X39.637 Y122.472 I-.154 J3.276 E.01592
G1 X29.749 Y112.585 E.4299
G1 X29.749 Y113.118 E.0164
G1 X39.178 Y122.546 E.40993
G2 X38.77 Y122.672 I.425 J2.103 E.01314
G1 X29.749 Y113.652 E.3922
G1 X29.749 Y114.185 E.0164
G1 X38.399 Y122.835 E.37607
G2 X38.06 Y123.03 I.807 J1.789 E.01203
G1 X29.749 Y114.719 E.36136
G1 X29.749 Y115.252 E.0164
G1 X37.752 Y123.255 E.34796
G2 X37.473 Y123.51 I1.131 J1.523 E.01163
G1 X29.749 Y115.786 E.33581
G1 X29.749 Y116.32 E.0164
G1 X37.222 Y123.792 E.3249
G2 X37 Y124.103 I1.444 J1.266 E.01178
G1 X29.749 Y116.853 E.31524
G1 X29.749 Y117.387 E.0164
G1 X36.808 Y124.445 E.30689
G2 X36.651 Y124.822 I7.171 J3.199 E.01255
G1 X29.749 Y117.92 E.30008
G1 X29.749 Y118.454 E.0164
G1 X36.535 Y125.239 E.29502
G2 X36.465 Y125.703 I2.284 J.582 E.01444
G1 X29.749 Y118.987 E.29198
G1 X29.749 Y119.521 E.0164
G1 X36.458 Y126.23 E.29168
G2 X36.555 Y126.86 I3.197 J-.168 E.01964
G1 X29.749 Y120.055 E.29589
G1 X29.749 Y120.588 E.0164
G1 X50.251 Y141.089 E.89137
G1 X50.251 Y140.556 E.0164
G1 X39.137 Y129.442 E.4832
G2 X39.768 Y129.54 I.897 J-3.71 E.01966
G1 X50.251 Y140.022 E.45576
M73 P39 R39
G1 X50.251 Y139.488 E.0164
G1 X40.299 Y129.537 E.43266
G2 X40.76 Y129.465 I-.132 J-2.339 E.01437
G1 X50.251 Y138.955 E.41262
G1 X50.251 Y138.421 E.0164
G1 X41.176 Y129.347 E.39455
G2 X41.553 Y129.191 I-.592 J-1.962 E.01258
G1 X50.251 Y137.888 E.37814
G1 X50.251 Y137.354 E.0164
G1 X41.897 Y129.001 E.3632
G2 X42.21 Y128.78 I-.942 J-1.667 E.01179
G1 X50.251 Y136.821 E.3496
G1 X50.251 Y136.287 E.0164
G1 X42.492 Y128.529 E.33731
G2 X42.746 Y128.249 I-1.271 J-1.408 E.01163
G1 X50.251 Y135.753 E.32628
G1 X50.251 Y135.22 E.0164
G1 X42.971 Y127.941 E.3165
G2 X43.166 Y127.602 I-1.596 J-1.141 E.01204
G1 X50.251 Y134.686 E.30804
G1 X50.251 Y134.153 E.0164
G1 X43.327 Y127.23 E.30101
G2 X43.452 Y126.82 I-1.982 J-.825 E.01317
G1 X50.251 Y133.619 E.29561
G1 X50.251 Y133.086 E.0164
G1 X43.532 Y126.367 E.29212
G2 X43.544 Y125.845 I-4.843 J-.372 E.01605
G1 X50.251 Y132.552 E.2916
G1 X50.251 Y132.019 E.0164
G1 X43.465 Y125.233 E.29502
G2 X43.168 Y124.402 I-3.611 J.824 E.02721
G1 X50.251 Y131.485 E.30796
G1 X50.251 Y130.951 E.0164
G1 X29.749 Y110.45 E.89137
G1 X29.749 Y109.917 E.0164
G1 X50.251 Y130.418 E.89137
G1 X50.251 Y129.884 E.0164
G1 X29.749 Y109.383 E.89137
G1 X29.749 Y108.85 E.0164
G1 X50.251 Y129.351 E.89137
G1 X50.251 Y128.817 E.0164
G1 X29.749 Y108.316 E.89137
G1 X29.749 Y107.782 E.0164
G1 X50.251 Y128.284 E.89137
G1 X50.251 Y127.75 E.0164
G1 X29.749 Y107.249 E.89137
G1 X29.749 Y106.715 E.0164
G1 X50.251 Y127.216 E.89137
G1 X50.251 Y126.683 E.0164
G1 X29.749 Y106.182 E.89137
G1 X29.749 Y105.648 E.0164
G1 X50.251 Y126.149 E.89137
G1 X50.251 Y125.616 E.0164
G1 X29.749 Y105.115 E.89137
G1 X29.749 Y104.581 E.0164
G1 X50.251 Y125.082 E.89137
G1 X50.251 Y124.549 E.0164
G1 X29.749 Y104.047 E.89137
G1 X29.749 Y103.514 E.0164
G1 X50.251 Y124.015 E.89137
G1 X50.251 Y123.481 E.0164
G1 X29.749 Y102.98 E.89137
G1 X29.749 Y102.447 E.0164
G1 X50.251 Y122.948 E.89137
G1 X50.251 Y122.414 E.0164
G1 X29.749 Y101.913 E.89137
G1 X29.749 Y101.38 E.0164
G1 X50.251 Y121.881 E.89137
G1 X50.251 Y121.347 E.0164
G1 X29.749 Y100.846 E.89137
G1 X29.749 Y100.312 E.0164
G1 X50.251 Y120.814 E.89137
G1 X50.251 Y120.28 E.0164
G1 X29.749 Y99.779 E.89137
G1 X29.749 Y99.245 E.0164
G1 X50.251 Y119.746 E.89137
G1 X50.251 Y119.213 E.0164
G1 X29.749 Y98.712 E.89137
G1 X29.749 Y98.178 E.0164
G1 X50.251 Y118.679 E.89137
G1 X50.251 Y118.146 E.0164
G1 X29.749 Y97.645 E.89137
G1 X29.749 Y97.111 E.0164
G1 X50.251 Y117.612 E.89137
G1 X50.251 Y117.079 E.0164
G1 X29.749 Y96.578 E.89137
G1 X29.749 Y96.044 E.0164
G1 X50.251 Y116.545 E.89137
G1 X50.251 Y116.011 E.0164
G1 X29.749 Y95.51 E.89137
G1 X29.749 Y94.977 E.0164
G1 X50.251 Y115.478 E.89137
G1 X50.251 Y114.944 E.0164
G1 X29.749 Y94.443 E.89137
G1 X29.749 Y93.91 E.0164
G1 X50.251 Y114.411 E.89137
G1 X50.251 Y113.877 E.0164
G1 X29.749 Y93.376 E.89137
G1 X29.749 Y92.843 E.0164
G1 X50.251 Y113.344 E.89137
G1 X50.251 Y112.81 E.0164
G1 X29.749 Y92.309 E.89137
G1 X29.749 Y91.775 E.0164
G1 X50.251 Y112.276 E.89137
G1 X50.251 Y111.743 E.0164
G1 X29.749 Y91.242 E.89137
G1 X29.749 Y90.708 E.0164
G1 X50.251 Y111.209 E.89137
G1 X50.251 Y110.676 E.0164
G1 X29.749 Y90.175 E.89137
G1 X29.749 Y89.641 E.0164
G1 X50.251 Y110.142 E.89137
G1 X50.251 Y109.609 E.0164
G1 X29.749 Y89.108 E.89137
G1 X29.749 Y88.574 E.0164
G1 X50.251 Y109.075 E.89137
G1 X50.251 Y108.541 E.0164
G1 X29.749 Y88.04 E.89137
G1 X29.749 Y87.507 E.0164
G1 X50.251 Y108.008 E.89137
G1 X50.251 Y107.474 E.0164
G1 X29.749 Y86.973 E.89137
G1 X29.749 Y86.44 E.0164
G1 X50.251 Y106.941 E.89137
G1 X50.251 Y106.407 E.0164
G1 X29.749 Y85.906 E.89137
G1 X29.749 Y85.373 E.0164
G1 X50.251 Y105.874 E.89137
G1 X50.251 Y105.34 E.0164
G1 X29.749 Y84.839 E.89137
G1 X29.749 Y84.305 E.0164
G1 X50.251 Y104.807 E.89137
G1 X50.251 Y104.273 E.0164
G1 X29.749 Y83.772 E.89137
G1 X29.749 Y83.238 E.0164
G1 X50.251 Y103.739 E.89137
G1 X50.251 Y103.206 E.0164
G1 X29.749 Y82.705 E.89137
G1 X29.749 Y82.171 E.0164
G1 X50.251 Y102.672 E.89137
G1 X50.251 Y102.139 E.0164
G1 X29.749 Y81.638 E.89137
G1 X29.749 Y81.104 E.0164
G1 X50.251 Y101.605 E.89137
G1 X50.251 Y101.072 E.0164
G1 X29.749 Y80.57 E.89137
G1 X29.749 Y80.037 E.0164
G1 X50.251 Y100.538 E.89137
G1 X50.251 Y100.004 E.0164
G1 X29.749 Y79.503 E.89137
G1 X29.749 Y78.97 E.0164
G1 X50.251 Y99.471 E.89137
G1 X50.251 Y98.937 E.0164
G1 X29.749 Y78.436 E.89137
G1 X29.749 Y77.903 E.0164
G1 X50.251 Y98.404 E.89137
G1 X50.251 Y97.87 E.0164
G1 X29.749 Y77.369 E.89137
G1 X29.749 Y76.835 E.0164
G1 X50.251 Y97.337 E.89137
G1 X50.251 Y96.803 E.0164
G1 X29.749 Y76.302 E.89137
G1 X29.749 Y75.768 E.0164
G1 X50.251 Y96.269 E.89137
G1 X50.251 Y95.736 E.0164
G1 X29.749 Y75.235 E.89137
G1 X29.749 Y74.701 E.0164
G1 X50.251 Y95.202 E.89137
G1 X50.251 Y94.669 E.0164
G1 X29.749 Y74.168 E.89137
G1 X29.749 Y73.634 E.0164
G1 X50.251 Y94.135 E.89137
G1 X50.251 Y93.602 E.0164
G1 X29.749 Y73.1 E.89137
G1 X29.749 Y72.567 E.0164
G1 X50.251 Y93.068 E.89137
G1 X50.251 Y92.534 E.0164
G1 X29.749 Y72.033 E.89137
G1 X29.749 Y71.5 E.0164
G1 X50.251 Y92.001 E.89137
G1 X50.251 Y91.467 E.0164
G1 X29.749 Y70.966 E.89137
G1 X29.749 Y70.433 E.0164
G1 X50.251 Y90.934 E.89137
G1 X50.251 Y90.4 E.0164
G1 X29.749 Y69.899 E.89137
G1 X29.749 Y69.366 E.0164
G1 X50.251 Y89.867 E.89137
G1 X50.251 Y89.333 E.0164
G1 X29.749 Y68.832 E.89137
G1 X29.749 Y68.298 E.0164
G1 X50.251 Y88.799 E.89137
G1 X50.251 Y88.266 E.0164
G1 X29.749 Y67.765 E.89137
G1 X29.749 Y67.231 E.0164
G1 X50.251 Y87.732 E.89137
G1 X50.251 Y87.199 E.0164
G1 X29.749 Y66.698 E.89137
G1 X29.749 Y66.164 E.0164
G1 X50.251 Y86.665 E.89137
G1 X50.251 Y86.132 E.0164
G1 X29.749 Y65.631 E.89137
G1 X29.749 Y65.097 E.0164
G1 X50.251 Y85.598 E.89137
G1 X50.251 Y85.064 E.0164
G1 X29.749 Y64.563 E.89137
G1 X29.749 Y64.03 E.0164
G1 X50.251 Y84.531 E.89137
G1 X50.251 Y83.997 E.0164
G1 X29.749 Y63.496 E.89137
G1 X29.749 Y62.963 E.0164
G1 X50.251 Y83.464 E.89137
G1 X50.251 Y82.93 E.0164
G1 X29.749 Y62.429 E.89137
G1 X29.749 Y61.896 E.0164
G1 X50.251 Y82.397 E.89137
G1 X50.251 Y81.863 E.0164
G1 X29.749 Y61.362 E.89137
G1 X29.749 Y60.828 E.0164
G1 X50.251 Y81.329 E.89137
G1 X50.251 Y80.796 E.0164
G1 X29.749 Y60.295 E.89137
G1 X29.749 Y59.761 E.0164
G1 X50.251 Y80.262 E.89137
G1 X50.251 Y79.729 E.0164
G1 X29.749 Y59.228 E.89137
G1 X29.749 Y58.694 E.0164
G1 X50.251 Y79.195 E.89137
G1 X50.251 Y78.662 E.0164
G1 X29.749 Y58.161 E.89137
G1 X29.749 Y57.627 E.0164
G1 X50.251 Y78.128 E.89137
G1 X50.251 Y77.595 E.0164
G1 X29.749 Y57.093 E.89137
G1 X29.749 Y56.56 E.0164
G1 X50.251 Y77.061 E.89137
G1 X50.251 Y76.527 E.0164
G1 X29.749 Y56.026 E.89137
G1 X29.749 Y55.493 E.0164
G1 X50.251 Y75.994 E.89137
G1 X50.251 Y75.46 E.0164
G1 X29.749 Y54.959 E.89137
G1 X29.749 Y54.426 E.0164
G1 X50.251 Y74.927 E.89137
G1 X50.251 Y74.393 E.0164
G1 X29.749 Y53.892 E.89137
G1 X29.749 Y53.358 E.0164
G1 X50.251 Y73.86 E.89137
G1 X50.251 Y73.326 E.0164
G1 X29.749 Y52.825 E.89137
G1 X29.749 Y52.291 E.0164
G1 X50.251 Y72.792 E.89137
G1 X50.251 Y72.259 E.0164
G1 X29.749 Y51.758 E.89137
G1 X29.749 Y51.224 E.0164
G1 X50.251 Y71.725 E.89137
G1 X50.251 Y71.192 E.0164
G1 X29.749 Y50.691 E.89137
G1 X29.749 Y50.157 E.0164
G1 X50.251 Y70.658 E.89137
G1 X50.251 Y70.125 E.0164
G1 X29.749 Y49.623 E.89137
G1 X29.749 Y49.09 E.0164
G1 X50.251 Y69.591 E.89137
G1 X50.251 Y69.057 E.0164
G1 X29.749 Y48.556 E.89137
G1 X29.749 Y48.023 E.0164
G1 X50.251 Y68.524 E.89137
G1 X50.251 Y67.99 E.0164
G1 X29.749 Y47.489 E.89137
G1 X29.749 Y46.956 E.0164
G1 X50.251 Y67.457 E.89137
G1 X50.251 Y66.923 E.0164
G1 X29.749 Y46.422 E.89137
G1 X29.749 Y45.888 E.0164
G1 X50.251 Y66.39 E.89137
G1 X50.251 Y65.856 E.0164
G1 X29.749 Y45.355 E.89137
G1 X29.749 Y44.821 E.0164
G1 X50.251 Y65.322 E.89137
G1 X50.251 Y64.789 E.0164
G1 X29.749 Y44.288 E.89137
G1 X29.749 Y43.754 E.0164
G1 X50.251 Y64.255 E.89137
G1 X50.251 Y63.722 E.0164
G1 X29.749 Y43.221 E.89137
G1 X29.749 Y42.687 E.0164
G1 X50.251 Y63.188 E.89137
G1 X50.251 Y62.655 E.0164
G1 X29.749 Y42.154 E.89137
G1 X29.749 Y41.62 E.0164
G1 X50.251 Y62.121 E.89137
G1 X50.251 Y61.587 E.0164
G1 X29.749 Y41.086 E.89137
G1 X29.749 Y40.553 E.0164
G1 X50.251 Y61.054 E.89137
G1 X50.251 Y60.52 E.0164
G1 X29.749 Y40.019 E.89137
G1 X29.749 Y39.486 E.0164
G1 X50.42 Y60.156 E.89875
; WIPE_START
G1 X49.006 Y58.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X45.103 Y52.183 Z1 F30000
G1 X34.106 Y33.705 Z1
G1 Z.6
G1 E.8 F1800
G1 F15000
G1 X41.181 Y40.78 E.30762
G2 X40.478 Y40.61 I-1.195 J3.405 E.02229
G1 X33.742 Y33.874 E.29285
G1 X33.209 Y33.874 E.0164
G1 X39.909 Y40.575 E.29132
G2 X39.429 Y40.629 I.114 J3.179 E.01485
G1 X32.675 Y33.874 E.29366
G1 X32.142 Y33.874 E.0164
G1 X38.991 Y40.724 E.29781
G2 X38.598 Y40.864 I.506 J2.035 E.01285
G1 X31.608 Y33.874 E.30392
G1 X31.075 Y33.874 E.0164
G1 X38.241 Y41.041 E.31158
G2 X37.916 Y41.25 I6.124 J9.866 E.01187
G1 X30.541 Y33.874 E.32067
G1 X30.007 Y33.874 E.0164
G1 X37.622 Y41.489 E.33108
G2 X37.356 Y41.757 I1.204 J1.461 E.01162
G1 X29.749 Y34.15 E.33074
G1 X29.749 Y34.684 E.0164
G1 X37.119 Y42.053 E.32043
G2 X36.912 Y42.379 I1.525 J1.201 E.0119
G1 X29.749 Y35.217 E.3114
G1 X29.749 Y35.751 E.0164
G1 X36.736 Y42.737 E.30375
G2 X36.595 Y43.13 I1.892 J.9 E.01285
G1 X29.749 Y36.284 E.29763
G1 X29.749 Y36.818 E.0164
G1 X36.495 Y43.563 E.29327
G2 X36.453 Y44.055 I4.586 J.638 E.01518
G1 X29.749 Y37.351 E.29145
G1 X29.749 Y37.885 E.0164
G1 X36.485 Y44.62 E.29284
G2 X36.659 Y45.328 I4.405 J-.709 E.02244
G1 X29.749 Y38.419 E.30042
G1 X29.749 Y38.952 E.0164
G1 X50.251 Y59.453 E.89137
G1 X50.251 Y58.92 E.0164
G1 X38.793 Y47.462 E.49817
G2 X39.504 Y47.639 I1.297 J-3.68 E.02257
G1 X50.251 Y58.386 E.46725
G1 X50.251 Y57.852 E.0164
G1 X40.07 Y47.672 E.44265
G2 X40.561 Y47.63 I.036 J-2.481 E.01519
G1 X50.251 Y57.319 E.42128
G1 X50.251 Y56.785 E.0164
G1 X40.997 Y47.532 E.40232
G2 X41.389 Y47.39 I-.513 J-2.025 E.01283
G1 X50.251 Y56.252 E.3853
G1 X50.251 Y55.718 E.0164
G1 X41.746 Y47.213 E.36979
G2 X42.071 Y47.005 I-.877 J-1.729 E.0119
G1 X50.251 Y55.185 E.35564
G1 X50.251 Y54.651 E.0164
G1 X42.367 Y46.767 E.34278
G2 X42.634 Y46.501 I-1.194 J-1.467 E.01162
G1 X50.509 Y54.376 E.34237
G1 X51.042 Y54.376 E.0164
G1 X42.873 Y46.207 E.35518
G2 X43.083 Y45.883 I-1.514 J-1.21 E.01188
G1 X51.576 Y54.376 E.36926
G1 X52.109 Y54.376 E.0164
G1 X43.262 Y45.528 E.38469
G2 X43.403 Y45.136 I-6.491 J-2.565 E.01282
G1 X52.643 Y54.376 E.40174
G1 X53.176 Y54.376 E.0164
G1 X43.501 Y44.7 E.42069
G2 X43.547 Y44.213 I-2.418 J-.477 E.01506
G1 X53.71 Y54.376 E.44187
G1 X54.244 Y54.376 E.0164
G1 X43.515 Y43.647 E.46646
G2 X43.345 Y42.943 I-3.56 J.489 E.02231
G1 X54.777 Y54.376 E.49707
G1 X55.311 Y54.376 E.0164
G1 X34.81 Y33.874 E.89137
G1 X35.343 Y33.874 E.0164
G1 X55.844 Y54.376 E.89137
G1 X56.378 Y54.376 E.0164
G1 X35.877 Y33.874 E.89137
G1 X36.41 Y33.874 E.0164
G1 X56.911 Y54.376 E.89137
G1 X57.445 Y54.376 E.0164
G1 X36.944 Y33.874 E.89137
G1 X37.477 Y33.874 E.0164
G1 X57.979 Y54.376 E.89137
G1 X58.512 Y54.376 E.0164
G1 X38.011 Y33.874 E.89137
G1 X38.545 Y33.874 E.0164
G1 X59.046 Y54.376 E.89137
G1 X59.579 Y54.376 E.0164
G1 X39.078 Y33.874 E.89137
G1 X39.612 Y33.874 E.0164
G1 X60.113 Y54.376 E.89137
G1 X60.646 Y54.376 E.0164
G1 X40.145 Y33.874 E.89137
M73 P40 R39
G1 X40.679 Y33.874 E.0164
G1 X61.18 Y54.376 E.89137
G1 X61.714 Y54.376 E.0164
G1 X41.212 Y33.874 E.89137
G1 X41.746 Y33.874 E.0164
G1 X62.247 Y54.376 E.89137
G1 X62.781 Y54.376 E.0164
G1 X42.28 Y33.874 E.89137
G1 X42.813 Y33.874 E.0164
G1 X63.314 Y54.376 E.89137
G1 X63.848 Y54.376 E.0164
G1 X43.347 Y33.874 E.89137
G1 X43.88 Y33.874 E.0164
G1 X64.381 Y54.376 E.89137
G1 X64.915 Y54.376 E.0164
G1 X44.414 Y33.874 E.89137
G1 X44.947 Y33.874 E.0164
G1 X65.448 Y54.376 E.89137
G1 X65.982 Y54.376 E.0164
G1 X45.481 Y33.874 E.89137
G1 X46.015 Y33.874 E.0164
G1 X66.516 Y54.376 E.89137
G1 X67.049 Y54.376 E.0164
G1 X46.548 Y33.874 E.89137
G1 X47.082 Y33.874 E.0164
G1 X67.583 Y54.376 E.89137
G1 X68.116 Y54.376 E.0164
G1 X47.615 Y33.874 E.89137
G1 X48.149 Y33.874 E.0164
G1 X68.65 Y54.376 E.89137
G1 X69.183 Y54.376 E.0164
G1 X48.682 Y33.874 E.89137
G1 X49.216 Y33.874 E.0164
G1 X69.717 Y54.376 E.89137
G1 X70.251 Y54.376 E.0164
G1 X49.75 Y33.874 E.89137
G1 X50.283 Y33.874 E.0164
G1 X70.784 Y54.376 E.89137
G1 X71.318 Y54.376 E.0164
G1 X50.817 Y33.874 E.89137
G1 X51.35 Y33.874 E.0164
G1 X71.851 Y54.376 E.89137
G1 X72.385 Y54.376 E.0164
G1 X51.884 Y33.874 E.89137
G1 X52.417 Y33.874 E.0164
G1 X72.918 Y54.376 E.89137
G1 X73.452 Y54.376 E.0164
G1 X52.951 Y33.874 E.89137
G1 X53.485 Y33.874 E.0164
G1 X73.986 Y54.376 E.89137
G1 X74.519 Y54.376 E.0164
G1 X54.018 Y33.874 E.89137
G1 X54.552 Y33.874 E.0164
G1 X75.053 Y54.376 E.89137
G1 X75.586 Y54.376 E.0164
G1 X55.085 Y33.874 E.89137
G1 X55.619 Y33.874 E.0164
G1 X76.12 Y54.376 E.89137
G1 X76.653 Y54.376 E.0164
G1 X56.152 Y33.874 E.89137
G1 X56.686 Y33.874 E.0164
G1 X77.187 Y54.376 E.89137
G1 X77.721 Y54.376 E.0164
G1 X57.22 Y33.874 E.89137
G1 X57.753 Y33.874 E.0164
G1 X78.254 Y54.376 E.89137
G1 X78.788 Y54.376 E.0164
G1 X58.287 Y33.874 E.89137
G1 X58.82 Y33.874 E.0164
G1 X79.321 Y54.376 E.89137
G1 X79.855 Y54.376 E.0164
G1 X59.354 Y33.874 E.89137
G1 X59.887 Y33.874 E.0164
G1 X80.388 Y54.376 E.89137
G1 X80.922 Y54.376 E.0164
G1 X60.421 Y33.874 E.89137
G1 X60.954 Y33.874 E.0164
G1 X81.456 Y54.376 E.89137
G1 X81.989 Y54.376 E.0164
G1 X61.488 Y33.874 E.89137
G1 X62.022 Y33.874 E.0164
G1 X82.523 Y54.376 E.89137
G1 X83.056 Y54.376 E.0164
G1 X62.555 Y33.874 E.89137
G1 X63.089 Y33.874 E.0164
G1 X83.59 Y54.376 E.89137
G1 X84.123 Y54.376 E.0164
G1 X63.622 Y33.874 E.89137
G1 X64.156 Y33.874 E.0164
G1 X84.657 Y54.376 E.89137
G1 X85.191 Y54.376 E.0164
G1 X64.689 Y33.874 E.89137
G1 X65.223 Y33.874 E.0164
G1 X85.724 Y54.376 E.89137
G1 X86.258 Y54.376 E.0164
G1 X65.757 Y33.874 E.89137
G1 X66.29 Y33.874 E.0164
G1 X86.791 Y54.376 E.89137
G1 X87.325 Y54.376 E.0164
G1 X66.824 Y33.874 E.89137
G1 X67.357 Y33.874 E.0164
G1 X87.858 Y54.376 E.89137
G1 X88.392 Y54.376 E.0164
G1 X67.891 Y33.874 E.89137
G1 X68.424 Y33.874 E.0164
G1 X88.926 Y54.376 E.89137
G1 X89.459 Y54.376 E.0164
G1 X68.958 Y33.874 E.89137
G1 X69.492 Y33.874 E.0164
G1 X89.993 Y54.376 E.89137
G1 X90.526 Y54.376 E.0164
G1 X70.025 Y33.874 E.89137
G1 X70.559 Y33.874 E.0164
G1 X91.06 Y54.376 E.89137
G1 X91.593 Y54.376 E.0164
G1 X71.092 Y33.874 E.89137
G1 X71.626 Y33.874 E.0164
G1 X92.127 Y54.376 E.89137
G1 X92.66 Y54.376 E.0164
G1 X72.159 Y33.874 E.89137
G1 X72.693 Y33.874 E.0164
G1 X93.194 Y54.376 E.89137
G1 X93.728 Y54.376 E.0164
G1 X73.227 Y33.874 E.89137
G1 X73.76 Y33.874 E.0164
G1 X94.261 Y54.376 E.89137
G1 X94.795 Y54.376 E.0164
G1 X74.294 Y33.874 E.89137
G1 X74.827 Y33.874 E.0164
G1 X95.328 Y54.376 E.89137
G1 X95.862 Y54.376 E.0164
G1 X75.361 Y33.874 E.89137
G1 X75.894 Y33.874 E.0164
G1 X96.395 Y54.376 E.89137
G1 X96.929 Y54.376 E.0164
G1 X76.428 Y33.874 E.89137
G1 X76.962 Y33.874 E.0164
G1 X97.463 Y54.376 E.89137
G1 X97.996 Y54.376 E.0164
G1 X77.495 Y33.874 E.89137
G1 X78.029 Y33.874 E.0164
G1 X98.53 Y54.376 E.89137
G1 X99.063 Y54.376 E.0164
G1 X78.562 Y33.874 E.89137
G1 X79.096 Y33.874 E.0164
G1 X99.597 Y54.376 E.89137
G1 X100.13 Y54.376 E.0164
G1 X79.629 Y33.874 E.89137
G1 X80.163 Y33.874 E.0164
G1 X100.664 Y54.376 E.89137
G1 X101.198 Y54.376 E.0164
G1 X80.697 Y33.874 E.89137
G1 X81.23 Y33.874 E.0164
G1 X101.731 Y54.376 E.89137
G1 X102.265 Y54.376 E.0164
G1 X81.764 Y33.874 E.89137
G1 X82.297 Y33.874 E.0164
G1 X102.798 Y54.376 E.89137
G1 X103.332 Y54.376 E.0164
G1 X82.831 Y33.874 E.89137
G1 X83.364 Y33.874 E.0164
G1 X103.865 Y54.376 E.89137
G1 X104.399 Y54.376 E.0164
G1 X83.898 Y33.874 E.89137
G1 X84.432 Y33.874 E.0164
G1 X104.933 Y54.376 E.89137
G1 X105.466 Y54.376 E.0164
G1 X84.965 Y33.874 E.89137
G1 X85.499 Y33.874 E.0164
G1 X106 Y54.376 E.89137
G1 X106.533 Y54.376 E.0164
G1 X86.032 Y33.874 E.89137
G1 X86.566 Y33.874 E.0164
G1 X107.067 Y54.376 E.89137
G1 X107.6 Y54.376 E.0164
G1 X87.099 Y33.874 E.89137
G1 X87.633 Y33.874 E.0164
G1 X108.134 Y54.376 E.89137
G1 X108.668 Y54.376 E.0164
G1 X88.166 Y33.874 E.89137
G1 X88.7 Y33.874 E.0164
G1 X109.201 Y54.376 E.89137
G1 X109.735 Y54.376 E.0164
G1 X89.234 Y33.874 E.89137
G1 X89.767 Y33.874 E.0164
G1 X110.268 Y54.376 E.89137
G1 X110.802 Y54.376 E.0164
G1 X90.301 Y33.874 E.89137
G1 X90.834 Y33.874 E.0164
G1 X111.335 Y54.376 E.89137
G1 X111.869 Y54.376 E.0164
G1 X91.368 Y33.874 E.89137
G1 X91.901 Y33.874 E.0164
G1 X112.403 Y54.376 E.89137
G1 X112.936 Y54.376 E.0164
G1 X92.435 Y33.874 E.89137
G1 X92.969 Y33.874 E.0164
G1 X113.47 Y54.376 E.89137
G1 X114.003 Y54.376 E.0164
G1 X93.502 Y33.874 E.89137
G1 X94.036 Y33.874 E.0164
G1 X114.537 Y54.376 E.89137
G1 X115.07 Y54.376 E.0164
G1 X94.569 Y33.874 E.89137
G1 X95.103 Y33.874 E.0164
G1 X115.604 Y54.376 E.89137
G1 X116.138 Y54.376 E.0164
G1 X95.636 Y33.874 E.89137
G1 X96.17 Y33.874 E.0164
G1 X116.671 Y54.376 E.89137
G1 X117.205 Y54.376 E.0164
G1 X96.704 Y33.874 E.89137
G1 X97.237 Y33.874 E.0164
G1 X117.738 Y54.376 E.89137
G1 X118.272 Y54.376 E.0164
G1 X97.771 Y33.874 E.89137
G1 X98.304 Y33.874 E.0164
G1 X118.805 Y54.376 E.89137
G1 X119.339 Y54.376 E.0164
G1 X98.838 Y33.874 E.89137
G1 X99.371 Y33.874 E.0164
G1 X119.872 Y54.376 E.89137
G1 X120.406 Y54.376 E.0164
G1 X99.905 Y33.874 E.89137
G1 X100.439 Y33.874 E.0164
G1 X120.94 Y54.376 E.89137
G1 X121.473 Y54.376 E.0164
G1 X100.972 Y33.874 E.89137
G1 X101.506 Y33.874 E.0164
G1 X122.007 Y54.376 E.89137
G1 X122.54 Y54.376 E.0164
G1 X102.039 Y33.874 E.89137
G1 X102.573 Y33.874 E.0164
G1 X123.074 Y54.376 E.89137
G1 X123.607 Y54.376 E.0164
G1 X103.106 Y33.874 E.89137
G1 X103.64 Y33.874 E.0164
G1 X124.141 Y54.376 E.89137
G1 X124.675 Y54.376 E.0164
G1 X104.174 Y33.874 E.89137
G1 X104.707 Y33.874 E.0164
G1 X125.208 Y54.376 E.89137
G1 X125.742 Y54.376 E.0164
G1 X105.241 Y33.874 E.89137
G1 X105.774 Y33.874 E.0164
G1 X126.275 Y54.376 E.89137
G1 X126.809 Y54.376 E.0164
G1 X106.308 Y33.874 E.89137
G1 X106.841 Y33.874 E.0164
G1 X127.342 Y54.376 E.89137
G1 X127.876 Y54.376 E.0164
G1 X107.375 Y33.874 E.89137
G1 X107.909 Y33.874 E.0164
G1 X128.41 Y54.376 E.89137
G1 X128.943 Y54.376 E.0164
G1 X108.442 Y33.874 E.89137
G1 X108.976 Y33.874 E.0164
G1 X129.477 Y54.376 E.89137
G1 X130.01 Y54.376 E.0164
G1 X109.509 Y33.874 E.89137
G1 X110.043 Y33.874 E.0164
G1 X130.544 Y54.376 E.89137
G1 X131.077 Y54.376 E.0164
G1 X110.576 Y33.874 E.89137
G1 X111.11 Y33.874 E.0164
G1 X131.611 Y54.376 E.89137
G1 X132.145 Y54.376 E.0164
G1 X111.644 Y33.874 E.89137
G1 X112.177 Y33.874 E.0164
G1 X132.848 Y54.545 E.89875
; WIPE_START
G1 X131.434 Y53.131 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.141 Y46.245 Z1 F30000
G1 X122.145 Y33.705 Z1
G1 Z.6
G1 E.8 F1800
G1 F15000
G1 X129.24 Y40.799 E.30847
G2 X128.522 Y40.615 I-1.304 J3.595 E.02281
G1 X121.781 Y33.874 E.29309
G1 X121.248 Y33.874 E.0164
G1 X127.949 Y40.575 E.29135
G2 X127.463 Y40.623 I.101 J3.496 E.01501
G1 X120.714 Y33.874 E.29344
G1 X120.181 Y33.874 E.0164
G1 X127.022 Y40.715 E.29744
G2 X126.626 Y40.854 I.493 J2.045 E.0129
G1 X119.647 Y33.874 E.30345
G1 X119.113 Y33.874 E.0164
G1 X126.267 Y41.028 E.31101
G2 X125.939 Y41.233 I.868 J1.745 E.01192
G1 X118.58 Y33.874 E.31996
G1 X118.046 Y33.874 E.0164
G1 X125.642 Y41.47 E.33025
G2 X125.374 Y41.736 I1.193 J1.469 E.01162
G1 X117.513 Y33.874 E.34181
G1 X116.979 Y33.874 E.0164
G1 X125.135 Y42.03 E.35461
G2 X124.925 Y42.354 I1.513 J1.209 E.01188
G1 X116.446 Y33.874 E.36869
G1 X115.912 Y33.874 E.0164
G1 X124.747 Y42.71 E.38414
G2 X124.604 Y43.1 I1.879 J.91 E.01281
G1 X115.378 Y33.874 E.40112
G1 X114.845 Y33.874 E.0164
G1 X124.501 Y43.531 E.41984
G2 X124.453 Y44.016 I4.396 J.683 E.015
G1 X114.311 Y33.874 E.44094
G1 X113.778 Y33.874 E.0164
G1 X124.48 Y44.577 E.46534
G2 X124.642 Y45.272 I3.859 J-.53 E.02196
G1 X113.244 Y33.874 E.49555
G1 X112.711 Y33.874 E.0164
G1 X133.212 Y54.376 E.89137
G1 X133.745 Y54.376 E.0164
G1 X126.857 Y47.487 E.29951
G2 X127.551 Y47.648 I1.45 J-4.678 E.02194
G1 X134.279 Y54.376 E.29252
G1 X134.812 Y54.376 E.0164
G1 X128.108 Y47.671 E.29152
G2 X128.596 Y47.625 I.017 J-2.464 E.0151
G1 X135.346 Y54.376 E.29349
G1 X135.88 Y54.376 E.0164
G1 X129.026 Y47.522 E.29797
G2 X129.416 Y47.378 I-.526 J-2.015 E.01278
G1 X136.413 Y54.376 E.30425
G1 X136.947 Y54.376 E.0164
G1 X129.77 Y47.199 E.31203
G2 X130.093 Y46.989 I-.886 J-1.716 E.01188
G1 X137.48 Y54.376 E.32117
G1 X138.014 Y54.376 E.0164
G1 X130.387 Y46.749 E.33159
G2 X130.653 Y46.481 I-1.207 J-1.461 E.01162
G1 X138.547 Y54.376 E.34325
G1 X139.081 Y54.376 E.0164
G1 X130.89 Y46.185 E.35614
G2 X131.098 Y45.859 I-1.528 J-1.203 E.0119
G1 X139.615 Y54.376 E.3703
G1 X140.148 Y54.376 E.0164
G1 X131.274 Y45.501 E.38584
G2 X131.411 Y45.105 I-1.912 J-.883 E.01292
G1 X140.682 Y54.376 E.40308
G1 X141.215 Y54.376 E.0164
G1 X131.506 Y44.666 E.42216
G2 X131.549 Y44.176 I-2.433 J-.462 E.01515
G1 X141.749 Y54.376 E.44347
G1 X142.282 Y54.376 E.0164
G1 X131.508 Y43.602 E.46844
G2 X131.323 Y42.882 I-3.519 J.525 E.02289
G1 X142.816 Y54.376 E.49972
G1 X143.35 Y54.376 E.0164
G1 X122.848 Y33.874 E.89137
G1 X123.382 Y33.874 E.0164
G1 X143.883 Y54.376 E.89137
G1 X144.417 Y54.376 E.0164
G1 X123.916 Y33.874 E.89137
G1 X124.449 Y33.874 E.0164
G1 X144.95 Y54.376 E.89137
G1 X145.484 Y54.376 E.0164
G1 X124.983 Y33.874 E.89137
G1 X125.516 Y33.874 E.0164
G1 X146.017 Y54.376 E.89137
G1 X146.551 Y54.376 E.0164
G1 X126.05 Y33.874 E.89137
G1 X126.583 Y33.874 E.0164
G1 X147.084 Y54.376 E.89137
G1 X147.618 Y54.376 E.0164
G1 X127.117 Y33.874 E.89137
G1 X127.651 Y33.874 E.0164
G1 X148.152 Y54.376 E.89137
G1 X148.685 Y54.376 E.0164
G1 X128.184 Y33.874 E.89137
G1 X128.718 Y33.874 E.0164
G1 X149.219 Y54.376 E.89137
G1 X149.752 Y54.376 E.0164
G1 X129.251 Y33.874 E.89137
G1 X129.785 Y33.874 E.0164
G1 X150.286 Y54.376 E.89137
G1 X150.819 Y54.376 E.0164
G1 X130.318 Y33.874 E.89137
G1 X130.852 Y33.874 E.0164
G1 X151.353 Y54.376 E.89137
G1 X151.887 Y54.376 E.0164
G1 X131.386 Y33.874 E.89137
G1 X131.919 Y33.874 E.0164
G1 X152.42 Y54.376 E.89137
G1 X152.954 Y54.376 E.0164
G1 X132.453 Y33.874 E.89137
G1 X132.986 Y33.874 E.0164
G1 X153.487 Y54.376 E.89137
G1 X154.021 Y54.376 E.0164
G1 X133.52 Y33.874 E.89137
G1 X134.053 Y33.874 E.0164
G1 X154.554 Y54.376 E.89137
G1 X155.088 Y54.376 E.0164
G1 X134.587 Y33.874 E.89137
G1 X135.121 Y33.874 E.0164
G1 X155.622 Y54.376 E.89137
G1 X156.155 Y54.376 E.0164
G1 X135.654 Y33.874 E.89137
G1 X136.188 Y33.874 E.0164
G1 X156.689 Y54.376 E.89137
G1 X157.222 Y54.376 E.0164
G1 X136.721 Y33.874 E.89137
G1 X137.255 Y33.874 E.0164
G1 X157.756 Y54.376 E.89137
G1 X158.289 Y54.376 E.0164
G1 X137.788 Y33.874 E.89137
G1 X138.322 Y33.874 E.0164
G1 X158.823 Y54.376 E.89137
G1 X159.357 Y54.376 E.0164
G1 X138.856 Y33.874 E.89137
G1 X139.389 Y33.874 E.0164
G1 X159.89 Y54.376 E.89137
G1 X160.424 Y54.376 E.0164
G1 X139.923 Y33.874 E.89137
G1 X140.456 Y33.874 E.0164
G1 X160.957 Y54.376 E.89137
G1 X161.491 Y54.376 E.0164
G1 X140.99 Y33.874 E.89137
G1 X141.523 Y33.874 E.0164
G1 X162.024 Y54.376 E.89137
G1 X162.558 Y54.376 E.0164
G1 X142.057 Y33.874 E.89137
G1 X142.59 Y33.874 E.0164
G1 X163.092 Y54.376 E.89137
G1 X163.625 Y54.376 E.0164
G1 X143.124 Y33.874 E.89137
G1 X143.658 Y33.874 E.0164
G1 X164.159 Y54.376 E.89137
G1 X164.692 Y54.376 E.0164
G1 X144.191 Y33.874 E.89137
G1 X144.725 Y33.874 E.0164
G1 X165.226 Y54.376 E.89137
G1 X165.759 Y54.376 E.0164
G1 X145.258 Y33.874 E.89137
G1 X145.792 Y33.874 E.0164
G1 X166.293 Y54.376 E.89137
G1 X166.827 Y54.376 E.0164
G1 X146.325 Y33.874 E.89137
G1 X146.859 Y33.874 E.0164
G1 X167.36 Y54.376 E.89137
G1 X167.894 Y54.376 E.0164
G1 X147.393 Y33.874 E.89137
G1 X147.926 Y33.874 E.0164
G1 X168.427 Y54.376 E.89137
G1 X168.961 Y54.376 E.0164
G1 X148.46 Y33.874 E.89137
G1 X148.993 Y33.874 E.0164
G1 X169.494 Y54.376 E.89137
G1 X170.028 Y54.376 E.0164
G1 X149.527 Y33.874 E.89137
G1 X150.06 Y33.874 E.0164
G1 X170.562 Y54.376 E.89137
G1 X171.095 Y54.376 E.0164
G1 X150.594 Y33.874 E.89137
G1 X151.128 Y33.874 E.0164
G1 X171.629 Y54.376 E.89137
G1 X172.162 Y54.376 E.0164
G1 X151.661 Y33.874 E.89137
G1 X152.195 Y33.874 E.0164
G1 X172.696 Y54.376 E.89137
G1 X173.229 Y54.376 E.0164
G1 X152.728 Y33.874 E.89137
G1 X153.262 Y33.874 E.0164
G1 X173.763 Y54.376 E.89137
G1 X174.296 Y54.376 E.0164
G1 X153.795 Y33.874 E.89137
G1 X154.329 Y33.874 E.0164
G1 X174.83 Y54.376 E.89137
G1 X175.364 Y54.376 E.0164
G1 X154.863 Y33.874 E.89137
G1 X155.396 Y33.874 E.0164
G1 X175.897 Y54.376 E.89137
G1 X176.431 Y54.376 E.0164
G1 X155.93 Y33.874 E.89137
G1 X156.463 Y33.874 E.0164
G1 X176.964 Y54.376 E.89137
G1 X177.498 Y54.376 E.0164
G1 X156.997 Y33.874 E.89137
G1 X157.53 Y33.874 E.0164
G1 X178.031 Y54.376 E.89137
G1 X178.565 Y54.376 E.0164
G1 X158.064 Y33.874 E.89137
G1 X158.598 Y33.874 E.0164
G1 X179.099 Y54.376 E.89137
G1 X179.632 Y54.376 E.0164
G1 X159.131 Y33.874 E.89137
G1 X159.665 Y33.874 E.0164
G1 X180.166 Y54.376 E.89137
G1 X180.699 Y54.376 E.0164
G1 X160.198 Y33.874 E.89137
G1 X160.732 Y33.874 E.0164
G1 X181.233 Y54.376 E.89137
G1 X181.766 Y54.376 E.0164
G1 X161.265 Y33.874 E.89137
G1 X161.799 Y33.874 E.0164
G1 X182.3 Y54.376 E.89137
G1 X182.834 Y54.376 E.0164
G1 X162.333 Y33.874 E.89137
M73 P40 R38
G1 X162.866 Y33.874 E.0164
G1 X183.367 Y54.376 E.89137
G1 X183.901 Y54.376 E.0164
G1 X163.4 Y33.874 E.89137
G1 X163.933 Y33.874 E.0164
G1 X184.434 Y54.376 E.89137
G1 X184.968 Y54.376 E.0164
G1 X164.467 Y33.874 E.89137
G1 X165 Y33.874 E.0164
G1 X185.501 Y54.376 E.89137
G1 X186.035 Y54.376 E.0164
G1 X165.534 Y33.874 E.89137
G1 X166.068 Y33.874 E.0164
G1 X186.569 Y54.376 E.89137
G1 X187.102 Y54.376 E.0164
G1 X166.601 Y33.874 E.89137
G1 X167.135 Y33.874 E.0164
G1 X187.636 Y54.376 E.89137
G1 X188.169 Y54.376 E.0164
G1 X167.668 Y33.874 E.89137
G1 X168.202 Y33.874 E.0164
G1 X188.703 Y54.376 E.89137
G1 X189.236 Y54.376 E.0164
G1 X168.735 Y33.874 E.89137
G1 X169.269 Y33.874 E.0164
G1 X189.77 Y54.376 E.89137
G1 X190.304 Y54.376 E.0164
G1 X169.802 Y33.874 E.89137
G1 X170.336 Y33.874 E.0164
G1 X190.837 Y54.376 E.89137
G1 X191.371 Y54.376 E.0164
G1 X170.87 Y33.874 E.89137
G1 X171.403 Y33.874 E.0164
G1 X191.904 Y54.376 E.89137
G1 X192.438 Y54.376 E.0164
G1 X171.937 Y33.874 E.89137
G1 X172.47 Y33.874 E.0164
G1 X192.971 Y54.376 E.89137
G1 X193.505 Y54.376 E.0164
G1 X173.004 Y33.874 E.89137
G1 X173.537 Y33.874 E.0164
G1 X194.039 Y54.376 E.89137
G1 X194.572 Y54.376 E.0164
G1 X174.071 Y33.874 E.89137
G1 X174.605 Y33.874 E.0164
G1 X195.106 Y54.376 E.89137
G1 X195.639 Y54.376 E.0164
G1 X175.138 Y33.874 E.89137
G1 X175.672 Y33.874 E.0164
G1 X196.173 Y54.376 E.89137
G1 X196.706 Y54.376 E.0164
G1 X176.205 Y33.874 E.89137
G1 X176.739 Y33.874 E.0164
G1 X197.24 Y54.376 E.89137
G1 X197.774 Y54.376 E.0164
G1 X177.272 Y33.874 E.89137
G1 X177.806 Y33.874 E.0164
G1 X198.307 Y54.376 E.89137
G1 X198.841 Y54.376 E.0164
G1 X178.34 Y33.874 E.89137
G1 X178.873 Y33.874 E.0164
G1 X199.374 Y54.376 E.89137
G1 X199.908 Y54.376 E.0164
G1 X179.407 Y33.874 E.89137
G1 X179.94 Y33.874 E.0164
G1 X200.441 Y54.376 E.89137
G1 X200.975 Y54.376 E.0164
G1 X180.474 Y33.874 E.89137
G1 X181.007 Y33.874 E.0164
G1 X201.509 Y54.376 E.89137
G1 X202.042 Y54.376 E.0164
G1 X181.541 Y33.874 E.89137
M73 P41 R38
G1 X182.075 Y33.874 E.0164
G1 X202.576 Y54.376 E.89137
G1 X203.109 Y54.376 E.0164
G1 X182.608 Y33.874 E.89137
G1 X183.142 Y33.874 E.0164
G1 X203.643 Y54.376 E.89137
G1 X204.176 Y54.376 E.0164
G1 X183.675 Y33.874 E.89137
G1 X184.209 Y33.874 E.0164
G1 X204.71 Y54.376 E.89137
G1 X205.243 Y54.376 E.0164
G1 X184.742 Y33.874 E.89137
G1 X185.276 Y33.874 E.0164
G1 X226.251 Y74.849 E1.78154
G1 X226.251 Y74.315 E.0164
G1 X185.81 Y33.874 E1.75834
G1 X186.343 Y33.874 E.0164
G1 X226.251 Y73.782 E1.73514
G1 X226.251 Y73.248 E.0164
G1 X186.877 Y33.874 E1.71194
G1 X187.41 Y33.874 E.0164
G1 X226.251 Y72.715 E1.68874
G1 X226.251 Y72.181 E.0164
G1 X187.944 Y33.874 E1.66554
G1 X188.477 Y33.874 E.0164
G1 X226.251 Y71.648 E1.64234
G1 X226.251 Y71.114 E.0164
G1 X189.011 Y33.874 E1.61914
G1 X189.545 Y33.874 E.0164
G1 X226.251 Y70.58 E1.59594
G1 X226.251 Y70.047 E.0164
G1 X190.078 Y33.874 E1.57275
G1 X190.612 Y33.874 E.0164
G1 X226.251 Y69.513 E1.54955
G1 X226.251 Y68.98 E.0164
G1 X191.145 Y33.874 E1.52635
G1 X191.679 Y33.874 E.0164
G1 X226.251 Y68.446 E1.50315
G1 X226.251 Y67.913 E.0164
G1 X192.212 Y33.874 E1.47995
G1 X192.746 Y33.874 E.0164
G1 X226.251 Y67.379 E1.45675
G1 X226.251 Y66.845 E.0164
G1 X193.279 Y33.874 E1.43355
G1 X193.813 Y33.874 E.0164
G1 X226.251 Y66.312 E1.41035
G1 X226.251 Y65.778 E.0164
G1 X194.347 Y33.874 E1.38715
G1 X194.88 Y33.874 E.0164
G1 X226.251 Y65.245 E1.36395
G1 X226.251 Y64.711 E.0164
G1 X195.414 Y33.874 E1.34075
G1 X195.947 Y33.874 E.0164
G1 X226.251 Y64.178 E1.31756
G1 X226.251 Y63.644 E.0164
G1 X196.481 Y33.874 E1.29436
G1 X197.014 Y33.874 E.0164
G1 X226.251 Y63.111 E1.27116
G1 X226.251 Y62.577 E.0164
G1 X197.548 Y33.874 E1.24796
G1 X198.082 Y33.874 E.0164
G1 X226.251 Y62.043 E1.22476
G1 X226.251 Y61.51 E.0164
G1 X198.615 Y33.874 E1.20156
G1 X199.149 Y33.874 E.0164
G1 X226.251 Y60.976 E1.17836
G1 X226.251 Y60.443 E.0164
G1 X199.682 Y33.874 E1.15516
G1 X200.216 Y33.874 E.0164
G1 X226.42 Y60.079 E1.13934
G1 X226.42 Y49.941 F30000
G1 F15000
G1 X219.3 Y42.821 E.30957
G3 X219.501 Y43.556 I-3.421 J1.332 E.02346
G1 X226.251 Y50.305 E.29344
G1 X226.251 Y50.838 E.0164
G1 X219.551 Y44.139 E.29129
G3 X219.511 Y44.632 I-2.489 J.046 E.01525
G1 X226.251 Y51.372 E.29304
G1 X226.251 Y51.906 E.0164
G1 X219.419 Y45.074 E.29704
G3 X219.284 Y45.473 I-2.06 J-.472 E.01297
G1 X226.251 Y52.439 E.30289
G1 X226.251 Y52.973 E.0164
G1 X219.112 Y45.835 E.31036
G3 X218.907 Y46.162 I-1.742 J-.865 E.01192
G1 X226.251 Y53.506 E.3193
G1 X226.251 Y54.04 E.0164
G1 X218.672 Y46.461 E.32953
G3 X218.408 Y46.731 I-1.481 J-1.182 E.01162
G1 X226.251 Y54.573 E.34099
G1 X226.251 Y55.107 E.0164
G1 X218.116 Y46.972 E.35368
G3 X217.795 Y47.185 I-1.222 J-1.5 E.01186
G1 X226.251 Y55.641 E.36765
G1 X226.251 Y56.174 E.0164
G1 X217.442 Y47.366 E.38298
G3 X217.055 Y47.513 I-.926 J-1.859 E.01274
G1 X226.251 Y56.708 E.3998
G1 X226.251 Y57.241 E.0164
G1 X216.629 Y47.62 E.41833
G3 X216.145 Y47.67 I-.771 J-5.111 E.01496
G1 X226.251 Y57.775 E.43936
G1 X226.251 Y58.308 E.0164
G1 X215.594 Y47.652 E.46334
G3 X214.913 Y47.504 I.579 J-4.318 E.02146
G1 X226.251 Y58.842 E.49296
G1 X226.251 Y59.376 E.0164
G1 X200.749 Y33.874 E1.10876
G1 X201.283 Y33.874 E.0164
G1 X212.624 Y45.216 E.49311
G3 X212.476 Y44.534 I3.459 J-1.109 E.02149
G1 X201.817 Y33.874 E.46346
G1 X202.35 Y33.874 E.0164
G1 X212.453 Y43.977 E.43925
G3 X212.508 Y43.498 I4.814 J.31 E.01482
G1 X202.884 Y33.874 E.41844
G1 X203.417 Y33.874 E.0164
G1 X212.613 Y43.07 E.39983
G3 X212.759 Y42.682 I2.013 J.533 E.01276
G1 X203.951 Y33.874 E.38295
G1 X204.484 Y33.874 E.0164
G1 X212.939 Y42.329 E.3676
G3 X213.151 Y42.007 I1.716 J.899 E.01186
G1 X205.018 Y33.874 E.3536
G1 X205.552 Y33.874 E.0164
G1 X213.392 Y41.715 E.34089
G3 X213.663 Y41.452 I10.888 J10.946 E.0116
G1 X206.085 Y33.874 E.32946
G1 X206.619 Y33.874 E.0164
G1 X213.962 Y41.218 E.3193
G3 X214.292 Y41.014 I1.184 J1.546 E.01194
G1 X207.152 Y33.874 E.31044
G1 X207.686 Y33.874 E.0164
G1 X214.654 Y40.843 E.30297
G3 X215.052 Y40.707 I.878 J1.921 E.01294
G1 X208.219 Y33.874 E.29707
G1 X208.753 Y33.874 E.0164
G1 X215.497 Y40.618 E.29322
G3 X215.988 Y40.576 I.502 J2.986 E.01519
G1 X209.287 Y33.874 E.29139
G1 X209.82 Y33.874 E.0164
G1 X216.567 Y40.621 E.29333
G3 X217.298 Y40.819 I-.748 J4.21 E.02331
G1 X210.354 Y33.874 E.30193
G1 X210.887 Y33.874 E.0164
G1 X226.251 Y49.238 E.66798
G1 X226.251 Y48.704 E.0164
G1 X211.421 Y33.874 E.64478
G1 X211.954 Y33.874 E.0164
G1 X226.251 Y48.171 E.62158
G1 X226.251 Y47.637 E.0164
G1 X212.488 Y33.874 E.59838
G1 X213.022 Y33.874 E.0164
G1 X226.251 Y47.103 E.57519
G1 X226.251 Y46.57 E.0164
G1 X213.555 Y33.874 E.55199
G1 X214.089 Y33.874 E.0164
G1 X226.251 Y46.036 E.52879
G1 X226.251 Y45.503 E.0164
G1 X214.622 Y33.874 E.50559
G1 X215.156 Y33.874 E.0164
G1 X226.251 Y44.969 E.48239
G1 X226.251 Y44.436 E.0164
G1 X215.689 Y33.874 E.45919
G1 X216.223 Y33.874 E.0164
G1 X226.251 Y43.902 E.43599
G1 X226.251 Y43.368 E.0164
G1 X216.757 Y33.874 E.41279
G1 X217.29 Y33.874 E.0164
G1 X226.251 Y42.835 E.38959
G1 X226.251 Y42.301 E.0164
G1 X217.824 Y33.874 E.36639
G1 X218.357 Y33.874 E.0164
G1 X226.251 Y41.768 E.34319
G1 X226.251 Y41.234 E.0164
G1 X218.891 Y33.874 E.32
G1 X219.424 Y33.874 E.0164
G1 X226.251 Y40.701 E.2968
G1 X226.251 Y40.167 E.0164
G1 X219.958 Y33.874 E.2736
G1 X220.492 Y33.874 E.0164
G1 X226.251 Y39.633 E.2504
G1 X226.251 Y39.1 E.0164
G1 X221.025 Y33.874 E.2272
G1 X221.559 Y33.874 E.0164
G1 X226.251 Y38.566 E.204
G1 X226.251 Y38.033 E.0164
G1 X222.092 Y33.874 E.1808
G1 X222.626 Y33.874 E.0164
G1 X226.251 Y37.499 E.1576
G1 X226.251 Y36.966 E.0164
G1 X223.159 Y33.874 E.1344
G1 X223.693 Y33.874 E.0164
G1 X226.251 Y36.432 E.1112
G1 X226.251 Y35.899 E.0164
G1 X224.226 Y33.874 E.088
G1 X224.76 Y33.874 E.0164
G1 X226.251 Y35.365 E.06481
G1 X226.251 Y34.831 E.0164
G1 X225.294 Y33.874 E.04161
G1 X225.827 Y33.874 E.0164
G1 X226.42 Y34.467 E.02578
G1 X226.42 Y75.552 F30000
G1 F15000
G1 X205.749 Y54.882 E.89875
G1 X205.749 Y55.415 E.0164
G1 X226.251 Y75.916 E.89137
G1 X226.251 Y76.45 E.0164
G1 X205.749 Y55.949 E.89137
G1 X205.749 Y56.482 E.0164
G1 X226.251 Y76.983 E.89137
G1 X226.251 Y77.517 E.0164
G1 X205.749 Y57.016 E.89137
G1 X205.749 Y57.549 E.0164
G1 X226.251 Y78.05 E.89137
G1 X226.251 Y78.584 E.0164
G1 X205.749 Y58.083 E.89137
G1 X205.749 Y58.617 E.0164
G1 X226.251 Y79.118 E.89137
G1 X226.251 Y79.651 E.0164
G1 X205.749 Y59.15 E.89137
G1 X205.749 Y59.684 E.0164
G1 X226.251 Y80.185 E.89137
G1 X226.251 Y80.718 E.0164
G1 X205.749 Y60.217 E.89137
G1 X205.749 Y60.751 E.0164
G1 X226.251 Y81.252 E.89137
G1 X226.251 Y81.785 E.0164
G1 X205.749 Y61.284 E.89137
G1 X205.749 Y61.818 E.0164
G1 X226.251 Y82.319 E.89137
G1 X226.251 Y82.853 E.0164
G1 X205.749 Y62.351 E.89137
G1 X205.749 Y62.885 E.0164
G1 X226.251 Y83.386 E.89137
G1 X226.251 Y83.92 E.0164
G1 X205.749 Y63.419 E.89137
G1 X205.749 Y63.952 E.0164
G1 X226.251 Y84.453 E.89137
G1 X226.251 Y84.987 E.0164
G1 X205.749 Y64.486 E.89137
G1 X205.749 Y65.019 E.0164
G1 X226.251 Y85.52 E.89137
G1 X226.251 Y86.054 E.0164
G1 X205.749 Y65.553 E.89137
G1 X205.749 Y66.086 E.0164
G1 X226.251 Y86.588 E.89137
G1 X226.251 Y87.121 E.0164
G1 X205.749 Y66.62 E.89137
G1 X205.749 Y67.154 E.0164
G1 X226.251 Y87.655 E.89137
G1 X226.251 Y88.188 E.0164
G1 X205.749 Y67.687 E.89137
G1 X205.749 Y68.221 E.0164
G1 X226.251 Y88.722 E.89137
G1 X226.251 Y89.255 E.0164
G1 X205.749 Y68.754 E.89137
G1 X205.749 Y69.288 E.0164
G1 X226.251 Y89.789 E.89137
G1 X226.251 Y90.323 E.0164
G1 X205.749 Y69.821 E.89137
G1 X205.749 Y70.355 E.0164
G1 X226.251 Y90.856 E.89137
G1 X226.251 Y91.39 E.0164
G1 X205.749 Y70.889 E.89137
G1 X205.749 Y71.422 E.0164
G1 X226.251 Y91.923 E.89137
G1 X226.251 Y92.457 E.0164
G1 X205.749 Y71.956 E.89137
G1 X205.749 Y72.489 E.0164
G1 X226.251 Y92.99 E.89137
G1 X226.251 Y93.524 E.0164
G1 X205.749 Y73.023 E.89137
G1 X205.749 Y73.556 E.0164
G1 X226.251 Y94.058 E.89137
G1 X226.251 Y94.591 E.0164
G1 X205.749 Y74.09 E.89137
G1 X205.749 Y74.624 E.0164
G1 X226.251 Y95.125 E.89137
G1 X226.251 Y95.658 E.0164
G1 X205.749 Y75.157 E.89137
G1 X205.749 Y75.691 E.0164
G1 X226.251 Y96.192 E.89137
G1 X226.251 Y96.725 E.0164
G1 X205.749 Y76.224 E.89137
G1 X205.749 Y76.758 E.0164
G1 X226.251 Y97.259 E.89137
G1 X226.251 Y97.792 E.0164
G1 X205.749 Y77.291 E.89137
G1 X205.749 Y77.825 E.0164
G1 X226.251 Y98.326 E.89137
G1 X226.251 Y98.86 E.0164
G1 X205.749 Y78.359 E.89137
G1 X205.749 Y78.892 E.0164
G1 X226.251 Y99.393 E.89137
G1 X226.251 Y99.927 E.0164
G1 X205.749 Y79.426 E.89137
G1 X205.749 Y79.959 E.0164
G1 X226.251 Y100.46 E.89137
G1 X226.251 Y100.994 E.0164
G1 X205.749 Y80.493 E.89137
G1 X205.749 Y81.026 E.0164
G1 X226.251 Y101.527 E.89137
G1 X226.251 Y102.061 E.0164
G1 X205.749 Y81.56 E.89137
G1 X205.749 Y82.094 E.0164
G1 X226.251 Y102.595 E.89137
G1 X226.251 Y103.128 E.0164
G1 X205.749 Y82.627 E.89137
G1 X205.749 Y83.161 E.0164
G1 X226.251 Y103.662 E.89137
G1 X226.251 Y104.195 E.0164
G1 X205.749 Y83.694 E.89137
G1 X205.749 Y84.228 E.0164
G1 X226.251 Y104.729 E.89137
G1 X226.251 Y105.262 E.0164
G1 X205.749 Y84.761 E.89137
G1 X205.749 Y85.295 E.0164
G1 X226.251 Y105.796 E.89137
G1 X226.251 Y106.33 E.0164
G1 X205.749 Y85.829 E.89137
G1 X205.749 Y86.362 E.0164
G1 X226.251 Y106.863 E.89137
G1 X226.251 Y107.397 E.0164
G1 X205.749 Y86.896 E.89137
G1 X205.749 Y87.429 E.0164
G1 X226.251 Y107.93 E.89137
G1 X226.251 Y108.464 E.0164
G1 X205.749 Y87.963 E.89137
G1 X205.749 Y88.496 E.0164
G1 X226.251 Y108.997 E.89137
G1 X226.251 Y109.531 E.0164
G1 X205.749 Y89.03 E.89137
G1 X205.749 Y89.563 E.0164
G1 X226.251 Y110.065 E.89137
G1 X226.251 Y110.598 E.0164
G1 X205.749 Y90.097 E.89137
G1 X205.749 Y90.631 E.0164
G1 X226.251 Y111.132 E.89137
G1 X226.251 Y111.665 E.0164
G1 X205.749 Y91.164 E.89137
G1 X205.749 Y91.698 E.0164
G1 X226.251 Y112.199 E.89137
G1 X226.251 Y112.732 E.0164
G1 X205.749 Y92.231 E.89137
G1 X205.749 Y92.765 E.0164
G1 X226.251 Y113.266 E.89137
G1 X226.251 Y113.8 E.0164
G1 X205.749 Y93.298 E.89137
G1 X205.749 Y93.832 E.0164
G1 X226.251 Y114.333 E.89137
G1 X226.251 Y114.867 E.0164
G1 X205.749 Y94.366 E.89137
G1 X205.749 Y94.899 E.0164
G1 X226.251 Y115.4 E.89137
G1 X226.251 Y115.934 E.0164
G1 X205.749 Y95.433 E.89137
G1 X205.749 Y95.966 E.0164
G1 X226.251 Y116.467 E.89137
G1 X226.251 Y117.001 E.0164
G1 X205.749 Y96.5 E.89137
G1 X205.749 Y97.033 E.0164
G1 X226.251 Y117.535 E.89137
G1 X226.251 Y118.068 E.0164
G1 X205.749 Y97.567 E.89137
G1 X205.749 Y98.101 E.0164
G1 X226.251 Y118.602 E.89137
G1 X226.251 Y119.135 E.0164
G1 X205.749 Y98.634 E.89137
G1 X205.749 Y99.168 E.0164
G1 X226.251 Y119.669 E.89137
G1 X226.251 Y120.202 E.0164
G1 X205.749 Y99.701 E.89137
G1 X205.749 Y100.235 E.0164
G1 X226.251 Y120.736 E.89137
G1 X226.251 Y121.27 E.0164
G1 X205.749 Y100.768 E.89137
G1 X205.749 Y101.302 E.0164
G1 X226.251 Y121.803 E.89137
G1 X226.251 Y122.337 E.0164
G1 X205.749 Y101.836 E.89137
G1 X205.749 Y102.369 E.0164
G1 X226.251 Y122.87 E.89137
G1 X226.251 Y123.404 E.0164
G1 X205.749 Y102.903 E.89137
G1 X205.749 Y103.436 E.0164
G1 X226.251 Y123.937 E.89137
G1 X226.251 Y124.471 E.0164
G1 X205.749 Y103.97 E.89137
G1 X205.749 Y104.503 E.0164
G1 X226.251 Y125.004 E.89137
G1 X226.251 Y125.538 E.0164
G1 X205.749 Y105.037 E.89137
G1 X205.749 Y105.571 E.0164
G1 X226.251 Y126.072 E.89137
G1 X226.251 Y126.605 E.0164
G1 X205.749 Y106.104 E.89137
G1 X205.749 Y106.638 E.0164
G1 X226.251 Y127.139 E.89137
G1 X226.251 Y127.672 E.0164
G1 X205.749 Y107.171 E.89137
G1 X205.749 Y107.705 E.0164
G1 X226.251 Y128.206 E.89137
G1 X226.251 Y128.739 E.0164
G1 X205.749 Y108.238 E.89137
G1 X205.749 Y108.772 E.0164
G1 X226.251 Y129.273 E.89137
G1 X226.251 Y129.807 E.0164
G1 X205.749 Y109.306 E.89137
G1 X205.749 Y109.839 E.0164
G1 X226.251 Y130.34 E.89137
G1 X226.251 Y130.874 E.0164
G1 X205.749 Y110.373 E.89137
G1 X205.749 Y110.906 E.0164
G1 X226.251 Y131.407 E.89137
G1 X226.251 Y131.941 E.0164
G1 X219.439 Y125.129 E.29618
G3 X219.54 Y125.764 I-3.509 J.885 E.01979
G1 X226.251 Y132.474 E.29177
G1 X226.251 Y133.008 E.0164
G1 X219.537 Y126.294 E.2919
G3 X219.467 Y126.758 I-4.774 J-.479 E.01443
G1 X226.251 Y133.542 E.29493
G1 X226.251 Y134.075 E.0164
G1 X219.348 Y127.173 E.30011
G3 X219.191 Y127.549 I-1.962 J-.597 E.01256
G1 X226.251 Y134.609 E.30694
G1 X226.251 Y135.142 E.0164
G1 X219.001 Y127.892 E.31522
G3 X218.78 Y128.205 I-1.671 J-.947 E.01179
G1 X226.251 Y135.676 E.32482
G1 X226.251 Y136.209 E.0164
G1 X218.53 Y128.489 E.33569
G3 X218.252 Y128.744 I-1.416 J-1.263 E.01163
G1 X226.251 Y136.743 E.34779
G1 X226.251 Y137.277 E.0164
G1 X217.945 Y128.971 E.36113
G3 X217.607 Y129.167 I-5.522 J-9.132 E.012
G1 X226.251 Y137.81 E.37581
G1 X226.251 Y138.344 E.0164
G1 X217.234 Y129.327 E.39202
G3 X216.824 Y129.45 I-.821 J-1.992 E.0132
G1 X226.251 Y138.877 E.40987
G1 X226.251 Y139.411 E.0164
G1 X216.369 Y129.529 E.42966
G3 X215.852 Y129.546 I-.398 J-4.157 E.01589
G1 X226.251 Y139.944 E.45211
G1 X226.251 Y140.478 E.0164
G1 X215.241 Y129.468 E.4787
G3 X214.41 Y129.171 I.529 J-2.789 E.02723
G1 X226.251 Y141.012 E.51481
G1 X226.251 Y141.545 E.0164
G1 X205.749 Y121.044 E.89137
G1 X205.749 Y120.51 E.0164
G1 X212.824 Y127.585 E.3076
G3 X212.535 Y126.763 I2.413 J-1.31 E.02692
G1 X205.749 Y119.977 E.29504
G1 X205.749 Y119.443 E.0164
G1 X212.453 Y126.147 E.29145
G3 X212.472 Y125.632 I2.582 J-.162 E.01585
G1 X205.749 Y118.91 E.29228
G1 X205.749 Y118.376 E.0164
G1 X212.548 Y125.175 E.29559
G3 X212.671 Y124.764 I6.11 J1.615 E.01317
G1 X205.749 Y117.843 E.30095
G1 X205.749 Y117.309 E.0164
G1 X212.835 Y124.395 E.30808
G3 X213.031 Y124.057 I1.785 J.812 E.01202
G1 X205.749 Y116.775 E.31661
G1 X205.749 Y116.242 E.0164
G1 X213.257 Y123.75 E.32644
G3 X213.512 Y123.471 I1.519 J1.134 E.01163
G1 X205.749 Y115.708 E.33752
G1 X205.749 Y115.175 E.0164
G1 X213.796 Y123.221 E.34984
G3 X214.108 Y122.999 I1.262 J1.447 E.01179
G1 X205.749 Y114.641 E.36341
G1 X205.749 Y114.108 E.0164
G1 X214.45 Y122.808 E.3783
G3 X214.826 Y122.65 I.977 J1.797 E.01255
G1 X205.749 Y113.574 E.39462
G1 X205.749 Y113.041 E.0164
G1 X215.241 Y122.532 E.41269
G3 X215.707 Y122.465 I.675 J3.024 E.0145
G1 X205.749 Y112.507 E.43296
G1 X205.749 Y111.973 E.0164
G1 X216.234 Y122.457 E.45584
G3 X216.87 Y122.56 I-.369 J4.313 E.01983
G1 X205.58 Y111.27 E.49087
; WIPE_START
G1 X206.994 Y112.684 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X211.185 Y119.063 Z1 F30000
G1 X226.42 Y142.248 Z1
G1 Z.6
G1 E.8 F1800
G1 F15000
G1 X205.749 Y121.578 E.89875
G1 X205.749 Y122.111 E.0164
G1 X226.251 Y142.612 E.89137
G1 X226.251 Y143.146 E.0164
G1 X205.749 Y122.645 E.89137
G1 X205.749 Y123.178 E.0164
G1 X226.251 Y143.679 E.89137
G1 X226.251 Y144.213 E.0164
G1 X205.749 Y123.712 E.89137
G1 X205.749 Y124.245 E.0164
G1 X226.251 Y144.747 E.89137
G1 X226.251 Y145.28 E.0164
G1 X205.749 Y124.779 E.89137
G1 X205.749 Y125.313 E.0164
G1 X226.251 Y145.814 E.89137
G1 X226.251 Y146.347 E.0164
G1 X205.749 Y125.846 E.89137
G1 X205.749 Y126.38 E.0164
G1 X226.251 Y146.881 E.89137
G1 X226.251 Y147.414 E.0164
G1 X205.749 Y126.913 E.89137
G1 X205.749 Y127.447 E.0164
G1 X226.251 Y147.948 E.89137
G1 X226.251 Y148.482 E.0164
G1 X205.749 Y127.98 E.89137
G1 X205.749 Y128.514 E.0164
G1 X226.251 Y149.015 E.89137
G1 X226.251 Y149.549 E.0164
G1 X205.749 Y129.048 E.89137
G1 X205.749 Y129.581 E.0164
G1 X226.251 Y150.082 E.89137
G1 X226.251 Y150.616 E.0164
G1 X205.749 Y130.115 E.89137
G1 X205.749 Y130.648 E.0164
G1 X226.251 Y151.149 E.89137
G1 X226.251 Y151.683 E.0164
G1 X205.749 Y131.182 E.89137
G1 X205.749 Y131.715 E.0164
G1 X226.251 Y152.216 E.89137
G1 X226.251 Y152.75 E.0164
G1 X205.749 Y132.249 E.89137
G1 X205.749 Y132.783 E.0164
G1 X226.251 Y153.284 E.89137
G1 X226.251 Y153.817 E.0164
G1 X205.749 Y133.316 E.89137
G1 X205.749 Y133.85 E.0164
G1 X226.251 Y154.351 E.89137
G1 X226.251 Y154.884 E.0164
G1 X205.749 Y134.383 E.89137
G1 X205.749 Y134.917 E.0164
G1 X226.251 Y155.418 E.89137
G1 X226.251 Y155.951 E.0164
G1 X205.749 Y135.45 E.89137
G1 X205.749 Y135.984 E.0164
G1 X226.251 Y156.485 E.89137
G1 X226.251 Y157.019 E.0164
G1 X205.749 Y136.518 E.89137
G1 X205.749 Y137.051 E.0164
G1 X226.251 Y157.552 E.89137
G1 X226.251 Y158.086 E.0164
G1 X205.749 Y137.585 E.89137
G1 X205.749 Y138.118 E.0164
G1 X226.251 Y158.619 E.89137
G1 X226.251 Y159.153 E.0164
G1 X205.749 Y138.652 E.89137
G1 X205.749 Y139.185 E.0164
G1 X226.251 Y159.686 E.89137
G1 X226.251 Y160.22 E.0164
G1 X205.749 Y139.719 E.89137
G1 X205.749 Y140.253 E.0164
G1 X226.251 Y160.754 E.89137
G1 X226.251 Y161.287 E.0164
G1 X205.749 Y140.786 E.89137
G1 X205.749 Y141.32 E.0164
G1 X226.251 Y161.821 E.89137
G1 X226.251 Y162.354 E.0164
G1 X205.749 Y141.853 E.89137
G1 X205.749 Y142.387 E.0164
G1 X226.251 Y162.888 E.89137
G1 X226.251 Y163.421 E.0164
G1 X205.749 Y142.92 E.89137
G1 X205.749 Y143.454 E.0164
G1 X226.251 Y163.955 E.89137
G1 X226.251 Y164.489 E.0164
G1 X205.749 Y143.987 E.89137
G1 X205.749 Y144.521 E.0164
G1 X226.251 Y165.022 E.89137
G1 X226.251 Y165.556 E.0164
G1 X205.749 Y145.055 E.89137
G1 X205.749 Y145.588 E.0164
G1 X226.251 Y166.089 E.89137
G1 X226.251 Y166.623 E.0164
G1 X205.749 Y146.122 E.89137
M73 P42 R38
G1 X205.749 Y146.655 E.0164
G1 X226.251 Y167.156 E.89137
G1 X226.251 Y167.69 E.0164
G1 X205.749 Y147.189 E.89137
G1 X205.749 Y147.722 E.0164
G1 X226.251 Y168.224 E.89137
G1 X226.251 Y168.757 E.0164
G1 X205.749 Y148.256 E.89137
G1 X205.749 Y148.79 E.0164
G1 X226.251 Y169.291 E.89137
G1 X226.251 Y169.824 E.0164
G1 X205.749 Y149.323 E.89137
G1 X205.749 Y149.857 E.0164
G1 X226.251 Y170.358 E.89137
G1 X226.251 Y170.891 E.0164
G1 X205.749 Y150.39 E.89137
G1 X205.749 Y150.924 E.0164
G1 X226.251 Y171.425 E.89137
G1 X226.251 Y171.959 E.0164
G1 X205.749 Y151.457 E.89137
G1 X205.749 Y151.991 E.0164
G1 X226.251 Y172.492 E.89137
G1 X226.251 Y173.026 E.0164
G1 X205.749 Y152.525 E.89137
G1 X205.749 Y153.058 E.0164
G1 X226.251 Y173.559 E.89137
G1 X226.251 Y174.093 E.0164
G1 X205.749 Y153.592 E.89137
G1 X205.749 Y154.125 E.0164
G1 X226.251 Y174.626 E.89137
G1 X226.251 Y175.16 E.0164
G1 X205.749 Y154.659 E.89137
G1 X205.749 Y155.192 E.0164
G1 X226.251 Y175.694 E.89137
G1 X226.251 Y176.227 E.0164
G1 X205.749 Y155.726 E.89137
G1 X205.749 Y156.26 E.0164
G1 X226.251 Y176.761 E.89137
G1 X226.251 Y177.294 E.0164
G1 X205.749 Y156.793 E.89137
G1 X205.749 Y157.327 E.0164
G1 X226.251 Y177.828 E.89137
G1 X226.251 Y178.361 E.0164
G1 X205.749 Y157.86 E.89137
G1 X205.749 Y158.394 E.0164
G1 X226.251 Y178.895 E.89137
G1 X226.251 Y179.428 E.0164
G1 X205.749 Y158.927 E.89137
G1 X205.749 Y159.461 E.0164
G1 X226.251 Y179.962 E.89137
G1 X226.251 Y180.496 E.0164
G1 X205.749 Y159.995 E.89137
G1 X205.749 Y160.528 E.0164
G1 X226.251 Y181.029 E.89137
G1 X226.251 Y181.563 E.0164
G1 X205.749 Y161.062 E.89137
G1 X205.749 Y161.595 E.0164
G1 X226.251 Y182.096 E.89137
G1 X226.251 Y182.63 E.0164
G1 X205.749 Y162.129 E.89137
G1 X205.749 Y162.662 E.0164
G1 X226.251 Y183.163 E.89137
G1 X226.251 Y183.697 E.0164
G1 X205.749 Y163.196 E.89137
G1 X205.749 Y163.73 E.0164
G1 X226.251 Y184.231 E.89137
G1 X226.251 Y184.764 E.0164
G1 X205.749 Y164.263 E.89137
G1 X205.749 Y164.797 E.0164
G1 X226.251 Y185.298 E.89137
G1 X226.251 Y185.831 E.0164
G1 X205.749 Y165.33 E.89137
G1 X205.749 Y165.864 E.0164
G1 X226.251 Y186.365 E.89137
G1 X226.251 Y186.898 E.0164
G1 X205.749 Y166.397 E.89137
G1 X205.749 Y166.931 E.0164
G1 X226.251 Y187.432 E.89137
G1 X226.251 Y187.966 E.0164
G1 X205.749 Y167.465 E.89137
G1 X205.749 Y167.998 E.0164
G1 X226.251 Y188.499 E.89137
G1 X226.251 Y189.033 E.0164
G1 X205.749 Y168.532 E.89137
G1 X205.749 Y169.065 E.0164
G1 X226.251 Y189.566 E.89137
G1 X226.251 Y190.1 E.0164
G1 X205.749 Y169.599 E.89137
G1 X205.749 Y170.132 E.0164
G1 X226.251 Y190.633 E.89137
G1 X226.251 Y191.167 E.0164
G1 X205.749 Y170.666 E.89137
G1 X205.749 Y171.199 E.0164
G1 X226.251 Y191.701 E.89137
G1 X226.251 Y192.234 E.0164
G1 X205.749 Y171.733 E.89137
G1 X205.749 Y172.267 E.0164
G1 X226.251 Y192.768 E.89137
G1 X226.251 Y193.301 E.0164
G1 X205.749 Y172.8 E.89137
G1 X205.749 Y173.334 E.0164
G1 X226.251 Y193.835 E.89137
G1 X226.251 Y194.368 E.0164
G1 X205.749 Y173.867 E.89137
G1 X205.749 Y174.401 E.0164
G1 X226.251 Y194.902 E.89137
G1 X226.251 Y195.436 E.0164
G1 X205.749 Y174.934 E.89137
G1 X205.749 Y175.468 E.0164
G1 X226.251 Y195.969 E.89137
G1 X226.251 Y196.503 E.0164
G1 X205.749 Y176.002 E.89137
G1 X205.749 Y176.535 E.0164
G1 X226.251 Y197.036 E.89137
G1 X226.251 Y197.57 E.0164
G1 X205.749 Y177.069 E.89137
G1 X205.749 Y177.602 E.0164
G1 X226.251 Y198.103 E.89137
G1 X226.251 Y198.637 E.0164
G1 X205.749 Y178.136 E.89137
G1 X205.749 Y178.669 E.0164
G1 X226.251 Y199.171 E.89137
G1 X226.251 Y199.704 E.0164
G1 X205.749 Y179.203 E.89137
G1 X205.749 Y179.737 E.0164
G1 X226.251 Y200.238 E.89137
G1 X226.251 Y200.771 E.0164
G1 X205.749 Y180.27 E.89137
G1 X205.749 Y180.804 E.0164
G1 X226.251 Y201.305 E.89137
G1 X226.251 Y201.838 E.0164
G1 X205.749 Y181.337 E.89137
G1 X205.749 Y181.871 E.0164
G1 X226.251 Y202.372 E.89137
G1 X226.251 Y202.906 E.0164
G1 X205.749 Y182.404 E.89137
G1 X205.749 Y182.938 E.0164
G1 X226.251 Y203.439 E.89137
G1 X226.251 Y203.973 E.0164
G1 X205.749 Y183.472 E.89137
G1 X205.749 Y184.005 E.0164
G1 X226.251 Y204.506 E.89137
G1 X226.251 Y205.04 E.0164
G1 X205.749 Y184.539 E.89137
G1 X205.749 Y185.072 E.0164
G1 X226.251 Y205.573 E.89137
G1 X226.251 Y206.107 E.0164
G1 X205.749 Y185.606 E.89137
G1 X205.749 Y186.139 E.0164
G1 X226.251 Y206.64 E.89137
G1 X226.251 Y207.174 E.0164
G1 X205.749 Y186.673 E.89137
G1 X205.749 Y187.207 E.0164
G1 X226.251 Y207.708 E.89137
G1 X226.251 Y208.241 E.0164
G1 X205.749 Y187.74 E.89137
G1 X205.749 Y188.274 E.0164
G1 X226.251 Y208.775 E.89137
G1 X226.251 Y209.308 E.0164
G1 X205.749 Y188.807 E.89137
G1 X205.749 Y189.341 E.0164
G1 X226.251 Y209.842 E.89137
G1 X226.251 Y210.375 E.0164
G1 X205.749 Y189.874 E.89137
G1 X205.749 Y190.408 E.0164
G1 X226.251 Y210.909 E.89137
G1 X226.251 Y211.443 E.0164
G1 X205.749 Y190.942 E.89137
G1 X205.749 Y191.475 E.0164
G1 X226.251 Y211.976 E.89137
G1 X226.251 Y212.51 E.0164
G1 X205.749 Y192.009 E.89137
G1 X205.749 Y192.542 E.0164
G1 X226.251 Y213.043 E.89137
G1 X226.251 Y213.577 E.0164
G1 X219.332 Y206.658 E.30081
G3 X219.511 Y207.371 I-3.337 J1.218 E.02264
G1 X226.251 Y214.11 E.29301
G1 X226.251 Y214.644 E.0164
G1 X219.548 Y207.942 E.29141
G3 X219.504 Y208.431 I-2.47 J.02 E.01512
G1 X226.251 Y215.178 E.29335
G1 X226.251 Y215.711 E.0164
G1 X219.408 Y208.868 E.29753
G3 X219.269 Y209.263 I-6.963 J-2.227 E.01287
G1 X226.251 Y216.245 E.30356
G1 X226.251 Y216.778 E.0164
G1 X219.091 Y209.619 E.31128
G3 X218.883 Y209.944 I-1.728 J-.88 E.01189
G1 X226.251 Y217.312 E.32035
G1 X226.251 Y217.845 E.0164
G1 X218.645 Y210.24 E.33069
G3 X218.379 Y210.507 I-1.471 J-1.199 E.01162
G1 X225.997 Y218.126 E.33125
G1 X225.464 Y218.126 E.0164
G1 X218.084 Y210.746 E.32087
G3 X217.76 Y210.955 I-1.21 J-1.519 E.01188
G1 X224.93 Y218.126 E.31176
M73 P42 R37
G1 X224.396 Y218.126 E.0164
G1 X217.404 Y211.133 E.30402
G3 X217.014 Y211.276 I-.912 J-1.879 E.0128
G1 X223.863 Y218.126 E.29779
G1 X223.329 Y218.126 E.0164
G1 X216.581 Y211.377 E.29341
G3 X216.091 Y211.421 I-.464 J-2.427 E.01514
G1 X222.796 Y218.126 E.2915
G1 X222.262 Y218.126 E.0164
G1 X215.531 Y211.394 E.29267
G3 X214.829 Y211.226 I.647 J-4.247 E.02221
G1 X221.729 Y218.126 E.29998
G1 X221.195 Y218.126 E.0164
G1 X200.694 Y197.624 E.89137
G1 X201.227 Y197.624 E.0164
G1 X212.649 Y209.046 E.4966
G3 X212.482 Y208.346 I3.874 J-1.293 E.02217
G1 X201.761 Y197.624 E.46614
G1 X202.295 Y197.624 E.0164
G1 X212.453 Y207.783 E.44167
G3 X212.498 Y207.295 I4.455 J.17 E.01508
G1 X202.828 Y197.624 E.42045
G1 X203.362 Y197.624 E.0164
G1 X212.6 Y206.863 E.40167
G3 X212.742 Y206.471 I2.032 J.516 E.01282
G1 X203.895 Y197.624 E.38465
G1 X204.429 Y197.624 E.0164
G1 X212.919 Y206.115 E.36916
G3 X213.128 Y205.79 I1.73 J.883 E.01189
G1 X204.962 Y197.624 E.35504
G1 X205.496 Y197.624 E.0164
G1 X213.367 Y205.495 E.3422
G3 X213.633 Y205.228 I1.468 J1.202 E.01162
G1 X205.749 Y197.344 E.34278
G1 X205.749 Y196.811 E.0164
G1 X213.929 Y204.99 E.35563
G3 X214.255 Y204.783 I1.198 J1.53 E.01191
G1 X205.749 Y196.277 E.36983
G1 X205.749 Y195.744 E.0164
G1 X214.614 Y204.608 E.38543
G3 X215.008 Y204.469 I.894 J1.905 E.01288
G1 X205.749 Y195.21 E.40257
G1 X205.749 Y194.677 E.0164
G1 X215.449 Y204.376 E.42171
G3 X215.931 Y204.325 I.651 J3.876 E.01494
G1 X205.749 Y194.143 E.4427
G1 X205.749 Y193.609 E.0164
G1 X216.503 Y204.363 E.46756
G3 X217.215 Y204.541 I-.539 J3.667 E.02259
G1 X205.58 Y192.906 E.50587
; WIPE_START
G1 X206.994 Y194.32 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X199.476 Y195.639 Z1 F30000
G1 X70.365 Y218.295 Z1
G1 Z.6
G1 E.8 F1800
G1 F15000
G1 X29.749 Y177.68 E1.76591
G1 X29.749 Y178.214 E.0164
G1 X69.661 Y218.126 E1.73534
G1 X69.128 Y218.126 E.0164
G1 X29.749 Y178.747 E1.71214
G1 X29.749 Y179.281 E.0164
G1 X68.594 Y218.126 E1.68894
G1 X68.061 Y218.126 E.0164
G1 X29.749 Y179.814 E1.66574
G1 X29.749 Y180.348 E.0164
G1 X67.527 Y218.126 E1.64254
G1 X66.994 Y218.126 E.0164
G1 X29.749 Y180.881 E1.61934
G1 X29.749 Y181.415 E.0164
G1 X66.46 Y218.126 E1.59614
G1 X65.927 Y218.126 E.0164
G1 X29.749 Y181.948 E1.57294
G1 X29.749 Y182.482 E.0164
G1 X65.393 Y218.126 E1.54975
G1 X64.859 Y218.126 E.0164
G1 X29.749 Y183.016 E1.52655
G1 X29.749 Y183.549 E.0164
G1 X64.326 Y218.126 E1.50335
G1 X63.792 Y218.126 E.0164
G1 X29.749 Y184.083 E1.48015
G1 X29.749 Y184.616 E.0164
G1 X63.259 Y218.126 E1.45695
G1 X62.725 Y218.126 E.0164
G1 X29.749 Y185.15 E1.43375
G1 X29.749 Y185.683 E.0164
G1 X62.192 Y218.126 E1.41055
G1 X61.658 Y218.126 E.0164
G1 X29.749 Y186.217 E1.38735
G1 X29.749 Y186.751 E.0164
G1 X61.124 Y218.126 E1.36415
G1 X60.591 Y218.126 E.0164
G1 X29.749 Y187.284 E1.34095
G1 X29.749 Y187.818 E.0164
G1 X60.057 Y218.126 E1.31775
G1 X59.524 Y218.126 E.0164
G1 X29.749 Y188.351 E1.29456
G1 X29.749 Y188.885 E.0164
G1 X58.99 Y218.126 E1.27136
G1 X58.457 Y218.126 E.0164
G1 X29.749 Y189.418 E1.24816
G1 X29.749 Y189.952 E.0164
G1 X57.923 Y218.126 E1.22496
G1 X57.389 Y218.126 E.0164
G1 X29.749 Y190.486 E1.20176
G1 X29.749 Y191.019 E.0164
G1 X56.856 Y218.126 E1.17856
G1 X56.322 Y218.126 E.0164
G1 X29.749 Y191.553 E1.15536
G1 X29.749 Y192.086 E.0164
G1 X55.789 Y218.126 E1.13216
G1 X55.255 Y218.126 E.0164
G1 X29.749 Y192.62 E1.10896
G1 X29.749 Y193.153 E.0164
G1 X41.098 Y204.502 E.49341
G2 X40.414 Y204.352 I-1.104 J3.402 E.02154
G1 X29.749 Y193.687 E.4637
G1 X29.749 Y194.221 E.0164
G1 X39.857 Y204.328 E.43948
G2 X39.381 Y204.386 I.14 J3.165 E.01476
G1 X29.749 Y194.754 E.41878
G1 X29.749 Y195.288 E.0164
G1 X38.948 Y204.486 E.39994
G2 X38.558 Y204.63 I.527 J2.024 E.01279
G1 X29.749 Y195.821 E.383
G1 X29.749 Y196.355 E.0164
G1 X38.206 Y204.811 E.36767
G2 X37.885 Y205.024 I.908 J1.711 E.01185
G1 X29.749 Y196.888 E.35374
G1 X29.749 Y197.422 E.0164
G1 X37.594 Y205.267 E.34107
G2 X37.331 Y205.537 I1.22 J1.448 E.01162
G1 X29.749 Y197.956 E.32964
G1 X29.749 Y198.489 E.0164
G1 X37.097 Y205.836 E.31945
G2 X36.892 Y206.165 I1.54 J1.187 E.01193
G1 X29.749 Y199.023 E.31055
G1 X29.749 Y199.556 E.0164
G1 X36.719 Y206.526 E.30304
G2 X36.582 Y206.922 I1.913 J.886 E.01291
G1 X29.749 Y200.09 E.29706
G1 X29.749 Y200.623 E.0164
G1 X36.487 Y207.36 E.29292
G2 X36.453 Y207.86 I2.481 J.419 E.01543
G1 X29.749 Y201.157 E.29145
G1 X29.749 Y201.691 E.0164
G1 X36.494 Y208.435 E.29326
G2 X36.697 Y209.172 I3.861 J-.667 E.02352
G1 X29.749 Y202.224 E.30208
G1 X29.749 Y202.758 E.0164
G1 X45.117 Y218.126 E.66818
G1 X45.651 Y218.126 E.0164
G1 X38.701 Y211.176 E.30216
G2 X39.437 Y211.378 I1.309 J-3.332 E.02348
G1 X46.184 Y218.126 E.29339
G1 X46.718 Y218.126 E.0164
G1 X40.015 Y211.423 E.29142
G2 X40.512 Y211.386 I.063 J-2.5 E.01533
G1 X47.252 Y218.126 E.29304
G1 X47.785 Y218.126 E.0164
G1 X40.955 Y211.295 E.29696
G2 X41.35 Y211.157 I-2.248 J-7.065 E.01288
G1 X48.319 Y218.126 E.30297
G1 X48.852 Y218.126 E.0164
G1 X41.71 Y210.984 E.31053
G2 X42.039 Y210.778 I-.864 J-1.746 E.01192
G1 X49.386 Y218.126 E.31945
G1 X49.919 Y218.126 E.0164
G1 X42.337 Y210.543 E.32967
G2 X42.607 Y210.28 I-1.183 J-1.484 E.01162
G1 X50.453 Y218.126 E.34112
G1 X50.987 Y218.126 E.0164
G1 X42.849 Y209.988 E.3538
G2 X43.062 Y209.667 I-1.5 J-1.225 E.01186
G1 X51.52 Y218.126 E.36776
G1 X52.054 Y218.126 E.0164
G1 X43.244 Y209.315 E.38306
G2 X43.391 Y208.929 I-1.857 J-.932 E.01272
G1 X52.587 Y218.126 E.39984
G1 X53.121 Y218.126 E.0164
G1 X43.493 Y208.498 E.41859
G2 X43.545 Y208.016 I-2.393 J-.498 E.01494
G1 X53.654 Y218.126 E.43957
G1 X54.188 Y218.126 E.0164
G1 X43.525 Y207.463 E.46361
G2 X43.377 Y206.78 I-4.09 J.534 E.02149
G1 X54.891 Y218.295 E.50065
G1 X44.753 Y218.295 F30000
G1 F15000
G1 X29.749 Y203.291 E.65236
G1 X29.749 Y203.825 E.0164
G1 X44.05 Y218.126 E.62178
G1 X43.517 Y218.126 E.0164
G1 X29.749 Y204.358 E.59858
G1 X29.749 Y204.892 E.0164
G1 X42.983 Y218.126 E.57538
G1 X42.449 Y218.126 E.0164
G1 X29.749 Y205.426 E.55219
G1 X29.749 Y205.959 E.0164
G1 X41.916 Y218.126 E.52899
G1 X41.382 Y218.126 E.0164
G1 X29.749 Y206.493 E.50579
G1 X29.749 Y207.026 E.0164
G1 X40.849 Y218.126 E.48259
G1 X40.315 Y218.126 E.0164
G1 X29.749 Y207.56 E.45939
G1 X29.749 Y208.093 E.0164
G1 X39.782 Y218.126 E.43619
G1 X39.248 Y218.126 E.0164
G1 X29.749 Y208.627 E.41299
G1 X29.749 Y209.16 E.0164
G1 X38.714 Y218.126 E.38979
G1 X38.181 Y218.126 E.0164
G1 X29.749 Y209.694 E.36659
G1 X29.749 Y210.228 E.0164
G1 X37.647 Y218.126 E.34339
G1 X37.114 Y218.126 E.0164
G1 X29.749 Y210.761 E.32019
G1 X29.749 Y211.295 E.0164
G1 X36.58 Y218.126 E.297
G1 X36.047 Y218.126 E.0164
G1 X29.749 Y211.828 E.2738
G1 X29.749 Y212.362 E.0164
G1 X35.513 Y218.126 E.2506
G1 X34.98 Y218.126 E.0164
G1 X29.749 Y212.895 E.2274
G1 X29.749 Y213.429 E.0164
G1 X34.446 Y218.126 E.2042
G1 X33.912 Y218.126 E.0164
G1 X29.749 Y213.963 E.181
G1 X29.749 Y214.496 E.0164
G1 X33.379 Y218.126 E.1578
G1 X32.845 Y218.126 E.0164
G1 X29.749 Y215.03 E.1346
G1 X29.749 Y215.563 E.0164
G1 X32.312 Y218.126 E.1114
G1 X31.778 Y218.126 E.0164
G1 X29.749 Y216.097 E.0882
G1 X29.749 Y216.63 E.0164
G1 X31.245 Y218.126 E.065
G1 X30.711 Y218.126 E.0164
G1 X29.749 Y217.164 E.04181
G1 X29.749 Y217.698 E.0164
G1 X30.347 Y218.295 E.02598
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X29.749 Y217.698 E-.32116
G1 X29.749 Y217.164 E-.20276
G1 X30.189 Y217.603 E-.23608
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
G1 X128.944 Y204.802
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X129.176 Y204.88 E.00811
G3 X127.712 Y204.674 I-1.168 J2.996 E.62065
G3 X128.871 Y204.779 I.285 J3.279 E.03882
G1 X128.887 Y204.784 E.00054
G1 X128.427 Y205.1 F30000
G1 F16213.044
G1 X128.488 Y205.107 E.00204
G3 X128.761 Y205.17 I-.474 J2.705 E.00931
G3 X127.742 Y205.08 I-.753 J2.706 E.55133
G3 X128.21 Y205.073 I.272 J2.733 E.01553
G1 X128.367 Y205.092 E.00526
G1 X128.049 Y205.481 F30000
G1 F16213.044
G1 X128.179 Y205.481 E.00433
G3 X128.417 Y205.509 I-.177 J2.586 E.00795
G3 X127.773 Y205.485 I-.408 J2.366 E.47895
G1 X127.989 Y205.482 E.00716
G1 X127.791 Y205.878 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X127.802 Y205.876 E.00035
G3 X128.349 Y205.895 I.199 J2.168 E.01686
G3 X127.553 Y205.918 I-.342 J1.979 E.36318
G1 X127.732 Y205.888 E.00556
; WIPE_START
M204 S10000
G1 X127.802 Y205.876 E-.02712
G1 X128.15 Y205.87 E-.13223
G1 X128.349 Y205.895 E-.07619
G1 X128.734 Y206.004 E-.15213
G1 X129.091 Y206.186 E-.15212
G1 X129.404 Y206.436 E-.15209
G1 X129.519 Y206.573 E-.06811
; WIPE_END
G1 E-.04 F1800
G1 X137.15 Y206.419 Z1.2 F30000
G1 X216.946 Y204.802 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X217.176 Y204.879 E.00803
G3 X215.712 Y204.674 I-1.168 J2.996 E.62066
G3 X216.871 Y204.779 I.285 J3.279 E.03882
G1 X216.889 Y204.785 E.00061
G1 X216.428 Y205.1 F30000
G1 F16213.044
G1 X216.488 Y205.107 E.00199
G3 X216.761 Y205.17 I-.474 J2.706 E.00931
G3 X215.742 Y205.08 I-.753 J2.706 E.55124
G3 X216.21 Y205.073 I.272 J2.733 E.01553
G1 X216.369 Y205.093 E.00531
G1 X216.05 Y205.481 F30000
G1 F16213.044
G1 X216.179 Y205.481 E.0043
G3 X216.417 Y205.509 I-.177 J2.586 E.00794
G3 X215.773 Y205.485 I-.408 J2.366 E.47895
G1 X215.99 Y205.482 E.0072
G1 X215.816 Y205.876 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X216.15 Y205.872 E.01025
G3 X216.349 Y205.895 I-.149 J2.172 E.00616
G3 X215.757 Y205.882 I-.342 J1.979 E.36953
; WIPE_START
M204 S10000
G1 X216.15 Y205.872 E-.14953
G1 X216.349 Y205.895 E-.07614
G1 X216.734 Y206.004 E-.1521
G1 X217.091 Y206.186 E-.15215
G1 X217.404 Y206.436 E-.1521
G1 X217.536 Y206.593 E-.07799
; WIPE_END
G1 E-.04 F1800
G1 X217.482 Y198.961 Z1.2 F30000
G1 X216.944 Y122.927 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X217.176 Y123.005 E.0081
G3 X215.712 Y122.799 I-1.168 J2.996 E.62066
G3 X216.871 Y122.904 I.285 J3.28 E.0388
G1 X216.887 Y122.909 E.00056
G1 X216.427 Y123.225 F30000
G1 F16213.044
G1 X216.488 Y123.232 E.00203
G3 X216.761 Y123.295 I-.474 J2.708 E.0093
G3 X215.743 Y123.205 I-.753 J2.706 E.55126
G3 X216.21 Y123.198 I.271 J2.736 E.01552
G1 X216.368 Y123.217 E.00527
G1 X216.049 Y123.606 F30000
G1 F16213.044
G1 X216.179 Y123.606 E.00433
G3 X216.417 Y123.634 I-.177 J2.585 E.00795
G3 X215.773 Y123.61 I-.408 J2.366 E.47895
G1 X215.989 Y123.607 E.00716
G1 X215.797 Y124.002 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X215.802 Y124.001 E.00015
G3 X216.349 Y124.02 I.199 J2.167 E.01686
G3 X215.553 Y124.043 I-.342 J1.979 E.36318
G1 X215.738 Y124.012 E.00576
; WIPE_START
M204 S10000
G1 X215.802 Y124.001 E-.02465
G1 X216.15 Y123.995 E-.13224
G1 X216.349 Y124.02 E-.07618
G1 X216.544 Y124.065 E-.07612
G1 X216.917 Y124.211 E-.15216
G1 X217.253 Y124.428 E-.1521
G1 X217.529 Y124.698 E-.14654
; WIPE_END
G1 E-.04 F1800
G1 X217.254 Y117.07 Z1.2 F30000
G1 X214.519 Y41.272 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X214.679 Y41.197 E.00585
G3 X215.712 Y40.924 I1.329 J2.928 E.03562
G3 X217.176 Y41.129 I.285 J3.28 E.04945
G3 X214.394 Y41.344 I-1.168 J2.996 E.57442
G1 X214.467 Y41.302 E.00279
G1 X215.005 Y41.5 F30000
G1 F16213.044
G1 X215.106 Y41.466 E.00354
G3 X215.743 Y41.33 I.902 J2.66 E.02163
G3 X216.761 Y41.42 I.271 J2.735 E.03412
G3 X214.846 Y41.569 I-.753 J2.706 E.52043
G1 X214.95 Y41.524 E.00375
G1 X215.432 Y41.794 F30000
G1 F16213.044
G1 X215.466 Y41.786 E.00117
G3 X215.773 Y41.735 I.543 J2.339 E.01032
G3 X216.417 Y41.759 I.229 J2.581 E.02144
G3 X215.014 Y41.94 I-.408 J2.366 E.45276
G1 X215.375 Y41.814 E.01269
G1 X215.798 Y42.127 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X215.802 Y42.126 E.00014
G3 X216.349 Y42.145 I.199 J2.167 E.01686
G3 X215.553 Y42.168 I-.342 J1.979 E.36318
G1 X215.739 Y42.137 E.00577
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
G1 F16213.044
G1 X126.679 Y41.198 E.00583
G3 X127.712 Y40.924 I1.329 J2.928 E.03562
G3 X129.176 Y41.129 I.285 J3.281 E.04945
G3 X126.395 Y41.344 I-1.168 J2.996 E.57442
G1 X126.468 Y41.302 E.0028
G1 X127.006 Y41.5 F30000
G1 F16213.044
G1 X127.106 Y41.466 E.00353
G3 X127.743 Y41.33 I.902 J2.66 E.02163
G3 X128.761 Y41.42 I.271 J2.735 E.03412
G3 X126.846 Y41.569 I-.753 J2.706 E.52043
G1 X126.951 Y41.524 E.00376
G1 X127.432 Y41.794 F30000
G1 F16213.044
G1 X127.466 Y41.786 E.00116
G3 X127.773 Y41.735 I.543 J2.339 E.01032
G3 X128.417 Y41.759 I.229 J2.581 E.02144
G3 X127.014 Y41.94 I-.408 J2.366 E.45276
G1 X127.375 Y41.813 E.0127
G1 X127.798 Y42.127 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X127.802 Y42.126 E.00014
G3 X128.349 Y42.145 I.199 J2.167 E.01686
G3 X127.553 Y42.168 I-.342 J1.979 E.36318
G1 X127.739 Y42.137 E.00577
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
G1 F16213.044
G1 X41.176 Y41.129 E.00811
G3 X39.712 Y40.924 I-1.168 J2.996 E.62066
G3 X40.871 Y41.029 I.285 J3.281 E.03881
G1 X40.887 Y41.034 E.00054
G1 X40.427 Y41.35 F30000
G1 F16213.044
G1 X40.488 Y41.357 E.00204
G3 X40.761 Y41.42 I-.474 J2.707 E.0093
G3 X39.743 Y41.33 I-.753 J2.706 E.55134
G3 X40.21 Y41.323 I.271 J2.735 E.01552
G1 X40.367 Y41.342 E.00526
G1 X40.049 Y41.731 F30000
G1 F16213.044
G1 X40.179 Y41.731 E.00434
G3 X40.417 Y41.759 I-.177 J2.585 E.00795
G3 X39.773 Y41.735 I-.408 J2.366 E.47895
G1 X39.989 Y41.732 E.00715
G1 X39.798 Y42.127 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X39.802 Y42.126 E.00015
G3 X40.349 Y42.145 I.199 J2.167 E.01686
G3 X39.553 Y42.168 I-.342 J1.979 E.36318
G1 X39.738 Y42.137 E.00576
; WIPE_START
M204 S10000
G1 X39.802 Y42.126 E-.02461
G1 X40.15 Y42.12 E-.13223
G1 X40.349 Y42.145 E-.07618
G1 X40.734 Y42.254 E-.15213
G1 X40.917 Y42.336 E-.07614
G1 X41.253 Y42.553 E-.15212
G1 X41.53 Y42.823 E-.14658
; WIPE_END
G1 E-.04 F1800
G1 X47.084 Y48.058 Z1.2 F30000
G1 X205.416 Y197.291 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X50.584 Y197.291 E5.13608
G1 X50.584 Y54.709 E4.72972
G1 X205.416 Y54.709 E5.13608
G1 X205.416 Y197.231 E4.72773
G1 X205.009 Y196.884 F30000
G1 F16213.044
G1 X50.991 Y196.884 E5.10907
G1 X50.991 Y55.116 E4.70271
G1 X205.009 Y55.116 E5.10907
G1 X205.009 Y196.824 E4.70072
G1 X204.602 Y196.477 F30000
G1 F16213.044
G1 X51.398 Y196.477 E5.08206
G1 X51.398 Y55.523 E4.67571
G1 X204.602 Y55.523 E5.08206
G1 X204.602 Y196.417 E4.67372
G1 X204.21 Y196.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X51.79 Y196.085 E4.68344
G1 X51.79 Y55.915 E4.30703
G1 X204.21 Y55.915 E4.68344
G1 X204.21 Y196.025 E4.30519
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
G1 F16213.044
G1 X38.679 Y123.072 E.00583
G3 X39.712 Y122.799 I1.329 J2.928 E.03562
G3 X41.176 Y123.004 I.285 J3.281 E.04944
G3 X38.395 Y123.219 I-1.168 J2.996 E.57442
G1 X38.468 Y123.177 E.0028
G1 X39.006 Y123.375 F30000
G1 F16213.044
G1 X39.106 Y123.341 E.00353
G3 X39.743 Y123.205 I.902 J2.66 E.02163
G3 X40.761 Y123.295 I.271 J2.735 E.03412
G3 X38.846 Y123.444 I-.753 J2.706 E.52044
G1 X38.951 Y123.399 E.00376
G1 X39.432 Y123.669 F30000
G1 F16213.044
G1 X39.466 Y123.661 E.00116
G3 X39.773 Y123.61 I.543 J2.339 E.01032
G3 X40.417 Y123.634 I.229 J2.581 E.02144
G3 X39.014 Y123.815 I-.408 J2.366 E.45276
G1 X39.376 Y123.688 E.01271
G1 X39.798 Y124.002 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X39.802 Y124.001 E.00014
G3 X40.349 Y124.02 I.199 J2.168 E.01686
G3 X39.553 Y124.043 I-.342 J1.979 E.36318
M73 P43 R37
G1 X39.739 Y124.012 E.00577
; WIPE_START
M204 S10000
G1 X39.802 Y124.001 E-.02452
G1 X40.15 Y123.995 E-.13223
G1 X40.349 Y124.02 E-.0762
G1 X40.734 Y124.129 E-.15212
G1 X41.091 Y124.311 E-.15209
G1 X41.404 Y124.561 E-.15213
G1 X41.53 Y124.697 E-.07072
; WIPE_END
G1 E-.04 F1800
G1 X41.475 Y132.33 Z1.2 F30000
G1 X40.946 Y204.802 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X41.176 Y204.88 E.00804
G3 X39.712 Y204.674 I-1.168 J2.996 E.62065
G3 X40.871 Y204.779 I.285 J3.279 E.03882
G1 X40.889 Y204.785 E.00061
G1 X40.428 Y205.1 F30000
G1 F16213.044
G1 X40.488 Y205.107 E.00199
G3 X40.761 Y205.17 I-.474 J2.705 E.00931
G3 X39.742 Y205.08 I-.753 J2.706 E.55133
G3 X40.21 Y205.073 I.272 J2.733 E.01553
G1 X40.369 Y205.092 E.00531
G1 X40.05 Y205.481 F30000
G1 F16213.044
G1 X40.179 Y205.481 E.0043
G3 X40.417 Y205.509 I-.177 J2.586 E.00795
G3 X39.773 Y205.485 I-.408 J2.366 E.47895
G1 X39.99 Y205.482 E.00719
G1 X39.816 Y205.876 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X40.15 Y205.872 E.01026
G3 X40.349 Y205.895 I-.149 J2.172 E.00616
G3 X39.757 Y205.882 I-.342 J1.979 E.36953
; WIPE_START
M204 S10000
G1 X40.15 Y205.872 E-.14956
G1 X40.349 Y205.895 E-.07615
G1 X40.734 Y206.004 E-.15213
G1 X41.091 Y206.186 E-.15212
G1 X41.404 Y206.436 E-.15209
G1 X41.535 Y206.593 E-.07795
; WIPE_END
G1 E-.04 F1800
G1 X49.152 Y207.081 Z1.2 F30000
G1 X226.584 Y218.459 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X29.416 Y218.459 E6.54041
G1 X29.416 Y33.541 E6.13406
G1 X226.584 Y33.541 E6.54041
G1 X226.584 Y218.399 E6.13207
G1 X226.991 Y218.866 F30000
G1 F16213.044
G1 X29.009 Y218.866 E6.56742
G1 X29.009 Y33.134 E6.16106
G1 X226.991 Y33.134 E6.56742
G1 X226.991 Y218.806 E6.15907
G1 X227.398 Y219.273 F30000
G1 F16213.044
G1 X28.602 Y219.273 E6.59442
G1 X28.602 Y32.727 E6.18807
G1 X227.398 Y32.727 E6.59442
G1 X227.398 Y219.213 E6.18608
G1 X227.79 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X28.21 Y219.665 E6.13254
G1 X28.21 Y32.335 E5.75613
G1 X227.79 Y32.335 E6.13254
G1 X227.79 Y219.605 E5.75429
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
G1 F16200
G1 X226.236 Y217.744 E.05401
G1 X225.868 Y218.111 E.01722
G1 X218.328 Y210.571 E.35368
G3 X215.334 Y211.375 I-2.365 J-2.833 E.10612
G1 X208.597 Y218.111 E.31603
G1 X188.126 Y197.639 E.96034
G1 X188.771 Y197.639 E.0214
G1 X168.298 Y218.111 E.96038
G1 X147.827 Y197.639 E.96034
G1 X148.472 Y197.639 E.0214
G1 X127.999 Y218.111 E.96038
G1 X107.528 Y197.639 E.96034
G1 X108.173 Y197.639 E.0214
G1 X87.7 Y218.111 E.96038
G1 X67.229 Y197.639 E.96034
G1 X67.874 Y197.639 E.0214
G1 X47.403 Y218.111 E.96034
G1 X40.667 Y211.376 E.31595
G3 X37.67 Y210.573 I-.625 J-3.663 E.1062
G1 X30.132 Y218.111 E.3536
G1 X29.764 Y217.744 E.01722
G1 X29.764 Y216.116 E.05401
G1 X36.564 Y208.821 F30000
G1 F16200
G3 X36.5 Y207.209 I4.085 J-.969 E.05385
G1 X29.764 Y200.473 E.31599
G1 X29.764 Y201.208 E.02435
G1 X50.236 Y180.737 E.96034
G1 X50.236 Y180.646 E.00301
G1 X29.764 Y160.175 E.96034
G1 X29.764 Y160.909 E.02435
G1 X50.236 Y140.438 E.96034
G1 X50.236 Y140.347 E.00301
G1 X39.4 Y129.511 E.50832
G3 X38.441 Y129.204 I1.285 J-5.655 E.03343
G1 X29.764 Y137.881 E.40705
G1 X29.764 Y137.147 E.02435
G1 X50.236 Y157.618 E.96034
G1 X50.236 Y157.709 E.00301
G1 X29.764 Y178.18 E.96034
G1 X29.764 Y177.446 E.02435
G1 X70.429 Y218.111 E1.90768
G1 X90.902 Y197.639 E.96038
G1 X90.257 Y197.639 E.0214
G1 X110.728 Y218.111 E.96034
G1 X131.201 Y197.639 E.96038
G1 X130.556 Y197.639 E.0214
G1 X151.027 Y218.111 E.96034
G1 X171.5 Y197.639 E.96038
G1 X170.855 Y197.639 E.0214
G1 X191.328 Y218.111 E.96038
G1 X226.236 Y183.203 E1.63761
G1 X226.236 Y183.937 E.02435
G1 X205.764 Y163.466 E.96034
G1 X205.764 Y163.375 E.00301
G1 X226.236 Y142.904 E.96034
G1 X226.236 Y143.638 E.02435
G1 X205.764 Y123.167 E.96034
G1 X205.764 Y123.076 E.00301
G1 X226.236 Y102.605 E.96034
G1 X226.236 Y103.339 E.02435
G1 X205.764 Y82.868 E.96034
G1 X205.764 Y82.777 E.00301
G1 X226.236 Y62.306 E.96034
G1 X226.236 Y63.04 E.02435
G1 X197.085 Y33.889 E1.36753
G1 X176.612 Y54.361 E.96038
G1 X177.257 Y54.361 E.0214
G1 X156.786 Y33.889 E.96034
G1 X136.313 Y54.361 E.96038
G1 X136.958 Y54.361 E.0214
G1 X129.798 Y47.2 E.3359
G3 X126.2 Y47.203 I-1.801 J-3.19 E.12477
G1 X119.042 Y54.361 E.33578
G1 X119.687 Y54.361 E.0214
G1 X99.214 Y33.889 E.96038
G1 X78.743 Y54.361 E.96034
G1 X79.388 Y54.361 E.0214
G1 X58.915 Y33.889 E.96038
G1 X29.764 Y63.04 E1.36753
G1 X29.764 Y62.306 E.02436
G1 X50.236 Y82.777 E.96034
G1 X50.236 Y82.868 E.00301
G1 X29.764 Y103.339 E.96034
G1 X29.764 Y102.605 E.02435
G1 X50.236 Y123.076 E.96034
G1 X50.236 Y123.167 E.00301
G1 X29.764 Y143.638 E.96034
G1 X29.764 Y142.904 E.02435
G1 X50.236 Y163.375 E.96034
G1 X50.236 Y163.466 E.00301
G1 X29.764 Y183.937 E.96034
G1 X29.764 Y183.203 E.02435
G1 X64.672 Y218.111 E1.63761
G1 X85.145 Y197.639 E.96038
G1 X84.5 Y197.639 E.0214
G1 X104.971 Y218.111 E.96034
G1 X125.444 Y197.639 E.96038
G1 X124.799 Y197.639 E.0214
G1 X145.27 Y218.111 E.96034
G1 X165.743 Y197.639 E.96038
G1 X165.098 Y197.639 E.0214
G1 X185.571 Y218.111 E.96038
G1 X226.236 Y177.446 E1.90768
G1 X226.236 Y178.18 E.02436
G1 X205.764 Y157.709 E.96034
G1 X205.764 Y157.618 E.00301
G1 X226.236 Y137.147 E.96034
G1 X226.236 Y137.881 E.02435
G1 X217.559 Y129.205 E.40703
G3 X216.596 Y129.515 I-2.543 J-6.23 E.0336
G1 X205.764 Y140.347 E.50813
G1 X205.764 Y140.438 E.00301
G1 X226.236 Y160.909 E.96034
G1 X226.236 Y160.175 E.02436
G1 X205.764 Y180.646 E.96034
G1 X205.764 Y180.737 E.00301
G1 X226.236 Y201.208 E.96034
G1 X226.236 Y200.473 E.02436
G1 X219.502 Y207.207 E.31589
G3 X219.435 Y208.82 I-3.566 J.661 E.05398
; WIPE_START
G1 X219.567 Y207.875 E-.36237
G1 X219.502 Y207.207 E-.25496
G1 X219.767 Y206.942 E-.14267
; WIPE_END
G1 E-.04 F1800
G1 X214.982 Y204.461 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
G1 F16200
G3 X216.593 Y204.359 I1.028 J3.467 E.054
G1 X226.236 Y194.716 E.45236
G1 X226.236 Y195.451 E.02436
G1 X205.764 Y174.98 E.96034
G1 X205.764 Y174.889 E.00301
G1 X226.236 Y154.418 E.96034
G1 X226.236 Y155.152 E.02436
G1 X205.764 Y134.681 E.96034
G1 X205.764 Y134.59 E.00301
G1 X212.794 Y127.561 E.32976
G3 X212.794 Y124.439 I3.243 J-1.561 E.1071
G1 X205.764 Y117.41 E.32976
G1 X205.764 Y117.319 E.00301
G1 X226.236 Y96.848 E.96034
G1 X226.236 Y97.582 E.02435
G1 X205.764 Y77.111 E.96034
G1 X205.764 Y77.02 E.00301
G1 X226.236 Y56.549 E.96034
G1 X226.236 Y57.284 E.02435
G1 X216.593 Y47.641 E.45236
G3 X214.982 Y47.539 I-.582 J-3.583 E.05398
; WIPE_START
G1 X215.911 Y47.691 E-.35766
G1 X216.593 Y47.641 E-.2597
G1 X216.858 Y47.906 E-.14264
; WIPE_END
G1 E-.04 F1800
G1 X219.435 Y43.18 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
G1 F16200
G3 X219.502 Y44.793 I-3.499 J.952 E.05398
G1 X226.236 Y51.527 E.31589
G1 X226.236 Y50.792 E.02435
G1 X205.764 Y71.263 E.96034
G1 X205.764 Y71.354 E.00301
G1 X226.236 Y91.825 E.96034
G1 X226.236 Y91.091 E.02435
G1 X205.764 Y111.562 E.96034
G1 X205.764 Y111.653 E.00301
G1 X216.596 Y122.485 E.50813
G3 X217.559 Y122.795 I-1.581 J6.545 E.0336
G1 X226.236 Y114.119 E.40703
G1 X226.236 Y114.853 E.02435
G1 X205.764 Y94.382 E.96034
G1 X205.764 Y94.291 E.00301
G1 X226.236 Y73.82 E.96034
G1 X226.236 Y74.554 E.02435
G1 X185.571 Y33.889 E1.90768
G1 X165.098 Y54.361 E.96038
G1 X165.743 Y54.361 E.0214
G1 X145.272 Y33.889 E.96034
G1 X124.799 Y54.361 E.96038
G1 X125.444 Y54.361 E.0214
G1 X104.973 Y33.889 E.96034
G1 X84.5 Y54.361 E.96038
G1 X85.145 Y54.361 E.0214
G1 X64.672 Y33.889 E.96038
G1 X29.764 Y68.797 E1.63761
G1 X29.764 Y68.063 E.02435
G1 X50.236 Y88.534 E.96034
G1 X50.236 Y88.625 E.00301
G1 X29.764 Y109.096 E.96034
G1 X29.764 Y108.362 E.02435
G1 X50.236 Y128.833 E.96034
G1 X50.236 Y128.924 E.00301
G1 X29.764 Y149.395 E.96034
G1 X29.764 Y148.661 E.02435
G1 X50.236 Y169.132 E.96034
G1 X50.236 Y169.223 E.00301
G1 X29.764 Y189.694 E.96034
G1 X29.764 Y188.96 E.02435
G1 X58.915 Y218.111 E1.36753
G1 X79.388 Y197.639 E.96038
G1 X78.743 Y197.639 E.0214
G1 X99.214 Y218.111 E.96034
G1 X119.687 Y197.639 E.96038
G1 X119.042 Y197.639 E.0214
G1 X126.2 Y204.797 E.33578
G3 X129.798 Y204.8 I1.797 J3.165 E.12485
G1 X136.958 Y197.639 E.3359
G1 X136.313 Y197.639 E.0214
G1 X156.786 Y218.111 E.96038
G1 X177.257 Y197.639 E.96034
G1 X176.612 Y197.639 E.0214
G1 X197.085 Y218.111 E.96038
G1 X226.236 Y188.96 E1.36753
G1 X226.236 Y189.694 E.02436
G1 X205.764 Y169.223 E.96034
G1 X205.764 Y169.132 E.00301
G1 X226.236 Y148.661 E.96034
G1 X226.236 Y149.395 E.02435
G1 X205.764 Y128.924 E.96034
G1 X205.764 Y128.833 E.00301
M73 P43 R36
G1 X226.236 Y108.362 E.96034
G1 X226.236 Y109.096 E.02435
G1 X205.764 Y88.625 E.96034
G1 X205.764 Y88.534 E.00301
G1 X226.236 Y68.063 E.96034
G1 X226.236 Y68.797 E.02435
G1 X191.328 Y33.889 E1.63761
G1 X170.855 Y54.361 E.96038
G1 X171.5 Y54.361 E.0214
G1 X151.029 Y33.889 E.96034
G1 X130.556 Y54.361 E.96038
G1 X131.201 Y54.361 E.0214
G1 X110.73 Y33.889 E.96034
G1 X90.257 Y54.361 E.96038
G1 X90.902 Y54.361 E.0214
G1 X70.429 Y33.889 E.96038
G1 X29.764 Y74.554 E1.90768
G1 X29.764 Y73.82 E.02436
G1 X50.236 Y94.291 E.96034
G1 X50.236 Y94.382 E.00301
G1 X29.764 Y114.853 E.96034
G1 X29.764 Y114.119 E.02435
G1 X38.441 Y122.796 E.40706
G3 X39.395 Y122.494 I2.091 J4.945 E.03321
G1 X50.236 Y111.653 E.50857
G1 X50.236 Y111.562 E.00301
G1 X29.764 Y91.091 E.96034
G1 X29.764 Y91.825 E.02436
G1 X50.236 Y71.354 E.96034
G1 X50.236 Y71.263 E.00301
G1 X29.764 Y50.792 E.96034
G1 X29.764 Y51.527 E.02436
G1 X36.5 Y44.791 E.31599
G3 X36.564 Y43.179 I4.148 J-.643 E.05385
; WIPE_START
G1 X36.438 Y43.947 E-.29591
G1 X36.5 Y44.791 E-.32142
G1 X36.235 Y45.056 E-.14267
; WIPE_END
G1 E-.04 F1800
G1 X41.02 Y47.54 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
G1 F16200
G3 X39.41 Y47.638 I-1.056 J-4.073 E.05385
G1 X29.764 Y57.283 E.45248
G1 X29.764 Y56.549 E.02436
G1 X50.236 Y77.02 E.96034
G1 X50.236 Y77.111 E.00301
M73 P44 R36
G1 X29.764 Y97.582 E.96034
G1 X29.764 Y96.848 E.02436
G1 X50.236 Y117.319 E.96034
G1 X50.236 Y117.41 E.00301
G1 X43.203 Y124.442 E.32989
G3 X43.203 Y127.558 I-3.341 J1.558 E.10672
G1 X50.236 Y134.59 E.32989
G1 X50.236 Y134.681 E.00301
G1 X29.764 Y155.152 E.96034
G1 X29.764 Y154.418 E.02435
G1 X50.236 Y174.889 E.96034
G1 X50.236 Y174.98 E.00301
G1 X29.764 Y195.451 E.96034
G1 X29.764 Y194.716 E.02435
G1 X39.414 Y204.366 E.45268
G3 X41.024 Y204.461 I.569 J4.041 E.05385
G1 X52.232 Y197.639 F30000
G1 F16200
G1 X50.604 Y197.639 E.05401
G1 X42.698 Y205.545 E.37088
G3 X43.513 Y208.465 I-2.854 J2.371 E.10361
G1 X53.16 Y218.111 E.45251
G1 X73.631 Y197.639 E.96034
G1 X72.986 Y197.639 E.0214
G1 X93.459 Y218.111 E.96038
G1 X113.93 Y197.639 E.96034
G1 X113.285 Y197.639 E.0214
G1 X124.607 Y208.962 E.53116
G2 X124.923 Y209.674 I3.531 J-1.141 E.02589
G1 X116.485 Y218.111 E.39582
G1 X96.014 Y197.639 E.96034
G1 X96.659 Y197.639 E.0214
G1 X76.186 Y218.111 E.96038
G1 X55.715 Y197.639 E.96034
G1 X56.36 Y197.639 E.0214
G1 X35.889 Y218.111 E.96034
G1 X29.764 Y211.987 E.28729
G1 X29.764 Y212.722 E.02435
G1 X50.236 Y192.251 E.96034
G1 X50.236 Y192.16 E.00301
G1 X29.764 Y171.689 E.96034
G1 X29.764 Y172.423 E.02435
G1 X50.236 Y151.952 E.96034
G1 X50.236 Y151.861 E.00301
G1 X29.764 Y131.39 E.96034
G1 X29.764 Y132.124 E.02435
G1 X36.487 Y125.402 E.31535
G2 X36.487 Y126.598 I3.637 J.598 E.03986
G1 X29.764 Y119.876 E.31535
G1 X29.764 Y120.61 E.02436
G1 X50.236 Y100.139 E.96034
G1 X50.236 Y100.048 E.00301
G1 X29.764 Y79.577 E.96034
G1 X29.764 Y80.311 E.02436
G1 X50.236 Y59.84 E.96034
G1 X50.236 Y59.749 E.00301
G1 X29.764 Y39.278 E.96034
G1 X29.764 Y40.013 E.02436
G1 X35.889 Y33.889 E.28729
G1 X56.361 Y54.361 E.96034
G1 X55.715 Y54.361 E.0214
G1 X76.186 Y33.889 E.96034
G1 X96.659 Y54.361 E.96038
G1 X96.014 Y54.361 E.0214
G1 X116.485 Y33.889 E.96034
G1 X124.924 Y42.326 E.39582
G2 X124.607 Y43.038 I3.206 J1.849 E.02589
G1 X113.285 Y54.361 E.53116
G1 X113.93 Y54.361 E.0214
G1 X93.459 Y33.889 E.96034
G1 X72.986 Y54.361 E.96038
G1 X73.631 Y54.361 E.0214
G1 X53.16 Y33.889 E.96034
G1 X43.513 Y43.535 E.45251
G3 X42.698 Y46.455 I-3.67 J.549 E.10361
G1 X50.604 Y54.361 E.37088
G1 X52.232 Y54.361 E.05401
; WIPE_START
G1 X50.604 Y54.361 E-.61876
G1 X50.341 Y54.098 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X44.626 Y49.039 Z1.2 F30000
G1 X29.764 Y35.884 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F16200
G1 X29.764 Y34.256 E.05401
G1 X30.132 Y33.889 E.01722
G1 X37.67 Y41.427 E.3536
G3 X40.667 Y40.624 I2.397 J2.951 E.10604
G1 X47.403 Y33.889 E.31595
G1 X67.874 Y54.361 E.96034
G1 X67.229 Y54.361 E.0214
G1 X87.7 Y33.889 E.96034
G1 X108.173 Y54.361 E.96038
G1 X107.528 Y54.361 E.0214
G1 X127.999 Y33.889 E.96034
G1 X148.472 Y54.361 E.96038
G1 X147.827 Y54.361 E.0214
G1 X168.298 Y33.889 E.96034
G1 X188.771 Y54.361 E.96038
G1 X188.126 Y54.361 E.0214
G1 X208.597 Y33.889 E.96034
G1 X215.337 Y40.628 E.31615
G3 X218.328 Y41.429 I.634 J3.621 E.10605
G1 X225.868 Y33.889 E.35368
G1 X226.236 Y34.256 E.01722
G1 X226.236 Y35.884 E.05401
; WIPE_START
G1 X226.236 Y34.256 E-.61876
G1 X225.972 Y33.993 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X220.347 Y39.153 Z1.2 F30000
G1 X203.768 Y54.361 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F16200
G1 X205.396 Y54.361 E.05401
G1 X213.304 Y46.453 E.37094
G3 X212.485 Y43.533 I2.849 J-2.373 E.10363
G1 X202.84 Y33.889 E.45246
G1 X182.369 Y54.361 E.96034
G1 X183.014 Y54.361 E.0214
G1 X162.541 Y33.889 E.96038
G1 X142.07 Y54.361 E.96034
G1 X142.715 Y54.361 E.0214
G1 X131.397 Y43.042 E.53096
G2 X131.076 Y42.327 I-3.655 J1.21 E.02606
G1 X139.515 Y33.889 E.39585
G1 X159.986 Y54.361 E.96034
G1 X159.341 Y54.361 E.0214
G1 X179.814 Y33.889 E.96038
G1 X200.285 Y54.361 E.96034
G1 X199.64 Y54.361 E.0214
G1 X220.111 Y33.889 E.96034
G1 X226.236 Y40.013 E.28729
G1 X226.236 Y39.278 E.02435
G1 X205.764 Y59.749 E.96034
G1 X205.764 Y59.84 E.00301
G1 X226.236 Y80.311 E.96034
G1 X226.236 Y79.577 E.02435
G1 X205.764 Y100.048 E.96034
G1 X205.764 Y100.139 E.00301
G1 X226.236 Y120.61 E.96034
G1 X226.236 Y119.876 E.02435
G1 X219.512 Y126.599 E.31541
G2 X219.512 Y125.401 I-4.864 J-.599 E.03986
G1 X226.236 Y132.124 E.31541
G1 X226.236 Y131.39 E.02436
G1 X205.764 Y151.861 E.96034
G1 X205.764 Y151.952 E.00301
G1 X226.236 Y172.423 E.96034
G1 X226.236 Y171.689 E.02436
G1 X205.764 Y192.16 E.96034
G1 X205.764 Y192.251 E.00301
G1 X226.236 Y212.722 E.96034
G1 X226.236 Y211.987 E.02436
G1 X220.111 Y218.111 E.28729
G1 X199.639 Y197.639 E.96034
G1 X200.285 Y197.639 E.0214
G1 X179.814 Y218.111 E.96034
G1 X159.341 Y197.639 E.96038
G1 X159.986 Y197.639 E.0214
G1 X139.515 Y218.111 E.96034
G1 X131.076 Y209.673 E.39585
G2 X131.397 Y208.958 I-3.338 J-1.927 E.02606
G1 X142.715 Y197.639 E.53096
G1 X142.07 Y197.639 E.0214
G1 X162.541 Y218.111 E.96034
G1 X183.014 Y197.639 E.96038
G1 X182.369 Y197.639 E.0214
G1 X202.84 Y218.111 E.96034
G1 X212.485 Y208.467 E.45246
G3 X213.304 Y205.547 I3.667 J-.547 E.10363
G1 X205.396 Y197.639 E.37094
G1 X203.768 Y197.639 E.05401
; WIPE_START
G1 X205.396 Y197.639 E-.61876
G1 X205.659 Y197.902 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X198.119 Y199.082 Z1.2 F30000
G1 X125.531 Y210.443 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F16200
G2 X126.916 Y211.271 I2.813 J-3.135 E.05385
G1 X133.758 Y218.111 E.32092
G1 X154.229 Y197.639 E.96034
G1 X153.584 Y197.639 E.0214
G1 X174.055 Y218.111 E.96034
G1 X194.528 Y197.639 E.96038
G1 X193.883 Y197.639 E.0214
G1 X214.354 Y218.111 E.96034
G1 X226.236 Y206.23 E.55736
G1 X226.236 Y206.965 E.02436
G1 X205.764 Y186.494 E.96034
G1 X205.764 Y186.403 E.00301
G1 X226.236 Y165.932 E.96034
G1 X226.236 Y166.666 E.02435
G1 X205.764 Y146.195 E.96034
G1 X205.764 Y146.104 E.00301
G1 X226.236 Y125.633 E.96034
G1 X226.236 Y126.367 E.02435
G1 X205.764 Y105.896 E.96034
G1 X205.764 Y105.805 E.00301
G1 X226.236 Y85.334 E.96034
G1 X226.236 Y86.068 E.02435
G1 X205.764 Y65.597 E.96034
G1 X205.764 Y65.506 E.00301
G1 X226.236 Y45.035 E.96034
G1 X226.236 Y45.77 E.02435
G1 X214.354 Y33.889 E.55736
G1 X193.883 Y54.361 E.96034
G1 X194.528 Y54.361 E.0214
G1 X174.055 Y33.889 E.96038
G1 X153.584 Y54.361 E.96034
G1 X154.229 Y54.361 E.0214
G1 X133.758 Y33.889 E.96034
G1 X126.916 Y40.729 E.32092
G3 X129.087 Y40.732 I1.081 J3.42 E.07315
G1 X122.242 Y33.889 E.32105
G1 X101.771 Y54.361 E.96034
G1 X102.416 Y54.361 E.0214
G1 X81.945 Y33.889 E.96034
G1 X61.472 Y54.361 E.96038
G1 X62.117 Y54.361 E.0214
G1 X41.646 Y33.889 E.96034
G1 X29.764 Y45.77 E.55736
G1 X29.764 Y45.035 E.02436
G1 X50.236 Y65.506 E.96034
G1 X50.236 Y65.597 E.00301
G1 X29.764 Y86.068 E.96034
G1 X29.764 Y85.334 E.02435
G1 X50.236 Y105.805 E.96034
G1 X50.236 Y105.896 E.00301
G1 X29.764 Y126.367 E.96034
G1 X29.764 Y125.633 E.02435
G1 X50.236 Y146.104 E.96034
G1 X50.236 Y146.195 E.00301
G1 X29.764 Y166.666 E.96034
G1 X29.764 Y165.932 E.02435
G1 X50.236 Y186.403 E.96034
G1 X50.236 Y186.494 E.00301
G1 X29.764 Y206.965 E.96034
G1 X29.764 Y206.23 E.02435
G1 X41.646 Y218.111 E.55736
G1 X62.117 Y197.639 E.96034
G1 X61.472 Y197.639 E.0214
G1 X81.945 Y218.111 E.96038
G1 X102.416 Y197.639 E.96034
G1 X101.771 Y197.639 E.0214
G1 X122.242 Y218.111 E.96034
G1 X129.087 Y211.268 E.32105
G2 X130.474 Y210.443 I-1.117 J-3.457 E.05398
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F16200
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
G1 X128.959 Y204.807
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F16213.044
G1 X129.175 Y204.879 E.00759
G3 X127.724 Y204.673 I-1.167 J2.996 E.62105
G3 X128.871 Y204.779 I.274 J3.278 E.03842
G1 X128.901 Y204.789 E.00104
G1 X128.442 Y205.102 F30000
G1 F16213.044
G1 X128.488 Y205.107 E.00152
G3 X128.761 Y205.17 I-.473 J2.7 E.00931
G3 X127.754 Y205.079 I-.752 J2.706 E.55171
G3 X128.21 Y205.073 I.261 J2.729 E.01513
G1 X128.383 Y205.094 E.00578
G1 X128.065 Y205.481 F30000
G1 F16213.044
G1 X128.179 Y205.491 E.0038
G3 X128.651 Y205.562 I-.248 J3.247 E.01586
G3 X127.785 Y205.485 I-.643 J2.314 E.47154
G1 X128.005 Y205.481 E.00729
G1 X127.803 Y205.877 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X127.814 Y205.876 E.00033
G3 X128.349 Y205.895 I.188 J2.156 E.01649
G3 X127.553 Y205.918 I-.341 J1.979 E.36317
G1 X127.744 Y205.887 E.00594
; WIPE_START
M204 S10000
G1 X127.814 Y205.876 E-.02693
G1 X128.15 Y205.87 E-.1277
G1 X128.349 Y205.895 E-.07618
G1 X128.734 Y206.004 E-.15213
G1 X129.091 Y206.186 E-.15212
G1 X129.404 Y206.436 E-.15211
G1 X129.527 Y206.583 E-.07284
; WIPE_END
G1 E-.04 F1800
G1 X137.158 Y206.442 Z1.4 F30000
G1 X214.524 Y205.02 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X214.679 Y204.948 E.00567
G3 X215.724 Y204.673 I1.329 J2.927 E.03601
G3 X217.176 Y204.88 I.274 J3.277 E.04906
G3 X214.395 Y205.094 I-1.167 J2.996 E.57441
G1 X214.472 Y205.05 E.00296
G1 X215.013 Y205.247 F30000
G1 F16213.044
G1 X215.107 Y205.216 E.00327
G3 X215.754 Y205.079 I.903 J2.66 E.02202
G3 X216.761 Y205.17 I.261 J2.731 E.03373
G3 X214.847 Y205.319 I-.752 J2.706 E.52041
G1 X214.958 Y205.271 E.00402
G1 X215.5 Y205.527 F30000
G1 F16213.044
G1 X215.785 Y205.485 E.00954
G3 X216.651 Y205.562 I.145 J3.255 E.02893
G3 X215.442 Y205.542 I-.643 J2.314 E.46
G1 X215.853 Y205.875 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X216.15 Y205.872 E.00914
G3 X216.349 Y205.895 I-.148 J2.159 E.00616
G3 X215.793 Y205.878 I-.341 J1.979 E.37063
; WIPE_START
M204 S10000
G1 X216.15 Y205.872 E-.13583
G1 X216.349 Y205.895 E-.07614
G1 X216.734 Y206.004 E-.15213
G1 X217.091 Y206.186 E-.15209
G1 X217.404 Y206.436 E-.15213
G1 X217.559 Y206.621 E-.09169
; WIPE_END
G1 E-.04 F1800
G1 X217.282 Y198.993 Z1.4 F30000
G1 X214.528 Y123.143 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X214.679 Y123.073 E.00554
G3 X215.724 Y122.798 I1.329 J2.928 E.03601
G3 X217.176 Y123.004 I.274 J3.279 E.04905
G3 X214.395 Y123.219 I-1.167 J2.996 E.57442
G1 X214.476 Y123.173 E.00309
G1 X215.014 Y123.372 F30000
G1 F16213.044
G1 X215.107 Y123.341 E.00324
G3 X215.754 Y123.204 I.902 J2.66 E.02202
G3 X216.761 Y123.295 I.261 J2.731 E.03372
G3 X214.847 Y123.444 I-.752 J2.706 E.52042
G1 X214.959 Y123.395 E.00406
G1 X215.501 Y123.652 F30000
G1 F16213.044
G1 X215.785 Y123.61 E.0095
G3 X216.651 Y123.687 I.145 J3.257 E.02892
G3 X215.443 Y123.666 I-.643 J2.314 E.46005
G1 X215.81 Y124.001 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X215.814 Y124.001 E.00013
G3 X216.349 Y124.02 I.188 J2.156 E.01649
G3 X215.553 Y124.043 I-.341 J1.979 E.36317
G1 X215.751 Y124.011 E.00615
; WIPE_START
M204 S10000
G1 X215.814 Y124.001 E-.02442
G1 X216.15 Y123.995 E-.1277
G1 X216.349 Y124.02 E-.07618
G1 X216.734 Y124.129 E-.15213
G1 X217.091 Y124.311 E-.15209
G1 X217.404 Y124.561 E-.15213
G1 X217.531 Y124.713 E-.07536
; WIPE_END
G1 E-.04 F1800
G1 X217.257 Y117.085 Z1.4 F30000
G1 X214.527 Y41.268 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X214.679 Y41.198 E.00555
G3 X215.724 Y40.923 I1.329 J2.927 E.03601
G3 X217.176 Y41.129 I.274 J3.279 E.04905
G3 X214.395 Y41.344 I-1.167 J2.996 E.57442
G1 X214.475 Y41.298 E.00308
G1 X215.014 Y41.497 F30000
G1 F16213.044
G1 X215.107 Y41.466 E.00325
G3 X215.754 Y41.329 I.902 J2.66 E.02202
G3 X216.761 Y41.42 I.261 J2.731 E.03372
G3 X214.847 Y41.569 I-.752 J2.706 E.52042
G1 X214.958 Y41.521 E.00404
G1 X215.501 Y41.777 F30000
G1 F16213.044
G1 X215.785 Y41.735 E.00952
G3 X216.651 Y41.812 I.145 J3.256 E.02893
G3 X215.443 Y41.792 I-.643 J2.314 E.46003
G1 X215.81 Y42.126 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X215.814 Y42.126 E.00012
G3 X216.349 Y42.145 I.188 J2.156 E.01649
G3 X215.553 Y42.168 I-.341 J1.979 E.36317
G1 X215.751 Y42.136 E.00615
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
G1 F16213.044
G1 X129.175 Y41.129 E.00757
G3 X127.724 Y40.923 I-1.167 J2.996 E.62106
G3 X128.871 Y41.029 I.274 J3.279 E.03842
G1 X128.902 Y41.039 E.00106
G1 X128.443 Y41.352 F30000
G1 F16213.044
G1 X128.488 Y41.357 E.00151
G3 X128.761 Y41.42 I-.473 J2.702 E.0093
G3 X127.754 Y41.329 I-.752 J2.706 E.55171
G3 X128.21 Y41.323 I.261 J2.73 E.01513
G1 X128.383 Y41.344 E.00579
G1 X128.065 Y41.731 F30000
G1 F16213.044
G1 X128.179 Y41.741 E.00378
G3 X128.651 Y41.812 I-.248 J3.249 E.01586
G3 X127.785 Y41.735 I-.643 J2.313 E.47146
G1 X128.005 Y41.731 E.00731
G1 X127.81 Y42.126 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X127.814 Y42.126 E.00012
G3 X128.349 Y42.145 I.188 J2.156 E.01649
G3 X127.553 Y42.168 I-.341 J1.979 E.36317
G1 X127.751 Y42.136 E.00615
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
G1 X121.9 Y42.684 Z1.4 F30000
G1 X40.959 Y41.057 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X41.175 Y41.129 E.00759
G3 X39.724 Y40.923 I-1.167 J2.996 E.62106
G3 X40.871 Y41.029 I.274 J3.279 E.03842
G1 X40.901 Y41.039 E.00105
G1 X40.442 Y41.352 F30000
G1 F16213.044
G1 X40.488 Y41.357 E.00153
G3 X40.761 Y41.42 I-.473 J2.702 E.0093
G3 X39.754 Y41.329 I-.752 J2.706 E.55171
G3 X40.21 Y41.323 I.261 J2.73 E.01513
G1 X40.383 Y41.344 E.00578
G1 X40.065 Y41.731 F30000
G1 F16213.044
G1 X40.179 Y41.731 E.00381
G3 X40.417 Y41.759 I-.176 J2.575 E.00795
G3 X39.785 Y41.735 I-.407 J2.367 E.47949
G1 X40.005 Y41.731 E.00729
G1 X39.81 Y42.126 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X39.814 Y42.126 E.00013
G3 X40.349 Y42.145 I.188 J2.156 E.01649
G3 X39.553 Y42.168 I-.341 J1.979 E.36317
G1 X39.751 Y42.136 E.00615
; WIPE_START
M204 S10000
G1 X39.814 Y42.126 E-.02441
G1 X40.15 Y42.12 E-.1277
G1 X40.349 Y42.145 E-.07618
G1 X40.734 Y42.254 E-.15213
G1 X41.091 Y42.436 E-.15209
G1 X41.404 Y42.686 E-.15213
G1 X41.531 Y42.838 E-.07537
; WIPE_END
G1 E-.04 F1800
G1 X47.086 Y48.073 Z1.4 F30000
G1 X205.416 Y197.291 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X50.584 Y197.291 E5.13608
G1 X50.584 Y54.709 E4.72972
G1 X205.416 Y54.709 E5.13608
G1 X205.416 Y197.231 E4.72773
G1 X205.009 Y196.884 F30000
G1 F16213.044
G1 X50.991 Y196.884 E5.10907
G1 X50.991 Y55.116 E4.70271
G1 X205.009 Y55.116 E5.10907
G1 X205.009 Y196.824 E4.70072
G1 X204.602 Y196.477 F30000
G1 F16213.044
G1 X51.398 Y196.477 E5.08206
G1 X51.398 Y55.523 E4.67571
G1 X204.602 Y55.523 E5.08206
G1 X204.602 Y196.417 E4.67372
G1 X204.21 Y196.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X51.79 Y196.085 E4.68344
G1 X51.79 Y55.915 E4.30703
G1 X204.21 Y55.915 E4.68344
G1 X204.21 Y196.025 E4.30519
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
G1 F16213.044
G1 X41.176 Y123.004 E.00759
G3 X39.724 Y122.798 I-1.167 J2.996 E.62105
G3 X40.871 Y122.904 I.274 J3.279 E.03841
G1 X40.902 Y122.914 E.00107
G1 X40.443 Y123.227 F30000
G1 F16213.044
G1 X40.488 Y123.232 E.00151
G3 X40.761 Y123.295 I-.473 J2.703 E.0093
G3 X39.754 Y123.204 I-.752 J2.706 E.55172
G3 X40.21 Y123.198 I.261 J2.732 E.01513
G1 X40.383 Y123.219 E.00579
G1 X40.065 Y123.606 F30000
G1 F16213.044
G1 X40.179 Y123.606 E.00379
G3 X40.417 Y123.634 I-.176 J2.575 E.00795
G3 X39.785 Y123.61 I-.407 J2.367 E.47949
G1 X40.005 Y123.606 E.00731
G1 X39.81 Y124.001 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X39.814 Y124.001 E.00013
G3 X40.349 Y124.02 I.188 J2.156 E.01649
G3 X39.553 Y124.043 I-.341 J1.979 E.36317
G1 X39.751 Y124.011 E.00615
; WIPE_START
M204 S10000
G1 X39.814 Y124.001 E-.02435
G1 X40.15 Y123.995 E-.1277
G1 X40.349 Y124.02 E-.07618
G1 X40.734 Y124.129 E-.15214
G1 X41.091 Y124.311 E-.15209
G1 X41.404 Y124.561 E-.15212
G1 X41.531 Y124.713 E-.07543
; WIPE_END
G1 E-.04 F1800
G1 X41.477 Y132.345 Z1.4 F30000
G1 X40.963 Y204.808 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X41.175 Y204.879 E.00744
G3 X39.724 Y204.673 I-1.167 J2.996 E.62105
G3 X40.871 Y204.779 I.274 J3.278 E.03842
G1 X40.905 Y204.79 E.00119
G1 X40.444 Y205.102 F30000
G1 F16213.044
G1 X40.488 Y205.107 E.00148
G3 X40.761 Y205.17 I-.473 J2.7 E.00931
G3 X39.754 Y205.079 I-.752 J2.706 E.55171
G3 X40.21 Y205.073 I.261 J2.729 E.01513
G1 X40.384 Y205.094 E.00582
G1 X40.066 Y205.481 F30000
G1 F16213.044
G1 X40.179 Y205.491 E.00375
G3 X40.651 Y205.562 I-.248 J3.246 E.01586
G3 X39.785 Y205.485 I-.643 J2.314 E.47154
G1 X40.006 Y205.481 E.00734
G1 X39.853 Y205.875 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X40.15 Y205.872 E.00913
G3 X40.349 Y205.895 I-.148 J2.159 E.00616
G3 X39.793 Y205.878 I-.341 J1.979 E.37065
; WIPE_START
M204 S10000
G1 X40.15 Y205.872 E-.13566
G1 X40.349 Y205.895 E-.07614
G1 X40.734 Y206.004 E-.15213
G1 X41.091 Y206.186 E-.15209
G1 X41.404 Y206.436 E-.15213
G1 X41.559 Y206.621 E-.09185
; WIPE_END
G1 E-.04 F1800
G1 X49.176 Y207.108 Z1.4 F30000
G1 X226.584 Y218.459 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X29.416 Y218.459 E6.54041
G1 X29.416 Y33.541 E6.13406
G1 X226.584 Y33.541 E6.54041
G1 X226.584 Y218.399 E6.13207
G1 X226.991 Y218.866 F30000
G1 F16213.044
G1 X29.009 Y218.866 E6.56742
G1 X29.009 Y33.134 E6.16106
G1 X226.991 Y33.134 E6.56742
G1 X226.991 Y218.806 E6.15907
G1 X227.398 Y219.273 F30000
G1 F16213.044
G1 X28.602 Y219.273 E6.59442
G1 X28.602 Y32.727 E6.18807
G1 X227.398 Y32.727 E6.59442
G1 X227.398 Y219.213 E6.18608
G1 X227.79 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X28.21 Y219.665 E6.13254
G1 X28.21 Y32.335 E5.75613
G1 X227.79 Y32.335 E6.13254
G1 X227.79 Y219.605 E5.75429
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
G1 F16200
G2 X219.502 Y207.207 I-3.499 J-.952 E.05398
G1 X226.236 Y200.473 E.31589
G1 X226.236 Y201.208 E.02436
G1 X205.764 Y180.737 E.96034
G1 X205.764 Y180.646 E.00301
G1 X226.236 Y160.175 E.96034
G1 X226.236 Y160.909 E.02436
G1 X205.764 Y140.438 E.96034
G1 X205.764 Y140.347 E.00301
G1 X216.596 Y129.515 E.50813
G2 X217.559 Y129.205 I-1.581 J-6.546 E.0336
G1 X226.236 Y137.881 E.40703
G1 X226.236 Y137.147 E.02435
G1 X205.764 Y157.618 E.96034
G1 X205.764 Y157.709 E.00301
G1 X226.236 Y178.18 E.96034
G1 X226.236 Y177.446 E.02436
G1 X185.571 Y218.111 E1.90768
G1 X165.098 Y197.639 E.96038
G1 X165.743 Y197.639 E.0214
G1 X145.272 Y218.111 E.96034
G1 X124.799 Y197.639 E.96038
G1 X125.444 Y197.639 E.0214
M73 P45 R36
G1 X104.973 Y218.111 E.96034
G1 X84.5 Y197.639 E.96038
G1 X85.145 Y197.639 E.0214
G1 X64.672 Y218.111 E.96038
G1 X29.764 Y183.203 E1.63761
G1 X29.764 Y183.937 E.02435
G1 X50.236 Y163.466 E.96034
G1 X50.236 Y163.375 E.00301
G1 X29.764 Y142.904 E.96034
G1 X29.764 Y143.638 E.02435
G1 X50.236 Y123.167 E.96034
G1 X50.236 Y123.076 E.00301
G1 X29.764 Y102.605 E.96034
G1 X29.764 Y103.339 E.02435
G1 X50.236 Y82.868 E.96034
G1 X50.236 Y82.777 E.00301
G1 X29.764 Y62.306 E.96034
G1 X29.764 Y63.04 E.02436
G1 X58.915 Y33.889 E1.36753
G1 X79.388 Y54.361 E.96038
G1 X78.743 Y54.361 E.0214
G1 X99.214 Y33.889 E.96034
G1 X119.687 Y54.361 E.96038
G1 X119.042 Y54.361 E.0214
G1 X126.2 Y47.203 E.33578
G2 X129.798 Y47.2 I1.797 J-3.192 E.12477
G1 X136.958 Y54.361 E.3359
G1 X136.313 Y54.361 E.0214
G1 X156.786 Y33.889 E.96038
G1 X177.257 Y54.361 E.96034
G1 X176.612 Y54.361 E.0214
G1 X197.085 Y33.889 E.96038
G1 X226.236 Y63.04 E1.36753
G1 X226.236 Y62.306 E.02435
G1 X205.764 Y82.777 E.96034
G1 X205.764 Y82.868 E.00301
G1 X226.236 Y103.339 E.96034
G1 X226.236 Y102.605 E.02435
G1 X205.764 Y123.076 E.96034
G1 X205.764 Y123.167 E.00301
G1 X226.236 Y143.638 E.96034
G1 X226.236 Y142.904 E.02435
G1 X205.764 Y163.375 E.96034
G1 X205.764 Y163.466 E.00301
G1 X226.236 Y183.937 E.96034
G1 X226.236 Y183.203 E.02435
G1 X191.328 Y218.111 E1.63761
G1 X170.855 Y197.639 E.96038
G1 X171.5 Y197.639 E.0214
G1 X151.029 Y218.111 E.96034
G1 X130.556 Y197.639 E.96038
G1 X131.201 Y197.639 E.0214
G1 X110.73 Y218.111 E.96034
G1 X90.257 Y197.639 E.96038
G1 X90.902 Y197.639 E.0214
G1 X70.429 Y218.111 E.96038
G1 X29.764 Y177.446 E1.90768
G1 X29.764 Y178.18 E.02435
G1 X50.236 Y157.709 E.96034
G1 X50.236 Y157.618 E.00301
G1 X29.764 Y137.147 E.96034
G1 X29.764 Y137.881 E.02435
G1 X38.441 Y129.204 E.40705
G2 X39.4 Y129.511 I2.244 J-5.35 E.03343
G1 X50.236 Y140.347 E.50832
G1 X50.236 Y140.438 E.00301
G1 X29.764 Y160.909 E.96034
G1 X29.764 Y160.175 E.02435
G1 X50.236 Y180.646 E.96034
G1 X50.236 Y180.737 E.00301
G1 X29.764 Y201.208 E.96034
G1 X29.764 Y200.473 E.02435
G1 X36.5 Y207.209 E.31599
G2 X36.564 Y208.821 I4.149 J.643 E.05385
; WIPE_START
G1 X36.438 Y208.053 E-.29591
G1 X36.5 Y207.209 E-.32143
G1 X36.235 Y206.944 E-.14267
; WIPE_END
G1 E-.04 F1800
G1 X41.024 Y204.461 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F16200
G2 X39.414 Y204.366 I-1.039 J3.937 E.05385
G1 X29.764 Y194.716 E.4527
G1 X29.764 Y195.451 E.02435
G1 X50.236 Y174.98 E.96034
G1 X50.236 Y174.889 E.00301
M73 P45 R35
G1 X29.764 Y154.418 E.96034
G1 X29.764 Y155.152 E.02435
G1 X50.236 Y134.681 E.96034
G1 X50.236 Y134.59 E.00301
G1 X43.203 Y127.558 E.32989
G2 X43.203 Y124.442 I-3.341 J-1.558 E.10672
G1 X50.236 Y117.41 E.32989
G1 X50.236 Y117.319 E.00301
G1 X29.764 Y96.848 E.96034
G1 X29.764 Y97.582 E.02436
G1 X50.236 Y77.111 E.96034
G1 X50.236 Y77.02 E.00301
G1 X29.764 Y56.549 E.96034
G1 X29.764 Y57.283 E.02436
G1 X39.41 Y47.638 E.45248
G2 X41.02 Y47.54 I.554 J-4.17 E.05385
; WIPE_START
G1 X40.266 Y47.682 E-.29139
G1 X39.41 Y47.638 E-.32595
G1 X39.144 Y47.904 E-.14266
; WIPE_END
G1 E-.04 F1800
G1 X36.564 Y43.179 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F16200
G2 X36.5 Y44.791 I4.085 J.969 E.05385
G1 X29.764 Y51.527 E.31599
G1 X29.764 Y50.792 E.02436
G1 X50.236 Y71.263 E.96034
G1 X50.236 Y71.354 E.00301
G1 X29.764 Y91.825 E.96034
G1 X29.764 Y91.091 E.02436
G1 X50.236 Y111.562 E.96034
G1 X50.236 Y111.653 E.00301
G1 X39.394 Y122.494 E.50859
G2 X38.441 Y122.796 I1.125 J5.211 E.0332
G1 X29.764 Y114.119 E.40706
G1 X29.764 Y114.853 E.02435
G1 X50.236 Y94.382 E.96034
G1 X50.236 Y94.291 E.00301
G1 X29.764 Y73.82 E.96034
G1 X29.764 Y74.554 E.02436
G1 X70.429 Y33.889 E1.90768
G1 X90.902 Y54.361 E.96038
G1 X90.257 Y54.361 E.0214
G1 X110.728 Y33.889 E.96034
G1 X131.201 Y54.361 E.96038
G1 X130.556 Y54.361 E.0214
G1 X151.027 Y33.889 E.96034
G1 X171.5 Y54.361 E.96038
G1 X170.855 Y54.361 E.0214
G1 X191.328 Y33.889 E.96038
G1 X226.236 Y68.797 E1.63761
G1 X226.236 Y68.063 E.02435
G1 X205.764 Y88.534 E.96034
G1 X205.764 Y88.625 E.00301
G1 X226.236 Y109.096 E.96034
G1 X226.236 Y108.362 E.02435
G1 X205.764 Y128.833 E.96034
G1 X205.764 Y128.924 E.00301
G1 X226.236 Y149.395 E.96034
G1 X226.236 Y148.661 E.02435
G1 X205.764 Y169.132 E.96034
G1 X205.764 Y169.223 E.00301
G1 X226.236 Y189.694 E.96034
G1 X226.236 Y188.96 E.02436
G1 X197.085 Y218.111 E1.36753
G1 X176.612 Y197.639 E.96038
G1 X177.257 Y197.639 E.0214
G1 X156.786 Y218.111 E.96034
G1 X136.313 Y197.639 E.96038
G1 X136.958 Y197.639 E.0214
G1 X129.798 Y204.8 E.3359
G2 X126.2 Y204.797 I-1.801 J3.16 E.12486
G1 X119.042 Y197.639 E.33578
G1 X119.687 Y197.639 E.0214
G1 X99.214 Y218.111 E.96038
G1 X78.743 Y197.639 E.96034
G1 X79.388 Y197.639 E.0214
G1 X58.915 Y218.111 E.96038
G1 X29.764 Y188.96 E1.36753
G1 X29.764 Y189.694 E.02435
G1 X50.236 Y169.223 E.96034
G1 X50.236 Y169.132 E.00301
G1 X29.764 Y148.661 E.96034
G1 X29.764 Y149.395 E.02435
G1 X50.236 Y128.924 E.96034
G1 X50.236 Y128.833 E.00301
G1 X29.764 Y108.362 E.96034
G1 X29.764 Y109.096 E.02435
G1 X50.236 Y88.625 E.96034
G1 X50.236 Y88.534 E.00301
G1 X29.764 Y68.063 E.96034
G1 X29.764 Y68.797 E.02435
G1 X64.672 Y33.889 E1.63761
G1 X85.145 Y54.361 E.96038
G1 X84.5 Y54.361 E.0214
G1 X104.971 Y33.889 E.96034
G1 X125.444 Y54.361 E.96038
G1 X124.799 Y54.361 E.0214
G1 X145.27 Y33.889 E.96034
G1 X165.743 Y54.361 E.96038
G1 X165.098 Y54.361 E.0214
G1 X185.571 Y33.889 E.96038
G1 X226.236 Y74.554 E1.90768
G1 X226.236 Y73.82 E.02435
G1 X205.764 Y94.291 E.96034
G1 X205.764 Y94.382 E.00301
G1 X226.236 Y114.853 E.96034
G1 X226.236 Y114.119 E.02435
G1 X217.559 Y122.795 E.40703
G2 X216.596 Y122.485 I-2.544 J6.236 E.0336
G1 X205.764 Y111.653 E.50813
G1 X205.764 Y111.562 E.00301
G1 X226.236 Y91.091 E.96034
G1 X226.236 Y91.825 E.02435
G1 X205.764 Y71.354 E.96034
G1 X205.764 Y71.263 E.00301
G1 X226.236 Y50.792 E.96034
G1 X226.236 Y51.527 E.02435
G1 X219.502 Y44.793 E.31589
G2 X219.435 Y43.18 I-3.566 J-.661 E.05398
; WIPE_START
G1 X219.567 Y44.125 E-.36237
G1 X219.502 Y44.793 E-.25496
G1 X219.767 Y45.058 E-.14267
; WIPE_END
G1 E-.04 F1800
G1 X214.982 Y47.539 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F16200
G2 X216.593 Y47.641 I1.028 J-3.481 E.05398
G1 X226.236 Y57.284 E.45236
G1 X226.236 Y56.549 E.02435
G1 X205.764 Y77.02 E.96034
G1 X205.764 Y77.111 E.00301
G1 X226.236 Y97.582 E.96034
G1 X226.236 Y96.848 E.02435
G1 X205.764 Y117.319 E.96034
G1 X205.764 Y117.41 E.00301
G1 X212.794 Y124.439 E.32976
G2 X212.794 Y127.561 I3.244 J1.561 E.1071
G1 X205.764 Y134.59 E.32976
G1 X205.764 Y134.681 E.00301
G1 X226.236 Y155.152 E.96034
G1 X226.236 Y154.418 E.02436
G1 X205.764 Y174.889 E.96034
G1 X205.764 Y174.98 E.00301
G1 X226.236 Y195.451 E.96034
G1 X226.236 Y194.716 E.02436
G1 X216.593 Y204.359 E.45236
G2 X214.982 Y204.461 I-.584 J3.564 E.054
G1 X203.768 Y197.639 F30000
G1 F16200
G1 X205.396 Y197.639 E.05401
G1 X213.304 Y205.547 E.37094
G2 X212.485 Y208.467 I2.849 J2.373 E.10363
G1 X202.84 Y218.111 E.45246
G1 X182.369 Y197.639 E.96034
G1 X183.014 Y197.639 E.0214
G1 X162.541 Y218.111 E.96038
G1 X142.07 Y197.639 E.96034
G1 X142.715 Y197.639 E.0214
G1 X131.397 Y208.958 E.53096
G3 X131.076 Y209.673 I-3.655 J-1.21 E.02606
G1 X139.515 Y218.111 E.39585
G1 X159.986 Y197.639 E.96034
G1 X159.341 Y197.639 E.0214
G1 X179.814 Y218.111 E.96038
G1 X200.285 Y197.639 E.96034
G1 X199.639 Y197.639 E.0214
G1 X220.111 Y218.111 E.96034
G1 X226.236 Y211.987 E.28729
G1 X226.236 Y212.722 E.02436
G1 X205.764 Y192.251 E.96034
G1 X205.764 Y192.16 E.00301
G1 X226.236 Y171.689 E.96034
G1 X226.236 Y172.423 E.02436
G1 X205.764 Y151.952 E.96034
G1 X205.764 Y151.861 E.00301
G1 X226.236 Y131.39 E.96034
G1 X226.236 Y132.124 E.02436
G1 X219.512 Y125.401 E.31541
G3 X219.512 Y126.599 I-4.862 J.599 E.03986
G1 X226.236 Y119.876 E.31541
G1 X226.236 Y120.61 E.02435
G1 X205.764 Y100.139 E.96034
G1 X205.764 Y100.048 E.00301
G1 X226.236 Y79.577 E.96034
G1 X226.236 Y80.311 E.02435
G1 X205.764 Y59.84 E.96034
G1 X205.764 Y59.749 E.00301
G1 X226.236 Y39.278 E.96034
G1 X226.236 Y40.013 E.02435
G1 X220.111 Y33.889 E.28729
G1 X199.64 Y54.361 E.96034
G1 X200.285 Y54.361 E.0214
G1 X179.814 Y33.889 E.96034
G1 X159.341 Y54.361 E.96038
G1 X159.986 Y54.361 E.0214
G1 X139.515 Y33.889 E.96034
G1 X131.076 Y42.327 E.39585
G3 X131.397 Y43.042 I-3.338 J1.927 E.02606
G1 X142.715 Y54.361 E.53096
G1 X142.07 Y54.361 E.0214
G1 X162.541 Y33.889 E.96034
G1 X183.014 Y54.361 E.96038
G1 X182.369 Y54.361 E.0214
G1 X202.84 Y33.889 E.96034
G1 X212.485 Y43.533 E.45246
G2 X213.304 Y46.453 I3.667 J.547 E.10363
G1 X205.396 Y54.361 E.37094
G1 X203.768 Y54.361 E.05401
; WIPE_START
G1 X205.396 Y54.361 E-.61876
G1 X205.659 Y54.098 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X211.374 Y49.039 Z1.4 F30000
G1 X226.236 Y35.884 Z1.4
G1 Z1
G1 E.8 F1800
G1 F16200
G1 X226.236 Y34.256 E.05401
G1 X225.868 Y33.889 E.01722
G1 X218.328 Y41.429 E.35368
G2 X215.337 Y40.628 I-2.357 J2.818 E.10604
G1 X208.597 Y33.889 E.31615
G1 X188.126 Y54.361 E.96034
G1 X188.771 Y54.361 E.0214
G1 X168.298 Y33.889 E.96038
G1 X147.827 Y54.361 E.96034
G1 X148.472 Y54.361 E.0214
G1 X127.999 Y33.889 E.96038
G1 X107.528 Y54.361 E.96034
G1 X108.173 Y54.361 E.0214
G1 X87.7 Y33.889 E.96038
G1 X67.229 Y54.361 E.96034
G1 X67.874 Y54.361 E.0214
G1 X47.403 Y33.889 E.96034
G1 X40.667 Y40.624 E.31595
G2 X37.67 Y41.427 I-.598 J3.764 E.10602
G1 X30.132 Y33.889 E.3536
G1 X29.764 Y34.256 E.01722
G1 X29.764 Y35.884 E.05401
; WIPE_START
G1 X29.764 Y34.256 E-.61876
G1 X30.028 Y33.993 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X35.653 Y39.153 Z1.4 F30000
G1 X52.232 Y54.361 Z1.4
G1 Z1
G1 E.8 F1800
G1 F16200
G1 X50.604 Y54.361 E.05401
G1 X42.698 Y46.455 E.37088
G2 X43.513 Y43.535 I-2.854 J-2.371 E.10361
G1 X53.16 Y33.889 E.45251
G1 X73.631 Y54.361 E.96034
G1 X72.986 Y54.361 E.0214
G1 X93.459 Y33.889 E.96038
G1 X113.93 Y54.361 E.96034
G1 X113.285 Y54.361 E.0214
G1 X124.607 Y43.038 E.53116
G3 X124.924 Y42.326 I3.524 J1.138 E.02589
G1 X116.485 Y33.889 E.39582
G1 X96.014 Y54.361 E.96034
G1 X96.659 Y54.361 E.0214
G1 X76.186 Y33.889 E.96038
G1 X55.715 Y54.361 E.96034
G1 X56.361 Y54.361 E.0214
G1 X35.889 Y33.889 E.96034
G1 X29.764 Y40.013 E.28729
G1 X29.764 Y39.278 E.02436
G1 X50.236 Y59.749 E.96034
G1 X50.236 Y59.84 E.00301
G1 X29.764 Y80.311 E.96034
G1 X29.764 Y79.577 E.02436
G1 X50.236 Y100.048 E.96034
G1 X50.236 Y100.139 E.00301
G1 X29.764 Y120.61 E.96034
G1 X29.764 Y119.876 E.02436
G1 X36.487 Y126.598 E.31535
G3 X36.487 Y125.402 I3.636 J-.598 E.03986
G1 X29.764 Y132.124 E.31535
G1 X29.764 Y131.39 E.02435
G1 X50.236 Y151.861 E.96034
G1 X50.236 Y151.952 E.00301
G1 X29.764 Y172.423 E.96034
G1 X29.764 Y171.689 E.02435
G1 X50.236 Y192.16 E.96034
G1 X50.236 Y192.251 E.00301
G1 X29.764 Y212.722 E.96034
G1 X29.764 Y211.987 E.02435
G1 X35.889 Y218.111 E.28729
G1 X56.36 Y197.639 E.96034
G1 X55.715 Y197.639 E.0214
G1 X76.186 Y218.111 E.96034
G1 X96.659 Y197.639 E.96038
G1 X96.014 Y197.639 E.0214
G1 X116.485 Y218.111 E.96034
G1 X124.923 Y209.674 E.39582
G3 X124.607 Y208.962 I3.212 J-1.852 E.02589
G1 X113.285 Y197.639 E.53116
G1 X113.93 Y197.639 E.0214
G1 X93.459 Y218.111 E.96034
G1 X72.986 Y197.639 E.96038
G1 X73.631 Y197.639 E.0214
G1 X53.16 Y218.111 E.96034
G1 X43.513 Y208.465 E.45251
G2 X42.698 Y205.545 I-3.67 J-.549 E.10361
G1 X50.604 Y197.639 E.37088
G1 X52.232 Y197.639 E.05401
; WIPE_START
G1 X50.604 Y197.639 E-.61876
G1 X50.341 Y197.902 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X44.626 Y202.961 Z1.4 F30000
G1 X29.764 Y216.116 Z1.4
G1 Z1
G1 E.8 F1800
G1 F16200
G1 X29.764 Y217.744 E.05401
G1 X30.132 Y218.111 E.01722
G1 X37.67 Y210.573 E.3536
G2 X40.667 Y211.376 I2.373 J-2.859 E.1062
G1 X47.403 Y218.111 E.31595
G1 X67.874 Y197.639 E.96034
G1 X67.229 Y197.639 E.0214
G1 X87.7 Y218.111 E.96034
G1 X108.173 Y197.639 E.96038
G1 X107.528 Y197.639 E.0214
G1 X127.999 Y218.111 E.96034
G1 X148.472 Y197.639 E.96038
G1 X147.827 Y197.639 E.0214
G1 X168.298 Y218.111 E.96034
G1 X188.771 Y197.639 E.96038
G1 X188.126 Y197.639 E.0214
G1 X208.597 Y218.111 E.96034
G1 X215.334 Y211.375 E.31603
G2 X218.328 Y210.571 I.629 J-3.637 E.10612
G1 X225.868 Y218.111 E.35368
G1 X226.236 Y217.744 E.01722
G1 X226.236 Y216.116 E.05401
G1 X130.474 Y210.443 F30000
G1 F16200
G3 X129.087 Y211.268 I-2.504 J-2.632 E.05398
G1 X122.242 Y218.111 E.32105
G1 X101.771 Y197.639 E.96034
G1 X102.416 Y197.639 E.0214
G1 X81.945 Y218.111 E.96034
G1 X61.472 Y197.639 E.96038
G1 X62.117 Y197.639 E.0214
G1 X41.646 Y218.111 E.96034
G1 X29.764 Y206.23 E.55736
G1 X29.764 Y206.965 E.02435
G1 X50.236 Y186.494 E.96034
M73 P46 R35
G1 X50.236 Y186.403 E.00301
G1 X29.764 Y165.932 E.96034
G1 X29.764 Y166.666 E.02435
G1 X50.236 Y146.195 E.96034
G1 X50.236 Y146.104 E.00301
G1 X29.764 Y125.633 E.96034
G1 X29.764 Y126.367 E.02435
G1 X50.236 Y105.896 E.96034
G1 X50.236 Y105.805 E.00301
G1 X29.764 Y85.334 E.96034
G1 X29.764 Y86.068 E.02435
G1 X50.236 Y65.597 E.96034
G1 X50.236 Y65.506 E.00301
G1 X29.764 Y45.035 E.96034
G1 X29.764 Y45.77 E.02436
G1 X41.646 Y33.889 E.55736
G1 X62.117 Y54.361 E.96034
G1 X61.472 Y54.361 E.0214
G1 X81.945 Y33.889 E.96038
G1 X102.416 Y54.361 E.96034
G1 X101.771 Y54.361 E.0214
G1 X122.242 Y33.889 E.96034
G1 X129.087 Y40.732 E.32105
G2 X126.916 Y40.729 I-1.09 J3.418 E.07315
G1 X133.758 Y33.889 E.32092
G1 X154.229 Y54.361 E.96034
G1 X153.584 Y54.361 E.0214
G1 X174.055 Y33.889 E.96034
G1 X194.528 Y54.361 E.96038
G1 X193.883 Y54.361 E.0214
G1 X214.354 Y33.889 E.96034
G1 X226.236 Y45.77 E.55736
G1 X226.236 Y45.035 E.02435
G1 X205.764 Y65.506 E.96034
G1 X205.764 Y65.597 E.00301
G1 X226.236 Y86.068 E.96034
G1 X226.236 Y85.334 E.02435
G1 X205.764 Y105.805 E.96034
G1 X205.764 Y105.896 E.00301
G1 X226.236 Y126.367 E.96034
G1 X226.236 Y125.633 E.02435
G1 X205.764 Y146.104 E.96034
G1 X205.764 Y146.195 E.00301
G1 X226.236 Y166.666 E.96034
G1 X226.236 Y165.932 E.02435
G1 X205.764 Y186.403 E.96034
G1 X205.764 Y186.494 E.00301
G1 X226.236 Y206.965 E.96034
G1 X226.236 Y206.23 E.02436
G1 X214.354 Y218.111 E.55736
G1 X193.883 Y197.639 E.96034
G1 X194.528 Y197.639 E.0214
G1 X174.055 Y218.111 E.96038
G1 X153.584 Y197.639 E.96034
G1 X154.229 Y197.639 E.0214
G1 X133.758 Y218.111 E.96034
G1 X126.916 Y211.271 E.32092
G3 X125.531 Y210.443 I1.427 J-3.961 E.05385
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F16200
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
G1 X128.973 Y204.811
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F16213.044
G1 X129.175 Y204.879 E.00708
G3 X127.736 Y204.672 I-1.167 J2.996 E.62145
G3 X128.871 Y204.779 I.262 J3.277 E.03802
G1 X128.916 Y204.793 E.00156
G1 X128.526 Y205.116 F30000
G1 F16213.044
G1 X128.761 Y205.17 E.008
G3 X127.766 Y205.078 I-.752 J2.706 E.55209
G3 X128.467 Y205.104 I.25 J2.725 E.02334
G1 X128.081 Y205.48 F30000
G1 F16213.044
G1 X128.179 Y205.491 E.00326
G3 X128.651 Y205.562 I-.252 J3.271 E.01585
G3 X127.797 Y205.484 I-.643 J2.314 E.47192
G1 X128.021 Y205.481 E.00743
G1 X127.816 Y205.876 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X127.826 Y205.875 E.0003
G3 X128.349 Y205.895 I.177 J2.148 E.01612
G3 X127.553 Y205.919 I-.34 J1.98 E.36317
G1 X127.757 Y205.886 E.00634
; WIPE_START
M204 S10000
G1 X127.826 Y205.875 E-.0265
G1 X128.15 Y205.87 E-.12317
G1 X128.349 Y205.895 E-.07618
G1 X128.734 Y206.004 E-.15213
G1 X128.917 Y206.086 E-.07614
G1 X129.253 Y206.303 E-.15213
G1 X129.54 Y206.583 E-.15211
G1 X129.542 Y206.586 E-.00164
; WIPE_END
G1 E-.04 F1800
G1 X137.174 Y206.445 Z1.6 F30000
G1 X214.534 Y205.015 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X214.679 Y204.948 E.00529
G3 X215.736 Y204.672 I1.329 J2.927 E.0364
G3 X217.176 Y204.88 I.262 J3.277 E.04866
G3 X214.395 Y205.095 I-1.167 J2.996 E.57441
G1 X214.482 Y205.044 E.00335
G1 X215.021 Y205.244 F30000
G1 F16213.044
G1 X215.107 Y205.216 E.00299
G3 X215.766 Y205.078 I.903 J2.66 E.02241
G3 X216.761 Y205.17 I.25 J2.727 E.03333
G3 X214.847 Y205.319 I-.752 J2.706 E.5204
G1 X214.966 Y205.268 E.0043
G1 X215.51 Y205.526 F30000
G1 F16213.044
G1 X215.797 Y205.484 E.00962
G3 X216.651 Y205.562 I.13 J3.28 E.02853
G3 X215.451 Y205.54 I-.643 J2.314 E.4603
G1 X215.891 Y205.874 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X216.15 Y205.872 E.00798
G3 X216.349 Y205.895 I-.147 J2.15 E.00616
G3 X215.826 Y205.875 I-.34 J1.98 E.37166
G1 X215.831 Y205.875 E.00014
; WIPE_START
M204 S10000
G1 X216.15 Y205.872 E-.12143
G1 X216.349 Y205.895 E-.07614
G1 X216.544 Y205.94 E-.07615
G1 X216.917 Y206.086 E-.15212
G1 X217.253 Y206.303 E-.15213
G1 X217.54 Y206.583 E-.15211
G1 X217.584 Y206.648 E-.02992
; WIPE_END
G1 E-.04 F1800
G1 X217.529 Y199.016 Z1.6 F30000
G1 X216.973 Y122.937 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X217.176 Y123.005 E.00708
G3 X215.736 Y122.797 I-1.167 J2.996 E.62143
G3 X216.871 Y122.904 I.262 J3.278 E.03801
G1 X216.916 Y122.919 E.00158
G1 X216.526 Y123.241 F30000
G1 F16213.044
G1 X216.761 Y123.295 E.00799
G3 X215.766 Y123.203 I-.752 J2.706 E.5521
G3 X216.467 Y123.229 I.25 J2.728 E.02334
G1 X216.081 Y123.605 F30000
G1 F16213.044
G1 X216.179 Y123.616 E.00326
G3 X216.651 Y123.687 I-.252 J3.275 E.01585
G3 X215.797 Y123.609 I-.643 J2.314 E.47192
G1 X216.021 Y123.606 E.00744
G1 X215.823 Y124 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X215.826 Y124 E.0001
G3 X216.349 Y124.02 I.177 J2.148 E.01612
G3 X215.553 Y124.044 I-.34 J1.98 E.36317
G1 X215.764 Y124.01 E.00654
; WIPE_START
M204 S10000
G1 X215.826 Y124 E-.02401
G1 X216.15 Y123.995 E-.12317
G1 X216.349 Y124.02 E-.07617
G1 X216.544 Y124.065 E-.07613
G1 X216.917 Y124.211 E-.15216
G1 X217.253 Y124.428 E-.1521
G1 X217.54 Y124.708 E-.15212
G1 X217.546 Y124.717 E-.00415
; WIPE_END
G1 E-.04 F1800
G1 X217.271 Y117.089 Z1.6 F30000
G1 X214.535 Y41.264 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X214.679 Y41.198 E.00526
G3 X215.736 Y40.922 I1.33 J2.927 E.03641
G3 X217.176 Y41.129 I.262 J3.277 E.04865
G3 X214.395 Y41.345 I-1.167 J2.996 E.57441
G1 X214.483 Y41.294 E.00337
G1 X215.022 Y41.494 F30000
G1 F16213.044
G1 X215.107 Y41.466 E.00297
G3 X215.766 Y41.328 I.903 J2.66 E.02241
G3 X216.761 Y41.42 I.25 J2.728 E.03333
G3 X214.847 Y41.569 I-.752 J2.706 E.5204
G1 X214.967 Y41.517 E.00433
G1 X215.511 Y41.776 F30000
G1 F16213.044
G1 X215.797 Y41.734 E.0096
G3 X216.651 Y41.812 I.13 J3.282 E.02853
G3 X215.452 Y41.79 I-.643 J2.314 E.46033
G1 X215.823 Y42.125 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X215.826 Y42.125 E.00009
G3 X216.349 Y42.145 I.177 J2.148 E.01612
G3 X215.553 Y42.169 I-.34 J1.98 E.36317
G1 X215.764 Y42.135 E.00655
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
G1 F16213.044
G1 X129.176 Y41.129 E.00707
G3 X127.736 Y40.922 I-1.167 J2.996 E.62144
G3 X128.871 Y41.029 I.262 J3.278 E.03801
G1 X128.916 Y41.044 E.00157
G1 X128.526 Y41.366 F30000
G1 F16213.044
G1 X128.761 Y41.42 E.00799
G3 X127.766 Y41.328 I-.752 J2.706 E.5521
G3 X128.468 Y41.354 I.25 J2.727 E.02334
G1 X128.081 Y41.73 F30000
G1 F16213.044
G1 X128.179 Y41.741 E.00325
G3 X128.651 Y41.812 I-.252 J3.274 E.01585
G3 X127.797 Y41.734 I-.643 J2.314 E.47192
G1 X128.021 Y41.731 E.00744
G1 X127.823 Y42.125 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X127.826 Y42.125 E.00009
G3 X128.349 Y42.145 I.177 J2.148 E.01612
G3 X127.553 Y42.169 I-.34 J1.98 E.36317
G1 X127.764 Y42.135 E.00655
; WIPE_START
M204 S10000
G1 X127.826 Y42.125 E-.02392
G1 X128.15 Y42.12 E-.12316
G1 X128.349 Y42.145 E-.07618
G1 X128.544 Y42.19 E-.07614
G1 X128.917 Y42.336 E-.15213
G1 X129.253 Y42.553 E-.15212
G1 X129.54 Y42.833 E-.1521
G1 X129.546 Y42.842 E-.00424
; WIPE_END
G1 E-.04 F1800
G1 X121.915 Y42.71 Z1.6 F30000
G1 X38.536 Y41.264 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X38.679 Y41.198 E.00524
G3 X39.736 Y40.922 I1.33 J2.927 E.03641
G3 X41.176 Y41.129 I.262 J3.278 E.04865
G3 X38.395 Y41.345 I-1.167 J2.996 E.57441
G1 X38.484 Y41.294 E.0034
G1 X39.022 Y41.493 F30000
G1 F16213.044
G1 X39.107 Y41.466 E.00294
G3 X39.766 Y41.328 I.903 J2.66 E.02241
G3 X40.761 Y41.42 I.25 J2.727 E.03333
G3 X38.847 Y41.569 I-.752 J2.706 E.5204
G1 X38.967 Y41.517 E.00435
G1 X39.511 Y41.776 F30000
G1 F16213.044
G1 X39.797 Y41.734 E.00958
G3 X40.651 Y41.812 I.13 J3.281 E.02853
G3 X39.453 Y41.789 I-.643 J2.314 E.46035
G1 X39.823 Y42.125 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X39.826 Y42.125 E.00009
G3 X40.349 Y42.145 I.177 J2.148 E.01612
G3 X39.553 Y42.169 I-.34 J1.98 E.36317
G1 X39.764 Y42.135 E.00655
; WIPE_START
M204 S10000
G1 X39.826 Y42.125 E-.02396
G1 X40.15 Y42.12 E-.12317
G1 X40.349 Y42.145 E-.07618
G1 X40.734 Y42.254 E-.15213
G1 X41.091 Y42.436 E-.15209
G1 X41.404 Y42.686 E-.15213
G1 X41.54 Y42.848 E-.08036
; WIPE_END
G1 E-.04 F1800
G1 X47.094 Y48.083 Z1.6 F30000
G1 X205.416 Y197.291 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X50.584 Y197.291 E5.13608
G1 X50.584 Y54.709 E4.72972
G1 X205.416 Y54.709 E5.13608
G1 X205.416 Y197.231 E4.72773
G1 X205.009 Y196.884 F30000
G1 F16213.044
G1 X50.991 Y196.884 E5.10907
G1 X50.991 Y55.116 E4.70271
G1 X205.009 Y55.116 E5.10907
G1 X205.009 Y196.824 E4.70072
G1 X204.602 Y196.477 F30000
G1 F16213.044
G1 X51.398 Y196.477 E5.08206
G1 X51.398 Y55.523 E4.67571
G1 X204.602 Y55.523 E5.08206
G1 X204.602 Y196.417 E4.67372
G1 X204.21 Y196.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X51.79 Y196.085 E4.68344
G1 X51.79 Y55.915 E4.30703
G1 X204.21 Y55.915 E4.68344
G1 X204.21 Y196.025 E4.30519
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
G1 F16213.044
G1 X41.176 Y123.004 E.00707
G3 X39.736 Y122.797 I-1.167 J2.996 E.62144
G3 X40.871 Y122.904 I.262 J3.278 E.03801
G1 X40.916 Y122.919 E.00158
G1 X40.526 Y123.241 F30000
G1 F16213.044
G1 X40.761 Y123.295 E.00799
G3 X39.766 Y123.203 I-.752 J2.706 E.5521
G3 X40.468 Y123.229 I.25 J2.728 E.02334
G1 X40.081 Y123.605 F30000
G1 F16213.044
G1 X40.179 Y123.616 E.00325
G3 X40.651 Y123.687 I-.252 J3.275 E.01585
G3 X39.797 Y123.609 I-.643 J2.314 E.47192
G1 X40.021 Y123.606 E.00744
G1 X39.823 Y124 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X39.826 Y124 E.00009
G3 X40.349 Y124.02 I.177 J2.148 E.01612
G3 X39.553 Y124.044 I-.34 J1.98 E.36317
G1 X39.764 Y124.01 E.00655
; WIPE_START
M204 S10000
G1 X39.826 Y124 E-.02393
G1 X40.15 Y123.995 E-.12317
G1 X40.349 Y124.02 E-.07617
G1 X40.734 Y124.129 E-.15213
G1 X41.091 Y124.311 E-.15209
G1 X41.404 Y124.561 E-.15213
G1 X41.54 Y124.723 E-.08038
; WIPE_END
G1 E-.04 F1800
G1 X41.254 Y132.35 Z1.6 F30000
G1 X38.534 Y205.015 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X38.679 Y204.948 E.00529
G3 X39.736 Y204.672 I1.329 J2.927 E.0364
G3 X41.175 Y204.879 I.262 J3.277 E.04865
G3 X38.395 Y205.095 I-1.167 J2.996 E.57442
G1 X38.482 Y205.044 E.00335
G1 X39.021 Y205.244 F30000
G1 F16213.044
G1 X39.107 Y205.216 E.00299
G3 X39.766 Y205.078 I.903 J2.66 E.02241
G3 X40.761 Y205.17 I.25 J2.725 E.03333
G3 X38.847 Y205.319 I-.752 J2.706 E.5204
G1 X38.966 Y205.268 E.0043
G1 X39.51 Y205.526 F30000
G1 F16213.044
G1 X39.797 Y205.484 E.00962
G3 X40.651 Y205.562 I.13 J3.278 E.02853
G3 X39.451 Y205.54 I-.643 J2.314 E.4603
G1 X39.89 Y205.874 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X40.15 Y205.872 E.00798
G3 X40.349 Y205.895 I-.147 J2.15 E.00616
G3 X39.826 Y205.875 I-.34 J1.98 E.37166
G1 X39.83 Y205.875 E.00013
; WIPE_START
M204 S10000
G1 X40.15 Y205.872 E-.12145
G1 X40.349 Y205.895 E-.07614
G1 X40.734 Y206.004 E-.15213
G1 X40.917 Y206.086 E-.07614
G1 X41.253 Y206.303 E-.15213
G1 X41.54 Y206.583 E-.15211
G1 X41.584 Y206.648 E-.0299
; WIPE_END
G1 E-.04 F1800
G1 X49.201 Y207.134 Z1.6 F30000
G1 X226.584 Y218.459 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X29.416 Y218.459 E6.54041
G1 X29.416 Y33.541 E6.13406
G1 X226.584 Y33.541 E6.54041
G1 X226.584 Y218.399 E6.13207
G1 X226.991 Y218.866 F30000
G1 F16213.044
G1 X29.009 Y218.866 E6.56742
G1 X29.009 Y33.134 E6.16106
G1 X226.991 Y33.134 E6.56742
G1 X226.991 Y218.806 E6.15907
G1 X227.398 Y219.273 F30000
G1 F16213.044
G1 X28.602 Y219.273 E6.59442
G1 X28.602 Y32.727 E6.18807
G1 X227.398 Y32.727 E6.59442
G1 X227.398 Y219.213 E6.18608
G1 X227.79 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X28.21 Y219.665 E6.13254
G1 X28.21 Y32.335 E5.75613
G1 X227.79 Y32.335 E6.13254
G1 X227.79 Y219.605 E5.75429
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
G1 F16200
G1 X226.236 Y217.744 E.05401
G1 X225.868 Y218.111 E.01722
G1 X218.328 Y210.571 E.35368
G3 X215.334 Y211.375 I-2.365 J-2.833 E.10612
G1 X208.597 Y218.111 E.31603
G1 X188.126 Y197.639 E.96034
G1 X188.771 Y197.639 E.0214
G1 X168.298 Y218.111 E.96038
G1 X147.827 Y197.639 E.96034
G1 X148.472 Y197.639 E.0214
G1 X127.999 Y218.111 E.96038
G1 X107.528 Y197.639 E.96034
G1 X108.173 Y197.639 E.0214
G1 X87.7 Y218.111 E.96038
G1 X67.229 Y197.639 E.96034
G1 X67.874 Y197.639 E.0214
G1 X47.403 Y218.111 E.96034
G1 X40.667 Y211.376 E.31595
G3 X37.67 Y210.573 I-.625 J-3.663 E.1062
G1 X30.132 Y218.111 E.3536
G1 X29.764 Y217.744 E.01722
G1 X29.764 Y216.116 E.05401
G1 X36.564 Y208.821 F30000
G1 F16200
G3 X36.5 Y207.209 I4.085 J-.969 E.05385
G1 X29.764 Y200.473 E.31599
G1 X29.764 Y201.208 E.02435
G1 X50.236 Y180.737 E.96034
G1 X50.236 Y180.646 E.00301
G1 X29.764 Y160.175 E.96034
G1 X29.764 Y160.909 E.02435
G1 X50.236 Y140.438 E.96034
G1 X50.236 Y140.347 E.00301
G1 X39.4 Y129.511 E.50832
G3 X38.441 Y129.204 I1.285 J-5.656 E.03343
G1 X29.764 Y137.881 E.40705
G1 X29.764 Y137.147 E.02435
G1 X50.236 Y157.618 E.96034
G1 X50.236 Y157.709 E.00301
G1 X29.764 Y178.18 E.96034
G1 X29.764 Y177.446 E.02435
G1 X70.429 Y218.111 E1.90768
G1 X90.902 Y197.639 E.96038
M73 P46 R34
G1 X90.257 Y197.639 E.0214
G1 X110.728 Y218.111 E.96034
G1 X131.201 Y197.639 E.96038
G1 X130.556 Y197.639 E.0214
G1 X151.027 Y218.111 E.96034
G1 X171.5 Y197.639 E.96038
G1 X170.855 Y197.639 E.0214
G1 X191.328 Y218.111 E.96038
G1 X226.236 Y183.203 E1.63761
G1 X226.236 Y183.937 E.02435
G1 X205.764 Y163.466 E.96034
G1 X205.764 Y163.375 E.00301
G1 X226.236 Y142.904 E.96034
G1 X226.236 Y143.638 E.02435
G1 X205.764 Y123.167 E.96034
G1 X205.764 Y123.076 E.00301
G1 X226.236 Y102.605 E.96034
G1 X226.236 Y103.339 E.02435
M73 P47 R34
G1 X205.764 Y82.868 E.96034
G1 X205.764 Y82.777 E.00301
G1 X226.236 Y62.306 E.96034
G1 X226.236 Y63.04 E.02435
G1 X197.085 Y33.889 E1.36753
G1 X176.612 Y54.361 E.96038
G1 X177.257 Y54.361 E.0214
G1 X156.786 Y33.889 E.96034
G1 X136.313 Y54.361 E.96038
G1 X136.958 Y54.361 E.0214
G1 X129.798 Y47.2 E.3359
G3 X126.2 Y47.203 I-1.801 J-3.19 E.12477
G1 X119.042 Y54.361 E.33578
G1 X119.687 Y54.361 E.0214
G1 X99.214 Y33.889 E.96038
G1 X78.743 Y54.361 E.96034
G1 X79.388 Y54.361 E.0214
G1 X58.915 Y33.889 E.96038
G1 X29.764 Y63.04 E1.36753
G1 X29.764 Y62.306 E.02436
G1 X50.236 Y82.777 E.96034
G1 X50.236 Y82.868 E.00301
G1 X29.764 Y103.339 E.96034
G1 X29.764 Y102.605 E.02435
G1 X50.236 Y123.076 E.96034
G1 X50.236 Y123.167 E.00301
G1 X29.764 Y143.638 E.96034
G1 X29.764 Y142.904 E.02435
G1 X50.236 Y163.375 E.96034
G1 X50.236 Y163.466 E.00301
G1 X29.764 Y183.937 E.96034
G1 X29.764 Y183.203 E.02435
G1 X64.672 Y218.111 E1.63761
G1 X85.145 Y197.639 E.96038
G1 X84.5 Y197.639 E.0214
G1 X104.971 Y218.111 E.96034
G1 X125.444 Y197.639 E.96038
G1 X124.799 Y197.639 E.0214
G1 X145.27 Y218.111 E.96034
G1 X165.743 Y197.639 E.96038
G1 X165.098 Y197.639 E.0214
G1 X185.571 Y218.111 E.96038
G1 X226.236 Y177.446 E1.90768
G1 X226.236 Y178.18 E.02436
G1 X205.764 Y157.709 E.96034
G1 X205.764 Y157.618 E.00301
G1 X226.236 Y137.147 E.96034
G1 X226.236 Y137.881 E.02435
G1 X217.559 Y129.205 E.40703
G3 X216.596 Y129.515 I-2.544 J-6.237 E.0336
G1 X205.764 Y140.347 E.50813
G1 X205.764 Y140.438 E.00301
G1 X226.236 Y160.909 E.96034
G1 X226.236 Y160.175 E.02436
G1 X205.764 Y180.646 E.96034
G1 X205.764 Y180.737 E.00301
G1 X226.236 Y201.208 E.96034
G1 X226.236 Y200.473 E.02436
G1 X219.502 Y207.207 E.31589
G3 X219.435 Y208.82 I-3.565 J.661 E.05398
; WIPE_START
G1 X219.567 Y207.875 E-.36238
G1 X219.502 Y207.207 E-.25495
G1 X219.767 Y206.942 E-.14267
; WIPE_END
G1 E-.04 F1800
G1 X214.981 Y204.461 Z1.6 F30000
G1 Z1.2
G1 E.8 F1800
G1 F16200
G3 X216.593 Y204.359 I1.168 J5.674 E.05374
G1 X226.236 Y194.716 E.45236
G1 X226.236 Y195.451 E.02436
G1 X205.764 Y174.98 E.96034
G1 X205.764 Y174.889 E.00301
G1 X226.236 Y154.418 E.96034
G1 X226.236 Y155.152 E.02436
G1 X205.764 Y134.681 E.96034
G1 X205.764 Y134.59 E.00301
G1 X212.794 Y127.561 E.32976
G3 X212.794 Y124.439 I3.244 J-1.561 E.1071
G1 X205.764 Y117.41 E.32976
G1 X205.764 Y117.319 E.00301
G1 X226.236 Y96.848 E.96034
G1 X226.236 Y97.582 E.02435
G1 X205.764 Y77.111 E.96034
G1 X205.764 Y77.02 E.00301
G1 X226.236 Y56.549 E.96034
G1 X226.236 Y57.284 E.02435
G1 X216.593 Y47.641 E.45236
G3 X214.982 Y47.539 I-.582 J-3.583 E.05398
; WIPE_START
G1 X215.911 Y47.691 E-.35767
G1 X216.593 Y47.641 E-.25969
G1 X216.858 Y47.906 E-.14264
; WIPE_END
G1 E-.04 F1800
G1 X219.435 Y43.18 Z1.6 F30000
G1 Z1.2
G1 E.8 F1800
G1 F16200
G3 X219.502 Y44.793 I-3.501 J.952 E.05398
G1 X226.236 Y51.527 E.31589
G1 X226.236 Y50.792 E.02435
G1 X205.764 Y71.263 E.96034
G1 X205.764 Y71.354 E.00301
G1 X226.236 Y91.825 E.96034
G1 X226.236 Y91.091 E.02435
G1 X205.764 Y111.562 E.96034
G1 X205.764 Y111.653 E.00301
G1 X216.596 Y122.485 E.50813
G3 X217.559 Y122.795 I-1.581 J6.546 E.0336
G1 X226.236 Y114.119 E.40703
G1 X226.236 Y114.853 E.02435
G1 X205.764 Y94.382 E.96034
G1 X205.764 Y94.291 E.00301
G1 X226.236 Y73.82 E.96034
G1 X226.236 Y74.554 E.02435
G1 X185.571 Y33.889 E1.90768
G1 X165.098 Y54.361 E.96038
G1 X165.743 Y54.361 E.0214
G1 X145.272 Y33.889 E.96034
G1 X124.799 Y54.361 E.96038
G1 X125.444 Y54.361 E.0214
G1 X104.973 Y33.889 E.96034
G1 X84.5 Y54.361 E.96038
G1 X85.145 Y54.361 E.0214
G1 X64.672 Y33.889 E.96038
G1 X29.764 Y68.797 E1.63761
G1 X29.764 Y68.063 E.02435
G1 X50.236 Y88.534 E.96034
G1 X50.236 Y88.625 E.00301
G1 X29.764 Y109.096 E.96034
G1 X29.764 Y108.362 E.02435
G1 X50.236 Y128.833 E.96034
G1 X50.236 Y128.924 E.00301
G1 X29.764 Y149.395 E.96034
G1 X29.764 Y148.661 E.02435
G1 X50.236 Y169.132 E.96034
G1 X50.236 Y169.223 E.00301
G1 X29.764 Y189.694 E.96034
G1 X29.764 Y188.96 E.02435
G1 X58.915 Y218.111 E1.36753
G1 X79.388 Y197.639 E.96038
G1 X78.743 Y197.639 E.0214
G1 X99.214 Y218.111 E.96034
G1 X119.687 Y197.639 E.96038
G1 X119.042 Y197.639 E.0214
G1 X126.2 Y204.797 E.33578
G3 X129.798 Y204.8 I1.797 J3.15 E.12489
G1 X136.958 Y197.639 E.3359
G1 X136.313 Y197.639 E.0214
G1 X156.786 Y218.111 E.96038
G1 X177.257 Y197.639 E.96034
G1 X176.612 Y197.639 E.0214
G1 X197.085 Y218.111 E.96038
G1 X226.236 Y188.96 E1.36753
G1 X226.236 Y189.694 E.02436
G1 X205.764 Y169.223 E.96034
G1 X205.764 Y169.132 E.00301
G1 X226.236 Y148.661 E.96034
G1 X226.236 Y149.395 E.02435
G1 X205.764 Y128.924 E.96034
G1 X205.764 Y128.833 E.00301
G1 X226.236 Y108.362 E.96034
G1 X226.236 Y109.096 E.02435
G1 X205.764 Y88.625 E.96034
G1 X205.764 Y88.534 E.00301
G1 X226.236 Y68.063 E.96034
G1 X226.236 Y68.797 E.02435
G1 X191.328 Y33.889 E1.63761
G1 X170.855 Y54.361 E.96038
G1 X171.5 Y54.361 E.0214
G1 X151.029 Y33.889 E.96034
G1 X130.556 Y54.361 E.96038
G1 X131.201 Y54.361 E.0214
G1 X110.73 Y33.889 E.96034
G1 X90.257 Y54.361 E.96038
G1 X90.902 Y54.361 E.0214
G1 X70.429 Y33.889 E.96038
G1 X29.764 Y74.554 E1.90768
G1 X29.764 Y73.82 E.02436
G1 X50.236 Y94.291 E.96034
G1 X50.236 Y94.382 E.00301
G1 X29.764 Y114.853 E.96034
G1 X29.764 Y114.119 E.02435
G1 X38.441 Y122.796 E.40706
G3 X39.394 Y122.495 I2.068 J4.882 E.03318
G1 X50.236 Y111.653 E.50861
G1 X50.236 Y111.562 E.00301
G1 X29.764 Y91.091 E.96034
G1 X29.764 Y91.825 E.02436
G1 X50.236 Y71.354 E.96034
G1 X50.236 Y71.263 E.00301
G1 X29.764 Y50.792 E.96034
G1 X29.764 Y51.527 E.02436
G1 X36.5 Y44.791 E.31599
G3 X36.564 Y43.179 I4.149 J-.643 E.05385
; WIPE_START
G1 X36.438 Y43.947 E-.29591
G1 X36.5 Y44.791 E-.32142
G1 X36.235 Y45.056 E-.14267
; WIPE_END
G1 E-.04 F1800
G1 X41.02 Y47.54 Z1.6 F30000
G1 Z1.2
G1 E.8 F1800
G1 F16200
G3 X39.41 Y47.638 I-1.056 J-4.073 E.05385
G1 X29.764 Y57.283 E.45248
G1 X29.764 Y56.549 E.02436
G1 X50.236 Y77.02 E.96034
G1 X50.236 Y77.111 E.00301
G1 X29.764 Y97.582 E.96034
G1 X29.764 Y96.848 E.02436
G1 X50.236 Y117.319 E.96034
G1 X50.236 Y117.41 E.00301
G1 X43.203 Y124.442 E.32989
G3 X43.287 Y127.385 I-3.228 J1.564 E.10066
G1 X43.203 Y127.558 E.00635
G1 X50.236 Y134.59 E.32989
G1 X50.236 Y134.681 E.00301
G1 X29.764 Y155.152 E.96034
G1 X29.764 Y154.418 E.02435
G1 X50.236 Y174.889 E.96034
G1 X50.236 Y174.98 E.00301
G1 X29.764 Y195.451 E.96034
G1 X29.764 Y194.716 E.02435
G1 X39.415 Y204.367 E.45271
G3 X41.025 Y204.461 I.603 J3.475 E.05398
G1 X52.232 Y197.639 F30000
G1 F16200
G1 X50.604 Y197.639 E.05401
G1 X42.698 Y205.545 E.37088
G3 X43.513 Y208.465 I-2.854 J2.371 E.10361
G1 X53.16 Y218.111 E.45251
G1 X73.631 Y197.639 E.96034
G1 X72.986 Y197.639 E.0214
G1 X93.459 Y218.111 E.96038
G1 X113.93 Y197.639 E.96034
G1 X113.285 Y197.639 E.0214
G1 X124.607 Y208.962 E.53116
G2 X124.924 Y209.674 I3.527 J-1.139 E.02589
G1 X116.485 Y218.111 E.39582
G1 X96.014 Y197.639 E.96034
G1 X96.659 Y197.639 E.0214
G1 X76.186 Y218.111 E.96038
G1 X55.715 Y197.639 E.96034
G1 X56.36 Y197.639 E.0214
G1 X35.889 Y218.111 E.96034
G1 X29.764 Y211.987 E.28729
G1 X29.764 Y212.722 E.02435
G1 X50.236 Y192.251 E.96034
G1 X50.236 Y192.16 E.00301
G1 X29.764 Y171.689 E.96034
G1 X29.764 Y172.423 E.02435
G1 X50.236 Y151.952 E.96034
G1 X50.236 Y151.861 E.00301
G1 X29.764 Y131.39 E.96034
G1 X29.764 Y132.124 E.02435
G1 X36.487 Y125.402 E.31535
G2 X36.487 Y126.598 I3.637 J.598 E.03986
G1 X29.764 Y119.876 E.31535
G1 X29.764 Y120.61 E.02436
G1 X50.236 Y100.139 E.96034
G1 X50.236 Y100.048 E.00301
G1 X29.764 Y79.577 E.96034
G1 X29.764 Y80.311 E.02436
G1 X50.236 Y59.84 E.96034
G1 X50.236 Y59.749 E.00301
G1 X29.764 Y39.278 E.96034
G1 X29.764 Y40.013 E.02436
G1 X35.889 Y33.889 E.28729
G1 X56.361 Y54.361 E.96034
G1 X55.715 Y54.361 E.0214
G1 X76.186 Y33.889 E.96034
G1 X96.659 Y54.361 E.96038
G1 X96.014 Y54.361 E.0214
G1 X116.485 Y33.889 E.96034
G1 X124.924 Y42.326 E.39582
G2 X124.607 Y43.038 I3.211 J1.851 E.02589
G1 X113.285 Y54.361 E.53116
G1 X113.93 Y54.361 E.0214
G1 X93.459 Y33.889 E.96034
G1 X72.986 Y54.361 E.96038
G1 X73.631 Y54.361 E.0214
G1 X53.16 Y33.889 E.96034
G1 X43.513 Y43.535 E.45251
G3 X42.698 Y46.455 I-3.67 J.549 E.10361
G1 X50.604 Y54.361 E.37088
G1 X52.232 Y54.361 E.05401
; WIPE_START
G1 X50.604 Y54.361 E-.61876
G1 X50.341 Y54.098 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X44.626 Y49.039 Z1.6 F30000
G1 X29.764 Y35.884 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F16200
G1 X29.764 Y34.256 E.05401
G1 X30.132 Y33.889 E.01722
G1 X37.67 Y41.427 E.3536
G3 X40.667 Y40.624 I2.336 J2.723 E.10646
G1 X47.403 Y33.889 E.31595
G1 X67.874 Y54.361 E.96034
G1 X67.229 Y54.361 E.0214
G1 X87.7 Y33.889 E.96034
G1 X108.173 Y54.361 E.96038
G1 X107.528 Y54.361 E.0214
G1 X127.999 Y33.889 E.96034
G1 X148.472 Y54.361 E.96038
G1 X147.827 Y54.361 E.0214
G1 X168.298 Y33.889 E.96034
G1 X188.771 Y54.361 E.96038
G1 X188.126 Y54.361 E.0214
G1 X208.597 Y33.889 E.96034
G1 X215.337 Y40.628 E.31616
G3 X218.328 Y41.429 I.67 J3.487 E.10629
G1 X225.868 Y33.889 E.35368
G1 X226.236 Y34.256 E.01722
G1 X226.236 Y35.884 E.05401
; WIPE_START
G1 X226.236 Y34.256 E-.61876
G1 X225.972 Y33.993 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X220.347 Y39.153 Z1.6 F30000
G1 X203.768 Y54.361 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F16200
G1 X205.396 Y54.361 E.05401
G1 X213.304 Y46.453 E.37094
G3 X212.485 Y43.533 I2.849 J-2.373 E.10363
G1 X202.84 Y33.889 E.45246
G1 X182.369 Y54.361 E.96034
G1 X183.014 Y54.361 E.0214
G1 X162.541 Y33.889 E.96038
G1 X142.07 Y54.361 E.96034
G1 X142.715 Y54.361 E.0214
G1 X131.397 Y43.042 E.53096
G2 X131.076 Y42.327 I-3.653 J1.209 E.02606
G1 X139.515 Y33.889 E.39585
G1 X159.986 Y54.361 E.96034
G1 X159.341 Y54.361 E.0214
G1 X179.814 Y33.889 E.96038
G1 X200.285 Y54.361 E.96034
G1 X199.64 Y54.361 E.0214
G1 X220.111 Y33.889 E.96034
G1 X226.236 Y40.013 E.28729
G1 X226.236 Y39.278 E.02435
G1 X205.764 Y59.749 E.96034
G1 X205.764 Y59.84 E.00301
G1 X226.236 Y80.311 E.96034
G1 X226.236 Y79.577 E.02435
G1 X205.764 Y100.048 E.96034
G1 X205.764 Y100.139 E.00301
G1 X226.236 Y120.61 E.96034
G1 X226.236 Y119.876 E.02435
G1 X219.512 Y126.599 E.31541
G2 X219.512 Y125.401 I-4.861 J-.599 E.03986
G1 X226.236 Y132.124 E.31541
G1 X226.236 Y131.39 E.02436
G1 X205.764 Y151.861 E.96034
G1 X205.764 Y151.952 E.00301
G1 X226.236 Y172.423 E.96034
G1 X226.236 Y171.689 E.02436
G1 X205.764 Y192.16 E.96034
G1 X205.764 Y192.251 E.00301
G1 X226.236 Y212.722 E.96034
G1 X226.236 Y211.987 E.02436
G1 X220.111 Y218.111 E.28729
G1 X199.639 Y197.639 E.96034
G1 X200.285 Y197.639 E.0214
G1 X179.814 Y218.111 E.96034
G1 X159.341 Y197.639 E.96038
G1 X159.986 Y197.639 E.0214
G1 X139.515 Y218.111 E.96034
G1 X131.076 Y209.673 E.39585
G2 X131.397 Y208.958 I-3.33 J-1.923 E.02606
G1 X142.715 Y197.639 E.53096
G1 X142.07 Y197.639 E.0214
G1 X162.541 Y218.111 E.96034
G1 X183.014 Y197.639 E.96038
G1 X182.369 Y197.639 E.0214
G1 X202.84 Y218.111 E.96034
G1 X212.485 Y208.467 E.45246
G3 X213.304 Y205.547 I3.667 J-.547 E.10363
G1 X205.396 Y197.639 E.37094
G1 X203.768 Y197.639 E.05401
; WIPE_START
G1 X205.396 Y197.639 E-.61876
G1 X205.659 Y197.902 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X198.119 Y199.082 Z1.6 F30000
G1 X125.531 Y210.443 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F16200
G2 X126.916 Y211.271 I2.813 J-3.135 E.05385
G1 X133.758 Y218.111 E.32092
G1 X154.229 Y197.639 E.96034
G1 X153.584 Y197.639 E.0214
G1 X174.055 Y218.111 E.96034
G1 X194.528 Y197.639 E.96038
G1 X193.883 Y197.639 E.0214
G1 X214.354 Y218.111 E.96034
G1 X226.236 Y206.23 E.55736
G1 X226.236 Y206.965 E.02436
G1 X205.764 Y186.494 E.96034
G1 X205.764 Y186.403 E.00301
G1 X226.236 Y165.932 E.96034
G1 X226.236 Y166.666 E.02435
G1 X205.764 Y146.195 E.96034
G1 X205.764 Y146.104 E.00301
G1 X226.236 Y125.633 E.96034
G1 X226.236 Y126.367 E.02435
G1 X205.764 Y105.896 E.96034
G1 X205.764 Y105.805 E.00301
G1 X226.236 Y85.334 E.96034
G1 X226.236 Y86.068 E.02435
G1 X205.764 Y65.597 E.96034
G1 X205.764 Y65.506 E.00301
G1 X226.236 Y45.035 E.96034
G1 X226.236 Y45.77 E.02435
G1 X214.354 Y33.889 E.55736
G1 X193.883 Y54.361 E.96034
G1 X194.528 Y54.361 E.0214
G1 X174.055 Y33.889 E.96038
G1 X153.584 Y54.361 E.96034
G1 X154.229 Y54.361 E.0214
G1 X133.758 Y33.889 E.96034
G1 X126.916 Y40.729 E.32092
G3 X129.087 Y40.732 I1.08 J4.109 E.07281
G1 X122.242 Y33.889 E.32105
G1 X101.771 Y54.361 E.96034
G1 X102.416 Y54.361 E.0214
G1 X81.945 Y33.889 E.96034
G1 X61.472 Y54.361 E.96038
G1 X62.117 Y54.361 E.0214
G1 X41.646 Y33.889 E.96034
G1 X29.764 Y45.77 E.55736
G1 X29.764 Y45.035 E.02436
G1 X50.236 Y65.506 E.96034
G1 X50.236 Y65.597 E.00301
G1 X29.764 Y86.068 E.96034
G1 X29.764 Y85.334 E.02435
G1 X50.236 Y105.805 E.96034
G1 X50.236 Y105.896 E.00301
G1 X29.764 Y126.367 E.96034
G1 X29.764 Y125.633 E.02435
G1 X50.236 Y146.104 E.96034
G1 X50.236 Y146.195 E.00301
G1 X29.764 Y166.666 E.96034
G1 X29.764 Y165.932 E.02435
G1 X50.236 Y186.403 E.96034
G1 X50.236 Y186.494 E.00301
G1 X29.764 Y206.965 E.96034
G1 X29.764 Y206.23 E.02435
G1 X41.646 Y218.111 E.55736
G1 X62.117 Y197.639 E.96034
G1 X61.472 Y197.639 E.0214
G1 X81.945 Y218.111 E.96038
G1 X102.416 Y197.639 E.96034
G1 X101.771 Y197.639 E.0214
G1 X122.242 Y218.111 E.96034
G1 X129.087 Y211.268 E.32105
G2 X130.474 Y210.443 I-1.117 J-3.457 E.05398
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F16200
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
G1 X126.543 Y205.01
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F16213.044
G1 X126.679 Y204.948 E.00496
G3 X127.748 Y204.671 I1.329 J2.927 E.03679
G3 X129.176 Y204.879 I.25 J3.278 E.04826
G3 X126.395 Y205.095 I-1.167 J2.996 E.57441
G1 X126.491 Y205.04 E.00369
G1 X127.03 Y205.24 F30000
G1 F16213.044
G1 X127.107 Y205.216 E.00266
G3 X127.778 Y205.077 I.903 J2.66 E.02281
G3 X128.761 Y205.17 I.239 J2.724 E.03293
G3 X126.847 Y205.319 I-.751 J2.706 E.5204
G1 X126.975 Y205.264 E.00463
G1 X127.52 Y205.524 F30000
G1 F16213.044
G1 X127.809 Y205.483 E.00966
G3 X128.651 Y205.562 I.113 J3.311 E.02814
G3 X127.462 Y205.537 I-.642 J2.314 E.46064
G1 X127.83 Y205.875 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X127.838 Y205.874 E.00025
G3 X128.349 Y205.895 I.166 J2.144 E.01575
G3 X127.554 Y205.919 I-.339 J1.98 E.36316
G1 X127.771 Y205.884 E.00676
; WIPE_START
M204 S10000
G1 X127.838 Y205.874 E-.02589
G1 X128.15 Y205.87 E-.11863
G1 X128.349 Y205.895 E-.07617
G1 X128.544 Y205.94 E-.07616
G1 X128.917 Y206.086 E-.15212
G1 X129.253 Y206.303 E-.1521
G1 X129.54 Y206.583 E-.15214
G1 X129.55 Y206.598 E-.00679
; WIPE_END
G1 E-.04 F1800
G1 X137.181 Y206.442 Z1.8 F30000
G1 X216.989 Y204.817 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X217.176 Y204.88 E.00653
G3 X215.748 Y204.671 I-1.167 J2.996 E.62183
G3 X216.871 Y204.779 I.25 J3.277 E.03762
G1 X216.932 Y204.799 E.00212
G1 X216.542 Y205.12 F30000
G1 F16213.044
G1 X216.761 Y205.17 E.00744
G3 X215.778 Y205.077 I-.751 J2.706 E.55248
G3 X216.484 Y205.107 I.239 J2.725 E.02349
G1 X216.099 Y205.48 F30000
G1 F16213.044
G1 X216.179 Y205.491 E.00268
G3 X216.651 Y205.562 I-.257 J3.304 E.01585
G3 X215.809 Y205.483 I-.642 J2.314 E.4723
G1 X216.039 Y205.48 E.00763
G1 X215.931 Y205.873 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X216.15 Y205.872 E.00674
G3 X216.349 Y205.895 I-.146 J2.145 E.00616
G3 X215.838 Y205.874 I-.339 J1.98 E.37202
G1 X215.871 Y205.873 E.00101
; WIPE_START
M204 S10000
G1 X216.15 Y205.872 E-.10612
G1 X216.349 Y205.895 E-.07613
G1 X216.734 Y206.004 E-.15214
G1 X217.091 Y206.186 E-.15208
G1 X217.404 Y206.436 E-.15213
G1 X217.609 Y206.681 E-.12141
; WIPE_END
G1 E-.04 F1800
G1 X217.552 Y199.048 Z1.8 F30000
G1 X216.988 Y122.941 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X217.176 Y123.005 E.00657
G3 X215.748 Y122.796 I-1.167 J2.996 E.62183
G3 X216.871 Y122.904 I.25 J3.278 E.03761
G1 X216.931 Y122.923 E.00209
G1 X216.541 Y123.244 F30000
G1 F16213.044
G1 X216.761 Y123.295 E.00748
G3 X215.778 Y123.202 I-.751 J2.706 E.55249
G3 X216.483 Y123.231 I.238 J2.726 E.02345
G1 X216.097 Y123.605 F30000
G1 F16213.044
G1 X216.179 Y123.616 E.00272
G3 X216.651 Y123.687 I-.257 J3.306 E.01585
G3 X215.809 Y123.608 I-.642 J2.314 E.4723
G1 X216.037 Y123.605 E.00758
G1 X215.836 Y123.999 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X215.838 Y123.999 E.00005
G3 X216.349 Y124.02 I.166 J2.144 E.01576
G3 X215.554 Y124.044 I-.339 J1.98 E.36316
G1 X215.777 Y124.008 E.00696
; WIPE_START
M204 S10000
G1 X215.838 Y123.999 E-.02341
G1 X216.15 Y123.995 E-.11864
G1 X216.349 Y124.02 E-.07617
G1 X216.734 Y124.129 E-.15213
G1 X217.091 Y124.311 E-.15209
G1 X217.404 Y124.561 E-.15213
G1 X217.548 Y124.733 E-.08543
; WIPE_END
G1 E-.04 F1800
G1 X217.274 Y117.106 Z1.8 F30000
G1 X214.543 Y41.26 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X214.679 Y41.198 E.00497
G3 X215.748 Y40.921 I1.33 J2.927 E.0368
G3 X217.176 Y41.13 I.25 J3.277 E.04826
G3 X214.395 Y41.345 I-1.167 J2.996 E.57441
G1 X214.491 Y41.29 E.00366
G1 X215.03 Y41.49 F30000
G1 F16213.044
G1 X215.107 Y41.466 E.00268
G3 X215.778 Y41.327 I.903 J2.66 E.02281
G3 X216.761 Y41.42 I.238 J2.725 E.03292
G3 X214.847 Y41.569 I-.751 J2.706 E.5204
G1 X214.975 Y41.514 E.00461
G1 X215.52 Y41.775 F30000
G1 F16213.044
G1 X215.809 Y41.733 E.00968
G3 X216.651 Y41.812 I.113 J3.313 E.02813
G3 X215.461 Y41.788 I-.642 J2.314 E.46063
G1 X215.837 Y42.124 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X215.838 Y42.124 E.00004
G3 X216.349 Y42.145 I.166 J2.144 E.01576
G3 X215.554 Y42.169 I-.339 J1.98 E.36316
G1 X215.777 Y42.133 E.00696
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
G1 F16213.044
G1 X126.679 Y41.198 E.00496
G3 X127.748 Y40.921 I1.33 J2.927 E.03681
G3 X129.176 Y41.129 I.25 J3.278 E.04825
G3 X126.395 Y41.345 I-1.167 J2.996 E.57442
G1 X126.491 Y41.29 E.00367
G1 X127.03 Y41.49 F30000
G1 F16213.044
G1 X127.107 Y41.466 E.00267
G3 X127.778 Y41.327 I.903 J2.66 E.02281
G3 X128.761 Y41.42 I.238 J2.724 E.03293
G3 X126.847 Y41.569 I-.751 J2.706 E.52039
G1 X126.975 Y41.514 E.00462
G1 X127.52 Y41.774 F30000
G1 F16213.044
G1 X127.809 Y41.733 E.00967
G3 X128.651 Y41.812 I.113 J3.312 E.02813
G3 X127.462 Y41.788 I-.642 J2.314 E.46064
G1 X127.837 Y42.124 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X127.838 Y42.124 E.00004
G3 X128.349 Y42.145 I.166 J2.144 E.01576
G3 X127.554 Y42.169 I-.339 J1.98 E.36316
G1 X127.777 Y42.133 E.00696
; WIPE_START
M204 S10000
G1 X127.838 Y42.124 E-.02332
G1 X128.15 Y42.12 E-.11864
G1 X128.349 Y42.145 E-.07618
G1 X128.544 Y42.19 E-.07614
G1 X128.917 Y42.336 E-.15213
G1 X129.253 Y42.553 E-.1521
G1 X129.54 Y42.833 E-.15216
G1 X129.554 Y42.853 E-.00933
; WIPE_END
G1 E-.04 F1800
G1 X121.923 Y42.699 Z1.8 F30000
G1 X40.988 Y41.066 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X41.176 Y41.129 E.00657
G3 X39.748 Y40.921 I-1.167 J2.996 E.62184
G3 X40.871 Y41.029 I.25 J3.278 E.03761
G1 X40.931 Y41.048 E.00208
G1 X40.541 Y41.369 F30000
G1 F16213.044
G1 X40.761 Y41.42 E.00749
G3 X39.778 Y41.327 I-.751 J2.706 E.55249
G3 X40.482 Y41.356 I.238 J2.725 E.02344
G1 X40.097 Y41.73 F30000
G1 F16213.044
G1 X40.179 Y41.741 E.00273
G3 X40.651 Y41.812 I-.257 J3.304 E.01585
G3 X39.809 Y41.733 I-.642 J2.314 E.4723
G1 X40.037 Y41.73 E.00758
G1 X39.836 Y42.124 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X39.838 Y42.124 E.00005
G3 X40.349 Y42.145 I.166 J2.144 E.01576
G3 X39.554 Y42.169 I-.339 J1.98 E.36316
G1 X39.777 Y42.133 E.00696
; WIPE_START
M204 S10000
G1 X39.838 Y42.124 E-.02339
G1 X40.15 Y42.12 E-.11864
G1 X40.349 Y42.145 E-.07618
G1 X40.544 Y42.19 E-.07614
G1 X40.917 Y42.336 E-.15213
G1 X41.253 Y42.553 E-.1521
G1 X41.54 Y42.833 E-.15216
G1 X41.554 Y42.853 E-.00928
; WIPE_END
G1 E-.04 F1800
G1 X47.108 Y48.088 Z1.8 F30000
G1 X205.416 Y197.291 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X50.584 Y197.291 E5.13608
G1 X50.584 Y54.709 E4.72972
G1 X205.416 Y54.709 E5.13608
G1 X205.416 Y197.231 E4.72773
G1 X205.009 Y196.884 F30000
G1 F16213.044
G1 X50.991 Y196.884 E5.10907
G1 X50.991 Y55.116 E4.70271
G1 X205.009 Y55.116 E5.10907
G1 X205.009 Y196.824 E4.70072
G1 X204.602 Y196.477 F30000
G1 F16213.044
G1 X51.398 Y196.477 E5.08206
G1 X51.398 Y55.523 E4.67571
G1 X204.602 Y55.523 E5.08206
G1 X204.602 Y196.417 E4.67372
G1 X204.21 Y196.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X51.79 Y196.085 E4.68344
G1 X51.79 Y55.915 E4.30703
G1 X204.21 Y55.915 E4.68344
G1 X204.21 Y196.025 E4.30519
; WIPE_START
M204 S10000
G1 X202.21 Y196.026 E-.76
; WIPE_END
M73 P48 R34
G1 E-.04 F1800
G1 X195.258 Y192.875 Z1.8 F30000
G1 X40.988 Y122.941 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X41.176 Y123.004 E.00656
G3 X39.748 Y122.796 I-1.167 J2.996 E.62183
G3 X40.871 Y122.904 I.25 J3.278 E.03761
G1 X40.931 Y122.923 E.00209
G1 X40.541 Y123.244 F30000
G1 F16213.044
G1 X40.761 Y123.295 E.00748
G3 X39.778 Y123.202 I-.751 J2.706 E.55249
G3 X40.483 Y123.231 I.238 J2.725 E.02345
G1 X40.097 Y123.605 F30000
G1 F16213.044
G1 X40.179 Y123.616 E.00272
G3 X40.651 Y123.687 I-.257 J3.305 E.01585
G3 X39.809 Y123.608 I-.642 J2.314 E.47231
G1 X40.037 Y123.605 E.00759
G1 X39.837 Y123.999 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X39.838 Y123.999 E.00005
G3 X40.349 Y124.02 I.166 J2.144 E.01576
G3 X39.554 Y124.044 I-.339 J1.98 E.36316
G1 X39.777 Y124.008 E.00696
; WIPE_START
M204 S10000
G1 X39.838 Y123.999 E-.02336
G1 X40.15 Y123.995 E-.11864
G1 X40.349 Y124.02 E-.07617
G1 X40.734 Y124.129 E-.15213
G1 X41.091 Y124.311 E-.15209
G1 X41.404 Y124.561 E-.15213
G1 X41.548 Y124.733 E-.08548
; WIPE_END
G1 E-.04 F1800
G1 X41.263 Y132.36 Z1.8 F30000
G1 X38.542 Y205.011 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X38.679 Y204.948 E.005
G3 X39.748 Y204.671 I1.329 J2.927 E.03679
G3 X41.176 Y204.879 I.25 J3.277 E.04826
G3 X38.395 Y205.095 I-1.167 J2.996 E.57441
G1 X38.49 Y205.04 E.00364
G1 X39.029 Y205.241 F30000
G1 F16213.044
G1 X39.107 Y205.216 E.0027
G3 X39.778 Y205.077 I.903 J2.66 E.02281
G3 X40.761 Y205.17 I.239 J2.724 E.03293
G3 X38.847 Y205.319 I-.751 J2.706 E.5204
G1 X38.974 Y205.265 E.00458
G1 X39.519 Y205.525 F30000
G1 F16213.044
G1 X39.809 Y205.483 E.00971
G3 X40.651 Y205.562 I.113 J3.311 E.02813
G3 X39.461 Y205.538 I-.642 J2.314 E.4606
G1 X39.93 Y205.873 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X40.15 Y205.872 E.00678
G3 X40.349 Y205.895 I-.146 J2.146 E.00616
G3 X39.838 Y205.874 I-.339 J1.98 E.37202
G1 X39.87 Y205.873 E.00097
; WIPE_START
M204 S10000
G1 X40.15 Y205.872 E-.10658
G1 X40.349 Y205.895 E-.07614
G1 X40.734 Y206.004 E-.15214
G1 X41.091 Y206.186 E-.15212
G1 X41.404 Y206.436 E-.1521
G1 X41.608 Y206.68 E-.12093
; WIPE_END
G1 E-.04 F1800
G1 X49.225 Y207.165 Z1.8 F30000
G1 X226.584 Y218.459 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X29.416 Y218.459 E6.54041
G1 X29.416 Y33.541 E6.13406
G1 X226.584 Y33.541 E6.54041
G1 X226.584 Y218.399 E6.13207
G1 X226.991 Y218.866 F30000
G1 F16213.044
G1 X29.009 Y218.866 E6.56742
G1 X29.009 Y33.134 E6.16106
G1 X226.991 Y33.134 E6.56742
G1 X226.991 Y218.806 E6.15907
G1 X227.398 Y219.273 F30000
G1 F16213.044
G1 X28.602 Y219.273 E6.59442
G1 X28.602 Y32.727 E6.18807
G1 X227.398 Y32.727 E6.59442
G1 X227.398 Y219.213 E6.18608
G1 X227.79 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X28.21 Y219.665 E6.13254
G1 X28.21 Y32.335 E5.75613
G1 X227.79 Y32.335 E6.13254
G1 X227.79 Y219.605 E5.75429
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
G1 F16200
G2 X219.502 Y207.207 I-3.499 J-.952 E.05398
G1 X226.236 Y200.473 E.31589
G1 X226.236 Y201.208 E.02436
G1 X205.764 Y180.737 E.96034
G1 X205.764 Y180.646 E.00301
G1 X226.236 Y160.175 E.96034
G1 X226.236 Y160.909 E.02436
G1 X205.764 Y140.438 E.96034
G1 X205.764 Y140.347 E.00301
G1 X216.596 Y129.515 E.50813
G2 X217.559 Y129.205 I-1.581 J-6.547 E.0336
G1 X226.236 Y137.881 E.40703
G1 X226.236 Y137.147 E.02435
G1 X205.764 Y157.618 E.96034
G1 X205.764 Y157.709 E.00301
G1 X226.236 Y178.18 E.96034
G1 X226.236 Y177.446 E.02436
G1 X185.571 Y218.111 E1.90768
G1 X165.098 Y197.639 E.96038
G1 X165.743 Y197.639 E.0214
G1 X145.272 Y218.111 E.96034
G1 X124.799 Y197.639 E.96038
G1 X125.444 Y197.639 E.0214
G1 X104.973 Y218.111 E.96034
G1 X84.5 Y197.639 E.96038
G1 X85.145 Y197.639 E.0214
G1 X64.672 Y218.111 E.96038
G1 X29.764 Y183.203 E1.63761
G1 X29.764 Y183.937 E.02435
M73 P48 R33
G1 X50.236 Y163.466 E.96034
G1 X50.236 Y163.375 E.00301
G1 X29.764 Y142.904 E.96034
G1 X29.764 Y143.638 E.02435
G1 X50.236 Y123.167 E.96034
G1 X50.236 Y123.076 E.00301
G1 X29.764 Y102.605 E.96034
G1 X29.764 Y103.339 E.02435
G1 X50.236 Y82.868 E.96034
G1 X50.236 Y82.777 E.00301
G1 X29.764 Y62.306 E.96034
G1 X29.764 Y63.04 E.02436
G1 X58.915 Y33.889 E1.36753
G1 X79.388 Y54.361 E.96038
G1 X78.743 Y54.361 E.0214
G1 X99.214 Y33.889 E.96034
G1 X119.687 Y54.361 E.96038
G1 X119.042 Y54.361 E.0214
G1 X126.2 Y47.203 E.33578
G2 X129.798 Y47.2 I1.797 J-3.192 E.12477
G1 X136.958 Y54.361 E.3359
G1 X136.313 Y54.361 E.0214
G1 X156.786 Y33.889 E.96038
G1 X177.257 Y54.361 E.96034
G1 X176.612 Y54.361 E.0214
G1 X197.085 Y33.889 E.96038
G1 X226.236 Y63.04 E1.36753
G1 X226.236 Y62.306 E.02435
G1 X205.764 Y82.777 E.96034
G1 X205.764 Y82.868 E.00301
G1 X226.236 Y103.339 E.96034
G1 X226.236 Y102.605 E.02435
G1 X205.764 Y123.076 E.96034
G1 X205.764 Y123.167 E.00301
G1 X226.236 Y143.638 E.96034
G1 X226.236 Y142.904 E.02435
G1 X205.764 Y163.375 E.96034
G1 X205.764 Y163.466 E.00301
G1 X226.236 Y183.937 E.96034
G1 X226.236 Y183.203 E.02435
G1 X191.328 Y218.111 E1.63761
G1 X170.855 Y197.639 E.96038
G1 X171.5 Y197.639 E.0214
G1 X151.029 Y218.111 E.96034
G1 X130.556 Y197.639 E.96038
G1 X131.201 Y197.639 E.0214
G1 X110.73 Y218.111 E.96034
G1 X90.257 Y197.639 E.96038
G1 X90.902 Y197.639 E.0214
G1 X70.429 Y218.111 E.96038
G1 X29.764 Y177.446 E1.90768
G1 X29.764 Y178.18 E.02435
G1 X50.236 Y157.709 E.96034
G1 X50.236 Y157.618 E.00301
G1 X29.764 Y137.147 E.96034
G1 X29.764 Y137.881 E.02435
G1 X38.441 Y129.204 E.40705
G2 X39.4 Y129.511 I2.244 J-5.35 E.03343
G1 X50.236 Y140.347 E.50832
G1 X50.236 Y140.438 E.00301
G1 X29.764 Y160.909 E.96034
G1 X29.764 Y160.175 E.02435
G1 X50.236 Y180.646 E.96034
G1 X50.236 Y180.737 E.00301
G1 X29.764 Y201.208 E.96034
G1 X29.764 Y200.473 E.02435
G1 X36.5 Y207.209 E.31599
G2 X36.564 Y208.821 I4.148 J.643 E.05385
; WIPE_START
G1 X36.438 Y208.053 E-.29591
G1 X36.5 Y207.209 E-.32142
G1 X36.235 Y206.944 E-.14267
; WIPE_END
G1 E-.04 F1800
G1 X41.025 Y204.461 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
G1 F16200
G2 X39.415 Y204.367 I-1.006 J3.376 E.05398
G1 X29.764 Y194.716 E.45272
G1 X29.764 Y195.451 E.02435
G1 X50.236 Y174.98 E.96034
G1 X50.236 Y174.889 E.00301
G1 X29.764 Y154.418 E.96034
G1 X29.764 Y155.152 E.02435
G1 X50.236 Y134.681 E.96034
G1 X50.236 Y134.59 E.00301
G1 X43.203 Y127.558 E.32989
G2 X43.203 Y124.442 I-3.341 J-1.558 E.10672
G1 X50.236 Y117.41 E.32989
G1 X50.236 Y117.319 E.00301
G1 X29.764 Y96.848 E.96034
G1 X29.764 Y97.582 E.02436
G1 X50.236 Y77.111 E.96034
G1 X50.236 Y77.02 E.00301
G1 X29.764 Y56.549 E.96034
G1 X29.764 Y57.283 E.02436
G1 X39.41 Y47.638 E.45248
G2 X41.02 Y47.54 I.554 J-4.17 E.05385
; WIPE_START
G1 X40.267 Y47.682 E-.29138
G1 X39.41 Y47.638 E-.32596
G1 X39.144 Y47.904 E-.14266
; WIPE_END
G1 E-.04 F1800
G1 X36.564 Y43.179 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
G1 F16200
G2 X36.5 Y44.791 I4.084 J.969 E.05385
G1 X29.764 Y51.527 E.31599
G1 X29.764 Y50.792 E.02436
G1 X50.236 Y71.263 E.96034
G1 X50.236 Y71.354 E.00301
G1 X29.764 Y91.825 E.96034
G1 X29.764 Y91.091 E.02436
G1 X50.236 Y111.562 E.96034
G1 X50.236 Y111.653 E.00301
G1 X39.393 Y122.495 E.50863
G2 X38.441 Y122.796 I1.109 J5.165 E.03317
G1 X29.764 Y114.119 E.40705
G1 X29.764 Y114.853 E.02435
G1 X50.236 Y94.382 E.96034
G1 X50.236 Y94.291 E.00301
G1 X29.764 Y73.82 E.96034
G1 X29.764 Y74.554 E.02436
G1 X70.429 Y33.889 E1.90768
G1 X90.902 Y54.361 E.96038
G1 X90.257 Y54.361 E.0214
G1 X110.728 Y33.889 E.96034
G1 X131.201 Y54.361 E.96038
G1 X130.556 Y54.361 E.0214
G1 X151.027 Y33.889 E.96034
G1 X171.5 Y54.361 E.96038
G1 X170.855 Y54.361 E.0214
G1 X191.328 Y33.889 E.96038
G1 X226.236 Y68.797 E1.63761
G1 X226.236 Y68.063 E.02435
G1 X205.764 Y88.534 E.96034
G1 X205.764 Y88.625 E.00301
G1 X226.236 Y109.096 E.96034
G1 X226.236 Y108.362 E.02435
G1 X205.764 Y128.833 E.96034
G1 X205.764 Y128.924 E.00301
G1 X226.236 Y149.395 E.96034
G1 X226.236 Y148.661 E.02435
G1 X205.764 Y169.132 E.96034
G1 X205.764 Y169.223 E.00301
G1 X226.236 Y189.694 E.96034
G1 X226.236 Y188.96 E.02436
G1 X197.085 Y218.111 E1.36753
G1 X176.612 Y197.639 E.96038
G1 X177.257 Y197.639 E.0214
G1 X156.786 Y218.111 E.96034
G1 X136.313 Y197.639 E.96038
G1 X136.958 Y197.639 E.0214
G1 X129.798 Y204.8 E.3359
G2 X126.2 Y204.797 I-1.801 J3.144 E.1249
G1 X119.042 Y197.639 E.33578
G1 X119.687 Y197.639 E.0214
G1 X99.214 Y218.111 E.96038
G1 X78.743 Y197.639 E.96034
G1 X79.388 Y197.639 E.0214
G1 X58.915 Y218.111 E.96038
G1 X29.764 Y188.96 E1.36753
G1 X29.764 Y189.694 E.02435
G1 X50.236 Y169.223 E.96034
G1 X50.236 Y169.132 E.00301
G1 X29.764 Y148.661 E.96034
G1 X29.764 Y149.395 E.02435
G1 X50.236 Y128.924 E.96034
G1 X50.236 Y128.833 E.00301
G1 X29.764 Y108.362 E.96034
G1 X29.764 Y109.096 E.02435
G1 X50.236 Y88.625 E.96034
G1 X50.236 Y88.534 E.00301
G1 X29.764 Y68.063 E.96034
G1 X29.764 Y68.797 E.02435
G1 X64.672 Y33.889 E1.63761
G1 X85.145 Y54.361 E.96038
G1 X84.5 Y54.361 E.0214
G1 X104.971 Y33.889 E.96034
G1 X125.444 Y54.361 E.96038
G1 X124.799 Y54.361 E.0214
G1 X145.27 Y33.889 E.96034
G1 X165.743 Y54.361 E.96038
G1 X165.098 Y54.361 E.0214
G1 X185.571 Y33.889 E.96038
G1 X226.236 Y74.554 E1.90768
G1 X226.236 Y73.82 E.02435
G1 X205.764 Y94.291 E.96034
G1 X205.764 Y94.382 E.00301
G1 X226.236 Y114.853 E.96034
G1 X226.236 Y114.119 E.02435
G1 X217.559 Y122.795 E.40703
G2 X216.596 Y122.485 I-2.543 J6.233 E.0336
G1 X205.764 Y111.653 E.50813
G1 X205.764 Y111.562 E.00301
G1 X226.236 Y91.091 E.96034
G1 X226.236 Y91.825 E.02435
G1 X205.764 Y71.354 E.96034
G1 X205.764 Y71.263 E.00301
G1 X226.236 Y50.792 E.96034
G1 X226.236 Y51.527 E.02435
G1 X219.502 Y44.793 E.31589
G2 X219.435 Y43.18 I-3.565 J-.661 E.05398
; WIPE_START
G1 X219.567 Y44.125 E-.36237
G1 X219.502 Y44.793 E-.25496
G1 X219.767 Y45.058 E-.14267
; WIPE_END
G1 E-.04 F1800
G1 X214.982 Y47.539 Z1.8 F30000
M73 P49 R33
G1 Z1.4
G1 E.8 F1800
G1 F16200
G2 X216.593 Y47.641 I1.028 J-3.481 E.05398
G1 X226.236 Y57.284 E.45236
G1 X226.236 Y56.549 E.02435
G1 X205.764 Y77.02 E.96034
G1 X205.764 Y77.111 E.00301
G1 X226.236 Y97.582 E.96034
G1 X226.236 Y96.848 E.02435
G1 X205.764 Y117.319 E.96034
G1 X205.764 Y117.41 E.00301
G1 X212.794 Y124.439 E.32976
G2 X212.794 Y127.561 I3.243 J1.561 E.1071
G1 X205.764 Y134.59 E.32976
G1 X205.764 Y134.681 E.00301
G1 X226.236 Y155.152 E.96034
G1 X226.236 Y154.418 E.02436
G1 X205.764 Y174.889 E.96034
G1 X205.764 Y174.98 E.00301
G1 X226.236 Y195.451 E.96034
G1 X226.236 Y194.716 E.02436
G1 X216.593 Y204.359 E.45236
G2 X214.981 Y204.461 I-.444 J5.775 E.05374
G1 X203.768 Y197.639 F30000
G1 F16200
G1 X205.396 Y197.639 E.05401
G1 X213.304 Y205.547 E.37094
G2 X212.485 Y208.467 I2.849 J2.373 E.10363
G1 X202.84 Y218.111 E.45246
G1 X182.369 Y197.639 E.96034
G1 X183.014 Y197.639 E.0214
G1 X162.541 Y218.111 E.96038
G1 X142.07 Y197.639 E.96034
G1 X142.715 Y197.639 E.0214
G1 X131.397 Y208.958 E.53096
G3 X131.076 Y209.673 I-3.654 J-1.209 E.02606
G1 X139.515 Y218.111 E.39585
G1 X159.986 Y197.639 E.96034
G1 X159.341 Y197.639 E.0214
G1 X179.814 Y218.111 E.96038
G1 X200.285 Y197.639 E.96034
G1 X199.639 Y197.639 E.0214
G1 X220.111 Y218.111 E.96034
G1 X226.236 Y211.987 E.28729
G1 X226.236 Y212.722 E.02436
G1 X205.764 Y192.251 E.96034
G1 X205.764 Y192.16 E.00301
G1 X226.236 Y171.689 E.96034
G1 X226.236 Y172.423 E.02436
G1 X205.764 Y151.952 E.96034
G1 X205.764 Y151.861 E.00301
G1 X226.236 Y131.39 E.96034
G1 X226.236 Y132.124 E.02436
G1 X219.512 Y125.401 E.31541
G3 X219.512 Y126.599 I-4.86 J.599 E.03986
G1 X226.236 Y119.876 E.31541
G1 X226.236 Y120.61 E.02435
G1 X205.764 Y100.139 E.96034
G1 X205.764 Y100.048 E.00301
G1 X226.236 Y79.577 E.96034
G1 X226.236 Y80.311 E.02435
G1 X205.764 Y59.84 E.96034
G1 X205.764 Y59.749 E.00301
G1 X226.236 Y39.278 E.96034
G1 X226.236 Y40.013 E.02435
G1 X220.111 Y33.889 E.28729
G1 X199.64 Y54.361 E.96034
G1 X200.285 Y54.361 E.0214
G1 X179.814 Y33.889 E.96034
G1 X159.341 Y54.361 E.96038
G1 X159.986 Y54.361 E.0214
G1 X139.515 Y33.889 E.96034
G1 X131.076 Y42.327 E.39585
G3 X131.397 Y43.042 I-3.331 J1.924 E.02606
G1 X142.715 Y54.361 E.53096
G1 X142.07 Y54.361 E.0214
G1 X162.541 Y33.889 E.96034
G1 X183.014 Y54.361 E.96038
G1 X182.369 Y54.361 E.0214
G1 X202.84 Y33.889 E.96034
G1 X212.485 Y43.533 E.45246
G2 X213.304 Y46.453 I3.667 J.547 E.10363
G1 X205.396 Y54.361 E.37094
G1 X203.768 Y54.361 E.05401
; WIPE_START
G1 X205.396 Y54.361 E-.61876
G1 X205.659 Y54.098 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X211.374 Y49.039 Z1.8 F30000
G1 X226.236 Y35.884 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F16200
G1 X226.236 Y34.256 E.05401
G1 X225.868 Y33.889 E.01722
G1 X218.328 Y41.429 E.35368
G2 X215.337 Y40.628 I-2.321 J2.685 E.10628
G1 X208.597 Y33.889 E.31617
G1 X188.126 Y54.361 E.96034
G1 X188.771 Y54.361 E.0214
G1 X168.298 Y33.889 E.96038
G1 X147.827 Y54.361 E.96034
G1 X148.472 Y54.361 E.0214
G1 X127.999 Y33.889 E.96038
G1 X107.528 Y54.361 E.96034
G1 X108.173 Y54.361 E.0214
G1 X87.7 Y33.889 E.96038
G1 X67.229 Y54.361 E.96034
G1 X67.874 Y54.361 E.0214
G1 X47.403 Y33.889 E.96034
G1 X40.667 Y40.624 E.31595
G2 X37.67 Y41.427 I-.661 J3.526 E.10646
G1 X30.132 Y33.889 E.3536
G1 X29.764 Y34.256 E.01722
G1 X29.764 Y35.884 E.05401
; WIPE_START
G1 X29.764 Y34.256 E-.61876
G1 X30.028 Y33.993 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X35.653 Y39.153 Z1.8 F30000
G1 X52.232 Y54.361 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F16200
G1 X50.604 Y54.361 E.05401
G1 X42.698 Y46.455 E.37088
G2 X43.513 Y43.535 I-2.855 J-2.371 E.10361
G1 X53.16 Y33.889 E.45251
G1 X73.631 Y54.361 E.96034
G1 X72.986 Y54.361 E.0214
G1 X93.459 Y33.889 E.96038
G1 X113.93 Y54.361 E.96034
G1 X113.285 Y54.361 E.0214
G1 X124.607 Y43.038 E.53116
G3 X124.924 Y42.326 I3.524 J1.138 E.02589
G1 X116.485 Y33.889 E.39582
G1 X96.014 Y54.361 E.96034
G1 X96.659 Y54.361 E.0214
G1 X76.186 Y33.889 E.96038
G1 X55.715 Y54.361 E.96034
G1 X56.361 Y54.361 E.0214
G1 X35.889 Y33.889 E.96034
G1 X29.764 Y40.013 E.28729
G1 X29.764 Y39.278 E.02436
G1 X50.236 Y59.749 E.96034
G1 X50.236 Y59.84 E.00301
G1 X29.764 Y80.311 E.96034
G1 X29.764 Y79.577 E.02436
G1 X50.236 Y100.048 E.96034
G1 X50.236 Y100.139 E.00301
G1 X29.764 Y120.61 E.96034
G1 X29.764 Y119.876 E.02436
G1 X36.487 Y126.598 E.31535
G3 X36.487 Y125.402 I3.636 J-.598 E.03986
G1 X29.764 Y132.124 E.31535
G1 X29.764 Y131.39 E.02435
G1 X50.236 Y151.861 E.96034
G1 X50.236 Y151.952 E.00301
G1 X29.764 Y172.423 E.96034
G1 X29.764 Y171.689 E.02435
G1 X50.236 Y192.16 E.96034
G1 X50.236 Y192.251 E.00301
G1 X29.764 Y212.722 E.96034
G1 X29.764 Y211.987 E.02435
G1 X35.889 Y218.111 E.28729
G1 X56.36 Y197.639 E.96034
G1 X55.715 Y197.639 E.0214
G1 X76.186 Y218.111 E.96034
G1 X96.659 Y197.639 E.96038
G1 X96.014 Y197.639 E.0214
G1 X116.485 Y218.111 E.96034
G1 X124.924 Y209.674 E.39582
G3 X124.607 Y208.962 I3.208 J-1.85 E.02589
G1 X113.285 Y197.639 E.53116
G1 X113.93 Y197.639 E.0214
G1 X93.459 Y218.111 E.96034
G1 X72.986 Y197.639 E.96038
G1 X73.631 Y197.639 E.0214
G1 X53.16 Y218.111 E.96034
G1 X43.513 Y208.465 E.45251
G2 X42.698 Y205.545 I-3.67 J-.549 E.10361
G1 X50.604 Y197.639 E.37088
G1 X52.232 Y197.639 E.05401
; WIPE_START
G1 X50.604 Y197.639 E-.61876
G1 X50.341 Y197.902 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X44.626 Y202.961 Z1.8 F30000
G1 X29.764 Y216.116 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F16200
G1 X29.764 Y217.744 E.05401
G1 X30.132 Y218.111 E.01722
G1 X37.67 Y210.573 E.3536
G2 X40.667 Y211.376 I2.373 J-2.859 E.1062
G1 X47.403 Y218.111 E.31595
G1 X67.874 Y197.639 E.96034
G1 X67.229 Y197.639 E.0214
G1 X87.7 Y218.111 E.96034
G1 X108.173 Y197.639 E.96038
G1 X107.528 Y197.639 E.0214
G1 X127.999 Y218.111 E.96034
G1 X148.472 Y197.639 E.96038
G1 X147.827 Y197.639 E.0214
G1 X168.298 Y218.111 E.96034
G1 X188.771 Y197.639 E.96038
G1 X188.126 Y197.639 E.0214
G1 X208.597 Y218.111 E.96034
G1 X215.334 Y211.375 E.31603
G2 X218.328 Y210.571 I.629 J-3.636 E.10612
G1 X225.868 Y218.111 E.35368
G1 X226.236 Y217.744 E.01722
G1 X226.236 Y216.116 E.05401
G1 X130.474 Y210.443 F30000
G1 F16200
G3 X129.087 Y211.268 I-2.504 J-2.632 E.05398
G1 X122.242 Y218.111 E.32105
G1 X101.771 Y197.639 E.96034
G1 X102.416 Y197.639 E.0214
G1 X81.945 Y218.111 E.96034
G1 X61.472 Y197.639 E.96038
G1 X62.117 Y197.639 E.0214
G1 X41.646 Y218.111 E.96034
G1 X29.764 Y206.23 E.55736
G1 X29.764 Y206.965 E.02435
G1 X50.236 Y186.494 E.96034
G1 X50.236 Y186.403 E.00301
G1 X29.764 Y165.932 E.96034
G1 X29.764 Y166.666 E.02435
G1 X50.236 Y146.195 E.96034
G1 X50.236 Y146.104 E.00301
G1 X29.764 Y125.633 E.96034
G1 X29.764 Y126.367 E.02435
G1 X50.236 Y105.896 E.96034
G1 X50.236 Y105.805 E.00301
G1 X29.764 Y85.334 E.96034
G1 X29.764 Y86.068 E.02435
G1 X50.236 Y65.597 E.96034
G1 X50.236 Y65.506 E.00301
G1 X29.764 Y45.035 E.96034
G1 X29.764 Y45.77 E.02436
G1 X41.646 Y33.889 E.55736
G1 X62.117 Y54.361 E.96034
G1 X61.472 Y54.361 E.0214
G1 X81.945 Y33.889 E.96038
G1 X102.416 Y54.361 E.96034
G1 X101.771 Y54.361 E.0214
G1 X122.242 Y33.889 E.96034
G1 X129.087 Y40.732 E.32105
G2 X126.916 Y40.729 I-1.09 J4.084 E.07282
G1 X133.758 Y33.889 E.32092
G1 X154.229 Y54.361 E.96034
G1 X153.584 Y54.361 E.0214
G1 X174.055 Y33.889 E.96034
G1 X194.528 Y54.361 E.96038
G1 X193.883 Y54.361 E.0214
G1 X214.354 Y33.889 E.96034
G1 X226.236 Y45.77 E.55736
G1 X226.236 Y45.035 E.02435
G1 X205.764 Y65.506 E.96034
G1 X205.764 Y65.597 E.00301
G1 X226.236 Y86.068 E.96034
G1 X226.236 Y85.334 E.02435
G1 X205.764 Y105.805 E.96034
G1 X205.764 Y105.896 E.00301
G1 X226.236 Y126.367 E.96034
G1 X226.236 Y125.633 E.02435
G1 X205.764 Y146.104 E.96034
G1 X205.764 Y146.195 E.00301
G1 X226.236 Y166.666 E.96034
G1 X226.236 Y165.932 E.02435
G1 X205.764 Y186.403 E.96034
G1 X205.764 Y186.494 E.00301
G1 X226.236 Y206.965 E.96034
G1 X226.236 Y206.23 E.02436
G1 X214.354 Y218.111 E.55736
G1 X193.883 Y197.639 E.96034
G1 X194.528 Y197.639 E.0214
G1 X174.055 Y218.111 E.96038
G1 X153.584 Y197.639 E.96034
G1 X154.229 Y197.639 E.0214
G1 X133.758 Y218.111 E.96034
G1 X126.916 Y211.271 E.32092
G3 X125.531 Y210.443 I1.427 J-3.962 E.05385
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F16200
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
G1 X128.812 Y204.764
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F16213.044
G1 X128.872 Y204.777 E.00204
G3 X127.6 Y204.682 I-.871 J3.096 E.6277
G1 X127.92 Y204.658 E.01064
G3 X128.559 Y204.706 I.081 J3.215 E.02128
G1 X128.753 Y204.75 E.00662
G1 X128.39 Y205.095 F30000
G1 F16213.044
G1 X128.488 Y205.107 E.00327
G3 X127.651 Y205.086 I-.488 J2.766 E.5575
G1 X127.93 Y205.065 E.00929
G3 X128.21 Y205.072 I.07 J2.808 E.00929
G1 X128.331 Y205.088 E.00404
G1 X128.044 Y205.481 F30000
G1 F16213.044
G1 X128.417 Y205.509 E.01242
G3 X127.701 Y205.491 I-.417 J2.365 E.47665
G1 X127.94 Y205.473 E.00795
G1 X127.984 Y205.476 E.00146
G1 X127.84 Y205.874 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X127.95 Y205.865 E.0034
G3 X127.75 Y205.88 I.05 J2.008 E.38171
G1 X127.78 Y205.878 E.00092
; WIPE_START
M204 S10000
G1 X127.95 Y205.865 E-.0648
G1 X128.349 Y205.895 E-.15212
G1 X128.734 Y206.004 E-.15214
G1 X129.091 Y206.186 E-.15215
G1 X129.404 Y206.436 E-.15207
G1 X129.55 Y206.611 E-.08673
; WIPE_END
G1 E-.04 F1800
G1 X137.181 Y206.438 Z2 F30000
G1 X215.977 Y204.659 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X216.24 Y204.666 E.00875
G3 X215.6 Y204.682 I-.24 J3.207 E.64899
G1 X215.917 Y204.658 E.01054
G1 X215.968 Y205.066 F30000
G1 F16213.044
G1 X216.21 Y205.072 E.00804
G3 X215.651 Y205.086 I-.21 J2.801 E.5668
G1 X215.908 Y205.067 E.00856
G1 X215.976 Y205.476 F30000
G1 F16213.044
G1 X216.417 Y205.509 E.01468
G3 X215.701 Y205.491 I-.417 J2.365 E.47665
G1 X215.916 Y205.475 E.00715
G1 X215.972 Y205.867 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X216.349 Y205.895 E.01163
G3 X215.75 Y205.88 I-.349 J1.978 E.36939
G1 X215.912 Y205.868 E.00498
; WIPE_START
M204 S10000
G1 X216.349 Y205.895 E-.16647
G1 X216.734 Y206.004 E-.15214
G1 X217.091 Y206.186 E-.15211
G1 X217.404 Y206.436 E-.1521
G1 X217.636 Y206.712 E-.13718
; WIPE_END
G1 E-.04 F1800
G1 X217.578 Y199.08 Z2 F30000
G1 X217.003 Y122.946 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X217.176 Y123.004 E.00606
G3 X215.76 Y122.795 I-1.167 J2.996 E.62223
G3 X216.871 Y122.904 I.238 J3.279 E.03722
G1 X216.945 Y122.928 E.0026
G1 X216.556 Y123.248 F30000
G1 F16213.044
G1 X216.761 Y123.295 E.00697
G3 X215.79 Y123.201 I-.751 J2.706 E.55287
G3 X216.488 Y123.232 I.227 J2.724 E.02323
G1 X216.498 Y123.235 E.00033
G1 X216.114 Y123.604 F30000
G1 F16213.044
G1 X216.179 Y123.616 E.00218
G3 X216.651 Y123.687 I-.262 J3.344 E.01585
G3 X215.821 Y123.607 I-.642 J2.314 E.47269
G1 X216.054 Y123.605 E.00773
G1 X215.85 Y123.998 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X216.349 Y124.02 I.154 J2.146 E.01539
G3 X215.79 Y124.004 I-.339 J1.98 E.37054
; WIPE_START
M204 S10000
G1 X216.15 Y123.995 E-.13681
G1 X216.349 Y124.02 E-.07618
G1 X216.734 Y124.129 E-.15213
G1 X217.091 Y124.311 E-.15212
G1 X217.404 Y124.561 E-.1521
G1 X217.557 Y124.744 E-.09067
; WIPE_END
G1 E-.04 F1800
G1 X217.506 Y117.111 Z2 F30000
G1 X217.003 Y41.071 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X217.176 Y41.129 E.00605
G3 X215.76 Y40.92 I-1.167 J2.996 E.62223
G3 X216.871 Y41.029 I.238 J3.279 E.03722
G1 X216.946 Y41.053 E.0026
G1 X216.556 Y41.373 F30000
G1 F16213.044
G1 X216.761 Y41.42 E.00696
G3 X215.79 Y41.326 I-.751 J2.706 E.55287
G3 X216.488 Y41.357 I.227 J2.723 E.02323
G1 X216.498 Y41.36 E.00034
G1 X216.114 Y41.729 F30000
G1 F16213.044
G1 X216.179 Y41.741 E.00218
G3 X216.651 Y41.812 I-.262 J3.343 E.01585
G3 X215.821 Y41.732 I-.642 J2.314 E.47269
G1 X216.054 Y41.73 E.00774
G1 X215.85 Y42.123 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X216.349 Y42.145 I.154 J2.146 E.01539
G3 X215.79 Y42.129 I-.339 J1.98 E.37054
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
G1 F16213.044
G1 X126.679 Y41.198 E.00451
G3 X127.76 Y40.92 I1.33 J2.927 E.0372
G3 X129.176 Y41.129 I.238 J3.279 E.04787
G3 X126.395 Y41.345 I-1.167 J2.996 E.57441
G1 X126.503 Y41.283 E.00413
G1 X127.041 Y41.486 F30000
G1 F16213.044
G1 X127.107 Y41.467 E.00227
G3 X127.79 Y41.326 I.903 J2.659 E.0232
G3 X128.761 Y41.42 I.227 J2.722 E.03253
G3 X126.847 Y41.569 I-.751 J2.706 E.52039
G1 X126.986 Y41.51 E.00502
G1 X127.531 Y41.773 F30000
G1 F16213.044
G1 X127.821 Y41.732 E.0097
G3 X128.651 Y41.812 I.096 J3.351 E.02774
G3 X127.466 Y41.787 I-.642 J2.314 E.46079
G1 X127.473 Y41.785 E.00021
G1 X127.85 Y42.123 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X128.349 Y42.145 I.154 J2.146 E.01539
G3 X127.79 Y42.129 I-.339 J1.98 E.37054
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
G1 X41.002 Y41.071 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X41.176 Y41.129 E.00606
G3 X39.76 Y40.92 I-1.166 J2.996 E.62223
G3 X40.871 Y41.029 I.238 J3.279 E.03722
G1 X40.945 Y41.053 E.00259
G1 X40.556 Y41.373 F30000
G1 F16213.044
G1 X40.761 Y41.42 E.00698
G3 X39.79 Y41.326 I-.751 J2.706 E.55287
G3 X40.488 Y41.357 I.227 J2.723 E.02323
G1 X40.498 Y41.359 E.00033
G1 X40.114 Y41.729 F30000
G1 F16213.044
G1 X40.179 Y41.741 E.00219
G3 X40.651 Y41.812 I-.262 J3.342 E.01585
G3 X39.821 Y41.732 I-.642 J2.314 E.47269
G1 X40.054 Y41.73 E.00773
G1 X39.85 Y42.123 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X40.349 Y42.145 I.154 J2.146 E.01539
G3 X39.79 Y42.129 I-.339 J1.98 E.37054
; WIPE_START
M204 S10000
G1 X40.15 Y42.12 E-.13681
G1 X40.349 Y42.145 E-.07618
G1 X40.544 Y42.19 E-.07613
G1 X40.917 Y42.336 E-.1521
G1 X41.253 Y42.553 E-.15216
G1 X41.54 Y42.833 E-.1521
G1 X41.561 Y42.864 E-.01452
; WIPE_END
G1 E-.04 F1800
G1 X47.116 Y48.099 Z2 F30000
G1 X205.416 Y197.291 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X50.584 Y197.291 E5.13608
G1 X50.584 Y54.709 E4.72972
G1 X205.416 Y54.709 E5.13608
G1 X205.416 Y197.231 E4.72773
G1 X205.009 Y196.884 F30000
G1 F16213.044
G1 X50.991 Y196.884 E5.10907
G1 X50.991 Y55.116 E4.70271
G1 X205.009 Y55.116 E5.10907
G1 X205.009 Y196.824 E4.70072
G1 X204.602 Y196.477 F30000
G1 F16213.044
G1 X51.398 Y196.477 E5.08206
G1 X51.398 Y55.523 E4.67571
G1 X204.602 Y55.523 E5.08206
G1 X204.602 Y196.417 E4.67372
G1 X204.21 Y196.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X51.79 Y196.085 E4.68344
G1 X51.79 Y55.915 E4.30703
G1 X204.21 Y55.915 E4.68344
G1 X204.21 Y196.025 E4.30519
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
G1 F16213.044
G1 X41.176 Y123.004 E.00606
G3 X39.76 Y122.795 I-1.167 J2.996 E.62223
G3 X40.871 Y122.904 I.238 J3.28 E.03722
G1 X40.945 Y122.928 E.0026
G1 X40.556 Y123.248 F30000
G1 F16213.044
G1 X40.761 Y123.295 E.00697
G3 X39.79 Y123.201 I-.751 J2.706 E.55288
G3 X40.488 Y123.232 I.227 J2.724 E.02323
G1 X40.498 Y123.235 E.00033
G1 X40.114 Y123.604 F30000
G1 F16213.044
G1 X40.179 Y123.616 E.00218
G3 X40.651 Y123.687 I-.262 J3.343 E.01585
G3 X39.821 Y123.607 I-.642 J2.314 E.47269
G1 X40.054 Y123.605 E.00774
G1 X39.85 Y123.998 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X40.349 Y124.02 I.154 J2.146 E.01539
G3 X39.79 Y124.004 I-.339 J1.98 E.37054
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
G1 X41.406 Y132.375 Z2 F30000
G1 X39.977 Y204.659 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X40.24 Y204.666 E.00875
G3 X39.6 Y204.682 I-.24 J3.207 E.64899
G1 X39.917 Y204.658 E.01054
G1 X39.968 Y205.066 F30000
G1 F16213.044
G1 X40.21 Y205.072 E.00804
G3 X39.651 Y205.086 I-.21 J2.801 E.5668
G1 X39.908 Y205.067 E.00856
G1 X39.976 Y205.476 F30000
G1 F16213.044
G1 X40.417 Y205.509 E.01467
M73 P49 R32
G3 X39.701 Y205.491 I-.417 J2.365 E.47665
G1 X39.916 Y205.475 E.00715
G1 X39.972 Y205.867 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X40.349 Y205.895 E.01162
G3 X39.75 Y205.88 I-.349 J1.978 E.36939
G1 X39.912 Y205.868 E.00499
; WIPE_START
M204 S10000
G1 X40.349 Y205.895 E-.16641
G1 X40.734 Y206.004 E-.15214
G1 X41.091 Y206.186 E-.15211
G1 X41.404 Y206.436 E-.1521
G1 X41.636 Y206.713 E-.13724
; WIPE_END
G1 E-.04 F1800
G1 X49.253 Y207.196 Z2 F30000
G1 X226.584 Y218.459 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X29.416 Y218.459 E6.54041
G1 X29.416 Y33.541 E6.13406
G1 X226.584 Y33.541 E6.54041
G1 X226.584 Y218.399 E6.13207
G1 X226.991 Y218.866 F30000
G1 F16213.044
G1 X29.009 Y218.866 E6.56742
G1 X29.009 Y33.134 E6.16106
G1 X226.991 Y33.134 E6.56742
G1 X226.991 Y218.806 E6.15907
G1 X227.398 Y219.273 F30000
G1 F16213.044
G1 X28.602 Y219.273 E6.59442
G1 X28.602 Y32.727 E6.18807
G1 X227.398 Y32.727 E6.59442
G1 X227.398 Y219.213 E6.18608
G1 X227.79 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X28.21 Y219.665 E6.13254
M73 P50 R32
G1 X28.21 Y32.335 E5.75613
G1 X227.79 Y32.335 E6.13254
G1 X227.79 Y219.605 E5.75429
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
G1 F16200
G1 X226.236 Y217.744 E.05401
G1 X225.868 Y218.111 E.01722
G1 X218.328 Y210.571 E.35368
G3 X215.334 Y211.375 I-2.365 J-2.833 E.10612
G1 X208.597 Y218.111 E.31603
G1 X188.126 Y197.639 E.96034
G1 X188.771 Y197.639 E.0214
G1 X168.298 Y218.111 E.96038
G1 X147.827 Y197.639 E.96034
G1 X148.472 Y197.639 E.0214
G1 X127.999 Y218.111 E.96038
G1 X107.528 Y197.639 E.96034
G1 X108.173 Y197.639 E.0214
G1 X87.7 Y218.111 E.96038
G1 X67.229 Y197.639 E.96034
G1 X67.874 Y197.639 E.0214
G1 X47.403 Y218.111 E.96034
G1 X40.667 Y211.376 E.31595
G3 X37.67 Y210.573 I-.625 J-3.663 E.1062
G1 X30.132 Y218.111 E.3536
G1 X29.764 Y217.744 E.01722
G1 X29.764 Y216.116 E.05401
G1 X36.564 Y208.821 F30000
G1 F16200
G3 X36.5 Y207.209 I4.085 J-.969 E.05385
G1 X29.764 Y200.473 E.31599
G1 X29.764 Y201.208 E.02435
G1 X50.236 Y180.737 E.96034
G1 X50.236 Y180.646 E.00301
G1 X29.764 Y160.175 E.96034
G1 X29.764 Y160.909 E.02435
G1 X50.236 Y140.438 E.96034
G1 X50.236 Y140.347 E.00301
G1 X39.4 Y129.511 E.50832
G3 X38.441 Y129.204 I1.286 J-5.659 E.03343
G1 X29.764 Y137.881 E.40705
G1 X29.764 Y137.147 E.02435
G1 X50.236 Y157.618 E.96034
G1 X50.236 Y157.709 E.00301
G1 X29.764 Y178.18 E.96034
G1 X29.764 Y177.446 E.02435
G1 X70.429 Y218.111 E1.90768
G1 X90.902 Y197.639 E.96038
G1 X90.257 Y197.639 E.0214
G1 X110.728 Y218.111 E.96034
G1 X131.201 Y197.639 E.96038
G1 X130.556 Y197.639 E.0214
G1 X151.027 Y218.111 E.96034
G1 X171.5 Y197.639 E.96038
G1 X170.855 Y197.639 E.0214
G1 X191.328 Y218.111 E.96038
G1 X226.236 Y183.203 E1.63761
G1 X226.236 Y183.937 E.02435
G1 X205.764 Y163.466 E.96034
G1 X205.764 Y163.375 E.00301
G1 X226.236 Y142.904 E.96034
G1 X226.236 Y143.638 E.02435
G1 X205.764 Y123.167 E.96034
G1 X205.764 Y123.076 E.00301
G1 X226.236 Y102.605 E.96034
G1 X226.236 Y103.339 E.02435
G1 X205.764 Y82.868 E.96034
G1 X205.764 Y82.777 E.00301
G1 X226.236 Y62.306 E.96034
G1 X226.236 Y63.04 E.02435
G1 X197.085 Y33.889 E1.36753
G1 X176.612 Y54.361 E.96038
G1 X177.257 Y54.361 E.0214
G1 X156.786 Y33.889 E.96034
G1 X136.313 Y54.361 E.96038
G1 X136.958 Y54.361 E.0214
G1 X129.798 Y47.2 E.3359
G3 X126.2 Y47.203 I-1.801 J-3.19 E.12477
G1 X119.042 Y54.361 E.33578
G1 X119.687 Y54.361 E.0214
G1 X99.214 Y33.889 E.96038
G1 X78.743 Y54.361 E.96034
G1 X79.388 Y54.361 E.0214
G1 X58.915 Y33.889 E.96038
G1 X29.764 Y63.04 E1.36753
G1 X29.764 Y62.306 E.02436
G1 X50.236 Y82.777 E.96034
G1 X50.236 Y82.868 E.00301
G1 X29.764 Y103.339 E.96034
G1 X29.764 Y102.605 E.02435
G1 X50.236 Y123.076 E.96034
G1 X50.236 Y123.167 E.00301
G1 X29.764 Y143.638 E.96034
G1 X29.764 Y142.904 E.02435
G1 X50.236 Y163.375 E.96034
G1 X50.236 Y163.466 E.00301
G1 X29.764 Y183.937 E.96034
G1 X29.764 Y183.203 E.02435
G1 X64.672 Y218.111 E1.63761
G1 X85.145 Y197.639 E.96038
G1 X84.5 Y197.639 E.0214
G1 X104.971 Y218.111 E.96034
G1 X125.444 Y197.639 E.96038
G1 X124.799 Y197.639 E.0214
G1 X145.27 Y218.111 E.96034
G1 X165.743 Y197.639 E.96038
G1 X165.098 Y197.639 E.0214
G1 X185.571 Y218.111 E.96038
G1 X226.236 Y177.446 E1.90768
G1 X226.236 Y178.18 E.02436
G1 X205.764 Y157.709 E.96034
G1 X205.764 Y157.618 E.00301
G1 X226.236 Y137.147 E.96034
G1 X226.236 Y137.881 E.02435
G1 X217.559 Y129.205 E.40703
G3 X216.596 Y129.515 I-2.544 J-6.237 E.0336
G1 X205.764 Y140.347 E.50813
G1 X205.764 Y140.438 E.00301
G1 X226.236 Y160.909 E.96034
G1 X226.236 Y160.175 E.02436
G1 X205.764 Y180.646 E.96034
G1 X205.764 Y180.737 E.00301
G1 X226.236 Y201.208 E.96034
G1 X226.236 Y200.473 E.02436
G1 X219.502 Y207.207 E.31589
G3 X219.435 Y208.82 I-3.565 J.661 E.05398
; WIPE_START
G1 X219.567 Y207.875 E-.36238
G1 X219.502 Y207.207 E-.25496
G1 X219.767 Y206.942 E-.14267
; WIPE_END
G1 E-.04 F1800
G1 X214.982 Y204.461 Z2 F30000
G1 Z1.6
G1 E.8 F1800
G1 F16200
G3 X216.593 Y204.359 I1.028 J3.482 E.05398
G1 X226.236 Y194.716 E.45236
G1 X226.236 Y195.451 E.02436
G1 X205.764 Y174.98 E.96034
G1 X205.764 Y174.889 E.00301
G1 X226.236 Y154.418 E.96034
G1 X226.236 Y155.152 E.02436
G1 X205.764 Y134.681 E.96034
G1 X205.764 Y134.59 E.00301
G1 X212.794 Y127.561 E.32976
G3 X212.794 Y124.439 I3.244 J-1.561 E.1071
G1 X205.764 Y117.41 E.32976
G1 X205.764 Y117.319 E.00301
G1 X226.236 Y96.848 E.96034
G1 X226.236 Y97.582 E.02435
G1 X205.764 Y77.111 E.96034
G1 X205.764 Y77.02 E.00301
G1 X226.236 Y56.549 E.96034
G1 X226.236 Y57.284 E.02435
G1 X216.593 Y47.641 E.45236
G3 X214.982 Y47.539 I-.582 J-3.583 E.05398
; WIPE_START
G1 X215.911 Y47.691 E-.35766
G1 X216.593 Y47.641 E-.2597
G1 X216.858 Y47.906 E-.14264
; WIPE_END
G1 E-.04 F1800
G1 X219.435 Y43.18 Z2 F30000
G1 Z1.6
G1 E.8 F1800
G1 F16200
G3 X219.502 Y44.793 I-3.499 J.952 E.05398
G1 X226.236 Y51.527 E.31589
G1 X226.236 Y50.792 E.02435
G1 X205.764 Y71.263 E.96034
G1 X205.764 Y71.354 E.00301
G1 X226.236 Y91.825 E.96034
G1 X226.236 Y91.091 E.02435
G1 X205.764 Y111.562 E.96034
G1 X205.764 Y111.653 E.00301
G1 X216.596 Y122.485 E.50813
G3 X217.559 Y122.795 I-1.579 J6.541 E.0336
G1 X226.236 Y114.119 E.40703
G1 X226.236 Y114.853 E.02435
G1 X205.764 Y94.382 E.96034
G1 X205.764 Y94.291 E.00301
G1 X226.236 Y73.82 E.96034
G1 X226.236 Y74.554 E.02435
G1 X185.571 Y33.889 E1.90768
G1 X165.098 Y54.361 E.96038
G1 X165.743 Y54.361 E.0214
G1 X145.272 Y33.889 E.96034
G1 X124.799 Y54.361 E.96038
G1 X125.444 Y54.361 E.0214
G1 X104.973 Y33.889 E.96034
G1 X84.5 Y54.361 E.96038
G1 X85.145 Y54.361 E.0214
G1 X64.672 Y33.889 E.96038
G1 X29.764 Y68.797 E1.63761
G1 X29.764 Y68.063 E.02435
G1 X50.236 Y88.534 E.96034
G1 X50.236 Y88.625 E.00301
G1 X29.764 Y109.096 E.96034
G1 X29.764 Y108.362 E.02435
G1 X50.236 Y128.833 E.96034
G1 X50.236 Y128.924 E.00301
G1 X29.764 Y149.395 E.96034
G1 X29.764 Y148.661 E.02435
G1 X50.236 Y169.132 E.96034
G1 X50.236 Y169.223 E.00301
G1 X29.764 Y189.694 E.96034
G1 X29.764 Y188.96 E.02435
G1 X58.915 Y218.111 E1.36753
G1 X79.388 Y197.639 E.96038
G1 X78.743 Y197.639 E.0214
G1 X99.214 Y218.111 E.96034
G1 X119.687 Y197.639 E.96038
G1 X119.042 Y197.639 E.0214
G1 X126.2 Y204.797 E.33578
G3 X129.798 Y204.8 I1.797 J3.192 E.12477
G1 X136.958 Y197.639 E.3359
G1 X136.313 Y197.639 E.0214
G1 X156.786 Y218.111 E.96038
G1 X177.257 Y197.639 E.96034
G1 X176.612 Y197.639 E.0214
G1 X197.085 Y218.111 E.96038
G1 X226.236 Y188.96 E1.36753
G1 X226.236 Y189.694 E.02436
G1 X205.764 Y169.223 E.96034
G1 X205.764 Y169.132 E.00301
G1 X226.236 Y148.661 E.96034
G1 X226.236 Y149.395 E.02435
G1 X205.764 Y128.924 E.96034
G1 X205.764 Y128.833 E.00301
G1 X226.236 Y108.362 E.96034
G1 X226.236 Y109.096 E.02435
G1 X205.764 Y88.625 E.96034
G1 X205.764 Y88.534 E.00301
G1 X226.236 Y68.063 E.96034
G1 X226.236 Y68.797 E.02435
G1 X191.328 Y33.889 E1.63761
G1 X170.855 Y54.361 E.96038
G1 X171.5 Y54.361 E.0214
G1 X151.029 Y33.889 E.96034
G1 X130.556 Y54.361 E.96038
G1 X131.201 Y54.361 E.0214
G1 X110.73 Y33.889 E.96034
G1 X90.257 Y54.361 E.96038
G1 X90.902 Y54.361 E.0214
G1 X70.429 Y33.889 E.96038
G1 X29.764 Y74.554 E1.90768
G1 X29.764 Y73.82 E.02436
G1 X50.236 Y94.291 E.96034
G1 X50.236 Y94.382 E.00301
G1 X29.764 Y114.853 E.96034
G1 X29.764 Y114.119 E.02435
G1 X38.441 Y122.796 E.40705
G3 X39.393 Y122.495 I2.052 J4.841 E.03316
G1 X50.236 Y111.653 E.50864
G1 X50.236 Y111.562 E.00301
G1 X29.764 Y91.091 E.96034
G1 X29.764 Y91.825 E.02436
G1 X50.236 Y71.354 E.96034
G1 X50.236 Y71.263 E.00301
G1 X29.764 Y50.792 E.96034
G1 X29.764 Y51.527 E.02436
G1 X36.5 Y44.791 E.31599
G3 X36.564 Y43.179 I4.148 J-.643 E.05385
; WIPE_START
G1 X36.438 Y43.947 E-.29592
G1 X36.5 Y44.791 E-.32141
G1 X36.235 Y45.056 E-.14267
; WIPE_END
G1 E-.04 F1800
G1 X41.02 Y47.54 Z2 F30000
G1 Z1.6
G1 E.8 F1800
G1 F16200
G3 X39.41 Y47.638 I-1.056 J-4.072 E.05385
G1 X29.764 Y57.283 E.45248
G1 X29.764 Y56.549 E.02436
G1 X50.236 Y77.02 E.96034
G1 X50.236 Y77.111 E.00301
G1 X29.764 Y97.582 E.96034
G1 X29.764 Y96.848 E.02436
G1 X50.236 Y117.319 E.96034
G1 X50.236 Y117.41 E.00301
G1 X43.203 Y124.442 E.32989
G3 X43.203 Y127.558 I-3.341 J1.558 E.10672
G1 X50.236 Y134.59 E.32989
G1 X50.236 Y134.681 E.00301
G1 X29.764 Y155.152 E.96034
G1 X29.764 Y154.418 E.02435
G1 X50.236 Y174.889 E.96034
G1 X50.236 Y174.98 E.00301
G1 X29.764 Y195.451 E.96034
G1 X29.764 Y194.716 E.02435
G1 X39.41 Y204.362 E.45249
G3 X41.02 Y204.46 I.555 J4.169 E.05385
G1 X52.232 Y197.639 F30000
G1 F16200
G1 X50.604 Y197.639 E.05401
G1 X42.698 Y205.545 E.37088
G3 X43.513 Y208.465 I-2.854 J2.371 E.10361
G1 X53.16 Y218.111 E.45251
G1 X73.631 Y197.639 E.96034
G1 X72.986 Y197.639 E.0214
G1 X93.459 Y218.111 E.96038
G1 X113.93 Y197.639 E.96034
G1 X113.285 Y197.639 E.0214
G1 X124.607 Y208.962 E.53116
G2 X124.924 Y209.674 I3.527 J-1.139 E.02589
G1 X116.485 Y218.111 E.39582
G1 X96.014 Y197.639 E.96034
G1 X96.659 Y197.639 E.0214
G1 X76.186 Y218.111 E.96038
G1 X55.715 Y197.639 E.96034
G1 X56.36 Y197.639 E.0214
G1 X35.889 Y218.111 E.96034
G1 X29.764 Y211.987 E.28729
G1 X29.764 Y212.722 E.02435
G1 X50.236 Y192.251 E.96034
G1 X50.236 Y192.16 E.00301
G1 X29.764 Y171.689 E.96034
G1 X29.764 Y172.423 E.02435
G1 X50.236 Y151.952 E.96034
G1 X50.236 Y151.861 E.00301
G1 X29.764 Y131.39 E.96034
G1 X29.764 Y132.124 E.02435
G1 X36.487 Y125.402 E.31535
G2 X36.487 Y126.598 I3.636 J.598 E.03986
G1 X29.764 Y119.876 E.31535
G1 X29.764 Y120.61 E.02436
G1 X50.236 Y100.139 E.96034
G1 X50.236 Y100.048 E.00301
G1 X29.764 Y79.577 E.96034
G1 X29.764 Y80.311 E.02436
G1 X50.236 Y59.84 E.96034
G1 X50.236 Y59.749 E.00301
G1 X29.764 Y39.278 E.96034
G1 X29.764 Y40.013 E.02436
G1 X35.889 Y33.889 E.28729
G1 X56.361 Y54.361 E.96034
G1 X55.715 Y54.361 E.0214
G1 X76.186 Y33.889 E.96034
G1 X96.659 Y54.361 E.96038
G1 X96.014 Y54.361 E.0214
G1 X116.485 Y33.889 E.96034
G1 X124.924 Y42.326 E.39582
G2 X124.607 Y43.038 I3.206 J1.849 E.02589
G1 X113.285 Y54.361 E.53116
G1 X113.93 Y54.361 E.0214
G1 X93.459 Y33.889 E.96034
G1 X72.986 Y54.361 E.96038
G1 X73.631 Y54.361 E.0214
G1 X53.16 Y33.889 E.96034
G1 X43.513 Y43.535 E.45251
G3 X42.698 Y46.455 I-3.67 J.549 E.10361
G1 X50.604 Y54.361 E.37088
G1 X52.232 Y54.361 E.05401
; WIPE_START
G1 X50.604 Y54.361 E-.61876
G1 X50.341 Y54.098 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X44.626 Y49.039 Z2 F30000
G1 X29.764 Y35.884 Z2
G1 Z1.6
G1 E.8 F1800
G1 F16200
G1 X29.764 Y34.256 E.05401
G1 X30.132 Y33.889 E.01722
G1 X37.67 Y41.427 E.3536
G3 X40.667 Y40.624 I2.336 J2.723 E.10646
G1 X47.403 Y33.889 E.31595
G1 X67.874 Y54.361 E.96034
G1 X67.229 Y54.361 E.0214
G1 X87.7 Y33.889 E.96034
G1 X108.173 Y54.361 E.96038
G1 X107.528 Y54.361 E.0214
G1 X127.999 Y33.889 E.96034
G1 X148.472 Y54.361 E.96038
G1 X147.827 Y54.361 E.0214
G1 X168.298 Y33.889 E.96034
G1 X188.771 Y54.361 E.96038
G1 X188.126 Y54.361 E.0214
G1 X208.597 Y33.889 E.96034
G1 X215.337 Y40.628 E.31618
G3 X218.328 Y41.429 I.67 J3.485 E.10628
G1 X225.868 Y33.889 E.35368
G1 X226.236 Y34.256 E.01722
G1 X226.236 Y35.884 E.05401
; WIPE_START
G1 X226.236 Y34.256 E-.61876
G1 X225.972 Y33.993 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X220.347 Y39.153 Z2 F30000
G1 X203.768 Y54.361 Z2
G1 Z1.6
G1 E.8 F1800
G1 F16200
G1 X205.396 Y54.361 E.05401
G1 X213.304 Y46.453 E.37094
G3 X212.485 Y43.533 I2.849 J-2.373 E.10363
G1 X202.84 Y33.889 E.45246
G1 X182.369 Y54.361 E.96034
G1 X183.014 Y54.361 E.0214
G1 X162.541 Y33.889 E.96038
G1 X142.07 Y54.361 E.96034
G1 X142.715 Y54.361 E.0214
G1 X131.397 Y43.042 E.53096
G2 X131.076 Y42.327 I-3.653 J1.209 E.02606
G1 X139.515 Y33.889 E.39585
G1 X159.986 Y54.361 E.96034
G1 X159.341 Y54.361 E.0214
G1 X179.814 Y33.889 E.96038
G1 X200.285 Y54.361 E.96034
G1 X199.64 Y54.361 E.0214
G1 X220.111 Y33.889 E.96034
G1 X226.236 Y40.013 E.28729
G1 X226.236 Y39.278 E.02435
G1 X205.764 Y59.749 E.96034
G1 X205.764 Y59.84 E.00301
G1 X226.236 Y80.311 E.96034
G1 X226.236 Y79.577 E.02435
G1 X205.764 Y100.048 E.96034
G1 X205.764 Y100.139 E.00301
G1 X226.236 Y120.61 E.96034
G1 X226.236 Y119.876 E.02435
G1 X219.512 Y126.599 E.31541
G2 X219.512 Y125.401 I-4.86 J-.599 E.03986
G1 X226.236 Y132.124 E.31541
G1 X226.236 Y131.39 E.02436
G1 X205.764 Y151.861 E.96034
G1 X205.764 Y151.952 E.00301
G1 X226.236 Y172.423 E.96034
G1 X226.236 Y171.689 E.02436
G1 X205.764 Y192.16 E.96034
M73 P51 R32
G1 X205.764 Y192.251 E.00301
G1 X226.236 Y212.722 E.96034
G1 X226.236 Y211.987 E.02436
G1 X220.111 Y218.111 E.28729
G1 X199.639 Y197.639 E.96034
G1 X200.285 Y197.639 E.0214
G1 X179.814 Y218.111 E.96034
G1 X159.341 Y197.639 E.96038
G1 X159.986 Y197.639 E.0214
G1 X139.515 Y218.111 E.96034
G1 X131.076 Y209.673 E.39585
G2 X131.397 Y208.958 I-3.33 J-1.923 E.02606
G1 X142.715 Y197.639 E.53096
G1 X142.07 Y197.639 E.0214
G1 X162.541 Y218.111 E.96034
G1 X183.014 Y197.639 E.96038
G1 X182.369 Y197.639 E.0214
G1 X202.84 Y218.111 E.96034
G1 X212.485 Y208.467 E.45246
G3 X213.304 Y205.547 I3.667 J-.547 E.10363
G1 X205.396 Y197.639 E.37094
G1 X203.768 Y197.639 E.05401
; WIPE_START
G1 X205.396 Y197.639 E-.61876
G1 X205.659 Y197.902 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X198.119 Y199.082 Z2 F30000
G1 X125.531 Y210.443 Z2
G1 Z1.6
G1 E.8 F1800
G1 F16200
G2 X126.916 Y211.271 I2.813 J-3.135 E.05385
G1 X133.758 Y218.111 E.32092
G1 X154.229 Y197.639 E.96034
G1 X153.584 Y197.639 E.0214
G1 X174.055 Y218.111 E.96034
G1 X194.528 Y197.639 E.96038
G1 X193.883 Y197.639 E.0214
G1 X214.354 Y218.111 E.96034
G1 X226.236 Y206.23 E.55736
G1 X226.236 Y206.965 E.02436
G1 X205.764 Y186.494 E.96034
G1 X205.764 Y186.403 E.00301
G1 X226.236 Y165.932 E.96034
G1 X226.236 Y166.666 E.02435
G1 X205.764 Y146.195 E.96034
G1 X205.764 Y146.104 E.00301
G1 X226.236 Y125.633 E.96034
G1 X226.236 Y126.367 E.02435
G1 X205.764 Y105.896 E.96034
G1 X205.764 Y105.805 E.00301
G1 X226.236 Y85.334 E.96034
G1 X226.236 Y86.068 E.02435
G1 X205.764 Y65.597 E.96034
G1 X205.764 Y65.506 E.00301
G1 X226.236 Y45.035 E.96034
G1 X226.236 Y45.77 E.02435
G1 X214.354 Y33.889 E.55736
G1 X193.883 Y54.361 E.96034
G1 X194.528 Y54.361 E.0214
G1 X174.055 Y33.889 E.96038
G1 X153.584 Y54.361 E.96034
G1 X154.229 Y54.361 E.0214
G1 X133.758 Y33.889 E.96034
G1 X126.916 Y40.729 E.32092
G3 X129.087 Y40.732 I1.08 J4.065 E.07283
G1 X122.242 Y33.889 E.32105
G1 X101.771 Y54.361 E.96034
G1 X102.416 Y54.361 E.0214
G1 X81.945 Y33.889 E.96034
G1 X61.472 Y54.361 E.96038
G1 X62.117 Y54.361 E.0214
G1 X41.646 Y33.889 E.96034
G1 X29.764 Y45.77 E.55736
G1 X29.764 Y45.035 E.02436
G1 X50.236 Y65.506 E.96034
G1 X50.236 Y65.597 E.00301
G1 X29.764 Y86.068 E.96034
G1 X29.764 Y85.334 E.02435
G1 X50.236 Y105.805 E.96034
G1 X50.236 Y105.896 E.00301
G1 X29.764 Y126.367 E.96034
G1 X29.764 Y125.633 E.02435
G1 X50.236 Y146.104 E.96034
G1 X50.236 Y146.195 E.00301
G1 X29.764 Y166.666 E.96034
G1 X29.764 Y165.932 E.02435
G1 X50.236 Y186.403 E.96034
G1 X50.236 Y186.494 E.00301
G1 X29.764 Y206.965 E.96034
G1 X29.764 Y206.23 E.02435
G1 X41.646 Y218.111 E.55736
G1 X62.117 Y197.639 E.96034
G1 X61.472 Y197.639 E.0214
G1 X81.945 Y218.111 E.96038
G1 X102.416 Y197.639 E.96034
G1 X101.771 Y197.639 E.0214
G1 X122.242 Y218.111 E.96034
G1 X129.087 Y211.268 E.32105
G2 X130.474 Y210.443 I-1.117 J-3.457 E.05398
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F16200
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
G1 X126.563 Y205
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F16213.044
G1 X126.679 Y204.948 E.00421
G3 X127.772 Y204.669 I1.33 J2.927 E.03759
G3 X129.176 Y204.879 I.226 J3.281 E.04747
G3 X126.395 Y205.095 I-1.167 J2.996 E.57441
G1 X126.511 Y205.029 E.00442
G1 X127.049 Y205.233 F30000
G1 F16213.044
G1 X127.107 Y205.217 E.00198
G3 X127.802 Y205.075 I.903 J2.659 E.0236
G3 X128.761 Y205.17 I.216 J2.722 E.03214
G3 X126.847 Y205.32 I-.751 J2.706 E.52039
G1 X126.994 Y205.256 E.00531
G1 X127.541 Y205.522 F30000
G1 F16213.044
G1 X127.833 Y205.481 E.00978
G3 X128.651 Y205.562 I.077 J3.396 E.02734
G3 X127.466 Y205.537 I-.642 J2.314 E.46079
G1 X127.482 Y205.534 E.00052
G1 X127.857 Y205.873 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X127.862 Y205.872 E.00015
G3 X128.349 Y205.895 I.141 J2.154 E.01502
G3 X127.554 Y205.919 I-.339 J1.98 E.36316
G1 X127.798 Y205.882 E.00759
; WIPE_START
M204 S10000
G1 X127.862 Y205.872 E-.02461
G1 X128.15 Y205.87 E-.10956
G1 X128.349 Y205.895 E-.07618
G1 X128.544 Y205.94 E-.07616
G1 X128.917 Y206.086 E-.15209
G1 X129.253 Y206.303 E-.15216
G1 X129.54 Y206.583 E-.15211
G1 X129.565 Y206.62 E-.01713
; WIPE_END
G1 E-.04 F1800
G1 X121.935 Y206.453 Z2.2 F30000
G1 X40.15 Y204.667 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X40.24 Y204.67 E.00301
G3 X41.176 Y204.879 I-.242 J3.279 E.03192
G3 X39.772 Y204.669 I-1.167 J2.996 E.62262
G1 X40.09 Y204.667 E.01055
G1 X40.15 Y205.073 F30000
G1 F16213.044
G1 X40.21 Y205.073 E.00199
G3 X40.761 Y205.17 I-.192 J2.724 E.0186
G3 X39.802 Y205.075 I-.751 J2.706 E.55327
G1 X40.09 Y205.073 E.00955
G1 X40.214 Y205.485 F30000
G1 F16213.044
G1 X40.651 Y205.562 E.01471
G3 X39.833 Y205.481 I-.642 J2.314 E.47309
G3 X40.155 Y205.489 I.077 J3.396 E.01069
G1 X40.016 Y205.871 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X40.15 Y205.872 E.00413
G3 X40.349 Y205.895 I-.147 J2.154 E.00616
G3 X39.862 Y205.872 I-.339 J1.98 E.37275
G1 X39.956 Y205.871 E.00288
; WIPE_START
M204 S10000
G1 X40.15 Y205.872 E-.07391
G1 X40.349 Y205.895 E-.07614
G1 X40.544 Y205.94 E-.07616
G1 X40.917 Y206.086 E-.15208
G1 X41.253 Y206.303 E-.15216
G1 X41.54 Y206.583 E-.15211
G1 X41.655 Y206.751 E-.07743
; WIPE_END
G1 E-.04 F1800
G1 X41.373 Y199.124 Z2.2 F30000
G1 X38.563 Y123.125 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X38.679 Y123.073 E.00421
G3 X39.772 Y122.794 I1.33 J2.927 E.03759
G3 X41.176 Y123.004 I.226 J3.281 E.04747
G3 X38.395 Y123.22 I-1.167 J2.996 E.57441
G1 X38.511 Y123.154 E.00442
G1 X39.049 Y123.358 F30000
G1 F16213.044
G1 X39.107 Y123.342 E.00198
G3 X39.802 Y123.2 I.903 J2.659 E.0236
G3 X40.761 Y123.295 I.216 J2.722 E.03213
G3 X38.847 Y123.445 I-.751 J2.706 E.52039
G1 X38.994 Y123.381 E.00531
G1 X39.541 Y123.647 F30000
G1 F16213.044
G1 X39.833 Y123.606 E.00978
G3 X40.651 Y123.687 I.077 J3.398 E.02734
G3 X39.466 Y123.662 I-.642 J2.314 E.46079
G1 X39.482 Y123.659 E.00052
G1 X39.863 Y123.997 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X40.15 Y123.997 E.00883
G3 X40.349 Y124.02 I-.147 J2.153 E.00616
G3 X39.803 Y124.002 I-.339 J1.98 E.37094
; WIPE_START
M204 S10000
G1 X40.15 Y123.997 E-.13185
G1 X40.349 Y124.02 E-.07615
G1 X40.734 Y124.129 E-.15213
G1 X40.917 Y124.211 E-.07612
G1 X41.253 Y124.428 E-.15208
G1 X41.54 Y124.708 E-.15216
G1 X41.569 Y124.75 E-.01951
; WIPE_END
G1 E-.04 F1800
G1 X48.548 Y127.84 Z2.2 F30000
G1 X205.416 Y197.291 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X50.584 Y197.291 E5.13608
G1 X50.584 Y54.709 E4.72972
G1 X205.416 Y54.709 E5.13608
G1 X205.416 Y197.231 E4.72773
G1 X205.009 Y196.884 F30000
G1 F16213.044
G1 X50.991 Y196.884 E5.10907
G1 X50.991 Y55.116 E4.70271
G1 X205.009 Y55.116 E5.10907
G1 X205.009 Y196.824 E4.70072
G1 X204.602 Y196.477 F30000
G1 F16213.044
G1 X51.398 Y196.477 E5.08206
G1 X51.398 Y55.523 E4.67571
G1 X204.602 Y55.523 E5.08206
G1 X204.602 Y196.417 E4.67372
G1 X204.21 Y196.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X51.79 Y196.085 E4.68344
G1 X51.79 Y55.915 E4.30703
G1 X204.21 Y55.915 E4.68344
G1 X204.21 Y196.025 E4.30519
; WIPE_START
M204 S10000
G1 X202.21 Y196.026 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X196.708 Y190.736 Z2.2 F30000
G1 X41.019 Y41.077 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X41.176 Y41.129 E.00547
G3 X39.772 Y40.919 I-1.167 J2.996 E.62263
G3 X40.871 Y41.029 I.226 J3.281 E.03683
G1 X40.962 Y41.059 E.00318
G1 X40.573 Y41.377 F30000
G1 F16213.044
G1 X40.761 Y41.42 E.00641
G3 X39.802 Y41.325 I-.751 J2.706 E.55327
G3 X40.488 Y41.357 I.216 J2.722 E.02284
G1 X40.514 Y41.363 E.00089
G1 X40.131 Y41.729 F30000
G1 F16213.044
G1 X40.179 Y41.741 E.00163
G3 X40.651 Y41.812 I-.269 J3.387 E.01585
G3 X39.833 Y41.731 I-.642 J2.314 E.47309
G1 X40.071 Y41.73 E.00791
G1 X39.863 Y42.122 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X40.15 Y42.122 E.00883
G3 X40.349 Y42.145 I-.147 J2.153 E.00616
G3 X39.803 Y42.127 I-.339 J1.98 E.37094
; WIPE_START
M204 S10000
G1 X40.15 Y42.122 E-.13187
G1 X40.349 Y42.145 E-.07616
G1 X40.734 Y42.254 E-.15212
G1 X41.091 Y42.436 E-.15212
G1 X41.404 Y42.686 E-.1521
G1 X41.565 Y42.879 E-.09565
; WIPE_END
G1 E-.04 F1800
G1 X49.196 Y42.732 Z2.2 F30000
G1 X126.563 Y41.25 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X126.679 Y41.198 E.00421
G3 X127.772 Y40.919 I1.33 J2.927 E.03759
G3 X129.176 Y41.13 I.226 J3.281 E.04747
M73 P51 R31
G3 X126.395 Y41.345 I-1.167 J2.996 E.5744
G1 X126.511 Y41.279 E.00443
G1 X127.049 Y41.483 F30000
G1 F16213.044
G1 X127.107 Y41.467 E.00198
G3 X127.802 Y41.325 I.903 J2.659 E.0236
G3 X128.761 Y41.42 I.216 J2.723 E.03214
G3 X126.847 Y41.57 I-.751 J2.706 E.52039
G1 X126.994 Y41.506 E.00532
G1 X127.541 Y41.772 F30000
G1 F16213.044
G1 X127.833 Y41.731 E.00978
G3 X128.651 Y41.812 I.077 J3.397 E.02734
G3 X127.466 Y41.787 I-.642 J2.314 E.46079
G1 X127.482 Y41.784 E.00052
G1 X127.863 Y42.122 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X128.15 Y42.122 E.00882
G3 X128.349 Y42.145 I-.147 J2.153 E.00616
G3 X127.803 Y42.127 I-.339 J1.98 E.37094
; WIPE_START
M204 S10000
G1 X128.15 Y42.122 E-.13181
G1 X128.349 Y42.145 E-.07616
G1 X128.734 Y42.254 E-.15212
G1 X129.091 Y42.436 E-.15212
G1 X129.404 Y42.686 E-.1521
G1 X129.565 Y42.879 E-.0957
; WIPE_END
G1 E-.04 F1800
G1 X137.196 Y42.722 Z2.2 F30000
G1 X217.02 Y41.077 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X217.176 Y41.129 E.00546
G3 X215.772 Y40.919 I-1.167 J2.996 E.62262
G3 X216.871 Y41.029 I.226 J3.281 E.03682
G1 X216.962 Y41.059 E.00319
G1 X216.573 Y41.377 F30000
G1 F16213.044
G1 X216.761 Y41.42 E.0064
G3 X215.802 Y41.325 I-.751 J2.706 E.55327
G3 X216.488 Y41.357 I.216 J2.722 E.02284
G1 X216.514 Y41.363 E.0009
G1 X216.131 Y41.729 F30000
G1 F16213.044
G1 X216.179 Y41.741 E.00162
G3 X216.651 Y41.812 I-.269 J3.388 E.01585
G3 X215.833 Y41.731 I-.642 J2.314 E.47309
G1 X216.071 Y41.73 E.00792
G1 X215.863 Y42.122 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X216.15 Y42.122 E.00882
G3 X216.349 Y42.145 I-.147 J2.153 E.00616
G3 X215.803 Y42.127 I-.339 J1.98 E.37094
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
G1 X217.517 Y50.508 Z2.2 F30000
G1 X217.019 Y122.952 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X217.176 Y123.004 E.00547
G3 X215.772 Y122.794 I-1.167 J2.996 E.62262
G3 X216.871 Y122.904 I.226 J3.281 E.03682
G1 X216.962 Y122.934 E.00318
G1 X216.573 Y123.252 F30000
G1 F16213.044
G1 X216.761 Y123.295 E.00641
G3 X215.802 Y123.2 I-.751 J2.706 E.55327
G3 X216.488 Y123.232 I.216 J2.722 E.02284
G1 X216.514 Y123.238 E.00089
G1 X216.131 Y123.604 F30000
G1 F16213.044
G1 X216.179 Y123.616 E.00163
G3 X216.651 Y123.687 I-.269 J3.388 E.01585
G3 X215.833 Y123.606 I-.642 J2.314 E.47309
G1 X216.071 Y123.605 E.00791
G1 X215.863 Y123.997 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X216.15 Y123.997 E.00883
G3 X216.349 Y124.02 I-.147 J2.153 E.00616
G3 X215.803 Y124.002 I-.339 J1.98 E.37094
; WIPE_START
M204 S10000
G1 X216.15 Y123.997 E-.13188
G1 X216.349 Y124.02 E-.07614
G1 X216.734 Y124.129 E-.15212
G1 X217.091 Y124.311 E-.15215
G1 X217.404 Y124.561 E-.1521
G1 X217.565 Y124.754 E-.09562
; WIPE_END
G1 E-.04 F1800
G1 X217.43 Y132.385 Z2.2 F30000
G1 X216.15 Y204.667 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X216.24 Y204.67 E.00301
G3 X217.176 Y204.88 I-.242 J3.28 E.03192
G3 X215.772 Y204.669 I-1.167 J2.996 E.62262
G1 X216.09 Y204.667 E.01054
G1 X216.15 Y205.073 F30000
G1 F16213.044
G1 X216.21 Y205.073 E.00199
G3 X216.761 Y205.17 I-.192 J2.724 E.0186
G3 X215.802 Y205.075 I-.751 J2.706 E.55327
G1 X216.09 Y205.073 E.00955
G1 X216.214 Y205.485 F30000
G1 F16213.044
G1 X216.651 Y205.562 E.01471
G3 X215.833 Y205.481 I-.642 J2.314 E.47309
G3 X216.155 Y205.489 I.077 J3.396 E.01069
G1 X216.016 Y205.871 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X216.15 Y205.872 E.00413
G3 X216.349 Y205.895 I-.147 J2.154 E.00616
G3 X215.862 Y205.872 I-.339 J1.98 E.37275
G1 X215.956 Y205.871 E.00288
; WIPE_START
M204 S10000
G1 X216.15 Y205.872 E-.07391
G1 X216.349 Y205.895 E-.07614
G1 X216.544 Y205.94 E-.07615
G1 X216.917 Y206.086 E-.15209
G1 X217.253 Y206.303 E-.15216
G1 X217.54 Y206.583 E-.15211
G1 X217.655 Y206.751 E-.07744
; WIPE_END
G1 E-.04 F1800
G1 X222.283 Y212.82 Z2.2 F30000
G1 X226.584 Y218.459 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X29.416 Y218.459 E6.54041
G1 X29.416 Y33.541 E6.13406
G1 X226.584 Y33.541 E6.54041
G1 X226.584 Y218.399 E6.13207
G1 X226.991 Y218.866 F30000
G1 F16213.044
G1 X29.009 Y218.866 E6.56742
G1 X29.009 Y33.134 E6.16106
G1 X226.991 Y33.134 E6.56742
G1 X226.991 Y218.806 E6.15907
G1 X227.398 Y219.273 F30000
G1 F16213.044
G1 X28.602 Y219.273 E6.59442
G1 X28.602 Y32.727 E6.18807
G1 X227.398 Y32.727 E6.59442
G1 X227.398 Y219.213 E6.18608
G1 X227.79 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X28.21 Y219.665 E6.13254
G1 X28.21 Y32.335 E5.75613
G1 X227.79 Y32.335 E6.13254
G1 X227.79 Y219.605 E5.75429
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
G1 F16200
G2 X219.502 Y207.207 I-3.499 J-.952 E.05398
G1 X226.236 Y200.473 E.31589
G1 X226.236 Y201.208 E.02436
G1 X205.764 Y180.737 E.96034
G1 X205.764 Y180.646 E.00301
G1 X226.236 Y160.175 E.96034
G1 X226.236 Y160.909 E.02436
G1 X205.764 Y140.438 E.96034
G1 X205.764 Y140.347 E.00301
G1 X216.596 Y129.515 E.50813
G2 X217.559 Y129.205 I-1.581 J-6.546 E.0336
G1 X226.236 Y137.881 E.40703
G1 X226.236 Y137.147 E.02435
G1 X205.764 Y157.618 E.96034
G1 X205.764 Y157.709 E.00301
G1 X226.236 Y178.18 E.96034
G1 X226.236 Y177.446 E.02436
G1 X185.571 Y218.111 E1.90768
G1 X165.098 Y197.639 E.96038
G1 X165.743 Y197.639 E.0214
G1 X145.272 Y218.111 E.96034
G1 X124.799 Y197.639 E.96038
G1 X125.444 Y197.639 E.0214
G1 X104.973 Y218.111 E.96034
G1 X84.5 Y197.639 E.96038
G1 X85.145 Y197.639 E.0214
G1 X64.672 Y218.111 E.96038
G1 X29.764 Y183.203 E1.63761
G1 X29.764 Y183.937 E.02435
G1 X50.236 Y163.466 E.96034
G1 X50.236 Y163.375 E.00301
G1 X29.764 Y142.904 E.96034
G1 X29.764 Y143.638 E.02435
G1 X50.236 Y123.167 E.96034
G1 X50.236 Y123.076 E.00301
G1 X29.764 Y102.605 E.96034
G1 X29.764 Y103.339 E.02435
G1 X50.236 Y82.868 E.96034
G1 X50.236 Y82.777 E.00301
G1 X29.764 Y62.306 E.96034
G1 X29.764 Y63.04 E.02436
G1 X58.915 Y33.889 E1.36753
M73 P52 R31
G1 X79.388 Y54.361 E.96038
G1 X78.743 Y54.361 E.0214
G1 X99.214 Y33.889 E.96034
G1 X119.687 Y54.361 E.96038
G1 X119.042 Y54.361 E.0214
G1 X126.2 Y47.203 E.33578
G2 X129.798 Y47.2 I1.797 J-3.192 E.12477
G1 X136.958 Y54.361 E.3359
G1 X136.313 Y54.361 E.0214
G1 X156.786 Y33.889 E.96038
G1 X177.257 Y54.361 E.96034
G1 X176.612 Y54.361 E.0214
G1 X197.085 Y33.889 E.96038
G1 X226.236 Y63.04 E1.36753
G1 X226.236 Y62.306 E.02435
G1 X205.764 Y82.777 E.96034
G1 X205.764 Y82.868 E.00301
G1 X226.236 Y103.339 E.96034
G1 X226.236 Y102.605 E.02435
G1 X205.764 Y123.076 E.96034
G1 X205.764 Y123.167 E.00301
G1 X226.236 Y143.638 E.96034
G1 X226.236 Y142.904 E.02435
G1 X205.764 Y163.375 E.96034
G1 X205.764 Y163.466 E.00301
G1 X226.236 Y183.937 E.96034
G1 X226.236 Y183.203 E.02435
G1 X191.328 Y218.111 E1.63761
G1 X170.855 Y197.639 E.96038
G1 X171.5 Y197.639 E.0214
G1 X151.029 Y218.111 E.96034
G1 X130.556 Y197.639 E.96038
G1 X131.201 Y197.639 E.0214
G1 X110.73 Y218.111 E.96034
G1 X90.257 Y197.639 E.96038
G1 X90.902 Y197.639 E.0214
G1 X70.429 Y218.111 E.96038
G1 X29.764 Y177.446 E1.90768
G1 X29.764 Y178.18 E.02435
G1 X50.236 Y157.709 E.96034
G1 X50.236 Y157.618 E.00301
G1 X29.764 Y137.147 E.96034
G1 X29.764 Y137.881 E.02435
G1 X38.441 Y129.204 E.40705
G2 X39.4 Y129.511 I2.244 J-5.351 E.03343
G1 X50.236 Y140.347 E.50832
G1 X50.236 Y140.438 E.00301
G1 X29.764 Y160.909 E.96034
G1 X29.764 Y160.175 E.02435
G1 X50.236 Y180.646 E.96034
G1 X50.236 Y180.737 E.00301
G1 X29.764 Y201.208 E.96034
G1 X29.764 Y200.473 E.02435
G1 X36.5 Y207.209 E.31599
G2 X36.564 Y208.821 I4.149 J.643 E.05385
; WIPE_START
G1 X36.438 Y208.053 E-.29592
G1 X36.5 Y207.209 E-.32142
G1 X36.235 Y206.944 E-.14267
; WIPE_END
G1 E-.04 F1800
G1 X41.026 Y204.462 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
G1 F16200
G2 X39.415 Y204.368 I-1.005 J3.367 E.05398
G1 X29.764 Y194.716 E.45275
G1 X29.764 Y195.451 E.02435
G1 X50.236 Y174.98 E.96034
G1 X50.236 Y174.889 E.00301
G1 X29.764 Y154.418 E.96034
G1 X29.764 Y155.152 E.02435
G1 X50.236 Y134.681 E.96034
G1 X50.236 Y134.59 E.00301
G1 X43.203 Y127.558 E.32989
G2 X43.203 Y124.442 I-3.341 J-1.558 E.10672
G1 X50.236 Y117.41 E.32989
G1 X50.236 Y117.319 E.00301
G1 X29.764 Y96.848 E.96034
G1 X29.764 Y97.582 E.02436
G1 X50.236 Y77.111 E.96034
G1 X50.236 Y77.02 E.00301
G1 X29.764 Y56.549 E.96034
G1 X29.764 Y57.283 E.02436
G1 X39.41 Y47.638 E.45248
G2 X41.02 Y47.54 I.554 J-4.171 E.05385
; WIPE_START
G1 X40.267 Y47.682 E-.29138
G1 X39.41 Y47.638 E-.32596
G1 X39.144 Y47.904 E-.14266
; WIPE_END
G1 E-.04 F1800
G1 X36.564 Y43.179 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
G1 F16200
G2 X36.5 Y44.791 I4.085 J.969 E.05385
G1 X29.764 Y51.527 E.31599
G1 X29.764 Y50.792 E.02436
G1 X50.236 Y71.263 E.96034
G1 X50.236 Y71.354 E.00301
G1 X29.764 Y91.825 E.96034
G1 X29.764 Y91.091 E.02436
G1 X50.236 Y111.562 E.96034
G1 X50.236 Y111.653 E.00301
G1 X39.393 Y122.496 E.50865
G2 X38.441 Y122.796 I1.092 J5.119 E.03314
G1 X29.764 Y114.119 E.40706
G1 X29.764 Y114.853 E.02435
G1 X50.236 Y94.382 E.96034
G1 X50.236 Y94.291 E.00301
G1 X29.764 Y73.82 E.96034
G1 X29.764 Y74.554 E.02436
G1 X70.429 Y33.889 E1.90768
G1 X79.133 Y42.591 E.40827
G1 X86.967 Y45.202 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.4112
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X90.237 Y41.933 E.25018
G1 X90.081 Y41.778 E.01187
G1 X92.96 Y38.899 E.22026
G1 X92.789 Y38.728 E.01309
G1 X86.784 Y44.733 E.45948
G1 X86.458 Y44.407 E.02495
G1 X92.463 Y38.402 E.45948
G1 X92.137 Y38.076 E.02495
G1 X86.132 Y44.081 E.45948
G1 X85.806 Y43.755 E.02495
G1 X91.811 Y37.75 E.45948
G1 X91.484 Y37.424 E.02495
G1 X85.48 Y43.429 E.45948
G1 X85.154 Y43.103 E.02495
G1 X91.158 Y37.098 E.45948
G1 X90.832 Y36.772 E.02495
G1 X81.949 Y45.655 E.67974
G1 X81.623 Y45.329 E.02495
G1 X90.506 Y36.446 E.67974
G1 X90.18 Y36.119 E.02495
G1 X81.297 Y45.003 E.67974
G1 X80.971 Y44.677 E.02495
G1 X89.854 Y35.793 E.67974
G1 X89.528 Y35.467 E.02495
G1 X80.645 Y44.35 E.67974
G1 X80.318 Y44.024 E.02495
G1 X89.202 Y35.141 E.67974
G1 X88.875 Y34.815 E.02495
G1 X79.992 Y43.698 E.67974
G1 X79.666 Y43.372 E.02495
G1 X88.549 Y34.489 E.67974
G1 X88.514 Y34.453 E.00273
G1 X85.635 Y37.332 E.22026
G1 X85.345 Y37.041 E.02222
G1 X79.34 Y43.046 E.45948
G1 X79.312 Y43.018 E.00213
G1 X82.191 Y40.14 E.22026
G1 X81.892 Y39.841 E.02283
G1 X85.019 Y36.715 E.23922
G1 X84.693 Y36.389 E.02495
G1 X81.566 Y39.515 E.23922
G1 X81.24 Y39.189 E.02495
G1 X84.51 Y35.92 E.25017
G1 X88.409 Y33.904 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F3000;_EXTRUDE_SET_SPEED
G1 X85.565 Y33.904 E.07878
; Slow Down End
G1 X90.42 Y42.364 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X102.416 Y54.361 E.56278
G1 X101.771 Y54.361 E.0214
G1 X122.242 Y33.889 E.96034
G1 X129.087 Y40.732 E.32105
G2 X126.916 Y40.729 I-1.09 J4.04 E.07284
G1 X133.758 Y33.889 E.32092
G1 X154.229 Y54.361 E.96034
G1 X153.584 Y54.361 E.0214
G1 X174.055 Y33.889 E.96034
G1 X194.528 Y54.361 E.96038
G1 X193.883 Y54.361 E.0214
G1 X214.354 Y33.889 E.96034
G1 X226.236 Y45.77 E.55736
G1 X226.236 Y45.035 E.02435
G1 X205.764 Y65.506 E.96034
G1 X205.764 Y65.597 E.00301
G1 X226.236 Y86.068 E.96034
G1 X226.236 Y85.334 E.02435
G1 X205.764 Y105.805 E.96034
G1 X205.764 Y105.896 E.00301
G1 X226.236 Y126.367 E.96034
G1 X226.236 Y125.633 E.02435
G1 X205.764 Y146.104 E.96034
G1 X205.764 Y146.195 E.00301
G1 X226.236 Y166.666 E.96034
G1 X226.236 Y165.932 E.02435
G1 X205.764 Y186.403 E.96034
G1 X205.764 Y186.494 E.00301
G1 X226.236 Y206.965 E.96034
G1 X226.236 Y206.23 E.02436
G1 X214.354 Y218.111 E.55736
G1 X193.883 Y197.639 E.96034
G1 X194.528 Y197.639 E.0214
G1 X174.055 Y218.111 E.96038
G1 X153.584 Y197.639 E.96034
G1 X154.229 Y197.639 E.0214
G1 X133.758 Y218.111 E.96034
G1 X126.916 Y211.271 E.32092
G2 X129.087 Y211.268 I1.081 J-3.421 E.07315
G1 X122.242 Y218.111 E.32105
G1 X101.771 Y197.639 E.96034
G1 X102.416 Y197.639 E.0214
G1 X81.945 Y218.111 E.96034
G1 X61.472 Y197.639 E.96038
G1 X62.117 Y197.639 E.0214
G1 X41.646 Y218.111 E.96034
G1 X29.764 Y206.23 E.55736
G1 X29.764 Y206.965 E.02435
G1 X50.236 Y186.494 E.96034
G1 X50.236 Y186.403 E.00301
G1 X29.764 Y165.932 E.96034
G1 X29.764 Y166.666 E.02435
G1 X50.236 Y146.195 E.96034
G1 X50.236 Y146.104 E.00301
G1 X29.764 Y125.633 E.96034
G1 X29.764 Y126.367 E.02435
G1 X50.236 Y105.896 E.96034
G1 X50.236 Y105.805 E.00301
G1 X29.764 Y85.334 E.96034
G1 X29.764 Y86.068 E.02435
G1 X50.236 Y65.597 E.96034
G1 X50.236 Y65.506 E.00301
G1 X29.764 Y45.035 E.96034
G1 X29.764 Y45.77 E.02436
G1 X41.646 Y33.889 E.55736
G1 X62.117 Y54.361 E.96034
G1 X61.472 Y54.361 E.0214
G1 X81.943 Y33.889 E.96034
G1 X83.935 Y35.88 E.09341
G1 X84.362 Y35.453 E.02003
G1 X85.25 Y36.34 E.04162
G1 X87.323 Y34.267 E.09727
G1 X88.079 Y34.267 E.02508
G1 X86.935 Y35.425 E.05402
G1 X52.232 Y54.361 F30000
G1 F16200
G1 X50.604 Y54.361 E.05401
G1 X42.698 Y46.455 E.37088
G2 X43.513 Y43.535 I-2.855 J-2.371 E.10361
G1 X53.16 Y33.889 E.45251
G1 X73.631 Y54.361 E.96034
G1 X72.986 Y54.361 E.0214
G1 X81.517 Y45.829 E.40021
G1 X82.176 Y46.488 E.03091
G1 X82.603 Y46.061 E.02003
G1 X90.902 Y54.361 E.38933
G1 X90.257 Y54.361 E.0214
G1 X110.73 Y33.889 E.96038
G1 X131.201 Y54.361 E.96034
G1 X130.556 Y54.361 E.0214
G1 X151.029 Y33.889 E.96038
G1 X171.5 Y54.361 E.96034
G1 X170.855 Y54.361 E.0214
G1 X191.328 Y33.889 E.96038
G1 X226.236 Y68.797 E1.63761
G1 X226.236 Y68.063 E.02435
G1 X205.764 Y88.534 E.96034
G1 X205.764 Y88.625 E.00301
G1 X226.236 Y109.096 E.96034
G1 X226.236 Y108.362 E.02435
G1 X205.764 Y128.833 E.96034
G1 X205.764 Y128.924 E.00301
G1 X226.236 Y149.395 E.96034
G1 X226.236 Y148.661 E.02435
G1 X205.764 Y169.132 E.96034
G1 X205.764 Y169.223 E.00301
G1 X226.236 Y189.694 E.96034
G1 X226.236 Y188.96 E.02436
G1 X197.085 Y218.111 E1.36753
G1 X176.612 Y197.639 E.96038
G1 X177.257 Y197.639 E.0214
G1 X156.786 Y218.111 E.96034
G1 X136.313 Y197.639 E.96038
G1 X136.958 Y197.639 E.0214
G1 X129.798 Y204.8 E.3359
G2 X126.2 Y204.797 I-1.801 J3.137 E.12492
G1 X119.042 Y197.639 E.33578
G1 X119.687 Y197.639 E.0214
G1 X99.214 Y218.111 E.96038
G1 X78.743 Y197.639 E.96034
G1 X79.388 Y197.639 E.0214
G1 X58.915 Y218.111 E.96038
G1 X29.764 Y188.96 E1.36753
G1 X29.764 Y189.694 E.02435
G1 X50.236 Y169.223 E.96034
G1 X50.236 Y169.132 E.00301
G1 X29.764 Y148.661 E.96034
G1 X29.764 Y149.395 E.02435
G1 X50.236 Y128.924 E.96034
G1 X50.236 Y128.833 E.00301
G1 X29.764 Y108.362 E.96034
G1 X29.764 Y109.096 E.02435
G1 X50.236 Y88.625 E.96034
G1 X50.236 Y88.534 E.00301
G1 X29.764 Y68.063 E.96034
G1 X29.764 Y68.797 E.02435
G1 X64.672 Y33.889 E1.63761
G1 X85.145 Y54.361 E.96038
G1 X84.5 Y54.361 E.0214
G1 X104.971 Y33.889 E.96034
G1 X125.444 Y54.361 E.96038
G1 X124.799 Y54.361 E.0214
G1 X145.27 Y33.889 E.96034
G1 X165.743 Y54.361 E.96038
G1 X165.098 Y54.361 E.0214
G1 X185.571 Y33.889 E.96038
G1 X226.236 Y74.554 E1.90768
G1 X226.236 Y73.82 E.02435
G1 X205.764 Y94.291 E.96034
G1 X205.764 Y94.382 E.00301
G1 X226.236 Y114.853 E.96034
G1 X226.236 Y114.119 E.02435
G1 X217.559 Y122.795 E.40703
G2 X216.596 Y122.485 I-2.544 J6.235 E.0336
G1 X205.764 Y111.653 E.50813
G1 X205.764 Y111.562 E.00301
G1 X226.236 Y91.091 E.96034
G1 X226.236 Y91.825 E.02435
G1 X205.764 Y71.354 E.96034
G1 X205.764 Y71.263 E.00301
G1 X226.236 Y50.792 E.96034
G1 X226.236 Y51.527 E.02435
G1 X219.502 Y44.793 E.31589
G2 X219.435 Y43.18 I-3.565 J-.661 E.05398
; WIPE_START
G1 X219.567 Y44.125 E-.36237
G1 X219.502 Y44.793 E-.25496
G1 X219.767 Y45.058 E-.14267
; WIPE_END
G1 E-.04 F1800
G1 X214.982 Y47.539 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
G1 F16200
G2 X216.593 Y47.641 I1.028 J-3.481 E.05398
G1 X226.236 Y57.284 E.45236
G1 X226.236 Y56.549 E.02435
G1 X205.764 Y77.02 E.96034
G1 X205.764 Y77.111 E.00301
G1 X226.236 Y97.582 E.96034
G1 X226.236 Y96.848 E.02435
G1 X205.764 Y117.319 E.96034
G1 X205.764 Y117.41 E.00301
G1 X212.794 Y124.439 E.32976
G2 X212.794 Y127.561 I3.244 J1.561 E.1071
G1 X205.764 Y134.59 E.32976
G1 X205.764 Y134.681 E.00301
G1 X226.236 Y155.152 E.96034
G1 X226.236 Y154.418 E.02436
G1 X205.764 Y174.889 E.96034
G1 X205.764 Y174.98 E.00301
G1 X226.236 Y195.451 E.96034
G1 X226.236 Y194.716 E.02436
G1 X216.593 Y204.359 E.45236
G2 X214.981 Y204.461 I-.444 J5.777 E.05374
G1 X203.768 Y197.639 F30000
G1 F16200
G1 X205.396 Y197.639 E.05401
G1 X213.304 Y205.547 E.37094
G2 X212.485 Y208.467 I2.849 J2.373 E.10363
G1 X202.84 Y218.111 E.45246
G1 X182.369 Y197.639 E.96034
G1 X183.014 Y197.639 E.0214
G1 X162.541 Y218.111 E.96038
G1 X142.07 Y197.639 E.96034
G1 X142.715 Y197.639 E.0214
G1 X131.397 Y208.958 E.53096
G3 X131.076 Y209.673 I-3.66 J-1.212 E.02606
G1 X139.515 Y218.111 E.39585
G1 X159.986 Y197.639 E.96034
G1 X159.341 Y197.639 E.0214
G1 X179.814 Y218.111 E.96038
G1 X200.285 Y197.639 E.96034
G1 X199.639 Y197.639 E.0214
G1 X220.111 Y218.111 E.96034
G1 X226.236 Y211.987 E.28729
G1 X226.236 Y212.722 E.02436
G1 X205.764 Y192.251 E.96034
G1 X205.764 Y192.16 E.00301
G1 X226.236 Y171.689 E.96034
G1 X226.236 Y172.423 E.02436
G1 X205.764 Y151.952 E.96034
G1 X205.764 Y151.861 E.00301
G1 X226.236 Y131.39 E.96034
G1 X226.236 Y132.124 E.02436
G1 X219.512 Y125.401 E.31541
G3 X219.512 Y126.599 I-4.864 J.599 E.03986
G1 X226.236 Y119.876 E.31541
G1 X226.236 Y120.61 E.02435
G1 X205.764 Y100.139 E.96034
G1 X205.764 Y100.048 E.00301
G1 X226.236 Y79.577 E.96034
G1 X226.236 Y80.311 E.02435
G1 X205.764 Y59.84 E.96034
G1 X205.764 Y59.749 E.00301
G1 X226.236 Y39.278 E.96034
G1 X226.236 Y40.013 E.02435
G1 X220.111 Y33.889 E.28729
G1 X199.64 Y54.361 E.96034
G1 X200.285 Y54.361 E.0214
G1 X179.814 Y33.889 E.96034
G1 X159.341 Y54.361 E.96038
G1 X159.986 Y54.361 E.0214
G1 X139.515 Y33.889 E.96034
G1 X131.076 Y42.327 E.39585
G3 X131.397 Y43.042 I-3.335 J1.926 E.02606
G1 X142.715 Y54.361 E.53096
G1 X142.07 Y54.361 E.0214
G1 X162.541 Y33.889 E.96034
G1 X183.014 Y54.361 E.96038
G1 X182.369 Y54.361 E.0214
G1 X202.84 Y33.889 E.96034
G1 X212.485 Y43.533 E.45246
G2 X213.304 Y46.453 I3.667 J.547 E.10363
G1 X205.396 Y54.361 E.37094
G1 X203.768 Y54.361 E.05401
; WIPE_START
G1 X205.396 Y54.361 E-.61876
G1 X205.659 Y54.098 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X211.374 Y49.039 Z2.2 F30000
G1 X226.236 Y35.884 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F16200
G1 X226.236 Y34.256 E.05401
G1 X225.868 Y33.889 E.01722
G1 X218.328 Y41.429 E.35368
G2 X215.337 Y40.628 I-2.321 J2.684 E.10627
G1 X208.597 Y33.889 E.31618
G1 X188.126 Y54.361 E.96034
G1 X188.771 Y54.361 E.0214
G1 X168.298 Y33.889 E.96038
G1 X147.827 Y54.361 E.96034
G1 X148.472 Y54.361 E.0214
G1 X127.999 Y33.889 E.96038
G1 X107.528 Y54.361 E.96034
G1 X108.173 Y54.361 E.0214
G1 X93.139 Y39.326 E.70528
G1 X93.566 Y38.899 E.02003
G1 X91.007 Y36.34 E.12006
G1 X93.459 Y33.889 E.11501
G1 X113.93 Y54.361 E.96034
G1 X113.285 Y54.361 E.0214
G1 X124.607 Y43.038 E.53116
G3 X124.924 Y42.326 I3.524 J1.138 E.02589
G1 X116.485 Y33.889 E.39582
G1 X96.014 Y54.361 E.96034
G1 X96.659 Y54.361 E.0214
G1 X87.541 Y45.242 E.42775
; WIPE_START
G1 X88.955 Y46.657 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.152 Y54.073 Z2.2 F30000
G1 X52.232 Y197.639 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F16200
G1 X50.604 Y197.639 E.05401
G1 X42.698 Y205.545 E.37088
G3 X43.513 Y208.465 I-2.854 J2.371 E.10361
G1 X53.16 Y218.111 E.45251
G1 X73.631 Y197.639 E.96034
G1 X72.986 Y197.639 E.0214
G1 X93.459 Y218.111 E.96038
G1 X113.93 Y197.639 E.96034
G1 X113.285 Y197.639 E.0214
G1 X124.607 Y208.962 E.53116
G2 X124.924 Y209.674 I3.525 J-1.139 E.02589
G1 X116.485 Y218.111 E.39582
G1 X96.014 Y197.639 E.96034
G1 X96.659 Y197.639 E.0214
G1 X76.186 Y218.111 E.96038
G1 X55.715 Y197.639 E.96034
G1 X56.36 Y197.639 E.0214
G1 X35.889 Y218.111 E.96034
G1 X29.764 Y211.987 E.28729
G1 X29.764 Y212.722 E.02435
G1 X50.236 Y192.251 E.96034
G1 X50.236 Y192.16 E.00301
G1 X29.764 Y171.689 E.96034
G1 X29.764 Y172.423 E.02435
G1 X50.236 Y151.952 E.96034
G1 X50.236 Y151.861 E.00301
G1 X29.764 Y131.39 E.96034
G1 X29.764 Y132.124 E.02435
G1 X36.487 Y125.402 E.31535
G2 X36.487 Y126.598 I3.636 J.598 E.03986
G1 X29.764 Y119.876 E.31535
G1 X29.764 Y120.61 E.02436
G1 X50.236 Y100.139 E.96034
G1 X50.236 Y100.048 E.00301
G1 X29.764 Y79.577 E.96034
G1 X29.764 Y80.311 E.02436
G1 X50.236 Y59.84 E.96034
G1 X50.236 Y59.749 E.00301
G1 X29.764 Y39.278 E.96034
G1 X29.764 Y40.013 E.02436
G1 X35.889 Y33.889 E.28729
G1 X56.361 Y54.361 E.96034
G1 X55.715 Y54.361 E.0214
G1 X76.186 Y33.889 E.96034
G1 X81.057 Y38.758 E.22845
G1 X80.63 Y39.185 E.02003
G1 X81.517 Y40.072 E.04162
G1 X67.229 Y54.361 E.67029
G1 X67.874 Y54.361 E.0214
G1 X47.403 Y33.889 E.96034
G1 X40.667 Y40.624 E.31595
G2 X37.67 Y41.427 I-.661 J3.526 E.10646
G1 X30.132 Y33.889 E.3536
G1 X29.764 Y34.256 E.01722
G1 X29.764 Y35.884 E.05401
G1 X29.764 Y216.116 F30000
G1 F16200
G1 X29.764 Y217.744 E.05401
G1 X30.132 Y218.111 E.01722
G1 X37.67 Y210.573 E.3536
G2 X40.667 Y211.376 I2.373 J-2.859 E.1062
G1 X47.403 Y218.111 E.31595
G1 X67.874 Y197.639 E.96034
G1 X67.229 Y197.639 E.0214
G1 X87.7 Y218.111 E.96034
G1 X108.173 Y197.639 E.96038
G1 X107.528 Y197.639 E.0214
G1 X127.999 Y218.111 E.96034
G1 X148.472 Y197.639 E.96038
G1 X147.827 Y197.639 E.0214
G1 X168.298 Y218.111 E.96034
G1 X188.771 Y197.639 E.96038
G1 X188.126 Y197.639 E.0214
G1 X208.597 Y218.111 E.96034
G1 X215.334 Y211.375 E.31603
G2 X218.328 Y210.571 I.629 J-3.637 E.10613
G1 X225.868 Y218.111 E.35368
G1 X226.236 Y217.744 E.01722
G1 X226.236 Y216.116 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F16200
G1 X226.236 Y217.744 E-.61876
G1 X225.972 Y218.007 E-.14124
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
G1 X129.034 Y204.832
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F16213.044
G1 X129.176 Y204.879 E.00496
G3 X127.784 Y204.668 I-1.167 J2.996 E.62302
G3 X128.871 Y204.779 I.214 J3.284 E.03643
G1 X128.977 Y204.813 E.00368
G1 X128.588 Y205.13 F30000
G1 F16213.044
G1 X128.761 Y205.17 E.0059
G3 X127.814 Y205.074 I-.751 J2.706 E.55366
M73 P52 R30
G3 X128.488 Y205.107 I.204 J2.722 E.02244
G1 X128.529 Y205.117 E.00141
G1 X128.147 Y205.479 F30000
M73 P53 R30
G1 F16213.044
G1 X128.179 Y205.491 E.00111
G3 X128.651 Y205.562 I-.277 J3.441 E.01585
G3 X127.844 Y205.48 I-.642 J2.314 E.47349
G1 X128.087 Y205.479 E.00806
G1 X127.871 Y205.871 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X127.874 Y205.871 E.0001
G3 X128.349 Y205.895 I.128 J2.171 E.01465
G3 X127.554 Y205.919 I-.339 J1.98 E.36316
G1 X127.811 Y205.88 E.00801
; WIPE_START
M204 S10000
G1 X127.874 Y205.871 E-.02397
G1 X128.15 Y205.87 E-.10503
G1 X128.349 Y205.895 E-.07618
G1 X128.734 Y206.004 E-.15213
G1 X129.091 Y206.186 E-.15208
G1 X129.404 Y206.436 E-.15216
G1 X129.57 Y206.634 E-.09844
; WIPE_END
G1 E-.04 F1800
G1 X137.201 Y206.461 Z2.4 F30000
G1 X216.152 Y204.666 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X216.24 Y204.67 E.00294
G3 X217.176 Y204.879 I-.243 J3.281 E.03191
G3 X215.784 Y204.668 I-1.167 J2.996 E.62301
G1 X216.092 Y204.667 E.01022
G1 X216.151 Y205.073 F30000
G1 F16213.044
G1 X216.21 Y205.073 E.00194
G3 X216.761 Y205.17 I-.192 J2.723 E.01859
G3 X215.814 Y205.074 I-.751 J2.706 E.55367
G1 X216.091 Y205.073 E.0092
G1 X216.214 Y205.485 F30000
G1 F16213.044
G1 X216.651 Y205.562 E.01471
G3 X215.844 Y205.48 I-.642 J2.314 E.47349
G3 X216.155 Y205.489 I.057 J3.452 E.0103
G1 X216.056 Y205.871 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X216.15 Y205.872 E.00289
G3 X216.349 Y205.895 I-.149 J2.17 E.00616
G3 X215.874 Y205.871 I-.339 J1.98 E.37312
G1 X215.996 Y205.871 E.00376
; WIPE_START
M204 S10000
G1 X216.15 Y205.872 E-.05853
G1 X216.349 Y205.895 E-.07613
G1 X216.734 Y206.004 E-.15214
G1 X217.091 Y206.186 E-.15207
G1 X217.404 Y206.436 E-.15213
G1 X217.661 Y206.743 E-.15215
G1 X217.682 Y206.782 E-.01685
; WIPE_END
G1 E-.04 F1800
G1 X217.623 Y199.149 Z2.4 F30000
G1 X217.033 Y122.957 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X217.176 Y123.004 E.00498
G3 X215.783 Y122.793 I-1.167 J2.996 E.62302
G3 X216.871 Y122.904 I.214 J3.284 E.03643
G1 X216.976 Y122.938 E.00368
G1 X216.587 Y123.255 F30000
G1 F16213.044
G1 X216.761 Y123.295 E.00591
G3 X215.814 Y123.199 I-.751 J2.706 E.55367
G3 X216.488 Y123.232 I.204 J2.723 E.02244
G1 X216.529 Y123.242 E.00139
G1 X216.147 Y123.604 F30000
G1 F16213.044
G1 X216.179 Y123.616 E.00111
G3 X216.651 Y123.687 I-.278 J3.443 E.01585
G3 X215.844 Y123.605 I-.642 J2.314 E.47349
G1 X216.087 Y123.604 E.00805
G1 X215.877 Y123.996 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X216.15 Y123.997 E.00839
G3 X216.349 Y124.02 I-.149 J2.169 E.00616
G3 X215.817 Y124.001 I-.339 J1.98 E.37137
; WIPE_START
M204 S10000
G1 X216.15 Y123.997 E-.12649
G1 X216.349 Y124.02 E-.07615
G1 X216.734 Y124.129 E-.15212
G1 X217.091 Y124.311 E-.15212
G1 X217.404 Y124.561 E-.15212
G1 X217.575 Y124.765 E-.101
; WIPE_END
G1 E-.04 F1800
G1 X217.3 Y117.137 Z2.4 F30000
G1 X214.571 Y41.246 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X214.679 Y41.198 E.0039
G3 X215.783 Y40.918 I1.33 J2.927 E.03799
G3 X217.176 Y41.129 I.214 J3.284 E.04707
G3 X214.395 Y41.345 I-1.167 J2.996 E.57442
G1 X214.519 Y41.275 E.00472
G1 X215.058 Y41.48 F30000
G1 F16213.044
G1 X215.107 Y41.467 E.00169
G3 X215.814 Y41.324 I.903 J2.659 E.024
G3 X216.761 Y41.42 I.204 J2.723 E.03174
G3 X214.847 Y41.57 I-.751 J2.706 E.52039
G1 X215.002 Y41.503 E.00561
G1 X215.55 Y41.771 F30000
G1 F16213.044
G1 X215.844 Y41.73 E.00987
G3 X216.651 Y41.812 I.057 J3.454 E.02695
G3 X215.466 Y41.787 I-.642 J2.314 E.46079
G1 X215.491 Y41.782 E.00083
G1 X215.877 Y42.121 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X216.15 Y42.122 E.00839
G3 X216.349 Y42.145 I-.149 J2.169 E.00616
G3 X215.817 Y42.126 I-.339 J1.98 E.37138
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
G1 F16213.044
G1 X126.679 Y41.198 E.0039
G3 X127.783 Y40.918 I1.33 J2.927 E.03799
G3 X129.176 Y41.129 I.214 J3.284 E.04707
G3 X126.395 Y41.345 I-1.167 J2.996 E.57441
G1 X126.519 Y41.275 E.00474
G1 X127.058 Y41.479 F30000
G1 F16213.044
G1 X127.107 Y41.467 E.00168
G3 X127.814 Y41.324 I.903 J2.659 E.024
G3 X128.761 Y41.42 I.204 J2.722 E.03174
G3 X126.847 Y41.569 I-.751 J2.706 E.52039
G1 X127.003 Y41.503 E.00561
G1 X127.55 Y41.771 F30000
G1 F16213.044
G1 X127.844 Y41.73 E.00986
G3 X128.651 Y41.812 I.057 J3.454 E.02695
G3 X127.466 Y41.786 I-.642 J2.314 E.46079
G1 X127.491 Y41.782 E.00084
G1 X127.877 Y42.121 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X128.15 Y42.122 E.00839
G3 X128.349 Y42.145 I-.149 J2.169 E.00616
G3 X127.817 Y42.126 I-.339 J1.98 E.37138
; WIPE_START
M204 S10000
G1 X128.15 Y42.122 E-.12642
G1 X128.349 Y42.145 E-.07615
G1 X128.544 Y42.19 E-.07614
G1 X128.917 Y42.336 E-.15213
G1 X129.253 Y42.553 E-.1521
G1 X129.54 Y42.833 E-.15216
G1 X129.577 Y42.887 E-.0249
; WIPE_END
G1 E-.04 F1800
G1 X121.946 Y42.731 Z2.4 F30000
G1 X41.033 Y41.082 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X41.176 Y41.129 E.00497
G3 X39.783 Y40.918 I-1.167 J2.996 E.62302
G3 X40.871 Y41.029 I.214 J3.284 E.03643
G1 X40.976 Y41.063 E.00367
G1 X40.587 Y41.38 F30000
G1 F16213.044
G1 X40.761 Y41.42 E.00591
G3 X39.814 Y41.324 I-.751 J2.706 E.55367
G3 X40.488 Y41.357 I.204 J2.722 E.02244
G1 X40.529 Y41.367 E.00139
G1 X40.147 Y41.729 F30000
G1 F16213.044
G1 X40.179 Y41.741 E.00112
G3 X40.651 Y41.812 I-.277 J3.443 E.01585
G3 X39.844 Y41.73 I-.642 J2.314 E.47349
G1 X40.087 Y41.729 E.00805
G1 X39.877 Y42.121 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X40.15 Y42.122 E.00839
G3 X40.349 Y42.145 I-.149 J2.169 E.00616
G3 X39.817 Y42.126 I-.339 J1.98 E.37138
; WIPE_START
M204 S10000
G1 X40.15 Y42.122 E-.12648
G1 X40.349 Y42.145 E-.07615
G1 X40.544 Y42.19 E-.07614
G1 X40.917 Y42.336 E-.15213
G1 X41.253 Y42.553 E-.1521
G1 X41.54 Y42.833 E-.15216
G1 X41.577 Y42.887 E-.02485
; WIPE_END
G1 E-.04 F1800
G1 X47.131 Y48.122 Z2.4 F30000
G1 X205.416 Y197.291 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X50.584 Y197.291 E5.13608
G1 X50.584 Y54.709 E4.72972
G1 X205.416 Y54.709 E5.13608
G1 X205.416 Y197.231 E4.72773
G1 X205.009 Y196.884 F30000
G1 F16213.044
G1 X50.991 Y196.884 E5.10907
G1 X50.991 Y55.116 E4.70271
G1 X205.009 Y55.116 E5.10907
G1 X205.009 Y196.824 E4.70072
G1 X204.602 Y196.477 F30000
G1 F16213.044
G1 X51.398 Y196.477 E5.08206
G1 X51.398 Y55.523 E4.67571
G1 X204.602 Y55.523 E5.08206
G1 X204.602 Y196.417 E4.67372
G1 X204.21 Y196.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X51.79 Y196.085 E4.68344
G1 X51.79 Y55.915 E4.30703
G1 X204.21 Y55.915 E4.68344
G1 X204.21 Y196.025 E4.30519
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
G1 F16213.044
G1 X38.679 Y123.073 E.0039
G3 X39.783 Y122.793 I1.33 J2.927 E.03799
G3 X41.176 Y123.004 I.214 J3.284 E.04708
G3 X38.395 Y123.22 I-1.167 J2.996 E.57441
G1 X38.519 Y123.15 E.00473
G1 X39.058 Y123.355 F30000
G1 F16213.044
G1 X39.107 Y123.342 E.00168
G3 X39.814 Y123.199 I.903 J2.659 E.024
G3 X40.761 Y123.295 I.204 J2.723 E.03174
G3 X38.847 Y123.444 I-.751 J2.706 E.52039
G1 X39.002 Y123.378 E.00561
G1 X39.55 Y123.646 F30000
G1 F16213.044
G1 X39.844 Y123.605 E.00986
G3 X40.651 Y123.687 I.057 J3.454 E.02695
G3 X39.466 Y123.661 I-.642 J2.314 E.46079
G1 X39.491 Y123.657 E.00083
G1 X39.877 Y123.996 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X40.15 Y123.997 E.00839
G3 X40.349 Y124.02 I-.149 J2.169 E.00616
G3 X39.817 Y124.001 I-.339 J1.98 E.37138
; WIPE_START
M204 S10000
G1 X40.15 Y123.997 E-.12646
G1 X40.349 Y124.02 E-.07615
G1 X40.734 Y124.129 E-.15213
G1 X41.091 Y124.311 E-.15209
G1 X41.404 Y124.561 E-.15213
G1 X41.575 Y124.765 E-.10105
; WIPE_END
G1 E-.04 F1800
G1 X41.439 Y132.396 Z2.4 F30000
G1 X40.152 Y204.666 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X40.24 Y204.67 E.00294
G3 X41.176 Y204.879 I-.243 J3.282 E.03191
G3 X39.784 Y204.668 I-1.167 J2.996 E.62302
G1 X40.092 Y204.667 E.01022
G1 X40.151 Y205.073 F30000
G1 F16213.044
G1 X40.21 Y205.073 E.00194
G3 X40.761 Y205.17 I-.192 J2.723 E.0186
G3 X39.814 Y205.074 I-.751 J2.706 E.55366
G1 X40.091 Y205.073 E.0092
G1 X40.214 Y205.485 F30000
G1 F16213.044
G1 X40.651 Y205.562 E.01471
G3 X39.844 Y205.48 I-.642 J2.314 E.47349
G3 X40.155 Y205.489 I.057 J3.452 E.0103
G1 X40.056 Y205.871 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X40.15 Y205.872 E.00289
G3 X40.349 Y205.895 I-.149 J2.17 E.00616
G3 X39.874 Y205.871 I-.339 J1.98 E.37312
G1 X39.996 Y205.871 E.00376
; WIPE_START
M204 S10000
G1 X40.15 Y205.872 E-.05853
G1 X40.349 Y205.895 E-.07614
G1 X40.734 Y206.004 E-.15213
G1 X41.091 Y206.186 E-.15208
G1 X41.404 Y206.436 E-.15216
G1 X41.661 Y206.743 E-.15212
G1 X41.682 Y206.782 E-.01684
; WIPE_END
G1 E-.04 F1800
G1 X49.299 Y207.263 Z2.4 F30000
G1 X226.584 Y218.459 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X29.416 Y218.459 E6.54041
G1 X29.416 Y33.541 E6.13406
G1 X226.584 Y33.541 E6.54041
G1 X226.584 Y218.399 E6.13207
G1 X226.991 Y218.866 F30000
G1 F16213.044
G1 X29.009 Y218.866 E6.56742
G1 X29.009 Y33.134 E6.16106
G1 X226.991 Y33.134 E6.56742
G1 X226.991 Y218.806 E6.15907
G1 X227.398 Y219.273 F30000
G1 F16213.044
G1 X28.602 Y219.273 E6.59442
G1 X28.602 Y32.727 E6.18807
G1 X227.398 Y32.727 E6.59442
G1 X227.398 Y219.213 E6.18608
G1 X227.79 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X28.21 Y219.665 E6.13254
G1 X28.21 Y32.335 E5.75613
G1 X227.79 Y32.335 E6.13254
G1 X227.79 Y219.605 E5.75429
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
G1 F16200
G1 X225.858 Y217.733 E.04181
G1 X225.49 Y217.733 E.01221
G1 X218.595 Y210.839 E.32345
G3 X215.018 Y211.691 I-2.597 J-2.967 E.12691
G1 X208.976 Y217.733 E.28346
G1 X208.219 Y217.733 E.02508
G1 X188.503 Y198.017 E.92495
G1 X188.394 Y198.017 E.00362
G1 X168.677 Y217.733 E.92495
G1 X167.921 Y217.733 E.02508
G1 X148.204 Y198.017 E.92495
G1 X148.095 Y198.017 E.00362
G1 X128.378 Y217.733 E.92495
G1 X127.622 Y217.733 E.02508
G1 X107.905 Y198.017 E.92495
G1 X107.796 Y198.017 E.00362
G1 X88.079 Y217.733 E.92495
G1 X87.323 Y217.733 E.02508
G1 X67.606 Y198.017 E.92495
G1 X67.497 Y198.017 E.00362
G1 X47.781 Y217.733 E.92495
G1 X47.024 Y217.733 E.02508
G1 X40.982 Y211.691 E.28344
G3 X37.402 Y210.841 I-.949 J-3.971 E.12665
G1 X30.51 Y217.733 E.32331
G1 X30.142 Y217.733 E.01221
G1 X30.142 Y216.473 E.04181
G1 X36.108 Y208.505 F30000
G1 F16200
G3 X36.181 Y206.89 I4.995 J-.584 E.05387
G1 X30.142 Y200.83 E.2838
G1 X49.858 Y181.114 E.92495
G1 X49.858 Y180.269 E.02804
G1 X30.142 Y160.552 E.92495
G1 X49.858 Y140.815 E.92542
G1 X49.858 Y139.97 E.02804
G1 X39.826 Y129.937 E.47064
G3 X38.161 Y129.484 I.189 J-3.979 E.05769
G1 X30.142 Y137.524 E.37669
G1 X49.858 Y157.241 E.92495
G1 X49.858 Y158.086 E.02804
G1 X30.142 Y177.823 E.92542
G1 X49.858 Y197.539 E.92495
G1 X49.858 Y195.911 E.05401
G1 X43.563 Y207.518 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G3 X43.56 Y208.247 I-12.447 J.317 E.02019
G1 X43.416 Y208.945 E.01975
G1 X43.136 Y209.601 E.01976
G1 X42.732 Y210.188 E.01974
G1 X42.22 Y210.683 E.01975
G1 X41.619 Y211.067 E.01975
G1 X40.954 Y211.325 E.01976
G1 X40.252 Y211.446 E.01975
G1 X39.539 Y211.425 E.01974
G1 X38.845 Y211.263 E.01976
G1 X38.197 Y210.967 E.01974
G1 X37.619 Y210.548 E.01975
G1 X37.137 Y210.024 E.01974
G1 X36.768 Y209.414 E.01975
G1 X36.527 Y208.743 E.01975
G1 X36.424 Y208.038 E.01975
G1 X36.463 Y207.326 E.01975
G1 X36.642 Y206.636 E.01975
G1 X36.954 Y205.995 E.01975
G1 X37.387 Y205.429 E.01975
G1 X37.923 Y204.959 E.01975
G1 X38.542 Y204.606 E.01975
G1 X39.22 Y204.381 E.0198
G3 X40.985 Y204.434 I.767 J3.879 E.04932
G1 X41.647 Y204.697 E.01975
G1 X42.244 Y205.086 E.01975
G1 X42.752 Y205.586 E.01974
G1 X43.151 Y206.177 E.01975
G1 X43.425 Y206.835 E.01975
G1 X43.551 Y207.46 E.01765
; Slow Down End
G1 X43.563 Y125.643 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G3 X43.56 Y126.372 I-12.447 J.317 E.02019
G1 X43.416 Y127.07 E.01975
G1 X43.136 Y127.726 E.01975
G1 X42.732 Y128.313 E.01975
G1 X42.22 Y128.808 E.01974
G1 X41.619 Y129.193 E.01975
G1 X40.954 Y129.45 E.01976
G1 X40.252 Y129.571 E.01975
G1 X39.539 Y129.55 E.01975
G1 X38.845 Y129.388 E.01975
G1 X38.196 Y129.092 E.01975
G1 X37.62 Y128.673 E.01975
G1 X37.137 Y128.149 E.01975
G1 X36.768 Y127.539 E.01975
G1 X36.527 Y126.868 E.01974
G1 X36.424 Y126.163 E.01975
G1 X36.463 Y125.451 E.01975
G1 X36.642 Y124.761 E.01975
G1 X36.954 Y124.12 E.01975
G1 X37.387 Y123.554 E.01975
G1 X37.923 Y123.084 E.01975
G1 X38.542 Y122.731 E.01975
G1 X39.221 Y122.506 E.0198
G3 X40.985 Y122.558 I.767 J3.879 E.04931
G1 X41.647 Y122.822 E.01975
G1 X42.244 Y123.211 E.01975
G1 X42.752 Y123.711 E.01975
G1 X43.151 Y124.302 E.01975
G1 X43.425 Y124.96 E.01975
G1 X43.551 Y125.585 E.01766
; Slow Down End
G1 X49.858 Y56.089 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X49.858 Y54.461 E.05401
G1 X30.142 Y74.177 E.92495
G1 X49.858 Y93.914 E.92542
G1 X49.858 Y94.759 E.02804
G1 X30.142 Y114.476 E.92495
G1 X38.161 Y122.516 E.37669
G3 X39.821 Y122.068 I1.772 J3.266 E.05755
G1 X49.858 Y112.03 E.47088
G1 X49.858 Y111.185 E.02804
G1 X30.142 Y91.448 E.92542
G1 X49.858 Y71.731 E.92495
G1 X49.858 Y70.886 E.02804
G1 X30.142 Y51.169 E.92495
G1 X36.181 Y45.11 E.2838
G3 X36.108 Y43.495 I4.921 J-1.031 E.05387
; WIPE_START
G1 X36.061 Y44.322 E-.31483
G1 X36.181 Y45.11 E-.30297
G1 X35.917 Y45.375 E-.14221
; WIPE_END
G1 E-.04 F1800
G1 X40.704 Y48.005 Z2.4 F30000
G1 Z2
G1 E.8 F1800
G1 F16200
G3 X39.087 Y47.961 I-.672 J-4.98 E.05387
G1 X30.142 Y56.926 E.42014
G1 X49.858 Y76.643 E.92495
G1 X49.858 Y77.488 E.02804
G1 X30.142 Y97.225 E.92542
G1 X49.858 Y116.942 E.92495
G1 X49.858 Y117.787 E.02804
G1 X43.486 Y124.159 E.29894
G3 X43.486 Y127.841 I-3.642 J1.841 E.12668
G1 X49.858 Y134.213 E.29894
G1 X49.858 Y135.058 E.02804
G1 X30.142 Y154.775 E.92495
G1 X49.858 Y174.512 E.92542
G1 X49.858 Y175.357 E.02804
G1 X30.142 Y195.074 E.92495
G1 X39.087 Y204.039 E.42014
G3 X40.705 Y203.995 I.919 J4.006 E.05402
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
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G3 X131.56 Y208.247 I-12.454 J.317 E.02019
G1 X131.416 Y208.945 E.01975
G1 X131.136 Y209.601 E.01976
G1 X130.732 Y210.188 E.01973
G1 X130.22 Y210.683 E.01975
G1 X129.619 Y211.067 E.01975
G1 X128.954 Y211.325 E.01976
G1 X128.252 Y211.446 E.01975
G1 X127.539 Y211.425 E.01976
G1 X126.845 Y211.263 E.01974
G1 X126.197 Y210.967 E.01975
G1 X125.619 Y210.548 E.01975
G1 X125.137 Y210.024 E.01974
G1 X124.768 Y209.414 E.01975
G1 X124.527 Y208.743 E.01974
G1 X124.424 Y208.038 E.01975
G1 X124.463 Y207.326 E.01975
G1 X124.642 Y206.636 E.01975
G1 X124.954 Y205.995 E.01975
G1 X125.387 Y205.429 E.01975
G1 X125.923 Y204.959 E.01975
G1 X126.542 Y204.606 E.01975
G1 X127.22 Y204.381 E.0198
G3 X128.985 Y204.434 I.767 J3.879 E.04932
G1 X129.647 Y204.697 E.01975
G1 X130.244 Y205.086 E.01975
G1 X130.752 Y205.586 E.01974
G1 X131.151 Y206.177 E.01975
G1 X131.425 Y206.835 E.01975
G1 X131.551 Y207.46 E.01765
; Slow Down End
; WIPE_START
G1 X131.425 Y206.835 E-.24209
G1 X131.151 Y206.177 E-.27094
G1 X130.787 Y205.638 E-.24697
; WIPE_END
G1 E-.04 F1800
G1 X138.357 Y204.661 Z2.4 F30000
G1 X206.142 Y195.911 Z2.4
M73 P54 R30
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X206.142 Y197.539 E.05401
G1 X225.858 Y177.823 E.92495
G1 X206.142 Y158.086 E.92542
G1 X206.142 Y157.241 E.02804
G1 X225.858 Y137.524 E.92495
G1 X217.841 Y129.486 E.3766
G3 X216.175 Y129.936 I-2.052 J-4.285 E.05755
G1 X206.142 Y139.97 E.4707
G1 X206.142 Y140.815 E.02804
G1 X225.858 Y160.552 E.92542
G1 X206.142 Y180.269 E.92495
G1 X206.142 Y181.114 E.02804
G1 X225.858 Y200.83 E.92495
G1 X219.815 Y206.894 E.28397
G3 X219.889 Y208.508 I-3.822 J.982 E.05397
G1 X219.563 Y207.519 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G3 X219.56 Y208.247 I-12.445 J.317 E.02019
G1 X219.416 Y208.945 E.01975
G1 X219.136 Y209.601 E.01975
G1 X218.732 Y210.188 E.01974
G1 X218.219 Y210.684 E.01975
G1 X217.619 Y211.067 E.01974
G1 X216.954 Y211.325 E.01976
G1 X216.252 Y211.446 E.01975
G1 X215.539 Y211.425 E.01975
G1 X214.845 Y211.263 E.01976
G1 X214.196 Y210.967 E.01975
G1 X213.62 Y210.548 E.01975
G1 X213.137 Y210.024 E.01974
G1 X212.768 Y209.414 E.01975
G1 X212.527 Y208.743 E.01975
G1 X212.424 Y208.038 E.01975
G1 X212.463 Y207.326 E.01975
G1 X212.642 Y206.636 E.01975
G1 X212.954 Y205.995 E.01975
G1 X213.387 Y205.429 E.01975
G1 X213.923 Y204.959 E.01975
G1 X214.542 Y204.606 E.01975
G1 X215.22 Y204.381 E.0198
G3 X216.985 Y204.433 I.767 J3.879 E.04932
G1 X217.647 Y204.697 E.01975
G1 X218.244 Y205.086 E.01974
G1 X218.752 Y205.586 E.01975
G1 X219.151 Y206.177 E.01975
G1 X219.425 Y206.835 E.01975
G1 X219.551 Y207.46 E.01766
; Slow Down End
; WIPE_START
G1 X219.425 Y206.835 E-.24217
G1 X219.151 Y206.177 E-.2709
G1 X218.787 Y205.638 E-.24693
; WIPE_END
G1 E-.04 F1800
G1 X215.295 Y204.004 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G3 X216.91 Y204.042 I.712 J4.051 E.05395
G1 X225.858 Y195.074 E.42026
G1 X206.142 Y175.357 E.92495
G1 X206.142 Y174.512 E.02804
G1 X225.858 Y154.775 E.92542
G1 X206.142 Y135.058 E.92495
G1 X206.142 Y134.213 E.02804
G1 X212.516 Y127.839 E.29902
G3 X212.516 Y124.161 I3.487 J-1.839 E.12691
G1 X206.142 Y117.787 E.29902
G1 X206.142 Y116.942 E.02804
G1 X225.858 Y97.225 E.92495
G1 X206.142 Y77.488 E.92542
G1 X206.142 Y76.643 E.02804
G1 X225.858 Y56.926 E.92495
G1 X216.91 Y47.958 E.42026
G3 X215.295 Y48.001 I-.91 J-3.838 E.05397
; WIPE_START
G1 X216.295 Y48.058 E-.38049
G1 X216.91 Y47.958 E-.23691
G1 X217.175 Y48.224 E-.14261
; WIPE_END
G1 E-.04 F1800
G1 X219.563 Y43.769 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G3 X219.56 Y44.497 I-12.458 J.317 E.02019
G1 X219.416 Y45.195 E.01975
G1 X219.136 Y45.851 E.01975
G1 X218.732 Y46.438 E.01974
G1 X218.219 Y46.934 E.01975
G1 X217.619 Y47.318 E.01975
G1 X216.954 Y47.575 E.01975
G1 X216.252 Y47.696 E.01975
G1 X215.539 Y47.675 E.01975
G1 X214.845 Y47.513 E.01975
G1 X214.197 Y47.217 E.01974
G1 X213.619 Y46.798 E.01976
G1 X213.137 Y46.274 E.01975
G1 X212.768 Y45.664 E.01975
G1 X212.527 Y44.993 E.01975
G1 X212.424 Y44.288 E.01974
G1 X212.463 Y43.576 E.01975
G1 X212.642 Y42.886 E.01975
G1 X212.954 Y42.245 E.01975
G1 X213.387 Y41.679 E.01975
G1 X213.923 Y41.21 E.01975
G1 X214.542 Y40.856 E.01975
G1 X215.221 Y40.631 E.0198
G3 X216.985 Y40.683 I.767 J3.879 E.04931
G1 X217.647 Y40.947 E.01975
G1 X218.244 Y41.336 E.01975
G1 X218.752 Y41.836 E.01975
G1 X219.151 Y42.427 E.01974
G1 X219.425 Y43.085 E.01975
G1 X219.551 Y43.71 E.01766
; Slow Down End
G1 X219.889 Y43.492 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G3 X219.815 Y45.106 I-3.896 J.632 E.05397
G1 X225.858 Y51.17 E.28397
G1 X206.142 Y70.886 E.92495
G1 X206.142 Y71.731 E.02804
G1 X225.858 Y91.448 E.92495
G1 X206.142 Y111.185 E.92542
G1 X206.142 Y112.03 E.02804
G1 X216.177 Y122.066 E.4708
G3 X217.841 Y122.514 I-.368 J4.678 E.05747
G1 X225.858 Y114.476 E.3766
G1 X206.142 Y94.759 E.92495
G1 X206.142 Y93.914 E.02804
G1 X225.858 Y74.177 E.92542
G1 X206.142 Y54.461 E.92495
G1 X206.142 Y56.089 E.05401
G1 X205.752 Y54.373 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.399404
G1 F3000;_EXTRUDE_SET_SPEED
G1 X205.779 Y54.505 E.00391
G1 X205.779 Y197.495 E4.15369
G1 X205.752 Y197.627 E.00391
G1 X205.62 Y197.654 E.00391
G1 X50.38 Y197.654 E4.50954
G1 X50.248 Y197.627 E.00391
G1 X50.221 Y197.495 E.00391
G1 X50.221 Y54.505 E4.15369
G1 X50.248 Y54.373 E.00391
G1 X50.38 Y54.346 E.00391
G1 X205.62 Y54.346 E4.50954
G1 X205.693 Y54.361 E.00217
; Slow Down End
G1 X219.563 Y125.644 F30000
; Slow Down Start
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G3 X219.56 Y126.372 I-12.445 J.317 E.02019
G1 X219.416 Y127.07 E.01975
G1 X219.136 Y127.726 E.01975
G1 X218.732 Y128.313 E.01974
G1 X218.219 Y128.809 E.01975
G1 X217.619 Y129.193 E.01975
G1 X216.954 Y129.45 E.01975
G1 X216.252 Y129.571 E.01975
G1 X215.539 Y129.55 E.01975
G1 X214.845 Y129.388 E.01975
G1 X214.197 Y129.092 E.01974
G1 X213.619 Y128.673 E.01976
G1 X213.137 Y128.149 E.01975
G1 X212.768 Y127.539 E.01975
G1 X212.527 Y126.868 E.01975
G1 X212.424 Y126.163 E.01975
G1 X212.463 Y125.451 E.01975
G1 X212.642 Y124.761 E.01975
G1 X212.954 Y124.12 E.01975
G1 X213.387 Y123.554 E.01975
G1 X213.923 Y123.084 E.01976
G1 X214.542 Y122.731 E.01975
G1 X215.221 Y122.506 E.0198
G3 X216.985 Y122.558 I.767 J3.879 E.04931
G1 X217.647 Y122.822 E.01976
G1 X218.244 Y123.211 E.01974
G1 X218.752 Y123.711 E.01976
G1 X219.151 Y124.302 E.01974
G1 X219.425 Y124.96 E.01976
G1 X219.551 Y125.585 E.01766
; Slow Down End
; WIPE_START
G1 X219.425 Y124.96 E-.24218
G1 X219.151 Y124.302 E-.27096
G1 X218.787 Y123.763 E-.24686
; WIPE_END
G1 E-.04 F1800
G1 X213.162 Y118.605 Z2.4 F30000
G1 X131.563 Y43.768 Z2.4
G1 Z2
G1 E.8 F1800
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G3 X131.56 Y44.497 I-12.467 J.317 E.02019
G1 X131.416 Y45.195 E.01975
G1 X131.136 Y45.851 E.01975
G1 X130.732 Y46.438 E.01974
G1 X130.22 Y46.933 E.01974
G1 X129.619 Y47.318 E.01975
G1 X128.954 Y47.575 E.01976
G1 X128.252 Y47.696 E.01975
G1 X127.539 Y47.675 E.01976
G1 X126.845 Y47.513 E.01974
G1 X126.197 Y47.217 E.01974
G1 X125.619 Y46.798 E.01976
G1 X125.137 Y46.274 E.01975
G1 X124.768 Y45.664 E.01975
G1 X124.527 Y44.993 E.01975
G1 X124.424 Y44.288 E.01975
G1 X124.463 Y43.576 E.01975
G1 X124.642 Y42.886 E.01975
G1 X124.954 Y42.245 E.01975
G1 X125.387 Y41.679 E.01975
G1 X125.923 Y41.209 E.01975
G1 X126.542 Y40.856 E.01975
G1 X127.221 Y40.631 E.0198
G3 X128.985 Y40.683 I.767 J3.879 E.04931
G1 X129.647 Y40.947 E.01976
G1 X130.244 Y41.336 E.01974
G1 X130.752 Y41.836 E.01976
G1 X131.151 Y42.427 E.01974
G1 X131.425 Y43.085 E.01975
G1 X131.551 Y43.71 E.01766
; Slow Down End
; WIPE_START
G1 X131.425 Y43.085 E-.24217
G1 X131.151 Y42.427 E-.27092
G1 X130.787 Y41.888 E-.24691
; WIPE_END
G1 E-.04 F1800
G1 X123.182 Y41.249 Z2.4 F30000
G1 X93.065 Y38.718 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.42049
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X86.917 Y44.866 E.49193
G1 X87.249 Y45.198 E.02662
G1 X93.254 Y39.194 E.48047
G1 X93.587 Y39.526 E.02662
G1 X87.582 Y45.531 E.48047
G1 X87.915 Y45.864 E.02662
G1 X93.919 Y39.859 E.48047
G1 X94.1 Y40.04 E.01447
G1 X91.222 Y42.918 E.23032
G1 X91.374 Y43.07 E.01215
G1 X88.104 Y46.34 E.26161
G1 X83.562 Y47.555 F30000
G1 F3000
G1 X86.743 Y44.374 E.25452
G1 X86.411 Y44.041 E.02662
G1 X83.373 Y47.079 E.24307
G1 X83.04 Y46.746 E.02662
G1 X86.078 Y43.708 E.24307
G1 X85.745 Y43.376 E.02662
G1 X82.707 Y46.413 E.24307
G1 X82.375 Y46.081 E.02662
G1 X85.413 Y43.043 E.24307
G1 X85.08 Y42.71 E.02662
G1 X81.899 Y45.891 E.25452
G1 X79.272 Y43.264 F30000
; LINE_WIDTH: 0.4531
G1 F3000
G1 X82.453 Y40.083 E.29553
G1 X82.097 Y39.728 E.03305
G1 X79.059 Y42.765 E.28223
G1 X78.704 Y42.41 E.03305
G1 X81.741 Y39.372 E.28223
G1 X81.555 Y39.185 E.01735
G1 X84.362 Y36.377 E.26086
G1 X84.549 Y36.564 E.01735
G1 X87.202 Y33.911 E.24651
G1 X87.914 Y33.911 E.04674
G1 X84.905 Y36.92 E.27956
G1 X85.261 Y37.276 E.03305
G1 X88.29 Y34.246 E.28147
G1 X88.226 Y34.67 E.02819
G1 X88.376 Y34.872 E.01651
G1 X85.473 Y37.775 E.2697
G1 X87.102 Y40.841 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.57158
; LAYER_HEIGHT: 0.2
G1 F12484.394
G1 X87.253 Y40.521 E.01526
; LINE_WIDTH: 0.547285
G1 F13085.762
G1 X87.473 Y40.273 E.01361
; LINE_WIDTH: 0.476639
G1 F15000
G3 X88.374 Y39.344 I8.243 J7.094 E.04577
G1 X88.488 Y38.62 E.0259
G1 X87.387 Y39.721 E.055
; LINE_WIDTH: 0.498695
G1 F14480.829
G1 X87.14 Y39.94 E.0123
; LINE_WIDTH: 0.566435
G1 F12607.092
G1 X86.892 Y40.16 E.01412
M73 P54 R29
G1 X86.46 Y40.317 E.01963
G1 X86.859 Y40.598 E.02083
G1 X87.06 Y40.799 E.0121
G1 X87.114 Y41.494 F30000
; LINE_WIDTH: 0.415603
G1 F15000
G1 X87.511 Y41.097 E.01704
G1 X87.634 Y40.766 E.01071
G1 X87.978 Y40.311 E.01732
G1 X88.79 Y39.5 E.03486
G1 X88.779 Y39.27 E.00699
G1 X88.887 Y38.658 E.01887
G1 X89.127 Y38.162 E.01674
G1 X88.375 Y38.161 E.02285
G1 X87.102 Y39.435 E.05468
G1 X86.667 Y39.767 E.01662
G1 X86.002 Y40.009 E.0215
G3 X85.117 Y39.967 I-.322 J-2.535 E.02705
G1 X84.86 Y39.867 E.00837
G3 X84.857 Y40.355 I-.856 J.239 E.01502
G3 X85.51 Y40.372 I.289 J1.452 E.01999
G1 X85.939 Y40.501 E.01361
G1 X86.522 Y40.902 E.0215
G1 X87.072 Y41.451 E.02359
G1 X87.114 Y42.027 F30000
; LINE_WIDTH: 0.41999
G1 F15000
G1 X87.873 Y41.268 E.03297
G1 X87.855 Y41.185 E.00261
G1 X88.095 Y40.75 E.01527
G3 X89.202 Y39.621 I41.145 J39.245 E.04858
G1 X89.155 Y39.279 E.0106
G1 X89.244 Y38.779 E.01562
G1 X89.485 Y38.298 E.01652
G1 X89.54 Y38.106 E.00616
G1 X89.537 Y38.065 E.00125
G1 X89.415 Y37.874 E.00695
G1 X89.188 Y37.785 E.00751
G1 X88.219 Y37.784 E.02976
G1 X86.835 Y39.168 E.06013
G1 X86.479 Y39.44 E.01376
G1 X85.935 Y39.638 E.0178
G3 X84.838 Y39.466 I-.269 J-1.865 E.03463
G1 X84.435 Y39.168 E.0154
G1 X84.362 Y39.095 E.00317
G1 X84.242 Y39.216 E.00524
G1 X84.478 Y39.745 E.01781
G1 X84.524 Y40.14 E.01223
G1 X84.437 Y40.677 E.0167
G1 X84.277 Y40.935 E.00934
G1 X84.535 Y40.775 E.00934
G1 X85.072 Y40.688 E.0167
G3 X85.782 Y40.843 I.001 J1.696 E.0225
G1 X86.259 Y41.172 E.0178
G1 X87.072 Y41.985 E.03533
G1 X87.114 Y42.56 F30000
G1 F15000
G1 X88.235 Y41.44 E.0487
G1 X88.208 Y41.317 E.00386
G1 X88.434 Y40.93 E.01377
G3 X89.613 Y39.743 I118.226 J116.338 E.05141
G1 X89.532 Y39.343 E.01256
G1 X89.601 Y38.9 E.01377
G1 X89.831 Y38.453 E.01544
G1 X89.915 Y38.186 E.00859
G1 X89.911 Y38.021 E.00507
G1 X89.782 Y37.716 E.01017
G1 X89.572 Y37.528 E.00867
G1 X89.237 Y37.408 E.01092
G1 X88.063 Y37.407 E.03608
G1 X86.568 Y38.901 E.06494
G1 X86.292 Y39.113 E.0107
G1 X85.868 Y39.267 E.01384
G1 X85.355 Y39.258 E.01578
G1 X85.015 Y39.133 E.01111
G3 X84.362 Y38.562 I1.647 J-2.541 E.02675
G1 X83.739 Y39.185 E.02709
G1 X83.965 Y39.471 E.0112
G1 X84.111 Y39.833 E.01198
G1 X84.147 Y40.14 E.00951
G1 X84.079 Y40.557 E.01299
; LINE_WIDTH: 0.439845
G1 X83.934 Y40.829 E.00997
; LINE_WIDTH: 0.498076
G1 F14500.518
G1 X83.789 Y41.101 E.01143
G1 X82.424 Y42.465 E.07155
G1 X82.631 Y42.687 E.01124
G1 X82.78 Y42.755 E.00608
G1 X84.111 Y41.424 E.06985
; LINE_WIDTH: 0.479555
G1 F15000
G1 X84.383 Y41.278 E.01096
; LINE_WIDTH: 0.421862
G1 X84.655 Y41.133 E.00952
G1 X85.125 Y41.066 E.01465
G1 X85.624 Y41.186 E.01586
G1 X86.006 Y41.452 E.01436
G1 X87.072 Y42.518 E.04655
G1 X87.114 Y43.094 F30000
; LINE_WIDTH: 0.41999
G1 F15000
G1 X88.597 Y41.611 E.06443
G1 X88.562 Y41.449 E.0051
G1 X88.723 Y41.172 E.00984
G3 X90.025 Y39.865 I176.632 J174.642 E.0567
G1 X89.909 Y39.337 E.01661
G1 X89.959 Y39.02 E.00984
G1 X90.219 Y38.536 E.01689
G1 X90.3 Y38.13 E.01272
G1 X90.287 Y37.986 E.00445
G2 X89.478 Y37.082 I-1.134 J.201 E.03924
G1 X89.14 Y37.031 E.01051
G1 X87.907 Y37.03 E.03789
G1 X86.302 Y38.635 E.06975
G1 X86.104 Y38.786 E.00764
G1 X85.802 Y38.896 E.00989
G1 X85.398 Y38.881 E.0124
G3 X84.96 Y38.626 I.237 J-.913 E.01577
G1 X84.362 Y38.029 E.02596
G1 X83.206 Y39.185 E.05026
G1 X83.637 Y39.657 E.01963
G3 X83.721 Y40.438 I-.886 J.491 E.0248
G1 X83.494 Y40.806 E.0133
G1 X81.931 Y42.369 E.06789
G1 X82.062 Y42.674 E.01021
G1 X82.323 Y42.973 E.01219
G1 X82.715 Y43.185 E.0137
G1 X82.917 Y43.208 E.00623
G1 X84.406 Y41.718 E.06471
G1 X84.774 Y41.491 E.0133
G1 X85.11 Y41.443 E.01041
G1 X85.467 Y41.529 E.01127
G1 X85.739 Y41.718 E.01021
G1 X87.072 Y43.051 E.05791
G1 X87.163 Y43.578 F30000
G1 F15000
G1 X88.959 Y41.782 E.07802
G1 X88.915 Y41.58 E.00635
G1 X89.045 Y41.378 E.00739
G1 X90.489 Y39.934 E.06275
G1 X90.361 Y39.708 E.00799
G1 X90.286 Y39.308 E.0125
G1 X90.363 Y39.037 E.00864
G1 X90.611 Y38.545 E.01694
G1 X90.679 Y38.132 E.01284
G2 X90.141 Y36.993 I-1.596 J.057 E.03979
G1 X89.786 Y36.774 E.01282
G1 X89.336 Y36.654 E.01429
G1 X87.751 Y36.652 E.04872
G1 X86.035 Y38.368 E.07455
G1 X85.917 Y38.459 E.00459
G1 X85.613 Y38.533 E.00961
G1 X85.37 Y38.468 E.00775
G1 X85.227 Y38.359 E.00551
G1 X84.362 Y37.495 E.03755
G1 X82.673 Y39.185 E.07343
G1 X83.227 Y39.74 E.0241
G1 X83.377 Y40.008 E.00945
G1 X83.364 Y40.319 E.00955
G1 X83.227 Y40.54 E.00798
G1 X81.534 Y42.233 E.07359
G1 X81.584 Y42.521 E.00898
G1 X81.755 Y42.894 E.01261
G1 X82.021 Y43.213 E.01276
G2 X83.061 Y43.597 I1.024 J-1.172 E.03482
G1 X84.673 Y41.985 E.07004
G1 X84.894 Y41.849 E.00798
G1 X85.193 Y41.832 E.0092
G1 X85.473 Y41.985 E.0098
G1 X87.085 Y43.598 E.07009
G1 X87.105 Y43.593 E.00063
G1 X87.299 Y43.975 F30000
G1 F15000
G1 X89.337 Y41.937 E.08857
G1 X89.268 Y41.712 E.00723
G3 X90.947 Y40.009 I48.459 J46.093 E.07348
G1 X90.689 Y39.522 E.01693
G1 X90.673 Y39.262 E.00802
G1 X90.914 Y38.841 E.01489
G1 X91.038 Y38.33 E.01615
G2 X90.719 Y37.064 I-2.01 J-.169 E.04086
G1 X90.383 Y36.699 E.01524
G1 X89.937 Y36.424 E.01611
G1 X89.386 Y36.277 E.01751
G1 X87.595 Y36.275 E.05504
G1 X85.768 Y38.102 E.07936
G1 X85.628 Y38.157 E.00464
G1 X85.493 Y38.093 E.00457
G1 X84.362 Y36.962 E.04914
G1 X82.139 Y39.185 E.0966
G1 X82.961 Y40.006 E.03569
G1 X83.016 Y40.14 E.00444
G1 X82.961 Y40.273 E.00443
G1 X81.156 Y42.077 E.0784
G1 X81.205 Y42.59 E.01583
G1 X81.368 Y43.001 E.01359
G1 X81.649 Y43.393 E.01482
G1 X82.001 Y43.686 E.01408
G1 X82.48 Y43.906 E.01619
G2 X83.216 Y43.975 I.582 J-2.266 E.02282
G1 X84.939 Y42.252 E.07487
G1 X85.08 Y42.197 E.00464
G1 X85.206 Y42.252 E.00422
G1 X86.929 Y43.975 E.07488
G1 X87.239 Y43.975 E.00952
G1 X92.393 Y42.353 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X91.828 Y42.918 E.02652
G1 X91.987 Y43.077 E.00746
G1 X91.56 Y43.504 E.02003
G1 X102.039 Y53.983 E.49159
G1 X102.148 Y53.983 E.00362
G1 X121.865 Y34.267 E.92495
G1 X122.621 Y34.267 E.02508
G1 X128.582 Y40.228 E.27965
G2 X127.407 Y40.238 I-.549 J4.347 E.03909
G1 X133.379 Y34.267 E.28014
G1 X134.135 Y34.267 E.02508
G1 X153.852 Y53.983 E.92495
G1 X153.961 Y53.983 E.00362
G1 X173.678 Y34.267 E.92495
G1 X174.434 Y34.267 E.02508
G1 X194.151 Y53.983 E.92495
G1 X194.26 Y53.983 E.00362
G1 X213.976 Y34.267 E.92495
G1 X214.733 Y34.267 E.02508
G1 X225.858 Y45.392 E.52193
G1 X206.142 Y65.129 E.92542
G1 X206.142 Y65.974 E.02804
G1 X225.858 Y85.691 E.92495
G1 X206.142 Y105.428 E.92542
G1 X206.142 Y106.273 E.02804
G1 X225.858 Y125.99 E.92495
G1 X206.142 Y145.727 E.92542
G1 X206.142 Y146.572 E.02804
G1 X225.858 Y166.309 E.92542
G1 X206.142 Y186.026 E.92495
G1 X206.142 Y186.871 E.02804
G1 X225.858 Y206.608 E.92542
G1 X214.733 Y217.733 E.52193
G1 X213.976 Y217.733 E.02508
G1 X194.26 Y198.017 E.92495
G1 X194.151 Y198.017 E.00362
G1 X174.434 Y217.733 E.92495
G1 X173.678 Y217.733 E.02508
G1 X153.961 Y198.017 E.92495
G1 X153.852 Y198.017 E.00362
G1 X134.135 Y217.733 E.92495
G1 X133.379 Y217.733 E.02508
G1 X127.418 Y211.773 E.27963
G2 X128.582 Y211.772 I.581 J-6.313 E.03867
G1 X122.621 Y217.733 E.27965
G1 X121.865 Y217.733 E.02508
G1 X102.148 Y198.017 E.92495
G1 X102.039 Y198.017 E.00362
G1 X82.322 Y217.733 E.92495
G1 X81.566 Y217.733 E.02508
G1 X61.849 Y198.017 E.92495
G1 X61.74 Y198.017 E.00362
G1 X42.024 Y217.733 E.92495
G1 X41.267 Y217.733 E.02508
G1 X30.142 Y206.608 E.52193
G1 X49.858 Y186.871 E.92542
G1 X49.858 Y186.026 E.02804
G1 X30.142 Y166.309 E.92495
G1 X49.858 Y146.572 E.92542
G1 X49.858 Y145.727 E.02804
G1 X30.142 Y126.01 E.92495
G1 X49.858 Y106.273 E.92542
G1 X49.858 Y105.428 E.02804
G1 X30.142 Y85.691 E.92542
G1 X49.858 Y65.974 E.92495
G1 X49.858 Y65.129 E.02804
G1 X30.142 Y45.392 E.92542
G1 X41.267 Y34.267 E.52193
G1 X42.024 Y34.267 E.02508
G1 X61.74 Y53.983 E.92495
G1 X61.849 Y53.983 E.00362
G1 X81.566 Y34.267 E.92495
G1 X82.322 Y34.267 E.02508
G1 X82.84 Y34.784 E.02427
G1 X79.961 Y37.662 E.13504
G1 X76.565 Y34.267 E.15931
G1 X75.809 Y34.267 E.02508
G1 X56.092 Y53.983 E.92495
G1 X55.983 Y53.983 E.00362
G1 X36.267 Y34.267 E.92495
G1 X35.51 Y34.267 E.02508
G1 X30.142 Y39.656 E.25233
G1 X36.594 Y46.108 E.30271
G2 X38.025 Y47.539 I3.851 J-2.42 E.06769
G1 X49.858 Y59.372 E.55511
G1 X49.858 Y60.217 E.02804
G1 X30.142 Y79.954 E.92542
G1 X49.858 Y99.671 E.92495
G1 X49.858 Y100.516 E.02804
G1 X30.142 Y120.233 E.92495
G1 X36.061 Y126.172 E.27814
G1 X36.061 Y125.828 E.01142
G1 X30.142 Y131.767 E.27814
G1 X49.858 Y151.484 E.92495
G1 X49.858 Y152.329 E.02804
G1 X30.142 Y172.066 E.92542
G1 X49.858 Y191.783 E.92495
G1 X49.858 Y192.628 E.02804
G1 X38.025 Y204.461 E.55512
G2 X36.595 Y205.892 I2.42 J3.851 E.06768
G1 X30.142 Y212.344 E.30272
G1 X35.51 Y217.733 E.25234
G1 X36.267 Y217.733 E.02508
G1 X55.983 Y198.017 E.92495
G1 X56.092 Y198.017 E.00362
G1 X75.809 Y217.733 E.92495
G1 X76.565 Y217.733 E.02508
G1 X96.282 Y198.017 E.92495
G1 X96.391 Y198.017 E.00362
G1 X116.108 Y217.733 E.92495
G1 X116.864 Y217.733 E.02508
G1 X124.647 Y209.95 E.36512
G3 X124.099 Y208.453 I4.461 J-2.483 E.05311
G1 X113.662 Y198.017 E.4896
G1 X113.553 Y198.017 E.00362
G1 X93.836 Y217.733 E.92495
G1 X93.08 Y217.733 E.02508
G1 X73.363 Y198.017 E.92495
G1 X73.254 Y198.017 E.00362
G1 X53.537 Y217.733 E.92495
G1 X52.781 Y217.733 E.02508
G1 X43.833 Y208.785 E.41977
G2 X42.965 Y205.278 I-3.843 J-.909 E.12448
G1 X50.226 Y198.017 E.34066
G1 X50.336 Y198.017 E.00362
G1 X70.052 Y217.733 E.92495
G1 X70.808 Y217.733 E.02508
G1 X90.525 Y198.017 E.92495
G1 X90.634 Y198.017 E.00362
G1 X110.351 Y217.733 E.92495
G1 X111.107 Y217.733 E.02508
G1 X130.824 Y198.017 E.92495
G1 X130.933 Y198.017 E.00362
G1 X150.65 Y217.733 E.92495
G1 X151.406 Y217.733 E.02508
G1 X171.123 Y198.017 E.92495
G1 X171.232 Y198.017 E.00362
G1 X190.949 Y217.733 E.92495
G1 X191.705 Y217.733 E.02508
G1 X225.858 Y183.58 E1.60222
G1 X206.142 Y163.843 E.92542
G1 X206.142 Y162.998 E.02804
G1 X225.858 Y143.281 E.92495
G1 X206.142 Y123.544 E.92542
G1 X206.142 Y122.699 E.02804
G1 X225.858 Y102.982 E.92495
G1 X206.142 Y83.245 E.92542
G1 X206.142 Y82.4 E.02804
G1 X225.858 Y62.663 E.92542
G1 X197.462 Y34.267 E1.33215
G1 X196.706 Y34.267 E.02508
G1 X176.989 Y53.983 E.92495
G1 X176.88 Y53.983 E.00362
G1 X157.163 Y34.267 E.92495
G1 X156.407 Y34.267 E.02508
G1 X136.69 Y53.983 E.92495
G1 X136.581 Y53.983 E.00362
G1 X130.074 Y47.476 E.30525
G3 X125.927 Y47.476 I-2.073 J-3.461 E.14448
G1 X119.419 Y53.983 E.30529
G1 X119.31 Y53.983 E.00362
G1 X99.593 Y34.267 E.92495
G1 X98.837 Y34.267 E.02508
G1 X93.885 Y39.219 E.23231
G1 X94.706 Y40.04 E.03853
G1 X94.279 Y40.467 E.02003
G1 X107.796 Y53.983 E.63409
G1 X107.905 Y53.983 E.00362
G1 X127.622 Y34.267 E.92495
G1 X128.378 Y34.267 E.02508
G1 X148.095 Y53.983 E.92495
G1 X148.204 Y53.983 E.00362
G1 X167.921 Y34.267 E.92495
G1 X168.677 Y34.267 E.02508
G1 X188.394 Y53.983 E.92495
G1 X188.503 Y53.983 E.00362
G1 X208.219 Y34.267 E.92495
G1 X208.976 Y34.267 E.02508
G1 X215.018 Y40.309 E.28346
G3 X218.596 Y41.161 I.948 J3.953 E.1266
G1 X225.49 Y34.267 E.32345
G1 X225.858 Y34.267 E.01221
G1 X225.858 Y35.527 E.04181
G1 X91.229 Y39.668 F30000
G1 F16200
G1 X92.374 Y38.561 E.05282
G1 X91.37 Y37.557 E.04709
G2 X90.798 Y36.549 I-2.181 J.571 E.03889
G1 X93.08 Y34.267 E.10707
G1 X93.836 Y34.267 E.02508
G1 X113.553 Y53.983 E.92495
G1 X113.662 Y53.983 E.00362
G1 X124.099 Y43.547 E.4896
G3 X124.647 Y42.05 I5.014 J.987 E.05311
G1 X116.864 Y34.267 E.36511
G1 X116.108 Y34.267 E.02508
G1 X96.391 Y53.983 E.92495
G1 X96.282 Y53.983 E.00362
G1 X88.682 Y46.383 E.35656
G1 X88.255 Y46.81 E.02003
G1 X87.274 Y45.829 E.04599
G1 X79.12 Y53.983 E.38252
G1 X79.011 Y53.983 E.00362
G1 X59.294 Y34.267 E.92495
G1 X58.538 Y34.267 E.02508
G1 X30.142 Y62.663 E1.33215
G1 X49.858 Y82.4 E.92542
G1 X49.858 Y83.245 E.02804
G1 X30.142 Y102.962 E.92495
G1 X49.858 Y122.699 E.92542
G1 X49.858 Y123.544 E.02804
G1 X30.142 Y143.261 E.92495
G1 X49.858 Y162.998 E.92542
G1 X49.858 Y163.843 E.02804
G1 X30.142 Y183.58 E.92542
G1 X64.295 Y217.733 E1.60222
G1 X65.051 Y217.733 E.02508
G1 X84.768 Y198.017 E.92495
G1 X84.877 Y198.017 E.00362
G1 X104.594 Y217.733 E.92495
G1 X105.35 Y217.733 E.02508
G1 X125.067 Y198.017 E.92495
G1 X125.176 Y198.017 E.00362
G1 X144.893 Y217.733 E.92495
G1 X145.649 Y217.733 E.02508
G1 X165.366 Y198.017 E.92495
G1 X165.475 Y198.017 E.00362
G1 X185.192 Y217.733 E.92495
G1 X185.948 Y217.733 E.02508
G1 X205.664 Y198.017 E.92495
G1 X205.774 Y198.017 E.00362
G1 X213.036 Y205.279 E.34069
G2 X212.165 Y208.787 I3.111 J2.634 E.12422
G1 X203.219 Y217.733 E.4197
G1 X202.462 Y217.733 E.02508
G1 X182.746 Y198.017 E.92495
G1 X182.637 Y198.017 E.00362
G1 X162.92 Y217.733 E.92495
G1 X162.164 Y217.733 E.02508
G1 X142.447 Y198.017 E.92495
G1 X142.338 Y198.017 E.00362
G1 X131.896 Y208.459 E.48985
G3 X131.35 Y209.948 I-3.898 J-.584 E.05297
G1 X139.136 Y217.733 E.36524
G1 X139.892 Y217.733 E.02508
G1 X159.609 Y198.017 E.92495
G1 X159.718 Y198.017 E.00362
G1 X179.435 Y217.733 E.92495
G1 X180.191 Y217.733 E.02508
G1 X199.908 Y198.017 E.92495
G1 X200.017 Y198.017 E.00362
G1 X219.733 Y217.733 E.92495
G1 X220.49 Y217.733 E.02508
G1 X225.858 Y212.344 E.25233
G1 X219.403 Y205.889 E.30281
G2 X217.988 Y204.474 I-3.771 J2.355 E.06699
G1 X206.142 Y192.628 E.55573
G1 X206.142 Y191.783 E.02804
G1 X225.858 Y172.046 E.92542
G1 X206.142 Y152.329 E.92495
G1 X206.142 Y151.484 E.02804
G1 X225.858 Y131.767 E.92495
G1 X219.936 Y125.824 E.27833
G1 X219.936 Y126.176 E.01167
G1 X225.858 Y120.233 E.27833
G1 X206.142 Y100.516 E.92495
G1 X206.142 Y99.671 E.02804
G1 X225.858 Y79.934 E.92542
G1 X206.142 Y60.217 E.92495
G1 X206.142 Y59.372 E.02804
G1 X217.988 Y47.526 E.55573
G2 X219.403 Y46.111 I-2.356 J-3.771 E.06698
G1 X225.858 Y39.656 E.30282
G1 X220.49 Y34.267 E.25234
M73 P55 R29
G1 X219.733 Y34.267 E.02508
G1 X200.017 Y53.983 E.92495
G1 X199.908 Y53.983 E.00362
G1 X180.191 Y34.267 E.92495
G1 X179.435 Y34.267 E.02508
G1 X159.718 Y53.983 E.92495
G1 X159.609 Y53.983 E.00362
G1 X139.892 Y34.267 E.92495
G1 X139.136 Y34.267 E.02508
G1 X131.35 Y42.052 E.36524
G3 X131.896 Y43.541 I-3.352 J2.073 E.05297
G1 X142.338 Y53.983 E.48985
G1 X142.447 Y53.983 E.00362
G1 X162.164 Y34.267 E.92495
G1 X162.92 Y34.267 E.02508
G1 X182.637 Y53.983 E.92495
G1 X182.746 Y53.983 E.00362
G1 X202.463 Y34.267 E.92495
G1 X203.219 Y34.267 E.02508
G1 X212.165 Y43.213 E.4197
G2 X213.036 Y46.721 I3.981 J.874 E.12422
G1 X205.774 Y53.983 E.34069
G1 X205.664 Y53.983 E.00362
G1 X185.948 Y34.267 E.92495
G1 X185.192 Y34.267 E.02508
G1 X165.475 Y53.983 E.92495
G1 X165.366 Y53.983 E.00362
G1 X145.649 Y34.267 E.92495
G1 X144.893 Y34.267 E.02508
G1 X125.176 Y53.983 E.92495
G1 X125.067 Y53.983 E.00362
G1 X105.35 Y34.267 E.92495
G1 X104.594 Y34.267 E.02508
G1 X84.877 Y53.983 E.92495
G1 X84.768 Y53.983 E.00362
G1 X65.051 Y34.267 E.92495
G1 X64.295 Y34.267 E.02508
G1 X30.142 Y68.42 E1.60222
G1 X49.858 Y88.157 E.92542
G1 X49.858 Y89.002 E.02804
G1 X30.142 Y108.719 E.92495
G1 X49.858 Y128.456 E.92542
G1 X49.858 Y129.301 E.02804
G1 X30.142 Y149.018 E.92495
G1 X49.858 Y168.755 E.92542
G1 X49.858 Y169.6 E.02804
G1 X30.142 Y189.337 E.92542
G1 X58.538 Y217.733 E1.33215
G1 X59.294 Y217.733 E.02508
G1 X79.011 Y198.017 E.92495
G1 X79.12 Y198.017 E.00362
G1 X98.837 Y217.733 E.92495
G1 X99.593 Y217.733 E.02508
G1 X119.31 Y198.017 E.92495
G1 X119.419 Y198.017 E.00362
G1 X125.927 Y204.524 E.30529
G3 X130.074 Y204.524 I2.074 J3.358 E.14484
G1 X136.581 Y198.017 E.30525
G1 X136.69 Y198.017 E.00362
G1 X156.407 Y217.733 E.92495
G1 X157.163 Y217.733 E.02508
G1 X176.88 Y198.017 E.92495
G1 X176.989 Y198.017 E.00362
G1 X196.706 Y217.733 E.92495
G1 X197.462 Y217.733 E.02508
G1 X225.858 Y189.337 E1.33215
G1 X206.142 Y169.6 E.92542
G1 X206.142 Y168.755 E.02804
G1 X225.858 Y149.038 E.92495
G1 X206.142 Y129.301 E.92542
G1 X206.142 Y128.456 E.02804
G1 X225.858 Y108.739 E.92495
G1 X206.142 Y89.002 E.92542
G1 X206.142 Y88.157 E.02804
G1 X225.858 Y68.42 E.92542
G1 X191.705 Y34.267 E1.60222
G1 X190.949 Y34.267 E.02508
G1 X171.232 Y53.983 E.92495
G1 X171.123 Y53.983 E.00362
G1 X151.406 Y34.267 E.92495
G1 X150.65 Y34.267 E.02508
G1 X130.933 Y53.983 E.92495
G1 X130.824 Y53.983 E.00362
G1 X111.107 Y34.267 E.92495
G1 X110.351 Y34.267 E.02508
G1 X90.634 Y53.983 E.92495
G1 X90.525 Y53.983 E.00362
G1 X84.371 Y47.829 E.28869
G1 X85.523 Y46.678 E.05401
G1 X78.205 Y42.197 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.4531
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X86.491 Y33.911 E.76986
G1 X85.779 Y33.911 E.04674
G1 X77.992 Y41.698 E.7235
G1 X77.636 Y41.342 E.03305
G1 X83.641 Y35.338 E.55789
G1 X83.285 Y34.982 E.03305
G1 X80.016 Y38.251 E.30376
G1 X88.731 Y33.904 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.382944
; LAYER_HEIGHT: 0.2
G1 F3000;_EXTRUDE_SET_SPEED
G1 X226.062 Y33.904 E3.80512
G1 X226.194 Y33.931 E.00373
G1 X226.221 Y34.063 E.00373
G1 X226.221 Y217.937 E5.0947
G1 X226.194 Y218.069 E.00373
G1 X226.062 Y218.096 E.00373
G1 X29.938 Y218.096 E5.43412
G1 X29.806 Y218.069 E.00373
G1 X29.779 Y217.937 E.00373
G1 X29.779 Y34.063 E5.0947
G1 X29.806 Y33.931 E.00373
G1 X29.938 Y33.904 E.00373
G1 X84.995 Y33.904 E1.52551
; Slow Down End
G1 X89.436 Y34.267 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X88.72 Y34.267 E.02374
G1 X88.676 Y34.558 E.00976
G1 X88.957 Y34.934 E.01558
G1 X88.852 Y35.039 E.00493
G1 X89.764 Y35.951 E.04278
G2 X89.4 Y35.883 I-.529 J1.813 E.01229
G1 X88.142 Y35.883 E.04174
G1 X43.563 Y43.768 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G3 X43.56 Y44.497 I-12.473 J.317 E.02019
G1 X43.416 Y45.195 E.01975
G1 X43.136 Y45.851 E.01975
G1 X42.732 Y46.438 E.01974
G1 X42.22 Y46.933 E.01974
G1 X41.619 Y47.318 E.01975
G1 X40.954 Y47.575 E.01976
G1 X40.252 Y47.696 E.01975
G1 X39.539 Y47.675 E.01975
G1 X38.845 Y47.513 E.01975
G1 X38.197 Y47.217 E.01975
G1 X37.619 Y46.798 E.01976
G1 X37.137 Y46.274 E.01975
G1 X36.768 Y45.664 E.01975
G1 X36.527 Y44.993 E.01975
G1 X36.424 Y44.288 E.01975
G1 X36.463 Y43.576 E.01975
G1 X36.642 Y42.886 E.01975
G1 X36.954 Y42.245 E.01975
G1 X37.387 Y41.679 E.01975
G1 X37.923 Y41.209 E.01975
G1 X38.542 Y40.856 E.01974
G1 X39.221 Y40.631 E.0198
G3 X40.985 Y40.683 I.767 J3.879 E.04931
G1 X41.647 Y40.947 E.01976
G1 X42.244 Y41.336 E.01974
G1 X42.752 Y41.836 E.01976
G1 X43.151 Y42.427 E.01974
G1 X43.425 Y43.085 E.01976
G1 X43.551 Y43.71 E.01765
; Slow Down End
; WIPE_START
G1 X43.425 Y43.085 E-.24212
G1 X43.151 Y42.427 E-.27097
G1 X42.787 Y41.888 E-.24691
; WIPE_END
G1 E-.04 F1800
G1 X35.969 Y38.458 Z2.4 F30000
G1 X30.142 Y35.527 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X30.142 Y34.267 E.04181
G1 X30.51 Y34.267 E.01221
G1 X37.402 Y41.159 E.32331
G3 X40.982 Y40.309 I2.594 J2.958 E.12704
G1 X47.024 Y34.267 E.28344
G1 X47.781 Y34.267 E.02508
G1 X67.497 Y53.983 E.92495
G1 X67.606 Y53.983 E.00362
G1 X78.639 Y42.951 E.51756
G1 X79.471 Y43.783 E.03906
G1 X79.898 Y43.357 E.02003
G1 X81.856 Y45.314 E.09182
G1 X81.429 Y45.741 E.02003
G1 X81.517 Y45.829 E.00415
G1 X73.363 Y53.983 E.38252
G1 X73.254 Y53.983 E.00362
G1 X53.538 Y34.267 E.92495
G1 X52.781 Y34.267 E.02508
G1 X43.833 Y43.215 E.41977
G3 X42.965 Y46.722 I-3.843 J.909 E.12448
G1 X50.226 Y53.983 E.34066
G1 X50.336 Y53.983 E.00362
G1 X70.052 Y34.267 E.92495
G1 X70.808 Y34.267 E.02508
G1 X77.401 Y40.859 E.30927
G1 X78.552 Y39.708 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F16200
G1 X77.401 Y40.859 E-.61876
G1 X77.138 Y40.596 E-.14124
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
G1 X126.58 Y204.991
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F16213.044
G1 X126.679 Y204.948 E.0036
G3 X127.795 Y204.667 I1.33 J2.927 E.03839
G3 X129.175 Y204.879 I.201 J3.288 E.04667
G3 X126.395 Y205.095 I-1.167 J2.996 E.57442
G1 X126.527 Y205.021 E.00503
G1 X127.066 Y205.226 F30000
G1 F16213.044
G1 X127.107 Y205.216 E.0014
G3 X127.826 Y205.073 I.903 J2.66 E.0244
G3 X128.761 Y205.17 I.192 J2.722 E.03135
G3 X126.847 Y205.319 I-.752 J2.706 E.52039
G1 X127.011 Y205.25 E.0059
G1 X127.559 Y205.52 F30000
G1 F16213.044
G1 X127.856 Y205.479 E.00996
G3 X128.651 Y205.562 I.035 J3.517 E.02655
G3 X127.466 Y205.536 I-.643 J2.314 E.4608
G1 X127.5 Y205.53 E.00114
G1 X127.884 Y205.87 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X127.886 Y205.87 E.00006
G3 X128.349 Y205.895 I.113 J2.201 E.01429
G3 X127.553 Y205.919 I-.34 J1.98 E.36316
G1 X127.824 Y205.879 E.00841
; WIPE_START
M204 S10000
G1 X127.886 Y205.87 E-.02353
G1 X128.15 Y205.87 E-.1005
G1 X128.349 Y205.895 E-.07618
G1 X128.734 Y206.004 E-.15213
G1 X129.091 Y206.186 E-.15208
G1 X129.404 Y206.436 E-.15213
G1 X129.579 Y206.644 E-.10346
; WIPE_END
G1 E-.04 F1800
G1 X137.209 Y206.47 Z2.6 F30000
G1 X216.154 Y204.666 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X216.24 Y204.67 E.00287
G3 X217.176 Y204.88 I-.244 J3.285 E.03192
G3 X215.795 Y204.667 I-1.167 J2.996 E.62341
G1 X216.094 Y204.666 E.00989
G1 X216.153 Y205.073 F30000
G1 F16213.044
G1 X216.21 Y205.073 E.00189
G3 X216.761 Y205.17 I-.192 J2.723 E.01859
G3 X215.826 Y205.073 I-.751 J2.706 E.55407
G1 X216.093 Y205.073 E.00886
G1 X216.214 Y205.485 F30000
G1 F16213.044
G1 X216.651 Y205.562 E.01471
G3 X215.856 Y205.479 I-.643 J2.314 E.4739
G3 X216.155 Y205.489 I.035 J3.52 E.0099
G1 X216.094 Y205.87 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X216.15 Y205.872 E.00173
G3 X216.349 Y205.895 I-.151 J2.198 E.00616
G3 X215.886 Y205.87 I-.34 J1.98 E.37349
G1 X216.034 Y205.87 E.00455
; WIPE_START
M204 S10000
G1 X216.15 Y205.872 E-.04421
G1 X216.349 Y205.895 E-.07613
G1 X216.734 Y206.004 E-.15214
G1 X217.091 Y206.186 E-.15207
G1 X217.404 Y206.436 E-.15213
G1 X217.661 Y206.743 E-.15215
G1 X217.7 Y206.815 E-.03117
; WIPE_END
G1 E-.04 F1800
G1 X217.641 Y199.182 Z2.6 F30000
G1 X217.047 Y122.961 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X217.176 Y123.004 E.00449
G3 X215.796 Y122.792 I-1.167 J2.996 E.62342
G3 X216.871 Y122.904 I.201 J3.288 E.03603
G1 X216.99 Y122.943 E.00416
G1 X216.602 Y123.258 F30000
G1 F16213.044
G1 X216.761 Y123.295 E.00542
G3 X215.826 Y123.198 I-.751 J2.706 E.55407
G3 X216.488 Y123.232 I.192 J2.724 E.02204
G1 X216.543 Y123.245 E.00189
G1 X216.225 Y123.612 F30000
G1 F16213.044
G1 X216.651 Y123.687 E.01436
G3 X215.856 Y123.604 I-.643 J2.314 E.4739
G3 X216.165 Y123.615 I.034 J3.522 E.01024
G1 X215.891 Y123.995 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X216.15 Y123.997 E.00797
G3 X216.349 Y124.02 I-.151 J2.198 E.00616
G3 X215.831 Y123.999 I-.34 J1.98 E.37181
; WIPE_START
M204 S10000
G1 X216.15 Y123.997 E-.12124
G1 X216.349 Y124.02 E-.07613
G1 X216.735 Y124.129 E-.15215
G1 X217.091 Y124.311 E-.1521
G1 X217.404 Y124.561 E-.1521
G1 X217.583 Y124.775 E-.10629
; WIPE_END
G1 E-.04 F1800
G1 X217.535 Y117.143 Z2.6 F30000
G1 X217.047 Y41.086 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X217.176 Y41.129 E.00449
G3 X215.796 Y40.917 I-1.167 J2.996 E.62342
G3 X216.871 Y41.029 I.201 J3.288 E.03603
G1 X216.99 Y41.068 E.00417
G1 X216.602 Y41.383 F30000
G1 F16213.044
G1 X216.761 Y41.42 E.00542
G3 X215.826 Y41.323 I-.751 J2.706 E.55408
G3 X216.488 Y41.357 I.192 J2.725 E.02204
G1 X216.543 Y41.37 E.00188
G1 X216.225 Y41.737 F30000
G1 F16213.044
G1 X216.651 Y41.812 E.01436
G3 X215.856 Y41.729 I-.643 J2.314 E.4739
G3 X216.165 Y41.74 I.034 J3.522 E.01024
G1 X215.891 Y42.12 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X216.15 Y42.122 E.00797
G3 X216.349 Y42.145 I-.151 J2.198 E.00616
G3 X215.831 Y42.124 I-.34 J1.98 E.37181
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
G1 F16213.044
G1 X126.679 Y41.198 E.00359
G3 X127.796 Y40.917 I1.33 J2.927 E.03839
G3 X129.176 Y41.129 I.201 J3.288 E.04667
G3 X126.395 Y41.345 I-1.167 J2.996 E.57441
G1 X126.528 Y41.27 E.00505
G1 X127.066 Y41.476 F30000
G1 F16213.044
G1 X127.107 Y41.466 E.00138
G3 X127.826 Y41.323 I.903 J2.66 E.0244
G3 X128.761 Y41.42 I.192 J2.724 E.03134
G3 X126.847 Y41.569 I-.751 J2.706 E.5204
G1 X127.011 Y41.5 E.00592
G1 X127.56 Y41.77 F30000
G1 F16213.044
G1 X127.856 Y41.729 E.00994
G3 X128.651 Y41.812 I.034 J3.521 E.02655
G3 X127.466 Y41.786 I-.643 J2.314 E.4608
G1 X127.5 Y41.78 E.00115
G1 X127.891 Y42.12 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X128.15 Y42.122 E.00796
G3 X128.349 Y42.145 I-.151 J2.198 E.00616
G3 X127.831 Y42.124 I-.34 J1.98 E.37181
; WIPE_START
M204 S10000
G1 X128.15 Y42.122 E-.12118
G1 X128.349 Y42.145 E-.07614
G1 X128.734 Y42.254 E-.15213
G1 X129.091 Y42.436 E-.15212
G1 X129.404 Y42.686 E-.1521
G1 X129.583 Y42.9 E-.10634
; WIPE_END
G1 E-.04 F1800
G1 X121.953 Y42.744 Z2.6 F30000
G1 X41.047 Y41.086 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X41.176 Y41.129 E.00449
G3 X39.795 Y40.917 I-1.167 J2.996 E.62342
G3 X40.871 Y41.029 I.201 J3.288 E.03603
G1 X40.99 Y41.068 E.00416
G1 X40.602 Y41.383 F30000
G1 F16213.044
G1 X40.761 Y41.42 E.00542
G3 X39.826 Y41.323 I-.751 J2.706 E.55407
G3 X40.488 Y41.357 I.192 J2.724 E.02204
G1 X40.543 Y41.37 E.00188
G1 X40.225 Y41.737 F30000
G1 F16213.044
G1 X40.651 Y41.812 E.01436
G3 X39.856 Y41.729 I-.643 J2.314 E.4739
G3 X40.165 Y41.74 I.034 J3.521 E.01024
G1 X39.891 Y42.12 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X40.15 Y42.122 E.00797
G3 X40.349 Y42.145 I-.151 J2.198 E.00616
G3 X39.831 Y42.124 I-.34 J1.98 E.37181
; WIPE_START
M204 S10000
G1 X40.15 Y42.122 E-.12124
G1 X40.349 Y42.145 E-.07614
G1 X40.734 Y42.254 E-.15213
G1 X41.091 Y42.436 E-.15214
G1 X41.404 Y42.686 E-.15207
G1 X41.583 Y42.9 E-.10629
; WIPE_END
G1 E-.04 F1800
G1 X47.138 Y48.135 Z2.6 F30000
G1 X205.416 Y197.291 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X50.584 Y197.291 E5.13608
G1 X50.584 Y54.709 E4.72972
G1 X205.416 Y54.709 E5.13608
G1 X205.416 Y197.231 E4.72773
G1 X205.009 Y196.884 F30000
G1 F16213.044
G1 X50.991 Y196.884 E5.10907
G1 X50.991 Y55.116 E4.70271
G1 X205.009 Y55.116 E5.10907
G1 X205.009 Y196.824 E4.70072
G1 X204.602 Y196.477 F30000
G1 F16213.044
G1 X51.398 Y196.477 E5.08206
G1 X51.398 Y55.523 E4.67571
G1 X204.602 Y55.523 E5.08206
G1 X204.602 Y196.417 E4.67372
G1 X204.21 Y196.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X51.79 Y196.085 E4.68344
G1 X51.79 Y55.915 E4.30703
G1 X204.21 Y55.915 E4.68344
G1 X204.21 Y196.025 E4.30519
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
G1 F16213.044
G1 X41.176 Y123.004 E.00449
G3 X39.796 Y122.792 I-1.167 J2.996 E.62342
G3 X40.871 Y122.904 I.201 J3.289 E.03603
G1 X40.99 Y122.943 E.00415
G1 X40.602 Y123.258 F30000
G1 F16213.044
G1 X40.761 Y123.295 E.00542
G3 X39.826 Y123.198 I-.752 J2.706 E.55407
G3 X40.488 Y123.232 I.192 J2.724 E.02204
G1 X40.543 Y123.245 E.00189
G1 X40.225 Y123.612 F30000
G1 F16213.044
G1 X40.651 Y123.687 E.01436
G3 X39.856 Y123.604 I-.643 J2.314 E.4739
G3 X40.165 Y123.615 I.034 J3.521 E.01024
G1 X39.891 Y123.995 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X40.15 Y123.997 E.00797
G3 X40.349 Y124.02 I-.151 J2.198 E.00616
G3 X39.831 Y123.999 I-.34 J1.98 E.3718
; WIPE_START
M204 S10000
G1 X40.15 Y123.997 E-.12127
G1 X40.349 Y124.02 E-.07614
G1 X40.734 Y124.129 E-.15213
G1 X41.091 Y124.311 E-.15212
G1 X41.404 Y124.561 E-.15209
G1 X41.583 Y124.775 E-.10626
; WIPE_END
G1 E-.04 F1800
G1 X41.447 Y132.406 Z2.6 F30000
G1 X40.154 Y204.666 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X40.24 Y204.67 E.00287
G3 X41.176 Y204.879 I-.244 J3.284 E.03191
G3 X39.795 Y204.667 I-1.167 J2.996 E.62342
G1 X40.094 Y204.666 E.00989
M73 P56 R29
G1 X40.153 Y205.073 F30000
G1 F16213.044
G1 X40.21 Y205.073 E.00189
G3 X40.761 Y205.17 I-.192 J2.722 E.0186
M73 P56 R28
G3 X39.826 Y205.073 I-.752 J2.706 E.55407
G1 X40.093 Y205.073 E.00886
G1 X40.214 Y205.485 F30000
G1 F16213.044
G1 X40.651 Y205.562 E.01471
G3 X39.856 Y205.479 I-.643 J2.314 E.47389
G3 X40.155 Y205.489 I.035 J3.518 E.0099
G1 X40.094 Y205.87 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X40.15 Y205.872 E.00173
G3 X40.349 Y205.895 I-.151 J2.198 E.00616
G3 X39.886 Y205.87 I-.34 J1.98 E.37349
G1 X40.034 Y205.87 E.00455
; WIPE_START
M204 S10000
G1 X40.15 Y205.872 E-.0442
G1 X40.349 Y205.895 E-.07614
G1 X40.734 Y206.004 E-.15213
G1 X41.091 Y206.186 E-.15212
G1 X41.404 Y206.436 E-.1521
G1 X41.661 Y206.743 E-.15215
G1 X41.7 Y206.815 E-.03117
; WIPE_END
G1 E-.04 F1800
G1 X49.318 Y207.294 Z2.6 F30000
G1 X226.584 Y218.459 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X29.416 Y218.459 E6.54041
G1 X29.416 Y33.541 E6.13406
G1 X226.584 Y33.541 E6.54041
G1 X226.584 Y218.399 E6.13207
G1 X226.991 Y218.866 F30000
G1 F16213.044
G1 X29.009 Y218.866 E6.56742
G1 X29.009 Y33.134 E6.16106
G1 X226.991 Y33.134 E6.56742
G1 X226.991 Y218.806 E6.15907
G1 X227.398 Y219.273 F30000
G1 F16213.044
G1 X28.602 Y219.273 E6.59442
G1 X28.602 Y32.727 E6.18807
G1 X227.398 Y32.727 E6.59442
G1 X227.398 Y219.213 E6.18608
G1 X227.79 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X28.21 Y219.665 E6.13254
G1 X28.21 Y32.335 E5.75613
G1 X227.79 Y32.335 E6.13254
G1 X227.79 Y219.605 E5.75429
; WIPE_START
M204 S10000
G1 X225.79 Y219.606 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X225.506 Y218.292 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40035
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X226.214 Y217.584 E.05135
G1 X226.214 Y216.947 E.03266
G1 X225.072 Y218.089 E.08286
G1 X224.435 Y218.089 E.03267
G1 X226.214 Y216.31 E.12905
G1 X226.214 Y215.674 E.03266
G1 X223.797 Y218.089 E.17525
G1 X223.16 Y218.089 E.03267
G1 X226.214 Y215.037 E.22145
G1 X226.214 Y214.4 E.03266
G1 X222.523 Y218.089 E.26764
G1 X221.886 Y218.089 E.03267
G1 X226.214 Y213.763 E.31384
G1 X226.214 Y213.126 E.03266
G1 X221.249 Y218.089 E.36003
G1 X220.612 Y218.089 E.03267
G1 X226.214 Y212.49 E.40623
G1 X226.214 Y211.853 E.03266
G1 X219.975 Y218.089 E.45243
G1 X219.338 Y218.089 E.03267
G1 X226.214 Y211.216 E.49862
G1 X226.214 Y210.579 E.03266
G1 X218.701 Y218.089 E.54482
G1 X218.064 Y218.089 E.03267
G1 X226.214 Y209.943 E.59102
G1 X226.214 Y209.306 E.03266
G1 X217.427 Y218.089 E.63721
G1 X216.79 Y218.089 E.03267
G1 X226.214 Y208.669 E.68341
G1 X226.214 Y208.032 E.03266
G1 X216.153 Y218.089 E.72961
G1 X215.516 Y218.089 E.03267
G1 X226.214 Y207.396 E.7758
G1 X226.214 Y206.759 E.03266
G1 X214.879 Y218.089 E.822
G1 X214.242 Y218.089 E.03267
G1 X226.214 Y206.122 E.8682
G1 X226.214 Y205.485 E.03266
G1 X213.605 Y218.089 E.91439
G1 X212.968 Y218.089 E.03267
G1 X226.214 Y204.849 E.96059
G1 X226.214 Y204.212 E.03266
G1 X212.331 Y218.089 E1.00679
G1 X211.694 Y218.089 E.03267
G1 X226.214 Y203.575 E1.05298
G1 X226.214 Y202.938 E.03266
G1 X211.057 Y218.089 E1.09918
G1 X210.42 Y218.089 E.03267
G1 X217.29 Y211.222 E.49819
G3 X216.444 Y211.431 I-1.325 J-3.549 E.0448
G1 X209.783 Y218.089 E.48303
G1 X209.146 Y218.089 E.03267
G1 X215.785 Y211.453 E.48147
G3 X215.224 Y211.377 I.234 J-3.865 E.02908
G1 X208.509 Y218.089 E.48695
G1 X207.872 Y218.089 E.03267
G1 X214.735 Y211.228 E.49774
G3 X214.297 Y211.029 I.776 J-2.288 E.02471
G1 X207.235 Y218.089 E.51218
G1 X206.598 Y218.089 E.03267
G1 X213.903 Y210.787 E.52979
G1 X213.556 Y210.497 E.02319
G1 X205.961 Y218.089 E.55079
G1 X205.324 Y218.089 E.03267
G1 X213.247 Y210.169 E.57458
G3 X212.977 Y209.802 I2.679 J-2.256 E.02338
G1 X204.687 Y218.089 E.60119
G1 X204.05 Y218.089 E.03267
G1 X212.75 Y209.392 E.63097
G3 X212.575 Y208.93 I2.219 J-1.106 E.02537
G1 X203.413 Y218.089 E.66446
G1 X202.776 Y218.089 E.03267
G1 X212.453 Y208.416 E.7018
G3 X212.416 Y207.816 I4.941 J-.604 E.03085
G1 X202.139 Y218.089 E.74533
G1 X201.502 Y218.089 E.03267
G1 X212.792 Y206.803 E.81878
; WIPE_START
G1 X211.378 Y208.217 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X218.882 Y209.607 Z2.6 F30000
G1 X218.902 Y209.611 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F3000
G1 X226.214 Y202.302 E.53028
G1 X226.214 Y201.665 E.03266
G1 X219.557 Y208.319 E.48274
G2 X219.578 Y207.662 I-3.756 J-.444 E.03375
G1 X226.214 Y201.028 E.48128
G1 X226.214 Y200.391 E.03266
G1 X219.501 Y207.101 E.48682
G1 X219.473 Y206.99 E.00592
G2 X219.354 Y206.612 I-1.949 J.405 E.02034
G1 X226.214 Y199.755 E.49749
G1 X226.214 Y199.118 E.03266
G1 X219.155 Y206.168 E.51168
G2 X218.91 Y205.782 I-5.071 J2.951 E.02346
G1 X226.214 Y198.481 E.52967
G1 X226.214 Y197.844 E.03266
G1 X218.623 Y205.433 E.55053
G2 X218.296 Y205.122 I-1.718 J1.477 E.02314
G1 X226.214 Y197.208 E.57418
G1 X226.214 Y196.571 E.03266
G1 X217.93 Y204.851 E.60074
G2 X217.517 Y204.628 I-1.321 J1.95 E.02414
G1 X226.214 Y195.934 E.63072
G1 X226.214 Y195.297 E.03266
G1 X217.058 Y204.45 E.66401
G2 X216.54 Y204.331 I-1.558 J5.598 E.02727
G1 X226.214 Y194.661 E.70158
G1 X226.214 Y194.024 E.03266
G1 X215.936 Y204.297 E.74533
G2 X215.224 Y204.373 I-.031 J3.101 E.03685
G1 X226.214 Y193.387 E.79702
G1 X226.214 Y192.75 E.03266
G1 X200.865 Y218.089 E1.83832
G1 X200.228 Y218.089 E.03267
G1 X226.214 Y192.114 E1.88452
G1 X226.214 Y191.477 E.03266
G1 X199.59 Y218.089 E1.93072
G1 X198.953 Y218.089 E.03267
G1 X226.214 Y190.84 E1.97692
G1 X226.214 Y190.203 E.03266
G1 X198.316 Y218.089 E2.02311
G1 X197.679 Y218.089 E.03267
G1 X226.214 Y189.567 E2.06931
G1 X226.214 Y188.93 E.03266
G1 X197.042 Y218.089 E2.1155
G1 X196.405 Y218.089 E.03267
G1 X226.214 Y188.293 E2.1617
G1 X226.214 Y187.656 E.03266
G1 X195.768 Y218.089 E2.2079
G1 X195.131 Y218.089 E.03267
G1 X226.214 Y187.019 E2.25409
G1 X226.214 Y186.383 E.03266
G1 X194.494 Y218.089 E2.30029
G1 X193.857 Y218.089 E.03267
G1 X226.214 Y185.746 E2.34649
G1 X226.214 Y185.109 E.03266
G1 X193.22 Y218.089 E2.39268
G1 X192.583 Y218.089 E.03267
G1 X226.214 Y184.472 E2.43888
G1 X226.214 Y183.836 E.03266
G1 X191.946 Y218.089 E2.48508
G1 X191.309 Y218.089 E.03267
G1 X226.214 Y183.199 E2.53127
G1 X226.214 Y182.562 E.03266
G1 X190.672 Y218.089 E2.57747
G1 X190.035 Y218.089 E.03267
G1 X226.214 Y181.925 E2.62367
G1 X226.214 Y181.289 E.03266
G1 X189.398 Y218.089 E2.66986
G1 X188.761 Y218.089 E.03267
G1 X226.214 Y180.652 E2.71606
G1 X226.214 Y180.015 E.03266
G1 X188.124 Y218.089 E2.76226
G1 X187.487 Y218.089 E.03267
G1 X226.214 Y179.378 E2.80845
G1 X226.214 Y178.742 E.03266
G1 X186.85 Y218.089 E2.85465
G1 X186.213 Y218.089 E.03267
G1 X226.214 Y178.105 E2.90085
G1 X226.214 Y177.468 E.03266
G1 X185.576 Y218.089 E2.94704
G1 X184.939 Y218.089 E.03267
G1 X205.376 Y197.661 E1.48206
G1 X204.739 Y197.661 E.03267
G1 X184.302 Y218.089 E1.48206
G1 X183.665 Y218.089 E.03267
G1 X204.102 Y197.661 E1.48206
G1 X203.465 Y197.661 E.03267
G1 X183.028 Y218.089 E1.48206
G1 X182.391 Y218.089 E.03267
G1 X202.828 Y197.661 E1.48206
G1 X202.191 Y197.661 E.03267
G1 X181.754 Y218.089 E1.48206
G1 X181.117 Y218.089 E.03267
G1 X201.554 Y197.661 E1.48206
G1 X200.917 Y197.661 E.03267
G1 X180.48 Y218.089 E1.48206
G1 X179.843 Y218.089 E.03267
G1 X200.279 Y197.661 E1.48206
M73 P57 R28
G1 X199.642 Y197.661 E.03267
G1 X179.206 Y218.089 E1.48206
G1 X178.569 Y218.089 E.03267
G1 X199.005 Y197.661 E1.48206
G1 X198.368 Y197.661 E.03267
G1 X177.932 Y218.089 E1.48206
G1 X177.295 Y218.089 E.03267
G1 X197.731 Y197.661 E1.48206
G1 X197.094 Y197.661 E.03267
G1 X176.658 Y218.089 E1.48206
G1 X176.021 Y218.089 E.03267
G1 X196.457 Y197.661 E1.48206
G1 X195.82 Y197.661 E.03267
G1 X175.383 Y218.089 E1.48206
G1 X174.746 Y218.089 E.03267
G1 X195.183 Y197.661 E1.48206
G1 X194.546 Y197.661 E.03267
G1 X174.109 Y218.089 E1.48206
G1 X173.472 Y218.089 E.03267
G1 X193.909 Y197.661 E1.48206
G1 X193.272 Y197.661 E.03267
G1 X172.835 Y218.089 E1.48206
G1 X172.198 Y218.089 E.03267
G1 X192.635 Y197.661 E1.48206
G1 X191.998 Y197.661 E.03267
G1 X171.561 Y218.089 E1.48206
G1 X170.924 Y218.089 E.03267
G1 X191.361 Y197.661 E1.48206
G1 X190.724 Y197.661 E.03267
G1 X170.287 Y218.089 E1.48206
G1 X169.65 Y218.089 E.03267
G1 X190.087 Y197.661 E1.48206
G1 X189.45 Y197.661 E.03267
G1 X169.013 Y218.089 E1.48206
G1 X168.376 Y218.089 E.03267
G1 X188.813 Y197.661 E1.48206
G1 X188.176 Y197.661 E.03267
G1 X167.739 Y218.089 E1.48206
G1 X167.102 Y218.089 E.03267
G1 X187.539 Y197.661 E1.48206
G1 X186.902 Y197.661 E.03267
G1 X166.465 Y218.089 E1.48206
G1 X165.828 Y218.089 E.03267
G1 X186.265 Y197.661 E1.48206
G1 X185.628 Y197.661 E.03267
G1 X165.191 Y218.089 E1.48206
G1 X164.554 Y218.089 E.03267
G1 X184.991 Y197.661 E1.48206
M73 P57 R27
G1 X184.354 Y197.661 E.03267
G1 X163.917 Y218.089 E1.48206
G1 X163.28 Y218.089 E.03267
G1 X183.717 Y197.661 E1.48206
G1 X183.08 Y197.661 E.03267
G1 X162.643 Y218.089 E1.48206
G1 X162.006 Y218.089 E.03267
G1 X182.443 Y197.661 E1.48206
G1 X181.806 Y197.661 E.03267
G1 X161.369 Y218.089 E1.48206
G1 X160.732 Y218.089 E.03267
G1 X181.169 Y197.661 E1.48206
G1 X180.532 Y197.661 E.03267
G1 X160.095 Y218.089 E1.48206
G1 X159.458 Y218.089 E.03267
G1 X179.895 Y197.661 E1.48206
G1 X179.258 Y197.661 E.03267
G1 X158.821 Y218.089 E1.48206
G1 X158.184 Y218.089 E.03267
G1 X178.621 Y197.661 E1.48206
G1 X177.984 Y197.661 E.03267
G1 X157.547 Y218.089 E1.48206
G1 X156.91 Y218.089 E.03267
G1 X177.347 Y197.661 E1.48206
G1 X176.71 Y197.661 E.03267
G1 X156.273 Y218.089 E1.48206
G1 X155.636 Y218.089 E.03267
G1 X176.072 Y197.661 E1.48206
G1 X175.435 Y197.661 E.03267
G1 X154.999 Y218.089 E1.48206
G1 X154.362 Y218.089 E.03267
G1 X174.798 Y197.661 E1.48206
G1 X174.161 Y197.661 E.03267
G1 X153.725 Y218.089 E1.48206
G1 X153.088 Y218.089 E.03267
G1 X173.524 Y197.661 E1.48206
G1 X172.887 Y197.661 E.03267
G1 X152.451 Y218.089 E1.48206
G1 X151.814 Y218.089 E.03267
G1 X172.25 Y197.661 E1.48206
G1 X171.613 Y197.661 E.03267
G1 X151.176 Y218.089 E1.48206
G1 X150.539 Y218.089 E.03267
G1 X170.976 Y197.661 E1.48206
G1 X170.339 Y197.661 E.03267
G1 X149.902 Y218.089 E1.48206
G1 X149.265 Y218.089 E.03267
G1 X169.702 Y197.661 E1.48206
G1 X169.065 Y197.661 E.03267
G1 X148.628 Y218.089 E1.48206
G1 X147.991 Y218.089 E.03267
G1 X168.428 Y197.661 E1.48206
G1 X167.791 Y197.661 E.03267
G1 X147.354 Y218.089 E1.48206
G1 X146.717 Y218.089 E.03267
G1 X167.154 Y197.661 E1.48206
G1 X166.517 Y197.661 E.03267
G1 X146.08 Y218.089 E1.48206
G1 X145.443 Y218.089 E.03267
G1 X165.88 Y197.661 E1.48206
M73 P58 R27
G1 X165.243 Y197.661 E.03267
G1 X144.806 Y218.089 E1.48206
G1 X144.169 Y218.089 E.03267
G1 X164.606 Y197.661 E1.48206
G1 X163.969 Y197.661 E.03267
G1 X143.532 Y218.089 E1.48206
G1 X142.895 Y218.089 E.03267
G1 X163.332 Y197.661 E1.48206
G1 X162.695 Y197.661 E.03267
G1 X142.258 Y218.089 E1.48206
G1 X141.621 Y218.089 E.03267
G1 X162.058 Y197.661 E1.48206
G1 X161.421 Y197.661 E.03267
G1 X140.984 Y218.089 E1.48206
G1 X140.347 Y218.089 E.03267
G1 X160.784 Y197.661 E1.48206
G1 X160.147 Y197.661 E.03267
G1 X139.71 Y218.089 E1.48206
G1 X139.073 Y218.089 E.03267
G1 X159.51 Y197.661 E1.48206
G1 X158.873 Y197.661 E.03267
G1 X138.436 Y218.089 E1.48206
G1 X137.799 Y218.089 E.03267
G1 X158.236 Y197.661 E1.48206
G1 X157.599 Y197.661 E.03267
G1 X137.162 Y218.089 E1.48206
G1 X136.525 Y218.089 E.03267
G1 X156.962 Y197.661 E1.48206
G1 X156.325 Y197.661 E.03267
G1 X135.888 Y218.089 E1.48206
G1 X135.251 Y218.089 E.03267
G1 X155.688 Y197.661 E1.48206
G1 X155.051 Y197.661 E.03267
G1 X134.614 Y218.089 E1.48206
G1 X133.977 Y218.089 E.03267
G1 X154.414 Y197.661 E1.48206
G1 X153.777 Y197.661 E.03267
G1 X133.34 Y218.089 E1.48206
G1 X132.703 Y218.089 E.03267
G1 X153.14 Y197.661 E1.48206
G1 X152.503 Y197.661 E.03267
G1 X132.066 Y218.089 E1.48206
G1 X131.429 Y218.089 E.03267
G1 X151.865 Y197.661 E1.48206
G1 X151.228 Y197.661 E.03267
G1 X130.792 Y218.089 E1.48206
G1 X130.155 Y218.089 E.03267
G1 X150.591 Y197.661 E1.48206
G1 X149.954 Y197.661 E.03267
G1 X129.518 Y218.089 E1.48206
G1 X128.881 Y218.089 E.03267
G1 X149.317 Y197.661 E1.48206
G1 X148.68 Y197.661 E.03267
G1 X128.244 Y218.089 E1.48206
G1 X127.607 Y218.089 E.03267
G1 X148.043 Y197.661 E1.48206
G1 X147.406 Y197.661 E.03267
G1 X126.969 Y218.089 E1.48206
G1 X126.332 Y218.089 E.03267
G1 X146.769 Y197.661 E1.48206
G1 X146.132 Y197.661 E.03267
G1 X125.695 Y218.089 E1.48206
G1 X125.058 Y218.089 E.03267
G1 X145.495 Y197.661 E1.48206
G1 X144.858 Y197.661 E.03267
G1 X124.421 Y218.089 E1.48206
G1 X123.784 Y218.089 E.03267
G1 X144.221 Y197.661 E1.48206
G1 X143.584 Y197.661 E.03267
G1 X123.147 Y218.089 E1.48206
G1 X122.51 Y218.089 E.03267
G1 X129.45 Y211.152 E.50326
G3 X128.547 Y211.418 I-1.255 J-2.596 E.04849
G1 X121.873 Y218.089 E.48397
G1 X121.236 Y218.089 E.03267
G1 X127.858 Y211.458 E.48063
G3 X127.3 Y211.391 I.059 J-2.82 E.02883
G1 X120.599 Y218.089 E.48597
G1 X119.962 Y218.089 E.03267
G1 X126.8 Y211.254 E.49589
G3 X126.357 Y211.06 I.747 J-2.309 E.02484
G1 X119.325 Y218.089 E.50996
G1 X118.688 Y218.089 E.03267
G1 X125.958 Y210.822 E.5272
G3 X125.602 Y210.542 I3.185 J-4.413 E.02327
G1 X118.051 Y218.089 E.54756
G1 X117.414 Y218.089 E.03267
G1 X125.288 Y210.218 E.57102
G3 X125.013 Y209.856 I1.666 J-1.549 E.02335
G1 X116.777 Y218.089 E.59729
G1 X116.14 Y218.089 E.03267
G1 X124.779 Y209.454 E.62649
G3 X124.597 Y208.999 I4.486 J-2.066 E.02512
G1 X115.503 Y218.089 E.65945
G1 X114.866 Y218.089 E.03267
G1 X124.468 Y208.491 E.69635
G3 X124.416 Y207.906 I3.778 J-.631 E.03014
G1 X114.229 Y218.089 E.73878
G1 X113.592 Y218.089 E.03267
G1 X124.752 Y206.934 E.80931
; WIPE_START
G1 X123.337 Y208.348 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.723 Y209.879 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
G1 F3000
G1 X142.947 Y197.661 E.88645
G1 X142.31 Y197.661 E.03267
G1 X131.541 Y208.425 E.78095
G2 X131.582 Y207.748 I-3.594 J-.555 E.03485
G1 X141.673 Y197.661 E.73181
G1 X141.036 Y197.661 E.03267
G1 X131.519 Y207.174 E.6902
G2 X131.378 Y206.678 I-4.943 J1.132 E.02647
G1 X140.399 Y197.661 E.65419
G1 X139.762 Y197.661 E.03267
G1 X131.187 Y206.233 E.62187
G2 X131.057 Y206.004 I-1.206 J.535 E.0135
G2 X130.949 Y205.833 I-.907 J.451 E.01038
G1 X139.125 Y197.661 E.5929
G1 X138.488 Y197.661 E.03267
G1 X130.666 Y205.48 E.56724
G1 X130.61 Y205.42 E.00419
G2 X130.344 Y205.164 I-1.407 J1.2 E.01895
G1 X137.851 Y197.661 E.54436
G1 X137.214 Y197.661 E.03267
G1 X129.984 Y204.888 E.5243
G2 X129.579 Y204.656 I-2.71 J4.266 E.02395
G1 X136.577 Y197.661 E.50748
G1 X135.94 Y197.661 E.03267
G1 X129.125 Y204.473 E.49418
G1 X128.978 Y204.423 E.00796
G2 X128.62 Y204.341 I-8.067 J34.356 E.01885
G1 X135.303 Y197.661 E.48463
G1 X134.666 Y197.661 E.03267
G1 X128.027 Y204.297 E.48144
G1 X127.791 Y204.298 E.01209
G2 X127.333 Y204.354 I.159 J3.204 E.02369
G1 X134.029 Y197.661 E.48555
G1 X133.392 Y197.661 E.03267
G1 X112.955 Y218.089 E1.48206
G1 X112.318 Y218.089 E.03267
G1 X132.755 Y197.661 E1.48206
G1 X132.118 Y197.661 E.03267
G1 X111.681 Y218.089 E1.48206
G1 X111.044 Y218.089 E.03267
G1 X131.481 Y197.661 E1.48206
G1 X130.844 Y197.661 E.03267
G1 X110.407 Y218.089 E1.48206
G1 X109.77 Y218.089 E.03267
M73 P59 R27
G1 X130.207 Y197.661 E1.48206
G1 X129.57 Y197.661 E.03267
G1 X109.133 Y218.089 E1.48206
G1 X108.496 Y218.089 E.03267
G1 X128.933 Y197.661 E1.48206
G1 X128.296 Y197.661 E.03267
G1 X107.859 Y218.089 E1.48206
G1 X107.222 Y218.089 E.03267
G1 X127.658 Y197.661 E1.48206
G1 X127.021 Y197.661 E.03267
G1 X106.585 Y218.089 E1.48206
G1 X105.948 Y218.089 E.03267
G1 X126.384 Y197.661 E1.48206
G1 X125.747 Y197.661 E.03267
G1 X105.311 Y218.089 E1.48206
G1 X104.674 Y218.089 E.03267
G1 X125.11 Y197.661 E1.48206
G1 X124.473 Y197.661 E.03267
G1 X104.037 Y218.089 E1.48206
G1 X103.4 Y218.089 E.03267
G1 X123.836 Y197.661 E1.48206
G1 X123.199 Y197.661 E.03267
M73 P59 R26
G1 X102.762 Y218.089 E1.48206
G1 X102.125 Y218.089 E.03267
G1 X122.562 Y197.661 E1.48206
G1 X121.925 Y197.661 E.03267
G1 X101.488 Y218.089 E1.48206
G1 X100.851 Y218.089 E.03267
G1 X121.288 Y197.661 E1.48206
G1 X120.651 Y197.661 E.03267
G1 X100.214 Y218.089 E1.48206
G1 X99.577 Y218.089 E.03267
G1 X120.014 Y197.661 E1.48206
G1 X119.377 Y197.661 E.03267
G1 X98.94 Y218.089 E1.48206
G1 X98.303 Y218.089 E.03267
G1 X118.74 Y197.661 E1.48206
G1 X118.103 Y197.661 E.03267
G1 X97.666 Y218.089 E1.48206
G1 X97.029 Y218.089 E.03267
G1 X117.466 Y197.661 E1.48206
G1 X116.829 Y197.661 E.03267
G1 X96.392 Y218.089 E1.48206
G1 X95.755 Y218.089 E.03267
G1 X116.192 Y197.661 E1.48206
G1 X115.555 Y197.661 E.03267
G1 X95.118 Y218.089 E1.48206
G1 X94.481 Y218.089 E.03267
G1 X114.918 Y197.661 E1.48206
G1 X114.281 Y197.661 E.03267
G1 X93.844 Y218.089 E1.48206
G1 X93.207 Y218.089 E.03267
G1 X113.644 Y197.661 E1.48206
G1 X113.007 Y197.661 E.03267
G1 X92.57 Y218.089 E1.48206
G1 X91.933 Y218.089 E.03267
G1 X112.37 Y197.661 E1.48206
G1 X111.733 Y197.661 E.03267
G1 X91.296 Y218.089 E1.48206
G1 X90.659 Y218.089 E.03267
G1 X111.096 Y197.661 E1.48206
G1 X110.459 Y197.661 E.03267
G1 X90.022 Y218.089 E1.48206
G1 X89.385 Y218.089 E.03267
G1 X109.822 Y197.661 E1.48206
G1 X109.185 Y197.661 E.03267
G1 X88.748 Y218.089 E1.48206
G1 X88.111 Y218.089 E.03267
G1 X108.548 Y197.661 E1.48206
G1 X107.911 Y197.661 E.03267
G1 X87.474 Y218.089 E1.48206
G1 X86.837 Y218.089 E.03267
G1 X107.274 Y197.661 E1.48206
G1 X106.637 Y197.661 E.03267
G1 X86.2 Y218.089 E1.48206
G1 X85.563 Y218.089 E.03267
G1 X106 Y197.661 E1.48206
G1 X105.363 Y197.661 E.03267
G1 X84.926 Y218.089 E1.48206
G1 X84.289 Y218.089 E.03267
G1 X104.726 Y197.661 E1.48206
G1 X104.089 Y197.661 E.03267
G1 X83.652 Y218.089 E1.48206
G1 X83.015 Y218.089 E.03267
G1 X103.451 Y197.661 E1.48206
G1 X102.814 Y197.661 E.03267
G1 X82.378 Y218.089 E1.48206
G1 X81.741 Y218.089 E.03267
G1 X102.177 Y197.661 E1.48206
G1 X101.54 Y197.661 E.03267
G1 X81.104 Y218.089 E1.48206
G1 X80.467 Y218.089 E.03267
G1 X100.903 Y197.661 E1.48206
G1 X100.266 Y197.661 E.03267
G1 X79.83 Y218.089 E1.48206
G1 X79.193 Y218.089 E.03267
G1 X99.629 Y197.661 E1.48206
G1 X98.992 Y197.661 E.03267
G1 X78.555 Y218.089 E1.48206
G1 X77.918 Y218.089 E.03267
G1 X98.355 Y197.661 E1.48206
G1 X97.718 Y197.661 E.03267
G1 X77.281 Y218.089 E1.48206
G1 X76.644 Y218.089 E.03267
G1 X97.081 Y197.661 E1.48206
G1 X96.444 Y197.661 E.03267
G1 X76.007 Y218.089 E1.48206
G1 X75.37 Y218.089 E.03267
G1 X95.807 Y197.661 E1.48206
G1 X95.17 Y197.661 E.03267
G1 X74.733 Y218.089 E1.48206
G1 X74.096 Y218.089 E.03267
G1 X94.533 Y197.661 E1.48206
G1 X93.896 Y197.661 E.03267
G1 X73.459 Y218.089 E1.48206
G1 X72.822 Y218.089 E.03267
G1 X93.259 Y197.661 E1.48206
G1 X92.622 Y197.661 E.03267
G1 X72.185 Y218.089 E1.48206
G1 X71.548 Y218.089 E.03267
G1 X91.985 Y197.661 E1.48206
G1 X91.348 Y197.661 E.03267
G1 X70.911 Y218.089 E1.48206
G1 X70.274 Y218.089 E.03267
G1 X90.711 Y197.661 E1.48206
G1 X90.074 Y197.661 E.03267
G1 X69.637 Y218.089 E1.48206
G1 X69 Y218.089 E.03267
G1 X89.437 Y197.661 E1.48206
G1 X88.8 Y197.661 E.03267
G1 X68.363 Y218.089 E1.48206
G1 X67.726 Y218.089 E.03267
G1 X88.163 Y197.661 E1.48206
G1 X87.526 Y197.661 E.03267
G1 X67.089 Y218.089 E1.48206
G1 X66.452 Y218.089 E.03267
G1 X86.889 Y197.661 E1.48206
G1 X86.252 Y197.661 E.03267
G1 X65.815 Y218.089 E1.48206
G1 X65.178 Y218.089 E.03267
G1 X85.615 Y197.661 E1.48206
G1 X84.978 Y197.661 E.03267
G1 X64.541 Y218.089 E1.48206
G1 X63.904 Y218.089 E.03267
G1 X84.341 Y197.661 E1.48206
G1 X83.704 Y197.661 E.03267
G1 X63.267 Y218.089 E1.48206
G1 X62.63 Y218.089 E.03267
G1 X83.067 Y197.661 E1.48206
G1 X82.43 Y197.661 E.03267
G1 X61.993 Y218.089 E1.48206
G1 X61.356 Y218.089 E.03267
G1 X81.793 Y197.661 E1.48206
G1 X81.156 Y197.661 E.03267
G1 X60.719 Y218.089 E1.48206
G1 X60.082 Y218.089 E.03267
G1 X80.519 Y197.661 E1.48206
G1 X79.881 Y197.661 E.03267
G1 X59.445 Y218.089 E1.48206
M73 P60 R26
G1 X58.808 Y218.089 E.03267
G1 X79.244 Y197.661 E1.48206
G1 X78.607 Y197.661 E.03267
G1 X58.171 Y218.089 E1.48206
G1 X57.534 Y218.089 E.03267
G1 X77.97 Y197.661 E1.48206
G1 X77.333 Y197.661 E.03267
G1 X56.897 Y218.089 E1.48206
G1 X56.26 Y218.089 E.03267
G1 X76.696 Y197.661 E1.48206
G1 X76.059 Y197.661 E.03267
G1 X55.623 Y218.089 E1.48206
G1 X54.986 Y218.089 E.03267
G1 X75.422 Y197.661 E1.48206
G1 X74.785 Y197.661 E.03267
G1 X54.348 Y218.089 E1.48206
G1 X53.711 Y218.089 E.03267
G1 X74.148 Y197.661 E1.48206
G1 X73.511 Y197.661 E.03267
G1 X53.074 Y218.089 E1.48206
G1 X52.437 Y218.089 E.03267
G1 X72.874 Y197.661 E1.48206
G1 X72.237 Y197.661 E.03267
G1 X51.8 Y218.089 E1.48206
G1 X51.163 Y218.089 E.03267
G1 X71.6 Y197.661 E1.48206
G1 X70.963 Y197.661 E.03267
G1 X50.526 Y218.089 E1.48206
G1 X49.889 Y218.089 E.03267
G1 X70.326 Y197.661 E1.48206
G1 X69.689 Y197.661 E.03267
G1 X49.252 Y218.089 E1.48206
G1 X48.615 Y218.089 E.03267
G1 X69.052 Y197.661 E1.48206
G1 X68.415 Y197.661 E.03267
G1 X47.978 Y218.089 E1.48206
G1 X47.341 Y218.089 E.03267
G1 X67.778 Y197.661 E1.48206
G1 X67.141 Y197.661 E.03267
G1 X46.704 Y218.089 E1.48206
G1 X46.067 Y218.089 E.03267
G1 X66.504 Y197.661 E1.48206
G1 X65.867 Y197.661 E.03267
G1 X45.43 Y218.089 E1.48206
G1 X44.793 Y218.089 E.03267
G1 X65.23 Y197.661 E1.48206
G1 X64.593 Y197.661 E.03267
G1 X44.156 Y218.089 E1.48206
G1 X43.519 Y218.089 E.03267
G1 X63.956 Y197.661 E1.48206
G1 X63.319 Y197.661 E.03267
G1 X42.882 Y218.089 E1.48206
G1 X42.245 Y218.089 E.03267
G1 X62.682 Y197.661 E1.48206
G1 X62.045 Y197.661 E.03267
G1 X41.608 Y218.089 E1.48206
G1 X40.971 Y218.089 E.03267
G1 X61.408 Y197.661 E1.48206
G1 X60.771 Y197.661 E.03267
G1 X40.334 Y218.089 E1.48206
G1 X39.697 Y218.089 E.03267
G1 X60.134 Y197.661 E1.48206
G1 X59.497 Y197.661 E.03267
G1 X39.06 Y218.089 E1.48206
G1 X38.423 Y218.089 E.03267
G1 X58.86 Y197.661 E1.48206
G1 X58.223 Y197.661 E.03267
G1 X37.786 Y218.089 E1.48206
G1 X37.149 Y218.089 E.03267
G1 X57.586 Y197.661 E1.48206
G1 X56.949 Y197.661 E.03267
G1 X36.512 Y218.089 E1.48206
G1 X35.875 Y218.089 E.03267
G1 X56.312 Y197.661 E1.48206
G1 X55.674 Y197.661 E.03267
G1 X35.238 Y218.089 E1.48206
M73 P60 R25
G1 X34.601 Y218.089 E.03267
G1 X55.037 Y197.661 E1.48206
G1 X54.4 Y197.661 E.03267
G1 X43.525 Y208.532 E.78866
G1 X43.544 Y208.41 E.00632
G2 X43.586 Y207.834 I-4.173 J-.598 E.02963
G1 X53.763 Y197.661 E.73805
G1 X53.126 Y197.661 E.03267
G1 X43.53 Y207.253 E.69589
G2 X43.402 Y206.744 I-4.051 J.751 E.02692
G1 X52.489 Y197.661 E.659
G1 X51.852 Y197.661 E.03267
G1 X43.216 Y206.294 E.6263
G1 X43.199 Y206.258 E.00203
G2 X42.985 Y205.887 I-1.957 J.881 E.02197
G1 X51.215 Y197.661 E.59683
G1 X50.578 Y197.661 E.03267
G1 X42.709 Y205.526 E.57064
G2 X42.392 Y205.207 I-1.756 J1.424 E.02314
G1 X50.214 Y197.388 E.56722
G1 X50.214 Y196.751 E.03266
G1 X42.037 Y204.925 E.59302
G2 X41.641 Y204.684 I-1.405 J1.859 E.02381
G1 X50.214 Y196.115 E.62172
G1 X50.214 Y195.478 E.03266
G1 X41.193 Y204.495 E.6542
G2 X40.694 Y204.357 I-.938 J2.426 E.0266
G1 X50.214 Y194.841 E.6904
G1 X50.214 Y194.204 E.03266
G1 X40.118 Y204.297 E.73219
G1 X39.791 Y204.298 E.01674
G2 X39.443 Y204.334 I.156 J3.159 E.01797
G1 X50.214 Y193.568 E.78111
G1 X50.214 Y192.931 E.03266
G1 X38.543 Y204.597 E.84637
G2 X36.728 Y206.411 I1.548 J3.364 E.13443
G1 X29.786 Y213.35 E.50342
G1 X29.786 Y213.987 E.03266
G1 X36.456 Y207.32 E.48371
G2 X36.416 Y207.996 I4.608 J.61 E.03479
G1 X29.786 Y214.624 E.48083
G1 X29.786 Y215.261 E.03266
G1 X36.483 Y208.566 E.4857
G2 X36.618 Y209.068 I2.579 J-.42 E.02672
G1 X29.786 Y215.897 E.49544
G1 X29.786 Y216.534 E.03266
G1 X36.811 Y209.512 E.50945
G2 X37.05 Y209.91 I2.621 J-1.304 E.02383
G1 X29.786 Y217.171 E.52679
G1 X29.786 Y217.808 E.03266
G1 X37.329 Y210.267 E.54704
G2 X37.649 Y210.584 I4.093 J-3.816 E.0231
G1 X30.141 Y218.089 E.54447
G1 X30.778 Y218.089 E.03267
G1 X38.013 Y210.858 E.52463
G2 X38.417 Y211.091 I1.367 J-1.905 E.02396
G1 X31.416 Y218.089 E.50774
G1 X32.053 Y218.089 E.03267
G1 X38.866 Y211.279 E.49409
M73 P61 R25
G2 X39.377 Y211.404 I.883 J-2.493 E.02706
G1 X32.69 Y218.089 E.48499
G1 X33.327 Y218.089 E.03267
G1 X39.958 Y211.461 E.48087
G2 X40.654 Y211.402 I-.03 J-4.47 E.03588
G1 X33.761 Y218.292 E.49987
G1 X29.583 Y212.916 F30000
G1 F3000
G1 X50.214 Y192.294 E1.49612
G1 X50.214 Y191.657 E.03266
G1 X29.786 Y212.077 E1.48143
G1 X29.786 Y211.44 E.03266
G1 X50.214 Y191.021 E1.48143
G1 X50.214 Y190.384 E.03266
G1 X29.786 Y210.803 E1.48143
G1 X29.786 Y210.167 E.03266
G1 X50.214 Y189.747 E1.48143
G1 X50.214 Y189.11 E.03266
G1 X29.786 Y209.53 E1.48143
G1 X29.786 Y208.893 E.03266
G1 X50.214 Y188.474 E1.48143
G1 X50.214 Y187.837 E.03266
G1 X29.786 Y208.256 E1.48143
G1 X29.786 Y207.62 E.03266
G1 X50.214 Y187.2 E1.48143
G1 X50.214 Y186.563 E.03266
G1 X29.786 Y206.983 E1.48143
G1 X29.786 Y206.346 E.03266
G1 X50.214 Y185.927 E1.48143
G1 X50.214 Y185.29 E.03266
G1 X29.786 Y205.709 E1.48143
G1 X29.786 Y205.073 E.03266
G1 X50.214 Y184.653 E1.48143
G1 X50.214 Y184.016 E.03266
G1 X29.786 Y204.436 E1.48143
G1 X29.786 Y203.799 E.03266
G1 X50.214 Y183.38 E1.48143
G1 X50.214 Y182.743 E.03266
G1 X29.786 Y203.162 E1.48143
G1 X29.786 Y202.526 E.03266
G1 X50.214 Y182.106 E1.48143
G1 X50.214 Y181.469 E.03266
G1 X29.786 Y201.889 E1.48143
G1 X29.786 Y201.252 E.03266
G1 X50.214 Y180.833 E1.48143
G1 X50.214 Y180.196 E.03266
G1 X29.786 Y200.615 E1.48143
G1 X29.786 Y199.979 E.03266
G1 X50.214 Y179.559 E1.48143
G1 X50.214 Y178.922 E.03266
G1 X29.786 Y199.342 E1.48143
G1 X29.786 Y198.705 E.03266
G1 X50.214 Y178.286 E1.48143
G1 X50.214 Y177.649 E.03266
G1 X29.786 Y198.068 E1.48143
G1 X29.786 Y197.432 E.03266
G1 X50.214 Y177.012 E1.48143
G1 X50.214 Y176.375 E.03266
G1 X29.786 Y196.795 E1.48143
G1 X29.786 Y196.158 E.03266
G1 X50.214 Y175.739 E1.48143
G1 X50.214 Y175.102 E.03266
G1 X29.786 Y195.521 E1.48143
G1 X29.786 Y194.884 E.03266
G1 X50.214 Y174.465 E1.48143
G1 X50.214 Y173.828 E.03266
G1 X29.786 Y194.248 E1.48143
G1 X29.786 Y193.611 E.03266
G1 X50.214 Y173.192 E1.48143
G1 X50.214 Y172.555 E.03266
G1 X29.786 Y192.974 E1.48143
G1 X29.786 Y192.337 E.03266
G1 X50.214 Y171.918 E1.48143
G1 X50.214 Y171.281 E.03266
G1 X29.786 Y191.701 E1.48143
G1 X29.786 Y191.064 E.03266
G1 X50.214 Y170.644 E1.48143
G1 X50.214 Y170.008 E.03266
G1 X29.786 Y190.427 E1.48143
G1 X29.786 Y189.79 E.03266
G1 X50.214 Y169.371 E1.48143
G1 X50.214 Y168.734 E.03266
G1 X29.786 Y189.154 E1.48143
G1 X29.786 Y188.517 E.03266
G1 X50.214 Y168.097 E1.48143
G1 X50.214 Y167.461 E.03266
G1 X29.786 Y187.88 E1.48143
G1 X29.786 Y187.243 E.03266
G1 X50.214 Y166.824 E1.48143
G1 X50.214 Y166.187 E.03266
G1 X29.786 Y186.607 E1.48143
G1 X29.786 Y185.97 E.03266
G1 X50.214 Y165.55 E1.48143
G1 X50.214 Y164.914 E.03266
G1 X29.786 Y185.333 E1.48143
G1 X29.786 Y184.696 E.03266
G1 X50.214 Y164.277 E1.48143
G1 X50.214 Y163.64 E.03266
G1 X29.786 Y184.06 E1.48143
G1 X29.786 Y183.423 E.03266
G1 X50.214 Y163.003 E1.48143
G1 X50.214 Y162.367 E.03266
G1 X29.786 Y182.786 E1.48143
G1 X29.786 Y182.149 E.03266
G1 X50.214 Y161.73 E1.48143
G1 X50.214 Y161.093 E.03266
G1 X29.786 Y181.513 E1.48143
G1 X29.786 Y180.876 E.03266
G1 X50.214 Y160.456 E1.48143
G1 X50.214 Y159.82 E.03266
G1 X29.786 Y180.239 E1.48143
G1 X29.786 Y179.602 E.03266
G1 X50.214 Y159.183 E1.48143
G1 X50.214 Y158.546 E.03266
G1 X29.786 Y178.966 E1.48143
G1 X29.786 Y178.329 E.03266
G1 X50.214 Y157.909 E1.48143
G1 X50.214 Y157.273 E.03266
G1 X29.786 Y177.692 E1.48143
G1 X29.786 Y177.055 E.03266
G1 X50.214 Y156.636 E1.48143
G1 X50.214 Y155.999 E.03266
G1 X29.786 Y176.419 E1.48143
G1 X29.786 Y175.782 E.03266
G1 X50.214 Y155.362 E1.48143
G1 X50.214 Y154.726 E.03266
G1 X29.786 Y175.145 E1.48143
G1 X29.786 Y174.508 E.03266
G1 X50.214 Y154.089 E1.48143
G1 X50.214 Y153.452 E.03266
G1 X29.786 Y173.872 E1.48143
G1 X29.786 Y173.235 E.03266
G1 X50.214 Y152.815 E1.48143
G1 X50.214 Y152.179 E.03266
G1 X29.786 Y172.598 E1.48143
G1 X29.786 Y171.961 E.03266
G1 X50.214 Y151.542 E1.48143
G1 X50.214 Y150.905 E.03266
G1 X29.786 Y171.325 E1.48143
G1 X29.786 Y170.688 E.03266
G1 X50.214 Y150.268 E1.48143
G1 X50.214 Y149.632 E.03266
G1 X29.786 Y170.051 E1.48143
G1 X29.786 Y169.414 E.03266
G1 X50.214 Y148.995 E1.48143
G1 X50.214 Y148.358 E.03266
G1 X29.786 Y168.778 E1.48143
G1 X29.786 Y168.141 E.03266
G1 X50.214 Y147.721 E1.48143
G1 X50.214 Y147.085 E.03266
G1 X29.786 Y167.504 E1.48143
G1 X29.786 Y166.867 E.03266
G1 X50.214 Y146.448 E1.48143
G1 X50.214 Y145.811 E.03266
G1 X29.786 Y166.23 E1.48143
G1 X29.786 Y165.594 E.03266
G1 X50.214 Y145.174 E1.48143
G1 X50.214 Y144.538 E.03266
G1 X29.786 Y164.957 E1.48143
G1 X29.786 Y164.32 E.03266
G1 X50.214 Y143.901 E1.48143
G1 X50.214 Y143.264 E.03266
G1 X29.786 Y163.683 E1.48143
G1 X29.786 Y163.047 E.03266
G1 X50.214 Y142.627 E1.48143
G1 X50.214 Y141.99 E.03266
G1 X29.786 Y162.41 E1.48143
G1 X29.786 Y161.773 E.03266
G1 X50.214 Y141.354 E1.48143
M73 P62 R25
G1 X50.214 Y140.717 E.03266
G1 X29.786 Y161.136 E1.48143
G1 X29.786 Y160.5 E.03266
G1 X50.214 Y140.08 E1.48143
G1 X50.214 Y139.443 E.03266
G1 X29.786 Y159.863 E1.48143
G1 X29.786 Y159.226 E.03266
G1 X50.214 Y138.807 E1.48143
G1 X50.214 Y138.17 E.03266
G1 X29.786 Y158.589 E1.48143
G1 X29.786 Y157.953 E.03266
G1 X50.214 Y137.533 E1.48143
M73 P62 R24
G1 X50.214 Y136.896 E.03266
G1 X29.786 Y157.316 E1.48143
G1 X29.786 Y156.679 E.03266
G1 X50.214 Y136.26 E1.48143
G1 X50.214 Y135.623 E.03266
G1 X29.786 Y156.042 E1.48143
G1 X29.786 Y155.406 E.03266
G1 X50.214 Y134.986 E1.48143
G1 X50.214 Y134.349 E.03266
G1 X29.786 Y154.769 E1.48143
G1 X29.786 Y154.132 E.03266
G1 X50.214 Y133.713 E1.48143
G1 X50.214 Y133.076 E.03266
G1 X29.786 Y153.495 E1.48143
G1 X29.786 Y152.859 E.03266
G1 X50.214 Y132.439 E1.48143
G1 X50.214 Y131.802 E.03266
G1 X29.786 Y152.222 E1.48143
G1 X29.786 Y151.585 E.03266
G1 X50.214 Y131.166 E1.48143
G1 X50.214 Y130.529 E.03266
G1 X29.786 Y150.948 E1.48143
G1 X29.786 Y150.312 E.03266
G1 X50.214 Y129.892 E1.48143
G1 X50.214 Y129.255 E.03266
G1 X29.786 Y149.675 E1.48143
G1 X29.786 Y149.038 E.03266
G1 X50.214 Y128.619 E1.48143
G1 X50.214 Y127.982 E.03266
G1 X29.786 Y148.401 E1.48143
G1 X29.786 Y147.765 E.03266
G1 X50.214 Y127.345 E1.48143
G1 X50.214 Y126.708 E.03266
G1 X29.786 Y147.128 E1.48143
G1 X29.786 Y146.491 E.03266
G1 X50.214 Y126.072 E1.48143
G1 X50.214 Y125.435 E.03266
G1 X29.786 Y145.854 E1.48143
G1 X29.786 Y145.218 E.03266
G1 X50.214 Y124.798 E1.48143
G1 X50.214 Y124.161 E.03266
G1 X29.786 Y144.581 E1.48143
G1 X29.786 Y143.944 E.03266
G1 X50.214 Y123.525 E1.48143
G1 X50.214 Y122.888 E.03266
G1 X29.786 Y143.307 E1.48143
G1 X29.786 Y142.671 E.03266
G1 X50.214 Y122.251 E1.48143
G1 X50.214 Y121.614 E.03266
G1 X29.786 Y142.034 E1.48143
G1 X29.786 Y141.397 E.03266
G1 X50.214 Y120.978 E1.48143
G1 X50.214 Y120.341 E.03266
G1 X43.391 Y127.161 E.49479
G1 X43.424 Y127.069 E.00499
G2 X43.571 Y126.344 I-2.295 J-.841 E.03808
G1 X50.214 Y119.704 E.48175
G1 X50.214 Y119.067 E.03266
G1 X43.573 Y125.705 E.48157
G2 X43.484 Y125.158 I-4.016 J.378 E.02846
G1 X50.214 Y118.431 E.48808
G1 X50.214 Y117.794 E.03266
G1 X43.331 Y124.674 E.49915
G2 X43.126 Y124.242 I-4.419 J1.837 E.02452
G1 X50.214 Y117.157 E.51404
G1 X50.214 Y116.52 E.03266
G1 X42.873 Y123.858 E.53235
G1 X42.855 Y123.834 E.00156
G2 X42.581 Y123.513 I-1.742 J1.209 E.02165
G1 X50.214 Y115.883 E.55353
G1 X50.214 Y115.247 E.03266
G1 X42.251 Y123.207 E.57749
G2 X41.876 Y122.945 I-3.418 J4.497 E.02347
G1 X50.214 Y114.61 E.60469
G1 X50.214 Y113.973 E.03266
G1 X41.458 Y122.726 E.63501
G2 X40.993 Y122.553 I-1.243 J2.628 E.02543
G1 X50.214 Y113.336 E.66867
G1 X50.214 Y112.7 E.03266
G1 X40.463 Y122.446 E.70712
G2 X39.85 Y122.422 I-.4 J2.377 E.03156
G1 X50.214 Y112.063 E.75158
G1 X50.214 Y111.426 E.03266
G1 X38.795 Y122.841 E.82813
; WIPE_START
G1 X40.209 Y121.427 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X36.838 Y124.797 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
G1 F3000
G1 X29.786 Y131.846 E.5114
G1 X29.786 Y132.482 E.03266
G1 X36.416 Y125.855 E.48083
G2 X36.445 Y126.463 I3.053 J.162 E.03129
G1 X29.786 Y133.119 E.48289
G1 X29.786 Y133.756 E.03266
G1 X36.555 Y126.99 E.49088
G2 X36.698 Y127.394 I2.09 J-.515 E.02202
G1 X36.725 Y127.457 E.00351
G1 X29.786 Y134.393 E.50321
G1 X29.786 Y135.029 E.03266
G1 X36.942 Y127.876 E.51895
G2 X37.208 Y128.248 I1.985 J-1.141 E.02345
G1 X29.786 Y135.666 E.53822
G1 X29.786 Y136.303 E.03266
G1 X37.512 Y128.58 E.56032
G2 X37.856 Y128.874 I1.64 J-1.568 E.02321
G1 X29.786 Y136.94 E.5852
G1 X29.786 Y137.576 E.03266
G1 X38.241 Y129.125 E.61313
G2 X38.674 Y129.329 I1.236 J-2.061 E.02459
G1 X29.786 Y138.213 E.64453
G1 X29.786 Y138.85 E.03266
G1 X39.155 Y129.485 E.67942
G2 X39.705 Y129.572 I.921 J-4.062 E.0286
G1 X29.786 Y139.487 E.71934
G1 X29.786 Y140.123 E.03266
G1 X40.345 Y129.568 E.76577
G2 X41.16 Y129.391 I-.207 J-2.908 E.04292
G1 X29.583 Y140.963 E.83954
G1 X29.583 Y131.411 F30000
G1 F3000
G1 X50.214 Y110.789 E1.49612
G1 X50.214 Y110.153 E.03266
G1 X29.786 Y130.572 E1.48143
G1 X29.786 Y129.935 E.03266
G1 X50.214 Y109.516 E1.48143
G1 X50.214 Y108.879 E.03266
G1 X29.786 Y129.299 E1.48143
G1 X29.786 Y128.662 E.03266
G1 X50.214 Y108.242 E1.48143
G1 X50.214 Y107.606 E.03266
G1 X29.786 Y128.025 E1.48143
G1 X29.786 Y127.388 E.03266
G1 X50.214 Y106.969 E1.48143
G1 X50.214 Y106.332 E.03266
G1 X29.786 Y126.752 E1.48143
G1 X29.786 Y126.115 E.03266
G1 X50.214 Y105.695 E1.48143
G1 X50.214 Y105.059 E.03266
G1 X29.786 Y125.478 E1.48143
G1 X29.786 Y124.841 E.03266
G1 X50.214 Y104.422 E1.48143
G1 X50.214 Y103.785 E.03266
G1 X29.786 Y124.205 E1.48143
G1 X29.786 Y123.568 E.03266
G1 X50.214 Y103.148 E1.48143
G1 X50.214 Y102.512 E.03266
G1 X29.786 Y122.931 E1.48143
G1 X29.786 Y122.294 E.03266
G1 X50.214 Y101.875 E1.48143
G1 X50.214 Y101.238 E.03266
M73 P63 R24
G1 X29.786 Y121.658 E1.48143
G1 X29.786 Y121.021 E.03266
G1 X50.214 Y100.601 E1.48143
G1 X50.214 Y99.965 E.03266
G1 X29.786 Y120.384 E1.48143
G1 X29.786 Y119.747 E.03266
G1 X50.214 Y99.328 E1.48143
G1 X50.214 Y98.691 E.03266
G1 X29.786 Y119.111 E1.48143
G1 X29.786 Y118.474 E.03266
G1 X50.214 Y98.054 E1.48143
G1 X50.214 Y97.418 E.03266
G1 X29.786 Y117.837 E1.48143
G1 X29.786 Y117.2 E.03266
G1 X50.214 Y96.781 E1.48143
G1 X50.214 Y96.144 E.03266
G1 X29.786 Y116.564 E1.48143
G1 X29.786 Y115.927 E.03266
G1 X50.214 Y95.507 E1.48143
G1 X50.214 Y94.871 E.03266
G1 X29.786 Y115.29 E1.48143
G1 X29.786 Y114.653 E.03266
G1 X50.214 Y94.234 E1.48143
G1 X50.214 Y93.597 E.03266
G1 X29.786 Y114.016 E1.48143
G1 X29.786 Y113.38 E.03266
G1 X50.214 Y92.96 E1.48143
G1 X50.214 Y92.324 E.03266
G1 X29.786 Y112.743 E1.48143
G1 X29.786 Y112.106 E.03266
G1 X50.214 Y91.687 E1.48143
G1 X50.214 Y91.05 E.03266
G1 X29.786 Y111.469 E1.48143
G1 X29.786 Y110.833 E.03266
G1 X50.214 Y90.413 E1.48143
G1 X50.214 Y89.777 E.03266
G1 X29.786 Y110.196 E1.48143
G1 X29.786 Y109.559 E.03266
G1 X50.214 Y89.14 E1.48143
G1 X50.214 Y88.503 E.03266
G1 X29.786 Y108.922 E1.48143
G1 X29.786 Y108.286 E.03266
G1 X50.214 Y87.866 E1.48143
G1 X50.214 Y87.229 E.03266
G1 X29.786 Y107.649 E1.48143
G1 X29.786 Y107.012 E.03266
G1 X50.214 Y86.593 E1.48143
G1 X50.214 Y85.956 E.03266
G1 X29.786 Y106.375 E1.48143
G1 X29.786 Y105.739 E.03266
G1 X50.214 Y85.319 E1.48143
G1 X50.214 Y84.682 E.03266
G1 X29.786 Y105.102 E1.48143
G1 X29.786 Y104.465 E.03266
G1 X50.214 Y84.046 E1.48143
G1 X50.214 Y83.409 E.03266
G1 X29.786 Y103.828 E1.48143
G1 X29.786 Y103.192 E.03266
G1 X50.214 Y82.772 E1.48143
G1 X50.214 Y82.135 E.03266
G1 X29.786 Y102.555 E1.48143
G1 X29.786 Y101.918 E.03266
G1 X50.214 Y81.499 E1.48143
G1 X50.214 Y80.862 E.03266
G1 X29.786 Y101.281 E1.48143
G1 X29.786 Y100.645 E.03266
G1 X50.214 Y80.225 E1.48143
G1 X50.214 Y79.588 E.03266
G1 X29.786 Y100.008 E1.48143
G1 X29.786 Y99.371 E.03266
G1 X50.214 Y78.952 E1.48143
G1 X50.214 Y78.315 E.03266
G1 X29.786 Y98.734 E1.48143
G1 X29.786 Y98.098 E.03266
G1 X50.214 Y77.678 E1.48143
G1 X50.214 Y77.041 E.03266
G1 X29.786 Y97.461 E1.48143
G1 X29.786 Y96.824 E.03266
G1 X50.214 Y76.405 E1.48143
G1 X50.214 Y75.768 E.03266
G1 X29.786 Y96.187 E1.48143
G1 X29.786 Y95.551 E.03266
G1 X50.214 Y75.131 E1.48143
G1 X50.214 Y74.494 E.03266
G1 X29.786 Y94.914 E1.48143
G1 X29.786 Y94.277 E.03266
G1 X50.214 Y73.858 E1.48143
G1 X50.214 Y73.221 E.03266
G1 X29.786 Y93.64 E1.48143
G1 X29.786 Y93.004 E.03266
G1 X50.214 Y72.584 E1.48143
G1 X50.214 Y71.947 E.03266
G1 X29.786 Y92.367 E1.48143
M73 P63 R23
G1 X29.786 Y91.73 E.03266
G1 X50.214 Y71.311 E1.48143
G1 X50.214 Y70.674 E.03266
G1 X29.786 Y91.093 E1.48143
G1 X29.786 Y90.457 E.03266
G1 X50.214 Y70.037 E1.48143
G1 X50.214 Y69.4 E.03266
G1 X29.786 Y89.82 E1.48143
G1 X29.786 Y89.183 E.03266
G1 X50.214 Y68.764 E1.48143
G1 X50.214 Y68.127 E.03266
G1 X29.786 Y88.546 E1.48143
G1 X29.786 Y87.91 E.03266
G1 X50.214 Y67.49 E1.48143
G1 X50.214 Y66.853 E.03266
G1 X29.786 Y87.273 E1.48143
G1 X29.786 Y86.636 E.03266
G1 X50.214 Y66.217 E1.48143
G1 X50.214 Y65.58 E.03266
G1 X29.786 Y85.999 E1.48143
G1 X29.786 Y85.362 E.03266
G1 X50.214 Y64.943 E1.48143
G1 X50.214 Y64.306 E.03266
G1 X29.786 Y84.726 E1.48143
G1 X29.786 Y84.089 E.03266
G1 X50.214 Y63.67 E1.48143
G1 X50.214 Y63.033 E.03266
G1 X29.786 Y83.452 E1.48143
G1 X29.786 Y82.815 E.03266
G1 X50.214 Y62.396 E1.48143
G1 X50.214 Y61.759 E.03266
G1 X29.786 Y82.179 E1.48143
G1 X29.786 Y81.542 E.03266
G1 X50.214 Y61.122 E1.48143
G1 X50.214 Y60.486 E.03266
G1 X29.786 Y80.905 E1.48143
G1 X29.786 Y80.268 E.03266
G1 X50.214 Y59.849 E1.48143
G1 X50.214 Y59.212 E.03266
G1 X29.786 Y79.632 E1.48143
G1 X29.786 Y78.995 E.03266
G1 X50.214 Y58.575 E1.48143
G1 X50.214 Y57.939 E.03266
G1 X29.786 Y78.358 E1.48143
G1 X29.786 Y77.721 E.03266
G1 X50.214 Y57.302 E1.48143
G1 X50.214 Y56.665 E.03266
G1 X29.786 Y77.085 E1.48143
G1 X29.786 Y76.448 E.03266
G1 X50.214 Y56.028 E1.48143
M73 P64 R23
G1 X50.214 Y55.392 E.03266
G1 X29.786 Y75.811 E1.48143
G1 X29.786 Y75.174 E.03266
G1 X50.214 Y54.755 E1.48143
G1 X50.214 Y54.339 E.02133
G1 X50.63 Y54.339 E.02134
G1 X71.067 Y33.911 E1.48206
G1 X71.704 Y33.911 E.03267
G1 X51.267 Y54.339 E1.48206
G1 X51.904 Y54.339 E.03267
G1 X72.341 Y33.911 E1.48206
G1 X72.978 Y33.911 E.03267
G1 X52.541 Y54.339 E1.48206
G1 X53.178 Y54.339 E.03267
G1 X73.615 Y33.911 E1.48206
G1 X74.252 Y33.911 E.03267
G1 X53.815 Y54.339 E1.48206
G1 X54.452 Y54.339 E.03267
G1 X74.889 Y33.911 E1.48206
G1 X75.526 Y33.911 E.03267
G1 X55.089 Y54.339 E1.48206
G1 X55.726 Y54.339 E.03267
G1 X76.163 Y33.911 E1.48206
G1 X76.8 Y33.911 E.03267
G1 X56.363 Y54.339 E1.48206
G1 X57 Y54.339 E.03267
G1 X77.437 Y33.911 E1.48206
G1 X78.074 Y33.911 E.03267
G1 X57.637 Y54.339 E1.48206
G1 X58.274 Y54.339 E.03267
G1 X78.711 Y33.911 E1.48206
G1 X79.348 Y33.911 E.03267
G1 X58.911 Y54.339 E1.48206
G1 X59.548 Y54.339 E.03267
G1 X79.985 Y33.911 E1.48206
G1 X80.622 Y33.911 E.03267
G1 X60.185 Y54.339 E1.48206
G1 X60.823 Y54.339 E.03267
G1 X81.259 Y33.911 E1.48206
G1 X81.896 Y33.911 E.03267
G1 X61.46 Y54.339 E1.48206
G1 X62.097 Y54.339 E.03267
G1 X82.533 Y33.911 E1.48206
G1 X83.17 Y33.911 E.03267
G1 X62.734 Y54.339 E1.48206
G1 X63.371 Y54.339 E.03267
G1 X83.807 Y33.911 E1.48206
G1 X84.444 Y33.911 E.03267
G1 X64.008 Y54.339 E1.48206
G1 X64.645 Y54.339 E.03267
G1 X80.68 Y38.311 E1.16286
G1 X80.777 Y38.408 E.00703
G1 X77.898 Y41.286 E.20879
G1 X78.119 Y41.507 E.01602
G1 X65.282 Y54.339 E.93097
G1 X65.919 Y54.339 E.03267
G1 X78.438 Y41.825 E.90787
G1 X78.756 Y42.144 E.0231
G1 X66.556 Y54.339 E.88476
G1 X67.193 Y54.339 E.03267
G1 X79.075 Y42.462 E.86166
G1 X79.393 Y42.781 E.0231
G1 X67.83 Y54.339 E.83856
G1 X68.467 Y54.339 E.03267
G1 X81.417 Y41.394 E.93913
G1 X81.418 Y42.03 E.03261
G1 X69.104 Y54.339 E.89301
G1 X69.741 Y54.339 E.03267
G1 X81.484 Y42.601 E.85157
G1 X81.509 Y42.676 E.00401
G2 X81.69 Y43.032 I4.638 J-2.143 E.02051
G1 X70.378 Y54.339 E.82036
G1 X71.015 Y54.339 E.03267
G1 X81.998 Y43.361 E.79647
G2 X82.399 Y43.597 I1.095 J-1.404 E.02393
G1 X71.652 Y54.339 E.77936
G1 X72.289 Y54.339 E.03267
G1 X82.919 Y43.713 E.77091
G1 X83.556 Y43.714 E.03265
G1 X72.926 Y54.339 E.77087
G1 X73.563 Y54.339 E.03267
G1 X84.192 Y43.714 E.77083
G1 X84.38 Y43.714 E.0096
G1 X82.353 Y45.741 E.14699
G1 X82.578 Y45.965 E.01627
G1 X74.2 Y54.339 E.60753
G1 X74.837 Y54.339 E.03267
G1 X82.896 Y46.284 E.58442
G1 X83.214 Y46.602 E.0231
G1 X75.474 Y54.339 E.56132
G1 X76.111 Y54.339 E.03267
G1 X83.676 Y46.777 E.5486
G1 X84.066 Y46.865 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42527
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X82.94 Y45.739 E.04962
G1 X83.21 Y45.469 E.01191
G1 X84.217 Y46.475 E.04433
G1 X84.487 Y46.204 E.01191
G1 X83.481 Y45.198 E.04433
G1 X83.751 Y44.928 E.01191
G1 X84.757 Y45.934 E.04433
G1 X85.028 Y45.664 E.01191
G1 X84.021 Y44.658 E.04433
G1 X84.292 Y44.387 E.01191
G1 X85.298 Y45.393 E.04433
G1 X85.568 Y45.123 E.01191
G1 X84.562 Y44.117 E.04433
G1 X84.833 Y43.846 E.01191
G1 X85.959 Y44.973 E.04962
G1 X86.11 Y44.345 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.40035
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X86.742 Y43.713 E.04583
G1 X86.105 Y43.713 E.03265
G1 X85.791 Y44.026 E.02276
G1 X84.457 Y43.47 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42527
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X81.83 Y40.844 E.11574
G1 X81.831 Y41.385 E.01687
G1 X83.746 Y43.3 E.08438
G1 X83.204 Y43.3 E.01686
G1 X81.831 Y41.927 E.0605
G2 X81.897 Y42.533 I1.325 J.163 E.01917
G1 X82.825 Y43.461 E.04087
G1 X78.365 Y41.164 F30000
G1 F15000
G1 X79.473 Y42.272 E.04882
G1 X79.744 Y42.002 E.01191
G1 X78.756 Y41.014 E.04354
G1 X79.026 Y40.743 E.01191
G1 X80.014 Y41.732 E.04354
G1 X80.284 Y41.461 E.01191
G1 X79.296 Y40.473 E.04354
G1 X79.567 Y40.203 E.01191
G1 X80.555 Y41.191 E.04354
G1 X80.825 Y40.92 E.01191
G1 X79.837 Y39.932 E.04354
G1 X80.107 Y39.662 E.01191
G1 X81.095 Y40.65 E.04354
G1 X81.366 Y40.38 E.01191
G1 X80.378 Y39.392 E.04354
G1 X80.648 Y39.121 E.01191
G1 X84.825 Y43.298 E.18403
G1 X85.366 Y43.298 E.01686
G1 X80.919 Y38.851 E.19597
G1 X81.189 Y38.581 E.01191
G1 X85.907 Y43.299 E.2079
G1 X86.448 Y43.299 E.01686
G1 X81.141 Y37.992 E.23385
G1 X81.411 Y37.722 E.01191
G1 X86.989 Y43.3 E.24578
G1 X87.531 Y43.3 E.01686
G1 X81.682 Y37.451 E.25771
G1 X81.952 Y37.181 E.01191
G1 X88.072 Y43.301 E.26964
G1 X88.613 Y43.301 E.01686
G1 X82.222 Y36.911 E.28158
G1 X82.493 Y36.64 E.01191
G1 X89.704 Y43.851 E.31773
G1 X89.974 Y43.581 E.01191
G1 X82.763 Y36.37 E.31773
G1 X83.034 Y36.1 E.01191
G1 X90.245 Y43.311 E.31773
G1 X90.703 Y43.303 E.01428
G1 X90.319 Y42.918 E.01693
G1 X90.356 Y42.881 E.00164
G1 X83.94 Y36.466 E.28268
G1 X84.211 Y36.195 E.01191
G1 X90.746 Y42.731 E.28797
G1 X90.921 Y41.283 F30000
G1 F15000
G1 X91.437 Y41.8 E.02275
G1 X91.708 Y41.529 E.01191
G1 X91.311 Y41.133 E.01747
G1 X91.582 Y40.863 E.01191
G1 X91.978 Y41.259 E.01747
G1 X92.248 Y40.989 E.01191
G1 X91.852 Y40.592 E.01747
G1 X92.122 Y40.322 E.01191
G1 X92.519 Y40.718 E.01747
G1 X92.789 Y40.448 E.01191
G1 X92.393 Y40.051 E.01747
G1 X92.606 Y39.838 E.00941
G1 X92.633 Y39.865 E.00118
G1 X92.69 Y39.808 E.0025
G1 X93.179 Y40.297 E.02157
G1 X89.553 Y44.242 F30000
G1 F15000
G1 X89.037 Y43.725 E.02275
G1 X88.767 Y43.996 E.01191
G1 X89.163 Y44.392 E.01747
G1 X88.893 Y44.662 E.01191
G1 X88.496 Y44.266 E.01747
G1 X88.226 Y44.536 E.01191
G1 X88.622 Y44.933 E.01747
G1 X88.352 Y45.203 E.01191
G1 X87.836 Y44.687 E.02275
G1 X83.345 Y35.646 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.40035
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X85.082 Y33.911 E.12591
G1 X85.719 Y33.911 E.03267
G1 X83.664 Y35.965 E.14902
G1 X89.122 Y36.781 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42527
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X90.371 Y38.03 E.05502
G3 X90.311 Y38.51 I-1.194 J.094 E.01519
G1 X88.751 Y36.95 E.06872
G1 X88.21 Y36.95 E.01685
G1 X90.119 Y38.86 E.08412
G1 X89.984 Y39.043 E.0071
G1 X89.987 Y39.268 E.00702
G1 X87.67 Y36.95 E.10211
G1 X87.129 Y36.95 E.01685
G1 X90.221 Y40.043 E.13627
G1 X90.295 Y40.184 E.00496
G1 X90.492 Y40.855 E.02178
G1 X86.588 Y36.95 E.17204
G1 X86.047 Y36.95 E.01685
G1 X91.167 Y42.07 E.22558
G1 X90.897 Y42.34 E.01191
G1 X84.481 Y35.925 E.28268
G1 X84.751 Y35.654 E.01191
G1 X85.739 Y36.643 E.04354
G1 X86.01 Y36.372 E.01191
G1 X85.022 Y35.384 E.04354
G1 X85.292 Y35.114 E.01191
G1 X86.28 Y36.102 E.04354
G1 X86.551 Y35.831 E.01191
G1 X85.563 Y34.843 E.04354
G1 X85.833 Y34.573 E.01191
G1 X86.821 Y35.561 E.04354
G1 X87.091 Y35.291 E.01191
G1 X86.103 Y34.303 E.04354
G1 X86.374 Y34.032 E.01191
G1 X87.362 Y35.02 E.04354
G1 X87.556 Y34.826 E.00857
G1 X87.576 Y34.694 E.00415
G1 X86.756 Y33.874 E.03612
G1 X87.297 Y33.874 E.01685
G1 X87.796 Y34.374 E.022
G1 X88.469 Y33.708 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.40035
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X88.086 Y34.092 E.0278
G1 X87.972 Y34.842 E.03893
G1 X88.904 Y33.911 E.06755
G1 X89.541 Y33.911 E.03267
G1 X86.914 Y36.537 E.1905
G1 X87.551 Y36.537 E.03267
G1 X90.178 Y33.911 E.19051
G1 X90.815 Y33.911 E.03267
G1 X88.188 Y36.537 E.19051
G1 X88.825 Y36.537 E.03267
G1 X91.452 Y33.911 E.19051
G1 X92.089 Y33.911 E.03267
G1 X89.444 Y36.554 E.19178
G3 X89.924 Y36.711 I-.229 J1.514 E.02602
G1 X92.726 Y33.911 E.20317
G1 X93.363 Y33.911 E.03267
G1 X90.297 Y36.975 E.22232
G3 X90.578 Y37.332 I-1.183 J1.221 E.02333
G1 X94 Y33.911 E.24817
G1 X94.637 Y33.911 E.03267
G1 X90.756 Y37.79 E.28145
G3 X90.767 Y38.416 I-1.841 J.347 E.03223
G1 X95.274 Y33.911 E.32682
G1 X95.911 Y33.911 E.03267
G1 X90.403 Y39.417 E.39943
G1 X90.406 Y39.589 E.00884
G3 X90.594 Y39.863 I-.612 J.622 E.01714
G1 X96.548 Y33.911 E.43179
G1 X97.185 Y33.911 E.03267
G1 X90.768 Y40.326 E.46538
G1 X90.913 Y40.817 E.0263
G1 X97.822 Y33.911 E.50106
G1 X98.459 Y33.911 E.03267
G1 X93.055 Y39.313 E.3919
G1 X93.373 Y39.631 E.0231
G1 X99.096 Y33.911 E.41501
G1 X99.733 Y33.911 E.03267
G1 X93.692 Y39.95 E.43812
G1 X93.782 Y40.04 E.00654
G1 X90.904 Y42.918 E.20878
G1 X91.131 Y43.146 E.01651
G1 X100.37 Y33.911 E.67
G1 X101.007 Y33.911 E.03267
G1 X80.57 Y54.339 E1.48206
G1 X81.207 Y54.339 E.03267
G1 X101.644 Y33.911 E1.48206
G1 X102.281 Y33.911 E.03267
G1 X81.844 Y54.339 E1.48206
G1 X82.481 Y54.339 E.03267
G1 X102.918 Y33.911 E1.48206
G1 X103.555 Y33.911 E.03267
G1 X83.118 Y54.339 E1.48206
G1 X83.755 Y54.339 E.03267
G1 X104.192 Y33.911 E1.48206
G1 X104.829 Y33.911 E.03267
G1 X84.393 Y54.339 E1.48206
G1 X85.03 Y54.339 E.03267
G1 X105.466 Y33.911 E1.48206
G1 X106.103 Y33.911 E.03267
G1 X85.667 Y54.339 E1.48206
G1 X86.304 Y54.339 E.03267
G1 X106.74 Y33.911 E1.48206
G1 X107.377 Y33.911 E.03267
G1 X86.941 Y54.339 E1.48206
G1 X87.578 Y54.339 E.03267
G1 X108.014 Y33.911 E1.48206
G1 X108.651 Y33.911 E.03267
G1 X88.215 Y54.339 E1.48206
G1 X88.852 Y54.339 E.03267
G1 X109.289 Y33.911 E1.48206
G1 X109.926 Y33.911 E.03267
M73 P65 R23
G1 X89.489 Y54.339 E1.48206
G1 X90.126 Y54.339 E.03267
G1 X110.563 Y33.911 E1.48206
G1 X111.2 Y33.911 E.03267
G1 X90.763 Y54.339 E1.48206
G1 X91.4 Y54.339 E.03267
G1 X111.837 Y33.911 E1.48206
G1 X112.474 Y33.911 E.03267
G1 X92.037 Y54.339 E1.48206
G1 X92.674 Y54.339 E.03267
G1 X113.111 Y33.911 E1.48206
G1 X113.748 Y33.911 E.03267
G1 X93.311 Y54.339 E1.48206
G1 X93.948 Y54.339 E.03267
G1 X114.385 Y33.911 E1.48206
G1 X115.022 Y33.911 E.03267
G1 X94.585 Y54.339 E1.48206
G1 X95.222 Y54.339 E.03267
G1 X115.659 Y33.911 E1.48206
G1 X116.296 Y33.911 E.03267
G1 X95.859 Y54.339 E1.48206
G1 X96.496 Y54.339 E.03267
G1 X116.933 Y33.911 E1.48206
G1 X117.57 Y33.911 E.03267
G1 X97.133 Y54.339 E1.48206
G1 X97.77 Y54.339 E.03267
G1 X118.207 Y33.911 E1.48206
G1 X118.844 Y33.911 E.03267
G1 X98.407 Y54.339 E1.48206
G1 X99.044 Y54.339 E.03267
G1 X119.481 Y33.911 E1.48206
G1 X120.118 Y33.911 E.03267
G1 X99.681 Y54.339 E1.48206
M73 P65 R22
G1 X100.318 Y54.339 E.03267
G1 X120.755 Y33.911 E1.48206
G1 X121.392 Y33.911 E.03267
G1 X100.955 Y54.339 E1.48206
G1 X101.592 Y54.339 E.03267
G1 X122.029 Y33.911 E1.48206
G1 X122.666 Y33.911 E.03267
G1 X102.229 Y54.339 E1.48206
G1 X102.866 Y54.339 E.03267
G1 X123.303 Y33.911 E1.48206
G1 X123.94 Y33.911 E.03267
G1 X103.503 Y54.339 E1.48206
G1 X104.14 Y54.339 E.03267
G1 X124.577 Y33.911 E1.48206
G1 X125.214 Y33.911 E.03267
G1 X104.777 Y54.339 E1.48206
G1 X105.414 Y54.339 E.03267
G1 X125.851 Y33.911 E1.48206
G1 X126.488 Y33.911 E.03267
G1 X106.051 Y54.339 E1.48206
G1 X106.688 Y54.339 E.03267
G1 X127.125 Y33.911 E1.48206
G1 X127.762 Y33.911 E.03267
G1 X107.325 Y54.339 E1.48206
G1 X107.962 Y54.339 E.03267
G1 X128.399 Y33.911 E1.48206
G1 X129.036 Y33.911 E.03267
G1 X108.6 Y54.339 E1.48206
G1 X109.237 Y54.339 E.03267
G1 X129.673 Y33.911 E1.48206
G1 X130.31 Y33.911 E.03267
G1 X109.874 Y54.339 E1.48206
G1 X110.511 Y54.339 E.03267
G1 X130.947 Y33.911 E1.48206
G1 X131.584 Y33.911 E.03267
G1 X111.148 Y54.339 E1.48206
G1 X111.785 Y54.339 E.03267
G1 X132.221 Y33.911 E1.48206
G1 X132.858 Y33.911 E.03267
G1 X112.219 Y54.542 E1.49675
G1 X79.731 Y54.542 F30000
G1 F3000
G1 X90.561 Y43.716 E.78538
G1 X90.424 Y43.716 E.00701
G1 X88.255 Y45.885 E.15735
G1 X88.004 Y45.635 E.01817
G1 X79.296 Y54.339 E.63149
G1 X78.659 Y54.339 E.03267
G1 X87.686 Y45.316 E.65459
G1 X87.367 Y44.998 E.0231
G1 X78.022 Y54.339 E.6777
G1 X77.385 Y54.339 E.03267
G1 X88.015 Y43.714 E.77083
G1 X87.378 Y43.714 E.03265
G1 X76.546 Y54.542 E.78556
G1 X29.583 Y34.624 F30000
G1 F3000
G1 X30.297 Y33.911 E.05176
G1 X30.934 Y33.911 E.03267
G1 X29.786 Y35.059 E.08328
G1 X29.786 Y35.696 E.03266
G1 X31.571 Y33.911 E.12947
G1 X32.208 Y33.911 E.03267
G1 X29.786 Y36.332 E.17567
G1 X29.786 Y36.969 E.03266
G1 X32.845 Y33.911 E.22187
G1 X33.482 Y33.911 E.03267
G1 X29.786 Y37.606 E.26806
G1 X29.786 Y38.243 E.03266
G1 X34.119 Y33.911 E.31426
G1 X34.756 Y33.911 E.03267
G1 X29.786 Y38.879 E.36046
G1 X29.786 Y39.516 E.03266
G1 X35.393 Y33.911 E.40665
G1 X36.03 Y33.911 E.03267
G1 X29.786 Y40.153 E.45285
G1 X29.786 Y40.79 E.03266
G1 X36.667 Y33.911 E.49904
G1 X37.305 Y33.911 E.03267
G1 X29.786 Y41.426 E.54524
G1 X29.786 Y42.063 E.03266
G1 X37.942 Y33.911 E.59144
G1 X38.579 Y33.911 E.03267
G1 X29.786 Y42.7 E.63763
G1 X29.786 Y43.337 E.03266
G1 X39.216 Y33.911 E.68383
G1 X39.853 Y33.911 E.03267
G1 X29.786 Y43.973 E.73003
G1 X29.786 Y44.61 E.03266
G1 X40.49 Y33.911 E.77622
G1 X41.127 Y33.911 E.03267
G1 X29.786 Y45.247 E.82242
G1 X29.786 Y45.884 E.03266
G1 X41.764 Y33.911 E.86862
G1 X42.401 Y33.911 E.03267
G1 X29.786 Y46.52 E.91481
G1 X29.786 Y47.157 E.03266
G1 X43.038 Y33.911 E.96101
G1 X43.675 Y33.911 E.03267
G1 X29.786 Y47.794 E1.00721
G1 X29.786 Y48.431 E.03266
G1 X44.312 Y33.911 E1.0534
G1 X44.949 Y33.911 E.03267
G1 X29.583 Y49.27 E1.11429
G1 X29.583 Y58.821 F30000
G1 F3000
G1 X40.788 Y47.621 E.81257
G3 X40.064 Y47.708 I-.79 J-3.506 E.03749
G1 X29.786 Y57.982 E.74536
G1 X29.786 Y57.345 E.03266
G1 X39.466 Y47.67 E.70195
G3 X38.947 Y47.552 I.332 J-2.653 E.02733
G1 X29.786 Y56.708 E.66434
G1 X29.786 Y56.072 E.03266
G1 X38.486 Y47.376 E.63089
G3 X38.076 Y47.148 I.931 J-2.161 E.02407
G1 X29.786 Y55.435 E.60118
G1 X29.786 Y54.798 E.03266
G1 X37.707 Y46.88 E.57444
G3 X37.377 Y46.573 I1.37 J-1.802 E.02315
G1 X29.786 Y54.161 E.55053
G1 X29.786 Y53.525 E.03266
G1 X37.092 Y46.222 E.52984
G3 X36.848 Y45.829 I1.841 J-1.42 E.02375
G1 X29.786 Y52.888 E.5121
G1 X29.786 Y52.251 E.03266
G1 X36.646 Y45.394 E.49748
G3 X36.521 Y44.999 I8.493 J-2.913 E.02125
G1 X36.501 Y44.902 E.00508
G1 X29.786 Y51.614 E.48697
G1 X29.786 Y50.978 E.03266
G1 X36.42 Y44.346 E.48113
G3 X36.442 Y43.687 I4.218 J-.191 E.03382
G1 X29.786 Y50.341 E.48271
G1 X29.786 Y49.704 E.03266
G1 X36.652 Y42.841 E.49794
G3 X38.714 Y40.78 I3.344 J1.283 E.15398
G1 X45.586 Y33.911 E.49835
G1 X46.223 Y33.911 E.03267
G1 X39.567 Y40.564 E.48266
G1 X40.222 Y40.546 E.03357
G1 X46.86 Y33.911 E.4814
G1 X47.497 Y33.911 E.03267
G1 X40.778 Y40.627 E.48723
G3 X41.061 Y40.701 I-.44 J2.254 E.01503
G1 X41.271 Y40.771 E.01132
G1 X48.134 Y33.911 E.49772
G1 X48.771 Y33.911 E.03267
G1 X41.707 Y40.972 E.5123
G3 X42.097 Y41.219 I-1.039 J2.076 E.02372
G1 X49.408 Y33.911 E.53019
G1 X50.045 Y33.911 E.03267
M73 P66 R22
G1 X42.448 Y41.505 E.55097
G3 X42.758 Y41.831 I-4.108 J4.227 E.02311
G1 X50.682 Y33.911 E.57462
G1 X51.319 Y33.911 E.03267
G1 X43.025 Y42.202 E.60151
G3 X43.25 Y42.614 I-1.945 J1.331 E.02411
G1 X51.956 Y33.911 E.63138
G1 X52.593 Y33.911 E.03267
G1 X43.43 Y43.071 E.66454
G3 X43.544 Y43.593 I-2.549 J.832 E.02747
G1 X53.23 Y33.911 E.70244
G1 X53.867 Y33.911 E.03267
G1 X43.585 Y44.189 E.74566
G3 X43.497 Y44.913 I-3.948 J-.11 E.03747
G1 X54.504 Y33.911 E.7982
G1 X55.141 Y33.911 E.03267
G1 X29.786 Y59.255 E1.83875
G1 X29.786 Y59.892 E.03266
G1 X55.778 Y33.911 E1.88494
G1 X56.415 Y33.911 E.03267
G1 X29.786 Y60.529 E1.93114
G1 X29.786 Y61.166 E.03266
G1 X57.052 Y33.911 E1.97734
G1 X57.689 Y33.911 E.03267
G1 X29.786 Y61.803 E2.02353
G1 X29.786 Y62.439 E.03266
G1 X58.326 Y33.911 E2.06973
G1 X58.963 Y33.911 E.03267
G1 X29.786 Y63.076 E2.11593
G1 X29.786 Y63.713 E.03266
G1 X59.6 Y33.911 E2.16212
G1 X60.237 Y33.911 E.03267
G1 X29.786 Y64.35 E2.20832
G1 X29.786 Y64.986 E.03266
G1 X60.875 Y33.911 E2.25452
G1 X61.512 Y33.911 E.03267
G1 X29.786 Y65.623 E2.30071
G1 X29.786 Y66.26 E.03266
G1 X62.149 Y33.911 E2.34691
G1 X62.786 Y33.911 E.03267
G1 X29.786 Y66.897 E2.3931
G1 X29.786 Y67.533 E.03266
G1 X63.423 Y33.911 E2.4393
G1 X64.06 Y33.911 E.03267
G1 X29.786 Y68.17 E2.4855
G1 X29.786 Y68.807 E.03266
G1 X64.697 Y33.911 E2.53169
G1 X65.334 Y33.911 E.03267
G1 X29.786 Y69.444 E2.57789
G1 X29.786 Y70.08 E.03266
G1 X65.971 Y33.911 E2.62409
G1 X66.608 Y33.911 E.03267
G1 X29.786 Y70.717 E2.67028
G1 X29.786 Y71.354 E.03266
G1 X67.245 Y33.911 E2.71648
G1 X67.882 Y33.911 E.03267
G1 X29.786 Y71.991 E2.76268
G1 X29.786 Y72.627 E.03266
G1 X68.519 Y33.911 E2.80887
G1 X69.156 Y33.911 E.03267
G1 X29.786 Y73.264 E2.85507
G1 X29.786 Y73.901 E.03266
G1 X69.793 Y33.911 E2.90127
G1 X70.43 Y33.911 E.03267
G1 X29.583 Y74.74 E2.96215
; WIPE_START
G1 X30.998 Y73.326 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X38.191 Y70.773 Z2.6 F30000
G1 X142.616 Y33.708 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F3000
G1 X131.523 Y44.797 E.8045
G2 X131.587 Y44.097 I-4.482 J-.762 E.03612
G1 X141.777 Y33.911 E.73898
G1 X141.14 Y33.911 E.03267
G1 X131.532 Y43.515 E.69674
G2 X131.406 Y43.004 I-4.076 J.739 E.02699
G1 X140.503 Y33.911 E.65971
G1 X139.866 Y33.911 E.03267
G1 X131.22 Y42.553 E.62695
G2 X130.99 Y42.146 I-2.149 J.947 E.02401
G1 X139.229 Y33.911 E.59744
G1 X138.592 Y33.911 E.03267
G1 X130.716 Y41.783 E.57114
G2 X130.399 Y41.463 I-3.143 J2.787 E.02311
G1 X137.955 Y33.911 E.5479
G1 X137.318 Y33.911 E.03267
G1 X130.044 Y41.181 E.52745
G2 X129.649 Y40.939 I-1.561 J2.105 E.02379
G1 X136.681 Y33.911 E.5099
G1 X136.044 Y33.911 E.03267
G1 X129.203 Y40.749 E.49607
G2 X128.96 Y40.668 I-.492 J1.081 E.01316
G1 X128.705 Y40.61 E.01343
G1 X135.407 Y33.911 E.48602
G1 X134.77 Y33.911 E.03267
G1 X128.131 Y40.547 E.48142
G2 X127.459 Y40.581 I-.162 J3.375 E.03456
G1 X134.133 Y33.911 E.48394
G1 X133.496 Y33.911 E.03267
G1 X126.565 Y40.838 E.50258
G2 X124.718 Y42.685 I1.453 J3.3 E.13707
G1 X113.059 Y54.339 E.84553
G1 X113.696 Y54.339 E.03267
M73 P66 R21
G1 X124.453 Y43.587 E.78008
G2 X124.416 Y44.26 I5.109 J.613 E.0346
G1 X114.333 Y54.339 E.73125
G1 X114.97 Y54.339 E.03267
G1 X124.486 Y44.827 E.69009
G2 X124.621 Y45.329 I2.989 J-.537 E.02668
G1 X115.607 Y54.339 E.6537
G1 X116.244 Y54.339 E.03267
G1 X124.816 Y45.771 E.62162
G2 X124.945 Y46.005 I10.239 J-5.48 E.01373
G1 X125.055 Y46.168 E.01009
G1 X116.881 Y54.339 E.59281
G1 X117.518 Y54.339 E.03267
G1 X125.335 Y46.525 E.56692
G2 X125.657 Y46.84 I3.989 J-3.744 E.02311
G1 X118.155 Y54.339 E.54404
G1 X118.792 Y54.339 E.03267
G1 X126.021 Y47.113 E.52425
G2 X126.426 Y47.345 I1.363 J-1.907 E.02397
G1 X119.429 Y54.339 E.50741
G1 X120.066 Y54.339 E.03267
G1 X126.876 Y47.532 E.49388
G2 X127.389 Y47.656 I.879 J-2.499 E.02709
G1 X120.703 Y54.339 E.48484
G1 X121.34 Y54.339 E.03267
G1 X127.971 Y47.711 E.4809
G2 X128.671 Y47.648 I-.024 J-4.194 E.03609
G1 X121.977 Y54.339 E.48546
G1 X122.614 Y54.339 E.03267
G1 X143.051 Y33.911 E1.48206
G1 X143.688 Y33.911 E.03267
G1 X123.251 Y54.339 E1.48206
G1 X123.888 Y54.339 E.03267
G1 X144.325 Y33.911 E1.48206
G1 X144.962 Y33.911 E.03267
G1 X124.525 Y54.339 E1.48206
G1 X125.162 Y54.339 E.03267
G1 X145.599 Y33.911 E1.48206
G1 X146.236 Y33.911 E.03267
G1 X125.799 Y54.339 E1.48206
G1 X126.436 Y54.339 E.03267
G1 X146.873 Y33.911 E1.48206
G1 X147.51 Y33.911 E.03267
G1 X127.073 Y54.339 E1.48206
G1 X127.71 Y54.339 E.03267
G1 X148.147 Y33.911 E1.48206
G1 X148.784 Y33.911 E.03267
G1 X128.347 Y54.339 E1.48206
G1 X128.984 Y54.339 E.03267
G1 X149.421 Y33.911 E1.48206
G1 X150.058 Y33.911 E.03267
G1 X129.621 Y54.339 E1.48206
G1 X130.258 Y54.339 E.03267
G1 X150.695 Y33.911 E1.48206
G1 X151.332 Y33.911 E.03267
G1 X130.895 Y54.339 E1.48206
G1 X131.532 Y54.339 E.03267
G1 X151.969 Y33.911 E1.48206
G1 X152.606 Y33.911 E.03267
G1 X132.169 Y54.339 E1.48206
G1 X132.807 Y54.339 E.03267
G1 X153.243 Y33.911 E1.48206
G1 X153.88 Y33.911 E.03267
G1 X133.444 Y54.339 E1.48206
G1 X134.081 Y54.339 E.03267
G1 X154.517 Y33.911 E1.48206
G1 X155.154 Y33.911 E.03267
G1 X134.718 Y54.339 E1.48206
G1 X135.355 Y54.339 E.03267
G1 X155.791 Y33.911 E1.48206
G1 X156.428 Y33.911 E.03267
G1 X135.992 Y54.339 E1.48206
G1 X136.629 Y54.339 E.03267
G1 X157.065 Y33.911 E1.48206
G1 X157.703 Y33.911 E.03267
G1 X137.266 Y54.339 E1.48206
M73 P67 R21
G1 X137.903 Y54.339 E.03267
G1 X158.34 Y33.911 E1.48206
G1 X158.977 Y33.911 E.03267
G1 X138.54 Y54.339 E1.48206
G1 X139.177 Y54.339 E.03267
G1 X159.614 Y33.911 E1.48206
G1 X160.251 Y33.911 E.03267
G1 X139.814 Y54.339 E1.48206
G1 X140.451 Y54.339 E.03267
G1 X160.888 Y33.911 E1.48206
G1 X161.525 Y33.911 E.03267
G1 X141.088 Y54.339 E1.48206
G1 X141.725 Y54.339 E.03267
G1 X162.162 Y33.911 E1.48206
G1 X162.799 Y33.911 E.03267
G1 X142.362 Y54.339 E1.48206
G1 X142.999 Y54.339 E.03267
G1 X163.436 Y33.911 E1.48206
G1 X164.073 Y33.911 E.03267
G1 X143.636 Y54.339 E1.48206
G1 X144.273 Y54.339 E.03267
G1 X164.71 Y33.911 E1.48206
G1 X165.347 Y33.911 E.03267
G1 X144.91 Y54.339 E1.48206
G1 X145.547 Y54.339 E.03267
G1 X165.984 Y33.911 E1.48206
G1 X166.621 Y33.911 E.03267
G1 X146.184 Y54.339 E1.48206
G1 X146.821 Y54.339 E.03267
G1 X167.258 Y33.911 E1.48206
G1 X167.895 Y33.911 E.03267
G1 X147.458 Y54.339 E1.48206
G1 X148.095 Y54.339 E.03267
G1 X168.532 Y33.911 E1.48206
G1 X169.169 Y33.911 E.03267
G1 X148.732 Y54.339 E1.48206
G1 X149.369 Y54.339 E.03267
G1 X169.806 Y33.911 E1.48206
G1 X170.443 Y33.911 E.03267
G1 X150.006 Y54.339 E1.48206
G1 X150.643 Y54.339 E.03267
G1 X171.08 Y33.911 E1.48206
G1 X171.717 Y33.911 E.03267
G1 X151.28 Y54.339 E1.48206
G1 X151.917 Y54.339 E.03267
G1 X172.354 Y33.911 E1.48206
G1 X172.991 Y33.911 E.03267
G1 X152.554 Y54.339 E1.48206
G1 X153.191 Y54.339 E.03267
G1 X173.628 Y33.911 E1.48206
G1 X174.265 Y33.911 E.03267
G1 X153.828 Y54.339 E1.48206
G1 X154.465 Y54.339 E.03267
G1 X174.902 Y33.911 E1.48206
G1 X175.539 Y33.911 E.03267
G1 X155.102 Y54.339 E1.48206
G1 X155.739 Y54.339 E.03267
G1 X176.176 Y33.911 E1.48206
G1 X176.813 Y33.911 E.03267
G1 X156.376 Y54.339 E1.48206
G1 X157.014 Y54.339 E.03267
G1 X177.45 Y33.911 E1.48206
G1 X178.087 Y33.911 E.03267
G1 X157.651 Y54.339 E1.48206
G1 X158.288 Y54.339 E.03267
G1 X178.724 Y33.911 E1.48206
G1 X179.361 Y33.911 E.03267
G1 X158.925 Y54.339 E1.48206
G1 X159.562 Y54.339 E.03267
G1 X179.998 Y33.911 E1.48206
G1 X180.635 Y33.911 E.03267
G1 X160.199 Y54.339 E1.48206
G1 X160.836 Y54.339 E.03267
G1 X181.272 Y33.911 E1.48206
G1 X181.91 Y33.911 E.03267
G1 X161.473 Y54.339 E1.48206
G1 X162.11 Y54.339 E.03267
G1 X182.547 Y33.911 E1.48206
G1 X183.184 Y33.911 E.03267
G1 X162.747 Y54.339 E1.48206
G1 X163.384 Y54.339 E.03267
G1 X183.821 Y33.911 E1.48206
G1 X184.458 Y33.911 E.03267
G1 X164.021 Y54.339 E1.48206
G1 X164.658 Y54.339 E.03267
G1 X185.095 Y33.911 E1.48206
G1 X185.732 Y33.911 E.03267
G1 X165.295 Y54.339 E1.48206
G1 X165.932 Y54.339 E.03267
G1 X186.369 Y33.911 E1.48206
G1 X187.006 Y33.911 E.03267
G1 X166.569 Y54.339 E1.48206
G1 X167.206 Y54.339 E.03267
G1 X187.643 Y33.911 E1.48206
G1 X188.28 Y33.911 E.03267
G1 X167.843 Y54.339 E1.48206
G1 X168.48 Y54.339 E.03267
G1 X188.917 Y33.911 E1.48206
G1 X189.554 Y33.911 E.03267
G1 X169.117 Y54.339 E1.48206
G1 X169.754 Y54.339 E.03267
G1 X190.191 Y33.911 E1.48206
G1 X190.828 Y33.911 E.03267
G1 X170.391 Y54.339 E1.48206
G1 X171.028 Y54.339 E.03267
G1 X191.465 Y33.911 E1.48206
G1 X192.102 Y33.911 E.03267
G1 X171.665 Y54.339 E1.48206
G1 X172.302 Y54.339 E.03267
G1 X192.739 Y33.911 E1.48206
G1 X193.376 Y33.911 E.03267
G1 X172.939 Y54.339 E1.48206
G1 X173.576 Y54.339 E.03267
G1 X194.013 Y33.911 E1.48206
G1 X194.65 Y33.911 E.03267
G1 X174.213 Y54.339 E1.48206
G1 X174.85 Y54.339 E.03267
G1 X195.287 Y33.911 E1.48206
G1 X195.924 Y33.911 E.03267
G1 X175.487 Y54.339 E1.48206
G1 X176.124 Y54.339 E.03267
G1 X196.561 Y33.911 E1.48206
G1 X197.198 Y33.911 E.03267
G1 X176.761 Y54.339 E1.48206
G1 X177.398 Y54.339 E.03267
G1 X197.835 Y33.911 E1.48206
G1 X198.472 Y33.911 E.03267
G1 X178.035 Y54.339 E1.48206
G1 X178.672 Y54.339 E.03267
G1 X199.109 Y33.911 E1.48206
G1 X199.746 Y33.911 E.03267
G1 X179.309 Y54.339 E1.48206
G1 X179.946 Y54.339 E.03267
G1 X200.383 Y33.911 E1.48206
M73 P68 R21
G1 X201.02 Y33.911 E.03267
G1 X180.583 Y54.339 E1.48206
G1 X181.221 Y54.339 E.03267
G1 X201.657 Y33.911 E1.48206
G1 X202.294 Y33.911 E.03267
G1 X181.858 Y54.339 E1.48206
G1 X182.495 Y54.339 E.03267
G1 X202.931 Y33.911 E1.48206
G1 X203.568 Y33.911 E.03267
G1 X183.132 Y54.339 E1.48206
G1 X183.769 Y54.339 E.03267
G1 X204.205 Y33.911 E1.48206
G1 X204.842 Y33.911 E.03267
G1 X184.406 Y54.339 E1.48206
G1 X185.043 Y54.339 E.03267
G1 X205.479 Y33.911 E1.48206
G1 X206.117 Y33.911 E.03267
G1 X185.68 Y54.339 E1.48206
G1 X186.317 Y54.339 E.03267
G1 X206.754 Y33.911 E1.48206
G1 X207.391 Y33.911 E.03267
G1 X186.954 Y54.339 E1.48206
M73 P68 R20
G1 X187.591 Y54.339 E.03267
G1 X208.028 Y33.911 E1.48206
G1 X208.665 Y33.911 E.03267
G1 X188.228 Y54.339 E1.48206
G1 X188.865 Y54.339 E.03267
G1 X209.302 Y33.911 E1.48206
G1 X209.939 Y33.911 E.03267
G1 X189.502 Y54.339 E1.48206
G1 X190.139 Y54.339 E.03267
G1 X210.576 Y33.911 E1.48206
G1 X211.213 Y33.911 E.03267
G1 X190.776 Y54.339 E1.48206
G1 X191.413 Y54.339 E.03267
G1 X211.85 Y33.911 E1.48206
G1 X212.487 Y33.911 E.03267
G1 X192.05 Y54.339 E1.48206
G1 X192.687 Y54.339 E.03267
G1 X213.124 Y33.911 E1.48206
G1 X213.761 Y33.911 E.03267
G1 X193.324 Y54.339 E1.48206
G1 X193.961 Y54.339 E.03267
G1 X214.398 Y33.911 E1.48206
G1 X215.035 Y33.911 E.03267
G1 X194.598 Y54.339 E1.48206
G1 X195.235 Y54.339 E.03267
G1 X215.672 Y33.911 E1.48206
G1 X216.309 Y33.911 E.03267
G1 X195.872 Y54.339 E1.48206
G1 X196.509 Y54.339 E.03267
G1 X216.946 Y33.911 E1.48206
G1 X217.583 Y33.911 E.03267
G1 X197.146 Y54.339 E1.48206
G1 X197.783 Y54.339 E.03267
G1 X218.22 Y33.911 E1.48206
G1 X218.857 Y33.911 E.03267
G1 X198.42 Y54.339 E1.48206
G1 X199.057 Y54.339 E.03267
G1 X219.494 Y33.911 E1.48206
G1 X220.131 Y33.911 E.03267
G1 X199.694 Y54.339 E1.48206
G1 X200.331 Y54.339 E.03267
G1 X220.768 Y33.911 E1.48206
G1 X221.405 Y33.911 E.03267
G1 X200.766 Y54.542 E1.49675
; WIPE_START
G1 X202.18 Y53.128 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X205.583 Y59.277 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
G1 F3000
G1 X217.474 Y47.391 E.86232
G3 X216.562 Y47.666 I-1.301 J-2.666 E.04907
G1 X205.786 Y58.438 E.78149
G1 X205.786 Y57.801 E.03266
G1 X215.882 Y47.71 E.73213
G1 X215.632 Y47.691 E.01285
G3 X215.312 Y47.643 I.324 J-3.213 E.01661
G1 X205.786 Y57.165 E.69081
G1 X205.786 Y56.528 E.03266
G1 X214.81 Y47.508 E.65441
G3 X214.366 Y47.315 I.742 J-2.312 E.02486
G1 X205.786 Y55.891 E.62222
G1 X205.786 Y55.254 E.03266
G1 X213.966 Y47.078 E.59322
G3 X213.608 Y46.798 I3.265 J-4.552 E.02328
G1 X205.786 Y54.618 E.56728
G1 X205.786 Y54.339 E.01428
G1 X205.428 Y54.339 E.01838
G1 X213.294 Y46.476 E.57049
G3 X213.019 Y46.114 I1.663 J-1.553 E.02335
G1 X204.79 Y54.339 E.59671
G1 X204.153 Y54.339 E.03267
G1 X212.784 Y45.712 E.62586
G3 X212.6 Y45.26 I4.316 J-2.019 E.02508
G1 X203.516 Y54.339 E.65871
G1 X202.879 Y54.339 E.03267
G1 X212.471 Y44.752 E.69554
G3 X212.416 Y44.169 I3.737 J-.642 E.03004
G1 X202.242 Y54.339 E.7378
G1 X201.605 Y54.339 E.03267
G1 X212.746 Y43.203 E.8079
; WIPE_START
G1 X211.331 Y44.617 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X215.078 Y40.872 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
G1 F3000
G1 X222.042 Y33.911 E.50501
G1 X222.679 Y33.911 E.03267
G1 X216.04 Y40.547 E.48144
G3 X216.631 Y40.593 I-.014 J3.972 E.03042
G1 X223.316 Y33.911 E.4848
G1 X223.953 Y33.911 E.03267
G1 X217.135 Y40.726 E.49442
G3 X217.463 Y40.854 I-.475 J1.704 E.01808
G1 X217.588 Y40.91 E.00703
G1 X224.59 Y33.911 E.50778
G1 X225.227 Y33.911 E.03267
G1 X217.992 Y41.143 E.52471
G3 X218.352 Y41.421 I-1.208 J1.938 E.02333
G1 X225.864 Y33.911 E.54482
G1 X226.214 Y33.911 E.01794
G1 X226.214 Y34.198 E.01473
G1 X218.672 Y41.736 E.54691
G3 X218.955 Y42.091 I-1.634 J1.592 E.02328
G1 X226.214 Y34.835 E.52642
G1 X226.214 Y35.472 E.03266
G1 X219.191 Y42.492 E.5093
G3 X219.382 Y42.938 I-2.58 J1.366 E.02492
G1 X226.214 Y36.108 E.49548
G1 X226.214 Y36.745 E.03266
G1 X219.52 Y43.436 E.48543
G3 X219.582 Y44.011 I-2.846 J.598 E.02969
G1 X226.214 Y37.382 E.48092
G1 X226.214 Y38.019 E.03266
G1 X219.539 Y44.691 E.48408
G3 X219.268 Y45.599 I-2.94 J-.383 E.04878
G1 X226.214 Y38.655 E.50372
G1 X226.214 Y39.292 E.03266
G1 X205.786 Y59.712 E1.48143
G1 X205.786 Y60.348 E.03266
G1 X226.214 Y39.929 E1.48143
G1 X226.214 Y40.566 E.03266
G1 X205.786 Y60.985 E1.48143
G1 X205.786 Y61.622 E.03266
G1 X226.214 Y41.202 E1.48143
G1 X226.214 Y41.839 E.03266
G1 X205.786 Y62.259 E1.48143
G1 X205.786 Y62.895 E.03266
G1 X226.214 Y42.476 E1.48143
G1 X226.214 Y43.113 E.03266
G1 X205.786 Y63.532 E1.48143
G1 X205.786 Y64.169 E.03266
G1 X226.214 Y43.749 E1.48143
G1 X226.214 Y44.386 E.03266
G1 X205.786 Y64.806 E1.48143
G1 X205.786 Y65.442 E.03266
G1 X226.214 Y45.023 E1.48143
G1 X226.214 Y45.66 E.03266
G1 X205.786 Y66.079 E1.48143
M73 P69 R20
G1 X205.786 Y66.716 E.03266
G1 X226.214 Y46.296 E1.48143
G1 X226.214 Y46.933 E.03266
G1 X205.786 Y67.353 E1.48143
G1 X205.786 Y67.989 E.03266
G1 X226.214 Y47.57 E1.48143
G1 X226.214 Y48.207 E.03266
G1 X205.786 Y68.626 E1.48143
G1 X205.786 Y69.263 E.03266
G1 X226.214 Y48.843 E1.48143
G1 X226.214 Y49.48 E.03266
G1 X205.786 Y69.9 E1.48143
G1 X205.786 Y70.536 E.03266
G1 X226.214 Y50.117 E1.48143
G1 X226.214 Y50.754 E.03266
G1 X205.786 Y71.173 E1.48143
G1 X205.786 Y71.81 E.03266
G1 X226.214 Y51.39 E1.48143
G1 X226.214 Y52.027 E.03266
G1 X205.786 Y72.447 E1.48143
G1 X205.786 Y73.083 E.03266
G1 X226.214 Y52.664 E1.48143
G1 X226.214 Y53.301 E.03266
G1 X205.786 Y73.72 E1.48143
G1 X205.786 Y74.357 E.03266
G1 X226.214 Y53.938 E1.48143
G1 X226.214 Y54.574 E.03266
G1 X205.786 Y74.994 E1.48143
G1 X205.786 Y75.63 E.03266
G1 X226.214 Y55.211 E1.48143
G1 X226.214 Y55.848 E.03266
G1 X205.786 Y76.267 E1.48143
G1 X205.786 Y76.904 E.03266
G1 X226.214 Y56.485 E1.48143
G1 X226.214 Y57.121 E.03266
G1 X205.786 Y77.541 E1.48143
G1 X205.786 Y78.178 E.03266
G1 X226.214 Y57.758 E1.48143
G1 X226.214 Y58.395 E.03266
G1 X205.786 Y78.814 E1.48143
G1 X205.786 Y79.451 E.03266
G1 X226.214 Y59.032 E1.48143
G1 X226.214 Y59.668 E.03266
G1 X205.786 Y80.088 E1.48143
G1 X205.786 Y80.725 E.03266
G1 X226.214 Y60.305 E1.48143
G1 X226.214 Y60.942 E.03266
G1 X205.786 Y81.361 E1.48143
G1 X205.786 Y81.998 E.03266
G1 X226.214 Y61.579 E1.48143
G1 X226.214 Y62.215 E.03266
G1 X205.786 Y82.635 E1.48143
G1 X205.786 Y83.272 E.03266
G1 X226.214 Y62.852 E1.48143
G1 X226.214 Y63.489 E.03266
G1 X205.786 Y83.908 E1.48143
G1 X205.786 Y84.545 E.03266
G1 X226.214 Y64.126 E1.48143
G1 X226.214 Y64.762 E.03266
G1 X205.786 Y85.182 E1.48143
G1 X205.786 Y85.819 E.03266
G1 X226.214 Y65.399 E1.48143
G1 X226.214 Y66.036 E.03266
G1 X205.786 Y86.455 E1.48143
G1 X205.786 Y87.092 E.03266
G1 X226.214 Y66.673 E1.48143
G1 X226.214 Y67.309 E.03266
G1 X205.786 Y87.729 E1.48143
G1 X205.786 Y88.366 E.03266
G1 X226.214 Y67.946 E1.48143
G1 X226.214 Y68.583 E.03266
G1 X205.786 Y89.002 E1.48143
G1 X205.786 Y89.639 E.03266
G1 X226.214 Y69.22 E1.48143
G1 X226.214 Y69.856 E.03266
G1 X205.786 Y90.276 E1.48143
G1 X205.786 Y90.913 E.03266
G1 X226.214 Y70.493 E1.48143
G1 X226.214 Y71.13 E.03266
G1 X205.786 Y91.549 E1.48143
G1 X205.786 Y92.186 E.03266
G1 X226.214 Y71.767 E1.48143
G1 X226.214 Y72.403 E.03266
G1 X205.786 Y92.823 E1.48143
G1 X205.786 Y93.46 E.03266
G1 X226.214 Y73.04 E1.48143
G1 X226.214 Y73.677 E.03266
G1 X205.786 Y94.096 E1.48143
G1 X205.786 Y94.733 E.03266
G1 X226.214 Y74.314 E1.48143
G1 X226.214 Y74.95 E.03266
G1 X205.786 Y95.37 E1.48143
G1 X205.786 Y96.007 E.03266
G1 X226.214 Y75.587 E1.48143
G1 X226.214 Y76.224 E.03266
G1 X205.786 Y96.643 E1.48143
G1 X205.786 Y97.28 E.03266
G1 X226.214 Y76.861 E1.48143
G1 X226.214 Y77.497 E.03266
G1 X205.786 Y97.917 E1.48143
G1 X205.786 Y98.554 E.03266
G1 X226.214 Y78.134 E1.48143
G1 X226.214 Y78.771 E.03266
G1 X205.786 Y99.19 E1.48143
G1 X205.786 Y99.827 E.03266
G1 X226.214 Y79.408 E1.48143
G1 X226.214 Y80.045 E.03266
G1 X205.786 Y100.464 E1.48143
G1 X205.786 Y101.101 E.03266
G1 X226.214 Y80.681 E1.48143
M73 P69 R19
G1 X226.214 Y81.318 E.03266
G1 X205.786 Y101.737 E1.48143
G1 X205.786 Y102.374 E.03266
G1 X226.214 Y81.955 E1.48143
G1 X226.214 Y82.592 E.03266
G1 X205.786 Y103.011 E1.48143
G1 X205.786 Y103.648 E.03266
G1 X226.214 Y83.228 E1.48143
G1 X226.214 Y83.865 E.03266
G1 X205.786 Y104.284 E1.48143
G1 X205.786 Y104.921 E.03266
G1 X226.214 Y84.502 E1.48143
G1 X226.214 Y85.139 E.03266
G1 X205.786 Y105.558 E1.48143
G1 X205.786 Y106.195 E.03266
G1 X226.214 Y85.775 E1.48143
G1 X226.214 Y86.412 E.03266
G1 X205.786 Y106.832 E1.48143
G1 X205.786 Y107.468 E.03266
G1 X226.214 Y87.049 E1.48143
G1 X226.214 Y87.686 E.03266
G1 X205.786 Y108.105 E1.48143
G1 X205.786 Y108.742 E.03266
G1 X226.214 Y88.322 E1.48143
G1 X226.214 Y88.959 E.03266
G1 X205.786 Y109.379 E1.48143
G1 X205.786 Y110.015 E.03266
G1 X226.214 Y89.596 E1.48143
G1 X226.214 Y90.233 E.03266
G1 X205.786 Y110.652 E1.48143
G1 X205.786 Y111.289 E.03266
G1 X226.214 Y90.869 E1.48143
G1 X226.214 Y91.506 E.03266
G1 X205.786 Y111.926 E1.48143
G1 X205.786 Y112.562 E.03266
G1 X226.214 Y92.143 E1.48143
G1 X226.214 Y92.78 E.03266
G1 X205.786 Y113.199 E1.48143
G1 X205.786 Y113.836 E.03266
G1 X226.214 Y93.416 E1.48143
G1 X226.214 Y94.053 E.03266
G1 X205.786 Y114.473 E1.48143
M73 P70 R19
G1 X205.786 Y115.109 E.03266
G1 X226.214 Y94.69 E1.48143
G1 X226.214 Y95.327 E.03266
G1 X205.786 Y115.746 E1.48143
G1 X205.786 Y116.383 E.03266
G1 X226.214 Y95.963 E1.48143
G1 X226.214 Y96.6 E.03266
G1 X205.786 Y117.02 E1.48143
G1 X205.786 Y117.656 E.03266
G1 X226.214 Y97.237 E1.48143
G1 X226.214 Y97.874 E.03266
G1 X205.786 Y118.293 E1.48143
G1 X205.786 Y118.93 E.03266
G1 X226.214 Y98.51 E1.48143
G1 X226.214 Y99.147 E.03266
G1 X205.786 Y119.567 E1.48143
G1 X205.786 Y120.203 E.03266
G1 X226.214 Y99.784 E1.48143
G1 X226.214 Y100.421 E.03266
G1 X205.786 Y120.84 E1.48143
G1 X205.786 Y121.477 E.03266
G1 X226.214 Y101.057 E1.48143
G1 X226.214 Y101.694 E.03266
G1 X205.786 Y122.114 E1.48143
G1 X205.786 Y122.75 E.03266
G1 X226.214 Y102.331 E1.48143
G1 X226.214 Y102.968 E.03266
G1 X205.786 Y123.387 E1.48143
G1 X205.786 Y124.024 E.03266
G1 X226.214 Y103.604 E1.48143
G1 X226.214 Y104.241 E.03266
G1 X205.786 Y124.661 E1.48143
G1 X205.786 Y125.297 E.03266
G1 X226.214 Y104.878 E1.48143
G1 X226.214 Y105.515 E.03266
G1 X205.786 Y125.934 E1.48143
G1 X205.786 Y126.571 E.03266
G1 X226.214 Y106.151 E1.48143
G1 X226.214 Y106.788 E.03266
G1 X205.786 Y127.208 E1.48143
G1 X205.786 Y127.844 E.03266
G1 X226.214 Y107.425 E1.48143
G1 X226.214 Y108.062 E.03266
G1 X205.786 Y128.481 E1.48143
G1 X205.786 Y129.118 E.03266
G1 X226.214 Y108.699 E1.48143
G1 X226.214 Y109.335 E.03266
G1 X205.786 Y129.755 E1.48143
G1 X205.786 Y130.391 E.03266
G1 X226.214 Y109.972 E1.48143
G1 X226.214 Y110.609 E.03266
G1 X205.583 Y131.231 E1.49612
G1 X205.583 Y140.782 F30000
G1 F3000
G1 X216.9 Y129.471 E.82065
G3 X216.152 Y129.581 I-1.012 J-4.264 E.03881
G1 X205.786 Y139.943 E.75175
G1 X205.786 Y139.306 E.03266
G1 X215.539 Y129.558 E.70725
G3 X215.014 Y129.445 I.298 J-2.677 E.02757
G1 X205.786 Y138.669 E.6692
G1 X205.786 Y138.033 E.03266
G1 X214.544 Y129.278 E.63512
G3 X214.128 Y129.057 I2.272 J-4.774 E.02416
G1 X205.786 Y137.396 E.60497
G1 X205.786 Y136.759 E.03266
G1 X213.755 Y128.793 E.57791
G3 X213.421 Y128.491 I1.377 J-1.854 E.02316
G1 X205.786 Y136.122 E.55368
G1 X205.786 Y135.486 E.03266
G1 X213.127 Y128.148 E.53236
G3 X212.878 Y127.76 I1.817 J-1.441 E.02368
G1 X205.786 Y134.849 E.51429
G1 X205.786 Y134.212 E.03266
G1 X212.671 Y127.33 E.49932
G3 X212.515 Y126.849 I4.254 J-1.646 E.02594
G1 X205.786 Y133.575 E.48801
G1 X205.786 Y132.939 E.03266
G1 X212.428 Y126.299 E.4817
G3 X212.433 Y125.658 I3.642 J-.296 E.03292
G1 X205.786 Y132.302 E.48201
G1 X205.786 Y131.665 E.03266
G1 X212.605 Y124.849 E.49449
G3 X213.008 Y124.027 I3.365 J1.14 E.04708
G3 X214.701 Y122.66 I2.977 J1.954 E.11344
G1 X214.855 Y122.599 E.00852
G1 X226.214 Y111.246 E.82372
G1 X226.214 Y111.882 E.03266
G1 X215.66 Y122.432 E.76536
G3 X216.263 Y122.421 I.374 J4.176 E.03095
G1 X216.303 Y122.426 E.00205
G1 X226.214 Y112.519 E.71876
G1 X226.214 Y113.156 E.03266
G1 X216.848 Y122.518 E.67921
G3 X217.333 Y122.67 I-1.185 J4.626 E.02607
G1 X226.214 Y113.793 E.64405
G1 X226.214 Y114.429 E.03266
G1 X217.761 Y122.879 E.613
G3 X218.087 Y123.087 I-.875 J1.73 E.01988
G1 X218.147 Y123.13 E.00377
G1 X226.214 Y115.066 E.58502
G1 X226.214 Y115.703 E.03266
G1 X218.493 Y123.421 E.55992
G3 X218.795 Y123.755 I-4.216 J4.111 E.02313
G1 X226.214 Y116.34 E.538
G1 X226.214 Y116.976 E.03266
G1 X219.057 Y124.13 E.51901
G3 X219.278 Y124.547 I-1.969 J1.309 E.02421
G1 X226.214 Y117.613 E.50302
G1 X226.214 Y118.25 E.03266
G1 X219.447 Y125.014 E.49074
G3 X219.555 Y125.543 I-3.511 J.994 E.0277
G1 X226.214 Y118.887 E.48289
G1 X226.214 Y119.523 E.03266
G1 X219.58 Y126.154 E.48106
G3 X219.468 Y126.903 I-3.596 J-.156 E.03892
G1 X226.214 Y120.16 E.48921
G1 X226.214 Y120.797 E.03266
G1 X205.786 Y141.216 E1.48143
G1 X205.786 Y141.853 E.03266
G1 X226.214 Y121.434 E1.48143
G1 X226.214 Y122.07 E.03266
G1 X205.786 Y142.49 E1.48143
G1 X205.786 Y143.127 E.03266
G1 X226.214 Y122.707 E1.48143
G1 X226.214 Y123.344 E.03266
G1 X205.786 Y143.763 E1.48143
G1 X205.786 Y144.4 E.03266
G1 X226.214 Y123.981 E1.48143
G1 X226.214 Y124.617 E.03266
G1 X205.786 Y145.037 E1.48143
G1 X205.786 Y145.674 E.03266
G1 X226.214 Y125.254 E1.48143
G1 X226.214 Y125.891 E.03266
G1 X205.786 Y146.31 E1.48143
G1 X205.786 Y146.947 E.03266
G1 X226.214 Y126.528 E1.48143
G1 X226.214 Y127.164 E.03266
G1 X205.786 Y147.584 E1.48143
G1 X205.786 Y148.221 E.03266
G1 X226.214 Y127.801 E1.48143
G1 X226.214 Y128.438 E.03266
G1 X205.786 Y148.857 E1.48143
G1 X205.786 Y149.494 E.03266
G1 X226.214 Y129.075 E1.48143
G1 X226.214 Y129.711 E.03266
G1 X205.786 Y150.131 E1.48143
G1 X205.786 Y150.768 E.03266
G1 X226.214 Y130.348 E1.48143
G1 X226.214 Y130.985 E.03266
G1 X205.786 Y151.404 E1.48143
G1 X205.786 Y152.041 E.03266
G1 X226.214 Y131.622 E1.48143
G1 X226.214 Y132.258 E.03266
G1 X205.786 Y152.678 E1.48143
G1 X205.786 Y153.315 E.03266
G1 X226.214 Y132.895 E1.48143
G1 X226.214 Y133.532 E.03266
G1 X205.786 Y153.951 E1.48143
G1 X205.786 Y154.588 E.03266
G1 X226.214 Y134.169 E1.48143
G1 X226.214 Y134.806 E.03266
G1 X205.786 Y155.225 E1.48143
G1 X205.786 Y155.862 E.03266
G1 X226.214 Y135.442 E1.48143
G1 X226.214 Y136.079 E.03266
G1 X205.786 Y156.498 E1.48143
G1 X205.786 Y157.135 E.03266
G1 X226.214 Y136.716 E1.48143
G1 X226.214 Y137.353 E.03266
G1 X205.786 Y157.772 E1.48143
M73 P71 R19
G1 X205.786 Y158.409 E.03266
G1 X226.214 Y137.989 E1.48143
G1 X226.214 Y138.626 E.03266
G1 X205.786 Y159.046 E1.48143
G1 X205.786 Y159.682 E.03266
G1 X226.214 Y139.263 E1.48143
G1 X226.214 Y139.9 E.03266
G1 X205.786 Y160.319 E1.48143
G1 X205.786 Y160.956 E.03266
G1 X226.214 Y140.536 E1.48143
G1 X226.214 Y141.173 E.03266
G1 X205.786 Y161.593 E1.48143
G1 X205.786 Y162.229 E.03266
G1 X226.214 Y141.81 E1.48143
G1 X226.214 Y142.447 E.03266
G1 X205.786 Y162.866 E1.48143
G1 X205.786 Y163.503 E.03266
G1 X226.214 Y143.083 E1.48143
G1 X226.214 Y143.72 E.03266
G1 X205.786 Y164.14 E1.48143
G1 X205.786 Y164.776 E.03266
G1 X226.214 Y144.357 E1.48143
G1 X226.214 Y144.994 E.03266
G1 X205.786 Y165.413 E1.48143
G1 X205.786 Y166.05 E.03266
G1 X226.214 Y145.63 E1.48143
M73 P71 R18
G1 X226.214 Y146.267 E.03266
G1 X205.786 Y166.687 E1.48143
G1 X205.786 Y167.323 E.03266
G1 X226.214 Y146.904 E1.48143
G1 X226.214 Y147.541 E.03266
G1 X205.786 Y167.96 E1.48143
G1 X205.786 Y168.597 E.03266
G1 X226.214 Y148.177 E1.48143
G1 X226.214 Y148.814 E.03266
G1 X205.786 Y169.234 E1.48143
G1 X205.786 Y169.87 E.03266
G1 X226.214 Y149.451 E1.48143
G1 X226.214 Y150.088 E.03266
G1 X205.786 Y170.507 E1.48143
G1 X205.786 Y171.144 E.03266
G1 X226.214 Y150.724 E1.48143
G1 X226.214 Y151.361 E.03266
G1 X205.786 Y171.781 E1.48143
G1 X205.786 Y172.417 E.03266
G1 X226.214 Y151.998 E1.48143
G1 X226.214 Y152.635 E.03266
G1 X205.786 Y173.054 E1.48143
G1 X205.786 Y173.691 E.03266
G1 X226.214 Y153.271 E1.48143
G1 X226.214 Y153.908 E.03266
G1 X205.786 Y174.328 E1.48143
G1 X205.786 Y174.964 E.03266
G1 X226.214 Y154.545 E1.48143
G1 X226.214 Y155.182 E.03266
G1 X205.786 Y175.601 E1.48143
G1 X205.786 Y176.238 E.03266
G1 X226.214 Y155.818 E1.48143
G1 X226.214 Y156.455 E.03266
G1 X205.786 Y176.875 E1.48143
G1 X205.786 Y177.511 E.03266
G1 X226.214 Y157.092 E1.48143
G1 X226.214 Y157.729 E.03266
G1 X205.786 Y178.148 E1.48143
G1 X205.786 Y178.785 E.03266
G1 X226.214 Y158.365 E1.48143
G1 X226.214 Y159.002 E.03266
G1 X205.786 Y179.422 E1.48143
G1 X205.786 Y180.058 E.03266
G1 X226.214 Y159.639 E1.48143
G1 X226.214 Y160.276 E.03266
G1 X205.786 Y180.695 E1.48143
G1 X205.786 Y181.332 E.03266
G1 X226.214 Y160.913 E1.48143
G1 X226.214 Y161.549 E.03266
G1 X205.786 Y181.969 E1.48143
G1 X205.786 Y182.605 E.03266
G1 X226.214 Y162.186 E1.48143
G1 X226.214 Y162.823 E.03266
G1 X205.786 Y183.242 E1.48143
G1 X205.786 Y183.879 E.03266
G1 X226.214 Y163.46 E1.48143
G1 X226.214 Y164.096 E.03266
G1 X205.786 Y184.516 E1.48143
G1 X205.786 Y185.152 E.03266
G1 X226.214 Y164.733 E1.48143
G1 X226.214 Y165.37 E.03266
G1 X205.786 Y185.789 E1.48143
G1 X205.786 Y186.426 E.03266
G1 X226.214 Y166.007 E1.48143
G1 X226.214 Y166.643 E.03266
G1 X205.786 Y187.063 E1.48143
G1 X205.786 Y187.7 E.03266
G1 X226.214 Y167.28 E1.48143
G1 X226.214 Y167.917 E.03266
G1 X205.786 Y188.336 E1.48143
G1 X205.786 Y188.973 E.03266
G1 X226.214 Y168.554 E1.48143
G1 X226.214 Y169.19 E.03266
G1 X205.786 Y189.61 E1.48143
G1 X205.786 Y190.247 E.03266
G1 X226.214 Y169.827 E1.48143
G1 X226.214 Y170.464 E.03266
G1 X205.786 Y190.883 E1.48143
G1 X205.786 Y191.52 E.03266
G1 X226.214 Y171.101 E1.48143
G1 X226.214 Y171.737 E.03266
G1 X205.786 Y192.157 E1.48143
G1 X205.786 Y192.794 E.03266
G1 X226.214 Y172.374 E1.48143
G1 X226.214 Y173.011 E.03266
G1 X205.786 Y193.43 E1.48143
G1 X205.786 Y194.067 E.03266
G1 X226.214 Y173.648 E1.48143
G1 X226.214 Y174.284 E.03266
G1 X205.786 Y194.704 E1.48143
G1 X205.786 Y195.341 E.03266
G1 X226.214 Y174.921 E1.48143
G1 X226.214 Y175.558 E.03266
G1 X205.786 Y195.977 E1.48143
G1 X205.786 Y196.614 E.03266
G1 X226.214 Y176.195 E1.48143
G1 X226.214 Y176.831 E.03266
G1 X205.583 Y197.453 E1.49611
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X206.998 Y196.039 E-.76
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
G1 X127.895 Y204.666
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X128.24 Y204.67 E.01144
G3 X129.176 Y204.879 I-.245 J3.289 E.03191
M73 P72 R18
G3 X127.807 Y204.666 I-1.167 J2.996 E.62381
G1 X127.835 Y204.666 E.00094
G1 X127.714 Y205.089 F30000
G1 F16213.044
G1 X127.838 Y205.072 E.00412
G3 X128.761 Y205.17 I.18 J2.724 E.03096
G3 X127.376 Y205.14 I-.752 J2.706 E.53896
G1 X127.655 Y205.098 E.00937
G1 X127.808 Y205.486 F30000
G1 F16213.044
G1 X127.868 Y205.478 E.00201
G3 X128.651 Y205.562 I.011 J3.598 E.02616
G3 X127.466 Y205.536 I-.643 J2.314 E.46081
G1 X127.749 Y205.495 E.00947
G1 X127.897 Y205.869 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X127.898 Y205.869 E.00004
G3 X128.349 Y205.895 I.097 J2.245 E.01392
G3 X127.553 Y205.918 I-.34 J1.98 E.36317
G1 X127.837 Y205.878 E.00881
; WIPE_START
M204 S10000
G1 X127.898 Y205.869 E-.02325
G1 X127.898 Y205.869 E0
G1 X128.15 Y205.87 E-.09595
G1 X128.349 Y205.895 E-.07617
G1 X128.734 Y206.004 E-.15214
G1 X128.917 Y206.086 E-.07614
G1 X129.253 Y206.303 E-.1521
G1 X129.54 Y206.583 E-.15214
G1 X129.588 Y206.653 E-.03211
; WIPE_END
G1 E-.04 F1800
G1 X137.218 Y206.478 Z2.8 F30000
G1 X216.156 Y204.666 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X216.24 Y204.67 E.00281
G3 X217.176 Y204.88 I-.245 J3.289 E.03192
G3 X215.807 Y204.666 I-1.167 J2.996 E.6238
G1 X216.096 Y204.666 E.00957
G1 X216.155 Y205.072 F30000
G1 F16213.044
G1 X216.21 Y205.073 E.00183
G3 X216.761 Y205.17 I-.192 J2.726 E.01859
G3 X215.838 Y205.072 I-.752 J2.706 E.55448
G1 X216.095 Y205.072 E.00853
G1 X216.214 Y205.485 F30000
G1 F16213.044
G1 X216.651 Y205.562 E.0147
G3 X215.868 Y205.478 I-.643 J2.314 E.47431
G3 X216.155 Y205.489 I.011 J3.601 E.00952
G1 X216.13 Y205.87 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X216.15 Y205.873 E.00063
G3 X216.349 Y205.895 I-.155 J2.24 E.00616
G3 X215.898 Y205.869 I-.341 J1.98 E.37387
G1 X216.07 Y205.87 E.00528
; WIPE_START
M204 S10000
G1 X216.15 Y205.873 E-.0306
G1 X216.349 Y205.895 E-.07613
G1 X216.544 Y205.94 E-.07613
G1 X216.917 Y206.086 E-.15213
G1 X217.253 Y206.303 E-.15213
G1 X217.54 Y206.583 E-.15211
G1 X217.719 Y206.845 E-.12076
; WIPE_END
G1 E-.04 F1800
G1 X217.553 Y199.215 Z2.8 F30000
G1 X215.896 Y122.791 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X216.24 Y122.795 E.01143
G3 X217.176 Y123.004 I-.245 J3.29 E.03191
G3 X215.807 Y122.791 I-1.167 J2.996 E.62382
G1 X215.836 Y122.791 E.00094
G1 X215.715 Y123.214 F30000
G1 F16213.044
G1 X215.838 Y123.197 E.00413
G3 X216.761 Y123.295 I.18 J2.727 E.03094
G3 X215.376 Y123.265 I-.752 J2.706 E.53898
G1 X215.655 Y123.223 E.00937
G1 X215.808 Y123.611 F30000
G1 F16213.044
G1 X215.868 Y123.603 E.00202
G3 X216.651 Y123.687 I.01 J3.606 E.02615
G3 X215.466 Y123.661 I-.643 J2.314 E.46082
G1 X215.749 Y123.62 E.00947
G1 X215.904 Y123.994 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X216.15 Y123.998 E.00756
G3 X216.349 Y124.02 I-.155 J2.24 E.00616
G3 X215.844 Y123.998 I-.341 J1.98 E.37222
; WIPE_START
M204 S10000
G1 X216.15 Y123.998 E-.11619
G1 X216.349 Y124.02 E-.07613
G1 X216.734 Y124.129 E-.15213
G1 X217.091 Y124.311 E-.15211
G1 X217.404 Y124.561 E-.1521
G1 X217.592 Y124.785 E-.11134
; WIPE_END
G1 E-.04 F1800
G1 X217.438 Y117.154 Z2.8 F30000
G1 X215.896 Y40.916 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X216.24 Y40.92 E.01143
G3 X217.176 Y41.13 I-.245 J3.289 E.03191
G3 X215.807 Y40.916 I-1.167 J2.996 E.62381
G1 X215.836 Y40.916 E.00094
G1 X215.714 Y41.339 F30000
G1 F16213.044
G1 X215.838 Y41.322 E.00413
G3 X216.761 Y41.42 I.18 J2.727 E.03094
G3 X215.376 Y41.39 I-.752 J2.706 E.53897
G1 X215.655 Y41.348 E.00937
G1 X215.808 Y41.736 F30000
G1 F16213.044
G1 X215.868 Y41.728 E.00202
G3 X216.651 Y41.812 I.01 J3.605 E.02615
G3 X215.466 Y41.786 I-.643 J2.314 E.46082
G1 X215.749 Y41.745 E.00947
G1 X215.904 Y42.119 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X216.15 Y42.123 E.00756
G3 X216.349 Y42.145 I-.155 J2.24 E.00616
G3 X215.844 Y42.123 I-.341 J1.98 E.37222
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
G1 X209.961 Y42.74 Z2.8 F30000
G1 X127.896 Y40.916 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X128.24 Y40.92 E.01143
G3 X129.176 Y41.129 I-.245 J3.29 E.03191
G3 X127.807 Y40.916 I-1.167 J2.996 E.62382
G1 X127.836 Y40.916 E.00094
G1 X127.715 Y41.339 F30000
G1 F16213.044
G1 X127.838 Y41.322 E.00413
G3 X128.761 Y41.42 I.18 J2.726 E.03095
G3 X127.376 Y41.39 I-.752 J2.706 E.53897
G1 X127.655 Y41.348 E.00937
G1 X127.808 Y41.736 F30000
G1 F16213.044
G1 X127.868 Y41.728 E.00201
G3 X128.651 Y41.812 I.01 J3.604 E.02615
G3 X127.466 Y41.786 I-.643 J2.314 E.46082
G1 X127.749 Y41.745 E.00948
G1 X127.904 Y42.119 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X128.15 Y42.123 E.00756
G3 X128.349 Y42.145 I-.155 J2.24 E.00616
G3 X127.844 Y42.123 I-.341 J1.98 E.37222
; WIPE_START
M204 S10000
G1 X128.15 Y42.123 E-.11619
G1 X128.349 Y42.145 E-.07614
G1 X128.544 Y42.19 E-.07613
G1 X128.917 Y42.336 E-.15213
G1 X129.253 Y42.553 E-.15209
G1 X129.54 Y42.833 E-.15214
G1 X129.592 Y42.909 E-.03518
; WIPE_END
G1 E-.04 F1800
G1 X121.961 Y42.769 Z2.8 F30000
G1 X38.589 Y41.237 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X38.679 Y41.198 E.00327
G3 X39.807 Y40.916 I1.329 J2.927 E.03878
G3 X41.176 Y41.129 I.188 J3.294 E.04628
G3 X38.395 Y41.345 I-1.167 J2.996 E.57441
G1 X38.536 Y41.266 E.00537
G1 X39.14 Y41.451 F30000
G1 F16213.044
G1 X39.376 Y41.39 E.00807
G3 X39.838 Y41.322 I.634 J2.736 E.01551
G3 X40.761 Y41.42 I.18 J2.726 E.03095
G3 X39.085 Y41.474 I-.752 J2.706 E.52892
G1 X39.569 Y41.769 F30000
G1 F16213.044
G1 X39.868 Y41.728 E.01002
G3 X40.651 Y41.812 I.01 J3.604 E.02615
G3 X39.466 Y41.786 I-.643 J2.314 E.46082
G1 X39.51 Y41.779 E.00147
G1 X39.904 Y42.119 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X40.15 Y42.123 E.00755
G3 X40.349 Y42.145 I-.155 J2.24 E.00616
G3 X39.844 Y42.123 I-.341 J1.98 E.37223
; WIPE_START
M204 S10000
G1 X40.15 Y42.123 E-.11614
G1 X40.349 Y42.145 E-.07614
G1 X40.544 Y42.19 E-.07613
G1 X40.917 Y42.336 E-.1521
G1 X41.253 Y42.553 E-.15212
G1 X41.54 Y42.833 E-.15214
G1 X41.592 Y42.909 E-.03523
; WIPE_END
G1 E-.04 F1800
G1 X47.147 Y48.144 Z2.8 F30000
G1 X205.416 Y197.291 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X50.584 Y197.291 E5.13608
G1 X50.584 Y54.709 E4.72972
G1 X205.416 Y54.709 E5.13608
G1 X205.416 Y197.231 E4.72773
G1 X205.009 Y196.884 F30000
G1 F16213.044
G1 X50.991 Y196.884 E5.10907
G1 X50.991 Y55.116 E4.70271
G1 X205.009 Y55.116 E5.10907
G1 X205.009 Y196.824 E4.70072
G1 X204.602 Y196.477 F30000
G1 F16213.044
G1 X51.398 Y196.477 E5.08206
G1 X51.398 Y55.523 E4.67571
G1 X204.602 Y55.523 E5.08206
G1 X204.602 Y196.417 E4.67372
G1 X204.21 Y196.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X51.79 Y196.085 E4.68344
G1 X51.79 Y55.915 E4.30703
G1 X204.21 Y55.915 E4.68344
G1 X204.21 Y196.025 E4.30519
; WIPE_START
M204 S10000
G1 X202.21 Y196.026 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X195.253 Y192.887 Z2.8 F30000
G1 X39.896 Y122.791 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X40.24 Y122.795 E.01143
G3 X41.176 Y123.004 I-.245 J3.29 E.03191
G3 X39.807 Y122.791 I-1.167 J2.996 E.62382
G1 X39.836 Y122.791 E.00094
G1 X39.715 Y123.214 F30000
G1 F16213.044
G1 X39.838 Y123.197 E.00413
G3 X40.761 Y123.295 I.18 J2.726 E.03095
G3 X39.376 Y123.265 I-.752 J2.706 E.53897
G1 X39.655 Y123.223 E.00937
G1 X39.808 Y123.611 F30000
G1 F16213.044
G1 X39.868 Y123.603 E.00202
G3 X40.651 Y123.687 I.01 J3.604 E.02615
G3 X39.466 Y123.661 I-.643 J2.314 E.46082
G1 X39.749 Y123.62 E.00947
G1 X39.904 Y123.994 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X40.15 Y123.998 E.00756
G3 X40.349 Y124.02 I-.155 J2.24 E.00616
G3 X39.844 Y123.998 I-.341 J1.98 E.37222
; WIPE_START
M204 S10000
G1 X40.15 Y123.998 E-.11624
G1 X40.349 Y124.02 E-.07614
G1 X40.734 Y124.129 E-.15213
G1 X41.091 Y124.311 E-.15214
G1 X41.404 Y124.561 E-.15207
G1 X41.592 Y124.785 E-.11128
; WIPE_END
G1 E-.04 F1800
G1 X41.455 Y132.416 Z2.8 F30000
G1 X40.156 Y204.666 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X40.24 Y204.67 E.0028
G3 X41.176 Y204.879 I-.245 J3.289 E.03191
G3 X39.807 Y204.666 I-1.167 J2.996 E.62381
G1 X40.096 Y204.666 E.00958
G1 X40.155 Y205.072 F30000
G1 F16213.044
G1 X40.21 Y205.073 E.00183
G3 X40.761 Y205.17 I-.192 J2.723 E.0186
G3 X39.838 Y205.072 I-.752 J2.706 E.55447
G1 X40.095 Y205.072 E.00853
G1 X40.214 Y205.485 F30000
M73 P72 R17
G1 F16213.044
G1 X40.651 Y205.562 E.0147
G3 X39.868 Y205.478 I-.643 J2.314 E.4743
G3 X40.155 Y205.489 I.011 J3.598 E.00952
G1 X40.13 Y205.87 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X40.15 Y205.873 E.00062
G3 X40.349 Y205.895 I-.155 J2.242 E.00616
G3 X39.898 Y205.869 I-.34 J1.98 E.37387
G1 X40.07 Y205.87 E.00529
; WIPE_START
M204 S10000
G1 X40.15 Y205.873 E-.03048
G1 X40.349 Y205.895 E-.07613
G1 X40.734 Y206.004 E-.15214
G1 X40.917 Y206.086 E-.07611
G1 X41.253 Y206.303 E-.15213
G1 X41.54 Y206.583 E-.15214
G1 X41.719 Y206.846 E-.12087
; WIPE_END
G1 E-.04 F1800
G1 X49.337 Y207.324 Z2.8 F30000
G1 X226.584 Y218.459 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X29.416 Y218.459 E6.54041
G1 X29.416 Y33.541 E6.13406
G1 X226.584 Y33.541 E6.54041
G1 X226.584 Y218.399 E6.13207
G1 X226.991 Y218.866 F30000
G1 F16213.044
G1 X29.009 Y218.866 E6.56742
G1 X29.009 Y33.134 E6.16106
G1 X226.991 Y33.134 E6.56742
G1 X226.991 Y218.806 E6.15907
G1 X227.398 Y219.273 F30000
G1 F16213.044
G1 X28.602 Y219.273 E6.59442
G1 X28.602 Y32.727 E6.18807
G1 X227.398 Y32.727 E6.59442
G1 X227.398 Y219.213 E6.18608
G1 X227.79 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X28.21 Y219.665 E6.13254
G1 X28.21 Y32.335 E5.75613
G1 X227.79 Y32.335 E6.13254
G1 X227.79 Y219.605 E5.75429
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
G1 F15000
G1 X226.251 Y217.702 E.02578
G1 X226.251 Y217.169 E.0164
G1 X225.294 Y218.126 E.04161
G1 X224.76 Y218.126 E.0164
G1 X226.251 Y216.635 E.06481
G1 X226.251 Y216.101 E.0164
G1 X224.226 Y218.126 E.088
G1 X223.693 Y218.126 E.0164
G1 X226.251 Y215.568 E.1112
G1 X226.251 Y215.034 E.0164
G1 X223.159 Y218.126 E.1344
G1 X222.626 Y218.126 E.0164
G1 X226.251 Y214.501 E.1576
G1 X226.251 Y213.967 E.0164
G1 X222.092 Y218.126 E.1808
G1 X221.559 Y218.126 E.0164
G1 X226.251 Y213.434 E.204
G1 X226.251 Y212.9 E.0164
G1 X221.025 Y218.126 E.2272
G1 X220.492 Y218.126 E.0164
G1 X226.251 Y212.366 E.2504
G1 X226.251 Y211.833 E.0164
G1 X219.958 Y218.126 E.2736
G1 X219.424 Y218.126 E.0164
G1 X226.251 Y211.299 E.2968
G1 X226.251 Y210.766 E.0164
G1 X218.891 Y218.126 E.32
G1 X218.357 Y218.126 E.0164
G1 X226.251 Y210.232 E.34319
G1 X226.251 Y209.699 E.0164
G1 X217.824 Y218.126 E.36639
G1 X217.29 Y218.126 E.0164
G1 X226.251 Y209.165 E.38959
G1 X226.251 Y208.632 E.0164
G1 X216.757 Y218.126 E.41279
G1 X216.223 Y218.126 E.0164
G1 X226.251 Y208.098 E.43599
G1 X226.251 Y207.564 E.0164
G1 X215.689 Y218.126 E.45919
G1 X215.156 Y218.126 E.0164
G1 X226.251 Y207.031 E.48239
M73 P73 R17
G1 X226.251 Y206.497 E.0164
G1 X214.622 Y218.126 E.50559
G1 X214.089 Y218.126 E.0164
G1 X226.251 Y205.964 E.52879
G1 X226.251 Y205.43 E.0164
G1 X213.555 Y218.126 E.55199
G1 X213.022 Y218.126 E.0164
G1 X226.251 Y204.897 E.57518
G1 X226.251 Y204.363 E.0164
G1 X212.488 Y218.126 E.59838
G1 X211.954 Y218.126 E.0164
G1 X226.251 Y203.829 E.62158
G1 X226.251 Y203.296 E.0164
G1 X211.421 Y218.126 E.64478
G1 X210.887 Y218.126 E.0164
G1 X226.251 Y202.762 E.66798
G1 X226.251 Y202.229 E.0164
G1 X219.3 Y209.179 E.30219
G2 X219.502 Y208.444 I-3.418 J-1.331 E.02346
G1 X226.251 Y201.695 E.29344
G1 X226.251 Y201.162 E.0164
G1 X219.551 Y207.861 E.29129
G2 X219.511 Y207.368 I-2.489 J-.046 E.01525
G1 X226.251 Y200.628 E.29304
G1 X226.251 Y200.094 E.0164
G1 X219.419 Y206.926 E.29704
G2 X219.284 Y206.527 I-2.063 J.473 E.01297
G1 X226.251 Y199.561 E.30289
G1 X226.251 Y199.027 E.0164
G1 X219.112 Y206.165 E.31036
G2 X218.907 Y205.838 I-1.744 J.866 E.01192
G1 X226.251 Y198.494 E.3193
G1 X226.251 Y197.96 E.0164
G1 X218.672 Y205.539 E.32953
G2 X218.408 Y205.269 I-1.482 J1.183 E.01162
G1 X226.251 Y197.427 E.34098
G1 X226.251 Y196.893 E.0164
G1 X218.116 Y205.028 E.35368
G2 X217.795 Y204.815 I-1.221 J1.499 E.01186
G1 X226.251 Y196.359 E.36765
G1 X226.251 Y195.826 E.0164
G1 X217.442 Y204.634 E.38298
G2 X217.055 Y204.487 I-.929 J1.866 E.01274
G1 X226.251 Y195.292 E.3998
G1 X226.251 Y194.759 E.0164
G1 X216.629 Y204.38 E.41833
G2 X216.143 Y204.333 I-.66 J4.266 E.01503
G1 X226.251 Y194.225 E.43947
G1 X226.251 Y193.692 E.0164
G1 X215.594 Y204.348 E.46334
G2 X214.913 Y204.496 I.58 J4.318 E.02146
G1 X226.251 Y193.158 E.49297
G1 X226.251 Y192.624 E.0164
G1 X200.749 Y218.126 E1.10876
G1 X201.283 Y218.126 E.0164
G1 X212.624 Y206.784 E.49311
G2 X212.476 Y207.466 I3.458 J1.109 E.02149
G1 X201.817 Y218.126 E.46346
G1 X202.35 Y218.126 E.0164
G1 X212.453 Y208.023 E.43925
G2 X212.508 Y208.502 I4.814 J-.31 E.01482
G1 X202.884 Y218.126 E.41844
G1 X203.417 Y218.126 E.0164
G1 X212.613 Y208.93 E.39983
G2 X212.759 Y209.318 I2.016 J-.534 E.01276
G1 X203.951 Y218.126 E.38295
G1 X204.484 Y218.126 E.0164
G1 X212.939 Y209.671 E.36759
G2 X213.151 Y209.993 I1.712 J-.896 E.01186
G1 X205.018 Y218.126 E.3536
G1 X205.552 Y218.126 E.0164
G1 X213.392 Y210.285 E.34089
G2 X213.663 Y210.548 I10.787 J-10.84 E.0116
G1 X206.085 Y218.126 E.32946
G1 X206.619 Y218.126 E.0164
G1 X213.962 Y210.782 E.3193
G2 X214.292 Y210.986 I1.183 J-1.543 E.01194
G1 X207.152 Y218.126 E.31043
G1 X207.686 Y218.126 E.0164
G1 X214.654 Y211.157 E.30297
G2 X215.052 Y211.293 I.878 J-1.921 E.01294
G1 X208.219 Y218.126 E.29707
G1 X208.753 Y218.126 E.0164
G1 X215.491 Y211.387 E.29298
G2 X215.988 Y211.424 I.562 J-4.265 E.01533
G1 X209.287 Y218.126 E.29139
G1 X209.82 Y218.126 E.0164
G1 X216.567 Y211.379 E.29334
G2 X217.299 Y211.181 I-.291 J-2.525 E.0234
G1 X210.184 Y218.295 E.30933
G1 X200.046 Y218.295 F30000
G1 F15000
G1 X226.251 Y192.091 E1.13934
G1 X226.251 Y191.557 E.0164
G1 X199.682 Y218.126 E1.15516
G1 X199.149 Y218.126 E.0164
G1 X226.251 Y191.024 E1.17836
G1 X226.251 Y190.49 E.0164
G1 X198.615 Y218.126 E1.20156
G1 X198.082 Y218.126 E.0164
G1 X226.251 Y189.957 E1.22476
G1 X226.251 Y189.423 E.0164
G1 X197.548 Y218.126 E1.24796
G1 X197.014 Y218.126 E.0164
G1 X226.251 Y188.889 E1.27116
G1 X226.251 Y188.356 E.0164
G1 X196.481 Y218.126 E1.29436
G1 X195.947 Y218.126 E.0164
G1 X226.251 Y187.822 E1.31756
G1 X226.251 Y187.289 E.0164
G1 X195.414 Y218.126 E1.34075
G1 X194.88 Y218.126 E.0164
G1 X226.251 Y186.755 E1.36395
G1 X226.251 Y186.222 E.0164
G1 X194.347 Y218.126 E1.38715
G1 X193.813 Y218.126 E.0164
G1 X226.251 Y185.688 E1.41035
G1 X226.251 Y185.155 E.0164
G1 X193.279 Y218.126 E1.43355
G1 X192.746 Y218.126 E.0164
G1 X226.251 Y184.621 E1.45675
G1 X226.251 Y184.087 E.0164
G1 X192.212 Y218.126 E1.47995
G1 X191.679 Y218.126 E.0164
G1 X226.251 Y183.554 E1.50315
G1 X226.251 Y183.02 E.0164
G1 X191.145 Y218.126 E1.52635
G1 X190.612 Y218.126 E.0164
G1 X226.251 Y182.487 E1.54955
G1 X226.251 Y181.953 E.0164
G1 X190.078 Y218.126 E1.57275
G1 X189.545 Y218.126 E.0164
G1 X226.251 Y181.42 E1.59594
G1 X226.251 Y180.886 E.0164
G1 X189.011 Y218.126 E1.61914
G1 X188.477 Y218.126 E.0164
G1 X226.251 Y180.352 E1.64234
G1 X226.251 Y179.819 E.0164
G1 X187.944 Y218.126 E1.66554
G1 X187.41 Y218.126 E.0164
G1 X226.251 Y179.285 E1.68874
G1 X226.251 Y178.752 E.0164
G1 X186.877 Y218.126 E1.71194
G1 X186.343 Y218.126 E.0164
G1 X226.251 Y178.218 E1.73514
G1 X226.251 Y177.685 E.0164
G1 X185.81 Y218.126 E1.75834
G1 X185.276 Y218.126 E.0164
G1 X226.251 Y177.151 E1.78154
G1 X226.251 Y176.617 E.0164
G1 X205.749 Y197.118 E.89137
G1 X205.749 Y196.585 E.0164
G1 X226.251 Y176.084 E.89137
G1 X226.251 Y175.55 E.0164
G1 X205.749 Y196.051 E.89137
G1 X205.749 Y195.518 E.0164
G1 X226.251 Y175.017 E.89137
G1 X226.251 Y174.483 E.0164
G1 X205.749 Y194.984 E.89137
G1 X205.749 Y194.451 E.0164
G1 X226.251 Y173.95 E.89137
G1 X226.251 Y173.416 E.0164
G1 X205.749 Y193.917 E.89137
G1 X205.749 Y193.383 E.0164
G1 X226.251 Y172.882 E.89137
G1 X226.251 Y172.349 E.0164
G1 X205.749 Y192.85 E.89137
G1 X205.749 Y192.316 E.0164
G1 X226.251 Y171.815 E.89137
G1 X226.251 Y171.282 E.0164
G1 X205.749 Y191.783 E.89137
G1 X205.749 Y191.249 E.0164
G1 X226.251 Y170.748 E.89137
G1 X226.251 Y170.215 E.0164
G1 X205.749 Y190.716 E.89137
G1 X205.749 Y190.182 E.0164
G1 X226.251 Y169.681 E.89137
G1 X226.251 Y169.147 E.0164
G1 X205.749 Y189.649 E.89137
G1 X205.749 Y189.115 E.0164
G1 X226.251 Y168.614 E.89137
G1 X226.251 Y168.08 E.0164
G1 X205.749 Y188.581 E.89137
G1 X205.749 Y188.048 E.0164
G1 X226.251 Y167.547 E.89137
G1 X226.251 Y167.013 E.0164
G1 X205.749 Y187.514 E.89137
G1 X205.749 Y186.981 E.0164
G1 X226.251 Y166.48 E.89137
G1 X226.251 Y165.946 E.0164
G1 X205.749 Y186.447 E.89137
G1 X205.749 Y185.914 E.0164
G1 X226.251 Y165.412 E.89137
G1 X226.251 Y164.879 E.0164
G1 X205.749 Y185.38 E.89137
G1 X205.749 Y184.846 E.0164
G1 X226.251 Y164.345 E.89137
G1 X226.251 Y163.812 E.0164
G1 X205.749 Y184.313 E.89137
G1 X205.749 Y183.779 E.0164
G1 X226.251 Y163.278 E.89137
G1 X226.251 Y162.745 E.0164
G1 X205.749 Y183.246 E.89137
G1 X205.749 Y182.712 E.0164
G1 X226.251 Y162.211 E.89137
G1 X226.251 Y161.677 E.0164
G1 X205.749 Y182.179 E.89137
G1 X205.749 Y181.645 E.0164
G1 X226.251 Y161.144 E.89137
G1 X226.251 Y160.61 E.0164
G1 X205.749 Y181.111 E.89137
G1 X205.749 Y180.578 E.0164
G1 X226.251 Y160.077 E.89137
G1 X226.251 Y159.543 E.0164
G1 X205.749 Y180.044 E.89137
G1 X205.749 Y179.511 E.0164
G1 X226.251 Y159.01 E.89137
G1 X226.251 Y158.476 E.0164
G1 X205.749 Y178.977 E.89137
G1 X205.749 Y178.444 E.0164
G1 X226.251 Y157.942 E.89137
G1 X226.251 Y157.409 E.0164
G1 X205.749 Y177.91 E.89137
G1 X205.749 Y177.376 E.0164
G1 X226.251 Y156.875 E.89137
G1 X226.251 Y156.342 E.0164
G1 X205.749 Y176.843 E.89137
G1 X205.749 Y176.309 E.0164
G1 X226.251 Y155.808 E.89137
G1 X226.251 Y155.275 E.0164
G1 X205.749 Y175.776 E.89137
G1 X205.749 Y175.242 E.0164
G1 X226.251 Y154.741 E.89137
G1 X226.251 Y154.208 E.0164
G1 X205.749 Y174.709 E.89137
G1 X205.749 Y174.175 E.0164
G1 X226.251 Y153.674 E.89137
G1 X226.251 Y153.14 E.0164
G1 X205.749 Y173.641 E.89137
G1 X205.749 Y173.108 E.0164
G1 X226.251 Y152.607 E.89137
G1 X226.251 Y152.073 E.0164
G1 X205.749 Y172.574 E.89137
G1 X205.749 Y172.041 E.0164
G1 X226.251 Y151.54 E.89137
G1 X226.251 Y151.006 E.0164
G1 X205.749 Y171.507 E.89137
G1 X205.749 Y170.974 E.0164
G1 X226.251 Y150.473 E.89137
G1 X226.251 Y149.939 E.0164
G1 X205.749 Y170.44 E.89137
G1 X205.749 Y169.906 E.0164
G1 X226.251 Y149.405 E.89137
G1 X226.251 Y148.872 E.0164
G1 X205.749 Y169.373 E.89137
G1 X205.749 Y168.839 E.0164
G1 X226.251 Y148.338 E.89137
G1 X226.251 Y147.805 E.0164
G1 X205.749 Y168.306 E.89137
G1 X205.749 Y167.772 E.0164
G1 X226.251 Y147.271 E.89137
G1 X226.251 Y146.738 E.0164
G1 X205.749 Y167.239 E.89137
G1 X205.749 Y166.705 E.0164
G1 X226.251 Y146.204 E.89137
G1 X226.251 Y145.67 E.0164
G1 X205.749 Y166.171 E.89137
G1 X205.749 Y165.638 E.0164
G1 X226.251 Y145.137 E.89137
G1 X226.251 Y144.603 E.0164
G1 X205.749 Y165.104 E.89137
G1 X205.749 Y164.571 E.0164
G1 X226.251 Y144.07 E.89137
G1 X226.251 Y143.536 E.0164
G1 X205.749 Y164.037 E.89137
G1 X205.749 Y163.504 E.0164
G1 X226.251 Y143.003 E.89137
G1 X226.251 Y142.469 E.0164
G1 X205.749 Y162.97 E.89137
G1 X205.749 Y162.437 E.0164
G1 X226.251 Y141.935 E.89137
G1 X226.251 Y141.402 E.0164
G1 X205.749 Y161.903 E.89137
G1 X205.749 Y161.369 E.0164
G1 X226.251 Y140.868 E.89137
G1 X226.251 Y140.335 E.0164
G1 X205.749 Y160.836 E.89137
G1 X205.749 Y160.302 E.0164
G1 X226.251 Y139.801 E.89137
G1 X226.251 Y139.268 E.0164
G1 X205.749 Y159.769 E.89137
G1 X205.749 Y159.235 E.0164
G1 X226.251 Y138.734 E.89137
G1 X226.251 Y138.2 E.0164
G1 X205.749 Y158.702 E.89137
G1 X205.749 Y158.168 E.0164
G1 X226.251 Y137.667 E.89137
G1 X226.251 Y137.133 E.0164
G1 X205.749 Y157.634 E.89137
G1 X205.749 Y157.101 E.0164
G1 X226.251 Y136.6 E.89137
G1 X226.251 Y136.066 E.0164
G1 X205.749 Y156.567 E.89137
G1 X205.749 Y156.034 E.0164
G1 X226.251 Y135.533 E.89137
G1 X226.251 Y134.999 E.0164
G1 X205.749 Y155.5 E.89137
G1 X205.749 Y154.967 E.0164
G1 X226.251 Y134.465 E.89137
G1 X226.251 Y133.932 E.0164
G1 X205.749 Y154.433 E.89137
G1 X205.749 Y153.899 E.0164
G1 X226.251 Y133.398 E.89137
G1 X226.251 Y132.865 E.0164
G1 X205.749 Y153.366 E.89137
G1 X205.749 Y152.832 E.0164
G1 X226.251 Y132.331 E.89137
G1 X226.251 Y131.798 E.0164
G1 X205.749 Y152.299 E.89137
G1 X205.749 Y151.765 E.0164
G1 X226.251 Y131.264 E.89137
G1 X226.251 Y130.731 E.0164
G1 X205.749 Y151.232 E.89137
G1 X205.749 Y150.698 E.0164
G1 X226.251 Y130.197 E.89137
G1 X226.251 Y129.663 E.0164
G1 X205.749 Y150.164 E.89137
G1 X205.749 Y149.631 E.0164
G1 X226.251 Y129.13 E.89137
G1 X226.251 Y128.596 E.0164
G1 X205.749 Y149.097 E.89137
G1 X205.749 Y148.564 E.0164
G1 X226.251 Y128.063 E.89137
G1 X226.251 Y127.529 E.0164
G1 X205.749 Y148.03 E.89137
G1 X205.749 Y147.497 E.0164
G1 X226.251 Y126.996 E.89137
G1 X226.251 Y126.462 E.0164
G1 X205.749 Y146.963 E.89137
G1 X205.749 Y146.429 E.0164
G1 X226.251 Y125.928 E.89137
G1 X226.251 Y125.395 E.0164
G1 X205.749 Y145.896 E.89137
G1 X205.749 Y145.362 E.0164
G1 X226.251 Y124.861 E.89137
G1 X226.251 Y124.328 E.0164
G1 X205.749 Y144.829 E.89137
G1 X205.749 Y144.295 E.0164
G1 X226.251 Y123.794 E.89137
G1 X226.251 Y123.261 E.0164
G1 X205.749 Y143.762 E.89137
G1 X205.749 Y143.228 E.0164
G1 X226.251 Y122.727 E.89137
G1 X226.251 Y122.193 E.0164
G1 X205.749 Y142.694 E.89137
G1 X205.749 Y142.161 E.0164
G1 X226.251 Y121.66 E.89137
G1 X226.251 Y121.126 E.0164
G1 X205.749 Y141.627 E.89137
G1 X205.749 Y141.094 E.0164
G1 X226.251 Y120.593 E.89137
G1 X226.251 Y120.059 E.0164
G1 X219.439 Y126.871 E.29617
G2 X219.54 Y126.236 I-3.51 J-.885 E.01979
G1 X226.251 Y119.526 E.29177
G1 X226.251 Y118.992 E.0164
G1 X219.537 Y125.706 E.2919
G2 X219.467 Y125.242 I-4.781 J.48 E.01443
G1 X226.251 Y118.458 E.29493
G1 X226.251 Y117.925 E.0164
G1 X219.348 Y124.827 E.30011
G2 X219.191 Y124.451 I-1.957 J.595 E.01256
G1 X226.251 Y117.391 E.30694
G1 X226.251 Y116.858 E.0164
G1 X219.001 Y124.108 E.31522
G2 X218.78 Y123.795 I-1.673 J.948 E.01179
G1 X226.251 Y116.324 E.32482
G1 X226.251 Y115.791 E.0164
G1 X218.53 Y123.511 E.33569
G2 X218.252 Y123.256 I-1.414 J1.262 E.01163
G1 X226.251 Y115.257 E.34779
G1 X226.251 Y114.723 E.0164
G1 X217.945 Y123.029 E.36113
G2 X217.607 Y122.833 I-5.438 J8.991 E.012
G1 X226.251 Y114.19 E.37582
G1 X226.251 Y113.656 E.0164
G1 X217.234 Y122.673 E.39202
G2 X216.824 Y122.55 I-.819 J1.986 E.0132
G1 X226.251 Y113.123 E.40987
G1 X226.251 Y112.589 E.0164
G1 X216.369 Y122.471 E.42966
G2 X215.848 Y122.458 I-.312 J2.053 E.01605
G1 X226.251 Y112.056 E.45229
G1 X226.251 Y111.522 E.0164
G1 X215.241 Y122.532 E.4787
G2 X214.41 Y122.829 I.528 J2.788 E.02722
G1 X226.251 Y110.988 E.51481
G1 X226.251 Y110.455 E.0164
G1 X205.749 Y130.956 E.89137
G1 X205.749 Y131.49 E.0164
G1 X212.824 Y124.415 E.3076
G2 X212.535 Y125.237 I2.411 J1.309 E.02691
G1 X205.749 Y132.023 E.29504
G1 X205.749 Y132.557 E.0164
G1 X212.453 Y125.853 E.29145
G2 X212.472 Y126.368 I2.581 J.162 E.01585
G1 X205.749 Y133.09 E.29228
G1 X205.749 Y133.624 E.0164
G1 X212.548 Y126.825 E.29559
G2 X212.671 Y127.236 I6.118 J-1.618 E.01317
G1 X205.749 Y134.157 E.30096
G1 X205.749 Y134.691 E.0164
G1 X212.835 Y127.605 E.30808
G2 X213.031 Y127.943 I1.786 J-.813 E.01202
G1 X205.749 Y135.225 E.31661
G1 X205.749 Y135.758 E.0164
G1 X213.257 Y128.25 E.32644
G2 X213.512 Y128.529 I1.521 J-1.135 E.01163
G1 X205.749 Y136.292 E.33752
G1 X205.749 Y136.825 E.0164
G1 X213.796 Y128.779 E.34984
G2 X214.108 Y129.001 I1.263 J-1.45 E.01179
G1 X205.749 Y137.359 E.36341
G1 X205.749 Y137.892 E.0164
G1 X214.45 Y129.192 E.3783
G2 X214.826 Y129.35 I.977 J-1.797 E.01255
G1 X205.749 Y138.426 E.39463
G1 X205.749 Y138.96 E.0164
G1 X215.241 Y129.468 E.41268
G2 X215.707 Y129.535 I.569 J-2.301 E.01451
G1 X205.749 Y139.493 E.43296
G1 X205.749 Y140.027 E.0164
G1 X216.234 Y129.543 E.45584
G2 X216.87 Y129.44 I-.37 J-4.321 E.01983
G1 X205.58 Y140.73 E.49088
G1 X205.58 Y130.592 F30000
G1 F15000
G1 X226.251 Y109.921 E.89875
G1 X226.251 Y109.388 E.0164
G1 X205.749 Y129.889 E.89137
G1 X205.749 Y129.355 E.0164
G1 X226.251 Y108.854 E.89137
G1 X226.251 Y108.321 E.0164
G1 X205.749 Y128.822 E.89137
G1 X205.749 Y128.288 E.0164
G1 X226.251 Y107.787 E.89137
G1 X226.251 Y107.253 E.0164
G1 X205.749 Y127.755 E.89137
G1 X205.749 Y127.221 E.0164
G1 X226.251 Y106.72 E.89137
G1 X226.251 Y106.186 E.0164
G1 X205.749 Y126.687 E.89137
G1 X205.749 Y126.154 E.0164
G1 X226.251 Y105.653 E.89137
G1 X226.251 Y105.119 E.0164
G1 X205.749 Y125.62 E.89137
G1 X205.749 Y125.087 E.0164
G1 X226.251 Y104.586 E.89137
G1 X226.251 Y104.052 E.0164
G1 X205.749 Y124.553 E.89137
G1 X205.749 Y124.02 E.0164
G1 X226.251 Y103.519 E.89137
G1 X226.251 Y102.985 E.0164
G1 X205.749 Y123.486 E.89137
G1 X205.749 Y122.952 E.0164
G1 X226.251 Y102.451 E.89137
G1 X226.251 Y101.918 E.0164
G1 X205.749 Y122.419 E.89137
G1 X205.749 Y121.885 E.0164
G1 X226.251 Y101.384 E.89137
G1 X226.251 Y100.851 E.0164
G1 X205.749 Y121.352 E.89137
G1 X205.749 Y120.818 E.0164
G1 X226.251 Y100.317 E.89137
G1 X226.251 Y99.784 E.0164
G1 X205.749 Y120.285 E.89137
G1 X205.749 Y119.751 E.0164
G1 X226.251 Y99.25 E.89137
G1 X226.251 Y98.716 E.0164
G1 X205.749 Y119.217 E.89137
G1 X205.749 Y118.684 E.0164
G1 X226.251 Y98.183 E.89137
G1 X226.251 Y97.649 E.0164
G1 X205.749 Y118.15 E.89137
G1 X205.749 Y117.617 E.0164
G1 X226.251 Y97.116 E.89137
G1 X226.251 Y96.582 E.0164
G1 X205.749 Y117.083 E.89137
G1 X205.749 Y116.55 E.0164
G1 X226.251 Y96.049 E.89137
G1 X226.251 Y95.515 E.0164
G1 X205.749 Y116.016 E.89137
G1 X205.749 Y115.482 E.0164
G1 X226.251 Y94.981 E.89137
G1 X226.251 Y94.448 E.0164
G1 X205.749 Y114.949 E.89137
G1 X205.749 Y114.415 E.0164
G1 X226.251 Y93.914 E.89137
G1 X226.251 Y93.381 E.0164
G1 X205.749 Y113.882 E.89137
G1 X205.749 Y113.348 E.0164
G1 X226.251 Y92.847 E.89137
G1 X226.251 Y92.314 E.0164
G1 X205.749 Y112.815 E.89137
G1 X205.749 Y112.281 E.0164
G1 X226.251 Y91.78 E.89137
G1 X226.251 Y91.246 E.0164
G1 X205.749 Y111.748 E.89137
G1 X205.749 Y111.214 E.0164
G1 X226.251 Y90.713 E.89137
G1 X226.251 Y90.179 E.0164
G1 X205.749 Y110.68 E.89137
G1 X205.749 Y110.147 E.0164
G1 X226.251 Y89.646 E.89137
G1 X226.251 Y89.112 E.0164
G1 X205.749 Y109.613 E.89137
G1 X205.749 Y109.08 E.0164
G1 X226.251 Y88.579 E.89137
G1 X226.251 Y88.045 E.0164
G1 X205.749 Y108.546 E.89137
G1 X205.749 Y108.013 E.0164
G1 X226.251 Y87.511 E.89137
G1 X226.251 Y86.978 E.0164
G1 X205.749 Y107.479 E.89137
G1 X205.749 Y106.945 E.0164
G1 X226.251 Y86.444 E.89137
G1 X226.251 Y85.911 E.0164
G1 X205.749 Y106.412 E.89137
G1 X205.749 Y105.878 E.0164
G1 X226.251 Y85.377 E.89137
G1 X226.251 Y84.844 E.0164
G1 X205.749 Y105.345 E.89137
G1 X205.749 Y104.811 E.0164
G1 X226.251 Y84.31 E.89137
G1 X226.251 Y83.776 E.0164
G1 X205.749 Y104.278 E.89137
G1 X205.749 Y103.744 E.0164
G1 X226.251 Y83.243 E.89137
G1 X226.251 Y82.709 E.0164
G1 X205.749 Y103.21 E.89137
G1 X205.749 Y102.677 E.0164
G1 X226.251 Y82.176 E.89137
G1 X226.251 Y81.642 E.0164
G1 X205.749 Y102.143 E.89137
M73 P74 R17
G1 X205.749 Y101.61 E.0164
G1 X226.251 Y81.109 E.89137
G1 X226.251 Y80.575 E.0164
G1 X205.749 Y101.076 E.89137
G1 X205.749 Y100.543 E.0164
G1 X226.251 Y80.041 E.89137
G1 X226.251 Y79.508 E.0164
G1 X205.749 Y100.009 E.89137
G1 X205.749 Y99.475 E.0164
G1 X226.251 Y78.974 E.89137
G1 X226.251 Y78.441 E.0164
G1 X205.749 Y98.942 E.89137
G1 X205.749 Y98.408 E.0164
G1 X226.251 Y77.907 E.89137
G1 X226.251 Y77.374 E.0164
G1 X205.749 Y97.875 E.89137
G1 X205.749 Y97.341 E.0164
G1 X226.251 Y76.84 E.89137
G1 X226.251 Y76.307 E.0164
G1 X205.749 Y96.808 E.89137
G1 X205.749 Y96.274 E.0164
G1 X226.251 Y75.773 E.89137
G1 X226.251 Y75.239 E.0164
G1 X205.749 Y95.74 E.89137
G1 X205.749 Y95.207 E.0164
G1 X226.251 Y74.706 E.89137
G1 X226.251 Y74.172 E.0164
G1 X205.749 Y94.673 E.89137
G1 X205.749 Y94.14 E.0164
G1 X226.251 Y73.639 E.89137
G1 X226.251 Y73.105 E.0164
G1 X205.749 Y93.606 E.89137
G1 X205.749 Y93.073 E.0164
G1 X226.251 Y72.572 E.89137
G1 X226.251 Y72.038 E.0164
G1 X205.749 Y92.539 E.89137
G1 X205.749 Y92.005 E.0164
G1 X226.251 Y71.504 E.89137
G1 X226.251 Y70.971 E.0164
G1 X205.749 Y91.472 E.89137
G1 X205.749 Y90.938 E.0164
G1 X226.251 Y70.437 E.89137
G1 X226.251 Y69.904 E.0164
G1 X205.749 Y90.405 E.89137
G1 X205.749 Y89.871 E.0164
G1 X226.251 Y69.37 E.89137
G1 X226.251 Y68.837 E.0164
G1 X205.749 Y89.338 E.89137
G1 X205.749 Y88.804 E.0164
G1 X226.251 Y68.303 E.89137
G1 X226.251 Y67.769 E.0164
G1 X205.749 Y88.27 E.89137
G1 X205.749 Y87.737 E.0164
G1 X226.251 Y67.236 E.89137
G1 X226.251 Y66.702 E.0164
G1 X205.749 Y87.203 E.89137
G1 X205.749 Y86.67 E.0164
G1 X226.251 Y66.169 E.89137
G1 X226.251 Y65.635 E.0164
G1 X205.749 Y86.136 E.89137
G1 X205.749 Y85.603 E.0164
G1 X226.251 Y65.102 E.89137
G1 X226.251 Y64.568 E.0164
G1 X205.749 Y85.069 E.89137
G1 X205.749 Y84.536 E.0164
G1 X226.251 Y64.034 E.89137
G1 X226.251 Y63.501 E.0164
G1 X205.749 Y84.002 E.89137
G1 X205.749 Y83.468 E.0164
G1 X226.251 Y62.967 E.89137
G1 X226.251 Y62.434 E.0164
G1 X205.749 Y82.935 E.89137
G1 X205.749 Y82.401 E.0164
G1 X226.251 Y61.9 E.89137
G1 X226.251 Y61.367 E.0164
G1 X205.749 Y81.868 E.89137
G1 X205.749 Y81.334 E.0164
G1 X226.251 Y60.833 E.89137
G1 X226.251 Y60.299 E.0164
G1 X205.749 Y80.801 E.89137
G1 X205.749 Y80.267 E.0164
G1 X226.251 Y59.766 E.89137
G1 X226.251 Y59.232 E.0164
G1 X205.749 Y79.733 E.89137
G1 X205.749 Y79.2 E.0164
G1 X226.251 Y58.699 E.89137
G1 X226.251 Y58.165 E.0164
G1 X205.749 Y78.666 E.89137
G1 X205.749 Y78.133 E.0164
G1 X226.251 Y57.632 E.89137
G1 X226.251 Y57.098 E.0164
G1 X205.749 Y77.599 E.89137
G1 X205.749 Y77.066 E.0164
G1 X226.251 Y56.564 E.89137
G1 X226.251 Y56.031 E.0164
G1 X205.749 Y76.532 E.89137
G1 X205.749 Y75.998 E.0164
G1 X226.251 Y55.497 E.89137
G1 X226.251 Y54.964 E.0164
G1 X205.749 Y75.465 E.89137
G1 X205.749 Y74.931 E.0164
G1 X226.251 Y54.43 E.89137
G1 X226.251 Y53.897 E.0164
G1 X205.749 Y74.398 E.89137
G1 X205.749 Y73.864 E.0164
G1 X226.251 Y53.363 E.89137
G1 X226.251 Y52.829 E.0164
G1 X205.749 Y73.331 E.89137
G1 X205.749 Y72.797 E.0164
G1 X226.251 Y52.296 E.89137
G1 X226.251 Y51.762 E.0164
G1 X205.749 Y72.263 E.89137
G1 X205.749 Y71.73 E.0164
G1 X226.251 Y51.229 E.89137
G1 X226.251 Y50.695 E.0164
G1 X205.749 Y71.196 E.89137
G1 X205.749 Y70.663 E.0164
G1 X226.251 Y50.162 E.89137
G1 X226.251 Y49.628 E.0164
G1 X205.749 Y70.129 E.89137
M73 P74 R16
G1 X205.749 Y69.596 E.0164
G1 X226.251 Y49.095 E.89137
G1 X226.251 Y48.561 E.0164
G1 X205.749 Y69.062 E.89137
G1 X205.749 Y68.528 E.0164
G1 X226.251 Y48.027 E.89137
G1 X226.251 Y47.494 E.0164
G1 X205.749 Y67.995 E.89137
G1 X205.749 Y67.461 E.0164
G1 X226.251 Y46.96 E.89137
G1 X226.251 Y46.427 E.0164
G1 X205.749 Y66.928 E.89137
G1 X205.749 Y66.394 E.0164
G1 X226.251 Y45.893 E.89137
G1 X226.251 Y45.36 E.0164
G1 X205.749 Y65.861 E.89137
G1 X205.749 Y65.327 E.0164
G1 X226.251 Y44.826 E.89137
G1 X226.251 Y44.292 E.0164
G1 X205.749 Y64.793 E.89137
G1 X205.749 Y64.26 E.0164
G1 X226.251 Y43.759 E.89137
G1 X226.251 Y43.225 E.0164
G1 X205.749 Y63.726 E.89137
G1 X205.749 Y63.193 E.0164
G1 X226.251 Y42.692 E.89137
G1 X226.251 Y42.158 E.0164
G1 X205.749 Y62.659 E.89137
G1 X205.749 Y62.126 E.0164
G1 X226.251 Y41.625 E.89137
G1 X226.251 Y41.091 E.0164
G1 X205.749 Y61.592 E.89137
G1 X205.749 Y61.058 E.0164
G1 X226.251 Y40.557 E.89137
G1 X226.251 Y40.024 E.0164
G1 X205.749 Y60.525 E.89137
G1 X205.749 Y59.991 E.0164
G1 X226.251 Y39.49 E.89137
G1 X226.251 Y38.957 E.0164
G1 X205.749 Y59.458 E.89137
G1 X205.749 Y58.924 E.0164
G1 X217.215 Y47.459 E.4985
G3 X216.503 Y47.637 I-1.25 J-3.487 E.02259
G1 X205.749 Y58.391 E.46756
G1 X205.749 Y57.857 E.0164
G1 X215.931 Y47.675 E.4427
G3 X215.444 Y47.629 I.223 J-4.947 E.01506
G1 X205.749 Y57.324 E.42151
G1 X205.749 Y56.79 E.0164
G1 X215.008 Y47.531 E.40257
G3 X214.614 Y47.392 I.499 J-2.042 E.01288
G1 X205.749 Y56.256 E.38543
G1 X205.749 Y55.723 E.0164
G1 X214.255 Y47.217 E.36983
G3 X213.929 Y47.01 I.869 J-1.734 E.01191
G1 X205.749 Y55.189 E.35563
G1 X205.749 Y54.656 E.0164
G1 X213.633 Y46.772 E.34278
G3 X213.367 Y46.505 I1.203 J-1.47 E.01162
G1 X205.496 Y54.376 E.3422
G1 X204.962 Y54.376 E.0164
G1 X213.128 Y46.21 E.35504
G3 X212.919 Y45.885 I1.52 J-1.206 E.01189
G1 X204.429 Y54.376 E.36916
G1 X203.895 Y54.376 E.0164
G1 X212.742 Y45.529 E.38465
G3 X212.6 Y45.137 I1.886 J-.906 E.01282
G1 X203.362 Y54.376 E.40167
G1 X202.828 Y54.376 E.0164
G1 X212.498 Y44.705 E.42045
G3 X212.453 Y44.217 I4.411 J-.658 E.01508
G1 X202.295 Y54.376 E.44167
G1 X201.761 Y54.376 E.0164
G1 X212.482 Y43.654 E.46614
G3 X212.649 Y42.954 I4.037 J.592 E.02217
G1 X201.227 Y54.376 E.4966
G1 X200.694 Y54.376 E.0164
G1 X221.195 Y33.874 E.89137
G1 X221.729 Y33.874 E.0164
G1 X214.829 Y40.774 E.29998
G3 X215.531 Y40.606 I1.349 J4.084 E.02221
G1 X222.262 Y33.874 E.29267
G1 X222.796 Y33.874 E.0164
G1 X216.087 Y40.583 E.29168
G3 X216.581 Y40.623 I.089 J1.974 E.01527
G1 X223.329 Y33.874 E.29341
G1 X223.863 Y33.874 E.0164
G1 X217.014 Y40.724 E.29779
G3 X217.404 Y40.867 I-.522 J2.024 E.0128
G1 X224.396 Y33.874 E.30402
G1 X224.93 Y33.874 E.0164
G1 X217.76 Y41.045 E.31176
G3 X218.084 Y41.254 I-.885 J1.725 E.01188
G1 X225.464 Y33.874 E.32087
G1 X225.997 Y33.874 E.0164
G1 X218.379 Y41.493 E.33125
G3 X218.645 Y41.76 I-1.203 J1.465 E.01162
G1 X226.251 Y34.155 E.33069
G1 X226.251 Y34.688 E.0164
G1 X218.883 Y42.056 E.32035
G3 X219.091 Y42.381 I-1.522 J1.207 E.01189
G1 X226.251 Y35.222 E.31128
G1 X226.251 Y35.755 E.0164
G1 X219.269 Y42.737 E.30356
G3 X219.408 Y43.132 I-6.82 J2.62 E.01287
G1 X226.251 Y36.289 E.29753
G1 X226.251 Y36.822 E.0164
G1 X219.504 Y43.569 E.29335
G3 X219.548 Y44.058 I-2.423 J.468 E.01512
G1 X226.251 Y37.356 E.29141
G1 X226.251 Y37.89 E.0164
G1 X219.511 Y44.629 E.29301
G3 X219.332 Y45.342 I-3.513 J-.505 E.02264
G1 X226.42 Y38.253 E.30819
; WIPE_START
G1 X225.006 Y39.668 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X218.446 Y43.569 Z2.8 F30000
G1 X199.991 Y54.545 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F15000
G1 X220.661 Y33.874 E.89875
G1 X220.128 Y33.874 E.0164
G1 X199.627 Y54.376 E.89137
G1 X199.093 Y54.376 E.0164
G1 X219.594 Y33.874 E.89137
G1 X219.061 Y33.874 E.0164
G1 X198.56 Y54.376 E.89137
G1 X198.026 Y54.376 E.0164
G1 X218.527 Y33.874 E.89137
G1 X217.994 Y33.874 E.0164
G1 X197.493 Y54.376 E.89137
G1 X196.959 Y54.376 E.0164
G1 X217.46 Y33.874 E.89137
G1 X216.926 Y33.874 E.0164
G1 X196.425 Y54.376 E.89137
G1 X195.892 Y54.376 E.0164
G1 X216.393 Y33.874 E.89137
G1 X215.859 Y33.874 E.0164
G1 X195.358 Y54.376 E.89137
G1 X194.825 Y54.376 E.0164
G1 X215.326 Y33.874 E.89137
G1 X214.792 Y33.874 E.0164
G1 X194.291 Y54.376 E.89137
G1 X193.758 Y54.376 E.0164
G1 X214.259 Y33.874 E.89137
G1 X213.725 Y33.874 E.0164
G1 X193.224 Y54.376 E.89137
G1 X192.69 Y54.376 E.0164
G1 X213.191 Y33.874 E.89137
G1 X212.658 Y33.874 E.0164
G1 X192.157 Y54.376 E.89137
G1 X191.623 Y54.376 E.0164
G1 X212.124 Y33.874 E.89137
G1 X211.591 Y33.874 E.0164
G1 X191.09 Y54.376 E.89137
G1 X190.556 Y54.376 E.0164
G1 X211.057 Y33.874 E.89137
G1 X210.524 Y33.874 E.0164
G1 X190.023 Y54.376 E.89137
G1 X189.489 Y54.376 E.0164
G1 X209.99 Y33.874 E.89137
G1 X209.456 Y33.874 E.0164
G1 X188.955 Y54.376 E.89137
G1 X188.422 Y54.376 E.0164
G1 X208.923 Y33.874 E.89137
G1 X208.389 Y33.874 E.0164
G1 X187.888 Y54.376 E.89137
G1 X187.355 Y54.376 E.0164
G1 X207.856 Y33.874 E.89137
G1 X207.322 Y33.874 E.0164
G1 X186.821 Y54.376 E.89137
G1 X186.288 Y54.376 E.0164
G1 X206.789 Y33.874 E.89137
G1 X206.255 Y33.874 E.0164
G1 X185.754 Y54.376 E.89137
G1 X185.22 Y54.376 E.0164
G1 X205.722 Y33.874 E.89137
G1 X205.188 Y33.874 E.0164
G1 X184.687 Y54.376 E.89137
G1 X184.153 Y54.376 E.0164
G1 X204.654 Y33.874 E.89137
G1 X204.121 Y33.874 E.0164
G1 X183.62 Y54.376 E.89137
G1 X183.086 Y54.376 E.0164
G1 X203.587 Y33.874 E.89137
G1 X203.054 Y33.874 E.0164
G1 X182.553 Y54.376 E.89137
G1 X182.019 Y54.376 E.0164
G1 X202.52 Y33.874 E.89137
G1 X201.987 Y33.874 E.0164
G1 X181.485 Y54.376 E.89137
G1 X180.952 Y54.376 E.0164
G1 X201.453 Y33.874 E.89137
G1 X200.919 Y33.874 E.0164
G1 X180.418 Y54.376 E.89137
G1 X179.885 Y54.376 E.0164
G1 X200.386 Y33.874 E.89137
G1 X199.852 Y33.874 E.0164
G1 X179.351 Y54.376 E.89137
G1 X178.818 Y54.376 E.0164
G1 X199.319 Y33.874 E.89137
G1 X198.785 Y33.874 E.0164
G1 X178.284 Y54.376 E.89137
G1 X177.75 Y54.376 E.0164
G1 X198.252 Y33.874 E.89137
G1 X197.718 Y33.874 E.0164
G1 X177.217 Y54.376 E.89137
G1 X176.683 Y54.376 E.0164
G1 X197.184 Y33.874 E.89137
G1 X196.651 Y33.874 E.0164
G1 X176.15 Y54.376 E.89137
G1 X175.616 Y54.376 E.0164
G1 X196.117 Y33.874 E.89137
G1 X195.584 Y33.874 E.0164
G1 X175.083 Y54.376 E.89137
G1 X174.549 Y54.376 E.0164
G1 X195.05 Y33.874 E.89137
G1 X194.517 Y33.874 E.0164
G1 X174.015 Y54.376 E.89137
G1 X173.482 Y54.376 E.0164
G1 X193.983 Y33.874 E.89137
G1 X193.449 Y33.874 E.0164
G1 X172.948 Y54.376 E.89137
G1 X172.415 Y54.376 E.0164
G1 X192.916 Y33.874 E.89137
G1 X192.382 Y33.874 E.0164
G1 X171.881 Y54.376 E.89137
G1 X171.348 Y54.376 E.0164
G1 X191.849 Y33.874 E.89137
G1 X191.315 Y33.874 E.0164
G1 X170.814 Y54.376 E.89137
G1 X170.281 Y54.376 E.0164
G1 X190.782 Y33.874 E.89137
G1 X190.248 Y33.874 E.0164
G1 X169.747 Y54.376 E.89137
G1 X169.213 Y54.376 E.0164
G1 X189.714 Y33.874 E.89137
G1 X189.181 Y33.874 E.0164
G1 X168.68 Y54.376 E.89137
G1 X168.146 Y54.376 E.0164
G1 X188.647 Y33.874 E.89137
G1 X188.114 Y33.874 E.0164
G1 X167.613 Y54.376 E.89137
G1 X167.079 Y54.376 E.0164
G1 X187.58 Y33.874 E.89137
G1 X187.047 Y33.874 E.0164
G1 X166.546 Y54.376 E.89137
G1 X166.012 Y54.376 E.0164
G1 X186.513 Y33.874 E.89137
G1 X185.979 Y33.874 E.0164
G1 X165.478 Y54.376 E.89137
G1 X164.945 Y54.376 E.0164
G1 X185.446 Y33.874 E.89137
G1 X184.912 Y33.874 E.0164
G1 X164.411 Y54.376 E.89137
G1 X163.878 Y54.376 E.0164
G1 X184.379 Y33.874 E.89137
G1 X183.845 Y33.874 E.0164
G1 X163.344 Y54.376 E.89137
G1 X162.811 Y54.376 E.0164
G1 X183.312 Y33.874 E.89137
G1 X182.778 Y33.874 E.0164
G1 X162.277 Y54.376 E.89137
G1 X161.743 Y54.376 E.0164
G1 X182.244 Y33.874 E.89137
G1 X181.711 Y33.874 E.0164
G1 X161.21 Y54.376 E.89137
G1 X160.676 Y54.376 E.0164
G1 X181.177 Y33.874 E.89137
G1 X180.644 Y33.874 E.0164
G1 X160.143 Y54.376 E.89137
G1 X159.609 Y54.376 E.0164
G1 X180.11 Y33.874 E.89137
G1 X179.577 Y33.874 E.0164
G1 X159.076 Y54.376 E.89137
G1 X158.542 Y54.376 E.0164
G1 X179.043 Y33.874 E.89137
G1 X178.51 Y33.874 E.0164
G1 X158.008 Y54.376 E.89137
G1 X157.475 Y54.376 E.0164
G1 X177.976 Y33.874 E.89137
G1 X177.442 Y33.874 E.0164
G1 X156.941 Y54.376 E.89137
G1 X156.408 Y54.376 E.0164
G1 X176.909 Y33.874 E.89137
G1 X176.375 Y33.874 E.0164
G1 X155.874 Y54.376 E.89137
G1 X155.341 Y54.376 E.0164
G1 X175.842 Y33.874 E.89137
G1 X175.308 Y33.874 E.0164
G1 X154.807 Y54.376 E.89137
G1 X154.273 Y54.376 E.0164
G1 X174.775 Y33.874 E.89137
G1 X174.241 Y33.874 E.0164
G1 X153.74 Y54.376 E.89137
G1 X153.206 Y54.376 E.0164
G1 X173.707 Y33.874 E.89137
G1 X173.174 Y33.874 E.0164
G1 X152.673 Y54.376 E.89137
G1 X152.139 Y54.376 E.0164
G1 X172.64 Y33.874 E.89137
G1 X172.107 Y33.874 E.0164
G1 X151.606 Y54.376 E.89137
G1 X151.072 Y54.376 E.0164
G1 X171.573 Y33.874 E.89137
G1 X171.04 Y33.874 E.0164
G1 X150.538 Y54.376 E.89137
G1 X150.005 Y54.376 E.0164
G1 X170.506 Y33.874 E.89137
G1 X169.972 Y33.874 E.0164
G1 X149.471 Y54.376 E.89137
G1 X148.938 Y54.376 E.0164
G1 X169.439 Y33.874 E.89137
G1 X168.905 Y33.874 E.0164
G1 X148.404 Y54.376 E.89137
G1 X147.871 Y54.376 E.0164
G1 X168.372 Y33.874 E.89137
G1 X167.838 Y33.874 E.0164
G1 X147.337 Y54.376 E.89137
G1 X146.803 Y54.376 E.0164
G1 X167.305 Y33.874 E.89137
G1 X166.771 Y33.874 E.0164
G1 X146.27 Y54.376 E.89137
G1 X145.736 Y54.376 E.0164
G1 X166.237 Y33.874 E.89137
G1 X165.704 Y33.874 E.0164
G1 X145.203 Y54.376 E.89137
G1 X144.669 Y54.376 E.0164
G1 X165.17 Y33.874 E.89137
G1 X164.637 Y33.874 E.0164
G1 X144.136 Y54.376 E.89137
G1 X143.602 Y54.376 E.0164
G1 X164.103 Y33.874 E.89137
G1 X163.57 Y33.874 E.0164
G1 X143.068 Y54.376 E.89137
G1 X142.535 Y54.376 E.0164
G1 X163.036 Y33.874 E.89137
G1 X162.502 Y33.874 E.0164
G1 X142.001 Y54.376 E.89137
G1 X141.468 Y54.376 E.0164
G1 X161.969 Y33.874 E.89137
G1 X161.435 Y33.874 E.0164
G1 X140.934 Y54.376 E.89137
G1 X140.401 Y54.376 E.0164
G1 X160.902 Y33.874 E.89137
G1 X160.368 Y33.874 E.0164
G1 X139.867 Y54.376 E.89137
G1 X139.334 Y54.376 E.0164
G1 X159.835 Y33.874 E.89137
G1 X159.301 Y33.874 E.0164
G1 X138.8 Y54.376 E.89137
G1 X138.266 Y54.376 E.0164
G1 X158.767 Y33.874 E.89137
G1 X158.234 Y33.874 E.0164
G1 X137.733 Y54.376 E.89137
G1 X137.199 Y54.376 E.0164
G1 X157.7 Y33.874 E.89137
G1 X157.167 Y33.874 E.0164
G1 X136.666 Y54.376 E.89137
G1 X136.132 Y54.376 E.0164
G1 X156.633 Y33.874 E.89137
G1 X156.1 Y33.874 E.0164
G1 X135.599 Y54.376 E.89137
G1 X135.065 Y54.376 E.0164
G1 X155.566 Y33.874 E.89137
G1 X155.032 Y33.874 E.0164
G1 X134.531 Y54.376 E.89137
G1 X133.998 Y54.376 E.0164
G1 X154.499 Y33.874 E.89137
G1 X153.965 Y33.874 E.0164
G1 X133.464 Y54.376 E.89137
G1 X132.931 Y54.376 E.0164
G1 X153.432 Y33.874 E.89137
G1 X152.898 Y33.874 E.0164
G1 X132.397 Y54.376 E.89137
G1 X131.864 Y54.376 E.0164
G1 X152.365 Y33.874 E.89137
G1 X151.831 Y33.874 E.0164
G1 X131.33 Y54.376 E.89137
G1 X130.796 Y54.376 E.0164
G1 X151.297 Y33.874 E.89137
G1 X150.764 Y33.874 E.0164
G1 X130.263 Y54.376 E.89137
G1 X129.729 Y54.376 E.0164
G1 X150.23 Y33.874 E.89137
G1 X149.697 Y33.874 E.0164
G1 X129.196 Y54.376 E.89137
G1 X128.662 Y54.376 E.0164
G1 X149.163 Y33.874 E.89137
G1 X148.63 Y33.874 E.0164
G1 X128.129 Y54.376 E.89137
G1 X127.595 Y54.376 E.0164
G1 X148.096 Y33.874 E.89137
G1 X147.563 Y33.874 E.0164
G1 X127.061 Y54.376 E.89137
G1 X126.528 Y54.376 E.0164
G1 X147.029 Y33.874 E.89137
G1 X146.495 Y33.874 E.0164
G1 X125.994 Y54.376 E.89137
G1 X125.461 Y54.376 E.0164
G1 X145.962 Y33.874 E.89137
G1 X145.428 Y33.874 E.0164
G1 X124.927 Y54.376 E.89137
G1 X124.394 Y54.376 E.0164
G1 X144.895 Y33.874 E.89137
G1 X144.361 Y33.874 E.0164
G1 X123.86 Y54.376 E.89137
G1 X123.326 Y54.376 E.0164
G1 X143.828 Y33.874 E.89137
G1 X143.294 Y33.874 E.0164
G1 X122.793 Y54.376 E.89137
G1 X122.259 Y54.376 E.0164
G1 X129.156 Y47.479 E.29987
G3 X128.459 Y47.642 I-1.159 J-3.368 E.02206
G1 X121.726 Y54.376 E.29275
G1 X121.192 Y54.376 E.0164
G1 X127.893 Y47.674 E.29137
G3 X127.411 Y47.623 I.015 J-2.441 E.01494
G1 X120.659 Y54.376 E.29359
G1 X120.125 Y54.376 E.0164
G1 X126.978 Y47.522 E.29797
G3 X126.586 Y47.381 I.512 J-2.029 E.01283
G1 X119.591 Y54.376 E.30413
G1 X119.058 Y54.376 E.0164
G1 X126.23 Y47.204 E.31183
G3 X125.907 Y46.993 I6.546 J-10.38 E.01185
G1 X118.524 Y54.376 E.32099
G1 X117.991 Y54.376 E.0164
G1 X125.614 Y46.753 E.33144
G3 X125.349 Y46.484 I1.209 J-1.457 E.01162
G1 X117.457 Y54.376 E.34312
G1 X116.924 Y54.376 E.0164
G1 X125.112 Y46.187 E.35604
G3 X124.906 Y45.86 I1.53 J-1.197 E.01191
G1 X116.39 Y54.376 E.37025
G1 X115.856 Y54.376 E.0164
G1 X124.731 Y45.501 E.38584
M73 P75 R16
G3 X124.591 Y45.108 I1.897 J-.895 E.01287
G1 X115.323 Y54.376 E.40296
G1 X114.789 Y54.376 E.0164
G1 X124.492 Y44.673 E.42185
G3 X124.453 Y44.179 I4.85 J-.632 E.01526
G1 X114.256 Y54.376 E.44336
G1 X113.722 Y54.376 E.0164
G1 X124.486 Y43.611 E.46802
G3 X124.669 Y42.895 I2.417 J.234 E.0228
G1 X113.189 Y54.376 E.49915
G1 X112.655 Y54.376 E.0164
G1 X133.156 Y33.874 E.89137
G1 X133.69 Y33.874 E.0164
G1 X126.765 Y40.799 E.30107
G3 X127.484 Y40.614 I1.286 J3.507 E.02285
G1 X134.223 Y33.874 E.29303
G1 X134.757 Y33.874 E.0164
G1 X128.048 Y40.583 E.29168
G3 X128.546 Y40.618 I.108 J1.989 E.01539
G1 X135.29 Y33.874 E.29322
G1 X135.824 Y33.874 E.0164
G1 X128.985 Y40.714 E.29737
G3 X129.377 Y40.855 I-.51 J2.035 E.01284
G1 X136.358 Y33.874 E.3035
G1 X136.891 Y33.874 E.0164
G1 X129.735 Y41.031 E.31115
G3 X130.061 Y41.238 I-.874 J1.734 E.0119
G1 X137.425 Y33.874 E.32016
G1 X137.958 Y33.874 E.0164
G1 X130.358 Y41.475 E.33046
G3 X130.626 Y41.74 I-1.19 J1.472 E.01162
G1 X138.492 Y33.874 E.34199
G1 X139.025 Y33.874 E.0164
G1 X130.866 Y42.034 E.35476
G3 X131.077 Y42.357 I-1.51 J1.215 E.01187
G1 X139.559 Y33.874 E.36881
G1 X140.093 Y33.874 E.0164
G1 X131.256 Y42.711 E.3842
G3 X131.4 Y43.101 I-6.564 J2.637 E.01278
G1 X140.626 Y33.874 E.40116
G1 X141.16 Y33.874 E.0164
G1 X131.498 Y43.536 E.42006
G3 X131.546 Y44.021 I-2.408 J.483 E.01503
G1 X141.693 Y33.874 E.44117
G1 X142.227 Y33.874 E.0164
G1 X131.518 Y44.583 E.4656
G3 X131.354 Y45.281 I-3.634 J-.486 E.02206
G1 X142.93 Y33.705 E.5033
; WIPE_START
G1 X141.516 Y35.119 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X135.137 Y39.31 Z2.8 F30000
G1 X111.952 Y54.545 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F15000
G1 X132.623 Y33.874 E.89875
G1 X132.089 Y33.874 E.0164
G1 X111.588 Y54.376 E.89137
G1 X111.054 Y54.376 E.0164
G1 X131.555 Y33.874 E.89137
G1 X131.022 Y33.874 E.0164
G1 X110.521 Y54.376 E.89137
G1 X109.987 Y54.376 E.0164
G1 X130.488 Y33.874 E.89137
G1 X129.955 Y33.874 E.0164
G1 X109.454 Y54.376 E.89137
G1 X108.92 Y54.376 E.0164
G1 X129.421 Y33.874 E.89137
G1 X128.888 Y33.874 E.0164
G1 X108.387 Y54.376 E.89137
G1 X107.853 Y54.376 E.0164
G1 X128.354 Y33.874 E.89137
G1 X127.82 Y33.874 E.0164
G1 X107.319 Y54.376 E.89137
G1 X106.786 Y54.376 E.0164
G1 X127.287 Y33.874 E.89137
G1 X126.753 Y33.874 E.0164
G1 X106.252 Y54.376 E.89137
G1 X105.719 Y54.376 E.0164
G1 X126.22 Y33.874 E.89137
G1 X125.686 Y33.874 E.0164
G1 X105.185 Y54.376 E.89137
G1 X104.652 Y54.376 E.0164
G1 X125.153 Y33.874 E.89137
G1 X124.619 Y33.874 E.0164
G1 X104.118 Y54.376 E.89137
G1 X103.584 Y54.376 E.0164
G1 X124.085 Y33.874 E.89137
G1 X123.552 Y33.874 E.0164
G1 X103.051 Y54.376 E.89137
G1 X102.517 Y54.376 E.0164
G1 X123.018 Y33.874 E.89137
G1 X122.485 Y33.874 E.0164
G1 X101.984 Y54.376 E.89137
G1 X101.45 Y54.376 E.0164
G1 X121.951 Y33.874 E.89137
G1 X121.418 Y33.874 E.0164
G1 X100.917 Y54.376 E.89137
G1 X100.383 Y54.376 E.0164
G1 X120.884 Y33.874 E.89137
G1 X120.351 Y33.874 E.0164
G1 X99.849 Y54.376 E.89137
G1 X99.316 Y54.376 E.0164
G1 X119.817 Y33.874 E.89137
G1 X119.283 Y33.874 E.0164
G1 X98.782 Y54.376 E.89137
G1 X98.249 Y54.376 E.0164
G1 X118.75 Y33.874 E.89137
G1 X118.216 Y33.874 E.0164
G1 X97.715 Y54.376 E.89137
G1 X97.182 Y54.376 E.0164
G1 X117.683 Y33.874 E.89137
G1 X117.149 Y33.874 E.0164
G1 X96.648 Y54.376 E.89137
G1 X96.114 Y54.376 E.0164
G1 X116.616 Y33.874 E.89137
G1 X116.082 Y33.874 E.0164
G1 X95.581 Y54.376 E.89137
G1 X95.047 Y54.376 E.0164
G1 X115.548 Y33.874 E.89137
G1 X115.015 Y33.874 E.0164
G1 X94.514 Y54.376 E.89137
G1 X93.98 Y54.376 E.0164
G1 X114.481 Y33.874 E.89137
G1 X113.948 Y33.874 E.0164
G1 X93.447 Y54.376 E.89137
G1 X92.913 Y54.376 E.0164
G1 X113.414 Y33.874 E.89137
G1 X112.881 Y33.874 E.0164
G1 X92.379 Y54.376 E.89137
G1 X91.846 Y54.376 E.0164
G1 X112.347 Y33.874 E.89137
G1 X111.813 Y33.874 E.0164
G1 X91.312 Y54.376 E.89137
G1 X90.779 Y54.376 E.0164
G1 X111.28 Y33.874 E.89137
G1 X110.746 Y33.874 E.0164
G1 X90.245 Y54.376 E.89137
G1 X89.712 Y54.376 E.0164
G1 X110.213 Y33.874 E.89137
G1 X109.679 Y33.874 E.0164
G1 X89.178 Y54.376 E.89137
G1 X88.644 Y54.376 E.0164
G1 X109.146 Y33.874 E.89137
G1 X108.612 Y33.874 E.0164
G1 X88.111 Y54.376 E.89137
G1 X87.577 Y54.376 E.0164
G1 X108.078 Y33.874 E.89137
G1 X107.545 Y33.874 E.0164
G1 X87.044 Y54.376 E.89137
G1 X86.51 Y54.376 E.0164
G1 X107.011 Y33.874 E.89137
G1 X106.478 Y33.874 E.0164
G1 X85.977 Y54.376 E.89137
G1 X85.443 Y54.376 E.0164
G1 X105.944 Y33.874 E.89137
G1 X105.411 Y33.874 E.0164
G1 X84.91 Y54.376 E.89137
G1 X84.376 Y54.376 E.0164
G1 X104.877 Y33.874 E.89137
G1 X104.343 Y33.874 E.0164
G1 X83.842 Y54.376 E.89137
G1 X83.309 Y54.376 E.0164
G1 X103.81 Y33.874 E.89137
G1 X103.276 Y33.874 E.0164
G1 X82.775 Y54.376 E.89137
G1 X82.242 Y54.376 E.0164
G1 X102.743 Y33.874 E.89137
G1 X102.209 Y33.874 E.0164
G1 X81.708 Y54.376 E.89137
G1 X81.175 Y54.376 E.0164
G1 X101.676 Y33.874 E.89137
G1 X101.142 Y33.874 E.0164
G1 X80.641 Y54.376 E.89137
G1 X80.107 Y54.376 E.0164
G1 X100.608 Y33.874 E.89137
G1 X100.075 Y33.874 E.0164
G1 X79.574 Y54.376 E.89137
G1 X79.04 Y54.376 E.0164
G1 X99.541 Y33.874 E.89137
G1 X99.008 Y33.874 E.0164
G1 X78.507 Y54.376 E.89137
G1 X77.973 Y54.376 E.0164
G1 X98.474 Y33.874 E.89137
G1 X97.941 Y33.874 E.0164
G1 X77.44 Y54.376 E.89137
G1 X76.906 Y54.376 E.0164
G1 X97.407 Y33.874 E.89137
G1 X96.873 Y33.874 E.0164
G1 X76.372 Y54.376 E.89137
G1 X75.839 Y54.376 E.0164
G1 X96.34 Y33.874 E.89137
G1 X95.806 Y33.874 E.0164
G1 X75.305 Y54.376 E.89137
G1 X74.772 Y54.376 E.0164
G1 X95.273 Y33.874 E.89137
G1 X94.739 Y33.874 E.0164
G1 X74.238 Y54.376 E.89137
G1 X73.705 Y54.376 E.0164
G1 X94.206 Y33.874 E.89137
G1 X93.672 Y33.874 E.0164
G1 X73.171 Y54.376 E.89137
G1 X72.637 Y54.376 E.0164
G1 X93.139 Y33.874 E.89137
G1 X92.605 Y33.874 E.0164
G1 X72.104 Y54.376 E.89137
G1 X71.57 Y54.376 E.0164
G1 X92.071 Y33.874 E.89137
G1 X91.538 Y33.874 E.0164
G1 X71.037 Y54.376 E.89137
G1 X70.503 Y54.376 E.0164
G1 X91.004 Y33.874 E.89137
G1 X90.471 Y33.874 E.0164
G1 X69.97 Y54.376 E.89137
G1 X69.436 Y54.376 E.0164
G1 X89.937 Y33.874 E.89137
G1 X89.404 Y33.874 E.0164
G1 X68.902 Y54.376 E.89137
G1 X68.369 Y54.376 E.0164
G1 X88.87 Y33.874 E.89137
G1 X88.336 Y33.874 E.0164
G1 X67.835 Y54.376 E.89137
G1 X67.302 Y54.376 E.0164
G1 X87.803 Y33.874 E.89137
G1 X87.269 Y33.874 E.0164
G1 X66.768 Y54.376 E.89137
G1 X66.235 Y54.376 E.0164
G1 X86.736 Y33.874 E.89137
G1 X86.202 Y33.874 E.0164
G1 X65.701 Y54.376 E.89137
G1 X65.167 Y54.376 E.0164
G1 X85.669 Y33.874 E.89137
G1 X85.135 Y33.874 E.0164
G1 X64.634 Y54.376 E.89137
G1 X64.1 Y54.376 E.0164
G1 X84.601 Y33.874 E.89137
G1 X84.068 Y33.874 E.0164
G1 X63.567 Y54.376 E.89137
G1 X63.033 Y54.376 E.0164
G1 X83.534 Y33.874 E.89137
G1 X83.001 Y33.874 E.0164
G1 X62.5 Y54.376 E.89137
G1 X61.966 Y54.376 E.0164
G1 X82.467 Y33.874 E.89137
G1 X81.934 Y33.874 E.0164
G1 X61.432 Y54.376 E.89137
G1 X60.899 Y54.376 E.0164
G1 X81.4 Y33.874 E.89137
G1 X80.866 Y33.874 E.0164
G1 X60.365 Y54.376 E.89137
G1 X59.832 Y54.376 E.0164
G1 X80.333 Y33.874 E.89137
G1 X79.799 Y33.874 E.0164
G1 X59.298 Y54.376 E.89137
G1 X58.765 Y54.376 E.0164
G1 X79.266 Y33.874 E.89137
G1 X78.732 Y33.874 E.0164
G1 X58.231 Y54.376 E.89137
G1 X57.697 Y54.376 E.0164
G1 X78.199 Y33.874 E.89137
G1 X77.665 Y33.874 E.0164
G1 X57.164 Y54.376 E.89137
G1 X56.63 Y54.376 E.0164
G1 X77.131 Y33.874 E.89137
G1 X76.598 Y33.874 E.0164
G1 X56.097 Y54.376 E.89137
G1 X55.563 Y54.376 E.0164
G1 X76.064 Y33.874 E.89137
G1 X75.531 Y33.874 E.0164
G1 X55.03 Y54.376 E.89137
G1 X54.496 Y54.376 E.0164
G1 X74.997 Y33.874 E.89137
G1 X74.464 Y33.874 E.0164
G1 X53.963 Y54.376 E.89137
G1 X53.429 Y54.376 E.0164
G1 X73.93 Y33.874 E.89137
G1 X73.396 Y33.874 E.0164
G1 X52.895 Y54.376 E.89137
G1 X52.362 Y54.376 E.0164
G1 X72.863 Y33.874 E.89137
G1 X72.329 Y33.874 E.0164
G1 X51.828 Y54.376 E.89137
G1 X51.295 Y54.376 E.0164
G1 X71.796 Y33.874 E.89137
G1 X71.262 Y33.874 E.0164
G1 X50.761 Y54.376 E.89137
G1 X50.251 Y54.376 E.0157
G1 X50.251 Y54.886 E.0157
G1 X29.749 Y75.387 E.89137
G1 X29.749 Y75.921 E.0164
G1 X50.251 Y55.42 E.89137
G1 X50.251 Y55.953 E.0164
G1 X29.749 Y76.454 E.89137
G1 X29.749 Y76.988 E.0164
G1 X50.251 Y56.487 E.89137
G1 X50.251 Y57.02 E.0164
G1 X29.749 Y77.521 E.89137
G1 X29.749 Y78.055 E.0164
G1 X50.251 Y57.554 E.89137
G1 X50.251 Y58.088 E.0164
G1 X29.749 Y78.589 E.89137
G1 X29.749 Y79.122 E.0164
G1 X50.251 Y58.621 E.89137
G1 X50.251 Y59.155 E.0164
G1 X29.749 Y79.656 E.89137
G1 X29.749 Y80.189 E.0164
G1 X50.251 Y59.688 E.89137
G1 X50.251 Y60.222 E.0164
G1 X29.749 Y80.723 E.89137
G1 X29.749 Y81.256 E.0164
G1 X50.251 Y60.755 E.89137
G1 X50.251 Y61.289 E.0164
G1 X29.749 Y81.79 E.89137
G1 X29.749 Y82.324 E.0164
G1 X50.251 Y61.822 E.89137
G1 X50.251 Y62.356 E.0164
G1 X29.749 Y82.857 E.89137
G1 X29.749 Y83.391 E.0164
G1 X50.251 Y62.89 E.89137
G1 X50.251 Y63.423 E.0164
G1 X29.749 Y83.924 E.89137
G1 X29.749 Y84.458 E.0164
G1 X50.251 Y63.957 E.89137
G1 X50.251 Y64.49 E.0164
G1 X29.749 Y84.991 E.89137
G1 X29.749 Y85.525 E.0164
G1 X50.251 Y65.024 E.89137
G1 X50.251 Y65.557 E.0164
G1 X29.749 Y86.059 E.89137
G1 X29.749 Y86.592 E.0164
G1 X50.251 Y66.091 E.89137
G1 X50.251 Y66.625 E.0164
G1 X29.749 Y87.126 E.89137
G1 X29.749 Y87.659 E.0164
G1 X50.251 Y67.158 E.89137
G1 X50.251 Y67.692 E.0164
G1 X29.749 Y88.193 E.89137
G1 X29.749 Y88.726 E.0164
G1 X50.251 Y68.225 E.89137
G1 X50.251 Y68.759 E.0164
G1 X29.749 Y89.26 E.89137
G1 X29.749 Y89.794 E.0164
G1 X50.251 Y69.292 E.89137
G1 X50.251 Y69.826 E.0164
G1 X29.749 Y90.327 E.89137
G1 X29.749 Y90.861 E.0164
G1 X50.251 Y70.36 E.89137
G1 X50.251 Y70.893 E.0164
G1 X29.749 Y91.394 E.89137
G1 X29.749 Y91.928 E.0164
G1 X50.251 Y71.427 E.89137
G1 X50.251 Y71.96 E.0164
G1 X29.749 Y92.461 E.89137
G1 X29.749 Y92.995 E.0164
G1 X50.251 Y72.494 E.89137
G1 X50.251 Y73.027 E.0164
G1 X29.749 Y93.529 E.89137
G1 X29.749 Y94.062 E.0164
G1 X50.251 Y73.561 E.89137
G1 X50.251 Y74.095 E.0164
G1 X29.749 Y94.596 E.89137
G1 X29.749 Y95.129 E.0164
G1 X50.251 Y74.628 E.89137
G1 X50.251 Y75.162 E.0164
G1 X29.749 Y95.663 E.89137
G1 X29.749 Y96.196 E.0164
G1 X50.251 Y75.695 E.89137
G1 X50.251 Y76.229 E.0164
G1 X29.749 Y96.73 E.89137
G1 X29.749 Y97.263 E.0164
G1 X50.251 Y76.762 E.89137
G1 X50.251 Y77.296 E.0164
G1 X29.749 Y97.797 E.89137
G1 X29.749 Y98.331 E.0164
G1 X50.251 Y77.83 E.89137
G1 X50.251 Y78.363 E.0164
G1 X29.749 Y98.864 E.89137
G1 X29.749 Y99.398 E.0164
G1 X50.251 Y78.897 E.89137
G1 X50.251 Y79.43 E.0164
G1 X29.749 Y99.931 E.89137
G1 X29.749 Y100.465 E.0164
G1 X50.251 Y79.964 E.89137
G1 X50.251 Y80.497 E.0164
G1 X29.749 Y100.998 E.89137
G1 X29.749 Y101.532 E.0164
G1 X50.251 Y81.031 E.89137
G1 X50.251 Y81.565 E.0164
G1 X29.749 Y102.066 E.89137
G1 X29.749 Y102.599 E.0164
G1 X50.251 Y82.098 E.89137
G1 X50.251 Y82.632 E.0164
G1 X29.749 Y103.133 E.89137
G1 X29.749 Y103.666 E.0164
G1 X50.251 Y83.165 E.89137
G1 X50.251 Y83.699 E.0164
G1 X29.749 Y104.2 E.89137
G1 X29.749 Y104.733 E.0164
G1 X50.251 Y84.232 E.89137
G1 X50.251 Y84.766 E.0164
G1 X29.749 Y105.267 E.89137
G1 X29.749 Y105.801 E.0164
G1 X50.251 Y85.3 E.89137
G1 X50.251 Y85.833 E.0164
G1 X29.749 Y106.334 E.89137
G1 X29.749 Y106.868 E.0164
G1 X50.251 Y86.367 E.89137
G1 X50.251 Y86.9 E.0164
G1 X29.749 Y107.401 E.89137
G1 X29.749 Y107.935 E.0164
G1 X50.251 Y87.434 E.89137
G1 X50.251 Y87.967 E.0164
G1 X29.749 Y108.468 E.89137
G1 X29.749 Y109.002 E.0164
G1 X50.251 Y88.501 E.89137
G1 X50.251 Y89.034 E.0164
G1 X29.749 Y109.536 E.89137
G1 X29.749 Y110.069 E.0164
G1 X50.251 Y89.568 E.89137
G1 X50.251 Y90.102 E.0164
G1 X29.749 Y110.603 E.89137
G1 X29.749 Y111.136 E.0164
G1 X50.251 Y90.635 E.89137
G1 X50.251 Y91.169 E.0164
G1 X29.749 Y111.67 E.89137
G1 X29.749 Y112.203 E.0164
G1 X50.251 Y91.702 E.89137
M73 P75 R15
G1 X50.251 Y92.236 E.0164
G1 X29.749 Y112.737 E.89137
G1 X29.749 Y113.271 E.0164
G1 X50.251 Y92.769 E.89137
G1 X50.251 Y93.303 E.0164
G1 X29.749 Y113.804 E.89137
G1 X29.749 Y114.338 E.0164
G1 X50.251 Y93.837 E.89137
G1 X50.251 Y94.37 E.0164
G1 X29.749 Y114.871 E.89137
G1 X29.749 Y115.405 E.0164
G1 X50.251 Y94.904 E.89137
G1 X50.251 Y95.437 E.0164
G1 X29.749 Y115.938 E.89137
G1 X29.749 Y116.472 E.0164
G1 X50.251 Y95.971 E.89137
G1 X50.251 Y96.504 E.0164
G1 X29.749 Y117.006 E.89137
G1 X29.749 Y117.539 E.0164
G1 X50.251 Y97.038 E.89137
G1 X50.251 Y97.572 E.0164
G1 X29.749 Y118.073 E.89137
G1 X29.749 Y118.606 E.0164
G1 X50.251 Y98.105 E.89137
G1 X50.251 Y98.639 E.0164
G1 X29.749 Y119.14 E.89137
G1 X29.749 Y119.673 E.0164
G1 X50.251 Y99.172 E.89137
G1 X50.251 Y99.706 E.0164
G1 X29.749 Y120.207 E.89137
G1 X29.749 Y120.74 E.0164
G1 X50.251 Y100.239 E.89137
G1 X50.251 Y100.773 E.0164
G1 X29.749 Y121.274 E.89137
G1 X29.749 Y121.808 E.0164
G1 X50.251 Y101.307 E.89137
G1 X50.251 Y101.84 E.0164
G1 X29.749 Y122.341 E.89137
G1 X29.749 Y122.875 E.0164
G1 X50.251 Y102.374 E.89137
G1 X50.251 Y102.907 E.0164
G1 X29.749 Y123.408 E.89137
G1 X29.749 Y123.942 E.0164
G1 X50.251 Y103.441 E.89137
G1 X50.251 Y103.974 E.0164
G1 X29.749 Y124.475 E.89137
G1 X29.749 Y125.009 E.0164
G1 X50.251 Y104.508 E.89137
G1 X50.251 Y105.042 E.0164
G1 X29.749 Y125.543 E.89137
G1 X29.749 Y126.076 E.0164
G1 X50.251 Y105.575 E.89137
G1 X50.251 Y106.109 E.0164
G1 X29.749 Y126.61 E.89137
G1 X29.749 Y127.143 E.0164
G1 X50.251 Y106.642 E.89137
G1 X50.251 Y107.176 E.0164
G1 X29.749 Y127.677 E.89137
G1 X29.749 Y128.21 E.0164
G1 X50.251 Y107.709 E.89137
G1 X50.251 Y108.243 E.0164
G1 X29.749 Y128.744 E.89137
G1 X29.749 Y129.278 E.0164
G1 X50.251 Y108.777 E.89137
G1 X50.251 Y109.31 E.0164
G1 X29.749 Y129.811 E.89137
G1 X29.749 Y130.345 E.0164
G1 X50.251 Y109.844 E.89137
G1 X50.251 Y110.377 E.0164
G1 X29.58 Y131.048 E.89875
; WIPE_START
G1 X30.994 Y129.634 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X37.88 Y126.341 Z2.8 F30000
G1 X50.42 Y120.345 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F15000
G1 X43.168 Y127.598 E.31534
G2 X43.465 Y126.767 I-3.315 J-1.656 E.02721
G1 X50.251 Y119.981 E.29502
G1 X50.251 Y119.448 E.0164
G1 X43.544 Y126.155 E.2916
G2 X43.532 Y125.633 I-4.858 J-.149 E.01605
G1 X50.251 Y118.914 E.29212
G1 X50.251 Y118.381 E.0164
G1 X43.452 Y125.18 E.29561
G2 X43.327 Y124.77 I-2.112 J.418 E.01317
G1 X50.251 Y117.847 E.30101
G1 X50.251 Y117.314 E.0164
G1 X43.166 Y124.398 E.30804
G2 X42.971 Y124.059 I-1.789 J.802 E.01204
G1 X50.251 Y116.78 E.3165
G1 X50.251 Y116.246 E.0164
G1 X42.746 Y123.751 E.32628
G2 X42.492 Y123.471 I-1.522 J1.126 E.01163
G1 X50.251 Y115.713 E.33731
G1 X50.251 Y115.179 E.0164
G1 X42.21 Y123.22 E.3496
G2 X41.897 Y122.999 I-1.258 J1.45 E.01179
G1 X50.251 Y114.646 E.3632
G1 X50.251 Y114.112 E.0164
G1 X41.553 Y122.809 E.37814
G2 X41.176 Y122.653 I-.968 J1.802 E.01258
G1 X50.251 Y113.579 E.39455
G1 X50.251 Y113.045 E.0164
G1 X40.76 Y122.535 E.41262
G2 X40.299 Y122.463 I-.593 J2.264 E.01437
G1 X50.251 Y112.512 E.43266
G1 X50.251 Y111.978 E.0164
G1 X39.768 Y122.46 E.45576
G2 X39.137 Y122.558 I.264 J3.796 E.01966
G1 X50.251 Y111.444 E.4832
G1 X50.251 Y110.911 E.0164
G1 X29.749 Y131.412 E.89137
G1 X29.749 Y131.945 E.0164
G1 X36.555 Y125.14 E.29589
G2 X36.458 Y125.77 I3.101 J.799 E.01964
G1 X29.749 Y132.479 E.29168
G1 X29.749 Y133.013 E.0164
G1 X36.465 Y126.297 E.29198
G2 X36.535 Y126.761 I2.351 J-.118 E.01444
G1 X29.749 Y133.546 E.29502
G1 X29.749 Y134.08 E.0164
G1 X36.651 Y127.178 E.30008
G2 X36.808 Y127.555 I7.301 J-2.809 E.01255
G1 X29.749 Y134.613 E.30689
G1 X29.749 Y135.147 E.0164
G1 X37 Y127.897 E.31524
G2 X37.222 Y128.208 I1.666 J-.954 E.01178
G1 X29.749 Y135.68 E.3249
G1 X29.749 Y136.214 E.0164
G1 X37.473 Y128.49 E.33581
G2 X37.752 Y128.745 I1.411 J-1.269 E.01163
G1 X29.749 Y136.748 E.34796
G1 X29.749 Y137.281 E.0164
G1 X38.06 Y128.97 E.36136
G2 X38.399 Y129.165 I1.145 J-1.593 E.01203
G1 X29.749 Y137.815 E.37607
G1 X29.749 Y138.348 E.0164
G1 X38.77 Y129.328 E.3922
G2 X39.178 Y129.454 I.833 J-1.976 E.01314
G1 X29.749 Y138.882 E.40993
G1 X29.749 Y139.415 E.0164
G1 X39.635 Y129.53 E.42982
M73 P76 R15
G2 X40.154 Y129.545 I.333 J-2.58 E.01599
G1 X29.749 Y139.949 E.45238
G1 X29.749 Y140.483 E.0164
G1 X40.769 Y129.463 E.47912
G2 X41.593 Y129.173 I-.82 J-3.644 E.0269
G1 X29.749 Y141.016 E.51493
G1 X29.749 Y141.55 E.0164
G1 X50.251 Y121.049 E.89137
G1 X50.251 Y121.582 E.0164
G1 X29.749 Y142.083 E.89137
G1 X29.749 Y142.617 E.0164
G1 X50.251 Y122.116 E.89137
G1 X50.251 Y122.649 E.0164
G1 X29.749 Y143.15 E.89137
G1 X29.749 Y143.684 E.0164
G1 X50.251 Y123.183 E.89137
G1 X50.251 Y123.716 E.0164
G1 X29.749 Y144.218 E.89137
G1 X29.749 Y144.751 E.0164
G1 X50.251 Y124.25 E.89137
G1 X50.251 Y124.784 E.0164
G1 X29.749 Y145.285 E.89137
G1 X29.749 Y145.818 E.0164
G1 X50.251 Y125.317 E.89137
G1 X50.251 Y125.851 E.0164
G1 X29.749 Y146.352 E.89137
G1 X29.749 Y146.885 E.0164
G1 X50.251 Y126.384 E.89137
G1 X50.251 Y126.918 E.0164
G1 X29.749 Y147.419 E.89137
G1 X29.749 Y147.952 E.0164
G1 X50.251 Y127.451 E.89137
G1 X50.251 Y127.985 E.0164
G1 X29.749 Y148.486 E.89137
G1 X29.749 Y149.02 E.0164
G1 X50.251 Y128.519 E.89137
G1 X50.251 Y129.052 E.0164
G1 X29.749 Y149.553 E.89137
G1 X29.749 Y150.087 E.0164
G1 X50.251 Y129.586 E.89137
G1 X50.251 Y130.119 E.0164
G1 X29.749 Y150.62 E.89137
G1 X29.749 Y151.154 E.0164
G1 X50.251 Y130.653 E.89137
G1 X50.251 Y131.186 E.0164
G1 X29.749 Y151.687 E.89137
G1 X29.749 Y152.221 E.0164
G1 X50.251 Y131.72 E.89137
G1 X50.251 Y132.254 E.0164
G1 X29.749 Y152.755 E.89137
G1 X29.749 Y153.288 E.0164
G1 X50.251 Y132.787 E.89137
G1 X50.251 Y133.321 E.0164
G1 X29.749 Y153.822 E.89137
G1 X29.749 Y154.355 E.0164
G1 X50.251 Y133.854 E.89137
G1 X50.251 Y134.388 E.0164
G1 X29.749 Y154.889 E.89137
G1 X29.749 Y155.422 E.0164
G1 X50.251 Y134.921 E.89137
G1 X50.251 Y135.455 E.0164
G1 X29.749 Y155.956 E.89137
G1 X29.749 Y156.49 E.0164
G1 X50.251 Y135.989 E.89137
G1 X50.251 Y136.522 E.0164
G1 X29.749 Y157.023 E.89137
G1 X29.749 Y157.557 E.0164
G1 X50.251 Y137.056 E.89137
G1 X50.251 Y137.589 E.0164
G1 X29.749 Y158.09 E.89137
G1 X29.749 Y158.624 E.0164
G1 X50.251 Y138.123 E.89137
G1 X50.251 Y138.656 E.0164
G1 X29.749 Y159.157 E.89137
G1 X29.749 Y159.691 E.0164
G1 X50.251 Y139.19 E.89137
G1 X50.251 Y139.724 E.0164
G1 X29.749 Y160.225 E.89137
G1 X29.749 Y160.758 E.0164
G1 X50.251 Y140.257 E.89137
G1 X50.251 Y140.791 E.0164
G1 X29.749 Y161.292 E.89137
G1 X29.749 Y161.825 E.0164
G1 X50.251 Y141.324 E.89137
G1 X50.251 Y141.858 E.0164
G1 X29.749 Y162.359 E.89137
G1 X29.749 Y162.892 E.0164
G1 X50.251 Y142.391 E.89137
G1 X50.251 Y142.925 E.0164
G1 X29.749 Y163.426 E.89137
G1 X29.749 Y163.96 E.0164
G1 X50.251 Y143.458 E.89137
G1 X50.251 Y143.992 E.0164
G1 X29.749 Y164.493 E.89137
G1 X29.749 Y165.027 E.0164
G1 X50.251 Y144.526 E.89137
G1 X50.251 Y145.059 E.0164
G1 X29.749 Y165.56 E.89137
G1 X29.749 Y166.094 E.0164
G1 X50.251 Y145.593 E.89137
G1 X50.251 Y146.126 E.0164
G1 X29.749 Y166.627 E.89137
G1 X29.749 Y167.161 E.0164
G1 X50.251 Y146.66 E.89137
G1 X50.251 Y147.193 E.0164
G1 X29.749 Y167.695 E.89137
G1 X29.749 Y168.228 E.0164
G1 X50.251 Y147.727 E.89137
G1 X50.251 Y148.261 E.0164
G1 X29.749 Y168.762 E.89137
G1 X29.749 Y169.295 E.0164
G1 X50.251 Y148.794 E.89137
G1 X50.251 Y149.328 E.0164
G1 X29.749 Y169.829 E.89137
G1 X29.749 Y170.362 E.0164
G1 X50.251 Y149.861 E.89137
G1 X50.251 Y150.395 E.0164
G1 X29.749 Y170.896 E.89137
G1 X29.749 Y171.43 E.0164
G1 X50.251 Y150.928 E.89137
G1 X50.251 Y151.462 E.0164
G1 X29.749 Y171.963 E.89137
G1 X29.749 Y172.497 E.0164
G1 X50.251 Y151.996 E.89137
G1 X50.251 Y152.529 E.0164
G1 X29.749 Y173.03 E.89137
G1 X29.749 Y173.564 E.0164
G1 X50.251 Y153.063 E.89137
G1 X50.251 Y153.596 E.0164
G1 X29.749 Y174.097 E.89137
G1 X29.749 Y174.631 E.0164
G1 X50.251 Y154.13 E.89137
G1 X50.251 Y154.663 E.0164
G1 X29.749 Y175.164 E.89137
G1 X29.749 Y175.698 E.0164
G1 X50.251 Y155.197 E.89137
G1 X50.251 Y155.731 E.0164
G1 X29.749 Y176.232 E.89137
G1 X29.749 Y176.765 E.0164
G1 X50.251 Y156.264 E.89137
G1 X50.251 Y156.798 E.0164
G1 X29.749 Y177.299 E.89137
G1 X29.749 Y177.832 E.0164
G1 X50.251 Y157.331 E.89137
G1 X50.251 Y157.865 E.0164
G1 X29.749 Y178.366 E.89137
G1 X29.749 Y178.899 E.0164
G1 X50.251 Y158.398 E.89137
G1 X50.251 Y158.932 E.0164
G1 X29.749 Y179.433 E.89137
G1 X29.749 Y179.967 E.0164
G1 X50.251 Y159.466 E.89137
G1 X50.251 Y159.999 E.0164
G1 X29.749 Y180.5 E.89137
G1 X29.749 Y181.034 E.0164
G1 X50.251 Y160.533 E.89137
G1 X50.251 Y161.066 E.0164
G1 X29.749 Y181.567 E.89137
G1 X29.749 Y182.101 E.0164
G1 X50.251 Y161.6 E.89137
G1 X50.251 Y162.133 E.0164
G1 X29.749 Y182.634 E.89137
G1 X29.749 Y183.168 E.0164
G1 X50.251 Y162.667 E.89137
G1 X50.251 Y163.201 E.0164
G1 X29.749 Y183.702 E.89137
G1 X29.749 Y184.235 E.0164
G1 X50.251 Y163.734 E.89137
G1 X50.251 Y164.268 E.0164
G1 X29.749 Y184.769 E.89137
G1 X29.749 Y185.302 E.0164
G1 X50.251 Y164.801 E.89137
G1 X50.251 Y165.335 E.0164
G1 X29.749 Y185.836 E.89137
G1 X29.749 Y186.369 E.0164
G1 X50.251 Y165.868 E.89137
G1 X50.251 Y166.402 E.0164
G1 X29.749 Y186.903 E.89137
G1 X29.749 Y187.437 E.0164
G1 X50.251 Y166.935 E.89137
G1 X50.251 Y167.469 E.0164
G1 X29.749 Y187.97 E.89137
G1 X29.749 Y188.504 E.0164
G1 X50.251 Y168.003 E.89137
G1 X50.251 Y168.536 E.0164
G1 X29.749 Y189.037 E.89137
G1 X29.749 Y189.571 E.0164
G1 X50.251 Y169.07 E.89137
G1 X50.251 Y169.603 E.0164
G1 X29.749 Y190.104 E.89137
G1 X29.749 Y190.638 E.0164
G1 X50.251 Y170.137 E.89137
G1 X50.251 Y170.67 E.0164
G1 X29.749 Y191.172 E.89137
G1 X29.749 Y191.705 E.0164
G1 X50.251 Y171.204 E.89137
G1 X50.251 Y171.738 E.0164
G1 X29.749 Y192.239 E.89137
G1 X29.749 Y192.772 E.0164
G1 X50.251 Y172.271 E.89137
G1 X50.251 Y172.805 E.0164
G1 X29.749 Y193.306 E.89137
G1 X29.749 Y193.839 E.0164
G1 X50.251 Y173.338 E.89137
G1 X50.251 Y173.872 E.0164
G1 X29.749 Y194.373 E.89137
G1 X29.749 Y194.907 E.0164
G1 X50.251 Y174.405 E.89137
G1 X50.251 Y174.939 E.0164
G1 X29.749 Y195.44 E.89137
G1 X29.749 Y195.974 E.0164
G1 X50.251 Y175.473 E.89137
G1 X50.251 Y176.006 E.0164
G1 X29.749 Y196.507 E.89137
G1 X29.749 Y197.041 E.0164
G1 X50.251 Y176.54 E.89137
G1 X50.251 Y177.073 E.0164
G1 X29.749 Y197.574 E.89137
G1 X29.749 Y198.108 E.0164
G1 X50.251 Y177.607 E.89137
G1 X50.251 Y178.14 E.0164
G1 X29.749 Y198.642 E.89137
G1 X29.749 Y199.175 E.0164
G1 X50.251 Y178.674 E.89137
G1 X50.251 Y179.208 E.0164
G1 X29.749 Y199.709 E.89137
G1 X29.749 Y200.242 E.0164
G1 X50.251 Y179.741 E.89137
G1 X50.251 Y180.275 E.0164
G1 X29.749 Y200.776 E.89137
G1 X29.749 Y201.309 E.0164
G1 X50.251 Y180.808 E.89137
G1 X50.251 Y181.342 E.0164
G1 X29.749 Y201.843 E.89137
G1 X29.749 Y202.376 E.0164
G1 X50.251 Y181.875 E.89137
G1 X50.251 Y182.409 E.0164
G1 X29.749 Y202.91 E.89137
G1 X29.749 Y203.444 E.0164
G1 X50.251 Y182.943 E.89137
G1 X50.251 Y183.476 E.0164
G1 X29.749 Y203.977 E.89137
G1 X29.749 Y204.511 E.0164
G1 X50.251 Y184.01 E.89137
G1 X50.251 Y184.543 E.0164
G1 X29.749 Y205.044 E.89137
G1 X29.749 Y205.578 E.0164
G1 X50.251 Y185.077 E.89137
G1 X50.251 Y185.61 E.0164
G1 X29.749 Y206.111 E.89137
G1 X29.749 Y206.645 E.0164
G1 X50.251 Y186.144 E.89137
G1 X50.251 Y186.678 E.0164
G1 X29.749 Y207.179 E.89137
G1 X29.749 Y207.712 E.0164
G1 X50.251 Y187.211 E.89137
G1 X50.251 Y187.745 E.0164
G1 X29.749 Y208.246 E.89137
G1 X29.749 Y208.779 E.0164
G1 X50.251 Y188.278 E.89137
G1 X50.251 Y188.812 E.0164
G1 X29.749 Y209.313 E.89137
G1 X29.749 Y209.846 E.0164
G1 X50.251 Y189.345 E.89137
G1 X50.251 Y189.879 E.0164
G1 X29.749 Y210.38 E.89137
G1 X29.749 Y210.914 E.0164
G1 X50.251 Y190.413 E.89137
G1 X50.251 Y190.946 E.0164
G1 X29.749 Y211.447 E.89137
G1 X29.749 Y211.981 E.0164
G1 X50.251 Y191.48 E.89137
G1 X50.251 Y192.013 E.0164
G1 X29.58 Y212.684 E.89875
; WIPE_START
G1 X30.994 Y211.27 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X37.606 Y207.456 Z2.8 F30000
G1 X54.947 Y197.455 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F15000
G1 X43.345 Y209.057 E.50445
G2 X43.515 Y208.353 I-3.386 J-1.193 E.02231
G1 X54.244 Y197.624 E.46645
G1 X53.71 Y197.624 E.0164
G1 X43.547 Y207.787 E.44186
G2 X43.501 Y207.3 I-2.462 J-.01 E.01506
G1 X53.176 Y197.624 E.42069
G1 X52.643 Y197.624 E.0164
G1 X43.403 Y206.864 E.40174
G2 X43.262 Y206.472 I-6.643 J2.175 E.01282
G1 X52.109 Y197.624 E.38469
G1 X51.576 Y197.624 E.0164
G1 X43.083 Y206.117 E.36926
G2 X42.873 Y205.793 I-1.725 J.887 E.01188
G1 X51.042 Y197.624 E.35518
G1 X50.509 Y197.624 E.0164
G1 X42.634 Y205.499 E.34237
G2 X42.367 Y205.233 I-1.46 J1.2 E.01162
G1 X50.251 Y197.349 E.34278
G1 X50.251 Y196.815 E.0164
G1 X42.071 Y204.995 E.35564
G2 X41.746 Y204.787 I-1.202 J1.52 E.0119
G1 X50.251 Y196.282 E.36979
G1 X50.251 Y195.748 E.0164
G1 X41.389 Y204.61 E.3853
G2 X40.997 Y204.468 I-.905 J1.885 E.01283
G1 X50.251 Y195.215 E.40233
G1 X50.251 Y194.681 E.0164
G1 X40.561 Y204.37 E.42128
G2 X40.065 Y204.333 I-.396 J1.945 E.01534
G1 X50.251 Y194.147 E.44285
G1 X50.251 Y193.614 E.0164
G1 X39.504 Y204.361 E.46725
G2 X38.793 Y204.538 I.584 J3.851 E.02257
G1 X50.251 Y193.08 E.49818
G1 X50.251 Y192.547 E.0164
G1 X29.749 Y213.048 E.89137
G1 X29.749 Y213.581 E.0164
G1 X36.659 Y206.672 E.30042
G2 X36.485 Y207.38 I4.229 J1.417 E.02244
G1 X29.749 Y214.115 E.29284
G1 X29.749 Y214.649 E.0164
G1 X36.453 Y207.945 E.29145
G2 X36.495 Y208.437 I4.626 J-.146 E.01518
G1 X29.749 Y215.182 E.29327
G1 X29.749 Y215.716 E.0164
G1 X36.595 Y208.87 E.29763
G2 X36.736 Y209.263 I2.039 J-.509 E.01285
G1 X29.749 Y216.249 E.30375
G1 X29.749 Y216.783 E.0164
G1 X36.912 Y209.621 E.3114
G2 X37.119 Y209.947 I1.734 J-.876 E.0119
G1 X29.749 Y217.316 E.32043
G1 X29.749 Y217.85 E.0164
G1 X37.356 Y210.243 E.33074
G2 X37.622 Y210.511 I1.47 J-1.193 E.01162
G1 X30.007 Y218.126 E.33108
G1 X30.541 Y218.126 E.0164
G1 X37.916 Y210.75 E.32067
G2 X38.241 Y210.959 I6.411 J-9.599 E.01187
G1 X31.075 Y218.126 E.31158
G1 X31.608 Y218.126 E.0164
G1 X38.598 Y211.136 E.30392
G2 X38.991 Y211.276 I.9 J-1.896 E.01285
G1 X32.142 Y218.126 E.29781
G1 X32.675 Y218.126 E.0164
G1 X39.425 Y211.376 E.29348
G2 X39.909 Y211.425 I.491 J-2.396 E.01498
G1 X33.209 Y218.126 E.29132
G1 X33.742 Y218.126 E.0164
G1 X40.478 Y211.39 E.29285
G2 X41.181 Y211.22 I-.49 J-3.568 E.02229
G1 X34.276 Y218.126 E.30024
G1 X34.81 Y218.126 E.0164
G1 X55.311 Y197.624 E.89137
G1 X55.844 Y197.624 E.0164
G1 X35.343 Y218.126 E.89137
G1 X35.877 Y218.126 E.0164
G1 X56.378 Y197.624 E.89137
G1 X56.911 Y197.624 E.0164
G1 X36.41 Y218.126 E.89137
G1 X36.944 Y218.126 E.0164
G1 X57.445 Y197.624 E.89137
G1 X57.979 Y197.624 E.0164
G1 X37.477 Y218.126 E.89137
G1 X38.011 Y218.126 E.0164
G1 X58.512 Y197.624 E.89137
G1 X59.046 Y197.624 E.0164
G1 X38.545 Y218.126 E.89137
G1 X39.078 Y218.126 E.0164
G1 X59.579 Y197.624 E.89137
G1 X60.113 Y197.624 E.0164
G1 X39.612 Y218.126 E.89137
G1 X40.145 Y218.126 E.0164
G1 X60.646 Y197.624 E.89137
G1 X61.18 Y197.624 E.0164
G1 X40.679 Y218.126 E.89137
G1 X41.212 Y218.126 E.0164
G1 X61.713 Y197.624 E.89137
G1 X62.247 Y197.624 E.0164
G1 X41.746 Y218.126 E.89137
G1 X42.28 Y218.126 E.0164
G1 X62.781 Y197.624 E.89137
G1 X63.314 Y197.624 E.0164
G1 X42.813 Y218.126 E.89137
G1 X43.347 Y218.126 E.0164
G1 X63.848 Y197.624 E.89137
G1 X64.381 Y197.624 E.0164
G1 X43.88 Y218.126 E.89137
G1 X44.414 Y218.126 E.0164
G1 X64.915 Y197.624 E.89137
G1 X65.448 Y197.624 E.0164
G1 X44.947 Y218.126 E.89137
G1 X45.481 Y218.126 E.0164
G1 X65.982 Y197.624 E.89137
G1 X66.516 Y197.624 E.0164
G1 X46.015 Y218.126 E.89137
G1 X46.548 Y218.126 E.0164
G1 X67.049 Y197.624 E.89137
G1 X67.583 Y197.624 E.0164
G1 X47.082 Y218.126 E.89137
G1 X47.615 Y218.126 E.0164
G1 X68.116 Y197.624 E.89137
G1 X68.65 Y197.624 E.0164
G1 X48.149 Y218.126 E.89137
G1 X48.682 Y218.126 E.0164
G1 X69.183 Y197.624 E.89137
G1 X69.717 Y197.624 E.0164
G1 X49.216 Y218.126 E.89137
G1 X49.75 Y218.126 E.0164
G1 X70.251 Y197.624 E.89137
G1 X70.784 Y197.624 E.0164
G1 X50.283 Y218.126 E.89137
G1 X50.817 Y218.126 E.0164
G1 X71.318 Y197.624 E.89137
G1 X71.851 Y197.624 E.0164
G1 X51.35 Y218.126 E.89137
G1 X51.884 Y218.126 E.0164
G1 X72.385 Y197.624 E.89137
G1 X72.918 Y197.624 E.0164
G1 X52.417 Y218.126 E.89137
G1 X52.951 Y218.126 E.0164
G1 X73.452 Y197.624 E.89137
G1 X73.986 Y197.624 E.0164
G1 X53.484 Y218.126 E.89137
G1 X54.018 Y218.126 E.0164
G1 X74.519 Y197.624 E.89137
G1 X75.053 Y197.624 E.0164
G1 X54.552 Y218.126 E.89137
G1 X55.085 Y218.126 E.0164
G1 X75.586 Y197.624 E.89137
G1 X76.12 Y197.624 E.0164
G1 X55.619 Y218.126 E.89137
G1 X56.152 Y218.126 E.0164
G1 X76.653 Y197.624 E.89137
G1 X77.187 Y197.624 E.0164
G1 X56.686 Y218.126 E.89137
G1 X57.219 Y218.126 E.0164
G1 X77.721 Y197.624 E.89137
G1 X78.254 Y197.624 E.0164
G1 X57.753 Y218.126 E.89137
G1 X58.287 Y218.126 E.0164
G1 X78.788 Y197.624 E.89137
G1 X79.321 Y197.624 E.0164
G1 X58.82 Y218.126 E.89137
G1 X59.354 Y218.126 E.0164
G1 X79.855 Y197.624 E.89137
G1 X80.388 Y197.624 E.0164
G1 X59.887 Y218.126 E.89137
G1 X60.421 Y218.126 E.0164
G1 X80.922 Y197.624 E.89137
G1 X81.456 Y197.624 E.0164
G1 X60.954 Y218.126 E.89137
G1 X61.488 Y218.126 E.0164
G1 X81.989 Y197.624 E.89137
G1 X82.523 Y197.624 E.0164
G1 X62.022 Y218.126 E.89137
G1 X62.555 Y218.126 E.0164
G1 X83.056 Y197.624 E.89137
G1 X83.59 Y197.624 E.0164
G1 X63.089 Y218.126 E.89137
G1 X63.622 Y218.126 E.0164
G1 X84.123 Y197.624 E.89137
G1 X84.657 Y197.624 E.0164
G1 X64.156 Y218.126 E.89137
G1 X64.689 Y218.126 E.0164
G1 X85.191 Y197.624 E.89137
G1 X85.724 Y197.624 E.0164
G1 X65.223 Y218.126 E.89137
G1 X65.757 Y218.126 E.0164
G1 X86.258 Y197.624 E.89137
G1 X86.791 Y197.624 E.0164
G1 X66.29 Y218.126 E.89137
G1 X66.824 Y218.126 E.0164
G1 X87.325 Y197.624 E.89137
G1 X87.858 Y197.624 E.0164
G1 X67.357 Y218.126 E.89137
G1 X67.891 Y218.126 E.0164
G1 X88.392 Y197.624 E.89137
G1 X88.925 Y197.624 E.0164
G1 X68.424 Y218.126 E.89137
G1 X68.958 Y218.126 E.0164
G1 X89.459 Y197.624 E.89137
G1 X89.993 Y197.624 E.0164
G1 X69.492 Y218.126 E.89137
G1 X70.025 Y218.126 E.0164
G1 X90.526 Y197.624 E.89137
G1 X91.06 Y197.624 E.0164
G1 X70.559 Y218.126 E.89137
G1 X71.092 Y218.126 E.0164
G1 X91.593 Y197.624 E.89137
G1 X92.127 Y197.624 E.0164
G1 X71.626 Y218.126 E.89137
G1 X72.159 Y218.126 E.0164
G1 X92.66 Y197.624 E.89137
G1 X93.194 Y197.624 E.0164
G1 X72.693 Y218.126 E.89137
G1 X73.227 Y218.126 E.0164
G1 X93.728 Y197.624 E.89137
G1 X94.261 Y197.624 E.0164
G1 X73.76 Y218.126 E.89137
G1 X74.294 Y218.126 E.0164
G1 X94.795 Y197.624 E.89137
G1 X95.328 Y197.624 E.0164
G1 X74.827 Y218.126 E.89137
G1 X75.361 Y218.126 E.0164
G1 X95.862 Y197.624 E.89137
G1 X96.395 Y197.624 E.0164
G1 X75.894 Y218.126 E.89137
G1 X76.428 Y218.126 E.0164
G1 X96.929 Y197.624 E.89137
G1 X97.463 Y197.624 E.0164
G1 X76.962 Y218.126 E.89137
G1 X77.495 Y218.126 E.0164
G1 X97.996 Y197.624 E.89137
G1 X98.53 Y197.624 E.0164
G1 X78.029 Y218.126 E.89137
G1 X78.562 Y218.126 E.0164
G1 X99.063 Y197.624 E.89137
G1 X99.597 Y197.624 E.0164
G1 X79.096 Y218.126 E.89137
G1 X79.629 Y218.126 E.0164
G1 X100.13 Y197.624 E.89137
G1 X100.664 Y197.624 E.0164
G1 X80.163 Y218.126 E.89137
G1 X80.696 Y218.126 E.0164
G1 X101.198 Y197.624 E.89137
G1 X101.731 Y197.624 E.0164
G1 X81.23 Y218.126 E.89137
G1 X81.764 Y218.126 E.0164
G1 X102.265 Y197.624 E.89137
G1 X102.798 Y197.624 E.0164
G1 X82.297 Y218.126 E.89137
G1 X82.831 Y218.126 E.0164
G1 X103.332 Y197.624 E.89137
G1 X103.865 Y197.624 E.0164
G1 X83.364 Y218.126 E.89137
G1 X83.898 Y218.126 E.0164
G1 X104.399 Y197.624 E.89137
G1 X104.933 Y197.624 E.0164
G1 X84.431 Y218.126 E.89137
G1 X84.965 Y218.126 E.0164
G1 X105.466 Y197.624 E.89137
G1 X106 Y197.624 E.0164
G1 X85.499 Y218.126 E.89137
G1 X86.032 Y218.126 E.0164
G1 X106.533 Y197.624 E.89137
G1 X107.067 Y197.624 E.0164
G1 X86.566 Y218.126 E.89137
G1 X87.099 Y218.126 E.0164
G1 X107.6 Y197.624 E.89137
G1 X108.134 Y197.624 E.0164
G1 X87.633 Y218.126 E.89137
G1 X88.166 Y218.126 E.0164
G1 X108.668 Y197.624 E.89137
G1 X109.201 Y197.624 E.0164
G1 X88.7 Y218.126 E.89137
G1 X89.234 Y218.126 E.0164
G1 X109.735 Y197.624 E.89137
G1 X110.268 Y197.624 E.0164
G1 X89.767 Y218.126 E.89137
G1 X90.301 Y218.126 E.0164
G1 X110.802 Y197.624 E.89137
G1 X111.335 Y197.624 E.0164
G1 X90.834 Y218.126 E.89137
G1 X91.368 Y218.126 E.0164
G1 X111.869 Y197.624 E.89137
G1 X112.403 Y197.624 E.0164
G1 X91.901 Y218.126 E.89137
G1 X92.435 Y218.126 E.0164
G1 X112.936 Y197.624 E.89137
G1 X113.47 Y197.624 E.0164
G1 X92.969 Y218.126 E.89137
G1 X93.502 Y218.126 E.0164
G1 X114.003 Y197.624 E.89137
G1 X114.537 Y197.624 E.0164
G1 X94.036 Y218.126 E.89137
G1 X94.569 Y218.126 E.0164
G1 X115.07 Y197.624 E.89137
G1 X115.604 Y197.624 E.0164
G1 X95.103 Y218.126 E.89137
G1 X95.636 Y218.126 E.0164
G1 X116.138 Y197.624 E.89137
M73 P77 R15
G1 X116.671 Y197.624 E.0164
G1 X96.17 Y218.126 E.89137
G1 X96.704 Y218.126 E.0164
G1 X117.205 Y197.624 E.89137
G1 X117.738 Y197.624 E.0164
G1 X97.237 Y218.126 E.89137
G1 X97.771 Y218.126 E.0164
G1 X118.272 Y197.624 E.89137
G1 X118.805 Y197.624 E.0164
G1 X98.304 Y218.126 E.89137
G1 X98.838 Y218.126 E.0164
G1 X119.339 Y197.624 E.89137
G1 X119.872 Y197.624 E.0164
G1 X99.371 Y218.126 E.89137
G1 X99.905 Y218.126 E.0164
G1 X120.406 Y197.624 E.89137
G1 X120.94 Y197.624 E.0164
G1 X100.439 Y218.126 E.89137
G1 X100.972 Y218.126 E.0164
G1 X121.473 Y197.624 E.89137
G1 X122.007 Y197.624 E.0164
G1 X101.506 Y218.126 E.89137
G1 X102.039 Y218.126 E.0164
G1 X122.54 Y197.624 E.89137
G1 X123.074 Y197.624 E.0164
G1 X102.573 Y218.126 E.89137
G1 X103.106 Y218.126 E.0164
G1 X123.607 Y197.624 E.89137
G1 X124.141 Y197.624 E.0164
G1 X103.64 Y218.126 E.89137
G1 X104.174 Y218.126 E.0164
G1 X124.675 Y197.624 E.89137
G1 X125.208 Y197.624 E.0164
G1 X104.707 Y218.126 E.89137
G1 X105.241 Y218.126 E.0164
G1 X125.742 Y197.624 E.89137
G1 X126.275 Y197.624 E.0164
G1 X105.774 Y218.126 E.89137
G1 X106.308 Y218.126 E.0164
G1 X126.809 Y197.624 E.89137
G1 X127.342 Y197.624 E.0164
G1 X106.841 Y218.126 E.89137
G1 X107.375 Y218.126 E.0164
G1 X127.876 Y197.624 E.89137
G1 X128.41 Y197.624 E.0164
G1 X107.909 Y218.126 E.89137
G1 X108.442 Y218.126 E.0164
G1 X128.943 Y197.624 E.89137
G1 X129.477 Y197.624 E.0164
G1 X108.976 Y218.126 E.89137
G1 X109.509 Y218.126 E.0164
G1 X130.01 Y197.624 E.89137
G1 X130.544 Y197.624 E.0164
G1 X110.043 Y218.126 E.89137
G1 X110.576 Y218.126 E.0164
G1 X131.077 Y197.624 E.89137
G1 X131.611 Y197.624 E.0164
G1 X111.11 Y218.126 E.89137
G1 X111.643 Y218.126 E.0164
G1 X132.145 Y197.624 E.89137
G1 X132.678 Y197.624 E.0164
G1 X112.007 Y218.295 E.89875
G1 X122.145 Y218.295 F30000
G1 F15000
G1 X129.24 Y211.2 E.30847
G3 X128.522 Y211.385 I-1.303 J-3.591 E.02281
G1 X121.781 Y218.126 E.29309
G1 X121.248 Y218.126 E.0164
G1 X127.949 Y211.425 E.29135
G3 X127.458 Y211.381 I.158 J-4.589 E.01514
G1 X120.714 Y218.126 E.29323
G1 X120.181 Y218.126 E.0164
G1 X127.021 Y211.285 E.29744
G3 X126.626 Y211.146 I.493 J-2.046 E.0129
G1 X119.647 Y218.126 E.30344
G1 X119.113 Y218.126 E.0164
G1 X126.266 Y210.973 E.31101
G3 X125.939 Y210.767 I.866 J-1.741 E.01192
G1 X118.58 Y218.126 E.31996
G1 X118.046 Y218.126 E.0164
G1 X125.642 Y210.53 E.33025
G3 X125.374 Y210.264 I1.196 J-1.472 E.01162
G1 X117.513 Y218.126 E.34181
G1 X116.979 Y218.126 E.0164
G1 X125.135 Y209.97 E.35461
G3 X124.925 Y209.646 I1.511 J-1.208 E.01188
G1 X116.446 Y218.126 E.36869
G1 X115.912 Y218.126 E.0164
G1 X124.747 Y209.29 E.38414
G3 X124.604 Y208.9 I1.884 J-.912 E.01281
G1 X115.378 Y218.126 E.40112
G1 X114.845 Y218.126 E.0164
G1 X124.501 Y208.469 E.41985
G3 X124.453 Y207.984 I4.401 J-.684 E.015
G1 X114.311 Y218.126 E.44094
G1 X113.778 Y218.126 E.0164
G1 X124.48 Y207.423 E.46534
G3 X124.642 Y206.728 I3.861 J.53 E.02196
G1 X113.244 Y218.126 E.49555
G1 X112.711 Y218.126 E.0164
G1 X133.212 Y197.624 E.89137
G1 X133.745 Y197.624 E.0164
G1 X126.857 Y204.513 E.29951
G3 X127.551 Y204.352 I1.447 J4.668 E.02193
G1 X134.279 Y197.624 E.29252
G1 X134.812 Y197.624 E.0164
G1 X128.104 Y204.333 E.29168
G3 X128.596 Y204.375 I.081 J1.968 E.01522
G1 X135.346 Y197.624 E.29349
G1 X135.88 Y197.624 E.0164
G1 X129.026 Y204.478 E.29797
G3 X129.416 Y204.622 I-.527 J2.018 E.01278
G1 X136.413 Y197.624 E.30425
G1 X136.947 Y197.624 E.0164
G1 X129.77 Y204.801 E.31203
G3 X130.093 Y205.011 I-.89 J1.722 E.01188
G1 X137.48 Y197.624 E.32117
G1 X138.014 Y197.624 E.0164
G1 X130.387 Y205.251 E.33159
G3 X130.653 Y205.519 I-1.203 J1.457 E.01162
G1 X138.547 Y197.624 E.34325
G1 X139.081 Y197.624 E.0164
G1 X130.89 Y205.815 E.35614
G3 X131.098 Y206.141 I-1.527 J1.203 E.0119
G1 X139.615 Y197.624 E.3703
G1 X140.148 Y197.624 E.0164
G1 X131.274 Y206.499 E.38584
G3 X131.411 Y206.895 I-1.917 J.884 E.01292
G1 X140.682 Y197.624 E.40308
G1 X141.215 Y197.624 E.0164
G1 X131.506 Y207.334 E.42216
G3 X131.549 Y207.824 I-2.432 J.462 E.01516
G1 X141.749 Y197.624 E.44347
G1 X142.282 Y197.624 E.0164
G1 X131.508 Y208.398 E.46844
G3 X131.323 Y209.118 I-3.52 J-.526 E.02289
G1 X142.816 Y197.624 E.49972
G1 X143.35 Y197.624 E.0164
G1 X122.848 Y218.126 E.89137
G1 X123.382 Y218.126 E.0164
G1 X143.883 Y197.624 E.89137
G1 X144.417 Y197.624 E.0164
G1 X123.916 Y218.126 E.89137
G1 X124.449 Y218.126 E.0164
G1 X144.95 Y197.624 E.89137
G1 X145.484 Y197.624 E.0164
G1 X124.983 Y218.126 E.89137
G1 X125.516 Y218.126 E.0164
G1 X146.017 Y197.624 E.89137
G1 X146.551 Y197.624 E.0164
G1 X126.05 Y218.126 E.89137
G1 X126.583 Y218.126 E.0164
G1 X147.084 Y197.624 E.89137
G1 X147.618 Y197.624 E.0164
G1 X127.117 Y218.126 E.89137
M73 P77 R14
G1 X127.651 Y218.126 E.0164
G1 X148.152 Y197.624 E.89137
G1 X148.685 Y197.624 E.0164
G1 X128.184 Y218.126 E.89137
G1 X128.718 Y218.126 E.0164
G1 X149.219 Y197.624 E.89137
G1 X149.752 Y197.624 E.0164
G1 X129.251 Y218.126 E.89137
G1 X129.785 Y218.126 E.0164
G1 X150.286 Y197.624 E.89137
G1 X150.819 Y197.624 E.0164
G1 X130.318 Y218.126 E.89137
G1 X130.852 Y218.126 E.0164
G1 X151.353 Y197.624 E.89137
G1 X151.887 Y197.624 E.0164
G1 X131.386 Y218.126 E.89137
G1 X131.919 Y218.126 E.0164
G1 X152.42 Y197.624 E.89137
G1 X152.954 Y197.624 E.0164
G1 X132.453 Y218.126 E.89137
G1 X132.986 Y218.126 E.0164
G1 X153.487 Y197.624 E.89137
G1 X154.021 Y197.624 E.0164
G1 X133.52 Y218.126 E.89137
G1 X134.053 Y218.126 E.0164
G1 X154.554 Y197.624 E.89137
G1 X155.088 Y197.624 E.0164
G1 X134.587 Y218.126 E.89137
G1 X135.121 Y218.126 E.0164
G1 X155.622 Y197.624 E.89137
G1 X156.155 Y197.624 E.0164
G1 X135.654 Y218.126 E.89137
G1 X136.188 Y218.126 E.0164
G1 X156.689 Y197.624 E.89137
G1 X157.222 Y197.624 E.0164
G1 X136.721 Y218.126 E.89137
G1 X137.255 Y218.126 E.0164
G1 X157.756 Y197.624 E.89137
G1 X158.289 Y197.624 E.0164
G1 X137.788 Y218.126 E.89137
G1 X138.322 Y218.126 E.0164
G1 X158.823 Y197.624 E.89137
G1 X159.357 Y197.624 E.0164
G1 X138.855 Y218.126 E.89137
G1 X139.389 Y218.126 E.0164
G1 X159.89 Y197.624 E.89137
G1 X160.424 Y197.624 E.0164
G1 X139.923 Y218.126 E.89137
G1 X140.456 Y218.126 E.0164
G1 X160.957 Y197.624 E.89137
G1 X161.491 Y197.624 E.0164
G1 X140.99 Y218.126 E.89137
G1 X141.523 Y218.126 E.0164
G1 X162.024 Y197.624 E.89137
G1 X162.558 Y197.624 E.0164
G1 X142.057 Y218.126 E.89137
G1 X142.59 Y218.126 E.0164
G1 X163.092 Y197.624 E.89137
G1 X163.625 Y197.624 E.0164
G1 X143.124 Y218.126 E.89137
G1 X143.658 Y218.126 E.0164
G1 X164.159 Y197.624 E.89137
G1 X164.692 Y197.624 E.0164
G1 X144.191 Y218.126 E.89137
G1 X144.725 Y218.126 E.0164
G1 X165.226 Y197.624 E.89137
G1 X165.759 Y197.624 E.0164
G1 X145.258 Y218.126 E.89137
G1 X145.792 Y218.126 E.0164
G1 X166.293 Y197.624 E.89137
G1 X166.827 Y197.624 E.0164
G1 X146.325 Y218.126 E.89137
G1 X146.859 Y218.126 E.0164
G1 X167.36 Y197.624 E.89137
G1 X167.894 Y197.624 E.0164
G1 X147.393 Y218.126 E.89137
G1 X147.926 Y218.126 E.0164
G1 X168.427 Y197.624 E.89137
G1 X168.961 Y197.624 E.0164
G1 X148.46 Y218.126 E.89137
G1 X148.993 Y218.126 E.0164
G1 X169.494 Y197.624 E.89137
G1 X170.028 Y197.624 E.0164
G1 X149.527 Y218.126 E.89137
G1 X150.06 Y218.126 E.0164
G1 X170.562 Y197.624 E.89137
G1 X171.095 Y197.624 E.0164
G1 X150.594 Y218.126 E.89137
G1 X151.128 Y218.126 E.0164
G1 X171.629 Y197.624 E.89137
G1 X172.162 Y197.624 E.0164
G1 X151.661 Y218.126 E.89137
G1 X152.195 Y218.126 E.0164
G1 X172.696 Y197.624 E.89137
G1 X173.229 Y197.624 E.0164
G1 X152.728 Y218.126 E.89137
G1 X153.262 Y218.126 E.0164
G1 X173.763 Y197.624 E.89137
G1 X174.296 Y197.624 E.0164
G1 X153.795 Y218.126 E.89137
G1 X154.329 Y218.126 E.0164
G1 X174.83 Y197.624 E.89137
G1 X175.364 Y197.624 E.0164
G1 X154.863 Y218.126 E.89137
G1 X155.396 Y218.126 E.0164
G1 X175.897 Y197.624 E.89137
G1 X176.431 Y197.624 E.0164
G1 X155.93 Y218.126 E.89137
G1 X156.463 Y218.126 E.0164
G1 X176.964 Y197.624 E.89137
G1 X177.498 Y197.624 E.0164
G1 X156.997 Y218.126 E.89137
G1 X157.53 Y218.126 E.0164
G1 X178.031 Y197.624 E.89137
G1 X178.565 Y197.624 E.0164
G1 X158.064 Y218.126 E.89137
G1 X158.598 Y218.126 E.0164
G1 X179.099 Y197.624 E.89137
G1 X179.632 Y197.624 E.0164
G1 X159.131 Y218.126 E.89137
G1 X159.665 Y218.126 E.0164
G1 X180.166 Y197.624 E.89137
G1 X180.699 Y197.624 E.0164
G1 X160.198 Y218.126 E.89137
G1 X160.732 Y218.126 E.0164
G1 X181.233 Y197.624 E.89137
G1 X181.766 Y197.624 E.0164
G1 X161.265 Y218.126 E.89137
G1 X161.799 Y218.126 E.0164
G1 X182.3 Y197.624 E.89137
G1 X182.834 Y197.624 E.0164
G1 X162.333 Y218.126 E.89137
G1 X162.866 Y218.126 E.0164
G1 X183.367 Y197.624 E.89137
G1 X183.901 Y197.624 E.0164
G1 X163.4 Y218.126 E.89137
G1 X163.933 Y218.126 E.0164
G1 X184.434 Y197.624 E.89137
G1 X184.968 Y197.624 E.0164
G1 X164.467 Y218.126 E.89137
G1 X165 Y218.126 E.0164
G1 X185.501 Y197.624 E.89137
G1 X186.035 Y197.624 E.0164
G1 X165.534 Y218.126 E.89137
G1 X166.067 Y218.126 E.0164
G1 X186.569 Y197.624 E.89137
G1 X187.102 Y197.624 E.0164
G1 X166.601 Y218.126 E.89137
G1 X167.135 Y218.126 E.0164
G1 X187.636 Y197.624 E.89137
G1 X188.169 Y197.624 E.0164
G1 X167.668 Y218.126 E.89137
G1 X168.202 Y218.126 E.0164
G1 X188.703 Y197.624 E.89137
G1 X189.236 Y197.624 E.0164
G1 X168.735 Y218.126 E.89137
G1 X169.269 Y218.126 E.0164
G1 X189.77 Y197.624 E.89137
G1 X190.304 Y197.624 E.0164
G1 X169.802 Y218.126 E.89137
G1 X170.336 Y218.126 E.0164
G1 X190.837 Y197.624 E.89137
G1 X191.371 Y197.624 E.0164
G1 X170.87 Y218.126 E.89137
G1 X171.403 Y218.126 E.0164
G1 X191.904 Y197.624 E.89137
G1 X192.438 Y197.624 E.0164
G1 X171.937 Y218.126 E.89137
G1 X172.47 Y218.126 E.0164
G1 X192.971 Y197.624 E.89137
G1 X193.505 Y197.624 E.0164
G1 X173.004 Y218.126 E.89137
G1 X173.537 Y218.126 E.0164
G1 X194.039 Y197.624 E.89137
G1 X194.572 Y197.624 E.0164
G1 X174.071 Y218.126 E.89137
G1 X174.605 Y218.126 E.0164
G1 X195.106 Y197.624 E.89137
G1 X195.639 Y197.624 E.0164
G1 X175.138 Y218.126 E.89137
G1 X175.672 Y218.126 E.0164
G1 X196.173 Y197.624 E.89137
G1 X196.706 Y197.624 E.0164
G1 X176.205 Y218.126 E.89137
G1 X176.739 Y218.126 E.0164
G1 X197.24 Y197.624 E.89137
G1 X197.774 Y197.624 E.0164
G1 X177.272 Y218.126 E.89137
G1 X177.806 Y218.126 E.0164
G1 X198.307 Y197.624 E.89137
G1 X198.841 Y197.624 E.0164
G1 X178.34 Y218.126 E.89137
G1 X178.873 Y218.126 E.0164
G1 X199.374 Y197.624 E.89137
G1 X199.908 Y197.624 E.0164
G1 X179.407 Y218.126 E.89137
G1 X179.94 Y218.126 E.0164
G1 X200.441 Y197.624 E.89137
G1 X200.975 Y197.624 E.0164
G1 X180.474 Y218.126 E.89137
G1 X181.007 Y218.126 E.0164
G1 X201.509 Y197.624 E.89137
G1 X202.042 Y197.624 E.0164
G1 X181.541 Y218.126 E.89137
G1 X182.075 Y218.126 E.0164
G1 X202.576 Y197.624 E.89137
G1 X203.109 Y197.624 E.0164
G1 X182.608 Y218.126 E.89137
G1 X183.142 Y218.126 E.0164
G1 X203.643 Y197.624 E.89137
G1 X204.176 Y197.624 E.0164
G1 X183.675 Y218.126 E.89137
G1 X184.209 Y218.126 E.0164
G1 X204.71 Y197.624 E.89137
G1 X205.243 Y197.624 E.0164
G1 X184.573 Y218.295 E.89875
; WIPE_START
G1 X185.987 Y216.881 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X180.333 Y211.753 Z2.8 F30000
G1 X29.58 Y75.023 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F15000
G1 X70.729 Y33.874 E1.78911
G1 X70.195 Y33.874 E.0164
G1 X29.749 Y74.32 E1.75854
G1 X29.749 Y73.786 E.0164
G1 X69.661 Y33.874 E1.73534
G1 X69.128 Y33.874 E.0164
G1 X29.749 Y73.253 E1.71214
G1 X29.749 Y72.719 E.0164
G1 X68.594 Y33.874 E1.68894
G1 X68.061 Y33.874 E.0164
G1 X29.749 Y72.186 E1.66574
G1 X29.749 Y71.652 E.0164
G1 X67.527 Y33.874 E1.64254
G1 X66.994 Y33.874 E.0164
G1 X29.749 Y71.119 E1.61934
G1 X29.749 Y70.585 E.0164
G1 X66.46 Y33.874 E1.59614
G1 X65.927 Y33.874 E.0164
G1 X29.749 Y70.051 E1.57294
G1 X29.749 Y69.518 E.0164
G1 X65.393 Y33.874 E1.54975
G1 X64.859 Y33.874 E.0164
G1 X29.749 Y68.984 E1.52655
G1 X29.749 Y68.451 E.0164
G1 X64.326 Y33.874 E1.50335
G1 X63.792 Y33.874 E.0164
G1 X29.749 Y67.917 E1.48015
G1 X29.749 Y67.384 E.0164
G1 X63.259 Y33.874 E1.45695
G1 X62.725 Y33.874 E.0164
G1 X29.749 Y66.85 E1.43375
G1 X29.749 Y66.317 E.0164
G1 X62.192 Y33.874 E1.41055
G1 X61.658 Y33.874 E.0164
G1 X29.749 Y65.783 E1.38735
G1 X29.749 Y65.249 E.0164
G1 X61.124 Y33.874 E1.36415
G1 X60.591 Y33.874 E.0164
G1 X29.749 Y64.716 E1.34095
G1 X29.749 Y64.182 E.0164
G1 X60.057 Y33.874 E1.31775
G1 X59.524 Y33.874 E.0164
G1 X29.749 Y63.649 E1.29456
G1 X29.749 Y63.115 E.0164
G1 X58.99 Y33.874 E1.27136
G1 X58.457 Y33.874 E.0164
G1 X29.749 Y62.582 E1.24816
G1 X29.749 Y62.048 E.0164
G1 X57.923 Y33.874 E1.22496
G1 X57.389 Y33.874 E.0164
G1 X29.749 Y61.514 E1.20176
G1 X29.749 Y60.981 E.0164
G1 X56.856 Y33.874 E1.17856
G1 X56.322 Y33.874 E.0164
G1 X29.749 Y60.447 E1.15536
G1 X29.749 Y59.914 E.0164
G1 X55.789 Y33.874 E1.13216
G1 X55.255 Y33.874 E.0164
G1 X29.749 Y59.38 E1.10896
G1 X29.749 Y58.847 E.0164
G1 X41.098 Y47.498 E.49341
G3 X40.414 Y47.648 I-1.103 J-3.399 E.02154
G1 X29.749 Y58.313 E.4637
G1 X29.749 Y57.779 E.0164
G1 X39.857 Y47.671 E.43948
G3 X39.378 Y47.617 I.032 J-2.427 E.01486
G1 X29.749 Y57.246 E.41864
G1 X29.749 Y56.712 E.0164
G1 X38.948 Y47.514 E.39994
G3 X38.558 Y47.37 I.526 J-2.021 E.01279
G1 X29.749 Y56.179 E.383
G1 X29.749 Y55.645 E.0164
G1 X38.206 Y47.189 E.36767
G3 X37.885 Y46.976 I.907 J-1.71 E.01185
G1 X29.749 Y55.112 E.35374
G1 X29.749 Y54.578 E.0164
G1 X37.594 Y46.733 E.34107
G3 X37.331 Y46.463 I1.223 J-1.451 E.01162
G1 X29.749 Y54.044 E.32964
G1 X29.749 Y53.511 E.0164
G1 X37.097 Y46.164 E.31945
G3 X36.892 Y45.835 I1.54 J-1.187 E.01193
G1 X29.749 Y52.977 E.31055
G1 X29.749 Y52.444 E.0164
G1 X36.719 Y45.474 E.30304
G3 X36.582 Y45.078 I1.91 J-.884 E.01291
G1 X29.749 Y51.91 E.29706
G1 X29.749 Y51.377 E.0164
G1 X36.487 Y44.64 E.29292
G3 X36.453 Y44.14 I2.48 J-.419 E.01543
G1 X29.749 Y50.843 E.29145
G1 X29.749 Y50.309 E.0164
G1 X36.494 Y43.565 E.29326
G3 X36.697 Y42.828 I3.852 J.665 E.02352
G1 X29.749 Y49.776 E.30208
G1 X29.749 Y49.242 E.0164
G1 X45.117 Y33.874 E.66818
G1 X45.651 Y33.874 E.0164
G1 X38.701 Y40.824 E.30216
G3 X39.436 Y40.622 I1.309 J3.331 E.02348
G1 X46.184 Y33.874 E.2934
G1 X46.718 Y33.874 E.0164
G1 X40.009 Y40.583 E.29168
G3 X40.512 Y40.614 I.128 J2.003 E.01552
G1 X47.252 Y33.874 E.29304
G1 X47.785 Y33.874 E.0164
G1 X40.955 Y40.705 E.29697
G3 X41.35 Y40.843 I-2.227 J7.006 E.01288
G1 X48.319 Y33.874 E.30297
G1 X48.852 Y33.874 E.0164
G1 X41.71 Y41.016 E.31053
G3 X42.039 Y41.222 I-.862 J1.743 E.01192
G1 X49.386 Y33.874 E.31946
G1 X49.919 Y33.874 E.0164
G1 X42.337 Y41.457 E.32967
G3 X42.607 Y41.72 I-1.18 J1.481 E.01162
G1 X50.453 Y33.874 E.34112
G1 X50.987 Y33.874 E.0164
G1 X42.849 Y42.012 E.3538
G3 X43.062 Y42.333 I-1.5 J1.225 E.01186
G1 X51.52 Y33.874 E.36776
G1 X52.054 Y33.874 E.0164
G1 X43.243 Y42.685 E.38306
G3 X43.391 Y43.071 I-1.852 J.93 E.01273
G1 X52.587 Y33.874 E.39984
G1 X53.121 Y33.874 E.0164
G1 X43.493 Y43.502 E.41859
G3 X43.545 Y43.984 I-2.39 J.498 E.01494
G1 X53.654 Y33.874 E.43957
G1 X54.188 Y33.874 E.0164
G1 X43.525 Y44.537 E.46361
G3 X43.377 Y45.22 I-4.093 J-.534 E.02149
G1 X54.891 Y33.705 E.50065
G1 X29.58 Y34.472 F30000
G1 F15000
G1 X30.177 Y33.874 E.02598
G1 X30.711 Y33.874 E.0164
G1 X29.749 Y34.836 E.04181
G1 X29.749 Y35.37 E.0164
G1 X31.245 Y33.874 E.065
G1 X31.778 Y33.874 E.0164
G1 X29.749 Y35.903 E.0882
G1 X29.749 Y36.437 E.0164
G1 X32.312 Y33.874 E.1114
G1 X32.845 Y33.874 E.0164
G1 X29.749 Y36.97 E.1346
G1 X29.749 Y37.504 E.0164
G1 X33.379 Y33.874 E.1578
G1 X33.912 Y33.874 E.0164
G1 X29.749 Y38.037 E.181
G1 X29.749 Y38.571 E.0164
G1 X34.446 Y33.874 E.2042
G1 X34.98 Y33.874 E.0164
G1 X29.749 Y39.105 E.2274
G1 X29.749 Y39.638 E.0164
G1 X35.513 Y33.874 E.2506
G1 X36.047 Y33.874 E.0164
G1 X29.749 Y40.172 E.2738
G1 X29.749 Y40.705 E.0164
G1 X36.58 Y33.874 E.297
G1 X37.114 Y33.874 E.0164
G1 X29.749 Y41.239 E.32019
G1 X29.749 Y41.772 E.0164
G1 X37.647 Y33.874 E.34339
G1 X38.181 Y33.874 E.0164
G1 X29.749 Y42.306 E.36659
G1 X29.749 Y42.839 E.0164
G1 X38.714 Y33.874 E.38979
G1 X39.248 Y33.874 E.0164
G1 X29.749 Y43.373 E.41299
G1 X29.749 Y43.907 E.0164
G1 X39.782 Y33.874 E.43619
G1 X40.315 Y33.874 E.0164
G1 X29.749 Y44.44 E.45939
G1 X29.749 Y44.974 E.0164
G1 X40.849 Y33.874 E.48259
G1 X41.382 Y33.874 E.0164
G1 X29.749 Y45.507 E.50579
G1 X29.749 Y46.041 E.0164
M73 P78 R14
G1 X41.916 Y33.874 E.52899
G1 X42.449 Y33.874 E.0164
G1 X29.749 Y46.574 E.55219
G1 X29.749 Y47.108 E.0164
G1 X42.983 Y33.874 E.57538
G1 X43.517 Y33.874 E.0164
G1 X29.749 Y47.642 E.59858
G1 X29.749 Y48.175 E.0164
G1 X44.05 Y33.874 E.62178
G1 X44.584 Y33.874 E.0164
G1 X29.58 Y48.878 E.65236
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
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
G1 X126.597 Y204.982
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X126.679 Y204.948 E.00294
G3 X127.819 Y204.666 I1.329 J2.928 E.03918
G3 X129.175 Y204.879 I.175 J3.3 E.04589
G3 X126.395 Y205.094 I-1.167 J2.996 E.57443
G1 X126.545 Y205.011 E.00569
G1 X127.149 Y205.199 F30000
G1 F16213.044
G1 X127.375 Y205.139 E.00777
G3 X127.85 Y205.072 I.633 J2.737 E.01591
G3 X128.761 Y205.17 I.167 J2.73 E.03056
G3 X127.093 Y205.22 I-.752 J2.706 E.52923
G1 X127.578 Y205.517 F30000
G1 F16213.044
G1 X127.88 Y205.477 E.0101
G3 X128.417 Y205.509 I.113 J2.694 E.01787
G3 X127.466 Y205.536 I-.407 J2.367 E.46878
G1 X127.519 Y205.527 E.00178
G1 X127.908 Y205.869 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X127.91 Y205.868 E.00004
G3 X128.349 Y205.895 I.079 J2.314 E.01355
G3 X127.553 Y205.918 I-.342 J1.979 E.36318
G1 X127.849 Y205.877 E.00917
; WIPE_START
M204 S10000
G1 X127.91 Y205.868 E-.02326
G1 X128.15 Y205.87 E-.09142
G1 X128.349 Y205.895 E-.07617
G1 X128.734 Y206.004 E-.15213
G1 X129.091 Y206.186 E-.15208
G1 X129.404 Y206.436 E-.15213
G1 X129.594 Y206.663 E-.1128
; WIPE_END
G1 E-.04 F1800
G1 X137.225 Y206.487 Z3 F30000
G1 X216.158 Y204.666 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X216.24 Y204.67 E.00273
G3 X217.176 Y204.879 I-.246 J3.296 E.03191
G3 X215.819 Y204.666 I-1.167 J2.996 E.62421
G1 X216.098 Y204.666 E.00926
G1 X216.157 Y205.072 F30000
G1 F16213.044
G1 X216.21 Y205.073 E.00177
G3 X216.761 Y205.17 I-.193 J2.729 E.01859
G3 X215.85 Y205.072 I-.752 J2.706 E.55489
G1 X216.097 Y205.072 E.00819
G1 X216.154 Y205.479 F30000
G1 F16213.044
G1 X216.179 Y205.482 E.00084
G3 X216.417 Y205.509 I-.187 J2.691 E.00794
G3 X215.88 Y205.477 I-.407 J2.367 E.48267
G1 X216.094 Y205.478 E.0071
G1 X216.165 Y205.872 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X216.349 Y205.895 E.00571
G3 X215.91 Y205.868 I-.342 J1.979 E.37424
G3 X216.105 Y205.87 I.079 J2.315 E.006
; WIPE_START
M204 S10000
G1 X216.349 Y205.895 E-.09332
G1 X216.734 Y206.004 E-.15214
G1 X217.091 Y206.186 E-.15207
G1 X217.404 Y206.436 E-.15216
G1 X217.661 Y206.743 E-.15212
G1 X217.734 Y206.877 E-.05819
; WIPE_END
G1 E-.04 F1800
G1 X217.449 Y199.25 Z3 F30000
G1 X214.597 Y123.107 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X214.679 Y123.073 E.00294
G3 X215.819 Y122.791 I1.329 J2.928 E.03918
G3 X217.176 Y123.004 I.175 J3.301 E.04588
G3 X214.395 Y123.219 I-1.167 J2.996 E.57442
G1 X214.545 Y123.136 E.00569
G1 X215.149 Y123.323 F30000
G1 F16213.044
G1 X215.376 Y123.264 E.00776
G3 X215.85 Y123.196 I.633 J2.737 E.01591
G3 X216.761 Y123.295 I.167 J2.731 E.03055
G3 X215.094 Y123.345 I-.752 J2.706 E.52925
G1 X215.579 Y123.642 F30000
G1 F16213.044
G1 X215.88 Y123.602 E.0101
G3 X216.417 Y123.634 I.112 J2.696 E.01787
G3 X215.466 Y123.661 I-.407 J2.367 E.46878
G1 X215.519 Y123.652 E.00179
G1 X215.917 Y123.993 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X216.15 Y123.998 E.00717
G3 X216.349 Y124.02 I-.161 J2.31 E.00616
G3 X215.857 Y123.997 I-.342 J1.979 E.37262
; WIPE_START
M204 S10000
G1 X216.15 Y123.998 E-.11137
G1 X216.349 Y124.02 E-.07614
G1 X216.734 Y124.129 E-.15212
G1 X217.091 Y124.311 E-.15212
G1 X217.404 Y124.561 E-.15212
G1 X217.6 Y124.795 E-.11613
; WIPE_END
G1 E-.04 F1800
G1 X217.552 Y117.163 Z3 F30000
G1 X217.075 Y41.096 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X217.176 Y41.129 E.00353
G3 X215.819 Y40.916 I-1.168 J2.996 E.62423
G3 X216.871 Y41.029 I.174 J3.301 E.03524
G1 X217.018 Y41.077 E.00512
G1 X216.63 Y41.39 F30000
G1 F16213.044
G1 X216.761 Y41.42 E.00445
G3 X215.85 Y41.321 I-.752 J2.706 E.5549
G3 X216.488 Y41.357 I.167 J2.731 E.02125
G1 X216.572 Y41.376 E.00285
G1 X216.237 Y41.736 F30000
G1 F16213.044
G1 X216.417 Y41.759 E.00604
G3 X215.88 Y41.727 I-.407 J2.366 E.48252
G3 X216.177 Y41.731 I.112 J2.697 E.00984
G1 X215.916 Y42.118 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X216.15 Y42.123 E.00718
G3 X216.349 Y42.145 I-.162 J2.311 E.00616
G3 X215.857 Y42.122 I-.342 J1.979 E.37262
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
G1 X129.074 Y41.095 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X129.176 Y41.129 E.00354
G3 X127.819 Y40.916 I-1.167 J2.996 E.62423
G3 X128.871 Y41.029 I.174 J3.301 E.03524
G1 X129.017 Y41.077 E.00511
G1 X128.63 Y41.39 F30000
G1 F16213.044
G1 X128.761 Y41.42 E.00446
G3 X127.85 Y41.321 I-.752 J2.706 E.5549
G3 X128.488 Y41.357 I.167 J2.731 E.02125
G1 X128.572 Y41.376 E.00285
G1 X128.237 Y41.736 F30000
G1 F16213.044
G1 X128.417 Y41.759 E.00604
G3 X127.88 Y41.727 I-.407 J2.366 E.48252
G3 X128.177 Y41.731 I.112 J2.696 E.00984
G1 X127.917 Y42.118 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X128.15 Y42.123 E.00717
G3 X128.349 Y42.145 I-.162 J2.311 E.00616
G3 X127.857 Y42.122 I-.342 J1.979 E.37262
; WIPE_START
M204 S10000
G1 X128.15 Y42.123 E-.11144
G1 X128.349 Y42.145 E-.07614
G1 X128.544 Y42.19 E-.07613
G1 X128.917 Y42.336 E-.15213
G1 X129.253 Y42.553 E-.15209
G1 X129.54 Y42.833 E-.15214
G1 X129.599 Y42.92 E-.03992
; WIPE_END
G1 E-.04 F1800
G1 X121.968 Y42.762 Z3 F30000
G1 X41.075 Y41.096 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X41.176 Y41.129 E.00353
G3 X39.819 Y40.916 I-1.168 J2.996 E.62422
G3 X40.871 Y41.029 I.174 J3.301 E.03524
G1 X41.018 Y41.077 E.00512
G1 X40.63 Y41.39 F30000
G1 F16213.044
G1 X40.761 Y41.42 E.00445
G3 X39.85 Y41.321 I-.752 J2.706 E.5549
G3 X40.488 Y41.357 I.167 J2.731 E.02125
G1 X40.572 Y41.376 E.00286
G1 X40.237 Y41.736 F30000
G1 F16213.044
G1 X40.417 Y41.759 E.00603
G3 X39.88 Y41.727 I-.407 J2.366 E.48252
G3 X40.177 Y41.731 I.112 J2.696 E.00985
G1 X39.917 Y42.118 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X40.15 Y42.123 E.00717
G3 X40.349 Y42.145 I-.162 J2.311 E.00616
G3 X39.857 Y42.122 I-.342 J1.979 E.37262
; WIPE_START
M204 S10000
G1 X40.15 Y42.123 E-.11143
G1 X40.349 Y42.145 E-.07614
G1 X40.735 Y42.254 E-.15214
G1 X41.091 Y42.436 E-.15212
G1 X41.404 Y42.686 E-.15208
G1 X41.54 Y42.833 E-.07616
G1 X41.599 Y42.92 E-.03993
; WIPE_END
G1 E-.04 F1800
G1 X47.154 Y48.154 Z3 F30000
G1 X205.416 Y197.291 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X50.584 Y197.291 E5.13608
G1 X50.584 Y54.709 E4.72972
G1 X205.416 Y54.709 E5.13608
G1 X205.416 Y197.231 E4.72773
G1 X205.009 Y196.884 F30000
G1 F16213.044
G1 X50.991 Y196.884 E5.10907
G1 X50.991 Y55.116 E4.70271
G1 X205.009 Y55.116 E5.10907
G1 X205.009 Y196.824 E4.70072
G1 X204.602 Y196.477 F30000
G1 F16213.044
G1 X51.398 Y196.477 E5.08206
G1 X51.398 Y55.523 E4.67571
G1 X204.602 Y55.523 E5.08206
G1 X204.602 Y196.417 E4.67372
G1 X204.21 Y196.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X51.79 Y196.085 E4.68344
G1 X51.79 Y55.915 E4.30703
G1 X204.21 Y55.915 E4.68344
G1 X204.21 Y196.025 E4.30519
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
G1 F16213.044
G1 X41.176 Y123.004 E.00353
G3 X39.819 Y122.791 I-1.168 J2.996 E.62422
G3 X40.871 Y122.904 I.175 J3.301 E.03524
G1 X41.018 Y122.952 E.00512
G1 X40.63 Y123.265 F30000
G1 F16213.044
G1 X40.761 Y123.295 E.00445
G3 X39.85 Y123.196 I-.752 J2.706 E.5549
G3 X40.488 Y123.232 I.167 J2.731 E.02125
G1 X40.572 Y123.251 E.00285
G1 X40.237 Y123.611 F30000
G1 F16213.044
G1 X40.417 Y123.634 E.00603
G3 X39.88 Y123.602 I-.407 J2.367 E.48268
G3 X40.177 Y123.606 I.112 J2.696 E.00984
G1 X39.916 Y123.993 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X40.15 Y123.998 E.00718
G3 X40.349 Y124.02 I-.161 J2.31 E.00616
G3 X39.857 Y123.997 I-.342 J1.979 E.37261
; WIPE_START
M204 S10000
G1 X40.15 Y123.998 E-.1115
G1 X40.349 Y124.02 E-.07614
G1 X40.734 Y124.129 E-.15213
G1 X41.091 Y124.311 E-.15213
G1 X41.404 Y124.561 E-.15208
G1 X41.6 Y124.795 E-.11603
; WIPE_END
G1 E-.04 F1800
G1 X41.462 Y132.426 Z3 F30000
G1 X40.158 Y204.666 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X40.24 Y204.67 E.00273
G3 X41.176 Y204.88 I-.246 J3.296 E.03192
G3 X39.819 Y204.666 I-1.168 J2.996 E.62421
G1 X40.098 Y204.666 E.00926
G1 X40.157 Y205.072 F30000
G1 F16213.044
G1 X40.21 Y205.073 E.00177
G3 X40.761 Y205.17 I-.193 J2.728 E.0186
G3 X39.85 Y205.072 I-.752 J2.706 E.55489
G1 X40.097 Y205.072 E.00819
G1 X40.154 Y205.479 F30000
G1 F16213.044
G1 X40.179 Y205.482 E.00084
G3 X40.417 Y205.509 I-.187 J2.69 E.00794
G3 X39.88 Y205.477 I-.407 J2.367 E.48267
G1 X40.094 Y205.478 E.0071
G1 X40.165 Y205.872 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X40.349 Y205.895 E.00571
G3 X39.91 Y205.868 I-.342 J1.979 E.37424
G3 X40.105 Y205.87 I.079 J2.314 E.006
; WIPE_START
M204 S10000
G1 X40.349 Y205.895 E-.0933
G1 X40.734 Y206.004 E-.15214
G1 X41.091 Y206.186 E-.15209
G1 X41.404 Y206.436 E-.15211
G1 X41.661 Y206.743 E-.15215
G1 X41.734 Y206.877 E-.0582
; WIPE_END
G1 E-.04 F1800
G1 X49.352 Y207.354 Z3 F30000
G1 X226.584 Y218.459 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X29.416 Y218.459 E6.54041
G1 X29.416 Y33.541 E6.13406
G1 X226.584 Y33.541 E6.54041
G1 X226.584 Y218.399 E6.13207
G1 X226.991 Y218.866 F30000
G1 F16213.044
G1 X29.009 Y218.866 E6.56742
G1 X29.009 Y33.134 E6.16106
G1 X226.991 Y33.134 E6.56742
G1 X226.991 Y218.806 E6.15907
G1 X227.398 Y219.273 F30000
G1 F16213.044
G1 X28.602 Y219.273 E6.59442
G1 X28.602 Y32.727 E6.18807
G1 X227.398 Y32.727 E6.59442
G1 X227.398 Y219.213 E6.18608
G1 X227.79 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X28.21 Y219.665 E6.13254
G1 X28.21 Y32.335 E5.75613
G1 X227.79 Y32.335 E6.13254
G1 X227.79 Y219.605 E5.75429
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
G1 F15000
G1 X200.16 Y197.624 E.89875
G1 X199.627 Y197.624 E.0164
G1 X220.128 Y218.126 E.89138
G1 X219.595 Y218.126 E.0164
G1 X199.093 Y197.624 E.89138
G1 X198.56 Y197.624 E.0164
G1 X219.061 Y218.126 E.89138
G1 X218.527 Y218.126 E.0164
G1 X198.026 Y197.624 E.89138
G1 X197.493 Y197.624 E.0164
G1 X217.994 Y218.126 E.89138
G1 X217.46 Y218.126 E.0164
G1 X196.959 Y197.624 E.89138
G1 X196.425 Y197.624 E.0164
G1 X216.927 Y218.126 E.89138
G1 X216.393 Y218.126 E.0164
G1 X195.892 Y197.624 E.89138
G1 X195.358 Y197.624 E.0164
G1 X215.86 Y218.126 E.89138
G1 X215.326 Y218.126 E.0164
G1 X194.825 Y197.624 E.89138
G1 X194.291 Y197.624 E.0164
G1 X214.792 Y218.126 E.89138
G1 X214.259 Y218.126 E.0164
G1 X193.758 Y197.624 E.89138
G1 X193.224 Y197.624 E.0164
G1 X213.725 Y218.126 E.89138
G1 X213.192 Y218.126 E.0164
G1 X192.69 Y197.624 E.89138
G1 X192.157 Y197.624 E.0164
G1 X212.658 Y218.126 E.89138
G1 X212.125 Y218.126 E.0164
G1 X191.623 Y197.624 E.89138
G1 X191.09 Y197.624 E.0164
G1 X211.591 Y218.126 E.89138
G1 X211.057 Y218.126 E.0164
G1 X190.556 Y197.624 E.89138
G1 X190.023 Y197.624 E.0164
G1 X210.524 Y218.126 E.89138
G1 X209.99 Y218.126 E.0164
G1 X189.489 Y197.624 E.89138
M73 P78 R13
G1 X188.955 Y197.624 E.0164
G1 X209.457 Y218.126 E.89138
G1 X208.923 Y218.126 E.0164
G1 X188.422 Y197.624 E.89138
G1 X187.888 Y197.624 E.0164
G1 X208.39 Y218.126 E.89138
G1 X207.856 Y218.126 E.0164
G1 X187.355 Y197.624 E.89138
G1 X186.821 Y197.624 E.0164
G1 X207.322 Y218.126 E.89138
G1 X206.789 Y218.126 E.0164
G1 X186.288 Y197.624 E.89138
G1 X185.754 Y197.624 E.0164
G1 X206.255 Y218.126 E.89138
G1 X205.722 Y218.126 E.0164
G1 X185.221 Y197.624 E.89138
G1 X184.687 Y197.624 E.0164
G1 X205.188 Y218.126 E.89138
G1 X204.655 Y218.126 E.0164
G1 X184.153 Y197.624 E.89138
G1 X183.62 Y197.624 E.0164
G1 X204.121 Y218.126 E.89138
G1 X203.588 Y218.126 E.0164
G1 X183.086 Y197.624 E.89138
G1 X182.553 Y197.624 E.0164
G1 X203.054 Y218.126 E.89138
G1 X202.52 Y218.126 E.0164
G1 X182.019 Y197.624 E.89138
G1 X181.486 Y197.624 E.0164
G1 X201.987 Y218.126 E.89138
G1 X201.453 Y218.126 E.0164
G1 X180.952 Y197.624 E.89138
G1 X180.418 Y197.624 E.0164
G1 X200.92 Y218.126 E.89138
G1 X200.386 Y218.126 E.0164
G1 X179.885 Y197.624 E.89138
G1 X179.351 Y197.624 E.0164
G1 X199.853 Y218.126 E.89138
G1 X199.319 Y218.126 E.0164
G1 X178.818 Y197.624 E.89138
G1 X178.284 Y197.624 E.0164
G1 X198.785 Y218.126 E.89138
G1 X198.252 Y218.126 E.0164
G1 X177.751 Y197.624 E.89138
G1 X177.217 Y197.624 E.0164
G1 X197.718 Y218.126 E.89138
G1 X197.185 Y218.126 E.0164
G1 X176.683 Y197.624 E.89138
G1 X176.15 Y197.624 E.0164
G1 X196.651 Y218.126 E.89138
G1 X196.118 Y218.126 E.0164
G1 X175.616 Y197.624 E.89138
G1 X175.083 Y197.624 E.0164
G1 X195.584 Y218.126 E.89138
G1 X195.05 Y218.126 E.0164
G1 X174.549 Y197.624 E.89138
G1 X174.016 Y197.624 E.0164
G1 X194.517 Y218.126 E.89138
G1 X193.983 Y218.126 E.0164
G1 X173.482 Y197.624 E.89138
G1 X172.948 Y197.624 E.0164
G1 X193.45 Y218.126 E.89138
G1 X192.916 Y218.126 E.0164
G1 X172.415 Y197.624 E.89138
G1 X171.881 Y197.624 E.0164
G1 X192.383 Y218.126 E.89138
G1 X191.849 Y218.126 E.0164
G1 X171.348 Y197.624 E.89138
G1 X170.814 Y197.624 E.0164
G1 X191.315 Y218.126 E.89138
G1 X190.782 Y218.126 E.0164
G1 X170.281 Y197.624 E.89138
G1 X169.747 Y197.624 E.0164
G1 X190.248 Y218.126 E.89138
G1 X189.715 Y218.126 E.0164
G1 X169.213 Y197.624 E.89138
G1 X168.68 Y197.624 E.0164
G1 X189.181 Y218.126 E.89138
G1 X188.648 Y218.126 E.0164
G1 X168.146 Y197.624 E.89138
G1 X167.613 Y197.624 E.0164
G1 X188.114 Y218.126 E.89138
M73 P79 R13
G1 X187.58 Y218.126 E.0164
G1 X167.079 Y197.624 E.89138
G1 X166.546 Y197.624 E.0164
G1 X187.047 Y218.126 E.89138
G1 X186.513 Y218.126 E.0164
G1 X166.012 Y197.624 E.89138
G1 X165.478 Y197.624 E.0164
G1 X185.98 Y218.126 E.89138
G1 X185.446 Y218.126 E.0164
G1 X164.945 Y197.624 E.89138
G1 X164.411 Y197.624 E.0164
G1 X184.913 Y218.126 E.89138
G1 X184.379 Y218.126 E.0164
G1 X163.878 Y197.624 E.89138
G1 X163.344 Y197.624 E.0164
G1 X183.845 Y218.126 E.89138
G1 X183.312 Y218.126 E.0164
G1 X162.811 Y197.624 E.89138
G1 X162.277 Y197.624 E.0164
G1 X182.778 Y218.126 E.89138
G1 X182.245 Y218.126 E.0164
G1 X161.743 Y197.624 E.89138
G1 X161.21 Y197.624 E.0164
G1 X181.711 Y218.126 E.89138
G1 X181.178 Y218.126 E.0164
G1 X160.676 Y197.624 E.89138
G1 X160.143 Y197.624 E.0164
G1 X180.644 Y218.126 E.89138
G1 X180.11 Y218.126 E.0164
G1 X159.609 Y197.624 E.89138
G1 X159.076 Y197.624 E.0164
G1 X179.577 Y218.126 E.89138
G1 X179.043 Y218.126 E.0164
G1 X158.542 Y197.624 E.89138
G1 X158.009 Y197.624 E.0164
G1 X178.51 Y218.126 E.89138
G1 X177.976 Y218.126 E.0164
G1 X157.475 Y197.624 E.89138
G1 X156.941 Y197.624 E.0164
G1 X177.443 Y218.126 E.89138
G1 X176.909 Y218.126 E.0164
G1 X156.408 Y197.624 E.89138
G1 X155.874 Y197.624 E.0164
G1 X176.376 Y218.126 E.89138
G1 X175.842 Y218.126 E.0164
G1 X155.341 Y197.624 E.89138
G1 X154.807 Y197.624 E.0164
G1 X175.308 Y218.126 E.89138
G1 X174.775 Y218.126 E.0164
G1 X154.274 Y197.624 E.89138
G1 X153.74 Y197.624 E.0164
G1 X174.241 Y218.126 E.89138
G1 X173.708 Y218.126 E.0164
G1 X153.206 Y197.624 E.89138
G1 X152.673 Y197.624 E.0164
G1 X173.174 Y218.126 E.89138
G1 X172.641 Y218.126 E.0164
G1 X152.139 Y197.624 E.89138
G1 X151.606 Y197.624 E.0164
G1 X172.107 Y218.126 E.89138
G1 X171.573 Y218.126 E.0164
G1 X151.072 Y197.624 E.89138
G1 X150.539 Y197.624 E.0164
G1 X171.04 Y218.126 E.89138
G1 X170.506 Y218.126 E.0164
G1 X150.005 Y197.624 E.89138
G1 X149.471 Y197.624 E.0164
G1 X169.973 Y218.126 E.89138
G1 X169.439 Y218.126 E.0164
G1 X148.938 Y197.624 E.89138
G1 X148.404 Y197.624 E.0164
G1 X168.906 Y218.126 E.89138
G1 X168.372 Y218.126 E.0164
G1 X147.871 Y197.624 E.89138
G1 X147.337 Y197.624 E.0164
G1 X167.838 Y218.126 E.89138
G1 X167.305 Y218.126 E.0164
G1 X146.804 Y197.624 E.89138
G1 X146.27 Y197.624 E.0164
G1 X166.771 Y218.126 E.89138
G1 X166.238 Y218.126 E.0164
G1 X145.736 Y197.624 E.89138
G1 X145.203 Y197.624 E.0164
G1 X165.704 Y218.126 E.89138
G1 X165.171 Y218.126 E.0164
G1 X144.669 Y197.624 E.89138
G1 X144.136 Y197.624 E.0164
G1 X164.637 Y218.126 E.89138
G1 X164.103 Y218.126 E.0164
G1 X143.602 Y197.624 E.89138
G1 X143.069 Y197.624 E.0164
G1 X163.57 Y218.126 E.89138
G1 X163.036 Y218.126 E.0164
G1 X142.535 Y197.624 E.89138
G1 X142.001 Y197.624 E.0164
G1 X162.503 Y218.126 E.89138
G1 X161.969 Y218.126 E.0164
G1 X141.468 Y197.624 E.89138
G1 X140.934 Y197.624 E.0164
G1 X161.436 Y218.126 E.89138
G1 X160.902 Y218.126 E.0164
G1 X140.401 Y197.624 E.89138
G1 X139.867 Y197.624 E.0164
G1 X160.368 Y218.126 E.89138
G1 X159.835 Y218.126 E.0164
G1 X139.334 Y197.624 E.89138
G1 X138.8 Y197.624 E.0164
G1 X159.301 Y218.126 E.89138
G1 X158.768 Y218.126 E.0164
G1 X138.266 Y197.624 E.89138
G1 X137.733 Y197.624 E.0164
G1 X158.234 Y218.126 E.89138
G1 X157.701 Y218.126 E.0164
G1 X137.199 Y197.624 E.89138
G1 X136.666 Y197.624 E.0164
G1 X157.167 Y218.126 E.89138
G1 X156.633 Y218.126 E.0164
G1 X136.132 Y197.624 E.89138
G1 X135.599 Y197.624 E.0164
G1 X156.1 Y218.126 E.89138
G1 X155.566 Y218.126 E.0164
G1 X135.065 Y197.624 E.89138
G1 X134.531 Y197.624 E.0164
G1 X155.033 Y218.126 E.89138
G1 X154.499 Y218.126 E.0164
G1 X133.998 Y197.624 E.89138
G1 X133.464 Y197.624 E.0164
G1 X153.966 Y218.126 E.89138
G1 X153.432 Y218.126 E.0164
G1 X132.931 Y197.624 E.89138
G1 X132.397 Y197.624 E.0164
G1 X152.898 Y218.126 E.89138
G1 X152.365 Y218.126 E.0164
G1 X131.864 Y197.624 E.89138
G1 X131.33 Y197.624 E.0164
G1 X151.831 Y218.126 E.89138
G1 X151.298 Y218.126 E.0164
G1 X130.797 Y197.624 E.89138
G1 X130.263 Y197.624 E.0164
G1 X150.764 Y218.126 E.89138
G1 X150.231 Y218.126 E.0164
G1 X129.729 Y197.624 E.89138
G1 X129.196 Y197.624 E.0164
G1 X149.697 Y218.126 E.89138
G1 X149.164 Y218.126 E.0164
G1 X128.662 Y197.624 E.89138
G1 X128.129 Y197.624 E.0164
G1 X148.63 Y218.126 E.89138
G1 X148.096 Y218.126 E.0164
G1 X127.595 Y197.624 E.89138
G1 X127.062 Y197.624 E.0164
G1 X147.563 Y218.126 E.89138
G1 X147.029 Y218.126 E.0164
G1 X126.528 Y197.624 E.89138
G1 X125.994 Y197.624 E.0164
G1 X146.496 Y218.126 E.89138
G1 X145.962 Y218.126 E.0164
G1 X125.461 Y197.624 E.89138
G1 X124.927 Y197.624 E.0164
G1 X145.429 Y218.126 E.89138
G1 X144.895 Y218.126 E.0164
G1 X124.394 Y197.624 E.89138
G1 X123.86 Y197.624 E.0164
G1 X144.361 Y218.126 E.89138
G1 X143.828 Y218.126 E.0164
G1 X123.327 Y197.624 E.89138
G1 X122.793 Y197.624 E.0164
G1 X143.294 Y218.126 E.89138
G1 X142.761 Y218.126 E.0164
G1 X131.354 Y206.719 E.49595
G3 X131.518 Y207.417 I-3.472 J1.185 E.02207
G1 X142.227 Y218.126 E.46562
G1 X141.694 Y218.126 E.0164
G1 X131.546 Y207.978 E.44119
G3 X131.498 Y208.464 I-2.453 J.003 E.01503
G1 X141.16 Y218.126 E.42008
G1 X140.626 Y218.126 E.0164
G1 X131.4 Y208.899 E.40117
G3 X131.256 Y209.289 I-6.745 J-2.26 E.01278
G1 X140.093 Y218.126 E.38421
G1 X139.559 Y218.126 E.0164
G1 X131.077 Y209.643 E.36882
G3 X130.866 Y209.966 I-1.723 J-.893 E.01187
G1 X139.026 Y218.126 E.35478
G1 X138.492 Y218.126 E.0164
G1 X130.626 Y210.26 E.342
G3 X130.358 Y210.525 I-1.459 J-1.207 E.01162
G1 X137.959 Y218.126 E.33047
G1 X137.425 Y218.126 E.0164
G1 X130.061 Y210.762 E.32017
G3 X129.735 Y210.969 I-1.201 J-1.529 E.0119
G1 X136.891 Y218.126 E.31116
G1 X136.358 Y218.126 E.0164
G1 X129.377 Y211.145 E.30351
G3 X128.985 Y211.286 I-.901 J-1.891 E.01284
G1 X135.824 Y218.126 E.29738
G1 X135.291 Y218.126 E.0164
G1 X128.546 Y211.381 E.29323
G3 X128.053 Y211.422 I-.449 J-2.444 E.01523
G1 X134.757 Y218.126 E.29147
G1 X134.224 Y218.126 E.0164
G1 X127.484 Y211.386 E.29304
G3 X126.765 Y211.201 I.568 J-3.698 E.02284
G1 X133.69 Y218.126 E.30108
G1 X133.156 Y218.126 E.0164
G1 X112.655 Y197.624 E.89138
G1 X113.189 Y197.624 E.0164
G1 X124.669 Y209.105 E.49915
G3 X124.487 Y208.389 I2.238 J-.951 E.0228
G1 X113.722 Y197.624 E.46802
G1 X114.256 Y197.624 E.0164
G1 X124.453 Y207.821 E.44336
G3 X124.492 Y207.327 I4.886 J.137 E.01526
G1 X114.789 Y197.624 E.42186
G1 X115.323 Y197.624 E.0164
G1 X124.591 Y206.892 E.40297
G3 X124.731 Y206.499 I2.041 J.502 E.01287
G1 X115.857 Y197.624 E.38584
G1 X116.39 Y197.624 E.0164
G1 X124.906 Y206.14 E.37025
G3 X125.113 Y205.813 I1.737 J.87 E.01191
G1 X116.924 Y197.624 E.35604
G1 X117.457 Y197.624 E.0164
G1 X125.349 Y205.516 E.34312
G3 X125.614 Y205.247 I1.474 J1.188 E.01162
G1 X117.991 Y197.624 E.33144
G1 X118.524 Y197.624 E.0164
G1 X125.907 Y205.007 E.32099
G3 X126.23 Y204.796 I6.837 J10.12 E.01185
G1 X119.058 Y197.624 E.31183
G1 X119.592 Y197.624 E.0164
G1 X126.586 Y204.619 E.30413
G3 X126.978 Y204.478 I.904 J1.888 E.01283
G1 X120.125 Y197.624 E.29797
G1 X120.659 Y197.624 E.0164
G1 X127.411 Y204.377 E.2936
G3 X127.9 Y204.332 I.5 J2.783 E.01512
G1 X121.192 Y197.624 E.29166
G1 X121.726 Y197.624 E.0164
G1 X128.459 Y204.358 E.29276
G3 X129.157 Y204.522 I-.462 J3.532 E.02207
G1 X122.09 Y197.455 E.30726
; WIPE_START
G1 X123.504 Y198.869 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.796 Y205.755 Z3 F30000
G1 X132.793 Y218.295 Z3
G1 Z2.6
G1 E.8 F1800
G1 F15000
G1 X112.122 Y197.624 E.89875
G1 X111.588 Y197.624 E.0164
G1 X132.089 Y218.126 E.89138
G1 X131.556 Y218.126 E.0164
G1 X111.054 Y197.624 E.89138
G1 X110.521 Y197.624 E.0164
G1 X131.022 Y218.126 E.89138
G1 X130.489 Y218.126 E.0164
G1 X109.987 Y197.624 E.89138
G1 X109.454 Y197.624 E.0164
G1 X129.955 Y218.126 E.89138
G1 X129.421 Y218.126 E.0164
G1 X108.92 Y197.624 E.89138
G1 X108.387 Y197.624 E.0164
G1 X128.888 Y218.126 E.89138
G1 X128.354 Y218.126 E.0164
G1 X107.853 Y197.624 E.89138
G1 X107.319 Y197.624 E.0164
G1 X127.821 Y218.126 E.89138
G1 X127.287 Y218.126 E.0164
G1 X106.786 Y197.624 E.89138
G1 X106.252 Y197.624 E.0164
G1 X126.754 Y218.126 E.89138
G1 X126.22 Y218.126 E.0164
G1 X105.719 Y197.624 E.89138
G1 X105.185 Y197.624 E.0164
G1 X125.686 Y218.126 E.89138
G1 X125.153 Y218.126 E.0164
G1 X104.652 Y197.624 E.89138
G1 X104.118 Y197.624 E.0164
G1 X124.619 Y218.126 E.89138
G1 X124.086 Y218.126 E.0164
G1 X103.584 Y197.624 E.89138
G1 X103.051 Y197.624 E.0164
G1 X123.552 Y218.126 E.89138
G1 X123.019 Y218.126 E.0164
G1 X102.517 Y197.624 E.89138
G1 X101.984 Y197.624 E.0164
G1 X122.485 Y218.126 E.89138
G1 X121.952 Y218.126 E.0164
G1 X101.45 Y197.624 E.89138
G1 X100.917 Y197.624 E.0164
G1 X121.418 Y218.126 E.89138
G1 X120.884 Y218.126 E.0164
G1 X100.383 Y197.624 E.89138
G1 X99.85 Y197.624 E.0164
G1 X120.351 Y218.126 E.89138
G1 X119.817 Y218.126 E.0164
G1 X99.316 Y197.624 E.89138
G1 X98.782 Y197.624 E.0164
G1 X119.284 Y218.126 E.89138
G1 X118.75 Y218.126 E.0164
G1 X98.249 Y197.624 E.89138
G1 X97.715 Y197.624 E.0164
G1 X118.217 Y218.126 E.89138
G1 X117.683 Y218.126 E.0164
G1 X97.182 Y197.624 E.89138
G1 X96.648 Y197.624 E.0164
G1 X117.149 Y218.126 E.89138
G1 X116.616 Y218.126 E.0164
G1 X96.115 Y197.624 E.89138
G1 X95.581 Y197.624 E.0164
G1 X116.082 Y218.126 E.89138
G1 X115.549 Y218.126 E.0164
G1 X95.047 Y197.624 E.89138
G1 X94.514 Y197.624 E.0164
G1 X115.015 Y218.126 E.89138
G1 X114.482 Y218.126 E.0164
G1 X93.98 Y197.624 E.89138
G1 X93.447 Y197.624 E.0164
G1 X113.948 Y218.126 E.89138
G1 X113.414 Y218.126 E.0164
G1 X92.913 Y197.624 E.89138
G1 X92.38 Y197.624 E.0164
G1 X112.881 Y218.126 E.89138
G1 X112.347 Y218.126 E.0164
G1 X91.846 Y197.624 E.89138
G1 X91.312 Y197.624 E.0164
G1 X111.814 Y218.126 E.89138
G1 X111.28 Y218.126 E.0164
G1 X90.779 Y197.624 E.89138
G1 X90.245 Y197.624 E.0164
G1 X110.747 Y218.126 E.89138
G1 X110.213 Y218.126 E.0164
G1 X89.712 Y197.624 E.89138
G1 X89.178 Y197.624 E.0164
G1 X109.679 Y218.126 E.89138
G1 X109.146 Y218.126 E.0164
G1 X88.645 Y197.624 E.89138
G1 X88.111 Y197.624 E.0164
G1 X108.612 Y218.126 E.89138
G1 X108.079 Y218.126 E.0164
G1 X87.577 Y197.624 E.89138
G1 X87.044 Y197.624 E.0164
G1 X107.545 Y218.126 E.89138
G1 X107.012 Y218.126 E.0164
G1 X86.51 Y197.624 E.89138
G1 X85.977 Y197.624 E.0164
G1 X106.478 Y218.126 E.89138
G1 X105.944 Y218.126 E.0164
G1 X85.443 Y197.624 E.89138
G1 X84.91 Y197.624 E.0164
G1 X105.411 Y218.126 E.89138
G1 X104.877 Y218.126 E.0164
G1 X84.376 Y197.624 E.89138
G1 X83.842 Y197.624 E.0164
G1 X104.344 Y218.126 E.89138
G1 X103.81 Y218.126 E.0164
G1 X83.309 Y197.624 E.89138
G1 X82.775 Y197.624 E.0164
G1 X103.277 Y218.126 E.89138
G1 X102.743 Y218.126 E.0164
G1 X82.242 Y197.624 E.89138
G1 X81.708 Y197.624 E.0164
G1 X102.209 Y218.126 E.89138
G1 X101.676 Y218.126 E.0164
G1 X81.175 Y197.624 E.89138
G1 X80.641 Y197.624 E.0164
G1 X101.142 Y218.126 E.89138
G1 X100.609 Y218.126 E.0164
G1 X80.107 Y197.624 E.89138
G1 X79.574 Y197.624 E.0164
G1 X100.075 Y218.126 E.89138
G1 X99.542 Y218.126 E.0164
G1 X79.04 Y197.624 E.89138
G1 X78.507 Y197.624 E.0164
G1 X99.008 Y218.126 E.89138
G1 X98.474 Y218.126 E.0164
G1 X77.973 Y197.624 E.89138
G1 X77.44 Y197.624 E.0164
G1 X97.941 Y218.126 E.89138
G1 X97.407 Y218.126 E.0164
G1 X76.906 Y197.624 E.89138
G1 X76.373 Y197.624 E.0164
G1 X96.874 Y218.126 E.89138
G1 X96.34 Y218.126 E.0164
G1 X75.839 Y197.624 E.89138
G1 X75.305 Y197.624 E.0164
G1 X95.807 Y218.126 E.89138
G1 X95.273 Y218.126 E.0164
G1 X74.772 Y197.624 E.89138
G1 X74.238 Y197.624 E.0164
G1 X94.739 Y218.126 E.89138
G1 X94.206 Y218.126 E.0164
G1 X73.705 Y197.624 E.89138
G1 X73.171 Y197.624 E.0164
G1 X93.672 Y218.126 E.89138
G1 X93.139 Y218.126 E.0164
G1 X72.638 Y197.624 E.89138
G1 X72.104 Y197.624 E.0164
G1 X92.605 Y218.126 E.89138
G1 X92.072 Y218.126 E.0164
G1 X71.57 Y197.624 E.89138
G1 X71.037 Y197.624 E.0164
G1 X91.538 Y218.126 E.89138
G1 X91.005 Y218.126 E.0164
G1 X70.503 Y197.624 E.89138
G1 X69.97 Y197.624 E.0164
G1 X90.471 Y218.126 E.89138
G1 X89.937 Y218.126 E.0164
G1 X69.436 Y197.624 E.89138
G1 X68.903 Y197.624 E.0164
G1 X89.404 Y218.126 E.89138
G1 X88.87 Y218.126 E.0164
G1 X68.369 Y197.624 E.89138
G1 X67.835 Y197.624 E.0164
G1 X88.337 Y218.126 E.89138
G1 X87.803 Y218.126 E.0164
G1 X67.302 Y197.624 E.89138
G1 X66.768 Y197.624 E.0164
G1 X87.27 Y218.126 E.89138
G1 X86.736 Y218.126 E.0164
G1 X66.235 Y197.624 E.89138
G1 X65.701 Y197.624 E.0164
G1 X86.202 Y218.126 E.89138
G1 X85.669 Y218.126 E.0164
G1 X65.168 Y197.624 E.89138
G1 X64.634 Y197.624 E.0164
G1 X85.135 Y218.126 E.89138
G1 X84.602 Y218.126 E.0164
G1 X64.1 Y197.624 E.89138
G1 X63.567 Y197.624 E.0164
G1 X84.068 Y218.126 E.89138
G1 X83.535 Y218.126 E.0164
G1 X63.033 Y197.624 E.89138
G1 X62.5 Y197.624 E.0164
G1 X83.001 Y218.126 E.89138
G1 X82.467 Y218.126 E.0164
G1 X61.966 Y197.624 E.89138
G1 X61.433 Y197.624 E.0164
G1 X81.934 Y218.126 E.89138
G1 X81.4 Y218.126 E.0164
G1 X60.899 Y197.624 E.89138
G1 X60.365 Y197.624 E.0164
G1 X80.867 Y218.126 E.89138
G1 X80.333 Y218.126 E.0164
G1 X59.832 Y197.624 E.89138
G1 X59.298 Y197.624 E.0164
G1 X79.8 Y218.126 E.89138
G1 X79.266 Y218.126 E.0164
G1 X58.765 Y197.624 E.89138
G1 X58.231 Y197.624 E.0164
G1 X78.732 Y218.126 E.89138
G1 X78.199 Y218.126 E.0164
G1 X57.698 Y197.624 E.89138
G1 X57.164 Y197.624 E.0164
G1 X77.665 Y218.126 E.89138
G1 X77.132 Y218.126 E.0164
G1 X56.63 Y197.624 E.89138
G1 X56.097 Y197.624 E.0164
G1 X76.598 Y218.126 E.89138
G1 X76.065 Y218.126 E.0164
G1 X55.563 Y197.624 E.89138
G1 X55.03 Y197.624 E.0164
G1 X75.531 Y218.126 E.89138
G1 X74.997 Y218.126 E.0164
G1 X54.496 Y197.624 E.89138
G1 X53.963 Y197.624 E.0164
G1 X74.464 Y218.126 E.89138
G1 X73.93 Y218.126 E.0164
G1 X53.429 Y197.624 E.89138
G1 X52.895 Y197.624 E.0164
G1 X73.397 Y218.126 E.89138
G1 X72.863 Y218.126 E.0164
G1 X52.362 Y197.624 E.89138
G1 X51.828 Y197.624 E.0164
G1 X72.33 Y218.126 E.89138
G1 X71.796 Y218.126 E.0164
G1 X51.295 Y197.624 E.89138
G1 X50.761 Y197.624 E.0164
G1 X71.262 Y218.126 E.89138
G1 X70.729 Y218.126 E.0164
G1 X29.749 Y177.146 E1.78175
G1 X29.749 Y176.613 E.0164
G1 X50.251 Y197.114 E.89138
G1 X50.251 Y196.58 E.0164
G1 X29.749 Y176.079 E.89138
G1 X29.749 Y175.545 E.0164
G1 X50.251 Y196.047 E.89138
G1 X50.251 Y195.513 E.0164
G1 X29.749 Y175.012 E.89138
G1 X29.749 Y174.478 E.0164
G1 X50.251 Y194.98 E.89138
G1 X50.251 Y194.446 E.0164
G1 X29.749 Y173.945 E.89138
G1 X29.749 Y173.411 E.0164
G1 X50.251 Y193.912 E.89138
G1 X50.251 Y193.379 E.0164
G1 X29.749 Y172.878 E.89138
G1 X29.749 Y172.344 E.0164
G1 X50.251 Y192.845 E.89138
G1 X50.251 Y192.312 E.0164
G1 X29.749 Y171.81 E.89138
G1 X29.749 Y171.277 E.0164
G1 X50.251 Y191.778 E.89138
G1 X50.251 Y191.245 E.0164
G1 X29.749 Y170.743 E.89138
G1 X29.749 Y170.21 E.0164
G1 X50.251 Y190.711 E.89138
G1 X50.251 Y190.177 E.0164
G1 X29.749 Y169.676 E.89138
G1 X29.749 Y169.143 E.0164
G1 X50.251 Y189.644 E.89138
G1 X50.251 Y189.11 E.0164
G1 X29.749 Y168.609 E.89138
G1 X29.749 Y168.075 E.0164
G1 X50.251 Y188.577 E.89138
G1 X50.251 Y188.043 E.0164
G1 X29.749 Y167.542 E.89138
G1 X29.749 Y167.008 E.0164
G1 X50.251 Y187.51 E.89138
G1 X50.251 Y186.976 E.0164
G1 X29.749 Y166.475 E.89138
G1 X29.749 Y165.941 E.0164
G1 X50.251 Y186.442 E.89138
G1 X50.251 Y185.909 E.0164
G1 X29.749 Y165.408 E.89138
G1 X29.749 Y164.874 E.0164
G1 X50.251 Y185.375 E.89138
G1 X50.251 Y184.842 E.0164
G1 X29.749 Y164.34 E.89138
G1 X29.749 Y163.807 E.0164
G1 X50.251 Y184.308 E.89138
G1 X50.251 Y183.775 E.0164
G1 X29.749 Y163.273 E.89138
G1 X29.749 Y162.74 E.0164
G1 X50.251 Y183.241 E.89138
G1 X50.251 Y182.707 E.0164
G1 X29.749 Y162.206 E.89138
G1 X29.749 Y161.673 E.0164
G1 X50.251 Y182.174 E.89138
G1 X50.251 Y181.64 E.0164
G1 X29.749 Y161.139 E.89138
G1 X29.749 Y160.605 E.0164
G1 X50.251 Y181.107 E.89138
G1 X50.251 Y180.573 E.0164
G1 X29.749 Y160.072 E.89138
G1 X29.749 Y159.538 E.0164
G1 X50.251 Y180.04 E.89138
G1 X50.251 Y179.506 E.0164
G1 X29.749 Y159.005 E.89138
G1 X29.749 Y158.471 E.0164
G1 X50.251 Y178.972 E.89138
G1 X50.251 Y178.439 E.0164
G1 X29.749 Y157.938 E.89138
G1 X29.749 Y157.404 E.0164
G1 X50.251 Y177.905 E.89138
G1 X50.251 Y177.372 E.0164
G1 X29.749 Y156.87 E.89138
M73 P80 R13
G1 X29.749 Y156.337 E.0164
G1 X50.251 Y176.838 E.89138
G1 X50.251 Y176.305 E.0164
G1 X29.749 Y155.803 E.89138
G1 X29.749 Y155.27 E.0164
G1 X50.251 Y175.771 E.89138
G1 X50.251 Y175.237 E.0164
G1 X29.749 Y154.736 E.89138
G1 X29.749 Y154.203 E.0164
G1 X50.251 Y174.704 E.89138
G1 X50.251 Y174.17 E.0164
G1 X29.749 Y153.669 E.89138
G1 X29.749 Y153.135 E.0164
G1 X50.251 Y173.637 E.89138
G1 X50.251 Y173.103 E.0164
G1 X29.749 Y152.602 E.89138
G1 X29.749 Y152.068 E.0164
G1 X50.251 Y172.57 E.89138
G1 X50.251 Y172.036 E.0164
G1 X29.749 Y151.535 E.89138
G1 X29.749 Y151.001 E.0164
G1 X50.251 Y171.502 E.89138
G1 X50.251 Y170.969 E.0164
G1 X29.749 Y150.468 E.89138
G1 X29.749 Y149.934 E.0164
G1 X50.251 Y170.435 E.89138
G1 X50.251 Y169.902 E.0164
G1 X29.749 Y149.401 E.89138
G1 X29.749 Y148.867 E.0164
G1 X50.251 Y169.368 E.89138
G1 X50.251 Y168.835 E.0164
G1 X29.749 Y148.333 E.89138
G1 X29.749 Y147.8 E.0164
G1 X50.251 Y168.301 E.89138
G1 X50.251 Y167.768 E.0164
G1 X29.749 Y147.266 E.89138
G1 X29.749 Y146.733 E.0164
G1 X50.251 Y167.234 E.89138
G1 X50.251 Y166.7 E.0164
G1 X29.749 Y146.199 E.89138
G1 X29.749 Y145.666 E.0164
G1 X50.251 Y166.167 E.89138
G1 X50.251 Y165.633 E.0164
G1 X29.749 Y145.132 E.89138
G1 X29.749 Y144.598 E.0164
G1 X50.251 Y165.1 E.89138
G1 X50.251 Y164.566 E.0164
G1 X29.749 Y144.065 E.89138
G1 X29.749 Y143.531 E.0164
G1 X50.251 Y164.033 E.89138
G1 X50.251 Y163.499 E.0164
G1 X29.749 Y142.998 E.89138
G1 X29.749 Y142.464 E.0164
G1 X50.251 Y162.965 E.89138
G1 X50.251 Y162.432 E.0164
G1 X29.749 Y141.931 E.89138
G1 X29.749 Y141.397 E.0164
G1 X50.251 Y161.898 E.89138
G1 X50.251 Y161.365 E.0164
G1 X29.749 Y140.863 E.89138
G1 X29.749 Y140.33 E.0164
G1 X50.251 Y160.831 E.89138
G1 X50.251 Y160.298 E.0164
G1 X29.749 Y139.796 E.89138
G1 X29.749 Y139.263 E.0164
G1 X50.251 Y159.764 E.89138
G1 X50.251 Y159.23 E.0164
G1 X29.749 Y138.729 E.89138
G1 X29.749 Y138.196 E.0164
G1 X50.251 Y158.697 E.89138
G1 X50.251 Y158.163 E.0164
G1 X29.749 Y137.662 E.89138
G1 X29.749 Y137.128 E.0164
G1 X50.251 Y157.63 E.89138
G1 X50.251 Y157.096 E.0164
G1 X29.749 Y136.595 E.89138
G1 X29.749 Y136.061 E.0164
G1 X50.251 Y156.563 E.89138
G1 X50.251 Y156.029 E.0164
G1 X29.749 Y135.528 E.89138
G1 X29.749 Y134.994 E.0164
G1 X50.251 Y155.495 E.89138
G1 X50.251 Y154.962 E.0164
G1 X29.749 Y134.461 E.89138
G1 X29.749 Y133.927 E.0164
G1 X50.251 Y154.428 E.89138
G1 X50.251 Y153.895 E.0164
G1 X29.749 Y133.393 E.89138
G1 X29.749 Y132.86 E.0164
G1 X50.251 Y153.361 E.89138
G1 X50.251 Y152.828 E.0164
G1 X29.749 Y132.326 E.89138
G1 X29.749 Y131.793 E.0164
G1 X50.251 Y152.294 E.89138
G1 X50.251 Y151.76 E.0164
G1 X29.749 Y131.259 E.89138
G1 X29.749 Y130.726 E.0164
G1 X50.251 Y151.227 E.89138
G1 X50.251 Y150.693 E.0164
G1 X29.749 Y130.192 E.89138
G1 X29.749 Y129.658 E.0164
G1 X50.251 Y150.16 E.89138
G1 X50.251 Y149.626 E.0164
G1 X29.749 Y129.125 E.89138
G1 X29.749 Y128.591 E.0164
G1 X50.251 Y149.093 E.89138
G1 X50.251 Y148.559 E.0164
G1 X29.749 Y128.058 E.89138
G1 X29.749 Y127.524 E.0164
G1 X50.251 Y148.025 E.89138
G1 X50.251 Y147.492 E.0164
G1 X29.749 Y126.991 E.89138
G1 X29.749 Y126.457 E.0164
G1 X50.251 Y146.958 E.89138
G1 X50.251 Y146.425 E.0164
G1 X29.749 Y125.923 E.89138
G1 X29.749 Y125.39 E.0164
G1 X50.251 Y145.891 E.89138
G1 X50.251 Y145.358 E.0164
G1 X29.749 Y124.856 E.89138
G1 X29.749 Y124.323 E.0164
G1 X50.251 Y144.824 E.89138
G1 X50.251 Y144.29 E.0164
G1 X29.749 Y123.789 E.89138
G1 X29.749 Y123.256 E.0164
G1 X50.251 Y143.757 E.89138
G1 X50.251 Y143.223 E.0164
G1 X29.749 Y122.722 E.89138
G1 X29.749 Y122.189 E.0164
G1 X50.251 Y142.69 E.89138
G1 X50.251 Y142.156 E.0164
G1 X29.749 Y121.655 E.89138
G1 X29.749 Y121.121 E.0164
G1 X50.42 Y141.792 E.89875
; WIPE_START
G1 X49.006 Y140.378 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X44.815 Y133.999 Z3 F30000
G1 X29.58 Y110.814 Z3
G1 Z2.6
G1 E.8 F1800
G1 F15000
G1 X41.593 Y122.827 E.52233
G2 X40.769 Y122.537 I-1.645 J3.357 E.02691
G1 X29.749 Y111.517 E.47915
G1 X29.749 Y112.051 E.0164
G1 X40.156 Y122.458 E.45249
G2 X39.635 Y122.47 I-.178 J3.436 E.01604
G1 X29.749 Y112.584 E.42983
G1 X29.749 Y113.118 E.0164
G1 X39.178 Y122.546 E.40995
G2 X38.77 Y122.672 I.423 J2.098 E.01314
G1 X29.749 Y113.651 E.39221
G1 X29.749 Y114.185 E.0164
G1 X38.399 Y122.835 E.37608
M73 P80 R12
G2 X38.061 Y123.03 I.805 J1.786 E.01203
G1 X29.749 Y114.719 E.36137
G1 X29.749 Y115.252 E.0164
G1 X37.753 Y123.255 E.34797
G2 X37.473 Y123.51 I1.131 J1.524 E.01163
G1 X29.749 Y115.786 E.33583
G1 X29.749 Y116.319 E.0164
G1 X37.222 Y123.792 E.32491
G2 X37 Y124.103 I1.442 J1.265 E.01178
G1 X29.749 Y116.853 E.31525
G1 X29.749 Y117.386 E.0164
G1 X36.808 Y124.445 E.3069
G2 X36.651 Y124.822 I7.153 J3.191 E.01255
G1 X29.749 Y117.92 E.30009
G1 X29.749 Y118.454 E.0164
G1 X36.535 Y125.239 E.29503
G2 X36.465 Y125.703 I2.282 J.582 E.01444
G1 X29.749 Y118.987 E.29199
G1 X29.749 Y119.521 E.0164
G1 X36.458 Y126.229 E.29169
G2 X36.555 Y126.86 I3.198 J-.168 E.01964
G1 X29.749 Y120.054 E.2959
G1 X29.749 Y120.588 E.0164
G1 X50.251 Y141.089 E.89138
G1 X50.251 Y140.556 E.0164
G1 X39.137 Y129.442 E.4832
G2 X39.768 Y129.54 I.896 J-3.701 E.01966
G1 X50.251 Y140.022 E.45576
G1 X50.251 Y139.488 E.0164
G1 X40.3 Y129.537 E.43266
G2 X40.761 Y129.465 I-.133 J-2.343 E.01437
G1 X50.251 Y138.955 E.41262
G1 X50.251 Y138.421 E.0164
G1 X41.176 Y129.347 E.39455
G2 X41.554 Y129.191 I-.594 J-1.968 E.01258
G1 X50.251 Y137.888 E.37814
G1 X50.251 Y137.354 E.0164
G1 X41.897 Y129.001 E.3632
G2 X42.21 Y128.78 I-.948 J-1.675 E.01179
G1 X50.251 Y136.821 E.3496
G1 X50.251 Y136.287 E.0164
G1 X42.492 Y128.529 E.33732
G2 X42.746 Y128.249 I-1.27 J-1.407 E.01163
G1 X50.251 Y135.753 E.32628
G1 X50.251 Y135.22 E.0164
G1 X42.971 Y127.94 E.3165
G2 X43.166 Y127.601 I-1.594 J-1.14 E.01204
G1 X50.251 Y134.686 E.30804
G1 X50.251 Y134.153 E.0164
G1 X43.327 Y127.229 E.30102
G2 X43.452 Y126.82 I-1.984 J-.825 E.01317
G1 X50.251 Y133.619 E.29562
G1 X50.251 Y133.086 E.0164
G1 X43.532 Y126.367 E.29213
G2 X43.544 Y125.845 I-4.853 J-.372 E.01605
G1 X50.251 Y132.552 E.29161
G1 X50.251 Y132.018 E.0164
G1 X43.465 Y125.233 E.29503
G2 X43.167 Y124.401 I-3.612 J.825 E.02722
G1 X50.251 Y131.485 E.30798
G1 X50.251 Y130.951 E.0164
G1 X29.749 Y110.45 E.89138
G1 X29.749 Y109.916 E.0164
G1 X50.251 Y130.418 E.89138
G1 X50.251 Y129.884 E.0164
G1 X29.749 Y109.383 E.89138
G1 X29.749 Y108.849 E.0164
G1 X50.251 Y129.351 E.89138
G1 X50.251 Y128.817 E.0164
G1 X29.749 Y108.316 E.89138
G1 X29.749 Y107.782 E.0164
G1 X50.251 Y128.283 E.89138
G1 X50.251 Y127.75 E.0164
G1 X29.749 Y107.249 E.89138
G1 X29.749 Y106.715 E.0164
G1 X50.251 Y127.216 E.89138
G1 X50.251 Y126.683 E.0164
G1 X29.749 Y106.181 E.89138
G1 X29.749 Y105.648 E.0164
G1 X50.251 Y126.149 E.89138
G1 X50.251 Y125.616 E.0164
G1 X29.749 Y105.114 E.89138
G1 X29.749 Y104.581 E.0164
G1 X50.251 Y125.082 E.89138
G1 X50.251 Y124.548 E.0164
G1 X29.749 Y104.047 E.89138
G1 X29.749 Y103.514 E.0164
G1 X50.251 Y124.015 E.89138
G1 X50.251 Y123.481 E.0164
G1 X29.749 Y102.98 E.89138
G1 X29.749 Y102.446 E.0164
G1 X50.251 Y122.948 E.89138
G1 X50.251 Y122.414 E.0164
G1 X29.749 Y101.913 E.89138
G1 X29.749 Y101.379 E.0164
G1 X50.251 Y121.881 E.89138
G1 X50.251 Y121.347 E.0164
G1 X29.749 Y100.846 E.89138
G1 X29.749 Y100.312 E.0164
G1 X50.251 Y120.813 E.89138
G1 X50.251 Y120.28 E.0164
G1 X29.749 Y99.779 E.89138
G1 X29.749 Y99.245 E.0164
G1 X50.251 Y119.746 E.89138
G1 X50.251 Y119.213 E.0164
G1 X29.749 Y98.711 E.89138
G1 X29.749 Y98.178 E.0164
G1 X50.251 Y118.679 E.89138
G1 X50.251 Y118.146 E.0164
G1 X29.749 Y97.644 E.89138
G1 X29.749 Y97.111 E.0164
G1 X50.251 Y117.612 E.89138
G1 X50.251 Y117.078 E.0164
G1 X29.749 Y96.577 E.89138
G1 X29.749 Y96.044 E.0164
G1 X50.251 Y116.545 E.89138
G1 X50.251 Y116.011 E.0164
G1 X29.749 Y95.51 E.89138
G1 X29.749 Y94.977 E.0164
G1 X50.251 Y115.478 E.89138
G1 X50.251 Y114.944 E.0164
G1 X29.749 Y94.443 E.89138
G1 X29.749 Y93.909 E.0164
G1 X50.251 Y114.411 E.89138
G1 X50.251 Y113.877 E.0164
G1 X29.749 Y93.376 E.89138
G1 X29.749 Y92.842 E.0164
G1 X50.251 Y113.344 E.89138
G1 X50.251 Y112.81 E.0164
G1 X29.749 Y92.309 E.89138
G1 X29.749 Y91.775 E.0164
G1 X50.251 Y112.276 E.89138
G1 X50.251 Y111.743 E.0164
G1 X29.749 Y91.242 E.89138
G1 X29.749 Y90.708 E.0164
G1 X50.251 Y111.209 E.89138
G1 X50.251 Y110.676 E.0164
G1 X29.749 Y90.174 E.89138
G1 X29.749 Y89.641 E.0164
G1 X50.251 Y110.142 E.89138
G1 X50.251 Y109.609 E.0164
G1 X29.749 Y89.107 E.89138
G1 X29.749 Y88.574 E.0164
G1 X50.251 Y109.075 E.89138
G1 X50.251 Y108.541 E.0164
G1 X29.749 Y88.04 E.89138
G1 X29.749 Y87.507 E.0164
G1 X50.251 Y108.008 E.89138
G1 X50.251 Y107.474 E.0164
G1 X29.749 Y86.973 E.89138
G1 X29.749 Y86.439 E.0164
G1 X50.251 Y106.941 E.89138
G1 X50.251 Y106.407 E.0164
G1 X29.749 Y85.906 E.89138
G1 X29.749 Y85.372 E.0164
G1 X50.251 Y105.874 E.89138
G1 X50.251 Y105.34 E.0164
G1 X29.749 Y84.839 E.89138
G1 X29.749 Y84.305 E.0164
G1 X50.251 Y104.806 E.89138
G1 X50.251 Y104.273 E.0164
G1 X29.749 Y83.772 E.89138
G1 X29.749 Y83.238 E.0164
G1 X50.251 Y103.739 E.89138
G1 X50.251 Y103.206 E.0164
G1 X29.749 Y82.704 E.89138
G1 X29.749 Y82.171 E.0164
G1 X50.251 Y102.672 E.89138
G1 X50.251 Y102.139 E.0164
G1 X29.749 Y81.637 E.89138
G1 X29.749 Y81.104 E.0164
G1 X50.251 Y101.605 E.89138
G1 X50.251 Y101.071 E.0164
G1 X29.749 Y80.57 E.89138
G1 X29.749 Y80.037 E.0164
G1 X50.251 Y100.538 E.89138
G1 X50.251 Y100.004 E.0164
G1 X29.749 Y79.503 E.89138
G1 X29.749 Y78.969 E.0164
G1 X50.251 Y99.471 E.89138
G1 X50.251 Y98.937 E.0164
G1 X29.749 Y78.436 E.89138
G1 X29.749 Y77.902 E.0164
G1 X50.251 Y98.404 E.89138
G1 X50.251 Y97.87 E.0164
G1 X29.749 Y77.369 E.89138
G1 X29.749 Y76.835 E.0164
G1 X50.251 Y97.336 E.89138
G1 X50.251 Y96.803 E.0164
G1 X29.749 Y76.302 E.89138
G1 X29.749 Y75.768 E.0164
G1 X50.251 Y96.269 E.89138
G1 X50.251 Y95.736 E.0164
G1 X29.749 Y75.234 E.89138
G1 X29.749 Y74.701 E.0164
G1 X50.251 Y95.202 E.89138
G1 X50.251 Y94.669 E.0164
G1 X29.749 Y74.167 E.89138
G1 X29.749 Y73.634 E.0164
G1 X50.251 Y94.135 E.89138
G1 X50.251 Y93.601 E.0164
G1 X29.749 Y73.1 E.89138
G1 X29.749 Y72.567 E.0164
G1 X50.251 Y93.068 E.89138
G1 X50.251 Y92.534 E.0164
G1 X29.749 Y72.033 E.89138
G1 X29.749 Y71.499 E.0164
G1 X50.251 Y92.001 E.89138
G1 X50.251 Y91.467 E.0164
G1 X29.749 Y70.966 E.89138
G1 X29.749 Y70.432 E.0164
G1 X50.251 Y90.934 E.89138
G1 X50.251 Y90.4 E.0164
G1 X29.749 Y69.899 E.89138
G1 X29.749 Y69.365 E.0164
G1 X50.251 Y89.866 E.89138
G1 X50.251 Y89.333 E.0164
G1 X29.749 Y68.832 E.89138
G1 X29.749 Y68.298 E.0164
G1 X50.251 Y88.799 E.89138
G1 X50.251 Y88.266 E.0164
G1 X29.749 Y67.765 E.89138
G1 X29.749 Y67.231 E.0164
G1 X50.251 Y87.732 E.89138
G1 X50.251 Y87.199 E.0164
G1 X29.749 Y66.697 E.89138
G1 X29.749 Y66.164 E.0164
G1 X50.251 Y86.665 E.89138
G1 X50.251 Y86.132 E.0164
G1 X29.749 Y65.63 E.89138
G1 X29.749 Y65.097 E.0164
G1 X50.251 Y85.598 E.89138
G1 X50.251 Y85.064 E.0164
G1 X29.749 Y64.563 E.89138
G1 X29.749 Y64.03 E.0164
G1 X50.251 Y84.531 E.89138
G1 X50.251 Y83.997 E.0164
G1 X29.749 Y63.496 E.89138
G1 X29.749 Y62.962 E.0164
G1 X50.251 Y83.464 E.89138
G1 X50.251 Y82.93 E.0164
G1 X29.749 Y62.429 E.89138
G1 X29.749 Y61.895 E.0164
G1 X50.251 Y82.397 E.89138
G1 X50.251 Y81.863 E.0164
G1 X29.749 Y61.362 E.89138
G1 X29.749 Y60.828 E.0164
G1 X50.251 Y81.329 E.89138
G1 X50.251 Y80.796 E.0164
G1 X29.749 Y60.295 E.89138
G1 X29.749 Y59.761 E.0164
G1 X50.251 Y80.262 E.89138
G1 X50.251 Y79.729 E.0164
G1 X29.749 Y59.227 E.89138
G1 X29.749 Y58.694 E.0164
G1 X50.251 Y79.195 E.89138
G1 X50.251 Y78.662 E.0164
G1 X29.749 Y58.16 E.89138
G1 X29.749 Y57.627 E.0164
G1 X50.251 Y78.128 E.89138
G1 X50.251 Y77.594 E.0164
G1 X29.749 Y57.093 E.89138
G1 X29.749 Y56.56 E.0164
G1 X50.251 Y77.061 E.89138
G1 X50.251 Y76.527 E.0164
G1 X29.749 Y56.026 E.89138
G1 X29.749 Y55.492 E.0164
G1 X50.251 Y75.994 E.89138
G1 X50.251 Y75.46 E.0164
G1 X29.749 Y54.959 E.89138
G1 X29.749 Y54.425 E.0164
G1 X50.251 Y74.927 E.89138
G1 X50.251 Y74.393 E.0164
G1 X29.749 Y53.892 E.89138
G1 X29.749 Y53.358 E.0164
G1 X50.251 Y73.859 E.89138
G1 X50.251 Y73.326 E.0164
G1 X29.749 Y52.825 E.89138
G1 X29.749 Y52.291 E.0164
G1 X50.251 Y72.792 E.89138
G1 X50.251 Y72.259 E.0164
G1 X29.749 Y51.757 E.89138
G1 X29.749 Y51.224 E.0164
G1 X50.251 Y71.725 E.89138
G1 X50.251 Y71.192 E.0164
G1 X29.749 Y50.69 E.89138
G1 X29.749 Y50.157 E.0164
G1 X50.251 Y70.658 E.89138
G1 X50.251 Y70.124 E.0164
G1 X29.749 Y49.623 E.89138
G1 X29.749 Y49.09 E.0164
G1 X50.251 Y69.591 E.89138
G1 X50.251 Y69.057 E.0164
G1 X29.749 Y48.556 E.89138
G1 X29.749 Y48.022 E.0164
G1 X50.251 Y68.524 E.89138
G1 X50.251 Y67.99 E.0164
G1 X29.749 Y47.489 E.89138
G1 X29.749 Y46.955 E.0164
G1 X50.251 Y67.457 E.89138
G1 X50.251 Y66.923 E.0164
G1 X29.749 Y46.422 E.89138
G1 X29.749 Y45.888 E.0164
G1 X50.251 Y66.389 E.89138
G1 X50.251 Y65.856 E.0164
G1 X29.749 Y45.355 E.89138
G1 X29.749 Y44.821 E.0164
G1 X50.251 Y65.322 E.89138
G1 X50.251 Y64.789 E.0164
G1 X29.749 Y44.287 E.89138
G1 X29.749 Y43.754 E.0164
G1 X50.251 Y64.255 E.89138
G1 X50.251 Y63.722 E.0164
G1 X29.749 Y43.22 E.89138
G1 X29.749 Y42.687 E.0164
G1 X50.251 Y63.188 E.89138
G1 X50.251 Y62.654 E.0164
G1 X29.749 Y42.153 E.89138
G1 X29.749 Y41.62 E.0164
G1 X50.251 Y62.121 E.89138
G1 X50.251 Y61.587 E.0164
G1 X29.749 Y41.086 E.89138
G1 X29.749 Y40.553 E.0164
G1 X50.251 Y61.054 E.89138
G1 X50.251 Y60.52 E.0164
G1 X29.749 Y40.019 E.89138
G1 X29.749 Y39.485 E.0164
G1 X50.42 Y60.156 E.89875
; WIPE_START
G1 X49.006 Y58.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X54.947 Y54.545 Z3 F30000
G1 Z2.6
G1 E.8 F1800
G1 F15000
G1 X43.344 Y42.943 E.50447
G3 X43.515 Y43.647 I-3.39 J1.194 E.02232
G1 X54.244 Y54.376 E.46648
G1 X53.71 Y54.376 E.0164
G1 X43.547 Y44.213 E.44188
G3 X43.501 Y44.7 I-2.462 J.01 E.01507
G1 X53.177 Y54.376 E.42071
G1 X52.643 Y54.376 E.0164
G1 X43.403 Y45.136 E.40175
G3 X43.262 Y45.528 I-6.62 J-2.167 E.01282
G1 X52.11 Y54.376 E.3847
G1 X51.576 Y54.376 E.0164
G1 X43.083 Y45.883 E.36927
G3 X42.873 Y46.206 I-1.725 J-.887 E.01188
G1 X51.042 Y54.376 E.35519
G1 X50.509 Y54.376 E.0164
G1 X42.634 Y46.501 E.34238
G3 X42.367 Y46.767 I-1.463 J-1.202 E.01162
G1 X50.251 Y54.651 E.34278
G1 X50.251 Y55.185 E.0164
G1 X42.071 Y47.005 E.35565
G3 X41.746 Y47.213 I-1.202 J-1.52 E.0119
G1 X50.251 Y55.718 E.36979
G1 X50.251 Y56.252 E.0164
G1 X41.389 Y47.39 E.3853
G3 X40.997 Y47.532 I-.906 J-1.886 E.01283
G1 X50.251 Y56.785 E.40233
G1 X50.251 Y57.319 E.0164
G1 X40.561 Y47.63 E.42128
G3 X40.07 Y47.672 I-.456 J-2.437 E.01519
G1 X50.251 Y57.852 E.44265
G1 X50.251 Y58.386 E.0164
G1 X39.504 Y47.639 E.46725
G3 X38.793 Y47.462 I.585 J-3.855 E.02257
G1 X50.251 Y58.92 E.49817
G1 X50.251 Y59.453 E.0164
G1 X29.749 Y38.952 E.89138
G1 X29.749 Y38.418 E.0164
G1 X36.659 Y45.328 E.30042
G3 X36.485 Y44.62 I4.224 J-1.415 E.02244
G1 X29.749 Y37.885 E.29285
G1 X29.749 Y37.351 E.0164
G1 X36.453 Y44.055 E.29146
G3 X36.495 Y43.563 I4.621 J.146 E.01518
G1 X29.749 Y36.818 E.29328
G1 X29.749 Y36.284 E.0164
G1 X36.595 Y43.13 E.29764
G3 X36.736 Y42.737 I2.037 J.508 E.01285
G1 X29.749 Y35.75 E.30376
G1 X29.749 Y35.217 E.0164
G1 X36.912 Y42.379 E.31141
G3 X37.119 Y42.053 I1.732 J.875 E.0119
G1 X29.749 Y34.683 E.32044
G1 X29.749 Y34.15 E.0164
G1 X37.357 Y41.757 E.33076
G3 X37.622 Y41.489 I1.472 J1.194 E.01162
G1 X30.008 Y33.874 E.33108
G1 X30.541 Y33.874 E.0164
G1 X37.916 Y41.25 E.32067
G3 X38.241 Y41.041 I6.521 J9.773 E.01187
G1 X31.075 Y33.874 E.31158
G1 X31.608 Y33.874 E.0164
G1 X38.598 Y40.865 E.30393
G3 X38.991 Y40.724 I.899 J1.892 E.01285
G1 X32.142 Y33.874 E.29781
G1 X32.675 Y33.874 E.0164
G1 X39.426 Y40.624 E.29349
G3 X39.917 Y40.582 I.485 J2.785 E.01519
G1 X33.209 Y33.874 E.29166
G1 X33.743 Y33.874 E.0164
G1 X40.478 Y40.61 E.29286
G3 X41.182 Y40.78 I-.491 J3.574 E.02229
G1 X34.276 Y33.874 E.30026
G1 X34.81 Y33.874 E.0164
G1 X55.311 Y54.376 E.89138
G1 X55.845 Y54.376 E.0164
G1 X35.343 Y33.874 E.89138
G1 X35.877 Y33.874 E.0164
G1 X56.378 Y54.376 E.89138
G1 X56.912 Y54.376 E.0164
G1 X36.41 Y33.874 E.89138
G1 X36.944 Y33.874 E.0164
G1 X57.445 Y54.376 E.89138
G1 X57.979 Y54.376 E.0164
G1 X37.478 Y33.874 E.89138
G1 X38.011 Y33.874 E.0164
G1 X58.512 Y54.376 E.89138
G1 X59.046 Y54.376 E.0164
G1 X38.545 Y33.874 E.89138
M73 P81 R12
G1 X39.078 Y33.874 E.0164
G1 X59.58 Y54.376 E.89138
G1 X60.113 Y54.376 E.0164
G1 X39.612 Y33.874 E.89138
G1 X40.145 Y33.874 E.0164
G1 X60.647 Y54.376 E.89138
G1 X61.18 Y54.376 E.0164
G1 X40.679 Y33.874 E.89138
G1 X41.213 Y33.874 E.0164
G1 X61.714 Y54.376 E.89138
G1 X62.247 Y54.376 E.0164
G1 X41.746 Y33.874 E.89138
G1 X42.28 Y33.874 E.0164
G1 X62.781 Y54.376 E.89138
G1 X63.315 Y54.376 E.0164
G1 X42.813 Y33.874 E.89138
G1 X43.347 Y33.874 E.0164
G1 X63.848 Y54.376 E.89138
G1 X64.382 Y54.376 E.0164
G1 X43.88 Y33.874 E.89138
G1 X44.414 Y33.874 E.0164
G1 X64.915 Y54.376 E.89138
G1 X65.449 Y54.376 E.0164
G1 X44.948 Y33.874 E.89138
G1 X45.481 Y33.874 E.0164
G1 X65.982 Y54.376 E.89138
G1 X66.516 Y54.376 E.0164
G1 X46.015 Y33.874 E.89138
G1 X46.548 Y33.874 E.0164
G1 X67.05 Y54.376 E.89138
G1 X67.583 Y54.376 E.0164
G1 X47.082 Y33.874 E.89138
G1 X47.615 Y33.874 E.0164
G1 X68.117 Y54.376 E.89138
G1 X68.65 Y54.376 E.0164
G1 X48.149 Y33.874 E.89138
G1 X48.682 Y33.874 E.0164
G1 X69.184 Y54.376 E.89138
G1 X69.717 Y54.376 E.0164
G1 X49.216 Y33.874 E.89138
G1 X49.75 Y33.874 E.0164
G1 X70.251 Y54.376 E.89138
G1 X70.784 Y54.376 E.0164
G1 X50.283 Y33.874 E.89138
G1 X50.817 Y33.874 E.0164
G1 X71.318 Y54.376 E.89138
G1 X71.852 Y54.376 E.0164
G1 X51.35 Y33.874 E.89138
G1 X51.884 Y33.874 E.0164
G1 X72.385 Y54.376 E.89138
G1 X72.919 Y54.376 E.0164
G1 X52.417 Y33.874 E.89138
G1 X52.951 Y33.874 E.0164
G1 X73.452 Y54.376 E.89138
G1 X73.986 Y54.376 E.0164
G1 X53.485 Y33.874 E.89138
G1 X54.018 Y33.874 E.0164
G1 X74.519 Y54.376 E.89138
G1 X75.053 Y54.376 E.0164
G1 X54.552 Y33.874 E.89138
G1 X55.085 Y33.874 E.0164
G1 X75.587 Y54.376 E.89138
G1 X76.12 Y54.376 E.0164
G1 X55.619 Y33.874 E.89138
G1 X56.152 Y33.874 E.0164
G1 X76.654 Y54.376 E.89138
G1 X77.187 Y54.376 E.0164
G1 X56.686 Y33.874 E.89138
G1 X57.22 Y33.874 E.0164
G1 X77.721 Y54.376 E.89138
G1 X78.254 Y54.376 E.0164
G1 X57.753 Y33.874 E.89138
G1 X58.287 Y33.874 E.0164
G1 X78.788 Y54.376 E.89138
G1 X79.322 Y54.376 E.0164
G1 X58.82 Y33.874 E.89138
G1 X59.354 Y33.874 E.0164
G1 X79.855 Y54.376 E.89138
G1 X80.389 Y54.376 E.0164
G1 X59.887 Y33.874 E.89138
G1 X60.421 Y33.874 E.0164
G1 X80.922 Y54.376 E.89138
G1 X81.456 Y54.376 E.0164
G1 X60.955 Y33.874 E.89138
G1 X61.488 Y33.874 E.0164
G1 X81.989 Y54.376 E.89138
G1 X82.523 Y54.376 E.0164
G1 X62.022 Y33.874 E.89138
G1 X62.555 Y33.874 E.0164
G1 X83.057 Y54.376 E.89138
G1 X83.59 Y54.376 E.0164
G1 X63.089 Y33.874 E.89138
G1 X63.622 Y33.874 E.0164
G1 X84.124 Y54.376 E.89138
G1 X84.657 Y54.376 E.0164
G1 X64.156 Y33.874 E.89138
G1 X64.69 Y33.874 E.0164
G1 X85.191 Y54.376 E.89138
G1 X85.724 Y54.376 E.0164
G1 X65.223 Y33.874 E.89138
G1 X65.757 Y33.874 E.0164
G1 X86.258 Y54.376 E.89138
G1 X86.792 Y54.376 E.0164
G1 X66.29 Y33.874 E.89138
G1 X66.824 Y33.874 E.0164
G1 X87.325 Y54.376 E.89138
G1 X87.859 Y54.376 E.0164
G1 X67.357 Y33.874 E.89138
G1 X67.891 Y33.874 E.0164
G1 X88.392 Y54.376 E.89138
G1 X88.926 Y54.376 E.0164
G1 X68.425 Y33.874 E.89138
G1 X68.958 Y33.874 E.0164
G1 X89.459 Y54.376 E.89138
G1 X89.993 Y54.376 E.0164
G1 X69.492 Y33.874 E.89138
G1 X70.025 Y33.874 E.0164
G1 X90.696 Y54.545 E.89875
G1 X92.083 Y37.557 F30000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
M204 S2000
G1 X89.77 Y35.244 E.1005
G1 X89.181 Y35.188
G1 X92.138 Y38.146 E.12851
G1 X92.094 Y38.634
G1 X88.647 Y35.188 E.14976
G1 X88.114 Y35.188
G1 X91.985 Y39.059 E.16822
G1 X91.929 Y39.537
G1 X87.58 Y35.187 E.18901
G1 X87.046 Y35.187
G1 X92.114 Y40.254 E.22021
G1 X92.138 Y40.812
G1 X86.526 Y35.2 E.24388
G1 X86.055 Y35.262
G1 X92.137 Y41.344 E.26432
G1 X92.137 Y41.877
G1 X85.448 Y35.188 E.29065
G1 X84.915 Y35.188
G1 X92.126 Y42.399 E.31335
G1 X92.046 Y42.853
G1 X87.838 Y38.645 E.18285
G1 X87.699 Y38.506
G1 X84.381 Y35.188 E.1442
G1 X83.847 Y35.187
G1 X91.913 Y43.253 E.35048
G1 X91.735 Y43.608
G1 X83.314 Y35.187 E.36596
G1 X82.789 Y35.196
G1 X91.52 Y43.926 E.3794
G1 X91.27 Y44.21
G1 X82.326 Y35.266 E.38868
G1 X81.92 Y35.393
G1 X90.985 Y44.458 E.39395
G1 X90.665 Y44.672
G1 X81.559 Y35.566 E.3957
G1 X81.236 Y35.776
G1 X90.307 Y44.847 E.39417
G1 X89.904 Y44.977
G1 X80.949 Y36.021 E.38917
G1 X80.697 Y36.303
G1 X89.447 Y45.053 E.38023
G1 X88.924 Y45.063
G1 X80.479 Y36.618 E.36699
G1 X80.298 Y36.971
G1 X88.39 Y45.063 E.35163
G1 X87.857 Y45.062
G1 X80.161 Y37.367 E.33439
G1 X80.078 Y37.817
G1 X87.323 Y45.062 E.31483
G1 X86.789 Y45.062
G1 X80.063 Y38.336 E.29227
G1 X80.063 Y38.869
G1 X86.195 Y45 E.26645
G1 X85.707 Y45.046
G1 X80.063 Y39.402 E.24525
G1 X80.063 Y39.935
G1 X85.191 Y45.063 E.22285
G1 X84.657 Y45.063
G1 X80.062 Y40.468 E.19968
G1 X80.062 Y41.001
G1 X84.124 Y45.062 E.1765
G1 X83.59 Y45.062
G1 X80.062 Y41.534 E.15332
G1 X80.062 Y42.067
G1 X83.056 Y45.062 E.13014
G1 X82.476 Y45.015
G1 X80.11 Y42.649 E.10283
M204 S10000
G1 X82.085 Y44.928 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.216109
G1 F15000
G1 X81.77 Y44.709 E.00541
; LINE_WIDTH: 0.248786
G1 X81.685 Y44.648 E.00176
; LINE_WIDTH: 0.283807
G1 X81.581 Y44.569 E.00256
; LINE_WIDTH: 0.32293
G3 X81.448 Y44.464 I2.84 J-3.738 E.00387
; LINE_WIDTH: 0.368869
G3 X81.19 Y44.24 I5.142 J-6.168 E.00907
; LINE_WIDTH: 0.385717
G3 X80.701 Y43.726 I3.911 J-4.21 E.01984
; LINE_WIDTH: 0.338669
G1 X80.607 Y43.611 E.00358
; LINE_WIDTH: 0.303187
G1 X80.511 Y43.486 E.00334
; LINE_WIDTH: 0.267174
G1 X80.449 Y43.402 E.00191
; LINE_WIDTH: 0.237238
G1 X80.4 Y43.332 E.00135
; LINE_WIDTH: 0.207406
G1 X80.3 Y43.186 E.00238
; LINE_WIDTH: 0.176171
G1 X80.2 Y43.039 E.00193
; WIPE_START
G1 X80.3 Y43.186 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.082 Y39.684 Z3 F30000
G1 X91.978 Y37.156 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.162436
G1 F15000
G1 X91.834 Y36.943 E.00251
; LINE_WIDTH: 0.198891
G1 X91.778 Y36.863 E.00124
; LINE_WIDTH: 0.235082
G1 X91.705 Y36.763 E.00193
; LINE_WIDTH: 0.275422
G1 X91.604 Y36.632 E.00314
; LINE_WIDTH: 0.311756
G1 X91.512 Y36.518 E.00321
; LINE_WIDTH: 0.357014
G2 X90.852 Y35.851 I-4.59 J3.882 E.02405
; LINE_WIDTH: 0.32271
G1 X90.735 Y35.755 E.00344
; LINE_WIDTH: 0.290095
G1 X90.614 Y35.66 E.00311
; LINE_WIDTH: 0.256953
G1 X90.536 Y35.603 E.00168
; LINE_WIDTH: 0.228482
G1 X90.459 Y35.545 E.00145
; LINE_WIDTH: 0.189936
G1 X90.171 Y35.343 E.00422
G1 X88.006 Y35.296 F30000
; LINE_WIDTH: 0.114325
G1 F15000
G1 X87.879 Y35.169 E.00105
G1 X88.53 Y33.705 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42021
G1 F15000
G1 X89.881 Y35.055 E.05873
G1 X89.552 Y34.999 E.01027
G1 X89.274 Y34.981 E.00857
G1 X88.167 Y33.874 E.04814
G1 X87.633 Y33.874 E.0164
G1 X88.739 Y34.981 E.04811
G1 X88.205 Y34.98 E.01642
G1 X87.099 Y33.874 E.04809
G1 X86.566 Y33.874 E.0164
G1 X87.671 Y34.98 E.04807
G1 X87.137 Y34.98 E.01642
G1 X86.032 Y33.874 E.04805
G1 X85.499 Y33.874 E.0164
G1 X86.61 Y34.985 E.04831
G1 X86.141 Y35.051 E.01454
G1 X84.965 Y33.874 E.05114
G1 X84.432 Y33.874 E.0164
G1 X85.541 Y34.983 E.04822
G1 X85.005 Y34.981 E.01648
G1 X83.898 Y33.874 E.04811
G1 X83.364 Y33.874 E.0164
G1 X84.471 Y34.98 E.04809
G1 X83.937 Y34.98 E.01642
G1 X82.831 Y33.874 E.04808
G1 X82.297 Y33.874 E.0164
G1 X83.403 Y34.98 E.04806
G1 X82.872 Y34.983 E.01631
G1 X81.764 Y33.874 E.0482
G1 X81.23 Y33.874 E.0164
G1 X82.394 Y35.038 E.0506
G1 X81.975 Y35.152 E.01336
G1 X80.697 Y33.874 E.05556
G1 X80.163 Y33.874 E.0164
G1 X81.599 Y35.31 E.06242
G1 X81.26 Y35.505 E.01202
G1 X79.629 Y33.874 E.07088
G1 X79.096 Y33.874 E.0164
G1 X80.957 Y35.735 E.08091
G1 X80.685 Y35.997 E.0116
G1 X78.562 Y33.874 E.09228
G1 X78.029 Y33.874 E.0164
G1 X80.445 Y36.291 E.10506
G1 X80.24 Y36.619 E.01191
G1 X77.495 Y33.874 E.11934
G1 X76.962 Y33.874 E.0164
G1 X80.07 Y36.983 E.13515
G1 X79.943 Y37.389 E.01309
G1 X76.428 Y33.874 E.15281
G1 X75.895 Y33.874 E.0164
G1 X79.867 Y37.847 E.17271
G1 X79.856 Y38.369 E.01608
G1 X75.361 Y33.874 E.19544
G1 X74.827 Y33.874 E.0164
G1 X79.856 Y38.903 E.21863
G1 X79.856 Y39.436 E.0164
G1 X74.294 Y33.874 E.24182
G1 X73.76 Y33.874 E.0164
G1 X79.855 Y39.969 E.26501
G1 X79.855 Y40.503 E.0164
G1 X73.227 Y33.874 E.2882
G1 X72.693 Y33.874 E.0164
G1 X79.855 Y41.036 E.31139
G1 X79.855 Y41.569 E.0164
G1 X72.16 Y33.874 E.33457
G1 X71.626 Y33.874 E.0164
G1 X79.854 Y42.103 E.35776
G1 X79.868 Y42.419 E.00974
G1 X79.907 Y42.689 E.00837
G1 X71.092 Y33.874 E.38324
G1 X70.559 Y33.874 E.0164
G1 X80.159 Y43.475 E.41741
G1 X80.424 Y43.931 E.01622
G1 X80.773 Y44.346 E.01668
G1 X80.977 Y44.534 E.00853
G1 X81.188 Y44.696 E.00817
G1 X81.65 Y44.966 E.01644
G1 X91.06 Y54.376 E.40914
G1 X91.594 Y54.376 E.0164
G1 X82.436 Y45.218 E.39816
G1 X82.705 Y45.257 E.00835
G1 X83.02 Y45.269 E.0097
G1 X92.127 Y54.376 E.39595
G1 X92.661 Y54.376 E.0164
G1 X83.554 Y45.269 E.39594
G1 X84.088 Y45.27 E.01642
G1 X93.194 Y54.376 E.39592
G1 X93.728 Y54.376 E.0164
G1 X84.622 Y45.27 E.3959
G1 X85.156 Y45.27 E.01642
G1 X94.262 Y54.376 E.39589
G1 X94.795 Y54.376 E.0164
G1 X85.676 Y45.257 E.39648
G1 X86.1 Y45.191 E.01317
G1 X86.157 Y45.204 E.00182
G1 X95.329 Y54.376 E.39876
G1 X95.862 Y54.376 E.0164
G1 X86.755 Y45.269 E.39596
G1 X87.289 Y45.269 E.01642
G1 X96.396 Y54.376 E.39594
G1 X96.929 Y54.376 E.0164
G1 X87.823 Y45.27 E.39592
G1 X88.357 Y45.27 E.01642
G1 X97.463 Y54.376 E.3959
G1 X97.996 Y54.376 E.0164
G1 X88.891 Y45.27 E.39588
G1 X89.417 Y45.263 E.01617
G1 X98.53 Y54.376 E.39621
G1 X99.064 Y54.376 E.0164
G1 X89.883 Y45.195 E.39918
G1 X90.295 Y45.073 E.01321
G1 X99.597 Y54.376 E.40445
G1 X100.131 Y54.376 E.0164
G1 X90.664 Y44.909 E.4116
G1 X90.995 Y44.707 E.01193
G1 X100.664 Y54.376 E.4204
G1 X101.198 Y54.376 E.0164
G1 X91.294 Y44.472 E.43062
G1 X91.56 Y44.204 E.0116
G1 X101.731 Y54.376 E.44227
G1 X102.265 Y54.376 E.0164
G1 X91.794 Y43.904 E.45528
G1 X91.993 Y43.57 E.01197
G1 X102.799 Y54.376 E.46983
G1 X103.332 Y54.376 E.0164
G1 X92.156 Y43.199 E.48594
G1 X92.274 Y42.784 E.01327
G1 X103.866 Y54.376 E.50399
G1 X104.399 Y54.376 E.0164
G1 X92.339 Y42.315 E.52437
G1 X92.344 Y41.787 E.01625
G1 X104.933 Y54.376 E.54734
G1 X105.466 Y54.376 E.0164
G1 X92.345 Y41.254 E.57051
G1 X92.346 Y40.721 E.01638
G1 X106 Y54.376 E.59369
G1 X106.534 Y54.376 E.0164
G1 X92.309 Y40.151 E.61848
G1 X92.235 Y39.803 E.01094
G1 X92.101 Y39.41 E.01277
G1 X107.067 Y54.376 E.6507
G1 X107.601 Y54.376 E.0164
G1 X92.221 Y38.996 E.66869
G1 X92.315 Y38.556 E.01382
G1 X108.134 Y54.376 E.68781
G1 X108.668 Y54.376 E.0164
G1 X92.344 Y38.052 E.70972
G1 X92.318 Y37.718 E.01029
G1 X92.271 Y37.445 E.00853
G1 X109.201 Y54.376 E.73613
G1 X109.735 Y54.376 E.0164
G1 X89.234 Y33.874 E.89138
G1 X89.767 Y33.874 E.0164
G1 X110.269 Y54.376 E.89138
G1 X110.802 Y54.376 E.0164
G1 X90.301 Y33.874 E.89138
G1 X90.834 Y33.874 E.0164
G1 X111.336 Y54.376 E.89138
G1 X111.869 Y54.376 E.0164
G1 X91.368 Y33.874 E.89138
G1 X91.902 Y33.874 E.0164
G1 X112.403 Y54.376 E.89138
G1 X112.936 Y54.376 E.0164
G1 X92.435 Y33.874 E.89138
G1 X92.969 Y33.874 E.0164
G1 X113.47 Y54.376 E.89138
G1 X114.004 Y54.376 E.0164
G1 X93.502 Y33.874 E.89138
G1 X94.036 Y33.874 E.0164
G1 X114.537 Y54.376 E.89138
G1 X115.071 Y54.376 E.0164
G1 X94.569 Y33.874 E.89138
G1 X95.103 Y33.874 E.0164
G1 X115.604 Y54.376 E.89138
G1 X116.138 Y54.376 E.0164
G1 X95.637 Y33.874 E.89138
G1 X96.17 Y33.874 E.0164
G1 X116.671 Y54.376 E.89138
G1 X117.205 Y54.376 E.0164
G1 X96.704 Y33.874 E.89138
G1 X97.237 Y33.874 E.0164
G1 X117.739 Y54.376 E.89138
G1 X118.272 Y54.376 E.0164
G1 X97.771 Y33.874 E.89138
G1 X98.304 Y33.874 E.0164
G1 X118.806 Y54.376 E.89138
G1 X119.339 Y54.376 E.0164
G1 X98.838 Y33.874 E.89138
G1 X99.372 Y33.874 E.0164
G1 X119.873 Y54.376 E.89138
G1 X120.406 Y54.376 E.0164
G1 X99.905 Y33.874 E.89138
G1 X100.439 Y33.874 E.0164
G1 X120.94 Y54.376 E.89138
G1 X121.474 Y54.376 E.0164
G1 X100.972 Y33.874 E.89138
G1 X101.506 Y33.874 E.0164
G1 X122.007 Y54.376 E.89138
G1 X122.541 Y54.376 E.0164
G1 X102.039 Y33.874 E.89138
G1 X102.573 Y33.874 E.0164
G1 X123.074 Y54.376 E.89138
G1 X123.608 Y54.376 E.0164
G1 X103.107 Y33.874 E.89138
G1 X103.64 Y33.874 E.0164
G1 X124.141 Y54.376 E.89138
G1 X124.675 Y54.376 E.0164
G1 X104.174 Y33.874 E.89138
G1 X104.707 Y33.874 E.0164
G1 X125.208 Y54.376 E.89138
G1 X125.742 Y54.376 E.0164
G1 X105.241 Y33.874 E.89138
G1 X105.774 Y33.874 E.0164
G1 X126.276 Y54.376 E.89138
G1 X126.809 Y54.376 E.0164
G1 X106.308 Y33.874 E.89138
G1 X106.841 Y33.874 E.0164
G1 X127.343 Y54.376 E.89138
G1 X127.876 Y54.376 E.0164
G1 X107.375 Y33.874 E.89138
G1 X107.909 Y33.874 E.0164
G1 X128.41 Y54.376 E.89138
G1 X128.943 Y54.376 E.0164
G1 X108.442 Y33.874 E.89138
G1 X108.976 Y33.874 E.0164
G1 X129.477 Y54.376 E.89138
G1 X130.011 Y54.376 E.0164
G1 X109.509 Y33.874 E.89138
G1 X110.043 Y33.874 E.0164
G1 X130.544 Y54.376 E.89138
G1 X131.078 Y54.376 E.0164
G1 X110.576 Y33.874 E.89138
G1 X111.11 Y33.874 E.0164
G1 X131.611 Y54.376 E.89138
G1 X132.145 Y54.376 E.0164
G1 X111.644 Y33.874 E.89138
G1 X112.177 Y33.874 E.0164
G1 X132.848 Y54.545 E.89875
; WIPE_START
G1 X131.434 Y53.131 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.141 Y46.245 Z3 F30000
G1 X122.145 Y33.705 Z3
G1 Z2.6
G1 E.8 F1800
G1 F15000
G1 X129.24 Y40.8 E.30849
G2 X128.523 Y40.616 I-1.306 J3.6 E.02281
G1 X121.781 Y33.874 E.2931
G1 X121.248 Y33.874 E.0164
G1 X127.956 Y40.583 E.29167
G2 X127.459 Y40.619 I-.04 J2.902 E.01535
G1 X120.714 Y33.874 E.29324
G1 X120.181 Y33.874 E.0164
G1 X127.022 Y40.715 E.29744
G2 X126.626 Y40.854 I.493 J2.044 E.0129
G1 X119.647 Y33.874 E.30345
G1 X119.114 Y33.874 E.0164
G1 X126.267 Y41.027 E.31101
G2 X125.939 Y41.233 I.867 J1.742 E.01192
G1 X118.58 Y33.874 E.31997
G1 X118.046 Y33.874 E.0164
G1 X125.642 Y41.47 E.33025
G2 X125.374 Y41.736 I1.195 J1.471 E.01162
G1 X117.513 Y33.874 E.34181
G1 X116.979 Y33.874 E.0164
G1 X125.135 Y42.03 E.35461
G2 X124.925 Y42.354 I1.515 J1.211 E.01188
G1 X116.446 Y33.874 E.36869
G1 X115.912 Y33.874 E.0164
G1 X124.747 Y42.709 E.38414
G2 X124.604 Y43.1 I1.883 J.912 E.01281
G1 X115.379 Y33.874 E.40112
G1 X114.845 Y33.874 E.0164
G1 X124.501 Y43.531 E.41985
G2 X124.453 Y44.016 I4.399 J.684 E.015
G1 X114.311 Y33.874 E.44094
G1 X113.778 Y33.874 E.0164
G1 X124.48 Y44.577 E.46534
G2 X124.642 Y45.272 I3.859 J-.53 E.02196
G1 X113.244 Y33.874 E.49555
G1 X112.711 Y33.874 E.0164
G1 X133.212 Y54.376 E.89138
G1 X133.746 Y54.376 E.0164
G1 X126.857 Y47.487 E.29952
G2 X127.551 Y47.648 I1.45 J-4.679 E.02194
G1 X134.279 Y54.376 E.29252
G1 X134.813 Y54.376 E.0164
G1 X128.108 Y47.671 E.29153
G2 X128.596 Y47.625 I.017 J-2.462 E.0151
G1 X135.346 Y54.376 E.2935
G1 X135.88 Y54.376 E.0164
G1 X129.026 Y47.522 E.29798
G2 X129.416 Y47.378 I-.527 J-2.018 E.01278
G1 X136.413 Y54.376 E.30426
G1 X136.947 Y54.376 E.0164
G1 X129.77 Y47.199 E.31204
G2 X130.094 Y46.989 I-.888 J-1.719 E.01188
G1 X137.481 Y54.376 E.32118
G1 X138.014 Y54.376 E.0164
G1 X130.387 Y46.749 E.3316
G2 X130.653 Y46.481 I-1.206 J-1.46 E.01162
G1 X138.548 Y54.376 E.34326
G1 X139.081 Y54.376 E.0164
G1 X130.89 Y46.184 E.35615
G2 X131.098 Y45.858 I-1.526 J-1.202 E.0119
G1 X139.615 Y54.376 E.37032
G1 X140.148 Y54.376 E.0164
G1 X131.274 Y45.501 E.38585
G2 X131.411 Y45.105 I-1.917 J-.884 E.01292
G1 X140.682 Y54.376 E.4031
G1 X141.216 Y54.376 E.0164
G1 X131.506 Y44.666 E.42218
G2 X131.549 Y44.176 I-2.432 J-.462 E.01516
G1 X141.749 Y54.376 E.44349
G1 X142.283 Y54.376 E.0164
G1 X131.508 Y43.601 E.46846
G2 X131.322 Y42.882 I-3.518 J.526 E.02289
G1 X142.816 Y54.376 E.49975
G1 X143.35 Y54.376 E.0164
G1 X122.849 Y33.874 E.89138
G1 X123.382 Y33.874 E.0164
G1 X143.883 Y54.376 E.89138
G1 X144.417 Y54.376 E.0164
G1 X123.916 Y33.874 E.89138
G1 X124.449 Y33.874 E.0164
G1 X144.951 Y54.376 E.89138
G1 X145.484 Y54.376 E.0164
G1 X124.983 Y33.874 E.89138
G1 X125.516 Y33.874 E.0164
G1 X146.018 Y54.376 E.89138
G1 X146.551 Y54.376 E.0164
G1 X126.05 Y33.874 E.89138
G1 X126.584 Y33.874 E.0164
G1 X147.085 Y54.376 E.89138
G1 X147.618 Y54.376 E.0164
G1 X127.117 Y33.874 E.89138
G1 X127.651 Y33.874 E.0164
G1 X148.152 Y54.376 E.89138
G1 X148.686 Y54.376 E.0164
G1 X128.184 Y33.874 E.89138
G1 X128.718 Y33.874 E.0164
G1 X149.219 Y54.376 E.89138
G1 X149.753 Y54.376 E.0164
G1 X129.251 Y33.874 E.89138
G1 X129.785 Y33.874 E.0164
G1 X150.286 Y54.376 E.89138
G1 X150.82 Y54.376 E.0164
G1 X130.319 Y33.874 E.89138
G1 X130.852 Y33.874 E.0164
G1 X151.353 Y54.376 E.89138
G1 X151.887 Y54.376 E.0164
G1 X131.386 Y33.874 E.89138
G1 X131.919 Y33.874 E.0164
G1 X152.42 Y54.376 E.89138
G1 X152.954 Y54.376 E.0164
G1 X132.453 Y33.874 E.89138
G1 X132.986 Y33.874 E.0164
G1 X153.488 Y54.376 E.89138
G1 X154.021 Y54.376 E.0164
G1 X133.52 Y33.874 E.89138
G1 X134.053 Y33.874 E.0164
G1 X154.555 Y54.376 E.89138
G1 X155.088 Y54.376 E.0164
G1 X134.587 Y33.874 E.89138
G1 X135.121 Y33.874 E.0164
G1 X155.622 Y54.376 E.89138
G1 X156.155 Y54.376 E.0164
G1 X135.654 Y33.874 E.89138
G1 X136.188 Y33.874 E.0164
G1 X156.689 Y54.376 E.89138
G1 X157.223 Y54.376 E.0164
G1 X136.721 Y33.874 E.89138
G1 X137.255 Y33.874 E.0164
G1 X157.756 Y54.376 E.89138
G1 X158.29 Y54.376 E.0164
G1 X137.788 Y33.874 E.89138
M73 P81 R11
G1 X138.322 Y33.874 E.0164
G1 X158.823 Y54.376 E.89138
G1 X159.357 Y54.376 E.0164
G1 X138.856 Y33.874 E.89138
G1 X139.389 Y33.874 E.0164
G1 X159.89 Y54.376 E.89138
G1 X160.424 Y54.376 E.0164
G1 X139.923 Y33.874 E.89138
G1 X140.456 Y33.874 E.0164
G1 X160.958 Y54.376 E.89138
G1 X161.491 Y54.376 E.0164
G1 X140.99 Y33.874 E.89138
G1 X141.523 Y33.874 E.0164
G1 X162.025 Y54.376 E.89138
G1 X162.558 Y54.376 E.0164
G1 X142.057 Y33.874 E.89138
G1 X142.591 Y33.874 E.0164
G1 X163.092 Y54.376 E.89138
G1 X163.625 Y54.376 E.0164
G1 X143.124 Y33.874 E.89138
G1 X143.658 Y33.874 E.0164
G1 X164.159 Y54.376 E.89138
G1 X164.693 Y54.376 E.0164
G1 X144.191 Y33.874 E.89138
G1 X144.725 Y33.874 E.0164
G1 X165.226 Y54.376 E.89138
G1 X165.76 Y54.376 E.0164
G1 X145.258 Y33.874 E.89138
G1 X145.792 Y33.874 E.0164
G1 X166.293 Y54.376 E.89138
G1 X166.827 Y54.376 E.0164
G1 X146.326 Y33.874 E.89138
G1 X146.859 Y33.874 E.0164
G1 X167.36 Y54.376 E.89138
G1 X167.894 Y54.376 E.0164
G1 X147.393 Y33.874 E.89138
G1 X147.926 Y33.874 E.0164
G1 X168.428 Y54.376 E.89138
G1 X168.961 Y54.376 E.0164
G1 X148.46 Y33.874 E.89138
G1 X148.993 Y33.874 E.0164
G1 X169.495 Y54.376 E.89138
G1 X170.028 Y54.376 E.0164
G1 X149.527 Y33.874 E.89138
G1 X150.061 Y33.874 E.0164
G1 X170.562 Y54.376 E.89138
G1 X171.095 Y54.376 E.0164
G1 X150.594 Y33.874 E.89138
G1 X151.128 Y33.874 E.0164
G1 X171.629 Y54.376 E.89138
G1 X172.163 Y54.376 E.0164
G1 X151.661 Y33.874 E.89138
G1 X152.195 Y33.874 E.0164
G1 X172.696 Y54.376 E.89138
G1 X173.23 Y54.376 E.0164
G1 X152.728 Y33.874 E.89138
G1 X153.262 Y33.874 E.0164
G1 X173.763 Y54.376 E.89138
G1 X174.297 Y54.376 E.0164
G1 X153.796 Y33.874 E.89138
G1 X154.329 Y33.874 E.0164
G1 X174.83 Y54.376 E.89138
G1 X175.364 Y54.376 E.0164
G1 X154.863 Y33.874 E.89138
G1 X155.396 Y33.874 E.0164
G1 X175.898 Y54.376 E.89138
G1 X176.431 Y54.376 E.0164
G1 X155.93 Y33.874 E.89138
G1 X156.463 Y33.874 E.0164
G1 X176.965 Y54.376 E.89138
G1 X177.498 Y54.376 E.0164
G1 X156.997 Y33.874 E.89138
G1 X157.531 Y33.874 E.0164
G1 X178.032 Y54.376 E.89138
G1 X178.565 Y54.376 E.0164
G1 X158.064 Y33.874 E.89138
G1 X158.598 Y33.874 E.0164
G1 X179.099 Y54.376 E.89138
G1 X179.632 Y54.376 E.0164
G1 X159.131 Y33.874 E.89138
G1 X159.665 Y33.874 E.0164
G1 X180.166 Y54.376 E.89138
G1 X180.7 Y54.376 E.0164
G1 X160.198 Y33.874 E.89138
G1 X160.732 Y33.874 E.0164
G1 X181.233 Y54.376 E.89138
G1 X181.767 Y54.376 E.0164
G1 X161.265 Y33.874 E.89138
G1 X161.799 Y33.874 E.0164
G1 X182.3 Y54.376 E.89138
G1 X182.834 Y54.376 E.0164
G1 X162.333 Y33.874 E.89138
G1 X162.866 Y33.874 E.0164
G1 X183.367 Y54.376 E.89138
G1 X183.901 Y54.376 E.0164
G1 X163.4 Y33.874 E.89138
G1 X163.933 Y33.874 E.0164
M73 P82 R11
G1 X184.435 Y54.376 E.89138
G1 X184.968 Y54.376 E.0164
G1 X164.467 Y33.874 E.89138
G1 X165 Y33.874 E.0164
G1 X185.502 Y54.376 E.89138
G1 X186.035 Y54.376 E.0164
G1 X165.534 Y33.874 E.89138
G1 X166.068 Y33.874 E.0164
G1 X186.569 Y54.376 E.89138
G1 X187.102 Y54.376 E.0164
G1 X166.601 Y33.874 E.89138
G1 X167.135 Y33.874 E.0164
G1 X187.636 Y54.376 E.89138
G1 X188.17 Y54.376 E.0164
G1 X167.668 Y33.874 E.89138
G1 X168.202 Y33.874 E.0164
G1 X188.703 Y54.376 E.89138
G1 X189.237 Y54.376 E.0164
G1 X168.735 Y33.874 E.89138
G1 X169.269 Y33.874 E.0164
G1 X189.77 Y54.376 E.89138
G1 X190.304 Y54.376 E.0164
G1 X169.803 Y33.874 E.89138
G1 X170.336 Y33.874 E.0164
G1 X190.837 Y54.376 E.89138
G1 X191.371 Y54.376 E.0164
G1 X170.87 Y33.874 E.89138
G1 X171.403 Y33.874 E.0164
G1 X191.905 Y54.376 E.89138
G1 X192.438 Y54.376 E.0164
G1 X171.937 Y33.874 E.89138
G1 X172.47 Y33.874 E.0164
G1 X192.972 Y54.376 E.89138
G1 X193.505 Y54.376 E.0164
G1 X173.004 Y33.874 E.89138
G1 X173.538 Y33.874 E.0164
G1 X194.039 Y54.376 E.89138
G1 X194.572 Y54.376 E.0164
G1 X174.071 Y33.874 E.89138
G1 X174.605 Y33.874 E.0164
G1 X195.106 Y54.376 E.89138
G1 X195.64 Y54.376 E.0164
G1 X175.138 Y33.874 E.89138
G1 X175.672 Y33.874 E.0164
G1 X196.173 Y54.376 E.89138
G1 X196.707 Y54.376 E.0164
G1 X176.205 Y33.874 E.89138
G1 X176.739 Y33.874 E.0164
G1 X197.24 Y54.376 E.89138
G1 X197.774 Y54.376 E.0164
G1 X177.273 Y33.874 E.89138
G1 X177.806 Y33.874 E.0164
G1 X198.307 Y54.376 E.89138
G1 X198.841 Y54.376 E.0164
G1 X178.34 Y33.874 E.89138
G1 X178.873 Y33.874 E.0164
G1 X199.375 Y54.376 E.89138
G1 X199.908 Y54.376 E.0164
G1 X179.407 Y33.874 E.89138
G1 X179.94 Y33.874 E.0164
G1 X200.442 Y54.376 E.89138
G1 X200.975 Y54.376 E.0164
G1 X180.474 Y33.874 E.89138
G1 X181.008 Y33.874 E.0164
G1 X201.509 Y54.376 E.89138
G1 X202.042 Y54.376 E.0164
G1 X181.541 Y33.874 E.89138
G1 X182.075 Y33.874 E.0164
G1 X202.576 Y54.376 E.89138
G1 X203.11 Y54.376 E.0164
G1 X182.608 Y33.874 E.89138
G1 X183.142 Y33.874 E.0164
G1 X203.643 Y54.376 E.89138
G1 X204.177 Y54.376 E.0164
G1 X183.675 Y33.874 E.89138
G1 X184.209 Y33.874 E.0164
G1 X204.71 Y54.376 E.89138
G1 X205.244 Y54.376 E.0164
G1 X184.743 Y33.874 E.89138
G1 X185.276 Y33.874 E.0164
G1 X226.251 Y74.849 E1.78154
G1 X226.251 Y74.315 E.0164
G1 X185.81 Y33.874 E1.75834
G1 X186.343 Y33.874 E.0164
G1 X226.251 Y73.782 E1.73514
G1 X226.251 Y73.248 E.0164
G1 X186.877 Y33.874 E1.71194
G1 X187.41 Y33.874 E.0164
G1 X226.251 Y72.715 E1.68874
G1 X226.251 Y72.181 E.0164
G1 X187.944 Y33.874 E1.66554
G1 X188.477 Y33.874 E.0164
G1 X226.251 Y71.648 E1.64234
G1 X226.251 Y71.114 E.0164
G1 X189.011 Y33.874 E1.61914
G1 X189.545 Y33.874 E.0164
G1 X226.251 Y70.58 E1.59594
G1 X226.251 Y70.047 E.0164
G1 X190.078 Y33.874 E1.57275
G1 X190.612 Y33.874 E.0164
G1 X226.251 Y69.513 E1.54955
G1 X226.251 Y68.98 E.0164
G1 X191.145 Y33.874 E1.52635
G1 X191.679 Y33.874 E.0164
G1 X226.251 Y68.446 E1.50315
G1 X226.251 Y67.913 E.0164
G1 X192.212 Y33.874 E1.47995
G1 X192.746 Y33.874 E.0164
G1 X226.251 Y67.379 E1.45675
G1 X226.251 Y66.845 E.0164
G1 X193.28 Y33.874 E1.43355
G1 X193.813 Y33.874 E.0164
G1 X226.251 Y66.312 E1.41035
G1 X226.251 Y65.778 E.0164
G1 X194.347 Y33.874 E1.38715
G1 X194.88 Y33.874 E.0164
G1 X226.251 Y65.245 E1.36395
G1 X226.251 Y64.711 E.0164
G1 X195.414 Y33.874 E1.34075
G1 X195.947 Y33.874 E.0164
G1 X226.251 Y64.178 E1.31756
G1 X226.251 Y63.644 E.0164
G1 X196.481 Y33.874 E1.29436
G1 X197.015 Y33.874 E.0164
G1 X226.251 Y63.11 E1.27116
G1 X226.251 Y62.577 E.0164
G1 X197.548 Y33.874 E1.24796
G1 X198.082 Y33.874 E.0164
G1 X226.251 Y62.043 E1.22476
G1 X226.251 Y61.51 E.0164
G1 X198.615 Y33.874 E1.20156
G1 X199.149 Y33.874 E.0164
G1 X226.251 Y60.976 E1.17836
G1 X226.251 Y60.443 E.0164
G1 X199.682 Y33.874 E1.15516
G1 X200.216 Y33.874 E.0164
G1 X226.42 Y60.079 E1.13934
G1 X226.42 Y49.941 F30000
G1 F15000
G1 X219.3 Y42.821 E.30959
G3 X219.501 Y43.555 I-3.418 J1.332 E.02347
G1 X226.251 Y50.305 E.29345
G1 X226.251 Y50.838 E.0164
G1 X219.551 Y44.139 E.2913
G3 X219.511 Y44.632 I-2.488 J.046 E.01525
G1 X226.251 Y51.372 E.29304
G1 X226.251 Y51.905 E.0164
G1 X219.419 Y45.074 E.29704
G3 X219.284 Y45.473 I-2.062 J-.473 E.01297
G1 X226.251 Y52.439 E.30289
G1 X226.251 Y52.973 E.0164
G1 X219.112 Y45.834 E.31036
G3 X218.907 Y46.162 I-1.74 J-.864 E.01192
G1 X226.251 Y53.506 E.31931
G1 X226.251 Y54.04 E.0164
G1 X218.672 Y46.461 E.32953
G3 X218.408 Y46.731 I-1.481 J-1.182 E.01162
G1 X226.251 Y54.573 E.34099
G1 X226.251 Y55.107 E.0164
G1 X218.116 Y46.972 E.35368
G3 X217.795 Y47.185 I-1.221 J-1.499 E.01186
G1 X226.251 Y55.64 E.36765
G1 X226.251 Y56.174 E.0164
G1 X217.442 Y47.366 E.38298
G3 X217.055 Y47.512 I-.929 J-1.865 E.01274
G1 X226.251 Y56.708 E.3998
G1 X226.251 Y57.241 E.0164
G1 X216.629 Y47.62 E.41833
G3 X216.146 Y47.67 I-.772 J-5.11 E.01495
G1 X226.251 Y57.775 E.43936
G1 X226.251 Y58.308 E.0164
G1 X215.594 Y47.652 E.46334
G3 X214.913 Y47.504 I.578 J-4.31 E.02146
G1 X226.251 Y58.842 E.49296
G1 X226.251 Y59.375 E.0164
G1 X200.75 Y33.874 E1.10876
G1 X201.283 Y33.874 E.0164
G1 X212.624 Y45.216 E.49311
G3 X212.476 Y44.534 I3.46 J-1.11 E.02149
G1 X201.817 Y33.874 E.46346
G1 X202.35 Y33.874 E.0164
G1 X212.453 Y43.977 E.43925
G3 X212.508 Y43.498 I4.815 J.31 E.01482
G1 X202.884 Y33.874 E.41844
G1 X203.417 Y33.874 E.0164
G1 X212.613 Y43.07 E.39983
G3 X212.759 Y42.682 I2.013 J.533 E.01276
G1 X203.951 Y33.874 E.38296
G1 X204.485 Y33.874 E.0164
G1 X212.939 Y42.329 E.3676
G3 X213.151 Y42.007 I1.712 J.896 E.01186
G1 X205.018 Y33.874 E.3536
G1 X205.552 Y33.874 E.0164
G1 X213.392 Y41.715 E.34089
G3 X213.663 Y41.452 I10.952 J11.016 E.0116
G1 X206.085 Y33.874 E.32947
G1 X206.619 Y33.874 E.0164
G1 X213.963 Y41.218 E.3193
G3 X214.292 Y41.014 I1.183 J1.545 E.01194
G1 X207.152 Y33.874 E.31044
G1 X207.686 Y33.874 E.0164
G1 X214.654 Y40.843 E.30297
G3 X215.052 Y40.707 I.877 J1.918 E.01294
G1 X208.22 Y33.874 E.29707
G1 X208.753 Y33.874 E.0164
G1 X215.492 Y40.613 E.29298
G3 X215.995 Y40.583 I.438 J3.094 E.01552
G1 X209.287 Y33.874 E.29167
G1 X209.82 Y33.874 E.0164
G1 X216.567 Y40.621 E.29335
G3 X217.298 Y40.819 I-.75 J4.22 E.0233
G1 X210.354 Y33.874 E.30193
G1 X210.887 Y33.874 E.0164
G1 X226.251 Y49.238 E.66798
G1 X226.251 Y48.704 E.0164
G1 X211.421 Y33.874 E.64478
G1 X211.955 Y33.874 E.0164
G1 X226.251 Y48.17 E.62158
G1 X226.251 Y47.637 E.0164
G1 X212.488 Y33.874 E.59838
G1 X213.022 Y33.874 E.0164
G1 X226.251 Y47.103 E.57519
G1 X226.251 Y46.57 E.0164
G1 X213.555 Y33.874 E.55199
G1 X214.089 Y33.874 E.0164
G1 X226.251 Y46.036 E.52879
G1 X226.251 Y45.503 E.0164
G1 X214.622 Y33.874 E.50559
G1 X215.156 Y33.874 E.0164
G1 X226.251 Y44.969 E.48239
G1 X226.251 Y44.436 E.0164
G1 X215.689 Y33.874 E.45919
G1 X216.223 Y33.874 E.0164
G1 X226.251 Y43.902 E.43599
G1 X226.251 Y43.368 E.0164
G1 X216.757 Y33.874 E.41279
G1 X217.29 Y33.874 E.0164
G1 X226.251 Y42.835 E.38959
G1 X226.251 Y42.301 E.0164
G1 X217.824 Y33.874 E.36639
G1 X218.357 Y33.874 E.0164
G1 X226.251 Y41.768 E.34319
G1 X226.251 Y41.234 E.0164
G1 X218.891 Y33.874 E.32
G1 X219.424 Y33.874 E.0164
G1 X226.251 Y40.701 E.2968
G1 X226.251 Y40.167 E.0164
G1 X219.958 Y33.874 E.2736
G1 X220.492 Y33.874 E.0164
G1 X226.251 Y39.633 E.2504
G1 X226.251 Y39.1 E.0164
G1 X221.025 Y33.874 E.2272
G1 X221.559 Y33.874 E.0164
G1 X226.251 Y38.566 E.204
G1 X226.251 Y38.033 E.0164
G1 X222.092 Y33.874 E.1808
G1 X222.626 Y33.874 E.0164
G1 X226.251 Y37.499 E.1576
G1 X226.251 Y36.966 E.0164
G1 X223.159 Y33.874 E.1344
G1 X223.693 Y33.874 E.0164
G1 X226.251 Y36.432 E.1112
G1 X226.251 Y35.898 E.0164
G1 X224.227 Y33.874 E.088
G1 X224.76 Y33.874 E.0164
G1 X226.251 Y35.365 E.06481
G1 X226.251 Y34.831 E.0164
G1 X225.294 Y33.874 E.04161
G1 X225.827 Y33.874 E.0164
G1 X226.42 Y34.467 E.02578
G1 X226.42 Y75.552 F30000
G1 F15000
G1 X205.749 Y54.881 E.89875
G1 X205.749 Y55.415 E.0164
G1 X226.251 Y75.916 E.89138
G1 X226.251 Y76.45 E.0164
G1 X205.749 Y55.948 E.89138
G1 X205.749 Y56.482 E.0164
G1 X226.251 Y76.983 E.89138
G1 X226.251 Y77.517 E.0164
G1 X205.749 Y57.015 E.89138
G1 X205.749 Y57.549 E.0164
G1 X226.251 Y78.05 E.89138
G1 X226.251 Y78.584 E.0164
G1 X205.749 Y58.083 E.89138
G1 X205.749 Y58.616 E.0164
G1 X226.251 Y79.117 E.89138
G1 X226.251 Y79.651 E.0164
G1 X205.749 Y59.15 E.89138
G1 X205.749 Y59.683 E.0164
G1 X226.251 Y80.185 E.89138
G1 X226.251 Y80.718 E.0164
G1 X205.749 Y60.217 E.89138
G1 X205.749 Y60.75 E.0164
G1 X226.251 Y81.252 E.89138
G1 X226.251 Y81.785 E.0164
G1 X205.749 Y61.284 E.89138
G1 X205.749 Y61.818 E.0164
G1 X226.251 Y82.319 E.89138
G1 X226.251 Y82.852 E.0164
G1 X205.749 Y62.351 E.89138
G1 X205.749 Y62.885 E.0164
G1 X226.251 Y83.386 E.89138
G1 X226.251 Y83.92 E.0164
G1 X205.749 Y63.418 E.89138
G1 X205.749 Y63.952 E.0164
G1 X226.251 Y84.453 E.89138
G1 X226.251 Y84.987 E.0164
G1 X205.749 Y64.485 E.89138
G1 X205.749 Y65.019 E.0164
G1 X226.251 Y85.52 E.89138
G1 X226.251 Y86.054 E.0164
G1 X205.749 Y65.553 E.89138
G1 X205.749 Y66.086 E.0164
G1 X226.251 Y86.587 E.89138
G1 X226.251 Y87.121 E.0164
G1 X205.749 Y66.62 E.89138
G1 X205.749 Y67.153 E.0164
G1 X226.251 Y87.655 E.89138
G1 X226.251 Y88.188 E.0164
G1 X205.749 Y67.687 E.89138
G1 X205.749 Y68.22 E.0164
G1 X226.251 Y88.722 E.89138
G1 X226.251 Y89.255 E.0164
G1 X205.749 Y68.754 E.89138
G1 X205.749 Y69.288 E.0164
G1 X226.251 Y89.789 E.89138
G1 X226.251 Y90.322 E.0164
G1 X205.749 Y69.821 E.89138
G1 X205.749 Y70.355 E.0164
G1 X226.251 Y90.856 E.89138
G1 X226.251 Y91.39 E.0164
G1 X205.749 Y70.888 E.89138
G1 X205.749 Y71.422 E.0164
G1 X226.251 Y91.923 E.89138
G1 X226.251 Y92.457 E.0164
G1 X205.749 Y71.955 E.89138
G1 X205.749 Y72.489 E.0164
G1 X226.251 Y92.99 E.89138
G1 X226.251 Y93.524 E.0164
G1 X205.749 Y73.023 E.89138
G1 X205.749 Y73.556 E.0164
G1 X226.251 Y94.057 E.89138
G1 X226.251 Y94.591 E.0164
G1 X205.749 Y74.09 E.89138
G1 X205.749 Y74.623 E.0164
G1 X226.251 Y95.125 E.89138
G1 X226.251 Y95.658 E.0164
G1 X205.749 Y75.157 E.89138
G1 X205.749 Y75.69 E.0164
G1 X226.251 Y96.192 E.89138
G1 X226.251 Y96.725 E.0164
G1 X205.749 Y76.224 E.89138
G1 X205.749 Y76.758 E.0164
G1 X226.251 Y97.259 E.89138
G1 X226.251 Y97.792 E.0164
G1 X205.749 Y77.291 E.89138
G1 X205.749 Y77.825 E.0164
G1 X226.251 Y98.326 E.89138
G1 X226.251 Y98.86 E.0164
G1 X205.749 Y78.358 E.89138
G1 X205.749 Y78.892 E.0164
G1 X226.251 Y99.393 E.89138
G1 X226.251 Y99.927 E.0164
G1 X205.749 Y79.425 E.89138
G1 X205.749 Y79.959 E.0164
G1 X226.251 Y100.46 E.89138
G1 X226.251 Y100.994 E.0164
G1 X205.749 Y80.493 E.89138
G1 X205.749 Y81.026 E.0164
G1 X226.251 Y101.527 E.89138
G1 X226.251 Y102.061 E.0164
G1 X205.749 Y81.56 E.89138
G1 X205.749 Y82.093 E.0164
G1 X226.251 Y102.594 E.89138
G1 X226.251 Y103.128 E.0164
G1 X205.749 Y82.627 E.89138
G1 X205.749 Y83.16 E.0164
G1 X226.251 Y103.662 E.89138
G1 X226.251 Y104.195 E.0164
G1 X205.749 Y83.694 E.89138
G1 X205.749 Y84.227 E.0164
G1 X226.251 Y104.729 E.89138
G1 X226.251 Y105.262 E.0164
G1 X205.749 Y84.761 E.89138
G1 X205.749 Y85.295 E.0164
G1 X226.251 Y105.796 E.89138
G1 X226.251 Y106.329 E.0164
G1 X205.749 Y85.828 E.89138
G1 X205.749 Y86.362 E.0164
G1 X226.251 Y106.863 E.89138
G1 X226.251 Y107.397 E.0164
G1 X205.749 Y86.895 E.89138
G1 X205.749 Y87.429 E.0164
G1 X226.251 Y107.93 E.89138
G1 X226.251 Y108.464 E.0164
G1 X205.749 Y87.962 E.89138
G1 X205.749 Y88.496 E.0164
G1 X226.251 Y108.997 E.89138
G1 X226.251 Y109.531 E.0164
G1 X205.749 Y89.03 E.89138
G1 X205.749 Y89.563 E.0164
G1 X226.251 Y110.064 E.89138
G1 X226.251 Y110.598 E.0164
G1 X205.749 Y90.097 E.89138
G1 X205.749 Y90.63 E.0164
G1 X226.251 Y111.132 E.89138
G1 X226.251 Y111.665 E.0164
G1 X205.749 Y91.164 E.89138
G1 X205.749 Y91.697 E.0164
G1 X226.251 Y112.199 E.89138
G1 X226.251 Y112.732 E.0164
G1 X205.749 Y92.231 E.89138
G1 X205.749 Y92.765 E.0164
G1 X226.251 Y113.266 E.89138
G1 X226.251 Y113.799 E.0164
G1 X205.749 Y93.298 E.89138
G1 X205.749 Y93.832 E.0164
G1 X226.251 Y114.333 E.89138
G1 X226.251 Y114.867 E.0164
G1 X205.749 Y94.365 E.89138
G1 X205.749 Y94.899 E.0164
G1 X226.251 Y115.4 E.89138
G1 X226.251 Y115.934 E.0164
G1 X205.749 Y95.432 E.89138
G1 X205.749 Y95.966 E.0164
G1 X226.251 Y116.467 E.89138
G1 X226.251 Y117.001 E.0164
G1 X205.749 Y96.5 E.89138
G1 X205.749 Y97.033 E.0164
G1 X226.251 Y117.534 E.89138
G1 X226.251 Y118.068 E.0164
G1 X205.749 Y97.567 E.89138
G1 X205.749 Y98.1 E.0164
G1 X226.251 Y118.602 E.89138
G1 X226.251 Y119.135 E.0164
G1 X205.749 Y98.634 E.89138
G1 X205.749 Y99.167 E.0164
G1 X226.251 Y119.669 E.89138
G1 X226.251 Y120.202 E.0164
G1 X205.749 Y99.701 E.89138
G1 X205.749 Y100.235 E.0164
G1 X226.251 Y120.736 E.89138
G1 X226.251 Y121.269 E.0164
G1 X205.749 Y100.768 E.89138
G1 X205.749 Y101.302 E.0164
G1 X226.251 Y121.803 E.89138
G1 X226.251 Y122.337 E.0164
G1 X205.749 Y101.835 E.89138
G1 X205.749 Y102.369 E.0164
G1 X226.251 Y122.87 E.89138
G1 X226.251 Y123.404 E.0164
G1 X205.749 Y102.902 E.89138
G1 X205.749 Y103.436 E.0164
G1 X226.251 Y123.937 E.89138
G1 X226.251 Y124.471 E.0164
G1 X205.749 Y103.97 E.89138
G1 X205.749 Y104.503 E.0164
G1 X226.251 Y125.004 E.89138
G1 X226.251 Y125.538 E.0164
G1 X205.749 Y105.037 E.89138
G1 X205.749 Y105.57 E.0164
G1 X226.251 Y126.072 E.89138
G1 X226.251 Y126.605 E.0164
G1 X205.749 Y106.104 E.89138
G1 X205.749 Y106.637 E.0164
G1 X226.251 Y127.139 E.89138
G1 X226.251 Y127.672 E.0164
G1 X205.749 Y107.171 E.89138
G1 X205.749 Y107.705 E.0164
G1 X226.251 Y128.206 E.89138
G1 X226.251 Y128.739 E.0164
G1 X205.749 Y108.238 E.89138
G1 X205.749 Y108.772 E.0164
G1 X226.251 Y129.273 E.89138
G1 X226.251 Y129.806 E.0164
G1 X205.749 Y109.305 E.89138
G1 X205.749 Y109.839 E.0164
G1 X226.251 Y130.34 E.89138
G1 X226.251 Y130.874 E.0164
G1 X205.749 Y110.372 E.89138
G1 X205.749 Y110.906 E.0164
G1 X226.251 Y131.407 E.89138
G1 X226.251 Y131.941 E.0164
G1 X219.438 Y125.129 E.29619
G3 X219.54 Y125.763 I-3.511 J.886 E.01979
G1 X226.251 Y132.474 E.29178
G1 X226.251 Y133.008 E.0164
G1 X219.537 Y126.294 E.29191
G3 X219.467 Y126.758 I-4.773 J-.478 E.01443
G1 X226.251 Y133.541 E.29493
G1 X226.251 Y134.075 E.0164
G1 X219.348 Y127.172 E.30012
G3 X219.191 Y127.549 I-1.959 J-.596 E.01256
G1 X226.251 Y134.609 E.30694
G1 X226.251 Y135.142 E.0164
G1 X219.001 Y127.892 E.31522
G3 X218.78 Y128.205 I-1.676 J-.95 E.01179
G1 X226.251 Y135.676 E.32483
G1 X226.251 Y136.209 E.0164
G1 X218.53 Y128.489 E.33569
G3 X218.252 Y128.744 I-1.413 J-1.261 E.01163
G1 X226.251 Y136.743 E.34779
G1 X226.251 Y137.276 E.0164
G1 X217.945 Y128.971 E.36113
G3 X217.607 Y129.166 I-5.467 J-9.038 E.012
G1 X226.251 Y137.81 E.37582
G1 X226.251 Y138.344 E.0164
G1 X217.234 Y129.327 E.39202
G3 X216.824 Y129.45 I-.82 J-1.989 E.0132
G1 X226.251 Y138.877 E.40987
G1 X226.251 Y139.411 E.0164
G1 X216.369 Y129.529 E.42966
G3 X215.852 Y129.546 I-.398 J-4.145 E.01589
G1 X226.251 Y139.944 E.45211
G1 X226.251 Y140.478 E.0164
G1 X215.241 Y129.468 E.4787
G3 X214.41 Y129.171 I.529 J-2.79 E.02722
G1 X226.251 Y141.011 E.5148
G1 X226.251 Y141.545 E.0164
G1 X205.749 Y121.044 E.89138
G1 X205.749 Y120.51 E.0164
G1 X212.824 Y127.585 E.3076
G3 X212.535 Y126.762 I2.412 J-1.309 E.02691
G1 X205.749 Y119.977 E.29504
G1 X205.749 Y119.443 E.0164
G1 X212.453 Y126.147 E.29146
G3 X212.472 Y125.632 I2.581 J-.162 E.01585
G1 X205.749 Y118.909 E.29229
G1 X205.749 Y118.376 E.0164
G1 X212.548 Y125.175 E.2956
G3 X212.671 Y124.764 I6.097 J1.611 E.01317
G1 X205.749 Y117.842 E.30097
G1 X205.749 Y117.309 E.0164
G1 X212.835 Y124.395 E.30809
G3 X213.031 Y124.057 I1.787 J.814 E.01202
G1 X205.749 Y116.775 E.31662
G1 X205.749 Y116.242 E.0164
G1 X213.258 Y123.75 E.32645
G3 X213.513 Y123.471 I1.517 J1.132 E.01163
G1 X205.749 Y115.708 E.33753
G1 X205.749 Y115.174 E.0164
G1 X213.796 Y123.221 E.34985
G3 X214.108 Y122.999 I1.259 J1.444 E.01179
G1 X205.749 Y114.641 E.36342
G1 X205.749 Y114.107 E.0164
G1 X214.45 Y122.808 E.37831
G3 X214.826 Y122.65 I.977 J1.796 E.01255
G1 X205.749 Y113.574 E.39464
G1 X205.749 Y113.04 E.0164
G1 X215.241 Y122.532 E.41269
G3 X215.708 Y122.465 I.568 J2.296 E.01451
G1 X205.749 Y112.507 E.43297
G1 X205.749 Y111.973 E.0164
G1 X216.234 Y122.458 E.45587
G3 X216.87 Y122.56 I-.36 J4.26 E.01982
G1 X205.58 Y111.27 E.4909
; WIPE_START
G1 X206.994 Y112.684 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X211.185 Y119.063 Z3 F30000
G1 X226.42 Y142.248 Z3
G1 Z2.6
G1 E.8 F1800
G1 F15000
G1 X205.749 Y121.577 E.89875
G1 X205.749 Y122.111 E.0164
G1 X226.251 Y142.612 E.89138
G1 X226.251 Y143.146 E.0164
G1 X205.749 Y122.644 E.89138
G1 X205.749 Y123.178 E.0164
G1 X226.251 Y143.679 E.89138
M73 P83 R11
G1 X226.251 Y144.213 E.0164
G1 X205.749 Y123.712 E.89138
G1 X205.749 Y124.245 E.0164
G1 X226.251 Y144.746 E.89138
G1 X226.251 Y145.28 E.0164
G1 X205.749 Y124.779 E.89138
G1 X205.749 Y125.312 E.0164
G1 X226.251 Y145.814 E.89138
G1 X226.251 Y146.347 E.0164
G1 X205.749 Y125.846 E.89138
G1 X205.749 Y126.379 E.0164
G1 X226.251 Y146.881 E.89138
G1 X226.251 Y147.414 E.0164
G1 X205.749 Y126.913 E.89138
G1 X205.749 Y127.447 E.0164
G1 X226.251 Y147.948 E.89138
G1 X226.251 Y148.481 E.0164
G1 X205.749 Y127.98 E.89138
G1 X205.749 Y128.514 E.0164
G1 X226.251 Y149.015 E.89138
G1 X226.251 Y149.549 E.0164
G1 X205.749 Y129.047 E.89138
G1 X205.749 Y129.581 E.0164
G1 X226.251 Y150.082 E.89138
G1 X226.251 Y150.616 E.0164
G1 X205.749 Y130.114 E.89138
G1 X205.749 Y130.648 E.0164
G1 X226.251 Y151.149 E.89138
G1 X226.251 Y151.683 E.0164
G1 X205.749 Y131.182 E.89138
G1 X205.749 Y131.715 E.0164
G1 X226.251 Y152.216 E.89138
G1 X226.251 Y152.75 E.0164
G1 X205.749 Y132.249 E.89138
G1 X205.749 Y132.782 E.0164
G1 X226.251 Y153.284 E.89138
G1 X226.251 Y153.817 E.0164
G1 X205.749 Y133.316 E.89138
G1 X205.749 Y133.849 E.0164
G1 X226.251 Y154.351 E.89138
G1 X226.251 Y154.884 E.0164
G1 X205.749 Y134.383 E.89138
G1 X205.749 Y134.917 E.0164
G1 X226.251 Y155.418 E.89138
G1 X226.251 Y155.951 E.0164
G1 X205.749 Y135.45 E.89138
G1 X205.749 Y135.984 E.0164
G1 X226.251 Y156.485 E.89138
G1 X226.251 Y157.019 E.0164
G1 X205.749 Y136.517 E.89138
G1 X205.749 Y137.051 E.0164
G1 X226.251 Y157.552 E.89138
G1 X226.251 Y158.086 E.0164
G1 X205.749 Y137.584 E.89138
G1 X205.749 Y138.118 E.0164
G1 X226.251 Y158.619 E.89138
G1 X226.251 Y159.153 E.0164
G1 X205.749 Y138.652 E.89138
G1 X205.749 Y139.185 E.0164
G1 X226.251 Y159.686 E.89138
G1 X226.251 Y160.22 E.0164
G1 X205.749 Y139.719 E.89138
G1 X205.749 Y140.252 E.0164
G1 X226.251 Y160.753 E.89138
G1 X226.251 Y161.287 E.0164
G1 X205.749 Y140.786 E.89138
G1 X205.749 Y141.319 E.0164
G1 X226.251 Y161.821 E.89138
G1 X226.251 Y162.354 E.0164
G1 X205.749 Y141.853 E.89138
G1 X205.749 Y142.386 E.0164
G1 X226.251 Y162.888 E.89138
G1 X226.251 Y163.421 E.0164
G1 X205.749 Y142.92 E.89138
G1 X205.749 Y143.454 E.0164
G1 X226.251 Y163.955 E.89138
G1 X226.251 Y164.488 E.0164
G1 X205.749 Y143.987 E.89138
G1 X205.749 Y144.521 E.0164
G1 X226.251 Y165.022 E.89138
G1 X226.251 Y165.556 E.0164
G1 X205.749 Y145.054 E.89138
G1 X205.749 Y145.588 E.0164
G1 X226.251 Y166.089 E.89138
G1 X226.251 Y166.623 E.0164
G1 X205.749 Y146.121 E.89138
G1 X205.749 Y146.655 E.0164
G1 X226.251 Y167.156 E.89138
G1 X226.251 Y167.69 E.0164
G1 X205.749 Y147.189 E.89138
G1 X205.749 Y147.722 E.0164
G1 X226.251 Y168.223 E.89138
G1 X226.251 Y168.757 E.0164
G1 X205.749 Y148.256 E.89138
G1 X205.749 Y148.789 E.0164
G1 X226.251 Y169.291 E.89138
G1 X226.251 Y169.824 E.0164
G1 X205.749 Y149.323 E.89138
G1 X205.749 Y149.856 E.0164
G1 X226.251 Y170.358 E.89138
G1 X226.251 Y170.891 E.0164
G1 X205.749 Y150.39 E.89138
G1 X205.749 Y150.924 E.0164
G1 X226.251 Y171.425 E.89138
G1 X226.251 Y171.958 E.0164
G1 X205.749 Y151.457 E.89138
G1 X205.749 Y151.991 E.0164
G1 X226.251 Y172.492 E.89138
G1 X226.251 Y173.026 E.0164
G1 X205.749 Y152.524 E.89138
G1 X205.749 Y153.058 E.0164
G1 X226.251 Y173.559 E.89138
G1 X226.251 Y174.093 E.0164
G1 X205.749 Y153.591 E.89138
G1 X205.749 Y154.125 E.0164
G1 X226.251 Y174.626 E.89138
G1 X226.251 Y175.16 E.0164
G1 X205.749 Y154.659 E.89138
G1 X205.749 Y155.192 E.0164
G1 X226.251 Y175.693 E.89138
G1 X226.251 Y176.227 E.0164
G1 X205.749 Y155.726 E.89138
G1 X205.749 Y156.259 E.0164
G1 X226.251 Y176.761 E.89138
G1 X226.251 Y177.294 E.0164
G1 X205.749 Y156.793 E.89138
G1 X205.749 Y157.326 E.0164
G1 X226.251 Y177.828 E.89138
G1 X226.251 Y178.361 E.0164
G1 X205.749 Y157.86 E.89138
G1 X205.749 Y158.394 E.0164
G1 X226.251 Y178.895 E.89138
G1 X226.251 Y179.428 E.0164
G1 X205.749 Y158.927 E.89138
G1 X205.749 Y159.461 E.0164
G1 X226.251 Y179.962 E.89138
G1 X226.251 Y180.496 E.0164
G1 X205.749 Y159.994 E.89138
G1 X205.749 Y160.528 E.0164
G1 X226.251 Y181.029 E.89138
G1 X226.251 Y181.563 E.0164
G1 X205.749 Y161.061 E.89138
G1 X205.749 Y161.595 E.0164
G1 X226.251 Y182.096 E.89138
G1 X226.251 Y182.63 E.0164
G1 X205.749 Y162.129 E.89138
G1 X205.749 Y162.662 E.0164
G1 X226.251 Y183.163 E.89138
G1 X226.251 Y183.697 E.0164
G1 X205.749 Y163.196 E.89138
G1 X205.749 Y163.729 E.0164
G1 X226.251 Y184.231 E.89138
G1 X226.251 Y184.764 E.0164
G1 X205.749 Y164.263 E.89138
G1 X205.749 Y164.796 E.0164
G1 X226.251 Y185.298 E.89138
G1 X226.251 Y185.831 E.0164
G1 X205.749 Y165.33 E.89138
G1 X205.749 Y165.864 E.0164
G1 X226.251 Y186.365 E.89138
G1 X226.251 Y186.898 E.0164
G1 X205.749 Y166.397 E.89138
G1 X205.749 Y166.931 E.0164
G1 X226.251 Y187.432 E.89138
G1 X226.251 Y187.965 E.0164
G1 X205.749 Y167.464 E.89138
G1 X205.749 Y167.998 E.0164
G1 X226.251 Y188.499 E.89138
G1 X226.251 Y189.033 E.0164
G1 X205.749 Y168.531 E.89138
G1 X205.749 Y169.065 E.0164
G1 X226.251 Y189.566 E.89138
G1 X226.251 Y190.1 E.0164
G1 X205.749 Y169.598 E.89138
G1 X205.749 Y170.132 E.0164
G1 X226.251 Y190.633 E.89138
G1 X226.251 Y191.167 E.0164
G1 X205.749 Y170.666 E.89138
G1 X205.749 Y171.199 E.0164
G1 X226.251 Y191.7 E.89138
G1 X226.251 Y192.234 E.0164
G1 X205.749 Y171.733 E.89138
G1 X205.749 Y172.266 E.0164
G1 X226.251 Y192.768 E.89138
G1 X226.251 Y193.301 E.0164
G1 X205.749 Y172.8 E.89138
G1 X205.749 Y173.333 E.0164
G1 X226.251 Y193.835 E.89138
G1 X226.251 Y194.368 E.0164
G1 X205.749 Y173.867 E.89138
G1 X205.749 Y174.401 E.0164
G1 X226.251 Y194.902 E.89138
M73 P83 R10
G1 X226.251 Y195.435 E.0164
G1 X205.749 Y174.934 E.89138
G1 X205.749 Y175.468 E.0164
G1 X226.251 Y195.969 E.89138
G1 X226.251 Y196.503 E.0164
G1 X205.749 Y176.001 E.89138
G1 X205.749 Y176.535 E.0164
G1 X226.251 Y197.036 E.89138
G1 X226.251 Y197.57 E.0164
G1 X205.749 Y177.068 E.89138
G1 X205.749 Y177.602 E.0164
G1 X226.251 Y198.103 E.89138
G1 X226.251 Y198.637 E.0164
G1 X205.749 Y178.136 E.89138
G1 X205.749 Y178.669 E.0164
G1 X226.251 Y199.17 E.89138
G1 X226.251 Y199.704 E.0164
G1 X205.749 Y179.203 E.89138
G1 X205.749 Y179.736 E.0164
G1 X226.251 Y200.238 E.89138
G1 X226.251 Y200.771 E.0164
G1 X205.749 Y180.27 E.89138
G1 X205.749 Y180.803 E.0164
G1 X226.251 Y201.305 E.89138
G1 X226.251 Y201.838 E.0164
G1 X205.749 Y181.337 E.89138
G1 X205.749 Y181.871 E.0164
G1 X226.251 Y202.372 E.89138
G1 X226.251 Y202.905 E.0164
G1 X205.749 Y182.404 E.89138
G1 X205.749 Y182.938 E.0164
G1 X226.251 Y203.439 E.89138
G1 X226.251 Y203.973 E.0164
G1 X205.749 Y183.471 E.89138
G1 X205.749 Y184.005 E.0164
G1 X226.251 Y204.506 E.89138
G1 X226.251 Y205.04 E.0164
G1 X205.749 Y184.538 E.89138
G1 X205.749 Y185.072 E.0164
G1 X226.251 Y205.573 E.89138
G1 X226.251 Y206.107 E.0164
G1 X205.749 Y185.606 E.89138
G1 X205.749 Y186.139 E.0164
G1 X226.251 Y206.64 E.89138
G1 X226.251 Y207.174 E.0164
G1 X205.749 Y186.673 E.89138
G1 X205.749 Y187.206 E.0164
G1 X226.251 Y207.708 E.89138
G1 X226.251 Y208.241 E.0164
G1 X205.749 Y187.74 E.89138
G1 X205.749 Y188.273 E.0164
G1 X226.251 Y208.775 E.89138
G1 X226.251 Y209.308 E.0164
G1 X205.749 Y188.807 E.89138
G1 X205.749 Y189.341 E.0164
G1 X226.251 Y209.842 E.89138
G1 X226.251 Y210.375 E.0164
G1 X205.749 Y189.874 E.89138
G1 X205.749 Y190.408 E.0164
G1 X226.251 Y210.909 E.89138
G1 X226.251 Y211.443 E.0164
G1 X205.749 Y190.941 E.89138
G1 X205.749 Y191.475 E.0164
G1 X226.251 Y211.976 E.89138
G1 X226.251 Y212.51 E.0164
G1 X205.749 Y192.008 E.89138
G1 X205.749 Y192.542 E.0164
G1 X226.251 Y213.043 E.89138
G1 X226.251 Y213.577 E.0164
G1 X219.332 Y206.658 E.30082
G3 X219.511 Y207.371 I-3.337 J1.219 E.02264
G1 X226.251 Y214.11 E.29303
G1 X226.251 Y214.644 E.0164
G1 X219.548 Y207.942 E.29141
G3 X219.503 Y208.43 I-2.466 J.021 E.01512
G1 X226.251 Y215.177 E.29336
G1 X226.251 Y215.711 E.0164
G1 X219.408 Y208.868 E.29753
G3 X219.269 Y209.263 I-6.994 J-2.236 E.01287
G1 X226.251 Y216.245 E.30357
G1 X226.251 Y216.778 E.0164
G1 X219.091 Y209.619 E.31128
G3 X218.883 Y209.944 I-1.728 J-.88 E.01189
G1 X226.251 Y217.312 E.32035
G1 X226.251 Y217.845 E.0164
G1 X218.645 Y210.24 E.33069
G3 X218.379 Y210.507 I-1.469 J-1.197 E.01162
G1 X225.997 Y218.126 E.33126
G1 X225.464 Y218.126 E.0164
G1 X218.084 Y210.746 E.32088
G3 X217.76 Y210.955 I-1.211 J-1.519 E.01188
G1 X224.93 Y218.126 E.31177
G1 X224.397 Y218.126 E.0164
G1 X217.404 Y211.133 E.30403
G3 X217.014 Y211.276 I-.912 J-1.879 E.0128
G1 X223.863 Y218.126 E.2978
G1 X223.33 Y218.126 E.0164
G1 X216.581 Y211.377 E.29342
G3 X216.091 Y211.421 I-.464 J-2.427 E.01514
G1 X222.796 Y218.126 E.29151
G1 X222.262 Y218.126 E.0164
G1 X215.531 Y211.394 E.29268
G3 X214.829 Y211.226 I.647 J-4.248 E.02221
G1 X221.729 Y218.126 E.29999
G1 X221.195 Y218.126 E.0164
G1 X200.694 Y197.624 E.89138
G1 X201.228 Y197.624 E.0164
G1 X212.649 Y209.046 E.4966
G3 X212.482 Y208.345 I3.874 J-1.293 E.02217
G1 X201.761 Y197.624 E.46614
G1 X202.295 Y197.624 E.0164
G1 X212.453 Y207.783 E.44167
G3 X212.498 Y207.295 I4.454 J.17 E.01508
G1 X202.828 Y197.624 E.42045
G1 X203.362 Y197.624 E.0164
G1 X212.6 Y206.863 E.40168
G3 X212.742 Y206.471 I2.026 J.514 E.01282
G1 X203.895 Y197.624 E.38466
G1 X204.429 Y197.624 E.0164
G1 X212.92 Y206.115 E.36916
G3 X213.128 Y205.79 I1.726 J.881 E.01189
G1 X204.963 Y197.624 E.35504
G1 X205.496 Y197.624 E.0164
G1 X213.367 Y205.495 E.34221
G3 X213.634 Y205.228 I1.469 J1.202 E.01162
G1 X205.749 Y197.344 E.3428
G1 X205.749 Y196.81 E.0164
G1 X213.929 Y204.99 E.35564
G3 X214.256 Y204.783 I1.199 J1.532 E.01191
G1 X205.749 Y196.277 E.36984
G1 X205.749 Y195.743 E.0164
G1 X214.614 Y204.608 E.38544
G3 X215.009 Y204.469 I.893 J1.901 E.01288
G1 X205.749 Y195.21 E.40259
G1 X205.749 Y194.676 E.0164
G1 X215.444 Y204.371 E.42153
G3 X215.939 Y204.333 I.468 J2.809 E.01528
G1 X205.749 Y194.143 E.44305
G1 X205.749 Y193.609 E.0164
G1 X216.504 Y204.363 E.46758
G3 X217.215 Y204.541 I-.54 J3.667 E.02259
G1 X205.58 Y192.906 E.5059
; WIPE_START
G1 X206.994 Y194.32 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X199.476 Y195.639 Z3 F30000
G1 X70.365 Y218.295 Z3
G1 Z2.6
G1 E.8 F1800
G1 F15000
G1 X29.749 Y177.68 E1.76593
G1 X29.749 Y178.213 E.0164
G1 X69.662 Y218.126 E1.73536
G1 X69.128 Y218.126 E.0164
G1 X29.749 Y178.747 E1.71216
G1 X29.749 Y179.28 E.0164
G1 X68.595 Y218.126 E1.68896
G1 X68.061 Y218.126 E.0164
G1 X29.749 Y179.814 E1.66576
G1 X29.749 Y180.347 E.0164
G1 X67.528 Y218.126 E1.64256
G1 X66.994 Y218.126 E.0164
G1 X29.749 Y180.881 E1.61936
G1 X29.749 Y181.415 E.0164
G1 X66.46 Y218.126 E1.59616
G1 X65.927 Y218.126 E.0164
G1 X29.749 Y181.948 E1.57296
G1 X29.749 Y182.482 E.0164
G1 X65.393 Y218.126 E1.54976
G1 X64.86 Y218.126 E.0164
G1 X29.749 Y183.015 E1.52656
G1 X29.749 Y183.549 E.0164
G1 X64.326 Y218.126 E1.50336
G1 X63.793 Y218.126 E.0164
G1 X29.749 Y184.082 E1.48017
G1 X29.749 Y184.616 E.0164
G1 X63.259 Y218.126 E1.45697
G1 X62.725 Y218.126 E.0164
G1 X29.749 Y185.15 E1.43377
G1 X29.749 Y185.683 E.0164
G1 X62.192 Y218.126 E1.41057
G1 X61.658 Y218.126 E.0164
G1 X29.749 Y186.217 E1.38737
G1 X29.749 Y186.75 E.0164
G1 X61.125 Y218.126 E1.36417
G1 X60.591 Y218.126 E.0164
G1 X29.749 Y187.284 E1.34097
G1 X29.749 Y187.817 E.0164
G1 X60.058 Y218.126 E1.31777
G1 X59.524 Y218.126 E.0164
G1 X29.749 Y188.351 E1.29457
G1 X29.749 Y188.885 E.0164
G1 X58.99 Y218.126 E1.27137
G1 X58.457 Y218.126 E.0164
G1 X29.749 Y189.418 E1.24817
G1 X29.749 Y189.952 E.0164
G1 X57.923 Y218.126 E1.22498
G1 X57.39 Y218.126 E.0164
G1 X29.749 Y190.485 E1.20178
G1 X29.749 Y191.019 E.0164
G1 X56.856 Y218.126 E1.17858
G1 X56.323 Y218.126 E.0164
G1 X29.749 Y191.552 E1.15538
G1 X29.749 Y192.086 E.0164
G1 X55.789 Y218.126 E1.13218
G1 X55.255 Y218.126 E.0164
G1 X29.749 Y192.62 E1.10898
G1 X29.749 Y193.153 E.0164
G1 X41.098 Y204.502 E.49344
G2 X40.415 Y204.352 I-1.105 J3.403 E.02155
G1 X29.749 Y193.687 E.46372
G1 X29.749 Y194.22 E.0164
G1 X39.862 Y204.332 E.43967
G2 X39.378 Y204.383 I.063 J2.946 E.01495
G1 X29.749 Y194.754 E.41866
G1 X29.749 Y195.287 E.0164
G1 X38.948 Y204.486 E.39995
G2 X38.559 Y204.63 I.525 J2.019 E.01279
G1 X29.749 Y195.821 E.38302
G1 X29.749 Y196.355 E.0164
G1 X38.206 Y204.811 E.36768
G2 X37.886 Y205.024 I.904 J1.705 E.01185
G1 X29.749 Y196.888 E.35375
G1 X29.749 Y197.422 E.0164
G1 X37.594 Y205.267 E.34109
G2 X37.331 Y205.537 I1.22 J1.448 E.01162
G1 X29.749 Y197.955 E.32965
G1 X29.749 Y198.489 E.0164
G1 X37.097 Y205.836 E.31946
G2 X36.892 Y206.165 I1.541 J1.187 E.01193
G1 X29.749 Y199.022 E.31056
G1 X29.749 Y199.556 E.0164
G1 X36.719 Y206.526 E.30305
G2 X36.582 Y206.922 I1.911 J.885 E.01291
G1 X29.749 Y200.09 E.29707
G1 X29.749 Y200.623 E.0164
G1 X36.487 Y207.36 E.29293
G2 X36.453 Y207.86 I2.481 J.419 E.01543
G1 X29.749 Y201.157 E.29146
G1 X29.749 Y201.69 E.0164
G1 X36.494 Y208.435 E.29327
G2 X36.697 Y209.172 I3.852 J-.665 E.02352
G1 X29.749 Y202.224 E.30209
G1 X29.749 Y202.757 E.0164
G1 X45.118 Y218.126 E.6682
G1 X45.651 Y218.126 E.0164
G1 X38.701 Y211.176 E.30217
G2 X39.437 Y211.377 I1.31 J-3.335 E.02348
G1 X46.185 Y218.126 E.2934
G1 X46.718 Y218.126 E.0164
G1 X40.016 Y211.423 E.29143
G2 X40.512 Y211.386 I.062 J-2.501 E.01533
G1 X47.252 Y218.126 E.29305
G1 X47.785 Y218.126 E.0164
G1 X40.955 Y211.295 E.29697
G2 X41.351 Y211.157 I-2.26 J-7.098 E.01288
G1 X48.319 Y218.126 E.30298
G1 X48.853 Y218.126 E.0164
G1 X41.71 Y210.983 E.31054
G2 X42.039 Y210.778 I-.861 J-1.742 E.01192
G1 X49.386 Y218.126 E.31947
G1 X49.92 Y218.126 E.0164
G1 X42.337 Y210.543 E.32968
G2 X42.607 Y210.28 I-1.18 J-1.48 E.01162
G1 X50.453 Y218.126 E.34113
G1 X50.987 Y218.126 E.0164
G1 X42.849 Y209.988 E.35382
G2 X43.062 Y209.667 I-1.497 J-1.223 E.01186
G1 X51.52 Y218.126 E.36777
G1 X52.054 Y218.126 E.0164
G1 X43.244 Y209.315 E.38307
G2 X43.391 Y208.929 I-1.851 J-.929 E.01273
G1 X52.588 Y218.126 E.39985
G1 X53.121 Y218.126 E.0164
G1 X43.493 Y208.498 E.41861
G2 X43.545 Y208.015 I-2.388 J-.497 E.01494
G1 X53.655 Y218.126 E.43958
G1 X54.188 Y218.126 E.0164
G1 X43.525 Y207.462 E.46363
G2 X43.376 Y206.78 I-4.086 J.533 E.0215
G1 X54.892 Y218.295 E.50068
G1 X44.754 Y218.295 F30000
G1 F15000
G1 X29.749 Y203.291 E.65238
G1 X29.749 Y203.825 E.0164
G1 X44.05 Y218.126 E.6218
G1 X43.517 Y218.126 E.0164
G1 X29.749 Y204.358 E.5986
G1 X29.749 Y204.892 E.0164
G1 X42.983 Y218.126 E.5754
G1 X42.45 Y218.126 E.0164
G1 X29.749 Y205.425 E.5522
G1 X29.749 Y205.959 E.0164
G1 X41.916 Y218.126 E.529
G1 X41.383 Y218.126 E.0164
G1 X29.749 Y206.492 E.5058
G1 X29.749 Y207.026 E.0164
G1 X40.849 Y218.126 E.48261
G1 X40.315 Y218.126 E.0164
G1 X29.749 Y207.559 E.45941
G1 X29.749 Y208.093 E.0164
G1 X39.782 Y218.126 E.43621
G1 X39.248 Y218.126 E.0164
G1 X29.749 Y208.627 E.41301
G1 X29.749 Y209.16 E.0164
G1 X38.715 Y218.126 E.38981
G1 X38.181 Y218.126 E.0164
G1 X29.749 Y209.694 E.36661
G1 X29.749 Y210.227 E.0164
G1 X37.648 Y218.126 E.34341
G1 X37.114 Y218.126 E.0164
G1 X29.749 Y210.761 E.32021
G1 X29.749 Y211.294 E.0164
G1 X36.581 Y218.126 E.29701
G1 X36.047 Y218.126 E.0164
G1 X29.749 Y211.828 E.27381
G1 X29.749 Y212.362 E.0164
G1 X35.513 Y218.126 E.25061
G1 X34.98 Y218.126 E.0164
G1 X29.749 Y212.895 E.22742
G1 X29.749 Y213.429 E.0164
G1 X34.446 Y218.126 E.20422
G1 X33.913 Y218.126 E.0164
G1 X29.749 Y213.962 E.18102
G1 X29.749 Y214.496 E.0164
G1 X33.379 Y218.126 E.15782
G1 X32.846 Y218.126 E.0164
G1 X29.749 Y215.029 E.13462
G1 X29.749 Y215.563 E.0164
G1 X32.312 Y218.126 E.11142
G1 X31.778 Y218.126 E.0164
G1 X29.749 Y216.097 E.08822
G1 X29.749 Y216.63 E.0164
G1 X31.245 Y218.126 E.06502
G1 X30.711 Y218.126 E.0164
G1 X29.749 Y217.164 E.04182
G1 X29.749 Y217.697 E.0164
G1 X30.347 Y218.295 E.026
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X29.749 Y217.697 E-.32137
G1 X29.749 Y217.164 E-.20276
G1 X30.188 Y217.603 E-.23587
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
G1 X86.32 Y41.25
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X86.1 Y41.397 E.00879
G2 X85.421 Y41.123 I-.725 J.818 E.02478
G1 X84.002 Y41.123 E.04706
G1 X84.002 Y39.127 E.06621
G1 X85.43 Y39.127 E.04735
G2 X86.106 Y38.849 I-.056 J-1.095 E.02472
G1 X88.289 Y41.123 E.10458
G1 X86.77 Y41.123 E.05037
G2 X86.372 Y41.22 I.055 J1.091 E.01368
G1 X86.197 Y40.859 F30000
G1 F16213.044
G1 X86.101 Y40.903 E.00352
G2 X85.435 Y40.716 I-.682 J1.151 E.02321
G1 X84.409 Y40.716 E.03402
G1 X84.409 Y39.534 E.0392
G1 X85.45 Y39.534 E.03452
G2 X86.051 Y39.38 I-.076 J-1.544 E.02074
G1 X87.334 Y40.716 E.06144
G2 X86.549 Y40.736 I-.292 J3.996 E.0261
G2 X86.371 Y40.784 I.323 J1.55 E.00612
G1 X86.252 Y40.835 E.00428
G1 X86.1 Y40.451 F30000
G1 F16213.044
G2 X85.449 Y40.309 I-.718 J1.724 E.02221
G1 X84.816 Y40.309 E.02099
G1 X84.816 Y39.941 E.01219
G2 X85.721 Y39.916 I.327 J-4.601 E.03007
G1 X85.948 Y39.86 E.00775
G1 X86.399 Y40.33 E.02161
G1 X86.155 Y40.428 E.00872
; WIPE_START
G1 X85.934 Y40.382 E-.08595
G1 X85.641 Y40.322 E-.11345
G1 X85.449 Y40.309 E-.07332
G1 X84.816 Y40.309 E-.2404
G1 X84.816 Y39.941 E-.13968
G1 X85.098 Y39.941 E-.10721
; WIPE_END
G1 E-.04 F1800
G1 X87.015 Y47.329 Z3.2 F30000
G1 X127.844 Y204.664 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F16213.044
G1 X127.896 Y204.66 E.00171
G3 X128.234 Y204.665 I.114 J3.499 E.01123
G3 X127.6 Y204.682 I-.232 J3.208 E.64923
G1 X127.784 Y204.668 E.00614
G1 X127.874 Y205.07 F30000
G1 F16213.044
G1 X127.908 Y205.067 E.00113
G3 X128.205 Y205.072 I.101 J3.061 E.00988
G3 X127.651 Y205.086 I-.204 J2.801 E.56697
G1 X127.814 Y205.074 E.00543
G1 X127.903 Y205.476 F30000
G1 F16213.044
G1 X127.92 Y205.474 E.00055
G3 X127.701 Y205.491 I.07 J2.401 E.49328
G1 X127.843 Y205.48 E.00472
G1 X127.92 Y205.868 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X127.931 Y205.867 E.00033
G3 X127.75 Y205.88 I.06 J2.008 E.38231
G1 X127.861 Y205.872 E.00341
; WIPE_START
M204 S10000
G1 X127.931 Y205.867 E-.02682
G1 X128.149 Y205.87 E-.08292
G1 X128.544 Y205.94 E-.15251
G1 X128.917 Y206.086 E-.15211
G1 X129.253 Y206.303 E-.15212
G1 X129.54 Y206.583 E-.1521
G1 X129.601 Y206.673 E-.04142
; WIPE_END
G1 E-.04 F1800
G1 X137.232 Y206.497 Z3.2 F30000
G1 X216.295 Y204.673 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X216.559 Y204.705 E.00882
G3 X215.6 Y204.682 I-.557 J3.167 E.63836
G3 X216.234 Y204.665 I.41 J3.478 E.02107
G1 X216.236 Y204.665 E.00006
G1 X216.246 Y205.077 F30000
G1 F16213.044
G1 X216.488 Y205.107 E.0081
G3 X215.651 Y205.086 I-.487 J2.766 E.55751
G3 X216.186 Y205.071 I.357 J3.041 E.0178
G1 X216.197 Y205.481 F30000
G1 F16213.044
G1 X216.417 Y205.512 E.00737
G3 X215.701 Y205.491 I-.427 J2.363 E.47671
G1 X215.92 Y205.474 E.00726
G3 X216.137 Y205.478 I.07 J2.401 E.00721
G1 X216.197 Y205.879 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X216.543 Y205.943 E.01084
G3 X215.75 Y205.88 I-.553 J1.932 E.36327
G1 X215.931 Y205.867 E.00558
G3 X216.137 Y205.871 I.06 J2.008 E.00634
; WIPE_START
M204 S10000
G1 X216.543 Y205.943 E-.15675
G1 X216.917 Y206.086 E-.15198
G1 X217.253 Y206.303 E-.15212
G1 X217.54 Y206.583 E-.15212
G1 X217.758 Y206.903 E-.14703
; WIPE_END
G1 E-.04 F1800
G1 X217.584 Y199.272 Z3.2 F30000
G1 X215.845 Y122.789 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X215.896 Y122.785 E.0017
G3 X216.234 Y122.79 I.114 J3.509 E.01123
G3 X215.6 Y122.807 I-.232 J3.208 E.64923
G1 X215.785 Y122.793 E.00615
G1 X215.874 Y123.195 F30000
G1 F16213.044
G1 X215.908 Y123.192 E.00113
G3 X216.205 Y123.197 I.101 J3.069 E.00989
G3 X215.65 Y123.211 I-.204 J2.801 E.56696
G1 X215.814 Y123.199 E.00544
G1 X215.921 Y123.61 F30000
G1 F16213.044
G1 X216.177 Y123.604 E.00849
G3 X215.701 Y123.616 I-.176 J2.395 E.48469
G1 X215.861 Y123.612 E.00531
M73 P84 R10
G1 X215.927 Y123.992 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X215.931 Y123.992 E.00012
G3 X215.75 Y124.005 I.059 J2.008 E.38231
G1 X215.867 Y123.997 E.00362
; WIPE_START
M204 S10000
G1 X215.931 Y123.992 E-.02424
G1 X216.149 Y123.995 E-.08296
G1 X216.544 Y124.065 E-.15244
G1 X216.917 Y124.211 E-.15211
G1 X217.253 Y124.428 E-.15211
G1 X217.54 Y124.708 E-.15215
G1 X217.605 Y124.803 E-.04399
; WIPE_END
G1 E-.04 F1800
G1 X217.445 Y117.173 Z3.2 F30000
G1 X215.844 Y40.914 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X215.896 Y40.91 E.0017
G3 X216.234 Y40.915 I.114 J3.505 E.01123
G3 X215.6 Y40.932 I-.232 J3.208 E.64923
G1 X215.785 Y40.918 E.00615
G1 X215.874 Y41.32 F30000
G1 F16213.044
G1 X215.908 Y41.317 E.00113
G3 X216.205 Y41.322 I.1 J3.065 E.00988
G3 X215.65 Y41.336 I-.204 J2.801 E.56696
G1 X215.814 Y41.324 E.00544
G1 X215.921 Y41.735 F30000
G1 F16213.044
G1 X216.177 Y41.729 E.00848
G3 X215.701 Y41.741 I-.176 J2.395 E.4847
G1 X215.861 Y41.737 E.00531
G1 X215.927 Y42.117 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X215.931 Y42.117 E.00012
G3 X215.75 Y42.13 I.059 J2.008 E.38231
G1 X215.867 Y42.122 E.00361
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
G1 F16213.044
G1 X127.896 Y40.91 E.0017
G3 X128.234 Y40.915 I.114 J3.505 E.01123
G3 X127.6 Y40.932 I-.232 J3.208 E.64923
G1 X127.785 Y40.918 E.00615
G1 X127.874 Y41.32 F30000
G1 F16213.044
G1 X127.908 Y41.317 E.00113
G3 X128.205 Y41.322 I.1 J3.065 E.00988
G3 X127.65 Y41.336 I-.204 J2.801 E.56696
G1 X127.814 Y41.324 E.00544
G1 X127.921 Y41.735 F30000
G1 F16213.044
G1 X128.177 Y41.729 E.00848
G3 X127.701 Y41.741 I-.176 J2.395 E.4847
G1 X127.861 Y41.737 E.00531
G1 X127.927 Y42.117 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X127.931 Y42.117 E.00012
G3 X127.75 Y42.13 I.059 J2.008 E.38231
G1 X127.867 Y42.122 E.00362
; WIPE_START
M204 S10000
G1 X127.931 Y42.117 E-.02425
G1 X128.149 Y42.12 E-.08292
G1 X128.544 Y42.19 E-.15251
G1 X128.917 Y42.336 E-.15208
G1 X129.253 Y42.553 E-.15214
G1 X129.54 Y42.833 E-.15212
G1 X129.605 Y42.928 E-.04397
; WIPE_END
G1 E-.04 F1800
G1 X122.056 Y41.804 Z3.2 F30000
G1 X86.099 Y36.451 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G3 X86.623 Y36.311 I.632 J1.311 E.01808
G1 X89.379 Y36.311 E.09142
G3 X90.529 Y39.381 I-.193 J1.823 E.13459
G3 X91.016 Y40.558 I-1.277 J1.218 E.04324
G1 X91.014 Y42.304 E.05793
G3 X89.234 Y43.941 I-1.817 J-.19 E.08765
G1 X86.656 Y43.939 E.08554
G3 X86.113 Y43.805 I.194 J-1.944 E.01861
G3 X85.469 Y43.941 I-.665 J-1.55 E.02198
G1 X82.821 Y43.939 E.08785
G3 X81.184 Y42.16 I.197 J-1.824 E.08757
G1 X81.186 Y37.946 E.13978
G3 X82.644 Y36.337 I1.848 J.21 E.07692
G1 X82.931 Y36.309 E.00956
G1 X85.579 Y36.311 E.08785
G3 X86.045 Y36.426 I-.092 J1.378 E.016
G1 X86.101 Y36.903 F30000
G1 F16213.044
G3 X86.663 Y36.718 I.757 J1.355 E.01974
G1 X89.339 Y36.718 E.08877
G3 X89.918 Y39.338 I-.142 J1.406 E.11737
G1 X90.25 Y39.684 E.01592
G3 X90.609 Y40.577 I-.972 J.909 E.03267
G1 X90.607 Y42.264 E.05596
G3 X89.225 Y43.534 I-1.409 J-.147 E.06807
G1 X86.686 Y43.532 E.08421
G3 X86.104 Y43.35 I.123 J-1.42 E.0204
G3 X85.449 Y43.534 I-.742 J-1.384 E.02272
G1 X82.861 Y43.532 E.08585
G3 X81.591 Y42.15 I.153 J-1.415 E.068
G1 X81.593 Y37.986 E.13811
G3 X82.724 Y36.738 I1.434 J.163 E.05966
G1 X82.951 Y36.716 E.00756
G1 X85.539 Y36.718 E.08585
G3 X86.048 Y36.875 I-.211 J1.587 E.01774
G1 X86.099 Y37.397 F30000
G1 F16213.044
G3 X86.702 Y37.125 I.834 J1.046 E.02217
G1 X89.298 Y37.125 E.08612
G3 X89.966 Y38.773 I-.117 J1.007 E.07195
G3 X89.184 Y39.162 I-.935 J-.9 E.02955
G1 X89.943 Y39.952 E.03634
G3 X90.202 Y40.596 I-.696 J.654 E.02359
G1 X90.2 Y42.224 E.05398
G3 X89.215 Y43.127 I-1.027 J-.131 E.0482
G1 X86.716 Y43.125 E.08288
G3 X86.094 Y42.848 I.125 J-1.119 E.02295
G3 X85.429 Y43.127 I-.699 J-.735 E.02444
G1 X82.901 Y43.125 E.08386
G3 X81.998 Y42.14 I.109 J-1.007 E.04843
G1 X82 Y38.026 E.13645
G3 X82.804 Y37.139 I1.019 J.116 E.0424
G1 X82.971 Y37.123 E.00556
G1 X85.499 Y37.125 E.08386
G3 X86.052 Y37.36 I-.237 J1.323 E.02011
; WIPE_START
G1 X86.36 Y37.224 E-.12813
G1 X86.513 Y37.162 E-.06268
G1 X86.702 Y37.125 E-.07337
G1 X88.007 Y37.125 E-.49582
; WIPE_END
G1 E-.04 F1800
G1 X86.53 Y41.581 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X86.79 Y41.515 I.277 J.544 E.00832
G1 X88.59 Y41.515 E.05532
G1 X88.59 Y40.87 E.01981
G1 X86.353 Y38.54 E.09926
G3 X86.625 Y37.54 I.461 J-.412 E.03779
G1 X86.741 Y37.517 E.00362
G1 X89.26 Y37.517 E.07741
G3 X89.21 Y38.735 I-.063 J.607 E.05663
G1 X88.231 Y38.735 E.03009
G1 X89.647 Y40.21 E.06282
G3 X89.81 Y40.615 I-.638 J.492 E.01359
G1 X89.808 Y42.185 E.04824
G3 X89.205 Y42.735 I-.625 J-.08 E.02728
G1 X86.745 Y42.733 E.07559
G3 X86.477 Y41.611 I.062 J-.608 E.04637
; WIPE_START
M204 S10000
G1 X86.686 Y41.525 E-.0857
G1 X86.79 Y41.515 E-.03963
G1 X88.46 Y41.515 E-.63468
; WIPE_END
G1 E-.04 F1800
G1 X85.983 Y38.302 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
G1 F12000
M204 S5000
G3 X85.41 Y38.735 I-.584 J-.177 E.02359
G1 X83.61 Y38.735 E.05532
G1 X83.61 Y41.515 E.08542
G1 X85.407 Y41.515 E.05522
G3 X85.41 Y42.735 I-.009 J.61 E.05823
G1 X82.94 Y42.733 E.0759
G3 X82.39 Y42.13 I.067 J-.613 E.0274
G1 X82.392 Y38.065 E.12491
G3 X82.881 Y37.526 I.619 J.07 E.02388
G1 X85.46 Y37.517 E.07925
G3 X85.998 Y38.244 I-.061 J.608 E.03128
; WIPE_START
M204 S10000
G1 X85.872 Y38.513 E-.11277
G1 X85.791 Y38.594 E-.04354
G1 X85.672 Y38.671 E-.05413
G1 X85.514 Y38.725 E-.06329
G1 X85.41 Y38.735 E-.03962
G1 X84.235 Y38.735 E-.44665
; WIPE_END
G1 E-.04 F1800
G1 X88.87 Y44.799 Z3.2 F30000
G1 X205.416 Y197.291 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X50.584 Y197.291 E5.13608
G1 X50.584 Y54.709 E4.72972
G1 X205.416 Y54.709 E5.13608
G1 X205.416 Y197.231 E4.72773
G1 X205.009 Y196.884 F30000
G1 F16213.044
G1 X50.991 Y196.884 E5.10907
G1 X50.991 Y55.116 E4.70271
G1 X205.009 Y55.116 E5.10907
G1 X205.009 Y196.824 E4.70072
G1 X204.602 Y196.477 F30000
G1 F16213.044
G1 X51.398 Y196.477 E5.08206
G1 X51.398 Y55.523 E4.67571
G1 X204.602 Y55.523 E5.08206
G1 X204.602 Y196.417 E4.67372
G1 X204.21 Y196.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X51.79 Y196.085 E4.68344
G1 X51.79 Y55.915 E4.30703
G1 X204.21 Y55.915 E4.68344
G1 X204.21 Y196.025 E4.30519
; WIPE_START
M204 S10000
G1 X202.21 Y196.026 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X196.691 Y190.753 Z3.2 F30000
G1 X39.845 Y40.914 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X39.896 Y40.91 E.0017
G3 X40.234 Y40.915 I.114 J3.506 E.01123
G3 X39.6 Y40.932 I-.232 J3.208 E.64923
G1 X39.785 Y40.918 E.00615
G1 X39.874 Y41.32 F30000
G1 F16213.044
G1 X39.908 Y41.317 E.00113
G3 X40.205 Y41.322 I.1 J3.066 E.00988
G3 X39.65 Y41.336 I-.204 J2.801 E.56696
G1 X39.814 Y41.324 E.00544
G1 X39.921 Y41.735 F30000
G1 F16213.044
G1 X40.177 Y41.729 E.00848
G3 X39.701 Y41.741 I-.176 J2.395 E.4847
G1 X39.861 Y41.737 E.00531
G1 X39.927 Y42.117 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X39.931 Y42.117 E.00012
G3 X39.75 Y42.13 I.059 J2.008 E.38231
G1 X39.867 Y42.122 E.00362
; WIPE_START
M204 S10000
G1 X39.931 Y42.117 E-.02424
G1 X40.149 Y42.12 E-.08292
G1 X40.544 Y42.19 E-.15251
G1 X40.917 Y42.336 E-.15208
G1 X41.253 Y42.553 E-.15216
G1 X41.54 Y42.833 E-.15211
G1 X41.605 Y42.928 E-.04398
; WIPE_END
G1 E-.04 F1800
G1 X41.437 Y50.559 Z3.2 F30000
G1 X39.845 Y122.789 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X39.896 Y122.785 E.0017
G3 X40.234 Y122.79 I.114 J3.509 E.01123
G3 X39.6 Y122.807 I-.232 J3.208 E.64923
G1 X39.785 Y122.793 E.00615
G1 X39.874 Y123.195 F30000
G1 F16213.044
G1 X39.908 Y123.192 E.00113
G3 X40.205 Y123.197 I.101 J3.069 E.00989
G3 X39.65 Y123.211 I-.204 J2.801 E.56696
G1 X39.814 Y123.199 E.00544
G1 X39.921 Y123.61 F30000
G1 F16213.044
G1 X40.177 Y123.604 E.00849
G3 X39.701 Y123.616 I-.176 J2.395 E.48469
G1 X39.861 Y123.612 E.00531
G1 X39.927 Y123.992 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X39.931 Y123.992 E.00012
G3 X39.75 Y124.005 I.059 J2.008 E.38231
G1 X39.867 Y123.997 E.00361
; WIPE_START
M204 S10000
G1 X39.931 Y123.992 E-.02431
G1 X40.149 Y123.995 E-.08296
G1 X40.544 Y124.065 E-.15244
G1 X40.917 Y124.211 E-.15213
G1 X41.253 Y124.428 E-.1521
G1 X41.54 Y124.708 E-.15216
G1 X41.605 Y124.803 E-.04391
; WIPE_END
G1 E-.04 F1800
G1 X41.48 Y132.435 Z3.2 F30000
G1 X40.295 Y204.673 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X40.559 Y204.705 E.00881
G3 X39.6 Y204.682 I-.557 J3.167 E.63837
G3 X40.234 Y204.665 I.41 J3.476 E.02107
G1 X40.236 Y204.665 E.00006
G1 X40.246 Y205.077 F30000
G1 F16213.044
G1 X40.488 Y205.107 E.00809
G3 X39.651 Y205.086 I-.487 J2.766 E.55752
G3 X40.186 Y205.071 I.358 J3.041 E.0178
G1 X40.197 Y205.481 F30000
G1 F16213.044
G1 X40.417 Y205.512 E.00737
G3 X39.701 Y205.491 I-.427 J2.363 E.47672
G1 X39.92 Y205.474 E.00726
G3 X40.137 Y205.478 I.07 J2.401 E.00721
G1 X40.197 Y205.879 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X40.543 Y205.943 E.01083
G3 X39.75 Y205.88 I-.553 J1.932 E.36327
G1 X39.931 Y205.867 E.00558
G3 X40.137 Y205.871 I.06 J2.008 E.00634
; WIPE_START
M204 S10000
G1 X40.543 Y205.943 E-.15674
G1 X40.917 Y206.086 E-.15199
G1 X41.253 Y206.303 E-.15212
G1 X41.54 Y206.583 E-.15209
G1 X41.758 Y206.903 E-.14707
; WIPE_END
G1 E-.04 F1800
G1 X49.375 Y207.379 Z3.2 F30000
G1 X226.584 Y218.459 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
G1 X29.416 Y218.459 E6.54041
G1 X29.416 Y33.541 E6.13406
G1 X226.584 Y33.541 E6.54041
G1 X226.584 Y218.399 E6.13207
G1 X226.991 Y218.866 F30000
G1 F16213.044
G1 X29.009 Y218.866 E6.56742
G1 X29.009 Y33.134 E6.16106
G1 X226.991 Y33.134 E6.56742
G1 X226.991 Y218.806 E6.15907
G1 X227.398 Y219.273 F30000
G1 F16213.044
G1 X28.602 Y219.273 E6.59442
G1 X28.602 Y32.727 E6.18807
G1 X227.398 Y32.727 E6.59442
G1 X227.398 Y219.213 E6.18608
G1 X227.79 Y219.665 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X28.21 Y219.665 E6.13254
G1 X28.21 Y32.335 E5.75613
G1 X227.79 Y32.335 E6.13254
G1 X227.79 Y219.605 E5.75429
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
G1 F15000
G1 X226.251 Y217.702 E.02578
G1 X226.251 Y217.169 E.0164
G1 X225.294 Y218.126 E.04161
G1 X224.76 Y218.126 E.0164
G1 X226.251 Y216.635 E.06481
G1 X226.251 Y216.101 E.0164
G1 X224.226 Y218.126 E.088
G1 X223.693 Y218.126 E.0164
G1 X226.251 Y215.568 E.1112
G1 X226.251 Y215.034 E.0164
G1 X223.159 Y218.126 E.1344
G1 X222.626 Y218.126 E.0164
G1 X226.251 Y214.501 E.1576
G1 X226.251 Y213.967 E.0164
G1 X222.092 Y218.126 E.1808
G1 X221.559 Y218.126 E.0164
G1 X226.251 Y213.434 E.204
G1 X226.251 Y212.9 E.0164
G1 X221.025 Y218.126 E.2272
G1 X220.492 Y218.126 E.0164
G1 X226.251 Y212.366 E.2504
G1 X226.251 Y211.833 E.0164
G1 X219.958 Y218.126 E.2736
G1 X219.424 Y218.126 E.0164
G1 X226.251 Y211.299 E.2968
G1 X226.251 Y210.766 E.0164
G1 X218.891 Y218.126 E.32
G1 X218.357 Y218.126 E.0164
G1 X226.251 Y210.232 E.34319
G1 X226.251 Y209.699 E.0164
G1 X217.824 Y218.126 E.36639
G1 X217.29 Y218.126 E.0164
G1 X226.251 Y209.165 E.38959
G1 X226.251 Y208.632 E.0164
G1 X216.757 Y218.126 E.41279
G1 X216.223 Y218.126 E.0164
G1 X226.251 Y208.098 E.43599
G1 X226.251 Y207.564 E.0164
G1 X215.689 Y218.126 E.45919
G1 X215.156 Y218.126 E.0164
G1 X226.251 Y207.031 E.48239
G1 X226.251 Y206.497 E.0164
G1 X214.622 Y218.126 E.50559
G1 X214.089 Y218.126 E.0164
G1 X226.251 Y205.964 E.52879
G1 X226.251 Y205.43 E.0164
G1 X213.555 Y218.126 E.55199
G1 X213.022 Y218.126 E.0164
G1 X226.251 Y204.897 E.57518
G1 X226.251 Y204.363 E.0164
G1 X212.488 Y218.126 E.59838
G1 X211.954 Y218.126 E.0164
G1 X226.251 Y203.829 E.62158
G1 X226.251 Y203.296 E.0164
G1 X211.421 Y218.126 E.64478
G1 X210.887 Y218.126 E.0164
G1 X226.251 Y202.762 E.66798
G1 X226.251 Y202.229 E.0164
G1 X219.3 Y209.179 E.30219
G2 X219.502 Y208.444 I-3.418 J-1.331 E.02347
G1 X226.251 Y201.695 E.29344
G1 X226.251 Y201.162 E.0164
G1 X219.551 Y207.861 E.29129
G2 X219.511 Y207.368 I-2.49 J-.046 E.01525
G1 X226.251 Y200.628 E.29304
G1 X226.251 Y200.094 E.0164
G1 X219.419 Y206.926 E.29704
G2 X219.284 Y206.527 I-2.065 J.474 E.01297
G1 X226.251 Y199.561 E.30289
G1 X226.251 Y199.027 E.0164
G1 X219.112 Y206.165 E.31036
G2 X218.907 Y205.838 I-1.738 J.862 E.01192
G1 X226.251 Y198.494 E.3193
G1 X226.251 Y197.96 E.0164
G1 X218.672 Y205.539 E.32953
G2 X218.408 Y205.269 I-1.478 J1.179 E.01162
G1 X226.251 Y197.427 E.34098
G1 X226.251 Y196.893 E.0164
G1 X218.116 Y205.028 E.35368
G2 X217.795 Y204.815 I-1.223 J1.501 E.01186
G1 X226.251 Y196.359 E.36765
G1 X226.251 Y195.826 E.0164
G1 X217.442 Y204.634 E.38298
G2 X217.055 Y204.487 I-.927 J1.862 E.01274
G1 X226.251 Y195.292 E.3998
G1 X226.251 Y194.759 E.0164
G1 X216.629 Y204.38 E.41833
G2 X216.145 Y204.33 I-.756 J4.99 E.01496
G1 X226.251 Y194.225 E.43937
G1 X226.251 Y193.692 E.0164
G1 X215.594 Y204.348 E.46334
G2 X214.913 Y204.496 I.579 J4.314 E.02146
G1 X226.251 Y193.158 E.49297
M73 P84 R9
G1 X226.251 Y192.624 E.0164
G1 X200.749 Y218.126 E1.10876
G1 X201.283 Y218.126 E.0164
G1 X212.624 Y206.784 E.49311
G2 X212.476 Y207.466 I3.456 J1.109 E.02149
G1 X201.817 Y218.126 E.46346
G1 X202.35 Y218.126 E.0164
G1 X212.453 Y208.023 E.43925
G2 X212.508 Y208.502 I4.815 J-.31 E.01482
G1 X202.884 Y218.126 E.41844
G1 X203.417 Y218.126 E.0164
G1 X212.613 Y208.93 E.39983
G2 X212.759 Y209.318 I2.013 J-.533 E.01276
G1 X203.951 Y218.126 E.38295
G1 X204.484 Y218.126 E.0164
G1 X212.939 Y209.671 E.36759
G2 X213.151 Y209.993 I1.714 J-.897 E.01186
G1 X205.018 Y218.126 E.3536
G1 X205.552 Y218.126 E.0164
G1 X213.392 Y210.285 E.34089
G2 X213.663 Y210.548 I10.995 J-11.056 E.0116
G1 X206.085 Y218.126 E.32946
G1 X206.619 Y218.126 E.0164
G1 X213.962 Y210.782 E.3193
G2 X214.292 Y210.986 I1.182 J-1.542 E.01194
G1 X207.152 Y218.126 E.31043
G1 X207.686 Y218.126 E.0164
G1 X214.654 Y211.157 E.30297
G2 X215.052 Y211.293 I.878 J-1.922 E.01294
G1 X208.219 Y218.126 E.29707
G1 X208.753 Y218.126 E.0164
G1 X215.491 Y211.387 E.29297
G2 X215.988 Y211.424 I.563 J-4.284 E.01533
G1 X209.287 Y218.126 E.29139
G1 X209.82 Y218.126 E.0164
G1 X216.567 Y211.379 E.29333
G2 X217.299 Y211.181 I-.292 J-2.527 E.0234
G1 X210.184 Y218.295 E.30934
G1 X200.046 Y218.295 F30000
G1 F15000
G1 X226.251 Y192.091 E1.13934
G1 X226.251 Y191.557 E.0164
G1 X199.682 Y218.126 E1.15516
G1 X199.149 Y218.126 E.0164
G1 X226.251 Y191.024 E1.17836
G1 X226.251 Y190.49 E.0164
G1 X198.615 Y218.126 E1.20156
G1 X198.082 Y218.126 E.0164
G1 X226.251 Y189.957 E1.22476
G1 X226.251 Y189.423 E.0164
G1 X197.548 Y218.126 E1.24796
G1 X197.014 Y218.126 E.0164
G1 X226.251 Y188.889 E1.27116
G1 X226.251 Y188.356 E.0164
G1 X196.481 Y218.126 E1.29436
G1 X195.947 Y218.126 E.0164
G1 X226.251 Y187.822 E1.31756
G1 X226.251 Y187.289 E.0164
G1 X195.414 Y218.126 E1.34075
G1 X194.88 Y218.126 E.0164
G1 X226.251 Y186.755 E1.36395
G1 X226.251 Y186.222 E.0164
G1 X194.347 Y218.126 E1.38715
G1 X193.813 Y218.126 E.0164
G1 X226.251 Y185.688 E1.41035
G1 X226.251 Y185.155 E.0164
G1 X193.279 Y218.126 E1.43355
G1 X192.746 Y218.126 E.0164
G1 X226.251 Y184.621 E1.45675
G1 X226.251 Y184.087 E.0164
G1 X192.212 Y218.126 E1.47995
G1 X191.679 Y218.126 E.0164
G1 X226.251 Y183.554 E1.50315
G1 X226.251 Y183.02 E.0164
G1 X191.145 Y218.126 E1.52635
G1 X190.612 Y218.126 E.0164
G1 X226.251 Y182.487 E1.54955
G1 X226.251 Y181.953 E.0164
G1 X190.078 Y218.126 E1.57275
G1 X189.545 Y218.126 E.0164
G1 X226.251 Y181.42 E1.59594
G1 X226.251 Y180.886 E.0164
G1 X189.011 Y218.126 E1.61914
G1 X188.477 Y218.126 E.0164
G1 X226.251 Y180.352 E1.64234
G1 X226.251 Y179.819 E.0164
G1 X187.944 Y218.126 E1.66554
G1 X187.41 Y218.126 E.0164
G1 X226.251 Y179.285 E1.68874
G1 X226.251 Y178.752 E.0164
G1 X186.877 Y218.126 E1.71194
G1 X186.343 Y218.126 E.0164
G1 X226.251 Y178.218 E1.73514
G1 X226.251 Y177.685 E.0164
G1 X185.81 Y218.126 E1.75834
G1 X185.276 Y218.126 E.0164
G1 X226.251 Y177.151 E1.78154
G1 X226.251 Y176.617 E.0164
G1 X205.749 Y197.118 E.89137
G1 X205.749 Y196.585 E.0164
G1 X226.251 Y176.084 E.89137
G1 X226.251 Y175.55 E.0164
G1 X205.749 Y196.051 E.89137
G1 X205.749 Y195.518 E.0164
G1 X226.251 Y175.017 E.89137
G1 X226.251 Y174.483 E.0164
G1 X205.749 Y194.984 E.89137
G1 X205.749 Y194.451 E.0164
G1 X226.251 Y173.95 E.89137
G1 X226.251 Y173.416 E.0164
G1 X205.749 Y193.917 E.89137
M73 P85 R9
G1 X205.749 Y193.383 E.0164
G1 X226.251 Y172.882 E.89137
G1 X226.251 Y172.349 E.0164
G1 X205.749 Y192.85 E.89137
G1 X205.749 Y192.316 E.0164
G1 X226.251 Y171.815 E.89137
G1 X226.251 Y171.282 E.0164
G1 X205.749 Y191.783 E.89137
G1 X205.749 Y191.249 E.0164
G1 X226.251 Y170.748 E.89137
G1 X226.251 Y170.215 E.0164
G1 X205.749 Y190.716 E.89137
G1 X205.749 Y190.182 E.0164
G1 X226.251 Y169.681 E.89137
G1 X226.251 Y169.147 E.0164
G1 X205.749 Y189.649 E.89137
G1 X205.749 Y189.115 E.0164
G1 X226.251 Y168.614 E.89137
G1 X226.251 Y168.08 E.0164
G1 X205.749 Y188.581 E.89137
G1 X205.749 Y188.048 E.0164
G1 X226.251 Y167.547 E.89137
G1 X226.251 Y167.013 E.0164
G1 X205.749 Y187.514 E.89137
G1 X205.749 Y186.981 E.0164
G1 X226.251 Y166.48 E.89137
G1 X226.251 Y165.946 E.0164
G1 X205.749 Y186.447 E.89137
G1 X205.749 Y185.914 E.0164
G1 X226.251 Y165.412 E.89137
G1 X226.251 Y164.879 E.0164
G1 X205.749 Y185.38 E.89137
G1 X205.749 Y184.846 E.0164
G1 X226.251 Y164.345 E.89137
G1 X226.251 Y163.812 E.0164
G1 X205.749 Y184.313 E.89137
G1 X205.749 Y183.779 E.0164
G1 X226.251 Y163.278 E.89137
G1 X226.251 Y162.745 E.0164
G1 X205.749 Y183.246 E.89137
G1 X205.749 Y182.712 E.0164
G1 X226.251 Y162.211 E.89137
G1 X226.251 Y161.677 E.0164
G1 X205.749 Y182.179 E.89137
G1 X205.749 Y181.645 E.0164
G1 X226.251 Y161.144 E.89137
G1 X226.251 Y160.61 E.0164
G1 X205.749 Y181.111 E.89137
G1 X205.749 Y180.578 E.0164
G1 X226.251 Y160.077 E.89137
G1 X226.251 Y159.543 E.0164
G1 X205.749 Y180.044 E.89137
G1 X205.749 Y179.511 E.0164
G1 X226.251 Y159.01 E.89137
G1 X226.251 Y158.476 E.0164
G1 X205.749 Y178.977 E.89137
G1 X205.749 Y178.444 E.0164
G1 X226.251 Y157.942 E.89137
G1 X226.251 Y157.409 E.0164
G1 X205.749 Y177.91 E.89137
G1 X205.749 Y177.376 E.0164
G1 X226.251 Y156.875 E.89137
G1 X226.251 Y156.342 E.0164
G1 X205.749 Y176.843 E.89137
G1 X205.749 Y176.309 E.0164
G1 X226.251 Y155.808 E.89137
G1 X226.251 Y155.275 E.0164
G1 X205.749 Y175.776 E.89137
G1 X205.749 Y175.242 E.0164
G1 X226.251 Y154.741 E.89137
G1 X226.251 Y154.208 E.0164
G1 X205.749 Y174.709 E.89137
G1 X205.749 Y174.175 E.0164
G1 X226.251 Y153.674 E.89137
G1 X226.251 Y153.14 E.0164
G1 X205.749 Y173.641 E.89137
G1 X205.749 Y173.108 E.0164
G1 X226.251 Y152.607 E.89137
G1 X226.251 Y152.073 E.0164
G1 X205.749 Y172.574 E.89137
G1 X205.749 Y172.041 E.0164
G1 X226.251 Y151.54 E.89137
G1 X226.251 Y151.006 E.0164
G1 X205.749 Y171.507 E.89137
G1 X205.749 Y170.974 E.0164
G1 X226.251 Y150.473 E.89137
G1 X226.251 Y149.939 E.0164
G1 X205.749 Y170.44 E.89137
G1 X205.749 Y169.906 E.0164
G1 X226.251 Y149.405 E.89137
G1 X226.251 Y148.872 E.0164
G1 X205.749 Y169.373 E.89137
G1 X205.749 Y168.839 E.0164
G1 X226.251 Y148.338 E.89137
G1 X226.251 Y147.805 E.0164
G1 X205.749 Y168.306 E.89137
G1 X205.749 Y167.772 E.0164
G1 X226.251 Y147.271 E.89137
G1 X226.251 Y146.738 E.0164
G1 X205.749 Y167.239 E.89137
G1 X205.749 Y166.705 E.0164
G1 X226.251 Y146.204 E.89137
G1 X226.251 Y145.67 E.0164
G1 X205.749 Y166.171 E.89137
G1 X205.749 Y165.638 E.0164
G1 X226.251 Y145.137 E.89137
G1 X226.251 Y144.603 E.0164
G1 X205.749 Y165.104 E.89137
G1 X205.749 Y164.571 E.0164
G1 X226.251 Y144.07 E.89137
G1 X226.251 Y143.536 E.0164
G1 X205.749 Y164.037 E.89137
G1 X205.749 Y163.504 E.0164
G1 X226.251 Y143.003 E.89137
G1 X226.251 Y142.469 E.0164
G1 X205.749 Y162.97 E.89137
G1 X205.749 Y162.437 E.0164
G1 X226.251 Y141.935 E.89137
G1 X226.251 Y141.402 E.0164
G1 X205.749 Y161.903 E.89137
G1 X205.749 Y161.369 E.0164
G1 X226.251 Y140.868 E.89137
G1 X226.251 Y140.335 E.0164
G1 X205.749 Y160.836 E.89137
G1 X205.749 Y160.302 E.0164
G1 X226.251 Y139.801 E.89137
G1 X226.251 Y139.268 E.0164
G1 X205.749 Y159.769 E.89137
G1 X205.749 Y159.235 E.0164
G1 X226.251 Y138.734 E.89137
G1 X226.251 Y138.2 E.0164
G1 X205.749 Y158.702 E.89137
G1 X205.749 Y158.168 E.0164
G1 X226.251 Y137.667 E.89137
G1 X226.251 Y137.133 E.0164
G1 X205.749 Y157.634 E.89137
G1 X205.749 Y157.101 E.0164
G1 X226.251 Y136.6 E.89137
G1 X226.251 Y136.066 E.0164
G1 X205.749 Y156.567 E.89137
G1 X205.749 Y156.034 E.0164
G1 X226.251 Y135.533 E.89137
G1 X226.251 Y134.999 E.0164
G1 X205.749 Y155.5 E.89137
G1 X205.749 Y154.967 E.0164
G1 X226.251 Y134.465 E.89137
G1 X226.251 Y133.932 E.0164
G1 X205.749 Y154.433 E.89137
G1 X205.749 Y153.899 E.0164
G1 X226.251 Y133.398 E.89137
G1 X226.251 Y132.865 E.0164
G1 X205.749 Y153.366 E.89137
G1 X205.749 Y152.832 E.0164
G1 X226.251 Y132.331 E.89137
G1 X226.251 Y131.798 E.0164
G1 X205.749 Y152.299 E.89137
G1 X205.749 Y151.765 E.0164
G1 X226.251 Y131.264 E.89137
G1 X226.251 Y130.731 E.0164
G1 X205.749 Y151.232 E.89137
G1 X205.749 Y150.698 E.0164
G1 X226.251 Y130.197 E.89137
G1 X226.251 Y129.663 E.0164
G1 X205.749 Y150.164 E.89137
G1 X205.749 Y149.631 E.0164
G1 X226.251 Y129.13 E.89137
G1 X226.251 Y128.596 E.0164
G1 X205.749 Y149.097 E.89137
G1 X205.749 Y148.564 E.0164
G1 X226.251 Y128.063 E.89137
G1 X226.251 Y127.529 E.0164
G1 X205.749 Y148.03 E.89137
G1 X205.749 Y147.497 E.0164
G1 X226.251 Y126.996 E.89137
G1 X226.251 Y126.462 E.0164
G1 X205.749 Y146.963 E.89137
G1 X205.749 Y146.429 E.0164
G1 X226.251 Y125.928 E.89137
G1 X226.251 Y125.395 E.0164
G1 X205.749 Y145.896 E.89137
G1 X205.749 Y145.362 E.0164
G1 X226.251 Y124.861 E.89137
G1 X226.251 Y124.328 E.0164
G1 X205.749 Y144.829 E.89137
G1 X205.749 Y144.295 E.0164
G1 X226.251 Y123.794 E.89137
G1 X226.251 Y123.261 E.0164
G1 X205.749 Y143.762 E.89137
G1 X205.749 Y143.228 E.0164
G1 X226.251 Y122.727 E.89137
G1 X226.251 Y122.193 E.0164
G1 X205.749 Y142.694 E.89137
G1 X205.749 Y142.161 E.0164
G1 X226.251 Y121.66 E.89137
G1 X226.251 Y121.126 E.0164
G1 X205.749 Y141.627 E.89137
G1 X205.749 Y141.094 E.0164
G1 X226.251 Y120.593 E.89137
G1 X226.251 Y120.059 E.0164
G1 X219.439 Y126.871 E.29617
G2 X219.54 Y126.236 I-3.509 J-.885 E.01979
G1 X226.251 Y119.526 E.29178
G1 X226.251 Y118.992 E.0164
G1 X219.537 Y125.706 E.2919
G2 X219.467 Y125.242 I-4.777 J.479 E.01443
G1 X226.251 Y118.458 E.29493
G1 X226.251 Y117.925 E.0164
G1 X219.348 Y124.827 E.30011
G2 X219.191 Y124.451 I-1.957 J.595 E.01256
G1 X226.251 Y117.391 E.30694
G1 X226.251 Y116.858 E.0164
G1 X219.001 Y124.108 E.31522
G2 X218.78 Y123.795 I-1.675 J.949 E.01179
G1 X226.251 Y116.324 E.32482
G1 X226.251 Y115.791 E.0164
G1 X218.53 Y123.511 E.33569
G2 X218.252 Y123.256 I-1.413 J1.261 E.01163
G1 X226.251 Y115.257 E.34779
G1 X226.251 Y114.723 E.0164
G1 X217.945 Y123.029 E.36113
G2 X217.607 Y122.833 I-5.497 J9.092 E.012
G1 X226.251 Y114.19 E.37582
G1 X226.251 Y113.656 E.0164
G1 X217.234 Y122.673 E.39202
G2 X216.824 Y122.55 I-.822 J1.996 E.0132
G1 X226.251 Y113.123 E.40987
G1 X226.251 Y112.589 E.0164
G1 X216.369 Y122.471 E.42966
G2 X215.852 Y122.454 I-.415 J4.696 E.01589
G1 X226.251 Y112.056 E.45211
G1 X226.251 Y111.522 E.0164
G1 X215.241 Y122.532 E.4787
G2 X214.41 Y122.829 I.529 J2.789 E.02722
G1 X226.251 Y110.988 E.51481
G1 X226.251 Y110.455 E.0164
G1 X205.749 Y130.956 E.89137
G1 X205.749 Y131.49 E.0164
G1 X212.824 Y124.415 E.3076
G2 X212.535 Y125.237 I2.409 J1.308 E.02691
G1 X205.749 Y132.023 E.29504
G1 X205.749 Y132.557 E.0164
G1 X212.453 Y125.853 E.29145
G2 X212.472 Y126.368 I2.58 J.162 E.01585
G1 X205.749 Y133.09 E.29228
G1 X205.749 Y133.624 E.0164
G1 X212.548 Y126.825 E.29559
G2 X212.671 Y127.236 I6.108 J-1.614 E.01317
G1 X205.749 Y134.157 E.30096
G1 X205.749 Y134.691 E.0164
G1 X212.835 Y127.605 E.30808
G2 X213.031 Y127.943 I1.785 J-.812 E.01202
G1 X205.749 Y135.225 E.31661
G1 X205.749 Y135.758 E.0164
G1 X213.257 Y128.25 E.32644
G2 X213.512 Y128.529 I1.522 J-1.136 E.01163
G1 X205.749 Y136.292 E.33752
G1 X205.749 Y136.825 E.0164
G1 X213.796 Y128.779 E.34984
G2 X214.108 Y129.001 I1.263 J-1.45 E.01179
G1 X205.749 Y137.359 E.36341
G1 X205.749 Y137.892 E.0164
G1 X214.45 Y129.192 E.3783
G2 X214.826 Y129.35 I.977 J-1.797 E.01255
G1 X205.749 Y138.426 E.39462
G1 X205.749 Y138.96 E.0164
G1 X215.241 Y129.468 E.41268
G2 X215.707 Y129.535 I.569 J-2.301 E.01451
G1 X205.749 Y139.493 E.43296
G1 X205.749 Y140.027 E.0164
G1 X216.234 Y129.543 E.45584
G2 X216.87 Y129.44 I-.369 J-4.314 E.01983
G1 X205.58 Y140.73 E.49088
G1 X205.58 Y130.592 F30000
G1 F15000
G1 X226.251 Y109.921 E.89875
G1 X226.251 Y109.388 E.0164
G1 X205.749 Y129.889 E.89137
G1 X205.749 Y129.355 E.0164
G1 X226.251 Y108.854 E.89137
G1 X226.251 Y108.321 E.0164
G1 X205.749 Y128.822 E.89137
G1 X205.749 Y128.288 E.0164
G1 X226.251 Y107.787 E.89137
G1 X226.251 Y107.253 E.0164
G1 X205.749 Y127.755 E.89137
G1 X205.749 Y127.221 E.0164
G1 X226.251 Y106.72 E.89137
G1 X226.251 Y106.186 E.0164
G1 X205.749 Y126.687 E.89137
G1 X205.749 Y126.154 E.0164
G1 X226.251 Y105.653 E.89137
G1 X226.251 Y105.119 E.0164
G1 X205.749 Y125.62 E.89137
G1 X205.749 Y125.087 E.0164
G1 X226.251 Y104.586 E.89137
G1 X226.251 Y104.052 E.0164
G1 X205.749 Y124.553 E.89137
G1 X205.749 Y124.02 E.0164
G1 X226.251 Y103.519 E.89137
G1 X226.251 Y102.985 E.0164
G1 X205.749 Y123.486 E.89137
G1 X205.749 Y122.952 E.0164
G1 X226.251 Y102.451 E.89137
G1 X226.251 Y101.918 E.0164
G1 X205.749 Y122.419 E.89137
G1 X205.749 Y121.885 E.0164
G1 X226.251 Y101.384 E.89137
G1 X226.251 Y100.851 E.0164
G1 X205.749 Y121.352 E.89137
G1 X205.749 Y120.818 E.0164
G1 X226.251 Y100.317 E.89137
G1 X226.251 Y99.784 E.0164
G1 X205.749 Y120.285 E.89137
G1 X205.749 Y119.751 E.0164
G1 X226.251 Y99.25 E.89137
G1 X226.251 Y98.716 E.0164
G1 X205.749 Y119.217 E.89137
G1 X205.749 Y118.684 E.0164
G1 X226.251 Y98.183 E.89137
G1 X226.251 Y97.649 E.0164
G1 X205.749 Y118.15 E.89137
G1 X205.749 Y117.617 E.0164
G1 X226.251 Y97.116 E.89137
G1 X226.251 Y96.582 E.0164
G1 X205.749 Y117.083 E.89137
G1 X205.749 Y116.55 E.0164
G1 X226.251 Y96.049 E.89137
G1 X226.251 Y95.515 E.0164
G1 X205.749 Y116.016 E.89137
G1 X205.749 Y115.482 E.0164
G1 X226.251 Y94.981 E.89137
G1 X226.251 Y94.448 E.0164
G1 X205.749 Y114.949 E.89137
G1 X205.749 Y114.415 E.0164
G1 X226.251 Y93.914 E.89137
G1 X226.251 Y93.381 E.0164
G1 X205.749 Y113.882 E.89137
G1 X205.749 Y113.348 E.0164
G1 X226.251 Y92.847 E.89137
G1 X226.251 Y92.314 E.0164
G1 X205.749 Y112.815 E.89137
G1 X205.749 Y112.281 E.0164
G1 X226.251 Y91.78 E.89137
G1 X226.251 Y91.246 E.0164
G1 X205.749 Y111.748 E.89137
G1 X205.749 Y111.214 E.0164
G1 X226.251 Y90.713 E.89137
G1 X226.251 Y90.179 E.0164
G1 X205.749 Y110.68 E.89137
G1 X205.749 Y110.147 E.0164
G1 X226.251 Y89.646 E.89137
G1 X226.251 Y89.112 E.0164
G1 X205.749 Y109.613 E.89137
G1 X205.749 Y109.08 E.0164
G1 X226.251 Y88.579 E.89137
G1 X226.251 Y88.045 E.0164
G1 X205.749 Y108.546 E.89137
G1 X205.749 Y108.013 E.0164
G1 X226.251 Y87.511 E.89137
G1 X226.251 Y86.978 E.0164
G1 X205.749 Y107.479 E.89137
G1 X205.749 Y106.945 E.0164
G1 X226.251 Y86.444 E.89137
G1 X226.251 Y85.911 E.0164
G1 X205.749 Y106.412 E.89137
G1 X205.749 Y105.878 E.0164
G1 X226.251 Y85.377 E.89137
G1 X226.251 Y84.844 E.0164
G1 X205.749 Y105.345 E.89137
G1 X205.749 Y104.811 E.0164
G1 X226.251 Y84.31 E.89137
G1 X226.251 Y83.776 E.0164
G1 X205.749 Y104.278 E.89137
G1 X205.749 Y103.744 E.0164
G1 X226.251 Y83.243 E.89137
G1 X226.251 Y82.709 E.0164
G1 X205.749 Y103.21 E.89137
G1 X205.749 Y102.677 E.0164
G1 X226.251 Y82.176 E.89137
G1 X226.251 Y81.642 E.0164
G1 X205.749 Y102.143 E.89137
G1 X205.749 Y101.61 E.0164
G1 X226.251 Y81.109 E.89137
G1 X226.251 Y80.575 E.0164
G1 X205.749 Y101.076 E.89137
G1 X205.749 Y100.543 E.0164
G1 X226.251 Y80.041 E.89137
G1 X226.251 Y79.508 E.0164
G1 X205.749 Y100.009 E.89137
G1 X205.749 Y99.475 E.0164
G1 X226.251 Y78.974 E.89137
G1 X226.251 Y78.441 E.0164
G1 X205.749 Y98.942 E.89137
G1 X205.749 Y98.408 E.0164
G1 X226.251 Y77.907 E.89137
G1 X226.251 Y77.374 E.0164
G1 X205.749 Y97.875 E.89137
G1 X205.749 Y97.341 E.0164
G1 X226.251 Y76.84 E.89137
G1 X226.251 Y76.307 E.0164
G1 X205.749 Y96.808 E.89137
G1 X205.749 Y96.274 E.0164
G1 X226.251 Y75.773 E.89137
G1 X226.251 Y75.239 E.0164
G1 X205.749 Y95.74 E.89137
G1 X205.749 Y95.207 E.0164
G1 X226.251 Y74.706 E.89137
G1 X226.251 Y74.172 E.0164
G1 X205.749 Y94.673 E.89137
G1 X205.749 Y94.14 E.0164
G1 X226.251 Y73.639 E.89137
G1 X226.251 Y73.105 E.0164
G1 X205.749 Y93.606 E.89137
G1 X205.749 Y93.073 E.0164
G1 X226.251 Y72.572 E.89137
G1 X226.251 Y72.038 E.0164
G1 X205.749 Y92.539 E.89137
G1 X205.749 Y92.005 E.0164
G1 X226.251 Y71.504 E.89137
G1 X226.251 Y70.971 E.0164
G1 X205.749 Y91.472 E.89137
G1 X205.749 Y90.938 E.0164
G1 X226.251 Y70.437 E.89137
G1 X226.251 Y69.904 E.0164
G1 X205.749 Y90.405 E.89137
G1 X205.749 Y89.871 E.0164
G1 X226.251 Y69.37 E.89137
G1 X226.251 Y68.837 E.0164
G1 X205.749 Y89.338 E.89137
G1 X205.749 Y88.804 E.0164
G1 X226.251 Y68.303 E.89137
G1 X226.251 Y67.769 E.0164
G1 X205.749 Y88.27 E.89137
G1 X205.749 Y87.737 E.0164
G1 X226.251 Y67.236 E.89137
G1 X226.251 Y66.702 E.0164
G1 X205.749 Y87.203 E.89137
G1 X205.749 Y86.67 E.0164
G1 X226.251 Y66.169 E.89137
G1 X226.251 Y65.635 E.0164
G1 X205.749 Y86.136 E.89137
G1 X205.749 Y85.603 E.0164
G1 X226.251 Y65.102 E.89137
G1 X226.251 Y64.568 E.0164
G1 X205.749 Y85.069 E.89137
G1 X205.749 Y84.536 E.0164
G1 X226.251 Y64.034 E.89137
G1 X226.251 Y63.501 E.0164
G1 X205.749 Y84.002 E.89137
G1 X205.749 Y83.468 E.0164
G1 X226.251 Y62.967 E.89137
G1 X226.251 Y62.434 E.0164
G1 X205.749 Y82.935 E.89137
G1 X205.749 Y82.401 E.0164
G1 X226.251 Y61.9 E.89137
G1 X226.251 Y61.367 E.0164
G1 X205.749 Y81.868 E.89137
G1 X205.749 Y81.334 E.0164
G1 X226.251 Y60.833 E.89137
G1 X226.251 Y60.299 E.0164
G1 X205.749 Y80.801 E.89137
G1 X205.749 Y80.267 E.0164
G1 X226.251 Y59.766 E.89137
G1 X226.251 Y59.232 E.0164
G1 X205.749 Y79.733 E.89137
G1 X205.749 Y79.2 E.0164
G1 X226.251 Y58.699 E.89137
G1 X226.251 Y58.165 E.0164
G1 X205.749 Y78.666 E.89137
G1 X205.749 Y78.133 E.0164
G1 X226.251 Y57.632 E.89137
G1 X226.251 Y57.098 E.0164
G1 X205.749 Y77.599 E.89137
G1 X205.749 Y77.066 E.0164
G1 X226.251 Y56.564 E.89137
G1 X226.251 Y56.031 E.0164
G1 X205.749 Y76.532 E.89137
G1 X205.749 Y75.998 E.0164
G1 X226.251 Y55.497 E.89137
G1 X226.251 Y54.964 E.0164
G1 X205.749 Y75.465 E.89137
G1 X205.749 Y74.931 E.0164
G1 X226.251 Y54.43 E.89137
G1 X226.251 Y53.897 E.0164
G1 X205.749 Y74.398 E.89137
G1 X205.749 Y73.864 E.0164
G1 X226.251 Y53.363 E.89137
G1 X226.251 Y52.829 E.0164
G1 X205.749 Y73.331 E.89137
G1 X205.749 Y72.797 E.0164
G1 X226.251 Y52.296 E.89137
G1 X226.251 Y51.762 E.0164
G1 X205.749 Y72.263 E.89137
G1 X205.749 Y71.73 E.0164
G1 X226.251 Y51.229 E.89137
G1 X226.251 Y50.695 E.0164
G1 X205.749 Y71.196 E.89137
G1 X205.749 Y70.663 E.0164
G1 X226.251 Y50.162 E.89137
G1 X226.251 Y49.628 E.0164
G1 X205.749 Y70.129 E.89137
G1 X205.749 Y69.596 E.0164
G1 X226.251 Y49.095 E.89137
G1 X226.251 Y48.561 E.0164
G1 X205.749 Y69.062 E.89137
G1 X205.749 Y68.528 E.0164
G1 X226.251 Y48.027 E.89137
G1 X226.251 Y47.494 E.0164
G1 X205.749 Y67.995 E.89137
G1 X205.749 Y67.461 E.0164
G1 X226.251 Y46.96 E.89137
G1 X226.251 Y46.427 E.0164
G1 X205.749 Y66.928 E.89137
G1 X205.749 Y66.394 E.0164
G1 X226.251 Y45.893 E.89137
G1 X226.251 Y45.36 E.0164
G1 X205.749 Y65.861 E.89137
G1 X205.749 Y65.327 E.0164
G1 X226.251 Y44.826 E.89137
G1 X226.251 Y44.292 E.0164
G1 X205.749 Y64.793 E.89137
G1 X205.749 Y64.26 E.0164
G1 X226.251 Y43.759 E.89137
G1 X226.251 Y43.225 E.0164
G1 X205.749 Y63.726 E.89137
G1 X205.749 Y63.193 E.0164
G1 X226.251 Y42.692 E.89137
G1 X226.251 Y42.158 E.0164
G1 X205.749 Y62.659 E.89137
G1 X205.749 Y62.126 E.0164
G1 X226.251 Y41.625 E.89137
G1 X226.251 Y41.091 E.0164
G1 X205.749 Y61.592 E.89137
M73 P86 R9
G1 X205.749 Y61.058 E.0164
G1 X226.251 Y40.557 E.89137
G1 X226.251 Y40.024 E.0164
G1 X205.749 Y60.525 E.89137
G1 X205.749 Y59.991 E.0164
G1 X226.251 Y39.49 E.89137
G1 X226.251 Y38.957 E.0164
G1 X205.749 Y59.458 E.89137
G1 X205.749 Y58.924 E.0164
G1 X217.215 Y47.459 E.4985
G3 X216.503 Y47.637 I-1.251 J-3.489 E.02259
G1 X205.749 Y58.391 E.46756
G1 X205.749 Y57.857 E.0164
G1 X215.931 Y47.675 E.4427
G3 X215.444 Y47.629 I.223 J-4.954 E.01506
G1 X205.749 Y57.324 E.42151
G1 X205.749 Y56.79 E.0164
G1 X215.008 Y47.531 E.40257
G3 X214.614 Y47.392 I.499 J-2.04 E.01288
G1 X205.749 Y56.256 E.38543
G1 X205.749 Y55.723 E.0164
G1 X214.255 Y47.217 E.36983
G3 X213.929 Y47.01 I.873 J-1.74 E.01191
G1 X205.749 Y55.189 E.35563
G1 X205.749 Y54.656 E.0164
G1 X213.633 Y46.772 E.34278
G3 X213.367 Y46.505 I1.202 J-1.47 E.01162
G1 X205.496 Y54.376 E.3422
G1 X204.962 Y54.376 E.0164
G1 X213.128 Y46.21 E.35504
G3 X212.919 Y45.885 I1.518 J-1.206 E.01189
G1 X204.429 Y54.376 E.36916
G1 X203.895 Y54.376 E.0164
G1 X212.742 Y45.529 E.38465
G3 X212.6 Y45.137 I1.882 J-.905 E.01283
G1 X203.362 Y54.376 E.40167
G1 X202.828 Y54.376 E.0164
G1 X212.498 Y44.705 E.42045
G3 X212.453 Y44.217 I4.414 J-.658 E.01508
G1 X202.295 Y54.376 E.44167
G1 X201.761 Y54.376 E.0164
G1 X212.482 Y43.654 E.46614
G3 X212.649 Y42.954 I4.038 J.592 E.02217
G1 X201.227 Y54.376 E.4966
G1 X200.694 Y54.376 E.0164
G1 X221.195 Y33.874 E.89137
G1 X221.729 Y33.874 E.0164
G1 X214.829 Y40.774 E.29998
G3 X215.531 Y40.606 I1.35 J4.085 E.02221
G1 X222.262 Y33.874 E.29267
G1 X222.796 Y33.874 E.0164
G1 X216.091 Y40.58 E.29153
G3 X216.581 Y40.623 I.048 J2.266 E.01516
G1 X223.329 Y33.874 E.29341
G1 X223.863 Y33.874 E.0164
G1 X217.014 Y40.724 E.29779
G3 X217.404 Y40.867 I-.521 J2.022 E.0128
G1 X224.396 Y33.874 E.30402
G1 X224.93 Y33.874 E.0164
G1 X217.76 Y41.045 E.31176
G3 X218.084 Y41.254 I-.883 J1.723 E.01188
G1 X225.464 Y33.874 E.32087
G1 X225.997 Y33.874 E.0164
G1 X218.379 Y41.493 E.33125
G3 X218.645 Y41.76 I-1.203 J1.466 E.01162
G1 X226.251 Y34.155 E.33069
G1 X226.251 Y34.688 E.0164
G1 X218.883 Y42.056 E.32035
G3 X219.091 Y42.381 I-1.519 J1.205 E.01189
G1 X226.251 Y35.222 E.31128
G1 X226.251 Y35.755 E.0164
G1 X219.269 Y42.737 E.30356
G3 X219.408 Y43.132 I-6.874 J2.638 E.01287
G1 X226.251 Y36.289 E.29753
G1 X226.251 Y36.822 E.0164
G1 X219.504 Y43.569 E.29335
G3 X219.548 Y44.058 I-2.424 J.469 E.01512
G1 X226.251 Y37.356 E.29141
G1 X226.251 Y37.89 E.0164
G1 X219.511 Y44.629 E.29301
G3 X219.332 Y45.342 I-3.517 J-.506 E.02264
G1 X226.42 Y38.253 E.30819
; WIPE_START
G1 X225.006 Y39.668 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X218.446 Y43.569 Z3.2 F30000
G1 X199.991 Y54.545 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F15000
G1 X220.661 Y33.874 E.89875
G1 X220.128 Y33.874 E.0164
G1 X199.627 Y54.376 E.89137
G1 X199.093 Y54.376 E.0164
G1 X219.594 Y33.874 E.89137
G1 X219.061 Y33.874 E.0164
G1 X198.56 Y54.376 E.89137
G1 X198.026 Y54.376 E.0164
G1 X218.527 Y33.874 E.89137
G1 X217.994 Y33.874 E.0164
G1 X197.493 Y54.376 E.89137
G1 X196.959 Y54.376 E.0164
G1 X217.46 Y33.874 E.89137
G1 X216.926 Y33.874 E.0164
G1 X196.425 Y54.376 E.89137
G1 X195.892 Y54.376 E.0164
G1 X216.393 Y33.874 E.89137
G1 X215.859 Y33.874 E.0164
G1 X195.358 Y54.376 E.89137
G1 X194.825 Y54.376 E.0164
G1 X215.326 Y33.874 E.89137
G1 X214.792 Y33.874 E.0164
G1 X194.291 Y54.376 E.89137
G1 X193.758 Y54.376 E.0164
G1 X214.259 Y33.874 E.89137
G1 X213.725 Y33.874 E.0164
G1 X193.224 Y54.376 E.89137
G1 X192.69 Y54.376 E.0164
G1 X213.191 Y33.874 E.89137
G1 X212.658 Y33.874 E.0164
G1 X192.157 Y54.376 E.89137
G1 X191.623 Y54.376 E.0164
G1 X212.124 Y33.874 E.89137
G1 X211.591 Y33.874 E.0164
G1 X191.09 Y54.376 E.89137
G1 X190.556 Y54.376 E.0164
G1 X211.057 Y33.874 E.89137
G1 X210.524 Y33.874 E.0164
G1 X190.023 Y54.376 E.89137
G1 X189.489 Y54.376 E.0164
G1 X209.99 Y33.874 E.89137
G1 X209.456 Y33.874 E.0164
G1 X188.955 Y54.376 E.89137
G1 X188.422 Y54.376 E.0164
G1 X208.923 Y33.874 E.89137
G1 X208.389 Y33.874 E.0164
G1 X187.888 Y54.376 E.89137
G1 X187.355 Y54.376 E.0164
G1 X207.856 Y33.874 E.89137
G1 X207.322 Y33.874 E.0164
G1 X186.821 Y54.376 E.89137
G1 X186.288 Y54.376 E.0164
G1 X206.789 Y33.874 E.89137
G1 X206.255 Y33.874 E.0164
G1 X185.754 Y54.376 E.89137
G1 X185.22 Y54.376 E.0164
G1 X205.722 Y33.874 E.89137
G1 X205.188 Y33.874 E.0164
G1 X184.687 Y54.376 E.89137
G1 X184.153 Y54.376 E.0164
G1 X204.654 Y33.874 E.89137
G1 X204.121 Y33.874 E.0164
G1 X183.62 Y54.376 E.89137
G1 X183.086 Y54.376 E.0164
G1 X203.587 Y33.874 E.89137
G1 X203.054 Y33.874 E.0164
G1 X182.553 Y54.376 E.89137
G1 X182.019 Y54.376 E.0164
G1 X202.52 Y33.874 E.89137
G1 X201.987 Y33.874 E.0164
G1 X181.485 Y54.376 E.89137
G1 X180.952 Y54.376 E.0164
G1 X201.453 Y33.874 E.89137
G1 X200.919 Y33.874 E.0164
G1 X180.418 Y54.376 E.89137
G1 X179.885 Y54.376 E.0164
G1 X200.386 Y33.874 E.89137
G1 X199.852 Y33.874 E.0164
G1 X179.351 Y54.376 E.89137
G1 X178.818 Y54.376 E.0164
G1 X199.319 Y33.874 E.89137
G1 X198.785 Y33.874 E.0164
G1 X178.284 Y54.376 E.89137
G1 X177.75 Y54.376 E.0164
G1 X198.252 Y33.874 E.89137
G1 X197.718 Y33.874 E.0164
G1 X177.217 Y54.376 E.89137
G1 X176.683 Y54.376 E.0164
G1 X197.184 Y33.874 E.89137
G1 X196.651 Y33.874 E.0164
G1 X176.15 Y54.376 E.89137
G1 X175.616 Y54.376 E.0164
G1 X196.117 Y33.874 E.89137
G1 X195.584 Y33.874 E.0164
G1 X175.083 Y54.376 E.89137
G1 X174.549 Y54.376 E.0164
G1 X195.05 Y33.874 E.89137
G1 X194.517 Y33.874 E.0164
G1 X174.015 Y54.376 E.89137
G1 X173.482 Y54.376 E.0164
G1 X193.983 Y33.874 E.89137
G1 X193.449 Y33.874 E.0164
G1 X172.948 Y54.376 E.89137
G1 X172.415 Y54.376 E.0164
G1 X192.916 Y33.874 E.89137
G1 X192.382 Y33.874 E.0164
G1 X171.881 Y54.376 E.89137
G1 X171.348 Y54.376 E.0164
G1 X191.849 Y33.874 E.89137
G1 X191.315 Y33.874 E.0164
G1 X170.814 Y54.376 E.89137
G1 X170.281 Y54.376 E.0164
G1 X190.782 Y33.874 E.89137
G1 X190.248 Y33.874 E.0164
G1 X169.747 Y54.376 E.89137
G1 X169.213 Y54.376 E.0164
G1 X189.714 Y33.874 E.89137
G1 X189.181 Y33.874 E.0164
G1 X168.68 Y54.376 E.89137
G1 X168.146 Y54.376 E.0164
G1 X188.647 Y33.874 E.89137
G1 X188.114 Y33.874 E.0164
G1 X167.613 Y54.376 E.89137
G1 X167.079 Y54.376 E.0164
G1 X187.58 Y33.874 E.89137
G1 X187.047 Y33.874 E.0164
G1 X166.546 Y54.376 E.89137
G1 X166.012 Y54.376 E.0164
G1 X186.513 Y33.874 E.89137
G1 X185.979 Y33.874 E.0164
G1 X165.478 Y54.376 E.89137
G1 X164.945 Y54.376 E.0164
G1 X185.446 Y33.874 E.89137
G1 X184.912 Y33.874 E.0164
G1 X164.411 Y54.376 E.89137
G1 X163.878 Y54.376 E.0164
G1 X184.379 Y33.874 E.89137
M73 P86 R8
G1 X183.845 Y33.874 E.0164
G1 X163.344 Y54.376 E.89137
G1 X162.811 Y54.376 E.0164
G1 X183.312 Y33.874 E.89137
G1 X182.778 Y33.874 E.0164
G1 X162.277 Y54.376 E.89137
G1 X161.743 Y54.376 E.0164
G1 X182.244 Y33.874 E.89137
G1 X181.711 Y33.874 E.0164
G1 X161.21 Y54.376 E.89137
G1 X160.676 Y54.376 E.0164
G1 X181.177 Y33.874 E.89137
G1 X180.644 Y33.874 E.0164
G1 X160.143 Y54.376 E.89137
G1 X159.609 Y54.376 E.0164
G1 X180.11 Y33.874 E.89137
G1 X179.577 Y33.874 E.0164
G1 X159.076 Y54.376 E.89137
G1 X158.542 Y54.376 E.0164
G1 X179.043 Y33.874 E.89137
G1 X178.51 Y33.874 E.0164
G1 X158.008 Y54.376 E.89137
G1 X157.475 Y54.376 E.0164
G1 X177.976 Y33.874 E.89137
G1 X177.442 Y33.874 E.0164
G1 X156.941 Y54.376 E.89137
G1 X156.408 Y54.376 E.0164
G1 X176.909 Y33.874 E.89137
G1 X176.375 Y33.874 E.0164
G1 X155.874 Y54.376 E.89137
G1 X155.341 Y54.376 E.0164
G1 X175.842 Y33.874 E.89137
G1 X175.308 Y33.874 E.0164
G1 X154.807 Y54.376 E.89137
G1 X154.273 Y54.376 E.0164
G1 X174.775 Y33.874 E.89137
G1 X174.241 Y33.874 E.0164
G1 X153.74 Y54.376 E.89137
G1 X153.206 Y54.376 E.0164
G1 X173.707 Y33.874 E.89137
G1 X173.174 Y33.874 E.0164
G1 X152.673 Y54.376 E.89137
G1 X152.139 Y54.376 E.0164
G1 X172.64 Y33.874 E.89137
G1 X172.107 Y33.874 E.0164
G1 X151.606 Y54.376 E.89137
G1 X151.072 Y54.376 E.0164
G1 X171.573 Y33.874 E.89137
G1 X171.04 Y33.874 E.0164
G1 X150.538 Y54.376 E.89137
G1 X150.005 Y54.376 E.0164
G1 X170.506 Y33.874 E.89137
G1 X169.972 Y33.874 E.0164
G1 X149.471 Y54.376 E.89137
G1 X148.938 Y54.376 E.0164
G1 X169.439 Y33.874 E.89137
G1 X168.905 Y33.874 E.0164
G1 X148.404 Y54.376 E.89137
G1 X147.871 Y54.376 E.0164
G1 X168.372 Y33.874 E.89137
G1 X167.838 Y33.874 E.0164
G1 X147.337 Y54.376 E.89137
G1 X146.803 Y54.376 E.0164
G1 X167.305 Y33.874 E.89137
G1 X166.771 Y33.874 E.0164
G1 X146.27 Y54.376 E.89137
G1 X145.736 Y54.376 E.0164
G1 X166.237 Y33.874 E.89137
G1 X165.704 Y33.874 E.0164
G1 X145.203 Y54.376 E.89137
G1 X144.669 Y54.376 E.0164
G1 X165.17 Y33.874 E.89137
G1 X164.637 Y33.874 E.0164
G1 X144.136 Y54.376 E.89137
G1 X143.602 Y54.376 E.0164
G1 X164.103 Y33.874 E.89137
G1 X163.57 Y33.874 E.0164
G1 X143.068 Y54.376 E.89137
G1 X142.535 Y54.376 E.0164
G1 X163.036 Y33.874 E.89137
G1 X162.502 Y33.874 E.0164
G1 X142.001 Y54.376 E.89137
G1 X141.468 Y54.376 E.0164
G1 X161.969 Y33.874 E.89137
G1 X161.435 Y33.874 E.0164
G1 X140.934 Y54.376 E.89137
G1 X140.401 Y54.376 E.0164
G1 X160.902 Y33.874 E.89137
G1 X160.368 Y33.874 E.0164
G1 X139.867 Y54.376 E.89137
G1 X139.334 Y54.376 E.0164
G1 X159.835 Y33.874 E.89137
G1 X159.301 Y33.874 E.0164
G1 X138.8 Y54.376 E.89137
G1 X138.266 Y54.376 E.0164
G1 X158.767 Y33.874 E.89137
G1 X158.234 Y33.874 E.0164
G1 X137.733 Y54.376 E.89137
G1 X137.199 Y54.376 E.0164
G1 X157.7 Y33.874 E.89137
G1 X157.167 Y33.874 E.0164
G1 X136.666 Y54.376 E.89137
G1 X136.132 Y54.376 E.0164
G1 X156.633 Y33.874 E.89137
G1 X156.1 Y33.874 E.0164
G1 X135.599 Y54.376 E.89137
G1 X135.065 Y54.376 E.0164
G1 X155.566 Y33.874 E.89137
G1 X155.032 Y33.874 E.0164
G1 X134.531 Y54.376 E.89137
G1 X133.998 Y54.376 E.0164
G1 X154.499 Y33.874 E.89137
G1 X153.965 Y33.874 E.0164
G1 X133.464 Y54.376 E.89137
G1 X132.931 Y54.376 E.0164
G1 X153.432 Y33.874 E.89137
G1 X152.898 Y33.874 E.0164
G1 X132.397 Y54.376 E.89137
G1 X131.864 Y54.376 E.0164
G1 X152.365 Y33.874 E.89137
G1 X151.831 Y33.874 E.0164
G1 X131.33 Y54.376 E.89137
G1 X130.796 Y54.376 E.0164
G1 X151.297 Y33.874 E.89137
G1 X150.764 Y33.874 E.0164
G1 X130.263 Y54.376 E.89137
G1 X129.729 Y54.376 E.0164
G1 X150.23 Y33.874 E.89137
G1 X149.697 Y33.874 E.0164
G1 X129.196 Y54.376 E.89137
G1 X128.662 Y54.376 E.0164
G1 X149.163 Y33.874 E.89137
G1 X148.63 Y33.874 E.0164
G1 X128.129 Y54.376 E.89137
G1 X127.595 Y54.376 E.0164
G1 X148.096 Y33.874 E.89137
G1 X147.563 Y33.874 E.0164
G1 X127.061 Y54.376 E.89137
G1 X126.528 Y54.376 E.0164
G1 X147.029 Y33.874 E.89137
G1 X146.495 Y33.874 E.0164
G1 X125.994 Y54.376 E.89137
G1 X125.461 Y54.376 E.0164
G1 X145.962 Y33.874 E.89137
G1 X145.428 Y33.874 E.0164
G1 X124.927 Y54.376 E.89137
G1 X124.394 Y54.376 E.0164
G1 X144.895 Y33.874 E.89137
G1 X144.361 Y33.874 E.0164
G1 X123.86 Y54.376 E.89137
G1 X123.326 Y54.376 E.0164
G1 X143.828 Y33.874 E.89137
G1 X143.294 Y33.874 E.0164
G1 X122.793 Y54.376 E.89137
G1 X122.259 Y54.376 E.0164
G1 X129.156 Y47.479 E.29987
G3 X128.459 Y47.642 I-1.159 J-3.368 E.02206
G1 X121.726 Y54.376 E.29275
G1 X121.192 Y54.376 E.0164
G1 X127.894 Y47.674 E.29137
G3 X127.411 Y47.623 I.015 J-2.44 E.01494
G1 X120.659 Y54.376 E.29359
G1 X120.125 Y54.376 E.0164
G1 X126.978 Y47.522 E.29797
G3 X126.586 Y47.381 I.512 J-2.029 E.01283
G1 X119.591 Y54.376 E.30413
G1 X119.058 Y54.376 E.0164
G1 X126.23 Y47.204 E.31183
G3 X125.907 Y46.993 I6.44 J-10.217 E.01185
G1 X118.524 Y54.376 E.32099
G1 X117.991 Y54.376 E.0164
G1 X125.614 Y46.753 E.33144
G3 X125.349 Y46.484 I1.213 J-1.461 E.01162
G1 X117.457 Y54.376 E.34312
G1 X116.924 Y54.376 E.0164
G1 X125.112 Y46.187 E.35604
G3 X124.906 Y45.86 I1.531 J-1.197 E.01191
G1 X116.39 Y54.376 E.37025
G1 X115.856 Y54.376 E.0164
G1 X124.731 Y45.501 E.38584
G3 X124.591 Y45.108 I1.901 J-.896 E.01287
G1 X115.323 Y54.376 E.40296
G1 X114.789 Y54.376 E.0164
G1 X124.492 Y44.673 E.42185
G3 X124.453 Y44.179 I4.856 J-.632 E.01526
G1 X114.256 Y54.376 E.44336
G1 X113.722 Y54.376 E.0164
G1 X124.486 Y43.611 E.46802
G3 X124.669 Y42.895 I2.417 J.234 E.0228
G1 X113.189 Y54.376 E.49915
G1 X112.655 Y54.376 E.0164
G1 X133.156 Y33.874 E.89137
G1 X133.69 Y33.874 E.0164
G1 X126.765 Y40.799 E.30107
G3 X127.484 Y40.614 I1.287 J3.512 E.02285
G1 X134.223 Y33.874 E.29303
G1 X134.757 Y33.874 E.0164
G1 X128.052 Y40.579 E.29151
G3 X128.546 Y40.618 I.067 J2.278 E.01527
G1 X135.29 Y33.874 E.29322
G1 X135.824 Y33.874 E.0164
G1 X128.985 Y40.714 E.29737
G3 X129.377 Y40.855 I-.508 J2.029 E.01284
G1 X136.358 Y33.874 E.3035
G1 X136.891 Y33.874 E.0164
G1 X129.735 Y41.031 E.31115
G3 X130.061 Y41.238 I-.872 J1.732 E.0119
G1 X137.425 Y33.874 E.32016
G1 X137.958 Y33.874 E.0164
G1 X130.358 Y41.475 E.33046
G3 X130.626 Y41.74 I-1.188 J1.469 E.01162
G1 X138.492 Y33.874 E.34199
G1 X139.025 Y33.874 E.0164
G1 X130.866 Y42.034 E.35476
G3 X131.077 Y42.357 I-1.507 J1.213 E.01187
G1 X139.559 Y33.874 E.36881
G1 X140.093 Y33.874 E.0164
G1 X131.256 Y42.711 E.3842
G3 X131.4 Y43.101 I-6.594 J2.648 E.01278
G1 X140.626 Y33.874 E.40116
G1 X141.16 Y33.874 E.0164
G1 X131.498 Y43.536 E.42006
G3 X131.546 Y44.021 I-2.406 J.483 E.01503
G1 X141.693 Y33.874 E.44117
G1 X142.227 Y33.874 E.0164
G1 X131.518 Y44.583 E.4656
G3 X131.354 Y45.281 I-3.633 J-.486 E.02206
G1 X142.93 Y33.705 E.5033
; WIPE_START
G1 X141.516 Y35.119 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X135.137 Y39.31 Z3.2 F30000
G1 X111.952 Y54.545 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F15000
G1 X132.623 Y33.874 E.89875
G1 X132.089 Y33.874 E.0164
G1 X111.588 Y54.376 E.89137
G1 X111.054 Y54.376 E.0164
G1 X131.555 Y33.874 E.89137
G1 X131.022 Y33.874 E.0164
G1 X110.521 Y54.376 E.89137
G1 X109.987 Y54.376 E.0164
G1 X130.488 Y33.874 E.89137
G1 X129.955 Y33.874 E.0164
G1 X109.454 Y54.376 E.89137
G1 X108.92 Y54.376 E.0164
G1 X129.421 Y33.874 E.89137
G1 X128.888 Y33.874 E.0164
G1 X108.387 Y54.376 E.89137
G1 X107.853 Y54.376 E.0164
G1 X128.354 Y33.874 E.89137
G1 X127.82 Y33.874 E.0164
G1 X107.319 Y54.376 E.89137
G1 X106.786 Y54.376 E.0164
G1 X127.287 Y33.874 E.89137
G1 X126.753 Y33.874 E.0164
G1 X106.252 Y54.376 E.89137
G1 X105.719 Y54.376 E.0164
G1 X126.22 Y33.874 E.89137
G1 X125.686 Y33.874 E.0164
G1 X105.185 Y54.376 E.89137
G1 X104.652 Y54.376 E.0164
G1 X125.153 Y33.874 E.89137
G1 X124.619 Y33.874 E.0164
G1 X104.118 Y54.376 E.89137
G1 X103.584 Y54.376 E.0164
G1 X124.085 Y33.874 E.89137
G1 X123.552 Y33.874 E.0164
G1 X103.051 Y54.376 E.89137
G1 X102.517 Y54.376 E.0164
G1 X123.018 Y33.874 E.89137
G1 X122.485 Y33.874 E.0164
G1 X101.984 Y54.376 E.89137
G1 X101.45 Y54.376 E.0164
G1 X121.951 Y33.874 E.89137
G1 X121.418 Y33.874 E.0164
G1 X100.917 Y54.376 E.89137
G1 X100.383 Y54.376 E.0164
G1 X120.884 Y33.874 E.89137
G1 X120.351 Y33.874 E.0164
G1 X99.849 Y54.376 E.89137
G1 X99.316 Y54.376 E.0164
G1 X119.817 Y33.874 E.89137
G1 X119.283 Y33.874 E.0164
G1 X98.782 Y54.376 E.89137
G1 X98.249 Y54.376 E.0164
G1 X118.75 Y33.874 E.89137
G1 X118.216 Y33.874 E.0164
G1 X97.715 Y54.376 E.89137
G1 X97.182 Y54.376 E.0164
G1 X117.683 Y33.874 E.89137
G1 X117.149 Y33.874 E.0164
G1 X96.648 Y54.376 E.89137
G1 X96.114 Y54.376 E.0164
G1 X116.616 Y33.874 E.89137
G1 X116.082 Y33.874 E.0164
G1 X95.581 Y54.376 E.89137
G1 X95.047 Y54.376 E.0164
G1 X115.548 Y33.874 E.89137
G1 X115.015 Y33.874 E.0164
G1 X94.514 Y54.376 E.89137
G1 X93.98 Y54.376 E.0164
G1 X114.481 Y33.874 E.89137
G1 X113.948 Y33.874 E.0164
G1 X93.447 Y54.376 E.89137
G1 X92.913 Y54.376 E.0164
G1 X113.414 Y33.874 E.89137
G1 X112.881 Y33.874 E.0164
G1 X92.379 Y54.376 E.89137
G1 X91.846 Y54.376 E.0164
G1 X112.347 Y33.874 E.89137
G1 X111.813 Y33.874 E.0164
G1 X91.312 Y54.376 E.89137
G1 X90.779 Y54.376 E.0164
G1 X111.28 Y33.874 E.89137
G1 X110.746 Y33.874 E.0164
G1 X90.245 Y54.376 E.89137
G1 X89.712 Y54.376 E.0164
G1 X110.213 Y33.874 E.89137
G1 X109.679 Y33.874 E.0164
G1 X89.178 Y54.376 E.89137
G1 X88.644 Y54.376 E.0164
G1 X109.146 Y33.874 E.89137
G1 X108.612 Y33.874 E.0164
G1 X88.111 Y54.376 E.89137
G1 X87.577 Y54.376 E.0164
G1 X108.078 Y33.874 E.89137
G1 X107.545 Y33.874 E.0164
G1 X87.044 Y54.376 E.89137
G1 X86.51 Y54.376 E.0164
G1 X107.011 Y33.874 E.89137
G1 X106.478 Y33.874 E.0164
G1 X85.977 Y54.376 E.89137
G1 X85.443 Y54.376 E.0164
G1 X105.944 Y33.874 E.89137
G1 X105.411 Y33.874 E.0164
G1 X84.91 Y54.376 E.89137
G1 X84.376 Y54.376 E.0164
G1 X104.877 Y33.874 E.89137
G1 X104.343 Y33.874 E.0164
G1 X83.842 Y54.376 E.89137
G1 X83.309 Y54.376 E.0164
G1 X103.81 Y33.874 E.89137
G1 X103.276 Y33.874 E.0164
G1 X82.775 Y54.376 E.89137
G1 X82.242 Y54.376 E.0164
G1 X102.743 Y33.874 E.89137
G1 X102.209 Y33.874 E.0164
G1 X81.708 Y54.376 E.89137
G1 X81.175 Y54.376 E.0164
G1 X101.676 Y33.874 E.89137
G1 X101.142 Y33.874 E.0164
G1 X80.641 Y54.376 E.89137
G1 X80.107 Y54.376 E.0164
G1 X100.608 Y33.874 E.89137
G1 X100.075 Y33.874 E.0164
G1 X91.282 Y42.668 E.38232
G2 X91.348 Y42.068 I-1.487 J-.467 E.01866
G1 X99.541 Y33.874 E.35625
G1 X99.008 Y33.874 E.0164
G1 X91.348 Y41.534 E.33303
G1 X91.349 Y41 E.01642
G1 X98.474 Y33.874 E.3098
G1 X97.941 Y33.874 E.0164
G1 X91.343 Y40.472 E.28687
G2 X91.261 Y40.021 I-1.208 J-.014 E.0142
G1 X97.407 Y33.874 E.26723
G1 X96.873 Y33.874 E.0164
G1 X91.108 Y39.64 E.25067
M73 P87 R8
G2 X90.949 Y39.374 I-.765 J.279 E.00957
G2 X91.113 Y39.101 I-.837 J-.69 E.00984
G1 X96.34 Y33.874 E.22724
G1 X95.806 Y33.874 E.0164
G1 X91.336 Y38.344 E.19435
G2 X91.328 Y37.819 I-1.326 J-.241 E.01625
G1 X95.273 Y33.874 E.17152
G1 X94.739 Y33.874 E.0164
G1 X91.222 Y37.392 E.15293
G2 X91.049 Y37.031 I-1.363 J.428 E.01235
G1 X94.206 Y33.874 E.13723
G1 X93.672 Y33.874 E.0164
G1 X90.826 Y36.72 E.12373
G2 X90.557 Y36.456 I-2.017 J1.785 E.01161
G1 X93.139 Y33.874 E.11224
G1 X92.605 Y33.874 E.0164
G1 X90.236 Y36.244 E.10301
G2 X89.865 Y36.081 I-.733 J1.164 E.01249
G1 X92.071 Y33.874 E.09592
G1 X91.538 Y33.874 E.0164
G1 X89.431 Y35.981 E.0916
G1 X88.901 Y35.977 E.01629
G1 X91.004 Y33.874 E.09144
G1 X90.471 Y33.874 E.0164
G1 X88.368 Y35.977 E.09144
G1 X87.834 Y35.977 E.0164
G1 X89.937 Y33.874 E.09144
G1 X89.404 Y33.874 E.0164
G1 X87.301 Y35.977 E.09143
G1 X86.767 Y35.977 E.0164
G1 X88.87 Y33.874 E.09143
G1 X88.336 Y33.874 E.0164
G1 X86.132 Y36.079 E.09583
G3 X86.026 Y36.06 I-.043 J-.063 E.00366
G1 X85.685 Y35.992 E.01069
G1 X87.803 Y33.874 E.09207
G1 X87.269 Y33.874 E.0164
G1 X85.166 Y35.977 E.09143
G1 X84.633 Y35.977 E.01639
G1 X86.736 Y33.874 E.09141
G1 X86.202 Y33.874 E.0164
G1 X84.1 Y35.976 E.09139
G1 X83.567 Y35.976 E.01639
G1 X85.669 Y33.874 E.09137
G1 X85.135 Y33.874 E.0164
G1 X83.034 Y35.976 E.09135
G2 X82.419 Y36.057 I-.015 J2.243 E.01914
G1 X84.601 Y33.874 E.0949
G1 X84.068 Y33.874 E.0164
G1 X63.567 Y54.376 E.89137
G1 X64.1 Y54.376 E.0164
G1 X80.924 Y37.551 E.7315
G2 X80.853 Y38.157 I1.473 J.481 E.01886
G1 X64.634 Y54.376 E.70518
G1 X65.167 Y54.376 E.0164
G1 X80.854 Y38.689 E.68202
G1 X80.854 Y39.222 E.01638
G1 X65.701 Y54.376 E.65886
G1 X66.235 Y54.376 E.0164
G1 X80.855 Y39.755 E.63569
G1 X80.856 Y40.288 E.01638
G1 X66.768 Y54.376 E.61253
G1 X67.302 Y54.376 E.0164
G1 X80.857 Y40.82 E.58936
G1 X80.858 Y41.353 E.01638
G1 X67.835 Y54.376 E.5662
G1 X68.369 Y54.376 E.0164
G1 X80.858 Y41.886 E.54303
G1 X80.868 Y42.41 E.01612
G1 X68.902 Y54.376 E.52024
G1 X69.436 Y54.376 E.0164
G1 X80.973 Y42.838 E.50162
G2 X81.141 Y43.204 I2.026 J-.71 E.01239
G1 X69.97 Y54.376 E.48573
G1 X70.503 Y54.376 E.0164
G1 X81.363 Y43.516 E.47216
G2 X81.629 Y43.784 I2.205 J-1.927 E.01161
G1 X71.037 Y54.376 E.46053
G1 X71.57 Y54.376 E.0164
G1 X81.948 Y43.998 E.45121
G2 X82.316 Y44.163 I.796 J-1.276 E.01244
G1 X72.104 Y54.376 E.44401
G1 X72.637 Y54.376 E.0164
G1 X82.748 Y44.265 E.43962
G1 X83.274 Y44.273 E.01615
G1 X73.171 Y54.376 E.43926
G1 X73.705 Y54.376 E.0164
G1 X83.807 Y44.273 E.43924
G1 X84.34 Y44.274 E.01639
G1 X74.238 Y54.376 E.43922
G1 X74.772 Y54.376 E.0164
G1 X84.873 Y44.274 E.4392
G1 X85.406 Y44.274 E.01639
G1 X75.305 Y54.376 E.43918
G1 X75.839 Y54.376 E.0164
G1 X86.039 Y44.175 E.44349
G1 X86.111 Y44.154 E.00231
G2 X86.496 Y44.252 I.497 J-1.138 E.01227
G1 X76.372 Y54.376 E.44015
G1 X76.906 Y54.376 E.0164
G1 X87.009 Y44.273 E.43926
G1 X87.542 Y44.273 E.01639
G1 X77.44 Y54.376 E.43924
G1 X77.973 Y54.376 E.0164
G1 X88.075 Y44.274 E.43922
G1 X88.608 Y44.274 E.01639
G1 X78.507 Y54.376 E.43921
G1 X79.04 Y54.376 E.0164
G1 X89.141 Y44.274 E.43919
G2 X89.741 Y44.208 I.045 J-2.343 E.01861
G1 X79.404 Y54.545 E.44945
; WIPE_START
G1 X80.818 Y53.131 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X83.981 Y46.185 Z3.2 F30000
G1 X86.567 Y40.506 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.124038
G1 F15000
G1 X86.798 Y40.452 E.00157
; WIPE_START
G1 X86.567 Y40.506 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.755 Y38.998 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.143511
G1 F15000
G1 X88.93 Y38.976 E.00145
; LINE_WIDTH: 0.112452
G1 X89.106 Y38.955 E.001
; WIPE_START
G1 X88.93 Y38.976 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.32 Y38.399 Z3.2 F30000
G1 X29.58 Y34.472 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42021
G1 F15000
G1 X30.177 Y33.874 E.02598
G1 X30.711 Y33.874 E.0164
G1 X29.749 Y34.836 E.04181
G1 X29.749 Y35.37 E.0164
G1 X31.245 Y33.874 E.065
G1 X31.778 Y33.874 E.0164
G1 X29.749 Y35.903 E.0882
G1 X29.749 Y36.437 E.0164
G1 X32.312 Y33.874 E.1114
G1 X32.845 Y33.874 E.0164
G1 X29.749 Y36.97 E.1346
G1 X29.749 Y37.504 E.0164
G1 X33.379 Y33.874 E.1578
G1 X33.912 Y33.874 E.0164
G1 X29.749 Y38.037 E.181
G1 X29.749 Y38.571 E.0164
G1 X34.446 Y33.874 E.2042
G1 X34.98 Y33.874 E.0164
G1 X29.749 Y39.105 E.2274
G1 X29.749 Y39.638 E.0164
G1 X35.513 Y33.874 E.2506
G1 X36.047 Y33.874 E.0164
G1 X29.749 Y40.172 E.2738
G1 X29.749 Y40.705 E.0164
G1 X36.58 Y33.874 E.297
G1 X37.114 Y33.874 E.0164
G1 X29.749 Y41.239 E.32019
G1 X29.749 Y41.772 E.0164
G1 X37.647 Y33.874 E.34339
G1 X38.181 Y33.874 E.0164
G1 X29.749 Y42.306 E.36659
G1 X29.749 Y42.839 E.0164
G1 X38.714 Y33.874 E.38979
G1 X39.248 Y33.874 E.0164
G1 X29.749 Y43.373 E.41299
G1 X29.749 Y43.907 E.0164
G1 X39.782 Y33.874 E.43619
G1 X40.315 Y33.874 E.0164
G1 X29.749 Y44.44 E.45939
G1 X29.749 Y44.974 E.0164
G1 X40.849 Y33.874 E.48259
G1 X41.382 Y33.874 E.0164
G1 X29.749 Y45.507 E.50579
G1 X29.749 Y46.041 E.0164
G1 X41.916 Y33.874 E.52899
G1 X42.449 Y33.874 E.0164
G1 X29.749 Y46.574 E.55219
G1 X29.749 Y47.108 E.0164
G1 X42.983 Y33.874 E.57538
G1 X43.517 Y33.874 E.0164
G1 X29.749 Y47.642 E.59858
G1 X29.749 Y48.175 E.0164
G1 X44.05 Y33.874 E.62178
G1 X44.584 Y33.874 E.0164
G1 X29.58 Y48.878 E.65236
G1 X29.58 Y75.023 F30000
G1 F15000
G1 X70.729 Y33.874 E1.78911
G1 X70.195 Y33.874 E.0164
G1 X29.749 Y74.32 E1.75854
G1 X29.749 Y73.786 E.0164
G1 X69.661 Y33.874 E1.73534
G1 X69.128 Y33.874 E.0164
G1 X29.749 Y73.253 E1.71214
G1 X29.749 Y72.719 E.0164
G1 X68.594 Y33.874 E1.68894
G1 X68.061 Y33.874 E.0164
G1 X29.749 Y72.186 E1.66574
G1 X29.749 Y71.652 E.0164
G1 X67.527 Y33.874 E1.64254
G1 X66.994 Y33.874 E.0164
G1 X29.749 Y71.119 E1.61934
G1 X29.749 Y70.585 E.0164
G1 X66.46 Y33.874 E1.59614
G1 X65.927 Y33.874 E.0164
G1 X29.749 Y70.051 E1.57294
G1 X29.749 Y69.518 E.0164
G1 X65.393 Y33.874 E1.54975
G1 X64.859 Y33.874 E.0164
G1 X29.749 Y68.984 E1.52655
G1 X29.749 Y68.451 E.0164
G1 X64.326 Y33.874 E1.50335
G1 X63.792 Y33.874 E.0164
G1 X29.749 Y67.917 E1.48015
G1 X29.749 Y67.384 E.0164
G1 X63.259 Y33.874 E1.45695
G1 X62.725 Y33.874 E.0164
G1 X29.749 Y66.85 E1.43375
G1 X29.749 Y66.317 E.0164
G1 X62.192 Y33.874 E1.41055
G1 X61.658 Y33.874 E.0164
G1 X29.749 Y65.783 E1.38735
G1 X29.749 Y65.249 E.0164
G1 X61.124 Y33.874 E1.36415
G1 X60.591 Y33.874 E.0164
G1 X29.749 Y64.716 E1.34095
G1 X29.749 Y64.182 E.0164
G1 X60.057 Y33.874 E1.31775
G1 X59.524 Y33.874 E.0164
G1 X29.749 Y63.649 E1.29456
G1 X29.749 Y63.115 E.0164
G1 X58.99 Y33.874 E1.27136
G1 X58.457 Y33.874 E.0164
G1 X29.749 Y62.582 E1.24816
G1 X29.749 Y62.048 E.0164
G1 X57.923 Y33.874 E1.22496
G1 X57.389 Y33.874 E.0164
G1 X29.749 Y61.514 E1.20176
G1 X29.749 Y60.981 E.0164
G1 X56.856 Y33.874 E1.17856
G1 X56.322 Y33.874 E.0164
G1 X29.749 Y60.447 E1.15536
G1 X29.749 Y59.914 E.0164
G1 X55.789 Y33.874 E1.13216
G1 X55.255 Y33.874 E.0164
G1 X29.749 Y59.38 E1.10896
G1 X29.749 Y58.847 E.0164
G1 X41.098 Y47.498 E.49341
G3 X40.414 Y47.648 I-1.104 J-3.402 E.02154
G1 X29.749 Y58.313 E.4637
G1 X29.749 Y57.779 E.0164
G1 X39.857 Y47.671 E.43948
G3 X39.378 Y47.617 I.032 J-2.427 E.01486
G1 X29.749 Y57.246 E.41864
G1 X29.749 Y56.712 E.0164
G1 X38.948 Y47.514 E.39994
G3 X38.558 Y47.37 I.527 J-2.022 E.01279
G1 X29.749 Y56.179 E.383
G1 X29.749 Y55.645 E.0164
G1 X38.206 Y47.189 E.36767
G3 X37.885 Y46.976 I.906 J-1.708 E.01185
G1 X29.749 Y55.112 E.35374
G1 X29.749 Y54.578 E.0164
G1 X37.594 Y46.733 E.34107
G3 X37.331 Y46.463 I1.22 J-1.449 E.01162
G1 X29.749 Y54.044 E.32964
G1 X29.749 Y53.511 E.0164
G1 X37.097 Y46.164 E.31945
G3 X36.892 Y45.835 I1.539 J-1.186 E.01193
G1 X29.749 Y52.977 E.31055
G1 X29.749 Y52.444 E.0164
G1 X36.719 Y45.474 E.30304
G3 X36.582 Y45.078 I1.912 J-.885 E.01291
G1 X29.749 Y51.91 E.29706
G1 X29.749 Y51.377 E.0164
G1 X36.487 Y44.64 E.29292
G3 X36.453 Y44.14 I2.481 J-.419 E.01543
G1 X29.749 Y50.843 E.29145
G1 X29.749 Y50.309 E.0164
G1 X36.494 Y43.565 E.29326
G3 X36.697 Y42.828 I3.85 J.664 E.02352
G1 X29.749 Y49.776 E.30208
G1 X29.749 Y49.242 E.0164
G1 X45.117 Y33.874 E.66818
G1 X45.651 Y33.874 E.0164
G1 X38.701 Y40.824 E.30216
G3 X39.437 Y40.622 I1.311 J3.337 E.02348
G1 X46.184 Y33.874 E.29339
G1 X46.718 Y33.874 E.0164
G1 X40.014 Y40.578 E.29148
G3 X40.512 Y40.614 I.086 J2.295 E.01538
G1 X47.252 Y33.874 E.29304
G1 X47.785 Y33.874 E.0164
G1 X40.955 Y40.705 E.29696
G3 X41.35 Y40.843 I-2.241 J7.045 E.01288
G1 X48.319 Y33.874 E.30297
G1 X48.852 Y33.874 E.0164
G1 X41.71 Y41.016 E.31053
G3 X42.039 Y41.222 I-.861 J1.742 E.01192
G1 X49.386 Y33.874 E.31946
G1 X49.919 Y33.874 E.0164
G1 X42.337 Y41.457 E.32967
G3 X42.607 Y41.72 I-1.178 J1.479 E.01162
G1 X50.453 Y33.874 E.34112
G1 X50.987 Y33.874 E.0164
G1 X42.849 Y42.012 E.3538
G3 X43.062 Y42.333 I-1.499 J1.224 E.01186
G1 X51.52 Y33.874 E.36776
G1 X52.054 Y33.874 E.0164
G1 X43.244 Y42.685 E.38306
G3 X43.391 Y43.071 I-1.851 J.929 E.01273
G1 X52.587 Y33.874 E.39984
G1 X53.121 Y33.874 E.0164
G1 X43.493 Y43.502 E.41859
G3 X43.545 Y43.984 I-2.39 J.498 E.01494
G1 X53.654 Y33.874 E.43956
G1 X54.188 Y33.874 E.0164
G1 X43.525 Y44.537 E.46361
G3 X43.377 Y45.219 I-4.096 J-.535 E.02149
G1 X54.891 Y33.705 E.50065
G1 X62.864 Y54.545 F30000
G1 F15000
G1 X83.534 Y33.874 E.89875
G1 X83.001 Y33.874 E.0164
G1 X62.5 Y54.376 E.89137
G1 X61.966 Y54.376 E.0164
G1 X82.467 Y33.874 E.89137
G1 X81.934 Y33.874 E.0164
G1 X61.432 Y54.376 E.89137
G1 X60.899 Y54.376 E.0164
G1 X81.4 Y33.874 E.89137
G1 X80.866 Y33.874 E.0164
G1 X60.365 Y54.376 E.89137
G1 X59.832 Y54.376 E.0164
G1 X80.333 Y33.874 E.89137
G1 X79.799 Y33.874 E.0164
G1 X59.298 Y54.376 E.89137
G1 X58.765 Y54.376 E.0164
G1 X79.266 Y33.874 E.89137
G1 X78.732 Y33.874 E.0164
G1 X58.231 Y54.376 E.89137
G1 X57.697 Y54.376 E.0164
G1 X78.199 Y33.874 E.89137
G1 X77.665 Y33.874 E.0164
G1 X57.164 Y54.376 E.89137
G1 X56.63 Y54.376 E.0164
G1 X77.131 Y33.874 E.89137
G1 X76.598 Y33.874 E.0164
G1 X56.097 Y54.376 E.89137
G1 X55.563 Y54.376 E.0164
G1 X76.064 Y33.874 E.89137
G1 X75.531 Y33.874 E.0164
G1 X55.03 Y54.376 E.89137
G1 X54.496 Y54.376 E.0164
G1 X74.997 Y33.874 E.89137
G1 X74.464 Y33.874 E.0164
G1 X53.963 Y54.376 E.89137
G1 X53.429 Y54.376 E.0164
G1 X73.93 Y33.874 E.89137
G1 X73.396 Y33.874 E.0164
G1 X52.895 Y54.376 E.89137
G1 X52.362 Y54.376 E.0164
G1 X72.863 Y33.874 E.89137
G1 X72.329 Y33.874 E.0164
G1 X51.828 Y54.376 E.89137
G1 X51.295 Y54.376 E.0164
G1 X71.796 Y33.874 E.89137
G1 X71.262 Y33.874 E.0164
G1 X50.761 Y54.376 E.89137
G1 X50.251 Y54.376 E.0157
G1 X50.251 Y54.886 E.0157
G1 X29.749 Y75.387 E.89137
G1 X29.749 Y75.921 E.0164
G1 X50.251 Y55.42 E.89137
G1 X50.251 Y55.953 E.0164
G1 X29.749 Y76.454 E.89137
G1 X29.749 Y76.988 E.0164
G1 X50.251 Y56.487 E.89137
G1 X50.251 Y57.02 E.0164
G1 X29.749 Y77.521 E.89137
G1 X29.749 Y78.055 E.0164
G1 X50.251 Y57.554 E.89137
G1 X50.251 Y58.088 E.0164
G1 X29.749 Y78.589 E.89137
G1 X29.749 Y79.122 E.0164
G1 X50.251 Y58.621 E.89137
G1 X50.251 Y59.155 E.0164
G1 X29.749 Y79.656 E.89137
G1 X29.749 Y80.189 E.0164
G1 X50.251 Y59.688 E.89137
G1 X50.251 Y60.222 E.0164
G1 X29.749 Y80.723 E.89137
G1 X29.749 Y81.256 E.0164
G1 X50.251 Y60.755 E.89137
G1 X50.251 Y61.289 E.0164
G1 X29.749 Y81.79 E.89137
G1 X29.749 Y82.324 E.0164
G1 X50.251 Y61.822 E.89137
G1 X50.251 Y62.356 E.0164
G1 X29.749 Y82.857 E.89137
G1 X29.749 Y83.391 E.0164
G1 X50.251 Y62.89 E.89137
G1 X50.251 Y63.423 E.0164
G1 X29.749 Y83.924 E.89137
G1 X29.749 Y84.458 E.0164
G1 X50.251 Y63.957 E.89137
G1 X50.251 Y64.49 E.0164
G1 X29.749 Y84.991 E.89137
G1 X29.749 Y85.525 E.0164
G1 X50.251 Y65.024 E.89137
G1 X50.251 Y65.557 E.0164
G1 X29.749 Y86.059 E.89137
G1 X29.749 Y86.592 E.0164
G1 X50.251 Y66.091 E.89137
G1 X50.251 Y66.625 E.0164
G1 X29.749 Y87.126 E.89137
G1 X29.749 Y87.659 E.0164
G1 X50.251 Y67.158 E.89137
G1 X50.251 Y67.692 E.0164
G1 X29.749 Y88.193 E.89137
G1 X29.749 Y88.726 E.0164
G1 X50.251 Y68.225 E.89137
G1 X50.251 Y68.759 E.0164
G1 X29.749 Y89.26 E.89137
G1 X29.749 Y89.794 E.0164
G1 X50.251 Y69.292 E.89137
G1 X50.251 Y69.826 E.0164
G1 X29.749 Y90.327 E.89137
G1 X29.749 Y90.861 E.0164
G1 X50.251 Y70.36 E.89137
G1 X50.251 Y70.893 E.0164
G1 X29.749 Y91.394 E.89137
G1 X29.749 Y91.928 E.0164
G1 X50.251 Y71.427 E.89137
G1 X50.251 Y71.96 E.0164
G1 X29.749 Y92.461 E.89137
G1 X29.749 Y92.995 E.0164
G1 X50.251 Y72.494 E.89137
G1 X50.251 Y73.027 E.0164
G1 X29.749 Y93.529 E.89137
G1 X29.749 Y94.062 E.0164
G1 X50.251 Y73.561 E.89137
G1 X50.251 Y74.095 E.0164
G1 X29.749 Y94.596 E.89137
G1 X29.749 Y95.129 E.0164
G1 X50.251 Y74.628 E.89137
G1 X50.251 Y75.162 E.0164
G1 X29.749 Y95.663 E.89137
G1 X29.749 Y96.196 E.0164
G1 X50.251 Y75.695 E.89137
G1 X50.251 Y76.229 E.0164
G1 X29.749 Y96.73 E.89137
G1 X29.749 Y97.263 E.0164
G1 X50.251 Y76.762 E.89137
G1 X50.251 Y77.296 E.0164
G1 X29.749 Y97.797 E.89137
G1 X29.749 Y98.331 E.0164
G1 X50.251 Y77.83 E.89137
G1 X50.251 Y78.363 E.0164
G1 X29.749 Y98.864 E.89137
G1 X29.749 Y99.398 E.0164
G1 X50.251 Y78.897 E.89137
G1 X50.251 Y79.43 E.0164
G1 X29.749 Y99.931 E.89137
G1 X29.749 Y100.465 E.0164
G1 X50.251 Y79.964 E.89137
G1 X50.251 Y80.497 E.0164
G1 X29.749 Y100.998 E.89137
G1 X29.749 Y101.532 E.0164
G1 X50.251 Y81.031 E.89137
G1 X50.251 Y81.565 E.0164
G1 X29.749 Y102.066 E.89137
G1 X29.749 Y102.599 E.0164
G1 X50.251 Y82.098 E.89137
G1 X50.251 Y82.632 E.0164
G1 X29.749 Y103.133 E.89137
G1 X29.749 Y103.666 E.0164
G1 X50.251 Y83.165 E.89137
G1 X50.251 Y83.699 E.0164
G1 X29.749 Y104.2 E.89137
G1 X29.749 Y104.733 E.0164
G1 X50.251 Y84.232 E.89137
G1 X50.251 Y84.766 E.0164
G1 X29.749 Y105.267 E.89137
G1 X29.749 Y105.801 E.0164
G1 X50.251 Y85.3 E.89137
G1 X50.251 Y85.833 E.0164
G1 X29.749 Y106.334 E.89137
G1 X29.749 Y106.868 E.0164
G1 X50.251 Y86.367 E.89137
G1 X50.251 Y86.9 E.0164
G1 X29.749 Y107.401 E.89137
G1 X29.749 Y107.935 E.0164
G1 X50.251 Y87.434 E.89137
G1 X50.251 Y87.967 E.0164
G1 X29.749 Y108.468 E.89137
G1 X29.749 Y109.002 E.0164
G1 X50.251 Y88.501 E.89137
G1 X50.251 Y89.034 E.0164
G1 X29.749 Y109.536 E.89137
G1 X29.749 Y110.069 E.0164
G1 X50.251 Y89.568 E.89137
G1 X50.251 Y90.102 E.0164
G1 X29.749 Y110.603 E.89137
G1 X29.749 Y111.136 E.0164
G1 X50.251 Y90.635 E.89137
G1 X50.251 Y91.169 E.0164
G1 X29.749 Y111.67 E.89137
G1 X29.749 Y112.203 E.0164
G1 X50.251 Y91.702 E.89137
G1 X50.251 Y92.236 E.0164
G1 X29.749 Y112.737 E.89137
G1 X29.749 Y113.271 E.0164
G1 X50.251 Y92.769 E.89137
G1 X50.251 Y93.303 E.0164
G1 X29.749 Y113.804 E.89137
G1 X29.749 Y114.338 E.0164
G1 X50.251 Y93.837 E.89137
G1 X50.251 Y94.37 E.0164
G1 X29.749 Y114.871 E.89137
G1 X29.749 Y115.405 E.0164
G1 X50.251 Y94.904 E.89137
G1 X50.251 Y95.437 E.0164
G1 X29.749 Y115.938 E.89137
G1 X29.749 Y116.472 E.0164
G1 X50.251 Y95.971 E.89137
G1 X50.251 Y96.504 E.0164
G1 X29.749 Y117.006 E.89137
G1 X29.749 Y117.539 E.0164
G1 X50.251 Y97.038 E.89137
G1 X50.251 Y97.572 E.0164
G1 X29.749 Y118.073 E.89137
G1 X29.749 Y118.606 E.0164
G1 X50.251 Y98.105 E.89137
G1 X50.251 Y98.639 E.0164
G1 X29.749 Y119.14 E.89137
G1 X29.749 Y119.673 E.0164
G1 X50.251 Y99.172 E.89137
G1 X50.251 Y99.706 E.0164
G1 X29.749 Y120.207 E.89137
G1 X29.749 Y120.74 E.0164
G1 X50.251 Y100.239 E.89137
G1 X50.251 Y100.773 E.0164
G1 X29.749 Y121.274 E.89137
G1 X29.749 Y121.808 E.0164
G1 X50.251 Y101.307 E.89137
G1 X50.251 Y101.84 E.0164
G1 X29.749 Y122.341 E.89137
G1 X29.749 Y122.875 E.0164
G1 X50.251 Y102.374 E.89137
G1 X50.251 Y102.907 E.0164
G1 X29.749 Y123.408 E.89137
G1 X29.749 Y123.942 E.0164
G1 X50.251 Y103.441 E.89137
G1 X50.251 Y103.974 E.0164
G1 X29.749 Y124.475 E.89137
G1 X29.749 Y125.009 E.0164
G1 X50.251 Y104.508 E.89137
G1 X50.251 Y105.042 E.0164
G1 X29.749 Y125.543 E.89137
G1 X29.749 Y126.076 E.0164
G1 X50.251 Y105.575 E.89137
M73 P87 R7
G1 X50.251 Y106.109 E.0164
G1 X29.749 Y126.61 E.89137
G1 X29.749 Y127.143 E.0164
G1 X50.251 Y106.642 E.89137
G1 X50.251 Y107.176 E.0164
G1 X29.749 Y127.677 E.89137
G1 X29.749 Y128.21 E.0164
G1 X50.251 Y107.709 E.89137
G1 X50.251 Y108.243 E.0164
G1 X29.749 Y128.744 E.89137
G1 X29.749 Y129.278 E.0164
G1 X50.251 Y108.777 E.89137
G1 X50.251 Y109.31 E.0164
G1 X29.749 Y129.811 E.89137
G1 X29.749 Y130.345 E.0164
G1 X50.251 Y109.844 E.89137
G1 X50.251 Y110.377 E.0164
G1 X29.58 Y131.048 E.89875
; WIPE_START
G1 X30.994 Y129.634 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X37.88 Y126.341 Z3.2 F30000
G1 X50.42 Y120.345 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F15000
G1 X43.168 Y127.598 E.31534
G2 X43.465 Y126.767 I-3.314 J-1.656 E.02721
G1 X50.251 Y119.981 E.29502
G1 X50.251 Y119.448 E.0164
G1 X43.544 Y126.155 E.2916
G2 X43.532 Y125.633 I-4.863 J-.149 E.01605
G1 X50.251 Y118.914 E.29212
G1 X50.251 Y118.381 E.0164
G1 X43.452 Y125.18 E.29561
G2 X43.327 Y124.77 I-2.11 J.417 E.01317
G1 X50.251 Y117.847 E.30101
G1 X50.251 Y117.314 E.0164
G1 X43.166 Y124.398 E.30804
G2 X42.971 Y124.059 I-1.793 J.804 E.01204
G1 X50.251 Y116.78 E.3165
G1 X50.251 Y116.246 E.0164
G1 X42.746 Y123.751 E.32628
G2 X42.492 Y123.471 I-1.528 J1.132 E.01163
G1 X50.251 Y115.713 E.33731
G1 X50.251 Y115.179 E.0164
G1 X42.21 Y123.22 E.3496
G2 X41.897 Y122.999 I-1.258 J1.451 E.01179
G1 X50.251 Y114.646 E.3632
G1 X50.251 Y114.112 E.0164
G1 X41.553 Y122.809 E.37814
G2 X41.176 Y122.653 I-.969 J1.807 E.01258
G1 X50.251 Y113.579 E.39455
G1 X50.251 Y113.045 E.0164
G1 X40.76 Y122.535 E.41262
G2 X40.3 Y122.463 I-.594 J2.271 E.01437
G1 X50.251 Y112.512 E.43266
G1 X50.251 Y111.978 E.0164
G1 X39.768 Y122.46 E.45576
G2 X39.137 Y122.558 I.264 J3.795 E.01966
G1 X50.251 Y111.444 E.4832
G1 X50.251 Y110.911 E.0164
G1 X29.749 Y131.412 E.89137
G1 X29.749 Y131.945 E.0164
G1 X36.555 Y125.14 E.29589
M73 P88 R7
G2 X36.458 Y125.77 I3.104 J.799 E.01964
G1 X29.749 Y132.479 E.29168
G1 X29.749 Y133.013 E.0164
G1 X36.465 Y126.297 E.29198
G2 X36.535 Y126.761 I2.348 J-.118 E.01444
G1 X29.749 Y133.546 E.29502
G1 X29.749 Y134.08 E.0164
G1 X36.651 Y127.178 E.30008
G2 X36.808 Y127.555 I7.312 J-2.814 E.01255
G1 X29.749 Y134.613 E.30689
G1 X29.749 Y135.147 E.0164
G1 X37 Y127.897 E.31524
G2 X37.222 Y128.208 I1.668 J-.956 E.01178
G1 X29.749 Y135.68 E.3249
G1 X29.749 Y136.214 E.0164
G1 X37.473 Y128.49 E.33581
G2 X37.752 Y128.745 I1.411 J-1.27 E.01163
G1 X29.749 Y136.748 E.34796
G1 X29.749 Y137.281 E.0164
G1 X38.06 Y128.97 E.36136
G2 X38.399 Y129.165 I1.145 J-1.592 E.01203
G1 X29.749 Y137.815 E.37607
G1 X29.749 Y138.348 E.0164
G1 X38.77 Y129.328 E.3922
G2 X39.178 Y129.454 I.833 J-1.978 E.01314
G1 X29.749 Y138.882 E.40993
G1 X29.749 Y139.415 E.0164
G1 X39.635 Y129.53 E.42982
G2 X40.154 Y129.545 I.333 J-2.58 E.01599
G1 X29.749 Y139.949 E.45238
G1 X29.749 Y140.483 E.0164
G1 X40.769 Y129.463 E.47912
G2 X41.593 Y129.173 I-.82 J-3.644 E.0269
G1 X29.749 Y141.016 E.51493
G1 X29.749 Y141.55 E.0164
G1 X50.251 Y121.049 E.89137
G1 X50.251 Y121.582 E.0164
G1 X29.749 Y142.083 E.89137
G1 X29.749 Y142.617 E.0164
G1 X50.251 Y122.116 E.89137
G1 X50.251 Y122.649 E.0164
G1 X29.749 Y143.15 E.89137
G1 X29.749 Y143.684 E.0164
G1 X50.251 Y123.183 E.89137
G1 X50.251 Y123.716 E.0164
G1 X29.749 Y144.218 E.89137
G1 X29.749 Y144.751 E.0164
G1 X50.251 Y124.25 E.89137
G1 X50.251 Y124.784 E.0164
G1 X29.749 Y145.285 E.89137
G1 X29.749 Y145.818 E.0164
G1 X50.251 Y125.317 E.89137
G1 X50.251 Y125.851 E.0164
G1 X29.749 Y146.352 E.89137
G1 X29.749 Y146.885 E.0164
G1 X50.251 Y126.384 E.89137
G1 X50.251 Y126.918 E.0164
G1 X29.749 Y147.419 E.89137
G1 X29.749 Y147.952 E.0164
G1 X50.251 Y127.451 E.89137
G1 X50.251 Y127.985 E.0164
G1 X29.749 Y148.486 E.89137
G1 X29.749 Y149.02 E.0164
G1 X50.251 Y128.519 E.89137
G1 X50.251 Y129.052 E.0164
G1 X29.749 Y149.553 E.89137
G1 X29.749 Y150.087 E.0164
G1 X50.251 Y129.586 E.89137
G1 X50.251 Y130.119 E.0164
G1 X29.749 Y150.62 E.89137
G1 X29.749 Y151.154 E.0164
G1 X50.251 Y130.653 E.89137
G1 X50.251 Y131.186 E.0164
G1 X29.749 Y151.687 E.89137
G1 X29.749 Y152.221 E.0164
G1 X50.251 Y131.72 E.89137
G1 X50.251 Y132.254 E.0164
G1 X29.749 Y152.755 E.89137
G1 X29.749 Y153.288 E.0164
G1 X50.251 Y132.787 E.89137
G1 X50.251 Y133.321 E.0164
G1 X29.749 Y153.822 E.89137
G1 X29.749 Y154.355 E.0164
G1 X50.251 Y133.854 E.89137
G1 X50.251 Y134.388 E.0164
G1 X29.749 Y154.889 E.89137
G1 X29.749 Y155.422 E.0164
G1 X50.251 Y134.921 E.89137
G1 X50.251 Y135.455 E.0164
G1 X29.749 Y155.956 E.89137
G1 X29.749 Y156.49 E.0164
G1 X50.251 Y135.989 E.89137
G1 X50.251 Y136.522 E.0164
G1 X29.749 Y157.023 E.89137
G1 X29.749 Y157.557 E.0164
G1 X50.251 Y137.056 E.89137
G1 X50.251 Y137.589 E.0164
G1 X29.749 Y158.09 E.89137
G1 X29.749 Y158.624 E.0164
G1 X50.251 Y138.123 E.89137
G1 X50.251 Y138.656 E.0164
G1 X29.749 Y159.157 E.89137
G1 X29.749 Y159.691 E.0164
G1 X50.251 Y139.19 E.89137
G1 X50.251 Y139.724 E.0164
G1 X29.749 Y160.225 E.89137
G1 X29.749 Y160.758 E.0164
G1 X50.251 Y140.257 E.89137
G1 X50.251 Y140.791 E.0164
G1 X29.749 Y161.292 E.89137
G1 X29.749 Y161.825 E.0164
G1 X50.251 Y141.324 E.89137
G1 X50.251 Y141.858 E.0164
G1 X29.749 Y162.359 E.89137
G1 X29.749 Y162.892 E.0164
G1 X50.251 Y142.391 E.89137
G1 X50.251 Y142.925 E.0164
G1 X29.749 Y163.426 E.89137
G1 X29.749 Y163.96 E.0164
G1 X50.251 Y143.458 E.89137
G1 X50.251 Y143.992 E.0164
G1 X29.749 Y164.493 E.89137
G1 X29.749 Y165.027 E.0164
G1 X50.251 Y144.526 E.89137
G1 X50.251 Y145.059 E.0164
G1 X29.749 Y165.56 E.89137
G1 X29.749 Y166.094 E.0164
G1 X50.251 Y145.593 E.89137
G1 X50.251 Y146.126 E.0164
G1 X29.749 Y166.627 E.89137
G1 X29.749 Y167.161 E.0164
G1 X50.251 Y146.66 E.89137
G1 X50.251 Y147.193 E.0164
G1 X29.749 Y167.695 E.89137
G1 X29.749 Y168.228 E.0164
G1 X50.251 Y147.727 E.89137
G1 X50.251 Y148.261 E.0164
G1 X29.749 Y168.762 E.89137
G1 X29.749 Y169.295 E.0164
G1 X50.251 Y148.794 E.89137
G1 X50.251 Y149.328 E.0164
G1 X29.749 Y169.829 E.89137
G1 X29.749 Y170.362 E.0164
G1 X50.251 Y149.861 E.89137
G1 X50.251 Y150.395 E.0164
G1 X29.749 Y170.896 E.89137
G1 X29.749 Y171.43 E.0164
G1 X50.251 Y150.928 E.89137
G1 X50.251 Y151.462 E.0164
G1 X29.749 Y171.963 E.89137
G1 X29.749 Y172.497 E.0164
G1 X50.251 Y151.996 E.89137
G1 X50.251 Y152.529 E.0164
G1 X29.749 Y173.03 E.89137
G1 X29.749 Y173.564 E.0164
G1 X50.251 Y153.063 E.89137
G1 X50.251 Y153.596 E.0164
G1 X29.749 Y174.097 E.89137
G1 X29.749 Y174.631 E.0164
G1 X50.251 Y154.13 E.89137
G1 X50.251 Y154.663 E.0164
G1 X29.749 Y175.164 E.89137
G1 X29.749 Y175.698 E.0164
G1 X50.251 Y155.197 E.89137
G1 X50.251 Y155.731 E.0164
G1 X29.749 Y176.232 E.89137
G1 X29.749 Y176.765 E.0164
G1 X50.251 Y156.264 E.89137
G1 X50.251 Y156.798 E.0164
G1 X29.749 Y177.299 E.89137
G1 X29.749 Y177.832 E.0164
G1 X50.251 Y157.331 E.89137
G1 X50.251 Y157.865 E.0164
G1 X29.749 Y178.366 E.89137
G1 X29.749 Y178.899 E.0164
G1 X50.251 Y158.398 E.89137
G1 X50.251 Y158.932 E.0164
G1 X29.749 Y179.433 E.89137
G1 X29.749 Y179.967 E.0164
G1 X50.251 Y159.466 E.89137
G1 X50.251 Y159.999 E.0164
G1 X29.749 Y180.5 E.89137
G1 X29.749 Y181.034 E.0164
G1 X50.251 Y160.533 E.89137
G1 X50.251 Y161.066 E.0164
G1 X29.749 Y181.567 E.89137
G1 X29.749 Y182.101 E.0164
G1 X50.251 Y161.6 E.89137
G1 X50.251 Y162.133 E.0164
G1 X29.749 Y182.634 E.89137
G1 X29.749 Y183.168 E.0164
G1 X50.251 Y162.667 E.89137
G1 X50.251 Y163.201 E.0164
G1 X29.749 Y183.702 E.89137
G1 X29.749 Y184.235 E.0164
G1 X50.251 Y163.734 E.89137
G1 X50.251 Y164.268 E.0164
G1 X29.749 Y184.769 E.89137
G1 X29.749 Y185.302 E.0164
G1 X50.251 Y164.801 E.89137
G1 X50.251 Y165.335 E.0164
G1 X29.749 Y185.836 E.89137
G1 X29.749 Y186.369 E.0164
G1 X50.251 Y165.868 E.89137
G1 X50.251 Y166.402 E.0164
G1 X29.749 Y186.903 E.89137
G1 X29.749 Y187.437 E.0164
G1 X50.251 Y166.935 E.89137
G1 X50.251 Y167.469 E.0164
G1 X29.749 Y187.97 E.89137
G1 X29.749 Y188.504 E.0164
G1 X50.251 Y168.003 E.89137
G1 X50.251 Y168.536 E.0164
G1 X29.749 Y189.037 E.89137
G1 X29.749 Y189.571 E.0164
G1 X50.251 Y169.07 E.89137
G1 X50.251 Y169.603 E.0164
G1 X29.749 Y190.104 E.89137
G1 X29.749 Y190.638 E.0164
G1 X50.251 Y170.137 E.89137
G1 X50.251 Y170.67 E.0164
G1 X29.749 Y191.172 E.89137
G1 X29.749 Y191.705 E.0164
G1 X50.251 Y171.204 E.89137
G1 X50.251 Y171.738 E.0164
G1 X29.749 Y192.239 E.89137
G1 X29.749 Y192.772 E.0164
G1 X50.251 Y172.271 E.89137
G1 X50.251 Y172.805 E.0164
G1 X29.749 Y193.306 E.89137
G1 X29.749 Y193.839 E.0164
G1 X50.251 Y173.338 E.89137
G1 X50.251 Y173.872 E.0164
G1 X29.749 Y194.373 E.89137
G1 X29.749 Y194.907 E.0164
G1 X50.251 Y174.405 E.89137
G1 X50.251 Y174.939 E.0164
G1 X29.749 Y195.44 E.89137
G1 X29.749 Y195.974 E.0164
G1 X50.251 Y175.473 E.89137
G1 X50.251 Y176.006 E.0164
G1 X29.749 Y196.507 E.89137
G1 X29.749 Y197.041 E.0164
G1 X50.251 Y176.54 E.89137
G1 X50.251 Y177.073 E.0164
G1 X29.749 Y197.574 E.89137
G1 X29.749 Y198.108 E.0164
G1 X50.251 Y177.607 E.89137
G1 X50.251 Y178.14 E.0164
G1 X29.749 Y198.642 E.89137
G1 X29.749 Y199.175 E.0164
G1 X50.251 Y178.674 E.89137
G1 X50.251 Y179.208 E.0164
G1 X29.749 Y199.709 E.89137
G1 X29.749 Y200.242 E.0164
G1 X50.251 Y179.741 E.89137
G1 X50.251 Y180.275 E.0164
G1 X29.749 Y200.776 E.89137
G1 X29.749 Y201.309 E.0164
G1 X50.251 Y180.808 E.89137
G1 X50.251 Y181.342 E.0164
G1 X29.749 Y201.843 E.89137
G1 X29.749 Y202.376 E.0164
G1 X50.251 Y181.875 E.89137
G1 X50.251 Y182.409 E.0164
G1 X29.749 Y202.91 E.89137
G1 X29.749 Y203.444 E.0164
G1 X50.251 Y182.943 E.89137
G1 X50.251 Y183.476 E.0164
G1 X29.749 Y203.977 E.89137
G1 X29.749 Y204.511 E.0164
G1 X50.251 Y184.01 E.89137
G1 X50.251 Y184.543 E.0164
G1 X29.749 Y205.044 E.89137
G1 X29.749 Y205.578 E.0164
G1 X50.251 Y185.077 E.89137
G1 X50.251 Y185.61 E.0164
G1 X29.749 Y206.111 E.89137
G1 X29.749 Y206.645 E.0164
G1 X50.251 Y186.144 E.89137
G1 X50.251 Y186.678 E.0164
G1 X29.749 Y207.179 E.89137
G1 X29.749 Y207.712 E.0164
G1 X50.251 Y187.211 E.89137
G1 X50.251 Y187.745 E.0164
G1 X29.749 Y208.246 E.89137
G1 X29.749 Y208.779 E.0164
G1 X50.251 Y188.278 E.89137
G1 X50.251 Y188.812 E.0164
G1 X29.749 Y209.313 E.89137
G1 X29.749 Y209.846 E.0164
G1 X50.251 Y189.345 E.89137
G1 X50.251 Y189.879 E.0164
G1 X29.749 Y210.38 E.89137
G1 X29.749 Y210.914 E.0164
G1 X50.251 Y190.413 E.89137
G1 X50.251 Y190.946 E.0164
G1 X29.749 Y211.447 E.89137
G1 X29.749 Y211.981 E.0164
G1 X50.251 Y191.48 E.89137
G1 X50.251 Y192.013 E.0164
G1 X29.58 Y212.684 E.89875
; WIPE_START
G1 X30.994 Y211.27 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X37.606 Y207.456 Z3.2 F30000
G1 X54.947 Y197.455 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F15000
G1 X43.345 Y209.057 E.50445
G2 X43.515 Y208.353 I-3.392 J-1.194 E.02231
G1 X54.244 Y197.624 E.46645
G1 X53.71 Y197.624 E.0164
G1 X43.547 Y207.787 E.44187
G2 X43.501 Y207.3 I-2.46 J-.01 E.01506
G1 X53.176 Y197.624 E.42069
G1 X52.643 Y197.624 E.0164
G1 X43.403 Y206.864 E.40174
G2 X43.262 Y206.472 I-6.637 J2.174 E.01282
G1 X52.109 Y197.624 E.38469
G1 X51.576 Y197.624 E.0164
G1 X43.083 Y206.117 E.36926
G2 X42.873 Y205.793 I-1.72 J.884 E.01188
G1 X51.042 Y197.624 E.35518
G1 X50.509 Y197.624 E.0164
G1 X42.634 Y205.499 E.34237
G2 X42.367 Y205.233 I-1.459 J1.199 E.01162
G1 X50.251 Y197.349 E.34278
G1 X50.251 Y196.815 E.0164
G1 X42.071 Y204.995 E.35564
G2 X41.746 Y204.787 I-1.204 J1.522 E.0119
G1 X50.251 Y196.282 E.36979
G1 X50.251 Y195.748 E.0164
G1 X41.389 Y204.61 E.3853
G2 X40.997 Y204.468 I-.905 J1.885 E.01283
G1 X50.251 Y195.215 E.40233
G1 X50.251 Y194.681 E.0164
G1 X40.561 Y204.37 E.42128
G2 X40.069 Y204.329 I-.434 J2.231 E.01523
G1 X50.251 Y194.147 E.4427
G1 X50.251 Y193.614 E.0164
G1 X39.504 Y204.361 E.46725
G2 X38.793 Y204.538 I.583 J3.847 E.02257
G1 X50.251 Y193.08 E.49818
G1 X50.251 Y192.547 E.0164
G1 X29.749 Y213.048 E.89137
G1 X29.749 Y213.581 E.0164
G1 X36.659 Y206.672 E.30042
G2 X36.485 Y207.38 I4.223 J1.415 E.02244
G1 X29.749 Y214.115 E.29284
G1 X29.749 Y214.649 E.0164
G1 X36.453 Y207.945 E.29145
G2 X36.495 Y208.437 I4.627 J-.146 E.01518
G1 X29.749 Y215.182 E.29327
G1 X29.749 Y215.716 E.0164
G1 X36.595 Y208.87 E.29763
G2 X36.736 Y209.263 I2.037 J-.509 E.01285
G1 X29.749 Y216.249 E.30375
G1 X29.749 Y216.783 E.0164
G1 X36.912 Y209.621 E.3114
G2 X37.119 Y209.947 I1.732 J-.874 E.0119
G1 X29.749 Y217.316 E.32043
G1 X29.749 Y217.85 E.0164
G1 X37.356 Y210.243 E.33074
G2 X37.622 Y210.511 I1.47 J-1.193 E.01162
G1 X30.007 Y218.126 E.33108
G1 X30.541 Y218.126 E.0164
G1 X37.916 Y210.75 E.32067
G2 X38.241 Y210.959 I6.545 J-9.808 E.01187
G1 X31.075 Y218.126 E.31158
G1 X31.608 Y218.126 E.0164
G1 X38.598 Y211.136 E.30392
G2 X38.991 Y211.276 I.899 J-1.894 E.01285
G1 X32.142 Y218.126 E.29781
G1 X32.675 Y218.126 E.0164
G1 X39.425 Y211.376 E.29348
G2 X39.909 Y211.425 I.491 J-2.398 E.01498
G1 X33.209 Y218.126 E.29132
G1 X33.742 Y218.126 E.0164
G1 X40.478 Y211.39 E.29285
G2 X41.181 Y211.22 I-.491 J-3.572 E.02229
G1 X34.276 Y218.126 E.30024
G1 X34.81 Y218.126 E.0164
G1 X55.311 Y197.624 E.89137
G1 X55.844 Y197.624 E.0164
G1 X35.343 Y218.126 E.89137
G1 X35.877 Y218.126 E.0164
G1 X56.378 Y197.624 E.89137
G1 X56.911 Y197.624 E.0164
G1 X36.41 Y218.126 E.89137
G1 X36.944 Y218.126 E.0164
G1 X57.445 Y197.624 E.89137
G1 X57.979 Y197.624 E.0164
G1 X37.477 Y218.126 E.89137
G1 X38.011 Y218.126 E.0164
G1 X58.512 Y197.624 E.89137
G1 X59.046 Y197.624 E.0164
G1 X38.545 Y218.126 E.89137
G1 X39.078 Y218.126 E.0164
G1 X59.579 Y197.624 E.89137
G1 X60.113 Y197.624 E.0164
G1 X39.612 Y218.126 E.89137
G1 X40.145 Y218.126 E.0164
G1 X60.646 Y197.624 E.89137
G1 X61.18 Y197.624 E.0164
G1 X40.679 Y218.126 E.89137
G1 X41.212 Y218.126 E.0164
G1 X61.713 Y197.624 E.89137
G1 X62.247 Y197.624 E.0164
G1 X41.746 Y218.126 E.89137
G1 X42.28 Y218.126 E.0164
G1 X62.781 Y197.624 E.89137
G1 X63.314 Y197.624 E.0164
G1 X42.813 Y218.126 E.89137
G1 X43.347 Y218.126 E.0164
G1 X63.848 Y197.624 E.89137
G1 X64.381 Y197.624 E.0164
G1 X43.88 Y218.126 E.89137
G1 X44.414 Y218.126 E.0164
G1 X64.915 Y197.624 E.89137
G1 X65.448 Y197.624 E.0164
G1 X44.947 Y218.126 E.89137
G1 X45.481 Y218.126 E.0164
G1 X65.982 Y197.624 E.89137
G1 X66.516 Y197.624 E.0164
G1 X46.015 Y218.126 E.89137
G1 X46.548 Y218.126 E.0164
G1 X67.049 Y197.624 E.89137
G1 X67.583 Y197.624 E.0164
G1 X47.082 Y218.126 E.89137
G1 X47.615 Y218.126 E.0164
G1 X68.116 Y197.624 E.89137
G1 X68.65 Y197.624 E.0164
G1 X48.149 Y218.126 E.89137
G1 X48.682 Y218.126 E.0164
G1 X69.183 Y197.624 E.89137
G1 X69.717 Y197.624 E.0164
G1 X49.216 Y218.126 E.89137
G1 X49.75 Y218.126 E.0164
G1 X70.251 Y197.624 E.89137
G1 X70.784 Y197.624 E.0164
G1 X50.283 Y218.126 E.89137
G1 X50.817 Y218.126 E.0164
G1 X71.318 Y197.624 E.89137
G1 X71.851 Y197.624 E.0164
G1 X51.35 Y218.126 E.89137
G1 X51.884 Y218.126 E.0164
G1 X72.385 Y197.624 E.89137
G1 X72.918 Y197.624 E.0164
G1 X52.417 Y218.126 E.89137
G1 X52.951 Y218.126 E.0164
G1 X73.452 Y197.624 E.89137
G1 X73.986 Y197.624 E.0164
G1 X53.484 Y218.126 E.89137
G1 X54.018 Y218.126 E.0164
G1 X74.519 Y197.624 E.89137
G1 X75.053 Y197.624 E.0164
G1 X54.552 Y218.126 E.89137
G1 X55.085 Y218.126 E.0164
G1 X75.586 Y197.624 E.89137
G1 X76.12 Y197.624 E.0164
G1 X55.619 Y218.126 E.89137
G1 X56.152 Y218.126 E.0164
G1 X76.653 Y197.624 E.89137
G1 X77.187 Y197.624 E.0164
G1 X56.686 Y218.126 E.89137
G1 X57.219 Y218.126 E.0164
G1 X77.721 Y197.624 E.89137
G1 X78.254 Y197.624 E.0164
G1 X57.753 Y218.126 E.89137
G1 X58.287 Y218.126 E.0164
G1 X78.788 Y197.624 E.89137
G1 X79.321 Y197.624 E.0164
G1 X58.82 Y218.126 E.89137
G1 X59.354 Y218.126 E.0164
G1 X79.855 Y197.624 E.89137
G1 X80.388 Y197.624 E.0164
G1 X59.887 Y218.126 E.89137
G1 X60.421 Y218.126 E.0164
G1 X80.922 Y197.624 E.89137
G1 X81.456 Y197.624 E.0164
G1 X60.954 Y218.126 E.89137
G1 X61.488 Y218.126 E.0164
G1 X81.989 Y197.624 E.89137
G1 X82.523 Y197.624 E.0164
G1 X62.022 Y218.126 E.89137
G1 X62.555 Y218.126 E.0164
G1 X83.056 Y197.624 E.89137
G1 X83.59 Y197.624 E.0164
G1 X63.089 Y218.126 E.89137
G1 X63.622 Y218.126 E.0164
G1 X84.123 Y197.624 E.89137
G1 X84.657 Y197.624 E.0164
G1 X64.156 Y218.126 E.89137
G1 X64.689 Y218.126 E.0164
G1 X85.191 Y197.624 E.89137
G1 X85.724 Y197.624 E.0164
G1 X65.223 Y218.126 E.89137
G1 X65.757 Y218.126 E.0164
G1 X86.258 Y197.624 E.89137
G1 X86.791 Y197.624 E.0164
G1 X66.29 Y218.126 E.89137
G1 X66.824 Y218.126 E.0164
G1 X87.325 Y197.624 E.89137
G1 X87.858 Y197.624 E.0164
G1 X67.357 Y218.126 E.89137
G1 X67.891 Y218.126 E.0164
G1 X88.392 Y197.624 E.89137
G1 X88.925 Y197.624 E.0164
G1 X68.424 Y218.126 E.89137
G1 X68.958 Y218.126 E.0164
G1 X89.459 Y197.624 E.89137
G1 X89.993 Y197.624 E.0164
G1 X69.492 Y218.126 E.89137
G1 X70.025 Y218.126 E.0164
G1 X90.526 Y197.624 E.89137
G1 X91.06 Y197.624 E.0164
G1 X70.559 Y218.126 E.89137
G1 X71.092 Y218.126 E.0164
G1 X91.593 Y197.624 E.89137
G1 X92.127 Y197.624 E.0164
G1 X71.626 Y218.126 E.89137
G1 X72.159 Y218.126 E.0164
G1 X92.66 Y197.624 E.89137
G1 X93.194 Y197.624 E.0164
G1 X72.693 Y218.126 E.89137
G1 X73.227 Y218.126 E.0164
G1 X93.728 Y197.624 E.89137
G1 X94.261 Y197.624 E.0164
G1 X73.76 Y218.126 E.89137
G1 X74.294 Y218.126 E.0164
G1 X94.795 Y197.624 E.89137
G1 X95.328 Y197.624 E.0164
G1 X74.827 Y218.126 E.89137
G1 X75.361 Y218.126 E.0164
G1 X95.862 Y197.624 E.89137
G1 X96.395 Y197.624 E.0164
G1 X75.894 Y218.126 E.89137
G1 X76.428 Y218.126 E.0164
G1 X96.929 Y197.624 E.89137
G1 X97.463 Y197.624 E.0164
G1 X76.962 Y218.126 E.89137
G1 X77.495 Y218.126 E.0164
G1 X97.996 Y197.624 E.89137
G1 X98.53 Y197.624 E.0164
G1 X78.029 Y218.126 E.89137
G1 X78.562 Y218.126 E.0164
G1 X99.063 Y197.624 E.89137
G1 X99.597 Y197.624 E.0164
G1 X79.096 Y218.126 E.89137
G1 X79.629 Y218.126 E.0164
G1 X100.13 Y197.624 E.89137
G1 X100.664 Y197.624 E.0164
G1 X80.163 Y218.126 E.89137
G1 X80.696 Y218.126 E.0164
G1 X101.198 Y197.624 E.89137
G1 X101.731 Y197.624 E.0164
G1 X81.23 Y218.126 E.89137
G1 X81.764 Y218.126 E.0164
G1 X102.265 Y197.624 E.89137
G1 X102.798 Y197.624 E.0164
G1 X82.297 Y218.126 E.89137
G1 X82.831 Y218.126 E.0164
G1 X103.332 Y197.624 E.89137
G1 X103.865 Y197.624 E.0164
G1 X83.364 Y218.126 E.89137
G1 X83.898 Y218.126 E.0164
G1 X104.399 Y197.624 E.89137
G1 X104.933 Y197.624 E.0164
G1 X84.431 Y218.126 E.89137
G1 X84.965 Y218.126 E.0164
G1 X105.466 Y197.624 E.89137
G1 X106 Y197.624 E.0164
G1 X85.499 Y218.126 E.89137
G1 X86.032 Y218.126 E.0164
G1 X106.533 Y197.624 E.89137
G1 X107.067 Y197.624 E.0164
G1 X86.566 Y218.126 E.89137
G1 X87.099 Y218.126 E.0164
G1 X107.6 Y197.624 E.89137
G1 X108.134 Y197.624 E.0164
G1 X87.633 Y218.126 E.89137
G1 X88.166 Y218.126 E.0164
G1 X108.668 Y197.624 E.89137
G1 X109.201 Y197.624 E.0164
G1 X88.7 Y218.126 E.89137
G1 X89.234 Y218.126 E.0164
G1 X109.735 Y197.624 E.89137
G1 X110.268 Y197.624 E.0164
G1 X89.767 Y218.126 E.89137
G1 X90.301 Y218.126 E.0164
G1 X110.802 Y197.624 E.89137
G1 X111.335 Y197.624 E.0164
G1 X90.834 Y218.126 E.89137
M73 P89 R7
G1 X91.368 Y218.126 E.0164
G1 X111.869 Y197.624 E.89137
G1 X112.403 Y197.624 E.0164
G1 X91.901 Y218.126 E.89137
G1 X92.435 Y218.126 E.0164
G1 X112.936 Y197.624 E.89137
G1 X113.47 Y197.624 E.0164
G1 X92.969 Y218.126 E.89137
G1 X93.502 Y218.126 E.0164
G1 X114.003 Y197.624 E.89137
G1 X114.537 Y197.624 E.0164
G1 X94.036 Y218.126 E.89137
G1 X94.569 Y218.126 E.0164
G1 X115.07 Y197.624 E.89137
G1 X115.604 Y197.624 E.0164
G1 X95.103 Y218.126 E.89137
G1 X95.636 Y218.126 E.0164
G1 X116.138 Y197.624 E.89137
G1 X116.671 Y197.624 E.0164
G1 X96.17 Y218.126 E.89137
G1 X96.704 Y218.126 E.0164
G1 X117.205 Y197.624 E.89137
G1 X117.738 Y197.624 E.0164
G1 X97.237 Y218.126 E.89137
G1 X97.771 Y218.126 E.0164
G1 X118.272 Y197.624 E.89137
G1 X118.805 Y197.624 E.0164
G1 X98.304 Y218.126 E.89137
G1 X98.838 Y218.126 E.0164
G1 X119.339 Y197.624 E.89137
G1 X119.872 Y197.624 E.0164
G1 X99.371 Y218.126 E.89137
G1 X99.905 Y218.126 E.0164
G1 X120.406 Y197.624 E.89137
G1 X120.94 Y197.624 E.0164
G1 X100.439 Y218.126 E.89137
G1 X100.972 Y218.126 E.0164
G1 X121.473 Y197.624 E.89137
G1 X122.007 Y197.624 E.0164
G1 X101.506 Y218.126 E.89137
G1 X102.039 Y218.126 E.0164
G1 X122.54 Y197.624 E.89137
G1 X123.074 Y197.624 E.0164
G1 X102.573 Y218.126 E.89137
G1 X103.106 Y218.126 E.0164
G1 X123.607 Y197.624 E.89137
G1 X124.141 Y197.624 E.0164
G1 X103.64 Y218.126 E.89137
G1 X104.174 Y218.126 E.0164
G1 X124.675 Y197.624 E.89137
G1 X125.208 Y197.624 E.0164
G1 X104.707 Y218.126 E.89137
G1 X105.241 Y218.126 E.0164
G1 X125.742 Y197.624 E.89137
G1 X126.275 Y197.624 E.0164
G1 X105.774 Y218.126 E.89137
G1 X106.308 Y218.126 E.0164
G1 X126.809 Y197.624 E.89137
G1 X127.342 Y197.624 E.0164
G1 X106.841 Y218.126 E.89137
G1 X107.375 Y218.126 E.0164
G1 X127.876 Y197.624 E.89137
G1 X128.41 Y197.624 E.0164
G1 X107.909 Y218.126 E.89137
G1 X108.442 Y218.126 E.0164
G1 X128.943 Y197.624 E.89137
G1 X129.477 Y197.624 E.0164
G1 X108.976 Y218.126 E.89137
G1 X109.509 Y218.126 E.0164
G1 X130.01 Y197.624 E.89137
G1 X130.544 Y197.624 E.0164
G1 X110.043 Y218.126 E.89137
G1 X110.576 Y218.126 E.0164
G1 X131.077 Y197.624 E.89137
G1 X131.611 Y197.624 E.0164
G1 X111.11 Y218.126 E.89137
G1 X111.643 Y218.126 E.0164
G1 X132.145 Y197.624 E.89137
G1 X132.678 Y197.624 E.0164
G1 X112.007 Y218.295 E.89875
G1 X122.145 Y218.295 F30000
G1 F15000
G1 X129.24 Y211.2 E.30847
G3 X128.522 Y211.385 I-1.304 J-3.593 E.02281
G1 X121.781 Y218.126 E.29309
G1 X121.248 Y218.126 E.0164
G1 X127.949 Y211.425 E.29135
G3 X127.458 Y211.381 I.158 J-4.597 E.01514
G1 X120.714 Y218.126 E.29323
G1 X120.181 Y218.126 E.0164
G1 X127.021 Y211.285 E.29744
G3 X126.626 Y211.146 I.494 J-2.048 E.0129
G1 X119.647 Y218.126 E.30344
G1 X119.113 Y218.126 E.0164
G1 X126.266 Y210.973 E.31101
G3 X125.939 Y210.767 I.864 J-1.738 E.01192
G1 X118.58 Y218.126 E.31996
G1 X118.046 Y218.126 E.0164
G1 X125.642 Y210.53 E.33025
G3 X125.374 Y210.264 I1.193 J-1.469 E.01162
G1 X117.513 Y218.126 E.34181
G1 X116.979 Y218.126 E.0164
G1 X125.135 Y209.97 E.35461
G3 X124.925 Y209.646 I1.514 J-1.21 E.01188
G1 X116.446 Y218.126 E.36869
G1 X115.912 Y218.126 E.0164
G1 X124.747 Y209.29 E.38414
G3 X124.604 Y208.9 I1.885 J-.912 E.01281
G1 X115.378 Y218.126 E.40112
G1 X114.845 Y218.126 E.0164
G1 X124.501 Y208.469 E.41985
G3 X124.453 Y207.984 I4.393 J-.683 E.015
G1 X114.311 Y218.126 E.44094
G1 X113.778 Y218.126 E.0164
G1 X124.48 Y207.423 E.46534
G3 X124.642 Y206.728 I3.854 J.529 E.02196
G1 X113.244 Y218.126 E.49555
G1 X112.711 Y218.126 E.0164
G1 X133.212 Y197.624 E.89137
G1 X133.745 Y197.624 E.0164
G1 X126.857 Y204.513 E.29951
G3 X127.551 Y204.352 I1.445 J4.66 E.02193
G1 X134.279 Y197.624 E.29252
G1 X134.812 Y197.624 E.0164
G1 X128.107 Y204.33 E.29155
G3 X128.596 Y204.375 I.04 J2.258 E.01512
G1 X135.346 Y197.624 E.29349
G1 X135.88 Y197.624 E.0164
G1 X129.026 Y204.478 E.29797
G3 X129.415 Y204.622 I-.527 J2.018 E.01278
G1 X136.413 Y197.624 E.30425
G1 X136.947 Y197.624 E.0164
G1 X129.77 Y204.801 E.31203
G3 X130.093 Y205.011 I-.889 J1.722 E.01188
G1 X137.48 Y197.624 E.32117
G1 X138.014 Y197.624 E.0164
G1 X130.387 Y205.251 E.33159
G3 X130.653 Y205.519 I-1.205 J1.459 E.01162
G1 X138.547 Y197.624 E.34324
G1 X139.081 Y197.624 E.0164
G1 X130.89 Y205.815 E.35614
G3 X131.098 Y206.141 I-1.528 J1.203 E.0119
G1 X139.615 Y197.624 E.3703
G1 X140.148 Y197.624 E.0164
G1 X131.274 Y206.499 E.38584
G3 X131.411 Y206.895 I-1.914 J.883 E.01292
G1 X140.682 Y197.624 E.40308
G1 X141.215 Y197.624 E.0164
G1 X131.506 Y207.334 E.42216
G3 X131.549 Y207.824 I-2.432 J.462 E.01516
G1 X141.749 Y197.624 E.44347
G1 X142.282 Y197.624 E.0164
G1 X131.508 Y208.398 E.46844
G3 X131.323 Y209.118 I-3.519 J-.525 E.02289
G1 X142.816 Y197.624 E.49972
G1 X143.35 Y197.624 E.0164
G1 X122.848 Y218.126 E.89137
G1 X123.382 Y218.126 E.0164
G1 X143.883 Y197.624 E.89137
G1 X144.417 Y197.624 E.0164
G1 X123.916 Y218.126 E.89137
G1 X124.449 Y218.126 E.0164
G1 X144.95 Y197.624 E.89137
G1 X145.484 Y197.624 E.0164
G1 X124.983 Y218.126 E.89137
G1 X125.516 Y218.126 E.0164
G1 X146.017 Y197.624 E.89137
G1 X146.551 Y197.624 E.0164
G1 X126.05 Y218.126 E.89137
G1 X126.583 Y218.126 E.0164
G1 X147.084 Y197.624 E.89137
G1 X147.618 Y197.624 E.0164
G1 X127.117 Y218.126 E.89137
G1 X127.651 Y218.126 E.0164
G1 X148.152 Y197.624 E.89137
G1 X148.685 Y197.624 E.0164
G1 X128.184 Y218.126 E.89137
G1 X128.718 Y218.126 E.0164
G1 X149.219 Y197.624 E.89137
G1 X149.752 Y197.624 E.0164
G1 X129.251 Y218.126 E.89137
G1 X129.785 Y218.126 E.0164
G1 X150.286 Y197.624 E.89137
G1 X150.819 Y197.624 E.0164
G1 X130.318 Y218.126 E.89137
G1 X130.852 Y218.126 E.0164
G1 X151.353 Y197.624 E.89137
G1 X151.887 Y197.624 E.0164
G1 X131.386 Y218.126 E.89137
G1 X131.919 Y218.126 E.0164
G1 X152.42 Y197.624 E.89137
G1 X152.954 Y197.624 E.0164
G1 X132.453 Y218.126 E.89137
G1 X132.986 Y218.126 E.0164
G1 X153.487 Y197.624 E.89137
G1 X154.021 Y197.624 E.0164
G1 X133.52 Y218.126 E.89137
G1 X134.053 Y218.126 E.0164
G1 X154.554 Y197.624 E.89137
G1 X155.088 Y197.624 E.0164
G1 X134.587 Y218.126 E.89137
G1 X135.121 Y218.126 E.0164
G1 X155.622 Y197.624 E.89137
G1 X156.155 Y197.624 E.0164
G1 X135.654 Y218.126 E.89137
G1 X136.188 Y218.126 E.0164
G1 X156.689 Y197.624 E.89137
G1 X157.222 Y197.624 E.0164
G1 X136.721 Y218.126 E.89137
G1 X137.255 Y218.126 E.0164
G1 X157.756 Y197.624 E.89137
G1 X158.289 Y197.624 E.0164
G1 X137.788 Y218.126 E.89137
G1 X138.322 Y218.126 E.0164
G1 X158.823 Y197.624 E.89137
G1 X159.357 Y197.624 E.0164
G1 X138.855 Y218.126 E.89137
G1 X139.389 Y218.126 E.0164
G1 X159.89 Y197.624 E.89137
G1 X160.424 Y197.624 E.0164
G1 X139.923 Y218.126 E.89137
G1 X140.456 Y218.126 E.0164
G1 X160.957 Y197.624 E.89137
G1 X161.491 Y197.624 E.0164
G1 X140.99 Y218.126 E.89137
G1 X141.523 Y218.126 E.0164
G1 X162.024 Y197.624 E.89137
G1 X162.558 Y197.624 E.0164
G1 X142.057 Y218.126 E.89137
G1 X142.59 Y218.126 E.0164
G1 X163.092 Y197.624 E.89137
G1 X163.625 Y197.624 E.0164
G1 X143.124 Y218.126 E.89137
G1 X143.658 Y218.126 E.0164
G1 X164.159 Y197.624 E.89137
G1 X164.692 Y197.624 E.0164
G1 X144.191 Y218.126 E.89137
G1 X144.725 Y218.126 E.0164
G1 X165.226 Y197.624 E.89137
G1 X165.759 Y197.624 E.0164
G1 X145.258 Y218.126 E.89137
M73 P89 R6
G1 X145.792 Y218.126 E.0164
G1 X166.293 Y197.624 E.89137
G1 X166.827 Y197.624 E.0164
G1 X146.325 Y218.126 E.89137
G1 X146.859 Y218.126 E.0164
G1 X167.36 Y197.624 E.89137
G1 X167.894 Y197.624 E.0164
G1 X147.393 Y218.126 E.89137
G1 X147.926 Y218.126 E.0164
G1 X168.427 Y197.624 E.89137
G1 X168.961 Y197.624 E.0164
G1 X148.46 Y218.126 E.89137
G1 X148.993 Y218.126 E.0164
G1 X169.494 Y197.624 E.89137
G1 X170.028 Y197.624 E.0164
G1 X149.527 Y218.126 E.89137
G1 X150.06 Y218.126 E.0164
G1 X170.562 Y197.624 E.89137
G1 X171.095 Y197.624 E.0164
G1 X150.594 Y218.126 E.89137
G1 X151.128 Y218.126 E.0164
G1 X171.629 Y197.624 E.89137
G1 X172.162 Y197.624 E.0164
G1 X151.661 Y218.126 E.89137
G1 X152.195 Y218.126 E.0164
G1 X172.696 Y197.624 E.89137
G1 X173.229 Y197.624 E.0164
G1 X152.728 Y218.126 E.89137
G1 X153.262 Y218.126 E.0164
G1 X173.763 Y197.624 E.89137
G1 X174.296 Y197.624 E.0164
G1 X153.795 Y218.126 E.89137
G1 X154.329 Y218.126 E.0164
G1 X174.83 Y197.624 E.89137
G1 X175.364 Y197.624 E.0164
G1 X154.863 Y218.126 E.89137
G1 X155.396 Y218.126 E.0164
G1 X175.897 Y197.624 E.89137
G1 X176.431 Y197.624 E.0164
G1 X155.93 Y218.126 E.89137
G1 X156.463 Y218.126 E.0164
G1 X176.964 Y197.624 E.89137
G1 X177.498 Y197.624 E.0164
G1 X156.997 Y218.126 E.89137
G1 X157.53 Y218.126 E.0164
G1 X178.031 Y197.624 E.89137
G1 X178.565 Y197.624 E.0164
G1 X158.064 Y218.126 E.89137
G1 X158.598 Y218.126 E.0164
G1 X179.099 Y197.624 E.89137
G1 X179.632 Y197.624 E.0164
G1 X159.131 Y218.126 E.89137
G1 X159.665 Y218.126 E.0164
G1 X180.166 Y197.624 E.89137
G1 X180.699 Y197.624 E.0164
G1 X160.198 Y218.126 E.89137
G1 X160.732 Y218.126 E.0164
G1 X181.233 Y197.624 E.89137
G1 X181.766 Y197.624 E.0164
G1 X161.265 Y218.126 E.89137
G1 X161.799 Y218.126 E.0164
G1 X182.3 Y197.624 E.89137
G1 X182.834 Y197.624 E.0164
G1 X162.333 Y218.126 E.89137
G1 X162.866 Y218.126 E.0164
G1 X183.367 Y197.624 E.89137
G1 X183.901 Y197.624 E.0164
G1 X163.4 Y218.126 E.89137
G1 X163.933 Y218.126 E.0164
G1 X184.434 Y197.624 E.89137
G1 X184.968 Y197.624 E.0164
G1 X164.467 Y218.126 E.89137
G1 X165 Y218.126 E.0164
G1 X185.501 Y197.624 E.89137
G1 X186.035 Y197.624 E.0164
G1 X165.534 Y218.126 E.89137
G1 X166.067 Y218.126 E.0164
G1 X186.569 Y197.624 E.89137
G1 X187.102 Y197.624 E.0164
G1 X166.601 Y218.126 E.89137
G1 X167.135 Y218.126 E.0164
G1 X187.636 Y197.624 E.89137
G1 X188.169 Y197.624 E.0164
G1 X167.668 Y218.126 E.89137
G1 X168.202 Y218.126 E.0164
G1 X188.703 Y197.624 E.89137
G1 X189.236 Y197.624 E.0164
G1 X168.735 Y218.126 E.89137
G1 X169.269 Y218.126 E.0164
G1 X189.77 Y197.624 E.89137
G1 X190.304 Y197.624 E.0164
G1 X169.802 Y218.126 E.89137
G1 X170.336 Y218.126 E.0164
G1 X190.837 Y197.624 E.89137
G1 X191.371 Y197.624 E.0164
G1 X170.87 Y218.126 E.89137
G1 X171.403 Y218.126 E.0164
G1 X191.904 Y197.624 E.89137
G1 X192.438 Y197.624 E.0164
G1 X171.937 Y218.126 E.89137
G1 X172.47 Y218.126 E.0164
G1 X192.971 Y197.624 E.89137
G1 X193.505 Y197.624 E.0164
G1 X173.004 Y218.126 E.89137
G1 X173.537 Y218.126 E.0164
G1 X194.039 Y197.624 E.89137
G1 X194.572 Y197.624 E.0164
G1 X174.071 Y218.126 E.89137
G1 X174.605 Y218.126 E.0164
G1 X195.106 Y197.624 E.89137
G1 X195.639 Y197.624 E.0164
G1 X175.138 Y218.126 E.89137
G1 X175.672 Y218.126 E.0164
G1 X196.173 Y197.624 E.89137
G1 X196.706 Y197.624 E.0164
G1 X176.205 Y218.126 E.89137
G1 X176.739 Y218.126 E.0164
G1 X197.24 Y197.624 E.89137
G1 X197.774 Y197.624 E.0164
G1 X177.272 Y218.126 E.89137
G1 X177.806 Y218.126 E.0164
G1 X198.307 Y197.624 E.89137
G1 X198.841 Y197.624 E.0164
G1 X178.34 Y218.126 E.89137
G1 X178.873 Y218.126 E.0164
G1 X199.374 Y197.624 E.89137
G1 X199.908 Y197.624 E.0164
G1 X179.407 Y218.126 E.89137
G1 X179.94 Y218.126 E.0164
G1 X200.441 Y197.624 E.89137
G1 X200.975 Y197.624 E.0164
G1 X180.474 Y218.126 E.89137
G1 X181.007 Y218.126 E.0164
G1 X201.509 Y197.624 E.89137
G1 X202.042 Y197.624 E.0164
G1 X181.541 Y218.126 E.89137
G1 X182.075 Y218.126 E.0164
G1 X202.576 Y197.624 E.89137
G1 X203.109 Y197.624 E.0164
G1 X182.608 Y218.126 E.89137
G1 X183.142 Y218.126 E.0164
G1 X203.643 Y197.624 E.89137
G1 X204.176 Y197.624 E.0164
G1 X183.675 Y218.126 E.89137
G1 X184.209 Y218.126 E.0164
G1 X204.71 Y197.624 E.89137
G1 X205.243 Y197.624 E.0164
G1 X184.573 Y218.295 E.89875
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X185.987 Y216.881 E-.76
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
G1 X127.931 Y205.867
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X127.944 Y205.866 E.0004
G3 X127.75 Y205.88 I.053 J2.004 E.38117
G1 X127.871 Y205.871 E.00372
; WIPE_START
M204 S10000
G1 X127.944 Y205.866 E-.02773
G1 X128.15 Y205.87 E-.07842
G1 X128.544 Y205.94 E-.15224
G1 X128.917 Y206.086 E-.15214
G1 X129.253 Y206.303 E-.15209
G1 X129.54 Y206.583 E-.15212
G1 X129.607 Y206.681 E-.04526
; WIPE_END
G1 E-.04 F1800
G1 X121.975 Y206.613 Z3.4 F30000
G1 X40.225 Y205.884 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X40.544 Y205.941 E.00995
G3 X39.75 Y205.88 I-.547 J1.929 E.3625
G1 X39.944 Y205.866 E.00596
G3 X40.15 Y205.871 I.053 J2.004 E.00634
G1 X40.166 Y205.874 E.00051
; WIPE_START
M204 S10000
G1 X40.544 Y205.941 E-.1459
G1 X40.917 Y206.086 E-.15209
G1 X41.253 Y206.303 E-.15213
G1 X41.54 Y206.583 E-.15208
G1 X41.765 Y206.914 E-.15215
G1 X41.771 Y206.927 E-.00566
; WIPE_END
G1 E-.04 F1800
G1 X41.602 Y199.297 Z3.4 F30000
G1 X39.937 Y123.991 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X39.944 Y123.991 E.0002
G3 X39.75 Y124.005 I.053 J2.004 E.38117
G1 X39.877 Y123.996 E.00392
; WIPE_START
M204 S10000
G1 X39.944 Y123.991 E-.02525
G1 X40.15 Y123.995 E-.07842
G1 X40.544 Y124.065 E-.15222
G1 X40.917 Y124.211 E-.15213
G1 X41.253 Y124.428 E-.15215
G1 X41.54 Y124.708 E-.15207
G1 X41.611 Y124.812 E-.04776
; WIPE_END
G1 E-.04 F1800
G1 X41.456 Y117.181 Z3.4 F30000
G1 X39.937 Y42.116 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X39.944 Y42.116 E.00019
G3 X39.75 Y42.13 I.053 J2.004 E.38117
G1 X39.878 Y42.121 E.00393
; WIPE_START
M204 S10000
G1 X39.944 Y42.116 E-.02514
G1 X40.15 Y42.12 E-.07842
G1 X40.544 Y42.19 E-.15224
G1 X40.917 Y42.336 E-.15213
G1 X41.253 Y42.553 E-.15215
G1 X41.54 Y42.833 E-.15213
G1 X41.611 Y42.937 E-.04781
; WIPE_END
G1 E-.04 F1800
G1 X47.167 Y48.17 Z3.4 F30000
G1 X204.21 Y196.085 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X51.79 Y196.085 E4.68344
G1 X51.79 Y55.915 E4.30703
G1 X204.21 Y55.915 E4.68344
G1 X204.21 Y196.025 E4.30519
; WIPE_START
M204 S10000
G1 X202.21 Y196.026 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X197.677 Y189.885 Z3.4 F30000
G1 X85.905 Y38.457 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S5000
G3 X85.41 Y38.735 I-.513 J-.332 E.01815
G1 X83.61 Y38.735 E.05532
G1 X83.61 Y41.515 E.08542
G1 X85.41 Y41.515 E.05532
G3 X85.41 Y42.735 I-.012 J.61 E.05814
G1 X82.94 Y42.733 E.0759
G3 X82.39 Y42.135 I.068 J-.614 E.02724
G1 X82.392 Y38.065 E.12507
G3 X82.881 Y37.526 I.618 J.069 E.02389
G1 X85.46 Y37.517 E.07925
G3 X85.936 Y38.405 I-.067 J.607 E.03638
; WIPE_START
M204 S10000
G1 X85.788 Y38.597 E-.09224
G1 X85.629 Y38.691 E-.0701
G1 X85.41 Y38.735 E-.08468
G1 X84.06 Y38.735 E-.51298
; WIPE_END
G1 E-.04 F1800
G1 X86.295 Y41.789 Z3.4 F30000
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S5000
G3 X86.795 Y41.515 I.509 J.337 E.01821
G1 X88.59 Y41.515 E.05516
G1 X88.59 Y40.87 E.01981
G1 X86.356 Y38.544 E.0991
G3 X86.665 Y37.53 I.445 J-.418 E.0394
G1 X86.744 Y37.517 E.00246
G1 X89.26 Y37.517 E.07732
G3 X89.207 Y38.735 I-.061 J.608 E.05678
G1 X88.231 Y38.735 E.02999
G1 X89.647 Y40.21 E.06282
G3 X89.81 Y40.615 I-.638 J.492 E.01359
G1 X89.808 Y42.185 E.04824
G3 X89.207 Y42.735 I-.614 J-.068 E.02733
G1 X86.74 Y42.733 E.07581
G3 X86.265 Y41.84 I.065 J-.607 E.03662
; WIPE_START
M204 S10000
G1 X86.415 Y41.651 E-.09181
G1 X86.571 Y41.559 E-.06867
G1 X86.795 Y41.515 E-.08685
G1 X88.144 Y41.515 E-.51267
; WIPE_END
G1 E-.04 F1800
G1 X95.776 Y41.63 Z3.4 F30000
G1 X127.937 Y42.116 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X127.944 Y42.116 E.00019
G3 X127.75 Y42.13 I.053 J2.004 E.38117
G1 X127.878 Y42.121 E.00393
; WIPE_START
M204 S10000
G1 X127.944 Y42.116 E-.02515
G1 X128.15 Y42.12 E-.07842
G1 X128.544 Y42.19 E-.15224
G1 X128.917 Y42.336 E-.15213
G1 X129.253 Y42.553 E-.15211
G1 X129.54 Y42.833 E-.15216
G1 X129.611 Y42.937 E-.0478
; WIPE_END
G1 E-.04 F1800
G1 X137.243 Y42.864 Z3.4 F30000
G1 X215.937 Y42.116 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X215.944 Y42.116 E.00019
G3 X215.75 Y42.13 I.053 J2.004 E.38117
G1 X215.877 Y42.121 E.00392
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
G1 X217.453 Y50.567 Z3.4 F30000
G1 X215.937 Y123.991 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X215.944 Y123.991 E.00019
G3 X215.75 Y124.005 I.053 J2.004 E.38117
G1 X215.878 Y123.996 E.00393
; WIPE_START
M204 S10000
G1 X215.944 Y123.991 E-.02514
G1 X216.15 Y123.995 E-.07842
G1 X216.544 Y124.065 E-.15222
G1 X216.917 Y124.211 E-.15213
G1 X217.253 Y124.428 E-.15216
G1 X217.54 Y124.708 E-.15206
G1 X217.611 Y124.812 E-.04787
; WIPE_END
G1 E-.04 F1800
G1 X217.48 Y132.443 Z3.4 F30000
G1 X216.225 Y205.884 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X216.544 Y205.941 E.00996
G3 X215.75 Y205.88 I-.547 J1.929 E.3625
G1 X215.944 Y205.866 E.00596
G3 X216.15 Y205.871 I.053 J2.004 E.00634
G1 X216.166 Y205.874 E.0005
; WIPE_START
M204 S10000
G1 X216.544 Y205.941 E-.14593
G1 X216.917 Y206.086 E-.15208
G1 X217.253 Y206.303 E-.15212
G1 X217.54 Y206.583 E-.15208
G1 X217.765 Y206.914 E-.15215
G1 X217.771 Y206.927 E-.00564
; WIPE_END
G1 E-.04 F1800
G1 X222.49 Y212.926 Z3.4 F30000
G1 X227.79 Y219.665 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X28.21 Y219.665 E6.13254
G1 X28.21 Y32.335 E5.75613
G1 X227.79 Y32.335 E6.13254
G1 X227.79 Y219.605 E5.75429
; WIPE_START
M204 S10000
G1 X225.79 Y219.606 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X225.83 Y211.973 Z3.4 F30000
G1 X226.782 Y32.542 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Top surface
G1 F12000
M204 S2000
G1 X227.583 Y33.343 E.03481
G1 X227.583 Y33.877
G1 X226.248 Y32.542 E.05798
G1 X225.715 Y32.542
G1 X227.583 Y34.41 E.08115
G1 X227.583 Y34.943
G1 X225.182 Y32.542 E.10432
G1 X224.649 Y32.542
G1 X227.583 Y35.476 E.1275
G1 X227.583 Y36.01
G1 X224.115 Y32.542 E.15067
G1 X223.582 Y32.542
G1 X227.583 Y36.543 E.17384
G1 X227.583 Y37.076
G1 X223.049 Y32.542 E.19701
G1 X222.516 Y32.542
G1 X227.583 Y37.609 E.22019
G1 X227.583 Y38.143
G1 X221.982 Y32.542 E.24336
G1 X221.449 Y32.542
G1 X227.583 Y38.676 E.26653
G1 X227.583 Y39.209
G1 X220.916 Y32.542 E.28971
G1 X220.383 Y32.542
G1 X227.583 Y39.742 E.31288
G1 X227.583 Y40.276
G1 X219.849 Y32.542 E.33605
G1 X219.316 Y32.542
G1 X227.583 Y40.809 E.35922
G1 X227.583 Y41.342
G1 X218.783 Y32.542 E.3824
G1 X218.25 Y32.542
G1 X227.583 Y41.875 E.40557
G1 X227.583 Y42.409
G1 X217.716 Y32.542 E.42874
G1 X217.183 Y32.542
G1 X227.583 Y42.942 E.45191
G1 X227.583 Y43.475
M73 P90 R6
G1 X216.65 Y32.542 E.47509
G1 X216.116 Y32.542
G1 X227.583 Y44.009 E.49826
G1 X227.583 Y44.542
G1 X215.583 Y32.542 E.52143
G1 X215.05 Y32.542
G1 X227.583 Y45.075 E.5446
G1 X227.583 Y45.608
G1 X214.517 Y32.542 E.56778
G1 X213.983 Y32.542
G1 X227.583 Y46.142 E.59095
G1 X227.583 Y46.675
G1 X213.45 Y32.542 E.61412
G1 X212.917 Y32.542
G1 X227.583 Y47.208 E.63729
G1 X227.583 Y47.741
G1 X212.384 Y32.542 E.66047
G1 X211.85 Y32.542
G1 X227.583 Y48.275 E.68364
G1 X227.583 Y48.808
G1 X211.317 Y32.542 E.70681
G1 X210.784 Y32.542
G1 X227.583 Y49.341 E.72999
G1 X227.583 Y49.874
G1 X210.251 Y32.542 E.75316
G1 X209.717 Y32.542
G1 X227.583 Y50.408 E.77633
G1 X227.583 Y50.941
G1 X209.184 Y32.542 E.7995
G1 X208.651 Y32.542
G1 X227.583 Y51.474 E.82268
G1 X227.583 Y52.007
G1 X208.118 Y32.542 E.84585
G1 X207.584 Y32.542
G1 X227.583 Y52.541 E.86902
G1 X227.583 Y53.074
G1 X218.156 Y43.647 E.40965
G1 X218.208 Y44.232
G1 X227.583 Y53.607 E.40739
G1 X227.583 Y54.14
G1 X218.137 Y44.695 E.41045
G1 X217.992 Y45.083
G1 X227.583 Y54.674 E.41676
G1 X227.583 Y55.207
G1 X217.792 Y45.416 E.42546
G1 X217.545 Y45.702
G1 X227.583 Y55.74 E.4362
G1 X227.583 Y56.273
G1 X217.253 Y45.944 E.44887
G1 X216.914 Y46.138
G1 X227.583 Y56.807 E.46361
G1 X227.583 Y57.34
G1 X216.518 Y46.275 E.48081
G1 X216.044 Y46.334
G1 X227.583 Y57.873 E.50141
G1 X227.583 Y58.406
G1 X215.437 Y46.261 E.52778
; WIPE_START
M204 S10000
G1 X216.851 Y47.675 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X216.476 Y41.967 Z3.4 F30000
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X207.051 Y32.542 E.40956
G1 X206.518 Y32.542
G1 X215.895 Y41.919 E.40747
G1 X215.432 Y41.99
G1 X205.985 Y32.542 E.41055
G1 X205.451 Y32.542
G1 X215.044 Y42.135 E.41683
G1 X214.71 Y42.334
G1 X204.918 Y32.542 E.42548
G1 X204.385 Y32.542
G1 X214.422 Y42.58 E.43617
G1 X214.18 Y42.87
G1 X203.852 Y32.542 E.4488
G1 X203.318 Y32.542
G1 X213.984 Y43.208 E.46349
G1 X213.846 Y43.603
G1 X202.785 Y32.542 E.48065
G1 X202.252 Y32.542
G1 X213.787 Y44.078 E.50127
G1 X213.851 Y44.675
G1 X201.719 Y32.542 E.52722
G1 X201.185 Y32.542
G1 X227.583 Y58.94 E1.14709
G1 X227.583 Y59.473
G1 X200.652 Y32.542 E1.17026
G1 X200.119 Y32.542
G1 X227.583 Y60.006 E1.19344
G1 X227.583 Y60.539
G1 X199.586 Y32.542 E1.21661
G1 X199.052 Y32.542
G1 X227.583 Y61.073 E1.23978
G1 X227.583 Y61.606
G1 X198.519 Y32.542 E1.26296
G1 X197.986 Y32.542
G1 X227.583 Y62.139 E1.28613
G1 X227.583 Y62.673
G1 X197.452 Y32.542 E1.3093
G1 X196.919 Y32.542
G1 X227.583 Y63.206 E1.33247
G1 X227.583 Y63.739
G1 X196.386 Y32.542 E1.35565
G1 X195.853 Y32.542
G1 X227.583 Y64.272 E1.37882
G1 X227.583 Y64.806
G1 X195.319 Y32.542 E1.40199
G1 X194.786 Y32.542
G1 X227.583 Y65.339 E1.42516
G1 X227.583 Y65.872
G1 X194.253 Y32.542 E1.44834
G1 X193.72 Y32.542
G1 X227.583 Y66.405 E1.47151
G1 X227.583 Y66.939
G1 X193.186 Y32.542 E1.49468
G1 X192.653 Y32.542
G1 X227.583 Y67.472 E1.51785
G1 X227.583 Y68.005
G1 X192.12 Y32.542 E1.54103
G1 X191.587 Y32.542
G1 X227.583 Y68.538 E1.5642
G1 X227.583 Y69.072
G1 X191.053 Y32.542 E1.58737
G1 X190.52 Y32.542
G1 X227.583 Y69.605 E1.61054
G1 X227.583 Y70.138
G1 X189.987 Y32.542 E1.63372
G1 X189.454 Y32.542
G1 X227.583 Y70.671 E1.65689
G1 X227.583 Y71.205
G1 X188.92 Y32.542 E1.68006
G1 X188.387 Y32.542
G1 X227.583 Y71.738 E1.70324
G1 X227.583 Y72.271
G1 X187.854 Y32.542 E1.72641
G1 X187.321 Y32.542
G1 X227.583 Y72.804 E1.74958
G1 X227.583 Y73.338
G1 X186.787 Y32.542 E1.77275
G1 X186.254 Y32.542
G1 X227.583 Y73.871 E1.79593
G1 X227.583 Y74.404
G1 X185.721 Y32.542 E1.8191
G1 X185.188 Y32.542
G1 X227.583 Y74.937 E1.84227
G1 X227.583 Y75.471
G1 X184.654 Y32.542 E1.86544
G1 X184.121 Y32.542
G1 X227.583 Y76.004 E1.88862
G1 X227.583 Y76.537
G1 X183.588 Y32.542 E1.91179
G1 X183.055 Y32.542
G1 X227.583 Y77.07 E1.93496
G1 X227.583 Y77.604
G1 X182.521 Y32.542 E1.95813
G1 X181.988 Y32.542
G1 X227.583 Y78.137 E1.98131
G1 X227.583 Y78.67
G1 X181.455 Y32.542 E2.00448
G1 X180.922 Y32.542
G1 X204.087 Y55.708 E1.00664
G1 X203.553 Y55.708
G1 X180.388 Y32.542 E1.00664
G1 X179.855 Y32.542
G1 X203.02 Y55.708 E1.00664
G1 X202.487 Y55.708
G1 X179.322 Y32.542 E1.00664
G1 X178.788 Y32.542
G1 X201.954 Y55.708 E1.00664
G1 X201.42 Y55.708
G1 X178.255 Y32.542 E1.00664
G1 X177.722 Y32.542
G1 X200.887 Y55.708 E1.00664
G1 X200.354 Y55.708
G1 X177.189 Y32.542 E1.00664
G1 X176.655 Y32.542
G1 X199.821 Y55.708 E1.00664
G1 X199.287 Y55.708
G1 X176.122 Y32.542 E1.00664
G1 X175.589 Y32.542
G1 X198.754 Y55.708 E1.00664
G1 X198.221 Y55.708
G1 X175.056 Y32.542 E1.00664
G1 X174.522 Y32.542
G1 X197.688 Y55.708 E1.00664
G1 X197.154 Y55.708
G1 X173.989 Y32.542 E1.00664
G1 X173.456 Y32.542
G1 X196.621 Y55.708 E1.00664
G1 X196.088 Y55.708
G1 X172.923 Y32.542 E1.00664
G1 X172.389 Y32.542
G1 X195.555 Y55.708 E1.00664
G1 X195.021 Y55.708
G1 X171.856 Y32.542 E1.00664
G1 X171.323 Y32.542
G1 X194.488 Y55.708 E1.00664
G1 X193.955 Y55.708
G1 X170.79 Y32.542 E1.00664
G1 X170.256 Y32.542
G1 X193.422 Y55.708 E1.00664
G1 X192.888 Y55.708
G1 X169.723 Y32.542 E1.00664
G1 X169.19 Y32.542
G1 X192.355 Y55.708 E1.00664
G1 X191.822 Y55.708
G1 X168.657 Y32.542 E1.00664
G1 X168.123 Y32.542
G1 X191.289 Y55.708 E1.00664
G1 X190.755 Y55.708
G1 X167.59 Y32.542 E1.00664
G1 X167.057 Y32.542
G1 X190.222 Y55.708 E1.00664
G1 X189.689 Y55.708
G1 X166.524 Y32.542 E1.00664
G1 X165.99 Y32.542
G1 X189.156 Y55.708 E1.00664
G1 X188.622 Y55.708
G1 X165.457 Y32.542 E1.00664
G1 X164.924 Y32.542
G1 X188.089 Y55.708 E1.00664
G1 X187.556 Y55.708
G1 X164.391 Y32.542 E1.00664
G1 X163.857 Y32.542
G1 X187.023 Y55.708 E1.00664
G1 X186.489 Y55.708
G1 X163.324 Y32.542 E1.00664
G1 X162.791 Y32.542
G1 X185.956 Y55.708 E1.00664
G1 X185.423 Y55.708
G1 X162.257 Y32.542 E1.00664
G1 X161.724 Y32.542
G1 X184.889 Y55.708 E1.00664
G1 X184.356 Y55.708
G1 X161.191 Y32.542 E1.00664
G1 X160.658 Y32.542
G1 X183.823 Y55.708 E1.00664
G1 X183.29 Y55.708
G1 X160.124 Y32.542 E1.00664
G1 X159.591 Y32.542
G1 X182.756 Y55.708 E1.00664
G1 X182.223 Y55.708
G1 X159.058 Y32.542 E1.00664
G1 X158.525 Y32.542
G1 X181.69 Y55.708 E1.00664
G1 X181.157 Y55.708
G1 X157.991 Y32.542 E1.00664
G1 X157.458 Y32.542
G1 X180.623 Y55.708 E1.00664
G1 X180.09 Y55.708
G1 X156.925 Y32.542 E1.00664
G1 X156.392 Y32.542
G1 X179.557 Y55.708 E1.00664
G1 X179.024 Y55.708
G1 X155.858 Y32.542 E1.00664
G1 X155.325 Y32.542
G1 X178.49 Y55.708 E1.00664
G1 X177.957 Y55.708
G1 X154.792 Y32.542 E1.00664
M73 P90 R5
G1 X154.259 Y32.542
G1 X177.424 Y55.708 E1.00664
G1 X176.891 Y55.708
G1 X153.725 Y32.542 E1.00664
G1 X153.192 Y32.542
G1 X176.357 Y55.708 E1.00664
G1 X175.824 Y55.708
G1 X152.659 Y32.542 E1.00664
G1 X152.126 Y32.542
G1 X175.291 Y55.708 E1.00664
G1 X174.758 Y55.708
G1 X151.592 Y32.542 E1.00664
G1 X151.059 Y32.542
G1 X174.224 Y55.708 E1.00664
G1 X173.691 Y55.708
G1 X150.526 Y32.542 E1.00664
G1 X149.993 Y32.542
G1 X173.158 Y55.708 E1.00664
G1 X172.625 Y55.708
G1 X149.459 Y32.542 E1.00664
G1 X148.926 Y32.542
G1 X172.091 Y55.708 E1.00664
G1 X171.558 Y55.708
G1 X148.393 Y32.542 E1.00664
G1 X147.86 Y32.542
G1 X171.025 Y55.708 E1.00664
M73 P91 R5
G1 X170.492 Y55.708
G1 X147.326 Y32.542 E1.00664
G1 X146.793 Y32.542
G1 X169.958 Y55.708 E1.00664
G1 X169.425 Y55.708
G1 X146.26 Y32.542 E1.00664
G1 X145.727 Y32.542
G1 X168.892 Y55.708 E1.00664
G1 X168.358 Y55.708
G1 X145.193 Y32.542 E1.00664
G1 X144.66 Y32.542
G1 X167.825 Y55.708 E1.00664
G1 X167.292 Y55.708
G1 X144.127 Y32.542 E1.00664
G1 X143.593 Y32.542
G1 X166.759 Y55.708 E1.00664
G1 X166.225 Y55.708
G1 X143.06 Y32.542 E1.00664
G1 X142.527 Y32.542
G1 X165.692 Y55.708 E1.00664
G1 X165.159 Y55.708
G1 X141.994 Y32.542 E1.00664
G1 X141.46 Y32.542
G1 X164.626 Y55.708 E1.00664
G1 X164.092 Y55.708
G1 X140.927 Y32.542 E1.00664
G1 X140.394 Y32.542
G1 X163.559 Y55.708 E1.00664
G1 X163.026 Y55.708
G1 X139.861 Y32.542 E1.00664
G1 X139.327 Y32.542
G1 X162.493 Y55.708 E1.00664
G1 X161.959 Y55.708
G1 X138.794 Y32.542 E1.00664
G1 X138.261 Y32.542
G1 X161.426 Y55.708 E1.00664
G1 X160.893 Y55.708
G1 X137.728 Y32.542 E1.00664
G1 X137.194 Y32.542
G1 X160.36 Y55.708 E1.00664
G1 X159.826 Y55.708
G1 X136.661 Y32.542 E1.00664
G1 X136.128 Y32.542
G1 X159.293 Y55.708 E1.00664
G1 X158.76 Y55.708
G1 X135.595 Y32.542 E1.00664
G1 X135.061 Y32.542
G1 X158.227 Y55.708 E1.00664
G1 X157.693 Y55.708
G1 X134.528 Y32.542 E1.00664
G1 X133.995 Y32.542
G1 X157.16 Y55.708 E1.00664
G1 X156.627 Y55.708
G1 X133.462 Y32.542 E1.00664
G1 X132.928 Y32.542
G1 X156.094 Y55.708 E1.00664
G1 X155.56 Y55.708
G1 X132.395 Y32.542 E1.00664
G1 X131.862 Y32.542
G1 X155.027 Y55.708 E1.00664
G1 X154.494 Y55.708
G1 X131.329 Y32.542 E1.00664
G1 X130.795 Y32.542
G1 X153.961 Y55.708 E1.00664
G1 X153.427 Y55.708
G1 X130.262 Y32.542 E1.00664
G1 X129.729 Y32.542
G1 X152.894 Y55.708 E1.00664
G1 X152.361 Y55.708
G1 X129.196 Y32.542 E1.00664
G1 X128.662 Y32.542
G1 X151.828 Y55.708 E1.00664
G1 X151.294 Y55.708
G1 X128.129 Y32.542 E1.00664
G1 X127.596 Y32.542
G1 X150.761 Y55.708 E1.00664
G1 X150.228 Y55.708
G1 X127.062 Y32.542 E1.00664
G1 X126.529 Y32.542
G1 X149.694 Y55.708 E1.00664
G1 X149.161 Y55.708
G1 X125.996 Y32.542 E1.00664
G1 X125.463 Y32.542
G1 X148.628 Y55.708 E1.00664
G1 X148.095 Y55.708
G1 X124.929 Y32.542 E1.00664
G1 X124.396 Y32.542
G1 X147.561 Y55.708 E1.00664
G1 X147.028 Y55.708
G1 X123.863 Y32.542 E1.00664
G1 X123.33 Y32.542
G1 X146.495 Y55.708 E1.00664
G1 X145.962 Y55.708
G1 X122.796 Y32.542 E1.00664
G1 X122.263 Y32.542
G1 X145.428 Y55.708 E1.00664
G1 X144.895 Y55.708
G1 X121.73 Y32.542 E1.00664
G1 X121.197 Y32.542
G1 X144.362 Y55.708 E1.00664
G1 X143.829 Y55.708
G1 X120.663 Y32.542 E1.00664
G1 X120.13 Y32.542
G1 X143.295 Y55.708 E1.00664
G1 X142.762 Y55.708
G1 X119.597 Y32.542 E1.00664
G1 X119.064 Y32.542
G1 X128.491 Y41.97 E.40967
G1 X127.907 Y41.919
G1 X118.53 Y32.542 E.40746
G1 X117.997 Y32.542
G1 X127.443 Y41.988 E.41045
G1 X127.052 Y42.131
G1 X117.464 Y32.542 E.41666
G1 X116.931 Y32.542
G1 X126.717 Y42.329 E.42526
G1 X126.428 Y42.573
G1 X116.397 Y32.542 E.43589
G1 X115.864 Y32.542
G1 X126.184 Y42.863 E.44846
G1 X125.988 Y43.199
G1 X115.331 Y32.542 E.46309
G1 X114.798 Y32.542
G1 X125.848 Y43.592 E.48018
G1 X125.787 Y44.065
G1 X114.264 Y32.542 E.5007
G1 X113.731 Y32.542
G1 X125.861 Y44.673 E.52712
; WIPE_START
M204 S10000
G1 X124.447 Y43.258 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.152 Y43.631 Z3.4 F30000
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X142.229 Y55.708 E.52478
G1 X141.696 Y55.708
G1 X130.208 Y44.22 E.49921
G1 X130.139 Y44.684
G1 X141.162 Y55.708 E.47901
G1 X140.629 Y55.708
G1 X129.996 Y45.074 E.46207
G1 X129.797 Y45.409
G1 X140.096 Y55.708 E.44754
G1 X139.563 Y55.708
G1 X129.551 Y45.696 E.43505
G1 X129.261 Y45.939
G1 X139.029 Y55.708 E.4245
G1 X138.496 Y55.708
G1 X128.923 Y46.134 E.416
G1 X128.529 Y46.273
G1 X137.963 Y55.708 E.40996
G1 X137.43 Y55.708
G1 X128.057 Y46.335 E.4073
G1 X127.462 Y46.273
G1 X136.896 Y55.708 E.40998
G1 X136.363 Y55.708
G1 X113.198 Y32.542 E1.00664
G1 X112.665 Y32.542
G1 X135.83 Y55.708 E1.00664
G1 X135.297 Y55.708
G1 X112.131 Y32.542 E1.00664
G1 X111.598 Y32.542
G1 X134.763 Y55.708 E1.00664
G1 X134.23 Y55.708
G1 X111.065 Y32.542 E1.00664
G1 X110.532 Y32.542
G1 X133.697 Y55.708 E1.00664
G1 X133.163 Y55.708
G1 X109.998 Y32.542 E1.00664
G1 X109.465 Y32.542
G1 X132.63 Y55.708 E1.00664
G1 X132.097 Y55.708
G1 X108.932 Y32.542 E1.00664
G1 X108.398 Y32.542
G1 X131.564 Y55.708 E1.00664
G1 X131.03 Y55.708
G1 X107.865 Y32.542 E1.00664
G1 X107.332 Y32.542
G1 X130.497 Y55.708 E1.00664
G1 X129.964 Y55.708
G1 X106.799 Y32.542 E1.00664
G1 X106.265 Y32.542
G1 X129.431 Y55.708 E1.00664
G1 X128.897 Y55.708
G1 X105.732 Y32.542 E1.00664
G1 X105.199 Y32.542
G1 X128.364 Y55.708 E1.00664
G1 X127.831 Y55.708
G1 X104.666 Y32.542 E1.00664
G1 X104.132 Y32.542
G1 X127.298 Y55.708 E1.00664
G1 X126.764 Y55.708
G1 X103.599 Y32.542 E1.00664
G1 X103.066 Y32.542
G1 X126.231 Y55.708 E1.00664
G1 X125.698 Y55.708
G1 X102.533 Y32.542 E1.00664
G1 X101.999 Y32.542
G1 X125.165 Y55.708 E1.00664
G1 X124.631 Y55.708
G1 X101.466 Y32.542 E1.00664
G1 X100.933 Y32.542
G1 X124.098 Y55.708 E1.00664
G1 X123.565 Y55.708
G1 X100.4 Y32.542 E1.00664
G1 X99.866 Y32.542
G1 X123.032 Y55.708 E1.00664
G1 X122.498 Y55.708
G1 X99.333 Y32.542 E1.00664
G1 X98.8 Y32.542
G1 X121.965 Y55.708 E1.00664
G1 X121.432 Y55.708
G1 X98.267 Y32.542 E1.00664
G1 X97.733 Y32.542
G1 X120.899 Y55.708 E1.00664
G1 X120.365 Y55.708
G1 X97.2 Y32.542 E1.00664
G1 X96.667 Y32.542
G1 X119.832 Y55.708 E1.00664
G1 X119.299 Y55.708
G1 X96.134 Y32.542 E1.00664
G1 X95.6 Y32.542
G1 X118.766 Y55.708 E1.00664
G1 X118.232 Y55.708
G1 X95.067 Y32.542 E1.00664
G1 X94.534 Y32.542
G1 X117.699 Y55.708 E1.00664
G1 X117.166 Y55.708
G1 X94.001 Y32.542 E1.00664
G1 X93.467 Y32.542
G1 X116.633 Y55.708 E1.00664
G1 X116.099 Y55.708
G1 X92.934 Y32.542 E1.00664
G1 X92.401 Y32.542
G1 X115.566 Y55.708 E1.00664
G1 X115.033 Y55.708
G1 X91.867 Y32.542 E1.00664
G1 X91.334 Y32.542
G1 X114.499 Y55.708 E1.00664
G1 X113.966 Y55.708
G1 X90.801 Y32.542 E1.00664
G1 X90.268 Y32.542
G1 X113.433 Y55.708 E1.00664
G1 X112.9 Y55.708
G1 X89.734 Y32.542 E1.00664
G1 X89.201 Y32.542
G1 X112.366 Y55.708 E1.00664
G1 X111.833 Y55.708
G1 X88.668 Y32.542 E1.00664
G1 X88.135 Y32.542
G1 X111.3 Y55.708 E1.00664
G1 X110.767 Y55.708
G1 X87.601 Y32.542 E1.00664
G1 X87.068 Y32.542
G1 X110.233 Y55.708 E1.00664
G1 X109.7 Y55.708
G1 X86.535 Y32.542 E1.00664
G1 X86.002 Y32.542
G1 X109.167 Y55.708 E1.00664
G1 X108.634 Y55.708
G1 X85.468 Y32.542 E1.00664
G1 X84.935 Y32.542
G1 X108.1 Y55.708 E1.00664
G1 X107.567 Y55.708
G1 X90.006 Y38.146 E.76312
G1 X89.885 Y38.559
G1 X107.034 Y55.708 E.74519
G1 X106.501 Y55.708
G1 X89.618 Y38.825 E.73362
G1 X89.248 Y38.988
G1 X105.967 Y55.708 E.72655
G1 X105.434 Y55.708
G1 X89.817 Y40.09 E.67865
G1 X90.017 Y40.824
G1 X104.901 Y55.708 E.64677
G1 X104.368 Y55.708
G1 X90.016 Y41.356 E.62363
G1 X90.016 Y41.889
G1 X103.834 Y55.708 E.60048
G1 X103.301 Y55.708
G1 X89.976 Y42.383 E.57903
G1 X89.772 Y42.712
G1 X102.768 Y55.708 E.56473
G1 X102.235 Y55.708
G1 X89.437 Y42.91 E.55613
G1 X88.936 Y42.942
G1 X101.701 Y55.708 E.55472
G1 X101.168 Y55.708
G1 X88.402 Y42.942 E.55474
G1 X87.868 Y42.941
G1 X100.635 Y55.708 E.55476
G1 X100.102 Y55.708
G1 X87.335 Y42.941 E.55478
G1 X86.801 Y42.94
G1 X99.568 Y55.708 E.55479
G1 X99.035 Y55.708
G1 X86.001 Y42.673 E.5664
G1 X85.684 Y42.89
G1 X98.502 Y55.708 E.55699
G1 X97.969 Y55.708
G1 X85.203 Y42.942 E.55472
G1 X84.669 Y42.942
G1 X97.435 Y55.708 E.55474
M73 P92 R5
G1 X96.902 Y55.708
G1 X84.136 Y42.941 E.55475
G1 X83.602 Y42.941
G1 X96.369 Y55.708 E.55477
G1 X95.835 Y55.708
G1 X83.068 Y42.941 E.55479
; WIPE_START
M204 S10000
G1 X84.483 Y44.355 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.71 Y38 Z3.4 F30000
G1 X89.169 Y37.31 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X84.402 Y32.542 E.20716
G1 X83.869 Y32.542
G1 X88.636 Y37.31 E.20716
G1 X88.103 Y37.31
G1 X83.335 Y32.542 E.20716
G1 X82.802 Y32.542
G1 X87.569 Y37.31 E.20716
G1 X87.036 Y37.31
G1 X82.269 Y32.542 E.20715
G1 X81.736 Y32.542
G1 X86.548 Y37.354 E.20911
G1 X86.218 Y37.558
G1 X81.202 Y32.542 E.21795
G1 X80.669 Y32.542
G1 X85.436 Y37.31 E.20716
G1 X84.905 Y37.311
G1 X80.136 Y32.542 E.20724
G1 X79.603 Y32.542
G1 X84.373 Y37.313 E.20732
G1 X83.842 Y37.315
G1 X79.069 Y32.542 E.2074
G1 X78.536 Y32.542
G1 X83.311 Y37.317 E.20748
G1 X82.797 Y37.336
G1 X78.003 Y32.542 E.20831
G1 X77.47 Y32.542
G1 X82.453 Y37.526 E.21655
G1 X82.236 Y37.842
G1 X76.936 Y32.542 E.23031
G1 X76.403 Y32.542
G1 X82.184 Y38.324 E.25123
G1 X82.184 Y38.857
G1 X75.87 Y32.542 E.27439
G1 X75.337 Y32.542
G1 X82.184 Y39.39 E.29755
G1 X82.184 Y39.923
G1 X74.803 Y32.542 E.32071
G1 X74.27 Y32.542
G1 X82.183 Y40.456 E.34388
G1 X82.183 Y40.989
G1 X73.737 Y32.542 E.36704
G1 X73.203 Y32.542
G1 X82.183 Y41.522 E.3902
G1 X82.183 Y42.055
G1 X72.67 Y32.542 E.41336
G1 X72.137 Y32.542
G1 X95.302 Y55.708 E1.00664
G1 X94.769 Y55.708
G1 X71.604 Y32.542 E1.00664
G1 X71.07 Y32.542
G1 X94.236 Y55.708 E1.00664
G1 X93.702 Y55.708
G1 X70.537 Y32.542 E1.00664
G1 X70.004 Y32.542
G1 X93.169 Y55.708 E1.00664
G1 X92.636 Y55.708
G1 X69.471 Y32.542 E1.00664
G1 X68.937 Y32.542
G1 X92.103 Y55.708 E1.00664
G1 X91.569 Y55.708
G1 X68.404 Y32.542 E1.00664
G1 X67.871 Y32.542
G1 X91.036 Y55.708 E1.00664
G1 X90.503 Y55.708
G1 X67.338 Y32.542 E1.00664
G1 X66.804 Y32.542
G1 X89.97 Y55.708 E1.00664
G1 X89.436 Y55.708
G1 X66.271 Y32.542 E1.00664
G1 X65.738 Y32.542
G1 X88.903 Y55.708 E1.00664
G1 X88.37 Y55.708
G1 X65.205 Y32.542 E1.00664
G1 X64.671 Y32.542
G1 X87.837 Y55.708 E1.00664
G1 X87.303 Y55.708
G1 X64.138 Y32.542 E1.00664
G1 X63.605 Y32.542
G1 X86.77 Y55.708 E1.00664
G1 X86.237 Y55.708
G1 X63.072 Y32.542 E1.00664
G1 X62.538 Y32.542
G1 X85.704 Y55.708 E1.00664
G1 X85.17 Y55.708
G1 X62.005 Y32.542 E1.00664
G1 X61.472 Y32.542
G1 X84.637 Y55.708 E1.00664
G1 X84.104 Y55.708
G1 X60.939 Y32.542 E1.00664
G1 X60.405 Y32.542
G1 X83.571 Y55.708 E1.00664
G1 X83.037 Y55.708
G1 X59.872 Y32.542 E1.00664
G1 X59.339 Y32.542
G1 X82.504 Y55.708 E1.00664
G1 X81.971 Y55.708
G1 X58.806 Y32.542 E1.00664
G1 X58.272 Y32.542
G1 X81.438 Y55.708 E1.00664
G1 X80.904 Y55.708
G1 X57.739 Y32.542 E1.00664
G1 X57.206 Y32.542
G1 X80.371 Y55.708 E1.00664
G1 X79.838 Y55.708
G1 X56.673 Y32.542 E1.00664
G1 X56.139 Y32.542
G1 X79.304 Y55.708 E1.00664
G1 X78.771 Y55.708
G1 X55.606 Y32.542 E1.00664
G1 X55.073 Y32.542
G1 X78.238 Y55.708 E1.00664
G1 X77.705 Y55.708
G1 X54.539 Y32.542 E1.00664
G1 X54.006 Y32.542
G1 X77.171 Y55.708 E1.00664
G1 X76.638 Y55.708
G1 X53.473 Y32.542 E1.00664
G1 X52.94 Y32.542
G1 X76.105 Y55.708 E1.00664
G1 X75.572 Y55.708
G1 X52.406 Y32.542 E1.00664
G1 X51.873 Y32.542
G1 X75.038 Y55.708 E1.00664
G1 X74.505 Y55.708
G1 X51.34 Y32.542 E1.00664
G1 X50.807 Y32.542
G1 X73.972 Y55.708 E1.00664
G1 X73.439 Y55.708
G1 X50.273 Y32.542 E1.00664
G1 X49.74 Y32.542
G1 X72.905 Y55.708 E1.00664
G1 X72.372 Y55.708
G1 X49.207 Y32.542 E1.00664
G1 X48.674 Y32.542
G1 X71.839 Y55.708 E1.00664
G1 X71.306 Y55.708
G1 X48.14 Y32.542 E1.00664
G1 X47.607 Y32.542
G1 X70.772 Y55.708 E1.00664
G1 X70.239 Y55.708
G1 X47.074 Y32.542 E1.00664
G1 X46.541 Y32.542
G1 X69.706 Y55.708 E1.00664
G1 X69.173 Y55.708
G1 X46.007 Y32.542 E1.00664
G1 X45.474 Y32.542
G1 X68.639 Y55.708 E1.00664
G1 X68.106 Y55.708
G1 X44.941 Y32.542 E1.00664
M73 P92 R4
G1 X44.408 Y32.542
G1 X67.573 Y55.708 E1.00664
G1 X67.04 Y55.708
G1 X43.874 Y32.542 E1.00664
G1 X43.341 Y32.542
G1 X66.506 Y55.708 E1.00664
G1 X65.973 Y55.708
G1 X42.808 Y32.542 E1.00664
G1 X42.275 Y32.542
G1 X65.44 Y55.708 E1.00664
G1 X64.907 Y55.708
G1 X41.741 Y32.542 E1.00664
G1 X41.208 Y32.542
G1 X64.373 Y55.708 E1.00664
G1 X63.84 Y55.708
G1 X40.675 Y32.542 E1.00664
G1 X40.142 Y32.542
G1 X63.307 Y55.708 E1.00664
G1 X62.774 Y55.708
G1 X39.608 Y32.542 E1.00664
G1 X39.075 Y32.542
G1 X62.24 Y55.708 E1.00664
G1 X61.707 Y55.708
G1 X38.542 Y32.542 E1.00664
G1 X38.008 Y32.542
G1 X61.174 Y55.708 E1.00664
G1 X60.64 Y55.708
G1 X37.475 Y32.542 E1.00664
G1 X36.942 Y32.542
G1 X60.107 Y55.708 E1.00664
G1 X59.574 Y55.708
G1 X36.409 Y32.542 E1.00664
G1 X35.875 Y32.542
G1 X59.041 Y55.708 E1.00664
G1 X58.507 Y55.708
G1 X35.342 Y32.542 E1.00664
G1 X34.809 Y32.542
G1 X57.974 Y55.708 E1.00664
G1 X57.441 Y55.708
G1 X34.276 Y32.542 E1.00664
G1 X33.742 Y32.542
G1 X56.908 Y55.708 E1.00664
G1 X56.374 Y55.708
G1 X33.209 Y32.542 E1.00664
G1 X32.676 Y32.542
G1 X55.841 Y55.708 E1.00664
G1 X55.308 Y55.708
G1 X32.143 Y32.542 E1.00664
G1 X31.609 Y32.542
G1 X54.775 Y55.708 E1.00664
G1 X54.241 Y55.708
G1 X42.149 Y43.616 E.52546
G1 X42.208 Y44.207
G1 X53.708 Y55.708 E.49975
G1 X53.175 Y55.708
G1 X42.141 Y44.674 E.47946
G1 X41.999 Y45.065
G1 X52.642 Y55.708 E.46246
G1 X52.108 Y55.708
G1 X41.802 Y45.401 E.44787
G1 X41.557 Y45.69
G1 X51.583 Y55.715 E.43565
G1 X51.583 Y56.248
G1 X41.268 Y45.934 E.44821
G1 X40.932 Y46.131
G1 X51.583 Y56.782 E.46283
G1 X51.583 Y57.315
G1 X40.539 Y46.272 E.47988
G1 X40.07 Y46.335
G1 X51.583 Y57.848 E.5003
G1 X51.583 Y58.381
G1 X39.481 Y46.279 E.52589
; WIPE_START
M204 S10000
G1 X40.895 Y47.694 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X40.506 Y41.973 Z3.4 F30000
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X31.076 Y32.542 E.40979
G1 X30.543 Y32.542
G1 X39.919 Y41.919 E.40745
G1 X39.453 Y41.985
G1 X30.01 Y32.542 E.41035
G1 X29.476 Y32.542
G1 X39.061 Y42.127 E.41649
G1 X38.724 Y42.323
G1 X28.943 Y32.542 E.42503
G1 X28.417 Y32.55
G1 X38.434 Y42.567 E.43528
G1 X38.189 Y42.855
G1 X28.417 Y33.083 E.42462
G1 X28.417 Y33.616
G1 X37.991 Y43.19 E.41602
G1 X37.849 Y43.582
G1 X28.417 Y34.15 E.40986
G1 X28.417 Y34.683
G1 X37.786 Y44.051 E.40711
G1 X37.857 Y44.656
G1 X28.417 Y35.216 E.4102
G1 X28.417 Y35.749
G1 X51.583 Y58.915 E1.00664
G1 X51.583 Y59.448
G1 X28.417 Y36.283 E1.00664
G1 X28.417 Y36.816
G1 X51.583 Y59.981 E1.00664
G1 X51.583 Y60.514
G1 X28.417 Y37.349 E1.00664
G1 X28.417 Y37.882
G1 X51.583 Y61.048 E1.00664
G1 X51.583 Y61.581
G1 X28.417 Y38.416 E1.00664
G1 X28.417 Y38.949
G1 X51.583 Y62.114 E1.00664
G1 X51.583 Y62.647
G1 X28.417 Y39.482 E1.00664
G1 X28.417 Y40.015
G1 X51.583 Y63.181 E1.00664
G1 X51.583 Y63.714
G1 X28.417 Y40.549 E1.00664
G1 X28.417 Y41.082
G1 X51.583 Y64.247 E1.00664
G1 X51.583 Y64.781
G1 X28.417 Y41.615 E1.00664
G1 X28.417 Y42.149
G1 X51.583 Y65.314 E1.00664
G1 X51.583 Y65.847
G1 X28.417 Y42.682 E1.00664
G1 X28.417 Y43.215
G1 X51.583 Y66.38 E1.00664
G1 X51.583 Y66.914
G1 X28.417 Y43.748 E1.00664
G1 X28.417 Y44.282
G1 X51.583 Y67.447 E1.00664
G1 X51.583 Y67.98
G1 X28.417 Y44.815 E1.00664
G1 X28.417 Y45.348
G1 X51.583 Y68.513 E1.00664
G1 X51.583 Y69.047
G1 X28.417 Y45.881 E1.00664
G1 X28.417 Y46.415
G1 X51.583 Y69.58 E1.00664
G1 X51.583 Y70.113
G1 X28.417 Y46.948 E1.00664
G1 X28.417 Y47.481
G1 X51.583 Y70.646 E1.00664
G1 X51.583 Y71.18
G1 X28.417 Y48.014 E1.00664
G1 X28.417 Y48.548
G1 X51.583 Y71.713 E1.00664
G1 X51.583 Y72.246
G1 X28.417 Y49.081 E1.00664
G1 X28.417 Y49.614
G1 X51.583 Y72.779 E1.00664
G1 X51.583 Y73.313
G1 X28.417 Y50.147 E1.00664
G1 X28.417 Y50.681
G1 X51.583 Y73.846 E1.00664
G1 X51.583 Y74.379
G1 X28.417 Y51.214 E1.00664
G1 X28.417 Y51.747
G1 X51.583 Y74.912 E1.00664
G1 X51.583 Y75.446
G1 X28.417 Y52.28 E1.00664
G1 X28.417 Y52.814
G1 X51.583 Y75.979 E1.00664
G1 X51.583 Y76.512
G1 X28.417 Y53.347 E1.00664
G1 X28.417 Y53.88
G1 X51.583 Y77.045 E1.00664
G1 X51.583 Y77.579
G1 X28.417 Y54.413 E1.00664
G1 X28.417 Y54.947
G1 X51.583 Y78.112 E1.00664
G1 X51.583 Y78.645
G1 X28.417 Y55.48 E1.00664
G1 X28.417 Y56.013
G1 X51.583 Y79.178 E1.00664
G1 X51.583 Y79.712
G1 X28.417 Y56.546 E1.00664
G1 X28.417 Y57.08
G1 X51.583 Y80.245 E1.00664
G1 X51.583 Y80.778
G1 X28.417 Y57.613 E1.00664
M73 P93 R4
G1 X28.417 Y58.146
G1 X51.583 Y81.311 E1.00664
G1 X51.583 Y81.845
G1 X28.417 Y58.68 E1.00664
G1 X28.417 Y59.213
G1 X51.583 Y82.378 E1.00664
G1 X51.583 Y82.911
G1 X28.417 Y59.746 E1.00664
G1 X28.417 Y60.279
G1 X51.583 Y83.445 E1.00664
G1 X51.583 Y83.978
G1 X28.417 Y60.813 E1.00664
G1 X28.417 Y61.346
G1 X51.583 Y84.511 E1.00664
G1 X51.583 Y85.044
G1 X28.417 Y61.879 E1.00664
G1 X28.417 Y62.412
G1 X51.583 Y85.578 E1.00664
G1 X51.583 Y86.111
G1 X28.417 Y62.946 E1.00664
G1 X28.417 Y63.479
G1 X51.583 Y86.644 E1.00664
G1 X51.583 Y87.177
G1 X28.417 Y64.012 E1.00664
G1 X28.417 Y64.545
G1 X51.583 Y87.711 E1.00664
G1 X51.583 Y88.244
G1 X28.417 Y65.079 E1.00664
G1 X28.417 Y65.612
G1 X51.583 Y88.777 E1.00664
G1 X51.583 Y89.31
G1 X28.417 Y66.145 E1.00664
G1 X28.417 Y66.678
G1 X51.583 Y89.844 E1.00664
G1 X51.583 Y90.377
G1 X28.417 Y67.212 E1.00664
G1 X28.417 Y67.745
G1 X51.583 Y90.91 E1.00664
G1 X51.583 Y91.443
G1 X28.417 Y68.278 E1.00664
G1 X28.417 Y68.811
G1 X51.583 Y91.977 E1.00664
G1 X51.583 Y92.51
G1 X28.417 Y69.345 E1.00664
G1 X28.417 Y69.878
G1 X51.583 Y93.043 E1.00664
G1 X51.583 Y93.576
G1 X28.417 Y70.411 E1.00664
G1 X28.417 Y70.944
G1 X51.583 Y94.11 E1.00664
G1 X51.583 Y94.643
G1 X28.417 Y71.478 E1.00664
G1 X28.417 Y72.011
G1 X51.583 Y95.176 E1.00664
G1 X51.583 Y95.709
G1 X28.417 Y72.544 E1.00664
G1 X28.417 Y73.077
G1 X51.583 Y96.243 E1.00664
G1 X51.583 Y96.776
G1 X28.417 Y73.611 E1.00664
G1 X28.417 Y74.144
G1 X51.583 Y97.309 E1.00664
G1 X51.583 Y97.842
G1 X28.417 Y74.677 E1.00664
G1 X28.417 Y75.21
G1 X51.583 Y98.376 E1.00664
G1 X51.583 Y98.909
G1 X28.417 Y75.744 E1.00664
G1 X28.417 Y76.277
G1 X51.583 Y99.442 E1.00664
G1 X51.583 Y99.976
G1 X28.417 Y76.81 E1.00664
G1 X28.417 Y77.344
G1 X51.583 Y100.509 E1.00664
G1 X51.583 Y101.042
G1 X28.417 Y77.877 E1.00664
G1 X28.417 Y78.41
G1 X51.583 Y101.575 E1.00664
G1 X51.583 Y102.109
G1 X28.417 Y78.943 E1.00664
G1 X28.417 Y79.477
G1 X51.583 Y102.642 E1.00664
G1 X51.583 Y103.175
G1 X28.417 Y80.01 E1.00664
G1 X28.417 Y80.543
G1 X51.583 Y103.708 E1.00664
G1 X51.583 Y104.242
G1 X28.417 Y81.076 E1.00664
G1 X28.417 Y81.61
G1 X51.583 Y104.775 E1.00664
G1 X51.583 Y105.308
G1 X28.417 Y82.143 E1.00664
G1 X28.417 Y82.676
G1 X51.583 Y105.841 E1.00664
G1 X51.583 Y106.375
G1 X28.417 Y83.209 E1.00664
G1 X28.417 Y83.743
G1 X51.583 Y106.908 E1.00664
G1 X51.583 Y107.441
G1 X28.417 Y84.276 E1.00664
G1 X28.417 Y84.809
G1 X51.583 Y107.974 E1.00664
G1 X51.583 Y108.508
G1 X28.417 Y85.342 E1.00664
G1 X28.417 Y85.876
G1 X51.583 Y109.041 E1.00664
G1 X51.583 Y109.574
G1 X28.417 Y86.409 E1.00664
G1 X28.417 Y86.942
G1 X51.583 Y110.107 E1.00664
G1 X51.583 Y110.641
G1 X28.417 Y87.475 E1.00664
G1 X28.417 Y88.009
G1 X51.583 Y111.174 E1.00664
G1 X51.583 Y111.707
G1 X28.417 Y88.542 E1.00664
G1 X28.417 Y89.075
G1 X51.583 Y112.24 E1.00664
G1 X51.583 Y112.774
G1 X28.417 Y89.608 E1.00664
G1 X28.417 Y90.142
G1 X51.583 Y113.307 E1.00664
G1 X51.583 Y113.84
G1 X28.417 Y90.675 E1.00664
G1 X28.417 Y91.208
G1 X51.583 Y114.373 E1.00664
G1 X51.583 Y114.907
G1 X28.417 Y91.741 E1.00664
G1 X28.417 Y92.275
G1 X51.583 Y115.44 E1.00664
G1 X51.583 Y115.973
G1 X28.417 Y92.808 E1.00664
G1 X28.417 Y93.341
G1 X51.583 Y116.506 E1.00664
G1 X51.583 Y117.04
G1 X28.417 Y93.875 E1.00664
G1 X28.417 Y94.408
G1 X51.583 Y117.573 E1.00664
G1 X51.583 Y118.106
G1 X28.417 Y94.941 E1.00664
G1 X28.417 Y95.474
G1 X51.583 Y118.64 E1.00664
G1 X51.583 Y119.173
G1 X28.417 Y96.008 E1.00664
G1 X28.417 Y96.541
G1 X51.583 Y119.706 E1.00664
G1 X51.583 Y120.239
G1 X28.417 Y97.074 E1.00664
G1 X28.417 Y97.607
G1 X51.583 Y120.773 E1.00664
G1 X51.583 Y121.306
G1 X28.417 Y98.141 E1.00664
G1 X28.417 Y98.674
G1 X51.583 Y121.839 E1.00664
G1 X51.583 Y122.372
G1 X28.417 Y99.207 E1.00664
G1 X28.417 Y99.74
G1 X51.583 Y122.906 E1.00664
G1 X51.583 Y123.439
G1 X28.417 Y100.274 E1.00664
G1 X28.417 Y100.807
G1 X51.583 Y123.972 E1.00664
G1 X51.583 Y124.505
G1 X28.417 Y101.34 E1.00664
G1 X28.417 Y101.873
G1 X51.583 Y125.039 E1.00664
G1 X51.583 Y125.572
G1 X28.417 Y102.407 E1.00664
G1 X28.417 Y102.94
G1 X51.583 Y126.105 E1.00664
G1 X51.583 Y126.638
G1 X28.417 Y103.473 E1.00664
G1 X28.417 Y104.006
G1 X51.583 Y127.172 E1.00664
G1 X51.583 Y127.705
G1 X28.417 Y104.54 E1.00664
G1 X28.417 Y105.073
G1 X51.583 Y128.238 E1.00664
G1 X51.583 Y128.771
G1 X28.417 Y105.606 E1.00664
G1 X28.417 Y106.139
G1 X51.583 Y129.305 E1.00664
G1 X51.583 Y129.838
G1 X28.417 Y106.673 E1.00664
G1 X28.417 Y107.206
G1 X51.583 Y130.371 E1.00664
G1 X51.583 Y130.904
G1 X28.417 Y107.739 E1.00664
G1 X28.417 Y108.272
G1 X51.583 Y131.438 E1.00664
G1 X51.583 Y131.971
G1 X28.417 Y108.806 E1.00664
G1 X28.417 Y109.339
G1 X51.583 Y132.504 E1.00664
G1 X51.583 Y133.037
G1 X28.417 Y109.872 E1.00664
G1 X28.417 Y110.405
G1 X51.583 Y133.571 E1.00664
G1 X51.583 Y134.104
G1 X28.417 Y110.939 E1.00664
G1 X28.417 Y111.472
G1 X40.944 Y123.999 E.54436
G1 X40.207 Y123.795
G1 X28.417 Y112.005 E.51231
G1 X28.417 Y112.539
G1 X39.685 Y123.806 E.48964
G1 X39.264 Y123.918
G1 X28.417 Y113.072 E.47134
G1 X28.417 Y113.605
G1 X38.899 Y124.087 E.45547
G1 X38.584 Y124.305
G1 X28.417 Y114.138 E.4418
G1 X28.417 Y114.672
G1 X38.315 Y124.569 E.43008
G1 X38.09 Y124.878
G1 X28.417 Y115.205 E.42033
G1 X28.417 Y115.738
G1 X37.917 Y125.238 E.4128
G1 X37.808 Y125.662
G1 X28.417 Y116.271 E.40807
G1 X28.417 Y116.805
G1 X37.795 Y126.182 E.4075
G1 X37.977 Y126.898
G1 X28.417 Y117.338 E.41543
; WIPE_START
M204 S10000
G1 X29.832 Y118.752 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X36.609 Y122.261 Z3.4 F30000
G1 X41.995 Y125.05 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X51.583 Y134.637 E.41662
G1 X51.583 Y135.171
G1 X42.208 Y125.796 E.40739
G1 X42.19 Y126.311
G1 X51.583 Y135.704 E.40818
G1 X51.583 Y136.237
G1 X42.084 Y126.739 E.41275
G1 X41.918 Y127.106
G1 X51.583 Y136.77 E.41997
G1 X51.583 Y137.304
G1 X41.702 Y127.423 E.42937
G1 X41.432 Y127.687
G1 X51.583 Y137.837 E.44107
G1 X51.583 Y138.37
G1 X41.118 Y127.906 E.45472
G1 X40.755 Y128.075
G1 X51.583 Y138.903 E.47053
G1 X51.583 Y139.437
G1 X40.33 Y128.184 E.489
G1 X39.817 Y128.204
G1 X51.583 Y139.97 E.51129
G1 X51.583 Y140.503
G1 X39.092 Y128.012 E.54279
; WIPE_START
M204 S10000
G1 X40.506 Y129.426 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X34.989 Y124.152 Z3.4 F30000
G1 X28.417 Y117.871 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X51.583 Y141.036 E1.00664
G1 X51.583 Y141.57
G1 X28.417 Y118.404 E1.00664
G1 X28.417 Y118.938
G1 X51.583 Y142.103 E1.00664
G1 X51.583 Y142.636
G1 X28.417 Y119.471 E1.00664
G1 X28.417 Y120.004
G1 X51.583 Y143.169 E1.00664
G1 X51.583 Y143.703
G1 X28.417 Y120.537 E1.00664
G1 X28.417 Y121.071
G1 X51.583 Y144.236 E1.00664
G1 X51.583 Y144.769
G1 X28.417 Y121.604 E1.00664
G1 X28.417 Y122.137
G1 X51.583 Y145.302 E1.00664
G1 X51.583 Y145.836
G1 X28.417 Y122.67 E1.00664
G1 X28.417 Y123.204
G1 X51.583 Y146.369 E1.00664
G1 X51.583 Y146.902
M73 P93 R3
G1 X28.417 Y123.737 E1.00664
G1 X28.417 Y124.27
G1 X51.583 Y147.435 E1.00664
G1 X51.583 Y147.969
G1 X28.417 Y124.803 E1.00664
G1 X28.417 Y125.337
G1 X51.583 Y148.502 E1.00664
G1 X51.583 Y149.035
G1 X28.417 Y125.87 E1.00664
G1 X28.417 Y126.403
G1 X51.583 Y149.568 E1.00664
G1 X51.583 Y150.102
G1 X28.417 Y126.936 E1.00664
G1 X28.417 Y127.47
G1 X51.583 Y150.635 E1.00664
G1 X51.583 Y151.168
G1 X28.417 Y128.003 E1.00664
G1 X28.417 Y128.536
G1 X51.583 Y151.701 E1.00664
G1 X51.583 Y152.235
G1 X28.417 Y129.07 E1.00664
G1 X28.417 Y129.603
G1 X51.583 Y152.768 E1.00664
G1 X51.583 Y153.301
G1 X28.417 Y130.136 E1.00664
M73 P94 R3
G1 X28.417 Y130.669
G1 X51.583 Y153.835 E1.00664
G1 X51.583 Y154.368
G1 X28.417 Y131.203 E1.00664
G1 X28.417 Y131.736
G1 X51.583 Y154.901 E1.00664
G1 X51.583 Y155.434
G1 X28.417 Y132.269 E1.00664
G1 X28.417 Y132.802
G1 X51.583 Y155.968 E1.00664
G1 X51.583 Y156.501
G1 X28.417 Y133.336 E1.00664
G1 X28.417 Y133.869
G1 X51.583 Y157.034 E1.00664
G1 X51.583 Y157.567
G1 X28.417 Y134.402 E1.00664
G1 X28.417 Y134.935
G1 X51.583 Y158.101 E1.00664
G1 X51.583 Y158.634
G1 X28.417 Y135.469 E1.00664
G1 X28.417 Y136.002
G1 X51.583 Y159.167 E1.00664
G1 X51.583 Y159.7
G1 X28.417 Y136.535 E1.00664
G1 X28.417 Y137.068
G1 X51.583 Y160.234 E1.00664
G1 X51.583 Y160.767
G1 X28.417 Y137.602 E1.00664
G1 X28.417 Y138.135
G1 X51.583 Y161.3 E1.00664
G1 X51.583 Y161.833
G1 X28.417 Y138.668 E1.00664
G1 X28.417 Y139.201
G1 X51.583 Y162.367 E1.00664
G1 X51.583 Y162.9
G1 X28.417 Y139.735 E1.00664
G1 X28.417 Y140.268
G1 X51.583 Y163.433 E1.00664
G1 X51.583 Y163.966
G1 X28.417 Y140.801 E1.00664
G1 X28.417 Y141.334
G1 X51.583 Y164.5 E1.00664
G1 X51.583 Y165.033
G1 X28.417 Y141.868 E1.00664
G1 X28.417 Y142.401
G1 X51.583 Y165.566 E1.00664
G1 X51.583 Y166.099
G1 X28.417 Y142.934 E1.00664
G1 X28.417 Y143.467
G1 X51.583 Y166.633 E1.00664
G1 X51.583 Y167.166
G1 X28.417 Y144.001 E1.00664
G1 X28.417 Y144.534
G1 X51.583 Y167.699 E1.00664
G1 X51.583 Y168.232
G1 X28.417 Y145.067 E1.00664
G1 X28.417 Y145.6
G1 X51.583 Y168.766 E1.00664
G1 X51.583 Y169.299
G1 X28.417 Y146.134 E1.00664
G1 X28.417 Y146.667
G1 X51.583 Y169.832 E1.00664
G1 X51.583 Y170.366
G1 X28.417 Y147.2 E1.00664
G1 X28.417 Y147.734
G1 X51.583 Y170.899 E1.00664
G1 X51.583 Y171.432
G1 X28.417 Y148.267 E1.00664
G1 X28.417 Y148.8
G1 X51.583 Y171.965 E1.00664
G1 X51.583 Y172.499
G1 X28.417 Y149.333 E1.00664
G1 X28.417 Y149.867
G1 X51.583 Y173.032 E1.00664
G1 X51.583 Y173.565
G1 X28.417 Y150.4 E1.00664
G1 X28.417 Y150.933
G1 X51.583 Y174.098 E1.00664
G1 X51.583 Y174.632
G1 X28.417 Y151.466 E1.00664
G1 X28.417 Y152
G1 X51.583 Y175.165 E1.00664
G1 X51.583 Y175.698
G1 X28.417 Y152.533 E1.00664
G1 X28.417 Y153.066
G1 X51.583 Y176.231 E1.00664
G1 X51.583 Y176.765
G1 X28.417 Y153.599 E1.00664
G1 X28.417 Y154.133
G1 X51.583 Y177.298 E1.00664
G1 X51.583 Y177.831
G1 X28.417 Y154.666 E1.00664
G1 X28.417 Y155.199
G1 X51.583 Y178.364 E1.00664
G1 X51.583 Y178.898
G1 X28.417 Y155.732 E1.00664
G1 X28.417 Y156.266
G1 X51.583 Y179.431 E1.00664
G1 X51.583 Y179.964
G1 X28.417 Y156.799 E1.00664
G1 X28.417 Y157.332
G1 X51.583 Y180.497 E1.00664
G1 X51.583 Y181.031
G1 X28.417 Y157.865 E1.00664
G1 X28.417 Y158.399
G1 X51.583 Y181.564 E1.00664
G1 X51.583 Y182.097
G1 X28.417 Y158.932 E1.00664
G1 X28.417 Y159.465
G1 X51.583 Y182.63 E1.00664
G1 X51.583 Y183.164
G1 X28.417 Y159.998 E1.00664
G1 X28.417 Y160.532
G1 X51.583 Y183.697 E1.00664
G1 X51.583 Y184.23
G1 X28.417 Y161.065 E1.00664
G1 X28.417 Y161.598
G1 X51.583 Y184.763 E1.00664
G1 X51.583 Y185.297
G1 X28.417 Y162.131 E1.00664
G1 X28.417 Y162.665
G1 X51.583 Y185.83 E1.00664
G1 X51.583 Y186.363
G1 X28.417 Y163.198 E1.00664
G1 X28.417 Y163.731
G1 X51.583 Y186.896 E1.00664
G1 X51.583 Y187.43
G1 X28.417 Y164.264 E1.00664
G1 X28.417 Y164.798
G1 X51.583 Y187.963 E1.00664
G1 X51.583 Y188.496
G1 X28.417 Y165.331 E1.00664
G1 X28.417 Y165.864
G1 X51.583 Y189.03 E1.00664
G1 X51.583 Y189.563
G1 X28.417 Y166.398 E1.00664
G1 X28.417 Y166.931
G1 X51.583 Y190.096 E1.00664
G1 X51.583 Y190.629
G1 X28.417 Y167.464 E1.00664
G1 X28.417 Y167.997
G1 X51.583 Y191.163 E1.00664
G1 X51.583 Y191.696
G1 X28.417 Y168.531 E1.00664
G1 X28.417 Y169.064
G1 X51.583 Y192.229 E1.00664
G1 X51.583 Y192.762
G1 X28.417 Y169.597 E1.00664
G1 X28.417 Y170.13
G1 X51.583 Y193.296 E1.00664
G1 X51.583 Y193.829
G1 X28.417 Y170.664 E1.00664
G1 X28.417 Y171.197
G1 X51.583 Y194.362 E1.00664
G1 X51.583 Y194.895
G1 X28.417 Y171.73 E1.00664
G1 X28.417 Y172.263
G1 X51.583 Y195.429 E1.00664
G1 X51.583 Y195.962
G1 X28.417 Y172.797 E1.00664
; WIPE_START
M204 S10000
G1 X29.832 Y174.211 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X36.152 Y169.933 Z3.4 F30000
G1 X204.417 Y56.038 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X227.583 Y79.203 E1.00664
G1 X227.583 Y79.737
G1 X204.417 Y56.572 E1.00664
G1 X204.417 Y57.105
G1 X227.583 Y80.27 E1.00664
G1 X227.583 Y80.803
G1 X204.417 Y57.638 E1.00664
G1 X204.417 Y58.171
G1 X227.583 Y81.337 E1.00664
G1 X227.583 Y81.87
G1 X204.417 Y58.705 E1.00664
G1 X204.417 Y59.238
G1 X227.583 Y82.403 E1.00664
G1 X227.583 Y82.936
G1 X204.417 Y59.771 E1.00664
G1 X204.417 Y60.304
G1 X227.583 Y83.47 E1.00664
G1 X227.583 Y84.003
G1 X204.417 Y60.838 E1.00664
G1 X204.417 Y61.371
G1 X227.583 Y84.536 E1.00664
G1 X227.583 Y85.069
G1 X204.417 Y61.904 E1.00664
G1 X204.417 Y62.437
G1 X227.583 Y85.603 E1.00664
G1 X227.583 Y86.136
G1 X204.417 Y62.971 E1.00664
G1 X204.417 Y63.504
G1 X227.583 Y86.669 E1.00664
G1 X227.583 Y87.202
G1 X204.417 Y64.037 E1.00664
G1 X204.417 Y64.57
G1 X227.583 Y87.736 E1.00664
G1 X227.583 Y88.269
G1 X204.417 Y65.104 E1.00664
G1 X204.417 Y65.637
G1 X227.583 Y88.802 E1.00664
G1 X227.583 Y89.335
G1 X204.417 Y66.17 E1.00664
G1 X204.417 Y66.703
G1 X227.583 Y89.869 E1.00664
G1 X227.583 Y90.402
G1 X204.417 Y67.237 E1.00664
G1 X204.417 Y67.77
G1 X227.583 Y90.935 E1.00664
G1 X227.583 Y91.468
G1 X204.417 Y68.303 E1.00664
G1 X204.417 Y68.836
G1 X227.583 Y92.002 E1.00664
G1 X227.583 Y92.535
G1 X204.417 Y69.37 E1.00664
G1 X204.417 Y69.903
G1 X227.583 Y93.068 E1.00664
G1 X227.583 Y93.601
G1 X204.417 Y70.436 E1.00664
G1 X204.417 Y70.969
G1 X227.583 Y94.135 E1.00664
G1 X227.583 Y94.668
G1 X204.417 Y71.503 E1.00664
G1 X204.417 Y72.036
G1 X227.583 Y95.201 E1.00664
G1 X227.583 Y95.734
G1 X204.417 Y72.569 E1.00664
G1 X204.417 Y73.102
G1 X227.583 Y96.268 E1.00664
G1 X227.583 Y96.801
G1 X204.417 Y73.636 E1.00664
G1 X204.417 Y74.169
G1 X227.583 Y97.334 E1.00664
G1 X227.583 Y97.868
G1 X204.417 Y74.702 E1.00664
G1 X204.417 Y75.236
G1 X227.583 Y98.401 E1.00664
G1 X227.583 Y98.934
G1 X204.417 Y75.769 E1.00664
G1 X204.417 Y76.302
G1 X227.583 Y99.467 E1.00664
G1 X227.583 Y100.001
G1 X204.417 Y76.835 E1.00664
G1 X204.417 Y77.369
G1 X227.583 Y100.534 E1.00664
G1 X227.583 Y101.067
G1 X204.417 Y77.902 E1.00664
G1 X204.417 Y78.435
G1 X227.583 Y101.6 E1.00664
G1 X227.583 Y102.134
G1 X204.417 Y78.968 E1.00664
G1 X204.417 Y79.502
G1 X227.583 Y102.667 E1.00664
G1 X227.583 Y103.2
G1 X204.417 Y80.035 E1.00664
G1 X204.417 Y80.568
G1 X227.583 Y103.733 E1.00664
G1 X227.583 Y104.267
G1 X204.417 Y81.101 E1.00664
G1 X204.417 Y81.635
G1 X227.583 Y104.8 E1.00664
G1 X227.583 Y105.333
G1 X204.417 Y82.168 E1.00664
G1 X204.417 Y82.701
G1 X227.583 Y105.866 E1.00664
G1 X227.583 Y106.4
G1 X204.417 Y83.234 E1.00664
G1 X204.417 Y83.768
G1 X227.583 Y106.933 E1.00664
G1 X227.583 Y107.466
G1 X204.417 Y84.301 E1.00664
G1 X204.417 Y84.834
G1 X227.583 Y107.999 E1.00664
G1 X227.583 Y108.533
G1 X204.417 Y85.367 E1.00664
G1 X204.417 Y85.901
G1 X227.583 Y109.066 E1.00664
G1 X227.583 Y109.599
G1 X204.417 Y86.434 E1.00664
G1 X204.417 Y86.967
G1 X227.583 Y110.132 E1.00664
G1 X227.583 Y110.666
G1 X204.417 Y87.5 E1.00664
G1 X204.417 Y88.034
G1 X227.583 Y111.199 E1.00664
G1 X227.583 Y111.732
G1 X204.417 Y88.567 E1.00664
M73 P95 R3
G1 X204.417 Y89.1
G1 X227.583 Y112.265 E1.00664
G1 X227.583 Y112.799
G1 X204.417 Y89.633 E1.00664
G1 X204.417 Y90.167
G1 X227.583 Y113.332 E1.00664
G1 X227.583 Y113.865
G1 X204.417 Y90.7 E1.00664
G1 X204.417 Y91.233
G1 X227.583 Y114.398 E1.00664
G1 X227.583 Y114.932
G1 X204.417 Y91.767 E1.00664
G1 X204.417 Y92.3
G1 X227.583 Y115.465 E1.00664
G1 X227.583 Y115.998
G1 X204.417 Y92.833 E1.00664
G1 X204.417 Y93.366
G1 X227.583 Y116.532 E1.00664
G1 X227.583 Y117.065
G1 X204.417 Y93.9 E1.00664
G1 X204.417 Y94.433
G1 X227.583 Y117.598 E1.00664
G1 X227.583 Y118.131
G1 X204.417 Y94.966 E1.00664
G1 X204.417 Y95.499
G1 X227.583 Y118.665 E1.00664
G1 X227.583 Y119.198
G1 X204.417 Y96.033 E1.00664
G1 X204.417 Y96.566
G1 X227.583 Y119.731 E1.00664
G1 X227.583 Y120.264
G1 X204.417 Y97.099 E1.00664
G1 X204.417 Y97.632
G1 X227.583 Y120.798 E1.00664
G1 X227.583 Y121.331
G1 X204.417 Y98.166 E1.00664
G1 X204.417 Y98.699
G1 X227.583 Y121.864 E1.00664
G1 X227.583 Y122.397
G1 X204.417 Y99.232 E1.00664
G1 X204.417 Y99.765
G1 X227.583 Y122.931 E1.00664
G1 X227.583 Y123.464
G1 X204.417 Y100.299 E1.00664
G1 X204.417 Y100.832
G1 X227.583 Y123.997 E1.00664
G1 X227.583 Y124.53
G1 X204.417 Y101.365 E1.00664
G1 X204.417 Y101.898
G1 X227.583 Y125.064 E1.00664
G1 X227.583 Y125.597
G1 X204.417 Y102.432 E1.00664
G1 X204.417 Y102.965
G1 X227.583 Y126.13 E1.00664
G1 X227.583 Y126.663
G1 X204.417 Y103.498 E1.00664
G1 X204.417 Y104.031
G1 X227.583 Y127.197 E1.00664
G1 X227.583 Y127.73
G1 X204.417 Y104.565 E1.00664
G1 X204.417 Y105.098
G1 X227.583 Y128.263 E1.00664
G1 X227.583 Y128.796
G1 X204.417 Y105.631 E1.00664
G1 X204.417 Y106.164
G1 X227.583 Y129.33 E1.00664
G1 X227.583 Y129.863
G1 X204.417 Y106.698 E1.00664
G1 X204.417 Y107.231
G1 X227.583 Y130.396 E1.00664
G1 X227.583 Y130.929
G1 X204.417 Y107.764 E1.00664
G1 X204.417 Y108.297
G1 X227.583 Y131.463 E1.00664
G1 X227.583 Y131.996
G1 X204.417 Y108.831 E1.00664
G1 X204.417 Y109.364
G1 X227.583 Y132.529 E1.00664
G1 X227.583 Y133.063
G1 X204.417 Y109.897 E1.00664
G1 X204.417 Y110.431
G1 X227.583 Y133.596 E1.00664
G1 X227.583 Y134.129
G1 X204.417 Y110.964 E1.00664
G1 X204.417 Y111.497
G1 X216.903 Y123.983 E.54257
G1 X216.177 Y123.789
G1 X204.417 Y112.03 E.51099
G1 X204.417 Y112.564
G1 X215.666 Y123.812 E.48879
G1 X215.241 Y123.92
G1 X204.417 Y113.097 E.47034
G1 X204.417 Y113.63
G1 X214.876 Y124.089 E.45449
G1 X214.566 Y124.312
G1 X204.417 Y114.163 E.44101
G1 X204.417 Y114.697
G1 X214.303 Y124.583 E.4296
G1 X214.086 Y124.898
G1 X204.417 Y115.23 E.42015
G1 X204.417 Y115.763
G1 X213.918 Y125.264 E.41287
G1 X213.814 Y125.693
G1 X204.417 Y116.296 E.40832
G1 X204.417 Y116.83
G1 X213.8 Y126.212 E.40773
G1 X213.992 Y126.937
G1 X204.417 Y117.363 E.41606
; WIPE_START
M204 S10000
G1 X205.832 Y118.777 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X211.995 Y123.279 Z3.4 F30000
G1 X227.583 Y134.662 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X218.014 Y125.093 E.41582
G1 X218.208 Y125.821
G1 X227.583 Y135.196 E.40739
G1 X227.583 Y135.729
G1 X218.185 Y126.331 E.40836
G1 X218.077 Y126.756
G1 X227.583 Y136.262 E.41307
G1 X227.583 Y136.795
G1 X217.908 Y127.121 E.42041
G1 X217.69 Y127.436
G1 X227.583 Y137.329 E.42989
G1 X227.583 Y137.862
G1 X217.42 Y127.699 E.44162
G1 X217.103 Y127.916
G1 X227.583 Y138.395 E.45538
G1 X227.583 Y138.928
G1 X216.737 Y128.082 E.47131
M73 P95 R2
G1 X216.308 Y128.187
G1 X227.583 Y139.462 E.48992
G1 X227.583 Y139.995
G1 X215.791 Y128.203 E.51241
G1 X215.046 Y127.992
G1 X227.583 Y140.528 E.54477
G1 X227.583 Y141.061
G1 X204.417 Y117.896 E1.00664
G1 X204.417 Y118.429
G1 X227.583 Y141.595 E1.00664
G1 X227.583 Y142.128
G1 X204.417 Y118.963 E1.00664
G1 X204.417 Y119.496
G1 X227.583 Y142.661 E1.00664
G1 X227.583 Y143.194
G1 X204.417 Y120.029 E1.00664
G1 X204.417 Y120.562
G1 X227.583 Y143.728 E1.00664
G1 X227.583 Y144.261
G1 X204.417 Y121.096 E1.00664
G1 X204.417 Y121.629
G1 X227.583 Y144.794 E1.00664
G1 X227.583 Y145.327
G1 X204.417 Y122.162 E1.00664
G1 X204.417 Y122.695
G1 X227.583 Y145.861 E1.00664
G1 X227.583 Y146.394
G1 X204.417 Y123.229 E1.00664
G1 X204.417 Y123.762
G1 X227.583 Y146.927 E1.00664
G1 X227.583 Y147.46
G1 X204.417 Y124.295 E1.00664
G1 X204.417 Y124.828
G1 X227.583 Y147.994 E1.00664
G1 X227.583 Y148.527
G1 X204.417 Y125.362 E1.00664
G1 X204.417 Y125.895
G1 X227.583 Y149.06 E1.00664
G1 X227.583 Y149.593
G1 X204.417 Y126.428 E1.00664
G1 X204.417 Y126.962
G1 X227.583 Y150.127 E1.00664
G1 X227.583 Y150.66
G1 X204.417 Y127.495 E1.00664
G1 X204.417 Y128.028
G1 X227.583 Y151.193 E1.00664
G1 X227.583 Y151.727
G1 X204.417 Y128.561 E1.00664
G1 X204.417 Y129.095
G1 X227.583 Y152.26 E1.00664
G1 X227.583 Y152.793
G1 X204.417 Y129.628 E1.00664
G1 X204.417 Y130.161
G1 X227.583 Y153.326 E1.00664
G1 X227.583 Y153.86
G1 X204.417 Y130.694 E1.00664
G1 X204.417 Y131.228
G1 X227.583 Y154.393 E1.00664
G1 X227.583 Y154.926
G1 X204.417 Y131.761 E1.00664
G1 X204.417 Y132.294
G1 X227.583 Y155.459 E1.00664
G1 X227.583 Y155.993
G1 X204.417 Y132.827 E1.00664
G1 X204.417 Y133.361
G1 X227.583 Y156.526 E1.00664
G1 X227.583 Y157.059
G1 X204.417 Y133.894 E1.00664
G1 X204.417 Y134.427
G1 X227.583 Y157.592 E1.00664
G1 X227.583 Y158.126
G1 X204.417 Y134.96 E1.00664
G1 X204.417 Y135.494
G1 X227.583 Y158.659 E1.00664
G1 X227.583 Y159.192
G1 X204.417 Y136.027 E1.00664
G1 X204.417 Y136.56
G1 X227.583 Y159.725 E1.00664
G1 X227.583 Y160.259
G1 X204.417 Y137.093 E1.00664
G1 X204.417 Y137.627
G1 X227.583 Y160.792 E1.00664
G1 X227.583 Y161.325
G1 X204.417 Y138.16 E1.00664
G1 X204.417 Y138.693
G1 X227.583 Y161.858 E1.00664
G1 X227.583 Y162.392
G1 X204.417 Y139.226 E1.00664
G1 X204.417 Y139.76
G1 X227.583 Y162.925 E1.00664
G1 X227.583 Y163.458
G1 X204.417 Y140.293 E1.00664
G1 X204.417 Y140.826
G1 X227.583 Y163.991 E1.00664
G1 X227.583 Y164.525
G1 X204.417 Y141.359 E1.00664
G1 X204.417 Y141.893
G1 X227.583 Y165.058 E1.00664
G1 X227.583 Y165.591
G1 X204.417 Y142.426 E1.00664
G1 X204.417 Y142.959
G1 X227.583 Y166.124 E1.00664
G1 X227.583 Y166.658
G1 X204.417 Y143.492 E1.00664
G1 X204.417 Y144.026
G1 X227.583 Y167.191 E1.00664
G1 X227.583 Y167.724
G1 X204.417 Y144.559 E1.00664
G1 X204.417 Y145.092
G1 X227.583 Y168.258 E1.00664
G1 X227.583 Y168.791
G1 X204.417 Y145.626 E1.00664
G1 X204.417 Y146.159
G1 X227.583 Y169.324 E1.00664
G1 X227.583 Y169.857
G1 X204.417 Y146.692 E1.00664
G1 X204.417 Y147.225
G1 X227.583 Y170.391 E1.00664
G1 X227.583 Y170.924
G1 X204.417 Y147.759 E1.00664
G1 X204.417 Y148.292
G1 X227.583 Y171.457 E1.00664
G1 X227.583 Y171.99
G1 X204.417 Y148.825 E1.00664
G1 X204.417 Y149.358
G1 X227.583 Y172.524 E1.00664
G1 X227.583 Y173.057
G1 X204.417 Y149.892 E1.00664
G1 X204.417 Y150.425
G1 X227.583 Y173.59 E1.00664
G1 X227.583 Y174.123
G1 X204.417 Y150.958 E1.00664
G1 X204.417 Y151.491
G1 X227.583 Y174.657 E1.00664
G1 X227.583 Y175.19
G1 X204.417 Y152.025 E1.00664
G1 X204.417 Y152.558
G1 X227.583 Y175.723 E1.00664
G1 X227.583 Y176.256
G1 X204.417 Y153.091 E1.00664
G1 X204.417 Y153.624
G1 X227.583 Y176.79 E1.00664
G1 X227.583 Y177.323
G1 X204.417 Y154.158 E1.00664
G1 X204.417 Y154.691
G1 X227.583 Y177.856 E1.00664
G1 X227.583 Y178.389
G1 X204.417 Y155.224 E1.00664
G1 X204.417 Y155.757
G1 X227.583 Y178.923 E1.00664
G1 X227.583 Y179.456
G1 X204.417 Y156.291 E1.00664
G1 X204.417 Y156.824
G1 X227.583 Y179.989 E1.00664
G1 X227.583 Y180.522
G1 X204.417 Y157.357 E1.00664
G1 X204.417 Y157.89
G1 X227.583 Y181.056 E1.00664
G1 X227.583 Y181.589
G1 X204.417 Y158.424 E1.00664
G1 X204.417 Y158.957
G1 X227.583 Y182.122 E1.00664
G1 X227.583 Y182.655
G1 X204.417 Y159.49 E1.00664
G1 X204.417 Y160.023
G1 X227.583 Y183.189 E1.00664
G1 X227.583 Y183.722
G1 X204.417 Y160.557 E1.00664
G1 X204.417 Y161.09
G1 X227.583 Y184.255 E1.00664
G1 X227.583 Y184.788
G1 X204.417 Y161.623 E1.00664
G1 X204.417 Y162.157
G1 X227.583 Y185.322 E1.00664
M73 P96 R2
G1 X227.583 Y185.855
G1 X204.417 Y162.69 E1.00664
G1 X204.417 Y163.223
G1 X227.583 Y186.388 E1.00664
G1 X227.583 Y186.922
G1 X204.417 Y163.756 E1.00664
G1 X204.417 Y164.29
G1 X227.583 Y187.455 E1.00664
G1 X227.583 Y187.988
G1 X204.417 Y164.823 E1.00664
G1 X204.417 Y165.356
G1 X227.583 Y188.521 E1.00664
G1 X227.583 Y189.055
G1 X204.417 Y165.889 E1.00664
G1 X204.417 Y166.423
G1 X227.583 Y189.588 E1.00664
G1 X227.583 Y190.121
G1 X204.417 Y166.956 E1.00664
G1 X204.417 Y167.489
G1 X227.583 Y190.654 E1.00664
G1 X227.583 Y191.188
G1 X204.417 Y168.022 E1.00664
G1 X204.417 Y168.556
G1 X227.583 Y191.721 E1.00664
G1 X227.583 Y192.254
G1 X204.417 Y169.089 E1.00664
G1 X204.417 Y169.622
G1 X227.583 Y192.787 E1.00664
G1 X227.583 Y193.321
G1 X204.417 Y170.155 E1.00664
G1 X204.417 Y170.689
G1 X227.583 Y193.854 E1.00664
G1 X227.583 Y194.387
G1 X204.417 Y171.222 E1.00664
G1 X204.417 Y171.755
G1 X227.583 Y194.92 E1.00664
G1 X227.583 Y195.454
G1 X204.417 Y172.288 E1.00664
G1 X204.417 Y172.822
G1 X227.583 Y195.987 E1.00664
G1 X227.583 Y196.52
G1 X204.417 Y173.355 E1.00664
G1 X204.417 Y173.888
G1 X227.583 Y197.053 E1.00664
G1 X227.583 Y197.587
G1 X204.417 Y174.421 E1.00664
G1 X204.417 Y174.955
G1 X227.583 Y198.12 E1.00664
G1 X227.583 Y198.653
G1 X204.417 Y175.488 E1.00664
G1 X204.417 Y176.021
G1 X227.583 Y199.186 E1.00664
G1 X227.583 Y199.72
G1 X204.417 Y176.554 E1.00664
G1 X204.417 Y177.088
G1 X227.583 Y200.253 E1.00664
G1 X227.583 Y200.786
G1 X204.417 Y177.621 E1.00664
G1 X204.417 Y178.154
G1 X227.583 Y201.319 E1.00664
G1 X227.583 Y201.853
G1 X204.417 Y178.687 E1.00664
G1 X204.417 Y179.221
G1 X227.583 Y202.386 E1.00664
G1 X227.583 Y202.919
G1 X204.417 Y179.754 E1.00664
G1 X204.417 Y180.287
G1 X227.583 Y203.452 E1.00664
G1 X227.583 Y203.986
G1 X204.417 Y180.821 E1.00664
G1 X204.417 Y181.354
G1 X227.583 Y204.519 E1.00664
G1 X227.583 Y205.052
G1 X204.417 Y181.887 E1.00664
G1 X204.417 Y182.42
G1 X227.583 Y205.586 E1.00664
G1 X227.583 Y206.119
G1 X204.417 Y182.954 E1.00664
G1 X204.417 Y183.487
G1 X227.583 Y206.652 E1.00664
G1 X227.583 Y207.185
G1 X204.417 Y184.02 E1.00664
G1 X204.417 Y184.553
G1 X227.583 Y207.719 E1.00664
G1 X227.583 Y208.252
G1 X204.417 Y185.087 E1.00664
G1 X204.417 Y185.62
G1 X227.583 Y208.785 E1.00664
G1 X227.583 Y209.318
G1 X204.417 Y186.153 E1.00664
G1 X204.417 Y186.686
G1 X227.583 Y209.852 E1.00664
G1 X227.583 Y210.385
G1 X204.417 Y187.22 E1.00664
G1 X204.417 Y187.753
G1 X227.583 Y210.918 E1.00664
G1 X227.583 Y211.451
G1 X204.417 Y188.286 E1.00664
G1 X204.417 Y188.819
G1 X227.583 Y211.985 E1.00664
G1 X227.583 Y212.518
G1 X204.417 Y189.353 E1.00664
G1 X204.417 Y189.886
G1 X227.583 Y213.051 E1.00664
G1 X227.583 Y213.584
G1 X204.417 Y190.419 E1.00664
G1 X204.417 Y190.952
G1 X227.583 Y214.118 E1.00664
G1 X227.583 Y214.651
G1 X204.417 Y191.486 E1.00664
G1 X204.417 Y192.019
G1 X227.583 Y215.184 E1.00664
G1 X227.583 Y215.717
G1 X204.417 Y192.552 E1.00664
G1 X204.417 Y193.085
G1 X227.583 Y216.251 E1.00664
G1 X227.583 Y216.784
G1 X218.146 Y207.347 E.41009
G1 X218.208 Y207.942
G1 X227.583 Y217.317 E.40739
G1 X227.583 Y217.85
G1 X218.144 Y208.412 E.41016
G1 X218.004 Y208.805
G1 X227.583 Y218.384 E.41625
G1 X227.583 Y218.917
G1 X217.808 Y209.142 E.42476
G1 X217.565 Y209.433
G1 X227.583 Y219.45 E.43532
G1 X227.057 Y219.458
G1 X217.277 Y209.678 E.42497
G1 X216.943 Y209.877
G1 X226.524 Y219.458 E.41634
G1 X225.99 Y219.458
G1 X216.552 Y210.019 E.41014
G1 X216.085 Y210.085
G1 X225.457 Y219.458 E.40727
G1 X224.924 Y219.458
G1 X215.489 Y210.023 E.40999
; WIPE_START
M204 S10000
G1 X216.903 Y211.437 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X216.524 Y205.726 Z3.4 F30000
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X204.417 Y193.619 E.52611
G1 X204.417 Y194.152
G1 X215.934 Y205.668 E.50044
G1 X215.465 Y205.733
G1 X204.417 Y194.685 E.48007
G1 X204.417 Y195.218
G1 X215.071 Y205.872 E.46295
G1 X214.733 Y206.067
G1 X204.417 Y195.752 E.44825
G1 X204.417 Y196.285
G1 X214.441 Y206.309 E.43559
G1 X214.195 Y206.596
G1 X203.892 Y196.292 E.44772
G1 X203.358 Y196.292
G1 X213.995 Y206.929 E.46222
G1 X213.853 Y207.32
G1 X202.825 Y196.292 E.4792
G1 X202.292 Y196.292
G1 X213.785 Y207.786 E.49944
G1 X213.841 Y208.375
G1 X201.758 Y196.292 E.52505
G1 X201.225 Y196.292
G1 X224.39 Y219.458 E1.00664
G1 X223.857 Y219.458
G1 X200.692 Y196.292 E1.00664
G1 X200.159 Y196.292
G1 X223.324 Y219.458 E1.00664
G1 X222.791 Y219.458
G1 X199.625 Y196.292 E1.00664
G1 X199.092 Y196.292
G1 X222.257 Y219.458 E1.00664
G1 X221.724 Y219.458
G1 X198.559 Y196.292 E1.00664
G1 X198.026 Y196.292
G1 X221.191 Y219.458 E1.00664
G1 X220.658 Y219.458
G1 X197.492 Y196.292 E1.00664
G1 X196.959 Y196.292
G1 X220.124 Y219.458 E1.00664
G1 X219.591 Y219.458
G1 X196.426 Y196.292 E1.00664
G1 X195.893 Y196.292
G1 X219.058 Y219.458 E1.00664
G1 X218.525 Y219.458
G1 X195.359 Y196.292 E1.00664
G1 X194.826 Y196.292
G1 X217.991 Y219.458 E1.00664
G1 X217.458 Y219.458
G1 X194.293 Y196.292 E1.00664
G1 X193.76 Y196.292
G1 X216.925 Y219.458 E1.00664
G1 X216.392 Y219.458
G1 X193.226 Y196.292 E1.00664
G1 X192.693 Y196.292
G1 X215.858 Y219.458 E1.00664
G1 X215.325 Y219.458
G1 X192.16 Y196.292 E1.00664
G1 X191.627 Y196.292
G1 X214.792 Y219.458 E1.00664
G1 X214.259 Y219.458
G1 X191.093 Y196.292 E1.00664
G1 X190.56 Y196.292
G1 X213.725 Y219.458 E1.00664
G1 X213.192 Y219.458
G1 X190.027 Y196.292 E1.00664
G1 X189.494 Y196.292
G1 X212.659 Y219.458 E1.00664
G1 X212.126 Y219.458
G1 X188.96 Y196.292 E1.00664
G1 X188.427 Y196.292
G1 X211.592 Y219.458 E1.00664
G1 X211.059 Y219.458
G1 X187.894 Y196.292 E1.00664
G1 X187.361 Y196.292
G1 X210.526 Y219.458 E1.00664
G1 X209.993 Y219.458
G1 X186.827 Y196.292 E1.00664
G1 X186.294 Y196.292
G1 X209.459 Y219.458 E1.00664
G1 X208.926 Y219.458
G1 X185.761 Y196.292 E1.00664
G1 X185.228 Y196.292
G1 X208.393 Y219.458 E1.00664
G1 X207.859 Y219.458
G1 X184.694 Y196.292 E1.00664
G1 X184.161 Y196.292
G1 X207.326 Y219.458 E1.00664
G1 X206.793 Y219.458
G1 X183.628 Y196.292 E1.00664
G1 X183.094 Y196.292
G1 X206.26 Y219.458 E1.00664
G1 X205.726 Y219.458
G1 X182.561 Y196.292 E1.00664
G1 X182.028 Y196.292
G1 X205.193 Y219.458 E1.00664
G1 X204.66 Y219.458
G1 X181.495 Y196.292 E1.00664
G1 X180.961 Y196.292
G1 X204.127 Y219.458 E1.00664
G1 X203.593 Y219.458
G1 X180.428 Y196.292 E1.00664
G1 X179.895 Y196.292
G1 X203.06 Y219.458 E1.00664
G1 X202.527 Y219.458
G1 X179.362 Y196.292 E1.00664
G1 X178.828 Y196.292
G1 X201.994 Y219.458 E1.00664
G1 X201.46 Y219.458
G1 X178.295 Y196.292 E1.00664
G1 X177.762 Y196.292
G1 X200.927 Y219.458 E1.00664
G1 X200.394 Y219.458
G1 X177.229 Y196.292 E1.00664
G1 X176.695 Y196.292
G1 X199.861 Y219.458 E1.00664
G1 X199.327 Y219.458
G1 X176.162 Y196.292 E1.00664
G1 X175.629 Y196.292
G1 X198.794 Y219.458 E1.00664
G1 X198.261 Y219.458
G1 X175.096 Y196.292 E1.00664
G1 X174.562 Y196.292
G1 X197.728 Y219.458 E1.00664
G1 X197.194 Y219.458
G1 X174.029 Y196.292 E1.00664
G1 X173.496 Y196.292
G1 X196.661 Y219.458 E1.00664
G1 X196.128 Y219.458
G1 X172.963 Y196.292 E1.00664
G1 X172.429 Y196.292
G1 X195.595 Y219.458 E1.00664
G1 X195.061 Y219.458
G1 X171.896 Y196.292 E1.00664
G1 X171.363 Y196.292
G1 X194.528 Y219.458 E1.00664
G1 X193.995 Y219.458
G1 X170.83 Y196.292 E1.00664
G1 X170.296 Y196.292
G1 X193.462 Y219.458 E1.00664
G1 X192.928 Y219.458
G1 X169.763 Y196.292 E1.00664
G1 X169.23 Y196.292
G1 X192.395 Y219.458 E1.00664
G1 X191.862 Y219.458
G1 X168.697 Y196.292 E1.00664
G1 X168.163 Y196.292
G1 X191.329 Y219.458 E1.00664
G1 X190.795 Y219.458
G1 X167.63 Y196.292 E1.00664
G1 X167.097 Y196.292
G1 X190.262 Y219.458 E1.00664
G1 X189.729 Y219.458
G1 X166.564 Y196.292 E1.00664
G1 X166.03 Y196.292
G1 X189.195 Y219.458 E1.00664
M73 P96 R1
G1 X188.662 Y219.458
G1 X165.497 Y196.292 E1.00664
G1 X164.964 Y196.292
G1 X188.129 Y219.458 E1.00664
G1 X187.596 Y219.458
G1 X164.43 Y196.292 E1.00664
M73 P97 R1
G1 X163.897 Y196.292
G1 X187.062 Y219.458 E1.00664
G1 X186.529 Y219.458
G1 X163.364 Y196.292 E1.00664
G1 X162.831 Y196.292
G1 X185.996 Y219.458 E1.00664
G1 X185.463 Y219.458
G1 X162.297 Y196.292 E1.00664
G1 X161.764 Y196.292
G1 X184.929 Y219.458 E1.00664
G1 X184.396 Y219.458
G1 X161.231 Y196.292 E1.00664
G1 X160.698 Y196.292
G1 X183.863 Y219.458 E1.00664
G1 X183.33 Y219.458
G1 X160.164 Y196.292 E1.00664
G1 X159.631 Y196.292
G1 X182.796 Y219.458 E1.00664
G1 X182.263 Y219.458
G1 X159.098 Y196.292 E1.00664
G1 X158.565 Y196.292
G1 X181.73 Y219.458 E1.00664
G1 X181.197 Y219.458
G1 X158.031 Y196.292 E1.00664
G1 X157.498 Y196.292
G1 X180.663 Y219.458 E1.00664
G1 X180.13 Y219.458
G1 X156.965 Y196.292 E1.00664
G1 X156.432 Y196.292
G1 X179.597 Y219.458 E1.00664
G1 X179.064 Y219.458
G1 X155.898 Y196.292 E1.00664
G1 X155.365 Y196.292
G1 X178.53 Y219.458 E1.00664
G1 X177.997 Y219.458
G1 X154.832 Y196.292 E1.00664
G1 X154.299 Y196.292
G1 X177.464 Y219.458 E1.00664
G1 X176.931 Y219.458
G1 X153.765 Y196.292 E1.00664
G1 X153.232 Y196.292
G1 X176.397 Y219.458 E1.00664
G1 X175.864 Y219.458
G1 X152.699 Y196.292 E1.00664
G1 X152.166 Y196.292
G1 X175.331 Y219.458 E1.00664
G1 X174.798 Y219.458
G1 X151.632 Y196.292 E1.00664
G1 X151.099 Y196.292
G1 X174.264 Y219.458 E1.00664
G1 X173.731 Y219.458
G1 X150.566 Y196.292 E1.00664
G1 X150.033 Y196.292
G1 X173.198 Y219.458 E1.00664
G1 X172.665 Y219.458
G1 X149.499 Y196.292 E1.00664
G1 X148.966 Y196.292
G1 X172.131 Y219.458 E1.00664
G1 X171.598 Y219.458
G1 X148.433 Y196.292 E1.00664
G1 X147.899 Y196.292
G1 X171.065 Y219.458 E1.00664
G1 X170.531 Y219.458
G1 X147.366 Y196.292 E1.00664
G1 X146.833 Y196.292
G1 X169.998 Y219.458 E1.00664
G1 X169.465 Y219.458
G1 X146.3 Y196.292 E1.00664
G1 X145.766 Y196.292
G1 X168.932 Y219.458 E1.00664
G1 X168.398 Y219.458
G1 X145.233 Y196.292 E1.00664
G1 X144.7 Y196.292
G1 X167.865 Y219.458 E1.00664
G1 X167.332 Y219.458
G1 X144.167 Y196.292 E1.00664
G1 X143.633 Y196.292
G1 X166.799 Y219.458 E1.00664
G1 X166.265 Y219.458
G1 X143.1 Y196.292 E1.00664
G1 X142.567 Y196.292
G1 X165.732 Y219.458 E1.00664
G1 X165.199 Y219.458
G1 X142.034 Y196.292 E1.00664
G1 X141.5 Y196.292
G1 X164.666 Y219.458 E1.00664
G1 X164.132 Y219.458
G1 X140.967 Y196.292 E1.00664
G1 X140.434 Y196.292
G1 X163.599 Y219.458 E1.00664
G1 X163.066 Y219.458
G1 X139.901 Y196.292 E1.00664
G1 X139.367 Y196.292
G1 X162.533 Y219.458 E1.00664
G1 X161.999 Y219.458
G1 X138.834 Y196.292 E1.00664
G1 X138.301 Y196.292
G1 X161.466 Y219.458 E1.00664
G1 X160.933 Y219.458
G1 X137.768 Y196.292 E1.00664
G1 X137.234 Y196.292
G1 X160.4 Y219.458 E1.00664
G1 X159.866 Y219.458
G1 X136.701 Y196.292 E1.00664
G1 X136.168 Y196.292
G1 X159.333 Y219.458 E1.00664
G1 X158.8 Y219.458
G1 X135.635 Y196.292 E1.00664
G1 X135.101 Y196.292
G1 X158.267 Y219.458 E1.00664
G1 X157.733 Y219.458
G1 X134.568 Y196.292 E1.00664
G1 X134.035 Y196.292
G1 X157.2 Y219.458 E1.00664
G1 X156.667 Y219.458
G1 X133.502 Y196.292 E1.00664
G1 X132.968 Y196.292
G1 X156.134 Y219.458 E1.00664
G1 X155.6 Y219.458
G1 X132.435 Y196.292 E1.00664
G1 X131.902 Y196.292
G1 X155.067 Y219.458 E1.00664
G1 X154.534 Y219.458
G1 X131.369 Y196.292 E1.00664
G1 X130.835 Y196.292
G1 X154 Y219.458 E1.00664
G1 X153.467 Y219.458
G1 X130.302 Y196.292 E1.00664
G1 X129.769 Y196.292
G1 X152.934 Y219.458 E1.00664
G1 X152.401 Y219.458
G1 X129.235 Y196.292 E1.00664
G1 X128.702 Y196.292
G1 X151.867 Y219.458 E1.00664
G1 X151.334 Y219.458
G1 X128.169 Y196.292 E1.00664
G1 X127.636 Y196.292
G1 X150.801 Y219.458 E1.00664
G1 X150.268 Y219.458
G1 X127.102 Y196.292 E1.00664
G1 X126.569 Y196.292
G1 X149.734 Y219.458 E1.00664
G1 X149.201 Y219.458
G1 X126.036 Y196.292 E1.00664
G1 X125.503 Y196.292
G1 X148.668 Y219.458 E1.00664
G1 X148.135 Y219.458
G1 X124.969 Y196.292 E1.00664
G1 X124.436 Y196.292
G1 X147.601 Y219.458 E1.00664
G1 X147.068 Y219.458
G1 X123.903 Y196.292 E1.00664
G1 X123.37 Y196.292
G1 X146.535 Y219.458 E1.00664
G1 X146.002 Y219.458
G1 X122.836 Y196.292 E1.00664
G1 X122.303 Y196.292
G1 X145.468 Y219.458 E1.00664
G1 X144.935 Y219.458
G1 X121.77 Y196.292 E1.00664
G1 X121.237 Y196.292
G1 X144.402 Y219.458 E1.00664
G1 X143.869 Y219.458
G1 X120.703 Y196.292 E1.00664
G1 X120.17 Y196.292
G1 X143.335 Y219.458 E1.00664
G1 X142.802 Y219.458
G1 X119.637 Y196.292 E1.00664
G1 X119.104 Y196.292
G1 X128.54 Y205.728 E.41004
G1 X127.946 Y205.668
G1 X118.57 Y196.292 E.40742
G1 X118.037 Y196.292
G1 X127.475 Y205.73 E.41013
G1 X127.08 Y205.868
G1 X117.504 Y196.292 E.41612
G1 X116.971 Y196.292
G1 X126.74 Y206.062 E.42453
G1 X126.447 Y206.303
G1 X116.437 Y196.292 E.43499
G1 X115.904 Y196.292
G1 X126.199 Y206.588 E.44738
G1 X125.998 Y206.92
G1 X115.371 Y196.292 E.46182
G1 X114.838 Y196.292
G1 X125.856 Y207.311 E.47881
G1 X125.784 Y207.773
G1 X114.304 Y196.292 E.49887
G1 X113.771 Y196.292
G1 X125.848 Y208.369 E.52479
; WIPE_START
M204 S10000
G1 X124.434 Y206.955 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.142 Y207.331 Z3.4 F30000
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X142.269 Y219.458 E.52695
G1 X141.736 Y219.458
G1 X130.208 Y207.93 E.50094
G1 X130.146 Y208.401
G1 X141.202 Y219.458 E.48045
G1 X140.669 Y219.458
G1 X130.007 Y208.796 E.4633
G1 X129.813 Y209.135
G1 X140.136 Y219.458 E.44858
G1 X139.603 Y219.458
G1 X129.571 Y209.426 E.43591
G1 X129.285 Y209.673
G1 X139.069 Y219.458 E.42518
G1 X138.536 Y219.458
G1 X128.952 Y209.873 E.41649
G1 X128.563 Y210.018
G1 X138.003 Y219.458 E.41022
G1 X137.47 Y219.458
G1 X128.098 Y210.086 E.40725
G1 X127.505 Y210.026
G1 X136.936 Y219.458 E.40983
G1 X136.403 Y219.458
G1 X113.238 Y196.292 E1.00664
G1 X112.704 Y196.292
G1 X135.87 Y219.458 E1.00664
G1 X135.336 Y219.458
G1 X112.171 Y196.292 E1.00664
G1 X111.638 Y196.292
G1 X134.803 Y219.458 E1.00664
G1 X134.27 Y219.458
G1 X111.105 Y196.292 E1.00664
G1 X110.571 Y196.292
G1 X133.737 Y219.458 E1.00664
G1 X133.203 Y219.458
G1 X110.038 Y196.292 E1.00664
G1 X109.505 Y196.292
G1 X132.67 Y219.458 E1.00664
G1 X132.137 Y219.458
G1 X108.972 Y196.292 E1.00664
G1 X108.438 Y196.292
G1 X131.604 Y219.458 E1.00664
G1 X131.07 Y219.458
G1 X107.905 Y196.292 E1.00664
G1 X107.372 Y196.292
G1 X130.537 Y219.458 E1.00664
G1 X130.004 Y219.458
G1 X106.839 Y196.292 E1.00664
G1 X106.305 Y196.292
G1 X129.471 Y219.458 E1.00664
G1 X128.937 Y219.458
G1 X105.772 Y196.292 E1.00664
G1 X105.239 Y196.292
G1 X128.404 Y219.458 E1.00664
G1 X127.871 Y219.458
G1 X104.706 Y196.292 E1.00664
G1 X104.172 Y196.292
G1 X127.338 Y219.458 E1.00664
G1 X126.804 Y219.458
G1 X103.639 Y196.292 E1.00664
G1 X103.106 Y196.292
G1 X126.271 Y219.458 E1.00664
G1 X125.738 Y219.458
G1 X102.573 Y196.292 E1.00664
G1 X102.039 Y196.292
G1 X125.205 Y219.458 E1.00664
G1 X124.671 Y219.458
G1 X101.506 Y196.292 E1.00664
G1 X100.973 Y196.292
G1 X124.138 Y219.458 E1.00664
G1 X123.605 Y219.458
G1 X100.44 Y196.292 E1.00664
G1 X99.906 Y196.292
G1 X123.072 Y219.458 E1.00664
G1 X122.538 Y219.458
G1 X99.373 Y196.292 E1.00664
G1 X98.84 Y196.292
G1 X122.005 Y219.458 E1.00664
G1 X121.472 Y219.458
G1 X98.307 Y196.292 E1.00664
G1 X97.773 Y196.292
G1 X120.939 Y219.458 E1.00664
G1 X120.405 Y219.458
G1 X97.24 Y196.292 E1.00664
G1 X96.707 Y196.292
G1 X119.872 Y219.458 E1.00664
G1 X119.339 Y219.458
G1 X96.174 Y196.292 E1.00664
G1 X95.64 Y196.292
G1 X118.805 Y219.458 E1.00664
G1 X118.272 Y219.458
G1 X95.107 Y196.292 E1.00664
G1 X94.574 Y196.292
G1 X117.739 Y219.458 E1.00664
G1 X117.206 Y219.458
G1 X94.04 Y196.292 E1.00664
G1 X93.507 Y196.292
G1 X116.672 Y219.458 E1.00664
G1 X116.139 Y219.458
G1 X92.974 Y196.292 E1.00664
G1 X92.441 Y196.292
G1 X115.606 Y219.458 E1.00664
G1 X115.073 Y219.458
G1 X91.907 Y196.292 E1.00664
G1 X91.374 Y196.292
G1 X114.539 Y219.458 E1.00664
G1 X114.006 Y219.458
G1 X90.841 Y196.292 E1.00664
G1 X90.308 Y196.292
G1 X113.473 Y219.458 E1.00664
M73 P98 R1
G1 X112.94 Y219.458
G1 X89.774 Y196.292 E1.00664
G1 X89.241 Y196.292
G1 X112.406 Y219.458 E1.00664
G1 X111.873 Y219.458
G1 X88.708 Y196.292 E1.00664
G1 X88.175 Y196.292
G1 X111.34 Y219.458 E1.00664
G1 X110.807 Y219.458
G1 X87.641 Y196.292 E1.00664
G1 X87.108 Y196.292
G1 X110.273 Y219.458 E1.00664
G1 X109.74 Y219.458
G1 X86.575 Y196.292 E1.00664
G1 X86.042 Y196.292
G1 X109.207 Y219.458 E1.00664
G1 X108.674 Y219.458
G1 X85.508 Y196.292 E1.00664
G1 X84.975 Y196.292
G1 X108.14 Y219.458 E1.00664
G1 X107.607 Y219.458
G1 X84.442 Y196.292 E1.00664
G1 X83.909 Y196.292
G1 X107.074 Y219.458 E1.00664
G1 X106.541 Y219.458
G1 X83.375 Y196.292 E1.00664
G1 X82.842 Y196.292
G1 X106.007 Y219.458 E1.00664
G1 X105.474 Y219.458
G1 X82.309 Y196.292 E1.00664
G1 X81.776 Y196.292
G1 X104.941 Y219.458 E1.00664
G1 X104.408 Y219.458
G1 X81.242 Y196.292 E1.00664
G1 X80.709 Y196.292
G1 X103.874 Y219.458 E1.00664
G1 X103.341 Y219.458
G1 X80.176 Y196.292 E1.00664
G1 X79.643 Y196.292
G1 X102.808 Y219.458 E1.00664
G1 X102.275 Y219.458
G1 X79.109 Y196.292 E1.00664
G1 X78.576 Y196.292
G1 X101.741 Y219.458 E1.00664
G1 X101.208 Y219.458
G1 X78.043 Y196.292 E1.00664
G1 X77.509 Y196.292
G1 X100.675 Y219.458 E1.00664
G1 X100.141 Y219.458
G1 X76.976 Y196.292 E1.00664
G1 X76.443 Y196.292
G1 X99.608 Y219.458 E1.00664
G1 X99.075 Y219.458
G1 X75.91 Y196.292 E1.00664
G1 X75.376 Y196.292
G1 X98.542 Y219.458 E1.00664
G1 X98.008 Y219.458
G1 X74.843 Y196.292 E1.00664
G1 X74.31 Y196.292
G1 X97.475 Y219.458 E1.00664
G1 X96.942 Y219.458
G1 X73.777 Y196.292 E1.00664
G1 X73.243 Y196.292
G1 X96.409 Y219.458 E1.00664
G1 X95.875 Y219.458
G1 X72.71 Y196.292 E1.00664
G1 X72.177 Y196.292
G1 X95.342 Y219.458 E1.00664
G1 X94.809 Y219.458
G1 X71.644 Y196.292 E1.00664
G1 X71.11 Y196.292
G1 X94.276 Y219.458 E1.00664
G1 X93.742 Y219.458
G1 X70.577 Y196.292 E1.00664
G1 X70.044 Y196.292
G1 X93.209 Y219.458 E1.00664
G1 X92.676 Y219.458
G1 X69.511 Y196.292 E1.00664
G1 X68.977 Y196.292
G1 X92.143 Y219.458 E1.00664
G1 X91.609 Y219.458
G1 X68.444 Y196.292 E1.00664
G1 X67.911 Y196.292
G1 X91.076 Y219.458 E1.00664
G1 X90.543 Y219.458
G1 X67.378 Y196.292 E1.00664
G1 X66.844 Y196.292
G1 X90.01 Y219.458 E1.00664
G1 X89.476 Y219.458
G1 X66.311 Y196.292 E1.00664
G1 X65.778 Y196.292
G1 X88.943 Y219.458 E1.00664
G1 X88.41 Y219.458
G1 X65.245 Y196.292 E1.00664
G1 X64.711 Y196.292
G1 X87.877 Y219.458 E1.00664
G1 X87.343 Y219.458
G1 X64.178 Y196.292 E1.00664
G1 X63.645 Y196.292
G1 X86.81 Y219.458 E1.00664
G1 X86.277 Y219.458
G1 X63.112 Y196.292 E1.00664
G1 X62.578 Y196.292
G1 X85.744 Y219.458 E1.00664
G1 X85.21 Y219.458
G1 X62.045 Y196.292 E1.00664
G1 X61.512 Y196.292
G1 X84.677 Y219.458 E1.00664
G1 X84.144 Y219.458
G1 X60.979 Y196.292 E1.00664
G1 X60.445 Y196.292
G1 X83.61 Y219.458 E1.00664
G1 X83.077 Y219.458
G1 X59.912 Y196.292 E1.00664
G1 X59.379 Y196.292
G1 X82.544 Y219.458 E1.00664
G1 X82.011 Y219.458
G1 X58.845 Y196.292 E1.00664
G1 X58.312 Y196.292
G1 X81.477 Y219.458 E1.00664
G1 X80.944 Y219.458
G1 X57.779 Y196.292 E1.00664
G1 X57.246 Y196.292
G1 X80.411 Y219.458 E1.00664
G1 X79.878 Y219.458
G1 X56.712 Y196.292 E1.00664
G1 X56.179 Y196.292
G1 X79.344 Y219.458 E1.00664
G1 X78.811 Y219.458
G1 X55.646 Y196.292 E1.00664
G1 X55.113 Y196.292
G1 X78.278 Y219.458 E1.00664
G1 X77.745 Y219.458
G1 X54.579 Y196.292 E1.00664
G1 X54.046 Y196.292
G1 X77.211 Y219.458 E1.00664
G1 X76.678 Y219.458
G1 X53.513 Y196.292 E1.00664
G1 X52.98 Y196.292
G1 X76.145 Y219.458 E1.00664
G1 X75.612 Y219.458
G1 X52.446 Y196.292 E1.00664
M73 P98 R0
G1 X51.913 Y196.292
G1 X75.078 Y219.458 E1.00664
G1 X74.545 Y219.458
G1 X28.417 Y173.33 E2.00447
G1 X28.417 Y173.863
G1 X74.012 Y219.458 E1.9813
G1 X73.479 Y219.458
G1 X28.417 Y174.396 E1.95813
G1 X28.417 Y174.93
G1 X72.945 Y219.458 E1.93496
G1 X72.412 Y219.458
G1 X28.417 Y175.463 E1.91178
G1 X28.417 Y175.996
G1 X71.879 Y219.458 E1.88861
G1 X71.346 Y219.458
G1 X28.417 Y176.529 E1.86544
G1 X28.417 Y177.063
G1 X70.812 Y219.458 E1.84227
G1 X70.279 Y219.458
G1 X28.417 Y177.596 E1.81909
G1 X28.417 Y178.129
G1 X69.746 Y219.458 E1.79592
G1 X69.213 Y219.458
G1 X28.417 Y178.662 E1.77275
G1 X28.417 Y179.196
G1 X68.679 Y219.458 E1.74957
G1 X68.146 Y219.458
G1 X28.417 Y179.729 E1.7264
G1 X28.417 Y180.262
G1 X67.613 Y219.458 E1.70323
G1 X67.08 Y219.458
G1 X28.417 Y180.795 E1.68006
G1 X28.417 Y181.329
G1 X66.546 Y219.458 E1.65688
G1 X66.013 Y219.458
G1 X28.417 Y181.862 E1.63371
G1 X28.417 Y182.395
G1 X65.48 Y219.458 E1.61054
G1 X64.946 Y219.458
G1 X28.417 Y182.929 E1.58737
G1 X28.417 Y183.462
G1 X64.413 Y219.458 E1.56419
G1 X63.88 Y219.458
G1 X28.417 Y183.995 E1.54102
G1 X28.417 Y184.528
G1 X63.347 Y219.458 E1.51785
G1 X62.813 Y219.458
G1 X28.417 Y185.062 E1.49468
G1 X28.417 Y185.595
G1 X62.28 Y219.458 E1.4715
G1 X61.747 Y219.458
G1 X28.417 Y186.128 E1.44833
G1 X28.417 Y186.661
G1 X61.214 Y219.458 E1.42516
G1 X60.68 Y219.458
G1 X28.417 Y187.195 E1.40199
G1 X28.417 Y187.728
G1 X60.147 Y219.458 E1.37881
G1 X59.614 Y219.458
G1 X28.417 Y188.261 E1.35564
G1 X28.417 Y188.794
G1 X59.081 Y219.458 E1.33247
G1 X58.547 Y219.458
G1 X28.417 Y189.328 E1.30929
G1 X28.417 Y189.861
G1 X58.014 Y219.458 E1.28612
G1 X57.481 Y219.458
G1 X28.417 Y190.394 E1.26295
G1 X28.417 Y190.927
G1 X56.948 Y219.458 E1.23978
G1 X56.414 Y219.458
G1 X28.417 Y191.461 E1.2166
G1 X28.417 Y191.994
G1 X55.881 Y219.458 E1.19343
G1 X55.348 Y219.458
G1 X28.417 Y192.527 E1.17026
G1 X28.417 Y193.06
G1 X54.815 Y219.458 E1.14709
G1 X54.281 Y219.458
G1 X42.139 Y207.315 E.52763
G1 X42.208 Y207.917
G1 X53.748 Y219.458 E.50149
G1 X53.215 Y219.458
G1 X42.148 Y208.391 E.48091
G1 X42.011 Y208.787
G1 X52.682 Y219.458 E.46368
G1 X52.148 Y219.458
G1 X41.818 Y209.127 E.4489
G1 X41.578 Y209.42
G1 X51.615 Y219.458 E.43618
G1 X51.082 Y219.458
G1 X41.292 Y209.668 E.42539
G1 X40.961 Y209.87
G1 X50.549 Y219.458 E.41665
G1 X50.015 Y219.458
G1 X40.573 Y210.016 E.4103
G1 X40.112 Y210.088
G1 X49.482 Y219.458 E.40715
G1 X48.949 Y219.458
G1 X39.532 Y210.041 E.40918
; WIPE_START
M204 S10000
G1 X40.947 Y211.456 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X40.555 Y205.731 Z3.4 F30000
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X28.417 Y193.594 E.52743
G1 X28.417 Y194.127
G1 X39.958 Y205.668 E.5015
G1 X39.485 Y205.728
G1 X28.417 Y194.66 E.48095
G1 X28.417 Y195.193
G1 X39.088 Y205.864 E.4637
G1 X38.747 Y206.057
G1 X28.417 Y195.727 E.44889
G1 X28.417 Y196.26
G1 X38.453 Y206.296 E.43612
G1 X38.204 Y206.58
G1 X28.417 Y196.793 E.42528
G1 X28.417 Y197.326
M73 P99 R0
G1 X38.002 Y206.911 E.41649
G1 X37.859 Y207.302
G1 X28.417 Y197.86 E.4103
G1 X28.417 Y198.393
G1 X37.785 Y207.76 E.40706
G1 X37.843 Y208.352
G1 X28.417 Y198.926 E.40961
G1 X28.417 Y199.459
G1 X48.415 Y219.458 E.86902
G1 X47.882 Y219.458
G1 X28.417 Y199.993 E.84584
G1 X28.417 Y200.526
G1 X47.349 Y219.458 E.82267
G1 X46.816 Y219.458
G1 X28.417 Y201.059 E.7995
G1 X28.417 Y201.593
G1 X46.282 Y219.458 E.77632
G1 X45.749 Y219.458
G1 X28.417 Y202.126 E.75315
G1 X28.417 Y202.659
G1 X45.216 Y219.458 E.72998
G1 X44.683 Y219.458
G1 X28.417 Y203.192 E.70681
G1 X28.417 Y203.726
G1 X44.149 Y219.458 E.68363
G1 X43.616 Y219.458
G1 X28.417 Y204.259 E.66046
G1 X28.417 Y204.792
G1 X43.083 Y219.458 E.63729
G1 X42.55 Y219.458
G1 X28.417 Y205.325 E.61412
G1 X28.417 Y205.859
G1 X42.016 Y219.458 E.59094
G1 X41.483 Y219.458
G1 X28.417 Y206.392 E.56777
G1 X28.417 Y206.925
G1 X40.95 Y219.458 E.5446
G1 X40.417 Y219.458
G1 X28.417 Y207.458 E.52143
G1 X28.417 Y207.992
G1 X39.883 Y219.458 E.49825
G1 X39.35 Y219.458
G1 X28.417 Y208.525 E.47508
G1 X28.417 Y209.058
G1 X38.817 Y219.458 E.45191
G1 X38.284 Y219.458
G1 X28.417 Y209.591 E.42874
G1 X28.417 Y210.125
G1 X37.75 Y219.458 E.40556
G1 X37.217 Y219.458
G1 X28.417 Y210.658 E.38239
G1 X28.417 Y211.191
G1 X36.684 Y219.458 E.35922
G1 X36.151 Y219.458
G1 X28.417 Y211.724 E.33605
G1 X28.417 Y212.258
G1 X35.617 Y219.458 E.31287
G1 X35.084 Y219.458
G1 X28.417 Y212.791 E.2897
G1 X28.417 Y213.324
G1 X34.551 Y219.458 E.26653
G1 X34.018 Y219.458
G1 X28.417 Y213.857 E.24335
G1 X28.417 Y214.391
G1 X33.484 Y219.458 E.22018
G1 X32.951 Y219.458
G1 X28.417 Y214.924 E.19701
G1 X28.417 Y215.457
G1 X32.418 Y219.458 E.17384
G1 X31.885 Y219.458
G1 X28.417 Y215.99 E.15066
G1 X28.417 Y216.524
G1 X31.351 Y219.458 E.12749
G1 X30.818 Y219.458
G1 X28.417 Y217.057 E.10432
G1 X28.417 Y217.59
G1 X30.285 Y219.458 E.08115
G1 X29.751 Y219.458
G1 X28.417 Y218.124 E.05797
G1 X28.417 Y218.657
G1 X29.218 Y219.458 E.0348
; WIPE_START
M204 S10000
G1 X28.417 Y218.657 E-.43038
G1 X28.417 Y218.124 E-.20264
G1 X28.654 Y218.36 E-.12698
; WIPE_END
G1 E-.04 F1800
G1 X36.249 Y217.607 Z3.4 F30000
G1 X125.955 Y208.716 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.108895
G1 F15000
G3 X125.775 Y208.442 I2.651 J-1.937 E.00176
; WIPE_START
G1 X125.955 Y208.716 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.757 Y205.68 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.124117
G1 F15000
G1 X128.529 Y205.739 E.00156
; WIPE_START
G1 X128.757 Y205.68 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.136 Y207.337 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.183204
G1 F15000
G1 X130.17 Y207.198 E.00164
; LINE_WIDTH: 0.174234
G1 X130.116 Y207.117 E.00104
; LINE_WIDTH: 0.139811
G1 X130.062 Y207.037 E.00077
; LINE_WIDTH: 0.105387
G1 X130.008 Y206.956 E.00049
; WIPE_START
G1 X130.062 Y207.037 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.434 Y210.098 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.137996
G1 F15000
G1 X127.28 Y210.002 E.0014
; LINE_WIDTH: 0.111966
G1 X127.153 Y209.914 E.00087
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
G1 X215.278 Y210.007 E.0014
; LINE_WIDTH: 0.130727
G1 X215.204 Y209.955 E.00065
; LINE_WIDTH: 0.102355
G1 X215.13 Y209.904 E.00044
; WIPE_START
G1 X215.204 Y209.955 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X218.211 Y207.281 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.189185
G1 F15000
G1 X218.166 Y207.2 E.00111
; LINE_WIDTH: 0.158739
G1 X218.091 Y207.089 E.00126
; LINE_WIDTH: 0.111696
G1 X218.017 Y206.977 E.00075
; WIPE_START
G1 X218.091 Y207.089 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X213.793 Y208.594 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.115344
G1 F15000
G1 X213.853 Y208.363 E.00141
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
G1 X217.992 Y124.907 E.00192
; LINE_WIDTH: 0.167123
G1 X217.851 Y124.738 E.00223
; LINE_WIDTH: 0.113734
G1 X217.711 Y124.568 E.00127
G2 X217.39 Y124.251 I-55.974 J56.362 E.0026
; LINE_WIDTH: 0.134506
G1 X217.219 Y124.113 E.00164
; LINE_WIDTH: 0.181118
G1 X217.047 Y123.975 E.00248
; LINE_WIDTH: 0.206362
G1 X216.89 Y123.996 E.00211
; WIPE_START
G1 X217.047 Y123.975 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X215.85 Y123.73 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.094607
G1 F15000
G2 X215.692 Y123.808 I.672 J1.544 E.00074
; WIPE_START
G1 X215.85 Y123.73 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X214.038 Y124.974 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0952917
G1 F15000
G1 X213.993 Y125.032 E.00031
G1 X214.002 Y125.081 E.00021
G1 X213.734 Y125.773 F30000
; LINE_WIDTH: 0.0922778
G1 F15000
G1 X213.8 Y125.946 E.00075
; WIPE_START
G1 X213.734 Y125.773 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X214.984 Y128.054 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.202686
G1 F15000
G3 X214.857 Y127.965 I.838 J-1.336 E.00202
; LINE_WIDTH: 0.17251
G1 X214.69 Y127.823 E.00232
; LINE_WIDTH: 0.1302
G1 X214.522 Y127.68 E.00156
G3 X214.207 Y127.353 I44.293 J-42.964 E.00324
; LINE_WIDTH: 0.157562
G1 X214.068 Y127.176 E.0021
; LINE_WIDTH: 0.199963
G1 X213.929 Y127 E.00287
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
G1 X218.153 Y43.455 E.0013
; LINE_WIDTH: 0.136744
G1 X218.099 Y43.376 E.00073
; LINE_WIDTH: 0.104365
G1 X218.046 Y43.297 E.00048
; WIPE_START
G1 X218.099 Y43.376 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X215.372 Y46.326 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.18551
G1 F15000
G1 X215.272 Y46.27 E.00133
; LINE_WIDTH: 0.152608
G1 X215.165 Y46.196 E.00117
; LINE_WIDTH: 0.109647
G1 X215.057 Y46.121 E.00071
; WIPE_START
G1 X215.165 Y46.196 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X213.991 Y45.056 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.198907
G1 F15000
G1 X213.788 Y44.738 E.00479
; WIPE_START
G1 X213.991 Y45.056 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X216.836 Y42.07 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.185371
G1 F15000
G1 X216.609 Y41.936 E.00306
G1 X216.46 Y41.983 E.00181
; WIPE_START
G1 X216.609 Y41.936 E-.28304
G1 X216.836 Y42.07 E-.47696
; WIPE_END
G1 E-.04 F1800
G1 X209.205 Y42.202 Z3.4 F30000
G1 X130.218 Y43.566 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.177854
G1 F15000
G1 X130.157 Y43.453 E.00141
; LINE_WIDTH: 0.143634
G1 X130.097 Y43.364 E.00088
; LINE_WIDTH: 0.106661
G1 X130.037 Y43.275 E.00056
; WIPE_START
G1 X130.097 Y43.364 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.992 Y45.043 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.101123
G1 F15000
G1 X125.94 Y44.971 E.00042
; LINE_WIDTH: 0.137231
G3 X125.791 Y44.743 I2.162 J-1.588 E.00209
; WIPE_START
G1 X125.94 Y44.971 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X118.379 Y43.935 Z3.4 F30000
G1 X89.877 Y40.029 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.236372
G1 F15000
G1 X89.066 Y39.201 E.01828
; WIPE_START
G1 X89.877 Y40.029 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X86.721 Y43.021 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.099896
G1 F15000
G3 X86.503 Y42.882 I.94 J-1.719 E.0012
G1 X86.811 Y42.93 F30000
; LINE_WIDTH: 0.128575
G1 F15000
G1 X86.6 Y43.006 E.00156
; WIPE_START
G1 X86.811 Y42.93 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X85.639 Y37.246 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.095482
G1 F15000
G1 X85.423 Y37.323 E.00098
G1 X85.769 Y37.402 F30000
; LINE_WIDTH: 0.122201
G1 F15000
G2 X85.512 Y37.234 I-1.503 J2.022 E.00199
; WIPE_START
G1 X85.769 Y37.402 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X78.211 Y38.469 Z3.4 F30000
G1 X42.215 Y43.55 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.182916
G1 F15000
G1 X42.161 Y43.452 E.00128
; LINE_WIDTH: 0.150518
G1 X42.094 Y43.352 E.00105
; LINE_WIDTH: 0.108956
G1 X42.028 Y43.253 E.00064
; WIPE_START
G1 X42.094 Y43.352 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X37.98 Y45.019 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.122853
G1 F15000
G3 X37.786 Y44.727 I2.799 J-2.078 E.00228
; WIPE_START
G1 X37.98 Y45.019 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X38.164 Y52.649 Z3.4 F30000
G1 X39.874 Y123.729 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0885584
G1 F15000
G1 X39.729 Y123.795 E.00059
G1 X39.716 Y123.819 E.0001
; WIPE_START
G1 X39.729 Y123.795 E-.11265
G1 X39.874 Y123.729 E-.64735
; WIPE_END
G1 E-.04 F1800
G1 X39.03 Y128.074 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.193339
G1 F15000
G3 X38.862 Y127.958 I1.087 J-1.741 E.0025
; LINE_WIDTH: 0.154722
G1 X38.695 Y127.815 E.002
; LINE_WIDTH: 0.112475
G1 X38.527 Y127.673 E.00125
G3 X38.214 Y127.348 I55.329 J-53.593 E.00256
; LINE_WIDTH: 0.142213
G1 X38.063 Y127.156 E.00198
; LINE_WIDTH: 0.189844
G1 X37.912 Y126.964 E.00293
; WIPE_START
G1 X38.063 Y127.156 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X42.181 Y126.569 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0961021
G1 F15000
G3 X42.102 Y126.695 I-1.318 J-.733 E.00065
; WIPE_START
G1 X42.181 Y126.569 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X42.058 Y124.988 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.210139
G1 F15000
G1 X41.999 Y124.902 E.00141
; LINE_WIDTH: 0.184981
G1 X41.859 Y124.733 E.00255
; LINE_WIDTH: 0.131455
G1 X41.718 Y124.563 E.00159
G2 X41.395 Y124.244 I-44.205 J44.442 E.00328
; LINE_WIDTH: 0.150673
G1 X41.236 Y124.116 E.00179
; LINE_WIDTH: 0.192984
G1 X41.078 Y123.988 E.00249
G1 X41.036 Y123.992 E.00051
; LINE_WIDTH: 0.154534
G1 X40.936 Y124.008 E.00092
; WIPE_START
G1 X41.036 Y123.992 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X42.21 Y116.451 Z3.4 F30000
G1 X51.68 Y55.618 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0988147
G1 F15000
G1 X51.794 Y55.699 E.00064
G1 X51.775 Y55.726 E.00015
; WIPE_START
G1 X51.794 Y55.699 E-.14664
G1 X51.68 Y55.618 E-.61336
; WIPE_END
G1 E-.04 F1800
G1 X57.291 Y60.792 Z3.4 F30000
G1 X204.32 Y196.382 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0988505
G1 F15000
G1 X204.206 Y196.301 E.00064
G1 X204.225 Y196.274 E.00015
; WIPE_START
G1 X204.206 Y196.301 E-.14678
G1 X204.32 Y196.382 E-.61322
; WIPE_END
G1 E-.04 F1800
G1 X196.705 Y196.896 Z3.4 F30000
G1 X42.132 Y207.323 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.167533
G1 F15000
G2 X42.165 Y207.182 I-1.429 J-.417 E.00147
; LINE_WIDTH: 0.176588
G1 X42.11 Y207.1 E.00109
; LINE_WIDTH: 0.141223
G1 X42.054 Y207.017 E.0008
; LINE_WIDTH: 0.105858
G1 X41.999 Y206.934 E.00051
; WIPE_START
G1 X42.054 Y207.017 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X40.773 Y205.683 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.107052
G1 F15000
G1 X40.543 Y205.743 E.00124
G1 X40.208 Y205.673 F30000
; LINE_WIDTH: 0.100989
G1 F15000
G2 X40.034 Y205.591 I-.893 J1.67 E.00091
; WIPE_START
G1 X40.208 Y205.673 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X37.943 Y208.692 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.10152
G1 F15000
G3 X37.77 Y208.425 I2.449 J-1.778 E.00152
; WIPE_START
G1 X37.943 Y208.692 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X40.145 Y201.384 Z3.4 F30000
G1 X88.368 Y41.308 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
M204 S2000
G1 X85.857 Y38.797 E.1091
G1 X85.463 Y38.936
G1 X87.835 Y41.308 E.10306
G1 X87.301 Y41.308
G1 X84.936 Y38.942 E.10278
G1 X84.403 Y38.942
G1 X86.769 Y41.309 E.10283
G1 X86.366 Y41.439
G1 X83.87 Y38.942 E.10849
G1 X83.817 Y39.423
G1 X85.819 Y41.425 E.08697
G1 X85.168 Y41.308
G1 X83.817 Y39.957 E.0587
G1 X83.817 Y40.49
G1 X84.635 Y41.308 E.03553
; WIPE_START
M204 S10000
G1 X83.817 Y40.49 E-.4394
G1 X83.817 Y39.957 E-.20264
G1 X84.037 Y40.176 E-.11796
; WIPE_END
G1 E-.04 F1800
G1 X88.401 Y41.011 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.150012
G1 F15000
G1 X87.278 Y39.865 E.01401
; LINE_WIDTH: 0.184233
G1 X86.046 Y38.591 E.02041
; WIPE_START
G1 X87.278 Y39.865 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X86.165 Y41.654 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.229289
G1 F15000
G2 X85.882 Y41.361 I-1.204 J.878 E.00621
; WIPE_START
G1 X86.076 Y41.544 E-.49504
G1 X86.165 Y41.654 E-.26496
; WIPE_END
G1 E-.04 F1800
G1 X88.743 Y38.985 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.117894
G1 F15000
G1 X89.036 Y38.955 E.0018
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F15000
G1 X88.743 Y38.985 E-.76
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
