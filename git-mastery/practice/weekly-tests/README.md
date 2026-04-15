# Weekly Tests

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          WEEKLY TESTS                                       ║
║                   Test Your Git Mastery                                     ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

## Test Structure

Each weekly test includes:
- **Theory Questions** - Multiple choice and short answer
- **Practical Tasks** - Hands-on Git commands
- **Debugging Challenges** - Fix broken scenarios
- **Time Limit** - 60-90 minutes

---

## Test Index

| Week | Test | Topics | Duration |
|------|------|--------|----------|
| 1 | [Week 1 Test](./week-1.md) | Git Basics | 60 min |
| 2 | [Week 2 Test](./week-2.md) | Branching & Merging | 75 min |
| 3 | [Week 3 Test](./week-3.md) | Remote Operations | 75 min |
| 4 | [Week 4 Test](./week-4.md) | Advanced Git | 90 min |
| 5 | [Week 5 Test](./week-5.md) | GitHub Professional | 60 min |
| 6 | [Week 6 Test](./week-6.md) | GitLab & CI/CD | 90 min |
| 7 | [Week 7 Test](./week-7.md) | Team Workflows | 60 min |
| 8 | [Final Test](./final.md) | Comprehensive | 120 min |

---

## Passing Criteria

| Grade | Score | Description |
|-------|-------|-------------|
| 🏆 Expert | 90-100% | Git mastery achieved |
| 🥇 Proficient | 75-89% | Ready for production |
| 📚 Learning | 50-74% | Review and retry |
| 📖 Needs Work | Below 50% | Review week materials |

---

## Before Starting

1. Clear your workspace
2. Have terminal ready
3. Timer set
4. Reference materials closed (for real test)

---

## Week 1 Test: Git Basics

### Part A: Theory (20 points)

**Q1. What command initializes a Git repository?**
```
a) git start
b) git init
c) git new
d) git create
```

**Q2. What does `git add` do?**
```
a) Creates a commit
b) Stages changes for commit
c) Shows differences
d) Creates a branch
```

**Q3. How many areas does Git have?**
```
a) 1
b) 2
c) 3
d) 4
```

**Q4. What is HEAD in Git?**
```
a) First commit
b) Current commit/branch
c) Repository root
d) Staging area
```

**Q5. What does `git status` show?**
```
a) Commit history
b) Current branch and changes
c) Remote repositories
d) Branch history
```

### Part B: Practical Tasks (60 points)

**Task 1: Initialize and Commit (15 points)**
```bash
# Create directory structure
mkdir git-test-week1
cd git-test-week1

# Initialize Git repository
# YOUR COMMAND HERE

# Create README.md with content
# YOUR COMMAND HERE

# Stage and commit with message "Initial commit"
# YOUR COMMANDS HERE
```

**Task 2: View History (15 points)**
```bash
# View commit history in oneline format
# YOUR COMMAND HERE

# View last 3 commits
# YOUR COMMAND HERE
```

**Task 3: Make Changes (15 points)**
```bash
# Create app.js file
# YOUR COMMAND HERE

# Modify README.md
# YOUR COMMAND HERE

# Stage specific file (not all)
# YOUR COMMAND HERE

# Commit with proper message
# YOUR COMMAND HERE
```

**Task 4: Undo Staged Changes (15 points)**
```bash
# Accidentally staged a file
# Unstage it
# YOUR COMMAND HERE

# Verify it's unstaged
# YOUR COMMAND HERE
```

### Part C: Debugging (20 points)

**Bug 1: Wrong Commit Message**
```bash
# You committed with message "fix bug" but want "fix: resolve login timeout"
# Fix this
# YOUR COMMAND HERE
```

**Bug 2: Forgot to Stage**
```bash
# Made changes but forgot to git add
# Stage and commit in one command
# YOUR COMMAND HERE
```

### Part D: Time & Scoring

