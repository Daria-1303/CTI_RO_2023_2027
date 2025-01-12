class Angajat{
    //caracteristici
    private String numeAngajat;
    private int salariuAngajat;

    //Constructor

    public Angajat(String numeAngajat, int salariuAngajat){
        this.numeAngajat = numeAngajat;
        this.salariuAngajat = salariuAngajat;
    }

    //gettere

    public String getNumeAngajat(){
        return numeAngajat;
    }

    public int getSalariuAngajat(){
        return salariuAngajat;
    }

    //rescriem metoda equals
    public boolean equals(Object obiect){
        if(obiect instanceof Angajat){
            Angajat otherAngajat = (Angajat) obiect;

            return (this.getNumeAngajat().equals(otherAngajat.getNumeAngajat())) && (this.salariuAngajat == otherAngajat.salariuAngajat);
        }

        return false;
    }

    //rescriem metoda toString

    public String toString(){
        return "Angajat " + numeAngajat + " - " + salariuAngajat;
    }
}