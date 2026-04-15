# Git Mastery - Quick Links & Command Reference

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                            QUICK REFERENCE GUIDE                               ║
║                        The Essential Commands You Need                         ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

---

## 🚀 THE BIG 6 COMMANDS (Memorize These First!)

These are the only commands you need for 80% of your daily Git work:

```bash
# 1. START: Initialize or clone a repository
git init                    # Create new repo
git clone <url>            # Copy existing repo

# 2. CHECK: See what's happening
git status                 # Show current state
git log                    # View history
git diff                   # See changes

# 3. STAGE: Prepare changes for commit
git add <file>            # Stage specific file
git add .                 # Stage all changes

# 4. COMMIT: Save your changes
git commit -m "message"  # Commit with message

# 5. BRANCH: Work on features
git branch                # List branches
git checkout <branch>    # Switch to branch

# 6. SYNC: Share with remote
git pull                  # Get remote changes
git push                  # Send your changes
```

---

## 📁 COMPLETE COMMAND REFERENCE BY CATEGORY

### 1️⃣ GETTING STARTED

```bash
# Installation & Version
git --version             # Check Git version
git help                  # Show general help
git help <command>        # Help for specific command
git <command> --help     # Quick help for command

# Creating Repositories
git init                  # Initialize new repo (local)
git clone <url>          # Clone remote repo
git clone <url> <folder> # Clone to specific folder
git clone --depth 1 <url> # Shallow clone (recent history only)

# Configuration
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --global core.editor "code --wait"
git config --list         # Show all config
git config --list --show-origin  # Show config sources
```

### 2️⃣ BASIC WORKFLOW

```bash
# Check Status
git status                # Full status
git status -s            # Short status (??, M, A, etc.)
git status -sb           # Short + branch info

# Staging Changes
git add <file>           # Stage specific file
git add <dir>            # Stage directory
git add .                # Stage all changes (current dir)
git add -A               # Stage all changes (entire repo)
git add -p               # Stage changes interactively (patch mode)
git add -u               # Stage tracked files only (modified/deleted)

# Committing
git commit -m "msg"      # Commit with message
git commit -m "title" -m "description"  # Multi-line message
git commit -a            # Stage tracked files AND commit (skip git add)
git commit --amend       # Modify last commit (rewrite message/add files)
git commit --amend --no-edit  # Add staged changes to last commit
git commit -v            # Show diff in editor while committing
```

### 3️⃣ VIEWING HISTORY

```bash
# Log Commands
git log                   # Full log (most recent first)
git log --oneline        # Compact: hash + message
git log --oneline --graph --all  # Visual branch graph
git log -n 5             # Last 5 commits
git log --author="name"  # Filter by author
git log --since="2 weeks ago"  # Time filter
git log --until="2024-01-01"   # Date filter
git log --grep="keyword" # Search commit messages
git log -S "code"        # Search in code changes
git log --stat           # Show file change stats
git log --follow <file>  # History of specific file (including renames)

# Diff Commands
git diff                  # Unstaged changes (working dir vs staging)
git diff --staged        # Staged changes (staging vs last commit)
git diff HEAD            # All changes (working dir vs last commit)
git diff <commit1> <commit2>  # Compare two commits
git diff <branch1> <branch2>  # Compare branches
git diff --name-only     # Show only file names
git diff --stat          # Show change statistics

# Show Specifics
git show <commit>        # Show commit details + diff
git show <commit> --stat # Show commit stats only
git show <commit>:<file> # Show file at specific commit
git blame <file>        # Show who changed each line
git blame -L 10,20 <file>  # Blame lines 10-20
```

### 4️⃣ BRANCHING

