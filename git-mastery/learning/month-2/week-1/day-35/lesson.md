# Day 35: Week 5 Review - GitHub Professional

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          GIT MASTERY - DAY 35                              ║
║                      WEEK 5 REVIEW - GITHUB PROFESSIONAL                   ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

## Week 5 Summary

This week we went from **basic Git user** to **GitHub professional**. Let's review everything.

---

## Day 29: GitHub Repositories

### Key Concepts

- GitHub is cloud-based Git hosting
- Public vs Private repositories
- Creating repos via CLI, web, or GitHub CLI
- Understanding remotes: origin vs upstream

### Commands

```bash
gh auth login
gh repo create name --public
gh repo clone user/repo
git remote add origin URL
git push -u origin main
```

---

## Day 30: Pull Requests

### Key Concepts

- PR is request to merge code
- Title, description, review
- Draft vs ready PRs
- Review process
- Merge strategies: merge, squash, rebase

### Commands

```bash
gh pr create
gh pr list
gh pr view NUM
gh pr review NUM --approve
gh pr merge NUM
```

---

## Day 31: Code Reviews

### Key Concepts

- Review is critical to quality
- Provide constructive feedback
- Use inline comments
- Approve or request changes
- Review best practices

### Commands

```bash
gh pr checkout NUM
gh pr review NUM --approve --body "Comments"
gh pr review NUM --request-changes --body "Fix needed"
```

---

## Day 32: Issues & Projects

### Key Concepts

- Issues track work items
- Issue templates standardize input
- GitHub Projects are Kanban boards
- Labels categorize issues
- Milestones group releases

### Commands

```bash
gh issue create
gh issue list
gh issue view NUM
gh issue edit NUM --label "bug"
# Projects: via web UI
```

---

## Day 33: GitHub Actions

### Key Concepts

- CI = Continuous Integration
- CD = Continuous Delivery/Deployment
- Workflows defined in YAML
- Jobs, steps, actions
- Matrix for multi-version testing

### Workflow Structure

```yaml
name: CI Pipeline

on: [push, pull_request]

jobs:
  build:
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

## Day 34: Protected Branches

### Key Concepts

- Protected branches prevent direct push
- All changes via PR
- Required reviews enforce quality
- Status checks ensure tests pass
- CODEOWNERS automates review requests

### Workflow

```
1. Create branch from main
2. Make changes
3. Push branch
4. Create PR
5. Get review(s)
6. Pass status checks
7. Merge PR
8. Delete branch
```

---

## Practice: GitHub Professional Workflow

### Complete Project Setup

```bash
# 1. Create new repository
gh repo create my-project --public --clone
cd my-project

# 2. Initialize with structure
mkdir -p .github/ISSUE_TEMPLATE .github/workflows

# 3. Create issue template
cat > .github/ISSUE_TEMPLATE/bug_report.md << 'EOF'
---
name: Bug
about: Report a bug
labels: bug
---

## Bug Description

## Steps to Reproduce

## Expected

## Actual
EOF

# 4. Create CI workflow
cat > .github/workflows/ci.yml << 'EOF'
name: CI

on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    - uses: actions/setup-node@v4
      with:
        node-version: '20'
    - run: npm ci
    - run: npm test
EOF

# 5. Create CODEOWNERS
cat > .github/CODEOWNERS << 'EOF'
* @yourusername
EOF

# 6. Commit and push
git add .
git commit -m "Initial project setup"
git push -u origin main

# 7. Enable branch protection (via web)
# Settings → Branches → Add rule for main
```

### Feature Development Workflow

```bash
# 1. Update main
git checkout main && git pull

# 2. Create branch
git checkout -b feature/new-feature

# 3. Make changes
echo "// New feature" > feature.js
git add . && git commit -m "Add new feature"

# 4. Push branch
git push -u origin feature/new-feature

# 5. Create PR
gh pr create --title "New feature" --body "Description"

# 6. Reviews happen
# 7. Tests run automatically
# 8. Merge
gh pr merge --squash

# 9. Cleanup
git checkout main && git pull
git branch -d feature/new-feature
```

---

## Quiz: Test Your Knowledge

### Question 1
What command creates a GitHub repository?
1. `git create repo`
2. `gh repo create`
3. `git remote add origin`
4. `git init`

### Question 2
What is required to merge with protection enabled?
1. Push access
2. Pull request + review + passing checks
3. Force push
4. Admin access

### Question 3
Where is CODEOWNERS file located?
1. Root directory
2. .github/CODEOWNERS
3. docs/CODEOWNERS
4. None of the above

### Question 4
What does CI stand for?
1. Code Integration
2. Continuous Integration
3. Central Integration
4. Complete Integration

### Question 5
What triggers GitHub Actions?
1. Only push
2. Only pull request
3. Push, pull request, schedule, manual
4. Manual only

---

## Real-World Application

### Professional Settings

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                 GITHUB PROFESSIONAL WORKFLOW                                │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                 │
│   ┌─────────────────┐                                                │
│   │  Repository    │                                                │
│   │  (GitHub)      │                                                │
│   └────────┬──────┘                                                │
│            │                                                          │
│   ┌────────┴────────┐                                                │
│   │ Issues/Projects │ ← Task tracking                               │
│   └────────┬───────┘                                                │
│            │                                                          │
│   ┌────────┴────────┐                                                │
│   │  Branches      │ ← Work on feature branches                     │
│   └────────┬───────┘                                                │
│            │                                                          │
│   ┌────────┴────────┐                                                │
│   │  Pull Request │ ← Code review process                         │
│   └────────┬───────┘                                                │
│            │                                                          │
│   ┌────────┴────────┐                                                │
│   │ Actions CI   │ ← Automated testing                            │
│   └────────┬───────┘                                                │
│            │                                                          │
│   ┌────────┴────────┐                                                │
│   │ Protected     │ ← Quality enforcement                       │
│   │ Main         │                                                │
│            │                                                          │
│            ▼                                                          │
│        DEPLOYED                                                     │
│                                                                 │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## Checklist: Week 5 Mastery

- [ ] Can create GitHub repositories
- [ ] Can clone and push to GitHub
- [ ] Can manage remotes
- [ ] Can create and merge PRs
- [ ] Can review PRs
- [ ] Can create and manage issues
- [ ] Can use project boards
- [ ] Can create GitHub Actions workflows
- [ ] Can configure branch protection
- [ ] Can create CODEOWNERS file

---

## What's Next (Week 6)

**GitLab Introduction:**
- GitLab overview
- Merge requests
- CI/CD pipelines
- Variables and secrets
- Deployment strategies

---

## Reading References

### GitHub Docs
- [Pull Requests](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests)
- [Code Reviews](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/reviewing-changes-in-pull-requests/about-pull-request-reviews)

### Git SCM Documentation
- [Pro Git Book](https://git-scm.com/book/en/v2)

## Navigation

← [Day 34: Protected Branches](../day-34/lesson.md) | [Dashboard](../../dashboard.md) | [Day 36: GitLab Overview](../week-2/day-36/lesson.md) →

---

**Estimated Time**: 2 hours (review session)  
**Your Progress**: Day 35 of 56 (Week 5 Complete)  
**Next**: Week 6 - GitLab