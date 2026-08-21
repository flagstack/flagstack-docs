# Segments

Segments are reusable project-scoped targeting definitions. They let multiple flags share the same audience logic without duplicating conditions.

A segment contains:

- a stable key;
- a display name;
- `all` or `any` matching;
- one or more targeting conditions.

Example:

```json
{
  "key": "uk-beta-testers",
  "name": "UK beta testers",
  "match": "all",
  "conditions": [
    {"attribute": "country", "operator": "equals", "value": "GB"},
    {"attribute": "custom.beta_program", "operator": "equals", "value": true}
  ]
}
```

A flag rule then uses `in_segment` or `not_in_segment`.

## Nested segments

Segments may reference other segments. Switch On Your Code validates dependencies and rejects cycles before persistence. SDK evaluation also detects cycles and fails safely rather than recursing indefinitely.

## SDK delivery

An SDK configuration document contains only the segments required by the flags delivered to that credential, including transitive segment dependencies. Unrelated project segments are omitted.
