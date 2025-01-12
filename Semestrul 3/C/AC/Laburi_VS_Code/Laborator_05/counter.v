module counter #(
    parameter width = 8,
    parameter initValue = 8'hff
)(
    input clk,
	input rst_b, //asincron, activ la 0 -> aduce continutul la valoarea initiala
	input count_up, // sincron, activ la 1, incrementeaza continutul
	input clr, // sincron, activ la 1, seteaza continutul la valoarea iniyiala, are prioritate mai mare decat c_up
	output reg [width - 1 : 0] q
);

always @(posedge clk, negedge rst_b) begin
    if(!rst_b)
        q <= initValue;
    else if(clr)
        q <= initValue;
    else if(count_up)
        q <= q + 1;
end

endmodule

// t = 100 ns
// pulse rst = 5 ns -> 1

module counter_tb;
reg clk;
reg rst_b;
reg count_up;
reg clr;

wire [7:0] q;

counter #(.width(8), .initValue(8'hff)) instanta(
    .clk(clk),
    .rst_b(rst_b),
    .count_up(count_up),
    .clr(clr),
    .q(q)
);

// clk generation

localparam CLK_PERIOD = 100;
localparam RUNNING_CYCLES = 7;

initial begin
    //intai setam clk la 0 -> ne uitam pe desen de unde incepe
    clk = 0;

    repeat (2 * RUNNING_CYCLES) #(CLK_PERIOD / 2) clk = ~clk;
end

// rst_b generation

localparam RST_DURATION = 5;
initial begin
    rst_b = 0;
    #RST_DURATION rst_b = ~rst_b;
end

// acum construim celelalte semnale

initial begin
    $display("clk rst count_up clr q");
    $monitor("%b   %b    %b    %b   | %h", clk, rst_b, count_up, clr, q);
    //setam valorile initiale
    count_up = 1;
    clr = 0;
    // construim dupa care apare prima data
    #(2 * CLK_PERIOD) clr = 1;
    #(1 * CLK_PERIOD) clr = 0;
    #(1 * CLK_PERIOD) count_up = 0;
    #(1 * CLK_PERIOD) count_up = 1;
end



endmodule