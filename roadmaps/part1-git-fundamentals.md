# Part 1: Git Fundamentals (Beginner)

## 📚 Table of Contents

1. [What is Version Control?](#1-what-is-version-control)
2. [Git vs GitHub vs GitLab](#2-git-vs-github-vs-gitlab)
3. [Installation & Configuration](#3-installation--configuration)
4. [The Three Areas of Git](#4-the-three-areas-of-git)
5. [Basic Git Workflow](#5-basic-git-workflow)
6. [Core Commands Deep Dive](#6-core-commands-deep-dive)
7. [Your First Repository](#7-your-first-repository)
8. [Understanding .gitignore](#8-understanding-gitignore)
9. [Common Beginner Mistakes](#9-common-beginner-mistakes)
10. [Practice Exercises](#10-practice-exercises)

---

## 1. What is Version Control?

### Definition
Version control is a system that records changes to files over time so that you can recall specific versions later. It's like having unlimited "undo" for your entire project.

### Why Version Control Matters

**Without Version Control:**
- Project_v1.doc
- Project_v2_final.doc
- Project_v2_final_REALLY.doc
- Project_v2_final_REALLY_THIS_ONE.doc

**With Version Control:**
- One project folder with complete history
- Any version can be restored instantly
- Multiple people can work simultaneously
- Changes are tracked automatically

### Types of Version Control Systems

#### Local Version Control
- Simple database of changes
- Single developer on one machine
- Example: RCS (Revision Control System)

#### Centralized Version Control (CVCS)
- Single server stores all versions
- Clients checkout files from central place
- Examples: SVN, CVS, Perforce
- **Problem:** Single point of failure

#### Distributed Version Control (DVCS)
- Every client has full repository copy
- Multiple backup points
- Examples: Git, Mercurial, Bazaar
- **Advantage:** No single point of failure

### Real-World Analogy
Think of Git like a **time machine for your code**:
- Each commit is a snapshot in time
- You can travel back to any previous state
- You can create parallel timelines (branches)
- You can merge timelines together

---

## 2. Git vs GitHub vs GitLab

### Git (The Tool)
- **What:** Distributed version control system
- **Where:** Runs on your local machine
- **Purpose:** Track changes in files
- **Created by:** Linus Torvalds (2005) for Linux kernel development
- **Key feature:** Fast, distributed, branching model

### GitHub (The Platform)
- **What:** Cloud-based hosting service for Git repositories
- **Where:** website (github.com)
- **Purpose:** Collaboration, code review, project management
- **Company:** Microsoft (acquired 2018)
- **Key features:** Pull requests, Issues, Actions, Pages

### GitLab (The Platform)
- **What:** DevOps platform with Git hosting
- **Where:** website (gitlab.com) or self-hosted
- **Purpose:** Complete DevOps lifecycle
- **Key features:** CI/CD, container registry, security scanning

### Other Platforms
- **Bitbucket** (Atlassian) - Integrates with Jira
- **Azure DevOps** (Microsoft) - Enterprise DevOps
- **GitHub Enterprise** - Self-hosted GitHub
- **GitLab Self-Managed** - On-premises GitLab

### Visual Comparison

```
┌─────────────────────────────────────────────────────────────┐
│                     VERSION CONTROL                         │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│   ┌─────────────┐    ┌─────────────┐    ┌─────────────┐   │
│   │   Local     │    │ Centralized │    │ Distributed │   │
│   │  Version    │    │   Version   │    │   Version   │   │
│   │  Control    │    │   Control   │    │   Control   │   │
│   │             │    │             │    │             │   │
│   │   (RCS)     │    │ (SVN, CVS)  │    │   (Git)     │   │
│   └─────────────┘    └─────────────┘    └─────────────┘   │
│                                                             │
│   Single         Central           Multiple copies         │
│   developer      server            everywhere              │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## 3. Installation & Configuration

### Installing Git

#### Windows
1. Download from https://git-scm.com/download/win
2. Run installer with default options
3. Git Bash will be available for command line

#### macOS
```bash
# Using Homebrew (recommended)
brew install git

# Using MacPorts
sudo port install git

# Or download from https://git-scm.com/download/mac
```

#### Linux (Ubuntu/Debian)
```bash
sudo apt update
sudo apt install git
```

#### Linux (Fedora/RHEL)
```bash
sudo dnf install git
```

### Verify Installation
```bash
git --version
# Output: git version 2.45.0 (or similar)
```

### First-Time Configuration

**Essential Setup (Required)**
```bash
# Set your name (appears in commits)
git config --global user.name "Your Name"

# Set your email (must match GitHub/GitLab email)
git config --global user.email "your.email@example.com"
```

**Recommended Setup**
```bash
# Set default branch name to 'main' (instead of 'master')
git config --global init.defaultBranch main

# Set your preferred editor
git config --global core.editor "code --wait"  # VS Code
git config --global core.editor "nano"         # Nano
git config --global core.editor "vim"          # Vim

# Enable color output
git config --global color.ui auto
```

**Advanced Setup**
```bash
# Set up credential caching (remember passwords)
git config --global credential.helper cache

# Set default pull behavior
git config --global pull.rebase false  # merge (default)
git config --global pull.rebase true   # rebase

# Set up aliases for common commands
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.lg "log --oneline --graph --decorate"
```

### View Configuration
```bash
# View all settings
git config --list

# View specific setting
git config user.name
git config user.email

# View global settings
git config --global --list
```

---

## 4. The Three Areas of Git

Understanding these three areas is **critical** to using Git effectively:

### 1. Working Directory (Working Tree)
- Your actual files on disk
- Where you make changes
- Not tracked by Git until you add them

### 2. Staging Area (Index)
- Temporary holding area
- Prepares changes for the next commit
- Allows you to selectively stage changes
- Stored in `.git/index`

### 3. Repository (.git directory)
- Database of all commits
- Contains complete project history
- Stored in `.git/` folder

### The Flow

```
┌─────────────────────────────────────────────────────────────┐
│                    THE THREE AREAS                          │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│   ┌─────────────┐    ┌─────────────┐    ┌─────────────┐   │
│   │  Working    │    │   Staging   │    │  Repository │   │
│   │  Directory  │    │    Area     │    │   (.git)    │   │
│   │             │    │             │    │             │   │
│   │  (Your      │    │  (Index)    │    │  (History)  │   │
│   │   Files)    │    │             │    │             │   │
│   └─────────────┘    └─────────────┘    └─────────────┘   │
│         │                  │                   │           │
│         │    git add       │    git commit     │           │
│         └─────────────────>└───────────────────>           │
│                                                             │
│   Changes you     Changes ready      Permanent snapshot    │
│   are making      for commit         of your project       │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Practical Example

```bash
# 1. You edit a file in your text editor (Working Directory)
echo "Hello World" > hello.txt

# 2. You stage the file (Staging Area)
git add hello.txt

# 3. You commit the file (Repository)
git commit -m "Add hello.txt"

# Now the change is permanently saved in Git history
```

---

## 5. Basic Git Workflow

### The 5-Step Workflow

```bash
# Step 1: Initialize a repository (or clone existing)
git init                    # New project
git clone <url>             # Existing project

# Step 2: Make changes to files
echo "My project" > README.md

# Step 3: Stage changes
git add README.md           # Specific file
git add .                   # All changes
git add *.txt               # Pattern matching

# Step 4: Commit changes
git commit -m "Add README.md"

# Step 5: Push to remote (if using GitHub/GitLab)
git push origin main
```

### Real-World Scenario

```bash
# Creating a new project
mkdir my-project
cd my-project
git init

# Create your first file
echo "# My Project" > README.md
echo "This is my awesome project" >> README.md

# Check status
git status
# Output: Untracked files: README.md

# Stage and commit
git add README.md
git commit -m "Initial commit: Add README"

# Connect to GitHub
git remote add origin https://github.com/username/my-project.git
git push -u origin main
```

---

## 6. Core Commands Deep Dive

### git init
Initialize a new Git repository.

```bash
# Create new repository in current directory
git init

# Output:
# Initialized empty Git repository in /path/to/project/.git/
```

**What happens:**
- Creates `.git/` directory
- Sets up Git object database
- Creates initial branch (usually `main`)

### git clone
Copy an existing repository.

```bash
# Clone via HTTPS
git clone https://github.com/user/repo.git

# Clone via SSH
git clone git@github.com:user/repo.git

# Clone specific branch
git clone -b develop https://github.com/user/repo.git

# Clone into specific directory
git clone https://github.com/user/repo.git my-folder

# Shallow clone (faster, no history)
git clone --depth 1 https://github.com/user/repo.git
```

### git status
Show the status of working directory and staging area.

```bash
git status

# Short format
git status -s

# Output symbols:
# ?? = Untracked file
#  M = Modified and staged
#   M = Modified but not staged
# A  = New file staged
# D  = Deleted
# R  = Renamed
```

### git add
Stage changes for the next commit.

```bash
# Stage specific file
git add filename.txt

# Stage multiple files
git add file1.txt file2.txt

# Stage all changes
git add .

# Stage all changes (including deletions)
git add -A

# Interactive staging (choose what to stage)
git add -p

# Stage only tracked files
git add -u
```

### git commit
Create a snapshot of staged changes.

```bash
# Basic commit
git commit -m "Add login feature"

# Commit with detailed message
git commit -m "Add login feature" -m "Includes username/password validation"

# Stage and commit tracked files in one step
git commit -am "Quick bug fix"

# Amend last commit
git commit --amend -m "Updated message"

# Add to last commit without changing message
git commit --amend --no-edit
```

**Writing Good Commit Messages:**
```
<type>: <subject>

<body>

<footer>
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, etc.)
- `refactor`: Code refactoring
- `test`: Adding tests
- `chore`: Maintenance tasks

**Example:**
```
feat: add user authentication

Implement JWT-based authentication system with login, register,
and password reset functionality.

Closes #123
```

### git log
View commit history.

```bash
# Full log
git log

# Compact view
git log --oneline

# Graph view
git log --graph --oneline --decorate

# Last 5 commits
git log -5

# Log with file changes
git log --stat

# Log with patch (diff)
git log -p

# Search commits by message
git log --grep="bug"

# Search commits by author
git log --author="John"

# Log since date
git log --since="2024-01-01"

# Log between two commits
git log abc123..def456
```

### git diff
Show differences between versions.

```bash
# Diff between working directory and staging area
git diff

# Diff between staging area and last commit
git diff --staged

# Diff between two commits
git diff abc123 def456

# Diff between branches
git diff main..feature

# Diff showing only file names
git diff --name-only

# Diff with word diff
git diff --word-diff
```

### git rm
Remove files from working directory and staging area.

```bash
# Remove file
git rm filename.txt

# Remove directory
git rm -r directory/

# Remove from tracking only (keep local file)
git rm --cached filename.txt

# Force remove (even with uncommitted changes)
git rm -f filename.txt
```

### git mv
Move or rename files.

```bash
# Rename file
git mv old-name.txt new-name.txt

# Move file
git mv filename.txt directory/

# Move and rename
git mv old-location/old-name.txt new-location/new-name.txt
```

---

## 7. Your First Repository

### Complete Example: From Zero to GitHub

```bash
# Step 1: Create project directory
mkdir my-first-repo
cd my-first-repo

# Step 2: Initialize Git
git init

# Step 3: Create your first file
echo "# My First Repository" > README.md
echo "This is my first Git project!" >> README.md

# Step 4: Check status
git status
# Output: Untracked files: README.md

# Step 5: Stage the file
git add README.md

# Step 6: Commit
git commit -m "Initial commit: Add README"

# Step 7: Connect to GitHub
# First, create a repository on GitHub (don't initialize with README)
git remote add origin https://github.com/username/my-first-repo.git

# Step 8: Push to GitHub
git push -u origin main

# Step 9: Verify on GitHub
# Your repository is now live!
```

### Creating a .gitignore

```bash
# Create .gitignore file
touch .gitignore

# Add common patterns
echo "# Dependencies
node_modules/
.env

# Build output
dist/
build/

# OS files
.DS_Store
Thumbs.db

# IDE files
.vscode/
.idea/
*.swp
*.swo
" > .gitignore

# Stage and commit
git add .gitignore
git commit -m "Add .gitignore"
```

---

## 8. Understanding .gitignore

### Purpose
The `.gitignore` file tells Git which files to ignore (not track).

### Syntax

```bash
# Comments start with #

# Ignore specific file
secret.txt

# Ignore specific path
config/local.properties

# Ignore all .log files
*.log

# Ignore all files in build directory
build/

# Ignore all .txt files except important.txt
*.txt
!important.txt

# Ignore all files in root except README
/*
!/README.md

# Ignore all .class files
*.class

# Negate (track) a previously ignored pattern
!important_file.txt
```

### Common .gitignore Patterns

```bash
# === Dependencies ===
node_modules/
vendor/
bundle/
Gemfile.lock
package-lock.json

# === Build/Output ===
dist/
build/
out/
*.o
*.so
*.dylib

# === Environment Variables ===
.env
.env.local
.env.*.local

# === IDE/Editor ===
.vscode/
.idea/
*.swp
*.swo
*~
.project
.classpath
.settings/

# === OS Files ===
.DS_Store
Thumbs.db
Desktop.ini
ehthumbs.db

# === Logs ===
*.log
logs/
npm-debug.log*

# === Testing ===
coverage/
.nyc_output/
.pytest_cache/

# === Temporary ===
tmp/
temp/
*.tmp
*.bak
```

### Gitignore Best Practices

1. **Always include .gitignore in your first commit**
2. **Don't ignore files that should be shared** (like package.json)
3. **Use specific patterns** (e.g., `*.log` instead of `*`)
4. **Test your .gitignore** before committing sensitive files
5. **Use global .gitignore** for OS-specific files

### Global .gitignore

```bash
# Set up global gitignore
git config --global core.excludesfile ~/.gitignore_global

# Create the global gitignore file
cat > ~/.gitignore_global << EOF
# OS files
.DS_Store
Thumbs.db

# IDE files
.vscode/
.idea/
*.swp
*.swo
EOF
```

---

## 9. Common Beginner Mistakes

### Mistake 1: Not Staging Before Committing
```bash
# Wrong
git commit -m "Add feature"

# Right
git add .
git commit -m "Add feature"
```

### Mistake 2: Vague Commit Messages
```bash
# Wrong
git commit -m "fix"
git commit -m "changes"
git commit -m "update"

# Right
git commit -m "fix: resolve login timeout issue"
git commit -m "feat: add user profile page"
git commit -m "docs: update README with installation steps"
```

### Mistake 3: Committing Too Much at Once
```bash
# Wrong: One giant commit with multiple unrelated changes
git add .
git commit -m "Add feature, fix bug, update docs"

# Right: Separate commits for separate changes
git add feature.js
git commit -m "feat: add user authentication"

git add bugfix.js
git commit -m "fix: resolve null pointer in login"

git add README.md
git commit -m "docs: update installation instructions"
```

### Mistake 4: Not Using .gitignore
```bash
# Wrong: Accidentally commit sensitive files
git add .env
git commit -m "Add config"

# Right: Use .gitignore
echo ".env" >> .gitignore
git add .gitignore
git commit -m "Add .gitignore for sensitive files"
```

### Mistake 5: Working on Main Branch
```bash
# Wrong: Direct changes to main
git checkout main
# ... make changes ...
git commit -m "Add feature"

# Right: Create feature branch
git checkout -b feature/new-feature
# ... make changes ...
git commit -m "feat: add new feature"
git checkout main
git merge feature/new-feature
```

### Mistake 6: Not Pulling Before Pushing
```bash
# Wrong
git push origin main

# Right
git pull origin main
git push origin main
```

### Mistake 7: Forgetting to Set Up Git
```bash
# Wrong: No identity set
git commit -m "Add feature"
# Warning: bad default signature

# Right: Configure identity first
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

---

## 10. Practice Exercises

### Exercise 1: Create Your First Repository
1. Create a new directory called `git-practice`
2. Initialize a Git repository
3. Create a README.md file
4. Make your first commit
5. Verify with `git log`

### Exercise 2: Practice Status and Diff
1. Create a file called `notes.txt`
2. Add some content
3. Check `git status`
4. Stage the file
5. Check `git status` again
6. Make changes to the file
7. Run `git diff`
8. Stage and commit

### Exercise 3: Practice .gitignore
1. Create a `.gitignore` file
2. Add patterns for:
   - All `.log` files
   - A specific `secret.txt` file
   - A `build/` directory
3. Create files matching these patterns
4. Verify they don't appear in `git status`

### Exercise 4: Practice Commit Messages
1. Make 5 commits with proper commit messages
2. Use different types: feat, fix, docs, test, chore
3. View history with `git log --oneline`

### Exercise 5: Practice Undoing Changes
1. Create a file and commit it
2. Make changes but don't stage them
3. Discard the changes with `git restore`
4. Make changes and stage them
5. Unstage with `git restore --staged`

---

## 📝 Cheat Sheet: Part 1 Commands

| Command | Description |
|---------|-------------|
| `git init` | Initialize new repository |
| `git clone <url>` | Clone existing repository |
| `git status` | Show working directory status |
| `git add <file>` | Stage file for commit |
| `git add .` | Stage all changes |
| `git commit -m "msg"` | Commit staged changes |
| `git log` | View commit history |
| `git log --oneline` | Compact history view |
| `git diff` | Show unstaged changes |
| `git diff --staged` | Show staged changes |
| `git rm <file>` | Remove file |
| `git mv <old> <new>` | Rename/move file |
| `git config --global user.name "name"` | Set username |
| `git config --global user.email "email"` | Set email |

---

## 🎯 Next Steps

Now that you understand Git fundamentals, move on to:
**Part 2: Intermediate Git** - Branching, merging, remote repositories, and collaboration.

---

*Based on: Pro Git Book, freeCodeCamp.org Git Course, Traversy Media Git Crash Course, Atlassian Git Tutorials*
