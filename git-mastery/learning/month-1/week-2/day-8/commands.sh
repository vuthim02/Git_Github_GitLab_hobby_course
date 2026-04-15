#!/bin/bash

# Day 8: Introduction to Branching - Practice Commands

echo "=== Day 8: Branching Fundamentals ==="

# Setup: Create a practice repository
cd ~
rm -rf branch-practice 2>/dev/null
mkdir branch-practice && cd branch-practice
git init

# Create initial commit
echo "# My Project" > README.md
git add README.md
git commit -m "Initial commit: Add README"

echo ""
echo "--- Command 1: List branches ---"
git branch

echo ""
echo "--- Command 2: List branches with more info ---"
git branch -v

echo ""
echo "--- Command 3: Create a new branch (without switching) ---"
git branch feature-login
git branch

echo ""
echo "--- Command 4: List all branches (local and remote) ---"
git branch -a

echo ""
echo "--- Command 5: Visualize branch history ---"
git log --oneline --graph --all --decorate

echo ""
echo "--- Command 6: See current branch in log ---"
echo "Currently on: $(git branch --show-current)"

echo ""
echo "=== Practice Complete ==="
echo "Run 'git branch -v' to see all branches"
echo "Current branch is marked with *"
