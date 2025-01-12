module dec_2s(
	input e,
	input [1:0] s,
	output reg [3:0] o
);

always @(*)
	case ({e, s}):
		0,1,2,3 : 4'b0000;
		4 : 4'b0001;
		5 : 4'b0010;
		6 : 4'b0100;
		default : 4'b1000;
	endcase
end


endmodule
