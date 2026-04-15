# Day 13: Branching Workflows

## Theory

### Why Have a Workflow?

A branching workflow defines how teams use branches to organize development. It provides consistency and prevents chaos.

### Popular Workflows

#### 1. GitHub Flow

Simple, suitable for web applications with continuous deployment.

```
main → feature → PR → main
```

**Rules:**
- `main` is always deployable
- All work happens in feature branches
- Pull requests for discussion
- Merge to main = deploy

**Best for:**
- Small teams
- Continuous deployment
- Web apps

#### 2. GitFlow

Comprehensive, designed for scheduled releases.

```
main ──────────────────────
  ↑                       ↓
develop ──────────────────
  ↑     ↗   ↑     ↗     ↑
feature    feature    release
```

**Branches:**
- `main`: Production code
- `develop`: Integration branch
- `feature/*`: New features
- `release/*`: Release preparation
- `hotfix/*`: Production fixes

**Best for:**
- Scheduled releases
- Larger teams
- Multiple versions

#### 3. Trunk-Based Development

Minimal branching, frequent integration.

```
main ──────────────────────
  ↑   ↑   ↑   ↑   ↑   ↑
  ↑   ↑   ↑   ↑   ↑   ↑
```

**Rules:**
- Very short-lived branches (hours/days)
- Or no branches at all
- Feature flags for incomplete work

**Best for:**
- Small teams
- Continuous integration
- Rapid releases

### Choosing a Workflow

| Factor | GitHub Flow | GitFlow | Trunk-Based |
|--------|-------------|---------|-------------|
| Team size | Small-Medium | Large | Any |
| Release cycle | Continuous | Scheduled | Continuous |
| Complexity | Low | High | Low |
| Version support | No | Yes | No |

## Video References

- [Git Tutorial for Beginners: Branching](https://youtu.be/zTjRZNkhiEU)
- [Git & GitHub Tutorial - Branching](https://youtu.be/8JJ101D3knE)
- [Git Branches Tutorial](https://youtu.be/RGOj5yH7evk)

## Naming Conventions

```bash
git branch feature/user-authentication
git branch bugfix/login-crash
git branch hotfix/security-patch
git branch release/v1.2.0
```

## Practice Exercises

### Exercise 1: GitHub Flow Practice

1. Create main with initial commit
2. Create feature branch
3. Add commits to feature
4. Merge via pull request (simulate)
5. Verify main has all changes

### Exercise 2: GitFlow Structure

Create the GitFlow structure:
1. Initialize main and develop
2. Create feature branch from develop
3. Merge feature to develop
4. Create release branch
5. Merge release to main and develop

## Checklist

- [ ] I understand GitHub Flow
- [ ] I understand GitFlow
- [ ] I understand Trunk-Based Development
- [ ] I can name branches properly
- [ ] I can choose the right workflow

## Navigation

← [Day 12: Resolving Merge Conflicts](../day-12/lesson.md) | [Day 14: Week 2 Review](../day-14/lesson.md) →
