`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:15:57 03/05/2019
// Design Name:   majority_voting
// Module Name:   /home/stan/Desktop/Xilinx/MajVoter/majority_voting_tb.v
// Project Name:  MajVoter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: majority_voting
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module majority_voting_tb;

	// Inputs
	reg in1;
	reg in2;
	reg in3;

	// Outputs
	wire maj;

	// Instantiate the Unit Under Test (UUT)
	majority_voting uut (
		.in1(in1), 
		.in2(in2), 
		.in3(in3), 
		.maj(maj)
	);

	initial begin
		// Initialize Inputs
		in1 = 0;
		in2 = 0;
		in3 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
		always //toggle inputs
begin
#25 in1 = ~in1;
#50 in2 = ~in2;
#75 in3 = ~in3;
end
		
endmodule

