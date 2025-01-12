class AvionDeLupta extends Avion{
    public AvionDeLupta(String planeID, int totalEnginePower){
        super(planeID, totalEnginePower);
    }

    public void launchMissile() {
        System.out.println(
                getPlaneID() +
                        " - Initiating missile launch procedure - Acquiring target - Launching missile - Breaking away - Missile launch complete"
        );
    }
}

class Mig extends AvionDeLupta{
    public Mig(String planeID, int totalEnginePower) {
		super(planeID, totalEnginePower);
	}

	public void highSpeedGeometry() {
		System.out.println(getPlaneID() + " - High speed geometry selected");
	}

	public void normalGeometry() {
		System.out.println(getPlaneID( )+ " - Normal geometry selected");
	}
}

class TomCat extends AvionDeLupta{
    public TomCat(String planeID, int totalEnginePower) {
		super(planeID, totalEnginePower);
	}

	public void refuel() {
		System.out.println(
			getPlaneID() +
			" - Initiating refueling procedure - Locating refueller - Catching up - Refueling - Refueling complete"
		);
	}
}