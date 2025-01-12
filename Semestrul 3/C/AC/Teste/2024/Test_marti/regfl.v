module regfl #(
    parameter width = 64
)(
    input clk, 
    input rst_b,
    input we,   // write enable
    input [2:0] s,   // select
    input [width - 1:0] d,   // data
    output [511:0] q   // output
);

wire [7:0] dout;  // data out from dec

//decodificatorul este primul modul pe care il folosim

dec #(.width(3)) instanta_dec (
    .s(s),
    .e(we),
    .o(dout)
);

// cream cei 8 registrii

generate 
        genvar i; // variabila generata

        for(i = 0; i < 8; i = i + 1) begin : vect
            rgst #(.width(64)) instanta_rgst (
                .clk(clk),
                .rst_b(rst_b),
                .clr(1'b0),     // clear = 0 pentru ca nu avem nevoie de clear
                .d(d),
                .ld(dout[i]),   // load = dout[i] pentru ca vrem sa incarcam daca e nevoie
                .q(q[511 - i * 64 : 448 - i * 64])
            );
        end
endgenerate

endmodule

module regfl_tb;

// input
reg clk;
reg rst_b;
reg we;
reg [2:0] s;
reg [63:0] d;

// output
wire [511:0] q;

// instanta modulului regfl
regfl instanta_regfl (
    .clk(clk),
    .rst_b(rst_b),
    .we(we),
    .s(s),
    .d(d),
    .q(q)
);

// parametrii pentru clock  (luati de pe desen)
localparam CLK_PERIOD = 100;
localparam RUNNING_CYCLES = 13;

initial begin 
    clk = 0;
    repeat (2 * RUNNING_CYCLES) # (CLK_PERIOD / 2) clk = ~clk;
end

//parametrii reset
localparam RST_DURATION = 25;

initial begin
    rst_b = 0;
    #RST_DURATION rst_b = 1;
end

//modificarea semnalului we
initial begin
    we  = 1;

    // dupa 6 perioade de ceas, we devine 0
    #(6 * CLK_PERIOD) we = ~we;
    // dupa inca o perioada de ceas, we devine 1
    #(1 * CLK_PERIOD) we = ~we;
end

initial begin
    s = $urandom(); // initializare s cu un numar random

    // generam 12 numere random pentru s
    repeat (12)
        #(1 * CLK_PERIOD) s = $urandom();
end

// task pentru generarea unui numar random de 64 de biti
task urand64(output reg [63:0] r);
begin
    r[63:32] = $urandom();
    r[31:0] = $urandom();
end
endtask

initial begin 
    // initializare d cu un numar random
    urand64(d);

    // generam 12 numere random pentru d
    repeat (12)
        #(1 * CLK_PERIOD) urand64(d);
end

endmodule