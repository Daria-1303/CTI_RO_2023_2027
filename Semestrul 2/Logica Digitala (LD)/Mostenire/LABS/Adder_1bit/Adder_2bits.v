module adder_2bits_tb;
// Inputs
reg [1:0] a; //operand 1
reg [1:0] b; //operand 2
//Outputs
wire [1:0]sum;
wire cout;
// Instantiate the Unit Under Test (UUT)
Adder_2Bits uut (
.a(a),
.b(b),
.c_in(1'b0),
.s(sum),
.c_out(cout)
);
initial begin
// Initialize Inputs
a = 0;
b = 0;
// Wait 100 ns for global reset to finish
#100;
end
always //toggle inputs for two bit adder
begin
#25 a = a+1'b1;
#50 b = b+1'b1;
end
endmodule