# Testing in .NET

Testing is crucial for ensuring code quality and preventing regressions. .NET provides excellent testing frameworks and tools.

## Testing Frameworks

### xUnit

xUnit is a free, open-source testing framework for .NET.

```csharp
using Xunit;

public class CalculatorTests
{
    [Fact]
    public void Add_TwoNumbers_ReturnsSum()
    {
        // Arrange
        var calculator = new Calculator();
        int a = 5, b = 3;

        // Act
        int result = calculator.Add(a, b);

        // Assert
        Assert.Equal(8, result);
    }

    [Theory]
    [InlineData(1, 2, 3)]
    [InlineData(5, 5, 10)]
    [InlineData(-1, 1, 0)]
    public void Add_VariousInputs_ReturnsCorrectSum(int a, int b, int expected)
    {
        // Arrange
        var calculator = new Calculator();

        // Act
        int result = calculator.Add(a, b);

        // Assert
        Assert.Equal(expected, result);
    }
}
```

### NUnit

NUnit is another popular testing framework.

```csharp
using NUnit.Framework;

[TestFixture]
public class CalculatorTests
{
    private Calculator _calculator;

    [SetUp]
    public void Setup()
    {
        _calculator = new Calculator();
    }

    [Test]
    public void Add_TwoNumbers_ReturnsSum()
    {
        int result = _calculator.Add(5, 3);
        Assert.AreEqual(8, result);
    }

    [TestCase(1, 2, 3)]
    [TestCase(5, 5, 10)]
    public void Add_VariousInputs_ReturnsCorrectSum(int a, int b, int expected)
    {
        int result = _calculator.Add(a, b);
        Assert.AreEqual(expected, result);
    }
}
```

## Unit Testing

### Testing Pure Functions

```csharp
public class StringHelper
{
    public static string Reverse(string input)
    {
        if (string.IsNullOrEmpty(input))
            return input;

        return new string(input.Reverse().ToArray());
    }

    public static bool IsPalindrome(string input)
    {
        if (string.IsNullOrEmpty(input))
            return true;

        string reversed = Reverse(input);
        return string.Equals(input, reversed, StringComparison.OrdinalIgnoreCase);
    }
}

public class StringHelperTests
{
    [Fact]
    public void Reverse_NullOrEmpty_ReturnsSame()
    {
        Assert.Equal(null, StringHelper.Reverse(null));
        Assert.Equal("", StringHelper.Reverse(""));
    }

    [Fact]
    public void Reverse_ValidString_ReturnsReversed()
    {
        Assert.Equal("cba", StringHelper.Reverse("abc"));
        Assert.Equal("racecar", StringHelper.Reverse("racecar"));
    }

    [Theory]
    [InlineData("racecar", true)]
    [InlineData("hello", false)]
    [InlineData("", true)]
    [InlineData("A", true)]
    public void IsPalindrome_VariousInputs_ReturnsCorrectResult(string input, bool expected)
    {
        bool result = StringHelper.IsPalindrome(input);
        Assert.Equal(expected, result);
    }
}
```

### Testing Classes with Dependencies

```csharp
public interface IUserRepository
{
    User GetById(int id);
    void Save(User user);
}

public class UserService
{
    private readonly IUserRepository _userRepository;

    public UserService(IUserRepository userRepository)
    {
        _userRepository = userRepository;
    }

    public User GetUser(int id)
    {
        return _userRepository.GetById(id);
    }

    public void CreateUser(string name, string email)
    {
        if (string.IsNullOrWhiteSpace(name))
            throw new ArgumentException("Name is required");

        if (string.IsNullOrWhiteSpace(email))
            throw new ArgumentException("Email is required");

        var user = new User { Name = name, Email = email };
        _userRepository.Save(user);
    }
}
```

### Using Moq for Mocking

