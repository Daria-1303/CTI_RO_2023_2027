module seq3b (
  input [3:0] i,
  output reg o
);
  //write Verilog code here
always @(*) begin
	//prima linie pt bitii 3, 2, 1 si a doua linie pt bitii 2, 1, 0
	if( (i[3:1] == 3'b111) || (i[3:1] == 3'b000) ||   
	    (i[2:0] == 3'b111) || (i[2:0] == 3'b000) )
		o = 1;
	else
		o = 0;

end
endmodule

module seq3b_tb;
  reg [3:0] i;
  wire o;

  seq3b seq3b_i (.i(i), .o(o));

  integer k;
  initial begin
    $display("Time\ti\t\to");
    $monitor("%0t\t%b(%2d)\t%b", $time, i, i, o);
    i = 0;
    for (k = 1; k < 16; k = k + 1)
      #10 i = k;
  end
endmodule