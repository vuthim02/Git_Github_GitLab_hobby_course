# Day 16: Cloning & Fetching

## Theory

### Git Clone

`git clone` copies an entire repository to your local machine. It creates:
- A new directory with the repo name
- All commits and history
- A working directory
- Automatic remote setup

```bash
git clone https://github.com/user/repo.git
# Creates ./repo/ directory

git clone https://github.com/user/repo.git my-folder
# Creates ./my-folder/ directory
```

### What Clone Does

```
Original Repository (Remote)
├── .git/
├── main
├── develop
└── commits...

Clone Result (Local)
├── .git/
│   └── refs/remotes/origin/
│       ├── main
│       └── develop
├── main (working directory)
├── develop (working directory)
└── commits...
```

### Git Fetch

`git fetch` downloads commits from a remote without modifying your working directory.

```bash
git fetch origin
git fetch --all
git fetch origin main
```

### Fetch vs Clone

| Aspect | Clone | Fetch |
|--------|-------|-------|
| First time? | Yes | No |
| Copies entire history | Yes | New commits only |
| Creates working files | Yes | No |
| Updates branches | Yes | Remote-tracking only |

### Remote Tracking Branches

When you fetch, Git creates remote-tracking branches:
- `origin/main` - Your local copy of remote main
- `origin/develop` - Your local copy of remote develop

These are separate from your local branches.

## Commands

```bash
# Clone a repository
git clone https://github.com/user/repo.git
git clone https://github.com/user/repo.git my-project

# Fetch updates
git fetch origin
git fetch --all
git fetch origin main

# View remote-tracking branches
git branch -r

# Update remote-tracking branches
git fetch origin
```

## Video References

- [Git Tutorial for Beginners: Branching](https://youtu.be/zTjRZNkhiEU)
- [Git & GitHub Tutorial - Branching](https://youtu.be/8JJ101D3knE)
- [Git Branches Tutorial](https://youtu.be/RGOj5yH7evk)

## Practice Exercises

### Exercise 1: Clone a Repository

1. Find a public GitHub repository
2. Clone it to your local machine
3. Explore the directory structure
4. Run `git log` to see history

### Exercise 2: Fetch Updates

1. In a cloned repository
2. Make local commits
3. Run `git fetch`
4. Compare local and remote with `git log`

### Exercise 3: View Remote Branches

```bash
git branch -r
git log --oneline origin/main
```

## Checklist

- [ ] I understand git clone
- [ ] I can clone repositories
- [ ] I understand git fetch
- [ ] I can fetch from remotes
- [ ] I know about remote-tracking branches

## Navigation

← [Day 15: Git Remote Basics](../day-15/lesson.md) | [Day 17: Pulling & Merging](../day-17/lesson.md) →
