# Day 29: GitHub Repositories

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          GIT MASTERY - DAY 29                                 ║
║                        GITHUB PROFESSIONAL                                     ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

## Today's Objectives

- [ ] Understand GitHub repositories (local vs remote)
- [ ] Create repositories on GitHub
- [ ] Connect local repos to GitHub
- [ ] Master GitHub repository settings
- [ ] Write professional README files

---

## Video Reference

**Video**: [Git & GitHub Tutorial](https://youtu.be/RGOj5yH7evk)  
**Section**: GitHub Repository Setup  
**Timestamps**: 0:00 - 30:00

---

## Theory: Understanding GitHub

### What is GitHub?

GitHub is a **cloud-based hosting service** for Git repositories. It provides:
- Remote storage for your code
- Collaboration tools
- Project management features
- Social coding features

### GitHub vs Git

| Git | GitHub |
|-----|--------|
| Local version control tool | Cloud hosting service |
| Runs on your machine | Runs on servers |
| No account required | Account required |
| Command-line tool | Web UI + CLI |

### Repository Types on GitHub

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                          GITHUB REPOSITORY TYPES                            │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│   PUBLIC REPOSITORY                                                         │
│   ├─ Anyone can see                                                        │
│   ├─ Anyone can fork                                                       │
│   └─ Free to host                                                          │
│                                                                             │
│   PRIVATE REPOSITORY                                                        │
│   ├─ Only you (and collaborators) can see                                  │
│   ├─ Requires permission to view                                           │
│   └─ Free tier: limited private repos                                      │
│                                                                             │
│   INTERNAL REPOSITORY (Enterprise)                                          │
│   ├─ Organization-wide visibility                                          │
│   └─ Enterprise feature                                                    │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## Creating a GitHub Repository

### Method 1: GitHub Web Interface

1. Log in to GitHub.com
2. Click the **+** icon in top-right
3. Select **New repository**
4. Fill in details:
   - Repository name
   - Description
   - Public or Private
   - Add README
   - Add .gitignore
   - Choose license

### Method 2: Command Line

```bash
# Create on GitHub first, then clone
git clone https://github.com/username/repo-name.git

# Push existing local repo to GitHub
git remote add origin https://github.com/username/repo-name.git
git branch -M main
git push -u origin main
```

### Method 3: GitHub CLI

```bash
# Install GitHub CLI
# macOS: brew install gh
# Linux: sudo apt install gh

# Authenticate
gh auth login

# Create repo from command line
gh repo create my-repo --public
gh repo create my-repo --private
gh repo create username/repo --clone  # Clone immediately
```

---

## Repository Best Practices

### Naming Conventions

```
✅ GOOD naming:
├── my-project
├── api-client
├── user-authentication
└── machine-learning-course

❌ BAD naming:
├── My Project
├── my project
├── project
└── Untitled
```

**Rules:**
- Use lowercase letters
- Use hyphens (not underscores)
- Be descriptive but concise
- No spaces

### README.md Structure

```markdown
# Project Name

Brief description of what this project does.

## Features

- Feature 1
- Feature 2
- Feature 3

## Installation

```bash
npm install project-name
```

## Usage

```javascript
const project = require('project-name');
project.start();
```

## Contributing

Instructions for contributing.

## License

MIT License - see LICENSE file.
```

---

## Remote Configuration

### Understanding Remote URLs

```bash
# HTTPS URL (recommended for beginners)
https://github.com/username/repo.git

# SSH URL (recommended for professionals)
git@github.com:username/repo.git

# GitHub CLI
gh repo clone username/repo
```

### Managing Remotes

```bash
# View all remotes
git remote -v

# Add a remote
git remote add origin https://github.com/username/repo.git

# Change remote URL
git remote set-url origin new-url

# Rename remote
git remote rename origin upstream

# Remove remote
git remote remove origin
```

### Understanding origin vs upstream

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         REMOTE NAMING CONVENTION                            │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│   origin    → YOUR fork of the repository                                   │
│   upstream  → The original repository (for forking workflows)              │
│                                                                             │
│   ┌──────────────┐         ┌──────────────┐                              │
│   │   upstream   │◄───────│    origin     │                              │
│   │  (original)  │  fetch  │   (your fork) │                              │
│   └──────────────┘         └──────────────┘                              │
│          │                         │                                        │
│          │                    push/pull                                     │
│          │                         ▼                                        │
│          └────────────────────► ┌────────┐                                  │
│                                │  YOUR  │                                  │
│                                │ LOCAL  │                                  │
│                                └────────┘                                  │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## GitHub Repository Settings

### Important Settings

| Setting | Purpose | Recommendation |
|---------|---------|----------------|
| Visibility | Public/Private | Choose based on project |
| Default branch | Main branch name | Keep as main |
| Topics | Categorization | Add relevant topics |
| Wiki | Documentation | Enable for large projects |
| Issues | Bug tracking | Always enable |
| Projects | Kanban boards | Enable for teams |

### Collaborator Settings

```bash
# Add collaborator via GitHub CLI
gh repo collaborator add username

# Or via web interface:
# Settings → Collaborators → Add people
```

### Branch Protection (Preview for Day 34)

```
⚠️  This is a preview - detailed in Day 34

Settings → Branches → Branch protection rules:
├── Require pull request reviews
├── Require status checks
└── Include administrators
```

---

## GitHub License and gitignore

### Adding a License

```bash
# Choose license when creating repo
# Common licenses:
├── MIT License        - Most permissive, popular
├── Apache 2.0         - Patent rights included
├── GPL 3.0            - Copyleft, share modifications
└── Unlicense          - Public domain
```

### .gitignore Templates

GitHub provides templates for common languages:

```
.gitignore templates available for:
├── Node
├── Python
├── Java
├── Ruby
├── Go
├── Rust
├── .NET
└── Many more...
```

**Important:** Create `.gitignore` BEFORE first commit!

---

## Practice Exercises

### Exercise 1: Create Your First GitHub Repo (15 min)

1. Create a new repository on GitHub named `git-practice`
2. Initialize with README
3. Clone it to your local machine
4. Add a simple HTML file
5. Push to GitHub
6. Verify on GitHub web interface

**Commands:**
```bash
gh repo create git-practice --public --clone
cd git-practice
echo "<h1>Hello GitHub</h1>" > index.html
git add .
git commit -m "Add index.html"
git push
```

### Exercise 2: Connect Existing Local Repo (15 min)

1. Create a local repository with some commits
2. Create a new empty repository on GitHub
3. Connect them
4. Push your local commits

**Commands:**
```bash
# Local setup
mkdir my-local-project && cd my-local-project
git init
echo "# My Project" > README.md
git add . && git commit -m "Initial commit"

# Connect to GitHub
git remote add origin https://github.com/username/my-local-project.git
git branch -M main
git push -u origin main
```

### Exercise 3: Work with Multiple Remotes (20 min)

1. Fork a public repository (e.g., a popular open source project)
2. Clone your fork
3. Add the original as upstream
4. Fetch from both remotes

**Commands:**
```bash
gh repo fork owner/original-repo
cd original-repo
git remote add upstream https://github.com/owner/original-repo.git
git fetch upstream
git fetch origin
```

### Exercise 4: README Mastery (20 min)

Create a professional README for your portfolio project:

```markdown
# Project Title

One-line description.

## Badges (optional)

[![Build Status](https://travis-ci.org/user/repo.svg)](https://travis-ci.org/user/repo)

## Screenshots

![Screenshot](images/screenshot.png)

## Features

- Feature 1
- Feature 2
- Feature 3

## Quick Start

```bash
# Clone
git clone https://github.com/user/repo.git

# Install
npm install

# Run
npm start
```

## Documentation

For detailed docs, see [Wiki](link).

## Contributing

1. Fork it
2. Create your branch (`git checkout -b feature/amazing`)
3. Commit your changes
4. Push to the branch
5. Open a Pull Request

## License

MIT © [Your Name](https://github.com/user)
```

---

## Real-World Scenario

### Scenario: Setting Up Portfolio Repository

As a professional developer, you need a portfolio to showcase your work:

```bash
# 1. Create repository
gh repo create my-portfolio --public

# 2. Clone locally
git clone https://github.com/username/my-portfolio.git
cd my-portfolio

# 3. Create structure
mkdir projects
mkdir skills
mkdir experience

# 4. Add content
echo "# My Portfolio" > README.md

# 5. Commit and push
git add .
git commit -m "Initial portfolio setup"
git push -u origin main

# 6. Enable GitHub Pages (Settings → Pages → main branch)
```

---

## Common Mistakes

### Mistake 1: Creating repo with wrong name

**Problem:** Repository created with typo or wrong format

**Fix:**
```bash
# Delete and recreate
gh repo delete username/wrong-name
gh repo create correct-name --public
```

### Mistake 2: Forgetting to set upstream

**Problem:** "The current branch has no upstream branch"

**Fix:**
```bash
git push -u origin main  # First time only
# OR
git push --set-upstream origin main
```

### Mistake 3: Wrong remote URL

**Problem:** Push fails, authentication issues

**Fix:**
```bash
# Check current URL
git remote -v

# Update to correct URL
git remote set-url origin https://github.com/username/repo.git
```

### Mistake 4: Pushing to wrong repository

**Problem:** Pushed commits to someone's else repo

**Fix:**
```bash
# Check remote
git remote -v

# Update remote if needed
git remote set-url origin your-correct-url
```

---

## Checklist

- [ ] I understand the difference between Git and GitHub
- [ ] I can create a repository on GitHub
- [ ] I can clone a repository from GitHub
- [ ] I can connect a local repo to GitHub
- [ ] I understand origin vs upstream naming
- [ ] I can manage remote configurations
- [ ] I can write a professional README
- [ ] I understand repository visibility options

---

## Commands Reference

```bash
# GitHub CLI
gh auth login                    # Authenticate with GitHub
gh repo create <name>           # Create new repo
gh repo clone <repo>            # Clone repo
gh repo list                    # List your repos
gh repo fork <repo>             # Fork a repository

# Git remote management
git remote -v                   # View remotes
git remote add origin <url>     # Add remote
git remote set-url origin <url> # Change remote URL
git remote remove origin        # Remove remote
git remote rename origin upstream # Rename remote

# Git push/pull
git push -u origin main         # Push with upstream tracking
git push                        # Push to tracked branch
git pull                       # Pull from tracked branch
```

---

## Reading References

- [GitHub Docs: Creating a Repository](https://docs.github.com/en/repositories/creating-and-managing-repositories)
- [GitHub Flow Guide](https://guides.github.com/introduction/flow/)
- [Writing Good READMEs](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-readmes)

---

## Tomorrow's Preview

**Day 30: Pull Requests Deep Dive**

Tomorrow you'll learn:
- Creating effective pull requests
- PR descriptions and templates
- Draft pull requests
- PR review process
- Squash and merge strategies

---

## Navigation

← [Day 28: Month 1 Review](../week-4/day-28/lesson.md) | [Dashboard](../../dashboard.md) | [Day 30: Pull Requests Deep Dive](../day-30/lesson.md) →

---

**Estimated Time**: 4 hours (1h learning, 2h practice, 1h project)  
**Your Progress**: Day 29 of 56 (Week 5 - Day 1)  
**Next**: Pull Requests Deep Dive
