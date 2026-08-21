# Documentation development

The documentation site is built with [Zensical](https://zensical.org/) and plain Markdown.

## Local setup

```bash
git clone https://github.com/switchonyourcode/switchonyourcode-docs.git
cd switchonyourcode-docs
python -m venv .venv
. .venv/bin/activate
python -m pip install -r requirements.txt
```

Build once:

```bash
zensical build
```

Serve with live rebuilds:

```bash
zensical serve
```

The site configuration enables Zensical strict mode, so validation warnings such as broken internal links fail the build in CI.

## Source of truth

User-facing guidance belongs here. Normative wire schemas, compatibility vectors and the reference evaluator remain in `switchonyourcode/switchonyourcode` so SDK implementations and docs cannot independently redefine evaluation semantics.

When changing an SDK API, update that SDK's README/tests first and then update the corresponding docs page.
