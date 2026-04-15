# Day 32: Common Mistakes - Issues & Projects

## Mistake 1: Vague Issue Titles

**Wrong:**
```
Login issue
Problem
It doesn't work
Feature
```

**Right:**
```
Bug: Login fails when password contains special characters
Feature: Add dark mode support
Docs: Need API usage examples
```

**Why:** Clear titles help with:
- Quick scanning
- Searchability
- Prioritization

---

## Mistake 2: No Steps to Reproduce

**Wrong:**
```
Bug: The form doesn't work
```

**Right:**
```
Bug: Form validation fails

Steps to reproduce:
1. Go to /login
2. Enter password with special chars (!@#$)
3. Click submit
4. See error message

Expected: Login succeeds
Actual: Error "Invalid characters"
```

**Why:** Developers need clear steps to fix bugs.

---

## Mistake 3: Missing Labels

**Problem:** Issues are hard to find and prioritize.

**Fix:**
```bash
gh issue edit 42 --add-label "bug" --add-label "priority-high"
```

**Best Practice:**
- Always add at least one label
- Use consistent labeling scheme
- Use priority labels for triage

---

## Mistake 4: No Milestone Assignment

**Problem:** Issues get lost, no release tracking.

**Fix:**
```bash
# Add to milestone
gh issue edit 42 --milestone "v1.0"

# Create milestone if needed
gh api repos/OWNER/REPO/milestones \
  --method POST \
  --field title="v1.0" \
  --field due_on="2024-12-31T00:00:00Z"
```

**Why:** Milestones provide:
- Release tracking
- Due date management
- Progress overview

---

## Mistake 5: Not Using Project Boards

**Problem:** No visual overview of project status.

**Solution:**
```
1. Go to Projects tab
2. Create new project
3. Choose Board template
4. Add columns:
   - Backlog
   - To Do
   - In Progress
   - In Review
   - Done
5. Add issues to board
6. Drag as work progresses
```

**Benefits:**
- Visual status
- Bottleneck detection
- Team coordination

---

## Mistake 6: Creating Issues Without Templates

**Problem:** Inconsistent issue information.

**Solution:**
```bash
mkdir -p .github/ISSUE_TEMPLATE

cat > .github/ISSUE_TEMPLATE/bug_report.md << 'EOF'
---
name: Bug report
about: Create a report to help us improve
title: '[Bug]: '
labels: bug
---

## Bug Description
[Description]

## Steps to Reproduce
1. 

## Expected Behavior
[Expected]

## Actual Behavior
[Actual]
EOF
```

---

## Mistake 7: Not Assigning Issues

**Problem:** No one is responsible.

**Fix:**
```bash
# Assign single user
gh issue edit 42 --add-assignee @username

# Assign multiple users
gh issue edit 42 --add-assignee @user1 --add-assignee @user2
```

**Best Practice:** Each issue should have an assignee.

---

## Mistake 8: Closing Issues Without PR Reference

**Problem:** Can't track what was fixed.

**Right way:**
- PR description: "Closes #42" or "Fixes #42"
- Issue automatically closes when PR merges
- Reference in commit message: "Fix #42"

---

## Mistake 9: Overcomplicating Labels

**Wrong:**
```bash
# Creating too many labels
gh label create "bug-urgent-critical-immediate"
gh label create "feature-ui-nice-to-have"
```

**Right:**
```bash
# Simple label scheme
gh label create "bug" --color "FF0000"
gh label create "enhancement" --color "00FF00"
gh label create "priority-high" --color "FFA500"
gh label create "priority-low" --color "00FF00"
```

---

## Mistake 10: Not Using Draft PRs

**Problem:** PRs marked ready before review complete.

**Solution:**
```bash
# Create draft PR
gh pr create --draft --title "WIP: Feature"

# Or mark as ready later
# GitHub web: Click "Ready for review"
```

**Benefits:**
- Prevents premature review
- Shows work in progress
- Clear status

---

## Lesson Learned

> "Good issue management is the foundation of successful projects."

**Golden Rules:**
1. Clear, descriptive titles
2. Complete templates
3. Proper labels
4. Assign owners
5. Use milestones
6. Visual project boards
7. Link PRs to issues