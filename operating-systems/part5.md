# Chapter 5 - Concurrency: Mutual Exclusion and Synchronization

###### Concurrency - processes running at the same time.

#### Multiple Processes
###### - The whole OS design relies with the management of processes and threads: 

##### Multiprogramming
###### - if you have just a single processor, different processes can run at the same time by being interleaved
###### - a little bit of process 1, then it stops and saves, then a little bit of process 2, then it stops and saves, then a little bit of process 1 again, and it stops and saves, and so on.

##### Multiprocessing
###### - more than one processor, and so you can have no processes running simultaneously because each processor has its own hardware, like its own set of registers and program counter, etc. 
###### - each processor can run a different process at the same time.

##### Distributed Processing
###### - you have a bunch of processes running each on a different machine like a different distributed system. 
###### - so no matter what, whether you ahve a single processor, multiple processors, even a distributed system, we always have multiple processes running at the same time. 

###### ***because multiple processes are running at the same time, issues about concurrency are important to the OS***

#### Concurrency Arises In 3 Different Contexts:
##### Multiple Applications
###### - there are multiple applications running at the same time, either literally at the same time or being interleaved. 
###### Ex: multiprogramming

##### Structured Applications
###### - there's one application, but there are multiple threads running concurrently of the same process

##### Operating Systems Structure
###### - os code, it itself can have threads or processes in it, and they would run concurrently
###### - Linux might spawn a bbunch of threads to do some tasks in the background, and those threads would run concurrently.

#### Principles Of Concurrency
###### - interleaved on a single processsor, or overlapping, running at the same time each on their own processor
###### - the OS has to manage the interleaving of processes/threads, or the overlapping of processes/threads.
###### - there is no way to know how fast your OS is going to run, because of these issues

#### Difficulties Of Concurrency
###### - sharing global resources, Ex: two processes sharing a global variable
###### - difficult for the OS to manage the allocation of resources optimally, Ex: two processes tring to write into a file
###### - difficult to locate programming errors as results are deterministic and reproducible

### Race Condition
###### - mulitple threads/processes trying to read/write data items that are shared
###### - if two processes/threads are trying to update variable x, the last process/thread that updates x, determines x's final value
###### - if you are writing an application that was divided into a bunch of threads and they are sharing data, its pretty likely you're gonna get race conditions if all those threads are sharing a data item

#### Operating Systems Concerns
###### - The OS must help us ensure the functioning of processes, and output it produces, are independent of the speed of execution relative to the speed of other concurrent processes
###### - we need to do some about race conditions, we need to control access to it
###### - we need something, so that when our process functions it produces the correct output, regardless of the speed of execution

### Process Interaction
###### - processes can be related to each other based on their degree of awareness

| Degree Of Awareness | Relationship | Influence On Other Process | Potential Control Problems |
| ------------------- | ------------ | -------------------------- | -------------------------- |
| Processes unaware of each other | Competition | - results of one process independent of the action of others <br /> - timing of process may be affected | - mutual exclusion <br /> - deadlock (renewable resource) <br /> - starvation |
| Processes indirectly aware of each other (e.g. shared object) | Cooperation By Sharing | - results of one process may depend on information obtained from others <br /> - timing of process may be affected | - mutual exclusion <br /> - deadlock (renewable resource) <br /> - starvation <br /> - data coherence |
| Processes directly aware fo each other (have communication primitives avaliable to them) | Cooperation By Communication | - results of one process may depend on information obtained from others <br /> - timing of process may be affected | - deadlock (consumable resource) <br /> starvation |

### Resource Competition
###### - concurrent processes come into conflict when they are competing for use of the same resource (critical resource), e.g. IO devices, memory, processor time
###### - in the case of competing processes 3 control problems must be faced: Need for mutual exclusion, possible deadlock and starvation

### Cooperation Among Processes By Sharing
###### - processes interact with other processes without being explicitly aware of them
###### - processes may use and update shared data without reference to other processes, but know other processes may access the data
###### - processes must cooperate to ensure the shared data is properly managed
###### - control mechanisms must ensure the integrity of the shared data, which are held on resources (devices, memory, etc.)
###### - need mutual exclusion, possible deadlock and starvation

