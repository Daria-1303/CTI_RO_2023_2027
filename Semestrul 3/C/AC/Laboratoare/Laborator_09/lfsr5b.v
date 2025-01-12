module lfsr5b(
	input clk, rst_b,
	output[4:0] q
);

/*
 generate 
	genvar i;

	for(i = 0, i < 5; i = i + 1) begin d_ff_inst
		if(i == 2) 
			d_ff d_ff_inst(
				.clk(clk),
				.rst_b(1b'1), 
				.set_b(rst_b),
				.d(q[1]^ q[4]),
				.q(q[2])
				);
		else

			d_ff d_ff_inst(
				.clk(clk),
				.rst_b(1b'1), 
				.set_b(rst_b),
				.d(q[(4 + i) % 5]),
				.q(q[i])
				);

	end

endgenerate


*/

d_ff d0(.clk(clk), .rst_b(1'b1), .set_b(rst_b), .d(q[4]), .q(q[0]));
d_ff d1(.clk(clk), .rst_b(1'b1), .set_b(rst_b), .d(q[0]), .q(q[1]));
d_ff d2(.clk(clk), .rst_b(1'b1), .set_b(rst_b), .d(q[1] ^ q[4]), .q(q[2]));
d_ff d3(.clk(clk), .rst_b(1'b1), .set_b(rst_b), .d(q[2]), .q(q[3]));
d_ff d4(.clk(clk), .rst_b(1'b1), .set_b(rst_b), .d(q[3]), .q(q[4]));


endmodule
	