# Authentication and Authorization in ASP.NET

Authentication and authorization are crucial security features in ASP.NET applications. Authentication verifies user identity, while authorization determines what authenticated users can do.

## Authentication Types

### Forms Authentication (Traditional ASP.NET)

```csharp
// Web.config
<configuration>
  <system.web>
    <authentication mode="Forms">
      <forms loginUrl="Login.aspx" defaultUrl="Default.aspx" />
    </authentication>
  </system.web>
</configuration>

// Login.aspx.cs
protected void btnLogin_Click(object sender, EventArgs e)
{
    if (ValidateUser(txtUsername.Text, txtPassword.Text))
    {
        FormsAuthentication.SetAuthCookie(txtUsername.Text, chkRememberMe.Checked);
        Response.Redirect(FormsAuthentication.GetRedirectUrl(txtUsername.Text, false));
    }
    else
    {
        lblError.Text = "Invalid credentials";
    }
}

// Logout
protected void btnLogout_Click(object sender, EventArgs e)
{
    FormsAuthentication.SignOut();
    Response.Redirect("Login.aspx");
}
```

### ASP.NET Identity (ASP.NET MVC/Web API)

```csharp
// Startup.cs or Program.cs
builder.Services.AddIdentity<ApplicationUser, IdentityRole>()
    .AddEntityFrameworkStores<ApplicationDbContext>()
    .AddDefaultTokenProviders();

// AccountController.cs
[HttpPost]
[AllowAnonymous]
[ValidateAntiForgeryToken]
public async Task<IActionResult> Login(LoginViewModel model)
{
    if (ModelState.IsValid)
    {
        var result = await _signInManager.PasswordSignInAsync(
            model.Email, model.Password, model.RememberMe, lockoutOnFailure: false);

        if (result.Succeeded)
        {
            return RedirectToLocal(model.ReturnUrl);
        }
    }

    ModelState.AddModelError(string.Empty, "Invalid login attempt.");
    return View(model);
}

[HttpPost]
[ValidateAntiForgeryToken]
public async Task<IActionResult> Logout()
{
    await _signInManager.SignOutAsync();
    return RedirectToAction(nameof(HomeController.Index), "Home");
}
```

### JWT Authentication (Web API)

```csharp
// Startup.cs or Program.cs
builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
    .AddJwtBearer(options =>
    {
        options.TokenValidationParameters = new TokenValidationParameters
        {
            ValidateIssuer = true,
            ValidateAudience = true,
            ValidateLifetime = true,
            ValidateIssuerSigningKey = true,
            ValidIssuer = Configuration["Jwt:Issuer"],
            ValidAudience = Configuration["Jwt:Audience"],
            IssuerSigningKey = new SymmetricSecurityKey(
                Encoding.UTF8.GetBytes(Configuration["Jwt:Key"]))
        };
    });

// AuthController.cs
[HttpPost("login")]
public async Task<IActionResult> Login([FromBody] LoginModel model)
{
    var user = await _userManager.FindByEmailAsync(model.Email);
    if (user != null && await _userManager.CheckPasswordAsync(user, model.Password))
    {
        var token = GenerateJwtToken(user);
        return Ok(new { token });
    }

    return Unauthorized();
}

private string GenerateJwtToken(IdentityUser user)
{
    var claims = new[]
    {
        new Claim(JwtRegisteredClaimNames.Sub, user.UserName),
        new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
        new Claim(ClaimTypes.NameIdentifier, user.Id)
    };

    var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Jwt:Key"]));
    var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

    var token = new JwtSecurityToken(
        issuer: _configuration["Jwt:Issuer"],
        audience: _configuration["Jwt:Audience"],
        claims: claims,
        expires: DateTime.Now.AddMinutes(30),
        signingCredentials: creds);

    return new JwtSecurityTokenHandler().WriteToken(token);
}
```

## Authorization

### Role-Based Authorization

```csharp
// Controller/Action level
[Authorize(Roles = "Admin")]
public class AdminController : Controller
{
    [Authorize(Roles = "Admin, Manager")]
    public IActionResult ManageUsers()
    {
        return View();
    }
}

// Method level
public class UserService
{
    [Authorize(Roles = "Admin")]
    public void DeleteUser(int userId)
    {
        // Implementation
    }
}
```

