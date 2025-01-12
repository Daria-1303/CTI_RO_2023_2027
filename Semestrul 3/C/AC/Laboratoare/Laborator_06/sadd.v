module sadd(
	input clk, rst_b,
	input x, y,
	output reg out
);

//avem 2 stari codificate pe un bit
localparam S0_ST = 1'b0; 
localparam S1_ST = 1'b1;

reg state, next_state;

//logica de stare

always @(*) begin
	case(state)
		S0_ST : case({x, y})
			2'b00 : next_state = S0_ST;
			2'b01 : next_state = S0_ST;
			2'b10 : next_state = S0_ST;
			2'b11 : next_state = S1_ST;
		endcase
		
		S1_ST : case({x, y})
			2'b00 : next_state = S0_ST;
			2'b01 : next_state = S1_ST;
			2'b10 : next_state = S1_ST;
			2'b11 : next_state = S1_ST;
		endcase
	endcase
end

//logica de iesire

always @(*) begin
	out = 0;
	
	case(state)
		S0_ST : case({x, y})
			2'b00 : out = 1'b0;
			2'b01 : out = 1'b1;
			2'b10 : out = 1'b1;
			2'b11 : out = 1'b0;
		endcase

		S1_ST : case({x, y})
			2'b00 : out = 1'b1;
			2'b01 : out = 1'b0;
			2'b10 : out = 1'b0;
			2'b11 : out = 1'b1;
		endcase
	endcase
end

// automat

always @(posedge clk, negedge rst_b) begin
	if(!rst_b)
		state <= S0_ST;
	else
		state <= next_state;
end

endmodule

module sadd_tb;

reg clk, rst_b, x, y;
wire out;

sadd cut(
    .clk(clk),
    .rst_b(rst_b),
    .x(x),
    .y(y),
    .out(out)
);

localparam CLK_PERIOD = 100, RUNNING_CYCLES = 4;
initial begin 
    clk = 0;
    repeat (2 * RUNNING_CYCLES) #(CLK_PERIOD / 2) clk = ~clk;
end
// generarea semnalului de reset se face, prin codul de mai jos; durata de activare a semnalului
// de reset este specificat prin constanta RST_DURATION
localparam RST_DURATION = 25;
initial begin 
    rst_b = 0;
    #RST_DURATION rst_b = ~rst_b;
end
// celelalte intrari (sincrone) pot fi generate in blocuri initial separate sau pot fi generate
// impreuna intr-un singur bloc initial ca mai jos
initial begin
    $display("clk | rst | x | y | out");
    $monitor(" %b  |  %b  | %b | %b | %b", clk, rst_b, x, y, out);
    x = 0; y = 1;
    #CLK_PERIOD x = 1;
    #CLK_PERIOD y = 0;
    #CLK_PERIOD x = 0;
end

endmodule
