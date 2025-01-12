class Remorca{
    private int nrCutii;
    private String nrInmatriculare;

    private static int lastNrCutii = 10;

    //primul constructor
    public Remorca(int nrCutii, String nrInmatriculare){
        this.nrCutii =  nrCutii;
        this.nrInmatriculare = nrInmatriculare;
        lastNrCutii = nrCutii; //dam update la ultimul nr de cutii stiut
    }

    public Remorca(String nrInmatriculare){
        this.nrInmatriculare = nrInmatriculare;
        this.nrCutii = 1 + lastNrCutii;
        lastNrCutii = this.nrCutii;
    }

    //gettere
    public int getNrCutii(){
        return nrCutii;
    }

    public String getNrInmatriculare(){
        return nrInmatriculare;
    }

    public String toString(){
        return "R(" + nrInmatriculare +", " + nrCutii + ")";
    }

}
