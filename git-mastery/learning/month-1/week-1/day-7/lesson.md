# Day 7: Week 1 Review & Practice

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          GIT MASTERY - DAY 7                                  ║
║                        WEEK 1 REVIEW & PRACTICE                                 ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

## 📋 Today's Objectives

By the end of this lesson, you will:
- [ ] Review all Week 1 concepts
- [ ] Complete comprehensive exercises
- [ ] Take self-assessment quiz
- [ ] Prepare for Week 2: Branching

---

## 🎬 Video: Week 1 Wrap-Up

**Video**: [Git Tutorial for Beginners](https://youtu.be/zTjRZNkhiEU)  
**Full Video Review**: 0:00 - 90:00 (Complete)

Watch the full video to reinforce Week 1 concepts.

---

## 📚 Week 1 Summary

### What We Learned

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          WEEK 1 CONCEPTS                                       ║
╠═══════════════════════════════════════════════════════════════════════════════╣
║                                                                               ║
║  DAY 1: Version Control Fundamentals                                          ║
║  ├─ What is version control?                                                 ║
║  ├─ Types: Local, Centralized, Distributed                                    ║
║  └─ Git vs other VCS                                                         ║
║                                                                               ║
║  DAY 2: Git Setup & Configuration                                             ║
║  ├─ Installing Git                                                             ║
║  ├─ git config levels (local, global, system)                                 ║
║  └─ Setting up identity                                                       ║
║                                                                               ║
║  DAY 3: Creating Your First Repository                                        ║
║  ├─ git init command                                                          ║
║  ├─ .git directory structure                                                  ║
║  └─ git status                                                                ║
║                                                                               ║
║  DAY 4: The Git Workflow                                                      ║
║  ├─ Three areas: Working dir, Staging, Repository                             ║
║  ├─ git add, git commit                                                      ║
║  └─ Commit messages best practices                                            ║
║                                                                               ║
║  DAY 5: Understanding Git Internals                                           ║
║  ├─ Four object types: Blob, Tree, Commit, Tag                                ║
║  ├─ SHA-1 hashing                                                             ║
║  └─ Plumbing commands                                                         ║
║                                                                               ║
║  DAY 6: Viewing History & Differences                                        ║
║  ├─ git log variations                                                        ║
║  ├─ git diff types                                                            ║
║  └─ git show, git blame                                                      ║
║                                                                               ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

---

## 📝 Command Reference: Week 1

### Setup & Configuration
```bash
git --version          # Check Git version
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
git config --list      # List all config
```

### Repository Operations
```bash
git init               # Initialize repository
git status             # Check status
git status -s          # Short format
```

### Staging & Committing
```bash
git add file.txt       # Stage specific file
git add .              # Stage all files
git add -A             # Stage all (including deletions)
git commit -m "msg"    # Commit with message
git commit -am "msg"   # Add tracked + commit
git commit --amend     # Modify last commit
```

### Viewing History
```bash
git log                # Full history
git log --oneline      # Compact
git log --graph        # ASCII graph
git log -5             # Last 5 commits
git log --author="X"   # Filter by author
```

### Comparing Changes
```bash
git diff               # Unstaged changes
git diff --staged      # Staged changes
git diff HEAD          # vs HEAD
git diff --stat        # Summary
```

### Inspecting Objects
```bash
git cat-file -t hash   # Object type
git cat-file -p hash   # Object content
git hash-object file  # Calculate hash
git ls-tree hash      # List tree
```

### Other Useful Commands
```bash
git show ref           # Show commit
git show HEAD:file.txt # Show file at commit
git blame file.txt     # Line history
git shortlog           # Commits by author
```

---

## 🎯 Comprehensive Exercises

### Exercise 1: Full Repository Workflow (30 minutes)

**Objective**: Complete a full Git workflow from scratch.

**Requirements**:
1. Create a new repository: `week1-review`
2. Configure your identity (if not set)
3. Create a project with this structure:
   ```
   week1-review/
   ├── README.md
   ├── index.html
   ├── css/
   │   └── style.css
   └── js/
       └── app.js
   ```
4. Make 5 meaningful commits with proper messages
5. Use `git log --oneline --graph` to show history
6. Make changes, stage, and commit them
7. Use diff to show what changed
8. Use blame to see who changed a line

**Success Criteria**:
- [ ] Repository properly initialized
- [ ] All files committed appropriately
- [ ] Clear commit history
- [ ] Changes properly tracked

---

### Exercise 2: Debug a Corrupted View (20 minutes)

**Objective**: Use history commands to investigate.

**Scenario**: Someone says "the code worked yesterday but now it's broken."

**Steps**:
1. Create repository with intentional bug
2. Fix the bug in subsequent commit
3. Use history to:
   - Find when bug was introduced
   - See what changed
   - Compare broken vs fixed version

**Commands to use**:
```bash
git log -p --all
git diff HEAD~2 HEAD
git show HEAD~1
```

---

### Exercise 3: Clean Up Mistakes (15 minutes)

**Objective**: Practice error recovery.

**Tasks**:
1. Create repository
2. Make commits
3. Amend a commit (change message)
4. Reset staging area
5. Unstage files

**Commands to use**:
```bash
git commit --amend
git reset HEAD file.txt
git diff --staged
```

---

### Exercise 4: Object Investigation (20 minutes)

**Objective**: Explore Git internals.

**Tasks**:
1. In a repository with commits:
   - Find a blob hash
   - View its contents
   - Trace from commit to blob
2. Explain to yourself (or someone else):
   - What is a blob?
   - What is a tree?
   - How do they connect?

---

## 📊 Self-Assessment Quiz

### Section A: Concepts (10 questions)

1. What type of version control is Git?
   - a) Local
   - b) Centralized
   - c) Distributed

