# Day 16 Exercises: Cloning & Fetching

## Exercise 1: Clone a Public Repository

1. Find any public GitHub repository
2. Clone it using HTTPS
3. Explore the cloned directory
4. Run `git remote -v` to see the remote

## Exercise 2: Explore Remote Branches

After cloning:
```bash
git branch -r              # List remote-tracking branches
git log --oneline origin/main  # See origin's main branch
```

## Exercise 3: Simulate Remote Updates

1. Clone a repository
2. Note current commit
3. In another location, update the original
4. Fetch in your clone
5. Compare commits

## Exercise 4: Fetch Without Merge

1. Make commits locally
2. Fetch from remote
3. Notice your local branches unchanged
4. Only remote-tracking branches updated

## Exercise 5: Clone to Specific Directory

```bash
git clone https://github.com/user/repo.git my-folder
ls my-folder
```

## Challenge

Create a workflow:
1. Fork a repo on GitHub
2. Clone your fork
3. Add upstream remote
4. Fetch from upstream
5. Verify both remotes work
