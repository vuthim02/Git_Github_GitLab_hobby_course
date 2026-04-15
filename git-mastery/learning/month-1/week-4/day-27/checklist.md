# Day 27 Checklist: Reflog & Recovery

## Understanding Reflog

- [ ] Reflog records HEAD movements
- [ ] Each move is a reflog entry
- [ ] Can recover from any HEAD move
- [ ] Entries have timestamps

## Reflog Commands

- [ ] `git reflog` - Show HEAD history
- [ ] `git reflog show main` - Show branch history
- [ ] `git reflog -n <count>` - Limit entries
- [ ] `git reflog --date=relative` - Human dates

## Recovery Patterns

### Recover Reset
- [ ] View reflog: `git reflog`
- [ ] Find target: `HEAD@{n}`
- [ ] Recover: `git reset --hard HEAD@{n}`

### Recover Branch
- [ ] View reflog: `git reflog`
- [ ] Find commit: `abc123`
- [ ] Recreate: `git checkout -b branch abc123`

## Safety Net

- [ ] Reflog is local only
- [ ] Not shared with remote
- [ ] Automatically pruned after 90 days
- [ ] Use before risky operations

## Post-Lesson

- [ ] Can view reflog
- [ ] Can recover from reset
- [ ] Can recover deleted branches
- [ ] Ready for Day 28: Week 4 & Month 1 Review
