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

/* sau am putea  scrie cu output reg

always @(*) begin
    if (x == y) begin
        eq = 1;
        lt = 0;
        gt = 0;
    end else if (x < y) begin
        eq = 0;
        lt = 1;
        gt = 0;
    end else begin
        eq = 0;
        lt = 0;
        gt = 1;
    end

*/

endmodule

module cmp2b_tb;

	reg [1:0] x, y;
	wire eq, lt, gt;
cmp2b uut (
    .x(x), 
    .y(y), 
    .eq(eq), 
    .lt(lt), 
    .gt(gt)
);

	
integer i;

initial begin
    $display("x  y | eq lt gt");
    $display("-----------|------");

   
    for(i = 0; i < 16; i = i + 1) begin
        {x, y} = i[3:0];  
        #20; 

        $display("%b %b | %b  %b  %b", x, y, eq, lt, gt);
    end

   $finish; 
end

endmodule

