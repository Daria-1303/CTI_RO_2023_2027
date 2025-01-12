module fsmm(
    input clk,
    input rst_b,
    input a,
    input b,
    output reg m,
    output reg n
);

//one hot
localparam S0_ST = 5'b10000;
localparam S1_ST = 5'b01000;
localparam S2_ST = 5'b00100;
localparam S3_ST = 5'b00010;
localparam S4_ST = 5'b00001;

// wire pentru stare si starea urmatoare
reg [4 : 0] state;
reg [4 : 0] next_state;

// logica de stare + iesire
always @(*) begin
    m = 0;
    n = 0;
    case(state)
        S0_ST : begin
            if(~a) begin
                next_state = S0_ST;
                m = 1'b0;
                n = 1'b0;
            end
            else if(a & b) begin
                next_state = S4_ST;
                m = 1'b1;
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
            if(~a & b) begin
                next_state = S3_ST;
                m = 1'b1;
                n = 1'b1;
            end
            else if(a & ~b) begin
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

// state machine
always @(posedge clk, negedge rst_b) begin
    if(!rst_b)
        state <= S0_ST;
    else
        state <= next_state;
end

endmodule

module fsmm_tb;

reg clk;
reg rst_b;
reg a;
reg b;
wire m;
wire n;

fsmm fsmm_inst(
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

// pentru a -> prima linie

initial begin
    a = 0;
    #(2 * CLK_PERIOD) a = 1;
    #(5 * CLK_PERIOD) a = 0;
end

// pentru b -> a doua linie

initial begin
    b = 0;
    #(CLK_PERIOD / 2) b = 1;
    #(CLK_PERIOD + CLK_PERIOD / 2) b = 0;
    #(CLK_PERIOD + CLK_PERIOD / 2) b = 1;
    #(CLK_PERIOD) b = 0;
    #(CLK_PERIOD) b = 1;
    #(2 * CLK_PERIOD) b = 0;
    #(CLK_PERIOD / 2) b = 1;
end

/*
// daca am mai fi avut un input sau daca am pune de ex pentru a -> linia 3:

initial begin
    a = 1;
    #(CLK_PERIOD / 2) a = 0;
    #(CLK_PERIOD) a = 1;
    #(CLK_PERIOD) a = 0;
    #(CLK_PERIOD) a = 1;
    #(CLK_PERIOD / 2) a = 0;
    #(CLK_PERIOD + CLK_PERIOD / 2) a = 1;
    #(CLK_PERIOD + CLK_PERIOD / 2) a = 0;
    #(CLK_PERIOD / 2) a = 1;
    #(CLK_PERIOD / 2) a = 0;
end
*/

endmodule