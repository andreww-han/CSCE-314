//Andrew Han 227009495

import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import java.util.concurrent.locks.Condition;
import java.util.LinkedList; 
import java.util.Queue;

public class PrintServerV2 implements Runnable {
	private static final Queue<String> requests = new LinkedList<String>();
	private int serialNum = 1;
	private String id;
	private String message;
	private static Object printServer = new Object();
	public PrintServerV2(String title, int n, String msg) {
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
		synchronized(printServer){
			requests.add(s+" "+serialNum++);
			printServer.notifyAll();
		}
	}

	public void run(){
		for(int i = 0; i < 10; i++){
            try {
				if (id == "client"){
					printRequest(this.message);
				}
				else{
					synchronized(printServer){
						while(requests.size() == 0)
							printServer.wait();
						while (requests.size() > 0)
							realPrint(requests.remove());
					}
				}	
            Thread.sleep(100);
            } catch (InterruptedException e) {}
		}
	}
	private void realPrint(String s) {
		System.out.println(s);
	}

	public static void main(String[] args) { // for PrintServerV2
		// The following invocations of the constructor,
		// the first argument is title and the second argument is ID
		PrintServerV2 m = new PrintServerV2("manager", 1, "");
		PrintServerV2 c1 = new PrintServerV2("client1", 11, "Hello");
		PrintServerV2 c2 = new PrintServerV2("client2", 22, "Howdy");
	}
}
