# Day 19: GitHub Setup & Pull Requests

## Theory

### GitHub Workflow

```
Fork → Clone → Edit → Push → Pull Request
```

### Forking

A fork is your copy of someone else's repository on GitHub. You can modify freely without affecting the original.

**Why Fork?**
- Contribute to projects you don't have commit access to
- Work independently
- Submit changes via pull request

### Creating a Pull Request

A Pull Request (PR) proposes your changes for review and merge.

**Steps:**
1. Push your feature branch to your fork
2. Click "New Pull Request" on GitHub
3. Select branches to compare
4. Write description
5. Submit

### PR Review Process

```
Author                Reviewer
   │                     │
   ├── Push commits ────→│
   │                     │
   │←── Review comments │←─ Look at PR
   │                     │
   ├── Push fixes ──────→│
   │                     │
   │←── Approve ─────────│
   │                     │
   └── Merge ─────────────┘
```

### PR Best Practices

1. **Small PRs**: Easier to review
2. **Good description**: Explain what/why
3. **Reference issues**: Link related issues
4. **Keep updated**: Rebase on main

## Commands

```bash
# Clone your fork
git clone https://github.com/your-username/repo.git

# Add upstream remote
git remote add upstream original-repo-url

# Keep fork updated
git fetch upstream
git merge upstream/main

# Push to your fork
git push origin feature-branch
```

## Video References

- [Git Tutorial for Beginners: Branching](https://youtu.be/zTjRZNkhiEU)
- [Git & GitHub Tutorial - Branching](https://youtu.be/8JJ101D3knE)
- [Git Branches Tutorial](https://youtu.be/RGOj5yH7evk)

## Practice Exercises

### Exercise 1: Fork a Repository

1. Find a public repository on GitHub
2. Click "Fork" button
3. Wait for fork to create
4. Clone your fork

### Exercise 2: Configure Upstream

```bash
git remote add upstream original-repo-url
git remote -v  # Verify
```

### Exercise 3: Keep Fork Updated

```bash
git fetch upstream
git checkout main
git merge upstream/main
git push origin main
```

## Checklist

- [ ] I understand GitHub workflow
- [ ] I can fork a repository
- [ ] I can create a pull request
- [ ] I can review pull requests
- [ ] I can merge pull requests

## Navigation

← [Day 18: Pushing & Authentication](../day-18/lesson.md) | [Day 20: GitLab & Merge Requests](../day-20/lesson.md) →
