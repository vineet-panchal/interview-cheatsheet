# Asynchronous Programming in C#

Asynchronous programming allows applications to perform I/O-bound operations without blocking the main thread, improving responsiveness and scalability.

## Synchronous vs Asynchronous

### Synchronous Example

```csharp
public void DownloadAndProcessData()
{
    // This blocks the thread
    string data = DownloadData("https://api.example.com/data");

    // This also blocks
    string processedData = ProcessData(data);

    Console.WriteLine(processedData);
}
```

### Asynchronous Example

```csharp
public async Task DownloadAndProcessDataAsync()
{
    // These don't block the thread
    string data = await DownloadDataAsync("https://api.example.com/data");
    string processedData = await ProcessDataAsync(data);

    Console.WriteLine(processedData);
}
```

## async and await Keywords

### Basic async Method

```csharp
public async Task<string> GetDataAsync()
{
    // Simulate async operation
    await Task.Delay(1000);
    return "Data retrieved";
}
```

### Calling async Methods

```csharp
public async Task ProcessDataAsync()
{
    Console.WriteLine("Starting data processing...");

    string data = await GetDataAsync();

    Console.WriteLine($"Data: {data}");
    Console.WriteLine("Data processing complete.");
}
```

### Multiple await Calls

```csharp
public async Task ProcessMultipleDataAsync()
{
    Task<string> task1 = GetDataAsync("url1");
    Task<string> task2 = GetDataAsync("url2");
    Task<string> task3 = GetDataAsync("url3");

    // Wait for all tasks to complete
    await Task.WhenAll(task1, task2, task3);

    Console.WriteLine($"Data1: {task1.Result}");
    Console.WriteLine($"Data2: {task2.Result}");
    Console.WriteLine($"Data3: {task3.Result}");
}
```

## Task and Task<T>

### Task (void return)

```csharp
public async Task DoWorkAsync()
{
    await Task.Delay(1000);
    Console.WriteLine("Work completed");
}
```

### Task<T> (typed return)

```csharp
public async Task<int> CalculateSumAsync(int a, int b)
{
    await Task.Delay(500); // Simulate work
    return a + b;
}
```

### Task.Run for CPU-bound Work

```csharp
public async Task<int> CalculateFactorialAsync(int n)
{
    return await Task.Run(() =>
    {
        int result = 1;
        for (int i = 1; i <= n; i++)
        {
            result *= i;
        }
        return result;
    });
}
```

## Exception Handling in Async Code

### try-catch with async

```csharp
public async Task<string> DownloadDataSafeAsync(string url)
{
    try
    {
        return await DownloadDataAsync(url);
    }
    catch (HttpRequestException ex)
    {
        Console.WriteLine($"Network error: {ex.Message}");
        return null;
    }
    catch (Exception ex)
    {
        Console.WriteLine($"Unexpected error: {ex.Message}");
        throw; // Re-throw for caller to handle
    }
}
```

### Handling Multiple Tasks with Exception

```csharp
public async Task ProcessMultipleWithErrorHandlingAsync()
{
    Task<string> task1 = DownloadDataAsync("url1");
    Task<string> task2 = DownloadDataAsync("url2");

    try
    {
        await Task.WhenAll(task1, task2);
        Console.WriteLine("All downloads completed successfully");
    }
    catch (Exception ex)
    {
        Console.WriteLine($"One or more downloads failed: {ex.Message}");

        // Check individual task status
        if (task1.IsFaulted)
            Console.WriteLine("Task 1 failed");
        if (task2.IsFaulted)
            Console.WriteLine("Task 2 failed");
    }
}
```

## Cancellation

### CancellationToken

```csharp
public async Task<string> DownloadWithCancellationAsync(string url, CancellationToken cancellationToken)
{
    using (var client = new HttpClient())
    {
        try
        {
            var response = await client.GetAsync(url, cancellationToken);
            return await response.Content.ReadAsStringAsync();
        }
        catch (OperationCanceledException)
        {
            Console.WriteLine("Operation was cancelled");
            throw;
        }
    }
}
```

