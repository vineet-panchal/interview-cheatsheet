# Questions and Answers Chapters 5 - 9

### Question 1
##### The execution mode of overlapping: (select all that apply)
###### a) can occur on a multiprocessor system ✅
###### b) can occur on a single-processor system
###### c) is an example of concurrent processing ✅
###### d) is the same as interleaving 

##### ANS: a and c are correct
###### - Overlapping can occur on a multiprocessor system because each processor can execute a different process.
###### - Overlapping is an example of concurrent processing because it involves the execution of multiple processes at the same

### Question 2
##### When processes use and update shared data without reference to other processes, but know other processes may access the saem data, and cooperate to ensure the data is managed properly, they exhibit this relationship: 
###### a) competition
###### b) cooperating by sharing ✅
###### c) cooperation by communication
###### d) cooperation by contention

##### ANS: b is correct
###### - if processes are clueless of each other but update shared data, then they cooperate by sharing

### Question 3
##### Consider function P1 of Peterson's Algorithm for mutal exclusion, shown below, what should replace XX?
![Image](https://github.com/user-attachments/assets/114859c7-4cdb-4d04-99bf-94dc6989f36e)
###### a) flag[0] && turn == 0 ✅
###### b) flag[0] && turn == 1
###### c) flag[1] && turn == 0
###### d) flag[1] && turn == 1

##### ANS: a is correct
###### - in the while loop if you're in P1, you have to check if flag[0] is true and turn is 0
###### - if both are true, then P1 is not the only one trying to enter the critical
###### - so P1 should not enter the critical section

### Question 4
##### Operations wait and signal may be performed on a semaphore. The wait operation:
###### a) always increments the semaphore's value
###### b) always decrements the semaphore's value ✅
###### c) always blocks the process
###### d) only returns when a corresponding signal is executed

##### ANS: b is correct
###### - the wait operation decrements the semaphore's value, and signal increments

### Question 5
##### Consider the following solution to the bounded-buffer Producer/Consumer problem. What is the purpose of semaphore e?
![Image](https://github.com/user-attachments/assets/16b3815b-e456-4eab-91c8-61417117a56b)
###### a) to ensure the producer can't add data to a full buffer ✅
###### b) to ensure the consumer can't remove data from an empty buffer
###### c) to ensure mutual exclusion on the buffer 
###### d) to ensure no race conditions on semaphore s

##### ANS: a is correct
###### - e ensures producer can't add to full, n ensures consumer can't remove from empty

### Question 6
##### Which are true about traditional Hoare monitors? (select all that apply)
###### a) multiple processes at a time may be executing in the monitor
###### b) it must have only global variables; no loval variables are allowed
###### c) a process enters the monitor by invoking one of its procedures ✅
###### d) synchronization is provided by the use of condition variables ✅

##### ANS: c and d is correct
###### - c is incorrect because only one process can be in the monitor at a time
###### - d is incorrect because local variables are allowed

### Question 7
##### When processes use a mailbox to send/receive messages:
###### a) they use direct addressing
###### b) they use indirect addressing ✅
###### c) they perform a rendezvous
###### d) the mailbox must be owned by the OS

##### ANS: b is correct
###### - indirect addressing is used to send/receive messages, when two processes don't directly communicate each other
###### - instead they communicate through a mailbox

### Question 8
##### Which is true of the following solution to the Readers/Writers problem. (select all that apply)
![Image](https://github.com/user-attachments/assets/5d5a1258-c981-4272-abbc-5563ae342fdb)
###### a) readers have priority ✅
###### b) writers have priority
###### c) multiple writers may perform WRITEUNIT at the same time
###### d) multiple readers may perform READUNIT at the same time ✅

##### ANS: a and d is correct
###### - if only the reader function is long and the writer function is kinda short then its readers have priority
###### - if both the reader and writer function is long, then writers have priority
###### - if readers have priority, then multiple readers perform READUNIT, if writers have priority, then multiple writers perform WRITEUNIT

### Question 9
##### Consider the following Joint Progress Diagram for processes P and Q below. what does the are with upward slanted lines indicate?
![Image](https://github.com/user-attachments/assets/cd2f795d-3941-4cfd-a1df-e513f4068331)
###### a) both P and Q require resource R1 ✅
###### b) both P and Q require resource R2
###### c) both P and Q require R1 and R2
###### d) a fatal region

##### ANS: a is correct
###### - the trick is to look at where the resources release
###### - in the area where the question suggests, the area stops when Q releases R1, so both processes require R1

### Question 10
##### There are 3 conditions that are necessary, but not sufficient, for a deadlock to exist. Actual deadlock comprises these 3 conditions along with a circular wait. These 3 conditions are mutual exclusion, hold-and-wait, and: 
###### a) pre-emption 
###### b) no pre-emption ✅
###### c) resource allocation
###### d) a linear ordering of resources

##### ANS: b is correct
###### - mutual exclusion, hold-and-wait, and no pre-emption are the three necessary conditions, but not sufficient
###### - circular wait gurantees deadlock

### Question 11
##### A system contains 15 units of resource R. Max Claims and Current Allocations for processes P1-P5 are given below (e.g., P1 currently holds 2 units of R, although its maximum claim is 3 units). Suppose P1 and P2 execute concurrently, while P5, P4, and P3 request initiation, in that order. Using the Process Initiaion Denial approach, the OS will allow which processes to beign execution?
![Image](https://github.com/user-attachments/assets/dac76925-4320-4ef2-90f0-cdbbf2d2c016)
###### a) none may begin
###### b) only P5
###### c) only P5 and P4 ✅
###### d) only P5, P4, and P3

##### ANS: c is correct
###### - C-A = 1 1 5 5 5,   R = 15 - 2 - 1 = 12
###### - allow P5 to begin because there are enough resources, R = 12 - 5 = 7
###### - allow P4 to begin because there are enough resources, R = 7 - 5
###### - P3 will not be allowed to begin because there are not enough resources

### Question 12
##### The claim and Allocation matrices below describe the state of a system consisting of 4 processes and 3 resources. The state would be safe for which of these Resource vectors? (select all that apply)
![Image](https://github.com/user-attachments/assets/8a713c91-6273-44f6-ab2e-310cf124d581)
###### a) A Vector (R1, R2, R3): 3 2 5
###### b) Resource Vector (R1, R2, R3): 4 2 5
###### c) Resource Vector (R1, R2, R3): 3 3 5
###### d) Resource Vector (R1, R2, R3): 8 7 10 ✅

##### ANS: d is correct
###### - C-A as a vector = 2 + 1 + 1 + 1 - 1 - 1 - 1 - 0, 2 + 1 + 1 + 2 - 0 - 1 - 1 - 0, 3 + 3 + 1 + 5 - 1 - 1 - 1 - 2 =  5 - 3, 6 - 2, 12 - 5 = 2, 4, 7
###### - cross-reference and check which resource vectors can allocated the needed resources
###### - 3 2 5 cannot because it cannot allocate enough for R2 and R3 for the needed
###### - 4 2 5 cannot because it cannot allocate enough for R2 and R3
###### - 3 3 5 cannot because it cannot allocate enough for R2 and R3
###### - 8 7 10 can because it can allocate for all 3 resources

### Question 13
##### A major advantage of Deadlock Avoidance algorithms are that they: 
###### a) are less restrictive than deadlock prevention ✅
###### b) although they do rollbacks, there are less rollbacks than for deadlock detection
###### c) although they do pre-emptions, there are less pre-emptions than for deadlock detection
###### d) allow deadlock, but recover from it

##### ANS: a is correct
###### - deadlock avoidance is less restrictive than deadlock prevention

### Question 14
##### Which are true about Linux unnamed pipes? (select all that apply)
###### a) may be created from a C program ✅
###### b) may be deleted using rm from a bash shell
###### c) may be created from a bash shell ✅
###### d) OS provides no mutual exclusion for them

##### ANS: a and c are correct
###### - Linux unnamed pipes may be created from a C program and from a bash shell

### Question 15
##### Which is true about Linux kernel spinlocks? (select all that apply)
###### a) typically used when wait time for acquiring a lock is expected to be very long
###### b) uses busy-waiting ✅
###### c) most common technique for protecting critical sections in Linux ✅
###### d) one spinlock may be acquired by multiple processes simultaneously

##### ANS: b and c are correct
###### - Linux kernel spinlocks use busy-waiting and are the most common technique for protecting critical

### Question 16
##### What is true of the memory management scheme of Dynamic Partitioning? (select all that apply)
###### a) a process is allocated exactly as much memory as it requires ✅
###### b) it has internal fragmentation
###### c) it has external fragmentation ✅
###### d) small jobs will not utillize partition space efficiently

##### ANS: a and c are correct

### Question 17
##### Consider simple paging, with no virtual memory, as outlined in Chapter 7 of our text. Assume 16-bit addresses, and page size of 4K = 4096 = 2^12 bytes. A process can consist of a maximum of X pages of 4K bytes. What is X?
###### a) 4
###### b) 12
###### c) 15
###### d) 16 ✅

##### ANS: d is correct.
###### 2^16 = 65536, and 2^12 = 4096
###### 65536 / 4096 = 16

### Question 18
##### Which are true when virtual memory is used? (select all that apply)
###### a) a process can be larger than all of main memory
###### b) program-generated addresses are translated automatically to corresponding machine addresses ✅
###### c) the size of virtual storage is limited by the number of frames of main memory
###### d) the size of virtual storage is proportional to the size of disk (secondary memory) ✅

##### ANS: b and d are correct.
###### - Virtual memory allows a process to be larger than all of main memory, and the size of virtual storage is proportional to the size of disk (secondary memory)
###### - Program-generated addresses are translated automatically to corresponding machine addresses
###### - The size of virtual storage is limited by the number of frames of main memory

### Question 19
##### For virtual memory to be practical and effective, 2 ingredients are needed: (1) the OS must include software for managing the movement of pages/segments between secondary memory and main memory, and (2) hardware support _____
###### a) paging and/or segmentation ✅
###### b) dynamic partitioning
###### c) fixed partitioning with variable size paritions
###### d) semaphores

##### ANS: a is correct.
###### - Virtual memory requires hardware support for paging and/or segmentation
###### - The OS must include software for managing the movement of pages/segments between secondary memory and main

### Question 20
##### The page placement policy: (select all that apply)
###### a) determines where a process is to reside in real memory ✅
###### b) determines where a process is to reside in secondary memory
###### c) is relevant in pure paging systems
###### d) is relevant for NUMA systems ✅

##### ANS: a and d are correct.
###### - The page placement policy determines where a process is to reside in real memory
###### - The page placement policy is relevant for NUMA systems

### Question 21
##### Suppose a process does the following sequence of page references and is allocated a fixed 3 frames. How many page faults occur using the LRU Policy after the frame allocation is initially filled?  7,8,7,6,9,8,7
###### a) 0
###### b) 1
###### c) 2
###### d) 3 ✅

##### ANS: d is correct.

### Question 22
##### With this type of allocation policy, whenever a page fault occurs in the execution of aprocess, one of the pages of that process must be replaced by the needed page
###### a) fixed allocation ✅
###### b) variable allocation
###### c) resident set allocation
###### d) dynamic allocation

##### ANS: a is correct.
###### - With fixed allocation, whenever a page fault occurs in the execution of a process, one of the pages of that process must be replaced by the needed page

### Question 23
##### A cleaning policy: (select all that apply)
###### a) is concerned with when a modified page should be written out to secondary memory ✅
###### b) is the opposite of a fetch policy ✅
###### c) is concerned with where on secondary memory a modified page should be written
###### d) is concerned with where in main memory a modified page should be placed

##### ANS: a and b is correct. 

### Question 24
##### Lab06 used POSIX semaphores. What was true about them? (select all that apply)
###### a) named semaphores persist, even when no processes are using them ✅
###### b) an unnamed semaphore cannot be shared among (pthread) threads of a process
###### c) the initial value of a named semaphore can be set by function sem_open ✅
###### d) they require library <semaphore.h> ✅

##### ANS: a, c, and d are correct.

### Question 25
##### Which are true about a System V message queue, as used in kick.c and spock.c in Lab08? (select all that apply)
###### a) the first member of the message structure must have type long (int) ✅
###### b) msgsnd blocks when the message queue is full ✅
###### c) its permissions must always be exactly 600
###### d) it is automatically deleted by Linux when no process is using it

##### ANS: a and b are correct. 

### Question 26
##### Which of the following best describes concurrency?
###### a) execution of multiple processes at the same time ✅
###### b) execution of one process at a time in a sequence
###### c) sharing a single CPU core among multiple processes without overlapping
###### d) none of the above.

##### ANS: a is corerct
###### - Concurrency is the ability of a system to execute multiple processes at the same time.

### Question 27
##### Why is mutual exclusion important in concurrent programming?
###### a) it prevents processes from communicating 
###### b) it allows multiple processes to modify shared data simultaneously
###### c) it ensures that only one process accesses a critical section at a time ✅
###### d) it eliminates the need for process synchronization

##### ANS: c is correct. 
###### - Mutual exclusion is a synchronization technique that ensures only one process can access a critical section at a time.

### Question 28
##### What is a race condition?
###### a) a condition where two processes execute at the same speed
###### b) a situation where the outcome depends on the order of execution of processes ✅ 
###### c) a scheduling algorithm for high-priority processes
###### d) a technique used for optimizing process execution

##### ANS: b is correct.

### Question 30
##### Which of the following problems can arise due to improper handling of concurrency?
###### a) deadlock ✅
###### b) starvation ✅
###### c) race conditions ✅
###### d) all options ✅

##### ANS: all options are correct.
###### - Deadlock, starvation, and race conditions are all potential problems that can arise due to improper

### Question 31
##### Which of the following is an example of a critical section?
###### a) a process writing to a shared file ✅
###### b) a program displaying output on a personal screen
###### c) a function performing calculations on local variables
###### d) a loop iterating through an array in a single-threadded program

##### ANS: a is correct.
###### - A critical section is a portion of code that accesses shared resources and must be executed atomically

### Question 32
##### A system has two processes, P1 and P2, both needing access to a shared resource. What is the best way to prevent race conditions?
###### a) use busy waiting
###### b) disable all interupts
###### c) use locks or semaphores ✅
###### d) allow both processes to run freely and resolve conflicts later

##### ANS: c is correct.
###### - Using locks or semaphores is a common way to prevent race conditions by ensuring only one

### Question 33
##### Which of the following statements about deadlocks is TRUE?
###### a) deadlock always occur when mutal exclusion is enforced
###### b) deadlocks can be prevented by ensuring at least one necessary condition does not hold ✅
###### c) deadlocks only occur in single-threaded applications
###### d) deadlocks can be resolved using race conditions

##### ANS: b is correct.
###### - Deadlocks can be prevented by ensuring at least one necessary condition does not hold

### Question 34
##### Which of the following is a valid implementation of mutual exclusion using hardware support?
###### a) disabling interupts ✅
###### b) using compare-and-swap instructions ✅
###### c) using Peterson's algorithm
###### d) both a and b

##### ANS: a, b, and d are correct.
###### - Disabling interrupts and using compare-and-swap instructions are both valid implementations of mutual

### Question 35
##### Peterson's algorithm is used to achieve mutual exclusion. What are the two main variables used in Peterson's algorithm?
###### a) turn and flag ✅
###### b) mutex and lock
###### c) counter and semaphore
###### d) process_id and queue

##### ANS: a is correct.
###### - Peterson's algorithm uses two main variables: turn and flag

### Question 36
##### A binary semaphore is also known as a mutex?
###### a) true ✅
###### b) false 

##### ANS: a is correct.
###### - A binary semaphore is also known as a mutex

### Question 37
##### Message passing is only useful in distributed systems.
###### a) true
###### b) false ✅

##### ANS: b is correct.
###### - Message passing is useful in both distributed and shared memory systems


### Question 38
##### What is a monitor in concurrent programming?
###### a) a hardware device used for debugging concurrent processes
###### b) a software module that encapsulates shared resources and synchronization mechanisms ✅
###### c) a type of semaphore used for synchronization
###### d) a lagging tool for recording process execution times

##### ANS: b is correct.
###### - A monitor is a software module that encapsulates shared resources and synchronization mechanisms

### Question 39
##### In a monitor, what is the purpose of a condition variable?
###### a) it defines a shared variable accessible b¥ all processes
###### b) it locks a process until a mutex is released
###### c) it prevents a process from executing critical sections
###### d) it allows a process to wait for a condition to become true before proceeding ✅

##### ANS: d is correct.
###### - A condition variable allows a process to wait for a condition to become true before proceeding

### Question 40
##### What is a key difference between a monitor and a semaphore?
###### a) a monitor automatically ensures mutual exclusion, while a semaphore does not
###### b) a semaphore is implemented in high-level languages, whereas a monitor is only available in assembly
###### c) semaphores are easier to use than monitors
###### d) a monitor can only handle one processs at a time while semaphores allow multiple processes

### Question 41
##### Which statement about monitors is FALSE?
###### a) monitors prevent deadlock in all cases ✅
###### b) a monitor encapsulates shared resources
###### c) condition variables are used for synchornization within monitors
###### d) monitors help prevent race conditions

##### ANS: a is correct.
###### - Monitors do not prevent deadlock in all cases

### Question 42 
##### What is the main advantage of message passing over shared memory?
###### a) faster communication speed
###### b) no need for explicit synchronization mechanisms like locks ✅
###### c) it works only on distributed systems
###### d) more efficient memory usage

##### ANS: b is correct.
###### - Message passing does not require explicit synchronization mechanisms like locks

