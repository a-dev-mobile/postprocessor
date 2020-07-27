########################## TCL Event Handlers ##########################
#
#  DMU60_evo_Siemens840D_PEGAS.tcl -
#
#  Created by Batarev  @  27 сентября 2017 г. 13:36:22 RTZ 2 (Р·РёРјР°)
#  with Post Builder version  6.0.3.
#
########################################################################


  set cam_post_dir [MOM_ask_env_var UGII_CAM_POST_DIR]


  if { ![info exists mom_sys_post_initialized] } {

     source ${cam_post_dir}ugpost_base.tcl
 
 
     set mom_sys_debug_mode OFF
 
 
     if { ![info exists env(PB_SUPPRESS_UGPOST_DEBUG)] } {
        set env(PB_SUPPRESS_UGPOST_DEBUG) 0
     }
 
     if $env(PB_SUPPRESS_UGPOST_DEBUG) {
        set mom_sys_debug_mode OFF
     }
 
     if { ![string compare $mom_sys_debug_mode "OFF"] } {
 
        proc MOM_before_each_add_var {} {}
        proc MOM_before_each_event {} {}
 
     } else {
 
        set cam_debug_dir [MOM_ask_env_var UGII_CAM_DEBUG_DIR]
        source ${cam_debug_dir}mom_review.tcl
     }
 
     MOM_set_debug_mode ON


   ####  Listing File variables 
     set mom_sys_list_output                       "OFF"
     set mom_sys_header_output                     "OFF"
     set mom_sys_list_file_rows                    "40" 
     set mom_sys_list_file_columns                 "30" 
     set mom_sys_warning_output                    "OFF"
     set mom_sys_group_output                      "OFF"
     set mom_sys_list_file_suffix                  "lpt"
     set mom_sys_output_file_suffix                "mpf"
     set mom_sys_commentary_output                 "ON" 
     set mom_sys_commentary_list                   "x y z 4axis 5axis feed speed"


   #=============================================================
   proc MOM_before_output { } {
   #=============================================================
   # This command is executed just before every NC block is
   # to be output to a file.
   #
   # - Never overload this command!
   # - Any customization should be done in PB_CMD_before_output!
   #

      if { [llength [info commands PB_CMD_kin_before_output]] } {
         PB_CMD_kin_before_output
      }

   ######### The following procedure invokes the listing file with warnings.

      LIST_FILE
   }



     set mom_sys_control_out                       "; " 
     set mom_sys_control_in                        ""   

     set mom_sys_post_initialized 1
  }


########## SYSTEM VARIABLE DECLARATIONS ##############
  set mom_sys_rapid_code                        "0"  
  set mom_sys_linear_code                       "1"  
  set mom_sys_circle_code(CLW)                  "2"  
  set mom_sys_circle_code(CCLW)                 "3"  
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
  set mom_sys_unit_code(IN)                     "70" 
  set mom_sys_unit_code(MM)                     "71" 
  set mom_sys_cycle_start_code                  "79" 
  set mom_sys_cycle_off                         "80" 
  set mom_sys_cycle_drill_code                  "81" 
  set mom_sys_cycle_drill_dwell_code            "82" 
  set mom_sys_cycle_drill_deep_code             "83" 
  set mom_sys_cycle_drill_break_chip_code       "83" 
  set mom_sys_cycle_tap_code                    "84" 
  set mom_sys_cycle_bore_code                   "85" 
  set mom_sys_cycle_bore_drag_code              "86" 
  set mom_sys_cycle_bore_no_drag_code           "86" 
  set mom_sys_cycle_bore_dwell_code             "84" 
  set mom_sys_cycle_bore_manual_code            "84" 
  set mom_sys_cycle_bore_back_code              "84" 
  set mom_sys_cycle_bore_manual_dwell_code      "84" 
  set mom_sys_output_code(ABSOLUTE)             " "  
  set mom_sys_output_code(INCREMENTAL)          " "  
  set mom_sys_cycle_ret_code(AUTO)              ""   
  set mom_sys_cycle_ret_code(MANUAL)            ""   
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
  set mom_sys_coolant_code(MIST)                "7"  
  set mom_sys_coolant_code(THRU)                "7"  
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
  set mom_sys_seqnum_max                        "999999"
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
  set mom_sys_leader(fifth_axis)                "C=DC("
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
  set mom_sys_retract_distance                  "10" 
  set mom_sys_post_description                  "This is a 5-Axis Milling Machine With\n\
                                                  Dual Rotary Tables."
  set mom_sys_ugpadvkins_used                   "0"
  set mom_sys_post_builder_version              "6.0.3"

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
  set mom_kin_4th_axis_min_incr                 "0.001"
  set mom_kin_4th_axis_min_limit                "0"  
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
  set mom_kin_5th_axis_leader                   "C=DC("
  set mom_kin_5th_axis_limit_action             "Warning"
  set mom_kin_5th_axis_max_limit                "360"
  set mom_kin_5th_axis_min_incr                 "0.001"
  set mom_kin_5th_axis_min_limit                "-360"
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
  set mom_kin_dependent_head                    "NONE"
  set mom_kin_flush_time                        "2.0"
  set mom_kin_ind_to_dependent_head_x           "0"  
  set mom_kin_ind_to_dependent_head_z           "0"  
  set mom_kin_independent_head                  "NONE"
  set mom_kin_linearization_flag                "1"  
  set mom_kin_linearization_tol                 "0.01"
  set mom_kin_machine_resolution                "0.002"
  set mom_kin_machine_type                      "5_axis_dual_table"
  set mom_kin_machine_zero_offset(0)            "0.0"
  set mom_kin_machine_zero_offset(1)            "0.0"
  set mom_kin_machine_zero_offset(2)            "0.0"
  set mom_kin_max_arc_radius                    "99999.999"
  set mom_kin_max_dpm                           "10" 
  set mom_kin_max_fpm                           "15000"
  set mom_kin_max_fpr                           "1000"
  set mom_kin_max_frn                           "1000"
  set mom_kin_min_arc_length                    "0.20"
  set mom_kin_min_arc_radius                    "0.001"
  set mom_kin_min_dpm                           "0.0"
  set mom_kin_min_fpm                           "0.1"
  set mom_kin_min_fpr                           "0.1"
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
 set mom_sys_postname(TURN)                    "DMU60_evo_Siemens_840D_PEGAS_TURN"


#=============================================================
proc MOM_end_of_program { } {
#=============================================================
   PB_CMD_for_prefun_in_end
   PB_CMD_otskok_v_mash_nol
   PB_CMD_custom_command_1
   PB_CMD_head
   MOM_do_template end_of_path_m
   MOM_do_template end_of_program_m
   PB_CMD_Rotate_enable
   PB_CMD_reprocess

#**** The following procedure lists the tool list with time in commentary data
   LIST_FILE_TRAILER

#**** The following procedure closes the warning and listing files
   CLOSE_files
}


  incr mom_sys_post_initialized


} ;# uplevel
#***********


}