```csharp
using Moq;
using Xunit;

public class UserServiceTests
{
    [Fact]
    public void GetUser_ValidId_ReturnsUser()
    {
        // Arrange
        var mockRepo = new Mock<IUserRepository>();
        var expectedUser = new User { Id = 1, Name = "John" };
        mockRepo.Setup(repo => repo.GetById(1)).Returns(expectedUser);

        var service = new UserService(mockRepo.Object);

        // Act
        var result = service.GetUser(1);

        // Assert
        Assert.Equal(expectedUser, result);
        mockRepo.Verify(repo => repo.GetById(1), Times.Once);
    }

    [Fact]
    public void CreateUser_ValidData_SavesUser()
    {
        // Arrange
        var mockRepo = new Mock<IUserRepository>();
        var service = new UserService(mockRepo.Object);

        // Act
        service.CreateUser("John", "john@example.com");

        // Assert
        mockRepo.Verify(repo => repo.Save(It.Is<User>(u =>
            u.Name == "John" && u.Email == "john@example.com")), Times.Once);
    }

    [Theory]
    [InlineData("", "john@example.com")]
    [InlineData("John", "")]
    [InlineData(null, "john@example.com")]
    [InlineData("John", null)]
    public void CreateUser_InvalidData_ThrowsArgumentException(string name, string email)
    {
        // Arrange
        var mockRepo = new Mock<IUserRepository>();
        var service = new UserService(mockRepo.Object);

        // Act & Assert
        Assert.Throws<ArgumentException>(() => service.CreateUser(name, email));
        mockRepo.Verify(repo => repo.Save(It.IsAny<User>()), Times.Never);
    }
}
```

## Integration Testing

### Testing with Real Database

```csharp
public class UserRepositoryTests : IDisposable
{
    private readonly ApplicationDbContext _context;
    private readonly UserRepository _repository;

    public UserRepositoryTests()
    {
        var options = new DbContextOptionsBuilder<ApplicationDbContext>()
            .UseInMemoryDatabase("TestDb")
            .Options;

        _context = new ApplicationDbContext(options);
        _repository = new UserRepository(_context);
    }

    [Fact]
    public async Task GetById_UserExists_ReturnsUser()
    {
        // Arrange
        var user = new User { Name = "John", Email = "john@example.com" };
        _context.Users.Add(user);
        await _context.SaveChangesAsync();

        // Act
        var result = await _repository.GetByIdAsync(user.Id);

        // Assert
        Assert.NotNull(result);
        Assert.Equal("John", result.Name);
    }

    [Fact]
    public async Task Save_ValidUser_AddsToDatabase()
    {
        // Arrange
        var user = new User { Name = "Jane", Email = "jane@example.com" };

        // Act
        await _repository.SaveAsync(user);

        // Assert
        var savedUser = await _context.Users.FindAsync(user.Id);
        Assert.NotNull(savedUser);
        Assert.Equal("Jane", savedUser.Name);
    }

    public void Dispose()
    {
        _context.Database.EnsureDeleted();
        _context.Dispose();
    }
}
```

### Testing ASP.NET Core Controllers

```csharp
using Microsoft.AspNetCore.Mvc;
using Moq;
using Xunit;

public class UsersControllerTests
{
    [Fact]
    public async Task GetUser_UserExists_ReturnsOkResult()
    {
        // Arrange
        var mockService = new Mock<IUserService>();
        var expectedUser = new User { Id = 1, Name = "John" };
        mockService.Setup(service => service.GetUserByIdAsync(1))
                   .ReturnsAsync(expectedUser);

        var controller = new UsersController(mockService.Object);

        // Act
        var result = await controller.GetUser(1);

        // Assert
        var okResult = Assert.IsType<OkObjectResult>(result);
        var user = Assert.IsType<User>(okResult.Value);
        Assert.Equal("John", user.Name);
    }

    [Fact]
    public async Task GetUser_UserDoesNotExist_ReturnsNotFound()
    {
        // Arrange
        var mockService = new Mock<IUserService>();
        mockService.Setup(service => service.GetUserByIdAsync(1))
                   .ReturnsAsync((User)null);

        var controller = new UsersController(mockService.Object);

        // Act
        var result = await controller.GetUser(1);

        // Assert
        Assert.IsType<NotFoundResult>(result);
    }
}
```

## Testing Asynchronous Code

```csharp
public class AsyncService
{
    public async Task<string> GetDataAsync()
    {
        await Task.Delay(100); // Simulate async work
        return "Data";
    }

    public async Task ProcessDataAsync(string data)
    {
        if (string.IsNullOrEmpty(data))
            throw new ArgumentException("Data cannot be null or empty");

        await Task.Delay(50); // Simulate processing
    }
}

public class AsyncServiceTests
{
    [Fact]
    public async Task GetDataAsync_ReturnsData()
    {
        // Arrange
        var service = new AsyncService();

        // Act
        var result = await service.GetDataAsync();

        // Assert
        Assert.Equal("Data", result);
    }

    [Fact]
    public async Task ProcessDataAsync_ValidData_CompletesSuccessfully()
    {
        // Arrange
        var service = new AsyncService();

        // Act
        await service.ProcessDataAsync("Valid data");

        // Assert - No exception thrown
    }

    [Theory]
    [InlineData(null)]
    [InlineData("")]
    [InlineData("   ")]
    public async Task ProcessDataAsync_InvalidData_ThrowsArgumentException(string data)
    {
        // Arrange
        var service = new AsyncService();

        // Act & Assert
        await Assert.ThrowsAsync<ArgumentException>(() =>
            service.ProcessDataAsync(data));
    }
}
```

