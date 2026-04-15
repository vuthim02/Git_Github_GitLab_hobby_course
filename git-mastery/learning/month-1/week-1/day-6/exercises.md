# Day 6 Exercises: Viewing History & Differences

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          DAY 6 EXERCISES                                       ║
║                    Viewing History & Differences                              ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

---

## Exercise 1: Mastering git log (Easy)

### Objective
Learn all the ways to view commit history.

### Steps
1. Create repository with multiple commits
2. Practice each log format:

```bash
# Basic log
git log

# One line per commit
git log --oneline

# With graph
git log --oneline --graph

# Combined with all branches
git log --oneline --graph --all --decorate

# Custom format
git log --pretty=format:"%h %an %s"

# Last N commits
git log -5

# By author
git log --author="Your Name"
```

### Success Criteria
- [ ] Can use 5+ log formats
- [ ] Know when to use each format
- [ ] Can filter by time, author, file

---

## Exercise 2: Understanding git diff (Medium)

### Objective
Compare changes between different states.

### Scenario
You made changes, some staged, some not.

### Steps
1. Create file.txt with "Line 1"
2. Commit
3. Modify file.txt (add Line 2)
4. Stage Line 2 (git add)
5. Modify file.txt (add Line 3)
6. Now practice diffs:

```bash
# See unstaged (Line 3)
git diff

# See staged (Line 2)
git diff --staged

# See all (working vs HEAD)
git diff HEAD
```

### Questions
1. What does Line 2 show in which diffs?
2. What does Line 3 show in which diffs?
3. Why?

### Success Criteria
- [ ] Can identify what's in each diff type
- [ ] Understands staging area role
- [ ] Can read diff output (+/- lines)

---

## Exercise 3: Comparing Branches (Medium)

### Objective
Use diff to compare branches (preview).

### Steps
1. Create repository with main branch
2. Create feature branch
3. Make different commits on each
4. Compare:

```bash
# Differences between branches
git diff main..feature

# Show only which files differ
git diff main..feature --stat

# Show changed files only
git diff main..feature --name-only
```

### Success Criteria
- [ ] Can compare two branches
- [ ] Can show summary statistics
- [ ] Understands diff notation

---

## Exercise 4: Finding Specific Changes (Medium)

### Objective
Search commit history for changes.

### Steps
1. Create repository
2. Make commits that add, modify, remove text
3. Search:

```bash
# Find commits that added "TODO"
git log -S "TODO" --oneline

# Find commits that removed "DEBUG"
git log -S "DEBUG" --oneline -p

# Find commits touching specific file
git log --oneline --all -- filename.txt

# Follow file through renames
git log --oneline --follow -- filename.txt
```

### Questions
1. What does `-S` do exactly?
2. What does `--follow` do?

### Success Criteria
- [ ] Can search for string in history
- [ ] Can trace file through renames
- [ ] Understands -S flag

---

## Exercise 5: Visual History (Hard)

### Objective
Create visual representations of history.

### Steps
1. Create repository with branches and merges
2. Practice:

```bash
# ASCII graph
git log --oneline --graph --all --decorate

# Pretty format for a report
git log --pretty=format:"%C(yellow)%h%Creset - %C(bold blue)<%an>%Creset %C(green)(%ar)%Creset %s" --date=relative

# Export history to file
git log --oneline --all > history.txt

# Show file changes per commit
git log --stat
```

### Challenge
Create a nice formatted history output for a README.

### Success Criteria
- [ ] Can create ASCII graph
- [ ] Can format for reports
- [ ] Can export history

---

## Exercise 6: git blame Practice (Medium)

### Objective
Track line-level history with blame.

### Steps
1. Create file with multiple edits
2. Use blame:

```bash
# Full blame
git blame file.txt

# Ignore whitespace
git blame -w file.txt

# Specific line range
git blame -L 5,10 file.txt

# With email
git blame -e file.txt

# Color by age (red=old, blue=new)
git blame --color-by-age file.txt
```

### Questions
1. What does the first column mean?
2. Can blame be "wrong" about who wrote code?
3. Why might lines show an old commit?

### Success Criteria
- [ ] Can use git blame effectively
- [ ] Understands line tracking
- [ ] Can explain limitations

---

## Exercise 7: Recovering Information (Hard)

### Objective
Use history commands to investigate.

### Scenario
You need to understand when a bug was introduced.

### Steps
1. Create repository with bug
2. Use binary search approach:

```bash
# Start with git log -p to see changes
git log -p --all | grep -A5 -B5 "buggy code"

# Use git log -S to find when string appeared
git log -S "buggy_function" --oneline -p

# Check out old commit to test
git checkout abc123
# Run tests
git checkout main
```

### Success Criteria
- [ ] Can search history for bugs
- [ ] Can checkout old commits
- [ ] Can identify bug introduction point

---

## 🏆 Challenge: History Analysis Script

Create a script that analyzes commit history:

```bash
#!/bin/bash
# analyze-history.sh

# Output a report showing:
# - Total commits
# - Commits by author
# - Most active days
# - Files most often changed
# - Average commit size
```

### Success Criteria
- [ ] Script runs without errors
- [ ] Shows meaningful statistics
- [ ] Can be reused for any repo

---

## 📋 Exercise Summary

| Exercise | Difficulty | Skills Practiced |
|----------|------------|------------------|
| 1 | Easy | git log variations |
| 2 | Medium | git diff types |
| 3 | Medium | Branch comparison |
| 4 | Medium | History searching |
| 5 | Hard | Visual formatting |
| 6 | Medium | git blame |
| 7 | Hard | Bug investigation |
| Challenge | Hard | History analysis |

---

## ✅ Checklist Before Proceeding

- [ ] Can use `git log` in multiple formats
- [ ] Can use `git diff` for all comparisons
- [ ] Can use `git show` to view commits
- [ ] Can use `git blame` to track lines
- [ ] Ready for Day 7: Week 1 Review

---

## 📚 Additional Resources

- [Git Log Documentation](https://git-scm.com/docs/git-log)
- [Git Diff Documentation](https://git-scm.com/docs/git-diff)
- [Git Show Documentation](https://git-scm.com/docs/git-show)
- [Git Blame Documentation](https://git-scm.com/docs/git-blame)
