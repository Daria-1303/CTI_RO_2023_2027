class Student{
    String numeStudent;
    int numarMatricol;
    double medieGenerala;

    //constructor

    public Student(String numeStudent, int numarMatricol, double medieGenerala) {
        this.numeStudent = numeStudent;
        this.numarMatricol = numarMatricol;
        this.medieGenerala = medieGenerala;
    }

    //gettere
    public String getNumeStudent() {
        return numeStudent;
    }

    public int getNumarMatricol() {
        return numarMatricol;
    }

    public double getMedieGenerala() {
        return medieGenerala;
    }

    //equals

    public boolean equals(Object obj){
        if(obj instanceof Student){
            Student otherStudent = (Student) obj;
            
            return this.getNumarMatricol() == otherStudent.getNumarMatricol();
        }
        
        return false;
    }


    public String toString(){  
        return "Nume: " + numeStudent + ", Numar Matricol : " + numarMatricol + ", Medie generala: " + medieGenerala;
    }


}
