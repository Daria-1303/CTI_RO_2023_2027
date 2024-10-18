module cmp4b(
	input [3:0] x,
	input [3:0] y,
	output eq,
	output lt,
	output gt
);

wire eq0, lt0, gt0;
wire eq1, lt1, gt1;

//primii doi biti

cmp2b cmp0(.x(x[1:0]), 
        .y(y[1:0]), 
        .eq(eq0), 
        .lt(lt0), 
        .gt(gt0)
);

//urm 2 biti

cmp2b cmp1 (
        .x(x[3:2]), 
        .y(y[3:2]), 
        .eq(eq1), 
        .lt(lt1), 
        .gt(gt1)
);

assign eq = eq0 & eq1;
assign lt = lt1 | (eq1 & lt0);
assign gt = gt1 | (eq1 & gt0);

endmodule

module cmp4b_tb;

reg [3:0] x;
reg [3:0] y;

wire eq;
wire lt;
wire gt;

cmp4b uut (
    .x(x), 
    .y(y), 
    .eq(eq), 
    .lt(lt), 
    .gt(gt)
);

integer i;

initial begin
    $monitor("Timp: %0d | x: %b, y: %b | eq: %b, lt: %b, gt: %b", $time, x, y, eq, lt, gt);
    $display("x     y    | eq lt gt");
    $display("----------------------");
	for(i = 0; i < 256; i = i + 1) begin
        	{x, y} = i[7:0]; 
        	#10; 

        	$display("%b %b | %b  %b  %b", x, y, eq, lt, gt);
    	end

    $finish; 
end

endmodule
