# OpenFeature

Switch On Your Code's evaluation model and resolution metadata are designed to map cleanly onto [OpenFeature](https://openfeature.dev/). Official provider integrations are implemented for JavaScript/TypeScript, Python, Go and .NET.

OpenFeature is useful when you want application code to depend on a vendor-neutral feature-flag API while keeping Switch On Your Code as the provider.

## JavaScript server provider

```ts
import { OpenFeature } from '@openfeature/server-sdk'
import { SwitchOnYourCodeServerProvider } from '@switchonyourcode/openfeature/server'

await OpenFeature.setProviderAndWait(
  new SwitchOnYourCodeServerProvider({
    baseUrl: 'https://flags.example.com',
    serverKey: process.env.SWITCHONYOURCODE_SDK_KEY!,
    autoPoll: true,
  }),
)

const client = OpenFeature.getClient()
const enabled = await client.getBooleanValue('new-checkout', false, {
  targetingKey: 'user-123',
  plan: 'enterprise',
})
```

Browser applications use `SwitchOnYourCodeClientProvider` from `@switchonyourcode/openfeature/client` with a public client key.

## Python

```python
from openfeature import api
from openfeature.evaluation_context import EvaluationContext
from switchonyourcode.openfeature import SwitchOnYourCodeProvider

api.set_provider_and_wait(
    SwitchOnYourCodeProvider(
        base_url="https://flags.example.com",
        server_key="syoc_server_...",
    )
)

client = api.get_client()
enabled = client.get_boolean_value(
    "new-checkout",
    False,
    EvaluationContext(targeting_key="user-123", attributes={"plan": "enterprise"}),
)
```

## Go

Use `github.com/switchonyourcode/sdk-go/openfeature` with the OpenFeature Go SDK. The provider supports provider lifecycle, context conversion, resolution details and configuration-change events.

## .NET

Use the `SwitchOnYourCode.OpenFeature` package and register `SwitchOnYourCodeProvider` with `OpenFeature.Api.Instance`.

## Metadata mapping

Providers preserve Switch On Your Code's variant/reason/error information and expose relevant metadata such as environment identity, flag revision, enabled state and matched rule ID.

Date/time context values are normalized deterministically per runtime before they enter Switch On Your Code targeting.
