# Day 24 Exercises: Cherry-Picking

## Exercise 1: Basic Cherry-Pick

1. Create a branch with 3 commits
2. Switch to main
3. Cherry-pick the second commit
4. Verify the changes

## Exercise 2: Cherry-Pick Range

Cherry-pick a range:
```bash
git cherry-pick abc123..xyz789
```

Note: This excludes abc123.

## Exercise 3: Cherry-Pick Without Commit

```bash
git cherry-pick --no-commit <commit>
```

This stages changes without committing, letting you review.

## Exercise 4: Find and Cherry-Pick

1. Create commits
2. Find hashes with `git log`
3. Cherry-pick specific ones

## Challenge

Simulate backporting:
1. main has initial version
2. develop has 5 bug fixes
3. Cherry-pick only the bug fixes to main
4. main should have fixes without full merge
