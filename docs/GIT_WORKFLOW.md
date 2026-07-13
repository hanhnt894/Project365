# Git Workflow

## Daily Workflow

### Morning

```bash
git pull
```

Pull the latest changes to start the day with an up-to-date repository.

### Study

Complete the day's lesson. Changes will be made to Lesson Pack files, Progress.md, and any error logs.

### Commit

```bash
git add .
git commit -m "feat(dayXXX): complete lesson"
git push
```

## Commit Message Convention

| Type | Scope | Description | Example |
|------|-------|-------------|---------|
| `feat` | `dayXXX` | Complete a day's lesson | `feat(day005): complete lesson` |
| `docs` | — | Update documentation | `docs: update guide` |
| `fix` | — | Grammar or content correction | `fix: grammar correction` |
| `refactor` | — | Restructure files or code | `refactor: reorganize templates` |
| `chore` | — | Maintenance tasks | `chore: update .gitignore` |

### Format

```
type(scope): description
```

- `type` — the kind of change (feat, fix, docs, refactor, chore)
- `scope` — optional, the area affected (e.g., `day005`, `cli`)
- `description` — imperative, lowercase, no period at end

## Rules

- Always `git pull` before `git push`.
- Commit after completing each day — one commit per day.
- Never force push to `main`.
- Never commit generated or temporary files.
- Use meaningful commit messages following the convention.
