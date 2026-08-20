# Self-host with Docker

FlagStack ships a complete self-hosted Compose stack with one application image and PostgreSQL 18.

## 1. Clone FlagStack

```bash
git clone https://github.com/flagstack/flagstack.git
cd flagstack
```

## 2. Create your environment file

```bash
cp .env.example .env
```

Set a strong `FLAGSTACK_POSTGRES_PASSWORD` before exposing the deployment outside your machine.

## 3. Start the stack

```bash
make selfhost-up
```

The stack starts in this order:

1. PostgreSQL starts and passes its readiness check.
2. The one-shot FlagStack migration container updates the database schema.
3. The FlagStack application starts only after migration succeeds.
4. The Go application serves both the API and compiled React dashboard.

Open `http://localhost:8080` unless you changed `FLAGSTACK_PORT`.

## 4. Stop the stack

```bash
make selfhost-down
```

The named PostgreSQL volume is retained. Do not add `-v` unless you intentionally want to delete all FlagStack data.

## Internet-facing deployments

Terminate TLS in a reverse proxy or ingress and set:

```text
FLAGSTACK_SESSION_COOKIE_SECURE=true
```

See [Self-hosting](../operations/self-hosting.md) for production image details, [reverse proxy and TLS](../operations/reverse-proxy.md), [backups](../operations/backups.md), and [upgrades](../operations/upgrades.md).
