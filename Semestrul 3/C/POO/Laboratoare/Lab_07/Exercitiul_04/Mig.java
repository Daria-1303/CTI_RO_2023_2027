class Mig extends FightPlane {
    public Mig(String planeID, int totalEnginePower){
        super(planeID, totalEnginePower);
    }

    public void highSpeedGeometry() {
		System.out.println(getPlaneID() + " - High speed geometry selected");
	}

	public void normalGeometry() {
		System.out.println(getPlaneID( )+ " - Normal geometry selected");
	}
}
