module D_FF(input clk, D, output reg Q, Q_b);

    initial begin
        Q <= 0;
        Q_b <= 1;
    end

    always @(posedge clk) begin
        Q <= D;
        Q_b <= ~D;
    end
endmodule

module ripple_counter_4bit(input clk, output[3:0] Q);
    /* Write Verilog code here */
endmodule

module ripple_counter_4bit_tb;
    reg clk;
    wire[3:0] Q;

    ripple_counter_4bit uut (.clk(clk), .Q(Q));

    initial begin
        $display("clk\t\tQ");
        $monitor("%b\t\t%h", clk, Q);
        clk = 0;
        repeat(200) #5 clk = ~clk;
        $display("ACEST TESTBENCH NU NOTEAZA AUTOMAT!");
        $display("Puteti sa va verificati ca ati implementat corect folosindu-va de test_passed");
        $display("Nota: Q incepe de la 14(0xE)");
    end
endmodule
