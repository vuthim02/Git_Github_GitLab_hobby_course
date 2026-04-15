# Day 8: Common Mistakes - Branching Introduction

## Mistake 1: Forgetting Which Branch You're On

**Wrong:** Making commits without checking the current branch

**Right:** Always run `git branch` or `git status` before working

**How to Fix:**
```bash
# Check current branch
git branch --show-current

# Or use status
git status
```

## Mistake 2: Thinking Branches Copy Files

**Wrong:** Believing creating a branch duplicates all files

**Right:** Branches are just pointers - creating one is instant

**Explanation:**
```
Branches don't copy anything!
They just point to an existing commit.
Creating a branch = adding a 41-byte pointer
```

## Mistake 3: Confusing Local and Remote Branches

**Wrong:** Not understanding why `git branch` shows fewer branches than GitHub

**Right:** Local and remote branches are separate

**How to Fix:**
```bash
git branch          # Local only
git branch -a       # Local + remote
```

## Mistake 4: Deleting the Wrong Branch

**Wrong:** Deleting a branch with uncommitted work

**Right:** Always check branch status before deletion

**How to Fix:**
```bash
# Check for unmerged work
git branch --merged    # Safe to delete
git branch --no-merged # Contains unmerged work
```

## Mistake 5: Assuming Main is Always Default

**Wrong:** Hard-coding "main" as the only branch name

**Right:** Branch names vary - check with `git branch`

**Note:** GitHub now uses "main", but older repos may use "master"

## Mistake 6: Not Understanding HEAD

**Wrong:** Confusion about what "HEAD" means

**Right:** HEAD points to your current branch/commit

**Quick Test:**
```bash
cat .git/HEAD
# Usually shows: ref: refs/heads/main
```

## Lesson Learned

> "A branch in Git is simply a pointer to a single commit. Creating a branch takes less than a second because Git simply creates a new pointer - it doesn't copy any files."

Remember: Branches are cheap and safe to create. Don't be afraid to create branches for every new idea or task.
