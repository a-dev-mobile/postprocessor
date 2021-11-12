
#+++++++++UTILITS++++++++++

#COMPARE__TEXT_TEXT
# compare text with text
# is true return 1
# is false return 0

#==========================

# DIVIDER__STRING_SYMBOL_NUMBER { line symbol}
#razdeliaet stroku po simvolu, vozvrashchaet stroku

#razdelit` stroku po stroke
# SPLIT__STRING_BY_STRING {string divider_strin}
#razdeliaet stroku po simvolu, vozvrashchaet stroku

#==========================

#VIEW_TEXT arg1 arg2 return text
#arg1=Start obrabotka

#arg2=1
#; Start obrabotka

#arg2=2
#; ----------- Start obrabotka -----------

#arg2=3
#; -----------
#; Start obrabotka
#; -----------

#arg2=4
#\n
#; -----------
#; Start obrabotka
#; -----------
#\n
#arg2=5
#; ===Start obrabotka===

#==========================


uplevel #0 {

array set CONSTANT_ARRAY [list \
{separator} {==============================} \
{start_programm} {====== START PROGRAMM ======} \
{end_programm} {====== END PROGRAMM ======} ]

#==========================



#*****************SETSTART**********************************************************************************

#===================================
proc ARRAY_INFO_START_OPERATION {} {
#===================================
global CONSTANT_ARRAY

set a0 [SET_comment $CONSTANT_ARRAY(separator)]
set a1 [SET_title_and_comment "operation  " [GET_mom_operation_name] ]
set a2 [SET_title_and_comment "tool_name  " [GET_mom_tool_name] ]

set a "$a0`$a1`$a2`$a0"

return  [SPLIT_TEXT $a]
}

#===================================
proc ARRAY_HEIDENHAINI_INFO_WORKPIECE {} {
#===================================
global mom_workpiece_x_min mom_workpiece_x_max
global mom_workpiece_y_min mom_workpiece_y_max
global mom_workpiece_z_min mom_workpiece_z_max
global boolean
if {$boolean!=1} {

if { ![info exist mom_workpiece_x_min] } {
set a "BLK FORM 0.1 Z X-100 Y-100 Z-100`BLK FORM 0.2 X100 Y100 Z0"

set boolean 1

return [SPLIT_TEXT $a]

}  else  {
set a "BLK FORM 0.1 Z $mom_workpiece_x_min $mom_workpiece_y_min $mom_workpiece_z_min`BLK FORM 0.2 $mom_workpiece_x_max $mom_workpiece_y_max $mom_workpiece_z_max"

set boolean 1

return [SPLIT_TEXT $a]
}
}
}


#===================================
proc SET_INFO_START_WORK {arg_1} {
#===================================
global CONSTANT_ARRAY
set result ""

if { $arg_1 == 1 } {
set a [VIEW_TEXT START_>_[GET_mom_operation_name] 1]

return "$a"
}

if { $arg_1 == 2 } {
set a [VIEW_TEXT start:_[GET_mom_operation_name] 1]
set b [VIEW_TEXT tool:_[GET_mom_tool_name] 1]

return "\n $a \n $b"
}


if { $arg_1 == 3 } {
set a [SET_comment ======================================]
set b [VIEW_TEXT START_>_[GET_mom_operation_name] 1]
return "\n$a\n$b"
}

if { $arg_1 == 4 } {
set a [SET_comment ======================================]
set b [VIEW_TEXT START_>_[GET_mom_operation_name] 1]
set c [VIEW_TEXT TOOL_>_[GET_mom_tool_name] 1]
set d [SET_comment ======================================]
return "\n$a\n$b\n$c\n$d\n"
}

if { $arg_1 == 5 } {
set o [VIEW_TEXT ====================================== 1]
set a [VIEW_TEXT [GET_mom_operation_name] 1]
set b [VIEW_TEXT [GET_mom_tool_name] 1]

return "\n$o\n$a\n$b"
}

return "NULL SET_INFO_START_WORK"

}




