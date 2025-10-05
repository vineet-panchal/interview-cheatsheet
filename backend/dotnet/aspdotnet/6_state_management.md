# State Management in ASP.NET

State management is crucial in web applications since HTTP is stateless. ASP.NET provides various mechanisms to maintain state across requests.

## Client-Side State Management

### View State (Web Forms)

```csharp
// Store data in ViewState
protected void Page_Load(object sender, EventArgs e)
{
    if (!IsPostBack)
    {
        ViewState["Counter"] = 0;
        lblCounter.Text = "0";
    }
}

protected void btnIncrement_Click(object sender, EventArgs e)
{
    int counter = (int)ViewState["Counter"];
    counter++;
    ViewState["Counter"] = counter;
    lblCounter.Text = counter.ToString();
}
```

### Hidden Fields

```html
<asp:HiddenField ID="hfUserId" runat="server" />
```

```csharp
// Store and retrieve
hfUserId.Value = userId.ToString();
int userId = int.Parse(hfUserId.Value);
```

### Cookies

```csharp
// Create cookie
HttpCookie userCookie = new HttpCookie("UserInfo");
userCookie["Name"] = "John Doe";
userCookie["Email"] = "john@example.com";
userCookie.Expires = DateTime.Now.AddDays(30);
Response.Cookies.Add(userCookie);

// Read cookie
if (Request.Cookies["UserInfo"] != null)
{
    string name = Request.Cookies["UserInfo"]["Name"];
    string email = Request.Cookies["UserInfo"]["Email"];
}

// Delete cookie
HttpCookie cookie = new HttpCookie("UserInfo");
cookie.Expires = DateTime.Now.AddDays(-1);
Response.Cookies.Add(cookie);
```

### Query Strings

```csharp
// Pass data via URL
Response.Redirect($"EditUser.aspx?id={userId}&mode=edit");

// Read query string
int userId = int.Parse(Request.QueryString["id"]);
string mode = Request.QueryString["mode"];
```

## Server-Side State Management

### Session State

```csharp
// Store in session
Session["UserId"] = userId;
Session["UserName"] = userName;
Session["Cart"] = shoppingCart;

// Retrieve from session
int userId = (int)Session["UserId"];
string userName = (string)Session["UserName"];
ShoppingCart cart = (ShoppingCart)Session["Cart"];

// Remove from session
Session.Remove("UserName");

// Clear session
Session.Clear();
Session.Abandon();
```

### Session Configuration

```xml
<!-- Web.config -->
<configuration>
  <system.web>
    <sessionState mode="InProc" timeout="20" />
  </system.web>
</configuration>
```

### Application State

```csharp
// Global.asax
void Application_Start(object sender, EventArgs e)
{
    Application["VisitorCount"] = 0;
    Application["AppStartTime"] = DateTime.Now;
}

// Access application state
Application.Lock();
int visitorCount = (int)Application["VisitorCount"];
visitorCount++;
Application["VisitorCount"] = visitorCount;
Application.UnLock();
```

### Cache

```csharp
// Add to cache
Cache["Products"] = productList;
Cache.Insert("ExpensiveData", data, null,
    DateTime.Now.AddMinutes(10), Cache.NoSlidingExpiration);

// Retrieve from cache
var products = Cache["Products"] as List<Product>;
if (products == null)
{
    products = GetProductsFromDatabase();
    Cache["Products"] = products;
}

// Remove from cache
Cache.Remove("Products");
```

## ASP.NET Core State Management

### Session in ASP.NET Core

```csharp
// Startup.cs or Program.cs
builder.Services.AddDistributedMemoryCache();
builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromMinutes(30);
    options.Cookie.HttpOnly = true;
    options.Cookie.IsEssential = true;
});

app.UseSession();

// Controller
public class HomeController : Controller
{
    public IActionResult Index()
    {
        HttpContext.Session.SetString("Name", "John");
        HttpContext.Session.SetInt32("Age", 30);

        return View();
    }

    public IActionResult GetSession()
    {
        string name = HttpContext.Session.GetString("Name");
        int? age = HttpContext.Session.GetInt32("Age");

        return View();
    }
}
```

### TempData

```csharp
// Store message for next request
TempData["SuccessMessage"] = "User created successfully!";

// Retrieve in next request
if (TempData["SuccessMessage"] != null)
{
    ViewBag.Message = TempData["SuccessMessage"];
}
```

