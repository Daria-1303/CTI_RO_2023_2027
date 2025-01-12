module ex1(
    input clk,
    input rst_b,
    input a,
    input [2:0] idx,
    output reg m,
    output reg n,
    output reg t
);

localparam S0_ST = 4'b0000;
localparam S2_ST = 4'b0010;
localparam S3_ST = 4'b0011;
localparam S5_ST = 4'b0101;
localparam S6_ST = 4'b0110;
localparam S9_ST = 4'b1001;

reg [3 : 0] state;
reg [3 : 0] next_state;

//logica de stare + iesiri
always @(*) begin
    m = 0;
    n = 0;
    t = 0;
    case(state)
        S0_ST : begin
            m = 1;
            next_state <= S9_ST;
        end
        S2_ST : begin
            if(idx == 3) 
                next_state <= S0_ST;
            else if(idx != 3)
                next_state <= S2_ST;
        end
        S3_ST : begin
            t = 1;
            if(idx == 0) 
                next_state <= S2_ST;
            else if(idx == 1)
                next_state <= S5_ST;
            else if(idx == 2)
                next_state <= S6_ST;
            else if(idx == 3)
                next_state <= S3_ST;
        end
        S5_ST : begin
            t = 1;
            if(idx == 0)
                next_state <= S3_ST;
            else if(idx == 1)
                next_state <= S5_ST;
            else if(idx > 1)
                next_state <= S2_ST;
        end
        S6_ST : begin 
            m = 1;
            n = 1;
            if(a)
                next_state <= S5_ST;
            else if(~a)
                next_state <= S9_ST;
        end
        S9_ST : begin 
            n = 1;
            if(a)
                next_state <= S3_ST;
            else if(~a)
                next_state <= S6_ST;
        end

    endcase
end

always @(posedge clk or negedge rst_b) begin
    if (!rst_b) begin
        state <= S0_ST;
    end else begin
        state <= next_state;
    end
end

endmodule

// gpt ca mi e lene
module ex1_tb;

    reg clk;
    reg rst_b;
    reg a;
    reg [2:0] idx;
    wire m, n, t;

    // Instantiate the FSM module
    ex1 ex1_inst(
        .clk(clk),
        .rst_b(rst_b),
        .a(a),
        .idx(idx),
        .m(m),
        .n(n),
        .t(t)
    );

    // Clock generation
    localparam CLK_PERIOD = 100;
    localparam CLK_CYCLES = 10;
    initial begin
        clk = 0;
        repeat (2 * CLK_CYCLES) #(CLK_PERIOD / 2) clk = ~clk;
    end

    // Reset generation
    localparam RST_PULSE = 25;
    initial begin
        rst_b = 0; // Assert reset
        #(RST_PULSE) rst_b = 1; // Deassert reset
    end

    // Stimulus generation
    initial begin
        $display("clk | rst | a | idx | m | n | t | state");
        $monitor("%b | %b | %b | %b | %b | %b | %b | %d", clk, rst_b, a, idx, m, n, t, ex1_inst.state);

        // Initialize inputs
        a = 0;
        idx = 3'b000;

        // Apply test sequences
        #(CLK_PERIOD) idx = 3;       // Transition from S0 to S9
        #(CLK_PERIOD) a = 1;                // Transition from S9 to S6
        #(CLK_PERIOD) a = 1;               // Transition from  S6 to S5
        #(CLK_PERIOD) idx = 0;            // Transition from  S5 to S3
        #(CLK_PERIOD) idx = 0;           // Transition from  S3 to S2
        #(CLK_PERIOD) a = 1;          // Transition from S2 to S2
        #(CLK_PERIOD) idx = 3;        // Transition within S2 to s0

        // End simulation
        #(CLK_PERIOD * 2) $stop;
    end

endmodule


