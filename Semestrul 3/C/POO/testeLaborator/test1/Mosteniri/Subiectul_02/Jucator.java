class Jucator{
    private String numeJucator;
    private int numarJucator;

    //constructor
    public Jucator(String numeJucator, int numarJucator){
        this.numeJucator = numeJucator;
        this.numarJucator = numarJucator;
    }

    //gettere
    public String getNumeJucator(){
        return numeJucator;
    }

    public int getNumarJucator(){
        return numarJucator;
    }

    //reimplementam metoda equals override
    public boolean equals(Object obj){
        if(obj instanceof Jucator){
            Jucator otherJucator = (Jucator) obj;
            return (this.getNumeJucator().equals(otherJucator.getNumeJucator())) && (this.getNumarJucator() == otherJucator.getNumarJucator());
        }

        return false;
    }

    public String toString(){
        return "Nume jucator: " + this.getNumeJucator() + " -> Numar tricou:" + this.getNumarJucator();
    }
}