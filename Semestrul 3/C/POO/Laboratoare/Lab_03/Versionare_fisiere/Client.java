class Client{
    public static void main(String args[]){
        Fisier f1 =  new Fisier("fin.txt", "android_studio_<3");
        f1.salveazaVersiune();

        Fisier f2 = new Fisier("adaugat.txt", "iti da batai de cap");
        //f2.salveazaVersiune();
        f1.concateneaza(f2);

        System.out.println(f1);
        System.out.println(f2);
        System.out.println("Numar de concatenari : " + );
    }
}
