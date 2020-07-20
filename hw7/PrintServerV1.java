//Andrew Han 227009495


import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import java.util.concurrent.locks.Condition;
import java.util.LinkedList; 
import java.util.Queue;

public class PrintServerV1 implements Runnable {
	private static final Queue<String> requests = new LinkedList<String>();
	private int serialNum = 1;
	private String id;
	private String message;
	private static Lock printServerLock = new ReentrantLock();
	private static Condition emptyQueueCondition = printServerLock.newCondition();
	public PrintServerV1(String title, int n, String msg) {
    	message = "Client " + n + " Class: " + this.getClass() + " Message: " + msg;
		if (title == "manager"){
			id = "manager";
		}
		else{
			id = "client";
		}
		new Thread(this).start();
	}
	public void printRequest(String s) {
		printServerLock.lock();
		try{
			requests.add(s+" "+serialNum++);
			emptyQueueCondition.signalAll();
		}
		finally{
			printServerLock.unlock();
		}
	}

	public void run(){
		for(int i = 0; i < 10; i++){
                try {
			if (id == "client"){
				printRequest(this.message);
			}
			else{
				printServerLock.lock();
				try{
					while(requests.size() == 0)
						emptyQueueCondition.await();
					while (requests.size() > 0)
						realPrint(requests.remove());
				}
				catch (InterruptedException e) {}
				finally {printServerLock.unlock();}
			}	
                        Thread.sleep(100);
                } catch (InterruptedException e) {}
		}
	}
	private void realPrint(String s) {
		System.out.println(s);
	}

	public static void main(String[] args) { // for PrintServerV1
		// The following invocations of the constructor,
		// the first argument is title and the second argument is ID
		PrintServerV1 m = new PrintServerV1("manager", 1, "");
		PrintServerV1 c1 = new PrintServerV1("client1", 11, "Hello");
		PrintServerV1 c2 = new PrintServerV1("client2", 22, "Howdy");
	}
}
