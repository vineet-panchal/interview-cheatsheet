# Python Cheatsheet - Syntax

### Variables
###### - variables are dynamically typed
```
n = 0
print('n = ', n)
n = "abc"
print('n = ', n)

/> main.py
n = 0
n = abc
```
###### - multiple assignments
```
n, m = 0, "abc"
n, m, z = 0.125, "abc", False

# increment
n = n + 1
n += 1
```
###### - None is null, the absence of values
```
n = 4
n = None
print('n = ', n)

/> main.py
n = None
```

### Conditional Statements
##### if statements
###### - don't need parentheses or curly braces
```
n = 1
if n > 2:
  n -= 1
elif n == 2:
  n *= 2
else:
  n += 2
```
###### Conditions: && - and, || - or
```
n, m = 1, 2
if ((n > 2 and n != m) or n == m):
  n += 1
```
##### while loops
```
n = 0
while n < 3:
  print(n)
  n += 1

/> main.py
1
2
3
```
##### for loops
```
# looping from i = 0 to i = 2
for i in range(3):
  print(i)

/> main.py
1 
2 
3

# looping from i = 2 to i = 4
for i in range(2, 5):
  print(i)

/> main.py
2
3
4

# looping from i = 4 to i = 2. skip counting
for i in range(4, 1, -1):
  print(i)

/> main.py
4
3
2

# looping through all even numbers until 8
for i in range(0, 9, 2):
  print(i)

/> main.py
0
2
4
6
8
```

### Math
```
print(5 / 2) ==> 2.5 # division is decimal by default
print(5 // 2) ==> 2 # double slash divides and rounds down

# by default negative numbers will round down
print(-3 // 2) ==> -2 
# to round towards 0, divide then convert to int
print(int(-3 / 2)) ==> -1

print(10 % 3) ==> 1
print(-10 % 3) ==> 2

import math
print(math.fmod(-10, 3)) ==> -1.0
print(math.floor(3 / 2)) ==> 1
print(math.ceil(3 / 2)) ==> 2
print(math.sqrt(25)) ==> 5
print(math.pow(2, 3)) ==> 8

float("inf") # max int, infinity
float("-inf") # min int, negative infinity
float("nan") # not a number

# python numbers are infinite, so they never overflow
print(math.pow(2, 200)) ==> 1.6069380442589903e+60
print(math.pow(2, 200) < float("inf")) ==> True
```

### Arrays
###### - called lists in python, they are dynamic
```
arr = [1, 2, 3]
print(arr) ==> [1, 2, 3]
print(arr[0]) ==> 1


# arrays used as a stack
arr.append(4)
arr.append(5)
print(arr) ==> [1, 2, 3, 4, 5]

arr.pop()
print(arr) ==> [1, 2, 3, 4]

arr.insert(1, 7)
print(arr) ==> [1, 7, 3, 4]


# initialize array with size
n = 5
arr = [0] * n
print(arr) ==> [0, 0, 0, 0, 0]
print(len(arr))

arr = [None] * n # best practice to use None as initial values
print(arr) ==> [None, None, None, None, None]


# sublists
# arr = [1, 2, 3, 4]
print(arr[1:3]) ==> [2, 3]


# unpacking
a, b, c = [1, 2, 3] # number of variables has to match array size
print(a, b, c) ==> 1 2 3


# looping through arrays
nums = [1, 2, 3]
for i in range(len(nums)):
  print(nums[i])

/> main.py
1 
2
3

for n in nums:
  print(n)

/> main.py
1
2
3

for i, n in enumerate(nums):
  print(i, n)

/> main.py
0 1
1 2
2 3

nums1 = [1, 2, 3]
nums2 = [4, 5, 6]
for i, j in zip(nums1, nums2):
  print(i, j)

/> main.py
1 4
2 5
3 6


# reversing arrays
arr = [1, 2, 3, 4, 5]
arr.reverse()
print(arr) ==> [5, 4, 3, 2, 1]


# sorting
arr = [5, 1, 3, 4, 2]
arr.sort()
print(arr) ==> [1, 2, 3, 4, 5]
arr.sort(reverse=True)
print(arr) ==> [5, 4, 3, 2, 1]

arr = ["bob", "alice", "jane", "doe"]
arr.sort() # sorts alphabetically
print(arr) ==> ["alice", "bob", "doe", "jane"]

arr.sort(key=lambda x: len(x))
print(arr) ==> ["bob", "doe", "jane", "alice"]


# list comprehension
arr = [i for i in range(5)]
print(arr) ==> [0, 1, 2, 3, 4]

arr = [i + i for i in range(5)]
print(arr) ==> [0, 2, 4, 6, 8]

arr = [[0] * 3 for i in range(3)]
print(arr) ==> [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
```

### Strings
###### - similar to arrays, they are immutable
```
s = "abc"
print(s[0:2]) ==> ab
print(s[1:]) ==> bc


# adding strings
s += "def"
print(s) ==> "abcdef"

print(int("123") + int("123")) ==> 246
print(str(123) + str(123)) ==> 123123


# getting ASCII values
print(ord("a")) ==> 97
print(chr(97)) ==> "a"


# joining strings using delimitors
strings = ["ab", "cd", "ef"]
print(",".join(strings)) ==> ab,cd,ef
```

