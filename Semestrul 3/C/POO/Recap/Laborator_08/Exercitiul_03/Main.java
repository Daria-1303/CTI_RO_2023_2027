import java.util.*;

class Ghiseu{
    private ArrayList<Contribuabil> contribuabili = new ArrayList<Contribuabil>();

    public void adaugaContribuabil(Contribuabil contribuabil){
        contribuabili.add(contribuabil);
    }

    public int cautaContribuabil(String CNP){
        for(int i = 0; i < contribuabili.size(); i++){
            if(contribuabili.get(i).getCNP().equals(CNP)){
                return contribuabili.get(i).calculeazaCostTotal();
            }
        }
        //daca nu gaseste va afisa -1;
        return -1;
    }
}

class Contribuabil{
    private String nume;
    private String CNP;
    // probabil
    private int sumaPlata;
    // array list cu toate proprietatile unui contribuabil
    private ArrayList<Proprietate> proprietati = new ArrayList<Proprietate>();

    public Contribuabil(String nume, String CNP){
        this.nume = nume;
        this.CNP = CNP;
    }

    public String getCNP(){
        return CNP;
    }

    public void adaugaProprietate(Proprietate proprietate){
        proprietati.add(proprietate);
    }

    public int calculeazaCostTotal(){
        int sumaPlata = 0;

        for(Proprietate p : proprietati){
            sumaPlata += p.calculeazaCost();
        }

        return sumaPlata;
    }

    public String toString(){
        String text = "Contribuabil : " + nume + "\n" + "Proprietati : \n";

        for(Proprietate p : proprietati){
            text += "\t" + p.toString() + "\n";
        }

        text += "Suma totala : " + calculeazaCostTotal();

        return text;
    }
}

abstract class Proprietate{
    protected  Adresa adresa;
    protected  int suprafata;

    public Proprietate(Adresa adresa, int suprafata){
        this.adresa = adresa;
        this.suprafata = suprafata;
    }

    public abstract int calculeazaCost();

    public abstract String toString();
}

class Cladire extends Proprietate{
    public Cladire(Adresa adresa, int suprafata){
        super(adresa, suprafata);
    }

    public int calculeazaCost(){
        return 500 * suprafata;
    }

    public String toString(){
        return "Cladire : " +  adresa.toString() + "\n" +"\t \t Suprafata : " + suprafata + "\n" + "\t \tCost : " + calculeazaCost();
    }
}

class Teren extends Proprietate{
    private int rangLocalitate;

    public Teren(Adresa adresa, int suprafata, int rangLocalitate){
        super(adresa, suprafata);
        this.rangLocalitate = rangLocalitate;
    }

    public int calculeazaCost(){
        return 350 * suprafata / rangLocalitate;
    }

    public String toString(){
        return "Teren : " +  adresa.toString() + "\n" +"\t \tSuprafata : " + suprafata + "\n" + "\t \tCost : " + calculeazaCost();
    }
}

class Adresa{
    private String strada;
    private int numar;

    public Adresa(String strada, int numar){
        this.strada = strada;
        this.numar = numar;
    }

    public String toString(){
        return strada + " " + numar;
    }
}

class Main{
    public static void main(String[] args) {
        Ghiseu ghiseu = new Ghiseu();

        Contribuabil contribuabil1 = new Contribuabil("Ion Popescu", "1234567890123");
        Contribuabil contribuabil2 = new Contribuabil("Ionescu", "1234567890124");
        Contribuabil contribuabil3 = new Contribuabil("Popescu", "1234567890125");

        Adresa adresa1 = new Adresa("Strada V Parvan", 2);
        Adresa adresa2 = new Adresa("Strada Lugoj", 4);
        Adresa adresa3 = new Adresa("Strada3", 3);
        Adresa adresa4 = new Adresa("Strada4", 4);

        Proprietate cladire1 = new Cladire(adresa1, 20);
        Proprietate cladire2 = new Cladire(adresa2, 25);

        Proprietate teren1 = new Teren(adresa1, 10, 1);
        Proprietate teren2 = new Teren(adresa4, 400, 3);

        contribuabil1.adaugaProprietate(cladire1);
        contribuabil1.adaugaProprietate(teren1);
        contribuabil1.adaugaProprietate(cladire2);
        contribuabil2.adaugaProprietate(cladire2);
        contribuabil2.adaugaProprietate(teren2);
        contribuabil3.adaugaProprietate(cladire1);
        contribuabil3.adaugaProprietate(teren2);

        ghiseu.adaugaContribuabil(contribuabil1);
        ghiseu.adaugaContribuabil(contribuabil2);
        ghiseu.adaugaContribuabil(contribuabil3);

        System.out.println(ghiseu.cautaContribuabil("1234567890123"));
        System.out.println(ghiseu.cautaContribuabil("1234567890124"));
        System.out.println(ghiseu.cautaContribuabil("1234567890127"));

        System.out.println("\n");

        System.out.println(contribuabil1.toString());

    }       
}