module mux_2s #(
    parameter w = 4
) (
    input [w-1:0] d0, d1, d2, d3,
    input [1:0] s,
    output [w-1:0] o
);

    wire [3:0] dout; //decoder out; cei 4 biti de iesire ai decodificatorului
    dec_2s inst0(.s(s), .e(1'd1), .o(dout));
    // se construiesc caile de propagae a datelor de la fiecare intrare (d0, d1, d2, d3)
    // spre iesire; fiecare din cele 4 cai de propagare va avea un driver tri-state
    // comandat de o linie de iesire a decodificatorului
    assign o = (dout[0]) ? d0 : {w{1'bz}}; // {w{1'bz}} replica bitul 1'bz (impedanta ridicata) pe w biti
    assign o = (dout[1]) ? d1 : {w{1'bz}}; // fiecare assign verifica starea semnalului dout[k]; daca acesta
    assign o = (dout[2]) ? d2 : {w{1'bz}}; // este adevarat, assign-ul va atribui iesirii valoarea intrarii d[k]
    assign o = (dout[3]) ? d3 : {w{1'bz}};
endmodule

// desi enuntul nu solicita construirea modulului testbench, mai jos este prezentat un astfel de modul
// impreuna cu fisierul script
module mux2s_tb;
    reg [7:0] d0, d1, d2, d3;
    reg [1:0] s;
    wire [7:0] o;

    mux_2s #(.w(8)) dut(.s(s), .d0(d0), .d1(d1), .d2(d2), .d3(d3), .o(o));

    integer k;
    initial begin
        $display("d0_16\td1_16\td2_16\td3_16\ts_10\t||\to_16");
        $monitor("%h\t%h\t%h\t%h\t%d\t||\t%h", d0, d1, d2, d3, s, o);
        for (k = 0; k < 16; k = k + 1) begin
            {d3, d2, d1, d0} = $urandom();
            s = $urandom();
            #10;
        end
    end
endmodule