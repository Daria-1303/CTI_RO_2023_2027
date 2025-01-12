class Figura{
    private double arie;


    public Figura(int arie){
        this.arie = arie;
    }

    //getter

    public double getArie(){
        return arie;
    }

    public boolean equals(Object obj) {
        if(obj instanceof Figura){
            Figura otherFigura = (Figura) obj;
            return this.getArie() == otherFigura.getArie();
        }
        return false;
    }

    public String toString(){
        return "Figura - Arie : " + arie;
    }
}
