# First-run setup

A new Switch On Your Code database contains no user accounts. The dashboard detects this state and presents the bootstrap flow.

The first-run transaction creates:

- the first user;
- that user's local password credential;
- the first organisation;
- an `owner` membership;
- an authenticated dashboard session.

The operation is transaction-safe and protected against concurrent bootstrap requests. Once any user exists, bootstrap is permanently disabled.

## Password requirements

Local passwords must be at least 12 characters. Switch On Your Code stores local passwords using Argon2id and stores only hashed browser session tokens in PostgreSQL.

## After setup

The first owner can create projects and manage SDK credentials. Organisation roles are currently:

| Role | Typical access |
| --- | --- |
| `owner` | Full management, including project creation and SDK credential/client-exposure management. |
| `admin` | Same current management boundary as owner for project and SDK credential operations. |
| `developer` | Manage environments, flags, targeting, segments and schedules, but not SDK credentials/client visibility. |
| `viewer` | Read-only access. |

See [Authentication and roles](../security/authentication.md) for the security model.