### Cooperation Among Processes By Communication
###### - processes participate in a common effort, all the processes/threads are all cooperating to do a single task
###### - there's 1 big task, and it's accomplished by farming out a bunch of like threads/processes to do it
###### - processes/threads must synchronize or coordinate with each other
###### - communication of some sort, message send/receive primitives provided by OS kernel or programming language
###### - mutual exclusion is not a control requirement for this sort of cooperation
###### - deadlock and starvation are still potential control problems

## Concurrency Key Terms
#### Atomic Operation
###### - a function or action implemented as a sequence of one or more instructions that appears to be indivisible
###### - no other process can see an intermediate state or interupt the operation
###### - the sequence of instruction is guranteed to execute as a group, or not execute at all, having no visible effect on system state
###### - atomicity gurantees isolation from concurrent processes
#### Critical Section
###### - a section of code within a process that requires access to shared resources and that must not be executed while another process is in a corresponding section of code
#### Deadlock
###### - a situation in which 2 or more processes are unable to proceed because each is waiting for one of the others to do something
#### LiveLock 
###### - a situation in which 2 or more processes continuously change their states in response to changes in the otehr processes without doing any useful work
#### Mutual Exclusion
###### - the requirement that when one proess is in a critical that accesses shared resources
###### - no other process may be in a criticaal section that accessses any of those shared resources
#### Race Condition
###### - a situation in which multiple threads or processes read and write a shared data item and the final result depends on the relative timing of their exection
#### Starvation
###### - a situation in which a runnable processs is overlooked indefinitely by the scheduler; although it is able to proceed, it is never chosen
#### Overlapping
###### - two processes running in parallel
#### Synchronization
###### - the process of coordinating the actions of multiple processes to ensure that they do not interfere with each
#### Synchronization Primitive
###### - a basic building block of synchronization, such as semaphores, monitors, or locks
#### Concurrent Processing
###### - 2 processes running on the same processor are being interleaved on that same processor using multiprogramming

## Mutual Exclusion
###### - a mechanism that prevents more than one process from accessing a shared resource at the same time
###### - a way to ensure that only one process can execute a critical section of code at a time

```c
/* e.g. critical section: send lines to printer, update shared variables a and b

/* PROCESS 1 */               /* PROCESS N */
void P1 {                     void Pn {
  while (true) {                while (true) {
    /* preceding code */          /* preceding code */
    entercritical(Ra);            entercritical(Ra);
    /* critical section */        /* critical section */
    exitcritical(Ra);             exitcritical(Ra);
    /* succeeding code */         /* succeeding code */
  }                             }
}                             }
```

#### Requirements For Mutual Exclusion
###### - must be enforced (allow only 1 process at a time)
###### - a process that halts (in noncritical section) must do so without interfering with other processes
###### - no deadlock or starvation
###### - a process must not be denied access to a critical section when there is no other process using it
###### - no assumptions are made about relative process speeds or number of processes
###### - a process remains inside its critical section for a finite time only

#### Satisfying Mutual Exclusion Requirements
###### - hardware support (special machine instructions)
###### - OS or programming language support (special functions)
###### - software approach (special algorithms)

### Hardware Support
##### Interupt Disabling
###### - uniprocessor system, disabling interupts gurantees mutual exclusion
###### e.g. can use assembly or gcc built-ins
##### Disadvantages
###### - the efficiency of execution could be noticeably degraded
###### - the OS may not be able to handle interrupts while interrupts are disabled
###### - this approach will not work in a multiprocessor architecture
##### Compare and Swap Instructions
###### - also called a "compare and exchange instruction"
###### - compare the value of a shared variable with a given value
###### - a compare is made between a memory value and a test value, if the values are the same, swap memory value and new value
```c
compare_and_swap(word, testval, newval)
  oldval = word
  if (word == testval) word = newval
  return oldval
```

###### Ex: Compare and Swap For Critical Section
```c
/* program mutual exclusion */
const int n = /* number of processes */;
int bolt;
void P(int i) {
  while (true) {
    while (compare_and_swap(bolt, 0, 1))
      /* do nothing */
    /* critical section */
    bolt = 0;
    /* remainder */
  }
}

void main() {
  bolt = 0;
  parbegin(P(1), P(2), ..., P(n));
}
```

