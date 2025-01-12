class Carte{

    private int numarPagini;

    public Carte(int numarPagini){
        this.numarPagini = numarPagini;
    }

    public int getNumarPagini(){
        return numarPagini;
    }

    public boolean equals(Object obj){
        if(obj instanceof Carte){
            Carte altaCarte = (Carte) obj;

            return this.numarPagini == altaCarte.getNumarPagini();
        }

        return false;
    }

}
