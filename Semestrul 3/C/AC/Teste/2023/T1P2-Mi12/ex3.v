/* Sa se construiasca un registru de deplasare pe w biti (implicit 4) si valoare de reset rst_val (implicit 0)(parametrii).
Modulul va avea functionalitati de shiftare (prin intrarea sh) si incarcare sincrone (prin intrare ld), active la 1, si reset asincron (prin intrarea rst_b), activ la 0.
Daca intrarea sh este activa, atunci modulul va face shiftare cu o pozitie la dreapta a valorii inregistrate. Intrarea sh_type specifica tipul shiftarii:
* 0 - shiftare logica
* 1 - shiftare aritmetica (valoarea inregistrata este considerata ca fiind in complement de 2)*/
module shift_rgst #(parameter w = 4, parameter [3:0]rst_val = 0)
                    (input [w-1:0] d, 
                    input clk, ld, rst_b, sh, sh_type,
                    output reg [w-1:0] q);
	always @(posedge clk, negedge rst_b)
    begin
    if(!rst_b)
    q <= rst_val;
    else if(ld)
        q <= d;
    else if(sh)
    begin
        if(!sh_type)
            q <= {0, q[w-1:1]};
        else
            q <= {q[w-1], q[w-1:1]};
    end

    end
endmodule

module shift_rgst_tb_0(output reg[31:0] tests_total, tests_passed);

    reg signed [3:0] d;
    reg clk, ld, rst_b, sh, sh_type;
    wire [3:0] act_q;
    reg [3:0] exp_q;
    wire verdict;

    shift_rgst uut (.d(d), .clk(clk), .ld(ld), .rst_b(rst_b), .sh(sh), .sh_type(sh_type), .q(act_q));
    
    assign verdict = exp_q === act_q;
    initial begin
        clk = 0;
        repeat(20) #2 clk = ~clk;
    end

    initial begin
        $display("TESTBENCH 0: Valori implicite ale parameterilor");
        $display("Time\tclk\tld\trst_b\tsh\tsh_type\td\t\texpected_q\tactual_q\tPassed(1)/Failed(0)");
        $monitor("%4t\t%3b\t%2b\t%5b\t%2b\t%7b\t%4b\t\t%10b\t%8b\t%18b", $time, clk, ld, rst_b, sh, sh_type, d, exp_q, act_q, verdict);
        tests_total = 0;
        tests_passed = 0;
        ld = 0;
        rst_b = 1;
        sh = 0;
        sh_type = 0;
        exp_q = 4'dX;
        
        #1;

        rst_b = 0;
        d = 4'd2;
        exp_q = 4'd0;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;
    
        #1;
        rst_b = 1;
        d = 4'd7;
        ld = 1;
        exp_q = 4'd0;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #2;
        rst_b = 1;
        d = 4'd7;
        ld = 1;
        exp_q = 4'd7;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        ld = 0;
        sh = 1;
        sh_type = 0;
        exp_q = 4'b0011;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;
    
        sh = 1;
        sh_type = 0;
        exp_q = 4'b0011;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #2;

        sh = 1;
        sh_type = 1;
        exp_q = 4'b0001;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        sh = 0;
        ld = 1;
        d = 4'b1100;
        exp_q = 4'b1100;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        sh = 1;
        ld = 0;
        sh_type = 1;
        d = 4'b0011;
        exp_q = 4'b1110;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        sh = 1;
        ld = 0;
        sh_type = 0;
        d = 4'b1100;
        exp_q = 4'b0111;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        sh = 0;
        ld = 1;
        sh_type = 1;
        d = 4'b1111;
        exp_q = 4'b1111;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        sh = 1;
        ld = 0;
        sh_type = 0;
        d = 4'b0000;
        exp_q = 4'b1111;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        sh = 1;
        ld = 0;
        sh_type = 1;
        d = 4'b1010;
        exp_q = 4'b1111;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;
    
        sh = 1;
        ld = 0;
        sh_type = 0;
        d = 4'b0101;
        exp_q = 4'b0111;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;
        
        #3;

        sh = 1;
        sh_type = 1;
        d = 4'b1010;
        exp_q = 4'b0011;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;
    
        sh =0;
        sh_type = 0;
        ld = 1;
        d = 4'b1010;
        exp_q = 4'b0011;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #1;

        $display("Passed / Total: %2d / %2d", tests_passed, tests_total);
    end
