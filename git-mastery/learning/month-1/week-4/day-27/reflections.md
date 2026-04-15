# Day 27 Reflections: Reflog & Recovery

## What I Learned Today

### Reflog Concept

Reflog = Reference Log
- Records every HEAD movement
- Your safety net
- Local only
- Auto-pruned after 90 days

### Format

```
HEAD@{0}: commit: Add feature
HEAD@{1}: rebase: onto main
HEAD@{2}: checkout: moving from main to feature
```

### Recovery Commands

```bash
git reflog                    # View
git reset --hard HEAD@{n}    # Recover state
git checkout -b branch @{n}  # Recover branch
```

### Key Insight

> "If Git did it, reflog remembers. Even after hard reset, rebase, or branch deletion, your work is in reflog (for a while)."

### When to Use

1. After accidental reset
2. After bad rebase
3. After deleted branch
4. To find lost commits

### Confidence Check (1-5)

- [ ] Understanding reflog: ____
- [ ] Viewing reflog: ____
- [ ] Recovering commits: ____
- [ ] Recovery patterns: ____

### Tomorrow's Preview

Day 28: Week 4 & Month 1 Review
- Complete review of advanced Git
- Month 1 summary
- Next steps
