# Queues in Python

## Introduction

**Queues** are linear data structures that follow the First In, First Out (FIFO) principle. Elements are added at the rear and removed from the front.

## Basic Queue Operations

```python
from collections import deque

# Using deque (recommended)
queue = deque()

# Enqueue (add to rear)
queue.append(1)
queue.append(2)
queue.append(3)
print("Queue after enqueue:", list(queue))

# Dequeue (remove from front)
front = queue.popleft()
print("Dequeued:", front)
print("Queue after dequeue:", list(queue))

# Peek front
if queue:
    print("Front element:", queue[0])

# Check if empty
print("Is empty:", len(queue) == 0)

# Size
print("Size:", len(queue))
```

## Output

```bash
Queue after enqueue: [1, 2, 3]
Dequeued: 1
Queue after dequeue: [2, 3]
Front element: 2
Is empty: False
Size: 2
```

## Queue Implementation

```python
class Queue:
    def __init__(self):
        self.items = []

    def enqueue(self, item):
        self.items.append(item)

    def dequeue(self):
        if not self.is_empty():
            return self.items.pop(0)
        return None

    def peek(self):
        if not self.is_empty():
            return self.items[0]
        return None

    def is_empty(self):
        return len(self.items) == 0

    def size(self):
        return len(self.items)

    def print_queue(self):
        print(self.items)
```

## Queue Examples

```python
# Basic operations
q = Queue()
q.enqueue(10)
q.enqueue(20)
q.enqueue(30)
print("Queue after enqueue:")
q.print_queue()

print("Dequeue:", q.dequeue())
print("Queue after dequeue:")
q.print_queue()

print("Peek:", q.peek())
print("Size:", q.size())
print("Is empty:", q.is_empty())
```

## Output

```bash
Queue after enqueue:
[10, 20, 30]
Dequeue: 10
Queue after dequeue:
[20, 30]
Peek: 20
Size: 2
Is empty: False
```

## Types of Queues

### 1. Circular Queue

```python
class CircularQueue:
    def __init__(self, capacity):
        self.capacity = capacity
        self.queue = [None] * capacity
        self.front = self.rear = -1

    def enqueue(self, item):
        if (self.rear + 1) % self.capacity == self.front:
            print("Queue is full")
            return
        elif self.front == -1:
            self.front = self.rear = 0
        else:
            self.rear = (self.rear + 1) % self.capacity
        self.queue[self.rear] = item

    def dequeue(self):
        if self.front == -1:
            print("Queue is empty")
            return None
        item = self.queue[self.front]
        if self.front == self.rear:
            self.front = self.rear = -1
        else:
            self.front = (self.front + 1) % self.capacity
        return item

    def print_queue(self):
        if self.front == -1:
            print("Queue is empty")
            return
        i = self.front
        while True:
            print(self.queue[i], end=" ")
            if i == self.rear:
                break
            i = (i + 1) % self.capacity
        print()
```

### 2. Priority Queue

```python
import heapq

class PriorityQueue:
    def __init__(self):
        self.queue = []
        self.index = 0

    def enqueue(self, item, priority):
        heapq.heappush(self.queue, (-priority, self.index, item))
        self.index += 1

    def dequeue(self):
        return heapq.heappop(self.queue)[-1]

    def peek(self):
        return self.queue[0][-1] if self.queue else None

    def is_empty(self):
        return len(self.queue) == 0

    def size(self):
        return len(self.queue)
```

## Queue Applications

### 1. Breadth-First Search (BFS)

```python
from collections import deque

def bfs(graph, start):
    visited = set()
    queue = deque([start])
    visited.add(start)

    while queue:
        node = queue.popleft()
        print(node, end=" ")

        for neighbor in graph[node]:
            if neighbor not in visited:
                visited.add(neighbor)
                queue.append(neighbor)

# Example graph
graph = {
    'A': ['B', 'C'],
    'B': ['A', 'D', 'E'],
    'C': ['A', 'F'],
    'D': ['B'],
    'E': ['B', 'F'],
    'F': ['C', 'E']
}

print("BFS traversal:")
bfs(graph, 'A')
```

### 2. Print Queue Simulation

