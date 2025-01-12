import java.io.*;

class Client {
    public static void main(String[] args) {
        try {
            // Step 1: Read intervals from "intervale.dat"
            BufferedReader intervalReader = new BufferedReader(new FileReader("intervale.dat"));

            // Assume a fixed number of intervals for simplicity
            int[] lowBounds = new int[100];
            int[] highBounds = new int[100];
            int[] testedCount = new int[100];
            int[] containedCount = new int[100];
            int intervalCount = 0;

            String line;
            while ((line = intervalReader.readLine()) != null) {
                lowBounds[intervalCount] = Integer.parseInt(line);
                highBounds[intervalCount] = Integer.parseInt(intervalReader.readLine());
                testedCount[intervalCount] = 0;
                containedCount[intervalCount] = 0;
                intervalCount++;
            }
            intervalReader.close();

            // Step 2: Read filenames from the user and process real numbers
            BufferedReader input = new BufferedReader(new InputStreamReader(System.in));
            System.out.println("Enter file names containing real numbers (type 'exit' to stop):");
            String filename;
            while (!(filename = input.readLine()).equals("exit")) {
                // Open the file and process its numbers
                BufferedReader fileReader = new BufferedReader(new FileReader(filename));

                while ((line = fileReader.readLine()) != null) {
                    Double value = Double.parseDouble(line);
                    // Test this value against all intervals
                    for (int i = 0; i < intervalCount; i++) {
                        testedCount[i]++;
                        if (value >= lowBounds[i] && value <= highBounds[i]) {
                            containedCount[i]++;
                        }
                    }
                }
                fileReader.close();
            }

            // Step 3: Output results to specified file or console
            PrintStream out = (args.length > 0) ? new PrintStream(new FileOutputStream(args[0])) : System.out;
            for (int i = 0; i < intervalCount; i++) {
                double percentage = (testedCount[i] == 0) ? 0 : ((double) containedCount[i] / testedCount[i]) * 100;
                out.printf("Interval [%d, %d]: %d/%d (%.2f%%)%n", lowBounds[i], highBounds[i], containedCount[i], testedCount[i], percentage);
            }
            if (args.length > 0) {
                out.close();
            }

        } catch (IOException e) {
            System.err.println("Error during file operations: " + e.getMessage());
        }
    }
}
