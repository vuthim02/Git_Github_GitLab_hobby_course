# Day 36: GitLab Overview

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          GIT MASTERY - DAY 36                                   ║
║                           GITOVERVIEW                                           ║
╚═══════════════════════════════════════════════════════════════════════════════════════╝
```

## Today's Objectives

- [ ] Understand GitLab vs GitHub
- [ ] Navigate GitLab interface
- [ ] Create GitLab account
- [ ] Create GitLab projects
- [ ] Understand GitLab features

---

## Theory: GitLab Overview

### What is GitLab?

GitLab is a **complete DevOps platform** that provides:
- Git repository hosting
- Built-in CI/CD
- Application monitoring
- Security features
- Project management

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                      GITLAB VS GITHUB                                         │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│   GITLAB:                                                                  │
│   ├─ Self-hosted option                                                     │
│   ├─ Built-in CI/CD (no extra cost)                                        │
│   ├─ Free community edition                                                │
│   └─ Everything in one place                                              │
│                                                                             │
│   GITHUB:                                                                  │
│   ├─ Cloud only                                                            │
│   ├─ CI/CD requires extra (Actions - free for limited)                    │
│   ├─ Free organization tier                                               │
│   └─ Marketplace integrations                                            │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### GitLab Editions

| Edition | Cost | Features |
|---------|------|----------|
| GitLab Core (CE) | Free | Core features |
| GitLab Premium | $19/user/month | Advanced security |
| GitLab Ultimate | $99/user/month | Full features |

---

## Getting Started with GitLab

### Creating Account

1. Go to gitlab.com
2. Click "Register"
3. Enter email and password
4. Verify email
5. Complete profile

### Creating Project

```
1. Click "New project"
2. Choose template:
   - Create from scratch
   - Import project
   - Use template (Node, Python, etc.)
3. Enter project name
4. Visibility: Public/Private
5. Initialize with README
```

### GitLab Interface

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         GITLAB INTERFACE                                     │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│   Project pages:                                                             │
│   ├─ Repository - Code and commits                                        │
│   ├─ Readme - Project documentation                                       │
│   ├─ Commits - Commit history                                            │
│   ├─ Branches - Branch management                                          │
│   ├─ Tags - Release tags                                                 │
│   ├─ Issues - Issue tracker                                              │
│   ├─ Merge Requests - Code review                                         │
│   ├─ Pipelines - CI/CD status                                            │
│   ├─ CI/CD - Pipelines and jobs                                            │
│   ├─ Security - Security reports                                         │
│   ├─ Deployments - Deployment history                                    │
│   ├─ Environments - Environment tracking                                  │
│   └─ Packages - Package registry                                         │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## GitLab CLI

### GitLab CLI (glab)

```bash
# Install
# macOS: brew install glab
# Linux: sudo apt install glab

# Authenticate
glab auth login

# Create project
glab project create --name my-project --visibility public

# Clone
glab repo clone user/repo
```

---

## GitLab CI/CD vs GitHub Actions

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                    CI/CD COMPARISON                                       │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│   GITHUB ACTIONS:                                                          │
│   ├─ Triggers: push, PR, schedule, manual                                  │
│   ├─ Workflows: .github/workflows/*.yml                                   │
│   ├─ Runners: GitHub-hosted or self-hosted                                │
│   └─ Marketplace actions                                                 │
│                                                                             │
│   GITLAB CI/CD:                                                            │
│   ├─ Triggers: push, PR, schedule, manual, API                           │
│   ├─ Pipelines: .gitlab-ci.yml (root or .gitlab/)                        ��
│   ├─ Runners: Self-managed or GitLab.com managed                          │
│   └─ Built-in features                                                    │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## Reading References

### GitLab Documentation
- [GitLab Official Site](https://about.gitlab.com/)
- [GitLab Documentation](https://docs.gitlab.com/)
- [Getting Started with GitLab](https://docs.gitlab.com/ee/gitlab-basics/)
- [GitLab Repository Management](https://docs.gitlab.com/ee/user/project/)
- [GitLab vs GitHub](https://about.gitlab.com/compare/)

### Video Reference
**Video**: [Git Tutorial for Beginners](https://youtu.be/zTjRZNkhiEU)  
**Section**: Remote Repositories  
**Timestamps**: Full video

---

## Practice Exercises

### Exercise 1: GitLab Account (10 min)

1. Register at gitlab.com
2. Complete profile
3. Verify email

### Exercise 2: Create First Project (15 min)

1. Click "New project"
2. Create blank project
3. Add README
4. Explore interface

### Exercise 3: Git vs GitLab (15 min)

1. Create local repo
2. Push to GitLab
3. Compare with GitHub

```bash
# Push to GitLab (same as GitHub)
git remote add origin https://gitlab.com/username/repo.git
git push -u origin main
```

---

## Checklist

- [ ] Created GitLab account
- [ ] Created GitLab project
- [ ] Understood interface
- [ ] Understood GitLab vs GitHub

---

## Navigation

← [Day 35: Week 5 Review](../day-35/lesson.md) | [Dashboard](../../dashboard.md) | [Day 37: Merge Requests](../day-37/lesson.md) →

---

**Estimated Time**: 4 hours  
**Your Progress**: Day 36 of 56 (Week 6 - Day 1)  
**Next**: Merge Requests