# LINQ (Language Integrated Query)

LINQ (Language Integrated Query) is a set of technologies that allows you to query data from different data sources using a consistent syntax.

## LINQ Basics

### Query Syntax vs Method Syntax

```csharp
using System.Linq;

// Sample data
int[] numbers = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
string[] names = { "Alice", "Bob", "Charlie", "David", "Eve" };

// Method syntax
var evenNumbers = numbers.Where(n => n % 2 == 0);

// Query syntax
var evenNumbersQuery = from n in numbers
                      where n % 2 == 0
                      select n;

// Both produce the same result
Console.WriteLine(string.Join(", ", evenNumbers)); // 2, 4, 6, 8, 10
Console.WriteLine(string.Join(", ", evenNumbersQuery)); // 2, 4, 6, 8, 10
```

## Filtering Operations

### Where

```csharp
// Simple filtering
var numbersGreaterThan5 = numbers.Where(n => n > 5);

// Multiple conditions
var evenNumbersGreaterThan5 = numbers.Where(n => n > 5 && n % 2 == 0);

// String filtering
var namesStartingWithA = names.Where(name => name.StartsWith("A"));

// Complex filtering
var longNames = names.Where(name => name.Length > 4);
```

### OfType

```csharp
object[] mixedArray = { 1, "hello", 2.5, "world", 3, true };

// Filter only integers
var integers = mixedArray.OfType<int>(); // { 1, 3 }

// Filter only strings
var strings = mixedArray.OfType<string>(); // { "hello", "world" }
```

## Projection Operations

### Select

```csharp
// Simple projection
var squaredNumbers = numbers.Select(n => n * n);

// Transform to different type
var numberStrings = numbers.Select(n => $"Number: {n}");

// Select multiple properties
var people = new[]
{
    new { Name = "Alice", Age = 25 },
    new { Name = "Bob", Age = 30 },
    new { Name = "Charlie", Age = 35 }
};

var namesOnly = people.Select(p => p.Name);
var agesOnly = people.Select(p => p.Age);
var nameAndAge = people.Select(p => $"{p.Name} ({p.Age})");
```

### SelectMany

```csharp
// Flatten nested collections
var sentences = new[] { "Hello world", "How are you", "I'm fine" };
var words = sentences.SelectMany(s => s.Split(' '));
// Result: { "Hello", "world", "How", "are", "you", "I'm", "fine" }

// Working with collections of collections
var numberGroups = new[]
{
    new[] { 1, 2, 3 },
    new[] { 4, 5 },
    new[] { 6, 7, 8, 9 }
};

var allNumbers = numberGroups.SelectMany(group => group);
// Result: { 1, 2, 3, 4, 5, 6, 7, 8, 9 }
```

## Ordering Operations

### OrderBy / OrderByDescending

```csharp
// Ascending order
var sortedNumbers = numbers.OrderBy(n => n);

// Descending order
var sortedNumbersDesc = numbers.OrderByDescending(n => n);

// Sort strings by length
var sortedByLength = names.OrderBy(name => name.Length);

// Sort strings alphabetically
var sortedNames = names.OrderBy(name => name);
```

### ThenBy / ThenByDescending

```csharp
var products = new[]
{
    new { Name = "Apple", Category = "Fruit", Price = 1.50 },
    new { Name = "Banana", Category = "Fruit", Price = 0.75 },
    new { Name = "Carrot", Category = "Vegetable", Price = 0.50 },
    new { Name = "Broccoli", Category = "Vegetable", Price = 1.25 }
};

// Sort by category, then by price within each category
var sortedProducts = products
    .OrderBy(p => p.Category)
    .ThenBy(p => p.Price);
```

### Reverse

```csharp
var reversedNumbers = numbers.Reverse();
```

## Grouping Operations

### GroupBy

