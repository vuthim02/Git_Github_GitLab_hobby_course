# Day 22 Exercises: Rebase Fundamentals

## Exercise 1: Compare Merge and Rebase

Create the same scenario twice:

**Try 1: Merge**
1. Branch from main
2. Add commits to branch
3. Also add commits to main
4. Merge branch into main
5. Note history with `git log --graph`

**Try 2: Rebase**
1. Reset to clean state
2. Branch from main
3. Add commits to branch
4. Also add commits to main
5. Rebase branch onto main
6. Note linear history

## Exercise 2: Basic Rebase

```bash
git checkout -b test-branch
# Make 2-3 commits
git rebase main
git log --graph --oneline
```

## Exercise 3: Rebase Conflicts

1. Create conflicting changes
2. Start rebase
3. Resolve conflict
4. Continue rebase

```bash
git rebase --continue
git rebase --abort  # If too messy
```

## Exercise 4: Rebase onto Different Branch

```bash
git rebase develop
# Rebase current branch onto develop
```

## Challenge

Demonstrate rebase cleanup:
1. Create messy branch with multiple commits
2. Rebase to clean it up
3. Show before and after history
