class Project{
    // modeleaza un proiect software
    //orice proiect are un manager
    protected String title;
    protected String objective;
    protected long funds;

    private Member manager;
    protected Member [] members;
    protected int memberCount;

    public Project(String title, String objective, long funds, Member manager, int maxMembers) {
        this.title = title;
        this.objective = objective;
        this.funds = funds;
        this.manager = manager;
        this.members = new Member[maxMembers];
        this.memberCount = 0;
        addMember(manager);  // Managerul este automat adaugat ca membru
    }

    // metoda de adaugare membru
    public void addMember(Member m){
        if (memberCount < members.length) {
            members[memberCount++] = m;
        } else {
            System.out.println("Nu se pot adăuga mai mulți membri.");
        }
    }

    //getters

    public Member[] getMembers() {
        return members;
    }

    public Member getManager() {
        return manager;
    }

    public long getFunds() {
        return funds;
    }
}
