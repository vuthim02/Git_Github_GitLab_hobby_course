# Day 27: Reflog & Recovery

## Theory

### What is Reflog?

Reflog (Reference Log) records every time HEAD moves. It's your safety net for recovering from mistakes.

```bash
git reflog
```

### Why Reflog Matters

Even when commits seem lost:
- After hard reset
- After rebasing
- After accidental branch deletion
- After merge gone wrong

Reflog saves everything!

### Reflog Entries

```
abc123 HEAD@{0}: commit: Add feature
def456 HEAD@{1}: rebase: onto main
ghi789 HEAD@{2}: checkout: moving from main to feature
```

Each entry shows:
- Commit/ref
- Action that moved HEAD
- Timestamp

### Recovery Examples

```bash
# Recover from hard reset
git reflog
git reset --hard HEAD@{1}

# Recover deleted branch
git reflog
git checkout -b recovered-branch abc123

# Find lost commit
git reflog
git show abc123
```

### Reflog Retention

- Default: 90 days for reachable commits
- Pruned automatically
- Local only (not shared)

## Commands

```bash
git reflog                 # HEAD history
git reflog show main      # main branch history
git reflog expire          # Prune old entries
git log --walk-reflogs    # Alternative view
```

## Video References

- [Git Tutorial for Beginners: Branching](https://youtu.be/zTjRZNkhiEU)
- [Git & GitHub Tutorial - Branching](https://youtu.be/8JJ101D3knE)
- [Git Branches Tutorial](https://youtu.be/RGOj5yH7evk)

## Practice Exercises

### Exercise 1: View Reflog

```bash
git reflog
git reflog --date=relative
```

### Exercise 2: Recover from Reset

1. Make commits
2. Hard reset
3. Find in reflog
4. Recover

### Exercise 3: Recover Deleted Branch

1. Create branch, add commits
2. Delete branch
3. Find in reflog
4. Recreate

## Checklist

- [ ] I understand git reflog
- [ ] I can view reflog entries
- [ ] I can recover from mistakes
- [ ] I can recover deleted branches

## Navigation

← [Day 26: Reset vs Revert](../day-26/lesson.md) | [Day 28: Week 4 & Month 1 Review](../day-28/lesson.md) →
