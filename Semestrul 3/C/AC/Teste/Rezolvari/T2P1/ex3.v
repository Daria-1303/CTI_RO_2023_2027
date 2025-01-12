module ex3();

reg [15 : 0] d;
reg clk;
reg rst_b;
reg sh_in;
reg ld;
reg sh;

wire [15 : 0] q;

sh_rgst sh_rgst_instanta(
    .d(d),
    .clk(clk),
    .rst_b(rst_b),
    .sh_in(sh_in),
    .ld(ld),
    .sh(sh),
    .q(q)
);

localparam CLK_PERIOD = 100;
localparam CLK_CYCLES = 4;

initial begin
    clk = 1;
    (2 * CLK_CYCLES) #(CLK_PERIOD / 2) clk = ~clk;
end

localparam RST_PULSE = 25;

initial begin
    rst_b = 0;
    #(RST_PULSE) rst_b = 1;
end

initial begin
    sh_in = 0;
    ld = 0;
    sh = 0;
    d = 16'hXXXX;

    #(CLK_PERIOD)   sh_in = 1;
                    ld = 1;
                    d = 16'hAB00;

    #(CLK_PERIOD / 2)   d = 16'h0000;
                        sh_in = 0;
                        sh = 1;

    #(CLK_PERIOD / 2)   d = 16'h1234;
                        ld = 0;
                        
    #(CLK_PERIOD)   sh_in = 1;
                    sh = 0;
end

endmodule