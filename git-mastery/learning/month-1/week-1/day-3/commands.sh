#!/bin/bash

# ==============================================================================
# Day 3: Creating Your First Repository - Practice Commands
# ==============================================================================

echo "=================================="
echo "Git Mastery - Day 3 Commands"
echo "Creating Your First Repository"
echo "=================================="
echo ""

# ------------------------------------------------------------------------------
# SECTION 1: Basic Git Init
# ------------------------------------------------------------------------------

echo "=== SECTION 1: Basic git init ==="
echo ""

# Create a new directory
echo "Step 1: Create a new directory"
mkdir -p ~/git-practice
cd ~/git-practice
pwd
echo ""

# Initialize Git repository
echo "Step 2: Initialize Git repository"
git init
echo ""

# Check Git version
echo "Step 3: Check Git version"
git --version
echo ""

# ------------------------------------------------------------------------------
# SECTION 2: Exploring .git Directory
# ------------------------------------------------------------------------------

echo "=== SECTION 2: Exploring .git directory ==="
echo ""

# List all files including hidden
echo "Step 4: List all files (including hidden .git)"
ls -la
echo ""

# List .git contents specifically
echo "Step 5: List contents of .git directory"
ls -la .git/
echo ""

# View HEAD file
echo "Step 6: View .git/HEAD file"
cat .git/HEAD
echo ""

# View config file
echo "Step 7: View .git/config file"
cat .git/config
echo ""

# Check objects directory
echo "Step 8: Check .git/objects directory"
ls -la .git/objects/
echo ""

# Check refs directory
echo "Step 9: Check .git/refs directory"
ls -la .git/refs/
echo ""

# ------------------------------------------------------------------------------
# SECTION 3: Git Status
# ------------------------------------------------------------------------------

echo "=== SECTION 3: Git Status ==="
echo ""

# Check initial status
echo "Step 10: Check git status (empty repo)"
git status
echo ""

# Create a file
echo "Step 11: Create a README.md file"
echo "# My First Git Repository" > README.md
echo ""

# Check status after creating file
echo "Step 12: Check git status (with untracked file)"
git status
echo ""

# Create more files
echo "Step 13: Create additional files"
echo "console.log('Hello World');" > app.js
echo "body { margin: 0; }" > style.css
echo ""

# Check status again
echo "Step 14: Check git status (multiple untracked files)"
git status
echo ""

# ------------------------------------------------------------------------------
# SECTION 4: Using Short Status
# ------------------------------------------------------------------------------

echo "=== SECTION 4: Short Status ==="
echo ""

# Use short format
echo "Step 15: Use git status -s (short format)"
git status -s
echo ""

# ------------------------------------------------------------------------------
# SECTION 5: Cleaning Up (Optional)
# ------------------------------------------------------------------------------

echo "=== SECTION 5: Cleanup ==="
echo ""

echo "To remove the practice repository:"
echo "  cd ~"
echo "  rm -rf ~/git-practice"
echo ""

echo "=================================="
echo "Practice Complete!"
echo "=================================="
echo ""
echo "You've practiced:"
echo "  ✓ git init"
echo "  ✓ ls -la .git/"
echo "  ✓ git status"
echo "  ✓ git status -s"
echo ""
echo "Next: Day 4 - The Git Workflow (Staging & Committing)"
