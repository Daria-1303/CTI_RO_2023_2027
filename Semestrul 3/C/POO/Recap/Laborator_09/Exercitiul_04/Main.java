import java.util.ArrayList;

interface Risky {
    double getRisk();
}

abstract class Project implements Risky {
    private Member manager;
    protected ArrayList<Member> members;
    private String title;
    private String objective;
    private long funds;

    public Project(String title, String objective, long funds, Member manager) {
        this.title = title;
        this.objective = objective;
        this.funds = funds;
        this.manager = manager;
        this.members = new ArrayList<>();
    }

    public long getFunds() {
        return funds;
    }

    public void addMember(Member m) {
        if (members.contains(m)) {
            System.out.println("Member already in project");
        } else {
            members.add(m);
        }
    }

    public String toString() {
        return "Title: " + title + ", Objective: " + objective + ", Manager: " + manager.getName();
    }
}

class Member {
    private String name;
    private int age;

    public Member(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public String toString() {
        return "Member: " + name + ", Age: " + age;
    }
}

abstract class Deadlined extends Project {
    protected String deadline;
    protected final static int MAX_MEMBERS = 15;

    public Deadlined(String title, String objective, long funds, String deadline, Member manager) {
        super(title, objective, funds, manager);
        this.deadline = deadline;
    }

    
    public void addMember(Member m) {
        if (members.size() < MAX_MEMBERS) {
            super.addMember(m);
        } else {
            System.out.println("Project is full");
        }
    }
}

class CommercialProject extends Deadlined {
    private long marketingFunds;
    private int teams;

    public CommercialProject(String title, String objective, long funds, String deadline, int teams, Member manager) {
        super(title, objective, funds, deadline, manager);
        this.marketingFunds = funds / 2;
        this.teams = teams;
    }

   
    public double getRisk() {
        return (double) teams * 3 / members.size() / (getFunds() - marketingFunds);
    }

    public String toString() {
        return super.toString() + ", Type: Commercial, Risk: " + getRisk();
    }
}

class MilitaryProject extends Deadlined {
    private String password;

    public MilitaryProject(String title, String objective, long funds, String deadline, String password, Member manager) {
        super(title, objective, funds, deadline, manager);
        this.password = password;
    }

    
    public double getRisk() {
        return (double) members.size() / password.length() / getFunds();
    }

    public String toString() {
        return super.toString() + ", Type: Military, Risk: " + getRisk();
    }
}

class OpenSourceProject extends Project {
    private String mailingList;

    public OpenSourceProject(String title, String objective, long funds, String mailingList, Member manager) {
        super(title, objective, funds, manager);
        this.mailingList = mailingList;
    }

    
    public double getRisk() {
        return (double) members.size() / getFunds();
    }

    public String toString() {
        return super.toString() + ", Type: Open Source, Risk: " + getRisk();
    }
}

class InvestmentCompany {
    private ArrayList<Project> projects;

    public InvestmentCompany() {
        this.projects = new ArrayList<>();
    }

    public void addProject(Project p) {
        projects.add(p);
    }

    public Project getBestInvestment() {
        Project best = projects.get(0);
        for (Project p : projects) {
            if (p.getRisk() < best.getRisk()) {
                best = p;
            }
        }
        return best;
    }

    public static void main(String[] args) {
        Member manager1 = new Member("Alice", 35);
        Member manager2 = new Member("Bob", 40);
        Member manager3 = new Member("Charlie", 30);

        Member m1 = new Member("Dave", 25);
        Member m2 = new Member("Eve", 28);
        Member m3 = new Member("Frank", 27);

        InvestmentCompany ic = new InvestmentCompany();

        CommercialProject cp = new CommercialProject("Commercial1", "Build App", 10000, "2024-12-31", 5, manager1);
        cp.addMember(m1);
        cp.addMember(m2);

        MilitaryProject mp = new MilitaryProject("Military1", "Security System", 20000, "2025-01-01", "secure123", manager2);
        mp.addMember(m3);

        OpenSourceProject op = new OpenSourceProject("OpenSource1", "Library Project", 5000, "opensource-dev", manager3);
        op.addMember(m1);
        op.addMember(m2);
        op.addMember(m3);

        ic.addProject(cp);
        ic.addProject(mp);
        ic.addProject(op);

        System.out.println("Best Investment: " + ic.getBestInvestment());
    }
}
