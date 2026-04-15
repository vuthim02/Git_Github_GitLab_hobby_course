# Git Commands Cheatsheet

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                        COMPREHENSIVE GIT COMMANDS                             ║
║                            All Git Commands in One Place                      ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

---

## 📖 TABLE OF CONTENTS

1. [Setup & Config](#1️⃣-setup--config)
2. [Getting Started](#2️⃣-getting-started)
3. [Basic Snapshotting](#3️⃣-basic-snapshotting)
4. [Branching & Merging](#4️⃣-branching--merging)
5. [Sharing & Updating](#5️⃣-sharing--updating)
6. [Inspection & Comparison](#6️⃣-inspection--comparison)
7. [Patching](#7️⃣-patching)
8. [Debugging](#8️⃣-debugging)
9. [Stashing](#9️⃣-stashing)
10. [Advanced](#🔟-advanced)
11. [Emergency Recovery](#🔴-emergency-recovery)

---

## 1️⃣ SETUP & CONFIG

### Configuration Levels

```bash
git config --local       # Repository-specific (in .git/config)
git config --global      # User-specific (in ~/.gitconfig)
git config --system      # System-wide (in /etc/gitconfig)
```

### Essential Config

```bash
# Identity (REQUIRED before first commit)
git config --global user.name "Your Name"
git config --global user.email "you@example.com"

# Editor
git config --global core.editor "code --wait"     # VS Code
git config --global core.editor "nano"            # Nano
git config --global core.editor "vim"             # Vim

# Default Branch
git config --global init.defaultBranch main

# Credentials (optional)
git config --global credential.helper cache        # Cache credentials
git config --global credential.helper store        # Store permanently
```

### Viewing Config

```bash
git config --list                    # Show all config
git config --list --show-origin     # Show config + source file
git config --list --global          # Show global config only
git config user.name                # Get specific value
git config --get user.name          # Same as above
```

### Useful Aliases

```bash
git config --global alias.st "status -sb"
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.lg "log --oneline --graph --decorate --all"
```

---

## 2️⃣ GETTING STARTED

### Creating Repositories

```bash
git init                    # Create new repository in current folder
git init <directory>       # Create repository in new folder
git init --initial-branch=main  # With initial branch (Git 2.28+)

# Clone existing
git clone <url>            # Clone to folder with repo name
git clone <url> <folder>   # Clone to specific folder
git clone --depth 1 <url>  # Shallow clone (recent history only)
git clone --branch <name> <url>  # Clone specific branch
git clone --recurse-submodules <url>  # Include submodules
```

### Git URLs

```bash
# HTTPS
https://github.com/user/repo.git

# SSH
git@github.com:user/repo.git

# Git Protocol (read-only)
git://github.com/user/repo.git
```

---

## 3️⃣ BASIC SNAPSHOTTING

### File Status Lifecycle

```
┌─────────┐     edit      ┌───────────┐     stage     ┌───────────┐     commit
│ Untracked├──────────────►│ Unstaged  ├──────────────►│  Staged   ├──────────────►│ Committed │
└─────────┘                └───────────┘                └───────────┘                └───────────┘
     │                            │                            │                          │
     │     git add <file>         │     git commit             │                          │
     │◄──────────────────────────│◄───────────────────────────│                          │
     │                            │                            │                          │
     │     git checkout -- file   │     git reset HEAD file   │                          │
     │◄──────────────────────────│◄───────────────────────────│                          │
```

### Status & Tracking

```bash
git status                # Full status
git status -s            # Short format: M A D R ?? etc.
git status -sb           # Short + branch info
git status --ignored     # Show ignored files too
```

### Staging Changes

```bash
git add <file>           # Stage specific file
git add <dir>/           # Stage directory
git add .               # Stage all changes (current dir)
git add -A              # Stage all changes (entire repo)
git add -p              # Stage in patches (interactively)
git add -u              # Stage tracked files only (modified/deleted)
git add *.txt           # Stage by pattern
git add -i              # Interactive staging
```

### Committing

```bash
git commit -m "message"          # Commit with message
git commit -m "title" -m "desc"  # Multi-line message
git commit -a                     # Stage tracked AND commit (skip git add)
git commit -v                    # Show diff in editor
git commit --amend               # Modify last commit
git commit --amend --no-edit     # Add staged changes to last commit
git commit --allow-empty         # Create empty commit
```

### Removing & Moving

```bash
git rm <file>                    # Remove from working dir + stage
git rm --cached <file>          # Remove from staging only (untrack)
git rm -r <dir>                  # Remove directory
git mv <old> <new>              # Rename/move and stage
```

---

## 4️⃣ BRANCHING & MERGING

### Branch Operations

```bash
# List branches
git branch                     # Local branches
git branch -r                  # Remote branches
git branch -a                  # All branches
git branch -v                   # Branches + last commit
git branch -vv                  # Branches + upstream tracking

# Create branches
git branch <name>              # Create (stay on current)
git checkout -b <name>         # Create AND switch
git switch -c <name>           # Modern create + switch
git checkout -b <name> <remote>/<branch>  # From remote branch

# Switch branches
git checkout <branch>         # Switch to branch
git switch <branch>           # Modern switch
git checkout -                 # Switch to previous branch
git switch -                   # Modern previous switch

# Delete branches
git branch -d <name>          # Safe delete (merged only)
git branch -D <name>          # Force delete (unmerged)
git push <remote> --delete <branch>  # Delete remote branch
```

### Merging

```bash
git merge <branch>              # Merge into current branch
git merge --no-ff <branch>     # Create merge commit (preserve history)
git merge --squash <branch>    # Squash all commits into one
git merge --abort              # Cancel merge in progress
git merge --continue           # Continue after resolving conflicts
```

### Rebasing

```bash
git rebase <branch>             # Replay current branch onto branch
git rebase -i <branch>         # Interactive rebase
git rebase --onto <new> <old> <branch>  # Rebase branch from old to new

# Interactive rebase commands:
# pick - use commit as-is
# reword - change message
# edit - stop and amend
# squash - combine with previous
# fixup - combine, discard message
# drop - remove commit

# Rebase options
git rebase --continue          # Continue after resolving
git rebase --abort             # Cancel, return to original
git rebase --skip              # Skip current commit
```

### Cherry-Picking

```bash
git cherry-pick <commit>       # Apply specific commit to current branch
git cherry-pick <commit1> <commit2>  # Multiple commits
git cherry-pick --no-commit <commit>  # Apply without committing
git cherry-pick <old>..<new>  # Range (不包括old)
git cherry-pick <old>^..<new>  # Range (包括old)
```

---

## 5️⃣ SHARING & UPDATING

### Remotes

```bash
git remote -v                   # List remotes with URLs
git remote add <name> <url>     # Add remote
git remote remove <name>       # Remove remote
git remote rename <old> <new>  # Rename remote
git remote set-url <name> <url> # Change URL
git remote show <name>         # Show remote details
git remote prune <name>        # Remove stale remote branches
```

### Fetching

```bash
git fetch                      # Fetch all remotes
git fetch <remote>            # Fetch specific remote
git fetch --all              # Fetch all from all remotes
git fetch <remote> <branch>  # Fetch specific branch
git fetch --prune            # Remove deleted remote branches
```

### Pulling

```bash
git pull                      # Fetch + merge current branch
git pull --rebase            # Fetch + rebase (no merge commits)
git pull <remote> <branch>   # Pull specific branch
git pull --ff-only           # Only if fast-forward possible
```

### Pushing

```bash
git push                      # Push to remote
git push -u <remote> <branch> # Push and set upstream
git push --all               # Push all branches
git push --tags             # Push all tags
git push <remote> --delete <branch>  # Delete remote branch
git push --force            # Force push (BE CAREFUL!)
git push --force-with-lease # Safer force push
```

### Tags

```bash
# List
git tag                      # List all tags
git tag -l "v1.*"           # List with pattern

# Create
git tag <name>              # Lightweight tag
git tag -a <name> -m "msg" # Annotated tag
git tag <name> <commit>    # Tag past commit

# Share/Delete
git push <remote> <tag>     # Push tag
git push <remote> --tags    # Push all tags
git push <remote> --delete <tag>  # Delete remote tag
git tag -d <name>          # Delete local tag
```

---

## 6️⃣ INSPECTION & COMPARISON

### Log Commands

```bash
git log                      # Full log
git log --oneline           # Compact: hash + message
git log --oneline --graph --all  # Visual branch graph
git log -n 5               # Last 5 commits
git log --author="name"    # Filter by author
git log --since="2 weeks"  # Time filter
git log --until="2024-01-01"  # Date filter
git log --grep="keyword"   # Search messages
git log -S "code"         # Search in code
git log -- <file>         # Commits affecting file
git log --follow <file>   # File history (including renames)
git log --stat             # Show file stats
git log --graph            # ASCII graph
git log --reverse          # Oldest first
git log --abbrev-commit    # Short hash
git log --format="%H|%an|%ae|%s"  # Custom format
```

### Diff Commands

```bash
git diff                     # Working dir vs staging
git diff --staged          # Staging vs last commit
git diff HEAD              # Working dir vs last commit
git diff <commit1> <commit2>  # Compare commits
git diff <branch1> <branch2>  # Compare branches
git diff HEAD~3 HEAD       # Last 3 commits
git diff --name-only       # File names only
git diff --stat             # Change statistics
git diff --word-diff        # Word-level diff
git diff <commit> -- <file>  # File diff in commit
```

### Show Commands

```bash
git show <commit>          # Show commit details + diff
git show <commit> --stat   # Stats only
git show <commit>:<file>   # File at commit
git show :/<text>          # Find commit by message
```

---

## 7️⃣ PATCHING

```bash
git apply <patch>           # Apply patch file
git apply --check <patch>  # Check without applying
git format-patch <commit>  # Create patch from commit
git format-patch -1         # Patch for last commit
git format-patch -3         # Patches for last 3 commits
git am <patch>              # Apply patch series
git am --continue           # Continue after conflict
git am --abort              # Cancel patch application
```

---

## 8️⃣ DEBUGGING

```bash
git blame <file>           # Show who changed each line
git blame -L 10,20 <file> # Blame lines 10-20
git blame -e <file>        # Show emails
git bisect start           # Start binary search
git bisect good <commit>  # Mark known good
git bisect bad <commit>   # Mark known bad
git bisect bad            # Current is bad
git bisect reset           # End bisect
git grep "text"            # Search working directory
git grep --cached "text"   # Search staged files
git log -S "code"         # Search history for code
```

---

## 9️⃣ STASHING

```bash
git stash                   # Stash changes
git stash push -m "msg"    # Stash with message
git stash -u               # Include untracked
git stash -a               # Include ignored
git stash list             # List stashes
git stash show            # Show stash
git stash show -p         # Show stash diff
git stash pop             # Apply + delete
git stash apply           # Apply (keep stash)
git stash apply stash@{n}  # Apply specific
git stash drop            # Delete stash
git stash drop stash@{n}  # Delete specific
git stash clear           # Delete all
git stash branch <name>   # Create branch from stash
```

---

## 🔟 ADVANCED

### Clean

```bash
git clean -n               # Preview what would be deleted
git clean -f              # Delete untracked files
git clean -fd             # Delete untracked + directories
git clean -fX             # Delete ignored only
git clean -fx             # Delete ignored + untracked
```

### Reset

```bash
git reset                  # Unstage all (keep changes)
git reset <file>          # Unstage file
git reset HEAD <file>     # Unstage (same)
git reset --soft HEAD~1   # Undo commit (keep staged)
git reset --mixed HEAD~1  # Undo commit (keep unstaged)
git reset --hard HEAD~1   # Undo commit (discard all)
git reset --hard          # Clear staging, discard changes
```

### Reflog

```bash
git reflog                 # Reference log
git reflog --date=relative  # Relative dates
git reflog show <branch>   # Branch reflog
```

### Worktrees

```bash
git worktree list          # List worktrees
git worktree add <path> <branch>  # Create worktree
git worktree remove <path>  # Remove worktree
git worktree prune         # Clean up stale worktrees
```

### Submodules

```bash
git submodule add <url> <path>  # Add submodule
git submodule init           # Initialize submodules
git submodule update        # Update submodules
git submodule update --init --recursive  # All submodules
git submodule foreach 'git status'  # Command in each
```

### Grep

```bash
git grep "text"            # Search working directory
git grep --cached "text"  # Search staging area
git grep -n "text"        # With line numbers
git grep -c "text"        # Count matches
git grep -S "text"        # Search history
```

---

## 🔴 EMERGENCY RECOVERY

### Lost Commit Recovery

```bash
# Find lost commit
git reflog
git reflog --all

# Recover from reflog
git checkout <commit-hash>
git branch <new-branch-name>  # Save as branch

# Or directly
git reset --hard <commit-hash>
```

### Accidental Reset Recovery

```bash
# Find where you were
git reflog

# Go back
git checkout <previous-commit>
```

### Accidental Delete Recovery

```bash
# Recover deleted branch
git reflog
git checkout -b <branch-name> <commit-hash>
```

### Rebase Accident Recovery

```bash
# Cancel rebase
git rebase --abort

# Or find original state
git reflog
git reset --hard <before-rebase>
```

### Wrong Branch Recovery

```bash
# Move uncommitted work
git stash
git checkout <correct-branch>
git stash pop
```

### Merge Wrong Branch Recovery

```bash
# If just merged
git reset --hard HEAD~1

# If already pushed
git revert -m 1 <merge-commit>
```

### Pushed Bad Commit Recovery

```bash
# Revert specific commit
git revert <bad-commit>

# Force push previous good state
git push --force-with-lease <remote> <good-commit>:<branch>
```

### .git Directory Recovery

```bash
# If .git is corrupted/missing
# Re-clone from remote
git clone <remote-url> <new-folder>

# Copy .git from backup or another clone
```

### File Recovery

```bash
# Recover deleted file that was committed
git checkout HEAD -- <filename>

# Recover to specific commit
git checkout <commit> -- <filename>
```

---

## 📊 GIT FLOW COMMANDS

### Feature Branch Workflow

```bash
# Start feature
git checkout -b feature/my-feature main

# Work on feature...
git add .
git commit -m "feat: implement my feature"

# Keep up to date
git fetch origin
git rebase origin/main

# Finish feature
git push -u origin feature/my-feature

# (On GitHub) Create PR → Merge → Delete branch
```

### Hotfix Workflow

```bash
# Start hotfix from main
git checkout -b hotfix/urgent-fix main

# Fix and commit
git add .
git commit -m "fix: urgent bug fix"

# Merge to main
git checkout main
git merge hotfix/urgent-fix
git push origin main

# Merge to develop too
git checkout develop
git merge hotfix/urgent-fix

# Clean up
git branch -d hotfix/urgent-fix
```

---

## ⚡ QUICK COMMAND FINDER

| What You Want | Command |
|---------------|---------|
| Start using Git | `git init` |
| Get a copy of repo | `git clone <url>` |
| Check current state | `git status` |
| See changes | `git diff` |
| Stage a file | `git add <file>` |
| Stage everything | `git add .` |
| Save changes | `git commit -m "msg"` |
| See history | `git log` |
| Create branch | `git branch <name>` |
| Switch to branch | `git checkout <name>` |
| Create & switch | `git checkout -b <name>` |
| Merge branch | `git merge <name>` |
| Share changes | `git push` |
| Get changes | `git pull` |
| Save work temporarily | `git stash` |
| Get stashed work | `git stash pop` |
| Undo changes | `git checkout -- <file>` |
| Unstage file | `git reset HEAD <file>` |
| Undo commit | `git reset --soft HEAD~1` |
| See remotes | `git remote -v` |
| Add remote | `git remote add <name> <url>` |

---

## 🎯 USEFUL ONE-LINERS

```bash
# Amend author of last commit
git commit --amend --author="Name <email>"

# Revert to remote state
git fetch origin && git reset --hard origin/main

# See what you changed today
git log --since="midnight" --author="$(git config user.name)" --oneline -n 10

# Find big files in history
git rev-list --objects --all | git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' | sort -k3 -n -r | head -20

# Remove file from history
git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch <file>' --prune-empty --tag-name-filter cat -- --all

# Find deleted file in history
git log --diff-filter=D --summary | grep delete

# See commits not yet pushed
git log origin/main..HEAD --oneline
```

---

**Navigation**:  
← [Dashboard](../dashboard.md) | [Roadmap](../roadmap.md) | [Quick Links](../quick-links.md) | This Page | Next: [Common Errors](../debugging/common-errors.md) →

**See Also**:
- [Quick Links](../quick-links.md)
- [Common Errors](../debugging/common-errors.md)
- [Fixes Guide](../debugging/fixes.md)
