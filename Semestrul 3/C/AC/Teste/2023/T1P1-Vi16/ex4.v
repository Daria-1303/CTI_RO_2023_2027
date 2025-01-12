
/* Construiti un modul de transmitere a unei valori de la intrare bit cu bit la iesire (iesirea se va numi bit).
Intrarea modulului va avea 8 biti,
iar modulul va trimite bitii de la intrare in maniera FIFO (cel mai semnificativ bit va fi trimis primul) la fiecare front crescator de clk.
Dupa ce a terminat transmitarea, modulul va seta iesirea finish pe valoarea 1, altfel va fi 0. 
Iesirea finish va ramane pe 1 pana cand valoarea de la intrare se schimba. 
Daca valoarea de la intrare se schimba inainte de terminarea transmisiei,
modulul va reincepe transmiterea noi intrari. 
Initial, iesirea stop e 1.*/
module spi_tx(input[7:0] in, input clk, output reg bit, stop);
    /* Write Verilog code here */
        
endmodule

module spi_tx_tb;
    reg[7:0] in;
    reg clk;
    wire act_bit, act_stop;

    reg exp_bit, exp_stop;

    wire verdict_bit, verdict_stop;

    spi_tx uut(.in(in), .clk(clk), .bit(act_bit), .stop(act_stop));
    integer tests_total, tests_passed, nota;
    assign verdict_bit = exp_bit === act_bit;
    assign verdict_stop = exp_stop === act_stop;
    
    initial begin
        clk = 1;
        repeat(64) #1 clk = ~clk;
    end

    initial begin
        $display("Time\tclk\tin\t\texpected_bit\tactual_bit\tPassed(1)/Failed(0)\texpected_stop\tactual_stop\tPassed(1)/Failed(0)");
        $monitor("%4t\t%3b\t%8b %12b\t%10b\t%18b\t%13b\t%11b\t%18b", $time, clk, in, exp_bit, act_bit, verdict_bit, exp_stop, act_stop, verdict_stop);
        tests_total = 0;
        tests_passed = 0;
        
        exp_stop = 1'b1;
        exp_bit = 1'bx;

        #1;

        tests_total = tests_total + 2;
        tests_passed = tests_passed + verdict_bit + verdict_stop;

        in = 8'b00110101;
        exp_bit = 1'b0;
        exp_stop = 1'b0;
        tests_total = tests_total + 2;
        #2;
        tests_passed = tests_passed + verdict_bit + verdict_stop;
        
        exp_bit = 1'b0;
        exp_stop = 1'b0;
        tests_total = tests_total + 2;
        #2;
        tests_passed = tests_passed + verdict_bit + verdict_stop;

        exp_bit = 1'b1;
        exp_stop = 1'b0;
        tests_total = tests_total + 2;
        #2;
        tests_passed = tests_passed + verdict_bit + verdict_stop;

        exp_bit = 1'b1;
        exp_stop = 1'b0;
        tests_total = tests_total + 2;
        #2;
        tests_passed = tests_passed + verdict_bit + verdict_stop;

        exp_bit = 1'b0;
        exp_stop = 1'b0;
        tests_total = tests_total + 2;
        #2;
        tests_passed = tests_passed + verdict_bit + verdict_stop;

        exp_bit = 1'b1;
        exp_stop = 1'b0;
        tests_total = tests_total + 2;
        #2;
        tests_passed = tests_passed + verdict_bit + verdict_stop;

        exp_bit = 1'b0;
        exp_stop = 1'b0;
        tests_total = tests_total + 2;
        #2;
        tests_passed = tests_passed + verdict_bit + verdict_stop;

        exp_bit = 1'b1;
        exp_stop = 1'b1;
        tests_total = tests_total + 2;
        #2;
        tests_passed = tests_passed + verdict_bit + verdict_stop;

        tests_total = tests_total + 2;
        #2;
        tests_passed = tests_passed + verdict_bit + verdict_stop;

        tests_total = tests_total + 2;
        #2;
        tests_passed = tests_passed + verdict_bit + verdict_stop;

        tests_total = tests_total + 2;
        #2;
        tests_passed = tests_passed + verdict_bit + verdict_stop;

        in = 8'b11001100;
        exp_bit = 1'b1;
        exp_stop = 1'b0;
        tests_total = tests_total + 2;
        #2;
        tests_passed = tests_passed + verdict_bit + verdict_stop;

        exp_bit = 1'b1;
        tests_total = tests_total + 2;
        #2;
        tests_passed = tests_passed + verdict_bit + verdict_stop;

        exp_bit = 1'b0;
        tests_total = tests_total + 2;
        #2;
        tests_passed = tests_passed + verdict_bit + verdict_stop;

        exp_bit = 1'b0;
        tests_total = tests_total + 2;
        #2;
        tests_passed = tests_passed + verdict_bit + verdict_stop;

        exp_bit = 1'b1;
        exp_stop = 1'b0;
        tests_total = tests_total + 2;
        #2;
        tests_passed = tests_passed + verdict_bit + verdict_stop;

        exp_bit = 1'b1;
        tests_total = tests_total + 2;
        #2;
        tests_passed = tests_passed + verdict_bit + verdict_stop;

        exp_bit = 1'b0;
        tests_total = tests_total + 2;
        #2;
        tests_passed = tests_passed + verdict_bit + verdict_stop;

        exp_bit = 1'b0;
        exp_stop = 1'b1;
        tests_total = tests_total + 2;
        #2;
        tests_passed = tests_passed + verdict_bit + verdict_stop;

        in = 8'b00110101;
        exp_bit = 1'b0;
        exp_stop = 1'b0;
        tests_total = tests_total + 2;
        #2;
        tests_passed = tests_passed + verdict_bit + verdict_stop;

        exp_bit = 1'b0;
        exp_stop = 1'b0;
        tests_total = tests_total + 2;
        #2;
        tests_passed = tests_passed + verdict_bit + verdict_stop;
        
        exp_bit = 1'b1;
        exp_stop = 1'b0;
        tests_total = tests_total + 2;
        #2;
        tests_passed = tests_passed + verdict_bit + verdict_stop;
        
        in = 8'b00101001;
        exp_bit = 1'b0;
        tests_total = tests_total + 2;
        #2;
        tests_passed = tests_passed + verdict_bit + verdict_stop;

        exp_bit = 1'b0;
        tests_total = tests_total + 2;
        #2;
        tests_passed = tests_passed + verdict_bit + verdict_stop;
        
        exp_bit = 1'b1;
        tests_total = tests_total + 2;
        #2;
        tests_passed = tests_passed + verdict_bit + verdict_stop;
        
        exp_bit = 1'b0;
        tests_total = tests_total + 2;
        #2;
        tests_passed = tests_passed + verdict_bit + verdict_stop;
        
        exp_bit = 1'b1;
        tests_total = tests_total + 2;
        #2;
        tests_passed = tests_passed + verdict_bit + verdict_stop;

        exp_bit = 1'b0;
        tests_total = tests_total + 2;
        #2;
        tests_passed = tests_passed + verdict_bit + verdict_stop;
        
        exp_bit = 1'b0;
        tests_total = tests_total + 2;
        #2;
        tests_passed = tests_passed + verdict_bit + verdict_stop;
        
        exp_bit = 1'b1;
        exp_stop = 1'b1;
        tests_total = tests_total + 2;
        #2;
        tests_passed = tests_passed + verdict_bit + verdict_stop;
        
        tests_total = tests_total + 2;
        #2;
        tests_passed = tests_passed + verdict_bit + verdict_stop;
        
        tests_total = tests_total + 2;
        #2;
        tests_passed = tests_passed + verdict_bit + verdict_stop;
        
        $display("Passed / Total: %2d / %2d", tests_passed, tests_total);
        nota = tests_passed * 100 / tests_total * 25;
        $display("Nota: %1d.%03d", nota / 1000, nota % 1000);
    end
endmodule