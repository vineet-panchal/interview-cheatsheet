# Concurrency: Deadlock and Starvation

## Deadlock
###### - let's say you have a set of processes, and every one of those processes is waiting on something that only another process in that set can do
###### - but the other process can't do it because its waiting on something that only another process in that second do
###### - basically, there's a set of processes and they're all waiting for each other to do something
###### - the permanent blocking of a set of processes that either compete for system resources or communicate with each other
###### - a set of processes is deadlocked when each process in the set is blocked awaiting an event that can only be triggered by another blocked process in the set
###### - permanent
###### - no efficient solution

### Potential Deadlock
<img width="950" alt="Image" src="https://github.com/user-attachments/assets/8c43fdaf-2366-4831-96e7-90e58a04a43b" />

###### - think of these cars as processes, and the areas of roads as resources
###### - Process 1 wants resource A and B, then it can go
###### - Process 2 wants resource B and C, then it can go
###### - Process 3 wantd resource C and D, then it can go
###### - Process 4 wants resource D and A, then it can go
###### - so all 4 processes are trying to get 2 resources
###### - this is not a deadlock yet because one car/process can just speed up and get 2 resources and go

### Actual Deadlock
<img width="953" alt="Image" src="https://github.com/user-attachments/assets/aa1d4fe1-630a-4bc6-b8b7-1606230a7283" />

###### - now, let's say if one or two cars don't speed up to quickly get their 2 resources
###### - but all the cars creep up to grab their first resource, now all the cars are stuck
###### - there all waiting on an event, that another can only give it

###  Joint Process Diagram
###### - a diagram that shows some of the paths of executions to processes can take with their respective resources needed
###### - it shows a few different ways that the scheduler could interleave these processes as its running
<img width="849" alt="Image" src="https://github.com/user-attachments/assets/3397a4b9-d6e9-41db-a787-1d592667c5e5" />

###### - process Q's execution is vertical, and process P's execution path is horizontal
###### - both processses start bottome left of the graph
##### There are 6 paths for the processor to interleave, labelled (1-6):
###### 1. Process Q, gets resource B and A, and releases B and A, therefore process Q is finished
###### 2. Process Q gets resources B and A, but then process P executes and it needs resource A, so the processor switches back to process Q, and finishes executing 
###### 3. Process Q gets resource B, then process P starts executing and gets resource A
###### - this results in a deadlock because Process Q wants A, which P is using, and P wants B, which Q is using
###### 4. Process P gets A, then Q starts executing, and gets B
###### - this results in a deadlock because Q wants A which P is using, and P wants B which Q is using
###### 5. P gets A and B, then Q starts executing but it needs B, so the processor continues executing P, until it realeases A and B
###### 6. P gets A and B and releases A and B

### No Deadlock Example
<img width="890" alt="Image" src="https://github.com/user-attachments/assets/4165341e-9b07-41af-a881-cf9eadfb297d" />

##### 6 paths of execution:
###### 1. Q gets A and B, and it releases A and B
###### 2. Q gets A and B, then P starts executing but it needs A
###### - Q continues executing to relase B and A
###### 3. Q gets B, then P starts executing and gets A and relases A
###### - then Q starts executing again, and it gets A, and releases B and A
###### 4. P gets A, then Q starts executing, and it gets B, then P starts executing and it releases A
###### - then Q starts executing and it gets A and releases B, then P starts executing and it gets B and releases B
###### 5. P gets A, releases A, and gets B, then Q starts executing and it wants B
###### - the processor switches back to P and releases B
###### 6. P gets A, releases A, gets B, and releases B

### Resources

#### Resource Categories
##### Reusable
###### - cna be safely used by only one process at a time and is not depleted by that use
###### EX: processors, I/O channels, main and secondary memory, devices, and data structures such as files, databases, and semaphores
##### Consumable
###### - one that can be created (produced) and destroyed (consumed)
###### Ex: interrupts, signals, messages, and information in I/O buffers

#### Reusable Resources Example
<img width="820" alt="Image" src="https://github.com/user-attachments/assets/d01dadb6-3236-46fd-b785-5a8c44d0b3d3" />

