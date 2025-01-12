class Piramida{
    private int n;
    static int k = 1;

    public Piramida(int n){
        this.n = n;
    }

    public void tiparire(){
        for(int i = n; i >= 1; i--){

            for(int j = 1; j <= i; j++){
                if(k != n){
                    System.out.print(k + " ");
                }
            }
            k = k + 1;
            if(k != n){
                System.out.println();
            }

        }

        System.out.println(n + " --> n");
    }
}
