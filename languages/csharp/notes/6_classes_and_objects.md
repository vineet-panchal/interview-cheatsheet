# Classes and Objects in C#

Classes are blueprints for creating objects, which are instances of classes. Objects encapsulate data and behavior.

## Defining a Class

**Syntax:**
```csharp
[access_modifier] class ClassName
{
    // Fields, properties, methods, etc.
}
```

**Example:**
```csharp
public class Person
{
    // Fields
    private string name;
    private int age;

    // Constructor
    public Person(string name, int age)
    {
        this.name = name;
        this.age = age;
    }

    // Method
    public void Introduce()
    {
        Console.WriteLine($"Hi, I'm {name} and I'm {age} years old.");
    }
}
```

## Creating Objects

Use the `new` keyword to instantiate objects:
```csharp
Person person = new Person("Alice", 30);
person.Introduce();
```

## Constructors

- Default constructor: Provided automatically if no constructors are defined.
- Parameterized constructors: Initialize object state.
- Static constructors: Initialize static members.

**Example of parameterized constructor:**
```csharp
public Person(string name, int age)
{
    this.name = name;
    this.age = age;
}
```

## Properties

Provide controlled access to fields:
```csharp
public string Name
{
    get { return name; }
    set { name = value; }
}

public int Age { get; set; } // Auto-implemented property
```

## Fields and Methods

- Fields: Store data.
- Methods: Define behavior.
- Static members: Belong to the class, not instances.

## Object Initialization

Use object initializers:
```csharp
Person person = new Person { Name = "Bob", Age = 25 };
```

## Destructors (Finalizers)

Rarely used; for cleanup:
```csharp
~Person()
{
    // Cleanup code
}
```

## Best Practices

- Use meaningful class and member names.
- Encapsulate data with properties.
- Prefer composition over inheritance.
- Implement `IDisposable` for resources.

---

Classes and objects are fundamental to object-oriented programming in C#.
