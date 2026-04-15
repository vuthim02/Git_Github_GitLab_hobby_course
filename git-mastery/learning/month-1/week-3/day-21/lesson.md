# Day 21: Week 3 Review

## Week 3 Summary

This week we learned Git remote collaboration. Let's review everything we covered.

## Topics Covered

### Day 15: Git Remote Basics
- Remotes are URL bookmarks
- `origin` is default remote name
- Commands: `git remote add`, `git remote -v`

### Day 16: Cloning & Fetching
- `git clone` copies entire repository
- `git fetch` downloads without integrating
- Remote-tracking branches: `origin/main`

### Day 17: Pulling & Merging
- `git pull` = fetch + merge
- `git pull --rebase` for linear history
- Pull conflicts resolution

### Day 18: Pushing & Authentication
- `git push` uploads commits
- HTTPS vs SSH authentication
- Handle rejected pushes

### Day 19: GitHub & Pull Requests
- Fork workflow
- Create and review PRs
- Sync fork with upstream

### Day 20: GitLab & Merge Requests
- MRs = GitLab's PRs
- GitLab features overview
- CI/CD basics

## Command Reference

```bash
# Remotes
git remote -v
git remote add origin url
git remote add upstream url

# Sync
git fetch upstream
git merge upstream/main

# Push/Pull
git push -u origin branch
git pull origin main
git pull --rebase

# Forks
git clone your-fork-url
git remote add upstream original-url
```

## Video References

- [Git Tutorial for Beginners: Branching](https://youtu.be/zTjRZNkhiEU)
- [Git & GitHub Tutorial - Branching](https://youtu.be/8JJ101D3knE)
- [Git Branches Tutorial](https://youtu.be/RGOj5yH7evk)

## Practice Challenges

### Challenge 1: Full Collaboration Workflow

1. Fork a repository
2. Clone your fork
3. Add upstream remote
4. Sync with upstream
5. Create feature branch
6. Make commits
7. Push to your fork
8. Create PR/MR

### Challenge 2: Handle Conflicts

1. Create scenario with conflicting changes
2. Pull with rebase
3. Resolve conflicts
4. Complete the sync

### Challenge 3: Team Simulation

Create a scenario with:
- Upstream repository
- Two team members (forks)
- Multiple PRs
- Merge conflicts

## Assessment Questions

1. What's the difference between fetch and pull?
2. How do you sync a fork with upstream?
3. What's the purpose of upstream remote?
4. How do you handle a rejected push?
5. What's the difference between GitHub PR and GitLab MR?

## Week 4 Preview

Next week: Advanced Git
- Rebase fundamentals
- Interactive rebase
- Cherry-picking
- Stashing
- Reset vs Revert
- Reflog & Recovery

## Navigation

← [Day 20: GitLab & Merge Requests](../day-20/lesson.md) | [Week 4: Day 22 - Rebase Fundamentals](../week-4/day-22/lesson.md) →
