class Avion {
    //Caracteristici
    private String planeID;
    private int totalEnginePower;
    
    //Constructor

    public Avion(String planeID, int totalEnginePower) {
        this.planeID = planeID;
        this.totalEnginePower = totalEnginePower;
    }
    
    //getters 

    public String getPlaneID(){
        return planeID;
    }

    public int getEnginePower(){
        return totalEnginePower;
    }

    //Methods

    public void takeOff(){
        System.out.println(
			planeID +
			" - Initiating takeoff procedure - Starting engines - Accelerating down the runway - Taking off - Retracting gear - Takeoff complete"
		);
    }

    public void land(){
        System.out.println(
            planeID +
            " - Flying"
            );
    }

    public void fly(){
        System.out.println(
			planeID +
			" - Initiating landing procedure - 	Enabling airbrakes - Lowering gear - Contacting runway - Decelerating - Stopping engines - Landing complete"
		);
    }   
}

