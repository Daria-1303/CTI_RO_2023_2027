/* Proiectati automatul cu stari finite */
module fsm(input a, b, clk, rst_b, output m, n);
    /* Write Verilog code here */
endmodule

module fsm_tb;
    reg a, b;
    reg clk, rst_b;
    wire m, n;

    fsm uut (.a(a), .b(b), .clk(clk), .rst_b(rst_b), .m(m), .n(n));

    initial begin
        clk = 0;
        repeat(30) #1 clk = ~clk;
    end
    
    initial begin
        rst_b = 0;
        #3;
        rst_b = 1;
    end

    initial begin
        $display("clk\trst_b\ta\tb\t\tm\tn");
        $monitor("%b\t%b\t%b\t%b\t\t%b\t%b", clk, rst_b, a, b, m, n);

        repeat(30) begin
            a = $urandom;
            b = $urandom;
            #1;
        end
    end
endmodule