# Python Cheatsheet - Data Structures and Algorithms

### Linear Search ==> O(n)
###### - searches over all the elements in a list starting with the first
```
def linear-search(n, lst):
  for i in range(len(lst)):
    if lst[i] == n:
      return i

linear-search(1, [5, 4, 3, 2, 1]) ==> 4
```

### Binary Search ==> O(log n)
###### - given a sorted array, repeatedly divide the array in 2
###### - discard the half without the element each iteration
```
# iterative method
def binarySearchI(arr, x):
  low = 0
  high = len(arr) - 1
  mid = 0

  while low <= high:
    mid = (high + low) // 2

    # if x > mid, ignore left half
    if arr[mid] < x:
      low = mid + 1
    
    # if x < mid, ignore right half
    elif arr[mid] > x:
      high = mid - 1
    
    # x is present at the middle
    else: 
      return mid
  
  return -1  # elem not present in the arr
```

```
# recursive method
def binarySearchR(arr, low, high, x):
  if high >= low:
    mid = (high + low) // 2
    
    if arr[mid] == x:  # if elem is present at the middle itself
      return mid
    
    # if elem < mid, then it can only be present in left subarray
    elif arr[mid] > x:
      return binarySearch(arr, low, mid - 1, x)
    
    # else the elem can only be present in right subarray
    else:
      return binarySearch(arr, mid + 1, high, x)
  else:
    return -1

arr = [2, 3, 4, 10, 40]
x = 10
binarySearch(arr, 0, len(arr) - 1, x) ==> 3
```

```
# tail recursive method
def binarySearchTR()
  """
  Perform a binary search on a sorted list (vec) to find the index of val.
  If found, return the index; otherwise, return None.
  """
  
  length = len(vec)
  if length == 0:
    return None  # Base case: empty list, return None
  if length == 1:
    return pos if vec[0] == val else None  
    # If only one element, check if it's the target

  midpt = length // 2  # Compute the midpoint index
  midel = vec[midpt]   # Get the middle element

  if val < midel:
    return binarySearch(val, vec[:midpt], pos)  
    # Search in the left half
  elif val > midel:
    return binarySearch(val, vec[midpt + 1:], pos + midpt + 1) 
    # Search in the right half
  else:
    return pos + midpt  # Element found, return index

binarySearch(2, [1, 2, 3, 4, 5]) ==> 1
```

### Selection Sort ==> O(n^2)
###### - look through the entire list for the smallest elem and swap it with the first elem. Move onto the next
###### - it moves left to right as it builds the sorted prefix to the left of the curr elem
###### - in one pass, it finds the smallest or largest elem to the right of the curr elem and then swaps them
```
def selectionSort(vec, comp):
  length = len(vec)    
  for cur in range(length - 1): 
  # Iterate over all elements except the last one
    best_idx = cur 
    # Assume current index is the best (smallest or largest depending on 'comp')

    for j in range(cur + 1, length):  
    # Iterate over the unsorted part of the list
      if comp(vec[j], vec[best_idx]): 
      # Use comparison function to find the best element
        best_idx = j  # Update best index

    vec[cur], vec[best_idx] = vec[best_idx], vec[cur]  
    # Swap the best element with the current element

  return vec  # Return sorted list

vec = [64, 25, 12, 22, 11]
ascending = selection_sort(vec[:], lambda x, y: x < y)  # Sort in ascending order
descending = selection_sort(vec[:], lambda x, y: x > y)  # Sort in descending order
print(ascending)  # Output: [11, 12, 22, 25, 64]
print(descending)  # Output: [64, 25, 22, 12, 11]
```

### Insertion Sort ==> O(n^2)
###### - if the next elem is less than curr elem, repeatedly swap it to the left until it is in the curr pos
###### - if your next elem is greater than your curr elem, continue moving to the right to check the next elem
```
def insertionSort(vec, comp):
  length = len(vec)

  for i in range(1, length):  # Outer loop from index 1 to end of list
    j = i
    while j > 0 and comp(vec[j], vec[j - 1]):  
    # Compare with previous elements
      vec[j], vec[j - 1] = vec[j - 1], vec[j]  # Swap if needed
      j -= 1  # Move backward to continue comparisons
  return vec  # Return the sorted list

vec = [7, 8, 2, 1, 3, 4]
ascending = insertionSort(vec[:], lambda x, y: x < y)  # Sort in ascending order
descending = insertionSort(vec[:], lambda x, y: x > y)  # Sort in descending order

print(ascending)  # Output: [1, 2, 3, 4, 7, 8]
print(descending)  # Output: [8, 7, 4, 3, 2, 1]
```