```bash
# List Branches
git branch                # List local branches
git branch -a            # List ALL branches (local + remote)
git branch -r            # List remote branches
git branch -v            # List with last commit info
git branch -vv           # List with upstream tracking info

# Create Branches
git branch <name>        # Create new branch (don't switch)
git checkout -b <name>  # Create AND switch to new branch
git switch -c <name>    # Same as above (modern)
git checkout -b <name> <remote>/<branch>  # Create from remote branch
git switch -c <name> <remote>/<branch>   # Same (modern)

# Switch Branches
git checkout <branch>   # Switch to branch
git switch <branch>     # Same (modern)
git checkout -           # Switch to previous branch
git switch -            # Same (modern)

# Delete Branches
git branch -d <branch>   # Delete local branch (safe, merged only)
git branch -D <branch>  # Delete local branch (force)
git push <remote> --delete <branch>  # Delete remote branch

# Rename Branch
git branch -m <new-name>           # Rename current branch
git branch -m <old-name> <new-name>  # Rename specific branch
```

### 5️⃣ MERGING

```bash
# Basic Merge
git merge <branch>      # Merge branch into current branch
git merge --no-ff <branch>  # Force merge commit (preserve history)
git merge --squash <branch>  # Squash all commits into one
git merge --abort       # Cancel merge in progress

# Fast-Forward Merge (when no conflicts)
# Automatically happens when branch is directly ahead

# 3-Way Merge (when branches have diverged)
# Creates merge commit automatically
```

### 6️⃣ REBASING

```bash
# Basic Rebase
git rebase <branch>      # Rebase current branch onto branch
git rebase --onto <new> <old> <branch>  # Rebase branch from old to new
git rebase -i <branch>   # Interactive rebase

# Interactive Rebase Options
pick <commit>   # Use commit as-is
reword <commit> # Change commit message
edit <commit>   # Stop and amend
squash <commit> # Combine with previous
fixup <commit>  # Combine, discard message
drop <commit>   # Remove commit
reorder <commits>  # Move commits around

# Continue/Abort Rebase
git rebase --continue   # After resolving conflicts
git rebase --abort      # Cancel rebase, return to original
git rebase --skip       # Skip current commit
```

### 7️⃣ REMOTE OPERATIONS

```bash
# Remote Management
git remote -v            # Show remote URLs
git remote add <name> <url>  # Add remote
git remote remove <name> # Remove remote
git remote rename <old> <new>  # Rename remote
git remote show <name>   # Show remote details
git remote set-url <name> <url>  # Change remote URL

# Fetching
git fetch                # Download from all remotes
git fetch <remote>       # Download from specific remote
git fetch --all          # Fetch all remotes

# Pulling
git pull                 # Fetch + merge (current branch)
git pull --rebase        # Fetch + rebase (no merge commits)
git pull <remote> <branch>  # Pull specific branch

# Pushing
git push                 # Push to remote
git push -u <remote> <branch>  # Push and set upstream
git push --all           # Push all branches
git push --tags          # Push all tags
git push <remote> --delete <branch>  # Delete remote branch
git push --force         # Force push (BE CAREFUL!)
git push --force-with-lease  # Safer force push
```

### 8️⃣ STASHING

```bash
# Stash Commands
git stash                 # Stash changes (staged + unstaged)
git stash -u             # Include untracked files
git stash -a            # Include ignored files
git stash push -m "msg" # Stash with message

# Manage Stashes
git stash list           # List all stashes
git stash show          # Show stash contents (stats)
git stash show -p      # Show stash contents (full diff)
git stash pop           # Apply stash + delete
git stash apply         # Apply stash (keep stash)
git stash apply stash@{n}  # Apply specific stash
git stash drop          # Delete stash
git stash drop stash@{n}  # Delete specific stash
git stash clear         # Delete all stashes
git stash branch <name> # Create branch from stash
```

### 9️⃣ UNDOING MISTAKES

```bash
# Discard Working Directory Changes
git checkout -- <file>   # Discard unstaged changes (OLD)
git restore <file>       # Discard unstaged changes (NEW)
git checkout .          # Discard all unstaged changes (OLD)
git restore .           # Discard all unstaged changes (NEW)

# Unstage Files
git reset HEAD <file>   # Unstage specific file (OLD)
git restore --staged <file>  # Unstage file (NEW)
git reset HEAD           # Unstage all files
git restore --staged .   # Unstage all files (NEW)

# Amend Last Commit
git commit --amend       # Change last commit message
git commit --amend --no-edit  # Add staged changes to last commit

# Revert (Safe Undo)
git revert <commit>     # Create new commit that undoes <commit>
git revert HEAD          # Undo last commit
git revert <commit1>..<commit2>  # Revert range

# Reset (History Rewrite)
git reset --soft HEAD~1  # Undo commit, keep changes STAGED
git reset --mixed HEAD~1 # Undo commit, keep changes UNSTAGED (default)
git reset --hard HEAD~1  # Undo commit, DISCARD changes
git reset --hard HEAD    # Clear staging, discard all changes

# Recovery
git reflog               # Show all reference updates
git reflog --date=relative  # Show with relative dates
git checkout <hash>      # Go to specific commit
git branch <name> <hash> # Create branch from old commit
```

