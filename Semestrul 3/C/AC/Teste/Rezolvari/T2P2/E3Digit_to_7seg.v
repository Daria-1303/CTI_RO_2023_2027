module E3Digit_to_7seg(
    input [3:0] digit,    // 4-bit E3 digit input
    output reg [7:0] seg  // 7-segment output: DP_A_B_C_D_E_F_G
);

    always @(*) begin
        case (digit)
            4'b0000: seg = 8'b10000001; // 0
            4'b0001: seg = 8'b11001111; // 1
            4'b0010: seg = 8'b10010010; // 2
            4'b0011: seg = 8'b10000110; // 3
            4'b0100: seg = 8'b11001100; // 4
            4'b0101: seg = 8'b10100100; // 5
            4'b0110: seg = 8'b10100000; // 6
            4'b0111: seg = 8'b10001111; // 7
            4'b1000: seg = 8'b10000000; // 8
            4'b1001: seg = 8'b10000100; // 9
            default: seg = 8'b11111110; // Invalid input, display a line (G segment ON)
        endcase
    end

endmodule

module tb_E3Digit_to_7seg();

    reg [3:0] digit;
    wire [7:0] seg;

    E3Digit_to_7seg uut (
        .digit(digit),
        .seg(seg)
    );

    initial begin
        $display("Digit | Segment Output (DP_A_B_C_D_E_F_G)");
        $monitor("%b    | %b", digit, seg);

        digit = 4'b0000; #10; // Test 0
        digit = 4'b0001; #10; // Test 1
        digit = 4'b0010; #10; // Test 2
        digit = 4'b0011; #10; // Test 3
        digit = 4'b0100; #10; // Test 4
        digit = 4'b0101; #10; // Test 5
        digit = 4'b0110; #10; // Test 6
        digit = 4'b0111; #10; // Test 7
        digit = 4'b1000; #10; // Test 8
        digit = 4'b1001; #10; // Test 9
        digit = 4'b1111; #10; // Test invalid input

        $stop;
    end

endmodule
