module lfsr5b(
    input clk,
    input rst_b,
    output [4:0] q
);

d_ff D0(
  .clk(clk),
  .rst_b(1'b1),
  .set_b(rst_b),
  .d(q[4]),
  .q(q[0])
);

d_ff D1(
  .clk(clk),
  .rst_b(1'b1),
  .set_b(rst_b),
  .d(q[0]),
  .q(q[1])
);

d_ff D2(
  .clk(clk),
  .rst_b(1'b1),
  .set_b(rst_b),
  .d(q[4] ^ q[1]),
  .q(q[2])
);

d_ff D3(
  .clk(clk),
  .rst_b(1'b1),
  .set_b(rst_b),
  .d(q[2]),
  .q(q[3])
);

d_ff D4(
  .clk(clk),
  .rst_b(1'b1),
  .set_b(rst_b),
  .d(q[3]),
  .q(q[4])
);

endmodule

/*
// sau 
module lfsr5b(
    input clk,
    input rst_b,
    output [4:0] q
);

generate 
    genvar i;

    for(i = 0; i < 5; i = i + 1) begin : vect
        if(i == 0)
            d_ff D0(
                .clk(clk),
                .rst_b(1'b1),
                .set_b(rst_b),
                .d(q[4]),
                .q(q[0])
            );
        else if(k == 2)
            d_ff D2(
                .clk(clk),
                .rst_b(1'b1),
                .set_b(rst_b),
                .d(q[4] ^ q[1]),
                .q(q[2])
            );
        else
            d_ff D(
                .clk(clk),
                .rst_b(1'b1),
                .set_b(rst_b),
                .d(q[i-1]),
                .q(q[i])
            );
    end

endgenerate

*/

module lfsr5b_tb;
reg clk;
reg rst_b;
wire [4:0] q;

lsfr5b inst(
    .clk(clk),
    .rst_b(rst_b),
    .q(q)
);

localparam CLK_PERIOD = 100;
localparam RUNNING_CYCLES = 35;

initial begin
    clk = 0;
    repeat (2 * RUNNING_CYCLES) #(CLK_PERIOD / 2) clk = ~clk;
end

localparam RST_DURATION = 25;

initial begin
    rst_b = 0;
    #RST_DURATION rst_b = 1;
end

endmodule