# Working with Strings in C#

Strings are sequences of characters used to represent text. C# provides the `string` type for handling strings, which is immutable.

## String Literals

- Use double quotes: `"Hello World"`
- Verbatim strings with `@`: `@"C:\Path\To\File"`
- Raw string literals (C# 11+): `"""Multi-line string"""`

## String Concatenation

Combine strings using the `+` operator:
```csharp
string greeting = "Hello" + " " + "World";
```

## String Interpolation

Use `$` for embedding expressions:
```csharp
string name = "Alice";
string message = $"Hello, {name}!";
```

## Common String Methods

- `Length`: Get the number of characters.
- `Substring(startIndex, length)`: Extract a portion.
- `IndexOf(char/string)`: Find the position of a character or substring.
- `Replace(oldValue, newValue)`: Replace occurrences.
- `ToUpper()` / `ToLower()`: Change case.
- `Trim()`: Remove whitespace.
- `Split(separator)`: Split into an array.
- `Contains(substring)`: Check if substring exists.
- `StartsWith(prefix)` / `EndsWith(suffix)`: Check prefixes/suffixes.

**Example:**
```csharp
string text = "Hello, World!";
Console.WriteLine(text.Length); // 13
Console.WriteLine(text.Substring(7, 5)); // "World"
Console.WriteLine(text.ToUpper()); // "HELLO, WORLD!"
```

## String Comparison

- Use `==` for reference equality (not recommended for strings).
- Use `Equals()` or `String.Compare()` for value comparison.
- `StringComparison.Ordinal` for case-sensitive, `StringComparison.OrdinalIgnoreCase` for case-insensitive.

**Example:**
```csharp
string a = "Hello";
string b = "hello";
Console.WriteLine(a.Equals(b, StringComparison.OrdinalIgnoreCase)); // True
```

## StringBuilder for Performance

For frequent modifications, use `StringBuilder`:
```csharp
using System.Text;

StringBuilder sb = new StringBuilder();
sb.Append("Hello");
sb.Append(" ");
sb.Append("World");
string result = sb.ToString(); // "Hello World"
```

## Formatting Strings

Use `string.Format()` or interpolation:
```csharp
string formatted = string.Format("Name: {0}, Age: {1}", "Alice", 30);
string interpolated = $"Name: {"Alice"}, Age: {30}";
```

## Best Practices

- Strings are immutable; avoid excessive concatenation in loops.
- Use `StringBuilder` for building strings dynamically.
- Be mindful of culture-specific comparisons.
- Use `string.IsNullOrEmpty()` or `string.IsNullOrWhiteSpace()` for validation.

---

Experiment with string operations to handle text data effectively in your applications.
