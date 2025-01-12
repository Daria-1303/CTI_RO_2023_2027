class Client{
    public static void main(String [] args){
        Meniu m1 = new Meniu(1000);

        FelDeMancare f1 = new FelDeMancare("Pizza", 200);
        FelDeMancare f2 = new FelDeMancare("Slanina", 500);
        FelDeMancare f3 = new FelDeMancare("Cartofi", 500);

        m1.adaugaFelDeMancare(f1);
        m1.adaugaFelDeMancare(f2);
        m1.adaugaFelDeMancare(f3);

        System.out.println(m1.toString());

        FelDeMancare f4 = new FelDeMancare("Sarmale", 500);
        m1.adaugaFelDeMancare(f4);

        m1.schimbaFelDeMancare(f4);

        System.out.println(m1.toString());

    }  
}