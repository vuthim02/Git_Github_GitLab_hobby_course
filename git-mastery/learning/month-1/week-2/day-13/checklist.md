# Day 13 Checklist: Branching Workflows

## Workflow Understanding

### GitHub Flow
- [ ] Main is always deployable
- [ ] Feature branches for all work
- [ ] Pull requests for review
- [ ] Simple and lightweight

### GitFlow
- [ ] Main for production
- [ ] Develop for integration
- [ ] Feature, release, hotfix branches
- [ ] Good for scheduled releases

### Trunk-Based Development
- [ ] Very short branches
- [ ] Frequent integration
- [ ] Feature flags for incomplete work

## Branch Naming

- [ ] `feature/` - new features
- [ ] `bugfix/` - bug fixes
- [ ] `hotfix/` - urgent production fixes
- [ ] `release/` - release preparation
- [ ] `experiment/` - trying new ideas

## Pattern: type/description

```bash
feature/user-authentication
bugfix/login-validation
hotfix/security-patch
release/2.0.0
```

## Choosing a Workflow

Consider:
- [ ] Team size
- [ ] Release frequency
- [ ] Complexity needs
- [ ] Version requirements

## Post-Lesson

- [ ] Completed all exercises
- [ ] Can implement GitHub Flow
- [ ] Can implement GitFlow
- [ ] Ready for Day 14: Week 2 Review
