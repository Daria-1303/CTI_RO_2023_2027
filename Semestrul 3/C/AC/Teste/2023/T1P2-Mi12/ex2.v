/* Construiti un modul ce insumeaza 2 cifre BCD si returneaza rezultatul in 2 iesiri, fiecare cu cate 4 biti: cifra zecilor si cifra unitatilor. */
module sum_bcd(input[3:0] nr_1, nr_2, output reg[3:0] out_u, out_d);
     always@(*)begin
		out_u=(nr_1+nr_2)%10;
		out_d=(nr_1+nr_2)/10;
	end
endmodule

module sum_bcd_tb;

    reg[3:0] nr_1, nr_2;
    wire[3:0] act_out_u, act_out_d;
    reg[3:0] exp_out_u, exp_out_d;
    wire verdict_u, verdict_d;

    sum_bcd uut(.nr_1(nr_1), .nr_2(nr_2), .out_u(act_out_u), .out_d(act_out_d));
    integer tests_total, tests_passed, nota;

    integer data_file, random_int;

    assign verdict_u = exp_out_u === act_out_u;
    assign verdict_d = exp_out_d === act_out_d;

    initial begin
        $display("nr_1\tnr_2\t\texpected_out_u\tactual_out_u\tPassed(1)/Failed(0)\texpected_out_d\tactual_out_d\tPassed(1)/Failed(0)");
        $monitor("%4d\t%4d\t\t%14d\t%12d\t%18d\t%14d\t%12d\t%18d", nr_1, nr_2, exp_out_u, act_out_u, verdict_u, exp_out_d, act_out_d, verdict_d);

        tests_total = 0;
        tests_passed = 0;
        data_file = 0;
        data_file = $fopen("ex2_tests.dat", "r");
        if (data_file == 0) begin
            $display("Adauga fisierul ex2_tests.dat in acelasi folder");
            $finish;
        end
        while(!$feof(data_file)) begin
            random_int = $fscanf(data_file, "%d %d %d %d\n", nr_1, nr_2, exp_out_d, exp_out_u);
            tests_total = tests_total + 2;
            #1;
            tests_passed = tests_passed + verdict_d + verdict_u;
        end

        $display("Passed / Total: %2d / %2d", tests_passed, tests_total);
        nota = tests_passed * 100 / tests_total * 2;
        $display("Nota: %1d.%02d", nota / 100, nota % 100);
    end
endmodule 