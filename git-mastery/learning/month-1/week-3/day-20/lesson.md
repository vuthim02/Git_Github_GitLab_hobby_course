# Day 20: GitLab & Merge Requests

## Theory

### GitLab Overview

GitLab is a complete DevOps platform. Like GitHub, it hosts Git repositories but includes additional features.

### GitLab vs GitHub

| Feature | GitHub | GitLab |
|---------|--------|--------|
| PR vs MR | Pull Request | Merge Request |
| CI/CD | GitHub Actions | GitLab CI (built-in) |
| Self-hosted | GitHub Enterprise | GitLab CE (free) |
| Forks | Yes | Yes (with permissions) |

### Key GitLab Concepts

#### Merge Requests (MRs)
- GitLab's equivalent to GitHub's Pull Requests
- Same purpose: propose and review changes

#### Fork vs Branch

GitLab supports both:
- **Branches**: For same-repository collaboration
- **Forks**: For external contributions

#### Permissions

| Role | Can Do |
|------|--------|
| Guest | View |
| Reporter | View + comment |
| Developer | View + comment + push |
| Maintainer | + Branch management |
| Owner | Full access |

### GitLab Features

- **Issues**: Track tasks and bugs
- **Milestones**: Group issues
- **Wiki**: Documentation
- **CI/CD**: Automated pipelines
- **Container Registry**: Docker images
- **Package Registry**: Store packages

## Commands

```bash
# Clone from GitLab
git clone https://gitlab.com/user/repo.git

# SSH clone
git clone git@gitlab.com:user/repo.git

# Push to GitLab
git push -u origin branch-name
```

## Video References

- [Git Tutorial for Beginners: Branching](https://youtu.be/zTjRZNkhiEU)
- [Git & GitHub Tutorial - Branching](https://youtu.be/8JJ101D3knE)
- [Git Branches Tutorial](https://youtu.be/RGOj5yH7evk)

## Practice Exercises

### Exercise 1: GitLab Account Setup

1. Sign up at gitlab.com
2. Create a new project
3. Clone it locally
4. Make a commit and push

### Exercise 2: Create a Merge Request

1. Create a branch
2. Make changes
3. Push to GitLab
4. Create MR from web interface

### Exercise 3: Review Code in MR

1. Open an MR
2. View diff
3. Add comments
4. Approve or request changes

## Checklist

- [ ] I understand GitLab vs GitHub
- [ ] I can use GitLab interface
- [ ] I can create merge requests
- [ ] I understand GitLab features
- [ ] I can use CI/CD basics

## Navigation

← [Day 19: GitHub Setup & Pull Requests](../day-19/lesson.md) | [Day 21: Week 3 Review](../day-21/lesson.md) →
