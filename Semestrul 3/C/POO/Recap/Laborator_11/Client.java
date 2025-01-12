import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

class Student{
    private int nrMatricol;
    private String nume;
    private int anInmatriculare;

    //...

    public Student(int nrMatricol, String nume, int anInmatriculare){
        this.nrMatricol = nrMatricol;
        this.nume = nume;
        this.anInmatriculare = anInmatriculare;
    }

    public int getNrMatricol(){
        return nrMatricol;
    }

    public String getNume(){
        return nume;
    }

    public int getAnInmatriculare(){
        return anInmatriculare;
    }
}

// class Client{
//     public static void main(String [] args){
//         ArrayList studenti = new ArrayList(32);
//         studenti.add(new Student(192, "Mario", 2020));
//         studenti.add(new Student(193, "Daniel", 2024));
//     }
// }


class Client{
    public static void main(String [] args){
        ArrayList<Student> studenti = new ArrayList<Student>(32);
        studenti.add(new Student(192, "Mario", 2020));
        studenti.add(new Student(193, "Daniel", 2024));

        Iterator <Student> it = studenti.iterator(); // imi returneaza un obiect de tip Iterator

        while(it.hasNext()){
            Student s = it.next();
            System.out.println(s.getNrMatricol() + " " + s.getNume() + " " + s.getAnInmatriculare());
        }

        //sau putem face

        for(Student s : studenti){
            System.out.println(s.getNrMatricol() + " " + s.getNume() + " " + s.getAnInmatriculare());
        }
    }
}

class Client2{
    public static void main(String[] args) {
        // list este parintele pentru arraylist

        //putem la lista sa ne facem un linkedlist
        
        List<Student> studenti = new LinkedList<Student>();

        studenti.add(new Student(192, "Mario", 2020));
        studenti.add(new Student(193, "Daniel", 2024));

        for(Student s : studenti){
            System.out.println(s.getNrMatricol() + " " + s.getNume() + " " + s.getAnInmatriculare());
        }

        //remove

        studenti.remove(0);

        //get

        Student s = studenti.get(0);

        //pentru random acces putem lua un arraylist


        // putem sa aplicam metoda hashcode -> ca sa putem sa facem comparatii intre obiecte
        // linked list -> e mai bun pentru adaugare si stergere

    }
}