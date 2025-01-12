/*
Creează un program care gestionează studenți și cursuri la universitate. Fiecare student are un nume, un număr matricol și o medie generală. 

Creează două clase, Student și Curs, și implementează următoarele funcționalități:

adaugaStudent(Student student): adaugă un student într-un curs, dacă nu există deja un student cu același număr matricol.

afiseazaStudenti(): afișează toți studenții din curs în formatul "Nume: [nume], Nr Matricol: [numar], Medie: [medie]".\

medieGenerala(): calculează și returnează media generală a studenților din curs.

studentiCuMediaPeste(double medieMinima): returnează un string cu toți studenții care au media mai mare decât valoarea specificată.
 * 
 */

class Client{
    public static void main(String []args){
        Curs curs1 = new Curs();

        Student student1 = new Student("Daria", 13, 9);
        Student student2 = new Student("Diana", 24, 9.5);
        Student student3 = new Student("Anisia", 14, 10);

        curs1.adaugaStudent(student1);
        curs1.adaugaStudent(student2);
        curs1.adaugaStudent(student3);

        //adaugam un student deja existent
        curs1.adaugaStudent(student1);


        System.out.print(curs1.toString() + "\n");

        System.out.println("Media generala a studentilor de la cursul selectat este: " + curs1.medieGenerala());

        System.out.println(curs1.studentiCuMediaPeste(9.5));
    }
}