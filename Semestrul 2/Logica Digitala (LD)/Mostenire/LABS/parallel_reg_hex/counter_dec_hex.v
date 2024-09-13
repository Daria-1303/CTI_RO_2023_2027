`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:42:12 04/17/2019 
// Design Name: 
// Module Name:    counter_dec_hex 
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
module counter_dec_hex(
    input clk, rst,l,
	 output  [6:0] out 
	 );
	 wire  [3:0] aux;
    counter_dec i1(
	 .load(l),
	 .clk(clk),
	 .rst(rst),
	 .q(aux));
	 hex_display i2(.c(aux),.hex(out));

endmodule
