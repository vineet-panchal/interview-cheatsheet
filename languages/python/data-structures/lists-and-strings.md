# Lists and Strings in Python

## Lists

### Introduction

**Lists** in Python are ordered, mutable sequences that can contain elements of different types. They are implemented as dynamic arrays.

### Basic Operations

```python
arr = [1, 2, 3] # initialize the list
print("The List: ", arr)

print("At Index 0: ", arr[0]) # accessing a list

arr.append(4) # appending to a list
arr.append(5)
print("Append Element 4 and 5: ", arr)

arr.pop() # popping from a list
print("Popping the List: ", arr)

arr.insert(1, 7) # inserting an element at a index
print("Inserting 7 at Index 1: ", arr, "\n")
```

### Initializing Lists with Size

```python
print("Initializing Lists With Size")
n = 5
arr2 = [0] * n # initialize list with size
print("List 2 with initial size as 5: ", arr2)

arr3 = [None] * n # intialize list with all None values
print("List 3 with all elements initialized to None: ", arr3, "\n")
```

### Sublists

```python
print("Sublists")
print("Original List: ", arr)
print("Sublist of list 1 from index 1 to 3: ", arr[1:3]) # sublist of a list
print("Sublist of list 1 from index 0 to 5, skipped by 2: ", arr[0:5:2], "\n")
```

### Unpacking

```python
print("Unpacking")
arr4 = [1, 2, 3, 4, 5]
a, b, c, d, e = arr4 # unpacking a list
print("Original List: ", arr4)
print("Unpacked Elements: ", a, b, c, d, e, "\n")
```

### Head and Tail

```python
print("Head and Tail")
print("Original List: ", arr4)
print("Getting the Head: ", arr4[0]) # head is first element
print("Getting the Tail: ", arr4[1:]) # tail is index 1 and forward
print("Original List: ", arr4)
head, *tail = arr4
print("Another way to get Head: ", head)
print("Another way of getting Tail: ", tail, "\n")
```

### More List Methods

```python
print("More List Methods")
print("List 1: ", arr)
print("List 2: ", arr2)
print("List 3: ", arr3)
print("List 4: ", arr4)
arr5 = [1, 2, 3, 2, 2]
print("List 5: ", arr5)
arr6 = ['a', 'b', 'c', 'd', 'b', 'e']
print("List 6: ", arr6)
arr.clear() # clearing a list
print("List 1 cleared: ", arr)
print("Length of List 2: ", len(arr2)) # get the length of a list
print("List 2 and 3 merged: ", arr2 + arr3) # merging two lists
print("Count # of 2s in List 5: ", arr5.count(2)) # counting # of occurences of a element in a list
arr5.extend([4, 5]) # extending a list, use another list as the extension
print("Extending a list 5 with [4, 5]: ", arr5)
print("Get the index of b in list 6: ", arr6.index('b')) # getting the index of an element
arr6.remove('b') # remove elements in a list
print("Remove element b from list 6: ", arr6) # remove element b
arr5.reverse()
print("Reverse List 5: ", arr5, "\n") # reversing a list
```

### Sorting Lists

```python
print("Sorting Lists")
print("List 5: ", arr5)
arr7 = ["bob", "alice", "jane", "doe"]
print("List 7: ", arr7)
arr5.sort() # sorting a list
print("Sorting List 5: ", arr5)
arr5.sort(reverse=True)
print("Sort and reverse list 5: ", arr5)
arr7.sort() # sort alphabetically too
print("Sort list 7: ", arr7)
arr7.sort(key=lambda x: len(x)) # sort using a function
# sort by comparing the length of each element
print("Sort list 7 by length of each list: ", arr7, "\n")
```

### Looping Through Lists

```python
print("Looping Through Lists")
nums = [1, 2, 3]
print("Nums List: ", nums)
print("Loop using the index: ")
for i in range(len(nums)): # loop from 0 to the last element of the list
    print(nums[i]) # use the index to grab the element

print("Loop using the elements: ")
for i in nums: # initialize i as a element in nums
    print(i) # print the element

print("Loop through the list using the index and the elements: ")
for i, n in enumerate(nums): # use enumerate to assign two variables, 1 to index, 1 to elements
    print(i, n)

nums2 = [4, 5, 6]
print("Nums List 2: ", nums2)

print("Loop through both Lists at the same time: ")
for i, j in zip(nums, nums2): # use zip to bind the two lists
    print(i, j)

print("\n")
```

### List Comprehension

```python
print("List Comprehension")
lst = [i for i in range(5)] # intialize a list using a range of values
print("Initialize list using a loop: ", lst)
lst2 = [i + i for i in range(5)]
print("Initialize list by adding values to itself in a list: ", lst2)
lst3 = [[0] * 3 for i in range(3)]
print("Initialize a 2D list: ", lst3)

print("\n")
```

## Strings

### Introduction

**Strings** in Python are immutable sequences of characters. They support various operations for manipulation and searching.

