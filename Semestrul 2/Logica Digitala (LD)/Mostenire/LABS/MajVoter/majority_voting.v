`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:14:31 03/05/2019 
// Design Name: 
// Module Name:    majority_voting 
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
module majority_voting(
    input in1,
    input in2,
    input in3,
    output maj
    );

wire nand1, nand2, nand3; //internal wires
assign nand1 = ~(in1 & in2);
assign nand2 = ~(in1 & in3);
assign nand3 = ~(in2 & in3);
assign maj = ~(nand1 & nand2 & nand3);

endmodule
