module sisr4b(
  input clk,rst_b,i,
  output [3:0] q
);
  generate
    genvar k;
    for (k=0; k<4; k=k+1) begin:v
      if (k == 0)
        d_ff gu(.clk(clk),.rst_b(rst_b),.set_b(1'd1),.d(q[3]^i),.q(q[k]));
      else if (k == 1)
        d_ff gu(.clk(clk),.rst_b(rst_b),.set_b(1'd1),.d(q[3]^q[0]),.q(q[k]));
      else
        d_ff gu(.clk(clk),.rst_b(rst_b),.set_b(1'd1),.d(q[k-1]),.q(q[k]));
    end
  endgenerate
endmodule

###3