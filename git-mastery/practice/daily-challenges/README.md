# Daily Challenges

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          DAILY GIT CHALLENGES                                 ║
║                    Practice Git Every Single Day                             ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

## Challenge Format

Each challenge has:
- **Difficulty**: Beginner | Intermediate | Advanced | Expert
- **Time**: 10-30 minutes
- **Skills**: Git concepts practiced
- **Scenario**: Real-world situation

---

## Challenge Levels

| Level | Difficulty | Time |
|-------|------------|------|
| 🟢 Beginner | Basic commands | 10-15 min |
| 🟡 Intermediate | Workflows | 15-20 min |
| 🔴 Advanced | Complex scenarios | 20-30 min |
| ⚫ Expert | Multi-step challenges | 30+ min |

---

## Daily Challenge Index

### Week 1: Basic Git

| Day | Challenge | Difficulty | Skills |
|-----|-----------|------------|--------|
| 1 | Initialize & Commit | 🟢 Beginner | init, add, commit |
| 2 | View History | 🟢 Beginner | log, show |
| 3 | Branch Basics | 🟢 Beginner | branch, checkout |
| 4 | Merge Branches | 🟡 Intermediate | merge, conflicts |
| 5 | Remote Operations | 🟡 Intermediate | push, pull, fetch |
| 6 | Undo Mistakes | 🟡 Intermediate | reset, revert |
| 7 | Review Challenge | 🟡 Intermediate | All basics |

### Week 2: Intermediate Git

| Day | Challenge | Difficulty | Skills |
|-----|-----------|------------|--------|
| 8 | Branching Strategy | 🔴 Advanced | branch naming |
| 9 | Rebase Practice | 🔴 Advanced | rebase |
| 10 | Cherry-Pick | 🔴 Advanced | cherry-pick |
| 11 | Stash Workflow | 🟡 Intermediate | stash |
| 12 | Conflict Resolution | 🔴 Advanced | merge conflicts |
| 13 | Tagging Releases | 🟡 Intermediate | tag |
| 14 | Review Challenge | 🔴 Advanced | All intermediate |

### Week 3: GitHub/GitLab

| Day | Challenge | Difficulty | Skills |
|-----|-----------|------------|--------|
| 15 | Fork Workflow | 🟡 Intermediate | fork, clone |
| 16 | Pull Request | 🟡 Intermediate | PR workflow |
| 17 | Code Review | 🔴 Advanced | review comments |
| 18 | Sync Fork | 🟡 Intermediate | fetch, merge |
| 19 | GitLab MR | 🟡 Intermediate | MR workflow |
| 20 | CI/CD Pipeline | 🔴 Advanced | GitHub Actions |
| 21 | Review Challenge | 🔴 Advanced | All remote |

### Week 4: Expert Challenges

| Day | Challenge | Difficulty | Skills |
|-----|-----------|------------|--------|
| 22 | Recover Lost Commit | ⚫ Expert | reflog |
| 23 | Find Bug with Bisect | ⚫ Expert | bisect |
| 24 | Submodule Management | ⚫ Expert | submodule |
| 25 | Worktree Workflow | 🔴 Advanced | worktree |
| 26 | Custom Aliases | 🟡 Intermediate | alias |
| 27 | Git Hooks | 🔴 Advanced | hooks |
| 28 | Final Challenge | ⚫ Expert | All skills |

---

## Challenge Templates

### Beginner Challenge Template

```markdown
# Challenge: [Title]

## Scenario
[Real-world situation]

## Tasks
1. [Task 1]
2. [Task 2]
3. [Task 3]

## Expected Output
[What you should see]

## Hints
[Optional hints]
```

### Advanced Challenge Template

```markdown
# Challenge: [Title]

## Scenario
[Complex situation]

## Requirements
- [Requirement 1]
- [Requirement 2]
- [Requirement 3]

## Constraints
- [Constraint 1]
- [Constraint 2]

## Bonus
[Optional advanced task]

## Solution Guide
[Hidden solution]
```

---

## Practice Platforms

Supplement these challenges with:

1. **Learn Git Branching** - https://learngitbranching.js.org/
2. **GitKraken** - https://www.gitkraken.com/learn-git
3. **GitHub Learning Lab** - https://lab.github.com/

---

## Challenge Repository

Create a repository to track your progress:

```bash
mkdir git-challenges
cd git-challenges
git init

# Create a challenge branch
git checkout -b challenge/day-1
# Complete challenge
git add . && git commit -m "challenge(day-1): complete"
git checkout main
git merge challenge/day-1
```

---

## Progress Tracking

| Day | Challenge | Completed | Time Spent | Notes |
|-----|-----------|-----------|------------|-------|
| 1 | Initialize & Commit | ⬜ | ___ min | |
| 2 | View History | ⬜ | ___ min | |
| 3 | Branch Basics | ⬜ | ___ min | |
| ... | ... | ... | ... | |

---

## How to Use These Challenges

### Daily Practice (Recommended)
1. Pick a challenge matching your skill level
2. Set a timer (15-30 minutes)
3. Complete without looking at solutions
4. If stuck, use hints
5. Review solution after completing

### Weekly Assessment
1. Complete 3-5 challenges per week
2. Attempt review challenges on day 7
3. Track time and difficulty

### Skill Building
1. Start with beginner challenges
2. Progress to intermediate after mastering basics
3. Attempt advanced after comfortable with intermediate
4. Expert challenges test comprehensive knowledge

---

**Navigation**:
[← Projects](../projects/) | [Dashboard](../../dashboard.md) | [Weekly Tests](./weekly-tests/) →

**Next Challenge**: [Day 1: Initialize & Commit](./day-01.md)
