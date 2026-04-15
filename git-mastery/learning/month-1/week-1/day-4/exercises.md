# Day 4 Exercises: The Git Workflow - Staging & Committing

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          DAY 4 EXERCISES                                       ║
║                    The Git Workflow - Staging & Committing                     ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

---

## Exercise 1: The Basic Workflow (Easy)

### Objective
Practice the complete Git workflow from start to finish.

### Steps
1. Create a new repository: `workflow-basic`
2. Create these files:
   - `index.html` with basic HTML structure
   - `styles.css` with some CSS
   - `app.js` with a console.log statement
3. Stage and commit as "Initial setup"
4. Modify `index.html` to add a title
5. Stage and commit as "Add page title"
6. View your commit history

### Expected Output
```bash
$ git log --oneline
a1b2c3d Add page title
e4f5g6h Initial setup
```

### Success Criteria
- [ ] All three files in first commit
- [ ] Second commit contains only title change
- [ ] Clean, meaningful commit messages

---

## Exercise 2: Staging Practices (Medium)

### Objective
Master different ways to stage files.

### Steps
1. Create repo: `staging-practice`
2. Create 5 files: `a.txt`, `b.txt`, `c.txt`, `d.txt`, `e.txt`
3. Practice these staging methods:

```bash
# Method 1: Stage one at a time
git add a.txt
git commit -m "Add a.txt"

# Method 2: Stage multiple files
git add b.txt c.txt
git commit -m "Add b.txt and c.txt"

# Method 3: Stage all files in directory
git add .
git commit -m "Add remaining files"

# Method 4: Stage using pattern
git add *.txt  # If in new repo
```

### Questions to Answer
1. Which method is fastest?
2. When would you NOT want to use `git add .`?
3. What does `git add -A` do differently from `git add .`?

### Success Criteria
- [ ] Completed all 5 files with appropriate commits
- [ ] Can explain differences between staging methods
- [ ] Understood when to use each method

---

## Exercise 3: Partial Staging (Medium)

### Objective
Learn to stage specific parts of a file.

### Steps
1. Create repo: `partial-staging`
2. Create a file with multiple changes:

```bash
cat > config.py << 'EOF'
DEBUG = True
HOST = "localhost"
PORT = 8080
SECRET_KEY = "secret123"
DATABASE_URL = "postgres://localhost/mydb"
EOF
```

3. Edit it to have multiple changes:
```bash
cat > config.py << 'EOF'
DEBUG = False
HOST = "production-server"
PORT = 443
SECRET_KEY = "real-secret-key"
DATABASE_URL = "postgres://prod-server/proddb"
EOF
```

4. Stage interactively:
```bash
git add -p config.py
```

5. Choose to stage only DEBUG and PORT changes
6. Commit with "Update server config"
7. View the staged changes vs unstaged

### Success Criteria
- [ ] Successfully used `git add -p`
- [ ] Committed only intended changes
- [ ] Can identify staged vs unstaged

---

## Exercise 4: Commit Message Best Practices (Medium)

### Objective
Learn to write meaningful commit messages.

### Steps
1. Create repo: `commit-messages`
2. Create a file
3. Practice writing different types of messages:

