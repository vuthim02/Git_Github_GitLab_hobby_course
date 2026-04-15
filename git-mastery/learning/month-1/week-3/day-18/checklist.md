# Day 18 Checklist: Pushing & Authentication

## Push Commands

- [ ] `git push origin main` - Push to remote
- [ ] `git push -u origin branch` - Push with upstream
- [ ] `git push` - Push to tracked branch
- [ ] `git push origin --delete branch` - Delete remote branch
- [ ] `git push origin --tags` - Push tags

## Upstream Concept

- [ ] `-u` sets tracking relationship
- [ ] After upstream set, `git push` alone works
- [ ] View with `git branch -vv`

## Rejected Push Resolution

1. [ ] Pull remote changes: `git pull --rebase`
2. [ ] Resolve any conflicts
3. [ ] Push again: `git push`

## SSH Authentication

- [ ] Generate key: `ssh-keygen -t ed25519`
- [ ] Add public key to GitHub/GitLab
- [ ] Test: `ssh -T git@github.com`

## HTTPS Authentication

- [ ] Personal Access Token (PAT) required
- [ ] Use credential helper
- [ ] Store credentials safely

## Post-Lesson

- [ ] Can push to remote
- [ ] Can handle rejected pushes
- [ ] Understands authentication
- [ ] Ready for Day 19: GitHub & Pull Requests
