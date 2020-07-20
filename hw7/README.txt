Running problem 1:

For version 1 of printServer, type the following into cmd 
>javac PrintServerV1.java
>java PrintServerV1

Will produce something similar to what's posted below. Each client has their message printed 10 times, with the serial number printed after the message. The serial number is separate for each client.

Client 11 Class: class PrintServerV1 Message: Hello 1
Client 22 Class: class PrintServerV1 Message: Howdy 1
Client 22 Class: class PrintServerV1 Message: Howdy 2
Client 11 Class: class PrintServerV1 Message: Hello 2
Client 11 Class: class PrintServerV1 Message: Hello 3
Client 22 Class: class PrintServerV1 Message: Howdy 3
Client 22 Class: class PrintServerV1 Message: Howdy 4
Client 11 Class: class PrintServerV1 Message: Hello 4
Client 11 Class: class PrintServerV1 Message: Hello 5
Client 22 Class: class PrintServerV1 Message: Howdy 5
Client 22 Class: class PrintServerV1 Message: Howdy 6
Client 11 Class: class PrintServerV1 Message: Hello 6
Client 11 Class: class PrintServerV1 Message: Hello 7
Client 22 Class: class PrintServerV1 Message: Howdy 7
Client 11 Class: class PrintServerV1 Message: Hello 8
Client 22 Class: class PrintServerV1 Message: Howdy 8
Client 11 Class: class PrintServerV1 Message: Hello 9
Client 22 Class: class PrintServerV1 Message: Howdy 9
Client 11 Class: class PrintServerV1 Message: Hello 10
Client 22 Class: class PrintServerV1 Message: Howdy 10

For version 2 of printServer, type the following into cmd 
>javac PrintServerV2.java
>java PrintServerV2

This version of printServer uses the synchronized keyword rather than locks and conditions. However, it is written to output the same as version 1.


Running problem 2:

For the Time class, type the following into cmd
>javac Time.java
>java Time

This will output the following for the first 25 seconds. The code has infinite for loops, so it will keep continuing past this in similar fashion.

1 2 3 4 5
-- 5 second message
6 7 8 9 10
-- 5 second message
11
***** 11 second message
12 13 14 15
-- 5 second message
16 17 18 19 20
-- 5 second message
21 22
***** 11 second message
23 24 25
-- 5 second message
