# Security in ASP.NET

Security is paramount in web applications. ASP.NET provides comprehensive security features to protect against common vulnerabilities and attacks.

## Common Security Threats

### Cross-Site Scripting (XSS)

```csharp
// Vulnerable code
protected void btnSubmit_Click(object sender, EventArgs e)
{
    lblMessage.Text = txtInput.Text; // Dangerous!
}

// Safe code - HTML encoding
lblMessage.Text = Server.HtmlEncode(txtInput.Text);

// Or use AntiXSS library
using Microsoft.Security.Application;
lblMessage.Text = AntiXssEncoder.HtmlEncode(txtInput.Text, true);
```

### SQL Injection

```csharp
// Vulnerable code
string query = "SELECT * FROM Users WHERE Username = '" + username + "' AND Password = '" + password + "'";
SqlCommand cmd = new SqlCommand(query, connection);

// Safe code - Parameterized queries
string query = "SELECT * FROM Users WHERE Username = @username AND Password = @password";
SqlCommand cmd = new SqlCommand(query, connection);
cmd.Parameters.AddWithValue("@username", username);
cmd.Parameters.AddWithValue("@password", password);
```

### Cross-Site Request Forgery (CSRF)

```csharp
// Enable CSRF protection in Web Forms
// Web.config
<pages validateRequest="true" />

// In ASP.NET MVC
[ValidateAntiForgeryToken]
[HttpPost]
public ActionResult TransferMoney(TransferViewModel model)
{
    // Process transfer
}

// In views
@using (Html.BeginForm())
{
    @Html.AntiForgeryToken()
    <!-- form fields -->
}
```

### Clickjacking

```csharp
// Prevent clickjacking
// Web.config
<system.webServer>
  <httpProtocol>
    <customHeaders>
      <add name="X-Frame-Options" value="DENY" />
    </customHeaders>
  </httpProtocol>
</system.webServer>

// Or in code
Response.AddHeader("X-Frame-Options", "DENY");
```

## Authentication and Authorization

### Forms Authentication Security

```csharp
// Secure forms authentication
<authentication mode="Forms">
  <forms loginUrl="Login.aspx"
         protection="All"
         timeout="30"
         requireSSL="true"
         slidingExpiration="true"
         cookieless="UseCookies" />
</authentication>
```

### Password Security

```csharp
// Hash passwords properly
using System.Security.Cryptography;

public string HashPassword(string password)
{
    using (var sha256 = SHA256.Create())
    {
        var hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
        return Convert.ToBase64String(hashedBytes);
    }
}

// Use PBKDF2 for better security
public string HashPasswordSecure(string password)
{
    using (var pbkdf2 = new Rfc2898DeriveBytes(password, saltSize: 16, iterations: 10000))
    {
        byte[] hash = pbkdf2.GetBytes(32);
        byte[] salt = pbkdf2.Salt;
        return Convert.ToBase64String(salt.Concat(hash).ToArray());
    }
}
```

## Input Validation

### Server-Side Validation

```csharp
// Web Forms validation
protected void btnSubmit_Click(object sender, EventArgs e)
{
    if (string.IsNullOrWhiteSpace(txtName.Text))
    {
        lblError.Text = "Name is required.";
        return;
    }

    if (!Regex.IsMatch(txtEmail.Text, @"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"))
    {
        lblError.Text = "Invalid email format.";
        return;
    }

    // Process valid data
}
```

### ASP.NET MVC Validation

```csharp
public class UserModel
{
    [Required(ErrorMessage = "Name is required")]
    [StringLength(50, MinimumLength = 2)]
    public string Name { get; set; }

    [Required]
    [EmailAddress]
    public string Email { get; set; }

    [Required]
    [DataType(DataType.Password)]
    [StringLength(100, MinimumLength = 8)]
    public string Password { get; set; }
}

[HttpPost]
[ValidateAntiForgeryToken]
public ActionResult Register(UserModel model)
{
    if (ModelState.IsValid)
    {
        // Create user
        return RedirectToAction("Success");
    }

    return View(model);
}
```

## Secure Configuration

### Web.config Security

```xml
<configuration>
  <!-- Disable debugging in production -->
  <system.web>
    <compilation debug="false" />
    <customErrors mode="RemoteOnly" defaultRedirect="Error.aspx" />
  </system.web>

  <!-- Secure connection strings -->
  <connectionStrings>
    <add name="DefaultConnection"
         connectionString="Data Source=.;Initial Catalog=MyDB;Integrated Security=True;"
         providerName="System.Data.SqlClient" />
  </connectionStrings>

  <!-- Request validation -->
  <pages validateRequest="true" />
</configuration>
```

### ASP.NET Core Security Headers

```csharp
// Startup.cs or Program.cs
app.Use(async (context, next) =>
{
    context.Response.Headers.Add("X-Content-Type-Options", "nosniff");
    context.Response.Headers.Add("X-Frame-Options", "DENY");
    context.Response.Headers.Add("X-XSS-Protection", "1; mode=block");
    context.Response.Headers.Add("Referrer-Policy", "strict-origin-when-cross-origin");
    context.Response.Headers.Add("Content-Security-Policy", "default-src 'self'");

    await next();
});
```

## HTTPS and SSL

