# Day 15: Git Remote Basics

## Theory

### What is a Remote?

A remote is a URL that points to a Git repository hosted on another computer or server. Remotes enable collaboration.

### Remote Terminology

- **Remote**: A URL alias (like "origin")
- **Origin**: Default name for the main remote
- **Fetch**: Download commits from remote
- **Push**: Upload commits to remote
- **Pull**: Fetch and merge in one command

### Why Remotes?

1. **Backup**: Store code on external servers
2. **Collaboration**: Share work with others
3. **Access**: Work from multiple computers
4. **History**: Full project history stored remotely

### How Remotes Work

```
Local Repository                Remote Repository
┌─────────────────┐            ┌─────────────────┐
│ .git/config     │ ←──────→  │ origin          │
│ refs/heads/main │ fetch     │ refs/heads/main │
│ refs/remotes/  │ push      │ commits...      │
└─────────────────┘            └─────────────────┘
```

Local branches and remote branches are separate but linked.

### The `.git/config` File

```ini
[remote "origin"]
    url = https://github.com/user/repo.git
    fetch = +refs/heads/*:refs/remotes/origin/*
```

## Commands

```bash
# List remotes
git remote -v

# Add a remote
git remote add origin https://github.com/user/repo.git
git remote add upstream https://github.com/original/repo.git

# Rename remote
git remote rename origin upstream

# Remove remote
git remote remove origin

# Change remote URL
git remote set-url origin new-url

# Show remote details
git remote show origin
```

## Video References

- [Git Tutorial for Beginners: Branching](https://youtu.be/zTjRZNkhiEU)
- [Git & GitHub Tutorial - Branching](https://youtu.be/8JJ101D3knE)
- [Git Tutorial - Remote](https://youtu.be/SWYqp7iY_Tc)

## Reading References

### Git SCM Documentation
- [Working with Remotes](https://git-scm.com/book/en/v2/Git-Basics-Working-with-Remotes)
- [Remote Branches](https://git-scm.com/book/en/v2/Git-Branching-Remote-Branches)

## Practice Exercises

### Exercise 1: Explore Remote Configuration

1. Create a new local repository
2. Run `git remote -v` (should be empty)
3. Add a remote
4. Run `git remote -v` again

### Exercise 2: Multiple Remotes

Practice with multiple remotes:
```bash
git remote add origin git@github.com:user/repo.git
git remote add upstream git@github.com:original/repo.git
```

### Exercise 3: Remote Information

```bash
git remote show origin
git remote -v
```

## Checklist

- [ ] I understand what a remote is
- [ ] I can list remotes
- [ ] I can add remotes
- [ ] I can remove remotes
- [ ] I understand origin

## Navigation

← [Day 14: Week 2 Review](../week-2/day-14/lesson.md) | [Day 16: Cloning & Fetching](../day-16/lesson.md) →
