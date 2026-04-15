#!/bin/bash

echo "=== Day 11: Merging Basics ==="

# --- Fast Forward Merge ---
cd ~
rm -rf merge-practice 2>/dev/null
mkdir merge-practice && cd merge-practice
git init

echo "Initial" > file.txt
git add . && git commit -m "Initial commit"

echo ""
echo "--- Creating feature branch ---"
git branch feature

echo ""
echo "--- Making commits on feature ---"
git switch feature
echo "Feature work" > feature.txt
git add . && git commit -m "Add feature"

echo ""
echo "--- Before merge ---"
git log --oneline --graph --all

echo ""
echo "--- Fast-forward merge ---"
git switch main
git merge feature

echo ""
echo "--- After merge ---"
git log --oneline --graph --all

# --- Three-Way Merge ---
cd ~
rm -rf three-way-merge 2>/dev/null
mkdir three-way-merge && cd three-way-merge
git init

echo "Main 1" > main.txt
git add . && git commit -m "Main commit 1"

echo "Main 2" >> main.txt
git add . && git commit -m "Main commit 2"

git branch feature
echo "Feature work" > feature.txt
git switch feature
git add . && git commit -m "Feature commit"

echo ""
echo "--- Before three-way merge ---"
git log --oneline --graph --all

echo ""
echo "--- Three-way merge ---"
git switch main
git merge feature --no-ff -m "Merge feature branch"

echo ""
echo "--- After three-way merge ---"
git log --oneline --graph --all

echo ""
echo "=== Practice Complete ==="
