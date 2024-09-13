`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:03:31 03/26/2019 
// Design Name: 
// Module Name:    mux2_1 
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
module mux2_1(
		input a,b,
		input sel,
		output reg o
		);
// var 2: assign o = (~sel&a)|(sel&b); (sterge reg de la o)
always @(a,b,sel)
	begin
		case(sel)
			0: begin
				o = a;
			end
			1: begin
				o = b;
			end 
 		endcase 
end
endmodule

