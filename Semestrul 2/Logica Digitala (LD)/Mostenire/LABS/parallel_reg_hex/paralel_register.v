`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:55:53 04/17/2019 
// Design Name: 
// Module Name:    paralel_register 
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
module paralel_register(
    input clk,
    input rst,
    input load,
    input [3:0] d,
    output reg [3:0] q
    );
	 always@(posedge clk or negedge rst)
	 begin
	   if(!rst)
		  q<=0;
		else
		  if(load== 1'b1)
		    q<=d;
	 end

endmodule
