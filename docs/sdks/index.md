# SDK overview

Official SDKs implement the same schema-v1 evaluation contract in each supported language. They fetch configuration from Switch On Your Code, retain the last valid snapshot, and evaluate flags locally.

## Official SDKs

| Ecosystem | Repository | Primary use |
| --- | --- | --- |
| JavaScript / TypeScript | [`switchonyourcode/sdk-js`](https://github.com/switchonyourcode/sdk-js) | Browser, Node.js, React and Next.js. |
| Python | [`switchonyourcode/sdk-python`](https://github.com/switchonyourcode/sdk-python) | Python services, Django, FastAPI, workers and CLIs. |
| Go | [`switchonyourcode/sdk-go`](https://github.com/switchonyourcode/sdk-go) | Go services, workers and CLIs. |
| .NET | [`switchonyourcode/sdk-dotnet`](https://github.com/switchonyourcode/sdk-dotnet) | .NET services, ASP.NET Core and Generic Host applications. |

All official SDK repositories use the Apache License 2.0.

!!! warning "Pre-release status"
    The SDKs are implemented and covered by cross-language compatibility tests, but their first package-registry releases are still being prepared. Treat the public APIs as pre-release until versioned packages are published.

## Server vs client credentials

Use `syoc_server_...` credentials only in trusted code. They receive all active flags for one environment.

Use `syoc_client_...` credentials in browser/public code. They are public identifiers and receive only client-visible flags.

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
