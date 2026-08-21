# SDK configuration delivery

SDKs authenticate independently of the dashboard and fetch environment-scoped configuration from:

```http
GET /sdk/v1/config
Authorization: Bearer <sdk-key>
```

The authoritative wire contract and JSON Schema live in the [Switch On Your Code core `spec/` directory](https://github.com/switchonyourcode/switchonyourcode/tree/main/spec).

## Cache validation

Responses include a strong content-derived ETag and require revalidation:

```http
ETag: "sha256-..."
Cache-Control: private, max-age=0, must-revalidate
```

An SDK sends the previous ETag in `If-None-Match`. Unchanged configuration returns `304 Not Modified` with no body.

SDKs retain the last valid configuration if a later refresh fails.

## Server and client filtering

Server credentials receive every active flag in their environment.

Client credentials receive only active flags marked `client_visible`, plus only the reusable segments transitively referenced by those delivered policies.

## Realtime endpoint

Core exposes:

```http
GET /sdk/v1/events
Authorization: Bearer <sdk-key>
Accept: text/event-stream
```

The stream sends `ready`, `configuration_changed` and credential-revocation information. A configuration-change event contains no flag payload; the SDK refreshes `/sdk/v1/config` with its current ETag.

Changes propagate between Switch On Your Code replicas through PostgreSQL `LISTEN`/`NOTIFY`, with database triggers publishing only after the underlying transaction commits.

Polling remains the reliability fallback even when realtime stream consumption is enabled.