### Bubble Sort ==> O(n^2)
###### - iterate through elems, swapping with the neighbour if two elems are out of order.
###### - puts the largest elems to the end of the list with each iteration
```
def bubbleSort(vec, comp):
  length = len(vec)

  for i in range(length - 1):  # Outer loop for passes
    swapped = False  # Track if any swaps happen
    for j in range(length - 1 - i):  
    # Inner loop to compare adjacent elements
      if not comp(vec[j], vec[j + 1]):  # Swap if out of order
        vec[j], vec[j + 1] = vec[j + 1], vec[j]
        swapped = True

      if not swapped:  # If no swaps were made, the list is already sorted
        break

  return vec  # Return sorted list

vec = [7, 8, 2, 1, 3, 4]
ascending = bubbleSort(vec[:], lambda x, y: x < y)  # Sort in ascending order
descending = bubbleSort(vec[:], lambda x, y: x > y)  # Sort in descending order

print(ascending)  # Output: [1, 2, 3, 4, 7, 8]
print(descending)  # Output: [8, 7, 4, 3, 2, 1]
```

### Merge Sort ==> O(n log n)
###### - divide the array into two halves, recursively sort them, and merge them
###### - iterate through the new sorted arrays, take the lowest value and insert it to the resulting array
```
def mergeSortedLists(list1, list2, comp):
  merged = []
  i, j = 0, 0

  while i < len(list1) and j < len(list2):
    if comp(list1[i], list2[j]):  # Compare elements using comp function
      merged.append(list1[i])
      i += 1
    else:
      merged.append(list2[j])
      j += 1

  # Append remaining elements (if any)
  merged.extend(list1[i:])
  merged.extend(list2[j:])

  return merged

def mergeSort(lst, comp):
  if len(lst) <= 1:
    return lst  # Base case: already sorted if list has 0 or 1 element

  mid = len(lst) // 2  # Find the middle index
  left = merge_sort(lst[:mid], comp)  # Recursively sort left half
  right = merge_sort(lst[mid:], comp)  # Recursively sort right half

  return merge_sorted_lists(left, right, comp)  # Merge sorted halves

vec = [7, 8, 2, 1, 3, 4]
ascending = merge_sort(vec[:], lambda x, y: x < y)  # Sort in ascending order
descending = merge_sort(vec[:], lambda x, y: x > y)  # Sort in descending order

print(ascending)  # Output: [1, 2, 3, 4, 7, 8]
print(descending)  # Output: [8, 7, 4, 3, 2, 1]
```

### Quick Sort ==> O(n log n)
###### - pick an elem to be the "pivot". Usually pivot should be the last elem
###### - everything to the left of the pivot will be less than the pivot
###### - everything to the right of the pivot will be greater than the pivot
```
def quickSort(vec, comp):
  if len(vec) <= 1:
    return vec  # Base case: already sorted if 0 or 1 element
    
  pivot = vec[-1]  # Choose the last element as the pivot
  left = [x for x in vec[:-1] if comp(x, pivot)]  # Elements less than pivot
  right = [x for x in vec[:-1] if not comp(x, pivot)]  # Elements greater than or equal to pivot

  return quicksort(left, comp) + [pivot] + quicksort(right, comp)  
  # recursively sort and combine

vec = [7, 8, 2, 1, 3, 4]
ascending = quicksort(vec[:], lambda x, y: x < y)  # Sort in ascending order
descending = quicksort(vec[:], lambda x, y: x > y)  # Sort in descending order

print(ascending)  # Output: [1, 2, 3, 4, 7, 8]
print(descending)  # Output: [8, 7, 4, 3, 2, 1]
```