###### - The example shows two processes P who need two resusable resources: a disk (D) and a tape (T)
###### - lets say the processor does the following steps in order: p0, p1, q0, q1, p2, q2
###### - the P requests D and locks it, then Q requests T and locks it
###### - P tries to request T, but its locked so it has to wait until its released
###### - Q tries to request D, but its locked so it has to wait until its released
###### - therefore it results in a deadlock

#### Example 2: Memory Request
###### - space is available for allocation of 200 Kbytes, and the following sequence of events occur:

P1 ... Request 80 Kbytes ... Request 60 Kbytes   
P2... Request 70 Kbytes ... Request 80 Kbytes

###### - the processes would run fine on their own because their requests don't exceed 200 Kbytes
###### - but if the scheduler interleaved them
###### - then deadlock occurs if both processes progress ot their second request

#### Consumable Resources Deadlock
###### - consider a pair of processes, in which each process attempts to receive a message from the other process and tehn send a message to the other process:
P1 ... Receive (P2) ... Send (P2, M1)             
P2 ... Receive (P1) ... Send (P1, M2)
###### - deadlock occurs if the Receive is blocking

### Deadlock Detection, Prevention, and Avoidance
<img width="620" alt="Image" src="https://github.com/user-attachments/assets/fc5b03a7-5477-4616-9d22-3502c4aa30c1" />

#### 3 approaches the OS takes:
##### Prevention:
###### - we change the order of execution, so that there is no fatal region
##### Avoidance:
###### - there's a possiblity of a deadlock, so you just get the scheduler to schedule in a way that it's not going to go into a fatal region
##### Detection:
###### - you detect the deadlock after it has occurred, and then you take some action to recover from

#### Resource Allocation Graphs for Reusable Resources
<img width="906" alt="Image" src="https://github.com/user-attachments/assets/06d3fdf4-8c01-4ecf-83ef-237252cafa63" />

<img width="829" alt="Image" src="https://github.com/user-attachments/assets/7cd95f17-afc7-408c-a518-6c28168f9e2f" />

### Conditions For Deadlock
##### Mutual Exclusion
###### - only one process may use a resource at a time
###### - no process may access a resource that has been allocated to another process
##### Hold-and-Wait
###### - a process may hold allocated resources while awaiting assignment
##### No Pre-emption
###### - no resource can be forcibly removed from a process holding it
##### Circular Wait
###### - a closed chain of processes exists, such that each process holds at least one resource needed by the next process in the chain

### Dealing With Deadlock
##### Prevent Deadlock
###### - adopt a policy that eliminates one of the conditions
##### Avoid Deadlock
###### - make the appropriate dynamic choices based on the current state of resource allocation
##### Detect Deadlock
###### - attempt to detect the presence of deadlock and take action to recover

### Deadlock Condition Prevention
#### Eliminate Mutual Exclusion
###### - if access to a resource requires mutual exclusion then it must be supported by the OS

#### Eliminate Hold and Wait
###### - require that a process request all of its required resources at one time and block process until all requests can be granted simultaneously, get(R1, R2, R3)

#### Eliminate No Premption (allow preemption)
###### - if Px holds certain resources and is denied a futher request, Px must release its original resources and request them again along with the additional resource (REQUESTER is preempted)
###### - OS may preempt the second process and require it to release its resources 
<img width="298" alt="Image" src="https://github.com/user-attachments/assets/a67060de-6916-4c1a-8210-c3ca1982f450" />

#### Eliminate Circular Wait
###### - define a linear ordering of resource types, R1, R2, ..., Rn
###### - processes must request in that order
###### - this now impossible:
P             Q
...           ...
get A         get B
get B ...     get A ...
###### - can be inefficient

### Deadlock Avoidance
###### - a decision is made dynamically whether the current resource allocation request will, if granted, potentially lead to a deadlock
###### - requires knowledge of future process resource requests

### Two Approaches to Deadlock Avoidance
##### Resource Allocation Denial
###### - do not grant an incremental resource request to a proces if this allocation might lead to deadlock
##### Process Initiation Denial
###### - do not start a process if its demands might lead to deadlock

