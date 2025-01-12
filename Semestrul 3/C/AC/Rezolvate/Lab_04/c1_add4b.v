// Modul aditional, de adunare a doua numere pe 4 biti
module add4b (
    input [3:0] x, y, input ci,
    output [3:0] z, output co
);
    wire c2;
    add2b inst1 (.x(x[1:0]), .y(y[1:0]), .ci(ci), .co(c2), .z(z[1:0]));
    add2b inst2 (.x(x[3:2]), .y(y[3:2]), .ci(c2), .co(co), .z(z[3:2]));
endmodule

// Modul de adunare a doua numere in C1 pe 4 biti
module c1_add4b (
    input [3:0] x, y, input ci,
    output [3:0] z
);
    // Semnal pentru rezultatul intermediar al adunarii intre x si y
    wire [3:0] temp; 
    // Semnal pentru end around carry, de adunat rezultatului intermediar
    wire co;
    add4b inst1 (.x(x), .y(y), .ci(ci), .co(co), .z(temp));
    add4b inst2 (.x(temp), .y(4'd0), .ci(co), .co(), .z(z));
endmodule

module c1add4b_tb;
    reg [3:0] x, y; reg ci;
    wire [3:0] z; wire co;

    c1_add4b cut (.x(x), .y(y), .ci(ci), .z(z));

    function integer ToDecimal(input [3:0] c1_val); 
    begin
        if (c1_val[3])
            ToDecimal = {{29{c1_val[3]}}, c1_val[2:0]} + 1'd1;
        else
            ToDecimal = c1_val[2:0];
    end
    endfunction

    integer k;
    initial begin
        $display("Time\tx\ty\tci\t\tz");
        $monitor("%0t\t%b(%2d)\t%b(%2d)\t%b\t\t%b(%2d)", $time, x, ToDecimal(x), y, ToDecimal(y), ci, z, ToDecimal(z));
        
        for (k = 0; k < 512; k = k + 1) begin
            {x, y, ci} = k;
            #10;
        end
    end
endmodule