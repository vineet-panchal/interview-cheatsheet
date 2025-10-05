# C# Basics

C# (pronounced "C Sharp") is a modern, object-oriented programming language developed by Microsoft. It's the primary language for .NET development.

## Basic Syntax

### Hello World Program

```csharp
using System;

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("Hello, World!");
    }
}
```

### Variables and Data Types

```csharp
// Value types
int age = 25;
double salary = 50000.50;
bool isEmployed = true;
char grade = 'A';

// Reference types
string name = "John Doe";
int[] numbers = { 1, 2, 3, 4, 5 };
DateTime today = DateTime.Now;

// Nullable types
int? nullableInt = null;
string? nullableString = null;

// var keyword (implicit typing)
var message = "Hello"; // string
var count = 10; // int
var list = new List<string>(); // List<string>
```

### Constants

```csharp
const double PI = 3.14159;
const string APP_NAME = "My Application";
```

## Operators

### Arithmetic Operators

```csharp
int a = 10, b = 3;
int sum = a + b;        // 13
int difference = a - b; // 7
int product = a * b;    // 30
int quotient = a / b;   // 3
int remainder = a % b;  // 1
```

### Comparison Operators

```csharp
bool isEqual = (a == b);     // false
bool isNotEqual = (a != b);  // true
bool isGreater = (a > b);    // true
bool isLess = (a < b);       // false
bool isGreaterOrEqual = (a >= b); // true
bool isLessOrEqual = (a <= b);    // false
```

### Logical Operators

```csharp
bool x = true, y = false;
bool andResult = x && y; // false
bool orResult = x || y;  // true
bool notResult = !x;     // false
```

### Assignment Operators

```csharp
int x = 5;
x += 3;  // x = x + 3; x is now 8
x -= 2;  // x = x - 2; x is now 6
x *= 4;  // x = x * 4; x is now 24
x /= 2;  // x = x / 2; x is now 12
x %= 5;  // x = x % 5; x is now 2
```

## Control Flow

### If-Else Statements

```csharp
int score = 85;

if (score >= 90)
{
    Console.WriteLine("Grade: A");
}
else if (score >= 80)
{
    Console.WriteLine("Grade: B");
}
else if (score >= 70)
{
    Console.WriteLine("Grade: C");
}
else
{
    Console.WriteLine("Grade: F");
}
```

### Switch Statements

```csharp
string day = "Monday";

switch (day)
{
    case "Monday":
        Console.WriteLine("Start of work week");
        break;
    case "Friday":
        Console.WriteLine("TGIF!");
        break;
    case "Saturday":
    case "Sunday":
        Console.WriteLine("Weekend!");
        break;
    default:
        Console.WriteLine("Regular day");
        break;
}
```

### Ternary Operator

```csharp
int age = 20;
string status = (age >= 18) ? "Adult" : "Minor";
Console.WriteLine(status); // Adult
```

## Loops

### For Loop

```csharp
for (int i = 0; i < 5; i++)
{
    Console.WriteLine($"Iteration {i}");
}
```

### While Loop

```csharp
int counter = 0;
while (counter < 5)
{
    Console.WriteLine($"Counter: {counter}");
    counter++;
}
```

### Do-While Loop

```csharp
int number;
do
{
    Console.Write("Enter a number between 1 and 10: ");
    number = int.Parse(Console.ReadLine());
} while (number < 1 || number > 10);
```

### Foreach Loop

```csharp
string[] fruits = { "Apple", "Banana", "Orange" };

foreach (string fruit in fruits)
{
    Console.WriteLine(fruit);
}
```

## Methods

### Method Definition

```csharp
// Method without parameters and return value
void DisplayMessage()
{
    Console.WriteLine("Hello from method!");
}

// Method with parameters
void GreetUser(string name)
{
    Console.WriteLine($"Hello, {name}!");
}

// Method with return value
int AddNumbers(int a, int b)
{
    return a + b;
}

// Method with multiple parameters and return value
double CalculateAverage(params int[] numbers)
{
    if (numbers.Length == 0) return 0;
    return numbers.Sum() / (double)numbers.Length;
}
```

### Method Overloading

```csharp
class Calculator
{
    public int Add(int a, int b)
    {
        return a + b;
    }

    public double Add(double a, double b)
    {
        return a + b;
    }

    public int Add(int a, int b, int c)
    {
        return a + b + c;
    }
}
```

### Optional Parameters

```csharp
void PrintMessage(string message, bool addTimestamp = false)
{
    if (addTimestamp)
    {
        Console.WriteLine($"{DateTime.Now}: {message}");
    }
    else
    {
        Console.WriteLine(message);
    }
}

// Usage
PrintMessage("Hello"); // Hello
PrintMessage("Hello", true); // 2023-12-07 10:30:00: Hello
```

### Named Parameters

