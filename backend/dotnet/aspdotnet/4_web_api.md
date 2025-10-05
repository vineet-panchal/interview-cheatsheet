# ASP.NET Web API

ASP.NET Web API is a framework for building HTTP services that can reach a broad range of clients including browsers, mobile devices, and desktop applications.

## Creating a Web API Project

```bash
dotnet new webapi -n MyWebApi
cd MyWebApi
dotnet run
```

## Controllers

### Basic API Controller

```csharp
using Microsoft.AspNetCore.Mvc;

[ApiController]
[Route("api/[controller]")]
public class ProductsController : ControllerBase
{
    // GET: api/products
    [HttpGet]
    public IEnumerable<Product> Get()
    {
        return new List<Product>
        {
            new Product { Id = 1, Name = "Product 1", Price = 10.99m },
            new Product { Id = 2, Name = "Product 2", Price = 15.49m }
        };
    }

    // GET: api/products/5
    [HttpGet("{id}")]
    public ActionResult<Product> Get(int id)
    {
        var product = Get().FirstOrDefault(p => p.Id == id);
        if (product == null)
        {
            return NotFound();
        }
        return product;
    }
}
```

## HTTP Methods and Actions

### CRUD Operations

```csharp
[ApiController]
[Route("api/[controller]")]
public class ProductsController : ControllerBase
{
    private static List<Product> _products = new List<Product>
    {
        new Product { Id = 1, Name = "Product 1", Price = 10.99m }
    };

    // GET: api/products
    [HttpGet]
    public IEnumerable<Product> GetProducts()
    {
        return _products;
    }

    // GET: api/products/5
    [HttpGet("{id}")]
    public ActionResult<Product> GetProduct(int id)
    {
        var product = _products.FirstOrDefault(p => p.Id == id);
        if (product == null)
        {
            return NotFound();
        }
        return product;
    }

    // POST: api/products
    [HttpPost]
    public ActionResult<Product> CreateProduct(Product product)
    {
        product.Id = _products.Max(p => p.Id) + 1;
        _products.Add(product);
        return CreatedAtAction(nameof(GetProduct), new { id = product.Id }, product);
    }

    // PUT: api/products/5
    [HttpPut("{id}")]
    public IActionResult UpdateProduct(int id, Product product)
    {
        var existingProduct = _products.FirstOrDefault(p => p.Id == id);
        if (existingProduct == null)
        {
            return NotFound();
        }

        existingProduct.Name = product.Name;
        existingProduct.Price = product.Price;
        return NoContent();
    }

    // DELETE: api/products/5
    [HttpDelete("{id}")]
    public IActionResult DeleteProduct(int id)
    {
        var product = _products.FirstOrDefault(p => p.Id == id);
        if (product == null)
        {
            return NotFound();
        }

        _products.Remove(product);
        return NoContent();
    }
}
```

## Model Binding and Validation

### Model Binding

```csharp
// From query string
[HttpGet("search")]
public IActionResult SearchProducts([FromQuery] string name, [FromQuery] decimal? minPrice)
{
    var query = _products.AsQueryable();

    if (!string.IsNullOrEmpty(name))
    {
        query = query.Where(p => p.Name.Contains(name));
    }

    if (minPrice.HasValue)
    {
        query = query.Where(p => p.Price >= minPrice.Value);
    }

    return Ok(query.ToList());
}

// From route
[HttpGet("category/{categoryId}/products")]
public IActionResult GetProductsByCategory(int categoryId)
{
    // Implementation
}

// From body
[HttpPost]
public IActionResult CreateProduct([FromBody] Product product)
{
    // Implementation
}
```

### Model Validation

```csharp
using System.ComponentModel.DataAnnotations;

public class Product
{
    public int Id { get; set; }

    [Required]
    [StringLength(100, MinimumLength = 2)]
    public string Name { get; set; }

    [Range(0.01, 10000.00)]
    public decimal Price { get; set; }

    [StringLength(500)]
    public string Description { get; set; }
}

[HttpPost]
public IActionResult CreateProduct(Product product)
{
    if (!ModelState.IsValid)
    {
        return BadRequest(ModelState);
    }

    // Save product
    return CreatedAtAction(nameof(GetProduct), new { id = product.Id }, product);
}
```

## Content Negotiation

### Format Selection

```csharp
// Return different formats based on Accept header
[HttpGet("{id}")]
public IActionResult GetProduct(int id)
{
    var product = _products.FirstOrDefault(p => p.Id == id);
    if (product == null)
    {
        return NotFound();
    }

    return Ok(product); // Returns JSON by default
}

// Force JSON
[HttpGet("{id}/json")]
[Produces("application/json")]
public Product GetProductJson(int id)
{
    return _products.FirstOrDefault(p => p.Id == id);
}

// Force XML
[HttpGet("{id}/xml")]
[Produces("application/xml")]
public Product GetProductXml(int id)
{
    return _products.FirstOrDefault(p => p.Id == id);
}
```

