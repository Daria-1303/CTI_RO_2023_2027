module seven_segment_display(
    input [3:0] num_in,
    output [7:0] leds_out
);

    reg [7:0] mem;

    //the seven segment display on d10 lite are common ANODE, meaning are ON when 0 is driven
    always @(num_in) begin
        case(num_in) 
            4'd0: mem = 8'h40;  //display 0 - 8'b 1100 0000
            4'd1: mem = 8'hF9;  //display 1 - 8'b 1111 1001
            4'd2: mem = 8'hA4;    //display 2 - 8'b 1010 0100
            4'd3: mem = 8'hB0;    //display 3 - 8'b 1011 0000
            4'd4: mem = 8'h99;    //display 4 - 8'b 1001 1001
            4'd5: mem = 8'h92;    //display 5 - 8'b 1001 0010
            4'd6: mem = 8'h82;    //display 6 - 8'b 1000 0010
            4'd7: mem = 8'hF8;    //display 7 - 8'b FFFF 1000
            4'd8: mem = 8'h80;    //display 8 - 8'b 1000 0000
            4'd9: mem = 8'h90;    //display 9 - 8'b 1001 0000
        endcase
    end

    assign leds_out = mem;
endmodule