2. What does `git init` do?
   - a) Downloads a repository
   - b) Creates a new .git directory
   - c) Deletes old files

3. What is the staging area?
   - a) Where commits are stored
   - b) A holding area for changes before commit
   - c) The working directory

4. What Git object stores a file's content?
   - a) Tree
   - b) Commit
   - c) Blob

5. What Git object stores directory structure?
   - a) Blob
   - b) Tree
   - c) Tag

6. SHA-1 hashes are generated from what?
   - a) File names
   - b) File content
   - c) Timestamps

7. What does HEAD represent?
   - a) First commit
   - b) Current commit/branch
   - c) Repository root

8. How many areas does Git have for files?
   - a) 1
   - b) 2
   - c) 3

9. What does `git diff --staged` show?
   - a) Working dir vs staging
   - b) Staging vs last commit
   - c) Two commits

10. Which command shows history?
    - a) git show
    - b) git log
    - c) git status

### Section B: Commands (10 questions)

Match the command to its function:

| Command | Function |
|---------|----------|
| 1. `git init` | a) Stage files |
| 2. `git add` | b) Show differences |
| 3. `git commit` | c) Initialize repo |
| 4. `git status` | d) View history |
| 5. `git log` | e) Save staged changes |
| 6. `git diff` | f) Check repo state |
| 7. `git show` | g) Remove from staging |
| 8. `git reset` | h) View object/commit |
| 9. `git cat-file` | i) Inspect Git objects |
| 10. `git blame` | j) Line-by-line history |

### Answer Key

**Section A**:
1. c, 2. b, 3. b, 4. c, 5. b, 6. b, 7. b, 8. c, 9. b, 10. b

**Section B**:
1. c, 2. a, 3. e, 4. f, 5. d, 6. b, 7. h, 8. g, 9. i, 10. j

**Score**: ___/20

---

## 🎓 Practical Challenge

### Challenge: Git Detective

Use Git commands to solve this scenario:

A team member says they committed a fix for a bug, but the code isn't working. Investigate!

**Steps**:
1. Create the scenario:
   ```bash
   mkdir bug-hunt && cd bug-hunt
   git init
   echo "buggy" > code.txt && git add . && git commit -m "Initial code"
   echo "still buggy" > code.txt && git commit -am "Fixed bug"
   ```
2. Investigate using:
   - `git log`
   - `git show HEAD`
   - `git diff HEAD~1 HEAD`
   - `git cat-file -p HEAD`
3. Find the "fix" and explain what happened

---

## 🏆 Project: Personal Portfolio

