import java.util.ArrayList;

interface IAutovehicul{
    public double calculeazaGreutateTotala(); // greutate vehicul + greutate transportata
}

abstract class Autovehicul implements IAutovehicul{
    protected String numarInmatriculare;
    protected double greutateVehicul;

    public Autovehicul(String numarInmatriculare, double greutateVehicul){
        this.numarInmatriculare = numarInmatriculare;
        this.greutateVehicul = greutateVehicul;
    }
}

class Autoturism extends Autovehicul{
    private double greutatePasageri;

    public Autoturism(String numarInmatriculare, double greutateVehicul, double greutatePasageri){
        super(numarInmatriculare, greutateVehicul);
        this.greutatePasageri = greutatePasageri;
    }

    public double calculeazaGreutateTotala(){
        return greutateVehicul + greutatePasageri;
    }

    public String toString(){
        return "Numar inmatriculare : " + numarInmatriculare + " - Greutate vehicul : " + greutateVehicul + " - Greutate pasageri : " + greutatePasageri;
    }
}

class Camion extends Autovehicul{
    ArrayList<Autoturism> camion_cu_autoturisme;

    public Camion(String numarInmatriculare, double greutateVehicul){
        super(numarInmatriculare, greutateVehicul);
        this.camion_cu_autoturisme = new ArrayList<Autoturism>();
    }

    public void adaugaAutoturism(Autoturism autoturismDeAdaugat){
        if(!(camion_cu_autoturisme.contains(autoturismDeAdaugat))){
            camion_cu_autoturisme.add(autoturismDeAdaugat);
        }
    }

    public double calculeazaGreutateTotala(){
        double greutateTotala = greutateVehicul;

        for(Autoturism a : camion_cu_autoturisme){
            greutateTotala += a.calculeazaGreutateTotala();
        }

        return greutateTotala;
    }

    public String toString(){
        return "Camion - Nr Inmatriculare : " + numarInmatriculare + " Greutate autovehicul : " + greutateVehicul + "\n \t Autoturisme ->" + camion_cu_autoturisme.toString();
    }
}

class Bac{
    private double greutateMaxima;
    private ArrayList<Autovehicul> autovehiculeDePeBac;
    private double greutateCurenta; // sau putem calcula greutatea curenta la fiecare adaugare de autovehicul si implementarea metodei

    public Bac(double greutateMaxima){
        this.greutateMaxima = greutateMaxima;
        this.autovehiculeDePeBac = new ArrayList<Autovehicul>();
        this.greutateCurenta = 0;
    }

    public boolean adaugaAutovehicul(Autovehicul autovehiculDeAdaugat){
        if(greutateCurenta + autovehiculDeAdaugat.calculeazaGreutateTotala() > greutateMaxima){
            return false;
        }

        greutateCurenta += autovehiculDeAdaugat.calculeazaGreutateTotala();
        autovehiculeDePeBac.add(autovehiculDeAdaugat);

        return true;
    }

    public String toString(){
        return "Bac - Greutate maxima : " + greutateMaxima + "\n \t Autovehicule ->" + autovehiculeDePeBac.toString();
    }
}

class Bac2{
    private double greutateMaxima;
    private ArrayList<Autovehicul> autovehiculeDePeBac;
    private double greutateCurenta; // sau putem calcula greutatea curenta la fiecare adaugare de autovehicul si implementarea metodei

    public Bac2(double greutateMaxima){
        this.greutateMaxima = greutateMaxima;
        this.autovehiculeDePeBac = new ArrayList<Autovehicul>();
        this.greutateCurenta = 0;
    }

    public boolean adaugaAutovehicul(Autovehicul autovehiculDeAdaugat) throws DepasesteGreutateMaxima{
        if(greutateCurenta + autovehiculDeAdaugat.calculeazaGreutateTotala() > greutateMaxima){
            throw new DepasesteGreutateMaxima("Greutatea totala depaseste greutatea maxima");
            //return false;
        }

        greutateCurenta += autovehiculDeAdaugat.calculeazaGreutateTotala();
        autovehiculeDePeBac.add(autovehiculDeAdaugat);

        return true;
    }

    public String toString(){
        return "Bac - Greutate maxima : " + greutateMaxima + "\n \t Autovehicule ->" + autovehiculeDePeBac.toString();
    }
}

class DepasesteGreutateMaxima extends Exception{
    public DepasesteGreutateMaxima(String mesaj){
        super(mesaj);
    }
}

class Main{
    public static void main(String[] args) {
        Autoturism a1 = new Autoturism("CS 13 SKY", 4, 0.3);
        Autoturism a2 = new Autoturism("CS 26 SKY", 5, 0.25);
        Autoturism a3 = new Autoturism("CS 04 SKY", 4.5, 0.15);

        Camion c1 = new Camion("MH 78 FIL", 10);

        c1.adaugaAutoturism(a1);
        c1.adaugaAutoturism(a2);

        Bac b1 = new Bac(20);
        b1.adaugaAutovehicul(c1);
        b1.adaugaAutovehicul(a3); // nu l va afisa din cauza greutatii

        System.out.println(b1.toString());
    }
}

class Main2{
    public static void main(String[] args) {
        Autoturism a1 = new Autoturism("CS 13 SKY", 4, 0.3);
        Autoturism a2 = new Autoturism("CS 26 SKY", 5, 0.25);
        Autoturism a3 = new Autoturism("CS 04 SKY", 4.5, 0.15);

        Camion c1 = new Camion("MH 78 FIL", 10);

        c1.adaugaAutoturism(a1);
        c1.adaugaAutoturism(a2);

        Bac2 b1 = new Bac2(20);

        try{
            b1.adaugaAutovehicul(c1);
            b1.adaugaAutovehicul(a3); // nu l va afisa din cauza greutatii
        }catch(DepasesteGreutateMaxima e){
            System.out.println(e.getMessage());
        }

        System.out.println(b1.toString());
    }
}