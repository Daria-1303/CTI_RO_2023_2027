/* Construiti un modul ce inmulteste ultimele 2 valori primite la intrarea pe w biti (parametru, implicit 4), sincron, la fiecare front crescator al semnalului de clk.
Modulul va ignora valori, initial specificat prin parametrul ign, implicit 0. 
Modulul va avea incarcare asincrona, prin intermediul intrarii ld, activa la 1, moment in care, valoarea de la intrare va fi noua valoare de ignorat.
Modulul va avea reset asincron, prin intermediul intrarii rst_b, activa la 0. 
La reset, modulul va reseta valoarea de la iesire si ultima valoare primita pe 0, iar valoare de ignorat inapoi la valoarea parametrului ign. */
module mult_last2#(parameter w=4, parameter ign=0)(input [w-1:0] in, input clk, ld, rst_b, output reg[2*w-1:0] out);
    /* Write Verilog code here */

endmodule

module mult_last2_tb0(output reg[31:0] tests_total, tests_passed);
    reg[3:0] in;
    reg clk, ld, rst_b;
    wire[7:0] act_out;
    reg[7:0] exp_out;
    wire verdict;

    mult_last2 uut(.in(in), .clk(clk), .ld(ld), .rst_b(rst_b), .out(act_out));

    assign verdict = exp_out === act_out;
    initial begin
        clk = 0;
        repeat(34) #2 clk = ~clk;
    end

    initial begin
        $display("TESTBENCH 0: Valori implicite ale parametrilor");
        $display("Time\tclk\tld\trst_b\tin\t\texpected_out\tactual_out\tPassed(1)/Failed(0)");
        $monitor("%4t\t%3b\t%2b\t%5b\t%2d\t\t%12d\t%10d\t%18b", $time, clk, ld, rst_b, in, exp_out, act_out, verdict);
        tests_total = 0;
        tests_passed = 0;
        ld = 0;
        rst_b = 1;
        in = 4'd5;
        exp_out = 8'd0;

        #1;
        tests_total = tests_total + 1;
        tests_passed = tests_passed + verdict;

        #1;
        in = 4'd10;
        exp_out = 8'd0;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;
        
        #2;
        in = 4'd5;
        exp_out = 8'd50;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;
        #3;

        in = 4'd0;
        exp_out = 8'd50;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        in = 4'd5;
        exp_out = 8'd25;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        in = 4'd2;
        exp_out = 8'd10;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #2;

        in = 4'd10;
        ld = 1;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;


        in = 4'd5;
        ld = 0;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #1;
        in = 4'd10;
        exp_out = 8'd10;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #1;
        in = 4'd13;
        exp_out = 8'd65;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        in = 4'd13;
        exp_out = 8'd169;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        in = 4'd15;
        exp_out = 8'd195;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        in = 4'd15;
        exp_out = 8'd225;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        in = 4'd0;
        exp_out = 8'd0;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        in = 4'd10;
        exp_out = 8'd0;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        in = 4'd3;
        exp_out = 8'd0;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #1;

        in = 4'd10;
        rst_b = 0;
        exp_out = 8'd0;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #1;
        rst_b = 1;
        in = 4'd1;
        exp_out = 8'd0;
        tests_total = tests_total  + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;
        in = 4'd10;
        exp_out = 4'd10;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;
        in = 4'd0;
        exp_out = 4'd10;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

    end
endmodule


