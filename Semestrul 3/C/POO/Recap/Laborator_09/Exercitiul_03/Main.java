/*
 +------------------+           +------------------+           +------------------+
|   SumaTotala     |           |   ContBancar     |           |     Client       |
+------------------+           +------------------+           +------------------+
| + getSumaTotala()|<--------  | - numarCont      |           | - nume           |
+------------------+           | - suma           |           | - adresa         |
                               |                  |           | - conturi        |
                               +------------------+           +------------------+
                               ^         ^                    | + afisare()      |
                               |         |                    +------------------+
                 +-------------+         +-------------+             
                 | ContLei                   | ContEuro               |      
                 +------------------+        +------------------+      
                 | + transfer()     |        | + getDobanda()   |      
                 +------------------+        +------------------+      
                          

*/
import java.util.ArrayList;

interface SumaTotala{
    public float getSumaTotala();
}

abstract class ContBancar implements SumaTotala{
    protected String numarCont;
    protected float suma;
    
    public ContBancar(String numarCont, float suma){
        this.numarCont = numarCont;
        this.suma = suma;
    }
}

class ContLei extends ContBancar{

    public ContLei(String numarCont, float suma){
        super(numarCont, suma);
    }

    public float getSumaTotala(){
        return suma;
    }

    public void transfer(ContBancar contDestinatie, float sumatransfer){
        if(this.suma >= sumatransfer){
            this.suma -= sumatransfer;
            contDestinatie.suma += sumatransfer;
            System.out.println("Transfer efectuat cu succes");
        }
        else{
            System.out.println("Nu aveti suficienti bani pentru a efectua transferul");
        }
    }
    
}

class ContEuro extends ContBancar{

    public ContEuro(String numarCont, float suma){
        super(numarCont, suma);
    }

    public float getDobanda(){
        if(suma > 500){
            return 0.3f;
        }
        return 0.0f;
    }

    public float getSumaTotala(){
        return suma * 36000f;
    }
}

class Client{
    private String nume;
    private String adresa;
    private ArrayList<ContBancar> conturi;

    public Client(String nume, String adresa){
        this.nume = nume;
        this.adresa = adresa;
        this.conturi = new ArrayList<ContBancar>(5);
    }

    public void adaugaCont(ContBancar cont){
        conturi.add(cont);
    }

    public String getNume(){
        return nume;
    }

    public String toString(){
        return "Nume: " + nume + " Adresa: " + adresa;
    }

    public ArrayList<ContBancar> getConturi(){
        return conturi;
    }
}

class Banca{
    private ArrayList<Client> clienti;
    private String codBanca;

    public Banca(String codBanca){
        this.codBanca = codBanca;
        this.clienti = new ArrayList<Client>(100);
    }

    public void adaugaClient(Client client){
        // adauga doar daca nu exista deja
        if(!clienti.contains(client)){
            clienti.add(client);
        }
    }

    public void afisareClient(String nume){
        for(Client client : clienti){
            if(client.getNume().equals(nume)){
                System.out.println(client.toString());
                for(ContBancar cont : client.getConturi()){
                    System.out.println("Suma totala : " + cont.getSumaTotala() + "\n");
                }
            }
        }
    }
}

class Main{
    public static void main(String[] args) {
        Banca banca = new Banca("BCR");
        Client client = new Client("Popescu", "Bucuresti");
        ContBancar contLei = new ContLei("RO123", 1000);
        ContBancar contEuro = new ContEuro("EU123", 1000);
        client.getConturi().add(contLei);
        client.getConturi().add(contEuro);
        banca.adaugaClient(client);
        banca.afisareClient("Popescu");
    }
}
