/*
 * clasa aceasta va avea avioane de tip Concorde si Boeing
 */

class PassengerPlane extends Avion{
    private int maxPassengers;

    public PassengerPlane(String planeID, int totalEnginePower, int maxPassengers){
        super(planeID, maxPassengers);
        this.maxPassengers = maxPassengers;
    }
    public int getMaxPassengers(){
        return maxPassengers;
    }
}
