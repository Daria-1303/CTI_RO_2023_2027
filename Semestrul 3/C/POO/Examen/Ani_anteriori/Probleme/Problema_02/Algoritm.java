import java.util.Random;
import java.util.Date;

public abstract class Algoritm
{
	protected Integer arr[];
	protected int N;
	private static Date now = new Date();
	private static  long sec = now.getTime();
	private static Random random = new Random( sec );
	
	public Algoritm(int N)
	{
		this.N = N;
		arr = new Integer[ N ];
		for(int i=0; i < N; i++)
			arr[ i ] = random.nextInt(1000000 );
	}
	
	public abstract boolean search(Integer val);
	
	@Override
	public String toString()
	{
		String text = "Numar: " + N + ", ";
		text += "{";
		for(int i=0; i < N - 1; i++)
			text += arr[ i ] + ", ";
		if(N > 0)
		   text += arr[N - 1] + "}";
		return text;
	}
}