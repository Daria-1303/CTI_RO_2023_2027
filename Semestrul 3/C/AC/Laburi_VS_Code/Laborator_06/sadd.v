module sadd(
    input clk,
    input rst_b,
    input x,
    input y,
    output reg out
);

// ne definim starile
localparam S0_ST = 1'd0;
localparam S1_ST = 1'd1;

reg state;
reg next_state;

// facem logica de trecere intre starile masinii de stari

always @(*) begin 
    case(state)
        S0_ST :
            if(x & y)
                next_state = S1_ST;
            else
                next_state = S0_ST;
        S1_ST :
            if(~x & (~y))
                next_state = S0_ST;
            else
                next_state = S1_ST;
    endcase
end

/*
// sau
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
*/

// facem logica de iesire

always @(*) begin
    out = 1'd0;

    case(state)
        S0_ST :
            if(x ^ y)
                out = 1'd1;
        S1_ST :
            if(x ~^ y)
                out = 1'd1;
    endcase
end

/*
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
*/

// facem logica de parcurgere a starilor
always @(*) begin
    if(!rst_b)
        state <= S0_ST;
    else
        state <= next_state;
end

endmodule

module sadd_tb;
  reg clk, rst_b, x, y;
  wire z;

  sadd inst0(
    .clk(clk),
    .rst_b(rst_b),
    .x(x),
    .y(y),
    .out(z)
);

  localparam CLK_PERIOD=100; 
  localparam CLK_CYCLES=5;
  initial begin
    clk = 0;
    repeat (2*CLK_CYCLES) #(CLK_PERIOD/2) clk = ~clk;
  end

  localparam RST_PULSE=25;
  initial begin
    rst_b = 0;
    #(RST_PULSE) rst_b = 1;
  end

  initial begin
    $display("clk | rst | x | y | out");
    $monitor(" %b  |  %b  | %b | %b | %b", clk, rst_b, x, y, z);
    {x, y} = 'b01;
    #(1*CLK_PERIOD) {x, y} = 'b11;
    #(1*CLK_PERIOD) {x, y} = 'b10;
    #(1*CLK_PERIOD) {x, y} = 'b00;
  end
endmodule