import java.util.*;

public class Modelator
{
	private ArrayList<Oras> orase;
	private int maxRunde;
	
	public Modelator(int maxRunde, Oras... orase)
	{
		this.maxRunde = maxRunde;
		
		this.orase = new ArrayList<Oras>(orase.length);
		
		for(Oras tmp : orase)
			this.orase.add( tmp );
	}
	
	public Oras desfasoaraJoc(List<Resursa> resurse)
	{
		Iterator<Resursa> it = resurse.iterator();
		
		for(int i=0; it.hasNext() && i < maxRunde; i++)
			orase.get(i % orase.size()).actioneazaRunda( it.next() );
		double max = 0;
		Oras castigator = null;
		for(int i=0; i < orase.size(); i++)
			if(max < orase.get( i ).proceseazaCastigator() ){
				max = orase.get( i ).proceseazaCastigator();
				castigator = orase.get( i );
			}
	    return castigator;
	}
}
