abstract class Figura{
    public abstract double calculeazaArie();
}
class Patrat extends Figura{
    private double latura;

    public Patrat(double latura){
        this.latura = latura;
    }

    //encapsularea se refera ca avem anumite date, dar nu permitem utilizatorului 
    //decat prin anumite metode sa apeleze la ele
    //abstractizarea -> luam doar datele de care avem nevoie 
    //mostenirea
    public double getLatura(){
        return latura;
    }

    public double calculeazaArie(){
        return latura * latura;
    }
}

class Triunghi extends Figura{
    private double baza;
    private double inaltime;

    public Triunghi(double baza, double inaltime){
        this.baza = baza;
        this.inaltime = inaltime;
    }

    public double getBaza(){
        return baza;
    }

    public double getInaltime(){
        return inaltime;
    }

    public double calculeazaArie(){
        return baza * inaltime / 2;
    }
}

class Cerc extends Figura{ 
    private double raza;

    public Cerc(double raza){
        this.raza = raza;
    }

    public double getRaza(){
        return raza;
    }

    public double calculeazaArie(){
        return 3.14 * raza * raza;
    }
}

/* 
class Paralelogram extends Figura{

}
*/

class Desen {
    private Figura[] figuri = new Figura[30];
    
    int index;

    public void adaugaFigura(Figura figura){
        figuri[index++] = figura;
    }

    public double calculeazaArie(){
        double arieTotala = 0;

        for(int i = 0; i < index; i++){
            /* 
            if(figuri[i] instanceof Patrat){
                arieTotala += figuri[i].getLatura() * figuri[i].getLatura();
            }
            else if(figuri[i] instanceof Triunghi){
                arieTotala += figuri[i].getBaza() * figuri[i].getInaltime() / 2;
            }
            else if(figuri[i] instanceof Cerc){
                arieTotala += 3.14 * figuri[i].getRaza() * figuri[i].getRaza();
            }
            */

            arieTotala += figuri[i].calculeazaArie();
            /*
                aici nu apeleaza calculeazaArie pentru fiecare figura 
                la runtime nu se intampla asta 

                Figura f1 = new Patrat();
                        f2 = new Cerc();
                        f3 = new Triunghi();
                
                        dupa procesul de compilare exista procesul de runtime - alocaree a memoriei
                        si deci in momentul executarii memoriei(rulare) va sti ca in array avem patrat, cerc, triunghi
                        figuri[0] -> stie ca e un patrat
                        asta ar fi polimorfismul
             */

        }

        return arieTotala;
    }
}