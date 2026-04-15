#!/bin/bash

echo "=== Day 24: Cherry-Picking ==="

cd ~
rm -rf cherry-pick-practice 2>/dev/null
mkdir cherry-pick-practice && cd cherry-pick-practice
git init

echo "# Project" > README.md
git add . && git commit -m "Initial commit"

echo ""
echo "--- Create feature branch with commits ---"
git branch feature
git checkout feature
echo "Feature 1" > feature1.txt
git add . && git commit -m "Add feature 1"
COMMIT1=$(git rev-parse HEAD)

echo "Feature 2" > feature2.txt
git add . && git commit -m "Add feature 2"
COMMIT2=$(git rev-parse HEAD)

echo "Feature 3" > feature3.txt
git add . && git commit -m "Add feature 3"

echo ""
echo "--- Show feature branch commits ---"
git log --oneline

echo ""
echo "--- Switch to main and cherry-pick ---"
git checkout main
echo ""
echo "Cherry-picking commit: $COMMIT1"
git cherry-pick $COMMIT1

echo ""
echo "--- After cherry-pick ---"
git log --oneline
ls -la

echo ""
echo "--- Cherry-pick another ---"
echo "Cherry-picking: $COMMIT2"
git cherry-pick $COMMIT2

echo ""
echo "--- Final state ---"
git log --oneline

echo ""
echo "=== Practice Complete ==="
