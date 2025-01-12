module sum_1digit_BCD(
    input [3:0] nr1,
    input [3:0] nr2,
    input carry_in,
    output reg [3:0] sum,
    output reg carry_out
);

wire [4:0] suma_temp;

assign suma_temp = nr1 + nr2 + carry_in;

always @(*) begin
    if (suma_temp > 9) begin
        carry_out = 1;
        sum = suma_temp - 10; // Adjust sum for BCD
    end else begin
        carry_out = 0;
        sum = suma_temp[3:0]; // Pass sum as-is
    end
end

endmodule
