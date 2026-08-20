# Client-visible flags

Browser and other public clients cannot safely hold a secret. FlagStack therefore separates **server credentials** from deliberately-public **client credentials**.

Client credentials receive only flags marked `client_visible`.

## What becomes public

When you mark a flag client visible, assume the following can be downloaded and inspected by end users:

- the flag key and type;
- default value;
- enabled state;
- named variants and values;
- targeting rules;
- percentage rollout configuration;
- reusable segment definitions referenced by those rules.

Client visibility is therefore an information-disclosure decision, not just an SDK toggle.

## Permissions

Only organisation owners and administrators can change client visibility. Developers can manage ordinary flag state and targeting but cannot expose a flag to public SDK delivery.

## Safe patterns

Good client-visible attributes include broad product data such as plan tier, locale, app version or an opaque account ID supplied by the application.

Do not put API keys, private credentials, internal secrets, confidential allowlists, sensitive customer data, or anything else that relies on concealment into client-visible configuration.
