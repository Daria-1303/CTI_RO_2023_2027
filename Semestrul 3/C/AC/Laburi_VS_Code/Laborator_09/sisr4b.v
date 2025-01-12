module sisr4b(
    input clk,
    input rst_b,
    input i,
    output [3:0] q
);

d_ff D0(
  .clk(clk),
  .rst_b(rst_b),
  .set_b(1'b1),
  .d(i ^ q[3]),
  .q(q[0])
);

d_ff D1(
  .clk(clk),
  .rst_b(rst_b),
  .set_b(1'b1),
  .d(q[0] ^ q[3]),
  .q(q[1])
);

d_ff D2(
  .clk(clk),
  .rst_b(rst_b),
  .set_b(1'b1),
  .d(q[1]),
  .q(q[2])
);

d_ff D3(
  .clk(clk),
  .rst_b(rst_b),
  .set_b(1'b1),
  .d(q[2]),
  .q(q[3])
);

endmodule

/*
// sau
module sisr4b(
    input clk,
    input rst_b,
    input i,
    output [3:0] q
);

generate 
    genvar i;

    for(i = 0; i < 4; i = i + 1) begin : vect
        if(i == 0)
            d_ff D0(
                .clk(clk),
                .rst_b(rst_b),
                .set_b(1'b1),
                .d(i ^ q[3]),
                .q(q[0])
            );
        else if(i ==  1)
            d_ff D1(
                .clk(clk),
                .rst_b(rst_b),
                .set_b(1'b1),
                .d(q[0] ^ q[3]),
                .q(q[1])
            );
        else 
            d_ff D(
                .clk(clk),
                .rst_b(rst_b),
                .set_b(1'b1),
                .d(q[i-1]),
                .q(q[i])
            );
endgenerate

*/