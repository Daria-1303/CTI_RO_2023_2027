import java.util.LinkedList;
import java.util.Iterator;

public class TestAlgoritm
{
	private LinkedList<Algoritm> algoritmi;
	
	public TestAlgoritm()
	{
		this.algoritmi = new LinkedList<Algoritm>();
	}
	
	public void addAlgoritm(Algoritm algoritm) throws IllegalArgument
	{
		if(algoritm == null)
			throw new IllegalArgument();
		
		algoritmi.add( algoritm );
	}
	
	public void analyze(Integer nr)
	{
		Iterator<Algoritm> it = algoritmi.iterator();
		
		while(it.hasNext())
		{
			Algoritm tmp = it.next();
			
			if(tmp.search( nr ) )
				System.out.println( tmp );
		}
	}
}