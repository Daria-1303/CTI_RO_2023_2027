module ex3 #(
    parameter w = 4,
    parameter rst_val = 0
)(
    input clk,
    input rst_b, //activ la 0
    input sh,   //activ la 1, shiftare dreapta
    input ld,   //activ la 1, sincrona; incarcare
    input sh_type, // 0 -> shiftare logica, 1 -> shiftare aritmetica(in C2)
    input [w - 1 : 0] data_in,
    output reg [w - 1 : 0] data_out
);

always @(posedge clk, negedge rst_b) begin
    if(!rst_b)
        data_out <= rst_val;
    else if(ld)
        data_out <= data_in;    // incarcare sincrona
    else if(sh)     // daca facem shift, trebuie sa verificam ce tip de shiftare facem
        case(sh_type)
            1'b0: 
                data_out <= {1'b0, data_out[w - 1 : 1]}; // shiftare logica
            1'b1: 
                data_out <= {data_out[w - 1], data_out[w - 1 : 1]}; // shiftare aritmetica
        endcase
end 

endmodule

module ex3_tb;

reg clk;
reg rst_b;
reg sh;
reg ld;
reg sh_type;
reg [3:0] data_in;
wire [3:0] data_out;

ex3 #(
    .w(4),
    .rst_val(0)
) ex3_instanta(
    .clk(clk),
    .rst_b(rst_b),
    .sh(sh),
    .ld(ld),
    .sh_type(sh_type),
    .data_in(data_in),
    .data_out(data_out)
);

localparam CLK_PERIOD = 100;
localparam CLK_CYCLES = 10;

initial begin
    clk = 0;
    repeat (2 * CLK_CYCLES) #(CLK_PERIOD / 2) clk = ~clk;
end

localparam RST_DURATION = 25;

initial begin
    rst_b = 0;
    #(RST_DURATION) rst_b = 1;
end

initial begin
    $display("sh sh_type data_in data_out");
    $monitor("%b %b     %b %b", sh, sh_type, data_in, data_out);
    // load
    data_in = 4'b1010;
    ld = 1'b1;
    sh = 1'b0;
    sh_type = 1'b0;
    #CLK_PERIOD;

    // shiftare logica
    data_in = 4'b1010;
    ld = 1'b0;
    sh = 1'b1;
    sh_type = 1'b0;
    #CLK_PERIOD;

    // output should be 0010

    // shfitare aritmetica 
    data_in = 4'b1010;
    ld = 1'b1;
    sh = 1'b1;
    sh_type = 1'b1;
    #CLK_PERIOD;

    // output should be 1101

    data_in = 4'b1010;
    ld = 1'b0;
    sh = 1'b1;
    sh_type = 1'b1;
    #CLK_PERIOD;

    // output should be 1111
end

endmodule