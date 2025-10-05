# ASP.NET Core

ASP.NET Core is a cross-platform, high-performance framework for building modern, cloud-based, internet-connected applications.

## Key Features

- Cross-platform (Windows, macOS, Linux)
- Unified MVC and Web API frameworks
- Dependency Injection built-in
- Middleware pipeline for request processing
- Razor Pages for page-focused scenarios
- Support for gRPC, SignalR, WebSockets
- Integration with modern frontend frameworks

## Creating a New ASP.NET Core Project

```bash
dotnet new webapi -n MyApi
cd MyApi
dotnet run
```

## Project Structure

- **Program.cs**: Entry point, configures web host and middleware.
- **Startup.cs** (optional in .NET 6+): Configures services and middleware.
- **Controllers/**: Contains API controllers.
- **appsettings.json**: Configuration file.
- **Properties/**: Project properties.

## Minimal APIs (introduced in .NET 6)

```csharp
var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", () => "Hello World!");

app.MapGet("/weather", () =>
{
    return new[] { "Sunny", "Cloudy", "Rainy" };
});

app.Run();
```

## Controllers and Routing

### Creating a Controller

```csharp
using Microsoft.AspNetCore.Mvc;

[ApiController]
[Route("api/[controller]")]
public class WeatherForecastController : ControllerBase
{
    private static readonly string[] Summaries = new[]
    {
        "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
    };

    [HttpGet]
    public IEnumerable<WeatherForecast> Get()
    {
        var rng = new Random();
        return Enumerable.Range(1, 5).Select(index => new WeatherForecast
        {
            Date = DateTime.Now.AddDays(index),
            TemperatureC = rng.Next(-20, 55),
            Summary = Summaries[rng.Next(Summaries.Length)]
        })
        .ToArray();
    }
}
```

### Routing Attributes

- `[Route("api/[controller]")]`: Base route for controller.
- `[HttpGet]`, `[HttpPost]`, `[HttpPut]`, `[HttpDelete]`: HTTP method attributes.
- Route parameters: `[HttpGet("{id}")]`

## Dependency Injection

### Registering Services

```csharp
public interface IGreetingService
{
    string Greet(string name);
}

public class GreetingService : IGreetingService
{
    public string Greet(string name) => $"Hello, {name}!";
}

// In Program.cs or Startup.cs
builder.Services.AddScoped<IGreetingService, GreetingService>();
```

### Injecting Services

```csharp
[ApiController]
[Route("api/[controller]")]
public class GreetingController : ControllerBase
{
    private readonly IGreetingService _greetingService;

    public GreetingController(IGreetingService greetingService)
    {
        _greetingService = greetingService;
    }

    [HttpGet("{name}")]
    public string Get(string name)
    {
        return _greetingService.Greet(name);
    }
}
```

## Middleware

### Adding Middleware

```csharp
var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.Use(async (context, next) =>
{
    Console.WriteLine("Request incoming");
    await next.Invoke();
    Console.WriteLine("Response outgoing");
});

app.MapGet("/", () => "Hello World!");

app.Run();
```

### Built-in Middleware

- `UseRouting()`
- `UseAuthentication()`
- `UseAuthorization()`
- `UseEndpoints()`
- `UseStaticFiles()`
- `UseCors()`

## Configuration

### appsettings.json

```json
{
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft": "Warning"
    }
  },
  "AllowedHosts": "*",
  "ConnectionStrings": {
    "DefaultConnection": "Server=.;Database=MyDb;Trusted_Connection=True;"
  }
}
```

### Accessing Configuration

```csharp
public class MyService
{
    private readonly IConfiguration _configuration;

    public MyService(IConfiguration configuration)
    {
        _configuration = configuration;
    }

    public string GetConnectionString()
    {
        return _configuration.GetConnectionString("DefaultConnection");
    }
}
```

## Logging

### Using ILogger

```csharp
public class WeatherForecastController : ControllerBase
{
    private readonly ILogger<WeatherForecastController> _logger;

    public WeatherForecastController(ILogger<WeatherForecastController> logger)
    {
        _logger = logger;
    }

    [HttpGet]
    public IEnumerable<WeatherForecast> Get()
    {
        _logger.LogInformation("Fetching weather forecast");
        // ...
    }
}
```

## Model Binding and Validation

### Model Binding

```csharp
public class User
{
    public string Name { get; set; }
    public int Age { get; set; }
}

[HttpPost]
public IActionResult CreateUser([FromBody] User user)
{
    // user is automatically bound from JSON body
}
```

### Data Annotations for Validation

```csharp
using System.ComponentModel.DataAnnotations;

public class User
{
    [Required]
    public string Name { get; set; }

    [Range(0, 120)]
    public int Age { get; set; }
}

[HttpPost]
public IActionResult CreateUser([FromBody] User user)
{
    if (!ModelState.IsValid)
    {
        return BadRequest(ModelState);
    }
    // Process user
}
```

## Entity Framework Core

### Basic Usage

```csharp
public class ApplicationDbContext : DbContext
{
    public DbSet<User> Users { get; set; }

    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
        : base(options)
    {
    }
}
```

### Registering DbContext

```csharp
builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));
```

### CRUD Operations

```csharp
// Create
var user = new User { Name = "John", Age = 30 };
context.Users.Add(user);
await context.SaveChangesAsync();

// Read
var users = await context.Users.ToListAsync();

// Update
user.Name = "John Doe";
context.Users.Update(user);
await context.SaveChangesAsync();

// Delete
context.Users.Remove(user);
await context.SaveChangesAsync();
```

## Testing ASP.NET Core Applications

### Unit Testing Controllers

```csharp
[Fact]
public void Get_ReturnsWeatherForecasts()
{
    var logger = new Mock<ILogger<WeatherForecastController>>();
    var controller = new WeatherForecastController(logger.Object);

    var result = controller.Get();

    Assert.NotNull(result);
    Assert.Equal(5, result.Count());
}
```

### Integration Testing

```csharp
public class IntegrationTests : IClassFixture<WebApplicationFactory<Program>>
{
    private readonly HttpClient _client;

    public IntegrationTests(WebApplicationFactory<Program> factory)
    {
        _client = factory.CreateClient();
    }

    [Fact]
    public async Task GetRoot_ReturnsHelloWorld()
    {
        var response = await _client.GetAsync("/");
        response.EnsureSuccessStatusCode();

        var content = await response.Content.ReadAsStringAsync();
        Assert.Equal("Hello World!", content);
    }
}
```

## Summary

ASP.NET Core is a powerful framework for building web APIs and web applications. It supports modern development practices such as dependency injection, middleware, configuration, logging, and testing. With its cross-platform capabilities and high performance, it is widely used for cloud and enterprise applications.
