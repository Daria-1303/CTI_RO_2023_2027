`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:27:36 03/14/2019
// Design Name:   comp_2bits
// Module Name:   /home/stan/Desktop/Xilinx/comp_2bits/comp_2bits_tb.v
// Project Name:  comp_2bits
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: comp_2bits
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module comp_2bits_tb;

	// Inputs
	reg [1:0] a;
	reg [1:0] b;

	// Outputs
	wire sm_eq;
	wire gr_eg;

	// Instantiate the Unit Under Test (UUT)
	comp_2bits uut (
		.a(a), 
		.b(b), 
		.sm_eq(sm_eq), 
		.gr_eg(gr_eg)
	);

	initial begin
		// Initialize Inputs
		a = 1'b0;
		b = 1'b0;
end
		// Wait 100 ns for global reset to finish
		always 
		begin 
		#25 a=a+1'b1;
		#25 b=b+a;
		
        
		// Add stimulus here

	end
      
endmodule

