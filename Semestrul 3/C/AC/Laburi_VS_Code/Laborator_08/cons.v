module cons (
    input clk, 
    input rst_b,
    input val,  // semnal de validare a datelor
    input [7:0] data,  // datele de intrare
    output reg [7:0] sum,  // datele de iesire
);

reg [7:0] anterior;

always @(posedge clk or negedge rst_b) begin
  if(!rst_b) begin 
        sum <= 0; 
        anterior <= 0; 
    end
  else if(val == 1) begin
      if(data >= anterior) begin
        sum <= sum + data;
      end
      anterior <= data;
  end
end

endmodule

module cons_tb;
  reg clk,rst_b;
  wire val;
  wire [7:0] data,sum;
  
  prod inst1(
    .clk(clk),
    .rst_b(rst_b),
    .val(val),
    .data(data)
);
  cons inst2(
    .clk(clk),
    .rst_b(rst_b),
    .val(val),
    .data(data),
    .sum(sum)
);
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