# Day 26 Checklist: Reset vs Revert

## Reset Modes

| Mode | Staging | Working Dir | Use Case |
|------|---------|-------------|----------|
| --soft | Staged | Kept | Keep staged |
| --mixed | Unstaged | Kept | Default, unstage |
| --hard | Deleted | Deleted | DANGER! |

## Reset Commands

- [ ] `git reset HEAD~1` - Mixed (default)
- [ ] `git reset --soft HEAD~1` - Keep staged
- [ ] `git reset --hard HEAD~1` - Delete all
- [ ] `git reset --hard abc123` - Reset to commit

## Revert Commands

- [ ] `git revert HEAD` - Revert last commit
- [ ] `git revert abc123` - Revert specific commit
- [ ] `git revert abc123..def456` - Revert range

## When to Use

### Use Reset
- [ ] Local commits only
- [ ] Not pushed to shared repo
- [ ] Want to change history

### Use Revert
- [ ] Already pushed commits
- [ ] Need safe undo
- [ ] Want to preserve history

## Safety

- [ ] Never hard reset pushed commits
- [ ] Use reflog to recover from mistakes
- [ ] Prefer revert for shared branches

## Post-Lesson

- [ ] Understand reset modes
- [ ] Can use reset safely
- [ ] Can use revert
- [ ] Ready for Day 27: Reflog & Recovery
