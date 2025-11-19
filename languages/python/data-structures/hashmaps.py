def hashmaps():

  myMap = {}
  myMap["alice"] = 88
  myMap["bob"] = 77
  print(myMap) # {'alice': 88, 'bob': 77}
  print(myMap["alice"]) # 88
  print(myMap.get("alice")) # 88
  print(myMap.get("charlie")) # None
  print(len(myMap)) # 2

  myMap["alice"] = 80
  print(myMap["alice"]) # 80

  print("alice" in myMap) # True
  myMap.pop("alice")
  print(myMap) # {'bob': 77}

  myMap = {"alice": 90, "bob": 70}
  print(myMap) # {'alice': 90, 'bob': 70}


  # dict comprehension
  myMap = { i: 2*i for i in range(3) }
  print(myMap) # {0: 0, 1: 2, 2: 4}


  # looping through maps
  myMap = {"alice": 90, "bob": 80}
  for key in myMap:
    print(key)

  # /> main.py
  # alice
  # bob

  for val in myMap.values():
    print(val)

  # /> main.py
  # 90
  # 80

  for key, val in myMap.items():
    print(f"{key}: {val}")

  # /> main.py
  # alice: 90
  # bob: 80
  
  print("\n")
  print("Additional Methods for Hashmaps")
  count = {6: 3, 1: 1, 2: 4, 3: 5}
  print("Original Hashmap: ", count)
  sorted_by_values = sorted(count.items(), key=lambda item: item[1])
  sorted_by_values_dict = dict(sorted_by_values)
  print("Dictionary sorted by values: ", sorted_by_values_dict)
  sorted_by_values_reversed = sorted(count.items(), key=lambda item: item[1], reverse=True)
  sorted_by_values_reversed_dict = dict(sorted_by_values_reversed)
  print("Dictionary sorted by values in reverse: ", sorted_by_values_reversed_dict)
if __name__ == "__main__":
  hashmaps()