##### Exchange Instruction
```c
exchange(register, memory)
  temp = register
  memory = register
  register = temp
```
###### Ex: Exchange For Critical Section
```c
/* program mutual exclusion */
const int n = /* number of processes */;
int bolt;
void P(int i) {
  int keyi = 1;
  while (true) {
    do exchange (keyi, bolt);
    /* critical section */
    bolt = 0;
    /* remainder */
  }
}

void main() {
  bolt = 0;
  parbegin(P(1), P(2), ..., P(n));
}
```

##### Special Machine Instructions Advantages
###### - applicable to any number of processes on either a single processor or multiple processors sharing main memory
###### - simple and easy to verify
###### - it cna b e used to support multiple critical sections; each critical section can be defined by its own variable

##### Special Machine Instructions Disadvantages
###### - busy-waiting is employed, thus while a process is waiting for access to a critical section it continues to consume processor time
###### - starvation is possible when a process leaves a critical section and more than one process is waiting
###### - deadlock is possible

### Software Approaches
###### - all that matter is that if 2 processors are at the same time trying to update a memory lcoation, it has to be the case that the memory location won't be corrupted like
###### Ex: if 2 processes each on their own processor tries to write into x, the hardware takes care of that, by serializing the 2 processes, x will not be corrupted
###### - can be implemented for concurrent processes that execute on a single-processor or a multiprocessor machine with shared main memory
###### - usually assume elementary mutual exclusion at the memory access level
###### - simultaneous accesses (reading and/or writing) to the same location in main memory are serialized by some sort of memory arbiter, although the order of access granting is not specified ahead of time
###### - no support in the hardware, os, or programming language assumed
###### - algorithms include those by Dekker and Peterson


#### Peterson's Algorithm For Two Processes
###### Ex: the following algorithm is only for 2 processes, it can easily be updated for multiple processes
```c
/* Peterson's algorithm for two processes */
boolean flag[2]; /* a flag for each process, start off at false */
void P0() {
  while (true) {
    flag[0] = true; 
    /* 
    when a process wants to come in its 
    critical section, it sets it's flag to 
    true 
    */
    while (flag[1]) /* do nothing */;
    /* 
    as long as the other process isn't in 
    its critical section, ill get into mine 
    */
    /* critical section */
    flag[0] = false;
    /* remainder */
  }
}

void P1() {
  while (true) {
    flag[1] = true;
    while (flag[0]) /* do nothing */;    
    /* 
    process 0 is not in the critical section 
    so P1 will go into its critical section */
    /* critical section 
    */
    flag[1] = false;
    /* remainder */
  }
}

void main() {
  flag[0] = false;
  flag[1] = false;
  /* set the flag for both processes to false */
  parbegin(P0, P1);
}
```

###### - One problem, we can have an issue with deadlock
###### - What can happen is that when process 0 starts, it sets its flag to true and then process 1 sets its flag to true, so now both flags are true at the same time
###### - This is a problem because now neither process can enter its critical section because they are both waiting for the other process to set its flag to false
###### - This is a deadlock

###### Ex: Fixed Peterson's Algorithm
```c
boolean flag [2];
int turn; /* variable for whose turn it is */
void P0() {
  while (true) {
    flag[0] = true;
    turn = 1; 
    /* process 0 says let it be process 1's turn */
    while (flag[1] && turn == 1) /* do nothing */;
    /* do nothing if it is process 1's turn */
    /* critical section */
    flag[0] = false;
    /* remainder */
  }
}

void P1() {
  while (true) {
    flag[1] = true;
    turn = 0;
    /* process 1 says let it be process 0's turn */
    while (flag[0] && turn == 0) /* do nothing */;
    /* do nothing if it is process 0's turn */
    /* critical section */
    flag[1] = false;
    /* remainder */
  }
}

void main() {
  flag[0] = false;
  flag[1] = false;
  parbegin(P0, P1);
}
```

