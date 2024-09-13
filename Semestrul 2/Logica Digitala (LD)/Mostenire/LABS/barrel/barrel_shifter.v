`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:08:41 03/26/2019 
// Design Name: 
// Module Name:    barrel_shifter 
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
module barrel_shifter(
		input [3:0] a,
		input [1:0] sel,
		output [3:0] shift_out
    );

//declararea de semnale care sa capteze valorile de la fiecare nivel de mux-uri
wire [3:0] mux_li, mux_l0_1, mux_l1_1; //2 niveluri de semnale de 4 bii fiecare
assign mux_l0_1 = {1'b0, a[3], a[2], a[1]};
assign mux_l1_1 = {1'b0, 1'b0, mux_li[3], mux_li[2]};
genvar i;
	generate
		for (i=0; i<4; i=i+1)
		begin: mux_level_i
		//primul nivel de mux-uri
		mux2_1 mux_instance0 (.a(a[i]), .b(mux_l0_1[i]), .sel(sel[0]), .o(mux_li[i]));
		//al doilea nivel de mux-uri
		mux2_1 mux_instance1 (.a(mux_li[i]), .b(mux_l1_1[i]), .sel(sel[1]), .o(shift_out[i]));
		end
	endgenerate
endmodule
