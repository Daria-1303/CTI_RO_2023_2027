import java.util.LinkedList;

interface Taskable{
    boolean execute(double secundeExecutie);
}

abstract class Task implements Taskable{
    protected String nume;

    public Task(String nume){
        this.nume = nume;
    }
}

class SimpleTask extends Task{
    private double timpRamas;

    public SimpleTask(String nume, double timpRamas){
        super(nume);
        this.timpRamas = timpRamas;
    }

    public boolean execute(double secundeExecutie){
        if(timpRamas <= 0){
            return true;
        }

        if(secundeExecutie >= timpRamas){
            timpRamas = 0;
            return true;
        }

        timpRamas -= secundeExecutie;
        return false;

        /*
         * // sau
         * timpRamas -= secundeExecutie;
         * 
         * return timpRamas <= 0;
         */
    }

    public String toString(){
        return "Name : " + nume + " Time : " + timpRamas;
    }
}

class ComposedTask extends Task{
    private LinkedList<SimpleTask> tasks;

    public ComposedTask(String nume, LinkedList<SimpleTask> tasks){
        super(nume);
        this.tasks = tasks;
    }

    public boolean execute(double secundeExecutie){
        int taskuriTerminate = 0;
        double parametru = secundeExecutie / tasks.size();

        for(SimpleTask t : tasks){
            if(t.execute(secundeExecutie)){
                taskuriTerminate++;
            }
        }

        return taskuriTerminate == tasks.size();
    }

    public String toString(){
        return "Name : " + nume + " - Content : " + tasks.toString();
    }
}

class Procesor{
    LinkedList <Task> tasks;

    public Procesor(LinkedList<Task> tasks){
        this.tasks = tasks;
    }

    public void finishAllTasks(){
        boolean flag = true;

        for(Task t : tasks){
            if(!t.execute(5)){
                flag = false;
            }
        }

        if(!flag){
            finishAllTasks();
        }
    }

    public String toString(){
        return "Procesor :  " + tasks.toString();
    }
}

class Main{
    public static void main(String[] args) {
        SimpleTask st1 = new SimpleTask("st1", 5);
        SimpleTask st2 = new SimpleTask("st2", 10);

        LinkedList<SimpleTask> st = new LinkedList<SimpleTask>();

        st.add(st1);
        st.add(st2);

        ComposedTask ct = new ComposedTask("ct", st);

        LinkedList<Task> tasks = new LinkedList<Task>();
        tasks.add(ct);

        Procesor p = new Procesor(tasks);

        p.finishAllTasks();

        System.out.println(p.toString());
    }
}