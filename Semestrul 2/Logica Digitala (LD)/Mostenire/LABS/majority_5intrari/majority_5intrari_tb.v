`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:06:03 03/05/2019
// Design Name:   majority_5intrari
// Module Name:   /home/stan/Desktop/Xilinx/majority_5intrari/majority_5intrari_tb.v
// Project Name:  majority_5intrari
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: majority_5intrari
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module majority_5intrari_tb;

	// Inputs
	reg in1;
	reg in2;
	reg in3;
	reg in4;
	reg in5;

	// Outputs
	wire maj;

	// Instantiate the Unit Under Test (UUT)
	majority_5intrari uut (
		.in1(in1), 
		.in2(in2), 
		.in3(in3), 
		.in4(in4), 
		.in5(in5), 
		.maj(maj)
	);

	initial begin
		// Initialize Inputs
		in1 = 0;
		in2 = 0;
		in3 = 0;
		in4 = 0;
		in5 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      always //toggle inputs
begin
#25 in1 = ~in1;
#50 in2 = ~in2;
#75 in3 = ~in3;
#100 in4 = ~in4;
#125 in5 = ~in5;
end
endmodule

