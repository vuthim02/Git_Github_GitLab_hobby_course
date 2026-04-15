# Day 53: Worktrees

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          GIT MASTERY - DAY 53                                ║
║                           WORKTREES                                       ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

## Today's Objectives

- [ ] Use git worktree
- [ ] Work on multiple branches
- [ ] Use worktree for review

---

## Theory: Worktrees

### What is Worktree?

Worktree lets you work on multiple branches in the same repository:

```
repository/
├── .git
├── worktree-feature1/      ← Working on feature
├── worktree-feature2/      ← Working on feature2
└── main/                 ← Can continue
```

### Using Worktree

```bash
# Create worktree
git worktree add ../feature-branch feature

# List worktrees
git worktree list

# Remove worktree
git worktree remove ../feature-branch

# Prune deleted worktrees
git worktree prune
```

### Use Cases

1. **Review PR**: Check code in separate worktree
2. **Bugfix while coding**: Work on another branch
3. **Testing**: Test multiple branches

---

## Reading References

### Git SCM Documentation
- [Git Worktree](https://git-scm.com/docs/git-worktree)

## Checklist

- [ ] Create worktrees
- [ ] List worktrees
- [ ] Use for reviews