module mult_last2_tb1(output reg[31:0] tests_total, tests_passed);
    reg[3:0] in;
    reg clk, ld, rst_b;
    wire[7:0] act_out;
    reg[7:0] exp_out;
    wire verdict;

    mult_last2 #(.ign(4'd8)) uut(.in(in), .clk(clk), .ld(ld), .rst_b(rst_b), .out(act_out));

    assign verdict = exp_out === act_out;
    initial begin
        #100;
        clk = 0;
        repeat(34) #2 clk = ~clk;
    end

    initial begin
        #100;
        $display("TESTBENCH 1: Modificat valoarea de ignore");
        $display("Time\tclk\tld\trst_b\tin\t\texpected_out\tactual_out\tPassed(1)/Failed(0)");
        $monitor("%4t\t%3b\t%2b\t%5b\t%2d\t\t%12d\t%10d\t%18b", $time, clk, ld, rst_b, in, exp_out, act_out, verdict);
        tests_total = 0;
        tests_passed = 0;
        ld = 0;
        rst_b = 1;
        in = 4'd5;
        exp_out = 8'd0;

        #1;
        tests_total = tests_total + 1;
        tests_passed = tests_passed + verdict;

        #1;
        in = 4'd10;
        exp_out = 8'd0;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;
        
        #2;
        in = 4'd5;
        exp_out = 8'd50;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;
        #3;

        in = 4'd8;
        exp_out = 8'd50;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        in = 4'd5;
        exp_out = 8'd25;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        in = 4'd2;
        exp_out = 8'd10;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #2;

        in = 4'd10;
        ld = 1;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;


        in = 4'd5;
        ld = 0;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #1;
        in = 4'd10;
        exp_out = 8'd10;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #1;
        in = 4'd13;
        exp_out = 8'd65;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        in = 4'd13;
        exp_out = 8'd169;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        in = 4'd15;
        exp_out = 8'd195;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        in = 4'd15;
        exp_out = 8'd225;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        in = 4'd0;
        exp_out = 8'd0;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        in = 4'd10;
        exp_out = 8'd0;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        in = 4'd3;
        exp_out = 8'd0;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #1;

        in = 4'd10;
        rst_b = 0;
        exp_out = 8'd0;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #1;
        rst_b = 1;
        in = 4'd1;
        exp_out = 8'd0;
        tests_total = tests_total  + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;
        in = 4'd10;
        exp_out = 4'd10;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;
        in = 4'd8;
        exp_out = 4'd10;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

    end
endmodule

module mult_last2_tb2(output reg[31:0] tests_total, tests_passed);
    reg[5:0] in;
    reg clk, ld, rst_b;
    wire[11:0] act_out;
    reg[11:0] exp_out;
    wire verdict;

    mult_last2#(.w(6)) uut(.in(in), .clk(clk), .ld(ld), .rst_b(rst_b), .out(act_out));

    assign verdict = exp_out === act_out;
    initial begin
        #200;
        clk = 0;
        repeat(34) #2 clk = ~clk;
    end

    initial begin
        #200;
        $display("TESTBENCH 2: Modificat numarul de biti");
        $display("Time\tclk\tld\trst_b\tin\t\texpected_out\tactual_out\tPassed(1)/Failed(0)");
        $monitor("%4t\t%3b\t%2b\t%5b\t%2d\t\t%12d\t%10d\t%18b", $time, clk, ld, rst_b, in, exp_out, act_out, verdict);
        tests_total = 0;
        tests_passed = 0;
        ld = 0;
        rst_b = 1;
        in = 6'd5;
        exp_out = 12'd0;

        #1;
        tests_total = tests_total + 1;
        tests_passed = tests_passed + verdict;

        #1;
        in = 6'd10;
        exp_out = 12'd0;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;
        
        #2;
        in = 6'd5;
        exp_out = 12'd50;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;
        #3;

        in = 6'd0;
        exp_out = 12'd50;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        in = 6'd5;
        exp_out = 12'd25;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        in = 6'd2;
        exp_out = 12'd10;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #2;

        in = 6'd10;
        ld = 1;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;


        in = 6'd5;
        ld = 0;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #1;
        in = 6'd10;
        exp_out = 12'd10;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #1;
        in = 6'd13;
        exp_out = 12'd65;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        in = 6'd13;
        exp_out = 12'd169;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        in = 6'd63;
        exp_out = 12'd819;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        in = 6'd63;
        exp_out = 12'd3969;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        in = 6'd0;
        exp_out = 12'd0;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        in = 6'd10;
        exp_out = 12'd0;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        in = 6'd3;
        exp_out = 12'd0;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #1;

        in = 6'd10;
        rst_b = 0;
        exp_out = 12'd0;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #1;
        rst_b = 1;
        in = 6'd1;
        exp_out = 12'd0;
        tests_total = tests_total  + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;
        in = 6'd10;
        exp_out = 6'd10;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;
        in = 6'd0;
        exp_out = 6'd10;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

    end
endmodule

module mult_last_2_tb;
    wire[31:0] tests_total_0, tests_total_1, tests_total_2, tests_passed_0, tests_passed_1, tests_passed_2;
    integer nota;

    mult_last2_tb0 tb_0(.tests_total(tests_total_0), .tests_passed(tests_passed_0));
    mult_last2_tb1 tb_1(.tests_total(tests_total_1), .tests_passed(tests_passed_1));
    mult_last2_tb2 tb_2(.tests_total(tests_total_2), .tests_passed(tests_passed_2));
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