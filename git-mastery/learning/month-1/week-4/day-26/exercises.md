# Day 26 Exercises: Reset vs Revert

## Exercise 1: Soft Reset

1. Make and commit changes
2. Run `git reset --soft HEAD~1`
3. Check: changes staged
4. Note: commit undone

## Exercise 2: Mixed Reset

1. Stage some changes
2. Run `git reset HEAD file.txt`
3. Check: changes unstaged
4. Note: staging undone

## Exercise 3: Hard Reset

1. Make and commit changes
2. Run `git reset --hard HEAD~1`
3. Check: changes gone
4. WARNING: This is destructive!

## Exercise 4: Revert

1. Make and commit changes
2. Run `git revert HEAD`
3. Check: new commit created
4. Note: original commit still in history

## Exercise 5: Compare Reset and Revert

Create same scenario:
1. Apply reset - history changes
2. Reset and create scenario again
3. Apply revert - history preserved

## Challenge

Fix a mistake using revert:
1. Made 3 commits, middle one has bug
2. Use revert to undo only the buggy commit
3. Verify only that commit is undone