```csharp
void CreateUser(string name, int age, string email = "")
{
    Console.WriteLine($"Name: {name}, Age: {age}, Email: {email}");
}

// Usage
CreateUser(name: "John", age: 30, email: "john@example.com");
CreateUser(age: 25, name: "Jane");
```

## Arrays

### Declaration and Initialization

```csharp
// Single-dimensional array
int[] numbers = new int[5];
int[] initializedNumbers = { 1, 2, 3, 4, 5 };
int[] anotherArray = new int[] { 10, 20, 30 };

// Multi-dimensional array
int[,] matrix = new int[3, 3];
int[,] initializedMatrix = {
    { 1, 2, 3 },
    { 4, 5, 6 },
    { 7, 8, 9 }
};

// Jagged array
int[][] jaggedArray = new int[3][];
jaggedArray[0] = new int[] { 1, 2 };
jaggedArray[1] = new int[] { 3, 4, 5 };
jaggedArray[2] = new int[] { 6 };
```

### Array Operations

```csharp
int[] numbers = { 10, 20, 30, 40, 50 };

// Accessing elements
Console.WriteLine(numbers[0]); // 10
Console.WriteLine(numbers[2]); // 30

// Length
Console.WriteLine(numbers.Length); // 5

// Iterating through array
foreach (int number in numbers)
{
    Console.WriteLine(number);
}

// Finding elements
int index = Array.IndexOf(numbers, 30); // 2
bool contains = Array.Exists(numbers, n => n > 25); // true

// Sorting
Array.Sort(numbers); // numbers is now { 10, 20, 30, 40, 50 }

// Reversing
Array.Reverse(numbers); // numbers is now { 50, 40, 30, 20, 10 }
```

## Strings

### String Declaration

```csharp
string greeting = "Hello, World!";
string name = "John";
string emptyString = "";
string nullString = null;
```

### String Operations

```csharp
string firstName = "John";
string lastName = "Doe";

// Concatenation
string fullName = firstName + " " + lastName; // "John Doe"
string fullName2 = string.Concat(firstName, " ", lastName); // "John Doe"

// Interpolation
string greeting = $"Hello, {firstName} {lastName}!"; // "Hello, John Doe!"

// Length
int length = fullName.Length; // 8

// Substring
string first = fullName.Substring(0, 4); // "John"

// Replace
string replaced = fullName.Replace("John", "Jane"); // "Jane Doe"

// Split
string[] parts = fullName.Split(' '); // ["John", "Doe"]

// Join
string joined = string.Join(", ", parts); // "John, Doe"

// Case conversion
string upper = fullName.ToUpper(); // "JOHN DOE"
string lower = fullName.ToLower(); // "john doe"

// Trimming
string padded = "  Hello  ";
string trimmed = padded.Trim(); // "Hello"
```

### String Comparison

```csharp
string str1 = "Hello";
string str2 = "hello";
string str3 = "Hello";

// Case-sensitive comparison
bool equal1 = str1 == str2; // false
bool equal2 = str1 == str3; // true

// Case-insensitive comparison
bool equal3 = string.Equals(str1, str2, StringComparison.OrdinalIgnoreCase); // true

// Compare method
int result = string.Compare(str1, str2); // -1 (str1 < str2)
int result2 = string.Compare(str1, str3); // 0 (equal)
```

## Exception Handling

### Try-Catch-Finally

```csharp
try
{
    int dividend = 10;
    int divisor = 0;
    int result = dividend / divisor;
    Console.WriteLine($"Result: {result}");
}
catch (DivideByZeroException ex)
{
    Console.WriteLine($"Error: {ex.Message}");
}
catch (Exception ex)
{
    Console.WriteLine($"Unexpected error: {ex.Message}");
}
finally
{
    Console.WriteLine("This always executes");
}
```

### Throwing Exceptions

```csharp
void ValidateAge(int age)
{
    if (age < 0)
    {
        throw new ArgumentException("Age cannot be negative", nameof(age));
    }
    if (age > 150)
    {
        throw new ArgumentOutOfRangeException(nameof(age), "Age cannot be greater than 150");
    }
}

// Usage
try
{
    ValidateAge(-5);
}
catch (ArgumentException ex)
{
    Console.WriteLine(ex.Message);
}
```

### Custom Exceptions

```csharp
class InvalidEmailException : Exception
{
    public InvalidEmailException() : base() { }
    public InvalidEmailException(string message) : base(message) { }
    public InvalidEmailException(string message, Exception innerException)
        : base(message, innerException) { }
}

void ValidateEmail(string email)
{
    if (string.IsNullOrEmpty(email) || !email.Contains("@"))
    {
        throw new InvalidEmailException("Invalid email address");
    }
}
```

## Summary

C# basics include variables, data types, operators, control flow statements, loops, methods, arrays, strings, and exception handling. These fundamental concepts form the building blocks for more advanced C# programming. Understanding these basics is essential for writing effective C# code in .NET applications.
