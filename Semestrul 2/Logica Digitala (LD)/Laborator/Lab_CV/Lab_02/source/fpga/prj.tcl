project_new example1 -overwrite

set_global_assignment -name FAMILY MAX10
set_global_assignment -name DEVICE 10M50DAF484C7G 

set_global_assignment -name BDF_FILE example1.bdf
set_global_assignment -name VERILOG_FILE ../verilog/mj_voter.v
set_global_assignment -name SDC_FILE example1.sdc

set_global_assignment -name TOP_LEVEL_ENTITY mj_voter
set_location_assignment -to clk PIN_AH10

set_location_assignment PIN_C10 -to in1   ;# SW[0]
set_location_assignment PIN_C11 -to in2   ;# SW[0]
set_location_assignment PIN_D12 -to in3   ;# SW[0]
set_location_assignment PIN_A8  -to out  ;# LED[0]

load_package flow
execute_flow -compile

project_close
