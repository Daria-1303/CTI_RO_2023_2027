import java.util.ArrayList;

class Tren{
    private ArrayList<Vagon> vagoane ; // = new ArrayList<Vagon>(15);
    private int nrColete;

    public Tren(ArrayList<Vagon> vagoane){
        this.vagoane = new ArrayList<Vagon>(vagoane); // asa face o noua lista, nu doar o referinta
        this.nrColete = 0;
    }

    public int getTotalColete(){
        nrColete = 0;
        for(Vagon v : vagoane){
            nrColete += v.getCapacitateColete();
        }

        return nrColete;
    }

    public boolean equals(Object obj){
        if(obj instanceof Tren){
            Tren otherTren = (Tren) obj;
            return this.getTotalColete() == otherTren.getTotalColete();
        }

        return false;
    }

    public String toString(){
        String result = "Trenul are " + getTotalColete() + " colete si urmatoarele vagoane: \n";
        for(Vagon v : vagoane){
            result += v.toString() + " ";
        }

        return result;
    }
}

abstract class Vagon{
    public abstract int getCapacitateColete();

    public abstract String toString();
}

abstract class VagonCalatori extends Vagon{
    public abstract int getCapacitateColete();

    public abstract int getCapacitatePasageri();

    public abstract String toString();

    public void deschideUsile(){
        System.out.println("Usile sunt deschise");
    }

    public void inchideUsile(){
        System.out.println("Usile sunt inchise");
    }
}

class VagonCalatoriA extends VagonCalatori{
    public int getCapacitateColete(){
        return 300;
    }

    public int getCapacitatePasageri(){
        return 40;
    }

    public String toString(){
        return "VagonCalatoriA";
    }
}

class VagonCalatoriB extends VagonCalatori{
    public int getCapacitateColete(){
        return 400;
    }

    public int getCapacitatePasageri(){
        return 50;
    }

    public String toString(){
        return "VagonCalatoriB";
    }

    public void blocheazaGeamuri(){
        System.out.println("Geamurile sunt blocate");
    }
}

class VagonMarfa extends Vagon{
    public int getCapacitateColete(){
        return 400;
    }

    public String toString(){
        return "VagonMarfa";
    }
}

class Main{
    public static void main(String[] args) {
        ArrayList<Vagon> vagoane = new ArrayList<Vagon>();
        vagoane.add(new VagonCalatoriA());
        vagoane.add(new VagonCalatoriB());
        //vagoane.add(new VagonMarfa());

        Tren tren = new Tren(vagoane);
        System.out.println(tren.toString());

        vagoane.add(new VagonMarfa());
        Tren tren2 = new Tren(vagoane);
        System.out.println(tren2.toString());

        System.out.println(tren2.equals(tren));
    }
}