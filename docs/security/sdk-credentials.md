# SDK credentials

SDK credentials are scoped to one environment and are separate from dashboard user authentication.

## Server credentials

Server keys contain a high-entropy secret:

```text
syoc_server_<credential-id>.<secret>
```

The random secret contains 256 bits of entropy. Switch On Your Code shows the complete key only when it is created and stores only a SHA-256 digest of the secret portion.

Treat a server key like any production secret:

- place it in a secret manager or environment variable;
- never commit it to source control;
- never expose it in browser/mobile code;
- revoke and replace it if it may have leaked.

## Client credentials

Client keys are deliberately public identifiers:

```text
syoc_client_<public-id>
```

They are suitable for browser/public runtimes only because the server filters delivery to client-visible flags.

## Revocation

Revoked credentials remain visible for operational history but can no longer fetch SDK configuration. Realtime streams for a revoked credential are closed by the control plane.
