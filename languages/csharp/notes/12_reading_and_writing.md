# Reading and Writing Files in C#

C# provides classes in the `System.IO` namespace to work with files and directories.

## Reading Files

### Reading All Text
```csharp
string content = File.ReadAllText("file.txt");
Console.WriteLine(content);
```

### Reading Lines
```csharp
string[] lines = File.ReadAllLines("file.txt");
foreach (string line in lines)
{
    Console.WriteLine(line);
}
```

### Using StreamReader
```csharp
using (StreamReader reader = new StreamReader("file.txt"))
{
    string line;
    while ((line = reader.ReadLine()) != null)
    {
        Console.WriteLine(line);
    }
}
```

## Writing Files

### Writing All Text
```csharp
File.WriteAllText("file.txt", "Hello, World!");
```

### Writing Lines
```csharp
string[] lines = { "Line1", "Line2", "Line3" };
File.WriteAllLines("file.txt", lines);
```

### Using StreamWriter
```csharp
using (StreamWriter writer = new StreamWriter("file.txt"))
{
    writer.WriteLine("First line");
    writer.WriteLine("Second line");
}
```

## Appending to Files

```csharp
File.AppendAllText("file.txt", "Appended text\n");
```

## File and Directory Info

- `File.Exists(path)`: Check if file exists.
- `Directory.Exists(path)`: Check if directory exists.
- `File.Delete(path)`: Delete a file.
- `Directory.CreateDirectory(path)`: Create directory.

## Exception Handling

Always handle exceptions like `IOException` and `UnauthorizedAccessException`.

## Best Practices

- Use `using` statements to ensure streams are closed.
- Validate file paths and permissions.
- Handle exceptions gracefully.
- Prefer async methods (`ReadAllTextAsync`, etc.) for large files or UI apps.

---

File I/O is essential for data persistence and interaction with external resources.
