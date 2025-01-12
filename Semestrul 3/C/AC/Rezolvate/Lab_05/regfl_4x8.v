module regfl_4x8 (
    input clk, rst_b, wr_e,
    input [1:0] wr_addr, rd_addr,
    input [7:0] wr_data,
    output [7:0] rd_data
);
    wire [3:0] dout;
    wire [7:0] rout[0:3]; //declararea unui tablou de 4 element ([0:3]), fiecare
                          // element fiind o magistrala de 8 biti ([7:0])
    dec_2s inst0(.s(wr_addr), .e(wr_e), .o(dout));
    // se construiesc 4 instante rgst, parametrizate prin latime
    rgst #(.w(8)) inst1(.clk(clk), .rst_b(rst_b), .ld(dout[0]), .clr(1'd0), .d(wr_data), .q(rout[0]));
    rgst #(.w(8)) inst2(.clk(clk), .rst_b(rst_b), .ld(dout[1]), .clr(1'd0), .d(wr_data), .q(rout[1]));
    rgst #(.w(8)) inst3(.clk(clk), .rst_b(rst_b), .ld(dout[2]), .clr(1'd0), .d(wr_data), .q(rout[2]));
    rgst #(.w(8)) inst4(.clk(clk), .rst_b(rst_b), .ld(dout[3]), .clr(1'd0), .d(wr_data), .q(rout[3]));
    mux_2s #(.w(8)) inst5(.s(rd_addr), .d0(rout[0]), .d1(rout[1]), .d2(rout[2]), .d3(rout[3]), .o(rd_data));
endmodule

module regfl4x8_tb;
    reg clk, rst_b, wr_e;
    reg [1:0] wr_addr, rd_addr;
    reg [7:0] wr_data;
    wire [7:0] rd_data;

    regfl_4x8 dut(.clk(clk), .rst_b(rst_b), .wr_e(wr_e), .wr_addr(wr_addr), .rd_addr(rd_addr), .wr_data(wr_data), .rd_data(rd_data));

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
                        wr_addr = 2'h0; wr_data = 8'ha2; wr_e = 1; rd_addr = 2'h3;
        #(1*CLK_PERIOD) wr_addr = 2'h2; wr_data = 8'h2e;           rd_addr = 2'h0;
        #(1*CLK_PERIOD) wr_addr = 2'h1; wr_data = 8'h98; wr_e = 0; rd_addr = 2'h1;
        #(1*CLK_PERIOD) wr_addr = 2'h3; wr_data = 8'h55; wr_e = 1; rd_addr = 2'h2;
        #(1*CLK_PERIOD) wr_addr = 2'h0; wr_data = 8'h20;           rd_addr = 2'h0;
        #(1*CLK_PERIOD) wr_addr = 2'h1; wr_data = 8'hff;           rd_addr = 2'h3;
        #(1*CLK_PERIOD) wr_addr = 2'h3; wr_data = 8'hc7;           rd_addr = 2'h1;
        #(1*CLK_PERIOD) wr_addr = 2'h2; wr_data = 8'hb5; wr_e = 0; rd_addr = 2'h2;
        #(1*CLK_PERIOD) wr_addr = 2'h3; wr_data = 8'h91; wr_e = 1; rd_addr = 2'h3;
    end

    // in urma simularii testbench-ului se poate verifica modul de umplere al register file-ului
    // - in primul ciclu de clock se scrie la adresa 0 valoarea a2 si se citeste de la adresa 3, unde
    //   regfl-ul find gol, se va citi valoarea 0;
    // - in al doilea ciclu de tact se scrie la adresa 2 valoarea 2e, respectiv se citeste de la 
    //   adresa 0, valoarea a2, scrisa in ciclul de tact anterior
endmodule