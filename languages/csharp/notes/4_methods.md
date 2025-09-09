# Methods in C#

Methods are blocks of code that perform a specific task and can be called from other parts of the program. They help organize code into reusable units.

## Defining Methods

**Syntax:**
```csharp
[access_modifier] return_type MethodName([parameters])
{
    // Method body
}
```

- `access_modifier`: `public`, `private`, `protected`, `internal`, or combinations.
- `return_type`: The type of value the method returns. Use `void` if no value is returned.
- `MethodName`: The name of the method.
- `parameters`: Optional list of input parameters.

**Example:**
```csharp
public int Add(int a, int b)
{
    return a + b;
}
```

## Calling Methods

Call a method by its name and passing required arguments:
```csharp
int result = Add(5, 3);
Console.WriteLine(result); // Output: 8
```

## Method Parameters

- Parameters are passed by value by default.
- Use `ref` or `out` keywords to pass by reference.
- Methods can have optional parameters with default values.

**Example with optional parameter:**
```csharp
public void Greet(string name = "Guest")
{
    Console.WriteLine($"Hello, {name}!");
}
```

## Return Values

- Use `return` to send a value back to the caller.
- Methods with `void` return type do not return a value.

## Method Overloading

You can define multiple methods with the same name but different parameter lists.

**Example:**
```csharp
public int Multiply(int a, int b) { return a * b; }
public double Multiply(double a, double b) { return a * b; }
```

## Static Methods

- Belong to the class rather than an instance.
- Called using the class name.

**Example:**
```csharp
public static void PrintMessage()
{
    Console.WriteLine("Static method called.");
}
```

## Access Modifiers

- `public`: Accessible from anywhere.
- `private`: Accessible only within the class.
- `protected`: Accessible within the class and derived classes.
- `internal`: Accessible within the same assembly.

## Expression-bodied Methods (C# 6.0+)

For simple methods, you can use expression-bodied syntax:

```csharp
public int Square(int x) => x * x;
```

## Best Practices

- Use meaningful method names.
- Keep methods focused on a single task.
- Avoid long parameter lists.
- Document methods with XML comments for IntelliSense support.

---

Practice writing and calling methods to understand their behavior and usage.
