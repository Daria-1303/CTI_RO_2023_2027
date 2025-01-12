module sisr4b(
	input i,
 	input clk,
	input rst_b,
	output [3:0] q
);

d_ff d0(.clk(clk), .rst_b(rst_b), .set_b(1'b1), .d(i ^ q[3]), .q(q[0]));
d_ff d1(.clk(clk), .rst_b(rst_b), .set_b(1'b1), .d(q[0] ^ q[3]), .q(q[1]));
d_ff d2(.clk(clk), .rst_b(rst_b), .set_b(1'b1), .d(q[1]), .q(q[2]));
d_ff d3(.clk(clk), .rst_b(rst_b), .set_b(1'b1), .d(q[2]), .q(q[3]));

endmodule
