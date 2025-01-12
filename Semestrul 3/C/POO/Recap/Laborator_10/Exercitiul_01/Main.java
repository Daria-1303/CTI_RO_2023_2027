class L1 extends Exception {
    public String toString() {
        return "L1";
    }
}

class L2 extends L1 {
    public String toString() {
        return "L2";
    }
}

class Test {
    public static void main(String argv[]) {
        try {
            int i;
            for(i = 0; i < 4; i++) {
                if(i == 0) throw new L1();
                else throw new L2();
            }
        } catch(L1 e) {             // pentru ca dam catch la L1, automat tratam si L2 (care este subclasa lui L1)
            System.out.println(e);
        } catch(L2 e) {
            System.out.println(e);
        }
    }
}