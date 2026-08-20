# Scheduling

FlagStack can persist future environment changes instead of requiring an external cron job to call the API.

A scheduled change can modify:

- whether a flag is enabled;
- its environment targeting policy.

## Progressive rollout

Progressive rollout is represented as multiple scheduled policy changes, for example:

```text
09:00     5% on / 95% off
12:00    10% on / 90% off
next day 25% on / 75% off
next day 50% on / 50% off
final    100% on
```

This deliberately reuses the ordinary deterministic rollout model rather than creating a separate evaluation mode.

## Reliability

Due work is claimed atomically in PostgreSQL with a bounded lease and claim token. Multiple FlagStack replicas can run the scheduler simultaneously without intentionally executing the same scheduled change twice.

When a scheduled change commits, it uses the same SDK invalidation path as an interactive dashboard change.
