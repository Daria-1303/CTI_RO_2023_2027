abstract class Project implements Risky{
    protected Member manager;
    protected String title;
    protected String obiectiv;
    protected long funds;

    public Project(Member manager, String title, String obiectiv, long funds){
        this.manager = manager;
        this.title = title;
        this.obiectiv = obiectiv;
        this.funds = funds;
    }
    public abstract void addMember(Member m);
}

class Member{
    /*
        participanti + manager -> programatori

        Un programator poate participa in mai multe proiecte
    */
    //caracteristici
    private int age;
    private String name;

    //constructor
    public Member(int age, String name){
        this.age = age;
        this.name = name;
    }

    //getters

    public int getAge(){
        return age;
    }

    public String getName(){
        return name;
    }
}


interface Risky{
    // poti direct si :
    // double getRisky();
    // intr o interfata modificatorul de acces public este implicit

    // aceasta metoda calculeaza riscurile legate de un proiect
    public double getRisk();
}

abstract class Deadline extends Project {
    protected String deadline;

    public Deadline(Member manager, String title, String obiectiv, long funds, String deadline) {
        super(manager, title, obiectiv, funds);
        this.deadline = deadline;
    }

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline;
    }
}

class CommercialProject extends Deadline{
    //maxim 15 membrii
    //private String deadline;
    //egale cu jumatate din fondurile normale si un nr de echipe mai mic decat nr de membrii
    private long marketingFunds;

    private Member [] members = new Member[15];
    private int memberCount = 0;

    public CommercialProject(Member manager, String title, String obiectiv, long funds, String deadline){
        super(manager, title, obiectiv, funds, deadline);
        //this.deadline = deadline;
        this.marketingFunds = super.funds / 2;
    }



    public void addMember(Member m){
        if (memberCount < members.length) {
            members[memberCount++] = m;
        } else {
            System.out.println("Nu se pot adăuga mai mulți membri.");
        }
    }

    public double getRisk() {
        int numTeams = memberCount < members.length ? memberCount : members.length - 1;

        return (numTeams * 3.0) / memberCount / (funds - marketingFunds);
    }
}

class MilitaryProject extends Deadline{
    //maxim 15 membrii
    //private String deadline;
    private String password;
    private Member [] members = new Member[15];
    private int memberCount = 0;

    public MilitaryProject(Member manager, String title, String obiectiv, long funds, String deadline, String password) {
        super(manager, title, obiectiv, funds, deadline);
        this.password = password;
        //this.deadline = deadline;
    }


    public void addMember(Member m){
        if (memberCount < members.length) {
            members[memberCount++] = m;
        } else {
            System.out.println("Nu se pot adăuga mai mulți membri.");
        }
    }

    public double getRisk() {
        return memberCount / (double) password.length() / funds;
    }

}

class OpenSourceProject extends Project{
    // numar nelimitat de membrii
    private String mailingList;
    private Member [] members = new Member[1000];
    private int memberCount = 0;

    public OpenSourceProject(Member manager, String title, String obiectiv, long funds, String mailingList){
        super(manager, title, obiectiv, funds);
        this.mailingList = mailingList;
    }


    public void addMember(Member m){
        if (memberCount < members.length) {
            members[memberCount++] = m;
        } else {
            System.out.println("Nu se pot adăuga mai mulți membri.");
        }
    }

    public double getRisk() {
        return memberCount / (double) funds;
    }
}

class InvestmentCompany {
    private Project[] projects;
    private int projectCount;

    public InvestmentCompany(int maxProjects) {
        projects = new Project[maxProjects];
        projectCount = 0;
    }

    public void addProject(Project p) {
        if (projectCount < projects.length) {
            projects[projectCount++] = p;
        } else {
            System.out.println("Nu se pot adăuga mai multe proiecte.");
        }
    }

    public Project getBestInvestment() {
        Project bestProject = null;
        double minRisk = Double.MAX_VALUE;

        for (int i = 0; i < projectCount; i++) {
            Project p = projects[i];
            if (p instanceof Risky) {
                double risk = ((Risky) p).getRisk();
                if (risk < minRisk) {
                    minRisk = risk;
                    bestProject = p;
                }
            }
        }
        return bestProject;
    }

    public static void main(String []args){
        Member manager = new Member(35, "Ion");
        InvestmentCompany company = new InvestmentCompany(10);

        CommercialProject commercial = new CommercialProject(manager, "Project A", "Objective A", 100000, "2025-12-31");
        MilitaryProject military = new MilitaryProject(manager, "Project B", "Objective B", 50000, "2025-06-30", "12345");
        OpenSourceProject openSource = new OpenSourceProject(manager, "Project C", "Objective C", 20000, "opensource@domain.com");

        commercial.addMember(new Member(10, "a"));
        commercial.addMember(new Member(9, "b"));

        military.addMember(new Member(13, "aa"));

        openSource.addMember(new Member(10, "aaa"));

        company.addProject(commercial);
        company.addProject(military);
        company.addProject(openSource);

        Project bestProject = company.getBestInvestment();
        System.out.println("The best investment project is: " + bestProject.title);
    }
}






