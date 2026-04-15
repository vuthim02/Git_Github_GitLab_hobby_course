# Day 5: Understanding Git Internals

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          GIT MASTERY - DAY 5                                  ║
║                       Understanding Git Internals                              ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

## 📋 Today's Objectives

By the end of this lesson, you will be able to:
- [ ] Explain the four main Git object types (blob, tree, commit, tag)
- [ ] Understand SHA-1 hashing and how Git identifies objects
- [ ] Navigate Git's object database
- [ ] Use plumbing commands to inspect Git internals

---

## 🎬 Video Lesson

**Video**: [Git Full Course](https://youtu.be/8JJ101D3knE)  
**Timestamp**: First 30 minutes  
**Duration**: ~30 minutes

Watch the video segment, then practice alongside this lesson.

---

## 📖 Theory

### Why Learn Git Internals?

Understanding Git internals helps you:
- Debug issues confidently
- Recover from mistakes
- Understand how Git really works
- Use advanced features effectively

### The Four Git Object Types

Git stores everything as objects in `.git/objects/`:

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                           GIT OBJECTS                                        │
│                                                                              │
│   ┌─────────┐    ┌─────────┐    ┌─────────┐    ┌─────────┐                │
│   │  BLOB   │    │  TREE   │    │ COMMIT  │    │   TAG   │                │
│   │         │    │         │    │         │    │         │                │
│   │ Content │    │ List of │    │ Points  │    │ Points  │                │
│   │  only   │───>│ references│──>│ to tree │───>│ to any  │                │
│   │(no name)│    │         │    │ + parent│    │ object  │                │
│   └─────────┘    └─────────┘    └─────────┘    └─────────┘                │
│                                                                              │
│   Stores:        Stores:         Stores:         Stores:                     │
│   - File         - Directory     - Snapshot      - Annotated                │
│     contents       listing       - Metadata       reference                  │
│   - No filename  - Filenames    - Parent(s)      - Message                  │
│   - No metadata  - Permissions   - Author/committer - Signer               │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### SHA-1 Hashes

Every object is identified by a SHA-1 hash:
- 40 hexadecimal characters
- Generated from content (not filename)
- Same content = same hash
- Unique identifier

```bash
# Example SHA-1 hash
a1b2c3d4e5f6789012345678901234567890abcd
```

### The Objects Directory

```
.git/objects/
├── a1/                    # First 2 chars = directory
│   └── b2c3d4...          # Rest of hash = filename
├── info/                  # Alternative object sources
└── pack/                  # Packed objects (compressed)
```

---

## 💻 Commands Reference

### Plumbing Commands

```bash
# Show object type
git cat-file -t <hash>

# Show object content
git cat-file -p <hash>

# List tree contents
git ls-tree <hash>

# Calculate hash of content
git hash-object <file>

# Read from database
git cat-file --batch
```

### Creating Objects Manually

```bash
# Create blob from file
git hash-object -w file.txt

# Create blob from stdin
echo "content" | git hash-object --stdin
```

### Finding Objects

```bash
# Find commit containing file
git log --all --full-history -- file.txt

# Find where branch points
git rev-parse branch-name

# Show file at specific commit
git show <commit>:file.txt
```

---

## 📝 BLOB (Binary Large Object)

### What It Is
A blob stores the **content** of a file.

### Key Points
- Only stores content, not filename
- No metadata (permissions, timestamps)
- Content hash determines blob hash
- Two files with same content = same blob

### Example
```bash
# Create a file
echo "Hello World" > hello.txt

# Get its hash
git hash-object hello.txt
# Output: 8ab686eafeb1f44702738c8b0f24f2567c36da6d

# View as blob
git cat-file -p 8ab686
# Output: Hello World

# Check type
git cat-file -t 8ab686
# Output: blob
```

### What Blob Stores
```
object type | content length | content
blob        | 11             | Hello World
```

---

## 📝 TREE (Directory Listing)

### What It Is
A tree represents a directory, containing references to blobs and other trees.

### Structure
```
<mode> <type> <hash>   <filename>
100644 blob a1b2c3...    file.txt
040000 tree d4e5f6...    subdirectory/
```

### Example
```bash
# View tree of current commit
git cat-file -p HEAD^{tree}

# Output might be:
# 100644 blob a1b2c3... README.md
# 100644 blob d4e5f6... index.html
# 040000 tree 789012... src/
```

### Properties
- Stores filenames with their hashes
- Preserves directory structure
- Points to blobs (files) and trees (subdirs)
- Each tree represents one directory

---

## 📝 COMMIT (Snapshot)

### What It Is
A commit is a snapshot of the entire project at one point in time.

### Structure
```
tree <tree-hash>
parent <parent-hash>
author John Doe <john@example.com> 1234567890 -0500
committer John Doe <john@example.com> 1234567890 -0500

Commit message here
```

### What It Contains
- Reference to root tree
- Parent commit(s)
- Author name, email, timestamp
- Committer name, email, timestamp
- Commit message

### Example
```bash
git cat-file -p HEAD
# tree a1b2c3d4...
# parent e5f6g7h8...
# author Jane Doe <jane@example.com> 1234567890 -0500
# committer Jane Doe <jane@example.com> 1234567890 -0500
#
# Add new feature
```

---

## 📝 TAG (Annotated Reference)

### What It Is
A tag is an annotated reference to any Git object (usually a commit).

### Two Types
1. **Lightweight tag** - Just a reference (like a branch)
2. **Annotated tag** - Full object with message, signer, timestamp

### Example
```bash
# Annotated tag
git tag -a v1.0 -m "Version 1.0 release"
git cat-file -p v1.0
# object a1b2c3...
# type commit
# tag v1.0
# tagger Jane Doe <jane@example.com> ...
#
# Version 1.0 release
```

---

## 🎯 How It All Connects

```
┌─────────────────────────────────────────────────────────────────────┐
│                    COMPLETE GIT HISTORY                              │
│                                                                     │
│   commit (HEAD)                                                      │
│       │                                                             │
│       ├── tree (root directory)                                     │
│       │   │                                                         │
│       │   ├── blob README.md                                        │
│       │   ├── blob index.html                                       │
│       │   └── tree src/                                             │
│       │       ├── blob main.py                                      │
│       │       └── blob utils.py                                     │
│       │                                                             │
│       └── parent commit                                             │
│           │                                                         │
│           └── tree ...                                              │
│               └── ...                                                │
│                                                                     │
│   tag (v1.0) ────── points to HEAD commit                           │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

---

## 🔬 Practical Exploration

### Exercise: Inspect Your Repository

```bash
# Go to a repo with commits
cd ~/workflow-practice

# 1. Find your latest commit hash
git log --oneline -1

# 2. View the commit object
git cat-file -p HEAD

# 3. View the tree
git cat-file -p HEAD^{tree}

# 4. View a file content from history
git cat-file -p HEAD:file-a.txt

# 5. Check blob types
git cat-file -t <blob-hash>
```

### Exercise: Create Objects Manually

```bash
# Create a temporary repo
mkdir /tmp/test-internals
cd /tmp/test-internals
git init

# Create blob manually
echo "test content" | git hash-object --stdin -w

# View it
git cat-file -p <hash>

# Compare to file hash
echo "test content" > file.txt
git hash-object file.txt
# Same hash!
```

---

## ⚠️ Common Mistakes

### Mistake 1: Confusing Hashes

```bash
# Don't need full hash
git cat-file -p HEAD  # Works with partial

# But must be unique
git cat-file -p abc   # Error if ambiguous
```

### Mistake 2: Forgetting -w Flag

```bash
# Just calculates hash
git hash-object file.txt

# Saves to database
git hash-object -w file.txt
```

### Mistake 3: Not Understanding Content Hashing

```bash
# Same content = same hash
echo "hello" | git hash-object --stdin
# 8ab686...

echo "hello" | git hash-object --stdin
# 8ab686... (same!)

# Different content = different hash
echo "world" | git hash-object --stdin
# 98as6d... (different)
```

---

## 🧠 Memory Aids

**BLOB** = Just content (like a file without name)

**TREE** = Directory listing (names + references)

**COMMIT** = Snapshot with metadata

**TAG** = Named reference (like a bookmark)

**"Content-addressable storage"** = Same content = same address

---

## 📝 Practice Checklist

- [ ] Examined `.git/objects` directory
- [ ] Used `git cat-file` to view objects
- [ ] Understood blob, tree, commit relationship
- [ ] Calculated hashes with `git hash-object`
- [ ] Traced history through commits
- [ ] Created objects manually

---

## 📚 Reading Reference

**Pro Git Book - Chapter 10**  
"Git Internals"  
https://git-scm.com/book/en/v2/Git-Internals-Git-Objects

---

## 🧭 Navigation

| ← Previous | Dashboard | Next → |
|-----------|-----------|--------|
| [Day 4: The Git Workflow](../day-4/lesson.md) | [Dashboard](../../dashboard.md) | [Day 6: Viewing History & Differences](../day-6/lesson.md) |

---

**Estimated Time**: 60 minutes  
**Your Progress**: Day 5 of 56  
**Next**: Day 6 - History & Differences
