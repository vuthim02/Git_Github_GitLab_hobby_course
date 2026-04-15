# Day 23: Common Mistakes - Interactive Rebase

## Mistake 1: Saving Without Editing

**Wrong:** Opening editor and closing without changes

**Result:** Nothing happens, but that's fine.

## Mistake 2: Wrong Editor

**Problem:** Default editor might be unfamiliar

**Solution:**
```bash
git config --global core.editor "code --wait"
# or
git config --global core.editor "nano"
```

## Mistake 3: Forgetting to Save

**Wrong:** Editing but not saving

**Right:** Write and quit the editor.

## Mistake 4: Dropping Wrong Commit

**Problem:** Lost important changes

**Solution:**
```bash
git rebase --abort  # Cancel
# Or use reflog to recover
```

## Mistake 5: Breaking Repository

**Problem:** Conflicts during rebase

**Solution:**
```bash
# Resolve conflict
git add file.txt
git rebase --continue

# Or abort completely
git rebase --abort
```

## Common Interactive Commands

```
pick abc123  # Use this commit
squash def456  # Combine with previous
reword ghi789  # Change message
edit jkl012    # Stop here to edit
drop mno345    # Remove this commit
```

## Lesson Learned

> "Interactive rebase is powerful history editing. Always make sure commits aren't shared before rewriting."
