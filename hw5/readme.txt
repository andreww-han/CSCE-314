How to compile and execute my codes for HW5

Problem 2:
I have a SubsetOutputFib class created in the Fibonacci.java file. 

To run in command line: 
>javac Fibonacci.java
>java SubsetOutputFib be en

be and en are two integer command line arguments. Running this will print out the fibonacci numbers from value be to value en and mark the evens with "*".
A negative command line argument will produce an error message. If the be argument is greater than en, the program will also produce an error message.

Problem 3:
The ImprovedFibonacci class is created in he Fibonacci.java file.

To run in command line:
>javac Fibonacci.java
>java ImpprovedFibonacci

The following should return this result with no command line arguments.

1: 1
2: 1
3: 2 *
4: 3
5: 5
6: 8 *
7: 13
8: 21
9: 34 *

Problem 4-5:
The VehicleTestP4 class is in the Vehicle.java file.

To run in command line:
>javac Vehicle.java
>java VehicleTestP4

These lines should return this result. The default constructor is used and the values can all be changed manually in the main method, besides the ID numbers.

Vehicle ID: 1
Owner name: owner1
Speed: 45 mph
Direction: 273 degrees

Vehicle ID: 2
Owner name: owner2
Speed: 60 mph
Direction: 36 degrees

Vehicle ID: 3
Owner name: owner3
Speed: 33 mph
Direction: 324 degrees

Vehicle ID: 4
Owner name: owner4
Speed: 72 mph
Direction: 122 degrees

Vehicle ID: 5
Owner name: owner5
Speed: 81 mph
Direction: 66 degrees


Problem 6: 
The VehicleTest class is in the Vehicle.java file.

To run in command line:
>javac Vehicle.java
>java VehicleTest

These lines will return the same exact result as above, but uses a different constructor that takes in an owner name for the Vehicle. The program also prints out the static method for the highest ID used for every instance of Vehicle.
In this case, they will all return 5 as the largest.

The highest ID used is 5 (Vehicle a.highestId())
The highest ID used is 5 (Vehicle b.highestId())
The highest ID used is 5 (Vehicle c.highestId())
The highest ID used is 5 (Vehicle d.highestId())
The highest ID used is 5 (Vehicle e.highestId())


Problem 7: 
The VehicleTest class is in the Vehicle.java file

To run in command line:
>javac Vehicle.java
>java VehicleTest

These lines will return the same result as before providing all the information of the Vehicle objects created, but using the toString method instead. This test code will return after the line "Testing toString method."


Problem 8:
The VehicleTest class is in the Vehicle.java file

To run in command line:
>javac Vehicle.java
>java VehicleTest

The Vehicle object a is used to test the changeSpeed method. These lines will return the following:
Tetsting changeSpeed() and stop().
changeSpeed(24) called and getSpeed() returns: 24
stop() called and getSpeed() returns: 0


Problem 9:
The VehicleTest class is in the Vehicle.java file

To run in command line:
>javac Vehicle.java
>java VehicleTest


The Vehicle object a is used to test the overloaded turn methods. These lines will return the following:
Testing overloaded turn methods
turn(a.TURN_LEFT) called and getDirection() returns: 183
turn(a.TURN_RIGHT) called and getDirection() returns: 273
turn(180) called and getDirection() returns: 93
