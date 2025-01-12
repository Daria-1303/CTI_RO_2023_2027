module BCDdigit_to_7seg(input[3:0] BCD_digit, output[7:0] _7seg_display);
    /* Write Verilog code here */
endmodule

module BCDnumber_to_7seg#(parameter n_conv=4)(input[/*fill*/] BCD_number, output[/*fill*/] _7seg_display);
    /* Write Verilog code here */
endmodule

module BCDnumber_to_7seg_tb;
    reg[7:0] BCD_number;
    wire[15:0] _7seg_display;

    BCDnumber_to_7seg #(.n_conv(2)) uut(.BCD_number(BCD_number), ._7seg_display(_7seg_display));

    integer k;

    initial begin
        $display("BCD_number\t\t_7seg_display");
        $monitor("%h\t\t%b(%b_%b)", BCD_number, _7seg_display, _7seg_display[15:8], _7seg_display[7:0]);
        for(k = 0; k < 256; k = k + 1) begin
            BCD_number = k;
            #1;
        end
    end
endmodule