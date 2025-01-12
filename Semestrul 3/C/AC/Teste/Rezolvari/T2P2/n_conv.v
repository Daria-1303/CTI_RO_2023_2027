module n_conv #(
    parameter n_conv = 4     //nr de cifre
)(
    input [4 * n_conv - 1 : 0] numar,
    output [8 * n_conv - 1 : 0] out // 7 segmente + dp
);

genvar i;

generate
    for (i = 0; i < n_conv; i = i + 1) begin : digits_to_seg
        E3Digit_to_7seg conv_inst(
            .digit(numar[4 * i + 3 : 4 * i]),
            .seg(out[8 * i + 7 : 8 * i])
        );
    end
endgenerate

endmodule

module ex2_tb();

reg [15:0] numar;
wire [31:0] out;


n_conv uut (
    .numar(numar),
    .out(out)
);

initial begin
    numar = 16'b00000000000000000;

    #10 numar = 16'b0000_0000_0000_0001;
    #10 numar = 16'b0000_0000_0000_0010;
    #10 numar = 16'b0000_0000_0000_0011;
    #10 numar = 16'b0000_0000_0000_0100;
    #10 numar = 16'b0000_0000_0000_0101;
    #10 numar = 16'b0000_0000_0000_0110;
    #10 numar = 16'b0000_0000_0000_0111;
    #10 numar = 16'b0000_0000_0000_1000;
    #10 numar = 16'b0000_0000_0000_1001;
    #10 numar = 16'b0000_0000_0000_1111;
    #10 $stop;
end

endmodule