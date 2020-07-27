########################## TCL Event Handlers ##########################
#
#  dmu60_evo_tnc530.tcl -
#
#  Created by danilov  @  25 èþëÿ 2017 ã. 9:30:38 RTZ 2 (зима)
#  with Post Builder version  9.0.2.
#
########################################################################


  set cam_post_dir [MOM_ask_env_var UGII_CAM_POST_DIR]


  if { ![info exists mom_sys_post_initialized] } {

     if { ![info exists mom_sys_ugpost_base_initialized] } {
        source ${cam_post_dir}ugpost_base.tcl
        set mom_sys_ugpost_base_initialized 1
     }
 
 
     set mom_sys_debug_mode OFF
 
 
     if { ![info exists env(PB_SUPPRESS_UGPOST_DEBUG)] } {
        set env(PB_SUPPRESS_UGPOST_DEBUG) 0
     }
 
     if $env(PB_SUPPRESS_UGPOST_DEBUG) {
        set mom_sys_debug_mode OFF
     }
 
     if { ![string compare $mom_sys_debug_mode "OFF"] } {
 
        proc MOM_before_each_add_var {} {}
        proc MOM_before_each_event   {} {}
        proc MOM_before_load_address {} {}
        proc MOM_end_debug {} {}
 
     } else {
 
        set cam_debug_dir [MOM_ask_env_var UGII_CAM_DEBUG_DIR]
        source ${cam_debug_dir}mom_review.tcl
     }
 
     MOM_set_debug_mode $mom_sys_debug_mode


   ####  Listing File variables 
     set mom_sys_list_output                       "OFF"
     set mom_sys_header_output                     "OFF"
     set mom_sys_list_file_rows                    "40"
     set mom_sys_list_file_columns                 "30"
     set mom_sys_warning_output                    "OFF"
     set mom_sys_group_output                      "OFF"
     set mom_sys_list_file_suffix                  "lpt"
     set mom_sys_output_file_suffix                "H"
     set mom_sys_commentary_output                 "ON"
     set mom_sys_commentary_list                   "x y z 4axis 5axis feed speed"
     set mom_sys_pb_link_var_mode                  "OFF"
     set mom_sys_use_default_unit_fragment         "ON"
     set mom_sys_alt_unit_post_name                "dmu60_evo_tnc530__IN.pui"


   #=============================================================
   proc MOM_before_output { } {
   #=============================================================
   # This command is executed just before every NC block is
   # to be output to a file.
   #
   # - Never overload this command!
   # - Any customization should be done in PB_CMD_before_output!
   #

      if { [llength [info commands PB_CMD_kin_before_output]] &&\
           [llength [info commands PB_CMD_before_output]] } {

         PB_CMD_kin_before_output
      }

   ######### The following procedure invokes the listing file with warnings.

      global mom_sys_list_output
      if { [string match "ON" $mom_sys_list_output] } {
         LIST_FILE
      } else {
         global tape_bytes mom_o_buffer
         if { ![info exists tape_bytes] } {
            set tape_bytes [string length $mom_o_buffer]
         } else {
            incr tape_bytes [string length $mom_o_buffer]
         }
      }
   }


     if { [string match "OFF" [MOM_ask_env_var UGII_CAM_POST_LINK_VAR_MODE]] } {
        set mom_sys_link_var_mode                     "OFF"
     } else {
        set mom_sys_link_var_mode                     "$mom_sys_pb_link_var_mode"
     }


     set mom_sys_control_out                       ";"
     set mom_sys_control_in                        ""

     set mom_sys_post_initialized 1
  }


########## SYSTEM VARIABLE DECLARATIONS ##############
  set mom_sys_rapid_code                        "L"
  set mom_sys_linear_code                       "L"
  set mom_sys_tcpm_code                         "LN"
  set mom_sys_circle_code(CLW)                  "C"
  set mom_sys_circle_code(CCLW)                 "C"
  set mom_sys_circle_direction_code(CLW)        "DR-"
  set mom_sys_circle_direction_code(CCLW)       "DR+"
  set mom_sys_helix_code                        "CP"
  set mom_sys_delay_code(SECONDS)               "4"
  set mom_sys_delay_code(REVOLUTIONS)           "4"
  set mom_sys_cutcom_plane_code(XY)             "Z"
  set mom_sys_cutcom_plane_code(ZX)             "Y"
  set mom_sys_cutcom_plane_code(XZ)             "Y"
  set mom_sys_cutcom_plane_code(YZ)             "X"
  set mom_sys_cutcom_plane_code(ZY)             "X"
  set mom_sys_cutcom_code(OFF)                  "R0"
  set mom_sys_cutcom_code(LEFT)                 "RL"
  set mom_sys_cutcom_code(RIGHT)                "RR"
  set mom_sys_adjust_code                       "43"
  set mom_sys_adjust_code_minus                 "44"
  set mom_sys_adjust_cancel_code                "49"
  set mom_sys_unit_code(IN)                     "INCH"
  set mom_sys_unit_code(MM)                     "MM"
  set mom_sys_cycle_start_code                  "CYCL CALL POS"
  set mom_sys_cycle_off                         "80"
  set mom_sys_cycle_drill_code                  "CYCL CALL POS"
  set mom_sys_cycle_drill_csink_code            "CYCL CALL POS"
  set mom_sys_cycle_drill_dwell_code            "CYCL CALL POS"
  set mom_sys_cycle_drill_deep_code             "CYCL CALL POS"
  set mom_sys_cycle_drill_break_chip_code       "CYCL CALL POS"
  set mom_sys_cycle_tap_code                    "CYCL CALL POS"
  set mom_sys_cycle_bore_code                   "CYCL CALL POS"
  set mom_sys_cycle_bore_drag_code              "CYCL CALL POS"
  set mom_sys_cycle_bore_no_drag_code           "CYCL CALL POS"
  set mom_sys_cycle_bore_dwell_code             "CYCL CALL POS"
  set mom_sys_cycle_bore_manual_code            "CYCL CALL POS"
  set mom_sys_cycle_bore_back_code              "CYCL CALL POS"
  set mom_sys_cycle_bore_manual_dwell_code      "CYCL CALL POS"
  set mom_sys_output_code(ABSOLUTE)             "90"
  set mom_sys_output_code(INCREMENTAL)          "91"
  set mom_sys_cycle_ret_code(AUTO)              "98"
  set mom_sys_cycle_ret_code(MANUAL)            "99"
  set mom_sys_reset_code                        "92"
  set mom_sys_feed_rate_mode_code(IPM)          "94"
  set mom_sys_feed_rate_mode_code(IPR)          "95"
  set mom_sys_feed_rate_mode_code(FRN)          "93"
  set mom_sys_spindle_mode_code(SFM)            "96"
  set mom_sys_spindle_mode_code(RPM)            "97"
  set mom_sys_return_code                       "28"
  set mom_sys_feed_rate_mode_code(MMPM)         "94"
  set mom_sys_feed_rate_mode_code(MMPR)         "95"
  set mom_sys_program_stop_code                 "0"
  set mom_sys_optional_stop_code                "1"
  set mom_sys_end_of_program_code               "2"
  set mom_sys_spindle_direction_code(CLW)       "3"
  set mom_sys_spindle_direction_code(CCLW)      "4"
  set mom_sys_spindle_direction_code(OFF)       "5"
  set mom_sys_tool_change_code                  "6"
  set mom_sys_coolant_code(ON)                  "8"
  set mom_sys_coolant_code(FLOOD)               "8"
  set mom_sys_coolant_code(MIST)                "8"
  set mom_sys_coolant_code(THRU)                "7"
  set mom_sys_coolant_code(TAP)                 "27"
  set mom_sys_coolant_code(OFF)                 "9"
  set mom_sys_rewind_code                       "30"
  set mom_sys_4th_axis_has_limits               "1"
  set mom_sys_5th_axis_has_limits               "1"
  set mom_sys_sim_cycle_drill                   "1"
  set mom_sys_sim_cycle_drill_dwell             "1"
  set mom_sys_sim_cycle_drill_deep              "1"
  set mom_sys_sim_cycle_drill_break_chip        "1"
  set mom_sys_sim_cycle_tap                     "1"
  set mom_sys_sim_cycle_bore                    "1"
  set mom_sys_sim_cycle_bore_drag               "1"
  set mom_sys_sim_cycle_bore_nodrag             "1"
  set mom_sys_sim_cycle_bore_manual             "1"
  set mom_sys_sim_cycle_bore_dwell              "1"
  set mom_sys_sim_cycle_bore_manual_dwell       "1"
  set mom_sys_sim_cycle_bore_back               "1"
  set mom_sys_cir_vector                        "Vector - Absolute Arc Center"
  set mom_sys_spindle_ranges                    "0"
  set mom_sys_rewind_stop_code                  "\#"
  set mom_sys_home_pos(0)                       "-650"
  set mom_sys_home_pos(1)                       "-500"
  set mom_sys_home_pos(2)                       "-1"
  set mom_sys_zero                              "0"
  set mom_sys_opskip_block_leader               "/"
  set mom_sys_seqnum_start                      "1"
  set mom_sys_seqnum_incr                       "1"
  set mom_sys_seqnum_freq                       "1"
  set mom_sys_seqnum_max                        "9999"
  set mom_sys_lathe_x_double                    "1"
  set mom_sys_lathe_i_double                    "1"
  set mom_sys_lathe_y_double                    "1"
  set mom_sys_lathe_j_double                    "1"
  set mom_sys_lathe_x_factor                    "1"
  set mom_sys_lathe_y_factor                    "1"
  set mom_sys_lathe_z_factor                    "1"
  set mom_sys_lathe_i_factor                    "1"
  set mom_sys_lathe_j_factor                    "1"
  set mom_sys_lathe_k_factor                    "1"
  set mom_sys_leader(N)                         ""
  set mom_sys_leader(X)                         "X"
  set mom_sys_leader(Y)                         "Y"
  set mom_sys_leader(Z)                         "Z"
  set mom_sys_leader(fourth_axis)               "B"
  set mom_sys_leader(fifth_axis)                "C"
  set mom_sys_contour_feed_mode(LINEAR)         "MMPM"
  set mom_sys_rapid_feed_mode(LINEAR)           "MMPM"
  set mom_sys_cycle_feed_mode                   "MMPM"
  set mom_sys_feed_param(IPM,format)            "Feed_IPM"
  set mom_sys_feed_param(IPR,format)            "Feed_IPR"
  set mom_sys_feed_param(FRN,format)            "Feed_INV"
  set mom_sys_vnc_rapid_dogleg                  "1"
  set mom_sys_prev_mach_head                    ""
  set mom_sys_curr_mach_head                    ""
  set mom_sys_contour_feed_mode(ROTARY)         "MMPM"
  set mom_sys_contour_feed_mode(LINEAR_ROTARY)  "MMPM"
  set mom_sys_feed_param(DPM,format)            "Feed_DPM"
  set mom_sys_rapid_feed_mode(ROTARY)           "MMPM"
  set mom_sys_rapid_feed_mode(LINEAR_ROTARY)    "MMPM"
  set mom_sys_feed_param(MMPM,format)           "Feed_MMPM"
  set mom_sys_feed_param(MMPR,format)           "Feed_MMPR"
  set mom_sys_linearization_method              "angle"
  set mom_sys_post_description                  "DMU60 eVo linear with TNC530"
  set mom_sys_ugpadvkins_used                   "0"
  set mom_sys_post_builder_version              "9.0.2"

####### KINEMATIC VARIABLE DECLARATIONS ##############
  set mom_kin_4th_axis_ang_offset               "0.0"
  set mom_kin_4th_axis_center_offset(0)         "0.0"
  set mom_kin_4th_axis_center_offset(1)         "0.0"
  set mom_kin_4th_axis_center_offset(2)         "0.0"
  set mom_kin_4th_axis_direction                "MAGNITUDE_DETERMINES_DIRECTION"
  set mom_kin_4th_axis_incr_switch              "ON"
  set mom_kin_4th_axis_leader                   "B"
  set mom_kin_4th_axis_limit_action             "Retract / Re-Engage"
  set mom_kin_4th_axis_max_limit                "110"
  set mom_kin_4th_axis_min_incr                 "0.001"
  set mom_kin_4th_axis_min_limit                "-5"
  set mom_kin_4th_axis_plane                    "ZX"
  set mom_kin_4th_axis_point(0)                 "0.0"
  set mom_kin_4th_axis_point(1)                 "0.0"
  set mom_kin_4th_axis_point(2)                 "0.0"
  set mom_kin_4th_axis_rotation                 "standard"
  set mom_kin_4th_axis_type                     "Table"
  set mom_kin_4th_axis_vector(0)                "0"
  set mom_kin_4th_axis_vector(1)                "1"
  set mom_kin_4th_axis_vector(2)                "0"
  set mom_kin_4th_axis_zero                     "0.0"
  set mom_kin_5th_axis_ang_offset               "0.0"
  set mom_kin_5th_axis_center_offset(0)         "0.0"
  set mom_kin_5th_axis_center_offset(1)         "0.0"
  set mom_kin_5th_axis_center_offset(2)         "0.0"
  set mom_kin_5th_axis_direction                "MAGNITUDE_DETERMINES_DIRECTION"
  set mom_kin_5th_axis_incr_switch              "OFF"
  set mom_kin_5th_axis_leader                   "C"
  set mom_kin_5th_axis_limit_action             "Warning"
  set mom_kin_5th_axis_max_limit                "360"
  set mom_kin_5th_axis_min_incr                 "0.001"
  set mom_kin_5th_axis_min_limit                "0"
  set mom_kin_5th_axis_plane                    "XY"
  set mom_kin_5th_axis_point(0)                 "0.0"
  set mom_kin_5th_axis_point(1)                 "0.0"
  set mom_kin_5th_axis_point(2)                 "0.0"
  set mom_kin_5th_axis_rotation                 "standard"
  set mom_kin_5th_axis_type                     "Table"
  set mom_kin_5th_axis_vector(0)                "0"
  set mom_kin_5th_axis_vector(1)                "0"
  set mom_kin_5th_axis_vector(2)                "1"
  set mom_kin_5th_axis_zero                     "0.0"
  set mom_kin_arc_output_mode                   "FULL_CIRCLE"
  set mom_kin_arc_valid_plane                   "XYZ"
  set mom_kin_clamp_time                        "2.0"
  set mom_kin_cycle_plane_change_per_axis       "1"
  set mom_kin_cycle_plane_change_to_lower       "0"
  set mom_kin_flush_time                        "2.0"
  set mom_kin_linearization_flag                "1"
  set mom_kin_linearization_tol                 "0.01"
  set mom_kin_machine_resolution                "0.001"
  set mom_kin_machine_type                      "5_axis_dual_table"
  set mom_kin_machine_zero_offset(0)            "0.0"
  set mom_kin_machine_zero_offset(1)            "0.0"
  set mom_kin_machine_zero_offset(2)            "0.0"
  set mom_kin_max_arc_radius                    "99999.999"
  set mom_kin_max_dpm                           "39600"
  set mom_kin_max_fpm                           "15000"
  set mom_kin_max_fpr                           "1000"
  set mom_kin_max_frn                           "1000"
  set mom_kin_min_arc_length                    "0.01"
  set mom_kin_min_arc_radius                    "0.001"
  set mom_kin_min_dpm                           "0.0"
  set mom_kin_min_fpm                           "0.1"
  set mom_kin_min_fpr                           "0.1"
  set mom_kin_min_frn                           "0.01"
  set mom_kin_output_unit                       "MM"
  set mom_kin_pivot_gauge_offset                "0.0"
  set mom_kin_pivot_guage_offset                ""
  set mom_kin_post_data_unit                    "MM"
  set mom_kin_rapid_feed_rate                   "80000"
  set mom_kin_retract_distance                  "500"
  set mom_kin_rotary_axis_method                "PREVIOUS"
  set mom_kin_spindle_axis(0)                   "0.0"
  set mom_kin_spindle_axis(1)                   "0.0"
  set mom_kin_spindle_axis(2)                   "1.0"
  set mom_kin_tool_change_time                  "12.0"
  set mom_kin_x_axis_limit                      "650"
  set mom_kin_y_axis_limit                      "500"
  set mom_kin_z_axis_limit                      "500"




if [llength [info commands MOM_SYS_do_template] ] {
   if [llength [info commands MOM_do_template] ] {
      rename MOM_do_template ""
   }
   rename MOM_SYS_do_template MOM_do_template
}




#=============================================================
proc MOM_start_of_program { } {
#=============================================================
  global mom_logname mom_date is_from
  global mom_coolant_status mom_cutcom_status
  global mom_clamp_status mom_cycle_status
  global mom_spindle_status mom_cutcom_plane pb_start_of_program_flag
  global mom_cutcom_adjust_register mom_tool_adjust_register
  global mom_tool_length_adjust_register mom_length_comp_register
  global mom_flush_register mom_wire_cutcom_adjust_register
  global mom_wire_cutcom_status

    set pb_start_of_program_flag 0
    set mom_coolant_status UNDEFINED
    set mom_cutcom_status  UNDEFINED
    set mom_clamp_status   UNDEFINED
    set mom_cycle_status   UNDEFINED
    set mom_spindle_status UNDEFINED
    set mom_cutcom_plane   UNDEFINED
    set mom_wire_cutcom_status  UNDEFINED

    catch {unset mom_cutcom_adjust_register}
    catch {unset mom_tool_adjust_register}
    catch {unset mom_tool_length_adjust_register}
    catch {unset mom_length_comp_register}
    catch {unset mom_flush_register}
    catch {unset mom_wire_cutcom_adjust_register}

    set is_from ""

    catch { OPEN_files } ; #open warning and listing files
    LIST_FILE_HEADER ; #list header in commentary listing



  global mom_sys_post_initialized
  if { $mom_sys_post_initialized > 1 } { return }


   # Load parameters for alternate output units
    PB_load_alternate_unit_settings
    rename PB_load_alternate_unit_settings ""


#************
uplevel #0 {


#=============================================================
proc MOM_sync { } {
#=============================================================
  if [llength [info commands PB_CMD_kin_handle_sync_event] ] {
    PB_CMD_kin_handle_sync_event
  }
}


#=============================================================
proc MOM_set_csys { } {
#=============================================================
  if [llength [info commands PB_CMD_kin_set_csys] ] {
    PB_CMD_kin_set_csys
  }
}


#=============================================================
proc MOM_msys { } {
#=============================================================
}


#=============================================================
proc MOM_end_of_program { } {
#=============================================================
   PB_CMD_program_time
   PB_CMD_end_pgm

#**** The following procedure lists the tool list with time in commentary data
   LIST_FILE_TRAILER

#**** The following procedure closes the warning and listing files
   CLOSE_files

   if [llength [info commands PB_CMD_kin_end_of_program] ] {
      PB_CMD_kin_end_of_program
   }
}


  incr mom_sys_post_initialized


} ;# uplevel
#***********


}


#=============================================================
proc PB_init_new_iks { } {
#=============================================================
  global mom_kin_iks_usage mom_kin_spindle_axis
  global mom_kin_4th_axis_vector mom_kin_5th_axis_vector


   set mom_kin_iks_usage 1

  # Override spindle axis vector defined in PB_CMD_init_rotary
   set mom_kin_spindle_axis(0)  0.0
   set mom_kin_spindle_axis(1)  0.0
   set mom_kin_spindle_axis(2)  1.0

  # Unitize vectors
   foreach i { 0 1 2 } {
      set vec($i) $mom_kin_spindle_axis($i)
   }
   VEC3_unitize vec mom_kin_spindle_axis

   foreach i { 0 1 2 } {
      set vec($i) $mom_kin_4th_axis_vector($i)
   }
   VEC3_unitize vec mom_kin_4th_axis_vector

   foreach i { 0 1 2 } {
      set vec($i) $mom_kin_5th_axis_vector($i)
   }
   VEC3_unitize vec mom_kin_5th_axis_vector

  # Reload kinematics
   MOM_reload_kinematics
}


#=============================================================
proc PB_DELAY_TIME_SET { } {
#=============================================================
  global mom_sys_delay_param mom_delay_value
  global mom_delay_revs mom_delay_mode delay_time

  # Post Builder provided format for the current mode:
   if { [info exists mom_sys_delay_param(${mom_delay_mode},format)] != 0 } {
      MOM_set_address_format dwell $mom_sys_delay_param(${mom_delay_mode},format)
   }

   switch $mom_delay_mode {
      SECONDS { set delay_time $mom_delay_value }
      default { set delay_time $mom_delay_revs  }
   }
}


#=============================================================
proc MOM_before_motion { } {
#=============================================================
  global mom_motion_event mom_motion_type

   FEEDRATE_SET


   switch $mom_motion_type {
      ENGAGE   { PB_engage_move }
      APPROACH { PB_approach_move }
      FIRSTCUT { catch {PB_first_cut} }
      RETRACT  { PB_retract_move }
      RETURN   { catch {PB_return_move} }
      default  {}
   }

   if { [llength [info commands PB_CMD_kin_before_motion] ] } { PB_CMD_kin_before_motion }
   if { [llength [info commands PB_CMD_before_motion] ] }     { PB_CMD_before_motion }
}


#=============================================================
proc MOM_start_of_group { } {
#=============================================================
  global mom_sys_group_output mom_group_name group_level ptp_file_name
  global mom_sequence_number mom_sequence_increment mom_sequence_frequency
  global mom_sys_ptp_output pb_start_of_program_flag

   if { ![hiset group_level] } {
      set group_level 0
      return
   }

   if { [hiset mom_sys_group_output] } {
      if { ![string compare $mom_sys_group_output "OFF"] } {
         set group_level 0
         return
      }
   }

   if { [hiset group_level] } {
      incr group_level
   } else {
      set group_level 1
   }

   if { $group_level > 1 } {
      return
   }

   SEQNO_RESET ; #<4133654>
   MOM_reset_sequence $mom_sequence_number $mom_sequence_increment $mom_sequence_frequency

   if { [info exists ptp_file_name] } {
      MOM_close_output_file $ptp_file_name
      MOM_start_of_program
      if { ![string compare $mom_sys_ptp_output "ON"] } {
         MOM_open_output_file $ptp_file_name
      }
   } else {
      MOM_start_of_program
   }

   PB_start_of_program
   set pb_start_of_program_flag 1
}


#=============================================================
proc MOM_machine_mode { } {
#=============================================================
  global pb_start_of_program_flag
  global mom_operation_name mom_sys_change_mach_operation_name

   set mom_sys_change_mach_operation_name $mom_operation_name

   if { $pb_start_of_program_flag == 0 } {
      PB_start_of_program
      set pb_start_of_program_flag 1
   }

  # For simple mill-turn
   if { [llength [info commands PB_machine_mode] ] } {
      if { [catch {PB_machine_mode} res] } {
         CATCH_WARNING "$res"
      }
   }
}


#=============================================================
proc PB_FORCE { option args } {
#=============================================================
   set adds [join $args]
   if { [info exists option] && [llength $adds] } {
      lappend cmd MOM_force
      lappend cmd $option
      lappend cmd [join $adds]
      eval [join $cmd]
   }
}


#=============================================================
proc PB_SET_RAPID_MOD { mod_list blk_list ADDR NEW_MOD_LIST } {
#=============================================================
  upvar $ADDR addr
  upvar $NEW_MOD_LIST new_mod_list
  global mom_cycle_spindle_axis traverse_axis1 traverse_axis2


   set new_mod_list [list]

   foreach mod $mod_list {
      switch $mod {
         "rapid1" {
            set elem $addr($traverse_axis1)
            if { [lsearch $blk_list $elem] >= 0 } {
               lappend new_mod_list $elem
            }
         }
         "rapid2" {
            set elem $addr($traverse_axis2)
            if { [lsearch $blk_list $elem] >= 0 } {
               lappend new_mod_list $elem
            }
         }
         "rapid3" {
            set elem $addr($mom_cycle_spindle_axis)
            if { [lsearch $blk_list $elem] >= 0 } {
               lappend new_mod_list $elem
            }
         }
         default {
            set elem $mod
            if { [lsearch $blk_list $elem] >= 0 } {
               lappend new_mod_list $elem
            }
         }
      }
   }
}


########################
# Redefine FEEDRATE_SET
########################
if { [llength [info commands ugpost_FEEDRATE_SET] ] } {
   rename ugpost_FEEDRATE_SET ""
}

if { [llength [info commands FEEDRATE_SET] ] } {
   rename FEEDRATE_SET ugpost_FEEDRATE_SET
} else {
   proc ugpost_FEEDRATE_SET {} {}
}


#=============================================================
proc FEEDRATE_SET { } {
#=============================================================
   if { [llength [info commands PB_CMD_kin_feedrate_set] ] } {
      PB_CMD_kin_feedrate_set
   } else {
      ugpost_FEEDRATE_SET
   }
}


############## EVENT HANDLING SECTION ################


#=============================================================
proc MOM_auxfun { } {
#=============================================================
   MOM_do_template auxfun
}


#=============================================================
proc MOM_bore { } {
#=============================================================
  global cycle_name
  global cycle_init_flag

   set cycle_init_flag TRUE
   set cycle_name BORE
   CYCLE_SET
}


#=============================================================
proc MOM_bore_move { } {
#=============================================================
   global cycle_init_flag


   global mom_sys_abort_next_event
   if { [info exists mom_sys_abort_next_event] } {
      if { [llength [info commands PB_CMD_kin_abort_event]] } {
         PB_CMD_kin_abort_event
      }
   }


   PB_CMD_set_cycle_plane
   PB_CMD_CYCLE_fmax
   PB_CMD_TNC_CYCLE_map
   PB_CMD_TNC_CYCLE201
   MOM_do_template cycle_bore
   PB_CMD_cycle_time
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_bore_back { } {
#=============================================================
  global cycle_name
  global cycle_init_flag

   set cycle_init_flag TRUE
   set cycle_name BORE_BACK
   CYCLE_SET
}


#=============================================================
proc MOM_bore_back_move { } {
#=============================================================
   global cycle_init_flag


   global mom_sys_abort_next_event
   if { [info exists mom_sys_abort_next_event] } {
      if { [llength [info commands PB_CMD_kin_abort_event]] } {
         PB_CMD_kin_abort_event
      }
   }


   PB_CMD_set_cycle_plane
   PB_CMD_CYCLE_fmax
   PB_CMD_TNC_CYCLE_map
   PB_CMD_TNC_CYCLE202
   MOM_do_template cycle_bore_back
   PB_CMD_cycle_time
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_bore_drag { } {
#=============================================================
  global cycle_name
  global cycle_init_flag

   set cycle_init_flag TRUE
   set cycle_name BORE_DRAG
   CYCLE_SET
}


#=============================================================
proc MOM_bore_drag_move { } {
#=============================================================
   global cycle_init_flag


   global mom_sys_abort_next_event
   if { [info exists mom_sys_abort_next_event] } {
      if { [llength [info commands PB_CMD_kin_abort_event]] } {
         PB_CMD_kin_abort_event
      }
   }


   PB_CMD_set_cycle_plane
   PB_CMD_CYCLE_fmax
   PB_CMD_TNC_CYCLE_map
   PB_CMD_TNC_CYCLE202
   MOM_do_template cycle_bore_drag
   PB_CMD_cycle_time
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_bore_dwell { } {
#=============================================================
  global cycle_name
  global cycle_init_flag

   set cycle_init_flag TRUE
   set cycle_name BORE_DWELL
   CYCLE_SET
}


#=============================================================
proc MOM_bore_dwell_move { } {
#=============================================================
   global cycle_init_flag


   global mom_sys_abort_next_event
   if { [info exists mom_sys_abort_next_event] } {
      if { [llength [info commands PB_CMD_kin_abort_event]] } {
         PB_CMD_kin_abort_event
      }
   }


   PB_CMD_set_cycle_plane
   PB_CMD_CYCLE_fmax
   PB_CMD_TNC_CYCLE_map
   PB_CMD_TNC_CYCLE201
   MOM_do_template cycle_bore_dwell
   PB_CMD_cycle_time
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_bore_manual { } {
#=============================================================
  global cycle_name
  global cycle_init_flag

   set cycle_init_flag TRUE
   set cycle_name BORE_MANUAL
   CYCLE_SET
}


#=============================================================
proc MOM_bore_manual_move { } {
#=============================================================
   global cycle_init_flag


   global mom_sys_abort_next_event
   if { [info exists mom_sys_abort_next_event] } {
      if { [llength [info commands PB_CMD_kin_abort_event]] } {
         PB_CMD_kin_abort_event
      }
   }


   PB_CMD_set_cycle_plane
   PB_CMD_CYCLE_fmax
   PB_CMD_TNC_CYCLE_map
   PB_CMD_TNC_CYCLE202
   MOM_do_template cycle_bore_manual
   PB_CMD_cycle_time
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_bore_manual_dwell { } {
#=============================================================
  global cycle_name
  global cycle_init_flag

   set cycle_init_flag TRUE
   set cycle_name BORE_MANUAL_DWELL
   CYCLE_SET
}


#=============================================================
proc MOM_bore_manual_dwell_move { } {
#=============================================================
   global cycle_init_flag


   global mom_sys_abort_next_event
   if { [info exists mom_sys_abort_next_event] } {
      if { [llength [info commands PB_CMD_kin_abort_event]] } {
         PB_CMD_kin_abort_event
      }
   }


   PB_CMD_set_cycle_plane
   PB_CMD_CYCLE_fmax
   PB_CMD_TNC_CYCLE_map
   PB_CMD_TNC_CYCLE202
   MOM_do_template cycle_bore_manual_dwell
   PB_CMD_cycle_time
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_bore_no_drag { } {
#=============================================================
  global cycle_name
  global cycle_init_flag

   set cycle_init_flag TRUE
   set cycle_name BORE_NO_DRAG
   CYCLE_SET
}


#=============================================================
proc MOM_bore_no_drag_move { } {
#=============================================================
   global cycle_init_flag


   global mom_sys_abort_next_event
   if { [info exists mom_sys_abort_next_event] } {
      if { [llength [info commands PB_CMD_kin_abort_event]] } {
         PB_CMD_kin_abort_event
      }
   }


   PB_CMD_set_cycle_plane
   PB_CMD_CYCLE_fmax
   PB_CMD_TNC_CYCLE_map
   PB_CMD_TNC_CYCLE202
   MOM_do_template cycle_bore_no_drag
   PB_CMD_cycle_time
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_circular_move { } {
#=============================================================

   global mom_sys_abort_next_event
   if { [info exists mom_sys_abort_next_event] } {
      if { [llength [info commands PB_CMD_kin_abort_event]] } {
         PB_CMD_kin_abort_event
      }
   }


   CIRCLE_SET
   if { [PB_CMD__check_block_CC] } {
      MOM_do_template circle_center
   }
   if { [PB_CMD__check_block_CIRCULAR_move] } {
      MOM_do_template circular_move
   }
}


#=============================================================
proc MOM_clamp { } {
#=============================================================
   global mom_clamp_axis
   global mom_clamp_status
   global mom_clamp_text
   PB_CMD_MOM_clamp
}


#=============================================================
proc MOM_coolant_off { } {
#=============================================================
   COOLANT_SET
   MOM_do_template coolant_on_off
}


#=============================================================
proc MOM_coolant_on { } {
#=============================================================
   COOLANT_SET
   MOM_do_template coolant_on
}


#=============================================================
proc MOM_cutcom_on { } {
#=============================================================
  global mom_cutcom_status

   if { [string compare $mom_cutcom_status "SAME"] } { MOM_cutcom_off }
   CUTCOM_SET

   global mom_cutcom_adjust_register
   set cutcom_register_min 1
   set cutcom_register_max 99
   if { [info exists mom_cutcom_adjust_register] } {
      if { $mom_cutcom_adjust_register < $cutcom_register_min ||\
           $mom_cutcom_adjust_register > $cutcom_register_max } {
         CATCH_WARNING "CUTCOM register $mom_cutcom_adjust_register must be within the range between 1 and 99"
      }
   }
   PB_CMD_cutcom_force
}


#=============================================================
proc MOM_cutcom_off { } {
#=============================================================
   CUTCOM_SET
   PB_CMD_cutcom_force
}


#=============================================================
proc MOM_cycle_off { } {
#=============================================================
   PB_CMD_TNC_cycle_off
}


#=============================================================
proc MOM_cycle_plane_change { } {
#=============================================================
  global cycle_init_flag
  global mom_cycle_tool_axis_change
  global mom_cycle_clearance_plane_change

   set cycle_init_flag TRUE
   PB_CMD_CYCLE_plane_change
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_delay { } {
#=============================================================
   PB_DELAY_TIME_SET
   PB_CMD_cycle_09_dwell
}


#=============================================================
proc MOM_drill { } {
#=============================================================
  global cycle_name
  global cycle_init_flag

   set cycle_init_flag TRUE
   set cycle_name DRILL
   CYCLE_SET
}


#=============================================================
proc MOM_drill_move { } {
#=============================================================
   global cycle_init_flag


   global mom_sys_abort_next_event
   if { [info exists mom_sys_abort_next_event] } {
      if { [llength [info commands PB_CMD_kin_abort_event]] } {
         PB_CMD_kin_abort_event
      }
   }


   PB_CMD_set_cycle_plane
   PB_CMD_TNC_CYCLE_map
   PB_CMD_set_cycle_pos_list
   PB_CMD_CYCLE_fmax
   PB_CMD_TNC_CYCLE200
   MOM_do_template cycle_drill
   PB_CMD_cycle_time
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_drill_boss_milling { } {
#=============================================================
  global cycle_name
  global cycle_init_flag

   set cycle_init_flag TRUE
   set cycle_name DRILL_BOSS_MILLING
   CYCLE_SET
}


#=============================================================
proc MOM_drill_boss_milling_move { } {
#=============================================================
  global cycle_init_flag


   global mom_sys_abort_next_event
   if { [info exists mom_sys_abort_next_event] } {
      if { [llength [info commands PB_CMD_kin_abort_event]] } {
         PB_CMD_kin_abort_event
      }
   }


   global mom_hm_diameter
   global mom_hm_start_diameter
   global mom_hm_peck
   global mom_hm_side_allowance
   global mom_hm_cut_typh
   global mom_hm_overstep


   PB_CMD_set_cycle_plane
   PB_CMD_CYCLE_fmax
   PB_CMD_TNC_CYCLE_map
   PB_CMD_TNC_CYCLE257
   MOM_do_template boss_milling
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_drill_boss_thread_milling { } {
#=============================================================
  global cycle_name
  global cycle_init_flag

   set cycle_init_flag TRUE
   set cycle_name DRILL_BOSS_THREAD_MILLING
   CYCLE_SET
}


#=============================================================
proc MOM_drill_boss_thread_milling_move { } {
#=============================================================
  global cycle_init_flag


   global mom_sys_abort_next_event
   if { [info exists mom_sys_abort_next_event] } {
      if { [llength [info commands PB_CMD_kin_abort_event]] } {
         PB_CMD_kin_abort_event
      }
   }


   global mom_thr_diameter
   global mom_thr_dir
   global mom_thr_pitch
   global mom_thr_mach_dir
   global mom_thr_npitch


   PB_CMD_set_cycle_plane
   PB_CMD_CYCLE_fmax
   PB_CMD_TNC_CYCLE_map
   PB_CMD_TNC_CYCLE267
   MOM_do_template boss_thread_milling
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_drill_break_chip { } {
#=============================================================
  global cycle_name
  global cycle_init_flag

   set cycle_init_flag TRUE
   set cycle_name DRILL_BREAK_CHIP
   CYCLE_SET
}


#=============================================================
proc MOM_drill_break_chip_move { } {
#=============================================================
   global cycle_init_flag


   global mom_sys_abort_next_event
   if { [info exists mom_sys_abort_next_event] } {
      if { [llength [info commands PB_CMD_kin_abort_event]] } {
         PB_CMD_kin_abort_event
      }
   }


   PB_CMD_set_cycle_plane
   PB_CMD_set_cycle_pos_list
   PB_CMD_CYCLE_fmax
   PB_CMD_TNC_CYCLE_map
   PB_CMD_TNC_CYCLE203
   MOM_do_template cycle_drill_break_chip
   PB_CMD_cycle_time
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_drill_csink_tnc { } {
#=============================================================
  global cycle_name
  global cycle_init_flag

   set cycle_init_flag TRUE
   set cycle_name DRILL_CSINK_TNC
   CYCLE_SET
}


#=============================================================
proc MOM_drill_csink_tnc_move { } {
#=============================================================
  global cycle_init_flag


   global mom_sys_abort_next_event
   if { [info exists mom_sys_abort_next_event] } {
      if { [llength [info commands PB_CMD_kin_abort_event]] } {
         PB_CMD_kin_abort_event
      }
   }


   global mom_your_name


   PB_CMD_set_cycle_plane
   PB_CMD_CYCLE_fmax
   PB_CMD_TNC_CYCLE_map
   PB_CMD_TNC_CYCLE240
   MOM_do_template csink_tnc
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_drill_deep { } {
#=============================================================
  global cycle_name
  global cycle_init_flag

   set cycle_init_flag TRUE
   set cycle_name DRILL_DEEP
   CYCLE_SET
}


#=============================================================
proc MOM_drill_deep_move { } {
#=============================================================
   global cycle_init_flag


   global mom_sys_abort_next_event
   if { [info exists mom_sys_abort_next_event] } {
      if { [llength [info commands PB_CMD_kin_abort_event]] } {
         PB_CMD_kin_abort_event
      }
   }


   PB_CMD_set_cycle_plane
   PB_CMD_set_cycle_pos_list
   PB_CMD_CYCLE_fmax
   PB_CMD_TNC_CYCLE_map
   PB_CMD_TNC_CYCLE200
   MOM_do_template cycle_drill_deep
   PB_CMD_cycle_time
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_drill_dwell { } {
#=============================================================
  global cycle_name
  global cycle_init_flag

   set cycle_init_flag TRUE
   set cycle_name DRILL_DWELL
   CYCLE_SET
}


#=============================================================
proc MOM_drill_dwell_move { } {
#=============================================================
   global cycle_init_flag


   global mom_sys_abort_next_event
   if { [info exists mom_sys_abort_next_event] } {
      if { [llength [info commands PB_CMD_kin_abort_event]] } {
         PB_CMD_kin_abort_event
      }
   }


   PB_CMD_set_cycle_plane
   PB_CMD_set_cycle_pos_list
   PB_CMD_CYCLE_fmax
   PB_CMD_TNC_CYCLE_map
   PB_CMD_TNC_CYCLE200
   MOM_do_template cycle_drill_dwell
   PB_CMD_cycle_time
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_drill_holemill_tnc { } {
#=============================================================
  global cycle_name
  global cycle_init_flag

   set cycle_init_flag TRUE
   set cycle_name DRILL_HOLEMILL_TNC
   CYCLE_SET
}


#=============================================================
proc MOM_drill_holemill_tnc_move { } {
#=============================================================
  global cycle_init_flag


   global mom_sys_abort_next_event
   if { [info exists mom_sys_abort_next_event] } {
      if { [llength [info commands PB_CMD_kin_abort_event]] } {
         PB_CMD_kin_abort_event
      }
   }


   global mom_cycle_bmg_hole_diameter
   global mom_cycle_bmg_peck
   global mom_cycle_roughing_diameter
   global mom_cycle_bmg_direction


   PB_CMD_set_cycle_plane
   PB_CMD_read_cycle_pos_list
   PB_CMD_CYCLE_fmax
   PB_CMD_TNC_CYCLE_map
   PB_CMD_TNC_CYCLE208
   MOM_do_template bore_milling
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_drill_holethrmill_tnc { } {
#=============================================================
  global cycle_name
  global cycle_init_flag

   set cycle_init_flag TRUE
   set cycle_name DRILL_HOLETHRMILL_TNC
   CYCLE_SET
}


#=============================================================
proc MOM_drill_holethrmill_tnc_move { } {
#=============================================================
  global cycle_init_flag


   global mom_sys_abort_next_event
   if { [info exists mom_sys_abort_next_event] } {
      if { [llength [info commands PB_CMD_kin_abort_event]] } {
         PB_CMD_kin_abort_event
      }
   }


   global mom_cycle_thmg_diameter
   global mom_cycle_thmg_pitch
   global mom_cycle_thmg_steps
   global mom_cycle_thmg_climb


   PB_CMD_set_cycle_plane
   PB_CMD_CYCLE_fmax
   PB_CMD_TNC_CYCLE_map
   PB_CMD_TNC_CYCLE262
   MOM_do_template cycle_thread_milling
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_drill_text { } {
#=============================================================
  global cycle_name
  global cycle_init_flag

   set cycle_init_flag TRUE
   set cycle_name DRILL_TEXT
   CYCLE_SET
}


#=============================================================
proc MOM_drill_text_move { } {
#=============================================================
   global cycle_init_flag


   global mom_sys_abort_next_event
   if { [info exists mom_sys_abort_next_event] } {
      if { [llength [info commands PB_CMD_kin_abort_event]] } {
         PB_CMD_kin_abort_event
      }
   }


   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_end_of_path { } {
#=============================================================
  global mom_sys_add_cutting_time mom_sys_add_non_cutting_time
  global mom_cutting_time mom_machine_time

  # Accumulated time should be in minutes.
   set mom_cutting_time [expr $mom_cutting_time + $mom_sys_add_cutting_time]
   set mom_machine_time [expr $mom_machine_time + $mom_sys_add_cutting_time + $mom_sys_add_non_cutting_time]
   MOM_reload_variable mom_cutting_time
   MOM_reload_variable mom_machine_time

   if [llength [info commands PB_CMD_kin_end_of_path] ] {
      PB_CMD_kin_end_of_path
   }

   PB_CMD_TCPM_off
   PB_CMD_end_path_m_code
   MOM_do_template m3m8
   PB_CMD_end_path_trans_off
   PB_CMD_reset_all_motion_variables_to_zero
   PB_CMD_set_operation_time
   global mom_sys_in_operation
   set mom_sys_in_operation 0
}


#=============================================================
proc MOM_end_of_subop_path { } {
#=============================================================
}


#=============================================================
proc MOM_first_move { } {
#=============================================================
  global mom_feed_rate mom_feed_rate_per_rev mom_motion_type
  global mom_kin_max_fpm mom_motion_event
   COOLANT_SET ; CUTCOM_SET ; SPINDLE_SET ; RAPID_SET
   MOM_suppress once N
   MOM_do_template separate
   PB_CMD_TCPM_off
   PB_CMD_hhain_tool_change
   MOM_suppress once N
   MOM_do_template separate
   PB_CMD_PLANE_initial
   PB_CMD_enable_coolant
   PB_CMD_spindle_code
   MOM_do_template m3m8
   PB_CMD_CYCLE_DEF32
   PB_CMD_TCPM_initial
   PB_CMD_FORCE_operation_start
   catch {MOM_$mom_motion_event}
}


#=============================================================
proc MOM_first_tool { } {
#=============================================================
  global mom_sys_first_tool_handled

  # First tool only gets handled once
   if { [info exists mom_sys_first_tool_handled] } {
      MOM_tool_change
      return
   }

   set mom_sys_first_tool_handled 1

   MOM_tool_change
}


#=============================================================
proc MOM_from_move { } {
#=============================================================
  global mom_feed_rate mom_feed_rate_per_rev  mom_motion_type mom_kin_max_fpm
   COOLANT_SET ; CUTCOM_SET ; SPINDLE_SET ; RAPID_SET
}


#=============================================================
proc MOM_gohome_move { } {
#=============================================================
   PB_CMD_gohome_move
   MOM_rapid_move
}


#=============================================================
proc MOM_head { } {
#=============================================================
   global mom_head_name
}


#=============================================================
proc MOM_Head { } {
#=============================================================
   MOM_head
}


#=============================================================
proc MOM_HEAD { } {
#=============================================================
   MOM_head
}


#=============================================================
proc MOM_helix_move { } {
#=============================================================
   PB_CMD_set_helix
   MOM_do_template helix_move
}


#=============================================================
proc MOM_initial_move { } {
#=============================================================
  global mom_feed_rate mom_feed_rate_per_rev mom_motion_type
  global mom_kin_max_fpm mom_motion_event
   COOLANT_SET ; CUTCOM_SET ; SPINDLE_SET ; RAPID_SET
   MOM_suppress once N
   MOM_do_template separate
   PB_CMD_TCPM_off
   MOM_force Once Text
   MOM_do_template m140_mb_max
   PB_CMD_hhain_tool_change
   MOM_suppress once N
   MOM_do_template separate
   PB_CMD_PLANE_initial
   PB_CMD_enable_coolant
   PB_CMD_spindle_code
   MOM_do_template m3m8
   MOM_force Once tool_def
   MOM_do_template tool_def
   PB_CMD_CYCLE_DEF32
   PB_CMD_TCPM_initial
   PB_CMD_FORCE_operation_start

  global mom_programmed_feed_rate
   if { [EQ_is_equal $mom_programmed_feed_rate 0] } {
      MOM_rapid_move
   } else {
      MOM_linear_move
   }
}


#=============================================================
proc MOM_insert { } {
#=============================================================
   global mom_Instruction
   PB_CMD_MOM_insert
}


#=============================================================
proc MOM_instance_operation_handler { } {
#=============================================================
   global mom_handle_instanced_operations
}


#=============================================================
proc MOM_length_compensation { } {
#=============================================================
   TOOL_SET MOM_length_compensation
}


#=============================================================
proc MOM_linear_move { } {
#=============================================================

   global mom_sys_abort_next_event
   if { [info exists mom_sys_abort_next_event] } {
      if { [llength [info commands PB_CMD_kin_abort_event]] } {
         PB_CMD_kin_abort_event
      }
   }


   global first_linear_move

   if { !$first_linear_move } {
      PB_first_linear_move
      incr first_linear_move
   }

   PB_CMD_PLANE_check
   if { [PB_CMD__check_block_PLANE_linear] } {
      MOM_do_template linear_move
   }
   if { [PB_CMD__check_block_TRAORI_move] } {
      MOM_do_template linear_move_traori
   }
}


#=============================================================
proc MOM_load_tool { } {
#=============================================================
  global mom_tool_change_type mom_manual_tool_change
}


#=============================================================
proc MOM_lock_axis { } {
#=============================================================
   global mom_lock_axis
   global mom_lock_axis_plane
   global mom_lock_axis_value
   PB_CMD_MOM_lock_axis
}


#=============================================================
proc MOM_operator_message { } {
#=============================================================
   global mom_operator_message
   PB_CMD_MOM_operator_message
}


#=============================================================
proc MOM_opskip_off { } {
#=============================================================
   global mom_opskip_text
   PB_CMD_MOM_opskip_off
}


#=============================================================
proc MOM_opskip_on { } {
#=============================================================
   global mom_opskip_text
   PB_CMD_MOM_opskip_on
}


#=============================================================
proc MOM_opstop { } {
#=============================================================
   MOM_do_template opstop
}


#=============================================================
proc MOM_pprint { } {
#=============================================================
   global mom_pprint
   PB_CMD_MOM_pprint
}


#=============================================================
proc MOM_prefun { } {
#=============================================================
}


#=============================================================
proc MOM_rapid_move { } {
#=============================================================
  global rapid_spindle_inhibit rapid_traverse_inhibit
  global spindle_first is_from
  global mom_cycle_spindle_axis traverse_axis1 traverse_axis2
  global mom_motion_event


   global mom_sys_abort_next_event
   if { [info exists mom_sys_abort_next_event] } {
      if { [llength [info commands PB_CMD_kin_abort_event]] } {
         PB_CMD_kin_abort_event
      }
   }


   set spindle_first NONE

   set aa(0) X ; set aa(1) Y ; set aa(2) Z
   RAPID_SET
   PB_CMD_PLANE_check
   if { [PB_CMD__check_block_CYCLE_rapid] } {
      MOM_do_template rapid_move_3d
   }
   set rapid_spindle_blk {G_motion X Y Z f_max M_spindle M_coolant}
   set rapid_spindle_x_blk {G_motion X f_max M_spindle M_coolant}
   set rapid_spindle_y_blk {G_motion Y f_max M_spindle M_coolant}
   set rapid_spindle_z_blk {G_motion Z f_max M_spindle M_coolant}
   set rapid_traverse_blk {G_motion X Y Z f_max M_spindle M_coolant}
   set rapid_traverse_xy_blk {G_motion X Y f_max M_spindle M_coolant}
   set rapid_traverse_yz_blk {G_motion Y Z f_max M_spindle M_coolant}
   set rapid_traverse_xz_blk {G_motion X Z f_max M_spindle M_coolant}
   set rapid_traverse_mod {}
   set rapid_spindle_mod {}

   global mom_sys_control_out mom_sys_control_in
   set co "$mom_sys_control_out"
   set ci "$mom_sys_control_in"


   if { ![info exists mom_cycle_spindle_axis] } {
      set mom_cycle_spindle_axis 2
   }
   if { ![info exists spindle_first] } {
      set spindle_first NONE
   }
   if { ![info exists rapid_spindle_inhibit] } {
      set rapid_spindle_inhibit FALSE
   }
   if { ![info exists rapid_traverse_inhibit] } {
      set rapid_traverse_inhibit FALSE
   }

   switch $mom_cycle_spindle_axis {
      0 {
         if [llength $rapid_spindle_x_blk] {
            set spindle_block  rapid_spindle_x
            PB_SET_RAPID_MOD $rapid_spindle_mod $rapid_spindle_x_blk aa mod_spindle
         } else {
            set spindle_block  ""
         }
         if [llength $rapid_traverse_yz_blk] {
            set traverse_block rapid_traverse_yz
            PB_SET_RAPID_MOD $rapid_traverse_mod $rapid_traverse_yz_blk aa mod_traverse
         } else {
            set traverse_block  ""
         }
      }

      1 {
         if [llength $rapid_spindle_y_blk] {
            set spindle_block  rapid_spindle_y
            PB_SET_RAPID_MOD $rapid_spindle_mod $rapid_spindle_y_blk aa mod_spindle
         } else {
            set spindle_block  ""
         }
         if [llength $rapid_traverse_xz_blk] {
            set traverse_block rapid_traverse_xz
            PB_SET_RAPID_MOD $rapid_traverse_mod $rapid_traverse_xz_blk aa mod_traverse
         } else {
            set traverse_block  ""
         }
      }

      2 {
         if [llength $rapid_spindle_z_blk] {
            set spindle_block  rapid_spindle_z
            PB_SET_RAPID_MOD $rapid_spindle_mod $rapid_spindle_z_blk aa mod_spindle
         } else {
            set spindle_block  ""
         }
         if [llength $rapid_traverse_xy_blk] {
            set traverse_block rapid_traverse_xy
            PB_SET_RAPID_MOD $rapid_traverse_mod $rapid_traverse_xy_blk aa mod_traverse
         } else {
            set traverse_block  ""
         }
      }

      default {
         set spindle_block  rapid_spindle
         set traverse_block rapid_traverse
         PB_SET_RAPID_MOD $rapid_spindle_mod $rapid_spindle_blk aa mod_spindle
         PB_SET_RAPID_MOD $rapid_traverse_mod $rapid_traverse_blk aa mod_traverse
      }
   }

   if { ![string compare $spindle_first "TRUE"] } {
      if { ![string compare $rapid_spindle_inhibit "FALSE"] } {
         if { [string compare $spindle_block ""] } {
            if { [PB_CMD__check_block_PLANE_rapid] } {
               PB_FORCE Once $mod_spindle
               MOM_do_template $spindle_block
            }
         } else {
            MOM_output_literal "$co Rapid Spindle Block is empty! $ci"
         }
      }
      if { ![string compare $rapid_traverse_inhibit "FALSE"] } {
         if { [string compare $traverse_block ""] } {
            if { [PB_CMD__check_block_PLANE_rapid] } {
               PB_FORCE Once $mod_traverse
               MOM_do_template $traverse_block
            }
         } else {
            MOM_output_literal "$co Rapid Traverse Block is empty! $ci"
         }
      }
   } elseif { ![string compare $spindle_first "FALSE"] } {
      if { ![string compare $rapid_traverse_inhibit "FALSE"] } {
         if { [string compare $traverse_block ""] } {
            if { [PB_CMD__check_block_PLANE_rapid] } {
               PB_FORCE Once $mod_traverse
               MOM_do_template $traverse_block
            }
         } else {
            MOM_output_literal "$co Rapid Traverse Block is empty! $ci"
         }
      }
      if { ![string compare $rapid_spindle_inhibit "FALSE"] } {
         if { [string compare $spindle_block ""] } {
            if { [PB_CMD__check_block_PLANE_rapid] } {
               PB_FORCE Once $mod_spindle
               MOM_do_template $spindle_block
            }
         } else {
            MOM_output_literal "$co Rapid Spindle Block is empty! $ci"
         }
      }
   } else {
      if { [PB_CMD__check_block_PLANE_rapid] } {
         PB_FORCE Once $mod_traverse
         MOM_do_template rapid_traverse
      }
   }
   if { [PB_CMD__check_block_TRAORI_move] } {
      MOM_do_template rapid_move_traori
   }
}


#=============================================================
proc MOM_rotate { } {
#=============================================================
   global mom_rotate_axis_type
   global mom_rotation_mode
   global mom_rotation_direction
   global mom_rotation_angle
   global mom_rotation_reference_mode
   global mom_rotation_text
   PB_CMD_MOM_rotate
}


#=============================================================
proc MOM_sequence_number { } {
#=============================================================
   SEQNO_SET
}


#=============================================================
proc MOM_set_modes { } {
#=============================================================
   MODES_SET
}


#=============================================================
proc MOM_spindle_rpm { } {
#=============================================================
   SPINDLE_SET
   PB_CMD_spindle_speed
}


#=============================================================
proc MOM_spindle_off { } {
#=============================================================
   MOM_do_template spindle_off
}


#=============================================================
proc MOM_start_of_path { } {
#=============================================================
  global mom_sys_in_operation
   set mom_sys_in_operation 1

  global first_linear_move ; set first_linear_move 0
   TOOL_SET MOM_start_of_path


  global mom_sys_add_cutting_time mom_sys_add_non_cutting_time
  global mom_sys_machine_time mom_machine_time
   set mom_sys_add_cutting_time 0.0
   set mom_sys_add_non_cutting_time 0.0
   set mom_sys_machine_time $mom_machine_time

   if [llength [info commands PB_CMD_kin_start_of_path] ] {
      PB_CMD_kin_start_of_path
   }

   MOM_suppress once N
   MOM_do_template separate
   MOM_suppress once N
   MOM_do_template operation_name
   PB_CMD_operation_mode
   PB_CMD_disable_coolant
}


#=============================================================
proc MOM_start_of_subop_path { } {
#=============================================================
}


#=============================================================
proc MOM_stop { } {
#=============================================================
   MOM_do_template stop
}


#=============================================================
proc MOM_tap { } {
#=============================================================
  global cycle_name
  global cycle_init_flag

   set cycle_init_flag TRUE
   set cycle_name TAP
   CYCLE_SET
}


#=============================================================
proc MOM_tap_move { } {
#=============================================================
   global cycle_init_flag


   global mom_sys_abort_next_event
   if { [info exists mom_sys_abort_next_event] } {
      if { [llength [info commands PB_CMD_kin_abort_event]] } {
         PB_CMD_kin_abort_event
      }
   }


   PB_CMD_set_cycle_plane
   PB_CMD_read_cycle_pos_list
   PB_CMD_CYCLE_fmax
   PB_CMD_TNC_CYCLE_map
   PB_CMD_TNC_CYCLE_tap
   MOM_force Once G_motion X Y Z M_spindle M_coolant
   MOM_do_template tap
   PB_CMD_cycle_time
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_text { } {
#=============================================================
   global mom_user_defined_text
   PB_CMD_MOM_text
}


#=============================================================
proc MOM_tool_change { } {
#=============================================================
  global mom_tool_change_type mom_manual_tool_change
   if { [info exists mom_tool_change_type] } {
      switch $mom_tool_change_type {
         MANUAL { PB_manual_tool_change }
         AUTO   { PB_auto_tool_change }
      }
   } elseif { [info exists mom_manual_tool_change] } {
      if { ![string compare $mom_manual_tool_change "TRUE"] } {
         PB_manual_tool_change
      }
   }
}


#=============================================================
proc MOM_tool_preselect { } {
#=============================================================
  global mom_tool_preselect_number mom_tool_number mom_next_tool_number
   if {[info exists mom_tool_preselect_number]} {
      set mom_next_tool_number $mom_tool_preselect_number
   }
}


#=============================================================
proc PB_approach_move { } {
#=============================================================
}


#=============================================================
proc PB_auto_tool_change { } {
#=============================================================
   global mom_tool_number mom_next_tool_number
   if { ![info exists mom_next_tool_number] } {
      set mom_next_tool_number $mom_tool_number
   }

}


#=============================================================
proc PB_engage_move { } {
#=============================================================
   PB_CMD_ENGAGE_check_motion
}


#=============================================================
proc PB_feedrates { } {
#=============================================================
}


#=============================================================
proc PB_first_cut { } {
#=============================================================
}


#=============================================================
proc PB_first_linear_move { } {
#=============================================================
  global mom_sys_first_linear_move

  # Set this variable to signal 1st linear move has been handled.
   set mom_sys_first_linear_move 1

}


#=============================================================
proc PB_manual_tool_change { } {
#=============================================================
   PB_CMD_manual_tool_change
}


#=============================================================
proc PB_retract_move { } {
#=============================================================
}


#=============================================================
proc PB_return_move { } {
#=============================================================
}


#=============================================================
proc PB_start_of_program { } {
#=============================================================

   if [llength [info commands PB_CMD_kin_start_of_program] ] {
      PB_CMD_kin_start_of_program
   }

   PB_CMD_fix_RAPID_SET
   PB_CMD_UPLEVEL_trans
   PB_CMD_UPLEVEL_helix
   PB_CMD_UPLEVEL_procs
   PB_CMD_UPLEVEL_path
   PB_CMD_DELETE_vars
   PB_CMD_UPLEVEL_cycles
   PB_CMD_TNC_CYCLE_call
   PB_CMD_begin_pgm
   PB_CMD_disable_coolant
   PB_CMD_ADDITION_set

   if [llength [info commands PB_CMD_kin_start_of_program_2] ] {
      PB_CMD_kin_start_of_program_2
   }
}


#=============================================================
proc PB_user_def_axis_limit_action { args } {
#=============================================================
}


#=============================================================
proc PB_CMD_ADDITION_plane { } {
#=============================================================
global RELATIVE_0_list RELATIVE_90_list RELATIVE_180_list RELATIVE_270_list
global mom_out_angle_pos

      if {[EQ_is_equal $mom_out_angle_pos(1) 0] && [info exists RELATIVE_0_list]} {
             foreach line_ $RELATIVE_0_list {
                     MOM_output_literal $line_
             }
         return
      }

      if {[EQ_is_equal $mom_out_angle_pos(1) 90] && [info exists RELATIVE_90_list]} {
             foreach line_ $RELATIVE_90_list {
                     MOM_output_literal $line_
             }
         return
      }

      if {[EQ_is_equal $mom_out_angle_pos(1) 180] && [info exists RELATIVE_180_list]} {
             foreach line_ $RELATIVE_180_list {
                     MOM_output_literal $line_
             }
         return
      }

      if {[EQ_is_equal $mom_out_angle_pos(1) 270] && [info exists RELATIVE_270_list]} {
             foreach line_ $RELATIVE_270_list {
                     MOM_output_literal $line_
             }
         return
      }

}


#=============================================================
proc PB_CMD_ADDITION_set { } {
#=============================================================
uplevel #0 {

#============================
proc MOM_plane_addition { } {
#============================
## MOM_plane_addition
## "DMU EVO : Поправка при повороте стола"
global mom_use_relative ; #  FALSE Использовать
global mom_angle_0_param ; # Угол поворота стола 0 град
global mom_angle_90_param ; # SPA+Q1 SPB-Q2 X+Q6 Y+Q7 Z0 Угол поворота стола 90 град
global mom_angle_180_param ; # Угол поворота стола 180 град
global mom_angle_270_param ; # SPA+Q1 SPB-Q2 X+Q12 Y+Q13 Z0 Угол поворота стола 270 град

global mom_angle_0_param_defined
global mom_angle_90_param_defined
global mom_angle_180_param_defined
global mom_angle_270_param_defined
global RELATIVE_0_list RELATIVE_90_list RELATIVE_180_list RELATIVE_270_list

    if {[info exists mom_use_relative] && $mom_use_relative == "TRUE" } {

           if { [info exists mom_angle_0_param_defined] && $mom_angle_0_param_defined == 1 } {
                    scan $mom_angle_0_param {%s %s %s %s %s} res1_ res2_ res3_ res4_ res5_
                    lappend RELATIVE_0_list "PLANE RELATIV $res1_ TURN MB MAX FMAX"
                    lappend RELATIVE_0_list "PLANE RELATIV $res2_ TURN MB MAX FMAX"
                    lappend RELATIVE_0_list "TRANS DATUM AXIS $res3_ $res4_ $res5_"
              }
           if { [info exists mom_angle_90_param_defined] && $mom_angle_90_param_defined == 1 } {
                    scan $mom_angle_90_param {%s %s %s %s %s} res1_ res2_ res3_ res4_ res5_
                    lappend RELATIVE_90_list "PLANE RELATIV $res1_ TURN MB MAX FMAX"
                    lappend RELATIVE_90_list "PLANE RELATIV $res2_ TURN MB MAX FMAX"
                    lappend RELATIVE_90_list "TRANS DATUM AXIS $res3_ $res4_ $res5_"
              }
           if { [info exists mom_angle_180_param_defined] && $mom_angle_180_param_defined == 1 } {
                    scan $mom_angle_180_param {%s %s %s %s %s} res1_ res2_ res3_ res4_ res5_
                    lappend RELATIVE_180_list "PLANE RELATIV $res1_ TURN MB MAX FMAX"
                    lappend RELATIVE_180_list "PLANE RELATIV $res2_ TURN MB MAX FMAX"
                    lappend RELATIVE_180_list "TRANS DATUM AXIS $res3_ $res4_ $res5_"
              }
           if { [info exists mom_angle_270_param_defined] && $mom_angle_270_param_defined == 1 } {
                    scan $mom_angle_270_param {%s %s %s %s %s} res1_ res2_ res3_ res4_ res5_
                    lappend RELATIVE_270_list "PLANE RELATIV $res1_ TURN MB MAX FMAX"
                    lappend RELATIVE_270_list "PLANE RELATIV $res2_ TURN MB MAX FMAX"
                    lappend RELATIVE_270_list "TRANS DATUM AXIS $res3_ $res4_ $res5_"
              }
    } else {
            if {[info exists RELATIVE_0_list]} { unset RELATIVE_0_list }
            if {[info exists RELATIVE_90_list]} { unset RELATIVE_90_list }
            if {[info exists RELATIVE_180_list]} { unset RELATIVE_180_list }
            if {[info exists RELATIVE_270_list]} { unset RELATIVE_270_list }
        return
     }
}

#============================
} ; # uplevel
}


#=============================================================
proc PB_CMD_BLANK_form { } {
#=============================================================
## event MOM_tnc_blk_form
## event MOM_blank_data
## "Определение заготовки"
global mom_blk_x_min ; # "X min"
global mom_blk_y_min ; # "Y min"
global mom_blk_z_min ; # "Z min"
global mom_blk_x_max ; # "X max"
global mom_blk_y_max ; # "Y max"
global mom_blk_z_max ; # "Z max"

    if {[info exists mom_blk_x_min] && [info exists mom_blk_y_min] && \
            [info exists mom_blk_z_min] && [info exists mom_blk_x_max] && \
                [info exists mom_blk_y_max] && [info exists mom_blk_z_max] } {
       MOM_output_text "; ========================="
       MOM_output_literal "BLK FORM 0.1 Z [format "X%0.1f Y%0.1f Z%0.1f" $mom_blk_x_min $mom_blk_y_min $mom_blk_z_min]"
       MOM_output_literal "BLK FORM 0.2 [format "X%0.1f Y%0.1f Z%0.1f" $mom_blk_x_max $mom_blk_y_max $mom_blk_z_max]"
    }

}


#=============================================================
proc PB_CMD_CYCLE_DEF247 { } {
#=============================================================
global mom_fixture_offset_value
if { $mom_fixture_offset_value == 0 } { set mom_fixture_offset_value 1 }
if { $mom_fixture_offset_value > 53 } { set mom_fixture_offset_value [expr $mom_fixture_offset_value - 53] }

MOM_output_text "; ========================="
MOM_output_literal "* - ZERO POINT : $mom_fixture_offset_value"
MOM_output_literal "CYCL DEF 247 Q339=+$mom_fixture_offset_value ; NUMBER IN TNC:PRESET.PR"

}


#=============================================================
proc PB_CMD_CYCLE_DEF32 { } {
#=============================================================
global mom_operation_type
global mom_stock_part
global mom_cutter_data_output_indicator
global mom_inside_outside_tolerances
global mom_pb_operation
global mom_tool_axis_max_change_at_corner
global RAD2DEG

if { [string match "*Point*" $mom_operation_type] || \
           [string match "*Hole*" $mom_operation_type] || \
               [string match "*Drill*" $mom_operation_type] } { return }

if {[info exist mom_cutter_data_output_indicator] && $mom_cutter_data_output_indicator == 1} { return }

    set camtolerance_ [expr $mom_inside_outside_tolerances(0)+$mom_inside_outside_tolerances(1)]

    if {[info exist mom_stock_part] && $mom_stock_part > 0.2} {
          set hsc_mode_ "1"
    } else { set hsc_mode_ "0" }

  set hsc_angle_ "1"
  MOM_output_literal "CYCL DEF 32.0 TOLERANCE"
  MOM_output_literal "CYCL DEF 32.1 T[format %0.5f $camtolerance_]"
  MOM_output_literal "CYCL DEF 32.2 HSC-MODE:$hsc_mode_ TA$hsc_angle_"


}


#=============================================================
proc PB_CMD_CYCLE_fmax { } {
#=============================================================
global mom_feed_approach_value
global mom_programmed_feed_rate
global mom_feed_rate_mode
global f_max

if { [EQ_is_equal $mom_feed_approach_value 0] } {
   set out_format "String"
   set f_max "MAX"
} else {
   set out_format "Feed_"
   append out_format $mom_feed_rate_mode
   set f_max [format "%0.0f" $mom_feed_approach_value]
}
MOM_set_address_format f_max $out_format
MOM_force once X Y Z f_max

}


#=============================================================
proc PB_CMD_CYCLE_plane_change { } {
#=============================================================
global mom_cycle_tool_axis_change
global mom_rotary_delta_4th
global mom_tcpm_status

if { [info exist mom_cycle_tool_axis_change] && $mom_cycle_tool_axis_change == 1 } {
     if { [info exist mom_tcpm_status] && $mom_tcpm_status == "ON" } {
           PB_CMD_TCPM_off
           PLANE_ANGLES "STAY"
     } elseif {[EQ_is_equal $mom_rotary_delta_4th 0]} {
           PLANE_ANGLES "TURN MB MAX FMAX"
     } else {
          PB_CMD_table_reload_pos
          PLANE_ANGLES "TURN FMAX"
     }
   set mom_cycle_tool_axis_change 0
}

}


#=============================================================
proc PB_CMD_DELETE_vars { } {
#=============================================================
uplevel #0 {

#============================
proc VAR_GROUP_LIST { vari_ } {
#============================
global VAR_delete_list
  if {[info exist VAR_delete_list] && \
       [lsearch $VAR_delete_list $vari_] >= 0 } {
         return
  } else { lappend VAR_delete_list $vari_ }
}

#============================
proc VAR_DELETE { } {
#============================
global VAR_delete_list
  if {[info exist VAR_delete_list]} {
        foreach vari_ $VAR_delete_list {
              global $vari_
              if {[info exists $vari_]} { unset $vari_ }
        } ; # foreach
   unset VAR_delete_list
  }
}

#============================
} ; # uplevel
}


#=============================================================
proc PB_CMD_ENGAGE_check_motion { } {
#=============================================================
global mom_cutcom_status
global mom_current_motion
global mom_operation_name
global mom_logname

  if {[info exists mom_cutcom_status] && \
          ($mom_cutcom_status == "RIGHT" || \
              $mom_cutcom_status == "LEFT" ) && \
           [string match "*rapid*" $mom_current_motion]} {
      PAUSE "!! МИНУС KPI  программисту $mom_logname !! \n Врезание с коррекцией на ускоренном ходу \n в операции $mom_operation_name."
       MOM_abort "USER EXIT"
    }

}


#=============================================================
proc PB_CMD_FEEDRATE_NUMBER { } {
#=============================================================
#
#  This custom command is called by FEEDRATE_SET;
#  it allows you to modify the feed rate number after being
#  calculated by the system.
#
#<03-13-08 gsl> - Added use of frn factor (defined in ugpost_base.tcl) & max frn here
#                 Use global frn factor or define a custom one here

  global mom_feed_rate_number
  global mom_sys_frn_factor
  global mom_kin_max_frn

 # set mom_sys_frn_factor 1.0

  set f 0.0

  if { [info exists mom_feed_rate_number] } {
    set f [expr $mom_feed_rate_number * $mom_sys_frn_factor]
    if { [EQ_is_gt $f $mom_kin_max_frn] } {
      set f $mom_kin_max_frn
    }
  }

return $f
}


#=============================================================
proc PB_CMD_FMAX_set { } {
#=============================================================
global mom_programmed_feed_rate
global mom_feed_rate_mode
global f_max  feed
# In RAPID & CYCLE_POS  blocks sets F(f_max) = $f_max

if { [EQ_is_equal $mom_programmed_feed_rate 0] } {
   set out_format "String"
   set f_max "MAX"
 } else {
   set out_format "Feed_"
   append out_format $mom_feed_rate_mode
   set f_max $feed
 }
MOM_set_address_format f_max $out_format

}


#=============================================================
proc PB_CMD_FORCE_operation_start { } {
#=============================================================
MOM_force once X Y Z f_max

}


#=============================================================
proc PB_CMD_MOM_clamp { } {
#=============================================================
  global mom_clamp_axis mom_clamp_status mom_sys_auto_clamp

   if {$mom_clamp_axis == "AUTO"} {
      if {$mom_clamp_status == "ON"} {
         set mom_sys_auto_clamp "ON"
      } elseif {$mom_clamp_status == "OFF"} {
         set mom_sys_auto_clamp "OFF"
      }
   }
}


#=============================================================
proc PB_CMD_MOM_insert { } {
#=============================================================
# This procedure is executed when the Insert command is activated.
#
   global mom_Instruction
#   MOM_output_literal ";$mom_Instruction"
   MOM_output_literal "$mom_Instruction"
}


#=============================================================
proc PB_CMD_MOM_lock_axis { } {
#=============================================================
  global mom_sys_lock_value mom_sys_lock_plane
  global mom_sys_lock_axis mom_sys_lock_status

   set status [SET_LOCK axis plane value]
   if {$status == "error"} {
      MOM_catch_warning
      set mom_sys_lock_status OFF
   } else {
      set mom_sys_lock_status $status
      if {$status != "OFF"} {
         set mom_sys_lock_axis $axis
         set mom_sys_lock_plane $plane
         set mom_sys_lock_value $value
         LOCK_AXIS_INITIALIZE
      }
   }
}


#=============================================================
proc PB_CMD_MOM_operator_message { } {
#=============================================================
# This procedure is executed when the Operator Message command is activated.
#
   global mom_operator_message mom_operator_message_defined
   global mom_operator_message_status
   global ptp_file_name group_output_file mom_group_name
   global mom_sys_commentary_output
   global mom_sys_control_in
   global mom_sys_control_out
   global mom_sys_ptp_output

   if { [info exists mom_operator_message_defined] } {
      if { $mom_operator_message_defined == 0 } {
return
      }
   }

   if { $mom_operator_message != "ON" && $mom_operator_message != "OFF" } {

      set brac_start [string first \( $mom_operator_message]
      set brac_end   [string last \) $mom_operator_message]

      if { $brac_start != 0 } {
         set text_string "("
      } else {
         set text_string ""
      }

      append text_string $mom_operator_message

      if { $brac_end != [expr [string length $mom_operator_message] - 1] } {
         append text_string ")"
      }

      MOM_close_output_file   $ptp_file_name

      if { [hiset mom_group_name] } {
         if { [hiset group_output_file($mom_group_name)] } {
            MOM_close_output_file $group_output_file($mom_group_name)
         }
      }

      MOM_output_text      $text_string

      if { $mom_sys_ptp_output == "ON" } {
         MOM_open_output_file    $ptp_file_name
      }

      if { [hiset mom_group_name] } {
         if { [hiset group_output_file($mom_group_name)] } {
            MOM_open_output_file $group_output_file($mom_group_name)
         }
      }

      set need_commentary $mom_sys_commentary_output
      set mom_sys_commentary_output OFF
      regsub -all {[)]} $text_string $mom_sys_control_in text_string
      regsub -all {[(]} $text_string $mom_sys_control_out text_string

      MOM_output_literal $text_string

      set mom_sys_commentary_output $need_commentary

   } else {
      set mom_operator_message_status $mom_operator_message
   }
}


#=============================================================
proc PB_CMD_MOM_opskip_off { } {
#=============================================================
# This procedure is executed when the Optional skip command is activated.
#
   global mom_sys_opskip_block_leader
   MOM_set_line_leader off  $mom_sys_opskip_block_leader
}


#=============================================================
proc PB_CMD_MOM_opskip_on { } {
#=============================================================
# This procedure is executed when the Optional skip command is activated.
#
   global mom_sys_opskip_block_leader
   MOM_set_line_leader always  $mom_sys_opskip_block_leader
}


#=============================================================
proc PB_CMD_MOM_pprint { } {
#=============================================================
# This procedure is executed when the PPrint command is activated.
#
   global mom_pprint_defined

   if { [info exists mom_pprint_defined] } {
      if { $mom_pprint_defined == 0 } {
return
      }
   }

   PPRINT_OUTPUT
}


#=============================================================
proc PB_CMD_MOM_rotate { } {
#=============================================================
## <rws 04-11-2008>
## If in TURN mode and user invokes "Flip tool aorund Holder" a MOM_rotate event is generated
## When this happens ABORT this event via return

  global mom_machine_mode


  if { [info exists mom_machine_mode] && [string match "TURN" $mom_machine_mode] } {
return
  }


  global mom_rotate_axis_type mom_rotation_mode mom_rotation_direction
  global mom_rotation_angle mom_rotation_reference_mode
  global mom_kin_machine_type mom_kin_4th_axis_direction mom_kin_5th_axis_direction
  global mom_kin_4th_axis_leader mom_kin_5th_axis_leader
  global mom_kin_4th_axis_leader mom_kin_5th_axis_leader mom_pos
  global mom_out_angle_pos
  global unlocked_prev_pos mom_sys_leader
  global mom_kin_4th_axis_min_limit mom_kin_4th_axis_max_limit
  global mom_kin_5th_axis_min_limit mom_kin_5th_axis_max_limit
  global mom_prev_pos
  global mom_prev_rot_ang_4th mom_prev_rot_ang_5th


  if { ![info exists mom_rotation_angle] } {
    # Should the event be aborted here???
return
  }


  if { ![info exists mom_kin_5th_axis_direction] } {
     set mom_kin_5th_axis_direction "0"
  }


  #
  #  Determine which rotary axis the UDE has specifid - fourth(3), fifth(4) or invalid(0)
  #
  #
  if { [string match "*3_axis_mill_turn*" $mom_kin_machine_type] } {

      switch $mom_rotate_axis_type {
         CAXIS -
         FOURTH_AXIS -
         TABLE {
            set axis 3
         }
         default {
            set axis 0
         }
      }

   } else {

      switch $mom_rotate_axis_type {
         AAXIS -
         BAXIS -
         CAXIS {
            set axis [AXIS_SET $mom_rotate_axis_type]
         }
         HEAD {
            if { $mom_kin_machine_type == "5_axis_head_table"  ||  $mom_kin_machine_type == "5_AXIS_HEAD_TABLE" } {
               set axis 4
            } else {
               set axis 3
            }
         }
         FIFTH_AXIS {
            set axis 4
         }
         FOURTH_AXIS -
         TABLE -
         default {
            set axis 3
         }
      }
   }

   if { $axis == "0" } {
      global mom_warning_info
      set mom_warning_info "Invalid rotary axis"
      MOM_catch_warning
      MOM_abort_event
   }


   if { [string match "INCREMENTAL" $mom_rotation_mode] } {
      set angle [expr $mom_pos($axis) + $mom_rotation_angle]
   } else {
      set angle $mom_rotation_angle
   }

   if { [string match "ABSOLUTE" $mom_rotation_mode] } {
      set mode 1
   } else {
      set mode 0
   }


   switch $mom_rotation_direction {
      NONE {
         set dir 0
      }
      CLW {
         set dir 1
      }
      CCLW {
         set dir -1
      }
   }

   set ang [LIMIT_ANGLE $angle]
   set mom_pos($axis) $ang


  #<05-10-06 sws> pb351 - Corrected logic
   if { $axis == "3" } {
      if { ![info exists mom_prev_rot_ang_4th] } {
         set prev_angles(0) [MOM_ask_address_value fourth_axis]
      } else {
         set prev_angles(0) $mom_prev_rot_ang_4th
      }
   } elseif { $axis == "4" } {
      if { ![info exists mom_prev_rot_ang_5th] } {
         set prev_angles(1) [MOM_ask_address_value fifth_axis]
      } else {
         set prev_angles(1) $mom_prev_rot_ang_5th
      }
   }

   set p [expr $axis + 1]
   set a [expr $axis - 3]

   if { $axis == "3"  &&  [string match "MAGNITUDE_DETERMINES_DIRECTION" $mom_kin_4th_axis_direction] } {

      set dirtype 0

      global mom_sys_4th_axis_dir_mode
      if [info exists mom_sys_4th_axis_dir_mode] {
        if {$mom_sys_4th_axis_dir_mode == "ON"} {
          set del $dir
          if {$del == 0} {
            set del [expr $ang-$mom_prev_pos(3)]
            if {$del > 180.0} {set del [expr $del-360.0]}
            if {$del < -180.0} {set del [expr $del+360.0]}
          }
          global mom_sys_4th_axis_cur_dir
          if {$del > 0.0} {
            global mom_sys_4th_axis_clw_code
            set mom_sys_4th_axis_cur_dir $mom_sys_4th_axis_clw_code
          } elseif {$del < 0.0} {
            global mom_sys_4th_axis_cclw_code
            set mom_sys_4th_axis_cur_dir $mom_sys_4th_axis_cclw_code
          }
        }
      }

   } elseif { $axis == "4"  &&  $mom_kin_5th_axis_direction == "MAGNITUDE_DETERMINES_DIRECTION" } {

      set dirtype 0
      global mom_sys_5th_axis_dir_mode
      if [info exists mom_sys_5th_axis_dir_mode] {
        if {$mom_sys_5th_axis_dir_mode == "ON"} {
          set del $dir
          if {$del == 0} {
            set del [expr $ang-$mom_prev_pos(4)]
            if {$del > 180.0} {set del [expr $del-360.0]}
            if {$del < -180.0} {set del [expr $del+360.0]}
          }
          global mom_sys_5th_axis_cur_dir
          if {$del > 0.0} {
            global mom_sys_5th_axis_clw_code
            set mom_sys_5th_axis_cur_dir $mom_sys_5th_axis_clw_code
          } elseif {$del < 0.0} {
            global mom_sys_5th_axis_cclw_code
            set mom_sys_5th_axis_cur_dir $mom_sys_5th_axis_cclw_code
          }
        }
      }

   } else {

      set dirtype 1
   }

   if { $mode == 1 } {

      set mom_out_angle_pos($a) $angle

   } elseif { $dirtype == 0 } {

      if {$axis == 3} {
         set mom_out_angle_pos($a) [ROTSET $ang  $prev_angles(0)  $mom_kin_4th_axis_direction  $mom_kin_4th_axis_leader  mom_sys_leader(fourth_axis)  $mom_kin_4th_axis_min_limit  $mom_kin_4th_axis_max_limit]
      } else {
         set mom_out_angle_pos($a) [ROTSET $ang  $prev_angles(1)  $mom_kin_5th_axis_direction   $mom_kin_5th_axis_leader   mom_sys_leader(fifth_axis)  $mom_kin_5th_axis_min_limit  $mom_kin_5th_axis_max_limit]
      }

 #     if {$axis == 3} {set prot $prev_angles(0)}
 #     if {$axis == 4} {set prot $prev_angles(1)}
 #     if {$dir == 1 && $mom_out_angle_pos($a) < $prot} {
 #        set mom_out_angle_pos($a) [expr $mom_out_angle_pos($a) + 360.0]
 #     } elseif {$dir == -1 && $mom_out_angle_pos($a) > $prot} {
 #        set mom_out_angle_pos($a) [expr $mom_out_angle_pos($a) - 360.0]
 #     }

   } elseif {$dirtype == "1"} {

      if {$dir == -1} {
         if {$axis == 3} {
            set mom_sys_leader(fourth_axis) $mom_kin_4th_axis_leader-
         } else {
            set mom_sys_leader(fifth_axis) $mom_kin_5th_axis_leader-
         }
      } elseif {$dir == 0} {
         if {$axis == 3} {
            set mom_out_angle_pos($a) [ROTSET $ang  $prev_angles(0)  $mom_kin_4th_axis_direction   $mom_kin_4th_axis_leader   mom_sys_leader(fourth_axis)  $mom_kin_4th_axis_min_limit  $mom_kin_4th_axis_max_limit]
         } else {
            set mom_out_angle_pos($a) [ROTSET $ang  $prev_angles(1)  $mom_kin_5th_axis_direction   $mom_kin_5th_axis_leader  mom_sys_leader(fifth_axis)  $mom_kin_5th_axis_min_limit  $mom_kin_5th_axis_max_limit]
         }
      } elseif {$dir == 1} {
         set mom_out_angle_pos($a) $ang
      }
   }

   global mom_sys_auto_clamp

   if { [info exists mom_sys_auto_clamp] } {
     if { $mom_sys_auto_clamp == "ON" } {
       set out1 "1"
       set out2 "0"
       if {$axis == 3} {
         AUTO_CLAMP_2 $out1
         AUTO_CLAMP_1 $out2
       } else {
         AUTO_CLAMP_1 $out1
         AUTO_CLAMP_2 $out2
       }
     }
   }

   if {$axis == 3} {

      ####  <rws>
      ####  Use rotref switch ON to not output the actual 4th axis move

      if { $mom_rotation_reference_mode == "OFF" } {
          PB_CMD_fourth_axis_rotate_move
      }

      if {$mom_kin_4th_axis_direction == "SIGN_DETERMINES_DIRECTION"} {
        set mom_prev_rot_ang_4th [expr abs($mom_out_angle_pos(0))]
      } else {
        set mom_prev_rot_ang_4th $mom_out_angle_pos(0)
      }

      MOM_reload_variable mom_prev_rot_ang_4th

   } else {

      if [info exists mom_kin_5th_axis_direction] {

        ####  <rws>
        ####  Use rotref switch ON to not output the actual 5th axis move

        if { $mom_rotation_reference_mode == "OFF" } {
            PB_CMD_fifth_axis_rotate_move
        }

        if {$mom_kin_5th_axis_direction == "SIGN_DETERMINES_DIRECTION"} {
          set mom_prev_rot_ang_5th [expr abs($mom_out_angle_pos(1))]
        } else {
          set mom_prev_rot_ang_5th $mom_out_angle_pos(1)
        }

        MOM_reload_variable mom_prev_rot_ang_5th
      }
   }

  #<05-10-06 sws> pb351 - Uncommented next 3 lines
   set mom_prev_pos($axis) $ang
   MOM_reload_variable -a mom_prev_pos
   MOM_reload_variable -a mom_out_angle_pos
}


#=============================================================
proc PB_CMD_MOM_text { } {
#=============================================================
# This procedure is executed when the Text command is activated.
#
   global mom_user_defined_text mom_record_fields
   global mom_sys_control_out mom_sys_control_in
   global mom_record_text mom_pprint set mom_Instruction mom_operator_message
   global mom_pprint_defined mom_operator_message_defined

   switch $mom_record_fields(0) {
   "PPRINT"
         {
           set mom_pprint_defined 1
           set mom_pprint $mom_record_text
           MOM_pprint
         }
   "INSERT"
         {
           set mom_Instruction $mom_record_text
           MOM_insert
         }
   "DISPLY"
         {
           set mom_operator_message_defined 1
           set mom_operator_message $mom_record_text
           MOM_operator_message
         }
   default
         {
           if {[info exists mom_user_defined_text]} {
             MOM_output_literal "${mom_sys_control_out}${mom_user_defined_text}${mom_sys_control_in}"
           }
         }
   }
}


#=============================================================
proc PB_CMD_PALLETE_finish { } {
#=============================================================
  if { [llength [info commands PALLETE_GRID_finish]] } {
         PALLETE_GRID_finish
  }

}


#=============================================================
proc PB_CMD_PALLETE_start { } {
#=============================================================
  if { [llength [info commands PALLETE_GRID_start]] } {
         PALLETE_GRID_start
  }

}


#=============================================================
proc PB_CMD_PLANE_check { } {
#=============================================================
global mom_tcpm_status
#global mom_pb_operation
global mom_cycle_tool_axis_change
global mom_operation_type
global mom_cycle_traversal_type ; # 1 plane/ 2 tcpm
global mom_rotary_delta_4th mom_rotary_delta_5th

if { [info exist mom_tcpm_status] && $mom_tcpm_status == "ON" } { return }

if {[info exist mom_cycle_tool_axis_change] && $mom_cycle_tool_axis_change == 1 } {
       ## CYCLE Tool Axis Change
          MOM_abort_event
}

if { ![EQ_is_equal [expr abs($mom_rotary_delta_4th)] 0] || \
          ![EQ_is_equal [expr abs($mom_rotary_delta_5th)] 0] } {

   if { $mom_operation_type == "Hole Making" || \
         $mom_operation_type == "Point to Point" || \
            [string match "*Drill*" $mom_operation_type] } {

         if {[info exist mom_cycle_traversal_type] && $mom_cycle_traversal_type == 2 } {
                 PLANE_RESET "STAY"
                 PB_CMD_TCPM_on
         } else {
                 set mom_cycle_tool_axis_change 1
                 MOM_abort_event
         }

   } else {
         if { [PB_CMD_table_reload_pos] == 1 } {
                 PLANE_ANGLES "TURN FMAX"
         } else {
                 PLANE_ANGLES "TURN MB MAX FMAX"
           }
       MOM_force once G_motion X Y Z
     }
}

}


#=============================================================
proc PB_CMD_PLANE_initial { } {
#=============================================================
global mom_pb_operation
global mom_plane_trans_status
global mom_tool_axis
global mom_rotary_delta_4th
global mom_rotary_delta_5th
global mom_motion_event
global kin_user_mcs_type

if { $mom_motion_event == "initial_move" } {
         set mom_plane_trans_status ON
   }

if { [info exists kin_user_mcs_type] } {
      if { $kin_user_mcs_type == "SHIFT" } {
           # SET_SHIFT "ON"
         }
      if { $kin_user_mcs_type == "ROT" } { MOM_abort "USER EXIT" }
   }

if { [string match "*PLANE*" $mom_pb_operation] && [EQ_is_equal $mom_tool_axis(2) 1.0] } {
      if { [info exist mom_plane_trans_status] && \
                             $mom_plane_trans_status != "OFF" } {
             PB_CMD_table_reload_pos
             PLANE_RESET "B0C0"
         }
} else {
         if { [PB_CMD_table_reload_pos] == 1 } {
                 PLANE_ANGLES "TURN FMAX"
         } else {
                 PLANE_ANGLES "TURN MB MAX FMAX"
           }

        PB_CMD_ADDITION_plane
}

set mom_rotary_delta_4th 0
set mom_rotary_delta_5th 0

}


#=============================================================
proc PB_CMD_TCPM_initial { } {
#=============================================================
global mom_pb_operation

if { $mom_pb_operation == "TRAORI" } {
     MOM_force once G_motion X Y
     MOM_suppress once Z
     MOM_do_template rapid_traverse
     PLANE_RESET "STAY"
     PB_CMD_TCPM_on
}

}


#=============================================================
proc PB_CMD_TCPM_off { } {
#=============================================================
global mom_tcpm_status
global mom_plane_trans_status

if { [info exist mom_tcpm_status] && $mom_tcpm_status == "ON" } {
       MOM_output_literal "FUNCTION RESET TCPM"
       set mom_tcpm_status OFF
       set mom_plane_trans_status STAY
}
}


#=============================================================
proc PB_CMD_TCPM_on { } {
#=============================================================
global mom_tcpm_status
global mom_pb_operation

if { ![info exist mom_tcpm_status] || $mom_tcpm_status != "ON" } {
       MOM_output_literal "FUNCTION TCPM F TCP AXIS POS PATHCTRL AXIS"
#       MOM_output_literal "FUNCTION TCPM F CONT AXIS SPAT PATHCTRL VECTOR"
       set mom_tcpm_status ON
       MOM_force once F
}

}


#=============================================================
proc PB_CMD_TNC_CYCLE200 { } {
#=============================================================
### CYCLE 200 DRILL ###
global mom_tnc_cycle_q200 ; # SET-UP CLEARANCE
global mom_tnc_cycle_q201 ; # DEPTH
global mom_tnc_cycle_q202 ; # "Глубина врезания : Q202"
global mom_tnc_cycle_q203 ; # SURFACE COORDINATE
global mom_tnc_cycle_q204 ; # 2ND SET-UP CLEARANCE
global mom_tnc_cycle_q206 ; # FEED RATE FOR PLNGNG
global mom_tnc_cycle_q210 ; # "Задержка вверху : Q210"
global mom_tnc_cycle_q211 ; # "Выдержка времени : Q211"
global mom_tnc_cycle_q202_defined
global mom_cycle_step1 mom_cycle_feed_to

if {![info exist mom_tnc_cycle_q202_defined] || $mom_tnc_cycle_q202_defined != 1 } {
      set mom_tnc_cycle_q202 0.0
   }
if { $mom_tnc_cycle_q202 == 0.0} {
     if {[info exist mom_cycle_step1] && $mom_cycle_step1 != 0.0 } {
          set mom_tnc_cycle_q202 $mom_cycle_step1
    } else { set mom_tnc_cycle_q202 [expr abs($mom_cycle_feed_to)] }
} ; # Q202

global saved_cycle_param
set param_list [MOM_do_template cycle_save CREATE]

if { ![info exist saved_cycle_param] || $saved_cycle_param != $param_list } {
MOM_output_literal "CYCL DEF 200 DRILLING ~"
MOM_output_text "    Q200=[format "%0.3f" $mom_tnc_cycle_q200]  ;SET-UP CLEARANCE ~"
MOM_output_text "    Q201=[format "%0.3f" $mom_tnc_cycle_q201]  ;DEPTH ~"
MOM_output_text "    Q206=[format "%0.0f" $mom_tnc_cycle_q206]  ;FEED RATE FOR PLNGNG ~"
MOM_output_text "    Q202=[format "%0.3f" $mom_tnc_cycle_q202]  ;PLUNGING DEPTH ~"
MOM_output_text "    Q210=[format "%0.1f" $mom_tnc_cycle_q210]  ;DWELL TIME AT TOP ~"
MOM_output_text "    Q203=[format "%0.3f" $mom_tnc_cycle_q203]  ;SURFACE COORDINATE ~"
MOM_output_text "    Q204=[format "%0.3f" $mom_tnc_cycle_q204]  ;2ND SET-UP CLEARANCE ~"
MOM_output_text "    Q211=[format "%0.1f" $mom_tnc_cycle_q211]  ;DWELL TIME AT DEPTH"
}
set saved_cycle_param $param_list

}


#=============================================================
proc PB_CMD_TNC_CYCLE201 { } {
#=============================================================
### Разворачивание Цикл201 ###
global mom_tnc_cycle_q200 ; # SET-UP CLEARANCE
global mom_tnc_cycle_q201 ; # DEPTH
global mom_tnc_cycle_q203 ; # SURFACE COORDINATE
global mom_tnc_cycle_q204 ; # 2ND SET-UP CLEARANCE
global mom_tnc_cycle_q206 ; # FEED RATE FOR PLNGNG
global mom_tnc_cycle_q208 ; # "Подача вывода : Q208"
global mom_tnc_cycle_q211 ; # "Выдержка внизу : Q211"

global mom_cycle_feed_rate
if {![info exist mom_tnc_cycle_q208]} { set mom_tnc_cycle_q208 $mom_cycle_feed_rate }

global saved_cycle_param
set param_list [MOM_do_template cycle_save CREATE]

if { ![info exist saved_cycle_param] || $saved_cycle_param != $param_list } {
MOM_output_literal "CYCL DEF 201 REAMING ~"
MOM_output_text "    Q200=[format "%0.3f" $mom_tnc_cycle_q200]  ;SET-UP CLEARANCE ~"
MOM_output_text "    Q201=[format "%0.3f" $mom_tnc_cycle_q201]  ;DEPTH ~"
MOM_output_text "    Q206=[format "%0.0f" $mom_tnc_cycle_q206]  ;FEED RATE FOR PLNGNG ~"
MOM_output_text "    Q211=[format "%0.1f" $mom_tnc_cycle_q211]  ;DWELL TIME AT DEPTH ~"
MOM_output_text "    Q208=[format "%0.0f" $mom_tnc_cycle_q208]  ;RETRACTION FEED RATE ~"
MOM_output_text "    Q203=[format "%0.3f" $mom_tnc_cycle_q203]  ;SURFACE COORDINATE ~"
MOM_output_text "    Q204=[format "%0.3f" $mom_tnc_cycle_q204]  ;2ND SET-UP CLEARANCE"
}
set saved_cycle_param $param_list

}


#=============================================================
proc PB_CMD_TNC_CYCLE202 { } {
#=============================================================
### Расточка Цикл202 ###
global mom_tnc_cycle_q200 ; # SET-UP CLEARANCE
global mom_tnc_cycle_q201 ; # DEPTH
global mom_tnc_cycle_q203 ; # SURFACE COORDINATE
global mom_tnc_cycle_q204 ; # 2ND SET-UP CLEARANCE
global mom_tnc_cycle_q206 ; # FEED RATE FOR PLNGNG
global mom_tnc_cycle_q208 ; # "Подача вывода : Q208"
global mom_tnc_cycle_q211 ; # "Выдержка внизу : Q211"
global mom_tnc_cycle_q214_o ; # "0. Нет","1. X-","2. Y-","3. X+","4. Y+"
global mom_tnc_cycle_q336 ; # "Угол ориентации шпинделя : Q336"

global mom_cycle_feed_rate
global mom_cycle_orient
global mom_cycle_feed_rate_back
global mom_boring_retract_side

set cycle_q214(NO) 0
set cycle_q214(X-) 1
set cycle_q214(Y-) 2
set cycle_q214(X+) 3
set cycle_q214(Y+) 4

if {[info exist mom_tnc_cycle_q214_o]} {
     set mom_tnc_cycle_q214 [string index $mom_tnc_cycle_q214_o 0]
} elseif {[info exists mom_boring_retract_side]} {
         set mom_tnc_cycle_q214 $cycle_q214($mom_boring_retract_side)
} else { set mom_tnc_cycle_q214 0 }

if {[info exists mom_cycle_feed_rate_back]} {
       set mom_tnc_cycle_q208 $mom_cycle_feed_rate_back
} elseif {![info exist mom_tnc_cycle_q208]} {
       set mom_tnc_cycle_q208 $mom_cycle_feed_rate
  }

if {![info exist mom_tnc_cycle_q336] && [info exist mom_cycle_orient]} {
      set mom_tnc_cycle_q336 $mom_cycle_orient
} else { set mom_tnc_cycle_q336 0 }

global saved_cycle_param
set param_list [MOM_do_template cycle_save CREATE]

if { ![info exist saved_cycle_param] || $saved_cycle_param != $param_list } {
MOM_output_literal "CYCL DEF 202 BORING ~"
MOM_output_text "    Q200=[format "%0.3f" $mom_tnc_cycle_q200]  ;SET-UP CLEARANCE ~"
MOM_output_text "    Q201=[format "%0.3f" $mom_tnc_cycle_q201]  ;DEPTH ~"
MOM_output_text "    Q206=[format "%0.0f" $mom_tnc_cycle_q206]  ;FEED RATE FOR PLNGNG ~"
MOM_output_text "    Q211=[format "%0.1f" $mom_tnc_cycle_q211]  ;DWELL TIME AT DEPTH ~"
MOM_output_text "    Q208=[format "%0.0f" $mom_tnc_cycle_q208]  ;RETRACTION FEED RATE ~"
MOM_output_text "    Q203=[format "%0.3f" $mom_tnc_cycle_q203]  ;SURFACE COORDINATE ~"
MOM_output_text "    Q204=[format "%0.3f" $mom_tnc_cycle_q204]  ;2ND SET-UP CLEARANCE ~"
MOM_output_text "    Q214=[format "%0.0f" $mom_tnc_cycle_q214]  ;DEPART WAY ~"
MOM_output_text "    Q336=[format "%0.3f" $mom_tnc_cycle_q336]  ;ANGLE OF SPINDLE"
}
set saved_cycle_param $param_list

}


#=============================================================
proc PB_CMD_TNC_CYCLE203 { } {
#=============================================================
### CYCLE 203 ###
global mom_tnc_cycle_q200 ; # SET-UP CLEARANCE
global mom_tnc_cycle_q201 ; # DEPTH
global mom_tnc_cycle_q202 ; # "Глубина врезания : Q202"
global mom_tnc_cycle_q203 ; # SURFACE COORDINATE
global mom_tnc_cycle_q204 ; # 2ND SET-UP CLEARANCE
global mom_tnc_cycle_q205 ; # "Минимальная глубина врезания : Q205"
global mom_tnc_cycle_q206 ; # FEED RATE FOR PLNGNG
global mom_tnc_cycle_q208 ; # "Подача вывода : Q208"
global mom_tnc_cycle_q210 ; # "Задержка вверху : Q210"
global mom_tnc_cycle_q211 ; # "Выдержка времени : Q211"
global mom_tnc_cycle_q212 ; # "Уменьшение глубины врезания : Q212"
global mom_tnc_cycle_q213 ; # "Количество сломов стружки : Q213"
global mom_tnc_cycle_q256 ; # "Величина отвода для слома стружки : Q256"

global mom_cycle_step1 mom_cycle_step2 mom_cycle_step3
global mom_cycle_feed_to
global mom_cycle_feed_rate

if {![info exist mom_tnc_cycle_q202] || $mom_tnc_cycle_q202 == 0.0} {
     if {[info exist mom_cycle_step1] && $mom_cycle_step1 != 0.0} {
           set mom_tnc_cycle_q202 $mom_cycle_step1
     } else { set mom_tnc_cycle_q202 [expr abs($mom_cycle_feed_to)] }
} ; # Q202

if {![info exist mom_tnc_cycle_q212] || $mom_tnc_cycle_q212 == 0.0} {
    if {[info exist mom_cycle_step2] && $mom_cycle_step2 != 0.0} {
        set mom_tnc_cycle_q212 $mom_cycle_step2
    } else { set mom_tnc_cycle_q212 [expr $mom_tnc_cycle_q202*0.1] }
} ; # Q212

if {![info exist mom_tnc_cycle_q205] || $mom_tnc_cycle_q205 == 0.0} {
      if {[info exist mom_cycle_step3] && $mom_cycle_step3 != 0.0} {
           set mom_tnc_cycle_q205 $mom_cycle_step3
      } else { set mom_tnc_cycle_q205 $mom_tnc_cycle_q212 }
} ; # Q205

if {![info exist mom_tnc_cycle_q213] || \
             $mom_tnc_cycle_q213 == 0.0 } { set mom_tnc_cycle_q213 1 }
if {![info exist mom_tnc_cycle_q256] || \
             $mom_tnc_cycle_q256 == 0.0 } { set mom_tnc_cycle_q256 0.5 }
if {![info exist mom_tnc_cycle_q208] || \
             $mom_tnc_cycle_q208 == 0.0 } { set mom_tnc_cycle_q208 $mom_cycle_feed_rate }

global saved_cycle_param
set param_list [MOM_do_template cycle_save CREATE]

if {![info exist saved_cycle_param] || $saved_cycle_param != $param_list } {
MOM_output_literal "CYCL DEF 203 UNIVERSAL DRILLING ~"
MOM_output_text "    Q200=[format "%0.3f" $mom_tnc_cycle_q200]  ;SET-UP CLEARANCE ~"
MOM_output_text "    Q201=[format "%0.3f" $mom_tnc_cycle_q201]  ;DEPTH ~"
MOM_output_text "    Q206=[format "%0.0f" $mom_tnc_cycle_q206]  ;FEED RATE FOR PLNGNG ~"
MOM_output_text "    Q202=[format "%0.3f" $mom_tnc_cycle_q202]  ;PLUNGING DEPTH ~"
MOM_output_text "    Q210=[format "%0.1f" $mom_tnc_cycle_q210]  ;DWELL TIME AT TOP ~"
MOM_output_text "    Q203=[format "%0.3f" $mom_tnc_cycle_q203]  ;SURFACE COORDINATE ~"
MOM_output_text "    Q204=[format "%0.3f" $mom_tnc_cycle_q204]  ;2ND SET-UP CLEARANCE ~"
MOM_output_text "    Q212=[format "%0.3f" $mom_tnc_cycle_q212]  ;DECREMENT ~"
MOM_output_text "    Q213=[format "%0.0f" $mom_tnc_cycle_q213]  ;NR OF BREAKS ~"
MOM_output_text "    Q205=[format "%0.3f" $mom_tnc_cycle_q205]  ;MIN. PLUNGING DEPTH ~"
MOM_output_text "    Q211=[format "%0.1f" $mom_tnc_cycle_q211]  ;DWELL TIME AT DEPTH ~"
MOM_output_text "    Q208=[format "%0.0f" $mom_tnc_cycle_q208]  ;RETRACTION FEED RATE ~"
MOM_output_text "    Q256=[format "%0.2f" $mom_tnc_cycle_q256]  ;DIST FOR CHIP BRKNG"
}
set saved_cycle_param $param_list
}


#=============================================================
proc PB_CMD_TNC_CYCLE204 { } {
#=============================================================
### Обратная расточка Цикл204 ###
global mom_tnc_cycle_q200 ; # SET-UP CLEARANCE
global mom_tnc_cycle_q203 ; # SURFACE COORDINATE
global mom_tnc_cycle_q204 ; # 2ND SET-UP CLEARANCE
global mom_tnc_cycle_q214_o ; # "0. Нет","1. X-","2. Y-","3. X+","4. Y+"
global mom_tnc_cycle_q249 ; # "Глубина обратной цековки : Q249"
global mom_tnc_cycle_q250 ; # "Толщина детали : Q250"
global mom_tnc_cycle_q251 ; # "Осевой сдвиг : Q251"
global mom_tnc_cycle_q252 ; # "Толщина режущей кромки : Q252"
global mom_tnc_cycle_q253 ; # "Подача позиционирования : Q253"
global mom_tnc_cycle_q254 ; # "Подача резания : Q254"
global mom_tnc_cycle_q255 ; # "Задержка : Q255"
global mom_tnc_cycle_q336 ; # "Угол ориентации шпинделя : Q336"

global mom_cycle_feed_rate
global mom_cycle_orient
global mom_cycle_delay

if {![info exist mom_tnc_cycle_q249] || \
    ![info exist mom_tnc_cycle_q250] || \
    ![info exist mom_tnc_cycle_q251] || \
    ![info exist mom_tnc_cycle_q252] } { MOM_abort_event }

if {[info exist mom_tnc_cycle_q214_o]} {
     set mom_tnc_cycle_q214 [string index $mom_tnc_cycle_q214_o 0]
} else { set mom_tnc_cycle_q214 0 }
if {![info exist mom_tnc_cycle_q253]} { set mom_tnc_cycle_q253 $mom_cycle_feed_rate }
if {![info exist mom_tnc_cycle_q336] && [info exist mom_cycle_orient]} {
      set mom_tnc_cycle_q336 $mom_cycle_orient
} else { set mom_tnc_cycle_q336 0 }
if {![info exist mom_tnc_cycle_q255] && [info exist mom_cycle_delay]} {
     set mom_tnc_cycle_q255 $mom_cycle_delay
} else { set mom_tnc_cycle_q255 1 }
set mom_tnc_cycle_q254 $mom_cycle_feed_rate

global saved_cycle_param
set param_list [MOM_do_template cycle_save CREATE]

if { ![info exist saved_cycle_param] || $saved_cycle_param != $param_list } {
MOM_output_literal "CYCL DEF 204 BORE BACK ~"
MOM_output_text "    Q200=[format "%0.3f" $mom_tnc_cycle_q200]  ;SET-UP CLEARANCE ~"
MOM_output_text "    Q249=[format "%0.3f" $mom_tnc_cycle_q249]  ;COUNTERBORE DEPTH ~"
MOM_output_text "    Q250=[format "%0.3f" $mom_tnc_cycle_q250]  ;PART THIKNESS ~"
MOM_output_text "    Q251=[format "%0.3f" $mom_tnc_cycle_q251]  ;AXIAL SHIFT ~"
MOM_output_text "    Q252=[format "%0.3f" $mom_tnc_cycle_q252]  ;CUTTING EDGE LENGTH ~"
MOM_output_text "    Q253=[format "%0.0f" $mom_tnc_cycle_q253]  ;PREPOSITION FEED ~"
MOM_output_text "    Q254=[format "%0.0f" $mom_tnc_cycle_q254]  ;CUTTING FEED ~"
MOM_output_text "    Q255=[format "%0.1f" $mom_tnc_cycle_q255]  ;DWELL TIME AT DEPTH ~"
MOM_output_text "    Q203=[format "%0.3f" $mom_tnc_cycle_q203]  ;SURFACE COORDINATE ~"
MOM_output_text "    Q204=[format "%0.3f" $mom_tnc_cycle_q204]  ;2ND SET-UP CLEARANCE ~"
MOM_output_text "    Q214=[format "%0.0f" $mom_tnc_cycle_q214]  ;DEPART WAY ~"
MOM_output_text "    Q336=[format "%0.3f" $mom_tnc_cycle_q336]  ;ANGLE OF SPINDLE"
}
set saved_cycle_param $param_list

}


#=============================================================
proc PB_CMD_TNC_CYCLE205 { } {
#=============================================================
### Сверление Цикл205 ###
global mom_tnc_cycle_q200 ; # SET-UP CLEARANCE
global mom_tnc_cycle_q201 ; # DEPTH
global mom_tnc_cycle_q202 ; # PLUNGING DEPTH
global mom_tnc_cycle_q203 ; # SURFACE COORDINATE
global mom_tnc_cycle_q204 ; # 2ND SET-UP CLEARANCE
global mom_tnc_cycle_q205 ; # MIN. PLUNGING DEPTH
global mom_tnc_cycle_q206 ; # FEED RATE FOR PLNGNG
global mom_tnc_cycle_q211 ; # DWELL TIME AT DEPTH
global mom_tnc_cycle_q212 ; # DECREMENT
global mom_tnc_cycle_q253 ; # Q376 PREPOSITION FEED
global mom_tnc_cycle_q256 ; # MOVE BACK TO BREAK CHIP
global mom_tnc_cycle_q257 ; # PLUN. TO CHIP BREAK
global mom_tnc_cycle_q258 ; # CLEARANCE AT TOP
global mom_tnc_cycle_q259 ; # CLEARANCE AT BOTTOM~"
global mom_tnc_cycle_q379 ; # START DEPTH

global mom_cycle_step1 mom_cycle_step2 mom_cycle_step3
global mom_cycle_feed_to
global mom_cycle_feed_rate

if {![info exist mom_tnc_cycle_q202] || $mom_tnc_cycle_q202 == 0.0} {
     if {[info exist mom_cycle_step1] && $mom_cycle_step1 != 0.0} {
           set mom_tnc_cycle_q202 $mom_cycle_step1
     } else { set mom_tnc_cycle_q202 [expr abs($mom_cycle_feed_to)] }
} ; # Q202

if {![info exist mom_tnc_cycle_q212] || $mom_tnc_cycle_q212 == 0.0} {
    if {[info exist mom_cycle_step2] && $mom_cycle_step2 != 0.0} {
        set mom_tnc_cycle_q212 $mom_cycle_step2
    } else { set mom_tnc_cycle_q212 [expr $mom_tnc_cycle_q202*0.1] }
} ; # Q212

if {![info exist mom_tnc_cycle_q205] || $mom_tnc_cycle_q205 == 0.0} {
      if {[info exist mom_cycle_step3] && $mom_cycle_step3 != 0.0} {
           set mom_tnc_cycle_q205 $mom_cycle_step3
      } else { set mom_tnc_cycle_q205 $mom_tnc_cycle_q212 }
} ; # Q205

if {![info exist mom_tnc_cycle_q256]} { set mom_tnc_cycle_q256 0.5 }
if {![info exist mom_tnc_cycle_q257]} { set mom_tnc_cycle_q257 $mom_tnc_cycle_q205 }
if {![info exist mom_tnc_cycle_q258]} { set mom_tnc_cycle_q258 0.5 }
if {![info exist mom_tnc_cycle_q259]} { set mom_tnc_cycle_q259 0.5 }
if {![info exist mom_tnc_cycle_q253]} { set mom_tnc_cycle_q253 $mom_cycle_feed_rate }
if {![info exist mom_tnc_cycle_q379]} { set mom_tnc_cycle_q379 0 }

global saved_cycle_param
set param_list [MOM_do_template cycle_save CREATE]

if {![info exist saved_cycle_param] || $saved_cycle_param != $param_list } {
MOM_output_literal "CYCL DEF 205 UNIVERSAL DEEP DRILLING ~"
MOM_output_text "    Q200=[format "%0.3f" $mom_tnc_cycle_q200]  ;SET-UP CLEARANCE ~"
MOM_output_text "    Q201=[format "%0.3f" $mom_tnc_cycle_q201]  ;DEPTH ~"
MOM_output_text "    Q206=[format "%0.3f" $mom_tnc_cycle_q206]  ;FEED RATE FOR PLNGNG ~"
MOM_output_text "    Q202=[format "%0.3f" $mom_tnc_cycle_q202]  ;PLUNGING DEPTH ~"
MOM_output_text "    Q203=[format "%0.3f" $mom_tnc_cycle_q203]  ;SURFACE COORDINATE ~"
MOM_output_text "    Q204=[format "%0.3f" $mom_tnc_cycle_q204]  ;2ND SET-UP CLEARANCE ~"
MOM_output_text "    Q212=[format "%0.3f" $mom_tnc_cycle_q212]  ;DECREMENT ~"
MOM_output_text "    Q205=[format "%0.3f" $mom_tnc_cycle_q205]  ;MIN. PLUNGING DEPTH ~"
MOM_output_text "    Q258=[format "%0.1f" $mom_tnc_cycle_q258]  ;CLEARANCE AT TOP~"
MOM_output_text "    Q258=[format "%0.1f" $mom_tnc_cycle_q259]  ;CLEARANCE AT BOTTOM~"
MOM_output_text "    Q257=[format "%0.3f" $mom_tnc_cycle_q257]  ;PLUN. TO CHIP BREAK~"
MOM_output_text "    Q256=[format "%0.1f" $mom_tnc_cycle_q256]  ;MOVE BACK TO BREAK CHIP"
MOM_output_text "    Q211=[format "%0.1f" $mom_tnc_cycle_q211]  ;DWELL TIME AT DEPTH ~"
MOM_output_text "    Q379=[format "%0.3f" $mom_tnc_cycle_q379]  ;START DEPTH ~"
MOM_output_text "    Q253=[format "%0.0f" $mom_tnc_cycle_q253]  ;PREPOSITION FEED"
}
set saved_cycle_param $param_list
}


#=============================================================
proc PB_CMD_TNC_CYCLE208 { } {
#=============================================================
### Фрезеровка отверстий Цикл208 ###
global mom_tnc_cycle_q200 ; # SET-UP CLEARANCE
global mom_tnc_cycle_q201 ; # DEPTH
global mom_tnc_cycle_q203 ; # SURFACE COORDINATE
global mom_tnc_cycle_q204 ; # 2ND SET-UP CLEARANCE
global mom_tnc_cycle_q206 ; # FEED RATE FOR PLNGNG
global mom_tnc_cycle_q334 ; # "Осевое смещение : Q334"
global mom_tnc_cycle_q335 ; # TOGGLE Off "Диаметр отверстия : Q335"
global mom_tnc_cycle_q342 ; # TOGGLE Off "Предв. обработанный диаметр : Q342"
global mom_tnc_cycle_q351_o ; # "1. Попутное","2. Встречное"
global mom_tnc_cycle_q351
global mom_tnc_cycle_q335_defined
global mom_cycle_feature_diameter

if {[info exist mom_tnc_cycle_q335_defined] && $mom_tnc_cycle_q335_defined == 0} {
     if {[info exist mom_cycle_feature_diameter]} {
           set mom_tnc_cycle_q335 $mom_cycle_feature_diameter
     } elseif {![info exist mom_tnc_cycle_q335]} { set mom_tnc_cycle_q335 0 }
} elseif {![info exist mom_tnc_cycle_q335]} { set mom_tnc_cycle_q335 0 }
if {![info exist mom_tnc_cycle_q342]} { set mom_tnc_cycle_q342 [expr $mom_tnc_cycle_q335*0.9] }
if {[info exist mom_tnc_cycle_q351_o] && [string index $mom_tnc_cycle_q351_o 0] == 2 } {
       set mom_tnc_cycle_q351 "-1"
} else { set mom_tnc_cycle_q351 1 }

global saved_cycle_param
set param_list [MOM_do_template cycle_save CREATE]
append param_list " Q335=[format "%0.3f" $mom_tnc_cycle_q335]"

if { ![info exist saved_cycle_param] || $saved_cycle_param != $param_list } {
MOM_output_literal "CYCL DEF 208 BORE MILLING ~"
MOM_output_text "    Q200=[format "%0.3f" $mom_tnc_cycle_q200] ;SET-UP CLEARANCE ~"
MOM_output_text "    Q201=[format "%0.3f" $mom_tnc_cycle_q201] ;DEPTH ~"
MOM_output_text "    Q206=[format "%0.0f" $mom_tnc_cycle_q206] ;FEED RATE FOR PLNGNG ~"
MOM_output_text "    Q334=[format "%0.4f" $mom_tnc_cycle_q334] ;PLUNGING DEPTH ~"
MOM_output_text "    Q203=[format "%0.3f" $mom_tnc_cycle_q203] ;SURFACE COORDINATE ~"
MOM_output_text "    Q204=[format "%0.3f" $mom_tnc_cycle_q204] ;2ND SET-UP CLEARANCE ~"
MOM_output_text "    Q335=[format "%0.3f" $mom_tnc_cycle_q335] ;NOMINAL DIAMETER ~"
MOM_output_text "    Q342=[format "%0.3f" $mom_tnc_cycle_q342] ;ROUGHING DIAMETER ~"
MOM_output_text "    Q351=[format "%0.0f" $mom_tnc_cycle_q351] ;MILL DIRECTION"
}
set saved_cycle_param $param_list
#==================================

}


#=============================================================
proc PB_CMD_TNC_CYCLE240 { } {
#=============================================================
### CYCLE 240 CSINK ###
global mom_tnc_cycle_q200 ; # SET-UP CLEARANCE
global mom_tnc_cycle_q201 ; # DEPTH
global mom_tnc_cycle_q203 ; # SURFACE COORDINATE
global mom_tnc_cycle_q204 ; # 2ND SET-UP CLEARANCE
global mom_tnc_cycle_q206 ; # FEED RATE FOR PLNGNG
global mom_tnc_cycle_q211 ; # "Выдержка времени : Q211"
global mom_tnc_cycle_q343_o ; # "0. Глубина сверления","1. Диаметр зенковки"
global mom_tnc_cycle_q344 ; # "Диаметр зенковки"
#global mom_cycle_hole_dia
global mom_cycle_counter_sink_dia

if {[info exist mom_cycle_counter_sink_dia] && $mom_cycle_counter_sink_dia > 0.0 } {
       set mom_tnc_cycle_q344 $mom_cycle_counter_sink_dia
} else {
       set mom_tnc_cycle_q344 [expr abs($mom_tnc_cycle_q201 / 2)]
}
if {[info exist mom_tnc_cycle_q343_o]} {
     set mom_tnc_cycle_q343 [string index $mom_tnc_cycle_q343_o 0]
} else {
     set mom_tnc_cycle_q343 0
}

global saved_cycle_param
set param_list [MOM_do_template cycle_save CREATE]
append param_list " Q343=[format "%0.0f" $mom_tnc_cycle_q343]"
append param_list " Q343=[format "%0.3f" $mom_tnc_cycle_q344]"

if { ![info exist saved_cycle_param] || $saved_cycle_param != $param_list } {
MOM_output_literal "CYCL DEF 240 CSINKING ~"
MOM_output_text "    Q200=[format "%0.3f" $mom_tnc_cycle_q200]  ;SET-UP CLEARANCE ~"
MOM_output_text "    Q343=[format "%0.0f" $mom_tnc_cycle_q343]  ;0=DEPTH  1=DIAMETER ~"
MOM_output_text "    Q201=[format "%0.3f" $mom_tnc_cycle_q201]  ;DEPTH ~"
MOM_output_text "    Q344=[format "%0.3f" $mom_tnc_cycle_q344]  ;CSINK DIAMETER ~"
MOM_output_text "    Q206=[format "%0.0f" $mom_tnc_cycle_q206]  ;FEED RATE FOR PLNGNG ~"
MOM_output_text "    Q211=[format "%0.1f" $mom_tnc_cycle_q211]  ;DWELL TIME AT DEPTH"
MOM_output_text "    Q203=[format "%0.3f" $mom_tnc_cycle_q203]  ;SURFACE COORDINATE ~"
MOM_output_text "    Q204=[format "%0.3f" $mom_tnc_cycle_q204]  ;2ND SET-UP CLEARANCE ~"
}
set saved_cycle_param $param_list

}


#=============================================================
proc PB_CMD_TNC_CYCLE241 { } {
#=============================================================
### Ружейное сверло Цикл241 ###
global mom_tnc_cycle_q200 ; # SET-UP CLEARANCE
global mom_tnc_cycle_q201 ; # DEPTH
global mom_tnc_cycle_q203 ; # SURFACE COORDINATE
global mom_tnc_cycle_q204 ; # 2ND SET-UP CLEARANCE
global mom_tnc_cycle_q206 ; # FEED RATE FOR PLNGNG
global mom_tnc_cycle_q208 ; # "Подача вывода : Q208"
global mom_tnc_cycle_q211 ; # "Задержка внизу : Q211"
global mom_tnc_cycle_q253 ; # "Подача до предварительной глубины : Q253"
global mom_tnc_cycle_q379 ; # "Предварительная глубина : Q379"
global mom_tnc_cycle_q428 ; # "Скорость резания S об/мин : Q428"
global mom_tnc_cycle_q426_o ; # "1. M3","2. M4","3. M5" "Состояние шпинделя при выходе : Q426"
global mom_tnc_cycle_q427 ; # "Скорость при выходе S об/мин : Q427"
global mom_tnc_cycle_q429_b ; # "True" "Включить СОЖ в начале : Q429"
global mom_tnc_cycle_q430_b ; # "False" "Выключить СОЖ внизу : Q430"

global mom_tnc_cycle_q426
global mom_tnc_cycle_q429
global mom_tnc_cycle_q430
global mom_coolant_code
global mom_cycle_feed_rate
global mom_spindle_speed

if {![info exist mom_coolant_code(THRU)]} { set mom_coolant_code(THRU) "8" }
if {![info exist mom_coolant_code(OFF)]} { set mom_coolant_code(OFF) "9" }
if {[info exist mom_tnc_cycle_q426_o]} {
     set mom_tnc_cycle_q426 [expr [string index $mom_tnc_cycle_q426_o 0] + 2]
} else { set mom_tnc_cycle_q426 3 }
if {[info exist mom_tnc_cycle_q429_b] && $mom_tnc_cycle_q429_b == "TRUE" } {
      set mom_tnc_cycle_q429 $mom_coolant_code(THRU)
} else { set mom_tnc_cycle_q429 $mom_coolant_code(OFF) }
if {[info exist mom_tnc_cycle_q430_b] && $mom_tnc_cycle_q430_b == "TRUE" } {
      set mom_tnc_cycle_q430 $mom_coolant_code(OFF)
} else { set mom_tnc_cycle_q430 $mom_coolant_code(THRU) }

if {![info exist mom_tnc_cycle_q253]} { set mom_tnc_cycle_q253 0 }
if {![info exist mom_tnc_cycle_q379]} { set mom_tnc_cycle_q379 0 }
if {![info exist mom_tnc_cycle_q208]} { set mom_tnc_cycle_q208 $mom_cycle_feed_rate }
if {![info exist mom_tnc_cycle_q428] || $mom_tnc_cycle_q428 == 0.0 } { set mom_tnc_cycle_q428 $mom_spindle_speed }
if {![info exist mom_tnc_cycle_q427]} { set mom_tnc_cycle_q427 0 }

global saved_cycle_param
set param_list [MOM_do_template cycle_save CREATE]

if {![info exist saved_cycle_param] || $saved_cycle_param != $param_list } {
MOM_output_literal "CYCL DEF 241 GUN DRILL ~"
MOM_output_text "    Q200=[format "%0.3f" $mom_tnc_cycle_q200]  ;SET-UP CLEARANCE ~"
MOM_output_text "    Q201=[format "%0.3f" $mom_tnc_cycle_q201]  ;DEPTH ~"
MOM_output_text "    Q206=[format "%0.0f" $mom_tnc_cycle_q206]  ;FEED RATE FOR PLNGNG ~"
MOM_output_text "    Q211=[format "%0.1f" $mom_tnc_cycle_q211]  ;DWELL TIME AT DEPTH ~"
MOM_output_text "    Q203=[format "%0.3f" $mom_tnc_cycle_q203]  ;SURFACE COORDINATE ~"
MOM_output_text "    Q204=[format "%0.3f" $mom_tnc_cycle_q204]  ;2ND SET-UP CLEARANCE ~"
MOM_output_text "    Q379=[format "%0.3f" $mom_tnc_cycle_q379]  ;PREDRILLED DEPTH ~"
MOM_output_text "    Q253=[format "%0.0f" $mom_tnc_cycle_q253]  ;PREPOSITION FEED ~"
MOM_output_text "    Q208=[format "%0.0f" $mom_tnc_cycle_q208]  ;RETRACTION FEED RATE ~"
MOM_output_text "    Q426=[format "%0.0f" $mom_tnc_cycle_q426]  ;SPINDLE DIRECTION ~"
MOM_output_text "    Q427=[format "%0.0f" $mom_tnc_cycle_q427]  ;ENGAGE/RETRACT SPINDLE SPEED ~"
MOM_output_text "    Q428=[format "%0.0f" $mom_tnc_cycle_q428]  ;CUT SPINDLE SPEED ~"
MOM_output_text "    Q429=[format "%0.0f" $mom_tnc_cycle_q429]  ;COOLANT ON ~"
MOM_output_text "    Q430=[format "%0.0f" $mom_tnc_cycle_q430]  ;COOLANT OFF"
}
set saved_cycle_param $param_list

}


#=============================================================
proc PB_CMD_TNC_CYCLE257 { } {
#=============================================================
### Фрезеровка бобышки Цикл257 ###
global mom_tnc_cycle_q200 ; # SET-UP CLEARANCE
global mom_tnc_cycle_q201 ; # DEPTH
global mom_tnc_cycle_q202 ; # "Осевой шаг : Q202"
global mom_tnc_cycle_q203 ; # SURFACE COORDINATE
global mom_tnc_cycle_q204 ; # 2ND SET-UP CLEARANCE
global mom_tnc_cycle_q206 ; # TOGGLE Off "Подача погружения : Q206"
global mom_tnc_cycle_q207 ; # FEED RATE
global mom_tnc_cycle_q222 ; # TOGGLE Off "Диаметр заготовки : Q222"
global mom_tnc_cycle_q223 ; # TOGGLE Off "Диаметр : Q223"
global mom_tnc_cycle_q223_defined
global mom_tnc_cycle_q351_o ; # "1. Попутное","2. Встречное"
global mom_tnc_cycle_q351
global mom_tnc_cycle_q368 ; # "Припуск на сторону : Q368"
global mom_tnc_cycle_q370 ; # TOGGLE Off "Коэффициент перекрытия инструмента( 0.1 - 2.0 ) : Q370"

global mom_cycle_feed_rate
global mom_cycle_feature_diameter

### Var: mom_feature_type_name = NXBOSS

if {![info exist mom_tnc_cycle_q202]} { set mom_tnc_cycle_q202 0.25 }
if {[info exist mom_tnc_cycle_q223_defined] && $mom_tnc_cycle_q223_defined == 0} {
     if {[info exist mom_cycle_feature_diameter]} {
           set mom_tnc_cycle_q223 $mom_cycle_feature_diameter
     } elseif {![info exist mom_tnc_cycle_q223]} { set mom_tnc_cycle_q223 0 }
} elseif {![info exist mom_tnc_cycle_q223]} { set mom_tnc_cycle_q223 0 }
if {![info exist mom_tnc_cycle_q222]} { set mom_tnc_cycle_q222 [expr $mom_tnc_cycle_q223+0.5] }
if {[info exist mom_tnc_cycle_q351_o] && [string index $mom_tnc_cycle_q351_o 0] == 2 } {
       set mom_tnc_cycle_q351 "-1"
} else { set mom_tnc_cycle_q351 1 }
if {![info exist mom_tnc_cycle_q207]} { set mom_tnc_cycle_q207 $mom_cycle_feed_rate }
if {![info exist mom_tnc_cycle_q206]} { set mom_tnc_cycle_q206 $mom_cycle_feed_rate }
if {![info exist mom_tnc_cycle_q368]} { set mom_tnc_cycle_q368 0 }
if {![info exist mom_tnc_cycle_q370]} { set mom_tnc_cycle_q370 1 }

global saved_cycle_param
set param_list [MOM_do_template cycle_save CREATE]

if { ![info exist saved_cycle_param] || $saved_cycle_param != $param_list } {
MOM_output_literal "CYCL DEF 257 BOSS MILLING ~"
MOM_output_text "    Q223=[format "%0.3f" $mom_tnc_cycle_q223] ;DIAMETER ~"
MOM_output_text "    Q222=[format "%0.3f" $mom_tnc_cycle_q222] ;BLANK DIAMETER ~"
MOM_output_text "    Q368=[format "%0.3f" $mom_tnc_cycle_q368] ;SIDE ALLOWANCE ~"
MOM_output_text "    Q207=[format "%0.0f" $mom_tnc_cycle_q207] ;FEED RATE ~"
MOM_output_text "    Q351=[format "%0.0f" $mom_tnc_cycle_q351] ;CUT DIRECTION"
MOM_output_text "    Q201=[format "%0.3f" $mom_tnc_cycle_q201] ;DEPTH ~"
MOM_output_text "    Q202=[format "%0.3f" $mom_tnc_cycle_q202] ;PLUNGING DEPTH ~"
MOM_output_text "    Q206=[format "%0.0f" $mom_tnc_cycle_q206] ;FEED RATE FOR PLNGNG ~"
MOM_output_text "    Q200=[format "%0.3f" $mom_tnc_cycle_q200] ;SET-UP CLEARANCE ~"
MOM_output_text "    Q203=[format "%0.3f" $mom_tnc_cycle_q203] ;SURFACE COORDINATE ~"
MOM_output_text "    Q204=[format "%0.3f" $mom_tnc_cycle_q204] ;2ND SET-UP CLEARANCE ~"
MOM_output_text "    Q370=[format "%0.3f" $mom_tnc_cycle_q370] ;TOOL OVERLAP "
}
set saved_cycle_param $param_list

}


#=============================================================
proc PB_CMD_TNC_CYCLE262 { } {
#=============================================================
### Фрезеровка внутренней резьбы Цикл262
global mom_tnc_cycle_q200 ; # SET-UP CLEARANCE
global mom_tnc_cycle_q201 ; # DEPTH
global mom_tnc_cycle_q203 ; # SURFACE COORDINATE
global mom_tnc_cycle_q204 ; # 2ND SET-UP CLEARANCE
global mom_tnc_cycle_q207 ; # FEED RATE FOR MILLING
global mom_tnc_cycle_q335 ; # TOGGLE Off "Наружный диаметр : Q335"
global mom_tnc_cycle_q239_s ; # "1. Правая","2. Левая"
global mom_tnc_cycle_q239_o ; # "Выбор шага резьбы" "1. Из модели","2. Из инструмента","3. Из диалога цикла ( Q239 )"
global mom_tnc_cycle_q239 ; # TOGGLE Off "Шаг : Q239"
global mom_tnc_cycle_q355 ; # "1-Полная спираль / 0-Один виток / >1-Несколько шагов / : Q355"
global mom_tnc_cycle_q253 ; # "Подача подхода : Q253"
global mom_tnc_cycle_q351 ; # CUT DIRECTION
global mom_tnc_cycle_q239_defined
global mom_tnc_cycle_q335_defined

global mom_tool_type
global mom_cycle_feed_rate
global mom_tool_pitch
global mom_feature_type_name
global mom_cycle_thread_pitch
global mom_cycle_thread_right_handed
global mom_cycle_feature_diameter
global mom_cycle_thread_major_diameter

if {[info exist mom_tnc_cycle_q335_defined] && $mom_tnc_cycle_q335_defined == 0} {
     if {[info exist mom_cycle_thread_major_diameter]} {
           set mom_tnc_cycle_q335 $mom_cycle_thread_major_diameter
     } elseif {![info exist mom_tnc_cycle_q335]} { set mom_tnc_cycle_q335 0 }
} elseif {![info exist mom_tnc_cycle_q335]} { set mom_tnc_cycle_q335 0 }

if {[info exist mom_tnc_cycle_q239_o]} {
     set pitch_source [string index $mom_tnc_cycle_q239_o 0]
} else { set pitch_source 1 }

if { $pitch_source == 1 } {
     if {[info exist mom_feature_type_name] && \
         $mom_feature_type_name == "NXHOLETHREAD" && \
              [info exist mom_cycle_thread_pitch] && \
                        $mom_cycle_thread_pitch > 0.0 } {
           set mom_tnc_cycle_q239 $mom_cycle_thread_pitch
     } else { set pitch_source 2 }
} ; # pitch from model

if { $pitch_source == 2 } {
     if { $mom_tool_type == "Thread Mill" && \
              [info exist mom_tool_pitch] && \
                             $mom_tool_pitch > 0.0 } {
     set mom_tnc_cycle_q239 $mom_tool_pitch
     } else { set pitch_source 3 }
} ; # pitch from tool

if { $pitch_source == 3 } {
     if {[info exist mom_tnc_cycle_q239_defined] && \
                $mom_tnc_cycle_q239_defined == 1 && \
                            $mom_tnc_cycle_q239 > 0.0 } {
          # empty. mom_tnc_cycle_q239 definrd in dialog
     } else { MOM_abort "Thread Pitch NOT defined" }
} ; # pitch from dialog

if {[info exist mom_cycle_thread_right_handed] && \
          $mom_cycle_thread_right_handed != "TRUE" } {
     set mom_tnc_cycle_q239 [expr -abs($mom_tnc_cycle_q239)]
} elseif { [info exist mom_tnc_cycle_q239_s] && \
           [string index $mom_tnc_cycle_q239_s 0] == 2 } {
     set mom_tnc_cycle_q239 [expr -abs($mom_tnc_cycle_q239)]
} else {
     set mom_tnc_cycle_q239 [expr abs($mom_tnc_cycle_q239)]
  }

set mom_tnc_cycle_q207 $mom_cycle_feed_rate
if {![info exist mom_tnc_cycle_q355]} { set mom_tnc_cycle_q355 1 }
if {![info exist mom_tnc_cycle_q253]} { set mom_tnc_cycle_q253 $mom_cycle_feed_rate }
if {![info exist mom_tnc_cycle_q351]} { set mom_tnc_cycle_q351 1 }

global saved_cycle_param
set param_list [MOM_do_template cycle_save CREATE]
append param_list "Q335=[format "%0.3f" $mom_tnc_cycle_q335] Q239=[format "%0.4f" $mom_tnc_cycle_q239]"

if { ![info exist saved_cycle_param] || $saved_cycle_param != $param_list } {
MOM_output_literal "CYCL DEF 262 THREAD MILLING ~"
MOM_output_text "    Q335=[format "%0.3f" $mom_tnc_cycle_q335]  ;NOMINAL DIAMETER ~"
MOM_output_text "    Q239=[format "%0.4f" $mom_tnc_cycle_q239]  ;THREAD PITCH ~"
MOM_output_text "    Q201=[format "%0.3f" $mom_tnc_cycle_q201]  ;DEPTH OF THREAD ~"
MOM_output_text "    Q355=[format "%0.0f" $mom_tnc_cycle_q355]  ;THREADS PER STEP ~"
MOM_output_text "    Q253=[format "%0.0f" $mom_tnc_cycle_q253]  ;F PRE-POSITIONING ~"
MOM_output_text "    Q351=[format "%0.0f" $mom_tnc_cycle_q351]  ;CLIMB OR UP-CUT ~"
MOM_output_text "    Q200=[format "%0.3f" $mom_tnc_cycle_q200]  ;SET-UP CLEARANCE ~"
MOM_output_text "    Q203=[format "%0.3f" $mom_tnc_cycle_q203]  ;SURFACE COORDINATE ~"
MOM_output_text "    Q204=[format "%0.3f" $mom_tnc_cycle_q204]  ;2ND SET-UP CLEARANCE ~"
MOM_output_text "    Q207=[format "%0.0f" $mom_tnc_cycle_q207]  ;FEED RATE FOR MILLNG"
}
set saved_cycle_param $param_list
#==================================
global mom_toolpath_cutting_time PI
set bmg_len [expr abs($mom_tnc_cycle_q201 - $mom_tnc_cycle_q200) / $mom_tnc_cycle_q239 * $PI * $mom_tnc_cycle_q335]
set mom_toolpath_cutting_time [expr $mom_toolpath_cutting_time + $bmg_len]

}


#=============================================================
proc PB_CMD_TNC_CYCLE267 { } {
#=============================================================
### BossThrMill_TNC "iTNC530 : Фрезеровка наружной резьбы Цикл267"
global mom_tnc_cycle_q335 ; # TOGGLE Off "Внутренний диаметр : Q335"
global mom_tnc_cycle_q239_s ; # "1. Правая","2. Левая"
global mom_tnc_cycle_q239_o ; # "1. Из модели","2. Из инструмента","3. Из диалога цикла ( Q239 )"
global mom_tnc_cycle_q239 ; # TOGGLE Off "Шаг : Q239"
global mom_tnc_cycle_q239_defined
global mom_tnc_cycle_q355 ; # "1-Полная спираль / 0-Один виток / >1-Несколько шагов / : Q355"
global mom_tnc_cycle_q351_o ; # "1. Попутное","2. Встречное"
global mom_tnc_cycle_q358 ; # TOGGLE Off "Фаска : Осевой сдвиг инструмента : Q358"
global mom_tnc_cycle_q359 ; # TOGGLE Off "Фаска : Радиальный сдвиг инструмента : Q359"
global mom_tnc_cycle_q254 ; # TOGGLE Off "Фаска : Подача обработки : Q254"
global mom_tnc_cycle_q253 ; # "Подача позиционирования : Q253"
global mom_tnc_cycle_q335_defined

global mom_tnc_cycle_q201
global mom_tnc_cycle_q200
global mom_tnc_cycle_q203
global mom_tnc_cycle_q204

global mom_tool_type
global mom_cycle_feed_rate
global mom_tool_pitch
global mom_feature_type_name
global mom_cycle_thread_pitch
global mom_cycle_thread_right_handed
global mom_cycle_feature_diameter
global mom_cycle_thread_major_diameter
global mom_cycle_thread_minor_diameter

if {[info exist mom_tnc_cycle_q335_defined] && $mom_tnc_cycle_q335_defined == 0} {
     if {[info exist mom_cycle_thread_minor_diameter]} {
           set mom_tnc_cycle_q335 $mom_cycle_thread_minor_diameter
     } elseif {![info exist mom_tnc_cycle_q335]} { set mom_tnc_cycle_q335 0 }
} elseif {![info exist mom_tnc_cycle_q335]} { set mom_tnc_cycle_q335 0 }

if {[info exist mom_tnc_cycle_q239_o]} {
     set pitch_source [string index $mom_tnc_cycle_q239_o 0]
} else { set pitch_source 1 }

if { $pitch_source == 1 } {
     if {[info exist mom_feature_type_name] && \
         $mom_feature_type_name == "NXBOSSTHREAD" && \
              [info exist mom_cycle_thread_pitch] && \
                        $mom_cycle_thread_pitch > 0.0 } {
           set mom_tnc_cycle_q239 $mom_cycle_thread_pitch
     } else { set pitch_source 2 }
} ; # pitch from model

if { $pitch_source == 2 } {
     if { $mom_tool_type == "Thread Mill" && \
              [info exist mom_tool_pitch] && \
                             $mom_tool_pitch > 0.0 } {
     set mom_tnc_cycle_q239 $mom_tool_pitch
     } else { set pitch_source 3 }
} ; # pitch from tool

if { $pitch_source == 3 } {
     if {[info exist mom_tnc_cycle_q239_defined] && \
                $mom_tnc_cycle_q239_defined == 1 && \
                            $mom_tnc_cycle_q239 > 0.0 } {
          # empty. mom_tnc_cycle_q239 definrd in dialog
     } else { MOM_abort "Thread Pitch NOT defined" }
} ; # pitch from dialog

if {[info exist mom_cycle_thread_right_handed] && \
          $mom_cycle_thread_right_handed != "TRUE" } {
     set mom_tnc_cycle_q239 [expr -abs($mom_tnc_cycle_q239)]
} elseif { [info exist mom_tnc_cycle_q239_s] && \
           [string index $mom_tnc_cycle_q239_s 0] == 2 } {
     set mom_tnc_cycle_q239 [expr -abs($mom_tnc_cycle_q239)]
} else {
     set mom_tnc_cycle_q239 [expr abs($mom_tnc_cycle_q239)]
  }

set mom_tnc_cycle_q207 $mom_cycle_feed_rate
if {![info exist mom_tnc_cycle_q355]} { set mom_tnc_cycle_q355 1 }
if {![info exist mom_tnc_cycle_q253]} { set mom_tnc_cycle_q253 $mom_cycle_feed_rate }

if {[info exists mom_tnc_cycle_q351_o]} {
       set mom_tnc_cycle_q351 [string index $mom_tnc_cycle_q351_o 0]
} elseif {![info exist mom_tnc_cycle_q351]} {
        set mom_tnc_cycle_q351 1
  }

if {![info exists mom_tnc_cycle_q358]} {
        set mom_tnc_cycle_q358 0
   }
if {![info exists mom_tnc_cycle_q359]} {
        set mom_tnc_cycle_q359 0
   }
if { [EQ_is_equal $mom_tnc_cycle_q358 0] || [EQ_is_equal $mom_tnc_cycle_q359 0] } {
        set mom_tnc_cycle_q358 0
        set mom_tnc_cycle_q359 0
        set mom_tnc_cycle_q254 0

} elseif {![info exists mom_tnc_cycle_q254] || [EQ_is_equal $mom_tnc_cycle_q254 0]} {
       set mom_tnc_cycle_q254 $mom_cycle_feed_rate
   }

global saved_cycle_param
set param_list [MOM_do_template cycle_save CREATE]
append param_list "Q335=[format "%0.3f" $mom_tnc_cycle_q335] Q239=[format "%0.4f" $mom_tnc_cycle_q239]"

if { $mom_tool_type != "Thread Mill" } {
      PAUSE "The INCORRECT tool for operation"
   }

#===============================

if { ![info exist saved_cycle_param] || $saved_cycle_param != $param_list } {
MOM_output_literal "CYCL DEF 267 BOSS TREAD MILIING ~"
MOM_output_text "    Q335=[format %0.3f $mom_tnc_cycle_q335] ;NOMINAL DIAMETER ~"
MOM_output_text "    Q239=[format %0.3f $mom_tnc_cycle_q239] ;THREAD PITCH ~"
MOM_output_text "    Q201=[format %0.3f $mom_tnc_cycle_q201] ;DEPTH OF THREAD ~"
MOM_output_text "    Q355=$mom_tnc_cycle_q355 ;THREADS PER STEP ~"
MOM_output_text "    Q253=[format %0.0f $mom_tnc_cycle_q253] ;F PRE-POSITIONING ~"
MOM_output_text "    Q351=$mom_tnc_cycle_q351 ;CLIMB OR UP-CUT ~"
MOM_output_text "    Q200=[format %0.3f $mom_tnc_cycle_q200] ;SET-UP CLEARANCE ~"
MOM_output_text "    Q358=[format %0.3f $mom_tnc_cycle_q358] ; FAZE AXIAL ~"
MOM_output_text "    Q359=[format %0.3f $mom_tnc_cycle_q359] ; FAZE RADIAL ~"
MOM_output_text "    Q203=[format %0.3f $mom_tnc_cycle_q203] ;SURFACE COORDINATE ~"
MOM_output_text "    Q204=[format %0.3f $mom_tnc_cycle_q204] ;2ND SET-UP CLEARANCE ~"
MOM_output_text "    Q254=[format %0.0f $mom_tnc_cycle_q254] ; FAZE FEED ~"
MOM_output_text "    Q207=[format %0.0f $mom_tnc_cycle_q207] ;FEED RATE FOR MILLNG"
}
set saved_cycle_param $param_list
#==================================
# global mom_toolpath_cutting_time PI

# set bmg_len [expr abs($mom_cycle_feed_to - $mom_cycle_rapid_to) / $mom_Q239_pitch * $PI * $mom_Q335_diameter]
# set mom_toolpath_cutting_time [expr $mom_toolpath_cutting_time + $bmg_len]

}


#=============================================================
proc PB_CMD_TNC_CYCLE_call { } {
#=============================================================
# CYCLE Drill_Csink_TNC  "iTNC530 : Csink Cycle240"
# CYCLE Drill_Deep_TNC "iTNC530 : Drill Cycle200"
# CYCLE Drill_Breakchip_TNC "iTNC530 : Drill Cycle203"
# CYCLE Drill_Deep_Breakchip_TNC "iTNC530 : Drill Cycle205"
# CYCLE Drill_Bore_Dwell_TNC "iTNC530 : Reaming Cycle201"
# CYCLE Drill_Boring_TNC "iTNC530 : Boring Cycle202"
# CYCLE Drill_Tap_TNC "iTNC530 : Tap Cycle206 207 209"
# CYCLE Drill_Bore_Back_TNC "iTNC530 : Bore Back Cycle204"
# CYCLE Drill_Gun_TNC "iTNC530 : Gun Drill Cycle241"
# CYCLE Drill_HoleMill_TNC "iTNC530 : Boremilling Cycle208"
# CYCLE Drill_HoleThrMill_TNC "iTNC530 : Hole Thread_Milling Cycle262"
# CYCLE Drill_BossMill_TNC "iTNC530 : Boss Milling Cycle257"
# CYCLE Drill_BossThrMill_TNC "iTNC530 : Boss Thread_Milling Cycle267"

uplevel #0 {
#===================================
proc MOM_Drill_Csink_TNC_move { } {
#===================================
  MOM_drill_csink_tnc_move
}
#===================================
proc MOM_drill_deep_tnc_move { } {
#===================================
  MOM_drill_dwell_move
}
#===================================
proc MOM_drill_breakchip_tnc_move { } {
#===================================
  MOM_drill_break_chip_move
}
#===================================
proc MOM_drill_deep_breakchip_tnc_move { } {
#===================================
  MOM_drill_deep_breakchip_tnc_move
}
#===================================
proc MOM_drill_bore_dwell_tnc_move { } {
#===================================
  MOM_bore_dwell_move
}
#===================================
proc MOM_drill_boring_tnc_move { } {
#===================================
  MOM_bore_move
}
#===================================
proc MOM_drill_tap_tnc_move { } {
#===================================
  MOM_tap_move
}
#===================================
proc MOM_drill_bore_back_tnc_move { } {
#===================================
  MOM_bore_back_move
}
#===================================
proc MOM_drill_gun_tnc_move { } {
#===================================
  MOM_gun_drill_move
}

#===================================
### System
#===================================
proc MOM_tap_deep_move { } {
#===================================
  global mom_tnc_cycle_var
  set mom_tnc_cycle_var "2. Несколько проходов (CYCLE 209)"
  MOM_tap_move
}
#===================================
proc MOM_tap_float_move { } {
#===================================
  global mom_tnc_cycle_var
  set mom_tnc_cycle_var "3. Плавающий патрон (CYCLE 206)"
  MOM_tap_move
}
#===================================
proc MOM_tap_break_chip_move { } {
#===================================
  global mom_tnc_cycle_var
  set mom_tnc_cycle_var "2. Несколько проходов (CYCLE 209)"
  MOM_tap_move
}
#===================================
} ; # uplevel

}


#=============================================================
proc PB_CMD_TNC_CYCLE_map { } {
#=============================================================
### For Example <$mom_cycle_type = Drill_Csink_TNC>
### $mom_operation_type == "Hole Making"
### $mom_operation_type == "Point to Point"
### string match "*Drill*" $mom_operation_type

#################  Cycle Events #############

global mom_tnc_cycle_q200 ; # SET-UP CLEARANCE
global mom_tnc_cycle_q201 ; # DEPTH
global mom_tnc_cycle_q203 ; # SURFACE COORDINATE
global mom_tnc_cycle_q204 ; # 2ND SET-UP CLEARANCE
global mom_tnc_cycle_q206 ; # FEED RATE FOR PLNGNG
global mom_tnc_cycle_q210 ; # "Задержка вверху : Q210"
global mom_tnc_cycle_q211 ; # "Выдержка времени : Q211"

global mom_pos
global mom_cycle_rapid_to mom_cycle_rapid_to_pos
global mom_cycle_feed_to mom_cycle_feed_to_pos
global mom_cycle_retract_to mom_cycle_retract_to_pos
global mom_cycle_delay
global mom_cycle_feed_rate
global mom_cycle_step1 mom_cycle_step2 mom_cycle_step3
global mom_operation_type

set mom_tnc_cycle_q200 $mom_cycle_rapid_to
set mom_tnc_cycle_q201 $mom_cycle_feed_to
# set mom_tnc_cycle_q203 $mom_pos(2)
set mom_tnc_cycle_q203 [expr (-1 * $mom_cycle_rapid_to)]
set mom_tnc_cycle_q204 $mom_cycle_retract_to
set mom_tnc_cycle_q206 $mom_cycle_feed_rate

if {![info exist mom_tnc_cycle_q211] && [info exist mom_cycle_delay]} {
     set mom_tnc_cycle_q211 $mom_cycle_delay
} else { set mom_tnc_cycle_q211 0.5 }
if {![info exist mom_tnc_cycle_q210]} { set mom_tnc_cycle_q210 0 }

}


#=============================================================
proc PB_CMD_TNC_CYCLE_tap { } {
#=============================================================
### Нарезание резьбы метчиком. Циклы 206 207 209 ###
global mom_tnc_cycle_q200 ; # SET-UP CLEARANCE
global mom_tnc_cycle_q201 ; # DEPTH
global mom_tnc_cycle_q203 ; # SURFACE COORDINATE
global mom_tnc_cycle_q204 ; # 2ND SET-UP CLEARANCE
global mom_tnc_cycle_q211 ; # "Задержка внизу (Cycle206 Q211)"
global mom_tnc_cycle_q239_b ; # "False" "Шаг из данных модели"
global mom_tnc_cycle_q239 ; # "Шаг резьбы : Q239"
global mom_tnc_cycle_q257 ; # "Врезание в глубину (Cycle209 Q257)"
global mom_tnc_cycle_q256 ; # "Отвод для слома стружки (Cycle209 Q256)"
global mom_tnc_cycle_q336 ; # "Стартовый угол шпинделя (Cycle209 Q336)"
global mom_tnc_cycle_q403 ; # "Коэффициент S при выводе (Cycle209 Q403)"
global mom_tnc_cycle_var ; # "1. Один проход (CYCLE 207)","2. Несколько проходов (CYCLE 209)","3. Плавающий патрон (CYCLE 206)"
global mom_tnc_cycle_q239_b ; #  "False" "Pitch From Model"
global mom_tnc_cycle_q206 ; # FEED
global mom_tnc_cycle_q239_o ; # "Выбор шага резьбы" "1. Из модели","2. Из инструмента","3. Из диалога цикла ( Q239 )"

global mom_cycle_feed_rate
global mom_cycle_feed_rate_per_rev
global mom_tool_pitch
global mom_tool_type
global mom_spindle_direction
global mom_feature_type_name
global mom_cycle_thread_pitch
global mom_cycle_thread_right_handed
global mom_cycle_step1
global mom_motion_event
global mom_cycle_feed_to mom_cycle_rapid_to
global mom_cycle_taps_number mom_tap_floating_holder

if {[info exist mom_tnc_cycle_q239_o]} {
     set pitch_source [string index $mom_tnc_cycle_q239_o 0]
} else { set pitch_source 1 }

if {[info exist mom_tnc_cycle_q239_b] && $mom_tnc_cycle_q239_b != "TRUE" } {
      set pitch_source 2
   }

if { $pitch_source == 1 } {
     if {[info exist mom_feature_type_name] && \
         $mom_feature_type_name == "NXHOLETHREAD" && \
              [info exist mom_cycle_thread_pitch] && \
                        $mom_cycle_thread_pitch > 0.0 } {
           set mom_tnc_cycle_q239 $mom_cycle_thread_pitch
     } else { set pitch_source 2 }
} ; # pitch from model

## $mom_tool_type == "Thread Mill"
if { $pitch_source == 2 } {
     if { [info exist mom_tool_pitch] && \
                             $mom_tool_pitch > 0.0 } {
           set mom_tnc_cycle_q239 $mom_tool_pitch
     } else { set pitch_source 3 }
} ; # pitch from tool

if { $pitch_source == 3 } {
     if {[info exist mom_tnc_cycle_q239_defined] && \
                $mom_tnc_cycle_q239_defined == 1 && \
                            $mom_tnc_cycle_q239 > 0.0 } {
          # empty. mom_tnc_cycle_q239 definrd in dialog
     } else { MOM_abort "Thread Pitch NOT defined" }
} ; # pitch from dialog

if {[info exist mom_cycle_thread_right_handed] } {
     if { $mom_cycle_thread_right_handed == "TRUE" && \
          $mom_spindle_direction == "CCLW" } {
          MOM_abort
     } elseif { $mom_cycle_thread_right_handed != "TRUE" && \
          $mom_spindle_direction == "CLW" } {
          MOM_abort
      }
} ; # Right Handed

if { $mom_spindle_direction == "CCLW" } { set mom_tnc_cycle_q239 [expr -abs($mom_tnc_cycle_q239)] }
if {![info exist mom_tnc_cycle_q403]} { set mom_tnc_cycle_q403 1 }
if {![info exist mom_tnc_cycle_q257]} {
     if {[info exist mom_cycle_step1] && $mom_cycle_step1 > 0.0 } {
          set mom_tnc_cycle_q257 $mom_cycle_step1
     } elseif {[info exists mom_cycle_taps_number] && $mom_cycle_taps_number > 1 } {
          set mom_tnc_cycle_q257 [expr (abs($mom_cycle_feed_to)+abs($mom_cycle_rapid_to))/$mom_cycle_taps_number]
     } else { set mom_tnc_cycle_q257 0 }
} ; # Q257
if {![info exist mom_tnc_cycle_q256]} {
     if {[string match "*break*" $mom_motion_event] } {
           set mom_tnc_cycle_q256 1
     } else { set mom_tnc_cycle_q256 0 }
} ; # Q256
if {![info exist mom_tnc_cycle_q336]} { set mom_tnc_cycle_q336 0.0 }
if {[info exist mom_tnc_cycle_var]} {
     set cycle_variant [string index $mom_tnc_cycle_var 0]
} elseif {[info exists mom_tap_floating_holder] && $mom_tap_floating_holder == "TRUE" } {
     set cycle_variant 3
} elseif { $mom_tnc_cycle_q257 != 0 } {
     set cycle_variant 2
} else { set cycle_variant 1 }

global saved_cycle_param
MOM_force_block once cycle_save
set param_list [MOM_do_template cycle_save CREATE]
if {![info exist saved_cycle_param] || $saved_cycle_param != $param_list } {
  switch $cycle_variant {
    1 {
        MOM_output_literal "CYCL DEF 207 RIGID TAPPING ~"
        MOM_output_text "    Q200=[format "%0.3f" $mom_tnc_cycle_q200]  ;SET-UP CLEARANCE ~"
        MOM_output_text "    Q201=[format "%0.3f" $mom_tnc_cycle_q201]  ;DEPTH OF THREAD ~"
        MOM_output_text "    Q239=[format "%0.4f" $mom_tnc_cycle_q239]  ;THREAD PITCH ~"
        MOM_output_text "    Q203=[format "%0.3f" $mom_tnc_cycle_q203]  ;SURFACE COORDINATE ~"
        MOM_output_text "    Q204=[format "%0.3f" $mom_tnc_cycle_q204]  ;2ND SET-UP CLEARANCE"
      }
    2 {
        MOM_output_literal "CYCL DEF 209 TAPPING BREAK CHIP ~"
        MOM_output_text "    Q200=[format "%0.3f" $mom_tnc_cycle_q200]  ;SET-UP CLEARANCE ~"
        MOM_output_text "    Q201=[format "%0.3f" $mom_tnc_cycle_q201]  ;DEPTH OF THREAD ~"
        MOM_output_text "    Q239=[format "%0.4f" $mom_tnc_cycle_q239]  ;THREAD PITCH ~"
        MOM_output_text "    Q203=[format "%0.3f" $mom_tnc_cycle_q203]  ;SURFACE COORDINATE ~"
        MOM_output_text "    Q204=[format "%0.3f" $mom_tnc_cycle_q204]  ;2ND SET-UP CLEARANCE ~"
        MOM_output_text "    Q257=[format "%0.3f" $mom_tnc_cycle_q257]  ;GL.SWERL.PRI LOMANII ~"
        MOM_output_text "    Q256=[format "%0.3f" $mom_tnc_cycle_q256]  ;WYCHOD PRI LOMANII ~"
        MOM_output_text "    Q336=[format "%0.3f" $mom_tnc_cycle_q336]  ;UGOL SCHPINDEL ~"
        MOM_output_text "    Q403=[format "%0.3f" $mom_tnc_cycle_q403]  ;RETRACT RPM FACTOR"
      }
    3 {
        MOM_output_literal "CYCL DEF 206 TAPPING FLOAT ~"
        MOM_output_text "    Q200=[format "%0.3f" $mom_tnc_cycle_q200]  ;SET-UP CLEARANCE ~"
        MOM_output_text "    Q201=[format "%0.3f" $mom_tnc_cycle_q201]  ;DEPTH OF THREAD ~"
        MOM_output_text "    Q206=[format "%0.0f" $mom_tnc_cycle_q206]  ;FEED ~"
        MOM_output_text "    Q211=[format "%0.1f" $mom_tnc_cycle_q211]  ;DWELL TIME ~"
        MOM_output_text "    Q203=[format "%0.3f" $mom_tnc_cycle_q203]  ;SURFACE COORDINATE ~"
        MOM_output_text "    Q204=[format "%0.3f" $mom_tnc_cycle_q204]  ;2ND SET-UP CLEARANCE"
      }
  } ; # Switch
} ; # IF
set saved_cycle_param $param_list
MOM_force once M_spindle

VAR_GROUP_LIST mom_cycle_taps_number
VAR_GROUP_LIST mom_tap_floating_holder

}


#=============================================================
proc PB_CMD_TNC_cycle_off { } {
#=============================================================
global saved_cycle_param
if {[info exist saved_cycle_param]} { unset saved_cycle_param }

set param_delete_list {q200 q201 q202 q203 q204 q205 q206 q208 q210 q211 q212 q213 q214_o \
                       q222 q223 q239_b q239_s q239_o q239 q249 q250 q251 q252 q253 q254 \
                       q255 q256 q257 q258 q259 q334 q335 q336 q342 q343_o q351_o q351 \
                       q355 q358 q359 q368 q370 q379 q403 q426_o q427 q428 q429_b q430_b var}

foreach param $param_delete_list {
        set param mom_tnc_cycle_$param
        global $param
        if {[info exist $param]} { unset $param }
} ; # foreach

}


#=============================================================
proc PB_CMD_UPLEVEL_blk_form { } {
#=============================================================
uplevel #0 {

#==================================
proc MOM_tnc_blk_form { } {
#==================================
  MOM_blank_data
}

#==================================
proc MOM_blank_data { } {
#==================================
## "Определение заготовки"
global mom_blk_x_min ; # "X min"
global mom_blk_y_min ; # "Y min"
global mom_blk_z_min ; # "Z min"
global mom_blk_x_max ; # "X max"
global mom_blk_y_max ; # "Y max"
global mom_blk_z_max ; # "Z max"

    MOM_output_literal "BLK FORM 0.1 Z [format "X%0.1f Y%0.1f Z%0.1f" $mom_blk_x_min $mom_blk_y_min $mom_blk_z_min]"
    MOM_output_literal "BLK FORM 0.2 [format "X%0.1f Y%0.1f Z%0.1f" $mom_blk_x_max $mom_blk_y_max $mom_blk_z_max]"

    if {[info exists mom_blk_x_min] && \
          [info exixts mom_blk_y_min] && \
            [info exists mom_blk_z_min] && \
              [info exists mom_blk_x_max] && \
                [info exists mom_blk_y_max] && \
                   [info exists mom_blk_z_max] } {
       MOM_output_literal "BLK FORM 0.1 Z [format "X%0.1f Y%0.1f Z%0.1f" $mom_blk_x_min $mom_blk_y_min $mom_blk_z_min]"
       MOM_output_literal "BLK FORM 0.2 [format "X%0.1f Y%0.1f Z%0.1f" $mom_blk_x_max $mom_blk_y_max $mom_blk_z_max]"
    }
}

} ; #uplevel
}


#=============================================================
proc PB_CMD_UPLEVEL_cycles { } {
#=============================================================
uplevel #0 {

#==========================================
proc MOM_drill_text_move { } {
#==========================================
global mom_cycle_event_type

    if { $mom_cycle_event_type == "G208" } {
             MOM_drill_holemill_tnc_move
    } elseif { $mom_cycle_event_type == "G262" } {
             MOM_drill_holethrmill_tnc_move
    } elseif { $mom_cycle_event_type == "G257" } {
             MOM_drill_boss_milling_move
    } elseif { $mom_cycle_event_type == "G267" } {
             MOM_drill_boss_thread_milling_move
    }
}

#===================================
proc MOM_HoleMill_TNC { } {
#===================================
global mom_cycle_event_type
set mom_cycle_event_type G208
}

#===================================
proc MOM_HoleThrMill_TNC { } {
#===================================
global mom_cycle_event_type
set mom_cycle_event_type G262
}

#===================================
proc MOM_BossMill_TNC { } {
#===================================
## "iTNC530 : Фрезеровка бобышки Цикл257"
global mom_cycle_event_type
set mom_cycle_event_type G257
}

#=============================================
proc MOM_BossThrMill_TNC { } {
#=============================================
## "iTNC530 : Фрезеровка наружной резьбы Цикл267"
global mom_cycle_event_type
set mom_cycle_event_type G267
}

#=============================================
proc MOM_boss_milling { } {
#=============================================
## "Heidenhain : Круглая цапфа"
global mom_hm_diameter ; # "Диаметр бобышки"
global mom_hm_start_diameter ; # "Начальный диаметр"
global mom_hm_peck ; # "Шаг"
global mom_hm_side_allowance ; # Off "Чистовой припуск"
global mom_hm_direction ; # "Направление резания  ( 1 - попутное  / -1 - встречное )"
global mom_hm_overstep ; # "Перекрытие ( % от R инстр. )"

## "iTNC530 : Фрезеровка бобышки Цикл257"
global mom_tnc_cycle_q223 ; # Off "Диаметр : Q223"
global mom_tnc_cycle_q222 ; # Off "Диаметр заготовки : Q222"
global mom_tnc_cycle_q368 ; # "Припуск на сторону : Q368"
global mom_tnc_cycle_q202 ; # "Осевой шаг : Q202"
global mom_tnc_cycle_q206 ; # Off "Подача погружения : Q206"
global mom_tnc_cycle_q370 ; # Off "Коэффициент перекрытия инструмента( 0.1 - 2.0 ) : Q370"
global mom_tnc_cycle_q351_o ; # "1. Попутное","2. Встречное" "Направление резания : Q351"

    set mom_tnc_cycle_q223 $mom_hm_diameter
    set mom_tnc_cycle_q222 $mom_hm_start_diameter
    if { [info exists mom_hm_side_allowance] } {
          set mom_tnc_cycle_q368 $mom_hm_side_allowance
    } else { set mom_tnc_cycle_q368 0 }
    set mom_tnc_cycle_q202 $mom_hm_peck
    set mom_tnc_cycle_q370 $mom_hm_overstep
    if { $mom_hm_direction == "-1" } {
           set mom_tnc_cycle_q351_o 2
    } else { set mom_tnc_cycle_q351_o 1 }

global mom_cycle_event_type
set mom_cycle_event_type G257
}

#=============================================
proc MOM_boss_thread_milling { } {
#=============================================
## "Heidenhain : Фрезеровка наружной резьбы"
global mom_thr_diameter ; # "Диаметр резьбы"
global mom_thr_dir ; # "RIGHT","LEFT"
global mom_thr_pitch ; # "Шаг резьбы"
global mom_thr_mach_dir ; # "Направление резания  ( 1 - попутное  / -1 - встречное )"
global mom_thr_npitch ; # "0 = 1 виток / 1 = полная спираль / >1= сдвиг инструмента"

## "iTNC530 : Фрезеровка наружной резьбы Цикл267"
global mom_tnc_cycle_q335 ; # Off "Внутренний диаметр : Q335"
global mom_tnc_cycle_q239_s ; # "1. Правая","2. Левая"
global mom_tnc_cycle_q239_o ; # "1. Из модели","2. Из инструмента","3. Из диалога цикла ( Q239 )"
global mom_tnc_cycle_q239 ; # Off "Шаг : Q239"
global mom_tnc_cycle_q355 ; # "1-Полная спираль / 0-Один виток / >1-Несколько шагов / : Q355"
global mom_tnc_cycle_q351_o ; # "1. Попутное","2. Встречное" "Направление резания : Q351"
global mom_tnc_cycle_q358 ; # Off "Фаска : Осевой сдвиг инструмента : Q358"
global mom_tnc_cycle_q359 ; # Off "Фаска : Радиальный сдвиг инструмента : Q359"
global mom_tnc_cycle_q254 ; # Off "Фаска : Подача обработки : Q254"
global mom_tnc_cycle_q253 ; # "Подача позиционирования : Q253"

    set mom_tnc_cycle_q335 $mom_thr_diameter
    if { $mom_thr_dir == "LEFT" } {
          set mom_tnc_cycle_q239_s 2
    } else { set mom_tnc_cycle_q239_s 1 }
    set mom_tnc_cycle_q239_o 3
    set mom_tnc_cycle_q239 $mom_thr_pitch
    if { $mom_thr_mach_dir == "-1" } {
          set mom_tnc_cycle_q351_o 2
    } else { set mom_tnc_cycle_q351_o 1 }
    set mom_tnc_cycle_q355 $mom_thr_npitch

global mom_cycle_event_type
set mom_cycle_event_type G267
}

#=============================================
proc MOM_hh_boremilling { } {
#=============================================
## "TNC530 : Фрезеровка отверстий"
global mom_cycle_event_type
set mom_cycle_event_type "G208"

global mom_tnc_cycle_q335 ; # Off "Diameter : Q335"
global mom_tnc_cycle_q334 ; # "Axial step : Q334"
global mom_tnc_cycle_q342 ; # Off "Pre-Machined diameter : Q342"
global mom_tnc_cycle_q351_o ; # "1. Climb cut","2. Up cut"
global mom_tnc_cycle_q335_defined

global mom_hm_diameter ; # "Диаметр"
global mom_hm_peck ; # "Шаг"
global mom_hm_direction ; # "Направление резания  ( 1 - попутное  / -1 - встречное )"
global mom_hm_start_diameter ; # "Начальный диаметр"

  set mom_tnc_cycle_q334 $mom_hm_peck
  set mom_tnc_cycle_q335 [expr abs($mom_hm_diameter)]
  set mom_tnc_cycle_q342 $mom_hm_start_diameter
    if { $mom_hm_direction == 1 } {
           set mom_tnc_cycle_q351_o 1
    } elseif { $mom_hm_direction == -1 } {
           set mom_tnc_cycle_q351_o 2
    } else { set mom_tnc_cycle_q351_o 1 }
  set mom_tnc_cycle_q335_defined 1
}

#=============================================
proc MOM_bore_milling { } {
#=============================================
global mom_cycle_event_type
set mom_cycle_event_type "G208"

global mom_bmg_peck
global mom_bmg_hole_diameter
global mom_bmg_direction
global mom_roughing_diameter

global mom_tnc_cycle_q335 ; # Off "Diameter : Q335"
global mom_tnc_cycle_q334 ; # "Axial step : Q334"
global mom_tnc_cycle_q342 ; # Off "Pre-Machined diameter : Q342"
global mom_tnc_cycle_q351_o ; # "1. Climb cut","2. Up cut"
global mom_tnc_cycle_q335_defined

  set mom_tnc_cycle_q334 $mom_bmg_peck
  set mom_tnc_cycle_q335 $mom_bmg_hole_diameter
  set mom_tnc_cycle_q342 $mom_roughing_diameter
  if { $mom_bmg_direction == "CCLW" } {
       set mom_tnc_cycle_q351_o  1
  } else { set mom_tnc_cycle_q351_o 2 }
  set mom_tnc_cycle_q335_defined 1
}

#=============================================
proc MOM_hh_threadmilling { } {
#=============================================
## POST_EVENT "hh_threadmilling"  "TNC530 : Фрезеровка внутренней резьбы"
global mom_cycle_event_type
set mom_cycle_event_type G262

global mom_thr_diameter ; # "Диаметр резьбы "
global mom_thr_dir ; # "RIGHT","LEFT"
global mom_thr_pitch ; # "Шаг резьбы"
global mom_thr_mach_dir ; # "Направление резания  ( 1 - попутное  / -1 - встречное )"
global mom_thr_npitch ; # "0 = 1 виток / 1 = полная спираль / >1= сдвиг инструмента"

global mom_tnc_cycle_q335 ; # TOGGLE Off "Наружный диаметр : Q335"
global mom_tnc_cycle_q239_s ; # "1. Правая","2. Левая"
global mom_tnc_cycle_q239_o ; # "Выбор шага резьбы" "1. Из модели","2. Из инструмента","3. Из диалога цикла ( Q239 )"
global mom_tnc_cycle_q239 ; # TOGGLE Off "Шаг : Q239"
global mom_tnc_cycle_q355 ; # "1-Полная спираль / 0-Один виток / >1-Несколько шагов / : Q355"
global mom_tnc_cycle_q351 ; # CUT DIRECTION
global mom_tnc_cycle_q239_defined
global mom_tnc_cycle_q335_defined

   if { [string match "*RI*" $mom_thr_dir] } {
          set mom_tnc_cycle_q239_s 1
          set mom_tnc_cycle_q239 [expr abs($mom_thr_pitch)]
   } else {
          set mom_tnc_cycle_q239_s 2
          set mom_tnc_cycle_q239 [expr -abs($mom_thr_pitch)]
    }

   set mom_tnc_cycle_q239_o 3
   set mom_tnc_cycle_q335 [expr abs($mom_thr_diameter)]

   if { $mom_thr_mach_dir != -1 && $mom_thr_mach_dir != 1 } {
         set mom_tnc_cycle_q351 1
   } else { set mom_tnc_cycle_q351 $mom_thr_mach_dir }
   if { ![info exist mom_thr_npitch] || $mom_thr_npitch < 0 } {
         set mom_tnc_cycle_q355 1
   } else { set mom_tnc_cycle_q355 $mom_thr_npitch }

   set mom_tnc_cycle_q239_defined 1
   set mom_tnc_cycle_q335_defined 1
}

} ; #uplevel

}


#=============================================================
proc PB_CMD_UPLEVEL_file { } {
#=============================================================
global var_out_directory
global file_MAIN file_SUB
global mom_output_file_directory
global mom_output_file_basename
global ptp_file_name mom_sys_ptp_output

set var_out_directory "${mom_output_file_directory}${mom_output_file_basename}_H\\"
file delete -force $var_out_directory
file mkdir $var_out_directory

  set file_MAIN "${var_out_directory}${mom_output_file_basename}.H"
  if {[file exists $file_MAIN] } { MOM_remove_file $file_MAIN}

MOM_close_output_file $ptp_file_name
set mom_sys_ptp_output OFF
MOM_remove_file $ptp_file_name

uplevel #0 {

#===================================
proc OPEN_OUT_FILE { filename } {
#===================================
global opened_file_name
global mom_sys_ptp_output

  if {![info exist opened_file_name]} { set opened_file_name "UNDEF" }
  if { $opened_file_name == $filename } { return }
  if { $opened_file_name != "UNDEF" } {
         MOM_close_output_file $opened_file_name
     }

  set mom_sys_ptp_output OFF
  MOM_open_output_file $filename
  set opened_file_name $filename
  MOM_set_seq_off
}

#===================================
proc CLOSE_OUT_FILE { } {
#===================================
global opened_file_name

  if {[info exist opened_file_name] && $opened_file_name != "UNDEF" } {
       MOM_close_output_file $opened_file_name
       set opened_file_name "UNDEF"
     }
}

#===================================
} ; # uplevel


}


#=============================================================
proc PB_CMD_UPLEVEL_helix { } {
#=============================================================
uplevel #0 {

   set mom_sys_helix_pitch_type    "rise_revolution"
### "rise_radian"
   set mom_kin_helical_arc_output_mode END_POINT
   MOM_reload_kinematics

} ;# uplevel

}


#=============================================================
proc PB_CMD_UPLEVEL_path { } {
#=============================================================
uplevel #0 {

#============================
proc MOM_end_of_group { } {
#============================
global group_end_command_list

  if {[info exist group_end_command_list]} {
       foreach _comand $group_end_command_list {
          if { [llength [info commands $_comand]] > 0 } {
               $_comand
          }
      }
    unset group_end_command_list
  }
}

#============================
proc GROUP_end_list { _commands } {
#============================
global group_end_command_list

  if {[info exist group_end_command_list] && \
       [lsearch $group_end_command_list $_commands] >= 0 } {
         return
  } else {
         lappend group_end_command_list $_commands
   }
}


#============================
} ; # uplevel
}


#=============================================================
proc PB_CMD_UPLEVEL_procs { } {
#=============================================================
uplevel #0 {

set mom_use_safe_point "TRUE"

#============================
proc MOM_traori_reposition { } {
#============================
global mom_traori_repos_type
## "1. PLANE","2. TRAORI"
global mom_cycle_traversal_type ; # 1 / 2

  if {[info exist mom_cycle_traversal_type]} { unset mom_cycle_traversal_type }

  if {[info exist mom_traori_repos_type] } {
         set mom_cycle_traversal_type [string index $mom_traori_repos_type 0]
     }
}

#==========================================
proc FMAX_SET { } {
#==========================================
global mom_programmed_feed_rate
global mom_feed_rate_mode
global f_max  feed
# In RAPID & CYCLE_POS  blocks sets F(f_max) = $f_max

if { [EQ_is_equal $mom_programmed_feed_rate 0] } {
   set out_format "String"
   set f_max "MAX"
 } else {
   set out_format "Feed_"
   append out_format $mom_feed_rate_mode
   set f_max $feed
 }
MOM_set_address_format f_max $out_format
}

#============================
proc UI_UNSET { vars } {
#============================
global $vars
if {[info exist $vars]} { unset $vars }
}

###
} ; # uplevel
}


#=============================================================
proc PB_CMD_UPLEVEL_trans { } {
#=============================================================
uplevel #0 {

#=====================================
proc PLANE_ANGLES { type } {
#=====================================
#type MOVE, TURN, STAY
global mom_plane_trans_status

set mom_plane_trans_status ON
MOM_add_to_line_buffer end " $type"
PB_call_macro PLANE_SPATIAL
}

#=====================================
proc PLANE_RESET { type } {
#=====================================
#type MOVE, TURN, STAY, B0C0
global mom_plane_trans_status

if { ![info exist mom_plane_trans_status] ||
      $mom_plane_trans_status == "OFF" } { return }

if { [string match "*STAY*" $type] }  {
     set mom_plane_trans_status STAY
     MOM_output_literal "PLANE RESET STAY"
} elseif { [string match "*B0C0*" $type] }  {
     set mom_plane_trans_status OFF
     MOM_output_literal "PLANE RESET STAY"
#     MOM_output_literal "L Z-1 FMAX M91; Z GO HOME"
#     MOM_output_literal "L B0 C0 FMAX M140 MB MAX M94"
     MOM_output_literal "L B0 C0 FMAX M94"
} else {
     set mom_plane_trans_status OFF
     MOM_output_literal "PLANE RESET $type"
  }
# DATUM_SHIFT "OFF"
}

#=====================================
proc DATUM_SHIFT { mode } {
#=====================================
global saved_csys_origin mom_csys_matrix

if { $mode == "ON" } {
  set new_origin [format "X%.4f Y%.4f Z%.4f" $mom_csys_matrix(9) $mom_csys_matrix(10) $mom_csys_matrix(11)]
    if { ![info exist saved_csys_origin] || $saved_csys_origin != $new_origin } {
         MOM_output_literal  "TRANS DATUM AXIS $new_origin"
         set saved_csys_origin $new_origin
       }
} elseif { $mode == "OFF" && [info exist saved_csys_origin] } {
    unset saved_csys_origin
    MOM_output_literal  "TRANS DATUM RESET"
 }
}

#=====================================
} ; # uplevel

}


#=============================================================
proc PB_CMD__check_block_CC { } {
#=============================================================
global mom_pos_arc_plane
global mom_pos_arc_center

if { $mom_pos_arc_plane == "XY" } {
      MOM_force once circle_center I J
      MOM_suppress once K
      return 1
} elseif { $mom_pos_arc_plane == "ZX" } {
      MOM_force once circle_center I K
      MOM_suppress once J
      return 1
} elseif { $mom_pos_arc_plane == "YZ" } {
      MOM_force once circle_center J K
      MOM_suppress once I
      return 1
}

return 0
}


#=============================================================
proc PB_CMD__check_block_CIRCULAR_move { } {
#=============================================================
global mom_arc_radius
global mom_pos_arc_plane

if { $mom_pos_arc_plane == "XY" } {
      MOM_force once X Y
      MOM_suppress once Z
} elseif { $mom_pos_arc_plane == "ZX" } {
      MOM_force once X Z
      MOM_suppress once Y
} elseif { $mom_pos_arc_plane == "YZ" } {
      MOM_force once Y Z
      MOM_suppress once X
}

MOM_force once G_motion circle_direction
#MOM_add_to_line_buffer end "; R [format "%0.3f" $mom_arc_radius]"
return 1
}


#=============================================================
proc PB_CMD__check_block_CYCLE_rapid { } {
#=============================================================
## Rapid move by 3 axis ( X Y Z ) at once
global mom_operation_type
global mom_tcpm_status
global mom_pb_operation
global mom_cycle_tool_axis_change
global mom_motion_event mom_current_motion

if { [info exist mom_tcpm_status] && $mom_tcpm_status == "ON" } { return 0 }
if { [info exist mom_cycle_tool_axis_change] && $mom_cycle_tool_axis_change == 1 } { return 0 }
if { [string match "*initial_*" $mom_motion_event] || [string match "*first_*" $mom_current_motion] } { return 0 }

if { $mom_operation_type == "Hole Making" || \
      $mom_operation_type == "Point to Point" || \
         [string match "*Drill*" $mom_operation_type] } {
      FMAX_SET
      return 1
} else {
      return 0
}

}


#=============================================================
proc PB_CMD__check_block_PLANE_linear { } {
#=============================================================
global mom_tcpm_status

if { [info exist mom_tcpm_status] && $mom_tcpm_status == "ON" } {
        return 0
} else {
#     FMAX_SET
     return 1
}

}


#=============================================================
proc PB_CMD__check_block_PLANE_rapid { } {
#=============================================================
global mom_tcpm_status
global mom_operation_type
global mom_motion_event mom_current_motion
global mom_pos mom_prev_pos

if { [info exist mom_tcpm_status] && $mom_tcpm_status == "ON" } {
        return 0
} elseif { [string match "*initial_*" $mom_motion_event] || \
               [string match "*first_*" $mom_current_motion] } {
        FMAX_SET
        return 1
} elseif { $mom_operation_type == "Hole Making" || \
            $mom_operation_type == "Point to Point" || \
              [string match "*Drill*" $mom_operation_type] } {
        return 0
} else {
     if {![EQ_is_equal $mom_pos(0) $mom_prev_pos(0)]} { MOM_force once X }
     if {![EQ_is_equal $mom_pos(1) $mom_prev_pos(1)]} { MOM_force once Y }
     if {![EQ_is_equal $mom_pos(2) $mom_prev_pos(2)]} { MOM_force once Z }
     FMAX_SET
     return 1
}

}


#=============================================================
proc PB_CMD__check_block_TRAORI_move { } {
#=============================================================
global mom_tcpm_status

if { [info exist mom_tcpm_status] && $mom_tcpm_status == "ON" } {
    FMAX_SET
    MOM_force once G_motion X Y Z tcpm_x tcpm_y tcpm_z
    return 1
} else {
    return 0
}

}


#=============================================================
proc PB_CMD__log_revisions { } {
#=============================================================
# Dummy command to log changes in this post --
#
# 02-26-09 gsl - Initial version
#
}


#=============================================================
proc PB_CMD__manage_part_attributes { } {
#=============================================================
# This command allows the user to manage the MOM variables
# generated for the part attributes, in case of conflicts.
#
# ==> This command is executed automatically when present in
#     the post. DO NOT add or call it in any event or command.
#

  # This command should only be called by MOM__part_attributes!
   if { ![CALLED_BY "MOM__part_attributes"] } {
return
   }

}


#=============================================================
proc PB_CMD_abort_event { } {
#=============================================================
# This command can be called to abort an event based on the
# flag being set by other handler under certain conditions,
# such as an invalid tool axis vector.
#
# Users can set the global variable mom_sys_abort_next_event to
# different severity levels throughout the post and designate
# how to handle different conditions in this command.
#
# - Rapid, linear, circular and cycle move events have this trigger
#   built in by default in PB6.0.
#

   global mom_sys_abort_next_event

   if { [info exists mom_sys_abort_next_evnet] } {

      switch $mom_sys_abort_next_evnet {
        1 -
        2 {
           unset mom_sys_abort_next_evnet
           CATCH_WARNING "Event aborted!"

           MOM_abort_event
        }
        default {
           CATCH_WARNING "Event warned!"
        }
      }
   }
}


#=============================================================
proc PB_CMD_ask_machine_type { } {
#=============================================================
# Utility to return machine type per mom_kin_machine_type
#
# Revisions:
#-----------
# 02-26-09 gsl - Initial version
#
   global mom_kin_machine_type

   if { [string match "*wedm*" $mom_kin_machine_type] } {
return WEDM
   } elseif { [string match "*axis*" $mom_kin_machine_type] } {
return MILL
   } elseif { [string match "*lathe*" $mom_kin_machine_type] } {
return TURN
   } else {
return $mom_kin_machine_type
   }
}


#=============================================================
proc PB_CMD_before_motion { } {
#=============================================================
global mom_warning_info

if { [info exist mom_warning_info] &&
     [string match "*unable to determine valid rotary pos*" $mom_warning_info] } {

#  MOM_abort "OUT OF ANGLE RANGE"
}

}


#=============================================================
proc PB_CMD_before_output { } {
#=============================================================
# This command allows users to massage the NC data (mom_o_buffer) before
# it finally gets output.  If present in the post, this command gets executed
# by MOM_before_output automatically.
#
# - DO NOT overload MOM_before_output! All customization should be done here!
# - DO NOT call any MOM output commands in this command, it will become cyclicle!
# - No need to attach this command to any event marker.
#

   global mom_o_buffer
   global mom_sys_leader
   global mom_sys_control_out mom_sys_control_in
}


#=============================================================
proc PB_CMD_begin_pgm { } {
#=============================================================
global mom_output_file_basename
global mom_part_name mom_date mom_logname
global mom_operation_name_list

MOM_output_text "0 BEGIN PGM [string toupper $mom_output_file_basename] MM"
MOM_output_text "; ========================="
MOM_output_text "; DMU60 evolution linear iTNC530"
MOM_output_text "; V16.002"
MOM_output_text "; [string toupper $mom_part_name]"
MOM_output_text "; DATE [string toupper $mom_date] :  USER - [string toupper $mom_logname]"
MOM_set_seq_on
# SAFEKEY

}


#=============================================================
proc PB_CMD_clamp_fifth_axis { } {
#=============================================================
#
#  This procedure is used by auto clamping to output the code
#  needed to clamp the fifth axis.
#
#  Do NOT add this block to events or markers.  It is a static
#  block and it is not intended to be added to events.  Do NOT
#  change the name of this custom command.
#
#  MOM_output_literal "M12"
}


#=============================================================
proc PB_CMD_clamp_fourth_axis { } {
#=============================================================
#
#  This procedure is used by auto clamping to output the code
#  needed to clamp the fourth axis.
#
#  Do NOT add this block to events or markers.  It is a static
#  block and it is not intended to be added to events.  Do NOT
#  change the name of this custom command.
#
#  MOM_output_literal "M10"
}


#=============================================================
proc PB_CMD_cutcom_force { } {
#=============================================================
MOM_force once X Y
}


#=============================================================
proc PB_CMD_cycle_09_dwell { } {
#=============================================================
global mom_delay_value

MOM_output_literal "CYCL DEF 9.0 DWELL TIME"
MOM_output_literal "CYCL DEF 9.1 DWELL[format "%.1f" $mom_delay_value]"
}


#=============================================================
proc PB_CMD_cycle_time { } {
#=============================================================
global mom_toolpath_cutting_time
global mom_cycle_rapid_to
global mom_cycle_feed_to
global feed
set mom_toolpath_cutting_time [expr $mom_toolpath_cutting_time + abs($mom_cycle_rapid_to-$mom_cycle_feed_to)/$feed]
}


#=============================================================
proc PB_CMD_disable_coolant { } {
#=============================================================
MOM_disable_address M_coolant

}


#=============================================================
proc PB_CMD_enable_ball_center_output { } {
#=============================================================
# This command can be added to the Start-of-Program event marker
# to enable ball-center output for ANY milling operations that use
# one of the following 3 types (mom_tool_type) of tool:
#  a. "Milling Tool-Ball Mill"
#  b. "Spherical Mill"
#  c. "Milling Tool-5 Parameters" whose tool diameter is 2 times of the corner radius.
#
#  - Only qualified operations will cause NX/Post to produce ball-center outputs.
#  - The condition is verified for every operation.
#  - Ball centers are computed for every move including cutting and non-cutting motions in
#    either standard or turbo process mode.
#  - Legacy command "PB_CMD_center_of_ball_output", if present in the post, will be disabled.
#

   # This command should be called in the Start-of-Program event
   if { ![CALLED_BY "PB_start_of_program"] } {
return
   }

   # This command only works with NX9 & beyond.
   if { [expr [string trim [MOM_ask_env_var UGII_MAJOR_VERSION]] < 9] } {
      CATCH_WARNING "[info level 0] is only functional with NX9 and newer!"
return
   }

   # Disable legacy command
   if { [CMD_EXIST PB_CMD_center_of_ball_output] } {
    uplevel #0 {
      proc PB_CMD_center_of_ball_output { } { }
    }
   }


   # Enable new capability
   global mom_sys_enable_ball_center_output
   set mom_sys_enable_ball_center_output 1


   # Define event handler
   if $mom_sys_enable_ball_center_output {
    uplevel #0 {

      #-------------------------------------------------------------------------------
      proc MOM_ball_center_output { } {
         # This event will be triggered before Start-of-Path when
         # an operation is qualified to produce ball-center outputs.
         #
         # This command may be customized as needed.
         #
      }
      #-------------------------------------------------------------------------------

    }
   }

}


#=============================================================
proc PB_CMD_enable_coolant { } {
#=============================================================
MOM_enable_address M_coolant


}


#=============================================================
proc PB_CMD_end_of_alignment_character { } {
#=============================================================
# This command restores sequnece number back to orignal
# This command may be used with the command "PM_CMD_start_of_alignment_character"
#
  global mom_sys_leader saved_seq_num
  if { [info exists saved_seq_num] } {
    set mom_sys_leader(N) $saved_seq_num
  }
}


#=============================================================
proc PB_CMD_end_path_m_code { } {
#=============================================================
global mom_next_oper_has_tool_change
global mom_current_oper_is_last_oper_in_program
global mom_spindle_status
global mom_coolant_status
global mom_oper_tool
global mom_spindle_direction

if { $mom_oper_tool == "NONE" } {
     MOM_suppress once M_spindle M_coolant
     return
}

if { $mom_next_oper_has_tool_change == "YES" ||
     $mom_current_oper_is_last_oper_in_program == "YES" } {
      set mom_coolant_status OFF
      set mom_spindle_status OFF
      set mom_spindle_direction OFF
      MOM_force once M_spindle M_coolant
}

}


#=============================================================
proc PB_CMD_end_path_trans_off { } {
#=============================================================
global mom_next_oper_has_tool_change
global mom_plane_trans_status
global mom_use_safe_point
global RELATIVE_list

  if {[info exists RELATIVE_list]} {
        MOM_output_literal  "TRANS DATUM RESET"
        unset RELATIVE_list
     }

MOM_output_literal "M01 ; OPTIONAL STOP"

if { $mom_next_oper_has_tool_change == "YES" && \
            [info exist mom_plane_trans_status] && \
                     $mom_plane_trans_status == "ON"  } {
      PB_CMD_table_reload_pos
      PLANE_RESET "B0C0"
#      SET_SHIFT "OFF"
}

# VAR_GROUP_LIST mom_use_safe_point

}


#=============================================================
proc PB_CMD_end_pgm { } {
#=============================================================
global mom_output_file_basename
global mom_plane_trans_status

MOM_output_literal "M17"
MOM_output_literal "L Z-1 FMAX M91; Z HOME"
MOM_output_literal "L X-1 Y-1 FMAX M91; X Y HOME"

     set mom_plane_trans_status OFF
     MOM_output_literal "PLANE RESET STAY"
     MOM_output_literal "L B0 C0 FMAX M94"

MOM_output_literal "M30"
MOM_set_seq_off
MOM_output_literal "END PGM [string toupper $mom_output_file_basename] MM"
}


#=============================================================
proc PB_CMD_fifth_axis_rotate_move { } {
#=============================================================
#
#  This procedure is used by the ROTATE ude command to output a
#  fifth axis rotary move.  You can use the NC Data Definitions
#  section of postbuilder to modify the fifth_axis_rotary_move
#  block template.
#
#  Do NOT add this block to events or markers.  It is a static
#  block and it is not intended to be added to events.  Do NOT
#  change the name of this custom command.
#

#  MOM_force once fifth_axis
#  MOM_do_template fifth_axis_rotate_move
}


#=============================================================
proc PB_CMD_fix_RAPID_SET { } {
#=============================================================
# <02-18-08 gsl>
# This command is provided to overwrite the system RAPID_SET
# in order to correct the problem with workplane change that
# doesn't account for +/- directions along X or Y principal axes.
# It also fixes the problem that the First Move was never
# identified to force the output of the 1st point.
#
# - This command can be attached to the Start of Program event marker.
#

 # Only redefine RAPID_SET once, since ugpost_base is only loaded once.
 #
  if { [llength [info commands ugpost_RAPID_SET]] == 0 } {
     if { [llength [info commands RAPID_SET]] } {
        rename RAPID_SET ugpost_RAPID_SET
     }
  } else {
return
  }


uplevel #0 {

#====================
proc RAPID_SET { } {
#====================

  if { [llength [info commands PB_CMD_set_cycle_plane]] > 0 } {
    PB_CMD_set_cycle_plane
  }


  global mom_cycle_spindle_axis mom_sys_work_plane_change
  global traverse_axis1 traverse_axis2 mom_motion_event mom_machine_mode
  global mom_pos mom_prev_pos mom_from_pos mom_last_pos mom_sys_home_pos
  global mom_sys_tool_change_pos
  global spindle_first rapid_spindle_inhibit rapid_traverse_inhibit

  if { ![info exists mom_from_pos($mom_cycle_spindle_axis)] && [info exists mom_sys_home_pos($mom_cycle_spindle_axis)] } {

    set mom_from_pos(0) $mom_sys_home_pos(0)
    set mom_from_pos(1) $mom_sys_home_pos(1)
    set mom_from_pos(2) $mom_sys_home_pos(2)

  } elseif { ![info exists mom_sys_home_pos($mom_cycle_spindle_axis)] && [info exists mom_from_pos($mom_cycle_spindle_axis)] } {

    set mom_sys_home_pos(0) $mom_from_pos(0)
    set mom_sys_home_pos(1) $mom_from_pos(1)
    set mom_sys_home_pos(2) $mom_from_pos(2)

  } elseif { ![info exists mom_sys_home_pos($mom_cycle_spindle_axis)] && ![info exists mom_from_pos($mom_cycle_spindle_axis)] } {

    set mom_from_pos(0) 0.0 ; set mom_sys_home_pos(0) 0.0
    set mom_from_pos(1) 0.0 ; set mom_sys_home_pos(1) 0.0
    set mom_from_pos(2) 0.0 ; set mom_sys_home_pos(2) 0.0
  }

  if { ![info exists mom_sys_tool_change_pos($mom_cycle_spindle_axis)] } {
    set mom_sys_tool_change_pos($mom_cycle_spindle_axis) 100000.0
  }

  set is_first_move 0
  if { [string match "MOM_first_move" [MOM_ask_event_type]] } {
    set is_first_move 1
  }

  if { ![info exists mom_motion_event] } { set mom_motion_event "" }

  if { [string match "initial_move" $mom_motion_event] || $is_first_move } {
    set mom_last_pos($mom_cycle_spindle_axis) $mom_sys_tool_change_pos($mom_cycle_spindle_axis)
  } else {
    if { [info exists mom_last_pos($mom_cycle_spindle_axis)] == 0 } {
      set mom_last_pos($mom_cycle_spindle_axis) $mom_sys_home_pos($mom_cycle_spindle_axis)
    }
  }


  if { ![string match "MILL" $mom_machine_mode] && ![string match "DRILL" $mom_machine_mode] } {
return
  }


  WORKPLANE_SET

  set rapid_spindle_inhibit  FALSE
  set rapid_traverse_inhibit FALSE


  if { [EQ_is_lt $mom_pos($mom_cycle_spindle_axis) $mom_last_pos($mom_cycle_spindle_axis)] } {
    set going_lower 1
  } else {
    set going_lower 0
  }


  if { ![info exists mom_sys_work_plane_change] } {
    set mom_sys_work_plane_change 1
  }


 # Reverse workplane change direction per spindle axis
  global mom_spindle_axis

  if { [info exists mom_spindle_axis] } {

   #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   # User can force work plane change to be disabled for rapid move along non-principal
   # spindle axis even when work plane change has been set in the Rapid Move event.
   #
   # - This flag has no effect if the work plane change is not set.
   #
    set disable_non_principal_spindle 0


    switch $mom_cycle_spindle_axis {
      0 {
        if [EQ_is_lt $mom_spindle_axis(0) 0.0] {
          set going_lower [expr abs($going_lower - 1)]
        }
      }
      1 {
        if [EQ_is_lt $mom_spindle_axis(1) 0.0] {
          set going_lower [expr abs($going_lower - 1)]
        }
      }
      2 { ;# Multi-spindle machine
        if [EQ_is_lt $mom_spindle_axis(2) 0.0] {
          set going_lower [expr abs($going_lower - 1)]
        }
      }
    }


   # Per user's choice above, disable work plane change for non-principal spindle axis
   #
    if { $disable_non_principal_spindle } {

      if { ![EQ_is_equal $mom_spindle_axis(0) 1] && ![EQ_is_equal $mom_spindle_axis(1) 1] && ![EQ_is_equal $mom_spindle_axis(0) 1] } {

         global mom_user_work_plane_change
         global mom_user_spindle_first

         set mom_user_work_plane_change $mom_sys_work_plane_change
         set mom_sys_work_plane_change 0

         if [info exists spindle_first] {
           set mom_user_spindle_first $spindle_first
         } else {
           set mom_user_spindle_first NONE
         }
      }
    }
  }


  if { $mom_sys_work_plane_change } {

    if { $going_lower } {
      set spindle_first FALSE
    } else {
      set spindle_first TRUE
    }

   # Force output in Initial Move and First Move.
    if { ![string match "*initial_move*" $mom_motion_event] && !$is_first_move } {

       if { [EQ_is_equal $mom_pos($mom_cycle_spindle_axis) $mom_last_pos($mom_cycle_spindle_axis)] } {
         set rapid_spindle_inhibit TRUE
       } else {
         set rapid_spindle_inhibit FALSE
       }

       if { [EQ_is_equal $mom_pos($traverse_axis1) $mom_prev_pos($traverse_axis1)] && [EQ_is_equal $mom_pos($traverse_axis2) $mom_prev_pos($traverse_axis2)] && [EQ_is_equal $mom_pos(3) $mom_prev_pos(3)] && [EQ_is_equal $mom_pos(4) $mom_prev_pos(4)] } {

         set rapid_traverse_inhibit TRUE
       } else {
         set rapid_traverse_inhibit FALSE
       }
    }

  } else {
    set spindle_first NONE
  }

#####
global mom_current_motion

     if { [string match "*initial_*" $mom_motion_event] || [string match "*first_*" $mom_current_motion] } {
         set rapid_spindle_inhibit FALSE
         set rapid_traverse_inhibit FALSE
         set spindle_first FALSE
      }

} ;# proc
} ;# uplevel
}


#=============================================================
proc PB_CMD_force_M3M8 { } {
#=============================================================
MOM_enable_address M_coolant
MOM_force once M_spindle M_coolant
}


#=============================================================
proc PB_CMD_fourth_axis_rotate_move { } {
#=============================================================
#
#  This procedure is used by the ROTATE ude command to output a
#  fourth axis rotary move.  You can use the NC Data Definitions
#  section of postbuilder to modify the fourth_axis_rotary_move
#  block template.
#
#  Do NOT add this block to events or markers.  It is a static
#  block and it is not intended to be added to events.  Do NOT
#  change the name of this custom command.
#

#  MOM_force once fourth_axis
#  MOM_do_template fourth_axis_rotate_move
}


#=============================================================
proc PB_CMD_gohome_move { } {
#=============================================================
global mom_programmed_feed_rate
set mom_programmed_feed_rate 0
}


#=============================================================
proc PB_CMD_handle_sync_event { } {
#=============================================================
  global mom_sync_code
  global mom_sync_index
  global mom_sync_start
  global mom_sync_incr
  global mom_sync_max


  set mom_sync_start     99
  set mom_sync_incr       1
  set mom_sync_max    199


  if {![info exists mom_sync_code] } {
    set mom_sync_code $mom_sync_start
  }

  set mom_sync_code [expr $mom_sync_code + $mom_sync_incr]

#  MOM_output_literal "M$mom_sync_code"
}


#=============================================================
proc PB_CMD_hhain_spindle_speed { } {
#=============================================================
global mom_tool_number
global mom_oper_tool
global mom_spindle_speed saved_spindle_speed

if { $mom_oper_tool == "NONE" } { return }
if {![info exists saved_spindle_speed] || ![EQ_is_equal $mom_spindle_speed $saved_spindle_speed] } {
           MOM_output_literal "TOOL CALL Z S[format "%0.0f" $mom_spindle_speed]"
           set saved_spindle_speed $mom_spindle_speed
   }

}


#=============================================================
proc PB_CMD_hhain_tool_change { } {
#=============================================================
global mom_tool_name mom_tool_number
global mom_oper_tool
global mom_spindle_speed saved_spindle_speed
global mom_operation_name

if { $mom_oper_tool == "NONE" } { return }
MOM_output_literal "* - T$mom_tool_number $mom_tool_name : $mom_operation_name"
MOM_output_literal "TOOL CALL $mom_tool_number Z S[format "%0.0f" $mom_spindle_speed]"
set saved_spindle_speed $mom_spindle_speed

}


#=============================================================
proc PB_CMD_init_rotary { } {
#=============================================================
uplevel #0 {

#
# Retract and Re-Engage Parameters
#
# This option is activated by setting the Axis Limit Violation
# Handling option on the Machine Tool dialog to Retract/Re-Engage.
#
# The sequence of actions that take place when a rotary limit violation
# occurs is a retract to the clearance geometry at the rapid feedrate,
# reposition the rotary axes so they do not violate, move back to
# the engage point at the retract feedrate and engage into the part again.
#
# You can set additional parameters that will control the retract
# and re-engage motion.
#
#
#  mom_kin_retract_type ------- specifies the method used to
#                               calculate the retract point.
#                               The method can be of
#
#    DISTANCE : The retract will be to a point at a fixed distance
#               along the spindle axis.
#
#    SURFACE  : For a 4-axis rotary head machine, the retract will
#               be to a cylinder.  For a 5-axis dual heads machine,
#               the retract will be to a sphere.  For machine with
#               only rotary table(s), the retract will be to a plane
#               normal & along the spindle axis.
#
#  mom_kin_retract_distance --- specifies the distance or radius for
#                               defining the geometry of retraction.
#
#  mom_kin_reengage_distance -- specifies the re-engage point above
#                               the part.
#

set mom_kin_retract_type                "DISTANCE"
set mom_kin_retract_distance            10.0
set mom_kin_reengage_distance           .20



#
# The following parameters are used by UG Post.  Do NOT change
# them unless you know what you are doing.
#
if { ![info exists mom_kin_spindle_axis] } {
  set mom_kin_spindle_axis(0)                    0.0
  set mom_kin_spindle_axis(1)                    0.0
  set mom_kin_spindle_axis(2)                    1.0
}

set spindle_axis_defined 1
if { ![info exists mom_sys_spindle_axis] } {
  set spindle_axis_defined 0
} else {
  if { ![array exists mom_sys_spindle_axis] } {
    unset mom_sys_spindle_axis
    set spindle_axis_defined 0
  }
}
if !$spindle_axis_defined {
  set mom_sys_spindle_axis(0)                    0.0
  set mom_sys_spindle_axis(1)                    0.0
  set mom_sys_spindle_axis(2)                    1.0
}

set mom_sys_lock_status                        "OFF"

} ;# uplevel
}


#=============================================================
proc PB_CMD_kin__MOM_lintol { } {
#=============================================================
   global mom_kin_linearization_flag
   global mom_kin_linearization_tol
   global mom_lintol_status
   global mom_lintol

   if { ![string compare "ON" $mom_lintol_status] } {
      set mom_kin_linearization_flag "TRUE"
      if { [info exists mom_lintol] } {
         set mom_kin_linearization_tol $mom_lintol
      }
   } elseif { ![string compare "OFF" $mom_lintol_status] } {
      set mom_kin_linearization_flag "FALSE"
   }
}


#=============================================================
proc PB_CMD_kin__MOM_rotate { } {
#=============================================================
# This command handles a Rotate UDE.
#
# Key parameters set in UDE -
#   mom_rotate_axis_type        :  [ AAXIS | BAXIS   | CAXIS    | HEAD | TABLE | FOURTH_AXIS | FIFTH_AXIS ]
#   mom_rotation_mode           :  [ NONE  | ATANGLE | ABSOLUTE | INCREMENTAL ]
#   mom_rotation_direction      :  [ NONE  | CLW     | CCLW ]
#   mom_rotation_angle          :  Specified angle
#   mom_rotation_reference_mode :  [ ON    | OFF ]
#
#
## <rws 04-11-2008>
## If in TURN mode and user invokes "Flip tool around Holder" a MOM_rotate event is generated
## When this happens ABORT this event via return
##
## 09-12-2013 gsl - Made code & functionality of MOM_rotate sharable among all multi-axis posts.
##

   global mom_machine_mode


   if { [info exists mom_machine_mode] && [string match "TURN" $mom_machine_mode] } {
      if [CMD_EXIST PB_CMD_handle_lathe_flash_tool] {
         PB_CMD_handle_lathe_flash_tool
      }
return
   }


   global mom_rotate_axis_type mom_rotation_mode mom_rotation_direction
   global mom_rotation_angle mom_rotation_reference_mode
   global mom_kin_machine_type mom_kin_4th_axis_direction mom_kin_5th_axis_direction
   global mom_kin_4th_axis_leader mom_kin_5th_axis_leader
   global mom_kin_4th_axis_leader mom_kin_5th_axis_leader mom_pos
   global mom_out_angle_pos
   global unlocked_prev_pos mom_sys_leader
   global mom_kin_4th_axis_min_limit mom_kin_4th_axis_max_limit
   global mom_kin_5th_axis_min_limit mom_kin_5th_axis_max_limit
   global mom_prev_pos
   global mom_prev_rot_ang_4th mom_prev_rot_ang_5th


   if { ![info exists mom_rotation_angle] } {
     # Should the event be aborted here???
return
   }


   if { ![info exists mom_kin_5th_axis_direction] } {
      set mom_kin_5th_axis_direction "0"
   }


  #
  #  Determine which rotary axis the UDE has specifid - fourth(3), fifth(4) or invalid(0)
  #
  #
   if { [string match "*3_axis_mill_turn*" $mom_kin_machine_type] } {

      switch $mom_rotate_axis_type {
         CAXIS -
         FOURTH_AXIS -
         TABLE {
            set axis 3
         }
         default {
            set axis 0
         }
      }

   } else {

      switch $mom_rotate_axis_type {
         AAXIS -
         BAXIS -
         CAXIS {
            set axis [AXIS_SET $mom_rotate_axis_type]
         }
         HEAD {
            if { ![string compare "5_axis_head_table" $mom_kin_machine_type] ||\
                 ![string compare "5_AXIS_HEAD_TABLE" $mom_kin_machine_type] } {
               set axis 4
            } else {
               set axis 3
            }
         }
         FIFTH_AXIS {
            set axis 4
         }
         FOURTH_AXIS -
         TABLE -
         default {
            set axis 3
         }
      }
   }

   if { $axis == 0 } {
      CATCH_WARNING "Invalid rotary axis"
      MOM_abort_event
   }

   switch $mom_rotation_mode {
      NONE -
      ATANGLE {
         set angle $mom_rotation_angle
         set mode 0
      }
      ABSOLUTE {
         set angle $mom_rotation_angle
         set mode 1
      }
      INCREMENTAL {
         set angle [expr $mom_pos($axis) + $mom_rotation_angle]
         set mode 0
      }
   }

   switch $mom_rotation_direction {
      NONE {
         set dir 0
      }
      CLW {
         set dir 1
      }
      CCLW {
         set dir -1
      }
   }

   set ang [LIMIT_ANGLE $angle]
   set mom_pos($axis) $ang

   if { $axis == "3" } { ;# Rotate 4th axis

      if { ![info exists mom_prev_rot_ang_4th] } {
         set mom_prev_rot_ang_4th [MOM_ask_address_value fourth_axis]
      }
      if { [string length [string trim $mom_prev_rot_ang_4th]] == 0 } {
         set mom_prev_rot_ang_4th 0.0
      }

      set prev_angles(0) $mom_prev_rot_ang_4th

   } elseif { $axis == "4" } { ;# Rotate 5th axis

      if { ![info exists mom_prev_rot_ang_5th] } {
         set mom_prev_rot_ang_5th [MOM_ask_address_value fifth_axis]
      }
      if { [string length [string trim $mom_prev_rot_ang_5th]] == 0 } {
         set mom_prev_rot_ang_5th 0.0
      }

      set prev_angles(1) $mom_prev_rot_ang_5th
   }

   set p [expr $axis + 1]
   set a [expr $axis - 3]

   if { $axis == 3  &&  [string match "MAGNITUDE_DETERMINES_DIRECTION" $mom_kin_4th_axis_direction] } {

      set dirtype "MAGNITUDE_DETERMINES_DIRECTION"

      global mom_sys_4th_axis_dir_mode

      if { [info exists mom_sys_4th_axis_dir_mode] && ![string compare "ON" $mom_sys_4th_axis_dir_mode] } {

         set del $dir
         if { $del == 0 } {
            set del [expr $ang - $mom_prev_pos(3)]
            if { $del >  180.0 } { set del [expr $del - 360.0] }
            if { $del < -180.0 } { set del [expr $del + 360.0] }
         }

         global mom_sys_4th_axis_cur_dir
         global mom_sys_4th_axis_clw_code mom_sys_4th_axis_cclw_code

         if { $del > 0.0 } {
            set mom_sys_4th_axis_cur_dir $mom_sys_4th_axis_clw_code
         } elseif { $del < 0.0 } {
            set mom_sys_4th_axis_cur_dir $mom_sys_4th_axis_cclw_code
         }
      }

   } elseif { $axis == 4  &&  [string match "MAGNITUDE_DETERMINES_DIRECTION" $mom_kin_5th_axis_direction] } {

      set dirtype "MAGNITUDE_DETERMINES_DIRECTION"

      global mom_sys_5th_axis_dir_mode

      if { [info exists mom_sys_5th_axis_dir_mode] && ![string compare "ON" $mom_sys_5th_axis_dir_mode] } {

         set del $dir
         if { $del == 0 } {
            set del [expr $ang - $mom_prev_pos(4)]
            if { $del >  180.0 } { set del [expr $del - 360.0] }
            if { $del < -180.0 } { set del [expr $del + 360.0] }
         }

         global mom_sys_5th_axis_cur_dir
         global mom_sys_5th_axis_clw_code mom_sys_5th_axis_cclw_code

         if { $del > 0.0 } {
            set mom_sys_5th_axis_cur_dir $mom_sys_5th_axis_clw_code
         } elseif { $del < 0.0 } {
            set mom_sys_5th_axis_cur_dir $mom_sys_5th_axis_cclw_code
         }
      }

   } else {

      set dirtype "SIGN_DETERMINES_DIRECTION"
   }

   if { $mode == 1 } {

      set mom_out_angle_pos($a) $angle

   } elseif { [string match "MAGNITUDE_DETERMINES_DIRECTION" $dirtype] } {

      if { $axis == 3 } {
         set mom_out_angle_pos($a) [ROTSET $ang $prev_angles(0) $mom_kin_4th_axis_direction\
                                                $mom_kin_4th_axis_leader mom_sys_leader(fourth_axis)\
                                                $mom_kin_4th_axis_min_limit $mom_kin_4th_axis_max_limit]
      } else {
         set mom_out_angle_pos($a) [ROTSET $ang $prev_angles(1) $mom_kin_5th_axis_direction\
                                                $mom_kin_5th_axis_leader mom_sys_leader(fifth_axis)\
                                                $mom_kin_5th_axis_min_limit $mom_kin_5th_axis_max_limit]
      }

   } elseif { [string match "SIGN_DETERMINES_DIRECTION" $dirtype] } {

      if { $dir == -1 } {
         if { $axis == 3 } {
            set mom_sys_leader(fourth_axis) $mom_kin_4th_axis_leader-
         } else {
            set mom_sys_leader(fifth_axis) $mom_kin_5th_axis_leader-
         }
      } elseif { $dir == 0 } {
         if { $axis == 3 } {
            set mom_out_angle_pos($a) [ROTSET $ang $prev_angles(0) $mom_kin_4th_axis_direction\
                                                   $mom_kin_4th_axis_leader mom_sys_leader(fourth_axis)\
                                                   $mom_kin_4th_axis_min_limit $mom_kin_4th_axis_max_limit]
         } else {
            set mom_out_angle_pos($a) [ROTSET $ang $prev_angles(1) $mom_kin_5th_axis_direction\
                                                   $mom_kin_5th_axis_leader mom_sys_leader(fifth_axis)\
                                                   $mom_kin_5th_axis_min_limit $mom_kin_5th_axis_max_limit]
         }
      } elseif { $dir == 1 } {
         set mom_out_angle_pos($a) $ang
      }
   }


  #<04-25-2013 gsl> No clamp code output when rotation is ref only.
   if { ![string compare "OFF" $mom_rotation_reference_mode] } {
      global mom_sys_auto_clamp

      if { [info exists mom_sys_auto_clamp] && [string match "ON" $mom_sys_auto_clamp] } {

         set out1 "1"
         set out2 "0"

         if { $axis == 3 } { ;# Rotate 4th axis
            AUTO_CLAMP_2 $out1
            AUTO_CLAMP_1 $out2
         } else {
            AUTO_CLAMP_1 $out1
            AUTO_CLAMP_2 $out2
         }
      }
   }


   if { $axis == 3 } {

      ####  <rws>
      ####  Use ROTREF switch ON to not output the actual 4th axis move

      if { ![string compare "OFF" $mom_rotation_reference_mode] } {
         PB_CMD_fourth_axis_rotate_move
      }

      if { ![string compare "SIGN_DETERMINES_DIRECTION" $mom_kin_4th_axis_direction] } {
         set mom_prev_rot_ang_4th [expr abs($mom_out_angle_pos(0))]
      } else {
         set mom_prev_rot_ang_4th $mom_out_angle_pos(0)
      }

      MOM_reload_variable mom_prev_rot_ang_4th

   } else {

      if { [info exists mom_kin_5th_axis_direction] } {

         ####  <rws>
         ####  Use ROTREF switch ON to not output the actual 5th axis move

         if { ![string compare "OFF" $mom_rotation_reference_mode] } {
            PB_CMD_fifth_axis_rotate_move
         }

         if { ![string compare "SIGN_DETERMINES_DIRECTION" $mom_kin_5th_axis_direction] } {
            set mom_prev_rot_ang_5th [expr abs($mom_out_angle_pos(1))]
         } else {
            set mom_prev_rot_ang_5th $mom_out_angle_pos(1)
         }

         MOM_reload_variable mom_prev_rot_ang_5th
      }
   }

  #<05-10-06 sws> pb351 - Uncommented next 3 lines
  #<01-07-10 wbh> Reset mom_prev_pos using the variable mom_out_angle_pos
  # set mom_prev_pos($axis) $ang
   set mom_prev_pos($axis) $mom_out_angle_pos([expr $axis-3])
   MOM_reload_variable -a mom_prev_pos
   MOM_reload_variable -a mom_out_angle_pos
}


#=============================================================
proc PB_CMD_kin_abort_event { } {
#=============================================================
   if { [llength [info commands PB_CMD_abort_event]] } {
      PB_CMD_abort_event
   }
}


#=============================================================
proc PB_CMD_kin_before_motion { } {
#=============================================================
#  This custom command is used by UG Post to support Set/Lock,
#  rotary axis limit violation retracts and auto clamping.
#
#  --> Do not change this command!  If you want to improve
#      performance, you may comment out any of these commands.
#
   global mom_kin_machine_type

   if { [info exists mom_kin_machine_type] } {
      if { [string match "*3_axis_mill*" $mom_kin_machine_type] ||\
           [string match "*lathe*" $mom_kin_machine_type] } {
return
      }
   }


  # Lock on and not circular move
   global mom_sys_lock_status  ;# Set in MOM_lock_axis
   global mom_current_motion
   if { [info exists mom_sys_lock_status] && ![string compare "ON" $mom_sys_lock_status] } {
      if { [info exists mom_current_motion] && [string compare "circular_move" $mom_current_motion] } {

         LOCK_AXIS_MOTION
      }
   }


  # Handle rotary over travel for linear moves (mom_sys_rotary_error set in PB_catch_warning)
   global mom_sys_rotary_error mom_motion_event
   if { [info exists mom_sys_rotary_error] } {
      if { $mom_sys_rotary_error != 0 && \
           [info exists mom_motion_event] && ![string compare "linear_move" $mom_motion_event] } {

         ROTARY_AXIS_RETRACT
      }

     # Error state s/b reset every time to avoid residual effect!
      UNSET_VARS mom_sys_rotary_error
   }


  # Auto clamp on
   global mom_sys_auto_clamp
   if { [info exists mom_sys_auto_clamp] && ![string compare "ON" $mom_sys_auto_clamp] } {

      AUTO_CLAMP
   }
}


#=============================================================
proc PB_CMD_kin_before_output { } {
#=============================================================
# Broker command ensuring PB_CMD_before_output,if present, gets executed
# by MOM_before_output.
#
   if [llength [info commands PB_CMD_before_output] ] {
      PB_CMD_before_output
   }
}


#=============================================================
proc PB_CMD_kin_catch_warning { } {
#=============================================================
# Called by PB_catch_warning
#
# - String with "mom_warning_info" (come from event generator or handlers)
#   may be output by MOM_catch_warning to the message file.
#
# - "mom_warning_info" will be transfered to "mom_sys_rotary_error" for
#   PB_CMD_kin_before_motion to handle the error condition.
#

  global mom_sys_rotary_error mom_warning_info

   if { [string match "ROTARY CROSSING LIMIT." $mom_warning_info] } {
      set mom_sys_rotary_error $mom_warning_info
   }

   if { [string match "secondary rotary position being used" $mom_warning_info] } {
      set mom_sys_rotary_error $mom_warning_info
   }

   if { [string match "WARNING: unable to determine valid rotary positions" $mom_warning_info] } {

     # To abort the current event
     # - Whoever handles this condition MUST unset it to avoid any lingering effect!
     #
      global mom_sys_abort_next_event
      set mom_sys_abort_next_event 1
   }
}


#=============================================================
proc PB_CMD_kin_end_of_path { } {
#=============================================================
  # Record tool time for this operation.
   if { [llength [info commands PB_CMD_set_oper_tool_time] ] } {
      PB_CMD_set_oper_tool_time
   }

  # Clear tool holder angle used in operation
   global mom_use_b_axis
   UNSET_VARS mom_use_b_axis
}


#=============================================================
proc PB_CMD_kin_feedrate_set { } {
#=============================================================
# This command supercedes the functionalites provided by the
# FEEDRATE_SET in ugpost_base.tcl.  Post Builder automatically
# generates proper call sequences to this command in the
# Event handlers.
#
# This command must be used in conjunction with ugpost_base.tcl.
#
   global   feed com_feed_rate
   global   mom_feed_rate_output_mode super_feed_mode feed_mode
   global   mom_cycle_feed_rate_mode mom_cycle_feed_rate
   global   mom_cycle_feed_rate_per_rev
   global   mom_motion_type
   global   Feed_IPM Feed_IPR Feed_MMPM Feed_MMPR Feed_INV
   global   mom_sys_feed_param
   global   mom_sys_cycle_feed_mode


   set super_feed_mode $mom_feed_rate_output_mode

   set f_pm [ASK_FEEDRATE_FPM]
   set f_pr [ASK_FEEDRATE_FPR]

   switch $mom_motion_type {

      CYCLE {
         if { [info exists mom_sys_cycle_feed_mode] } {
            if { [string compare "Auto" $mom_sys_cycle_feed_mode] } {
               set mom_cycle_feed_rate_mode $mom_sys_cycle_feed_mode
            }
         }
         if { [info exists mom_cycle_feed_rate_mode] }    { set super_feed_mode $mom_cycle_feed_rate_mode }
         if { [info exists mom_cycle_feed_rate] }         { set f_pm $mom_cycle_feed_rate }
         if { [info exists mom_cycle_feed_rate_per_rev] } { set f_pr $mom_cycle_feed_rate_per_rev }
      }

      FROM -
      RETRACT -
      RETURN -
      LIFT -
      TRAVERSAL -
      GOHOME -
      GOHOME_DEFAULT -
      RAPID {
         SUPER_FEED_MODE_SET RAPID
      }

      default {
         if { [EQ_is_zero $f_pm] && [EQ_is_zero $f_pr] } {
            SUPER_FEED_MODE_SET RAPID
         } else {
            SUPER_FEED_MODE_SET CONTOUR
         }
      }
   }


   set feed_mode $super_feed_mode


  # Adjust feedrate format per Post output unit again.
   global mom_kin_output_unit
   if { ![string compare "IN" $mom_kin_output_unit] } {
      switch $feed_mode {
         MMPM {
            set feed_mode "IPM"
            CATCH_WARNING "Feedrate mode MMPM changed to IPM"
         }
         MMPR {
            set feed_mode "IPR"
            CATCH_WARNING "Feedrate mode MMPR changed to IPR"
         }
      }
   } else {
      switch $feed_mode {
         IPM {
            set feed_mode "MMPM"
            CATCH_WARNING "Feedrate mode IPM changed to MMPM"
         }
         IPR {
            set feed_mode "MMPR"
            CATCH_WARNING "Feedrate mode IPR changed to MMPR"
         }
      }
   }


   switch $feed_mode {
      IPM     -
      MMPM    { set feed $f_pm }
      IPR     -
      MMPR    { set feed $f_pr }
      DPM     { set feed [PB_CMD_FEEDRATE_DPM] }
      FRN     -
      INVERSE { set feed [PB_CMD_FEEDRATE_NUMBER] }
      default {
         CATCH_WARNING "INVALID FEED RATE MODE"
         return
      }
   }


  # Post Builder provided format for the current mode:
   if { [info exists mom_sys_feed_param(${feed_mode},format)] } {
      MOM_set_address_format F $mom_sys_feed_param(${feed_mode},format)
   } else {
      switch $feed_mode {
         IPM     -
         MMPM    -
         IPR     -
         MMPR    -
         DPM     -
         FRN     { MOM_set_address_format F Feed_${feed_mode} }
         INVERSE { MOM_set_address_format F Feed_INV }
      }
   }

  # Commentary output
   set com_feed_rate $f_pm


  # Execute user's command, if any.
   if { [llength [info commands "PB_CMD_FEEDRATE_SET"]] } {
      PB_CMD_FEEDRATE_SET
   }
}


#=============================================================
proc PB_CMD_kin_handle_sync_event { } {
#=============================================================
   PB_CMD_handle_sync_event
}


#=============================================================
proc PB_CMD_kin_init_new_iks { } {
#=============================================================
   global mom_kin_machine_type
   global mom_new_iks_exists

  # Revert legacy dual-head kinematic parameters when new IKS is absent.
   if { [string match "5_axis_dual_head" $mom_kin_machine_type] } {
      if { ![info exists mom_new_iks_exists] } {
         set ugii_version [string trim [MOM_ask_env_var UGII_VERSION]]
         if { ![string match "v3" $ugii_version] } {

            if { [CMD_EXIST PB_CMD_revert_dual_head_kin_vars] } {
               PB_CMD_revert_dual_head_kin_vars
            }
return
         }
      }
   }

  # Initialize new IKS parameters.
   if { [CMD_EXIST PB_init_new_iks] } {
      PB_init_new_iks
   }

  # Users can provide next command to modify or disable new IKS options.
   if { [CMD_EXIST PB_CMD_revise_new_iks] } {
      PB_CMD_revise_new_iks
   }

  # Revert legacy dual-head kinematic parameters when new IKS is disabled.
   if { [string match "5_axis_dual_head" $mom_kin_machine_type] } {
      global mom_kin_iks_usage
      if { $mom_kin_iks_usage == 0 } {
         if { [CMD_EXIST PB_CMD_revert_dual_head_kin_vars] } {
            PB_CMD_revert_dual_head_kin_vars
         }
      }
   }
}


#=============================================================
proc PB_CMD_kin_init_probing_cycles { } {
#=============================================================
   set cmd PB_CMD_init_probing_cycles
   if { [CMD_EXIST "$cmd"] } {
      eval $cmd
   }
}


#=============================================================
proc PB_CMD_kin_init_rotary { } {
#=============================================================
# Following commands are defined (via uplevel) here:
#
#    MOM_clamp
#    MOM_rotate
#    MOM_lock_axis
#    PB_catch_warning
#    MOM_lintol
#

   global mom_kin_machine_type

   if { [info exists mom_kin_machine_type] } {
      if { [string match "*3_axis_mill*" $mom_kin_machine_type] ||\
           [string match "*lathe*" $mom_kin_machine_type] } {
return
      }
   }


   if { [llength [info commands PB_CMD_init_rotary] ] } {
      PB_CMD_init_rotary
   }


#***********
uplevel #0 {


#=============================================================
### This is the backup of original MOM_clamp handler.
###
### - New command PB_CMD_MOM_clamp is created with the
###   same content of the original command and executed
###   by the new MOM_clamp handler.
###
proc DUMMY_MOM_clamp { } {
#=============================================================
  global mom_clamp_axis mom_clamp_status mom_sys_auto_clamp

   if { ![string compare "AUTO" $mom_clamp_axis] } {

      if { ![string compare "ON" $mom_clamp_status] } {
         set mom_sys_auto_clamp "ON"
      } elseif { ![string compare "OFF" $mom_clamp_status] } {
         set mom_sys_auto_clamp "OFF"
      }
   } else {
      CATCH_WARNING "$mom_clamp_axis not handled in current implementation!"
   }
}


#=============================================================
### This is the backup of original MOM_rotate handler.
###
### - New command PB_CMD_MOM_rotate is created with the
###   same content of the original command and executed
###   by the new MOM_rotate handler.
###
proc DUMMY_MOM_rotate { } {
#=============================================================
# This command handles a Rotate UDE.
#
# Key parameters set in UDE -
#   mom_rotate_axis_type        :  [ AAXIS | BAXIS   | CAXIS    | HEAD | TABLE | FOURTH_AXIS | FIFTH_AXIS ]
#   mom_rotation_mode           :  [ NONE  | ATANGLE | ABSOLUTE | INCREMENTAL ]
#   mom_rotation_direction      :  [ NONE  | CLW     | CCLW ]
#   mom_rotation_angle          :  Specified angle
#   mom_rotation_reference_mode :  [ ON    | OFF ]
#
   PB_CMD_kin__MOM_rotate
}


#=============================================================
### This is the backup of original MOM_lock_axis handler.
###
### - New command PB_CMD_MOM_lock_axis is created with the
###   same content of the original command and executed
###   by the new MOM_lock_axis handler.
###
proc DUMMY_MOM_lock_axis { } {
#=============================================================
  global mom_sys_lock_value mom_sys_lock_plane
  global mom_sys_lock_axis mom_sys_lock_status

   set status [SET_LOCK axis plane value]

   # Handle "error" condition returned from SET_LOCK
   # - Message in mom_warning_info
   if { ![string compare "error" $status] } {
      global mom_warning_info
      CATCH_WARNING $mom_warning_info

      set mom_sys_lock_status OFF
   } else {
      set mom_sys_lock_status $status
      if { [string compare "OFF" $status] } {
         set mom_sys_lock_axis $axis
         set mom_sys_lock_plane $plane
         set mom_sys_lock_value $value

         LOCK_AXIS_INITIALIZE
      }
   }
}


#=============================================================
proc PB_catch_warning { } {
#=============================================================
# Called by MOM_catch_warning (ugpost_base.tcl)
#
# - String with "mom_warning_info" (come from event generator or handlers)
#   may be output by MOM_catch_warning to the message file.
#
# - "mom_warning_info" will be transfered to "mom_sys_rotary_error" for
#   PB_CMD_kin_before_motion to handle the error condition.
#
   PB_CMD_kin_catch_warning
}


#=============================================================
proc MOM_lintol { } {
#=============================================================
   PB_CMD_kin__MOM_lintol
}


} ;# uplevel
#***********

}


#=============================================================
proc PB_CMD_kin_set_csys { } {
#=============================================================
# - For mill post -
#

  # Output NC code according to CSYS
   if { [CMD_EXIST PB_CMD_set_csys] } {
      PB_CMD_set_csys
   }

  # Overload IKS params from machine model.
   PB_CMD_reload_iks_parameters

  # In case Axis Rotation has been set to "reverse"
   if { [CMD_EXIST PB_CMD_reverse_rotation_vector] } {
      PB_CMD_reverse_rotation_vector
   }
}


#=============================================================
proc PB_CMD_kin_start_of_path { } {
#=============================================================
# - For mill post -
#
#  This command is executed at the start of every operation.
#  It will verify if a new head (post) was loaded and will
#  then initialize any functionality specific to that post.
#
#  It will also restore the master Start of Program &
#  End of Program event handlers.
#
#  --> DO NOT CHANGE THIS COMMAND UNLESS YOU KNOW WHAT YOU ARE DOING.
#  --> DO NOT CALL THIS COMMAND FROM ANY OTHER CUSTOM COMMAND.
#
  global mom_sys_head_change_init_program

   if { [info exists mom_sys_head_change_init_program] } {

      PB_CMD_kin_start_of_program
      unset mom_sys_head_change_init_program


     # Load alternate units' parameters
      if [CMD_EXIST PB_load_alternate_unit_settings] {
         PB_load_alternate_unit_settings
         rename PB_load_alternate_unit_settings ""
      }


     # Execute start of head callback in new post's context.
      global CURRENT_HEAD
      if { [info exists CURRENT_HEAD] && [CMD_EXIST PB_start_of_HEAD__$CURRENT_HEAD] } {
         PB_start_of_HEAD__$CURRENT_HEAD
      }

     # Restore master start & end of program handlers
      if { [CMD_EXIST "MOM_start_of_program_save"] } {
         if { [CMD_EXIST "MOM_start_of_program"] } {
            rename MOM_start_of_program ""
         }
         rename MOM_start_of_program_save MOM_start_of_program
      }
      if { [CMD_EXIST "MOM_end_of_program_save"] } {
         if { [CMD_EXIST "MOM_end_of_program"] } {
            rename MOM_end_of_program ""
         }
         rename MOM_end_of_program_save MOM_end_of_program
      }

     # Restore master head change event handler
      if { [CMD_EXIST "MOM_head_save"] } {
         if { [CMD_EXIST "MOM_head"] } {
            rename MOM_head ""
         }
         rename MOM_head_save MOM_head
      }
   }

  # Overload IKS params from machine model.
   PB_CMD_reload_iks_parameters

  # Incase Axis Rotation has been set to "reverse"
   if { [CMD_EXIST PB_CMD_reverse_rotation_vector] } {
      PB_CMD_reverse_rotation_vector
   }

  # Initialize tool time accumulator for this operation.
   if { [CMD_EXIST PB_CMD_init_oper_tool_time] } {
      PB_CMD_init_oper_tool_time
   }

  # Force out motion G code at the start of path.
   MOM_force once G_motion
}


#=============================================================
proc PB_CMD_kin_start_of_program { } {
#=============================================================
#  This command will execute the following custom commands for
#  initialization.  They will be executed once at the start of
#  program and again each time they are loaded as a linked post.
#  After execution they will be deleted so that they are not
#  present when a different post is loaded.  You may add a call
#  to any command that you want executed when a linked post is
#  loaded.
#
#  Note when a linked post is called in, the Start of Program
#  event marker is not executed again.
#
#  --> DO NOT REMOVE ANY LINES FROM THIS PROCEDURE UNLESS YOU KNOW
#      WHAT YOU ARE DOING.
#  --> DO NOT CALL THIS PROCEDURE FROM ANY
#      OTHER CUSTOM COMMAND.
#
   global mom_kin_machine_type


   set command_list [list]

   if { [info exists mom_kin_machine_type] } {
      if { ![string match "*3_axis_mill*" $mom_kin_machine_type] &&\
           ![string match "*lathe*" $mom_kin_machine_type] } {

         lappend command_list  PB_CMD_kin_init_rotary
      }
   }

   lappend command_list  PB_CMD_kin_init_new_iks

   lappend command_list  PB_CMD_init_pivot_offsets
   lappend command_list  PB_CMD_init_auto_retract
   lappend command_list  PB_CMD_initialize_parallel_zw_mode
   lappend command_list  PB_CMD_init_parallel_zw_mode
   lappend command_list  PB_CMD_initialize_tool_list
   lappend command_list  PB_CMD_init_tool_list
   lappend command_list  PB_CMD_init_tape_break
   lappend command_list  PB_CMD_initialize_spindle_axis
   lappend command_list  PB_CMD_init_spindle_axis
   lappend command_list  PB_CMD_initialize_helix
   lappend command_list  PB_CMD_init_helix
   lappend command_list  PB_CMD_pq_cutcom_initialize
   lappend command_list  PB_CMD_init_pq_cutcom

   lappend command_list  PB_CMD_kin_init_probing_cycles

   lappend command_list  PB_DEFINE_MACROS

   if { [info exists mom_kin_machine_type] } {
      if { [string match "*3_axis_mill_turn*" $mom_kin_machine_type] } {

         lappend command_list  PB_CMD_kin_init_mill_xzc
         lappend command_list  PB_CMD_kin_mill_xzc_init
        # lappend command_list  PB_CMD_kin_init_mill_turn
         lappend command_list  PB_CMD_kin_mill_turn_initialize
      }
   }


   foreach cmd $command_list {

      if { [CMD_EXIST "$cmd"] } {

        # <PB v2.0.2>
        # Old init commands for XZC/MILL_TURN posts are not executed.
        # Parameters set by these commands in the v2.0 legacy posts
        # will need to be transfered to PB_CMD_init_mill_xzc &
        # PB_CMD_init_mill_turn commands respectively.

         switch $cmd {
            "PB_CMD_kin_mill_xzc_init" -
            "PB_CMD_kin_mill_turn_initialize" {}
            default { eval $cmd }
         }
         rename $cmd ""
         proc $cmd { args } {}
      }
   }
}


#=============================================================
proc PB_CMD_linear_move { } {
#=============================================================
#
#  This procedure is used by many automatic postbuilder functions
#  to output a linear move.  Do NOT add this block to events or
#  markers.  It is a static block and it is not intended to be added
#  to events.  Do NOT change the name of this procedure.
#
#  If you need a custom command to be output with a linear move block,
#  you must place a call to the custom command either before or after
#  the MOM_do_template command.
#
#  This proc is used for:
#     simulated cycles feed moves
#     mill/turn mill linearization
#     four and five axis retract and re-engage
#
return

global mom_auto_tcpm_mode
global mom_sys_linear_code

if { $mom_auto_tcpm_mode == "ON" } {
    set mom_sys_linear_code "LN"
    MOM_force once G_motion X Y Z tcpm_x tcpm_y tcpm_z
    MOM_do_template linear_move_tcpm
} else {
    set mom_sys_linear_code "L"
    if { [TA_CHANGE] == 1 } {
    SET_TCPM "OFF"
    PLANE_ANGLES "TURN MB MAX FMAX"
    MOM_force once G_motion X Y Z
   }
    MOM_do_template linear_move
}
TA_SAVE

MOM_output_literal "; IT WAS LINEAR MOVE"
}


#=============================================================
proc PB_CMD_log_revisions { } {
#=============================================================
# Dummy command to log changes in this post --
#
# 02-26-09 gsl - Initial version
#
}


#=============================================================
proc PB_CMD_manual_tool_change { } {
#=============================================================
global mom_tool_name
global mom_tool_number
global mom_oper_tool

if { $mom_oper_tool == "NONE" } { MOM_abort_event }

MOM_output_literal "L Z-1 FMAX M91; Z GO HOME"
MOM_output_literal "M06"
}


#=============================================================
proc PB_CMD_negate_R_value { } {
#=============================================================
# This command negates the value of radius when the included angle
# of an arc is greater than 180.
#
# ==> This comamnd may be added to the Circular Move event for a post
#     of Fanuc controller when the R-style circular output format is used.
#
# 10-05-11 gsl - (pb801 IR2178985) Initial version
#

   global mom_arc_angle mom_arc_radius

   if [expr $mom_arc_angle > 180.0] {
      set mom_arc_radius [expr -1*$mom_arc_radius]
   }
}


#=============================================================
proc PB_CMD_operation_mode { } {
#=============================================================
global mom_tool_axis_type
global mom_operation_type
global mom_tool_path_type
global mom_pb_operation ; # MILL CYCLE TRAORI

if {[info exists mom_pb_operation]} { unset mom_pb_operation }

### Check if operation is a 5 axis operation or 3+2 operation.
if {[string match "Point*" $mom_operation_type] || \
       [string match "Hole*" $mom_operation_type] || \
                    [string match "*Drill*" $mom_operation_type]} {
       set mom_pb_operation PLANE

} elseif { [string match "*Generic*" $mom_operation_type] } {
          set mom_pb_operation TRAORI

} elseif { [string match "*variable*" $mom_tool_path_type] && ([string match "*Variable*" $mom_operation_type] || \
     [string match "*Sequential*" $mom_operation_type]) } {
          set mom_pb_operation TRAORI

} elseif { ![info exist mom_tool_axis_type] } {
          set mom_pb_operation PLANE

} elseif { $mom_tool_axis_type > 3 } {
          set mom_pb_operation TRAORI

} elseif { $mom_tool_axis_type > 0 } {
          set mom_pb_operation PLANE

} else { set mom_pb_operation PLANE }

}


#=============================================================
proc PB_CMD_pause { } {
#=============================================================
# This command enables you to pause the UG/Post processing.
#
  PAUSE
}


#=============================================================
proc PB_CMD_plane_csys { } {
#=============================================================
# type MOVE, TURN, STAY

global mom_csys_matrix
global RAD2DEG

set m0 $mom_csys_matrix(0)
set m1 $mom_csys_matrix(1)
set m3 $mom_csys_matrix(3)
set m4 $mom_csys_matrix(4)
set m6 $mom_csys_matrix(6)
set m7 $mom_csys_matrix(7)
set m8 $mom_csys_matrix(8)

set cos_b_sq [expr $m0*$m0 + $m3*$m3]

if {[EQ_is_equal $cos_b_sq 0.0]} {

set cos_b 0.0
set cos_c 1.0
set cos_a $m4
set sin_c 0.0

if {$m6 < 0.0} {

  set sin_b 1.0
  set sin_a $m1

   } else {

   set sin_b -1.0
   set sin_a [expr -$m3]

   }

  } else {

  set cos_b [expr sqrt($cos_b_sq)]
  set sin_b [expr -$m6]

  set cos_a [expr $m8/$cos_b]
  set sin_a [expr $m7/$cos_b]

  set cos_c [expr $m0/$cos_b]
  set sin_c [expr $m3/$cos_b]

 }

  set A [expr -atan2($sin_a,$cos_a)*$RAD2DEG]
  set B [expr -atan2($sin_b,$cos_b)*$RAD2DEG]
  set C [expr -atan2($sin_c,$cos_c)*$RAD2DEG]
  if {[EQ_is_lt $A 0.0]} {set A [expr $A+360.0]}
  if {[EQ_is_lt $B 0.0]} {set B [expr $B+360.0]}
  if {[EQ_is_lt $C 0.0]} {set C [expr $C+360.0]}

  set A [format "%.3f" $A]
  set B [format "%.3f" $B]
  set C [format "%.3f" $C]

global user_saved_csys_origin
set user_csys_origin [format "X%.3f Y%.3f Z%.3f" $mom_csys_matrix(9) $mom_csys_matrix(10) $mom_csys_matrix(11)]
if { ![info exist user_saved_csys_origin] || $user_saved_csys_origin != $user_csys_origin } {
#          MOM_output_literal  "TRANS DATUM AXIS $user_csys_origin"
   }
set user_saved_csys_origin $user_csys_origin

global mom_plane_transformation_status
set mom_plane_transformation_status ON
set plane_transformation_type TURN
MOM_output_literal "PLANE SPATIAL SPA$A SPB$B SPC$C $plane_transformation_type"

}


#=============================================================
proc PB_CMD_program_time { } {
#=============================================================
global mom_sum_time
if { [info exist mom_sum_time] } {
     MOM_output_literal "; ========================="
     MOM_output_literal ";TIME : [format "%0.1f" $mom_sum_time] MIN"
     MOM_output_literal "; ========================="
   }

}


#=============================================================
proc PB_CMD_read_cycle_pos_list { } {
#=============================================================
global mom_cycle_pos_list
global mom_pos mom_out_angle_pos
global mom_mcs_goto
global mom_cycle_feed_to
global mom_operation_name

set new_pos "X[format "%0.3f" $mom_mcs_goto(0)] Y[format "%0.3f" $mom_mcs_goto(1)] Z[format "%0.3f" $mom_mcs_goto(2)]"
set new_dep [format "%0.3f" $mom_cycle_feed_to]

if {[info exist mom_cycle_pos_list]} {
     foreach dats $mom_cycle_pos_list {
         set h_pos [string first "H" $dats]
         set hole_pos [string range $dats 0 [expr $h_pos-1]]
         set hole_dep [string range $dats [expr $h_pos+1] end]

         if { $new_pos == $hole_pos && [expr abs($new_dep)] > [expr abs($hole_dep)] } {
                set new_mom_pos "X[format "%0.3f" $mom_pos(0)] Y[format "%0.3f" $mom_pos(1)] Z[format "%0.3f" $mom_pos(2)]"
                append new_mom_pos " B[format "%0.3f" $mom_out_angle_pos(0)] C[format "%0.3f" $mom_out_angle_pos(1)]"
                set resume "В операции нарезания резьбы $mom_operation_name \n"
                append resume "Для отверстия с координатами $new_mom_pos \n"
                append resume "Неправильно задана глубина обработки $new_dep \n"
                MOM_output_to_listing_device $resume
                PAUSE "В операции нарезания резьбы $mom_operation_name \n Ошибочно задана глубина нарезания резьбы"
         }
     } ; # foreach
} ; # List
}


#=============================================================
proc PB_CMD_reload_iks_parameters { } {
#=============================================================
# This command overloads new IKS params from a machine model.(NX4)
# It will be executed automatically at the start of each path
# or when CSYS has changed.
#
   global mom_csys_matrix
   global mom_kin_iks_usage

  #----------------------------------------------------------
  # Set a classification to fetch kinematic parameters from
  # a particular set of K-components of a machine.
  # - Default is NONE.
  #----------------------------------------------------------
   set custom_classification NONE

   if { [info exists mom_kin_iks_usage] && $mom_kin_iks_usage == 1 } {
      if { [info exists mom_csys_matrix] } {
         if { [llength [info commands MOM_validate_machine_model] ] } {
            if { [MOM_validate_machine_model] == "TRUE" } {
               MOM_reload_iks_parameters "$custom_classification"
               MOM_reload_kinematics
            }
         }
      }
   }
}


#=============================================================
proc PB_CMD_reposition_move { } {
#=============================================================
#
#  This procedure is used by rotary axis retract to reposition the
#  rotary axes after the tool has been fully retracted.
#
#  You can modify the this procedure to customize the reposition move.
#  If you need a custom command to be output with this block,
#  you must place a call a the custom command either before or after
#  the MOM_do_template command.
#

#return
# MOM_output_literal ";REPOSITION AFTER RETRACT"

global mom_pos mom_prev_alt_pos
global mom_mcs_goto mom_prev_mcs_goto
global retract_distance
global mom_tool_axis mom_prev_tool_axis
global mom_retract_pos
global mom_sys_linear_code mom_sys_rapid_code
set save_mcs_goto() 3
set save_tool_axis() 3
global f_max

# PLANE_ANGLES "TURN MB MAX FMAX"
# MOM_output_literal "L Z-1 FMAX M91; Z GO HOME"
PLANE_ANGLES "TURN MB MAX FMAX"

VMOV 5 mom_prev_alt_pos mom_pos
   set out_format "String"
   set f_max "MAX"
   MOM_set_address_format f_max $out_format
MOM_suppress once Z fourth_axis fifth_axis
MOM_force once G_motion X Y
MOM_do_template rapid_traverse
set mom_pos(2) [expr $mom_pos(2) + $retract_distance]
MOM_force once Z
MOM_do_template rapid_spindle

PLANE_RESET "STAY"
PB_CMD_TCPM_on

VMOV 3 mom_mcs_goto save_mcs_goto
VMOV 3 mom_prev_mcs_goto mom_mcs_goto
VMOV 3 mom_tool_axis save_tool_axis
VMOV 3 mom_prev_tool_axis mom_tool_axis

MOM_force once G_motion X Y Z tcpm_x tcpm_y tcpm_z
MOM_do_template linear_move_traori

VMOV 3 save_mcs_goto mom_mcs_goto
VMOV 3 save_tool_axis mom_tool_axis

}


#=============================================================
proc PB_CMD_reset_all_motion_variables_to_zero { } {
#=============================================================
 # Stage for MOM_reload_kinematics
   global mom_prev_pos
   global mom_pos
   global mom_mcs_goto
   global mom_prev_out_angle_pos
   global mom_out_angle_pos
   global mom_prev_rot_ang_4th
   global mom_prev_rot_ang_5th
   global mom_rotation_angle

   set mom_prev_pos(0) 0.0
   set mom_prev_pos(1) 0.0
   set mom_prev_pos(2) 0.0
   set mom_prev_pos(3) 0.0
   set mom_prev_pos(4) 0.0

   VMOV 3 mom_mcs_goto mom_pos
   set mom_out_angle_pos(0) 0.0
   set mom_out_angle_pos(1) 0.0
   set mom_pos(3) 0.0
   set mom_pos(4) 0.0

   set mom_prev_out_angle_pos(0) 0.0
   set mom_prev_out_angle_pos(1) 0.0

   set mom_prev_rot_ang_4th 0.0
   set mom_prev_rot_ang_5th 0.0

   set mom_rotation_angle 0.0

   MOM_reload_variable -a mom_prev_pos
   MOM_reload_variable -a mom_pos
   MOM_reload_variable -a mom_prev_out_angle_pos
   MOM_reload_variable -a mom_out_angle_pos
   MOM_reload_variable mom_prev_rot_ang_4th
   MOM_reload_variable mom_prev_rot_ang_5th
   MOM_reload_variable mom_rotation_angle

   MOM_reload_kinematics

global mom_skip_planar_move
if { [info exist mom_skip_planar_move] } { unset mom_skip_planar_move }

VAR_DELETE

}


#=============================================================
proc PB_CMD_restore_work_plane_change { } {
#=============================================================
#<02-18-08 gsl> Restore work plane change flag, if being disabled due to a simulated cycle.

  global mom_user_work_plane_change mom_sys_work_plane_change
  global mom_user_spindle_first spindle_first

  if { [info exists mom_user_work_plane_change] } {
    set mom_sys_work_plane_change $mom_user_work_plane_change
    set spindle_first $mom_user_spindle_first
    UI_UNSET mom_user_work_plane_change
    UI_UNSET mom_user_spindle_first
  }
}


#=============================================================
proc PB_CMD_retract_move { } {
#=============================================================
#  This procedure is used by rotary axis retract to move away from
#  the part.  This move is a three axis move along the tool axis at
#  a retract feedrate.
#
#  You can modify the this procedure to customize the retract move.
#  If you need a custom command to be output with this block,
#  you must place a call to the custom command either before or after
#  the MOM_do_template command.
#

#return
# MOM_output_literal ";RETRACT AWAY FROM PART"

global mom_mcs_goto mom_prev_mcs_goto
global retract_distance
global mom_tool_axis mom_prev_tool_axis
global mom_auto_tcpm_mode
global mom_sys_linear_code

set retract_distance 50
set mom_retract_pos() 3
set saved_goto_pos() 3
set saved_ta() 3
VMOV 3 mom_mcs_goto saved_goto_pos

set mom_retract_pos(0) [expr $mom_prev_mcs_goto(0) + ($retract_distance * $mom_prev_tool_axis(0))]
set mom_retract_pos(1) [expr $mom_prev_mcs_goto(1) + ($retract_distance * $mom_prev_tool_axis(1))]
set mom_retract_pos(2) [expr $mom_prev_mcs_goto(2) + ($retract_distance * $mom_prev_tool_axis(2))]

VMOV 3 mom_tool_axis saved_ta
VMOV 3 mom_prev_tool_axis mom_tool_axis
VMOV 3 mom_retract_pos mom_mcs_goto

MOM_force once G_motion X Y Z tcpm_x tcpm_y tcpm_z
MOM_do_template linear_move_traori
VMOV 3 saved_goto_pos mom_mcs_goto
VMOV 3 saved_ta mom_tool_axis
PB_CMD_TCPM_off
MOM_output_literal "L Z-1 FMAX M91; Z GO HOME"
# MOM_output_literal "M140 MB MAX"

}


#=============================================================
proc PB_CMD_reverse_rotation_vector { } {
#=============================================================
# This command fixes the vectors of rotary axes.
# It will be executed automatically when present.
# Do not attach it with any Event markers.
#

  global mom_kin_iks_usage
  global mom_csys_matrix

   set reverse_vector 0

   if { [info exists mom_kin_iks_usage] && $mom_kin_iks_usage == 1 } {
      if { [info exists mom_csys_matrix] } {
         if { [llength [info commands MOM_validate_machine_model] ] } {
            if { [MOM_validate_machine_model] == "TRUE" } {
               set reverse_vector 1
            }
         }
      }
   }

   if $reverse_vector {

     global mom_kin_4th_axis_vector mom_kin_5th_axis_vector
     global mom_kin_4th_axis_rotation mom_kin_5th_axis_rotation

      foreach axis { 4th_axis 5th_axis } {

         if { [info exists mom_kin_${axis}_rotation] && [string match "reverse" [set mom_kin_${axis}_rotation]] } {

            if { [info exists mom_kin_${axis}_vector] } {
               foreach i { 0 1 2 } {
                  set mom_kin_${axis}_vector($i) [expr -1 * [set mom_kin_${axis}_vector($i)]]
               }
            }
         }
      }

      MOM_reload_kinematics
   }
}


#=============================================================
proc PB_CMD_revert_dual_head_kin_vars { } {
#=============================================================
# Only dual-head 5-axis mill posts will be affected by this
# command.
#
# This command reverts kinematic parameters for dual-head 5-axis
# mill posts to maintain compatibility and to allow the posts
# to run in UG/Post prior to NX3.
#
# Attributes of the 4th & 5th Addresses, their locations in
# the Master Word Sequence and all the Blocks that use these
# Addresses will be reconditioned with call to
#
#     PB_swap_dual_head_elements
#
#-------------------------------------------------------------
# 04-15-05 gsl - Added for PB v3.4
#-------------------------------------------------------------

  global mom_kin_machine_type


  if { ![string match  "5_axis_dual_head"  $mom_kin_machine_type] } {
return
  }


  set var_list { ang_offset center_offset(0) center_offset(1) center_offset(2) direction incr_switch leader limit_action max_limit min_incr min_limit plane rotation zero }

  set center_offset_set 0

  foreach var $var_list {
    # Global declaration
    if { [string match "center_offset*" $var] } {
      if { !$center_offset_set } {
         global mom_kin_4th_axis_center_offset mom_kin_5th_axis_center_offset
         set center_offset_set 1
      }
    } else {
      global mom_kin_4th_axis_[set var] mom_kin_5th_axis_[set var]
    }

    # Swap values
    set val [set mom_kin_4th_axis_[set var]]
    set mom_kin_4th_axis_[set var] [set mom_kin_5th_axis_[set var]]
    set mom_kin_5th_axis_[set var] $val
  }

  # Update kinematic parameters
  MOM_reload_kinematics


  # Swap address leaders
  global mom_sys_leader

  set val $mom_sys_leader(fourth_axis)
  set mom_sys_leader(fourth_axis) $mom_sys_leader(fifth_axis)
  set mom_sys_leader(fifth_axis)  $val

  # Swap elements in definition file
  if { [llength [info commands PB_swap_dual_head_elements] ] } {
     PB_swap_dual_head_elements
  }
}


#=============================================================
proc PB_CMD_revise_new_iks { } {
#=============================================================
# This command is executed automatically, which allows you
# to change the default IKS parameters or disable the IKS
# service completely.
#
# *** Do not attach this command to any event marker! ***
#
   global mom_kin_iks_usage
   global mom_kin_rotary_axis_method
   global mom_kin_spindle_axis
   global mom_kin_4th_axis_vector
   global mom_kin_5th_axis_vector


  # Uncomment next statement to disable new IKS service
  # set mom_kin_iks_usage           0


  # Uncomment next statement to change rotary solution method
  # set mom_kin_rotary_axis_method  "ZERO"


  # Uncomment next statement, if any parameter above has changed.
  # MOM_reload_kinematics
}


#=============================================================
proc PB_CMD_safe_table_reload { } {
#=============================================================
### release
global mom_use_safe_point
global mom_sys_home_pos
global rotary_saved
global mom_out_angle_pos

if { ![EQ_is_equal $rotary_saved(0) $mom_out_angle_pos(0)] || \
        ([info exist mom_use_safe_point] && $mom_use_safe_point == "TRUE") } {

  MOM_output_literal "L Z[format "%0.3f" $mom_sys_home_pos(2)] FMAX M91"
  MOM_output_literal "L X[format "%0.3f" $mom_sys_home_pos(0)] Y[format "%0.3f" $mom_sys_home_pos(1)] FMAX M91"
}

}


#=============================================================
proc PB_CMD_set_csys { } {
#=============================================================
global mom_fixture_offset_value
global user_saved_tool_vector
global mom_main_mcs user_saved_main_mcs
#global mom_coordinate_system_purpose
#  0 - any local mcs
#  1 - main_mcs
#global mom_kin_coordinate_system_type
# MAIN  CSYS  LOCAL
#global mom_special_output
# 0 - no
# 1 - use_main
# 2 - shift
# 3 - rotation
#================================

#===== NEW MAIN MCS
if { [info exist user_saved_main_mcs] } {
   PB_CMD_TCPM_off
   PLANE_RESET "B0C0"
}

if { $mom_fixture_offset_value == 0 } { set mom_fixture_offset_value 1 }
if { $mom_fixture_offset_value > 53 } { set mom_fixture_offset_value [expr $mom_fixture_offset_value - 53] }

MOM_output_text "; ========================="
MOM_output_literal "* - ZERO POINT : $mom_fixture_offset_value"
MOM_output_literal "CYCL DEF 247 Q339=+$mom_fixture_offset_value ; NUMBER IN TNC:PRESET.PR"

if { ![info exist user_saved_main_mcs] } {
        PB_CMD_BLANK_form
        set user_saved_main_mcs $mom_main_mcs
}

}


#=============================================================
proc PB_CMD_set_cycle_plane { } {
#=============================================================
# Use this command to determine and output proper plane code
# when G17/18/19 is used in the cycle definition.
#
# <04-15-08 gsl> - Add initialization for protection
# <03-06-08 gsl> - Declare needed global variables
# <02-28-08 gsl> - Make use of mom_spindle_axis
#


 #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 # This option can be set to 1, if the address of cycle's
 # principal axis needs to be suppressed. (Ex. Siemens controller)
 #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  set suppress_principal_axis 0


 #++++++++++++++++++++++++++++++++++++++++++++++++++++++
 # This option can be set to 1, if the plane code needs
 # to be forced out @ the start of every set of cycles.
 #++++++++++++++++++++++++++++++++++++++++++++++++++++++
  set force_plane_code 0


  global mom_cycle_spindle_axis
  global mom_spindle_axis
  global mom_cutcom_plane mom_pos_arc_plane


 # Initialization as protection
  global mom_sys_spindle_axis
  if { ![info exists mom_sys_spindle_axis] } {
     set mom_sys_spindle_axis(0) 0.0
     set mom_sys_spindle_axis(1) 0.0
     set mom_sys_spindle_axis(2) 1.0
  }
  if { ![info exists mom_spindle_axis] } {
     VMOV 3 mom_sys_spindle_axis mom_spindle_axis
  }


 # Default cycle spindle axis to Z
  set mom_cycle_spindle_axis 2


  if { [EQ_is_equal [expr abs($mom_spindle_axis(0))] 1.0] } {
    set mom_cycle_spindle_axis 0
  }

  if { [EQ_is_equal [expr abs($mom_spindle_axis(1))] 1.0] } {
    set mom_cycle_spindle_axis 1
  }


  switch $mom_cycle_spindle_axis {
    0 {
      set mom_cutcom_plane  YZ
      set mom_pos_arc_plane YZ
      set principal_axis X
    }
    1 {
      set mom_cutcom_plane  ZX
      set mom_pos_arc_plane ZX
      set principal_axis Y
    }
    2 {
      set mom_cutcom_plane  XY
      set mom_pos_arc_plane XY
      set principal_axis Z
    }
    default {
      set mom_cutcom_plane  UNDEFINED
      set mom_pos_arc_plane UNDEFINED
      set principal_axis ""
    }
  }


  if { $suppress_principal_axis && [string length $principal_axis] > 0 } {
    MOM_suppress once $principal_axis
  }


  if { $force_plane_code } {
    global cycle_init_flag

    if { [info exists cycle_init_flag] && [string match "TRUE" $cycle_init_flag] } {
      MOM_force once G_plane
    }
  }

}


#=============================================================
proc PB_CMD_set_cycle_pos_list { } {
#=============================================================
global mom_cycle_pos_list
global mom_mcs_goto
global mom_cycle_feed_to
global mom_operation_name

set new_pos "X[format "%0.3f" $mom_mcs_goto(0)] Y[format "%0.3f" $mom_mcs_goto(1)] Z[format "%0.3f" $mom_mcs_goto(2)]"
set new_dep [format "%0.3f" $mom_cycle_feed_to]

   set start_i 0
   set m_exist 0

if {[info exist mom_cycle_pos_list]} {
     foreach dats $mom_cycle_pos_list {
         set h_pos [string first "H" $dats]
         set hole_pos [string range $dats 0 [expr $h_pos-1]]
         set hole_dep [string range $dats [expr $h_pos+1] end]

         if { $new_pos == $hole_pos } {
              if { [expr abs($new_dep)] > [expr abs($hole_dep)] } {
                    set replace_dat $new_pos
                    append replace_dat "H$new_dep"
                    set mom_cycle_pos_list [lreplace $mom_cycle_pos_list $start_i $start_i $replace_dat]
                 }
            set m_exist 1
         }
          incr start_i
     } ; # foreach
} ; # List

if { $m_exist == 0 } {
     append new_pos "H$new_dep"
     lappend mom_cycle_pos_list $new_pos
}

}


#=============================================================
proc PB_CMD_set_helix { } {
#=============================================================
global mom_pos mom_prev_pos
global mom_helix_angle
global mom_helix_depth mom_helix_pitch
global mom_arc_direction mom_arc_angle

  if { $mom_arc_direction == "CLW" } {
        set helix_mod -1
  } else { set helix_mod 1 }

MOM_force_block once circle_center
MOM_suppress once K
MOM_do_template circle_center

set mom_helix_angle $mom_arc_angle

if { [EQ_is_gt $mom_helix_angle 5400.0]} {
        set h_d [expr $mom_pos(2) - $mom_prev_pos(2)]
        set h_a $mom_arc_angle
     while { $h_a > 5400.0 } {
             set h_a [expr $h_a - 5400.0]
             set h_d [expr $h_d - ($mom_helix_pitch * 15.0)]
             set mom_helix_angle [expr 5400.0 * $helix_mod]
             set mom_helix_depth [expr $mom_helix_pitch * 15.0]
             MOM_force_block once helix_move
             MOM_do_template helix_move
      }
    set mom_helix_depth $h_d
    set mom_helix_angle [expr $h_a * $helix_mod]

} else {
    set mom_helix_depth [expr $mom_pos(2) - $mom_prev_pos(2)]
    set mom_helix_angle [expr $mom_arc_angle * $helix_mod]
}

MOM_force_block once helix_move

}


#=============================================================
proc PB_CMD_set_operation_time { } {
#=============================================================
global mom_sys_add_cutting_time

if { ![info exist mom_sys_add_cutting_time] } { set mom_sys_add_cutting_time 0 }

global mom_machine_time mom_oper_time mom_sum_time
global mom_toolpath_cutting_time

if { ![info exist mom_machine_time] } { return }
if { ![info exist mom_sum_time] } { set mom_sum_time 0 }
set mom_oper_time [expr $mom_machine_time - $mom_sum_time]
set dll_path [MOM_ask_env_var UGII_CAM_RESOURCE_DIR]
set time_dll ${dll_path}oper_time\\x64\\Release\\oper_time.dll
catch [MOM_run_user_function $time_dll ufusr]
set mom_sum_time $mom_machine_time

}


#=============================================================
proc PB_CMD_set_principal_axis { } {
#=============================================================
# This command can be used to determine the principal axis.
#
# => It can be used to determine a proper work plane when the
#    "Work Plane" parameter is not specified with an operation.
#
#
# <06-22-09 gsl> - Extracted from PB_CMD_set_cycle_plane
# <10-09-09 gsl> - Do not define mom_pos_arc_plane unless it doesn't exist.
# <03-10-10 gsl> - Respect tool axis for 3-axis & XZC cases
# <01-21-11 gsl> - Enhance header description
# <07-12-12 gsl> - Find principal axis for XZC-mill from the spindle axis
#

   global mom_cycle_spindle_axis
   global mom_spindle_axis
   global mom_cutcom_plane mom_pos_arc_plane


  # Initialization spindle axis
   global mom_kin_spindle_axis
   global mom_sys_spindle_axis
   if { ![info exists mom_kin_spindle_axis] } {
      set mom_kin_spindle_axis(0) 0.0
      set mom_kin_spindle_axis(1) 0.0
      set mom_kin_spindle_axis(2) 1.0
   }
   if { ![info exists mom_sys_spindle_axis] } {
      VMOV 3 mom_kin_spindle_axis mom_sys_spindle_axis
   }
   if { ![info exists mom_spindle_axis] } {
      VMOV 3 mom_sys_spindle_axis mom_spindle_axis
   }


  # Default cycle spindle axis to Z
   set mom_cycle_spindle_axis 2


  # Respect tool axis only for 3-axis mill
   global mom_kin_machine_type mom_tool_axis
   if [string match "3_axis_mill" $mom_kin_machine_type] {
      VMOV 3 mom_tool_axis spindle_axis
   } else {
      VMOV 3 mom_spindle_axis spindle_axis
   }


   if { [EQ_is_equal [expr abs($spindle_axis(0))] 1.0] } {
      set mom_cycle_spindle_axis 0
   }

   if { [EQ_is_equal [expr abs($spindle_axis(1))] 1.0] } {
      set mom_cycle_spindle_axis 1
   }


   switch $mom_cycle_spindle_axis {
      0 {
         set mom_cutcom_plane  YZ
      }
      1 {
         set mom_cutcom_plane  ZX
      }
      2 {
         set mom_cutcom_plane  XY
      }
      default {
         set mom_cutcom_plane  UNDEFINED
      }
   }

   # Set arc plane when it's not defined
   if { ![info exists mom_pos_arc_plane] || $mom_pos_arc_plane == "" } {
      set mom_pos_arc_plane $mom_cutcom_plane
   }
}


#=============================================================
proc PB_CMD_spindle_code { } {
#=============================================================
global mom_spindle_direction mom_tool_direction

if { [info exist mom_tool_direction] && $mom_tool_direction != 0 } {
     if { $mom_tool_direction == 2 } {
          set mom_spindle_direction CCLW
     } else { set mom_spindle_direction CLW }
}
MOM_force once M_spindle M_coolant
}


#=============================================================
proc PB_CMD_spindle_speed { } {
#=============================================================
global mom_oper_tool mom_tool_number
global mom_spindle_speed

if { $mom_oper_tool == "NONE" } { return }
MOM_output_literal "TOOL CALL $mom_tool_number Z S[format "%0.0f" $mom_spindle_speed]"


}


#=============================================================
proc PB_CMD_start_of_alignment_character { } {
#=============================================================
# This command can be used to output a special sequence number character.
# Replace the ":" with any character that you require.
# You must use the command "PB_CMD_end_of_alignment_character" to reset
# the sequence number back to the original setting.
#
  global mom_sys_leader saved_seq_num
  set saved_seq_num $mom_sys_leader(N)
  set mom_sys_leader(N) ":"
}


#=============================================================
proc PB_CMD_suppress_linear_block_plane_code { } {
#=============================================================
# This command is to be called in the linear move event to suppress
# G_plane address when the cutcom status has not changed.
# -- Assuming G_cutcom address is modal and G_plane exists in the block
#
#<10-11-09 gsl> - New
#<01-20-11 gsl> - Force out plane code for the 1st linear move when CUTCOM is on
#<03-16-12 gsl> - Added use of CALLED_BY
#

  # Restrict this command to be executed only by MOM_linear_move
   if { ![CALLED_BY "MOM_linear_move"] } {
return
   }


   global mom_cutcom_status mom_user_prev_cutcom_status

   if { ![info exists mom_cutcom_status] } {
      set mom_cutcom_status UNDEFINED
   }

   if { ![info exists mom_user_prev_cutcom_status] } {
      set mom_user_prev_cutcom_status UNDEFINED
   }


  # Suppress plane code when no change of CUTCOM status
   if { [string match "UNDEFINED" $mom_cutcom_status] ||\
        [string match $mom_user_prev_cutcom_status $mom_cutcom_status] } {

      MOM_suppress once G_plane

   } else {

     # Force out plane code for the 1st CUTCOM activation of an operation,
     # otherwise plane code will only come out when work plane has changed
     # since last activation.
     #

      set force_1st_plane_code  "1"


      if { $force_1st_plane_code } {

        # This var should have been set in PB_first_linear_move
         global mom_sys_first_linear_move

         if { ![info exists mom_sys_first_linear_move] || $mom_sys_first_linear_move } {

            if { [string match "LEFT"  $mom_cutcom_status] ||\
                 [string match "RIGHT" $mom_cutcom_status] ||\
                 [string match "ON"    $mom_cutcom_status] } {

               MOM_force once G_plane
               set mom_sys_first_linear_move 0
            }
         }
      }
   }


   if { ![string match $mom_user_prev_cutcom_status $mom_cutcom_status] } {
      set mom_user_prev_cutcom_status $mom_cutcom_status
   }
}


#=============================================================
proc PB_CMD_table_reload_pos { } {
#=============================================================
global mom_use_safe_point

  MOM_force_block once home_pos_move
  MOM_suppress once X Y
  MOM_do_template home_pos_move

  if { [info exist mom_use_safe_point] && $mom_use_safe_point == "TRUE" } {
          MOM_force_block once home_pos_move
          MOM_suppress once Z
          MOM_do_template home_pos_move
          return 1
  } else { return 0 }

}


#=============================================================
proc PB_CMD_unclamp_fifth_axis { } {
#=============================================================
#
#  This procedure is used by auto clamping to output the code
#  needed to unclamp the fifth axis.
#
#  Do NOT add this block to events or markers.  It is a static
#  block and it is not intended to be added to events.  Do NOT
#  change the name of this custom command.
#
#  MOM_output_literal "M13"
}


#=============================================================
proc PB_CMD_unclamp_fourth_axis { } {
#=============================================================
#
#  This procedure is used by auto clamping to output the code
#  needed to unclamp the fourth axis.
#
#  Do NOT add this block to events or markers.  It is a static
#  block and it is not intended to be added to events.  Do NOT
#  change the name of this custom command.
#
#  MOM_output_literal "M11"
}


#=============================================================
proc ANGLE_CHECK { a axis } {
#=============================================================
# called by ROTARY_AXIS_RETRACT
#
#   Return:
#     1: Within limits
#    -1: Out of limits
#     0: Special condition (0 ~ 360 & MAGNITUDE_DETERMINES_DIRECTION)
#

   upvar $a ang

   global mom_kin_4th_axis_max_limit
   global mom_kin_5th_axis_max_limit
   global mom_kin_4th_axis_min_limit
   global mom_kin_5th_axis_min_limit
   global mom_kin_4th_axis_direction
   global mom_kin_5th_axis_direction

   if { $axis == 4 } {
      set min $mom_kin_4th_axis_min_limit
      set max $mom_kin_4th_axis_max_limit
      set dir $mom_kin_4th_axis_direction
   } else {
      set min $mom_kin_5th_axis_min_limit
      set max $mom_kin_5th_axis_max_limit
      set dir $mom_kin_5th_axis_direction
   }

   if { [EQ_is_equal $min 0.0] && [EQ_is_equal $max 360.0] &&\
       ![string compare "MAGNITUDE_DETERMINES_DIRECTION" $dir] } {

      return 0

   } else {

      while { $ang > $max && $ang > [expr $min + 360.0] } { set ang [expr $ang - 360.0] }
      while { $ang < $min && $ang < [expr $max - 360.0] } { set ang [expr $ang + 360.0] }

      if { $ang > $max || $ang < $min } {

         return -1

      } else {

         return 1
      }
   }
}


#=============================================================
proc ARCTAN { y x } {
#=============================================================
   global PI

   if { [EQ_is_zero $y] } { set y 0 }
   if { [EQ_is_zero $x] } { set x 0 }

   if { [expr $y == 0] && [expr $x == 0] } {
      return 0
   }

   set ang [expr atan2($y,$x)]

   if { $ang < 0 } {
      return [expr $ang + $PI*2]
   } else {
      return $ang
   }
}


#=============================================================
proc ARR_sort_array_vals { ARR } {
#=============================================================
# This command will sort and return a list containing the indexed elements of an array.
#
   upvar $ARR arr

   set list [list]
   foreach a [lsort -dictionary [array names arr]] {
      if ![catch {expr $arr($a)}] {
         set val [format "%+.5f" $arr($a)]
      } else {
         set val $arr($a)
      }
      lappend list ($a) $val
   }

return $list
}


#=============================================================
proc AUTO_CLAMP {  } {
#=============================================================
#  This command is used to automatically output clamp and unclamp
#  codes.  This command must be called in the the command
#  << PB_CMD_kin_before_motion >>.  By default this command will
#  output M10 or M11 to do clamping or unclamping for the 4th axis or
#  M12 or M13 for the 5th axis.
#

  # Must be called by PB_CMD_kin_before_motion
   if { ![CALLED_BY "PB_CMD_kin_before_motion"] } {
return
   }


   global mom_pos
   global mom_prev_pos

   global mom_sys_auto_clamp

   if { ![info exists mom_sys_auto_clamp] || ![string match "ON" $mom_sys_auto_clamp] } {
return
   }

   set rotary_out [EQ_is_equal $mom_pos(3) $mom_prev_pos(3)]

   AUTO_CLAMP_1 $rotary_out

   set rotary_out [EQ_is_equal $mom_pos(4) $mom_prev_pos(4)]

   AUTO_CLAMP_2 $rotary_out
}


#=============================================================
proc AUTO_CLAMP_1 { out } {
#=============================================================
# called by AUTO_CLAMP & MOM_rotate

   global clamp_rotary_fourth_status

   if { ![info exists clamp_rotary_fourth_status] ||\
       ( $out == 0 && ![string match "UNCLAMPED" $clamp_rotary_fourth_status] ) } {

      PB_CMD_unclamp_fourth_axis
      set clamp_rotary_fourth_status "UNCLAMPED"

   } elseif { $out == 1 && ![string match "CLAMPED" $clamp_rotary_fourth_status] } {

      PB_CMD_clamp_fourth_axis
      set clamp_rotary_fourth_status "CLAMPED"
   }
}


#=============================================================
proc AUTO_CLAMP_2 { out } {
#=============================================================
# called by AUTO_CLAMP & MOM_rotate

   global mom_kin_machine_type

   set machine_type [string tolower $mom_kin_machine_type]
   switch $machine_type {
      5_axis_dual_table -
      5_axis_dual_head  -
      5_axis_head_table { }

      default           {
return
      }
   }

   global clamp_rotary_fifth_status

   if { ![info exists clamp_rotary_fifth_status] ||\
        ( $out == 0 && ![string match "UNCLAMPED" $clamp_rotary_fifth_status] ) } {

      PB_CMD_unclamp_fifth_axis
      set clamp_rotary_fifth_status "UNCLAMPED"

   } elseif { $out == 1 && ![string match "CLAMPED" $clamp_rotary_fifth_status] } {

      PB_CMD_clamp_fifth_axis
      set clamp_rotary_fifth_status "CLAMPED"
   }
}


#=============================================================
proc AXIS_SET { axis } {
#=============================================================
# called by MOM_rotate & SET_LOCK

  global mom_sys_leader

   if { ![string compare "[string index $mom_sys_leader(fourth_axis) 0]AXIS" $axis] } {
      return 3
   } elseif { ![string compare "[string index $mom_sys_leader(fifth_axis) 0]AXIS" $axis] } {
      return 4
   } else {
      return 0
   }
}


#=============================================================
proc CALC_CYLINDRICAL_RETRACT_POINT { refpt axis dist ret_pt } {
#=============================================================
# called by ROTARY_AXIS_RETRACT

  upvar $refpt rfp ; upvar $axis ax ; upvar $ret_pt rtp

#
# Return 0: parallel or lies on plane
#        1: unique intersection
#


#
# Create plane canonical form
#
   VMOV 3 ax plane
   set plane(3) $dist

   set num [expr $plane(3) - [VEC3_dot rfp plane]]
   set dir [VEC3_dot ax plane]

   if { [EQ_is_zero $dir] } {
return 0
   }

   for { set i 0 } { $i < 3 } { incr i } {
      set rtp($i) [expr $rfp($i) + $ax($i)*$num/$dir]
   }

return [RETRACT_POINT_CHECK rfp ax rtp]
}


#=============================================================
proc CALC_SPHERICAL_RETRACT_POINT { refpt axis cen_sphere rad_sphere int_pts } {
#=============================================================
# called by ROTARY_AXIS_RETRACT

  upvar $refpt rp ; upvar $axis ta ; upvar $cen_sphere cs
  upvar $int_pts ip

   set rad [expr $rad_sphere*$rad_sphere]
   VEC3_sub rp cs v1

   set coeff(2) 1.0
   set coeff(1) [expr ($v1(0)*$ta(0) + $v1(1)*$ta(1) + $v1(2)*$ta(2))*2.0]
   set coeff(0) [expr $v1(0)*$v1(0) + $v1(1)*$v1(1) + $v1(2)*$v1(2) - $rad]

   set num_sol [SOLVE_QUADRATIC coeff roots iroots status degree]
   if { $num_sol == 0 } { return 0 }

   if { [expr $roots(0)] > [expr $roots(1)] || $num_sol == 1 } {
      set d $roots(0)
   } else {
      set d $roots(1)
   }

   set ip(0) [expr $rp(0) + $d*$ta(0)]
   set ip(1) [expr $rp(1) + $d*$ta(1)]
   set ip(2) [expr $rp(2) + $d*$ta(2)]

return [RETRACT_POINT_CHECK rp ta ip]
}


#=============================================================
proc CALLED_BY { caller {out_warn 0} args } {
#=============================================================
# This command can be used in the beginning of a command
# to designate a specific caller for the command in question.
#
# - Users can set the optional flag "out_warn" to "1" to output
#   warning message when a command is being called by a
#   non-designated caller. By default, warning message is suppressed.
#
#  Syntax:
#    if { ![CALLED_BY "cmd_string"] } { return ;# or do something }
#  or
#    if { ![CALLED_BY "cmd_string" 1] } { return ;# To output warning }
#
# Revisions:
#-----------
# 05-25-10 gsl - Initial implementation
# 03-09-11 gsl - Enhanced description
#

   if { ![string compare "$caller" [info level -2] ] } {
return 1
   } else {
      if { $out_warn } {
         CATCH_WARNING "\"[info level -1]\" can not be executed in \"[info level -2]\". \
                        It must be called by \"$caller\"!"
      }
return 0
   }
}


#=============================================================
proc CATCH_WARNING { msg {output 1} } {
#=============================================================
# This command is called in a post to spice up the message to be output to the warning file.
#
   global mom_warning_info
   global mom_motion_event
   global mom_event_number
   global mom_motion_type
   global mom_operation_name


   if { $output == 1 } {

      set level [info level]
      set call_stack ""
      for { set i 1 } { $i < $level } { incr i } {
         set call_stack "$call_stack\[ [lindex [info level $i] 0] \]"
      }

      global mom_o_buffer
      if { ![info exists mom_o_buffer] } {
         set mom_o_buffer ""
      }

      if { ![info exists mom_motion_event] } {
         set mom_motion_event ""
      }

      if { [info exists mom_operation_name] && [string length $mom_operation_name] } {
         set mom_warning_info "$msg\n\  Operation $mom_operation_name - Event $mom_event_number [MOM_ask_event_type] :\
                               $mom_motion_event ($mom_motion_type)\n\    $mom_o_buffer\n\      $call_stack"
      } else {
         set mom_warning_info "$msg\n\  Event $mom_event_number [MOM_ask_event_type] :\
                               $mom_motion_event ($mom_motion_type)\n\    $mom_o_buffer\n\      $call_stack"
      }

      MOM_catch_warning
   }

   # Restore mom_warning_info for subsequent use
   set mom_warning_info $msg
}


#=============================================================
proc CHECK_LOCK_ROTARY_AXIS { axis mtype } {
#=============================================================
# called by SET_LOCK

   global mom_sys_leader

   set is_valid 0
   set lock_axis_leader ""

   if { $mtype == 4 } {
      # For 4-axis machine, the locked rotary axis must be the fourth axis.
      if { [string match "FIFTH" $axis] } {
         return $is_valid
      }

      set lock_axis_leader [string index $mom_sys_leader(fourth_axis) 0]

   } elseif { $mtype == 5 } {
      # For 5-axis machine, the locked rotary axis must be the fifth axis.
      if { [string match "FOURTH" $axis] } {
         return $is_valid
      }

      set lock_axis_leader [string index $mom_sys_leader(fifth_axis) 0]

   } else {

      return $is_valid
   }

   # Handle the case when axis is "AAXIS", "BAXIS" or "CAXIS"
   set cur_axis_leader [string index $axis 0]
   switch $cur_axis_leader {
      A -
      B -
      C {
         if { [string match $lock_axis_leader $cur_axis_leader] } {
            # The specified rotary axis is valid
            set is_valid 1
         }
      }
      default {
         set is_valid 1
      }
   }

   return $is_valid
}


#=============================================================
proc CMD_EXIST { cmd {out_warn 0} args } {
#=============================================================
# This command can be used to detect the existence of a command
# before executing it.
# - Users can set the optional flag "out_warn" to "1" to output
#   warning message when a command to be called doesn't exist.
#   By default, warning message is suppressed.
#
#  Syntax:
#    if { [CMD_EXIST "cmd_string"] } { cmd_string }
#  or
#    if { [CMD_EXIST "cmd_string" 1] } { cmd_string ;# To output warning }
#
# Revisions:
#-----------
# 05-25-10 gsl - Initial implementation
# 03-09-11 gsl - Enhanced description
#

   if { [llength [info commands "$cmd"] ] } {
return 1
   } else {
      if { $out_warn } {
         CATCH_WARNING "Command \"$cmd\" called by \"[info level -1]\" does not exist!"
      }
return 0
   }
}


#=============================================================
proc DELAY_TIME_SET {  } {
#=============================================================
  global mom_sys_delay_param mom_delay_value
  global mom_delay_revs mom_delay_mode delay_time

   # post builder provided format for the current mode:
    if {[info exists mom_sys_delay_param(${mom_delay_mode},format)] != 0} {
      MOM_set_address_format dwell $mom_sys_delay_param(${mom_delay_mode},format)
    }

    switch $mom_delay_mode {
      SECONDS {set delay_time $mom_delay_value}
      default {set delay_time $mom_delay_revs}
    }
}


#=============================================================
proc EQ_is_equal { s t } {
#=============================================================
return [EQ_is_zero [expr $s - $t]]
}


#=============================================================
proc EQ_is_zero { s } {
#=============================================================
   global mom_system_tolerance

   if { [info exists mom_system_tolerance] && [expr $mom_system_tolerance > 0.0] } {
      set tol $mom_system_tolerance
   } else {
      set tol 0.0000001
   }

   if { [expr abs($s) <= $tol] } { return 1 } else { return 0 }
}


#=============================================================
proc EXEC { command_string {__wait 1} } {
#=============================================================
# This command can be used in place of the intrinsic Tcl "exec" command
# of which some problems have been reported under Win64 O/S and multi-core
# processors environment.
#
#
# Input:
#   command_string -- command string
#   __wait         -- optional flag
#                     1 (default)   = Caller will wait until execution is complete.
#                     0 (specified) = Caller will not wait.
#
# Return:
#   Results of execution
#
#
# Revisions:
#-----------
# 05-19-10 gsl - Initial implementation
#

   global tcl_platform


   if { $__wait } {

      if { [string match "windows" $tcl_platform(platform)] } {

         global env mom_logname

        # Create a temporary file to collect output
         set result_file "$env(TEMP)/${mom_logname}__EXEC_[clock clicks].out"

        # Clean up existing file
         regsub -all {\\} $result_file {/}  result_file
        #regsub -all { }  $result_file {\ } result_file

         if { [file exists "$result_file"] } {
            file delete -force "$result_file"
         }

         set cmd [concat exec $command_string > \"$result_file\"]
         regsub -all {\\} $cmd {\\\\} cmd

         eval $cmd

        # Return results & clean up temporary file
         if { [file exists "$result_file"] } {
            set fid [open "$result_file" r]
            set result [read $fid]
            close $fid

            file delete -force "$result_file"

           return $result
         }

      } else {

         set cmd [concat exec $command_string]

        return [eval $cmd]
      }

   } else {

      if { [string match "windows" $tcl_platform(platform)] } {

         set cmd [concat exec $command_string &]
         regsub -all {\\} $cmd {\\\\} cmd

        return [eval $cmd]

      } else {

        return [exec $command_string &]
      }
   }
}




#=============================================================
proc GET_SPINDLE_AXIS { input_tool_axis } {
#=============================================================
# called by ROTARY_AXIS_RETRACT

   upvar $input_tool_axis axis

   global mom_kin_4th_axis_type
   global mom_kin_4th_axis_plane
   global mom_kin_5th_axis_type
   global mom_kin_spindle_axis
   global mom_sys_spindle_axis

   if { ![string compare "Table" $mom_kin_4th_axis_type] } {
      VMOV 3 mom_kin_spindle_axis mom_sys_spindle_axis
   } elseif { ![string compare "Table" $mom_kin_5th_axis_type] } {
      VMOV 3 axis vec
      if { ![string compare "XY" $mom_kin_4th_axis_plane] } {
         set vec(2) 0.0
      } elseif { ![string compare "ZX" $mom_kin_4th_axis_plane] } {
         set vec(1) 0.0
      } elseif { ![string compare "YZ" $mom_kin_4th_axis_plane] } {
         set vec(0) 0.0
      }
      set len [VEC3_unitize vec mom_sys_spindle_axis]
      if { [EQ_is_zero $len] } { set mom_sys_spindle_axis(2) 1.0 }
   } else {
      VMOV 3 axis mom_sys_spindle_axis
   }
}


#=============================================================
proc INFO { args } {
#=============================================================
   MOM_output_to_listing_device [join $args]
}


#=============================================================
proc LIMIT_ANGLE { a } {
#=============================================================
   set a [expr fmod($a,360)]
   set a [expr ($a < 0) ? ($a + 360) : $a]

return $a
}


#=============================================================
proc LINEARIZE_LOCK_MOTION {  } {
#=============================================================
# called by LOCK_AXIS_MOTION
#
#  This command linearizes the move between two positions that
#  have both linear and rotary motion.  The rotary motion is
#  created by LOCK_AXIS from the coordinates in the locked plane.
#  The combined linear and rotary moves result in non-linear
#  motion.  This command will break the move into shorter moves
#  that do not violate the tolerance.
#
   global mom_pos
   global mom_prev_pos
   global unlocked_pos
   global unlocked_prev_pos
   global mom_kin_linearization_tol
   global mom_kin_machine_resolution
   global mom_out_angle_pos

   VMOV 5 mom_pos locked_pos
   VMOV 5 mom_prev_pos locked_prev_pos

   UNLOCK_AXIS locked_pos unlocked_pos
   UNLOCK_AXIS locked_prev_pos unlocked_prev_pos

   VMOV 5 unlocked_pos save_unlocked_pos
   VMOV 5 locked_pos save_locked_pos

   set loop 0
   set count 0

   set tol $mom_kin_linearization_tol

   while { $loop == 0 } {

      for { set i 3 } { $i < 5 } { incr i } {
         set del [expr $locked_pos($i) - $locked_prev_pos($i)]
         if { $del > 180.0 } {
            set locked_prev_pos($i) [expr $locked_prev_pos($i)+360.0]
         } elseif { $del < -180.0 } {
            set locked_prev_pos($i) [expr $locked_prev_pos($i)-360.0]
         }
      }

      set loop 1

      for { set i 0 } { $i < 5 } { incr i } {
         set mid_unlocked_pos($i) [expr ($unlocked_pos($i)+$unlocked_prev_pos($i))/2.0]
         set mid_locked_pos($i) [expr ($locked_pos($i)+$locked_prev_pos($i))/2.0]
      }

      UNLOCK_AXIS mid_locked_pos temp

      VEC3_sub temp mid_unlocked_pos work

      set error [VEC3_mag work]

      if { $count > 20 } {

         VMOV 5 locked_pos mom_pos
         VMOV 5 unlocked_pos mom_prev_pos

         LINEARIZE_LOCK_OUTPUT $count

      } elseif { $error < $tol } {

         VMOV 5 locked_pos mom_pos
         VMOV 5 unlocked_pos mom_prev_pos

         LINEARIZE_LOCK_OUTPUT $count

         VMOV 5 unlocked_pos unlocked_prev_pos
         VMOV 5 locked_pos locked_prev_pos

         if { $count != 0 } {
            VMOV 5 save_unlocked_pos unlocked_pos
            VMOV 5 save_locked_pos locked_pos
            set loop 0
            set count 0
         }

      } else {

         if { $error < $mom_kin_machine_resolution } {
            set error $mom_kin_machine_resolution
         }

         set error [expr sqrt($mom_kin_linearization_tol*.98/$error)]

         if { $error < .5 } { set error .5 }

         for { set i 0 } { $i < 5 } { incr i } {
            set locked_pos($i) [expr $locked_prev_pos($i)+($locked_pos($i)-$locked_prev_pos($i))*$error]
            set unlocked_pos($i) [expr $unlocked_prev_pos($i)+($unlocked_pos($i)-$unlocked_prev_pos($i))*$error]
         }

         LOCK_AXIS unlocked_pos locked_pos mom_outangle_pos

         set loop 0
         incr count
      }
   }
}


#=============================================================
proc LINEARIZE_LOCK_OUTPUT { count } {
#=============================================================
# called by LOCK_AXIS_MOTION & LINEARIZE_LOCK_MOTION

   global mom_out_angle_pos
   global mom_pos
   global mom_prev_rot_ang_4th
   global mom_prev_rot_ang_5th
   global mom_kin_4th_axis_direction
   global mom_kin_5th_axis_direction
   global mom_kin_4th_axis_leader
   global mom_kin_5th_axis_leader
   global mom_sys_leader
   global mom_prev_pos
   global mom_mcs_goto
   global mom_prev_mcs_goto
   global mom_motion_distance
   global mom_feed_rate_number
   global mom_feed_rate
   global mom_kin_machine_resolution
   global mom_kin_max_frn
   global mom_kin_machine_type
   global mom_kin_4th_axis_min_limit mom_kin_4th_axis_max_limit
   global mom_kin_5th_axis_min_limit mom_kin_5th_axis_max_limit
   global mom_out_angle_pos
   global unlocked_pos unlocked_prev_pos


   set mom_out_angle_pos(0)  [ROTSET $mom_pos(3) $mom_prev_rot_ang_4th $mom_kin_4th_axis_direction\
                                     $mom_kin_4th_axis_leader mom_sys_leader(fourth_axis)\
                                     $mom_kin_4th_axis_min_limit $mom_kin_4th_axis_max_limit]
   if { [info exists mom_kin_5th_axis_direction] } {
      set mom_out_angle_pos(1)  [ROTSET $mom_pos(4) $mom_prev_rot_ang_5th $mom_kin_5th_axis_direction\
                                        $mom_kin_5th_axis_leader mom_sys_leader(fifth_axis)\
                                        $mom_kin_5th_axis_min_limit $mom_kin_5th_axis_max_limit]
   }

#
#  Re-calcualte the distance and feed rate number
#

   if { $count < 0 } {
      VEC3_sub mom_mcs_goto mom_prev_mcs_goto delta
   } else {
      VEC3_sub unlocked_pos unlocked_prev_pos delta
   }
   set mom_motion_distance [VEC3_mag delta]
   if { [EQ_is_lt $mom_motion_distance $mom_kin_machine_resolution] } {
      set mom_feed_rate_number $mom_kin_max_frn
   } else {
      set mom_feed_rate_number [expr $mom_feed_rate / $mom_motion_distance]
   }

   set mom_pos(3) $mom_out_angle_pos(0)

   FEEDRATE_SET

   if { $count > 0 } { PB_CMD_linear_move }

#   set mom_prev_pos(3) $mom_out_angle_pos(0)
}


#=============================================================
proc LOCK_AXIS { input_point output_point output_rotary } {
#=============================================================
# called by LOCK_AXIS_MOTION & LINEARIZE_LOCK_MOTION

   upvar $input_point ip ; upvar $output_point op ; upvar $output_rotary or

   global mom_kin_4th_axis_center_offset
   global mom_kin_5th_axis_center_offset
   global mom_sys_lock_value
   global mom_sys_lock_plane
   global mom_sys_lock_axis
   global mom_sys_unlocked_axis
   global mom_sys_4th_axis_index
   global mom_sys_5th_axis_index
   global mom_sys_linear_axis_index_1
   global mom_sys_linear_axis_index_2
   global mom_sys_rotary_axis_index
   global mom_kin_machine_resolution
   global mom_prev_lock_angle
   global mom_out_angle_pos
   global mom_prev_rot_ang_4th
   global mom_prev_rot_ang_5th
   global positive_radius
   global DEG2RAD
   global RAD2DEG
   global mom_kin_4th_axis_rotation
   global mom_kin_5th_axis_rotation

   if { ![info exists positive_radius] } { set positive_radius 0 }

   if { $mom_sys_rotary_axis_index == 3 } {
      if { ![info exists mom_prev_rot_ang_4th] } { set mom_prev_rot_ang_4th 0.0 }
      set mom_prev_lock_angle $mom_prev_rot_ang_4th
   } else {
      if { ![info exists mom_prev_rot_ang_5th] } { set mom_prev_rot_ang_5th 0.0 }
      set mom_prev_lock_angle $mom_prev_rot_ang_5th
   }

   if { ![info exists mom_kin_4th_axis_center_offset] } {
      set temp(0) $ip(0)
      set temp(1) $ip(1)
      set temp(2) $ip(2)
   } else {
      VEC3_sub ip mom_kin_4th_axis_center_offset temp
   }

   if { [info exists mom_kin_5th_axis_center_offset] } {
      VEC3_sub temp mom_kin_5th_axis_center_offset temp
   }

   set temp(3) $ip(3)
   set temp(4) $ip(4)

   if { $mom_sys_lock_axis > 2 } {
      set angle [expr ($mom_sys_lock_value-$temp($mom_sys_lock_axis))*$DEG2RAD]
      ROTATE_VECTOR $mom_sys_lock_plane $angle temp temp1
      VMOV 3 temp1 temp
      set temp($mom_sys_lock_axis) $mom_sys_lock_value
   } else {
      if { ![string compare $mom_sys_lock_plane $mom_sys_5th_axis_index] } {
         set angle [expr ($temp(4))*$DEG2RAD]

         # <03-11-10 wbh> 6308668 Check the rotation mode
         if [string match "reverse" $mom_kin_5th_axis_rotation] {
            set angle [expr -$angle]
         }

         ROTATE_VECTOR $mom_sys_5th_axis_index $angle temp temp1
         VMOV 3 temp1 temp
         set temp(4) 0.0
      }
      set rad [expr sqrt($temp($mom_sys_linear_axis_index_1)*$temp($mom_sys_linear_axis_index_1) +\
                         $temp($mom_sys_linear_axis_index_2)*$temp($mom_sys_linear_axis_index_2))]
      set angle [ARCTAN $temp($mom_sys_linear_axis_index_2) $temp($mom_sys_linear_axis_index_1)]

      # <03-11-10 wbh> 6308668 Check the rotation mode
      if { ![string compare $mom_sys_lock_plane $mom_sys_5th_axis_index] } {
         if [string match "reverse" $mom_kin_5th_axis_rotation] {
            set angle [expr -$angle]
         }
      } elseif { ![string compare $mom_sys_lock_plane $mom_sys_4th_axis_index] } {
         if [string match "reverse" $mom_kin_4th_axis_rotation] {
            set angle [expr -$angle]
         }
      }

      if { $rad < [expr abs($mom_sys_lock_value) + $mom_kin_machine_resolution] } {
         if { $mom_sys_lock_value < 0.0 } {
            set temp($mom_sys_lock_axis) [expr -$rad]
         } else {
            set temp($mom_sys_lock_axis) $rad
         }
      } else {
         set temp($mom_sys_lock_axis) $mom_sys_lock_value
      }

      set temp($mom_sys_unlocked_axis)  [expr sqrt($rad*$rad - $temp($mom_sys_lock_axis)*$temp($mom_sys_lock_axis))]

      VMOV 5 temp temp1
      set temp1($mom_sys_unlocked_axis) [expr -$temp($mom_sys_unlocked_axis)]
      set ang1 [ARCTAN $temp($mom_sys_linear_axis_index_2) $temp($mom_sys_linear_axis_index_1)]
      set ang2 [ARCTAN $temp1($mom_sys_linear_axis_index_2) $temp1($mom_sys_linear_axis_index_1)]
      set temp($mom_sys_rotary_axis_index) [expr ($angle-$ang1)*$RAD2DEG]
      set temp1($mom_sys_rotary_axis_index) [expr ($angle-$ang2)*$RAD2DEG]
      set ang1 [LIMIT_ANGLE [expr $mom_prev_lock_angle-$temp($mom_sys_rotary_axis_index)]]
      set ang2 [LIMIT_ANGLE [expr $mom_prev_lock_angle-$temp1($mom_sys_rotary_axis_index)]]
      if { $ang1 > 180.0 } { set ang1 [LIMIT_ANGLE [expr -$ang1]] }
      if { $ang2 > 180.0 } { set ang2 [LIMIT_ANGLE [expr -$ang2]] }
      if { $positive_radius == 0 } {
         if { $ang1 > $ang2 } {
            VMOV 5 temp1 temp
            set positive_radius "-1"
         } else {
            set positive_radius "1"
         }
      } elseif { $positive_radius == -1 } {
         VMOV 5 temp1 temp
      }

   }

   if { [info exists mom_kin_4th_axis_center_offset] } {
      VEC3_add temp mom_kin_4th_axis_center_offset op
   } else {
      set op(0) $temp(0)
      set op(1) $temp(1)
      set op(2) $temp(2)
   }

   if { [info exists mom_kin_5th_axis_center_offset] } {
      VEC3_add op mom_kin_5th_axis_center_offset op
   }

   if { ![info exists or] } {
      set or(0) 0.0
      set or(1) 0.0
   }

   set mom_prev_lock_angle $temp($mom_sys_rotary_axis_index)
   set op(3) $temp(3)
   set op(4) $temp(4)
}


#=============================================================
proc LOCK_AXIS_INITIALIZE {  } {
#=============================================================
# called by MOM_lock_axis
# ==> It's only used by MOM_lock_axis, perhaps it should be defined within.

   global mom_sys_lock_plane
   global mom_sys_lock_axis
   global mom_sys_unlocked_axis
   global mom_sys_unlock_plane
   global mom_sys_4th_axis_index
   global mom_sys_5th_axis_index
   global mom_sys_linear_axis_index_1
   global mom_sys_linear_axis_index_2
   global mom_sys_rotary_axis_index
   global mom_kin_4th_axis_plane
   global mom_kin_5th_axis_plane
   global mom_kin_machine_type

   if { $mom_sys_lock_plane == -1 } {
      if { ![string compare "XY" $mom_kin_4th_axis_plane] } {
         set mom_sys_lock_plane 2
      } elseif { ![string compare "ZX" $mom_kin_4th_axis_plane] } {
         set mom_sys_lock_plane 1
      } elseif { ![string compare "YZ" $mom_kin_4th_axis_plane] } {
         set mom_sys_lock_plane 0
      }
   }

   set mom_sys_4th_axis_index -1
   if { ![string compare "XY" $mom_kin_4th_axis_plane] } {
      set mom_sys_4th_axis_index 2
   } elseif { ![string compare "ZX" $mom_kin_4th_axis_plane] } {
      set mom_sys_4th_axis_index 1
   } elseif { ![string compare "YZ" $mom_kin_4th_axis_plane] } {
      set mom_sys_4th_axis_index 0
   }


  # Check whether the machine type is 5-axis.
   set mom_sys_5th_axis_index -1
   if { [string match "5_axis_*" $mom_kin_machine_type] && [info exists mom_kin_5th_axis_plane] } {
      if { ![string compare "XY" $mom_kin_5th_axis_plane] } {
         set mom_sys_5th_axis_index 2
      } elseif { ![string compare "ZX" $mom_kin_5th_axis_plane] } {
         set mom_sys_5th_axis_index 1
      } elseif { ![string compare "YZ" $mom_kin_5th_axis_plane] } {
         set mom_sys_5th_axis_index 0
      }
   }


   if { $mom_sys_lock_plane == 0 } {
      set mom_sys_linear_axis_index_1 1
      set mom_sys_linear_axis_index_2 2
   } elseif { $mom_sys_lock_plane == 1 } {
      set mom_sys_linear_axis_index_1 2
      set mom_sys_linear_axis_index_2 0
   } elseif { $mom_sys_lock_plane == 2 } {
      set mom_sys_linear_axis_index_1 0
      set mom_sys_linear_axis_index_2 1
   }

   if { $mom_sys_5th_axis_index == -1 } {
      set mom_sys_rotary_axis_index 3
   } else {
      set mom_sys_rotary_axis_index 4
   }

   set mom_sys_unlocked_axis [expr $mom_sys_linear_axis_index_1 + $mom_sys_linear_axis_index_2 - $mom_sys_lock_axis]
}


#=============================================================
proc LOCK_AXIS_MOTION {  } {
#=============================================================
# called by PB_CMD_kin_before_motion
#
#  The UDE lock_axis must be specified in the tool path
#  for the post to lock the requested axis.  The UDE lock_axis may only
#  be used for four and five axis machine tools.  A four axis post may
#  only lock an axis in the plane of the fourth axis.  For five axis
#  posts only the fifth axis may be locked.  Five axis will only
#  output correctly if the fifth axis is rotated so it is perpendicular
#  to the spindle axis.
#

  # Must be called by PB_CMD_kin_before_motion
   if { ![CALLED_BY "PB_CMD_kin_before_motion"] } {
return
   }


  global mom_sys_lock_status

   if { [string match "ON" $mom_sys_lock_status] } {

      global mom_pos mom_out_angle_pos
      global mom_current_motion
      global mom_motion_type
      global mom_cycle_feed_to_pos
      global mom_cycle_feed_to mom_tool_axis
      global mom_motion_event
      global mom_cycle_rapid_to_pos
      global mom_cycle_retract_to_pos
      global mom_cycle_rapid_to
      global mom_cycle_retract_to
      global mom_prev_pos
      global mom_kin_4th_axis_type
      global mom_kin_spindle_axis
      global mom_kin_5th_axis_type
      global mom_kin_4th_axis_plane
      global mom_sys_cycle_after_initial
      global mom_kin_4th_axis_min_limit
      global mom_kin_4th_axis_max_limit
      global mom_kin_5th_axis_min_limit
      global mom_kin_5th_axis_max_limit
      global mom_prev_rot_ang_4th
      global mom_prev_rot_ang_5th
      global mom_kin_4th_axis_direction
      global mom_kin_5th_axis_direction
      global mom_kin_4th_axis_leader
      global mom_kin_5th_axis_leader


      if { [string match "circular_move" $mom_current_motion] } {
return
      }


      if { ![info exists mom_sys_cycle_after_initial] } {
         set mom_sys_cycle_after_initial "FALSE"
      }

      if { [string match "FALSE" $mom_sys_cycle_after_initial] } {
         LOCK_AXIS mom_pos mom_pos mom_out_angle_pos
      }

      if { [string match "CYCLE" $mom_motion_type] } {

        if { [string match "initial_move" $mom_motion_event] } {
           set mom_sys_cycle_after_initial "TRUE"
return
        }

        if { [string match "TRUE" $mom_sys_cycle_after_initial] } {
           set mom_pos(0) [expr $mom_pos(0) - $mom_cycle_rapid_to * $mom_tool_axis(0)]
           set mom_pos(1) [expr $mom_pos(1) - $mom_cycle_rapid_to * $mom_tool_axis(1)]
           set mom_pos(2) [expr $mom_pos(2) - $mom_cycle_rapid_to * $mom_tool_axis(2)]
        }

        set mom_sys_cycle_after_initial "FALSE"

        if { [string match "Table" $mom_kin_4th_axis_type] } {

           VMOV 3 mom_kin_spindle_axis mom_sys_spindle_axis

        } elseif { [string match "Table" $mom_kin_5th_axis_type] } {

           VMOV 3 mom_tool_axis vec

           switch $mom_kin_4th_axis_plane {
              XY {
                 set vec(2) 0.0
              }
              ZX {
                 set vec(1) 0.0
              }
              YZ {
                 set vec(0) 0.0
              }
           }

           set len [VEC3_unitize vec mom_sys_spindle_axis]

           if { [EQ_is_zero $len] } {
              set mom_sys_spindle_axis(2) 1.0
           }

        } else {

           VMOV 3 mom_tool_axis mom_sys_spindle_axis
        }

        set mom_cycle_feed_to_pos(0) [expr $mom_pos(0) + $mom_cycle_feed_to * $mom_sys_spindle_axis(0)]
        set mom_cycle_feed_to_pos(1) [expr $mom_pos(1) + $mom_cycle_feed_to * $mom_sys_spindle_axis(1)]
        set mom_cycle_feed_to_pos(2) [expr $mom_pos(2) + $mom_cycle_feed_to * $mom_sys_spindle_axis(2)]

        set mom_cycle_rapid_to_pos(0) [expr $mom_pos(0) + $mom_cycle_rapid_to * $mom_sys_spindle_axis(0)]
        set mom_cycle_rapid_to_pos(1) [expr $mom_pos(1) + $mom_cycle_rapid_to * $mom_sys_spindle_axis(1)]
        set mom_cycle_rapid_to_pos(2) [expr $mom_pos(2) + $mom_cycle_rapid_to * $mom_sys_spindle_axis(2)]

        set mom_cycle_retract_to_pos(0) [expr $mom_pos(0) + $mom_cycle_retract_to * $mom_sys_spindle_axis(0)]
        set mom_cycle_retract_to_pos(1) [expr $mom_pos(1) + $mom_cycle_retract_to * $mom_sys_spindle_axis(1)]
        set mom_cycle_retract_to_pos(2) [expr $mom_pos(2) + $mom_cycle_retract_to * $mom_sys_spindle_axis(2)]

      }

      global mom_kin_linearization_flag

      if { ![string compare "TRUE" $mom_kin_linearization_flag] &&\
            [string compare "RAPID" $mom_motion_type] &&\
            [string compare "RETRACT" $mom_motion_type] } {

         LINEARIZE_LOCK_MOTION

      } else {

         if { ![info exists mom_prev_rot_ang_4th] } { set mom_prev_rot_ang_4th 0.0 }
         if { ![info exists mom_prev_rot_ang_5th] } { set mom_prev_rot_ang_5th 0.0 }

         LINEARIZE_LOCK_OUTPUT -1

         #<09-15-09 wbh> We must call ROTSET only one time for the 4th and/or 5th axis.
         # Since the ROTSET was called in LINEARIZE_LOCK_OUTPUT,
         # we should reload mom_prev_rot_ang_5th if it exists.
         if { [info exists mom_kin_5th_axis_direction] } {
            set mom_prev_rot_ang_5th $mom_out_angle_pos(1)
            MOM_reload_variable mom_prev_rot_ang_5th
         }
      }

      set mom_prev_rot_ang_4th $mom_out_angle_pos(0)
      MOM_reload_variable mom_prev_rot_ang_4th
      MOM_reload_variable -a mom_pos
   }
}


#=============================================================
proc LOCK_AXIS_SUB { axis } {
#=============================================================
# called by SET_LOCK

  global mom_pos mom_lock_axis_value_defined mom_lock_axis_value

   if { $mom_lock_axis_value_defined == 1 } {
      return $mom_lock_axis_value
   } else {
      return $mom_pos($axis)
   }
}


#=============================================================
proc MAXMIN_ANGLE { a max min {tol_flag 0} } {
#=============================================================
   if { $tol_flag == 0 } { ;# Direct comparison

      while { $a < $min } { set a [expr $a + 360.0] }
      while { $a > $max } { set a [expr $a - 360.0] }

   } else { ;# Tolerant comparison

      while { [EQ_is_lt $a $min] } { set a [expr $a + 360.0] }
      while { [EQ_is_gt $a $max] } { set a [expr $a - 360.0] }
   }

return $a
}


#=============================================================
proc PAUSE { args } {
#=============================================================
# Revisions:
#-----------
# 05-19-10 gsl - Use EXEC command
#

   global env

   if { [info exists env(PB_SUPPRESS_UGPOST_DEBUG)]  &&  $env(PB_SUPPRESS_UGPOST_DEBUG) == 1 } {
  return
   }


   global gPB

   if { [info exists gPB(PB_disable_MOM_pause)]  &&  $gPB(PB_disable_MOM_pause) == 1 } {
  return
   }


   global tcl_platform

   set cam_aux_dir  [MOM_ask_env_var UGII_CAM_AUXILIARY_DIR]

   if { [string match "*windows*" $tcl_platform(platform)] } {
      set ug_wish "ugwish.exe"
   } else {
      set ug_wish ugwish
   }

   if { [file exists ${cam_aux_dir}$ug_wish]  &&  [file exists ${cam_aux_dir}mom_pause.tcl] } {

      set title ""
      set msg ""

      if { [llength $args] == 1 } {
         set msg [lindex $args 0]
      }

      if { [llength $args] > 1 } {
         set title [lindex $args 0]
         set msg [lindex $args 1]
      }

      set command_string [concat \"${cam_aux_dir}$ug_wish\" \"${cam_aux_dir}mom_pause.tcl\" \"$title\" \"$msg\"]

      set res [EXEC $command_string]


      switch [string trim $res] {
         no {
            set gPB(PB_disable_MOM_pause) 1
         }
         cancel {
            set gPB(PB_disable_MOM_pause) 1

            uplevel #0 {
               MOM_abort "*** User Abort Post Processing *** "
            }
         }
         default {
            return
         }
      }

   } else {

      CATCH_WARNING "PAUSE not executed -- \"$ug_wish\" or \"mom_pause.tcl\" not found"
   }
}


#=============================================================
proc PAUSE_win64 { args } {
#=============================================================
   global env
   if { [info exists env(PB_SUPPRESS_UGPOST_DEBUG)]  &&  $env(PB_SUPPRESS_UGPOST_DEBUG) == 1 } {
  return
   }

   global gPB
   if { [info exists gPB(PB_disable_MOM_pause)]  &&  $gPB(PB_disable_MOM_pause) == 1 } {
  return
   }


   set cam_aux_dir  [MOM_ask_env_var UGII_CAM_AUXILIARY_DIR]
   set ug_wish "ugwish.exe"

   if { [file exists ${cam_aux_dir}$ug_wish] &&\
        [file exists ${cam_aux_dir}mom_pause_win64.tcl] } {

      set title ""
      set msg ""

      if { [llength $args] == 1 } {
         set msg [lindex $args 0]
      }

      if { [llength $args] > 1 } {
         set title [lindex $args 0]
         set msg [lindex $args 1]
      }


     ######
     # Define a scratch file and pass it to mom_pause_win64.tcl script -
     #
     #   A separated process will be created to construct the Tk dialog.
     #   This process will communicate with the main process via the state of a scratch file.
     #   This scratch file will collect the messages that need to be conveyed from the
     #   child process to the main process.
     ######
      global mom_logname
      set pause_file_name "$env(TEMP)/${mom_logname}_mom_pause_[clock clicks].txt"


     ######
     # Path names should be per unix style for "open" command
     ######
      regsub -all {\\} $pause_file_name {/}  pause_file_name
      regsub -all { }  $pause_file_name {\ } pause_file_name
      regsub -all {\\} $cam_aux_dir {/}  cam_aux_dir
      regsub -all { }  $cam_aux_dir {\ } cam_aux_dir

      if [file exists $pause_file_name] {
         file delete -force $pause_file_name
      }


     ######
     # Note that the argument order for mom_pasue.tcl has been changed
     # The assumption at this point is we will always have the communication file as the first
     # argument and optionally the title and message as the second and third arguments
     ######
      open "|${cam_aux_dir}$ug_wish ${cam_aux_dir}mom_pause_win64.tcl ${pause_file_name} {$title} {$msg}"


     ######
     # Waiting for the mom_pause to complete its process...
     # - This is indicated when the scratch file materialized and became read-only.
     ######
      while { ![file exists $pause_file_name] || [file writable $pause_file_name] } { }


     ######
     # Delay a 100 milli-seconds to ensure that sufficient time is given for the other process to complete.
     ######
      after 100


     ######
     # Open the scratch file to read and process the information.  Close it afterward.
     ######
      set fid [open "$pause_file_name" r]

      set res [string trim [gets $fid]]
      switch $res {
         no {
            set gPB(PB_disable_MOM_pause) 1
         }
         cancel {
            close $fid
            file delete -force $pause_file_name

            set gPB(PB_disable_MOM_pause) 1

            uplevel #0 {
               MOM_abort "*** User Abort Post Processing *** "
            }
         }
         default {}
      }


     ######
     # Delete the scratch file
     ######
      close $fid
      file delete -force $pause_file_name
   }
}


#=============================================================
proc PAUSE_x { args } {
#=============================================================
   global env
   if { [info exists env(PB_SUPPRESS_UGPOST_DEBUG)]  &&  $env(PB_SUPPRESS_UGPOST_DEBUG) == 1 } {
  return
   }

   global gPB
   if { [info exists gPB(PB_disable_MOM_pause)]  &&  $gPB(PB_disable_MOM_pause) == 1 } {
  return
   }



  #==========
  # Win64 OS
  #
   global tcl_platform

   if { [string match "*windows*" $tcl_platform(platform)] } {
      global mom_sys_processor_archit

      if { ![info exists mom_sys_processor_archit] } {
         set pVal ""
         set env_vars [array get env]
         set idx [lsearch $env_vars "PROCESSOR_ARCHITE*"]
         if { $idx >= 0 } {
            set pVar [lindex $env_vars $idx]
            set pVal [lindex $env_vars [expr $idx + 1]]
         }
         set mom_sys_processor_archit $pVal
      }

      if { [string match "*64*" $mom_sys_processor_archit] } {

         PAUSE_win64 $args
  return
      }
   }



   set cam_aux_dir  [MOM_ask_env_var UGII_CAM_AUXILIARY_DIR]


   if { [string match "*windows*" $tcl_platform(platform)] } {
     set ug_wish "ugwish.exe"
   } else {
     set ug_wish ugwish
   }

   if { [file exists ${cam_aux_dir}$ug_wish] && [file exists ${cam_aux_dir}mom_pause.tcl] } {

      set title ""
      set msg ""

      if { [llength $args] == 1 } {
         set msg [lindex $args 0]
      }

      if { [llength $args] > 1 } {
         set title [lindex $args 0]
         set msg [lindex $args 1]
      }

      set res [exec ${cam_aux_dir}$ug_wish ${cam_aux_dir}mom_pause.tcl $title $msg]
      switch $res {
         no {
            set gPB(PB_disable_MOM_pause) 1
         }
         cancel {
            set gPB(PB_disable_MOM_pause) 1

            uplevel #0 {
               MOM_abort "*** User Abort Post Processing *** "
            }
         }
         default { return }
      }
   }
}


#=============================================================
proc REPOSITION_ERROR_CHECK { warn } {
#=============================================================
# not called in this script

   global mom_kin_4th_axis_max_limit mom_kin_4th_axis_min_limit
   global mom_kin_5th_axis_max_limit mom_kin_5th_axis_min_limit
   global mom_pos mom_prev_pos mom_alt_pos mom_alt_prev_pos
   global mom_sys_rotary_error mom_warning_info mom_kin_machine_type

   if { [string compare "secondary rotary position being used" $warn] || [string index $mom_kin_machine_type 0] != 5 } {
      set mom_sys_rotary_error $warn
return
   }

   set mom_sys_rotary_error 0

   set a4 [expr $mom_alt_pos(3)+360.0]
   set a5 [expr $mom_alt_pos(4)+360.0]

   while { [expr $a4-$mom_kin_4th_axis_min_limit] > 360.0 } { set a4 [expr $a4-360.0] }
   while { [expr $a5-$mom_kin_5th_axis_min_limit] > 360.0 } { set a5 [expr $a5-360.0] }

   if { $a4 <= $mom_kin_4th_axis_max_limit && $a5 <= $mom_kin_5th_axis_max_limit } {
return
   }

   for { set i 0 } { $i < 2 } { incr i } {
      set rot($i) [expr $mom_pos([expr $i+3]) - $mom_prev_pos([expr $i+3])]
      while { $rot($i) > 180.0 } { set rot($i) [expr $rot($i)-360.0] }
      while { $rot($i) < 180.0 } { set rot($i) [expr $rot($i)+360.0] }
      set rot($i) [expr abs($rot($i))]

      set rotalt($i) [expr $mom_alt_pos([expr $i+3]) - $mom_prev_pos([expr $i+3])]
      while { $rotalt($i) > 180.0 } { set rotalt($i) [expr $rotalt($i)-360.0] }
      while { $rotalt($i) < 180.0 } { set rotalt($i) [expr $rotalt($i)+360.0] }
      set rotalt($i) [expr abs($rotalt($i))]
   }

   if { [EQ_is_equal [expr $rot(0)+$rot(1)] [expr $rotalt(0)+$rotalt(1)]] } {
return
   }

   set mom_sys_rotary_error $warn
}


#=============================================================
proc RESET_ROTARY_SIGN { ang pre_ang axis } {
#=============================================================
# Called by ROTARY_AXIS_RETRACT
#
# The input parameters "ang" & "pre_ang" must use same unit. (Both in degree or radian)

   global mom_kin_4th_axis_direction mom_kin_5th_axis_direction
   global mom_kin_4th_axis_rotation mom_kin_5th_axis_rotation
   global mom_rotary_direction_4th mom_rotary_direction_5th

   set abs_ang [expr abs($ang)]
   set abs_pre [expr abs($pre_ang)]
   if { $axis == 3 && ![string compare "SIGN_DETERMINES_DIRECTION" $mom_kin_4th_axis_direction] } {
    # The fourth axis.
      if { $abs_ang > $abs_pre } {
         set mom_rotary_direction_4th 1
      } elseif { $abs_ang < $abs_pre } {
         set mom_rotary_direction_4th -1
      }
   } elseif { $axis == 4 && ![string compare "SIGN_DETERMINES_DIRECTION" $mom_kin_5th_axis_direction] } {
    # The fifth axis.
      if { $abs_ang > $abs_pre } {
         set mom_rotary_direction_5th 1
      } elseif { $abs_ang < $abs_pre } {
         set mom_rotary_direction_5th -1
      }
   }
}


#=============================================================
proc RETRACT_POINT_CHECK { refpt axis retpt } {
#=============================================================
# called by CALC_SPHERICAL_RETRACT_POINT & CALC_CYLINDRICAL_RETRACT_POINT

  upvar $refpt rfp ; upvar $axis ax ; upvar $retpt rtp

#
#  determine if retraction point is "below" the retraction plane
#  if the tool is already in a safe position, do not retract
#
#  return 0    no retract needed
#         1     retraction needed
#

   VEC3_sub rtp rfp vec
   if { [VEC3_is_zero vec] } {
return 0
   }

   set x [VEC3_unitize vec vec1]
   set dir [VEC3_dot ax vec1]

   if { $dir <= 0.0 } {
return 0
   } else {
return 1
   }
}


#=============================================================
proc ROTARY_AXIS_RETRACT {  } {
#=============================================================
# called by PB_CMD_kin_before_motion

#  This command is used by four and five axis posts to retract
#  from the part when the rotary axis become discontinuous.  This
#  command is activated by setting the axis limit violation
#  action to "retract / re-engage".
#

  # Must be called by PB_CMD_kin_before_motion
   if { ![CALLED_BY "PB_CMD_kin_before_motion"] } {
return
   }


   global mom_sys_rotary_error
   global mom_motion_event


   if { ![info exists mom_sys_rotary_error] } {
return
   }

   set rotary_error_code $mom_sys_rotary_error

  #<sws 9-21-06> Make sure mom_sys_rotary_error is always unset.
   unset mom_sys_rotary_error


   if { [info exists mom_motion_event] } {
      if { $rotary_error_code != 0 && ![string compare "linear_move" $mom_motion_event] } {
        #<06-25-12 gsl> The above conditions have been checked in PB_CMD_kin_before_motion already.
        #               We should consider removing these conditions for performance sake!!!
         global mom_kin_reengage_distance
         global mom_kin_rotary_reengage_feedrate
         global mom_kin_rapid_feed_rate
         global mom_pos
         global mom_prev_pos
         global mom_prev_rot_ang_4th mom_prev_rot_ang_5th
         global mom_kin_4th_axis_direction mom_kin_4th_axis_leader
         global mom_out_angle_pos mom_kin_5th_axis_direction mom_kin_5th_axis_leader
         global mom_kin_4th_axis_center_offset mom_kin_5th_axis_center_offset
         global mom_sys_leader mom_tool_axis mom_prev_tool_axis mom_kin_4th_axis_type
         global mom_kin_spindle_axis
         global mom_alt_pos mom_prev_alt_pos mom_feed_rate
         global mom_kin_rotary_reengage_feedrate
         global mom_feed_engage_value mom_feed_cut_value
         global mom_kin_4th_axis_limit_action mom_warning_info
         global mom_kin_4th_axis_min_limit mom_kin_4th_axis_max_limit
         global mom_kin_5th_axis_min_limit mom_kin_5th_axis_max_limit

        #
        #  Check for the limit action being warning only.  If so, issue warning and leave
        #
         if { ![string compare "Warning" $mom_kin_4th_axis_limit_action] } {
            CATCH_WARNING "Rotary axis limit violated, discontinuous motion may result."
            return
         } elseif { ![string compare "User Defined" $mom_kin_4th_axis_limit_action] } {
          #<04-17-09 wbh> add the case for user defined
            PB_user_def_axis_limit_action
            return
         }

        #
        #  The previous rotary info is only available after the first motion.
        #
         if { ![info exists mom_prev_rot_ang_4th] } {
            set mom_prev_rot_ang_4th [MOM_ask_address_value fourth_axis]
         }
         if { ![info exists mom_prev_rot_ang_5th] } {
            set mom_prev_rot_ang_5th [MOM_ask_address_value fifth_axis]
         }

        #
        #  Determine the type of rotary violation encountered.  There are
        #  three distinct possibilities.
        #
        #  "ROTARY CROSSING LIMIT" and a four axis machine tool.  The fourth
        #      axis will be repositioned by either +360 or -360 before
        #      re-engaging. (roterr = 0)
        #
        #  "ROTARY CROSSING LIMIT" and a five axis machine tool.  There are two
        #      possible solutions.  If the axis that crossed a limit can be
        #      repositioned by adding or subtracting 360, then that solution
        #      will be used.  (roterr = 0) If there is only one position available and it is
        #      not in the valid travel limits, then the alternate position will
        #      be tested.  If valid, then the "secondary rotary position being used"
        #      method will be used. (roterr = 2)
        #      If the aternate position cannot be used a warning will be given.
        #
        #  "secondary rotary position being used".  Can only occur with a five
        #      axis machine tool.  The tool will reposition to the alternate
        #      current rotary position and re-engage to the alternate current
        #      linear position.  (roterr = 1)
        #
        #
        #    roterr = 0 :
        #      Rotary Reposition : mom_prev_pos(3,4) +- 360
        #      Linear Re-Engage :  mom_prev_pos(0,1,2)
        #      Final End Point :   mom_pos(0-4)
        #
        #    roterr = 1 :
        #      Rotary Reposition : mom_prev_alt_pos(3,4)
        #      Linear Re-Engage :  mom_prev_alt_pos(0,1,2)
        #      Final End Point :   mom_pos(0-4)
        #
        #    roterr = 2 :
        #      Rotary Reposition : mom_prev_alt_pos(3,4)
        #      Linear Re-Engage :  mom_prev_alt_pos(0,1,2)
        #      Final End Point :   mom_alt_pos(0-4)
        #
        #    For all cases, a warning will be given if it is not possible to
        #    to cut from the re-calculated previous position to move end point.
        #    For all valid cases the tool will, retract from the part, reposition
        #    the rotary axis and re-engage back to the part.
        #

         if { ![string compare "ROTARY CROSSING LIMIT." $rotary_error_code] } {
            global mom_kin_machine_type

            set machine_type [string tolower $mom_kin_machine_type]
            switch $machine_type {
               5_axis_dual_table -
               5_axis_dual_head  -
               5_axis_head_table {

                  set d [expr $mom_out_angle_pos(0) - $mom_prev_rot_ang_4th]

                  if { [expr abs($d)] > 180.0 } {
                     set min $mom_kin_4th_axis_min_limit
                     set max $mom_kin_4th_axis_max_limit
                     if { $d > 0.0 } {
                        set ang [expr $mom_prev_rot_ang_4th + 360.0]
                     } else {
                        set ang [expr $mom_prev_rot_ang_4th - 360.0]
                     }
                  } else {
                     set min $mom_kin_5th_axis_min_limit
                     set max $mom_kin_5th_axis_max_limit
                     set d [expr $mom_out_angle_pos(1) - $mom_prev_rot_ang_5th]
                     if { $d > 0.0 } {
                        set ang [expr $mom_prev_rot_ang_5th + 360.0]
                     } else {
                        set ang [expr $mom_prev_rot_ang_5th - 360.0]
                     }
                  }

                  if { $ang >= $min && $ang <= $max } { ;# ==> 5th axis min/max will be used here(?)
                     set roterr 0
                  } else {
                     set roterr 2
                  }
               }

               default { set roterr 0 }
            }
         } else {

            set roterr 1
         }

        #
        #  Retract from part
        #
         VMOV 5 mom_pos save_pos
         VMOV 5 mom_prev_pos save_prev_pos
         VMOV 2 mom_out_angle_pos save_out_angle_pos
         set save_feedrate $mom_feed_rate

         global mom_kin_output_unit mom_part_unit
         if { ![string compare $mom_kin_output_unit $mom_part_unit] } {
            set mom_sys_unit_conversion "1.0"
         } elseif { ![string compare "IN" $mom_kin_output_unit] } {
            set mom_sys_unit_conversion [expr 1.0/25.4]
         } else {
            set mom_sys_unit_conversion 25.4
         }

        #<01-07-10 wbh> Fix pr6192146.
        # Declare/Set the variables used to convert the feed rate from MMPR/IPR to MMPM/IPM.
         global mom_spindle_rpm
         global mom_feed_approach_unit mom_feed_cut_unit
         global mom_feed_engage_unit mom_feed_retract_unit
         set mode_convert_scale "1.0"
         if { [info exists mom_spindle_rpm] && [EQ_is_gt $mom_spindle_rpm 0.0] } {
            set mode_convert_scale $mom_spindle_rpm
         }

         global mom_sys_spindle_axis
         GET_SPINDLE_AXIS mom_prev_tool_axis

         global mom_kin_retract_type
         global mom_kin_retract_distance
         global mom_kin_retract_plane

         if { ![info exists mom_kin_retract_distance] } {
            if { [info exists mom_kin_retract_plane] } {
              # Convert legacy variable
               set mom_kin_retract_distance $mom_kin_retract_plane
            } else {
               set mom_kin_retract_distance 10.0
            }
         }

         if { ![info exists mom_kin_retract_type] } {
            set mom_kin_retract_type "DISTANCE"
         }

        #
        #  Pre-release type conversion
        #
         if { [string match "PLANE" $mom_kin_retract_type] } {
            set mom_kin_retract_type "SURFACE"
         }

         switch $mom_kin_retract_type {
            SURFACE {
               set cen(0) 0.0
               set cen(1) 0.0
               set cen(2) 0.0
               if { [info exists mom_kin_4th_axis_center_offset] } {
                  VEC3_add cen mom_kin_4th_axis_center_offset cen
               }

               if { ![string compare "Table" $mom_kin_4th_axis_type] } {
                  set num_sol [CALC_CYLINDRICAL_RETRACT_POINT mom_prev_pos mom_kin_spindle_axis\
                                                              $mom_kin_retract_distance ret_pt]
               } else {
                  set num_sol [CALC_SPHERICAL_RETRACT_POINT   mom_prev_pos mom_prev_tool_axis cen\
                                                              $mom_kin_retract_distance ret_pt]
               }
               if {$num_sol != 0} {VEC3_add ret_pt cen mom_pos}
            }

            DISTANCE -
            default {
               set mom_pos(0) [expr $mom_prev_pos(0) + $mom_kin_retract_distance*$mom_sys_spindle_axis(0)]
               set mom_pos(1) [expr $mom_prev_pos(1) + $mom_kin_retract_distance*$mom_sys_spindle_axis(1)]
               set mom_pos(2) [expr $mom_prev_pos(2) + $mom_kin_retract_distance*$mom_sys_spindle_axis(2)]
               set num_sol 1
            }
         }


         global mom_motion_distance
         global mom_feed_rate_number
         global mom_feed_retract_value
         global mom_feed_approach_value


         set dist [expr $mom_kin_reengage_distance*2.0]

         if { $num_sol != 0 } {

        #
        #  Retract from the part at rapid feed rate.  This is the same for all conditions.
        #
            MOM_suppress once fourth_axis fifth_axis
            set mom_feed_rate [expr $mom_feed_retract_value*$mom_sys_unit_conversion]
           #<01-07-10 wbh> Convert the feed rate from MMPR/IPR to MMPM/IPM
            if { [info exists mom_feed_retract_unit] && [string match "*pr" $mom_feed_retract_unit] } {
               set mom_feed_rate [expr $mom_feed_rate * $mode_convert_scale]
            }
            if { [EQ_is_equal $mom_feed_rate 0.0] } {
               set mom_feed_rate [expr $mom_kin_rapid_feed_rate*$mom_sys_unit_conversion]
            }
            VEC3_sub mom_pos mom_prev_pos del_pos
            set dist [VEC3_mag del_pos]

           #<03-13-08 gsl> Replaced next call
           # global mom_sys_frn_factor
           # set mom_feed_rate_number [expr ($mom_sys_frn_factor*$mom_feed_rate)/ $dist]
            set mom_feed_rate_number [SET_FEEDRATE_NUMBER $dist $mom_feed_rate]
            FEEDRATE_SET
            set retract "yes"
         } else {
            CATCH_WARNING "Retraction geometry is defined inside of the current point.\n\
                           No retraction will be output. Set the retraction distance to a greater value."
            set retract "no"
         }

         if { $roterr == 0 } {
#
#  This section of code handles the case where a limit forces a reposition to an angle
#  by adding or subtracting 360 until the new angle is within the limits.
#  This is either a four axis case or a five axis case where it is not a problem
#  with the inverse kinematics forcing a change of solution.
#  This is only a case of "unwinding" the table.
#
            if { ![string compare "yes"  $retract] } {
               PB_CMD_retract_move
            }

           #
           #  Move to previous rotary position
           #  <04-01-2013 gsl> mom_rev_pos(3,4) may have not been affected, we may just borrow them
           #                   as mom_out_angle_pos for subsequent output instead of recomputing them thru ROTSET(?)
           #
            if { [info exists mom_kin_4th_axis_direction] } {
               set mom_out_angle_pos(0) [ROTSET $mom_prev_pos(3) $mom_out_angle_pos(0) $mom_kin_4th_axis_direction\
                                                $mom_kin_4th_axis_leader mom_sys_leader(fourth_axis)\
                                                $mom_kin_4th_axis_min_limit $mom_kin_4th_axis_max_limit]
            }
            if { [info exists mom_kin_5th_axis_direction] } {
               set mom_out_angle_pos(1) [ROTSET $mom_prev_pos(4) $mom_out_angle_pos(1) $mom_kin_5th_axis_direction\
                                                $mom_kin_5th_axis_leader mom_sys_leader(fifth_axis)\
                                                $mom_kin_5th_axis_min_limit $mom_kin_5th_axis_max_limit]
            }

            PB_CMD_reposition_move

           #
           #  Position back to part at approach feed rate
           #
            GET_SPINDLE_AXIS mom_prev_tool_axis
            for { set i 0 } { $i < 3 } { incr i } {
               set mom_pos($i) [expr $mom_prev_pos($i) + $mom_kin_reengage_distance * $mom_sys_spindle_axis($i)]
            }
            set mom_feed_rate [expr $mom_feed_approach_value * $mom_sys_unit_conversion]
           #<01-07-10 wbh> Convert the feed rate from MMPR/IPR to MMPM/IPM
            if { [info exists mom_feed_approach_unit] && [string match "*pr" $mom_feed_approach_unit] } {
               set mom_feed_rate [expr $mom_feed_rate * $mode_convert_scale]
            }
            if { [EQ_is_equal $mom_feed_rate 0.0] } {
               set mom_feed_rate [expr $mom_kin_rapid_feed_rate*$mom_sys_unit_conversion]
            }
            set dist [expr $dist-$mom_kin_reengage_distance]
            set mom_feed_rate_number [SET_FEEDRATE_NUMBER $dist $mom_feed_rate]
            FEEDRATE_SET
            MOM_suppress once fourth_axis fifth_axis
            PB_CMD_linear_move

           #
           #  Feed back to part at engage feed rate
           #
            MOM_suppress once fourth_axis fifth_axis
            if { $mom_feed_engage_value  > 0.0 } {
               set mom_feed_rate [expr $mom_feed_engage_value*$mom_sys_unit_conversion]
              #<01-07-10 wbh> Convert the feed rate from MMPR/IPR to MMPM/IPM
               if { [info exists mom_feed_engage_unit] && [string match "*pr" $mom_feed_engage_unit] } {
                  set mom_feed_rate [expr $mom_feed_rate * $mode_convert_scale]
               }
            } elseif { $mom_feed_cut_value  > 0.0 } {
               set mom_feed_rate [expr $mom_feed_cut_value*$mom_sys_unit_conversion]
              #<01-07-10 wbh> Convert the feed rate from MMPR/IPR to MMPM/IPM
               if { [info exists mom_feed_cut_unit] && [string match "*pr" $mom_feed_cut_unit] } {
                  set mom_feed_rate [expr $mom_feed_rate * $mode_convert_scale]
               }
            } else {
               set mom_feed_rate [expr 10.0*$mom_sys_unit_conversion]
            }

            VEC3_sub mom_pos mom_prev_pos del_pos
            set mom_feed_rate_number [SET_FEEDRATE_NUMBER $mom_kin_reengage_distance $mom_feed_rate]
            FEEDRATE_SET
            VMOV 3 mom_prev_pos mom_pos
            PB_CMD_linear_move

            VEC3_sub mom_pos save_pos del_pos
            set dist [VEC3_mag del_pos]
            set mom_feed_rate_number [SET_FEEDRATE_NUMBER $dist $mom_feed_rate]
            FEEDRATE_SET

            VMOV 5 save_pos mom_pos
            VMOV 5 save_prev_pos mom_prev_pos
            VMOV 2 save_out_angle_pos mom_out_angle_pos

         } else {
#
#  This section of code handles the case where there are two solutions to the tool axis inverse kinematics.
#  The post is forced to change from one solution to the other.  This causes a discontinuity in the tool path.
#  The post needs to retract, rotate to the new rotaries, then position back to the part using the alternate
#  solution.
#
            #
            #  Check for rotary axes in limits before retracting
            #
            set res [ANGLE_CHECK mom_prev_alt_pos(3) 4]
            if { $res == 1 } {
               set mom_out_angle_pos(0) [ROTSET $mom_prev_alt_pos(3) $mom_prev_rot_ang_4th $mom_kin_4th_axis_direction\
                                                $mom_kin_4th_axis_leader mom_sys_leader(fourth_axis)\
                                                $mom_kin_4th_axis_min_limit  $mom_kin_4th_axis_max_limit 1]
            } elseif { $res == 0 } {
               set mom_out_angle_pos(0) $mom_prev_alt_pos(3)
            } else {
               CATCH_WARNING "Not possible to position to alternate rotary axis positions. Gouging may result"
               VMOV 5 save_pos mom_pos

             return
            }

            set res [ANGLE_CHECK mom_prev_alt_pos(4) 5]
            if { $res == 1 } {
               set mom_out_angle_pos(1) [ROTSET $mom_prev_alt_pos(4) $mom_prev_rot_ang_5th $mom_kin_5th_axis_direction\
                                                $mom_kin_5th_axis_leader mom_sys_leader(fifth_axis)\
                                                $mom_kin_5th_axis_min_limit $mom_kin_5th_axis_max_limit 1]
            } elseif { $res == 0 } {
               set mom_out_angle_pos(1) $mom_prev_alt_pos(4)
            } else {
               CATCH_WARNING "Not possible to position to alternate rotary axis positions. Gouging may result"
               VMOV 5 save_pos mom_pos

             return
            }

            set mom_prev_pos(3) $mom_pos(3)
            set mom_prev_pos(4) $mom_pos(4)
            FEEDRATE_SET

            if { ![string compare "yes" $retract] } { PB_CMD_retract_move }
           #
           #  Move to alternate rotary position
           #
            set mom_pos(3) $mom_prev_alt_pos(3)
            set mom_pos(4) $mom_prev_alt_pos(4)
            set mom_prev_rot_ang_4th $mom_out_angle_pos(0)
            set mom_prev_rot_ang_5th $mom_out_angle_pos(1)
            VMOV 3 mom_prev_pos mom_pos
            FEEDRATE_SET
            PB_CMD_reposition_move

           #
           #  Position back to part at approach feed rate
           #
            set mom_prev_pos(3) $mom_pos(3)
            set mom_prev_pos(4) $mom_pos(4)
            for { set i 0 } { $i < 3 } { incr i } {
              set mom_pos($i) [expr $mom_prev_alt_pos($i)+$mom_kin_reengage_distance*$mom_sys_spindle_axis($i)]
            }
            MOM_suppress once fourth_axis fifth_axis
            set mom_feed_rate [expr $mom_feed_approach_value*$mom_sys_unit_conversion]
           #<01-07-10 wbh> Convert the feed rate from MMPR/IPR to MMPM/IPM
            if { [info exists mom_feed_approach_unit] && [string match "*pr" $mom_feed_approach_unit] } {
               set mom_feed_rate [expr $mom_feed_rate * $mode_convert_scale]
            }
            if { [EQ_is_equal $mom_feed_rate 0.0] } {
              set mom_feed_rate [expr $mom_kin_rapid_feed_rate * $mom_sys_unit_conversion]
            }
            set dist [expr $dist-$mom_kin_reengage_distance]
            set mom_feed_rate_number [SET_FEEDRATE_NUMBER $dist $mom_feed_rate]
            FEEDRATE_SET
            PB_CMD_linear_move

           #
           #  Feed back to part at engage feed rate
           #
            MOM_suppress once fourth_axis fifth_axis
            if { $mom_feed_engage_value  > 0.0 } {
               set mom_feed_rate [expr $mom_feed_engage_value*$mom_sys_unit_conversion]
              #<01-07-10 wbh> Convert the feed rate from MMPR/IPR to MMPM/IPM
               if { [info exists mom_feed_engage_unit] && [string match "*pr" $mom_feed_engage_unit] } {
                  set mom_feed_rate [expr $mom_feed_rate * $mode_convert_scale]
               }
            } elseif { $mom_feed_cut_value  > 0.0 } {
               set mom_feed_rate [expr $mom_feed_cut_value*$mom_sys_unit_conversion]
              #<01-07-10 wbh> Convert the feed rate from MMPR/IPR to MMPM/IPM
               if { [info exists mom_feed_cut_unit] && [string match "*pr" $mom_feed_cut_unit] } {
                  set mom_feed_rate [expr $mom_feed_rate * $mode_convert_scale]
               }
            } else {
              # ???
               set mom_feed_rate [expr 10.0*$mom_sys_unit_conversion]
            }

            set mom_feed_rate_number [SET_FEEDRATE_NUMBER $mom_kin_reengage_distance $mom_feed_rate]
            VMOV 3 mom_prev_alt_pos mom_pos
            FEEDRATE_SET
            PB_CMD_linear_move

            VEC3_sub mom_pos save_pos del_pos
            set dist [VEC3_mag del_pos]
            if { $dist <= 0.0 } { set dist $mom_kin_reengage_distance }
            set mom_feed_rate_number [SET_FEEDRATE_NUMBER $dist $mom_feed_rate]
            FEEDRATE_SET

            if { $roterr == 2 } {
               VMOV 5 mom_alt_pos mom_pos
            } else {
               VMOV 5 save_pos mom_pos
            }

           #<01-07-10 wbh> Reset the rotary sign
            RESET_ROTARY_SIGN $mom_pos(3) $mom_out_angle_pos(0) 3
            RESET_ROTARY_SIGN $mom_pos(4) $mom_out_angle_pos(1) 4

            set mom_out_angle_pos(0) [ROTSET $mom_pos(3) $mom_out_angle_pos(0) $mom_kin_4th_axis_direction\
                                             $mom_kin_4th_axis_leader mom_sys_leader(fourth_axis)\
                                             $mom_kin_4th_axis_min_limit $mom_kin_4th_axis_max_limit]
            set mom_out_angle_pos(1) [ROTSET $mom_pos(4) $mom_out_angle_pos(1) $mom_kin_5th_axis_direction\
                                             $mom_kin_5th_axis_leader mom_sys_leader(fifth_axis)\
                                             $mom_kin_5th_axis_min_limit $mom_kin_5th_axis_max_limit]

            MOM_reload_variable -a mom_out_angle_pos
            MOM_reload_variable -a mom_pos
            MOM_reload_variable -a mom_prev_pos
         }

         set mom_feed_rate $save_feedrate
         FEEDRATE_SET
      }
   }
}


#=============================================================
proc ROTATE_VECTOR { plane angle input_vector output_vector } {
#=============================================================
# Called by LOCK_AXIS & UNLOCK_AXIS

  upvar $output_vector v ; upvar $input_vector v1

   switch $plane {
      0 {
         set v(0) $v1(0)
         set v(1) [expr $v1(1)*cos($angle) - $v1(2)*sin($angle)]
         set v(2) [expr $v1(2)*cos($angle) + $v1(1)*sin($angle)]
      }

      1 {
         set v(0) [expr $v1(0)*cos($angle) + $v1(2)*sin($angle)]
         set v(1) $v1(1)
         set v(2) [expr $v1(2)*cos($angle) - $v1(0)*sin($angle)]
      }

      default {
         set v(0) [expr $v1(0)*cos($angle) - $v1(1)*sin($angle)]
         set v(1) [expr $v1(1)*cos($angle) + $v1(0)*sin($angle)]
         set v(2) $v1(2)
      }
   }
}


#=============================================================
proc ROTSET { angle prev_angle dir kin_leader sys_leader min max {tol_flag 0} } {
#=============================================================
#  This command will take an input angle and format for a specific machine.
#  It will also validate that the angle is within the specified limits of
#  machine.
#
#  angle        angle to be output.
#  prev_angle   previous angle output.  It should be mom_out_angle_pos
#  dir          can be either MAGNITUDE_DETERMINES_DIRECTION or
#               SIGN_DETERMINES_DIRECTION
#  kin_leader   leader (usually A, B or C) defined by Post Builder
#  sys_leader   leader that is created by ROTSET.  It could be "C-".
#  min          minimum degrees of travel for current axis
#  max          maximum degrees of travel for current axis
#
#  tol_flag     performance comparison with tolerance
#                 0 : No (default)
#                 1 : Yes
#
#
# - This command is called by the following functions:
#   RETRACT_ROTARY_AXIS, LOCK_AXIS_MOTION, LINEARIZE_LOCK_OUTPUT,
#   MOM_rotate, LINEARIZE_OUTPUT and MILL_TURN.
#
#=============================================================
# Revisions
# 02-25-09 mzg - Added optional argument tol_flag to allow
#                performing comparisions with tolerance
# 03-13-12 gsl - (pb850) LIMIT_ANGLE should be called by using its return value
#              - Allow comparing max/min with tolerance
#=============================================================

   upvar $sys_leader lead

  #
  #  Make sure angle is 0~360 to start with.
  #
   set angle [LIMIT_ANGLE $angle]
   set check_solution 0

   if { ![string compare "MAGNITUDE_DETERMINES_DIRECTION" $dir] } {

   #
   #  If magnitude determines direction and total travel is less than or equal
   #  to 360, we can assume there is at most one valid solution.  Find it and
   #  leave.  Check for the total travel being less than 360 and give a warning
   #  if a valid position cannot be found.
   #
      set travel [expr abs($max - $min)]

      if { $travel <= 360.0 } {

         set check_solution 1

      } else {

         if { $tol_flag == 0 } { ;# Exact comparison
            while { [expr abs([expr $angle - $prev_angle])] > 180.0 } {
               if { [expr $angle - $prev_angle] < -180.0 } {
                  set angle [expr $angle + 360.0]
               } elseif { [expr $angle - $prev_angle] > 180.0 } {
                  set angle [expr $angle - 360.0]
               }
            }
         } else { ;# Tolerant comparison
            while { [EQ_is_gt [expr abs([expr $angle - $prev_angle])] 180.0] } {
               if { [EQ_is_lt [expr $angle - $prev_angle] -180.0] } {
                  set angle [expr $angle + 360.0]
               } elseif { [EQ_is_gt [expr $angle - $prev_angle] 180.0] } {
                  set angle [expr $angle - 360.0]
               }
            }
         }
      }

      #<03-13-12 gsl> Fit angle within limits
      if { $tol_flag == 1 } { ;# Tolerant comparison
         while { [EQ_is_lt $angle $min] } { set angle [expr $angle + 360.0] }
         while { [EQ_is_gt $angle $max] } { set angle [expr $angle - 360.0] }
      } else { ;# Legacy direct comparison
         while { $angle < $min } { set angle [expr $angle + 360.0] }
         while { $angle > $max } { set angle [expr $angle - 360.0] }
      }

   } elseif { ![string compare "SIGN_DETERMINES_DIRECTION" $dir] } {

   #
   #  Sign determines direction.  Determine whether the shortest distance is
   #  clockwise or counterclockwise.  If counterclockwise append a "-" sign
   #  to the address leader.
   #
      set check_solution 1

      #<09-15-09 wbh> If angle is negative, we add 360 to it instead of getting the absolute value of it.
      if { $angle < 0 } {
         set angle [expr $angle + 360]
      }

      set minus_flag 0
     # set angle [expr abs($angle)]  ;# This line was not in ROTSET of xzc post.

      set del [expr $angle - $prev_angle]
      if { $tol_flag == 0 } { ;# Exact comparison
         if { ($del < 0.0 && $del > -180.0) || $del > 180.0 } {
           # set lead "$kin_leader-"
            set minus_flag 1
         } else {
            set lead $kin_leader
         }
      } else { ;# Tolerant comparison
         if { ([EQ_is_lt $del 0.0] && [EQ_is_gt $del -180.0]) || [EQ_is_gt $del 180.0] } {
           # set lead "$kin_leader-"
            set minus_flag 1
         } else {
            set lead $kin_leader
         }
      }

      #<04-27-11 wbh> 1819104 Check the rotary axis is 4th axis or 5th axis
      global mom_kin_4th_axis_leader mom_kin_5th_axis_leader
      global mom_rotary_direction_4th mom_rotary_direction_5th
      global mom_prev_rotary_dir_4th mom_prev_rotary_dir_5th

      set is_4th 1
      if { [info exists mom_kin_5th_axis_leader] && [string match "$mom_kin_5th_axis_leader" "$kin_leader"] } {
         set is_4th 0
      }

      #<09-15-09 wbh>
      if { $minus_flag && [EQ_is_gt $angle 0.0] } {
         set lead "$kin_leader-"

         #<04-27-11 wbh> Since the leader should add a minus, the rotary direction need be reset
         if { $is_4th } {
            set mom_rotary_direction_4th -1
         } else {
            set mom_rotary_direction_5th -1
         }
      }

      #<04-27-11 wbh> If the delta angle is 0 or 180, there has no need to change the rotary direction,
      #               we should reset the current direction with the previous direction
      if { [EQ_is_zero $del] || [EQ_is_equal $del 180.0] || [EQ_is_equal $del -180.0] } {
         if { $is_4th } {
            if { [info exists mom_prev_rotary_dir_4th] } {
               set mom_rotary_direction_4th $mom_prev_rotary_dir_4th
            }
         } else {
            if { [info exists mom_prev_rotary_dir_5th] } {
               set mom_rotary_direction_5th $mom_prev_rotary_dir_5th
            }
         }
      } else {
         # Set the previous direction
         if { $is_4th } {
            set mom_prev_rotary_dir_4th $mom_rotary_direction_4th
         } else {
            set mom_prev_rotary_dir_5th $mom_rotary_direction_5th
         }
      }
   }

   #<03-13-12 gsl> Check solution
   #
   #  There are no alternate solutions.
   #  If the position is out of limits, give a warning and leave.
   #
   if { $check_solution } {
      if { $tol_flag == 1 } {
         if { [EQ_is_gt $angle $max] || [EQ_is_lt $angle $min] } {
            CATCH_WARNING "$kin_leader-axis is under minimum or over maximum. Assumed default."
         }
      } else {
         if { ($angle > $max) || ($angle < $min) } {
            CATCH_WARNING "$kin_leader-axis is under minimum or over maximum. Assumed default."
         }
      }
   }

return $angle
}


#=============================================================
proc SET_FEEDRATE_NUMBER { dist feed } {
#=============================================================
# called by ROTARY_AXIS_RETRACT

#<03-13-08 gsl> FRN factor should not be used here! Leave it to PB_CMD_FEEDRATE_NUMBER
# global mom_sys_frn_factor

  global mom_kin_max_frn

  if { [EQ_is_zero $dist] } {
return $mom_kin_max_frn
  } else {
    set f [expr $feed / $dist ]
    if { [EQ_is_lt $f $mom_kin_max_frn] } {
return $f
    } else {
return $mom_kin_max_frn
    }
  }
}


#=============================================================
proc SET_LOCK { axis plane value } {
#=============================================================
# called by MOM_lock_axis

  upvar $axis a ; upvar $plane p ; upvar $value v

  global mom_kin_machine_type mom_lock_axis mom_lock_axis_plane mom_lock_axis_value
  global mom_warning_info

   set machine_type [string tolower $mom_kin_machine_type]
   switch $machine_type {
      4_axis_head       -
      4_axis_table      -
      3_axis_mill_turn  -
      mill_turn         { set mtype 4 }
      5_axis_dual_table -
      5_axis_dual_head  -
      5_axis_head_table { set mtype 5 }
      default {
         set mom_warning_info "Set lock only vaild for 4 and 5 axis machines"
return "error"
      }
   }

   # Check the locked rotary axis.
   # If the rotary axis is the locked axis, this axis must be the 4th axis for 4-axis machine,
   # or the 5th axis for 5-axis machine.
  if { ![CHECK_LOCK_ROTARY_AXIS $mom_lock_axis $mtype] } {
     set mom_warning_info "Specified rotary axis is invalid as the lock axis"
     return "error"
  }

   set p -1

   switch $mom_lock_axis {
      OFF {
         global mom_sys_lock_arc_save
         global mom_kin_arc_output_mode
         if { [info exists mom_sys_lock_arc_save] } {
             set mom_kin_arc_output_mode $mom_sys_lock_arc_save
             unset mom_sys_lock_arc_save
             MOM_reload_kinematics
         }
         return "OFF"
      }
      XAXIS {
         set a 0
         switch $mom_lock_axis_plane {
            XYPLAN {
               set v [LOCK_AXIS_SUB $a]
               set p 2
            }
            YZPLAN {
               set mom_warning_info "Invalid plane for lock axis"
               return "error"
            }
            ZXPLAN {
               set v [LOCK_AXIS_SUB $a]
               set p 1
            }
            NONE {
               if { $mtype == 5 } {
                  set mom_warning_info "Must specify lock axis plane for 5 axis machine"
                  return "error"
               } else {
                  set v [LOCK_AXIS_SUB $a]
               }
            }
         }
      }
      YAXIS {
         set a 1
         switch $mom_lock_axis_plane {
            XYPLAN {
               set v [LOCK_AXIS_SUB $a]
               set p 2
            }
            YZPLAN {
               set v [LOCK_AXIS_SUB $a]
               set p 0
            }
            ZXPLAN {
               set mom_warning_info "Invalid plane for lock axis"
               return "error"
            }
            NONE {
               if { $mtype == 5 } {
                  set mom_warning_info "Must specify lock axis plane for 5 axis machine"
                  return "error"
               } else {
                  set v [LOCK_AXIS_SUB $a]
               }
            }
         }
      }
      ZAXIS {
         set a 2
         switch $mom_lock_axis_plane {
            YZPLAN {
               set v [LOCK_AXIS_SUB $a]
               set p 0
            }
            ZXPLAN {
               set v [LOCK_AXIS_SUB $a]
               set p 1
            }
            XYPLAN {
               set mom_warning_info "Invalid plane for lock axis"
               return "error"
            }
            NONE {
               if { $mtype == 5 } {
                  set mom_warning_info "Must specify lock axis plane for 5 axis machine"
                  return "error"
               } else {
                  set v [LOCK_AXIS_SUB $a]
               }
            }
         }
      }
      FOURTH {
         set a 3
         set v [LOCK_AXIS_SUB $a]
      }
      FIFTH {
         set a 4
         set v [LOCK_AXIS_SUB $a]
      }
      AAXIS {
         set a [AXIS_SET $mom_lock_axis]
         set v [LOCK_AXIS_SUB $a]
      }
      BAXIS {
         set a [AXIS_SET $mom_lock_axis]
         set v [LOCK_AXIS_SUB $a]
      }
      CAXIS {
         set a [AXIS_SET $mom_lock_axis]
         set v [LOCK_AXIS_SUB $a]
      }
   }


   global mom_sys_lock_arc_save
   global mom_kin_arc_output_mode

   if { ![info exists mom_sys_lock_arc_save] } {
      set mom_sys_lock_arc_save $mom_kin_arc_output_mode
   }
   set mom_kin_arc_output_mode "LINEAR"

   MOM_reload_kinematics

return "ON"
}


#=============================================================
proc SOLVE_QUADRATIC { coeff rcomp icomp status degree } {
#=============================================================
# called by CALC_SPHERICAL_RETRACT_POINT

   upvar $coeff c ; upvar $rcomp rc ; upvar $icomp ic
   upvar $status st ; upvar $degree deg

   set st 1
   set deg 0
   set rc(0) 0.0 ; set rc(1) 0.0
   set ic(0) 0.0 ; set ic(1) 0.0
   set mag [VEC3_mag c]
   if { [EQ_is_zero $mag] } { return 0 }
   set acoeff [expr $c(2)/$mag]
   set bcoeff [expr $c(1)/$mag]
   set ccoeff [expr $c(0)/$mag]
   if { ![EQ_is_zero $acoeff] } {
      set deg 2
      set denom [expr $acoeff*2.]
      set dscrm [expr $bcoeff*$bcoeff - $acoeff*$ccoeff*4.0]
      if { [EQ_is_zero $dscrm] } {
         set dsqrt1 0.0
      } else {
         set dsqrt1 [expr sqrt(abs($dscrm))]
      }
      if { [EQ_is_ge $dscrm 0.0] } {
         set rc(0) [expr (-$bcoeff + $dsqrt1)/$denom]
         set rc(1) [expr (-$bcoeff - $dsqrt1)/$denom]
         set st 3
         return 2
      } else {
         set rc(0) [expr -$bcoeff/$denom]
         set rc(1) $rc(0)
         set ic(0) [expr $dsqrt1/$denom]
         set ic(1) $ic(0)
         set st 2
         return 0
      }
   } elseif { ![EQ_is_zero $bcoeff] } {
      set st 3
      set deg 1
      set rc(0) [expr -$ccoeff/$bcoeff]
      return 1
   } elseif { [EQ_is_zero $ccoeff] } {
      return 0
   } else {
      return 0
   }
}


#=============================================================
proc STR_MATCH { VAR str {out_warn 0} } {
#=============================================================
# This command will match a variable with a given string.
#
# - Users can set the optional flag "out_warn" to "1" to produce
#   warning message when the variable is not defined in the scope
#   of the caller of this function.
#
   upvar $VAR var

   if { [info exists var] && [string match "$var" "$str"] } {
return 1
   } else {
      if { $out_warn } {
         CATCH_WARNING "Variable $VAR is not defined in \"[info level -1]\"!"
      }
return 0
   }
}


#=============================================================
proc TRACE {  } {
#=============================================================
   set start_idx 1

   set str ""
   set level [info level]
   for { set i $start_idx } { $i < $level } { incr i } {
      set str "${str}[lindex [info level $i] 0]\n"
   }

return $str
}


#=============================================================
proc UNLOCK_AXIS { locked_point unlocked_point } {
#=============================================================
# called by LINEARIZE_LOCK_MOTION

   upvar $locked_point ip ; upvar $unlocked_point op

   global mom_sys_lock_plane
   global mom_sys_linear_axis_index_1
   global mom_sys_linear_axis_index_2
   global mom_sys_rotary_axis_index
   global mom_kin_4th_axis_center_offset
   global mom_kin_5th_axis_center_offset
   global DEG2RAD


   if { [info exists mom_kin_4th_axis_center] } {
       VEC3_add ip mom_kin_4th_axis_center_offset temp
   } else {
       set temp(0) $ip(0)
       set temp(1) $ip(1)
       set temp(2) $ip(2)
   }
   if { [info exists mom_kin_5th_axis_center_offset] } {
      VEC3_add temp mom_kin_5th_axis_center_offset temp
   }

   set op(3) $ip(3)
   set op(4) $ip(4)

   set ang [expr $op($mom_sys_rotary_axis_index)*$DEG2RAD]
   ROTATE_VECTOR $mom_sys_lock_plane $ang temp op

   set op($mom_sys_rotary_axis_index) 0.0

   if { [info exists mom_kin_4th_axis_center_offset] } {
      VEC3_sub op mom_kin_4th_axis_center_offset op
   }
   if { [info exists mom_kin_5th_axis_center_offset] } {
      VEC3_sub op mom_kin_5th_axis_center_offset op
   }
}


#=============================================================
proc UNSET_VARS { args } {
#=============================================================
# Inputs: List of variable names
#

   if { [llength $args] == 0 } {
return
   }

   foreach VAR $args {
      upvar $VAR var

      global tcl_version

      if { [array exists var] } {
         if { [expr $tcl_version < 8.4] } {
            foreach a [array names var] {
               if { [info exists var($a)] } {
                  unset var($a)
               }
            }
            unset var
         } else {
            array unset var
         }
      }

      if { [info exists var] } {
         unset var
      }
   }
}


#=============================================================
proc VMOV { n p1 p2 } {
#=============================================================
  upvar $p1 v1 ; upvar $p2 v2

   for { set i 0 } { $i < $n } { incr i } {
      set v2($i) $v1($i)
   }
}


#=============================================================
proc WORKPLANE_SET {  } {
#=============================================================
   global mom_cycle_spindle_axis
   global mom_sys_spindle_axis
   global traverse_axis1 traverse_axis2

   if { ![info exists mom_sys_spindle_axis] } {
      set mom_sys_spindle_axis(0) 0.0
      set mom_sys_spindle_axis(1) 0.0
      set mom_sys_spindle_axis(2) 1.0
   }

   if { ![info exists mom_cycle_spindle_axis] } {
      set x $mom_sys_spindle_axis(0)
      set y $mom_sys_spindle_axis(1)
      set z $mom_sys_spindle_axis(2)

      if { [EQ_is_zero $y] && [EQ_is_zero $z] } {
         set mom_cycle_spindle_axis 0
      } elseif { [EQ_is_zero $x] && [EQ_is_zero $z] } {
         set mom_cycle_spindle_axis 1
      } else {
         set mom_cycle_spindle_axis 2
      }
   }

   if { $mom_cycle_spindle_axis == 2 } {
      set traverse_axis1 0 ; set traverse_axis2 1
   } elseif { $mom_cycle_spindle_axis == 0 } {
      set traverse_axis1 1 ; set traverse_axis2 2
   } elseif { $mom_cycle_spindle_axis == 1 } {
      set traverse_axis1 0 ; set traverse_axis2 2
   }
}


#=============================================================
proc PB_DEFINE_MACROS { } {
#=============================================================
   global mom_pb_macro_arr

   set mom_pb_macro_arr(PLANE_SPATIAL) \
       [list {{PLANE SPATIAL} { } { } {} 1 {}} \
        {{0 0 SPA} \
         {{$mom_out_angle_pos(0)} 1 3 5 1 1 8 3 SPB} \
         {{$mom_out_angle_pos(1)} 1 3 5 1 1 8 3 SPC}}]

   set mom_pb_macro_arr(PLANE_RESET) \
       [list {{PLANE RESET} { } { } {} 0 {}} \
        {{{$mom_plane_trans_mode} 0}}]
}


#=============================================================
proc PB_call_macro { macro_name { prefix "" } { suppress_seqno 0 } args } {
#=============================================================
   global mom_pb_macro_arr mom_warning_info
   if { ![info exists mom_pb_macro_arr($macro_name)] } {
      CATCH_WARNING "Macro $macro_name is not defined."
      return
   }

   set macro_attr_list $mom_pb_macro_arr($macro_name)

   set com_attr_list  [lindex $macro_attr_list 0]
   set disp_name      [lindex $com_attr_list 0]
   set start_char     [lindex $com_attr_list 1]
   set separator_char [lindex $com_attr_list 2]
   set end_char       [lindex $com_attr_list 3]
   set link_flag      [lindex $com_attr_list 4]
   set link_char      [lindex $com_attr_list 5]

   set param_list     [lindex $macro_attr_list 1]

   set text_string ""
   if { [string compare $prefix ""] != 0 } {
       append text_string $prefix " "
   }

   append text_string $disp_name $start_char

   set g_vars_list [list]
   set param_text_list [list]
   set last_index 0
   set count 0
   foreach param_attr $param_list {
      incr count
      if { [llength $param_attr] > 0 } {
         set exp [lindex $param_attr 0]
         if { $exp == "" } {
            lappend param_text_list ""
            continue
         }

         set dtype [lindex $param_attr 1]
         if { $dtype } {
            set temp_cmd "set data_val \[expr \$exp\]"
         } else {
            set temp_cmd "set data_string $exp"
         }

         set break_flag 0
         while { 1 } {
            if { [catch {eval $temp_cmd} res_val] } {
               if [string match "*no such variable*" $res_val] {
                  set __idx [string first ":" $res_val]
                  if { $__idx >= 0 } {
                     set temp_res [string range $res_val 0 [expr int($__idx - 1)]]
                     set temp_var [lindex $temp_res end]
                     set temp_var [string trim $temp_var "\""]
                     if { [string index $temp_var [expr [string length $temp_var] - 1]] == ")" } {
                        set __idx [string first "(" $temp_var]
                        set temp_var [string range $temp_var 0 [expr int($__idx - 1)]]
                     }

                     foreach one $g_vars_list {
                        if { [string compare $temp_var $one] == 0 } {
                           set break_flag 1
                        }
                     }
                     lappend g_vars_list $temp_var
                     global $temp_var
                  } else {
                     set break_flag 1
                  }
               } elseif [string match "*no such element*" $res_val] {
                  set break_flag 1
               } else {
                  CATCH_WARNING "Error to evaluate expression $exp in $macro_name: $res_val"
                  return
               }
            } else {
               break
            }

            if $break_flag {
               CATCH_WARNING "Error to evaluate expression $exp in $macro_name: $res_val"
               set data_string ""
               break
            }
         }

         if { !$break_flag && $dtype } {
            set is_double [lindex $param_attr 2]
            set int_width [lindex $param_attr 3]
            set is_decimal [lindex $param_attr 4]

            set max_val "1"
            set min_val "-1"
            set zero_char [string range "000000000" 0 [expr $int_width - 1]]
            append max_val $zero_char
            append min_val $zero_char

            if { [catch { expr $data_val >= $max_val } comp_res] } {
               set data_string ""
               CATCH_WARNING "Wrong data type to evaluate expression $exp in $macro_name: $comp_res"
            } elseif { $comp_res } {
               set data_string [expr $max_val - 1]
               CATCH_WARNING "MAX/MIN WARNING to evaluate expression $exp in $macro_name: MAX: $data_string"
            } elseif { [expr $data_val <= $min_val] } {
               set data_string [expr $min_val + 1]
               CATCH_WARNING "MAX/MIN WARNING to evaluate expression $exp in $macro_name: MIN: $data_string"
            } else {
               if { $is_double } {
                  set total_width [expr $int_width + $is_double]
                  catch { set data_string [format "%${total_width}.${is_double}f" $data_val] }
                  set data_string [string trimleft $data_string]
                  set data_string [string trimright $data_string 0]
                  if { !$is_decimal } {
                     set dec_index [string first . $data_string]
                     set dec_str [string range $data_string 0 [expr $dec_index - 1]]
                     append dec_str [string range $data_string [expr $dec_index + 1] end]
                     set data_string $dec_str
                  }
               } else {
                  set int_data [expr { int($data_val) }]
                  catch { set data_string [format "%${int_width}d" $int_data] }
                  set data_string [string trimleft $data_string]
                  if { $is_decimal } {
                     append data_string "."
                  }
               }
            }
         }

         if { $link_flag } {
            set temp_str ""
            append temp_str [lindex $param_attr end] $link_char $data_string
            set data_string $temp_str
         }
         lappend param_text_list $data_string

         if ![string match "" $data_string] {
            set last_index $count
         }
      } else {
         lappend param_text_list ""
      }
   }

   if { $last_index > 0 } {
      if { $last_index < $count } {
         set param_text_list [lreplace $param_text_list $last_index end]
      }
      append text_string [join $param_text_list $separator_char]
   }

   append text_string $end_char

   if { $suppress_seqno } {
      MOM_suppress once N
      MOM_output_literal $text_string
   } else {
      MOM_output_literal $text_string
   }
}


#=============================================================
proc PB_load_alternate_unit_settings { } {
#=============================================================
   global mom_output_unit mom_kin_output_unit

  # Skip this function when output unit agrees with post unit.
   if { ![info exists mom_output_unit] } {
      set mom_output_unit $mom_kin_output_unit
return
   } elseif { ![string compare $mom_output_unit $mom_kin_output_unit] } {
return
   }


   global mom_event_handler_file_name

  # Set unit conversion factor
   if { ![string compare $mom_output_unit "MM"] } {
      set factor 25.4
   } else {
      set factor [expr 1/25.4]
   }

  # Define unit dependent variables list
   set unit_depen_var_list [list mom_kin_x_axis_limit mom_kin_y_axis_limit mom_kin_z_axis_limit \
                                 mom_kin_pivot_gauge_offset mom_kin_ind_to_dependent_head_x \
                                 mom_kin_ind_to_dependent_head_z]

   set unit_depen_arr_list [list mom_kin_4th_axis_center_offset \
                                 mom_kin_5th_axis_center_offset \
                                 mom_kin_machine_zero_offset \
                                 mom_kin_4th_axis_point \
                                 mom_kin_5th_axis_point \
                                 mom_sys_home_pos]

  # Load unit dependent variables
   foreach var $unit_depen_var_list {
      if { ![info exists $var] } {
         global $var
      }
      if { [info exists $var] } {
         set $var [expr [set $var] * $factor]
         MOM_reload_variable $var
      }
   }

   foreach var $unit_depen_arr_list {
      if { ![info exists $var] } {
         global $var
      }
      foreach item [array names $var] {
         if { [info exists ${var}($item)] } {
            set ${var}($item) [expr [set ${var}($item)] * $factor]
         }
      }

      MOM_reload_variable -a $var
   }


  # Source alternate unit post fragment
   uplevel #0 {
      global mom_sys_alt_unit_post_name
      set alter_unit_post_name \
          "[file join [file dirname $mom_event_handler_file_name] [file rootname $mom_sys_alt_unit_post_name]].tcl"

      if { [file exists $alter_unit_post_name] } {
         source "$alter_unit_post_name"
      }
      unset alter_unit_post_name
   }

   if { [llength [info commands PB_load_address_redefinition]] > 0 } {
      PB_load_address_redefinition
   }

   MOM_reload_kinematics
}


if [info exists mom_sys_start_of_program_flag] {
   if [llength [info commands PB_CMD_kin_start_of_program] ] {
      PB_CMD_kin_start_of_program
   }
} else {
   set mom_sys_head_change_init_program 1
   set mom_sys_start_of_program_flag 1
}


