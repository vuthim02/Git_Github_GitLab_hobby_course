# Git Fixes & Recovery Guide

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                              GIT FIXES GUIDE                                   ║
║                    Step-by-Step Solutions for Common Problems                  ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

---

## 📖 HOW TO USE THIS GUIDE

Each fix includes:
- **Problem**: What's wrong
- **Solution**: Step-by-step fix
- **Emergency**: Quick command if in a hurry
- **Prevention**: How to avoid next time

---

## 🔴 EMERGENCY COMMANDS

Run these when things go wrong:

```bash
# Stop whatever is happening
git rebase --abort        # Cancel rebase
git merge --abort         # Cancel merge
git reset --hard HEAD    # Discard all changes (CAREFUL!)

# Find lost work
git reflog                # Show everything you've done
git fsck --lost-found     # Find orphaned commits
```

---

## 1️⃣ COMMON FIXES

### Fix: Configure Git Identity

**Problem:** "Please tell me who you are" error

**Solution:**
```bash
# Set your identity (do this once after installing Git)
git config --global user.name "Your Name"
git config --global user.email "you@example.com"

# Verify it's set
git config --list

# Or for a specific repo only (remove --global)
cd /path/to/repo
git config user.email "work@company.com"
```

**Emergency:** `git config --global user.email "you@example.com" && git config --global user.name "Your Name"`

**Prevention:** Always configure Git immediately after installation.

---

### Fix: Initialize or Enter Repository

**Problem:** "fatal: not a git repository"

**Solution:**
```bash
# Check where you are
pwd

# If you need to create a repo
git init

# If you need to clone
git clone <url>

# If you need to navigate
cd /path/to/your/repo
```

**Emergency:** `git init`

**Prevention:** Always `cd` to your repository before running Git commands.

---

### Fix: Stage and Commit Files

**Problem:** "nothing to commit, working tree clean"

**Solution:**
```bash
# 1. Check status
git status

# 2. Make changes to files (Git can't track empty folders or no changes)
echo "Hello" > file.txt

# 3. Stage the file
git add file.txt

# 4. Commit
git commit -m "Add file.txt"

# Or do it all at once for tracked files
git commit -am "Update existing files"
```

**Emergency:** `echo "test" > file.txt && git add . && git commit -m "fix"`

**Prevention:** Make actual file changes before trying to commit.

---

### Fix: Discard Changes to a File

**Problem:** Made unwanted changes to a file

**Solution:**
```bash
# Discard unstaged changes to one file
git checkout -- filename.txt

# Or (modern Git)
git restore filename.txt

# Discard all unstaged changes
git checkout --
git checkout -- .

# Or (modern Git)
git restore .

# Discard all changes including staged
git restore --staged .
git restore .
```

**Emergency:** `git checkout -- .`

**Prevention:** Use `git status` before editing files.

---

### Fix: Unstage a File

**Problem:** Accidentally staged a file

**Solution:**
```bash
# Unstage one file
git reset HEAD filename.txt
# or
git restore --staged filename.txt

# Unstage all files
git reset HEAD
# or
git restore --staged .
```

**Emergency:** `git reset HEAD`

**Prevention:** Always `git status` after `git add`.

---

### Fix: Amend Last Commit

**Problem:** Forgot to add a file / Wrong message

**Solution:**
```bash
# Add the missing file
git add forgotten-file.txt

# Amend to the last commit (keeps same message)
git commit --amend --no-edit

# Or change the message
git commit --amend -m "New, corrected message"
```

**Emergency:** `git add . && git commit --amend --no-edit`

**Prevention:** Always `git status` before pushing.

**WARNING:** Don't amend commits that have been pushed!

---

### Fix: Change Identity on Recent Commits

**Problem:** Commits have wrong author

**Solution:**
```bash
# Set correct identity first
git config user.email "correct@email.com"
git config user.name "Correct Name"

# Amend all commits in current branch
git rebase -i --root

# Change 'pick' to 'edit' for each commit, then:
git commit --amend --author="Correct Name <correct@email.com>" --no-edit
git rebase --continue

# Or for just the last commit
git commit --amend --author="Correct Name <correct@email.com>" --no-edit
```

**Emergency:** `git commit --amend --author="Name <email>" --no-edit`

**Prevention:** Verify identity before starting work.

---

