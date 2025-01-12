module bist(
  input clk,rst_b,
  output [3:0] sig
);
  wire [4:0] q;
  wire o;
  lfsr5b  inst0(.clk(clk),.rst_b(rst_b),.q(q));
  check   inst1(.i(q),.o(o));
  sisr4b  inst2(.clk(clk),.rst_b(rst_b),.i(o),.q(sig));
endmodule

module bist_tb;
  reg clk,rst_b;
  wire [3:0] sig;
  bist inst(.clk(clk),.rst_b(rst_b),.sig(sig));
  localparam CLK_PERIOD=100, RUNNING_CYCLES=31, RST_DURATION=25;
  initial begin
    clk=0;
    repeat (2*RUNNING_CYCLES) #(CLK_PERIOD/2) clk=~clk;
  end
  initial begin
    rst_b=0;
    #RST_DURATION rst_b=1;
  end
endmodule

###5