# Day 50: Debugging Commands

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          GIT MASTERY - DAY 50                                ║
║                          DEBUGGING COMMANDS                                ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

## Today's Objectives

- [ ] Use git status for debugging
- [ ] Use git diff effectively
- [ ] Use git log with filters
- [ ] Use git blame
- [ ] Understand git reflog

---

## Theory: Git Debugging

### git status

Shows the current state of working directory:

```bash
git status              # Full status
git status -s          # Short format
git status --ignored   # Show ignored files
```

### git diff

Shows changes between commits, files:

```bash
git diff                 # Working dir vs staged
git diff --staged       # Staged vs last commit
git diff HEAD~1 HEAD    # Compare commits
git diff main..feature  # Compare branches
```

### git log

Shows commit history with filters:

```bash
git log                    # All commits
git log --oneline         # Compact
git log -p               # Patch
git log --stat           # Stats
git log --author=name    # By author
git log --since="2024-01-01"  # Date filter
git log --grep="keyword" # Message search
```

### git blame

Shows who changed each line:

```bash
git blame file.txt           # Blame for file
git blame -L 10,20 file.txt  # Specific lines
```

### git reflog

Shows all reference changes:

```bash
git reflog               # Full history
git reflog --date=iso    # With dates
git reflog show HEAD@{1} # Specific entry
```

---

## Debugging Workflow

```bash
# Find where code changed
git log --oneline --all -- file.txt

# Who changed it
git blame file.txt

# How did we get here
git reflog

# What's different
git diff
```

---

## Reading References

### Git SCM Documentation
- [Git Diff](https://git-scm.com/docs/git-diff)
- [Git Log](https://git-scm.com/docs/git-log)
- [Git Blame](https://git-scm.com/docs/git-blame)
- [Git Status](https://git-scm.com/docs/git-status)

### Video Reference
- [Advanced Git Tutorial](https://youtu.be/qsXt-32yTiw)

## Checklist

- [ ] Use git status
- [ ] Use git diff
- [ ] Use git log with filters
- [ ] Use git blame