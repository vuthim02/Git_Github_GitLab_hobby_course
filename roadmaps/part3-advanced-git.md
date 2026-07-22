# Part 3: Advanced Git

## 📚 Table of Contents

1. [Interactive Rebase](#1-interactive-rebase)
2. [Cherry-Picking](#2-cherry-picking)
3. [Git Bisect](#3-git-bisect)
4. [Git Stash](#4-git-stash)
5. [Submodules & Subtrees](#5-submodules--subtrees)
6. [Git Hooks](#6-git-hooks)
7. [Git Worktree](#7-git-worktree)
8. [Git Reflog](#8-git-reflog)
9. [Git Clean](#9-git-clean)
10. [Advanced Log Techniques](#10-advanced-log-techniques)
11. [Practice Exercises](#11-practice-exercises)

---

## 1. Interactive Rebase

### What is Interactive Rebase?

Interactive rebase allows you to modify commit history by squashing, editing, reordering, or deleting commits.

### When to Use Interactive Rebase

- Clean up messy commit history before sharing
- Squash multiple WIP commits into one
- Reorder commits for logical flow
- Edit commit messages
- Remove accidental commits

### Basic Syntax

```bash
# Rebase last 3 commits
git rebase -i HEAD~3

# Rebase onto main
git rebase -i main

# Rebase onto specific commit
git rebase -i abc1234
```

### Interactive Rebase Editor

When you run `git rebase -i`, an editor opens with:

```text
pick abc1234 feat: add user authentication
pick def5678 fix: handle null user edge case
pick 789abcd WIP: working on password reset
pick jkl0123 chore: fix typo in comment
pick mno4567 feat: complete password reset flow
```

### Action Keywords

| Keyword | Short | Description |
|---------|-------|-------------|
| `pick` | `p` | Keep commit as-is |
| `reword` | `r` | Keep commit, edit message |
| `edit` | `e` | Pause at commit for amendment |
| `squash` | `s` | Merge into previous, combine messages |
| `fixup` | `f` | Merge into previous, discard message |
| `drop` | `d` | Delete commit entirely |
| `exec` | `x` | Run shell command at this point |
| `break` | `b` | Pause execution here |

### Squashing Commits

```bash
# Rebase last 3 commits
git rebase -i HEAD~3

# In editor, change:
# pick abc1234 feat: add user authentication
# pick def5678 fix: handle null user edge case
# pick 789abcd WIP: working on password reset

# To:
# pick abc1234 feat: add user authentication
# squash def5678 fix: handle null user edge case
# squash 789abcd WIP: working on password reset
```

### Editing Commits

```bash
# Rebase last 3 commits
git rebase -i HEAD~3

# Change:
# pick abc1234 feat: add user authentication
# edit def5678 fix: handle null user edge case
# pick 789abcd feat: complete password reset

# Git will pause at the edit commit
# Make changes, then:
git add .
git commit --amend
git rebase --continue
```

### Reordering Commits

```bash
# In the rebase editor, simply reorder the lines:
# pick 789abcd feat: complete password reset
# pick abc1234 feat: add user authentication
# pick def5678 fix: handle null user edge case
```

### Aborting and Continuing

```bash
# Abort rebase
git rebase --abort

# Continue after resolving conflicts
git rebase --continue

# Skip current commit
git rebase --skip
```

### Auto-Squash

```bash
# Create fixup commit
git commit --fixup=abc1234

# Create squash commit
git commit --squash=abc1234

# Rebase with auto-squash
git rebase -i --autosquash main
```

---

## 2. Cherry-Picking

### What is Cherry-Picking?

Cherry-picking applies a specific commit from one branch to another without merging the entire branch.

### When to Use Cherry-Picking

- Apply a bug fix from one branch to another
- Port a specific feature commit
- Recover a deleted commit
- Apply changes from abandoned branches

### Basic Syntax

```bash
# Apply single commit
git cherry-pick abc1234

# Apply multiple commits
git cherry-pick abc1234 def5678

# Apply range of commits
git cherry-pick abc1234..def5678

# Apply without committing
git cherry-pick --no-commit abc1234
```

### Cherry-Pick Workflow

```bash
# 1. Find the commit to cherry-pick
git log --oneline feature/login
# abc1234 fix: resolve login timeout

# 2. Switch to target branch
git checkout main

# 3. Cherry-pick the commit
git cherry-pick abc1234

# 4. Resolve any conflicts
git add .
git cherry-pick --continue

# 5. Push changes
git push origin main
```

### Cherry-Pick Multiple Commits

```bash
# Cherry-pick specific commits
git cherry-pick abc1234 def5678 ghi9012

# Cherry-pick range (exclusive of end commit)
git cherry-pick abc1234..ghi9012

# Cherry-pick range (inclusive of end commit)
git cherry-pick abc1234^..ghi9012

# Cherry-pick without committing (stage only)
git cherry-pick --no-commit abc1234 def5678
git commit -m "Apply multiple fixes"
```

### Cherry-Pick Conflicts

```bash
# If conflicts occur
git cherry-pick abc1234
# CONFLICT (content): Merge conflict in filename.txt

# Resolve conflicts in editor
# Then:
git add filename.txt
git cherry-pick --continue

# Or abort
git cherry-pick --abort
```

### Cherry-Pick Best Practices

1. **Use sparingly** - Prefer merging when possible
2. **Avoid duplicate commits** - Can cause confusion
3. **Document cherry-picks** - Mention in commit message
4. **Consider alternatives** - Rebase might be better

---

## 3. Git Bisect

### What is Git Bisect?

Git bisect uses binary search to find the commit that introduced a bug.

### When to Use Git Bisect

- Bug appears in current version but worked before
- You don't know when the bug was introduced
- Large commit history to search through

### Basic Syntax

```bash
# Start bisect
git bisect start

# Mark current commit as bad
git bisect bad

# Mark known good commit
git bisect good abc1234

# Git checks out middle commit
# Test it, then mark as good or bad
git bisect good  # or git bisect bad

# Repeat until bug found
# When done:
git bisect reset
```

### Bisect Workflow

```bash
# 1. Start bisect session
git bisect start

# 2. Mark current commit as bad (has bug)
git bisect bad

# 3. Mark a known good commit
git bisect good v1.0.0

# 4. Git checks out middle commit
# Output: Bisecting: 45 revisions left to test after this (roughly 6 steps)

# 5. Test the commit
# Run your tests or manually test

# 6. Mark as good or bad
git bisect good   # if bug doesn't exist
# OR
git bisect bad    # if bug exists

# 7. Repeat steps 5-6 until git finds the culprit

# 8. When done, reset
git bisect reset
```

### Bisect with Test Script

```bash
# Create test script
cat > test.sh << 'EOF'
#!/bin/bash
# Run your tests
npm test
# Exit with 0 if good, non-zero if bad
EOF

chmod +x test.sh

# Run bisect with script
git bisect start
git bisect bad
git bisect good v1.0.0
git bisect run ./test.sh

# Git automatically finds the bad commit
```

### Bisect Commands

```bash
# Start bisect
git bisect start

# Mark commits
git bisect bad [commit]
git bisect good [commit]
git bisect skip [commit]

# Visualize bisect
git bisect visualize

# Log bisect progress
git bisect log

# Reset bisect
git bisect reset

# Reset to specific branch
git bisect reset feature/login
```

### Bisect Best Practices

1. **Start with known good/bad commits** - narrows search faster
2. **Use automated tests** - `git bisect run`
3. **Skip problematic commits** - if test can't run
4. **Reset when done** - always clean up

---

## 4. Git Stash

### What is Git Stash?

Git stash temporarily stores uncommitted changes, allowing you to switch branches and come back later.

### When to Use Git Stash

- Switch branches with uncommitted changes
- Save work in progress
- Experiment without committing
- Quick context switching

### Basic Syntax

```bash
# Stash changes
git stash

# Stash with message
git stash push -m "WIP: login feature"

# Stash specific files
git stash push -m "Stash login" -- login.js auth.js

# Stash including untracked files
git stash -u

# Stash including ignored files
git stash -a
```

### Managing Stashes

```bash
# List all stashes
git stash list
# stash@{0}: On feature/login: WIP: login feature
# stash@{1}: On main: WIP: database migration

# Apply stash (keep in list)
git stash apply

# Apply specific stash
git stash apply stash@{1}

# Pop stash (apply and remove)
git stash pop

# Drop specific stash
git stash drop stash@{0}

# Clear all stashes
git stash clear
```

### Stash Operations

```bash
# Show stash diff
git stash show

# Show stash diff (full)
git stash show -p

# Show specific stash
git stash show stash@{1} -p

# Create branch from stash
git stash branch new-branch stash@{0}

# Apply stash and keep index
git stash pop --index
```

### Stash Workflow

```bash
# 1. You're working on feature, but need to switch to main
git stash push -m "WIP: feature work"

# 2. Switch to main
git checkout main

# 3. Do emergency fix
git checkout -b hotfix/bug
# ... fix bug ...
git commit -m "fix: critical bug"

# 4. Switch back to feature
git checkout feature/login

# 5. Restore your work
git stash pop

# Continue where you left off
```

### Stash Best Practices

1. **Use descriptive messages** - `git stash push -m "WIP: login form validation"`
2. **Don't stash too often** - Creates clutter
3. **Clean up old stashes** - Use `git stash drop`
4. **Use branches instead** - For longer work

---

## 5. Submodules & Subtrees

### Git Submodules

Submodules allow you to include other Git repositories within your project.

#### Adding Submodules

```bash
# Add submodule
git submodule add https://github.com/user/library.git libs/library

# Add specific branch
git submodule add -b main https://github.com/user/library.git libs/library

# Add specific version
git submodule add https://github.com/user/library.git libs/library
cd libs/library
git checkout v1.0.0
cd ../..
git add libs/library
git commit -m "Add library submodule at v1.0.0"
```

#### Cloning with Submodules

```bash
# Clone with submodules
git clone --recursive https://github.com/user/project.git

# Or after cloning
git submodule init
git submodule update

# Or combined
git submodule update --init --recursive
```

#### Updating Submodules

```bash
# Update to latest
cd libs/library
git pull origin main
cd ../..
git add libs/library
git commit -m "Update library submodule"

# Update all submodules
git submodule update --remote

# Update to specific commit
cd libs/library
git checkout abc1234
cd ../..
git add libs/library
```

#### Removing Submodules

```bash
# Remove submodule
git submodule deinit libs/library
git rm libs/library
rm -rf .git/modules/libs/library
```

### Git Subtrees

Subtrees merge another repository into a subdirectory.

#### Adding Subtree

```bash
# Add subtree
git subtree add --prefix=libs/library https://github.com/user/library.git main --squash

# Commit
git commit -m "Add library as subtree"
```

#### Updating Subtree

```bash
# Pull updates
git subtree pull --prefix=libs/library https://github.com/user/library.git main --squash

# Push changes back
git subtree push --prefix=libs/library https://github.com/user/library.git feature/fix
```

### Submodule vs Subtree

| Feature | Submodule | Subtree |
|---------|-----------|---------|
| Storage | Separate repository | Merged into main |
| Cloning | Requires `--recursive` | Just works |
| Updates | Manual `git submodule update` | `git subtree pull` |
| Complexity | More complex | Simpler |
| History | Separate histories | Combined history |

---

## 6. Git Hooks

### What are Git Hooks?

Git hooks are scripts that run automatically when certain Git events occur.

### Hook Locations

```bash
# Local hooks (per repository)
.git/hooks/

# Global hooks (all repositories)
~/.config/git/hooks/
# Or configured path
git config --global core.hooksPath /path/to/hooks
```

### Common Hooks

#### pre-commit
Runs before a commit is created.

```bash
#!/bin/bash
# .git/hooks/pre-commit

# Check for debug statements
if git diff --cached --name-only | xargs grep -l "console.log\|debugger" 2>/dev/null; then
    echo "Error: Found debug statements in staged files"
    exit 1
fi

# Run linter
npm run lint
if [ $? -ne 0 ]; then
    echo "Error: Linting failed"
    exit 1
fi
```

#### commit-msg
Validates commit message.

```bash
#!/bin/bash
# .git/hooks/commit-msg

# Check commit message format
commit_msg=$(cat "$1")
pattern="^(feat|fix|docs|style|refactor|test|chore): .+"

if ! [[ "$commit_msg" =~ $pattern ]]; then
    echo "Error: Commit message must match pattern: type: message"
    echo "Example: feat: add user authentication"
    exit 1
fi
```

#### post-commit
Runs after commit is created.

```bash
#!/bin/bash
# .git/hooks/post-commit

# Notify team
echo "New commit created: $(git log -1 --pretty=format:'%h %s')"
# Send notification, update ticket, etc.
```

#### pre-push
Runs before push to remote.

```bash
#!/bin/bash
# .git/hooks/pre-push

# Run tests before pushing
npm test
if [ $? -ne 0 ]; then
    echo "Error: Tests failed. Push aborted."
    exit 1
fi
```

#### pre-rebase
Runs before rebase starts.

```bash
#!/bin/bash
# .git/hooks/pre-rebase

# Prevent rebasing published commits
branch=$(git branch --show-current)
if [ "$branch" = "main" ] || [ "$branch" = "master" ]; then
    echo "Error: Cannot rebase main/master branch"
    exit 1
fi
```

### Installing Hooks

```bash
# Make hook executable
chmod +x .git/hooks/pre-commit

# Or use a framework like Husky
npm install husky --save-dev
npx husky install
npx husky add .git/hooks/pre-commit "npm run lint"
```

### Hook Frameworks

- **Husky** - Most popular for JavaScript
- **pre-commit** - Python framework
- **Overcommit** - Ruby framework

---

## 7. Git Worktree

### What is Git Worktree?

Git worktree allows you to have multiple working directories attached to the same repository.

### When to Use Worktree

- Work on hotfix without stashing
- Review PRs while working on feature
- Test different branches simultaneously
- Compare implementations

### Basic Syntax

```bash
# Create worktree
git worktree add ../hotfix-branch hotfix/bug

# Create worktree for new branch
git worktree add -b feature/new ../new-feature main

# List worktrees
git worktree list

# Remove worktree
git worktree remove ../hotfix-branch

# Prune stale worktrees
git worktree prune
```

### Worktree Workflow

```bash
# 1. You're working on feature/login
cd /projects/my-project
git checkout feature/login

# 2. Urgent hotfix needed
git worktree add ../hotfix hotfix/bug

# 3. Switch to hotfix worktree
cd ../hotfix
git checkout -b hotfix/urgent-fix
# ... fix bug ...
git commit -m "fix: urgent bug"
git push origin hotfix/urgent-fix

# 4. Switch back to feature
cd /projects/my-project
# Continue working on feature

# 5. Clean up hotfix worktree
git worktree remove ../hotfix
```

### Worktree Commands

```bash
# Add worktree
git worktree add <path> <branch>

# Add worktree with new branch
git worktree add -b <new-branch> <path> <start-point>

# List worktrees
git worktree list

# Move worktree
git worktree move <old-path> <new-path>

# Remove worktree
git worktree remove <path>

# Prune invalid worktrees
git worktree prune

# Repair worktree
git worktree repair [<path>...]
```

---

## 8. Git Reflog

### What is Reflog?

Reflog (reference log) tracks all changes to HEAD and branch tips. It's your safety net for recovering lost commits.

### When to Use Reflog

- Recover deleted branches
- Restore lost commits
- Find accidentally reset commits
- Debug git operations

### Basic Syntax

```bash
# View reflog
git reflog

# View reflog for specific branch
git reflog show main

# View reflog with date
git reflog --date=iso
```

### Reflog Output

```text
abc1234 HEAD@{0}: merge feature/login: Merge
def5678 HEAD@{1}: checkout: moving from feature/login to main
789abcd HEAD@{2}: commit: Add login feature
jkl0123 HEAD@{3}: checkout: moving from main to feature/login
mno4567 HEAD@{4}: commit: Initial commit
```

### Recovering Deleted Branch

```bash
# Oops, you deleted a branch
git branch -D feature/important

# Find the last commit on that branch
git reflog
# abc1234 HEAD@{5}: commit: Important work

# Recover it
git checkout abc1234
# Or create branch
git branch feature/important abc1234
```

### Recovering Reset Commit

```bash
# You accidentally reset
git reset --hard HEAD~3

# Find the lost commits
git reflog
# def5678 HEAD@{3}: reset: moving to HEAD~3

# Recover
git reset --hard def5678
```

### Reflog Best Practices

1. **Reflog expires** - Default 90 days
2. **Local only** - Not shared with remote
3. **Use as safety net** - Not for regular workflow
4. **Combine with `git fsck`** - Find dangling commits

---

## 9. Git Clean

### What is Git Clean?

Git clean removes untracked files from working directory.

### When to Use Git Clean

- Remove build artifacts
- Clean up temporary files
- Reset working directory to clean state

### Basic Syntax

```bash
# Dry run (see what would be deleted)
git clean -n

# Remove untracked files
git clean -f

# Remove untracked directories
git clean -fd

# Remove ignored files
git clean -fX

# Remove untracked and ignored
git clean -fx

# Interactive clean
git clean -i
```

### Clean Options

| Option | Description |
|--------|-------------|
| `-n` | Dry run (show what would be deleted) |
| `-f` | Force deletion |
| `-d` | Remove untracked directories |
| `-x` | Remove ignored files |
| `-X` | Remove only ignored files |
| `-i` | Interactive mode |

### Clean Workflow

```bash
# 1. See what would be deleted
git clean -nd

# Output:
# Would remove build/
# Would remove node_modules/
# Would remove .env

# 2. Remove untracked files and directories
git clean -fd

# 3. Remove ignored files (build artifacts)
git clean -fX

# 4. Or interactive mode
git clean -i
```

### Safe Clean

```bash
# Always do dry run first
git clean -nd

# Use interactive mode
git clean -i

# Be careful with -x (removes .gitignore files)
git clean -fx  # Use with caution
```

---

## 10. Advanced Log Techniques

### Searching History

```bash
# Search commits by message
git log --grep="bug"

# Search commits by author
git log --author="John"

# Search commits by date
git log --since="2024-01-01"
git log --until="2024-12-31"

# Search commits by file
git log -- filename.txt

# Search commits by content
git log -S"function_name"

# Search commits by regex
git log --grep="fix.*login" --regexp-ignore-case
```

### Formatting Log Output

```bash
# Custom format
git log --pretty=format:"%h - %an, %ar : %s"

# Format placeholders
# %h - abbreviated commit hash
# %H - full commit hash
# %an - author name
# %ae - author email
# %ad - author date
# %s - commit subject
# %b - commit body

# Graph view
git log --graph --oneline --decorate

# Show file changes
git log --stat

# Show patch (diff)
git log -p

# Show last commit with patch
git log -1 -p
```

### Filtering Log

```bash
# Log for specific branch
git log main..feature

# Log not in main
git log main..feature --oneline

# Log between branches
git log main..feature --left-right

# Log for file
git log --follow -- filename.txt

# Log with diff for file
git log -p -- filename.txt
```

### Advanced Log Views

```bash
# One line per commit
git log --oneline

# Verbose
git log --verbose

# Mailbox format
git log --format=mailbox

# Shortlog (group by author)
git shortlog -sn

# Graph with all branches
git log --graph --oneline --decorate --all
```

---

## 11. Practice Exercises

### Exercise 1: Interactive Rebase

1. Create 5 commits with messy messages
2. Use interactive rebase to squash last 3 commits
3. Reorder commits logically
4. Edit commit messages

### Exercise 2: Cherry-Pick

1. Create two branches
2. Make commits on both
3. Cherry-pick a specific commit from one to another
4. Handle any conflicts

### Exercise 3: Bisect

1. Create 10 commits
2. Introduce a bug in commit 5
3. Use bisect to find the bug
4. Use automated test script

### Exercise 4: Stash

1. Make changes on a branch
2. Stash changes
3. Switch to another branch
4. Make different changes
5. Switch back and pop stash

### Exercise 5: Reflog Recovery

1. Make several commits
2. Accidentally reset to previous commit
3. Use reflog to recover
4. Delete a branch and recover it

---

## 📝 Cheat Sheet: Part 3 Commands

| Command | Description |
|---------|-------------|
| `git rebase -i HEAD~n` | Interactive rebase last n commits |
| `git cherry-pick <commit>` | Apply specific commit |
| `git bisect start` | Start bisect session |
| `git bisect bad` | Mark current as bad |
| `git bisect good <commit>` | Mark commit as good |
| `git stash` | Stash changes |
| `git stash pop` | Apply and remove stash |
| `git stash list` | List all stashes |
| `git submodule add <url> <path>` | Add submodule |
| `git worktree add <path> <branch>` | Add worktree |
| `git reflog` | View reflog |
| `git clean -fd` | Remove untracked files |
| `git log --grep="pattern"` | Search commits |

---

## 🎯 Next Steps

Now that you understand advanced Git, move on to:
**Part 4: Git Best Practices & Workflows** - Commit conventions, branching strategies, and team collaboration.

---

*Based on: Pro Git Book, The Modern Coder Git Tutorials, Atlassian Advanced Git Tips, DevOps Learners Hub*
