//full adder cell
module fac(
	input x,
	input y,
	input ci,
	output z,
	output co
);

assign z = x ^ y ^ ci;
assign co = (x & y) | (x & ci) | (y & ci);

endmodule
	
module fac_tb;
	reg x, y, ci;
	wire z, co;

	fac uut (.x(x), .y(y), .ci(ci), .z(z), .co(co));

integer i;

initial begin
	$display("x y ci | z co");
        $display("-------|------");
	
	//{x, y, ci} = 0;
	for(i = 0; i < 8; i = i + 1) begin
		{x, y, ci} = i;
		#20;
		$display("%b %b %b | %b %b", x, y, ci, z, co);
	end
	//$finish;
end

endmodulea