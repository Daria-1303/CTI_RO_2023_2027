class Program1{
    public static void main(String []args){
        System.out.println("Hello world!");

        //declaram un student
        Student student1 = new Student("Bianca", 10);

        System.out.println(student1.getMedie());

        System.out.println("Nume student : " + student1.getNumeStudent());

        student1.setNumeStudent("Daria");

        System.out.println("Noul nume al studentului este : " + student1.getNumeStudent());

    }  
}
