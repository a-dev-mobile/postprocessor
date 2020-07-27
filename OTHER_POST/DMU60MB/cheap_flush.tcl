#===============================================================================
# Exported Custom Commands created by danilov
# on 28 ���� 2011 �. 14:24:04 Московское время (лето)
#===============================================================================



#=============================================================
proc PB_CMD_cheap_flush { } {
#=============================================================
global mom_flush_cheap_mode
global mom_flush_on_time
global mom_flush_off_delay
global mom_flush_on_time_defined
global mom_flush_off_delay_defined

if { $mom_flush_cheap_mode == "ON" } {
	MOM_output_literal "M17"
} elseif { $mom_flush_cheap_mode == "OFF" } {
	MOM_output_literal "M16"
    if { $mom_flush_off_delay_defined != 0 } {
	MOM_output_literal "CYCL DEF 9.0 DWELL TIME"
	MOM_output_literal "CYCL DEF 9.1 DWELL[format "%.1f" $mom_flush_off_delay]"
       }
} elseif { $mom_flush_cheap_mode == "TIME" } {
	MOM_output_literal "M17"
    if { $mom_flush_on_time_defined != 0 } {
	MOM_output_literal "CYCL DEF 9.0 DWELL TIME"
	MOM_output_literal "CYCL DEF 9.1 DWELL[format "%.1f" $mom_flush_on_time]"
       }
	MOM_output_literal "M16"
    if { $mom_flush_off_delay_defined != 0 } {
	MOM_output_literal "CYCL DEF 9.0 DWELL TIME"
	MOM_output_literal "CYCL DEF 9.1 DWELL[format "%.1f" $mom_flush_off_delay]"
       }
}
}



