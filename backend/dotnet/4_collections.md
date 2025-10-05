# Collections and Generics in C#

Collections are classes that store and manage groups of related objects. Generics provide type safety and performance benefits.

## Arrays

### Single-Dimensional Arrays

```csharp
// Declaration and initialization
int[] numbers = new int[5];
int[] initializedNumbers = { 1, 2, 3, 4, 5 };
int[] anotherArray = new int[] { 10, 20, 30 };

// Accessing elements
Console.WriteLine(numbers[0]); // 0 (default value)
Console.WriteLine(initializedNumbers[2]); // 3

// Modifying elements
numbers[0] = 100;
Console.WriteLine(numbers[0]); // 100

// Length property
Console.WriteLine(numbers.Length); // 5
```

### Multi-Dimensional Arrays

```csharp
// 2D array
int[,] matrix = new int[3, 4];
int[,] initializedMatrix = {
    { 1, 2, 3, 4 },
    { 5, 6, 7, 8 },
    { 9, 10, 11, 12 }
};

// Accessing elements
Console.WriteLine(initializedMatrix[0, 0]); // 1
Console.WriteLine(initializedMatrix[1, 2]); // 7

// Getting dimensions
Console.WriteLine(initializedMatrix.GetLength(0)); // 3 (rows)
Console.WriteLine(initializedMatrix.GetLength(1)); // 4 (columns)
```

### Jagged Arrays

```csharp
// Array of arrays
int[][] jaggedArray = new int[3][];
jaggedArray[0] = new int[] { 1, 2 };
jaggedArray[1] = new int[] { 3, 4, 5 };
jaggedArray[2] = new int[] { 6, 7, 8, 9 };

// Accessing elements
Console.WriteLine(jaggedArray[0][1]); // 2
Console.WriteLine(jaggedArray[1][2]); // 5
```

## Generic Collections

### List<T>

```csharp
using System.Collections.Generic;

// Creating a list
List<string> names = new List<string>();
List<int> numbers = new List<int> { 1, 2, 3, 4, 5 };

// Adding elements
names.Add("Alice");
names.Add("Bob");
names.Add("Charlie");

// Inserting at specific position
names.Insert(1, "David");

// Accessing elements
Console.WriteLine(names[0]); // Alice
Console.WriteLine(names[2]); // Charlie

// Count property
Console.WriteLine(names.Count); // 4

// Iterating through list
foreach (string name in names)
{
    Console.WriteLine(name);
}

// Removing elements
names.Remove("Bob"); // Remove by value
names.RemoveAt(1);   // Remove by index

// Checking if element exists
bool containsAlice = names.Contains("Alice"); // true

// Finding elements
string foundName = names.Find(name => name.StartsWith("A")); // Alice
List<string> namesWithA = names.FindAll(name => name.StartsWith("A"));

// Sorting
names.Sort();

// Converting to array
string[] namesArray = names.ToArray();

// Clearing the list
names.Clear();
```

### Dictionary<TKey, TValue>

```csharp
// Creating a dictionary
Dictionary<string, int> ages = new Dictionary<string, int>();
Dictionary<int, string> idToName = new Dictionary<int, string>
{
    { 1, "Alice" },
    { 2, "Bob" },
    { 3, "Charlie" }
};

// Adding elements
ages["Alice"] = 25;
ages.Add("Bob", 30);

// Accessing elements
Console.WriteLine(ages["Alice"]); // 25

// Checking if key exists
bool hasAlice = ages.ContainsKey("Alice"); // true
bool hasAge25 = ages.ContainsValue(25); // true

// Iterating through dictionary
foreach (KeyValuePair<string, int> kvp in ages)
{
    Console.WriteLine($"{kvp.Key}: {kvp.Value}");
}

// Only keys
foreach (string name in ages.Keys)
{
    Console.WriteLine(name);
}

// Only values
foreach (int age in ages.Values)
{
    Console.WriteLine(age);
}

// Removing elements
ages.Remove("Alice");

// Count
Console.WriteLine(ages.Count);

// Clearing
ages.Clear();
```

### HashSet<T>

```csharp
// Creating a HashSet
HashSet<string> uniqueNames = new HashSet<string>();
HashSet<int> numbers = new HashSet<int> { 1, 2, 3, 4, 5 };

// Adding elements
uniqueNames.Add("Alice");
uniqueNames.Add("Bob");
uniqueNames.Add("Alice"); // Duplicate, won't be added

// Count
Console.WriteLine(uniqueNames.Count); // 2

// Checking membership
bool hasAlice = uniqueNames.Contains("Alice"); // true

// Set operations
HashSet<string> set1 = new HashSet<string> { "A", "B", "C" };
HashSet<string> set2 = new HashSet<string> { "B", "C", "D" };

set1.UnionWith(set2);        // { "A", "B", "C", "D" }
set1.IntersectWith(set2);    // { "B", "C" }
set1.ExceptWith(set2);       // { "A" }
set1.SymmetricExceptWith(set2); // { "A", "D" }
```

### Queue<T>

