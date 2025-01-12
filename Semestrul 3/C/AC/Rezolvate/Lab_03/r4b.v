module r4b (
  input clk, rst_b, ld, sh, sh_in,
  input [3:0] d,
  output reg [3:0] q
);
  always @ (posedge clk, negedge rst_b)
    if (! rst_b)          q <= 0;
    else if (ld)          q <= d;
    else if (sh)          q <= {sh_in, q[3:1]};
endmodule
