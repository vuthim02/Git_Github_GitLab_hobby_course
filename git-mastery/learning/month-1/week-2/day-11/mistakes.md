# Day 11: Common Mistakes - Merging Basics

## Mistake 1: Merging From the Wrong Branch

**Wrong:**
```bash
git checkout feature
git merge main
# Merged main INTO feature (opposite of intended)
```

**Right:**
```bash
git checkout main
git merge feature
# Merged feature INTO main (correct)
```

Remember: You merge INTO the current branch.

## Mistake 2: Not Checking Current Branch

**Wrong:** Assumptions about where you are

**Right:** Always verify
```bash
git branch  # Check * marker
git status  # Also shows current branch
```

## Mistake 3: Merging Dirty Working Directory

**Wrong:**
```bash
# Uncommitted changes exist
git merge other-branch
# Might cause issues
```

**Right:** Commit or stash first
```bash
git stash
git merge other-branch
git stash pop
```

## Mistake 4: Confusing Merge Direction

**Mental Model:**
```
You are at Branch A
You run: git merge Branch B

Result: Branch B's changes come INTO Branch A
```

Current branch receives the changes.

## Mistake 5: Forgetting --no-ff

**Question:** When might you want to force a merge commit?

**Answer:** To preserve the branch structure in history

## Lesson Learned

> "Merging brings changes from one branch INTO the current branch. You are the destination."

## Quick Reference

```bash
# Always check first
git branch

# Then merge
git merge source-branch
# Source → Destination (current)
```
