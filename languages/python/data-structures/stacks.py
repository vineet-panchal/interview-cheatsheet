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
  # Using a list as a stack (array implementation)
  stack = []  # Initialize an empty stack

  # Push elements onto the stack
  stack.append(10)  # Push 10
  stack.append(20)  # Push 20
  stack.append(30)  # Push 30
  print("Stack after pushing 10, 20, 30:", stack)

  # Peek at the top element
  if stack:
    print("Top element (peek):", stack[-1])  # Peek without removing

  # Pop elements from the stack
  popped = stack.pop()  # Pop 30
  print("Popped element:", popped)
  print("Stack after popping:", stack)

  # Check if stack is empty
  print("Is stack empty?", len(stack) == 0)

  # Get stack size
  print("Stack size:", len(stack))

  # Push more elements
  stack.append(40)
  stack.append(50)
  print("Stack after pushing 40, 50:", stack)

  # Pop all elements
  while stack:
    print("Popping:", stack.pop())
  print("Stack after popping all:", stack)
  print("Is stack empty now?", len(stack) == 0, "\n")

  # Example: Reversing a string using a stack
  def reverse_string(s):
    stack = []
    for char in s:
      stack.append(char)
    reversed_s = ""
    while stack:
      reversed_s += stack.pop()
    return reversed_s

  original = "Hello, World!"
  reversed_str = reverse_string(original)
  print("Original string:", original)
  print("Reversed string:", reversed_str, "\n")

  # Example: Checking balanced parentheses
  def is_balanced(s):
    stack = []
    pairs = {')': '(', '}': '{', ']': '['}
    for char in s:
      if char in '({[':
        stack.append(char)
      elif char in ')}]':
        if not stack or stack[-1] != pairs[char]:
          return False
        stack.pop()
    return len(stack) == 0

  test1 = "((()))"
  test2 = "([{}])"
  test3 = "([)]"
  print("Balanced check for '((()))':", is_balanced(test1))
  print("Balanced check for '([{}])':", is_balanced(test2))
  print("Balanced check for '([)]':", is_balanced(test3), "\n")

  # Example: Evaluating postfix expression (simple)
  def evaluate_postfix(expr):
    stack = []
    for token in expr.split():
      if token.isdigit():
        stack.append(int(token))
      else:
        b = stack.pop()
        a = stack.pop()
        if token == '+':
          stack.append(a + b)
        elif token == '-':
          stack.append(a - b)
        elif token == '*':
          stack.append(a * b)
        elif token == '/':
          stack.append(a // b)  # integer division
    return stack[0] if stack else 0

  postfix = "3 4 + 2 *"
  result = evaluate_postfix(postfix)
  print("Postfix expression:", postfix)
  print("Evaluated result:", result, "\n")

  # Example: Stack for undo functionality (simple text editor)
  def simulate_editor(commands):
    stack = []
    current = ""
    for cmd in commands:
      if cmd[0] == 'type':
        current += cmd[1]
        stack.append(('type', cmd[1]))
      elif cmd[0] == 'undo':
        if stack:
          action, char = stack.pop()
          current = current[:-1]  # remove last char
    return current

  commands = [('type', 'H'), ('type', 'e'), ('type', 'l'), ('undo',), ('type', 'p')]
  final_text = simulate_editor(commands)
  print("Final text after commands:", final_text)

if __name__ == "__main__":
  stacks()