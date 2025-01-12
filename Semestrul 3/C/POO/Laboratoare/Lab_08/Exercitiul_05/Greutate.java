abstract class Greutate{
    private int capacitate;

    public abstract int capacitate();
}

class GreutateSimpla extends Greutate{
    private int capacitate;

    public GreutateSimpla(int capacitate){
        this.capacitate = capacitate;
    }

    public int capacitate(){
        return capacitate;
    }
}

class GreutatiDuble extends Greutate{
    private Greutate g1;
    private Greutate g2;

    public GreutatiDuble(Greutate g1, Greutate g2){
        this.g1 = g1;
        this.g2 = g2;
    }

    public void setGreutate1(Greutate g){
        this.g1 = g;
    }

    public void setGreutate2(Greutate g){
        this.g2 = g;
    }

    public int capacitate(){
        return g1.capacitate() + g2.capacitate();
    }
}

class GreutateMultipla extends Greutate{
    Greutate []greutatiMultiple = new Greutate[10];

    public GreutateMultipla(Greutate []greutatiMultiple){
        this.greutatiMultiple = greutatiMultiple;
    }

    public int capacitate(){
        int capacitateTotala = 0;

        for(Greutate g : greutatiMultiple){
            capacitateTotala += g.capacitate();
        }

        return capacitateTotala;
    }
}

class ColectieGreutati{
    private Greutate []greutati; // array de greutati merge instantiat 
    private int capacitateMaxima;
    private int numarCurent;

    public ColectieGreutati(int capacitateMaxima) {
        this.capacitateMaxima = capacitateMaxima;
        this.greutati = new Greutate[capacitateMaxima];
        this.numarCurent = 0;
    }

    public void adauga(Greutate g) {
        if (numarCurent < capacitateMaxima) {
            greutati[numarCurent++] = g;
        } else {
            System.out.println("Colectia este plină!");
        }
    }

    public double medie() {
        if (numarCurent == 0) {
            return 0;
        }
        int suma = 0;
        for (int i = 0; i < numarCurent; i++) {
            suma += greutati[i].capacitate();
        }
        return (double) suma / numarCurent;
    }
}

class Client{
    public static void main(String[] args) {
        ColectieGreutati colectie = new ColectieGreutati(10);

        GreutateSimpla g1 = new GreutateSimpla(10);
        GreutateSimpla g2 = new GreutateSimpla(20);
        GreutateSimpla g3 = new GreutateSimpla(15);

        GreutatiDuble gDubla = new GreutatiDuble(g1, g2);

        Greutate[] greutatiMultiple = {g1, g2, g3, gDubla};
        GreutateMultipla gMultipla = new GreutateMultipla(greutatiMultiple);

        colectie.adauga(g1);
        colectie.adauga(g2);
        colectie.adauga(g3);
        colectie.adauga(gDubla);
        colectie.adauga(gMultipla);

        System.out.println("Greutatea medie a colectiei este: " + colectie.medie());
 
    }
}
