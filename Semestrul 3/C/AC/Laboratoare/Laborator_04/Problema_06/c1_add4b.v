module c1_add4b(
	input [3:0] x, y,
	input ci,
	output [3:0] z
);

wire carry, eac;
wire [3:0] tmp_z;

add2b inst0(
	.x(x[1:0]),
	.y(y[1:0]),
	.ci(ci),
	.z(tmp_z[1:0]),
	.co(carry)
);

add2b inst1(
	.x(x[3:2]),
	.y(y[3:2]),
	.ci(carry),
	.z(tmp_z[3:2]),
	.co(eac)
);

assign z = tmp_z + eac;

endmodule


module c1_add4b_tb;

reg [3:0] x, y;
reg ci;
wire [3:0] z;

c1_add4b dut(
	.x(x),
	.y(y),
	.ci(ci),
	.z(z)
);

integer k;
initial begin
	$display("Time\tx\ty\tci\tz");
	$monitor("%0t\t%b\t%b\t%b\t%b", $time, x, y, ci, z);
	{x, y, ci} = 0;
	for (k = 1; k < 512; k = k + 1)
		#10 {x, y, ci} = k;
end

endmodule



/*
module c1_add4b_tb;

reg [3:0] x, y;
reg ci;
wire [3:0] z;

c1_add4b dut(
	.x(x),
	.y(y),
	.ci(ci),
	.z(z)
);

initial begin
	$display("Time\tx\ty\tci\tz");
	$monitor("%0t\t%b\t%b\t%b\t%b", $time, x, y, ci, z);
	
	// Test 5 - 2 = 3
	x = 4'b0101;  // 5
	y = 4'b1101;  // 2
	ci = 0;       
	#10;
end

endmodule
*/
