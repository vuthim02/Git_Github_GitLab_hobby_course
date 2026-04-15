# Day 17 Exercises: Pulling & Merging

## Exercise 1: Basic Pull

1. Clone a repository
2. Add a commit to the remote
3. Pull into your local copy
4. Verify the file appears

## Exercise 2: Pull with Merge

```bash
git pull origin main
git log --graph --oneline
```

Note the merge commit in history.

## Exercise 3: Pull with Rebase

```bash
git pull --rebase origin main
git log --graph --oneline
```

Note the linear history (no merge commit).

## Exercise 4: Pull.ff-only

```bash
git pull --ff-only
```

When does this succeed/fail?

## Exercise 5: Configure Default Pull Behavior

```bash
git config --global pull.rebase true   # Rebase by default
git config --global pull.rebase false  # Merge by default
```

## Challenge

Compare merge vs rebase pull:
1. Reset to clean state
2. Pull with merge
3. Note history
4. Reset again
5. Pull with rebase
6. Note the difference