### Force HTTPS

```csharp
// Web.config
<system.webServer>
  <rewrite>
    <rules>
      <rule name="HTTP to HTTPS redirect" stopProcessing="true">
        <match url="(.*)" />
        <conditions>
          <add input="{HTTPS}" pattern="off" ignoreCase="true" />
        </conditions>
        <action type="Redirect" url="https://{HTTP_HOST}/{R:1}" redirectType="Permanent" />
      </rule>
    </rules>
  </rewrite>
</system.webServer>

// ASP.NET Core
app.UseHttpsRedirection();
```

### SSL Certificate Configuration

```csharp
// ASP.NET Core HTTPS configuration
builder.WebHost.ConfigureKestrel(options =>
{
    options.Listen(IPAddress.Any, 5001, listenOptions =>
    {
        listenOptions.UseHttps("certificate.pfx", "password");
    });
});
```

## Data Protection

### Encrypt Sensitive Data

```csharp
// Encrypt connection strings
<connectionStrings configProtectionProvider="DataProtectionConfigurationProvider">
  <EncryptedData>
    <!-- Encrypted connection string -->
  </EncryptedData>
</connectionStrings>

// ASP.NET Core data protection
builder.Services.AddDataProtection()
    .PersistKeysToFileSystem(new DirectoryInfo(@"\\server\share\keys\"))
    .ProtectKeysWithCertificate("thumbprint");
```

### Secure File Uploads

```csharp
protected void btnUpload_Click(object sender, EventArgs e)
{
    if (fileUpload.HasFile)
    {
        // Validate file type
        string[] allowedExtensions = { ".jpg", ".png", ".gif" };
        string fileExtension = Path.GetExtension(fileUpload.FileName).ToLower();

        if (!allowedExtensions.Contains(fileExtension))
        {
            lblMessage.Text = "Invalid file type.";
            return;
        }

        // Validate file size (max 1MB)
        if (fileUpload.PostedFile.ContentLength > 1024 * 1024)
        {
            lblMessage.Text = "File too large.";
            return;
        }

        // Generate safe filename
        string safeFileName = Guid.NewGuid().ToString() + fileExtension;
        string path = Server.MapPath("~/Uploads/") + safeFileName;

        fileUpload.SaveAs(path);
        lblMessage.Text = "File uploaded successfully.";
    }
}
```

## Error Handling and Logging

### Secure Error Pages

```csharp
// Global.asax
void Application_Error(object sender, EventArgs e)
{
    Exception ex = Server.GetLastError();

    // Log error securely (don't expose sensitive information)
    Logger.LogError("Application error occurred", ex);

    // Redirect to error page
    Response.Redirect("Error.aspx");
}

// Error.aspx - Don't show detailed error information
protected void Page_Load(object sender, EventArgs e)
{
    if (!IsPostBack)
    {
        lblError.Text = "An error occurred. Please try again later.";
    }
}
```

### ASP.NET Core Exception Handling

```csharp
// Startup.cs or Program.cs
if (app.Environment.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
}
else
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

// Error controller
[Route("Home/Error")]
public IActionResult Error()
{
    var exceptionHandlerPathFeature =
        HttpContext.Features.Get<IExceptionHandlerPathFeature>();

    // Log error details
    _logger.LogError(exceptionHandlerPathFeature?.Error, "Unhandled exception");

    return View(new ErrorViewModel
    {
        RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier
    });
}
```

## Security Testing

### Penetration Testing Checklist

- Test for SQL injection vulnerabilities
- Test for XSS vulnerabilities
- Verify CSRF protection
- Check for insecure direct object references
- Test authentication bypass scenarios
- Verify password policies
- Check for sensitive data exposure
- Test file upload security

### Security Headers Scanner

```csharp
// Check security headers in ASP.NET Core
app.Use(async (context, next) =>
{
    context.Response.OnStarting(() =>
    {
        if (!context.Response.Headers.ContainsKey("X-Content-Type-Options"))
        {
            context.Response.Headers.Add("X-Content-Type-Options", "nosniff");
        }
        return Task.CompletedTask;
    });

    await next();
});
```

## Best Practices

### Defense in Depth

1. **Input Validation**: Validate all inputs on client and server
2. **Authentication**: Use strong authentication mechanisms
3. **Authorization**: Implement proper access controls
4. **Data Protection**: Encrypt sensitive data
5. **Secure Configuration**: Follow security best practices
6. **Monitoring**: Log security events and monitor for anomalies

### Regular Security Audits

- Conduct regular security code reviews
- Use automated security scanning tools
- Keep dependencies updated
- Monitor security advisories
- Perform penetration testing

### OWASP Top 10 Compliance

Address the top 10 web application security risks:
1. Injection
2. Broken Authentication
3. Sensitive Data Exposure
4. XML External Entities (XXE)
5. Broken Access Control
6. Security Misconfiguration
7. Cross-Site Scripting (XSS)
8. Insecure Deserialization
9. Vulnerable Components
10. Insufficient Logging & Monitoring

## Summary

Security in ASP.NET requires a multi-layered approach. Always validate inputs, use parameterized queries, implement proper authentication and authorization, and follow security best practices. Regular security audits and staying updated with the latest security threats are crucial for maintaining secure applications.
