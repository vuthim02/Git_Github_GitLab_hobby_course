# Day 4: The Git Workflow - Staging & Committing

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          GIT MASTERY - DAY 4                                   ║
║                      The Git Workflow - Staging & Committing                   ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

## 📋 Today's Objectives

By the end of this lesson, you will be able to:
- [ ] Explain the three stages of Git's workflow (working directory, staging area, repository)
- [ ] Use `git add` to stage changes
- [ ] Use `git commit` to save changes
- [ ] Write meaningful commit messages
- [ ] View commit history with `git log`

---

## 🎬 Video Lesson

**Video**: [Git Tutorial for Beginners](https://youtu.be/zTjRZNkhiEU)  
**Timestamp**: 45:00 - 60:00  
**Duration**: ~15 minutes

Watch the video segment, then practice alongside this lesson.

---

## 📖 Theory

### The Three Areas of Git

Git has three main areas where your files exist:

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         THE GIT WORKFLOW                                      │
│                                                                              │
│  ┌──────────────────┐      ┌──────────────────┐      ┌──────────────────────┐ │
│  │  Working         │      │   Staging        │      │   Repository        │ │
│  │  Directory       │ ───> │   Area           │ ───> │   (.git directory)  │ │
│  │                  │      │   (Index)        │      │                     │ │
│  │  Your files as   │ add  │                  │commit│   Permanent         │ │
│  │  you see them    │      │  Prepared        │      │   snapshots         │ │
│  │                  │      │  changes         │      │                     │ │
│  └──────────────────┘      └──────────────────┘      └──────────────────────┘ │
│                                                                              │
│                                                                              │
│  Status: Modified          Status: Staged            Status: Committed       │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Working Directory

The **working directory** is your project folder where you:
- Edit files
- Create new files
- Delete files
- Make all your changes

Files here are in their "natural" state - just regular files on your filesystem.

### Staging Area (Index)

The **staging area** (also called the "index" or "cache") is a file that:
- Prepares what will go into your next commit
- Lets you craft your commit carefully
- Allows partial file staging

Think of it as a "shopping cart" for your changes.

### Repository

The **repository** is Git's database of:
- All committed snapshots
- Complete project history
- All branches and tags

Once committed, your changes are safely stored forever.

---

## 💻 Commands Reference

### Essential Commands

```bash
# Stage a file (add to index)
git add filename.txt

# Stage all changed files
git add .

# Stage all files (including deletions)
git add -A

# Commit with a message
git commit -m "Your message here"

# Stage AND commit in one step (for already-tracked files)
git commit -am "Your message here"

# Check what will be committed
git diff --cached

# View commit history
git log

# View one-line history
git log --oneline
```

---

## 📝 Understanding git add

### What It Does

`git add` copies the current state of a file into the staging area:

```
Working Directory          Staging Area
────────────────────────────────────────────────
README.md (edited)   -->   README.md (staged)
                         
index.html (new)     -->   index.html (staged)
                         
style.css (same)     -->   (not staged)
```

### Variations

```bash
# Add specific file
git add file.txt

# Add multiple files
git add file1.txt file2.txt

# Add all files in current directory
git add .

# Add all files in entire repo
git add -A

# Add all tracked files (skip new files)
git add -u

# Interactive staging
git add -i
```

### Partial File Staging

```bash
# Add specific lines from a file
git add -p file.txt

# Stage chunks interactively
# Choose: y (yes), n (no), s (split), e (edit)
```

---

## 📝 Understanding git commit

### What It Does

`git commit` creates a new snapshot in the repository:

1. Takes everything in staging area
2. Creates a new commit object
3. Stores it in the repository
4. Clears the staging area

### Commit Message Best Practices

**Good commit messages:**
```bash
git commit -m "Add user authentication feature"
git commit -m "Fix navigation bug on mobile"
git commit -m "Update README with installation steps"
```

**Bad commit messages:**
```bash
git commit -m "changes"
git commit -m "asdf"
git commit -m "fixed stuff"
git commit -m "WIP"
```

### Anatomy of a Commit

Each commit contains:
- **SHA-1 hash** - Unique identifier
- **Author** - Who made the change
- **Date** - When it was made
- **Message** - Description of the change
- **Parent** - Previous commit(s)
- **Snapshot** - The actual files

### Commit Options

```bash
# Commit with message
git commit -m "Fix login bug"

# Amend the last commit (replace it)
git commit --amend

# Commit without staging (only tracked files)
git commit -am "Quick fix"

# Empty commit (for testing)
git commit --allow-empty -m "Trigger build"
```

---

## 📝 Understanding git log

### Basic Usage

```bash
# View full commit history
git log

# View one-line history
git log --oneline

# View graph of branches
git log --oneline --graph --all

# View last N commits
git log -5

# View commits by author
git log --author="John"

# View commits that touched a file
git log -- filename.txt

# View commits in a date range
git log --since="2024-01-01"
```

### Pretty Formats

```bash
# Compact one-line with graph
git log --oneline --graph

# With branch names
git log --oneline --graph --all

# Pretty format
git log --pretty=format:"%h - %an, %ar : %s"

# Stats for each commit
git log --stat
```

---

## 🎯 The Complete Workflow

### Step-by-Step Example

```bash
# 1. Create/edit files
echo "Hello World" > hello.txt

# 2. Check status
git status
# Untracked files: hello.txt

# 3. Stage the file
git add hello.txt

# 4. Check status again
git status
# Changes to be committed: hello.txt

# 5. Commit with message
git commit -m "Add hello.txt with greeting"

# 6. View the result
git log
```

### Visual Representation

```
Before:                    After git add:            After git commit:
────────                   ────────────────           ──────────────────
README.md (tracked)        README.md (staged)         README.md (committed)
hello.txt (untracked) ──>  hello.txt (staged)   ──>  hello.txt (committed)
index.html (modified)      index.html (modified)      index.html (modified)
                           ^ STAGED                  ^ COMMITTED
```

---

## ⚠️ Common Mistakes

### Mistake 1: Committing Without Staging

```bash
# WRONG: Only works for already-tracked files
git commit -am "My changes"

# PROBLEM: New files won't be included!
# hello.txt was untracked - it's NOT in the commit
```

### Mistake 2: Empty Commit Messages

```bash
# This will fail
git commit -m ""

# Or open editor with no message (bad!)
git commit
```

### Mistake 3: Not Checking Status Before Commit

```bash
# Always check first!
git status

# Make sure you know WHAT you're committing
git diff --cached
```

### Mistake 4: Forgetting to Stage

```bash
# Made changes, then committed...
# But forgot to git add!

git commit -m "Fixed everything"
# Files are NOT in the commit!
```

---

## 🧠 Memory Aids

**"Add to Stage, then Commit"**
- Stage = Preparation
- Commit = Permanent save

**"git add = Add to shopping cart, git commit = Buy everything"**

**"Staging is like a spotlight - only staged things get committed"**

---

## 📝 Practice Checklist

- [ ] Created files and used `git add`
- [ ] Committed with meaningful messages
- [ ] Used `git status` to verify stages
- [ ] Viewed history with `git log`
- [ ] Understood the difference between staging and committing
- [ ] Made and identified mistakes

---

## 🔍 Deep Dive: What Happens During Commit

When you run `git commit`:

1. **Git calculates SHA-1** for each staged file's content
2. **Creates blob objects** for files in `objects/`
3. **Creates tree objects** representing directories
4. **Creates commit object** with metadata
5. **Updates branch pointer** to new commit

```
objects/
├── a1/                    # tree object
│   └── b2c3...           # blob object (README.md)
├── 91/                    # blob object (hello.txt)
└── f4e/                   # commit object
    └── 5d2c...           # points to tree
```

---

## 📚 Reading Reference

**Pro Git Book - Chapter 2.1**  
"Recording Changes to the Repository"  
https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository

---

## 🎯 Quick Exercise

1. Create a new repository `workflow-practice`
2. Create 3 files: `a.txt`, `b.txt`, `c.txt`
3. Stage only `a.txt` and commit
4. Stage `b.txt` and `c.txt` together, then commit
5. Modify `a.txt` - check status, stage, commit
6. View the commit history with `git log --oneline`

---

## 📖 Further Reading

- [Git Basics - Recording Changes](https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository)
- [Git Commit Best Practices](https://chris.beams.io/posts/git-commit/)

---

## 🧭 Navigation

| ← Previous | Dashboard | Next → |
|-----------|-----------|--------|
| [Day 3: Creating Your First Repository](../day-3/lesson.md) | [Dashboard](../../dashboard.md) | [Day 5: Understanding Git Internals](../day-5/lesson.md) |

---

**Estimated Time**: 60 minutes  
**Your Progress**: Day 4 of 56  
**Next**: Day 5 - Git Internals
