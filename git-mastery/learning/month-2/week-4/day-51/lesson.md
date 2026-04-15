# Day 51: Bisect for Bug Finding

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          GIT MASTERY - DAY 51                                ║
║                         BISECT FOR BUG FINDING                             ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

## Today's Objectives

- [ ] Use git bisect
- [ ] Binary search with Git
- [ ] Automate bisect
- [ ] Find bugs efficiently

---

## Theory: Git Bisect

### What is Bisect?

Git bisect uses binary search to find the commit that introduced a bug:

```
GOOD ────┬───────●───────●───────●───────●───────●───────BAD
         1       2       3       4       5       6       7

Binary search steps:
1. Test commit 4 (middle) → BAD
2. Test commit 2 → GOOD
3. Test commit 3 → BAD
4. Commit 3 is the first BAD!
```

### Using Bisect

```bash
# Start bisect
git bisect start

# Mark current commit as bad
git bisect bad

# Mark known good commit
git bisect good v1.0.0

# Now Git checks out a commit in the middle
# Test the code
# Tell Git the result
git bisect good   # or git bisect bad

# Repeat until found
# Git displays: first bad commit: abc123
# Check out original branch
git bisect reset
```

### Automating Bisect

```bash
#!/bin/bash
# test-file.sh
# Run tests, exit 0 for good, 1 for bad
npm test

# Use automatic bisect
git bisect start HEAD v1.0.0
git bisect run ./test-file.sh
```

---

## When to Use Bisect

1. Tests that used to pass now fail
2. Performance regressions
3. Any binary-searchable bug

---

## Reading References

### Git SCM Documentation
- [Git Bisect](https://git-scm.com/docs/git-bisect)
- [Debugging with Git](https://git-scm.com/book/en/v2/Git-Tools-Debugging-with-Git)

## Checklist

- [ ] Use git bisect manually
- [ ] Use git bisect run automation