module c1_add4b(
	input [3:0] x,
	input [3:0] y,
	input ci,
	output [3:0] z
);

wire [4:0] suma;

assign suma = x + y + ci;

assign z = suma[3:0];

endmodule


module c1_add4b_tb;

reg [3:0] x;
reg [3:0] y;
reg ci;

wire [3:0] z;

c1_add4b uut(
	.x(x),
	.y(y),
	.ci(ci),
	.z(z)
);

integer i;

initial begin
	for(i = 0; i < 256; i = i + 1) begin
		x = i[3:0];
		y = i[7:4];
		ci = i[8];
		#20;
		$display("Test %d: x=%b, y=%b, ci=%b -> z=%b", i, x, y, ci, z);
	end

	$finish;
end

endmodule
