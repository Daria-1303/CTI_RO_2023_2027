`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:11:11 04/17/2019
// Design Name:   paralel_register
// Module Name:   /home/student/reg_paralel/paralel_register_tb.v
// Project Name:  reg_paralel
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: paralel_register
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module paralel_register_tb;

	// Inputs
	reg clk;
	reg rst;
	reg load;
	reg [3:0] d;

	// Outputs
	wire [3:0] q;

	// Instantiate the Unit Under Test (UUT)
	paralel_register uut (
		.clk(clk), 
		.rst(rst), 
		.load(load), 
		.d(d), 
		.q(q)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		load = 1;
		d = 0;

		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here

	end
      always
begin
#100clk=!clk;
d=d+1;
end
endmodule

