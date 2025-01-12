module rgst #(
	parameter width = 8
)(
	input clk,	//clock
	input rst_b,	//reset asincron
 	input clr,	//semnal de clear
	input ld,	//daca se incarca sau nu data
	input [width - 1 : 0] data,	//data
	output reg [width - 1 : 0] q
);

always @(posedge clk, negedge rst_b) begin
	if(!rst_b)
		q <= 0;
	else if(clr)
		q <= 0;
	else if(ld)
		q <= data;
end

endmodule
