//si modulul dee regfl_4x8 poate fi scris in doua moduri
module regfl_4x8(
    input clk,
    input rst_b,
    input [7 : 0] wr_data,
    input [1 : 0] wr_addr,
    input wr_e,
    input [1 : 0] rd_addr,
    output [7 : 0] rd_data 
);

wire [3 : 0] dec_out;

wire [7 : 0] rgst_out [0 : 3];

dec_1_4 circ1(
    .e(wr_e),
    .s(wr_addr),
    .o(dec_out)
);

genvar i;

generate
    for(i = 0; i < 4; i = i + 1) begin : rgst_blk
        rgst #(
            .width(8)
        ) rgst_i (
            .clk(clk),
            .rst_b(rst_b),
            .ld(dec_out[i]),
            .clr(1'b0), // ca sa nu activam ramura de clear
            .d(wr_data),
            .q(rgst_out[i])
        );
    end
endgenerate

mux_4_1 #(
    .width(8)
) circ3 (
    .d0(rgst_out[0]),
    .d1(rgst_out[1]),
    .d2(rgst_out[2]),
    .d3(rgst_out[3]),
    .s(rd_addr),
    .o(rd_data)
);

endmodule

/*
//sau a doua varianta, fara genvar
module regfl_4x8(
    input clk,
    input rst_b,
    input [7 : 0] wr_data,
    input [1 : 0] wr_addr,
    input wr_e,
    input [1 : 0] rd_addr,
    output [7 : 0] rd_data 
);

wire [3 : 0] dec_out;

wire [7 : 0] rgst_out [0 : 3];

dec_1_4 circ1(
    .e(wr_e),
    .s(wr_addr),
    .o(dec_out)
);

rgst #(
    .width(8)
) rgst_i0 (
    .clk(clk),
    .rst_b(rst_b),
    .ld(dec_out[0]),
    .clr(1'b0), // ca sa nu activam ramura de clear
    .d(wr_data),
    .q(rgst_out[0])
);

rgst #(
    .width(8)
) rgst_i1 (
    .clk(clk),
    .rst_b(rst_b),
    .ld(dec_out[1]),
    .clr(1'b0), // ca sa nu activam ramura de clear
    .d(wr_data),
    .q(rgst_out[1])
);

rgst #(
    .width(8)
) rgst_i2 (
    .clk(clk),
    .rst_b(rst_b),
    .ld(dec_out[2]),
    .clr(1'b0), // ca sa nu activam ramura de clear
    .d(wr_data),
    .q(rgst_out[2])
);

rgst #(
    .width(8)
) rgst_i3 (
    .clk(clk),
    .rst_b(rst_b),
    .ld(dec_out[3]),
    .clr(1'b0), // ca sa nu activam ramura de clear
    .d(wr_data),
    .q(rgst_out[3])
);

mux_4_1 #(
    .width(8)
)(
    .d0(rgst[0]),
    .d1(rgst[1]),
    .d2(rgst[2]),
    .d3(rgst[3]),
    .s(rd_addr),
    .o(rd_data)
);
*/


module regfl4x8_tb;
    reg clk, rst_b, wr_e;
    reg [1:0] wr_addr, rd_addr;
    reg [7:0] wr_data;
    wire [7:0] rd_data;

    regfl_4x8 dut(.clk(clk), .rst_b(rst_b), .wr_e(wr_e), .wr_addr(wr_addr), .rd_addr(rd_addr), .wr_data(wr_data), .rd_data(rd_data));

    localparam CLK_PERIOD=100, RUNNING_CYCLES=5;
    initial begin
        clk=0;
        repeat (2*RUNNING_CYCLES) #(CLK_PERIOD/2) clk=~clk;
    end
    localparam RST_DURATION=25;
    initial begin
        rst_b=0;
        #RST_DURATION rst_b=~rst_b;
    end

    initial begin
                        wr_addr = 2'h0; wr_data = 8'h00; wr_e = 1; rd_addr = 2'h3;
        #(1*CLK_PERIOD) wr_addr = 2'h2; wr_data = 8'h01;           rd_addr = 2'h0;
        #(1*CLK_PERIOD) wr_addr = 2'h1; wr_data = 8'h02; wr_e = 0; rd_addr = 2'h1;
        #(1*CLK_PERIOD) wr_addr = 2'h3; wr_data = 8'h03; wr_e = 1; rd_addr = 2'h2;
        #(1*CLK_PERIOD) wr_addr = 2'h0; wr_data = 8'h04;           rd_addr = 2'h0;
    end

endmodule