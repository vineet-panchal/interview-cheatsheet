# Hashmaps in Python

## Introduction

**Hashmaps** (also known as dictionaries in Python) are data structures that store key-value pairs. They provide fast lookups, insertions, and deletions on average O(1) time complexity. Python's built-in `dict` is implemented as a hash table.

## Basic Operations

```python
# Creating hashmaps
hashmap = {}
hashmap = dict()
hashmap = {'key': 'value'}

# Adding/updating
hashmap['alice'] = 88
hashmap['bob'] = 77

# Accessing
score = hashmap['alice']  # 88
score = hashmap.get('charlie', 0)  # 0 if not found

# Removing
del hashmap['bob']
removed = hashmap.pop('alice', None)  # Returns value or None

# Checking existence
exists = 'alice' in hashmap

# Length
size = len(hashmap)

# Iterating
for key in hashmap:
    print(key, hashmap[key])

for key, value in hashmap.items():
    print(key, value)

# Keys and values
keys = hashmap.keys()
values = hashmap.values()
```

## Output

```bash
{'alice': 88, 'bob': 77}
88
88
None
2
80
True
{'bob': 77}
{'alice': 90, 'bob': 70}
{0: 0, 1: 2, 2: 4}
alice
bob
90
80
alice: 90
bob: 80
```

## Advanced Operations

```python
# Dictionary comprehensions
squares = {x: x**2 for x in range(5)}  # {0: 0, 1: 1, 2: 4, 3: 9, 4: 16}

# Merging dictionaries
dict1 = {'a': 1, 'b': 2}
dict2 = {'b': 3, 'c': 4}
merged = {**dict1, **dict2}  # {'a': 1, 'b': 3, 'c': 4}

# Default values
from collections import defaultdict
dd = defaultdict(int)
dd['key'] += 1  # No KeyError, defaults to 0

# OrderedDict for ordered dictionaries
from collections import OrderedDict
od = OrderedDict()
od['first'] = 1
od['second'] = 2
```

## Additional Methods for Hashmaps

```python
# Sorting dictionaries
hashmap = {6: 3, 1: 1, 2: 4, 3: 5}
sorted_by_values = dict(sorted(hashmap.items(), key=lambda x: x[1]))
print("Dictionary sorted by values: ", sorted_by_values)
sorted_by_values_reverse = dict(sorted(hashmap.items(), key=lambda x: x[1], reverse=True))
print("Dictionary sorted by values in reverse: ", sorted_by_values_reverse)
```

## Output

```bash
Dictionary sorted by values:  {1: 1, 6: 3, 2: 4, 3: 5}
Dictionary sorted by values in reverse:  {3: 5, 2: 4, 6: 3, 1: 1}
```

## Time Complexity

- **Access**: O(1) average, O(n) worst case
- **Insert**: O(1) average, O(n) worst case
- **Delete**: O(1) average, O(n) worst case
- **Search**: O(1) average, O(n) worst case

## Applications

- Caching
- Counting frequencies
- Memoization
- Database indexing
- Symbol tables
- Configuration storage

## Common Patterns

### Frequency Counting

```python
def count_frequency(arr):
    freq = {}
    for item in arr:
        freq[item] = freq.get(item, 0) + 1
    return freq

arr = [1, 2, 2, 3, 3, 3]
print(count_frequency(arr))  # {1: 1, 2: 2, 3: 3}
```

### Two Sum Problem

```python
def two_sum(nums, target):
    seen = {}
    for i, num in enumerate(nums):
        complement = target - num
        if complement in seen:
            return [seen[complement], i]
        seen[num] = i
    return []

nums = [2, 7, 11, 15]
target = 9
print(two_sum(nums, target))  # [0, 1]
```

### LRU Cache

```python
from collections import OrderedDict

class LRUCache:
    def __init__(self, capacity):
        self.cache = OrderedDict()
        self.capacity = capacity

    def get(self, key):
        if key not in self.cache:
            return -1
        self.cache.move_to_end(key)
        return self.cache[key]

    def put(self, key, value):
        if key in self.cache:
            self.cache.move_to_end(key)
        self.cache[key] = value
        if len(self.cache) > self.capacity:
            self.cache.popitem(last=False)
```

## Hash Function

Python uses a hash function to convert keys to indices in the underlying array. The hash function should:

- Be deterministic (same key always produces same hash)
- Distribute keys uniformly
- Be fast to compute

For custom objects, implement `__hash__` and `__eq__`:

```python
class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def __hash__(self):
        return hash((self.x, self.y))

    def __eq__(self, other):
        return self.x == other.x and self.y == other.y
```

## Collision Resolution

Python uses open addressing with quadratic probing to handle hash collisions.

## Best Practices

- Use immutable keys (strings, numbers, tuples)
- Avoid mutable keys (lists, dicts)
- Don't modify keys while they're in the dict
- Use `dict.get()` for safe access
- Consider `collections.defaultdict` for default values
- Use `collections.Counter` for counting
