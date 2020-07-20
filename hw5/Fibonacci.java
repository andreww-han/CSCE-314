//Andrew Han 227009495




import static java.lang.System.out;

class SubsetOutputFib{
	public static void main (String[] args){
		int lo = 1;
		int hi = 1;
		int be = Integer.parseInt(args[0]);
		int en = Integer.parseInt(args[1]);
		String mark;
		if (be <=0 || en <= 0)
		{
			out.println("be and en arguments must be positive integers.");
		}
		else
		{
			if (be > en)
			{
				out.println("en must be greater than or equal to be.");
			}
			else
			{
				if (be == 1)
				{
					out.println("1: " + lo);
				}
				for (int i = 2; i <= en; i++)
				{
					if (hi % 2 == 0)
					{
						mark = " *";
					}
					else 
					{
						mark = "";
					}
					if (i >= be){
						out.println(i + ": " + hi + mark);
					}
					hi = lo + hi;
					lo = hi - lo;
				}
			}
		}
	}
}
class ImprovedFibonacci{
	static final int MAX_INDEX = 9;
	public static void main (String[] args){
		int lo = 1;
		int hi = 1;
		out.printf("1: %d%n", lo);
		for (int i = 2; i <= MAX_INDEX; i++)
		{
			if (hi % 2 == 0)
			{
				out.printf(i + ": %d %s %n", hi, "*");
			}
			else 
			{
				out.printf(i + ": %d%n", hi);
			}
			hi = lo + hi;
			lo = hi - lo;
		}
	}
}