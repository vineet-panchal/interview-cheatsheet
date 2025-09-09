# Testing in C#

Testing ensures code reliability. Focus on unit tests, integration tests, and test-driven development (TDD).

## Unit Testing

Test individual components in isolation:
```csharp
[Test]
public void Add_ShouldReturnSum()
{
    Calculator calc = new Calculator();
    int result = calc.Add(2, 3);
    Assert.AreEqual(5, result);
}
```

## Testing Frameworks

- NUnit: Popular, attribute-based.
- MSTest: Microsoft's framework.
- xUnit: Modern, extensible.

## Arrange-Act-Assert Pattern

- Arrange: Set up test data.
- Act: Execute the code under test.
- Assert: Verify the result.

## Mocking

Use Moq for dependencies:
```csharp
var mockService = new Mock<IService>();
mockService.Setup(s => s.GetData()).Returns("Mocked Data");

var controller = new MyController(mockService.Object);
```

## Integration Testing

Test interactions between components:
```csharp
[Test]
public void DatabaseIntegrationTest()
{
    // Test database operations
}
```

## Test-Driven Development (TDD)

- Write test first, then code.
- Red-Green-Refactor cycle.

## Best Practices

- Test public methods.
- Use descriptive test names.
- Keep tests independent.
- Run tests frequently.
- Aim for high code coverage.

---

Testing builds confidence in your code and facilitates refactoring.
