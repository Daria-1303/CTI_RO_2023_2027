module ex2(
    input a,
    input b,
    input clk,
    input rst_b,
    output reg m,
    output reg n
);

// Stari -> 5 -> 3 biti
// dar vrem codificare one cold
localparam S0_ST  =  5'b01111;  // 15
localparam S1_ST  =  5'b10111;  // 23
localparam S2_ST  =  5'b11011;  // 27
localparam S3_ST  =  5'b11101;  // 29
localparam S4_ST  =  5'b11110;  // 30

reg [4:0] state;
reg [4:0] next_state;

// facem logica de stare + iesire
always @(*) begin
    case(state)
        S0_ST : begin
            if(~a) begin
                next_state = S0_ST;
                m = 1'b0;
                n = 1'b0;
            end
            else if(a & b) begin
                next_state = S4_ST;
                m = 1;
                n = 1'b0;
            end
            else if(a & ~b) begin
                next_state = S1_ST;
                m = 1'b0;
                n = 1'b1;
            end
        end
        S1_ST : begin
            next_state = S2_ST;
            m = 1'b1;
            n = 1'b1;
        end
        S2_ST : begin 
            if(~a) begin 
                next_state = S4_ST;
                m = 1'b0;
                n = 1'b1;
            end
            else if(a) begin
                next_state = S3_ST;
                m = 1'b1;
                n = 1'b0;
            end
        end
        S3_ST : begin 
            if(a & ~b) begin
                next_state = S3_ST;
                m = 1'b0;
                n = 1'b0;
            end
            else if(~a & b) begin
                next_state = S3_ST;
                m = 1'b1;
                n = 1'b1;
            end
            else if(~a & ~b) begin
                next_state = S0_ST;
                m = 1'b1;
                n = 1'b1;
            end
            else if(a & b) begin
                next_state = S4_ST;
                m = 1'b0;
                n = 1'b0;
            end
        end
        S4_ST : begin
            if(~b) begin
                next_state = S4_ST;
                m = 1'b0;
                n = 1'b1;
            end
            else if(b) begin
                next_state = S1_ST;
                m = 1'b1;
                n = 1'b1;
            end
        end
    endcase

end

always @(posedge clk, negedge rst_b) begin
    if(!rst_b)
        state <= S0_ST;
    else
        state <= next_state;
end


endmodule

module ex2_tb;

reg clk;
reg rst_b;
reg a;
reg b;
wire m;
wire n;

ex2 ex2_inst(
    .a(a),
    .b(b),
    .clk(clk),
    .rst_b(rst_b),
    .m(m),
    .n(n)
);

localparam CLK_PERIOD = 100; 
localparam CLK_CYCLES = 8;

initial begin
    clk = 0;
    repeat (2*CLK_CYCLES) #(CLK_PERIOD/2) clk = ~clk;
end

localparam RST_PULSE=25;
initial begin
    rst_b = 0;
    #(RST_PULSE) rst_b = 1;
end

endmodule