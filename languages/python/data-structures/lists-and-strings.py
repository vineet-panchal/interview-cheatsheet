def lists():
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
  
  print("Initializing Lists With Size")
  n = 5
  arr2 = [0] * n # initialize list with size
  print("List 2 with initial size as 5: ", arr2)
  
  arr3 = [None] * n # intialize list with all None values
  print("List 3 with all elements initialized to None: ", arr3, "\n")
  
  print("Sublists")
  print("Original List: ", arr)
  print("Sublist of list 1 from index 1 to 3: ", arr[1:3]) # sublist of a list
  print("Sublist of list 1 from index 0 to 5, skipped by 2: ", arr[0:5:2], "\n")
  
  print("Unpacking")
  arr4 = [1, 2, 3, 4, 5]
  a, b, c, d, e = arr4 # unpacking a list
  print("Original List: ", arr4)
  print("Unpacked Elements: ", a, b, c, d, e, "\n")
  
  print("Head and Tail")
  print("Original List: ", arr4)
  print("Getting the Head: ", arr4[0]) # head is first element
  print("Getting the Tail: ", arr4[1:]) # tail is index 1 and forward
  print("Original List: ", arr4)
  head, *tail = arr4
  print("Another way to get Head: ", head)
  print("Another way of getting Tail: ", tail, "\n")
  
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
    print(i, j) # the lists have to be the same size

  print("\n")
  
  print("List Comprehension")
  lst = [i for i in range(5)] # intialize a list using a range of values
  print("Initialize list using a loop: ", lst)
  lst2 = [i + i for i in range(5)]
  print("Initialize list by adding values to itself in a list: ", lst2)
  lst3 = [[0] * 3 for i in range(3)]
  print("Initialize a 2D list: ", lst3)
  
  print("\n")


def strings():
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

  print("Initializing Strings With Size")
  n = 5
  s5 = " " * n  # initialize string with spaces
  print("String 5 with initial size as 5 (spaces): ", repr(s5))

  s6 = "a" * n  # initialize string with repeated characters
  print("String 6 with 'a' repeated 5 times: ", s6, "\n")

  print("Substrings")
  print("Original String: ", s)
  print("Substring from index 0 to 5: ", s[0:5])  # substring
  print("Substring from index 7 to end: ", s[7:])
  print("Substring with step (every other char): ", s[::2], "\n")

  print("Unpacking")
  s7 = "abcde"
  a, b, c, d, e = s7  # unpacking a string
  print("Original String: ", s7)
  print("Unpacked Characters: ", a, b, c, d, e, "\n")

  print("Head and Tail")
  print("Original String: ", s7)
  print("Getting the Head: ", s7[0])  # head is first character
  print("Getting the Tail: ", s7[1:])  # tail is index 1 and forward
  head, *tail = s7
  print("Another way to get Head: ", head)
  print("Another way of getting Tail: ", ''.join(tail), "\n")

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

  print("String Formatting")
  name = "Alice"
  age = 30
  formatted = f"Hello, my name is {name} and I am {age} years old."  # f-string
  print("Formatted String: ", formatted)
  formatted2 = "Hello, my name is {} and I am {} years old.".format(name, age)  # format method
  print("Formatted String 2: ", formatted2)

  print("\n")
  


if __name__ == "__main__":
  lists()
  strings()