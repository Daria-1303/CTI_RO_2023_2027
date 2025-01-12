/*
Implementează un program pentru o bancă care gestionează mai multe conturi bancare. 

Fiecare cont are un număr unic, un nume de titular și un sold. 

Creează două clase, Banca și ContBancar, și implementează:

adaugaCont(ContBancar cont): adaugă un cont în bancă doar dacă nu există deja un cont cu același număr unic.

afiseazaConturi(): afișează toate conturile în formatul "Număr Cont: [numar], 

Titular: [titular], Sold: [sold]".


soldTotal(): calculează și returnează soldul total al tuturor conturilor din bancă.

conturiSubSoldMinim(double soldMinim): returnează o listă cu toate conturile care au un sold mai 

mic decât valoarea specificată.
 */

class Client{
    public static void main(String []args){
        Banca banca = new Banca();

        ContBancar cont1 = new ContBancar(101, "Alice", 500.0);
        ContBancar cont2 = new ContBancar(102, "Bob", 1500.0);
        ContBancar cont3 = new ContBancar(103, "Charlie", 200.0);

        banca.adaugaCont(cont1);
        banca.adaugaCont(cont2);
        banca.adaugaCont(cont3);

        System.out.println(banca.toString());

        System.out.println("Sold total al conturilor: " + banca.soldTotal());

        String conturiSubMinim = banca.conturiSubSoldMinim(1000.0);
        System.out.println(conturiSubMinim);
    }
}