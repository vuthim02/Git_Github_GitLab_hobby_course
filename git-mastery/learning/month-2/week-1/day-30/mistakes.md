# Day 30: Common Mistakes - Pull Requests

## Mistake 1: PR Without Description

**Bad:**
```bash
gh pr create --title "Fix"
# No body at all!
```

**Problem:** Reviewers don't know what the PR does.

**Better:**
```bash
gh pr create \
  --title "Fix login timeout bug" \
  --body "## Summary
Fixes the login timeout issue when user session expires.

## Changes
- Added session refresh logic
- Updated timeout from 15 to 30 minutes

## Testing
- Manual testing: ✓
- Unit tests: ✓"
```

**Rule:** Always include what, why, and how tested.

---

## Mistake 2: Force Pushing to Main

**WRONG:**
```bash
git push --force origin main  # NEVER DO THIS!
```

**Why:**
- Rewrites shared history
- Breaks teammates' local repos
- Loses commits
- Causes confusion

**If you must (rare cases):**
```bash
git push --force-with-lease origin main
# --force-with-lease is safer (won't push if someone else pushed)
```

**Rule:** Never force push to shared branches (main, develop, etc.)

---

## Mistake 3: Not Syncing PR with Latest Main

**Problem:**
```
PR created with old code, has conflicts when merging.
```

**Fix - Before creating PR:**
```bash
# Make sure your branch is up to date
git fetch origin
git rebase origin/main
# Resolve any conflicts
git push --force-with-lease
```

**Fix - After conflicts appear:**
```bash
git fetch origin
git checkout feature-branch
git merge origin/main
# Resolve conflicts
git add .
git commit -m "Resolve merge conflicts"
git push
```

---

## Mistake 4: Creating PR Too Early

**Problem:** PR with incomplete/wip code blocking reviews

**Solution - Use Draft PRs:**
```bash
gh pr create --draft --title "WIP: Login feature"
# Or on GitHub: Check "Create as draft"
```

**Draft vs Ready:**
```
Draft PR:
- Gray shield icon
- Cannot be merged
- For work-in-progress

Ready PR:
- Green checkmark
- Ready for review
- Can be merged when approved
```

---

## Mistake 5: Too Many Commits in PR

**Problem:** Commit history is messy

```
commit 1: WIP
commit 2: Fix WIP
commit 3: Oops fix again
commit 4: Fix the fix
commit 5: Actually this works
```

**Solution - Squash before merge:**
```bash
# On GitHub: Use "Squash and merge" button

# Or locally:
git rebase -i HEAD~5
# Change all but first "pick" to "squash"
```

**When to squash:**
- Feature branches with messy commits
- Before merging to main
- When commits don't add value individually

**When NOT to squash:**
- Commits have meaningful messages
- Bug fixes that should be tracked separately
- When commit history is already clean

---

## Mistake 6: Responding to Reviews Defensively

**Bad:**
```
Reviewer: "This could be simpler"
Author: "No, this is the way I want it"
```

**Why it's bad:**
- Misses opportunity to learn
- Creates tension
- Delays PR

**Good responses:**
```
Reviewer: "This could be simpler"
Author: "Good point! Here's the updated version."

Reviewer: "Why didn't you use X?"
Author: "I wasn't aware of X. Let me look into it."

Reviewer: "I disagree with this approach"
Author: "Let's discuss. Here's my reasoning... What do you think?"
```

---

## Mistake 7: Not Deleting Branches After Merge

**Problem:**
```bash
git branch  # Many old branches pile up
# old-feature
# experiment
# fix-typo
# dead-branch-123
```

**Solution - Always delete merged branches:**
```bash
# On GitHub: Check "Delete branch" when merging

# Or manually:
git branch -d feature-branch        # Local (safe)
git push origin --delete feature-branch  # Remote
```

**GitHub CLI:**
```bash
gh pr merge 123 --delete-branch
```

---

## Mistake 8: Forgetting to Link Issues

**Problem:** PR merged, but issue still open

**Solution - Link PR to issue:**
```bash
# In PR body:
# Fixes #123
# Closes #456
# Resolves #789

# On GitHub: Keywords work automatically
# fix/fixes/fixed
# close/closes/closed
# resolve/resolves/resolved
# followed by #number
```

**Result:**
- PR merged
- Linked issue automatically closed

---

## Mistake 9: Reviewing Code Without Context

**Bad:** Just saying "looks good" or "I don't like this"

**Good:** Be specific and constructive:
```
"Consider extracting this into a function for reusability."

"This variable name could be more descriptive, e.g., 'userCount' 
instead of 'n'."

"Nice use of the Strategy pattern here! Might be worth adding a 
brief comment explaining why this approach was chosen."
```

---

## Mistake 10: Not Using PR Templates

**Problem:** Inconsistent PR descriptions, missing information

**Solution - Create template:**
```bash
mkdir -p .github
cat > .github/PULL_REQUEST_TEMPLATE.md << 'EOF'
## Summary
<!-- What does this PR do? -->

## Changes
<!-- List specific changes -->

## Testing
<!-- How was this tested? -->

## Checklist
- [ ] Tests added
- [ ] Documentation updated
- [ ] No breaking changes (or documented)
EOF
```

**Result:** Every PR has consistent information.

---

## Mistake 11: Merging Your Own PR Without Review

**Problem:** Bypassing the review process

**In team settings:**
- PRs should be reviewed by others
- This catches bugs
- Spreads knowledge
- Ensures quality

**Exceptions (solo projects):**
- Personal projects
- Documentation fixes
- Obvious typo fixes

**Rule:** When working in a team, get reviews before merging.

---

## Mistake 12: Not Checking CI/CD Status

**Problem:** PR approved but CI fails on merge

**Before approving/merging:**
```bash
gh pr checks 123
# Check if all status checks pass
```

**Wait for:**
- ✓ All checks passed
- ✓ Reviews approved
- ✓ No conflicts

**Only then merge.**

---

## Lesson Learned

> "A Pull Request is not just code - it's a conversation, a learning opportunity, and a record of why changes were made."

**Golden Rules:**
1. Always write a description
2. Keep commits clean (squash if needed)
3. Sync with main before creating PR
4. Respond to reviews professionally
5. Delete branches after merging
6. Link issues to PRs
7. Use draft PRs for work in progress
