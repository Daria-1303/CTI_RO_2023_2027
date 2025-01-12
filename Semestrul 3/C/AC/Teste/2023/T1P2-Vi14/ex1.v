/* Construiti un modul ce inmulteste doua cifre reprezentate in Exces de 3 si returneaza rezultatul intr-o singura iesire, reprezentata tot in Exces de 3 */
module e3_mult(input[3:0] in_0, in_1, output reg[7:0] out);
     always@(*)begin
		out[3:0]=(in_0-3)*(in_1-3)%10+3;
		out[7:4]=(in_0-3)*(in_1-3)/10+3;
	end
endmodule

module e3_mult_tb;
    reg[3:0] in_0, in_1;
    wire[7:0] act_out;
    reg[7:0] exp_out;
    wire verdict;

    e3_mult uut(.in_0(in_0), .in_1(in_1), .out(act_out));
    integer tests_total, tests_passed, nota;
    integer data_file, random_int;

    assign verdict = exp_out === act_out;

    initial begin
        $display("in_0\tin_1\t\texpected_out\tactual_out\tPassed(1)/Failed(0)");
        $monitor("%4b\t%4b\t\t%12b\t%10b\t%18d", in_0, in_1, exp_out, act_out, verdict);

        tests_total = 0;
        tests_passed = 0;
        data_file = 0;
        data_file = $fopen("ex1_tests.dat", "r");
        if (data_file == 0) begin
            $display("Adauga fisierul ex1_tests.dat in acelasi folder");
            $finish;
        end
        while(!$feof(data_file)) begin
            random_int = $fscanf(data_file, "%b %b %b\n", in_0, in_1, exp_out);
            tests_total = tests_total + 1;
            #1;
            tests_passed = tests_passed + verdict;
        end

        $display("Passed / Total: %2d / %2d", tests_passed, tests_total);
        nota = tests_passed * 1000 / tests_total * 2;
        $display("Nota: %1d.%03d", nota / 1000, nota % 1000);
    end
endmodule