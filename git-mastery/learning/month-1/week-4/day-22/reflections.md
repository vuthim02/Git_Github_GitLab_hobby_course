# Day 22 Reflections: Rebase Fundamentals

## What I Learned Today

### Rebase Concept

```
Before:                    After:
A → B → C                  A → B → C → D' → E'
      ↓                         ↑
      D → E               feature (replayed)
      ↑
      feature
```

### Merge vs Rebase

| Merge | Rebase |
|-------|--------|
| Preserves history | Rewrites history |
| Branching graph | Linear graph |
| Creates merge commit | No merge commit |

### Commands

```bash
git rebase main           # Rebase onto main
git rebase --continue     # After resolving
git rebase --abort        # Cancel
git rebase --skip         # Skip
```

### Key Insight

> "Rebase replays your commits on top of a new base. The commits get new hashes because they're new commits."

### When to Rebase

**Good:**
- Local commits
- Private branches
- Before merge to clean up

**Bad:**
- Public branches
- Shared commits
- After pushing

### Confidence Check (1-5)

- [ ] Understanding rebase: ____
- [ ] Performing rebase: ____
- [ ] Merge vs rebase: ____
- [ ] Handling conflicts: ____

### Tomorrow's Preview

Day 23: Interactive Rebase
- Edit commits
- Reorder commits
- Squash commits
- Split commits
- Drop commits
