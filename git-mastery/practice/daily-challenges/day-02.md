# Daily Challenge: Day 2 - View History

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                    CHALLENGE: VIEW HISTORY                                    ║
║                         BEGINNER LEVEL                                       ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

## Scenario

You joined a project with existing commits. Explore the history using different Git log formats and understand the project structure.

## Setup

```bash
# Clone practice repo (or use existing)
git clone https://github.com/git/git.git temp-project
cd temp-project
```

## Tasks

### Task 1: Basic Log (3 min)
```bash
git log
# View all commits
```

### Task 2: Compact Log (3 min)
```bash
git log --oneline
# One line per commit
```

### Task 3: Graph View (5 min)
```bash
git log --oneline --graph
# Visual branch view
```

### Task 4: Filtered Log (7 min)
```bash
# Last 5 commits
git log -5

# Commits by author
git log --author="torvalds"

# Commits by date
git log --since="2024-01-01"
git log --after="2 weeks ago"

# Commits containing text
git log --grep="fix"
```

### Task 5: File History (7 min)
```bash
# History of specific file
git log README.md

# File with diffs
git log -p README.md

# Who changed each line
git blame README.md
```

## Expected Output

```
* abc1234 (HEAD -> main) feat: Add new feature
* def5678 fix: Resolve bug
* 9012345 docs: Update README
```

## Checklist

- [ ] Basic log
- [ ] Oneline format
- [ ] Graph view
- [ ] Filtered by author
- [ ] File history
- [ ] Blame command

## Solution

<details>
<summary>Click to reveal</summary>

```bash
# Complete commands
git log
git log --oneline
git log --oneline --graph --all
git log -5
git log --author="name"
git log README.md
git blame README.md
```
</details>

---

**Next Challenge**: [Day 3: Branch Basics](./day-03.md)