#===================================
proc ARRAY_INFO_START_PROGRAMM {arg_1} {
#===================================

#foreach name [ARRAY_INFO_START_PROGRAMM] {
#MOM_output_text $name
#}
global CONSTANT_ARRAY
if { $arg_1 == 1 } {

set a0 [SET_comment $CONSTANT_ARRAY(separator)]
set a1 [SET_comment "Postprocessor version - v1.0 Developer - Trofimov D.I."]
set a2 [SET_title_and_comment "NC_Programmer:" [GET_mom_logname]]
set a3 [SET_title_and_comment "DATA:" [GET_mom_date]]
set a4 [SET_title_and_comment  "FILE:" [GET_mom_output_file_full_name]]

set a "$a0`$a1`$a2`$a3`$a4`$a0"
return  [SPLIT_TEXT $a]
}

if { $arg_1 == 2 } {

set a0 [SET_comment $CONSTANT_ARRAY(separator)]
set a1 [SET_comment "Program: [GET_mom_group_name]" ]
set a2 [SET_comment  "Date: [GET_mom_date] | User:[GET_mom_logname]"]
set a3 [SET_comment  "Machine: DMU 60 evo, Siemens 840D | Type: Miling"]
set a4 [SET_comment  "File: [GET_mom_output_file_full_name]"]

set a "$a0`$a1`$a2`$a3`$a4`$a0"
return  [SPLIT_TEXT $a]
}

if { $arg_1 == 22 } {

set a0 [SET_comment "---"]
set a1 [SET_comment "Program: [GET_mom_group_name]" ]
set a2 [SET_comment  "Date: [GET_mom_date]"]
set a21 [SET_comment  "User:[GET_mom_logname]"]
set a3 [SET_comment  "Machine: Akira-Seiki V3"]
set a4 [SET_comment  "File: [GET_mom_output_file_full_name]"]

#set a "$a0`$a2`$a21`$a3`$a4`$a0"
set a "$a0`$a2`$a21`$a4`$a0"
return  [SPLIT_TEXT $a]
}

if { $arg_1 == 25 } {

set a0 [SET_comment "---"]
#set a1 [SET_comment "Program: [GET_mom_group_name]" ]
set a2 [SET_comment  "Date: [GET_mom_date]"]
set a21 [SET_comment  "User:[GET_mom_logname]"]
set a3 [SET_comment  "Machine: Lathe CAK50135"]
set a4 [SET_comment  "File: [GET_mom_output_file_full_name]"]

set a "$a0`$a2`$a21`$a3`$a4"
return  [SPLIT_TEXT $a]
}
if { $arg_1 == 26 } {

set a0 [SET_comment "---"]
set a1 [SET_comment "Program: [GET_mom_group_name]" ]
set a11 [SET_comment "Det: [GET_mom_part_name]" ]
set a2 [SET_comment  "Date: [GET_mom_date]"]
set a3 [SET_comment  "User:[GET_mom_logname]"]
set a4 [SET_comment  "Machine: DMC 635 V ecoline SIEMENS 840D sl"]
set a5 [SET_comment  "File: [GET_mom_output_file_full_name]"]

#set a "$a0`$a2`$a21`$a3`$a4`$a0"
set a "$a0`$a1`$a11`$a2`$a3`$a4`$a5"
return  [SPLIT_TEXT $a]
}


if { $arg_1 == 27 } {

set a0 [SET_comment "---"]
set a1 [SET_comment "Program: [GET_mom_group_name]" ]
set a2 [SET_comment "Det: [GET_mom_part_name]" ]
set a3 [SET_comment  "Date: [GET_mom_date]"]
set a4 [SET_comment  "User:[GET_mom_logname]"]
set a5 [SET_comment  "Machine: Haas VF-3 or SMM"]
set a6 [SET_comment  "File: [GET_mom_output_file_full_name]"]

#set a "$a0`$a2`$a21`$a3`$a4`$a0"
set a "$a0`$a1`$a2`$a3`$a4`$a5"
return  [SPLIT_TEXT $a]
}
if { $arg_1 == 28 } {

set a0 [SET_comment "---"]
set a1 [SET_comment "Program: [GET_mom_group_name]" ]
set a2 [SET_comment "Det: [GET_mom_part_name]" ]
set a3 [SET_comment  "Date: [GET_mom_date]"]
set a4 [SET_comment  "User:[GET_mom_logname]"]
set a5 [SET_comment  "Machine: X.mill 1100L CNC"]
set a6 [SET_comment  "File: [GET_mom_output_file_full_name]"]

#set a "$a0`$a2`$a21`$a3`$a4`$a0"
set a "$a0`$a2`$a3`$a4`$a5`$a6"
return  [SPLIT_TEXT $a]
}


if { $arg_1 == 29 } {

set a0 [SET_comment "---"]
set a1 [SET_comment "Program: [GET_mom_group_name]" ]
set a2 [SET_comment "Det: [GET_mom_part_name]" ]
set a3 [SET_comment  "Date: [GET_mom_date]"]
set a4 [SET_comment  "User:[GET_mom_logname]"]
set a5 [SET_comment  "Machine: X.mill 1100L CNC"]



set a "$a0`$a2`$a3`$a4`$a5"
return  [SPLIT_TEXT $a]
}


if { $arg_1 == 21 } {

set a0 [SET_comment $CONSTANT_ARRAY(separator)]
set a1 [SET_comment "Program: [GET_mom_group_name]" ]
set a2 [SET_comment  "Date: [GET_mom_date] | User:[GET_mom_logname]"]
set a3 [SET_comment  "Machine: DMU 60 evo, Siemens 840D | Type: Turning"]
set a4 [SET_comment  "File: [GET_mom_output_file_full_name]"]

set a "$a0`$a1`$a2`$a3`$a4`$a0"
return  [SPLIT_TEXT $a]
}
if { $arg_1 == 3 } {


set a1 [VIEW_TEXT "TOOL_LIST" 2]
set a2 [SET_comment "program: [GET_mom_group_name] user: [GET_mom_logname]"]
set a3 [SET_title_and_comment "date:" [GET_mom_date]]
set a4 [SET_comment  "file: [GET_mom_part_name]"]
set a5 [SET_comment $CONSTANT_ARRAY(separator)]
set a "$a1`$a2`$a3`$a4`$a5"
return  [SPLIT_TEXT $a]
}
}

