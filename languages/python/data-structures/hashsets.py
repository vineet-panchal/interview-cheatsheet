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

if __name__ == "__main__":
  hashmaps()