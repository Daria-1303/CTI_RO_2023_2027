`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:24:22 05/14/2019
// Design Name:   coffee
// Module Name:   /home/arosu/Documents/Facultate/LD/LABS/coffe_fsm/coffee_tb.v
// Project Name:  coffe_fsm
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: coffee
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module coffee_tb;

// Inputs
	reg clk;
	reg rst;
	reg credit05;
	reg credit10;
	reg [1:0] coffee;

	// Outputs
	wire [2:0] current_state;
	wire exprr;
	wire expr_l;
	wire capp;

	// Instantiate the Unit Under Test (UUT)
	coffee uut (
		.clk(clk), 
		.rst(rst), 
		.c05(credit05), 
		.c10(credit10), 
		.coffee(coffee), 
		.current_state(current_state), 
		.expresso(exprr), 
		.expresso_lung(expr_l), 
		.cappucino(capp)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		credit05 = 0;
		credit10 = 0;
		coffee = 0;

		// Wait 100 ns for global reset to finish
		#100;
      rst = 1;
		#10;
		rst = 0;
		// Add stimulus here

	end
	always
	begin
	#20 clk = ~clk;
	end
	
	always
	begin
	
	#5 credit05 = $random%2;
	#5 credit10 = $random%2;
	#5 coffee[0] = $random%2;
	#5 coffee[1] = $random%2;
	end
	
	initial begin
		#120;
		@ (posedge clk) credit05  = 1'b1;
		repeat(1) @ (posedge clk) ;
		credit05 = 1'b0;
	end
      
endmodule
