# Part 6: Git Collaboration Deep Dive

## 📚 Table of Contents

1. [Collaboration Models](#1-collaboration-models)
2. [Forking Workflow](#2-forking-workflow)
3. [Branching Workflow](#3-branching-workflow)
4. [Pull Request Mastery](#4-pull-request-mastery)
5. [Code Review Excellence](#5-code-review-excellence)
6. [Merge Conflict Resolution](#6-merge-conflict-resolution)
7. [GitHub Collaboration Features](#7-github-collaboration-features)
8. [GitLab Collaboration Features](#8-gitlab-collaboration-features)
9. [Open Source Contribution](#9-open-source-contribution)
10. [Team Communication Patterns](#10-team-communication-patterns)
11. [Cross-Team Collaboration](#11-cross-team-collaboration)
12. [Issue Tracking & Project Management](#12-issue-tracking--project-management)
13. [Documentation & Wikis](#13-documentation--wikis)
14. [Practice Exercises](#14-practice-exercises)

---

## 1. Collaboration Models

### Overview of Collaboration Approaches

```
┌─────────────────────────────────────────────────────────────────┐
│                   GIT COLLABORATION MODELS                      │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  1. Centralized Model                                          │
│     └── Everyone works on main (simple but risky)              │
│                                                                 │
│  2. Feature Branch Model                                       │
│     └── Branch per feature (most common)                       │
│                                                                 │
│  3. Forking Model                                              │
│     └── Fork + PR (open source standard)                       │
│                                                                 │
│  4. Gitflow Model                                              │
│     └── Structured branches (enterprise)                       │
│                                                                 │
│  5. Trunk-Based Model                                          │
│     └── Short-lived branches (high-performing teams)           │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### When to Use Each Model

| Model | Best For | Team Size | Release Cadence |
|-------|----------|-----------|-----------------|
| Centralized | Small projects, quick fixes | 1-3 | Ad-hoc |
| Feature Branch | Most projects | 3-20 | Regular |
| Forking | Open source, external contributors | Any | Any |
| Gitflow | Versioned software | 5-50 | Scheduled |
| Trunk-Based | High-performing teams | 5-100+ | Continuous |

---

## 2. Forking Workflow

### What is Forking?

Forking creates your own copy of someone else's repository on GitHub/GitLab.

```
Original Repository:      https://github.com/original/repo
Your Fork:                https://github.com/yourusername/repo
Your Local Clone:         /your/computer/repo
```

### Complete Forking Workflow

```bash
# Step 1: Fork on GitHub
# Click "Fork" button on repository page

# Step 2: Clone your fork
git clone https://github.com/yourusername/repo.git
cd repo

# Step 3: Add original repository as "upstream"
git remote add upstream https://github.com/original/repo.git

# Step 4: Verify remotes
git remote -v
# origin    https://github.com/yourusername/repo.git (fetch)
# origin    https://github.com/yourusername/repo.git (push)
# upstream  https://github.com/original/repo.git (fetch)
# upstream  https://github.com/original/repo.git (push)

# Step 5: Create feature branch
git checkout -b feature/my-contribution

# Step 6: Make changes and commit
git add .
git commit -m "feat: add new feature"

# Step 7: Push to your fork
git push origin feature/my-contribution

# Step 8: Create Pull Request on GitHub
# Go to original repository
# Click "New Pull Request"
# Select your fork and branch

# Step 9: Keep your fork updated
git fetch upstream
git checkout main
git merge upstream/main
git push origin main
```

### Keeping Fork Updated

```bash
# Fetch upstream changes
git fetch upstream

# Switch to main
git checkout main

# Merge upstream changes
git merge upstream/main

# Push to your fork
git push origin main

# Or rebase (cleaner history)
git fetch upstream
git checkout main
git rebase upstream/main
git push origin main --force-with-lease
```

### Forking Best Practices

1. **Always sync before starting work**
2. **Create feature branches** (not work on main)
3. **Keep commits focused** and well-described
4. **Respond to review feedback** promptly
5. **Clean up branches** after merge

---

## 3. Branching Workflow

### Feature Branch Workflow

```bash
# Step 1: Ensure you're up to date
git checkout main
git pull origin main

# Step 2: Create feature branch
git checkout -b feature/user-authentication

# Step 3: Work on feature
# ... make changes ...
git add .
git commit -m "feat: add login form"

# ... more changes ...
git add .
git commit -m "feat: add JWT authentication"

# Step 4: Push branch to remote
git push -u origin feature/user-authentication

# Step 5: Create Pull Request on GitHub
# (Do this via web interface)

# Step 6: After review and approval, merge
git checkout main
git pull origin main
git merge feature/user-authentication
git push origin main

# Step 7: Clean up
git branch -d feature/user-authentication
git push origin --delete feature/user-authentication
```

### Branch Naming Conventions

```bash
# Feature branches
feature/user-login
feature/payment-gateway
feature/api-integration

# Bug fix branches
bugfix/login-timeout
bugfix/null-pointer
hotfix/security-vulnerability

# Release branches
release/1.0.0
release/2.1.0

# Documentation branches
docs/api-reference
docs/installation-guide

# Refactor branches
refactor/database-layer
refactor/authentication

# Test branches
test/unit-tests
test/integration-tests
```

### Long-Lived Branches

```bash
# main (or master)
# - Always production-ready
# - Protected branch
# - Requires PR to merge

# develop
# - Integration branch
# - Features merge here first
# - Pre-release testing

# release/*
# - Release preparation
# - Bug fixes only
# - Merges to main and develop

# hotfix/*
# - Emergency production fixes
# - Merges to main and develop
```

---

## 4. Pull Request Mastery

### Anatomy of a Perfect PR

```markdown
## Title
feat: add user authentication with JWT

## Description
Implement JWT-based authentication system for the API.

### Changes Made
- Added `/api/auth/login` endpoint
- Added `/api/auth/register` endpoint
- Added JWT token generation and validation
- Added password hashing with bcrypt
- Added authentication middleware

### Why This Change
Addresses issue #123 - Users need secure authentication
to access protected resources.

### How to Test
1. Register a new user: `POST /api/auth/register`
2. Login: `POST /api/auth/login`
3. Use returned token in Authorization header
4. Access protected route: `GET /api/protected`

### Screenshots
N/A (API changes only)

## Checklist
- [x] Code follows team style guidelines
- [x] Tests added for new endpoints
- [x] Documentation updated
- [x] No breaking changes
- [x] Related issue linked (Closes #123)

## Related Issues
- Closes #123
- Related to #456
```

### PR Title Best Practices

```bash
# Format: <type>(<scope>): <description>

# Good examples
feat(auth): add JWT authentication
fix(api): resolve null pointer in user endpoint
docs(readme): update installation instructions
test(auth): add unit tests for login

# Bad examples
Update code
Fixed bug
WIP
asdfghjkl
```

### PR Size Guidelines

| Size | Lines Changed | Review Time | Recommendation |
|------|---------------|-------------|----------------|
| Small | < 100 | 15-30 min | Ideal |
| Medium | 100-400 | 30-60 min | Acceptable |
| Large | 400-1000 | 1-2 hours | Consider splitting |
| Huge | > 1000 | 2+ hours | Must split |

### PR Workflow Automation

```yaml
# .github/workflows/pr-validation.yml
name: PR Validation

on:
  pull_request:
    types: [opened, synchronize, reopened]

jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Check PR size
        uses: actions/github-script@v7
        with:
          script: |
            const { data: pr } = await github.rest.pulls.get({
              owner: context.repo.owner,
              repo: context.repo.repo,
              pull_number: context.issue.number
            });
            const lines = pr.additions + pr.deletions;
            if (lines > 500) {
              core.warning(`PR is large: ${lines} lines changed`);
            }
      
      - name: Validate PR title
        uses: amannn/action-semantic-pull-request@v5
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

---

## 5. Code Review Excellence

### Reviewer Responsibilities

#### Before Reviewing
1. **Understand the context** - Read the PR description
2. **Check related issues** - Understand the problem
3. **Review the diff** - Focus on changes
4. **Run the code** (if possible) - Test functionality

#### During Review

```markdown
# Review Comment Types

## Critical (Must Fix)
🔴 Security vulnerability
🔴 Bug that will cause issues
🔴 Breaking change without documentation

## Suggestion (Consider)
🟡 Performance improvement
🟡 Code clarity enhancement
🟡 Better approach available

## Nit (Optional)
🟢 Minor style issue
🟢 Naming suggestion
🟢 Formatting preference

## Praise (Positive)
🟢 Great implementation
🟢 Clean code
🟢 Good test coverage
```

### Review Comments Examples

```markdown
# Security Issue
🔴 **Critical:** This SQL query is vulnerable to injection.
Use parameterized queries instead.

# Bug
🔴 **Bug:** This will throw an error when `user` is null.
Add null check before accessing `user.name`.

# Suggestion
🟡 **Suggestion:** Consider using `const` instead of `let` here
since the variable is never reassigned.

# Question
❓ **Question:** Why did you choose this approach over using
the built-in `Array.map()` method?

# Praise
🟢 **Great:** Clean implementation! The error handling is thorough.

# Nit
🟢 **Nit:** Missing semicolon on line 42.
```

### Responding to Reviews

```markdown
# Good Response
Thanks for catching that! I've fixed the null check and
added a test case for it.

# Disagreeing Respectfully
I see your point, but I chose this approach because...
[explanation]. However, I'm happy to discuss further if
you have a better suggestion.

# Asking for Clarification
Could you elaborate on why you prefer approach X?
I want to understand the trade-offs.

# Accepting Feedback
You're right, that's much cleaner. Updated in commit abc1234.
```

### Code Review Checklist

```markdown
## Functionality
- [ ] Code does what it's supposed to do
- [ ] Edge cases are handled
- [ ] Error handling is appropriate
- [ ] No regression of existing features

## Code Quality
- [ ] Code is readable and maintainable
- [ ] No unnecessary complexity
- [ ] Follows team conventions
- [ ] No code duplication
- [ ] Proper naming conventions

## Testing
- [ ] Tests are included
- [ ] Tests are meaningful
- [ ] Edge cases are tested
- [ ] No flaky tests
- [ ] Adequate test coverage

## Security
- [ ] No sensitive data exposed
- [ ] Input validation present
- [ ] Authentication/authorization correct
- [ ] No SQL injection vulnerabilities
- [ ] No XSS vulnerabilities

## Performance
- [ ] No N+1 queries
- [ ] Proper caching used
- [ ] No memory leaks
- [ ] Efficient algorithms

## Documentation
- [ ] Code comments are helpful
- [ ] API documentation updated
- [ ] README updated (if needed)
- [ ] Changelog updated

## Dependencies
- [ ] No unnecessary dependencies
- [ ] Dependencies are up to date
- [ ] No security vulnerabilities in deps
```

---

## 6. Merge Conflict Resolution

### Understanding Conflicts

```text
<<<<<<< HEAD (your changes)
const user = { name: 'John', age: 30 };
=======
const user = { name: 'Jane', age: 25 };
>>>>>>> feature/other-branch (their changes)
```

### Conflict Resolution Strategies

#### Strategy 1: Manual Resolution
```bash
# 1. Identify conflicting files
git status

# 2. Open conflicted file in editor
code filename.js

# 3. Look for conflict markers
<<<<<<< HEAD
your code
=======
their code
>>>>>>> feature/branch

# 4. Choose which to keep (or combine)
# 5. Remove conflict markers
# 6. Save file

# 7. Mark as resolved
git add filename.js

# 8. Continue merge
git merge --continue
# or
git rebase --continue
```

#### Strategy 2: Use Merge Tool
```bash
# Configure merge tool
git config --global merge.tool vscode
git config --global mergetool.vscode.cmd 'code --wait $MERGED'

# Launch merge tool
git mergetool

# After resolving in tool:
git add filename.js
git merge --continue
```

#### Strategy 3: Abort and Communicate
```bash
# If conflict is too complex
git merge --abort

# Or
git rebase --abort

# Then communicate with teammate
# Discuss approach before resolving
```

### Common Conflict Scenarios

#### Scenario 1: Both Modified Same Lines
```bash
# Both branches changed the same function
# Resolution: Choose the correct version or combine

<<<<<<< HEAD
function calculateTotal(items) {
  return items.reduce((sum, item) => sum + item.price, 0);
}
=======
function calculateTotal(items, tax) {
  const subtotal = items.reduce((sum, item) => sum + item.price, 0);
  return subtotal + (subtotal * tax);
}
>>>>>>> feature/tax-calculation
```

**Resolution:**
```javascript
// Keep the improved version (with tax)
function calculateTotal(items, tax = 0) {
  const subtotal = items.reduce((sum, item) => sum + item.price, 0);
  return subtotal + (subtotal * tax);
}
```

#### Scenario 2: One Added, One Modified
```bash
<<<<<<< HEAD
// User added new function
function validateEmail(email) {
  return email.includes('@');
}
=======
// User modified existing function
function validateUser(user) {
  return user.name && user.email;
}
>>>>>>> feature/validation
```

**Resolution:**
```javascript
// Keep both functions
function validateEmail(email) {
  return email.includes('@');
}

function validateUser(user) {
  return user.name && validateEmail(user.email);
}
```

#### Scenario 3: File Renamed vs Modified
```bash
# Git can't auto-resolve
# Use: git checkout --theirs or --ours

# Keep renamed version
git checkout --ours filename.txt

# Keep modified version
git checkout --theirs filename.txt

# Then commit
git add filename.txt
git commit -m "Resolve conflict: keep renamed version"
```

### Preventing Conflicts

1. **Pull before pushing**
2. **Keep branches short-lived**
3. **Communicate large changes**
4. **Use small, focused commits**
5. **Rebase frequently**
6. **Use feature flags**

### Conflict Prevention Tools

```bash
# Configure auto-stash during rebase
git config --global rebase.autoStash true

# Use pull with rebase (cleaner history)
git config --global pull.rebase true

# Set up pre-push hooks
# .git/hooks/pre-push
#!/bin/bash
echo "Pulling latest changes..."
git pull --rebase origin main
```

---

## 7. GitHub Collaboration Features

### Pull Requests

#### Creating PRs
```bash
# Push branch
git push -u origin feature/new-feature

# Create PR via CLI (requires GitHub CLI)
gh pr create --title "feat: add new feature" --body "Description"

# Or create via web interface
```

#### PR Templates

```markdown
<!-- .github/pull_request_template.md -->
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing
- [ ] Unit tests added/updated
- [ ] Integration tests added/updated
- [ ] Manual testing completed

## Checklist
- [ ] Code follows style guidelines
- [ ] Self-review completed
- [ ] Documentation updated
- [ ] No breaking changes (or documented)
```

### Issues

#### Issue Templates

```markdown
<!-- .github/ISSUE_TEMPLATE/bug_report.md -->
---
name: Bug Report
about: Report a bug
title: '[BUG] '
labels: bug
assignees: ''
---

## Describe the bug
A clear description of what the bug is.

## To Reproduce
Steps to reproduce the behavior:
1. Go to '...'
2. Click on '...'
3. See error

## Expected behavior
What you expected to happen.

## Screenshots
If applicable, add screenshots.

## Environment
- OS: [e.g. Windows 10]
- Browser: [e.g. Chrome 90]
- Version: [e.g. 1.0.0]
```

```markdown
<!-- .github/ISSUE_TEMPLATE/feature_request.md -->
---
name: Feature Request
about: Suggest a feature
title: '[FEATURE] '
labels: enhancement
assignees: ''
---

## Is your feature request related to a problem?
A clear description of the problem.

## Describe the solution you'd like
What you want to happen.

## Describe alternatives you've considered
Other solutions you've thought about.

## Additional context
Any other context or screenshots.
```

### GitHub Projects

#### Project Boards
- **To Do** - Backlog of work
- **In Progress** - Currently working
- **In Review** - Awaiting code review
- **Done** - Completed work

#### Project Automation
```yaml
# .github/workflows/project-automation.yml
name: Project Automation

on:
  pull_request:
    types: [opened, closed]

jobs:
  move-to-progress:
    if: github.event.action == 'opened'
    runs-on: ubuntu-latest
    steps:
      - uses: actions/add-to-project@v1
        with:
          project-url: ${{ vars.PROJECT_URL }}
          github-token: ${{ secrets.GITHUB_TOKEN }}

  move-to-done:
    if: github.event.action == 'closed' && github.event.pull_request.merged == true
    runs-on: ubuntu-latest
    steps:
      - uses: actions/add-to-project@v1
        with:
          project-url: ${{ vars.PROJECT_URL }}
          github-token: ${{ secrets.GITHUB_TOKEN }}
```

### GitHub Discussions

```markdown
# When to Use Discussions vs Issues

## Use Discussions For:
- Questions about usage
- Ideas and feature requests
- General announcements
- Show and tell

## Use Issues For:
- Bug reports
- Task tracking
- Feature implementation
- Documentation improvements
```

### GitHub Actions for Collaboration

```yaml
# .github/workflows/auto-assign.yml
name: Auto Assign

on:
  pull_request:
    types: [opened]

jobs:
  assign:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/github-script@v7
        with:
          script: |
            const pr = context.payload.pull_request;
            await github.rest.issues.addAssignees({
              owner: context.repo.owner,
              repo: context.repo.repo,
              issue_number: pr.number,
              assignees: [pr.user.login]
            });
```

---

## 8. GitLab Collaboration Features

### Merge Requests

```bash
# Create merge request via CLI
glab mr create --title "feat: add new feature" --description "Description"

# Or via web interface
```

### Merge Request Templates

```markdown
<!-- .gitlab/merge_request_templates/Default.md -->
## Description
Brief description of changes

## Related Issues
Closes #123

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation

## Testing
- [ ] Tests added/updated
- [ ] Manual testing completed

## Checklist
- [ ] Code follows style guidelines
- [ ] Documentation updated
- [ ] No breaking changes (or documented)
```

### GitLab Issues

```markdown
<!-- .gitlab/issue_templates/Bug.md -->
## Bug Report

### Describe the bug
A clear description of what the bug is.

### Steps to reproduce
1. Go to '...'
2. Click on '...'
3. See error

### Expected behavior
What you expected to happen.

### Screenshots
If applicable, add screenshots.

### Environment
- GitLab version:
- Browser:
- OS:
```

### GitLab CI/CD Integration

```yaml
# .gitlab-ci.yml
stages:
  - test
  - build
  - deploy

test:
  stage: test
  script:
    - npm ci
    - npm test
  only:
    - merge_requests

build:
  stage: build
  script:
    - npm run build
  only:
    - main

deploy:
  stage: deploy
  script:
    - ./deploy.sh
  only:
    - main
  when: manual
```

### GitLab Code Review

```markdown
# Code Review Features

## Approvals
- Required reviewers
- Approval rules
- Code owners

## Discussions
- Inline comments
- Resolvable threads
- Suggestions

## Pipelines
- CI/CD status
- Test results
- Coverage reports
```

---

## 9. Open Source Contribution

### Finding Projects to Contribute

```bash
# Search for "good first issue" label
# GitHub: is:issue is:open label:"good first issue"

# Popular platforms:
# - GitHub (github.com)
# - GitLab (gitlab.com)
# - Bitbucket (bitbucket.org)

# Find projects you use
# Check their CONTRIBUTING.md
# Look for "help wanted" labels
```

### Contribution Workflow

```bash
# Step 1: Find a project
# Step 2: Read CONTRIBUTING.md
# Step 3: Fork the repository
# Step 4: Clone your fork
git clone https://github.com/yourusername/project.git

# Step 5: Set up development environment
cd project
npm install  # or appropriate command

# Step 6: Create issue (if needed)
# Discuss your planned contribution

# Step 7: Create feature branch
git checkout -b feature/my-contribution

# Step 8: Make changes
# ... code ...

# Step 9: Write tests
# ... tests ...

# Step 10: Commit with conventional commits
git add .
git commit -m "feat: add new feature"

# Step 11: Push to your fork
git push origin feature/my-contribution

# Step 12: Create Pull Request
# - Follow project's PR template
# - Reference related issues
# - Explain your changes

# Step 13: Respond to feedback
# - Address review comments
# - Make requested changes
# - Update PR as needed

# Step 14: Celebrate! 🎉
```

### CONTRIBUTING.md Template

```markdown
# Contributing to Project Name

Thank you for your interest in contributing!

## Getting Started

1. Fork the repository
2. Clone your fork
3. Create a feature branch
4. Make your changes
5. Submit a pull request

## Development Setup

```bash
# Clone
git clone https://github.com/yourusername/project.git
cd project

# Install dependencies
npm install

# Run tests
npm test

# Start development server
npm run dev
```

## Code Style

- Follow existing conventions
- Use meaningful variable names
- Add comments for complex logic
- Keep functions small and focused

## Commit Messages

Follow Conventional Commits:
- `feat:` for new features
- `fix:` for bug fixes
- `docs:` for documentation
- `test:` for tests
- `chore:` for maintenance

## Pull Request Process

1. Update documentation if needed
2. Add tests for new features
3. Ensure all tests pass
4. Request review from maintainers
5. Address feedback promptly

## Reporting Bugs

Use the GitHub Issues template:
- Clear description
- Steps to reproduce
- Expected vs actual behavior
- Environment details

## Requesting Features

Open an issue with:
- Problem description
- Proposed solution
- Alternatives considered

## Code of Conduct

Be respectful and inclusive. See CODE_OF_CONDUCT.md.

## Questions?

Open a GitHub Discussion or reach out to maintainers.
```

### Common Contribution Types

```markdown
# Types of Contributions

## Code Contributions
- Bug fixes
- New features
- Performance improvements
- Refactoring

## Documentation
- README improvements
- API documentation
- Tutorials
- Examples

## Testing
- Add missing tests
- Improve test coverage
- Fix flaky tests

## Design
- UI/UX improvements
- Accessibility
- Responsive design

## Community
- Answer questions
- Review PRs
- Triage issues
- Mentor new contributors
```

---

## 10. Team Communication Patterns

### Communication Channels

```
┌─────────────────────────────────────────────────────────────┐
│                 TEAM COMMUNICATION                           │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Synchronous (Real-time)                                    │
│  ├── Slack/Microsoft Teams (chat)                          │
│  ├── Zoom/Google Meet (video calls)                        │
│  └── Pair programming sessions                             │
│                                                             │
│  Asynchronous (Delayed)                                    │
│  ├── GitHub/GitLab Issues & PRs                            │
│  ├── Email                                                  │
│  ├── Documentation (Notion, Confluence)                    │
│  └── Code comments                                          │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### When to Use Each Channel

| Channel | Use For | Response Time |
|---------|---------|---------------|
| Slack/Teams | Quick questions, updates | Minutes |
| GitHub Issues | Bug reports, feature requests | Hours-Days |
| GitHub PRs | Code review, discussions | Hours-Days |
| Email | Formal communication, external | Hours-Days |
| Documentation | Guides, procedures, decisions | Always available |
| Video Calls | Complex discussions, planning | Scheduled |

### Communication Templates

#### Quick Question (Slack/Teams)
```markdown
Hey team, quick question about [topic]:
[Your question]

Context: [Brief context]
```

#### Blocker Alert (Slack/Teams)
```markdown
🚨 Blocker Alert

Issue: [What's blocked]
Impact: [What's affected]
Need: [What you need to unblock]

Anyone available to help?
```

#### PR Review Request (Slack/Teams)
```markdown
PR Review Requested

PR: [Link to PR]
Description: [Brief description]
Focus areas: [What to look for]

CC: @team-lead @senior-dev
```

#### End of Day Update (Slack/Teams)
```markdown
📝 EOD Update

Completed:
- [Task 1]
- [Task 2]

In Progress:
- [Task 3] (80% done)

Blockers:
- [Any blockers]

Tomorrow:
- [Planned work]
```

### Meeting Patterns

#### Daily Standup
```markdown
## Daily Standup

### Yesterday
- [What you completed]

### Today
- [What you're working on]

### Blockers
- [Any blockers]
```

#### Sprint Planning
```markdown
## Sprint Planning

### Goals
- [Sprint goal]

### Stories/Tasks
- [ ] Story 1
- [ ] Story 2
- [ ] Story 3

### Assignments
- Dev 1: Stories 1, 2
- Dev 2: Story 3

### Capacity
- Available days: X
- Holiday/vacation: Y
```

#### Retrospective
```markdown
## Sprint Retrospective

### What went well?
- [Positive thing 1]
- [Positive thing 2]

### What could be improved?
- [Improvement 1]
- [Improvement 2]

### Action items
- [Action 1] - Owner: @person
- [Action 2] - Owner: @person
```

---

## 11. Cross-Team Collaboration

### Multi-Team Repository Structure

```
monorepo/
├── packages/
│   ├── frontend/
│   ├── backend/
│   ├── shared/
│   └── docs/
├── .github/
│   ├── CODEOWNERS
│   └── workflows/
├── package.json
└── README.md
```

### CODEOWNERS File

```markdown
# .github/CODEOWNERS

# Default owners
* @team-lead

# Frontend
/packages/frontend/ @frontend-team

# Backend
/packages/backend/ @backend-team

# Shared libraries
/packages/shared/ @platform-team

# Documentation
/docs/ @tech-writers

# CI/CD
/.github/ @devops-team
```

### Cross-Team PR Review

```yaml
# .github/workflows/cross-team-review.yml
name: Cross-Team Review

on:
  pull_request:
    types: [opened, ready_for_review]

jobs:
  request-reviews:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/github-script@v7
        with:
          script: |
            const files = await github.rest.pulls.listFiles({
              owner: context.repo.owner,
              repo: context.repo.repo,
              pull_number: context.issue.number
            });
            
            const reviewers = new Set();
            
            for (const file of files.data) {
              if (file.filename.startsWith('packages/frontend/')) {
                reviewers.add('frontend-team-lead');
              }
              if (file.filename.startsWith('packages/backend/')) {
                reviewers.add('backend-team-lead');
              }
            }
            
            if (reviewers.size > 0) {
              await github.rest.pulls.requestReviewers({
                owner: context.repo.owner,
                repo: context.repo.repo,
                pull_number: context.issue.number,
                reviewers: Array.from(reviewers)
              });
            }
```

### Shared Libraries

```bash
# Using git submodules for shared code
git submodule add https://github.com/org/shared-lib.git packages/shared

# Or using npm/yarn workspaces
# package.json
{
  "workspaces": [
    "packages/*"
  ]
}
```

### Cross-Team Communication

```markdown
# Cross-Team Meeting Agenda

## Teams Present
- Frontend
- Backend
- DevOps

## Topics
1. API contract updates
2. Shared library changes
3. Deployment coordination

## Decisions Needed
- API versioning strategy
- Shared component library approach

## Action Items
- [ ] Frontend: Update API client
- [ ] Backend: Document new endpoints
- [ ] DevOps: Update CI/CD pipeline
```

---

## 12. Issue Tracking & Project Management

### GitHub Issues Best Practices

#### Issue Title Format
```bash
# Good
[BUG] Login fails with 500 error
[FEATURE] Add dark mode toggle
[DOCS] Update API documentation
[TASK] Refactor authentication module

# Bad
Bug
Help needed
Fix this
```

#### Issue Description Template
```markdown
## Description
Clear description of the issue

## Steps to Reproduce
1. Go to '...'
2. Click on '...'
3. See error

## Expected Behavior
What should happen

## Actual Behavior
What actually happens

## Screenshots
If applicable

## Environment
- OS: [e.g. Windows 10]
- Browser: [e.g. Chrome 90]
- Version: [e.g. 1.0.0]

## Additional Context
Any other information
```

### Labels

```markdown
# Common Labels

## Type
- bug - Something isn't working
- feature - New feature request
- documentation - Documentation improvement
- enhancement - Improvement to existing feature

## Priority
- priority: critical - Must fix immediately
- priority: high - Should fix soon
- priority: medium - Normal priority
- priority: low - Nice to have

## Status
- status: needs-triage - Needs initial review
- status: confirmed - Bug confirmed
- status: in-progress - Currently working
- status: blocked - Waiting on something
- status: needs-review - Needs code review

## Component
- component: frontend
- component: backend
- component: api
- component: database
```

### Milestones

```markdown
# Release Planning

## v1.0.0 (Target: 2024-03-01)
- [ ] Feature A
- [ ] Feature B
- [ ] Bug Fix C

## v1.1.0 (Target: 2024-04-01)
- [ ] Feature D
- [ ] Enhancement E
```

### GitHub Projects (Kanban)

```markdown
# Project Board Structure

## Columns
- **Backlog** - Future work
- **To Do** - Sprint planning
- **In Progress** - Currently working
- **In Review** - Awaiting review
- **Done** - Completed

## Automation
- Move to "In Progress" when PR opened
- Move to "In Review" when PR ready for review
- Move to "Done" when PR merged
```

### Time Tracking

```markdown
# Estimate and Track Time

## Using Issue Templates
Estimate: [1-2 days]
Actual: [1.5 days]

## Using GitHub Actions
- Add time tracking label
- Update on completion
- Generate reports
```

---

## 13. Documentation & Wikis

### README.md Structure

```markdown
# Project Name

Brief description of the project

## Features
- Feature 1
- Feature 2
- Feature 3

## Installation

```bash
# Clone repository
git clone https://github.com/user/project.git

# Install dependencies
npm install

# Start development server
npm run dev
```

## Usage

```javascript
// Example usage
import { myFunction } from 'project';

const result = myFunction();
```

## API Reference

### myFunction(param1, param2)
Description of function

**Parameters:**
- `param1` (string): Description
- `param2` (number): Description

**Returns:**
- (boolean): Description

**Example:**
```javascript
const result = myFunction('hello', 42);
```

## Contributing

See CONTRIBUTING.md

## License

MIT License - see LICENSE.md
```

### Documentation Types

```markdown
# Documentation Types

## User Documentation
- Getting started guide
- Tutorials
- How-to guides
- API reference

## Developer Documentation
- Architecture overview
- Contributing guidelines
- Code style guide
- Development setup

## Operational Documentation
- Deployment guide
- Monitoring setup
- Troubleshooting guide
- Incident response

## Design Documentation
- System design documents
- API contracts
- Database schemas
- UI/UX specifications
```

### GitHub Wiki

```markdown
# Wiki Structure

## Home
- Project overview
- Quick start

## Getting Started
- Installation
- Configuration
- First steps

## Guides
- User guide
- Developer guide
- Deployment guide

## API Reference
- Endpoints
- Models
- Authentication

## FAQ
- Common questions
- Troubleshooting

## Changelog
- Version history
- Breaking changes
```

### Documentation as Code

```yaml
# .github/workflows/docs.yml
name: Documentation

on:
  push:
    branches: [main]
    paths:
      - 'docs/**'

jobs:
  deploy-docs:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Build docs
        run: npm run build:docs
      
      - name: Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./docs
```

---

## 14. Practice Exercises

### Exercise 1: Forking Workflow

1. Fork a popular open-source repository
2. Clone your fork
3. Add upstream remote
4. Create a documentation improvement
5. Submit a Pull Request
6. Sync your fork with upstream

### Exercise 2: Code Review

1. Find 3 open Pull Requests
2. Review each one thoroughly
3. Leave constructive comments
4. Use suggestion feature
5. Approve or request changes

### Exercise 3: Conflict Resolution

1. Create two branches
2. Make conflicting changes
3. Merge (will conflict)
4. Resolve using different strategies
5. Document your approach

### Exercise 4: Team Workflow

1. Simulate a team repository
2. Create feature branches
3. Submit PRs
4. Review each other's PRs
5. Merge and clean up

### Exercise 5: Open Source Contribution

1. Find a project with "good first issue"
2. Read CONTRIBUTING.md
3. Set up development environment
4. Implement the fix/feature
5. Submit a Pull Request

### Exercise 6: Documentation

1. Create comprehensive README.md
2. Add issue templates
3. Add PR template
4. Set up CODEOWNERS
5. Create basic wiki structure

### Exercise 7: Project Management

1. Create a GitHub Project board
2. Add issues with labels
3. Set up automation
4. Track progress through columns
5. Generate velocity report

---

## 📝 Cheat Sheet: Collaboration Commands

### Forking
```bash
git clone <your-fork-url>
git remote add upstream <original-url>
git fetch upstream
git merge upstream/main
git push origin main
```

### Pull Requests
```bash
gh pr create --title "feat: ..." --body "..."
gh pr list
gh pr checkout <pr-number>
gh pr merge <pr-number>
gh pr close <pr-number>
```

### Issues
```bash
gh issue create --title "bug: ..." --body "..."
gh issue list
gh issue view <issue-number>
gh issue close <issue-number>
```

### Code Review
```bash
gh pr checkout <pr-number>
# Make changes
git add .
git commit -m "fix: address review comments"
git push origin <branch>
```

### Collaboration
```bash
git remote -v                    # List remotes
git fetch --all                  # Fetch all remotes
git pull --rebase                # Pull with rebase
git push -u origin <branch>      # Push and set upstream
```

---

## 🎯 Next Steps

You've completed the Git Collaboration Deep Dive!

### Apply What You've Learned

1. **Contribute to open source** - Find a project and contribute
2. **Review PRs** - Practice code review
3. **Set up team workflows** - Implement in your team
4. **Improve documentation** - Update project docs
5. **Use project management** - Set up boards and issues

### Additional Resources

- **GitHub Collaboration Guide:** https://docs.github.com/en/pull-requests
- **GitLab Collaboration:** https://docs.gitlab.com/ee/user/project/
- **Open Source Guides:** https://opensource.guide
- **Code Review Best Practices:** Google's Engineering Practices

---

*Based on: GitHub Documentation, GitLab Documentation, Open Source Guides, Atlassian Collaboration Tutorials*
