# Object-Oriented Programming in C#

Object-Oriented Programming (OOP) is a programming paradigm that uses objects and classes to structure code. C# is a fully object-oriented language that supports all OOP principles.

## Classes and Objects

### Defining a Class

```csharp
public class Person
{
    // Fields
    private string _name;
    private int _age;

    // Properties
    public string Name
    {
        get { return _name; }
        set { _name = value; }
    }

    public int Age
    {
        get { return _age; }
        set
        {
            if (value < 0)
                throw new ArgumentException("Age cannot be negative");
            _age = value;
        }
    }

    // Constructor
    public Person(string name, int age)
    {
        Name = name;
        Age = age;
    }

    // Method
    public void Introduce()
    {
        Console.WriteLine($"Hi, I'm {Name} and I'm {Age} years old.");
    }
}
```

### Creating Objects

```csharp
// Creating objects
Person person1 = new Person("John", 30);
Person person2 = new Person("Jane", 25);

// Using objects
person1.Introduce(); // Hi, I'm John and I'm 30 years old.
person2.Introduce(); // Hi, I'm Jane and I'm 25 years old.

// Accessing properties
Console.WriteLine(person1.Name); // John
person1.Age = 31;
Console.WriteLine(person1.Age); // 31
```

## Encapsulation

Encapsulation is the bundling of data and methods that operate on that data within a single unit (class).

### Access Modifiers

```csharp
public class BankAccount
{
    // Private field - only accessible within the class
    private decimal _balance;

    // Public property with private setter
    public string AccountNumber { get; private set; }

    // Public property
    public string Owner { get; set; }

    // Constructor
    public BankAccount(string accountNumber, string owner)
    {
        AccountNumber = accountNumber;
        Owner = owner;
        _balance = 0;
    }

    // Public method
    public void Deposit(decimal amount)
    {
        if (amount <= 0)
            throw new ArgumentException("Deposit amount must be positive");

        _balance += amount;
    }

    // Public method
    public bool Withdraw(decimal amount)
    {
        if (amount <= 0)
            throw new ArgumentException("Withdrawal amount must be positive");

        if (_balance >= amount)
        {
            _balance -= amount;
            return true;
        }
        return false;
    }

    // Public method to get balance (read-only access to private field)
    public decimal GetBalance()
    {
        return _balance;
    }
}
```

## Inheritance

Inheritance allows a class to inherit properties and methods from another class.

### Base and Derived Classes

```csharp
// Base class
public class Animal
{
    public string Name { get; set; }
    public int Age { get; set; }

    public Animal(string name, int age)
    {
        Name = name;
        Age = age;
    }

    public virtual void MakeSound()
    {
        Console.WriteLine("Some generic animal sound");
    }

    public void Eat()
    {
        Console.WriteLine($"{Name} is eating.");
    }
}

// Derived class
public class Dog : Animal
{
    public string Breed { get; set; }

    public Dog(string name, int age, string breed) : base(name, age)
    {
        Breed = breed;
    }

    // Override base class method
    public override void MakeSound()
    {
        Console.WriteLine($"{Name} says: Woof!");
    }

    // New method specific to Dog
    public void Fetch()
    {
        Console.WriteLine($"{Name} is fetching the ball.");
    }
}

// Another derived class
public class Cat : Animal
{
    public Cat(string name, int age) : base(name, age) { }

    public override void MakeSound()
    {
        Console.WriteLine($"{Name} says: Meow!");
    }

    public void Climb()
    {
        Console.WriteLine($"{Name} is climbing.");
    }
}
```

### Using Inheritance

