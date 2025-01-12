module cons(
  input clk,rst_b,val,
  input [7:0] data,
  output reg [7:0] sum
);
  always @ (posedge clk, negedge rst_b)
    if (rst_b == 0)
      sum<=0;
    else if (val == 1)
      sum<=sum + data;
endmodule

module cons_tb;
  reg clk,rst_b;
  wire val;
  wire [7:0] data,sum;
  
  prod inst1(.clk(clk),.rst_b(rst_b),.val(val),.data(data));
  cons inst2(.clk(clk),.rst_b(rst_b),.val(val),.data(data),.sum(sum));
  localparam CLK_PERIOD=100,RUNNING_CYCLES=100,RST_DURATION=25;
  initial begin
    $display("time\tclk\trst_b\tval\tdata\tsum");
    $monitor("%4t\t%b\t%b\t%b\t%1d\t%3d",$time,clk,rst_b,val,data,sum);
    clk=0;
    repeat (2*RUNNING_CYCLES) #(CLK_PERIOD/2) clk=~clk;
  end
  initial begin
    rst_b=0;
    #RST_DURATION rst_b=~rst_b;
  end
endmodule