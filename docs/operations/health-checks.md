# Health checks

FlagStack exposes separate liveness and readiness endpoints.

| Endpoint | Meaning |
| --- | --- |
| `/healthz` | Process liveness only. |
| `/readyz` | Application readiness including PostgreSQL connectivity. |
| `/api/v1/health` | API health response. |

Use `/readyz` when deciding whether a replica should receive traffic. A running process with an unavailable database should not be considered ready.

The self-hosted CI smoke test boots a clean PostgreSQL 18 instance, runs migrations, starts FlagStack, waits for `/readyz`, and verifies that the compiled dashboard is served from the application container.