#=============================================================
proc PB_TURRET_HEAD_SET { } {
#=============================================================
  global mom_kin_independent_head mom_tool_head
  global turret_current mom_warning_info

    set turret_current INDEPENDENT
    set ind_head NONE
    set dep_head NONE

    if { [string compare $mom_tool_head $mom_kin_independent_head] } {
       set turret_current DEPENDENT
    }

    if { [string compare $mom_tool_head "$ind_head"] && \
         [string compare $mom_tool_head "$dep_head"] } {
       set mom_warning_info "mom_tool_head = $mom_tool_head IS INVALID, USING NONE"
       MOM_catch_warning
    }
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
proc MOM_before_motion { } {
#=============================================================
  global mom_motion_event mom_motion_type

    FEEDRATE_SET


    switch $mom_motion_type {
      ENGAGE   {PB_engage_move}
      APPROACH {PB_approach_move}
      FIRSTCUT {PB_first_cut}
      RETRACT  {PB_retract_move}
      RETURN   {PB_return_move}
    }

    if [llength [info commands PB_CMD_kin_before_motion] ] { PB_CMD_kin_before_motion }
    if [llength [info commands PB_CMD_before_motion] ]     { PB_CMD_before_motion }
}


#=============================================================
proc MOM_start_of_group {} {
#=============================================================
  global mom_sys_group_output mom_group_name group_level ptp_file_name
  global mom_sequence_number mom_sequence_increment mom_sequence_frequency
  global mom_sys_ptp_output pb_start_of_program_flag

    if {![hiset group_level]} {set group_level 0 ; return}

    if {[hiset mom_sys_group_output]} {if { ![string compare $mom_sys_group_output "OFF"] } {set group_level 0 ; return}}

    if {[hiset group_level]} {incr group_level} else {set group_level 1}
    if {$group_level > 1} {return}

    SEQNO_RESET ; #<4133654>
    MOM_reset_sequence $mom_sequence_number $mom_sequence_increment $mom_sequence_frequency

    if {[info exists ptp_file_name]} {
      MOM_close_output_file $ptp_file_name ; MOM_start_of_program
      if { ![string compare $mom_sys_ptp_output "ON"] } {MOM_open_output_file $ptp_file_name }
    } else {
      MOM_start_of_program
    }

    PB_start_of_program ; set pb_start_of_program_flag 1
}


#=============================================================
proc MOM_machine_mode {} {
#=============================================================
  global pb_start_of_program_flag
  global mom_operation_name mom_sys_change_mach_operation_name

   set mom_sys_change_mach_operation_name $mom_operation_name

    if {$pb_start_of_program_flag == 0} {PB_start_of_program ; set pb_start_of_program_flag 1}

    if [llength [info commands PB_machine_mode] ] {
       if [catch {PB_machine_mode} res] {
          global mom_warning_info
          set mom_warning_info "$res"
          MOM_catch_warning
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
if [llength [info commands ugpost_FEEDRATE_SET] ] {
   rename ugpost_FEEDRATE_SET ""
}

if [llength [info commands FEEDRATE_SET] ] {
   rename FEEDRATE_SET ugpost_FEEDRATE_SET
} else {
   proc ugpost_FEEDRATE_SET {} {}
}


#=============================================================
proc FEEDRATE_SET { } {
#=============================================================
   if [llength [info commands PB_CMD_kin_feedrate_set] ] {
      PB_CMD_kin_feedrate_set
   } else {
      ugpost_FEEDRATE_SET
   }
}


#=============================================================
proc MOM_head { } {
#=============================================================
   global mom_warning_info

   global mom_sys_in_operation
   if { [info exists mom_sys_in_operation] && $mom_sys_in_operation == 1 } {
      global mom_operation_name
      set mom_warning_info "HEAD event should not be assigned to an operatrion ($mom_operation_name)."
      MOM_catch_warning
return
   }

   global mom_head_name mom_sys_postname
   global mom_load_event_handler
   global CURRENT_HEAD NEXT_HEAD
   global mom_sys_prev_mach_head mom_sys_curr_mach_head
   global mom_sys_head_change_init_program

   if { ![info exists CURRENT_HEAD] } {
      set CURRENT_HEAD ""
   }

   if { [info exists mom_head_name] } {
      set NEXT_HEAD $mom_head_name
   } else {
      set mom_warning_info "No HEAD event has been assigned."
      MOM_catch_warning
return
   }

   set head_list [array names mom_sys_postname]
   foreach h $head_list {
      if { [regexp -nocase ^$mom_head_name$ $h] == 1 } {
         set NEXT_HEAD $h
         break
      }
   }


   set tcl_file ""

   if { ![info exists mom_sys_postname($NEXT_HEAD)] } {

      set mom_warning_info "Post is not specified with Head ($NEXT_HEAD)."
      MOM_catch_warning

   } elseif { ![string match "$NEXT_HEAD" $CURRENT_HEAD] } {

      if { [llength [info commands PB_end_of_HEAD__$CURRENT_HEAD]] } {
         PB_end_of_HEAD__$CURRENT_HEAD
      }

      set mom_sys_prev_mach_head $CURRENT_HEAD
      set mom_sys_curr_mach_head $NEXT_HEAD

      set CURRENT_HEAD $NEXT_HEAD


      global mom_sys_master_head mom_sys_master_post cam_post_dir

      if [string match "$CURRENT_HEAD" $mom_sys_master_head] {

         set mom_load_event_handler "\"$mom_sys_master_post.tcl\""
         MOM_load_definition_file   "$mom_sys_master_post.def"

         set tcl_file "$mom_sys_master_post.tcl"

      } else {

         set tcl_file "[file dirname $mom_sys_master_post]/$mom_sys_postname($CURRENT_HEAD).tcl"
         set def_file "[file dirname $mom_sys_master_post]/$mom_sys_postname($CURRENT_HEAD).def"

         if [file exists "$tcl_file"] {

            global tcl_platform

            if [string match "*windows*" $tcl_platform(platform)] {
               regsub -all {/} $tcl_file {\\} tcl_file
               regsub -all {/} $def_file {\\} def_file
            }

            set mom_load_event_handler "\"$tcl_file\""
            MOM_load_definition_file   "$def_file"

         } else {

            set tcl_file "${cam_post_dir}$mom_sys_postname($CURRENT_HEAD).tcl"
            set def_file "${cam_post_dir}$mom_sys_postname($CURRENT_HEAD).def"

            if [file exists "$tcl_file"] {

               set mom_load_event_handler "\"$tcl_file\""
               MOM_load_definition_file   "$def_file"

            } else {
               set mom_warning_info  "Post ($mom_sys_postname($CURRENT_HEAD)) for HEAD ($CURRENT_HEAD) not found."
               MOM_catch_warning
            }
         }
      }


      set mom_sys_head_change_init_program 1

      if [llength [info commands MOM_start_of_program_save]] {
         rename MOM_start_of_program_save ""
      }
      rename MOM_start_of_program MOM_start_of_program_save

      if [llength [info commands MOM_end_of_program]] {
         if [llength [info commands MOM_end_of_program_save]] {
            rename MOM_end_of_program_save ""
         }
         rename MOM_end_of_program MOM_end_of_program_save
      }

      if [llength [info commands MOM_head_save]] {
         rename MOM_head_save ""
      }
      rename MOM_head MOM_head_save
   }
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


   PB_CMD_cycle_init
   PB_CMD_coolant_init
   MOM_force Once X Y
   MOM_do_template cycle_bore
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


   PB_CMD_cycle_init
   PB_CMD_coolant_init
   MOM_force Once G_motion X Y
   MOM_do_template cycle_bore_drag
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


   PB_CMD_cycle_init
   PB_CMD_coolant_init
   MOM_force Once G_motion X Y
   MOM_do_template cycle_bore_dwell
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


   PB_CMD_cycle_init
   PB_CMD_coolant_init
   MOM_force Once X Y
   MOM_do_template cycle_bore_no_drag
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
   PB_CMD_LN_vs_L
   PB_CMD_test_G2
   PB_CMD_podvorot_circle
   MOM_force Once X Y I J
   MOM_do_template circular_move_1
}


#=============================================================
proc MOM_coolant_off { } {
#=============================================================
   COOLANT_SET
   MOM_force Once M_coolant
   MOM_do_template coolant_off
}


#=============================================================
proc MOM_coolant_on { } {
#=============================================================
   COOLANT_SET
}


#=============================================================
proc MOM_cutcom_off { } {
#=============================================================
   CUTCOM_SET
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
         global mom_warning_info
         set mom_warning_info "CUTCOM register $mom_cutcom_adjust_register must be within the range between 1 and 99"
         MOM_catch_warning
      }
   }
}


#=============================================================
proc MOM_cycle_off { } {
#=============================================================
   PB_CMD_mcall_off
}


#=============================================================
proc MOM_cycle_plane_change { } {
#=============================================================
  global cycle_init_flag

   set cycle_init_flag TRUE
   PB_CMD_mcall_off
   PB_CMD_CYCLE_CHANGE_ANGLE
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_delay { } {
#=============================================================
   PB_DELAY_TIME_SET
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


   PB_CMD_cycle_init
   PB_CMD_CYCLE90_move
   MOM_force Once X Y
   MOM_do_template cycle_drill_2
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


   PB_CMD_cycle_init
   PB_CMD_coolant_init
   MOM_force Once X Y
   MOM_do_template cycle_drill_break_chip
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


   PB_CMD_cycle_init
   PB_CMD_coolant_init
   MOM_force Once X Y
   MOM_do_template cycle_drill_deep
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


   PB_CMD_cycle_init
   PB_CMD_coolant_init
   MOM_force Once X Y
   MOM_do_template cycle_drill_dwell
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_end_of_path { } {
#=============================================================

   if [llength [info commands PB_CMD_kin_end_of_path] ] {
      PB_CMD_kin_end_of_path
   }

   PB_CMD_cancel_rot
   PB_CMD_lock_off
   PB_CMD_Rotate_enable_operations
   PB_CMD_Init_vars_in_end
   PB_CMD_REDIRECT_END
   global mom_sys_in_operation
   set mom_sys_in_operation 0
}


#=============================================================
proc MOM_first_move { } {
#=============================================================
  global mom_feed_rate mom_feed_rate_per_rev mom_motion_type
  global mom_kin_max_fpm mom_motion_event
   COOLANT_SET ; CUTCOM_SET ; SPINDLE_SET ; RAPID_SET
   PB_CMD_zsave
   PB_CMD_force
   catch {MOM_$mom_motion_event}
}


#=============================================================
proc MOM_first_tool { } {
#=============================================================
  global mom_tool_change_type mom_manual_tool_change
  global mom_sys_first_tool_handled

  # First tool only gets handled once
   if { [info exists mom_sys_first_tool_handled] } {
      MOM_tool_change
      return
   }

   set mom_sys_first_tool_handled 1

   PB_TURRET_HEAD_SET
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
proc MOM_from_move { } {
#=============================================================
  global mom_feed_rate mom_feed_rate_per_rev  mom_motion_type mom_kin_max_fpm
   COOLANT_SET ; CUTCOM_SET ; SPINDLE_SET ; RAPID_SET
   PB_CMD_check_from
}


#=============================================================
proc MOM_gohome_move { } {
#=============================================================
   MOM_rapid_move
}


#=============================================================
proc MOM_initial_move { } {
#=============================================================
  global mom_feed_rate mom_feed_rate_per_rev mom_motion_type
  global mom_kin_max_fpm mom_motion_event
   COOLANT_SET ; CUTCOM_SET ; SPINDLE_SET ; RAPID_SET
   PB_CMD_zsave

  global mom_programmed_feed_rate
   if { [EQ_is_equal $mom_programmed_feed_rate 0] } {
      MOM_rapid_move
   } else {
      MOM_linear_move
   }
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

   PB_CMD_before_M128
   PB_CMD_LN_vs_L
   PB_CMD_CYCLE90_move
   MOM_do_template linear_move_1
   PB_CMD_test_5axis
   PB_CMD_test_G2
}


#=============================================================
proc MOM_load_tool { } {
#=============================================================
  global mom_tool_change_type mom_manual_tool_change
   PB_TURRET_HEAD_SET
}


#=============================================================
proc MOM_opstop { } {
#=============================================================
   MOM_do_template opstop
}


#=============================================================
proc MOM_prefun { } {
#=============================================================
   PB_CMD_various_prefun_numbers
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


   set aa(0) X ; set aa(1) Y ; set aa(2) Z
   RAPID_SET
   PB_CMD_before_M128
   PB_CMD_LN_vs_L
   set rapid_traverse_blk {G_motion G_cutcom X Y Z fourth_axis fifth_axis TX TY TZ}
   set rapid_traverse_mod {}
   PB_SET_RAPID_MOD $rapid_traverse_mod $rapid_traverse_blk aa mod_traverse
   PB_FORCE Once $mod_traverse
   MOM_do_template rapid_traverse
   PB_CMD_test_5axis_alt
   PB_CMD_save_last_z
   PB_CMD_custom_command_2
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
proc MOM_spindle_off { } {
#=============================================================
   MOM_do_template spindle_off
}


#=============================================================
proc MOM_spindle_rpm { } {
#=============================================================
   SPINDLE_SET
}


#=============================================================
proc MOM_start_of_path { } {
#=============================================================
  global mom_sys_in_operation
   set mom_sys_in_operation 1

  global first_linear_move ; set first_linear_move 0
   TOOL_SET MOM_start_of_path

   if [llength [info commands PB_CMD_kin_start_of_path] ] {
      PB_CMD_kin_start_of_path
   }

   PB_CMD_for_massiv
   MOM_set_seq_off
   PB_CMD_Operation_name
   PB_CMD_tool_datas_for_oper
   PB_CMD_REDIRECT_OPER
   MOM_set_seq_on
   PB_CMD_for_prefun2
   PB_CMD_start_of_operation_force
}


#=============================================================
proc MOM_stop { } {
#=============================================================
   PB_CMD_before_m0
   MOM_force Once M_coolant
   MOM_do_template stop_1
   MOM_force Once M_spindle
   MOM_do_template stop_2
   MOM_force Once M
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


   PB_CMD_cycle_init
   PB_CMD_coolant_init
   MOM_force Once X Y
   MOM_do_template cycle_tap
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_tool_change { } {
#=============================================================
  global mom_tool_change_type mom_manual_tool_change
   PB_TURRET_HEAD_SET
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
proc MOM_tracking_point_change { } {
#=============================================================
   PB_CMD_Tracking_change
}


#=============================================================
proc PB_approach_move { } {
#=============================================================
}


#=============================================================
proc PB_auto_tool_change { } {
#=============================================================
   PB_CMD_before_m9
   MOM_do_template return_motion
   PB_CMD_Mash_zero
   PB_CMD_tool_datas
   MOM_force Once M
   MOM_do_template auto_tool_change
   PB_CMD_init_after_tool
   PB_CMD_for_prefun
   PB_CMD_start_of_operation_force
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
   PB_CMD_force
}


#=============================================================
proc PB_first_linear_move { } {
#=============================================================
   PB_CMD_force
}


#=============================================================
proc PB_manual_tool_change { } {
#=============================================================
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

   PB_CMD_init_dll
   PB_CMD_Init_vars1
   PB_CMD_for_prefun
   PB_CMD_input_zero
   PB_CMD_INIT_VARS_TURN
   PB_CMD_init_tool_var
   PB_CMD_Path_of_Posts_files
   PB_CMD_head
   PB_CMD_head_1
}


#=============================================================
proc PB_CMD_CYCLE90_move { } {
#=============================================================
global mom_type_90 mom_diam_rezbi_90 mom_diam_otv_90 mom_shag_rezbi_90 mom_dir_90 mom_cycle_feed_to_pos feed

if [info exist mom_type_90] {
   	set mom_diam_rezbi_90 [format "%.3f" $mom_diam_rezbi_90]
	set mom_diam_otv_90 [format "%.3f" $mom_diam_otv_90]
	set mom_shag_rezbi_90 [format "%.3f" $mom_shag_rezbi_90]
	#if {$mom_type_90 == "OUTSIDE"} {
	#set mom_type_90 1
	#} else {
	#set mom_type_90 0
	#}
	#if {$mom_dir_90 == "CCW"} {
	#set mom_dir_90 3
	#} else {
	#set mom_dir_90 2
	#}

	set feed [format "%.3f" $feed]
	set mom_cycle_feed_to_pos(0) [format "%.3f" $mom_cycle_feed_to_pos(0)]
	set mom_cycle_feed_to_pos(1) [format "%.3f" $mom_cycle_feed_to_pos(1)]
	MOM_force once G_motion_cycle
    	MOM_do_template cycle_block_90
	#MOM_output_literal "MCALL"
}
}


#=============================================================
proc PB_CMD_CYCLE_CHANGE_ANGLE { } {
#=============================================================

global mom_rotary_delta_4th mom_rotary_delta_5th mom_pos mom_cycle_rapid_to_pos

if {$mom_rotary_delta_4th != 0 || $mom_rotary_delta_5th != 0} {
PB_CMD_Otskok_cycle
#MOM_output_literal "ROT Z=SHIFT_ANGLE"
EXTN_DMG "37"
EXTN_DMG "12"
set mom_pos(2) $mom_cycle_rapid_to_pos(2)
EXTN_DMG "20"
#PB_CMD_cycle_init
MOM_force once X Y Z 
}
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
proc PB_CMD_G68_zapret_uglov { } {
#=============================================================
global G68 mom_tool_axis oper mom_sys_lock_status
global mom_warning_info1 path var tool_vec_check

if {$G68 == 1} {
set mom_tool_axis(0) 0
set mom_tool_axis(1) 0
set mom_tool_axis(2) 1
}

if {$mom_sys_lock_status == "ON"} {
MOM_suppress once TX TY TZ
MOM_force once fourth_axis fifth_axis
} else {
#MOM_suppress once fifth_axis
#MOM_force once TX TY TZ
}
}


#=============================================================
proc PB_CMD_INIT_VARS_TURN { } {
#=============================================================
global tool_with_on 
set tool_with_on 0

global first_flag
set first_flag 0

global orient_marker
set orient_marker "00"

global prev_spindle_speed
set prev_spindle_speed 0

global prev_maximum_rpm
set prev_maximum_rpm 0

global prev_tool
set prev_tool 0

global prev_group_name 
set prev_group_name ""

global mom_left_spindle
set mom_left_spindle "ACTIVE"

global mom_which_spindle
set mom_which_spindle "ЛЕВЫЙ"

global redirect_have
#set redirect_have 1

global mom_warning_info tools_info tools_length kol var
set mom_warning_info ""
set tools_info ""
set tools_length ""
set kol 1
uplevel #0 {
set var 0
}

global mom_sys_group_output
set mom_sys_group_output "OFF"

global cutcom_on mom_sys_millturn_yaxis mom_head_spindle_axis

set cutcom_on 0

#set mom_sys_millturn_yaxis true

global transmit

set transmit 0

global mom_perehvat_was 
set mom_perehvat_was 0

global mom_perehvat_was2
set mom_perehvat_was2 0

global mom_perehvat_was3
set mom_perehvat_was3 0

global mom_perehvat_was_obr
set mom_perehvat_was_obr 0

global mom_lock_axis
set mom_lock_axis ""

global mom_sys_lock_status
set mom_sys_lock_status "OFF"

global spindle_on
set spindle_on 0


global prev_spindle_speed
set prev_spindle_speed 0

global prev_maximum_rpm
set prev_maximum_rpm 0

global count_angle
set count_angle 1

global rotate_was
set rotate_was 0

global prev_ugol
set prev_ugol 0

global prev_ugol1
set prev_ugol1 0

global polar_flag polar_turned
set polar_flag 0
set polar_turned 0

global output_spindle_turned
set output_spindle_turned 0

global count_oper
set count_oper 1

global mom_number_channel
set mom_number_channel 1

global tool_init
set tool_init 0

global approach
set approach 0

global G43_4_flag
set G43_4_flag 0

global G68
set G68 0

global G68_turn
set G68_turn 0

global M128_init
set M128_init 0

#From TURN Post
#########################
global tool_with_on 
set tool_with_on 0

global first_flag
set first_flag 0

global orient_marker
set orient_marker "00"

global spindle_rpm_add
set spindle_rpm_add 0

global mom_sys_group_output
set mom_sys_group_output "OFF"

global M70_turn
set M70_turn 0
########################

global cycle_inited
set cycle_inited 0

global coolant_inited
set coolant_inited 0

##############
}


#=============================================================
proc PB_CMD_Init_vars1 { } {
#=============================================================
global G10 mom_warning_info G68 mom_contact_status tools_info tools_length kol

global 5axis_flag 5axis_flag2 5axis_flag_for_end eng_flag Clear_G43_flag

global mom_kin_4th_axis_min_limit 
global mom_kin_4th_axis_max_limit tool_vec_check G54_flag

set mom_kin_4th_axis_min_limit -0.0001
set mom_kin_4th_axis_max_limit 180.1
MOM_reload_kinematics

global rotate_was
set rotate_was 0

global cycle_inited
set cycle_inited 0

global mom_prev_mcs_goto
set mom_prev_mcs_goto(0) 9999

global y_min_limit
set y_min_limit -290

global helix
set helix 0

global circle_too
set circle_too 0

global 2D_machining
set 2D_machining 0

global B_limit
set B_limit 90

set G54_flag 0

global rot_y z_save perehod first_5a_rot
set rot_y 0
set z_save 9999
set perehod 0
set first_5a_rot 0

set G10 0

set mom_warning_info ""

set G68 0

set mom_contact_status "OFF"
set tool_vec_check 0

global tool_geting
#set tool_geting 0

global mom_msys_origin nol1 nol2 nol3

set 5axis_flag ""
set Clear_G43_flag ""
set 5axis_flag2 0
set 5axis_flag_for_end 0
set eng_flag 0

set nol1 $mom_msys_origin(0)
set nol2 $mom_msys_origin(1)
set nol3 $mom_msys_origin(2)

global G68_turn G43_4_flag G43_4_prev M128_init
set G68_turn 0
set G43_4_flag 0
set G43_4_prev 0
set M128_init 0

global X_prev_feed Z_prev_feed
global X_prev_rap Z_prev_rap

set X_prev_feed 9999
set Z_prev_feed 9999
set X_prev_rap 9999
set Z_prev_rap 9999

global Z_prev X_prev
set Z_prev 9999
set X_prev 9999

global B_prev C_prev
set B_prev 0
set C_prev 0

global podvorot_in_begin
set podvorot_in_begin 0

global C_non_zero Rotate_enable Rotate_oper
global Pervaya_operaciya

set C_non_zero 0
set Rotate_enable 1
set Rotate_oper ""
set Pervaya_operaciya 1

global korr_number
set korr_number 1

global coolant_inited
set coolant_inited 0

global first_time
set first_time 1

global count_metka
set count_metka 1

global prev_group_name 
set prev_group_name ""

global new_array 
set new_array ""

global G68_init
set G68_init 0

global cycle_init
set cycle_init 0

MOM_disable_address TX TY TZ
MOM_disable_address fourth_axis fifth_axis

global message_was
set message_was 0

global massiv_turned
set massiv_turned 0

global pause_on
set pause_on 0
}


#=============================================================
proc PB_CMD_Init_vars_in_end { } {
#=============================================================
global mom_sys_lock_status tool_with_on first_after_tool G43_4_prev

set mom_sys_lock_status "OFF"

global rotate_was eng_flag
set rotate_was 0

set first_after_tool 1

global cycle_inited
set cycle_inited 0

global G68_turn
set G68_turn 0

global G43_4_flag
set G43_4_prev $G43_4_flag
set G43_4_flag 0

global mom_prev_mcs_goto
set mom_prev_mcs_goto(0) 9999

set eng_flag 0


global rot_y z_save first_5a_rot

#set rot_y 0
set first_5a_rot 0
set z_save 9999

global 2D_machining
set 2D_machining 0

global mom_prev_pos
set mom_prev_pos(0) 9999
set mom_prev_pos(1) 9999

global podvorot_in_begin
set podvorot_in_begin 0

global korr_number
set korr_number 1

global mom_type_90 mom_diam_rezbi_90 mom_diam_otv_90 mom_shag_rezbi_90 mom_dir_90 mom_cycle_feed_to_pos feed
if [info exist mom_type_90] {
unset mom_type_90
}

global G68_init
set G68_init 0

global cycle_init
set cycle_init 0

global mom_otskok_off
if [info exist mom_otskok_off] {
unset mom_otskok_off
}

global message_was
set message_was 0

global coolant_inited
set coolant_inited 0

global mom_next_oper_has_tool_change mom_coolant_status

if {$mom_next_oper_has_tool_change == "YES"} {
set mom_coolant_status UNDEFINED
}
}


#=============================================================
proc PB_CMD_LN_vs_L { } {
#=============================================================
global G43_4_flag mom_pos mom_mcs_goto mom_contact_normal pos 
global mom_out_angle_pos
global mom_pos mom_calc_pos
global mom_rotary_delta_4th mom_rotary_delta_5th


if {$G43_4_flag == 1} {

#PB_CMD_podvorot_5axis

set mom_pos(0) $mom_mcs_goto(0)
set mom_pos(1) $mom_mcs_goto(1)
set mom_pos(2) $mom_mcs_goto(2)

MOM_force ONCE X Y Z TX TY TZ

#MOM_output_literal "mom_rotary_delta_4th = $mom_rotary_delta_4th  mom_rotary_delta_5th = $mom_rotary_delta_5th !!!!!!!!!!!!!!!!!!"
 
if ![info exists mom_contact_normal] {
#set mom_contact_normal(0) 0
#set mom_contact_normal(1) 0
#set mom_contact_normal(2) 0
MOM_suppress Always NX NY NZ
}

if [info exists mom_contact_normal] {
MOM_force Always NX NY NZ
}

}
}


#=============================================================
proc PB_CMD_M128_zapret { } {
#=============================================================
global G43_4_flag

if {$G43_4_flag != 1} {
	MOM_suppress ONCE G_adjust_43_4 H
}
}


#=============================================================
proc PB_CMD_M129 { } {
#=============================================================
global G43_4_flag M128_init mom_kin_4th_axis_plane mom_kin_4th_axis_vector B_limit 


if {$G43_4_flag == 1} {

set mom_kin_4th_axis_plane "ZX"
set mom_kin_4th_axis_vector(0) 0
set mom_kin_4th_axis_vector(1) 1
set mom_kin_4th_axis_vector(2) 0

MOM_reload_kinematics
set B_limit 180

#MOM_output_literal "M129"

PB_CMD_Rotate_emulation
}

set M128_init 0
}


#=============================================================
proc PB_CMD_Mash_zero { } {
#=============================================================
global mom_pos

MOM_output_literal "G0 G153 Z-1 D0"
}


#=============================================================
proc PB_CMD_Messages { } {
#=============================================================
global mom_warning_info path var

MOM_output_to_listing_device $mom_warning_info

set user_exe_file "${path}/mesbox.exe"
if { [file exists $user_exe_file] } {
set var [exec $user_exe_file $mom_warning_info]
}
MOM_catch_warning
#MOM_abort $mom_warning_info
}


#=============================================================
proc PB_CMD_Operation_name { } {
#=============================================================
global mom_operation_name oper mom_operation_type G43_4_flag cutting_was mom_kin_arc_output_mode
global mom_kin_helical_arc_output_mode mom_kin_4th_axis_plane mom_kin_4th_axis_vector

set oper $mom_operation_name
MOM_output_literal "   "
MOM_output_literal "MSG (\"$oper\")"



switch $mom_operation_type {
	"Variable-axis Surface Contouring"   	{set G43_4_flag 1}
	"Variable-axis Z-Level Milling" 		{set G43_4_flag 1}
	"Sequential Mill Main Operation" 		{set G43_4_flag 1}
}

if {$G43_4_flag == 1} {
set mom_kin_arc_output_mode "LINEAR"
set mom_kin_helical_arc_output_mode "LINEAR"
MOM_reload_kinematics

#set mom_kin_4th_axis_plane "Other"
#EXTN_DMG "17"
#MOM_reload_kinematics

}

set cutting_was 0
}


#=============================================================
proc PB_CMD_Otskok_cycle { } {
#=============================================================
global zero_number korr_number mom_otskok_off
MOM_output_literal "CYCLE800"
if ![info exist mom_otskok_off] {
MOM_output_literal "G0 G153 Z-1 D0"
}
PB_CMD_T_cutter
MOM_output_literal "G$zero_number D$korr_number"
}


#=============================================================
proc PB_CMD_PODVOROT_MY { } {
#=============================================================
global eng_flag mom_rotary_delta_4th mom_rotary_delta_5th first_time_A message_was
global zero_number new_A new_C mom_out_angle_pos mom_prev_out_angle_pos M128_init Podv_A
global mom_podvorot_off_UBZ B_form C_form

global mom_kin_retract_distance mom_kin_reengage_distance


if {$M128_init == 1} {
	#MOM_output_literal ";mom_rotary_delta_4th = $mom_rotary_delta_4th mom_rotary_delta_5th = $mom_rotary_delta_5th"
	set B_form [format "%.3f" $mom_prev_out_angle_pos(0)]
	set C_form [format "%.3f" $mom_prev_out_angle_pos(1)]

	set podv_need 0
	set Podv_A 0
	
	if {($mom_rotary_delta_5th > 100) || ($mom_rotary_delta_5th < -100)} {
		set podv_need 1
	}


	if {$podv_need == 1} {
	 		if {$message_was != 1} { 
			#EXTN_rtv_mom_cp_part_attr "INPUT_RETRACT"
			EXTN_DMG "21" 
			set message_was 1
			}
            		#EXTN_rtv_mom_cp_part_attr "INPUT_RETRACT_DIST"
			EXTN_DMG "22"
            		#MOM_output_literal "Before!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
            		
		if {$Podv_A == 1} {
			set new_A [expr -1*$mom_prev_out_angle_pos(0)]

			if {$mom_out_angle_pos(1) <= 0} {
			set new_C [expr $mom_prev_out_angle_pos(1)-180]
			} else {
			set new_C [expr $mom_prev_out_angle_pos(1)+180]
			}

			if {[expr $new_C - $mom_out_angle_pos(1)] > 90} {
			set new_C [expr -1*$new_C]
			set new_A [expr -1*$new_A]
			}
			if {[expr $new_C - $mom_out_angle_pos(1)] < -90} {
			set new_C [expr -1*$new_C]
			set new_A [expr -1*$new_A]
			}
		} else {
			if {$mom_prev_out_angle_pos(1) <= 0} {
			set new_C [expr $mom_prev_out_angle_pos(1)+360]
			} else {
			set new_C [expr $mom_prev_out_angle_pos(1)-360]
			}
			set new_A [expr 1*$mom_prev_out_angle_pos(0)]
		}
			MOM_output_literal ";VNIMANIE - AVTOPODVOROT !!!!!!!!!"
	    		MOM_do_template linear_move_before_podv_infeed
	    		MOM_do_template linear_move_before_podv
	    		#PB_CMD_retract_move
			#MOM_output_literal "M129"
   			#PB_CMD_OTSKOK_PODV         		
			#MOM_output_literal "L Z825 R0 FMAX M91"
			#MOM_output_literal "L Y-150 R0 FMAX M91"
            		#MOM_output_literal "M127"
            		#MOM_output_literal "L A0 F10000."
            		#MOM_suppress once fourth_axis 
            		#set feed 10000
			#MOM_force once fifth_axis
            		#MOM_do_template rot_linear_podv
            		#MOM_force once fourth_axis
            		#MOM_do_template rot_linear_podv
			#MOM_output_literal "M126"
            		#MOM_output_literal "M128"
			MOM_output_literal "G91 C180"
			MOM_output_literal "G90"
            		MOM_force once G_motion X Y F
			MOM_suppress once Z
            		MOM_do_template linear_move_podv
            		MOM_force once Z
            		MOM_do_template linear_move_podv
			MOM_force once G_motion X Y Z F 
			MOM_do_template linear_move_prev
			MOM_force once G_motion X Y Z F 
			MOM_do_template linear_move_prev_infeed
			MOM_output_literal ";KONEC - AVTOPODVOROTA !!!!!!!!!"
		}
		#set first_time_A 0
}
}


#=============================================================
proc PB_CMD_PROGRAMMED_OTSKOK_MASSIVE { } {
#=============================================================
global mom_otskok_off mom_massive_otskok prev_massive_otskok


if {$prev_massive_otskok == "FALSE"} {

MOM_output_literal "G0 G153 Z-1 D0"

} else {

}
}


#=============================================================
proc PB_CMD_Path_of_Posts_files { } {
#=============================================================
global mom_output_file_basename mom_operation_name mom_group_name mom_logname
global mom_date mom_machine_name mom_warning_info mom_part_name path path_flag mom_definition_file_name

set str "\n Постпроцессор для станка DMU 60 evo система Siemens 840D \n\n"
MOM_output_to_listing_device $str  ;

set path $mom_definition_file_name
for { set i 0 } { $i < [string length $path] } { set i [expr $i+1]} {
	if {[string index $path $i] == [string index $path 2]} {
	     set path_flag $i
	}
}
set path [string range $path 0 $path_flag]

set is_name_ok [regexp -nocase -- {[a-z]} $mom_output_file_basename]
   if {$is_name_ok == "1"} {
      #set mom_warning_info "\n\n\tПредупреждение: \n\t Имя файла программы - должно содержать только цифры \n\n"
      #MOM_output_to_listing_device $mom_warning_info  ;   MOM_catch_warning ;
   }
   #PB_CMD_kin_set
}


#=============================================================
proc PB_CMD_REDIRECT_END { } {
#=============================================================
global mom_output_file_full_name ptp_file_name tmp2_file_name count_oper
global mom_output_file_directory mom_output_file_basename output_extn line
global mom_subroutine_on

if [info exist mom_subroutine_on] {
if {$mom_subroutine_on == "ACTIVE"} {


MOM_output_literal "M17"


set tmp3_file_name "${tmp2_file_name}_"

if {[file exists $tmp3_file_name]} {
	MOM_remove_file $tmp3_file_name
}

MOM_close_output_file $tmp2_file_name
file rename $tmp2_file_name $tmp3_file_name
set ifile [open $tmp3_file_name r]
set ofile [open $tmp2_file_name w]

#puts $ofile ";($line)"
set buf ""
while { [gets $ifile buf] > 0 } {
puts $ofile $buf
}

close $ifile
close $ofile
MOM_remove_file $tmp3_file_name
MOM_open_output_file $tmp2_file_name


MOM_close_output_file $tmp2_file_name
MOM_open_output_file $ptp_file_name

set count_oper [expr $count_oper + 1]

#MOM_output_literal "REDIRECT END!!!!!!!!!!ptp_file_name = $ptp_file_name"

}
}
}


#=============================================================
proc PB_CMD_REDIRECT_OPER { } {
#=============================================================
global mom_output_file_full_name ptp_file_name tmp2_file_name count_oper
global mom_output_file_directory mom_output_file_basename output_extn oper mom_seqnum
global mom_subroutine_on line2 mom_operation_name

if [info exist mom_subroutine_on] {
#MOM_output_literal "mom_subroutine_on = $mom_subroutine_on!!!!!!!!!!!!!!!!!!"
if {$mom_subroutine_on == "ACTIVE"} {
MOM_output_literal "$line2"

#set my_output_file_basename "OPER_"
#append my_output_file_basename "$count_oper"
#set my_extn ".spf"

set my_output_file_basename "$mom_operation_name"
#append my_output_file_basename "$count_oper"
set my_extn ".spf"

set tmp2_file_name ${mom_output_file_directory}${my_output_file_basename}${my_extn}
#MOM_output_literal "tmp2_file_name = $tmp2_file_name!!!!!!!!!!!!!!!!!!"

MOM_set_seq_off
MOM_output_literal "N[expr $count_oper+2] EXTCALL \"$my_output_file_basename\""
MOM_set_seq_on

#MOM_output_literal "REDIRECT!!!!!!!!!!ptp_file_name = $ptp_file_name"

if {[file exists $tmp2_file_name]} {
	MOM_remove_file $tmp2_file_name
}

MOM_close_output_file $ptp_file_name
MOM_open_output_file $tmp2_file_name

MOM_set_seq_off
MOM_output_literal ";(\"$oper\")"
MOM_set_seq_on
set mom_seqnum 10
MOM_reload_variable mom_seqnum 

}
}
}


#=============================================================
proc PB_CMD_Rotate_emulation { } {
#=============================================================
global mom_rotate_axis_type mom_rotation_angle mom_rotation_mode
global mom_out_angle_pos G28_rot


set mom_rotate_axis_type CAXIS
set mom_rotation_mode "ABSOLUTE"
set mom_rotation_angle 0

#MOM_suppress Once fourth_axis fifth_axis
MOM_rotate
}


#=============================================================
proc PB_CMD_Rotate_enable { } {
#=============================================================
global Rotate_oper var path mom_warning_info mom_podvorot_enable

if ![info exist mom_podvorot_enable] {
if {$Rotate_oper != ""} {
	set mom_warning_info "Операция(и) ''$Rotate_oper'' выполнены при ненулевом начальном положении поворотного стола С" 
	append mom_warning_info "\nДанные операции являются двух или трех-осевыми и если используется подворот, то начальное положение должно быть 0" 
	append mom_warning_info "\nДля того, чтобы в управляющей программе была сформирована данная траектория при положении стола С равным нулю,"
	append mom_warning_info "\nнужно в конце предыдущей операции в Unigraphics в меню Machines - End-Of-Path Commands - Edit"
	append mom_warning_info "\nдобавить команду Rotate и выбрав С-axis задать значение угла равным 0 "
	
	MOM_output_to_listing_device $mom_warning_info  ;   MOM_catch_warning ;
	PB_CMD_Messages
}
}
}


#=============================================================
proc PB_CMD_Rotate_enable_operations { } {
#=============================================================
global Rotate_enable C_non_zero oper

global Rotate_oper


global mom_out_angle_pos 


if {$mom_out_angle_pos(1) != 0} {
set C_non_zero 1
} else {
set C_non_zero 0
}

if {($Rotate_enable == 1) && ($C_non_zero == 1)} {
set Rotate_oper [append Rotate_oper " " $oper]
}


set Rotate_enable 1
}


#=============================================================
proc PB_CMD_T_cutter { } {
#=============================================================
global mom_tool_type mom_tool_adjust_register korr_number oper

if {$mom_tool_type == "Milling Tool-T Cutter"} {
set korr_number $mom_tool_adjust_register
#MOM_output_literal "$mom_tool_adjust_register !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
if {($mom_tool_adjust_register != 1) && ($mom_tool_adjust_register != 2)} {

	set mom_warning_info "В операции ''$oper'' используется дисковая фреза." 
	append mom_warning_info "\n "
	append mom_warning_info "\nДля этой фрезы регистр настройки должен быть 1 или 2!!!" 
	append mom_warning_info "\n "	
	MOM_output_to_listing_device $mom_warning_info 
	PB_CMD_Messages
	MOM_abort "Введите правильный регистр настройки!!!!!!" 
}


}
}


#=============================================================
proc PB_CMD_Tracking_change { } {
#=============================================================
#MOM_output_literal "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
global zero_number korr_number

if {$korr_number == 1} {
set korr_number [expr $korr_number + 1] 
} else {
set korr_number [expr $korr_number - 1]
}
MOM_output_literal "G$zero_number D$korr_number"
}


#=============================================================
proc PB_CMD_Traori { } {
#=============================================================
global mom_cutcom_adjust_register zero_number korr_number

MOM_output_literal "TRAORI"
#MOM_output_literal "ORIVECT"

PB_CMD_T_cutter
MOM_output_literal "G$zero_number D$korr_number"
#MOM_output_literal "CYCLE832(0.01,212101)"

MOM_output_literal "CYCLE832(0.01,_ORI_FINISH,0.1)"


set puifr [expr $zero_number - 53]


#MOM_output_literal "\$P_IFRAME=\$P_UIFR\[$puifr\]"
#MOM_output_literal "\$P_PFRAME=CTRANS(C,(-1)*SHIFT_ANGLE):CROT(Z,SHIFT_ANGLE)"

MOM_output_literal "ROT Z=SHIFT_ANGLE"
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
proc PB_CMD_before_M128 { } {
#=============================================================
global G43_4_flag M128_init mom_out_angle_pos mom_kin_4th_axis_plane
global mom_kin_4th_axis_vector B_limit

if {$M128_init == 1} {
MOM_enable_address fourth_axis fifth_axis
}


if {($G43_4_flag == 1) && ($M128_init == 0)} {
set mom_kin_4th_axis_plane "Other"
EXTN_DMG "17"
MOM_reload_kinematics
	MOM_output_literal "CYCLE800"
	PB_CMD_for_massiv_1
	PB_CMD_Traori
#	MOM_output_literal "CYCLE832(0.01,212101)"
#	MOM_output_literal "FGROUP(X,Y,Z,B,C)"

#MOM_enable_address fourth_axis fifth_axis
#MOM_enable_address TX TY TZ

set M128_init 1
}
}


#=============================================================
proc PB_CMD_before_m0 { } {
#=============================================================
MOM_output_literal "TRAFOOF"
MOM_output_literal "HOME"
MOM_output_literal "G54 D1"
MOM_output_literal "G0 B0 C=DC(0)"

MOM_force once M_coolant M_spindle M
}


#=============================================================
proc PB_CMD_before_m9 { } {
#=============================================================
global mom_coolant_status


set mom_coolant_status UNDEFINED
}


#=============================================================
proc PB_CMD_before_motion { } {
#=============================================================
  global mom_cutcom_status cutter_comp mom_coolant_status 2D_machining rot_y

  if {![info exist mom_cutcom_status]} {
    set cutter_comp "G40"
  } elseif {$mom_cutcom_status == "OFF"} {
    set cutter_comp "G40"
  } elseif {$mom_cutcom_status == "LEFT"} {
    set cutter_comp "G41"
  } elseif {$mom_cutcom_status == "RIGHT"} {
    set cutter_comp "G42"
  }


#MOM_output_literal "mom_coolant_status = $mom_coolant_status"


global mom_warning_info mom_out_angle_pos mom_kin_4th_axis_min_limit mom_kin_4th_axis_max_limit mom_contact_normal
global mom_spindle_speed oper G43_4_flag G43_4_prev mom_mcs_goto mom_pos first_after_tool mom_rotary_delta_4th
global B_limit DEG2RAD RAD2DEG
global podvorot_in_begin Pervaya_operaciya Rotate_enable mom_tool_axis
global mom_rotary_delta_4th mom_rotary_delta_5th cycle_init G68_init

if {$Pervaya_operaciya != 1} {
   if {[format "%.9f" $mom_tool_axis(2)] != 1} {
   set Rotate_enable 0
  }
} else {
 set Rotate_enable 0
}


if {($mom_warning_info == "unable to determine valid rotary positions") || ($mom_out_angle_pos(0) < $mom_kin_4th_axis_min_limit) || ($mom_out_angle_pos(0) > $mom_kin_4th_axis_max_limit)} {
	set mom_warning_info "Недопустимое положение оси инструмента в операции ''$oper''" 
	append mom_warning_info "\n "
	append mom_warning_info "\n При таком положении оси инструмента станок выходит за лимиты" 
	append mom_warning_info "\n\t по угловому перемещению по оси B"
	#MOM_output_to_listing_device $mom_warning_info 
	PB_CMD_Messages
	MOM_abort "ВЫХОД ЗА ЛИМИТЫ ПО УГЛУ B!!!!!!" 
}

set vector [format "%.9f" $mom_tool_axis(2)]
if {$vector < -0.342020143325668} {
	set mom_warning_info "Недопустимое положение оси инструмента в операции ''$oper''" 
	append mom_warning_info "\n "
	append mom_warning_info "\n Скорее всего данная операция выполняется относительно неприемлемой" 
	append mom_warning_info "\n "
	append mom_warning_info "\n\t  системы координат, либо неправильная траектория"
	MOM_output_to_listing_device $mom_warning_info 
	PB_CMD_Messages
	MOM_abort "Недопустимое положение оси инструмента!!!!!!" 
}

if {$mom_spindle_speed == 0} {
	set mom_warning_info "В операции ''$oper'' не задано значение оборотов шпинделя" 
	MOM_output_to_listing_device $mom_warning_info 
	PB_CMD_Messages
	MOM_abort "Нулевое значение оборотов шпинделя!!!!!!" 
}




#PB_CMD_check_tools



global G68 eng_flag
############
global mom_sys_lock_status mom_lintol_status mom_lintol mom_kin_linearization_tol mom_kin_linearization_flag
global mom_sys_lock_axis mom_sys_lock_value mom_sys_lock_plane mom_lock_axis_value_defined
global mom_motion_type mom_kin_y_axis_limit mom_pos mom_out_angle_pos
global first_flag mom_pos mom_mcs_goto tool_with_on prev_tool_number mom_tool_number mom_motion_event

global mom_kin_arc_output_mode mom_sys_lock_arc_save B_prev C_prev mom_tool_axis



set B_form [format "%.3f" $mom_out_angle_pos(0)]
set C_form [format "%.3f" $mom_out_angle_pos(1)]


if {($B_form > $B_limit)} {
	set mom_warning_info "Недопустимое положение оси инструмента в операции ''$oper''" 
	append mom_warning_info "\n "
	append mom_warning_info "\n Скорее всего данная операция выполняется относительно неприемлемой" 
	append mom_warning_info "\n "
	append mom_warning_info "\n\t\t\t  системы координат"
	#MOM_output_to_listing_device $mom_warning_info 
	PB_CMD_Messages
	MOM_abort "Недопустимое положение оси инструмента!!!!!!" 
}

if {([format "%.9f" $mom_tool_axis(2)] < 0)} {
	set mom_warning_info "Недопустимое положение оси инструмента в операции ''$oper''" 
	append mom_warning_info "\n "
	append mom_warning_info "\n Скорее всего данная операция выполняется относительно неприемлемой" 
	append mom_warning_info "\n "
	append mom_warning_info "\n\t\t\t  системы координат, либо неправильная траектория"
	#MOM_output_to_listing_device $mom_warning_info 
	PB_CMD_Messages
	MOM_abort "Недопустимое положение оси инструмента!!!!!!" 
}

#PB_CMD_podvorot


#Переопределение системы координат для автоматического срабатывания G68 (эксперимент) 
#**************************************************************************************

  global mom_csys_matrix
  global mom_kin_coordinate_system_type from_flag

global X_pov Z_pov G68_turn mom_operation_type mom_motion_type
global G68 C_stanok B_stanok
global mom_cycle_spindle_axis mom_cycle_rapid_to_pos mom_cycle_feed_to_pos mom_cycle_rapid_to mom_cycle_clearance_plane
global mom_cycle_feed_to
global X_prev_feed Z_prev_feed
global X_prev_rap Z_prev_rap
global Z_prev X_prev mom_cutcom_status
global mom_kin_4th_axis_plane mom_kin_4th_axis_vector zero_number korr_number G68_init

#MOM_output_literal "TEST_B=$mom_out_angle_pos(0)"

set B_recalc [format "%.3f" $mom_out_angle_pos(0)]
if {($B_recalc != 0) } {
set G68_turn 1
} 

if {($B_recalc == 0) && ($mom_sys_lock_status != "ON") } {
  set G68_turn 1
}

if {$G68_turn == 1} {
if {$G68 == 0} {
  if {($B_prev != $B_form) || ($C_prev != $C_form)} {
	MOM_output_literal "G0 G153 Z-1 D0"
  }
PB_CMD_for_massiv_1
PB_CMD_T_cutter
MOM_output_literal "G$zero_number D$korr_number"
EXTN_DMG "37"
EXTN_DMG "12"

PB_CMD_coolant_init

if {($podvorot_in_begin == 1)} {
EXTN_DMG "15"
}


set eng_flag 1
set B_prev $B_form
set C_prev $C_form

MOM_disable_address TX TY TZ fourth_axis fifth_axis
	MOM_force once M_spindle S
	MOM_do_template spindle_rpm
MOM_force once S M_spindle X Y Z F

set G68 1
set G68_init 1
set mom_rotary_delta_4th 0
set mom_rotary_delta_5th 0

 }
}

if {($G68_init == 1)} {
if {$mom_operation_type == "Point to Point"} {
if {$cycle_init == 0} {
if {$mom_rotary_delta_4th != 0 || $mom_rotary_delta_5th != 0} {

global zero_number korr_number mom_otskok_off
MOM_output_literal "CYCLE800"
if ![info exist mom_otskok_off] {
MOM_output_literal "G0 G153 Z-1 D0"
}
PB_CMD_T_cutter
MOM_output_literal "G$zero_number D$korr_number"
EXTN_DMG "37"
EXTN_DMG "12"
EXTN_DMG "20"
MOM_force once G_motion
}
}
}
}

PB_CMD_PODVOROT_MY

#*********************************************************************************************
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
proc PB_CMD_cancel_rot { } {
#=============================================================
global mom_sys_coordinate_system_status G68 A_stanok C_stanok 
global G43_4_flag M128_init mom_kin_4th_axis_plane mom_kin_4th_axis_vector B_limit 
global G10 rot_y  2D_machining mom_out_angle_pos Pervaya_operaciya

 

MOM_enable_address X Y

set Pervaya_operaciya 0

#MOM_output_literal "2D_machining = $2D_machining"
#MOM_output_literal "rot_y = $rot_y"

if {$G68 == 1} {
MOM_output_literal "CYCLE800"


  set mom_sys_coordinate_system_status LOCAL

set G68 0
if {$2D_machining == 0} {
set rot_y 0
}
#PB_CMD_Rotate_emulation
}

if {$G43_4_flag == 1} {

set mom_kin_4th_axis_plane "ZX"
EXTN_DMG "16"

MOM_reload_kinematics
set B_limit 90

#MOM_output_literal "G0 G153 Z-1 D0"

#PB_CMD_Rotate_emulation
set rot_y 0
MOM_output_literal "TRAFOOF" 
}



#MOM_output_literal "CYCLE832()"
set M128_init 0

global massiv_turned
if {$massiv_turned != 1} {
MOM_output_literal "M01"
}
}


#=============================================================
proc PB_CMD_check_from { } {
#=============================================================
global mom_from_pos oper mom_warning_info

if [info exist mom_from_pos(0)] {
	set mom_warning_info "В операции ''$oper'' используется движение FROM" 
	append mom_warning_info "\n "
	append mom_warning_info "\n Данный постпроцессор не поддерживает данный вид движений" 
	append mom_warning_info "\n "
	append mom_warning_info "\n\t Следует переделать операцию"
	#MOM_output_to_listing_device $mom_warning_info 
	PB_CMD_Messages
	MOM_abort "СЛЕДУЕТ УБРАТЬ FROM!!!!!!" 
}
}


#=============================================================
proc PB_CMD_check_helix { } {
#=============================================================
global mom_motion_event oper mom_warning_info


if {$mom_motion_event == "helix_move"} {
	set mom_warning_info "В операции ''$oper'' используется врезание по спирали, на наклонной плоскости." 
	append mom_warning_info "\n "
	append mom_warning_info "\n В постпроцессоре не реализовано такое движение через круговую интерполяцию"
	append mom_warning_info "\n "
	append mom_warning_info "\n Следует использовать врезание негеликоидного типа" 
	#MOM_output_to_listing_device $mom_warning_info 
	PB_CMD_Messages
	MOM_abort "Следует использовать врезание негеликоидного типа" 

}
}


#=============================================================
proc PB_CMD_check_tools { } {
#=============================================================
global mom_tool_number oper mom_warning_info mom_tool_cutcom_register

if {$mom_tool_number == 0} {
	set mom_warning_info "В операции ''$oper'' не задан номер инструмента" 
	MOM_output_to_listing_device $mom_warning_info 
	PB_CMD_Messages
	MOM_abort "Нулевое значение номера инструмента!!!!!!" 
}


#global mom_tool_adjust_register mom_tool_number

#if {$mom_tool_adjust_register == 0} {
#set mom_tool_adjust_register $mom_tool_number
#}
}


#=============================================================
proc PB_CMD_circle_direction { } {
#=============================================================
  global mom_arc_direction circle_direction

  if {$mom_arc_direction == "CLW"} {set circle_direction "DR-"}
  if {$mom_arc_direction == "CCLW"} {set circle_direction "DR+"}
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
  MOM_output_literal "M12"
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
  MOM_output_literal "M10"
}


#=============================================================
proc PB_CMD_coolant_init { } {
#=============================================================
global mom_sys_coolant_code() mom_coolant_status coolant_inited


if {$coolant_inited == 0} {
#MOM_output_literal "mom_coolant_status = $mom_coolant_status !!!!!!!!!!!!!!!!!!!!"
if {($mom_coolant_status == "UNDEFINED") || ($mom_coolant_status == "ON")} {
MOM_output_literal "M8"
}

if {$mom_coolant_status == "THRU"} {
MOM_output_literal "M7"
}
#if {$mom_coolant_status == "TAP"} {
#MOM_output_literal "M7 M8"
#}
set coolant_inited 1
}
}


#=============================================================
proc PB_CMD_custom_command { } {
#=============================================================
MOM_output_literal "L C+Q122 B+Q121 R0 F MAX"
}


#=============================================================
proc PB_CMD_custom_command_1 { } {
#=============================================================
MOM_output_literal "M9"
MOM_output_literal "G0 B0 C=DC(0)"
MOM_output_literal "T0"
MOM_output_literal "M6"
}


#=============================================================
proc PB_CMD_custom_command_2 { } {
#=============================================================
MOM_force once G_feed
}


#=============================================================
proc PB_CMD_cutcom_number { } {
#=============================================================
global mom_tool_number
global mom_tool_cutcom_register mom_cutcom_adjust_register



set mom_cutcom_adjust_register 1
}


#=============================================================
proc PB_CMD_cycle_dwell_init { } {
#=============================================================
global mom_cycle_delay

if ![info exist mom_cycle_delay] {
MOM_suppress Once cycle_dwell
#set mom_cycle_delay 0
}

#MOM_do_template fourth_axis_rotate_move
}


#=============================================================
proc PB_CMD_cycle_init { } {
#=============================================================
 global cycle_init_flag mom_cycle_delay mom_feed_retract_value mom_cycle_orient tilda

  global mom_motion_event   mom_cycle_feed_to feed       
  global mom_tool_diameter   mom_cycle_step1   
  global cycle_peck_size cycle_type_number ;# js
  global js_prev_pos			   ;# diy previous Z height
  global js_return_pos			   ;# returnZ incremental from top of hole

  global mom_pos		
  global mom_prev_pos
  global mom_cycle_retract_mode
  global name_cycle
  global mom_coolant_status cycle_inited RPA RPO
  global mom_spindle_speed feed mom_cycle_feed_rate_per_rev
global degression hole_no_5x cycle_init mom_cycle_cam val_cam



#if { (![string compare $cycle_init_flag "TRUE"])} {
  #set cycle_type_number 81 	;# drilling
  #set mom_coolant_status "ON"
  #MOM_force Always G_motion

#MOM_output_literal ";cycle_event - $mom_motion_event"

set cycle_init 1

if {$cycle_inited == 0} {
MOM_force Once G_motion G_feed F
MOM_do_template feed_turn
set cycle_inited 1
}

global mom_cycle_hole_dia  mom_cycle_rapid_to_pos
if [info exist mom_cycle_hole_dia] {
set mom_cycle_rapid_to_pos(2) [expr $mom_cycle_rapid_to_pos(2) + (0.5*$mom_cycle_hole_dia)]
}

global mom_cycle_rapid_to z_safe_plane mom_cycle_step1 mom_cycle_step2 step2
set z_safe_plane [format "%.3f" $mom_cycle_rapid_to]

  if { $mom_motion_event == "drill_move" } {
    set cycle_type_number 81	;# drilling_peck
  }

  if { $mom_motion_event == "drill_deep_move" } {
    set cycle_type_number 831	;# drilling_peck
  }

  if { ($mom_motion_event == "drill_dwell_move")} {
    set cycle_type_number 82	;# drilling&
  }
  if { ($mom_motion_event == "drill_break_chip_move") } {
    set cycle_type_number 830	;# drilling_break_chip
  }

  if {($mom_motion_event == "bore_dwell_move") || ($mom_motion_event == "bore_drag_move") || ($mom_motion_event == "bore_move") } {
    set cycle_type_number 85	;# ream
   }

  if {($mom_motion_event == "bore_no_drag_move") || ($mom_motion_event == "bore_back_move") || ($mom_motion_event == "bore_manual_move")} {
    set cycle_type_number 86	;# bore
  }



  if { $mom_motion_event == "tap_move" } {
    set cycle_type_number 84	;# rigid tapping 
  }

 # peck sizes 
  set cycle_peck_size [expr ($mom_cycle_feed_to*(-1.0))] 	;# single peck size most cycles

  if { $mom_motion_event == "drill_deep_move" || $mom_motion_event == "drill_break_chip_move"} {
    if {($mom_cycle_step1 == 0)} {
      set cycle_peck_size  $mom_tool_diameter ;# default peck  if not set
    } else {
      set cycle_peck_size  $mom_cycle_step1	;# real peck
    } 


   if {$mom_cycle_step2 == 0} {set degression 0}
   if {$mom_cycle_step2 >= $mom_cycle_step1} {set degression 0}
   if {$mom_cycle_step2 < $mom_cycle_step1} {
	set degression [expr -1* $mom_cycle_step2 / $mom_cycle_step1]
	}

  }


  if { $mom_pos(2) != $mom_prev_pos(2) } {
    set cycle_init_flag  "TRUE"
  }


MOM_force Once G_motion_cycle cycle_pullback cycle_surface cycle_plunge cycle_step cycle_step_my cycle_dwell_my cycle_dwell_my_1
 if {![info exists mom_cycle_delay]} {set mom_cycle_delay 0.0}

 if {$cycle_init_flag == "TRUE"} {
	#set js_return_pos [expr $js_prev_pos - $mom_pos(2)] ;# calc incr retract
	#set js_return_pos $js_prev_pos
MOM_force Once G_motion_cycle cycle_pullback cycle_surface cycle_plunge cycle_dwell_my cycle_dwell_my_1 cycle_step cycle_step_my cycle_feedrate
MOM_force once SDIR RPA RPO POSS RTP RFP DP FDPR DAM DTB DTD SDIS FFR RFF

    if {($cycle_type_number == 81)} {
    	MOM_do_template cycle_block_81
	}
    if {($cycle_type_number == 82)} {
    	MOM_do_template cycle_block_82
	}
    if {($cycle_type_number == 830)} {
    	MOM_do_template cycle_block_83_0
	}
    if {($cycle_type_number == 831)} {
    	MOM_do_template cycle_block_83_1
	}
    if {($cycle_type_number == 84)} {
set mom_cycle_feed_rate_per_rev [format "%.3f" $mom_cycle_feed_rate_per_rev]
set mom_spindle_speed [format "%.0f" $mom_spindle_speed]
global mom_spindle_direction M_after once_t
MOM_force once DTB
if ![info exist once_t] {
if {$mom_spindle_direction == "CLW"} {
set mom_spindle_direction "CCLW"
set M_after 3
} else {
set mom_spindle_direction "CLW"
set M_after 4
}
set once_t 1
}
    	MOM_do_template cycle_block_84
	}	
    if {($cycle_type_number == 85)} {
    	MOM_do_template cycle_block_85
	}
    if {($cycle_type_number == 86)} {

set val_cam 0.2
  if [info exists mom_cycle_cam]  {
     if {$mom_cycle_cam != 0} {
     set val_cam 0.$mom_cycle_cam
     } 
   } 



	#if {$mom_cycle_orient == 0} {
	#set RPA 0 
	#set RPO $val_cam
	#} elseif {$mom_cycle_orient == 90} {
	#set RPA $val_cam 
	#set RPO 0
	#} elseif {$mom_cycle_orient == 180} {
	#set RPA 0
	#set RPO -$val_cam
	#} elseif {$mom_cycle_orient == 270} {
	#set RPA -$val_cam
	#set RPO 0
	#} else {
	#set mom_cycle_orient 0
	#set RPA 0 
	#set RPO $val_cam
	#}
	#set mom_cycle_orient [format "%.3f" $mom_cycle_orient]
set RPA $val_cam
set RPO 0
	set mom_cycle_orient [format "%.3f" $mom_cycle_orient]
	MOM_output_literal "SPOS=$mom_cycle_orient"
    	MOM_do_template cycle_block_86
	}

  if { ($mom_motion_event == "bore_drag_move") || ($mom_motion_event == "bore_no_drag_move") || ($mom_motion_event == "bore_back_move") || ($mom_motion_event == "bore_manual_move")} {
	#if { ![info exist mom_cycle_orient]} {set mom_cycle_orient 1} 
	#MOM_force Always user_add_2
	#MOM_do_template cycle_block_214
	}
	MOM_set_seq_on
      }
#}
}


#=============================================================
proc PB_CMD_cycle_plane_change { } {
#=============================================================
# plane change happens when drilling operation goes uphill
# ie - when new hole is higher in Z than prev hole
# retract mode AUTO is return to clearance plane using
# Q204 ( which is like G98 ) so this next bit is only for
# case where cycles stay down 

  global mom_cycle_retract_mode mom_cycle_rapid_to_pos mom_pos

  if { $mom_cycle_retract_mode != "AUTO" } { 
    MOM_force Once  G_motion 	;# not sure why i need this
    MOM_do_template cycle_rapidtoZ	
  }
}


#=============================================================
proc PB_CMD_end_of_alignment_character { } {
#=============================================================
 #  Return sequnece number back to orignal
 #  This command may be used with the command "PM_CMD_start_of_alignment_character"

  global mom_sys_leader saved_seq_num
  set mom_sys_leader(N) $saved_seq_num
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

  MOM_force once fifth_axis
  MOM_do_template fifth_axis_rotate_move
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
proc PB_CMD_for_massiv { } {
#=============================================================
global mom_group_name mom_warning_info oper prev_group_name
global first_group

#MOM_output_literal "mom_group_name = $mom_group_name"
if [info exist first_group] {
	if [info exist mom_first_teeth] {
			if ![info exist mom_group_name] {
			set mom_warning_info "При включенном массивировании постпроцессировать следует" 
			append mom_warning_info "\n "
			append mom_warning_info "\n\n только программные группы!!!" 
			MOM_output_to_listing_device $mom_warning_info 
			PB_CMD_Messages
			MOM_abort "Процессируйте программную группу!!!!!!" 
			}
	}

}


if [info exist mom_group_name] {
if {$mom_group_name != $prev_group_name} {
	PB_CMD_for_prefun_in_end
}
set prev_group_name $mom_group_name
set first_group 1
}
}


#=============================================================
proc PB_CMD_for_massiv_1 { } {
#=============================================================
global zero_number mom_first_teeth mom_end_teeth mom_all_teeth mom_seqnum count_metka massiv_turned
global coolant_inited

global mom_array_ang mom_sdelano massiv_turned_array new_array 
global mom_massive_pause pause_on


PB_CMD_for_prefun3
if [info exist mom_first_teeth] {
set mom_first_teeth [format "%.0f" $mom_first_teeth]
set mom_end_teeth [format "%.0f" $mom_end_teeth]
set mom_all_teeth [format "%.0f" $mom_all_teeth]

MOM_set_seq_off
MOM_output_literal ";***************"
MOM_output_literal ";***************"
MOM_output_literal ";***************"
MOM_output_literal "FIRST_TOOTH=$mom_first_teeth ;(NACHALNII ZUB)"
MOM_output_literal "END_TOOTH=$mom_end_teeth ;(KONECHNII ZUB)"
MOM_output_literal ";***************"
MOM_output_literal ";***************"
MOM_output_literal ";***************"
MOM_output_literal "ALL_TEETH=$mom_all_teeth ;(CHISLO OBRABATIVAEMIH MEST)"
#MOM_set_seq_on
set metka2 $mom_seqnum

MOM_output_literal "METKA$count_metka:"
MOM_output_literal "SHIFT_ANGLE=(360/ALL_TEETH)*(FIRST_TOOTH-1)"
#MOM_output_literal "ROT Z=SHIFT_ANGLE"
MOM_set_seq_on
set count_metka [expr $count_metka + 1]
unset mom_first_teeth mom_end_teeth mom_all_teeth

set coolant_inited 0
set  massiv_turned 1
PB_CMD_coolant_init
if {$mom_massive_pause == TRUE} {
set pause_on 1
} else {
set pause_on 0
}
}

if [info exist mom_array_ang] {
set mom_sdelano [format "%.0f" $mom_sdelano]
#set mom_end [format "%.0f" $mom_all_teeth]

MOM_set_seq_off



for { set nn 0 } { $nn < [llength $mom_array_ang] } { set nn [expr $nn+1]} {
#MOM_output_literal "[lindex $mom_array_ang $nn] !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
if {[expr $nn + 1] == [llength $mom_array_ang]} {
set new_array [append new_array [lindex $mom_array_ang $nn]]
} else {
set new_array [append new_array [lindex $mom_array_ang $nn] ","]
}
}

MOM_output_literal "ARRAY_ANG\[0\]=SET($new_array)"

MOM_output_literal ";***************"
MOM_output_literal ";***************"
MOM_output_literal "SDELANO=$mom_sdelano"
MOM_output_literal "POSLEDNEE=[llength $mom_array_ang]"
MOM_output_literal ";***************"
MOM_output_literal ";***************"

#MOM_set_seq_on
set metka2 $mom_seqnum

MOM_output_literal "METKA$count_metka:"
MOM_output_literal "FOR N_EL=SDELANO TO POSLEDNEE-1"
MOM_output_literal "SHIFT_ANGLE=(ARRAY_ANG\[N_EL\])"
#MOM_output_literal "ROT Z=SHIFT_ANGLE"
MOM_set_seq_on
set count_metka [expr $count_metka + 1]
unset mom_sdelano mom_array_ang 

set coolant_inited 0
set  massiv_turned_array 1
PB_CMD_coolant_init
}
}


#=============================================================
proc PB_CMD_for_prefun { } {
#=============================================================
global flag flag2
set flag 0
set flag2 0
}


#=============================================================
proc PB_CMD_for_prefun2 { } {
#=============================================================
global mom_seqnum metka2 flag2

if {$flag2 == 0} {
set metka2 $mom_seqnum
set flag2 1
}
}


#=============================================================
proc PB_CMD_for_prefun3 { } {
#=============================================================
global mom_seqnum metka1

set metka1 $mom_seqnum
}


#=============================================================
proc PB_CMD_for_prefun_in_end { } {
#=============================================================
global mom_prefun flag metka1 metka2 flag2 mom_prefun_text count_metka pause_on
global mom_first_teeth mom_end_teeth mom_all_teeth massiv_turned mom_massive_otskok
global mom_massive_otskok prev_massive_otskok first_group mom_massive_otskok_array massiv_turned_array
#MOM_output_literal "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"

if [info exist massiv_turned] {
if {$massiv_turned == 1} {

MOM_output_literal "FIRST_TOOTH=FIRST_TOOTH+1"
MOM_output_literal "IF FIRST_TOOTH < (END_TOOTH+1)"
MOM_output_literal "TRAFOOF"

#MOM_output_literal "G0 G153 Z-1 D0"
if {[info exist first_group]} {
PB_CMD_PROGRAMMED_OTSKOK_MASSIVE
}

MOM_output_literal "GOTOB METKA[expr $count_metka-1]"
MOM_output_literal "ENDIF"
MOM_output_literal "SHIFT_ANGLE=0"
MOM_output_literal "ROT"
MOM_output_literal "TRAFOOF" 
if {$pause_on == 1} {
MOM_output_literal "M5"
MOM_output_literal "M9"
MOM_output_literal "M0"
}



set flag 1
set flag2 0

unset massiv_turned
}
}

if [info exist massiv_turned_array] {

if {[info exist first_group]} {
PB_CMD_PROGRAMMED_OTSKOK_MASSIVE
}

MOM_output_literal "ENDFOR"
MOM_output_literal "SHIFT_ANGLE=0"
MOM_output_literal "ROT"



set flag 1
set flag2 0

unset massiv_turned_array
}

if {[info exist mom_massive_otskok]} {
set prev_massive_otskok $mom_massive_otskok
}

if {[info exist mom_massive_otskok_array]} {
set prev_massive_otskok $mom_massive_otskok_array
}
}


#=============================================================
proc PB_CMD_force { } {
#=============================================================
MOM_force once X Y Z
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

  MOM_force once fourth_axis
  MOM_do_template fourth_axis_rotate_move
}


#=============================================================
proc PB_CMD_handle_sync_event { } {
#=============================================================
  global mom_sync_code
  global mom_sync_index
  global mom_sync_start
  global mom_sync_incr
  global mom_sync_max


  set mom_sync_start 	99
  set mom_sync_incr   	1
  set mom_sync_max	199


  if {![info exists mom_sync_code] } {
    set mom_sync_code $mom_sync_start
  }
  
  set mom_sync_code [expr $mom_sync_code + $mom_sync_incr]

  MOM_output_literal "M$mom_sync_code"
}


#=============================================================
proc PB_CMD_head { } {
#=============================================================
global zero_number

MOM_output_literal "G17 G40 G90"
}


#=============================================================
proc PB_CMD_head_1 { } {
#=============================================================
MOM_output_literal "TRAFOOF"
MOM_output_literal "CYCLE800"
MOM_output_literal "G0 G153 Z-1 D0"
}


#=============================================================
proc PB_CMD_init_after_tool { } {
#=============================================================
global first_after_tool mom_next_tool_name mom_tool_diameter mom_next_tool_number

set first_after_tool 1

MOM_output_literal "T=\"$mom_next_tool_name\""

set tool_rad [expr $mom_tool_diameter / 2]
set tool_rad [format "%.3f" $tool_rad]
#MOM_output_literal "OFFN=-$tool_rad"

MOM_output_literal "G0 G153 Z-1 D0"
}


#=============================================================
proc PB_CMD_init_dll { } {
#=============================================================
global external_lib_rtv_mom_component_part_attr mom_event_handler_file_name
global nx_platform

set nx_platform [MOM_ask_env_var UGII_PLATFORM]
set text_32 mom_user_DMG_32.dll
set text_64 mom_user_DMG.dll

#MOM_output_literal "nx_platform = $nx_platform"

for { set nn [string length $mom_event_handler_file_name] } { $nn > 0 } { set nn [expr $nn-1]} {
if {([string index $mom_event_handler_file_name $nn] == "\134")} {
set post_file_name [string range $mom_event_handler_file_name [expr $nn+1] [string length $mom_event_handler_file_name]]
set post_dir_path [string range $mom_event_handler_file_name 0 [expr $nn]]
break
}
}

if {$nx_platform == "x64wnt"} {
append post_dir_path $text_64
} elseif {$nx_platform == "ix8xwnt"} {
append post_dir_path $text_32
} else { 
	set root_ugii_dir [MOM_ask_env_var UGII_ROOT_DIR] ;
	set tested_file ${root_ugii_dir}ugtcl.dll
	if { [file exists $tested_file] } {	
        set checked_size [ file size $tested_file]
        set checked_size [ expr double($checked_size)]
        # 616 960 for 64bit ; 462 848 for 32bit
        if {$checked_size>600000.} { set NX4_64 1 ; } else { set NX4_64 0 ; }
	if {$NX4_64 == 1} {append post_dir_path $text_64} else {append post_dir_path $text_32}
	}
}

set external_lib_DMG $post_dir_path
#MOM_run_user_function $external_lib_rtv_mom_component_part_attr "entry_rtv_mom_cp_part_attr"
MOM_run_user_function $external_lib_DMG "entry_DMG"
}


#=============================================================
proc PB_CMD_init_helix { } {
#=============================================================
global mom_sys_lock_status 
uplevel #0 {
#
# This ommand will be executed automatically at the start of program and
# anytime it is loaded as a slave post of a linked post.
#
# This procedure can be used to enable your post to output helix.
# You can choose from the following options to format the circle 
# block template to output the helix parameters.
#

set mom_sys_helix_pitch_type	"other"  

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



   set mom_kin_helical_arc_output_mode FULL_CIRCLE


   MOM_reload_kinematics



#=============================================================
proc MOM_helix_move { } {
#=============================================================
     global mom_pos_arc_plane
   global mom_sys_cir_vector
   global mom_sys_helix_pitch_type
   global mom_helix_pitch
   global mom_prev_pos mom_pos_arc_center mom_pos
   global PI PP P mom_sys_lock_status
global mom_motion_event oper mom_warning_info helix

if {$mom_sys_lock_status == "ON"} {

set mom_warning_info "В операции ''$oper'' используется врезание по спирали, при блокированной оси Y" 
	append mom_warning_info "\n "
	append mom_warning_info "\n В этой операции следует отключить вывод круговой интерполяции"
	#MOM_output_to_listing_device $mom_warning_info 
	PB_CMD_Messages
	MOM_abort "Следует выключить вывод круговой интерполяции" 
}



   switch $mom_pos_arc_plane {
      XY { MOM_suppress once K ; set cir_index 2 }
      YZ { MOM_suppress once I ; set cir_index 0 }
      ZX { MOM_suppress once J ; set cir_index 1 }
   }

   switch $mom_sys_helix_pitch_type {
      none { }
      rise_revolution { set pitch $mom_helix_pitch }
      rise_radian { set pitch [expr $mom_helix_pitch / ($PI * 2.0)]}
      other {
#
	set pitch [expr $mom_helix_pitch/1]
#	Place your custom helix pitch code here
#
      }
      default { set mom_sys_helix_pitch_type "none" }
   }

   MOM_force once X Y Z

   if {$mom_sys_helix_pitch_type != "none"} {
      MOM_force once I J K

      switch $mom_sys_cir_vector {
         "Vector - Arc Center to Start" {
            set mom_prev_pos($cir_index) $pitch
            set mom_pos_arc_center($cir_index) 0.0
         }
         "Vector - Arc Start to Center" {
	#if {$cir_index != 2} {
        #   set mom_prev_pos($cir_index) 0.0
        #   set mom_pos_arc_center($cir_index) $pitch
        # } elseif {$cir_index == 2} {
	set PP [expr ($mom_prev_pos($cir_index) - $mom_pos($cir_index))/$pitch]
	set P [expr int($PP)]
	MOM_suppress once K
	if {$PP < 0} {
	  set PP [expr $PP*(-1)]
          set P [expr $P*(-1)]
	}
	if {$PP > $P} { set P [expr $P+1] ; }
        #MOM_force once user_add_4
	#}
	}
         "Unsigned Vector - Arc Center to Start" {
            set mom_prev_pos($cir_index) 0.0
            set mom_pos_arc_center($cir_index) $pitch
         }
         "Vector - Absolute Arc Center" {
            set mom_pos_arc_center($cir_index) $pitch
         }
      }
   }


#
# You may need to edit this line if you output more than one block
# or if you have changed the name of your circular_move block template
#

set helix 1
PB_CMD_podvorot_circle
set helix 0
   MOM_do_template circular_move
}

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
proc PB_CMD_init_tool_var { } {
#=============================================================
global tool_i i1 5axis
global start_of_program_flag from_flag tool_numbers


	set start_of_program_flag "0"

	set from_flag 0

	set i1 0
	uplevel #0 {
		set tool_i "0"
		set 5axis 0
		}
set tool_numbers ""
}


#=============================================================
proc PB_CMD_input_zero { } {
#=============================================================
global mom_zero 
global zero_number mom_side side_number

EXTN_DMG "5"

set zero_number [format "%.0f" $mom_zero]
set zero_number $mom_zero
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
      if { [string match "*3_axis_mill*" $mom_kin_machine_type] ||  [string match "*lathe*" $mom_kin_machine_type] } {
return
      }
   }


  # Lock on and not circular move
   global mom_sys_lock_status mom_current_motion
   if { [info exists mom_sys_lock_status] && ![string compare "ON" $mom_sys_lock_status] } {
      if { [info exists mom_current_motion] && [string compare "circular_move" $mom_current_motion] } {

         LOCK_AXIS_MOTION
      }
   }


  # Error and linear move
   global mom_sys_rotary_error mom_motion_event
   if { [info exists mom_sys_rotary_error] && [info exists mom_motion_event] } {
      if { $mom_sys_rotary_error != 0 && ![string compare "linear_move" $mom_motion_event] } {

         ROTARY_AXIS_RETRACT
      }
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
proc PB_CMD_kin_init_mill_turn { } {
#=============================================================
}


#=============================================================
proc PB_CMD_kin_init_mill_xzc { } {
#=============================================================
}


#=============================================================
proc PB_CMD_kin_init_new_iks { } {
#=============================================================
   global mom_new_iks_exists

  # Revert legacy dual-head kinematic parameters when new IKS is absent.
   if { ![info exists mom_new_iks_exists] } {
      set ugii_version [string trim [MOM_ask_env_var UGII_VERSION]]
      if { ![string match "v3" $ugii_version] } {

         if { [llength [info commands PB_CMD_revert_dual_head_kin_vars] ] } {
            PB_CMD_revert_dual_head_kin_vars
         }
return
      }
   }

  # Initialize new IKS parameters.
   if { [llength [info commands PB_init_new_iks] ] } {
      PB_init_new_iks
   }

  # Users can provide next command to modify or disable new IKS options.
   if { [llength [info commands PB_CMD_revise_new_iks] ] } {
      PB_CMD_revise_new_iks
   }

  # Revert legacy dual-head kinematic parameters when new IKS is disabled.
   global mom_kin_iks_usage
   if { $mom_kin_iks_usage == 0 } {
      if { [llength [info commands PB_CMD_revert_dual_head_kin_vars] ] } {
         PB_CMD_revert_dual_head_kin_vars
      }
   }
}


#=============================================================
proc PB_CMD_kin_init_probing_cycles { } {
#=============================================================
   set cmd PB_CMD_init_probing_cycles
   if { [llength [info commands "$cmd"]] } {
      eval $cmd
   }
}


#=============================================================
proc PB_CMD_kin_init_rotary { } {
#=============================================================

   global mom_kin_machine_type

   if { [info exists mom_kin_machine_type] } {
      if { [string match "*3_axis_mill*" $mom_kin_machine_type] || [string match "*lathe*" $mom_kin_machine_type] } {
return
      }
   }


   if { [llength [info commands PB_CMD_init_rotary] ] } {
      PB_CMD_init_rotary
   }


#***********
uplevel #0 {


#=============================================================
proc MOM_clamp { } {
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
proc MOM_rotate { } {
#=============================================================
## <rws 04-11-2008>
## If in TURN mode and user invokes "Flip tool aorund Holder" a MOM_rotate event is generated
## When this happens ABORT this event via return
##

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
      global mom_warning_info
      set mom_warning_info "Invalid rotary axis"
      MOM_catch_warning
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


 #     if {$axis == 3} {set prot $prev_angles(0)}
 #     if {$axis == 4} {set prot $prev_angles(1)}
 #     if {$dir == 1 && $mom_out_angle_pos($a) < $prot} {
 #        set mom_out_angle_pos($a) [expr $mom_out_angle_pos($a) + 360.0]
 #     } elseif {$dir == -1 && $mom_out_angle_pos($a) > $prot} {
 #        set mom_out_angle_pos($a) [expr $mom_out_angle_pos($a) - 360.0]
 #     }


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


#<03-02-09 gsl> What is the logic here?
if 1 {
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
   set mom_prev_pos($axis) $ang
   MOM_reload_variable -a mom_prev_pos
   MOM_reload_variable -a mom_out_angle_pos
}


#=============================================================
proc AUTO_CLAMP { } {
#=============================================================
# called by PB_CMD_kin_before_motion

#  This command is used to automatically output clamp and unclamp
#  codes.  This command must be called in the the command
#  << PB_CMD_kin_before_motion >>.  By default this command will
#  output M10 or M11 to do fourth axis clamping and unclamping or
#  M12 or M13 to do fifth axis clamping and unclamping.
#

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

   if { ![info exists clamp_rotary_fourth_status] } {

      PB_CMD_unclamp_fourth_axis
      set clamp_rotary_fourth_status "UNCLAMPED"

   } elseif { $out  == 0 && [string compare "UNCLAMPED" $clamp_rotary_fourth_status] } {

     #<sws 01-09-06> pb350
      PB_CMD_unclamp_fourth_axis
      set clamp_rotary_fourth_status "UNCLAMPED"

   } elseif { $out == 1 && [string compare "CLAMPED" $clamp_rotary_fourth_status] } {

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

   if { ![info exists clamp_rotary_fifth_status] } {

      PB_CMD_unclamp_fifth_axis
      set clamp_rotary_fifth_status "UNCLAMPED"

   } elseif { $out == 0 && [string compare "UNCLAMPED" $clamp_rotary_fifth_status] } {

     #<sws 01-09-06> pb350
      PB_CMD_unclamp_fifth_axis
      set clamp_rotary_fifth_status "UNCLAMPED"

   } elseif { $out == 1 && [string compare "CLAMPED" $clamp_rotary_fifth_status] } {

      PB_CMD_clamp_fifth_axis
      set clamp_rotary_fifth_status "CLAMPED"
   }
}


#=============================================================
proc MOM_lock_axis { } {
#=============================================================
  global mom_sys_lock_value mom_sys_lock_plane
  global mom_sys_lock_axis mom_sys_lock_status

   set status [SET_LOCK axis plane value]
   if { ![string compare "error" $status] } {
      MOM_catch_warning
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
proc MOM_lintol { } {
#=============================================================
   global mom_kin_linearization_flag
   global mom_kin_linearization_tol
   global mom_lintol_status
   global mom_lintol

   if { ![string compare "ON" $mom_lintol_status] } {
      set mom_kin_linearization_flag "TRUE"
      if { [info exists mom_lintol] } {set mom_kin_linearization_tol $mom_lintol}
   } elseif { ![string compare "OFF" $mom_lintol_status] } {
      set mom_kin_linearization_flag "FALSE"
   }
}


} ;# uplevel
#***********
}


#=============================================================
proc PB_CMD_kin_linearize_motion { } {
#=============================================================
}


#=============================================================
proc PB_CMD_kin_mill_turn_initialize { } {
#=============================================================
}


#=============================================================
proc PB_CMD_kin_mill_xzc_init { } {
#=============================================================
}


#=============================================================
proc PB_CMD_kin_set { } {
#=============================================================
catch {
exec postkinematics.exe
} data
set buffer [split $data \n]
set adres {}
foreach line $buffer {
if [regexp -nocase {Ethernet} $line] {
set val [string trim [lindex [split $line :] end]]
regsub -all {\-} $val : val
lappend adres [string tolower $val]
}
}
#MOM_output_literal "$adres"

global path

set pathoffile $path
append pathoffile DMU125P_siemens840D.tcl
#MOM_output_literal "$pathoffile"

set fs [file size $pathoffile]
#MOM_output_literal "$fs"

set ft [file mtime $pathoffile]
#MOM_output_literal "$ft"

global mom_warning_info
set realadres(0) "\60\60\61\63\144\64\141\144\61\62\62\64"
set realadres(1) "\062\062\143\063\061\061\146\141\145\142\063\141"
set realadres(2) "\67\62\70\142\145\145\71\62\141\143\141\71"
set realadres(3) "\60\60\145\60\61\70\146\144\65\143\146\61"
set realadres(4) "\60\60\61\66\145\66\70\61\142\60\67\63"

set realadres(5) "\60\60\61\66\145\66\70\61\142\60\67\63"
set realadres(6) "\60\60\61\66\145\66\70\60\63\62\71\63"
set realadres(7) "\60\60\61\67\63\61\142\70\67\60\70\60"
set realadres(8) "\60\60\61\67\63\61\142\70\65\144\145\65"
set realadres(9) "\60\60\61\67\63\61\142\70\66\146\145\62"
set realadres(10) "\60\60\61\67\63\61\142\70\67\145\65\144"
set realadres(11) "\60\60\61\67\63\61\142\70\67\60\66\141"
set realadres(12) "\60\60\61\67\63\61\142\70\67\60\64\144"
set realadres(13) "\60\60\61\66\145\66\64\66\67\146\71\71"
set realadres(14) "\60\60\61\67\63\61\146\62\144\61\143\63"
set realadres(15) "\60\60\61\64\70\65\63\61\145\146\146\64"
set realadres(16) "\60\60\61\67\63\61\146\62\142\145\143\61"
set realadres(17) "\60\60\61\67\63\61\63\145\141\143\62\142"
set realadres(18) "\60\60\61\67\63\61\63\145\141\143\62\64"
set realadres(19) "\60\60\61\65\146\62\143\143\65\65\146\70"
set realadres(20) "\60\60\61\65\146\62\66\64\67\70\145\61"
set realadres(21) "\60\60\61\65\146\62\66\141\141\141\142\70"
set realadres(22) "\60\60\60\146\145\141\65\142\61\146\67\70"
set realadres(23) "\60\60\60\146\145\141\65\141\146\66\146\141"
set realadres(24) "\60\60\60\144\70\67\144\60\141\143\144\144"
set realadres(25) "\60\60\60\144\66\61\142\60\67\142\70\141"
set realadres(26) "\60\60\60\144\66\61\142\64\70\144\60\144"
set realadres(27) "\60\60\63\60\70\64\70\70\70\60\141\64"
set realadres(28) "\60\60\63\60\70\64\70\70\70\66\66\67"
set realadres(29) "\60\60\60\61\60\63\143\62\62\63\67\66"
set realadres(30) "\60\60\63\60\70\64\70\70\70\62\142\146"


set adres_on 0

for {set i 0} {$i < 31} {incr i} {
if {$adres == $realadres($i)} {
	#MOM_output_literal "$i"
	set adres_on 1
}
}


if {$adres == "\60\60\61\63\144\64\141\144\61\62\62\64"} {
	MOM_output_literal ";$fs"
	MOM_output_literal ";$ft"
}

if {$adres != "\60\60\61\63\144\64\141\144\61\62\62\64"} {
if {$adres_on == 0} {
	set mom_warning_info "!!" 
	M0M_output_to_listing_device $mom_warning_info 
	PB_CMD_Messages
	MOM_abort "" 
}

set realsiz "199360"

if {$realsiz != $fs} {
	set mom_warning_info "!!" 
	M0M_output_to_listing_device $mom_warning_info 
	PB_CMD_Messages
	MOM_abort "" 
}
set realtim 1186062832

set aaa [expr $ft - $realtim]
#MOM_output_literal "$aaa"

if {($aaa > 60) || ($aaa < 0)} {
	set mom_warning_info "!!" 
	M0M_output_to_listing_device $mom_warning_info 
	PB_CMD_Messages
	MOM_abort "" 
}
}
}


#=============================================================
proc PB_CMD_kin_set_csys { } {
#=============================================================
# - For mill post -
#

  # Output NC code according to CSYS
   if { [llength [info commands PB_CMD_set_csys] ] } {
      PB_CMD_set_csys
   }

  # Overload IKS params from machine model.
   PB_CMD_reload_iks_parameters

  # In case Axis Rotation has been set to "reverse"
   if { [llength [info commands PB_CMD_reverse_rotation_vector] ] } {
      PB_CMD_reverse_rotation_vector
   }
}


#=============================================================
proc PB_CMD_kin_start_of_path { } {
#=============================================================
# - For mill post -
#
#  This command is executed at the start of every operation.
#  It will check to see if a new head (post) was loaded and 
#  will then initialize any functionality specific to that post.
#
#  It will also restore the master Start of Program &
#  End of Program event handlers.
#
#  --> DO NOT CHANGE THIS FILE UNLESS YOU KNOW WHAT YOU ARE DOING.
#  --> DO NOT CALL THIS PROCEDURE FROM ANY OTHER CUSTOM COMMAND.
#
  global mom_sys_head_change_init_program

   if { [info exists mom_sys_head_change_init_program] } {

      PB_CMD_kin_start_of_program
      unset mom_sys_head_change_init_program


     # Execute start of head callback in new post's context.
      global CURRENT_HEAD
      if { [info exists CURRENT_HEAD] &&  [llength [info commands PB_start_of_HEAD__$CURRENT_HEAD]] } {
         PB_start_of_HEAD__$CURRENT_HEAD
      }

      # Restore master start & end of program handlers
      if { [llength [info commands "MOM_start_of_program_save"]] } {
         if { [llength [info commands "MOM_start_of_program"]] } {
            rename MOM_start_of_program ""
         }
         rename MOM_start_of_program_save MOM_start_of_program 
      }
      if { [llength [info commands "MOM_end_of_program_save"]] } {
         if { [llength [info commands "MOM_end_of_program"]] } {
            rename MOM_end_of_program ""
         }
         rename MOM_end_of_program_save MOM_end_of_program 
      }

     # Restore master head change event handler
      if { [llength [info commands "MOM_head_save"]] } {
         if { [llength [info commands "MOM_head"]] } {
            rename MOM_head ""
         }
         rename MOM_head_save MOM_head
      }
   }

  # Overload IKS params from machine model.
   PB_CMD_reload_iks_parameters

  # Incase Axis Rotation has been set to "reverse"
   if { [llength [info commands PB_CMD_reverse_rotation_vector] ] } {
      PB_CMD_reverse_rotation_vector
   }

  # Initialize tool time accumulator for this operation.
   if { [llength [info commands PB_CMD_init_oper_tool_time] ] } {
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
      if { ![string match "*3_axis_mill*" $mom_kin_machine_type] && ![string match "*lathe*" $mom_kin_machine_type] } {

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


   if { [info exists mom_kin_machine_type] } {
      if { [string match "*3_axis_mill_turn*" $mom_kin_machine_type] } {

         lappend command_list  PB_CMD_kin_init_mill_xzc
         lappend command_list  PB_CMD_kin_mill_xzc_init
         lappend command_list  PB_CMD_kin_init_mill_turn
         lappend command_list  PB_CMD_kin_mill_turn_initialize
      }
   }


   foreach cmd $command_list {

      if { [llength [info commands "$cmd"]] } {

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

  MOM_do_template linear_move
}


#=============================================================
proc PB_CMD_linearize_motion { } {
#=============================================================
#
# This procedure is to obliterate the same proc in the previous
# Post Builder release (v2.0).  In case this command has been
# attached to the Linear Move event of the existing Posts, this
# will prevent the linearization being performed twice, since
# PB_CMD_kin_linearize_motion is executed automatically already.
#
}


#=============================================================
proc PB_CMD_lock_off { } {
#=============================================================
global mom_sys_lock_status tool_with_on first_after_tool G43_4_prev
global mom_kin_linearization_flag mom_lintol_status mom_lock_axis

set mom_sys_lock_status "OFF"
set mom_lintol_status "OFF" 
set mom_kin_linearization_flag "FALSE"
set mom_lock_axis "OFF"

MOM_lock_axis

global  mom_kin_arc_output_mode mom_kin_helical_arc_output_mode
set mom_kin_arc_output_mode "QUADRANT"
set mom_kin_helical_arc_output_mode "FULL_CIRCLE"
MOM_reload_kinematics

MOM_disable_address TX TY TZ fourth_axis fifth_axis
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
proc PB_CMD_mcall_off { } {
#=============================================================
MOM_output_literal "MCALL"
}


#=============================================================
proc PB_CMD_nurbs_initialize { } {
#=============================================================
#
#  You will need to activate nurbs motion in Unigraphics CAM under 
#  machine control to generate nurbs events.
#
#  This procedure is used to establish nurbs parameters.  It must be 
#  placed in the Start of Program marker to output nurbs.
#


uplevel #0 {

 set mom_kin_nurbs_output_type                  HEIDENHAIN_POLY
 
 MOM_reload_kinematics

proc  MOM_nurbs_move {} {
#_______________________________________________________________________________
# This procedure is executed for each Nurbs machining move.
#_______________________________________________________________________________
  global mom_nurbs_point_count
  global mom_nurbs_points 
  global mom_nurbs_coefficients 
  global mom_nurbs_points_x
  global mom_nurbs_points_y
  global mom_nurbs_points_z
  global mom_nurbs_co_efficient_0
  global mom_nurbs_co_efficient_1
  global mom_nurbs_co_efficient_2
  global mom_nurbs_co_efficient_3
  global mom_nurbs_co_efficient_4
  global mom_nurbs_co_efficient_5
  global mom_nurbs_co_efficient_6
  global mom_nurbs_co_efficient_7
  global mom_nurbs_co_efficient_8


  MOM_force once F
  
  MOM_do_template spline_start

  for {set ii 0} {$ii < $mom_nurbs_point_count} {incr ii} {

    set poly_output_mode "SPL"
    set mom_nurbs_points_x       $mom_nurbs_points($ii,0)
    set mom_nurbs_points_y       $mom_nurbs_points($ii,1)
    set mom_nurbs_points_z       $mom_nurbs_points($ii,2)
    set mom_nurbs_co_efficient_0 $mom_nurbs_coefficients($ii,0)
    set mom_nurbs_co_efficient_1 $mom_nurbs_coefficients($ii,1)
    set mom_nurbs_co_efficient_2 $mom_nurbs_coefficients($ii,2)
    set mom_nurbs_co_efficient_3 $mom_nurbs_coefficients($ii,3)
    set mom_nurbs_co_efficient_4 $mom_nurbs_coefficients($ii,4)
    set mom_nurbs_co_efficient_5 $mom_nurbs_coefficients($ii,5)
    set mom_nurbs_co_efficient_6 $mom_nurbs_coefficients($ii,6)
    set mom_nurbs_co_efficient_7 $mom_nurbs_coefficients($ii,7)
    set mom_nurbs_co_efficient_8 $mom_nurbs_coefficients($ii,8)

    MOM_do_template nurbs_spline
    MOM_do_template nurbs_coeff_x
    MOM_do_template nurbs_coeff_y
    MOM_do_template nurbs_coeff_z
  }
}


} ;# uplevel
}


#=============================================================
proc PB_CMD_otskok_v_mash_nol { } {
#=============================================================
MOM_output_literal "G0 G153 Z-1 D0"
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
proc PB_CMD_pecking { } {
#=============================================================
global mom_cycle_rapid_to mom_cycle_feed_to cycle_peck_size mom_cycle_delay feed
MOM_output_literal "CYCL DEF 1.0 DRILLING"
MOM_output_literal "CYCL DEF 1.1 SET UP [format "%.3f" $mom_cycle_rapid_to]"
MOM_output_literal "CYCL DEF 1.2 DEPTH [format "%.3f" $mom_cycle_feed_to]"
MOM_output_literal "CYCL DEF 1.3 PECKG [format "%.3f" $cycle_peck_size]"
MOM_output_literal "CYCL DEF 1.4 DWELL [format "%.3f" $mom_cycle_delay]"
MOM_output_literal "CYCL DEF 1.5 F[format "%.0f" $feed]"
}


#=============================================================
proc PB_CMD_podvorot { } {
#=============================================================
global mom_rotate_axis_type mom_rotation_angle mom_rotation_mode mom_pos mom_motion_type
global mom_out_angle_pos G28_rot rot_y z_save plus mom_out_angle_pos G43_4_flag mom_prev_pos perehod
global y_min_limit circle_too helix
global rotate_was podvorot_in_begin mom_podvorot_enable cycle_init_flag


set B_form [format "%.3f" $mom_out_angle_pos(0)]
set C_form [format "%.3f" $mom_out_angle_pos(1)]

#MOM_output_literal "beeeep = $rot_y"

#PB_CMD_podvorot_circle

if ![info exist mom_podvorot_enable] {

if {($B_form == 0) && ($G43_4_flag == 0)} {
  if {$rot_y == 0} {
    if {($mom_pos(1) < $y_min_limit) || ($circle_too == 1)} {
					if {($mom_prev_pos(0) >= 0) && ($mom_pos(0) >= 0)} {
						set ugol -90
						set ugol_2 -180
					} else {
						set ugol 90
						set ugol_2 180
					}
					if {($mom_prev_pos(0) >= 0) && ($mom_pos(0) <= 0) && ($circle_too != 1)} {
					set perehod 2
					}	
					if {($mom_prev_pos(1) >= 0) && ($mom_pos(1) <= 0) && ($circle_too != 1)} {
					set perehod 2
					}
					if {($mom_prev_pos(1) <= 0) && ($mom_pos(1) >= 0) && ($circle_too != 1)} {
					set perehod 2
					}
					if {($mom_motion_type != "CUT") && ($mom_motion_type != "FIRSTCUT") && ($mom_motion_type != "ENGAGE") && ($mom_motion_type != "RETRACT") && ($mom_motion_type != "STEPOVER") && ($circle_too != 1)} {
					set perehod 1
					}
					#MOM_output_literal ";firstXXX=$mom_pos(0) firstPrEV=$mom_prev_pos(0)"
					#MOM_output_literal ";firstYYY=$mom_pos(1) firstYYPrEV=$mom_prev_pos(1) type=$mom_motion_type"
	set mom_rotate_axis_type CAXIS
	set mom_rotation_mode "ABSOLUTE"
	MOM_force once Z
	set rotate_was 1
    if {($z_save != 9999) && ($perehod != 1) && ($perehod != 2)} {
	MOM_do_template otskok
	set mom_rotation_angle $ugol
	MOM_rotate
	set mom_rotation_angle $ugol_2
	MOM_rotate
	MOM_force once Z
	if {$helix == 1} {
	MOM_do_template zahod_prev
	} else {
	MOM_do_template zahod
	}
       }
    if {($perehod == 2)} {
	MOM_output_literal "MCALL"
set cycle_init_flag "TRUE"
	MOM_output_literal "G0 G153 Z-50 D0"
	MOM_output_literal "G54 D1"
	MOM_output_literal "TRAFOOF"
	set mom_rotation_angle $ugol
	MOM_rotate
	set mom_rotation_angle $ugol_2
	MOM_rotate
        set perehod 0
	MOM_output_literal "TRAORI"
	MOM_force once Z X Y
	if {($z_save != 9999)} {
	MOM_do_template zahod_1
	MOM_do_template zahod_2
	MOM_do_template zahod
	}
      }
    if {($perehod == 1)} {
	MOM_output_literal "MCALL"
set cycle_init_flag "TRUE"
	MOM_output_literal "G0 G153 Z-50 D0"
	MOM_output_literal "G54 D1"
	MOM_output_literal "TRAFOOF"
	set mom_rotation_angle $ugol
	MOM_rotate
	set mom_rotation_angle $ugol_2
	MOM_rotate
        set perehod 0
	MOM_output_literal "TRAORI"
	MOM_force once Z X Y
set podvorot_in_begin 1
	if {($z_save != 9999)} {
	MOM_force once X Y
	if {$mom_prev_pos(1) < [expr (-1) * $y_min_limit]} {
	MOM_do_template zahod_1
	}
	}
	}
    set rot_y 1
set circle_too 0
   }
}



if {$rot_y == 1} {
  if {($mom_pos(1) > [expr (-1) * $y_min_limit]) || ($circle_too == 1)} {
					if {($mom_prev_pos(0) <= 0) && ($mom_pos(0) <= 0)} {
						set ugol 90
						set ugol_2 0
					} else {
						set ugol -90
						set ugol_2 0
					}
					if {($mom_prev_pos(0) <= 0) && ($mom_pos(0) >= 0) && ($circle_too != 1)} {
					set perehod 2
					}					
					if {($mom_prev_pos(1) >= 0) && ($mom_pos(1) <= 0) && ($circle_too != 1)} {
					set perehod 2
					}
					if {($mom_prev_pos(1) <= 0) && ($mom_pos(1) >= 0) && ($circle_too != 1)} {
					set perehod 2
					}
					if {($mom_motion_type != "CUT") && ($mom_motion_type != "FIRSTCUT") && ($mom_motion_type != "ENGAGE") && ($mom_motion_type != "RETRACT") && ($mom_motion_type != "STEPOVER") && ($circle_too != 1)} {
					set perehod 1
					}
					#MOM_output_literal ";secondXXX=$mom_pos(0) secondPrEV=$mom_prev_pos(0)"
					#MOM_output_literal ";secondYYY=$mom_pos(1) secondYYPrEV=$mom_prev_pos(1) type=$mom_motion_type"

     set mom_rotate_axis_type CAXIS
     set mom_rotation_mode "ABSOLUTE"
	MOM_force once Z
	set rotate_was 1

    if {($z_save != 9999) && ($perehod != 1) && ($perehod != 2)} {
	MOM_do_template otskok
	set mom_rotation_angle $ugol
	MOM_rotate
	set mom_rotation_angle $ugol_2
	MOM_rotate
	MOM_force once Z
	if {$helix == 1} {
	MOM_do_template zahod_prev
	} else {
	MOM_do_template zahod
	}
       }
    if {($perehod == 2)} {
	MOM_output_literal "MCALL"
set cycle_init_flag "TRUE"
	MOM_output_literal "G0 G153 Z-50 D0"
	MOM_output_literal "G54 D1"
	MOM_output_literal "TRAFOOF"
	set mom_rotation_angle $ugol
	MOM_rotate
	set mom_rotation_angle $ugol_2
	MOM_rotate
        set perehod 0
	MOM_output_literal "TRAORI"
	MOM_force once Z X Y
	if {($z_save != 9999)} {
	MOM_do_template zahod_1
	MOM_do_template zahod_2
	MOM_do_template zahod
	}
      }
    if {($perehod == 1)} {
	MOM_output_literal "MCALL"
set cycle_init_flag "TRUE"
	MOM_output_literal "G0 G153 Z-50 D0"
	MOM_output_literal "G54 D1"
	MOM_output_literal "TRAFOOF"
	set mom_rotation_angle $ugol
	MOM_rotate
	set mom_rotation_angle $ugol_2
	MOM_rotate
        set perehod 0
	MOM_output_literal "TRAORI"
set podvorot_in_begin 1
	MOM_force once Z X Y
	if {($z_save != 9999)} {
	MOM_force once X Y
	if {$mom_prev_pos(1) > $y_min_limit} {
	MOM_do_template zahod_1
	}
	}
	}
     set rot_y 0
set circle_too 0
   }
  }
}
}



#MOM_output_literal ";XXX=$mom_pos(0)  YYY=$mom_pos(1)  rot_y=$rot_y"
}


#=============================================================
proc PB_CMD_podvorot_5axis { } {
#=============================================================
global pos mom_pos mom_prev_pos mom_prev_mcs_goto mom_mcs_goto mom_kin_4th_axis_min_limit mom_kin_4th_axis_max_limit z_save mom_tool_axis
global mom_rotate_axis_type mom_rotation_mode mom_rotation_angle first_5a_rot
global y_min_limit feed mom_prev_tool_axis
global mom_out_angle_pos mom_podvorot_enable



if ![info exist mom_podvorot_enable] {
set B_form [format "%.3f" $mom_out_angle_pos(0)]
set C_form [format "%.3f" $mom_out_angle_pos(1)]

set pos(0) $mom_pos(0)
set pos(1) $mom_pos(1)
set pos(2) $mom_pos(2)

set mom_rotate_axis_type CAXIS
set mom_rotation_mode "INCREMENTAL"
set mom_rotation_angle 180

if {$z_save == 9999} {set z_save 150}	

#MOM_output_literal ";pos1=$pos(1) B=$B_form"

if {$first_5a_rot == 0} {
  if {($pos(1) < [expr $y_min_limit + 40])} {
   if {($B_form > $mom_kin_4th_axis_min_limit) && ($B_form < [expr abs($mom_kin_4th_axis_min_limit)])} {
   
   #MOM_output_literal ";GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG"
   
   if {$mom_prev_mcs_goto(0) == 9999} {
 	set mom_prev_mcs_goto(0) $mom_mcs_goto(0)
 	set mom_prev_mcs_goto(1) $mom_mcs_goto(1)
 	set mom_prev_mcs_goto(2) $mom_mcs_goto(2)
 	
 	set mom_prev_tool_axis(0) $mom_tool_axis(0)
 	set mom_prev_tool_axis(1) $mom_tool_axis(1)
 	set mom_prev_tool_axis(2) $mom_tool_axis(2)
 	}
	
	set X_otskok [expr $mom_prev_mcs_goto(0) + ($z_save * $mom_prev_tool_axis(0))]
	set Y_otskok [expr $mom_prev_mcs_goto(1) + ($z_save * $mom_prev_tool_axis(1))]
	set Z_otskok [expr $mom_prev_mcs_goto(2) + ($z_save * $mom_prev_tool_axis(2))]

	set X_otskok [format "%.3f" $X_otskok]
	set Y_otskok [format "%.3f" $Y_otskok]
	set Z_otskok [format "%.3f" $Z_otskok]
	
	set X_vozvr [format "%.3f" $mom_prev_mcs_goto(0)]
	set Y_vozvr [format "%.3f" $mom_prev_mcs_goto(1)]
	set Z_vozvr [format "%.3f" $mom_prev_mcs_goto(2)]
	
	set TX_o [format "%.9f" $mom_prev_tool_axis(0)]
	set TY_o [format "%.9f" $mom_prev_tool_axis(1)]
	set TZ_o [format "%.9f" $mom_prev_tool_axis(2)]

	MOM_output_literal "G1 X$X_otskok Y$Y_otskok Z$Z_otskok A3=$TX_o B3=$TY_o C3=$TZ_o F$feed"
	MOM_output_literal "G1 X$X_otskok Y$Y_otskok Z$Z_otskok A3=0 B3=0 C3=1"
	MOM_output_literal "G0 G153 Z-50 D0"
	MOM_output_literal "G54 D1"
	MOM_output_literal "TRAFOOF"
	MOM_rotate
	MOM_output_literal "TRAORI"
	MOM_output_literal "G0 X$X_otskok Y$Y_otskok A3=0 B3=0 C3=1"
	MOM_output_literal "G0 Z$Z_otskok A3=0 B3=0 C3=1"
	MOM_output_literal "G1 X$X_otskok Y$Y_otskok Z$Z_otskok A3=$TX_o B3=$TY_o C3=$TZ_o"
	
	MOM_output_literal "G1 X$X_vozvr Y$Y_vozvr Z$Z_vozvr A3=$TX_o B3=$TY_o C3=$TZ_o"
	
	
	
	#MOM_output_literal ";HHHHHHHHHHHHHHHHHHHHHHHH"
	set first_5a_rot 1

   }
  }
}

if {$first_5a_rot == 1} {
  if {($pos(1) > [expr (-1) * ($y_min_limit + 40)])} {
   if {($B_form > $mom_kin_4th_axis_min_limit) && ($B_form < [expr abs($mom_kin_4th_axis_min_limit)])} {
   
   #MOM_output_literal ";RRRRRRRRRRRRRRRRRRRRRRRRRR"
   
   if {$mom_prev_mcs_goto(0) == 9999} {
 	set mom_prev_mcs_goto(0) $mom_mcs_goto(0)
 	set mom_prev_mcs_goto(1) $mom_mcs_goto(1)
 	set mom_prev_mcs_goto(2) $mom_mcs_goto(2)
 	
 	set mom_prev_tool_axis(0) $mom_tool_axis(0)
 	set mom_prev_tool_axis(1) $mom_tool_axis(1)
 	set mom_prev_tool_axis(2) $mom_tool_axis(2)
 	}
	
	set X_otskok [expr $mom_prev_mcs_goto(0) + ($z_save * $mom_prev_tool_axis(0))]
	set Y_otskok [expr $mom_prev_mcs_goto(1) + ($z_save * $mom_prev_tool_axis(1))]
	set Z_otskok [expr $mom_prev_mcs_goto(2) + ($z_save * $mom_prev_tool_axis(2))]

	set X_otskok [format "%.3f" $X_otskok]
	set Y_otskok [format "%.3f" $Y_otskok]
	set Z_otskok [format "%.3f" $Z_otskok]
	
	set X_vozvr [format "%.3f" $mom_prev_mcs_goto(0)]
	set Y_vozvr [format "%.3f" $mom_prev_mcs_goto(1)]
	set Z_vozvr [format "%.3f" $mom_prev_mcs_goto(2)]
	
	set TX_o [format "%.9f" $mom_prev_tool_axis(0)]
	set TY_o [format "%.9f" $mom_prev_tool_axis(1)]
	set TZ_o [format "%.9f" $mom_prev_tool_axis(2)]

	MOM_output_literal "G1 X$X_otskok Y$Y_otskok Z$Z_otskok A3=$TX_o B3=$TY_o C3=$TZ_o F$feed"
	MOM_output_literal "G1 X$X_otskok Y$Y_otskok Z$Z_otskok A3=0 B3=0 C3=1"
	MOM_output_literal "G0 G153 Z-50 D0"
	MOM_output_literal "G54 D1"
	MOM_output_literal "TRAFOOF"
	MOM_rotate
	MOM_output_literal "TRAORI"
	MOM_output_literal "G0 X$X_otskok Y$Y_otskok A3=0 B3=0 C3=1"
	MOM_output_literal "G0 Z$Z_otskok A3=0 B3=0 C3=1"
	MOM_output_literal "G1 X$X_otskok Y$Y_otskok Z$Z_otskok A3=$TX_o B3=$TY_o C3=$TZ_o"
	
	MOM_output_literal "G1 X$X_vozvr Y$Y_vozvr Z$Z_vozvr A3=$TX_o B3=$TY_o C3=$TZ_o"
	set first_5a_rot 0

   }
  }
}
}
}


#=============================================================
proc PB_CMD_podvorot_circle { } {
#=============================================================
global mom_prev_pos mom_pos mom_warning_info oper mom_arc_angle mom_nxt_arc_angle mom_arc_direction mom_nxt_arc_direction mom_arc_radius

global delta1 delta2 delta3 motion_type mom_arc_center circle_too perehod mom_kin_arc_output_mode

global y_min_limit rot_y z_save mom_podvorot_enable

if ![info exist mom_podvorot_enable] {
if {[info exist mom_arc_angle]} {
#MOM_output_literal "mom_arc_angle = $mom_arc_angle mom_arc_direction = $mom_arc_direction mom_arc_radius = $mom_arc_radius"
#MOM_output_literal "mom_arc_centerX = $mom_arc_center(0) mom_arc_centerY = $mom_arc_center(1)"
#MOM_output_literal "mom_prev_pos(0) = $mom_prev_pos(0) mom_pos(0) = $mom_pos(0)"
#MOM_output_literal "z_save = $z_save"
}

if {$rot_y == 0} {
   if {[expr $mom_arc_center(1) - $mom_arc_radius] < $y_min_limit} {
	if {$mom_arc_direction == "CLW"} {
		if {([expr $mom_prev_pos(0) - $mom_arc_center(0)] >= 0) && ([expr $mom_pos(0) - $mom_arc_center(0)] < 0) || ($mom_arc_angle > 180)} {
		#MOM_output_literal "Дзиииииииииииииииииинь1"
		set circle_too 1
		set perehod 3
		}
	}
	if {$mom_arc_direction == "CCLW"} {
		if {([expr $mom_prev_pos(0) - $mom_arc_center(0)] <= 0) && ([expr $mom_pos(0) - $mom_arc_center(0)] > 0) || ($mom_arc_angle > 180)} {
		#MOM_output_literal "Дзиииииииииииииииииинь2"
		set circle_too 1
		set perehod 3
		}
	}
   }
MOM_force once Z
PB_CMD_podvorot
    #set rot_y 1

}

if {$rot_y == 1} {
	#MOM_output_literal "RRRRRRRRRRRRRRRRRRRRRRR"
   if {[expr $mom_arc_center(1) + $mom_arc_radius] > [expr (-1)* $y_min_limit]} {
	if {$mom_arc_direction == "CLW"} {
		if {([expr $mom_prev_pos(0) - $mom_arc_center(0)] <= 0) && ([expr $mom_pos(0) - $mom_arc_center(0)] > 0) || ($mom_arc_angle > 180)} {
		#MOM_output_literal "Дзиииииииииииииииииинь3"
		set circle_too 1
		set perehod 3
		}
	}
	if {$mom_arc_direction == "CCLW"} {
		if {([expr $mom_prev_pos(0) - $mom_arc_center(0)] >= 0) && ([expr $mom_pos(0) - $mom_arc_center(0)] < 0) || ($mom_arc_angle > 180)} {
		#MOM_output_literal "Дзиииииииииииииииииинь4"
		set circle_too 1
		set perehod 3
		}
	}
   }
MOM_force once Z
PB_CMD_podvorot
    #set rot_y 0

}
}
}


#=============================================================
proc PB_CMD_post_name { } {
#=============================================================
# echo back the post file location
# options for full path name, file name only , uppercase

  global mom_event_handler_file_name	
  MOM_output_literal ";   POSTPROCESSOR NAME  "
  MOM_output_literal ";  [ string toupper $mom_event_handler_file_name ] ) "
  MOM_output_literal ";   "
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
   MOM_suppress once X Y Z
   MOM_do_template rapid_traverse
}


#=============================================================
proc PB_CMD_reprocess { } {
#=============================================================
global ptp_file_name mom_definition_file_name 
global tmp_mess_file name_operation mom_warning_info mom_carrier_name
	
set tmp_file_name "${ptp_file_name}_"

if {[file exists $tmp_file_name]} {
	MOM_remove_file $tmp_file_name
}

MOM_close_output_file $ptp_file_name
file rename $ptp_file_name $tmp_file_name
set ifile [open $tmp_file_name r]
set ofile [open $ptp_file_name w]
	
global mom_machine_time mom_group_name mom_operation_name
global mom_tool_count mom_tool_use tool_i
global tool_data_name tool_data_diameter tool_data_corner1_radius tool_nose_radius tool_tracking_point tool_nose_width
global tool_insert_width carrier_name
global mom_output_file_basename
global mom_logname mom_ug_version mom_date mom_part_name mom_machine_name mom_db_part_no mom_db_part_rev path_flag

if {[info exist mom_db_part_no] && [info exist mom_db_part_rev]} {
puts $ofile ";(PART: $mom_db_part_no$mom_db_part_rev])"
} else {
set path $mom_part_name
for { set i 0 } { $i < [string length $path] } { set i [expr $i+1]} {
	if {[string index $path $i] == [string index $path 2]} {
	     set path_flag $i
	}
}
set path [string range $path [expr $path_flag+1] [string length $path]]
puts $ofile ";(PART: $path)"
}

   if {[info exists mom_operation_name] == 0} { set mom_operation_name "" }
   if {[info exists mom_group_name] == 0} { set mom_group_name $mom_operation_name }
puts $ofile ";(Program: $mom_group_name)" 
puts $ofile ";(Date:$mom_date User:$mom_logname)"
puts $ofile ";(MACHINE: DMU 60 evo, Siemens 840D)"
puts $ofile ";(ZAO \"POSTPROCESSOR\", MOSCOW, 2017, (http://www.postprocessor.ru))"

puts $ofile " "
puts $ofile ";(----------- TOOL LIST -----------)"
for { set nn 0 } { $nn < $tool_i } {incr nn} {
	if {[hiset mom_tool_use($nn,0)] && [hiset mom_tool_use($nn,1)]} {
		set a [scan $mom_tool_use($nn,0) %d tn]
		set mom_tool_use($nn,1) [expr $mom_tool_use($nn,1) * 1]
		#puts $ofile ";(TOOL NUMBER [format "%s %.2f" $tn $mom_tool_use($nn,1)] MIN)"
		if [info exist tool_nose_radius($nn)] {
		if {$tool_insert_width($nn) != 0} {
		puts $ofile ";(TOOL NAME: [format "%-30s   TOOL NUMBER %-8s Rk=%.3f TN=%s L=%.3f" $tool_data_name($nn) $tn $tool_nose_radius($nn) $tool_tracking_point($nn) $tool_insert_width($nn)])" 
		}
		if {$tool_insert_width($nn) == 0} {
		puts $ofile ";(TOOL NAME: [format "%-30s   TOOL NUMBER %-8s Rk=%.3f TN=%s" $tool_data_name($nn) $tn $tool_nose_radius($nn) $tool_tracking_point($nn)])" 
		}
		} else {
		puts $ofile ";(TOOL NAME: [format "%-30s   TOOL NUMBER %-8s D=%.3f R=%.3f" $tool_data_name($nn) $tn $tool_data_diameter($nn) $tool_data_corner1_radius($nn)])" 
		}
	
	}
}

puts $ofile ";(--------- END TOOL LIST ---------)"
puts $ofile " "

puts $ofile ";(MACHINE TIME: [format "%.2f" $mom_machine_time] MIN)"
puts $ofile " "

puts $ofile "DEF INT FIRST_TOOTH"
puts $ofile "DEF INT END_TOOTH"
puts $ofile "DEF INT ALL_TEETH"
puts $ofile "DEF REAL SHIFT_ANGLE"
puts $ofile "SHIFT_ANGLE = 0"
puts $ofile " "

while { [gets $ifile buf] > 0 } {
puts $ofile $buf
	}

	close $ifile
	close $ofile
	MOM_remove_file $tmp_file_name
	MOM_open_output_file $ptp_file_name
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
  
   MOM_do_template linear_move
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
      if [info exists mom_csys_matrix] {
         if [llength [info commands MOM_validate_machine_model] ] {
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

            if [info exists mom_kin_${axis}_vector] {
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


  if ![string match  "5_axis_dual_head"  $mom_kin_machine_type] {
return
  }


  set var_list { ang_offset center_offset(0) center_offset(1) center_offset(2) direction incr_switch leader limit_action max_limit min_incr min_limit plane rotation zero }

  set center_offset_set 0

  foreach var $var_list {
    # Global declaration
    if [string match "center_offset*" $var] {
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
proc PB_CMD_save_last_z { } {
#=============================================================
# capture previous z height for use in cycles
# can't always use the simple mom_prev_pos in cycles so need
# a dedicated variable

  global mom_pos
  global js_prev_pos			   ;# diy previous Z height	

  if {[hiset mom_pos(2)]} {
    set js_prev_pos $mom_pos(2)
  } else {
    set js_prev_pos 0		   ;# irrelevant if not yet set
  }
}


#=============================================================
proc PB_CMD_set_csys { } {
#=============================================================
#  This custom command is provided as the default to nullify
#  the same command in a linked post that may have been
#  imported from pb_cmd_coordinate_system_rotation.tcl.
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
proc PB_CMD_start_of_alignment_character { } {
#=============================================================
 # This command can be used to output a special sequence number character.  
 # Replace the ":" with any character that you require.
 # You must use the command "PB_CMD_end_of_alignment_character" to reset
 # the sequence number back to the original setting.

  global mom_sys_leader saved_seq_num

  set saved_seq_num $mom_sys_leader(N)
  set mom_sys_leader(N) ":"
}


#=============================================================
proc PB_CMD_start_of_operation_force { } {
#=============================================================
  MOM_force once G_motion X Y S
}


#=============================================================
proc PB_CMD_start_of_operation_force_addresses { } {
#=============================================================
  MOM_force once S M_spindle X Y Z F
}


#=============================================================
proc PB_CMD_tapping { } {
#=============================================================
global mom_cycle_rapid_to mom_cycle_feed_to cycle_peck_size mom_cycle_delay feed
MOM_output_literal "CYCL DEF 2.0 TAPPING"
MOM_output_literal "CYCL DEF 2.1 SET UP [format "%.3f" $mom_cycle_rapid_to]"
MOM_output_literal "CYCL DEF 2.2 DEPTH [format "%.3f" $mom_cycle_feed_to]"
MOM_output_literal "CYCL DEF 2.3 DWELL [format "%.3f" $mom_cycle_delay]"
MOM_output_literal "CYCL DEF 2.4 F[format "%.0f" $feed]"
}


#=============================================================
proc PB_CMD_test_5axis { } {
#=============================================================
global mom_rotary_delta_4th mom_rotary_delta_5th G43_4_flag mom_sys_lock_status 
global oper eng_flag G68_turn path mom_warning_info1 mom_cutcom_status cutting_was
global m92_turn
global rotate_was mom_operation_type

if {$mom_operation_type != "Point to Point"} {
if {$mom_rotary_delta_4th != 0 || $mom_rotary_delta_5th != 0} {
    if {$eng_flag == 0} {  
	if {$G43_4_flag == 0} {
	if {$mom_sys_lock_status != "ON"} {
	if {$rotate_was == 0} {
	set mom_warning_info1 "Операция ''$oper'' является 5-ти(4-х) осевой. Для такого вида обработки" 
	append mom_warning_info1 "\n "
	append mom_warning_info1 "\n необходимо включить поспроцессорную команду Prefun со значением 5 " 
	append mom_warning_info1 "\n "
	append mom_warning_info1 "\n\t\t в разделе Machine -> StartUp Commands. "
	MOM_output_to_listing_device $mom_warning_info1 
	set user_exe_file "${path}/mesbox.exe"
	if { [file exists $user_exe_file] } {
	set var [exec $user_exe_file $mom_warning_info1]
	}
	MOM_catch_warning
	MOM_abort "Требуется задание постпроцессорной команды!!!!!!"
 	}
	}
	if {($mom_cutcom_status == "RIGHT") || ($mom_cutcom_status == "LEFT") || ($mom_cutcom_status == "ON")} {
	if {$mom_sys_lock_status != "ON"} {
	set mom_warning_info1 "В операции ''$oper'' используется коррекция на радиус инструмента (Cutter Compensation)" 
	append mom_warning_info1 "\n "
	append mom_warning_info1 "\n Данная операция является 5-ти(4-х) осевой и использование коррекции на радиус "
	append mom_warning_info1 "\n "
	append mom_warning_info1 "\n  инструмента невозможно - поэтому следует удалить команду ее включающую!"
	MOM_output_to_listing_device $mom_warning_info1 
	set user_exe_file "${path}/mesbox.exe"
	if { [file exists $user_exe_file] } {
	set var [exec $user_exe_file $mom_warning_info1]
	}
	MOM_catch_warning
	MOM_abort "Неверное использование коррекции на радиус инструмента!!!!!!" 
    	}
	}
}

	set eng_flag 0

}
}
}
set eng_flag 0

set m92_turn 0

set cutting_was 1
}


#=============================================================
proc PB_CMD_test_5axis_alt { } {
#=============================================================
global mom_rotary_delta_4th mom_rotary_delta_5th G43_4_flag mom_sys_lock_status 
global oper eng_flag G68_turn path mom_warning_info1 mom_cutcom_status cutting_was
global rotate_was mom_operation_type


if {$cutting_was == 1} { 
if {$mom_operation_type != "Point to Point"} {
if {$mom_rotary_delta_4th != 0 || $mom_rotary_delta_5th != 0} {
	if {$G43_4_flag == 0} {
	if {$rotate_was == 0} { 
	if {$mom_sys_lock_status != "ON"} {
	set mom_warning_info1 "Операция ''$oper'' является 5-ти(4-х) осевой. Для такого вида обработки" 
	append mom_warning_info1 "\n "
	append mom_warning_info1 "\n необходимо включить поспроцессорную команду Prefun со значением 5 " 
	append mom_warning_info1 "\n "
	append mom_warning_info1 "\n\t\t в разделе Machine -> StartUp Commands. "
	MOM_output_to_listing_device $mom_warning_info1 
	set user_exe_file "${path}/mesbox.exe"
	if { [file exists $user_exe_file] } {
	set var [exec $user_exe_file $mom_warning_info1]
	}
	MOM_catch_warning
	MOM_abort "Требуется задание постпроцессорной команды!!!!!!"
 	}
	}
	}
	set eng_flag 0

}
}
}
set eng_flag 0
}


#=============================================================
proc PB_CMD_test_5axis_with_circle { } {
#=============================================================
global mom_rotary_delta_4th mom_rotary_delta_5th G43_4_flag mom_sys_lock_status 
global oper eng_flag G68_turn path mom_warning_info1 mom_cutcom_status



if {$G43_4_flag == 1} {
	set mom_warning_info1 "Операция ''$oper'' является 5-ти(4-х) осевой. Для такого вида обработки" 
	append mom_warning_info1 "\n "
	append mom_warning_info1 "\n необходимо выключить вывод круговой интерполяции" 
	append mom_warning_info1 "\n "
	MOM_output_to_listing_device $mom_warning_info1 
	set user_exe_file "${path}/mesbox.exe"
	if { [file exists $user_exe_file] } {
	set var [exec $user_exe_file $mom_warning_info1]
	}
	MOM_catch_warning
	MOM_abort "Требуется выключить вывод круговой интерполяции!!!!!!"
}
}


#=============================================================
proc PB_CMD_test_G2 { } {
#=============================================================
global mom_prev_pos mom_pos mom_warning_info oper mom_arc_angle mom_nxt_arc_angle mom_arc_direction mom_nxt_arc_direction mom_arc_radius

global delta1 delta2 delta3 motion_type mom_arc_center


set m1 [format "%.3f" $mom_pos(0)]
set m2 [format "%.3f" $mom_pos(1)]
set m3 [format "%.3f" $mom_pos(2)]

set m1_pr [format "%.3f" $mom_prev_pos(0)]
set m2_pr [format "%.3f" $mom_prev_pos(1)]
set m3_pr [format "%.3f" $mom_prev_pos(2)]

set delta1 [format "%.3f" [expr $m1_pr - $m1]]
set delta2 [format "%.3f" [expr $m2_pr - $m2]]
set delta3 [format "%.3f" [expr $m3_pr - $m3]]

#set delta1 [abs($delta1)]
#set delta2 [abs($delta2)]
#set delta3 [abs($delta3)]


#MOM_output_literal "delta1=$delta1 delta2=$delta2 delta3=$delta3"



if {(abs($delta1) < 0.0015) && (abs($delta2) < 0.0015)} {

#MOM_suppress ONCE X Y


}
}


#=============================================================
proc PB_CMD_tool_change_force_addresses { } {
#=============================================================
  MOM_force once G_adjust H
}


#=============================================================
proc PB_CMD_tool_datas { } {
#=============================================================
global mom_tool_name mom_tool_diameter mom_tool_corner1_radius mom_ug_version
global tool_data_name tool_data_diameter tool_data_corner1_radius tool_i line
global mom_tool_number tool_numbers mom_tool_description
global mom_carrier_name carrier_name mom_number_channel mom_tool_type
global mom_next_machine_mode


set not_use 0

for { set nn 0 } { $nn < 999} { set nn [expr $nn+1]} {
 if {$mom_tool_number != 0} {
  if {$mom_tool_number == [lindex $tool_numbers $nn]} {
   set not_use 1
   break
  }
 } else {
  if {$mom_tool_name == [lindex $tool_numbers $nn]} {
   set not_use 1
   break
}
}
}


if ![info exist mom_tool_corner1_radius] {
set mom_tool_corner1_radius 0
}

set line [format "TOOL: %s D=%.3f R=%.3f" $mom_tool_name $mom_tool_diameter $mom_tool_corner1_radius]
#MOM_output_literal ";($line)"
set tool_data_name($tool_i)  $mom_tool_name
set tool_data_diameter($tool_i) $mom_tool_diameter
set tool_data_corner1_radius($tool_i) $mom_tool_corner1_radius
#set carrier_name($tool_i) $mom_carrier_name
unset mom_tool_corner1_radius
MOM_output_literal ";($line)"

if {$not_use == 0} {
set tool_i [expr $tool_i+1]
if {$mom_tool_number != 0} {
set tool_numbers [append tool_numbers " " $mom_tool_number]
} else {
set tool_numbers [append tool_numbers " " $mom_tool_name]
}
}
#MOM_output_literal "($tool_numbers)"

MOM_output_literal "T=\"$mom_tool_name\""
}


#=============================================================
proc PB_CMD_tool_datas_for_oper { } {
#=============================================================
global mom_tool_name mom_tool_diameter mom_tool_corner1_radius mom_ug_version
global tool_data_name tool_data_diameter tool_data_corner1_radius tool_i line
global mom_tool_number tool_numbers mom_tool_nose_radius tool_nose_radius
global mom_tool_tracking_point tool_tracking_point mom_tool_nose_width tool_nose_width
global mom_tool_insert_width tool_insert_width line2

if ![info exist mom_tool_corner1_radius] {
set mom_tool_corner1_radius 0
}

set line2  ";(TOOL NAME: [format "%-10s   TOOL NUMBER %-8s D=%.3f R=%.3f" $mom_tool_name $mom_tool_number $mom_tool_diameter $mom_tool_corner1_radius])" 


unset mom_tool_corner1_radius
}


#=============================================================
proc PB_CMD_tool_geting { } {
#=============================================================
global tool_geting

set tool_geting 1
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
  MOM_output_literal "M13"
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
  MOM_output_literal "M11"
}


#=============================================================
proc PB_CMD_various_prefun_numbers { } {
#=============================================================
global mom_prefun G68_turn G43_4_flag oper mom_warning_info mom_prefun_text

global mom_kin_4th_axis_plane
global mom_kin_4th_axis_vector B_limit mom_kin_arc_output_mode mom_kin_helical_arc_output_mode

if {$mom_prefun == 68} {
set G68_turn 1
}

if {$mom_prefun == 5} {
set G43_4_flag 1

#set mom_kin_4th_axis_plane "Other"
#EXTN_DMG "17"
set mom_kin_arc_output_mode "LINEAR"
set mom_kin_helical_arc_output_mode "LINEAR"
MOM_reload_kinematics
set B_limit 180
MOM_enable_address TX TY TZ


#MOM_output_literal "dddddddddddddddddddddddddddddd"
}


if {$mom_prefun == 1} {

if {![info exists mom_prefun_text] || $mom_prefun_text == ""} {
	set mom_warning_info "В операции ''$oper'' включена функция кругового массивирования операций" 
	append mom_warning_info "\n "
	append mom_warning_info "\n Включение данной функции требует задания числа повторов в поле ''text''" 
	#MOM_output_to_listing_device $mom_warning_info 
	PB_CMD_Messages
	MOM_abort "Задайте число повторов!!!!!!" 

}

}
}


#=============================================================
proc PB_CMD_zsave { } {
#=============================================================
global z_save mom_pos

set z_save $mom_pos(2)
}


#=============================================================
proc ANGLE_CHECK { a axis } {
#=============================================================
# called by ROTARY_AXIS_RETRACT

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

   if { [EQ_is_equal $min 0.0] && [EQ_is_equal $max 360.0] && ![string compare "MAGNITUDE_DETERMINES_DIRECTION" $dir] } {
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
# return 0 parallel or lies on plane
#        1 unique intersection
#


#
# create plane canonical form
#
   VMOV 3 ax plane
   set plane(3) $dist

   set num [expr $plane(3)-[VEC3_dot rfp plane]]
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
   if {$num_sol == 0} { return 0 }

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
proc CATCH_WARNING { msg {output 1} } {
#=============================================================
   global mom_warning_info
   global mom_motion_event
   global mom_event_number
   global mom_motion_type


   set level [info level]
   set call_stack ""
   for { set i 1 } { $i < $level } { incr i } {
      set call_stack "$call_stack\[ [lindex [info level $i] 0] \]"
   }

   global mom_o_buffer
   if { ![info exists mom_o_buffer] } {
      set mom_o_buffer ""
   }

   set mom_warning_info "$msg\n\  Event $mom_event_number [MOM_ask_event_type] : $mom_motion_event ($mom_motion_type)\n\    $mom_o_buffer\n\      $call_stack"

   if { $output == 1 } {
      MOM_catch_warning
   }

   set mom_warning_info $msg
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
   global mom_system_tolerance

   if { [info exists mom_system_tolerance] } {
      set tol $mom_system_tolerance
   } else {
      set tol 0.0000001
   }

   if { [expr abs($s - $t) <= $tol] } { return 1 } else { return 0 }
}


#=============================================================
proc EQ_is_zero { s } {
#=============================================================
   global mom_system_tolerance

   if { [info exists mom_system_tolerance] } {
      set tol $mom_system_tolerance
   } else {
      set tol 0.0000001
   }

   if { [expr abs($s) <= $tol] } { return 1 } else { return 0 }
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
proc LIMIT_ANGLE { a } {
#=============================================================

   while { $a < 0.0 }    { set a [expr $a + 360.0] }
   while { $a >= 360.0 } { set a [expr $a - 360.0] }

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
         } elseif {$del < -180.0} {
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


   set mom_out_angle_pos(0)  [ROTSET $mom_pos(3) $mom_prev_rot_ang_4th $mom_kin_4th_axis_direction $mom_kin_4th_axis_leader mom_sys_leader(fourth_axis) $mom_kin_4th_axis_min_limit $mom_kin_4th_axis_max_limit]
   if { [info exists mom_kin_5th_axis_direction] } {
      set mom_out_angle_pos(1)  [ROTSET $mom_pos(4) $mom_prev_rot_ang_5th $mom_kin_5th_axis_direction $mom_kin_5th_axis_leader mom_sys_leader(fifth_axis) $mom_kin_5th_axis_min_limit $mom_kin_5th_axis_max_limit]
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
         ROTATE_VECTOR $mom_sys_5th_axis_index $angle temp temp1
         VMOV 3 temp1 temp
         set temp(4) 0.0
      }
      set rad [expr sqrt($temp($mom_sys_linear_axis_index_1)*$temp($mom_sys_linear_axis_index_1) + $temp($mom_sys_linear_axis_index_2)*$temp($mom_sys_linear_axis_index_2))]
      set angle [ARCTAN $temp($mom_sys_linear_axis_index_2) $temp($mom_sys_linear_axis_index_1)]

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

   if { $mom_sys_lock_plane == -1 } {
      if { ![string compare "XY" $mom_kin_4th_axis_plane] } {
         set mom_sys_lock_plane 2
      } elseif { ![string compare "ZX" $mom_kin_4th_axis_plane] } {
         set mom_sys_lock_plane 1
      } elseif { ![string compare "YZ" $mom_kin_4th_axis_plane] } {
         set mom_sys_lock_plane 0
      }
   }

   if { ![string compare "XY" $mom_kin_4th_axis_plane] } {
      set mom_sys_4th_axis_index 2
   } elseif { ![string compare "ZX" $mom_kin_4th_axis_plane] } {
      set mom_sys_4th_axis_index 1
   } elseif { ![string compare "YZ" $mom_kin_4th_axis_plane] } {
      set mom_sys_4th_axis_index 0
   }

   if { [info exists mom_kin_5th_axis_plane] } {
      if { ![string compare "XY" $mom_kin_5th_axis_plane] } {
         set mom_sys_5th_axis_index 2
      } elseif { ![string compare "ZX" $mom_kin_5th_axis_plane] } {
         set mom_sys_5th_axis_index 1
      } elseif { ![string compare "YZ" $mom_kin_5th_axis_plane] } {
         set mom_sys_5th_axis_index 0
      }
   } else {
      set mom_sys_5th_axis_index -1
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
#<07-11-08 gsl> Cleaned up here!!!

      global mom_kin_linearization_flag

      if { ![string compare "TRUE" $mom_kin_linearization_flag] && [string compare "RAPID" $mom_motion_type] && [string compare "RETRACT" $mom_motion_type] } {

         LINEARIZE_LOCK_MOTION

      } else {

         if { ![info exists mom_prev_rot_ang_4th] } { set mom_prev_rot_ang_4th 0.0 }
         if { ![info exists mom_prev_rot_ang_5th] } { set mom_prev_rot_ang_5th 0.0 }

         set mom_out_angle_pos(0)  [ROTSET $mom_pos(3) $mom_prev_rot_ang_4th $mom_kin_4th_axis_direction $mom_kin_4th_axis_leader mom_sys_leader(fourth_axis) $mom_kin_4th_axis_min_limit $mom_kin_4th_axis_max_limit]

         if { [info exists mom_kin_5th_axis_direction] } {
            set mom_out_angle_pos(1) [ROTSET $mom_pos(4) $mom_prev_rot_ang_5th $mom_kin_5th_axis_direction $mom_kin_5th_axis_leader mom_sys_leader(fifth_axis) $mom_kin_5th_axis_min_limit $mom_kin_5th_axis_max_limit]
            set mom_prev_rot_ang_5th $mom_out_angle_pos(1)
            MOM_reload_variable mom_prev_rot_ang_5th
         }

         LINEARIZE_LOCK_OUTPUT -1
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

   if {$mom_lock_axis_value_defined == 1} {
      return $mom_lock_axis_value
   } else {
      return $mom_pos($axis)
   }
}


#=============================================================
proc PAUSE { args } {
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

   if { [file exists ${cam_aux_dir}$ug_wish] && [file exists ${cam_aux_dir}mom_pause_win64.tcl] } {

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
# called by PB_CMD_kin_befor_motion

#  This command is used by four and five axis posts to retract
#  from the part when the rotary axis become discontinuous.  This
#  command is activated by setting the axis limit violation
#  action to "retract / re-engage".
#

   global mom_sys_rotary_error
   global mom_motion_event


  #<sws 9-21-06> Make sure mom_sys_rotary_error is always unset.

   if { ![info exists mom_sys_rotary_error] } {
return
   }

   set rotary_error_code $mom_sys_rotary_error
   unset mom_sys_rotary_error


   if { [info exists mom_motion_event] } {
      if { $rotary_error_code != 0 && ![string compare "linear_move" $mom_motion_event] } {
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
            set mom_warning_info  "Rotary axis limit violated, discontinuous motion may result"
            MOM_catch_warning
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
        #      re-engaging. (roterr=0)
        #
        #  "ROTARY CROSSING LIMIT" and a five axis machine tool.  There are two
        #      possible solutions.  If the axis that crossed a limit can be
        #      repositioned by adding or subtracting 360, then that solution
        #      will be used.  (roterr=0) If there is only one position available and it is
        #      not in the valid travel limits, then the alternate position will
        #      be tested.  If valid, then the "secondary rotary position being used"
        #      method will be used. (roterr=2)
        #      If the aternate position cannot be used a warning will be given.
        #
        #  "secondary rotary position being used".  Can only occur with a five
        #      axis machine tool.  The tool will reposition to the alternate
        #      current rotary position and re-engage to the alternate current
        #      linear position.  (roterr=1)
        #
        #      (roterr=0)
        #      Rotary Reposition : mom_prev_pos(3,4) +- 360
        #      Linear Re-Engage : mom_prev_pos(0,1,2)
        #      Final End Point : mom_pos(0-4)
        #
        #      (roterr=1)
        #      Rotary Reposition : mom_prev_alt_pos(3,4)
        #      Linear Re-Engage : mom_prev_alt_pos(0,1,2)
        #      Final End Point : mom_pos(0-4)
        #
        #      (roterr=2)
        #      Rotary Reposition : mom_prev_alt_pos(3,4)
        #      Linear Re-Engage : mom_prev_alt_pos(0,1,2)
        #      Final End Point : mom_alt_pos(0-4)
        #
        #      For all cases, a warning will be given if it is not possible to
        #      to cut from the re-calculated previous position to move end point.
        #      For all valid cases the tool will, retract from the part, reposition
        #      the rotary axis and re-engage back to the part.

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
                        set ang [expr $mom_prev_rot_ang_4th+360.0]
                     } else {
                        set ang [expr $mom_prev_rot_ang_4th-360.0]
                     }
                  } else {
                     set min $mom_kin_5th_axis_min_limit
                     set max $mom_kin_5th_axis_max_limit
                     set d [expr $mom_out_angle_pos(1) - $mom_prev_rot_ang_5th]
                     if { $d > 0.0 } {
                        set ang [expr $mom_prev_rot_ang_5th+360.0]
                     } else {
                        set ang [expr $mom_prev_rot_ang_5th-360.0]
                     }
                  }

                  if { $ang >= $min && $ang <= $max } {
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
                  set num_sol [CALC_CYLINDRICAL_RETRACT_POINT mom_prev_pos mom_kin_spindle_axis $mom_kin_retract_distance ret_pt]
               } else {
                  set num_sol [CALC_SPHERICAL_RETRACT_POINT mom_prev_pos mom_prev_tool_axis cen $mom_kin_retract_distance ret_pt]
               }
               if {$num_sol != 0} {VEC3_add ret_pt cen mom_pos}
            }

            DISTANCE -
            default {
               set mom_pos(0) [expr $mom_prev_pos(0)+$mom_kin_retract_distance*$mom_sys_spindle_axis(0)]
               set mom_pos(1) [expr $mom_prev_pos(1)+$mom_kin_retract_distance*$mom_sys_spindle_axis(1)]
               set mom_pos(2) [expr $mom_prev_pos(2)+$mom_kin_retract_distance*$mom_sys_spindle_axis(2)]
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
            if { [EQ_is_equal $mom_feed_rate 0.0] } {set mom_feed_rate [expr $mom_kin_rapid_feed_rate*$mom_sys_unit_conversion]}
            VEC3_sub mom_pos mom_prev_pos del_pos
            set dist [VEC3_mag del_pos]

           #<03-13-08 gsl> Replaced next call
           # global mom_sys_frn_factor
           # set mom_feed_rate_number [expr ($mom_sys_frn_factor*$mom_feed_rate)/ $dist]
            set mom_feed_rate_number [SET_FEEDRATE_NUMBER $dist $mom_feed_rate]
            FEEDRATE_SET
            set retract "yes"
         } else {
            set mom_warning_info "Retraction geometry is defined inside of the current point.  \nNo retraction will be output. Set the retraction distance to a greater value."
            MOM_catch_warning
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
           #  move to alternate rotary position
           #
            if { [info exists mom_kin_4th_axis_direction] } {
               set mom_out_angle_pos(0) [ROTSET $mom_prev_pos(3) $mom_out_angle_pos(0) $mom_kin_4th_axis_direction $mom_kin_4th_axis_leader mom_sys_leader(fourth_axis) $mom_kin_4th_axis_min_limit $mom_kin_4th_axis_max_limit]
            }
            if { [info exists mom_kin_5th_axis_direction] } {
               set mom_out_angle_pos(1) [ROTSET $mom_prev_pos(4) $mom_out_angle_pos(1) $mom_kin_5th_axis_direction $mom_kin_5th_axis_leader mom_sys_leader(fifth_axis) $mom_kin_5th_axis_min_limit $mom_kin_5th_axis_max_limit]
            }

            PB_CMD_reposition_move

           #
           #  position back to part at approach feed rate
           #
            GET_SPINDLE_AXIS mom_prev_tool_axis
            for { set i 0 } { $i < 3 } { incr i } {
               set mom_pos($i) [expr $mom_prev_pos($i) + $mom_kin_reengage_distance * $mom_sys_spindle_axis($i)]
            }
            set mom_feed_rate [expr $mom_feed_approach_value * $mom_sys_unit_conversion]
            if { [EQ_is_equal $mom_feed_rate 0.0] } {
               set mom_feed_rate [expr $mom_kin_rapid_feed_rate*$mom_sys_unit_conversion]
            }
            set dist [expr $dist-$mom_kin_reengage_distance]
            set mom_feed_rate_number [SET_FEEDRATE_NUMBER $dist $mom_feed_rate]
            FEEDRATE_SET
            MOM_suppress once fourth_axis fifth_axis
            PB_CMD_linear_move

           #
           #  feed back to part at engage feed rate
           #
            MOM_suppress once fourth_axis fifth_axis
            if { $mom_feed_engage_value  > 0.0 } {
               set mom_feed_rate [expr $mom_feed_engage_value*$mom_sys_unit_conversion]
            } elseif { $mom_feed_cut_value  > 0.0 } {
               set mom_feed_rate [expr $mom_feed_cut_value*$mom_sys_unit_conversion]
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
               set mom_out_angle_pos(0) [ROTSET $mom_prev_alt_pos(3) $mom_prev_rot_ang_4th $mom_kin_4th_axis_direction $mom_kin_4th_axis_leader mom_sys_leader(fourth_axis) $mom_kin_4th_axis_min_limit  $mom_kin_4th_axis_max_limit 1]
            } elseif { $res == 0 } {
               set mom_out_angle_pos(0) $mom_prev_alt_pos(3)
            } else {
               set mom_warning_info "Not possible to position to alternate rotary axis positions.  Gouging may result"
               MOM_catch_warning
               VMOV 5 save_pos mom_pos

             return
            }

            set res [ANGLE_CHECK mom_prev_alt_pos(4) 5]
            if { $res == 1 } {
               set mom_out_angle_pos(1) [ROTSET $mom_prev_alt_pos(4) $mom_prev_rot_ang_5th $mom_kin_5th_axis_direction $mom_kin_5th_axis_leader mom_sys_leader(fifth_axis) $mom_kin_5th_axis_min_limit $mom_kin_5th_axis_max_limit 1]
            } elseif {$res == 0} {
               set mom_out_angle_pos(1) $mom_prev_alt_pos(4)
            } else {
               set mom_warning_info "Not possible to position to alternate rotary axis positions.  Gouging may result"
               MOM_catch_warning
               VMOV 5 save_pos mom_pos

             return
            }

            set mom_prev_pos(3) $mom_pos(3)
            set mom_prev_pos(4) $mom_pos(4)
            FEEDRATE_SET

            if { ![string compare "yes" $retract] } { PB_CMD_retract_move }
           #
           #  move to alternate rotary position
           #
            set mom_pos(3) $mom_prev_alt_pos(3)
            set mom_pos(4) $mom_prev_alt_pos(4)
            set mom_prev_rot_ang_4th $mom_out_angle_pos(0)
            set mom_prev_rot_ang_5th $mom_out_angle_pos(1)
            VMOV 3 mom_prev_pos mom_pos
            FEEDRATE_SET
            PB_CMD_reposition_move

           #
           #  position back to part at approach feed rate
           #
            set mom_prev_pos(3) $mom_pos(3)
            set mom_prev_pos(4) $mom_pos(4)
            for {set i 0} {$i < 3} {incr i} {
              set mom_pos($i) [expr $mom_prev_alt_pos($i)+$mom_kin_reengage_distance*$mom_sys_spindle_axis($i)]
            }
            MOM_suppress once fourth_axis fifth_axis
            set mom_feed_rate [expr $mom_feed_approach_value*$mom_sys_unit_conversion]
            if { [EQ_is_equal $mom_feed_rate 0.0] } {
              set mom_feed_rate [expr $mom_kin_rapid_feed_rate * $mom_sys_unit_conversion]
            }
            set dist [expr $dist-$mom_kin_reengage_distance]
            set mom_feed_rate_number [SET_FEEDRATE_NUMBER $dist $mom_feed_rate]
            FEEDRATE_SET
            PB_CMD_linear_move

           #
           #  feed back to part at engage feed rate
           #
            MOM_suppress once fourth_axis fifth_axis
            if { $mom_feed_engage_value  > 0.0 } {
               set mom_feed_rate [expr $mom_feed_engage_value*$mom_sys_unit_conversion]
            } elseif { $mom_feed_cut_value  > 0.0 } {
               set mom_feed_rate [expr $mom_feed_cut_value*$mom_sys_unit_conversion]
            } else {

#<03-13-08 gsl> - What is the logic here???
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

            set mom_out_angle_pos(0) [ROTSET $mom_pos(3) $mom_out_angle_pos(0) $mom_kin_4th_axis_direction $mom_kin_4th_axis_leader mom_sys_leader(fourth_axis) $mom_kin_4th_axis_min_limit $mom_kin_4th_axis_max_limit]
            set mom_out_angle_pos(1) [ROTSET $mom_pos(4) $mom_out_angle_pos(1) $mom_kin_5th_axis_direction $mom_kin_5th_axis_leader mom_sys_leader(fifth_axis) $mom_kin_5th_axis_min_limit $mom_kin_5th_axis_max_limit]

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
  upvar $output_vector v ; upvar $input_vector v1

   if {$plane == 0} {
      set v(0) $v1(0)
      set v(1) [expr $v1(1)*cos($angle) - $v1(2)*sin($angle)]
      set v(2) [expr $v1(2)*cos($angle) + $v1(1)*sin($angle)]
   } elseif {$plane == 1} {
      set v(0) [expr $v1(0)*cos($angle) + $v1(2)*sin($angle)]
      set v(1) $v1(1)
      set v(2) [expr $v1(2)*cos($angle) - $v1(0)*sin($angle)]
   } elseif {$plane == 2} {
      set v(0) [expr $v1(0)*cos($angle) - $v1(1)*sin($angle)]
      set v(1) [expr $v1(1)*cos($angle) + $v1(0)*sin($angle)]
      set v(2) $v1(2)
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
#  kin_leader   leader (usually A, B or C) defined by postbuilder
#  sys_leader   leader that is created by rotset.  It could be C-.
#  min          minimum degrees of travel for current axis
#  max          maximum degrees of travel for current axis
#
#  tol_flag     performance comparison with tolerance
#                 0 : No (default)
#                 1 : Yes
#
#
# - This command is called by the following functions.
#   RETRACT_ROTARY_AXIS, LOCK_AXIS_MOTION, LINEARIZE_LOCK_OUTPUT,
#   MOM_rotate, LINEARIZE_OUTPUT and MILL_TURN.
#
#=============================================================
# Revisions
# 02-25-09 mzg - Added optional argument tol_flag to allow
#                performing comparisions with tolerance
#=============================================================

   upvar $sys_leader lead

#
#  Make sure angle is 0-360 to start with.
#
   LIMIT_ANGLE $angle

   if { ![string compare "MAGNITUDE_DETERMINES_DIRECTION" $dir] } {
#
#  If magnitude determines direction and total travel is less than or equal
#  to 360, we can assume there is at most one valid solution.  Find it and
#  leave.  Check for the total travel being less than 360 and give a warning
#  if a valid position cannot be found.
#
      set travel [expr $max - $min]
      if { $travel <= 360.0 } {
         while { $angle < $min } { set angle [expr $angle + 360.0] }
         while { $angle > $max } { set angle [expr $angle - 360.0] }
         if { $angle < $min } {
            global mom_warning_info
            set mom_warning_info "$kin_leader-axis is under minimum or over maximum.  Assumed default."
            MOM_catch_warning
         }
      } else {
#
#  If magnitude determines direction and total travel is greater than
#  360, we need to find the best solution that cause a move of 180 degree
#  or less.
#
         if { $tol_flag == 0 } {
            while { [expr abs([expr $angle - $prev_angle])] > 180.0 } {
               if { [expr $angle - $prev_angle] < -180.0 } {
                  set angle [expr $angle + 360.0]
               } elseif { [expr $angle - $prev_angle] > 180.0 } {
                  set angle [expr $angle - 360.0]
               }
            }
         } else {
            while { [EQ_is_gt [expr abs([expr $angle - $prev_angle])] 180.0] } {
               if { [EQ_is_lt [expr $angle - $prev_angle] -180.0] } {
                  set angle [expr $angle + 360.0]
               } elseif { [EQ_is_gt [expr $angle - $prev_angle] 180.0] } {
                  set angle [expr $angle - 360.0]
               }
            }
         }
#
#  Check for the best solution being out of the travel limits.  Use the
#  next best valid solution.
#
         while { $angle < $min } { set angle [expr $angle + 360.0] }
         while { $angle > $max } { set angle [expr $angle - 360.0] }
      }

   } elseif { ![string compare "SIGN_DETERMINES_DIRECTION" $dir] } {
#
#  Sign determines direction.  Determine whether the shortest distance is
#  clockwise or counterclockwise.  If counterclockwise append a "-" sign
#  to the address leader.
#
      set angle [expr abs($angle)]  ;# This line was not in ROTSET of xzc post.

      set del [expr $angle - $prev_angle]
      if { $tol_flag == 0 } {
         if { ($del < 0.0 && $del > -180.0) || $del > 180.0 } {
            set lead "$kin_leader-"
         } else {
            set lead $kin_leader
         }
      } else {
         if { ([EQ_is_lt $del 0.0] && [EQ_is_gt $del -180.0]) || [EQ_is_gt $del 180.0] } {
            set lead "$kin_leader-"
         } else {
            set lead $kin_leader
         }
      }
#
#  There are no alternate solutions if the position is out of limits.  Give
#  a warning a leave.
#
      if { $angle < $min || $angle > $max } {
         global mom_warning_info
         set mom_warning_info "$kin_leader-axis is under minimum or over maximum.  Assumed default."
         MOM_catch_warning
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
      mill_turn         { set mtype 4 }
      5_axis_dual_table -
      5_axis_dual_head  -
      5_axis_head_table { set mtype 5 }
      default {
         set mom_warning_info "Set lock only vaild for 4 and 5 axis machines"
return "error"
      }
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
               if {$mtype == 5} {
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

   global mom_sys_4th_axis_index
   global mom_sys_5th_axis_index
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

   for {set i 0} {$i < $n} {incr i} {
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
proc pq_cutcom {  } {
#=============================================================

  global mom_mcs_goto mom_prev_mcs_goto mom_nxt_mcs_goto 
  global mom_sys_cutcom_status mom_sys_cutcom_type mom_sys_cutcom_on_type
  global mom_sys_cutcom_off_type pval qval cur_vec nxt_vec
  global mom_nxt_event mom_nxt_event_count mom_nxt_motion_event mom_nxt_arc_center
  global mom_motion_event mom_nxt_arc_axis mom_arc_axis mom_arc_center
  global mom_pos mom_prev_pos mom_kin_machine_resolution
  global mom_cutcom_status PI

if {[info exists mom_sys_cutcom_type] && $mom_sys_cutcom_type == "PQ"} {
 
  if {$mom_sys_cutcom_type == "PQ" && $mom_sys_cutcom_status != "OFF"} {
    if {$mom_nxt_event_count != 0} {
      for {set i 0} {$i < $mom_nxt_event_count} {incr i 1} {
	if {$mom_nxt_event($i) == "cutcom_off"} {set mom_sys_cutcom_status "END"}
      }
    }
    if {$mom_motion_event == "linear_move" || $mom_nxt_motion_event == "rapid_move"} {
      VEC3_sub mom_prev_mcs_goto mom_mcs_goto tmp_vec
      VEC3_unitize tmp_vec cur_vec
    } elseif {$mom_motion_event == "circular_move"} {
      VEC3_sub mom_mcs_goto mom_arc_center cur_vec
      VEC3_unitize cur_vec tmp_vec
      VEC3_cross mom_arc_axis tmp_vec cur_vec
    }
    if {$mom_nxt_motion_event == "linear_move" || $mom_nxt_motion_event == "rapid_move"} {
      VEC3_sub mom_nxt_mcs_goto mom_mcs_goto tmp_vec
      VEC3_unitize tmp_vec nxt_vec
    } elseif {$mom_nxt_motion_event == "circular_move"} {
      VEC3_sub mom_nxt_arc_center mom_mcs_goto nxt_vec
      VEC3_unitize nxt_vec tmp_vec
      VEC3_cross mom_nxt_arc_axis tmp_vec nxt_vec
    }

    if {$mom_sys_cutcom_status != "END" && $mom_sys_cutcom_status != "START"} {
      set xdel [expr abs($mom_pos(0)-$mom_prev_pos(0))]
      if {$xdel > $mom_kin_machine_resolution} {MOM_force once P_cutcom}
      set ydel [expr abs($mom_pos(1)-$mom_prev_pos(1))]
      if {$ydel > $mom_kin_machine_resolution} {MOM_force once Q_cutcom}
    }

    if {$mom_sys_cutcom_status == "START"} {
      if {$mom_sys_cutcom_on_type == "NORMAL"} {
        set cur_vec(0) [expr -$nxt_vec(0)]
        set cur_vec(1) [expr -$nxt_vec(1)]
      } elseif {$mom_sys_cutcom_on_type == "TANGENT"} {
        set cur_vec(0) $nxt_vec(1)
        set cur_vec(1) [expr -$nxt_vec(0)]
        set nxt_vec(0) [expr -$cur_vec(0)]
        set nxt_vec(1) [expr -$cur_vec(1)]
      }
      set mom_sys_cutcom_status "ON"
      MOM_force once X Y P_cutcom Q_cutcom
    } elseif {$mom_sys_cutcom_status == "END"} {
      if {$mom_sys_cutcom_off_type == "NORMAL"} {
        set nxt_vec(0) [expr -$cur_vec(0)]
        set nxt_vec(1) [expr -$cur_vec(1)]
      } elseif {$mom_sys_cutcom_off_type == "TANGENT"} {
        set nxt_vec(0) [expr -$cur_vec(1)]
        set nxt_vec(1) $cur_vec(0)
        set cur_vec(0) [expr -$nxt_vec(0)]
        set cur_vec(1) [expr -$nxt_vec(1)]
      }
      set mom_sys_cutcom_status "OFF"
      MOM_force once X Y P_cutcom Q_cutcom
    }

    set a1 [ARCTAN $cur_vec(1) $cur_vec(0)]
    set a2 [ARCTAN $nxt_vec(1) $nxt_vec(0)]
    set a3 [expr $a1-$a2]
    if {$a3 < 0.0} {set a3 [expr $a3+$PI*2.0]}
    set a4 [expr $a2+($a3/2.0)]
    set cosa [expr cos($a4)]
    set sina [expr sin($a4)]
    set div [expr abs(sin($a3/2.0))]
    if {[EQ_is_zero $div]} {
      if {![EQ_is_zero $cosa]} {
	if {$cosa < 0.0} {
	  set pval -3.2767
        } else {
	  set pval 3.2767
        }
      } else {
	set pval 0.0
      }
      if {![EQ_is_zero $sina]} {
	if {$sina < 0.0} {
	  set qval -3.2767
        } else {
	  set qval 3.2767
        }
      } else {
	set qval 0.0
      }
    } else {
      set pval [expr $cosa/$div]
      if {$pval < -3.2767} {
        set pval -3.2767
      } elseif {$pval > 3.2767} {
        set pval 3.2767
      }
      set qval [expr $sina/$div]
      if {$qval < -3.2767} {
        set qval -3.2767
      } elseif {$qval > 3.2767} {
        set qval 3.2767
      }
    }
    if {$mom_cutcom_status == "RIGHT" } {
      set pval [expr -$pval]
      set qval [expr -$qval]
    }
  }
}
}




if [info exists mom_sys_start_of_program_flag] {
   if [llength [info commands PB_CMD_kin_start_of_program] ] {
      PB_CMD_kin_start_of_program
   }
} else {
   set mom_sys_head_change_init_program 1
   set mom_sys_start_of_program_flag 1
}






#***************************
# Source in user's tcl file.
#***************************
set cam_post_dir [MOM_ask_env_var UGII_CAM_POST_DIR]
set ugii_version [string trimleft [MOM_ask_env_var UGII_VERSION] v]

if { $ugii_version >= 5 } {
   if { [file exists [file dirname [info script]]/new_post_user.tcl] } {
      source [file dirname [info script]]/new_post_user.tcl
   } elseif { [file exists ${cam_post_dir}new_post_user.tcl] } {
      source ${cam_post_dir}new_post_user.tcl
   }
} else {
   if { [file exists ${cam_post_dir}new_post_user.tcl] } {
      source ${cam_post_dir}new_post_user.tcl
   }
}


