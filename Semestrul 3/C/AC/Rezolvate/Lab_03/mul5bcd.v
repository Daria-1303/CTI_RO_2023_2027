module mul5bcd (
  input [3:0] i,
  output reg [3:0] d, u
);
  always @(*) begin
    /*cifra unitatilor (u) este fie 0 fie 5, functie de paritatea
      numarului de la intrare, data de i[0]: cand este 0 => intrarea
      este o valoare para; altfel, este o valoare impara*/
    u = {1'd0, i[0], 1'd0, i[0]};
    /*implementare alternativa
    if (i[0])
      u = 4'd5;
    else
      u = 4'd0;
    */
    /*cifra zecilor are valoarea egala cu valoarea numarului de la
      intrare div 2; exemplu: cand i = 7 => cifra zecilor in rezultat
      va fi 3 (5*7=35)*/
    d = {1'd0, i[3:1]};
    /*implementare alternativa
    d = i / 2;
    */
  end
endmodule

module mul5bcd_tb;
  reg [3:0] i;
  wire [3:0] d, u;

  mul5bcd mul5bcd_i (.i(i), .d(d), .u(u));

  integer k;
  initial begin
    $display("Time\ti\t\td\t\tu");
    $monitor("%0t\t%b(%4d)\t%b(%4d)\t%b(%4d)", $time, i, i, d, d, u, u);
    i = 0;
    for (k = 1; k < 10; k = k + 1)
      #10 i = k;
  end
endmodule