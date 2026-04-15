# Day 33 Checklist: GitHub Actions Intro

## Pre-Lesson Checklist

- [ ] Reviewed CI/CD concepts (Day 32 review)
- [ ] Understood GitHub basics
- [ ] Have a project with tests to use
- [ ] GitHub account ready

## During Lesson Checklist

- [ ] Watched CI/CD video section
- [ ] Understood workflow components
- [ ] Learned workflow syntax
- [ ] Understood triggers

## Workflow Creation Checklist

- [ ] Created .github/workflows directory
- [ ] Created first workflow file
- [ ] Added checkout action
- [ ] Added setup-node action
- [ ] Added install step
- [ ] Added test step

## Job Configuration Checklist

- [ ] Understood job syntax
- [ ] Understood step syntax
- [ ] Know how to use uses
- [ ] Know how to use run

## Trigger Configuration Checklist

- [ ] Understood push trigger
- [ ] Understood pull_request trigger
- [ ] Can filter by branches
- [ ] Can filter by paths

## Matrix Strategy Checklist

- [ ] Created matrix strategy
- [ ] Tested multiple versions
- [ ] Understood fail-fast behavior

## Caching Checklist

- [ ] Added caching to workflow
- [ ] Tested cache works
- [ ] Measured speed improvement

## Understanding Verification

- [ ] I can explain what CI/CD is
- [ ] I can explain workflow components
- [ ] I can create a workflow
- [ ] I can debug a failing workflow
- [ ] I can use matrix strategy

## Post-Lesson Checklist

- [ ] Completed all exercises
- [ ] Workflow runs successfully
- [ ] Ready for Day 34: Protected Branches

## Quick Reference

```yaml
# Basic workflow structure
name: Workflow Name

on:
  push:
    branches: [main]

jobs:
  job-name:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: '20'
      - run: npm ci
      - run: npm test
```

## Success Criteria

You are ready for Day 34 when you can:
1. Explain what CI/CD is
2. Create a workflow file
3. Understand workflow triggers
4. Use matrix strategy
5. Debug a failing workflow