### 🔟 TAGS

```bash
# List Tags
git tag                  # List all tags
git tag -l "v1.*"       # List tags matching pattern

# Create Tags
git tag <name>          # Lightweight tag at HEAD
git tag -a <name> -m "msg"  # Annotated tag with message
git tag -a <name> <commit>  # Tag specific commit

# Share Tags
git push <remote> <tag> # Push specific tag
git push <remote> --tags  # Push all tags
git push <remote> --delete <tag>  # Delete remote tag

# Delete Tags
git tag -d <name>       # Delete local tag
```

---

## ⚠️ COMMON ERRORS AND FIXES

| Error Message | Cause | Fix |
|--------------|-------|-----|
| `fatal: not a git repository` | Not in a Git repo | Run `git init` or `cd` to repo |
| `fatal: pathspec 'file' did not match` | File doesn't exist | Check file name with `git status` |
| `nothing to commit, working tree clean` | No changes to commit | Make changes first |
| `nothing to commit, working tree clean` (after init) | No files tracked | Run `git add .` first |
| `Please tell me who you are` | No identity configured | `git config --global user.email "you@example.com"` |
| `fatal: refusing to merge unrelated histories` | Two unrelated repos | `git merge --allow-unrelated-histories` |
| `error: failed to push some refs` | Remote has changes you don't have | `git pull --rebase` then `git push` |
| `Merge conflict in file` | Conflicting changes | Edit file, remove markers, `git add` |
| `You are in 'detached HEAD' state` | HEAD not on branch | `git checkout <branch>` |
| `fatal: cannot lock ref` | Branch name conflict | `git fetch --prune` |
| `fatal: remote origin already exists` | Remote already added | `git remote set-url origin <url>` |
| ` refusing to merge unrelated histories` | Different repo histories | `git merge --allow-unrelated-histories` |

---

## 🔄 WORKFLOW QUICK REFERENCE

### Basic Local Workflow
```
1. Make changes to files
        ↓
2. git status (check what changed)
        ↓
3. git add <files> (stage changes)
        ↓
4. git commit -m "message" (save changes)
        ↓
5. Repeat!
```

### Collaboration Workflow
```
1. git clone <url> (get repo)
        ↓
2. Create feature branch
   git checkout -b feature/my-feature
        ↓
3. Make changes, commit
        ↓
4. git push -u origin feature/my-feature
        ↓
5. Open Pull/Merge Request
        ↓
6. After approval, merge PR
        ↓
7. Delete feature branch
```

### Rebase Workflow
```
1. Start on feature branch
   git checkout feature/my-feature
        ↓
2. Fetch latest main
   git fetch origin
        ↓
3. Rebase onto main
   git rebase origin/main
        ↓
4. Resolve conflicts if any
        ↓
5. Continue rebase
   git rebase --continue
        ↓
6. Force push (if already pushed)
   git push --force-with-lease
```

---

## ⚡ USEFUL ALIASES

Add these to your `~/.gitconfig`:

```ini
[alias]
    # Shortcuts
    st = status
    co = checkout
    br = branch
    ci = commit
    
    # Enhanced status
    s = status -sb
    
    # Log shortcuts
    l = log --oneline --graph --decorate
    la = log --oneline --all --graph --decorate
    ll = log --pretty=format:"%h %s %an" --graph
    
    # Diff shortcuts
    d = diff
    ds = diff --staged
    dw = diff --word-diff
    
    # Stash shortcuts
    ss = stash
    sl = stash list
    sa = stash apply
    sp = stash pop
    sd = stash show -p
    
    # Undo shortcuts
    unstage = reset HEAD --
    undo = reset --soft HEAD~1
    
    # Other
    last = log -1 HEAD
    aliases = config --get-regexp alias
    touch = commit -am "Touch files"
    amend = commit --amend --no-edit
```

