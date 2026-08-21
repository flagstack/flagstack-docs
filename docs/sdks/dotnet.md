# .NET SDK

Repository: [`switchonyourcode/sdk-dotnet`](https://github.com/switchonyourcode/sdk-dotnet)

Supported targets: .NET 8 and .NET 10.

The repository contains three NuGet-ready packages:

| Package | Purpose |
| --- | --- |
| `SwitchOnYourCode` | Dependency-light native client and evaluator. |
| `SwitchOnYourCode.Extensions.DependencyInjection` | ASP.NET Core / Generic Host integration. |
| `SwitchOnYourCode.OpenFeature` | OpenFeature provider. |

!!! warning "Not yet published"
    The NuGet packages are implemented but not yet released. The APIs below are pre-release.

## Native client

```csharp
using SwitchOnYourCode;

await using var flags = await SwitchOnYourCodeClient.CreateAndWaitAsync(new SwitchOnYourCodeClientOptions
{
    BaseUrl = "https://flags.example.com",
    ServerKey = "syoc_server_...",
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
using SwitchOnYourCode.Extensions.DependencyInjection;

builder.Services.AddSwitchOnYourCode(options =>
{
    options.BaseUrl = "https://flags.example.com";
    options.ServerKey = builder.Configuration["SwitchOnYourCode:ServerKey"]!;
    options.PollInterval = TimeSpan.FromSeconds(30);
});
```

`SwitchOnYourCodeClient` is registered as a singleton. The hosted service performs the initial load and polls in the background by default.

## Typed APIs

The native client supports boolean, string, number and strongly-deserialized JSON values, with corresponding details methods for reason/variant/rule/error metadata.
