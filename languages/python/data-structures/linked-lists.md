# Linked Lists in Python

## Introduction

**Linked Lists** are linear data structures where elements are stored in nodes, and each node points to the next node in the sequence. Unlike arrays, linked lists don't require contiguous memory allocation.

## Types of Linked Lists

- **Singly Linked List**: Each node has data and a pointer to the next node
- **Doubly Linked List**: Each node has data, a pointer to the next node, and a pointer to the previous node
- **Circular Linked List**: The last node points back to the first node

## Singly Linked List

```python
class Node:
    def __init__(self, data):
        self.data = data
        self.next = None

class SinglyLinkedList:
    def __init__(self):
        self.head = None

    def append(self, data):
        new_node = Node(data)
        if not self.head:
            self.head = new_node
            return
        current = self.head
        while current.next:
            current = current.next
        current.next = new_node

    def prepend(self, data):
        new_node = Node(data)
        new_node.next = self.head
        self.head = new_node

    def insert_after(self, prev_node, data):
        if not prev_node:
            print("Previous node cannot be None")
            return
        new_node = Node(data)
        new_node.next = prev_node.next
        prev_node.next = new_node

    def delete_node(self, key):
        current = self.head
        if current and current.data == key:
            self.head = current.next
            current = None
            return
        prev = None
        while current and current.data != key:
            prev = current
            current = current.next
        if current is None:
            return
        prev.next = current.next
        current = None

    def search(self, key):
        current = self.head
        while current:
            if current.data == key:
                return True
            current = current.next
        return False

    def print_list(self):
        current = self.head
        while current:
            print(current.data, end=" -> ")
            current = current.next
        print("None")

    def length(self):
        count = 0
        current = self.head
        while current:
            count += 1
            current = current.next
        return count

    def reverse(self):
        prev = None
        current = self.head
        while current:
            next_node = current.next
            current.next = prev
            prev = current
            current = next_node
        self.head = prev

    def get_middle(self):
        if not self.head:
            return None
        slow = fast = self.head
        while fast and fast.next:
            slow = slow.next
            fast = fast.next.next
        return slow.data

    def detect_cycle(self):
        if not self.head:
            return False
        slow = fast = self.head
        while fast and fast.next:
            slow = slow.next
            fast = fast.next.next
            if slow == fast:
                return True
        return False
```

## Doubly Linked List

```python
class DoublyNode:
    def __init__(self, data):
        self.data = data
        self.next = None
        self.prev = None

class DoublyLinkedList:
    def __init__(self):
        self.head = None

    def append(self, data):
        new_node = DoublyNode(data)
        if not self.head:
            self.head = new_node
            return
        current = self.head
        while current.next:
            current = current.next
        current.next = new_node
        new_node.prev = current

    def prepend(self, data):
        new_node = DoublyNode(data)
        new_node.next = self.head
        if self.head:
            self.head.prev = new_node
        self.head = new_node

    def insert_after(self, prev_node, data):
        if not prev_node:
            print("Previous node cannot be None")
            return
        new_node = DoublyNode(data)
        new_node.next = prev_node.next
        if prev_node.next:
            prev_node.next.prev = new_node
        prev_node.next = new_node
        new_node.prev = prev_node

    def delete_node(self, key):
        current = self.head
        while current:
            if current.data == key:
                if current.prev:
                    current.prev.next = current.next
                else:
                    self.head = current.next
                if current.next:
                    current.next.prev = current.prev
                return
            current = current.next

    def print_list(self):
        current = self.head
        while current:
            print(current.data, end=" <-> ")
            current = current.next
        print("None")

    def print_reverse(self):
        current = self.head
        if not current:
            return
        while current.next:
            current = current.next
        while current:
            print(current.data, end=" <-> ")
            current = current.prev
        print("None")
```

## Circular Linked List

```python
class CircularLinkedList:
    def __init__(self):
        self.head = None

    def append(self, data):
        new_node = Node(data)
        if not self.head:
            self.head = new_node
            new_node.next = self.head
            return
        current = self.head
        while current.next != self.head:
            current = current.next
        current.next = new_node
        new_node.next = self.head

    def prepend(self, data):
        new_node = Node(data)
        if not self.head:
            self.head = new_node
            new_node.next = self.head
            return
        new_node.next = self.head
        current = self.head
        while current.next != self.head:
            current = current.next
        current.next = new_node
        self.head = new_node

    def print_list(self):
        if not self.head:
            return
        current = self.head
        while True:
            print(current.data, end=" -> ")
            current = current.next
            if current == self.head:
                break
        print("(back to head)")
```

## Basic Operations Examples