endmodule

module shift_rgst_tb_1(output reg[31:0] tests_total, tests_passed);

    reg signed [3:0] d;
    reg clk, ld, rst_b, sh, sh_type;
    wire [3:0] act_q;
    reg [3:0] exp_q;
    wire verdict;

    shift_rgst #(.rst_val(4'd5)) uut (.d(d), .clk(clk), .ld(ld), .rst_b(rst_b), .sh(sh), .sh_type(sh_type), .q(act_q));

    assign verdict = exp_q === act_q;
    initial begin
        #50;
        clk = 0;
        repeat(20) #2 clk = ~clk;
    end

    initial begin
        #50;
        $display("TESTBENCH 1: Modificat valoarea de reset");
        $display("Time\tclk\tld\trst_b\tsh\tsh_type\td\t\texpected_q\tactual_q\tPassed(1)/Failed(0)");
        $monitor("%4t\t%3b\t%2b\t%5b\t%2b\t%7b\t%4b\t\t%10b\t%8b\t%18b", $time, clk, ld, rst_b, sh, sh_type, d, exp_q, act_q, verdict);
        tests_total = 0;
        tests_passed = 0;
        ld = 0;
        rst_b = 1;
        sh = 0;
        sh_type = 0;
        exp_q = 4'dX;
        
        #1;

        rst_b = 0;
        d = 4'd2;
        exp_q = 4'd5;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;
    
        #1;

        rst_b = 1;
        d = 4'd7;
        ld = 1;
        exp_q = 4'd5;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #2;
        rst_b = 1;
        d = 4'd7;
        ld = 1;
        exp_q = 4'd7;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        ld = 0;
        sh = 1;
        sh_type = 0;
        exp_q = 4'b0011;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;
    
        sh = 1;
        sh_type = 0;
        exp_q = 4'b0011;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #2;

        sh = 1;
        sh_type = 1;
        exp_q = 4'b0001;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        sh = 0;
        ld = 1;
        d = 4'b1100;
        exp_q = 4'b1100;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        sh = 1;
        ld = 0;
        sh_type = 1;
        d = 4'b0011;
        exp_q = 4'b1110;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        sh = 1;
        ld = 0;
        sh_type = 0;
        d = 4'b1100;
        exp_q = 4'b0111;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        sh = 0;
        ld = 1;
        sh_type = 1;
        d = 4'b1111;
        exp_q = 4'b1111;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        sh = 1;
        ld = 0;
        sh_type = 0;
        d = 4'b0000;
        exp_q = 4'b1111;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        sh = 1;
        ld = 0;
        sh_type = 1;
        d = 4'b1010;
        exp_q = 4'b1111;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;
    
        sh = 1;
        ld = 0;
        sh_type = 0;
        d = 4'b0101;
        exp_q = 4'b0111;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;
        
        #3;

        sh = 1;
        sh_type = 1;
        d = 4'b1010;
        exp_q = 4'b0011;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;
    
        sh =0;
        sh_type = 0;
        ld = 1;
        d = 4'b1010;
        exp_q = 4'b0011;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #1;

        $display("Passed / Total: %2d / %2d", tests_passed, tests_total);
    end
endmodule