#===================================
proc SET_INFO_END_WORK {arg_1} {
#===================================
global CONSTANT_ARRAY
set result ""
if { $arg_1 == 1 } {

append result "[SET_comment END:_[GET_mom_operation_name]]"
return $result
}


if { $arg_1 == 2 } {
set result [VIEW_TEXT END:_[GET_mom_operation_name] 2]

return $result
}

if { $arg_1 == 3 } {
return "
[SET_comment {---end work---}]
[SET_comment [GET_mom_operation_name]]"}


if { $arg_1 == 4 } {
set s "*******************"
append result "[SET_comment $s]"
append result "\n[SET_comment END:_[GET_mom_operation_name]]"
append result "\n[SET_comment $s]"
return $result
}



return "NULL SET_INFO_END_WORK"
}
#===================================
proc SET_comment {arg_text} {
#===================================

return "[GET_mom_sys_control_out] $arg_text [GET_mom_sys_control_in]"

}

#===================================
proc SET_title_and_comment {arg_text1 arg_text2} {
#===================================

return "[GET_mom_sys_control_out] $arg_text1 $arg_text2 [GET_mom_sys_control_in]"

}


#===================================
proc SET_separator_and_comment {arg_text} {
#===================================
global CONSTANT_ARRAY
return [SET_comment "$CONSTANT_ARRAY(separator) $arg_text $CONSTANT_ARRAY(separator)"]
}
#===================================
proc SPLIT_TEXT {arg_text} {
#===================================
return [split $arg_text "`"]
}

proc LIST_DEL_DUBLI {list} {
    array set included_arr [list]
    set unique_list [list]
    foreach item $list {
        if { ![info exists included_arr($item)] } {
            set included_arr($item) ""
            lappend unique_list $item
        }
    }
    unset included_arr
    return $unique_list
}


#----------------------------SET END --------------------------










#++++++++++++++++++++++ START UTILTES+++++++++++++++++++++++++







proc COMPARE__ALL_SYMBOL_FROM_TEXT_WITH_SYMBOL {arg_text1 arg_text2} {
set t $arg_text1
set s $arg_text2


for {set i 0} {$i < [string length $arg_text1]} {incr i} {

   if {[string equal [string index $arg_text1 $i]  $arg_text2]} {
   return 1
    }
}
    return 0
   }



proc COMPARE__TEXT_TEXT {arg_text1 arg_text2} {

   if {[string equal $arg_text1 $arg_text2 ]} {
      return 1
} else {
      return 0
   }

   }


#MOM_skip_handler_to_event MOM_end_of_path
proc SKIP_ISPOLNENIE {isp} {
global CONSTANT_ARRAY
set a "$CONSTANT_ARRAY(separator_for_skip_isp)"
set b "$CONSTANT_ARRAY(position_for_skip_isp)"
set c [DIVIDER__STRING_SYMBOL_NUMBER [GET_mom_operation_name] "$a" "$b"]

if {[COMPARE__TEXT_TEXT "$c" "$isp"]} {
MOM_output_text [VIEW_TEXT "SKIP ISPOLNENIE_$isp" 5]
MOM_skip_handler_to_event MOM_end_of_patch
   return 1
} else {
MOM_output_text [VIEW_TEXT "SKIP ISPOLNENIE_$isp" 5]

return 0
}
}


proc DIVIDER__STRING_SYMBOL_NUMBER { line symbol number } {
   set line_list [split $line $symbol]
   return [lindex $line_list $number]

}


proc VIEW_TEXT {arg_text arg_1} {
global CONSTANT_ARRAY
if { $arg_1 == 0 } {

return $arg_text  }
#; Start obrabotka
if { $arg_1 == 1 } {

    if { [string length $arg_text] < 2 }  {
    return ""
    } else {
return [SET_comment  $arg_text] }
}
#; ----------- Start obrabotka -----------
if { $arg_1 == 2 } {
return  [SET_separator_and_comment $arg_text ]     }
#; -----------
#; Start obrabotka
#; -----------
if { $arg_1 == 3 } {
set s "====="
return  "[SET_comment $s\n[SET_comment $arg_text]\n[SET_comment $s]]"}
#\n
#; -----------
#; Start obrabotka
#; -----------
#\n
if { $arg_1 == 4 } { return  "\n[SET_comment $CONSTANT_ARRAY(separator)]\n[SET_comment $arg_text]\n[SET_comment $CONSTANT_ARRAY(separator)]\n"}

#; ===Start obrabotka===
if { $arg_1 == 5 } {
 return  [SET_comment "=== $arg_text ==="]
 }
return ""
}















#-------------------------END UTILTES-------------------------

#==============================
proc GET_mom_attr_TOOL {arg_1} {
#==============================
#HOLDER_NAME_1
#HOLDER_NAME_2
#Базовый держатель Garant 301070_22 A=160 SK40

#ADAPTER_NAME_1
#ADAPTER_NAME_2
#Державка Multi-Master Iscar твердосплавная D9,6 MM S-A-L110-C16-T10C

#TOOL_NAME_1
#TOOL_NAME_2
#Фрезерная головка HM90 E90A D20-3-ММT12

#INSERT_NAME_1
#INSERT_NAME_2
#Пластина ZCC-CT ANGX150608PNR-GM YBG205



global mom_attr_TOOL_HOLDER_NAME_1
global mom_attr_TOOL_HOLDER_NAME_2

global mom_attr_TOOL_ADAPTER_NAME_1
global mom_attr_TOOL_ADAPTER_NAME_2

global mom_attr_TOOL_TOOL_NAME_1
global mom_attr_TOOL_TOOL_NAME_2

global mom_attr_TOOL_INSERT_NAME_1
global mom_attr_TOOL_INSERT_NAME_2

#---------------------------
#---------------------------
if {[info exist mom_attr_TOOL_HOLDER_NAME_1  ] } {
set h1 $mom_attr_TOOL_HOLDER_NAME_1
unset mom_attr_TOOL_HOLDER_NAME_1
} else { set h1 "" }
#---------------------------
if {[info exist mom_attr_TOOL_HOLDER_NAME_2  ] } {
set h2 $mom_attr_TOOL_HOLDER_NAME_2
unset mom_attr_TOOL_HOLDER_NAME_2
} else { set h2 "" }
#---------------------------
#---------------------------
if {[info exist mom_attr_TOOL_ADAPTER_NAME_1  ] } {
set a1 $mom_attr_TOOL_ADAPTER_NAME_1
unset mom_attr_TOOL_ADAPTER_NAME_1
} else { set a1 "" }
#---------------------------
if {[info exist mom_attr_TOOL_ADAPTER_NAME_2  ] } {
set a2 $mom_attr_TOOL_ADAPTER_NAME_2
unset mom_attr_TOOL_ADAPTER_NAME_2
 } else { set a2 "" }
#---------------------------
#---------------------------
if {[info exist mom_attr_TOOL_TOOL_NAME_1  ] } {
set t1 $mom_attr_TOOL_TOOL_NAME_1
unset mom_attr_TOOL_TOOL_NAME_1
 } else { set t1 "" }
#---------------------------
if {[info exist mom_attr_TOOL_TOOL_NAME_2  ] } {
set t2 $mom_attr_TOOL_TOOL_NAME_2
unset mom_attr_TOOL_TOOL_NAME_2
 } else { set t2 "" }
#---------------------------
#---------------------------
if {[info exist mom_attr_TOOL_INSERT_NAME_1  ] } {
set i1 $mom_attr_TOOL_INSERT_NAME_1
unset mom_attr_TOOL_INSERT_NAME_1
 } else { set i1 "" }
#---------------------------
 if {[info exist mom_attr_TOOL_INSERT_NAME_2  ] } {
set i2 $mom_attr_TOOL_INSERT_NAME_2
unset mom_attr_TOOL_INSERT_NAME_2
 } else { set i2 "" }
#---------------------------
 set a "$h1`$h2`$a1`$a2`$t1`$t2`$i1`$i2"
return  [SPLIT_TEXT $a] }

#==============================
proc INIT_TOOL_ARG { } {
#==============================
global status_tool
set status_tool "YES"
set tool_name_list [list]
array set ARR1 {}
array set ARR2 {}
array set ARR3 {}
array set ARR4 {}
array set ARR5 {}
array set ARR6 {}
array set ARR7 {}
return ""
}
#==============================
proc READ_TOOL_ARG { } {
#==============================
global status_tool
global ARR1
global ARR2
global ARR3
global ARR4
global ARR5
global ARR6
global ARR7
global tool_name_list


lappend tool_name_list "[GET_mom_tool_name]"
#lappend tool_name_list [GET_mom_tool_name]
#MOM_output_text " \n  [GET_mom_tool_name]"
#MOM_output_text "first status_tool $status_tool"

set listt [GET_mom_attr_TOOL 1]

#foreach name $listt { MOM_output_text "$name" }

if { [GET_mom_tool_number] != 0} {
    if { $status_tool == "YES" } {
set ARR1([GET_mom_tool_name]) $listt
set ARR2([GET_mom_tool_name]) [GET_mom_attr_TOOL_VYLET]
set ARR3([GET_mom_tool_name]) [GET_mom_attr_TOOL_NAME_1]
set ARR4([GET_mom_tool_name]) [GET_mom_tool_number]
set ARR5([GET_mom_tool_name]) [GET_mom_tool_flute_length]
set ARR6([GET_mom_tool_name]) [GET_mom_tool_type]
set ARR7([GET_mom_tool_name]) [GET_mom_tool_diameter]
}
if { [GET_mom_next_oper_has_tool_change] == "YES" } {
set status_tool "YES"
} else {
set status_tool "NO" }
}



#MOM_output_text "seccond status_tool $status_tool"
#MOM_output_text "GET_mom_next_oper_has_tool_change [GET_mom_next_oper_has_tool_change]"

return ""
}

#==============================
proc VIEW_TOOL_ARG {arg1 } {
#==============================
#ADD IN End of Programm
#---------------------------
#set list1 [VIEW_TOOL_ARG]
#foreach name $list1 {
#MOM_output_text  [VIEW_TEXT "$name" 1] }

# arg1 = 1 budet ukazan vy`let instrumenta
#---------------switch------------

global tool_name_list
global ARR1
global ARR2
global ARR3
global ARR4
global ARR5
global ARR6
global ARR7
set all_text [list]
set tool_name_list1 [LIST_DEL_DUBLI $tool_name_list]

foreach name $tool_name_list1 {


#если инструмент токарный то вылет не указываем -- неработает
#if {[COMPARE__TEXT_TEXT "$ARR6($name)" "Turning Tool-Standard"]}  {
#lappend all_text "$ARR6($name)"
#set arg1 0
#}
if {$arg1 == 1} {
lappend all_text  "\n==============="
# set tool ""

# # проверяем если нет атрибута TOOLS_NAME_1
# if {[info exist $ARR3($name) ] } {
# set tool $ARR3($name)
#   } else {
# set tool $name
# }
# N135 ( INSTRUMENT: MILL_6MM )
# N140 ( DIAMETR: 6.00 )
# N145 ( FLUTE LENGTH: 50.00 )GET_mom_tool_flute_length



lappend all_text  "T$ARR4($name) = $ARR3($name)"
lappend all_text  "VYLET = $ARR2($name)\n"
lappend all_text  "Type = $ARR6($name) "
lappend all_text  "Diameter = [format "%0.1f" $ARR7($name)] mm"
lappend all_text  "Flute length = [format "%0.1f" $ARR5($name)] mm\n"

# lappend all_text  "DIAMETR = [isNull $ARR3($name)]"
}


if {$arg1 == 2} {
lappend all_text  "\nD = [isNull $ARR3($name)] | R = [isNull $ARR5($name)] | L = [isNull $ARR2($name)] | T = [isNull $ARR4($name)] | $name"
}



# set ARR1([GET_mom_tool_name]) $listt
# set ARR2([GET_mom_tool_name]) [GET_mom_attr_TOOL_VYLET]
# set ARR3([GET_mom_tool_name]) [GET_mom_attr_TOOL_NAME_1]
# set ARR4([GET_mom_tool_name]) [GET_mom_tool_number]
# set ARR5([GET_mom_tool_name]) [GET_mom_tool_flute_length]
# set ARR6([GET_mom_tool_name]) [GET_mom_tool_type]
# set ARR7([GET_mom_tool_name]) [GET_mom_tool_diameter]


if {$arg1 == 0} {
lappend all_text  "-"
lappend all_text  "T $ARR4($name) = $ARR3($name)"
lappend all_text  "Type = $ARR6($name) "
lappend all_text  "Diameter = $ARR7($name) "
lappend all_text  "Flute length = $ARR5($name) "
}


foreach name1 $ARR1($name) {
 lappend all_text $name1
}
}
return  "$all_text "
}

proc isNull {arg} {

if {[info exist $arg ] } {
return $arg
  }
return ""
}

#===================================
proc GET_title_and_comment {arg_text1 arg_text2} {
#===================================

return "[GET_mom_sys_control_out] $arg_text1 $arg_text2 [GET_mom_sys_control_in]"

}

#==============================
proc GET_mom_attr_TOOL_NAME_1 { } {

global mom_attr_TOOL_TOOL_NAME_1

if {[info exist mom_attr_TOOL_TOOL_NAME_1  ] } {
set s $mom_attr_TOOL_TOOL_NAME_1

return $s
  }



return [GET_mom_tool_name]
}


#===================================
proc GET_mom_operation_notes   { } {
#===================================
set result ""
global mom_operation_notes

if { [info exist mom_operation_notes] && $mom_operation_notes(0) !=""  } {
    if {$mom_operation_notes(0) =="%"} {
    for {set i 1} {[info exists mom_operation_notes($i)]} {incr i 1} {
    append result "\n$mom_operation_notes($i)"
    }
    array unset mom_operation_notes
    return $result
    }

    if { $mom_operation_notes(0) !="%"} {
    for {set i 0} {[info exists mom_operation_notes($i)]} {incr i 1} {
    append result "\n[SET_comment $mom_operation_notes($i)]"
    }
    array unset mom_operation_notes
    return $result
}
   }

return ""
        }

#===================================

proc GET_mom_group_name { } {
#===================================
global mom_group_name
if {[info exist mom_group_name  ] } {
set s $mom_group_name
#unset mom_group_name
return $s
  }
return "O00001"
}



#===================================

proc GET_mom_attr_TOOL_VYLET { } {
#===================================

global mom_attr_TOOL_VYLET

if {[info exist mom_attr_TOOL_VYLET  ] } {
set s $mom_attr_TOOL_VYLET
return $s


 }  else {


    global mom_tool_holder_overall_length

 if {$mom_tool_holder_overall_length < 0.001} {

return "0"
 } else {


global mom_tool_length
global mom_tool_holder_offset
global mom_tool_tapered_shank_length
global mom_tool_use_tapered_shank

global extension
set tool_length $mom_tool_length
set holder_offset $mom_tool_holder_offset

if {[COMPARE__TEXT_TEXT "$mom_tool_use_tapered_shank" "Yes"]} {
         set shank_length $mom_tool_tapered_shank_length
} else {
        set shank_length 0
        }

set extension [expr $tool_length + $shank_length - $holder_offset]
set output [format "%0.0f" $extension]

return $output


 }
  }




 return "0"

}



#===================================
proc GET_mom_parent_group_name { } {
#===================================
global mom_parent_group_name
if {[info exist mom_parent_group_name  ] } {
set s $mom_parent_group_name
#unset mom_parent_group_name
return $s
    }
return ""
}
#===================================
#===================================
proc GET_mom_partfile_name { } {
#===================================
global mom_partfile_name
if {[info exist mom_partfile_name  ] } {
set s $mom_partfile_name
return $s
    }
return ""
}
#===================================


#===================================

proc GET_mom_sys_group_output { } {
#===================================
global mom_sys_group_output
if {[info exist mom_sys_group_output  ] } {
set s $mom_sys_group_output
 return $s
 }
return ""
}
#===================================




#===================================
proc GET_mom_tool_right_corner_radius    { } {
#===================================
global mom_tool_right_corner_radius
if {[info exist mom_tool_right_corner_radius      ] } { return $mom_tool_right_corner_radius     }
return "" }
#===================================

#===================================
proc GET_mom_tool_type     { } {
#===================================
global mom_tool_type
if {[info exist mom_tool_type        ] } { return $mom_tool_type       }
return "" }
#===================================

#===================================
proc GET_mom_array_oper     { } {
#===================================
global mom_array_var
if {[info exist mom_array_var        ] } { return $mom_array_var       }
return "" }
#===================================

#===================================
proc GET_mom_tool_corner_radius    { } {
#===================================

set a 0

switch [GET_mom_tool_type] {
   "Turning Tool-Standard" \
  { set a "[GET_mom_tool_nose_radius ]"  } \
  "Milling Tool-T Cutter" \
  { set a "[GET_mom_tool_lower_corner_radius]"  } \
  "Spot Drill" \
 { set a 0 } \
  "default"     \
  { set a  "[GET_mom_tool_corner1_radius]" } \""

 }


  return $a

  }






#===================================
proc GET_mom_tool_corner1_radius    { } {
#===================================
global mom_tool_corner1_radius
if {[info exist mom_tool_corner1_radius      ] } { return $mom_tool_corner1_radius     }
return "" }

  #===================================
proc GET_mom_tool_nose_radius    { } {
#===================================
global mom_tool_nose_radius
if {[info exist mom_tool_nose_radius      ] } { return $mom_tool_nose_radius     }
return "0" }

#====sw===============================

#===================================
proc GET_mom_tool_corner1_center_x    { } {
#===================================
global mom_tool_corner1_center_x
if {[info exist mom_tool_corner1_center_x      ] } { return $mom_tool_corner1_center_x     }
return "" }
#===================================

#===================================
proc GET_mom_tool_corner1_center_y    { } {
#===================================
global mom_tool_corner1_center_y
if {[info exist mom_tool_corner1_center_y      ] } { return $mom_tool_corner1_center_y     }
return "" }
#===================================

#===================================
proc GET_mom_tool_lower_corner_radius    { } {
#===================================
global mom_tool_lower_corner_radius
if {[info exist mom_tool_lower_corner_radius]      } { return $mom_tool_lower_corner_radius     }
return "" }
#===================================

#===================================
proc GET_mom_tool_left_corner_radius    { } {
#===================================
global mom_tool_left_corner_radius
if {[info exist mom_tool_left_corner_radius      ] } { return $mom_tool_left_corner_radius     }
return "" }
#===================================

#===================================
proc GET_mom_tool_flute_length  { } {
#===================================
global mom_tool_flute_length
if {[info exist mom_tool_flute_length    ] } { return $mom_tool_flute_length   }
return "" }
#===================================

#===================================
proc GET_mom_tool_insert_length   { } {
#===================================
global mom_tool_insert_length
if {[info exist mom_tool_insert_length      ] } { return $mom_tool_insert_length     }
return "null mom_tool_insert_length  " }
#===================================

#===================================
proc GET_mom_tool_holder_length     { } {
#===================================
global mom_tool_holder_length
if {[info exist mom_tool_holder_length        ] } { return $mom_tool_holder_length       }
return "null mom_tool_holder_length    " }
#===================================

#===================================
proc GET_mom_part_name      { } {
#===================================

global row_start
global row_end
global part_name
global mom_part_name

set row_start [expr [string last "\\" $mom_part_name] + 1]
set row_end [string length $mom_part_name]
set part_name [string range $mom_part_name $row_start $row_end]

if {[info exist mom_part_name          ] } { return $part_name }
return "null mom_part_name      " }
#===================================

#===================================
proc GET_mom_tool_length     { } {
#===================================
global mom_tool_length
if {[info exist mom_tool_length        ] } { return $mom_tool_length       }
return "null mom_tool_length    " }
#===================================
#===================================
proc GET_mom_tool_length_adjust_register       { } {
#===================================
global mom_tool_length_adjust_register
if {[info exist mom_tool_length_adjust_register        ] } { return $mom_tool_length_adjust_register       }
return "null mom_tool_length_adjust_register    " }
#===================================
#===================================
proc GET_mom_probe_length_adjust_adjust_register         { } {
#===================================
global mom_probe_length_adjust_adjust_register
if {[info exist mom_probe_length_adjust_adjust_register          ] } { return $mom_probe_length_adjust_adjust_register         }
return "null mom_probe_length_adjust_adjust_register      " }
#===================================
#===================================
proc GET_mom_tool_z_offset          { } {
#===================================
global mom_tool_z_offset
if {[info exist mom_tool_z_offset          ] } { return $mom_tool_z_offset         }
return "null mom_tool_z_offset      " }
#===================================
#===================================
proc GET_mom_kin_holder1_offset_z           { } {
#===================================
global mom_kin_holder1_offset_z
if {[info exist mom_kin_holder1_offset_z            ] } { return $mom_kin_holder1_offset_z           }
return "null mom_kin_holder1_offset_z        " }
#===================================
#===================================
proc GET_mom_tool_z_offset_defined             { } {
#===================================
global mom_tool_z_offset_defined
if {[info exist mom_tool_z_offset_defined            ] } { return $mom_tool_z_offset_defined           }
return "null mom_tool_z_offset_defined        " }
#===================================
#===================================
proc GET_mom_tool_zmount               { } {
#===================================
global mom_tool_zmount
if {[info exist mom_tool_zmount              ] } {
return [format "%0.0f" $mom_tool_zmount]             }
return "0"
}



#===================================
#c.dev.mobile
proc GET_mom_logname    { } {
#===================================
global mom_logname
if {[info exist mom_logname  ] } { return $mom_logname     }
return "NULL mom_logname"
}
#===================================

#===================================
proc GET_user_type_isp    { } {
#===================================
global user_type_isp
if {[info exist user_type_isp  ] } { return $user_type_isp     }
return ""
}
#===================================
proc GET_mom_date         { } {
#===================================
global mom_date
if {[info exist mom_date  ] } { return $mom_date     }
return "NULL mom_date"
}
#===================================
proc GET_mom_opstop_text         { } {
#===================================
global mom_opstop_text
if {[info exist mom_opstop_text   ] } { return $mom_opstop_text      }
return "NULL mom_opstop_text "
}
#===================================
proc GET_mom_sys_program_stop_code         { } {
#===================================
global mom_sys_program_stop_code
if {[info exist mom_sys_program_stop_code   ] } { return $mom_sys_program_stop_code      }
return "NULL mom_sys_program_stop_code "
}
#===================================
proc GET_mom_stop_text         { } {
#===================================
global mom_stop_text
if {[info exist mom_stop_text   ] } { return $mom_stop_text      }
return "NULL mom_stop_text "
}
#===================================
proc GET_mom_next_tool_name        { } {
#===================================
global mom_next_tool_name
if {[info exist mom_next_tool_name  ] } { return $mom_next_tool_name     }
return "NULL mom_next_tool_name"
}
#===================================
proc GET_mom_next_tool_status        { } {
#===================================
global mom_next_tool_status
if {[info exist mom_next_tool_status  ] } { return $mom_next_tool_status     }
return "NULL mom_next_tool_status"
}
#===================================
proc GET_mom_tool_diameter        { } {
#===================================
global mom_tool_diameter
if {[info exist mom_tool_diameter  ] } { return $mom_tool_diameter     }
return "NULL mom_tool_diameter"
}
#===================================
proc GET_mom_tool_number        { } {
#===================================
global mom_tool_number
if {[info exist mom_tool_number  ] } { return $mom_tool_number     }
return "0"
}
#===================================
proc GET_mom_sys_tool_time       { } {
#===================================
global mom_sys_tool_time
if {[info exist mom_sys_tool_time  ] } { return $mom_sys_tool_time     }
return "NULL mom_sys_tool_time"
}
#===================================
proc GET_mom_operation_name     { } {
#===================================
global mom_operation_name
if {[info exist mom_operation_name  ] } { return $mom_operation_name     }
return "NULL mom_operation_name"
}

#===================================
proc GET_mom_operation_type       { } {
#===================================
#return
#Planar Text
#Mill Machine Control
global mom_operation_type
if {[info exist mom_operation_type  ] } { return $mom_operation_type     }
return "NULL mom_operation_type"
}
#===================================
proc GET_mom_tool_name  { } {
#===================================
global mom_tool_name
if {[info exist mom_tool_name  ] } { return $mom_tool_name     }
unset mom_tool_name
return "NULL mom_tool_name"
}
#===================================


#===================================

proc GET_mom_oper_method  { } {
#===================================
global mom_oper_method
if {[info exist mom_oper_method  ] } { return $mom_oper_method     }

unset mom_oper_method
return "NULL mom_oper_method"
}

#===================================
proc GET_mom_next_oper_has_tool_change   { } {
#===================================
global mom_next_oper_has_tool_change
if {[info exist mom_next_oper_has_tool_change    ] } { return $mom_next_oper_has_tool_change       }
unset mom_next_oper_has_tool_change
return ""
}

#===================================
# X:\trofimov\detali\TEST_POSTING\MILL_3_AXIS.h
proc GET_mom_output_file_full_name  { } {
#===================================
global mom_output_file_full_name
if {[info exist mom_output_file_full_name ] } { return $mom_output_file_full_name    }
return "NULL mom_output_file_full_name"
}
#===================================
#MILL_3_AXIS file NC
proc GET_mom_output_file_basename  { } {
#===================================
global mom_output_file_basename
if {[info exist mom_output_file_basename ] } { return $mom_output_file_basename    }
return "NULL mom_output_file_basename "
}
#===================================
proc GET_mom_operator_message { } {
#===================================
global mom_operator_message
if {[info exist mom_operator_message] } { return $mom_operator_message   }
return "NULL mom_operator_message"
}
#===================================
# получить символ комментария  в начале
proc GET_mom_sys_control_out { } {
#===================================
global mom_sys_control_out
if {[info exist mom_sys_control_out] } { return $mom_sys_control_out   }
return "NULL mom_sys_control_out"
}
#===================================
# получить символ комментария  в конце
proc GET_mom_sys_control_in { } {
#===================================
global mom_sys_control_in
if {[info exist mom_sys_control_in] } { return $mom_sys_control_in   }
return "NULL mom_sys_control_in"
}
#===================================
proc GET_mom_nc_programmer { } {
#===================================
global mom_nc_programmer
if {[info exist mom_nc_programmer] } { return $mom_nc_programmer   }
return "NULL mom_nc_programmer"
}
#===================================
proc GET_mom_sys_commentary_output { } {
#===================================
global mom_sys_commentary_output
if {[info exist mom_sys_commentary_output] } { return $mom_sys_commentary_output   }
return "NULL mom_sys_commentary_output"
}

#===================================
proc GET_mom_cutcom_status { } {
#===================================
global mom_cutcom_status

if {[info exist mom_cutcom_status] } { return $mom_cutcom_status  }
return "NULL mom_cutcom_status"
}

#===================================
proc GET_mom_sys_cutcom_code { } {
#===================================
global mom_sys_cutcom_code

#if {[info exist $mom_sys_cutcom_code([GET_mom_cutcom_status])] } { return $mom_sys_cutcom_code([GET_mom_cutcom_status])  }
#return "NULL mom_sys_cutcom_code"
return "$mom_sys_cutcom_code(OFF) "
}
# получить обороты
proc GET_mom_spindle_rpm { } {
#===================================
global mom_spindle_rpm
if {[info exist mom_spindle_rpm] } { return $mom_spindle_rpm   }
return "0"
}












#==============PROVERKI START=====================
proc CHECK_correction_rapid    { } {
global mom_cutcom_status
global mom_current_motion
global mom_logname

  if {[info exists mom_cutcom_status] && \
          ($mom_cutcom_status == "RIGHT" || \
              $mom_cutcom_status == "LEFT" ) && \
           [string match "*rapid*" $mom_current_motion]} {
      PAUSE "!! МИНУС KPI  программисту $mom_logname !! \n Врезание с коррекцией на ускоренном ходу \n в операции $mom_operation_name."
       MOM_abort "USER EXIT"
    }
}
#---------------------------
proc CHECK_from_pos    { } {
global mom_from_pos
if [info exist mom_from_pos(0)] {
  PAUSE "!! В операции [GET_mom_operation_name] используется движение FROM. Данный постпроцессор не поддерживает данный вид движений. Следует переделать операцию"
   MOM_abort "USER EXIT"

    }
}

proc CHECK_SPEED_SPINDLE  {min_sp max_sp} {

  if {[GET_mom_spindle_rpm] > $max_sp }
              {
      PAUSE "!! Проверь обороты \n  в операции [GET_mom_operation_name]"
       MOM_abort "USER EXIT"
    }

}
#---------------------------


proc CHECK_ZERO_SPEED_AND_TOOL {} {

global mom_path_name
global mom_spindle_speed
global mom_tool_number
global mom_next_tool_status
global mom_next_tool_number

 if { $mom_spindle_speed == 0 } {
     MOM_output_to_listing_device " "
     MOM_output_to_listing_device "   ======================================="
     MOM_output_to_listing_device "    ВНИМАНИЕ !!! ОПЕРАЦИЯ: $mom_path_name"
     MOM_output_to_listing_device "    ОШИБКА: НУЛЕВОЕ ВРАЩЕНИЕ !!!!!!!!"
     MOM_output_to_listing_device "   ======================================="
     PAUSE "ВНИМАНИЕ !!! ОПЕРАЦИЯ: $mom_path_name \n  ОШИБКА: НУЛЕВОЕ ВРАЩЕНИЕ "
    #  MOM_abort " ОШИБКА: НУЛЕВОЕ ВРАЩЕНИЕ НЕ ДОПУСКАЕТСЯ! "
 }
 if { $mom_tool_number == 0 } {
     MOM_output_to_listing_device " "
     MOM_output_to_listing_device "   ======================================="
     MOM_output_to_listing_device "    ВНИМАНИЕ !!! ОПЕРАЦИЯ: $mom_path_name"
     MOM_output_to_listing_device "    ОШИБКА: ИНСТРУМЕНТ T0  !!!!!!!!"
     MOM_output_to_listing_device "   ======================================="
    PAUSE "ВНИМАНИЕ !!! ОПЕРАЦИЯ: $mom_path_name \n  ОШИБКА: ИНСТРУМЕНТ T0 "
 }


if { $mom_next_tool_status == "FIRST" } { return }

if { $mom_next_tool_number == 0 } {
      MOM_output_to_listing_device "not specify the next tool"
  #    MOM_abort
  MOM_output_to_listing_device " "
     MOM_output_to_listing_device "   ======================================="
     MOM_output_to_listing_device "    ВНИМАНИЕ !!! "
     MOM_output_to_listing_device "    ОШИБКА: СЛЕДУЮЩИЙ ИНСТРУМЕНТ T0  !!!!!!!!"
     MOM_output_to_listing_device "   ======================================="
      return
   }
}

#==============PROVERKI END=====================






#==============SORT===================================================

proc STRING_GET_USER_SELECTED_AND_VIEW_MESSAGE {arg_array_type } {

set type ""
    foreach type_detail $arg_array_type {
  # MOM_output_literal $type_detail
   append type " $type_detail "
    }
if {[string length $type] >1 } {

set i 0
set size "[llength $arg_array_type]"

     while { $i < $size } {

    set a  "[lindex $arg_array_type $i]"
    set return_value  [MOM_display_message "Исполнения обозначаются в начале названий обработки и разделяются знаком \".\"\nВыберите нужное: $type" "Найдено несколько исполнений в названий обработки" "Q" "Отмена" "$a" "Следующее"]
    if {$return_value == "1" } {

    MOM_abort "USER EXIT"

    }
    if {$return_value == "2" } {
    return $a
    }
    if {$return_value == "3" } {
                if { $i == [expr "$size - 1"]} {
                                                set i -1 }
                                                        }
                set i [expr $i + 1]
}

}
return " нет исполнения"
#return "$a"


}


proc SKIP_TO_END_OF_PATCH {user_type_isp from_name all_type_isp} {
global CONSTANT_ARRAY

set c [DIVIDER__STRING_SYMBOL_NUMBER "$from_name" "$CONSTANT_ARRAY(separator_for_skip_isp)" "$CONSTANT_ARRAY(position_for_skip_isp)"]

# esli sootvetstvie s vy`branny`m ispolneniem pol`zovatelem
if {[COMPARE__TEXT_TEXT "$c" "$user_type_isp"]} {
return 1
} else {
            for {set i 0} {$i < [llength $all_type_isp]} {incr i} {
            set a "[lindex $all_type_isp $i]"
            if {[COMPARE__TEXT_TEXT "$c" "$a"]} {
             #   MOM_output_text "[VIEW_TEXT "SKIP ISPOLNENIE_$a" 5]"
                MOM_skip_handler_to_event MOM_end_of_patch
                return 0
        }
}
}

return 1
}


proc ARRAY_GET_ALL_TYPE_DETAIL {} {
global CONSTANT_ARRAY
set a "$CONSTANT_ARRAY(separator_for_skip_isp)"
set b "$CONSTANT_ARRAY(position_for_skip_isp)"

set out_file "${::mom_output_file_directory}temp.txt"

MOM_run_postprocess "[file dirname $::mom_event_handler_file_name]/sub_post/sub_post.tcl" \
"[file dirname $::mom_event_handler_file_name]/sub_post/sub_post.def" "$out_file"
 set name [list]
   set src [open "$out_file" RDONLY]
   while { [eof $src] == 0 } {
        set local_line [gets $src]
        if {[COMPARE__ALL_SYMBOL_FROM_TEXT_WITH_SYMBOL "$local_line" "$a"]} {
        set s [DIVIDER__STRING_SYMBOL_NUMBER $local_line "$a" "$b"]
# ishchem odinakovy`e , esli da to sleduiushchaia iteratciia


       if {[lsearch $name $s] >= 0} {
     continue
    } else {

     if {[string length $s] >= 3} {
     continue
    }

        lappend name [DIVIDER__STRING_SYMBOL_NUMBER $local_line "$a" "$b"]
                }
                                                                                                                                    }
                                            }



   close $src
  file delete "$out_file"

  lsort -dictionary  $name


return $name
}




proc ARRAY_GET_ALL_FROM_SUB_POST_TEXT {} {

set out_file "${::mom_output_file_directory}temp.txt"

MOM_run_postprocess "[file dirname $::mom_event_handler_file_name]/sub_post/sub_post.tcl" \
"[file dirname $::mom_event_handler_file_name]/sub_post/sub_post.def" "$out_file"
 set name [list]
   set src [open "$out_file" RDONLY]
   while { [eof $src] == 0 } {
        lappend name [gets $src]

                  }

   close $src

 file delete "$out_file"


return $name
}

}





