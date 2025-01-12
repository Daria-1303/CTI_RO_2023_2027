/* Construiti un modul ce realizeaza conversia unei cifre BCD in corespondentul ei in formatul 2-din-5 74210. */

module bcd_to_2outof5(input[3:0] bcd_in, output[4:0] _2outof5);
    /* Write verilog code here */
endmodule

module bcd_to_2outof5_tb;

    reg[3:0] bcd_in;
    reg[4:0] exp_2outof5;
    wire[4:0] act_2outof5;
    wire verdict;

    bcd_to_2outof5 uut(.bcd_in(bcd_in), ._2outof5(act_2outof5));
    integer tests_total, tests_passed, nota;

    assign verdict = exp_2outof5 === act_2outof5;

    initial begin
        $display("bcd_in\t\texpected_2outof5\tactual_2outof5\tPassed(1)/Failed(0)");
        $monitor("%6b\t\t%16b\t%14b\t%18b", bcd_in, exp_2outof5, act_2outof5, verdict);
        tests_total = 0;
        tests_passed = 0;

        bcd_in = 4'd0;
        exp_2outof5 = 5'b11000;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;
        
        bcd_in = 4'd1;
        exp_2outof5 = 5'b00011;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;
        
        bcd_in = 4'd2;
        exp_2outof5 = 5'b00101;
        tests_total = tests_total + 1; 
        #1;
        tests_passed = tests_passed + verdict;
        
        bcd_in = 4'd3;
        exp_2outof5 = 5'b00110;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;
        
        bcd_in = 4'd4;
        exp_2outof5 = 5'b01001;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;
        
        bcd_in = 4'd5;
        exp_2outof5 = 5'b01010;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;
        
        bcd_in = 4'd6;
        exp_2outof5 = 5'b01100;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;
        
        bcd_in = 4'd7;
        exp_2outof5 = 5'b10001;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;
        
        bcd_in = 4'd8;
        exp_2outof5 = 5'b10010;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;
        
        bcd_in = 4'd9;
        exp_2outof5 = 5'b10100;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;
        
        $display("Passed / Total: %2d / %2d", tests_passed, tests_total);
        nota = tests_passed * 100 / tests_total * 2;
        $display("Nota: %1d.%02d", nota / 100, nota % 100);
    end
endmodule