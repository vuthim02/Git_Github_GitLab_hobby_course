# Day 9 Checklist: Creating & Switching Branches

## Pre-Lesson Checklist

- [ ] Day 8 concepts reviewed
- [ ] Understand what branches are
- [ ] Git installed and working
- [ ] Terminal ready

## Command Checklist

- [ ] `git branch <name>` - Create branch
- [ ] `git switch <name>` - Switch to branch
- [ ] `git switch -c <name>` - Create and switch
- [ ] `git switch -` - Switch to previous branch
- [ ] `git branch --show-current` - Show current branch

## Syntax Reference

```bash
# Create only
git branch new-branch

# Switch only
git switch existing-branch

# Create and switch (preferred)
git switch -c new-branch

# Create from specific point
git switch -c new-branch abc123

# Switch to previous
git switch -
```

## Verification Checklist

After each command:
- [ ] Run `git branch` to see current state
- [ ] Check `*` marker shows current branch
- [ ] Verify file changes reflected correctly

## Common Issues to Watch

- [ ] Uncommitted changes block switching
- [ ] Forgetting `-c` when creating new branch
- [ ] Typo in branch name

## Post-Lesson

- [ ] Completed all exercises
- [ ] Can create branches
- [ ] Can switch between branches
- [ ] Ready for Day 10: Understanding HEAD