## 2️⃣ BRANCH FIXES

### Fix: Exit Detached HEAD State

**Problem:** "You are in 'detached HEAD' state"

**Solution:**
```bash
# If you made commits and want to keep them
git checkout -b my-new-branch

# If you made commits and DON'T want to keep them
git checkout main

# If you want to keep them on existing branch
git checkout main
git merge my-new-branch  # If you created a branch

# View current state
cat .git/HEAD
```

**Emergency:** `git checkout -b save-my-work`

**Prevention:** Always checkout branches, not commit hashes.

---

### Fix: Create Branch When Name Exists

**Problem:** "A branch named 'feature' already exists"

**Solution:**
```bash
# List existing branches
git branch

# Option 1: Switch to existing branch
git checkout feature

# Option 2: Create with different name
git checkout -b feature-v2

# Option 3: Delete old and recreate (careful!)
git branch -D feature
git checkout -b feature
```

**Emergency:** `git checkout -b feature-new`

**Prevention:** `git branch` before creating.

---

### Fix: Delete a Branch

**Problem:** Can't delete branch / Branch not fully merged

**Solution:**
```bash
# Safe delete (only if merged)
git branch -d branch-name

# Force delete (even if not merged)
git branch -D branch-name

# Delete remote branch
git push origin --delete branch-name

# Delete all merged local branches
git branch --merged main | grep -v "main" | xargs git branch -d
```

**Emergency:** `git branch -D branch-name`

**Prevention:** Always merge before deleting.

---

### Fix: Switch Branches with Uncommitted Changes

**Problem:** "Your local changes would be overwritten by checkout"

**Solution:**
```bash
# Option 1: Stash changes
git stash
git checkout other-branch
git stash pop  # when ready to return

# Option 2: Commit changes first
git add .
git commit -m "WIP: Work in progress"
git checkout other-branch
```

**Emergency:** `git stash`

**Prevention:** Commit or stash before switching branches.

---

### Fix: Recover Deleted Branch

**Problem:** Accidentally deleted a branch with uncommitted work

**Solution:**
```bash
# Find the branch in reflog
git reflog
# Look for: checkout: moving from feature to main
# The commit hash is after "from branch-name"

# Recover using commit hash
git checkout -b recovered-branch <commit-hash>

# Or reset to that point
git reflog
git branch feature <commit-hash>
```

**Emergency:** `git reflog && git checkout -b recovered <hash>`

**Prevention:** Always commit work before deleting branches.

---

## 3️⃣ MERGE & REBASE FIXES

### Fix: Resolve Merge Conflict

**Problem:** "Merge conflict in file.txt"

**Solution:**
```bash
# 1. Check which files have conflicts
git status

# 2. Open file and edit - remove conflict markers:
# <<<<<<< HEAD
# Your changes
# =======
# Their changes
# >>>>>>> branch-name

# 3. Keep what you want (or combine both)

# 4. Stage the resolved file
git add file.txt

# 5. If multiple files, repeat 2-4 for each

# 6. Complete the merge
git commit -m "Merge branch 'feature' into main"
```

**Emergency:** Edit file, remove markers, `git add . && git commit -m "fix"`

**Prevention:** Always `git pull --rebase` before starting work.

---

### Fix: Cancel Merge in Progress

**Problem:** Started merge, but want to cancel

**Solution:**
```bash
git merge --abort
```

**Emergency:** `git merge --abort`

**Prevention:** Think before merging!

---

### Fix: Cancel Rebase in Progress

**Problem:** Rebase went wrong, want to cancel

**Solution:**
```bash
git rebase --abort
```

**Emergency:** `git rebase --abort`

**Prevention:** Commit before rebasing.

---

### Fix: Continue Rebase After Fixing Conflicts

**Problem:** Conflict during rebase

**Solution:**
```bash
# 1. Edit files and resolve conflicts
# 2. Stage the files
git add file1.txt file2.txt

# 3. Continue rebase
git rebase --continue

# Or skip the problematic commit
git rebase --skip
```

**Emergency:** `git add . && git rebase --continue`

---

### Fix: Rebase When Upstream Changed

**Problem:** Remote has new commits, want to update

**Solution:**
```bash
# Fetch latest
git fetch origin

# Rebase onto new main
git rebase origin/main

# Or interactive rebase to clean up
git rebase -i origin/main
```

