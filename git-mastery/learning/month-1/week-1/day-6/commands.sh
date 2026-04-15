#!/bin/bash

# ==============================================================================
# Day 6: Viewing History & Differences - Practice Commands
# ==============================================================================

echo "======================================"
echo "Git Mastery - Day 6 Commands"
echo "Viewing History & Differences"
echo "======================================"
echo ""

# ------------------------------------------------------------------------------
# SECTION 1: Setup
# ------------------------------------------------------------------------------

echo "=== SECTION 1: Setup Repository ==="
echo ""

mkdir -p ~/git-history-practice
cd ~/git-history-practice
git init

# Create initial commit
echo "Line 1" > file.txt
git add file.txt
git commit -m "Initial commit"

# Add second commit
echo "Line 2" >> file.txt
git commit -am "Add line 2"

# Add third commit
echo "Line 3" >> file.txt
git commit -am "Add line 3"

# Add fourth commit
echo "Line 4" >> file.txt
git commit -am "Add line 4"

echo "Created repository with 4 commits."
echo ""

# ------------------------------------------------------------------------------
# SECTION 2: git log Basics
# ------------------------------------------------------------------------------

echo "=== SECTION 2: git log Basics ==="
echo ""

echo "Full log:"
git log
echo ""

echo "One-line log:"
git log --oneline
echo ""

echo "Oneline with graph:"
git log --oneline --graph
echo ""

# ------------------------------------------------------------------------------
# SECTION 3: git log Formatting
# ------------------------------------------------------------------------------

echo "=== SECTION 3: git log Formatting ==="
echo ""

echo "Custom format (short hash + message):"
git log --pretty=format:"%h %s"
echo ""

echo "With author and relative date:"
git log --pretty=format:"%h - %an, %ar : %s"
echo ""

echo "With colors (if terminal supports):"
git log --pretty=format:"%Cred%h%Creset %s"
echo ""

# ------------------------------------------------------------------------------
# SECTION 4: git log Filtering
# ------------------------------------------------------------------------------

echo "=== SECTION 4: git log Filtering ==="
echo ""

echo "Last 2 commits:"
git log -2 --oneline
echo ""

echo "Commits affecting file.txt:"
git log --oneline -- file.txt
echo ""

echo "Recent commits since yesterday:"
git log --oneline --since="1 day ago"
echo ""

# ------------------------------------------------------------------------------
# SECTION 5: git diff Basics
# ------------------------------------------------------------------------------

echo "=== SECTION 5: git diff Basics ==="
echo ""

# Make some unstaged changes
echo "Unstaged change line" >> file.txt
echo ""

echo "Unstaged changes (git diff):"
git diff
echo ""

# Stage the change
git add file.txt
echo ""

echo "Staged changes (git diff --staged):"
git diff --staged
echo ""

# Commit
git commit -m "Add unstaged change line"

# ------------------------------------------------------------------------------
# SECTION 6: git diff Comparisons
# ------------------------------------------------------------------------------

echo "=== SECTION 6: Comparing with git diff ==="
echo ""

# Make new changes
echo "New line A" >> file.txt
echo "New line B" >> file.txt
echo ""

echo "Compare working dir to HEAD:"
git diff HEAD
echo ""

echo "Show diff stat:"
git diff --stat HEAD
echo ""

# ------------------------------------------------------------------------------
# SECTION 7: git diff Between Commits
# ------------------------------------------------------------------------------

echo "=== SECTION 7: Compare Commits ==="
echo ""

echo "All commits:"
git log --oneline
echo ""

# Get commit hashes
COMMIT1=$(git log --oneline | tail -1 | awk '{print $1}')
COMMIT2=$(git log --oneline | head -2 | tail -1 | awk '{print $1}')
echo "Comparing $COMMIT1 to $COMMIT2"
echo ""

echo "Diff between commits:"
git diff $COMMIT1 $COMMIT2 -- file.txt
echo ""

# ------------------------------------------------------------------------------
# SECTION 8: git show
# ------------------------------------------------------------------------------

echo "=== SECTION 8: git show ==="
echo ""

echo "Latest commit details:"
git show HEAD
echo ""

echo "Latest commit with stat:"
git show --stat HEAD
echo ""

echo "Show specific commit:"
git show --oneline HEAD~2
echo ""

echo "Show file at specific commit:"
git show HEAD~2:file.txt
echo ""

# ------------------------------------------------------------------------------
# SECTION 9: git blame
# ------------------------------------------------------------------------------

echo "=== SECTION 9: git blame ==="
echo ""

echo "Blame file.txt (who changed each line):"
git blame file.txt
echo ""

# ------------------------------------------------------------------------------
# SECTION 10: git shortlog
# ------------------------------------------------------------------------------

echo "=== SECTION 10: git shortlog ==="
echo ""

echo "Commits grouped by author:"
git shortlog
echo ""

echo "Shortlog with numbers:"
git shortlog -sn
echo ""

# ------------------------------------------------------------------------------
# SECTION 11: Search in History
# ------------------------------------------------------------------------------

echo "=== SECTION 11: Search in History ==="
echo ""

echo "Find commits mentioning 'line':"
git log --oneline --grep="line"
echo ""

echo "Find commits that added/removed 'Line 4':"
git log -p -S "Line 4" -- file.txt | head -20
echo ""

# ------------------------------------------------------------------------------
# Summary
# ------------------------------------------------------------------------------

echo "======================================"
echo "Practice Complete!"
echo "======================================"
echo ""
echo "You've practiced:"
echo "  ✓ git log (basic, --oneline, --graph)"
echo "  ✓ git log --pretty=format"
echo "  ✓ git log filtering (-n, --since, --author)"
echo "  ✓ git diff (unstaged, --staged, HEAD)"
echo "  ✓ git diff --stat"
echo "  ✓ git show (commits, files)"
echo "  ✓ git blame"
echo "  ✓ git shortlog"
echo "  ✓ git log -S (search)"
echo ""
echo "Next: Day 7 - Week 1 Review & Practice"
