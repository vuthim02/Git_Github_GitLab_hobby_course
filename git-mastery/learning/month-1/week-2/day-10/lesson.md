# Day 10: Understanding HEAD

## Theory

### What is HEAD?

**HEAD** is Git's way of answering: "Where am I right now?"

HEAD is a pointer that:
- Points to the current branch
- Indirectly points to the current commit
- Moves when you switch branches or make commits

### Visualizing HEAD

```
HEAD → main → Commit A → Commit B → Commit C
```

HEAD points to `main`, which points to the latest commit.

### HEAD File Location

```bash
cat .git/HEAD
# Output: ref: refs/heads/main
```

HEAD is stored in `.git/HEAD` and usually contains a reference to a branch.

### Detached HEAD State

**What is it?** HEAD pointing directly to a commit, not a branch.

**When it happens:**
```bash
git checkout abc1234  # Hash instead of branch name
```

**Visual:**
```
HEAD → Commit A → Commit B → Commit C
               ↑
               main
```

### Is Detached HEAD Bad?

**No!** It's a normal state, but with a catch:

- Commits made are orphaned (no branch points to them)
- They will be garbage collected eventually
- You can save them by creating a branch

### Saving Work in Detached HEAD

```bash
# In detached HEAD state, made commits
git checkout abc1234
# Made commits D, E, F

# Save them by creating a branch
git switch -c saved-work
```

### The HEAD~ and HEAD^ Notation

```bash
HEAD~1   # One commit before HEAD
HEAD~2   # Two commits before HEAD
HEAD^    # Same as HEAD~1
HEAD^^   # Same as HEAD~2
```

## Video References

- [Git Tutorial for Beginners: Branching](https://youtu.be/zTjRZNkhiEU)
- [Git & GitHub Tutorial - Branching](https://youtu.be/8JJ101D3knE)
- [Git Branches Tutorial](https://youtu.be/RGOj5yH7evk)

## Commands

```bash
# Show current HEAD
cat .git/HEAD

# Show where HEAD points
git symbolic-ref HEAD

# Show current commit
git rev-parse HEAD

# Show recent HEAD positions
git reflog

# Navigate relative to HEAD
git checkout HEAD~1
git checkout HEAD^
```

## Practice Exercises

### Exercise 1: Examine HEAD

1. In a repository, run `cat .git/HEAD`
2. Understand the output
3. Run `git rev-parse HEAD`
4. Compare the two

### Exercise 2: Enter Detached HEAD

1. `git checkout HEAD~1`
2. Note the warning message
3. `cat .git/HEAD` - see the difference
4. Return with `git switch main`

### Exercise 3: Save Work from Detached HEAD

1. Enter detached HEAD
2. Make a commit
3. Create a branch to save it
4. Return to main

## Checklist

- [ ] I understand what HEAD is
- [ ] I can examine the HEAD file
- [ ] I know what detached HEAD means
- [ ] I can save commits from detached HEAD
- [ ] I understand HEAD~ notation

## Navigation

← [Day 9: Creating & Switching Branches](../day-9/lesson.md) | [Day 11: Merging Basics](../day-11/lesson.md) →
