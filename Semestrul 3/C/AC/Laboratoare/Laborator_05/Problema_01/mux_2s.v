module mux_2s #(
	parameter width = 4
)(
	input [width - 1: 0] d0, d1, d2, d3, //data input
	input [1:0] s, //selection input - 00 ->d0, 01 -> d1 etc
	output [width - 1 : 0] o
);

wire [width - 1 : 0] o_tmp;

//drivere tri-state

assign o_tmp =  (s == 2'b00) ? d0 :
		(s == 2'b01) ? d1 :
		(s == 2'b10) ? d2 :
		(s == 2'b11) ? d3 :
		{width{1'bz}}; // pentru cazuri neutilizate

assign o = o_tmp;

endmodule

module tb_mux_2s;

parameter width = 4;

reg [width - 1 : 0] d0, d1, d2, d3;
reg [1 : 0] s;
wire [width - 1 : 0] o;

integer i;

mux_2s #(.width(width)) uut (
	.d0(d0),
        .d1(d1),
        .d2(d2),
        .d3(d3),
        .s(s),
        .o(o)
); 

initial begin 
	d0 = 4'b0001;
	d1 = 4'b0010;
	d2 = 4'b0100;
	d3 = 4'b1000;

	$display("Testing mux");
	
	for (i = 0; i < 4; i = i + 1) begin
        	s = i[1:0]; 
        	#20;
        	$display("s=%b, o=%b (Expected: %b)", s, o, 
                                (s == 2'b00) ? d0 :
                                (s == 2'b01) ? d1 :
                                (s == 2'b10) ? d2 : d3);
    end

    $finish;
end

endmodule


