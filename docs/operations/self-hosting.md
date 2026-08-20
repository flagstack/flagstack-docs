# Self-hosting

Core FlagStack is designed to be genuinely useful without FlagStack Cloud.

The production image contains:

- `/app/flagstack` — Go API and dashboard server;
- `/app/flagstack-migrate` — explicit Ent/PostgreSQL migration command;
- `/app/frontend` — compiled React/Vite dashboard assets.

PostgreSQL 18 is the only required external service.

## Compose deployment

The repository's `compose.selfhost.yml` models the production startup order explicitly:

```text
PostgreSQL readiness
        ↓
one-shot database migration
        ↓
FlagStack application
```

The application never mutates the database schema automatically at API startup.

For a local stack:

```bash
cp .env.example .env
make selfhost-up
```

## Production principles

- Use TLS for internet-facing deployments.
- Keep `FLAGSTACK_SESSION_COOKIE_SECURE=true` behind HTTPS.
- Run the migration command before rolling out a new application image.
- Back up PostgreSQL; the image and frontend are replaceable artifacts.
- Use `/readyz`, not merely process liveness, for traffic readiness.

The container runs as an unprivileged user.
