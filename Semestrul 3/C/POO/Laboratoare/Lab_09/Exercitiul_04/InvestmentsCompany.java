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
}
