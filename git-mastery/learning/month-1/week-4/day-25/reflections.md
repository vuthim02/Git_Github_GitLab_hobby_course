# Day 25 Reflections: Stashing Changes

## What I Learned Today

### Stash Concept

Stash temporarily saves uncommitted changes:
```
Working dir → Stash → Clean working dir
                             ↓
              ← Stash pop/apply ←
```

### Commands

```bash
git stash push -m "message"  # Save
git stash pop                 # Apply + delete
git stash apply               # Apply + keep
git stash list               # List
git stash drop               # Delete
```

### vs Other Commands

| Command | Purpose |
|---------|---------|
| stash | Temporarily save |
| commit | Permanently save |
| reset | Undo staging |

### Key Insight

> "Stash is like a clipboard for Git. You copy changes there, switch context, then paste them back."

### Use Cases

1. Switch branches with dirty working directory
2. Pull without committing
3. Temporarily test something else
4. Save work-in-progress

### Confidence Check (1-5)

- [ ] Understanding stash: ____
- [ ] Using stash: ____
- [ ] Managing stashes: ____
- [ ] Resolving conflicts: ____

### Tomorrow's Preview

Day 26: Reset vs Revert
- Undoing commits
- Soft, mixed, hard reset
- When to use which
- Safety comparison
