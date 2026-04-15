# Day 43: Git Flow

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          GIT MASTERY - DAY 43                                ║
║                            GIT FLOW                                         ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

## Today's Objectives

- [ ] Understand branching strategies
- [ ] Master Git Flow
- [ ] Use feature branches
- [ ] Manage releases

---

## Theory: Branching Strategies

### What is Git Flow?

Git Flow is a branching strategy using multiple branches:

```
┌─────────────────────────────────────────────────────────────────────────────────┐
│                              GIT FLOW STRUCTURE                                 │
├─────────────────────────────────────────────────────────────────────────────────┤
│                                                                                 │
│   main ───●────●────●────●────●────●────●────●────●────●────●────●            │
│          │    │    │    │    │    │    │    │    │    │    │    │              │
│          │    v    └────┘    │    │    v    └────┘    │    │    v             │
│          │  release-1.0   │    │  release-2.0   │    │  release-3.0        │
│          │    │         │    │    │         │    │    │                    │
│   develop ──●──●──●──●──●──●──●──●──●──●──●──●──●──●──●                      │
│                │    │         │    │         │    │                         │
│                └────┘         └────┘         └────┘                         │
│              feature      feature         feature                             │
│                                                                                 │
│   hotfix ────────────●                                                     │
│            └──────●                                                        │
│                                                                                 │
└─────────────────────────────────────────────────────────────────────────────────┘
```

### Branch Types

| Branch | Description | Merges to |
|--------|-------------|-----------|
| main | Production code | - |
| develop | Next release | main |
| feature | New features | develop |
| release | Release prep | main + develop |
| hotfix | Emergency fixes | main + develop |

### Commands

```bash
# Start feature
git checkout develop
git checkout -b feature/my-feature

# Finish feature
git checkout develop
git merge --no-ff feature/my-feature

# Start release
git checkout develop
git checkout -b release/1.0

# Finish release
git checkout main
git merge --no-ff release/1.0
git checkout develop
git merge --no-ff release/1.0

# Start hotfix
git checkout main
git checkout -b hotfix/fix-bug

# Finish hotfix
git checkout main
git merge --no-ff hotfix/fix-bug
git checkout develop
git merge --no-ff hotfix/fix-bug
```

---

## Git Flow Commands

### Using Git Flow Extension

```bash
# Install
brew install git-flow

# Initialize
git flow init

# Start feature
git flow feature start my-feature

# Finish feature
git flow feature finish my-feature

# Start release
git flow release start 1.0

# Finish release
git flow release finish 1.0

# Start hotfix
git flow hotfix start fix-bug

# Finish hotfix
git flow hotfix finish fix-bug
```

---

## Practice Exercises

### Exercise 1: Create Feature Branch (15 min)

```bash
git checkout develop
git checkout -b feature/add-login
echo "// Login" > login.js
git add . && git commit -m "Add login"
git checkout develop
git merge --no-ff feature/add-login
```

### Exercise 2: Create Release (20 min)

```bash
git checkout develop
git checkout -b release/1.0
# Make release fixes
git checkout main
git merge --no-ff release/1.0
git tag v1.0 -m "Release 1.0"
```

### Exercise 3: Create Hotfix (15 min)

```bash
git checkout main
git checkout -b hotfix/security-fix
# Fix issue
git checkout main
git merge --no-ff hotfix/security-fix
git checkout develop
git merge --no-ff hotfix/security-fix
```

---

## Reading References

### Atlassian Git Tutorial
- [Git Flow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow)
- [Feature Branches](https://www.atlassian.com/git/tutorials/using-branches)

### Git SCM Documentation
- [Distributed Git](https://git-scm.com/book/en/v2/Distributed-Git-Contributing-to-a-Project)

### Video Reference
- [Git Flow Explained](https://youtu.be/8JJ101D3knE)

## Checklist

- [ ] Understand Git Flow structure
- [ ] Use feature branches
- [ ] Use release branches
- [ ] Use hotfix branches

---

## Navigation

← [Day 42: Week 6 Review](../day-42/lesson.md) | [Dashboard](../../dashboard.md) | [Day 44: GitHub Flow](../day-44/lesson.md) →

---

**Estimated Time**: 4 hours  
**Your Progress**: Day 43 of 56 (Week 7 - Day 1)  
**Next**: GitHub Flow