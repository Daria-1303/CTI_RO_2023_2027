/* Construiti un modul Full Adder Cell (FAC). */
module FAC(input x, y, c_in, output z, c_out);
    /* Write Verilog code here */
endmodule

/* Folosindu-va de module FAC, proiectati un sumator-scazator (adder_subtractor) cu w biti . */
module adder_subtractor #(parameter w=8)(input[/*fill*/] x, y, input sub, output[/*fill*/] z);
    /* Write Verilog code here */
endmodule

module adder_subtractor_tb;
    
    reg[2:0] x, y;
    reg sub;
    wire[2:0] z;

    adder_subtractor #(.w(3)) uut (.x(x), .y(y), .sub(sub), .z(z));

    integer k;
    initial begin
        $display("sub\tx\ty\t\tz");
        $monitor("%b\t%d\t%d\t\t%d", sub, x, y, z);
        for(k=0; k < 128; k = k + 1) begin
            {sub, x, y} = k;
            #10;
        end
    end
endmodule