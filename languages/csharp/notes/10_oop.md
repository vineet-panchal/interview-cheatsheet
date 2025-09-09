# Object-Oriented Programming in C#

OOP organizes code around objects that encapsulate data and behavior. Key principles: encapsulation, inheritance, polymorphism, abstraction.

## Encapsulation

Hiding internal details and exposing only necessary interfaces:
```csharp
public class BankAccount
{
    private decimal balance;
    public void Deposit(decimal amount) { balance += amount; }
    public decimal GetBalance() { return balance; }
}
```

## Inheritance

Creating new classes based on existing ones:
```csharp
public class Vehicle
{
    public void Start() { Console.WriteLine("Vehicle started"); }
}

public class Car : Vehicle
{
    public void Drive() { Console.WriteLine("Car driving"); }
}
```

## Polymorphism

Treating objects of different types uniformly:
```csharp
public class Animal
{
    public virtual void Speak() { }
}

public class Dog : Animal
{
    public override void Speak() { Console.WriteLine("Woof!"); }
}

Animal animal = new Dog();
animal.Speak(); // Outputs "Woof!"
```

## Abstraction

Focusing on essential features while hiding complexity:
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

## SOLID Principles

- Single Responsibility: One reason to change.
- Open-Closed: Open for extension, closed for modification.
- Liskov Substitution: Subtypes replace base types.
- Interface Segregation: Specific interfaces over general ones.
- Dependency Inversion: Depend on abstractions.

## Best Practices

- Design with interfaces.
- Use composition over inheritance.
- Keep classes focused and cohesive.
- Implement proper error handling.

---

OOP promotes modular, reusable, and maintainable code.
