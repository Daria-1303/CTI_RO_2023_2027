/*
module add4b (
    input [3:0] x, y, input ci,
    output [3:0] z, output co
);
    wire c2;
    add2b inst1 (.x(x[1:0]), .y(y[1:0]), .ci(ci), .co(c2), .z(z[1:0]));
    add2b inst2 (.x(x[3:2]), .y(y[3:2]), .ci(c2), .co(co), .z(z[3:2]));
endmodule

module c1_add4b (
    input [3:0] x, y, input ci,
    output [3:0] z
);
    // Semnal pentru rezultatul intermediar al adunarii intre x si y
    wire [3:0] temp; 
    // Semnal pentru end around carry, de adunat rezultatului intermediar
    wire co;
    add4b inst1 (.x(x), .y(y), .ci(ci), .co(co), .z(temp));
    add4b inst2 (.x(temp), .y(4'd0), .ci(co), .co(), .z(z));
endmodule

*/

module c1_add4b(
    input [3:0] x,
    input [3:0] y,
    input ci,
    output [3:0] z
);

wire [4 : 0] suma;

assign suma = x + y + ci;

assign z = suma[3:0] + suma[4];

/*
//sau mai putem face cu add2b

wire [3:0] temp;
wire carry_out;
wire eac;

add2b inst1(
    .x(x[1:0]),
    .y(y[1:0]),
    .ci(ci),
    .z(temp[1:0]),
    .co(carry_out)
)

add2b inst2(
    .x(x[3:2]),
    .y(y[3:2]),
    .ci(carry_out),
    .z(temp[3:2]),
    .co(eac)
)

assign z = temp + eac;

*/
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