# Day 16 Reflections: Cloning & Fetching

## What I Learned Today

### Clone vs Fetch

| Aspect | Clone | Fetch |
|--------|-------|-------|
| When | First time getting repo | Ongoing updates |
| Scope | Entire repository | New commits only |
| Creates working directory | Yes | No |
| Sets up remote | Yes | No |

### Remote-tracking Branches

After `git fetch origin`:
```
Remote-tracking branches created:
- origin/main (copy of remote's main)
- origin/develop (copy of remote's develop)

Your local branches unchanged.
```

### Key Insight

> "Fetch is like downloading news about the remote without changing your local newspaper (working directory)."

### When to Use Each

- **Clone**: First time getting a repository
- **Fetch**: Update knowledge of remote changes
- **Pull**: Actually incorporate remote changes

### Confidence Check (1-5)

- [ ] Cloning repositories: ____
- [ ] Understanding fetch: ____
- [ ] Remote-tracking branches: ____
- [ ] Distinguishing fetch vs clone: ____

### Tomorrow's Preview

Day 17: Pulling & Merging
- `git pull` - Fetch and merge
- Rebase vs merge with pull
- Handling conflicts with pull
