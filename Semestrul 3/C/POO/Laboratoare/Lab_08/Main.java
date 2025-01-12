/*+---------------------+
|      Greutate       |
+---------------------+
| + capacitate(): int |
+---------------------+
           ^
           |
+---------------------+          +----------------------+
| GreutateSimpla      |          | GreutateDublă        |
+---------------------+          +----------------------+
| - capacitate: int   |          | - greutate1: Greutate|
|                     |          | - greutate2: Greutate|
+---------------------+          +----------------------+
| + capacitate(): int |          | + capacitate(): int  |
| + GreutateSimpla(int c)|       | + setGreutate1(Greutate g) |
|                     |          | + setGreutate2(Greutate g) |
+---------------------+          +----------------------+
           ^
           |
+---------------------+
| GreutateMultipla    |
+---------------------+
| - greutati: Greutate[] |
+---------------------+
| + capacitate(): int |
| + GreutateMultipla(Greutate[] greutati)|
+---------------------+

+------------------------+
| ColectieGreutati       |
+------------------------+
| - greutati: Greutate[] |
| - capacitateMaxima: int|
| - numarCurent: int     |
+------------------------+
| + ColectieGreutati(int max) |
| + adauga(Greutate g): void |
| + medie(): double          |
+------------------------+
*/
class Greutate {
    public int capacitate() {
        return 0; // Metodă suprascrisă în clasele derivate
    }
}

class GreutateSimpla extends Greutate {
    private int capacitate;

    public GreutateSimpla(int capacitate) {
        this.capacitate = capacitate;
    }

    @Override
    public int capacitate() {
        return capacitate;
    }
}

class GreutateDubla extends Greutate {
    private Greutate greutate1;
    private Greutate greutate2;

    public GreutateDubla(Greutate greutate1, Greutate greutate2) {
        this.greutate1 = greutate1;
        this.greutate2 = greutate2;
    }

    public void setGreutate1(Greutate g) {
        this.greutate1 = g;
    }

    public void setGreutate2(Greutate g) {
        this.greutate2 = g;
    }

    @Override
    public int capacitate() {
        return greutate1.capacitate() + greutate2.capacitate();
    }
}

class GreutateMultipla extends Greutate {
    private Greutate[] greutati;

    public GreutateMultipla(Greutate[] greutati) {
        this.greutati = greutati;
    }

    @Override
    public int capacitate() {
        int suma = 0;
        for (Greutate g : greutati) {
            suma += g.capacitate();
        }
        return suma;
    }
}

class ColectieGreutati {
    private Greutate[] greutati;
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

public class Main {
    public static void main(String[] args) {
        ColectieGreutati colectie = new ColectieGreutati(10);

        GreutateSimpla g1 = new GreutateSimpla(10);
        GreutateSimpla g2 = new GreutateSimpla(20);
        GreutateSimpla g3 = new GreutateSimpla(15);

        GreutateDubla gDubla = new GreutateDubla(g1, g2);

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

