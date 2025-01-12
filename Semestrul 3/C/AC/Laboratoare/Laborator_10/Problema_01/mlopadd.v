/*module mlopadd(
	input clk,
	input rst_b,
	input [7 : 0] x,	// 2 * 99  + 1 -> 199 < 256 (256 == 2 ^ 8)
	output [13 : 0] a		//suma da 2 * 99 * 50 + 100 = 10 000 (2^14 == 16384)
);

wire [7 : 0] aux;
wire [13 : 0] sum;
// valorile expresiei (2 * i + 1)
rgst #(.width(8)) secventa(
	.clk(clk),
	.rst_b(rst_b),
	.clr(1'b0),
	.ld(1'b1),
	.data(x),
	.q(aux)
);

// calculam suma

rgst #(.width(14)) suma(
	.clk(clk),
	.rst_b(rst_b),
	.clr(1'b0),
	.ld(1'b1),
	.data(aux + sum),
	.q(sum)
);

assign a = sum;

endmodule*/

 //alta varianta
module mlopadd(
	input clk,
	input rst_b,
	input [7 : 0] x,	// 2 * 99  + 1 -> 199 < 256 (256 == 2 ^ 8)
	output [13 : 0] a		//suma da 2 * 99 * 50 + 100 = 10 000 (2^14 == 16384)
);

reg [13 : 0] suma;

always @(posedge clk, negedge rst_b) begin
	if(!rst_b)
		suma <= 0;
	else 
		suma <= suma + x;
end

assign a = suma;

endmodule

module tb_mlopadd;

reg clk;
reg rst_b;
reg [7 : 0] x;
wire [13 : 0] a;

mlopadd instantiere(
	.clk(clk),
	.rst_b(rst_b),
	.x(x),
	.a(a)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Perioad? de 10 ns
end
integer i;
// Reset ?i aplicare valori de intrare
initial begin
    rst_b = 0;           // Aplic? reset
    #15 rst_b = 1;       // Dezactiveaz? resetul dup? 15 ns

    for (i = 0; i < 100; i = i + 1) begin
        x = 2 * i + 1;   // Seteaz? valoarea de intrare
        #10;             // A?teapt? un ciclu de ceas complet
    end
	#5
	rst_b = 0;
	
	$finish;
end

// Monitorizare semnale
initial begin
    $monitor("Timp = %0dns - x = %d, a = %d", $time, x, a);
end

endmodule

/*

module tb_mlopadd;
reg clk, rst_b;
reg [9:0] x;
wire [15:0] a;

mlopadd cut(
  .clk(clk),
  .rst_b(rst_b),
  .x(x),
  .a(a)
);

initial begin
  clk = 0;
  rst_b = 0;
end

integer i;
initial begin
  for(i = 1; i <= 202; i = i + 1) begin
    #50; clk = ~clk;
  end
end

integer j;
initial begin
  for(j = 0; j <= 99; j = j + 1) begin
    x = 2 * j + 1; # 100;
  end
end

initial begin
  #25; rst_b = 1;
end

initial begin
    $monitor("Timp = %0dns - x = %d, a = %d", $time, x, a);
end

endmodule
*/

