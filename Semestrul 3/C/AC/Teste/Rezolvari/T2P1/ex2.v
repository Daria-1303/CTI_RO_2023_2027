module ex2 #(
    parameter nr_digits = 1,           // Number of digits
    parameter width = (4 * nr_digits) // Width of the input
)(
    input [width-1:0] nr1,
    input [width-1:0] nr2,
    output [width-1:0] sum,
    output carry_out
);

wire [nr_digits : 0] carry;
wire [width - 1 : 0] suma_temp;

assign carry[0] = 1'b0; // Initial carry is 0

generate
    genvar i;
    for(i = 0; i < nr_digits; i = i + 1) begin : vect
        sum_1digit_BCD instanta(
            .nr1(nr1[(4 * i + 3) : (4 * i)]),      // Slice input for current digit
            .nr2(nr2[(4 * i + 3) : (4 * i)]),
            .carry_in(carry[i]),                   // Carry-in from previous digit
            .sum(suma_temp[(4 * i + 3) : (4 * i)]),// Sum for current digit
            .carry_out(carry[i+1])                 // Carry-out to next digit
        );
    end
endgenerate

assign carry_out = carry[nr_digits]; // Final carry-out
assign sum = suma_temp;              // Assign aggregated sum

endmodule


module ex2_tb;

localparam nr_digits = 2;

reg [4 * nr_digits - 1 : 0] nr1;
reg [4 * nr_digits - 1 : 0] nr2;
wire [4 * nr_digits - 1 : 0] sum;
wire carry_out;

ex2 #(
    .nr_digits(nr_digits)
) ex2_inst (
    .nr1(nr1),
    .nr2(nr2),
    .sum(sum),
    .carry_out(carry_out)
);

integer i;

initial begin
    $display("nr1            nr2            sum            carry_out");
    $display("------------------------------------------------------");
    $monitor("%h    %h    %h      %b", nr1, nr2, sum, carry_out);

    repeat(10) begin

        for (i = 0; i < nr_digits; i = i + 1) begin
            nr1[(4 * i) +: 4] = $urandom_range(0, 9); // Generate random BCD digit for each slice
            nr2[(4 * i) +: 4] = $urandom_range(0, 9); // Same for nr2
        end

        #30; 
    end
end


endmodule
