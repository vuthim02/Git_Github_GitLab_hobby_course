# Day 9: Creating & Switching Branches

## Theory

### Branch Creation vs Switching

Yesterday we learned about branches conceptually. Today we actually create and switch between them.

**Two operations:**
1. **Create**: Make a new branch pointer
2. **Switch**: Move HEAD to point to a different branch

### Creating Branches

```bash
# Create a new branch (but stay on current)
git branch <branch-name>

# Create and switch in one command (Git 2.23+)
git switch -c <branch-name>

# Create from a specific commit
git branch <branch-name> <commit-hash>

# Create from an existing branch
git branch <branch-name> existing-branch
```

### Switching Branches

```bash
# Switch to an existing branch (Git 2.23+)
git switch <branch-name>

# Switch to an existing branch (legacy command)
git checkout <branch-name>

# Switch to the previous branch
git switch -

# Create and switch (shorthand)
git switch -c new-branch  # -c = create
```

### The `git switch` vs `git checkout` Story

Git 2.23 introduced `git switch` to split responsibilities:
- `git switch`:专门用于切换分支
- `git checkout`: can switch branches OR restore files

This separation makes Git more intuitive and safer.

### What Happens When You Switch?

1. HEAD pointer moves to the new branch
2. The working directory updates to match that branch's files
3. Git automatically tracks which files changed

### Creating and Switching: Both Methods

```bash
# Method 1: Two steps
git branch feature-login
git switch feature-login

# Method 2: One step (new syntax)
git switch -c feature-login

# Method 3: One step (legacy)
git checkout -b feature-login
```

## Video References

- [Git Tutorial for Beginners: Branching](https://youtu.be/zTjRZNkhiEU)
- [Git & GitHub Tutorial - Branching](https://youtu.be/8JJ101D3knE)
- [Git Branches Tutorial](https://youtu.be/RGOj5yH7evk)

## Reading References

### Atlassian Git Tutorial
- [Creating Branches](https://www.atlassian.com/git/tutorials/using-branches)
- [Checking out Branches](https://www.atlassian.com/git/tutorials/using-branches/git-checkout)

### Git SCM Documentation
- [Git Branching](https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell)

## Practice Exercises

### Exercise 1: Create and Switch

```bash
git init practice
cd practice
echo "main file" > file.txt
git add . && git commit -m "Initial commit"

git switch -c feature
echo "feature work" >> file.txt
git add . && git commit -m "Add feature"

git switch main
cat file.txt  # Shows only "main file"
```

### Exercise 2: Switch Between Multiple Branches

Create three branches and switch between them, noting how files change.

## Common Mistakes

1. **Switching with uncommitted changes**: Use `git stash` or commit first
2. **Typos in branch names**: Git won't find the branch
3. **Forgetting `-c` flag**: `git switch new-branch` fails if it doesn't exist

## Checklist

- [ ] I can create a branch
- [ ] I can switch between branches
- [ ] I understand the difference between `switch` and `checkout`
- [ ] I can create and switch in one command
- [ ] I understand what happens to files when switching

## Navigation

← [Day 8: Introduction to Branching](../day-8/lesson.md) | [Day 10: Understanding HEAD](../day-10/lesson.md) →
