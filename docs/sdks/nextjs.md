# Next.js SDK

`@flagstack/next` provides explicit server and client entry points for the Next.js App Router.

!!! warning "Not yet published"
    The package is implemented but not yet released to npm.

## Server Components

Create a server-only helper with your secret SDK key:

```ts
import { createNextFlagStack } from '@flagstack/next/server'

export const flagstack = createNextFlagStack({
  baseUrl: process.env.FLAGSTACK_URL!,
  serverKey: process.env.FLAGSTACK_SDK_KEY!,
})
```

Use it from a Server Component:

```tsx
import { flagstack } from '@/lib/flagstack'

export default async function Page() {
  const flags = await flagstack.getClient()
  const enabled = flags.getBooleanValue('new-checkout', false, {
    targetingKey: 'user-123',
  })

  return enabled ? <NewCheckout /> : <CurrentCheckout />
}
```

The server helper uses React request-scoped caching so a render tree shares the loaded FlagStack client/snapshot without leaking state between requests.

## Client Components

Import browser-safe bindings from:

```ts
import { FlagStackProvider, useBooleanFlag } from '@flagstack/next/client'
```

The client entry is a `'use client'` module and does not import the Node/server credential path. Client Components must use a public `fs_client_...` key and client-visible flags.
