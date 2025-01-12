import java.io.*;
import java.util.Random;

class Main2{
    public static void main(String []args)throws IOException{
        InputStreamReader isr = new InputStreamReader(System.in);

        BufferedReader br = new BufferedReader(isr);

        Random random = new Random();

        String rez = br.readLine();
        int numarTelefoane = Integer.parseInt(rez);

        Telefon[] telefoane = new Telefon[numarTelefoane];
        for (int i = 0; i < numarTelefoane; i++) {
            String numeProprietar = br.readLine();

            telefoane[i] = new Telefon(numeProprietar);
        }
    }
}
