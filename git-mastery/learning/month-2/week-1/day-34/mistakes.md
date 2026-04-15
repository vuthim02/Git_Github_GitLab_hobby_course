# Day 34: Common Mistakes - Protected Branches

## Mistake 1: Protecting Wrong Branch

**Wrong:**
```
Branch name pattern: *
```

**Right:**
```
Branch name pattern: main
```

**Why:** Protecting all branches disables all work.

---

## Mistake 2: Forgetting CODEOWNERS File Location

**Wrong:**
```
CODEOWNERS           # Root directory
/codeowners        # Wrong name
```

**Right:**
```
.github/CODEOWNERS  # Correct location and name
```

**Why:** GitHub looks specifically in .github/

---

## Mistake 3: Requiring Too Many Reviews

**Wrong:**
```
Required approving reviews: 10
```

**Right:**
```
Required approving reviews: 1-2
```

**Why:** Too many reviews slow down development.

---

## Mistake 4: Not Including Administrators

**Problem:** Admins can bypass protection.

**Solution:**
```
✓ Include administrators
```

---

## Mistake 5: Requiring Unavailable Status Checks

**Problem:** Workflow doesn't exist or doesn't run on PR.

**Solution:**
- Verify workflow triggers on pull_request
- Enable workflow in repository

---

## Mistake 6: Force Pushing to Protected Branch

**Wrong:**
```
git push --force origin main  # WILL FAIL!
```

**Solution:**
- Never force push to protected branches
- Use revert/reset on local, push new

---

## Mistake 7: CODEOWNERS Syntax Errors

**Wrong:**
```
src /frontend/ @team     # Space in path!
* @user@github.com     # Wrong format
```

**Right:**
```
src/frontend/ @username
* @org/team
```

---

## Mistake 8: Not Updating Branch

**Error:** "branch is out of date"

**Solution:**
```bash
git fetch origin
git merge origin/main
# Or: git rebase main
git push
```

---

## Mistake 9: Checking All Boxes

**Problem:** Over-protection blocks everything.

**Solution:** Start with:
- Require 1 review
- Require status checks
- Add more as needed

---

## Mistake 10: Not Testing Protection

**Problem:** Don't test until critical moment.

**Solution:** Test with a small PR before relying on it.

---

## Lesson Learned

> "Protection should enable quality, not block all work. Start simple."

**Golden Rules:**
1. Protect main branch
2. Require 1 review minimum
3. Require working CI checks
4. Use CODEOWNERS for large repos
5. Test protection setup