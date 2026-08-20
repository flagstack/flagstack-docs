# Go SDK

Repository: [`flagstack/sdk-go`](https://github.com/flagstack/sdk-go)

Requirements: Go 1.25 or newer and an environment-scoped server SDK key.

Because the module is hosted directly on GitHub, development builds can resolve it with `go get`, although the public API should still be considered pre-release until versioned releases are published.

## Create a client

```go
package main

import (
    "context"
    "log"

    flagstack "github.com/flagstack/sdk-go"
)

func main() {
    flags, err := flagstack.NewClientAndWait(context.Background(), flagstack.ClientOptions{
        BaseURL:   "https://flags.example.com",
        ServerKey: "fs_server_...",
    })
    if err != nil {
        log.Fatal(err)
    }
    defer flags.Close()

    enabled := flags.Boolean("new-checkout", false, flagstack.EvaluationContext{
        TargetingKey: "user-123",
        Attributes: map[string]any{"plan": "enterprise"},
    })

    _ = enabled
}
```

`NewClientAndWait` performs the initial configuration refresh. Use `NewClient` when you want to call `Refresh` yourself.

## Polling and subscriptions

Polling is opt-in:

```go
if err := flags.StartPolling(context.Background()); err != nil {
    log.Fatal(err)
}
defer flags.StopPolling()
```

Applications can subscribe to successful configuration changes with `Subscribe`.

## Typed APIs

The native client exposes `Boolean`, `String`, `Number`, `JSON` and corresponding `...Details` methods.

## OpenFeature

The `github.com/flagstack/sdk-go/openfeature` subpackage implements the OpenFeature Go provider. See [OpenFeature](openfeature.md).
