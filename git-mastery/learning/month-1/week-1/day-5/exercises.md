# Day 5 Exercises: Understanding Git Internals

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          DAY 5 EXERCISES                                       ║
║                    Understanding Git Internals                                  ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

---

## Exercise 1: Explore Object Database (Easy)

### Objective
Navigate Git's internal object database.

### Steps
1. Create a new repository with multiple commits
2. Explore the `.git/objects` directory
3. Use `find` to list all objects
4. Identify what type each object is

### Commands
```bash
# List all objects
find .git/objects -type f

# Check object type
git cat-file -t <hash>

# Check object content
git cat-file -p <hash>
```

### Questions
1. How many objects do you have?
2. What types are they (blob, tree, commit)?
3. Can you trace from a commit to its files?

### Success Criteria
- [ ] Listed all objects in repository
- [ ] Identified object types
- [ ] Traced commit → tree → blob chain

---

## Exercise 2: Understand Content Addressing (Medium)

### Objective
Learn how Git uses content to generate hashes.

### Steps
1. Create a test repository
2. Calculate hashes for identical content
3. Calculate hashes for different content
4. Observe that same content = same hash

### Commands
```bash
# Hash identical strings
echo "hello" | git hash-object --stdin
echo "hello" | git hash-object --stdin

# Hash different strings
echo "hello" | git hash-object --stdin
echo "world" | git hash-object --stdin

# With files
echo "test" > file1.txt
echo "test" > file2.txt
git hash-object file1.txt
git hash-object file2.txt
```

### Observations
| Content | Hash |
|---------|------|
| "hello" | _____ |
| "hello" | _____ |
| "world" | _____ |
| file1.txt | _____ |
| file2.txt | _____ |

### Key Insight
Two files with identical content share ONE blob object!

### Success Criteria
- [ ] Verified same content = same hash
- [ ] Understood deduplication
- [ ] Can explain content-addressable storage

---

## Exercise 3: Trace a Commit's History (Medium)

### Objective
Follow the chain from commit to tree to blobs.

### Steps
1. Find your HEAD commit hash
2. View the commit object
3. Find the tree hash
4. List tree contents
5. View individual blob contents

### Commands
```bash
# Get commit hash
git rev-parse HEAD

# View commit
git cat-file -p HEAD

# View tree
git cat-file -p HEAD^{tree}

# List recursively
git ls-tree -r HEAD
```

### Document This
```
Commit: _______________
├─ Tree: _______________
│  ├─ blob: README.md (________)
│  └─ blob: app.js (________)
└─ Parent: _______________
```

### Success Criteria
- [ ] Traced complete chain
- [ ] Documented structure
- [ ] Understood parent references

---

## Exercise 4: Manual Object Creation (Medium)

### Objective
Create Git objects without the usual commands.

### Steps
1. Create a new repository
2. Manually create a blob object
3. Verify it exists
4. Use it in a tree
5. Create a commit

### Commands
```bash
# Create blob
echo "Hello Git Internals" | git hash-object -w --stdin
# Get hash: abc123...

# Create tree (using staging area)
git update-index --add --cacheinfo 100644 <hash> greeting.txt
git write-tree

# Create commit
echo "First commit" | git commit-tree <tree-hash> -p $(git rev-parse HEAD)
```

### Questions
1. What does `--cacheinfo` do?
2. Why do you need `update-index`?
3. What's the purpose of `write-tree`?

### Success Criteria
- [ ] Created blob manually
- [ ] Created tree manually
- [ ] Created commit manually

---

## Exercise 5: Pack Files (Hard)

### Objective
Understand how Git packs objects for efficiency.

### Steps
1. Create repository with many commits
2. Check object count
3. Run garbage collection
4. Check packed objects

### Commands
```bash
# Count loose objects
find .git/objects -type f | wc -l

# Run garbage collection
git gc

# Check packed objects
ls -la .git/objects/pack/
find .git/objects/pack -type f

# Count objects again
find .git/objects -type f | wc -l
```

### Observations
| Metric | Before GC | After GC |
|--------|-----------|----------|
| Object count | _____ | _____ |
| Pack files | _____ | _____ |

### Success Criteria
- [ ] Ran gc manually
- [ ] Observed pack file creation
- [ ] Understood why packing occurs

---

## Exercise 6: Object Relationships (Hard)

### Objective
Map complete relationships between objects.

### Steps
1. Create a repository with this structure:
   ```
   project/
   ├── README.md
   └── src/
       └── main.js
   ```
2. Make multiple commits
3. Map all object relationships

### Document This
For each commit, document:
```
Commit #1: <hash>
├─ Tree: <hash>
│  ├─ blob: README.md (<hash>)
│  └─ tree: src/ (<hash>)
│     └─ blob: main.js (<hash>)
└─ Message: "Initial commit"
```

### Success Criteria
- [ ] Created multi-file repository
- [ ] Made multiple commits
- [ ] Documented all relationships

---

## Exercise 7: Debug with Plumbing (Medium)

### Objective
Use plumbing commands to debug a repository.

### Scenario
Your repository seems to have issues. Use internals to investigate.

### Tasks
1. Check if HEAD is valid
2. Verify all referenced objects exist
3. Find dangling objects (unreferenced)
4. Identify corrupt objects

### Commands
```bash
# Verify repository
git fsck

# Find dangling commits
git fsck --unreachable

# Find dangling blobs
git fsck --unreachable --no-reflogs 2>&1 | grep blob

# Check specific object
git cat-file -t <hash>
git cat-file -p <hash>
```

### Success Criteria
- [ ] Ran fsck on repository
- [ ] Found unreachable objects
- [ ] Understood fsck output

---

## 🏆 Challenge: Build a Mini Git

Create a simplified version of Git's object system in a script:

```python
#!/usr/bin/env python3
# mini-git.py

"""
A simplified Git-like object database.
Objects:
- blob: file content
- tree: directory listing
- commit: snapshot
"""

import hashlib
import os
import json

OBJECTS_DIR = ".mini-git/objects"

def hash_content(content):
    """Generate SHA-1 like hash."""
    return hashlib.sha1(content.encode()).hexdigest()

def store_blob(content):
    """Store content as a blob."""
    # Implement this
    pass

def store_tree(entries):
    """Store directory as a tree."""
    # Implement this
    pass

def main():
    """Main mini-git interface."""
    os.makedirs(OBJECTS_DIR, exist_ok=True)
    # Implement commands

if __name__ == "__main__":
    main()
```

### Success Criteria
- [ ] Script runs without errors
- [ ] Can store blobs
- [ ] Can retrieve blobs
- [ ] Demonstrates content-addressing

---

## 📋 Exercise Summary

| Exercise | Difficulty | Skills Practiced |
|----------|------------|------------------|
| 1 | Easy | Exploring object database |
| 2 | Medium | Content addressing |
| 3 | Medium | Tracing object chains |
| 4 | Medium | Manual object creation |
| 5 | Hard | Pack files & gc |
| 6 | Hard | Object relationships |
| 7 | Medium | Debugging with fsck |
| Challenge | Hard | Building mini-git |

---

## ✅ Checklist Before Proceeding

- [ ] Can explain four Git object types
- [ ] Can use `git cat-file` commands
- [ ] Can use `git hash-object`
- [ ] Understand SHA-1 content hashing
- [ ] Ready for Day 6: History & Differences

---

## 📚 Additional Resources

- [Pro Git - Git Internals](https://git-scm.com/book/en/v2/Git-Internals-Git-Objects)
- [Git Internals PDF](https://github.com/pluralsight/git-internals-pdf)
- [Visualizing Git](https://git-school.github.io/visualizing-git/)
