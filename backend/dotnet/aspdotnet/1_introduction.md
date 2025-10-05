# Introduction to ASP.NET

ASP.NET is Microsoft's web development framework for building dynamic web applications, web services, and websites. It provides a comprehensive platform for creating robust, scalable, and secure web solutions.

## What is ASP.NET?

ASP.NET is a server-side web application framework designed for web development to produce dynamic web pages. It was first released in 2002 as part of the .NET Framework and has evolved significantly over the years.

### Key Features

- **Server-side processing**: Code executes on the server, generating HTML sent to the client
- **Compiled code**: Better performance compared to interpreted languages
- **Rich controls**: Pre-built UI components for rapid development
- **State management**: Built-in mechanisms for maintaining state across requests
- **Security**: Integrated authentication and authorization features
- **Extensibility**: Highly customizable and extensible framework

## ASP.NET Evolution

### ASP.NET Web Forms (2002)

The original ASP.NET framework focused on rapid application development with a component-based model similar to Windows Forms.

```csharp
// Web Forms code-behind
public partial class Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Initialize page
            lblMessage.Text = "Welcome to ASP.NET Web Forms!";
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        lblMessage.Text = $"Hello, {txtName.Text}!";
    }
}
```

### ASP.NET MVC (2009)

Introduced the Model-View-Controller pattern, providing better separation of concerns and testability.

```csharp
// MVC Controller
public class HomeController : Controller
{
    public ActionResult Index()
    {
        ViewBag.Message = "Welcome to ASP.NET MVC!";
        return View();
    }

    [HttpPost]
    public ActionResult Contact(ContactViewModel model)
    {
        if (ModelState.IsValid)
        {
            // Process form
            return RedirectToAction("ThankYou");
        }
        return View(model);
    }
}
```

### ASP.NET Web API (2012)

Framework for building HTTP services that can reach a broad range of clients including browsers and mobile devices.

```csharp
// Web API Controller
public class ProductsController : ApiController
{
    private readonly IProductRepository _repository;

    public ProductsController(IProductRepository repository)
    {
        _repository = repository;
    }

    // GET api/products
    public IEnumerable<Product> Get()
    {
        return _repository.GetAll();
    }

    // GET api/products/5
    public Product Get(int id)
    {
        return _repository.GetById(id);
    }

    // POST api/products
    public void Post([FromBody] Product product)
    {
        _repository.Add(product);
    }
}
```

### ASP.NET Core (2016)

A complete rewrite that is cross-platform, high-performance, and modular. It unifies MVC and Web API into a single framework.

```csharp
// ASP.NET Core Controller
[ApiController]
[Route("api/[controller]")]
public class WeatherController : ControllerBase
{
    [HttpGet]
    public IEnumerable<WeatherForecast> Get()
    {
        // Implementation
    }
}
```

## ASP.NET Architecture

### HTTP Pipeline

ASP.NET processes HTTP requests through a pipeline of modules and handlers:

1. **Request arrives** at the web server (IIS, Apache, etc.)
2. **HTTP Modules** process the request (authentication, caching, etc.)
3. **HTTP Handler** processes the request and generates response
4. **Response** sent back to client

### Page Lifecycle (Web Forms)

1. **Page Request**: User requests a page
2. **Start**: Page properties initialized
3. **Initialization**: Controls created and initialized
4. **Load**: View state and control state loaded
5. **Postback event handling**: Events processed
6. **Rendering**: Page rendered to HTML
7. **Unload**: Cleanup performed

### MVC Request Flow

1. **Routing**: URL mapped to controller action
2. **Controller**: Action method executed
3. **Model**: Data retrieved/manipulated
4. **View**: Response rendered
5. **Result**: Response sent to client

## Key Components

### Web Forms Components

- **Pages (.aspx)**: UI templates
- **Code-behind (.aspx.cs)**: Server-side logic
- **Master Pages**: Layout templates
- **User Controls**: Reusable UI components
- **Server Controls**: Rich UI components

