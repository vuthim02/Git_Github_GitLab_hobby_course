# Day 7 Exercises: Week 1 Review & Practice

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          DAY 7 EXERCISES                                       ║
║                        WEEK 1 REVIEW & PRACTICE                                ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

---

## 🏃 Quick Review Exercises

### Exercise R1: Command Matching (10 minutes)

Match each command to its purpose:

| Command | Purpose |
|---------|---------|
| `git init` | 1. View commit history |
| `git add` | 2. Stage changes |
| `git commit` | 3. Check repository status |
| `git status` | 4. Initialize repository |
| `git log` | 5. Save staged changes |
| `git diff` | 6. Show changes between versions |
| `git show` | 7. View specific commit details |
| `git cat-file` | 8. Inspect Git objects |

### Exercise R2: Concept Fill-in (15 minutes)

Fill in the blanks:

1. Git is a ________ version control system.
2. The three areas in Git are: working directory, __________, and repository.
3. A __________ stores file content (without filename).
4. A __________ stores directory structure (with filenames).
5. A __________ is a snapshot with metadata.
6. SHA-1 hashes are generated from file __________.
7. The command to stage files is __________.
8. The command to commit is __________.
9. HEAD always points to the __________ commit/branch.
10. Content-addressable storage means the same content gets the same __________.

### Exercise R3: True or False (10 minutes)

Mark each statement as True or False:

1. _____ Git can only be used from command line.
2. _____ `git status -s` shows shorter output than `git status`.
3. _____ Blobs store filenames.
4. _____ Trees reference blobs.
5. _____ You can amend pushed commits.
6. _____ `git diff` shows staged changes.
7. _____ `git log --oneline` is compact format.
8. _____ A commit's parent is the previous commit.
9. _____ Git objects are stored in `.git/objects/`.
10. _____ The staging area is optional in Git.

---

## 🎯 Hands-On Challenges

### Challenge 1: Speed Run (20 minutes)

Complete this workflow as fast as you can:

1. Create new repo: `speed-run`
2. Configure identity (if needed)
3. Create 3 files: `a.txt`, `b.txt`, `c.txt`
4. Stage and commit them together
5. Modify all 3 files
6. Stage only 2 of them
7. Commit with message "Update two files"
8. View clean one-line history
9. Show what changed in the last commit

**Time yourself!** Target: Under 5 minutes with practice.

### Challenge 2: Detective Work (30 minutes)

**Scenario**: A commit says "Fix critical bug" but the bug still exists.

**Your task**:
1. Create this scenario
2. Investigate using Git commands
3. Find the real issue
4. Fix it properly
5. Document your investigation

**Commands to use**:
```bash
git log -p
git diff HEAD~1 HEAD
git show HEAD
git blame
```

### Challenge 3: Object Explorer (25 minutes)

In any repository with commits:

1. Find a commit hash
2. View the commit object
3. View the tree object
4. View at least one blob
5. Trace the complete chain
6. Document each step

---

## 📝 Scenario-Based Exercises

### Scenario 1: New Team Member

Your new teammate asks: "Can you explain Git to me in 2 minutes?"

**Your task**: Explain:
- What Git is
- Why use it
- Basic workflow
- 3 essential commands

**Deliverable**: Write your explanation:

_______________________________________________________________________________
_______________________________________________________________________________
_______________________________________________________________________________
_______________________________________________________________________________
_______________________________________________________________________________

### Scenario 2: Debugging Session

You're asked to find when a bug was introduced.

**Your task**:
1. Create repo with commits introducing bug
2. Use `git log -S` to search
3. Use `git blame` to track
4. Find the exact commit

**Commands needed**:
```bash
git log -S "buggy_string" --oneline -p
git blame file.txt
```

### Scenario 3: Code Review

You need to review a colleague's work.

**Your task**:
1. Create commits representing their work
2. Use history commands to review
3. Compare versions with diff
4. Write review comments

**Commands needed**:
```bash
git log --author="colleague"
git diff main..feature
git show --stat
```

---

## 🏆 Final Project: Portfolio Repository

### Instructions

Create a Git repository that serves as your personal portfolio project.

### Requirements

1. **Repository Setup**
   - [ ] Initialize repository
   - [ ] Configure identity
   - [ ] Create `.gitignore`

2. **Content**
   - [ ] README.md with project description
   - [ ] At least 3 meaningful files
   - [ ] Proper structure (folders allowed)

3. **Commits**
   - [ ] Minimum 5 commits
   - [ ] Proper commit messages (conventional style)
   - [ ] Logical grouping of changes

4. **Documentation**
   - [ ] Show history with graph
   - [ ] Show at least one diff
   - [ ] Include reflection on Git learning

### README Template

```markdown
# [Project Name]

## Description
[2-3 sentences about what this project does]

## Git Skills Demonstrated
- [ ] Initialized repository with git init
- [ ] Created meaningful commits
- [ ] Used proper commit messages
- [ ] Viewed and analyzed history
- [ ] Compared changes with git diff

## Week 1 Git Mastery Topics Covered
- [ ] Version Control Concepts
- [ ] Git Setup & Configuration
- [ ] Creating Repositories
- [ ] The Git Workflow
- [ ] Git Internals
- [ ] Viewing History & Differences

## Learning Reflection
[Write 2-3 paragraphs about what you learned in Week 1]

## Created
[Date]
```

---

## 📊 Self-Assessment Score

### Quiz Results

**Section A** (10 questions): ___/10
**Section B** (10 questions): ___/20

**Total Score**: ___/20

### Score Interpretation

| Score | Level | Action |
|-------|-------|--------|
| 18-20 | Expert | Ready for Week 2! |
| 15-17 | Proficient | Review weak areas |
| 12-14 | Developing | Review all topics |
| Below 12 | Beginning | Repeat Week 1 |

### Areas Needing Review

List topics with low confidence:

1. _________________________________________________
2. _________________________________________________
3. _________________________________________________

---

## ✅ Week 1 Completion Certificate

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                                                                               ║
║                           WEEK 1 COMPLETE!                                    ║
║                                                                               ║
║   Student: ______________________________                                      ║
║   Date: _______________________________                                        ║
║   Quiz Score: ___/20                                                                        ║
║                                                                               ║
║   Topics Mastered:                                                             ║
║   ✓ Version Control Fundamentals                                              ║
║   ✓ Git Setup & Configuration                                                  ║
║   ✓ Creating Repositories                                                      ║
║   ✓ The Git Workflow                                                           ║
║   ✓ Git Internals                                                              ║
║   ✓ Viewing History & Differences                                             ║
║                                                                               ║
║   Next: Week 2 - Branching Mastery                                            ║
║                                                                               ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

---

## 📚 Week 2 Preparation

### Before Starting Week 2, Review:

- [ ] Can explain branching conceptually
- [ ] Understand why branches are useful
- [ ] Ready to learn: git branch, git checkout, git merge

### Optional Pre-Reading

- [ ] Pro Git Chapter 3.1: What a Branch Is
- [ ] Atlassian Git Tutorial: Git Branching

---

## 🎉 Congratulations!

You've completed Week 1 of Git Mastery!

**What you've accomplished**:
- Learned version control fundamentals
- Set up Git properly
- Created and managed repositories
- Mastered the staging and commit workflow
- Understood Git internals
- Learned to view and compare history

**Keep practicing, and see you in Week 2!**
