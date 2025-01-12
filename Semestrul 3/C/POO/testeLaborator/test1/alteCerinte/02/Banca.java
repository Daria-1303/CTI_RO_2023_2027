class Banca {
    private ContBancar conturi[];
    private int numarConturi;

    public Banca() {
        this.conturi = new ContBancar[100];
        this.numarConturi = 0;
    }

    public boolean adaugaCont(ContBancar contAdaugat) {
        if (numarConturi < 100) {
            for (int i = 0; i < numarConturi; i++) {
                if (conturi[i].equals(contAdaugat)) {
                    return false;
                }
            }
            conturi[numarConturi++] = contAdaugat;
            return true;
        }
        return false;
    }

    public void afiseazaConturi() {
        System.out.println(this.toString());
    }

    public double soldTotal() {
        double total = 0;
        for (int i = 0; i < numarConturi; i++) {
            total += conturi[i].getSoldCurent();
        }
        return total;
    }

    public String conturiSubSoldMinim(double soldMinim) {
        String rezultat = "Conturi cu sold sub " + soldMinim + ":\n";
        for (int i = 0; i < numarConturi; i++) {
            if (conturi[i].getSoldCurent() < soldMinim) {
                rezultat += conturi[i].toString() + "\n";
            }
        }
        return rezultat;
    }

    public String toString() {
        String rezultat = "Conturile din banca : \n";
        for (int i = 0; i < numarConturi; i++) {
            rezultat += conturi[i].toString() + "\n";
        }
        return rezultat;
    }
}