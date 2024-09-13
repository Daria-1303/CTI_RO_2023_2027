`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:42:53 05/12/2019 
// Design Name: 
// Module Name:    coffe 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

`define INIT 3'b000
`define S05 3'b001
`define S10 3'b010
`define S15 3'b011
`define S20 3'b100
`define exp_state 3'b101
`define expL_state 3'b110
`define cap_state 3'b111
module coffee(
		input clk,rst,
		input c05,c10,
		input [1:0] coffee,
		output [2:0] current_state,
		output reg expresso,expresso_lung,cappucino
);
	reg [2:0] state_next,state_reg;
	always @( posedge clk or posedge rst)
		begin
			if(rst)
				state_reg<=0;
			else
				state_reg<=state_next;
		end
	always @( state_reg, coffee, c05, c10)
		begin
			state_next=state_reg;
			expresso=0;
			expresso_lung=0;
			cappucino=0;
			case(state_reg)
				`INIT:begin
							state_next=`INIT;
							expresso=0;
							expresso_lung=0;
							cappucino=0;
							if(c05) state_next=`S05;
							if(c10) state_next=`S10;
						end
				`S05:begin
							state_next=`S05;
							expresso=0;
							expresso_lung=0;
							cappucino=0;
							if(c05) state_next=`S10;
							if(c10) state_next=`S15;
						end
				`S10:begin
							state_next=`S10;
							expresso=0;
							expresso_lung=0;
							cappucino=0;
							if(c05) state_next=`S15;
							if(c10) state_next=`S20;
						end
				`S15:begin
							state_next=`S15;
							expresso=0;
							expresso_lung=0;
							cappucino=0;
							if(c05 | c10) state_next=`S20;
						end
				`S20:begin
							state_next=`S20;
							expresso=0;
							expresso_lung=0;
							cappucino=0;
							if(coffee == 2'b00) state_next=`INIT; 
							if(coffee == 2'b01) state_next=`exp_state;
							if(coffee == 2'b10) state_next=`expL_state;
							if(coffee == 2'b11) state_next=`cap_state;
						end
				`exp_state:begin
							state_next=`INIT;
							expresso=1;
							expresso_lung=0;
							cappucino=0;
						end
				`expL_state:begin
							state_next=`INIT;
							expresso=0;
							expresso_lung=1;
							cappucino=0;
						end
				`cap_state:begin
							state_next=`INIT;
							expresso=0;
							expresso_lung=0;
							cappucino=1;
						end
				default: state_next=`INIT;
			endcase
				
		end
		assign current_state=state_reg;
endmodule