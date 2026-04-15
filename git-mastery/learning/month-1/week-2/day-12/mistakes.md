# Day 12: Common Mistakes - Resolving Merge Conflicts

## Mistake 1: Forgetting to Remove Conflict Markers

**Wrong:** Leaving `<<<<<<< HEAD` in the file

**Right:** Always remove all three marker lines:
```html
<<<<<<< HEAD
Your content
=======
Their content
>>>>>>> branch
```

Edit to just the final content.

## Mistake 2: Committing Without Staging

**Wrong:**
```bash
# Edited file
git commit  # Forgot to add!
```

**Right:**
```bash
git add file.txt
git commit
```

## Mistake 3: Abort Confusion

**Question:** When should you abort a merge?

**Answer:** When conflicts are too complex to resolve manually. You can always retry later.

## Mistake 4: Choosing Wrong Version

**Question:** What does `--ours` mean?

**Answer:** It depends on which branch you're on!
- `--ours` = current branch (where you are)
- `--theirs` = branch you're merging in

## Mistake 5: Panic at Conflicts

**Wrong:** Thinking conflicts are errors

**Right:** Conflicts are normal when merging overlapping changes

## Lesson Learned

> "Conflicts are just Git asking for help deciding. You're in control - just edit the file to what it should be."

## Recovery

```bash
# If things go wrong
git merge --abort  # Start over
git reflog         # Find previous state
```
