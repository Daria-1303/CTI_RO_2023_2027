public class Main {
    public static void main(String[] args) {
        Avion avion = new Avion("avion", 100);
        AvionDeLupta avionDeLupta = new AvionDeLupta("avionDeLupta", 200);

        avion.takeOff();
        avion.land();
        avion.fly();

        avionDeLupta.takeOff();
        avionDeLupta.land();
        avionDeLupta.fly();
        avionDeLupta.launchMissile();

        AvionDePasageri avionDePasageri = new AvionDePasageri("avionDePasageri", 300, 400);
        Boeing boeing = new Boeing("boeing", 500, 600);
        Concorde concorde = new Concorde("concorde", 700, 800);

        System.out.println("Avion: " + avion);
        System.out.println("AvionDeLupta: " + avionDeLupta);
        System.out.println("AvionDePasageri: " + avionDePasageri);
        System.out.println("Boeing: " + boeing);
        System.out.println("Concorde: " + concorde);


        Mig mig = new Mig("mig", 900);
        TomCat tomCat = new TomCat("tomCat", 1000);
    
        mig.takeOff();
        mig.land();
        mig.fly();
        mig.launchMissile();
        mig.highSpeedGeometry();
        mig.normalGeometry();

    }
}
