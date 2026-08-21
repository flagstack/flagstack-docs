# Data model

The user-facing hierarchy is straightforward even though PostgreSQL enforces additional tenant IDs and composite foreign keys internally.

```text
User ── Membership ── Organisation
                        │
                        └── Project
                            ├── Environment
                            │   ├── Environment flag configuration
                            │   ├── SDK credential
                            │   └── Scheduled flag changes
                            ├── Feature flag
                            │   └── Variants
                            └── Segment
```

## Project-scoped definitions

Feature flags and reusable segments belong to a project. Flag keys are unique within their project.

## Environment-scoped state

Environment flag configuration contains enablement, optional environment value override, targeting policy and revision. Missing configuration means disabled/default.

SDK credentials are also environment-scoped.

## Identity

Users, local credentials and sessions are separate records. Organisation membership supplies the application role.

## Identifiers

Core entities use UUIDv7, including PostgreSQL 18 `uuidv7()` defaults for database-created rows.

For schema-level detail, see the [core data model document](https://github.com/switchonyourcode/switchonyourcode/blob/main/docs/data-model.md).
