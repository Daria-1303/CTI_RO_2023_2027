module cnt1s (
	input [5:0] i,
	output reg [2:0] o
);
	always @ (*)
	  /*cei 6 biti ai intrarii sunt adunati => numarul de biti de 1*/
	  o = i[0] + i[1] + i[2] + i[3] + i[4] + i[5];
endmodule

module cnt1s_tb;
	reg [5:0] i;
	wire [2:0] o;

	cnt1s cnt1s_i (.i(i), .o(o));

	integer k;
	initial begin
		$display("Time\ti\t\to");
		$monitor("%0t\t%b(%2d)\t%b(%0d)", $time, i, i, o, o);
		i = 0;
		for (k = 1; k < 64; k = k + 1)
			#10 i = k;
	end
endmodule