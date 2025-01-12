module fac(
    input x,
    input y,
    input carry_in,
    output z,
    output carry_out
);

assign z = x ^ y ^ carry_in;
assign carry_out = (x & y) | (x & carry_in) | (y & carry_in);

endmodule

module fac_tb;
//intrari
reg x;
reg y;
reg carry_in;
//iesiri
wire z;
wire carry_out;

//Instantierea modulului

fac fac1(
    .x(x),
    .y(y),
    .carry_in(carry_in),
    .z(z),
    .carry_out(carry_out)
);

integer i;

initial begin 
    $display("x - y - carry_in - z - carry_out");
    $monitor("%b - %b - %b        - %b - %b", x, y, carry_in, z, carry_out);

    for(i = 0; i < 8; i = i + 1)begin
        {x, y, carry_in} = i;
        #10;
    end

    $finish;
    
end

endmodule