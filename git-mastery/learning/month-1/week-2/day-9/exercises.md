# Day 9 Exercises: Creating & Switching Branches

## Exercise 1: Create Your First Branch

1. Create a new directory `branch-switch-practice`
2. Initialize Git
3. Create a file with content
4. Commit it
5. Create a branch called `develop`
6. List branches to verify

**Verify:** `develop` should appear but `*` should still be on `main`

## Exercise 2: Switch Branches

1. In your `branch-switch-practice`:
2. Switch to `develop`
3. Verify you're on `develop` (check the `*`)
4. Return to `main`

## Exercise 3: Create and Switch in One Command

Use `git switch -c` to:
1. Create a branch called `feature-sidebar`
2. Automatically switch to it
3. Verify you're on the new branch

## Exercise 4: Multiple Branches, Multiple Commits

Create this structure:
```
main:      A → B
feature-1: A → B → C → D
bugfix:    A → B → E
```

Then use `git log --graph --all` to visualize.

## Exercise 5: Switching and File Changes

1. On `main`, create `config.txt` with "main config"
2. Create and switch to `feature-config`
3. Change `config.txt` to "feature config"
4. Commit the change
5. Switch back to `main`
6. Check `config.txt` - what does it say?

## Challenge

Write a shell script that:
1. Creates a new repo
2. Creates 3 branches
3. Makes different commits on each
4. Shows a graph of the result
5. Cleans up (delete the repo directory)