### Basic Operations

```python
print("String Methods")
s = "Hello, World"  # initialize the string
print("The String: ", s)

print("At Index 0: ", s[0])  # accessing a character in a string

s2 = s + "!"  # concatenating strings (like appending)
print("Concatenating '!' to the string: ", s2)

s3 = s[:-1]  # removing last character (like popping)
print("Removing last character: ", s3)

s4 = s[:6] + "Universe" + s[6:]  # inserting into a string
print("Inserting 'Universe' into the string: ", s4, "\n")
```

### Initializing Strings with Size

```python
print("Initializing Strings With Size")
n = 5
s5 = " " * n  # initialize string with spaces
print("String 5 with initial size as 5 (spaces): ", repr(s5))

s6 = "a" * n  # initialize string with repeated characters
print("String 6 with 'a' repeated 5 times: ", s6, "\n")
```

### Substrings

```python
print("Substrings")
print("Original String: ", s)
print("Substring from index 0 to 5: ", s[0:5])  # substring
print("Substring from index 7 to end: ", s[7:])
print("Substring with step (every other char): ", s[::2], "\n")
```

### Unpacking

```python
print("Unpacking")
s7 = "abcde"
a, b, c, d, e = s7  # unpacking a string
print("Original String: ", s7)
print("Unpacked Characters: ", a, b, c, d, e, "\n")
```

### Head and Tail

```python
print("Head and Tail")
print("Original String: ", s7)
print("Getting the Head: ", s7[0])  # head is first character
print("Getting the Tail: ", s7[1:])  # tail is index 1 and forward
head, *tail = s7
print("Another way to get Head: ", head)
print("Another way of getting Tail: ", ''.join(tail), "\n")
```

### More String Methods

```python
print("More String Methods")
print("String 1: ", s)
print("String 2: ", s5)
print("String 3: ", s6)
print("String 4: ", s7)
s8 = "hello world hello"
print("String 8: ", s8)
s9 = "a,b,c,d,e"
print("String 9: ", s9)
print("Length of String 1: ", len(s))  # get the length of a string
print("String 1 in uppercase: ", s.upper())  # convert to uppercase
print("String 1 in lowercase: ", s.lower())  # convert to lowercase
print("Count # of 'l's in String 1: ", s.count('l'))  # counting # of occurrences
print("Find index of 'o' in String 1: ", s.find('o'))  # finding index
print("Replace 'World' with 'Universe' in String 1: ", s.replace('World', 'Universe'))  # replace
print("Split String 9 by ',': ", s9.split(','))  # split into list
print("Join list back with '-': ", '-'.join(s9.split(',')))  # join
s10 = "  hello world  "
print("String 10: ", repr(s10))
print("Strip String 10: ", repr(s10.strip()))  # strip whitespace
print("String 8 starts with 'hello': ", s8.startswith('hello'))  # check start
print("String 8 ends with 'world': ", s8.endswith('world'))  # check end
print("Is String 6 all lowercase: ", s6.islower())  # check case
print("Is String 6 all alphabetic: ", s6.isalpha(), "\n")  # check alphabetic
```

### Looping Through Strings

```python
print("Looping Through Strings")
print("String: ", s)
print("Loop using the index: ")
for i in range(len(s)):  # loop from 0 to the last character
    print(s[i])  # use the index to grab the character

print("Loop using the characters: ")
for char in s:  # initialize char as a character in s
    print(char)  # print the character

print("Loop through the string using the index and the characters: ")
for i, char in enumerate(s):  # use enumerate to assign two variables
    print(i, char)

s11 = "abc"
s12 = "def"
print("String 11: ", s11)
print("String 12: ", s12)

print("Loop through both strings at the same time: ")
for c1, c2 in zip(s11, s12):  # use zip to bind the two strings
    print(c1, c2)  # the strings have to be the same length

print("\n")
```

### String Formatting

```python
print("String Formatting")
name = "Alice"
age = 30
formatted = f"Hello, my name is {name} and I am {age} years old."  # f-string
print("Formatted String: ", formatted)
formatted2 = "Hello, my name is {} and I am {} years old.".format(name, age)  # format method
print("Formatted String 2: ", formatted2)

print("\n")
```

## Output

