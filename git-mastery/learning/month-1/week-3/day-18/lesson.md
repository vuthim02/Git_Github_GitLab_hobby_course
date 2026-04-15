# Day 18: Pushing & Authentication

## Theory

### Git Push

`git push` uploads your local commits to a remote repository.

```bash
git push origin main
git push -u origin feature  # Set upstream
git push                     # After upstream set
```

### Push with Upstream

```bash
# First push, set tracking
git push -u origin feature

# Now "git push" alone works
git push
```

### Authentication Methods

#### HTTPS
```bash
git clone https://github.com/user/repo.git
```
- Requires username/password or personal access token
- Can use credential helper to cache

#### SSH
```bash
git clone git@github.com:user/repo.git
```
- Uses SSH keys
- No password needed after setup

### Setting Up SSH Keys

```bash
# Generate key
ssh-keygen -t ed25519 -C "your_email@example.com"

# Add to SSH agent
ssh-add ~/.ssh/id_ed25519

# Copy public key
cat ~/.ssh/id_ed25519.pub
# Add to GitHub/GitLab in settings
```

### Push Rejected?

When push is rejected:
```
! [rejected] main -> main (non-fast-forward)
```

It means remote has commits you don't have. Solution:
```bash
git pull --rebase  # Get updates
git push           # Try again
```

## Commands

```bash
git push origin main        # Push main to origin
git push -u origin feature   # Push and set upstream
git push                     # Push to tracked branch
git push --force             # Force push (dangerous!)
git push origin --tags       # Push tags
git push origin --delete branch  # Delete remote branch
```

## Video References

- [Git Tutorial for Beginners: Branching](https://youtu.be/zTjRZNkhiEU)
- [Git & GitHub Tutorial - Branching](https://youtu.be/8JJ101D3knE)
- [Git Branches Tutorial](https://youtu.be/RGOj5yH7evk)

## Practice Exercises

### Exercise 1: Configure Credential Helper

```bash
git config --global credential.helper cache
git config --global credential.helper store
```

### Exercise 2: Handle Rejected Push

1. Make local commits
2. Try to push (rejected)
3. Pull with rebase
4. Push again

### Exercise 3: Delete Remote Branch

```bash
git push origin --delete old-feature
```

## Checklist

- [ ] I understand git push
- [ ] I can push to remote
- [ ] I understand authentication options
- [ ] I can handle rejected pushes
- [ ] I can set up SSH keys

## Navigation

← [Day 17: Pulling & Merging](../day-17/lesson.md) | [Day 19: GitHub Setup & Pull Requests](../day-19/lesson.md) →
