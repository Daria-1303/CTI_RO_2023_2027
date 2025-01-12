module cntr #(parameter w=8)(
	input clk, rst_b,c_up,clr,
	output reg [w-1:0] q
);
	always @ (posedge clk, negedge rst_b)
		if (!rst_b)			q <= 0;
		else if (c_up)			q <= q+1;
		else if (clr)			q <= 0;
endmodule