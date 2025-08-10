# The Triple-Layer Learning Sandwich: Spring Boot + Java

Organized repo to capture daily progress while you learn Spring Boot and Java using:
1) Hands-on Project (main filling)
2) Daily 10-Minute Spring Plan (lettuce)
3) Game-Style Quizzes (sauce)
4) Deep Java Lessons (bread)

This repo helps you track code, notes, and quizzes per day, and grow a portfolio of Spring Boot projects.

## Folder layout
- daily/YYYY-MM-DD/
  - notes.md      → learning notes for the day
  - quiz.md       → quick quiz answers
  - checklist.md  → sandwich checklist for the day
- templates/daily/ → files copied to each new day
- scripts/ → tools to scaffold a new day
- projects/ → your Spring Boot projects live here
- progress.md → an index of your learning timeline

```
.
├─ daily/
├─ projects/
│  └─ README.md
├─ scripts/
│  ├─ new-day.sh
│  └─ new-day.ps1
├─ templates/
│  └─ daily/
│     ├─ checklist.md
│     ├─ notes.md
│     └─ quiz.md
├─ .github/
│  └─ workflows/
│     └─ daily-scaffold.yml   (automation for daily folders; Pacific Time)
├─ progress.md
├─ .gitignore
└─ README.md
```

## Get started (IntelliJ IDEA)

1) Clone the repo
- File → New → Project from Version Control → Git
- URL: https://github.com/Safkatul-Islam/spring-boot-triple-layer.git
- Directory: choose a local folder and click Clone

2) Add the starter files (from this README)
- Create the folders listed above and add each file with the exact names and contents.
- IntelliJ will show new files in the Git tool window.

3) Commit and push from IntelliJ
- Open the Git tool window (bottom left) or use the Commit tool window.
- Stage files (or just Commit All).
- Write a message, e.g., `chore(repo): add daily scaffold structure`
- Click Commit, then Push (or Commit and Push).

Command-line alternative:
```
git add .
git commit -m "chore(repo): add daily scaffold structure"
git push origin main
```

4) Make the script executable (macOS/Linux):
```
chmod +x scripts/new-day.sh
```
Run scripts from IntelliJ Terminal: View → Tool Windows → Terminal.

## Create today’s folder

Option A: Local scripts (recommended initially)
- macOS/Linux:
  ```
bash scripts/new-day.sh
  ```
- Windows (PowerShell):
  ```
pwsh scripts/new-day.ps1
  ```
Pass a specific date if needed:
```
bash scripts/new-day.sh 2025-08-10
pwsh scripts/new-day.ps1 -Date 2025-08-10
```

Option B: GitHub Action (server-side)
- Go to the Actions tab → Daily scaffold → Run workflow
- Optional input “date” as YYYY-MM-DD; empty uses today in Pacific Time
- Scheduled run: every day at 00:05 PT (08:05 UTC). During daylight saving, it runs at ~01:05 PT; see note below.

Note about time zone:
- The workflow computes “today” using America/Los_Angeles time.
- Cron is UTC; we schedule at 08:05 UTC (00:05 PT in winter, ~01:05 PT in summer).

## Daily flow
1) Scaffold the day’s folder.
2) Fill in:
   - daily/YYYY-MM-DD/notes.md
   - daily/YYYY-MM-DD/quiz.md
   - daily/YYYY-MM-DD/checklist.md
3) Update progress.md with a new row linking to today’s files.
4) Commit and push.

## Using IntelliJ with Spring Boot
- Create a project: File → New → Project → Spring Initializr (or “New Project” → Spring Initializr)
  - Choose Java version, group/artifact, dependencies (Web, JPA, H2, Lombok, Validation, etc.)
  - Project location: put it under `projects/your-app-name`
- Run:
  - Maven: `./mvnw spring-boot:run`
  - Gradle: `./gradlew bootRun`
- IntelliJ Run/Debug:
  - Click the green run icon next to your main `@SpringBootApplication` class.
- Add tests under `src/test/java` and run via IntelliJ or build tool.

## Commit message style (simple and helpful)
- docs(daily): add 2025-08-10 notes and quiz
- chore(daily): scaffold 2025-08-10
- feat(api): add POST /todos endpoint
- fix(test): stabilize UserServiceTest timing

## Branching tips
- Work on features in short-lived branches:
  - `feat/todos-create`
  - `docs/2025-08-10`
- Merge small, frequent updates to main.

## Best practices
- Keep notes concise; prefer bullet points and minimal code snippets.
- Record errors and fixes—they’re invaluable for revision.
- Link your code and notes in progress.md for quick navigation.
- Commit daily even if small; consistency beats intensity.

## Troubleshooting (IntelliJ)
- No Git detected: Preferences → Version Control → Git → ensure Git executable is detected.
- GitHub auth issues: Settings → Version Control → GitHub → Log in.
- Missing VCS root: Right-click project root → Git → Enable Version Control Integration.
- Push rejected: `git pull --rebase` then try push again.

Happy learning and shipping!