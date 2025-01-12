module ex1 (
    input [3:0] bcd,
    output reg [4 : 0] out
);

always @(*) begin
    case(bcd)
        4'b0000: out = 5'b11000;    //0 
        4'b0001: out = 5'b00011;    //1
        4'b0010: out = 5'b00101;    //2
        4'b0011: out = 5'b00110;    //3
        4'b0100: out = 5'b01001;    //4
        4'b0101: out = 5'b01010;    //5
        4'b0110: out = 5'b01100;    //6
        4'b0111: out = 5'b10001;    //7
        4'b1000: out = 5'b10010;    //8
        4'b1001: out = 5'b10100;    //9
        default: out = 5'b00000; // Default (pentru siguranta)
    endcase
end

endmodule

module ex1_tb;

reg [3:0] bcd;
wire [4:0] out;

ex1 instanta (
    .bcd(bcd),
    .out(out)
);

integer i;

initial begin
    $display("bcd          |-> out");
    $monitor("bcd=%d | %b -> out=%b", bcd, bcd, out);
    for(i = 0; i < 10; i = i + 1) begin
        bcd = i;
        #10;
    end
end

endmodule