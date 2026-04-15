# Day 17 Reflections: Pulling & Merging

## What I Learned Today

### Pull = Fetch + Merge

```bash
git pull = git fetch + git merge
git pull --rebase = git fetch + git rebase
```

### Rebase vs Merge Pull

| Approach | Pros | Cons |
|----------|------|------|
| Merge | Accurate history | Complex graph |
| Rebase | Linear history | Rewrites commits |

### When to Use Each

**Use Rebase:**
- Local-only commits
- Private branches
- Clean feature branches

**Use Merge:**
- Public/shared branches
- Team prefers full history
- Release branches

### Key Insight

> "Pull combines fetch and integrate. The integrate step can be merge or rebase."

### Confidence Check (1-5)

- [ ] Using git pull: ____
- [ ] Understanding pull types: ____
- [ ] Resolving pull conflicts: ____
- [ ] Choosing rebase vs merge: ____

### Tomorrow's Preview

Day 18: Pushing & Authentication
- `git push` - Upload commits
- SSH keys setup
- HTTPS tokens
- Push rejected? Handle it!
