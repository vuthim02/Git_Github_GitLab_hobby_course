# Day 44: Common Mistakes - GitHub Flow

## Mistake 1: Deploying Untested Code

**Wrong:**
```bash
git checkout main
git commit -m "Quick fix"
git push  # Auto-deploys!
# Bug in production!
```

**Why it's wrong:**
- No testing before production
- Breaks production
- No rollback plan

**Right:**
- Ensure CI/CD tests run on PR
- Wait for tests to pass
- Verify on staging if available
- Then merge

---

## Mistake 2: Long-Lived Feature Branches

**Problem:**
```bash
git checkout -b feature/big-feature
# 3 weeks of work
# 50 commits
# Massive PR
```

**Why it's bad:**
- Hard to review
- Merge conflicts
- Testing becomes difficult

**Solution:**
- Break into smaller features
- Ship incrementally
- Use feature flags

---

## Mistake 3: Bypassing PR Reviews

**Wrong:**
```bash
git checkout main
git merge feature/my-work --no-ff
git push  # No review!
```

**Why it's wrong:**
- No quality control
- Bugs reach production
- No documentation of changes

**Right:**
- Always use PR
- Get at least one review
- Address feedback

---

## Lesson Learned

> "GitHub Flow works best with: CI/CD, small frequent deploys, and continuous delivery."

**Key Points:**
1. Main is always deployable
2. Feature branches are short-lived
3. PRs are required
4. Automatic deployment on merge
5. Keep features small
