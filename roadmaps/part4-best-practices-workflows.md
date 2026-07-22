# Part 4: Git Best Practices & Workflows

## 📚 Table of Contents

1. [Commit Message Conventions](#1-commit-message-conventions)
2. [Branching Strategies](#2-branching-strategies)
3. [Pull Request Best Practices](#3-pull-request-best-practices)
4. [Code Review Guidelines](#4-code-review-guidelines)
5. [Repository Management](#5-repository-management)
6. [Git Configuration for Teams](#6-git-configuration-for-teams)
7. [Common Workflow Patterns](#7-common-workflow-patterns)
8. [Git in Production](#8-git-in-production)
9. [Team Collaboration Tips](#9-team-collaboration-tips)
10. [Practice Exercises](#10-practice-exercises)

---

## 1. Commit Message Conventions

### Why Conventions Matter

- **Readability:** Clear history for future developers
- **Automation:** Tools can parse and generate changelogs
- **Collaboration:** Team understands changes at a glance
- **Debugging:** Easy to find when bugs were introduced

### Conventional Commits

The most widely adopted standard in 2026:

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

### Commit Types

| Type | Description | Example |
|------|-------------|---------|
| `feat` | New feature | `feat: add user authentication` |
| `fix` | Bug fix | `fix: resolve login timeout` |
| `docs` | Documentation | `docs: update README` |
| `style` | Formatting | `style: fix indentation` |
| `refactor` | Code restructuring | `refactor: extract auth service` |
| `perf` | Performance | `perf: optimize database queries` |
| `test` | Tests | `test: add unit tests for auth` |
| `build` | Build system | `build: update webpack config` |
| `ci` | CI/CD | `ci: add GitHub Actions workflow` |
| `chore` | Maintenance | `chore: update dependencies` |
| `revert` | Revert commit | `revert: undo auth changes` |

### Good vs Bad Commit Messages

#### Bad Examples
```bash
# Too vague
git commit -m "fix"
git commit -m "update"
git commit -m "changes"

# Too long
git commit -m "I fixed the bug that was causing the login to not work properly when the user entered their credentials incorrectly and the server was returning a 500 error"

# No context
git commit -m "fixed stuff"
git commit -m "WIP"
git commit -m "asdfghjkl"
```

#### Good Examples
```bash
# Clear and concise
git commit -m "feat: add password reset functionality"

# With scope
git commit -m "fix(auth): resolve token expiration issue"

# With body
git commit -m "feat: implement two-factor authentication

Add TOTP-based 2FA support with QR code generation.
Users can now enable 2FA from their security settings.

Closes #456"

# With breaking change
git commit -m "feat!: change authentication API

BREAKING CHANGE: Authentication endpoint now requires
OAuth 2.0 instead of basic auth.

Migration guide: See docs/migration-v2.md"
```

### Commit Message Tools

```bash
# Install commitlint
npm install --save-dev @commitlint/cli @commitlint/config-conventional

# Create commitlint.config.js
echo "module.exports = {extends: ['@commitlint/config-conventional']}" > commitlint.config.js

# Use commitizen for interactive commits
npm install --save-dev commitizen cz-conventional-changelog

# Add to package.json
echo '"config": {"commitizen": {"path": "cz-conventional-changelog"}}' >> package.json
```

### Semantic Versioning

```
MAJOR.MINOR.PATCH

MAJOR: Breaking changes
MINOR: New features (backward compatible)
PATCH: Bug fixes (backward compatible)

Examples:
1.0.0 → 1.0.1 (bug fix)
1.0.1 → 1.1.0 (new feature)
1.1.0 → 2.0.0 (breaking change)
```

---

## 2. Branching Strategies

### Git Flow

A structured branching model for projects with scheduled releases.

```
main:      A ← B ← C ← D ← E ← F ← G ← H
                      ↑           ↑           ↑
develop:   ───────────┘ ← I ← J ← K ← L ← M
                      ↑                       ↑
feature:   ───────────┘ ← N ← O              │
                                              │
release:   ──────────────────────────────────┘ ← P ← Q
                                                        ↑
hotfix:    ─────────────────────────────────────────────┘
```

#### Branches

- **main** - Production-ready code
- **develop** - Integration branch
- **feature/*** - New features
- **release/*** - Release preparation
- **hotfix/*** - Emergency fixes

#### Commands

```bash
# Start a feature
git checkout develop
git checkout -b feature/login

# Finish feature
git checkout develop
git merge --no-ff feature/login
git branch -d feature/login

# Start a release
git checkout develop
git checkout -b release/1.0.0

# Finish release
git checkout main
git merge --no-ff release/1.0.0
git tag -a v1.0.0 -m "Version 1.0.0"
git checkout develop
git merge --no-ff release/1.0.0

# Hotfix
git checkout main
git checkout -b hotfix/critical-bug
# Fix bug
git checkout main
git merge --no-ff hotfix/critical-bug
git tag -a v1.0.1 -m "Version 1.0.1"
git checkout develop
git merge --no-ff hotfix/critical-bug
```

### GitHub Flow

A lightweight workflow for continuous deployment.

```
main:      A ← B ← C ← D ← E ← F ← G
                      ↑           ↑
feature:   ───────────┘ ← H ← I ← J (via PR)
```

#### Principles

1. **main is always deployable**
2. **Create descriptive branches**
3. **Push to remote regularly**
4. **Open pull requests for review**
5. **Merge after approval**
6. **Deploy immediately after merge**

#### Commands

```bash
# Create feature branch
git checkout main
git pull
git checkout -b feature/new-feature

# Work and push
git add .
git commit -m "feat: add new feature"
git push origin feature/new-feature

# Create PR on GitHub
# After review and approval, merge

# Deploy and clean up
git checkout main
git pull
git branch -d feature/new-feature
git push origin --delete feature/new-feature
```

### GitLab Flow

A hybrid approach with environment branches.

```
main:      A ← B ← C ← D ← E
                      ↑
staging:   ───────────┘ ← F ← G
                                ↑
production: ────────────────────┘ ← H
```

#### Branches

- **main** - Development
- **staging** - Pre-production testing
- **production** - Live environment

#### Commands

```bash
# Feature development
git checkout main
git checkout -b feature/new-feature
# Work and commit
git push origin feature/new-feature
# Create merge request to main

# Deploy to staging
git checkout staging
git merge main
git push origin staging

# Deploy to production
git checkout production
git merge staging
git push origin production
```

### Trunk-Based Development

The modern approach favored by high-performing teams.

```
main:      A ← B ← C ← D ← E ← F ← G ← H ← I
                      ↑   ↑           ↑   ↑
feature:   ───────────┘   └─── J ← K ┘   └─── L
```

#### Principles

1. **Short-lived branches** (1-3 days)
2. **Small, frequent commits**
3. **Feature flags** for incomplete work
4. **Continuous integration**
5. **Automated testing**

#### Commands

```bash
# Create short-lived branch
git checkout main
git pull
git checkout -b feat/small-feature

# Small, focused changes
git add .
git commit -m "feat: add user avatar"
git push origin feat/small-feature

# Merge quickly (within days)
# Create PR, get review, merge
```

### Workflow Comparison

| Workflow | Best For | Complexity | Release Cadence |
|----------|----------|------------|-----------------|
| Git Flow | Versioned software | High | Scheduled |
| GitHub Flow | Web apps, continuous deployment | Low | Continuous |
| GitLab Flow | Staged releases | Medium | Staged |
| Trunk-Based | High-performing teams | Low | Continuous |

---

## 3. Pull Request Best Practices

### PR Title

```bash
# Good
feat: add user authentication
fix: resolve login timeout
docs: update API documentation

# Bad
Update files
Fixed stuff
WIP
```

### PR Description Template

```markdown
## What
Brief description of changes

## Why
Reason for changes (link to issue)

## How
Technical approach taken

## Testing
How changes were tested

## Screenshots (if applicable)
Before/after images

## Checklist
- [ ] Code follows style guidelines
- [ ] Tests added/updated
- [ ] Documentation updated
- [ ] No breaking changes (or documented)
- [ ] Related issue linked (Closes #123)
```

### PR Best Practices

1. **Keep PRs small** - Under 400 lines changed
2. **One feature per PR** - Don't mix unrelated changes
3. **Write descriptive titles** - Clear at a glance
4. **Add context** - Explain what and why
5. **Link issues** - Reference related issues
6. **Request specific reviewers** - Ask relevant team members
7. **Respond to feedback** - Address all comments
8. **Keep PR updated** - Rebase if main has changed

### PR Review Checklist

```markdown
## Code Quality
- [ ] Code is readable and maintainable
- [ ] No unnecessary complexity
- [ ] Follows team conventions
- [ ] No code duplication

## Functionality
- [ ] Works as expected
- [ ] Edge cases handled
- [ ] Error handling appropriate
- [ ] Performance acceptable

## Testing
- [ ] Tests are included
- [ ] Tests are meaningful
- [ ] Edge cases tested
- [ ] No flaky tests

## Security
- [ ] No sensitive data exposed
- [ ] Input validation present
- [ ] Authentication/authorization correct
- [ ] No security vulnerabilities

## Documentation
- [ ] README updated (if needed)
- [ ] Code comments helpful
- [ ] API documentation updated
- [ ] Changelog updated
```

---

## 4. Code Review Guidelines

### For Reviewers

1. **Be constructive** - Suggest improvements, don't just criticize
2. **Ask questions** - Understand the reasoning
3. **Check logic** - Focus on correctness
4. **Review tests** - Ensure adequate coverage
5. **Look for patterns** - Consistency with codebase
6. **Use suggestions** - GitHub's suggestion feature
7. **Approve when ready** - Don't block for minor issues

### For Authors

1. **Explain context** - Why did you make these changes?
2. **Keep PR small** - Easier to review
3. **Respond professionally** - Don't take feedback personally
4. **Make requested changes** - Or explain why not
5. **Thank reviewers** - Acknowledge their time

### Review Comments

```markdown
# Suggestion (use GitHub's suggestion feature)
 suggestion: Use `const` instead of `let` here

# Question
question: Why did you choose this approach over X?

# Praise
Great refactor! This is much cleaner.

# Blocker
This needs to be fixed before merging:
- Security issue: SQL injection vulnerability

# Nit (non-blocking)
nit: Missing semicolon on line 42
```

---

## 5. Repository Management

### Repository Structure

```
my-project/
├── .github/
│   ├── workflows/        # GitHub Actions
│   ├── ISSUE_TEMPLATE/   # Issue templates
│   └── PULL_REQUEST_TEMPLATE.md
├── src/
├── tests/
├── docs/
├── .gitignore
├── .editorconfig
├── README.md
├── CONTRIBUTING.md
├── LICENSE
└── CHANGELOG.md
```

### Essential Files

#### README.md
```markdown
# Project Name

Brief description

## Installation
Steps to install

## Usage
How to use

## Contributing
Guidelines for contributors

## License
License information
```

#### CONTRIBUTING.md
```markdown
# Contributing Guidelines

## How to Contribute
1. Fork repository
2. Create feature branch
3. Make changes
4. Submit pull request

## Code Style
- Follow existing conventions
- Run linter before committing
- Write meaningful commits

## Pull Request Process
1. Update documentation
2. Add tests
3. Ensure CI passes
4. Request review
```

#### CHANGELOG.md
```markdown
# Changelog

## [1.1.0] - 2024-01-15
### Added
- User authentication feature

### Fixed
- Login timeout bug

### Changed
- Updated dependencies

## [1.0.0] - 2024-01-01
### Added
- Initial release
```

### Branch Protection Rules

#### GitHub Settings

```yaml
# Branch protection rules
main:
  required_reviews: 2
  dismiss_stale_reviews: true
  require_code_owner_reviews: true
  required_status_checks:
    - ci/build
    - ci/test
  enforce_admins: true
  restrict_pushes: true
  allow_force_pushes: false
  allow_deletions: false
```

#### GitHub Actions for Branch Protection

```yaml
# .github/workflows/branch-protection.yml
name: Branch Protection

on:
  pull_request:
    branches: [main]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '20'
      - name: Install dependencies
        run: npm ci
      - name: Run tests
        run: npm test
      - name: Run linter
        run: npm run lint
```

---

## 6. Git Configuration for Teams

### Shared Configuration

#### .editorconfig
```ini
# .editorconfig
root = true

[*]
indent_style = space
indent_size = 2
end_of_line = lf
charset = utf-8
trim_trailing_whitespace = true
insert_final_newline = true

[*.md]
trim_trailing_whitespace = false

[*.py]
indent_size = 4

[Makefile]
indent_style = tab
```

#### .gitattributes
```gitattributes
# Normalize line endings
* text=auto

# Specific file types
*.py text diff=python
*.js text diff=node
*.html text diff=html
*.css text diff=css
*.md text diff=markdown

# Binary files
*.png binary
*.jpg binary
*.gif binary
*.ico binary

# Large files
*.zip filter=lfs diff=lfs merge=lfs -text
*.tar.gz filter=lfs diff=lfs merge=lfs -text
```

### Git Hooks for Teams

```bash
# .githooks/pre-commit
#!/bin/bash
# Run linter
npm run lint

# Run tests
npm test

# Check commit message format
commit_msg=$(cat "$1")
pattern="^(feat|fix|docs|style|refactor|test|chore): .+"
if ! [[ "$commit_msg" =~ $pattern ]]; then
    echo "Error: Commit message must follow conventional commits"
    exit 1
fi
```

### Team Git Settings

```bash
# Share common aliases
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.lg "log --oneline --graph --decorate"

# Set pull behavior
git config --global pull.rebase true

# Enable auto-stash during rebase
git config --global rebase.autoStash true

# Set default branch name
git config --global init.defaultBranch main
```

---

## 7. Common Workflow Patterns

### Feature Flag Workflow

```bash
# Create feature with flag
git checkout -b feature/new-dashboard

# Add feature flag
echo "NEW_DASHBOARD_ENABLED=false" >> .env

# Implement feature
# ... code ...

# Toggle flag when ready
sed -i 's/NEW_DASHBOARD_ENABLED=false/NEW_DASHBOARD_ENABLED=true/' .env

# Merge to main
git checkout main
git merge feature/new-dashboard
git push origin main
```

### Release Workflow

```bash
# 1. Create release branch
git checkout develop
git checkout -b release/1.2.0

# 2. Update version
npm version 1.2.0

# 3. Update CHANGELOG.md
# ... edit changelog ...

# 4. Commit changes
git add .
git commit -m "chore: prepare release 1.2.0"

# 5. Merge to main
git checkout main
git merge --no-ff release/1.2.0
git tag -a v1.2.0 -m "Version 1.2.0"

# 6. Merge back to develop
git checkout develop
git merge --no-ff release/1.2.0

# 7. Push
git push origin main
git push origin develop
git push origin --tags

# 8. Deploy
# ... deployment process ...
```

### Hotfix Workflow

```bash
# 1. Create hotfix from main
git checkout main
git checkout -b hotfix/critical-security-fix

# 2. Fix the issue
# ... code fix ...

# 3. Commit fix
git add .
git commit -m "fix: patch SQL injection vulnerability"

# 4. Merge to main
git checkout main
git merge --no-ff hotfix/critical-security-fix
git tag -a v1.2.1 -m "Version 1.2.1"

# 5. Merge back to develop
git checkout develop
git merge --no-ff hotfix/critical-security-fix

# 6. Push and deploy
git push origin main
git push origin develop
git push origin --tags
```

---

## 8. Git in Production

### Backup Strategy

```bash
# Regular backups
git bundle create backup-$(date +%Y%m%d).bundle --all

# Remote backups
git remote add backup /path/to/backup/repo.git
git push backup --all
git push backup --tags
```

### Repository Maintenance

```bash
# Optimize repository
git gc --aggressive

# Clean up unnecessary files
git clean -fd

# Verify repository integrity
git fsck

# Prune old objects
git prune

# Repack objects
git repack -a -d
```

### Security Best Practices

```bash
# Don't commit secrets
echo ".env" >> .gitignore
echo "*.key" >> .gitignore
echo "*.pem" >> .gitignore

# Use git-crypt for encrypted files
git-crypt init
git-crypt adduser email@example.com
echo "*.secret filter=git-crypt diff=git-crypt" >> .gitattributes

# Scan for secrets
# Use tools like git-secrets, truffleHog, or gitleaks
```

### Performance Optimization

```bash
# Shallow clone for CI/CD
git clone --depth 1 --branch main https://github.com/user/repo.git

# Partial clone
git clone --filter=blob:none https://github.com/user/repo.git

# Sparse checkout
git clone --filter=blob:none --sparse https://github.com/user/repo.git
git sparse-checkout set src/ tests/
```

---

## 9. Team Collaboration Tips

### Communication

1. **Use descriptive branch names** - `feature/user-auth` not `my-branch`
2. **Write meaningful commits** - Explain what and why
3. **Keep PRs updated** - Rebase if main has changed
4. **Respond to reviews promptly** - Don't block teammates
5. **Document decisions** - Use PR descriptions and comments

### Conflict Prevention

1. **Pull before pushing** - Always sync with main
2. **Keep branches short-lived** - Merge within days
3. **Communicate large changes** - Discuss before implementing
4. **Use feature flags** - Merge incomplete features safely
5. **Review often** - Don't let PRs sit too long

### Code Ownership

```markdown
# CODEOWNERS file
# These owners will be automatically requested for review

# Default owners for everything
* @team-lead

# Frontend code
/src/frontend/ @frontend-team

# Backend code
/src/backend/ @backend-team

# Documentation
/docs/ @tech-writer
```

### Git Etiquette

1. **Don't force push** to shared branches
2. **Don't commit directly to main**
3. **Don't merge your own PRs** without review
4. **Don't ignore CI failures**
5. **Don't leave PRs open too long**
6. **Do thank reviewers**
7. **Do respond to feedback**
8. **Do keep commits atomic**
9. **Do write descriptive messages**
10. **Do clean up after merging**

---

## 10. Practice Exercises

### Exercise 1: Conventional Commits

1. Create 10 commits following conventional commits
2. Use different types: feat, fix, docs, test, chore
3. Include scopes and breaking changes
4. Use commitlint to validate

### Exercise 2: Branching Strategy

1. Implement Git Flow for a sample project
2. Create feature branches
3. Create release branches
4. Create hotfix branches
5. Merge everything properly

### Exercise 3: Pull Request Workflow

1. Create a feature branch
2. Make changes and push
3. Create a PR with description
4. Self-review your PR
5. Address review comments
6. Merge and clean up

### Exercise 4: Code Review

1. Find an open-source project
2. Review 3 pull requests
3. Provide constructive feedback
4. Use suggestion feature

### Exercise 5: Repository Setup

1. Create a new repository
2. Add README.md, CONTRIBUTING.md, CHANGELOG.md
3. Set up .editorconfig and .gitattributes
4. Configure branch protection rules
5. Add GitHub Actions workflow

---

## 📝 Cheat Sheet: Part 4 Commands

| Command | Description |
|---------|-------------|
| `git flow init` | Initialize Git Flow |
| `git flow feature start <name>` | Start feature branch |
| `git flow feature finish <name>` | Finish feature branch |
| `git flow release start <version>` | Start release branch |
| `git flow release finish <version>` | Finish release branch |
| `git flow hotfix start <version>` | Start hotfix branch |
| `git flow hotfix finish <version>` | Finish hotfix branch |
| `git commit -m "type: message"` | Conventional commit |
| `git push origin --delete <branch>` | Delete remote branch |
| `git gc --aggressive` | Optimize repository |
| `git fsck` | Verify repository integrity |

---

## 🎯 Next Steps

Now that you understand Git best practices, move on to:
**Part 5: Git Internals & Advanced Topics** - Object model, packfiles, CI/CD, and more.

---

*Based on: Pro Git Book, Atlassian Git Workflows, DEV Community Git Workflow Guide, Intosoft Git Workflow Best Practices*
