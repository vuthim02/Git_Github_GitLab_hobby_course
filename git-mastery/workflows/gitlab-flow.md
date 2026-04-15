# GitLab Flow Workflow Guide

## Table of Contents
1. [Overview](#overview)
2. [Environment-Based Branches](#environment-based-branches)
3. [Branch Structure for Different Environments](#branch-structure-for-different-environments)
4. [Promotion Process](#promotion-process)
5. [Merge Request Workflow](#merge-request-workflow)
6. [Comparison with Git Flow](#comparison-with-git-flow)
7. [Commands Reference](#commands-reference)

---

## Overview

GitLab Flow is a workflow developed by GitLab that combines feature-driven development with feature branches. It provides a simpler alternative to Git Flow while adding environment-based branches for clearer deployment paths.

### Core Philosophy
- Fewer branch types than Git Flow
- Clear path from development to production
- Environment as first-class concept
- Linear history with fast-forward merges

### Key Principles
1. `main` branch is the starting point
2. Environment branches represent deployment stages
3. Features promote through environments
4. Always deployable at every stage

---

## Environment-Based Branches

### Basic Structure

```
                                        ●─────────── pre-production
                                       /
●─────●─────●─────●─────●─────●────●───●────●─────► main
                                     /
                                    ●─────────── staging
                                   /
                                  ●─────────── canary
```

### Environment Branch Model

```
┌─────────────────────────────────────────────────────────────────────┐
│                    GitLab Flow Environment Branches                  │
├─────────────────────────────────────────────────────────────────────┤
│                                                                      │
│  main ────────●───●───●───●───●───●───●───●───●───►                 │
│   │              │   │   │   │   │   │   │   │   │                  │
│   │              │   │   │   │   │   │   │   │   │                  │
│   ▼              ▼   ▼   ▼   ▼   ▼   ▼   ▼   ▼   ▼                  │
│  canary      (10%) (10%)(20%)(...)                              │
│   │                                                                │
│   ▼                                                                │
│  staging    [QA Testing] [QA Testing] [QA Testing]                  │
│   │                                                                │
│   ▼                                                                │
│  production [Full Deploy] [Full Deploy] [Full Deploy]               │
│                                                                      │
└─────────────────────────────────────────────────────────────────────┘
```

### Environment Definitions

| Environment | Purpose | Auto-deploy | Percentage |
|-------------|---------|-------------|------------|
| `main` | Development integration | - | 100% |
| `canary` | Early testing with real users | ✓ | 10-20% |
| `staging` | QA and UAT | ✓ | 100% |
| `production` | Live production environment | ✓ | 100% |

---

## Branch Structure for Different Environments

### Model 1: Environment Branches with Main

```
main ──────────●───●───●───●───●───●───●───●───●───●───●───►
                 │       │       │       │       │
                 ▼       ▼       ▼       ▼       ▼
              canary  canary  canary  canary  canary
                 │       │       │       │       │
                 ▼       ▼       ▼       ▼       ▼
              staging staging staging staging staging
                 │       │       │       │       │
                 ▼       ▼       ▼       ▼       ▼
             production production production production
```

### Model 2: Environment Branches with Upstream

```
production ────────────────────●───●───●───●───●───●───►
                                  ▲   ▲   ▲   ▲   ▲
                                  │   │   │   │   │
                               staging│  │   │   │
                                  ▲   │   │   │   │
                                  │   │   │   │
                               canary │   │   │
                                  ▲   │   │   │
                                  │   │   │   │
                                main───●───●───●───►
```

### Model 3: Simple Production Branch

```
main ──────────●───●───●───●───●───●───●───●───●───●───►
                                              │
                                              ▼
                                        production
```

### Choosing the Right Model

| Model | Best For | Complexity |
|-------|----------|------------|
| Model 1 | Multiple pre-prod environments | Medium |
| Model 2 | Strict promotion requirements | High |
| Model 3 | Simple continuous deployment | Low |

---

## Promotion Process

### Manual Promotion

```bash
# 1. From your feature branch, merge to main
git checkout feature/my-feature
git push origin feature/my-feature

# 2. After merge to main, promote to canary
git checkout canary
git merge main
git push origin canary

# 3. After canary testing, promote to staging
git checkout staging
git merge canary
git push origin staging

# 4. After staging approval, promote to production
git checkout production
git merge staging
git push origin production
git tag -a v1.2.0 -m "Release v1.2.0"
git push origin v1.2.0
```

### Promotion via GitLab UI

```
1. Navigate to Merge Request
2. Click "Merge" (merges to main)
3. Go to Integrations > Pipelines
4. Click "Run Pipeline" for canary
5. After canary passes, run for staging
6. After staging passes, run for production
```

### Automated Promotion with GitLab CI/CD

```yaml
# .gitlab-ci.yml
stages:
  - test
  - deploy
  - verify

test:
  stage: test
  script: npm test
  only:
    - main
    - feature/*
    - bugfix/*

deploy_canary:
  stage: deploy
  script: kubectl set image deployment/app canary=app:v$CI_PIPELINE_ID
  environment:
    name: canary
    url: https://canary.example.com
  only:
    - main

deploy_staging:
  stage: deploy
  script: kubectl set image deployment/app staging=app:v$CI_PIPELINE_ID
  environment:
    name: staging
    url: https://staging.example.com
  when: manual
  only:
    - main

deploy_production:
  stage: deploy
  script: kubectl set image deployment/app production=app:v$CI_PIPELINE_ID
  environment:
    name: production
    url: https://example.com
  when: manual
  only:
    - tags
```

### Promotion Flow Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│                     Promotion Flow                                │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  Feature Branch                                                   │
│       │                                                          │
│       ▼                                                          │
│  ┌─────────┐     Auto-deploys to canary                          │
│  │   MR    │──────────────────────────┐                          │
│  └─────────┘                          │                          │
│       │                               ▼                          │
│       │                        ┌───────────┐                     │
│       │                        │  Canary   │ (10% traffic)      │
│       │                        │  (Auto)   │                     │
│       │                        └───────────┘                     │
│       │                               │                          │
│       │                    Manual promotion (if stable)         │
│       │                               ▼                          │
│       │                        ┌───────────┐                     │
│       │                        │  Staging  │ (QA/UAT)            │
│       │                        │ (Manual)  │                     │
│       │                        └───────────┘                     │
│       │                               │                          │
│       │                    Manual promotion (if approved)       │
│       │                               ▼                          │
│       │                        ┌────────────┐                    │
│       │                        │ Production │ (100% traffic)    │
│       └───────────────────────►│  (Manual)  │                    │
│              Tag created        └────────────┘                    │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## Merge Request Workflow

### MR Workflow with Environments

```
┌─────────────────────────────────────────────────────────────────┐
│                GitLab Merge Request Workflow                      │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  1. Create branch from main                                     │
│     $ git checkout -b feature/add-login                        │
│                                                                  │
│  2. Make changes and commit                                     │
│     $ git add . && git commit -m "Add login feature"            │
│                                                                  │
│  3. Push and create MR via GitLab UI                            │
│     $ git push -u origin feature/add-login                      │
│                                                                  │
│  4. Reviewers receive notification                              │
│                                                                  │
│  5. Pipeline runs automatically                                 │
│     - Unit tests                                                │
│     - Integration tests                                         │
│     - Security scans                                            │
│                                                                  │
│  6. Code review in MR UI                                        │
│     - Line comments                                             │
│     - Suggestions                                               │
│     - Approvals                                                 │
│                                                                  │
│  7. Address feedback                                            │
│     - Push new commits                                          │
│     - Pipeline re-runs                                          │
│                                                                  │
│  8. MR approved and merged                                      │
│                                                                  │
│  9. Changes auto-deploy through environments                   │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### MR Creation Example

```bash
# Using GitLab CLI
glab mr create \
  --title "Add user authentication" \
  --description "## What this does
- Adds OAuth2 login
- Implements session management
  
## Testing
- [x] Unit tests pass
- [x] Manual testing completed
  
Closes #456" \
  --target-branch main \
  --reviewer @senior-dev

# Push and create
git push -u origin feature/auth
```

### MR Templates

```markdown
<!-- .gitlab/merge_request_templates/default.md -->
## Summary
<!-- Brief description of changes -->

## Changes
<!-- List of specific changes -->

## Testing Checklist
- [ ] Unit tests added/updated
- [ ] Integration tests pass
- [ ] Manual testing completed
- [ ] No performance degradation

## Screenshots
<!-- Before/after if applicable -->

## Related Issues
<!-- Links to related issues -->

## Checklist
- [ ] Code follows style guide
- [ ] Documentation updated
- [ ] Changelog updated
```

---

## Comparison with Git Flow

### Branch Complexity Comparison

```
Git Flow:                          GitLab Flow:
                                   
main ───●────●───►                 main ───●───●───●───●───►
  │  \  \                           │
  │   \  \                          ▼
  │    \  \                      canary
 develop ─●──●──●──►                  │
  │  \      \                        ▼
  │   \      \                   staging
  │    \      \                     │
  │     \      \                    ▼
  │      ●──────●──►             production
feature/xxx
   
release/x ────●───►                   
hotfix/x ─────●──►
```

### Feature Comparison Table

| Feature | Git Flow | GitLab Flow |
|---------|----------|-------------|
| Branch types | 5 | 2-4 (variable) |
| Release branches | Required | Optional |
| Environment branches | No | Yes (core concept) |
| Hotfix branches | Required | Uses feature branches |
| Merge strategy | --no-ff preferred | Fast-forward preferred |
| Learning curve | High | Medium |
| Best for releases | ✓✓✓ | ✓ |
| Best for CD | ✓ | ✓✓✓ |

### Decision Guide

```
                    ┌─────────────────────────┐
                    │  Start Here             │
                    └───────────┬─────────────┘
                                │
                                ▼
                    ┌─────────────────────────┐
                    │  Do you deploy multiple │
                    │  environments?          │
                    └───────────┬─────────────┘
                                │
              ┌─────────────────┴─────────────────┐
              │ Yes                                  │ No
              ▼                                     ▼
    ┌─────────────────┐                 ┌─────────────────┐
    │ GitLab Flow     │                 │ Do you need     │
    │ (environments)  │                 │ release branch? │
    └─────────────────┘                 └────────┬────────┘
                                                │
                              ┌─────────────────┴─────────────────┐
                              │ Yes                               │ No
                              ▼                                  ▼
                    ┌─────────────────┐               ┌─────────────────┐
                    │ Git Flow        │               │ GitHub Flow     │
                    │ (releases)      │               │ (simple CD)     │
                    └─────────────────┘               └─────────────────┘
```

### When to Use Each

| Scenario | Recommended Workflow |
|----------|---------------------|
| Continuous deployment, single env | GitHub Flow |
| Multiple pre-production environments | GitLab Flow |
| Scheduled releases with hardening | Git Flow |
| Mobile app releases (App Store) | Git Flow |
| Web SaaS with canary deployments | GitLab Flow |
| Simple API with CD | GitHub Flow |
| Enterprise with staging/UAT/QA | GitLab Flow |

---

## Commands Reference

### Basic GitLab Flow Commands

```bash
# Clone and setup
git clone git@gitlab.com:group/project.git
cd project

# Create feature branch
git checkout -b feature/add-api

# Work and commit
git add .
git commit -m "Add API endpoint"

# Push and create MR
git push -u origin feature/add-api

# Sync with main
git fetch origin
git rebase origin/main

# After MR merge, cleanup
git checkout main
git pull origin main
git branch -d feature/add-api
git push origin --delete feature/add-api
```

### GitLab CLI Commands

```bash
# MR operations
glab mr create --title "Title" --description "Description"
glab mr list
glab mr view 123
glab mr merge 123
glab mr close 123

# Review operations
glab mr approve 123
glab mr unapprove 123

# Pipeline operations
glab pipeline list
glab pipeline view 456
glab pipeline retry 456
glab pipeline cancel 456

# Environment operations
glab environment list
glab environment create staging --description "Staging env"
```

### GitLab CI/CD Variables

| Variable | Description |
|----------|-------------|
| `CI_COMMIT_SHA` | Current commit SHA |
| `CI_PIPELINE_ID` | Current pipeline ID |
| `CI_MERGE_REQUEST_ID` | Current MR ID |
| `CI_MERGE_REQUEST_IID` | Current MR number |
| `CI_COMMIT_BRANCH` | Current branch name |
| `CI_COMMIT_REF_NAME` | Git ref (branch/tag) |

### Promotion Script Example

```bash
#!/bin/bash
# promote.sh - Promote changes through environments

ENVIRONMENT=$1
SOURCE_BRANCH=$2

if [ -z "$ENVIRONMENT" ] || [ -z "$SOURCE_BRANCH" ]; then
  echo "Usage: promote.sh <environment> <source-branch>"
  exit 1
fi

git checkout $ENVIRONMENT
git pull origin $ENVIRONMENT
git merge $SOURCE_BRANCH
git push origin $ENVIRONMENT

echo "Promoted $SOURCE_BRANCH to $ENVIRONMENT"
```

---

## Best Practices

1. **Use fast-forward merges** - Cleaner history
2. **Promote through environments** - Never skip environments
3. **Tag production releases** - Semantic versioning
4. **Use MR templates** - Consistent documentation
5. **Require reviews** - Protected branches with approval rules
6. **Automate testing** - Gate promotions on passing tests
7. **Keep branches short-lived** - Rebase daily

## Common Mistakes

| Mistake | Solution |
|---------|----------|
| Skipping environments | Always promote sequentially |
| Long-lived feature branches | Rebase frequently, merge quickly |
| Direct pushes to main | Use protected branches |
| Skipping tests | Gate on CI/CD pipeline |
| Forgetting to delete branches | Auto-delete on merge |
| Inconsistent tagging | Use automation for versioning |
| Not using MR descriptions | Use templates |

---

## Advanced: Combining with GitOps

For GitLab Flow with GitOps:

```yaml
# .gitlab-ci.yml for GitOps
deploy_production:
  stage: deploy
  image: bitnami/kubectl
  script:
    - kubectl apply -f k8s/manifests/
  environment:
    name: production
    url: https://example.com
  only:
    - production
  rules:
    - if: '$CI_COMMIT_TAG'
```

---

## Summary

GitLab Flow provides:
- ✅ Environment-aware branching
- ✅ Flexible branch structure
- ✅ Clear promotion path
- ✅ Native GitLab CI/CD integration
- ✅ Balance between simplicity and control
