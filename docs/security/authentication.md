# Authentication and roles

FlagStack core currently provides local password authentication suitable for self-hosting.

## Password storage

Passwords are hashed with Argon2id using parameters stored in the encoded hash so they can be upgraded later.

Current parameters are 64 MiB memory, 3 passes, 4 lanes, a 16-byte random salt and 32-byte output.

Login responses do not reveal whether an email address exists, and unknown accounts still perform a dummy Argon2id verification to reduce timing differences.

## Browser sessions

Dashboard sessions use opaque 32-byte random tokens. The raw token is stored only in the browser's HttpOnly cookie; PostgreSQL stores its SHA-256 digest.

Mutation requests also use a separate CSRF token cookie/header pair.

## Roles

| Role | Current management boundary |
| --- | --- |
| `owner` | Create projects; manage SDK credentials and client visibility; manage flags/environments/targeting/segments/schedules. |
| `admin` | Same current management boundary as owner. |
| `developer` | Manage environments, flags, variants, targeting, segments and schedules. |
| `viewer` | Read-only. |

SDK delivery does not use dashboard sessions. It authenticates independently with environment-scoped SDK credentials.
