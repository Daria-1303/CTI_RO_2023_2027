module sigma1(
	input [31 : 0] in,
	output [31 : 0] out
);

// rotireDR(in, 17) ^ rotireDR(in, 19) ^ deplasareDR(in, 10)

function [31:0] RotireDr (input [31:0] x, input [4:0] p);
  reg [63:0] tmp;
  begin
    tmp = {x, x} >> p;
    RotireDr = tmp[31:0];
  end
endfunction

function [31:0] DeplasareDr (input [31:0] x, input [4:0] p);
  reg [63:0] tmp;
  begin
    tmp = {32'b0, x} >> p;
    DeplasareDr = tmp[31:0];
  end
endfunction

assign out = RotireDr(in, 17) ^ RotireDr(in, 19) ^ DeplasareDr(in, 10);

endmodule
