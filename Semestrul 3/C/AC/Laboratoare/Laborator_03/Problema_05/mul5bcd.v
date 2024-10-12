module mul5bcd (
  input [3:0] i,
  output reg [3:0] d, u
);
  //write Verilog code here
reg [7:0] rezultat;

always @(*) begin
	rezultat = i * 5;

	d = rezultat / 10;
	u = rezultat % 10;
end
endmodule

module mul5bcd_tb;
  reg [3:0] i;
  wire [3:0] d, u;

  mul5bcd mul5bcd_i (.i(i), .d(d), .u(u));

  integer k;
  initial begin
    $display("Time\ti\t\td\t\tu");
    $monitor("%0t\t%b(%4d)\t%b(%4d)\t%b(%4d)", $time, i, i, d, d, u, u);
    i = 0;
    for (k = 1; k < 10; k = k + 1)
      #10 i = k;
  end
endmodule