# File Structure

```
Project365/
│
├── README.md               # Project overview and documentation
├── CHANGELOG.md            # Version history (Keep a Changelog)
├── LICENSE                 # MIT License
├── .gitignore              # Git ignore rules
├── config.json             # Project configuration
│
├── English365/             # English learning module
│   ├── README.md           # Module overview
│   ├── Progress.md         # 365-day progress tracker
│   ├── templates/          # Lesson Pack templates (Lesson.md, Anki.csv)
│   ├── Resources/          # Shared resources (Pronunciation, Listening, etc.)
│   ├── 001/                # Day 001 lesson
│   ├── 002/                # Day 002 lesson
│   └── ...                 # Up to Day 365
│
├── docs/                   # Technical documentation
│   ├── PROJECT365_STANDARD.md
│   ├── PROJECT365_GUIDE.md
│   ├── LEARNING_RULES.md
│   ├── FILE_STRUCTURE.md
│   ├── GIT_WORKFLOW.md
│   ├── REVIEW_RULES.md
│   ├── VERSIONING.md
│   ├── CONFIG.md
│   ├── CLI.md
│   ├── ROADMAP.md
│   └── WORKFLOW.md
│
├── scripts/                # PowerShell automation scripts
│   ├── p365.ps1            # Main CLI entry point
│   ├── start-day.ps1       # Morning setup
│   ├── end-day.ps1         # Evening wrap-up
│   ├── generate-day.ps1    # Lesson generator
│   └── lib.ps1             # Shared library
│
├── templates/              # Project-wide reusable templates
│   ├── Lesson.md           # Lesson template
│   ├── Reflection.md       # Reflection template
│   ├── Anki.csv            # Anki flashcard template
│   └── README.md           # Templates overview
│
├── prompts/                # AI prompt files
│
├── assets/                 # Multimedia assets (images, audio)
│
├── WeeklyReview/           # Weekly review documents
│
└── MonthlyReview/          # Monthly review documents
```
