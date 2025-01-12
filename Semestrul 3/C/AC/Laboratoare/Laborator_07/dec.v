module dec #(
	parameter w=2
)(
	input [w-1:0] s,
	input e,
	output reg [2**w-1:0] o
);
always @ (*) begin
	o = 0;
	if (e)
		o[s] = 1;
	end
endmodule
