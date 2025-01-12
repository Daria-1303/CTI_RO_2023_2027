module d_ff(
    input clk,
    input rst_b,
    input set_b,
    input d,
    output reg q
);

always @(posedge clk, negedge rst_b, negedge set_b) begin
    if(!set_b) begin
        q <= 1'b1;
    end
    else if(!rst_b) begin
        q <= 1'b0;
    end
    else begin
        q <= d;
    end
end

endmodule