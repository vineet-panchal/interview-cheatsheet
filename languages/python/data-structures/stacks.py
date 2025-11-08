class Stack:
    def __init__(self):
        self.items = []

    def push(self, item):
        """Adds an item to the top of the stack."""
        self.items.append(item)

    def pop(self):
        """Removes and returns the item from the top of the stack."""
        if not self.is_empty():
            return self.items.pop()
        else:
            raise IndexError("pop from empty stack")

    def peek(self):
        """Returns the item at the top of the stack without removing it."""
        if not self.is_empty():
            return self.items[-1]
        else:
            raise IndexError("peek from empty stack")

    def is_empty(self):
        """Checks if the stack is empty."""
        return len(self.items) == 0

    def size(self):
        """Returns the number of items in the stack."""
        return len(self.items)
    
    def printStack(self):
      return self.items

def stacks():
  my_stack = Stack()
  my_stack.push(10)
  my_stack.push(20)
  print(f"My stack: ", my_stack.printStack())
  print(f"Stack size: {my_stack.size()}")  # Output: Stack size: 2
  print(f"Top element: {my_stack.peek()}") # Output: Top element: 20
  print(f"Popped element: {my_stack.pop()}") # Output: Popped element: 20
  print(f"Stack is empty: {my_stack.is_empty()}") # Output: Stack is empty: False

if __name__ == "__main__":
  stacks()