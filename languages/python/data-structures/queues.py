from collections import deque

def queues():
  my_queue = deque()

  # Enqueue elements
  my_queue.append('A')
  my_queue.append('B')
  my_queue.append('C')
  print(f"Queue after enqueue: {my_queue}", "\n")

  # Dequeue elements
  first_element = my_queue.popleft()
  print(f"Dequeued element: {first_element}")
  print(f"Queue after dequeue: {my_queue}", "\n")

  # Peek at the front element
  if my_queue: # Check if queue is not empty before peeking
      front_element = my_queue[0]
      print(f"Front element (peek): {front_element}", "\n")

  # Check if empty
  is_empty = not bool(my_queue)
  print(f"Is queue empty? {is_empty}", "\n")

  # Get size
  queue_size = len(my_queue)
  print(f"Queue size: {queue_size}", "\n")
  
  print("Implementing Queues Using Lists")
  my_queue = []

  # Enqueue elements
  my_queue.append('X')
  my_queue.append('Y')
  my_queue.append('Z')
  print(f"Queue after enqueue: {my_queue}")

  # Dequeue elements (less efficient for large queues)
  first_element = my_queue.pop(0)
  print(f"Dequeued element: {first_element}")
  print(f"Queue after dequeue: {my_queue}")

if __name__ == "__main__":
  queues()