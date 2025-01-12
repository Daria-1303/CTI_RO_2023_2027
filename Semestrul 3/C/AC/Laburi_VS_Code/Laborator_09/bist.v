module bist(
    input clk,
    input rst_b,
    output [3:0] sig
);

wire [4:0] q;
wire o;

//instantiem primul modul din arhitectura lfbs5b

lfsr5b lsfr5b_inst(
    .clk(clk),
    .rst_b(rst_b),
    .q(q)
);

//instantiem al doilea modul din arhitectura check

check check_inst(
    .i(q),
    .o(o)
);

//instantiem al treilea modul din arhitectura sisr4b

sisr4b sisr4b_inst(
    .clk(clk),
    .rst_b(rst_b),
    .i(o),
    .q(sig)
);

endmodule

module bist_tb;

reg clk;
reg rst_b;
wire [3:0] sig;

bist bist_inst(
    .clk(clk),
    .rst_b(rst_b),
    .sig(sig)
);

localparam CLK_PERIOD = 100;
localparam RUNNING_CYCLES = 31;

initial begin
    clk = 0;
    repeat(2 * RUNNING_CYCLES) #(CLK_PERIOD / 2) clk = 1 - clk;
end

localparam RST_DURATION = 25;

initial begin
    rst_b = 0;
    #RST_DURATION rst_b = 1;
end

endmodule
