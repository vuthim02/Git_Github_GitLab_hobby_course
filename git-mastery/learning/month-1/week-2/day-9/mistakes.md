# Day 9: Common Mistakes - Creating & Switching Branches

## Mistake 1: Forgetting the `-c` Flag

**Wrong:**
```bash
git switch new-feature
# error: pathspec 'new-feature' did not match any file(s) known to git
```

**Right:**
```bash
git switch -c new-feature  # -c creates the branch
```

## Mistake 2: Switching with Uncommitted Changes

**Wrong:**
```bash
# Made changes, trying to switch
git switch other-branch
# error: Your local changes would be overwritten
```

**Right - Option 1:** Commit first
```bash
git add . && git commit -m "WIP"
git switch other-branch
```

**Right - Option 2:** Stash changes
```bash
git stash
git switch other-branch
# Later: git stash pop
```

## Mistake 3: Using `git checkout` Without Understanding It

**Note:** `git checkout` can do two things:
```bash
git checkout branch-name  # Switch branches
git checkout -- file.txt  # Discard changes to a file
```

This dual purpose can cause confusion. Use `git switch` instead for branches.

## Mistake 4: Typo in Branch Name

**Wrong:**
```bash
git switch feature-login
# error: branch 'feature-logi' not found
```

**Right:** Always verify branch names with `git branch`

## Mistake 5: Switching to Same Branch

**Note:** This isn't an error, just unnecessary:
```bash
git switch main  # Already on main
# No-op, nothing happens
```

## Lesson Learned

> "The `-c` flag stands for 'create'. Think of it as 'switch and create' = `git switch -c`"

Remember:
- `git switch` = switch only
- `git switch -c` = create and switch
- `git switch -` = go back where you came from
