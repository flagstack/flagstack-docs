# Configuration

Switch On Your Code core is configured through environment variables.

| Variable | Purpose | Default |
| --- | --- | --- |
| `SWITCHONYOURCODE_HTTP_ADDR` | HTTP listen address | `:8080` |
| `SWITCHONYOURCODE_DATABASE_URL` | PostgreSQL connection URL | Required |
| `SWITCHONYOURCODE_LOG_LEVEL` | Structured log level | `info` |
| `SWITCHONYOURCODE_SESSION_TTL` | Dashboard session lifetime | `168h` |
| `SWITCHONYOURCODE_SESSION_COOKIE_SECURE` | Require HTTPS for dashboard session cookie | `true` in the application |
| `SWITCHONYOURCODE_STATIC_DIR` | Compiled dashboard directory | Empty in development; `/app/frontend` in production image |

The self-hosted Compose stack additionally uses:

| Variable | Purpose |
| --- | --- |
| `SWITCHONYOURCODE_POSTGRES_PASSWORD` | Password for the bundled PostgreSQL service. |
| `SWITCHONYOURCODE_PORT` | Host port published for Switch On Your Code (default `8080`). |

## Database URL

A self-hosted connection string looks like:

```text
postgres://switchonyourcode:<password>@postgres:5432/switchonyourcode?sslmode=disable
```

Use your managed PostgreSQL provider's TLS requirements in production rather than copying `sslmode=disable` outside the local Compose network.
