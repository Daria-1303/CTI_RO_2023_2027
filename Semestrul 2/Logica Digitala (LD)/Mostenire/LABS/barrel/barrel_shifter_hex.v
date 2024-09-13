`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:37:59 04/16/2019 
// Design Name: 
// Module Name:    barrel_shifter_hex 
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
module barrel_shifter_hex(
		input [3:0] a,
		input [1:0] sel,
		output [6:0] hex
    );
	 
wire [3:0] x;

barrel_shifter b1(.a(a),.sel(sel),.shift_out(x));
hex_7display h1(.c(x),.hex(hex));



endmodule
