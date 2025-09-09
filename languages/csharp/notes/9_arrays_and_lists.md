# Arrays and Lists in C#

Arrays and lists are used to store collections of items. Arrays have fixed size, while lists are dynamic.

## Arrays

Fixed-size collections of the same type:
```csharp
int[] numbers = new int[5]; // Size 5
int[] initialized = { 1, 2, 3, 4, 5 };
```

- Access elements: `numbers[0]`
- Length: `numbers.Length`
- Multidimensional: `int[,] matrix = new int[2, 3];`

## Lists

Dynamic collections using `List<T>`:
```csharp
using System.Collections.Generic;

List<int> numbers = new List<int>();
numbers.Add(1);
numbers.Add(2);
numbers.Remove(1);
```

- Count: `numbers.Count`
- Access: `numbers[0]`
- Methods: `Add()`, `Remove()`, `Contains()`, `Sort()`, etc.

## Common Operations

- Iteration: Use `for`, `foreach`
- Sorting: `Array.Sort(array)`, `list.Sort()`
- Searching: `Array.IndexOf()`, `list.IndexOf()`
- Conversion: `list.ToArray()`, `array.ToList()`

## LINQ

Query collections:
```csharp
var evenNumbers = numbers.Where(n => n % 2 == 0);
var sum = numbers.Sum();
```

## Best Practices

- Use arrays for fixed-size data.
- Use lists for dynamic collections.
- Prefer LINQ for complex queries.
- Consider `IEnumerable<T>` for read-only access.

---

Choose the right collection type based on your needs for efficiency and flexibility.
