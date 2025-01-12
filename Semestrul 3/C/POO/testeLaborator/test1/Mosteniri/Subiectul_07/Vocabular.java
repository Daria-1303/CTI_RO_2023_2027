class Vocabular{
    private String []cuvinteVocabular = new String [1000];
    private int numarCuvinteVocabular = 0;

    public Vocabular(String cuvant){
        this.cuvinteVocabular[0] = cuvant;
        this.numarCuvinteVocabular = 1;
    }

    public void adaugaCuvinte(String[] cuvinteAdaugate) {
        int contor = 0;
        for (int i = numarCuvinteVocabular; i < 1000 && contor < cuvinteAdaugate.length; i++) {
            cuvinteVocabular[i] = cuvinteAdaugate[contor];
            numarCuvinteVocabular++; // Actualizăm numărul total de cuvinte
            contor++;
        }
    }

    public int determinaDiferente(Vocabular vocabular2){
        int diferente = 0;
        int contor = 0;

        for(int i = 0; i < vocabular2.numarCuvinteVocabular; i++){
            contor = 0;
            for(int j = 0; j < this.numarCuvinteVocabular; j++){
                if(!vocabular2.cuvinteVocabular[i].equals(this.cuvinteVocabular[j])){
                    contor++;
                }
            }

            if(contor == this.numarCuvinteVocabular){
                diferente++;
            }
        }

        return diferente;
    }

    public String toString(){
        String rezultat = "Cuvintele vocabularului : ";

        for(int i = 0; i < numarCuvinteVocabular; i++){
            rezultat += cuvinteVocabular[i] + " ";
        }

        return rezultat;
    }
}