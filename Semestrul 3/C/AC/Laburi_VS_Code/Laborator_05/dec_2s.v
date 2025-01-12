// decodificator cu o intrare de selectie, s, pe 2 biti, o intrare de enable e,
// pe 1 bit si o iesire, o, pe 2^2 = 4 biti;

module dec_2s (
	input e,
	input [1:0] s,
	output reg [3:0] o
);
	always @ (*)
		case ({e,s})
			0,1,2,3: o = 4'b0000;
			4 : o = 4'b0001;
			5 : o = 4'b0010;
			6 : o = 4'b0100;
			default: o = 4'b1000; 
		endcase
endmodule