# Day 19 Exercises: GitHub Setup & Pull Requests

## Exercise 1: Fork a Repository

1. Go to github.com
2. Find a public repository (e.g., a learning project)
3. Click the "Fork" button
4. Wait for creation
5. Note the URL changes to your username

## Exercise 2: Clone Your Fork

```bash
git clone https://github.com/YOUR-USERNAME/REPO.git
cd REPO
git remote -v  # Note: origin = your fork
```

## Exercise 3: Add Upstream Remote

```bash
git remote add upstream https://github.com/ORIGINAL-OWNER/REPO.git
git remote -v  # Now shows both
```

## Exercise 4: Keep Fork Synchronized

Sync your fork with upstream:
```bash
git fetch upstream
git checkout main
git merge upstream/main
git push origin main
```

## Exercise 5: Create a Feature Branch for PR

```bash
git switch -c fix-typo
# Make your fix
git add . && git commit -m "Fix typo in README"
git push -u origin fix-typo
```

Then create PR on GitHub.

## Challenge

Contribute to an open source project:
1. Fork the repository
2. Clone your fork
3. Add upstream remote
4. Sync with upstream
5. Create a meaningful change
6. Push and create PR