```python
def simulate_print_queue():
    print_queue = deque()

    # Add print jobs
    print_queue.append("Document1.pdf")
    print_queue.append("Report.docx")
    print_queue.append("Presentation.pptx")

    print("Print queue:", list(print_queue))

    # Process print jobs
    while print_queue:
        current_job = print_queue.popleft()
        print(f"Printing: {current_job}")

simulate_print_queue()
```

### 3. Hot Potato Game

```python
def hot_potato(names, num):
    queue = deque(names)
    while len(queue) > 1:
        for _ in range(num - 1):
            queue.append(queue.popleft())
        eliminated = queue.popleft()
        print(f"Eliminated: {eliminated}")
    return queue[0]

names = ["Alice", "Bob", "Charlie", "David", "Eve"]
winner = hot_potato(names, 3)
print(f"Winner: {winner}")
```

### 4. Task Scheduling

```python
def task_scheduler(tasks):
    queue = deque()
    for task in tasks:
        queue.append(task)

    print("Processing tasks:")
    while queue:
        task = queue.popleft()
        print(f"Executing: {task}")
        # Simulate some tasks taking longer
        if "complex" in task.lower():
            print(f"  {task} is complex, adding back to queue")
            queue.append(task)

tasks = ["Simple task 1", "Complex calculation", "Simple task 2", "Complex analysis"]
task_scheduler(tasks)
```

## Queue vs Stack

| Aspect | Queue | Stack |
|--------|-------|-------|
| Principle | FIFO | LIFO |
| Operations | enqueue/dequeue | push/pop |
| Ends used | Front and rear | Only top |
| Implementation | deque or list | list |
| Use cases | BFS, scheduling | Function calls, undo |

## Performance

- **Enqueue**: O(1) with deque, O(n) with list
- **Dequeue**: O(1) with deque, O(n) with list
- **Peek**: O(1)
- **Size**: O(1)

## Best Practices

- Use `collections.deque` for efficient queue operations
- Use `queue.Queue` for thread-safe operations
- Use `queue.PriorityQueue` for priority-based operations
- Consider `queue.LifoQueue` for stack-like behavior

## Common Patterns

### Sliding Window Maximum

```python
from collections import deque

def sliding_window_maximum(nums, k):
    if not nums:
        return []

    result = []
    window = deque()

    for i, num in enumerate(nums):
        # Remove elements outside the window
        while window and window[0] <= i - k:
            window.popleft()

        # Remove smaller elements from the back
        while window and nums[window[-1]] <= num:
            window.pop()

        window.append(i)

        # Add to result when window is full
        if i >= k - 1:
            result.append(nums[window[0]])

    return result

nums = [1, 3, -1, -3, 5, 3, 6, 7]
k = 3
print("Sliding window maximum:", sliding_window_maximum(nums, k))
```

### Level Order Traversal (Binary Tree)

```python
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

def level_order(root):
    if not root:
        return []

    result = []
    queue = deque([root])

    while queue:
        level_size = len(queue)
        level = []

        for _ in range(level_size):
            node = queue.popleft()
            level.append(node.val)

            if node.left:
                queue.append(node.left)
            if node.right:
                queue.append(node.right)

        result.append(level)

    return result

# Example tree
root = TreeNode(1)
root.left = TreeNode(2)
root.right = TreeNode(3)
root.left.left = TreeNode(4)
root.left.right = TreeNode(5)

print("Level order traversal:", level_order(root))
```

## Thread-Safe Queues

```python
import queue
import threading
import time

def producer(q, items):
    for item in items:
        q.put(item)
        print(f"Produced: {item}")
        time.sleep(0.1)

def consumer(q):
    while True:
        item = q.get()
        if item is None:
            break
        print(f"Consumed: {item}")
        q.task_done()

# Thread-safe queue
q = queue.Queue()

# Start producer thread
producer_thread = threading.Thread(target=producer, args=(q, [1, 2, 3, 4, 5]))
producer_thread.start()

# Start consumer thread
consumer_thread = threading.Thread(target=consumer, args=(q,))
consumer_thread.start()

# Wait for producer to finish
producer_thread.join()

# Signal consumer to stop
q.put(None)
consumer_thread.join()
```

## Summary

Queues are essential data structures for managing ordered collections with FIFO semantics. Python's `collections.deque` provides efficient implementations, while `queue.Queue` offers thread-safety. Understanding different queue types and their applications is crucial for solving various algorithmic problems and implementing concurrent systems.