```csharp
// Group numbers by parity
var groupedByParity = numbers.GroupBy(n => n % 2 == 0 ? "Even" : "Odd");

// Group strings by length
var groupedByLength = names.GroupBy(name => name.Length);

// Working with grouped data
foreach (var group in groupedByParity)
{
    Console.WriteLine($"{group.Key}: {string.Join(", ", group)}");
}
// Output:
// Even: 2, 4, 6, 8, 10
// Odd: 1, 3, 5, 7, 9

// Complex grouping
var employees = new[]
{
    new { Name = "Alice", Department = "HR", Salary = 50000 },
    new { Name = "Bob", Department = "IT", Salary = 60000 },
    new { Name = "Charlie", Department = "HR", Salary = 55000 },
    new { Name = "David", Department = "IT", Salary = 65000 }
};

var departmentGroups = employees.GroupBy(e => e.Department);
foreach (var group in departmentGroups)
{
    Console.WriteLine($"{group.Key} Department:");
    foreach (var employee in group)
    {
        Console.WriteLine($"  {employee.Name}: ${employee.Salary}");
    }
}
```

## Aggregation Operations

### Count / LongCount

```csharp
var totalCount = numbers.Count();
var evenCount = numbers.Count(n => n % 2 == 0);
var longCount = numbers.LongCount(); // For very large collections
```

### Sum / Average / Min / Max

```csharp
var sum = numbers.Sum();
var average = numbers.Average();
var min = numbers.Min();
var max = numbers.Max();

// With selector
var sumOfSquares = numbers.Sum(n => n * n);
var longestNameLength = names.Max(name => name.Length);
```

### Aggregate

```csharp
// Custom aggregation
var product = numbers.Aggregate(1, (acc, n) => acc * n);
var concatenatedNames = names.Aggregate((acc, name) => acc + ", " + name);
```

## Set Operations

### Distinct

```csharp
int[] numbersWithDuplicates = { 1, 2, 2, 3, 3, 3, 4, 5, 5 };
var distinctNumbers = numbersWithDuplicates.Distinct();

// Distinct with custom comparer
var distinctByLength = names.Distinct(new LengthComparer());

class LengthComparer : IEqualityComparer<string>
{
    public bool Equals(string x, string y) => x.Length == y.Length;
    public int GetHashCode(string obj) => obj.Length.GetHashCode();
}
```

### Union / Intersect / Except

```csharp
int[] set1 = { 1, 2, 3, 4 };
int[] set2 = { 3, 4, 5, 6 };

var union = set1.Union(set2);        // { 1, 2, 3, 4, 5, 6 }
var intersection = set1.Intersect(set2); // { 3, 4 }
var difference = set1.Except(set2);  // { 1, 2 }
```

## Partitioning Operations

### Take / TakeWhile

```csharp
// Take first N elements
var first3 = numbers.Take(3); // { 1, 2, 3 }

// Take while condition is true
var numbersLessThan5 = numbers.TakeWhile(n => n < 5); // { 1, 2, 3, 4 }
```

### Skip / SkipWhile

```csharp
// Skip first N elements
var skip3 = numbers.Skip(3); // { 4, 5, 6, 7, 8, 9, 10 }

// Skip while condition is true
var skipSmallNumbers = numbers.SkipWhile(n => n < 5); // { 5, 6, 7, 8, 9, 10 }
```

## Element Operations

### First / FirstOrDefault

```csharp
var firstNumber = numbers.First(); // 1
var firstEven = numbers.First(n => n % 2 == 0); // 2
var firstOrDefault = numbers.FirstOrDefault(n => n > 10); // 0 (default for int)
```

### Last / LastOrDefault

```csharp
var lastNumber = numbers.Last(); // 10
var lastEven = numbers.Last(n => n % 2 == 0); // 10
```

### Single / SingleOrDefault

```csharp
// Throws exception if more than one element
var singleElement = new[] { 42 }.Single(); // 42

// Useful for finding unique elements
var uniqueEven = numbers.SingleOrDefault(n => n == 8); // 8
```

