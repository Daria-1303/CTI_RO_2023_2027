module counter #(
	parameter width = 8,
	parameter initValue = 8'hff
)(
	input wire clk,
	input wire rst_b, //asincron, activ la 0 -> aduce continutul la valoarea initiala
	input wire c_up, // sincron, activ la 1, incrementeaza continutul
	input wire clr, // sincron, activ la 1, seteaza continutul la valoarea iniyiala, are prioritate mai mare decat c_up
	output reg [width - 1 : 0] q
);


//blocul asincron

always @(posedge clk or negedge rst_b) begin
	if(!rst_b) begin
		q<= initValue;  //reset la valoarea initiala daca rst_b == 0
	end else begin
		if(clr) begin
			q <= initValue; //reset la valoarea initiala daca clr este 1, cu prioritate mai mare decat c_up
		end else if(c_up) begin
				q <= q + 1;
			end
		end

end

endmodule

module tb_counter;

	parameter width = 9;
	parameter initValue = 8'hff;
	
	reg clk, rst_b, c_up, clr;
	wire [width - 1 : 0] q;

counter #(
	.width(width),
        .initValue(initValue)
) uut (
        .clk(clk),
        .rst_b(rst_b),
        .c_up(c_up),
        .clr(clr),
        .q(q)
    );

//semnalul de ceas

always #5 clk = ~clk; // 100 MHz clock period (10 ns)

  // Test sequence
  initial begin
    $display("clk rst c_up clr");
    $monitor("%b   %b    %b    %b | %h", clk, rst_b, c_up, clr, q);
    // Initialize signals
    clk = 0;
    rst_b = 1;  // Not in reset
    c_up = 0;
    clr = 0;

    // Apply reset
    #10 rst_b = 0; // Assert reset
    #10 rst_b = 1; // Deassert reset

    // Start counting
    #10 c_up = 1;
    #50 c_up = 0; // Stop counting

    // Apply clear signal
    #10 clr = 1; // Assert clear
    #10 clr = 0; // Deassert clear

    // Finish simulation
    #10 $finish;
  end
	
endmodule
