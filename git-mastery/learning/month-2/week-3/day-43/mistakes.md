# Day 43: Common Mistakes - Git Flow

## Mistake 1: Committing Directly to Main/Develop

**Wrong:**
```bash
git checkout main
git commit -m "Quick fix"  # NEVER DO THIS!
```

**Why it's wrong:**
- Breaks the Git Flow model
- Bypasses code review
- Makes history messy
- Difficult to track features

**Right:**
```bash
git checkout develop
git checkout -b feature/quick-fix
# Make changes
git commit -m "Fix bug X"
git push -u origin feature/quick-fix
# Create PR → Review → Merge to develop
```

---

## Mistake 2: Not Using Proper Branch Naming

**Wrong:**
```bash
git branch fix1
git branch newfeature
git branch hot
```

**Why it's wrong:**
- Unclear purpose
- Hard to track
- Confusing for team

**Right:**
```bash
git branch feature/user-authentication
git branch bugfix/login-timeout
git branch hotfix/security-patch
git branch release/v1.2.0
```

**Naming Convention:**
```
feature/<ticket>-description
bugfix/<ticket>-description
hotfix/<ticket>-description
release/v1.0.0
```

---

## Mistake 3: Keeping Feature Branches Too Long

**Problem:**
```
feature/login has been open for 3 months
- Conflicts with develop
- Hard to merge
- Code becomes stale
```

**Why it's bad:**
- Merge conflicts pile up
- Feature becomes hard to integrate
- Code review becomes overwhelming
- Team doesn't know what's in progress

**Solution:**
- Break large features into smaller ones
- Merge frequently to develop
- Use feature flags for unfinished work
- Set sprint boundaries

---

## Mistake 4: Skipping Code Review on Hotfixes

**Wrong:**
```bash
git checkout main
git checkout -b hotfix/urgent-fix
# Make quick fix
git checkout main
git merge hotfix/urgent-fix
git push  # No PR, no review!
```

**Why it's wrong:**
- Hotfixes are critical - bugs are more likely
- No oversight on production changes
- Violates workflow rules

**Right:**
```bash
git checkout main
git checkout -b hotfix/urgent-fix
# Make changes
# Create PR even for hotfix
# Get at least one approval
git checkout main
git merge hotfix/urgent-fix --no-ff
git push
```

---

## Mistake 5: Not Understanding When to Use Release Branches

**Confusion:**
- When do I create a release branch?
- Should I merge directly to main?

**Git Flow Rules:**
```
Create release branch when:
- All features for release are merged to develop
- Release is code-complete
- Only bug fixes go into release branch
- No new features

Direct to main ONLY for:
- Hotfixes
- Emergency production fixes
```

---

## Mistake 6: Forgetting to Merge Hotfix Back to Develop

**Problem:**
```bash
git checkout main
git merge hotfix/urgent-fix
git push  # Only merged to main!
# Develop never gets the fix!
```

**Why it's bad:**
- Bug will reappear when develop is released
- Inconsistent code between main and develop

**Right:**
```bash
# Merge to main
git checkout main
git merge hotfix/urgent-fix
git push

# ALSO merge to develop
git checkout develop
git merge hotfix/urgent-fix
git push

# And merge to release branches
git checkout release/v1.0
git merge hotfix/urgent-fix
git push
```

---

## Mistake 7: Merging Features to Main Instead of Develop

**Wrong:**
```bash
git checkout main
git merge feature/new-feature  # WRONG BRANCH!
```

**Right:**
```bash
git checkout develop
git merge feature/new-feature  # CORRECT!
```

**Remember:**
```
Feature branches → merge to develop
Release branches → merge to main + develop
Hotfix branches → merge to main + develop + all releases
```

---

## Lesson Learned

> "Git Flow provides structure, but the structure only works if everyone follows it consistently."

**Golden Rules:**
1. Never commit directly to main
2. Always use feature branches for new work
3. Keep branches short-lived
4. Merge hotfixes everywhere (main, develop, releases)
5. Use consistent branch naming
6. Create PRs even for hotfixes
