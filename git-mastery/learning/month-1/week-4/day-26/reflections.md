# Day 26 Reflections: Reset vs Revert

## What I Learned Today

### Reset Modes

| Mode | Staged | Working Dir |
|------|--------|-------------|
| soft | Yes | Yes |
| mixed | No | Yes |
| hard | No | No |

### Reset vs Revert

| Aspect | Reset | Revert |
|--------|-------|--------|
| History | Rewrites | Safe |
| Creates commit | No | Yes |
| Local | Yes | Yes |
| Shared | No | Yes |

### Commands

```bash
git reset --soft HEAD~1  # Keep staged
git reset HEAD~1         # Keep unstaged (default)
git reset --hard HEAD~1  # Delete everything
git revert HEAD          # Safe undo
```

### Key Insight

> "Reset is local and destructive. Revert is shared and safe. Choose based on whether commits are public."

### When to Use

**Reset:**
- Local commits not pushed
- Undo staging mistakes
- Amend staged changes

**Revert:**
- Already pushed commits
- Need audit trail
- Team collaboration

### Confidence Check (1-5)

- [ ] Understanding modes: ____
- [ ] Using reset: ____
- [ ] Using revert: ____
- [ ] Safety awareness: ____

### Tomorrow's Preview

Day 27: Reflog & Recovery
- Your safety net
- Recovering lost commits
- Finding deleted branches
- Time-travel with reflog
