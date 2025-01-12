import java.util.LinkedList;
import java.util.Iterator;
public class ResursaCulturala extends Resursa
{
	private LinkedList<String> componente;
	
	public ResursaCulturala(String nume, int cantitate, String... componente)
	{
		super(nume, cantitate);
		this.componente = new LinkedList<String>();
		
		for(String tmp : componente)
			this.componente.add( tmp );
	}
	
	@Override
	public double calculeazaValoare()
	{
		return componente.size()*cantitate;
	}
	
	@Override
	public String toString()
	{
		String text = "Culturala: " + nume + " " + cantitate + " ";
		Iterator<String> it = componente.iterator();
		
		while( it.hasNext() )
			text += it.next() + " ";
		return text;
	}
}
