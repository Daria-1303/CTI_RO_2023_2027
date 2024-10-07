module ex1c (
	input a, b, c, d,
	output f3
);
	//write Verilog code here
	assign f3 = (~(~( b & d))) + (~(~(~c & ~d)));
endmodule

module ex1c_tb;
	reg a, b, c, d;
	wire f3;

	ex1c ex1c_i (.a(a), .b(b), .c(c), .d(d), .f3(f3));

	integer k;
	initial begin
		$display("Time\ta\tb\tc\td\tabcd_10\tf3");
		$monitor("%0t\t%b\t%b\t%b\t%b\t%0d\t%b", $time, a, b, c, d, {a,b,c,d}, f3);
		{a, b, c, d} = 0;
		for (k = 1; k < 16; k = k + 1)
			#10 {a, b, c, d} = k;
	end
endmodule