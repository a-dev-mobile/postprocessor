#===============================================================================
# Exported Custom Commands created by danilov
# on 15 ñåíòÿáðÿ 2016 ã. 12:20:17 RTZ 2 (зима)
#===============================================================================



#=============================================================
proc PB_CMD_CYCLE_thread { } {
#=============================================================
# This command is used to map lathe thread parameters.
# Under machine control cycle output condition, MOM_load_lathe_thread_cycle_params will return 1
# if it is executed properly. It will load cycle97 thread related MOM variables
# mom_lathe_thread_crest_line_start mom_lathe_thread_root_line_start
# mom_lathe_thread_crest_line_end mom_lathe_thread_clearance_start
# mom_lathe_thread_root_line_end  mom_lathe_thread_clearance_end
# MOM_skip_handler_to_event cycle_off is used to skip events between current event
# to MOM_cycle_off.
global mom_thread_cycle_init_flag
if {![info exist mom_thread_cycle_init_flag] || \
               $mom_thread_cycle_init_flag != "TRUE" } { return }

global mom_thread_cycle_mid ; # First cut depth
global mom_thread_cycle_pit ; # Thread pitch
global mom_thread_cycle_spl ; # Z start point
global mom_thread_cycle_fpl ; # Z end point
global mom_thread_cycle_dm1 ; # Diam start
global mom_thread_cycle_dm2 ;  # Diam end
global mom_thread_cycle_fal ; # Finish allowance
global mom_thread_cycle_nrc ; # Number of rough passes
global mom_thread_cycle_iang ; # Infeed angle
global mom_thread_cycle_numt ; # Number of Starts
global mom_thread_cycle_tdep ; # Profile depth
global mom_thread_cycle_cone ; # Cone as Angle or delta R
global mom_thread_cycle_nid ; # Number of spring passes
global mom_thread_cycle_tdep ; # Total depth

global mom_lathe_thread_crest_line_start mom_lathe_thread_crest_line_end
global mom_lathe_thread_root_line_start  mom_lathe_thread_root_line_end
global mom_thread_infeed_vector mom_thread_infeed_angle mom_thread_engage_type

# global mom_template_subtype
global mom_sys_lathe_x_factor
global mom_sys_lathe_x_double
global mom_sys_lathe_z_factor
global mom_turn_thread_pitch_lead
global mom_number_of_starts
global mom_number_of_chases
global mom_lathe_spindle_axis

global mom_total_depth
global mom_turn_cycle_total_depth
# global mom_total_depth_angle
global mom_total_depth_increment_type ; # 0 постоянная 1 индивидуальная 2 %сохр. (дегрессивная)
global mom_total_depth_finish_passes_increment
global mom_total_depth_finish_passes_number_of_passes

global mom_total_depth_variable_number_of_passes
global mom_tool_dependent_total_depth_variable_increment
global mom_total_depth_constant_increment
global mom_total_depth_constant_increment_source ; # 4 = %of tool
global mom_total_depth_percentage_maximum
global mom_total_depth_percentage
global mom_total_depth_percentage_minimum

global mom_lathe_thread_advance_type ; # 1 - constant, 2 - increase, 3 - decrease
global mom_lathe_thread_increment

# global mom_turn_cycle_total_depth
# global mom_lathe_thread_clearance_start mom_lathe_thread_clearance_end
# global mom_crest_line_offset
# global mom_root_line_offset

global mom_tool_insert_length
# global mom_minimum_clearance
global RAD2DEG

if {![CMD_EXIST MOM_load_lathe_thread_cycle_params ] || ![MOM_load_lathe_thread_cycle_params ] } { return 0 }

#++++++++++++++++++++++++++++++++++++++++++++++++++++
## PITCH
#++++++++++++++++++++++++++++++++++++++++++++++++++++
  set mom_thread_cycle_pit [expr $mom_turn_thread_pitch_lead/$mom_number_of_starts]

#++++++++++++++++++++++++++++++++++++++++++++++++++++
## SPL thread start point longitudinal
## FPL thread end point longitudinal
## DM1 thread start point diameter
## DM2 thread end point diameter
#++++++++++++++++++++++++++++++++++++++++++++++++++++
      set x_factor [expr $mom_sys_lathe_x_factor * $mom_sys_lathe_x_double]
  if {[string match $mom_lathe_spindle_axis "MCSX"]} {
         set mom_thread_cycle_spl $mom_lathe_thread_crest_line_start(0)
         set mom_thread_cycle_fpl $mom_lathe_thread_crest_line_end(0)
         set mom_thread_cycle_dm1 [expr 2*$mom_lathe_thread_crest_line_start(1)]
         set mom_thread_cycle_dm2 [expr 2*$mom_lathe_thread_crest_line_end(1)]
  } elseif {[string match $mom_lathe_spindle_axis "MCSZ"]} {
         set mom_thread_cycle_spl [expr $mom_lathe_thread_crest_line_start(2)*$mom_sys_lathe_z_factor]
         set mom_thread_cycle_fpl [expr $mom_lathe_thread_root_line_end(2)*$mom_sys_lathe_z_factor]
         set mom_thread_cycle_dm1 [expr $mom_lathe_thread_crest_line_start(0)*$x_factor]
         set mom_thread_cycle_dm2 [expr $mom_lathe_thread_root_line_end(0)*$x_factor]
    }

#++++++++++++++++++++++++++++++++++++++++++++++++++++
## Cone as Angle or delta R
#++++++++++++++++++++++++++++++++++++++++++++++++++++
   set mom_thread_cycle_cone [expr $mom_lathe_thread_crest_line_end(0) - $mom_lathe_thread_crest_line_start(0)]

#++++++++++++++++++++++++++++++++++++++++++++++++++++
## FAL finish allowance
#++++++++++++++++++++++++++++++++++++++++++++++++++++
       set fal_ 0
   for {set i 0} {$i<100} {incr i} {
         set fal_ [expr $fal_ + $mom_total_depth_finish_passes_increment($i)*$mom_total_depth_finish_passes_number_of_passes($i)]
       }
   set mom_thread_cycle_fal $fal_

   if { $mom_total_depth_increment_type == 2 && \
                     $mom_thread_cycle_fal == 0 && \
               $mom_total_depth_percentage_minimum != 0 } {
           set mom_thread_cycle_fal $mom_total_depth_percentage_minimum
      }

#++++++++++++++++++++++++++++++++++++++++++++++++++++
## NRC roughing cuts number. Just In Case  NOT FOR Integrex machine
## MID first cut depth
#++++++++++++++++++++++++++++++++++++++++++++++++++++
       set number_rc 0
   if { $mom_total_depth_increment_type == 0 } {
        if {[info exists mom_total_depth_constant_increment_source] && \
                           $mom_total_depth_constant_increment_source == 4 } {
              set constant_depth [expr $mom_tool_insert_length*$mom_total_depth_constant_increment/100]
         } else {
              set constant_depth $mom_total_depth_constant_increment
            }
       set mom_thread_cycle_nrc [expr ceil(($mom_turn_cycle_total_depth - $mom_thread_cycle_fal)/$constant_depth)]
       set mom_thread_cycle_mid $constant_depth

   } elseif { $mom_total_depth_increment_type == 1 } {
       for { set i 0 } { $i < 100 } { incr i } {
             set var_num $mom_total_depth_variable_number_of_passes($i)
             set number_rc [expr $number_rc + $var_num]
       }
      set mom_thread_cycle_nrc $number_rc
      set mom_thread_cycle_mid $mom_tool_dependent_total_depth_variable_increment(0)

   } elseif { $mom_total_depth_increment_type == 2 } {
         set mom_thread_cycle_mid $mom_total_depth_percentage_maximum
         set mom_thread_cycle_nrc [expr 100/$mom_total_depth_percentage]
     }

#++++++++++++++++++++++++++++++++++++++++++++++++++++
# SDIS clearance == $mom_minimum_clearance
#++++++++++++++++++++++++++++++++++++++++++++++++++++
# global mom_minimum_clearance

#++++++++++++++++++++++++++++++++++++++++++++++++++++
# PIT1 0=Constant Pitch, >0=Increase Pitch, <0=Decrease Pitch
## Just In Case  NOT FOR Integrex machine
#++++++++++++++++++++++++++++++++++++++++++++++++++++
if {[info exist mom_lathe_thread_advance_type]} {
     switch $mom_lathe_thread_advance_type {
         1 { set cycle_pit1 0 }
         2 { set cycle_pit1 [expr abs($mom_lathe_thread_increment)] }
         3 { set cycle_pit1 [expr -abs($mom_lathe_thread_increment)] }
   default { set cycle_pit1 0 }
     }
} else { set cycle_pit1 0 }

#++++++++++++++++++++++++++++++++++++++++++++++++++++
# NUMT Number of Starts. Just In Case  NOT FOR Integrex machine
#++++++++++++++++++++++++++++++++++++++++++++++++++++
# set mom_thread_cycle_numt $mom_number_of_starts

#++++++++++++++++++++++++++++++++++++++++++++++++++++
# NID Number of Spring Passes.
#++++++++++++++++++++++++++++++++++++++++++++++++++++
   set mom_thread_cycle_nid $mom_number_of_chases

#++++++++++++++++++++++++++++++++++++++++++++++++++++
# TDEP Profile Depth
#++++++++++++++++++++++++++++++++++++++++++++++++++++
   set mom_thread_cycle_tdep $mom_total_depth

#++++++++++++++++++++++++++++++++++++++++++++++++++++
## IANG Infeed angle
#++++++++++++++++++++++++++++++++++++++++++++++++++++
  if { $mom_thread_engage_type == 0 } {
         set mom_thread_cycle_iang 0
  } else {
         set mom_thread_cycle_iang [expr 90-$RAD2DEG*atan2($mom_thread_infeed_vector(1),$mom_thread_infeed_vector(0))]
      }

#++++++++++++++++++++++++++++++++++++++++++++++++++++
# SKIP to MOM_cycle _off
#++++++++++++++++++++++++++++++++++++++++++++++++++++

set cycle276_ "G276 P[format %2.2d $mom_thread_cycle_nid]"
append cycle276_ "02"
append cycle276_ "[format %2.2d [format %2.0f $mom_thread_cycle_iang]]"
append cycle276_ " R[format %0.3f $mom_thread_cycle_fal]"
MOM_output_literal $cycle276_
MOM_force_block once cycle_276
MOM_do_template cycle_276

## unset mom_thread_cycle_init_flag
return

if {[CMD_EXIST MOM_skip_handler_to_event]} {
    global thread_cycle_flag
    set thread_cycle_flag 1
    MOM_skip_handler_to_event cycle_off
   }

MOM_force_block once cycle_276
MOM_do_template cycle_276

### SuccessFull
return 1

}



