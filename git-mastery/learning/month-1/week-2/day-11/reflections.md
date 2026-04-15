# Day 11 Reflections: Merging Basics

## What I Learned Today

### Types of Merges

1. **Fast-Forward**: No divergence, just move pointer
2. **Three-Way**: Divergence exists, Git creates merge commit

### Visual Comparison

```
FAST-FORWARD:          THREE-WAY:
A → B → C → D           A → B → C → F
      ↑                ↑     ↘   ↗
      feature          main  D → E
```

### Commands

```bash
git merge branch          # Basic merge
git merge --no-ff branch  # Force merge commit
git merge --abort         # Cancel merge
```

### Key Insight

> "Fast-forward happens when the target branch has no commits ahead of the base. Three-way happens when both branches made changes."

### Merge Commit Properties

- Two parents (normally)
- Auto-generated message
- Preserves branch history
- Acts as connection point

### Confidence Check (1-5)

- [ ] Understanding merge types: ____
- [ ] Performing merges: ____
- [ ] Identifying merge commits: ____
- [ ] Using --no-ff flag: ____

### Tomorrow's Preview

Day 12: Resolving Merge Conflicts
- What are merge conflicts?
- How to identify conflicts
- Manual resolution
- Abort vs resolve
