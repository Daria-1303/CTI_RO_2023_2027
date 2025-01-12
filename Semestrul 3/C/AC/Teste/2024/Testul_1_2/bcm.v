// modulul asta poate fi facut in doua variante
module bcm(
    input [2:0] i,
    output reg [1:0] o
);

always @(*) begin
    case(i) 
        3'b000 : o = 2'b11;
        3'b001 : o = 2'b01;
        3'b010 : o = 2'b11;
        3'b011 : o = 2'b00;
        3'b100 : o = 2'b11;
        3'b101 : o = 2'b11;
        3'b110 : o = 2'b00;
        3'b111 : o = 2'b00;
    endcase
end

endmodule

/*
module bcm(
    input [2:0] i,
    output reg [1:0] o
);

//din k-map

assign o[1] = (~i[2] & ~i[0]) | (~i[1] & i[0]) | (i[2] & ~i[1]);
assign o[0] = (~i[2] & i[0]) | i[1];
 
endmodule
*/

module bcm_tb;

reg [2:0] i;
wire [1:0] o;

bcm bcm_inst(
    .i(i),
    .o(o)
);

integer k;

initial begin
    $display("i : i[2] i[1] i[0] | o : o[1] o[0]");
    $monitor("%d : %b      %b    %b  | %d :   %b    %b", i, i[2], i[1], i[0], o, o[1], o[0]);

    for(k = 0; k < 8; k = k + 1) begin
        i = k;
        #50;
    end
end

endmodule