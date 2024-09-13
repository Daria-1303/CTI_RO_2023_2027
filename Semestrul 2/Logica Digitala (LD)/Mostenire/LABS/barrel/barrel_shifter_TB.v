`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:33:55 03/26/2019
// Design Name:   barrel_shifter
// Module Name:   /home/ise/XilinxShared/mux2_1/barrel_shifter_TB.v
// Project Name:  mux2_1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: barrel_shifter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module barrel_shifter_TB;

// Inputs
	reg [3:0] data; //intrari date
	reg [1:0] sel; //intrari de selecie
//Outputs
	wire [3:0] data_out;
// Instantiate the Unit Under Test (UUT)
// realizati instanta pentru circuitul testat
	barrel_shifter uut (.a(data), .sel(sel), .shift_out(data_out));
	initial begin
// Initialize Inputs
	data = 0;
	sel = 0;
	end
	
always #20 begin
	data=data+1;
end

always #5 begin
	sel=sel+1;
end
	
endmodule