### Using CancellationTokenSource

```csharp
public async Task DemonstrateCancellationAsync()
{
    using (var cts = new CancellationTokenSource())
    {
        // Cancel after 2 seconds
        cts.CancelAfter(2000);

        try
        {
            string result = await DownloadWithCancellationAsync("https://slow-api.example.com", cts.Token);
            Console.WriteLine(result);
        }
        catch (OperationCanceledException)
        {
            Console.WriteLine("Download was cancelled due to timeout");
        }
    }
}
```

### Manual Cancellation

```csharp
public async Task ProcessWithManualCancellationAsync()
{
    using (var cts = new CancellationTokenSource())
    {
        var cancellationToken = cts.Token;

        // Start a task that can be cancelled
        var processingTask = ProcessDataAsync(cancellationToken);

        // Simulate user cancelling after 1 second
        await Task.Delay(1000);
        cts.Cancel();

        try
        {
            await processingTask;
        }
        catch (OperationCanceledException)
        {
            Console.WriteLine("Processing was cancelled");
        }
    }
}
```

## Parallel Processing

### Parallel.ForEach

```csharp
public async Task ProcessItemsInParallelAsync()
{
    var items = Enumerable.Range(1, 10);

    await Task.Run(() =>
    {
        Parallel.ForEach(items, async (item) =>
        {
            await ProcessItemAsync(item);
        });
    });
}
```

### WhenAll vs WhenAny

```csharp
public async Task DemonstrateTaskCombinatorsAsync()
{
    var tasks = new[]
    {
        Task.Delay(1000).ContinueWith(_ => "Task 1"),
        Task.Delay(2000).ContinueWith(_ => "Task 2"),
        Task.Delay(1500).ContinueWith(_ => "Task 3")
    };

    // Wait for all tasks to complete
    string[] allResults = await Task.WhenAll(tasks);
    Console.WriteLine("All results: " + string.Join(", ", allResults));

    // Wait for first task to complete
    var firstCompleted = await Task.WhenAny(tasks);
    Console.WriteLine("First completed: " + firstCompleted.Result);
}
```

## Async Streams (C# 8.0+)

### IAsyncEnumerable

```csharp
public async IAsyncEnumerable<int> GenerateNumbersAsync(int count)
{
    for (int i = 1; i <= count; i++)
    {
        await Task.Delay(100); // Simulate async work
        yield return i;
    }
}
```

### Consuming Async Streams

```csharp
public async Task ProcessNumbersAsync()
{
    await foreach (var number in GenerateNumbersAsync(5))
    {
        Console.WriteLine($"Processing number: {number}");
    }
}
```

### Async Streams with Cancellation

```csharp
public async IAsyncEnumerable<int> GenerateNumbersWithCancellationAsync(
    int count,
    [EnumeratorCancellation] CancellationToken cancellationToken = default)
{
    for (int i = 1; i <= count; i++)
    {
        await Task.Delay(100, cancellationToken);
        yield return i;
    }
}
```

## ValueTask for Performance

```csharp
public class DataCache
{
    private readonly Dictionary<string, string> _cache = new Dictionary<string, string>();

    public async ValueTask<string> GetDataAsync(string key)
    {
        if (_cache.TryGetValue(key, out var cachedData))
        {
            return cachedData; // Synchronous return
        }

        // Simulate async operation
        await Task.Delay(100);
        var data = $"Data for {key}";
        _cache[key] = data;

        return data;
    }
}
```

## Async in ASP.NET Core

### Async Controller Actions

```csharp
[ApiController]
[Route("api/[controller]")]
public class UsersController : ControllerBase
{
    private readonly IUserService _userService;

    public UsersController(IUserService userService)
    {
        _userService = userService;
    }

    [HttpGet]
    public async Task<IActionResult> GetUsers()
    {
        var users = await _userService.GetAllUsersAsync();
        return Ok(users);
    }

    [HttpGet("{id}")]
    public async Task<IActionResult> GetUser(int id)
    {
        var user = await _userService.GetUserByIdAsync(id);
        if (user == null)
            return NotFound();

        return Ok(user);
    }

    [HttpPost]
    public async Task<IActionResult> CreateUser(CreateUserRequest request)
    {
        var user = await _userService.CreateUserAsync(request);
        return CreatedAtAction(nameof(GetUser), new { id = user.Id }, user);
    }
}
```

