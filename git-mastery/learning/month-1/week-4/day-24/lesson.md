# Day 24: Cherry-Picking

## Theory

### What is Cherry-Pick?

Cherry-pick applies a specific commit to your current branch. Unlike merge, it takes just ONE commit's changes.

```bash
git cherry-pick abc123
```

### When to Use Cherry-Pick

- **Backport fixes**: Apply bug fix to release branch
- **Selective merge**: Copy specific commits between branches
- **Recovery**: Restore a specific commit

### Cherry-Pick vs Merge

**Merge:** Brings in ALL commits from a branch

**Cherry-pick:** Brings in ONE specific commit

```
Before cherry-pick:
main:    A → B → C
                 ↓
feature:      D → E → F

After cherry-pick (D to main):
main:    A → B → C → D' (copy of D)
                 ↓
feature:      D → E → F
```

The commit gets a NEW hash because it's a new commit.

### Finding Commit to Cherry-Pick

```bash
# Find the commit hash
git log --oneline

# Cherry-pick it
git cherry-pick abc123

# Cherry-pick multiple
git cherry-pick abc123 def456
```

## Commands

```bash
git cherry-pick <commit>           # Cherry-pick single
git cherry-pick <commitA>..<commitB>  # Range
git cherry-pick --no-commit <commit>  # Apply without committing
git cherry-pick --abort            # Cancel
git cherry-pick --continue         # Continue after resolving
```

## Video References

- [Git Tutorial for Beginners: Branching](https://youtu.be/zTjRZNkhiEU)
- [Git & GitHub Tutorial - Branching](https://youtu.be/8JJ101D3knE)
- [Git Branches Tutorial](https://youtu.be/RGOj5yH7evk)

## Practice Exercises

### Exercise 1: Basic Cherry-Pick

1. Create commits on a branch
2. Switch to main
3. Cherry-pick one commit
4. Verify changes applied

### Exercise 2: Cherry-Pick Multiple

```bash
git cherry-pick abc123..def456
```

### Exercise 3: Handle Conflicts

1. Cherry-pick that conflicts
2. Resolve conflict
3. Continue

## Checklist

- [ ] I understand cherry-pick
- [ ] I can cherry-pick single commits
- [ ] I can cherry-pick ranges
- [ ] I can handle cherry-pick conflicts

## Navigation

← [Day 23: Interactive Rebase](../day-23/lesson.md) | [Day 25: Stashing Changes](../day-25/lesson.md) →
