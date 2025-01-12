/* Folosindu-va de sumatoare pe 4 biti RCA, consturiti urmatoarea arhitectura de inmultitor */
module RCA(input[3:0] A, B, input ci, output[3:0] s, output co);
    assign {s, co} = A + B + ci;
endmodule

module mult_4bit(input[3:0] X, Y, output[7:0] P);
    /* Write Verilog code here */
endmodule

module mult_4bit_tb;
    reg[3:0] X, Y;
    wire[7:0] P;

    integer k;
    wire test_passed;
    mult_4bit uut (.X(X), .Y(Y), .P(P));
    assign test_passed = P == X*Y;
    initial begin
        $display("X\tY\t\tP\ttest_passed");
        $monitor("%d\t%d\t\t%d\t", X, Y, P, test_passed);
        for(k = 0; k < 256; k = k + 1) begin
            {X, Y} = k;
            #1;
        end
        $display("ACEST TESTBENCH NU NOTEAZA AUTOMAT!");
        $display("Puteti sa va verificati ca ati implementat corect folosindu-va de test_passed");
    end
endmodule
