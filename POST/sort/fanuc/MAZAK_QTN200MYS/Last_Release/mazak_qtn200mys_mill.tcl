########################## TCL Event Handlers ##########################
#
#  mazak_qtn200mys_mill.tcl -
#
#  Created by danilov  @  6 àïðåëÿ 2017 ã. 15:41:23 RTZ 2 (зима)
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
     set mom_sys_output_file_suffix                "EIA"
     set mom_sys_commentary_output                 "ON"
     set mom_sys_commentary_list                   "x y z 4axis 5axis feed speed"
     set mom_sys_pb_link_var_mode                  "OFF"
     set mom_sys_use_default_unit_fragment         "ON"
     set mom_sys_alt_unit_post_name                "mazak_qtn200mys_mill__IN.pui"


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


     set mom_sys_control_out                       "("
     set mom_sys_control_in                        ")"

     set mom_sys_post_initialized 1
  }


########## SYSTEM VARIABLE DECLARATIONS ##############
  set mom_sys_rapid_code                        "00"
  set mom_sys_linear_code                       "01"
  set mom_sys_circle_code(CLW)                  "02"
  set mom_sys_circle_code(CCLW)                 "03"
  set mom_sys_delay_code(SECONDS)               "4"
  set mom_sys_delay_code(REVOLUTIONS)           "4"
  set mom_sys_cutcom_plane_code(XY)             "17"
  set mom_sys_cutcom_plane_code(ZX)             "18"
  set mom_sys_cutcom_plane_code(XZ)             "18"
  set mom_sys_cutcom_plane_code(YZ)             "19"
  set mom_sys_cutcom_plane_code(ZY)             "19"
  set mom_sys_cutcom_code(OFF)                  "40"
  set mom_sys_cutcom_code(LEFT)                 "41"
  set mom_sys_cutcom_code(RIGHT)                "42"
  set mom_sys_adjust_code                       "43"
  set mom_sys_adjust_code_minus                 "44"
  set mom_sys_adjust_cancel_code                "49"
  set mom_sys_unit_code(IN)                     "20"
  set mom_sys_unit_code(MM)                     "21"
  set mom_sys_cycle_start_code                  "79"
  set mom_sys_cycle_off                         "80"
  set mom_sys_cycle_drill_code                  "87"
  set mom_sys_cycle_drill_dwell_code            "87"
  set mom_sys_cycle_drill_deep_code             "87"
  set mom_sys_cycle_drill_break_chip_code       "87"
  set mom_sys_cycle_tap_code                    "88.2"
  set mom_sys_cycle_bore_code                   "89"
  set mom_sys_cycle_bore_drag_code              "89"
  set mom_sys_cycle_bore_no_drag_code           "89"
  set mom_sys_cycle_bore_dwell_code             "89"
  set mom_sys_cycle_bore_manual_code            "89"
  set mom_sys_cycle_bore_back_code              "89"
  set mom_sys_cycle_bore_manual_dwell_code      "89"
  set mom_sys_output_code(ABSOLUTE)             "90"
  set mom_sys_output_code(INCREMENTAL)          "91"
  set mom_sys_cycle_ret_code(AUTO)              "98"
  set mom_sys_cycle_ret_code(MANUAL)            "99"
  set mom_sys_reset_code                        "92"
  set mom_sys_feed_rate_mode_code(IPM)          "98"
  set mom_sys_feed_rate_mode_code(IPR)          "99"
  set mom_sys_feed_rate_mode_code(FRN)          "93"
  set mom_sys_spindle_mode_code(SFM)            "96"
  set mom_sys_spindle_mode_code(RPM)            "97"
  set mom_sys_return_code                       "28"
  set mom_sys_feed_rate_mode_code(MMPM)         "98"
  set mom_sys_feed_rate_mode_code(MMPR)         "99"
  set mom_sys_feed_rate_mode_code(DPM)          "94"
  set mom_sys_program_stop_code                 "0"
  set mom_sys_optional_stop_code                "1"
  set mom_sys_end_of_program_code               "2"
  set mom_sys_spindle_direction_code(CLW)       "203"
  set mom_sys_spindle_direction_code(CCLW)      "204"
  set mom_sys_spindle_direction_code(OFF)       "205"
  set mom_sys_tool_change_code                  "6"
  set mom_sys_coolant_code(ON)                  "8"
  set mom_sys_coolant_code(FLOOD)               "8"
  set mom_sys_coolant_code(MIST)                "8"
  set mom_sys_coolant_code(THRU)                "8"
  set mom_sys_coolant_code(TAP)                 "8"
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
  set mom_sys_cir_vector                        "Vector - Arc Start to Center"
  set mom_sys_spindle_ranges                    "0"
  set mom_sys_rewind_stop_code                  "\#"
  set mom_sys_home_pos(0)                       "0"
  set mom_sys_home_pos(1)                       "0"
  set mom_sys_home_pos(2)                       "0"
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
  set mom_sys_leader(N)                         "N"
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
  set mom_sys_rapid_feed_mode(ROTARY)           "MMPM"
  set mom_sys_rapid_feed_mode(LINEAR_ROTARY)    "MMPM"
  set mom_sys_feed_param(MMPM,format)           "Feed_MMPM"
  set mom_sys_feed_param(MMPR,format)           "Feed_MMPR"
  set mom_sys_feed_param(DPM,format)            "Feed_DPM"
  set mom_sys_retract_distance                  "10"
  set mom_sys_xzc_arc_output_mode               "POLAR"
  set mom_sys_output_mode                       "UNDEFINED"
  set mom_sys_radius_output_mode                "ALWAYS_POSITIVE"
  set mom_sys_millturn_yaxis                    "TRUE"
  set mom_sys_coordinate_output_mode            "POLAR"
  set mom_sys_spindle_axis(0)                   "1.0"
  set mom_sys_spindle_axis(1)                   "0.0"
  set mom_sys_spindle_axis(2)                   "0.0"
  set mom_sys_linearization_method              "angle"
  set mom_sys_post_description                  "This is a 5-Axis Milling Machine With\n\
                                                 Rotary Head and Table."
  set mom_sys_ugpadvkins_used                   "0"
  set mom_sys_post_builder_version              "9.0.2"

####### KINEMATIC VARIABLE DECLARATIONS ##############
  set mom_kin_4th_axis_ang_offset               "0.0"
  set mom_kin_4th_axis_center_offset(0)         "0.0"
  set mom_kin_4th_axis_center_offset(1)         "0.0"
  set mom_kin_4th_axis_center_offset(2)         "0.0"
  set mom_kin_4th_axis_direction                "MAGNITUDE_DETERMINES_DIRECTION"
  set mom_kin_4th_axis_incr_switch              "OFF"
  set mom_kin_4th_axis_leader                   "B"
  set mom_kin_4th_axis_limit_action             "Warning"
  set mom_kin_4th_axis_max_limit                "180"
  set mom_kin_4th_axis_min_incr                 "90"
  set mom_kin_4th_axis_min_limit                "0"
  set mom_kin_4th_axis_plane                    "ZX"
  set mom_kin_4th_axis_point(0)                 "0.0"
  set mom_kin_4th_axis_point(1)                 "0.0"
  set mom_kin_4th_axis_point(2)                 "0.0"
  set mom_kin_4th_axis_rotation                 "standard"
  set mom_kin_4th_axis_type                     "Head"
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
  set mom_kin_arc_output_mode                   "QUADRANT"
  set mom_kin_arc_valid_plane                   "XYZ"
  set mom_kin_clamp_time                        "2.0"
  set mom_kin_cycle_plane_change_per_axis       "0"
  set mom_kin_cycle_plane_change_to_lower       "0"
  set mom_kin_flush_time                        "2.0"
  set mom_kin_linearization_flag                "1"
  set mom_kin_linearization_tol                 "0.01"
  set mom_kin_machine_resolution                "0.001"
  set mom_kin_machine_type                      "5_axis_head_table"
  set mom_kin_machine_zero_offset(0)            "0.0"
  set mom_kin_machine_zero_offset(1)            "0.0"
  set mom_kin_machine_zero_offset(2)            "0.0"
  set mom_kin_max_arc_radius                    "99999.999"
  set mom_kin_max_dpm                           "0"
  set mom_kin_max_fpm                           "15000"
  set mom_kin_max_fpr                           "1000"
  set mom_kin_max_frn                           "1000"
  set mom_kin_min_arc_length                    "0.20"
  set mom_kin_min_arc_radius                    "0.001"
  set mom_kin_min_dpm                           "0.0"
  set mom_kin_min_fpm                           "0.1"
  set mom_kin_min_fpr                           "0.001"
  set mom_kin_min_frn                           "0.01"
  set mom_kin_output_unit                       "MM"
  set mom_kin_pivot_gauge_offset                "0.0"
  set mom_kin_pivot_guage_offset                ""
  set mom_kin_post_data_unit                    "MM"
  set mom_kin_rapid_feed_rate                   "10000"
  set mom_kin_retract_distance                  "500"
  set mom_kin_rotary_axis_method                "PREVIOUS"
  set mom_kin_spindle_axis(0)                   "0.0"
  set mom_kin_spindle_axis(1)                   "0.0"
  set mom_kin_spindle_axis(2)                   "1.0"
  set mom_kin_tool_change_time                  "0.0"
  set mom_kin_x_axis_limit                      "1000"
  set mom_kin_y_axis_limit                      "1000"
  set mom_kin_z_axis_limit                      "1000"




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


#=========================
# Linked posts definition
#=========================
 set mom_sys_master_post   "[file rootname $mom_event_handler_file_name]"
 set mom_sys_master_head                       "MILL"

 set mom_sys_postname(MILL)                    "$mom_sys_master_post"
 set mom_sys_postname(SEPARATOR)               "separator"
 set mom_sys_postname(TURN)                    "mazak_qtn200mys_turn"


#=============================================================
proc MOM_end_of_program { } {
#=============================================================
   PB_CMD_subprogram_end
   PB_CMD_end_of_program

#**** The following procedure lists the tool list with time in commentary data
   LIST_FILE_TRAILER

#**** The following procedure closes the warning and listing files
   CLOSE_files

   if [llength [info commands PB_CMD_kin_end_of_program] ] {
      PB_CMD_kin_end_of_program
   }
}


#=============================================================
proc PB_start_of_HEAD__TURN { } {
#=============================================================
   PB_CMD_fix_spindle_off
   PB_CMD_mill_mode_off
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


   PB_CMD_drill_cycle_set
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


   PB_CMD_drill_cycle_set
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


   PB_CMD_drill_cycle_set
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


   PB_CMD_drill_cycle_set
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


   PB_CMD_drill_cycle_set
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


   PB_CMD_drill_cycle_set
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


   PB_CMD_drill_cycle_set
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
   PB_CMD_set_circular_move
   MOM_do_template circular_move
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
}


#=============================================================
proc MOM_coolant_on { } {
#=============================================================
   COOLANT_SET
}


#=============================================================
proc MOM_cutcom_on { } {
#=============================================================
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
   PB_CMD_cycle_off_user
}


#=============================================================
proc MOM_cycle_plane_change { } {
#=============================================================
  global cycle_init_flag
  global mom_cycle_tool_axis_change
  global mom_cycle_clearance_plane_change

   set cycle_init_flag TRUE
}


#=============================================================
proc MOM_delay { } {
#=============================================================
   PB_DELAY_TIME_SET
   MOM_force Once G_feed G dwell
   MOM_do_template delay
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


   PB_CMD_set_cycle_pos_list
   PB_CMD_drill_cycle_set
   PB_CMD_cycle_time
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


   PB_CMD_set_cycle_pos_list
   PB_CMD_drill_cycle_set
   PB_CMD_cycle_time
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


   PB_CMD_set_cycle_pos_list
   PB_CMD_drill_cycle_set
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


   PB_CMD_set_cycle_pos_list
   PB_CMD_drill_cycle_set
   PB_CMD_cycle_time
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


   PB_CMD_drill_text
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

   PB_CMD_mill_path_end_1
   MOM_do_template m5M9
   PB_CMD_skip9_off
   PB_CMD_unset_C_trans
   PB_CMD_synchro_off
   PB_CMD_mill_path_end_2
   PB_CMD_set_operation_time
   PB_CMD_reset_all_motion_variables_to_zero
   PB_CMD_LABEL_to_skip
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
   PB_CMD_skip9_on
   PB_CMD_goto_zero
   PB_CMD_tool_code
   PB_CMD_set_spindle_auto_direction
   PB_CMD_skip9_off
   PB_CMD_start_of_operation_force_addresses
   PB_CMD_mill_mode_on
   PB_CMD_offset
   PB_CMD_synchro_on
   PB_CMD_set_C_trans
   PB_CMD_rpm_change
   MOM_do_template first_move_m8
   PB_CMD_fix_spindle_off
   PB_CMD_QT_from
   PB_CMD_user_initial_move
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
   PB_CMD_QT_gohome
   PB_CMD_fix_spindle_off
   MOM_rapid_move
}


#=============================================================
proc MOM_head { } {
#=============================================================
   global mom_warning_info

   global mom_sys_in_operation
   if { [info exists mom_sys_in_operation] && $mom_sys_in_operation == 1 } {
      global mom_operation_name
      CATCH_WARNING "HEAD event should not be assigned to an operation ($mom_operation_name)."
return
   }


   global mom_head_name mom_sys_postname
   global mom_load_event_handler
   global CURRENT_HEAD NEXT_HEAD
   global mom_sys_prev_mach_head mom_sys_curr_mach_head
   global mom_sys_head_change_init_program


   if { [info exists mom_head_name] } {
      set NEXT_HEAD $mom_head_name
   } else {
      CATCH_WARNING "No HEAD event has been assigned."
return
   }

   set head_list [array names mom_sys_postname]
   foreach h $head_list {
      if { [regexp -nocase ^$mom_head_name$ $h] == 1 } {
         set NEXT_HEAD $h
         break
      }
   }

   if { [string length $NEXT_HEAD] == 0 } {
      CATCH_WARNING "Next HEAD is not defined."
return
   }


  # Initialize current head to the master
   global mom_sys_master_head
   if { ![info exists CURRENT_HEAD] } {
      set CURRENT_HEAD "$mom_sys_master_head"
   }


   set tcl_file ""

   if { ![info exists mom_sys_postname($NEXT_HEAD)] } {

      CATCH_WARNING "Post is not specified with Head ($NEXT_HEAD)."

   } elseif { ![string match "$NEXT_HEAD" $CURRENT_HEAD] } {

     # Execute the closing handler for current post
      if { [CMD_EXIST PB_end_of_HEAD__$CURRENT_HEAD] } {
         PB_end_of_HEAD__$CURRENT_HEAD
      }

      set mom_sys_prev_mach_head $CURRENT_HEAD
      set mom_sys_curr_mach_head $NEXT_HEAD

      set CURRENT_HEAD $NEXT_HEAD


      global mom_sys_post_visited
      global mom_sys_master_post cam_post_dir

      if { [string match "$CURRENT_HEAD" $mom_sys_master_head] } {

         set mom_load_event_handler "\"$mom_sys_master_post.tcl\""
         MOM_load_definition_file   "$mom_sys_master_post.def"

         set tcl_file "$mom_sys_master_post.tcl"

      } else {

         set tcl_file "[file dirname $mom_sys_master_post]/$mom_sys_postname($CURRENT_HEAD).tcl"
         set def_file "[file dirname $mom_sys_master_post]/$mom_sys_postname($CURRENT_HEAD).def"

         if [file exists "$tcl_file"] {

            if { ![info exists mom_sys_post_visited($CURRENT_HEAD)] } {
               set mom_load_event_handler "$tcl_file"
               set mom_sys_post_visited($CURRENT_HEAD) 1
            } else {
               set mom_load_event_handler "\"$tcl_file\""
            }

            set mom_load_event_handler "{$tcl_file}"
            MOM_load_definition_file   "${def_file}"

         } else {

            set tcl_file "${cam_post_dir}$mom_sys_postname($CURRENT_HEAD).tcl"
            set def_file "${cam_post_dir}$mom_sys_postname($CURRENT_HEAD).def"

            if [file exists "$tcl_file"] {

               regsub -all {\\} $tcl_file {/} tcl_file
               regsub -all {\\} $def_file {/} def_file

               if { ![info exists mom_sys_post_visited($CURRENT_HEAD)] } {
                  set mom_load_event_handler "$tcl_file"
                  set mom_sys_post_visited($CURRENT_HEAD) 1
               } else {
                  set mom_load_event_handler "\"$tcl_file\""
               }

               set mom_load_event_handler "{$tcl_file}"
               MOM_load_definition_file   "${def_file}"

            } else {

               CATCH_WARNING "Post ($mom_sys_postname($CURRENT_HEAD)) for HEAD ($CURRENT_HEAD) not found."
            }
         }
      }


      set mom_sys_head_change_init_program 1

      if [CMD_EXIST MOM_start_of_program_save] {
         rename MOM_start_of_program_save ""
      }
      rename MOM_start_of_program MOM_start_of_program_save

      if [CMD_EXIST MOM_end_of_program] {
         if [CMD_EXIST MOM_end_of_program_save] {
            rename MOM_end_of_program_save ""
         }
         rename MOM_end_of_program MOM_end_of_program_save
      }

      if [CMD_EXIST MOM_head_save] {
         rename MOM_head_save ""
      }
      rename MOM_head MOM_head_save
   }

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
proc MOM_heli_milling { } {
#=============================================================
  global cycle_name
  global cycle_init_flag

   set cycle_init_flag TRUE
   set cycle_name HELI_MILLING
   CYCLE_SET
}


#=============================================================
proc MOM_heli_milling_move { } {
#=============================================================
  global cycle_init_flag


   global mom_sys_abort_next_event
   if { [info exists mom_sys_abort_next_event] } {
      if { [llength [info commands PB_CMD_kin_abort_event]] } {
         PB_CMD_kin_abort_event
      }
   }


   global mom_cycle_defined


   PB_CMD_cycle_helimill_data
   PB_CMD_helimill_1
   MOM_do_template heli_milling
   PB_CMD_helimill_2
   MOM_do_template heli_milling_2
   MOM_do_template heli_milling_1
   PB_CMD_helimill_3
   MOM_do_template heli_milling_3
   PB_CMD_helimill_4
   MOM_do_template heli_milling_4
   PB_CMD_helimill_5
   MOM_do_template heli_milling_5
   PB_CMD_cycle_time
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_initial_move { } {
#=============================================================
  global mom_feed_rate mom_feed_rate_per_rev mom_motion_type
  global mom_kin_max_fpm mom_motion_event
   COOLANT_SET ; CUTCOM_SET ; SPINDLE_SET ; RAPID_SET
   PB_CMD_start_of_operation_force_addresses
   PB_CMD_mill_mode_on
   PB_CMD_offset
   PB_CMD_synchro_on
   PB_CMD_set_C_trans
   PB_CMD_rpm_change
   MOM_force Once M_coolant
   MOM_do_template coolant
   PB_CMD_fix_spindle_off
   PB_CMD_QT_from
   PB_CMD_user_initial_move

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
  global feed_mode mom_feed_rate mom_kin_rapid_feed_rate

   if { ![string compare $feed_mode "IPM"] || ![string compare $feed_mode "MMPM"] } {
      if { [EQ_is_ge $mom_feed_rate $mom_kin_rapid_feed_rate] } {
         MOM_rapid_move
         return
      }
   }


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

   PB_CMD_save_z_clearance
   PB_CMD_spindle_unclamp
   MOM_do_template linear_move
   PB_CMD_spindle_clamp
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
   PB_CMD_set_M01
}


#=============================================================
proc MOM_origin { } {
#=============================================================
   global mom_X
   global mom_Y
   global mom_Z
   global mom_origin_text
}


#=============================================================
proc MOM_power { } {
#=============================================================
   global mom_power_value
   global mom_power_text
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
   MOM_do_template prefun
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
   PB_CMD_tool_axis_and_milling_head
   PB_CMD_save_z_clearance
   PB_CMD_spindle_unclamp
   PB_CMD_MOVE_reposition
   set rapid_spindle_blk {G_plane G_feed G_motion G_mode X Y Z M_coolant}
   set rapid_spindle_x_blk {G_plane G_feed G_motion G_mode X M_coolant}
   set rapid_spindle_y_blk {G_plane G_feed G_motion G_mode Y M_coolant}
   set rapid_spindle_z_blk {G_plane G_feed G_motion G_mode Z M_coolant}
   set rapid_traverse_blk {G_plane G_feed G_motion G_mode X Y Z fifth_axis M_coolant}
   set rapid_traverse_xy_blk {G_plane G_feed G_motion G_mode X Y fifth_axis M_coolant}
   set rapid_traverse_yz_blk {G_plane G_feed G_motion G_mode Y Z fifth_axis M_coolant}
   set rapid_traverse_xz_blk {G_plane G_feed G_motion G_mode X Z fifth_axis M_coolant}
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
            PB_FORCE Once $mod_spindle
            MOM_do_template $spindle_block
         } else {
            MOM_output_literal "$co Rapid Spindle Block is empty! $ci"
         }
      }
      if { ![string compare $rapid_traverse_inhibit "FALSE"] } {
         if { [string compare $traverse_block ""] } {
            PB_FORCE Once $mod_traverse
            MOM_do_template $traverse_block
         } else {
            MOM_output_literal "$co Rapid Traverse Block is empty! $ci"
         }
      }
   } elseif { ![string compare $spindle_first "FALSE"] } {
      if { ![string compare $rapid_traverse_inhibit "FALSE"] } {
         if { [string compare $traverse_block ""] } {
            PB_FORCE Once $mod_traverse
            MOM_do_template $traverse_block
         } else {
            MOM_output_literal "$co Rapid Traverse Block is empty! $ci"
         }
      }
      if { ![string compare $rapid_spindle_inhibit "FALSE"] } {
         if { [string compare $spindle_block ""] } {
            PB_FORCE Once $mod_spindle
            MOM_do_template $spindle_block
         } else {
            MOM_output_literal "$co Rapid Spindle Block is empty! $ci"
         }
      }
   } else {
      PB_FORCE Once $mod_traverse
      MOM_do_template rapid_traverse
   }
   PB_CMD_spindle_clamp
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
proc MOM_select_head { } {
#=============================================================
   global mom_head_type
   global mom_head_text
}


#=============================================================
proc MOM_sequence_number { } {
#=============================================================
   global mom_sequence_mode
   global mom_sequence_number
   global mom_sequence_increment
   global mom_sequence_frequency
   global mom_sequence_text
   SEQNO_SET
}


#=============================================================
proc MOM_set_axis { } {
#=============================================================
   global mom_axis_position
   global mom_axis_position_value
}


#=============================================================
proc MOM_set_modes { } {
#=============================================================
   MODES_SET
}


#=============================================================
proc MOM_set_polar { } {
#=============================================================
   global mom_coordinate_output_mode
}


#=============================================================
proc MOM_spindle_rpm { } {
#=============================================================
   SPINDLE_SET
   PB_CMD_RPM_set
   MOM_force Once S M_spindle
   MOM_do_template spindle_rpm
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

   PB_CMD_expressions
   PB_CMD_mill_path_start
   PB_CMD_subprogram_start
   global mom_operation_name
   MOM_output_literal "(MILL MODE : $mom_operation_name)"
   PB_CMD_tool_axis_mode
}


#=============================================================
proc MOM_start_of_subop_path { } {
#=============================================================
}


#=============================================================
proc MOM_stop { } {
#=============================================================
   PB_CMD_set_M0
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


   PB_CMD_read_cycle_pos_list
   PB_CMD_drill_cycle_set
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
proc MOM_workpiece_load { } {
#=============================================================
   global mom_spindle_number
}


#=============================================================
proc MOM_workpiece_takeover { } {
#=============================================================
   global mom_spindle_2_position
   global mom_takeover_csys
}


#=============================================================
proc MOM_zero { } {
#=============================================================
   global mom_work_coordinate_number
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

   PB_CMD_goto_zero
   PB_CMD_tool_code
   PB_CMD_set_spindle_auto_direction
}


#=============================================================
proc PB_engage_move { } {
#=============================================================
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
   PB_CMD_goto_zero
   PB_CMD_tool_code
   PB_CMD_set_spindle_auto_direction
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
   PB_CMD_UPLEVEL_path
   PB_CMD_mazak_machine_mode
   PB_CMD_unset_vars
   PB_CMD_UPLEVEL_helix
   PB_CMD_UPLEVEL_cycles
   PB_CMD_procs_and_vars
   PB_CMD_UPLEVEL_loop
   PB_CMD_UPLEVEL_subspin
   PB_CMD_START_modification
   PB_CMD_UPLEVEL_modification
   PB_CMD_EXPR_subspin
   PB_CMD_prog_name_out
   PB_CMD_UPLEVEL_workpiece

   if [llength [info commands PB_CMD_kin_start_of_program_2] ] {
      PB_CMD_kin_start_of_program_2
   }
}


#=============================================================
proc PB_user_def_axis_limit_action { args } {
#=============================================================
}


#=============================================================
proc PB_CMD_DO_end { } {
#=============================================================
global do_end

if { ![info exist do_end] || $do_end < 1 } {
      PAUSE "DO WHILE parameter INCORRECT"
      MOM_abort "Emergency Stop"
} else {
      set enddo $do_end
      set do_end [expr $do_end - 1]
      return "END$enddo"
}

}


#=============================================================
proc PB_CMD_DO_while { } {
#=============================================================
global do_while do_end

if { ![info exist do_while] } {
      set do_while 1
} else { incr do_while }

set do_end $do_while

return "DO$do_while"

}


#=============================================================
proc PB_CMD_ETALON_mod { } {
#=============================================================
uplevel #0 {

# ================================================
proc MOM_use_etalon_shift { } {
# ================================================
## EVENT use_etalon_shift
## UI_LABEL "Использовать смещение от основного исполнения"
global mom_etalon_modification ; # s DEFVAL "0000" "Номер основного исполнения"
global mom_use_parameters ; # s Off "Использовать параметры"
global mom_use_parameters_defined

global mom_part_modification ; # s Off "Входит в исполнения"
global mom_current_modification ; # s Off "Исполнение детали"

global cutoff_offset

 if {![info exists mom_current_modification]} { return }
 if {![info exists mom_etalon_modification] || [string length $mom_etalon_modification] < 1 } { return }
 if {![info exists mom_use_parameters_defined] || $mom_use_parameters_defined != 1 } { return }
 if {![info exists mom_use_parameters] || [string length $mom_use_parameters] < 1 } { return }
 if { $mom_current_modification == $mom_etalon_modification } { return }

    if { [string match "*L1*" $mom_use_parameters] } {
           set etalon_param "L1_$mom_etalon_modification"
           set current_param "L1_$mom_current_modification"
           set mod_1 [expr double([MOM_ask_ess_exp_value $etalon_param])]
           set mod_2 [expr double([MOM_ask_ess_exp_value $current_param])]
           set cutoff_offset [expr $mod_1 - $mod_2]

      MOM_output_text "OFFSET L1 = $cutoff_offset"

       }
}



# ================================================
proc ETALON_PARAM { } {
# ================================================
## EVENT use_etalon_shift
## UI_LABEL "Использовать смещение от основного исполнения"
global mom_etalon_modification ; # s DEFVAL "0000" "Номер основного исполнения"
global mom_use_parameters ; # s Off "Использовать параметры"
global mom_use_parameters_defined

global mom_part_modification ; # s Off "Входит в исполнения"
global mom_current_modification ; # s Off "Исполнение детали"

global cutoff_offset

 if {![info exists mom_current_modification]} { return }
 if {![info exists mom_etalon_modification] || [string length $mom_etalon_modification] < 1 } { return }
 if {![info exists mom_use_parameters_defined] || $mom_use_parameters_defined != 1 } { return }
 if {![info exists mom_use_parameters] || [string length $mom_use_parameters] < 1 } { return }
 if { $mom_current_modification == $mom_etalon_modification } { return }

    if { [string match "*L1*" $mom_use_parameters] } {
           set etalon_param "L1_$mom_etalon_modification"
           set current_param "L1_$mom_current_modification"
           set mod_1 [expr double([MOM_ask_ess_exp_value $etalon_param])]
           set mod_2 [expr double([MOM_ask_ess_exp_value $current_param])]
           set cutoff_offset [expr $mod_1 - $mod_2]

      MOM_output_text "OFFSET L1 = $cutoff_offset"

       }
}

} ; # uplevel

}


