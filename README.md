# Bankers-Algorithm
Algorithm in C language involves resource allocation and deadlock avoidance
Report on Banker’s algorithm assignment
Introduction
The Banker's algorithm is a resource allocation and deadlock avoidance algorithm used to ensure the safe execution of multiple processes. It operates by simulating the allocation of available resources to different processes and then conducting a safety check to detect potential deadlock scenarios. By considering the predetermined maximum possible amounts of all resources, the algorithm determines whether the allocation should proceed or if it could lead to a deadlock.
Condition
In the current project, we implement this algorithm using C for the defined in files data:
-	We have 5 separate resources, with given maximum amounts for each in file “resources.txt”:
R1	R2	R3	R4	R5
5	7	10	2	6

This table shows all resource for our system.

-	We have 5 separate processes (P1, P2, P3, P4, P5).
-	These processes are already allocated some resources, as it represented in the file “allocations.txt” by the next table:
	R1	R2	R3	R4	R5
P1	3	0	1	1	0
P2	1	1	0	0	0
P3	0	3	0	0	0
P4	1	0	0	0	0
P5	0	1	4	0	0

-	These processes are also requiring for finishing some resources, as it represented in the file “requests.txt” by the next table:
	R1	R2	R3	R4	R5
P1	0	1	7	0	1
P2	0	0	1	0	3
P3	2	2	0	0	1
P4	1	0	1	0	2
P5	3	1	0	1	1

We need to read the data from files, represent obtained information in the given form and with the help of the Banker's algorithm find, whether we have deadlock or not, represent the processes in the order found by the algorithm, that avoid deadlocks. If the combination of the processes is not safe, we must show the correct sequence of processes and separately display the processes that cause the deadlock.

Input of the data

To get the data from the file, we read them from the files and place into the arrays: 
-	resource_vector of size 5,
-	alloc_resources of size 5*5=25,
-	req_resources of size 5*5=25.

We use alloc_resources and req_resources as 1-dimensional array instead of 2-dimensional for more convenient memory management.
Results of reading data represent the answer as:
 
Information for process : P1:
Allocated resources : R1:3 R2:0 R3:1 R4:1 R5:0
Resource request : R1:0 R2:1 R3:7 R4:0 R5:1

Information for process : P2:
Allocated resources : R1:1 R2:1 R3:0 R4:0 R5:0
Resource request : R1:0 R2:0 R3:1 R4:0 R5:3

Information for process : P3:
Allocated resources : R1:0 R2:3 R3:0 R4:0 R5:0
Resource request : R1:2 R2:2 R3:0 R4:0 R5:1

Information for process : P4:
Allocated resources : R1:1 R2:0 R3:0 R4:0 R5:0
Resource request : R1:1 R2:0 R3:1 R4:0 R5:2

Information for process : P5:
Allocated resources : R1:0 R2:1 R3:4 R4:0 R5:0
Resource request : R1:3 R2:1 R3:0 R4:1 R5:1

Execution of the Banker’s algorithm

First thing we need is the free resources after the allocation that is already done. I can be done by adding up the number of allocated resources by each of the processes and subtracting it from the total amount of resources. We have:
R1	R2	R3	R4	R5
0	1	5	1	6

Now we should walk through the processes to figure out the one we could apply to finish with given resources.
Obviously, we cannot apply P3,P4,P5 because of R1 resource, and we cannot finish P1 because of R3 request for P1. But, we can finish P2, because it requires only 1,3 for R3 and R5 correspondingly. Thus, the process executed is P2, and new free resources (that were freed by releasing allocated by P2 earlier) are:
R1	R2	R3	R4	R5
1	2	5	1	6

Processes P1,P3,P5 are still impossible to perform, but now we can satisfy the requests for P4, and get the next table:
R1	R2	R3	R4	R5
2	2	5	1	6

New, we can also execute P3, and get 
R1	R2	R3	R4	R5
2	5	5	1	6

But the remaining two processes are cannot be executed because P1 has request 7 from R3, and P5 has request for 3 from R1, which cannot be fulfilled.

The result of execution is :

Running order for processes : P2 P3 P4
There is a deadlock. P1  and P5 are the cause of deadlock.

Conclusion

We implemented the Banker's algorithm using C language.  For our given data the running order is P2->P4->P3, and processes P1 and P5 are the cause of deadlock. The implementation can be used for the other data, given in the files for the number of processes and resources not greater then 10.




