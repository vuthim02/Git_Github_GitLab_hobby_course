# Part 5: Git Internals & Advanced Topics

## 📚 Table of Contents

1. [Git Object Model](#1-git-object-model)
2. [Content-Addressable Storage](#2-content-addressable-storage)
3. [The .git Directory](#3-the-git-directory)
4. [Packfiles & Garbage Collection](#4-packfiles--garbage-collection)
5. [Refs, HEAD, and Branches](#5-refs-head-and-branches)
6. [The Commit DAG](#6-the-commit-dag)
7. [GitHub Actions & CI/CD](#7-github-actions--cicd)
8. [Git LFS & Large Repositories](#8-git-lfs--large-repositories)
9. [Git Protocols & Security](#9-git-protocols--security)
10. [Advanced Troubleshooting](#10-advanced-troubleshooting)
11. [Practice Exercises](#11-practice-exercises)

---

## 1. Git Object Model

### Overview

Git is a **content-addressable filesystem** with a version control system built on top. At its core, Git stores data as **objects** identified by SHA-1 hashes.

### Four Object Types

#### 1. Blob (Binary Large Object)

Stores **file content only** - no filename, no metadata.

```bash
# Create a blob manually
echo "Hello, Git!" | git hash-object --stdin
# Output: 0907f4a3c4740fa3a5c919cb4447fdb1f1a66aec

# Inspect blob content
git cat-file -p 0907f4a
# Output: Hello, Git!

# Check blob type
git cat-file -t 0907f4a
# Output: blob
```

**Key Properties:**
- Stores only content, not filenames
- Identical content = same blob (deduplication)
- Immutable once created

#### 2. Tree

Represents **directory structure** - maps filenames to blobs or other trees.

```bash
# Inspect tree object
git cat-file -p HEAD^{tree}
# Output:
# 100644 blob a1b2c3d... README.md
# 100644 blob d4e5f6a... package.json
# 040000 tree b7c8d9e... src
```

**Tree Structure:**
```
tree (root)
├── blob: README.md (100644)
├── blob: package.json (100644)
└── tree: src/
    ├── blob: index.ts (100644)
    └── blob: utils.ts (100644)
```

**File Modes:**
| Mode | Meaning |
|------|---------|
| 100644 | Regular file |
| 100755 | Executable file |
| 120000 | Symbolic link |
| 040000 | Directory (tree) |

#### 3. Commit

Stores **metadata about a snapshot** - points to a tree and parent commits.

```bash
# Inspect commit object
git cat-file -p HEAD
# Output:
# tree a1b2c3d4e5f6...
# parent 9f8e7d6c5b4a...
# author John Doe <john@example.com> 1709123456 -0500
# committer John Doe <john@example.com> 1709123456 -0500
#
# Add user authentication
```

**Commit Properties:**
- Points to exactly one tree (root directory snapshot)
- Points to zero or more parent commits
- Contains author and committer info
- Contains commit message
- Immutable once created

#### 4. Tag

An **annotated reference** to a commit (with additional metadata).

```bash
# Inspect tag object
git cat-file -p v1.0.0
# Output:
# object abc123def456...
# type commit
# tag v1.0.0
# tagger John Doe <john@example.com> 1709123456 -0500
#
# Version 1.0.0 release
```

### Object Relationships

```
commit (HEAD)
  │
  ▼
tree (root)
  ├── blob: README.md
  ├── blob: main.py
  └── tree: src/
      ├── blob: app.py
      └── blob: utils.py

tag (v1.0.0)
  │
  ▼
commit (abc1234)
  │
  ▼
tree
  └── ...
```

---

## 2. Content-Addressable Storage

### How It Works

Git stores objects in `.git/objects/` using their SHA-1 hash as the filename.

```bash
# View object directory structure
ls .git/objects/
# 0a/ 1b/ 2c/ 3d/ ... (directories named by first 2 hash characters)

# View specific object
ls .git/objects/09/
# 07f4a3c4740fa3a5c919cb4447fdb1f1a66aec (remaining 38 characters)
```

### Hash Calculation

```bash
# Git prepends header to content before hashing
# Format: "<type> <size>\0<content>"

# For a blob:
# "blob 13\0Hello, Git!"

# The hash is SHA-1 of this string
```

### Deduplication

```bash
# If two files have identical content, they share the same blob
echo "identical" > file1.txt
echo "identical" > file2.txt
git add .
git commit -m "Add two identical files"

# Both files reference the same blob
git ls-tree HEAD
# 100644 blob abc123... file1.txt
# 100644 blob abc123... file2.txt
```

### Inspecting Objects

```bash
# Show object content
git cat-file -p <hash>

# Show object type
git cat-file -t <hash>

# Show object size
git cat-file -s <hash>

# Show object info
git cat-file -p HEAD
git cat-file -p HEAD^{tree}
git cat-file -p v1.0.0
```

---

## 3. The .git Directory

### Directory Structure

```
.git/
├── HEAD                  # Points to current branch
├── config                # Repository configuration
├── description           # Repository description
├── hooks/                # Git hooks
│   ├── pre-commit.sample
│   ├── pre-push.sample
│   └── ...
├── info/
│   └── exclude           # Local ignore patterns
├── objects/              # Object database
│   ├── pack/             # Packed objects
│   ├── 0a/
│   ├── 1b/
│   └── ...
├── refs/                 # References
│   ├── heads/            # Local branches
│   │   ├── main
│   │   └── feature
│   ├── tags/             # Tags
│   │   └── v1.0.0
│   └── remotes/          # Remote branches
│       └── origin/
│           ├── main
│           └── feature
├── index                 # Staging area
├── logs/                 # Reflog
│   ├── HEAD
│   └── refs/
└── COMMIT_EDITMSG        # Last commit message
```

### Key Files

#### HEAD
```bash
# View HEAD
cat .git/HEAD
# Output: ref: refs/heads/main

# Or in detached HEAD state
cat .git/HEAD
# Output: abc123def456...
```

#### Config
```bash
# View repository config
cat .git/config

# Output:
# [core]
#     repositoryformatversion = 0
#     filemode = true
#     bare = false
#     logallrefupdates = true
# [remote "origin"]
#     url = https://github.com/user/repo.git
#     fetch = +refs/heads/*:refs/remotes/origin/*
# [branch "main"]
#     remote = origin
#     merge = refs/heads/main
```

#### Index (Staging Area)
```bash
# View index contents
git ls-files --stage

# Output:
# 100644 abc123... 0   README.md
# 100644 def456... 0   package.json
```

---

## 4. Packfiles & Garbage Collection

### Loose Objects vs Packfiles

#### Loose Objects
- One file per object
- Stored in `.git/objects/`
- Good for recent objects
- Takes more disk space

#### Packfiles
- Multiple objects packed together
- Stored in `.git/objects/pack/`
- Uses delta compression
- Much more efficient

### Garbage Collection

```bash
# Run garbage collection
git gc

# Aggressive garbage collection
git gc --aggressive

# Prune old objects
git prune

# Repack objects
git repack -a -d

# Verify repository integrity
git fsck
```

### What Happens During GC

1. Loose objects are packed into packfiles
2. Unreferenced objects are removed
3. Packfiles are optimized
4. Refs are pruned

### Packfile Structure

```
.git/objects/pack/
├── pack-abc123...idx      # Index file
└── pack-abc123.pack       # Pack file
```

### Inspecting Packfiles

```bash
# List objects in packfile
git verify-pack -v .git/objects/pack/pack-*.idx

# Show packfile stats
git count-objects -v

# Output:
# count: 150
# size: 580
# in-pack: 1500
# packs: 1
# size-pack: 2300
```

---

## 5. Refs, HEAD, and Branches

### What are Refs?

Refs are human-readable names that point to commits.

### Types of Refs

#### Branches
```bash
# Branch ref file
cat .git/refs/heads/main
# Output: abc123def456... (commit hash)

# Branch is just a file containing a commit hash
# Moving a branch = updating the file
```

#### Tags
```bash
# Lightweight tag
cat .git/refs/tags/v1.0.0
# Output: abc123def456... (commit hash)

# Annotated tag
cat .git/refs/tags/v1.0.0
# Output: def789abc012... (tag object hash)
```

#### HEAD
```bash
# Normal state (symbolic reference)
cat .git/HEAD
# Output: ref: refs/heads/main

# Detached HEAD state
cat .git/HEAD
# Output: abc123def456... (direct commit hash)
```

### Branch Operations

```bash
# Create branch (create file)
git branch feature
# Creates .git/refs/heads/feature with same hash as HEAD

# Switch branch (update HEAD)
git checkout feature
# Changes .git/HEAD to ref: refs/heads/feature

# Delete branch (remove file)
git branch -d feature
# Removes .git/refs/heads/feature
```

### Symbolic vs Direct Refs

```
Symbolic Reference (normal):
HEAD → refs/heads/main → abc123...

Direct Reference (detached):
HEAD → abc123...
```

---

## 6. The Commit DAG

### What is a DAG?

A **Directed Acyclic Graph** is a graph with directed edges and no cycles.

### Commit Graph

```
main:    A ← B ← C ← D ← E
                      ↑
feature: ─────────────┘ ← F ← G
```

### Properties

1. **Directed:** Commits point to parents (not vice versa)
2. **Acyclic:** No cycles (can't point back to itself)
3. **Immutable:** Once created, commit hash never changes

### Merge Commits

```
main:    A ← B ← C ← D ← E ← M (merge commit)
                      ↑           ↑
feature: ─────────────┘ ← F ← G ┘
```

Merge commits have **two parents**.

### Visualizing the DAG

```bash
# Simple graph
git log --graph --oneline

# All branches
git log --graph --oneline --all

# With decorations
git log --graph --oneline --decorate --all

# Example output:
# * abc1234 (HEAD -> main, origin/main) Merge branch 'feature'
# |\
# | * def5678 (feature) Add new feature
# | * 789abcd WIP feature
# |/
# * ghi9012 Initial commit
```

### Rebase and the DAG

Rebase **rewrites history** by creating new commits:

```
Before rebase:
main:    A ← B ← C
                      ↑
feature: ─────────────┘ ← D ← E

After rebase onto main:
main:    A ← B ← C ← D' ← E'
                      ↑
feature: ─────────────┘
```

Notice D' and E' are **new commits** with new hashes.

---

## 7. GitHub Actions & CI/CD

### What is CI/CD?

- **CI (Continuous Integration):** Automatically build and test code on every push
- **CD (Continuous Deployment):** Automatically deploy code after tests pass

### GitHub Actions Basics

```yaml
# .github/workflows/ci.yml
name: CI

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '20'
      
      - name: Install dependencies
        run: npm ci
      
      - name: Run tests
        run: npm test
      
      - name: Run linter
        run: npm run lint
```

### Workflow Structure

```yaml
name: Workflow Name          # Workflow name

on:                          # Triggers
  push:
    branches: [main]
  pull_request:
    branches: [main]
  schedule:
    - cron: '0 0 * * *'     # Daily at midnight

jobs:                        # Jobs
  job1:
    runs-on: ubuntu-latest   # Runner OS
    
    steps:                   # Steps
      - uses: actions/checkout@v4
      - run: echo "Hello"
      
  job2:
    needs: job1              # Dependencies
    runs-on: ubuntu-latest
    
    steps:
      - uses: actions/checkout@v4
```

### Common Actions

```yaml
# Checkout code
- uses: actions/checkout@v4

# Setup language runtime
- uses: actions/setup-node@v4
  with:
    node-version: '20'

# Cache dependencies
- uses: actions/cache@v4
  with:
    path: ~/.npm
    key: ${{ runner.os }}-node-${{ hashFiles('**/package-lock.json') }}

# Upload artifacts
- uses: actions/upload-artifact@v4
  with:
    name: build
    path: dist/

# Deploy to GitHub Pages
- uses: peaceiris/actions-gh-pages@v3
  with:
    github_token: ${{ secrets.GITHUB_TOKEN }}
    publish_dir: ./dist
```

### Secrets Management

```yaml
# Use secrets in workflow
- name: Deploy
  run: |
    echo "Deploying with token..."
    curl -H "Authorization: token ${{ secrets.DEPLOY_TOKEN }}" ...
  
# Environment variables
env:
  API_KEY: ${{ secrets.API_KEY }}
```

### Matrix Builds

```yaml
strategy:
  matrix:
    node-version: [18, 20, 22]
    os: [ubuntu-latest, windows-latest]
  
  steps:
    - uses: actions/checkout@v4
    - uses: actions/setup-node@v4
      with:
        node-version: ${{ matrix.node-version }}
    - run: npm test
```

---

## 8. Git LFS & Large Repositories

### What is Git LFS?

Git Large File Storage (LFS) replaces large files with text pointers in Git, storing the actual files on a remote server.

### Installation

```bash
# Install Git LFS
git lfs install

# Track large file types
git lfs track "*.psd"
git lfs track "*.zip"
git lfs track "*.mp4"

# Track by size
git lfs track "assets/**" --size=10M
```

### .gitattributes

```gitattributes
# .gitattributes
*.psd filter=lfs diff=lfs merge=lfs -text
*.zip filter=lfs diff=lfs merge=lfs -text
*.mp4 filter=lfs diff=lfs merge=lfs -text
assets/** filter=lfs diff=lfs merge=lfs -text
```

### LFS Commands

```bash
# Initialize LFS
git lfs install

# Track files
git lfs track "*.psd"

# List tracked patterns
git lfs track

# Untrack files
git lfs untrack "*.psd"

# Migrate existing files
git lfs migrate import --include="*.psd" --everything

# Check LFS status
git lfs status

# List LFS objects
git lfs ls-files
```

### Shallow Clones

```bash
# Clone without history (faster)
git clone --depth 1 https://github.com/user/repo.git

# Clone with limited history
git clone --depth 10 https://github.com/user/repo.git

# Deepen existing clone
git fetch --depth 100
```

### Partial Clones

```bash
# Clone without blobs (download on demand)
git clone --filter=blob:none https://github.com/user/repo.git

# Clone without trees
git clone --filter=tree:0 https://github.com/user/repo.git

# Clone with size limit
git clone --filter=blob:limit=1m https://github.com/user/repo.git
```

### Sparse Checkout

```bash
# Clone with sparse checkout
git clone --filter=blob:none --sparse https://github.com/user/repo.git

# Choose directories to checkout
git sparse-checkout set src/ tests/
git sparse-checkout add docs/
git sparse-checkout disable
```

---

## 9. Git Protocols & Security

### Git Protocols

#### HTTPS
```bash
# Clone via HTTPS
git clone https://github.com/user/repo.git

# Pros: Simple, works through firewalls
# Cons: Requires credentials for push
```

#### SSH
```bash
# Clone via SSH
git clone git@github.com:user/repo.git

# Pros: Secure, no password prompts
# Cons: Requires SSH key setup
```

#### Git Protocol
```bash
# Clone via git:// (fastest)
git clone git://github.com/user/repo.git

# Pros: Fastest
# Cons: Unencrypted, rarely used
```

### SSH Key Setup

```bash
# Generate SSH key
ssh-keygen -t ed25519 -C "your.email@example.com"

# Start ssh-agent
eval "$(ssh-agent -s)"

# Add key to agent
ssh-add ~/.ssh/id_ed25519

# Copy public key
cat ~/.ssh/id_ed25519.pub

# Add to GitHub/GitLab
```

### GPG Signing

```bash
# Generate GPG key
gpg --full-generate-key

# List keys
gpg --list-keys

# Configure Git to use key
git config --global user.signingkey <key-id>

# Sign commits
git commit -S -m "Signed commit"

# Sign tags
git tag -s v1.0.0 -m "Signed tag"

# Verify signatures
git verify-commit <commit-hash>
git verify-tag v1.0.0
```

### Security Best Practices

```bash
# Don't commit secrets
echo ".env" >> .gitignore
echo "*.key" >> .gitignore
echo "*.pem" >> .gitignore

# Use git-crypt for encrypted files
git-crypt init
git-crypt adduser email@example.com
echo "*.secret filter=git-crypt diff=git-crypt" >> .gitattributes

# Scan for secrets
# Tools: git-secrets, truffleHog, gitleaks
```

### Credential Management

```bash
# Cache credentials (15 minutes)
git config --global credential.helper cache

# Store credentials permanently
git config --global credential.helper store

# Use credential manager
git config --global credential.helper manager

# macOS Keychain
git config --global credential.helper osxkeychain
```

---

## 10. Advanced Troubleshooting

### Common Issues

#### Detached HEAD
```bash
# Problem: You're in detached HEAD state
git status
# HEAD detached at abc1234

# Solution: Create a branch
git checkout -b my-branch

# Or go back to main
git checkout main
```

#### Lost Commits
```bash
# Find lost commits
git reflog

# Output:
# abc1234 HEAD@{5}: commit: Important work

# Recover
git checkout abc1234
# Or create branch
git branch recovered abc1234
```

#### Merge Conflicts
```bash
# See conflicting files
git status

# Resolve conflicts in editor
# Then:
git add .
git merge --continue

# Or abort
git merge --abort
```

#### Corrupted Repository
```bash
# Verify integrity
git fsck

# Fix issues
git fsck --full

# Recover objects
git fsck --unreachable
```

### Recovery Commands

```bash
# Undo last commit (soft)
git reset --soft HEAD~1

# Undo last commit (hard)
git reset --hard HEAD~1

# Revert commit (safe)
git revert <commit>

# Recover deleted branch
git reflog
git branch recovered <commit-hash>

# Recover deleted commit
git reflog
git cherry-pick <commit-hash>

# Find lost objects
git fsck --unreachable
```

### Debugging Git

```bash
# View git configuration
git config --list

# View specific config
git config user.name

# View reflog
git reflog

# View git internals
git cat-file -p HEAD
git cat-file -p HEAD^{tree}

# Check repository size
git count-objects -v

# Verify repository
git fsck
```

### Performance Debugging

```bash
# Time git operations
GIT_TRACE=1 git push

# Profile git operations
GIT_PROFILE=1 git push

# View git performance
GIT_TRACE_PERFORMANCE=1 git push
```

---

## 11. Practice Exercises

### Exercise 1: Explore Git Objects

1. Create a repository with several commits
2. Use `git cat-file` to inspect objects
3. View blobs, trees, and commits
4. Understand the object relationships

### Exercise 2: Garbage Collection

1. Create and delete many objects
2. Run `git gc`
3. Compare repository size before and after
4. Inspect packfiles

### Exercise 3: Reflog Recovery

1. Make several commits
2. Accidentally reset to previous commit
3. Use reflog to find lost commits
4. Recover them

### Exercise 4: GitHub Actions

1. Create a simple workflow
2. Set up CI/CD pipeline
3. Add matrix builds
4. Use secrets

### Exercise 5: Git LFS

1. Install Git LFS
2. Track large files
3. Migrate existing files
4. Verify with `git lfs status`

---

## 📝 Cheat Sheet: Part 5 Commands

| Command | Description |
|---------|-------------|
| `git cat-file -p <hash>` | Show object content |
| `git cat-file -t <hash>` | Show object type |
| `git count-objects -v` | Count objects |
| `git gc` | Run garbage collection |
| `git fsck` | Verify repository |
| `git reflog` | View reflog |
| `git lfs install` | Install Git LFS |
| `git lfs track "*.ext"` | Track file type |
| `git lfs status` | Check LFS status |
| `git config --list` | View all config |
| `GIT_TRACE=1 git push` | Debug git |

---

## 🎯 Congratulations!

You've completed the entire Git roadmap from beginner to expert level!

### What You've Learned

**Part 1: Git Fundamentals**
- Version control concepts
- Git installation and configuration
- Basic Git workflow and commands

**Part 2: Intermediate Git**
- Branching and merging
- Remote repositories
- Pull requests and collaboration
- Merge conflicts

**Part 3: Advanced Git**
- Interactive rebase
- Cherry-picking and bisect
- Stash and worktree
- Hooks and reflog

**Part 4: Best Practices & Workflows**
- Commit conventions
- Branching strategies
- Code review guidelines

**Part 5: Git Internals & Advanced Topics**
- Object model and storage
- Packfiles and garbage collection
- GitHub Actions and CI/CD
- Git LFS and security

### Next Steps

1. **Practice daily** - Use Git in real projects
2. **Contribute to open source** - Practice collaboration
3. **Get certified** - GitHub Foundations Certification
4. **Teach others** - Share your knowledge
5. **Stay updated** - Follow Git developments

### Resources for Continued Learning

- **Pro Git Book:** https://git-scm.com/book
- **GitHub Docs:** https://docs.github.com
- **Atlassian Git Tutorials:** https://atlassian.com/git/tutorials
- **Learn Git Branching:** https://learngitbranching.js.org
- **GitHub Skills:** https://skills.github.com

---

*Based on: Pro Git Book, TheCodeForge Git Internals, GitHub Actions Documentation, Atlassian Advanced Git Tips*
