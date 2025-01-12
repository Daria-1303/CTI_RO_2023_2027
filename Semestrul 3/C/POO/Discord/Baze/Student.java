class Student{
    //campurile clasei
    private String numeStudent;
    private double medie;

    //constructor

    public Student(String numeStudent, double medie){
        //parametrii constructorului sunt atribuiti campurilor clasei
        this.numeStudent = numeStudent;
        this.medie = medie;
    }

    //poti sa iti formezi si settere care sa seteze doar un camp

    public void setNumeStudent(String numeStudent){
        this.numeStudent = numeStudent;
    }

    // getter

    public double getMedie(){
        return medie;
    }

    public String getNumeStudent(){
        return numeStudent;
    }
}