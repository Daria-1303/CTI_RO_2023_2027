module ex2(
    input [3 : 0] nr1, // 4 bit input
    input [3 : 0] nr2, // 4 bit input 
    output [3:0] cifra_zecilor,
    output [3:0] cifra_unitatilor
);

assign cifra_zecilor =  (nr1 + nr2) / 10;
assign cifra_unitatilor = (nr1 + nr2) % 10;

endmodule

module ex2_tb;

reg [3:0] nr1;
reg [3:0] nr2;

wire [3:0] cifra_zecilor;
wire [3:0] cifra_unitatilor;

ex2 ex2_instanta(
    .nr1(nr1),
    .nr2(nr2),
    .cifra_zecilor(cifra_zecilor),
    .cifra_unitatilor(cifra_unitatilor)
);

integer i;

initial begin
    $display("nr1 nr2   cifra_zecilor cifra_unitatilor");
    $monitor("%d %d %d %d", nr1, nr2, cifra_zecilor, cifra_unitatilor);

    for(i = 0; i < 16; i = i + 1) begin
        nr1 = $urandom_range(0, 15);
        nr2 = $urandom_range(0, 15);
        #10;
    end
end

endmodule