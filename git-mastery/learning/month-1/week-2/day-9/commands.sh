#!/bin/bash

# Day 9: Creating & Switching Branches - Practice Commands

echo "=== Day 9: Branch Creation & Switching ==="

cd ~
rm -rf switch-practice 2>/dev/null
mkdir switch-practice && cd switch-practice
git init

echo "# Project" > README.md
git add . && git commit -m "Initial commit"

echo ""
echo "--- Create and list branches ---"
git branch feature-a
git branch bugfix-b
git branch experimental
git branch

echo ""
echo "--- Switch to feature-a ---"
git switch feature-a
echo "On branch: $(git branch --show-current)"

echo ""
echo "--- Make a commit on feature-a ---"
echo "Feature A work" > feature-a.txt
git add . && git commit -m "Add feature A"

echo ""
echo "--- Switch back to main ---"
git switch main
echo "On branch: $(git branch --show-current)"

echo ""
echo "--- Create and switch in one command ---"
git switch -c new-feature
echo "On branch: $(git branch --show-current)"

echo ""
echo "--- Switch to previous branch ---"
git switch -
echo "On branch: $(git branch --show-current)"

echo ""
echo "--- Final state ---"
git log --oneline --graph --all --decorate

echo ""
echo "=== Practice Complete ==="
