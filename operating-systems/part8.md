# Chapter 8 - Virtual Memory
### Hardware and Control Structures
###### - two characteristics fundamental to memory management:
###### 1) all memory references are logical addresses that are dynamically translated into physical addresses at run time
###### 2) a process may be broken up into a number of pieces that don’t need to be contiguously located in main memory during execution
###### - if these two characteristics are present, it is not necessary that all of the pages or segments of a process be in main memory during execution

### Terminology
##### Virtual Memory
###### - A storage allocation scheme in which secondary memory can be addressed as though it were part of main memory. 
###### - The addresses a program may use to reference memory are distinguished from the addresses the memory system uses to identify physical storage sites, and program-generated addresses are translated automatically to the corresponding machine addresses
###### - The size of virtual storage is limited by the addressing scheme of the computer system, and by the amount of secondary memory available and not by the actual number of main storage locations

##### Virtual Address
###### - The address assigned to a location in virtual memory to allow that location to be accessed as though it were part of main memory
##### Virtual Address Space
###### - the virtual storage assigned to a process
##### Address Space
###### - the range of memory addresses available to a process
##### Real Address
###### - the address of a storage location in main memory

### Execution Of A Process
###### - operating system brings into main memory a few pieces of the program
###### - resident set - portion of process that is in main memory
###### - hardware generates an interrupt if needed logical address not in main memory (memory access fault)
###### - operating system places the process in a blocking state

### Execution Of A Process
##### piece of process that contains the logical address is brought into main memory:
###### - operating system issues a disk I/O Read request
###### - another process is dispatched to run while the disk I/O takes place
###### - when disk I/O is complete, an interrupt is issued, causing OS to place the affected process in the Ready state

### Implications
###### - More processes may be maintained in main memory
###### - only load in some of the pieces of each process
###### - with so many processes in main memory, it is very likely a process will be in the Ready state at any particular time
###### - A process may be larger than all of main memory
###### - Better processor utilization
###### - Better Memory utilization
###### - Faster “suspensions”

### Real and Virtual Memory
##### Real Memory
###### - main memory, the actual RAM
##### Virtual Memory
###### - memory on disk
###### - allows for effective multiprogramming and relieves the user of tight constraints of main memory

### Thrashing
###### - A state in which the system spends most of its time swapping process pieces rather than executing instructions
###### - To avoid this, the operating system tries to guess, based on recent history, which pieces are least likely to be used in the near future

### Principle Of Locality
###### - Program and data references within a process tend to cluster
###### - Only a few pieces of a process will be needed over a short period of time
###### - Therefore it is possible to make intelligent guesses about which pieces will be needed in the future
###### - Avoids thrashing

### Support Needed For Virtual Memory
###### - hardware must support paging and/or segmentation
###### - operating system must include software for managing the movement of pages and/or segments between secondary memory and main memory

### Paging
###### - The term virtual memory is usually associated with systems that employ paging
###### - Use of paging to achieve virtual memory was first reported for the Atlas computer
###### - Each process has its own page table
###### - each page table entry contains the frame number of the corresponding page in main memory

