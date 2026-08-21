# Next.js SDK

`@switchonyourcode/next` provides explicit server and client entry points for the Next.js App Router.

!!! warning "Not yet published"
    The package is implemented but not yet released to npm.

## Server Components

Create a server-only helper with your secret SDK key:

```ts
import { createNextSwitchOnYourCode } from '@switchonyourcode/next/server'

export const switchonyourcode = createNextSwitchOnYourCode({
  baseUrl: process.env.SWITCHONYOURCODE_URL!,
  serverKey: process.env.SWITCHONYOURCODE_SDK_KEY!,
})
```

Use it from a Server Component:

```tsx
import { switchonyourcode } from '@/lib/switchonyourcode'

export default async function Page() {
  const flags = await switchonyourcode.getClient()
  const enabled = flags.getBooleanValue('new-checkout', false, {
    targetingKey: 'user-123',
  })

  return enabled ? <NewCheckout /> : <CurrentCheckout />
}
```

The server helper uses React request-scoped caching so a render tree shares the loaded Switch On Your Code client/snapshot without leaking state between requests.

## Client Components

Import browser-safe bindings from:

```ts
import { SwitchOnYourCodeProvider, useBooleanFlag } from '@switchonyourcode/next/client'
```

The client entry is a `'use client'` module and does not import the Node/server credential path. Client Components must use a public `syoc_client_...` key and client-visible flags.
