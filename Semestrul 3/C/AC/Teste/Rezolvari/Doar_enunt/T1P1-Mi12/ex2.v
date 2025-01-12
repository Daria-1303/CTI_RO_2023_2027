/* Proiectati un codificator binar de prioritati 8-la-3, unde iesirea va reprezenta indexul intrarii active cu prioritatea cea mai mare.
Prioritatea bitilor este: in[7] > in[6] > in[5] > in[4] > in[3] > in[2] > in[1] > in[0]. */
module prioirty_enc(input[7:0] prio_in, output[2:0] prio_out);
    /* Write Verilog code here */
endmodule

module priority_enc_tb;

    reg[7:0] prio_in;
    wire[2:0] act_prio_out;
    reg[2:0] exp_prio_out;
    wire verdict;

    prioirty_enc uut(.prio_in(prio_in), .prio_out(act_prio_out));
    integer tests_total, tests_passed, nota;

    integer data_file, random_int;

    assign verdict = exp_prio_out === act_prio_out;

    initial begin
        $display("prio_in\t\texpected_prio_out\tactual_prio_out\tPassed(1)/Failed(0)");
        $monitor("%8b\t\t%16b\t%15b\t%18d", prio_in, exp_prio_out, act_prio_out, verdict);

        tests_total = 0;
        tests_passed = 0;
        data_file = 0;
        data_file = $fopen("ex2_tests.dat", "r");
        if (data_file == 0) begin
            $display("Adauga fisierul ex2_tests.dat in acelasi folder");
            $finish;
        end
        while(!$feof(data_file)) begin
            random_int = $fscanf(data_file, "%b %b\n", prio_in, exp_prio_out);
            tests_total = tests_total +1;
            #1;
            tests_passed = tests_passed + verdict;
        end

        $display("Passed / Total: %2d / %2d", tests_passed, tests_total);
        nota = tests_passed * 1000 / tests_total * 2;
        $display("Nota: %1d.%03d", nota / 1000, nota % 1000);
    end
endmodule