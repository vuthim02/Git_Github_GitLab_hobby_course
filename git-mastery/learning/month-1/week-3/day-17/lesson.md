# Day 17: Pulling & Merging

## Theory

### Git Pull

`git pull` combines fetch and merge in one command. It:
1. Fetches changes from remote
2. Merges them into current branch

```bash
git pull origin main
git pull  # Uses default remote/branch
```

### Pull Types

#### Pull with Merge (default)

```
git pull --no-rebase

Local:  A → B → C
Remote:     D → E

After pull:
A → B → C → F (merge commit)
         ↘   ↗
           D → E
```

#### Pull with Rebase

```
git pull --rebase

Local:  A → B → C
Remote:     D → E

After pull:
A → B → D → E → C'
```

Uses rebase instead of merge for linear history.

### When to Use Rebase vs Merge

| Situation | Recommendation |
|-----------|----------------|
| Private branch, local commits | Rebase OK |
| Shared branch, public commits | Use merge |
| Want linear history | Rebase |
| Want accurate history | Merge |

### Git Pull Request

```bash
# Pull from default remote/branch
git pull

# Pull specific branch
git pull origin main

# Pull with rebase
git pull --rebase origin main

# Configure default
git config --global pull.rebase false  # Merge (default)
git config --global pull.rebase true   # Rebase
```

## Commands

```bash
git pull                  # Default pull
git pull origin main      # Pull specific
git pull --rebase         # Rebase instead of merge
git pull --ff-only        # Fail if merge required
git pull --no-ff          # Always create merge commit
```

## Video References

- [Git Tutorial for Beginners: Branching](https://youtu.be/zTjRZNkhiEU)
- [Git & GitHub Tutorial - Branching](https://youtu.be/8JJ101D3knE)
- [Git Branches Tutorial](https://youtu.be/RGOj5yH7evk)

## Practice Exercises

### Exercise 1: Basic Pull

1. Clone a repository
2. Make changes in remote (simulate)
3. Pull the changes
4. Verify working directory updated

### Exercise 2: Pull with Rebase

```bash
git pull --rebase
git log --graph --oneline
```

Compare history with regular pull.

### Exercise 3: Pull Conflicts

1. Pull that causes conflict
2. Resolve conflict
3. Complete the pull

## Checklist

- [ ] I understand git pull
- [ ] I can pull from remote
- [ ] I understand merge vs rebase pull
- [ ] I can handle pull conflicts
- [ ] I know when to use each

## Navigation

← [Day 16: Cloning & Fetching](../day-16/lesson.md) | [Day 18: Pushing & Authentication](../day-18/lesson.md) →
