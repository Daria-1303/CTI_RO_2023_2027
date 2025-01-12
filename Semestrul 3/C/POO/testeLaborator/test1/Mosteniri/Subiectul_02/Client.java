class Client{
    public static void main(String []args){
        // 4-0 atat
        Jucator titular1 = new Jucator("Lewa", 9);
        Jucator titular2 = new Jucator("Lamine Yamal", 19);
        Jucator titular3 = new Jucator("Raphinha", 11);
        Jucator titular4 = new Jucator("Lopez", 16);
        Jucator titular5 = new Jucator("Pedri", 8);
        Jucator titular6 = new Jucator("Casado", 17);
        Jucator titular7 = new Jucator("Balde", 3);
        Jucator titular8 = new Jucator("Martinez", 5);
        Jucator titular9 = new Jucator("Cubarsi", 2);
        Jucator titular10 = new Jucator("Kounde", 23);
        Jucator titular11 = new Jucator("Pena", 13);

        Jucator rezerva1 = new Jucator("de Jong", 21);
        Jucator rezerva2 = new Jucator("Gavi", 6);
        Jucator rezerva3 = new Jucator("D. Olmo", 20);
        Jucator rezerva4 = new Jucator("P. Torre", 14);

        Jucator []titulari = {titular1, titular2, titular3, titular4, titular5, titular6, titular7, titular8, titular9, titular10, titular11};
        Jucator []rezerve = {rezerva1, rezerva2, rezerva3, rezerva4};

        Echipa fcBarcelona = new Echipa(titulari, rezerve);

        System.out.println(fcBarcelona.toString());

        fcBarcelona.efectueazaSchimbare(titular4, rezerva1);
        fcBarcelona.efectueazaSchimbare2(titular6, rezerva3);
        fcBarcelona.efectueazaSchimbare(titular5, rezerva2);

        System.out.println(fcBarcelona.toString());
    }
}