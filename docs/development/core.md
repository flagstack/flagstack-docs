# Core development

The core repository is [`switchonyourcode/switchonyourcode`](https://github.com/switchonyourcode/switchonyourcode).

Its main directories are:

- `backend/` — Go application, Ent schemas and persistence;
- `frontend/` — React/TypeScript/Tailwind dashboard;
- `spec/` — machine-readable SDK wire schema and evaluation compatibility vectors;
- `.devcontainer/` — reproducible development environment.

The recommended bootstrap path is:

```bash
cp .env.example .env
make bootstrap
make infra-up
make db-up
```

Then run:

```bash
make dev-backend
make dev-frontend
```

Run repository checks with:

```bash
make check
```

Switch On Your Code uses a linear Git history. Pull requests are integrated by rebase only; merge commits and squash merges are not used. Organisation-wide contribution and CLA guidance lives in [`switchonyourcode/.github`](https://github.com/switchonyourcode/.github).
