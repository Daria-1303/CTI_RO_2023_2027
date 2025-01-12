// Solutie Problema 1
module fac (
    input x, y, ci,
    output co, z
);
    assign {co, z} = x + y + ci;
endmodule

// Solutie Problema 2 (partea I)
module fac_tb;
    // Pentru fiecare conexiune de intrare a modulului de testat (fac, in acest caz), 
    //     se prevede un semnal de tip reg cu acelasi nume si pe acelasi numar de biti
    reg x_tb, y, ci;
    // Pentru fiecare conexiune de iesire a modulului de testat (declarata ca output sau output reg), 
    //     se prevede un semnal de tip wire cu acelasi nume si pe acelasi numar de biti
    wire co, z;

    // Construirea instantei modulului de testat; fiecarei conexiuni a modulului de testat i se asociaza
    //     un semnal (in cazul intrarilor sau iesirilor) sau o expresie (in cazul intrarilor); in cazul 
    //     instantei dintr-un modul testbench fiecarei conexiuni i se asociaza semnalul cu acelasi nume
    fac cut (.x(x), .y(y), .ci(ci), .co(co), .z(z));

    // Variabila contor, de tip integer
    integer k;
    initial begin
        // Urmatoarele 2 linii genereaza tabelul de adevar al modulului afisat in fereastra Transcript
        $display("Time\tx\ty\tci\t\tco\tz");
        $monitor("%0t\t%b\t%b\t%b\t\t%b\t%b", $time, x, y, ci, co, z);
        
        // Generarea exhaustiva a tuturor configuratiilor de intrare (modulul fac are 3 biti de intrare: x, 
        //     y, ci, in consecinta exista 2^3 = 8 configuratii posibile la intrarile modulului)
        for (k = 0; k < 8; k = k + 1) begin
            // Doar ultimii 3 biti ai intregului k sunt preluati de semnalele de tip reg x, y si ci
            {x, y, ci} = k;
            // Adaugarea unei intarzieri artificiale; din considerente de vizualizare a rezultatelor simularii
            #10; 
        end
    end
endmodule