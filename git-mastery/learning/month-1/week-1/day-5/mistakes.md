# Day 5 Mistakes: Understanding Git Internals

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          COMMON MISTAKES                                       ║
║                    Understanding Git Internals                                  ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

---

## 🚫 Mistake 1: Confusing Objects with Files

### The Problem
Thinking Git objects are just copies of files.

```bash
# WRONG understanding:
# "Git stores the entire file every time it changes"

# RIGHT understanding:
# "Git stores content as blobs, referenced by hash"
# "Same content = same blob (deduplication)"
```

### Why It's Bad
- Don't understand Git's efficiency
- Confused about storage usage
- Miss the content-addressable concept

### The Fix
```bash
# Git stores CONTENT, not files
# Two files with same content = one blob

echo "hello" > file1.txt
echo "hello" > file2.txt
git add .
git hash-object file1.txt
git hash-object file2.txt
# Same hash!
```

### Prevention
- Remember: Git stores content, not files
- Blobs have no filename (trees add that)
- Deduplication is automatic

---

## 🚫 Mistake 2: Using Full Hashes

### The Problem
Thinking you need to use complete 40-character hashes.

```bash
# Unnecessarily long
git cat-file -p a1b2c3d4e5f6789012345678901234567890abcd

# Git can use short hashes!
git cat-file -p a1b2c3d
# As long as it's unique
```

### Why It's Not Always Wrong
- Short hashes work when unique
- Git will error if ambiguous

### The Fix
```bash
# Minimum unique prefix (usually 4+ chars)
git cat-file -t HEAD
git cat-file -t a1b2  # Works if unique

# Get short hash
git rev-parse --short HEAD
```

### Prevention
- Git commands accept short hashes
- But ensure uniqueness!
- Use `--short` for display

---

## 🚫 Mistake 3: Not Understanding Tree References

### The Problem
Confusing trees with directories.

```bash
# Trees are NOT the actual directories
# Trees are Git objects that REFERENCE other objects

# This is WRONG:
cat .git/objects/tree/...

# Trees are stored like blobs:
# .git/objects/<first 2>/<rest 38>
```

### Why It's Bad
- Can't find or examine trees manually
- Confused about Git's storage

### The Fix
```bash
# Trees are accessed by hash, not path
git cat-file -p HEAD^{tree}
git ls-tree HEAD
```

### Prevention
- Trees are objects like blobs
- Stored in same objects directory
- Accessed via hash

---

## 🚫 Mistake 4: Forgetting -w Flag on Hash-Object

### The Problem
Using `git hash-object` without understanding its modes.

```bash
# Mode 1: Calculate hash only (no storage)
git hash-object file.txt
# abc123... (just the hash)

# Mode 2: Calculate AND store
git hash-object -w file.txt
# abc123... (stored in .git/objects)

# The -w flag WRITES to database
```

### Why It's Bad
- Wondering why objects aren't appearing
- Assuming object was created when it wasn't

### The Fix
```bash
# To see object later, must write it
git hash-object -w file.txt
git cat-file -p abc123
```

### Prevention
- Remember: `-w` = write/store
- Without it, just calculates hash

---

## 🚫 Mistake 5: Confusing Parent and Tree References

### The Problem
Not understanding commit's two main references.

```bash
# Each commit has:
# 1. TREE reference - what changed
# 2. PARENT reference - where from

git cat-file -p HEAD
# tree a1b2c3...          <- Points to root directory
# parent e5f6g7...        <- Points to previous commit
# author Jane ...
# committer Jane ...
```

### Why It's Bad
- Can't trace history properly
- Don't understand Git's linked-list structure

### The Fix
```bash
# Navigate tree
git cat-file -p HEAD^{tree}

# Navigate parent
git cat-file -p HEAD^1
```

### Prevention
- Tree = snapshot of files
- Parent = previous commit
- Together they form history chain

---

## 🚫 Mistake 6: Thinking Blob Contains Filename

### The Problem
Believing blobs store the filename.

```bash
# WRONG: Blobs do NOT store filenames
# 100644 blob a1b2c3...    README.md
#                             ^^^^^^^^
# Filename is in the TREE, not the blob
```

### Why It's Bad
- Don't understand tree's purpose
- Confused about how Git tracks renames

### The Fix
```
# BLOBS store: content only
# TREES store: filename + blob reference

# Example tree entry:
# 100644 blob abc123...  README.md
#           ^^^^^^^      ^^^^^^^^
#           blob hash    filename
```

### Prevention
- Blobs are pure content
- Trees add structure (names)
- Together = filesystem representation