### Memory Management Formats
![Image](https://github.com/user-attachments/assets/f303e0ee-3dbb-4b5d-b6b9-34ce00254bae)

![Image](https://github.com/user-attachments/assets/56fb1496-1217-4b78-b14b-0489a4ca7907)

![Image](https://github.com/user-attachments/assets/d63cafb2-96b3-4e8d-aba0-0a607e07b57a)

### Address Translation
![Image](https://github.com/user-attachments/assets/5dd1cff6-b089-4635-892e-ca6713cad888)

### Page Table Size
###### - The size of the page table is proportional to the number of pages in the process
###### Ex: Suppose Process P in virtual memory occupies 4GB (2^32 bytes)
###### - Assume 4kb pages (2^12 bytes) and byet-level addressing
###### - P has 2^20 pages
###### - then P's Page Table needs 2^20 entries
###### - assume each entry takes 4 bytes (2^2 bytes)
###### - P's Pate Table takes 2^22 bytes (=4MB)
###### So put Page Tables into Virtual Memory...

### Page Table in Virtual Memory
###### ... P's Page Table takes 2^22 bytes (=4MB)
###### - make Root PT for P's PT
###### - still assume 4KB pages (2^12 bytes)
###### - P's PT has 2^10 pages
###### - then Root PT needs 2^10 entries
###### - stil assume entry is 4 bytes (2^2)
###### - Root PT takes 2^12 bytes (4KB)
###### Main Memory: - Root Page Table (4KB)
###### Virtual Memory: - Process Page Table (4MB) and Process Image (4GB)

![Image](https://github.com/user-attachments/assets/8b19d1fc-a238-4eec-b5c2-52866e078899)

### Address Translation
###### Register holds start of Root PT in memory
###### - 1st 10 bits of Virt. Addr holds slot # of Root PT, say slot S1
###### - Slot S1 of RootPT holds a frame #, say FS
###### - FS is the frame that is holding one page of P’s PageTable
###### Thus, in FS, we find a bunch of slots of the P’s PageTable. Which slot do we need?
###### - 2nd 10 bits of VirtAddr holds this slot #, S2
###### - Slot S2 of FS holds "Frame #" which becomes part of the real address.

![Image](https://github.com/user-attachments/assets/5bd94891-c60e-473e-8d0c-c4a4d32a69a9)

### Page Table Issues
###### - P’s Page Table is proportional to P’s size.
###### - Root PT also proportional to P’s size
###### - All PTs together are proportional to size of V. Memory
##### Different approach:
###### - One PT. A slot for each frame of Real Memory
###### - Entry for slot X says what page of what process is occupying frame X now.
###### - One PT, proportional to size of Real Memory

### Inverted Page Table Structure
![Image](https://github.com/user-attachments/assets/08c474e7-94b5-44b8-930f-548d81220562)
#### Each entry in the page table includes:
##### Page Number
##### Process ID
###### - the process that owns this page
##### Control Bits
###### - includes flags and protection and locking information
##### Chain Pointer
###### - the index value of the enxt entry in the chain

### Translation Lookaside Buffer (TLB)
##### - each virtual memory reference can cause two physical accesses:
###### - one to fetch the page table entry
###### - one to fetch the data
##### Translation Lookside Buffer (TLB)
###### - to overcome the effect of doubling the memory access time, most virtual memory schemes make use of a special high-speed cache

### Example As Before, No TLB
![Image](https://github.com/user-attachments/assets/ad92e23d-5b4a-4409-bbc5-926e59cc6e03)

### Use Of TLB
![Image](https://github.com/user-attachments/assets/382ecfe2-4724-446f-ba18-903cbf4eac78)

### TLB Operation
![Image](https://github.com/user-attachments/assets/443d7b15-3b84-4fe7-9b4c-7b81b48b3f7b)

### Associative Mapping
###### - the TLB only contains some of the page table entries so we cannot simply index into the TLB based on page number
###### - each TLB entry must include the page number as well as the complete page table entry
###### - the processor is equipped with hardware that allows it to interrogate simultaneously a number of TLB entries to determine if there is a match on the page

![Image](https://github.com/user-attachments/assets/ce50c45a-5fa8-472c-b3cc-b390ca117d22)

### TLB and cache operation
![Image](https://github.com/user-attachments/assets/1d1ce445-bcda-4f8c-82b9-082396b6270c)


### Page Size
###### - the smaller the apge size, the lesser the amount of internal fragmentation, and more processes in memory
###### - however, more pages are required per process
###### - more pages per process means larger page tables
###### - for large programs in a heavily multiprogrammed environment foms portion of the page tables of active processes must be in VM
###### - the physical characteristics of most-secondary-memory devices (VM) favor a larger page size for more efficient blcok transfer of data
###### - issues for hardware designer to consider

![Image](https://github.com/user-attachments/assets/068ba1ab-f017-4ad4-85b4-225713499ca3)

### Example Of Page Sizes
![Image](https://github.com/user-attachments/assets/364d3833-fca8-414e-a11f-e38b18b9cbe9)

### Page Size
###### 1.) the design issue of page size is related to the size pf physical main memory and program size
###### 2.) Main memory is getting larger and address space used by applications is also growing
###### 3.) Most obvious on personal computers where applications are becoming increasingly complex
###### - contemporary programming techniques used in large programs ted to decrease the locality of references within a process

### Segementation
###### - segementation allows the programmer to view memory as consisting of multiple address spaces or segments
##### Advantages:
###### - simplifies handling of growing data structures
###### - allows programs to be altered and recompiled independently
###### - lends itself to sharing data smong processes
###### - lends itself to protection

### Segment Organization
###### - Each segment table entry contains the starting address of the corresponding segment in main memory and the length of the segment
###### - A bit is needed to determine if the segment is already in main memory
###### - Another bit is needed to determine if the segment has been modified since it was loaded in main memory

![Image](https://github.com/user-attachments/assets/22de9f93-5945-4e16-b89c-19969ff74082)

### Paging and Segmentation
###### - both have strengths:
##### Paging
###### - no external fragmentation
###### - efficient main memory usage
###### - simpler OS algorithms
##### Segmentation
###### - grow/shrink data structures
###### - modularity support
###### - protection/sharing support

### Combined Paging and Segmentation
###### - in a combined paging/segmentation system a user's address space is broken up into a number of segments
###### - each segment is broken up into a number of fixed-sized pages which are equal in length to a main memory frame
##### - segmentation is visible to the programmer
##### - paging is transparent to the programmer

![Image](https://github.com/user-attachments/assets/da8dd03c-87ce-44c0-8fe2-b0dd90c02a28)

![Image](https://github.com/user-attachments/assets/03517c74-c5ea-454e-b529-1666047aab10)

### Protection and Sharing
###### - Segmentation lends itself to the implementation of protection and sharing policies
###### - Each entry has a base address and length so inadvertent memory access can be controlled
###### - Sharing can be achieved by segments referencing multiple processes

![Image](https://github.com/user-attachments/assets/be9fc272-6981-4b0f-8258-4cabe596fae7)

### Operating System Structure
##### The design of the memory management portion of an OS depends on 3 fundamental areas of choice:
###### - whether or not to use VM techniques
###### - the use of paging ro segmentation or both 
###### - the algorithms employed for various aspects of memory management

### Policies For VM

![Image](https://github.com/user-attachments/assets/c3a5ca08-d23e-4c0e-97ca-22bb6d23814f)

### Fetch Policy
###### - determines when a page should be brought into memory
##### Two Main Types:
###### - Demand Paging
###### - Prepaging

### Demand Paging
###### - only brings pages into main meory when a reference is made to a location on the page
###### - many page faults when process is first started
###### - principle of locality suggests that as more and more pages are brought in, most future references will be to pages that have recently been brought in, and page faults should drop to a very low level

### Prepaging
###### - pages other than the one demanded by a page fault are brought in
###### - exploits the characteristics of most secondary memory devices
###### - if pages of a process are stored contiguously in secondary memory it is more efficient to bring in a number of pages at one time
###### - ineffective if extra pages are not referenced
###### - should not be confused with “swapping”

### Placement Policy

###### - Determines where in real memory a process piece is to reside
###### - Important design issue in a segmentation system
###### - Paging or combined paging with segmentation placing is irrelevant because hardware performs functions with equal efficiency
###### - For NUMA systems an automatic placement strategy is desirable

### Replacement Policy
###### - Deals with the selection of a page in main memory to be replaced when a new page must be brought in
###### - objective is that the page that is removed be the page least likely to be referenced in the near future
###### - The more elaborate the replacement policy the greater the hardware and software overhead to implement it

### Frame Locking

###### - When a frame is locked the page currently stored in that frame may not be replaced
###### - kernel of the OS as well as key control structures are held in locked frames
###### - I/O buffers and time-critical areas may be locked into main memory frames
###### - locking is achieved by associating a lock bit with each frame

### Basic Algorithms
###### Algorithms used for the selection of a page to replace:
###### - Optimal
###### - Least recently used (LRU)
###### - First-in-first-out (FIFO)
###### - Clock

### Optimal Policy
###### - selects the page for which the time to the next reference is the longest
###### - produces three page faults after the frame allocation has been filled

![Image](https://github.com/user-attachments/assets/7c945d5e-a0ec-4ab1-8d8b-8ff788dc6368)

### Least Recently Used (LRU)
###### - Replaces the page that has not been referenced for the longest time
###### - By the principle of locality, this should be the page least likely to be referenced in the near future
###### - Difficult to implement
###### - one approach is to tag each page with the time of last reference
###### - this requires a great deal of overhead

![Image](https://github.com/user-attachments/assets/6511319a-77bd-40d7-bb88-e1eb2c5d6c00)

### First-in-First-out (FIFO)
###### - Treats page frames allocated to a process as a circular buffer
###### - Pages are removed in round-robin style
###### - simple replacement policy to implement
###### - Page that has been in memory the longest is replaced

![Image](https://github.com/user-attachments/assets/51619f47-d0f2-45b2-b466-678ad8a00c5e)

### Clock Policy
###### - Requires the association of an additional bit with each frame
###### - referred to as the use bit
###### - When a page is first loaded in memory the use bit is set to 1
###### - When a page is referenced, the use bit is set to 1
###### - The set of frames is considered to be a circular buffer
###### - The algorithm gives preference to frames with use bit 0

##### Algorithm:
###### - Pointer is maintained. Next frame after replaced frame.
###### - To select frame, start at pointer, looking at use bits
###### - if bit=0 stop, replace this frame, set pointer to next
###### - else if bit=1, set it to 0, keep going
###### - If all bits were 1, will make one complete cycle—but when return to original position, bit will be 0, so will be selected
###### - Note: frames with use bit 1 are “passed over” by

![Image](https://github.com/user-attachments/assets/cb0baf5a-9cb3-4007-8548-ae2a52711048)

![Image](https://github.com/user-attachments/assets/50bd7bf2-c665-4c57-aabd-62288ff62d1b)
###### * = use bit is 1
######  = pointer

### Comparison Of Algorithms
![Image](https://github.com/user-attachments/assets/fbac7d2e-e932-487c-ba43-70dd714ba3c5)

![Image](https://github.com/user-attachments/assets/86c941e3-f366-42f5-abd6-aebeb762aa16)

