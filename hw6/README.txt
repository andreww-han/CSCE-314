TESTING PROBLEM 1:

In command line, type the following lines:
javac MyNode.java
javac MyNodeTest.java
java MyNodeTest

This will compile the MyNode and MyNodeTest file. After, it will then run the MyNodeTest class resulting in this code.

===
1 22 21 12 24 17
sum of intlist is 97
sum of null list is 0
===
===
1.0 16.0 13.72 5.0 22.0 7.1
sum ints = 97.0
sum doubles = 64.82
===

TESTING PROBLEM 2:
In command line, type the following lines:
javac MyNode.java
javac MyListTest.java
javac MyList.java
java MyListTest

This will compile MyNode, MyListTest, MyList, and then run MyListTest. This will be the resulting code:

list  = [(head: 1) -> (2) -> (3) -> (4)]
list1 = [(head: 2) -> (4) -> (3) -> (1)]
list == list1 is false
list.equals(list1) = true
list3 = [(head: 1) -> (2) -> (3) -> (1)]
list4 = [(head: 1) -> (2) -> (3) -> (1) -> (4)]
list1.equals(list3) = false
list1.equals(list4) = false
list.compareTo(list1) = 0
list.compareTo(list4) = -1
sum==10 OK
[(head: null)]
[(head: null)]
[(head: 1) -> (2) -> (3) -> (4)]
[(head: 4) -> (3) -> (2) -> (1)]
[(head: 1) -> (2) -> (3) -> (4)]
1
[(head: 22) -> (21) -> (2) -> (3) -> (4)]
22
[(head: 22) -> (21) -> (2) -> (3) -> (4)]
22 22
21 21
2 2
3 3
4 4
[(head: )]
list1 = [(head: 2) -> (4) -> (3) -> (1)]
list2 = [(head: 4) -> (3) -> (2) -> (21) -> (22) -> (1) -> (2) -> (3) -> (4)]
list2.compareTo(list1) = 1
=== end of test