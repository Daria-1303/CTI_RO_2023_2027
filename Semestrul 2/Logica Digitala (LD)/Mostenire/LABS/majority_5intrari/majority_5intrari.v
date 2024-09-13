`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:57:10 03/05/2019 
// Design Name: 
// Module Name:    majority_5intrari 
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
module majority_5intrari(
    input in1,
    input in2,
    input in3,
    input in4,
    input in5,
    output maj
    );
wire nand1, nand2, nand3, nand4, nand5, nand6, nand7, nand8, nand9, nand10; //internal wires
assign nand1 = ~(in1 & in2 & in3);
assign nand2 = ~(in1 & in2 & in4);
assign nand3 = ~(in1 & in2 & in5);
assign nand4 = ~(in1 & in3 & in4);
assign nand5 = ~(in1 & in3 & in5);
assign nand6 = ~(in1 & in4 & in5);
assign nand7 = ~(in2 & in3 & in4);
assign nand8 = ~(in2 & in3 & in5);
assign nand9 = ~(in2 & in4 & in5);
assign nand10 = ~(in3 & in4 & in5);

assign maj = ~(nand1 & nand2 & nand3 & nand4 & nand5 & nand6 & nand7 & nand8 & nand9 & nand10);

endmodule
