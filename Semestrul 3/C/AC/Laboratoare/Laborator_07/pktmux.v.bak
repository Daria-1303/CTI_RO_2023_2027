module pktmux #(
    parameter w=64
)(
    input wire [w - 1: 0] pkt, //pachet
    input wire [w - 1: 0] msg_len, //lungimea mesajului pe w bi?i
    input wire pad_pkt, //activa dac? pachetul curent este de tip extensie
    input wire zero_pkt, //activa dac? pachetul curent este de tip zero
    input wire mgln_pkt, //activa dac? pachetul curent are lungimea mesajului
    output reg [w - 1: 0] o //ie?irea multiplexorului
);

reg [w-1:0] zero = 0;
reg [w-1:0] pad = ~0 << (w-1);

always @(*) begin
    if (pad_pkt) o = pad;
    else if (zero_pkt) o = zero;
    else if (mgln_pkt) o = msg_len;
    else o = pkt;
end

endmodule

module pktmux_tb;

reg clk;
reg [63:0] pkt, msg_len;
reg pad_pkt, zero_pkt, mgln_pkt;
wire [63:0] out;

pktmux #(
    .w(64)
) pktmux_inst (
    .pkt(pkt),
    .msg_len(msg_len),
    .pad_pkt(pad_pkt),
    .zero_pkt(zero_pkt),
    .mgln_pkt(mgln_pkt),
    .o(out)
);

localparam CLK_PULSE = 100, RUNNING_CYCLES = 13;

// Clock generation block
initial begin 
    clk = 0;
    repeat (RUNNING_CYCLES) #(CLK_PULSE) clk = ~clk;
end

// Task to generate random numbers
task urand64(output reg[63:0] r);
    begin
        r[63:32] = $urandom;
        r[31:0] = $urandom;
    end
endtask

// Random number generation block
initial begin
    repeat (RUNNING_CYCLES) begin
        urand64(pkt);
        urand64(msg_len);
        #CLK_PULSE;
    end
end

initial begin
    $display("pad | zero | mgln | pkt | msg_len");
    $monitor(" %b  |  %b  | %b  |  %x | %x | %x", pad_pkt, zero_pkt, mgln_pkt, pkt, msg_len, out);

    pad_pkt = 0;
    zero_pkt = 0;
    mgln_pkt = 0;

    #CLK_PULSE 
    pad_pkt = 1;
    zero_pkt = 0;
    mgln_pkt = 0;

    #CLK_PULSE 
    pad_pkt = 0;
    zero_pkt = 1;
    mgln_pkt = 0;

    #CLK_PULSE 
    pad_pkt = 0;
    zero_pkt = 0;
    mgln_pkt = 1;

    #CLK_PULSE 
    pad_pkt = 0;
    zero_pkt = 0;
    mgln_pkt = 0;

    #CLK_PULSE 
    pad_pkt = 1;
    zero_pkt = 0;
    mgln_pkt = 0;

    #CLK_PULSE 
    pad_pkt = 0;
    zero_pkt = 1;
    mgln_pkt = 0;

    #CLK_PULSE 
    pad_pkt = 0;
    zero_pkt = 0;
    mgln_pkt = 1;

    #CLK_PULSE
    pad_pkt = 0;
    zero_pkt = 0;
    mgln_pkt = 0;

    #1

    $finish;

end

endmodule
