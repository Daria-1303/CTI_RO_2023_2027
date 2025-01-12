module pktmux #(
    parameter w=64
)(
    input wire [w - 1: 0] pkt, //pachet
    input wire [w - 1: 0] msg_len, //lungimea mesajului pe w biti
    input wire pad_pkt, //activa daca pachetul curent este de tip extensie
    input wire zero_pkt, //activa daca pachetul curent este de tip zero
    input wire mgln_pkt, //activa daca pachetul curent are lungimea mesajului
    output reg [w - 1: 0] o //iesirea multiplexorului
);

always @(*) begin
    if(pad_pkt == 1)
        o = 1 << (w - 1); //pachetul este de tip extensie
    else if(zero_pkt == 1)
        o = 0; //pachetul este de tip zero
    else if(mgln_pkt == 1)
        o = msg_len; //pachetul are lungimea mesajului
    else
        o = pkt; //pachetul este de tip mesaj
end

endmodule

module pktmux_tb;
    reg [63:0] pkt, msg_len;
    reg pad_pkt, zero_pkt, mgln_pkt;
    wire [63:0] o;

    pktmux #(
        .w(64)
    ) insta1(
        .pkt(pkt),
        .msg_len(msg_len),
        .pad_pkt(pad_pkt),
        .zero_pkt(zero_pkt),
        .mgln_pkt(mgln_pkt),
        .o(o)
    );

    localparam CYCLE = 100;

    initial begin
        {pad_pkt, zero_pkt, mgln_pkt} = 0;
        
        repeat(3) begin
            #(1 * CYCLE) {pad_pkt, zero_pkt, mgln_pkt} = 4;
            #(1 * CYCLE) {pad_pkt, zero_pkt, mgln_pkt} = 2;
            #(1 * CYCLE) {pad_pkt, zero_pkt, mgln_pkt} = 1;
            #(1 * CYCLE) {pad_pkt, zero_pkt, mgln_pkt} = 0;
        end
    end

    task urand64(output reg [63:0] r);
    begin
        r[63:32] = $urandom();
        r[31:0] = $urandom();
    end
    endtask

    integer k;

    initial begin
        urand64(pkt);
        urand64(msg_len);
        for(k = 1; k < 13; k = k + 1) begin
            #(1 * CYCLE);
            urand64(pkt);
            urand64(msg_len);
        end
    end

endmodule

/*
// sau

module pktmux_tb;
reg [63:0] msg_len, pkt;
reg pad_pkt, zero_pkt, mgln_pkt;
wire [63:0] o;

task urand64(output reg [63:0] r);
  begin
    r[63:32] = $urandom;
    r[31:0] = $urandom;
  end
endtask

pktmux cut(
  .msg_len(msg_len),
  .pkt(pkt),
  .pad_pkt(pad_pkt),
  .zero_pkt(zero_pkt),
  .mgln_pkt(mgln_pkt),
  .o(o)
);

initial begin
  pad_pkt = 0;
  zero_pkt = 0;
  mgln_pkt = 0;
  urand64(msg_len);
  urand64(pkt);
end

integer i;
initial begin
  for(i = 1; i <= 12; i = i + 1) begin
    #100; urand64(msg_len); urand64(pkt);
  end
end

initial begin
  #100; pad_pkt = 1;
  #100; pad_pkt = 0;
  #300; pad_pkt = 1;
  #100; pad_pkt = 0;
  #300; pad_pkt = 1;
  #100; pad_pkt = 0;
end

initial begin
  #200; zero_pkt = 1;
  #100; zero_pkt = 0;
  #300; zero_pkt = 1;
  #100; zero_pkt = 0;
  #300; zero_pkt = 1;
  #100; zero_pkt = 0;
end

initial begin
  #300; mgln_pkt = 1;
  #100; mgln_pkt = 0;
  #300; mgln_pkt = 1;
  #100; mgln_pkt = 0;
  #300; mgln_pkt = 1;
  #100; mgln_pkt = 0;
end
  
endmodule

*/