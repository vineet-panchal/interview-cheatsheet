# Chapter 7 - Memory Management

<img width="433" alt="Image" src="https://github.com/user-attachments/assets/6773c9b8-202a-4f26-82e5-ab2f17c592f8" />

###### - the OS must dynamically divide up Main Memory for the user processes ..., this is memory management

### Memory Management Terms
##### Frame
###### - a fixed length block of main memory
##### Page
###### - a fixed length block of data that resides in secondary memory (such as disk).
###### - a page of data my temporarily be copied into a frame of main memory
##### Segment
###### - a variable-length block of data that resides in secondary memory
###### - an entire segment may temporarily be copied into an available region of main memory (segmentation) or the segment may be divided into main memory (combined segmentation and paging).

### Memory Management Requirements
##### 1. Relocation (process moves in memory)
###### - processes are swapped in/out of memory
###### - might swap back to a different memory region, this is relocation
###### - all addresses/pointers in code change
##### 2. Protection
###### - Px should not corrupt Py
###### - Px's memory references must be checked at run time
###### - hardware responsibility (processor)
###### - relocation hardware also supports protection
##### 3. Sharing
###### - Px and Py share a data-structure
###### - multiple processes executing same program
###### - allow sharing without compromising protection
##### 4. Logical Organization
###### - most programs organized into modules
###### - some modifiable (data), some not (read only, execute only)
###### - if OS/HW accommodatees modules (Ms), advantages:
###### -> independent compilation of Ms
###### -> each M has own protection level
###### -> share Ms among different processes
##### 5. Physical Organization
###### - information is moved between the 2 levels of memory:
###### Secondary Memory:
###### - permanent storage programs/data
###### - slower, more capacity
###### Main Memory:
###### - holds programs/data currently in use
###### - fast, limited capacity

### Memory Partitioning
###### - memory management brings processes into main memory for execution by the processor
###### - involves virtual memory, which is based on segmentation and paging, which is based on simpler partitioning schemes

##### Partitioning 
###### - used in several variations in some now-obsolete operating systems
###### - does not involve virtual memory

