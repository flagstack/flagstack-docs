# JavaScript / TypeScript SDK

Repository: [`switchonyourcode/sdk-js`](https://github.com/switchonyourcode/sdk-js)

The JavaScript workspace separates the shared evaluator from runtime/framework integrations:

- `@switchonyourcode/core` — runtime-neutral config parsing and evaluation;
- `@switchonyourcode/browser` — public client-key browser lifecycle;
- `@switchonyourcode/node` — secret server-key Node.js lifecycle;
- `@switchonyourcode/react` — reactive React bindings;
- `@switchonyourcode/next` — Next.js App Router server/client entry points;
- `@switchonyourcode/openfeature` — OpenFeature server and web providers.

!!! warning "Not yet published"
    The npm packages are not yet released. The examples below describe the implemented public API that will be published from the SDK repository.

## Browser

Browser code must use a public client credential:

```ts
import { createBrowserClient } from '@switchonyourcode/browser'

const flags = await createBrowserClient({
  baseUrl: 'https://flags.example.com',
  clientKey: 'syoc_client_public-id',
})

const enabled = flags.getBooleanValue('new-checkout', false, {
  targetingKey: 'user-123',
  country: 'GB',
})
```

The browser wrapper rejects `syoc_server_...` credentials before making a request. It performs an initial refresh and polls by default. Pass `autoPoll: false` when your application wants manual lifecycle control, and call `close()` on shutdown.

## Node.js

Node.js code uses a secret server credential:

```ts
import { createNodeClient } from '@switchonyourcode/node'

const flags = await createNodeClient({
  baseUrl: process.env.SWITCHONYOURCODE_URL!,
  serverKey: process.env.SWITCHONYOURCODE_SDK_KEY!,
  autoPoll: true,
})

const layout = flags.getStringValue('checkout-layout', 'control', {
  targetingKey: 'user-123',
  plan: 'enterprise',
})
```

Node polling is opt-in so CLI/serverless processes can exit normally.

## Typed evaluation

The core exposes value and details methods for boolean, string, number and JSON flags. Details include the resolved variant, reason, matched rule ID, and safe error metadata when the fallback is used.
