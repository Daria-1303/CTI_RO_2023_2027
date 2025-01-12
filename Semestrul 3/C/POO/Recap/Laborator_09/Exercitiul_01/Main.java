interface I{
    void m1();

    void m2();

    void m3();
}

class A implements I{
    public void m1(){
        System.out.println("A.m1");
    }

    public void m2(){
        System.out.println("A.m2");
    }

    // nu va fi compilabila daca nu implementam si metoda m3
}

class Main{
    public static void main(String[] args){
        I i = new A();
        i.m1();
        i.m2();
    }
}