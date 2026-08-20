# Connect an SDK

SDK credentials belong to exactly one environment. Choose the credential type based on where the application code runs.

## Server applications

Use a **server SDK credential** for trusted backend code, workers, CLIs and server-rendered applications.

Server keys look like:

```text
syoc_server_<credential-id>.<secret>
```

The complete key is shown only once. Store it in a secret manager or environment variable such as `SWITCHONYOURCODE_SDK_KEY`.

Server credentials receive all active flags in their environment.

## Browser/public applications

Use a **client SDK credential** for browser code or any runtime where users can inspect the application bundle.

Client keys look like:

```text
syoc_client_<public-id>
```

Client keys are intentionally public. They receive only flags marked **client visible**.

!!! warning "Client-visible configuration is public"
    Values, variants, targeting rules, rollout percentages and referenced segment definitions for a client-visible flag can be downloaded by anyone who has the public client key. Never put secrets or confidential customer lists in client-visible flag configuration.

## Pick an SDK

- [JavaScript / TypeScript](../sdks/javascript.md)
- [React](../sdks/react.md)
- [Next.js](../sdks/nextjs.md)
- [Python](../sdks/python.md)
- [Go](../sdks/go.md)
- [.NET](../sdks/dotnet.md)
- [OpenFeature](../sdks/openfeature.md)
