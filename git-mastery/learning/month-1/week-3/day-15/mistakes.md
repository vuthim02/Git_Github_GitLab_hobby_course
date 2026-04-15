# Day 15: Common Mistakes - Git Remote Basics

## Mistake 1: Confusing Remote and Branch

**Wrong:** Thinking `origin` is a branch

**Right:** `origin` is a remote (URL alias). `origin/main` is a remote-tracking branch.

```
origin = URL https://github.com/user/repo.git
origin/main = remote-tracking branch (in your .git)
```

## Mistake 2: Typo in Remote Name

**Wrong:**
```bash
git remote add orgin url
git push orgin main  # Fails!
```

**Right:** Double-check names:
```bash
git remote -v  # Verify
```

## Mistake 3: Wrong URL Format

**Wrong:** 
```bash
git remote add origin username/repo
# Missing .git or full URL
```

**Right:**
```bash
git remote add origin https://github.com/user/repo.git
# or
git remote add origin git@github.com:user/repo.git
```

## Mistake 4: HTTPS vs SSH Confusion

**Question:** Which should I use?

**Answer:** 
- HTTPS: Easier setup, requires token
- SSH: No password, requires key setup

Both work; choose based on your setup.

## Mistake 5: Deleting Remote by Accident

**Wrong:**
```bash
git remote remove origin
# Lost connection to remote!
```

**Right:** Always verify before removing
```bash
git remote -v  # Check first
```

## Lesson Learned

> "A remote is just a bookmark for a URL. Git stores it so you don't have to type the full URL every time."
