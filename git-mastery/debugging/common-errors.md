# Common Git Errors & Their Meanings

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                              COMMON GIT ERRORS                                 ║
║                        Error Messages and What They Mean                        ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

---

## 📖 HOW TO USE THIS GUIDE

Each error entry includes:
- **The exact error message**
- **What it means**
- **When it happens**
- **How to prevent it**
- **Quick fix**

---

## 1️⃣ CONFIGURATION ERRORS

### Error: "Please tell me who you are"

```
Error:
fatal: please tell me who you are.

Or:
*** Please tell me who you are.

Run:

    git config --global user.email "you@example.com"
    git config --global user.name "Your Name"
```

**What it means:** Git doesn't know who you are. You haven't configured your identity.

**When it happens:**
- First time using Git
- After fresh installation
- In a new repository
- Before making your first commit

**Prevention:**
```bash
# Always configure immediately after installing Git
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```

**Quick fix:**
```bash
git config --global user.email "your@email.com"
git config --global user.name "Your Name"
```

---

### Error: "User name and email must be set"

```
Error:
fatal: User name and email must be set prior to using git
```

**What it means:** Same as above - identity not configured.

**Prevention:** Set up identity before any Git operations.

---

## 2️⃣ REPOSITORY ERRORS

### Error: "Not a git repository"

```
Error:
fatal: not a git repository (or any of the parent directories): .git

Or:
fatal: 'origin' does not appear to be a git repository
```

**What it means:** You're not in a Git repository, or Git can't find one.

**When it happens:**
- Running Git commands outside a repository
- `cd` to wrong directory
- Forgot to run `git init` or `git clone`

**Prevention:**
- Always `cd` into your repository first
- Use `pwd` to verify location
- Run `git status` to check if in a repo

**Quick fix:**
```bash
# Option 1: Initialize new repository
git init

# Option 2: Navigate to existing repository
cd /path/to/your/repo

# Option 3: Clone if you don't have it
git clone <url>
```

---

### Error: "Already exists"

```
Error:
fatal: destination path 'repo' already exists and is not an empty directory.
```

**What it means:** Trying to clone into a folder that already exists.

**When it happens:**
- Repo folder was created but incomplete
- Accidentally tried cloning twice
- Folder exists from previous attempt

**Prevention:**
```bash
# Always check directory first
ls -la
```

**Quick fix:**
```bash
# Option 1: Remove and reclone
rm -rf repo
git clone <url>

# Option 2: Clone to different name
git clone <url> repo-new
```

---

### Error: ".git directory missing"

```
Error:
fatal: not a git repository: '/path/to/repo/.git'
```

**What it means:** The `.git` folder was deleted or corrupted.

**When it happens:**
- Accidental deletion of `.git`
- Corrupted repository
- File system issue

**Prevention:**
- Don't delete `.git` folder
- Regular backups
- Don't modify files in `.git` manually

**Quick fix:**
```bash
# Option 1: Re-clone from remote
rm -rf /path/to/repo
git clone <remote-url> /path/to/repo

# Option 2: If you have unpushed commits
git init
git remote add origin <url>
git fetch
git reset --hard origin/main  # or appropriate branch
```

---

## 3️⃣ STAGING & COMMITTING ERRORS

### Error: "Nothing to commit"

```
Error:
nothing to commit, working tree clean
```

**What it means:** No changes to commit. Either:
1. No changes were made since last commit
2. All changes are already committed
3. Files aren't tracked yet

**When it happens:**
- Running `git commit` without changes
- After initializing with `git init`
- Running `git add` and `git commit` but forgetting to modify files

**Prevention:**
```bash
# Always check status first
git status
```

**Quick fix:**
```bash
# Make some changes to your files first
echo "Hello" > file.txt
git add file.txt
git commit -m "Add new file"
```

---

### Error: "Did not match any file(s) known by Git"

```
Error:
error: pathspec 'filename' did not match any file(s) known by git
```

