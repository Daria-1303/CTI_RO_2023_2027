/* Proiectati un modul ce citeste bit cu bit pe front-ul crescator al semnalului de clk in maniera LIFO (primul bit primit este cel mai putin semnificativ bit). 
Odata ce a citit 8 biti, modulul ii va inregistra in iesirea byte. 
Iesirea byte va ramane pe valoarea precedenta (initial 0) cat modulul citeste biti si se va schimba doar cand modulul a citit alti 8 biti. 
Intrarea flush a modulului (activa pe nivel 1) va provoca eliminarea tutoror bitilor cititi pana in momentul respectiv de modul 
si reluarea citirii a altor 8 biti (iesirea byte inca isi pastreaza valoarea chiar si in cazul asta). */
module spi_rx(input bit, clk, flush, output reg[7:0] byte);
    
    /* Write Verilog code here */

endmodule

module spi_rx_tb;

    reg bit, clk, flush;
    wire[7:0] act_byte;
    reg[7:0] exp_byte;
    
    wire verdict;

    spi_rx uut(.bit(bit), .clk(clk), .flush(flush), .byte(act_byte));
    integer tests_total, tests_passed, nota;

    assign verdict = exp_byte === act_byte;

    initial begin
        clk = 0;
        repeat(80) #1 clk = ~clk;
    end
    initial begin
        $display("Time\tclk\tflush\tbit\t\tactual_byte\texpected_byte\tPassed(1)/Failed(0)");
        $monitor("%4t\t%3b\t%5b\t%3b\t\t%11b\t%9b\t%18d", $time, clk, flush, bit, act_byte, exp_byte, verdict);
        tests_total = 0;
        tests_passed = 0;
        exp_byte = 8'd0;
        #1;

        bit = 1;
        flush = 0;
        exp_byte = 8'd0;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        bit = 1;
        flush = 0;
        exp_byte = 8'd0;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        bit = 0;
        flush = 0;
        exp_byte = 8'd0;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        bit = 0;
        flush = 0;
        exp_byte = 8'd0;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        bit = 1;
        flush = 0;
        exp_byte = 8'd0;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        bit = 0;
        flush = 0;
        exp_byte = 8'd0;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        bit = 1;
        flush = 0;
        exp_byte = 8'd0;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        bit = 0;
        flush = 0;
        exp_byte = 8'b01010011;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        bit = 0;
        flush = 0;
        exp_byte = 8'b01010011;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        bit = 0;
        flush = 0;
        exp_byte = 8'b01010011;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        bit = 1;
        flush = 0;
        exp_byte = 8'b01010011;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        bit = 1;
        flush = 0;
        exp_byte = 8'b01010011;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        bit = 1;
        flush = 0;
        exp_byte = 8'b01010011;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        bit = 1;
        flush = 0;
        exp_byte = 8'b01010011;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        bit = 1;
        flush = 0;
        exp_byte = 8'b01010011;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        bit = 1;
        flush = 0;
        exp_byte = 8'b11111100;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        bit = 1;
        flush = 0;
        exp_byte = 8'b11111100;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        bit = 1;
        flush = 0;
        exp_byte = 8'b11111100;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;
        
        bit = 1;
        flush = 0;
        exp_byte = 8'b11111100;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        bit = 1;
        flush = 0;
        exp_byte = 8'b11111100;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;
        
        bit = 1;
        flush = 0;
        exp_byte = 8'b11111100;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        bit = 1;
        flush = 0;
        exp_byte = 8'b11111100;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;
        
        bit = 1;
        flush = 1;
        exp_byte = 8'b11111100;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        flush = 0;
        #1;
        bit = 1;
        exp_byte = 8'b11111100;
        tests_total = tests_total + 1;
        #1;
        tests_passed = tests_passed + verdict;

        bit = 0;
        exp_byte = 8'b11111100;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;

        bit = 1;
        exp_byte = 8'b11111100;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;
        
        bit = 0;
        exp_byte = 8'b11111100;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;
        
        bit = 0;
        exp_byte = 8'b11111100;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;
        
        bit = 1;
        exp_byte = 8'b11111100;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;
        
        bit = 1;
        exp_byte = 8'b11111100;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;
        
        bit = 1;
        exp_byte = 8'b11100101;
        tests_total = tests_total + 1;
        #2;
        tests_passed = tests_passed + verdict;
        
        $display("Passed / Total: %2d / %2d", tests_passed, tests_total);
        nota = tests_passed * 100 / tests_total * 25;
        $display("Nota: %1d.%03d", nota / 1000, nota % 1000);
    end
endmodule
