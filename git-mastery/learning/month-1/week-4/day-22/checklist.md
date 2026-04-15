# Day 22 Checklist: Rebase Fundamentals

## Understanding Rebase

- [ ] Rebase replays commits on new base
- [ ] Creates linear history
- [ ] Rewrites commit hashes
- [ ] Different from merge

## Rebase Commands

- [ ] `git rebase main` - Rebase onto main
- [ ] `git rebase <branch>` - Rebase onto branch
- [ ] `git rebase --continue` - Continue after conflict
- [ ] `git rebase --abort` - Cancel rebase
- [ ] `git rebase --skip` - Skip conflicting commit

## When to Use Rebase

### Use Rebase
- [ ] Local commits not pushed
- [ ] Private branches
- [ ] Want clean linear history

### Never Use Rebase
- [ ] Public/shared branches
- [ ] Commits others have based on
- [ ] Already pushed (unless confident)

## Rebase vs Merge

| Aspect | Rebase | Merge |
|--------|--------|-------|
| History | Linear | Branching |
| Commits | Rewritten | Preserved |
| Use case | Local/private | Shared |

## Post-Lesson

- [ ] Can perform basic rebase
- [ ] Understands merge vs rebase
- [ ] Can resolve rebase conflicts
- [ ] Ready for Day 23: Interactive Rebase
