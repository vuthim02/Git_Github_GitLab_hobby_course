# Day 6: Viewing History & Differences

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          GIT MASTERY - DAY 6                                  ║
║                      Viewing History & Differences                             ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

## 📋 Today's Objectives

By the end of this lesson, you will be able to:
- [ ] Use `git log` with various formatting options
- [ ] Use `git diff` to compare files and commits
- [ ] Use `git show` to view specific commits
- [ ] Navigate commit history effectively

---

## 🎬 Video Lesson

**Video**: [Git Tutorial for Beginners](https://youtu.be/zTjRZNkhiEU)  
**Timestamp**: 60:00 - 90:00  
**Duration**: ~30 minutes

Watch the video segment, then practice alongside this lesson.

---

## 📖 Theory

### Why View History?

Git's commit history tells the story of your project:
- **Who** made each change
- **What** changed
- **When** changes happened
- **Why** changes were made

### The Three Main Commands

```bash
git log      # View commit history
git diff     # Compare changes
git show     # View specific commit/file
```

---

## 💻 git log - Commit History

### Basic Usage

```bash
# View full history
git log

# View one-line per commit
git log --oneline

# View with graph
git log --oneline --graph

# View last N commits
git log -5
```

### Formatting Options

```bash
# Pretty formats
git log --pretty=format:"%h - %s"          # Short hash + subject
git log --pretty=format:"%h %an %ar %s"    # With author and time
git log --pretty=format:"%Cred%d %Cblue%h%Creset %s"

# Date formats
git log --date=short    # 2024-01-15
git log --date=relative # 2 hours ago
git log --date=local   # Local format
```

### Filtering Options

```bash
# By author
git log --author="John"

# By file
git log -- filename.txt

# By commit message
git log --grep="bug fix"

# By date range
git log --since="2024-01-01"
git log --until="2024-01-31"
git log --after="2 weeks ago"

# By branch
git log --all --oneline

# Merge commits only
git log --merges

# Single file history
git log --follow -- filename.txt
```

### Useful Aliases

```bash
# Add to ~/.gitconfig
[alias]
    lg = log --oneline --graph --all
    la = log --oneline --all
    ll = log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate
```

---

## 💻 git diff - Comparing Changes

### Types of Diff

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                            GIT DIFF TYPES                                    │
│                                                                              │
│   Working Dir          Staging Area          Repository                     │
│       │                    │                    │                           │
│       ▼                    ▼                    ▼                            │
│   git diff           git diff --cached     git diff HEAD                    │
│   (unstaged)         (staged)               (committed)                      │
│                                                                              │
│   Compare:              Compare:             Compare:                       │
│   - Working vs Staged   - Staged vs HEAD     - Working vs HEAD              │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Basic Usage

```bash
# See unstaged changes
git diff

# See staged changes
git diff --staged
git diff --cached   # Same thing

# Compare two commits
git diff HEAD~1 HEAD
git diff abc123 def456

# Compare branches
git diff main feature-branch
```

### Diff Options

```bash
# Show diff stat (summary)
git diff --stat

# Show in color
git diff --color

# Ignore whitespace
git diff --ignore-space-change

# Case-insensitive
git diff -i

# Word diff
git diff --word-diff

# No context (unified diff)
git diff -U0
```

### Reading Diff Output

```bash
diff --git a/file.txt b/file.txt
index 1234567..89abcdef 100644
--- a/file.txt        # Old file (before)
+++ b/file.txt        # New file (after)
@@ -1,3 +1,4 @@     # Hunk header
 First line
-removed line        # Lines starting with -
+added line          # Lines starting with +
 unchanged line
```

### Comparing Files

```bash
# Specific file
git diff -- file.txt

# Two files
git diff commit1:file.txt commit2:file.txt

# Branch comparison
git diff main -- file.txt
```

---

## 💻 git show - View Specific Content

### Basic Usage

```bash
# View latest commit
git show

# View specific commit
git show abc123

# View file at specific commit
git show HEAD:file.txt
git show abc123:path/to/file.txt

# View commit stats
git show --stat
```

### Show Options

```bash
# Show with diff
git show --format=fuller

# Show just the commit message
git show -s abc123

# Show in short format
git show --pretty=format:"%h: %s"

# Show all changed files
git show --name-status
```

---

## 📝 git blame - Line History

### When to Use

Track who changed each line of a file.

```bash
# See line-by-line history
git blame file.txt

# See with emails
git blame --email file.txt

# Ignore whitespace changes
git blame -w file.txt

# Specific line range
git blame -L 10,20 file.txt
```

### Reading Output

```
^1234567 (John Doe 2024-01-15 3) function hello() {
ab789012 (Jane Doe 2024-01-16 4)   console.log("Hi");
c3456789 (John Doe 2024-01-17 5) }
```

---

## 📝 git shortlog - Summarized History

### Basic Usage

```bash
# Group commits by author
git shortlog

# Short format
git shortlog -sn  # Show name and number

# By branch
git shortlog --all
```

---

## 🔍 Combining Commands

### Useful Combinations

```bash
# Recent commits with changes
git log -p -3

# Commits affecting specific file with diffs
git log -p -- file.txt

# Beautiful log
git log --oneline --graph --all --decorate

# Find commit that introduced bug
git log -S "search_string"
```

---

## ⚠️ Common Mistakes

### Mistake 1: Not Using --staged

```bash
# WRONG: Checking staged changes
git diff  # Shows WORKING dir changes

# RIGHT: Staged changes
git diff --staged  # or --cached
```

### Mistake 2: Confusing HEAD~ and HEAD^

```bash
# Both mean "parent of HEAD" for commits with one parent
HEAD~1 == HEAD^1

# But for merge commits:
# HEAD~1 = first parent
# HEAD^1 = first parent
# HEAD^2 = second parent
```

### Mistake 3: Not Using Short Hashes

```bash
# Long hash works but is tedious
git show a1b2c3d4e5f6789012345678901234567890abcd

# Short hash is easier
git show a1b2c3d
```

---

## 🧠 Memory Aids

**"Diff = Different"**
- Shows what changed between versions

**"Log = List"**
- Shows history in chronological order

**"Show = Display"**
- Shows specific commit or file in detail

**"Staged vs Unstaged"**
- `--staged` or `--cached` = compare to last commit
- no flag = compare working directory to staging

---

## 📝 Practice Checklist

- [ ] Used `git log --oneline`
- [ ] Used `git log --graph`
- [ ] Used `git diff` to see unstaged changes
- [ ] Used `git diff --staged` to see staged changes
- [ ] Used `git diff HEAD` to compare to last commit
- [ ] Used `git show` to view a commit
- [ ] Used `git blame` on a file
- [ ] Combined multiple options

---

## 📚 Reading Reference

**Pro Git Book - Chapter 2.3**  
"Viewing the Commit History"  
https://git-scm.com/book/en/v2/Git-Basics-Viewing-the-Commit-History

**Pro Git Book - Chapter 2.4**  
"Git Diff"  
https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository

---

## 🧭 Navigation

| ← Previous | Dashboard | Next → |
|-----------|-----------|--------|
| [Day 5: Understanding Git Internals](../day-5/lesson.md) | [Dashboard](../../dashboard.md) | [Day 7: Week 1 Review](../day-7/lesson.md) |

---

**Estimated Time**: 60 minutes  
**Your Progress**: Day 6 of 56  
**Next**: Day 7 - Week 1 Review
