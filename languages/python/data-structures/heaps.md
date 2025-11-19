# Heaps in Python

## Introduction

**Heaps** are specialized tree-based data structures that satisfy the heap property. In a max-heap, parent nodes are always larger than or equal to their children, while in a min-heap, parent nodes are always smaller than or equal to their children.

## Basic Heap Operations

```python
import heapq

# Min-heap using heapq
heap = []

# Push elements
heapq.heappush(heap, 10)
heapq.heappush(heap, 5)
heapq.heappush(heap, 20)
heapq.heappush(heap, 1)
print("Heap after push:", heap)

# Peek (smallest element)
print("Smallest element:", heap[0])

# Pop (remove smallest)
smallest = heapq.heappop(heap)
print("Popped smallest:", smallest)
print("Heap after pop:", heap)

# Push and pop in one operation
heapq.heappushpop(heap, 15)
print("After pushpop 15:", heap)

# Pop and push in one operation
new_smallest = heapq.heapreplace(heap, 3)
print("Replaced with 3, old smallest was:", new_smallest)
print("Heap after replace:", heap)
```

## Output

```bash
Heap after push: [1, 5, 20, 10]
Smallest element: 1
Popped smallest: 1
Heap after pop: [5, 10, 20]
After pushpop 15: [5, 10, 15, 20]
Replaced with 3, old smallest was: 5
Heap after replace: [3, 10, 15, 20]
```

## Heap Implementation

```python
import heapq

class MinHeap:
    def __init__(self):
        self.heap = []

    def push(self, item):
        heapq.heappush(self.heap, item)

    def pop(self):
        if self.heap:
            return heapq.heappop(self.heap)
        return None

    def peek(self):
        if self.heap:
            return self.heap[0]
        return None

    def size(self):
        return len(self.heap)

    def is_empty(self):
        return len(self.heap) == 0

class MaxHeap:
    def __init__(self):
        self.heap = []

    def push(self, item):
        heapq.heappush(self.heap, -item)

    def pop(self):
        if self.heap:
            return -heapq.heappop(self.heap)
        return None

    def peek(self):
        if self.heap:
            return -self.heap[0]
        return None

    def size(self):
        return len(self.heap)

    def is_empty(self):
        return len(self.heap) == 0
```

## Heap Examples

```python
# MinHeap Examples
min_heap = MinHeap()

# Push elements
min_heap.push(10)
min_heap.push(5)
min_heap.push(20)
min_heap.push(1)
print("MinHeap after pushing 10, 5, 20, 1:", min_heap.heap)

# Peek
print("Peek min:", min_heap.peek())

# Pop
popped = min_heap.pop()
print("Popped:", popped)
print("MinHeap after pop:", min_heap.heap)

# Size and empty check
print("Size:", min_heap.size())
print("Is empty:", min_heap.is_empty())

# Push more
min_heap.push(3)
min_heap.push(15)
print("MinHeap after pushing 3, 15:", min_heap.heap)

# Pop all
while not min_heap.is_empty():
    print("Popping:", min_heap.pop())
print("MinHeap empty:", min_heap.is_empty(), "\n")

# MaxHeap Examples
max_heap = MaxHeap()

# Push elements
max_heap.push(10)
max_heap.push(5)
max_heap.push(20)
max_heap.push(1)
print("MaxHeap after pushing 10, 5, 20, 1:", [-x for x in max_heap.heap])  # Show positive for clarity

# Peek
print("Peek max:", max_heap.peek())

# Pop
popped = max_heap.pop()
print("Popped:", popped)
print("MaxHeap after pop:", [-x for x in max_heap.heap])

# Size and empty check
print("Size:", max_heap.size())
print("Is empty:", max_heap.is_empty())

# Push more
max_heap.push(3)
max_heap.push(15)
print("MaxHeap after pushing 3, 15:", [-x for x in max_heap.heap])

# Pop all
while not max_heap.is_empty():
    print("Popping:", max_heap.pop())
print("MaxHeap empty:", max_heap.is_empty(), "\n")
```

## Output

```bash
MinHeap after pushing 10, 5, 20, 1: [1, 5, 20, 10]
Peek min: 1
Popped: 1
MinHeap after pop: [5, 10, 20]
Size: 3
Is empty: False
MinHeap after pushing 3, 15: [3, 5, 10, 20, 15]
Popping: 3
Popping: 5
Popping: 10
Popping: 15
Popping: 20
MinHeap empty: True

MaxHeap after pushing 10, 5, 20, 1: [20, 10, 5, 1]
Peek max: 20
Popped: 20
MaxHeap after pop: [10, 1, 5]
Size: 3
Is empty: False
MaxHeap after pushing 3, 15: [15, 10, 5, 1, 3]
Popping: 15
Popping: 10
Popping: 5
Popping: 3
Popping: 1
MaxHeap empty: True
```

## Using heapq directly

```python
# Min-heap with heapq
heap = []
heapq.heappush(heap, 10)
heapq.heappush(heap, 5)
heapq.heappush(heap, 20)
print("Heap after push:", heap)

print("Peek:", heap[0])
print("Pop:", heapq.heappop(heap))
print("Heap after pop:", heap)

# Max-heap simulation
max_heap_list = []
heapq.heappush(max_heap_list, -10)
heapq.heappush(max_heap_list, -5)
heapq.heappush(max_heap_list, -20)
print("Max-heap list:", max_heap_list)
print("Actual max:", -max_heap_list[0])
print("Pop max:", -heapq.heappop(max_heap_list), "\n")
```

## Heap Sort Example