---

## 🚫 Mistake 7: Modifying Objects Directly

### The Problem
Trying to edit files in `.git/objects`.

```bash
# DANGEROUS: Don't do this!
vim .git/objects/a1/b2c3d4...

# Git objects are:
# 1. Compressed
# 2. SHA-1 named
# 3. Internally structured
```

### Why It's Bad
- Objects are compressed
- Changing content changes hash
- Breaks Git's consistency
- Could corrupt repository

### The Fix
```bash
# Instead of editing objects:
# Just make a new commit!

# This creates new objects
# Old objects remain until gc
git add edited-file.txt
git commit -m "Update content"
```

### Prevention
- Never edit `.git/objects` directly
- Always use Git commands
- Git maintains integrity automatically

---

## 🚫 Mistake 8: Confusing Plumbing and Porcelain

### The Problem
Not knowing which commands are low-level.

```bash
# PLUMBING (low-level, for scripts)
git cat-file
git hash-object
git ls-tree
git write-tree
git commit-tree

# PORCELAIN (user-friendly)
git add
git commit
git status
git log
```

### Why It's Bad
- Using wrong commands for tasks
- Missing powerful low-level options

### The Fix
```bash
# Plumbing commands:
# - More control
# - Scriptable
# - Can bypass normal workflows

# Porcelain commands:
# - User-friendly
# - Multiple operations
# - Safer for humans
```

### Prevention
- Know the difference
- Use plumbing for automation
- Use porcelain for daily work

---

## 🚫 Mistake 9: Forgetting That Trees Are Recursive

### The Problem
Not understanding tree hierarchy.

```bash
# Trees can contain other trees!
# Root tree
git cat-file -p HEAD^{tree}
# 100644 blob abc...  README.md
# 040000 tree def...  src/

# Subdirectory tree
git cat-file -p def...
# 100644 blob ghi...  main.js
# 100644 blob jkl...  utils.py
```

### Why It's Bad
- Can't navigate full directory structure
- Don't understand recursive nature

### The Fix
```bash
# Use -r for recursive listing
git ls-tree -r HEAD

# Shows all files with paths:
# README.md
# src/main.js
# src/utils.py
```

### Prevention
- Trees reference other trees
- Blobs are leaf nodes
- Together form complete filesystem

---

## 🚫 Mistake 10: Not Understanding SHA-1 Collisions

### The Problem
Worrying about SHA-1 collisions.

```bash
# Theoretical concern:
# SHA-1 produces 2^160 possible hashes
# Collisions are astronomically unlikely
# But see: https://shattered.io/

# Practical Git use is still safe:
# Git combines SHA-1 with other checks
# Content integrity is verified
```

### Why It's Not Always Wrong
- SHA-1 has known weaknesses
- For maximum security, use SHA-256 (Git supports it)
- But practical risk is extremely low

### The Fix
```bash
# For most uses, SHA-1 is fine
# For maximum security:
git config --global hash алгоритм sha256

# Or new repos can use SHA-256
git init --object-format=sha256
```

### Prevention
- Understand risks vs practicality
- For code, SHA-1 is still standard
- Keep backups of important data

---

## 📋 Quick Reference: Object Commands

| Command | Purpose | Example |
|---------|---------|---------|
| `git cat-file -t` | Show object type | `git cat-file -t HEAD` |
| `git cat-file -p` | Show object content | `git cat-file -p abc123` |
| `git hash-object` | Calculate hash | `git hash-object file.txt` |
| `git hash-object -w` | Store object | `git hash-object -w file.txt` |
| `git ls-tree` | List tree contents | `git ls-tree HEAD` |
| `git rev-parse` | Resolve references | `git rev-parse HEAD` |

---

## 🛡️ Best Practices Checklist

- [ ] Use plumbing commands for debugging
- [ ] Remember blobs = content, trees = structure
- [ ] Use short hashes when unique
- [ ] Never edit objects directly
- [ ] Understand content-addressing
- [ ] Know the difference between plumbing and porcelain

---

## 💡 Key Takeaway

> "Git is a content-addressable filesystem with a VCS interface."
> 
> - Content addressing is Git's core innovation
> - Everything is an object
> - Objects are immutable
> - History is a chain of commits

---

## 📚 Related Links

- [Git Internals Documentation](https://git-scm.com/book/en/v2/Git-Internals-Git-Objects)
- [Understanding Git Conceptually](https://git-scm.com/book/en/v2/Git-Internals-Plumbing-and-Porcelain)
- [Visualizing Git Objects](https://git-school.github.io/visualizing-git/)
