# Day 24: Common Mistakes - Cherry-Picking

## Mistake 1: Cherry-Picking to Wrong Branch

**Wrong:** Forgetting which branch you're on

**Right:** Always check current branch:
```bash
git branch  # Check * marker
git cherry-pick commit
```

## Mistake 2: Cherry-Pick Creates Duplicate Commits

**Understanding:** Cherry-pick creates NEW commits

**If you cherry-pick the same commit twice:**
```
main: A → B → C → D (copy 1) → E (copy 2)
```

**Solution:** If you need the original commit, merge instead.

## Mistake 3: Not Understanding Range Syntax

**Question:** What does A..B mean?

**Answer:** Commits reachable from B but not A (excluding A)

```bash
git cherry-pick abc123..def456
# Gets: def456 and commits after abc123
# Does NOT get: abc123
```

## Mistake 4: Cherry-Pick vs Revert Confusion

**Cherry-pick:** Apply commit's changes
**Revert:** Create new commit that undoes changes

## Lesson Learned

> "Cherry-pick copies a commit's changes to your current branch. The commit gets a new hash because it's a new commit."

## Quick Reference

```bash
git cherry-pick abc123        # Single
git cherry-pick abc..xyz     # Range
git cherry-pick --no-commit  # Stage only
```
