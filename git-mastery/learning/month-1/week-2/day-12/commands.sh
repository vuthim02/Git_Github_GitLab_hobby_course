#!/bin/bash

echo "=== Day 12: Resolving Merge Conflicts ==="

cd ~
rm -rf conflict-practice 2>/dev/null
mkdir conflict-practice && cd conflict-practice
git init

echo "Line 1" > file.txt
git add . && git commit -m "Initial commit"

git branch feature

echo "Changed on main" > file.txt
git add . && git commit -m "Change on main"

git checkout feature
echo "Changed on feature" > file.txt
git add . && git commit -m "Change on feature"

echo ""
echo "--- Attempting merge (will conflict) ---"
git checkout main
git merge feature

echo ""
echo "--- Conflict markers in file ---"
cat file.txt

echo ""
echo "--- Status shows conflict ---"
git status

echo ""
echo "--- Resolving: keep main version ---"
echo "Changed on main" > file.txt
git add file.txt

echo ""
echo "--- Complete merge ---"
git commit -m "Resolve conflict, keep main version"

echo ""
echo "--- Final state ---"
git log --oneline --graph --all

echo ""
echo "=== Practice Complete ==="
echo "Remember: Edit file, git add, git commit"