### ViewData and ViewBag

```csharp
// Controller
public IActionResult Index()
{
    ViewData["Title"] = "Home Page";
    ViewBag.Subtitle = "Welcome";

    return View();
}

// View
<h1>@ViewData["Title"]</h1>
<h2>@ViewBag.Subtitle</h2>
```

## Distributed State Management

### Redis Cache

```csharp
// Startup.cs or Program.cs
builder.Services.AddStackExchangeRedisCache(options =>
{
    options.Configuration = "localhost:6379";
});

// Usage
public class CacheService
{
    private readonly IDistributedCache _cache;

    public CacheService(IDistributedCache cache)
    {
        _cache = cache;
    }

    public async Task SetAsync(string key, string value)
    {
        await _cache.SetStringAsync(key, value,
            new DistributedCacheEntryOptions
            {
                AbsoluteExpirationRelativeToNow = TimeSpan.FromMinutes(10)
            });
    }

    public async Task<string> GetAsync(string key)
    {
        return await _cache.GetStringAsync(key);
    }
}
```

### SQL Server Session State

```csharp
// Startup.cs or Program.cs
builder.Services.AddDistributedSqlServerCache(options =>
{
    options.ConnectionString = builder.Configuration.GetConnectionString("DefaultConnection");
    options.SchemaName = "dbo";
    options.TableName = "SessionCache";
});

builder.Services.AddSession();
```

## State Management Best Practices

### When to Use Each Method

- **ViewState**: Small amounts of data for a single page
- **Session**: User-specific data across multiple pages
- **Cookies**: Small amounts of data that need to persist
- **Cache**: Expensive data that can be shared across users
- **QueryString**: Small amounts of data passed between pages

### Security Considerations

```csharp
// Secure cookies
HttpCookie secureCookie = new HttpCookie("SecureData");
secureCookie.Value = encryptedData;
secureCookie.HttpOnly = true; // Prevent client-side access
secureCookie.Secure = true;   // HTTPS only
secureCookie.Expires = DateTime.Now.AddHours(1);
Response.Cookies.Add(secureCookie);
```

### Performance Considerations

```csharp
// Cache expensive operations
[OutputCache(Duration = 300, VaryByParam = "none")]
public ActionResult ExpensiveOperation()
{
    // Expensive database query or calculation
    return View();
}

// Session state can impact performance
// Use session sparingly and consider alternatives
```

## Custom State Management

### Custom Session Provider

```csharp
public class CustomSessionProvider : ISessionStore
{
    public async Task<ISession> CreateAsync(string sessionKey, TimeSpan idleTimeout,
        TimeSpan ioTimeout, Func<bool> tryEstablishSession, bool isNewSessionKey)
    {
        // Custom session creation logic
    }

    public async Task<ISession> GetAsync(string sessionKey, TimeSpan idleTimeout,
        TimeSpan ioTimeout, Func<bool> tryEstablishSession)
    {
        // Custom session retrieval logic
    }
}
```

### State Management Service

```csharp
public interface IStateService
{
    Task<T> GetAsync<T>(string key);
    Task SetAsync<T>(string key, T value, TimeSpan? expiration = null);
    Task RemoveAsync(string key);
}

public class RedisStateService : IStateService
{
    private readonly IDistributedCache _cache;

    public RedisStateService(IDistributedCache cache)
    {
        _cache = cache;
    }

    public async Task<T> GetAsync<T>(string key)
    {
        var data = await _cache.GetStringAsync(key);
        return data == null ? default : JsonConvert.DeserializeObject<T>(data);
    }

    public async Task SetAsync<T>(string key, T value, TimeSpan? expiration = null)
    {
        var data = JsonConvert.SerializeObject(value);
        var options = new DistributedCacheEntryOptions();

        if (expiration.HasValue)
        {
            options.AbsoluteExpirationRelativeToNow = expiration.Value;
        }

        await _cache.SetStringAsync(key, data, options);
    }

    public async Task RemoveAsync(string key)
    {
        await _cache.RemoveAsync(key);
    }
}
```

## Summary

ASP.NET provides multiple state management options for different scenarios. Choose the appropriate method based on data size, persistence requirements, performance needs, and security considerations. Always consider scalability and security when implementing state management in your applications.
