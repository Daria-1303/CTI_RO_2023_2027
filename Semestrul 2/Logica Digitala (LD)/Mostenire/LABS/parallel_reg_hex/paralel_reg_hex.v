`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:27:36 04/17/2019 
// Design Name: 
// Module Name:    paralel_reg_hex 
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
module paralel_reg_hex(
    input clk,
    input rst,
    input load,
    input [3:0] d,
	 output [6:0] hex
    );
	 wire [3:0] smth;
	 paralel_register w1(.clk(clk),.rst(rst),.load(load),.d(d),.q(smth));
	 hex_display w2(.c(smth),.hex(hex));
endmodule
