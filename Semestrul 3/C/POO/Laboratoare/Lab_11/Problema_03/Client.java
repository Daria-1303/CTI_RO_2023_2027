/*
 3. S˘a se implementeze ierarhia de clase descris˘a mai jos:
• Clasa Tip: reprezint˘a un tip de date abstract
– Date membru: nu are
– Metode membru
⇤ public String getTip(): returneaz˘a numele clasei sub forma unui ¸sir de
caractere precedat de ¸sirul ”Tip: ”
⇤ public String toString(): afi¸seaz˘a valoarea atributului ˆıncapsulat de
clasele derivate
Metoda getTip nu are init¸ial nici o implementare.
• Clasa Intreg: reprezint˘a tipul de date ˆıntreg (mo¸stene¸ste clasa Tip)
– Date membru: un atribut de tip int
– Metode membru
⇤ public String getTip()
⇤ public String toString()
• Clasa Sir: reprezint˘a tipul de date ¸sir de caractere (mo¸stene¸ste clasa Tip)
– Date membru: un atribut de tip String
– Metode membru
⇤ public String getTip()
⇤ public String toString()

• Clasa Colectie: reprezint˘a tipul de date colect¸ie de obiecte Tip
– Date membru: un atribut ce stocheaz˘a elementele colect¸iei
– Metode membru
⇤ public String getTip()
⇤ public String toString()
⇤ o metod˘a care testeaz˘a egalitatea dintre dou˘a colect¸ii din punct de
vedere al cont¸inutului elementelor. Dou˘a colect¸ii sunt considerate a fi
egale din punct de vedere al cont¸inutului dac˘a ambele cont¸in acela¸si
num˘ar de elemente iar elementele cont¸inute sunt egale, mai mult, ele
sunt stocate ˆın aceea¸si ordine.
⇤ o metod˘a pentru ad˘augarea de elemente ˆın colect¸ie
Acest tip de colect¸ie trebuie implementat astfel ˆıncˆat o colect¸ie s˘a poat˘a cont¸ine
elemente de tip Colectie.
Exemple. Presupunem c˘a avem o colect¸ie format˘a din urm˘atoarele elemente:
7, 4, Eu, 12. Apelul metodei toString trebuie s˘a furnizeze rezultatul (7, 4, Eu,
12).
Presupunem c˘a avem o colect¸ie format˘a din urm˘atoarele elemente: 7, 4, Eu,
12 ¸si colect¸ia format˘a din elementele 2 ¸si 8. Apelul metodei toString trebuie
s˘a furnizeze rezultatul (7, 4, Eu, 12, (2, 8)). Metoda toString din aceast˘a clas˘a
trebuie s˘a fie implementat˘a urm˘arind urm˘atoarele cerint¸e
– folosirea operatorului instanceof e STRICT interzis˘a
– trebuie s˘a existe o variabil˘a de tip Iterator ˆın interiorul metodei
Se va scrie ¸si o metod˘a main ˆıntr-o alt˘a clas˘a ˆın care se va crea o colect¸ie de obiecte
Tip ce va avea cel put¸in un element de tip Colectie, dupa care aceasta se va afi¸sa.
Se va testa ¸si egalitatea elementelor dintre dou˘a colect¸ii.

 */

import java.util.ArrayList;
import java.util.Iterator;

abstract class Tip{
    public abstract String getTip();
    public abstract String toString();
}

class Intreg extends Tip{
    private int x;

    public Intreg(int x){
        this.x = x;
    }

    public String getTip(){
        return "Intreg";
    }

    public String toString(){
        return "" + x;
    }
}

class Sir extends Tip{
    private String s;

    public Sir(String s){
        this.s = s;
    }

    public String getTip(){
        return "Sir";
    }

    public String toString(){
        return s;
    }   
}

class Colectie extends Tip {
    private ArrayList<Tip> colectie = new ArrayList<>();

    public String getTip() {
        return "Colectie";
    }

    public Colectie() {
    }

    public ArrayList<Tip> getList(){
        return this.colectie;
    }

    public String toString() {
        StringBuilder result = new StringBuilder("(");
        for (Tip t : colectie) {
            result.append(t.toString()).append(", ");
        }
        if (colectie.size() > 0) {
            result.setLength(result.length() - 2); 
        }
        result.append(")");
        return result.toString();
    }

    /* 
    public boolean equals(Colectie c) {
        if (this.colectie.size() != c.colectie.size()) {
            return false;
        }
        for (int i = 0; i < this.colectie.size(); i++) {
            if (!this.colectie.get(i).toString().equals(c.colectie.get(i).toString())) {
                return false;
            }
        }
        return true;
    }
        */

    // equals cu iterator

    public boolean equals(Colectie c) {
        if (this.colectie.size() != c.colectie.size()) {
            return false;
        }
        Iterator<Tip> it1 = this.colectie.iterator();
        Iterator<Tip> it2 = c.colectie.iterator();
        while (it1.hasNext()) {
            if (!it1.next().toString().equals(it2.next().toString())) {
                return false;
            }
        }
        return true;
    }


    public void add(Tip t) {
        colectie.add(t);
    }

    public void remove(Tip t) {
        colectie.remove(t);
    }

    public Tip get(int i) {
        return colectie.get(i);
    }

    public int size() {
        return colectie.size();
    }
}

class Client {
    public static void main(String[] args) {
        Colectie c = new Colectie();
        c.add(new Intreg(7));
        c.add(new Intreg(4));
        c.add(new Sir("Eu"));
        c.add(new Intreg(12));
        System.out.println(c.toString());

        Colectie c2 = new Colectie();
        c2.add(new Intreg(7));
        c2.add(new Intreg(4));
        c2.add(new Sir("Eu"));
        c2.add(new Intreg(12));

        // colectia 3 va fi adaugata in c2
        Colectie c3 = new Colectie();
        c3.add(new Intreg(2));
        c3.add(new Intreg(8));
        c2.add(c3);

        System.out.println(c2.toString());
        System.out.println(c.equals(c2));
    }
}