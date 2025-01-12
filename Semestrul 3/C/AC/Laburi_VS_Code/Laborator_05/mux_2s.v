module mux_2s #(
    parameter width = 4
)(
    input [width - 1 : 0] d0,
    input [width - 1 : 0] d1,
    input [width - 1 : 0] d2,
    input [width - 1 : 0] d3,
    input [1 : 0] s,
    output [width - 1 : 0] o
);

assign o = (s == 2'b00) ? d0 :
           (s == 2'b01) ? d1 :
           (s == 2'b10) ? d2 :
           (s == 2'b11) ? d3 :
            {width{1'bz}}; // vom aveam impedanta ridicata pe toti bitii
endmodule

module tb_mux_2s;

reg [1: 0] s;
reg [3: 0] d0, d1, d2, d3;
wire [3: 0] o;

mux_2s mux_2s_inst(
    .d0(d0),
    .d1(d1),
    .d2(d2),
    .d3(d3),
    .s(s),
    .o(o)
);

integer i;

initial begin
    $display("d0_16\td1_16\td2_16\td3_16\ts_10\t||\to_16");
    $monitor("%h\t%h\t%h\t%h\t%d\t||\t%h", d0, d1, d2, d3, s, o);
    d0 = 4'b0001;
    d1 = 4'b0010;
    d2 = 4'b0100;
    d3 = 4'b1000;
    // expected values: 0001, 0010, 0100, 1000  (1, 2, 4, 8)
    // -> output should be the same as the input

    for (i = 0; i < 4; i = i + 1) begin
        s = i[1:0];
        #10;
    end
end

endmodule