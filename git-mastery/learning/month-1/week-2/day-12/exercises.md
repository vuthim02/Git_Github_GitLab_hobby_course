# Day 12 Exercises: Resolving Merge Conflicts

## Exercise 1: Create Your First Conflict

Create this scenario:
1. Create `config.js` on main with: `const port = 3000;`
2. Create `feature` branch
3. On `feature`, change to: `const port = 4000;`
4. On `main`, change to: `const port = 5000;`
5. Merge `feature` into `main`
6. Observe the conflict

## Exercise 2: Resolve by Keeping Current

Accept the main branch version:
```bash
git checkout --ours config.js
git add config.js
git commit
```

## Exercise 3: Resolve by Keeping Incoming

Accept the feature branch version:
```bash
git checkout --theirs config.js
git add config.js
git commit
```

## Exercise 4: Manual Resolution

Edit the conflicted file:
1. Remove the conflict markers
2. Decide on final content (might be combination)
3. Stage and commit

## Exercise 5: Multiple Conflicts

Create a scenario with conflicts in multiple files:
1. Conflict in file1.txt
2. Conflict in file2.txt
3. Resolve both before committing

## Challenge

Create conflicting changes:
- Same line modified differently
- Additional lines added in both
- Resolve to keep all changes
