# Targeting data and privacy

FlagStack does not require an imported or synchronized user directory for targeting. Your application provides context at evaluation time.

Prefer:

- opaque stable subject IDs;
- broad attributes such as plan, country/region, role or app version;
- the minimum data required to express your targeting policy.

Avoid collecting names, email addresses or other personal data solely because the feature-flag system can accept arbitrary attributes.

For server-side evaluation, context remains inside your application process during local evaluation after configuration has been loaded. FlagStack's configuration document describes rules and segments; it does not contain a database of your application users.

For browser evaluation, remember that client-visible targeting rules and segment definitions are public configuration even if the runtime context values themselves come from your application.
