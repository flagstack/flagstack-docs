# Glossary

**Client credential**  
A deliberately-public `fs_client_...` environment credential. It receives only client-visible flags.

**Client-visible flag**  
A flag whose complete delivered configuration may be exposed to public/browser SDKs.

**Environment**  
An independently configured deployment context inside a project, such as development, staging or production.

**Evaluation context**  
Application-supplied targeting data, including a stable `targetingKey` and arbitrary attributes.

**Fallthrough**  
The outcome used when no ordered targeting rule matches.

**Flag definition**  
Project-scoped key, type, default and named variants shared across environments.

**Local evaluation**  
Resolving a flag inside the SDK from cached configuration rather than making a network call per evaluation.

**Organisation**  
Top-level FlagStack tenant and membership boundary.

**Project**  
An application/service boundary containing environments, flags and segments.

**Revision**  
Monotonically increasing environment-flag configuration revision used for configuration/audit metadata.

**Segment**  
Reusable project-scoped targeting conditions referenced by flag rules.

**Server credential**  
A secret `fs_server_...` environment credential for trusted backend code.

**Variant**  
A named flag value selected by a rule or weighted rollout.
