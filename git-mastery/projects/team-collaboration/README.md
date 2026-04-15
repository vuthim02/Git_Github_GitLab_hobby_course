# Team Collaboration Project

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                  TEAM COLLABORATION PROJECT                                 ║
║              Practice Real-World Team Git Workflows                         ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

## Project Overview

This project simulates a real team environment where you'll practice collaborative Git workflows, code reviews, and team communication.

---

## Team Roles

### Simulated Team Structure

| Role | Responsibility |
|------|----------------|
| **Team Lead** | Reviews PRs, manages releases |
| **Developer 1** | Feature development |
| **Developer 2** | Feature development |
| **QA** | Testing, bug reports |

*Note: You can simulate all roles or work with friends!*

---

## Project Scenario

### The Application

You're building a **Task Management API** with the following features:

```
Task Management API
├── Users (CRUD)
├── Tasks (CRUD)
├── Projects (group tasks)
└── Comments (on tasks)
```

### Project Structure

```
task-api/
├── src/
│   ├── users/
│   ├── tasks/
│   └── comments/
├── tests/
├── .github/
│   ├── workflows/
│   └── PULL_REQUEST_TEMPLATE.md
├── .gitignore
├── README.md
└── package.json
```

---

## Workflow Simulation

### Week 1: Project Setup

**Day 1-2: Repository Setup**
- [ ] Team lead creates organization
- [ ] Create repository
- [ ] Set up branching strategy
- [ ] Add team members as collaborators

**Day 3-4: Project Initialization**
- [ ] Create base project structure
- [ ] Add CI/CD pipeline
- [ ] Set up linting and tests
- [ ] Create development branch

**Day 5: Documentation**
- [ ] Write README
- [ ] Create contribution guidelines
- [ ] Add issue/PR templates

---

### Week 2: Feature Development

**Developer 1 Tasks:**
- [ ] Create user registration feature
- [ ] Create branch: `feature/user-registration`
- [ ] Implement feature
- [ ] Write tests
- [ ] Open PR for review
- [ ] Address review feedback
- [ ] Merge PR

**Developer 2 Tasks:**
- [ ] Create task CRUD feature
- [ ] Create branch: `feature/task-crud`
- [ ] Implement feature
- [ ] Write tests
- [ ] Open PR for review
- [ ] Address review feedback
- [ ] Merge PR

---

### Week 3: Integration & Bug Fixes

**Integration:**
- [ ] Merge features in development
- [ ] Run integration tests
- [ ] Fix any conflicts

**Bug Fixes:**
- [ ] QA reports bugs
- [ ] Create bugfix branches
- [ ] Fix and merge
- [ ] Hotfix for critical bug (practice emergency flow)

---

### Week 4: Release

**Release Preparation:**
- [ ] Create release branch: `release/v1.0.0`
- [ ] Final testing
- [ ] Create release on GitHub
- [ ] Tag version
- [ ] Deploy to staging
- [ ] Deploy to production

---

## Git Commands Practiced

### Setup
```bash
# Clone repo
git clone https://github.com/org/task-api.git

# Add upstream (for forks)
git remote add upstream https://github.com/original/repo.git

# Sync with upstream
git fetch upstream
git checkout develop
git merge upstream/develop
```

### Feature Development
```bash
# Create feature branch
git checkout -b feature/user-auth

# Make changes
git add .
git commit -m "feat(auth): add user registration"

# Push to origin
git push -u origin feature/user-auth
```

### Code Review
```bash
# Fetch latest changes
git fetch origin

# View branches
git branch -a

# Compare branches
git diff main..feature/my-feature
```

### Merge Workflow
```bash
# Update develop
git checkout develop
git pull origin develop

# Merge feature
git merge feature/my-feature

# Delete merged branch
git branch -d feature/my-feature
git push origin --delete feature/my-feature
```

---

## Branching Strategy

```
main (production)
  └── develop (integration)
        ├── feature/user-auth
        ├── feature/task-crud
        ├── bugfix/login-fix
        └── release/v1.0.0
```

---

## Pull Request Checklist

For each PR, ensure:

- [ ] Descriptive title
- [ ] Linked issue
- [ ] Description of changes
- [ ] Tests added/updated
- [ ] Documentation updated
- [ ] CI/CD passes
- [ ] At least 1 review approval
- [ ] No merge conflicts

---

## Code Review Checklist

When reviewing:

### Functionality
- [ ] Code does what it claims
- [ ] Edge cases handled
- [ ] Error handling present

### Quality
- [ ] Code is readable
- [ ] Tests are adequate
- [ ] No security issues

### Style
- [ ] Follows project conventions
- [ ] No commented-out code
- [ ] No console.log/debug code

---

## Commit Message Format

Follow conventional commits:

```
<type>(<scope>): <description>

Types:
- feat: New feature
- fix: Bug fix
- docs: Documentation
- style: Formatting
- refactor: Code refactoring
- test: Adding tests
- chore: Maintenance
```

Examples:
```bash
git commit -m "feat(auth): add user registration"
git commit -m "fix(api): handle null response"
git commit -m "docs(readme): update installation"
```

---

## Communication Templates

### Opening an Issue
```markdown
## Bug Description
[Clear description]

## Steps to Reproduce
1. Go to...
2. Click on...
3. See error

## Expected Behavior
[What should happen]

## Screenshots
[If applicable]
```

### PR Description
```markdown
## Summary
[Brief description]

## Changes
- [List of changes]

## Testing
- [ ] Tests pass
- [ ] Manual testing complete

## Related Issues
Closes #[issue-number]
```

---

## Project Evaluation

| Criteria | Points |
|----------|--------|
| Following workflow | 20 |
| Quality of commits | 20 |
| Code review participation | 20 |
| Documentation | 20 |
| Team communication | 20 |

**Total: 100 points**

---

## Resources

- [GitHub Flow](https://docs.github.com/en/get-started/quickstart/github-flow)
- [Git Flow](https://nvie.com/posts/a-successful-git-branching-model/)
- [Conventional Commits](https://www.conventionalcommits.org/)

---

**Previous**: [Portfolio Repository](./portfolio-repo/)  
**Next**: [Daily Challenges](../practice/daily-challenges/)
