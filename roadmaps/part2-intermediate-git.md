# Part 2: Intermediate Git

## 📚 Table of Contents

1. [Branching Concepts](#1-branching-concepts)
2. [Branch Operations](#2-branch-operations)
3. [Merging Branches](#3-merging-branches)
4. [Remote Repositories](#4-remote-repositories)
5. [Pull Requests & Collaboration](#5-pull-requests--collaboration)
6. [Merge Conflicts](#6-merge-conflicts)
7. [Git Tags](#7-git-tags)
8. [Undoing Changes](#8-undoing-changes)
9. [Git Aliases](#9-git-aliases)
10. [Practice Exercises](#10-practice-exercises)

---

## 1. Branching Concepts

### What is a Branch?

A branch is a lightweight, movable pointer to a commit. When you create a branch, Git creates a new pointer to the same commit you're currently on.

```
Before branching:
main:    A ← B ← C (HEAD → main)

After creating feature branch:
main:    A ← B ← C (HEAD → main)
                      ↑
feature: ─────────────┘
```

### Why Branch?

- **Isolation:** Work on features without affecting main
- **Parallel Development:** Multiple features simultaneously
- **Experimentation:** Try ideas without risk
- **Code Review:** Review changes before merging
- **Release Management:** Maintain multiple versions

### Types of Branches

#### Long-Lived Branches
- `main` (or `master`) - Production-ready code
- `develop` - Integration branch for features

#### Short-Lived Branches
- `feature/*` - New features
- `bugfix/*` - Bug fixes
- `hotfix/*` - Urgent production fixes
- `release/*` - Release preparation

### Visual Representation

```
main:      A ← B ← C ← D ← E ← F ← G
                      ↑           ↑
feature:   ───────────┘           └─── H ← I ← J
                                             ↑
                                           (merge)
```

---

## 2. Branch Operations

### git branch
List, create, or delete branches.

```bash
# List all branches
git branch

# List all branches (including remote)
git branch -a

# List branches with last commit
git branch -v

# Create new branch
git branch feature/login

# Create and switch to new branch
git checkout -b feature/login
# Or (Git 2.23+)
git switch -c feature/login

# Rename branch
git branch -m old-name new-name

# Delete branch (merged)
git branch -d feature/login

# Delete branch (force, even if unmerged)
git branch -D feature/login

# Delete remote branch
git push origin --delete feature/login
```

### git checkout / git switch
Switch between branches or restore files.

```bash
# Switch to existing branch
git checkout main
# Or (Git 2.23+)
git switch main

# Create and switch to new branch
git checkout -b feature/login
# Or (Git 2.23+)
git switch -c feature/login

# Detached HEAD (not recommended for beginners)
git checkout abc1234

# Restore file from specific commit
git checkout abc1234 -- filename.txt
# Or (Git 2.23+)
git restore --source=abc1234 filename.txt
```

### Detached HEAD

When you checkout a commit directly (not a branch), you're in "detached HEAD" state:

```
main:    A ← B ← C ← D
                      ↑
HEAD:    ─────────────┘ (detached)
```

**Warning:** Changes made in detached HEAD won't be on any branch. If you switch branches, those changes may be lost.

```bash
# If you're in detached HEAD and want to keep changes:
git checkout -b new-branch-name

# Or switch back to a branch:
git checkout main
```

---

## 3. Merging Branches

### Types of Merges

#### Fast-Forward Merge
When the target branch has no new commits since you branched off:

```
Before:
main:    A ← B ← C
                      ↑
feature: ─────────────┘ (no new commits)

After fast-forward:
main:    A ← B ← C ← D (feature commits moved to main)
```

```bash
git checkout main
git merge feature/login
# If fast-forward is possible, Git does it automatically
```

#### Three-Way Merge
When both branches have new commits:

```
Before:
main:    A ← B ← C ← D ← E
                      ↑
feature: ─────────────┘ ← F ← G

After three-way merge:
main:    A ← B ← C ← D ← E ← H (merge commit)
                      ↑              ↑
feature: ─────────────┘ ← F ← G ────┘
```

```bash
git checkout main
git merge feature/login
# Git creates a merge commit
```

### Merge Commands

```bash
# Basic merge
git merge feature/login

# Merge with no fast-forward (always create merge commit)
git merge --no-ff feature/login

# Merge with squash (combine all commits into one)
git merge --squash feature/login
git commit -m "Add login feature"

# Abort merge (if conflicts)
git merge --abort

# Continue merge (after resolving conflicts)
git merge --continue
```

### Merge Strategies

```bash
# Recursive (default) - best for most cases
git merge -s recursive feature/login

# Octopus - merge multiple branches
git merge branch1 branch2 branch3

# Ours - keep our version, ignore theirs
git merge -s ours feature/login
```

---

## 4. Remote Repositories

### Understanding Remotes

A remote is a version of your repository hosted elsewhere (GitHub, GitLab, etc.).

```bash
# List remotes
git remote

# List remotes with URLs
git remote -v

# Add remote
git remote add origin https://github.com/user/repo.git

# Change remote URL
git remote set-url origin https://github.com/user/new-repo.git

# Remove remote
git remote remove origin

# Rename remote
git remote rename origin upstream
```

### Fetching vs Pulling

#### git fetch
Downloads changes from remote but doesn't merge them.

```bash
# Fetch all remotes
git fetch

# Fetch specific remote
git fetch origin

# Fetch specific branch
git fetch origin main

# Fetch and prune deleted branches
git fetch --prune
```

#### git pull
Fetches and merges changes from remote.

```bash
# Pull (fetch + merge)
git pull origin main

# Pull with rebase
git pull --rebase origin main

# Pull specific branch
git pull origin develop
```

### Pushing Changes

```bash
# Push to remote
git push origin main

# Push and set upstream
git push -u origin main

# Push specific branch
git push origin feature/login

# Force push (dangerous!)
git push --force origin main

# Force push with lease (safer)
git push --force-with-lease origin main

# Push all branches
git push --all origin

# Push tags
git push origin --tags
```

### Tracking Branches

```bash
# Set upstream branch
git branch --set-upstream-to=origin/main main

# Show tracking information
git branch -vv

# Remove upstream
git branch --unset-upstream
```

### Remote Branch Workflow

```bash
# 1. Fetch latest changes
git fetch origin

# 2. See what's different
git log main..origin/main

# 3. Merge or rebase
git merge origin/main
# OR
git rebase origin/main

# 4. Push your changes
git push origin main
```

---

## 5. Pull Requests & Collaboration

### What is a Pull Request?

A pull request (PR) is a way to propose changes to a repository. It allows others to review your code before merging.

### GitHub Workflow

```bash
# 1. Create feature branch
git checkout -b feature/new-feature

# 2. Make changes and commit
git add .
git commit -m "feat: add new feature"

# 3. Push to GitHub
git push origin feature/new-feature

# 4. Create pull request on GitHub
# - Go to repository
# - Click "New Pull Request"
# - Select branches
# - Add description
# - Create PR

# 5. Code review happens

# 6. Merge PR (on GitHub or via CLI)
git checkout main
git merge feature/new-feature
git push origin main

# 7. Clean up
git branch -d feature/new-feature
git push origin --delete feature/new-feature
```

### Pull Request Best Practices

1. **Keep PRs small** - Easier to review
2. **Write descriptive titles** - "Add user authentication" not "Update files"
3. **Add description** - Explain what and why
4. **Link issues** - Reference related issues
5. **Request reviews** - Ask specific team members
6. **Respond to feedback** - Address review comments

### Code Review Checklist

- [ ] Code follows team style guidelines
- [ ] No unnecessary complexity
- [ ] Tests are included
- [ ] Documentation is updated
- [ ] No security issues
- [ ] Performance is acceptable

---

## 6. Merge Conflicts

### What Causes Conflicts?

Conflicts occur when two branches modify the same lines in a file:

```
main:    A ← B ← C ← D ← E
                      ↑
feature: ─────────────┘ ← F (same lines modified)
```

### Conflict Markers

```text
<<<<<<< HEAD
This is the current branch's version
=======
This is the incoming branch's version
>>>>>>> feature/login
```

### Resolving Conflicts

#### Step 1: Identify Conflicts
```bash
git status
# Output: both modified: filename.txt
```

#### Step 2: Open Conflicted File
```bash
# Open in editor
code filename.txt

# Or view in terminal
cat filename.txt
```

#### Step 3: Resolve Conflict
1. Look for conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`)
2. Choose which version to keep (or combine both)
3. Remove conflict markers
4. Save file

#### Step 4: Mark as Resolved
```bash
# Stage resolved file
git add filename.txt

# Continue merge
git merge --continue
# Or for rebase
git rebase --continue

# Commit (if merge commit needed)
git commit -m "Resolve merge conflict in filename.txt"
```

#### Step 5: Abort if Needed
```bash
# Abort merge
git merge --abort

# Abort rebase
git rebase --abort
```

### Conflict Resolution Tools

```bash
# Use visual merge tool
git mergetool

# Configure merge tool
git config --global merge.tool vscode
git config --global mergetool.vscode.cmd 'code --wait $MERGED'
```

### Preventing Conflicts

1. **Pull before pushing**
2. **Keep feature branches short-lived**
3. **Communicate with team**
4. **Use small, focused commits**
5. **Rebase frequently**

---

## 7. Git Tags

### What are Tags?

Tags are permanent markers for specific commits (usually for releases).

### Types of Tags

#### Lightweight Tag
```bash
# Create lightweight tag
git tag v1.0.0

# Tag specific commit
git tag v1.0.0 abc1234

# List tags
git tag

# Show tag details
git show v1.0.0

# Push tags
git push origin v1.0.0

# Push all tags
git push origin --tags

# Delete tag
git tag -d v1.0.0

# Delete remote tag
git push origin --delete v1.0.0
```

#### Annotated Tag
```bash
# Create annotated tag (recommended)
git tag -a v1.0.0 -m "Version 1.0.0 release"

# Tag specific commit
git tag -a v1.0.0 abc1234 -m "Version 1.0.0"

# Show annotated tag
git show v1.0.0
# Shows tagger info, date, and message
```

### Tag Best Practices

1. **Use semantic versioning** (v1.0.0, v1.1.0, v2.0.0)
2. **Use annotated tags** for releases
3. **Don't delete remote tags** unless necessary
4. **Tag important milestones**

---

## 8. Undoing Changes

### Reset vs Revert vs Restore

#### git reset
Move HEAD and optionally update index and working directory.

```bash
# Soft reset (keep changes staged)
git reset --soft HEAD~1

# Mixed reset (keep changes unstaged) - default
git reset HEAD~1

# Hard reset (discard all changes)
git reset --hard HEAD~1

# Reset specific file
git reset HEAD filename.txt

# Reset to specific commit
git reset --hard abc1234
```

#### git revert
Create a new commit that undoes changes (safe for shared branches).

```bash
# Revert last commit
git revert HEAD

# Revert specific commit
git revert abc1234

# Revert without committing
git revert --no-commit abc1234

# Revert merge commit
git revert -m 1 abc1234
```

#### git restore
Restore working directory files.

```bash
# Discard working directory changes
git restore filename.txt

# Unstage file
git restore --staged filename.txt

# Restore from specific commit
git restore --source=abc1234 filename.txt
```

### When to Use Each

| Command | Use Case | Safe for Shared? |
|---------|----------|------------------|
| `git reset --soft` | Undo commit, keep changes | No |
| `git reset --mixed` | Undo commit and staging | No |
| `git reset --hard` | Discard everything | No |
| `git revert` | Undo commit (creates new commit) | Yes |
| `git restore` | Discard file changes | Yes |

### Recovering Lost Work

```bash
# View reflog (history of HEAD movements)
git reflog

# Find lost commit
git reflog
# abc1234 HEAD@{5}: commit: important feature

# Recover it
git checkout abc1234
# Or create branch
git branch recovered abc1234
```

---

## 9. Git Aliases

### What are Aliases?

Aliases are shortcuts for frequently used commands.

### Setting Up Aliases

```bash
# Set alias
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.lg "log --oneline --graph --decorate"

# Use alias
git st
git co main
git br
git ci -m "message"
git lg
```

### Useful Aliases

```bash
# Status
git config --global alias.st status

# Checkout
git config --global alias.co checkout

# Branch
git config --global alias.br branch

# Commit
git config --global alias.ci commit

# Log
git config --global alias.lg "log --oneline --graph --decorate --all"

# Last commit
git config --global alias.last "log -1 HEAD"

# Amend
git config --global alias.amend "commit --amend --no-edit"

# Undo last commit (soft)
git config --global alias.undo "reset --soft HEAD~1"

# Show files in last commit
git config --global alias.ls "diff-tree --no-commit-id --name-status -r"

# Search commits
git config --global alias.search "log --grep"
```

### Viewing Aliases

```bash
# List all aliases
git config --global --get-regexp alias

# Or view in config file
cat ~/.gitconfig
```

---

## 10. Practice Exercises

### Exercise 1: Branching and Merging

1. Create a new repository
2. Create a feature branch
3. Make changes on feature branch
4. Switch back to main
5. Make different changes on main
6. Merge feature branch into main
7. Handle any conflicts

### Exercise 2: Remote Collaboration

1. Create repository on GitHub
2. Clone it locally
3. Create feature branch
4. Make changes and push
5. Create pull request
6. Review and merge
7. Pull changes to local

### Exercise 3: Conflict Resolution

1. Create two branches from main
2. Make conflicting changes on both
3. Try to merge (will conflict)
4. Resolve the conflict
5. Complete the merge

### Exercise 4: Tags and Releases

1. Create a repository with several commits
2. Create lightweight tag for first commit
3. Create annotated tag for latest commit
4. View tag history
5. Push tags to remote

### Exercise 5: Undoing Changes

1. Make a commit
2. Undo with `git reset --soft`
3. Make another commit
4. Undo with `git revert`
5. Compare the two approaches

---

## 📝 Cheat Sheet: Part 2 Commands

| Command | Description |
|---------|-------------|
| `git branch` | List branches |
| `git branch -a` | List all branches |
| `git branch <name>` | Create branch |
| `git branch -d <name>` | Delete branch |
| `git checkout <branch>` | Switch branch |
| `git checkout -b <branch>` | Create and switch |
| `git switch <branch>` | Switch branch (new) |
| `git switch -c <branch>` | Create and switch (new) |
| `git merge <branch>` | Merge branch |
| `git merge --no-ff <branch>` | Merge with merge commit |
| `git merge --squash <branch>` | Squash merge |
| `git remote add <name> <url>` | Add remote |
| `git fetch` | Fetch changes |
| `git pull` | Fetch and merge |
| `git push` | Push changes |
| `git tag <name>` | Create tag |
| `git tag -a <name> -m "msg"` | Create annotated tag |
| `git reset --hard HEAD~1` | Undo last commit (hard) |
| `git revert <commit>` | Revert commit |
| `git reflog` | View reflog |

---

## 🎯 Next Steps

Now that you understand intermediate Git, move on to:
**Part 3: Advanced Git** - Interactive rebase, cherry-picking, bisect, stash, and more.

---

*Based on: Pro Git Book, JavaScript Mastery Git Course, Atlassian Git Tutorials, Learn Git Branching*
