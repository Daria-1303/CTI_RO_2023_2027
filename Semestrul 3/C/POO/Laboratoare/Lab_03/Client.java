class Client{
    public static void main(String []args){
        Student s1 = new Student("Catalin", 29, 150);
        Student s2 = new Student("Csatalin", 29, 150);

        System.out.println(s1 == s2);
        System.out.println(s1.equals(s2));

        //asta afiseaza numele clasei si o ?adresa?
        //system out apeleaza to string de fapt cand faci concatenarex
        System.out.println(s1);
    }

}
