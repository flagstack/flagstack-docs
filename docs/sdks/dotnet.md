# .NET SDK

Repository: [`flagstack/sdk-dotnet`](https://github.com/flagstack/sdk-dotnet)

Supported targets: .NET 8 and .NET 10.

The repository contains three NuGet-ready packages:

| Package | Purpose |
| --- | --- |
| `FlagStack` | Dependency-light native client and evaluator. |
| `FlagStack.Extensions.DependencyInjection` | ASP.NET Core / Generic Host integration. |
| `FlagStack.OpenFeature` | OpenFeature provider. |

!!! warning "Not yet published"
    The NuGet packages are implemented but not yet released. The APIs below are pre-release.

## Native client

```csharp
using FlagStack;

await using var flags = await FlagStackClient.CreateAndWaitAsync(new FlagStackClientOptions
{
    BaseUrl = "https://flags.example.com",
    ServerKey = "fs_server_...",
});

var enabled = flags.GetBooleanValue(
    "new-checkout",
    fallback: false,
    new EvaluationContext(
        TargetingKey: "user-123",
        Attributes: new Dictionary<string, object?>
        {
            ["plan"] = "enterprise",
            ["country"] = "GB",
        }));
```

## ASP.NET Core / Generic Host

```csharp
using FlagStack.Extensions.DependencyInjection;

builder.Services.AddFlagStack(options =>
{
    options.BaseUrl = "https://flags.example.com";
    options.ServerKey = builder.Configuration["FlagStack:ServerKey"]!;
    options.PollInterval = TimeSpan.FromSeconds(30);
});
```

`FlagStackClient` is registered as a singleton. The hosted service performs the initial load and polls in the background by default.

## Typed APIs

The native client supports boolean, string, number and strongly-deserialized JSON values, with corresponding details methods for reason/variant/rule/error metadata.
