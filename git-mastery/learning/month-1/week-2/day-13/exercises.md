# Day 13 Exercises: Branching Workflows

## Exercise 1: Implement GitHub Flow

Create this scenario:
1. Main has initial commit
2. Create `feature-navbar` branch
3. Add navbar component
4. Merge to main
5. Create `feature-sidebar` branch
6. Add sidebar
7. Merge to main
8. Show final history

## Exercise 2: Implement GitFlow

Create this structure:
```
main:    [v1.0]----[v1.1]
              ↗         ↗
develop:    [dev]----[dev]----
              ↗              ↗
        [feat-a]      [release/v1.1]
```

Branch naming:
- `feature/*` for new features
- `release/*` for releases
- `hotfix/*` for fixes

## Exercise 3: Branch Naming Practice

Create properly named branches:
```bash
git branch feature/user-dashboard
git branch bugfix/fix-login-error
git branch hotfix/security-vulnerability
git branch release/2.0.0
git branch experiment/new-algorithm
```

## Exercise 4: Compare Workflows

Create same feature using:
1. GitHub Flow (1 feature branch)
2. GitFlow (feature + release)

Compare the commit history.

## Exercise 5: Simulate a Hotfix

Scenario: Bug in production on `main`
1. Create `hotfix/urgent-fix` from `main`
2. Fix the bug
3. Merge to `main`
4. Also merge to `develop` (if using GitFlow)

## Challenge

Design a workflow for:
- Team of 5 developers
- Weekly sprints
- Bi-weekly releases
- Production hotfixes needed
