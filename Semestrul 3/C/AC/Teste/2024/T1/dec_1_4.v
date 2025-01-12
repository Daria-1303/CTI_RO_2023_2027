module dec_1_4(
    input e,
    input [1:0] s,
    output reg [3:0] o
);

always @(*) begin
    case ({e, s})
        0, 1, 2, 3 : o = 4'b0000; // avem enable pe 0 deci nu conteaza s
        4 : o = 4'b0001; // avem enable pe 1 si s pe 00
        5 : o = 4'b0010; // avem enable pe 1 si s pe 01
        6 : o = 4'b0100; // avem enable pe 1 si s pe 10
        default : o = 4'b1000; // avem enable pe 1 si s pe 11 (aici intra si 7 si orice alt caz care nu e acoperit de cele de mai sus)
    endcase
end

endmodule