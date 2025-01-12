class Tir{
    private Remorca []remorci;
    private int nrRemorci;

    public Tir(){
        this.remorci = new Remorca[5];
        this.nrRemorci = 0;
    }

    public boolean adaugaRemorca(int nrCutii, String nrInmatriculare){
        if(nrRemorci < 5){
            remorci[nrRemorci++] = new Remorca(nrCutii, nrInmatriculare);
            return true;
        }else{
            return false;
        }
    }

    public boolean adaugaRemorca(Remorca remorca){
        if(nrRemorci < 5){
            remorci[nrRemorci++] = remorca;
            return true;
        }else{
            return false;
        }
    }

    public Remorca stergeRemorca(String nrInmatriculare){
        for(int i = 0; i < nrRemorci; i++){
            if(remorci[i].getNrInmatriculare().equals(nrInmatriculare)){
                Remorca remorcaStearsa = remorci[i];

                for(int j = i; j < nrRemorci - 1; j++){
                    remorci[j] = remorci[j + 1];
                }

                remorci[--nrRemorci] = null;

                return remorcaStearsa;
            }
        }

        return null;
    }

    public boolean equals(Object obj) {
        //return this.getTotalNrCutii() == otherTir.getTotalNrCutii();
        if(obj instanceof Tir){
            Tir otherTir = (Tir) obj;
            return this.getTotalNrCutii() == otherTir.getTotalNrCutii();
        }
        return false;
    }

    private int getTotalNrCutii() {
        int totalCutii = 0;
        for (int i = 0; i < nrRemorci; i++) {
            totalCutii += remorci[i].getNrCutii();
        }
        return totalCutii;
    }

    public String toString() {
        String result = "T -> ";
        for (int i = 0; i < nrRemorci; i++) {
            result += remorci[i].toString();
            if (i < nrRemorci - 1) {
                result += " -> ";
            }
        }
        return result;
    }


}