```csharp
// Creating a queue
Queue<string> tasks = new Queue<string>();

// Adding elements (enqueue)
tasks.Enqueue("Task 1");
tasks.Enqueue("Task 2");
tasks.Enqueue("Task 3");

// Count
Console.WriteLine(tasks.Count); // 3

// Peeking at the front element
string nextTask = tasks.Peek(); // "Task 1"
Console.WriteLine(nextTask);

// Removing elements (dequeue)
string completedTask = tasks.Dequeue(); // "Task 1"
Console.WriteLine(completedTask);

// Iterating (note: this doesn't remove elements)
foreach (string task in tasks)
{
    Console.WriteLine(task);
}

// Clearing
tasks.Clear();
```

### Stack<T>

```csharp
// Creating a stack
Stack<string> browserHistory = new Stack<string>();

// Adding elements (push)
browserHistory.Push("Home");
browserHistory.Push("About");
browserHistory.Push("Contact");

// Count
Console.WriteLine(browserHistory.Count); // 3

// Peeking at the top element
string currentPage = browserHistory.Peek(); // "Contact"
Console.WriteLine(currentPage);

// Removing elements (pop)
string previousPage = browserHistory.Pop(); // "Contact"
Console.WriteLine(previousPage);

// Iterating (note: this doesn't remove elements)
foreach (string page in browserHistory)
{
    Console.WriteLine(page);
}
```

## Non-Generic Collections

### ArrayList

```csharp
using System.Collections;

// Creating ArrayList
ArrayList list = new ArrayList();

// Adding elements
list.Add("Hello");
list.Add(42);
list.Add(3.14);

// Accessing elements (requires casting)
string str = (string)list[0];
int num = (int)list[1];

// Count
Console.WriteLine(list.Count);

// Iterating
foreach (object item in list)
{
    Console.WriteLine(item);
}
```

### Hashtable

```csharp
// Creating Hashtable
Hashtable table = new Hashtable();

// Adding elements
table["name"] = "Alice";
table["age"] = 25;
table.Add("city", "New York");

// Accessing elements (requires casting)
string name = (string)table["name"];
int age = (int)table["age"];

// Checking if key exists
bool hasName = table.ContainsKey("name");

// Iterating
foreach (DictionaryEntry entry in table)
{
    Console.WriteLine($"{entry.Key}: {entry.Value}");
}
```

## Custom Generic Classes

### Generic Class

```csharp
public class GenericContainer<T>
{
    private T _value;

    public GenericContainer(T value)
    {
        _value = value;
    }

    public T GetValue()
    {
        return _value;
    }

    public void SetValue(T value)
    {
        _value = value;
    }
}

// Usage
GenericContainer<string> stringContainer = new GenericContainer<string>("Hello");
GenericContainer<int> intContainer = new GenericContainer<int>(42);
```

### Generic Method

```csharp
public class Utility
{
    public static T Max<T>(T a, T b) where T : IComparable<T>
    {
        return a.CompareTo(b) > 0 ? a : b;
    }

    public static void Swap<T>(ref T a, ref T b)
    {
        T temp = a;
        a = b;
        b = temp;
    }
}

// Usage
int maxInt = Utility.Max(5, 10); // 10
string maxString = Utility.Max("apple", "banana"); // "banana"

int x = 5, y = 10;
Utility.Swap(ref x, ref y); // x = 10, y = 5
```

### Generic Constraints

```csharp
// Interface constraint
public class Repository<T> where T : IEntity
{
    public void Save(T entity)
    {
        // Implementation
    }
}

// Class constraint
public class SortedList<T> where T : IComparable<T>
{
    // Implementation
}

// Constructor constraint
public class Factory<T> where T : new()
{
    public T CreateInstance()
    {
        return new T();
    }
}

// Multiple constraints
public class AdvancedList<T> where T : class, IComparable<T>, new()
{
    // Implementation
}
```

## LINQ with Collections

```csharp
List<int> numbers = new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };

// Filtering
var evenNumbers = numbers.Where(n => n % 2 == 0);

// Projection
var squaredNumbers = numbers.Select(n => n * n);

// Ordering
var sortedNumbers = numbers.OrderByDescending(n => n);

// Aggregation
int sum = numbers.Sum();
double average = numbers.Average();
int max = numbers.Max();

// Complex query
var complexQuery = numbers
    .Where(n => n > 3)
    .Select(n => n * n)
    .OrderBy(n => n)
    .ToList();
```

## Collection Initializers

```csharp
// List initializer
List<string> names = new List<string> { "Alice", "Bob", "Charlie" };

// Dictionary initializer
Dictionary<string, int> ages = new Dictionary<string, int>
{
    { "Alice", 25 },
    { "Bob", 30 },
    { "Charlie", 35 }
};

// Custom class with collection property
public class Team
{
    public string Name { get; set; }
    public List<string> Members { get; set; } = new List<string>();
}

Team team = new Team
{
    Name = "Development Team",
    Members = { "Alice", "Bob", "Charlie" }
};
```

## Summary

Collections in C# provide various ways to store and manipulate groups of objects. Generic collections offer type safety and better performance compared to non-generic ones. Understanding different collection types and their use cases is crucial for efficient C# programming.