**What it means:** The file you specified doesn't exist or isn't tracked.

**When it happens:**
- Typo in filename
- File doesn't exist
- File was deleted
- File is untracked (not added yet)

**Prevention:**
```bash
# Always check status first
git status
```

**Quick fix:**
```bash
# Check what files exist
git status

# Add the file if it exists
git add correct-filename.txt
```

---

### Error: "No message provided"

```
Error:
error: switch 'm' requires a value
Aborting commit due to empty commit message.
```

**What it means:** You ran `git commit` without the `-m` flag or message.

**When it happens:**
- Forgot to add message
- Editor opened but you closed it without saving

**Prevention:**
```bash
# Always include message
git commit -m "Your commit message"
```

**Quick fix:**
```bash
# Add a message
git commit -m "Your commit message"
```

---

### Error: "Changes not staged for commit"

```
Error:
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)

  modified:   filename.txt
```

**What it means:** This is NOT an error - it's information! File is modified but not staged.

**When it happens:** Always when files are modified but not added.

**Prevention:** This is normal behavior.

**Quick fix (if you want to commit):**
```bash
git add filename.txt
git commit -m "Your message"
```

---

## 4️⃣ BRANCHING ERRORS

### Error: "Detached HEAD"

```
Warning:
You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by switching back to a branch.
```

**What it means:** You're not on a branch - you're on a specific commit. Any commits you make could be lost.

**When it happens:**
- `git checkout <commit-hash>`
- `git checkout HEAD~3`
- `git checkout main` when in detached state
- `git bisect start` (part of process)

**Prevention:**
```bash
# Always checkout branches, not commits (unless intentionally)
git checkout main        # Good
git checkout abc1234      # Could cause detached HEAD
```

**Quick fix:**
```bash
# Switch to a branch
git checkout main

# Or if you made commits and want to keep them
git checkout -b my-new-branch  # Create branch from current commit
git checkout main               # Then switch to main
```

---

### Error: "Branch already exists"

```
Error:
fatal: A branch named 'feature' already exists.
```

**What it means:** Trying to create a branch that already exists.

**When it happens:**
- Trying to create branch with existing name
- Typo but branch exists

**Prevention:**
```bash
# List branches first
git branch
```

**Quick fix:**
```bash
# Option 1: Use existing branch
git checkout feature

# Option 2: Create with different name
git checkout -b feature-v2

# Option 3: Delete old branch first (if sure)
git branch -D feature
git checkout -b feature
```

---

### Error: "Cannot delete branch"

```
Error:
error: Cannot delete branch 'feature' checked out at '/path/to/repo'
```

**What it means:** You're currently on the branch you're trying to delete.

**Prevention:**
```bash
# Switch away first
git checkout main
```

**Quick fix:**
```bash
# Switch to another branch
git checkout main

# Then delete
git branch -d feature
```

---

### Error: "Branch 'X' is not fully merged"

```
Error:
error: The branch 'feature' is not fully merged.
If you are sure you want to delete it, run 'git branch -D feature'.
```

**What it means:** Git won't delete unmerged work by default (to prevent data loss).

**Prevention:**
```bash
# Merge or review before deleting
```

**Quick fix:**
```bash
# Option 1: Merge first, then delete
git checkout main
git merge feature
git branch -d feature

# Option 2: Force delete (if you really don't need it)
git branch -D feature
```

---

## 5️⃣ REMOTE & SYNC ERRORS

### Error: "Failed to push some refs"

```
Error:
! [rejected] main -> main (fetch first)
error: failed to push some refs to 'https://github.com/user/repo.git'
hint: Updates were rejected because the remote contains work that you do
not hint: not have locally. This is usually caused by another repository pushing
```

**What it means:** Remote has commits you don't have. You're out of sync.

**When it happens:**
- Someone else pushed to remote
- You pushed from another machine
- You're trying to force your local version

