def hashsets():
    print("=== Set Basics ===")
    # Creating sets
    s1 = set()  # Empty set
    s2 = {1, 2, 3, 4, 5}  # Set with elements
    s3 = set([1, 2, 2, 3, 3, 3])  # From list, duplicates removed
    print("Empty set:", s1)
    print("Set s2:", s2)
    print("Set from list (duplicates removed):", s3)

    # Adding elements
    s1.add(10)
    s1.add(20)
    s1.add(10)  # Duplicate, won't be added
    print("After adding 10, 20, 10:", s1)

    # Removing elements
    s1.remove(10)  # Raises KeyError if not found
    print("After removing 10:", s1)
    s1.discard(30)  # No error if not found
    print("After discarding 30 (not in set):", s1)

    # Pop random element
    if s1:
        popped = s1.pop()
        print("Popped element:", popped)
        print("Set after pop:", s1)

    # Clear set
    s1.clear()
    print("After clear:", s1, "\n")

    print("=== Set Operations ===")
    a = {1, 2, 3, 4}
    b = {3, 4, 5, 6}
    print("Set A:", a)
    print("Set B:", b)

    # Union
    union = a | b
    union_alt = a.union(b)
    print("Union (A | B):", union)
    print("Union (A.union(B)):", union_alt)

    # Intersection
    intersection = a & b
    intersection_alt = a.intersection(b)
    print("Intersection (A & B):", intersection)
    print("Intersection (A.intersection(B)):", intersection_alt)

    # Difference
    diff = a - b
    diff_alt = a.difference(b)
    print("Difference (A - B):", diff)
    print("Difference (A.difference(B)):", diff_alt)

    # Symmetric difference
    sym_diff = a ^ b
    sym_diff_alt = a.symmetric_difference(b)
    print("Symmetric difference (A ^ B):", sym_diff)
    print("Symmetric difference (A.symmetric_difference(B)):", sym_diff_alt)

    # Subset and superset
    c = {1, 2}
    print("Set C:", c)
    print("C is subset of A:", c.issubset(a))
    print("A is superset of C:", a.issuperset(c))
    print("A and B are disjoint:", a.isdisjoint(b), "\n")

    print("=== Set Comprehensions ===")
    # Set comprehension
    squares = {x**2 for x in range(1, 6)}
    print("Squares of 1-5:", squares)

    even_squares = {x**2 for x in range(1, 11) if x % 2 == 0}
    print("Squares of even numbers 1-10:", even_squares)

    # From string
    unique_chars = {char for char in "hello world" if char != ' '}
    print("Unique characters in 'hello world' (no spaces):", unique_chars, "\n")

    print("=== Set Methods and Properties ===")
    s = {1, 2, 3, 4, 5}
    print("Original set:", s)
    print("Length:", len(s))
    print("Contains 3:", 3 in s)
    print("Contains 6:", 6 in s)

    # Copy
    s_copy = s.copy()
    print("Copy:", s_copy)

    # Update (add multiple elements)
    s.update([6, 7, 8])
    print("After update with [6,7,8]:", s)

    # Intersection update
    s.intersection_update({4, 5, 6, 7})
    print("After intersection_update with {4,5,6,7}:", s)

    # Difference update
    s.difference_update({5, 6})
    print("After difference_update with {5,6}:", s)

    # Symmetric difference update
    s.symmetric_difference_update({4, 8, 9})
    print("After symmetric_difference_update with {4,8,9}:", s, "\n")

    print("=== Frozen Sets ===")
    # Immutable set
    fs = frozenset([1, 2, 3, 4])
    print("Frozen set:", fs)
    print("Type:", type(fs))

    # Operations work, but no modification
    fs2 = frozenset([3, 4, 5, 6])
    print("Frozen set 2:", fs2)
    print("Union:", fs | fs2)
    print("Intersection:", fs & fs2)
    # fs.add(5)  # AttributeError

    print()

    print("=== Practical Examples ===")

    # Remove duplicates from list
    lst = [1, 2, 2, 3, 3, 3, 4, 4, 4, 4]
    unique_lst = list(set(lst))
    print("Original list:", lst)
    print("Unique elements:", unique_lst)

    # Find common elements in multiple lists
    list1 = [1, 2, 3, 4]
    list2 = [2, 3, 5, 6]
    list3 = [3, 4, 6, 7]
    common = set(list1) & set(list2) & set(list3)
    print("Common in [1,2,3,4], [2,3,5,6], [3,4,6,7]:", common)

    # Find unique elements across lists
    all_unique = set(list1) | set(list2) | set(list3)
    print("All unique elements:", all_unique)

    # Check if lists have common elements
    has_common = bool(set(list1) & set(list2))
    print("List1 and List2 have common elements:", has_common, "\n")

    print("=== Set as HashSet Simulation ===")
    # Python sets are hash-based, so they act as hashsets
    hashset = set()
    hashset.add("apple")
    hashset.add("banana")
    hashset.add("cherry")
    print("HashSet:", hashset)
    print("Contains 'banana':", "banana" in hashset)
    print("Size:", len(hashset))

    # Fast lookups
    large_set = set(range(100000))
    import time
    start = time.time()
    result = 99999 in large_set
    end = time.time()
    print(f"Lookup 99999 in set of 100000 elements: {result}, time: {(end-start)*1000:.4f} ms", "\n")

    print("=== Set Iteration ===")
    s = {"a", "b", "c", "d"}
    print("Iterating through set:")
    for item in s:
        print(item, end=" ")
    print()

    # Enumerate
    print("Enumerated:")
    for i, item in enumerate(s):
        print(f"{i}: {item}", end=" ")
    print("\n")

    print("=== Set with Complex Data Types ===")
    # Sets with tuples (immutable)
    coord_set = {(1, 2), (3, 4), (1, 2)}  # Duplicate tuple ignored
    print("Set of coordinates:", coord_set)

    # Sets with frozensets
    fs_set = {frozenset([1, 2]), frozenset([3, 4]), frozenset([1, 2])}
    print("Set of frozensets:", fs_set)

    # Cannot have lists or dicts directly (mutable)
    # s_with_lists = {[1, 2], [3, 4]}  # TypeError
    print()

    print("=== Set Performance Comparison ===")
    import time

    # List vs Set lookup
    n = 10000
    lst = list(range(n))
    st = set(range(n))

    # List lookup (worst case)
    start = time.time()
    result = n-1 in lst
    list_time = (time.time() - start) * 1000
    print(f"List lookup (worst case): {result}, time: {list_time:.4f} ms")

    # Set lookup
    start = time.time()
    result = n-1 in st
    set_time = (time.time() - start) * 1000
    print(f"Set lookup: {result}, time: {set_time:.4f} ms")
    print(f"Set is {list_time/set_time:.1f}x faster for lookup", "\n")

    print("=== Set Algebra Examples ===")
    # Venn diagram simulation
    english = {"Alice", "Bob", "Charlie", "David"}
    math = {"Bob", "Charlie", "Eve", "Frank"}
    science = {"Alice", "Charlie", "Eve", "George"}

    print("English class:", english)
    print("Math class:", math)
    print("Science class:", science)

    # Students in all three classes
    all_three = english & math & science
    print("Students in all three classes:", all_three)

    # Students in English or Math
    english_or_math = english | math
    print("Students in English or Math:", english_or_math)

    # Students in English but not Math
    english_not_math = english - math
    print("Students in English but not Math:", english_not_math)

    # Students in exactly one class
    only_english = english - (math | science)
    only_math = math - (english | science)
    only_science = science - (english | math)
    exactly_one = only_english | only_math | only_science
    print("Students in exactly one class:", exactly_one)

    # Students in at least two classes
    at_least_two = (english & math) | (english & science) | (math & science)
    print("Students in at least two classes:", at_least_two)

if __name__ == "__main__":
    hashsets()
