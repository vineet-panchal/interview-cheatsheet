# Entity Framework Core

Entity Framework Core (EF Core) is an object-relational mapper (ORM) for .NET that enables .NET developers to work with databases using .NET objects.

## Key Features

- Cross-platform ORM
- LINQ support for querying
- Change tracking and automatic updates
- Migrations for database schema management
- Multiple database providers (SQL Server, PostgreSQL, SQLite, etc.)

## Installation

```bash
dotnet add package Microsoft.EntityFrameworkCore.SqlServer
dotnet add package Microsoft.EntityFrameworkCore.Tools
```

## Creating a DbContext

```csharp
using Microsoft.EntityFrameworkCore;

public class ApplicationDbContext : DbContext
{
    public DbSet<User> Users { get; set; }
    public DbSet<Post> Posts { get; set; }
    public DbSet<Comment> Comments { get; set; }

    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
        : base(options)
    {
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        // Configure relationships and constraints
        modelBuilder.Entity<Post>()
            .HasOne(p => p.Author)
            .WithMany(u => u.Posts)
            .HasForeignKey(p => p.AuthorId);

        modelBuilder.Entity<Comment>()
            .HasOne(c => c.Post)
            .WithMany(p => p.Comments)
            .HasForeignKey(c => c.PostId);
    }
}
```

## Entity Models

```csharp
public class User
{
    public int Id { get; set; }
    public string Username { get; set; }
    public string Email { get; set; }
    public DateTime CreatedAt { get; set; }

    // Navigation properties
    public ICollection<Post> Posts { get; set; }
}

public class Post
{
    public int Id { get; set; }
    public string Title { get; set; }
    public string Content { get; set; }
    public DateTime PublishedAt { get; set; }
    public int AuthorId { get; set; }

    // Navigation properties
    public User Author { get; set; }
    public ICollection<Comment> Comments { get; set; }
}

public class Comment
{
    public int Id { get; set; }
    public string Content { get; set; }
    public DateTime CreatedAt { get; set; }
    public int PostId { get; set; }

    // Navigation property
    public Post Post { get; set; }
}
```

## Configuring Services

```csharp
// In Program.cs
builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));
```

## Basic CRUD Operations

### Create

```csharp
public async Task<User> CreateUserAsync(string username, string email)
{
    var user = new User
    {
        Username = username,
        Email = email,
        CreatedAt = DateTime.UtcNow
    };

    _context.Users.Add(user);
    await _context.SaveChangesAsync();

    return user;
}
```

### Read

```csharp
// Get all users
public async Task<List<User>> GetAllUsersAsync()
{
    return await _context.Users.ToListAsync();
}

// Get user by ID
public async Task<User> GetUserByIdAsync(int id)
{
    return await _context.Users.FindAsync(id);
}

// Get user with related data
public async Task<User> GetUserWithPostsAsync(int id)
{
    return await _context.Users
        .Include(u => u.Posts)
        .ThenInclude(p => p.Comments)
        .FirstOrDefaultAsync(u => u.Id == id);
}
```

### Update

```csharp
public async Task UpdateUserAsync(int id, string newUsername, string newEmail)
{
    var user = await _context.Users.FindAsync(id);
    if (user == null)
        throw new NotFoundException("User not found");

    user.Username = newUsername;
    user.Email = newEmail;

    await _context.SaveChangesAsync();
}
```

### Delete

```csharp
public async Task DeleteUserAsync(int id)
{
    var user = await _context.Users.FindAsync(id);
    if (user != null)
    {
        _context.Users.Remove(user);
        await _context.SaveChangesAsync();
    }
}
```

## LINQ Queries

### Basic Queries

```csharp
// Simple filtering
var activeUsers = await _context.Users
    .Where(u => u.CreatedAt > DateTime.UtcNow.AddDays(-30))
    .ToListAsync();

// Sorting
var usersByName = await _context.Users
    .OrderBy(u => u.Username)
    .ToListAsync();

// Projection
var userNames = await _context.Users
    .Select(u => u.Username)
    .ToListAsync();
```

### Complex Queries

```csharp
// Join with LINQ
var postsWithAuthors = await _context.Posts
    .Include(p => p.Author)
    .Where(p => p.Author.Username.StartsWith("J"))
    .Select(p => new
    {
        PostTitle = p.Title,
        AuthorName = p.Author.Username,
        CommentCount = p.Comments.Count
    })
    .ToListAsync();

// Group by
var postsByMonth = await _context.Posts
    .GroupBy(p => new { p.PublishedAt.Year, p.PublishedAt.Month })
    .Select(g => new
    {
        Year = g.Key.Year,
        Month = g.Key.Month,
        PostCount = g.Count()
    })
    .OrderByDescending(g => g.Year)
    .ThenByDescending(g => g.Month)
    .ToListAsync();
```

