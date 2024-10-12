module div3 (
  input [3:0] i,
  output reg [2:0] o // Ie?irea trebuie s? fie reg pentru a fi atribuit? într-un bloc always
);

reg [3:0] temp;   // Variabil? temporar? pentru stocarea valorii lui i
reg [2:0] count;  // Contor pentru cât

always @(*) begin
    temp = i;     
    count = 0;     

    while (temp >= 3) begin
        temp = temp - 3;      
        count = count + 1;    
    end
    
    o = count;  
end

endmodule


module div3_tb;
  reg [3:0] i;
  wire [2:0] o;

  div3 div3_i (.i(i), .o(o));

  integer k;
  initial begin
    $display("Time\ti\t\to");
    $monitor("%0t\t%b(%2d)\t%b(%0d)", $time, i, i, o, o);
    i = 0;
    for (k = 1; k < 16; k = k + 1)
      #10 i = k;
  end
endmodule