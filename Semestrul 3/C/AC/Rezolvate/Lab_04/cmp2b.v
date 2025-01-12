module cmp2b (
    input [1:0] x, y,
    output eq, lt, gt
);
    assign eq = (x[1] ~^ y[1]) & (x[0] ~^ y[0]);
    assign lt = ~x[1]&y[1] | (x[1] ~^ y[1])&(~x[0])&y[0];
    assign gt = ~y[1]&x[1] | (y[1] ~^ x[1])&(~y[0])&x[0];
endmodule

// Fara tesbench; corecta functionare a acestui modul va fi testata in Problema urmatoare