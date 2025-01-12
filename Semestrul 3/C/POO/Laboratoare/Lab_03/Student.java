class Student{
    private String nume;
    private int varsta;
    private int inaltime;
    private double note[];

    public String getNume(){
        return nume;
    }

    public int getvarsta(){
        return varsta;
    }

    public int getinaltime(){
        return inaltime;
    }
    //metode...
    public void saluta(Student s){
        System.out.println("Salut, "  + s.getNume() + "!");
    }

    // public void saluta(Profesor p){
    //     System.out.println("Buna ziua, " + p.getNume() + "!");
    // }

    // //doua functii supraincarcate trb sa aiba acelasi return type, deoarece compilatorul java se uita la semnatura functiei
    // supraincarcarea tine cont de ordinea parametrilor, dar sa aiba tipuri diferite

    public Student(){
        System.out.println("Studentul a fost creat!");
    }

    public Student(String nume, int varsta, int inaltime){
        //this() trb sa fie prima chestie in statement
        this();
        this.nume = nume;
        this.varsta = varsta;
        this.inaltime = inaltime;
    }

    public Student(String nume, int varsta, int inaltime, double note[]){
        //pot lipsi
        // this.nume = nume;
        // this.varsta = varsta;
        // this.inaltime = inaltime;

        //asta e apelul la constructorul de sus
        this(nume, varsta, inaltime);
        this.note =note;
    }

    public boolean equals(Object obj){
        //se poate da orice clasa ca parametru
        if(obj instanceof Student){
            //nu stie ce fel de obiect est obj daca nu ii dam typecast
            if(this.nume.equals(((Student)obj).getNume()) &&
            this.varsta == ((Student)obj).getvarsta() &&
            this.inaltime  ==  ((Student)obj).getinaltime()){
                return true;
            }
        }
        return false;
    }

    public String toString(){
        return this.nume + ", " + this.varsta + ", " + this.inaltime;
    }

}
