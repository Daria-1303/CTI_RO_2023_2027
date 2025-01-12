module add2b (
    input [1:0] x_i, y, 
    input ci,
    output [1:0] z, 
    output co
);
    wire c1;
    fac inst1 (.x(x[0]), .y(y[0]), .ci(ci), .co(c1), .z(z[0]));
    fac inst2 (.x(x[1]), .y(y[1]), .ci(c1), .co(co), .z(z[1]));
endmodule

module add2b_tb;
    reg [1:0] x_in, y; 
    reg ci;
    wire [1:0] z; w
    wire co;

    add2b cut (.x_i(x_in), .y(y), .ci(ci), .co(co), .z(z));

    integer k;
    initial begin
        $display("Time\tx\ty\tci\t\tco\tz");
        // Pentru valori pe 2 biti se va afisa, in paranteza) valoarea zecimala corespunzatoare
        // Rezultatul va fi afisat, intre paranteze, ca valoare zecimala corespunzatoare
        $monitor("%0t\t%b(%d)\t%b(%d)\t%b\t\t%b\t%b (%d)", $time, x, x, y, y, ci, co, z, {co, z});
        
        // Generarea exhaustiva a tuturor configuratiilor de intrare (modulul add2b are 5 biti de intrare: 
        //     2 pentru x, 2 pentru y, 1 pentru ci, in consecinta exista 2^5 = 32)
        for (k = 0; k < 32; k = k + 1) begin
            {x, y, ci} = k;
            #10;
        end
    end
endmodule