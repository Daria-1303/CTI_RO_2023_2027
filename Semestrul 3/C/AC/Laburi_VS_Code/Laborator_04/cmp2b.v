/*
module cmp2b(
    input [1:0] x,
    input [1:0] y,
    output eq,
    output lt,
    output gt
);

assign eq = (x == y);
assign lt = (x < y);
assign gt = (x > y);

// sau 
    assign eq = (x[1] ~^ y[1]) & (x[0] ~^ y[0]);
    assign lt = ~x[1]&y[1] | (x[1] ~^ y[1])&(~x[0])&y[0];
    assign gt = ~y[1]&x[1] | (y[1] ~^ x[1])&(~y[0])&x[0];


endmodule
*/

//sau


module cmp2b(
    input [1:0] x,
    input [1:0] y,
    output reg eq,
    output reg lt,
    output reg gt
);

always @(*) begin
    eq = 0;
    lt = 0;
    gt = 0;

    if(x == y)
        eq = 1;
    else if(x < y)
        lt = 1;
    else
        gt = 1;

end

endmodule

/*
module cmp2b_tb;

reg [1:0] x;
reg [1:0] y;

wire eq, lt, gt;

cmp2b cmp2b_instanta(
    .x(x), 
    .y(y),
    .eq(eq),
    .lt(lt),
    .gt(gt)
);

integer i; 

initial begin

    $display("x y | lt eq gt");
    $display("----------------");
    $monitor("%d %d | %b %b %b", x, y, lt, eq, gt);

    for(i = 0; i < 16; i = i + 1)begin
        {x, y} = i[3 : 0];
        #10;
    end

    $finish;
end

endmodule
*/