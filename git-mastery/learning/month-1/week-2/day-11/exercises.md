# Day 11 Exercises: Merging Basics

## Exercise 1: Fast-Forward Merge

Create this scenario:
1. Start with one commit on main
2. Create a branch `quick-fix`
3. Add a commit to `quick-fix`
4. Merge into main
5. Verify: No merge commit, just moved pointer

**Goal:** Understand when fast-forward happens

## Exercise 2: Three-Way Merge

Create this scenario:
1. Main has 2 commits
2. Create branch from first commit
3. Add commits to the branch
4. Also add commits to main
5. Merge branch into main
6. Verify: Merge commit created

**Goal:** Understand divergence and merge commits

## Exercise 3: Prevent Fast-Forward

Use `--no-ff` to force a merge commit even when fast-forward is possible:

```bash
git merge feature --no-ff
```

Create a scenario and observe the difference.

## Exercise 4: Visual Comparison

Compare these two scenarios:

**Scenario A:** Fast-forward merge
```
A → B → C → D (on feature)
```

**Scenario B:** Three-way merge
```
A → B → C → F (merge)
         ↘   ↗
          D → E (on feature)
```

Draw both, then create them in Git.

## Exercise 5: Merge Already Up-to-date

What happens when you try to merge a branch that's already behind?

```bash
git checkout main
git merge feature  # feature has no new commits
```

## Challenge

Create a workflow:
1. Start with main
2. Create 3 feature branches
3. Merge them one by one
4. Show the final graph
