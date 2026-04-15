#!/bin/bash

# Day 31: Code Reviews - Practice Commands

echo "╔═══════════════════════════════════════════════════════════════════════╗"
echo "║                   Day 31: Code Reviews - Commands                     ║"
echo "╚═══════════════════════════════════════════════════════════════════════╝"
echo ""

# ============================================
# SECTION 1: Getting PRs for Review
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 1: Getting PRs for Review"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "List PRs needing your review"
echo "----------------------------------------"
cat << 'EOF'
# PRs assigned to you
gh pr list --reviewer @me

# Open PRs in your repos
gh pr list --repo owner/repo

# All open PRs
gh pr list --state open
EOF
echo ""

echo "Checkout PR locally for review"
echo "----------------------------------------"
cat << 'EOF'
# Method 1: Using PR number
gh pr checkout 123

# Method 2: Using branch name
git checkout feature-branch

# Method 3: Fetch specific PR
git fetch origin pull/123/head:pr-123
git checkout pr-123
EOF
echo ""

# ============================================
# SECTION 2: Reviewing Code
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 2: Reviewing Code"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "View PR changes"
echo "----------------------------------------"
cat << 'EOF'
# View diff in terminal
gh pr diff 123

# View in pager
gh pr diff 123 | less

# View specific file
gh pr diff 123 --path src/app.js

# Show stats
gh pr diff 123 --stat
EOF
echo ""

echo "Review code locally"
echo "----------------------------------------"
cat << 'EOF'
# View commit history
git log main..HEAD --oneline

# View all changes
git diff main...HEAD

# View specific file
git diff main...HEAD -- path/to/file.js

# Compare with base branch
git fetch origin
git merge-base main HEAD
EOF
echo ""

# ============================================
# SECTION 3: Leaving Reviews
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 3: Leaving Reviews"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "Leave an approval"
echo "----------------------------------------"
cat << 'EOF'
gh pr review 123 --approve --body "LGTM! Great work on this.

Key observations:
- Clean implementation
- Good test coverage
- Clear documentation"
EOF
echo ""

echo "Request changes"
echo "----------------------------------------"
cat << 'EOF'
gh pr review 123 --request-changes --body "Please address these issues:

1. SECURITY: Line 42 - SQL injection vulnerability
   User input is directly concatenated. Use parameterized queries.

2. ERROR HANDLING: Line 78 - Missing error handling
   The function doesn't handle network failures.

3. TESTS: Missing test cases for edge cases."
EOF
echo ""

echo "Leave a comment only"
echo "----------------------------------------"
cat << 'EOF'
gh pr review 123 --comment --body "💡 Consider using Array.reduce() here
   instead of a for loop. It's more functional and concise.

   Not blocking, just a suggestion!"
EOF
echo ""

# ============================================
# SECTION 4: GitHub Web Review
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 4: GitHub Web Review Interface"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "How to use GitHub's Review UI"
echo "----------------------------------------"
echo "1. Go to PR page on GitHub"
echo "2. Click 'Files changed' tab"
echo "3. Hover over a line number"
echo "4. Click the blue '+' button"
echo "5. Add your comment"
echo "6. Click 'Add single comment' or 'Start a review'"
echo ""
echo "Review types:"
echo "- Single comment: Quick feedback"
echo "- Start a review: Add multiple comments, submit all at once"
echo ""

# ============================================
# SECTION 5: Writing Good Comments
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 5: Writing Good Comments"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "Example: Blocking comment"
echo "----------------------------------------"
cat << 'EOF'
🔴 BLOCKING: Security vulnerability

This code is vulnerable to SQL injection:

    query = "SELECT * FROM users WHERE id = " + userId;

The userId should be parameterized:

    query = "SELECT * FROM users WHERE id = ?";
    db.execute(query, [userId]);

Fix before this can be merged.
EOF
echo ""

echo "Example: Suggestion comment"
echo "----------------------------------------"
cat << 'EOF'
💡 SUGGESTION: Consider this alternative

Current code:
    for (let i = 0; i < items.length; i++) {
        process(items[i]);
    }

Could be simplified to:
    items.forEach(process);

Not blocking, but more functional style.
EOF
echo ""

echo "Example: Question comment"
echo "----------------------------------------"
cat << 'EOF'
❓ QUESTION: Intent unclear

Why do we need this timeout here? Is this handling a specific 
edge case with the API?

I'm asking because if this isn't necessary, we could simplify 
the code. Happy to discuss!
EOF
echo ""

echo "Example: Praise comment"
echo "----------------------------------------"
cat << 'EOF'
✅ NICE WORK: Great solution!

The caching strategy here is well thought out. Using a 
least-recently-used approach with a max size is exactly 
what this situation needs. 

Also, love the clear variable naming in this function!
EOF
echo ""

# ============================================
# PRACTICE WORKFLOW
# ============================================
echo ""
echo "╔═══════════════════════════════════════════════════════════════════════╗"
echo "║                    COMPLETE REVIEW WORKFLOW                          ║"
echo "╚═══════════════════════════════════════════════════════════════════════╝"
echo ""

cat << 'EOF'
# 1. Find PRs to review
gh pr list --reviewer @me

# 2. Checkout the PR
gh pr checkout 123

# 3. Review the code
git log main..HEAD --oneline    # See commits
git diff main...HEAD            # See all changes

# 4. Run tests
npm test

# 5. Test manually if needed
npm start
# ... test the feature ...

# 6. Leave review
gh pr review 123 --approve --body "LGTM!"

# Or if changes needed:
gh pr review 123 --request-changes --body "Please fix X"

# 7. Clean up
git checkout main
EOF
echo ""

echo "╔═══════════════════════════════════════════════════════════════════════╗"
echo "║                           COMPLETE!                                  ║"
echo "╚═══════════════════════════════════════════════════════════════════════╝"