### OS or Programming Language Support
#### Common Concurrency Mechanisms
##### Semaphore
###### - an integer value used for signaling among processes
###### - 3 operations performed on a semaphore: initialize, increment, and decrement
###### - decrement results in blocking of a process
###### - increment results in unblocking of a process, also known as a counting semaphore or general semaphore
##### Binary Semaphore
###### - a semaphore that takes on only the values 0 and 1
##### Mutex
###### - similar to a binary semaphore but the process that locks the mutext (sets the value to 0) must be the one to unlock it (sets the value to 1)
##### Condition Variable
###### - a data type that is used to blcok a process or thread until a particular condition is true
##### Monitor
###### - a programming language construct that excapsulates variables, access procedures and initialization code within an abstract data type
###### - the monitor's variable may only be accessed via its access procedures and only one process may be actively accessing the monitor at any one time
###### - the access procedures are critical sections
###### - a monitor may have a queue of processes that are waiting to access it
##### Event Flags 
###### - a memory owrd used as a synchronization mechanism
###### - application code may associate a different event with each bit in a flag
###### - a thread can wait for either a single event or a combination of events by checking one or multiple bits in the corresponding flag
###### - the thread is blocked until all of the required bits are set (AND) or until at least one of the bits is set (OR)
##### Mailboxes/Messages
###### - a means for two processes to exchange information and that may be used for synchroniztion
##### Spinlocks
###### - mutual exclusion mechanism in which a process executes in an infinite loop waiting for the value of a lock variable3 to indicate avaliability.

## Semaphores
###### - an integer to protect critical sections, where you can do three things: 
###### 1) may be initialized to a nonnegative integer value
###### 2) the semWait operation decrements the value
###### 3) the semSignal operation increments the value
##### semInit
###### - initialize to any nonnegative integer value
##### semWait
###### - decrements the sum for the integer
###### - if the value < 0, the process that did the wait gets blocked
###### - otherwise, the process continues execution
##### semSignal
###### - increments the sum for the integer
###### - if value <= 0, a process that was blocked by semWait (if any) is UNBLOCKED

### Semaphore Consequences
###### - there is no way to know before a process decrements a semaphore whether it will block or not
###### - there is no way to know which process will continue immediately on a uniprocessor system when two processes are running concurrently
###### - you don't know whether another process is waiting so the number of unblocked processes may be 0 or 1

### Mutual Exclusion Using Semaphores
```c
/* program mutual exclusion */
const int n = /* number of processes */
semaphore s = 1; /* initialize semaphore */
/* alternate semaphore initialization */
/*
semaphore s;
semInit(s, 1);
*/
void P(int i) {
  while (true) {
    /* each process is infinitely trying to get into its critical section */
    semWait(s);
    /* critical section */
    semSignal(s);
    /* protect critical section by wrapping it with a semWait and semSignal */

    /* remainder */
  }
}

void main() {
  parbegin(P(1), P(2), ..., P(n));
  /* parallel begin */
  /* launching n processes in parallel */
  /* each process has its own name (int i) */
}
```
###### - imagine there are 4 processes running, P1, P2, P3, and P4:
###### P1: wait(1), s <- 0
###### - since value not negative, process continues execution
###### P2: wait(0), s <- -1
###### - since value is negative, block process
###### P3: wait(-1), s <- -2
###### - since value is negative, block process
###### P4: wait(-2), s <- -3
###### - since value is negative, block process
###### P1: signal(-3), s <- -2
###### - since value <= 0, unblock a process, ex: P3
###### P3: signal(-2), s <- -1
###### - since value <= 0, unblock a process, ex: P2
###### P2: signal(-1), s <- 0
###### - since value <= 0, unblock process P4, the last remaining process
###### P4: signal(0), s <- 1

### Semaphore Structure/Primitives
```c
struct semaphore {
  int count;
  queueType queue;
}; 

void semWait(semaphore s) {
  s.count--;
  if (s.count < 0) {
    /* place this process in s.queue */;
    /* block this process */;
  }
}

void semSignal(semaphore s) {
  s.count++;
  if (s.count <= 0) {
    /* remove a process P from s.queue */;
    /* place process P on ready list */;
  }
}
```

### Strong/Weak Semaphores
###### - a queue is used to hold processes waiting on the semaphore
##### Strong Semaphores
###### - process blocked the longest is released from the queue first (FIFO)
###### - no starvation
##### Weak Semaphores
###### - processes removed from queue in no specified order 
###### - starvation possible

## Binary Semaphores
###### - similar to counting/general semaphore execept can only take on values 0 or 1, and cannot allow multiple processes into critical section at once
###### - same expressive power as counting/general semaphores

