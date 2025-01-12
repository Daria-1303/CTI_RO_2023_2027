        import java.util.Random;
        import java.util.Date;

        class CoordinateGenerator {

            private Random randomGenerator;

            public CoordinateGenerator() {
                Date now = new Date();
                long sec = now.getTime();
                randomGenerator = new Random(sec);
            }

            public int generateX() {
                int x = randomGenerator.nextInt(101);

                if(x < 5) {
                    x = 0;
                }
                else if(x > 95) {
                    x = 100;
                }
                else {
                    x = randomGenerator.nextInt(99) + 1;
                }

                return x;
            }

            public int generateY() {
                int y = randomGenerator.nextInt(101);
                if(y < 5) {
                    y = 0;
                }
                else if(y > 95) {
                    y = 50;
                }
                else {
                    y = randomGenerator.nextInt(49) + 1;
                }
                return y;
            }
        }


        class Minge {
            private int x, y;

            public Minge(int x, int y) {
                this.x = x;
                this.y = y;
            }

            public void mutare(int newX, int newY) throws OutException, GolException, CornerException {
                x = newX;
                y = newY;

                // Verificare Out
                if (y == 0 || y == 50) throw new OutException("Out! Mingea a parasit terenul la coordonatele (" + x + ", " + y + ").");

                // Verificare Gol
                if (x == 0 || x == 100) {
                    if (y >= 20 && y <= 30) throw new GolException("Goal! Mingea a intrat in poarta la coordonatele (" + x + ", " + y + ").");
                    throw new CornerException("Corner! Mingea a iesit prin colt la coordonatele (" + x + ", " + y + ").");
                }
            }

            public int getX() { return x; }
            public int getY() { return y; }
        }


        class OutException extends Exception {
            public OutException(String message) { super(message); }
        }

        class GolException extends Exception {
            public GolException(String message) { super(message); }
        }

        class CornerException extends Exception {
            public CornerException(String message) { super(message); }
        }

        class Joc {
            private int scoreTeam1, scoreTeam2;
            private Minge minge;
            private CoordinateGenerator generator;
            private int totalExceptions;

            public Joc() {
                this.scoreTeam1 = 0;
                this.scoreTeam2 = 0;
                this.generator = new CoordinateGenerator();
                this.minge = new Minge(50, 25);
                this.totalExceptions = 0;
            }

            public void simuleaza() {
                for (int i = 0; i < 5; i++) {
                    try {
                        int newX = generator.generateX();
                        int newY = generator.generateY();
                        minge.mutare(newX, newY);
                        System.out.println("Mingea se afla la coordonatele (" + newX + ", " + newY + ")");
                    } catch (GolException e) {
                        totalExceptions++;
                        if (minge.getX() == 0)
                            scoreTeam2++;
                        else
                            scoreTeam1++;
                        minge = new Minge(50, 25);
                        System.out.println(e.getMessage() + " Scor: Echipa 1 - " + scoreTeam1 + ", Echipa 2 - " + scoreTeam2);
                    } catch (OutException e) {
                        totalExceptions++;
                        System.out.println(e.getMessage());
                    } catch (CornerException e) {
                        totalExceptions++;

                        int cornerX = (minge.getX() == 0) ? 0 : 100;
                        int cornerY = (minge.getY() < 25) ? 0 : 50;
                        minge = new Minge(cornerX, cornerY);
                        System.out.println(e.getMessage());
                    }
                }
                System.out.println("Simularea s-a incheiat. Scor final: Echipa 1 - " + scoreTeam1 + ", Echipa 2 - " + scoreTeam2);
                System.out.println("Numar total de exceptii tratate: " + totalExceptions);
            }
        }

        class Main {
            public static void main(String[] args) {
                Joc joc = new Joc();
                joc.simuleaza();
            }
        }

