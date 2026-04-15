# Day 26: Reset vs Revert

## Theory

### Git Reset

Reset moves the branch pointer backward. It "un-commits" commits.

```bash
git reset HEAD~1        # Undo last commit
git reset --soft HEAD~1 # Keep changes staged
git reset --mixed HEAD~1 # Keep changes unstaged (default)
git reset --hard HEAD~1 # Delete changes (dangerous!)
```

### Three Modes

| Mode | HEAD | Staging | Working Dir |
|------|------|---------|-------------|
| `--soft` | Move | Keep staged | Keep changes |
| `--mixed` | Move | Unstage | Keep changes |
| `--hard` | Move | Delete | Delete changes |

### Git Revert

Revert creates a NEW commit that undoes previous changes. It's safe for shared history.

```bash
git revert HEAD        # Undo last commit
git revert abc123     # Undo specific commit
```

### Reset vs Revert

| Aspect | Reset | Revert |
|--------|-------|--------|
| History | Rewrites | Adds to history |
| Safe for shared | No | Yes |
| Creates commit | No | Yes |
| Use when | Local only | Already pushed |

### When to Use Each

**Use Reset:**
- Local commits not pushed
- Undo staging mistakes
- Local branch cleanup

**Use Revert:**
- Commits already pushed
- Need to preserve history
- Collaborative branches

## Commands

```bash
git reset HEAD~1           # Mixed (default)
git reset --soft HEAD~1    # Soft reset
git reset --hard HEAD~1    # Hard reset
git revert HEAD            # Revert last commit
git revert abc123..def456  # Revert range
```

## Video References

- [Git Tutorial for Beginners: Branching](https://youtu.be/zTjRZNkhiEU)
- [Git & GitHub Tutorial - Branching](https://youtu.be/8JJ101D3knE)
- [Git Branches Tutorial](https://youtu.be/RGOj5yH7evk)

## Practice Exercises

### Exercise 1: Soft Reset

```bash
git commit -m "Mistake"
git reset --soft HEAD~1
git status  # Changes still staged
```

### Exercise 2: Mixed Reset

```bash
git commit -m "Mistake"
git reset HEAD~1
git status  # Changes unstaged
```

### Exercise 3: Hard Reset (Careful!)

```bash
git commit -m "Mistake"
git reset --hard HEAD~1
git status  # Clean
# Changes GONE!
```

### Exercise 4: Revert

```bash
git revert HEAD
# New commit created
git log
```

## Checklist

- [ ] I understand git reset modes
- [ ] I can use soft, mixed, hard reset
- [ ] I understand git revert
- [ ] I know when to use each
- [ ] I can recover from mistakes

## Navigation

← [Day 25: Stashing Changes](../day-25/lesson.md) | [Day 27: Reflog & Recovery](../day-27/lesson.md) →