### Policy-Based Authorization

```csharp
// Startup.cs or Program.cs
builder.Services.AddAuthorization(options =>
{
    options.AddPolicy("RequireAdminRole", policy =>
        policy.RequireRole("Admin"));

    options.AddPolicy("MinimumAge", policy =>
        policy.Requirements.Add(new MinimumAgeRequirement(18)));

    options.AddPolicy("AtLeast21", policy =>
        policy.Requirements.Add(new MinimumAgeRequirement(21)));
});

// Custom requirement
public class MinimumAgeRequirement : IAuthorizationRequirement
{
    public int MinimumAge { get; }

    public MinimumAgeRequirement(int minimumAge)
    {
        MinimumAge = minimumAge;
    }
}

// Custom handler
public class MinimumAgeHandler : AuthorizationHandler<MinimumAgeRequirement>
{
    protected override Task HandleRequirementAsync(
        AuthorizationHandlerContext context,
        MinimumAgeRequirement requirement)
    {
        var dateOfBirthClaim = context.User.FindFirst(c => c.Type == "DateOfBirth");

        if (dateOfBirthClaim != null)
        {
            var dateOfBirth = Convert.ToDateTime(dateOfBirthClaim.Value);
            var age = DateTime.Today.Year - dateOfBirth.Year;

            if (dateOfBirth > DateTime.Today.AddYears(-age))
                age--;

            if (age >= requirement.MinimumAge)
            {
                context.Succeed(requirement);
            }
        }

        return Task.CompletedTask;
    }
}

// Register handler
builder.Services.AddSingleton<IAuthorizationHandler, MinimumAgeHandler>();

// Usage
[Authorize(Policy = "MinimumAge")]
public IActionResult AdultContent()
{
    return View();
}
```

### Claims-Based Authorization

```csharp
// Add claims during login
var claims = new List<Claim>
{
    new Claim(ClaimTypes.Name, user.UserName),
    new Claim(ClaimTypes.Email, user.Email),
    new Claim("Department", user.Department),
    new Claim("ClearanceLevel", user.ClearanceLevel.ToString())
};

var identity = new ClaimsIdentity(claims, "Custom");
var principal = new ClaimsPrincipal(identity);

// Authorization based on claims
[Authorize(Policy = "SecurityClearance")]
public class ClassifiedController : Controller
{
    // Only users with SecurityClearance claim >= 3 can access
}

// Policy definition
builder.Services.AddAuthorization(options =>
{
    options.AddPolicy("SecurityClearance", policy =>
        policy.RequireClaim("ClearanceLevel", "3", "4", "5"));
});
```

## External Authentication

### OAuth 2.0 / OpenID Connect

```csharp
// Startup.cs or Program.cs
builder.Services.AddAuthentication()
    .AddGoogle(options =>
    {
        options.ClientId = Configuration["Authentication:Google:ClientId"];
        options.ClientSecret = Configuration["Authentication:Google:ClientSecret"];
    })
    .AddFacebook(options =>
    {
        options.AppId = Configuration["Authentication:Facebook:AppId"];
        options.AppSecret = Configuration["Authentication:Facebook:AppSecret"];
    })
    .AddMicrosoftAccount(options =>
    {
        options.ClientId = Configuration["Authentication:Microsoft:ClientId"];
        options.ClientSecret = Configuration["Authentication:Microsoft:ClientSecret"];
    });

// AccountController.cs
[HttpPost]
[AllowAnonymous]
[ValidateAntiForgeryToken]
public IActionResult ExternalLogin(string provider, string returnUrl = null)
{
    var redirectUrl = Url.Action("ExternalLoginCallback", "Account", new { ReturnUrl = returnUrl });
    var properties = _signInManager.ConfigureExternalAuthenticationProperties(provider, redirectUrl);
    return Challenge(properties, provider);
}

[HttpGet]
[AllowAnonymous]
public async Task<IActionResult> ExternalLoginCallback(string returnUrl = null, string remoteError = null)
{
    if (remoteError != null)
    {
        return RedirectToAction("Login");
    }

    var info = await _signInManager.GetExternalLoginInfoAsync();
    if (info == null)
    {
        return RedirectToAction("Login");
    }

    var result = await _signInManager.ExternalLoginSignInAsync(info.LoginProvider, info.ProviderKey, isPersistent: false);
    if (result.Succeeded)
    {
        return RedirectToLocal(returnUrl);
    }

    // Handle user creation if needed
    // ...
}
```

