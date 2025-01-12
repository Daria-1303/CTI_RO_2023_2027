import java.io.*;
import.java.util.*;

class Curs{
    private String denumire;
    private int id, credite, cod;

    public Curs(String d, int id, int credite, int cod){
        this.denumire = d;
        this.id = id;
        this.credite = credite;
        this.cod = cod;
    }

    public boolean equals(Object o){
        if(o instanceof Curs){
            return this.cod == ((Curs) o).cod;
        }

        return false;
    }

    public int getId(){
        return id;
    }

    public int getCredite(){
        return this.credite;
    }

    public String toString(){
        return "Id: " + id + "Denumire: " + denumire + "Credite: " + credite;
    }

}

class Curicula{
    private Curs []cursuri = new Curs[1];
    private int nrCursuri = 0;

    public void add(Curs c){
        if(nrCursuri < cursuri.length){
            Curs tmp[] = new Curs[2 * cursuri.length];
            for(int i = 0; i < cursuri.length; i++){
                tmp[i] = cursuri[i];
            }

            cursuri = tmp;
        }

        //adauga noul curs
        cursuri[nrCursuri++] = c;
    }


    public String toString(){
        String tmp = "";
        for(int i = 0; i < nrCursuri; i++){
            tmp += cursuri[i] + "\n";
        }

        return tmp;
    }

    public Curs cauta(int id){
        for(int i = 0; i < nrCursuri; i++){
            if(id == cursuri[i].getId()){
                return cursuri[i];
            }
        }

        return null;
    }


    public static Curicula load(String f){
        Curicula c = new Curicula();
        try{
            FileInputStream fis = new FileInputStream(f);
            Scanner s = new Scanner(fis);

        }catch(IOException e){
            System.err.println(e);
        }

        return c;
    }
}

class Main{
    public static void main(String []args){
        Curs a = new Curs("SDA", 1, 5, 1);
        Curs b = new Curs("POO", 2, 5, 2);
        Curs d = new Curs("OOP", 3, 5, 3);

        Curicula c = new Curicula();

        c.add(a);
        c.add(b);

        System.out.println(c);
    }
}
