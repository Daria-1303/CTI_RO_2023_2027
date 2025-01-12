class Client{
    public static void main(String []args){
        Carte carte1 = new Carte(100);
        Carte carte2 = new Carte(200);
        Carte carte3 = new Carte(100);

        System.out.println("Carte 1 == Carte 2?" + carte1.equals(carte2));
        System.out.println("Carte 1 == Carte 3?" + carte1.equals(carte3 ));
    }
}
