# SDK overview

Official SDKs implement the same schema-v1 evaluation contract in each supported language. They fetch configuration from FlagStack, retain the last valid snapshot, and evaluate flags locally.

## Official SDKs

| Ecosystem | Repository | Primary use |
| --- | --- | --- |
| JavaScript / TypeScript | [`flagstack/sdk-js`](https://github.com/flagstack/sdk-js) | Browser, Node.js, React and Next.js. |
| Python | [`flagstack/sdk-python`](https://github.com/flagstack/sdk-python) | Python services, Django, FastAPI, workers and CLIs. |
| Go | [`flagstack/sdk-go`](https://github.com/flagstack/sdk-go) | Go services, workers and CLIs. |
| .NET | [`flagstack/sdk-dotnet`](https://github.com/flagstack/sdk-dotnet) | .NET services, ASP.NET Core and Generic Host applications. |

All official SDK repositories use the Apache License 2.0.

!!! warning "Pre-release status"
    The SDKs are implemented and covered by cross-language compatibility tests, but their first package-registry releases are still being prepared. Treat the public APIs as pre-release until versioned packages are published.

## Server vs client credentials

Use `fs_server_...` credentials only in trusted code. They receive all active flags for one environment.

Use `fs_client_...` credentials in browser/public code. They are public identifiers and receive only client-visible flags.

## Evaluation context

All SDKs support a stable targeting key plus arbitrary nested attributes. Conceptually:

```json
{
  "targetingKey": "user-123",
  "country": "GB",
  "plan": "enterprise"
}
```

See [Evaluation context](../concepts/context.md) and [OpenFeature](openfeature.md).
