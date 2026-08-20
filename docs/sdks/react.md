# React SDK

React applications use `@flagstack/browser` for configuration and `@flagstack/react` for reactive bindings.

!!! warning "Not yet published"
    `@flagstack/react` and the other npm packages are implemented but not yet released to npm.

## Create the browser client

```ts
import { createBrowserClient } from '@flagstack/browser'

export const flags = await createBrowserClient({
  baseUrl: 'https://flags.example.com',
  clientKey: 'fs_client_public-id',
})
```

## Provide it to React

```tsx
import { FlagStackProvider } from '@flagstack/react'
import { flags } from './flagstack'

root.render(
  <FlagStackProvider client={flags}>
    <App />
  </FlagStackProvider>,
)
```

## Read a flag

```tsx
import { useBooleanFlag } from '@flagstack/react'

function Checkout() {
  const enabled = useBooleanFlag('new-checkout', false, {
    targetingKey: 'user-123',
  })

  return enabled ? <NewCheckout /> : <CurrentCheckout />
}
```

Hooks subscribe to configuration changes through React's external-store API while evaluation remains local.

Additional hooks include typed details variants plus `useFlagStackReady()`, `useFlagStackConfiguration()` and `useFlagStackClient()`.

Because React runs in the browser, use only client-visible flags and public `fs_client_...` credentials.
