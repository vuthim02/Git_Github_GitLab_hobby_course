# Day 3 Exercises: Creating Your First Repository

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          DAY 3 EXERCISES                                       ║
║                     Creating Your First Repository                            ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

---

## Exercise 1: Initialize Your First Repository (Easy)

### Objective
Create and initialize a new Git repository.

### Steps
1. Create a new folder called `my-portfolio`
2. Navigate into it
3. Initialize it as a Git repository
4. Verify by checking the `.git` folder exists

### Expected Output
```bash
$ ls -la
total 8
drwxr-xr-x  2 user  staff  160 Jan 1 12:00 .
drwxr-x  2 user  staff  160 Jan 1 12:00 ..
drwxr-x 13 user  staff  416 Jan 1 12:00 .git
-rw-r--r--  1 user  staff   30 Jan 1 12:00 README.md
```

### Success Criteria
- [ ] `.git` directory exists
- [ ] `git status` shows "Initial commit"
- [ ] Repository is ready for use

---

## Exercise 2: Explore the .git Directory (Medium)

### Objective
Understand the structure of a Git repository by examining its internals.

### Steps
1. Initialize a new repository called `explore-git`
2. List all contents of the `.git` directory
3. Read the contents of these files:
   - `.git/HEAD`
   - `.git/config`
   - `.git/description`
4. Check what's in these directories:
   - `.git/objects/`
   - `.git/refs/`
   - `.git/hooks/`
5. Document your findings

### Questions to Answer
1. What does `HEAD` currently point to?
2. What branch name does the config file mention?
3. Are there any files in the `objects` directory yet?

### Success Criteria
- [ ] Can explain the purpose of at least 3 `.git` components
- [ ] Documented the `.git` directory structure
- [ ] Understood why `objects/` is initially empty

---

## Exercise 3: Git Status Variations (Easy)

### Objective
Practice different ways to check repository status.

### Steps
1. Create a repository called `status-practice`
2. Run these commands and note the differences:
   - `git status`
   - `git status -s`
   - `git status -sb`
3. Create three files: `a.txt`, `b.txt`, `c.txt`
4. Run each status command again
5. Delete one file and check status

### Command Reference
```bash
git status         # Full format
git status -s      # Short format
git status -sb     # Short format with branch
```

### Success Criteria
- [ ] Can explain the difference between status formats
- [ ] Understands what each column in `-s` output means
- [ ] Recognizes file status indicators (??, M, A, D)

---

## Exercise 4: Repository Detective (Medium)

### Objective
Determine if a directory is already a Git repository.

### Steps
1. Create a new folder `detective-test`
2. WITHOUT running `git init`, try:
   - `git status`
   - `ls -la`
3. Initialize it with `git init`
4. Check again
5. Navigate to your home directory and try `git status`

### Questions to Answer
1. What error message do you get if you run git commands outside a repo?
2. How can you tell if a directory is a Git repository?
3. What happens when you're inside a repo but run `git init` again?

### Success Criteria
- [ ] Can detect whether a directory is a Git repo
- [ ] Understands git's error messages
- [ ] Knows that re-running `git init` is safe but unnecessary

---

## Exercise 5: Create a Real Project Structure (Hard)

### Objective
Create a realistic project structure and initialize it properly.

### Steps
1. Create a project called `website-project`
2. Set up this structure:
   ```
   website-project/
   ├── src/
   │   ├── index.html
   │   └── styles.css
   ├── images/
   ├── .gitignore
   └── README.md
   ```
3. Initialize the repository
4. Add appropriate content to each file
5. Check `git status` to see what's tracked

### Bonus Challenge
Research what a `.gitignore` file is and add common entries for a web project.

### Success Criteria
- [ ] Created complete project structure
- [ ] Initialized Git repository
- [ ] Can see all files with `git status`
- [ ] Understands the difference between tracked and untracked

---

## Exercise 6: Error Recovery (Medium)

### Objective
Learn to recover from common mistakes.

### Scenario
You accidentally ran `git init` in your home directory. Your entire home folder is now a Git repository!

### Steps
1. Create a test scenario:
   ```bash
   cd ~
   git init  # Oops!
   ```
2. To undo this (without deleting your home files):
   ```bash
   rm -rf .git
   ```
3. Verify you're back to normal

### Key Takeaway
- Running `git init` in the wrong place is recoverable
- Just remove the `.git` folder to "de-initialize"

### Success Criteria
- [ ] Can identify the problem (nested .git)
- [ ] Can fix the issue without losing files
- [ ] Understands when NOT to use `git init`

---

## 🏆 Challenge Exercise: Git Initialization Script

Create a bash script called `setup-repo.sh` that:

1. Takes a project name as an argument
2. Creates the project directory
3. Sets up a basic project structure:
   - `README.md` with project name
   - `.gitignore` with common patterns
   - `src/` directory
4. Initializes the Git repository
5. Makes the first commit with message "Initial commit"
6. Shows the final status

### Usage
```bash
./setup-repo.sh my-new-project
```

### Success Criteria
- [ ] Script accepts project name argument
- [ ] Creates proper directory structure
- [ ] Initializes Git repo
- [ ] Makes first commit automatically

---

## 📋 Exercise Summary

| Exercise | Difficulty | Skills Practiced |
|----------|------------|------------------|
| 1 | Easy | `git init` basics |
| 2 | Medium | Understanding .git structure |
| 3 | Easy | `git status` variations |
| 4 | Medium | Repository detection |
| 5 | Hard | Real-world project setup |
| 6 | Medium | Error recovery |
| Challenge | Hard | Automation with scripts |

---

## ✅ Checklist Before Proceeding

- [ ] Completed all Easy exercises
- [ ] Completed at least 3 Medium exercises
- [ ] Can explain what `git init` does
- [ ] Understand the `.git` directory structure
- [ ] Ready for Day 4: Staging & Committing

---

## 📚 Additional Resources

- [Gitinit command documentation](https://git-scm.com/docs/git-init)
- [Pro Git - Getting a Git Repository](https://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository)
- [Git Status documentation](https://git-scm.com/docs/git-status)
