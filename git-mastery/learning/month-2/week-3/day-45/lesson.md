# Day 45: GitLab Flow

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          GIT MASTERY - DAY 45                                ║
║                          GITLAB FLOW                                       ║
╚═══════════════════════════════════════════════════════════════════════════════════════╝
```

## Today's Objectives

- [ ] Understand GitLab Flow
- [ ] Use environment branches
- [ ] Implement pre-production workflow

---

## Theory: GitLab Flow

### What is GitLab Flow?

GitLab Flow combines Git Flow's discipline with GitHub Flow's simplicity:

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                        GITLAB FLOW STRUCTURE                                │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│   main ────●─────●─────●─────●─────●─────●─────●                        │
│              │    │    │    │    │    │    │                            │
│          pre-prod  │    │    │    │    │    │                            │
│                    │    │    │    │    │                                │
│               production ──●─────●─────●                                     │
│                       │    │    │                                             │
│                   staging ──●                                             │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Key Concepts

1. **Environment branches**: main → pre-prod → production
2. **Upstream first**: Features tested in staging before production
3. **Merge from upstream**: Merge changes flow upward

### GitLab Flow Rules

1. Branch from main
2. Merge to main
3. Deploy to staging
4. Test in staging
5. Merge to production when ready

---

## Using GitLab Flow

### Basic Workflow

```bash
# Feature branch
git checkout -b feature/my-feature
# Work... commit...
git checkout main
git merge feature/my-feature

# Deploy to staging
git push origin main

# After testing, merge to production
git push origin main:production
```

---

## Reading References

### Atlassian
- [Comparing Workflows](https://www.atlassian.com/git/tutorials/comparing-workflows)
- [Git Flow vs GitHub Flow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow)

### GitLab Docs
- [GitLab Flow](https://docs.gitlab.com/ee/topics/git/two_levels_of_github.html)
- [Environment Branches](https://docs.gitlab.com/ee/ci/environments/)

### Video Reference
- [GitLab Flow Overview](https://youtu.be/8JJ101D3knE)

## Checklist

- [ ] Understand GitLab Flow
- [ ] Implement environment branches
- [ ] Use upstream workflow