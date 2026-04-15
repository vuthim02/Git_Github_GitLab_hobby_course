# Day 22: Rebase Fundamentals

## Theory

### What is Rebase?

Rebase moves or combines commits to a new base. Instead of merging, you "replay" commits on top of another point.

### Merge vs Rebase

**Merge:**
```
A → B → C → M (merge commit)
      ↘     ↗
        D → E
```

**Rebase:**
```
A → B → C → D' → E' (rewritten)
```

Same changes, but linear history.

### The Rebase Command

```bash
# Rebase current branch onto another
git rebase main

# Rebase feature onto main
git checkout feature
git rebase main
```

### Step-by-Step Rebase

```
Before rebase:
main:    A → B → C
                 ↓
feature:       D → E

After git checkout feature && git rebase main:

main:    A → B → C
                 ↓
feature:       D' → E' (replayed)
```

Git:
1. Finds common ancestor (C)
2. Saves feature commits (D, E)
3. Resets feature to main (C)
4. Replays D on C → D'
5. Replays E on D' → E'

### When to Rebase

**Use Rebase:**
- Local branches not pushed
- Private branches
- Want linear history

**Never Rebase:**
- Public/shared branches
- Commits others have based work on

## Commands

```bash
git rebase main           # Rebase onto main
git rebase -i HEAD~3     # Interactive, last 3 commits
git rebase --continue    # Continue after resolving
git rebase --abort       # Cancel rebase
git rebase --skip        # Skip conflicting commit
```

## Video References

- [Git Tutorial for Beginners: Branching](https://youtu.be/zTjRZNkhiEU)
- [Git & GitHub Tutorial - Branching](https://youtu.be/8JJ101D3knE)
- [Git Branches Tutorial](https://youtu.be/RGOj5yH7evk)

## Practice Exercises

### Exercise 1: Basic Rebase

1. Create commits on main
2. Create branch, add commits
3. Rebase branch onto main
4. Compare histories

### Exercise 2: Resolve Conflicts During Rebase

1. Start rebase that causes conflict
2. Resolve conflict
3. `git add file`
4. `git rebase --continue`

## Checklist

- [ ] I understand what rebase does
- [ ] I can perform basic rebase
- [ ] I understand merge vs rebase
- [ ] I know when to use rebase
- [ ] I can resolve rebase conflicts

## Navigation

← [Day 21: Week 3 Review](../week-3/day-21/lesson.md) | [Day 23: Interactive Rebase](../day-23/lesson.md) →
