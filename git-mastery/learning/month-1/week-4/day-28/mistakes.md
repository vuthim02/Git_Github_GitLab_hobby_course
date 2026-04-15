# Day 28: Common Mistakes - Month 1 Review

## Month 1 Common Mistakes Summary

### Branching
- Forgetting which branch you're on
- Switching with dirty working directory
- Forcing pushes to shared branches

### Merging
- Merging from wrong branch
- Forgetting to resolve conflicts
- Deleting branches before merging

### Remotes
- Not adding upstream remote
- Pushing without setting upstream
- Ignoring rejected pushes

### Advanced
- Rebasing pushed commits
- Hard resetting shared branches
- Losing stash contents
- Forgetting reflog exists

## Golden Rules

1. **Rebase**: Never rebase pushed commits
2. **Reset**: Never hard reset shared branches
3. **Push**: Always pull before pushing
4. **Recovery**: When in doubt, check reflog

## Commands to Remember

```bash
# When lost
git reflog

# When stuck
git status
git diff

# When mistakes made
git reset --soft HEAD~1  # Undo commit
git reset --hard HEAD@{1} # Recover
git revert HEAD          # Safe undo
```

## You've Come a Long Way!

From knowing nothing about Git to mastering:
- Branches
- Merges
- Remotes
- Rebasing
- Recovery

**Congratulations on completing Month 1!**