```csharp
Dog dog = new Dog("Buddy", 3, "Golden Retriever");
Cat cat = new Cat("Whiskers", 2);

dog.MakeSound(); // Buddy says: Woof!
dog.Eat();       // Buddy is eating.
dog.Fetch();     // Buddy is fetching the ball.

cat.MakeSound(); // Whiskers says: Meow!
cat.Eat();       // Whiskers is eating.
cat.Climb();     // Whiskers is climbing.

// Polymorphism - treating derived objects as base type
Animal[] animals = { dog, cat };
foreach (Animal animal in animals)
{
    animal.MakeSound(); // Calls the appropriate overridden method
}
```

## Polymorphism

Polymorphism allows objects of different classes to be treated as objects of a common base class.

### Method Overriding

```csharp
public abstract class Shape
{
    public abstract double CalculateArea();
    public abstract double CalculatePerimeter();
}

public class Circle : Shape
{
    public double Radius { get; set; }

    public Circle(double radius)
    {
        Radius = radius;
    }

    public override double CalculateArea()
    {
        return Math.PI * Radius * Radius;
    }

    public override double CalculatePerimeter()
    {
        return 2 * Math.PI * Radius;
    }
}

public class Rectangle : Shape
{
    public double Width { get; set; }
    public double Height { get; set; }

    public Rectangle(double width, double height)
    {
        Width = width;
        Height = height;
    }

    public override double CalculateArea()
    {
        return Width * Height;
    }

    public override double CalculatePerimeter()
    {
        return 2 * (Width + Height);
    }
}
```

### Using Polymorphism

```csharp
Shape[] shapes = {
    new Circle(5),
    new Rectangle(4, 6),
    new Circle(3),
    new Rectangle(2, 8)
};

foreach (Shape shape in shapes)
{
    Console.WriteLine($"Area: {shape.CalculateArea():F2}");
    Console.WriteLine($"Perimeter: {shape.CalculatePerimeter():F2}");
    Console.WriteLine();
}
```

## Abstraction

Abstraction hides complex implementation details and shows only the necessary features.

### Abstract Classes

```csharp
public abstract class Vehicle
{
    public string Make { get; set; }
    public string Model { get; set; }
    public int Year { get; set; }

    protected Vehicle(string make, string model, int year)
    {
        Make = make;
        Model = model;
        Year = year;
    }

    // Abstract method - must be implemented by derived classes
    public abstract void Start();
    public abstract void Stop();

    // Concrete method - can be used as-is or overridden
    public virtual void Honk()
    {
        Console.WriteLine("Honk! Honk!");
    }
}

public class Car : Vehicle
{
    public Car(string make, string model, int year) : base(make, model, year) { }

    public override void Start()
    {
        Console.WriteLine($"Starting the {Year} {Make} {Model} car.");
    }

    public override void Stop()
    {
        Console.WriteLine($"Stopping the {Year} {Make} {Model} car.");
    }

    public override void Honk()
    {
        Console.WriteLine("Beep! Beep!");
    }
}

public class Motorcycle : Vehicle
{
    public Motorcycle(string make, string model, int year) : base(make, model, year) { }

    public override void Start()
    {
        Console.WriteLine($"Starting the {Year} {Make} {Model} motorcycle.");
    }

    public override void Stop()
    {
        Console.WriteLine($"Stopping the {Year} {Make} {Model} motorcycle.");
    }
}
```

### Interfaces

```csharp
public interface IDriveable
{
    void Accelerate();
    void Brake();
    int CurrentSpeed { get; }
}

public interface IMaintainable
{
    void PerformMaintenance();
    DateTime LastMaintenance { get; set; }
}

public class SportsCar : Car, IDriveable, IMaintainable
{
    public int CurrentSpeed { get; private set; }
    public DateTime LastMaintenance { get; set; }

    public SportsCar(string make, string model, int year) : base(make, model, year)
    {
        CurrentSpeed = 0;
        LastMaintenance = DateTime.Now;
    }

    public void Accelerate()
    {
        CurrentSpeed += 20;
        Console.WriteLine($"Accelerating to {CurrentSpeed} mph");
    }

    public void Brake()
    {
        if (CurrentSpeed >= 10)
        {
            CurrentSpeed -= 10;
        }
        else
        {
            CurrentSpeed = 0;
        }
        Console.WriteLine($"Slowing down to {CurrentSpeed} mph");
    }

    public void PerformMaintenance()
    {
        Console.WriteLine("Performing maintenance on sports car...");
        LastMaintenance = DateTime.Now;
    }
}
```

