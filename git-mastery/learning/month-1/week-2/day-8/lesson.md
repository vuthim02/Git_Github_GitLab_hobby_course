# Day 8: Introduction to Branching

## Theory

### What is a Branch?

A branch in Git is simply a lightweight movable pointer to a commit. When you create a branch, you're creating a new line of development that allows you to work on features, fixes, or experiments without affecting the main codebase.

**Key Concepts:**
- The default branch in Git is typically called `main` (formerly `master`)
- Each branch is an independent line of development
- Branches can be created, merged, and deleted
- The current branch pointer moves with each new commit

### Why Use Branches?

1. **Parallel Development**: Work on multiple features simultaneously
2. **Isolation**: Test changes without risking the main codebase
3. **Collaboration**: Team members can work on different features
4. **Safe Experimentation**: Try new ideas without consequences
5. **Organized Workflow**: Keep features, bugs, and releases separate

### Branching Visualization

```
        Feature-A
           ↓
main: A ← B ← C ← D ← E
```

In this example:
- `main` points to commit E
- `Feature-A` points to commit D
- Both branches share commits A, B, C
- Each branch has diverged with its own commits

### The Power of Branching

Git branches are incredibly lightweight and fast because:
- Branches are just pointers to commits (41 bytes each)
- Creating a branch takes milliseconds
- Git doesn't copy files when creating branches
- Merging is usually automatic and fast

## Video References

- [Git Tutorial for Beginners: Branching](https://youtu.be/zTjRZNkhiEU)
- [Git & GitHub Tutorial - Branching](https://youtu.be/8JJ101D3knE)
- [Git Branches Tutorial](https://youtu.be/RGOj5yH7evk)

## Reading References

### Atlassian Git Tutorial
- [Git Branching](https://www.atlassian.com/git/tutorials/using-branches)
- [Merging](https://www.atlassian.com/git/tutorials/using-branches/merging)
- [Comparing Branches](https://www.atlassian.com/git/tutorials/using-branches/comparing-branches)

### Git SCM Documentation
- [Git Branching](https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell)
- [Basic Branching](https://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository)

## Git Commands

### Viewing Branches

```bash
# List all local branches
git branch

# List all branches (local and remote)
git branch -a

# List branches with more information
git branch -v

# List merged branches
git branch --merged

# List unmerged branches
git branch --no-merged
```

### Understanding the Output

```
  feature-login
* main
  bugfix-header
```

The `*` indicates the current branch you're on.

## Practice Exercises

### Exercise 1: List Current Branches

1. Open your terminal
2. Navigate to your Git repository
3. Run `git branch`
4. Note which branch you're currently on

### Exercise 2: Visualize Branches

1. Create a new repository: `git init branch-practice`
2. Navigate to it: `cd branch-practice`
3. Create an initial commit
4. Run `git branch` to see the default branch
5. Visualize with `git log --oneline --graph --all`

## Real-World Examples

### Scenario 1: Feature Development

```bash
# Start working on a new feature
git branch feature-user-authentication
git checkout feature-user-authentication
# Work on the feature...
git commit -m "Add login form"
```

### Scenario 2: Bug Fix in Production

```bash
# Production has a critical bug
git checkout main
git branch hotfix-security-patch
git checkout hotfix-security-patch
# Fix the bug...
git commit -m "Fix security vulnerability"
```

## Common Mistakes

1. **Forgetting which branch you're on**: Always check with `git branch` before making changes
2. **Committing to the wrong branch**: Verify your current branch before committing
3. **Not understanding branch relationships**: Remember that branches are just pointers
4. **Deleting unmerged branches**: Always check if branches are merged before deletion

## Checklist

- [ ] I understand what a branch is
- [ ] I can explain why branching is useful
- [ ] I can list all branches in a repository
- [ ] I can identify my current branch
- [ ] I understand that branches are lightweight pointers
- [ ] I know the difference between local and remote branches

## Navigation

← [Day 7: Week 1 Review](../day-7/review.md) | [Day 9: Creating & Switching Branches](../day-9/lesson.md) →
