class AvionDePasageri extends Avion{
    private int maxPassengers;

    public AvionDePasageri(String planeID, int totalEnginePower, int maxPassengers){
        super(planeID, totalEnginePower);
        this.maxPassengers = maxPassengers;
    }

    public int getMaxPassengers(){
        return maxPassengers;
    }
}

class Boeing extends AvionDePasageri{
    public Boeing(String planeID, int totalEnginePower, int maxPassengers) {
		super(planeID, totalEnginePower, maxPassengers);
	}
}

class Concorde extends AvionDePasageri{

    public Concorde(String planeID, int totalEnginePower, int maxPassengers){
        super(planeID, totalEnginePower, maxPassengers);
    }

    public void goSuperSonic(){
        System.out.println(getPlaneID() + " - Supersonic mode activated");
    }

    public void goSubsonic() {
		System.out.println(getPlaneID() + " - Supersonic mode deactivated");
	}
}