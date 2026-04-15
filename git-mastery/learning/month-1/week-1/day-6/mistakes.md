# Day 6 Mistakes: Viewing History & Differences

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          COMMON MISTAKES                                       ║
║                    Viewing History & Differences                               ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

---

## 🚫 Mistake 1: Using git diff Without --staged

### The Problem
Checking for staged changes but forgetting the flag.

```bash
# WRONG: Checking staged changes
git diff
# Shows: Nothing!

# Because git diff shows UNSTAGED changes
# Staged changes are hidden
```

### Why It's Bad
- Wasting time looking for staged changes
- Thinking staged changes were lost
- Confusion about what's actually staged

### The Fix
```bash
# To see STAGED changes:
git diff --staged
# or
git diff --cached

# To see UNSTAGED changes:
git diff
```

### Prevention
- Remember: `--staged` = staged changes
- No flag = working directory vs staging

---

## 🚫 Mistake 2: Confusing HEAD~ and HEAD^

### The Problem
Using wrong syntax for navigating commits.

```bash
# For simple commits (one parent):
HEAD~1  ==  HEAD^  ==  HEAD^1
HEAD~2  ==  HEAD^^  ==  HEAD^1^1

# For MERGE commits (two parents):
HEAD~1   = first parent
HEAD^1   = first parent  
HEAD^2   = second parent (merge source)

# This is DIFFERENT!
git diff HEAD~1 HEAD  # vs
git diff HEAD^1 HEAD  # vs
git diff HEAD^2 HEAD  # very different for merges
```

### Why It's Bad
- Wrong commit compared
- Comparing unexpected commits
- Missing merge commit changes

### The Fix
```bash
# Always verify which commit you're on
git log -1
git rev-parse HEAD~1

# Use parentheses for clarity
git show HEAD~1
```

### Prevention
- Use `--pretty=format` to verify commits
- Test with `git log --oneline` first
- Be careful with merge commits

---

## 🚫 Mistake 3: git log Shows Too Much

### The Problem
Running git log and getting overwhelmed.

```bash
# Shows ALL commits with full details
git log
# Hundreds of lines!

# Perfect for small repos
# Terrible for large repos
```

### Why It's Bad
- Can't find relevant commits
- Wastes time scrolling
- Information overload

### The Fix
```bash
# Limit output
git log --oneline          # Compact
git log -10                # Last 10
git log --since="1 week"   # Recent only
git log --author="John"    # By author
git log -- file.txt         # Specific file

# Pretty format for reports
git log --pretty=format:"%h %s"
```

### Prevention
- Always use filters for large repos
- Combine multiple filters
- Use `--oneline` for overview

---

## 🚫 Mistake 4: Not Understanding Diff Context

### The Problem
Can't read diffs because context is confusing.

```bash
# Standard diff
@@ -1,3 +1,4 @@
# Meaning:
# @@ -1,3 +1,4 @@
# @@ <old position> <old count> <new position> <new count> @@
#
# -1,3 = starting at line 1, 3 lines in old file
# +1,4 = starting at line 1, 4 lines in new file
```

### Why It's Bad
- Misunderstanding what changed
- Can't find relevant changes
- Confused by hunk headers

### The Fix
```bash
# More context lines
git diff -U10

# No context (cleaner)
git diff -U0

# Word diff
git diff --word-diff
```

### Prevention
- Practice reading hunk headers
- Use `-U` to adjust context
- Note + means added, - means removed

---

## 🚫 Mistake 5: git show Without Arguments

### The Problem
Running git show without understanding what it shows.

```bash
# Shows HEAD by default
git show
# Shows: commit message, author, diff

# Sometimes you want just message
git show -s          # No diff
git show --stat     # Summary only
git show --name-only # Files changed
```

### Why It's Bad
- Overwhelming output for simple needs
- Missing the info you actually want

### The Fix
```bash
# Just the commit info
git show -s HEAD

# Just the diff
git show HEAD --format=

# Specific file from commit
git show HEAD:path/to/file.txt
```

### Prevention
- Know the flags: `-s`, `--stat`, `--name-only`
- Use `--pretty=format` for custom output

---

## 🚫 Mistake 6: git blame Shows When Not Useful

### The Problem
Thinking blame tells the whole story.

```bash
# blame shows LAST modification
git blame file.txt
# Line 5: abc123 John - latest change to line 5

# But that doesn't mean John wrote it!
# Original author might have been someone else
# Line could have been moved/copied
```

### Why It's Bad
- Blaming someone for code they just reformatted
- Ignoring that code was originally written by someone else
- Assuming blame = authorship

