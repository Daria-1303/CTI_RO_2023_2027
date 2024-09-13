`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:59:15 04/17/2019 
// Design Name: 
// Module Name:    ff 
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
module ff(
    input clk,
    input rst,
    input d,
    input en,
    output reg q
    );
	always @(posedge clk or posedge rst)
      if (rst) begin
         q <= 1'b0;
      end else if (en) begin
         q <= d;
      end
endmodule
