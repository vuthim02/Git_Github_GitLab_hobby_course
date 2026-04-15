# Day 20 Exercises: GitLab & Merge Requests

## Exercise 1: GitLab Account

1. Create GitLab account (gitlab.com)
2. Create a new project
3. Initialize with README
4. Clone locally

## Exercise 2: Basic GitLab Workflow

Create this workflow:
1. Create a branch
2. Make changes
3. Push branch
4. Create MR from web UI
5. Review and merge

## Exercise 3: GitLab CI/CD Introduction

Create a `.gitlab-ci.yml` file:
```yaml
stages:
  - test

test:
  stage: test
  script:
    - echo "Running tests..."
    - npm test
```

## Exercise 4: Fork Workflow on GitLab

1. Visit a public GitLab project
2. Click "Fork"
3. Clone your fork
4. Add MR to original project

## Exercise 5: GitLab vs GitHub Comparison

Create a table comparing:

| Feature | GitHub | GitLab |
|---------|--------|--------|
| Feature branches | PRs | MRs |
| CI/CD | Actions | CI (built-in) |
| Forks | Yes | Yes |
| Self-hosted | Enterprise | CE |
| Wiki | Yes | Yes |

## Challenge

Set up a GitLab project with:
1. README
2. .gitlab-ci.yml
3. One merge request workflow
