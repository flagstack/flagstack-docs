# Switch On Your Code Documentation

Official documentation for [Switch On Your Code](https://github.com/switchonyourcode/switchonyourcode), built with [Zensical](https://zensical.org/).

The documentation covers self-hosting, concepts, targeting and rollout semantics, the official JavaScript/TypeScript, Python, Go and .NET SDKs, OpenFeature integration, security, operations and reference material.

## Local development

```bash
python -m venv .venv
. .venv/bin/activate
python -m pip install -r requirements.txt
zensical serve
```

Build with the same strict validation used in CI:

```bash
zensical build
```

Zensical 0.0.53 is pinned in `requirements.txt` so CI and contributors build with the same documentation engine.

## Source of truth

User-facing documentation lives in this repository. Normative SDK wire schemas, cross-language evaluation vectors and the Go reference evaluator live in [`switchonyourcode/switchonyourcode`](https://github.com/switchonyourcode/switchonyourcode).

## Contributing

Documentation changes use feature branches and pull requests. Switch On Your Code uses a linear Git history and integrates pull requests by rebase only; organisation-wide contribution and CLA guidance lives in [`switchonyourcode/.github`](https://github.com/switchonyourcode/.github).
