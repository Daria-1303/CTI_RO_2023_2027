class Client{
    public static void main(String args[]){
        Complex nr1 = new Complex(1,3);
        Complex nr2 = new Complex(2,4);

        Complex suma = nr1.suma(nr2);

        System.out.println(Complex.getNumarNumere());

        System.out.println("Modul nr 1 : " + nr1.modul());

        suma.afiseazaNumar();

    }
}
