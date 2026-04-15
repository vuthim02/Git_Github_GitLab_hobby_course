# Day 26: Common Mistakes - Reset vs Revert

## Mistake 1: Hard Resetting Pushed Commits

**Wrong:**
```bash
git push
git reset --hard HEAD~1
git push --force
# Lost remote commit!
```

**Right:** Never hard reset pushed commits. Use revert.

## Mistake 2: Forgetting Hard Reset is Destructive

**Question:** What's the difference?

```bash
git reset --soft HEAD~1  # Safe: changes staged
git reset --hard HEAD~1  # DANGEROUS: changes deleted!
```

## Mistake 3: Not Understanding Mixed Reset

**Question:** What's the default?

**Answer:** `--mixed` (or no flag):
```bash
git reset HEAD~1    # Same as --mixed
git reset --mixed HEAD~1
```

Changes become unstaged.

## Mistake 4: Revert vs Reset Confusion

| Reset | Revert |
|-------|--------|
| Removes commit | Adds new commit |
| Rewrites history | Preserves history |
| Local only | Safe for shared |

## Lesson Learned

> "Reset rewrites history. Revert adds to history. Use reset locally, revert on shared branches."

## Recovery

If you made a mistake:
```bash
git reflog  # Find previous state
git reset --hard HEAD@{1}  # Recover
```