### Binary Semaphores Structure/Primitives
```c
struct binary_semaphore {
  enum {zero, one} value;
  queueType queue;
};

void semWaitB(binary_semaphore s) {
  if (s.value == one) {
    s.value = zero;
  }
  else {
    /* place this process in s.queue */;
    /* block this process */;
  }
}

void semSignalB(semaphore s) {
  if (s.queue is empty()) {
    s.value = one;
  }
  else {
    /* remove a process P from s.queue */;
    /* place process P on ready list */;
  }
}
```

## Mutex
###### - programming flag used to grab and release an object
###### - similar to a binary semaphore, but, only the process that locked the mutex may unlock it
###### - pthread functions for mutex: init, lock, unlock, destroy, etc.

## Synchronization By A Semaphore
###### Ex 1: process A needs to do some statements, for example, filling up an array
###### - process B is not allowed to start until A is finished, because maybe B needs the array to be completely filled before it can start
###### Main initializes semaphore to 0, so no processes can get through the wait
###### A fills array, then signals the semaphore, allowing B to get through the wait

```
Main: semInit(s, 0), parbegin(A, B)
A: fill array, semSignal(s)
B: semWait(s), use array
```

###### Ex 2: what if after B is finished, there are still additional statements left to complete for A
###### - A needs to wait until B is finished before it can continue
###### - B needs to wait until A is finished before it can start
```
Main: semInit(s, 0), parbegin(A, B)
A: fill array, semSignal(s), semWait(s), additional statements
B: semWait(s), use array, semSignal(s)
```

## Producer/Consumer Problem
###### - let's say a bunch of producers are producing data, and let's say they are putting them in a buffer
###### - you have one consumer plucking one job at a time off the buffer
###### Ex: the producers are a bunch of people submitting print jobs to the printer, and then the consumer is the printer picking those jobs one at a time and handling them
##### General Situation
###### - one or more producers are generating data and placing these in a buffer
###### - a single consumer is taking items out fo the buffer one at a time
###### - only one producer or consumer may access the buffer at any one time
###### - you can corrupt the buffer if two producers are simultaneously trying to add at the same time
###### - you can also corrupt it if a producer is trying to add something while the consumer is taking something
###### - that is why you need a rule where only one producer or consumer can access it
###### - so taking, adding, and removing from buffer should be a critical section
##### The Problem
###### - if the buffer is full, the producer cannot add data to it
###### - if the buffer is empty, the consumer cannot remove data from it

### Buffer Structure
###### - let's say there is a buffer where array slots 1 to 3 are filled/occupied
```
    0     1       2      3      4
| b[0] | b[1] | b[2] | b[3] | b[4] | - - - 
          out                   in
count = 3
```
###### - consumer would get data starting from b[1], and producer will add data starting from b[4]

### Empty Buffer?
###### sem_signal(n) ==> increases n
###### sem_wait(n) ==> decreases n
###### - n can be used to track items in the buffer
###### set n = 0
###### producer: append, then sem_signal(n)
###### consumer: sem_wait(n), then take
###### n > 0: n items in buffer
###### n = 0: buffer empty, no cons waiting
###### n = -1: buffer empty, a cons is waiting

### Solution To The Infinite-Buffer Producer/Consumer Problem Using Semaphores
```c
/* program producer consumer */
semaphore n = 0, s = 1;
void producer() {
  while (true) {
    produce();
    semWait(s);
    append();
    semSignal(s);
    semSignal(n);
  }
}

void consumer() {
  while (true) {
    semWait(n);
    semWait(s);
    take();
    semSignal(s);
    consume();
  }
}

void main() {
  parbegin(producer, consumer);
}
```
### Solution To The Bounded=Buffer Producer/Consumer Problem Using Semaphores
```c
/* program boundedbuffer */
const int sizeofbuffer = /* buffer size */;
semaphore n = 0, s = 1, e = sizeofbuffer;
void producer() {
  while (true) {
    produce();
    semWait(e);
    semWait(s);
    append();
    semSignal(s);
    semSignal(n);
  }
}

void consumer() {
  while (true) {
    semWait(n);
    semWait(s);
    take();
    semSignal(s);
    semSignal(e);
    consume();
  }
}

void main() {
  parbegin(producer, consumer);
}
```
###### let's say e = 3
###### Producer 1:
###### wait(3), append -> e = 2
###### wait(2), append -> e = 1
###### wait(1), append -> e = 0
###### wait(0)         -> e = -1, block
###### Producer 2:
###### wait(-1)        -> e = -2, block
###### Consumer:
###### take, signal(-2) -> e = -1, unblock a producer

