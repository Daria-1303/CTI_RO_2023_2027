module mj_voter(
    input in1,
    input in2,
    input in3,
    output out
);

    wire nand1, nand2, nand3l;

    assign nand1 = ~(in1 & in2);
    assign nand2 = ~(in1 & in3);
    assign nand3 = ~(in2 & in3);

    assign out = ~(nand1 & nand2 & nand3);
endmodule