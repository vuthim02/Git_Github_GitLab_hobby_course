# Day 27 Exercises: Reflog & Recovery

## Exercise 1: View Reflog

```bash
git reflog
git reflog -10
git reflog --date=relative
```

Understand the format:
- Commit hash
- HEAD@{n} notation
- Action description
- Timestamp

## Exercise 2: Recover from Hard Reset

1. Create repository with several commits
2. Run `git reset --hard HEAD~2`
3. View reflog
4. Recover to previous state

```bash
git reflog
git reset --hard HEAD@{1}
```

## Exercise 3: Recover Deleted Branch

1. Create and switch to branch
2. Add commits
3. Switch to main
4. Delete the branch
5. Find in reflog
6. Recreate branch

```bash
git reflog
git checkout -b recovered abc123
```

## Exercise 4: Time Travel

Use reflog to:
1. Find when you made a mistake
2. Check that state with `git checkout HEAD@{n}`
3. Compare to current state

## Challenge

Create a "disaster recovery" scenario:
1. Multiple commits
2. Reset to old state
3. Rebase
4. Merge wrong branch
5. Use reflog to fix everything
