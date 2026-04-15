# Day 23: Interactive Rebase

## Theory

### What is Interactive Rebase?

Interactive rebase (`git rebase -i`) gives you control over how commits are replayed. You can edit, reorder, combine, or delete commits.

```bash
git rebase -i HEAD~3
```

### Interactive Editor

When you run interactive rebase, an editor opens with:

```bash
pick abc123 Commit message 1
pick def456 Commit message 2
pick ghi789 Commit message 3
```

### Commands

| Command | Shortcut | Description |
|---------|----------|-------------|
| pick | p | Use commit as-is |
| reword | r | Change commit message |
| edit | e | Stop and edit files |
| squash | s | Combine with previous |
| fixup | f | Like squash, discard message |
| drop | d | Remove commit |

### Squashing Commits

```bash
pick abc123 Add feature
pick def456 Fix typo
pick ghi789 Fix another typo
```

Change to:
```bash
pick abc123 Add feature
squash def456 Fix typo
squash ghi789 Fix another typo
```

Result: One commit with all changes.

### Reordering Commits

Change order in editor:
```bash
pick abc123 Third commit
pick def456 First commit
pick ghi789 Second commit
```

### Splitting Commits

1. Mark commit as `edit`
2. Git stops at that commit
3. Reset the commit: `git reset HEAD~1`
4. Make multiple smaller commits

## Commands

```bash
git rebase -i HEAD~3      # Interactive, last 3 commits
git rebase -i --root     # Include initial commit
git rebase -i main       # All commits since main
```

## Video References

- [Git Tutorial for Beginners: Branching](https://youtu.be/zTjRZNkhiEU)
- [Git & GitHub Tutorial - Branching](https://youtu.be/8JJ101D3knE)
- [Git Branches Tutorial](https://youtu.be/RGOj5yH7evk)

## Practice Exercises

### Exercise 1: Squash Commits

1. Make 3 commits
2. Run `git rebase -i HEAD~3`
3. Squash all into one
4. Verify single commit

### Exercise 2: Reorder Commits

1. Make 3 commits in order A, B, C
2. Interactive rebase
3. Reorder to C, B, A
4. Verify new order

### Exercise 3: Edit Commit Messages

1. Run `git rebase -i`
2. Change `pick` to `reword` on a commit
3. Change the message
4. Verify change

## Checklist

- [ ] I understand interactive rebase
- [ ] I can squash commits
- [ ] I can reorder commits
- [ ] I can edit commit messages
- [ ] I can split commits

## Navigation

← [Day 22: Rebase Fundamentals](../day-22/lesson.md) | [Day 24: Cherry-Picking](../day-24/lesson.md) →
