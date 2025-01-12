module FAC(input x, y, cin, output s, cout);
    assign s = x ^ y ^ cin;
    assign cout = x & y | x & cin | y & cin;
endmodule

module MC(input x, y, z, cin, output s, cout);
    /* Modul recomandat */
    /* Nu este necesar pentru rezolvare */
endmodule

module mult_3bit(input[2:0] X, Y, output[5:0] P);
    /* Write Verilog code here */
endmodule

module mult_3bit_tb;
    reg[2:0] X, Y;
    wire[5:0] P;

    integer k;
    wire test_passed;
    mult_3bit uut (.X(X), .Y(Y), .P(P));
    assign test_passed = P == X*Y;
    initial begin
        $display("X\tY\t\tP\ttest_passed");
        $monitor("%d\t%d\t\t%d\t", X, Y, P, test_passed);
        for(k = 0; k < 64; k = k + 1) begin
            {X, Y} = k;
            #1;
        end
        $display("ACEST TESTBENCH NU NOTEAZA AUTOMAT!");
        $display("Puteti sa va verificati ca ati implementat corect folosindu-va de test_passed");
    end
endmodule
