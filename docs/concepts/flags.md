# Feature flags and values

FlagStack currently supports four flag kinds:

| Kind | Typical use |
| --- | --- |
| `boolean` | Turn a feature or code path on/off. |
| `string` | Select a named mode, layout or strategy. |
| `number` | Tune a numeric limit or threshold. |
| `json` | Deliver a structured configuration object. |

Every flag has a project-level **default value**. The default must match the flag kind and forms the safe fallback when the flag is disabled or cannot be evaluated.

## Boolean flags

Boolean flags reserve three built-in variants:

- `on` → `true`
- `off` → `false`
- `default` → the configured project default

A boolean flag that is enabled in an environment with no targeting policy resolves to `on`.

## Non-boolean flags

String, number and JSON flags can define named variants. For example, a string flag named `checkout-layout` might define:

```json
[
  {"key": "control", "value": "control"},
  {"key": "compact", "value": "compact"},
  {"key": "new-design", "value": "new-design"}
]
```

Rules and rollouts select variant **keys**, not arbitrary values. This keeps evaluation metadata understandable and allows the same value type to participate in deterministic multivariate assignment.

## Archiving

Flags support archival for normal product lifecycle management. Archived flags are excluded from active SDK delivery while retaining management history.
