from collections import deque

def queues():
  # Using deque for efficient queue operations
  queue = deque()  # Initialize an empty queue

  # Enqueue elements (add to the back)
  queue.append(10)
  queue.append(20)
  queue.append(30)
  print("Queue after enqueue 10, 20, 30:", list(queue))

  # Dequeue elements (remove from the front)
  dequeued = queue.popleft()
  print("Dequeued element:", dequeued)
  print("Queue after dequeue:", list(queue))

  # Peek at the front element
  if queue:
    front = queue[0]
    print("Front element (peek):", front)

  # Check if queue is empty
  print("Is queue empty?", len(queue) == 0)

  # Get queue size
  print("Queue size:", len(queue))

  # Enqueue more elements
  queue.append(40)
  queue.append(50)
  print("Queue after enqueue 40, 50:", list(queue))

  # Dequeue all elements
  while queue:
    print("Dequeueing:", queue.popleft())
  print("Queue after dequeueing all:", list(queue))
  print("Is queue empty now?", len(queue) == 0, "\n")

  # Example: Simulating a print queue
  def print_queue(jobs):
    queue = deque()
    for job in jobs:
      queue.append(job)
      print(f"Job '{job}' added to print queue.")
    print("Processing print jobs:")
    while queue:
      job = queue.popleft()
      print(f"Printing job: {job}")
    print("All jobs processed.\n")

  jobs = ["Document1.pdf", "Image.jpg", "Report.docx"]
  print_queue(jobs)

  # Example: Breadth-First Search (BFS) simulation using queue
  def bfs_simulation(graph, start):
    queue = deque([start])
    visited = set([start])
    print(f"BFS starting from {start}:")
    while queue:
      node = queue.popleft()
      print(f"Visiting: {node}")
      for neighbor in graph.get(node, []):
        if neighbor not in visited:
          visited.add(neighbor)
          queue.append(neighbor)
    print("BFS complete.\n")

  graph = {
    'A': ['B', 'C'],
    'B': ['D', 'E'],
    'C': ['F'],
    'D': [],
    'E': ['F'],
    'F': []
  }
  bfs_simulation(graph, 'A')

  # Example: Task scheduling (priority queue simulation with deque)
  def task_scheduler(tasks):
    queue = deque()
    for task in tasks:
      queue.append(task)
    print("Processing tasks in order:")
    while queue:
      task = queue.popleft()
      print(f"Executing task: {task}")
    print("All tasks completed.\n")

  tasks = ["Task1", "Task2", "Task3"]
  task_scheduler(tasks)

  # Example: Hot potato game simulation
  def hot_potato(names, num):
    queue = deque(names)
    print(f"Hot potato game with {names}, passing {num} times.")
    while len(queue) > 1:
      for _ in range(num):
        queue.append(queue.popleft())
      eliminated = queue.popleft()
      print(f"Eliminated: {eliminated}")
    winner = queue[0]
    print(f"Winner: {winner}\n")

  names = ["Alice", "Bob", "Charlie", "David"]
  hot_potato(names, 3)

  # Using list as queue (less efficient for dequeue)
  print("Implementing Queues Using Lists (for small queues)")
  queue_list = []

  # Enqueue
  queue_list.append('A')
  queue_list.append('B')
  queue_list.append('C')
  print("Queue after enqueue A, B, C:", queue_list)

  # Dequeue
  dequeued_list = queue_list.pop(0)
  print("Dequeued:", dequeued_list)
  print("Queue after dequeue:", queue_list)

  # Peek
  if queue_list:
    print("Front element:", queue_list[0])

  # Size and empty check
  print("Size:", len(queue_list))
  print("Is empty?", len(queue_list) == 0)

if __name__ == "__main__":
  queues()