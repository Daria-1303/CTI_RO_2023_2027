/* Construiti un modul Full Adder Cell (FAC). */
module FAC(input x, y, c_in, output  z, c_out);
  
   assign {c_out, z} = x + y + c_in;  
  
endmodule

/* Folosindu-va de module FAC, proiectati un sumator-scazator (adder_subtractor) cu w biti . */
module adder_subtractor #(parameter w=8)(input[w-1:0] x, y, input sub, output[w-1:0] z);
	wire[w-1:0] c;
	generate
	genvar j;
	for(j=0;j<w;j=j+1) begin: vect
			if(j==0)
			begin
				FAC f(.x(x[0]),.y(y[0]^sub + 1&sub),.z(z[0]),.c_in(1'b0),.c_out(c[j]));
			end
			else
			begin
				FAC f(.x(x[j]),.y(y[j]^sub+ 1&sub),.z(z[j]),.c_in(c[j-1]),.c_out(c[j]));
			end
	end
	endgenerate
endmodule

module adder_subtractor_tb;
    
    reg[2:0] x, y;
    reg sub;
    wire[2:0] z;

    adder_subtractor #(.w(3)) uut (.x(x), .y(y), .sub(sub), .z(z));

    integer k;
    initial begin
        $display("sub\tx\ty\t\tz");
        $monitor("%b\t%d\t%d\t\t%d", sub, x, y, z);
        for(k=0; k < 128; k = k + 1) begin
            {sub, x, y} = k;
            #10;
        end
    end
endmodule