---

## 🎯 CHEATSHEET COLORS (Terminal Output)

```
┌─────────┬────────────────────────────────────────────────┐
│  GREEN  │ Files added/staged (A)                        │
├─────────┼────────────────────────────────────────────────┤
│  RED    │ Files modified but not staged (M, right)      │
├─────────┼────────────────────────────────────────────────┤
│  YELLOW │ Files modified and staged (M, left)          │
├─────────┼────────────────────────────────────────────────┤
│  CYAN   │ Branch names                                  │
├─────────┼────────────────────────────────────────────────┤
│ MAGENTA │ Remote/Tag names                              │
├─────────┼────────────────────────────────────────────────┤
│  WHITE  │ Commit messages                              │
└─────────┴────────────────────────────────────────────────┘
```

---

## 📋 FILE STATUS CODES

```
┌────────┬────────────────────────────────────────────────────────┐
│  Code  │ Meaning                                                │
├────────┼────────────────────────────────────────────────────────┤
│   ??   │ Untracked file (not in Git)                           │
├────────┼────────────────────────────────────────────────────────┤
│   A    │ Added to staging area                                 │
├────────┼────────────────────────────────────────────────────────┤
│   M    │ Modified (M = unstaged, MM = staged+modified)          │
├────────┼────────────────────────────────────────────────────────┤
│   D    │ Deleted (D = staged delete,  D = unstaged)            │
├────────┼────────────────────────────────────────────────────────┤
│   R    │ Renamed                                               │
├────────┼────────────────────────────────────────────────────────┤
│   C    │ Copied                                                 │
└────────┴────────────────────────────────────────────────────────┘
```

---

## 🎬 VIDEO QUICK LINKS

| Topic | Video | Key Timestamps |
|-------|-------|---------------|
| Git Basics | [Tutorial for Beginners](https://youtu.be/zTjRZNkhiEU) | 0:00-60:00 |
| Git Init | [Tutorial](https://youtu.be/zTjRZNkhiEU) | 30:00-45:00 |
| Basic Commands | [Tutorial](https://youtu.be/zTjRZNkhiEU) | 45:00-90:00 |
| Branching | [Git & GitHub](https://youtu.be/RGOj5yH7evk) | 0:00-60:00 |
| Merging | [Git & GitHub](https://youtu.be/RGOj5yH7evk) | 60:00-120:00 |
| Remote | [Git Tutorial](https://youtu.be/SWYqp7iY_Tc) | Throughout |
| Advanced | [Full Course](https://youtu.be/8JJ101D3knE) | Throughout |

---

## 🔗 LESSON QUICK LINKS

| Day | Topic | Lesson Link |
|-----|-------|-------------|
| 1 | What is Version Control | [Open](./learning/month-1/week-1/day-1/lesson.md) |
| 2 | Git Setup & Config | [Open](./learning/month-1/week-1/day-2/lesson.md) |
| 3 | First Repository | [Open](./learning/month-1/week-1/day-3/lesson.md) |
| 4 | Staging & Committing | [Open](./learning/month-1/week-1/day-4/lesson.md) |
| 5 | Git Objects | [Open](./learning/month-1/week-1/day-5/lesson.md) |
| 6 | History & Diff | [Open](./learning/month-1/week-1/day-6/lesson.md) |
| 7 | Week 1 Review | [Open](./learning/month-1/week-1/day-7/lesson.md) |

---

**Navigation**:  
← [Dashboard](./dashboard.md) | [Roadmap](./roadmap.md) | Quick Links | Next: [Day 1](./learning/month-1/week-1/day-1/lesson.md) →

**See Also**:
- [Comprehensive Cheatsheet](./cheatsheets/git-commands.md)
- [Common Errors](./debugging/common-errors.md)
- [Fixes Reference](./debugging/fixes.md)