## Migrations

### Creating Migrations

```bash
# Create a migration
dotnet ef migrations add InitialCreate

# Apply migrations to database
dotnet ef database update

# Generate SQL script
dotnet ef migrations script
```

### Migration Files

```csharp
public partial class InitialCreate : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.CreateTable(
            name: "Users",
            columns: table => new
            {
                Id = table.Column<int>(nullable: false)
                    .Annotation("SqlServer:Identity", "1, 1"),
                Username = table.Column<string>(maxLength: 50, nullable: false),
                Email = table.Column<string>(nullable: false),
                CreatedAt = table.Column<DateTime>(nullable: false)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_Users", x => x.Id);
            });
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropTable(name: "Users");
    }
}
```

## Advanced Features

### Raw SQL Queries

```csharp
// Raw SQL query
var users = await _context.Users
    .FromSqlRaw("SELECT * FROM Users WHERE CreatedAt > {0}", DateTime.UtcNow.AddDays(-7))
    .ToListAsync();

// Stored procedure
var result = await _context.Database
    .ExecuteSqlRawAsync("EXEC DeleteOldPosts @DaysOld = {0}", 30);
```

### Global Query Filters

```csharp
protected override void OnModelCreating(ModelBuilder modelBuilder)
{
    // Soft delete filter
    modelBuilder.Entity<Post>().HasQueryFilter(p => !p.IsDeleted);
}
```

### Value Objects

```csharp
public class Address
{
    public string Street { get; set; }
    public string City { get; set; }
    public string ZipCode { get; set; }
}

public class Company
{
    public int Id { get; set; }
    public string Name { get; set; }
    public Address Headquarters { get; set; } // Owned entity
}

protected override void OnModelCreating(ModelBuilder modelBuilder)
{
    modelBuilder.Entity<Company>().OwnsOne(c => c.Headquarters);
}
```

## Performance Optimization

### Eager Loading

```csharp
var usersWithPosts = await _context.Users
    .Include(u => u.Posts)
    .ThenInclude(p => p.Comments)
    .ToListAsync();
```

### Explicit Loading

```csharp
var user = await _context.Users.FindAsync(id);
await _context.Entry(user).Collection(u => u.Posts).LoadAsync();
```

### Lazy Loading

```csharp
// Enable lazy loading
builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseLazyLoadingProxies().UseSqlServer(connectionString));

// Usage - related data loaded automatically when accessed
var user = await _context.Users.FindAsync(id);
var postCount = user.Posts.Count; // Triggers database query
```

### AsNoTracking

```csharp
// For read-only queries
var users = await _context.Users.AsNoTracking().ToListAsync();
```

### Compiled Queries

```csharp
private static readonly Func<ApplicationDbContext, int, Task<User>> GetUserByIdCompiled =
    EF.CompileAsyncQuery((ApplicationDbContext context, int id) =>
        context.Users.FirstOrDefault(u => u.Id == id));

// Usage
var user = await GetUserByIdCompiled(_context, userId);
```

## Testing with EF Core

### In-Memory Database

```csharp
public class TestDbContext : ApplicationDbContext
{
    public TestDbContext()
        : base(new DbContextOptionsBuilder<ApplicationDbContext>()
            .UseInMemoryDatabase("TestDatabase")
            .Options)
    {
    }
}
```

### Mocking DbContext

```csharp
public class UserServiceTests
{
    [Fact]
    public async Task GetUserById_ReturnsUser()
    {
        // Arrange
        var options = new DbContextOptionsBuilder<ApplicationDbContext>()
            .UseInMemoryDatabase("TestDb")
            .Options;

        using (var context = new ApplicationDbContext(options))
        {
            context.Users.Add(new User { Id = 1, Username = "testuser" });
            context.SaveChanges();
        }

        using (var context = new ApplicationDbContext(options))
        {
            var service = new UserService(context);

            // Act
            var user = await service.GetUserByIdAsync(1);

            // Assert
            Assert.NotNull(user);
            Assert.Equal("testuser", user.Username);
        }
    }
}
```

## Summary

Entity Framework Core is a powerful ORM that simplifies database operations in .NET applications. It supports LINQ queries, migrations, relationships, and performance optimizations. Understanding EF Core is essential for building data-driven applications with .NET.