```python
def heap_sort(arr):
    heapq.heapify(arr)
    sorted_arr = []
    while arr:
        sorted_arr.append(heapq.heappop(arr))
    return sorted_arr

arr = [3, 1, 4, 1, 5, 9, 2, 6]
print("Original array:", arr)
sorted_arr = heap_sort(arr.copy())
print("Sorted array:", sorted_arr, "\n")
```

## Priority Queue Example

```python
# Using heapq as priority queue (min-heap)
pq = []
heapq.heappush(pq, (3, 'Task C'))
heapq.heappush(pq, (1, 'Task A'))
heapq.heappush(pq, (2, 'Task B'))
print("Priority queue:", pq)

while pq:
    priority, task = heapq.heappop(pq)
    print(f"Processing {task} with priority {priority}", "\n")
```

## K Largest Elements

```python
def k_largest(nums, k):
    heap = []
    for num in nums:
        heapq.heappush(heap, num)
        if len(heap) > k:
            heapq.heappop(heap)
    return heap

nums = [3, 2, 1, 5, 6, 4]
k = 3
largest = k_largest(nums, k)
print(f"{k} largest in {nums}:", largest, "\n")
```

## K Smallest Elements

```python
def k_smallest(nums, k):
    heap = []
    for num in nums:
        heapq.heappush(heap, -num)
        if len(heap) > k:
            heapq.heappop(heap)
    return [-x for x in heap]

nums = [3, 2, 1, 5, 6, 4]
k = 3
smallest = k_smallest(nums, k)
print(f"{k} smallest in {nums}:", smallest, "\n")
```

## Median Maintenance (Running Median)

```python
class MedianFinder:
    def __init__(self):
        self.max_heap = []  # Left half (smaller half)
        self.min_heap = []  # Right half (larger half)

    def add_num(self, num):
        heapq.heappush(self.max_heap, -num)
        heapq.heappush(self.min_heap, -heapq.heappop(self.max_heap))
        if len(self.min_heap) > len(self.max_heap):
            heapq.heappush(self.max_heap, -heapq.heappop(self.min_heap))

    def find_median(self):
        if len(self.max_heap) > len(self.min_heap):
            return -self.max_heap[0]
        return (-self.max_heap[0] + self.min_heap[0]) / 2

mf = MedianFinder()
nums = [5, 15, 1, 3, 2, 8, 7, 9, 10, 6, 11, 4]
for num in nums:
    mf.add_num(num)
    print(f"Added {num}, median: {mf.find_median()}")
print()
```

## Dijkstra's Algorithm Simulation

```python
def dijkstra(graph, start):
    pq = [(0, start)]  # (distance, node)
    distances = {node: float('inf') for node in graph}
    distances[start] = 0

    while pq:
        current_distance, current_node = heapq.heappop(pq)

        if current_distance > distances[current_node]:
            continue

        for neighbor, weight in graph[current_node].items():
            distance = current_distance + weight
            if distance < distances[neighbor]:
                distances[neighbor] = distance
                heapq.heappush(pq, (distance, neighbor))

    return distances

graph = {
    'A': {'B': 4, 'C': 2},
    'B': {'A': 4, 'C': 1, 'D': 5},
    'C': {'A': 2, 'B': 1, 'D': 8, 'E': 10},
    'D': {'B': 5, 'C': 8, 'E': 2},
    'E': {'C': 10, 'D': 2}
}
start = 'A'
distances = dijkstra(graph, start)
print(f"Shortest distances from {start}:", distances, "\n")
```

## Huffman Coding Simulation

```python
class HuffmanNode:
    def __init__(self, char, freq):
        self.char = char
        self.freq = freq
        self.left = None
        self.right = None

    def __lt__(self, other):
        return self.freq < other.freq

def build_huffman_tree(text):
    freq = {}
    for char in text:
        freq[char] = freq.get(char, 0) + 1

    pq = [HuffmanNode(char, f) for char, f in freq.items()]
    heapq.heapify(pq)

    while len(pq) > 1:
        left = heapq.heappop(pq)
        right = heapq.heappop(pq)
        merged = HuffmanNode(None, left.freq + right.freq)
        merged.left = left
        merged.right = right
        heapq.heappush(pq, merged)

    return pq[0]

def print_codes(node, code=""):
    if node is None:
        return
    if node.char is not None:
        print(f"{node.char}: {code}")
    print_codes(node.left, code + "0")
    print_codes(node.right, code + "1")

text = "hello world"
root = build_huffman_tree(text)
print("Huffman codes for 'hello world':")
print_codes(root)
```

## Time Complexity

- **Insert**: O(log n)
- **Extract min/max**: O(log n)
- **Peek**: O(1)
- **Heapify**: O(n)

## Applications

- Priority queues
- Heap sort
- Graph algorithms (Dijkstra, Prim)
- Median maintenance
- K largest/smallest elements
- Huffman coding
- Event simulation

## Heap vs Other Data Structures

| Operation | Heap | Sorted Array | Unsorted Array |
|-----------|------|--------------|----------------|
| Insert | O(log n) | O(n) | O(1) |
| Find min/max | O(1) | O(1) | O(n) |
| Delete min/max | O(log n) | O(n) | O(n) |

## Best Practices

- Use `heapq` for min-heaps
- Negate values for max-heaps
- Use tuples for priority queues with multiple criteria
- Implement custom `__lt__` for complex objects
- Consider `queue.PriorityQueue` for thread-safe operations

## Summary

Heaps are powerful data structures for maintaining ordered elements efficiently. Python's `heapq` module provides robust heap operations, making it easy to implement priority queues and other heap-based algorithms. Understanding heap properties and applications is essential for solving complex algorithmic problems.
