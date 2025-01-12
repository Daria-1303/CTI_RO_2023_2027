module lfsr5b(
  input clk,rst_b,
  output [4:0] q
);
  generate
    genvar k;
    for (k=0; k<5; k=k+1) begin:v
      if (k == 0)
        d_ff gu(.clk(clk),.rst_b(1'd1),.set_b(rst_b),.d(q[4]),.q(q[k]));
      else if (k == 2)
        d_ff gu(.clk(clk),.rst_b(1'd1),.set_b(rst_b),.d(q[4]^q[1]),.q(q[k]));
      else
        d_ff gu(.clk(clk),.rst_b(1'd1),.set_b(rst_b),.d(q[k-1]),.q(q[k]));
    end
  endgenerate
endmodule

module lfsr5b_tb;
  reg clk,rst_b;
  wire [4:0] q;
  lfsr5b inst(.clk(clk),.rst_b(rst_b),.q(q));
  localparam CLK_PERIOD=100, RUNNING_CYCLES=35, RST_DURATION=25;
  initial begin
    clk=0;
    repeat (2*RUNNING_CYCLES) #(CLK_PERIOD/2) clk=~clk;
  end
  initial begin
    rst_b=0;
    #RST_DURATION rst_b=1;
  end
endmodule


###2