### The Fix
```bash
# Use -M to detect moved lines
git blame -M file.txt

# Use -C to detect copied lines
git blame -C file.txt

# Remember: blame = who last touched
# Not necessarily who "wrote" it
```

### Prevention
- Blame = last modification
- Use `-C -M` for moved/copied code
- Check original commit for true authorship

---

## 🚫 Mistake 7: Comparing Branches Wrong

### The Problem
Using wrong syntax for branch comparison.

```bash
# WRONG: Missing dots
git diff main feature
# This is equivalent but less clear

# RIGHT: Two dots for comparison
git diff main..feature
# Shows what feature has that main doesn't

# RIGHT: Three dots for merge base comparison  
git diff main...feature
# Shows changes on feature since branching
```

### Why It's Bad
- Different results with similar syntax
- Confusion about what's being compared

### The Fix
```bash
# Two dots: endpoint to endpoint
git diff main..feature

# Three dots: from merge-base to feature
git diff main...feature

# Usually three dots is more useful
# Shows actual changes since branching
```

### Prevention
- Use `..` for simple comparison
- Use `...` for "changes on this branch"
- Remember: three dots = merge base

---

## 🚫 Mistake 8: git log --all Doesn't Mean All

### The Problem
Confusion about what --all shows.

```bash
# Shows all branches
git log --all --oneline

# But still limited by:
git log --all --oneline -10  # Only last 10 across ALL

git log --all --oneline --grep="fix"  # Only matching

# And:
git log --all --oneline --before="2024-01-01"  # Limited by date
```

### Why It's Bad
- Thinking --all shows everything
- Missing commits because of filters

### The Fix
```bash
# Combine filters appropriately
git log --all --oneline

# Check for hidden commits
git reflog  # Local history

# See all reachable commits
git log --all --oneline --graph
```

### Prevention
- `--all` = all branches
- Filters still apply
- Use `--graph` to see branch structure

---

## 🚫 Mistake 9: Ignoring --stat

### The Problem
Missing useful summary information.

```bash
# Just diff
git diff
# Shows every line changed

# With stat
git diff --stat
# README.md      | 5 ++++
# app.js         | 10 ++++++-
# Total: 15

# Much faster to scan!
```

### Why It's Bad
- Overlooking summary info
- Wasting time reading full diffs

### The Fix
```bash
# Always check stat first
git diff --stat

# Then full diff if needed
git diff

# Or compact stat
git diff --numstat
# 4  0 README.md
# 10 3 app.js
```

### Prevention
- Get in habit of `--stat` first
- Use `--numstat` for scripts

---

## 🚫 Mistake 10: Not Using Short Hashes

### The Problem
Typing full 40-character hashes.

```bash
# Tedious
git show a1b2c3d4e5f6789012345678901234567890abcd

# Short is fine (unique prefix)
git show a1b2c3d
```

### Why It's Not Always Wrong
- Short hashes must be unique
- Git will error if ambiguous

### The Fix
```bash
# Get short hash
git rev-parse --short HEAD
# a1b2c3d

# Or in log
git log --oneline
# a1b2c3d Commit message

# Use it
git show a1b2c3d
```

### Prevention
- Use `git rev-parse --short`
- Tab completion helps too
- Usually 5-7 chars is unique

---

## 📋 Quick Reference: Commands

| Command | Shows | Flag |
|---------|-------|------|
| `git diff` | Unstaged changes | -- |
| `git diff --staged` | Staged changes | --cached same |
| `git diff HEAD` | Working vs HEAD | - |
| `git diff branch1..branch2` | Branch difference | - |
| `git log` | Full history | - |
| `git log --oneline` | Compact history | - |
| `git show` | HEAD details | HEAD~N for others |
| `git blame` | Line attribution | - |

---

## 🛡️ Best Practices Checklist

- [ ] Use `--staged` for staged changes
- [ ] Use `--stat` for summary before full diff
- [ ] Filter logs with `--oneline`, `-n`, `--author`
- [ ] Use short hashes when working manually
- [ ] Use `...` for comparing changes since branch
- [ ] Understand diff hunk headers

---

## 💡 Golden Rule

> "Use `git log --oneline --graph --all` to understand where you are before diving into details."

---

## 📚 Related Links

- [Git Log Documentation](https://git-scm.com/docs/git-log)
- [Git Diff Documentation](https://git-scm.com/docs/git-diff)
- [Git Show Documentation](https://git-scm.com/docs/git-show)
- [Git Blame Documentation](https://git-scm.com/docs/git-blame)
