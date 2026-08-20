# Variants and percentage rollout

Switch On Your Code assigns rollout cohorts deterministically so the same subject receives the same variant across repeated evaluations.

## Percentage precision

Rollouts use **100,000 integer buckets**, giving 0.001% granularity without floating-point configuration.

A 10% boolean rollout is represented conceptually as:

```json
{
  "rollout": [
    {"variant": "on", "weight": 10000},
    {"variant": "off", "weight": 90000}
  ]
}
```

Weights must total exactly `100000`.

## Stable assignment

By default, percentage assignment uses `targetingKey`. Switch On Your Code hashes the environment ID, flag ID and targeting key with SHA-256, then maps the result into one of the 100,000 buckets.

Because the assignment is stable, increasing a rollout from 10% to 25% keeps the original 10% cohort and adds more subjects instead of reshuffling everyone.

## Bucket by another attribute

A rollout can use another scalar context attribute, for example `organisation_id`, so everyone in the same organisation receives the same variant.

Custom bucket attributes are normalized through the cross-language v1 serialization contract before hashing. This prevents JavaScript, Python, Go and .NET from disagreeing about numeric or escaped-string representations.

## Multivariate rollout

Weighted assignment works with named variants too:

```json
{
  "rollout": [
    {"variant": "control", "weight": 50000},
    {"variant": "compact", "weight": 25000},
    {"variant": "new-design", "weight": 25000}
  ]
}
```

This supports deterministic A/B or multivariate delivery. Switch On Your Code does **not** currently provide experiment conversion analytics, statistical significance or winner selection.
