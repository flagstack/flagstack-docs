# React SDK

React applications use `@switchonyourcode/browser` for configuration and `@switchonyourcode/react` for reactive bindings.

!!! warning "Not yet published"
    `@switchonyourcode/react` and the other npm packages are implemented but not yet released to npm.

## Create the browser client

```ts
import { createBrowserClient } from '@switchonyourcode/browser'

export const flags = await createBrowserClient({
  baseUrl: 'https://flags.example.com',
  clientKey: 'syoc_client_public-id',
})
```

## Provide it to React

```tsx
import { SwitchOnYourCodeProvider } from '@switchonyourcode/react'
import { flags } from './switchonyourcode'

root.render(
  <SwitchOnYourCodeProvider client={flags}>
    <App />
  </SwitchOnYourCodeProvider>,
)
```

## Read a flag

```tsx
import { useBooleanFlag } from '@switchonyourcode/react'

function Checkout() {
  const enabled = useBooleanFlag('new-checkout', false, {
    targetingKey: 'user-123',
  })

  return enabled ? <NewCheckout /> : <CurrentCheckout />
}
```

Hooks subscribe to configuration changes through React's external-store API while evaluation remains local.

Additional hooks include typed details variants plus `useSwitchOnYourCodeReady()`, `useSwitchOnYourCodeConfiguration()` and `useSwitchOnYourCodeClient()`.

Because React runs in the browser, use only client-visible flags and public `syoc_client_...` credentials.
