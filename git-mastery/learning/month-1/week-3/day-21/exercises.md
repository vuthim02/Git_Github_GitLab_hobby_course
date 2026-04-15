# Day 21 Exercises: Week 3 Review

## Challenge 1: Remote Mastery

Demonstrate all remote operations:
1. Add remote
2. Remove remote
3. Rename remote
4. Change remote URL
5. View remote details

## Challenge 2: Fork Workflow Complete

1. Fork a public repository (or simulate)
2. Clone your fork
3. Add upstream remote
4. Make commits on a feature branch
5. Sync with upstream
6. Push feature branch
7. Create PR/MR (simulate)

## Challenge 3: Conflict Resolution

Create and resolve conflicts:
1. Make changes in remote
2. Make conflicting changes locally
3. Pull (creates conflict)
4. Resolve conflict
5. Complete the pull

## Challenge 4: Compare Sync Methods

Compare these approaches:
1. `git merge upstream/main`
2. `git pull --rebase upstream main`

Note differences in history.

## Challenge 5: Authentication Setup

Set up SSH or HTTPS credential helper:
```bash
# SSH
ssh-keygen -t ed25519
# Add to GitHub/GitLab

# HTTPS helper
git config --global credential.helper store
```

## Self-Assessment

Rate confidence (1-5):
- [ ] Remote management: ____
- [ ] Cloning and fetching: ____
- [ ] Pulling and merging: ____
- [ ] Pushing: ____
- [ ] Fork workflow: ____
- [ ] PR/MR creation: ____
