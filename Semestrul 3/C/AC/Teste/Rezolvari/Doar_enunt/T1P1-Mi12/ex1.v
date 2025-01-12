/* Proiectati un modul e3_mult_9 ce primeste o intrare reprezentand o cifra in exces de 3 si retuneaza rezultatul inmultirii intrarii cu 9 in 2 iesiri, fiecare cu cate 4 biti: cifra zecilor si cifra unitatilor, ambele reprezentate in exces de 3 */
module e3_mult_9(input[3:0] e3_digit, output[3:0] e3_u, e3_d);
    /* Write verilog code here */
endmodule

module e3_mult_9_tb;

    reg[3:0] e3_digit;
    wire[3:0] act_e3_u, act_e3_d;
    reg[3:0] exp_e3_u, exp_e3_d;
    wire verdict_u, verdict_d;

    e3_mult_9 uut(.e3_digit(e3_digit), .e3_u(act_e3_u), .e3_d(act_e3_d));
    integer tests_total, tests_passed, nota;

    assign verdict_u = exp_e3_u === act_e3_u;
    assign verdict_d = exp_e3_d === act_e3_d;

    initial begin
        $display("e3_digit\t\texpected_e3_u\tactual_e3_u\tPassed(1)/Failed(0)\texpected_e3_d\tactual_e3_d\tPassed(1)/Failed(0)");
        $monitor("%8b\t\t%13b\t%11b\t%18d\t%13b\t%11b\t%18d", e3_digit, exp_e3_u, act_e3_u, verdict_u, exp_e3_d, act_e3_d, verdict_d);

        tests_total = 0;
        tests_passed = 0;

        e3_digit = 4'b0011;
        exp_e3_d = 4'b0011;
        exp_e3_u = 4'b0011;
        tests_total = tests_total + 2;
        #1;
        tests_passed = tests_passed + verdict_u + verdict_d;

        e3_digit = 4'b0100;
        exp_e3_d = 4'b0011;
        exp_e3_u = 4'b1100;
        tests_total = tests_total + 2;
        #1;
        tests_passed = tests_passed + verdict_u + verdict_d;

        e3_digit = 4'b0101;
        exp_e3_d = 4'b0100;
        exp_e3_u = 4'b1011;
        tests_total = tests_total + 2;
        #1;
        tests_passed = tests_passed + verdict_u + verdict_d;

        e3_digit = 4'b0110;
        exp_e3_d = 4'b0101;
        exp_e3_u = 4'b1010;
        tests_total = tests_total + 2;
        #1;
        tests_passed = tests_passed + verdict_u + verdict_d;

        e3_digit = 4'b0111;
        exp_e3_d = 4'b0110;
        exp_e3_u = 4'b1001;
        tests_total = tests_total + 2;
        #1;
        tests_passed = tests_passed + verdict_u + verdict_d;

        e3_digit = 4'b1000;
        exp_e3_d = 4'b0111;
        exp_e3_u = 4'b1000;
        tests_total = tests_total + 2;
        #1;
        tests_passed = tests_passed + verdict_u + verdict_d;

        e3_digit = 4'b1001;
        exp_e3_d = 4'b1000;
        exp_e3_u = 4'b0111;
        tests_total = tests_total + 2;
        #1;
        tests_passed = tests_passed + verdict_u + verdict_d;

        e3_digit = 4'b1010;
        exp_e3_d = 4'b1001;
        exp_e3_u = 4'b0110;
        tests_total = tests_total + 2;
        #1;
        tests_passed = tests_passed + verdict_u + verdict_d;

        e3_digit = 4'b1011;
        exp_e3_d = 4'b1010;
        exp_e3_u = 4'b0101;
        tests_total = tests_total + 2;
        #1;
        tests_passed = tests_passed + verdict_u + verdict_d;

        e3_digit = 4'b1100;
        exp_e3_d = 4'b1011;
        exp_e3_u = 4'b0100;
        tests_total = tests_total + 2;
        #1;
        tests_passed = tests_passed + verdict_u + verdict_d;

        $display("Passed / Total: %2d / %2d", tests_passed, tests_total);
        nota = tests_passed * 100 / tests_total * 2;
        $display("Nota: %1d.%02d", nota / 100, nota % 100);
    end
endmodule
