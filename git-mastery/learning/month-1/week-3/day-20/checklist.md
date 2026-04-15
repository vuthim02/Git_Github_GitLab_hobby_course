# Day 20 Checklist: GitLab & Merge Requests

## GitLab Concepts

- [ ] Merge Requests (MRs) = Pull Requests
- [ ] Branches within same repo
- [ ] Fork workflow for external contributions
- [ ] Permission levels

## MR Workflow

1. [ ] Create branch
2. [ ] Make changes
3. [ ] Push to GitLab
4. [ ] Create MR
5. [ ] Request review
6. [ ] Address feedback
7. [ ] Approve
8. [ ] Merge

## GitLab Features

- [ ] Issues (ticket tracking)
- [ ] Milestones (group issues)
- [ ] Wiki (documentation)
- [ ] CI/CD (pipelines)
- [ ] Container Registry

## CI/CD Basics

```yaml
stages:
  - build
  - test
  - deploy

job_name:
  stage: test
  script:
    - commands
```

## Comparison: GitHub vs GitLab

| Aspect | GitHub | GitLab |
|--------|--------|--------|
| PR vs MR | Pull Request | Merge Request |
| CI/CD | Actions (separate) | Built-in |
| Forks | Yes | Yes |

## Post-Lesson

- [ ] Can use GitLab interface
- [ ] Can create MRs
- [ ] Understands GitLab features
- [ ] Ready for Day 21: Week 3 Review