### Memory Management Techniques
![Image](https://github.com/user-attachments/assets/3d7f066a-2576-49c9-9eb4-6e54df251b0e)

### Fixed Partitioning
##### Equal-size partitions
###### - any process whose size is less than or equal to the partition size can be loaded into an available partition
![Image](https://github.com/user-attachments/assets/a07a85d0-e49c-4e8c-ae74-ccd01965c854)

###### - the operating system can swap out a process if all partitions are full and no process is in the Ready or Running state

### Disadvantages
###### - a program may be too big to fit in a partition
###### - program needs to be designed with the use of overlays
###### - main memory utilization is inefficient
###### - any program, regardless of size, occupies an entire partition
##### internal fragmentation
###### - wasted space due to the block of data loaded being smaller than the partition

### Unequal Size Partitions
###### - using unequal size partitions helps lessen the problems
###### - programs up to 16M can be accomodated without overlays
###### - partitions smaller than 8M allow smaller programs to be accommodated with less internal fragmentation

![Image](https://github.com/user-attachments/assets/a6c99daf-cb11-43f4-bacc-ac23a86dea71)

### Memory Assignment For Fixed Partitioning
![Image](https://github.com/user-attachments/assets/65fdd168-1e0b-4310-8b4e-4af514803f56)

### Disadvantages of Fixed Partitioning Schemes
###### - the number of partitions specified at system generation time limits the number of active processes in the system
###### - small jobs will not itilize partition space efficiently

### Dynamic Partitioning
###### - partitions are of variable length and number
###### - process is allocated exactly as much memory as it requires

##### External Fragmentation
###### - memory becomes more and more fragmented
###### - memory utilization declines

##### Compaction
###### - technique for overcoming external fragmentation
###### - OS shifts processes so that they are contiguous
###### - free memory is together in one block
###### - time consuming and wastes processor time

### Effect Of Dynamic Partitioning
![Image](https://github.com/user-attachments/assets/bb2b4619-8d96-4b9d-adab-d0ebbf593d2c)

### Placement Algorithms
##### Best-fit
###### - chooses the block that is closest in size to the request
##### First-fit
###### - begins to scan memory from the beginning and chooses the first avilable blcok that is large enough
##### Next-fit
###### - begins to scan memory from the location of the last placement and chooses the next available block

### Memory Configuration Example, Before and After Allocation of 16M block
![Image](https://github.com/user-attachments/assets/23f9aa0f-d3cd-4b8d-8f4c-76d44bcf6011)

### Buddy System
###### - comprised of fixed and dynamic partitining schemes
##### memory blocks are available of size 2^K words, L <= K <= U, where
###### - 2^L = smallest size block that is allocated
###### - 2^U = largest size block that is allocated; generally 2^U is the size of the entire memory available for allocation
###### - to start, space available for allocation is treated as a single block size 2^U

### Buddy System Ex:
###### e.g., Suppose 1M total memory; 64K is the smallest block that can be allocated
###### Note: 1M = 1024K = 2^10  and  64K = 2^6
###### - 2^U = 1M = 2^10 is the largest block, and 2^6 is the smallest block allocated
###### - memory blocks available of size 2^k words, 6 <= k <= 10
###### - blocks of size 64K, 128K, 256K, 512K, 1024K
![Image](https://github.com/user-attachments/assets/2779c0e0-6c2a-4530-8ef2-1f9ec5ee396c)

### Tree Representation Of Buddy System
![Image](https://github.com/user-attachments/assets/3583d87b-c346-4ae6-bf46-8be68381beb9)

### Relocation Issues
###### - during its lifetime, Process P moves in memory: Relocation (swapping) and compaction
###### - program does memory references, e.g., y = &x
###### - x's address changes over P's lifetime
###### - program can't compile in x's actual address

### Addresses
##### Logical
###### - reference to a memory location independent of the current assignment of data to memory
##### Relative
###### - address is expressed as a location relative to some known point
##### Physical or Absolute
###### - actual location in main memory

### Hardware Support For Relocation
![Image](https://github.com/user-attachments/assets/9c2d3249-8589-463b-8a72-bcc9db295471)

### Paging
###### - partition memory into equal fixed-size chunks that are relatively small
###### - process is also divided into small fixed-size chunks of the same size
##### Pages
###### - chunks of a process
##### Frames
###### - available chunks of memory

### Assignment Of Process TO Free Frames
![Image](https://github.com/user-attachments/assets/22358bcc-e20d-47ec-86f4-bbeceaf84748)

![Image](https://github.com/user-attachments/assets/f2f0e62b-b86d-4eac-8d9a-d5c873b3308b)

### Page Table
###### - maintained by OS for each process
###### - contains the frame location for each page in the process
###### - processor must know how to access PT for the current process
###### - used by processor to produce a physical address
###### Logical Address: (page number, offset)
###### Physical Address: (frame number, offset)

### Data Structures
![Image](https://github.com/user-attachments/assets/795d8356-e12e-4dd2-ad79-9adcaf429416)

### Logical Addresses
![Image](https://github.com/user-attachments/assets/a7391cf6-e8ea-4b18-b677-7bacbc08880c)

### Logical Addresses - Paging
![Image](https://github.com/user-attachments/assets/ff77d99d-d532-4153-a022-06611a187347)

![Image](https://github.com/user-attachments/assets/9fd92d33-c7ec-41e1-a9e5-aa8234976b70)

### Works For Any Page Size
![Image](https://github.com/user-attachments/assets/fef0c240-0060-49d6-b6a9-d1d89cfe574b)

![Image](https://github.com/user-attachments/assets/a21a5d12-206d-4163-9096-e842419f8a2d)

### Logical-to-Physical Address Translation - Paging
![Image](https://github.com/user-attachments/assets/f5be8049-93ef-4d50-b3dd-9f0706ed566a)

### Segmentation
###### - a program can be subdivided into segments
###### - may vary in length, there is a maximum length
###### - addressing consisting of two processes
###### - segment number, an offset
###### - similar to dynamic partitioning, eliminates internal fragmentation

### Logical Addresses
![Image](https://github.com/user-attachments/assets/a044a845-d056-4254-87f6-1b6388ffac62)

### Logical-to-Physical Address Translation - Segmentation
![Image](https://github.com/user-attachments/assets/ae12e736-2931-4b43-a163-f18412e070ea)

