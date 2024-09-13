`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:12:21 04/17/2019
// Design Name:   ff
// Module Name:   /home/student/reg_paralel/ff_tb.v
// Project Name:  reg_paralel
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ff
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ff_tb;

	// Inputs
	reg clk;
	reg rst;
	reg d;
	reg en;

	// Outputs
	wire q;

	// Instantiate the Unit Under Test (UUT)
	ff uut (
		.clk(clk), 
		.rst(rst), 
		.d(d), 
		.en(en), 
		.q(q)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		d = 1;
		en = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
   always
	begin
	  #100 clk=!clk;
	end 
endmodule