#=============================================================
proc PB_CMD_EXPR_subspin { } {
#=============================================================
uplevel #0 {

# ============================================
proc MOM_subspindle_take_part_expr { } {
# ============================================
    PB_CMD_EXPR_subspin_take_part
}

# ============================================
proc MOM_subspindle_move_expr { } {
# ============================================
    PB_CMD_EXPR_subspin_move
}

# ============================================
proc MOM_subspindle_gohome_expr { } {
# ============================================
    PB_CMD_EXPR_subspin_gohome
}

# ============================================
proc PB_CMD_EXPR_subspin_take_part { } {
# ============================================
## EVENT subspindle_take_part_expr
## "MILL TURN : EXpression Подход контршпинделя"
global mom_subspin_takeover_length_expr ; # "Список L19. Глубина захвата в КШП."
global mom_subspin_safe_length ; # "Безопасное расст. подхода"
global mom_subspin_press_length ; # "Поджим (натяг)"
global mom_subspin_pull_on_expr ; # "Список L2. Вытянуть / Задвинуть деталь."
global mom_subspin_move_on_expr ; # "Список L3. Переместить открытый КШП."

global part_mod
    if {![info exists part_mod] } { set part_mod "undef" }

    if {$part_mod != "separator" } {
       }

global mom_sys_ptp_output
    if {$mom_sys_ptp_output == "OFF" } { return }

global mom_subspin_on_take_pos
global mom_spindles_synchro_status
global mom_var511
global mom_machine_mode
global mom_spindle_direction mom_coolant_status

  if {$part_mod == "shpilka" } {
     }
       if {[info exists mom_subspin_takeover_length_expr] && \
           [string length $mom_subspin_takeover_length_expr] > 0 } {
                 set takeover_length_expr $mom_subspin_takeover_length_expr
       } else { set takeover_length_expr "none" }
          set format1_ [string map {-L -abs(r +L abs(r L (r} $takeover_length_expr]
          append format1_ ")"
          set takeover_length_expr [string map {-L r +L r L r} $takeover_length_expr]
          regsub -all $takeover_length_expr $format1_ {$takeover_length} format2_

      if {[catch {MOM_ask_ess_exp_value $takeover_length_expr}] == 0 } {
                set takeover_length [format "%0.4f" [MOM_ask_ess_exp_value $takeover_length_expr]]
                set takeover_length "[expr $format2_]"
      } else { set takeover_length 0 }

       if {[info exists mom_subspin_pull_on_expr] && \
           [string length $mom_subspin_pull_on_expr] > 0 } {
                 set pull_on_expr $mom_subspin_pull_on_expr
       } else { set pull_on_expr "none" }
          set format1_ [string map {-L -abs(r +L abs(r L (r} $pull_on_expr]
          append format1_ ")"
          set pull_on_expr [string map {-L r +L r L r} $pull_on_expr]
          regsub -all $pull_on_expr $format1_ {$pull_on} format2_

      if {[catch {MOM_ask_ess_exp_value $pull_on_expr}] == 0 } {
               set pull_on [format "%0.4f" [MOM_ask_ess_exp_value $pull_on_expr]]
               set pull_on  "[expr $format2_]"
      } else { set pull_on 0 }

       if {[info exists mom_subspin_move_on_expr] && \
           [string length $mom_subspin_move_on_expr] > 0 } {
                 set move_on_expr $mom_subspin_move_on_expr
       } else { set move_on_expr "none" }
          set format1_ [string map {-L -abs(r +L abs(r L (r} $move_on_expr]
          append format1_ ")"
          set move_on_expr [string map {-L r +L r L r} $move_on_expr]
          regsub -all $move_on_expr $format1_ {$move_on} format2_

      if {[catch {MOM_ask_ess_exp_value $move_on_expr}] == 0 } {
               set move_on [format "%0.4f" [MOM_ask_ess_exp_value $move_on_expr]]
               set move_on "[expr $format2_]"
      } else { set move_on 0 }

MOM_output_text "(SPIN 2 GOES TO PART)"

if { $mom_machine_mode == "TURN"  && $mom_spindle_direction != "OFF" } {
     set mom_spindle_direction OFF
     MOM_output_literal "M05 M305"
   } else { PB_CMD_fix_spindle_off }
if { $mom_coolant_status != "OFF" } {
     set mom_coolant_status OFF
     MOM_output_literal "M9"
   }
set mom_spindles_synchro_status OFF
SYNCHRO_OFF
MOM_output_literal "G28 U0.0(X GO HOME)"
MOM_output_literal "M58(SPIN 1 AIR BLAST)"
MOM_output_literal "M358(SPIN 2 AIR BLAST)"
MOM_output_literal "M01(SET SUBSPINDLE TOUCH POSITION)"
MOM_output_text "(--------------------------)"
MOM_output_text "(MOVE SUBSPINDLE [format %0.4f $takeover_length] MM OVER PART. SET V501 = Z2)"
MOM_output_text "\#501=0.0 (SPINDLE 2 TAKEOVER POSITION)"

    MOM_output_text "IF \[\#501NE0\] GOTO 99991"
    MOM_output_text "\#3006=1( SET var501 )"
    MOM_output_text "M0"
    MOM_output_text "N99991"

if { [info exist pull_on] && $pull_on != 0.0 } {
      MOM_output_text "\#111=[format "%0.4f" $pull_on](INCREMENT - PULL OUT PART)"
   }
MOM_output_text "(--------------------------)"
  global trans_subspindle_flag
     if {[info exists trans_subspindle_flag] && $trans_subspindle_flag == 1 } {
            MOM_output_text "\#501=\#501+\#511 (SHIFT TAKEOVER POS)"
        }
MOM_output_literal "M902(SPIN 2 ACTIVE)"
MOM_output_literal "M300(SPIN 2 MILL MODE)"
MOM_output_literal "G110 C2(C = C2)"
MOM_output_literal "G0 G90 C0.0(SUBSPINDLE ORIENT)"

MOM_output_literal "G111(C = C1)"
MOM_output_literal "M901(SPIN 1 ACTIVE)"
MOM_output_literal "M200(SPIN 1 MILL MODE)"
MOM_output_literal "G0 G90 C0.0(MAIN SPINDLE ORIENT)"
MOM_output_literal "M540(TAKEOVER MODE ON)"

     MOM_output_text "( ATTENTION!!!!! SPIN 2 MUST BE OPENED!!!!! )"
     MOM_output_literal "M306(SPIN 2 OPEN)"

if { ![info exist mom_subspin_press_length] } { set mom_subspin_press_length 0.0 }
if { [info exist mom_subspin_safe_length] && $mom_subspin_safe_length != 0.0 } {
     MOM_output_literal "G53 G0 G90 B\[\#501+[format "%0.3f" $mom_subspin_safe_length]\](W RAPID POS)"
     MOM_output_literal "G31 B\[\#501-[format "%0.3f" $mom_subspin_press_length]\] (W FEED POS)"
     catch [unset mom_subspin_safe_length]
} else {
     MOM_output_literal "G53 G0 G90 B\#501(W RAPID POS)"
  }

    MOM_output_literal "G4 G98 P2000 (PAUSE)"
    MOM_output_literal "M307(SPIN 2 CLOSE)"
    MOM_output_literal "M541(TAKEOVER MODE OFF)"

if { $pull_on != 0.0 } {
     MOM_output_literal "G04 G98 P1000(PAUSE)"
     MOM_output_literal "M206(SPIN 1 OPEN)"
     MOM_output_literal "M542(TRANSFER MODE ON)"
     MOM_output_literal "G53 G1 G98 B\[\#501+\#111\] F500.0(MOVING PART IN MACHINE AREA)"
     MOM_output_literal "M207(SPIN 1 CLOSE)"
     MOM_output_literal "M543(TRANSFER MODE OFF)"
     set mom_var511 "\#511+\#111(SHIFT Z)"
     MOM_output_text "\#511=$mom_var511"
  }

if { $move_on != 0.0 } {
     MOM_output_literal "M306(SPIN 2 OPEN)"
     MOM_output_literal "G53 G1 G98 B\[\#5025[format "%+0.4f" $move_on]\] F500.0(SPIN 2 MOVE)"
     MOM_output_literal "M307(SPIN 2 CLOSE)"
     MOM_output_literal "G04 G98 P1000(TIME DWELL)"
   }

  if {[info exists part_len] && $part_len != 0 } {
#           MOM_output_text "\#502=[format "%0.4f" $part_len](TOTAL PART LENGTH)"
     }

#  set mom_var511 "\#511+ABS\[\#5025\]-\#502(DATUM SHIFT ALONG Z)"
#  MOM_output_text "\#511=$mom_var511"
#  MOM_output_literal "M202 M302(SPIN 1 2 TURN MODE)"

#  MOM_output_literal "G28 B0.0(SPIN 2 GO HOME)"
#  MOM_output_literal "M58(SPIN 1 AIR BLAST)"
#  MOM_output_literal "M358(SPIN 2 AIR BLAST)"
set mom_spindles_synchro_status OFF
SYNCHRO_ON
  MOM_output_text "(EXPRESSION TAKE PART COMPLETED)"
  MOM_force once G_mode G_motion G_feed

  set mom_subspin_on_take_pos HOLD
  if {[info exists mom_subspin_takeover_length_expr] } { unset mom_subspin_takeover_length_expr }
  if {[info exists mom_subspin_pull_on_expr] } { unset mom_subspin_pull_on_expr }
  if {[info exists mom_subspin_move_on_expr] } { unset mom_subspin_move_on_expr }
}

# ============================================
proc PB_CMD_EXPR_subspin_move { } {
# ============================================
## EVENT subspindle_move_expr
## "MILL TURN : EXpression Смещение контршпинделя"
global mom_pull_free_1_expr ; # "Список L21. Смещение без детали."
global mom_pull_detal_1_expr ; # "Список L22. Смещение с деталью."
global mom_pull_free_2_expr ; # "Список L23. Смещение без детали."
global mom_pull_detal_2_expr ; # "Список L24. Смещение с деталью."

global mom_sys_ptp_output
    if {$mom_sys_ptp_output == "OFF" } { return }

global part_mod
    if {![info exists part_mod] } { set part_mod "undef" }

global mom_subspin_on_take_pos
global mom_spindles_synchro_status
global mom_var511
global mom_machine_mode
global mom_spindle_direction mom_coolant_status

set shift_mcs 0.0

  if {$part_mod == "shpilka" } {
     }

      if {[info exists mom_pull_free_1_expr] && \
          [string length $mom_pull_free_1_expr] > 0 } {
              set free_1_expr $mom_pull_free_1_expr
      } else { set free_1_expr "none" }
          set format1_ [string map {-L -abs(r +L abs(r L (r} $free_1_expr]
          append format1_ ")"
          set free_1_expr [string map {-L r +L r L r} $free_1_expr]
          regsub -all $free_1_expr $format1_ {$free_1} format2_

      if {[catch {MOM_ask_ess_exp_value $free_1_expr}] == 0 } {
             set free_1 [format "%0.4f" [MOM_ask_ess_exp_value $free_1_expr]]
             set free_1 "[expr $format2_]"
      } else { set free_1 0 }

      if {[info exists mom_pull_detal_1_expr] && \
          [string length $mom_pull_detal_1_expr] > 0 } {
              set detal_1_expr $mom_pull_detal_1_expr
      } else { set detal_1_expr "none" }
          set format1_ [string map {-L -abs(r +L abs(r L (r} $detal_1_expr]
          append format1_ ")"
          set detal_1_expr [string map {-L r +L r L r} $detal_1_expr]
          regsub -all $detal_1_expr $format1_ {$detal_1} format2_

      if {[catch {MOM_ask_ess_exp_value $detal_1_expr}] == 0 } {
             set detal_1 [format "%0.4f" [MOM_ask_ess_exp_value $detal_1_expr]]
             set detal_1 "[expr $format2_]"
      } else { set detal_1 0 }

      if {[info exists mom_pull_free_2_expr] && \
          [string length $mom_pull_free_2_expr] > 0 } {
              set free_2_expr $mom_pull_free_2_expr
      } else { set free_2_expr "none" }
          set format1_ [string map {-L -abs(r +L abs(r L (r} $free_2_expr]
          append format1_ ")"
          set free_2_expr [string map {-L r +L r L r} $free_2_expr]
          regsub -all $free_2_expr $format1_ {$free_2} format2_

      if {[catch {MOM_ask_ess_exp_value $free_2_expr}] == 0 } {
             set free_2 [format "%0.4f" [MOM_ask_ess_exp_value $free_2_expr]]
             set free_2 "[expr $format2_]"
      } else { set free_2 0 }


      if {[info exists mom_pull_detal_2_expr] && \
          [string length $mom_pull_detal_2_expr] > 0 } {
              set detal_2_expr $mom_pull_detal_2_expr
      } else { set detal_2_expr "none" }
          set format1_ [string map {-L -abs(r +L abs(r L (r} $detal_2_expr]
          append format1_ ")"
          set detal_2_expr [string map {-L r +L r L r} $detal_2_expr]
          regsub -all $detal_2_expr $format1_ {$detal_2} format2_

      if {[catch {MOM_ask_ess_exp_value $detal_2_expr}] == 0 } {
             set detal_2 [format "%0.4f" [MOM_ask_ess_exp_value $detal_2_expr]]
             set detal_2 "[expr $format2_]"
      } else { set detal_2 0 }

##
MOM_output_text "(SPIN 2 TRANSFER ON)"
if { $mom_machine_mode == "TURN"  && $mom_spindle_direction != "OFF" } {
     set mom_spindle_direction OFF
     MOM_output_literal "M05 M305"
   } else { PB_CMD_fix_spindle_off }
if { $mom_coolant_status != "OFF" } {
     set mom_coolant_status OFF
     MOM_output_literal "M9"
   }

# set mom_spindles_synchro_status OFF
# SYNCHRO_OFF
MOM_output_literal "G28 U0.0(X GO HOME)"
MOM_output_literal "M200(SPIN 1 MILL MODE)"
MOM_output_literal "M300(SPIN 2 MILL MODE)"

if { $free_1 != 0.0 } {
     MOM_output_literal "M306(SPIN 2 OPEN)"
     MOM_output_literal "G53 G1 G98 B\[\#5025+\[[format "%0.4f" $free_1]\]\] F500.0(SPIN 2 MOVE)"
     MOM_output_literal "M307(SPIN 2 CLOSE)"
     MOM_output_literal "G04 G98 P1000(PAUSE)"
   }
if { $detal_1 != 0.0 } {
     MOM_output_literal "M206(SPIN 1 OPEN)"
     MOM_output_literal "M542(TRANSFER MODE ON)"
     MOM_output_literal "G53 G1 G98 B\[\#5025+\[[format "%0.4f" $detal_1]\]\] F500.0(MOVING PART IN MACHINE AREA)"
     MOM_output_literal "M207(SPIN 1 CLOSE)"
     MOM_output_literal "M543(TRANSFER MODE OFF)"
     MOM_output_literal "G04 G98 P1000(TIME DWELL)"
     set shift_mcs [expr $shift_mcs + [format "%0.4f" $detal_1]]
   }
if { $free_2 != 0.0 } {
     MOM_output_literal "M306(SPIN 2 OPEN)"
     MOM_output_literal "G53 G1 G98 B\[\#5025+\[[format "%0.4f" $free_2]\]\] F500.0(SPIN 2 MOVE)"
     MOM_output_literal "M307(SPIN 2 CLOSE)"
     MOM_output_literal "G04 G98 P1000(TIME DWELL)"
   }
if { $detal_2 != 0.0 } {
     MOM_output_literal "M206(SPIN 1 OPEN)"
     MOM_output_literal "M542(TRANSFER MODE ON)"
     MOM_output_literal "G53 G1 G98 B\[\#5025+\[[format "%0.4f" $detal_2]\]\] F500.0(MOVING PART IN MACHINE AREA)"
     MOM_output_literal "M207(SPIN 1 CLOSE)"
     MOM_output_literal "M543(TRANSFER MODE OFF)"
     MOM_output_literal "G04 G98 P1000(TIME DWELL)"
     set shift_mcs [expr $shift_mcs + [format "%0.4f" $detal_2]]
   }

MOM_force once G_feed G_motion
set mom_subspin_on_take_pos HOLD
if { $shift_mcs != 0.0 } {
     set mom_var511 "\#511+[format "%0.4f" $shift_mcs](SHIFT Z)"
     MOM_output_text "\#511=$mom_var511"
   }

# set mom_spindles_synchro_status ON
# SYNCHRO_ON
  MOM_output_literal "(TRANSFER OFF)"

if { [info exist mom_pull_free_1_expr] } { unset mom_pull_free_1_expr }
if { [info exist mom_pull_detal_1_expr] } { unset mom_pull_detal_1_expr }
if { [info exist mom_pull_free_2_expr] } { unset mom_pull_free_2_expr }
if { [info exist mom_pull_detal_2_expr] } { unset mom_pull_detal_2_expr }
}

# ============================================
proc PB_CMD_EXPR_subspin_gohome { } {
# ============================================
## EVENT subspindle_gohome_expr
## "MILL TURN : EXpression Отвод шпинделя #2 "
global mom_subspin_gohome_opt ; # "0. Отвести пустой","1. Забрать деталь","2. Отломить и забрать надрезанную деталь"
global mom_subspin_pull_out_expr ; # "Список L2.  + вытянуть  / - задвинуть заготовку."
global mom_part_length_expr ; # "Список L13. Длина детали."

global mom_sys_ptp_output
    if {$mom_sys_ptp_output == "OFF" } { return }

global mom_spindles_synchro_status
global mom_synchro_mode
global mom_subspin_on_take_pos
global mom_var511
global mom_machine_mode
global mom_spindle_direction mom_coolant_status

global part_mod
    if {![info exists part_mod] } { set part_mod "undef" }

if { ![info exist mom_subspin_on_take_pos] } {
# return
 }

  if {[info exists mom_subspin_gohome_opt] } {
         set subspin_opt [string index $mom_subspin_gohome_opt 0]
  } else { set subspin_opt 1 }

  if { $part_mod == "shpilka" } {
     }

       if {[info exists mom_subspin_pull_out_expr] && \
           [string length $mom_subspin_pull_out_expr] > 0 } {
                 set pull_out_expr $mom_subspin_pull_out_expr
       } else { set pull_out_expr "none" }
          set format1_ [string map {-L -abs(r +L abs(r L (r} $pull_out_expr]
          append format1_ ")"
          set pull_out_expr [string map {-L r +L r L r} $pull_out_expr]
          regsub -all $pull_out_expr $format1_ {$pull_out} format2_

      if {[catch {MOM_ask_ess_exp_value $pull_out_expr}] == 0 } {
               set pull_out [format "%0.4f" [MOM_ask_ess_exp_value $pull_out_expr]]
               set pull_out  "[expr $format2_]"
      } else { set pull_out 0 }

      if {[info exists mom_part_length_expr] && \
          [string length $mom_part_length_expr] > 0 } {
              set part_len_expr $mom_part_length_expr
      } else { set part_len_expr "none" }
          set format1_ [string map {-L -abs(r +L abs(r L (r} $part_len_expr]
          append format1_ ")"
          set part_len_expr [string map {-L r +L r L r} $part_len_expr]
          regsub -all $part_len_expr $format1_ {$part_len} format2_

      if {[catch {MOM_ask_ess_exp_value $part_len_expr}] == 0 } {
             set part_len [format "%0.4f" [MOM_ask_ess_exp_value $part_len_expr]]
             set part_len "[expr $format2_]"
       } else { set part_len 0 }

  MOM_output_text "(SPIN 2 GO HOME)"

    if { [info exist part_len] && ![EQ_is_equal $part_len 0] } {
          MOM_output_text "\#502=[format "%0.4f" $part_len](TOTAL PART LENGTH)"
       }
    if { [info exist mom_subspin_on_take_pos] && $mom_subspin_on_take_pos == "CUTOFF" } {
          MOM_output_literal "M725(CUTOFF MODE OFF)"
       }
    if { $mom_machine_mode == "TURN"  && $mom_spindle_direction != "OFF" } {
          set mom_spindle_direction OFF
          MOM_output_literal "M05 M305"
    } else { PB_CMD_fix_spindle_off }

    if { $mom_coolant_status != "OFF" } {
         set mom_coolant_status OFF
         MOM_output_literal "M9"
       }

set mom_spindles_synchro_status OFF
SYNCHRO_OFF

  if { [info exist pull_out] && ![EQ_is_equal $pull_out 0] } {
         MOM_output_text "\#112=[format "%0.4f" $pull_out](MOVING PART IN MACHINE AREA)"
         MOM_output_literal "M200(SPIN 1 MILL MODE)"
         MOM_output_literal "M300(SPIN 2 MILL MODE)"
         MOM_output_literal "M206(SPIN 1 OPEN)"
         MOM_output_literal "M542(TRANSFER MODE ON)"
         MOM_output_literal "G53 G1 G98 B\[\#5025+\#112\] F500.0(MOVING PART IN MACHINE AREA)"
         MOM_output_literal "M207(SPIN 1 CLOSE)"
         MOM_output_literal "M543(TRANSFER MODE OFF)"
         set mom_var511 "\#511+\#112(SHIFT Z)"
         MOM_output_text "\#511=$mom_var511"
     }

  if { $subspin_opt == 2 } {
        MOM_output_literal "M202(SPIN 1 TURN MODE)"
        MOM_output_literal "M210(SPIN 1 FIX ON)"
        MOM_output_literal "G110 C2(C = C2)"
        MOM_output_literal "G1 G98 H30.0 F200.0"
        MOM_output_literal "G1 G98 H330.0 F2000.0(BREACK OFF C2-1TURN)"
        MOM_output_literal "M212(SPIN 1 FIX OFF)"
        MOM_output_literal "G111(C = C1)"
    }

  if { [info exist part_len] && $part_len > 0.0 } {
          set mom_var511 "\#511+ABS\[\#5025\]-\#502(DATUM SHIFT ALONG Z)"
  } else {
          set mom_var511 "\#511+ABS\[\#5025\](DATUM SHIFT ALONG Z)"
     }

   MOM_output_text "\#511=$mom_var511"
   MOM_output_literal "M202 M302(SPIN 1 2 TURN MODE)"

  if { $subspin_opt == 1 } {
        MOM_output_literal "M206(SPIN 1 OPEN)"
     }
  if { $subspin_opt == 0 } {
       MOM_output_literal "M306(SPIN 2 OPEN)"
     }

   MOM_output_literal "M513"
   MOM_output_literal "G28 B0.0(SPIN 2 GO HOME)"
   MOM_output_literal "M58(SPIN 1 AIR BLAST)"
   MOM_output_literal "M358(SPIN 2 AIR BLAST)"
   MOM_output_literal "(SPIN 2 GO HOME COMPLETED)"
   MOM_force once G_mode G_motion G_feed
   if {[info exists mom_subspin_on_take_pos] } { unset mom_subspin_on_take_pos }
   if {[info exists mom_subspin_pull_out_expr] } { unset mom_subspin_pull_out_expr }
   if {[info exists mom_part_length_expr] } { unset mom_part_length_expr }
}

##----------------------
} ; # uplevel
}


#=============================================================
proc PB_CMD_FEEDRATE_NUMBER { } {
#=============================================================
#
#  This custom command allows you to modify the feed rate number
#  after it has been calculated by the system
#
   global mom_feed_rate_number

   set mom_sys_frn_factor 1.0

   if [info exists mom_feed_rate_number] {
      return [expr $mom_feed_rate_number * $mom_sys_frn_factor]
   } else {
      return 0.0
   }
}


#=============================================================
proc PB_CMD_FIRST_move_tool { } {
#=============================================================
global first_move_tool_call

if { [info exist first_move_tool_call] && $first_move_tool_call == 1 } {
     PB_auto_tool_change
     unset first_move_tool_call
}

}


#=============================================================
proc PB_CMD_GOTO_mark { } {
#=============================================================
global GOTO_mark

if { ![info exist GOTO_mark] || $GOTO_mark < 99000 } {
      PAUSE "GOTO parameter INCORRECT"
      MOM_abort "Emergency Stop"
} else {
      set gotomark $GOTO_mark
      set GOTO_mark [expr $GOTO_mark - 1]
   ## MOM_output_text [PB_CMD_GOTO_mark]
      return "N$GOTO_mark"
}

}


#=============================================================
proc PB_CMD_GOTO_next { } {
#=============================================================
global GOTO_next GOTO_mark

if { ![info exist GOTO_next] } {
      set GOTO_next 99000
} else { incr GOTO_next }

set GOTO_mark $GOTO_next

return "GOTO $GOTO_mark"


}


#=============================================================
proc PB_CMD_INITIAL_move_tool { } {
#=============================================================
global first_move_tool_call

if { [info exist first_move_tool_call] } { unset first_move_tool_call }

}


#=============================================================
proc PB_CMD_ISV_tool_mazak { } {
#=============================================================
# return

global mom_isv_tool_count
global mom_isv_tool_name
global mom_isv_tool_type
global mom_isv_tool_description
global mom_isv_tool_number
global mom_isv_tool_adjust_register

if { [info exist mom_isv_tool_count] } {

     for { set i 0 } { $i < $mom_isv_tool_count } { incr i } {
          if {[info exist mom_isv_tool_number($i)]} {
                set tool_info "\( T$mom_isv_tool_number($i)"
          } else { set tool_info "\( T" }

          if { $mom_isv_tool_type($i) != "Milling" && $mom_isv_tool_type($i) != "Drilling" && \
               [info exist mom_isv_tool_adjust_register($i)] && $mom_isv_tool_adjust_register($i) > 0 } {
                append tool_info ".$mom_isv_tool_adjust_register($i)"
          } else {
                append tool_info ".1"
             }

          append tool_info " : $mom_isv_tool_type($i)"
          append tool_info " : $mom_isv_tool_name($i)"

          if {[info exist mom_isv_tool_description($i)] && [string length $mom_isv_tool_description($i)] > 0 } {
               append tool_info " : $mom_isv_tool_description($i)"
          }

          append tool_info " \)"
          MOM_output_text $tool_info
     } ; # end for
} ; # end if
}


#=============================================================
proc PB_CMD_LABEL_to_skip { } {
#=============================================================
# MOM_output_literal "SKIP LABEL"
}


#=============================================================
proc PB_CMD_MOM_clamp { } {
#=============================================================
# Default handler for UDE MOM_clamp
# - Do not attach it to any event!
#

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
proc PB_CMD_MOM_insert { } {
#=============================================================
# Default handler for UDE MOM_insert
# - Do not attach it to any event!
#
# This procedure is executed when the Insert command is activated.
#
   global mom_Instruction
   MOM_output_literal "$mom_Instruction"
}


#=============================================================
proc PB_CMD_MOM_lock_axis { } {
#=============================================================
# Default handler for UDE MOM_lock_axis
# - Do not attach it to any event!
#

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
proc PB_CMD_MOM_operator_message { } {
#=============================================================
# Default handler for UDE MOM_operator_message
# - Do not attach it to any event!
#
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

   if { [string compare "ON" $mom_operator_message] && [string compare "OFF" $mom_operator_message] } {

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

      if { [info exists mom_group_name] } {
         if { [info exists group_output_file($mom_group_name)] } {
            MOM_close_output_file $group_output_file($mom_group_name)
         }
      }

      MOM_suppress once N
      MOM_output_literal      $text_string

      if { ![string compare "ON" $mom_sys_ptp_output] } {
         MOM_open_output_file    $ptp_file_name
      }

      if { [info exists mom_group_name] } {
         if { [info exists group_output_file($mom_group_name)] } {
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
# Default handler for UDE MOM_opskip_off
# - Do not attach it to any event!
#
# This procedure is executed when the Optional skip command is activated.
#
   global mom_sys_opskip_block_leader
   MOM_set_line_leader off  $mom_sys_opskip_block_leader
}


#=============================================================
proc PB_CMD_MOM_opskip_on { } {
#=============================================================
# Default handler for UDE MOM_opskip_on
# - Do not attach it to any event!
#
# This procedure is executed when the Optional skip command is activated.
#
   global mom_sys_opskip_block_leader
   MOM_set_line_leader always  $mom_sys_opskip_block_leader
}


#=============================================================
proc PB_CMD_MOM_pprint { } {
#=============================================================
# Default handler for UDE MOM_pprint
# - Do not attach it to any event!
#
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
# Default handler for UDE MOM_rotate
# - Do not attach it to any event!
#

## <rws 04-11-2008>
## If in TURN mode and user invokes "Flip tool aorund Holder" a MOM_rotate event is generated
## When this happens ABORT this event via return
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
            if { ![string compare "5_axis_head_table" $mom_kin_machine_type] || ![string compare "5_AXIS_HEAD_TABLE" $mom_kin_machine_type] } {
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
         set mom_out_angle_pos($a) [ROTSET $ang $prev_angles(0) $mom_kin_4th_axis_direction $mom_kin_4th_axis_leader mom_sys_leader(fourth_axis) $mom_kin_4th_axis_min_limit $mom_kin_4th_axis_max_limit]
      } else {
         set mom_out_angle_pos($a) [ROTSET $ang $prev_angles(1) $mom_kin_5th_axis_direction $mom_kin_5th_axis_leader mom_sys_leader(fifth_axis) $mom_kin_5th_axis_min_limit $mom_kin_5th_axis_max_limit]
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
            set mom_out_angle_pos($a) [ROTSET $ang $prev_angles(0) $mom_kin_4th_axis_direction $mom_kin_4th_axis_leader mom_sys_leader(fourth_axis) $mom_kin_4th_axis_min_limit $mom_kin_4th_axis_max_limit]
         } else {
            set mom_out_angle_pos($a) [ROTSET $ang $prev_angles(1) $mom_kin_5th_axis_direction $mom_kin_5th_axis_leader mom_sys_leader(fifth_axis) $mom_kin_5th_axis_min_limit $mom_kin_5th_axis_max_limit]
         }
      } elseif { $dir == 1 } {
         set mom_out_angle_pos($a) $ang
      }
   }


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
proc PB_CMD_MOM_text { } {
#=============================================================
# Default handler for UDE MOM_text
# - Do not attach it to any event!
#
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
proc PB_CMD_MOVE_reposition { } {
#=============================================================
return

global user_tool_axis_type
global mom_transmit_mode
# OPTIONS "XY","XC","AUTO"
global mom_operation_type
global mom_tool_axis
global AUTO_clamp_5th ; # ON OFF

if { $mom_operation_type == "Cylinder Milling" && \
          [EQ_is_equal [expr abs($mom_tool_axis(2))] 1] } {
     global mom_pos mom_mcs_goto mom_out_angle_pos
     global RAD2DEG DEG2RAD
     global mom_fanuc_mill_mode

       if {[EQ_is_equal $mom_mcs_goto(0) 0] && \
                    [EQ_is_equal $mom_mcs_goto(1) 0] } {
                set rad_ 0
                set ang_ 0
       } else {
             set rad_ [expr hypot($mom_mcs_goto(0), $mom_mcs_goto(1))]
             set ang_ [expr atan2($mom_mcs_goto(1), $mom_mcs_goto(0))*$RAD2DEG]
               if {[EQ_is_lt $ang_ 0]} {
                      set ang_ [expr $ang_+360.0]
                  }
             set mom_pos(4) $ang_
             set mom_out_angle_pos(1) $ang_
             set mom_pos(0) $rad_
             set mom_pos(1) 0
         }

       MOM_reload_variable -a mom_pos
       MOM_reload_variable -a mom_out_angle_pos
       MOM_force once X Y
       PB_CMD_kin_before_motion
#       MOM_reload_kinematics
#       MOM_enable_address G_plane fifth_axis Y
#       MOM_force once G_plane G_motion X Y fifth_axis F
#       set AUTO_clamp_5th OFF
}

}


#=============================================================
proc PB_CMD_QT_from { } {
#=============================================================
## mom_motion_event = from_move
## mom_motion_type  = FROM
## Initial Move   mom_current_motion = from_move
## First Move     mom_current_motion = first_move
global mom_from_status
global mom_current_motion
  if {![info exists mom_from_status] || $mom_from_status != 1 } { return }
  if {![info exists mom_current_motion] } { return }
  if { $mom_current_motion != "initial_move" && $mom_current_motion != "first_move" } { return }

global mom_from_tool_axis_status
global mom_operation_name

    MOM_output_literal "( FROM POINT )"

    if {![info exist mom_from_tool_axis_status] || $mom_from_tool_axis_status != 1 } {
            set message_ "In operation $mom_operation_name. \n"
            append message_ "For FROM POINT is not specifed the Tool Axis Vector. \n"
            append message_ "Cancel the use of FROM POINT or specify the Tool Axis vector. \n \n"

            append message_ "Nell'operazione $mom_operation_name. \n"
            append message_ "Per il punto di FROM non è specificato, il vettore dell'asse dello strumento. \n"
            append message_ "Annulla l'utilizzo di un punto FROM o impostare il vettore dell'asse. \n \n"

            append message_ "В операции $mom_operation_name. \n"
            append message_ "Для точки FROM не задан вектор оси инструмента. \n"
            append message_ "Отмените использование точки FROM или задайте вектор оси."
            PAUSE $message_
            MOM_abort "Incorrect FROM MOVE"
       }

     MOM_force once G_mode G_motion X Y Z fifth_axis
     MOM_do_template from_z
     MOM_do_template from_x

return

global mom_from_status
global mom_current_motion
global mom_start_status
global mom_tool_axis
## mom_start_status = 1 - start point defined

  if {[info exists mom_current_motion] && $mom_current_motion == "first_move" } {
        if {![info exists mom_start_status] || $mom_start_status != 1 } {

        global mom_nxt_pos mom_pos
        global mom_nxt_mcs_goto mom_mcs_goto
        global mom_nxt_tool_axis
        global mom_nxt_out_angle_pos mom_out_angle_pos

          VMOV 3 mom_nxt_pos mom_pos
          VMOV 3 mom_nxt_mcs_goto mom_mcs_goto
          VMOV 3 mom_nxt_tool_axis mom_tool_axis
          VMOV 2 mom_nxt_out_angle_pos mom_out_angle_pos

          MOM_reload_variable -a mom_pos
          MOM_reload_variable -a mom_tool_axis
          MOM_reload_variable -a mom_mcs_goto
          MOM_reload_variable -a mom_out_angle_pos
  } }

}


#=============================================================
proc PB_CMD_QT_gohome { } {
#=============================================================
MILL_MODE_SET "OFF"

global mom_operation_name
global mom_pos mom_mcs_goto
global mom_gohome_axis_status mom_gohome_pos
global mom_tool_axis
global AUTO_clamp_5th

    MOM_output_literal "( GOHOME POINT )"

    if {![info exist mom_gohome_axis_status] || $mom_gohome_axis_status != 1 } {
            set message_ "In operation $mom_operation_name. \n"
            append message_ "For GOHOME POINT is not specifed the Tool Axis Vector. \n"
            append message_ "Cancel the use of GOHOME POINT or specify the Tool Axis vector. \n \n"

            append message_ "Nell'operazione $mom_operation_name. \n"
            append message_ "Per il punto di GOHOME non è specificato, il vettore dell'asse dello strumento. \n"
             append message_ "Annulla l'utilizzo di un punto GOHOME o impostare il vettore dell'asse. \n \n"

            append message_ "В операции $mom_operation_name. \n"
            append message_ "Для точки GOHOME не задан вектор оси инструмента. \n"
            append message_ "Отмените использование точки GOHOME или задайте вектор оси."
            PAUSE $message_
            MOM_abort "Incorrect GOHOME MOVE"
      }

    if {[EQ_is_equal [expr abs($mom_tool_axis(2))] 1]} {
          VMOV 3 mom_mcs_goto mom_pos
          MOM_reload_variable -a mom_pos
          MOM_suppress once fifth_axis
    }

  set AUTO_clamp_5th OFF

}


#=============================================================
proc PB_CMD_RPM_set { } {
#=============================================================
global mom_spindle_reversed ; # "FALSE" "Реверсный приводной блок"
global mom_spindle_direction
global mom_tool_direction ; # 0-no 1-m3 2-m4
global mom_tool_axis

if { [info exists mom_tool_direction] && $mom_tool_direction != 0 } {
       if { [info exist mom_spindle_reversed] && $mom_spindle_reversed == "TRUE" } {
            if { $mom_tool_direction == 2 } {
                   set direction_ CLW
            } else {
                   set direction_ CCLW
            }
      } else {
            if { $mom_tool_direction == 2 } {
                   set direction_ CCLW
            } else {
                   set direction_ CLW
            }
        }
}

if { [info exists direction_] && [EQ_is_equal $mom_tool_axis(2) -1] } {
            if { $direction_ == "CCLW" } {
                   set direction_ CLW
            } elseif { $direction_ == "CLW" } {
                   set direction_ CCLW
              }
}

if { [info exists direction_] } {
       set mom_spindle_direction $direction_
}

}


#=============================================================
proc PB_CMD_SET_autoclamp { } {
#=============================================================
global AUTO_clamp_5th ; # ON OFF
global mom_operation_type
global mom_fanuc_mill_mode


if {[info exists mom_operation_type] && [string match "*Gener*" $mom_operation_type]} {
        set AUTO_clamp_5th OFF
} elseif { $mom_fanuc_mill_mode == "XC" } {
        set AUTO_clamp_5th ON
} elseif { $mom_fanuc_mill_mode == "XY" } {
        set AUTO_clamp_5th ON
} elseif { $mom_fanuc_mill_mode == "XZ" } {
        set AUTO_clamp_5th ON
} else {
        set AUTO_clamp_5th OFF
  }

}


#=============================================================
proc PB_CMD_START_modification { } {
#=============================================================
## UI_LABEL "Исполнение детали"
global mom_current_modification ; # TYPE s TOGGLE Off
global PART_modification
    if { [catch {MOM_ask_ess_exp_value "MODIFICATION"}] == 0 } {
            set PART_modification [format "%s" [MOM_ask_ess_exp_value "MODIFICATION"]]
            set mom_current_modification $PART_modification
    } else { set PART_modification "undef" }

global part_mod
    if { [catch {MOM_ask_ess_exp_value "Part_type"}] == 0 } {
            set part_mod [format "%s" [MOM_ask_ess_exp_value "Part_type"]]
    } else { set part_mod "undef" }

global PART_list
    if { [catch {MOM_ask_ess_exp_value "MOD_LIST"}] == 0 } {
            set PART_list [format "%s" [MOM_ask_ess_exp_value "MOD_LIST"]]
            set PART_list [string map { \{ "" \} "" \" "" , " " } $PART_list]
            set PART_list [split $PART_list]
    } else { set PART_list "0" }

    if {$part_mod != "separator" } {
            # PAUSE "Не указан тип детали.\nРабота будет прервана.\nИспользуйте другой постпроцессор.\n"
       }

}


#=============================================================
proc PB_CMD_UPLEVEL_cycles { } {
#=============================================================
uplevel #0 {

#=============================================
proc MOM_heli_mill { } {
#=============================================
global mom_cycle_event_type
set mom_cycle_event_type "hhain_hm"
}

#=============================================
proc MOM_hm_heli_mill { } {
#=============================================
global mom_cycle_event_type
set mom_cycle_event_type "general_hm"
}

#=============================================
proc MOM_mt_heli_mill { } {
#=============================================
global mom_cycle_event_type
set mom_cycle_event_type "mt_boremilling"
}

#=============================================
proc MOM_sinumerik_pocket4 { } {
#=============================================
global mom_cycle_event_type
set mom_cycle_event_type "pocket4"
}

#=============================================
proc MOM_thread_mill { } {
#=============================================
global mom_cycle_event_type
set mom_cycle_event_type "hhain_tm"
}

#=============================================
proc MOM_mt_thread_milling { } {
#=============================================
global mom_cycle_event_type
set mom_cycle_event_type "general_tm"
}

#=============================================
proc MOM_mt_thread_mill { } {
#=============================================
global mom_cycle_event_type
set mom_cycle_event_type "mt_threadmilling"
}

#=============================================
proc MOM_sinumerik_thread_mill { } {
#=============================================
global mom_cycle_event_type
set mom_cycle_event_type "cycle90"
}

#=============================================
proc MOM_hh_chamfer { } {
#=============================================
global mom_cycle_event_type
set mom_cycle_event_type "chamfer"
}

#=============================================
proc MOM_dryseal_pipe_thread_mill { } {
#=============================================
global mom_cycle_event_type
set mom_cycle_event_type "nptf"
}
#=============================================
} ; #uplevel
}


#=============================================================
proc PB_CMD_UPLEVEL_helix { } {
#=============================================================
global mom_sys_helix_pitch_type
global mom_kin_helical_arc_output_mode

set mom_sys_helix_pitch_type    "rise_revolution"
set mom_kin_helical_arc_output_mode END_POINT
MOM_reload_kinematics

}


#=============================================================
proc PB_CMD_UPLEVEL_loop { } {
#=============================================================
uplevel #0 {

#============================
proc MOM_cycle_loop_start { } {
#============================
## EVENT cycle_loop_start "Повтор обработки со смещением"
## images/lathe_loop.bmp
global mom_loop_repeat_nr ; # "Количество деталей"
global mom_loop_repeat_nr_defined
global mom_loop_repeat_shift ; # TOGGLE Off "Смещение"
global mom_loop_repeat_shift_defined
global mom_loop_repeat_takeover ; # TRUE "Учесть при перехвате в КШ"
global mom_group_name group_loop
global do_while do_end
global mom_var511
global first_move_tool_call

      global trans_subspindle_flag ; # FLAG to define (Wpos+#511) active

  if { ![info exist mom_loop_repeat_nr_defined] || \
                  $mom_loop_repeat_nr_defined != 1 } { return }

  if { ![info exist mom_loop_repeat_nr] || \
                           $mom_loop_repeat_nr < 1 } { return }

  if { ![info exist mom_loop_repeat_shift_defined] || \
               $mom_loop_repeat_shift_defined != 1 } { return }

  if { ![info exist mom_loop_repeat_shift] || \
            [EQ_is_equal $mom_loop_repeat_shift 0] } { return }

  if { [info exist group_loop] } { unset group_loop }

  if { [info exist mom_group_name] } {
       set group_loop $mom_group_name
  } else { return }

  if { ![info exist do_while] } {
        set do_while 1
  } else { incr do_while }

  set first_move_tool_call 1
  set do_end $do_while
  set vari_COUNT [expr ($do_while-1)*3+551] ; # #551
  set vari_FOR [expr $vari_COUNT+1] ; #         #552
  set vari_SHIFT [expr $vari_COUNT+2] ; #       #553

  MOM_output_text "( )"
  MOM_output_text "(LOOP \#$do_while STARTS HERE)"
  MOM_output_text "\#$vari_COUNT=1 (START and SCORE)"
  MOM_output_text "\#$vari_FOR=$mom_loop_repeat_nr (NUMBER OF PARTS)"
  MOM_output_text "\#$vari_SHIFT=[format "%0.4f" $mom_loop_repeat_shift] (DATUM SHIFT ALONG Z)"

  MOM_output_text "N[expr 99000 + $do_while] ( MARK \#${do_while} )"
  MOM_output_text "IF\[\#${vari_COUNT}LT1\] GOTO 99999"
  MOM_output_text "IF\[\#${vari_COUNT}GT\#${vari_FOR}\] GOTO 99999"

  set mom_var511 "\[\#${vari_COUNT}-1\]*\#${vari_SHIFT}"
  MOM_output_text "\#511=$mom_var511"

  if {[info exist mom_loop_repeat_takeover] && \
             $mom_loop_repeat_takeover == "TRUE" } { }
  set trans_subspindle_flag 1
}

#============================
proc PB_CMD_cycle_loop_end { } {
#============================
## "Конец петли"
global mom_loop_repeat_nr ; # "Количество деталей"
global trans_subspindle_flag
global mom_group_name group_loop
global do_end
global mom_var511
global first_move_tool_call

  if { ![info exist group_loop] || $group_loop != $mom_group_name } { return }

  if { ![info exist do_end] || $do_end < 1 } {
        PAUSE "DO WHILE parameter INCORRECT"
        MOM_abort "Emergency Stop"
     }

  set vari_COUNT [expr ($do_end-1)*3+551] ; # #551
  set vari_FOR [expr $vari_COUNT+1] ; #         #552
  set vari_SHIFT [expr $vari_COUNT+2] ; #       #553

  MOM_output_text "\#$vari_COUNT=\#${vari_COUNT}+1 (INCREASE SCORE)"
  MOM_output_text "IF\[\#${vari_COUNT}LE\#${vari_FOR}\] GOTO [expr 99000 + $do_end]"
  MOM_output_text "\#511=0"
  MOM_output_text "(LOOP \#$do_end ENDS HERE)"
  MOM_output_text "( )"

  if {[info exist mom_loop_repeat_nr]} { unset mom_loop_repeat_nr }
  set do_end [expr $do_end - 1]
  set mom_var511 "0"
  set first_move_tool_call 1
  unset group_loop
  if {[info exists trans_subspindle_flag]} {
        unset trans_subspindle_flag
     }
}

} ; # uplevel

}


#=============================================================
proc PB_CMD_UPLEVEL_modification { } {
#=============================================================
uplevel #0 {

#==========================
proc MOM_Modification { } {
#==========================
## UI_LABEL "Принадлежность к исполнению детали"
global mom_part_modification ; # TYPE s TOGGLE Off
global mom_part_modification_defined
global mom_current_modification
global mom_current_modification_defined
global mom_group_name modification_group

    if {![info exists mom_current_modification] } {
           PAUSE " Исполнение детали не задано.\n\n Part Modification Is'nt Defined"
           return
       }

    if {![info exists mom_part_modification] || \
         [string length $mom_part_modification] < 1 || \
                     $mom_part_modification_defined != 1 } {
           PAUSE "Для группы $mom_group_name не задана принадлежность к исполнению.\n\nПо умолчанию принимаются все исполнения."
           return
       }

    if {[string match {*\*} $mom_part_modification]} {
          if {[string match "*$mom_part_modification*" $mom_current_modification] } {
                 MOM_output_text "( Operation for Part Modifications $mom_part_modification )"
                 return
             }
       }

    if {[string match "*$mom_current_modification*" $mom_part_modification] } {
          MOM_output_text "( Operation for Part Modifications $mom_part_modification )"
          return
       }

           set modification_group $mom_group_name
           global mom_saved_sequence_number mom_seqnum
           global ptp_file_name
           global mom_sys_ptp_output
           set mom_sys_ptp_output OFF
           MOM_close_output_file $ptp_file_name
           set mom_saved_sequence_number $mom_seqnum
           # MOM_skip_handler_to_event MOM_end_of_path
}

#==========================
proc MOM_Choose_part_modification { } {
#==========================
## UI_LABEL "Исполнение детали"
global mom_current_modification ; # TYPE s TOGGLE Off
global mom_current_modification_defined
global PART_modification

    if {[info exists PART_modification] && $PART_modification != "undef" } {
          set mom_current_modification $PART_modification
          MOM_output_text "( Part Modification Is $mom_current_modification )"
          return
       }

    if { [info exists mom_current_modification] && $mom_current_modification != "undef" } { return }

    if { [info exists mom_current_modification] } {
         if {[string length $mom_current_modification] < 1 || \
                           $mom_current_modification_defined != 1} {
               unset mom_current_modification
            }
       }

    if {![info exists mom_current_modification] } {
         PAUSE " Исполнение детали не задано.\n\n Part Modification Is'nt Defined"
         return
       }

    if {[info exists mom_current_modification]} {
          MOM_output_text "( Part Modification Is $mom_current_modification )"
       }
}

#==========================
proc RESET_modification { } {
#==========================
global mom_part_modification
global mom_group_name modification_group
global cutoff_offset

    if {[info exists cutoff_offset]} { unset cutoff_offset }
    if {![info exists mom_part_modification] } { return }
    if {[info exists mom_group_name] && \
       [info exists modification_group] && \
          $mom_group_name == $modification_group } {
             unset mom_part_modification
             global ptp_file_name
             global mom_sys_ptp_output
             global mom_saved_sequence_number
             set mom_sys_ptp_output ON
             MOM_open_output_file $ptp_file_name
             MOM_reset_sequence $mom_saved_sequence_number 1 1
    }
}

# ================================================
proc MOM_use_etalon_shift { } {
# ================================================
## EVENT use_etalon_shift
## UI_LABEL "Использовать смещение от основного исполнения"
global mom_etalon_modification ; # s DEFVAL "0000" "Номер основного исполнения"
global mom_use_parameters ; # s Off "Использовать параметры"
global mom_use_parameters_defined

global mom_part_modification ; # s Off "Входит в исполнения"
global mom_current_modification ; # s Off "Исполнение детали"
global cutoff_offset

global PART_list PART_modification
global part_mod

  if {[info exists cutoff_offset]} { unset cutoff_offset }

  if {![info exists PART_list] || ![info exists PART_modification] } { return }
  if {![info exists mom_current_modification]} { return }
  if {![info exists mom_etalon_modification] || [string length $mom_etalon_modification] < 1 } { return }

  if {![info exists mom_use_parameters_defined] || $mom_use_parameters_defined != 1 } { return }
  if {![info exists mom_use_parameters] || [string length $mom_use_parameters] < 1 } { return }
  if { $mom_current_modification == $mom_etalon_modification } { return }

    if { [catch {MOM_ask_ess_exp_value $mom_use_parameters}] == 0 } {
            set PARAM_list [format "%s" [MOM_ask_ess_exp_value $mom_use_parameters]]
            set PARAM_list [string map { \{ "" \} "" \" "" , " " } $PARAM_list]
            set PARAM_list [split $PARAM_list]
    } else {
            set PARAM_list "0"
       }

if {[set curr_search_ [lsearch $PART_list $PART_modification]] >= 0 && \
    [set eta_search_ [lsearch $PART_list $mom_etalon_modification]] >= 0 } {
         set mod_1 [lindex $PARAM_list $curr_search_]
         set mod_2 [lindex $PARAM_list $eta_search_]
         # set cutoff_offset [expr $mod_1 - $mod_2]
         set cutoff_offset [expr $mod_2 - $mod_1]
  }
}

#==========================
} ; # uplevel

}


#=============================================================
proc PB_CMD_UPLEVEL_path { } {
#=============================================================
uplevel #0 {

#============================
proc MOM_end_of_group { } {
#============================
  GROUP_end
}

#============================
proc GROUP_end { } {
#============================
global group_end_command_list
global mom_subprogram_group
global mom_group_name

   RESET_modification

  if { [info exist mom_subprogram_group] && [info exist mom_group_name] } {
    if { $mom_subprogram_group == $mom_group_name } {
         PB_CMD_subprogram_end
         catch [unset mom_subprogram_group]
       }
     }

  if { [llength [info commands PB_CMD_cycle_loop_end]] > 0 } {
          PB_CMD_cycle_loop_end
     }

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
proc PB_CMD_UPLEVEL_subspin { } {
#=============================================================
uplevel #0 {

# ============================================
proc MOM_simple_takeover { } {
# ============================================
## "MILL TURN : Просто перехват"
global mom_takeover_mode_opt ; # "1. Из ГШП в КШП","2. Из КШП в ГШП"
global mom_subspin_safe_length ; # Off "Безопасное расст. подхода"
global mom_subspin_safe_length_defined
global mom_subspin_press_length ; # Off "Поджим (натяг)"
global mom_subspin_press_length_defined
global mom_subspin_pull_on ; # Off "Вытянуть / Задвинуть деталь"
global mom_subspin_pull_on_defined
global mom_subspin_breake_part ; # FALSE "Отломать деталь"

global mom_sys_ptp_output
    if {$mom_sys_ptp_output == "OFF" } { return }

global mom_subspin_on_take_pos
global mom_spindles_synchro_status
global mom_var511
global mom_machine_mode
global mom_spindle_direction mom_coolant_status
global blank_place ; # spindle where blak is placed

    if {[info exist mom_takeover_mode_opt]} {
           set blank_place [string index $mom_takeover_mode_opt 0] ; # 1. Заготовка в ГШП / 2. Заготовка в КШП
    } else { set blank_place 1 }

    if {[catch {MOM_ask_ess_exp_value "r19"}] == 0 } {
           set takeover_depth [format "%0.3f" [MOM_ask_ess_exp_value "r19"]]
    } else {
           set takeover_depth 0
      }

MOM_output_text "(SIMPLE TAKEOVER)"

if { $mom_machine_mode == "TURN"  && $mom_spindle_direction != "OFF" } {
     set mom_spindle_direction OFF
     MOM_output_literal "M05 M305"
   } else { PB_CMD_fix_spindle_off }
if { $mom_coolant_status != "OFF" } {
     set mom_coolant_status OFF
     MOM_output_literal "M9"
   }
set mom_spindles_synchro_status OFF
SYNCHRO_OFF
MOM_output_literal "G28 U0.0(X GO HOME)"
MOM_output_literal "M58(SPIN 1 AIR BLAST)"
MOM_output_literal "M358(SPIN 2 AIR BLAST)"
MOM_output_literal "M01(SET SUBSPINDLE TOUCH POSITION)"
MOM_output_text "(--------------------------)"
MOM_output_text "(MOVE SUBSPINDLE $takeover_depth MM OVER PART. SET V501 = Z2)"
MOM_output_text "\#501=0.0 (SPINDLE 2 TAKEOVER POSITION)"

    MOM_output_text "IF \[\#501NE0\] GOTO 99991"
    MOM_output_text "\#3006=1( SET var501 )"
    MOM_output_text "M0"
    MOM_output_text "N99991"

if { [info exist mom_subspin_pull_on] && $mom_subspin_pull_on != 0.0 } {
      MOM_output_text "\#111=[format "%0.4f" $mom_subspin_pull_on](INCREMENT - PULL OUT PART)"
   }
MOM_output_text "(--------------------------)"
  global trans_subspindle_flag
     if {[info exists trans_subspindle_flag] && $trans_subspindle_flag == 1 } {
            MOM_output_text "\#501=\#501+\#511 (SHIFT TAKEOVER POS)"
        }
MOM_output_literal "M902(SPIN 2 ACTIVE)"
MOM_output_literal "M300(SPIN 2 MILL MODE)"
MOM_output_literal "G110 C2(C = C2)"
MOM_output_literal "G0 G90 C0.0(SUBSPINDLE ORIENT)"

MOM_output_literal "G111(C = C1)"
MOM_output_literal "M901(SPIN 1 ACTIVE)"
MOM_output_literal "M200(SPIN 1 MILL MODE)"
MOM_output_literal "G0 G90 C0.0(MAIN SPINDLE ORIENT)"
MOM_output_literal "M540(TAKEOVER MODE ON)"

if { $blank_place == 1 } {
     if { [info exist mom_subspin_on_take_pos] } { CHACK_OPEN "2" }
     MOM_output_text "( ATTENTION!!!!! SPIN 2 MUST BE OPENED!!!!! )"
     MOM_output_literal "M306(SPIN 2 OPEN)"
} elseif { $blank_place == 2 } {
     if { [info exist mom_subspin_on_take_pos] } { CHACK_OPEN "1" }
     MOM_output_text "( ATTENTION!!!!! SPIN 1 MUST BE OPENED!!!!! )"
     MOM_output_literal "M206(SPIN 1 OPEN)"
   }

if { ![info exist mom_subspin_press_length] } { set mom_subspin_press_length 0.0 }
if { [info exist mom_subspin_safe_length] && $mom_subspin_safe_length != 0.0 } {
     MOM_output_literal "G53 G0 G90 B\[\#501+[format "%0.3f" $mom_subspin_safe_length]\](W RAPID POS)"
     MOM_output_literal "G31 B\[\#501-[format "%0.3f" $mom_subspin_press_length]\] (W FEED POS)"
     catch [unset mom_subspin_safe_length]
} else {
     MOM_output_literal "G53 G0 G90 B\#501(W RAPID POS)"
  }

MOM_output_literal "G4 G98 P2000 (PAUSE)"
if { $blank_place == 1 } {
     MOM_output_literal "M307(SPIN 2 CLOSE)"
} elseif { $blank_place == 2 } {
      MOM_output_literal "M207(SPIN 1 CLOSE)"
   }
MOM_output_literal "M541(TAKEOVER MODE OFF)"

if { [info exist mom_subspin_pull_on] && $mom_subspin_pull_on != 0.0 } {
     MOM_output_literal "G04 G98 P1000(PAUSE)"
     MOM_output_literal "M206(SPIN 1 OPEN)"
     MOM_output_literal "M542(TRANSFER MODE ON)"
     MOM_output_literal "G53 G1 G98 B\[\#501+\#111\] F500.0(MOVING BLANK)"
     MOM_output_literal "M207(SPIN 1 CLOSE)"
     MOM_output_literal "M543(TRANSFER MODE OFF)"
     set mom_var511 "\#511+\#111(SHIFT Z)"
     MOM_output_text "\#511=$mom_var511"
     if { $mom_machine_mode == "TURN" } { PROC_OFFSET }
     unset mom_subspin_pull_on
  }

# MOM_output_text "(SPIN 2 GO HOME)"
MOM_output_text "\#502=[format "%0.4f" [MOM_ask_ess_exp_value "r13"]](TOTAL PART LENGTH)"

if { [info exist mom_subspin_breake_part] && $mom_subspin_breake_part == "TRUE" } {
      # MOM_output_literal "M200(SPIN 1 MILL MODE)"
      MOM_output_literal "M202(SPIN 1 TURN MODE)"
      MOM_output_literal "M210(SPIN 1 FIX)"

      MOM_output_literal "M300(SPIN 2 MILL MODE)"
      MOM_output_literal "G110 C2(C = C2)"
      MOM_output_literal "G1 G98 H30.0 F200.0"
      MOM_output_literal "G1 G98 H330.0 F2000.0(BREACk OFF C2-1TURN)"

      # MOM_output_literal "M202(SPIN 1 TURN MODE)"
      MOM_output_literal "M212(SPIN 1 FIX OFF)"

      MOM_output_literal "G111(C = C1)"
      MOM_output_literal "M302(SPIN 2 TURN MODE)"

} elseif { $blank_place == 2 } {
     MOM_output_literal "M306(SPIN 2 OPEN)"

} elseif { $blank_place == 1 } {
     MOM_output_literal "M206(SPIN 1 OPEN)"
}

  set mom_var511 "\#511+ABS\[\#5025\]-\#502(DATUM SHIFT ALONG Z)"
  MOM_output_text "\#511=$mom_var511"
  MOM_output_literal "M202 M302(SPIN 1 2 TURN MODE)"

  MOM_output_literal "G28 B0.0(SPIN 2 GO HOME)"
  MOM_output_literal "M58(SPIN 1 AIR BLAST)"
  MOM_output_literal "M358(SPIN 2 AIR BLAST)"
  MOM_output_text "(SIMPLE TAKEOVER COMPLETED)"
  MOM_force once G_mode G_motion G_feed
}

} ; # uplevel
}


#=============================================================
proc PB_CMD_UPLEVEL_workpiece { } {
#=============================================================
uplevel #0 {

#============================
proc MOM_workpiece_load { } {
#============================
PB_CMD_load_workpiece
}

#============================
proc MOM_workpiece_unload { } {
#============================
PB_CMD_unload_workpiece
}

#============================
proc MOM_part_unload { } {
#============================
PB_CMD_unload_workpiece
}

#============================
proc MOM_barfeeder_stop { } {
#============================
global PART_modification

    if {![info exists PART_modification] } {
           PB_CMD_barfeeder_stop
           return
       }

    if { [catch {MOM_ask_ess_exp_value "BARFEEDER_on"}] == 0 } {
            set barfeeder_list [format "%s" [MOM_ask_ess_exp_value "BARFEEDER_on"]]
            set barfeeder_list [string map { \{ "" \} "" \" "" , " " } $barfeeder_list]
            set barfeeder_list [split $barfeeder_list]
    } else {
           PB_CMD_barfeeder_stop
           return
      }

    if { [lsearch $barfeeder_list $PART_modification] >= 0 } {
           PB_CMD_barfeeder_stop
       }
}

#============================
} ;# uplevel
}


#=============================================================
proc PB_CMD__check_block_heli_milling_1 { } {
#=============================================================
# This custom command should return
#   1 : Output BLOCK
#   0 : No output

   global mom_logname




 return 1

global mom_cycle_rapid_to_pos
global mom_cycle_feed_to_pos
global mom_cycle_retract_to_pos
global feed
global mom_mcs_goto
global RAD2DEG

global mom_hm_direction
global mom_spindle_direction
global mom_cycle_number
global mom_cutcom_status

global mom_pos
global mom_out_angle_pos
global mom_tool_axis

global mom_cycle_rad

global mom_hm_diameter
global mom_hm_peck
global mom_hm_direction
global mom_hm_retract
global non_modal_cycle

if { $mom_spindle_direction == "CLW" && $mom_hm_direction == "1" } {
     set mom_cycle_number "3"
     set mom_cutcom_status LEFT
 } elseif { $mom_spindle_direction == "CLW" && $mom_hm_direction == "-1" } {
     set mom_cycle_number "2"
     set mom_cutcom_status RIGHT
 } elseif { $mom_spindle_direction == "CCLW" && $mom_hm_direction == "-1" } {
     set mom_cycle_number "3"
     set mom_cutcom_status LEFT
 } elseif { $mom_spindle_direction == "CCLW" && $mom_hm_direction == "1" } {
     set mom_cycle_number "2"
     set mom_cutcom_status RIGHT
 }

    if {[EQ_is_equal $mom_tool_axis(2) 0]} {
## X cycle
         MOM_force once V_delta W_delta G_cutcom G_motion F
         MOM_suppress once U_delta
    } else {
## Z cycle
         MOM_force once U_delta V_delta G_cutcom G_motion F
         MOM_suppress once W_delta
    } ; # X Z cycle

return 1
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

   if { [info exists mom_sys_abort_next_event] } {

      switch $mom_sys_abort_next_event {
        1 -
        2 {
           unset mom_sys_abort_next_event
           CATCH_WARNING "Event aborted!"

           MOM_abort_event
        }
        default {
           unset mom_sys_abort_next_event
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
proc PB_CMD_barfeeder_stop { } {
#=============================================================
### MOM_barfeeder_stop
global mom_barfeeder_stop_tool
###  OPTIONS "0. Не активна","1. Без упора","2. Упор в К.шпиндель","3. Упор в инструмент"
global mom_barfeeder_stop_move
global mom_barfeeder_stop_tool_number ; # TYPE s DEFVAL 1212.01 Инструмент(упор) Номер гнезда
global mom_barfeeder_pos_z ; # Инструмент (упор): Позиция Z в СК детали
global mom_barfeeder_pos_x ; # Инструмент (упор): Позиция X в СК детали
global barfeeder_active

if { $mom_barfeeder_stop_tool == "STOP" } {
     set s_ind 3
} elseif { $mom_barfeeder_stop_tool == "SUBSPINDLE" } {
     set s_ind 2
} elseif { $mom_barfeeder_stop_tool == "NONE" } {
     set s_ind 1
} else { set s_ind [string index $mom_barfeeder_stop_tool 0] }

if { $s_ind == 3 } {
### 3. Упор в инструмент
  MOM_output_literal "M901(SPIN 1 ACTIVE)"
  MOM_output_literal "M58(CHUCK 1 AIR BLAST)"
  MOM_output_literal "G28 U0.0"
  if {[info exist mom_barfeeder_stop_tool_number]} {
       MOM_output_literal "G28 W0.0"
       MOM_output_literal "M0 ( CHEK THE USED TOOL )"
       MOM_output_literal "T$mom_barfeeder_stop_tool_number"
       unset mom_barfeeder_stop_tool_number
     }
  MOM_output_literal "M68(NEW BLANK. CALL 9999)"

  if { [info exist mom_barfeeder_pos_z] && [info exist mom_barfeeder_pos_x] } {
       MOM_output_literal "G52.5"
       MOM_output_literal "G53.5"
       MOM_output_literal "G0 Z[format "%0.3f" $mom_barfeeder_pos_z](Z POSITION FOR BARFEEDER STOP)"
       MOM_output_literal "G0 X[format "%0.3f" $mom_barfeeder_pos_x](X POSITION FOR BARFEEDER STOP)"
  } else {
       MOM_output_literal "G53 G0 Z0.0(G53 - Z POSITION FOR BARFEEDER STOP)"
       MOM_output_literal "G53 G0 X0.0(G53 - X POSITION FOR BARFEEDER STOP)"
    }
  MOM_output_literal "M206(CHUCK 1 OPEN)"
  MOM_output_literal "M69(BARFEEDER ON)"
  if { [info exist mom_barfeeder_stop_move] && $mom_barfeeder_stop_move != 0.0 } {
       MOM_output_literal "G1 G98 W[format "%0.4f" $mom_barfeeder_stop_move] F100.0"
     }
  MOM_output_literal "M207(CHUCK 1 CLOSE)"
  MOM_output_literal "G0 W5.0"
  MOM_output_literal "G28 U0.0"
  set barfeeder_active 3
} elseif { $s_ind == 2 } {
###  2. Упор в К.шпиндель
  MOM_output_literal "M901(SPIN 1 ACTIVE)"
  MOM_output_literal "M58(CHUCK 1 AIR BLAST)"
  MOM_output_literal "G28 U0.0"
  MOM_output_literal "M68(NEW BLANK. CALL 9999)"
  MOM_output_literal "G53 G0 B0.0(G53 SPINDLE 2 POSITION FOR BARFEEDER STOP)"
  MOM_output_literal "M206(CHUCK 1 OPEN)"
  MOM_output_literal "M69(BARFEEDER ON)"
  MOM_output_literal "M207(CHUCK 1 CLOSE)"
  MOM_output_literal "G28 B0.0"
  set barfeeder_active 2
} elseif { $s_ind == 1 } {
###  1. Без упора
  MOM_output_literal "M901(SPIN 1 ACTIVE)"
  MOM_output_literal "M58(CHUCK 1 AIR BLAST)"
  MOM_output_literal "G28 U0.0"
  MOM_output_literal "M68(NEW BLANK. CALL 9999)"
  MOM_output_literal "M200"
  MOM_output_literal "G0 C300.0"
  MOM_output_literal "M202"
  MOM_output_literal "M206(CHUCK 1 OPEN)"
  MOM_output_literal "M69(BARFEEDER ON)"
  MOM_output_literal "M207(CHUCK 1 CLOSE)"
  set barfeeder_active 1
} else {
     set barfeeder_active 0
     return
}

}


#=============================================================
proc PB_CMD_before_motion { } {
#=============================================================
global mom_fanuc_mill_mode
# G12 / XC / XZ
global mom_pos mom_mcs_goto

if { ![info exist mom_fanuc_mill_mode] } { return }

if { $mom_fanuc_mill_mode == "G12" } {
  set mom_pos(0) [expr $mom_mcs_goto(0)*2.0]
  MOM_force once X Y
  return
} elseif { $mom_fanuc_mill_mode == "XY" } {
  MOM_force once X Y
} elseif { $mom_fanuc_mill_mode == "XC" } {
  PB_CMD_reload_ptp_pos
  return
}

}


#=============================================================
proc PB_CMD_before_output { } {
#=============================================================
# This command allows users to massage the NC code (mom_o_buffer) before
# it gets output.  If present in the post, this command is executed
# automatically by MOM_before_output.
#
# - DO NOT overload - MOM_before_output - All customization should be done here!
# - DO NOT call any MOM output commands in this command, it will become cyclicle!
# - DO NOT attach this command to any event marker!
#

   global mom_o_buffer
   global mom_sys_leader
   global mom_sys_control_out mom_sys_control_in
}


#=============================================================
proc PB_CMD_clamp_fifth_axis { } {
#=============================================================
global mom_fix_spindle
global mom_next_fix_spindle
global mom_fix_spindle_status
global mom_synchro_mode

set mom_fix_spindle_status ON
set fix_spindle_string ""

append fix_spindle_string "M$mom_fix_spindle($mom_fix_spindle_status)"
if { [info exist mom_synchro_mode] && $mom_synchro_mode == "ON" } {
      append fix_spindle_string " M$mom_next_fix_spindle($mom_fix_spindle_status)"
   }
MOM_output_literal $fix_spindle_string

}


#=============================================================
proc PB_CMD_clamp_fourth_axis { } {
#=============================================================
#  This command is used by auto clamping to output the code
#  needed to clamp the fourth axis.
#
#  --> Do NOT attach this command to any event marker!
#  --> Do NOT change the name of this command!
#
#   MOM_output_literal "M10"
}


#=============================================================
proc PB_CMD_cutcom_force { } {
#=============================================================
global mom_fanuc_mill_mode
global mom_tool_axis
global mom_sys_cutcom_code

set mom_sys_cutcom_code(LEFT)  "41"
set mom_sys_cutcom_code(RIGHT) "42"

if { $mom_fanuc_mill_mode == "G12" ||
          $mom_fanuc_mill_mode == "XY" } {
  MOM_force once X Y

  if { [format "%0.5f" $mom_tool_axis(2)] == "-1.0" } {
       set mom_sys_cutcom_code(LEFT)                 "42"
       set mom_sys_cutcom_code(RIGHT)                "41"
     }

} elseif { $mom_fanuc_mill_mode == "XZ" } {
  MOM_force once Y Z
}

}


#=============================================================
proc PB_CMD_cycle_helimill_data { } {
#=============================================================
global mom_bmg_peck
global mom_bmg_hole_diameter
global mom_bmg_direction

global mom_siemens_cycle_prad
global mom_siemens_cycle_mid
global mom_siemens_cycle_cdir

global mom_hm_diameter
global mom_hm_peck
global mom_hm_in_out
global mom_hm_direction
global mom_hm_retract

global mom_cycle_event_type
### mt_boremilling / hhain_hm / general_hm / pocket4

if { ![info exist mom_cycle_event_type] } { MOM_abort_event }

if { $mom_cycle_event_type == "pocket4" } {
###  Sinumerik data
   set mom_hm_diameter [expr $mom_siemens_cycle_prad * 2]
   set mom_hm_peck $mom_siemens_cycle_mid
   if { $mom_siemens_cycle_cdir == 2 } {
        set mom_hm_direction -1
      } else { set mom_hm_direction 1 }
   set mom_hm_retract FALSE

} elseif { $mom_cycle_event_type == "hhain_hm" } {
###   Hhain data
   set mom_hm_diameter $mom_bmg_hole_diameter
   set mom_hm_peck $mom_bmg_peck
   if { $mom_bmg_direction == "CLW" } {
        set mom_hm_direction -1
      } else { set mom_hm_direction 1 }
   set mom_hm_retract FALSE

} elseif { $mom_cycle_event_type == "general_hm" } {
###   new helimill
   if { $mom_hm_in_out != "HOLE" } { MOM_abort_event }
   if { $mom_hm_direction == "CLW" } {
        set mom_hm_direction -1
      } else { set mom_hm_direction 1 }
}

}


#=============================================================
proc PB_CMD_cycle_off { } {
#=============================================================
global non_modal_cycle
global mom_clamp_in_cycle

catch [unset mom_clamp_in_cycle]

if { [info exist non_modal_cycle] } {
   if { $non_modal_cycle == 2 } { MOM_output_literal "G67" }
   catch [unset non_modal_cycle]
   PB_CMD_unclamp_spindle
} else { MOM_output_literal "G80" }

}


#=============================================================
proc PB_CMD_cycle_off_user { } {
#=============================================================
global cycle_first
UI_UNSET cycle_first
MOM_output_literal "G80"
PB_CMD_fix_spindle_off
MOM_force once G_feed G_motion F
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
proc PB_CMD_drill_cycle_set { } {
#=============================================================
global mom_sys_cycle_reps_code
global mom_motion_event
global mom_tool_pitch
global feed mom_feed_rate_per_rev mom_cycle_step1 mom_cycle_delay
global mom_stop_before_hole
global mom_fanuc_mill_mode

global mom_user_cycle_clearance
global mom_cycle_rapid_to_pos mom_cycle_retract_to_pos mom_cycle_feed_to_pos
global mom_cycle_rapid_to mom_cycle_retract_to mom_cycle_feed_to
global mom_cycle_r
global mom_cycle_deep

global mom_cycle_taps_number
global mom_siemens_cycle_o_dam
global mom_cycle_step1
global cycle_first
global mom_cycle_step1

if { ![info exist mom_stop_before_hole] } {
set mom_stop_before_hole NO
}
if { $mom_stop_before_hole != "NO"} {
set mom_stop_before_hole ALL
}

if { ![info exist mom_cycle_delay] || $mom_cycle_delay == 0 } {
     MOM_disable_address cycle_dwell
 } else {
     MOM_enable_address cycle_dwell
}

if {[info exists mom_cycle_step1] && $mom_cycle_step1 != 0 } {
       MOM_force once cycle_step
} else { MOM_suppress once cycle_step }

###==================================
global mom_fix_spindle
global mom_next_fix_spindle
global mom_spindles_synchro_status
global mom_cycle_fix_spindle

if { [info exist mom_spindles_synchro_status] && $mom_spindles_synchro_status == "ON" } {
      set mom_cycle_fix_spindle "M$mom_fix_spindle(ON) M$mom_next_fix_spindle(ON)"
   } else {
      set mom_cycle_fix_spindle "M$mom_fix_spindle(ON)"
   }

if { ![info exist cycle_first] || $mom_fanuc_mill_mode == "XC"} { MOM_force once M_fix_cycle }
#set cycle_first 1

#MOM_force once
###==================================

if { $mom_fanuc_mill_mode == "XZ" } {

     set mom_cycle_deep [expr ($mom_cycle_feed_to - $mom_cycle_rapid_to)]
     set mom_cycle_r [expr $mom_user_cycle_clearance - $mom_cycle_rapid_to_pos(0)]

     if [string match "*drill*" $mom_motion_event] {
       set mom_sys_cycle_reps_code "87"
       MOM_do_template cycle_drill_x_dif

     } elseif [string match "*tap*" $mom_motion_event] {
       set mom_sys_cycle_reps_code "88.2"
       if { [info exist mom_tool_pitch] } {
            set feed $mom_tool_pitch
         } else { set feed $mom_feed_rate_per_rev }

       if { $mom_stop_before_hole == "ALL"} {
            MOM_output_literal "M00 ( OCHISTIT, SMAZAT )"
       }
         if {[info exist mom_cycle_step1]} { unset mom_cycle_step1 }

         if { [info exist mom_cycle_taps_number] && $mom_cycle_taps_number > 1 } {
            set mom_cycle_step1 [expr abs($mom_cycle_deep / $mom_cycle_taps_number)]
          } elseif { [info exist mom_siemens_cycle_o_dam] && $mom_siemens_cycle_o_dam > 0.0 } {
            set mom_cycle_step1 [expr abs($mom_siemens_cycle_o_dam)]
          }

       MOM_do_template cycle_tap_x_dif

     } elseif [string match "*bore*" $mom_motion_event] {
       set mom_sys_cycle_reps_code "89"
       MOM_do_template cycle_bore_x_dif
     }

} else {

     set mom_cycle_deep [expr $mom_cycle_feed_to_pos(2) - $mom_cycle_rapid_to_pos(2)]
     set mom_cycle_r [expr $mom_user_cycle_clearance - $mom_cycle_rapid_to_pos(2)]

     if [string match "*drill*" $mom_motion_event] {
       set mom_sys_cycle_reps_code "83"
       MOM_do_template cycle_drill_z_dif

     } elseif [string match "*tap*" $mom_motion_event] {

      set mom_sys_cycle_reps_code "84.2"
       if { [info exist mom_tool_pitch] } {
            set feed $mom_tool_pitch
         } else { set feed $mom_feed_rate_per_rev }

       if { $mom_stop_before_hole == "ALL"} {
            MOM_output_literal "M00 ( OCHISTIT, SMAZAT )"
          }
         if {[info exist mom_cycle_step1]} { unset mom_cycle_step1 }

         if { [info exist mom_cycle_taps_number] && $mom_cycle_taps_number > 1 } {
            set mom_cycle_step1 [expr abs($mom_cycle_deep / $mom_cycle_taps_number)]
          } elseif { [info exist mom_siemens_cycle_o_dam] && $mom_siemens_cycle_o_dam > 0.0 } {
            set mom_cycle_step1 [expr abs($mom_siemens_cycle_o_dam)]
          }
         if { [string match "*tap*" $mom_motion_event] } {
                    global cycle_spindle_direction
                    global mom_spindle_direction
                    global mom_tool_direction ; # 0-no 1-m3 2-m4
                if {[info exists mom_tool_direction] && $mom_tool_direction != 0} {
                       if { $mom_tool_direction == 2 } {
                             set cycle_spindle_direction CCLW
                       } else {
                             set cycle_spindle_direction CLW
                          }
                }
         }
       MOM_force once M_spindle
       MOM_do_template cycle_tap_z_dif

     } elseif [string match "*bore*" $mom_motion_event] {
       set mom_sys_cycle_reps_code "85"
       MOM_do_template cycle_bore_z_dif
     }
  }

}


#=============================================================
proc PB_CMD_drill_text { } {
#=============================================================
global mom_cycle_event_type

if { $mom_cycle_event_type == "mt_boremilling" ||
     $mom_cycle_event_type == "hhain_hm" ||
     $mom_cycle_event_type == "general_hm" ||
     $mom_cycle_event_type == "pocket4" } {

     MOM_heli_milling_move

} elseif { $mom_cycle_event_type == "hhain_tm" ||
           $mom_cycle_event_type == "general_tm" ||
           $mom_cycle_event_type == "cycle90" ||
           $mom_cycle_event_type == "mt_threadmilling" } {

    # MOM_tornado_mill_move

} elseif { $mom_cycle_event_type == "chamfer" } {

    # MOM_chamfer_move

} elseif { $mom_cycle_event_type == "nptf" } {

    # MOM_dryseal_thread_move
  }

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
proc PB_CMD_end_of_program { } {
#=============================================================
MOM_output_literal "G111"
MOM_output_literal "M901"

global mom_sum_time
    if {[info exists mom_sum_time]} {
          MOM_output_literal "( TIME : [format "%0.1f" $mom_sum_time] )"
       }

MOM_output_text "N99999 (EMERGENCY EXIT)"

global barfeeder_active
if { [info exist barfeeder_active] && $barfeeder_active != 0 } {
     MOM_output_literal "M99"
} else { MOM_output_literal "M30" }

   MOM_set_seq_off
   MOM_output_literal "%"
}


#=============================================================
proc PB_CMD_expressions { } {
#=============================================================
global part_mod
    if {![info exists part_mod] || $part_mod != "separator" } {
         # PAUSE "Не указан тип детали.\nSEPARATOR\n"
         return
       }

global mom_attr_OPER_type_
## drilling boremilling csink
    set types_ "drilling boremilling csink"
    if {![info exists mom_attr_OPER_type_ ] || ![string match "*$mom_attr_OPER_type_*" $types_ ] } {
           # set pause_ "Тип операции не указан в ее атрибутах.\n"
           # append pause_ "Работа с переменными невозможна.\n"
           # append pause_ "Укажите аттрибут операции. type_ =  drilling boremilling csink.\n"
           # PAUSE $pause_
           return
       }

global HOLE_center_rad
global HOLE_center_ang
global HOLE_diameter
global HOLE_number
global HOLE_faze
global PART_take_len

global mom_operation_name

    if {[catch {MOM_ask_ess_exp_value "r14"}] == 0 } {
            set HOLE_center_rad [expr double([MOM_ask_ess_exp_value "r14"])/2]
       }
    if {[catch {MOM_ask_ess_exp_value "r16"}] == 0 } {
            set HOLE_number [expr double([MOM_ask_ess_exp_value "r16"])]
       }

    set HOLE_center_ang [expr 360.0 / $HOLE_number]

    if {[catch {MOM_ask_ess_exp_value "r15"}] == 0 } {
           set HOLE_diameter [expr double([MOM_ask_ess_exp_value "r15"])]
       }
    if {[catch {MOM_ask_ess_exp_value "r17"}] == 0 } {
           set HOLE_faze [expr double([MOM_ask_ess_exp_value "r17"])]
       }
    if {[catch {MOM_ask_ess_exp_value "r19"}] == 0 } {
           set PART_take_len [expr double([MOM_ask_ess_exp_value "r19"])]
       }

global mom_output_file_directory
global mom_sys_mill_postname
global mom_load_event_handler
global mom_sys_mill_postname mom_sys_lathe_postname mom_sys_postname

     set script_ [file dirname $mom_sys_mill_postname]
     set tcl_file_ ${script_}\\${mom_sys_postname(SEPARATOR)}.tcl
     set def_file_ ${script_}\\${mom_sys_postname(SEPARATOR)}.def

     set mom_load_event_handler  $tcl_file_
     MOM_load_definition_file    $def_file_

#    set sub_file_ ${mom_output_file_directory}${tmp_count}_tmp.eia
#    set tcl_file_ ${script_}\\separator.tcl
#    set def_file_ ${script_}\\separator.def
#    MOM_post_oper_path $mom_operation_name $sub_file_ $tcl_file_ $def_file_
#    MOM_skip_handler_to_event PB_CMD_LABEL_to_skip

}


#=============================================================
proc PB_CMD_fifth_axis_rotate_move { } {
#=============================================================
#  This command is used by the ROTATE ude command to output a
#  fifth axis rotary move.  You can use the NC Data Definitions
#  section of postbuilder to modify the fifth_axis_rotary_move
#  block template.
#
#  --> Do NOT attach this command to any event marker!
#  --> Do NOT change the name of this command!
#
global mom_rotation_mode mom_rotation_angle
global mom_rotation_direction

  if { $mom_rotation_mode == "INCREMENTAL" } {

      if { $mom_rotation_direction == "CLW" } {
            set mom_rotation_angle [expr abs($mom_rotation_angle)]
      } else {
            set mom_rotation_angle [expr -abs($mom_rotation_angle)]
        }

         MOM_force once H_incremental
         MOM_do_template incr_fifth_axis_rotate

 } else {
   MOM_force once fifth_axis
   MOM_do_template fifth_axis_rotate_move
}


}


#=============================================================
proc PB_CMD_first_from { } {
#=============================================================
#set mom_kin_read_ahead_next_motion 1

return

global mom_from_tool_axis_status
global mom_motion_event
global mom_tool_axis mom_nxt_tool_axis
global mom_out_angle_pos mom_nxt_out_angle_pos
global mom_current_oper_is_last_oper_in_program

if { $mom_motion_event == "from_move" } {
    if {![info exist mom_from_tool_axis_status] || $mom_from_tool_axis_status != 1 } {
         VMOV 3 mom_nxt_tool_axis mom_tool_axis
         VMOV 2 mom_nxt_out_angle_pos mom_out_angle_pos
       }
   }
if { $mom_current_oper_is_last_oper_in_program == "YES" } { }

}


#=============================================================
proc PB_CMD_fix_RAPID_SET { } {
#=============================================================
# This command is provided to overwrite the system RAPID_SET
# in order to correct the problem with workplane change that
# doesn't account for +/- directions along X or Y principal axes.
# It also fixes the problem that the First Move was never
# identified to force the output of the 1st point.
#
# The original command has been renamed as ugpost_RAPID_SET.
#
# - This command may be attached to the "Start of Program" event marker.
#
#
# Revisions:
#-----------
# 02-18-08 gsl - Initial version
# 02-26-09 gsl - Used mom_kin_machine_type to derive machine mode when it's UNDEFINED.
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


#***********
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


   if { $mom_machine_mode != "MILL" && $mom_machine_mode != "DRILL" } {
     # When machine mode is UNDEFINED, ask machine type
      if { ![string match "MILL" [PB_CMD_ask_machine_type]] } {
return
      }
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

    #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    # User can temporarily disable the work plane change for rapid moves along non-principal
    # spindle axis even when work plane change has been set in the Rapid Move event.
    #
    # Work plane change, if set, will still be in effect for moves along principal axes.
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

} ;# RAPID_SET

} ;# uplevel
#***********
}


#=============================================================
proc PB_CMD_fix_spindle_off { } {
#=============================================================
global mom_fix_spindle
global mom_next_fix_spindle
global mom_fix_spindle_status
global mom_spindles_synchro_status

if { [info exist mom_fix_spindle_status] && $mom_fix_spindle_status == "OFF" } { return }

set mom_fix_spindle_status OFF
if { [info exist mom_spindles_synchro_status] && $mom_spindles_synchro_status == "ON" } {
      MOM_output_literal "M$mom_fix_spindle($mom_fix_spindle_status) M$mom_next_fix_spindle($mom_fix_spindle_status)"
   } else {
      MOM_output_literal "M$mom_fix_spindle($mom_fix_spindle_status)"
   }

}


#=============================================================
proc PB_CMD_fix_spindle_on { } {
#=============================================================
global mom_fix_spindle
global mom_next_fix_spindle
global mom_fix_spindle_status
global mom_spindles_synchro_status
# global AUTO_clamp_5th

if { [info exist mom_fix_spindle_status] && $mom_fix_spindle_status == "ON" } { return }

set mom_fix_spindle_status ON
if { [info exist mom_spindles_synchro_status] && $mom_spindles_synchro_status == "ON" } {
      MOM_output_literal "M$mom_fix_spindle($mom_fix_spindle_status) M$mom_next_fix_spindle($mom_fix_spindle_status)"
   } else {
      MOM_output_literal "M$mom_fix_spindle($mom_fix_spindle_status)"
   }

}


#=============================================================
proc PB_CMD_fourth_axis_rotate_move { } {
#=============================================================
#  This command is used by the ROTATE ude command to output a
#  fourth axis rotary move.  You can use the NC Data Definitions
#  section of postbuilder to modify the fourth_axis_rotary_move
#  block template.
#
#  --> Do NOT attach this command to any event marker!
#  --> Do NOT change the name of this command!
#

#   MOM_force once fourth_axis
#   MOM_do_template fourth_axis_rotate_move
}


#=============================================================
proc PB_CMD_goto_zero { } {
#=============================================================
global mom_shift_b_rotation_point
global mom_variable_b_rotation_point

MOM_output_literal "G28 U0.0 V0.0"

if { [info exist mom_variable_b_rotation_point] } {
     MOM_output_literal "G90 G53 G0 Z\#577"
} elseif { [info exist mom_shift_b_rotation_point] && $mom_shift_b_rotation_point != 0.0 } {
     MOM_output_literal "G90 G53 G0 Z[format "%0.3f" $mom_shift_b_rotation_point]"
} else {
     MOM_output_literal "G28 W0.0"
}

MOM_force once G_mode
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

  MOM_output_literal "M$mom_sync_code"
}


#=============================================================
proc PB_CMD_helimill_1 { } {
#=============================================================
global mom_cycle_rapid_to_pos
global mom_cycle_feed_to_pos
global mom_cycle_retract_to_pos

global mom_cycle_rapid_to
global mom_cycle_feed_to
global mom_cycle_retract_to

global mom_mcs_goto
global RAD2DEG

global mom_out_angle_pos
global mom_tool_axis

global mom_hm_diameter

     MOM_output_text "( BOREMILLING : D = [format "%0.3f" $mom_hm_diameter] )"

    if {![EQ_is_equal $mom_tool_axis(2) 0]} {
## Z cycle
         set mom_cycle_rapid_to_pos(0) [expr hypot($mom_mcs_goto(1),$mom_mcs_goto(0))]
         set mom_cycle_feed_to_pos(0) $mom_cycle_rapid_to_pos(0)
         set mom_cycle_retract_to_pos(0) $mom_cycle_rapid_to_pos(0)

         set mom_cycle_rapid_to_pos(1) 0
         set mom_cycle_feed_to_pos(1) 0
         set mom_cycle_retract_to_pos(1) 0

         set polar_ang  [expr atan2($mom_mcs_goto(1), $mom_mcs_goto(0)) * $RAD2DEG]
         if { $polar_ang < 0.0 } { set polar_ang [expr 360 + $polar_ang] }
         set mom_out_angle_pos(1) $polar_ang
    } ; # Z cycle

MOM_force once G_motion X Y Z fifth_axis

}


#=============================================================
proc PB_CMD_helimill_2 { } {
#=============================================================
global mom_hm_direction
global mom_spindle_direction
global mom_cycle_number
global mom_cutcom_status
global mom_tool_axis

if { $mom_spindle_direction == "CLW" && $mom_hm_direction == "1" } {
     set mom_cycle_number "3"
     set mom_cutcom_status LEFT
 } elseif { $mom_spindle_direction == "CLW" && $mom_hm_direction == "-1" } {
     set mom_cycle_number "2"
     set mom_cutcom_status RIGHT
 } elseif { $mom_spindle_direction == "CCLW" && $mom_hm_direction == "-1" } {
     set mom_cycle_number "3"
     set mom_cutcom_status LEFT
 } elseif { $mom_spindle_direction == "CCLW" && $mom_hm_direction == "1" } {
     set mom_cycle_number "2"
     set mom_cutcom_status RIGHT
 }

    if {[EQ_is_equal $mom_tool_axis(2) 0]} {
## X cycle
         MOM_force once Z Y G_cutcom G_motion F
         MOM_suppress once X
    } else {
## Z cycle
         MOM_force once X Y G_cutcom G_motion F
         MOM_suppress once Z
    } ; # X Z cycle

MOM_force once G_plane
}


#=============================================================
proc PB_CMD_helimill_3 { } {
#=============================================================
global mom_cycle_rapid_to_pos
global mom_cycle_feed_to_pos
global mom_cycle_retract_to_pos
global RAD2DEG
global mom_tool_axis
global mom_hm_peck mom_phelix

    if {[EQ_is_equal $mom_tool_axis(2) 0]} {
## X cycle
         set mom_phelix [expr abs($mom_cycle_rapid_to_pos(0) - $mom_cycle_feed_to_pos(0))/$mom_hm_peck]
         MOM_force once Y Z U_delta G_motion helics_step J K
         MOM_suppress once X I W_delta
    } else {
## Z cycle
         set mom_phelix [expr abs($mom_cycle_rapid_to_pos(2) - $mom_cycle_feed_to_pos(2))/$mom_hm_peck]
         MOM_force once X Y W_delta G_motion helics_step I J
         MOM_suppress once Z K U_delta
    } ; # X Z cycle
##

}


#=============================================================
proc PB_CMD_helimill_4 { } {
#=============================================================
global mom_hm_direction
global mom_spindle_direction
global mom_cycle_number
global mom_cutcom_status
global mom_tool_axis

     set mom_cutcom_status OFF

    if {[EQ_is_equal $mom_tool_axis(2) 0]} {
## X cycle
         MOM_force once Y Z G_cutcom G_motion
         MOM_suppress once X
    } else {
## Z cycle
         MOM_force once X Y G_cutcom G_motion F
         MOM_suppress once Z
    } ; # X Z cycle

}


#=============================================================
proc PB_CMD_helimill_5 { } {
#=============================================================
global mom_tool_axis

    if {[EQ_is_equal $mom_tool_axis(2) 0]} {
## X cycle
         MOM_force once X
         MOM_suppress once Z
    } else {
## Z cycle
         MOM_force once Z
         MOM_suppress once X
    } ; # X Z cycle

}


#=============================================================
proc PB_CMD_init_helix { } {
#=============================================================
uplevel #0 {
#
# This procedure will be executed automatically at the start of program and
# anytime it is loaded as a slave post of a linked post.
#
# This procedure can be used to enable your post to output helix.
# You can choose from the following options to format the circle
# block template to output the helix parameters.
#

# set mom_sys_helix_pitch_type    "rise_radian"

#
# The default setting for mom_sys_helix_pitch_type is "rise_radian".
# This is the most common.  Other choices are:
#
#    "rise_radian"              Measures the rise over one radian.
#    "rise_revolution"          Measures the rise over 360 degrees.
#    "none"                     Will suppress the output of pitch.
#    "other"                    Allows you to calculate the pitch
#                               using your own formula.
#
# This custom command uses the block template circular_move to output
# the helix block.  If your post uses a block template with a different
# name, you must edit the line that outputs the helix block.

#
#  The following variable deines the output mode for helical records.
#
#  FULL_CIRCLE  -- This mode will output a helix record for each 360
#                  degrees of the helix.
#  QUADRANT  --    This mode will output a helix record for each 90
#                  degrees of the helix.
#  LINEAR  --      This mode will output the entire helix as linear gotos.
#  END_POINT --    This mode will assume the control can define an entire
#                  helix in a single block.

#   set mom_sys_helix_pitch_type    "rise_revolution"
#   set mom_kin_helical_arc_output_mode END_POINT
#   MOM_reload_kinematics

#=============================================================
proc MOM_helix_move { } {
#=============================================================
global mom_pos mom_prev_pos
global mom_helix_pitch helix_step
global mom_fanuc_mill_mode
global mom_arc_radius mom_arc_angle

set helix_step [expr floor($mom_arc_angle/360.0)]
set angle [expr fmod($mom_arc_angle,360.0)]
if { $angle > 180.0 } { set mom_arc_radius [expr -1*$mom_arc_radius] }

MOM_before_motion
global mom_pos_arc_plane
if { $mom_pos_arc_plane == "XY" } {
     # MOM_force_block once helix_xy
     MOM_force once G_motion X Y Z I J helics_step
     MOM_do_template helix_xy
   } else {
     MOM_force_block once helix_yz
     MOM_do_template helix_yz
   }
} ;# MOM_helix_move
} ;# uplevel
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
if ![info exists mom_kin_spindle_axis] {
  set mom_kin_spindle_axis(0)                    0.0
  set mom_kin_spindle_axis(1)                    0.0
  set mom_kin_spindle_axis(2)                    1.0
}

set spindle_axis_defined 1
if ![info exists mom_sys_spindle_axis] {
  set spindle_axis_defined 0
} else {
  if ![array exists mom_sys_spindle_axis] {
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
proc PB_CMD_initial_from { } {
#=============================================================
return

global delay_from_move
global mom_pos saved_pos del_from_pos

if { [info exist delay_from_move] && $delay_from_move == "INIT" } {
       MOM_force once X Z G_motion G_mode
#       MOM_do_template from_move
       MOM_do_template from_z
       MOM_do_template from_x
       catch [unset delay_from_move]
   }

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

#  MOM_do_template linear_move
}


#=============================================================
proc PB_CMD_load_workpiece { } {
#=============================================================
### MOM_workpiece_load
global mom_spindle_number
#      DEFVAL "0.0000"

if { ![info exist mom_spindle_number] } { return }

if { $mom_spindle_number == 2 } {
  MOM_output_literal "M358(CHUCK 2 AIR BLAST)"
  MOM_output_literal "M306(CHUCK 2 OPEN)"
  MOM_output_literal "M0"
  MOM_output_literal "M307(CHUCK 2 CLOSE)"
} elseif { $mom_spindle_number == 1 } {
  MOM_output_literal "M58(CHUCK 1 AIR BLAST)"
  MOM_output_literal "M206(CHUCK 1 OPEN)"
  MOM_output_literal "G04 G98 P1000"
  MOM_output_literal "M69(BARFEEDER ON)"
  MOM_output_literal "G04 G98 P1000"
  MOM_output_literal "M207(CHUCK 1 CLOSE)"
}
catch [unset mom_spindle_number]

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
proc PB_CMD_mazak_machine_mode { } {
#=============================================================
uplevel #0 {

#=============================================================
proc PB_machine_mode { } {
#=============================================================
#
# DO NOT change any code in this procedure unless you know
# what you are doing.
#

   global mom_machine_mode
   global mom_sys_mill_postname
   global mom_sys_lathe_postname
   global mom_load_event_handler
   global mom_sys_current_head
   global mom_sys_head_change_init_program
   global mom_warning_info
   global mom_event_handler_file_name
   global mom_sys_postname

if { ![info exist mom_sys_current_head] } {
       set mom_sys_current_head '""
 }

set mom_sys_mill_postname $mom_sys_postname(MILL)
set mom_sys_lathe_postname $mom_sys_postname(TURN)

   if { $mom_machine_mode == "LATHE" } { set mom_machine_mode "TURN" }

   if { $mom_machine_mode == "MILL" } {

      if { $mom_sys_current_head == "TURN" } {
          if [llength [info commands PB_end_of_HEAD__TURN]] {
             PB_end_of_HEAD__TURN
          }
      }

      set mom_sys_current_head MILL

      set mom_load_event_handler  "$mom_sys_mill_postname.tcl"
      MOM_load_definition_file    "$mom_sys_mill_postname.def"

      if [llength [info commands PB_start_of_HEAD__MILL]] {
         PB_start_of_HEAD__MILL
      }

      set mom_sys_head_change_init_program 1

   } elseif { $mom_machine_mode == "TURN" } {

      if { $mom_sys_current_head == "MILL" } {
         if [llength [info commands PB_end_of_HEAD__MILL]] {
            PB_end_of_HEAD__MILL
         }
      }

      set mom_sys_current_head "TURN"
      set mom_sys_lathe_postname   "[file rootname [file tail $mom_sys_lathe_postname]]"

      global cam_post_dir
      if [file exists "${cam_post_dir}$mom_sys_lathe_postname.tcl"] {

         set mom_load_event_handler   "${cam_post_dir}$mom_sys_lathe_postname.tcl"
         MOM_load_definition_file     "${cam_post_dir}$mom_sys_lathe_postname.def"

      } else {

         set tcl_file "[file dirname $mom_sys_mill_postname]/$mom_sys_lathe_postname.tcl"
         set def_file "[file dirname $mom_sys_mill_postname]/$mom_sys_lathe_postname.def"

         if [file exists "$tcl_file"] {

            global tcl_platform

            if [string match "*windows*" $tcl_platform(platform)] {
               regsub -all {/} $tcl_file {\\} tcl_file
               regsub -all {/} $def_file {\\} def_file
            }

            set mom_load_event_handler   "$tcl_file"
            MOM_load_definition_file     "$def_file"

         } else {
            set mom_warning_info  "Lathe post $mom_sys_lathe_postname not found"
            MOM_catch_warning
         }
      }

      if [llength [info commands PB_CMD_kin_before_motion]] {
         rename PB_CMD_kin_before_motion ""
      }

      if [llength [info commands PB_start_of_HEAD__TURN]] {
         PB_start_of_HEAD__TURN
      }
   }

   rename MOM_start_of_program MOM_start_of_program_save
#   rename MOM_end_of_program   MOM_end_of_program_save
}
#=============================================================
proc MOM_head { } {
#=============================================================
}

#=============================================================
proc MOM_mazak_milling_head { } {
#=============================================================
#PB_CMD_milling_head
}
#=============================================================
} ;# uplevel
}


#=============================================================
proc PB_CMD_mill_mode_off { } {
#=============================================================
global mom_mill_mode_status
if { ![info exist mom_mill_mode_status] || $mom_mill_mode_status == "OFF" } { return }

global mom_mill_mode
global mom_cross_control
global mom_spindles_synchro_status
global mom_next_mill_mode

set mom_mill_mode_status OFF

if { [info exist mom_spindles_synchro_status] && $mom_spindles_synchro_status == "ON" } {
    MOM_output_literal "M$mom_mill_mode($mom_mill_mode_status) M$mom_next_mill_mode($mom_mill_mode_status)"
 } else {
    MOM_output_literal "M$mom_mill_mode($mom_mill_mode_status)"
 }

}


#=============================================================
proc PB_CMD_mill_mode_on { } {
#=============================================================
global mom_mill_mode_status
global mom_active_spindle
global mom_mill_mode
global mom_next_mill_mode
global mom_cross_control
global mom_spindles_synchro_status

MOM_output_literal "G122.1"
MOM_output_literal "M$mom_active_spindle"
MOM_output_literal $mom_cross_control

if { [info exist mom_mill_mode_status] && $mom_mill_mode_status == "ON" } { return }

set mom_mill_mode_status ON

if { [info exist mom_spindles_synchro_status] && $mom_spindles_synchro_status == "ON" } {
     MOM_output_literal "M$mom_mill_mode($mom_mill_mode_status) M$mom_next_mill_mode($mom_mill_mode_status)"
   } else {
     MOM_output_literal "M$mom_mill_mode($mom_mill_mode_status)"
   }

}


#=============================================================
proc PB_CMD_mill_path_end_1 { } {
#=============================================================
global mom_current_oper_is_last_oper_in_program
global mom_next_oper_has_tool_change
global mom_coolant_status
global mom_spindle_status
global mom_spindle_direction
global mom_oper_tool
global mom_operation_type

if { $mom_oper_tool == "NONE" ||
     [string match "*CONTROL*" [string toupper $mom_operation_type]] } {
     MOM_abort_event
   }

MILL_MODE_SET "OFF"

if { $mom_next_oper_has_tool_change != "YES" ||
     $mom_current_oper_is_last_oper_in_program != "YES" } {
    #  PB_CMD_skip9_on
       set mom_coolant_status OFF
       set mom_spindle_status OFF
       set mom_spindle_direction OFF
  }

}


#=============================================================
proc PB_CMD_mill_path_end_2 { } {
#=============================================================
global mom_current_oper_is_last_oper_in_program
global mom_next_oper_has_tool_change
global mom_machine_time
global mom_transmit_mode
global mom_spindle_reversed

UI_UNSET mom_transmit_mode
PB_CMD_fix_spindle_off
PB_CMD_mill_mode_off
UI_UNSET mom_spindle_reversed

if { $mom_current_oper_is_last_oper_in_program == "YES" } { PB_CMD_goto_zero }

MOM_output_literal "M01"

}


#=============================================================
proc PB_CMD_mill_path_start { } {
#=============================================================
global mom_operation_name

global mom_fixture_offset_value
global mom_oper_tool

if { $mom_oper_tool == "NONE" } {
  PB_CMD_goto_zero
}

if { ![info exist mom_fixture_offset_value] || $mom_fixture_offset_value == 0 } { set mom_fixture_offset_value 1 }
if { $mom_fixture_offset_value == 1 } {
     PB_CMD_set_main_spindle
} elseif { $mom_fixture_offset_value == 2 } {
     PB_CMD_set_sub_spindle
 } else { MOM_abort "WRONG OFFSET NUMBER" }

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
proc PB_CMD_offset { } {
#=============================================================
catch [PROC_OFFSET]

}


#=============================================================
proc PB_CMD_pause { } {
#=============================================================
  set cam_aux_dir  [MOM_ask_env_var UGII_CAM_AUXILIARY_DIR]

  if { [file exists ${cam_aux_dir}ugwish.exe] && [file exists ${cam_aux_dir}mom_pause.tcl] } {
    exec ${cam_aux_dir}ugwish.exe ${cam_aux_dir}mom_pause.tcl
  }
}


#=============================================================
proc PB_CMD_procs_and_vars { } {
#=============================================================
uplevel #0 {

set mom_1_chak_clamp_status  "UNDEF"
set mom_2_chak_clamp_status  "UNDEF"
set mom_1_chak_clamp(OPEN)   "206"
set mom_1_chak_clamp(CLOSE)  "207"
set mom_2_chak_clamp(OPEN)   "306"
set mom_2_chak_clamp(CLOSE)  "307"

set mom_kin_read_ahead_next_motion 1

#==========================================
proc MILL_MODE_SET { mode } {
#==========================================
global mom_fanuc_mill_mode
global mom_sys_leader

# PARAM transmit_mode
# OPTIONS "XY","XC","AUTO"

if { ![info exist mom_fanuc_mill_mode] } { set mom_fanuc_mill_mode "OFF" }

if { $mode == "G12" && ![string match "*G12*" $mom_fanuc_mill_mode] } {

       PB_CMD_reload_pos
       MOM_output_literal "G123.1"
       # MOM_force once G_mode G_motion G_feed Z
     MOM_force once Z
       MOM_do_template move_z
       MOM_output_literal "G00 G90 Y0.0"
       MOM_output_literal "G17 X[format "%0.3f" [expr 2.0*[PB_CMD_radius]]] C0.0"
       MOM_output_literal "G12.1"
       set mom_sys_leader(Y) $mom_sys_leader(fifth_axis)
       set mom_fanuc_mill_mode G12
       PB_CMD_kin_before_motion
       global mom_sys_helix_pitch_type
       global mom_kin_helical_arc_output_mode
       set mom_sys_helix_pitch_type    "rise_radian"
       set mom_kin_helical_arc_output_mode LINEAR
       MOM_reload_kinematics
       MOM_enable_address Y
       MOM_disable_address fifth_axis G_plane
       MOM_force once G_motion
       # MOM_force once G_motion X Y F G_mode

 } elseif { $mode == "XY" && ![string match "*XY*" $mom_fanuc_mill_mode] } {

       # MOM_force once G_mode G_motion G_feed Z
     MOM_force once Z
       MOM_do_template move_z
       set mom_sys_leader(Y) "Y"
       set mom_fanuc_mill_mode "XY"
       PB_CMD_kin_before_motion
       MOM_reload_kinematics
       MOM_enable_address G_plane fifth_axis Y
       # MOM_force once G_plane G_motion X Y fifth_axis F

 } elseif { $mode == "XC" && ![string match "*XC*" $mom_fanuc_mill_mode] } {

       # MOM_force once G_mode G_motion G_feed Z
     MOM_force once Z
       MOM_do_template move_z
       set mom_sys_leader(Y) "Y"
       set mom_fanuc_mill_mode "XC"
       PB_CMD_kin_before_motion
       MOM_reload_kinematics
       MOM_enable_address G_plane fifth_axis Y
       PB_CMD_reload_ptp_pos
       # MOM_force once G_motion G_plane X Y fifth_axis F

 } elseif { $mode == "XZ" && ![string match "*XZ*" $mom_fanuc_mill_mode] } {

       set mom_fanuc_mill_mode "XZ"
       set mom_sys_leader(Y) "Y"
       PB_CMD_kin_before_motion
       MOM_reload_kinematics
       MOM_enable_address G_plane Y fifth_axis
       # MOM_force once G_motion G_plane X Y fifth_axis F

 } elseif { $mode == "VARI" && ![string match "*VARI*" $mom_fanuc_mill_mode] } {

       set mom_fanuc_mill_mode "VARI"
       set mom_sys_leader(Y) "Y"
       PB_CMD_kin_before_motion
       MOM_reload_kinematics
       MOM_enable_address G_plane Y fifth_axis
       # MOM_force once G_motion X Y fifth_axis F

 } elseif { $mode == "OFF" && $mom_fanuc_mill_mode != "OFF" } {

     if { [string match "*G12*" $mom_fanuc_mill_mode] } {
         MOM_output_literal "G13.1"
         MOM_output_literal "G00 C0.0 Y0.0"
         MOM_enable_address fifth_axis
         set mom_sys_leader(Y)   "Y"
         MOM_reload_kinematics
         MOM_output_literal "G122.1"
       }

  set mom_fanuc_mill_mode OFF
  }
}

#=====================================
proc ZM_AXIS { } {
#=====================================
global mom_tool_axis
  if { [format "%0.7f" [expr abs($mom_tool_axis(2))]] == 1.0 } {
       return 1
   } else { return 0 }
}

#============================
proc MOM_tool_change_point { } {
#============================
global mom_shift_b_rotation_point
global mom_variable_b_rotation_point

if { [info exist mom_variable_b_rotation_point] } {
   if { [info exist mom_shift_b_rotation_point] && $mom_shift_b_rotation_point != 0.0 } {
     MOM_output_literal "\#577=[format "%0.1f" $mom_shift_b_rotation_point]"
   } else {
     MOM_output_literal "\#577=0.0"
   }
 }
}

#============================
proc MOM_spindles_synchronization { } {
#============================
global mom_synchro_way
global mom_spindles_synchro_status
global mom_subspin_on_take_pos

if { $mom_synchro_way == "ON" } {
     set mom_spindles_synchro_status ON
     set mom_subspin_on_take_pos HOLD
   } else { set mom_spindles_synchro_status OFF }
  UI_UNSET mom_synchro_way
}

#============================
proc MOM_subspindle_to_part { } {
#============================
 PB_CMD_subspindle_to_part
}

#============================
proc MOM_subspindle_move { } {
#============================
 PB_CMD_subspindle_move
}

#============================
proc MOM_subspindle_cutoff { } {
#============================
 PB_CMD_subspindle_cutoff
}

#============================
proc MOM_subspindle_gohome { } {
#============================
 PB_CMD_subspindle_gohome
}

#============================
proc MOM_takeover_end { } {
#============================
 PB_CMD_subspindle_gohome
}

#============================
proc CHACK_OPEN { mode } {
#============================
global mom_1_chak_clamp
global mom_1_chak_clamp_status
global mom_2_chak_clamp
global mom_2_chak_clamp_status

if { [string match "*1*" $mode] } {
  if { ![info exist mom_1_chak_clamp_status] ||
             $mom_1_chak_clamp_status != "OPEN" } {
      set mom_1_chak_clamp_status "OPEN"
      MOM_output_literal "M$mom_1_chak_clamp($mom_1_chak_clamp_status)(SPIN 1 OPEN)"
     }
  }
if { [string match "*2*" $mode] } {
  if { ![info exist mom_2_chak_clamp_status] ||
             $mom_2_chak_clamp_status != "OPEN" } {
      set mom_2_chak_clamp_status "OPEN"
      MOM_output_literal "M$mom_2_chak_clamp($mom_2_chak_clamp_status)(SPIN 2 OPEN)"
     }
  }
}

#============================
proc CHACK_CLOSE { mode } {
#============================
global mom_1_chak_clamp
global mom_1_chak_clamp_status
global mom_2_chak_clamp
global mom_2_chak_clamp_status

if { [string match "*1*" $mode] } {
  if { ![info exist mom_1_chak_clamp_status] ||
             $mom_1_chak_clamp_status != "CLOSE" } {
      set mom_1_chak_clamp_status "CLOSE"
      MOM_output_literal "M$mom_1_chak_clamp($mom_1_chak_clamp_status)(SPIN 1 CLOSE)"
     }
  }
if { [string match "*2*" $mode] } {
  if { ![info exist mom_2_chak_clamp_status] ||
             $mom_2_chak_clamp_status != "CLOSE" } {
      set mom_2_chak_clamp_status "CLOSE"
      MOM_output_literal "M$mom_2_chak_clamp($mom_2_chak_clamp_status)(SPIN 2 CLOSE)"
     }
  }
}

#============================
proc MOM_spindles_open { } {
#============================
global mom_spin1_open
global mom_spin2_open
if { [info exist mom_spin1_open] && $mom_spin1_open == "TRUE" } { CHACK_OPEN 1 }
if { [info exist mom_spin2_open] && $mom_spin2_open == "TRUE" } { CHACK_OPEN 2 }
}

#============================
proc PROC_OFFSET { } {
#============================
global mom_var511 saved_var511
global mom_operation_id last_oper_id
global mom_fixture_offset_value
global cutoff_offset

  if { [info exist mom_operation_id] && [info exist last_oper_id] && \
                                $mom_operation_id == $last_oper_id } { return }

  if { ![info exist mom_var511] } {
         set mom_var511 "0"
         MOM_output_literal "\#511=0"
     }

  if { $mom_var511 == "0" } {
         MOM_output_literal "G52.5"
        if {[info exists cutoff_offset] } {
             MOM_output_literal "G53.5 Z\[\#9101[format "%+0.3f" $cutoff_offset]\]"
        } else {
             MOM_output_literal "G53.5 Z\#9101"
          }
  } else {
         MOM_output_literal "G52.5"
        if {[info exists cutoff_offset] } {
             MOM_output_literal "G53.5 Z\[\#9101+\#511[format "%+0.3f" $cutoff_offset]\]"
        } else {
             MOM_output_literal "G53.5 Z\[\#9101+\#511\]"
          }
   }
  set last_oper_id $mom_operation_id
}

#============================
proc SYNCHRO_OFF { } {
#============================
global mom_synchro_mode
global mom_spindles_synchro_status

if { [info exist mom_spindles_synchro_status] && $mom_spindles_synchro_status == "OFF" } {
if { [info exist mom_synchro_mode] && $mom_synchro_mode == "ON" } {
     MOM_output_literal "M513"
     set mom_synchro_mode OFF
   }
  }
set mom_synchro_mode OFF
}

#============================
proc SYNCHRO_ON { } {
#============================
global mom_synchro_mode
global mom_synchro_command
global mom_spindles_synchro_status

if { [info exist mom_spindles_synchro_status] && $mom_spindles_synchro_status == "ON" } {
if { ![info exist mom_synchro_mode] || $mom_synchro_mode != "ON" } {
     MOM_output_literal "M$mom_synchro_command"
     set mom_synchro_mode ON
   }
  }
}

#============================

} ;# uplevel
}


#=============================================================
proc PB_CMD_prog_name_out { } {
#=============================================================
global mom_output_file_basename
global mom_part_name mom_date mom_logname
global PART_modification
global mom_var511

MOM_set_seq_off
set last_slash [expr [string last \\ $mom_part_name] + 1]
MOM_output_literal "<$mom_output_file_basename>([string range $mom_part_name $last_slash end])"
MOM_set_seq_on
MOM_output_text "( PROG NO - [string toupper $mom_output_file_basename]; MAZAK QTN 200MSY )"
MOM_output_text "( POST VERSION 16.02 )"
MOM_output_text "( $mom_date; autor - $mom_logname )"
MOM_output_text "( $mom_part_name )"
if {[info exists PART_modification]} {
     MOM_output_text "( Part Modification Is $PART_modification )"
}
   MOM_output_text "\#511=0.0"
MOM_output_literal "G53.5"
MOM_output_literal "G40 G90 G21"
MOM_output_literal "G123"

set mom_var511 "0"

}


#=============================================================
proc PB_CMD_radius { } {
#=============================================================
global mom_mcs_goto
return [expr hypot($mom_mcs_goto(0), $mom_mcs_goto(1))]

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
      if [info exists mom_csys_matrix] {
         if [llength [info commands MOM_validate_machine_model] ] {
            if { [MOM_validate_machine_model] == "TRUE" } {
               MOM_reload_iks_parameters "$custom_classification"
               MOM_reload_kinematics
            }
         }
      }
   }
}


#=============================================================
proc PB_CMD_reload_pos { } {
#=============================================================
global mom_sys_helix_pitch_type
global mom_kin_helical_arc_output_mode
set mom_sys_helix_pitch_type    "rise_revolution"
set mom_kin_helical_arc_output_mode END_POINT
 return


global mom_pos mom_mcs_goto mom_out_angle_pos

 set mom_pos(0) $mom_mcs_goto(0)
 set mom_pos(1) $mom_mcs_goto(1)
 set mom_pos(2) $mom_mcs_goto(2)
 set mom_pos(3) 0.0
 set mom_pos(4) 0.0
 set mom_out_angle_pos(0) 0.0
 set mom_out_angle_pos(1) 0.0

MOM_reload_variable -a mom_pos
MOM_reload_variable -a mom_out_angle_pos

global mom_sys_helix_pitch_type
global mom_kin_helical_arc_output_mode
set mom_sys_helix_pitch_type    "rise_revolution"
set mom_kin_helical_arc_output_mode END_POINT
#MOM_reload_kinematics

}


#=============================================================
proc PB_CMD_reload_ptp_pos { } {
#=============================================================
global mom_pos mom_mcs_goto
global mom_out_angle_pos
global polar_vec polar_vec_mag polar_vec_ang
global mom_cycle_rapid_to_pos mom_cycle_feed_to_pos mom_cycle_retract_to_pos
global RAD2DEG

if { [format "%0.4f" $mom_pos(0)] == 0.0 && [format "%0.4f" $mom_pos(1)] == 0.0 } {
    set mom_pos(0) 0.0
    set mom_pos(1) 0.0
    set mom_pos(2) $mom_mcs_goto(2)
    set mom_out_angle_pos(1) 0.0
    MOM_reload_variable -a mom_pos
    MOM_reload_variable -a mom_out_angle_pos
} else {
    set tmp_zero 0
    VEC3_init mom_mcs_goto(0) mom_mcs_goto(1) tmp_zero polar_vec
    set polar_vec_mag  [VEC3_mag polar_vec]
    set polar_vec_ang  [expr atan2($polar_vec(1), $polar_vec(0)) * $RAD2DEG]
    if { $polar_vec_ang < 0.0 } { set polar_vec_ang [expr 360 + $polar_vec_ang] }

    set mom_pos(0) $polar_vec_mag
    set mom_pos(1) 0.0
    set mom_pos(2) $mom_mcs_goto(2)
    set mom_out_angle_pos(1) $polar_vec_ang

    MOM_reload_variable -a mom_pos
    MOM_reload_variable -a mom_out_angle_pos
}

set mom_cycle_rapid_to_pos(0)   $mom_pos(0)
set mom_cycle_feed_to_pos(0)    $mom_pos(0)
set mom_cycle_retract_to_pos(0) $mom_pos(0)
set mom_cycle_rapid_to_pos(1)   0.0
set mom_cycle_feed_to_pos(1)    0.0
set mom_cycle_retract_to_pos(1) 0.0
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
#   MOM_suppress once X Y Z
#   MOM_do_template rapid_traverse
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
      unset mom_user_work_plane_change
      unset mom_user_spindle_first
   }
}


#=============================================================
proc PB_CMD_retract_move { } {
#=============================================================
#
#  This procedure is used by rotary axis retract to move away from
#  the part.  This move is a three axis move along the tool axis at
#  a retract feedrate.
#
#  You can modify the this procedure to customize the retract move.
#  If you need a custom command to be output with this block,
#  you must place a call to the custom command either before or after
#  the MOM_do_template command.
#
#  If you need to modify the x,y or z locations you will need to do the
#  following.  (without the #)
#
#  global mom_pos
#  set mom_pos(0) 1.0
#  set mom_pos(1) 2.0
#  set mom_pos(2) 3.0

#   MOM_do_template linear_move
}


#=============================================================
proc PB_CMD_reverse_rotation_vector { } {
#=============================================================
# This command fixes the vectors of rotary axes.
# It will be executed automatically when present in the post.
#
# --> Do not attach this command to any event marker!
#

   global mom_kin_iks_usage
   global mom_csys_matrix

   set reverse_vector 0

   if { [info exists mom_kin_iks_usage] && $mom_kin_iks_usage == 1 } {
      if { [info exists mom_csys_matrix] } {
         if { [llength [info commands MOM_validate_machine_model] ] } {
            if { ![string compare "TRUE" [MOM_validate_machine_model]] } {
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
proc PB_CMD_reversed_block { } {
#=============================================================
global mom_spindle_reversed ; # "FALSE" "Реверсный приводной блок"
global mom_spindle_direction
global mom_tool_direction ; # 0-no 1-m3 2-m4

if { [info exist mom_tool_direction] && $mom_tool_direction == 2 } {
          set direction_ CCLW
} elseif { [info exist mom_tool_direction] && $mom_tool_direction == 1 } {
          set direction_ CLW
} else {
          set direction_ NONE
  }

if { [info exist mom_spindle_reversed] && $mom_spindle_reversed == "TRUE" } {
        if { $direction_ == "CLW" } {
               set direction_ CCLW
        } elseif { $direction_ == "CCLW" } {
               set direction_ CLW
           }
}

MOM_output_literal "DIRECTION = $mom_spindle_direction"
return


if { [info exist mom_tool_direction] && $mom_tool_direction != 0 } {
     if { $mom_tool_direction == 2 } {
          set mom_spindle_direction CCLW
     } else { set mom_spindle_direction CLW }
}

if { [info exist mom_spindle_reversed] && $mom_spindle_reversed == "TRUE" } {
  if { $mom_spindle_direction == "CLW" } {
       set mom_spindle_direction CCLW
  } elseif { $mom_spindle_direction == "CCLW" } {
       set mom_spindle_direction CLW
      }
}

# set mom_spindle_direction $mom_spindle_auto_direction


###==================================================================
return

global mom_spindle_reversed
###      DEFVAL "FALSE"
###      UI_LABEL "Реверсный приводной блок"

global mom_spindle_direction
global mom_spindle_auto_direction
global mom_tool_direction

if { [info exist mom_tool_direction] && $mom_tool_direction != 0 } {
     if { $mom_tool_direction == 2 } {
          set mom_spindle_direction CCLW
     } else { set mom_spindle_direction CLW }
}

if { ![info exist mom_spindle_auto_direction] } {
  if { ![info exist mom_spindle_reversed] || $mom_spindle_reversed != "TRUE" } { return }
  if { $mom_spindle_direction == "CLW" } {
      set mom_spindle_direction CCLW
   } elseif { $mom_spindle_direction == "CCLW" } {
      set mom_spindle_direction CLW
     }
  return
}

if { [info exist mom_spindle_reversed] && $mom_spindle_reversed == "TRUE" } {
  if { $mom_spindle_auto_direction == "CLW" } {
       set mom_spindle_direction CCLW
     } elseif { $mom_spindle_auto_direction == "CCLW" } {
       set mom_spindle_direction CLW
      }
  return
}

set mom_spindle_direction $mom_spindle_auto_direction

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


  if ![string match  "5_axis_dual_head"  $mom_kin_machine_type] {
return
  }


  set var_list { ang_offset center_offset(0) center_offset(1) center_offset(2) direction incr_switch leader limit_action max_limit min_incr min_limit plane rotation zero }

  foreach var $var_list {
    # Global declaration
    if [string match "center_offset*" $var] {
      global mom_kin_4th_axis_center_offset mom_kin_5th_axis_center_offset
    } else {
      global mom_kin_4th_axis_[set var] mom_kin_5th_axis_[set var]
    }

    # Swap values
    set kin_var mom_kin_4th_axis_[set var]
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
  if [llength [info commands PB_swap_dual_head_elements] ] {
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
proc PB_CMD_rpm_change { } {
#=============================================================
#PB_CMD_reversed_block

PB_CMD_RPM_set

MOM_force_block once spindle_speed
MOM_do_template spindle_speed
}


#=============================================================
proc PB_CMD_save_z_clearance { } {
#=============================================================
global user_tool_axis_type
global mom_user_cycle_clearance
global mom_pos
global mom_fanuc_mill_mode

if { $user_tool_axis_type == "PTP" } {
    if { $mom_fanuc_mill_mode == "XC" ||
              $mom_fanuc_mill_mode == "XY" } {
        set mom_user_cycle_clearance $mom_pos(2)
       } elseif { $mom_fanuc_mill_mode == "XZ" } {
        set mom_user_cycle_clearance $mom_pos(0)
       }
}
}


#=============================================================
proc PB_CMD_set_C_trans { } {
#=============================================================
global mom_rot_c_active ; # TYPE b
global mom_rot_c_to_point mom_rot_c_to_point_pos ; # TYPE p
global RAD2DEG PI
global mom_pos mom_mcs_goto
global mom_out_angle_pos

global mom_prev_rot_ang_5th
global mom_rotary_delta_5th

if { [info exist mom_rot_c_active] && $mom_rot_c_active == "TRUE" } {
    set c_angle [expr atan2($mom_rot_c_to_point(1), $mom_rot_c_to_point(0))]
    if { $c_angle < 0.0 } { set c_angle [expr $c_angle+$PI*2] }
    set c_cos [expr cos($c_angle)]
    set c_sin [expr sin($c_angle)]
    set mom_out_angle_pos(1) [expr $c_angle*$RAD2DEG]
    if {[format "%0.6f" $mom_out_angle_pos(1)] == 360.0 } { set mom_out_angle_pos(1) 0 }
    set mom_pos(4)  $mom_out_angle_pos(1)
    set mom_pos(0) [expr $mom_mcs_goto(0)*$c_cos+$mom_mcs_goto(1)*$c_sin]
    set mom_pos(1) [expr $mom_mcs_goto(0)*(-$c_sin)+$mom_mcs_goto(1)*$c_cos]
    set mom_pos(2) $mom_mcs_goto(2)

    MOM_reload_variable -a mom_pos
    MOM_reload_variable -a mom_out_angle_pos
    MOM_reload_kinematics
}

set mom_rotary_delta_5th 0

}


#=============================================================
proc PB_CMD_set_M0 { } {
#=============================================================
global M00
set M00 1
}


#=============================================================
proc PB_CMD_set_M01 { } {
#=============================================================
global M01
set M01 1
}


#=============================================================
proc PB_CMD_set_circular_move { } {
#=============================================================
global mom_fanuc_mill_mode
# G12 / XC / XZ

if { $mom_fanuc_mill_mode == "G12" ||
        $mom_fanuc_mill_mode == "XY" } {
  MOM_force once G_motion X Y R
  MOM_suppress once Z
} elseif { $mom_fanuc_mill_mode == "XZ" } {
  MOM_force once G_motion Z Y R
  MOM_suppress once X
}

}


#=============================================================
proc PB_CMD_set_csys { } {
#=============================================================
return

### Set G53.5 MAZATROL MCS
global mom_fixture_offset_value
global mom_g_offset_out
global mom_takeover_shift ; # AUTO / MANUAL / PULL
global mom_new_set_offset
global mom_var511

if { [info exist mom_fixture_offset_value] && $mom_fixture_offset_value == 2 } {
  if { [info exist mom_new_set_offset] } {
        MOM_output_text $mom_new_set_offset
        catch [unset mom_new_set_offset]
        set mom_g_offset_out 2
        return
     }
}

}


#=============================================================
proc PB_CMD_set_cycle_plane { } {
#=============================================================
#
# Use this command to determine and output proper plane code
# when G17/18/19 is used in the cycle definition.
#


 #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 # Next option can be set to 1, if the address of cycle's
 # principal axis needs to be suppressed. (Ex. siemens controller)
 #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  set suppress_principal_axis 0


 #++++++++++++++++++++++++++++++++++++++++++++++++++++++
 # Next option can be set to 1, if the plane code needs
 # to be forced out @ the start of every set of cycles.
 #++++++++++++++++++++++++++++++++++++++++++++++++++++++
  set force_plane_code 0


  global mom_kin_machine_type
  global mom_kin_4th_axis_type mom_kin_4th_axis_plane
  global mom_kin_5th_axis_type
  global mom_tool_axis mom_sys_spindle_axis mom_kin_spindle_axis
  global mom_pos
  global mom_cycle_spindle_axis mom_cutcom_plane mom_pos_arc_plane


 # Default cycle spindle axis to Z
  set mom_cycle_spindle_axis 2


  if { ![string match "*3_axis_mill*" $mom_kin_machine_type] } {

    if { $mom_kin_4th_axis_type == "Head" } {

      if [EQ_is_equal [expr abs($mom_tool_axis(0))] 1.0] {
        set mom_cycle_spindle_axis 0
      }

      if [EQ_is_equal [expr abs($mom_tool_axis(1))] 1.0] {
        set mom_cycle_spindle_axis 1
      }

      if { $mom_kin_5th_axis_type == "Table" } {

        if [EQ_is_equal [expr abs($mom_pos(3))] 90.0] {

          switch $mom_kin_4th_axis_plane {
            "YZ" {
              set mom_cycle_spindle_axis 1
            }
            "ZX" {
              set mom_cycle_spindle_axis 0
            }
          }
        }
      }
    }
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

#MOM_output_literal "$mom_kin_4th_axis_type"
#MOM_output_literal "SET PLANE"


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
proc PB_CMD_set_delay { } {
#=============================================================
global mom_delay_mode mom_delay_revs mom_delay_value

if { [string match "*REVOLUTIONS*" $mom_delay_mode] } {
  MOM_force_block once delay_rev
  MOM_do_template delay_rev
} elseif { [string match "*SECONDS*" $mom_delay_mode] } {
  MOM_force_block once delay_sec
  MOM_do_template delay_sec
}
MOM_force once G_feed
}


#=============================================================
proc PB_CMD_set_main_spindle { } {
#=============================================================
#  This custom command is used to set codes for main spindle

global mom_mill_mode
global mom_fix_spindle
global mom_work_spindle
global mom_active_spindle
global mom_sys_leader

global mom_synchro_command
set mom_synchro_command    "511"

global mom_cross_control
set mom_cross_control    "G111"

#set mom_sys_leader(fifth_axis) "C1"
set mom_sys_leader(fifth_axis) "C"

set mom_mill_mode(ON)      "200"
set mom_mill_mode(OFF)     "202"
set mom_fix_spindle(ON)    "210"
set mom_fix_spindle(OFF)   "212"
set mom_work_spindle       "1"
set mom_active_spindle     "901"

global mom_next_mill_mode
global mom_next_fix_spindle
global mom_next_active_spindle

set mom_next_mill_mode(ON)      "300"
set mom_next_mill_mode(OFF)     "302"
set mom_next_fix_spindle(ON)    "310"
set mom_next_fix_spindle(OFF)   "312"
set mom_next_active_spindle     "902"

MOM_reload_kinematics

}


#=============================================================
proc PB_CMD_set_operation_time { } {
#=============================================================
global mom_machine_time mom_oper_time mom_sum_time
global mom_toolpath_cutting_time
global mom_oper_tool mom_operation_type

if { $mom_oper_tool == "NONE" ||
     [string match "*CONTROL*" [string toupper $mom_operation_type]] } {
     return }

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
proc PB_CMD_set_spindle_auto_direction { } {
#=============================================================
global mom_spindle_auto_direction
global mom_tool_direction
### 0 - no / 1 - CLW / 2 - CCLW

if { [info exist mom_tool_direction] && $mom_tool_direction == 1 } {
       set mom_spindle_auto_direction CLW
} elseif { [info exist mom_tool_direction] && $mom_tool_direction == 2 } {
       set mom_spindle_auto_direction CCLW
} else { UI_UNSET mom_spindle_auto_direction  }

}


#=============================================================
proc PB_CMD_set_sub_spindle { } {
#=============================================================
#  This custom command is used to set codes for sub spindle

global mom_mill_mode
global mom_fix_spindle
global mom_work_spindle
global mom_active_spindle
global mom_sys_leader

global mom_synchro_command
set mom_synchro_command    "512"

global mom_cross_control
set mom_cross_control    "G110 C2"

set mom_sys_leader(fifth_axis) "C"

set mom_mill_mode(ON)      "300"
set mom_mill_mode(OFF)     "302"
set mom_fix_spindle(ON)    "310"
set mom_fix_spindle(OFF)   "312"
set mom_work_spindle       "2"
set mom_active_spindle     "902"

global mom_next_mill_mode
global mom_next_fix_spindle
global mom_next_active_spindle

set mom_next_mill_mode(ON)      "200"
set mom_next_mill_mode(OFF)     "202"
set mom_next_fix_spindle(ON)    "210"
set mom_next_fix_spindle(OFF)   "212"
set mom_next_active_spindle     "901"

MOM_reload_kinematics

}


#=============================================================
proc PB_CMD_skip9_off { } {
#=============================================================
MOM_set_line_leader off  "/9"

}


#=============================================================
proc PB_CMD_skip9_on { } {
#=============================================================
MOM_set_line_leader always  "/9"

}


#=============================================================
proc PB_CMD_spindle_clamp { } {
#=============================================================
global AUTO_clamp_5th ; # ON OFF
global mom_rotary_delta_5th

if {[info exists AUTO_clamp_5th] && $AUTO_clamp_5th == "ON" } {
         PB_CMD_fix_spindle_on
}

}


#=============================================================
proc PB_CMD_spindle_rotate { } {
#=============================================================
global mom_out_angle_pos

PB_CMD_fix_spindle_off

MOM_output_literal "G0 C[format "%0.3f" $mom_out_angle_pos(1)]"

}


#=============================================================
proc PB_CMD_spindle_unclamp { } {
#=============================================================
global mom_fanuc_mill_mode
global mom_rotary_delta_5th
global user_tool_axis_type
global AUTO_clamp_5th ; # ON OFF

if { ![info exist mom_fanuc_mill_mode] } { return }
if { $user_tool_axis_type == "PTP" } { return }

if { ![info exist mom_rotary_delta_5th] ||
      [format "%0.5f" $mom_rotary_delta_5th] == 0.0 } { return }

  PB_CMD_fix_spindle_off

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
proc PB_CMD_start_of_operation_force_addresses { } {
#=============================================================
MOM_force once S M_spindle X Y Z fifth_axis F G_mode G_motion G_feed

}


#=============================================================
proc PB_CMD_subprogram_end { } {
#=============================================================
global ptp_file_name
global mom_sub_file_name
global mom_sys_ptp_output
global mom_sub_counter
global mom_saved_sequence_number

  if { ![info exist mom_sub_file_name] } { return }

  MOM_output_literal "M01"
  MOM_output_literal "M99"
  MOM_close_output_file $mom_sub_file_name
  MOM_open_output_file $ptp_file_name
  catch [unset mom_sub_file_name]
  set mom_sys_ptp_output ON
  MOM_reset_sequence $mom_saved_sequence_number 1 1
}


#=============================================================
proc PB_CMD_subprogram_start { } {
#=============================================================
global mom_head_name
global mom_output_file_basename
global mom_output_file_directory
global ptp_file_name mom_sys_ptp_output
global mom_sub_file_name
global mom_sub_counter
global mom_seqnum mom_saved_sequence_number
global mom_group_name
global mom_subprogram_group
global mom_subprogram_start

if { ![info exist mom_group_name] } { return }
if { [info exist mom_head_name] && $mom_head_name == "sub_start" } {
      catch [unset $mom_head_name]
      set mom_subprogram_start TRUE
}
if { [info exist mom_subprogram_start] && $mom_subprogram_start == "TRUE" } {
  if { ![info exist mom_sub_counter] } { set mom_sub_counter 1 }

  set mom_sub_file_name "${mom_output_file_directory}${mom_output_file_basename}_sub${mom_sub_counter}.eia"

  if { [file exists $mom_sub_file_name] } { MOM_remove_file $mom_sub_file_name }

  MOM_output_literal "M98 <${mom_output_file_basename}_sub${mom_sub_counter}>"
  set mom_saved_sequence_number $mom_seqnum
  MOM_set_seq_off

  MOM_close_output_file $ptp_file_name
  MOM_open_output_file $mom_sub_file_name
  set mom_sys_ptp_output OFF

  global mom_date mom_logname mom_part_name
  MOM_output_text "<${mom_output_file_basename}_sub${mom_sub_counter}>"
  MOM_output_text "( MAZAK QTN200MSY )"
  MOM_output_text "( $mom_date; autor - $mom_logname )"
  MOM_set_seq_on
  MOM_reset_sequence 1 1 1
  MOM_output_literal "G40 G90 G21"
  MOM_output_literal "G123"
  incr mom_sub_counter
  catch [unset mom_subprogram_start]
  set mom_subprogram_group $mom_group_name
}
}


#=============================================================
proc PB_CMD_subspindle_cutoff { } {
#=============================================================
### EVENT subspindle_cutoff
global mom_sys_ptp_output
    if {$mom_sys_ptp_output == "OFF" } { return }

global mom_subspin_on_take_pos
global mom_machine_mode

if { $mom_machine_mode != "TURN" } { return }

    if {[info exists mom_subspin_on_take_pos] && $mom_subspin_on_take_pos == "HOLD" } {
         SYNCHRO_ON
         MOM_output_literal "M724(CUT OFF MODE ON)"
         set mom_subspin_on_take_pos CUTOFF
    }

}


#=============================================================
proc PB_CMD_subspindle_gohome { } {
#=============================================================
global mom_sys_ptp_output
    if {$mom_sys_ptp_output == "OFF" } { return }

### Subspindle Go Home
global mom_spindles_synchro_status
global mom_synchro_mode
global mom_subspin_on_take_pos
global mom_var511

global mom_spin1_open
global mom_spin2_open
global mom_subspin_shift_mcs
global mom_subspin_breake_part
global mom_subspin_pull_out
global mom_part_length
global mom_machine_mode
global mom_spindle_direction mom_coolant_status

if { ![info exist mom_subspin_on_take_pos] } {return }

MOM_output_text "(SPIN 2 GO HOME)"

if { [info exist mom_part_length] && $mom_part_length > 0.0 } {
     MOM_output_text "\#502=[format "%0.4f" $mom_part_length](TOTAL PART LENGTH)"
   }
if { [info exist mom_subspin_pull_out] && $mom_subspin_pull_out != 0.0 } {
     MOM_output_text "\#112=[format "%0.4f" $mom_subspin_pull_out](PULL OUT PART)"
   }
if { [info exist mom_subspin_on_take_pos] && $mom_subspin_on_take_pos == "CUTOFF" } {
     MOM_output_literal "M725(CUTOFF MODE OFF)"
   }

if { $mom_machine_mode == "TURN"  && $mom_spindle_direction != "OFF" } {
     set mom_spindle_direction OFF
     MOM_output_literal "M05 M305"
   } else { PB_CMD_fix_spindle_off }
if { $mom_coolant_status != "OFF" } {
     set mom_coolant_status OFF
     MOM_output_literal "M9"
   }
set mom_spindles_synchro_status OFF
SYNCHRO_OFF

if { [info exist mom_subspin_breake_part] && $mom_subspin_breake_part == "TRUE" } {
  MOM_output_literal "M200(SPIN 1 MILL MODE)"
  MOM_output_literal "M300(SPIN 2 MILL MODE)"
  if { [info exist mom_subspin_pull_out] && $mom_subspin_pull_out != 0.0 } {
       MOM_output_literal "M206(SPIN 1 OPEN)"
       MOM_output_literal "M542(TRANSFER MODE ON)"
       MOM_output_literal "G53 G1 G98 B\[\#5025+\#112\] F500.0(PULL OUT PART)"
       MOM_output_literal "M207(SPIN 1 CLOSE)"
       MOM_output_literal "M543(TRANSFER MODE OFF)"
       set mom_var511 "\#511+\#112(DATUM SHIFT ALONG Z)"
       MOM_output_text "\#511=$mom_var511"
     }
  MOM_output_literal "G110 C2(C = C2)"
  MOM_output_literal "G1 G98 H30.0 F200.0"
  MOM_output_literal "G1 G98 H330.0 F2000.0(BREACk OFF C2-1TURN)"
  MOM_output_literal "M202(SPIN 1 TURN MODE)"
  MOM_output_literal "G111(C = C1)"
  MOM_output_literal "M302(SPIN 2 TURN MODE)"

} elseif { [info exist mom_subspin_pull_out] && $mom_subspin_pull_out != 0.0 } {
       MOM_output_literal "M200(SPIN 1 MILL MODE)"
       MOM_output_literal "M300(SPIN 2 MILL MODE)"
       MOM_output_literal "M206(SPIN 1 OPEN)"
       MOM_output_literal "M542(TRANSFER MODE ON)"
       MOM_output_literal "G53 G1 G98 B\[\#5025+\#112\] F500.0(PULL OUT PART)"
       MOM_output_literal "M207(SPIN 1 CLOSE)"
       MOM_output_literal "M543(TRANSFER MODE OFF)"
       set mom_var511 "\#511+\#112(SHIFT Z)"
       MOM_output_text "\#511=$mom_var511"
}

if { [info exist mom_subspin_shift_mcs] && $mom_subspin_shift_mcs == "TRUE" } {
     if { [info exist mom_part_length] && $mom_part_length > 0.0 } {
          set mom_var511 "\#511+ABS\[\#5025\]-\#502(DATUM SHIFT ALONG Z)"
        } else {
          set mom_var511 "\#511+ABS\[\#5025\](DATUM SHIFT ALONG Z)"
        }
     MOM_output_text "\#511=$mom_var511"
   }

MOM_output_literal "M202 M302(SPIN 1 2 TURN MODE)"

if { [info exist mom_spin1_open] && $mom_spin1_open == "TRUE" } {
     MOM_output_literal "M206(SPIN 1 OPEN)"
   }

if { [info exist mom_spin2_open] && $mom_spin2_open == "TRUE" } {
     MOM_output_literal "M306(SPIN 2 OPEN)"
   }

UI_UNSET mom_subspin_on_take_pos
   MOM_output_literal "M513"
MOM_output_literal "G28 B0.0(SPIN 2 GO HOME)"
MOM_output_literal "M58(SPIN 1 AIR BLAST)"
MOM_output_literal "M358(SPIN 2 AIR BLAST)"
MOM_force once G_mode G_motion G_feed

}


#=============================================================
proc PB_CMD_subspindle_move { } {
#=============================================================
###   POST_EVENT "subspindle_move"
global mom_sys_ptp_output
    if {$mom_sys_ptp_output == "OFF" } { return }

global mom_pull_free_1
global mom_pull_detal_1
global mom_pull_free_2
global mom_pull_detal_2

global mom_subspin_on_take_pos
global mom_spindles_synchro_status
global mom_var511
global mom_machine_mode
global mom_spindle_direction mom_coolant_status

if { ([info exist mom_pull_free_1] && $mom_pull_free_1 != 0.0) ||
     ([info exist mom_pull_detal_1] && $mom_pull_detal_1 != 0.0) ||
     ([info exist mom_pull_free_2] && $mom_pull_free_2 != 0.0) ||
     ([info exist mom_pull_detal_2] && $mom_pull_detal_2 != 0.0) } {

set shift_mcs 0.0

MOM_output_text "(SPIN 2 PULL OUT PART)"
if { $mom_machine_mode == "TURN"  && $mom_spindle_direction != "OFF" } {
     set mom_spindle_direction OFF
     MOM_output_literal "M05 M305"
   } else { PB_CMD_fix_spindle_off }
if { $mom_coolant_status != "OFF" } {
     set mom_coolant_status OFF
     MOM_output_literal "M9"
   }

set mom_spindles_synchro_status OFF
SYNCHRO_OFF
MOM_output_literal "G28 U0.0(X GO HOME)"
MOM_output_literal "M200(SPIN 1 MILL MODE)"
MOM_output_literal "M300(SPIN 2 MILL MODE)"

if { [info exist mom_pull_free_1] && $mom_pull_free_1 != 0.0 } {
     MOM_output_literal "M306(SPIN 2 OPEN)"
#     MOM_output_literal "M358(SPIN 2 AIR BLAST)"
     MOM_output_literal "G53 G1 G98 B\[\#5025+\[[format "%0.4f" $mom_pull_free_1]\]\] F500.0(SPIN 2 MOVE)"
     MOM_output_literal "M307(SPIN 2 CLOSE)"
     MOM_output_literal "G04 G98 P1000(PAUSE)"
   }
if { [info exist mom_pull_detal_1] && $mom_pull_detal_1 != 0.0 } {
     MOM_output_literal "M206(SPIN 1 OPEN)"
#     MOM_output_literal "M58(SPIN 1 AIR BLAST)"
     MOM_output_literal "M542(TRANSFER MODE ON)"
     MOM_output_literal "G53 G1 G98 B\[\#5025+\[[format "%0.4f" $mom_pull_detal_1]\]\] F500.0(PART MOVE)"
     MOM_output_literal "M207(SPIN 1 CLOSE)"
     MOM_output_literal "M543(TRANSFER MODE OFF)"
     MOM_output_literal "G04 G98 P1000(TIME DWELL)"
     set shift_mcs [expr $shift_mcs + [format "%0.4f" $mom_pull_detal_1]]
   }
if { [info exist mom_pull_free_2] && $mom_pull_free_2 != 0.0 } {
     MOM_output_literal "M306(SPIN 2 OPEN)"
#     MOM_output_literal "M358(SPIN 2 AIR BLAST)"
     MOM_output_literal "G53 G1 G98 B\[\#5025+\[[format "%0.4f" $mom_pull_free_2]\]\] F500.0(SPIN 2 MOVE)"
     MOM_output_literal "M307(SPIN 2 CLOSE)"
     MOM_output_literal "G04 G98 P1000(TIME DWELL)"
   }
if { [info exist mom_pull_detal_2] && $mom_pull_detal_2 != 0.0 } {
     MOM_output_literal "M206(SPIN 1 OPEN)"
#     MOM_output_literal "M58(SPIN 1 AIR BLAST)"
     MOM_output_literal "M542(TRANSFER MODE ON)"
     MOM_output_literal "G53 G1 G98 B\[\#5025+\[[format "%0.4f" $mom_pull_detal_2]\]\] F500.0(PART MOVE)"
     MOM_output_literal "M207(SPIN 1 CLOSE)"
     MOM_output_literal "M543(TRANSFER MODE OFF)"
     MOM_output_literal "G04 G98 P1000(TIME DWELL)"
     set shift_mcs [expr $shift_mcs + [format "%0.4f" $mom_pull_detal_2]]
   }

MOM_force once G_feed G_motion
set mom_subspin_on_take_pos HOLD
if { $shift_mcs != 0.0 } {
     set mom_var511 "\#511+[format "%0.4f" $shift_mcs](SHIFT Z)"
     MOM_output_text "\#511=$mom_var511"
   }
if { $mom_machine_mode == "TURN" } {
# PROC_OFFSET
 }
set mom_spindles_synchro_status ON
}

if { [info exist mom_pull_free_1] } { unset mom_pull_free_1 }
if { [info exist mom_pull_detal_1] } { unset mom_pull_detal_1 }
if { [info exist mom_pull_free_2] } { unset mom_pull_free_2 }
if { [info exist mom_pull_detal_2] } { unset mom_pull_detal_2 }

}


#=============================================================
proc PB_CMD_subspindle_to_part { } {
#=============================================================
###   POST_EVENT "subspindle_to_part"
global mom_sys_ptp_output
    if {$mom_sys_ptp_output == "OFF" } { return }

global mom_subspin_came_mode ; # "0. Нет заготовки","1. Заготовка в ГШП","2. Заготовка в КШП"
global mom_subspin_came_mcs ; # "0. W= СК станка","1. W= СК первого шпинделя","2. W= СК второго шпинделя"
global mom_subspin_w_pos ; # "W=координата в выбранной СК"
global mom_subspin_to_pos ; # "Расстояние наезда на деталь (Только справочный размер)"
global mom_subspin_c2_pos ; # "Угол Шп #2"
global mom_subspin_safe_length ; # "Безопасное расст. подхода"
global mom_subspin_press_length ; # "Поджим (натяг)"
global mom_subspin_pull_on ; # "Вытянуть / Задвинуть деталь"

global mom_subspin_on_take_pos
global mom_spindles_synchro_status
global mom_var511
global mom_machine_mode
global mom_spindle_direction mom_coolant_status
global blank_place ; # spindle where blak is placed

if { $mom_machine_mode == "TURN"  && $mom_spindle_direction != "OFF" } {
     set mom_spindle_direction OFF
     MOM_output_literal "M05 M305"
   } else { PB_CMD_fix_spindle_off }
if { $mom_coolant_status != "OFF" } {
     set mom_coolant_status OFF
     MOM_output_literal "M9"
   }
set mom_spindles_synchro_status OFF
SYNCHRO_OFF
MOM_output_literal "G28 U0.0(X GO HOME)"
MOM_output_text "(SPIN 2 GO TO PART)"
if { ![info exist mom_var511] } {
#     MOM_output_text "\#511=0.0( !!! DO NOT EDIT !!! )"
   }
MOM_output_literal "M58(SPIN 1 AIR BLAST)"
MOM_output_literal "M358(SPIN 2 AIR BLAST)"
MOM_output_literal "M01(SET SUBSPINDLE TOUCH POSITION)"

set use_cs [string index $mom_subspin_came_mcs 0] ; # 0. W= СК станка / 1. W= СК первого шпинделя / 2. W= СК второго шпинделя

if {[info exist mom_subspin_came_mode]} {
     set blank_place [string index $mom_subspin_came_mode 0] ; # 0. Нет заготовки / 1. Заготовка в ГШП / 2. Заготовка в КШП
} else { set blank_place 1 }

if { [info exist mom_subspin_to_pos] } {
     MOM_output_text "(POSITION W=[format "%0.4f" $mom_subspin_to_pos] TAKEOVER LENGTH)"
     catch [unset mom_subspin_to_pos]
   }

MOM_output_text "(--------------------------)"
if { [info exist mom_subspin_w_pos] && $mom_subspin_w_pos != 0.0 } {
    MOM_output_text "\#501=[format "%0.4f" $mom_subspin_w_pos] (SPINDLE 2 TAKEOVER POSITION)"
     catch [unset mom_subspin_w_pos]
} else {
    MOM_output_text "\#501=0.0 (SPINDLE 2 TAKEOVER POSITION)"
 }

    MOM_output_text "IF \[\#501NE0\] GOTO 99991"
    MOM_output_text "\#3006=1( SET var501 )"
    MOM_output_text "M0"
    MOM_output_text "N99991"

if { [info exist mom_subspin_pull_on] && $mom_subspin_pull_on != 0.0 } {
      MOM_output_text "\#111=[format "%0.4f" $mom_subspin_pull_on](INCREMENT - PULL OUT PART)"
   }
MOM_output_text "(--------------------------)"
  global trans_subspindle_flag
     if {[info exists trans_subspindle_flag] && $trans_subspindle_flag == 1 } {
            MOM_output_text "\#501=\#501+\#511 (SHIFT TAKEOVER POS)"
        }
MOM_output_literal "M902(SPIN 2 ACTIVE)"
MOM_output_literal "M300(SPIN 2 MILL MODE)"
MOM_output_literal "G110 C2(C = C2)"
if { [info exist mom_subspin_c2_pos] } {
     MOM_output_literal "G0 G90 C[format "%0.4f" $mom_subspin_c2_pos] (SUBSPINDLE ORIENT)"
     catch [unset mom_subspin_c2_pos]
} else {
     MOM_output_literal "G0 G90 C0.0(SUBSPINDLE ORIENT)"
}
MOM_output_literal "G111(C = C1)"
MOM_output_literal "M901(SPIN 1 ACTIVE)"
MOM_output_literal "M200(SPIN 1 MILL MODE)"
MOM_output_literal "G0 G90 C0.0(MAIN SPINDLE ORIENT)"
MOM_output_literal "M540(TAKEOVER MODE ON)"

if { $blank_place == 1 } {
     if { [info exist mom_subspin_on_take_pos] } { CHACK_OPEN "2" }
     MOM_output_text "( ATTENTION!!!!! SPIN 2 MUST BE OPENED!!!!! )"
     MOM_output_literal "M306(SPIN 2 OPEN)"
} elseif { $blank_place == 2 } {
     if { [info exist mom_subspin_on_take_pos] } { CHACK_OPEN "1" }
     MOM_output_text "( ATTENTION!!!!! SPIN 1 MUST BE OPENED!!!!! )"
     MOM_output_literal "M206(SPIN 1 OPEN)"
   }

if { ![info exist mom_subspin_press_length] } { set mom_subspin_press_length 0.0 }
if { [info exist mom_subspin_safe_length] && $mom_subspin_safe_length != 0.0 } {
     MOM_output_literal "G53 G0 G90 B\[\#501+[format "%0.3f" $mom_subspin_safe_length]\](W RAPID POS)"
#     MOM_output_literal "G53 G1 G98 B\[\#501-[format "%0.3f" $mom_subspin_press_length]\] F10.0(W FEED POS)"
     MOM_output_literal "G31 B\[\#501-[format "%0.3f" $mom_subspin_press_length]\] (W FEED POS)"
     catch [unset mom_subspin_safe_length]
} else {
     MOM_output_literal "G53 G0 G90 B\#501(W RAPID POS)"
  }

MOM_output_literal "G4 G98 P2000 (PAUSE)"

if { $blank_place == 1 } {
     MOM_output_literal "M307(SPIN 2 CLOSE)"
} elseif { $blank_place == 2 } {
      MOM_output_literal "M207(SPIN 1 CLOSE)"
   }

MOM_output_literal "M541(TAKEOVER MODE OFF)"

if { [info exist mom_subspin_pull_on] && $mom_subspin_pull_on != 0.0 } {
     MOM_output_literal "G04 G98 P1000(PAUSE)"
     MOM_output_literal "M206(SPIN 1 OPEN)"
     MOM_output_literal "M542(TRANSFER MODE ON)"
     MOM_output_literal "G53 G1 G98 B\[\#501+\#111\] F500.0(MOVING BLANK)"
     MOM_output_literal "M207(SPIN 1 CLOSE)"
     MOM_output_literal "M543(TRANSFER MODE OFF)"
     set mom_var511 "\#511+\#111(SHIFT Z)"
     MOM_output_text "\#511=$mom_var511"
     if { $mom_machine_mode == "TURN" } { PROC_OFFSET }
     catch [unset mom_subspin_pull_on]
  }

set mom_subspin_on_take_pos HOLD
MOM_force once G_mode G_motion G_feed
set mom_spindles_synchro_status ON
if {[info exists mom_subspin_pull_on]} { unset mom_subspin_pull_on }


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
proc PB_CMD_synchro_off { } {
#=============================================================
SYNCHRO_OFF

}


#=============================================================
proc PB_CMD_synchro_on { } {
#=============================================================
SYNCHRO_ON

}


#=============================================================
proc PB_CMD_tool_axis_and_milling_head { } {
#=============================================================
global mom_user_head_type
global mom_operation_name
global mom_tool_name

if { ![info exist mom_user_head_type] } {
  MOM_output_to_listing_device " For tool $mom_tool_name \n not defined \n X_SPINDLE or Z_SPINDLE "
  MOM_abort "TOOL AXIS ERROR"
}

if { [string match "*X*" $mom_user_head_type] && ![ZM_AXIS] } { return }
if { [string match "*Z*" $mom_user_head_type] && [ZM_AXIS] }  { return }

MOM_output_to_listing_device " For operation $mom_operation_name \n tool axis conflicts fith $mom_user_head_type "
MOM_abort "TOOL AXIS ERROR"
}


#=============================================================
proc PB_CMD_tool_axis_mode { } {
#=============================================================
# Detect tool axis mode and output mode
## transmit_mode transmit_status
global mom_operation_type
global mom_tool_axis_type
global user_tool_axis_type
global mom_pb_operation ; # PLANE CYCLE VARI GENERIC
# VECTOR / PTP / VARIABLE /

###==================================

if { $mom_operation_type == "Hole Making" || \
        $mom_operation_type == "Point to Point" || \
           [string match "*Drill*" $mom_operation_type] } {
   #3plus2 mode
   set mom_pb_operation CYCLE
   set user_tool_axis_type PTP
   return
}

if { [string match "*Generic*" $mom_operation_type] } {
     #5axis mode
     set mom_pb_operation VARI
     ## set mom_pb_operation GENERIK
     set user_tool_axis_type VARIABLE
     return
}

if { ![info exist mom_tool_axis_type] } {
     #3plus2 mode
     set mom_pb_operation PLANE
     set user_tool_axis_type VECTOR
     return
}

if { $mom_tool_axis_type > 3 } {
     #5axis mode
     set mom_pb_operation VARI
     set user_tool_axis_type VARIABLE
     return
}

if { $mom_tool_axis_type == 2 && \
     ([string match "*Variable*" $mom_operation_type] || \
         [string match "*Sequential*" $mom_operation_type]) } {
     #5axis mode
     set mom_pb_operation VARI
     set user_tool_axis_type VARIABLE
     return
}

# else
set user_tool_axis_type VECTOR
set mom_pb_operation PLANE
#================================================================
global mom_fanuc_mill_mode
if { ![info exist mom_fanuc_mill_mode] } { set mom_fanuc_mill_mode OFF }
}


#=============================================================
proc PB_CMD_tool_change_force_addresses { } {
#=============================================================
MOM_force once G_adjust H X Y Z S fifth_axis
}


#=============================================================
proc PB_CMD_tool_code { } {
#=============================================================
global mom_tool_number mom_tool_name
global mom_tool_change_type
global mom_tool_manual_change
global mom_fixture_offset_value

set tool_string "T[format "%2.2d" $mom_tool_number][format "%2.2d" $mom_tool_number]."

if { [info exists mom_fixture_offset_value] && $mom_fixture_offset_value == 2 } {
            append tool_string "02"
} else {
            append tool_string "01"
  }

append tool_string " \( $mom_tool_name \)"
MOM_output_literal $tool_string

if { ([info exist mom_tool_change_type] && $mom_tool_change_type == "MANUAL") ||
     ([info exist mom_tool_manual_change] && $mom_tool_manual_change == "Yes") } {
      MOM_output_literal "M00 ( MANUAL TOOL CHANGE )"
  }

}


#=============================================================
proc PB_CMD_tool_code_s { } {
#=============================================================
global mom_tool_number mom_tool_name mom_tool_adjust_register
global mom_tool_change_type
global mom_tool_manual_change
global mom_tool_holder_num mom_tool_holder_num_toggle
global mom_fixture_offset_value

set tool_string "T[format "%2.2d" $mom_tool_number][format "%2.2d" $mom_tool_number]."

if { [info exists mom_fixture_offset_value] && $mom_fixture_offset_value == 2 } {
            append tool_string "02"
} else {
            append tool_string "01"
  }

append tool_string " \( $mom_tool_name \)"
MOM_output_literal $tool_string

if { ([info exist mom_tool_change_type] && $mom_tool_change_type == "MANUAL") ||
     ([info exist mom_tool_manual_change] && $mom_tool_manual_change == "Yes") } {
      MOM_output_literal "M00 ( MANUAL TOOL CHANGE )"
  }

return

if {[info exist mom_tool_holder_num_toggle] && $mom_tool_holder_num_toggle == 1 } {
     if {[info exist mom_tool_holder_num] && $mom_tool_holder_num > 0 } {
            append tool_string "[format "%2.2d" $mom_tool_holder_num]"
        }
} elseif {[info exist mom_tool_adjust_register] && $mom_tool_adjust_register > 0} {
    append tool_string "[format "%2.2d" $mom_tool_adjust_register]"
} else { append tool_string "01" }

append tool_string " \( $mom_tool_name \)"
MOM_output_literal $tool_string

if { ([info exist mom_tool_change_type] && $mom_tool_change_type == "MANUAL") ||
     ([info exist mom_tool_manual_change] && $mom_tool_manual_change == "Yes") } {
      MOM_output_literal "M00 ( MANUAL TOOL CHANGE )"
  }

}


#=============================================================
proc PB_CMD_unclamp_fifth_axis { } {
#=============================================================
global mom_fix_spindle
global mom_next_fix_spindle
global mom_fix_spindle_status
global mom_synchro_mode

set mom_fix_spindle_status OFF
set fix_spindle_string ""

append fix_spindle_string "M$mom_fix_spindle($mom_fix_spindle_status)"
if { [info exist mom_synchro_mode] && $mom_synchro_mode == "ON" } {
      append fix_spindle_string " M$mom_next_fix_spindle($mom_fix_spindle_status)"
   }
MOM_output_literal $fix_spindle_string

}


#=============================================================
proc PB_CMD_unclamp_fourth_axis { } {
#=============================================================
#  This command is used by auto clamping to output the code
#  needed to unclamp the fourth axis.
#
#  --> Do NOT attach this command to any event marker!
#  --> Do NOT change the name of this command!
#
#   MOM_output_literal "M11"
}


#=============================================================
proc PB_CMD_unload_workpiece { } {
#=============================================================
## EVENT MOM_workpiece_unload
## EVENT MOM_part_unload
global mom_spindle_number_opt ; # "1 - главный шпиндель /  2 - контр шпиндель"
global mom_unload_mode ; # "1. Выкл","2. Ручной съем","3. Ловушка"
global mom_unload_pos ; # "Off" "Координата Z от 0 станка"
global mom_unload_spindle_angle ; # "Угол установки шпинделя"
global mom_spindle_number

if { [info exist mom_unload_mode] } {
      set unloading_mod [string index $mom_unload_mode 0]
} else { set unloading_mod 2 }

if { $unloading_mod == 1 } { return }

if { [info exist mom_spindle_number_opt] } {
      set mom_spindle_number [string index $mom_spindle_number_opt 0]
}

if { ![info exist mom_spindle_number] } { return }
if { ![info exist mom_unload_spindle_angle] } { set mom_unload_spindle_angle 30.0 }

if { $mom_spindle_number == 2 } {
  MOM_output_literal "M312(SPIN 2 CLAMP OFF)"
  if { $unloading_mod == 3 } {
        if { ![info exist mom_unload_pos] } { set mom_unload_pos 0 }
        MOM_output_literal "M902(SPIN 2 ACTIVE)"
        MOM_output_literal "M300(SPIN 2 MILL MODE)"
        MOM_output_literal "G110 C2(C = C2)"
        MOM_output_literal "G53 G0 B[format "%0.1f" $mom_unload_pos](POS SPIN 2 TO CATCHER IN G53)"
        MOM_output_literal "M48(PARTS CATCHER ON)"
        MOM_output_literal "M306(SPIN 2 OPEN)"
        MOM_output_literal "G98 G04 P1000"
        MOM_output_literal "G1 G98 H360.0 F100.0"
        MOM_output_literal "/M00"
        MOM_output_literal "M49(PARTS CATCHER OFF)"
        MOM_output_literal "G111(C = C1)"
        MOM_output_literal "M302(SPIN 2 TURN MODE)"
        MOM_output_literal "G28 B0.0(SPIN 2 GO HOME)"
        MOM_output_literal "M01"
  } else {
        MOM_output_literal "G98 G04 P1000"
        MOM_output_literal "M306(SPIN 2 OPEN)"
        MOM_output_literal "( )"
        MOM_output_literal "( TAKE READY PART FROM SPIN 2 )"
        MOM_output_literal "( )"
        MOM_output_literal "M00"
  }
} elseif { $mom_spindle_number == 1 } {
  MOM_output_literal "M212(SPIN 1 CLAMP OFF)"
  if { $unloading_mod == 3 } {
       MOM_output_literal "M58(SPIN 1 AIR BLAST)"
       MOM_output_literal "G111"
       MOM_output_literal "M200(SPIN 1 MILL MODE)"
       MOM_output_literal "G0 C[format "%0.4f" $mom_unload_spindle_angle](SPIN 1 POS)"
       MOM_output_literal "M48(PARTS CATCHER ON)"
       MOM_output_literal "M206(SPIN 1 OPEN)"
       MOM_output_literal "G98 G04 P1000"
       MOM_output_literal "G1 G98 H360.0 F100.0"
       MOM_output_literal "/M00"
       MOM_output_literal "M49(PARTS CATCHER OFF)"
       MOM_output_literal "M202(SPIN 1 TURN MODE)"
       MOM_output_literal "M01"
  } else {
        MOM_output_literal "G98 G04 P1000"
        MOM_output_literal "M206(SPIN 1 OPEN)"
        MOM_output_literal "( )"
        MOM_output_literal "( TAKE READY PART FROM SPIN 1 )"
        MOM_output_literal "( )"
        MOM_output_literal "M00"
  }
}
unset mom_spindle_number

}


#=============================================================
proc PB_CMD_unset_C_trans { } {
#=============================================================
global mom_rot_c_active
if { [info exist mom_rot_c_active] } { unset mom_rot_c_active }

}


#=============================================================
proc PB_CMD_unset_vars { } {
#=============================================================
uplevel #0 {
#==========================
proc UI_UNSET { vars } {
#==========================
  global $vars
  if {[info exist $vars]} { unset $vars }
}
#==========================
} ; # uplevel
}


#=============================================================
proc PB_CMD_user_initial_move { } {
#=============================================================
global user_tool_axis_type
# PTP / VECTOR
global mom_transmit_mode
# OPTIONS "XY","XC","AUTO"
global mom_operation_type
global mom_tool_axis
global AUTO_clamp_5th ; # ON OFF

global mom_rotary_delta_5th
# set mom_rotary_delta_5th 0

if { ![info exist mom_transmit_mode] } { set mom_transmit_mode AUTO }

#==============================
if { $mom_operation_type == "Cylinder Milling___" && \
          [EQ_is_equal [expr abs($mom_tool_axis(2))] 1] } {
     global mom_pos mom_mcs_goto mom_out_angle_pos
     global mom_prev_pos mom_prev_out_angle_pos
     global RAD2DEG DEG2RAD
     global mom_fanuc_mill_mode

       if {[EQ_is_equal $mom_mcs_goto(0) 0] && \
                    [EQ_is_equal $mom_mcs_goto(1) 0] } {
                MILL_MODE_SET "XY"
                MOM_force once X Y Z G_feed G_motion G_mode
            return
       }

       set rad_ [expr hypot($mom_mcs_goto(0), $mom_mcs_goto(1))]
       set ang_ [expr atan2($mom_mcs_goto(1), $mom_mcs_goto(0))*$RAD2DEG]
         if {[EQ_is_lt $ang_ 0]} {
                set ang_ [expr $ang_+360.0]
         }
       set mom_pos(4) $ang_
       set mom_out_angle_pos(1) $ang_
       set mom_pos(0) $rad_
       set mom_pos(1) 0

       VMOV 2 mom_out_angle_pos mom_prev_out_angle_pos
       MOM_reload_variable -a mom_pos
       MOM_reload_variable -a mom_out_angle_pos
       MOM_reload_variable -a mom_prev_out_angle_pos

       MOM_force once G_mode G_motion G_feed Z
       MOM_do_template move_z
       set mom_sys_leader(Y) "Y"
       set mom_fanuc_mill_mode "XY"
       PB_CMD_kin_before_motion
       MOM_reload_kinematics
       MOM_enable_address G_plane fifth_axis Y
       MOM_force once G_plane G_motion X Y fifth_axis F
       set AUTO_clamp_5th OFF
    return
}

#==============================
if { $user_tool_axis_type == "VECTOR" && [ZM_AXIS] } {

  if { $mom_transmit_mode == "XY" } {
       MILL_MODE_SET "XY"
       set AUTO_clamp_5th ON
     } else {
         MILL_MODE_SET "G12"
         set AUTO_clamp_5th OFF
       }

} elseif { $user_tool_axis_type == "PTP" && [ZM_AXIS] } {

  if { $mom_transmit_mode == "XY" } {
       MILL_MODE_SET "XY"
     } else { MILL_MODE_SET "XC" }

         set AUTO_clamp_5th OFF

} elseif { $user_tool_axis_type == "VARIABLE" } {
     if { [ZM_AXIS] } {
             MILL_MODE_SET "G12"
     } else {
             MILL_MODE_SET "VARI"
       }
         set AUTO_clamp_5th OFF
} else {

  MILL_MODE_SET "XZ"
  set AUTO_clamp_5th ON
}

#==============================
# MOM_force once X Y Z G_feed G_motion G_mode
#MOM_before_motion
MOM_force once X Y Z


global mom_out_angle_pos
global mom_prev_rot_ang_5th
  set mom_prev_rot_ang_5th $mom_out_angle_pos(1)
  MOM_reload_variable mom_prev_rot_ang_5th

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
proc CONVERT_BACK { input_point tool_axis converted_point } {
#=============================================================

   upvar $input_point v1 ; upvar $tool_axis ta ; upvar $converted_point v2
   global DEG2RAD mom_kin_caxis_rotary_pos mom_sys_spindle_axis
   global mom_tool_offset mom_origin mom_translate
   global mom_tool_z_offset
   global mom_kin_4th_axis_point mom_kin_4th_axis_center_offset
   global mom_kin_4th_axis_ang_offset

   set ang [expr $v1(3) - $mom_kin_4th_axis_ang_offset]

   if [EQ_is_equal $mom_sys_spindle_axis(2) 1.0] {

      set v2(0) [expr cos($ang*$DEG2RAD)*$v1(0)]
      set v2(1) [expr sin($ang*$DEG2RAD)*$v1(0)]
      set v2(2) $v1(2)
      set ta(0) 0.0
      set ta(1) 0.0
      set ta(2) 1.0

   } elseif [EQ_is_zero $mom_sys_spindle_axis(2)] {


      set cpos [expr $ang - $mom_kin_caxis_rotary_pos]
      set crot [expr $cpos*$DEG2RAD]
      set ta(0) [expr cos($cpos*$DEG2RAD)]
      set ta(1) [expr sin($cpos*$DEG2RAD)]
      set ta(2) 0.0
      set v2(0) [expr cos($crot)*$v1(0) - sin($crot)*$v1(1)]
      set v2(1) [expr sin($crot)*$v1(0) + cos($crot)*$v1(1)]
      set v2(2) $v1(2)
   }

   if [info exists mom_tool_z_offset] {
       set toff(0) [expr $mom_tool_z_offset*$mom_sys_spindle_axis(0)]
       set toff(1) [expr $mom_tool_z_offset*$mom_sys_spindle_axis(1)]
       set toff(2) [expr $mom_tool_z_offset*$mom_sys_spindle_axis(2)]
   } else {
       set toff(0) 0.0
       set toff(1) 0.0
       set toff(2) 0.0
   }

   VEC3_sub v2 toff v2

   if [info exists mom_origin]    { VEC3_add v2 mom_origin v2 }
   if [info exists mom_translate] { VEC3_sub v2 mom_translate v2 }

   if {[info exists mom_kin_4th_axis_point]} {
      VEC3_sub v2 mom_kin_4th_axis_point v2
   } else {
      VEC3_sub v2 mom_kin_4th_axis_center_offset v2
   }
}


#=============================================================
proc CONVERT_POINT { input_point tool_axis prev_pos conversion_method converted_point } {
#=============================================================
   upvar $input_point v1; upvar $tool_axis ta ; upvar $converted_point v2
   upvar $prev_pos pp; upvar $conversion_method meth

   global mom_sys_spindle_axis mom_kin_caxis_rotary_pos
   global mom_sys_millturn_yaxis mom_kin_machine_resolution
   global mom_origin mom_translate
   global mom_tool_z_offset
   global mom_kin_4th_axis_min_limit mom_kin_4th_axis_max_limit
   global mom_warning_info
   global RAD2DEG DEG2RAD PI
   global mom_kin_4th_axis_min_limit mom_kin_4th_axis_max_limit
   global mom_kin_4th_axis_point mom_kin_4th_axis_center_offset
   global mom_kin_4th_axis_ang_offset

   VMOV 3 v1 temp

   if {[info exists mom_tool_z_offset]} {
       set toff(0) [expr $mom_tool_z_offset*$mom_sys_spindle_axis(0)]
       set toff(1) [expr $mom_tool_z_offset*$mom_sys_spindle_axis(1)]
       set toff(2) [expr $mom_tool_z_offset*$mom_sys_spindle_axis(2)]
   } else {
       set toff(0) 0.0
       set toff(1) 0.0
       set toff(2) 0.0
   }

   VEC3_add temp toff temp
   if { [info exists mom_origin] }    { VEC3_sub temp mom_origin temp }
   if { [info exists mom_translate] } { VEC3_add temp mom_translate temp }

   if {[info exists mom_kin_4th_axis_point]} {
      VEC3_add temp mom_kin_4th_axis_point temp
   } else {
      VEC3_add temp mom_kin_4th_axis_center_offset temp
   }

   if {( [EQ_is_equal $mom_sys_spindle_axis(2) 1.0] && [EQ_is_equal $ta(2) 1.0] ) || ( [EQ_is_equal $mom_sys_spindle_axis(2) -1.0] && [EQ_is_equal $ta(2) -1.0] )} {

      set v2(0) [expr sqrt(pow($temp(0),2) + pow($temp(1),2))]
      set v2(1) 0.0
      set v2(2) $temp(2)
      set v2(3) [expr ([ARCTAN $temp(1) $temp(0)])*$RAD2DEG*$mom_sys_spindle_axis(2)]
      set v2(3) [expr $v2(3) + $mom_kin_4th_axis_ang_offset]
      set ang1 [LIMIT_ANGLE $v2(3)]
      if {$ang1 >= $mom_kin_4th_axis_min_limit && $ang1 <= $mom_kin_4th_axis_max_limit} {
         set ang1bad 0
      } else {
         set ang1 [expr $ang1 - 360.0]
         if {$ang1 >= $mom_kin_4th_axis_min_limit && $ang1 <= $mom_kin_4th_axis_max_limit} {
            set ang1bad 0
         } else {
            set ang1bad 1
         }
      }

      set ap(0) [expr -$v2(0)]
      set ap(1) 0.0
      set ap(2) $v2(2)
      set ap(3) [expr $v2(3) + 180.0]
      if {$ap(3) >= 360.0} {set ap(3) [expr $ap(3) - 360.0]}
      set ang2 [LIMIT_ANGLE $ap(3)]
      if {$ang2 >= $mom_kin_4th_axis_min_limit && $ang2 <= $mom_kin_4th_axis_max_limit} {
         set ang2bad 0
      } else {
         set ang2 [expr $ang2 - 360.0]
         if {$ang2 >= $mom_kin_4th_axis_min_limit && $ang2 <= $mom_kin_4th_axis_max_limit} {
            set ang2bad 0
         } else {
            set ang2bad 1
         }
      }

      if {$meth == "ALWAYS_POSITIVE"} {
         if {$ang1bad} {
            set mom_warning_info "Fourth axis rotary angle not valid"
            MOM_catch_warning
         }
      } elseif {$meth == "ALWAYS_NEGATIVE"} {
         if {$ang2bad} {
            set mom_warning_info "Fourth axis rotary angle not valid"
            MOM_catch_warning
         }
         VMOV 4 ap v2
      } elseif {$ang2bad && $ang1bad} {
         set mom_warning_info "Fourth axis rotary angle not valid"
         MOM_catch_warning
      } elseif {$ang1bad == 1} {
         VMOV 4 ap v2
      } elseif {!$ang1bad && !$ang2bad} {
         set d1 [LIMIT_ANGLE [expr $v2(3) - $pp(3)]]
         if {$d1 > 180.} {set d1 [expr 360.0 - $d1]}
         set d2 [LIMIT_ANGLE [expr $ap(3) - $pp(3)]]
         if {$d2 > 180.} {set d2 [expr 360.0 - $d2]}
         if {$d2 < $d1} {VMOV 4 ap v2}
      }

   } elseif [EQ_is_zero $mom_sys_spindle_axis(2)] {

      set cpos [expr ([ARCTAN $ta(1) $ta(0)])]
      set cout [expr $cpos - $mom_kin_caxis_rotary_pos*$RAD2DEG]
      set crot [expr 2*$PI - $cout]

      set v2(0) [expr cos($crot)*$temp(0) - sin($crot)*$temp(1)]
      set v2(1) [expr sin($crot)*$temp(0) + cos($crot)*$temp(1)]
      set v2(2) $temp(2)
      set v2(3) [expr $cout*$RAD2DEG]

      global mom_kin_machine_resolution
      if {$mom_kin_machine_resolution >= .001} {
          set decimals 3
      } elseif {$mom_kin_machine_resolution >= .0001} {
          set decimals 4
      } else {
          set decimals 5
      }
      set yaxis [format "%.${decimals}f" $v2(1)]
      if {$mom_sys_millturn_yaxis == "FALSE"  && ![EQ_is_zero $yaxis] } {

        global mom_tool_corner1_radius
        global mom_tool_diameter

#<sws 5095924>
        set rad [expr sqrt(pow($v2(0),2) + pow($v2(1),2))]
        set v2(3) [expr ([ARCTAN $v2(1) $v2(0)])*$RAD2DEG]
        set v2(0) $rad
        set v2(1) 0.0
        if {[info exists mom_tool_corner1_radius]} {
            set trad [expr $mom_tool_corner1_radius*2.0 - $mom_tool_diameter]
            if ![EQ_is_zero $trad] {
              set mom_warning_info "Tool may gouge, tool axis does not pass through centerline"
              MOM_catch_warning
              return "FAIL"
            }
        }
      }
      return "OK"
   } else {
      return "INVALID"
   }

return "OK"
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
proc LINEARIZE_MOTION {  } {
#=============================================================
   global mom_pos mom_prev_pos mom_mcs_goto mom_prev_mcs_goto
   global mom_kin_linearization_tol mom_sys_coordinate_output_mode
   global mom_kin_machine_resolution mom_out_angle_pos mom_sys_output_mode
   global mom_tool_axis mom_prev_tool_axis mom_sys_radius_output_mode
   global mom_kin_4th_axis_min_limit mom_kin_4th_axis_max_limit
   global mom_kin_linearization_flag

   if { $mom_sys_coordinate_output_mode == "CARTESIAN" || $mom_kin_linearization_flag == "FALSE"} {
      PB_CMD_linear_move
      return
   }

   VMOV 5 mom_pos save_pos
   VMOV 5 mom_pos save_prev_pos
   VMOV 3 mom_mcs_goto save_mcs_goto
   VMOV 3 mom_tool_axis save_ta

   if { $mom_kin_linearization_tol < $mom_kin_machine_resolution } {
      set tol $mom_kin_machine_resolution
   } else {
      set tol $mom_kin_linearization_tol
   }

#<sws 5095924>
   set status [CONVERT_POINT mom_prev_mcs_goto mom_prev_tool_axis save_prev_pos mom_sys_radius_output_mode mom_prev_pos]
   if {$status == "FAIL"} {return}
   CONVERT_BACK mom_prev_pos mom_prev_tool_axis mom_prev_mcs_goto

   set loop 0
   set count 0

   while { $loop == 0 } {

      for {set i 3} {$i < 5} {incr i} {
         set del [expr $mom_pos($i) - $mom_prev_pos($i)]
         if {$del > 180.0} {
            set mom_prev_pos($i) [expr $mom_prev_pos($i)+360.0]
         } elseif {$del < -180.0} {
            set mom_prev_pos($i) [expr $mom_prev_pos($i)-360.0]
         }
      }

      set loop 1

      for {set i 0} {$i < 3} {incr i} {
         set mid_mcs_goto($i) [expr ($mom_mcs_goto($i)+$mom_prev_mcs_goto($i))/2.0]
      }
      for {set i 0} {$i < 5} {incr i} {
         set mid_pos($i) [expr ($mom_pos($i)+$mom_prev_pos($i))/2.0]
      }

      CONVERT_BACK mid_pos mid_ta temp

      VEC3_sub temp mid_mcs_goto work

      set error [VEC3_mag work]

      if {$count > 20} {

         VMOV 5 save_pos mom_pos
         VMOV 3 save_mcs_goto mom_mcs_goto
         VMOV 3 save_ta mom_tool_axis

         LINEARIZE_OUTPUT

      } elseif { $error < $tol} {

         LINEARIZE_OUTPUT

         VMOV 3 mom_mcs_goto mom_prev_mcs_goto
         VMOV 3 mom_tool_axis mom_prev_tool_axis
         VMOV 5 mom_pos mom_prev_pos

         if {$count != 0} {
            VMOV 5 save_pos mom_pos
            VMOV 3 save_mcs_goto mom_mcs_goto
            VMOV 3 save_ta mom_tool_axis
            set loop 0
            set count 0
         }

      } else {
         if {$error < $mom_kin_machine_resolution} {
            set error $mom_kin_machine_resolution
         }
         set error [expr sqrt($mom_kin_linearization_tol*.98/$error)]
         if {$error < .5} {set error .5}
         for {set i 0} {$i < 3} {incr i} {
            set mom_mcs_goto($i)  [expr $mom_prev_mcs_goto($i)+($mom_mcs_goto($i)-$mom_prev_mcs_goto($i))*$error]
            set mom_tool_axis($i)  [expr $mom_prev_tool_axis($i)+($mom_tool_axis($i)-$mom_prev_tool_axis($i))*$error]
         }
         for {set i 0} {$i < 5} {incr i} {
            set mom_pos($i) [expr $mom_prev_pos($i)+($mom_pos($i)-$mom_prev_pos($i))*$error]
         }
         CONVERT_POINT mom_mcs_goto mom_tool_axis mom_prev_pos mom_sys_radius_output_mode mom_pos
         set loop 0
         incr count
      }
   }

   VMOV 5 mom_pos mom_prev_pos
   VMOV 3 mom_mcs_goto mom_prev_mcs_goto
   VMOV 3 mom_tool_axis mom_prev_tool_axis
}


#=============================================================
proc LINEARIZE_OUTPUT {  } {
#=============================================================
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

   if {![info exists mom_out_angle_pos]} {
      set mom_out_angle_pos(0) 0.0
      set mom_out_angle_pos(1) 0.0
   }
   if {![info exists mom_prev_rot_ang_4th]} {
      set mom_prev_rot_ang_4th $mom_out_angle_pos(0)
   }
   if {![info exists mom_prev_rot_ang_5th]} {
      set mom_prev_rot_ang_5th $mom_out_angle_pos(1)
   }

   set mom_out_angle_pos(0)  [ROTSET $mom_pos(3) $mom_prev_rot_ang_4th $mom_kin_4th_axis_direction  $mom_kin_4th_axis_leader mom_sys_leader(fourth_axis) $mom_kin_4th_axis_min_limit $mom_kin_4th_axis_max_limit]
#
#  Re-calcualte the distance and feed rate number
#

   VEC3_sub mom_mcs_goto mom_prev_mcs_goto delta
   set mom_motion_distance [VEC3_mag delta]
   if {[EQ_is_lt $mom_motion_distance $mom_kin_machine_resolution]} {
       set mom_feed_rate_number $mom_kin_max_frn
   } else {
       set mom_feed_rate_number [expr $mom_feed_rate / $mom_motion_distance ]
   }

   set mom_pos(3) $mom_out_angle_pos(0)

   if {[string match "3_axis_mill_turn" $mom_kin_machine_type]} {
       set mom_kin_machine_type "mill_turn"
   }

   FEEDRATE_SET

   if {[string match "mill_turn" $mom_kin_machine_type]} {
       set mom_kin_machine_type "3_axis_mill_turn"
   }

   PB_CMD_linear_move

   set mom_prev_pos(3) $mom_out_angle_pos(0)

   MOM_reload_variable -a mom_pos
   MOM_reload_variable -a mom_prev_pos
   MOM_reload_variable -a mom_out_angle_pos
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
proc MILL_TURN {  } {
#=============================================================
   global mom_tool_axis mom_sys_spindle_axis mom_cycle_retract_to
   global mom_cycle_rapid_to_pos mom_cycle_feed_to_pos
   global mom_cycle_retract_to_pos mom_cycle_rapid_to mom_cycle_feed_to
   global mom_kin_4th_axis_direction mom_kin_4th_axis_leader mom_sys_leader
   global mom_prev_rot_ang_4th mom_mcs_goto mom_motion_type
   global mom_out_angle_pos mom_pos mom_prev_pos
   global mom_sys_radius_output_mode mom_warning_info
   global mom_kin_4th_axis_min_limit mom_kin_4th_axis_max_limit

   set status  [CONVERT_POINT mom_mcs_goto mom_tool_axis mom_prev_pos mom_sys_radius_output_mode mom_pos]
   if {$status == "INVALID"} {
      set mom_warning_info "Invalid Tool Axis For Mill/Turn"
      MOM_catch_warning
   }

   if {![info exists mom_prev_rot_ang_4th]} {set mom_prev_rot_ang_4th 0.0}
   set mom_out_angle_pos(0) [ROTSET $mom_pos(3) $mom_prev_rot_ang_4th  $mom_kin_4th_axis_direction $mom_kin_4th_axis_leader mom_sys_leader(fourth_axis) $mom_kin_4th_axis_min_limit $mom_kin_4th_axis_max_limit]


   set mom_prev_pos(3) $mom_out_angle_pos(0)
   set mom_pos(3) $mom_out_angle_pos(0)
   MOM_reload_variable -a mom_out_angle_pos
   MOM_reload_variable -a mom_pos
   MOM_reload_variable -a mom_prev_pos
   if {$mom_pos(3) < $mom_kin_4th_axis_min_limit} {
      set mom_warning_info "C axis rotary position exceeds minimum limit, did not alter output"
      MOM_catch_warning
   } elseif {$mom_pos(3) > $mom_kin_4th_axis_max_limit} {
      set mom_warning_info "C axis rotary position exceeded maximum limit, did not alter output"
      MOM_catch_warning
   }

   if {$mom_motion_type == "CYCLE"} {
      for {set i 0} {$i < 3} {incr i} {
         set mom_cycle_rapid_to_pos($i)  [expr $mom_pos($i) + $mom_cycle_rapid_to*$mom_sys_spindle_axis($i)]
         set mom_cycle_feed_to_pos($i)  [expr $mom_pos($i) + $mom_cycle_feed_to*$mom_sys_spindle_axis($i)]
         set mom_cycle_retract_to_pos($i)  [expr $mom_pos($i) + $mom_cycle_retract_to*$mom_sys_spindle_axis($i)]
      }
      global mom_motion_event
      if {$mom_motion_event == "initial_move"} {
          for {set i 0} {$i < 3} {incr i} {
             set mom_pos($i)  [expr $mom_pos($i) + $mom_cycle_rapid_to*$mom_sys_spindle_axis($i)]
          }
      }
   }
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


