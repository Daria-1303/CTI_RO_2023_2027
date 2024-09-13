`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:03:05 04/17/2019 
// Design Name: 
// Module Name:    counter_dec 
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
module counter_dec
    (input clk, rst,load,
	output  [3:0] q
	);
	
   reg  [3:0] q_nxt, q_reg;
	
//always block for sequential part
	always @( posedge clk or posedge rst)
	begin
		if (rst)
			q_reg <= 0;
		else
			q_reg<= q_nxt;
	end
	
//always block for combinational part
	always @(*)
	begin
	if(load)
		q_nxt = q_reg + 1'b1;
	end
	
	assign q=q_reg;

endmodule