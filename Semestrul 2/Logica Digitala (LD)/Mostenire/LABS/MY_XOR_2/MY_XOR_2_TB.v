// Verilog test fixture created from schematic ...
`timescale 1ns / 1ps
module MY_XOR_2_sch_tb();
// Inputs
reg A;
reg B;
// Output
wire O;
// Instantiate the UUT
MY_XOR_2 UUT (
.O(O),
.A(A),
.B(B)
);
// Initialize Inputs
initial
begin
A = 0;
B = 0;
end
always
begin
#20 A = ~ A;
#20 B = ~ B;
end
endmodule