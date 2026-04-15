#!/bin/bash

# ==============================================================================
# Day 4: The Git Workflow - Staging & Committing - Practice Commands
# ==============================================================================

echo "======================================"
echo "Git Mastery - Day 4 Commands"
echo "The Git Workflow - Staging & Committing"
echo "======================================"
echo ""

# ------------------------------------------------------------------------------
# SECTION 1: Setup
# ------------------------------------------------------------------------------

echo "=== SECTION 1: Setup New Repository ==="
echo ""

# Create and enter practice directory
mkdir -p ~/workflow-practice
cd ~/workflow-practice
git init
echo ""

echo "Initial status (empty repo):"
git status
echo ""

# ------------------------------------------------------------------------------
# SECTION 2: Creating Files
# ------------------------------------------------------------------------------

echo "=== SECTION 2: Creating Files ==="
echo ""

# Create first file
echo "File A content" > file-a.txt
echo "Created file-a.txt"
echo ""

# Create second file
echo "File B content" > file-b.txt
echo "Created file-b.txt"
echo ""

# Create third file
echo "File C content" > file-c.txt
echo "Created file-c.txt"
echo ""

echo "Status after creating files:"
git status
echo ""

echo "Short status:"
git status -s
echo ""

# ------------------------------------------------------------------------------
# SECTION 3: Staging with git add
# ------------------------------------------------------------------------------

echo "=== SECTION 3: Staging Files ==="
echo ""

# Stage single file
echo "Staging file-a.txt..."
git add file-a.txt
echo ""

echo "Status after staging file-a.txt:"
git status -s
echo ""

# Stage multiple files
echo "Staging file-b.txt and file-c.txt..."
git add file-b.txt file-c.txt
echo ""

echo "Status after staging all files:"
git status -s
echo ""

# Check what's staged
echo "View staged changes:"
git diff --cached
echo ""

# ------------------------------------------------------------------------------
# SECTION 4: Committing with git commit
# ------------------------------------------------------------------------------

echo "=== SECTION 4: Committing ==="
echo ""

# First commit
echo "Making first commit..."
git commit -m "Add initial files: a, b, c"
echo ""

echo "Status after first commit:"
git status
echo ""

echo "Log after first commit:"
git log --oneline
echo ""

# ------------------------------------------------------------------------------
# SECTION 5: Making Changes
# ------------------------------------------------------------------------------

echo "=== SECTION 5: Making Changes ==="
echo ""

# Modify file-a
echo "Updated content for A" > file-a.txt
echo "Modified file-a.txt"
echo ""

echo "Status after modification:"
git status -s
echo ""

# Show unstaged changes
echo "Unstaged changes in file-a.txt:"
git diff file-a.txt
echo ""

# Stage and commit
echo "Staging file-a.txt..."
git add file-a.txt
echo ""

echo "Committing the update..."
git commit -m "Update file-a.txt with new content"
echo ""

echo "Log after second commit:"
git log --oneline
echo ""

# ------------------------------------------------------------------------------
# SECTION 6: Viewing History
# ------------------------------------------------------------------------------

echo "=== SECTION 6: Viewing History ==="
echo ""

echo "Full log:"
git log
echo ""

echo "One-line log:"
git log --oneline
echo ""

echo "Log with graph:"
git log --oneline --graph
echo ""

echo "Log with stats:"
git log --stat
echo ""

# ------------------------------------------------------------------------------
# SECTION 7: Testing git commit -am
# ------------------------------------------------------------------------------

echo "=== SECTION 7: Testing git commit -am ==="
echo ""

# Modify file-b (already tracked)
echo "Quick fix for file B" >> file-b.txt
echo "Appended to file-b.txt"
echo ""

echo "Status:"
git status -s
echo ""

# Use -am (add + commit for tracked files)
echo "Using git commit -am..."
git commit -am "Quick update to file-b"
echo ""

echo "Final log:"
git log --oneline
echo ""

# ------------------------------------------------------------------------------
# SECTION 8: View Complete Workflow
# ------------------------------------------------------------------------------

echo "=== SECTION 8: Complete Workflow Summary ==="
echo ""

echo "Current status:"
git status
echo ""

echo "All commits:"
git log --oneline --graph --all
echo ""

# Show commit details
echo "Latest commit details:"
git show HEAD --stat
echo ""

# ------------------------------------------------------------------------------
# Summary
# ------------------------------------------------------------------------------

echo "======================================"
echo "Practice Complete!"
echo "======================================"
echo ""
echo "You've practiced:"
echo "  ✓ git add (single file, multiple files)"
echo "  ✓ git commit (-m, -am)"
echo "  ✓ git status and git status -s"
echo "  ✓ git diff and git diff --cached"
echo "  ✓ git log (various formats)"
echo "  ✓ git show"
echo ""
echo "Key concepts learned:"
echo "  - Working directory (untracked/modified)"
echo "  - Staging area (staged)"
echo "  - Repository (committed)"
echo ""
echo "Next: Day 5 - Understanding Git Internals"
