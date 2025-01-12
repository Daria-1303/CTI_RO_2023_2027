module cntr #(
    parameter width = 8
)(
    input clk,
    input rst_b,
    input count_up,
    input clr,
    output reg [width-1:0] q
);

always @ (posedge clk, negedge rst_b) begin
    if (!rst_b) 
        q <= 0;
    else if (count_up) 
        q <= q + 1;
    else if (clr) 
        q <= 0;
end
endmodule