| Part | Points | Time |
|------|--------|------|
| Part A: Theory | 20 | 10 min |
| Part B: Practical | 60 | 35 min |
| Part C: Debugging | 20 | 10 min |
| **Total** | **100** | **55 min** |

---

## Week 2 Test: Branching & Merging

### Part A: Theory (20 points)

**Q1. What is a branch in Git?**
```
a) A copy of the entire repository
b) A lightweight pointer to a commit
c) A remote repository
d) A commit message
```

**Q2. What does fast-forward merge mean?**
```
a) Merge with conflicts
b) Linear history, no new commit
c) Force push
d) Delete branch after merge
```

**Q3. How do you create and switch to a new branch?**
```
a) git branch new; git checkout new
b) git checkout -b new
c) git new branch
d) git branch -c new
```

**Q4. What causes merge conflicts?**
```
a) Deleting a branch
b) Same line changed in both branches
c) Fast-forward merge
d) Creating a new branch
```

**Q5. How do you delete a branch?**
```
a) git delete branch-name
b) git branch -d branch-name
c) git remove branch-name
d) git branch delete branch-name
```

### Part B: Practical Tasks (60 points)

**Task 1: Create Feature Branch (15 points)**
```bash
# From existing repo, create feature branch
# Switch to it
# YOUR COMMANDS HERE
```

**Task 2: Merge Branches (20 points)**
```bash
# Merge feature into main
# YOUR COMMANDS HERE
```

**Task 3: Resolve Conflict (25 points)**
```bash
# Create conflict scenario
# Resolve manually
# YOUR COMMANDS HERE
```

### Part C: Time & Scoring

| Part | Points | Time |
|------|--------|------|
| Part A: Theory | 20 | 10 min |
| Part B: Practical | 60 | 50 min |
| **Total** | **80** | **60 min** |

---

## Week 3 Test: Remote Operations

### Part A: Remote Commands (40 points)

**Task 1: Add Remote**
```bash
# Add origin remote
# YOUR COMMAND HERE
```

**Task 2: Push**
```bash
# Push main branch with upstream tracking
# YOUR COMMAND HERE
```

**Task 3: Pull**
```bash
# Pull latest changes
# YOUR COMMAND HERE
```

**Task 4: Fetch vs Pull**
```bash
# Explain difference in 2 sentences
# YOUR ANSWER:
# 
#
```

### Part B: GitHub Workflow (40 points)

**Task 1: Fork and Clone**
```bash
# Fork repo then clone
# YOUR COMMANDS HERE
```

**Task 2: Sync Fork**
```bash
# Sync with upstream
# YOUR COMMANDS HERE
```

**Task 3: Pull Request**
```bash
# Create PR for a change
# YOUR COMMANDS HERE
```

---

## Week 4 Test: Advanced Git

### Part A: Advanced Commands (50 points)

**Task 1: Rebase**
```bash
# Rebase feature onto main
# YOUR COMMAND HERE
```

**Task 2: Stash**
```bash
# Stash changes
# YOUR COMMAND HERE

# Apply stash
# YOUR COMMAND HERE
```

**Task 3: Reset vs Revert**
```bash
# Explain difference
# YOUR ANSWER:

# When to use each
# YOUR ANSWER:
```

### Part B: Recovery (50 points)

**Task 1: Recover Lost Commit**
```bash
# Use reflog to find lost commit
# YOUR COMMAND HERE
```

---

## Scoring Summary

| Week | Score | Grade | Status |
|------|-------|-------|--------|
| 1 | ___/100 | | ⬜ |
| 2 | ___/80 | | ⬜ |
| 3 | ___/80 | | ⬜ |
| 4 | ___/100 | | ⬜ |
| 5 | ___/100 | | ⬜ |
| 6 | ___/100 | | ⬜ |
| 7 | ___/100 | | ⬜ |
| 8 | ___/100 | | ⬜ |

---

**Navigation**:
[← Daily Challenges](./daily-challenges/) | [Dashboard](../../dashboard.md) | [Week 1 Test](./week-1.md) →
