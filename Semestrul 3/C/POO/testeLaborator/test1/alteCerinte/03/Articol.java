class Articol{  
    private String titlu;
    private String numeAutor;
    private int anPublicare;

    public Articol(String titlu, String numeAutor, int anPublicare){
        this.titlu = titlu;
        this.numeAutor = numeAutor;
        this.anPublicare = anPublicare;
    }

    //gettere

    public String getTitlu(){
        return titlu;
    }

    public String getNumeAutor(){
        return numeAutor;
    }

    public int getAnPublicare(){
        return anPublicare;
    }

    //implementam equals

    public boolean equals(Object obj){
        if(obj instanceof Articol){
            Articol otherArticol = (Articol) obj;

            return (this.getTitlu() == otherArticol.getTitlu()) && (this.getNumeAutor() == otherArticol.getNumeAutor());
        }

        return false;
    }

    public String toString(){
        return "Titlu: " + titlu + ", Autor: " + numeAutor + ", An: " + anPublicare;
    }
}