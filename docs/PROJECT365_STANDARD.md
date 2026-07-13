# PROJECT365 Standard

## Mission

Empower consistent self-development through structured daily learning, powered by engineering discipline and AI assistance.

## Learning Philosophy

- Consistency over intensity — study every day, even if just 30 minutes.
- Active recall over passive reading — always write before checking answers.
- Incremental progress — maximum 10 new vocabulary words per day.
- Error-driven learning — every mistake is a learning opportunity.

## Daily Workflow

1. **Morning** — `git pull`, review previous day, set daily goal.
2. **Study** — Complete Lesson Pack (Goal, Vocabulary, Grammar, Reading, Listening, Speaking, Writing).
3. **Evening** — Pronunciation, Shadowing, Review, Reflection, Anki.
4. **Commit** — `git add .`, `git commit -m "..."`, `git push`.

## Review Workflow

- **Daily** — Review yesterday's vocabulary before learning new words.
- **Weekly (Sunday)** — Full week review, error log analysis.
- **Monthly (Last day)** — Comprehensive month review, strategy adjustment.
- **Sprint (Every 4 learning days)** — Sprint retrospective.

## AI Coach Responsibilities

- Generate Lesson Pack content based on the topic.
- Provide grammar explanations and examples.
- Create Reflection questions for each lesson.
- Generate Review exercises.
- Track daily progress and suggest improvements.

## Student Responsibilities

- Study daily without skipping.
- Complete all sections of the Lesson Pack.
- Record every mistake in ErrorLog.
- Review yesterday's material before new content.
- Update Progress.md after completing each day.

## Folder Standards

| Folder | Purpose |
|--------|---------|
| `English365/` | English learning module |
| `docs/` | Technical documentation |
| `scripts/` | Automation PowerShell scripts |
| `templates/` | Reusable templates |
| `prompts/` | AI prompt instructions |
| `assets/` | Multimedia resources |

## Markdown Standards

- Use `#` for title, `##` for sections, `###` for subsections.
- Use `-` for unordered lists, `1.` for ordered lists.
- Use `|` for tables with header separator.
- Use triple backticks for code blocks with language tag.
- Use `>` for blockquotes and callouts.
- One blank line between sections.
- No trailing spaces.

## Naming Standards

- Day folders: `001`, `002`, ..., `365` (zero-padded 3 digits).
- Files: `README.md`, `Lesson.md`, `Anki.csv` (PascalCase for documents).
- Scripts: `kebab-case.ps1` (e.g., `generate-day.ps1`).
- Templates: `PascalCase.md` (e.g., `Lesson.md`, `Reflection.md`).

## Git Standards

- Branch: `main` as default.
- Commit convention: `type(scope): description` (e.g., `feat(day005): complete lesson`).
- Types: `feat`, `fix`, `docs`, `refactor`, `chore`.
- Always pull before pushing.
- Never force push.