**Emergency:** `git fetch && git rebase origin/main`

**Prevention:** Regularly `git fetch` while working.

---

## 4️⃣ REMOTE & SYNC FIXES

### Fix: Push Rejected - Remote Ahead

**Problem:** "Updates were rejected because the remote contains work"

**Solution:**
```bash
# Option 1: Rebase (preferred)
git pull --rebase
git push

# Option 2: Merge (creates merge commit)
git pull
git push

# Option 3: Force (ONLY if you're sure!)
git push --force-with-lease
```

**Emergency:** `git pull --rebase && git push`

**Prevention:** Always pull before starting work.

---

### Fix: SSH Permission Denied

**Problem:** "Permission denied (publickey)"

**Solution:**
```bash
# Option 1: Use HTTPS instead
git remote set-url origin https://github.com/user/repo.git

# Option 2: Add SSH key
# Generate key
ssh-keygen -t ed25519 -C "your@email.com"
# Start SSH agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
# Add public key to GitHub/GitLab

# Option 3: Test SSH
ssh -T git@github.com
```

**Emergency:** `git remote set-url origin https://github.com/user/repo.git`

**Prevention:** Set up SSH keys properly.

---

### Fix: Wrong Remote URL

**Problem:** Wrong repository or permission denied

**Solution:**
```bash
# See current remotes
git remote -v

# Change URL
git remote set-url origin correct-url

# Or remove and re-add
git remote remove origin
git remote add origin correct-url
```

**Emergency:** `git remote -v` to check

---

### Fix: Unrelated Histories

**Problem:** "refusing to merge unrelated histories"

**Solution:**
```bash
# Only if you really need to merge unrelated repos
git merge --allow-unrelated-histories

# Or if you just need the remote's files
rm -rf local-repo
git clone <url>
# Copy your files in manually
```

**Emergency:** `git merge --allow-unrelated-histories`

**Prevention:** Don't create separate repos if you want to merge.

---

### Fix: Credentials Not Saving

**Problem:** Git keeps asking for password

**Solution:**
```bash
# Option 1: Cache credentials temporarily
git config --global credential.helper cache

# Option 2: Store credentials permanently
git config --global credential.helper store

# Option 3: Use SSH instead of HTTPS
git remote set-url origin git@github.com:user/repo.git
```

**Emergency:** `git config --global credential.helper store`

---

## 5️⃣ RECOVERY FIXES

### Fix: Lost Commit Recovery

**Problem:** Commits seem to be missing

**Solution:**
```bash
# Find lost commits
git reflog
git fsck --lost-found

# Example reflog output:
# abc1234 HEAD@{0}: commit: Your lost commit
# def5678 HEAD@{1}: commit: Another lost commit

# Recover to a branch
git branch recovered abc1234
git checkout recovered

# Or reset main branch (careful!)
git checkout main
git reset --hard abc1234
```

**Emergency:** `git reflog && git checkout -b recovered <hash>`

**Prevention:** Never force push to main.

---

### Fix: Accidental Reset Recovery

**Problem:** Did `git reset --hard` and lost work

**Solution:**
```bash
# Find where you were
git reflog
# Look for the commit BEFORE the reset

# Recover
git checkout -b recovered <commit-before-reset>

# Or reset to that point
git reset --hard <commit-before-reset>
```

**Emergency:** `git reflog`

**Prevention:** Use `--soft` or `--mixed` instead of `--hard`.

---

### Fix: Accidentally Deleted Files

**Problem:** Deleted files that were committed

**Solution:**
```bash
# See what was deleted
git log --diff-filter=D --summary

# Recover specific file
git checkout HEAD -- filename.txt

# Or recover to a specific commit
git checkout <commit-hash> -- filename.txt
```

**Emergency:** `git checkout HEAD -- .`

**Prevention:** Don't delete tracked files directly.

---

### Fix: Discard All Local Changes

**Problem:** Want to start fresh with remote

**Solution:**
```bash
# Fetch and reset to remote (CAREFUL - loses local changes!)
git fetch origin
git reset --hard origin/main

# Keep untracked files
git clean -fd

# Full reset including untracked
git reset --hard HEAD
git clean -fdx
```

**Emergency:** `git fetch && git reset --hard origin/main`

**Prevention:** Always commit before resetting.

