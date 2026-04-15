# Day 18: Common Mistakes - Pushing & Authentication

## Mistake 1: Forgetting to Set Upstream

**Wrong:**
```bash
git push  # Fails - no upstream set
```

**Right:**
```bash
git push -u origin branch  # First time
git push                  # After upstream set
```

## Mistake 2: Force Pushing

**Wrong:**
```bash
git push --force
# Can delete colleagues' work!
```

**Right:** Only force push when absolutely necessary:
```bash
git push --force-with-lease  # Safer option
```

## Mistake 3: Wrong Remote URL

**Wrong:**
```bash
git push origin mai  # Typo in branch
git push wrong-remote main  # Wrong remote
```

**Right:** Always verify:
```bash
git remote -v
git branch -vv
```

## Mistake 4: Ignoring Rejection

**Wrong:**
```bash
git push  # Rejected
git push --force  # Force through (dangerous!)
```

**Right:** Fetch, merge, then push:
```bash
git pull --rebase
git push
```

## Mistake 5: Credential Exhaustion

**Problem:** Password/token keeps asking

**Solution:**
```bash
git config --global credential.helper cache
# or
git config --global credential.helper store
```

## Lesson Learned

> "Push uploads commits. If remote has changes you don't, you must integrate them first. Pull before push is good practice."

## Push Safety Rules

1. Always pull before pushing
2. Use `--force-with-lease` not `--force`
3. Communicate with team about force pushes
4. Never force push to shared branches
