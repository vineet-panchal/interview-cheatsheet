# Iterations and Decisions in C#

This document provides notes on control flow structures in C#, specifically focusing on decision-making statements (conditionals) and iteration statements (loops). These are fundamental for controlling the flow of execution in your programs.

## Decisions

Decision-making structures allow your program to execute different blocks of code based on conditions. C# provides `if`, `else`, and `switch` statements for this purpose.

### If Statement

The `if` statement evaluates a condition and executes a block of code if the condition is true. It can be combined with `else` and `else if` for multiple branches.

**Syntax:**
```csharp
if (condition)
{
    // Code to execute if condition is true
}
else if (anotherCondition)
{
    // Code to execute if anotherCondition is true
}
else
{
    // Code to execute if none of the above conditions are true
}
```

**Example:**
```csharp
int age = 18;
if (age >= 18)
{
    Console.WriteLine("You are an adult.");
}
else
{
    Console.WriteLine("You are a minor.");
}
```

**Notes:**
- The condition must evaluate to a boolean (`true` or `false`).
- Use curly braces `{}` even for single statements to avoid bugs.
- `else if` can be chained multiple times.

### Switch Statement

The `switch` statement is useful for selecting one of many code blocks to execute based on the value of an expression. It's often more readable than multiple `if-else` statements when dealing with discrete values.

**Syntax:**
```csharp
switch (expression)
{
    case value1:
        // Code to execute if expression == value1
        break;
    case value2:
        // Code to execute if expression == value2
        break;
    default:
        // Code to execute if none of the cases match
        break;
}
```

**Example:**
```csharp
string day = "Monday";
switch (day)
{
    case "Monday":
        Console.WriteLine("Start of the work week.");
        break;
    case "Friday":
        Console.WriteLine("Almost weekend!");
        break;
    default:
        Console.WriteLine("Another day.");
        break;
}
```

**Notes:**
- The `break` statement is required to exit the switch block after a case.
- `default` is optional but recommended for handling unexpected values.
- C# 8.0+ supports switch expressions for more concise syntax.

## Iterations

Iteration structures allow you to repeat a block of code multiple times. C# provides `for`, `while`, `do-while`, and `foreach` loops.

### For Loop

The `for` loop is ideal when you know the number of iterations in advance. It consists of initialization, condition, and increment/decrement.

**Syntax:**
```csharp
for (initialization; condition; increment)
{
    // Code to execute in each iteration
}
```

**Example:**
```csharp
for (int i = 0; i < 5; i++)
{
    Console.WriteLine($"Iteration {i}");
}
```

**Notes:**
- Initialization happens once at the start.
- Condition is checked before each iteration.
- Increment executes after each iteration.

### While Loop

The `while` loop executes a block of code as long as a condition is true. The condition is checked before each iteration.

**Syntax:**
```csharp
while (condition)
{
    // Code to execute while condition is true
}
```

**Example:**
```csharp
int count = 0;
while (count < 3)
{
    Console.WriteLine($"Count: {count}");
    count++;
}
```

**Notes:**
- Be careful to avoid infinite loops by ensuring the condition eventually becomes false.
- The loop may not execute at all if the condition is initially false.

### Do-While Loop

Similar to `while`, but the condition is checked after each iteration, ensuring the loop executes at least once.

**Syntax:**
```csharp
do
{
    // Code to execute
} while (condition);
```

**Example:**
```csharp
int number;
do
{
    Console.Write("Enter a positive number: ");
    number = int.Parse(Console.ReadLine());
} while (number <= 0);
```

**Notes:**
- Useful for input validation where you want to prompt at least once.
- The semicolon after `while` is required.

### Foreach Loop

The `foreach` loop iterates over elements in a collection (like arrays or lists) without needing an index.

**Syntax:**
```csharp
foreach (var item in collection)
{
    // Code to execute for each item
}
```

**Example:**
```csharp
string[] fruits = { "Apple", "Banana", "Cherry" };
foreach (string fruit in fruits)
{
    Console.WriteLine(fruit);
}
```

**Notes:**
- The loop variable (`item`) is read-only within the loop.
- Works with any type that implements `IEnumerable`.
- Cannot modify the collection during iteration (use `for` loop for that).

## Best Practices

- Use meaningful variable names in loops.
- Avoid deep nesting of control structures for readability.
- Consider using LINQ for complex iterations on collections.
- Always test edge cases in your conditions and loops.
- Use `break` and `continue` statements judiciously in loops.

These structures form the backbone of C# programming logic. Practice with examples to master their usage.
