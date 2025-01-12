module cmp4b(
    input [3:0] x,
    input [3 :0] y,
    output eqf,
    output ltf,
    output gtf
);

wire [1:0] eq, lt, gt;

cmp2b cmp2b_front(
    .x(x[3 : 2]),
    .y(y[3 : 2]),
    .eq(eq[1]),
    .lt(lt[1]),
    .gt(gt[1])
);

cmp2b cmp2b_back(
    .x(x[1 : 0]),
    .y(y[1 : 0]),
    .eq(eq[0]),
    .lt(lt[0]),
    .gt(gt[0])
);  

assign eqf = eq[1] & eq[0];
assign ltf = lt[1] | (eq[1] & lt[0]);
assign gtf = gt[1] | (eq[1] & gt[0]);

/*
// sau
// faceam outputurile reg

always @(*) begin
    eq = 0;
    lt = 0;
    gt = 0;
    if(eq[1] == 1 && eq[0] == 1)
        eq = 1;
    else if(lt[1] == 1 || (eq[1] == 1 && lt[0] == 1))
        lt = 1;
    else
        gt = 1;

end
*/

endmodule

module cmp4b_tb;

reg [3 : 0] x;
reg [3 : 0] y;

wire eqf, ltf, gtf;

cmp4b cmp4b_instanta(
    .x(x),
    .y(y),
    .eqf(eqf),
    .ltf(ltf),
    .gtf(gtf)
);

integer i;

initial begin 

    $display("x y | lt eq gt");
    $display("---------------");
    $monitor("%d %d | %b %b %b", x, y, ltf, eqf, gtf);

    for(i = 0; i < 256; i = i + 1) begin
        {x, y} = i;
        #5;
    end

    $finish;

end

endmodule