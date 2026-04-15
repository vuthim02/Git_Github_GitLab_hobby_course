# Day 30: Pull Requests Deep Dive

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          GIT MASTERY - DAY 30                                 ║
║                        PULL REQUESTS DEEP DIVE                                 ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

## Today's Objectives

- [ ] Understand what Pull Requests are
- [ ] Create effective Pull Requests
- [ ] Write good PR descriptions
- [ ] Use PR templates
- [ ] Understand PR review process
- [ ] Master merge strategies

---

## Video Reference

**Video**: [Git & GitHub Tutorial](https://youtu.be/RGOj5yH7evk)  
**Section**: Pull Requests  
**Timestamps**: 90:00 - 120:00

---

## Theory: Understanding Pull Requests

### What is a Pull Request?

A Pull Request (PR) is a **proposal to merge changes** from one branch into another. It's the core of collaborative development on GitHub.

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                           PULL REQUEST FLOW                                  │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│   YOUR FORK                          ORIGINAL REPOSITORY                     │
│   ┌────────────────┐               ┌────────────────┐                      │
│   │                │               │                │                      │
│   │ feature-branch │ ── PR ───────►│   main         │                      │
│   │   (your work)  │   Request    │ (target)       │                      │
│   │                │   to merge   │                │                      │
│   └────────────────┘               └────────────────┘                      │
│                                                                             │
│   PR opens discussion:                                                       │
│   - Code review                                                              │
│   - Comments                                                                 │
│   - Changes requested                                                        │
│   - Approved?                                                               │
│   - Merged!                                                                 │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Why Pull Requests?

1. **Code Review**: Team members review before changes are merged
2. **Discussion**: Comment on specific lines of code
3. **Documentation**: Track why changes were made
4. **History**: Complete record of changes and discussions
5. **Quality Control**: Automated checks can run on PRs

### PR vs Merge Request

| GitHub | GitLab | Atlassian |
|--------|--------|-----------|
| **Pull Request** | **Merge Request** | **Pull Request** |
| Same concept, different name | Same concept | Same concept |

---

## Creating a Pull Request

### Method 1: GitHub Web Interface

1. Push your branch to GitHub
2. Click **"Compare & pull request"** button
3. Fill in PR details
4. Submit PR

### Method 2: GitHub CLI

```bash
# Push branch first
git push -u origin feature-branch

# Create PR
gh pr create --title "Add login feature" --body "Description"

# With more options
gh pr create \
  --title "Add user authentication" \
  --body "This PR adds:" \
  --reviewer username1,username2 \
  --label "feature" \
  --milestone "v1.0"
```

### Method 3: Draft Pull Requests

For work-in-progress:

```bash
# Create as draft
gh pr create --draft --title "WIP: Login feature"

# Convert to ready (on GitHub web)
# Click "Ready for review"
```

---

## Writing Effective PR Descriptions

### PR Template

```markdown
## Summary
Brief description of what this PR does.

## Changes Made
- Feature 1: Added user login
- Feature 2: Added password reset
- Bug fix: Fixed session timeout

## Type of Change
- [ ] Bug fix (non-breaking change)
- [ ] New feature (non-breaking change)
- [ ] Breaking change
- [ ] Documentation update

## Testing
How was this tested?
- [ ] Unit tests added/updated
- [ ] Manual testing performed
- [ ] No tests needed

## Screenshots (if applicable)
Before: ...
After: ...

## Checklist
- [ ] Code follows project style guidelines
- [ ] Self-reviewed code
- [ ] Comments added for complex code
- [ ] Documentation updated
```

### Creating a PR Template

```bash
# Create .github/pull_request_template.md
mkdir -p .github
cat > .github/pull_request_template.md << 'EOF'
## What does this PR do?

## Related issues

## How to test

## Checklist
- [ ] Code compiles
- [ ] Tests pass
- [ ] Documentation updated
EOF
```

---

## PR Review Process

### Roles in Code Review

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                           CODE REVIEW ROLES                                 │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│   AUTHOR                                                                  │
│   ├─ Creates PR                                                             │
│   ├─ Responds to feedback                                                   │
│   └─ Makes requested changes                                                │
│                                                                             │
│   REVIEWER                                                                 │
│   ├─ Reviews code                                                           │
│   ├─ Leaves comments                                                        │
│   ├─ Approves or requests changes                                           │
│   └─ Can suggest alternatives                                               │
│                                                                             │
│   MAINTAINER                                                                │
│   ├─ Has merge permissions                                                  │
│   ├─ Makes final decision                                                   │
│   └─ Merges the PR                                                          │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Review States

| State | Meaning |
|-------|---------|
| 🟡 Draft | Work in progress, not ready for review |
| ⬜ Open | Ready for review |
| 🔴 Changes Requested | Reviewer wants modifications |
| 🟢 Approved | Reviewer approved the PR |
| ✅ Merged | Changes merged into target |
| ❌ Closed | PR closed without merging |

### How to Review Code

```bash
# View PR locally
gh pr checkout 123

# Or using remote URL
git fetch origin pull/123/head:pr-123
git checkout pr-123
```

### Giving Good Feedback

**Do:**
- Be specific about what needs to change
- Explain why (not just what)
- Suggest alternatives
- Acknowledge good work
- Keep it professional

**Don't:**
- Be harsh or personal
- Focus on style (use linters)
- Block for minor issues
- Be vague ("this doesn't look right")

---

## Merge Strategies

### Strategy 1: Create Merge Commit

**Default behavior** - preserves all commits

```
          A---B---C topic
         /         \
D---E---F---G---H---I main

After merge:
          A---B---C topic
         /         \
D---E---F---G---H---I---J main
                        └─ merge commit
```

```bash
# GitHub: Click "Merge pull request"
# This creates a merge commit
```

### Strategy 2: Squash and Merge

**Combines all commits into one**

```
Before squash:
A---B---C topic
    │
    └─ 3 commits

After squash:
A'---B' main
       └─ 1 commit (all changes combined)
```

```bash
# GitHub CLI
gh pr merge --squash

# Git command (locally)
git checkout main
git merge --squash topic
git commit -m "PR #123: Add feature"
```

**When to use:**
- Feature branches with many small commits
- Clean project history
- Working in teams

### Strategy 3: Rebase and Merge

**Replays commits on target branch**

```
Before rebase:
A---B---C topic
    │
    └─ main has new commits

After rebase:
        A'---B'---C' topic (rebased)
        │
        └─ main

On GitHub: Click "Rebase and merge"
```

**When to use:**
- Clean, linear history
- Individual commits are meaningful
- Maintaining commit history

### Choosing a Strategy

| Strategy | Pros | Cons | Best For |
|----------|------|------|----------|
| Merge commit | Full history | Messy graph | Team collaboration |
| Squash | Clean history | Loses commits | Feature branches |
| Rebase | Clean + history | Rewrites history | Shared branches |

---

## Managing Pull Requests

### Update PR with Latest Changes

```bash
# Fetch and merge
git fetch origin
git checkout feature-branch
git merge origin/main
git push

# Or rebase (cleaner)
git fetch origin
git rebase origin/main
git push --force-with-lease
```

### Close PR Without Merging

```bash
gh pr close 123
```

### Sync Fork PR with Upstream

```bash
# Fetch upstream changes
git fetch upstream

# Update your PR branch
git checkout feature-branch
git rebase upstream/main

# Push updated branch
git push --force-with-lease
```

---

## Practice Exercises

### Exercise 1: Create Your First PR (15 min)

1. Create a repository
2. Make changes on a feature branch
3. Push and create PR
4. Add description
5. Review the PR on GitHub

```bash
gh repo create pr-practice --public --clone
cd pr-practice
git checkout -b add-license
echo "MIT License" > LICENSE
git add . && git commit -m "Add MIT license"
git push -u origin add-license
gh pr create --title "Add MIT license" --body "This PR adds the MIT license."
```

### Exercise 2: Review a PR Locally (20 min)

```bash
# Find a PR number
gh pr list

# Checkout PR to local branch
gh pr checkout 123

# Review the code
git log --oneline
git diff main...HEAD

# Add review comments
gh pr review 123 --comment --body "Great work on this!"
```

### Exercise 3: Squash Commits (25 min)

1. Create branch with multiple commits
2. Squash them into one
3. Push and create PR

```bash
git checkout -b feature
echo "Change 1" > file1.txt && git add . && git commit -m "Commit 1"
echo "Change 2" > file2.txt && git add . && git commit -m "Commit 2"
echo "Change 3" > file3.txt && git add . && git commit -m "Commit 3"

# Squash on GitHub (using PR interface)
# OR locally:
git rebase -i HEAD~3
# Change "pick" to "squash" for commits 2 and 3
```

---

## Common Mistakes

### Mistake 1: PR Without Description

**Bad:**
```bash
gh pr create --title "Fix"
```

**Good:**
```bash
gh pr create \
  --title "Fix login timeout bug" \
  --body "## Summary
Fixes the login timeout issue when session expires.

## Changes
- Added session refresh logic
- Updated timeout to 30 minutes

## Testing
- Manual testing passed
- Unit tests added"
```

### Mistake 2: Not Syncing Before Creating PR

**Problem:** PR has conflicts with main

**Fix:**
```bash
git fetch origin
git rebase origin/main
# Resolve conflicts
git push --force-with-lease
```

### Mistake 3: Force Pushing to Main

**NEVER DO THIS:**
```bash
git push --force origin main  # BAD!
```

**Only use --force-with-lease on feature branches:**
```bash
git push --force-with-lease origin feature-branch  # OK
```

### Mistake 4: Too Many Commits in PR

**Problem:** Messy commit history

**Solution:** Squash before merging
```bash
# Use GitHub squash merge
# Or locally:
git rebase -i HEAD~n
```

---

## Checklist

- [ ] I understand what a Pull Request is
- [ ] I can create a PR using GitHub web interface
- [ ] I can create a PR using GitHub CLI
- [ ] I can write effective PR descriptions
- [ ] I understand the PR review process
- [ ] I know the three merge strategies
- [ ] I can sync a PR with upstream changes
- [ ] I understand when to use each merge strategy

---

## Commands Reference

```bash
# Create PR
gh pr create --title "Title" --body "Description"
gh pr create --draft --title "WIP"

# List PRs
gh pr list
gh pr list --state all
gh pr list --author @me

# View PR
gh pr view 123
gh pr diff 123

# Checkout PR locally
gh pr checkout 123

# Review PR
gh pr review 123 --approve
gh pr review 123 --request-changes --body "Comments"
gh pr review 123 --comment --body "General comment"

# Merge PR
gh pr merge 123
gh pr merge --squash 123
gh pr merge --admin --auto

# Update PR
git fetch origin
git merge origin/main
git push

# Close PR
gh pr close 123
```

---

## Reading References

- [GitHub: About Pull Requests](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests)
- [GitHub: Creating a Pull Request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request)
- [Atlassian: Pull Request Tutorial](https://www.atlassian.com/git/tutorials/making-a-pull-request)

---

## Tomorrow's Preview

**Day 31: Code Reviews**

Tomorrow you'll learn:
- How to give effective code reviews
- Code review best practices
- Review checklists
- Handling review feedback
- Review as a team

---

## Navigation

← [Day 29: GitHub Repositories](../day-29/lesson.md) | [Dashboard](../../dashboard.md) | [Day 31: Code Reviews](../day-31/lesson.md) →

---

**Estimated Time**: 4 hours (1h learning, 2h practice, 1h review)  
**Your Progress**: Day 30 of 56 (Week 5 - Day 2)  
**Next**: Code Reviews
