`timescale 1ns / 1ps

`define S0 3'b000
`define S1 3'b001
`define S2 3'b010
`define S3 3'b011
`define S4 3'b100
`define S5 3'b101

module fsm(
		input clk,rst,
		input start,stop,count,
		output [2:0]current_state,
		output reg [3:0]out
);
	reg [2:0] state_next,state_reg;
	always @( posedge clk or posedge rst)
		begin
			if(rst)
				state_reg<=0;
			else
				state_reg<=state_next;
		end
	always @(state_reg, start, count, stop)
		begin
			state_next=state_reg;
			case(state_reg)
				`S0:begin
							state_next=`S0;
							out=4'b0110;
							if(start) state_next=`S1;
						end
				`S1:begin
							state_next=`S1;
							out=4'b1111;
							if(count) state_next=`S2;
						end
				`S2:begin
							state_next=`S2;
							out=4'b0101;
							if(count) state_next=`S3;
						end
				`S3:begin
							state_next=`S3;
							out=4'b0111;
							if(count) state_next=`S4;
						end
				`S4:begin
							state_next=`S4;
							out=4'b0000;
							if(stop) state_next=`S4;
						end
				`S5:begin
							out=4'b1010;
							state_next=`S0;
						end
				default: state_next=`S0;
			endcase
				
		end
		assign current_state=state_reg;
endmodule


