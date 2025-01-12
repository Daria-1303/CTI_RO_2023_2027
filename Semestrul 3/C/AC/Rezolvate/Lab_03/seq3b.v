module seq3b (
  input [3:0] i,
  output reg o
);
  /*configuratii binare continand secvente binare de 3 biti consecutivi
    de aceeasi valoare: 0000, 0001, 0111, 1000, 1110, 1111*/
  always @(*)
    case (i)
      0, 1, 7, 8, 14, 15: o = 1;
      default: o = 0;
    endcase
  /*un exercitiu cu cerinta usor modificata: identificarea tuturor
    configuratiilor de la intrare care au 3 biti consecutivi de acceasi
    valoare, considerand configuratia de la intrare circulara: bitul i[3]
    este vecin cu bitul i[0]; in acest caz se adauga suplimentar fata de 
    solutia de mai sus siconfiguratiile: 0010, 0100, 1011, 1101*/
endmodule

module seq3b_tb;
  reg [3:0] i;
  wire o;

  seq3b seq3b_i (.i(i), .o(o));

  integer k;
  initial begin
    $display("Time\ti\t\to");
    $monitor("%0t\t%b(%2d)\t%b", $time, i, i, o);
    i = 0;
    for (k = 1; k < 16; k = k + 1)
      #10 i = k;
  end
endmodule