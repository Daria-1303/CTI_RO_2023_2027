/* Construiti un testbench pentru testarea exhaustiva a modulului e3_mult5 ce inmulteste un numar de doua cifre reprezentate in E3.
Identificati cazurile in care rezultatul este gresit (scrise intr-un comentariu in fisier).

Nota: Cazurile invalide / date incorecte se vor depuncta
*/
module e3_mult5(input[7:0] X, output[11:0] Y);
    wire[7:0] aux_res;
    wire[3:0] s, d, u;
    assign aux_res = ((X[7:4] - 4'd3) * 4'd10 + X[3:0] - 4'd3) * 8'd5;
    assign s = aux_res / 8'd100 + 8'd3;
    assign d = aux_res / 8'd10 % 8'd10 + 8'd3;
    assign u = aux_res % 8'd10 + 8'd3;
    assign Y = {s, d, u};
endmodule

module e3_mult5_tb;
    /* Write Verilog code here */
endmodule