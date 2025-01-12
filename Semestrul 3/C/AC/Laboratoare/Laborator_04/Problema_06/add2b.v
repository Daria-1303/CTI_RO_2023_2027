module add2b(
	input [1:0] x,
	input [1:0] y,
	input ci,
	output [1:0] z,
	output co
);

	wire c1;

	fac fac0( .x(x[0]), .y(y[0]), .ci(ci), .z(z[0]), .co(c1));
	fac fac1( .x(x[1]), .y(y[1]), .ci(c1), .z(z[1]), .co(co));

endmodule

module add2b_tb;
    reg [1:0] x, y;
    reg ci;
    wire [1:0] z;
    wire co;

    add2b uut(.x(x), .y(y), .ci(ci), .z(z), .co(co));

    integer i;

    initial begin
        $display("x  y  ci | z  co");
        $display("-----------|------");

        for(i = 0; i < 32; i = i + 1) begin
            {x, y, ci} = i;  
            #20;            
            $display("%b %b %b | %b %b", x, y, ci, z, co);
        end

        $finish; 
    end

endmodule
