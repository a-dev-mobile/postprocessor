########################## TCL Event Handlers ##########################
#
#  sim11_turn_2ax_fanuc_mm.tcl - lathe
#
#    This is a 2-Axis Horizontal Lathe Machine.
#
#  Created by lili @ Thursday, November 16, 2017 10:37:13 AM China Standard Time
#  with Post Builder version 12.0.1.
#
########################################################################



#=============================================================
proc PB_CMD___log_revisions { } {
#=============================================================
# pb_post_base -
#
# Dummy command to log changes in this post --
#
# 15-Jul-2014 gsl - Initial version
# 06-Dec-2016 Shuai - 1. Save with PB 11.0.1 version.
#                   - 2. Improve and enhance the functionality of Lathe Rough Cycle (G70/ G71/G72).
#                        2.1 Add the new procs "PB_CMD_check_variables_for_turning_rough_cycle", "PB_CMD__check_block_rapid_move_for_return_motion",
#                            "PB_CMD_calculate_contour_line_number", "PB_CMD_calculate_parameters_for_turning_cycle_block",
#                            "PB_CMD_check_first_buffer_for_return_motion", "PB_CMD_check_settings_for_additional_profiling",
#                            "PB_CMD_finish_turn_cycle_contour_end", "PB_CMD_finish_turn_cycle_contour_start",
#                            "PB_CMD_output_turning_cycle_command", "PB_CMD_override_rough_contour_data_with_finish",
#                            "PB_CMD_set_contour_motion", "PB_CMD_set_turning_cycle_type" and "PB_CMD_uplevel_MOM_generic_cycle".
#                        2.2 Update the procs "PB_CMD__check_block_skip_for_rough_turn_cycle", "PB_CMD_init_rough_turn_cycle_output",
#                            "PB_CMD_turn_cycle_contour_end" and "PB_CMD_turn_cycle_contour_start".
# 13-Dec-2016 Shuai - Bug fix PR7290132. Output the correct line number for P and Q no matter the output status of sequence number is ON or OFF.
#                     Update the command "PB_CMD_calculate_contour_line_number".
# 01-06-2017 szl - Resaved with PB v11.0.1.
#                  Replace MOM_abort with new MOM extension MOM_abort_program.
}



  set cam_post_dir [MOM_ask_env_var UGII_CAM_POST_DIR]

  set mom_sys_this_post_dir  "[file dirname [info script]]"
  set mom_sys_this_post_name "[file rootname [file tail [info script]]]"


  if { ![info exists mom_sys_post_initialized] } {

     if { ![info exists mom_sys_ugpost_base_initialized] } {
        source ${cam_post_dir}ugpost_base.tcl
        set mom_sys_ugpost_base_initialized 1
     }
 
 
     set mom_sys_debug_mode OFF
 
 
     if { ![info exists env(PB_SUPPRESS_UGPOST_DEBUG)] } {
        set env(PB_SUPPRESS_UGPOST_DEBUG) 0
     }
 
     if { $env(PB_SUPPRESS_UGPOST_DEBUG) } {
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


   ####  Listing File variables 
     set mom_sys_list_output                       "OFF"
     set mom_sys_header_output                     "OFF"
     set mom_sys_list_file_rows                    "40"
     set mom_sys_list_file_columns                 "30"
     set mom_sys_warning_output                    "OFF"
     set mom_sys_warning_output_option             "FILE"
     set mom_sys_group_output                      "OFF"
     set mom_sys_list_file_suffix                  "lpt"
     set mom_sys_output_file_suffix                "ptp"
     set mom_sys_commentary_output                 "ON"
     set mom_sys_commentary_list                   "x z feed speed"
     set mom_sys_pb_link_var_mode                  "OFF"


     if { [string match "OFF" $mom_sys_warning_output] } {
        catch { rename MOM__util_print ugpost_MOM__util_print }
        proc MOM__util_print { args } {}
     }


     MOM_set_debug_mode $mom_sys_debug_mode


     if { [string match "OFF" $mom_sys_warning_output] } {
        catch { rename MOM__util_print "" }
        catch { rename ugpost_MOM__util_print MOM__util_print }
     }


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

     # Write output buffer to the listing file with warnings
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


  set mom_sys_use_default_unit_fragment         "ON"
  set mom_sys_alt_unit_post_name                "sim11_turn_2ax_fanuc_mm__IN.pui"


########## SYSTEM VARIABLE DECLARATIONS ##############
  set mom_sys_rapid_code                        "0"
  set mom_sys_linear_code                       "1"
  set mom_sys_circle_code(CLW)                  "2"
  set mom_sys_circle_code(CCLW)                 "3"
  set mom_sys_lathe_thread_advance_type(1)      "33"
  set mom_sys_lathe_thread_advance_type(2)      "34"
  set mom_sys_lathe_thread_advance_type(3)      "35"
  set mom_sys_delay_code(SECONDS)               "4"
  set mom_sys_delay_code(REVOLUTIONS)           "4"
  set mom_sys_cutcom_code(OFF)                  "40"
  set mom_sys_cutcom_code(LEFT)                 "41"
  set mom_sys_cutcom_code(RIGHT)                "42"
  set mom_sys_adjust_code                       "43"
  set mom_sys_adjust_code_minus                 "44"
  set mom_sys_adjust_cancel_code                "49"
  set mom_sys_unit_code(IN)                     "20"
  set mom_sys_unit_code(MM)                     "21"
  set mom_sys_cycle_drill_break_chip_code       "73"
  set mom_sys_cycle_off                         "80"
  set mom_sys_cycle_drill_code                  "81"
  set mom_sys_cycle_drill_deep_code             "83"
  set mom_sys_cycle_drill_dwell_code            "82"
  set mom_sys_cycle_tap_code                    "84"
  set mom_sys_cycle_bore_code                   "85"
  set mom_sys_output_code(ABSOLUTE)             "90"
  set mom_sys_output_code(INCREMENTAL)          "91"
  set mom_sys_reset_code                        "50"
  set mom_sys_feed_rate_mode_code(IPM)          "98"
  set mom_sys_feed_rate_mode_code(IPR)          "99"
  set mom_sys_feed_rate_mode_code(FRN)          "93"
  set mom_sys_spindle_mode_code(SFM)            "96"
  set mom_sys_spindle_mode_code(RPM)            "97"
  set mom_sys_return_code                       "28"
  set mom_sys_cycle_ret_code(AUTO)              "98"
  set mom_sys_cycle_ret_code(MANUAL)            "99"
  set mom_sys_feed_rate_mode_code(MMPM)         "98"
  set mom_sys_feed_rate_mode_code(MMPR)         "99"
  set mom_sys_program_stop_code                 "0"
  set mom_sys_optional_stop_code                "1"
  set mom_sys_end_of_program_code               "2"
  set mom_sys_spindle_direction_code(CLW)       "3"
  set mom_sys_spindle_direction_code(CCLW)      "4"
  set mom_sys_spindle_direction_code(OFF)       "5"
  set mom_sys_tool_change_code                  "6"
  set mom_sys_coolant_code(MIST)                "7"
  set mom_sys_coolant_code(ON)                  "8"
  set mom_sys_coolant_code(FLOOD)               "8"
  set mom_sys_coolant_code(OFF)                 "9"
  set mom_sys_head_code(INDEPENDENT)            "21"
  set mom_sys_head_code(DEPENDENT)              "22"
  set mom_sys_rewind_code                       "30"
  set mom_sys_sim_cycle_drill                   "0"
  set mom_sys_sim_cycle_drill_dwell             "0"
  set mom_sys_sim_cycle_drill_deep              "0"
  set mom_sys_sim_cycle_drill_break_chip        "0"
  set mom_sys_sim_cycle_tap                     "0"
  set mom_sys_sim_cycle_bore                    "0"
  set mom_sys_cir_vector                        "Vector - Arc Start to Center"
  set mom_sys_spindle_max_rpm_code              "50"
  set mom_sys_spindle_cancel_sfm_code           "93"
  set mom_sys_spindle_ranges                    "0"
  set mom_sys_rewind_stop_code                  "\#"
  set mom_sys_home_pos(0)                       "0"
  set mom_sys_home_pos(1)                       "0"
  set mom_sys_home_pos(2)                       "0"
  set mom_sys_zero                              "0"
  set mom_sys_opskip_block_leader               "/"
  set mom_sys_seqnum_start                      "1"
  set mom_sys_seqnum_incr                       "2"
  set mom_sys_seqnum_freq                       "1"
  set mom_sys_seqnum_max                        "99999"
  set mom_sys_lathe_x_double                    "1"
  set mom_sys_lathe_i_double                    "1"
  set mom_sys_lathe_x_factor                    "1"
  set mom_sys_lathe_z_factor                    "1"
  set mom_sys_lathe_i_factor                    "1"
  set mom_sys_lathe_k_factor                    "1"
  set mom_sys_leader(N)                         "N"
  set mom_sys_leader(X)                         "X"
  set mom_sys_leader(Y)                         "Y"
  set mom_sys_leader(Z)                         "Z"
  set mom_sys_turret_index(INDEPENDENT)         "1"
  set mom_sys_turret_index(DEPENDENT)           "2"
  set mom_sys_delay_param(SECONDS,format)       "Dwell_SECONDS"
  set mom_sys_delay_param(REVOLUTIONS,format)   "Dwell_REVOLUTIONS"
  set mom_sys_contour_feed_mode(LINEAR)         "MMPM"
  set mom_sys_rapid_feed_mode(LINEAR)           "MMPM"
  set mom_sys_cycle_feed_mode                   "MMPM"
  set mom_sys_feed_param(IPM,format)            "Feed_IPM"
  set mom_sys_feed_param(IPR,format)            "Feed_IPR"
  set mom_sys_feed_param(FRN,format)            "Feed_INV"
  set mom_sys_vnc_rapid_dogleg                  "1"
  set mom_sys_prev_mach_head                    ""
  set mom_sys_curr_mach_head                    ""
  set mom_sys_feed_param(MMPM,format)           "Feed_MMPM"
  set mom_sys_feed_param(MMPR,format)           "Feed_MMPR"
  set mom_sys_output_cycle95                    "1"
  set mom_sys_lathe_y_factor                    "1"
  set mom_sys_head_code(INDEPENDENT)            "21"
  set mom_sys_head_code(DEPENDENT)              "22"
  set mom_sys_advanced_turbo_output             "0"
  set mom_sys_linearization_method              "angle"
  set mom_sys_tool_number_max                   "32"
  set mom_sys_tool_number_min                   "1"
  set mom_sys_post_description                  "This is a 2-Axis Horizontal Lathe Machine."
  set mom_sys_word_separator                    " "
  set mom_sys_end_of_block                      ""
  set mom_sys_ugpadvkins_used                   "0"
  set mom_sys_post_builder_version              "12.0.1"

####### KINEMATIC VARIABLE DECLARATIONS ##############
  set mom_kin_4th_axis_center_offset(0)         "0.0"
  set mom_kin_4th_axis_center_offset(1)         "0.0"
  set mom_kin_4th_axis_center_offset(2)         "0.0"
  set mom_kin_4th_axis_max_limit                "0.0"
  set mom_kin_4th_axis_min_incr                 "0.0"
  set mom_kin_4th_axis_min_limit                "0.0"
  set mom_kin_4th_axis_point(0)                 "0.0"
  set mom_kin_4th_axis_point(1)                 "0.0"
  set mom_kin_4th_axis_point(2)                 "0.0"
  set mom_kin_4th_axis_zero                     "0.0"
  set mom_kin_5th_axis_center_offset(0)         "0.0"
  set mom_kin_5th_axis_center_offset(1)         "0.0"
  set mom_kin_5th_axis_center_offset(2)         "0.0"
  set mom_kin_5th_axis_max_limit                "0.0"
  set mom_kin_5th_axis_min_incr                 "0.0"
  set mom_kin_5th_axis_min_limit                "0.0"
  set mom_kin_5th_axis_point(0)                 "0.0"
  set mom_kin_5th_axis_point(1)                 "0.0"
  set mom_kin_5th_axis_point(2)                 "0.0"
  set mom_kin_5th_axis_zero                     "0.0"
  set mom_kin_arc_output_mode                   "FULL_CIRCLE"
  set mom_kin_arc_valid_plane                   "XY"
  set mom_kin_clamp_time                        "2.0"
  set mom_kin_dependent_head                    "NONE"
  set mom_kin_flush_time                        "2.0"
  set mom_kin_ind_to_dependent_head_x           "0"
  set mom_kin_ind_to_dependent_head_z           "0"
  set mom_kin_independent_head                  "NONE"
  set mom_kin_linearization_flag                "1"
  set mom_kin_linearization_tol                 "0.001"
  set mom_kin_machine_resolution                ".001"
  set mom_kin_machine_type                      "lathe"
  set mom_kin_machine_zero_offset(0)            "0.0"
  set mom_kin_machine_zero_offset(1)            "0.0"
  set mom_kin_machine_zero_offset(2)            "0.0"
  set mom_kin_max_arc_radius                    "99999.999"
  set mom_kin_max_dpm                           "0.0"
  set mom_kin_max_fpm                           "10000"
  set mom_kin_max_fpr                           "1000"
  set mom_kin_max_frn                           "99999.999"
  set mom_kin_min_arc_length                    "0.20"
  set mom_kin_min_arc_radius                    "0.001"
  set mom_kin_min_dpm                           "0.0"
  set mom_kin_min_fpm                           "1.0"
  set mom_kin_min_fpr                           "0.001"
  set mom_kin_min_frn                           "0.001"
  set mom_kin_output_unit                       "MM"
  set mom_kin_pivot_gauge_offset                "0.0"
  set mom_kin_post_data_unit                    "MM"
  set mom_kin_rapid_feed_rate                   "15000"
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


###################
# IS&V Enhancement
###################


if { ![info exists sim_mtd_initialized] } {
   set sim_mtd_initialized 0
}



##VNC____ASSIGN_TURRET_POCKETS START


# This is a special handler for assigning turret pockets.
#
#   *** DO NOT change the name of this command. ***
#
# When this command exists in the Post, body of this command
# will be written out to the global scope of the Post's Tcl file.
# No need to declare any global variables in this command!
#


 #----------
 # * Step-1
 #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 # List of tool carrier ID's for indexable turrets
 # This list is referenced in VNC's tool change handler
 # to trigger a turret indexing.
 #
  set mom_sim_turret_carriers  {Turret}


 #--------------------------------------------------------------------------
 # Each turret may be configured differently.
 # Sample code below assumes both turrets have same configuration
 # which defines tool pockets situated around a turret uniformly.
 # Non-uniform arrangement needs to be individually defined for each pocket.
 #--------------------------------------------------------------------------
  foreach carrier_id $mom_sim_turret_carriers {
     switch $carrier_id {
        "Turret" -
        "1" {


          #----------
          # * Step-2
          #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
          # Turret axis name defined with machine model.
          # Make sure the name of the rotating AXIS is specified here!
          #
           set mom_sim_turret_axis($carrier_id) TURRET


          #----------
          # * Step-3
          #+++++++++++++++++++++++++++++++++
          # Number of pockets on the turret
          #
           set pockets_num  12


           set ang_inc [expr 360 / $pockets_num]
           set ang 0

           for { set pocket_id 1 } { $pocket_id < [expr $pockets_num + 1] } { incr pocket_id } {

              set mom_sim_pocket_angle($carrier_id,$pocket_id)  $ang
              set mom_sim_pocket_working_transformation($carrier_id@$pocket_id) "AXIS=<$mom_sim_turret_axis($carrier_id)> VALUE=<$ang>"

              set ang [expr $ang + $ang_inc]
           }
        }
     }
  }


  unset carrier_id
  unset pocket_id
  unset pockets_num
  unset ang_inc
  unset ang


##VNC____ASSIGN_TURRET_POCKETS END



set mom_sim_vnc_handler [file rootname [info script]]_vnc.tcl

set mom_sim_post_builder_vnc 1


#=============================================================
proc MOM_SIM_initialize_mtd { } {
#=============================================================
  global sim_mtd_initialized
  global mom_sim_vnc_msg_only


   if { ![info exists mom_sim_vnc_msg_only] || !$mom_sim_vnc_msg_only } {
     # Initialized to plugin mode to facilitate machine code simulation
      SIM_mtd_init NC_CONTROLLER_PLUGIN
   }

   uplevel #0 {
      source "$mom_sim_vnc_handler"
   }

   set sim_mtd_initialized 1
}


#++++++++++++++++++++++++++++++++++++++++++
# Source & initialize VNC for a child post
#++++++++++++++++++++++++++++++++++++++++++
if { $sim_mtd_initialized == 1 } {
  source "$mom_sim_vnc_handler"
  if [llength [info commands PB_VNC_init_sim_vars] ] {
    PB_VNC_init_sim_vars
  }
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

    catch { OPEN_files } ;# Open warning and listing files
    LIST_FILE_HEADER     ;# List header in commentary listing


   # If this handler is executed, revPost is not runnning!
    global mom_sim_post_builder_rev_post
    set mom_sim_post_builder_rev_post 0


   # Assign primary channel
    global sim_mtd_initialized
    if { $sim_mtd_initialized == 1 } {
      global mom_sim_primary_channel mom_carrier_name
      if [info exists mom_carrier_name] {
        set mom_sim_primary_channel $mom_carrier_name
      }

      catch { SIM_mtd_init NC_CONTROLLER_MTD_EVENT_HANDLER }
    }



  global mom_sys_post_initialized
  if { $mom_sys_post_initialized > 1 } { return }


  set ::mom_sys_start_program_clock_seconds [clock seconds]

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

  global sim_mtd_initialized
  if { $sim_mtd_initialized == 1 } {
    global mom_sim_vnc_msg_only
    if { ![info exists mom_sim_vnc_msg_only] || !$mom_sim_vnc_msg_only } {
      global mom_sync_number
      if [info exists mom_sync_number] {
        if [llength [info commands PB_VNC_sync] ] {
          PB_VNC_sync
        }
        unset mom_sync_number
      }
    }
  }
}


#=============================================================
proc MOM_set_csys { } {
#=============================================================
  if [llength [info commands PB_CMD_kin_set_csys] ] {
    PB_CMD_kin_set_csys
  }

# Pass the CSYS information that will be used to
# set the ZCS coordinate system for simulation.
  global sim_mtd_initialized
  if $sim_mtd_initialized {
    if [llength [info commands PB_VNC_pass_csys_data] ] {
      global mom_sim_csys_set
      set mom_sim_csys_set 0

      PB_VNC_pass_csys_data

      set mom_sim_csys_set 1
    }
  }
}


#=============================================================
proc MOM_msys { } {
#=============================================================
# Pass the CSYS information, if a CSYS is not set, that will be
# used to set the ZCS coordinate system for simulation.
  global sim_mtd_initialized
  if $sim_mtd_initialized {
    if [llength [info commands PB_VNC_pass_msys_data] ] {
      PB_VNC_pass_msys_data
    }
  }
}


#=============================================================
proc MOM_end_of_program { } {
#=============================================================
  global mom_program_aborted mom_event_error
   MOM_set_seq_off

   MOM_do_template rewind_stop_code

  # Write tool list with time in commentary data
   LIST_FILE_TRAILER

  # Close warning and listing files
   CLOSE_files

   if [CMD_EXIST PB_CMD_kin_end_of_program] {
      PB_CMD_kin_end_of_program
   }

  # End of simulation
   global sim_mtd_initialized
   if { $sim_mtd_initialized == 1 } {
      if [llength [info commands PB_VNC_end_of_program] ] {
         PB_VNC_end_of_program
      }
   }
}


  incr mom_sys_post_initialized


} ;# uplevel
#***********


 # Initialize simulation
  global sim_mtd_initialized
  if $sim_mtd_initialized {
    global mom_sim_program_has_started
    if { ![info exists mom_sim_program_has_started] } {

      set mom_sim_program_has_started 1

      if [llength [info commands PB_VNC_start_of_program] ] {
        PB_VNC_start_of_program
      }
    }
  }
}


