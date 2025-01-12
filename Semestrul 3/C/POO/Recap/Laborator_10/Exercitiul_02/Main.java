class Exemplu {
    public void doSomething(int i) {
        try {
            if(i == 0) throw new E1();
            else throw new E2();
        } catch(E1 e) {
            System.out.println("Prins");
        }
    }
}

class E1 extends Exception {
    public String toString() {
        return "E1";
    }
}

class E2 extends E1 {
    public String toString() {
        return "E2";
    }
}

// asta ar bubui la runtime, dar ar fi compilat cu succes
// bine asta este exceptie neverificata, deci nu ar fi corect pentru enunt
class E3 extends RuntimeException{
    public E3() {
        super("E3");
    }
}

public class Main {
    public static void main(String[] args) {
        Exemplu e = new Exemplu();
        e.doSomething(1);
    }
}