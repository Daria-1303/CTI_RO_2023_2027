class B {
    public void oMetoda(Object o) {
        System.out.println("BBBB.oMetoda");
    }
}

class D extends B{
    public void oMetoda(Object o) { // aici daca aveam B b in loc de Object o, atunci ar fi afisat BBBB.oMetoda si metoda ar fi fost supraincarcata
        System.out.println("DDDD.oMetoda");
    }
}

class Main{
    public static void main(String[] args) {
        B b = new B();
        B d = new D();
        d.oMetoda(b); //Se va afisa DDDD.oMetoda dupa modificari pentru ca apelul se face poliformic
    }
}