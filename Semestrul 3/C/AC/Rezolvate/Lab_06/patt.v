// Se va construi mai intai diagrama tranzitiilor de stare
// Sunt furnizate 2 diagrame: pentru cazul in care tiparele 
//   sunt suprapuse si, respectiv cand nu sunt suprapuse
// Implementarea de mai jos considera tipare suprapuse

// Pentru a creste gradul de dificultate al exercitiului, se pot
// considera tipare mai complexe (pe 5/6 biti)
module patt(
  input clk, rst_b, i,
  output o
);
  localparam S0=0, S1=1, S2=2, S3=3, S4=4;
  reg [2:0] st, st_nxt;
  always @ (*)
    case (st)
      S0:       st_nxt = i ? S1 : S0;
      S1:       st_nxt = i ? S1 : S2;
      S2:       st_nxt = i ? S3 : S0;
      S3:       st_nxt = i ? S4 : S2;
      S4:       st_nxt = i ? S1 : S2;
      default:  st_nxt = S0;
    endcase
  assign o = (st == S4);
  always @ (posedge clk, negedge rst_b)
    if (! rst_b)          st <= S0;
    else                  st <= st_nxt;
endmodule

module patt_tb;
  reg clk, rst_b, i;
  wire o;
  patt inst0(.clk(clk), .rst_b(rst_b), .i(i), .o(o));
  localparam CLK_PERIOD=100, CLK_CYCLES=8, RST_PULSE=10;
  initial begin
    clk = 0;
    repeat (2*CLK_CYCLES) #(CLK_PERIOD/2) clk = 1 - clk;
  end
  initial begin
    rst_b = 0;
    #(RST_PULSE) rst_b = 1;
  end
  initial begin
                    i = 1;
    #(1*CLK_PERIOD) i = 0; 
    #(1*CLK_PERIOD) i = 1;
    #(2*CLK_PERIOD) i = 0;
    #(1*CLK_PERIOD) i = 1;
  end
endmodule