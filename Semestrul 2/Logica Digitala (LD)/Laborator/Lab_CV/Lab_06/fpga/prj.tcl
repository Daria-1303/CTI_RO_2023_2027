project_new example1 -overwrite

set_global_assignment -name FAMILY MAX10
set_global_assignment -name DEVICE 10M50DAF484C7G 

set_global_assignment -name BDF_FILE example1.bdf
set_global_assignment -name VERILOG_FILE design_sevseg_display.v
set_global_assignment -name SDC_FILE example1.sdc

set_global_assignment -name TOP_LEVEL_ENTITY seven_segment_display
set_location_assignment -to clk PIN_AH10

set_location_assignment PIN_C10 -to num_in[0]   ;# SW[0]
set_location_assignment PIN_C11 -to num_in[1]   ;# SW[1]
set_location_assignment PIN_D12 -to num_in[2]   ;# SW[2]
set_location_assignment PIN_C12 -to num_in[3]   ;# SW[3]

set_location_assignment PIN_C14 -to leds_out[0]   ;# a - 0
set_location_assignment PIN_E15 -to leds_out[1]   ;# b - 1
set_location_assignment PIN_C15 -to leds_out[2]   ;# c - 2
set_location_assignment PIN_C16 -to leds_out[3]   ;# d - 3
set_location_assignment PIN_E16 -to leds_out[4]   ;# e - 4
set_location_assignment PIN_D17 -to leds_out[5]   ;# f - 5
set_location_assignment PIN_C17 -to leds_out[6]   ;# g - 6
set_location_assignment PIN_D15 -to leds_out[7]   ;# h - 7

load_package flow
execute_flow -compile

project_close
