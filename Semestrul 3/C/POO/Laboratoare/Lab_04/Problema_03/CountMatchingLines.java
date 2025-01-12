import java.io.*;

class CountMatchingLines{
    public static void main(String args[]){

        try{
            BufferedReader in_stream_char = new BufferedReader(new InputStreamReader(System.in));

            System.out.print("Introduceti o linie de text : ");
            String inputLine = in_stream_char.readLine();

            System.out.print("Introduceti numele fisierului : ");
            String fileName = in_stream_char.readLine();

            int matchingLinesCount = 0;

            BufferedReader fileReader = new BufferedReader(new FileReader(fileName));

            String fileLine;

            while((fileLine = fileReader.readLine()) != null){
                if(fileLine.equals(inputLine)){
                    matchingLinesCount++;
                }
            }

            System.out.println("Numarul de linii care s-a potrivit este : " + matchingLinesCount);

            //inchidem fisierul
            fileReader.close();

        }catch(IOException e){
            System.out.println("Eroare la citirea de la tastatura");
            System.exit(1);
        }
    }
}
