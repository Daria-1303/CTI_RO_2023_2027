module ex3 #(
    parameter w = 8
)(
    input clk,
    input rst_b,    // activ la 0
    input sh,   // activa la 1, pentru shiftare la dreapta
    input ld,   // activa la 1, pentru incarcare
    // prioritar rst_b > sh > ld
    input [w - 1 : 0] data_in, // datele de incarcat
    output reg [w - 1 : 0] data_out,
    output reg b_out
);

always @(posedge clk or negedge rst_b) begin
    if (!rst_b) begin
        // Reset: Clear data_out and set b_out to high-impedance
        data_out <= 0;
        b_out <= 1'bz;
    end else if (sh) begin
        // Right shift: Save lost bit in b_out
        b_out <= data_out[0];
        data_out <= {1'b0, data_out[w - 1:1]};
    end else if (ld) begin
        // Load: Set data_out to data_in and b_out to high-impedance
        data_out <= data_in;
        b_out <= 1'bz;
    end
end

endmodule

module ex3_tb;

reg clk;
reg rst_b;
reg sh;
reg ld;
reg [7:0] data_in;
wire [7:0] data_out;
wire b_out;

// Instantiate the DUT
ex3 #(
    .w(8)
) uut (
    .clk(clk),
    .rst_b(rst_b),
    .sh(sh),
    .ld(ld),
    .data_in(data_in),
    .data_out(data_out),
    .b_out(b_out)
);

// Generate clock signal
always #5 clk = ~clk;

initial begin
    // Initialize inputs
    clk = 0; rst_b = 0; sh = 0; ld = 0; data_in = 8'b0;

    $display("Time | rst_b | ld | sh | data_in   | data_out  | b_out");
    $monitor("%4t |   %b   | %b  | %b  | %b | %b | %d", 
             $time, rst_b, ld, sh, data_in, data_out, b_out);

    // Test 1: Reset
    #10 rst_b = 1; // Release reset
    #10 rst_b = 0; // Assert reset
    #10 rst_b = 1; // Release reset again

    // Test 2: Load data
    #10 ld = 1; data_in = 8'b10101010;
    #10 ld = 0;

    // Test 3: Shift right once
    #10 sh = 1;
    #10 sh = 0;

    // Test 4: Multiple shifts
    #10 sh = 1; #10 sh = 0; // Shift again
    #10 sh = 1; #10 sh = 0; // Shift again

    // Test 5: Load new data
    #10 ld = 1; data_in = 8'b11110000;
    #10 ld = 0;

    // Test 6: Shift after load
    #10 sh = 1;
    #10 sh = 0;

    $stop;
end

endmodule