## Error Handling

### Exception Filters

```csharp
public class ApiExceptionFilter : ExceptionFilterAttribute
{
    public override void OnException(ExceptionContext context)
    {
        var exception = context.Exception;

        var error = new
        {
            Message = "An error occurred while processing your request.",
            Details = exception.Message
        };

        context.Result = new ObjectResult(error)
        {
            StatusCode = 500
        };

        context.ExceptionHandled = true;
    }
}

// Register in Startup.cs
services.AddControllers(options =>
{
    options.Filters.Add<ApiExceptionFilter>();
});
```

### Custom Error Responses

```csharp
[HttpGet("{id}")]
public IActionResult GetProduct(int id)
{
    try
    {
        var product = GetProductFromDatabase(id);
        return Ok(product);
    }
    catch (ProductNotFoundException)
    {
        return NotFound(new { Message = "Product not found" });
    }
    catch (Exception ex)
    {
        return StatusCode(500, new { Message = "Internal server error", Details = ex.Message });
    }
}
```

## Authentication and Authorization

### JWT Authentication

```csharp
[HttpPost("login")]
public IActionResult Login([FromBody] LoginModel model)
{
    // Validate credentials
    if (model.Username == "admin" && model.Password == "password")
    {
        var token = GenerateJwtToken(model.Username);
        return Ok(new { Token = token });
    }

    return Unauthorized();
}

[Authorize]
[HttpGet("protected")]
public IActionResult GetProtectedData()
{
    return Ok(new { Message = "This is protected data" });
}
```

## Dependency Injection

### Service Registration

```csharp
// In Program.cs or Startup.cs
builder.Services.AddScoped<IProductRepository, ProductRepository>();
builder.Services.AddScoped<IProductService, ProductService>();
```

### Constructor Injection

```csharp
[ApiController]
[Route("api/[controller]")]
public class ProductsController : ControllerBase
{
    private readonly IProductService _productService;

    public ProductsController(IProductService productService)
    {
        _productService = productService;
    }

    [HttpGet]
    public async Task<IActionResult> GetProducts()
    {
        var products = await _productService.GetAllProductsAsync();
        return Ok(products);
    }
}
```

## API Versioning

### URL Path Versioning

```csharp
[ApiController]
[Route("api/v{version:apiVersion}/[controller]")]
[ApiVersion("1.0")]
public class ProductsController : ControllerBase
{
    [HttpGet]
    public IActionResult Get() => Ok("Version 1.0");
}

[ApiController]
[Route("api/v{version:apiVersion}/[controller]")]
[ApiVersion("2.0")]
public class ProductsV2Controller : ControllerBase
{
    [HttpGet]
    public IActionResult Get() => Ok("Version 2.0");
}
```

### Query String Versioning

```csharp
[ApiVersion("1.0")]
[ApiVersion("2.0")]
[Route("api/[controller]")]
public class ProductsController : ControllerBase
{
    [HttpGet]
    public IActionResult Get(ApiVersion apiVersion)
    {
        if (apiVersion == ApiVersion.Parse("2.0"))
        {
            return Ok("Version 2.0");
        }
        return Ok("Version 1.0");
    }
}
```

## Documentation with Swagger

### Swagger Configuration

```csharp
// In Program.cs
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new OpenApiInfo { Title = "My API", Version = "v1" });
});

app.UseSwagger();
app.UseSwaggerUI(c =>
{
    c.SwaggerEndpoint("/swagger/v1/swagger.json", "My API V1");
});
```

### Adding XML Comments

```csharp
/// <summary>
/// Gets all products
/// </summary>
/// <returns>A list of products</returns>
[HttpGet]
[ProducesResponseType(typeof(IEnumerable<Product>), 200)]
public IEnumerable<Product> Get()
{
    return _products;
}
```

## Testing Web APIs

### Unit Testing Controllers

```csharp
public class ProductsControllerTests
{
    [Fact]
    public void GetProducts_ReturnsAllProducts()
    {
        // Arrange
        var controller = new ProductsController();

        // Act
        var result = controller.Get();

        // Assert
        var okResult = Assert.IsType<OkObjectResult>(result);
        var products = Assert.IsType<List<Product>>(okResult.Value);
        Assert.Equal(2, products.Count);
    }
}
```

### Integration Testing

```csharp
public class ProductsApiTests : IClassFixture<WebApplicationFactory<Program>>
{
    private readonly HttpClient _client;

    public ProductsApiTests(WebApplicationFactory<Program> factory)
    {
        _client = factory.CreateClient();
    }

    [Fact]
    public async Task GetProducts_ReturnsSuccessStatusCode()
    {
        var response = await _client.GetAsync("/api/products");
        response.EnsureSuccessStatusCode();
    }
}
```

## Summary

ASP.NET Web API provides a powerful framework for building RESTful HTTP services. It supports content negotiation, model binding, validation, authentication, and can be easily tested and documented. With features like dependency injection and versioning, it enables building scalable and maintainable APIs.
