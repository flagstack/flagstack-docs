# Organisations, projects and environments

Switch On Your Code's tenancy hierarchy is:

```text
Organisation
└── Project
    ├── Environment
    ├── Feature flags
    └── Segments
```

## Organisations

An organisation is the top-level tenancy and permission boundary. Users belong to organisations through memberships with the `owner`, `admin`, `developer` or `viewer` role.

## Projects

A project represents one application or service integrating with Switch On Your Code. Feature-flag definitions and reusable segments are project-scoped.

A user can work with multiple projects in the same organisation, and a future user/account model can support membership in multiple organisations.

## Environments

An environment represents an independently-configured deployment context, such as development, staging or production.

Feature flags do **not** need to be recreated for every environment. The definition stays at project scope while each environment stores only its own enablement, optional value override, targeting policy and revision.

This separation makes it possible to keep one stable flag key while safely rolling it out differently in each environment.