## Test Lifecycle and Setup

### xUnit Test Lifecycle

```csharp
public class DatabaseTests : IDisposable, IAsyncLifetime
{
    private readonly ApplicationDbContext _context;

    public DatabaseTests()
    {
        // Constructor - called before each test
        var options = new DbContextOptionsBuilder<ApplicationDbContext>()
            .UseInMemoryDatabase("TestDb")
            .Options;

        _context = new ApplicationDbContext(options);
    }

    public async Task InitializeAsync()
    {
        // Called once before all tests in the class
        await SeedDataAsync();
    }

    public async Task DisposeAsync()
    {
        // Called once after all tests in the class
        await _context.Database.EnsureDeletedAsync();
    }

    public void Dispose()
    {
        // Called after each test
        _context.Dispose();
    }

    private async Task SeedDataAsync()
    {
        _context.Users.AddRange(
            new User { Name = "Alice" },
            new User { Name = "Bob" }
        );
        await _context.SaveChangesAsync();
    }

    [Fact]
    public async Task GetUsers_ReturnsAllUsers()
    {
        var users = await _context.Users.ToListAsync();
        Assert.Equal(2, users.Count);
    }
}
```

## Code Coverage

### Using Coverlet

```xml
<!-- In .csproj -->
<PackageReference Include="coverlet.collector" Version="3.1.2">
  <IncludeAssets>runtime; build; native; contentfiles; analyzers; buildtransitive</IncludeAssets>
  <PrivateAssets>all</PrivateAssets>
</PackageReference>
```

```bash
# Run tests with coverage
dotnet test --collect:"XPlat Code Coverage"

# Generate HTML report
dotnet tool install -g dotnet-reportgenerator-globaltool
reportgenerator -reports:TestResults/**/*.xml -targetdir:coveragereport -reporttypes:Html
```

## Best Practices

### Test Naming Conventions

```csharp
// MethodName_Condition_ExpectedResult
[Fact]
public void CalculateTax_IncomeUnderThreshold_ReturnsZero()

// MethodName_VariousConditions_ExpectedResult
[Theory]
[InlineData(1000, 0)]
[InlineData(50000, 5000)]
public void CalculateTax_VariousIncomes_ReturnsCorrectTax(decimal income, decimal expectedTax)
```

### AAA Pattern (Arrange, Act, Assert)

```csharp
[Fact]
public void ProcessPayment_ValidPayment_Succeeds()
{
    // Arrange - Set up test data and dependencies
    var paymentService = new PaymentService();
    var payment = new Payment { Amount = 100, CardNumber = "4111111111111111" };

    // Act - Execute the method being tested
    var result = paymentService.ProcessPayment(payment);

    // Assert - Verify the expected outcome
    Assert.True(result.IsSuccessful);
    Assert.Equal(PaymentStatus.Completed, result.Status);
}
```

### Test Isolation

```csharp
[Fact]
public void AddUser_NewUser_IncreasesUserCount()
{
    // Arrange
    using var context = CreateInMemoryContext();
    var repository = new UserRepository(context);
    var user = new User { Name = "John" };

    // Act
    repository.Add(user);

    // Assert
    Assert.Equal(1, context.Users.Count());
}
```

### Testing Exceptions

```csharp
[Fact]
public void ValidateEmail_InvalidEmail_ThrowsValidationException()
{
    // Arrange
    var validator = new EmailValidator();

    // Act & Assert
    var exception = Assert.Throws<ValidationException>(() =>
        validator.Validate("invalid-email"));

    Assert.Contains("Invalid email format", exception.Message);
}
```

## Summary

Testing in .NET is comprehensive with frameworks like xUnit and NUnit, mocking libraries like Moq, and integration testing capabilities. Following best practices ensures maintainable and reliable test suites that catch bugs early and prevent regressions.