### MVC Components

- **Models**: Data and business logic
- **Views**: UI templates (Razor syntax)
- **Controllers**: Request handling logic
- **Routes**: URL mapping configuration

### Shared Components

- **Global.asax**: Application-level events
- **Web.config**: Configuration settings
- **Session State**: User session management
- **Cache**: Performance optimization
- **Membership**: User authentication and authorization

## Development Environment

### Visual Studio

Integrated Development Environment (IDE) with rich ASP.NET support:

- **Project templates**: Pre-configured project structures
- **IntelliSense**: Code completion and syntax highlighting
- **Debugging**: Step-through debugging capabilities
- **Designers**: Visual designers for Web Forms
- **NuGet**: Package management

### Visual Studio Code

Lightweight, cross-platform editor with ASP.NET extensions:

- **C# extension**: Language support
- **ASP.NET Core extension**: Project templates and debugging
- **OmniSharp**: .NET language server

## Hosting Options

### Internet Information Services (IIS)

Microsoft's web server for Windows:

```xml
<!-- Web.config for IIS -->
<configuration>
  <system.webServer>
    <handlers>
      <add name="aspNetCore" path="*" verb="*" modules="AspNetCoreModuleV2" resourceType="Unspecified" />
    </handlers>
    <aspNetCore processPath="dotnet" arguments=".\MyApp.dll" stdoutLogEnabled="false" />
  </system.webServer>
</configuration>
```

### Self-Hosting

ASP.NET applications can run as console applications:

```csharp
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;

public class Program
{
    public static void Main(string[] args)
    {
        CreateHostBuilder(args).Build().Run();
    }

    public static IHostBuilder CreateHostBuilder(string[] args) =>
        Host.CreateDefaultBuilder(args)
            .ConfigureWebHostDefaults(webBuilder =>
            {
                webBuilder.UseStartup<Startup>();
            });
}
```

### Cloud Hosting

- **Azure App Service**: Platform-as-a-Service
- **AWS Elastic Beanstalk**: Managed hosting
- **Google App Engine**: Application hosting

## Configuration

### Web.config (Traditional ASP.NET)

```xml
<?xml version="1.0"?>
<configuration>
  <appSettings>
    <add key="ConnectionString" value="Server=.;Database=MyDB;Integrated Security=True;" />
  </appSettings>

  <system.web>
    <compilation debug="true" targetFramework="4.8" />
    <authentication mode="Forms" />
    <sessionState mode="InProc" timeout="20" />
  </system.web>

  <connectionStrings>
    <add name="DefaultConnection" connectionString="..." providerName="System.Data.SqlClient" />
  </connectionStrings>
</configuration>
```

### appsettings.json (ASP.NET Core)

```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=.;Database=MyDB;Integrated Security=True;"
  },
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft": "Warning"
    }
  },
  "AllowedHosts": "*"
}
```

## Getting Started

### Creating Your First ASP.NET Application

1. **Install .NET SDK**
   ```bash
   # Download from https://dotnet.microsoft.com/download
   dotnet --version
   ```

2. **Create a new project**
   ```bash
   # Web Forms
   dotnet new webforms -n MyWebFormsApp

   # MVC
   dotnet new mvc -n MyMvcApp

   # Web API
   dotnet new webapi -n MyApiApp

   # ASP.NET Core
   dotnet new webapp -n MyAspNetCoreApp
   ```

3. **Run the application**
   ```bash
   cd MyAspNetCoreApp
   dotnet run
   ```

4. **Open in browser**
   Navigate to `https://localhost:5001`

## Summary

ASP.NET has evolved from Web Forms to the modern, cross-platform ASP.NET Core framework. It provides developers with powerful tools for building web applications, from simple websites to complex enterprise systems. Understanding the different ASP.NET models and their appropriate use cases is key to successful web development with .NET.
