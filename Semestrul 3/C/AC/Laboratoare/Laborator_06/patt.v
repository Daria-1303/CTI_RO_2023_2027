module patt(
    input wire clk, rst_b, in,
    output reg out
);

parameter S0_ST = 3'd0;
parameter S1_ST = 3'd1;
parameter S2_ST = 3'd2;
parameter S3_ST = 3'd3;
parameter S4_ST = 3'd4;

reg[2:0] state, next_state;

// bloc 1 -> logica de stare

always @(*) begin
    case (state)
        S0_ST: next_state = in ? S1_ST : S0_ST;
        S1_ST: next_state = in ? S1_ST : S2_ST;
        S2_ST: next_state = in ? S3_ST : S0_ST;
        S3_ST: next_state = in ? S4_ST : S0_ST;
        S4_ST: next_state = in ? S1_ST : S0_ST;
    endcase
end

// bloc 2 -> logica de iesire

always @(*) begin
    out = 0;
    case (state)
        S3_ST: out = in;
        default: out = 0; 
    endcase
end


// bloc 3 -> automat

always @(posedge clk, negedge rst_b) begin
    if(!rst_b)
        state <= S0_ST;
    else
        state <= next_state;
end

endmodule


module patt_tb;

reg clk, rst_b, in;
wire out;

patt cut(
    .clk(clk),
    .rst_b(rst_b),
    .in(in),
    .out(out)
);

localparam CLK_PERIOD = 100, RUNNING_CYCLES = 7;
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
    $display("clk | rst | in | out");
    $monitor(" %b  |  %b  | %b  |  %b", clk, rst_b, in, out);
    in = 1;
    #CLK_PERIOD in = 0;
    #CLK_PERIOD in = 1;
    #(2 * CLK_PERIOD) in = 0;
    #CLK_PERIOD in = 1;
end

endmodule
