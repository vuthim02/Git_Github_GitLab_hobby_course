# Day 24 Reflections: Cherry-Picking

## What I Learned Today

### Cherry-Pick Concept

Cherry-pick applies ONE commit's changes to current branch.

```
feature:  A → B → C → D
                          ↓
main:     A → B → C'     (C cherry-picked)
```

### vs Merge

| Merge | Cherry-Pick |
|-------|-------------|
| All commits | One commit |
| Preserves history | Copies changes |
| Creates merge commit | Creates regular commit |

### Commands

```bash
git cherry-pick <hash>      # Single commit
git cherry-pick A..B       # Range
git cherry-pick --no-commit # Stage only
```

### Key Insight

> "Cherry-pick copies changes, not commits. The new commit has different hash but same changes."

### Use Cases

1. Backporting fixes to release branch
2. Selecting specific commits to apply
3. Recovering commits from wrong branch

### Confidence Check (1-5)

- [ ] Understanding cherry-pick: ____
- [ ] Using cherry-pick: ____
- [ ] Finding commits: ____
- [ ] Handling conflicts: ____

### Tomorrow's Preview

Day 25: Stashing Changes
- `git stash` - Save work temporarily
- Multiple stashes
- Apply vs pop
- Stash with message
