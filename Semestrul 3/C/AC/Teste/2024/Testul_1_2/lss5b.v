// modulul se poate implementa in doua modalitati
module lss5b(
    input clk,
    input rst_b,
    output [4:0] q
);

d_ff circ0(
            .clk(clk),
            .rst_b(1'b1),
            .set_b(rst_b),
            .d(q[4]),
            .q(q[0])
);

d_ff circ1(
            .clk(clk),
            .rst_b(1'b1),
            .set_b(rst_b),
            .d(q[0]),
            .q(q[1])
);

d_ff circ2(
            .clk(clk),
            .rst_b(1'b1),
            .set_b(rst_b),
            .d(q[1]),
            .q(q[2])
);

d_ff circ3(
            .clk(clk),
            .rst_b(1'b1),
            .set_b(rst_b),
            .d(q[4] ^ q[2]),
            .q(q[3])
);

d_ff circ4(
            .clk(clk),
            .rst_b(1'b1),
            .set_b(rst_b),
            .d((q[4] ^ q[3])),
            .q(q[4])
);

endmodule

/*
// cu generare de registrii
module lss5b(
    input clk,
    input rst_b,
    output [4:0] q
);

genvar i;

generate
    for(i = 0; i < 5; i = i + 1) begin : vect
        if(i == 0) begin
            d_ff circ0(
                .clk(clk),
                .rst_b(1'b1),
                .set_b(rst_b),
                .d(q[4]),
                .q(q[i])
            );
        end
        else if(i == 3) begin
            d_ff circ3(
                .clk(clk),
                .rst_b(1'b1),
                .set_b(rst_b),
                .d(q[4] ^ q[2]),
                .q(q[i])
            );
        end
        else if(i == 4) begin
            d_ff circ4(
                .clk(clk),
                .rst_b(1'b1),
                .set_b(rst_b),
                .d((q[4] ^ q[3])),
                .q(q[i])
            );
        end
        else begin
            d_ff circ(
                .clk(clk),
                .rst_b(1'b1),
                .set_b(rst_b),
                .d(q[i - 1]),
                .q(q[i])
            );
        end
    end
endgenerate

*/

module d_ff(
    input clk,
    input rst_b,
    input set_b,
    input d,
    output reg q
);

always @(posedge clk, negedge rst_b, negedge set_b) begin
    if(!set_b) begin
        q <= 1'b1;
    end
    else if(!rst_b) begin
        q <= 1'b0;
    end
    else begin
        q <= d;
    end
end

endmodule

module lss5b_tb;

reg clk;
reg rst_b;

wire [4:0] q;

// instantiem modulul
lss5b lss5b_inst(
    .clk(clk),
    .rst_b(rst_b),
    .q(q)
);

localparam CLK_PERIOD = 100;
localparam CLK_CYCLES = 8;

initial begin 
    clk = 0;
    repeat (2 * CLK_CYCLES) # (CLK_PERIOD / 2) clk = ~clk;
end

localparam RST_PULSE = 25;

initial begin
    rst_b = 0;
    #(RST_PULSE) rst_b = 1;
end

endmodule

