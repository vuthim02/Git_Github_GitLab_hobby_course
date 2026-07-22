# Git Comprehensive Cheat Sheet

A quick reference for all Git commands covered in this roadmap.

---

## 🚀 Getting Started

```bash
git init                          # Initialize new repository
git clone <url>                   # Clone existing repository
git config --global user.name "Name"  # Set username
git config --global user.email "email" # Set email
git config --list                 # View all settings
```

---

## 📝 Basic Commands

```bash
git status                        # Show working directory status
git status -s                     # Short format status
git add <file>                    # Stage file
git add .                         # Stage all changes
git add -A                        # Stage all (including deletions)
git add -p                        # Interactive staging
git commit -m "message"           # Commit staged changes
git commit -am "message"          # Stage and commit tracked files
git commit --amend                # Amend last commit
```

---

## 📋 History & Diff

```bash
git log                           # View full history
git log --oneline                 # Compact history
git log --graph --oneline --decorate  # Visual graph
git log -5                        # Last 5 commits
git log --stat                    # With file changes
git log -p                        # With patches
git log --grep="pattern"          # Search by message
git log --author="name"           # Search by author
git diff                          # Unstaged changes
git diff --staged                 # Staged changes
git diff abc123 def456            # Between commits
git diff main..feature            # Between branches
```

---

## 🌿 Branching

```bash
git branch                        # List branches
git branch -a                     # List all branches
git branch -v                     # List with last commit
git branch <name>                 # Create branch
git checkout <branch>             # Switch branch
git checkout -b <branch>          # Create and switch
git switch <branch>               # Switch (new syntax)
git switch -c <branch>            # Create and switch (new)
git branch -d <branch>            # Delete branch
git branch -D <branch>            # Force delete
git branch -m <old> <new>         # Rename branch
git branch --set-upstream-to=origin/main main  # Set upstream
```

---

## 🔀 Merging

```bash
git merge <branch>                # Merge branch
git merge --no-ff <branch>        # Merge with merge commit
git merge --squash <branch>       # Squash merge
git merge --abort                 # Abort merge
git merge --continue              # Continue after conflict
```

---

## 🔄 Rebasing

```bash
git rebase <branch>               # Rebase onto branch
git rebase -i HEAD~3              # Interactive rebase last 3
git rebase --abort                # Abort rebase
git rebase --continue             # Continue after conflict
git rebase --skip                 # Skip current commit
```

---

## 🌐 Remote Repositories

```bash
git remote                        # List remotes
git remote -v                     # List with URLs
git remote add <name> <url>       # Add remote
git remote remove <name>          # Remove remote
git remote rename <old> <new>     # Rename remote
git fetch                         # Fetch changes
git fetch origin                  # Fetch specific remote
git pull                          # Fetch and merge
git pull --rebase                 # Fetch and rebase
git push                          # Push changes
git push -u origin main           # Push and set upstream
git push origin --delete <branch> # Delete remote branch
git push origin --tags            # Push all tags
```

---

## 🏷️ Tags

```bash
git tag                           # List tags
git tag <name>                    # Create lightweight tag
git tag -a <name> -m "message"    # Create annotated tag
git tag -a <name> <commit> -m "msg"  # Tag specific commit
git push origin <tag>             # Push tag
git push origin --tags            # Push all tags
git tag -d <name>                 # Delete tag
git push origin --delete <tag>    # Delete remote tag
```

---

## ⏪ Undoing Changes

```bash
git restore <file>                # Discard working changes
git restore --staged <file>       # Unstage file
git reset HEAD~1                  # Undo last commit (mixed)
git reset --soft HEAD~1           # Undo last commit (soft)
git reset --hard HEAD~1           # Undo last commit (hard)
git revert <commit>               # Revert commit (safe)
git reflog                        # View reflog
git checkout <commit>             # Restore deleted commit
git branch recovered <commit>     # Create branch from lost commit
```

---

## 📦 Stashing

```bash
git stash                         # Stash changes
git stash push -m "message"       # Stash with message
git stash push -u                 # Include untracked files
git stash list                    # List stashes
git stash pop                     # Apply and remove
git stash apply                   # Apply but keep
git stash apply stash@{1}         # Apply specific stash
git stash drop stash@{0}          # Drop specific stash
git stash clear                   # Clear all stashes
git stash branch <branch>         # Create branch from stash
```

---

## 🔍 Searching & Finding

```bash
git log --grep="pattern"          # Search commits by message
git log -S"string"                # Search for string in patches
git log --all --grep="pattern"    # Search all branches
git grep "pattern"                # Search working directory
git grep "pattern" HEAD           # Search in HEAD
git bisect start                  # Start bisect
git bisect bad                    # Mark current as bad
git bisect good <commit>          # Mark commit as good
git bisect reset                  # Reset bisect
```

---

## 🔧 Advanced Operations

```bash
git cherry-pick <commit>          # Apply specific commit
git cherry-pick abc123..def456    # Apply range
git worktree add <path> <branch>  # Add worktree
git worktree list                 # List worktrees
git worktree remove <path>        # Remove worktree
git clean -fd                     # Remove untracked files
git clean -fX                     # Remove ignored files
git gc                            # Garbage collection
git fsck                          # Verify repository
```

---

## 🔐 Security & Signing

```bash
git commit -S -m "message"        # Sign commit
git tag -s <name> -m "message"    # Sign tag
git verify-commit <commit>        # Verify commit signature
git verify-tag <tag>              # Verify tag signature
```

---

## 📁 Submodules & Subtrees

