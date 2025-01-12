class Avion{
    private String planeID;
    private int totalEnginePower;

    public Avion(String planeID, int totalEnginePower){
        this.planeID = planeID;
        this.totalEnginePower = totalEnginePower;
    }

    public String getPlaneID(){
        return planeID;
    }

    public int getTotalEnginePower(){
        return totalEnginePower;
    }

    public void takeOff(){
        System.out.println(
            planeID + 
                " - Initiating takeof procedure - Starting engines - Accelerating downthe runway - Taking of - Retracting gear - Takeof complete");
    }

    public void land(){
        System.out.println(
            planeID + 
            " - Initiating landing procedure - Enabling airbrakes - Lowering gear - Contacting runway - Decelerating - Stopping engines - Landing complete");
    }

    public void fly(){
        System.out.println(
			planeID +
			        " - Initiating landing procedure - 	Enabling airbrakes - Lowering gear - Contacting runway - Decelerating - Stopping engines - Landing complete"
		);
    }

    @Override
    public String toString(){
        return "Avion{" + "planeID='" + planeID + '\'' + ", totalEnginePower=" + totalEnginePower + '}';
    }
}