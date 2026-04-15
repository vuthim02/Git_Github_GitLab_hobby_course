# Day 10 Exercises: Understanding HEAD

## Exercise 1: Examine Normal HEAD

1. Create a repository with 3 commits
2. Run `cat .git/HEAD`
3. Run `git rev-parse HEAD`
4. Run `git branch --show-current`
5. Understand the relationship

## Exercise 2: Detached HEAD Exploration

1. Run `git checkout HEAD~1`
2. Read the warning message carefully
3. Run `cat .git/HEAD` - what's different?
4. Run `git status`
5. Return to main with `git switch main`

## Exercise 3: Make Commits in Detached State

1. Checkout a previous commit
2. Make a change and commit it
3. Try to switch branches (what happens?)
4. Create a branch to save your work
5. Switch back to main

## Exercise 4: HEAD Navigation

Practice these:
```bash
git checkout HEAD~2   # Go back 2 commits
git checkout HEAD^    # Go back 1 commit
git checkout HEAD~3   # Go back 3 commits
```

Return to main after each.

## Exercise 5: Reflog Investigation

1. Make several branch switches
2. Run `git reflog`
3. Find HEAD positions
4. Use `git checkout HEAD@{n}` to visit past positions

## Challenge

Create a scenario where:
1. You accidentally make commits in detached HEAD
2. You use `git reflog` to find them
3. You create a branch to save the work