```bash
git submodule add <url> <path>    # Add submodule
git submodule update --init       # Initialize submodules
git submodule update --recursive  # Update all submodules
git subtree add --prefix=<path> <url> <branch>  # Add subtree
git subtree pull --prefix=<path> <url> <branch> # Pull subtree
```

---

## ⚙️ Configuration

```bash
git config --global alias.st status       # Create alias
git config --global core.editor "code"    # Set editor
git config --global pull.rebase true      # Set pull behavior
git config --global init.defaultBranch main  # Set default branch
git config --global core.excludesfile ~/.gitignore_global  # Global gitignore
```

---

## 📊 Visualizing History

```bash
git log --graph                    # Show graph
git log --oneline --graph          # Compact graph
git log --graph --all              # All branches graph
git log --graph --decorate         # With branch names
git log --graph --format="%h %s"  # Custom format
git shortlog -sn                   # Commits per author
```

---

## 🔄 GitHub Actions (CI/CD)

```yaml
# .github/workflows/ci.yml
name: CI

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: '20'
      - run: npm ci
      - run: npm test
```

---

## 📝 Commit Message Convention

```
<type>[optional scope]: <description>

[optional body]

[footer]
```

**Types:**
- `feat` - New feature
- `fix` - Bug fix
- `docs` - Documentation
- `style` - Formatting
- `refactor` - Code restructuring
- `test` - Adding tests
- `chore` - Maintenance

**Examples:**
```bash
git commit -m "feat: add user authentication"
git commit -m "fix(auth): resolve token expiration"
git commit -m "docs: update README with installation steps"
```

---

## 🎯 Quick Reference

| Task | Command |
|------|---------|
| Initialize repo | `git init` |
| Clone repo | `git clone <url>` |
| Check status | `git status` |
| Stage file | `git add <file>` |
| Commit | `git commit -m "msg"` |
| Push | `git push` |
| Pull | `git pull` |
| Create branch | `git branch <name>` |
| Switch branch | `git checkout <branch>` |
| Merge branch | `git merge <branch>` |
| View history | `git log --oneline` |
| Undo changes | `git restore <file>` |
| Undo commit | `git revert <commit>` |
| Stash changes | `git stash` |
| View diff | `git diff` |

---

## 👥 Collaboration (GitHub CLI)

```bash
# Pull Requests
gh pr create --title "feat: ..." --body "..."
gh pr list                        # List open PRs
gh pr list --state merged         # List merged PRs
gh pr checkout <pr-number>        # Checkout PR branch
gh pr merge <pr-number>           # Merge PR
gh pr close <pr-number>           # Close PR
gh pr review <pr-number> --approve  # Approve PR
gh pr review <pr-number> --request-changes  # Request changes

# Issues
gh issue create --title "bug: ..." --body "..."
gh issue list                     # List open issues
gh issue view <issue-number>      # View issue
gh issue close <issue-number>     # Close issue
gh issue reopen <issue-number>    # Reopen issue

# Repos
gh repo clone <user/repo>         # Clone repository
gh repo create <name>             # Create repository
gh repo fork <user/repo>          # Fork repository
gh repo view                      # View repository info
```

## 🔀 Forking Workflow

```bash
# Fork on GitHub, then clone
git clone https://github.com/yourusername/repo.git

# Add upstream
git remote add upstream https://github.com/original/repo.git

# Sync fork
git fetch upstream
git checkout main
git merge upstream/main
git push origin main

# Create feature branch
git checkout -b feature/my-feature

# Work and push
git add .
git commit -m "feat: add feature"
git push origin feature/my-feature

# Create PR on GitHub (via web or CLI)
gh pr create
```

## 📋 PR Templates

```bash
# Create PR with template
gh pr create --title "feat: add feature" --body-file .github/PULL_REQUEST_TEMPLATE.md

# Or inline
gh pr create --title "feat: add feature" --body "## Description
Brief description

## Testing
- [ ] Tests added
- [ ] Manual testing done

## Checklist
- [x] Code reviewed
- [x] Documentation updated"
```

## 🏷️ Issue Labels

```bash
# Add labels to issue
gh issue edit <issue-number> --add-label "bug,priority:high"

# List labels
gh label list

# Create label
gh label create "status:needs-review" --color "FBCA04"
```

## 🔄 Keeping Fork Updated

```bash
# Fetch upstream
git fetch upstream

# Rebase on upstream
git checkout main
git rebase upstream/main

# Force push (if needed)
git push origin main --force-with-lease
```

## 📝 Code Review Commands

```bash
# Checkout PR for review
gh pr checkout <pr-number>

# View PR diff
gh pr diff <pr-number>

# View PR checks
gh pr checks <pr-number>

# Add review comment
gh pr review <pr-number> --body "Great work! Minor suggestion..."

# Approve
gh pr review <pr-number> --approve

# Request changes
gh pr review <pr-number> --request-changes --body "Please fix..."
```

## 🔗 Essential Resources

- **Pro Git Book:** https://git-scm.com/book
- **GitHub Docs:** https://docs.github.com
- **Atlassian Tutorials:** https://atlassian.com/git/tutorials
- **Learn Git Branching:** https://learngitbranching.js.org
- **GitHub Skills:** https://skills.github.com
- **Git Cheat Sheet (GitHub):** https://education.github.com/git-cheat-sheet-education.pdf
- **GitHub CLI:** https://cli.github.com
- **Open Source Guides:** https://opensource.guide

---

*Based on: Pro Git Book, freeCodeCamp.org, Traversy Media, Atlassian Git Tutorials, GitHub Documentation*
