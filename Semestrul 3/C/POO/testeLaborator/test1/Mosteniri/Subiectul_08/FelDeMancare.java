class FelDeMancare{
    private String numeFel;
    private int numarCalorii;

    public FelDeMancare(String numeFel, int numarCalorii){
        this.numeFel = numeFel;
        this.numarCalorii = numarCalorii;
    }

    public int getNumarCalorii(){
        return numarCalorii;
    }

    public String toString(){
        return numeFel + " - " + numarCalorii;
    }

    public boolean equals(Object obj){
        if(obj instanceof FelDeMancare){
            FelDeMancare otherFelDeMancare = (FelDeMancare) obj;

            return this.numarCalorii == otherFelDeMancare. numarCalorii;
        }

        return false;
    }
}