## Monitors
###### - it can do the same thing a semaphore can do, but it is easier to control
###### - programming language construct that provides equivalent functionality to that of semaphores and is easier to control
###### - languages include: Concurrent Pascal, Pascal-Plus, Modula-2/3, Ruby, C#, Go, Python, and Java
###### - it is built in to your programming language, and it gives you mutual exclusion automatically
###### - A monitor is a high-level synchronization construct that allows a thread to execute a critical section of code while
###### - think of it as a class in your programming language where all the methods are mutually exclusive
###### - software module consisting of one or more procedures, an initialization sequence, and local data

### Monitor Characteristics
###### - local data variables are accessible only by the monitor's procedures and not by any external procedure
###### - process enters monitor by invoking one of its procedures
###### - only one process may be executing in the monitor at a time

### Synchronization Through Monitors
###### - achieved by the use of condition variables that are contained within the monitor and accesssible only withing the monitor
###### - condition variables are a special data type which are operated on two functions: 
###### cwait(c): suspend execution of the calling process on condition c
###### csignal(c): resume execution of some process blocked after a cwait on the same condition

### Structure Of A Monitor
![Image](https://github.com/user-attachments/assets/bb8366cd-70fa-440f-ba00-eab55e57da1b)

### Solution For Producer/Consumer via Monitor
```c
/* program producerconsumer */
monitor boundedbuffer;
char buffer [N]; /* space for N items */
int nextin, nextout; /* buffer pointers */
int count; /* number of items in buffer */
cond notfull, notempty; /* condition variables for synchronization */

void append (char x) {
  if (count == N) cwait(notfull); /* buffer is full */
  buffer[nextin] = x; /* put item in buffer */
  nextin = (nextin + 1) % N; /* advance buffer pointer */
  count++; /* increment count */
  csignal(notempty); /* signal waiting consumer */
  /* resume any waiting consumer */
}

void take (char x) {
  if (count == 0) cwait(notempty); /* buffer is empty */
  x = buffer[nextout]; /* get item from buffer */
  nextout = (nextout + 1) % N; /* advance buffer pointer */
  count--; /* decrement count */
  csignal(notfull); /* signal waiting producer */
  /* resume any waiting producer */
}

{ /* monitor body */
  nextin = 0; nextout = 0; count = 0;
  /*  buffer initially empty */
}

void producer() {
  char x;
  while (true) {
    produce(x);
    append(x);
  }
}

void consumer() {
  char x;
  while (true) {
    take(x);
    consume(x);
  }
}

void main() {
  parbegin(producer, consumer);
}
```

###### - if the signal was NOT at end of the procedure, we would get two process switches:
###### - signaler blocks ==> switch
###### - signaled runs ==> switch
###### - signaler resumes
###### it makes youre scheduelr code more complex

### Mesa Monitors
###### - mesa monitors use notify (instead of signal)
###### - when someone signals, that process continues to execute, and the process it signaled goes on the ready queue
###### - scheduling is a lot less complex, and you don't have to do these process switches
###### - signaler continues to execute
###### - signaled goees on Ready Queue
###### - let's say if processs 1 signals process 2, process 1 continues to execute and process 2 goes on the ready queue
###### - but by the time process 2 works its way to the front of that queue and gets to run, the condition that it was notified about may have changed
###### - signaled must re-check condition when starts to run because it might have changed while it sat on ready queue

```c
/* bounded-buffer monitor code for mesa monitor */
void append (char x) {
  while (cound == N) cwait(notfull);
  /* buffer is full */
  buffer[nextin] = x;
  nextin = (nextin + 1) % N;
  count++; /* one more item in buffer */
  cnotify(notempty); /* notify any waiting consumer */
}

void take (char x) {
  while (count == 0) cwait(notempty);
  /* buffer is empty */
  x = buffer[nextout];
  nextout = (nextout + 1) % N;
  count--; /* one less item in buffer */
  cnotify(notfull); /* notify any waiting producer */
}
```

## Message Passing
###### - when processes interact with one another two fundamental requirements must be satisfied:
###### synchronization ==> to enfore mutual exclusion
###### communication ==> to exchange information
###### - message passing is one approach to providing both of these functions
###### - the actual function is normally provided in the form of a pair primitives: 
###### send (destination, message) ==> send a message
###### receive (source, message) ==> receiver of message
###### - a process send information in the form os a message to another process designated by a destination
###### - a processs receives information by executing the receive primitive, indicating the source and the message

### Synchronization In Message Passing
###### - commmunication of a message between two process implies synchronization betweeen the two
###### - the receiver cannot receive a message until it has been sent by another process
###### - when a receive primitive is executed in a process there are two possibilities:
###### - if there is no waiting message the process is blocked until a message arrives or the process continues to execute, abandoining the attempt to receive
###### - if a message has previously been sent the message is received and execution continues

### Blocking Send, Blocking Receive
###### - both sender and receiver are blocked until the message is delivered
###### - sometimes referred to as rendezvous
###### - allows for tight synchronization between processes

### Nonblocking Send
##### Nonblocking sennd, blocking receive
###### - sender continues on but receiver is blocked until the requested message arrives
###### - most useful combination
###### - sends one or more messages to a variety of destinations as quickly as possible
###### - example-- a service process that exists to provide a service or resource to other processes
##### Nonblocking send, nonblocking receive
###### - neither party is required to wait

### Addressing
###### - send (destination, message)
###### - receive (source, message)
###### - schemes for specifying processes in send and receive primitives fall into two categories: direct addressing and indirect addressing

### Direct Addressing
###### - send primitve includes a specific identifier of the destination process
###### Ex: send (PID, message)\
###### receive primitve can be handled in one of two ways: 
###### - require that the process explicitly designate a sending process, ex: receive (PID, &message), effective for cooperating concurrent processes
###### - implicit addressing, Ex: receive (&PID, &message), source parameter of the receive primitive possesses a value returned when the receive operation has been performed

### Indirect Addressing
###### 1.) messages are sent to a shared data structure consisting of queues that can temporarily hold messages
###### 2.) Queues are referred to as mailboxes
###### 3.) one process sends a message to the mailbox and the other process pics up the message from the mailbox
###### 4.) allows for greater flexibility in the use of messages

### Relationship Between Senders and Receivers
![Image](https://github.com/user-attachments/assets/03743ddf-995d-49f1-ba5f-3d0c2819a459)
![Image](https://github.com/user-attachments/assets/922a07a1-0415-4c32-addd-13059e05efbb)
![Image](https://github.com/user-attachments/assets/1480a05a-278e-4f5c-910f-d63a668630bb)
![Image](https://github.com/user-attachments/assets/4cd308f0-9369-4c25-94bb-ec51404c8665)

### General Message Format
![Image](https://github.com/user-attachments/assets/310a26f5-583e-4d83-a674-e786f703905b)

### System Five Style Messages
###### - has only the message type in header, other fields in send/receive arguments
###### - indirect addressing
###### by default: 
###### - send blocks (only if MsgQ full)
###### - receive blocks (only if MsgQ empty)
###### - use send/receive flag argument to change
###### msgsnd (int msgid, void *msg. size_t size, int flag)

### Mutual Exclusion Using Messages
```c
/* program mutual exclusion */
const int n = /* number of processes */;
void P (int i) {
  message msg; 
  while (true) {
    receive (box, msg);
    /* critical section */
    send (box, msg);
    /* remainder */
  }
}

void main() {
  create mailbox (box);
  send (box, null);
  parbegin (P(1), P(2), ..., P(n)); 
}
```

### Solution To The Bounded-Buffer Producer/Consumer Problem Using Messages
```c
const int
  capacity = /* buffering capacity */;
  null = /* empty message */;
int i;

void producer() {
  message pmsg;
  while (true) {
    receive (mayproduce, pmsg);
    pmsg = produce();
    send (mayconsume, pmsg);
  }
}

void consumer() {
  message cmsg;
  while (true) {
    receive (mayconsume, cmsg);
    consume(cmsg);
    send (mayproduce, null);
  }
}

void main() {
  create_mailbox (mayproduce);
  create_mailbox (mayconsume);
  for (int i = 1; i <= capacity; i++) send (mayproduce, null)
  parbegin (producer(), consumer());
}
```

## Readers/Writers Problem
###### - a data area is shared among many processes
###### - some processes only read the data area, (readers) and some only write to the data area (writers)

###### conditions must be satisfied:
###### 1.) any number of readers may simultaneously read the data area
###### 2.) only one writer at a time may write to the data area
###### 3.) if a writer is writing to the data area, no reader may read it
###### - data area could be a file, block of main memory, etc.

### Readers Have Priority
```c
/* program readersandwriters */
int readcount;
semaphore x = 1, wsem = 1;
void reader() {
  while (true) {
    semWait (x);
    readcount++;
    if (readcount == 1) semWait (wsem);
    semSignal (x);
    READUNIT();
    semWait(x);
    readcount--;
    if (readcount == 0) semSignal(wsem);
    semSignal(x);
  }
}

void writer() {
  while (true) {
    semWait(wsem);
    WRITEUNIT();
    semSignal(wsem);
  }
}

void main() {
  readcount = 0;
  parbegin (readers, writers);
}
```

### Writers Have Priority
```c
/* program readersandwriters */
int readcount, writecount;
semaphore x = 1, y = 1, z = 1 rsem = 1, wsem = 1;

void reader() {
  while (true) {
    semWait(z);
      semWait(rsem);
        semWait(x);
          readcount++;
          if (readcount == 1) semWait(wsem);
        semSignal(x);
      semSignal(rsem);
    semWait(z);
    READUNIT();
    semWait(x);
      readcount--;
      if (readcount == 0) semSignal(wsem);
    semSignal(x);
  }
}

void writer() {
  while (true) {
    semWait(y);
      writecount++;
      if (writecount == 1) semWait(rsem);
    semSignal(y);
    semWait(wsem);
    WRITEUNIT();
    semSignal(wsem);
    semWait(y);
      writecount--;
      if (writecount == 0) semSignal(rsem);
    semSignal(y);
  }
}

void main() {
  readcount = writecount = 0;
  parbegin (readers, writers);
}
```

### State of the Process Queues
| readers only in the system | - wsem set <br /> - no queues |
| -------------------------- | ----------------------------- |
| writers only in the system | - wsem and rsem set <br /> - writers queue on wsem |
| both readers and writers with read first | - wsem set by reader <br /> - rsem set by writer <br /> - all writers queue on wsem <br /> - one reader queues on rsem <br /> - other readers queue on z |
| both readers and writers write first | - wsem set by writer <br /> - rsem set by writer <br /> - writers queue on wsem <br /> - one reader queues on rsem <br /> - other readers queue on z |

### Readers/Writers Solution Using Message Passing
###### - controller gives access to shared data
###### - process (r/w) sends controller request msg
###### - controller grants access with OK reply msg
###### - when process done, sends finished msg
###### - controller has 3 mailboxes (1 for each type of msg)
###### - writers have priority
###### - variable count for mutual exclusion (initialized to some value > the max num. readers possible)

###### Ex: Suppose max 99 concurrent reads possible
###### - initialize count = 100
###### - each concurrent read: count = count - 1, but it never gets to 0
###### - write request: count = count - 100
###### - count of -10 means 10 concurrent reads, and 1 write waiting
###### when count < 0
###### - wait for all reads to finish (each time count++),
###### - then when count up to 0, let the writer proceed (send it OK msg)

```c
void reader(int i) {
  message rmsg; 
  while (true) {
    rmsg.type = i;
    send (readrequest, rmsg);
    receive (mbox[i], rmsg);
    READUNIT();
    rmsg.id = i;
    send (finished, rmsg);
  }
}

void writer(int j) {
  message rmsg;
  while (true) {
    rmsg.id = j;
    send (writerequest, rmsg);
    receive (mbox[j], rmsg);
    WRITEUNIT();
    rmsg.id = j;
    send (finished, rmsg);
  }
}

void controller() {
  while (true) {
    if (count > 0) {
      if (!empty (finished)) {
        receive (finished, msg);
        count++;
      }
      else if (!empty (writerequest)) {
        receive (writerequest, msg);
        writer_id = msg.id;
        count = count - 100;
      }
      else if (!empty (readrequest)) {
        receive (readrequest, msg);
        count--;
        send (mbox[msg.id], "OK");
      }
    }
    if (count == 0) {
      send (mbox[writer_id], "OK");
      receive (finished, msg);
      count = 100;
    }

    while (count < 0) {
      receive (finished, msg);
      count++;
    }
  }
}
```