### Collections
##### Queues (double-ended queue)
```
from collections import deque
q = deque([1, 2, 3])
print(q) ==> deque([1, 2, 3])
q.append(4)
print(q) ==> deque([1, 2, 3, 4])

q.appendleft(0)
print(q) ==> deque([0, 1, 2, 3, 4])

q.pop()
print(q) ==> deque([0, 1, 2, 3])

q.popleft()
print(q) ==> deque([1, 2, 3])
```

### HashSets
```
mySet = set()
mySet.add(1)
mySet.add(2)
print(mySet) ==> {1, 2}
print(len(mySet)) ==> 2

print(1 in mySet) ==> True
print(2 in mySet) ==> True
print(3 in mySet) ==> False

mySet.remove(2)
print(2 in mySet) ==> False 

# lists to sets
print(set([1, 2, 3, 2])) ==> {1, 2, 3}

# set comprehension
mySet = {x for x in [1, 2, 3, 2]}
print(mySet) ==> {1, 2, 3}
```

### HashMaps (Dictionary)
```
myMap = {}
myMap["alice"] = 88
myMap["bob"] = 77
print(myMap) ==> {'alice': 88, 'bob': 77}
print(myMap["alice"]) ==> 88
print(myMap.get("alice")) ==> 88
print(myMap.get("charlie")) ==> None
print(len(myMap)) ==> 2

myMap["alice"] = 80
print(myMap["alice"]) ==> 80

print("alice" in myMap) ==> True
myMap.pop("alice")
print(myMap) ==> {'bob': 77}

myMap = {"alice": 90, "bob": 70}
print(myMap) ==> {'alice': 90, 'bob': 70}


# dict comprehension
myMap = { i: 2*i for i in range(3) }
print(myMap) ==> {0: 0, 1: 2, 2: 4}


# looping through maps
myMap = {"alice": 90, "bob": 80}
for key in myMap:
  print(key)

/> main.py
alice
bob

for val in myMap.values():
  print(val)

/> main.py
90
80

for key, val in myMap.items():
  print(f"{key}: {val}")

/> main.py
alice: 90
bob: 80
```

### Tuples
###### - tuples are similar to arrays, but immutable
```
tup = (1, 2, 3)
print(tup) ==> (1, 2, 3)
print(len(tup)) ==> 3
print(tup[0]) ==> 1
print(tup[1:3]) ==> (2, 3)
print(tup + (4, 5)) ==> (1, 2, 3, 4, 5)

tup[0] = 10  # raises a TypeError, cannot modify

# can be used as keys for hash map/set
myMap = { (1, 2): 3 }
print(myMap) ==> {(1, 2): 3}
print(myMap[(1, 2)]) ==> 3

mySet = set()
mySet.add((1, 2))
print((1, 2) in mySet)

# lists cannot be keys
myMap = { [1, 2]: 3 }  # raises a TypeError
```

### Heaps
```
import heapq
minHeap = []
heapq.heappush(minHeap, 3)
heapq.heappush(minHeap, 2)
heapq.heappush(minHeap, 4)

# min is always index 0
print(minHeap[0]) ==> 2

while len(minHeap):
  print(heapq.heappop(minHeap))

/> main.py
2
3
4


# no max heaps by default
# use min heap and multiply by -1 whenever you are pushing or popping
maxHeap = []
heapq.heappush(maxHeap, -3)
heapq.heappush(maxHeap, -2)
heapq.heappush(maxHeap, -4)

# max is always index 0
print(-1 * maxHeap[0])

while len(maxHeap):
  print(-1 * heapq.heappop(maxHeap))

/> main.py
4
3
2


# building heaps from inital values
arr = [2, 1, 8, 4, 5]
heapq.heapify(arr)
while arr:
  print(heapq.heappop(arr))
```

### Functions
```
def myFunc(n, m):
  return n * m
print(myFunc(3, 4))


# nested functions have access to outer variables
def outer(a, b):
  c = "c"

  def inner():
    return a + b + c
  return inner()

print(outer("a", "b")) ==> abc


# can modify objects but not reassign unless using nonlocal keyword
def double(arr, val):
  def helper():
    # can modify the array
    for i, n in enumerate(arr):
      arr[i] *= 2
    
    # will only modify val in the helper scope
    # val *= 2

    # this will modify val outside helper scope
    nonlocal val
    val *= 2
  helper()
  print(arr, val)

double([1, 2], 3) ==> [2, 4] 6
```

### Classes
```
class Person:
def __init__(self, name, age):
  self.name = name  
  self.age = age

def getAge():
  return self.age

def setAge(a):
  self.age = a

def getName():
  return self.name

def setName(a):
  self.name = a

def greet(self):
  print(f"Hello, my name is {self.name} and I am {self.age} years.")
```