```bash
The List:  [1, 2, 3]
At Index 0:  1
Append Element 4 and 5:  [1, 2, 3, 4, 5]
Popping the List:  [1, 2, 3, 4]
Inserting 7 at Index 1:  [1, 7, 2, 3, 4]

Initializing Lists With Size
List 2 with initial size as 5:  [0, 0, 0, 0, 0]
List 3 with all elements initialized to None:  [None, None, None, None, None]

Sublists
Original List:  [1, 7, 2, 3, 4]
Sublist of list 1 from index 1 to 3:  [7, 2]
Sublist of list 1 from index 0 to 5, skipped by 2:  [1, 2, 4]

Unpacking
Original List:  [1, 2, 3, 4, 5]
Unpacked Elements:  1 2 3 4 5

Head and Tail
Original List:  [1, 2, 3, 4, 5]
Getting the Head:  1
Getting the Tail:  [2, 3, 4, 5]
Original List:  [1, 2, 3, 4, 5]
Another way to get Head:  1
Another way of getting Tail:  [2, 3, 4, 5]

More List Methods
List 1:  [1, 7, 2, 3, 4]
List 2:  [0, 0, 0, 0, 0]
List 3:  [None, None, None, None, None]
List 4:  [1, 2, 3, 4, 5]
List 5:  [1, 2, 3, 2, 2]
List 6:  ['a', 'b', 'c', 'd', 'b', 'e']
List 1 cleared:  []
Length of List 2:  5
List 2 and 3 merged:  [0, 0, 0, 0, 0, None, None, None, None, None]
Count # of 2s in List 5:  3
Extending a list 5 with [4, 5]:  [1, 2, 3, 2, 2, 4, 5]
Get the index of b in list 6:  1
Remove element b from list 6:  ['a', 'c', 'd', 'b', 'e']
Reverse List 5:  [5, 4, 2, 2, 3, 1]

Sorting Lists
List 5:  [5, 4, 2, 2, 3, 1]
List 7:  ["bob", "alice", "jane", "doe"]
Sorting List 5:  [1, 2, 2, 3, 4, 5]
Sort and reverse list 5:  [5, 4, 3, 2, 2, 1]
Sort list 7:  ['alice', 'bob', 'doe', 'jane']
Sort list 7 by length of each list:  ['bob', 'doe', 'jane', 'alice']


List Comprehension
Initialize list using a loop:  [0, 1, 2, 3, 4]
Initialize list by adding values to itself in a list:  [0, 2, 4, 6, 8]
Initialize a 2D list:  [[0, 0, 0], [0, 0, 0], [0, 0, 0]]


String Methods
The String:  Hello, World
At Index 0:  H
Concatenating '!' to the string:  Hello, World!
Removing last character:  Hello, Worl
Inserting 'Universe' into the string:  Hello, Universe

Initializing Strings With Size
String 5 with initial size as 5 (spaces):  '     '
String 6 with 'a' repeated 5 times:  aaaaa

Substrings
Original String:  Hello, World
Substring from index 0 to 5:  Hello
Substring from index 7 to end:  orld
Substring with step (every other char):  Hlo ol

Unpacking
Original String:  abcde
Unpacked Characters:  a b c d e

Head and Tail
Original String:  abcde
Getting the Head:  a
Getting the Tail:  bcde
Another way to get Head:  a
Another way of getting Tail:  bcde

More String Methods
String 1:  Hello, World
String 2:       
String 3:  aaaaa
String 4:  abcde
String 8:  hello world hello
String 9:  a,b,c,d,e
Length of String 1:  12
String 1 in uppercase:  HELLO, WORLD
String 1 in lowercase:  hello, world
Count # of 'l's in String 1:  3
Find index of 'o' in String 1:  4
Replace 'World' with 'Universe' in String 1:  Hello, Universe
Split String 9 by ',':  ['a', 'b', 'c', 'd', 'e']
Join list back with '-':  a-b-c-d-e
String 10:  '  hello world  '
Strip String 10:  'hello world'
String 8 starts with 'hello':  True
String 8 ends with 'world':  False
Is String 6 all lowercase:  True
Is String 6 all alphabetic:  True

Looping Through Strings
String:  Hello, World
Loop using the index: 
H
e
l
l
o
,
 
W
o
r
l
d
Loop using the characters: 
H
e
l
l
o
,
 
W
o
r
l
d
Loop through the string using the index and the characters: 
0 H
1 e
2 l
3 l
4 o
5 ,
6  
7 W
8 o
9 r
10 l
11 d
String 11:  abc
String 12:  def
Loop through both strings at the same time: 
a d
b e
c f


String Formatting
Formatted String:  Hello, my name is Alice and I am 30 years old.
Formatted String 2:  Hello, my name is Alice and I am 30 years old.
```

## Time Complexity

### Lists

- **Access**: O(1)
- **Append**: O(1) amortized
- **Insert**: O(n)
- **Delete**: O(n)
- **Search**: O(n)

### Strings

- **Access**: O(1)
- **Concatenation**: O(n + m)
- **Search**: O(n)
- **Replace**: O(n)

## Applications

### Lists

- Dynamic arrays
- Stacks and queues
- Adjacency lists for graphs
- Database result sets

### Strings

- Text processing
- File I/O
- Regular expressions
- String matching algorithms

## Best Practices

- Use list comprehensions for concise list creation
- Use `join()` for efficient string concatenation
- Use `str.format()` or f-strings for string formatting
- Consider `collections.deque` for efficient appends/pops from both ends
- Use `''.join()` instead of `+` for building strings in loops
