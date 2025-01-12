import java.io.*;

class Client {
    public static void main(String[] args) {
        Interval[] intervals = new Interval[100]; // presupunem maxim 100 de intervale
        int intervalCount = 0;

        String[] processedFiles = new String[100]; // presupunem maxim 100 de fișiere procesate
        int fileCount = 0;

        // Citirea intervalelor din fișierul "intervale.dat"
        try {
            BufferedReader inStream = new BufferedReader(new InputStreamReader(new FileInputStream("intervale.dat")));
            String line;
            while ((line = inStream.readLine()) != null) {
                String[] parts = line.split(" ");
                if (parts.length == 2) {
                    int lowerBound = Integer.parseInt(parts[0]);
                    int upperBound = Integer.parseInt(parts[1]);
                    intervals[intervalCount++] = new Interval(lowerBound, upperBound);
                }
            }
        } catch (IOException e) {
            System.out.println("Eroare la operatiile de intrare-iesire!");
            System.exit(1);
        }

        // Deschiderea fluxului de ieșire
        PrintStream outStream;
        if (args.length > 0) {
            try {
                outStream = new PrintStream(new FileOutputStream(args[0]));
            } catch (IOException e) {
                System.out.println("Eroare la operatiile de intrare-iesire!");
                System.exit(1);
            }
        } else {
            outStream = System.out;
        }

        // Citirea numelor fișierelor cu numere reale de la tastatură
        try (BufferedReader consoleReader = new BufferedReader(new InputStreamReader(System.in))) {
            String fileName;
            while (true) {
                System.out.print("Introduceți numele fișierului cu numere reale (sau 'exit' pentru a termina): ");
                fileName = consoleReader.readLine();

                if (fileName.equalsIgnoreCase("exit")) {
                    break;
                }

                // Verificăm dacă fișierul a fost deja procesat
                boolean alreadyProcessed = false;
                for (int i = 0; i < fileCount; i++) {
                    if (processedFiles[i].equals(fileName)) {
                        alreadyProcessed = true;
                        break;
                    }
                }

                if (alreadyProcessed) {
                    System.out.println("Fișierul " + fileName + " a fost deja procesat!");
                    continue;
                }

                // Adăugăm fișierul la lista de fișiere procesate
                processedFiles[fileCount++] = fileName;

                // Procesarea fișierului
                processFile(fileName, intervals, intervalCount);
            }
        } catch (IOException e) {
            System.out.println("Eroare la citirea de la tastatură: " + e.getMessage());
        }

        // Scrierea statisticilor pentru intervale
        for (int i = 0; i < intervalCount; i++) {
            intervals[i].writeStatistics(outStream);
        }

        // Închiderea fluxului de ieșire, dacă e diferit de System.out
        if (outStream != System.out) {
            outStream.close();
        }
    }

    // Metodă care procesează fișierele de numere reale
    private static void processFile(String fileName, Interval[] intervals, int intervalCount) {
        try (BufferedReader fileReader = new BufferedReader(new InputStreamReader(new FileInputStream(fileName)))) {
            String line;
            while ((line = fileReader.readLine()) != null) {
                try {
                    Double number = Double.parseDouble(line.trim());
                    for (int i = 0; i < intervalCount; i++) {
                        intervals[i].testNumber(number);
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Eroare de formatare a numărului în fișierul " + fileName + ": " + e.getMessage());
                }
            }
        } catch (IOException e) {
            System.out.println("Eroare la citirea fișierului " + fileName + ": " + e.getMessage());
        }
    }
}
