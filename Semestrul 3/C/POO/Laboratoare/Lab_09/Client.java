//folosim mai mult interfetele decat clasele abstracte
interface Watch -> Timeable {
    final int CURRENT_YEAR = 2024;
    void showTime();
    void startTimer();
    void setTime(long time);
    /*
        in interfaca orice declaram va fi public si abstract
        in interfete nu exista implementari

        putem defini constante cu final
        nu putem avea campuri private, caci interfetele nu pot fi instantiate
    */
}

// putem avea interfete care se extind una pe alta
interface Test extends Timeable{

}

abstract class Watch2 {
    public static int CURRENT_YEAR = 2024;
    public abstract void showTime();
    public abstract void startTimer();
    public abstract void setTime(long time);
    /*
        in interfaca orice declaram va fi public si abstract
        in interfete nu exista implementari

        putem defini constante cu final
        nu putem avea campuri private, caci interfetele nu pot fi instantiate
    */
}

class SmartWatch implements Watch{
    /*
        Trebuie sa fie implementate toate metodele din interfata
        In loc de interfata puteam sa ne facem o vlasa abstracta si sa avem public static sau public abstract
        O clasa poate sa implementeze mai multe interfete, pe cand ea poate sa extinda doar o mostenire
    */
}

class SmartWatch extends Watch2{
    /*
        Preia toate campurile din Watch2 (clasa abstracta)

    */
}

abstract class Phone {
    //aici poti da sa implementeze si Watch
    // -> ar fi insemnat ca in SmartPhone ar fi trebuit sa implementam toate metodele
    public abstract void call();
    public abstract void answer();
}


class SmartPhone extends Phone implements Watch, InternetConnector{

}

//interfetele -> I la inceput sau un adjectiv mai mult ITimeable

// sa zicem ca avem un main
class Client{
    public static void main(String []args){
        Watch []watches = new Watch[5];
        watches[0] = new SmartPhone();
        watches[1] = new SmartWatch();
    }
}
