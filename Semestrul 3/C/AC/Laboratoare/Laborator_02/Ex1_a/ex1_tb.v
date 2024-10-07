module ex1a_tb;
	reg a, b, c;
	wire f1;

	ex1a ex1a_i (.a(a), .b(b), .c(c), .f1(f1));

	integer k;
	initial begin
		$display("Time\ta\tb\tc\tabcd_10\tf1");
		$monitor("%0t\t%b\t%b\t%b\t%0d\t%b", $time, a, b, c, {a,b,c}, f1);
		{a, b, c} = 0;
		for (k = 1; k < 8; k = k + 1)
			#10 {a, b, c} = k;
	end
endmodule