## Static Members

Static members belong to the class rather than instances.

```csharp
public class MathHelper
{
    // Static field
    public static readonly double PI = 3.14159;

    // Static method
    public static double CalculateCircleArea(double radius)
    {
        return PI * radius * radius;
    }

    // Static property
    public static int OperationCount { get; private set; }

    // Instance method that updates static member
    public void PerformOperation()
    {
        OperationCount++;
    }
}

// Usage
double area = MathHelper.CalculateCircleArea(5);
Console.WriteLine($"Area: {area}"); // Area: 78.53975

MathHelper.OperationCount = 0; // Reset counter
MathHelper helper = new MathHelper();
helper.PerformOperation();
Console.WriteLine($"Operations performed: {MathHelper.OperationCount}"); // 1
```

## Properties

### Auto-Implemented Properties

```csharp
public class Product
{
    public string Name { get; set; }
    public decimal Price { get; set; }
    public int StockQuantity { get; set; }
}
```

### Properties with Validation

```csharp
public class Employee
{
    private string _name;
    private decimal _salary;

    public string Name
    {
        get { return _name; }
        set
        {
            if (string.IsNullOrWhiteSpace(value))
                throw new ArgumentException("Name cannot be empty");
            _name = value;
        }
    }

    public decimal Salary
    {
        get { return _salary; }
        set
        {
            if (value < 0)
                throw new ArgumentException("Salary cannot be negative");
            _salary = value;
        }
    }
}
```

### Expression-Bodied Properties

```csharp
public class Rectangle
{
    public double Width { get; set; }
    public double Height { get; set; }

    public double Area => Width * Height;
    public double Perimeter => 2 * (Width + Height);
}
```

## Constructors

### Default Constructor

```csharp
public class Point
{
    public int X { get; set; }
    public int Y { get; set; }

    // Default constructor
    public Point()
    {
        X = 0;
        Y = 0;
    }
}
```

### Parameterized Constructor

```csharp
public class Point
{
    public int X { get; set; }
    public int Y { get; set; }

    public Point(int x, int y)
    {
        X = x;
        Y = y;
    }
}
```

### Constructor Overloading

```csharp
public class Point
{
    public int X { get; set; }
    public int Y { get; set; }

    public Point() : this(0, 0) { }

    public Point(int x, int y)
    {
        X = x;
        Y = y;
    }
}
```

### Static Constructor

```csharp
public class DatabaseConnection
{
    public static string ConnectionString { get; private set; }

    static DatabaseConnection()
    {
        // Initialize static members
        ConnectionString = "Server=myServer;Database=myDB;User Id=myUser;Password=myPass;";
    }
}
```

## Destructors (Finalizers)

```csharp
public class FileHandler
{
    private FileStream _fileStream;

    public FileHandler(string filePath)
    {
        _fileStream = new FileStream(filePath, FileMode.Open);
    }

    // Destructor - called by garbage collector
    ~FileHandler()
    {
        Dispose(false);
    }

    public void Dispose()
    {
        Dispose(true);
        GC.SuppressFinalize(this);
    }

    protected virtual void Dispose(bool disposing)
    {
        if (disposing)
        {
            // Dispose managed resources
            _fileStream?.Dispose();
        }
        // Dispose unmanaged resources
    }
}
```

## Summary

Object-oriented programming in C# involves classes, objects, encapsulation, inheritance, polymorphism, and abstraction. These concepts help create modular, maintainable, and reusable code. Understanding OOP principles is fundamental to effective C# development in .NET applications.
