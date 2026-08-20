# Upgrades

FlagStack database migrations are explicit. The API does not modify its schema automatically at startup.

A safe upgrade sequence is:

1. back up PostgreSQL;
2. pull or build the new FlagStack image;
3. run `/app/flagstack-migrate` against the database;
4. start or roll the new application replicas;
5. verify `/readyz` and the dashboard;
6. verify application SDKs continue to refresh configuration.

The self-hosted Compose stack already encodes migration-before-application ordering.

## Destructive schema changes

Automatic destructive Ent column and index drops are disabled. If a future upgrade requires a destructive migration, it must be introduced deliberately rather than occurring as a startup side effect.

Review release notes before upgrading once versioned production releases begin.
