class Curs{
    Student[] studenti;
    int numarStudenti;

    public Curs() {
        this.studenti = new Student[100];
    }

    public boolean adaugaStudent(Student studentAdaugat){
        if(numarStudenti < 100){
            for(int i = 0; i < numarStudenti; i++){
                if(studenti[i].equals(studentAdaugat)){
                    return false;
                }
            }

            studenti[numarStudenti++] = studentAdaugat;

            return true;
        }

        return false;
    }


    public String toString(){
        String rezultat = "Studentii de la curs sunt : \n";

        for(int i = 0; i < numarStudenti; i++){
            rezultat += studenti[i].toString() + "\n";
        }

        return rezultat;
    }

    public double medieGenerala(){
        if(numarStudenti == 0){
            return 0;
        }

        double mediiAdunate = 0;

        for(int i = 0; i < numarStudenti; i++){
            mediiAdunate += studenti[i].getMedieGenerala();
        }

        return mediiAdunate / numarStudenti;
    }

    public String studentiCuMediaPeste(double mediePrag){
        String listaStudenti =  "Lista de studenti cu media peste " + mediePrag + " este : ";

        for(int i = 0; i < numarStudenti; i++){
            if(studenti[i].getMedieGenerala() >= mediePrag){
                listaStudenti += studenti[i].getNumeStudent() + " ";
            }
        }

        listaStudenti += "\n";

        return listaStudenti;
    }
}