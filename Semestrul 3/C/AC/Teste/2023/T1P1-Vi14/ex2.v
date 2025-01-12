/* Construiti un modul numit sum_last4, avand 2 intrari pe 1 bit (clk si reset), o intrare pe 8 biti in si o iesire out.
Modulul va insuma ultimele 4 valori ale lui in, receptionate pe frontul crescator al semnalului de clk,
considerand la inceput ultimele 3 valori primite ca fiind 0.
Pe nivelul ridicat a semnalului de reset, modulul va reseta suma, inclusiv ultimele valori primite pe 0.*/
module sum_last4(input[7:0] in, 
                input reset,
                input clk,
                output reg[/* fill */] out);

    /* Write Verilog code here */

endmodule

module sum_last4_tb;

    reg[7:0] in;
    reg reset, clk;
    
    wire[/* fill */] act_out;
    reg[/* fill */] exp_out;

    wire verdict;
    sum_last4 uut(.in(in), .reset(reset), .clk(clk), .out(act_out));

    integer tests_total, tests_passed, nota;

    assign verdict = exp_out === act_out;

    initial begin
        clk = 1;
        repeat(66) #1 clk = ~clk;
    end

    initial begin
        $display("in\treset\t\texpected_out\tactual_out\tPassed(1)/Failed(0)");
        $monitor("%3d\t%5b\t\t%d\t\t%d\t%18b", in, reset, exp_out, act_out, verdict);
        
        tests_total = 0;
        tests_passed = 0;
    
        in = 8'd0;
        reset = 0;
        exp_out = 0;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;
        
        in = 8'd100;
        exp_out = 100;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;
    
        in = 8'd100;
        exp_out = 200;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        in = 8'd0;
        exp_out = 200;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        in = 8'd50;
        exp_out = 250;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        in = 8'd50;
        exp_out = 200;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        in = 8'd250;
        exp_out = 350;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        in = 8'd100;
        reset = 1;
        exp_out = 0;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        in = 8'd10;
        reset = 0;
        exp_out = 10;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        in = 8'd11;
        exp_out = 21;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        in = 8'd12;
        exp_out = 33;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        in = 8'd13;
        reset = 1;
        exp_out = 0;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        in = 8'd20;
        reset = 0;
        exp_out = 20;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        in = 8'd10;
        reset = 0;
        exp_out = 30;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        in = 8'd40;
        reset = 1;
        exp_out = 0;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        in = 8'd0;
        reset = 0;
        exp_out = 0;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        in = 8'd0;
        reset = 0;
        exp_out = 0;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        in = 8'd0;
        reset = 0;
        exp_out = 0;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        in = 8'd255;
        reset = 0;
        exp_out = 255;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        in = 8'd255;
        exp_out = 510;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        in = 8'd255;
        exp_out = 765;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        in = 8'd255;
        exp_out = 1020;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        in = 8'd0;
        exp_out = 765;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        in = 8'd0;
        exp_out = 510;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        in = 8'd0;
        exp_out = 255;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        in = 8'd0;
        exp_out = 0;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        in = 8'd1;
        exp_out = 1;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        in = 8'd2;
        reset = 1;
        exp_out = 0;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        in = 8'd3;
        reset = 1;
        exp_out = 0;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        in = 8'd4;
        reset = 1;
        exp_out = 0;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        in = 8'd100;
        reset = 0;
        exp_out = 100;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;
    
        in = 8'd100;
        exp_out = 200;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        in = 8'd0;
        exp_out = 200;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        in = 8'd50;
        exp_out = 250;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        $display("Passed / Total: %2d / %2d", tests_passed, tests_total);
        nota = tests_passed * 100 / tests_total * 2;
        $display("Nota: %1d.%02d", nota / 100, nota % 100);
    end
endmodule