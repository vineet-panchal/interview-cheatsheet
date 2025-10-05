# Deployment in .NET

Deploying .NET applications involves building, packaging, and distributing applications to various environments.

## Build and Publish

### Building Applications

```bash
# Build for development
dotnet build

# Build for release
dotnet build --configuration Release

# Build specific project
dotnet build MyProject.csproj
```

### Publishing Applications

```bash
# Publish as framework-dependent
dotnet publish --configuration Release

# Publish as self-contained (includes runtime)
dotnet publish --configuration Release --self-contained true --runtime linux-x64

# Publish to specific directory
dotnet publish --configuration Release --output ./publish
```

### Runtime Identifiers (RIDs)

Common RIDs:
- `win-x64`: Windows x64
- `win-x86`: Windows x86
- `linux-x64`: Linux x64
- `linux-arm`: Linux ARM
- `osx-x64`: macOS x64

## ASP.NET Core Deployment

### IIS Deployment

1. Install .NET Core Hosting Bundle on Windows Server
2. Create IIS website
3. Publish application
4. Deploy files to website directory

```xml
<!-- web.config for IIS -->
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <location path="." inheritInChildApplications="false">
    <system.webServer>
      <handlers>
        <add name="aspNetCore" path="*" verb="*" modules="AspNetCoreModuleV2" resourceType="Unspecified" />
      </handlers>
      <aspNetCore processPath="dotnet" arguments=".\MyApp.dll" stdoutLogEnabled="false" stdoutLogFile=".\logs\stdout" hostingModel="inprocess" />
    </system.webServer>
  </location>
</configuration>
```

### Linux Deployment

```bash
# Install .NET runtime
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install -y aspnetcore-runtime-6.0

# Deploy application
scp -r ./publish user@server:/var/www/myapp
sudo systemctl restart myapp.service
```

### Docker Deployment

```dockerfile
# Dockerfile
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["MyApp.csproj", "."]
RUN dotnet restore "./MyApp.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "MyApp.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "MyApp.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "MyApp.dll"]
```

```bash
# Build and run
docker build -t myapp .
docker run -d -p 8080:80 myapp
```

## Azure Deployment

### Azure App Service

```bash
# Install Azure CLI
# Deploy to Azure App Service
az webapp up --name myapp --resource-group mygroup --plan myplan
```

### Azure Container Instances

```bash
# Build and push to Azure Container Registry
az acr build --registry myregistry --image myapp:v1 .

# Deploy to ACI
az container create --resource-group mygroup --name myapp \
  --image myregistry.azurecr.io/myapp:v1 \
  --dns-name-label myapp --ports 80
```

### Azure Kubernetes Service (AKS)

```yaml
# deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp
spec:
  replicas: 3
  selector:
    matchLabels:
      app: myapp
  template:
    metadata:
      labels:
        app: myapp
    spec:
      containers:
      - name: myapp
        image: myregistry.azurecr.io/myapp:v1
        ports:
        - containerPort: 80
```

## AWS Deployment

### AWS Elastic Beanstalk

```bash
# Install EB CLI
pip install awsebcli

# Initialize EB application
eb init -p "dotnet-core" myapp

# Deploy
eb create production-env
eb deploy
```

### AWS ECS (Elastic Container Service)

```json
// task-definition.json
{
  "family": "myapp",
  "containerDefinitions": [
    {
      "name": "myapp",
      "image": "myregistry/myapp:v1",
      "portMappings": [
        {
          "containerPort": 80,
          "hostPort": 80
        }
      ]
    }
  ]
}
```

### AWS Lambda

```csharp
// AWS Lambda function
public class Function
{
    public async Task<string> FunctionHandler(ILambdaContext context)
    {
        return "Hello from Lambda!";
    }
}
```

## Configuration Management

### Environment Variables

```csharp
// Access environment variables
var connectionString = Environment.GetEnvironmentVariable("CONNECTION_STRING");
var port = Environment.GetEnvironmentVariable("PORT") ?? "5000";
```

### appsettings.json for Different Environments

```json
// appsettings.Development.json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=localhost;Database=MyDb;Trusted_Connection=True;"
  },
  "Logging": {
    "LogLevel": {
      "Default": "Debug"
    }
  }
}

// appsettings.Production.json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=prod-server;Database=MyDb;User Id=user;Password=pass;"
  },
  "Logging": {
    "LogLevel": {
      "Default": "Warning"
    }
  }
}
```

### User Secrets (Development)

