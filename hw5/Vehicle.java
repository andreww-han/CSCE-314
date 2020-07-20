//Andrew Han 227009495



import static java.lang.System.out;

class Vehicle{
	private static int nextId = 1;
	private int id;
	private int currentSpeed;
	private int direction;
	private String ownerName;
	public static final int TURN_LEFT = -90;
	public static final int TURN_RIGHT = 90;	
	Vehicle(){
		id = nextId;
		nextId++;
	}
	Vehicle(String owner){
		this.ownerName = owner;
		this.id = nextId;
		nextId++;
	}
	public static String highestId(){
		return "The highest ID used is " + (nextId - 1);
	}
	public String toString(){
		String desc = id + "\nOwner name: " + ownerName + "\nSpeed: " + currentSpeed + " mph \nDirection: " + direction + " degrees\n";
		return desc;
	}
	public int getId(){
		return id;
	}
	public void setSpeed(int speed){
		currentSpeed = speed;
	}
	public void changeSpeed(int speed){
		currentSpeed = speed;
	}
	public void stop(){
		currentSpeed = 0;
	}
	public int getSpeed(){
		return currentSpeed;
	}
	public void setDirection(int newDirection){
		direction = newDirection;
	}
	public int getDirection(){
		return direction;
	}
	public void setOwner(String owner){
		ownerName = owner;
	}
	public String getOwner(){
		return ownerName;
	}
	public void turn(int degrees){
		direction = (direction + degrees) % 360;
		if (direction < 0){
			direction *= -1;
		}
	}
	public void turn(Number turnConstant){
		if (turnConstant.equals(TURN_RIGHT)){
			direction = (direction + 90) % 360;
		}
		else if (turnConstant.equals(TURN_LEFT)){
			direction = (direction - 90) % 360;
			if (direction < 0){
				direction *= -1;
			}
		}
	}
}

class VehicleTestP4{
	public static void main (String[] args){
		Vehicle a = new Vehicle();
		a.setOwner("owner1");
		a.setSpeed(45);
		a.setDirection(273);
		out.println("Vehicle ID: " + a.getId());
		out.println("Owner name: " + a.getOwner());
		out.println("Speed: " + a.getSpeed() + " mph");
		out.println("Direction: " + a.getDirection() + " degrees \n");
		Vehicle b = new Vehicle();
		b.setOwner("owner2");
		b.setSpeed(60);
		b.setDirection(36);
		out.println("Vehicle ID: " + b.getId());
		out.println("Owner name: " + b.getOwner());
		out.println("Speed: " + b.getSpeed() + " mph");
		out.println("Direction: " + b.getDirection() + " degrees \n");
		Vehicle c = new Vehicle();
		c.setOwner("owner3");
		c.setSpeed(33);
		c.setDirection(324);
		out.println("Vehicle ID: " + c.getId());
		out.println("Owner name: " + c.getOwner());
		out.println("Speed: " + c.getSpeed() + " mph");
		out.println("Direction: " + c.getDirection() + " degrees \n");
		Vehicle d = new Vehicle();
		d.setOwner("owner4");
		d.setSpeed(72);
		d.setDirection(122);
		out.println("Vehicle ID: " + d.getId());
		out.println("Owner name: " + d.getOwner());
		out.println("Speed: " + d.getSpeed() + " mph");
		out.println("Direction: " + d.getDirection() + " degrees \n");
		Vehicle e = new Vehicle();
		e.setOwner("owner5");
		e.setSpeed(81);
		e.setDirection(66);
		out.println("Vehicle ID: " + e.getId());
		out.println("Owner name: " + e.getOwner());
		out.println("Speed: " + e.getSpeed() + " mph");
		out.println("Direction: " + e.getDirection() + " degrees \n");
	}
}

class VehicleTest{
	public static void main(String args[]){
		out.println("Testing new constructor.");
		Vehicle a = new Vehicle("owner1");
		a.setSpeed(45);
		a.setDirection(273);
		out.println("Vehicle ID: " + a.getId());
		out.println("Owner name: " + a.getOwner());
		out.println("Speed: " + a.getSpeed() + " mph");
		out.println("Direction: " + a.getDirection() + " degrees \n");
		Vehicle b = new Vehicle("owner2");
		b.setSpeed(60);
		b.setDirection(36);
		out.println("Vehicle ID: " + b.getId());
		out.println("Owner name: " + b.getOwner());
		out.println("Speed: " + b.getSpeed() + " mph");
		out.println("Direction: " + b.getDirection() + " degrees \n");
		Vehicle c = new Vehicle("owner3");
		c.setSpeed(33);
		c.setDirection(324);
		out.println("Vehicle ID: " + c.getId());
		out.println("Owner name: " + c.getOwner());
		out.println("Speed: " + c.getSpeed() + " mph");
		out.println("Direction: " + c.getDirection() + " degrees \n");
		Vehicle d = new Vehicle("owner4");
		d.setSpeed(72);
		d.setDirection(122);
		out.println("Vehicle ID: " + d.getId());
		out.println("Owner name: " + d.getOwner());
		out.println("Speed: " + d.getSpeed() + " mph");
		out.println("Direction: " + d.getDirection() + " degrees \n");
		Vehicle e = new Vehicle("owner5");
		e.setSpeed(81);
		e.setDirection(66);
		out.println("Vehicle ID: " + e.getId());
		out.println("Owner name: " + e.getOwner());
		out.println("Speed: " + e.getSpeed() + " mph");
		out.println("Direction: " + e.getDirection() + " degrees \n");
		out.println(a.highestId());
		out.println(b.highestId());
		out.println(c.highestId());
		out.println(d.highestId());
		out.println(e.highestId() + "\n \n \n");
		out.println("Testing toString method.");
		out.println("Vehicle ID: " + a);
		out.println("Vehicle ID: " + b);
		out.println("Vehicle ID: " + c);
		out.println("Vehicle ID: " + d);
		out.println("Vehicle ID: " + e + "\n \n \n");
		out.println("Tetsting changeSpeed() and stop().");
		a.changeSpeed(24);
		out.println("changeSpeed(24) called and getSpeed() returns: " + a.getSpeed());
		a.stop();
		out.println("stop() called and getSpeed() returns: " + a.getSpeed());
		a.changeSpeed(60);
		out.println("changeSpeed(60) called and getSpeed() returns: " + a.getSpeed() + "\n \n \n");
		out.println("Testing overloaded turn methods");
		a.turn(a.TURN_LEFT);
		out.println("turn(a.TURN_LEFT) called and getDirection() returns: " + a.getDirection());
		a.turn(a.TURN_RIGHT);
		out.println("turn(a.TURN_RIGHT) called and getDirection() returns: " + a.getDirection());
		a.turn(180);
		out.println("turn(180) called and getDirection() returns: " + a.getDirection());
	}
}