```python
# Singly Linked List Examples
sll = SinglyLinkedList()

# Append elements
sll.append(1)
sll.append(2)
sll.append(3)
print("SLL after appending 1, 2, 3:")
sll.print_list()

# Prepend
sll.prepend(0)
print("After prepending 0:")
sll.print_list()

# Insert after
node = sll.head.next  # Node with 1
sll.insert_after(node, 1.5)
print("After inserting 1.5 after 1:")
sll.print_list()

# Search
print("Search for 2:", sll.search(2))
print("Search for 4:", sll.search(4))

# Length
print("Length:", sll.length())

# Get middle
print("Middle element:", sll.get_middle())

# Reverse
sll.reverse()
print("After reversing:")
sll.print_list()

# Delete
sll.delete_node(1.5)
print("After deleting 1.5:")
sll.print_list()

# Detect cycle (no cycle)
print("Has cycle:", sll.detect_cycle())

# Create cycle for testing
sll.head.next.next.next.next = sll.head.next  # 3 -> 1
print("After creating cycle, has cycle:", sll.detect_cycle())
# Reset for other examples
sll.head.next.next.next.next = None
print()

# Doubly Linked List Examples
dll = DoublyLinkedList()

dll.append(1)
dll.append(2)
dll.append(3)
print("DLL after appending 1, 2, 3:")
dll.print_list()

dll.prepend(0)
print("After prepending 0:")
dll.print_list()

node = dll.head.next  # Node with 1
dll.insert_after(node, 1.5)
print("After inserting 1.5 after 1:")
dll.print_list()

dll.delete_node(1.5)
print("After deleting 1.5:")
dll.print_list()

print("Reverse traversal:")
dll.print_reverse()
print()

# Circular Linked List Examples
cll = CircularLinkedList()

cll.append(1)
cll.append(2)
cll.append(3)
print("CLL after appending 1, 2, 3:")
cll.print_list()

cll.prepend(0)
print("After prepending 0:")
cll.print_list()
```

## Practical Examples

### Merge Two Sorted Linked Lists

```python
def merge_sorted_lists(l1, l2):
    dummy = Node(0)
    tail = dummy
    while l1 and l2:
        if l1.data < l2.data:
            tail.next = l1
            l1 = l1.next
        else:
            tail.next = l2
            l2 = l2.next
        tail = tail.next
    tail.next = l1 or l2
    return dummy.next

sll1 = SinglyLinkedList()
sll1.append(1)
sll1.append(3)
sll1.append(5)

sll2 = SinglyLinkedList()
sll2.append(2)
sll2.append(4)
sll2.append(6)

merged_head = merge_sorted_lists(sll1.head, sll2.head)
print("Merged sorted lists:")
current = merged_head
while current:
    print(current.data, end=" -> ")
    current = current.next
print("None")
```

### Remove Duplicates from Unsorted Linked List

```python
def remove_duplicates(head):
    if not head:
        return head
    seen = set()
    current = head
    seen.add(current.data)
    while current.next:
        if current.next.data in seen:
            current.next = current.next.next
        else:
            seen.add(current.next.data)
            current = current.next
    return head

sll_dup = SinglyLinkedList()
sll_dup.append(1)
sll_dup.append(2)
sll_dup.append(2)
sll_dup.append(3)
sll_dup.append(1)
print("List with duplicates:")
sll_dup.print_list()
remove_duplicates(sll_dup.head)
print("After removing duplicates:")
sll_dup.print_list()
```

### Find Nth Node from End

```python
def find_nth_from_end(head, n):
    if not head:
        return None
    fast = slow = head
    for _ in range(n):
        if not fast:
            return None
        fast = fast.next
    while fast:
        slow = slow.next
        fast = fast.next
    return slow.data

print("2nd from end:", find_nth_from_end(sll_dup.head, 2))
```

### Palindrome Check

```python
def is_palindrome(head):
    if not head or not head.next:
        return True
    # Find middle
    slow = fast = head
    while fast.next and fast.next.next:
        slow = slow.next
        fast = fast.next.next
    # Reverse second half
    prev = None
    current = slow.next
    while current:
        next_node = current.next
        current.next = prev
        prev = current
        current = next_node
    slow.next = prev
    # Compare
    first = head
    second = slow.next
    while second:
        if first.data != second.data:
            return False
        first = first.next
        second = second.next
    return True

sll_pal = SinglyLinkedList()
sll_pal.append(1)
sll_pal.append(2)
sll_pal.append(2)
sll_pal.append(1)
print("Is palindrome:", is_palindrome(sll_pal.head))
```

## Time Complexity

- **Access**: O(n)
- **Search**: O(n)
- **Insert at beginning**: O(1)
- **Insert at end**: O(n) for singly, O(1) with tail pointer
- **Delete**: O(n)
- **Reverse**: O(n)

## Advantages

- Dynamic size
- Easy insertion/deletion
- No memory waste (unlike arrays)

## Disadvantages

- No random access
- Extra memory for pointers
- Not cache-friendly

## Applications

- Implementation of stacks and queues
- Music playlist
- Browser history
- Hash tables (separate chaining)
- Memory management
- Polynomial representation
