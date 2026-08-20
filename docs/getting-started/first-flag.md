# Create your first flag

FlagStack defines feature flags at **project scope** and stores enablement/targeting policy separately for each environment.

## 1. Create a project

A project represents an application, service or other deployable unit that will consume FlagStack flags.

Use a stable project key that describes the application rather than an environment, for example `checkout-service` or `customer-portal`.

## 2. Create environments

Common environment keys are:

- `development`
- `staging`
- `production`

Environment keys are unique only within a project, so every project can use the same familiar names.

## 3. Create a flag

For a first test, create a boolean flag such as:

```text
key: new-checkout
type: boolean
default: false
```

The project-level default is the safe fallback. Environment configuration is sparse: until an environment is configured, the flag behaves as disabled and resolves to its default.

## 4. Enable it in development

Select the development environment and enable the flag. A simple enabled boolean flag with no targeting policy resolves to the built-in `on` variant (`true`).

Later, you can add [targeting rules](../concepts/targeting.md), [segments](../concepts/segments.md), [percentage rollout](../concepts/rollouts.md), or [scheduled changes](../concepts/scheduling.md).
