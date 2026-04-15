# Day 25: Common Mistakes - Stashing Changes

## Mistake 1: Forgetting What's in Stash

**Problem:** Lost track of stash contents

**Solution:**
```bash
git stash list        # See all
git stash show        # Show latest
git stash show -p     # Show diff
git stash show stash@{1}  # Specific
```

## Mistake 2: Stash Pop vs Apply Confusion

**Question:** Which should I use?

**Answer:**
- `git stash pop` - When you don't need the stash anymore
- `git stash apply` - When you might need it again

## Mistake 3: Forgetting Untracked Files

**Problem:** New files not in stash by default

**Solution:**
```bash
git stash -u        # Include untracked
git stash -a        # Include ignored too
```

## Mistake 4: Stash Pile-Up

**Problem:** Too many stashes, lost track

**Solution:**
```bash
git stash drop stash@{5}  # Delete specific
git stash clear          # Delete all
```

## Mistake 5: Conflict When Applying Stash

**Problem:** Stash conflicts with current state

**Solution:**
```bash
# Resolve conflict
git add file.txt
git stash drop  # After applying
# or
git stash continue
```

## Lesson Learned

> "Stash is a temporary shelf for changes. Pop removes from shelf, apply keeps it there."
