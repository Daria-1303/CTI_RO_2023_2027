import java.io.*;
class Client{
    public static void main(String []args) throws IOException{
        //InputStream
        //System.in
        //FileInputStream
        InputStreamReader inputStreamReader = new InputStreamReader(System.in); //sau new file "student.txt"
        //inputStreamReader
        BufferedReader br = new BufferedReader(inputStreamReader); //se citeste byte cu byte

        String rez = br.readLine(); //returneaza o linie intreaga -> string

        //System.out.println(rez);
        int y = Integer.parseInt(rez);
        System.out.println(y);


        Integer x = new Integer(3);
        //exista clase in java ca si colectii care accepta ca si parametrii doar obiecte
        //de asta am folosi clasele infasuratoare Integer etc
        //in Integer exista metoda .valueOf("3") -> accepta ca parametru un string



    }

}
