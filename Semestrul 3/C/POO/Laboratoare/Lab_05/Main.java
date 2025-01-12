import java.util.Scanner;
import java.util.Random;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Random random = new Random();


        System.out.print("Introduceti numarul de telefoane: ");
        int numarTelefoane = scanner.nextInt();
        scanner.nextLine();

        Telefon[] telefoane = new Telefon[numarTelefoane];
        for (int i = 0; i < numarTelefoane; i++) {
            System.out.print("Introduceti numele proprietarului pentru telefonul " + (i + 1) + ": ");
            String numeProprietar = scanner.nextLine();
            telefoane[i] = new Telefon(numeProprietar);
        }

        System.out.print("Introduceti numarul de apeluri de efectuat: ");
        int numarApeluri = scanner.nextInt();
        scanner.nextLine();

        // Random
        for (int i = 0; i < numarApeluri; i++) {
            int x, y;

            do{
                x = random.nextInt(numarTelefoane);
                y = random.nextInt(numarTelefoane);
            }while(x == y);


            boolean apelSucces = telefoane[x].apeleaza(telefoane[y]);
            if (!apelSucces) {
                System.out.println("Apelul de la telefonul " + x + " către telefonul " + y + " nu a reușit.");
            }
        }

        // Citim un nume de proprietar
        System.out.print("Introduceti numele proprietarului pentru a verifica numarul de apeluri: ");
        String numeVerificat = scanner.nextLine();

        for (int i = 0; i < telefoane.length; i++) {
            System.out.println(telefoane[i].toString());
            System.out.println("Numar de apeluri de la " + numeVerificat + ": " + telefoane[i].numarDeApeluri(numeVerificat));
        }

        scanner.close();
    }
}
