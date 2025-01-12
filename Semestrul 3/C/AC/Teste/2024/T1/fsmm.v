module fsmm(
    input clk,
    input rst_b,
    input A6,
    input X3,
    input I3
    output reg out,
    output reg [3 : 0] state
);

// codificare one hot -> 1 bit de 1 restul de 0
localparam S0_ST = 4'b1000;
localparam S1_ST = 4'b0100;
localparam S2_ST = 4'b0010;'
localparam S3_ST = 4'b0001;

wire [3 : 0] next_state;

// LOGICA DE STARE
always @(*) begin
    case(state)
        S0_ST : begin
            if((A6 & X3 & I3) | X3) begin //conditia din paranteza poate sa fie doar if(X3)
                next_state <= S0_ST;
            end
            else if((I3 & A6) | (I3 & X3)) begin // sau I3 & (A6 | X3)
                next_state <= S1_ST;
            end
            else if((I3 & X3) | (A6 & X3 & I3)) begin // sau I3 & X3
                next_state <= S2_ST;
            end
            else if(X3) begin  // e ambiguu, nu se va putea trece din s0 in s3
                next_state <= S3_ST;
            end
        end
        S1_ST : begin
            if(A6 & I3) begin
                next_state <= S2_ST;
            end
            else begin
                next_state <= S0_ST;
            end
        end
        S2_ST : begin
            if((I3 & A6) | X3) begin
                next_state <= S2_ST;
            end
        end
        S3_ST : begin
            if((X3 & A6) | (A6 & I3)) begin // sau A6 & (X3 | I3)
                next_state <= S2_ST;
            end
        end
    endcase
end

// LOGICA DE IESIRE

always @(*) begin
    case(state)
        S0_ST : out = 1;
        S1_ST : out = 0;
        S2_ST : out = 0;
        S3_ST : out = 0;
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
reg A6, X3, I3;
wire [3:0] state;
wire out;

fsmm uut (
    .clk(clk),
    .rst_b(rst_b),
    .A6(A6),
    .X3(X3),
    .I3(I3),
    .state(state),
    .out(out)
);

localparam CLK_PERIOD = 100;
localparam CLK_CYCLES = 11;

initial begin
    clk = 0;

    repeat (2 * CLK_CYCLES) # (CLK_PERIOD / 2) clk = ~clk;
end

localparam RST_PULSE = 100;

initial begin
    rst_b = 0;
    #RST_PULSE rst_b = 1;
end

// pt A6
    initial begin
        A6 = 0;
        #(CLK_PERIOD) A6 = 1;
        #(CLK_PERIOD) A6 = 0;
        #(2 * CLK_PERIOD) A6 = 1;
        #(5 * CLK_PERIOD) A6 = 0;
    end

    // pt X3
    initial begin
        X3 = 1;
        #(CLK_PERIOD) X3 = 0;
        #(CLK_PERIOD + CLK_PERIOD / 2) X3 = 1;
        #(CLK_PERIOD + CLK_PERIOD / 2) X3 = 0;
        #(CLK_PERIOD + CLK_PERIOD / 2) X3 = 1;
        #(CLK_PERIOD) X3 = 0;
        #(CLK_PERIOD) X3 = 1;
        #(2 * CLK_PERIOD) X3 = 0;
        #(CLK_PERIOD / 2) X3 = 1;
    end

    // pt I3

    initial begin
        I3 = 1;
        #(CLK_PERIOD / 2) I3 = 0;
        #(CLK_PERIOD) I3 = 1;
        #(CLK_PERIOD) I3 = 0;
        #(CLK_PERIOD) I3 = 1;
        #(CLK_PERIOD) I3 = 0;
        #(CLK_PERIOD) I3 = 1;
        #(CLK_PERIOD / 2) I3 = 0;
        #(CLK_PERIOD + CLK_PERIOD / 2) I3 = 1;
        #(CLK_PERIOD + CLK_PERIOD / 2) I3 = 0;
        #(CLK_PERIOD / 2) I3 = 1;
        #(CLK_PERIOD / 2) I3 = 0;
    end

    initial begin
        $display("Time=%0d, clk=%b, rst_b=%b, A6=%b, X3=%b, I3=%b, state=%b, out = %b", $time, clk, rst_b, A6, X3, I3, state, out);
        $monitor("Time=%0d, clk=%b, rst_b=%b, A6=%b, X3=%b, I3=%b, state=%b, out = %b", $time, clk, rst_b, A6, X3, I3, state, out);
    end
endmodule