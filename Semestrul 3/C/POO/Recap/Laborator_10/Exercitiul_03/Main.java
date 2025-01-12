class Exemplu {
    public void doSomething(int i){
        if(i == 0) throw new E1();
        else throw new E2();
    }
}

class E1 extends RuntimeException {
    public String toString() {
        return "E1";
    }
}

class E2 extends E1 {
    public String toString() {
        return "E2";
    }
}

public class Main {
    public static void main(String[] args) {
        Exemplu e = new Exemplu();
        try {
            e.doSomething(1);
        } catch(E1 e1) {
            System.out.println("Prins");
        }
    }
}