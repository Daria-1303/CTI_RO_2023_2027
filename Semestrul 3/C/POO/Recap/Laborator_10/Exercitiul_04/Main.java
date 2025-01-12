import java.util.Date;
import java.util.Random;

class CoordinateGenerator {
    private Random randomGenerator;
    public CoordinateGenerator() {
        Date now = new Date();
        long sec = now.getTime();
        randomGenerator = new Random(sec);
    }

    public int generateX() {
        int x = randomGenerator.nextInt(101);
        if(x < 5) {
            x = 0;
        } else if(x > 95) {
            x = 100;
        } else {
            x = randomGenerator.nextInt(99) + 1;
        }
            return x;
    }

    public int generateY() {
        int y = randomGenerator.nextInt(101);
        if(y < 5) {
            y = 0;
        } else if(y > 95) {
            y = 50;
        } else {
            y = randomGenerator.nextInt(49) + 1;
        }
            return y;
    }
}

class Minge{
    private int x;
    private int y;

    public Minge(int x, int y){
        this.x = x;
        this.y = y;
    }

    public int getX(){
        return x;
    }

    public int getY(){
        return y;
    }

    public void suteaza() throws Out, Gol, Corner{
        CoordinateGenerator val = new CoordinateGenerator();
        x = val.generateX();
        y = val.generateY();

        if(y == 0 || y == 50){
            throw new Out("Mingea a iesit in afara terenului \n");
        }

        if((x == 0 || x == 100) && (y >= 20 && y <=30)){
            throw new Gol("GOOOOOL \n");
        }

        if((x == 0 || x == 100) && ((0 < y && y < 20) || (30 < y && y < 50))){
            throw new Corner("Mingea a iesit in corner \n");
        }
    }

    public void mutaColt(){
        if(x == 0 && y <= 20){
            y = 0;
        }
        else if(x == 0 && y >= 30){
            y = 50;
        }
        else if(x == 100 && y <= 20){
            y = 0;
        }
        else if(x == 100 && y >= 30){
            y = 50;
        }
    }
}

class Out extends Exception{
    public Out(String mesaj){
        super(mesaj);
    }
}

class Gol extends Exception{
    public Gol(String mesaj){
        super(mesaj);
    }
}

class Corner extends Exception{
    public Corner(String mesaj){
        super(mesaj);
    }
}

class Echipa{
    private String nume;
    private int nrGoluri;
    private int nrCorneruri;
    private int nrOuturi;

    public Echipa(String nume){
        this.nume = nume;
        nrGoluri = 0;
        nrCorneruri = 0;
        nrOuturi = 0;
    }

    public void gol(){
        nrGoluri++;
    }

    public void corner(){
        nrCorneruri++;
    }

    public void out(){
        nrOuturi++;
    }

    public int getNrGoluri(){
        return nrGoluri;
    }

    public String toString(){
        return nume + " a marcat " + nrGoluri + " goluri, a avut " + nrCorneruri + " corneruri si a avut " + nrOuturi + " outuri \n";
    }
}

class Joc{
    private Echipa echipa1;
    private Echipa echipa2;

    private Minge minge;

    public Joc(String nume1, String nume2){
        echipa1 = new Echipa(nume1);
        echipa2 = new Echipa(nume2);
        minge = new Minge(50, 25);
    }

    public void simuleaza(){

        for(int i = 0; i < 1000; i++){
            Echipa echipaInPosesie;

            if(i % 2 == 0){
                echipaInPosesie = echipa1;
            }
            else{
                echipaInPosesie = echipa2;
            }

            try {
                minge.suteaza();
            } catch (Out e1) {
                System.out.println(e1.getMessage());
                minge = new Minge(minge.getX(), minge.getY());
                echipaInPosesie.out();
            }catch(Gol e2){
                System.out.println(e2.getMessage());
                echipaInPosesie.gol();
                minge = new Minge(50, 25);
            }catch(Corner e3){
                System.out.println(e3.getMessage());
                minge = new Minge(minge.getX(), minge.getY());
                minge.mutaColt();
            }

        }
    }
}