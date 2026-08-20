# Configuration

FlagStack core is configured through environment variables.

| Variable | Purpose | Default |
| --- | --- | --- |
| `FLAGSTACK_HTTP_ADDR` | HTTP listen address | `:8080` |
| `FLAGSTACK_DATABASE_URL` | PostgreSQL connection URL | Required |
| `FLAGSTACK_LOG_LEVEL` | Structured log level | `info` |
| `FLAGSTACK_SESSION_TTL` | Dashboard session lifetime | `168h` |
| `FLAGSTACK_SESSION_COOKIE_SECURE` | Require HTTPS for dashboard session cookie | `true` in the application |
| `FLAGSTACK_STATIC_DIR` | Compiled dashboard directory | Empty in development; `/app/frontend` in production image |

The self-hosted Compose stack additionally uses:

| Variable | Purpose |
| --- | --- |
| `FLAGSTACK_POSTGRES_PASSWORD` | Password for the bundled PostgreSQL service. |
| `FLAGSTACK_PORT` | Host port published for FlagStack (default `8080`). |

## Database URL

A self-hosted connection string looks like:

```text
postgres://flagstack:<password>@postgres:5432/flagstack?sslmode=disable
```

Use your managed PostgreSQL provider's TLS requirements in production rather than copying `sslmode=disable` outside the local Compose network.
