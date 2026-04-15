# Day 11: Merging Basics

## Theory

### What is Merging?

Merging combines the changes from one branch into another. It integrates divergent work histories.

### Types of Merges

#### 1. Fast-Forward Merge

When the target branch has no new commits, Git just moves the pointer forward.

**Before:**
```
main:    A → B → C
                ↑
              feature (C)
```

**After `git checkout main && git merge feature`:**
```
main:    A → B → C → D (feature commits)
                ↑
              feature
```

The main pointer just moves to where feature is.

#### 2. Three-Way Merge

When branches have diverged, Git creates a merge commit.

**Before:**
```
main:    A → B → C
                 ↘
                  D → E (feature)
```

**After merge:**
```
main:    A → B → C → F (merge commit)
                 ↘       ↗
                  D → E
```

Git creates a new commit (F) that has two parents.

### The Merge Command

```bash
# Merge branch into current branch
git merge branch-name

# Example: Merge feature into main
git checkout main
git merge feature-login
```

### Merge Commit

A merge commit:
- Has two parents (usually)
- Git creates it automatically
- Requires a commit message

```bash
# After merge, if editor opens:
# Write message or accept default
Merge branch 'feature-login' into main
```

## Video References

- [Git Tutorial for Beginners: Branching](https://youtu.be/zTjRZNkhiEU)
- [Git & GitHub Tutorial - Branching](https://youtu.be/8JJ101D3knE)
- [Git Branches Tutorial](https://youtu.be/RGOj5yH7evk)

## Practice Exercises

### Exercise 1: Fast-Forward Merge

1. Create repo, make commit on main
2. Create branch, add commits
3. Switch to main
4. Merge the branch
5. Observe: No merge commit created

### Exercise 2: Three-Way Merge

1. Create commits on main
2. Create branch, make different commits
3. Merge branch into main
4. Observe: Merge commit created

### Exercise 3: Visualize Merge

```bash
git log --graph --oneline --all
```

## Checklist

- [ ] I understand what merging does
- [ ] I can identify fast-forward vs three-way merge
- [ ] I can perform a merge
- [ ] I understand merge commits
- [ ] I can visualize merged history

## Navigation

← [Day 10: Understanding HEAD](../day-10/lesson.md) | [Day 12: Resolving Merge Conflicts](../day-12/lesson.md) →
