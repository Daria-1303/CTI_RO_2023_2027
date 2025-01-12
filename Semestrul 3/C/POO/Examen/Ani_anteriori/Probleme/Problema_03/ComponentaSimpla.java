public class ComponentaSimpla extends Componenta
{
	private  Eveniment tab1[];
	private int pos1 = 0;
	private int tab2[], pos2 = 0;
	
	public ComponentaSimpla()
	{
		tab1 = new Eveniment[ 1024 ];
		tab2 = new int[ 1024 ];
	}
	
	@Override
	public void trateaza(Eveniment ev)
	{
		boolean ok = true;
		for(int i=0; i < pos1; i++)
			if(ev.equals( tab1[ i ] ) )
			{
				ok = false;
				tab2[ i ]++;
			}
		if(ok && pos1 != 1024)
		{
			tab1[ pos1++ ] = ev;
			tab2[ pos2++ ] = 1;
			inregistreazaEveniment( ev );
		}
	}
	
	public void continua(Eveniment ev)
	{
		System.out.println(this + " nu mai poate continua");
	}
	
	@Override
	public String toString()
	{
		int tratari = 0;
		for(int i=0; i < pos2; i++)
			tratari += tab2[ i ];
	return "ComponentaSimpla[" + tratari + "]";
	}
}
