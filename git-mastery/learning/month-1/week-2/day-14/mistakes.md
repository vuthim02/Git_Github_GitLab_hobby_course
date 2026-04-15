# Day 14: Common Mistakes - Week 2 Review

## Quick Reference of Common Mistakes

### Branching
- Forgetting which branch you're on
- Not using `-c` with `git switch` for new branches
- Confusing local and remote branches

### Merging
- Merging from wrong branch
- Trying to merge dirty working directory
- Forgetting fast-forward vs three-way difference

### Conflicts
- Leaving conflict markers in file
- Forgetting to `git add` after resolving
- Panicking at conflict messages

### HEAD
- Making commits in detached HEAD without saving
- Not understanding HEAD~ notation
- Forgetting reflog exists for recovery

## Most Important Lesson

> "Branches are just pointers. HEAD is just a pointer to a pointer. Everything in Git is references to commits."

## Memory Aid

```
HEAD → Branch → Commit
 |       |
 |       └── refs/heads/main
 |
 └── refs/heads/feature
```

## Week 2 Trophy

After completing Week 2, you can:
- [ ] Create and manage branches
- [ ] Switch between branches
- [ ] Understand HEAD
- [ ] Perform merges
- [ ] Resolve conflicts
- [ ] Choose appropriate workflows

Congratulations on mastering Git branching!
