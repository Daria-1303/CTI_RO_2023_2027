class Main {
    public static void main(String[] args) {
        Avion []avioane = new Avion[4];

        avioane[0] = new Boeing("Boeing-747", 10000, 400);
        avioane[1] = new Concorde("Concorde-123", 15000, 100);
        avioane[2] = new Mig("Mig-29", 8000);
        avioane[3] = new TomCat("F14-TomCat", 9000);


        for (Avion plane : avioane) {
            plane.takeOff();
            plane.fly();
            plane.land();
            
            if (plane instanceof Concorde) {
                ((Concorde) plane).goSuperSonic();
                ((Concorde) plane).goSubSonic();
            } else if (plane instanceof Mig) {
                ((Mig) plane).highSpeedGeometry();
                ((Mig) plane).normalGeometry();
            } else if (plane instanceof TomCat) {
                ((TomCat) plane).refuel();
            } else if (plane instanceof FightPlane) {
                ((FightPlane) plane).launchMissile();
            }
            
            System.out.println();
        }
    }
}
