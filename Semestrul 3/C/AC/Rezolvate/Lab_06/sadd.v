module sadd(
  input clk, rst_b, x, y,
  output reg z
);
  // Se vor exemplifica etapa cu etapa pasii de implementare a unui FSM:
  //   de la definirea constantelor de stare, la determinarea numarului de biti 
  //   ai semnalelor st si st_nxt si pana la blocul always secvential care 
  //   actualizeaza starea curenta
  localparam S0=0, S1=1;
  reg st, st_nxt;
  always @ (*)
    case (st)
      S0: if (x&y)      st_nxt = S1;
          else          st_nxt = S0;
      S1: if (~x&(~y))  st_nxt = S0;
          else          st_nxt = S1;
    endcase
  always @ (*) begin
    z = 0;
    case (st)
      S0: if (x ^ y)    z = 1;
      S1: if (x ~^ y)   z = 1; 
    endcase
  end
  always @ (posedge clk, negedge rst_b)
    if (! rst_b)          st <= S0;
    else                  st <= st_nxt;
endmodule

module sadd_tb;
  reg clk, rst_b, x, y;
  wire z;
  sadd inst0(.clk(clk), .rst_b(rst_b), .x(x), .y(y), .z(z));
  localparam CLK_PERIOD=100; 
  localparam CLK_CYCLES=5;
  initial begin
    clk = 0;
    repeat (2*CLK_CYCLES)
      #(CLK_PERIOD/2) clk = 1 - clk;
  end
  localparam RST_PULSE=10;
  initial begin
    rst_b = 0;
    #(RST_PULSE) rst_b = 1;
  end
  initial begin
                    {x, y} = 'b01;
    #(1*CLK_PERIOD) {x, y} = 'b11;
    #(1*CLK_PERIOD) {x, y} = 'b10;
    #(1*CLK_PERIOD) {x, y} = 'b00;
  end
endmodule