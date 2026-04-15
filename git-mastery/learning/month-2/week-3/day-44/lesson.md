# Day 44: GitHub Flow

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          GIT MASTERY - DAY 44                                ║
║                          GITHUB FLOW                                       ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

## Today's Objectives

- [ ] Understand GitHub Flow
- [ ] Compare with Git Flow
- [ ] Use simple branching
- [ ] Deploy from main

---

## Theory: GitHub Flow

### What is GitHub Flow?

GitHub Flow is a simpler strategy with only main branch + feature branches:

```
┌───────────────────────────────────────────────────────────────────────────┐
│                    GITHUB FLOW STRUCTURE                                  │
├───────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│   main ────●─────●─────●─────●─────●─────●─────●─────●─────●              │
│           │    │    │    │    │    │    │    │    │    │                 │
│          f1   f2   f3   f4   f5   f6   f7   f8   f9                      │
│       feature-abc     feature-xyz   feature-login                        │
│                                                                         │
└───────────────────────────────────────────────────────────────────────────┘
```

### GitHub Flow Rules

1. Branch from main
2. Make changes in branch
3. Open pull request
4. Review and discuss
5. Merge to main
6. Deploy immediately

### When to Use GitHub Flow

- Small teams
- Continuous deployment
- Trunk-based development

### GitHub Flow vs Git Flow

| Aspect | GitHub Flow | Git Flow |
|--------|------------|---------|
| Branches | 2 | 5+ |
| Complex | Simple | Complex |
| Release | Continuous | Scheduled |
| Hotfixes | Branches | Branch type |

---

## Implementation

### Workflow

```bash
# Create branch
git checkout main
git pull
git checkout -b feature/my-feature

# Make changes
echo "code" > file.js
git add . && git commit -m "Add feature"

# Push
git push -u origin feature/my-feature

# Create PR (via web)
# Review
# Merge
# Deploy
```

### Deployment Integration

```yaml
# GitHub Actions
name: Deploy

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: deploy.sh
```

---

## Reading References

### Atlassian
- [GitHub Flow](https://www.atlassian.com/git/tutorials/comparing-workflows/github-flow-workflow)
- [Pull Requests](https://www.atlassian.com/git/tutorials/using-branches/git-pull-requests)

### GitHub Docs
- [GitHub Flow](https://docs.github.com/en/get-started/quickstart/github-flow)

## Checklist

- [ ] Understand GitHub Flow
- [ ] Compare with Git Flow
- [ ] Implement simple workflow