**Objective**: Create a Git repository for a personal project.

**Deliverables**:
1. Initialize repository
2. Add meaningful README
3. Make at least 5 commits with proper messages
4. Show clean history graph
5. Include at least one file with meaningful changes

**Template README**:
```markdown
# My Project

## Description
[Your description]

## Git Skills Demonstrated
- Initialized with `git init`
- Created commits with `git add` and `git commit`
- Used proper commit messages
- Viewed history with `git log`
- Compared changes with `git diff`

## Week 1 Completed: [Date]
```

---

## 📋 Week 1 Completion Checklist

### Mastery Verification

Before proceeding to Week 2, verify you can:

#### Basic Commands
- [ ] Can initialize a repository
- [ ] Can stage files with `git add`
- [ ] Can commit with `git commit -m`
- [ ] Can check status with `git status`
- [ ] Can view history with `git log`

#### Intermediate Commands
- [ ] Can explain the three Git areas
- [ ] Can compare changes with `git diff`
- [ ] Can view specific commits with `git show`
- [ ] Can use `--oneline` for compact view
- [ ] Can explain what HEAD represents

#### Advanced Concepts
- [ ] Can name the four Git object types
- [ ] Understands SHA-1 content hashing
- [ ] Can trace commit → tree → blob chain
- [ ] Can use `git cat-file` commands
- [ ] Can explain content-addressable storage

#### Best Practices
- [ ] Write meaningful commit messages
- [ ] Commit early and often
- [ ] Review changes before committing
- [ ] Use proper `.gitignore`

### Minimum Score Requirements

- Quiz Score: ___/20 (Need 16/20 = 80%)
- Exercises: At least 3/4 completed
- Challenge: Completed

---

## 📊 Week 1 Progress Summary

### Completed Successfully?

```
Week 1 Status: [ ] Not Complete [ ] Complete

Days Completed: _____/6
Days 1-6 lessons: [1] [2] [3] [4] [5] [6]
Final Project: [ ] Not Done [ ] Done
Quiz Score: ___/20
```

### Skills Assessment

| Skill Area | Self-Rating | Notes |
|------------|-------------|-------|
| Version Control Concepts | ___/5 | |
| Git Setup & Config | ___/5 | |
| Repository Creation | ___/5 | |
| Staging & Committing | ___/5 | |
| Git Internals | ___/5 | |
| History & Diff | ___/5 | |
| Overall Week 1 | ___/5 | |

---

## 🎯 Week 2 Preview

**Next Week**: Branching Mastery (Days 8-14)

### What You'll Learn
- Creating branches
- Switching between branches
- Understanding HEAD
- Merging branches
- Resolving conflicts
- Branching workflows

### Prerequisites for Week 2
- [ ] Confident with Week 1 commands
- [ ] Comfortable with commit workflow
- [ ] Understand basic Git concepts

---

## 📚 Resources for Week 2

### Videos
- [Git & GitHub Tutorial](https://youtu.be/RGOj5yH7evk) - Branching sections
- [Git Tutorial for Beginners](https://youtu.be/zTjRZNkhiEU) - Review if needed

### Reading
- [Pro Git - Git Branching](https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell)
- [Atlassian Git Tutorial](https://www.atlassian.com/git/tutorials/using-branches)

---

## 🎉 Week 1 Complete!

Congratulations on completing Week 1 of Git Mastery!

**Key Takeaways**:
1. Git is a distributed version control system
2. Repository = Project + .git directory
3. Workflow: Edit → Stage → Commit
4. History is a chain of commits
5. Everything in Git is an object

**Your Next Steps**:
- Review weak areas
- Practice commands until comfortable
- Begin Week 2 when ready
- Keep a Git journal

---

## 🧭 Navigation

| ← Previous | Dashboard | Next → |
|-----------|-----------|--------|
| [Day 6: Viewing History](../day-6/lesson.md) | [Dashboard](../../dashboard.md) | [Week 2: Branching](../week-2/day-8/lesson.md) |

---

**Estimated Time**: 4 hours (comprehensive review)  
**Your Progress**: Day 7 of 56 (Week 1 Complete!)  
**Next**: Week 2 - Branching Mastery
