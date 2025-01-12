class Masina{
    private String numarInmatriculare;
    private int capacitateRezervor;

    public Masina(String numarInmatriculare, int capacitateRezervor){
        this.numarInmatriculare = numarInmatriculare;
        this.capacitateRezervor = capacitateRezervor;
    }

    public String getNumarInmatriculare(){
        return numarInmatriculare;
    }

    public int getCapacitateRezervor(){
        return capacitateRezervor;
    }

    public String toString(){
        return numarInmatriculare + " - " + capacitateRezervor;
    }
}