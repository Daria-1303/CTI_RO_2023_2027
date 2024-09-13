`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:09:31 04/17/2019 
// Design Name: 
// Module Name:    hex_display 
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
module hex_display(
input [3:0] c,
output [6:0] hex
    );

assign hex[0] = ~((~c[2]&~c[0])|(~c[3]&c[1])|(~c[3]&c[2]&c[0])|(c[3]&~c[2]&~c[1])|(c[3]&~c[0])|(c[2]&c[1]));//A
assign hex[1] = ~((~c[2]&~c[0])|(~c[3]&~c[2])|(c[3]&~c[1]&c[0])|(~c[3]&c[1]&c[0])|(~c[3]&~c[1]&~c[0])); //B
assign hex[2] = ~((c[3]&~c[2])|(~c[3]&c[2])|(~c[1]&c[0])|(~c[3]&~c[2]&~c[1])|(~c[3]&~c[2]&c[0])); //C
assign hex[3] = ~((c[3]&~c[1]&~c[0])|(c[2]&~c[1]&c[0])|(~c[2]&c[1]&c[0])|(c[2]&c[1]&~c[0])|(~c[3]&~c[2]&~c[0]));//D
assign hex[4] = ~((~c[2]&~c[0])|(c[3]&c[2])|(c[1]&~c[0])|(c[3]&c[1]));//E
assign hex[5] = ~((~c[1]&~c[0])|(c[3]&~c[2])|(c[3]&c[1])|(~c[3]&c[2]&~c[1])|(~c[3]&c[2]&~c[0])); //F
assign hex[6] = ~((c[1]&~c[0])|(c[3]&~c[2])|(c[3]&c[0])|(~c[3]&c[2]&~c[1])|(~c[3]&~c[2]&c[1]));//G
 endmodule

