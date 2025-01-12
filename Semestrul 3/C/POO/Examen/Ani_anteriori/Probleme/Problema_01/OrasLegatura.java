import java.util.LinkedList;
import java.util.Iterator;

public class OrasLegatura extends Oras
{
	private LinkedList<Oras> secventa;
	private Resursa ultimaResursa;
	
	public OrasLegatura(String nume, Oras... secventa)
	{
		super( nume );
		this.secventa = new LinkedList<Oras>();
		for(Oras tmp : secventa)
			this.secventa.add( tmp );
		ultimaResursa = null;
	}
	
	@Override
	public void actioneazaRunda(Resursa resursa)
	{
		Iterator<Oras> it = secventa.iterator();
		ultimaResursa = resursa;
		while( it.hasNext() )
		{
			if(Math.random() > 0.5)
				it.next().actioneazaRunda( resursa );
			else
			  it.next();
		}
	}
	
	@Override
	public double proceseazaCastigator()
	{
		if(secventa == null) return 0;
		return secventa.size()*ultimaResursa.calculeazaValoare();
	}
}
