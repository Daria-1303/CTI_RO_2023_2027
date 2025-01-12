// module ce numara front urile crescatoare ale semnalului clk pentru care val ramane constanta
module ex4(
    input clk,
    input [7 : 0] val, 
    output  reg [7:0] out
);

reg [7 : 0] valoare_anterioara;

always @(posedge clk) begin
    if(val == valoare_anterioara) begin  
        // daca valoarea este aceeasi cu cea anterioara, atunci incrementam numarul de fronturi
        out <= out + 1;
    end
    else begin
        out <= 0;
    end

    valoare_anterioara <= val;
end

endmodule

module ex4_tb;

localparam CLK_PERIOD = 10; // Perioada semnalului de ceas
reg clk;
reg [7:0] val;
wire [7:0] out;

// Instanțierea modulului
ex4 uut (
    .clk(clk),
    .val(val),
    .out(out)
);

// Generare semnal de ceas
always #(CLK_PERIOD / 2) clk = ~clk;

// Teste
initial begin
    // Inițializări
    clk = 0;
    val = 8'b0;

    $display("Time | val       | out");
    $monitor("%4t | %b | %d", $time, val, out);

    // Test 1: `val` rămâne constant
    #CLK_PERIOD val = 8'b00000011; // Inițializare
    #CLK_PERIOD val = 8'b00000011; // `val` constant
    #CLK_PERIOD val = 8'b00000011; // `val` constant
    #CLK_PERIOD val = 8'b00000011; // `val` constant
    // Așteptare: `out` să crească la fiecare front de ceas

    // Test 2: `val` se schimbă
    #CLK_PERIOD val = 8'b00000100; // `val` diferit
    // Așteptare: `out` să revină la 0

    // Test 3: `val` constant din nou
    #CLK_PERIOD val = 8'b00000100; // `val` constant
    #CLK_PERIOD val = 8'b00000100; // `val` constant
    // Așteptare: `out` să crească din nou

    // Test 4: Schimbări rapide
    #CLK_PERIOD val = 8'b00000101;
    #CLK_PERIOD val = 8'b00000110;
    #CLK_PERIOD val = 8'b00000101;
    #CLK_PERIOD val = 8'b00000110;

    #CLK_PERIOD $stop; // Încheierea simulării
end

endmodule