### Process Initiation Denial
###### let's say there is a system with 21 M of memory and there are 3 processes 
###### - each process has to tell the OS before it starts, how much of the resource it's going to need, so its going to give the maximum claim that it would need from that resource (memory)
###### - the process gurantees it would never go past its max requested claim
###### - as long as what the process requests is less than the resource avaliable, it will allow it for execution
| Processes | Max Memory Claim |
| --- | --- |
| P1 | 16M |
| P2 | 4M |
| P3 | 2M |

###### P1 requests initiation, allowed because 16M < 21M
###### - now while P1 is running, P2 requests
###### P2 requests initiation, allowed because 16M+4M < 21M
###### - while P1 and P2 are running, P3 requests
###### P3 requests initiation, denied because 16M+4M+2M > 21M

<img width="926" alt="Image" src="https://github.com/user-attachments/assets/4985884a-392e-4ecb-875c-3ffa0baaafa4" />

### Resource Allocation Denial
###### - referred to as the banker's algorithm
###### State of the system reflects the current allocation of resources to processes
###### Safe State is one in which there is at least one sequence of resource allocations to processes that does not result in a deadlock
###### Unsafe state is a state that is not safe

### Determination Of State
###### - state of a system consisting of four processes and 3 processes

![Image](https://github.com/user-attachments/assets/c90cc5cf-b211-4ab6-b5e0-308196335ffc)

###### - P1 gets blocked because there aren't resources avaliable for what it needs
###### - P2 continues executing because there are enough resources for it to finish
###### - P3 gets blocked
###### - P4 gets blocked

<img width="830" alt="Image" src="https://github.com/user-attachments/assets/eec1feb0-e574-48a2-b782-a05e77718b2b" />

<img width="832" alt="Image" src="https://github.com/user-attachments/assets/6242d02e-0592-42a8-8179-1a5d4b72456d" />

<img width="867" alt="Image" src="https://github.com/user-attachments/assets/
651b8658-6787-47a4-aa89-b9504fb287e5" />

### Deadlock Avoidance Strategy
###### when Process requests resources:
###### - assume (pretend) request granted
###### - update system state (pretend)
###### - check if state SAFE
###### - if so, grant resources
###### - if not block process (until safe to grant request)

Ex: What if P1 requests 1 additional unit each of R1 and R3?

<img width="687" alt="Image" src="https://github.com/user-attachments/assets/fe5f582d-a4b0-4304-a4e2-acf245a9cffd" />

### Deadlock Avoidance Advantages
###### - it is not necessary to preempt and rollback processes, as in deadlock detection
###### - it is less restrictive than deadlock prevention
###### - allows more concurrency than deadlock prevention

### Deadlock Avoidance Restricitions
###### - maximum resource requirement for each process must be stated in advance
###### - processes under consideration must be independent and with no synchronization requirements
###### - there must be a fixed number of resources to allocate
###### - no process may exit while holding resources

### Deadlock Detection
##### Deadlock prevention strategies are very conservative
###### - limit access to resources and imposing restrictions on processes
##### Deadlock detection strategies do the opposite
###### - resource requests are granted whenever possible

### Deadlock Detection Algorithms
###### - a check for deadlock can be made as frequently as each resource request or, less frequently, depending on how likely it is for a deadlock to occur
##### Checking at each resource request: 
##### Advantages: 
###### - it leads to early detection
###### - the algorithm is relatively simple
##### Disadvantages:
###### - frequent checks consume considerable processor time

```
// marks all processes that are not deadlocked
marked = {processes with no allocated resources}
// they can't participate in deadlock
set W = Avaliable Vector
possible = true
while possible do
  find unmarked process Px whose request can be met
  if found then
    marked = marked + {Px}
    suppose request granted, Px runs, finishes
  else possible = false
  if marked == {all processes} return "no deadlock"
  else return "deadlock"
```
<img width="844" alt="Image" src="https://github.com/user-attachments/assets/ceb10730-2b47-4aba-a203-30ded0bd6924" />

### Recovery Strategies
###### - abort all deadlocked processes
###### - back up each deadlocked process to some previously defined checkpoint and restart all processes
###### - successively abort deadlocked processes until deadlock no longer exits
###### - successively preempt resources until deadlock no longer exists

### Dining Philosophers Problem
###### - no two philosophers can use the same fork at the same time (mutual exclusion)
###### - no philosopher must starve to death (avoid deadlock and starvation)

<img width="350" alt="Image" src="https://github.com/user-attachments/assets/00d5ddaa-2a54-477b-9a12-7b9a432681ea" />

### First Solution To Dining Philiosophers Problem Using Semaphores
```c
/* program dining philosophers */
semaphore fork[5] = {1};
int i;
void philosopher (int i) {
  while (true) {
    think();
    wait (fork[i]);
    wait (fork[(i + 1) mod 5]);
    eat();
    signal(fork[(i + 1) mod 5]);
    signal(fork[i]);
  }
}

void main() {
  parbegin(philosopher(0), philosopher(1), philosopher(2), philosopher(3), philosopher(4));
}
```

### Second Solution
```c
/* program dining philosophers */
semaphore fork[5] = {1};
semaphore room = {4};
int i; 
void philosopher (int i) {
  while (true) {
    think();
    wait (room);
    wait (fork[i]);
    wait (fork[(i + 1) mod 5]);
    eat();
    signal(fork[(i + 1) mod 5]);
    signal(fork[i]);
    signal(room);
  }
}

void main() {
  parbegin(philosopher(0), philosopher(1), philosopher(2), philosopher(3), philosopher(4));
}
```

### Solution Using Monitors
```c
monitor dining_controller;
cond ForkReady[5];
/* condition variable for synchronization */
boolean fork[5] = {true}; 
/* availability status of each fork */

void get_forks(int pid) {
/* pid is the philosopher id number */
  int left = pid;
  int right = (++pid) % 5;
  /*grant the left fork*/
  if (!fork[left])
  cwait(ForkReady[left]); /* queue on condition variable */
  fork(left) = false;
  /*grant the right fork*/
  if (!fork[right])
  cwait(ForkReady[right]);/* queue on condition variable */
  fork[right] = false:
}

void release_forks(int pid) {
  int left = pid;
  int right = (++pid) % 5;
  /*release the left fork*/
  if (empty(ForkReady[left]) {
  /*no one is waiting for this fork */
    fork[left] = true;
  }
  else /* awaken a process waiting on this fork */
  csignal(ForkReady[left]);
  /*release the right fork*/
  if (empty(ForkReady[right]) {
  /*no one is waiting for this fork */
    fork[right] = true;
  }
  else /* awaken a process waiting on this fork */
  csignal(ForkReady[right]);
}

void philosopher[k=0 to 4] {
    /* the five philosopher clients */
  while (true) {
    <think>;
    get_forks(k); 
    /* client requests two forks via monitor */
    <eat spaghetti>;
    release_forks(k); 
    /* client releases forks via the monitor */
  }
}
```

### Unix Concurrency Methods
###### - Unix provides a variety of mechanisms for IPC (interprocess communication) and synchronization
###### - pipes, messages, shared memory, semaphores, signals

### Pipes 
###### - circular buffers allowign two processes to communicate on the producer-consumer model
###### - FIFO queue, written by one process and read by another
##### Two Types: named, and unnamed

#### Pipes In Shell
##### Unnamed
###### find /usr/courses -type f -name "*a*" 2>/dev/null | xargs ls -l 2>/dev/null | grep 'rwxrwxrwx' &
###### - this code runs all 3 processes concurrently
##### Named
<img width="225" alt="Image" src="https://github.com/user-attachments/assets/18c4d7e3-f3f4-47bf-8346-7929f1ebcd82" />

<img width="502" alt="Image" src="https://github.com/user-attachments/assets/f438b6e1-722f-4891-960d-11926edf36f9" />

#### Pipes In C
##### Unnamed
###### - only for related processes/threads (i.e., parent/child)
###### - when program terminates, pipe no longer exists
###### - OS blocks if reading from empty or writing to full
###### - OS provides mutual exclusion

##### Named
###### - creates permanent pipe in filesystem (looks like a file)
###### - See with: ls –l (like shell named pipe)
###### - Use: mkfifo(), open(), read(), write(), etc. (similar to file)

### Messages, System Five
###### - a block of bytes with an accompanying type
###### - Unix provides msgsnd and msgrcv system calls for processes to engage in message passing
###### - associated with each process is a message queue, which functions like a mailbox

### Shared Memory
###### - fastest form of interprocess communication (IPC)
###### - common block of virtual memory shared by multiple processes
###### - permission is read-only or read-write for a process
###### - mutual exclusion constraints are not part of the shared-memory facility but must be provided by the processes using the shared memory

#### Shared Memory In C
###### - programs use shmget(), shmat() to create and/or attach to bytes of shared memory
###### - program accesses shared memory through pointer obtained from shmat()
###### - read and write as usual:
*p = 47;
x = *p;

### Semaphores, System Five
###### - generalization of the semWait and semSignal primitives
###### - no other process may access the semaphore until all operations have completed
##### Consists of:
###### - current value of the semaphore
###### - process ID of the last process to operate on the semaphore
###### number of processes waiting for the semaphore value to be greater than its current value
###### - number of processes waiting for the semaphore value to be zero

### Signals
###### - A software mechanism that informs a process of the occurrence of asynchronous events
###### - similar to a hardware interrupt, but does not employ priorities
###### - A signal is delivered by updating a field in the process table for the process to which the signal is being sent
###### - A process may respond to a signal by:
###### -> performing some default action
###### -> executing a signal-handler function
###### -> ignoring the signal

#### Unix Signals
<img width="530" alt="Image" src="https://github.com/user-attachments/assets/1741e565-9ce3-4198-98c8-486f2ac0e7eb" />

#### Real-time Signals (RT)
###### - signals that are delivered to a process in real-time
###### - Linux includes all of the concurrency mechanisms found in other UNIX systems
###### - Linux also supports real-time (RT) signals, which differ from standard UNIX signals in three primary ways:
###### 1) Signal delivery in priority order is supported
###### 2) Multiple signals can be queued
###### 3) With standard signals, no value or message can be sent to the target process – it is only a notification
###### - With RT signals it is possible to send a value along with the signal as long as send using sigqueue( )

### Linux Kernel Concurrency Mechanisms
###### - includes all Unix mechanisms +:
###### - barriers, spinlocks, semaphores, atomic operations

### Atomic Operations
###### - atomic operations execute without interruption and without interference
###### - simplest of the approaches to kernel synchronization
#### Two Types
##### Integer Operations
###### - operate on an integer variable
###### - typically used to implement counters
##### Bitmap Operations
###### - operate on one of a sequence of bites at an arbitrary memory location indicated by a pointer variable

#### Linux Atomic Operations
<img width="594" alt="Image" src="https://github.com/user-attachments/assets/f922623c-b1c0-414f-9d88-607c5582faa6" />

### Spinlocks
###### - most common technique for protecting a critical section in Linux kernel
###### - can only be acquired by one thread at a time
###### - any other thread will keep trying (spinning) until it can acquire the lock
###### - built on an integer location in memory that is checked by each thread before it enters its critical section
###### - effective in situations where the wait time for acquiring a lock is expected to be very short
##### Disadvantage:
###### - locked-out threads continue to execute in a busy-waiting mode

#### Linux Spinlocks
<img width="645" alt="Image" src="https://github.com/user-attachments/assets/df8c0145-c50c-47ed-af29-e383ea49f76e" />

### Semaphores
##### User space:
###### - Linux provides a semaphore interface corresponding to that in UNIX SVR4 – system V (man –k “System V Semaphore”) and POSIX (man semaphore.h)
##### Kernel space:
###### - implemented as functions within the kernel and are more efficient than user-visable semaphores
##### Three types of kernel semaphores:
###### - binary semaphores
###### - counting semaphores
###### - reader-writer semaphores

#### Linux Semaphores
<img width="591" alt="Image" src="https://github.com/user-attachments/assets/cbcdc450-e1de-444d-b1b1-963e386fb459" />

### Barriers
###### - enforce the order in which instructions are being executed
<img width="751" alt="Image" src="https://github.com/user-attachments/assets/68621b49-357f-4aad-89fd-693d3f1efda4" />

### RCU (Read-Copy-Update)
###### - readers and Writers share a data structure.
###### - multiple reads can occur concurrently with an update (Write).
###### - useful when numerous Reads and few Writes
###### - the shared resource must be accessed via a POINTER
##### For a Writer to update:
###### - Creates a copy; updates it; makes pointer point to the new copy (atomically)
###### - free old version of resource once no readers using it
###### - readers get either old or new version –consistent