## Security Best Practices

### Password Policies

```csharp
// Startup.cs or Program.cs
builder.Services.AddIdentity<ApplicationUser, IdentityRole>(options =>
{
    options.Password.RequireDigit = true;
    options.Password.RequireLowercase = true;
    options.Password.RequireUppercase = true;
    options.Password.RequireNonAlphanumeric = true;
    options.Password.RequiredLength = 8;
})
.AddEntityFrameworkStores<ApplicationDbContext>();
```

### Account Lockout

```csharp
builder.Services.AddIdentity<ApplicationUser, IdentityRole>(options =>
{
    options.Lockout.DefaultLockoutTimeSpan = TimeSpan.FromMinutes(5);
    options.Lockout.MaxFailedAccessAttempts = 5;
    options.Lockout.AllowedForNewUsers = true;
});
```

### Two-Factor Authentication

```csharp
// Enable 2FA
builder.Services.AddIdentity<ApplicationUser, IdentityRole>(options =>
{
    options.TwoFactorAuthentication.IsEnabled = true;
});

// Controller methods
[HttpPost]
[ValidateAntiForgeryToken]
public async Task<IActionResult> EnableTwoFactorAuthentication()
{
    var user = await _userManager.GetUserAsync(User);
    if (user == null)
    {
        return NotFound();
    }

    await _userManager.SetTwoFactorEnabledAsync(user, true);
    await _signInManager.RefreshSignInAsync(user);

    return RedirectToAction("TwoFactorAuthentication");
}

[HttpPost]
[ValidateAntiForgeryToken]
public async Task<IActionResult> VerifyTwoFactorToken(string token)
{
    var result = await _signInManager.TwoFactorAuthenticatorSignInAsync(token, false, false);
    if (result.Succeeded)
    {
        return RedirectToLocal(returnUrl);
    }

    ModelState.AddModelError("", "Invalid authenticator code.");
    return View();
}
```

### Anti-Forgery Tokens

```csharp
// In views
<form asp-action="Transfer" method="post">
    @Html.AntiForgeryToken()
    <!-- form fields -->
</form>

// In controllers
[HttpPost]
[ValidateAntiForgeryToken]
public async Task<IActionResult> Transfer(TransferViewModel model)
{
    // Process transfer
}
```

### CORS (Cross-Origin Resource Sharing)

```csharp
// Startup.cs or Program.cs
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowSpecificOrigin",
        builder => builder.WithOrigins("https://example.com")
                          .AllowAnyMethod()
                          .AllowAnyHeader());
});

app.UseCors("AllowSpecificOrigin");
```

## Session Management

### ASP.NET Session State

```csharp
// Store data in session
Session["UserId"] = userId;
Session["UserName"] = userName;

// Retrieve data from session
int userId = (int)Session["UserId"];
string userName = (string)Session["UserName"];

// Remove from session
Session.Remove("UserName");

// Clear all session data
Session.Clear();
Session.Abandon();
```

### Distributed Session (Redis/SQL Server)

```csharp
// Startup.cs or Program.cs
builder.Services.AddDistributedRedisCache(options =>
{
    options.Configuration = "localhost:6379";
});

builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromMinutes(30);
    options.Cookie.HttpOnly = true;
    options.Cookie.IsEssential = true;
});

app.UseSession();
```

## Summary

ASP.NET provides comprehensive authentication and authorization features. From simple forms authentication to advanced JWT tokens and external providers, you can secure your applications effectively. Always follow security best practices like strong passwords, account lockout, and proper session management to protect your applications and users.
