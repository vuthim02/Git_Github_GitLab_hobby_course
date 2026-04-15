# Day 19: Common Mistakes - GitHub Setup & Pull Requests

## Mistake 1: Not Adding Upstream

**Wrong:** Fork but never sync with original

**Right:**
```bash
git remote add upstream original-repo-url
```

## Mistake 2: Committing to Main in Fork

**Wrong:**
```bash
git checkout main
git commit -m "My changes"  # Wrong branch!
```

**Right:** Always use feature branches:
```bash
git switch -c fix-bug
git commit -m "Fix bug"
git push origin fix-bug
```

## Mistake 3: Not Syncing Before Starting Work

**Wrong:**
```bash
# Fork is outdated
git switch -c new-feature
# Work for days...
# Conflict when submitting PR
```

**Right:** Sync first:
```bash
git fetch upstream
git checkout main
git merge upstream/main
git switch -c new-feature
```

## Mistake 4: Large PRs

**Wrong:** One PR with 50 files changed

**Right:** Small, focused PRs:
- One feature/fix per PR
- Easy to review
- Faster merge

## Mistake 5: Wrong Base Branch

**Question:** Which branch should I PR into?

**Answer:** Usually `main` or `develop`, unless contributing to a feature branch.

## Lesson Learned

> "PRs are discussions about code. Keep them small, explain clearly, and stay responsive to feedback."

## PR Title Examples

**Good:**
- "Fix login button alignment on mobile"
- "Add user profile picture upload"

**Bad:**
- "Fixes"
- "My changes"
- "WIP"
