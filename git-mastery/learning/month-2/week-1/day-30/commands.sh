#!/bin/bash

# Day 30: Pull Requests Deep Dive - Practice Commands

echo "╔═══════════════════════════════════════════════════════════════════════╗"
echo "║             Day 30: Pull Requests Deep Dive - Commands                 ║"
echo "╚═══════════════════════════════════════════════════════════════════════╝"
echo ""

# ============================================
# SECTION 1: Creating Pull Requests
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 1: Creating Pull Requests"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "Prerequisite: Push your branch first"
echo "----------------------------------------"
cat << 'EOF'
# Make your changes on a branch
git checkout -b feature-login
echo "// Login feature" > login.js
git add . && git commit -m "Add login feature"
git push -u origin feature-login
EOF
echo ""

echo "Method 1: GitHub Web Interface"
echo "----------------------------------------"
echo "1. Go to your repository on GitHub"
echo "2. Click 'Compare & pull request' button"
echo "3. Fill in title and description"
echo "4. Select reviewers (if applicable)"
echo "5. Add labels and milestone"
echo "6. Click 'Create pull request'"
echo ""

echo "Method 2: GitHub CLI"
echo "----------------------------------------"
cat << 'EOF'
# Basic PR
gh pr create --title "Add login feature" --body "Description here"

# With more options
gh pr create \
  --title "Add user authentication" \
  --body "## Summary
This PR adds user authentication functionality.

## Changes
- Added login form
- Added session management
- Added password reset" \
  --reviewer octocat \
  --label "feature" \
  --milestone "v1.0"

# Draft PR (work in progress)
gh pr create --draft --title "WIP: Login feature"
EOF
echo ""

echo "Method 3: Using URL"
echo "----------------------------------------"
echo "# Push creates a link to create PR"
git push -u origin feature-branch
# Git shows: https://github.com/user/repo/compare/feature-branch
echo ""

# ============================================
# SECTION 2: Listing and Viewing PRs
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 2: Listing and Viewing PRs"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "List all open PRs"
echo "----------------------------------------"
echo "gh pr list"
echo "# Output:"
echo "# ISSUE  TITLE                     BRANCH       STATE"
echo "# 123    Add login feature        feature-login OPEN"
echo ""

echo "List PRs with filters"
echo "----------------------------------------"
cat << 'EOF'
gh pr list --state all           # All PRs (open + closed)
gh pr list --state closed        # Only closed
gh pr list --author @me          # Your PRs
gh pr list --reviewer octocat    # PRs assigned to you
gh pr list --label "bug"         # PRs with label
gh pr list --base main           # PRs targeting main
EOF
echo ""

echo "View specific PR"
echo "----------------------------------------"
cat << 'EOF'
gh pr view 123              # View PR #123
gh pr view 123 --json title,state,body  # JSON output
gh pr view 123 --comments  # Include comments
EOF
echo ""

echo "See PR changes"
echo "----------------------------------------"
cat << 'EOF'
gh pr diff 123              # Show diff in terminal
gh pr checks 123            # Show CI/CD checks
EOF
echo ""

# ============================================
# SECTION 3: Reviewing PRs
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 3: Reviewing PRs"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "Checkout PR locally"
echo "----------------------------------------"
cat << 'EOF'
# Using PR number
gh pr checkout 123

# This creates a branch: pull/123/head
git checkout -b pr-123
EOF
echo ""

echo "Leave a review"
echo "----------------------------------------"
cat << 'EOF'
# Approve PR
gh pr review 123 --approve --body "LGTM! Great work."

# Request changes
gh pr review 123 --request-changes --body "Please fix the typo on line 42."

# Just comment (no approval/request)
gh pr review 123 --comment --body "Nice implementation!"
EOF
echo ""

echo "Review all PRs from command line"
echo "----------------------------------------"
cat << 'EOF'
# List PRs needing your review
gh pr list --reviewer @me

# Review each one
gh pr checkout 123
# Read the code...
gh pr review 123 --approve
EOF
echo ""

# ============================================
# SECTION 4: Merging PRs
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 4: Merging PRs"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "Merge methods on GitHub"
echo "----------------------------------------"
echo "Merge (default):"
echo "  - Creates merge commit"
echo "  - Preserves full history"
echo "  - Best for team collaboration"
echo ""
echo "Squash and merge:"
echo "  - Combines all commits into one"
echo "  - Clean history"
echo "  - Best for feature branches"
echo ""
echo "Rebase and merge:"
echo "  - Replays commits on target"
echo "  - Preserves individual commits"
echo "  - Best for linear history"
echo ""

echo "Merge with GitHub CLI"
echo "----------------------------------------"
cat << 'EOF'
# Regular merge
gh pr merge 123

# Squash merge
gh pr merge --squash 123

# Rebase merge
gh pr merge --rebase 123

# Auto-merge (when all checks pass)
gh pr merge 123 --auto

# Merge with delete branch
gh pr merge 123 --delete-branch
EOF
echo ""

# ============================================
# SECTION 5: Updating PRs
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 5: Updating PRs"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "Sync PR with latest main"
echo "----------------------------------------"
cat << 'EOF'
# Method 1: Rebase (preferred)
git fetch origin
git checkout feature-branch
git rebase origin/main
git push --force-with-lease

# Method 2: Merge
git fetch origin
git checkout feature-branch
git merge origin/main
git push
EOF
echo ""

echo "Close PR without merging"
echo "----------------------------------------"
cat << 'EOF'
gh pr close 123
EOF
echo ""

echo "Reopen closed PR"
echo "----------------------------------------"
cat << 'EOF'
gh pr edit 123 --state open
EOF
echo ""

# ============================================
# SECTION 6: PR Templates
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 6: PR Templates"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "Create .github/PULL_REQUEST_TEMPLATE.md"
echo "----------------------------------------"
cat << 'EOF'
## What does this PR do?

## Related issue
Fixes #(issue number)

## How to test
1. Go to...
2. Click on...
3. See...

## Checklist
- [ ] Code follows style guidelines
- [ ] Self-reviewed
- [ ] Tests added/updated
- [ ] Documentation updated
EOF
echo ""

# ============================================
# PRACTICE WORKFLOW
# ============================================
echo ""
echo "╔═══════════════════════════════════════════════════════════════════════╗"
echo "║                      COMPLETE PR WORKFLOW                             ║"
echo "╚═══════════════════════════════════════════════════════════════════════╝"
echo ""

cat << 'EOF'
# 1. Create feature branch
git checkout -b feature/amazing-feature

# 2. Make changes
echo "Amazing feature" > feature.txt
git add . && git commit -m "Implement amazing feature"

# 3. Push to GitHub
git push -u origin feature/amazing-feature

# 4. Create PR
gh pr create \
  --title "feat: Add amazing feature" \
  --body "## Summary
This PR adds the amazing feature.

## Testing
- [ ] Unit tests pass
- [ ] Manual testing complete"

# 5. Review (on GitHub or CLI)
# ...

# 6. Merge
gh pr merge --squash

# 7. Clean up
git checkout main
git pull
git branch -d feature/amazing-feature
EOF
echo ""

echo "╔═══════════════════════════════════════════════════════════════════════╗"
echo "║                           COMPLETE!                                     ║"
echo "╚═══════════════════════════════════════════════════════════════════════╝"
