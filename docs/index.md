# FlagStack documentation

FlagStack is a source-available, self-hostable feature management platform with local SDK evaluation, deterministic targeting and rollouts, realtime configuration invalidation, and OpenFeature support.

!!! warning "Early development"
    FlagStack is still in early development and is **not yet recommended for production use**. The official SDK APIs are being validated and most language packages have not yet been published to their public package registries.

## Start here

<div class="grid cards" markdown>

-   **Self-host FlagStack**

    ---

    Run the control plane, dashboard and PostgreSQL with the supplied Docker Compose stack.

    [Self-hosting quick start](getting-started/self-host.md)

-   **Understand the model**

    ---

    Learn how organisations, projects, environments, flags, targeting rules and segments fit together.

    [Core concepts](concepts/hierarchy.md)

-   **Connect an application**

    ---

    Use JavaScript/TypeScript, Python, Go or .NET, or integrate through OpenFeature.

    [SDK overview](sdks/index.md)

-   **Operate safely**

    ---

    Configure TLS, health checks, backups, upgrades and credential security.

    [Operations](operations/self-hosting.md)

</div>

## What FlagStack does

FlagStack separates **feature-management decisions** from application deployments. Your application downloads an environment-scoped configuration document, validates and caches it, then evaluates flags locally without a network request for each decision.

The initial platform supports:

- boolean, string, number and JSON flags;
- separate environments such as development, staging and production;
- project-level flag definitions with environment-specific enablement and policy;
- ordered targeting rules over application-supplied context;
- reusable segments;
- deterministic percentage and multivariate rollouts;
- scheduled configuration changes and progressive rollouts;
- server SDK credentials and deliberately-public client credentials;
- ETag-based configuration refreshes plus an authenticated realtime invalidation stream;
- official SDKs for JavaScript/TypeScript, Python, Go and .NET;
- OpenFeature provider integrations;
- first-class self-hosting with PostgreSQL as the only required external service.

## Core design principle

Flag evaluation stays in the SDK. If the FlagStack control plane is temporarily unavailable after an SDK has loaded a valid configuration, applications continue to evaluate against their last known-good snapshot.

That makes FlagStack part of the **control path**, not the hot request path of your application.

## Source and licences

The [FlagStack core repository](https://github.com/flagstack/flagstack) is licensed under the Elastic License 2.0. Official SDK repositories use the Apache License 2.0. Refer to each repository's `LICENSE` file for authoritative terms.
