# Local evaluation and configuration freshness

Official FlagStack SDKs evaluate flags locally from a validated environment configuration snapshot.

## Configuration flow

1. The SDK authenticates with its environment-scoped SDK key.
2. It downloads `/sdk/v1/config`.
3. The SDK validates the schema and evaluation semantics before replacing its current snapshot.
4. Flag reads happen synchronously/in-process against that snapshot.
5. Later refreshes send `If-None-Match` with the previous ETag and can receive `304 Not Modified`.

A failed later refresh does not erase a valid cached configuration.

## Polling

Polling is the reliability baseline. Official SDKs expose polling controls appropriate to their runtime (for example opt-in polling for Node/Go/.NET server processes and default polling for the browser wrapper).

## Realtime invalidation

FlagStack core also exposes an authenticated Server-Sent Events stream at `/sdk/v1/events`. It sends invalidations rather than the configuration itself; the client then performs the same conditional `/sdk/v1/config` refresh.

!!! info "Current SDK status"
    The core realtime endpoint is implemented, but the current official SDK release candidates still rely on polling for freshness. Realtime stream consumption will be added to the SDK clients without changing evaluation semantics or the configuration wire format.

The design keeps `/sdk/v1/config` as the single source of truth and makes realtime an acceleration path rather than a separate configuration protocol.