### ElementAt / ElementAtOrDefault

```csharp
var thirdElement = numbers.ElementAt(2); // 3
var tenthElement = numbers.ElementAtOrDefault(9); // 10
var eleventhElement = numbers.ElementAtOrDefault(10); // 0 (default for int)
```

## Conversion Operations

### ToArray / ToList / ToDictionary

```csharp
var numberArray = numbers.ToArray();
var numberList = numbers.ToList();
var numberDictionary = numbers.ToDictionary(n => n, n => n * n);
```

### Cast / OfType

```csharp
ArrayList mixedList = new ArrayList { 1, "hello", 2, "world" };
var strings = mixedList.OfType<string>(); // { "hello", "world" }
var integers = mixedList.OfType<int>();   // { 1, 2 }
```

## Joining Operations

### Join

```csharp
var departments = new[]
{
    new { Id = 1, Name = "HR" },
    new { Id = 2, Name = "IT" },
    new { Id = 3, Name = "Finance" }
};

var employees = new[]
{
    new { Name = "Alice", DeptId = 1 },
    new { Name = "Bob", DeptId = 2 },
    new { Name = "Charlie", DeptId = 1 },
    new { Name = "David", DeptId = 4 } // No matching department
};

// Inner join
var employeeDepartments = employees.Join(
    departments,
    emp => emp.DeptId,
    dept => dept.Id,
    (emp, dept) => new { emp.Name, dept.Name }
);

// Result: { { Name = "Alice", Name = "HR" }, { Name = "Bob", Name = "IT" }, { Name = "Charlie", Name = "HR" } }
```

### GroupJoin

```csharp
// Group join (left outer join)
var departmentEmployees = departments.GroupJoin(
    employees,
    dept => dept.Id,
    emp => emp.DeptId,
    (dept, emps) => new { dept.Name, Employees = emps.ToList() }
);
```

## Complex Queries

### Combining Multiple Operations

```csharp
var complexQuery = numbers
    .Where(n => n > 3)
    .Select(n => new { Number = n, Square = n * n, IsEven = n % 2 == 0 })
    .OrderBy(item => item.Square)
    .GroupBy(item => item.IsEven)
    .Select(group => new
    {
        IsEven = group.Key,
        Count = group.Count(),
        Numbers = group.Select(item => item.Number).ToList()
    });
```

### Query Syntax Complex Example

```csharp
var complexQuerySyntax = from n in numbers
                        where n > 3
                        let square = n * n
                        let isEven = n % 2 == 0
                        orderby square
                        group new { Number = n, Square = square } by isEven into g
                        select new
                        {
                            IsEven = g.Key,
                            Count = g.Count(),
                            Numbers = g.Select(item => item.Number).ToList()
                        };
```

## Deferred Execution vs Immediate Execution

```csharp
// Deferred execution - query executed when enumerated
var query = numbers.Where(n => n > 5);

// Immediate execution - query executed immediately
var count = numbers.Where(n => n > 5).Count();
var list = numbers.Where(n => n > 5).ToList();
```

## Custom LINQ Operators

```csharp
public static class CustomLinqExtensions
{
    public static IEnumerable<T> WhereNot<T>(this IEnumerable<T> source, Func<T, bool> predicate)
    {
        return source.Where(item => !predicate(item));
    }

    public static IEnumerable<T> Shuffle<T>(this IEnumerable<T> source)
    {
        Random rng = new Random();
        return source.OrderBy(_ => rng.Next());
    }
}

// Usage
var numbersNotGreaterThan5 = numbers.WhereNot(n => n > 5);
var shuffledNumbers = numbers.Shuffle();
```

## Summary

LINQ provides powerful querying capabilities for collections in C#. It supports both query syntax and method syntax, allowing developers to write expressive and readable code for data manipulation. Understanding LINQ operations is essential for efficient data processing in .NET applications.
