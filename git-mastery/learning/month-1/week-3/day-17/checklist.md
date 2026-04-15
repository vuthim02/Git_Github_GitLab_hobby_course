# Day 17 Checklist: Pulling & Merging

## Pull Commands

- [ ] `git pull` - Default pull
- [ ] `git pull origin main` - Specific remote/branch
- [ ] `git pull --rebase` - Rebase instead of merge
- [ ] `git pull --ff-only` - Only fast-forward
- [ ] `git pull --no-ff` - Always create merge commit

## Pull Behavior

| Command | Creates Merge Commit | Linear History |
|---------|---------------------|----------------|
| `git pull` | Yes (if needed) | No |
| `git pull --rebase` | No | Yes |
| `git pull --ff-only` | Never | Yes |

## Rebase vs Merge Pull

### When to Rebase
- [ ] Local commits not pushed
- [ ] Private branches
- [ ] Want clean history

### When to Merge
- [ ] Public/shared branches
- [ ] Want accurate history
- [ ] Team prefers merges

## Conflict Resolution with Pull

1. [ ] Pull triggers conflict
2. [ ] Edit files to resolve
3. [ ] `git add <file>`
4. [ ] `git commit` or `git rebase --continue`

## Post-Lesson

- [ ] Can pull from remote
- [ ] Understands merge vs rebase pull
- [ ] Can resolve pull conflicts
- [ ] Ready for Day 18: Pushing & Authentication
