// Andrew Han 227009495
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import java.util.concurrent.locks.Condition;

public class Time {
	public static int x = 0;
	private Lock timeLock = new ReentrantLock();
	private Condition messagePrintCondition = timeLock.newCondition();

	public void increment() throws InterruptedException{
		timeLock.lock();
		try{
			x++;
			System.out.print(x + " ");
			messagePrintCondition.signalAll();
		}
		finally {timeLock.unlock();}
	}

	public void checkcond(int check, int instance) throws InterruptedException{
		timeLock.lock();
		try{
			while((x % check) != 0){
				messagePrintCondition.await();
			}
			if (instance == 1){
				System.out.println("\n-- " + check + " second message");
			}
			else{
				System.out.println("\n***** " + check + " second message");
			}
			Thread.sleep(1);
		}
		finally{
			timeLock.unlock();
		}
	}
	public static void main(String[] args) {
		Time counter = new Time();
		TimePrinting tp = new TimePrinting(counter);
		MessagePrinting mp5 = new MessagePrinting(counter, 5);
		MessagePrinting mp11 = new MessagePrinting(counter, 11);
	}
}

class TimePrinting implements Runnable {
	Time timeCounter;
	public TimePrinting(Time counter){
		timeCounter = counter;
		new Thread(this).start(); 
	}	
	public void run(){
		try{
			for (;;){
				timeCounter.increment();
				Thread.sleep(1000);
			}
		} catch (InterruptedException e){}
	}
}

class MessagePrinting implements Runnable {
	private Time timeCounter;
	private int timeCheck;
	private static int messagePrintingInstances = 0;
	private int instance;
	public MessagePrinting(Time counter, int check){
		timeCounter = counter;
		timeCheck = check;
		messagePrintingInstances++;
		instance = messagePrintingInstances;
		new Thread(this).start(); 
	}
	public void run(){
		try{
			for (;;){
				timeCounter.checkcond(timeCheck,instance);
				Thread.sleep(1000);
			}
		} catch (InterruptedException e){}
	}
}