/* Construiti un modul parametrizabil (w - nr de biti ai intrarii, implicit 4, ign - valoare de ignorat, implicit 0). 
Modulul va face suma ultimelor 2 valori de la intrare "valide" (sincron, pe frontul crescator al semnalului de clk). 
O valoare la intrare este considerata "valida" daca este diferita de paramaetrul ign. 
Modulul are si functionalitate de reset sincron (prin intrarea rst_b), 
ce reseteaza atat iesirea cat si "valoarea precedenta de la intrare" pe 0. */
module sum_ignore #(/* define parameters */)
                    (input [/* fill */] d,
                     input clk, rst_b,
                     output reg[/* fill */] q);
    /* Write Verilog code here */
endmodule

module sum_ignore_tb_0(output reg[31:0] tests_total, tests_passed);

    reg[3:0] d;
    reg clk, rst_b;
    wire[4:0] act_q;
    reg[4:0] exp_q;
    wire verdict;

    sum_ignore uut (.d(d), .clk(clk), .rst_b(rst_b), .q(act_q));

    assign verdict = exp_q === act_q;
    initial begin
        clk = 0;
        repeat(31) #2 clk = ~clk;
    end

    initial begin
        $display("TESTBENCH 0: Valori implicite ale parametrilor");
        $display("Time\tclk\trst_b\td\t\texpected_q\tactual_q\tPassed(1)/Failed(0)");
        $monitor("%4t\t%3b\t%5b\t%2d\t\t%10d\t%8d\t%18d", $time, clk, rst_b, d, exp_q, act_q, verdict);
        tests_total = 0;
        tests_passed = 0;
        rst_b = 1;
        exp_q = 5'dX;

        #1;
        rst_b = 0;
        d = 4'd10;
        exp_q = 5'dX;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        rst_b = 0;
        d = 4'd1;
        exp_q = 5'd0;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;
        rst_b = 1;
        d = 4'd7;
        exp_q = 5'd7;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        d = 4'd0;
        exp_q = 5'd7;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        d = 4'd3;
        exp_q = 5'd10;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        d = 4'd0;
        exp_q = 5'd10;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        d = 4'd2;
        exp_q = 5'd5;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        d = 4'd9;
        exp_q = 5'd11;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        d = 4'd0;
        rst_b = 0;
        exp_q = 5'd0;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;
        
        d = 4'd15;
        rst_b = 1;
        exp_q = 5'd15;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3; 

        d = 4'd15;
        exp_q = 5'd30;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        d = 4'd0;
        exp_q = 5'd30;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        d = 4'd1;
        exp_q = 5'd16;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;
        
        #3;

        d = 4'd3;
        exp_q = 5'd4;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        d = 4'd4;
        exp_q = 5'd4;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        d = 4'd5;
        exp_q = 5'd4;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        d = 4'd6;
        exp_q = 5'd4;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        d = 4'd7;
        exp_q = 5'd10;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;
    
        #3;

        d = 4'd10;
        exp_q = 5'd17;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        d = 4'd10;
        exp_q = 5'd20;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        $display("Passed / Total: %2d / %2d", tests_passed, tests_total);
    end
endmodule

module sum_ignore_tb_1(output reg[31:0] tests_total, tests_passed);

    reg[3:0] d;
    reg clk, rst_b;
    wire[4:0] act_q;
    reg[4:0] exp_q;
    wire verdict;

    sum_ignore #(.ign(4'd14)) uut (.d(d), .clk(clk), .rst_b(rst_b), .q(act_q));

    assign verdict = exp_q === act_q;
    initial begin
        #100;
        clk = 0;
        repeat(31) #2 clk = ~clk;
    end

    initial begin
        #100;
        $display("TESTBENCH 1: Valoarea de ignorat modificata");
        $display("Time\tclk\trst_b\td\t\texpected_q\tactual_q\tPassed(1)/Failed(0)");
        $monitor("%4t\t%3b\t%5b\t%2d\t\t%10d\t%8d\t%18d", $time, clk, rst_b, d, exp_q, act_q, verdict);
        tests_total = 0;
        tests_passed = 0;
        rst_b = 1;
        exp_q = 5'dX;

        #1;
        rst_b = 0;
        d = 4'd10;
        exp_q = 5'dX;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        rst_b = 0;
        d = 4'd1;
        exp_q = 5'd0;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;
        rst_b = 1;
        d = 4'd7;
        exp_q = 5'd7;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        d = 4'd14;
        exp_q = 5'd7;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        d = 4'd3;
        exp_q = 5'd10;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        d = 4'd14;
        exp_q = 5'd10;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        d = 4'd0;
        exp_q = 5'd3;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        d = 4'd9;
        exp_q = 5'd9;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        d = 4'd14;
        rst_b = 0;
        exp_q = 5'd0;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;
        
        d = 4'd15;
        rst_b = 1;
        exp_q = 5'd15;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3; 

        d = 4'd15;
        exp_q = 5'd30;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        d = 4'd14;
        exp_q = 5'd30;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        d = 4'd1;
        exp_q = 5'd16;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;
        
        #3;

        d = 4'd3;
        exp_q = 5'd4;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        d = 4'd4;
        exp_q = 5'd4;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        d = 4'd5;
        exp_q = 5'd4;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        d = 4'd6;
        exp_q = 5'd4;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        d = 4'd7;
        exp_q = 5'd10;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;
    
        #3;

        d = 4'd0;
        exp_q = 5'd7;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        d = 4'd0;
        exp_q = 5'd0;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        $display("Passed / Total: %2d / %2d", tests_passed, tests_total);
    end
