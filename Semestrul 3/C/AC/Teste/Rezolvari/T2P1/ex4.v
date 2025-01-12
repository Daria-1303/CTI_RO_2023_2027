module rca_4bit(
    input [3 : 0] nr1,
    input [3 : 0] nr2,
    input carry_in,
    output [3 : 0] suma,
    output carry_out
);
wire [2 : 0] carry;

assign {carry[0], suma[0]} = nr1[0] + nr2[0] + carry_in;
assign {carry[1], suma[1]} = nr1[1] + nr2[1] + carry[0];
assign {carry[2], suma[2]} = nr1[2] + nr2[2] + carry[1];
assign {carry_out, suma[3]} = nr1[3] + nr2[3] + carry[2];

endmodule

module ex4(
    input [3 : 0] X,
    input [3 : 0] Y,
    output [7 : 0] P
);

wire [3 : 0] suma [0 : 2];
wire [3 : 0] carry_out;

assign P[0] = X[0] & Y[0];

rca_4bit rca_4bit_instanta1(
    .nr1({Y[1] & X[3], Y[1] & X[2], Y[1] & X[1], Y[1] & X[0]}),
    .nr2({1'b0, Y[0] & X[3], Y[0] & X[2], Y[0] & X[1]}),
    .carry_in(1'b0),
    .suma(suma[0]),
    .carry_out(carry_out[0])
);

assign P[1] = suma[0][0];

rca_4bit rca_4bit_instanta2(
    .nr1({Y[2] & X[3], Y[2] & X[2], Y[2] & X[1], Y[2] & X[0]}),
    .nr2({carry_out[0], suma[0][3], suma[0][2], suma[0][1]}),
    .carry_in(1'b0),
    .suma(suma[1]),
    .carry_out(carry_out[1])
);

assign P[2] = suma[1][0];

rca_4bit rca_4bit_instanta3(
    .nr1({Y[3] & X[3], Y[3] & X[2], Y[3] & X[1], Y[3] & X[0]}),
    .nr2({carry_out[1], suma[1][3], suma[1][2], suma[1][1]}),
    .carry_in(1'b0),
    .suma(suma[2]),
    .carry_out(carry_out[2])
);

assign P[6 : 3] = suma[2][3 : 0];
assign P[7] = carry_out[2];

endmodule

module ex4_tb();

reg [3 : 0] X;
reg [3 : 0] Y;

wire [7 : 0] P;

ex4 ex4_instanta(
    .X(X),
    .Y(Y),
    .P(P)
);


initial begin
    $display("X Y P");
    $monitor("%d %d %d", X, Y, P);

    repeat(16) begin
        X = $urandom;
        Y = $urandom;

        #10;
    end
end

endmodule