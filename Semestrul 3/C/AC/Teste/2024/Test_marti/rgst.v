module rgst #(
	parameter width=8
)(
	input clk, 
    input rst_b, 
    input ld, 
    input clr,
	input [w-1:0] d,
	output reg [w-1:0] q
);
always @ (posedge clk, negedge rst_b)
	if (!rst_b)			
        q <= 0;
	else if (clr)			
        q <= 0;
	else if (ld)			
        q <= d;
endmodule