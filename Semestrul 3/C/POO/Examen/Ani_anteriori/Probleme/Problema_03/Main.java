import java.util.Random;
public class Main
{
	public static void main(String[] args)
	{
		Eveniment[] evenimente = new Eveniment[ 10 ];
		for(int i=0; i < evenimente.length; i++)
			if(Math.random() <= 0.5)
				evenimente[ i ] = new Eveniment1();
			else
				evenimente[ i ] = new Eveniment2();
			
	    ComponentaSimpla cs = new ComponentaSimpla();
		
		Random rand = new Random();
		
		for(int i=0; i < 20; i++)
			cs.trateaza( evenimente[rand.nextInt( 10 )  ] );
		//System.out.println( cs );
		
		ComponentaDecorativa cd = new ComponentaDecorativa( cs );
		
		for(int i=0; i < 20; i++){
			cd.trateaza(evenimente[rand.nextInt( 10 ) ] );
			cd.continua(evenimente[rand.nextInt( 10 ) ] );
		}
		
		//System.out.println( cd );
		
		ComponentaMultipla cm = new ComponentaMultipla();
		cm.adaugaComponenta( cs );
		cm.adaugaComponenta( cd );
		cm.adaugaComponenta( new ComponentaSimpla() );
		
		//for(int i=0; i < 200; i++)
			cm.trateaza(evenimente[ rand.nextInt( 10 ) ] );
		
		//System.out.println( cm );
		
	}
}
