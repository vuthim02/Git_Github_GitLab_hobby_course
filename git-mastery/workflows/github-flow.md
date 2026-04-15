# GitHub Flow Workflow Guide

## Table of Contents
1. [Overview](#overview)
2. [Why GitHub Flow?](#why-github-flow)
3. [Branch Naming Conventions](#branch-naming-conventions)
4. [Pull Request Workflow](#pull-request-workflow)
5. [Code Review Process](#code-review-process)
6. [Deployment Strategy](#deployment-strategy)
7. [Commands Reference](#commands-reference)
8. [When to Use GitHub Flow](#when-to-use-github-flow)

---

## Overview

GitHub Flow is a lightweight, branch-based workflow developed by GitHub. It's designed for teams that practice continuous deployment and need a simple model that supports frequent deployments.

### Core Principles
- `main` branch is always deployable
- All changes happen through pull requests
- Merge to main triggers deployment
- Feature branches are short-lived

### Visual Diagram

```
●──●──●──●──●──●──●─────────────────────► main
      \     \
       ●──●──●                              feature/user-auth
              \
               ●──●──●──●                   feature/dashboard
                    \
                     ●──●──●──●             feature/api-v2
```

---

## Why GitHub Flow?

### GitHub Flow vs Git Flow

| Aspect | Git Flow | GitHub Flow |
|--------|----------|-------------|
| Branch complexity | 5+ branch types | 1-2 branch types |
| Release cycle | Scheduled releases | Continuous deployment |
| Best for | Scheduled releases | Always-deployable teams |
| Learning curve | Steep | Gentle |
| CI/CD integration | Limited | Native |

### When GitHub Flow Excels

- Continuous Deployment (CD) environments
- Teams with robust automated testing
- Projects that deploy multiple times per day
- Web applications and APIs
- Startups and agile teams

---

## Branch Naming Conventions

### Recommended Patterns

```bash
# Feature branches
feature/add-user-authentication
feature/user-auth
feature/add-payment-stripe

# Bug fixes
bugfix/fix-login-validation
bugfix/correct-total-calculation

# Hotfixes (if needed)
hotfix/security-patch

# Refactoring
refactor/extract-payment-service
refactor/simplify-validation

# Documentation
docs/api-reference
docs/update-readme
```

### Naming Rules

| Rule | Example |
|------|---------|
| Use lowercase | `feature/user-auth` |
| Use hyphens as separators | `feature/user-auth` |
| Include ticket number | `feature/PROJ-123-user-auth` |
| Be descriptive | `feature/add-oauth2-login` |
| Keep it concise | 3-5 words maximum |

### Anti-Patterns to Avoid

```bash
# Don't do this:
my-branch
temp
 work
 fix
 new-feature-again
 John-feature
```

---

## Pull Request Workflow

### Step-by-Step Process

```
┌─────────────────────────────────────────────────────────────────┐
│                    GitHub Flow Workflow                          │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  1. Create branch from main                                     │
│     └─► git checkout -b feature/new-feature                     │
│                                                                  │
│  2. Make changes and commit                                     │
│     └─► git add . && git commit -m "Add new feature"             │
│                                                                  │
│  3. Push branch to remote                                       │
│     └─► git push -u origin feature/new-feature                  │
│                                                                  │
│  4. Open Pull Request                                           │
│     └─► Via GitHub UI or GitHub CLI                             │
│                                                                  │
│  5. Discuss and review code                                      │
│     └─► Team members review and comment                         │
│                                                                  │
│  6. Make requested changes                                      │
│     └─► Push additional commits to the branch                   │
│                                                                  │
│  7. Merge when approved                                         │
│     └─► Squash and merge or merge commit                        │
│                                                                  │
│  8. Delete branch (automatic or manual)                         │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### Creating a Pull Request

```bash
# Using GitHub CLI
gh pr create \
  --title "Add user authentication" \
  --body "## What this PR does
- Adds OAuth2 authentication
- Includes login/logout functionality
  
## Related issues
Closes #123" \
  --reviewer @me \
  --assignee @me

# Using Git
git push -u origin feature/user-auth
# Then create PR via GitHub web interface
```

### PR Description Template

```markdown
## Summary
Brief description of changes

## Changes Made
- List of specific changes

## Testing
- [ ] Unit tests added/updated
- [ ] Manual testing completed
- [ ] No breaking changes

## Screenshots (if applicable)
Include before/after screenshots

## Checklist
- [ ] Code follows project style guidelines
- [ ] Documentation updated
- [ ] All tests pass
```

---

## Code Review Process

### Review Workflow

```
Author                    Reviewers
   │                          │
   ├─── Submit PR ───────────►│
   │                          │
   │                     Review code
   │                     ↓
   │                 ┌─────────────┐
   │                 │  Approved?  │
   │                 └─────────────┘
   │                    /        \
   │                  Yes          No
   │                   │            │
   │     ┌─────────◄───┘            │
   │     │                          │
   │     │              Request changes
   │     │            ◄──┐          │
   │     │                 │          │
   │     │         Make changes      │
   │     │                 │          │
   │     └────────────────►│          │
   │                       │          │
   └─── Merge PR ◄─────────┘          │
   │                          │
```

### Review Best Practices

#### For Authors

1. **Keep PRs small** - Under 400 lines is ideal
2. **Self-review first** - Catch issues before requesting review
3. **Write good descriptions** - Explain the "why"
4. **Respond to comments** - Don't leave reviewers hanging
5. **Don't take feedback personally** - Reviews improve code

```bash
# Example: Check your own changes before requesting review
git log --oneline -5
git diff main...feature/my-feature
git diff --stat
```

#### For Reviewers

1. **Be timely** - Review within 24 hours
2. **Be constructive** - Suggest improvements, don't criticize
3. **Be specific** - Point to exact lines, offer solutions
4. **Approve when ready** - Don't block for minor issues
5. **Use approval patterns** - Request changes vs Approve vs Comment

### Code Review Comments

```markdown
<!-- Nitpick (optional suggestion) -->
Nit: Could use a constant here instead of magic number

<!-- Suggestion (recommended change) -->
Consider extracting this to a helper function for reusability

<!-- Issue (must fix before merge) -->
This could cause a null pointer exception. Please add a null check.

<!-- Question (seek understanding) -->
Why do we need this validation here?

<!-- Praise (optional but encouraged) -->
Great solution! Very elegant.
```

---

## Deployment Strategy

### Deployment Pipeline

```
┌──────────────────────────────────────────────────────────────────┐
│                      Deployment Pipeline                          │
├──────────────────────────────────────────────────────────────────┤
│                                                                   │
│  Push to main ──► CI/CD ──► Tests ──► Deploy                     │
│                                           │                      │
│     ┌─────────────────────────────────────┼─────────────┐        │
│     │                                     │             │        │
│     ▼                                     ▼             ▼        │
│  Staging                            Production    Auto-rollback  │
│  (automatic)                       (automatic)    (on failure)    │
│                                                                   │
└──────────────────────────────────────────────────────────────────┘
```

### Environment Strategy

```yaml
# Example: GitHub Actions workflow for deployment
name: Deploy

on:
  push:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: npm test

  deploy-staging:
    needs: test
    runs-on: ubuntu-latest
    environment: staging
    steps:
      - run: deploy --env staging

  deploy-production:
    needs: deploy-staging
    runs-on: ubuntu-latest
    environment: production
    steps:
      - run: deploy --env production
```

### Feature Flags

For gradual rollouts and quick rollbacks:

```javascript
// Feature flag implementation example
if (featureFlags.isEnabled('new-dashboard')) {
  return <NewDashboard />;
}
return <LegacyDashboard />;
```

---

## Commands Reference

### Complete Workflow Commands

```bash
# 1. Ensure you're on main and up to date
git checkout main
git pull origin main

# 2. Create and switch to feature branch
git checkout -b feature/user-authentication

# 3. Make changes
git add .
git commit -m "Add user authentication module"

# 4. Push to remote (first time with -u to set upstream)
git push -u origin feature/user-authentication

# 5. After reviews, sync with main if needed
git fetch origin
git rebase origin/main

# 6. Force push (only after rebase, if needed)
git push --force-with-lease

# 7. After merge via UI, clean up
git checkout main
git pull origin main
git branch -d feature/user-authentication
git push origin --delete feature/user-authentication
```

### Useful Git Commands

```bash
# Compare your branch with main
git diff main..feature/my-feature

# See commits in your branch
git log main..feature/my-feature

# Check status
git status

# Stash changes temporarily
git stash
git stash pop

# Undo last commit (keep changes)
git reset --soft HEAD~1

# Amend commit message
git commit --amend
```

### GitHub CLI Commands

```bash
# Authentication
gh auth login

# PR operations
gh pr create --title "Title" --body "Body"
gh pr list
gh pr view 123
gh pr checkout 123
gh pr merge 123
gh pr close 123

# Review operations
gh pr review 123 --approve
gh pr review 123 --request-changes --comment "Feedback"
gh pr diff 123

# Issue operations
gh issue create --title "Bug" --body "Description"
gh issue list
```

---

## When to Use GitHub Flow

### Ideal For

- ✓ Continuous Deployment/Integration teams
- ✓ Web applications and APIs
- ✓ Teams with 2-50 developers
- ✓ Projects with automated testing
- ✓ Fast-moving startups
- ✓ DevOps-focused organizations

### NOT Ideal For

- ✗ Projects requiring scheduled releases
- ✗ Projects with multiple environments (dev, staging, prod)
- ✗ Teams without CI/CD infrastructure
- ✗ Projects needing release branches for documentation/hotfixes
- ✗ Complex multi-team coordination

### Decision Matrix

| Factor | Use GitHub Flow | Use Git Flow |
|--------|-----------------|--------------|
| Deployment frequency | Multiple daily | Weekly/Monthly |
| Team size | Small-Medium | Medium-Large |
| Environment complexity | Single/Simple | Multiple/Complex |
| Release cycle | Continuous | Scheduled |
| Automation level | High | Variable |
| Branch strategy preference | Simple | Comprehensive |

---

## Best Practices

1. **Keep main always deployable** - If it's broken, fix it immediately
2. **Feature branches should be short-lived** - Hours to a few days max
3. **Merge frequently to main** - Avoid long-running divergent branches
4. **Use protected branch rules** - Require PR reviews and status checks
5. **Automate everything** - Tests, deployments, notifications
6. **Communicate changes** - Use PR descriptions and team channels

## Common Mistakes

| Mistake | Solution |
|---------|----------|
| Large PRs | Break into smaller PRs |
| Long-lived branches | Rebase daily, merge quickly |
| Skipping tests | Require passing CI for merge |
| Not reviewing code | Mandatory approvals |
| Pushing to main directly | Disable direct pushes |
| Ignoring conflicts | Rebase before merge |