module shift_rgst_tb_2(output reg[31:0] tests_total, tests_passed);

    reg signed [7:0] d;
    reg clk, ld, rst_b, sh, sh_type;
    wire [7:0] act_q;
    reg [7:0] exp_q;
    wire verdict;

    shift_rgst #(.w(8)) uut (.d(d), .clk(clk), .ld(ld), .rst_b(rst_b), .sh(sh), .sh_type(sh_type), .q(act_q));
    
    assign verdict = exp_q === act_q;
    initial begin
        #100;
        clk = 0;
        repeat(20) #2 clk = ~clk;
    end

    initial begin
        #100;
        $display("TESTBENCH 2: Modificat numarul de biti");
        $display("Time\tclk\tld\trst_b\tsh\tsh_type\td\t\texpected_q\tactual_q\tPassed(1)/Failed(0)");
        $monitor("%4t\t%3b\t%2b\t%5b\t%2b\t%7b\t%4b\t\t%10b\t%8b\t%18b", $time, clk, ld, rst_b, sh, sh_type, d, exp_q, act_q, verdict);
        tests_total = 0;
        tests_passed = 0;
        ld = 0;
        rst_b = 1;
        sh = 0;
        sh_type = 0;
        exp_q = 8'dX;
        
        #1;

        rst_b = 0;
        d = 8'd2;
        exp_q = 8'd0;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;
    
        #1;

        rst_b = 1;
        d = 8'd7;
        ld = 1;
        exp_q = 8'd0;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #2;
        rst_b = 1;
        d = 8'd7;
        ld = 1;
        exp_q = 8'd7;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        ld = 0;
        sh = 1;
        sh_type = 0;
        exp_q = 8'b00000011;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;
    
        sh = 1;
        sh_type = 0;
        exp_q = 8'b00000011;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #2;

        sh = 1;
        sh_type = 1;
        exp_q = 8'b00000001;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        sh = 0;
        ld = 1;
        d = 8'b11111100;
        exp_q = 8'b11111100;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        sh = 1;
        ld = 0;
        sh_type = 1;
        d = 8'b11000011;
        exp_q = 8'b11111110;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        sh = 1;
        ld = 0;
        sh_type = 0;
        d = 8'b00111100;
        exp_q = 8'b01111111;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #3;

        sh = 0;
        ld = 1;
        sh_type = 1;
        d = 8'b11111111;
        exp_q = 8'b11111111;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        sh = 1;
        ld = 0;
        sh_type = 0;
        d = 8'b00000000;
        exp_q = 8'b11111111;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        sh = 1;
        ld = 0;
        sh_type = 1;
        d = 8'b10101010;
        exp_q = 8'b11111111;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;
    
        sh = 1;
        ld = 0;
        sh_type = 0;
        d = 8'b01010101;
        exp_q = 8'b01111111;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;
        
        #3;

        sh = 1;
        sh_type = 1;
        d = 8'b10101010;
        exp_q = 8'b00111111;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;
    
        sh =0;
        sh_type = 0;
        ld = 1;
        d = 8'b00001010;
        exp_q = 8'b00111111;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        #1;

        $display("Passed / Total: %2d / %2d", tests_passed, tests_total);
    end
endmodule

module shift_rgst_tb;

    wire[31:0] tests_total_0, tests_total_1, tests_total_2, tests_passed_0, tests_passed_1, tests_passed_2;
    integer nota;

    shift_rgst_tb_0 tb_0(.tests_total(tests_total_0), .tests_passed(tests_passed_0));
    shift_rgst_tb_1 tb_1(.tests_total(tests_total_1), .tests_passed(tests_passed_1));
    shift_rgst_tb_2 tb_2(.tests_total(tests_total_2), .tests_passed(tests_passed_2));
    wire[31:0] tests_total_tb;
    wire[31:0] tests_passed_tb;
    assign tests_total_tb = tests_total_0 + tests_total_1  + tests_total_2;
    assign tests_passed_tb = tests_passed_0 + tests_passed_1 + tests_passed_2;
    initial begin
        #150;
        $display("All Passed / All Total: %3d / %3d", tests_passed_tb, tests_total_tb);
        nota = tests_passed_tb * 250 / tests_total_tb;
        $display("Nota: %1d.%02d", nota / 100, nota % 100);
    end
endmodule