### Async Repository Pattern

```csharp
public interface IUserRepository
{
    Task<User> GetByIdAsync(int id);
    Task<IEnumerable<User>> GetAllAsync();
    Task<User> AddAsync(User user);
    Task UpdateAsync(User user);
    Task DeleteAsync(int id);
}

public class UserRepository : IUserRepository
{
    private readonly ApplicationDbContext _context;

    public UserRepository(ApplicationDbContext context)
    {
        _context = context;
    }

    public async Task<User> GetByIdAsync(int id)
    {
        return await _context.Users.FindAsync(id);
    }

    public async Task<IEnumerable<User>> GetAllAsync()
    {
        return await _context.Users.ToListAsync();
    }

    public async Task<User> AddAsync(User user)
    {
        _context.Users.Add(user);
        await _context.SaveChangesAsync();
        return user;
    }

    public async Task UpdateAsync(User user)
    {
        _context.Users.Update(user);
        await _context.SaveChangesAsync();
    }

    public async Task DeleteAsync(int id)
    {
        var user = await GetByIdAsync(id);
        if (user != null)
        {
            _context.Users.Remove(user);
            await _context.SaveChangesAsync();
        }
    }
}
```

## Best Practices

### Avoid async void

```csharp
// Bad - fire and forget, exceptions can't be caught
public async void FireAndForgetAsync()
{
    await Task.Delay(1000);
    // If this throws, the exception is lost
}

// Good - return Task
public async Task FireAndForgetAsync()
{
    await Task.Delay(1000);
}
```

### ConfigureAwait

```csharp
// In library code, use ConfigureAwait(false)
public async Task<string> GetDataFromLibraryAsync()
{
    var response = await _httpClient.GetAsync("url").ConfigureAwait(false);
    return await response.Content.ReadAsStringAsync().ConfigureAwait(false);
}

// In UI code, keep the default (ConfigureAwait(true))
public async Task UpdateUIAsync()
{
    var data = await GetDataAsync(); // Stays on UI thread
    UpdateUI(data);
}
```

### Async Disposable

```csharp
public class AsyncResource : IAsyncDisposable
{
    public async ValueTask DisposeAsync()
    {
        await Task.Delay(100); // Cleanup async resources
        Console.WriteLine("Async resource disposed");
    }
}

// Usage
await using (var resource = new AsyncResource())
{
    // Use resource
}
// DisposeAsync is called automatically
```

## Common Patterns

### Retry Pattern

```csharp
public async Task<T> RetryAsync<T>(Func<Task<T>> operation, int maxRetries = 3)
{
    for (int i = 0; i < maxRetries; i++)
    {
        try
        {
            return await operation();
        }
        catch (Exception ex) when (i < maxRetries - 1)
        {
            Console.WriteLine($"Attempt {i + 1} failed: {ex.Message}");
            await Task.Delay(1000 * (i + 1)); // Exponential backoff
        }
    }

    throw new Exception("All retry attempts failed");
}
```

### Timeout Pattern

```csharp
public async Task<T> WithTimeoutAsync<T>(Task<T> task, TimeSpan timeout)
{
    using (var cts = new CancellationTokenSource(timeout))
    {
        var completedTask = await Task.WhenAny(task, Task.Delay(timeout, cts.Token));

        if (completedTask == task)
        {
            cts.Cancel();
            return await task;
        }
        else
        {
            throw new TimeoutException("Operation timed out");
        }
    }
}
```

## Summary

Asynchronous programming in C# using async/await provides a clean way to write non-blocking code. Understanding Task, exception handling, cancellation, and best practices is crucial for building responsive and scalable .NET applications.
