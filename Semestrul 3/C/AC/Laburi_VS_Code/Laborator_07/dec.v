module dec #(
    parameter width = 2
)(
    input [width-1:0] s,
    input e,
    output reg [2**width-1:0] o     // 2**width = 2^2 = 4
);

always @(*) begin
    o = 0;
    if(e)
        o[s] = 1;
end

endmodule