class Fisier{
    private static int contor = 0;
    private String nume[];
    private String continut[];
    private int id;
    private Fisier fisierAnterior;
    private int nrConcatenari;

    public void setFisierAnterior(Fisier fisier){
        this.setFisierAnterior(fisier);
    }
    public Fisier(String nume[], String continut[]){
        this.nume = nume;
        this.continut = continut;
        // this.id = Fisier.randomId();
        this.id = contor++;
        this.fisierAnterior = null; //sau this daca vrem sa aiba acelasi nume
        //this.nrConcatenari = 0;
    }

    public void salveazaVersiune(){
        Fisier fisierNou = new Fisier(this.nume + "bak", this.continut);
        this.fisierAnterior = fisierNou;
        fisierNou.setFisierAnterior = this;
    }

    public void concateneaza(Fisier fisierConcatenat){
        this.salveazaVersiune();
        this.continut = this.continut + fisierConcatenat.getContinut;
        nrConcatenari++;
    }

    public String toString(){
        if(!this.fisierAnterior){
            return this.id + " - " this.nume + " - " + this.continut;
        }
        else{
            return this.id + " - " this.nume + " - " + this.continut + " - " + this.fisierAnterior;
        }
    }

    public int numarConcatenari(){
        return nrConcatenari;
    }
}