**Prevention:**
```bash
# Always pull before push
git pull --rebase
git push
```

**Quick fix:**
```bash
# Option 1: Rebase and push
git pull --rebase
git push

# Option 2: Merge and push
git pull
git push

# Option 3: Force push (ONLY if you're sure!)
git push --force-with-lease
```

---

### Error: "Permission denied"

```
Error:
Permission denied (publickey).
fatal: Could not read from remote repository.
```

**What it means:** SSH key authentication failed or isn't set up.

**When it happens:**
- Using SSH URL but no SSH key
- SSH key not added to GitHub/GitLab
- Wrong SSH key permissions

**Prevention:**
```bash
# Set up SSH keys before using SSH URLs
ssh-keygen -t ed25519 -C "your@email.com"
# Add public key to GitHub/GitLab
```

**Quick fix:**
```bash
# Option 1: Use HTTPS instead of SSH
git remote set-url origin https://github.com/user/repo.git

# Option 2: Add SSH key to agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Option 3: Add SSH key to GitHub/GitLab
cat ~/.ssh/id_ed25519.pub  # Copy this to your account settings
```

---

### Error: "Remote not found"

```
Error:
fatal: 'origin' does not appear to be a git repository
fatal: Could not read from remote repository.
```

**What it means:** The remote "origin" doesn't exist or URL is wrong.

**Prevention:**
```bash
# Check remotes
git remote -v
```

**Quick fix:**
```bash
# Add remote
git remote add origin <url>

# Or fix URL
git remote set-url origin <correct-url>
```

---

### Error: "Unrelated histories"

```
Error:
fatal: refusing to merge unrelated histories
```

**What it means:** Git won't merge two repositories with different histories.

**When it happens:**
- Created two separate repos and trying to merge
- Initialized repo locally, then tried to connect to existing remote
- Cloned, made new init in folder, then tried to merge

**Prevention:**
```bash
# Don't create separate repos if you want to connect
# Use git clone, not git init
```

**Quick fix:**
```bash
# If you really need to merge unrelated histories
git merge --allow-unrelated-histories

# Or re-clone and copy your work
rm -rf repo
git clone <url>
# Copy your files back
git add .
git commit -m "Restore my work"
```

---

### Error: "Authentication failed"

```
Error:
remote: Invalid username or password.
fatal: Authentication failed for 'https://github.com/user/repo.git'
```

**What it means:** Wrong credentials for HTTPS push.

**Prevention:**
```bash
# Use credential helper
git config --global credential.helper cache
```

**Quick fix:**
```bash
# Update credentials
git remote set-url origin https://USERNAME@github.com/user/repo.git
# Then push and enter correct password

# Or use Personal Access Token (GitHub)
git remote set-url origin https://USERNAME:TOKEN@github.com/user/repo.git
```

---

## 6️⃣ MERGE CONFLICT ERRORS

### Error: "Merge conflict"

```
Error:
Auto-merging file.txt
CONFLICT (content): Merge conflict in file.txt
Automatic merge failed; fix conflicts and then commit the result.
```

**What it means:** Git couldn't automatically merge - same lines changed in different ways.

**When it happens:**
- Two branches modified the same lines
- Someone pushed changes while you were working

**Prevention:**
```bash
# Always pull before starting work
git pull --rebase

# Communicate with team about who edits what
```

**Quick fix:**
```bash
# 1. See which files have conflicts
git status

# 2. Edit the file, remove conflict markers
# <<<<<<< HEAD
# Your changes
# =======
# Their changes
# >>>>>>> branch-name

# 3. Keep what you want (or combine)

# 4. Stage the file
git add file.txt

# 5. Commit
git commit -m "Merge branch 'feature' into main"
```

---

### Error: "Would be overwritten by merge"

```
Error:
error: Your local changes to the following files would be overwritten by merge:
        file.txt
Please commit your changes or stash them before you merge.
```

