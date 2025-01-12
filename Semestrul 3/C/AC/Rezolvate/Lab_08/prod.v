module prod(
  input clk,rst_b,
  output reg val,
  output reg [7:0] data
);
  integer cntv, cntiv;
  
  always @ (posedge clk, negedge rst_b)
    if (rst_b == 0) begin
      val<=0;
      cntiv<=1;
    end else if (cntv > 0) begin
        val<=1;
        cntv<=cntv - 1;
        if (cntv == 1) begin
          val<=0;
          cntiv<=$urandom_range(1,4);
        end else
          data<=$urandom_range(0,5);
      end
    else if (cntiv > 0) begin
        val<=0;
        cntiv<=cntiv - 1;
        if (cntiv == 1) begin
          val<=1;
          data<=$urandom_range(0,5);
          cntv<=$urandom_range(3,5);
        end
      end
endmodule

module prod_tb;
  reg clk,rst_b;
  wire val;
  wire [7:0] data;
  
  prod inst1(.clk(clk),.rst_b(rst_b),.val(val),.data(data));
  localparam CLK_PERIOD=100, RUNNING_CYCLES=100, RST_DURATION=25;
  initial begin
    $display("time\tclk\trst_b\tval\tdata");
    $monitor("%5t\t%b\t%b\t%b\t%1d",$time,clk,rst_b,val,data);
    clk=0;
    repeat (2*RUNNING_CYCLES) #(CLK_PERIOD/2) clk=~clk;
  end
  initial begin
    rst_b=0;
    #RST_DURATION rst_b=~rst_b;
  end
endmodule
  
  