# Evaluation context

Evaluation context is application-owned data supplied to the SDK at evaluation time. FlagStack does not need a synchronized copy of your user database.

A context can look like:

```json
{
  "targetingKey": "user-123",
  "country": "GB",
  "plan": "enterprise",
  "roles": ["admin", "billing"],
  "organisation_id": "org-42",
  "device": {
    "type": "mobile"
  },
  "app_version": "2.4.0"
}
```

## `targetingKey`

`targetingKey` is the stable subject identifier used by default for deterministic percentage rollouts.

It does not have to represent a user. It can identify:

- an organisation;
- a device;
- a tenant;
- an installation;
- a service instance;
- any other stable subject meaningful to your application.

Use opaque stable identifiers where possible.

## Nested attributes

Rules can reference nested values with dot paths, for example:

```text
device.type
account.subscription.plan
```

## Data minimisation

Only send attributes required for evaluation. FlagStack's local evaluator does not require names or email addresses unless your own targeting policy explicitly uses them.

See [Targeting data and privacy](../security/privacy.md).
