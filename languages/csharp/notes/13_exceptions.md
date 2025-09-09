# Exceptions in C#

Exceptions handle runtime errors gracefully, preventing program crashes.

## Try-Catch Blocks

```csharp
try
{
    // Code that might throw an exception
    int result = 10 / 0;
}
catch (DivideByZeroException ex)
{
    Console.WriteLine($"Error: {ex.Message}");
}
finally
{
    // Always executed
    Console.WriteLine("Cleanup code");
}
```

## Common Exceptions

- `ArgumentException`: Invalid argument.
- `IOException`: File I/O errors.
- `NullReferenceException`: Accessing null object.
- `IndexOutOfRangeException`: Invalid array index.

## Throwing Exceptions

```csharp
if (value < 0)
{
    throw new ArgumentException("Value must be non-negative");
}
```

## Custom Exceptions

```csharp
public class CustomException : Exception
{
    public CustomException(string message) : base(message) { }
}
```

## Best Practices

- Catch specific exceptions.
- Use `finally` for cleanup.
- Don't catch `Exception` broadly.
- Log exceptions for debugging.
- Use `throw;` to re-throw without losing stack trace.

---

Proper exception handling improves application robustness and user experience.
