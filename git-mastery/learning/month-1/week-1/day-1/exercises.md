# Day 1: Exercises - What is Version Control?

```
← Previous | Day 1 Exercises | Next: Day 2 →
```

---

## 🎯 EXERCISE SET 1: INSTALLATION & VERIFICATION

### Exercise 1.1: Install Git
**Task**: Install Git on your system
**Platform**: Follow instructions for your OS (Linux/macOS/Windows)

```bash
# Verify installation
git --version
```

**Expected Output**:
```
git version 2.XX.X
```

**Success Criteria**: You see a version number (not an error)

---

### Exercise 1.2: Find Git's Location
**Task**: Find where Git is installed on your system

```bash
# Linux/macOS
which git

# Windows
where git
```

**Expected Output**: Path to the git executable (e.g., `/usr/bin/git`)

---

## 🎯 EXERCISE SET 2: EXPLORING HELP

### Exercise 2.1: Browse General Help
**Task**: Run `git help` and explore

```bash
git help
```

**Questions to answer**:
1. How many common Git commands are listed?
2. Which commands look familiar from other tools?
3. Which ones sound completely new?

**Record your answers in reflections.md**

---

### Exercise 2.2: Read About a Command
**Task**: Read the help for `git commit`

```bash
git help commit
```

**Questions to answer**:
1. What does the SYNOPSIS section show?
2. What are the most common options?
3. Can you find an option to amend the previous commit?

---

## 🎯 EXERCISE SET 3: PRACTICAL EXPLORATION

### Exercise 3.1: Create Your First Repository
**Task**: Create a test repository and explore the structure

```bash
# Create a directory
mkdir -p ~/git-practice-day1
cd ~/git-practice-day1

# Initialize Git repository
git init

# List all files (including hidden)
ls -la

# Check the .git directory contents
ls -la .git/
```

**Expected Output**:
```
total 0
drwxr-xr-x  6 username  staff  192 Apr 14 10:00 .
drwxr-xr-x 18 username  staff  576 Apr 14 10:00 ..
drwxr-xr-x  3 username  staff   96 Apr 14 10:00 .git
```

**What's inside .git/**:
- `HEAD` - Points to current branch
- `config` - Repository configuration
- `objects/` - Where Git stores all data
- `refs/` - Branch and tag references

---

### Exercise 3.2: Examine the .git Directory
**Task**: Look at the contents of the .git directory

```bash
cd ~/git-practice-day1

# View the HEAD file
cat .git/HEAD

# View the config file
cat .git/config

# Check objects directory (should be empty)
ls -la .git/objects/
```

**Expected Output**:
```
ref: refs/heads/main

[core]
    repositoryformatversion = 0
    filemode = true
    bare = false
    logallrefupdates = true
```

---

### Exercise 3.3: Create a File and Check Status
**Task**: Create a file and see what Git says about it

```bash
cd ~/git-practice-day1

# Create a simple file
echo "Hello Git" > hello.txt

# Check status
git status

# Clean up (optional - you'll use this repo more)
# rm -rf ~/git-practice-day1
```

**Expected Output**:
```
On branch main

No commits yet

Untracked files:
    (use "git add <file>..." to include in what will be committed)
    
    hello.txt
```

**Notice**: The file is "untracked" - Git sees it but isn't tracking changes yet.

---

## 🎯 EXERCISE SET 4: CONCEPTUAL EXERCISES

### Exercise 4.1: Draw the VCS Types
**Task**: On paper or in a text file, draw:

1. A Local VCS (one computer, database)
2. A Centralized VCS (one server, multiple clients)
3. A Distributed VCS (full copies on every machine)

**Include labels for:**
- Where data is stored
- How developers connect
- What happens if the server goes down

---

### Exercise 4.2: Explain to a Friend
**Task**: Write a 3-sentence explanation of version control:

1. For a 10-year-old
2. For your manager
3. For another developer

**Example for a 10-year-old**:
"Version control is like having a superpower that lets you go back in time. If you write a story and then make it worse, you can go back to the better version. It's like having unlimited erasers and save points in a video game."

---

## 🎯 EXERCISE SET 5: TERMINAL SKILLS

### Exercise 5.1: Navigate Your System
**Task**: Practice basic terminal commands you'll use with Git

```bash
# Check current directory
pwd

# List files
ls
ls -la

# Create directory
mkdir my-project
cd my-project

# Go back to home
cd ~

# Remove directory
rm -rf my-project
```

---

### Exercise 5.2: Use Tab Completion
**Task**: Enable and practice tab completion for Git

```bash
# If using bash, add git completion if not already installed
# Most modern installations have it by default

# Try typing partial commands:
git s<TAB>      # Should complete to "status"
git comm<TAB>    # Should complete to "commit"
git bra<TAB>     # Should complete to "branch"

# Try partial branch names
git checkout b<TAB>
```

---

## 🎯 BONUS CHALLENGE: Research Mission

### Task: Research Git History
Spend 20 minutes researching:

1. Who created Git and why?
2. What happened to the Linux kernel before Git?
3. What does "Git" mean? (It's not an acronym!)

**Write your findings in reflections.md**

---

## 📊 SUCCESS CRITERIA

Complete ALL of the following to pass Day 1:

| Exercise | Task | Completed |
|----------|------|-----------|
| 1.1 | Install Git | [ ] |
| 1.2 | Find Git location | [ ] |
| 2.1 | Browse git help | [ ] |
| 2.2 | Read git commit help | [ ] |
| 3.1 | Create first repo | [ ] |
| 3.2 | Examine .git | [ ] |
| 3.3 | Create file, check status | [ ] |
| 4.1 | Draw VCS diagrams | [ ] |
| 4.2 | Write explanations | [ ] |
| 5.1 | Terminal navigation | [ ] |
| 5.2 | Tab completion | [ ] |

---

## 🧪 TROUBLESHOOTING

### Problem: "command not found: git"
**Solution**: Git is not installed. Follow installation instructions for your OS.

### Problem: "fatal: not a git repository"
**Solution**: You're not in a Git repository. Run `git init` first.

### Problem: Permission denied on macOS
**Solution**: Try: `sudo xcode-select --install`

---

## 📝 RECORD YOUR WORK

After completing exercises, update your reflections:

1. Which exercises were easy?
2. Which were challenging?
3. What questions do you still have?
4. How would you explain version control to someone now?

---

**Navigation**: ← Previous: [Lesson](./lesson.md) | [Dashboard](../../dashboard.md) | Day 1 Exercises | Next: [Day 2](../day-2/lesson.md) →