---

### Fix: Recover from Bad Rebase

**Problem:** Rebase went wrong

**Solution:**
```bash
# Cancel rebase if still in progress
git rebase --abort

# Find original state in reflog
git reflog
# Look for "rebase (start)" or "rebase (finish)"

# Reset to state before rebase
git reset --hard HEAD@{X}  # X = number before rebase

# Or cherry-pick specific commits
git cherry-pick <commit1> <commit2>
```

**Emergency:** `git rebase --abort`

**Prevention:** Always commit before rebasing.

---

### Fix: .git Directory Missing/Corrupted

**Problem:** Repository corrupted or .git deleted

**Solution:**
```bash
# If you have remote
rm -rf repo
git clone <remote-url> repo

# If no remote but have unpushed commits
# Find .git backup or use git init + remote
git init
git remote add origin <url>
# Unfortunately, local commits without .git are lost
```

**Emergency:** `rm -rf . && git clone <url> .`

**Prevention:** Regular backups, push frequently.

---

## 6️⃣ STASH FIXES

### Fix: Apply Stash But File Changed

**Problem:** "The following untracked working tree files would be overwritten"

**Solution:**
```bash
# Option 1: Force apply (overwrite local changes)
git stash apply --force

# Option 2: Drop the stash and re-stash
git stash drop
git stash push -m "new stash"

# Option 3: Commit local changes first
git add .
git commit -m "Local changes"
git stash pop
```

**Emergency:** `git stash drop && git stash`

---

### Fix: Stash Pop Conflicts

**Problem:** Conflicts when applying stash

**Solution:**
```bash
# Resolve conflicts like normal merge
# Edit files, remove markers
git add .
git commit -m "Resolve stash conflicts"

# Or abort stash pop
git stash drop
```

**Emergency:** `git stash drop`

---

## 7️⃣ FILE FIXES

### Fix: Untrack File Without Deleting

**Problem:** File is tracked, want to ignore it

**Solution:**
```bash
# Remove from tracking, keep locally
git rm --cached filename.txt
echo "filename.txt" >> .gitignore
git add .gitignore
git commit -m "Ignore filename.txt"
```

**Emergency:** `git rm --cached file && echo "file" >> .gitignore`

---

### Fix: Large File Pushed Accidentally

**Problem:** Pushed large file, can't remove from history

**Solution:**
```bash
# Option 1: If recently pushed (BFG tool)
# Install: brew install bfg
bfg --delete-files large-file.zip

# Option 2: Git filter-branch (slower)
git filter-branch --force --index-filter \
  'git rm --cached --ignore-unmatch large-file.zip' \
  --prune-empty --tag-name-filter cat -- --all

# Then force push
git push --force --all --prune
```

**Emergency:** Use BFG: `bfg --delete-files large.zip`

**Prevention:** Use .gitignore, check file sizes.

---

## 📋 QUICK REFERENCE CARDS

### Emergency Recovery Matrix

| Problem | Quick Command | Full Fix |
|---------|--------------|----------|
| Lost commits | `git reflog` | Find hash, `git checkout -b <hash>` |
| Wrong branch | `git stash` | `git checkout <correct>` |
| Bad merge | `git merge --abort` | Merge again correctly |
| Bad rebase | `git rebase --abort` | Rebase again correctly |
| Accidental reset | `git reflog` | Find good commit, `git reset --hard` |
| Wrong push | `git push --force-with-lease` | Push correct state |
| Detached HEAD | `git checkout -b save` | Create branch from current |

---

## 🛡️ PREVENTION CHECKLIST

- [ ] Configured identity before first commit
- [ ] Always `git status` before operations
- [ ] Always `git pull --rebase` before push
- [ ] Committed work before switching branches
- [ ] Used `git stash` when needed
- [ ] Never force push to main
- [ ] Regular backups to remote
- [ ] Use `.gitignore` for large/temp files

---

**Navigation**:  
← [Dashboard](../dashboard.md) | [Roadmap](../roadmap.md) | [Quick Links](../quick-links.md) | [Common Errors](./common-errors.md) | Fixes | Next: [Cheatsheet](../cheatsheets/git-commands.md) →

**See Also**:
- [Common Errors](./common-errors.md)
- [Error Log](../tracking/error-log.md)
- [Progress](../tracking/progress.md)
