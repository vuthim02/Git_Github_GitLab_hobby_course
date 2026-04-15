# Day 50 Exercises: Debugging Commands

## Exercise 1: Use git blame (15 min)

### Objective
Learn to find who changed each line.

### Task

1. **Find a file with history**
   ```bash
   git log --oneline -5  # Pick a commit
   ```

2. **Use blame**
   ```bash
   git blame README.md
   ```

3. **Blame specific lines**
   ```bash
   git blame -L 10,20 README.md
   ```

### Questions
1. Who changed line 5? _________________________________
2. What commit introduced the content on line 10?
   _________________________________

---

## Exercise 2: Search History with git log -S (15 min)

### Objective
Find when specific code was introduced.

### Task

```bash
# Find when "TODO" comments were added
git log -S "TODO" --oneline

# Find when a function was added
git log -S "function login()" --oneline

# Find when a variable was introduced
git log -S "const apiKey" --oneline
```

### Answer
What commit added the password check logic?
_______________________________________________

---

## Exercise 3: Debug with git bisect (30 min)

### Scenario
A bug was introduced somewhere. Find it!

```bash
# Start bisect
git bisect start

# Mark current version as bad
git bisect bad

# Mark a known good commit
git bisect good v1.0.0

# Git will checkout middle commit
# Test if bug exists
# Mark as good or bad
git bisect good  # or git bisect bad

# Repeat until found

# End bisect
git bisect reset
```

### Success Criteria
- [ ] Started bisect session
- [ ] Identified bad commit
- [ ] Reset bisect

---

## Exercise 4: Use git stash (20 min)

### Scenario
You're mid-work and need to switch branches.

### Task

```bash
# Stash changes
git stash
git stash -u  # Include untracked

# View stash list
git stash list

# Apply stash
git stash pop  # Apply and delete

# Apply specific stash
git stash apply stash@{0}

# Drop stash
git stash drop stash@{0}
```

### Success Criteria
- [ ] Stashed changes
- [ ] Switched branches
- [ ] Retrieved changes
