`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:35:31 04/17/2019
// Design Name:   paralel_reg_hex
// Module Name:   /home/student/reg_paralel/paralel_reg_hex_tb.v
// Project Name:  reg_paralel
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: paralel_reg_hex
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module paralel_reg_hex_tb;

	// Inputs
	reg clk;
	reg rst;
	reg load;
	reg [3:0] d;

	// Outputs
	wire [6:0] hex;

	// Instantiate the Unit Under Test (UUT)
	paralel_reg_hex uut (
		.clk(clk), 
		.rst(rst), 
		.load(load), 
		.d(d), 
		.hex(hex)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		load = 1;
		d = 0;

		// Wait 100 ns for global reset to finish
		#100
        
		  rst = 1;
		  #20;
		  rst =0;
		// Add stimulus here

	end
	always
	begin
	#100 clk=~clk;
	if(clk==1)
	d=d+1'b1;
	end
      
endmodule

