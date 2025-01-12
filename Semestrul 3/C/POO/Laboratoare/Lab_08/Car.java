abstract class Car {
    // in main new Masina() nu va compila - > este doar pentru a imparti functionalitatea pe celelalte clase
    //clasele abstracte nu pot fi instantate
    public void porneste(){

    }

    public void opreste(){
        
    }
    //daca avem abstract la o metoda -> vom avea si clasa abstracta
    /* 
    public void alimenteaza(){
        System.out.println("Se alimenteaza...");
    }
    */

    public abstract void alimenteaza();
    //prima clasa neabstracta trebuie sa implementeze toate metodele si sa le suprascrie
}

class MasinaDiesel extends Car{
    public void alimenteaza(){
        System.out.println("Se alimenteaza cu Diesel");
    }
}

class MasinaElectrica extends Car{
    public void alimenteaza(){
        System.out.println("Se incarca...");
    }
}

/*
    Interfata se foloseste daca vrei sa iei functionalitati 
    Poti sa ai mai multe interfete 
    Poti extinde doar o clasa abstracta
 */
