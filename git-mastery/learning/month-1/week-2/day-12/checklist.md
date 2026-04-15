# Day 12 Checklist: Resolving Merge Conflicts

## Conflict Detection

- [ ] Git shows conflict message during merge
- [ ] `git status` shows unmerged files
- [ ] Conflict markers appear in files

## Conflict Markers Reference

```html
<<<<<<< HEAD
Your changes
=======
Their changes
>>>>>>> branch-name
```

## Resolution Steps

1. [ ] Open conflicted file in editor
2. [ ] Identify what to keep
3. [ ] Remove conflict markers
4. [ ] Edit file to desired state
5. [ ] Save file
6. [ ] `git add file.txt`
7. [ ] `git commit`

## Abort Option

- [ ] `git merge --abort` cancels the merge
- [ ] Use when conflict is too complex
- [ ] Start fresh after abort

## Quick Resolution Commands

```bash
git checkout --ours file    # Keep current branch
git checkout --theirs file  # Keep merging branch
git add file
git commit
```

## Post-Resolution

- [ ] `git status` shows clean
- [ ] Merge commit created
- [ ] No conflict markers remain

## Prevention Tips

- [ ] Communicate with team about file changes
- [ ] Pull before starting work
- [ ] Merge small changes frequently
- [ ] Use feature branches

## Post-Lesson

- [ ] Completed all exercises
- [ ] Can identify conflicts
- [ ] Can resolve manually
- [ ] Ready for Day 13: Branching Workflows
