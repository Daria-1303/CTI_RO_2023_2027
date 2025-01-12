module regfl(
    input clk,
    input rst_b,
    input we,
    input [2 : 0] s,
    input [63 : 0] d,
    output [511 : 0] q
);

// iesirea decoderului
wire [7 : 0] decoder_out; 

//instantiem modulul decoder
dec #(.width(3)) instanta_dec (
    .s(s),
    .e(we),
    .o(decoder_out)
);

// generam cei 8 registrii

generate 
        genvar i;

        for(i = 0; i < 8; i = i + 1) begin : vect
            rgst #(.width(64)) instanta_rgst (
                .clk(clk),
                .rst_b(rst_b),
                .clr(1'b0),     
                .d(d),
                .ld(decoder_out[i]),  
                .q(q[511 - i * 64 : 448 - i * 64])
            );
        end
endgenerate

/*
// ei pot fi instantiati si individual

rgst #(.width(64)) instanta_rgst0 (
    .clk(clk),
    .rst_b(rst_b),
    .clr(1'b0),
    .d(d),
    .ld(dout[0]),
    .q(q[511:448])
);

rgst #(.width(64)) instanta_rgst1 (
    .clk(clk),
    .rst_b(rst_b),
    .clr(1'b0),
    .d(d),
    .ld(dout[1]),
    .q(q[447:384])
);

// si tot asa pana la 8
*/

endmodule

module rgst #(
	parameter width=8
)(
	input clk, 
    input rst_b, 
    input ld, 
    input clr,
	input [width-1:0] d,
	output reg [width-1:0] q
);
always @ (posedge clk, negedge rst_b)
	if (!rst_b)			
        q <= 0;
	else if (clr)			
        q <= 0;
	else if (ld)			
        q <= d;
endmodule

module dec #(
    parameter width = 2
)(
    input [width-1:0] s,
    input e,
    output reg [2**width-1:0] o     // 2^2 = 4
);

always @(*) begin
    o = 0;
    if(e)
        o[s] = 1;
end

endmodule

module regfl_tb;

reg clk;
reg rst_b;
reg we;
reg [2 : 0] s;
reg [63 : 0] d;

wire [511 : 0] q;

regfl instanta_regfl (
    .clk(clk),
    .rst_b(rst_b),
    .we(we),
    .s(s),
    .d(d),
    .q(q)
);

localparam CLK_PERIOD = 100;
localparam CLK_CYCLES = 8;

initial begin 
    clk = 0;
    repeat (2 * CLK_CYCLES) # (CLK_PERIOD / 2) clk = ~clk;
end


localparam RST_PULSE = 25;

initial begin
    rst_b = 0;
    #RST_PULSE rst_b = 1;
end

initial begin
    $monitor("d = %d | q = %d", d, q);
    we = 1;

    s = 3'b000; 

    d = 64'd1;

    #(2 * CLK_PERIOD) s = 3'b001; 

    d = 64'd2;
end



endmodule