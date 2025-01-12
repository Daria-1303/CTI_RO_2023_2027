module sigma0 (
	input [31 : 0] in,
	output [31 : 0] out
);

// rotireDR(in, 7) ^ rotireDR(in, 18) ^ deplasareDR(in, 3)

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

assign out = RotireDr(in, 7) ^ RotireDr(in, 18) ^ DeplasareDr(in, 3);
endmodule
