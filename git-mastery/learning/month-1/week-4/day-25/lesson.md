# Day 25: Stashing Changes

## Theory

### What is Stash?

Stash temporarily saves uncommitted changes. It's like a clipboard for changes.

```bash
git stash
```

This:
1. Saves your changes
2. Reverts working directory to last commit
3. Lets you switch branches or pull

### When to Use Stash

- Need to switch branches with uncommitted work
- Pull changes but have local changes
- Temporarily shelve changes for later

### Stash Workflow

```bash
# Working on feature...
git stash

# Now you can switch branches, pull, etc.
git switch other-branch
git pull

# Back to feature
git switch feature
git stash pop  # Apply and delete
```

### Stash vs Staging

- **Staging**: Prepares changes for commit
- **Stash**: Temporarily shelves changes

## Commands

```bash
git stash                     # Stash changes
git stash push               # Same, newer syntax
git stash push -m "message"  # With message
git stash pop                # Apply and delete
git stash apply              # Apply, keep in stash
git stash list               # List stashes
git stash show               # Show changes
git stash drop               # Delete stash
git stash clear              # Delete all
git stash -u                # Include untracked
git stash -p                # Interactive stash
```

## Video References

- [Git Tutorial for Beginners: Branching](https://youtu.be/zTjRZNkhiEU)
- [Git & GitHub Tutorial - Branching](https://youtu.be/8JJ101D3knE)
- [Git Branches Tutorial](https://youtu.be/RGOj5yH7evk)

## Practice Exercises

### Exercise 1: Basic Stash

1. Make changes without committing
2. `git stash`
3. See clean working directory
4. `git stash pop`
5. Changes restored

### Exercise 2: Multiple Stashes

```bash
git stash push -m "Work in progress A"
# Make more changes
git stash push -m "Work in progress B"
git stash list
git stash pop  # Most recent
```

### Exercise 3: Stash Specific Files

```bash
git stash push file1.txt file2.txt
```

## Checklist

- [ ] I understand git stash
- [ ] I can stash changes
- [ ] I can apply stashes
- [ ] I can manage multiple stashes
- [ ] I understand pop vs apply

## Navigation

← [Day 24: Cherry-Picking](../day-24/lesson.md) | [Day 26: Reset vs Revert](../day-26/lesson.md) →
