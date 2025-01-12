import java.util.ArrayList;
abstract class Tip{
    abstract public String getTip();
    abstract public String toString();
}

class Intreg extends Tip{
    private int valoare;

    public Intreg(int valoare){
        this.valoare = valoare;
    }

    public String getTip(){
        return "Tip : Intreg";
    }

    public String toString(){
        return "" + valoare;
    }

    public boolean equals(Object o){
        if(o instanceof Intreg){
            Intreg otherIntreg = (Intreg) o;
            return valoare == otherIntreg.valoare;
        }

        return false;
    }
}

class Sir extends Tip{
    private String valoare;

    public Sir(String valoare){
        this.valoare = valoare;
    }

    public String getTip(){
        return "Tip : Sir";
    }

    public String toString(){
        return valoare;
    }

    public boolean equals(Object o){
        if(o instanceof Sir){
            Sir otherSir = (Sir) o;
            return valoare.equals(otherSir.valoare);
        }

        return false;
    }
}

class Colectie extends Tip{
    private ArrayList<Tip> colectie = new ArrayList<Tip>();

    public String getTip(){
        return "Tip : Colectie";
    }

    public String toString(){
        String rezultat = "";

        rezultat += colectie.toString();

        return rezultat ;
    }

    public boolean equals(Object o){
        if(o instanceof Colectie){
            Colectie otherColectie = (Colectie) o;
            return colectie.equals(otherColectie.colectie);
        }

        return false;
    }

    public void adauga(Tip t){
        colectie.add(t);
    }
}

class Main{
    public static void main(String[] args){
        Intreg i1 = new Intreg(1);
        Intreg i2 = new Intreg(2);
        Sir s1 = new Sir("unu");
        Sir s2 = new Sir("doi");
        Colectie c1 = new Colectie();
        Colectie c2 = new Colectie();

        c1.adauga(i1);
        c1.adauga(i2);
        c1.adauga(s1);
        c1.adauga(s2);

        c2.adauga(i1);
        c2.adauga(s1);
        c2.adauga(i2);
        c2.adauga(s2);
        c2.adauga(c1);

        System.out.println(c1.equals(c2));

        System.out.println(c2);
    }
}