```bash
# Initialize user secrets
dotnet user-secrets init

# Set secret
dotnet user-secrets set "ConnectionStrings:DefaultConnection" "Server=dev-server;..."

# Access in code
var connectionString = builder.Configuration["ConnectionStrings:DefaultConnection"];
```

## Health Checks and Monitoring

### Health Checks

```csharp
// In Program.cs
builder.Services.AddHealthChecks()
    .AddSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"))
    .AddUrlGroup(new Uri("https://api.example.com/health"));

app.MapHealthChecks("/health");
```

### Application Insights

```csharp
// Add Application Insights
builder.Services.AddApplicationInsightsTelemetry();

// Custom telemetry
var telemetry = new TelemetryClient();
telemetry.TrackEvent("UserLoggedIn");
telemetry.TrackMetric("ProcessingTime", 150.5);
```

## CI/CD Pipelines

### GitHub Actions

```yaml
# .github/workflows/deploy.yml
name: Deploy to Azure
on:
  push:
    branches: [ main ]

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Setup .NET
      uses: actions/setup-dotnet@v1
      with:
        dotnet-version: '6.0.x'
    - name: Build
      run: dotnet build --configuration Release
    - name: Test
      run: dotnet test --configuration Release
    - name: Publish
      run: dotnet publish --configuration Release --output ./publish
    - name: Deploy to Azure
      uses: azure/webapps-deploy@v2
      with:
        app-name: myapp
        publish-profile: ${{ secrets.AZURE_WEBAPP_PUBLISH_PROFILE }}
        package: ./publish
```

### Azure DevOps

```yaml
# azure-pipelines.yml
trigger:
- main

pool:
  vmImage: 'ubuntu-latest'

steps:
- task: UseDotNet@2
  inputs:
    packageType: 'sdk'
    version: '6.0.x'

- task: DotNetCoreCLI@2
  inputs:
    command: 'build'
    projects: '**/*.csproj'
    arguments: '--configuration Release'

- task: DotNetCoreCLI@2
  inputs:
    command: 'test'
    projects: '**/*Tests.csproj'
    arguments: '--configuration Release'

- task: DotNetCoreCLI@2
  inputs:
    command: 'publish'
    publishWebProjects: true
    arguments: '--configuration Release --output $(Build.ArtifactStagingDirectory)'

- task: PublishBuildArtifacts@1
  inputs:
    pathToPublish: '$(Build.ArtifactStagingDirectory)'
    artifactName: 'drop'
```

## Performance Optimization

### Ahead-of-Time Compilation

```bash
# Publish with ReadyToRun
dotnet publish -c Release -r linux-x64 --self-contained true /p:PublishReadyToRun=true
```

### Trimming

```bash
# Trim unused assemblies
dotnet publish -c Release -r linux-x64 --self-contained true /p:PublishTrimmed=true
```

### Single File Deployment

```bash
# Create single executable
dotnet publish -c Release -r win-x64 --self-contained true /p:PublishSingleFile=true
```

## Security Considerations

### HTTPS Configuration

```csharp
// In Program.cs
app.UseHttpsRedirection();
app.UseHsts();
```

### CORS Configuration

```csharp
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowSpecificOrigin",
        builder => builder.WithOrigins("https://example.com")
                          .AllowAnyMethod()
                          .AllowAnyHeader());
});

app.UseCors("AllowSpecificOrigin");
```

### Input Validation

```csharp
public class CreateUserRequest
{
    [Required]
    [StringLength(50, MinimumLength = 2)]
    public string Name { get; set; }

    [Required]
    [EmailAddress]
    public string Email { get; set; }
}
```

## Monitoring and Logging

### Serilog Configuration

```csharp
// In Program.cs
builder.Host.UseSerilog((context, services, configuration) => configuration
    .ReadFrom.Configuration(context.Configuration)
    .ReadFrom.Services(services)
    .Enrich.FromLogContext()
    .WriteTo.Console()
    .WriteTo.File("logs/log-.txt", rollingInterval: RollingInterval.Day));
```

### Structured Logging

```csharp
_logger.LogInformation("User {UserId} logged in from {IPAddress}", userId, ipAddress);
_logger.LogError(ex, "Failed to process payment for user {UserId}", userId);
```

## Summary

.NET deployment involves various strategies from simple file copying to complex cloud deployments. Understanding different hosting options, configuration management, CI/CD pipelines, and monitoring is crucial for successful application deployment and maintenance.