### Linked Lists
###### - to use linked lists you will have to use classes
```
# Create a Node class to create a node
class Node:
    def __init__(self, data):
        self.data = data
        self.next = None

# Create a LinkedList class
class LinkedList:
    def __init__(self):
        self.head = None

    # Method to add a node at the beginning of the LL
    def insertAtBegin(self, data):
        new_node = Node(data)
        new_node.next = self.head
        self.head = new_node

    # Method to add a node at any index
    # Indexing starts from 0.
    def insertAtIndex(self, data, index):
        if index == 0:
            self.insertAtBegin(data)
            return

        position = 0
        current_node = self.head
        while current_node is not None and position + 1 != index:
            position += 1
            current_node = current_node.next

        if current_node is not None:
            new_node = Node(data)
            new_node.next = current_node.next
            current_node.next = new_node
        else:
            print("Index not present")

    # Method to add a node at the end of LL
    def insertAtEnd(self, data):
        new_node = Node(data)
        if self.head is None:
            self.head = new_node
            return

        current_node = self.head
        while current_node.next:
            current_node = current_node.next

        current_node.next = new_node

    # Update node at a given position
    def updateNode(self, val, index):
        current_node = self.head
        position = 0
        while current_node is not None and position != index:
            position += 1
            current_node = current_node.next

        if current_node is not None:
            current_node.data = val
        else:
            print("Index not present")

    # Method to remove first node of linked list
    def remove_first_node(self):
        if self.head is None:
            return

        self.head = self.head.next

    # Method to remove last node of linked list
    def remove_last_node(self):
        if self.head is None:
            return

        # If there's only one node
        if self.head.next is None:
            self.head = None
            return

        # Traverse to the second last node
        current_node = self.head
        while current_node.next and current_node.next.next:
            current_node = current_node.next

        current_node.next = None

    # Method to remove a node at a given index
    def remove_at_index(self, index):
        if self.head is None:
            return

        if index == 0:
            self.remove_first_node()
            return

        current_node = self.head
        position = 0
        while current_node is not None and current_node.next is not None and position + 1 != index:
            position += 1
            current_node = current_node.next

        if current_node is not None and current_node.next is not None:
            current_node.next = current_node.next.next
        else:
            print("Index not present")

    # Method to remove a node from the linked list by its data
    def remove_node(self, data):
        current_node = self.head

        # If the node to be removed is the head node
        if current_node is not None and current_node.data == data:
            self.remove_first_node()
            return

        # Traverse and find the node with the matching data
        while current_node is not None and current_node.next is not None:
            if current_node.next.data == data:
                current_node.next = current_node.next.next
                return
            current_node = current_node.next

        # If the data was not found
        print("Node with the given data not found")

    # Print the size of the linked list
    def sizeOfLL(self):
        size = 0
        current_node = self.head
        while current_node:
            size += 1
            current_node = current_node.next
        return size

    # Print the linked list
    def printLL(self):
        current_node = self.head
        while current_node:
            print(current_node.data)
            current_node = current_node.next


# create a new linked list
llist = LinkedList()

# add nodes to the linked list
llist.insertAtEnd('a')
llist.insertAtEnd('b')
llist.insertAtBegin('c')
llist.insertAtEnd('d')
llist.insertAtIndex('g', 2)

# print the linked list
print("Node Data:")
llist.printLL()

# remove nodes from the linked list
print("\nRemove First Node:")
llist.remove_first_node()
llist.printLL()

print("\nRemove Last Node:")
llist.remove_last_node()
llist.printLL()

print("\nRemove Node at Index 1:")
llist.remove_at_index(1)
llist.printLL()

# print the linked list after all removals
print("\nLinked list after removing a node:")
llist.printLL()

print("\nUpdate node Value at Index 0:")
llist.updateNode('z', 0)
llist.printLL()

print("\nSize of linked list:", llist.sizeOfLL())

```

### Stacks
###### PUSH - push to the stack, add an object on top of the stack
###### POP - pop from the stack, remove the top object from the stack

##### Stacks using Linked Lists
###### PUSH - when pushing to the stack, create a new node and insert it at the beginning of the existing stack
###### POP - when popping, make the Linked List reference point to whatever the first node was pointing to and remove the first node

##### Stacks using Arrays
###### PUSH - when pushing to the stack, insert elem at the stack insert, then increment the index
###### POP - when popping, decrement the index and return the value at the index

### Queues 