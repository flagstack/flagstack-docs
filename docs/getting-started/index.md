# Getting started

A typical first Switch On Your Code setup has four steps:

1. run Switch On Your Code or use a hosted instance;
2. complete first-run setup and create an organisation owner;
3. create a project, environments and at least one feature flag;
4. create an environment-scoped SDK credential and connect your application.

For self-hosting, PostgreSQL 18 is the only required external service. The production Switch On Your Code image contains the Go control plane, database migration command and compiled React dashboard.

## Recommended path

If you are evaluating Switch On Your Code locally, follow these pages in order:

1. [Self-host with Docker](self-host.md)
2. [First-run setup](first-run.md)
3. [Create your first flag](first-flag.md)
4. [Connect an SDK](connect-sdk.md)

!!! info "Package status"
    The official SDK repositories are implemented and tested, but package-registry publication is still being prepared. The SDK pages document the intended public APIs and link to the source repositories.
