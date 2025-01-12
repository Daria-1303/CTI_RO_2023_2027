class Desen{
    private String numeDesen;
    private Figura figuri[];
    private int numarFiguri;

    public Desen(String numeDesen){
        this.numeDesen = numeDesen;
        this.figuri = new Figura[1024];
        this.numarFiguri = 0;
    }

    public boolean adaugaFigura(Figura figuraAdaugata){
        if(numarFiguri < 1024){
            //daca exact acelasi obiect figura nu este deja prezenta in desen, se adauga figura
            for(int i = 0; i < numarFiguri; i++){
                if(figuri[i].equals(figuraAdaugata)){
                    return false;
                }
            }

            figuri[numarFiguri] = figuraAdaugata;
            numarFiguri++;

            return true;
        }

        return false;
    }

    public String toString(){
        String result = "Desenul " + numeDesen + " contine urmatoarele figuri: \n";
        for(int i = 0; i < numarFiguri; i++){
            result += figuri[i].toString() + "\n";
        }

        return result;
    }

    public double medieArie(){
        if(numarFiguri == 0){
            return 0;
        }

        double sumaArii = 0;

        for(int i = 0; i < numarFiguri; i++){
            sumaArii += figuri[i].getArie();
        }

        return sumaArii / numarFiguri;
    }
       
}
