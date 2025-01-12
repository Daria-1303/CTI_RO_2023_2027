module fac(
    input x,
    input y,
    input carry_in,
    output z,
    output carry_out
);

assign z = x ^ y ^ carry_in;
assign carry_out = (x & y) | (x & carry_in) | (y & carry_in);

endmodule

module add2b (
    input [1:0] x,
    input [1:0] y,
    input carry_in,
    output [1:0] suma,
    output carry_out
);

// folosim un wire pentru a nu se confunda output ul de la fac1 cu input ul de la fac2
// carry_out ul de la fac1 este conectat la carry_in ul de la fac2
wire carry;

fac fac1(
    .x(x[0]),
    .y(y[0]),
    .carry_in(carry_in),
    .z(suma[0]),
    .carry_out(carry)
);

fac fac2(
    .x(x[1]),
    .y(y[1]),
    .carry_in(carry),
    .z(suma[1]),
    .carry_out(carry_out)
);

endmodule

module add2b_tb;

reg [1:0] x;
reg [1:0] y;
reg carry_in;

wire [1:0] suma;
wire carry_out;

add2b add2b_instantiere(
    .x(x),
    .y(y),
    .carry_in(carry_in),
    .suma(suma),
    .carry_out(carry_out)
);

integer i;

initial begin
  $display("x y carry_in | suma carry_out");
  $monitor("%b %b %b | %b %b", x, y, carry_in, suma, carry_out);

  // avem 2 + 2 + 1 biti -> 2^5 combinatii

  for(i = 0; i < 32; i = i + 1) begin
    {x, y, carry_in} = i;
    #20;
  end

  $finish;
end

endmodule


