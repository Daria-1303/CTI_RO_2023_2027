module hex_7display
(input [3:0] c,
output reg [6:0] hex);
always
@c
begin
hex = 7'b1111111;
case( c)
4'b0000: hex = 7'b0111111; //0
4'b0001: hex = 7'b0000110; //1
4'b0010: hex = 7'b1011011; //2
4'b0011: hex = 7'b1001111; //3
4'b0100: hex = 7'b1100110; //4
4'b0101: hex = 7'b1101101; //5
4'b0110: hex = 7'b1111101; //6
4'b0111: hex = 7'b0000111; //7
4'b1000: hex = 7'b1111111; //8
4'b1001: hex = 7'b1101111; //9
4'b1010: hex = 7'b1011111; //10
4'b1011: hex = 7'b1111100; //11
4'b1100: hex = 7'b0111001; //12
4'b1101: hex = 7'b1011110; //13
4'b1110: hex = 7'b1111001; //14
4'b1111: hex = 7'b1110001; //15

//DE COMPLETAT DESCRIEREA MODULULUI
endcase

end

endmodule