endmodule

module sum_ignore_tb_2(output reg[31:0] tests_total, tests_passed);

    reg[7:0] d;
    reg clk, rst_b;
    wire[8:0] act_q;
    reg[8:0] exp_q;
    wire verdict;

    sum_ignore #(.w(8)) uut (.d(d), .clk(clk), .rst_b(rst_b), .q(act_q));

    assign verdict = exp_q === act_q;
    initial begin
        #200;
        clk = 0;
        repeat(31) #2 clk = ~clk;
    end

    initial begin
        #200;
        $display("TESTBENCH 2: Modificat numarul de biti");
        $display("Time\tclk\trst_b\td\t\texpected_q\tactual_q\tPassed(1)/Failed(0)");
        $monitor("%4t\t%3b\t%5b\t%3d\t\t%10d\t%8d\t%18d", $time, clk, rst_b, d, exp_q, act_q, verdict);
        tests_total = 0;
        tests_passed = 0;
        rst_b = 1;
        exp_q = 9'dX;

        #1;
        rst_b = 0;
        d = 8'd10;
        exp_q = 9'dX;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        rst_b = 0;
        d = 8'd1;
        exp_q = 9'd0;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;
        rst_b = 1;
        d = 8'd7;
        exp_q = 9'd7;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        d = 8'd0;
        exp_q = 9'd7;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        d = 8'd3;
        exp_q = 9'd10;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        d = 8'd0;
        exp_q = 9'd10;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        d = 8'd2;
        exp_q = 9'd5;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        d = 8'd9;
        exp_q = 9'd11;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        d = 8'd0;
        rst_b = 0;
        exp_q = 9'd0;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;
        
        d = 8'd255;
        rst_b = 1;
        exp_q = 9'd255;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3; 

        d = 8'd255;
        exp_q = 9'd510;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        d = 8'd0;
        exp_q = 9'd510;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        d = 8'd1;
        exp_q = 9'd256;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;
        
        #3;

        d = 8'd3;
        exp_q = 9'd4;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        d = 8'd4;
        exp_q = 9'd4;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        d = 8'd5;
        exp_q = 9'd4;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        d = 8'd6;
        exp_q = 9'd4;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        d = 8'd7;
        exp_q = 9'd10;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;
    
        #3;

        d = 8'd10;
        exp_q = 9'd17;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        d = 8'd10;
        exp_q = 9'd20;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        $display("Passed / Total: %2d / %2d", tests_passed, tests_total);
    end
endmodule

module sum_ignore_tb;
    wire[31:0] tests_total_0, tests_total_1, tests_total_2, tests_passed_0, tests_passed_1, tests_passed_2;
    integer nota;

    sum_ignore_tb_0 tb_0(.tests_total(tests_total_0), .tests_passed(tests_passed_0));
    sum_ignore_tb_1 tb_1(.tests_total(tests_total_1), .tests_passed(tests_passed_1));
    sum_ignore_tb_2 tb_2(.tests_total(tests_total_2), .tests_passed(tests_passed_2));
    wire[31:0] tests_total_tb;
    wire[31:0] tests_passed_tb;
    assign tests_total_tb = tests_total_0 + tests_total_1  + tests_total_2;
    assign tests_passed_tb = tests_passed_0 + tests_passed_1 + tests_passed_2;
    initial begin
        #300;
        $display("All Passed / All Total: %3d / %3d", tests_passed_tb, tests_total_tb);
        nota = tests_passed_tb * 250 / tests_total_tb;
        $display("Nota: %1d.%02d", nota / 100, nota % 100);
    end
endmodule