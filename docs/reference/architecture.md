# Architecture

FlagStack core is a modular monolith optimized for straightforward self-hosting.

## Components

```text
                 ┌───────────────────────┐
                 │      React/Vite UI    │
                 └───────────┬───────────┘
                             │ same origin
                 ┌───────────▼───────────┐
                 │      Go control plane │
                 │ net/http + app logic  │
                 └───────────┬───────────┘
                             │ pgx / Ent
                 ┌───────────▼───────────┐
                 │     PostgreSQL 18     │
                 └───────────────────────┘
```

The production container includes both the Go service and compiled frontend. PostgreSQL is the only required external service.

## Persistence

Ent schemas define the ordinary PostgreSQL model. PostgreSQL-specific composite foreign keys preserve organisation/project/environment tenant boundaries, and explicit migrations run outside API startup.

## SDK path

SDKs download a versioned configuration document, evaluate locally, and revalidate by ETag. Realtime invalidations are delivered through SSE and fanned across replicas through PostgreSQL `LISTEN`/`NOTIFY`.

## Scheduler

Every API replica can run the scheduler loop. Due work is claimed atomically with a lease/token so multiple replicas do not intentionally execute the same scheduled change.

For implementation-level detail, see the [core architecture document](https://github.com/flagstack/flagstack/blob/main/docs/architecture.md).
