# Day 25 Exercises: Stashing Changes

## Exercise 1: Basic Stash

1. Make changes to a file
2. Run `git stash`
3. Check `git status`
4. Run `git stash pop`
5. Verify changes restored

## Exercise 2: Stash with Message

```bash
git stash push -m "Fixing login bug"
git stash list
```

## Exercise 3: Multiple Stashes

Create 3 stashes:
```bash
git stash push -m "First"
git stash push -m "Second"
git stash push -m "Third"
git stash list
```

Apply specific stash:
```bash
git stash list
git stash apply stash@{2}
```

## Exercise 4: Stash Untracked Files

```bash
git stash -u
# Includes new files
```

## Exercise 5: Stash Specific Files

```bash
git stash push file1.txt file2.txt
```

## Challenge

Complete this workflow:
1. Make changes
2. Need to pull
3. Stash
4. Pull
5. Apply stash
6. Handle any conflicts
