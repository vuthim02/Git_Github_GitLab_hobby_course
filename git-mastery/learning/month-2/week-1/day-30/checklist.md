# Day 30 Checklist: Pull Requests Deep Dive

## Pre-Lesson Checklist

- [ ] Day 29 completed (GitHub repositories)
- [ ] GitHub account set up
- [ ] GitHub CLI authenticated
- [ ] Understanding of branching

## During Lesson Checklist

- [ ] Watched PR video section
- [ ] Understood PR concept
- [ ] Learned three merge strategies
- [ ] Understood when to use each

## Command Practice Checklist

- [ ] Created a PR using GitHub web
- [ ] Created a PR using GitHub CLI
- [ ] Listed PRs with `gh pr list`
- [ ] Viewed PR with `gh pr view`
- [ ] Checked out PR locally with `gh pr checkout`
- [ ] Added review comments
- [ ] Merged a PR

## Merge Strategy Practice

- [ ] Created merge commit PR
- [ ] Created squash merge PR
- [ ] Understood when to use each
- [ ] Can explain pros/cons of each

## PR Description Practice

- [ ] Wrote a descriptive PR title
- [ ] Created PR template
- [ ] Included testing information
- [ ] Added checklist

## Review Process

- [ ] Reviewed someone else's PR
- [ ] Left constructive comments
- [ ] Approved a PR
- [ ] Requested changes on a PR

## Understanding Verification

- [ ] I can explain what a PR is
- [ ] I can create a PR from scratch
- [ ] I understand merge vs squash vs rebase
- [ ] I know how to sync a PR with upstream
- [ ] I understand draft PRs

## Post-Lesson Checklist

- [ ] Completed all exercises
- [ ] Created at least one PR
- [ ] Reviewed at least one PR
- [ ] Experimented with merge strategies
- [ ] Ready for Day 31: Code Reviews

## Quick Reference

```bash
# Create PR
gh pr create --title "Title" --body "Description"
gh pr create --draft  # Draft PR

# View PR
gh pr list           # List all PRs
gh pr view 123       # View specific PR
gh pr diff 123       # See changes

# Review PR
gh pr checkout 123   # Checkout locally
gh pr review 123 --approve           # Approve
gh pr review 123 --request-changes   # Request changes
gh pr review 123 --comment            # Comment

# Merge PR
gh pr merge 123      # Regular merge
gh pr merge --squash 123  # Squash

# Update PR
git fetch origin
git rebase origin/main
git push --force-with-lease
```

## Success Criteria

You are ready for Day 31 when you can:
1. Create a PR with proper description
2. Explain the difference between merge strategies
3. Review and comment on a PR
4. Sync a PR with upstream changes
5. Choose appropriate merge strategy
