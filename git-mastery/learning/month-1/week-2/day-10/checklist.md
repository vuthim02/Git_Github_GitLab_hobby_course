# Day 10 Checklist: Understanding HEAD

## Concept Checklist

- [ ] I understand HEAD is a pointer
- [ ] I know HEAD points to current location
- [ ] I understand the difference between HEAD and branches
- [ ] I know what detached HEAD means
- [ ] I understand when detached HEAD happens

## File Inspection Checklist

- [ ] Checked `.git/HEAD` in normal state
- [ ] Checked `.git/HEAD` in detached state
- [ ] Used `git rev-parse HEAD`
- [ ] Used `git reflog` to find past positions

## Command Reference

```bash
# Normal state
cat .git/HEAD
# Output: ref: refs/heads/main

# Detached state
cat .git/HEAD
# Output: abc1234... (commit hash)

# Navigation
git checkout HEAD~1    # One commit back
git checkout HEAD~2    # Two commits back
git checkout HEAD^     # One commit back (same)

# Save detached work
git switch -c new-branch
```

## Warning Signs

- [ ] "You are in 'detached HEAD' state" message
- [ ] No `ref:` in `.git/HEAD`
- [ ] Branch name shows as commit hash

## Safety Checklist

- [ ] Never make commits without a branch pointing to them
- [ ] Always create a branch if working in detached state
- [ ] Use `git reflog` to recover from mistakes

## Post-Lesson

- [ ] Completed all exercises
- [ ] Can explain what HEAD is
- [ ] Can work in detached HEAD safely
- [ ] Ready for Day 11: Merging Basics
