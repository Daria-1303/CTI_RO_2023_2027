class BooleanComparison{
    public static void main(String []args){

        Boolean b1 = Boolean.TRUE;
        Boolean b2 = new Boolean(true); //deprecated and marked for removal warning
        Boolean b3 = Boolean.valueOf(false);

        if(b1.equals(b3)){
            System.out.println("Obiectele Boolean infasoara aceeasi valoare logica");
        }
        else{
            System.out.println("Obiectele Boolean NU infasoara aceeasi valoare logica");
        }
    }

}
