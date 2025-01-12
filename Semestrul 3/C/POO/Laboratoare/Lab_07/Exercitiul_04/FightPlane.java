class FightPlane extends Avion{

    public FightPlane(String planeID, int totalEnginePower){
        super(planeID, totalEnginePower);
    }

    public void launchMissile() {
        System.out.println(
                getPlaneID() +
                        " - Initiating missile launch procedure - Acquiring target - Launching missile - Breaking away - Missile launch complete"
        );
    }
}
