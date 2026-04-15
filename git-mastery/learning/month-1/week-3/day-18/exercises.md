# Day 18 Exercises: Pushing & Authentication

## Exercise 1: First Push with Upstream

1. Create a repository locally
2. Create a remote (or use GitHub)
3. Add remote
4. Push with `-u origin main`

## Exercise 2: Push a Feature Branch

```bash
git switch -c feature-login
# Make commits
git push -u origin feature-login
```

## Exercise 3: Handle Rejected Push

Create this scenario:
1. Make local commits
2. Someone pushes to remote
3. Your push is rejected
4. Pull and rebase
5. Push successfully

## Exercise 4: SSH Key Setup

Check SSH key status:
```bash
# Check for existing keys
ls -la ~/.ssh/

# Generate new key (if needed)
ssh-keygen -t ed25519 -C "your@email.com"

# Test connection
ssh -T git@github.com
```

## Exercise 5: Credential Management

Configure credential helper:
```bash
git config --global credential.helper cache
git config --global credential.helper store
```

## Challenge

Set up SSH authentication:
1. Generate SSH key
2. Add public key to GitHub/GitLab
3. Clone using SSH URL
4. Push without entering password
