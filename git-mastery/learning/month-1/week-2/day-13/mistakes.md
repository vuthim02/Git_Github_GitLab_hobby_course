# Day 13: Common Mistakes - Branching Workflows

## Mistake 1: Using Complex Workflow for Simple Project

**Wrong:** Implementing GitFlow for a solo project with continuous deployment

**Right:** Use GitHub Flow or Trunk-Based for simple projects

## Mistake 2: Inconsistent Branch Naming

**Wrong:**
```bash
git branch newFeature
git branch login_fix
git branch "John's branch"
```

**Right:**
```bash
git branch feature/user-login
git branch bugfix/fix-login
```

## Mistake 3: Long-Lived Feature Branches

**Wrong:** Working on one feature for 3 months without merging

**Right:** Merge frequently, keep branches short

## Mistake 4: Committing Directly to Main

**Wrong:** Making commits directly to main
```bash
git checkout main
git commit -m "Quick fix"
```

**Right:** Always use feature branches
```bash
git checkout -b feature/quick-fix
git commit -m "Quick fix"
git switch main
git merge feature/quick-fix
```

## Mistake 5: Not Syncing Before Branching

**Wrong:** Branching from old code
```bash
git checkout old-commit
git branch feature  # Branching from outdated point
```

**Right:** Always branch from updated code
```bash
git checkout main
git pull
git branch feature  # Branching from current main
```

## Lesson Learned

> "Choose the workflow that matches your team's needs. A simple workflow followed is better than a complex workflow ignored."

## Workflow Selection Guide

| Project Type | Recommended Workflow |
|--------------|---------------------|
| Web app, CD | GitHub Flow |
| Desktop app, releases | GitFlow |
| Startup, fast iteration | Trunk-Based |
| Open source | Forking Workflow |
