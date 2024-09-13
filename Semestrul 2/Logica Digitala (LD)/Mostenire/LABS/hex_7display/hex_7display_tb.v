module hex_7display_tb;
// Inputs
reg [3:0] c; //hex digit
//Outputs
wire [6:0] hex;
hex_7display uut(
.c(c),
.hex(hex)
);

initial begin
// Initialize Inputs
c = 0;
end
always //toggle inputs for two bit comparator
 
begin
	#20 c = 1;
	#20 c = 2;
	#20 c = 3;	
	#20 c = 4;	
	#20 c = 5;
	#20 c = 6;
	#20 c = 7;	
	#20 c = 8;	
	#20 c = 9;
	#20 c = 10;
	#20 c = 11;	
	#20 c = 12;	
	#20 c = 13;
	#20 c = 14;
	#20 c = 15;	
	#40;
end
endmodule