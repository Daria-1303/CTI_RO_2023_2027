import java.io.*;

class InmultireMatrice{
    public static void main(String args[]){
        int N, M, P;

        try{

        BufferedReader in_char_stream = new BufferedReader(new InputStreamReader(System.in));

        System.out.print("Introduceti numarul de linii N pentru matricea A : ");
        N = Integer.parseInt(in_char_stream.readLine());

        System.out.print("Introduceti numarul de linii M pentru matricea A : ");
        M = Integer.parseInt(in_char_stream.readLine());

        Double [][] matriceA = new Double[N][M];
        System.out.println("Introduceti elementele matricei B");

        for(int i = 0; i < N; i++){
            for(int j = 0; j < M; j++){
                System.out.print("A[" + i + "][" + j + "] = ");
                matriceA[i][j] = Double.parseDouble(in_char_stream.readLine());
            }
        }

        System.out.print("Introduceti numarul de linii P pentru matricea B : ");
        P = Integer.parseInt(in_char_stream.readLine());

        Double [][] matriceB = new Double[M][P];

        System.out.println("Introduceti elementele matricei B");

        for(int i = 0; i < M; i++){
            for(int j = 0; j < P; j++){
                System.out.print("B[" + i + "][" + j + "] = ");
                matriceB[i][j] = Double.parseDouble(in_char_stream.readLine());
            }
        }

        Double [][] matriceRezultat = new Double[N][P];

        for(int i = 0; i < N; i++){
            for(int j = 0; j < P; j++){
                matriceRezultat[i][j] = 0.0;
                for(int k = 0; k < M; k++){
                    matriceRezultat[i][j] += matriceA[i][k] * matriceB[k][j];
                }
            }
        }

        //scriem rezultat intr un fisier
        PrintStream out_stream = new PrintStream(new FileOutputStream("rezultat.txt"));
        out_stream.println("Matricea rezultata:");

        for(int i = 0; i < N; i++){
            for(int j = 0; j < P; j++){
                out_stream.print(matriceRezultat[i][j] + " ");
            }

            out_stream.println();
        }

        out_stream.close();
        System.out.println("Rezultatul a fost scris in fisier");

        }catch(IOException e){
            System.out.println("Eroare la operatiile de intrare-iesire!");
            System.exit(1);
        }
    }
}
