# Day 22: Common Mistakes - Rebase Fundamentals

## Mistake 1: Rebasing Pushed Commits

**Wrong:**
```bash
git push
git rebase main
git push --force  # Colleagues' work broken!
```

**Right:** Only rebase local, unpushed commits.

## Mistake 2: Not Understanding What Rebase Does

**Wrong:** Thinking rebasing moves the branch

**Reality:** Rebase replays commits on new base:
```
Before: C → D → E (on feature, from B)
After:  C → D' → E' (replayed from C)
```

## Mistake 3: Panic at Conflict During Rebase

**Wrong:** Abandoning the process

**Right:** Resolve and continue:
```bash
# Edit file to resolve
git add file.txt
git rebase --continue
# Or abort
git rebase --abort
```

## Mistake 4: Confusing Rebase Direction

**Question:** What does `git rebase main` do?

**Answer:** Rebases current branch ONTO main.

```bash
git checkout feature
git rebase main
# feature is now based on main
```

## Mistake 5: Forgetting the Golden Rule

> "Never rebase commits that have been pushed to a shared repository."

## Lesson Learned

> "Rebase rewrites history to make it linear. It's powerful but dangerous on shared branches."
