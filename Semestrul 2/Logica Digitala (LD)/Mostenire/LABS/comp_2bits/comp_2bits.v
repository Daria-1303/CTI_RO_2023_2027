`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:50:30 03/12/2019 
// Design Name: 
// Module Name:    comp_2bits 
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
module comp_2bits(
    input [1:0] a,
    input [1:0] b,
    output sm_eq,
    output gr_eg
    );

assign sm_eq = (~a[0]&~a[1])|(~a[0]&b[1])|(b[1]&b[0])|(b[1]&~a[1])|(~a[1]&b[0]);
assign gr_eg = (a[1]&a[0])|(a[1]&~b[1])|(a[1]&~b[0])|(a[0]&~b[1])|(~b[1]&~b[0]);


endmodule
