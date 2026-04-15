# Day 8 Reflections: Introduction to Branching

## What I Learned Today

### Key Takeaways

1. **Branch Definition**: A branch is a lightweight movable pointer to a commit
2. **Branching Benefits**: Enable parallel development, isolation, and safe experimentation
3. **Performance**: Branching in Git is instant because branches are just pointers (not file copies)
4. **Default Branch**: Git creates a `main` branch by default when initializing a repository

### Commands Mastered

```bash
git branch              # List local branches
git branch -v           # List with commit info
git branch -a           # List all (local + remote)
git branch <name>       # Create new branch
```

### Mental Model

Before today, I thought branches were like copying entire folders. Now I understand:

```
Repository Structure:
├── .git/
│   ├── refs/
│   │   └── heads/
│   │       ├── main      → abc123 (commit pointer)
│   │       └── feature   → def456 (another pointer)
│   └── HEAD             → ref: refs/heads/main
└── Working files...
```

A branch is just a file containing a commit hash!

### Aha Moments

- "Creating a branch takes milliseconds because it only creates a small pointer"
- "The asterisk in `git branch` output shows my current branch"
- "Local branches and remote branches are completely separate entities"

### Questions to Explore Further

1. What happens when I delete a branch?
2. How do branches track their history?
3. Can a branch exist without commits?
4. Why do some projects use different naming conventions?

### Tomorrow's Preview

Day 9 will cover:
- Actually switching between branches
- The `git checkout` and `git switch` commands
- Creating and switching in one command
- Working with detached HEAD state

### Confidence Check

Rate your understanding (1-5):
- [ ] What a branch is: ____
- [ ] Why branching is useful: ____
- [ ] Listing branches: ____
- [ ] Creating branches: ____

## Practice Log

Today I practiced branching by:
1. ______________________________________
2. ______________________________________
3. ______________________________________
