# Day 11 Checklist: Merging Basics

## Pre-Merge Checklist

- [ ] Working on the correct branch
- [ ] Target branch is clean (committed changes)
- [ ] Know which branch you're merging into current

## Merge Commands

```bash
git merge branch-name           # Merge into current
git merge feature --no-ff       # Force merge commit
git merge --squash feature      # Squash commits
git merge --abort               # Cancel in-progress merge
```

## Post-Merge Verification

- [ ] Check `git log --graph --oneline`
- [ ] Verify branch pointer moved
- [ ] Check for merge commit
- [ ] Verify files are correct

## Merge Types to Recognize

### Fast-Forward
- [ ] Target branch has no new commits
- [ ] No merge commit created
- [ ] Just pointer movement

### Three-Way
- [ ] Branches have diverged
- [ ] Merge commit created
- [ ] Two parents in commit

## Error Prevention

- [ ] Never merge into a dirty working directory
- [ ] Always check which branch you're on
- [ ] Understand what you're merging

## Post-Lesson

- [ ] Completed all exercises
- [ ] Can perform fast-forward merge
- [ ] Can perform three-way merge
- [ ] Can visualize merge history
- [ ] Ready for Day 12: Merge Conflicts
