# Reverse proxy and TLS

Put internet-facing FlagStack deployments behind a TLS-terminating reverse proxy, ingress controller or load balancer.

Set:

```text
FLAGSTACK_SESSION_COOKIE_SECURE=true
```

## Paths

The dashboard and management API share the same origin. Do not cache authenticated management API responses.

SDK endpoints live under `/sdk/`. The realtime endpoint `/sdk/v1/events` is a long-lived Server-Sent Events response.

Your proxy should:

- allow streaming responses for `/sdk/v1/events`;
- avoid response buffering on the SSE path;
- avoid caching the SSE stream;
- pass `Authorization`, `If-None-Match` and ordinary cache headers through unchanged;
- use idle/read timeouts long enough for persistent event streams.

FlagStack sends periodic SSE comment heartbeats to help intermediaries keep otherwise-idle streams open.
