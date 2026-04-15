# Day 24 Checklist: Cherry-Picking

## Cherry-Pick Commands

- [ ] `git cherry-pick <hash>` - Single commit
- [ ] `git cherry-pick A..B` - Range (A exclusive)
- [ ] `git cherry-pick --no-commit` - Stage only
- [ ] `git cherry-pick --continue` - After resolving
- [ ] `git cherry-pick --abort` - Cancel

## Finding Commits

- [ ] `git log --oneline` - List commits
- [ ] Copy hash from log
- [ ] `git log branchA..branchB` - Commits in branchB not in A

## Use Cases

- [ ] Backporting fixes to release branch
- [ ] Selective merging
- [ ] Applying specific commits

## Conflict Resolution

1. [ ] Conflict occurs
2. [ ] Edit file
3. [ ] `git add file`
4. [ ] `git cherry-pick --continue`

## Post-Lesson

- [ ] Can cherry-pick single commits
- [ ] Can cherry-pick ranges
- [ ] Understand when to use cherry-pick
- [ ] Ready for Day 25: Stashing Changes
