/* Proiectati arhitectura

Creati module ajutatoare!
*/

module MAC_unit(input[3:0] Data_a, Data_b, input clk, rst_b, output[15:0] Acc_out);
    /* Write Verilog code here */
endmodule

module MAC_unit_tb;
    reg[3:0] Data_a, Data_b;
    reg clk, rst_b;
    wire[15:0] Acc_out;

    MAC_unit uut(.Data_a(Data_a), .Data_b(Data_b), .clk(clk), .rst_b(rst_b), .Acc_out(Acc_out));

    initial begin
        clk = 0;
        repeat(20) begin
            #10 clk = ~clk;
        end
    end

    initial begin
        rst_b = 1;
        #2;
        rst_b = 0;
        #2;
        rst_b = 1;
    end

    initial begin
        $display("clk\trst_b\tData_a\tData_b\t\tAcc_out");
        $monitor("%b\t%b\t%d\t%d\t\t%d", clk, rst_b, Data_a, Data_b, Acc_out);
        repeat(10) begin
            Data_a = $random;
            Data_b = $random;
            #20;
        end
    end
endmodule