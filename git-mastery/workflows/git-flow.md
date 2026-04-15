# Git Flow Workflow Guide

## Table of Contents
1. [What is Git Flow?](#what-is-git-flow)
2. [Branch Structure](#branch-structure)
3. [When to Use Each Branch](#when-to-use-each-branch)
4. [Step-by-Step Workflows](#step-by-step-workflows)
5. [Commands Reference](#commands-reference)
6. [Pros and Cons](#pros-and-cons)
7. [Real-World Examples](#real-world-examples)

---

## What is Git Flow?

Git Flow is a branching model for Git, created by Vincent Driessen. It defines a strict branching model designed around project releases. It provides a robust framework for managing larger projects with scheduled release cycles.

### Key Principles
- Parallel development through feature branches
- Collaboration through pull/merge requests
- Release preparation isolated from active development
- Emergency fixes through hotfix branches

---

## Branch Structure

```
                              feature/HOTFIX
                                  ●
                                  │
    ●──────●──────────────────●───●────────────●────► main
     \      \                  /          /   /
      \      \                /   release/   /
       ●──────●──────────●──●─────────────●
              \           /
               feature/  /
                feature/
```

### Branch Types

| Branch | Purpose | Lifespan | Naming Convention |
|--------|---------|----------|-------------------|
| `main` | Production-ready code | Permanent | `main` or `master` |
| `develop` | Integration branch for features | Permanent | `develop` |
| `feature/*` | New features | Days to weeks | `feature/user-auth` |
| `release/*` | Release preparation | Days | `release/1.2.0` |
| `hotfix/*` | Emergency production fixes | Hours to days | `hotfix/login-bug` |

---

## When to Use Each Branch

### Main Branch
- Contains production-ready code
- Always deployable
- Protected from direct commits
- Only accepts merges from release and hotfix branches

### Develop Branch
- Contains latest development changes
- Integration point for features
- Nightly builds should pass
- Base branch for feature branches

### Feature Branches
- Develop new features
- Branch from `develop`
- Merge back into `develop`
- One feature per branch (ideally)

### Release Branches
- Prepare for a new production release
- Bug fixes only (no new features)
- Branch from `develop`
- Merge into both `main` and `develop`

### Hotfix Branches
- Emergency fixes for production
- Branch from `main`
- Merge into both `main` and `develop`
- Highest priority branches

---

## Step-by-Step Workflows

### Feature Branch Workflow

```
1. Start from develop
   $ git checkout develop
   $ git pull origin develop

2. Create feature branch
   $ git checkout -b feature/add-user-profile

3. Develop and commit changes
   $ git add .
   $ git commit -m "Add user profile component"

4. Sync with develop (optional but recommended)
   $ git fetch origin
   $ git rebase origin/develop

5. Push feature branch
   $ git push -u origin feature/add-user-profile

6. Create pull request (via GitHub/GitLab UI)

7. After approval, merge and cleanup
   $ git checkout develop
   $ git pull origin develop
   $ git merge --no-ff feature/add-user-profile
   $ git push origin develop
   $ git branch -d feature/add-user-profile
   $ git push origin --delete feature/add-user-profile
```

### Release Branch Workflow

```
1. When develop is ready for release
   $ git checkout develop
   $ git pull origin develop
   $ git checkout -b release/1.2.0

2. Update version number
   $ git add VERSION
   $ git commit -m "Bump version to 1.2.0"

3. Fix release-critical bugs
   $ git add .
   $ git commit -m "Fix typo in release notes"

4. Finalize release
   $ git checkout main
   $ git pull origin main
   $ git merge --no-ff release/1.2.0
   $ git tag -a v1.2.0 -m "Release version 1.2.0"
   $ git push origin main
   $ git push origin v1.2.0

5. Merge back to develop
   $ git checkout develop
   $ git merge --no-ff release/1.2.0
   $ git push origin develop

6. Cleanup
   $ git branch -d release/1.2.0
```

### Hotfix Branch Workflow

```
1. Create hotfix from main
   $ git checkout main
   $ git pull origin main
   $ git checkout -b hotfix/critical-login-fix

2. Fix the issue
   $ git add .
   $ git commit -m "Fix critical login validation bug"

3. Merge to main
   $ git checkout main
   $ git merge --no-ff hotfix/critical-login-fix
   $ git tag -a v1.2.1 -m "Hotfix version 1.2.1"
   $ git push origin main
   $ git push origin v1.2.1

4. Merge to develop
   $ git checkout develop
   $ git merge --no-ff hotfix/critical-login-fix
   $ git push origin develop

5. Cleanup
   $ git branch -d hotfix/critical-login-fix
```

---

## Commands Reference

### Setup Commands

```bash
# Initialize git flow (if using git-flow extension)
git flow init

# Configure branch names
git flow config set master main
git flow config set develop develop
```

### Feature Commands

```bash
# Start a feature
git flow feature start my-feature

# Finish a feature
git flow feature finish my-feature

# Publish a feature
git flow feature publish my-feature

# Get a published feature
git flow feature pull origin my-feature
```

### Release Commands

```bash
# Start a release
git flow release start 1.2.0

# Finish a release
git flow release finish 1.2.0

# Publish a release
git flow release publish 1.2.0
```

### Hotfix Commands

```bash
# Start a hotfix
git flow hotfix start 1.2.1

# Finish a hotfix
git flow hotfix finish 1.2.1

# Publish a hotfix
git flow hotfix publish 1.2.1
```

---

## Pros and Cons

### Advantages

| Benefit | Description |
|---------|-------------|
| Clear structure | Well-defined roles for each branch type |
| Parallel development | Features can be developed independently |
| Organized releases | Clean separation between development and production |
| Hotfix support | Dedicated path for emergency fixes |
| Scalable | Works well for teams of any size |

### Disadvantages

| Drawback | Description |
|----------|-------------|
| Complexity | Too complex for small teams or simple projects |
| Git history | `--no-ff` merges create cluttered history |
| Slow to production | Features take time to reach main |
| Overhead | Requires discipline and process adherence |
| Not CI/CD friendly | Long-lived branches cause merge conflicts |

### When NOT to Use Git Flow

- Small teams (< 5 developers)
- Simple projects with continuous deployment
- Projects requiring fast iteration
- Startups with frequently changing requirements
- DevOps-focused teams with automated testing

---

## Real-World Examples

### Example 1: E-commerce Platform

```
Timeline:
- Monday: Start feature/checkout-improvements
- Wednesday: Start feature/payment-integration
- Thursday: feature/checkout-improvements ready for release
- Friday: Release v2.1.0 goes live
- Friday: feature/payment-integration continues in develop
```

### Example 2: SaaS Application

```
Branches:
main:        ●────●───────────────────●───────►
                   \                   \
develop:          ●─●─●─●─●─●─────────●─●───────►
                      \           /
feature/reports:       ●──●──●──●
                            \
feature/dashboard:           ●─●─●──►
```

### Example 3: Mobile App Release Cycle

```
Week 1-2: Feature development on develop
Week 3:   Create release/2.0.0, freeze features
Week 3-4: Testing and bug fixes in release branch
Week 4:   Merge to main, deploy to app stores
Week 4:   Continue with develop for next release
```

---

## Best Practices

1. **Use `--no-ff` for merges** - Preserves branch history
2. **Keep features small** - Easier to review and merge
3. **Delete old branches** - Keep repository clean
4. **Use protected branches** - main and develop should require PRs
5. **Automate testing** - CI/CD catches issues early
6. **Tag releases** - Semantic versioning helps track changes
7. **Sync frequently** - Rebase on develop to avoid conflicts

## Common Mistakes

| Mistake | Solution |
|---------|----------|
| Committing directly to main | Enable branch protection rules |
| Long-running feature branches | Keep features small, rebase often |
| Skipping code review | Require PR approvals |
| Not tagging releases | Use annotated tags with messages |
| Merging instead of rebasing | Rebase feature branches before merge |
| Forgetting to merge hotfix to develop | Always merge hotfix to both branches |
