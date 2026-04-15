# Day 5 Checklist: Understanding Git Internals

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                         DAY 5 COMPLETION CHECKLIST                             ║
║                    Understanding Git Internals                                  ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

---

## 📖 Learning Objectives

### Core Concepts
- [ ] I understand the four Git object types (blob, tree, commit, tag)
- [ ] I can explain what SHA-1 hashing is and why Git uses it
- [ ] I understand content-addressable storage
- [ ] I know the difference between blobs and trees

### Commands
- [ ] I can use `git cat-file -t` to check object type
- [ ] I can use `git cat-file -p` to view object content
- [ ] I can use `git hash-object` to create blobs
- [ ] I can use `git ls-tree` to view directory contents
- [ ] I can use `git rev-parse` to resolve references

---

## ✅ Task Checklist

### Video & Reading
- [ ] Watched video segment (first 30 min)
- [ ] Read Pro Git chapter on internals
- [ ] Took notes on object types

### Hands-On Practice
- [ ] Explored `.git/objects` directory
- [ ] Used `git cat-file` on a commit
- [ ] Used `git cat-file` on a tree
- [ ] Used `git cat-file` on a blob
- [ ] Calculated hash with `git hash-object`
- [ ] Stored object with `git hash-object -w`
- [ ] Used `git ls-tree` to list directory
- [ ] Traced commit → tree → blob chain
- [ ] Verified content-addressing behavior

### Exercises Completed
- [ ] Exercise 1: Explore Object Database
- [ ] Exercise 2: Content Addressing
- [ ] Exercise 3: Trace Commit History
- [ ] Exercise 4: Manual Object Creation
- [ ] Exercise 5: Pack Files
- [ ] Exercise 6: Object Relationships
- [ ] Exercise 7: Debug with Plumbing
- [ ] Challenge: Build Mini Git

---

## 🎯 Knowledge Check

### Can You Answer These?

1. **What does a BLOB object store?**
   - [ ] File content only
   - [ ] File content with name
   - [ ] Directory listing
   - [ ] Commit metadata

2. **How is a Git object's hash determined?**
   - [ ] Random generation
   - [ ] Based on filename
   - [ ] Based on content
   - [ ] Sequential numbering

3. **What command shows an object's content?**
   - [ ] git show
   - [ ] git cat-file -p
   - [ ] git log
   - [ ] git diff

4. **What does a TREE object contain?**
   - [ ] File contents
   - [ ] Directory entries (names + references)
   - [ ] Commit history
   - [ ] Configuration

5. **What is content-addressable storage?**
   - [ ] Files stored by their names
   - [ ] Files stored by their path
   - [ ] Same content always gets same address
   - [ ] Random storage locations

---

## 📊 Self-Assessment

Rate your understanding (1-5):

| Topic | Rating | Notes |
|-------|--------|-------|
| Blob objects | ___ | |
| Tree objects | ___ | |
| Commit objects | ___ | |
| SHA-1 hashing | ___ | |
| Content-addressable storage | ___ | |
| Plumbing commands | ___ | |
| Overall Day 5 mastery | ___ | |

---

## ⏱️ Time Tracking

| Activity | Time Spent |
|----------|------------|
| Video lesson | ___ minutes |
| Reading documentation | ___ minutes |
| Hands-on practice | ___ minutes |
| Exercises | ___ minutes |
| **Total Time** | ___ minutes |

---

## 🐛 Errors Encountered

Document any errors or issues you faced:

1. _________________________________________________
2. _________________________________________________
3. _________________________________________________

**Solutions Found:**
1. _________________________________________________
2. _________________________________________________
3. _________________________________________________

---

## 💭 Reflection

### What Went Well
_______________________________________________________________

### What Was Challenging
_______________________________________________________________

### Aha! Moments
_______________________________________________________________

---

## 🎓 Sign-Off

### Prerequisites for Day 6

Before proceeding to Day 6, ensure you can:
- [ ] Name all four Git object types
- [ ] Explain what each object stores
- [ ] Use `git cat-file` commands
- [ ] Understand content-addressable storage

### Mark Completion

```
Day 5 Status: [ ] Not Started  [ ] In Progress  [ ] Complete
Completed On: ___________________
Time Spent: _______ minutes
```

### Next Steps

- [ ] Complete reflection journal
- [ ] Move to Day 6: Viewing History & Differences
- [ ] Update your progress dashboard

---

**Remember**: Understanding internals makes you a Git power user!

---

## 📝 Journal Prompt

Write 2-3 sentences about today's learning experience:

_______________________________________________________________________________
_______________________________________________________________________________
_______________________________________________________________________________

---

**Day 5 Checklist Complete!** ✓ (when all items marked)
