# Evaluation contract

The normative v1 evaluator is defined by FlagStack core and reproduced by every official SDK.

This reference summarizes the contract; the authoritative implementation/specification lives in the [core repository](https://github.com/flagstack/flagstack/tree/main/spec) and its [evaluation design document](https://github.com/flagstack/flagstack/blob/main/docs/evaluation.md).

## Evaluation order

1. If the environment configuration is missing/disabled, return the project default with `DISABLED`.
2. Evaluate targeting rules from first to last; the first matching rule wins.
3. Resolve that rule's fixed variant or weighted rollout.
4. If no rule matches, resolve the fallthrough outcome.
5. An enabled boolean with no policy resolves to built-in `on`; an enabled non-boolean with no policy resolves to its default.

## Resolution details

SDK details methods return:

- resolved `value`;
- `variant`;
- `reason`;
- optional matching `rule_id`;
- `error_code` and `error_message` when evaluation falls back safely.

Reasons include `STATIC`, `DEFAULT`, `TARGETING_MATCH`, `SPLIT`, `DISABLED` and `ERROR`.

## Deterministic bucketing

The v1 algorithm uses 100,000 buckets:

```text
input = "flagstack-v1" + NUL + environment_id + NUL + flag_id + NUL + bucket_value
hash = SHA-256(input UTF-8 bytes)
bucket = big-endian uint32(hash[0:4]) mod 100000
```

Reference vector:

```text
environment_id = env-1
flag_id        = flag-1
bucket_value   = user-123
bucket         = 22683
```

For a custom scalar `bucket_by` attribute, `bucket_value` is the exact cross-language representation pinned by the core compatibility vectors. `targetingKey` itself is hashed directly as a string without JSON quotes.

## Failure safety

Unsupported schema versions, invalid variants, malformed policies, invalid regexes, segment cycles or missing rollout keys must fail safely to the caller/configured fallback rather than producing a runtime-specific result.
