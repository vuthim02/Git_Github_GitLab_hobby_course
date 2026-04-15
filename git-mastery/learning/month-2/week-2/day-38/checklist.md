# Day 38 Checklist: GitLab CI/CD

## Pre-Lesson Checklist
- [ ] GitLab project ready (Day 37)
- [ ] Understand basic CI concepts

## During Lesson Checklist
- [ ] Created .gitlab-ci.yml
- [ ] Understood stages
- [ ] Understood jobs

## Pipeline Checklist
- [ ] Basic pipeline
- [ ] Caching
- [ ] Artifacts
- [ ] Multiple stages
- [ ] Multiple jobs

## Understanding Verification
- [ ] Can explain CI/CD concept
- [ ] Can create pipeline
- [ ] Can debug errors

## Post-Lesson Checklist
- [ ] Ready for Day 39: Pipelines

## Quick Reference
```yaml
stages:
  - build
  
build:
  stage: build
  script:
    - npm ci
```

## Success Criteria
You are ready for Day 39 when you can:
1. Create .gitlab-ci.yml
2. Run pipelines
3. Debug issues