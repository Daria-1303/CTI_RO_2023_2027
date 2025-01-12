import java.io.*;
class ExempluIO {
    public static void main(String args[]) {
        int n,i,suma,temporar;
        try {
            BufferedReader in_stream_char = new BufferedReader(new InputStreamReader(System.in));
            PrintStream out_stream = new PrintStream(new FileOutputStream("out.txt"));

            System.out.print("Dati numarul de intregi:");
            n = Integer.parseInt(in_stream_char.readLine());
            suma = 0;
            for(i = 1; i <= n; i++) {
                System.out.print("Dati numarul " + i + ":");
                temporar = Integer.parseInt(in_stream_char.readLine());
                suma+= temporar;
                out_stream.println(temporar);
            }
            out_stream.println(suma);
            System.out.println("Suma este:" + suma);
            out_stream.close();
        } catch(IOException e) {
            System.out.println("Eroare la operatiile de intrare-iesire!");
            System.exit(1);
        }
    }
}
