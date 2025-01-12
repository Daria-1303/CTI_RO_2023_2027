import java.util.ArrayList;

interface IWhiskey{
    double getNumarCalorii(double mililitri);

    double getConcentratieAlcool();

    String toString();
}

abstract class Whiskey implements IWhiskey{
    protected String nume;

    public Whiskey(String nume){
        this.nume = nume;
    }
}

abstract class SoloWhiskey extends Whiskey{
    protected double concentratieAlcool;

    public SoloWhiskey(String nume, double concentratieAlcool){
        super(nume);
        this.concentratieAlcool = concentratieAlcool;
    }

    public double getConcentratieAlcool(){
        return concentratieAlcool;
    }

}

class ClassicWhiskey extends SoloWhiskey{
    public ClassicWhiskey(String nume, double concentratieAlcool){
        super(nume, concentratieAlcool);
    }

    public double getNumarCalorii(double mililitri){
        return concentratieAlcool * mililitri * 5;
    }

    public String toString(){
        return "ClassicWhiskey : " + nume + ", Concentratie alcool: " + concentratieAlcool + "%, Calorii pe 100 ml: " + getNumarCalorii(100) + " kcal \n";
    }
}

class JackAndHoney extends SoloWhiskey{
    private int cantitateIndulcitor;

    public JackAndHoney(String nume, double concentratieAlcool, int cantitateIndulcitor){
        super(nume, concentratieAlcool);
        this.cantitateIndulcitor = cantitateIndulcitor;
    }

    public double getNumarCalorii(double mililitri){
        return concentratieAlcool * mililitri * 5 + cantitateIndulcitor * mililitri * 5;
    }

    public String toString(){
        return "JackAndHoney : " + nume + ", Concentratie alcool: " + concentratieAlcool + "%, Calorii pe 100 ml: " + getNumarCalorii(100) + " kcal" + ", Cantitate indulcitor: " + cantitateIndulcitor + "g \n";
    }

}

class BlendedWhiskey extends Whiskey{
    private ArrayList<Whiskey> bauturi;

    public BlendedWhiskey(String nume){
        super(nume);
        this.bauturi = new ArrayList<Whiskey>();
    }

    public void addWhiskey(Whiskey wToAdd){
        if(!(bauturi.contains(wToAdd))){
            bauturi.add(wToAdd);
        }
    }

    public double getNumarCalorii(double mililitri){
        double suma = 0;

        for(Whiskey w : bauturi) {
            suma += w.getNumarCalorii(mililitri);
        }

        return suma / bauturi.size();
    }

    public double getConcentratieAlcool(){
        double suma = 0;

        for(Whiskey w : bauturi){
            suma += w.getConcentratieAlcool();
        }

        return suma / bauturi.size();
    }

    public String toString(){
        return "BlendedWhiskey : " + nume + ", Concentratie alcool: " + getConcentratieAlcool() + "%, Calorii pe 100 ml: " + getNumarCalorii(100) + " kcal \n, Compozitie : " + bauturi.toString();
    }

}

class Main{
    public static void main(String[] args) {
        ClassicWhiskey cw = new ClassicWhiskey("Jameson", 40);
        JackAndHoney jh = new JackAndHoney("Jack Daniels", 35, 10);
        BlendedWhiskey bw = new BlendedWhiskey("Blended");
       
        ClassicWhiskey cw2 = new ClassicWhiskey("Jameson2", 40);
        ClassicWhiskey cw3 = new ClassicWhiskey("Jameson3", 40);

        bw.addWhiskey(cw2);
        bw.addWhiskey(cw3);

        BlendedWhiskey bw2 = new BlendedWhiskey("Blended2");

        bw2.addWhiskey(cw);
        bw2.addWhiskey(jh);
        bw2.addWhiskey(bw);

        System.out.println(bw2.toString());
        System.out.println(bw2.getNumarCalorii(150));
    }
}