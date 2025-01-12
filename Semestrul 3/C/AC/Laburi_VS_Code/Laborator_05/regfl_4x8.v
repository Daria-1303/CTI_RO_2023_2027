/*
module regfl_4x8 (
	input clk,
	input rst_b,               // Reset asincron
	input [7:0] wr_data,       // Datele de scriere
	input [1:0] wr_addr,       // Adresa de scriere
	input wr_e,                // Semnal de activare a scrierii
	output [7:0] rd_data,      // Datele de citire
	input [1:0] rd_addr        // Adresa de citire
);

//registrele de 8 biti
wire [7 : 0] q0, q1, q2, q3;
wire [3:0] load_signals;

dec_2s decoder(
    .e(wr_e),
    .s(wr_addr),
    .o(load_signals)
);


rgst #() reg0 (.clk(clk), .rst_b(rst_b), .ld(wr_e && load_signals[0]), .clr(1'b0), .d(wr_data), .q(q0));
rgst #() reg1 (.clk(clk), .rst_b(rst_b), .ld(wr_e && load_signals[1]), .clr(1'b0), .d(wr_data), .q(q1));
rgst #() reg2 (.clk(clk), .rst_b(rst_b), .ld(wr_e && load_signals[2]), .clr(1'b0), .d(wr_data), .q(q2));
rgst #() reg3 (.clk(clk), .rst_b(rst_b), .ld(wr_e && load_signals[3]), .clr(1'b0), .d(wr_data), .q(q3));

mux_2s #(.width(8)) mux_rd (
        .d0(q0),
        .d1(q1),
        .d2(q2),
        .d3(q3),
        .s(rd_addr),
        .o(rd_data)
);


endmodule
*/


module regfl_4x8 (
    input clk,
    input rst_b,               // Reset asincron
    input [7:0] wr_data,       // Datele de scriere
    input [1:0] wr_addr,       // Adresa de scriere
    input wr_e,                // Semnal de activare a scrierii
    output [7:0] rd_data,      // Datele de citire
    input [1:0] rd_addr        // Adresa de citire
);
//facem tablou pentru registre
wire [7:0] reg_temp[0:3];
wire [3 : 0] load_signals;

dec_2s decoder(
    .e(wr_e),
    .s(wr_addr),
    .o(load_signals)
);

rgst #(.w(8)) reg1(
    .clk(clk),
    .rst_b(rst_b),
    .ld(load_signals[0]),
    .clr(1'b0),
    .d(wr_data),
    .q(reg_temp[0])
);

rgst #(.w(8)) reg2(
    .clk(clk),
    .rst_b(rst_b),
    .ld(load_signals[1]),
    .clr(1'b0),
    .d(wr_data),
    .q(reg_temp[1])
);

rgst #(.w(8)) reg3(
    .clk(clk),
    .rst_b(rst_b),
    .ld(load_signals[2]),
    .clr(1'b0),
    .d(wr_data),
    .q(reg_temp[2])
);

rgst #(.w(8)) reg4(
    .clk(clk),
    .rst_b(rst_b),
    .ld(load_signals[3]),
    .clr(1'b0),
    .d(wr_data),
    .q(reg_temp[3])
);

// mux pentru citire

mux_2s #(.w(8)) mux(
    .s(rd_addr),
    .d0(reg_temp[0]),
    .d1(reg_temp[1]),
    .d2(reg_temp[2]),
    .d3(reg_temp[3]),
    .o(rd_data)
);

endmodule

module regfl4x8_tb;
    reg clk, rst_b, wr_e;
    reg [1:0] wr_addr, rd_addr;
    reg [7:0] wr_data;
    wire [7:0] rd_data;

   regfl4x8_tb instanta (
    .clk(clk),
    .rst_b(rst_b),
    .wr_e(wr_e),
    .wr_addr(wr_addr),
    .rd_addr(rd_addr),
    .wr_data(wr_data),
    .rd_data(rd_data)
   );

    localparam CLK_PERIOD=100, RUNNING_CYCLES=9;

    initial begin
        clk=0;
        repeat (2*RUNNING_CYCLES) #(CLK_PERIOD/2) clk=~clk;
    end

    localparam RST_DURATION=5;
    initial begin
        rst_b=0;
        #RST_DURATION rst_b=~rst_b;
    end

    initial begin
        //initializare
        wr_addr = 2'h0; 
        wr_data = 8'ha2; 
        wr_e = 1; 
        rd_addr = 2'h3;
        #(1*CLK_PERIOD) wr_addr = 2'h2; wr_data = 8'h2e;           rd_addr = 2'h0;
        #(1*CLK_PERIOD) wr_addr = 2'h1; wr_data = 8'h98; wr_e = 0; rd_addr = 2'h1;
        #(1*CLK_PERIOD) wr_addr = 2'h3; wr_data = 8'h55; wr_e = 1; rd_addr = 2'h2;
        #(1*CLK_PERIOD) wr_addr = 2'h0; wr_data = 8'h20;           rd_addr = 2'h0;
        #(1*CLK_PERIOD) wr_addr = 2'h1; wr_data = 8'hff;           rd_addr = 2'h3;
        #(1*CLK_PERIOD) wr_addr = 2'h3; wr_data = 8'hc7;           rd_addr = 2'h1;
        #(1*CLK_PERIOD) wr_addr = 2'h2; wr_data = 8'hb5; wr_e = 0; rd_addr = 2'h2;
        #(1*CLK_PERIOD) wr_addr = 2'h3; wr_data = 8'h91; wr_e = 1; rd_addr = 2'h3;
    end

endmodule