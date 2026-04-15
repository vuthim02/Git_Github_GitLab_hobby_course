# Day 12: Resolving Merge Conflicts

## Theory

### What is a Merge Conflict?

A conflict occurs when Git cannot automatically resolve differences between branches. This happens when:

1. Same file modified in both branches
2. Changes are on the same lines
3. One branch deleted a file, another modified it

### Conflict Markers

When a conflict occurs, Git marks the conflicting areas:

```html
<<<<<<< HEAD
Current branch content
=======
Incoming branch content
>>>>>>> feature-branch
```

- `<<<<<<< HEAD`: Start of conflict
- `=======`: Separator between changes
- `>>>>>>>`: End of conflict, shows source branch

### Conflict States

```bash
git status
# Unmerged paths:
#   both modified:   file.txt
```

### Resolution Options

1. **Accept current change**: Keep HEAD version
2. **Accept incoming change**: Keep merging branch version
3. **Accept both**: Keep all changes
4. **Manual resolution**: Edit to combine changes

## Commands

```bash
# Abort the merge
git merge --abort

# After resolving, stage the file
git add file.txt

# Complete the merge
git commit

# List conflicting files
git diff --name-only --diff-filter=U
```

## Video References

- [Git Tutorial for Beginners: Branching](https://youtu.be/zTjRZNkhiEU)
- [Git & GitHub Tutorial - Branching](https://youtu.be/8JJ101D3knE)
- [Git Branches Tutorial](https://youtu.be/RGOj5yH7evk)

## Practice Exercises

### Exercise 1: Create a Conflict

1. Create file `style.css` on main with "body { color: blue; }"
2. Create branch, change same line to "color: red;"
3. On main, change same line to "color: green;"
4. Merge branch into main
5. Observe the conflict

### Exercise 2: Resolve a Conflict

1. Use the conflict from Exercise 1
2. Edit the file to keep one version
3. Stage the file
4. Complete the merge

### Exercise 3: Accept Theirs or Ours

```bash
git checkout --ours file.txt   # Keep current branch
git checkout --theirs file.txt # Keep merging branch
```

## Checklist

- [ ] I can identify merge conflicts
- [ ] I understand conflict markers
- [ ] I can resolve conflicts manually
- [ ] I can abort a merge
- [ ] I know when conflicts occur

## Navigation

← [Day 11: Merging Basics](../day-11/lesson.md) | [Day 13: Branching Workflows](../day-13/lesson.md) →
