# ASP.NET MVC

ASP.NET MVC is a web application framework that implements the Model-View-Controller pattern, providing a clean separation of concerns and full control over HTML.

## MVC Architecture

- **Model**: Represents the application data and business logic.
- **View**: Responsible for rendering the UI.
- **Controller**: Handles user input, interacts with the model, and selects a view to render.

## Creating an MVC Project

```bash
dotnet new mvc -n MyMvcApp
cd MyMvcApp
dotnet run
```

## Controllers

### Basic Controller

```csharp
using Microsoft.AspNetCore.Mvc;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        return View();
    }

    public IActionResult About()
    {
        ViewData["Message"] = "Your application description page.";
        return View();
    }
}
```

### Action Methods

- Return `IActionResult` or specific result types like `ViewResult`, `JsonResult`.
- Can accept parameters from query string, route, or form data.

### Routing

- Default route: `{controller=Home}/{action=Index}/{id?}`
- Attribute routing:

```csharp
[Route("products/{id}")]
public IActionResult Details(int id)
{
    // ...
}
```

## Views

### Razor Syntax

- Combines HTML and C# code.
- Files have `.cshtml` extension.

```html
@model MyMvcApp.Models.Product

<h2>@Model.Name</h2>
<p>Price: @Model.Price.ToString("C")</p>
```

### Layouts

- Shared layout file `_Layout.cshtml` defines common page structure.
- Views use `@{ Layout = "_Layout"; }` to specify layout.

### Partial Views

- Reusable view components.

```html
@await Html.PartialAsync("_ProductSummary", Model)
```

## Models

### Defining Models

```csharp
public class Product
{
    public int Id { get; set; }
    public string Name { get; set; }
    public decimal Price { get; set; }
}
```

### Data Annotations for Validation

```csharp
using System.ComponentModel.DataAnnotations;

public class Product
{
    public int Id { get; set; }

    [Required]
    [StringLength(100)]
    public string Name { get; set; }

    [Range(0.01, 10000)]
    public decimal Price { get; set; }
}
```

## Data Access

- Use Entity Framework Core or other ORMs.
- Inject DbContext into controllers or services.

```csharp
private readonly ApplicationDbContext _context;

public ProductsController(ApplicationDbContext context)
{
    _context = context;
}

public async Task<IActionResult> Index()
{
    var products = await _context.Products.ToListAsync();
    return View(products);
}
```

## Forms and Model Binding

### Creating Forms

```html
<form asp-action="Create" method="post">
    <input asp-for="Name" />
    <span asp-validation-for="Name"></span>

    <input asp-for="Price" />
    <span asp-validation-for="Price"></span>

    <button type="submit">Create</button>
</form>
```

### Model Binding

- Automatically maps form data to action method parameters or model properties.

```csharp
[HttpPost]
public async Task<IActionResult> Create(Product product)
{
    if (ModelState.IsValid)
    {
        _context.Add(product);
        await _context.SaveChangesAsync();
        return RedirectToAction(nameof(Index));
    }
    return View(product);
}
```

## Filters

- Used to run code before or after action methods.
- Types: Authorization, Action, Result, Exception filters.

```csharp
public class LogActionFilter : IActionFilter
{
    public void OnActionExecuting(ActionExecutingContext context)
    {
        // Before action executes
    }

    public void OnActionExecuted(ActionExecutedContext context)
    {
        // After action executes
    }
}
```

- Register filters globally or per controller/action.

## Dependency Injection

- Built-in DI container.
- Register services in `Startup.cs` or `Program.cs`.

```csharp
services.AddScoped<IProductService, ProductService>();
```

- Inject services via constructor.

## Routing

- Conventional routing in `Startup.cs` or `Program.cs`.

```csharp
app.UseEndpoints(endpoints =>
{
    endpoints.MapControllerRoute(
        name: "default",
        pattern: "{controller=Home}/{action=Index}/{id?}");
});
```

- Attribute routing for fine control.

## Error Handling

- Use `UseExceptionHandler` middleware.
- Custom error pages.

```csharp
app.UseExceptionHandler("/Home/Error");
```

## Summary

ASP.NET MVC provides a powerful, flexible framework for building web applications with clear separation of concerns. It supports rich routing, model binding, validation, dependency injection, and extensibility through filters and middleware.
