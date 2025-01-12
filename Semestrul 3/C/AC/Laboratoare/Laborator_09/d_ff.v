module d_ff(
	input clk,
	input rst_b,
	input set_b,
	input d,
	output reg q	
);

always @(posedge clk, negedge rst_b, negedge set_b) begin
	if(~set_b)
		q <= 1'd1;
	else if(~rst_b)
		q <= 1'd0;
	else
		q <= d;

end

endmodule
