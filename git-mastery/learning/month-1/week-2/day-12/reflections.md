# Day 12 Reflections: Resolving Merge Conflicts

## What I Learned Today

### Conflict Anatomy

```html
<<<<<<< HEAD
Current branch content
=======
Incoming branch content  
>>>>>>> feature-branch
```

### Resolution Steps

1. Git reports conflict
2. Edit file manually
3. Remove conflict markers
4. `git add` the file
5. `git commit` to complete

### Key Insight

> Conflicts are not errors - they're Git asking for human decision.

### Recovery Options

- **Abort**: `git merge --abort`
- **Choose ours**: `git checkout --ours`
- **Choose theirs**: `git checkout --theirs`
- **Manual**: Edit to combine

### When Conflicts Occur

- Same file modified in both branches
- Same lines changed differently
- Deletion vs modification

### Confidence Check (1-5)

- [ ] Identifying conflicts: ____
- [ ] Reading conflict markers: ____
- [ ] Manual resolution: ____
- [ ] Using abort: ____

### Tomorrow's Preview

Day 13: Branching Workflows
- Gitflow
- GitHub Flow
- Forking workflow
- Choosing the right workflow
