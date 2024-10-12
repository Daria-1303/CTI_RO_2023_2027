//Compilati si lansati programul Hello World

//javac nume.java compilare
//java nume executare

class Aplicatie{

    //asta e metoda de care avem nevoie
    //se uita prin toate clasele definite in fisier]\
    //fiecare clasa trebuie sa aiba metoda asta in ea
    //main e numele metodei, comportamentului
    //putem manipula argumentele
    public static void main(String[] args){
        //fiind publica o poate folosi orice clasa din fisier
        //static poate face ca sa fie Aplicatie.main()

        //System.out.println("Hello World!");
        //clasa system si metoda println

        /*int x = 3;
        if(x > 4){
            System.out.println(x);
        }
        else{
            System.out.println("Nu");
        }

        */

        // int a = 50, b = 60;
        // if(a > b){
        //     System.out.println(a);
        // }
        // else{
        //     System.out.println(b);
        // }

        int sumaPare = 0;
        for(int i = 1; i <=100; i++){
            if(i % 2 == 0){
                sumaPare += i;
            }
            else{
                System.out.println(i);
            }
        }

        System.out.println("Suma nr pare este " + sumaPare);

    }
}
