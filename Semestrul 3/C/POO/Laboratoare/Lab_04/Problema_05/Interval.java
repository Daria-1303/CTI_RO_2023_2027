import java.io.*;

class Interval {
    private int low, high;
    private int testedCount, containedCount;

    public Interval(int low, int high) {
        this.low = low;
        this.high = high;
        this.testedCount = 0;
        this.containedCount = 0;
    }

    public void test(Double value) {
        testedCount++;
        if (value >= low && value <= high) {
            containedCount++;
        }
    }

    public void writeResults(PrintStream out) {
        double percentage = (testedCount == 0) ? 0 : ((double) containedCount / testedCount) * 100;
        out.printf("Interval [%d, %d]: %d/%d (%.2f%%)%n", low, high, containedCount, testedCount, percentage);
    }
}
