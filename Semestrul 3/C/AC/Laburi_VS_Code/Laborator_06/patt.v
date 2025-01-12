module patt(
    input clk,
    input rst_b,
    input i,
    output o
);

localparam S0_ST = 1'd0;
localparam S1_ST = 1'd1;
localparam S2_ST = 1'd2;
localparam S3_ST = 1'd3;
localparam S4_ST = 1'd4;

reg [2 : 0] state;
reg [2 : 0] next_state;

// daca avem moore

always @(*) begin
    case (state)
        S0_ST: begin
            if(i)
                next_state = S1_ST;
            else
                next_state = S0_ST;
        end
        S1_ST: begin
            if(i)
                next_state = S1_ST;
            else
                next_state = S2_ST;
        end
        S2_ST: begin
            if(i)
                next_state = S3_ST;
            else
                next_state = S0_ST;
        end
        S3_ST: begin
            if(i)
                next_state = S4_ST;
            else
                next_state = S2_ST;
        end
        S4_ST: begin
            if(i)
                next_state = S1_ST;
            else
                next_state = S2_ST;
        end
        default: next_state = S0_ST;
    endcase
end

//output ul va fi combinational
assign o = (state == S4_ST);


always @(posedge clk, negedge rst_b) begin
    if(!rst_b)
        state <= S0_ST;
    else
        state <= next_state;
end

endmodule

module patt_tb;
  reg clk, rst_b, i;
  wire o;
  patt inst0(.clk(clk), .rst_b(rst_b), .i(i), .o(o));

  localparam CLK_PERIOD=100, CLK_CYCLES=8, RST_PULSE=25;
  initial begin
    clk = 0;
    repeat (2*CLK_CYCLES) #(CLK_PERIOD/2) clk = 1 - clk;
  end

  initial begin
    rst_b = 0;
    #(RST_PULSE) rst_b = 1;
  end
  
  initial begin
                    i = 1;
    #(1*CLK_PERIOD) i = 0; 
    #(1*CLK_PERIOD) i = 1;
    #(2*CLK_PERIOD) i = 0;
    #(1*CLK_PERIOD) i = 1;
  end
endmodule