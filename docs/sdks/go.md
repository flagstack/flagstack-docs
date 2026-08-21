# Go SDK

Repository: [`switchonyourcode/sdk-go`](https://github.com/switchonyourcode/sdk-go)

Requirements: Go 1.25 or newer and an environment-scoped server SDK key.

Because the module is hosted directly on GitHub, development builds can resolve it with `go get`, although the public API should still be considered pre-release until versioned releases are published.

## Create a client

```go
package main

import (
    "context"
    "log"

    switchonyourcode "github.com/switchonyourcode/sdk-go"
)

func main() {
    flags, err := switchonyourcode.NewClientAndWait(context.Background(), switchonyourcode.ClientOptions{
        BaseURL:   "https://flags.example.com",
        ServerKey: "syoc_server_...",
    })
    if err != nil {
        log.Fatal(err)
    }
    defer flags.Close()

    enabled := flags.Boolean("new-checkout", false, switchonyourcode.EvaluationContext{
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

The `github.com/switchonyourcode/sdk-go/openfeature` subpackage implements the OpenFeature Go provider. See [OpenFeature](openfeature.md).
