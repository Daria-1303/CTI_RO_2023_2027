module counter #(
    parameter w = 8,  // parametru de latime
    parameter iv = 8'hff  // parametrul de valoare initiala
) (
    input clk, rst_b, c_up, clr,
    output reg [w-1:0]q
);
    always @(posedge clk, negedge rst_b) begin //dupa posedge clk se adauga
    // toate semnalele asincrone (cum este semnalul rst_b in acest exemplu)
    // introduse prin posedge, daca sunt active la 1 sau negedge altfel; in 
    // cazul acesta, rst_b fiind activ la 0 este introdus prin negedge
        
        // in blocul always secvential, prima data sunt testate semnalele de comanda asincrone
        if (! rst_b)                q <= iv; // semnalul reset initializeaza contorul
        // dupa testarea intrarilor de comanda asincrone, sunt verificate cele sincrone
        else if (clr)               q <= iv; // semnalul clr este verificat primul pentru ca
                                             // are prioritate mai mare decat c_up
        else if (c_up)              q <= q + 1;
    end
endmodule

// in acest modul testbench, unitatea counter testata va avea parametrii:
//     w  = 8
//     iv = 8'hff
// conform cerintei problemei
module counter_tb;
    reg clk, rst_b, c_up, clr;
    wire [7:0] q; // expresia [w-1:0] din linia 6 devine in testbench [7:0] in urma inlocuirii
                  // lui w cu 8 si a calcularii expresiei w-1
    
    counter #(.w(8), .iv(8'hff)) dut(.clk(clk), .rst_b(rst_b), .c_up(c_up), .clr(clr), .q(q));
    // valorile parametrilor sunt modificate intr-un set de paranteze introduse prin simbolul #
    // intre aceste paranteze, valorile parametrilor sunt atributi ca si la conectarea porturilor:
    // folosind punctul urmat de numele parametrului iar intre paranteze de valoarea lui

    // generarea semnalului de clock se face, cvasi-intodeauna prin codul de mai jos; parametrii
    // semnalului de clock (perioada si numarul de impulsuri) sunt alese prin valorile constantelor
    // CLK_PERIOD si RUNNING_CYCLES
    localparam CLK_PERIOD=100, RUNNING_CYCLES=7;
    initial begin
        clk=0;
        repeat (2*RUNNING_CYCLES) #(CLK_PERIOD/2) clk=~clk;
    end
    // generarea semnalului de reset se face, prin codul de mai jos; durata de activare a semnalului
    // de reset este specificat prin constanta RST_DURATION
    localparam RST_DURATION=5;
    initial begin
        rst_b=0;
        #RST_DURATION rst_b=~rst_b;
    end

    // celelalte intrari (sincrone) pot fi generate in blocuri initial separate sau pot fi generate 
    // impreuna intr-un singur bloc initial ca mai jos
    initial begin
        c_up = 1; clr = 0;
        #(2*CLK_PERIOD) clr = 1;
        #(1*CLK_PERIOD) clr = 0;
        #(1*CLK_PERIOD) c_up = 0;
        #(1*CLK_PERIOD) c_up = 1;
    end
endmodule

// pentru simularea acestui testbench, se va folosi fereastra semnalelor de unda (activata 
// in Modelsim de la meniul view -> Wave)
// in sensul acesta, se vor adauga la finalul fisierului script comenzile de mai jos:
//   add wave *
//   run -all