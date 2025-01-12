import java.util.*;

public class OrasComercial extends Oras
{
	private LinkedList<Resursa> secventa;
	
	public OrasComercial(String nume, Resursa... secventa)
	{
		super( nume );
		this.secventa = new LinkedList<Resursa>();
		for(Resursa tmp : secventa)
			this.secventa.add( tmp );
	}
	
    @Override
	public void actioneazaRunda(Resursa resursa)
	{
		double valoare = resursa.calculeazaValoare();
		
		double min = 0;
		Iterator<Resursa> it = secventa.iterator();
		
		while( it.hasNext() )
		{
			Resursa tmp = it.next();
			if(min > tmp.calculeazaValoare() )
				min = tmp.calculeazaValoare();
		}
		if(min < valoare)
			secventa.add( resursa );
		else 
			System.out.println( "Resursa nu este suficient de valoroasa");
	}
	
	@Override
	public double proceseazaCastigator()
	{
		double sum = 0;
		
		Iterator<Resursa> it = secventa.iterator();
		
		while( it.hasNext() )
			sum += it.next().calculeazaValoare();
		return sum;
	}
}
