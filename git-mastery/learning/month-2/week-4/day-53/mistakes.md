# Day 53: Common Mistakes - Worktrees

## Mistake 1: Same Branch in Multiple Worktrees

**Problem:**
```bash
git worktree add ../wt1 feature
git worktree add ../wt2 feature  # ERROR!
```

**Solution:**
- Use different branches
- Only one worktree per branch

---

## Mistake 2: Forgetting to Clean Up

**Problem:**
Many old worktrees piling up

**Solution:**
```bash
git worktree prune  # Clean stale worktrees
git worktree list   # See all worktrees
git worktree remove ../old-worktree  # Remove specific one
```

---

## Mistake 3: Working on Same File in Multiple Worktrees

**Problem:**
Merge conflicts when pulling changes

**Solution:**
- Be organized
- Close worktree before major operations
- Pull before switching

---

## Lesson Learned

> "Worktrees let you be in multiple places at once. Use them when you need context switching without stashing."

**Key Points:**
1. One worktree per branch
2. Clean up when done
3. Great for PR reviews
