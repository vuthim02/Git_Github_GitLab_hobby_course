# Day 23 Exercises: Interactive Rebase

## Exercise 1: Squash Commits

Create 3 commits:
```bash
git commit -m "WIP feature part 1"
git commit -m "WIP feature part 2"
git commit -m "WIP feature part 3"
```

Then squash into one:
```bash
git rebase -i HEAD~3
# Change to:
# pick abc123 WIP feature part 1
# squash def456 WIP feature part 2
# squash ghi789 WIP feature part 3
```

## Exercise 2: Fixup (Discard Message)

```bash
git rebase -i HEAD~3
# Use fixup instead of squash:
# pick abc123 WIP feature part 1
# f def456 WIP feature part 2
# f ghi789 WIP feature part 3
```

## Exercise 3: Reorder Commits

```bash
git rebase -i HEAD~3
# Simply reorder the lines
# Then save
```

## Exercise 4: Change Commit Message

```bash
git rebase -i HEAD~1
# Change 'pick' to 'reword'
# Save, then edit message
```

## Exercise 5: Drop a Commit

```bash
git rebase -i HEAD~3
# Change 'pick' to 'drop' on commit to remove
```

## Challenge

Clean up a messy branch:
1. 5 commits with bad messages
2. Squash into 2 meaningful commits
3. Rewrite messages to be clear
