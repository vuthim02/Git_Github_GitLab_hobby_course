# Day 18 Reflections: Pushing & Authentication

## What I Learned Today

### Push Commands

```bash
git push origin main           # Push to remote
git push -u origin branch      # Set upstream
git push origin --delete branch # Delete remote branch
git push --force-with-lease   # Safer force push
```

### Push Flow

```
Local commit → Push → Remote repository
                  ↑
            Must fetch first
            if remote has new commits
```

### Authentication Methods

| Method | Setup | Password |
|--------|-------|----------|
| HTTPS | Easy | Token each time or helper |
| SSH | Keys required | No password |

### Key Insight

> "Push is simple when your commits can be added to remote's history. When commits exist on remote that you don't have, you must pull and integrate first."

### Handling Rejection

1. Pull with rebase: `git pull --rebase`
2. Resolve conflicts
3. Push again: `git push`

### Confidence Check (1-5)

- [ ] Pushing to remote: ____
- [ ] Setting upstream: ____
- [ ] Handling rejections: ____
- [ ] Authentication methods: ____

### Tomorrow's Preview

Day 19: GitHub Setup & Pull Requests
- Fork repositories
- Create pull requests
- Code review
- GitHub collaboration workflow
