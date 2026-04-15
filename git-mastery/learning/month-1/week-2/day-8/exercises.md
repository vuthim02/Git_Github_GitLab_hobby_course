# Day 8 Exercises: Introduction to Branching

## Exercise 1: Create and Explore a Repository

1. Create a new directory called `branch-lab`
2. Initialize it as a Git repository
3. Create a README.md file with content
4. Make the initial commit
5. List all branches

**Expected Output:**
```
* main
```

## Exercise 2: Create Multiple Branches

1. In your `branch-lab` repository, create these branches:
   - `feature-dashboard`
   - `bugfix-login`
   - `experiment-new-ui`

2. List all branches to verify they were created

**Expected Output:**
```
  bugfix-login
  experiment-new-ui
  feature-dashboard
* main
```

## Exercise 3: Visualize Branch Structure

1. Create a repository with multiple branches
2. Add commits to different branches
3. Use `git log --oneline --graph --all` to visualize

**Goal:** Understand how branches diverge and share history

## Exercise 4: Branch Information

Practice these commands and note the differences:

```bash
git branch          # List local branches
git branch -v       # List with last commit info
git branch -a       # List all (including remote)
git branch --merged # List branches merged into current
```

## Exercise 5: Identify Your Current Branch

Create a script that:
1. Displays "Current branch:"
2. Shows the current branch name
3. Lists all other branches

**Hint:** Use `git branch --show-current`

## Challenge Exercise

Create a branch called `challenge-solution` and:
1. Switch to it
2. Add a new file
3. Commit the change
4. Return to main
5. Verify the file only exists on the challenge branch