#=============================================================
proc PB_TURRET_HEAD_SET { } {
#=============================================================
  global mom_kin_independent_head mom_tool_head
  global turret_current

   set turret_current INDEPENDENT
   set ind_head NONE
   set dep_head NONE

   if { [string compare $mom_tool_head $mom_kin_independent_head] } {
      set turret_current DEPENDENT
   }

   if { [string compare $mom_tool_head "$ind_head"] && \
        [string compare $mom_tool_head "$dep_head"] } {
      CATCH_WARNING "mom_tool_head = $mom_tool_head IS INVALID, USING NONE"
   }
}


#=============================================================
proc PB_LATHE_THREAD_SET { } {
#=============================================================
  global mom_lathe_thread_type mom_lathe_thread_advance_type
  global mom_lathe_thread_lead_i mom_lathe_thread_lead_k
  global mom_motion_distance
  global mom_lathe_thread_increment mom_lathe_thread_value
  global thread_type thread_increment feed_rate_mode

    switch $mom_lathe_thread_advance_type {
      1 { set thread_type CONSTANT ; MOM_suppress once E }
      2 { set thread_type INCREASING ; MOM_force once E }
      default { set thread_type DECREASING ; MOM_force once E }
    }

    if { ![string compare $thread_type "INCREASING"] || ![string compare $thread_type "DECREASING"] } {
      if { $mom_lathe_thread_type != 1 } {
        set LENGTH $mom_motion_distance
        set LEAD $mom_lathe_thread_value
        set INCR $mom_lathe_thread_increment
        set E [expr abs(pow(($LEAD + ($INCR * $LENGTH)) , 2) - pow($LEAD , 2)) / 2 * $LENGTH]
        set thread_increment $E
      }
    }

    if { [EQ_is_zero $mom_lathe_thread_lead_i] } {
      MOM_suppress once I ; MOM_force once K
    } elseif { [EQ_is_zero $mom_lathe_thread_lead_k] } {
      MOM_suppress once K ; MOM_force once I
    } else {
      MOM_force once I ; MOM_force once K
    }
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

  # Reload post for simple mill-turn
   if { [llength [info commands PB_machine_mode] ] } {
      if { [catch {PB_machine_mode} res] } {
         CATCH_WARNING "$res"
      }
   }

  # Pass tool name to VNC for simulation.
   global sim_mtd_initialized
   if { $sim_mtd_initialized } {
      if { [llength [info commands PB_VNC_pass_tool_data] ] } {
         PB_VNC_pass_tool_data
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


   ABORT_EVENT_CHECK

   MOM_do_template cycle_bore
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_circular_move { } {
#=============================================================
   ABORT_EVENT_CHECK

   PB_CMD_output_spindle

   if { [PB_CMD__check_block_skip_for_rough_turn_cycle] } {
      MOM_force Once I K
      MOM_do_template circular_move
   }

   if { [PB_CMD__check_block_circular_move_for_rough_turn_cycle] } {
      MOM_force Once I K
      MOM_do_template circular_move_rough_turn_cycle
   }
}


#=============================================================
proc MOM_contour_end { } {
#=============================================================
   PB_CMD_turn_cycle_contour_end
}


#=============================================================
proc MOM_contour_start { } {
#=============================================================
   PB_CMD_output_spindle
   PB_CMD_turn_cycle_contour_start
}


#=============================================================
proc MOM_coolant_off { } {
#=============================================================
   COOLANT_SET

   MOM_do_template coolant_off
}


#=============================================================
proc MOM_coolant_on { } {
#=============================================================
   COOLANT_SET

   MOM_do_template coolant_on
}


#=============================================================
proc MOM_cutcom_off { } {
#=============================================================
   CUTCOM_SET

   MOM_do_template cutcom_off
}


#=============================================================
proc MOM_cutcom_on { } {
#=============================================================
   CUTCOM_SET

   global mom_cutcom_adjust_register

   if { [info exists mom_cutcom_adjust_register] } {
      set cutcom_register_min 1
      set cutcom_register_max 99

      if { $mom_cutcom_adjust_register < $cutcom_register_min ||\
           $mom_cutcom_adjust_register > $cutcom_register_max } {

         CATCH_WARNING "CUTCOM register $mom_cutcom_adjust_register must be within the range between 1 and 99"

         unset mom_cutcom_adjust_register
      }
   }

   MOM_do_template cutcom_on
}


#=============================================================
proc MOM_cycle_off { } {
#=============================================================
   MOM_do_template cycle_off
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


   ABORT_EVENT_CHECK

   MOM_do_template cycle_drill
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


   ABORT_EVENT_CHECK

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


   ABORT_EVENT_CHECK

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


   ABORT_EVENT_CHECK

   MOM_do_template cycle_drill_dwell
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

   if [CMD_EXIST PB_CMD_kin_end_of_path] {
      PB_CMD_kin_end_of_path
   }

   global mom_sys_in_operation
   set mom_sys_in_operation 0

   global sim_mtd_initialized
   if { $sim_mtd_initialized == 1 } {
      if [llength [info commands PB_VNC_end_of_path] ] {
         PB_VNC_end_of_path
      }
   }
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

   PB_CMD_spindle_prestart_under_constant_surface_speed_control
   catch { MOM_$mom_motion_event }
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

   PB_TURRET_HEAD_SET
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
   MOM_rapid_move
}


#=============================================================
proc MOM_initial_move { } {
#=============================================================
  global mom_feed_rate mom_feed_rate_per_rev mom_motion_type
  global mom_kin_max_fpm mom_motion_event

   COOLANT_SET ; CUTCOM_SET ; SPINDLE_SET ; RAPID_SET

   PB_CMD_spindle_prestart_under_constant_surface_speed_control

  global mom_programmed_feed_rate
   if { [EQ_is_equal $mom_programmed_feed_rate 0] } {
      MOM_rapid_move
   } else {
      MOM_linear_move
   }
}


#=============================================================
proc MOM_lathe_roughing { } {
#=============================================================
   MOM_do_template lathe_roughing

   MOM_force Once G_motion
   MOM_do_template lathe_roughing_1
}


#=============================================================
proc MOM_lathe_thread { } {
#=============================================================
  global cycle_name
  global cycle_init_flag

   set cycle_init_flag TRUE
   set cycle_name LATHE_THREAD
}


#=============================================================
proc MOM_lathe_thread_move { } {
#=============================================================
   global cycle_init_flag


   ABORT_EVENT_CHECK

   PB_LATHE_THREAD_SET

   MOM_do_template thread_move
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_length_compensation { } {
#=============================================================
   TOOL_SET MOM_length_compensation

   MOM_do_template tool_length_adjust
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

   ABORT_EVENT_CHECK

   HANDLE_FIRST_LINEAR_MOVE

   PB_CMD_output_spindle

   if { [PB_CMD__check_block_skip_for_rough_turn_cycle] } {
      MOM_do_template linear_move
   }

   if { [PB_CMD__check_block_linear_for_rough_turn_cycle] } {
      MOM_do_template linear_move_rough_turn_cycle
   }
}


#=============================================================
proc MOM_load_tool { } {
#=============================================================
   global mom_tool_change_type mom_manual_tool_change
   global mom_tool_number mom_next_tool_number
   global mom_sys_tool_number_max mom_sys_tool_number_min

   if { $mom_tool_number < $mom_sys_tool_number_min || \
        $mom_tool_number > $mom_sys_tool_number_max } {

      global mom_warning_info
      set mom_warning_info "Tool number to be output ($mom_tool_number) exceeds limits of\
                            ($mom_sys_tool_number_min/$mom_sys_tool_number_max)"
      MOM_catch_warning
   }
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
   MOM_do_template prefun
}


#=============================================================
proc MOM_rapid_move { } {
#=============================================================
  global rapid_spindle_inhibit rapid_traverse_inhibit
  global spindle_first is_from
  global mom_cycle_spindle_axis traverse_axis1 traverse_axis2
  global mom_motion_event

   ABORT_EVENT_CHECK

   set spindle_first NONE

   RAPID_SET

   if { [PB_CMD__check_block_rapid_move_for_return_motion] } {
      MOM_do_template rapid_move
   }
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
proc MOM_spindle_css { } {
#=============================================================
   SPINDLE_SET
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

  global mom_sys_add_cutting_time mom_sys_add_non_cutting_time
  global mom_sys_machine_time mom_machine_time
   set mom_sys_add_cutting_time 0.0
   set mom_sys_add_non_cutting_time 0.0
   set mom_sys_machine_time $mom_machine_time

   if [CMD_EXIST PB_CMD_kin_start_of_path] {
      PB_CMD_kin_start_of_path
   }

   PB_CMD_check_variables_for_turning_rough_cycle

   global mom_operation_name
   MOM_output_literal "($mom_operation_name)"

   global sim_mtd_initialized
   if { $sim_mtd_initialized == 1 } {
      if [llength [info commands PB_VNC_pass_spindle_data] ] {
         PB_VNC_pass_spindle_data
      }
      if [llength [info commands PB_VNC_start_of_path] ] {
         PB_VNC_start_of_path
      }
   }
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


   ABORT_EVENT_CHECK

   MOM_do_template cycle_tap
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_thread { } {
#=============================================================
  global cycle_name
  global cycle_init_flag

   set cycle_init_flag TRUE
   set cycle_name THREAD
}


#=============================================================
proc MOM_thread_move { } {
#=============================================================
   global cycle_init_flag


   ABORT_EVENT_CHECK

}


#=============================================================
proc MOM_tool_change { } {
#=============================================================
   global mom_tool_change_type mom_manual_tool_change
   global mom_tool_number mom_next_tool_number
   global mom_sys_tool_number_max mom_sys_tool_number_min

   if { $mom_tool_number < $mom_sys_tool_number_min || \
        $mom_tool_number > $mom_sys_tool_number_max } {

      global mom_warning_info
      set mom_warning_info "Tool number to be output ($mom_tool_number) exceeds limits of\
                            ($mom_sys_tool_number_min/$mom_sys_tool_number_max)"
      MOM_catch_warning
   }
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
   global mom_sys_tool_number_max mom_sys_tool_number_min

   if { [info exists mom_tool_preselect_number] } {
      if { $mom_tool_preselect_number < $mom_sys_tool_number_min || \
           $mom_tool_preselect_number > $mom_sys_tool_number_max } {

         global mom_warning_info
         set mom_warning_info "Preselected Tool number ($mom_tool_preselect_number) exceeds limits of\
                               ($mom_sys_tool_number_min/$mom_sys_tool_number_max)"
         MOM_catch_warning
      }

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

  # Pass tool name to VNC for simulation.
   global sim_mtd_initialized
   if { $sim_mtd_initialized } {
      if { [llength [info commands PB_VNC_pass_tool_data] ] } {
         PB_VNC_pass_tool_data
      }
   }

   global mom_tool_number mom_next_tool_number
   if { ![info exists mom_next_tool_number] } {
      set mom_next_tool_number $mom_tool_number
   }

   PB_CMD_alignment_block

   MOM_force Once G X Z
   MOM_do_template tool_change_axis_preset
   PB_CMD_start_of_alignment_character

   MOM_force Once T H M
   MOM_do_template auto_tool_change

   MOM_do_template auto_tool_change_1
   PB_CMD_end_of_alignment_character
   PB_CMD_force_addresses
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

   PB_CMD_output_spindle
}


#=============================================================
proc PB_manual_tool_change { } {
#=============================================================
   PB_CMD_alignment_block

   MOM_do_template stop
   PB_CMD_start_of_alignment_character

   MOM_force Once T
   MOM_do_template manual_tool_change_1
   PB_CMD_end_of_alignment_character
   PB_CMD_force_addresses
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
   if [CMD_EXIST PB_CMD_kin_start_of_program] {
      PB_CMD_kin_start_of_program
   }

   PB_CMD_uplevel_MOM_generic_cycle
   MOM_set_seq_off

   MOM_do_template rewind_stop_code
   MOM_set_seq_on

   MOM_do_template absolute_mode

   if [CMD_EXIST PB_CMD_kin_start_of_program_2] {
      PB_CMD_kin_start_of_program_2
   }
}


#=============================================================
proc PB_CMD__check_block_circular_move_for_rough_turn_cycle { } {
#=============================================================
# This custom command should return
#   1 : Output BLOCK
#   0 : No output

   global dpp_rough_turn_cycle_start

   if { [info exists dpp_rough_turn_cycle_start] && $dpp_rough_turn_cycle_start } {
      global dpp_contour_list
      set o_buffer [MOM_do_template circular_move_rough_turn_cycle CREATE]
      lappend dpp_contour_list $o_buffer
   return 0
   } else {
   return 0
   }
}


#=============================================================
proc PB_CMD__check_block_linear_for_rough_turn_cycle { } {
#=============================================================
# This custom command should return
#   1 : Output BLOCK
#   0 : No output

   global dpp_rough_turn_cycle_start

   if { [info exists dpp_rough_turn_cycle_start] && $dpp_rough_turn_cycle_start } {
      global dpp_contour_list
      set o_buffer [MOM_do_template linear_move_rough_turn_cycle CREATE]
      lappend dpp_contour_list $o_buffer
   return 0
   } else {
   return 0
   }
}


#=============================================================
proc PB_CMD__check_block_rapid_move_for_return_motion { } {
#=============================================================
# This custom command should return
#   1 : Output BLOCK
#   0 : No output

   global dpp_return_motion_start

   if { [info exists dpp_return_motion_start] && $dpp_return_motion_start } {
      global dpp_return_motion_list
      PB_CMD_check_first_buffer_for_return_motion
      set o_buffer [MOM_do_template rapid_move CREATE]
      lappend dpp_return_motion_list $o_buffer
   return 0
   } else {
   return 1
   }

}


#=============================================================
proc PB_CMD__check_block_skip_for_rough_turn_cycle { } {
#=============================================================
# This custom command should return
#   1 : Output BLOCK
#   0 : No output

   global dpp_rough_turn_cycle_start
   global dpp_return_motion_start
   global mom_motion_event
   global dpp_return_motion_list

   if { [info exists dpp_rough_turn_cycle_start] && $dpp_rough_turn_cycle_start } {
   return 0
   } elseif { [info exists dpp_return_motion_start] && $dpp_return_motion_start } {
      if {$mom_motion_event == "linear_move"} {
         PB_CMD_check_first_buffer_for_return_motion
         set o_buffer [MOM_do_template linear_move CREATE]
         lappend dpp_return_motion_list $o_buffer
      } elseif {$mom_motion_event == "circular_move"} {
         PB_CMD_check_first_buffer_for_return_motion
         set o_buffer [MOM_do_template circular_move CREATE]
         lappend dpp_return_motion_list $o_buffer
      }
   return 0
   } else {
   return 1
   }

}


#=============================================================
proc PB_CMD__config_post_options { } {
#=============================================================
# pb_post_base -
#
# <PB v10.03>
# This command should be called by Start-of-Program event;
# it enables users to set options (not via UI) that would
# affect the behavior and output of this post.
#
# Comment out next line to activate this command
return

  # <PB v10.03>
  # - Feed mode for RETRACT motion has been handled as RAPID,
  #   next option enables users to treat RETRACT as CONTOURing.
  #
   if { ![info exists ::mom_sys_retract_feed_mode] } {
      set ::mom_sys_retract_feed_mode  "CONTOUR"
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
proc PB_CMD_alignment_block { } {
#=============================================================
# Force output the addresses at start.

  MOM_force once X Z M_spindle M_coolant F G_feed

}


#=============================================================
proc PB_CMD_alignment_block_1 { } {
#=============================================================
   MOM_force once X Z M_spindle M_coolant F G_feed
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

}


#=============================================================
proc PB_CMD_calculate_contour_line_number { } {
#=============================================================
# This command is to calculate and record start and end line number of contour in NC codes.
#
# This command is used in PB_CMD_turn_cycle_contour_end.
#
# 25-Dec-2015 Shuai - Initial version
# 13-Dec-2016 Shuai - Bug fix PR7290132. Adjust the value for P and Q parameters
#                     according to the output status of sequence number.
#

  global mom_sys_cycle_seq_num_on
  global mom_seqnum
  global dpp_turn_cycle_seqno_begin
  global dpp_turn_cycle_seqno_end
  global mom_sys_seqnum_incr
  global dpp_record_rough_cycle_seq
  global mom_machine_cycle_subroutine_name
  global dpp_contour_list_length
  global mom_template_subtype
  global mom_def_sequence_start

# Set the sequence number offset value according to the output status of sequence number.
  if {![info exists ::dpp_seq_status] } {

     set ::dpp_seq_status "on"
  }

  if {$::dpp_seq_status == "on"} {

     set ::dpp_seq_offset_for_turning_rough_command 2

  } elseif {$::dpp_seq_status == "off"} {

     set ::dpp_seq_offset_for_turning_rough_command 0
  }

# Calculate start and end line number of contour in NC code
# which will be output as the parameters of rough turning cycle command.
  if {$mom_sys_cycle_seq_num_on==0} {

     if {![info exists mom_seqnum]} {

        set dpp_turn_cycle_seqno_begin [ expr $mom_def_sequence_start+$::dpp_seq_offset_for_turning_rough_command*$mom_sys_seqnum_incr ]
        set dpp_turn_cycle_seqno_end [ expr $mom_def_sequence_start+($::dpp_seq_offset_for_turning_rough_command+1)*$mom_sys_seqnum_incr ]

     } else {

        set dpp_turn_cycle_seqno_begin [ expr $mom_seqnum+$::dpp_seq_offset_for_turning_rough_command*$mom_sys_seqnum_incr ]
        set dpp_turn_cycle_seqno_end [ expr $mom_seqnum+($::dpp_seq_offset_for_turning_rough_command+1)*$mom_sys_seqnum_incr ]
     }

  } else {

     set dpp_turn_cycle_seqno_begin [ expr $mom_seqnum+$::dpp_seq_offset_for_turning_rough_command*$mom_sys_seqnum_incr ]
     set dpp_turn_cycle_seqno_end [ expr $mom_seqnum+($::dpp_seq_offset_for_turning_rough_command+$dpp_contour_list_length-1)*$mom_sys_seqnum_incr ]
  }

  catch {unset ::dpp_seq_offset_for_turning_rough_command}

# <shuai 2016-Nov-25> - Adjust the line number according to turning operation type so as to get the correct values for parameters P and Q.
  if {[string match "*FINISH*" $mom_template_subtype] && ($::dpp_seq_status == "on")} {

     set dpp_turn_cycle_seqno_begin [expr $dpp_turn_cycle_seqno_begin-$mom_sys_seqnum_incr]
     set dpp_turn_cycle_seqno_end [expr $dpp_turn_cycle_seqno_end-$mom_sys_seqnum_incr]
  }

# Record the rough turning cycle start seq and end seq.
  set dpp_record_rough_cycle_seq(begin,$mom_machine_cycle_subroutine_name) $dpp_turn_cycle_seqno_begin
  set dpp_record_rough_cycle_seq(end,$mom_machine_cycle_subroutine_name) $dpp_turn_cycle_seqno_end

}


#=============================================================
proc PB_CMD_calculate_parameters_for_turning_cycle_block { } {
#=============================================================
# This command is to calculate the parameters for rough turning cycle block.
#
# This command is used in proc PB_CMD_turn_cycle_contour_start.
#
# 25-Dec-2015 Shuai - Initial version

  global dpp_turn_cycle_cut_feed dpp_turn_cycle_cut_speed
  global mom_feed_cut_value mom_spindle_speed
  global mom_sys_lathe_x_double
  global dpp_turn_cycle_stock_x dpp_turn_cycle_stock_z
  global mom_stock_part mom_face_stock mom_radial_stock
  global dpp_save_cutcom_status
  global mom_level_step_angle
  global mom_cutcom_status

# Set value for F and S.
  set dpp_turn_cycle_cut_feed $mom_feed_cut_value
  set dpp_turn_cycle_cut_speed $mom_spindle_speed

# Calculate stocks for U and W.
  set dpp_turn_cycle_stock_x [expr $mom_sys_lathe_x_double * ($mom_stock_part + $mom_radial_stock)]
  set dpp_turn_cycle_stock_z [expr $mom_stock_part + $mom_face_stock]

# Adjust the sign of U and W and output tool nose radius compensation code.
  if {[info exists dpp_save_cutcom_status]} {

     if { $dpp_save_cutcom_status == "RIGHT"} {

        if {[EQ_is_equal $mom_level_step_angle 0]} {

           set dpp_turn_cycle_stock_x [expr -$dpp_turn_cycle_stock_x]
           set dpp_turn_cycle_stock_z [expr -$dpp_turn_cycle_stock_z]

        } elseif {[EQ_is_equal $mom_level_step_angle 90]} {

           set dpp_turn_cycle_stock_x [expr -$dpp_turn_cycle_stock_x]

        } elseif {[EQ_is_equal $mom_level_step_angle 270]} {

           set dpp_turn_cycle_stock_z [expr -$dpp_turn_cycle_stock_z]
        }

        set mom_cutcom_status $dpp_save_cutcom_status
        MOM_enable_address G_cutcom
        MOM_force once G_cutcom D
        MOM_do_template cutcom_on

     } elseif {$dpp_save_cutcom_status == "LEFT"} {

        if {[EQ_is_equal $mom_level_step_angle 0]} {

           set dpp_turn_cycle_stock_z [expr -$dpp_turn_cycle_stock_z]

        } elseif {[EQ_is_equal $mom_level_step_angle 90]} {

           set dpp_turn_cycle_stock_x [expr -$dpp_turn_cycle_stock_x]
           set dpp_turn_cycle_stock_z [expr -$dpp_turn_cycle_stock_z]

        } elseif {[EQ_is_equal $mom_level_step_angle 180]} {

           set dpp_turn_cycle_stock_x [expr -$dpp_turn_cycle_stock_x]
        }

        set mom_cutcom_status $dpp_save_cutcom_status
        MOM_enable_address G_cutcom
        MOM_force once G_cutcom D
        MOM_do_template cutcom_on
     }
  }

}


#=============================================================
proc PB_CMD_cancel_suppress_force_once_per_event { } {
#=============================================================
# This command can be called to cancel the effect of
# "MOM_force Once" & "MOM_suppress Once" for each event.
#
# => It's to keep the effect of force & suppress once within
#    the scope of the event that issues the commands and
#    eliminate the unexpected residual effect of such commands
#    that may have been issued by other events.
#
# PB v11.02 -
#
   MOM_cancel_suppress_force_once_per_event
}


#=============================================================
proc PB_CMD_check_first_buffer_for_return_motion { } {
#=============================================================
# This command is to check whether it is the first time to buffer MOM_do_template for return motion.
# if so, then force output G_motion, X and Z.
#
# 25-Dec-2015 Shuai - Initial version

  global dpp_first_buffer_for_return_motion

  if { $dpp_first_buffer_for_return_motion == 1 } {

     MOM_force once G_motion X Z
     set dpp_first_buffer_for_return_motion 0
  }

}


#=============================================================
proc PB_CMD_check_settings_for_additional_profiling { } {
#=============================================================
# This command is to used to check whether the settings for additional profile is correct or not.
#
# If user adds profile in toolpath, the following conditions should be checked to fulfill.
#
# ==>> Condition 1: Operation type is FACING or ROUGH
# ==>> Condition 2: Cutter compensation UDE has been set
# ==>> Condition 3: Strategy of path settings is Finish All
# ==>> Condition 4: Profile stock is the same with rough stock
#
# 25-Nov-2016 Shuai - Initial version
#

  # Check Condition 1.
  if {[string match "FACING" $::mom_template_subtype] || [string match "*ROUGH*" $::mom_template_subtype]} {

     # Check Condition 2.
     if {[info exists ::mom_cutcom_status] && \
         ($::mom_cutcom_status=="LEFT" || $::mom_cutcom_status=="RIGHT")} {

        # Check Condition 3.
        if {[info exists ::mom_finishing_cut_method] && ($::mom_finishing_cut_method == 7)} {

           # Check Condition 4.
           if {([info exists ::mom_finish_equidistant_stock] && [info exists ::mom_stock_part] && \
                [EQ_is_equal $::mom_finish_equidistant_stock $::mom_stock_part]) && \
               ([info exists ::mom_finish_face_stock] && [info exists ::mom_face_stock] && \
                [EQ_is_equal $::mom_finish_face_stock $::mom_face_stock]) && \
               ([info exists ::mom_finish_radial_stock] && [info exists ::mom_radial_stock] && \
                [EQ_is_equal $::mom_finish_radial_stock $::mom_radial_stock])} {

              return 1

           } else {

              MOM_output_to_listing_device "$::mom_operation_name: Additional Profiling can only be used when profile stock is the same with rough stock.\
                                            \nSo it will not be output in current operation. Switch output mode from Machine-Cycle to Non-Machine-Cycle."

              return 0
           }

        } else {

           MOM_output_to_listing_device "$::mom_operation_name: Additional Profiling can only be used when strategy of path settings has been set to Finish All.\
                                         \nSo it will not be output in current operation. Switch output mode from Machine-Cycle to Non-Machine-Cycle."

           return 0
        }

     } else {

        MOM_output_to_listing_device "$::mom_operation_name: Additional Profiling can only be used when UDE Cutter Compensation UDE has been set.\
                                      \nSo it will not be output in current operation. Switch output mode from Machine-Cycle to Non-Machine-Cycle."

        return 0
     }

  } else {

     MOM_output_to_listing_device "$::mom_operation_name: Additional Profiling can only be used in FACING or ROUGH operation.\
                                   \nSo it will not be output in current operation. Switch output mode from Machine-Cycle to Non-Machine-Cycle."

     return 0
  }

}


#=============================================================
proc PB_CMD_check_variables_for_turning_rough_cycle { } {
#=============================================================
# This command is used to check whether some variables exists or not.
#
# 06-Dec-2016 Shuai   - Initial version.
#

  global mom_template_subtype

  if {![info exists mom_template_subtype] } {

     set mom_template_subtype "UNDEFINED"
  }

}


#=============================================================
proc PB_CMD_config_cycle_start { } {
#=============================================================
# When a post (PUI) is configured to use this command as the
# "post_startblk" parameter, this command will be inserted and
# output as the anchor element for the cycles using "cycle start"
# to execute the cycles.
#
# You can add codes here for the needs of individual cycles or
# any other purposes.
#
# ==> This command MUST NOT be deleted or added to other event markers.
#
}


#=============================================================
proc PB_CMD_end_of_alignment_character { } {
#=============================================================
 #  Return sequnece number back to orignal
 #  This command may be used with the command "PM_CMD_start_of_alignment_character"

  global mom_sys_leader saved_seq_num
  if [info exists saved_seq_num] {
    set mom_sys_leader(N) $saved_seq_num
  }
}


#=============================================================
proc PB_CMD_finish_turn_cycle_contour_end { } {
#=============================================================
# This command is to set end mark of finish contour data in output file in subpost run by MOM_post_oper_path.
#
# This command is used in proc MOM_generic_cycle when mom_generic_cycle_status is 0.
#
# 25-Dec-2015 Shuai - Initial version

  global mom_template_subtype

  if { [string match "*FINISH*" $mom_template_subtype] } {

     # Set the end mark of finish contour data
     MOM_output_literal "(CONTOUR TURN END)"
     MOM_set_seq_on
  }

}


#=============================================================
proc PB_CMD_finish_turn_cycle_contour_start { } {
#=============================================================
# This command is to set start mark of finish contour data in output file in subpost run by MOM_post_oper_path.
#
# This command is used in proc MOM_generic_cycle when mom_generic_cycle_status is 1.
#
# 25-Dec-2015 Shuai - Initial version

  global mom_template_subtype

  if { [string match "*FINISH*" $mom_template_subtype] } {

     # Set the start mark of finish contour data
     MOM_set_seq_off
     MOM_output_literal "(CONTOUR TURN START)"
     MOM_force once G_motion X Z

  }

}


#=============================================================
proc PB_CMD_force_addresses { } {
#=============================================================
  MOM_force Once X Z

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
proc PB_CMD_init_rough_turn_cycle_output { } {
#=============================================================
# This command is to prepare to generate contour data and customize sequence number output mode.
#
# 05-30-2013 levi  - Initial version
# 10-28-2015 shuai - Output contour data on condition that UDE (Cutter Compensation)
#                    has been set, otherwise output tracking data.
# 11-05-2015 shuai - Output finish operation G70 using previous rough contour data
#                    if the subroutine name is same between them.
# 12-25-2015 shuai - Modify the code structure so as to make logical more clear.
# 11-25-2016 shuai - Add the variable dpp_fanuc_turning_cycle_type.
#

  global mom_machine_control_motion_output
  global mom_sys_output_cycle95
  global mom_sys_output_contour_motion
  global mom_sys_cycle_seq_num_on
  global mom_template_subtype
  global dpp_record_rough_cycle_seq
  global mom_machine_cycle_subroutine_name
  global mom_feed_cut_value
  global dpp_finish_feed
  global dpp_turn_cycle_g_code
  global mom_operation_name

##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# "mom_sys_output_contour_motion" can be set [ 0 | 1 | 2 ].
#  0: No contour output
#  1: Part contour
#  2: Tracking path contour
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# Initialize mom_sys_output_contour_motion to 0 as default.
  set mom_sys_output_contour_motion 0

# Unset the variable dpp_fanuc_turning_cycle_type before checking which turning cycle type will be used.
  catch {unset ::dpp_fanuc_turning_cycle_type}

# Only used for turning operations.
  if {[info exists ::mom_operation_type] && ![string match "*Turn*" $::mom_operation_type]} {

     return
  }

# <shuai 2016-Nov-25> - Additional profiling can be selected in a rough opeation and output after rough turning cycle.
#                     - If user adds profile in tool path, some conditions should be checked to fulfill.
#                     - No need to check these in finish turning operation.
  if {![string match "*FINISH*" $mom_template_subtype]} {

     if {[info exists ::mom_profiling] && ($::mom_profiling == 1)} {

        if {![PB_CMD_check_settings_for_additional_profiling] } {

           return
        }
     }
  }

# When calling rough turning cycle command and set mom_sys_cycle_seq_num_on to 0,
# only sequence number at start and end of contour will be output.
# Otherwise all the sequence numbers will be output.
  set mom_sys_cycle_seq_num_on 0

##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# So far, machine cycle motion has been supported in following three scenarios.
#  Scenario 1: single rough turning cycle operation.
#  Scenario 2: both rough and finish turning cycle operation.
#             (The following two conditions should be fulfilled in this scenario.)
#              Condition 1: contour data of rough and finish operations should be same.
#                           This is checked by user when operations are created, not checked by post processor.
#              Condition 2: subroutine name of rough operation should be same as the finish operation name.
#  Scenario 3: single finish turning cycle operation.
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# Check whether turning processor has produced contour data and post is equipped with the ability to output rough turning cycle
  if {([info exists mom_machine_control_motion_output] && $mom_machine_control_motion_output == 2) && \
      ([info exists mom_sys_output_cycle95] && $mom_sys_output_cycle95)} {

     # Check scenario 1
     if {[string match "FACING" $mom_template_subtype] || [string match "*ROUGH*" $mom_template_subtype]} {

        PB_CMD_set_contour_motion

        # Set the flag of machine cycle motion scenario
        set ::dpp_fanuc_turning_cycle_type "Single Rough"

     # Check scenario 2 or 3
     } elseif {[string match "*FINISH*" $mom_template_subtype]} {

        # Scenario 2
        if {[info exists dpp_record_rough_cycle_seq(begin,$mom_operation_name)]} {

           # Output G70 command.
           PB_CMD_output_spindle
           set dpp_finish_feed $mom_feed_cut_value
           set dpp_turn_cycle_g_code 70
           MOM_do_template turn_cycle_finishing
           MOM_force once G_motion X Z

           # Set the flag of machine cycle motion scenario
           set ::dpp_fanuc_turning_cycle_type "Rough Finish"

        # Scenario 3
        } else {

           PB_CMD_set_contour_motion

           # Set the flag of machine cycle motion scenario
           set ::dpp_fanuc_turning_cycle_type "Single Finish"
        }

     # Other scenarios
     } else {

        MOM_output_to_listing_device "$mom_operation_name: The Machine Cycle motion output has not been supported for current operation type so far.\
                                      \nSwitch output mode from Machine-Cycle to Non-Machine-Cycle."
     }

     # Don't output cutcom until rough turning cycle called.
     MOM_disable_address G_cutcom

  } else {

     MOM_output_to_listing_device "$mom_operation_name: Lathe Rough Cycle has not been supported in Post Processor currently.\
                                   \nSwitch output mode from Machine-Cycle to Non-Machine-Cycle."
  }

}


#=============================================================
proc PB_CMD_kin_abort_event { } {
#=============================================================
   if { [CMD_EXIST PB_CMD_abort_event] } {
      PB_CMD_abort_event
   }
}


#=============================================================
proc PB_CMD_kin_before_output { } {
#=============================================================
# Broker command ensuring PB_CMD_before_output, if present, gets executed
# by MOM_before_output.
#
# ==> DO NOT add anything here!
# ==> All customization must be done in PB_CMD_before_output!
# ==> PB_CMD_before_output MUST NOT call any "MOM_output" commands!
#
   if { [CMD_EXIST PB_CMD_before_output] } {
      PB_CMD_before_output
   }
}


#=============================================================
proc PB_CMD_kin_end_of_path { } {
#=============================================================
  # Record tool time for this operation.
   if { [CMD_EXIST PB_CMD_set_oper_tool_time] } {
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


  #<12-16-2014 gsl> To determine feed mode for RETRACT per motion type
   global mom_motion_event
   if { ![info exists mom_motion_event] } {
      set mom_motion_event UNDEFINED
   }

   set feed_type RAPID


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
      RETURN -
      LIFT -
      TRAVERSAL -
      GOHOME -
      GOHOME_DEFAULT -
      RAPID {
        #<Sep-07-2016 gsl>
        # SUPER_FEED_MODE_SET RAPID
         if { [string match "linear_move"   $mom_motion_event] ||\
              [string match "circular_move" $mom_motion_event] } {
            set feed_type CONTOUR
         }
      }

      default {
        #<Sep-07-2016 gsl>
         if { !([EQ_is_zero $f_pm] && [EQ_is_zero $f_pr]) } {
            set feed_type CONTOUR
         }
      }
   }

  #<Sep-07-2016 gsl>
   if { ![string match "CYCLE" $mom_motion_type] } {
      SUPER_FEED_MODE_SET $feed_type
   }


  # Treat RETRACT as cutting when specified
   global mom_sys_retract_feed_mode
   if { [string match "RETRACT" $mom_motion_type] } {

      if { [info exist mom_sys_retract_feed_mode] && [string match "CONTOUR" $mom_sys_retract_feed_mode] } {
         if { !([EQ_is_zero $f_pm] && [EQ_is_zero $f_pr]) } {
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
   if { [CMD_EXIST PB_CMD_FEEDRATE_SET] } {
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
   global mom_kin_machine_type mom_kin_iks_usage

   if { ![string compare "lathe" $mom_kin_machine_type] } {
      set mom_kin_iks_usage 0
      MOM_reload_kinematics
   }
}


#=============================================================
proc PB_CMD_kin_init_probing_cycles { } {
#=============================================================
# This is a broker command that will intialize settings for probing cycles.
# It will be called by PB_CMD_kin_start_of_program automatically
#
# ==> Do not change its name or use it in any other ways!
#
   if { ![CALLED_BY "PB_CMD_kin_start_of_program"] } {
return
   }


   set cmd PB_CMD_init_probing_cycles
   if { [CMD_EXIST "$cmd"] } {
      eval $cmd
   }
}


#=============================================================
proc PB_CMD_kin_set_csys { } {
#=============================================================
   if { [CMD_EXIST PB_CMD_set_csys] } {
      PB_CMD_set_csys
   }
}


#=============================================================
proc PB_CMD_kin_start_of_path { } {
#=============================================================
# - For lathe post -
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

     # Reset solver state for lathe post
      if { [CMD_EXIST PB_CMD_reset_lathe_post] } {
         PB_CMD_reset_lathe_post
      }
   }

  # Initialize tool time accumulator for this operation.
   if { [CMD_EXIST PB_CMD_init_oper_tool_time] } {
      PB_CMD_init_oper_tool_time
   }
}


#=============================================================
proc PB_CMD_kin_start_of_program { } {
#=============================================================
#  This procedure will execute the following custom commands for
#  initialization.  They will be executed once at the start of
#  program and again each time they are loaded as a linked post.
#  After execution they will be deleted so that they are not
#  present when a different post is loaded.  You may add a call
#  to a procedure that you want executed when a linked post is
#  loaded.
#
#  Note when a linked post is called in, the Start of Program
#  event is not executed again.
#
#  DO NOT REMOVE ANY LINES FROM THIS PROCEDURE UNLESS YOU KNOW
#  WHAT YOU ARE DOING.  DO NOT CALL THIS PROCEDURE FROM ANY
#  OTHER CUSTOM COMMAND.
#

   set command_list [list]

   lappend command_list  PB_CMD_kin_init_new_iks

   lappend command_list  PB_CMD_initialize_tool_list
   lappend command_list  PB_CMD_init_tool_list
   lappend command_list  PB_CMD_init_tape_break
   lappend command_list  PB_CMD_set_lathe_arc_plane

   lappend command_list  PB_CMD_kin_init_probing_cycles
   lappend command_list  PB_DEFINE_MACROS


   foreach cmd $command_list {
      if { [CMD_EXIST "$cmd"] } {
         eval $cmd
         rename $cmd ""
         proc $cmd { args } {}
      }
   }
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
proc PB_CMD_output_spindle { } {
#=============================================================
# This command is used to output spindle speed.
#
# If use constant surface speed control mode, need output maximum speed before.
#
# 05-30-2013 levi - Initial version
#

  global mom_spindle_mode
  global dpp_spindle_is_out

  if [info exists dpp_spindle_is_out] {

     return

  } else {

     set dpp_spindle_is_out "1"
  }

  if {![string compare "RPM" $mom_spindle_mode] } {

     MOM_force once M_spindle S G_spin
     MOM_do_template spindle_rpm

  } elseif {![string compare "SFM" $mom_spindle_mode] || ![string compare "SMM" $mom_spindle_mode] } {

     MOM_force once M_spindle S G G_spin
     MOM_do_template spindle_max_rpm
     MOM_do_template spindle_css
  }

}


#=============================================================
proc PB_CMD_output_turning_cycle_command { } {
#=============================================================
# This command is to output turning cycle command depending on the operation template type.
#
# This command is used in proc PB_CMD_turn_cycle_contour_end.
#
# 25-Dec-2015 Shuai - Initial version

  global mom_template_subtype
  global dpp_finish_feed
  global mom_feed_cut_value
  global dpp_turn_cycle_g_code

  if {[string match "FACING" $mom_template_subtype] || [string match "*ROUGH*" $mom_template_subtype]} {

     # Output G71 or G72 command
     MOM_lathe_roughing
  }

  if {[string match "*FINISH*" $mom_template_subtype]} {

     # Output G70 command
     PB_CMD_output_spindle
     set dpp_finish_feed $mom_feed_cut_value
     set dpp_turn_cycle_g_code 70
     MOM_do_template turn_cycle_finishing
  }

}


#=============================================================
proc PB_CMD_override_rough_contour_data_with_finish { } {
#=============================================================
# This command is used to override rough contour data with corresponding finish when cutter compensation UDE is not set.
# Rough operation's subroutine name should be the same as the associated finish operation's name.
# Use MOM_post_oper_path to run a finish operation in rough operation and output the NC codes into "finish_operation_program.ptp".
# Read the contour data from this file and append into a list used for rough operation.
#
# This command is used in proc PB_CMD_turn_cycle_contour_end.
#
# 25-Dec-2015 Shuai - Initial version

  global mom_sys_output_contour_motion
  global mom_machine_cycle_subroutine_name
  global dpp_contour_list
  global mom_operation_name

  # Run a finish operation with MOM_post_oper_path in rough operation
  set res [ MOM_post_oper_path $mom_machine_cycle_subroutine_name "finish_operation_program.ptp" ]

  # Flag to find the begin of contour data in output file
  global mom_finish_contour_data_start
  set mom_finish_contour_data_start 0

  # Get contour data from "finish_operation_program.ptp"
  if { $res == 1 } {

     set dpp_contour_list [list]
     lappend dpp_contour_list [MOM_do_template turn_cycle_start_tag CREATE]

     # Open output file "finish_operation_program.ptp"
     if { [catch {set src [open "finish_operation_program.ptp" RDONLY]} fid] } {

        MOM_display_message "$mom_operation_name: Fail to open the file finish_operation_program.ptp. \
                            \n$fid. Post processing will be aborted." "Postprocessor Error Message" "E"
        MOM_abort_program
     }

     # Only capture NC codes between "(CONTOUR TURN START)" and "(CONTOUR TURN END)"
     # and append them into contour list
     while { [eof $src] == 0 } {

        set line [gets $src]

        if { [string match "*(CONTOUR TURN START)*" $line] } {

           set mom_finish_contour_data_start 1
           continue

        } elseif { [string match "*(CONTOUR TURN END)*" $line] } {

           set mom_finish_contour_data_start 0
           break
        }

        if {$mom_finish_contour_data_start == 1} {

           if { [string trim $line] != "" } {
              lappend dpp_contour_list $line
           }
        }
     }

     close $src

     catch { file delete "finish_operation_program.ptp" }

     lappend dpp_contour_list [MOM_do_template turn_cycle_end_tag CREATE]

  } else {

     MOM_output_to_listing_device "$mom_operation_name: Fail to run the operation $mom_machine_cycle_subroutine_name with extended command MOM_post_oper_path.\
                                   \nNow use the contour data of $mom_operation_name as default."
  }

}


#=============================================================
proc PB_CMD_pause { } {
#=============================================================
# This command enables you to pause the UG/Post processing.
#
  PAUSE
}


#=============================================================
proc PB_CMD_reset_lathe_post { } {
#=============================================================

  # ==> This command must be called by PB_CMD_kin_start_of_path.
  #
   if { ![CALLED_BY "PB_CMD_kin_start_of_path"] } {
return
   }


   global mom_kin_machine_type

   if { ![string compare "lathe" $mom_kin_machine_type] } {
      set mom_kin_machine_type "3_axis_mill"
      MOM_reload_kinematics

      set mom_kin_machine_type "lathe"
      MOM_reload_kinematics
   }
}


#=============================================================
proc PB_CMD_run_postprocess { } {
#=============================================================
# pb_post_base -
#
# This is an example showing how MOM_run_postprocess can be used.
# It can be called in the Start of Program event (or anywhere)
# to process the same objects being posted with a secondary post.
#
# ==> It's advisable NOT to use the active post and the same
#     output file for this secondary posting process.
# ==> Ensure legitimate and fully qualified post processor and
#     output file are specified with the command.
#

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# CAUTION - Comment out next line to activate this function!
return
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++

   MOM_run_postprocess "[file dirname $::mom_event_handler_file_name]/MORI_HORI_Sub.tcl"\
                       "[file dirname $::mom_event_handler_file_name]/MORI_HORI_Sub.def"\
                       "${::mom_output_file_directory}sub_program.out"
}


#=============================================================
proc PB_CMD_set_contour_motion { } {
#=============================================================
# This command is to set contour motion as part contour data (value 1) or tracking path data (value 2)
# depending on whether cutter compensation UDE has been set or not.
#
# This command is used in PB_CMD_init_rough_turn_cycle_output.
#
# 25-Dec-2015 Shuai - Initial version

  global mom_cutcom_status
  global dpp_save_cutcom_status
  global mom_sys_output_contour_motion

  if {[info exists mom_cutcom_status] && \
      ($mom_cutcom_status=="LEFT" || $mom_cutcom_status=="RIGHT")} {

     # If user adds cutcom UDE, save the status and notify NX/Post to process part contour data.
     set dpp_save_cutcom_status $mom_cutcom_status
     set mom_sys_output_contour_motion 1

  } else {

     # If user does not add cutcom UDE, notify NX/Post to process tracking path data.
     set mom_sys_output_contour_motion 2
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
proc PB_CMD_set_lathe_arc_plane { } {
#=============================================================
# This custom command will switch the valid arc plane for lathes
# from XY to ZX when the users selects the ZX lathe work
# plane in the MCS dialog.  If this custom command is not used then
# all arcs will be output as linear moves when the user selects the
# ZX Plane.
#
# Post Builder v3.0.1 executes this custom command automatically
# for all lathe posts.

  global mom_lathe_spindle_axis
  global mom_kin_arc_valid_plane

   if { [info exists mom_lathe_spindle_axis] && ![string compare "MCSZ" $mom_lathe_spindle_axis] } {
      set mom_kin_arc_valid_plane  "ZX"
      MOM_reload_kinematics
   }
}


#=============================================================
proc PB_CMD_set_turning_cycle_type { } {
#=============================================================
# This command is to set turning cycle type according to the step angle.
#
# This command is used in proc PB_CMD_turn_cycle_contour_start.
#
# 25-Dec-2015 Shuai - Initial version

  global mom_level_step_angle
  global dpp_turn_cycle_g_code
  global dpp_turn_cycle_retract
  global mom_clearance_from_faces
  global mom_clearance_from_diameters
  global dpp_turn_cycle_msg
  global mom_operation_name

# Set rough turning cycle type according to the step angle
  if { [EQ_is_equal $mom_level_step_angle 270] || [EQ_is_equal $mom_level_step_angle 90] } {

    set dpp_turn_cycle_g_code 72
    set dpp_turn_cycle_retract $mom_clearance_from_faces
    set dpp_turn_cycle_msg "ROUGH FACE CYCLE"

  } elseif { [EQ_is_equal $mom_level_step_angle 180] || [EQ_is_equal $mom_level_step_angle 0] } {

    set dpp_turn_cycle_g_code 71
    set dpp_turn_cycle_retract $mom_clearance_from_diameters
    set dpp_turn_cycle_msg "ROUGH TURN CYCLE"

  } else {

      MOM_display_message "$mom_operation_name: Turning cycle type (G71 or G72) could be set according to the value of Level Angle which is configured in Path Settings.\
                           \nThis value should be 0, 90, 180 or 270. Please recheck the parameters. Post processing will be aborted." "Postprocessor Error Message" "E"
      MOM_abort_program
  }

}


#=============================================================
proc PB_CMD_spindle_prestart_under_constant_surface_speed_control { } {
#=============================================================
# If use constant surface speed control mode, preset the revolution speed and
# output revolution speed in rpm mode to turn on the spindle
#
# 05-30-2013 levi - Initial version

  global mom_spindle_mode
  global dpp_spindle_is_out

  catch { unset dpp_spindle_is_out }

  if { ![string compare "SFM" $mom_spindle_mode] || ![string compare "SMM" $mom_spindle_mode] } {
     MOM_force once G_spin M_spindle S
     MOM_do_template spindle_rpm_preset
  }
}


#=============================================================
proc PB_CMD_spindle_sfm_prestart { } {
#=============================================================
  global mom_spindle_mode

   # Output preset instructions when spindle mode is SFM or SMM.
   if { ![string compare "SFM" $mom_spindle_mode] || ![string compare "SMM" $mom_spindle_mode] } {
      MOM_force once G_spin M_spindle S
      MOM_do_template spindle_rpm_preset
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
proc PB_CMD_turn_cycle_contour_end { } {
#=============================================================
# This command is to output the contour data and adjust the sequence number.
#
# 30-May-2013 levi  - Initial version
# 28-Oct-2015 shuai - Output return motion NC codes.
# 25-Dec-2015 shuai - Modify the code structure so as to make logical more clear.
# 13-Dec-2016 shuai - Bug fix PR7290132. Output the correct line number for P and Q
#                     no matter the output status of sequence number is ON or OFF.
#

  global dpp_rough_turn_cycle_start
  global dpp_contour_list
  global dpp_contour_list_length
  global mom_sys_cycle_seq_num_on
  global mom_sys_output_contour_motion
  global mom_cutcom_status
  global mom_template_subtype
  global mom_profiling
  global mom_operation_name_list
  global mom_machine_cycle_subroutine_name
  global mom_operation_name

# Flag to indicate rough turning cycle contour end
  set dpp_rough_turn_cycle_start 0

# Store the end tag in the list
  set o_buffer [MOM_do_template turn_cycle_end_tag CREATE]
  lappend dpp_contour_list $o_buffer

##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# When cutter compensation UDE isn't set, rough operation's contour data will be overridden
# with associated finish operation by using extended command MOM_post_oper_path.
# So far, NX will only override the contour data for roughing OD & ID for now,
# because FACING does not have associated finishing operation.
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# <shuai 2016-Nov-25> - Exclude the own name of rough turning operation from the operation name list.
# Override rough contour data with finish operation
  if {([info exists mom_template_subtype] && [string match "*ROUGH*" $mom_template_subtype]) && \
      ([info exists mom_sys_output_contour_motion] && ($mom_sys_output_contour_motion == 2))} {

     if {([info exists mom_operation_name] && [info exists mom_operation_name_list] && [info exists mom_machine_cycle_subroutine_name]) && \
          [lsearch $mom_operation_name_list $mom_machine_cycle_subroutine_name] >= 0 && \
         ![string match $mom_machine_cycle_subroutine_name $mom_operation_name] } {

        PB_CMD_override_rough_contour_data_with_finish
     }
  }

# Get the length of the list
  set dpp_contour_list_length [llength $dpp_contour_list]

# Save current sequence number output status
  set ::dpp_seq_status [MOM_set_seq_on]

  if {[info exists ::dpp_seq_status] && ($::dpp_seq_status == "off")} {
     MOM_set_seq_off
  }

# Calculate start and end line number of contour
  PB_CMD_calculate_contour_line_number

# Output G70 G71 or G72 command depending on operation type
  PB_CMD_output_turning_cycle_command

# Output the contour NC codes
  if {$mom_sys_cycle_seq_num_on==0} {

     for {set i 0} {$i<$dpp_contour_list_length} {incr i} {

        if {$i==0 || $i==$dpp_contour_list_length-1} {
           MOM_set_seq_on
        }

        set line [lindex $dpp_contour_list $i]
        MOM_output_literal $line

        MOM_set_seq_off
     }

  } else {

     MOM_set_seq_on

     foreach line $dpp_contour_list {
        MOM_output_literal $line
     }
  }

# Restore original sequence number output status
  if {[info exists ::dpp_seq_status] && ($::dpp_seq_status == "off")} {
     MOM_set_seq_off
  } else {
     MOM_set_seq_on
  }

  catch {unset ::dpp_seq_status}

# Output the return motion NC codes
  global dpp_return_motion_list
  foreach line $dpp_return_motion_list {
     MOM_output_literal $line
  }

# Additional profiling can be selected in a rough opeation and output after rough turning cycle.
# If user adds profile in tool path, some conditions should be checked to fulfill.
# No need to check these in finish turning operation.
  if {![string match "*FINISH*" $mom_template_subtype] } {

     if {[info exists mom_profiling] && ($mom_profiling == 1)} {

        # Output additional profiling.
        set ::dpp_turn_cycle_g_code 70
        set ::dpp_finish_feed $::mom_feedrate_profile_cut
        MOM_do_template turn_cycle_finishing
     }
  }

# Set NX/Post to end contour output mode
  set mom_sys_output_contour_motion 0

# Cancle tool nose radius compensation
  if {[info exists mom_cutcom_status]} {

     if {$mom_cutcom_status=="LEFT" || $mom_cutcom_status=="RIGHT"} {

        MOM_force once G_cutcom
        MOM_do_template cutcom_off
        set mom_cutcom_status "UNDEFINED"
     }
  }

}


#=============================================================
proc PB_CMD_turn_cycle_contour_start { } {
#=============================================================
# This command is to detect the rough turning cycle type, calculate the cycle parameters
# and create a list to store the contour datas and start tag and end tag.
#
# 05-30-2013 levi  - Initial version
# 10-28-2015 shuai - Add flag dpp_return_motion_start to indicate return motion end.
# 12-25-2015 shuai - Modify the code structure so as to make logical more clear.

  global dpp_turn_cycle_g_code
  global dpp_rough_turn_cycle_start
  global dpp_contour_list
  global dpp_return_motion_start

# Flag to indicate return motion end
  set dpp_return_motion_start 0

# Flag to indicate rough turning cycle contour begin
  set dpp_rough_turn_cycle_start 1

# Set default G motion type for rough turning cycle
  set dpp_turn_cycle_g_code 71

# Set rough turning cycle type according to the step angle
  PB_CMD_set_turning_cycle_type

# Calculate the parameters for turning cycle block
  PB_CMD_calculate_parameters_for_turning_cycle_block

# Create a list to store the contour NC codes, start tag and end tag
  set dpp_contour_list [list]

# Store the start tag
  set o_buffer [MOM_do_template turn_cycle_start_tag CREATE]
  lappend dpp_contour_list $o_buffer

}


#=============================================================
proc PB_CMD_uplevel_MOM_generic_cycle { } {
#=============================================================
# This command is used to handle G70/G71/G72 with generic cycle enhancement.
#
# <lili  2013-06-27> Initial version
# <shuai 2015-10-25> Modify for fanuc G70/G71/G72.
# <shuai 2015-12-25> Modify the code structure so as to make logical more clear.

uplevel #0 {
#=============================================================
proc MOM_generic_cycle { } {
#=============================================================

  global mom_generic_cycle_status
  global mom_sys_output_contour_motion
  global mom_from_status
  global mom_start_status
  global mom_motion_type
  global mom_operation_name
  global dpp_return_motion_list
  global dpp_return_motion_start
  global dpp_first_buffer_for_return_motion
  global mom_post_oper_path

  if {[info exists mom_generic_cycle_status] && ($mom_generic_cycle_status == 1)} {

     # Initialize G71/G72 output at generic cycle start
     PB_CMD_init_rough_turn_cycle_output

     # <shuai 2016-Nov-25> - If a finish operation uses the previous corresponding contour of a rough turning operation,
     #                       it will also need to skip to the next generic event.
     if {([info exists mom_sys_output_contour_motion] && ($mom_sys_output_contour_motion == 1 || $mom_sys_output_contour_motion == 2)) || \
         ([info exists ::dpp_fanuc_turning_cycle_type] && ($::dpp_fanuc_turning_cycle_type == "Rough Finish"))} {

        # <shuai 2016-Nov-25> - Remove the checking condition for G70\G71\G72 that whether a from point has been set or not.
        # Check whether a start point has been set
        if {([info exists mom_start_status] && $mom_start_status == 1) || \
            ([info exists mom_motion_type] && $mom_motion_type == "APPROACH")} {

         ##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
         # When posting both rough and finish turning cycle operation (Scenario 2), contour data of finish operation will be used for rough.
         # So NX will use extended command MOM_post_oper_path to post the finish operation in the rough operation to get contour data
         # and mom_post_oper_path is set to 1 in subpost run by MOM_post_oper_path.
         #
         # Then NX will use NC codes between events MOM_generic_cycle as contour data.
         # Because MOM_contour_start and MOM_contour_end don't output in MOM_post_oper_path.
         #
         # In other scenarios, skip the events between MOM_generic_cycle
         # and use NC codes between events MOM_contour_start and MOM_contour_end as contour data.
         ##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

           if {[info exists mom_post_oper_path] && ($mom_post_oper_path == 1)} {

              # Set start mark of finish contour data in output file
              PB_CMD_finish_turn_cycle_contour_start

           } else {

              # Skip to next generic which should be cycle off
              MOM_skip_handler_to_event generic_cycle
           }

        } else {

           MOM_display_message "$mom_operation_name: None of start point or approach path is defined before turning cycle in this operation.\
                                \nPlease recheck the parameters. Post processing will be aborted." "Postprocessor Error Message" "E"
           MOM_abort_program
        }
     }
  }

  if {[info exists mom_generic_cycle_status] && ($mom_generic_cycle_status == 0)} {

     if {[info exists mom_sys_output_contour_motion] && \
         ($mom_sys_output_contour_motion == 1 || $mom_sys_output_contour_motion == 2)} {

        if {[info exists mom_post_oper_path] && ($mom_post_oper_path == 1)} {

           # Set end mark of finish contour data in output file
           PB_CMD_finish_turn_cycle_contour_end
        }

        # Flag to indicate return motion begin
        set dpp_return_motion_start 1

        # Flag to indicate the first buffer for return motion
        set dpp_first_buffer_for_return_motion 1

        # Create a list to store the return motion NC codes
        set dpp_return_motion_list [list]
     }
  }

} ; #MOM_generic_cycle
} ; #uplevel 0

}


#=============================================================
proc ABORT_EVENT_CHECK { } {
#=============================================================
# Called by every motion event to abort its handler based on
# the setting of mom_sys_abort_next_event.
#
   if { [info exists ::mom_sys_abort_next_event] && $::mom_sys_abort_next_event } {
      if { [CMD_EXIST PB_CMD_kin_abort_event] } {
         PB_CMD_kin_abort_event
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
proc ARR_sort_array_to_list { ARR {by_value 0} {by_decr 0} } {
#=============================================================
# This command will sort and build a list of elements of an array.
#
#   ARR      : Array Name
#   by_value : 0 Sort elements by names (default)
#              1 Sort elements by values
#   by_decr  : 0 Sort into increasing order (default)
#              1 Sort into decreasing order
#
#   Return a list of {name value} couplets
#
#-------------------------------------------------------------
# Feb-24-2016 gsl - Added by_decr flag
#
   upvar $ARR arr

   set list [list]
   foreach { e v } [array get arr] {
      lappend list "$e $v"
   }

   set val [lindex [lindex $list 0] $by_value]

   if { $by_decr } {
      set trend "decreasing"
   } else {
      set trend "increasing"
   }

   if [expr $::tcl_version > 8.1] {
      if [string is integer "$val"] {
         set list [lsort -integer    -$trend -index $by_value $list]
      } elseif [string is double "$val"] {
         set list [lsort -real       -$trend -index $by_value $list]
      } else {
         set list [lsort -dictionary -$trend -index $by_value $list]
      }
   } else {
      set list    [lsort -dictionary -$trend -index $by_value $list]
   }

return $list
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


#=============================================================================
proc COMPARE_NX_VERSION { this_ver target_ver } {
#=============================================================================
# Compare a given NX version with target version.
# ==> Number of fields will be compared based on the number of "." contained in target.
#
# Return 1: Newer
#        0: Same
#       -1: Older
#

   set vlist_1 [split $this_ver   "."]
   set vlist_2 [split $target_ver "."]

   set ver_check 0

   set idx 0
   foreach v2 $vlist_2 {

      if { $ver_check == 0 } {
         set v1 [lindex $vlist_1 $idx]
         if { $v1 > $v2 } {
            set ver_check 1
         } elseif { $v1 == $v2 } {
            set ver_check 0
         } else {
            set ver_check -1
         }
      }

      if { $ver_check != 0 } {
         break
      }

      incr idx
   }

return $ver_check
}


#=============================================================================
proc DO_BLOCK { block args } {
#=============================================================================
# May-10-2017 gsl - New (PB v12.0)
#
   set option [lindex $args 0]

   if { [CMD_EXIST MOM_has_definition_element] } {
      if { [MOM_has_definition_element BLOCK $block] } {
         if { $option == "" } {
            return [MOM_do_template $block]
         } else {
            return [MOM_do_template $block $option]
         }
      } else {
         CATCH_WARNING "Block template $block not found."
      }
   } else {
      if { $option == "" } {
         return [MOM_do_template $block]
      } else {
         return [MOM_do_template $block $option]
      }
   }
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

        #<11-05-2013> Escape spaces
         set cmd [concat exec $command_string > \"$result_file\"]
         regsub -all {\\} $cmd {\\\\} cmd
         regsub -all { }  $result_file {\\\ } result_file

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
proc HANDLE_FIRST_LINEAR_MOVE { } {
#=============================================================
# Called by MOM_linear_move to handle the 1st linear move of an operation.
#
   if { ![info exists ::first_linear_move] } {
      set ::first_linear_move 0
   }
   if { !$::first_linear_move } {
      PB_first_linear_move
      incr ::first_linear_move
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
proc OPERATOR_MSG { msg {seq_no 0} } {
#=============================================================
# This command will output a single or a set of operator message(s).
#
#   msg    : Message(s separated by new-line character)
#   seq_no : 0 Output message without sequence number (Default)
#            1 Output message with sequence number
#

   foreach s [split $msg \n] {
      set s1 "$::mom_sys_control_out $s $::mom_sys_control_in"
      if { !$seq_no } {
         MOM_suppress once N
      }
      MOM_output_literal $s1
   }

   set ::mom_o_buffer ""
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
proc TRACE { {up_level 0} } {
#=============================================================
# "up_level" to be a negative integer
#
   set start_idx 1

   set str ""
   set level [expr [info level] - int(abs($up_level))]

   for { set i $start_idx } { $i <= $level } { incr i } {
      if { $i < $level } {
         set str "${str}[lindex [info level $i] 0]\n"
      } else {
         set str "${str}[lindex [info level $i] 0]"
      }
   }

return $str
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

      set VAR [string trim $VAR]
      if { $VAR != "" } {

         upvar $VAR var

         if { [array exists var] } {
            if { [expr $::tcl_version > 8.1] } {
               array unset var
            } else {
               foreach a [array names var] {
                  if { [info exists var($a)] } {
                     unset var($a)
                  }
               }
               unset var
            }
         }

         if { [info exists var] } {
            unset var
         }

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
proc WORKPLANE_SET { } {
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
                                 mom_kin_ind_to_dependent_head_x \
                                 mom_kin_ind_to_dependent_head_z]

   set unit_depen_arr_list [list mom_sys_home_pos]

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


