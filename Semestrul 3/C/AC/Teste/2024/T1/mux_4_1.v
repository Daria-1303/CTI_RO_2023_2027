module mux_4_1 #(
    parameter width  = 8
)(
    input [width - 1 : 0] d0,
    input [width - 1 : 0] d1,
    input [width - 1 : 0] d2,
    input [width - 1 : 0] d3,
    input [1 :  0] s,
    output reg [width - 1: 0] o
);

always @(*) begin
    case(s)
        2'b00 : o = d0;
        2'b01 : o = d1;
        2'b10 : o = d2;
        2'b11 : o = d3;
    endcase
end

endmodule