class Client{
    public static void main(String []args){
        Portofel portofel = new Portofel("Daria");

        portofel.adaugaCard("1234", 100);
        portofel.adaugaCard("2345", 200);
        portofel.adaugaCard("1234", 200);
        portofel.adaugaCard("1234", 100);

        System.out.println(portofel.toString());

        System.out.println(portofel.calculeazaSold());
    }
}