**Bad Examples (Don't Do This):**
```bash
git commit -m "fix"
git commit -m "asdf"
git commit -m "changes"
git commit -m "WIP"
git commit -m "1"
```

**Good Examples (Do This):**
```bash
git commit -m "Fix null pointer exception in user login"
git commit -m "Add password reset functionality"
git commit -m "Update README with installation instructions"
git commit -m "Refactor database connection pooling"
git commit -m "Add unit tests for auth module"
```

### Research & Apply
Read about commit message conventions:
- [Conventional Commits](https://www.conventionalcommits.org/)
- [Chris Beams - How to Write a Git Commit Message](https://chris.beams.io/posts/git-commit/)

### Success Criteria
- [ ] Wrote at least 5 meaningful commit messages
- [ ] Can explain what makes a good vs bad message
- [ ] Applied conventions to messages

---

## Exercise 5: Viewing Differences (Hard)

### Objective
Learn to see what changed between stages.

### Steps
1. Create repo: `diff-practice`
2. Create initial file:
```bash
echo "Line 1" > file.txt
echo "Line 2" >> file.txt
echo "Line 3" >> file.txt
git add file.txt
git commit -m "Initial file"
```

3. Make several changes:
```bash
echo "Line 4" >> file.txt  # Add line
# Edit line 2 to say "Line 2 MODIFIED"
echo "Line 2 MODIFIED" > temp.txt
echo "Line 3" >> temp.txt
echo "Line 4" >> temp.txt
mv temp.txt file.txt
```

4. Check different diffs:
```bash
# See unstaged changes
git diff file.txt

# See staged changes
git diff --cached file.txt

# See committed vs working directory
git diff HEAD file.txt

# See all files
git diff
git diff --staged
```

### Challenge
Draw the file state at each point:
- Initial commit
- Working directory
- Staging area

### Success Criteria
- [ ] Can read git diff output
- [ ] Understands + and - meanings
- [ ] Can identify staged vs unstaged changes

---

## Exercise 6: Amending Commits (Hard)

### Objective
Learn to modify the last commit.

### Scenario
You committed but forgot to add a file or wrote a bad message.

### Steps
1. Create repo: `amend-practice`
2. Create file `a.txt`, commit
3. Create file `b.txt`, but forgot to stage it
4. Run `git add b.txt`
5. Amend the commit: `git commit --amend`
6. Observe the result

### Warning
Only amend UNPUSHED commits! Pushed commits should never be amended.

```bash
# This will change history!
git commit --amend

# You'll see an editor for the message
# Or use:
git commit --amend -m "Corrected message"
git commit --amend --no-edit  # Keep same message
```

### Success Criteria
- [ ] Successfully amended a commit
- [ ] Understands when to use --amend
- [ ] Knows the risks of amending

---

## Exercise 7: The .gitignore Connection (Medium)

### Objective
Learn to avoid staging unwanted files.

### Steps
1. Create repo: `gitignore-practice`
2. Create these files:
   - `app.py`
   - `config.py`
   - `app.log`
   - `database.db`
   - `__pycache__/` (directory)
3. Stage and commit everything
4. Now create a `.gitignore` file:
```
*.log
*.db
__pycache__/
```
5. Stage and commit `.gitignore`
6. Check status - what happens?

### Questions
1. What files should NOT be committed?
2. Why doesn't .gitignore work retroactively?
3. How do you "un-gitignore" a file?

### Success Criteria
- [ ] Created proper .gitignore
- [ ] Understands ignore patterns
- [ ] Can explain when to use .gitignore

---

## 🏆 Challenge: Git Workflow Script

Create a script that automates a common workflow:

```bash
#!/bin/bash
# save-work.sh

# Takes a commit message as argument
# Stages all changes
# Commits with the message
# Shows the result

# Usage: ./save-work.sh "Fixed the login bug"
```

### Bonus Features
- Check if there are changes to commit
- Show what will be committed
- Verify message isn't empty
- Display updated log

### Success Criteria
- [ ] Script accepts message argument
- [ ] Stages and commits in one step
- [ ] Handles edge cases
- [ ] Displays helpful output

---

## 📋 Exercise Summary

| Exercise | Difficulty | Skills Practiced |
|----------|------------|------------------|
| 1 | Easy | Basic add/commit workflow |
| 2 | Medium | Various staging methods |
| 3 | Medium | Partial/interactive staging |
| 4 | Medium | Commit message writing |
| 5 | Hard | Viewing differences |
| 6 | Hard | Amending commits |
| 7 | Medium | .gitignore usage |
| Challenge | Hard | Scripting workflow |

---

## ✅ Checklist Before Proceeding

- [ ] Completed all Easy exercises
- [ ] Completed at least 4 Medium/Hard exercises
- [ ] Can explain the three stages of Git
- [ ] Write meaningful commit messages
- [ ] Ready for Day 5: Git Internals

---

## 📚 Additional Resources

- [Git Add Documentation](https://git-scm.com/docs/git-add)
- [Git Commit Documentation](https://git-scm.com/docs/git-commit)
- [Git Log Documentation](https://git-scm.com/docs/git-log)
- [Git Diff Documentation](https://git-scm.com/docs/git-diff)
