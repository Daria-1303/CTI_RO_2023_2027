import java.util.ArrayList;
interface Memorable{
    int calculeazaMemorieTotala();
}

abstract class Memorie implements Memorable{
    protected ArrayList<Byte> memorie; //= new ArrayList<Byte>();
    private int dimensiuneMemorie;

    public Memorie(int dimensiuneMemorie) throws IllegalArgumentException{
        if(dimensiuneMemorie <= 0){
            throw new IllegalArgumentException();
        }

        this.dimensiuneMemorie = dimensiuneMemorie;
    }

    public int calculeazaMemorieTotala(){
        return dimensiuneMemorie;
    }

    public ArrayList<Byte> read(int start, int end) throws IllegalArgumentException{
        if(start < 0 || end < 0 || start >= end || start >= memorie.size() || end >= memorie.size()){
            throw new IllegalArgumentException();
        }

        ArrayList<Byte> rezultat = new ArrayList<Byte>(end - start + 1);

        for(int i = start; i <= end; i++){
            rezultat.add(memorie.get(i));
        }

        /*
         * //pt tablou normal
         * 
         * arraycopy(memorie, start, rezultat, 0, end - start + 1);
         */

        return rezultat;
    }

    public String toString(){
        StringBuilder sb = new StringBuilder();
        for(Byte b : memorie){
            sb.append(b);
        }
        return sb.toString();
    }

}

class PROM extends Memorie{

    public PROM(int dimensiuneMemorie, ArrayList <Byte> memorie){
        super(dimensiuneMemorie);
        this.memorie = memorie;
    }
}

class RandomROM extends Memorie{
    // continutul memoriei este generat random
    public RandomROM(int dimensiuneMemorie){
        super(dimensiuneMemorie);
        memorie = new ArrayList<Byte>(dimensiuneMemorie);
        for(int i = 0; i < dimensiuneMemorie; i++){
            double random = Math.random();
            if(random < 0.5){
                memorie.add((byte)0);
            }
            else{
                memorie.add((byte)1);
            }
        }
    }
}

class PC{
    private ArrayList<Memorie> memorii;

    public PC(){
        memorii = new ArrayList<Memorie>();
    }

    public void adaugaMemorie(Memorie memorie){
        memorii.add(memorie);
    }

    public int calculeazaMemorieTotala(){
        int total = 0;
        for(Memorie memorie : memorii){
            total += memorie.calculeazaMemorieTotala();
        }
        return total;
    }

    public String toString(){
        StringBuilder sb = new StringBuilder();
        for(Memorie memorie : memorii){
            sb.append(memorie.toString());
        }
        return sb.toString();
    }
}

class Main{
    public static void main(String[] args) {
        PC pc = new PC();

        try {
            ArrayList<Byte> dateprom = new ArrayList<Byte>();
            dateprom.add((byte)1);
            dateprom.add((byte)0);
            dateprom.add((byte)1);

            PROM prom = new PROM(5, dateprom);
            pc.adaugaMemorie(prom);

            RandomROM randomROM = new RandomROM(10);
            pc.adaugaMemorie(randomROM);

            System.out.println(pc.calculeazaMemorieTotala());

            System.out.println(pc.toString());

            System.out.println("Aici \n");

            System.out.println(prom.read(0, 2));

            System.out.println(prom.read(0, 3)); //exceptie
            
        } catch (IllegalArgumentException e) {
            System.out.println("S-a produs exceptia\n");
        }

    }
}
