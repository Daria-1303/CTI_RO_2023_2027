`timescale 1 ns/1 ps
module adder_1bits
(input c_in,
input  a, b,
output s,
output c_out);


assign  c_out = (a & b) | (a & c_in) | (b & c_in);
assign  s = a^b^c_in;
endmodule