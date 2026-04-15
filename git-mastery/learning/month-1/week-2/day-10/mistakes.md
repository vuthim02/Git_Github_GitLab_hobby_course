# Day 10: Common Mistakes - Understanding HEAD

## Mistake 1: Panic at "Detached HEAD" Warning

**Wrong:** Thinking something is broken when you see the warning

**Right:** Detached HEAD is normal and intentional

The warning just means: "Your commits won't be saved unless you create a branch"

## Mistake 2: Making Commits in Detached HEAD Without Saving

**Wrong:** Detached commits are lost
```
git checkout abc123
# Make commits
# Switch to main
# Those commits are now orphaned!
```

**Right:** Create a branch immediately
```
git checkout abc123
git switch -c save-branch  # Create branch first
# Make commits - they're safe now
```

## Mistake 3: Confusing HEAD with Branch Names

**Wrong:** Thinking HEAD and branch are the same thing

**Right:** HEAD points to a branch (or commit)
```
HEAD → main → abc123
```

HEAD is the pointer to the pointer.

## Mistake 4: Using HEAD~ Without Understanding It

**Wrong:** `HEAD~3` means "third commit back" for ANY branch

**Right:** Count from the current HEAD position
```
HEAD~1 = previous commit
HEAD~2 = two commits before HEAD
HEAD~3 = three commits before HEAD
```

## Mistake 5: Forgetting Reflog Exists

**Wrong:** Thinking commits are truly lost

**Right:** Reflog saves everything
```bash
git reflog  # Shows all HEAD movements
git checkout HEAD@{5}  # Go back to 5 moves ago
```

## Lesson Learned

> "HEAD is just Git's way of saying 'here'. It's a pointer to your current location, whether on a branch or at a specific commit."

Reflog is your safety net - Git remembers where you've been.
