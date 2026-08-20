# Targeting rules

Targeting rules are evaluated **from first to last**. The first matching rule wins.

A rule contains:

- a stable rule ID;
- an optional display name;
- `all` or `any` condition matching;
- one or more conditions;
- an outcome (a variant or weighted rollout).

Example:

```json
{
  "id": "enterprise-users",
  "name": "Enterprise customers",
  "match": "all",
  "conditions": [
    {"attribute": "plan", "operator": "equals", "value": "enterprise"},
    {"attribute": "account.active", "operator": "equals", "value": true}
  ],
  "outcome": {"variant": "on"}
}
```

## Operators

FlagStack's v1 evaluation contract includes:

- equality: `equals`, `not_equals`;
- membership: `in`, `not_in`;
- containment: `contains`, `not_contains`;
- strings: `starts_with`, `ends_with`, `matches_regex`;
- numbers: `greater_than`, `greater_than_or_equal`, `less_than`, `less_than_or_equal`;
- presence: `exists`, `not_exists`;
- semantic versions: `semver_greater_than`, `semver_greater_than_or_equal`, `semver_less_than`, `semver_less_than_or_equal`;
- segments: `in_segment`, `not_in_segment`.

Missing attributes do not satisfy ordinary or negative comparisons. Use `not_exists` when absence itself is the condition you want to match.

## Regular expressions

Regex rules use a portable RE2-compatible subset shared by every official SDK. Look-around, backreferences and POSIX character classes such as `[[:alpha:]]` are rejected by core validation because they cannot be evaluated consistently across all supported runtimes.

## Semantic versions

Semantic-version comparisons follow FlagStack's Go reference semantics and accept shorthand such as `2` and `2.4` (equivalent to `2.0.0` and `2.4.0`).
