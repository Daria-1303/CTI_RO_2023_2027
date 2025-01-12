module E3Digit_to_7seg (input[3:0] E3_digit, output[7:0] _7seg_display);
    /* Write Verilog code here */
endmodule

module E3number_to_7seg#(parameter n_conv=4)(input[/* Fill */] E3_number, output[/* Fill */] _7seg_display);
    /* Write Verilog code here */
endmodule

module E3number_to_7seg_tb;
    reg[7:0] E3_number;
    wire[15:0] _7seg_display;

    E3number_to_7seg #(.n_conv(2)) uut(.E3_number(E3_number), ._7seg_display(_7seg_display));

    integer k;

    initial begin
        $display("E3_number\t\t_7seg_display");
        $monitor("%h\t\t%b(%b_%b)", E3_number, _7seg_display, _7seg_display[15:8], _7seg_display[7:0]);
        for(k = 0; k < 256; k = k + 1) begin
            E3_number = k;
            #1;
        end
    end
endmodule