# More on Classes and Custom Types in C#

Building on basic classes, this covers advanced features like inheritance, polymorphism, interfaces, and abstract classes.

## Inheritance

Derive a class from another to reuse code:
```csharp
public class Animal
{
    public void Eat() { Console.WriteLine("Eating..."); }
}

public class Dog : Animal
{
    public void Bark() { Console.WriteLine("Woof!"); }
}
```

## Polymorphism

- Method overriding: Redefine base class methods.
- Use `virtual` in base, `override` in derived.

**Example:**
```csharp
public class Animal
{
    public virtual void Speak() { Console.WriteLine("Animal sound"); }
}

public class Dog : Animal
{
    public override void Speak() { Console.WriteLine("Woof!"); }
}
```

## Interfaces

Define contracts for classes:
```csharp
public interface IAnimal
{
    void Speak();
}

public class Dog : IAnimal
{
    public void Speak() { Console.WriteLine("Woof!"); }
}
```

## Abstract Classes

Cannot be instantiated; serve as base classes:
```csharp
public abstract class Shape
{
    public abstract double Area();
}

public class Circle : Shape
{
    public double Radius { get; set; }
    public override double Area() => Math.PI * Radius * Radius;
}
```

## Sealed Classes

Prevent inheritance:
```csharp
public sealed class FinalClass
{
    // Cannot be inherited
}
```

## Partial Classes

Split class definition across files:
```csharp
// File1.cs
public partial class MyClass
{
    public void Method1() { }
}

// File2.cs
public partial class MyClass
{
    public void Method2() { }
}
```

## Generics

Create type-safe classes:
```csharp
public class GenericList<T>
{
    private List<T> items = new List<T>();
    public void Add(T item) { items.Add(item); }
}
```

## Best Practices

- Favor composition over inheritance.
- Use interfaces for loose coupling.
- Implement `IEquatable<T>` for custom equality.
- Use generics for reusable code.

---

These features enable flexible and maintainable code structures.
