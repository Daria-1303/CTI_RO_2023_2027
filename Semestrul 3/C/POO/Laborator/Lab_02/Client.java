class Client{
    public static void main(String args[]){
        //private int x = 3;
        //variabila locala
        //String a = "hello, world";
        Student stud1 = new Student();
        //asta imi aloca in memorie un loc pentru tipul asta de date
        //stac si heap, in  stack avem variabilele locale x, student etc
        //in heap se tin obiectele pe care le alocam de ex new Student

        //stud1.nume = "Doca";
        // nu mai facem asta din cauza modificatorilor de acces
        //nu dam voie utilizatorilor la datele din clase, ci doar la metode
        // de ex ar putea baga un empty String sau sa puna o varsta nepotrivita
        // greselile de genul tin de implementare

        //stud1.varsta  = 19;
        // stud1.invata();
        //System.out.println(stud1.varsta);


        //daca am seta o valoare gresita de ex -3, am primit o valoare default 0
        stud1.setVarsta(32);
        System.out.println(stud1.getVarsta());

    }
}
