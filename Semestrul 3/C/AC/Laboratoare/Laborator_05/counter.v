module counter #(
	parameter width = 8,
	parameter initValue = 8'hff
)(
	input clk,
	input rst_b, //asincron, activ la 0 -> aduce continutul la valoarea initiala
	input c_up, // sincron, activ la 1, incrementeaza continutul
	input clr, // sincron, activ la 1, seteaza continutul la valoarea iniyiala, are prioritate mai mare decat c_up
	output reg [width - 1 : 0] q
);


//blocul asincron

always @(posedge clk or negedge rst_b) begin
	if(!rst_b) 
		q<= initValue;  //reset la valoarea initiala daca rst_b == 0
	else if(clr)
		q <= initValue; //reset la valoarea initiala daca clr este 1, cu prioritate mai mare decat c_up
	else if(c_up)
		q <= q + 1;
			
end

endmodule

`timescale 1ns/1ps;

module tb_counter;

	parameter width = 8;
	parameter initValue = 8'hff;
	
	reg clk, rst_b, c_up, clr;
	wire [width - 1 : 0] q;

counter #(
	.width(width),
        .initValue(initValue)
) uut (
        .clk(clk),
        .rst_b(rst_b),
        .c_up(c_up),
        .clr(clr),
        .q(q)
    );

localparam CLK_PERIOD = 100;
	localparam RUNNING_CYCLES = 7;
	initial begin
		clk = 1'b0;
		repeat (2 * RUNNING_CYCLES) #(CLK_PERIOD / 2) clk = ~clk;
	end

	localparam RST_DURATION = 5;
	initial begin
		rst_b = 1'b0;
		#RST_DURATION rst_b = 1'b1;
	end

	initial begin
		$display("Time\tclk\trst_b\tc_up\tclr\tq");
		$monitor("%0t\t%b\t%b\t%b\t%b\t%0d", $time, clk, rst_b, c_up, clr, q);
		clr = 1'b0;
		c_up = 1'b1;
		#200
		clr = 1'b1;
		#100
		clr = 1'b0;
		#100
		c_up = 1'b0;
		#100
		c_up = 1'b1;
	end

	
endmodule
