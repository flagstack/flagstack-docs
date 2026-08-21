# Backups and recovery

PostgreSQL is Switch On Your Code's system of record. The application image and compiled frontend contain no persistent customer state.

## Back up

Use normal PostgreSQL tooling appropriate to your deployment:

- `pg_dump` / `pg_restore`;
- physical/base backups;
- point-in-time recovery/WAL archiving;
- managed PostgreSQL provider snapshots and automated backups.

Your recovery plan should protect organisation/project/flag configuration, user/session data, SDK credential records and scheduled changes.

Server SDK secrets are **not recoverable** from the database: Switch On Your Code stores only a digest of the secret portion. If the original secret is lost, create a replacement credential and revoke the old one.

## Test restores

A backup is useful only if it can be restored. Periodically restore into an isolated PostgreSQL instance and verify Switch On Your Code can migrate the restored database and pass `/readyz`.
