# Day 21: Common Mistakes - Week 3 Review

## Quick Reference of Common Mistakes

### Remotes
- Forgetting to add upstream remote
- Confusing origin and upstream
- Typo in remote URL

### Fetching/Pulling
- Forgetting that fetch doesn't update local branches
- Not using --rebase when appropriate
- Pulling into dirty working directory

### Pushing
- Forgetting -u on first push
- Ignoring rejected pushes
- Using --force inappropriately

### Forks
- Not syncing before starting work
- Committing to main instead of feature branch
- Creating large PRs

## Most Important Lessons

### Rebase Golden Rule
> "Never rebase commits that have been pushed to a shared repository."

### Fork Sync Process
```bash
git fetch upstream
git checkout main
git merge upstream/main
git push origin main
```

### Authentication
- HTTPS: Use credential helper or token
- SSH: Set up SSH keys

## Week 3 Trophy

After completing Week 3, you can:
- [ ] Work with remote repositories
- [ ] Collaborate using forks
- [ ] Create and review PRs/MRs
- [ ] Handle authentication
- [ ] Sync repositories

Congratulations on mastering Git collaboration!
