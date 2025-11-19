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

def heaps():
    print("=== MinHeap Examples ===")
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

    print("=== MaxHeap Examples ===")
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

    print("=== Using heapq directly ===")
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

    print("=== Heap Sort Example ===")
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

    print("=== Priority Queue Example ===")
    # Using heapq as priority queue (min-heap)
    pq = []
    heapq.heappush(pq, (3, 'Task C'))
    heapq.heappush(pq, (1, 'Task A'))
    heapq.heappush(pq, (2, 'Task B'))
    print("Priority queue:", pq)

    while pq:
        priority, task = heapq.heappop(pq)
        print(f"Processing {task} with priority {priority}", "\n")

    print("=== K Largest Elements ===")
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

    print("=== K Smallest Elements ===")
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

    print("=== Median Maintenance (Running Median) ===")
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

    print("=== Dijkstra's Algorithm Simulation ===")
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

    print("=== Huffman Coding Simulation ===")
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

if __name__ == "__main__":
    heaps()
