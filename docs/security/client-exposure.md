# Browser/client exposure

A client SDK key is not a secret. Security comes from controlling **what FlagStack delivers**, not from trying to hide the key in a JavaScript bundle.

Before marking a flag client visible, review everything in its delivered configuration:

- default value;
- variants;
- targeting rules;
- rollout percentages;
- segment definitions referenced by those rules.

If any of that information is confidential, keep the flag server-only and evaluate it in trusted backend code instead.

## Common mistake

Do not use a server credential in frontend environment variables such as `VITE_*` or `NEXT_PUBLIC_*`. Those values are intentionally embedded into client bundles.

The official browser SDK rejects `fs_server_...` credentials before making a request to help catch this mistake early.
