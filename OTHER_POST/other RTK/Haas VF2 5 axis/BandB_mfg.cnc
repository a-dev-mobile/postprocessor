%
ONONAME  ( BANDB_MFG )
( -1  ISSUE: NO DESCRIPTION  )
( NX4 Operation  WRONG_IN_OLD_POST )
( TUE FEB 20 17:00:24 2007 )
( HAAS VF2_SS_Trunion_table 5AXIS POSTPROCESSOR VERSION 1.1 )
G00 G40 G17 G80 G90 G21 G94
G187
  
G91 G28 Z0.0 M09
G91 G28 Y0.0
G90
G0 A0.0 B0.0
   
N1200 T12 M06  ( MILL12 )
M31
T8
( TOP )
G54
G91 G28 Z0.0 M09
G91 G28 Y0.0
G90
 
( TABLE INDEX )
G0 A0.0 B0.0
  
S5000 M03
G0 X0.0 Y5. M08
G43 Z146.763 H12
Z124.763
G94 G1 Z121.763 F250.
X-37.5
Y-5.
X37.5
Y5.
X0.0
G0 Z146.763
(APLUS10)
G54
G91 G28 Z0.0 M09
G91 G28 Y0.0
G90
 
( TABLE INDEX )
G0 A10. B0.0
  
S5000 M03
G0 X-37.5 Y-6.066 M08
G43 Z149.016 H12
Z123.782
G94 G1 Z120.782 F250.
X37.5
Y-16.22
G0 Z147.225
(APLUS45)
G54
G91 G28 Z0.0 M09
G91 G28 Y0.0
G90
 
( TABLE INDEX )
G0 A45. B0.0
  
S5000 M03
G0 X-37.5 Y-60.104 M08
G43 Z120.459 H12
Z98.459
G94 G1 Z95.459 F250.
X37.5
Y-74.246
G0 Z120.459
(A-10)
G54
G91 G28 Z0.0 M09
G91 G28 Y0.0
G90
 
( TABLE INDEX )
G0 A10. B-180.
  
S5000 M03
G0 X37.5 Y-16.22 M08
G43 Z147.225 H12
Z123.782
G94 G1 Z120.782 F250.
X-37.5
Y-6.066
G0 Z149.016
(A-45)
G54
G91 G28 Z0.0 M09
G91 G28 Y0.0
G90
 
( TABLE INDEX )
G0 A45. B-180.
  
S5000 M03
G0 X37.5 Y-74.246 M08
G43 Z120.459 H12
Z98.459
G94 G1 Z95.459 F250.
Y-60.104
X-27.5
G0 Z120.459
G91 G28 Z0.
G28 Y0.
G28 X0.
G90 G0 A0.
M09
M05
M1
  
N800 T8 M06  ( D8 )
T12
( DRILL-45 )
G90
G54
G91 G28 Z0.0 M09
G91 G28 Y0.0
G90
 
( TABLE INDEX )
G0 A45. B-180.
  
S2000 M03
G0 X-18.75 Y-67.401 M08
G43 Z120.459 H08
G94 G98 G81 X-18.75 Y-67.401 R92.459 Z95.459 F250.
X18.75 Y-67.104
G80
G0 Z120.459
(DRILL_PLUS45)
G54
G91 G28 Z0.0 M09
G91 G28 Y0.0
G90
 
( TABLE INDEX )
G0 A45. B0.0
  
S2000 M03
G0 X18.75 Y-67.104 M08
G94 G98 G81 X18.75 Y-67.104 R98.459 Z77.056 F250.
X-18.75
G80
G43 G0 Z120.459 H08
M09
M05
G28 G91 Z0.
G28 G91 Y0.
G28 G91 X0.
G90 G0 A0. B0.
M33
M30
%