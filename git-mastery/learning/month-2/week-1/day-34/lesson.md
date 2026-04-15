# Day 34: Protected Branches

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          GIT MASTERY - DAY 34                         ║
║                         PROTECTED BRANCHES                             ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

## Today's Objectives

- [ ] Understand branch protection
- [ ] Configure branch protection rules
- [ ] Require pull request reviews
- [ ] Require status checks
- [ ] Use CODEOWNERS
- [ ] Implement quality gates

---

## Video Reference

**Video**: [Git & GitHub Tutorial](https://youtu.be/RGOj5yH7evk)  
**Section**: Branch Protection  
**Timestamps**: 60:00 - 90:00

---

## Theory: Branch Protection

### What is Branch Protection?

Branch protection is a set of **rules** that prevent direct pushes to certain branches. Instead, changes must go through pull requests.

```
┌─────────────────────────────────────────────────────────────────────────────┐
│               PROTECTED vs UNPROTECTED BRANCH                         │
├─────────────────────────────────────────────────────────────────────┤
│                                                                 │
│   UNPROTECTED (main):                                           │
│   git push origin main          # Works directly!                  │
│                                                                 │
│   PROTECTED (main):                                             │
│   git push origin main      # REJECTED!                        │
│   → Must create PR     → Must get reviews    → Must pass tests  │
│                                                                 │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Why Use Branch Protection?

1. **Prevent accidental pushes** - No direct commits to main
2. **Require reviews** - Code must be reviewed
3. **Enforce tests** - All tests must pass
4. **Maintain quality** - Standards enforced
5. **Audit trail** - Every change tracked

### Default Branch vs Protected Branch

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                      DEFAULT BRANCH OPTIONS                                │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                 │
│   DEFAULT BRANCH:                                                 │
│   ├─ Created when repo is created                                │
│   ├─ Usually "main" or "master"                            │
│   ├─ Can rename in settings                                  │
│   └─ NOT automatically protected                            │
│                                                                 │
│   PROTECTED BRANCH:                                              │
│   ├─ Rules enforced on branch                                │
│   ├─ Cannot force push                                      │
│   ├─ Cannot delete branch                                   │
│   ├─ Requires PR for all changes                            │
│   └─ Can require status checks                             │
│                                                                 │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## Configuring Branch Protection

### Step 1: Access Settings

```
1. Go to repository on GitHub
2. Click "Settings"
3. Click "Branches" in left sidebar
4. Click "Add branch protection rule"
5. Enter branch name pattern (e.g., "main")
6. Configure protection settings
```

### Step 2: Basic Protection Settings

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                 BRANCH PROTECTION SETTINGS                               │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                 │
│   ✓ Require pull request reviews                                  │
│     ├─ Required approving reviews: 1-6                            │
│     ├─ Dismiss stale reviews                                      │
│     └─ Require code owner reviews                                │
│                                                                 │
│   ✓ Require status checks to pass                                  │
│     ├─ Select required checks                                   │
│     └─ Require up-to-date branches                            │
│                                                                 │
│   ✓ Require conversation resolution                              │
│   ✓ Require signed commits                                    │
│   ✓ Require linear history                                   │
│                                                                 │
│   ✓ Include administrators                                   │
│     └─ Admins must also follow rules                         │
│                                                                 │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## Require Pull Request Reviews

### Why Reviews Matter

Reviews ensure:
- Multiple eyes on code
- Knowledge sharing
- Bug catching
- Style consistency

### Configure Reviews

```
Settings → Branches → Add rule

Branch name pattern: main

Required reviews:
✓ Require pull request reviews before merging
  - Required approving reviews: 1 (or more)
  - ✓ Dismiss stale reviews when new commits pushed
  - ✓ Require code owner reviews (optional)
```

### Review Requirements

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                 REVIEW REQUIREMENTS OPTIONS                               │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                 │
│   1 APPROVAL:                                                       │
│   └─ Any team member can approve                                   │
│                                                                 │
│   2 APPROVALS:                                                     │
│   └─ Two different reviewers needed                                 │
│                                                                 │
│   CODE OWNER REVIEW:                                                │
│   └─ Must have code owner approval for files they own                 │
│                                                                 │
│   REVIEW DISMISSAL:                                                 │
│   └─ New commits dismiss old approval                             │
│                                                                 │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## Require Status Checks

### What are Status Checks?

Status checks are **CI/CD workflows** that run on PRs. They must pass before merging.

### Enable Status Checks

```
Settings → Branches → Add rule

Branch name pattern: main

✓ Require status checks to pass before merging
  - Select required checks:
    ✓ CI Pipeline (GitHub Actions)
    ✓ Required checks might include:
      - Code linting
      - Unit tests
      - Integration tests
      - Security scans
```

### Types of Status Checks

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                 STATUS CHECK TYPES                                       │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                 │
│   REQUIRED:                                                          │
│   ├─ Must pass to merge                                              │
│   └─ Can be required by admins                                      │
│                                                                 │
│   OPTIONAL:                                                         │
│   ├─ Nice to have                                                  │
│   └─ Can ignore to merge                                           │
│                                                                 │
│   STRICT:                                                          │
│   ├─ Branch must be up-to-date with base                            │
│                                                                 │
│   LOOSE:                                                           │
│   ├─ Can merge with outdated branch                                 │
│                                                                 │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## CODEOWNERS File

### What is CODEOWNERS?

CODEOWNERS defines **who owns** files/directories in your repository. Those people become required reviewers.

### Create CODEOWNERS File

```bash
mkdir -p .github
cat > .github/CODEOWNERS << 'EOF'
# Team leads
* @team-lead

# Frontend code
/src/frontend/ @frontend-team
/src/ui/ @frontend-team

# Backend code
/src/backend/ @backend-team
/src/api/ @backend-team

# DevOps
/.github/workflows/ @devops-team
/infrastructure/ @devops-team

# Documentation
/docs/ @docs-team
*.md @docs-team
EOF
```

### CODEOWNERS Syntax

```
# Comment - starts with #
* @username              # All files
folder/ @username        # Specific folder
*.js @username         # Extension
folder/*.js @username  # Folder + extension
@org/team             # Team reference
```

### CODEOWNERS Example

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                 CODEOWNERS WORKFLOW                                    │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                 │
│   FILE: src/frontend/App.js                                         │
│   OWNER: @frontend-team                                         │
│   ACTION: PR created touching this file                           │
│   REQUIRED REVIEWER: @frontend-team                             │
│                                                                 │
│   FILE: src/backend/api.go                                        │
│   OWNER: @backend-team                                        │
│   ACTION: PR created touching backend                          │
│   REQUIRED REVIEWER: @backend-team                              │
│                                                                 │
│   FILE: .github/workflows/ci.yml                                │
│   OWNER: @devops-team                                         │
│   ACTION: PR touches workflows                                │
│   REQUIRED REVIEWER: @devops-team                              │
│                                                                 │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## Quality Gates

### What are Quality Gates?

Quality gates are **enforced standards** that must pass before merging.

### Quality Gate Checklist

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                 QUALITY GATE CHECKLIST                                 │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                 │
│   ✓ Pull request created                                           │
│   ✓ Required reviews approved                                    │
│   ✓ All status checks passed                                     │
│   ✓ No merge conflicts                                          │
│   ✓ Branch is up-to-date                                        │
│   ✓ Conversation resolved                                      │
│   ✓ Documentation updated (if needed)                           │
│                                                                 │
└─────────────────────────────────────────────────────────────────────────────┘
```

### GitHub Settings Configuration

```
Settings → Branches → Add rule for "main":

✓ Require pull request reviews before merging
  - Required approving reviews: 1
  - ✓ Dismiss stale reviews
  - ✓ Require code owner reviews

✓ Require status checks to pass before merging
  - ✓ Require branches to be up to date
  - Include administrators

✓ Require conversation resolution
✓ Require signed commits (optional)
✓ Include administrators

```

---

## GitHub CLI for Branch Protection

### Manage Branch Protection

```bash
# View protection rules
gh api repos/OWNER/REPO/branches/main/protection

# Update protection rules
gh api repos/OWNER/REPO/branches/main/protection \
  -X PUT \
  -f required_status_checks='{"strict":true}'
  -f required_pull_request_reviews='{"required_approving_review_count":1}'
```

---

## Practice Exercises

### Exercise 1: Configure Basic Protection (15 min)

1. Go to repository settings
2. Navigate to Branch protection rules
3. Add rule for "main" branch
4. Require 1 approval
5. Save rules

```
Settings → Branches → Add rule
Branch name pattern: main
✓ Require pull request reviews before merging
  Required approving reviews: 1
Save
```

### Exercise 2: Add Status Check Requirement (15 min)

1. Create CI workflow (Day 33)
2. Navigate to branch protection
3. Edit main branch rule
4. Require status checks
5. Select specific checks

```
Settings → Branches → Edit rule
✓ Require status checks to pass
  Select checks:
    ✓ CI Pipeline
Save
```

### Exercise 3: Create CODEOWNERS (20 min)

1. Create .github directory
2. Create CODEOWNERS file
3. Add team members
4. Commit to main

```bash
mkdir -p .github
cat > .github/CODEOWNERS << 'EOF'
# Default owner
* @yourusername

# Frontend
src/frontend/ @frontend-dev

# Backend
src/backend/ @backend-dev
EOF

git add .
git commit -m "Add CODEOWNERS"
git push

# Requires approval to modify!
```

### Exercise 4: Test Protection (15 min)

1. Create new branch
2. Make changes
3. Create PR
4. Try to merge without approval (should fail)
5. Get approval
6. Merge

---

## Checklist

- [ ] I understand branch protection
- [ ] I can configure protection rules
- [ ] I understand required reviews
- [ ] I can set required status checks
- [ ] I can create CODEOWNERS file
- [ ] I understand quality gates
- [ ] I can merge via PR

---

## Commands Reference

```bash
# GitHub CLI for protection (API)
gh api repos/OWNER/REPO/branches/main/protection

# Repository settings via web
# Settings → Branches → Branch protection rules
```

---

## Reading References

- [Branch Protection Rules](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/managing-a-branch-protection-rule)
- [About CODEOWNERS](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners)

---

## Tomorrow's Preview

**Day 35: Week 5 Review**

Tomorrow you'll review:
- GitHub Professional summary
- All Week 5 topics
- Q&A session

---

## Navigation

← [Day 33: GitHub Actions Intro](../day-33/lesson.md) | [Dashboard](../../dashboard.md) | [Day 35: Week 5 Review](../day-35/lesson.md) →

---

**Estimated Time**: 4 hours  
**Your Progress**: Day 34 of 56 (Week 5 - Day 6)  
**Next**: Week 5 Review