**What it means:** You have uncommitted changes that would be lost by merge.

**Prevention:**
```bash
# Always commit or stash before pulling
```

**Quick fix:**
```bash
# Option 1: Stash
git stash
git pull
git stash pop

# Option 2: Commit first
git add .
git commit -m "WIP: Work in progress"
git pull
```

---

## 7️⃣ RESET & REBASE ERRORS

### Error: "Cannot rebase onto multiple branches"

```
Error:
fatal: rebase is not possible because you have unstaged changes
```

**What it means:** You have uncommitted changes blocking the rebase.

**Quick fix:**
```bash
# Option 1: Commit
git add .
git commit -m "WIP"
git rebase

# Option 2: Stash
git stash
git rebase
git stash pop
```

---

### Error: "Could not apply"

```
Error:
Applying: commit message
error: patch failed: file.txt:10
error: file.txt: patch does not apply
```

**What it means:** Rebase or stash apply failed due to conflicts.

**Quick fix:**
```bash
# Option 1: Skip this commit
git rebase --skip

# Option 2: Abort rebase
git rebase --abort

# Option 3: Resolve manually
git add .
git rebase --continue
```

---

## 8️⃣ FILE OPERATION ERRORS

### Error: "File would be overwritten"

```
Error:
error: Your changes to the following files would be overwritten by checkout:
        file.txt
Please commit your changes or stash them before you switch branches.
```

**What it means:** Switching branches would lose uncommitted changes.

**Quick fix:**
```bash
# Option 1: Stash
git stash
git checkout other-branch
git stash pop

# Option 2: Commit
git add .
git commit -m "WIP"
git checkout other-branch
```

---

### Error: "Cannot delete - not up to date"

```
Error:
error: unable to unlink old 'file': Permission denied
```

**What it means:** File is open or you don't have permissions.

**Quick fix:**
```bash
# Close any programs using the file
# Or use sudo (Unix/Linux/Mac)
sudo rm file
```

---

## 9️⃣ OTHER COMMON ERRORS

### Error: "SSL certificate problem"

```
Error:
fatal: unable to access 'https://github.com/': SSL certificate problem: self signed certificate
```

**Quick fix:**
```bash
# Option 1: Disable SSL verification (NOT SECURE, only for testing)
git config --global http.sslVerify false

# Option 2: Update certificates
# On Windows: Install certificates
# On Linux: sudo apt-get install ca-certificates
```

---

### Error: "RPC failed"

```
Error:
fatal: RPC failed; HTTP 413 curl 22 The requested URL returned error: 413
fatal: the remote end hung up unexpectedly
```

**What it means:** File too large for push.

**Quick fix:**
```bash
# Increase post buffer
git config --global http.postBuffer 524288000

# Or use Git LFS for large files
git lfs install
git lfs track "*.psd"
git add .gitattributes
```

---

### Error: "Out of memory"

```
Error:
fatal: out of memory - malloc failed
```

**Quick fix:**
```bash
# Increase memory
git config --global core.packedGitWindowSize 512m
git config --global core.packedGitLimit 512m

# Or shallow clone if repo is huge
git clone --depth 1 <url>
```

---

## 🎯 ERROR PREVENTION CHECKLIST

- [ ] Configured identity (name + email)
- [ ] In correct repository directory
- [ ] Always `git status` before operations
- [ ] Always `git pull` before starting work
- [ ] Always `git pull --rebase` before `git push`
- [ ] Committed work before switching branches
- [ ] Understand conflict markers before editing
- [ ] Use `git stash` when needed
- [ ] Regularly `git fetch` to stay updated

---

**Navigation**:  
← [Dashboard](../dashboard.md) | [Roadmap](../roadmap.md) | [Quick Links](../quick-links.md) | Common Errors | Next: [Fixes](./fixes.md) →

**See Also**:
- [Fixes Guide](./fixes.md)
- [Error Log](../tracking/error-log.md)
